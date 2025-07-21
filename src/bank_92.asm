
org $928000


;;; $8000: Set Samus tiles definitions for current animation ;;;
Set_SamusTilesDefinitions_ForCurrentAnimation:
; $D94E is a table of pointers to animation definition lists
; The table is indexed by Samus pose, the animation definition list is indexed by Samus animation frame
; Animation definitions are 4 bytes
; First byte indexes the top half tiles definitions pointer table ($D91E) for a pointer to a list of DMA entries that is indexed by the second byte
; Third byte indexes the bottom half tiles definitions pointer table ($D938) for a pointer to a list of DMA entries that is indexed by the fourth byte
    PHP                                                                  ;928000;
    PHB                                                                  ;928001;
    PHK                                                                  ;928002;
    PLB                                                                  ;928003;
    REP #$30                                                             ;928004;
    LDA.W SamusAnimationFrame                                            ;928006;
    ASL                                                                  ;928009;
    ASL                                                                  ;92800A;
    STA.B DP_Temp12                                                      ;92800B;
    INC                                                                  ;92800D;
    INC                                                                  ;92800E;
    STA.B DP_Temp14                                                      ;92800F;
    LDA.W Pose                                                           ;928011;
    ASL                                                                  ;928014;
    TAX                                                                  ;928015;
    LDA.W SamusTilesAnimation_AnimationDefinitionPointers,X              ;928016;
    CLC                                                                  ;928019;
    ADC.B DP_Temp12                                                      ;92801A;
    TAX                                                                  ;92801C;
    LDA.W $0000,X                                                        ;92801D;
    AND.W #$00FF                                                         ;928020;
    STA.B DP_Temp16                                                      ;928023;
    ASL                                                                  ;928025;
    TAY                                                                  ;928026;
    INX                                                                  ;928027;
    LDA.W $0000,X                                                        ;928028;
    AND.W #$00FF                                                         ;92802B;
    STA.W Temp0B24                                                       ;92802E;
    ASL                                                                  ;928031;
    ASL                                                                  ;928032;
    ASL                                                                  ;928033;
    SEC                                                                  ;928034;
    SBC.W Temp0B24                                                       ;928035;
    STA.B DP_Temp12                                                      ;928038;
    LDA.W SamusTopHalfTilesAnimation_TilesDefinitionPointers,Y           ;92803A;
    CLC                                                                  ;92803D;
    ADC.B DP_Temp12                                                      ;92803E;
    STA.W SamusTiles_TopHalfTilesDef                                     ;928040;
    SEP #$20                                                             ;928043;
    LDA.B #$01                                                           ;928045;
    STA.W SamusTiles_TopHalfFlag                                         ;928047;
    REP #$20                                                             ;92804A;
    LDA.W Pose                                                           ;92804C;
    ASL                                                                  ;92804F;
    TAX                                                                  ;928050;
    LDA.W SamusTilesAnimation_AnimationDefinitionPointers,X              ;928051;
    CLC                                                                  ;928054;
    ADC.B DP_Temp14                                                      ;928055;
    TAX                                                                  ;928057;
    LDA.W $0000,X                                                        ;928058;
    AND.W #$00FF                                                         ;92805B;
    CMP.W #$00FF                                                         ;92805E;
    BEQ .return                                                          ;928061;
    ASL                                                                  ;928063;
    TAY                                                                  ;928064;
    INX                                                                  ;928065;
    LDA.W $0000,X                                                        ;928066;
    AND.W #$00FF                                                         ;928069;
    STA.W Temp0B26                                                       ;92806C;
    ASL                                                                  ;92806F;
    ASL                                                                  ;928070;
    ASL                                                                  ;928071;
    SEC                                                                  ;928072;
    SBC.W Temp0B26                                                       ;928073;
    STA.B DP_Temp14                                                      ;928076;
    LDA.W SamusBottomHalfTilesAnimation_TilesDefinitionPointers,Y        ;928078;
    CLC                                                                  ;92807B;
    ADC.B DP_Temp14                                                      ;92807C;
    STA.W SamusTiles_BottomHalfTilesDef                                  ;92807E;
    SEP #$20                                                             ;928081;
    LDA.B #$01                                                           ;928083;
    STA.W SamusTiles_BottomHalfFlag                                      ;928085;
    REP #$20                                                             ;928088;

  .return:
    PLB                                                                  ;92808A;
    PLP                                                                  ;92808B;
    RTL                                                                  ;92808C;


;;; $808D: Samus spritemap table ;;;
SamusSpritemapTable:
; Indexed by [$92:9263/945D + [Samus pose] * 2] + [Samus animation frame]
    dw UNUSED_Debug_SamusSpritemap_0_9290ED                              ;92808D;
    dw UNUSED_Debug_SamusSpritemap_1_9290F4                              ;92808F;
; 0002. Top half - 00: Facing forward - power suit
    dw SamusSpritemaps_9A6F                                              ;928091;
    dw $0000                                                             ;928093;
    dw SamusSpritemaps_A13A                                              ;928095;
    dw SamusSpritemaps_A12C                                              ;928097;
    dw SamusSpritemaps_A169                                              ;928099;
    dw SamusSpritemaps_A12C                                              ;92809B;
    dw SamusSpritemaps_A18E                                              ;92809D;
    dw SamusSpritemaps_A12C                                              ;92809F;
    dw SamusSpritemaps_A13A                                              ;9280A1;
    dw SamusSpritemaps_A12C                                              ;9280A3;
    dw SamusSpritemaps_A169                                              ;9280A5;
    dw SamusSpritemaps_A12C                                              ;9280A7;
    dw SamusSpritemaps_A18E                                              ;9280A9;
    dw SamusSpritemaps_A12C                                              ;9280AB;
    dw SamusSpritemaps_A13A                                              ;9280AD;
    dw SamusSpritemaps_A12C                                              ;9280AF;
    dw SamusSpritemaps_A169                                              ;9280B1;
    dw SamusSpritemaps_A12C                                              ;9280B3;
    dw SamusSpritemaps_A18E                                              ;9280B5;
    dw SamusSpritemaps_A12C                                              ;9280B7;
    dw SamusSpritemaps_A13A                                              ;9280B9;
    dw SamusSpritemaps_A12C                                              ;9280BB;
    dw SamusSpritemaps_A169                                              ;9280BD;
    dw SamusSpritemaps_A12C                                              ;9280BF;
    dw SamusSpritemaps_A18E                                              ;9280C1;
    dw SamusSpritemaps_A12C                                              ;9280C3;
    dw SamusSpritemaps_A13A                                              ;9280C5;
    dw SamusSpritemaps_A12C                                              ;9280C7;
    dw SamusSpritemaps_A169                                              ;9280C9;
    dw SamusSpritemaps_A12C                                              ;9280CB;
    dw SamusSpritemaps_A18E                                              ;9280CD;
    dw SamusSpritemaps_A12C                                              ;9280CF;
    dw SamusSpritemaps_A13A                                              ;9280D1;
    dw SamusSpritemaps_A12C                                              ;9280D3;
    dw SamusSpritemaps_A169                                              ;9280D5;
    dw SamusSpritemaps_A12C                                              ;9280D7;
    dw SamusSpritemaps_A18E                                              ;9280D9;
    dw SamusSpritemaps_A12C                                              ;9280DB;
    dw SamusSpritemaps_A13A                                              ;9280DD;
    dw SamusSpritemaps_A12C                                              ;9280DF;
    dw SamusSpritemaps_A169                                              ;9280E1;
    dw SamusSpritemaps_A12C                                              ;9280E3;
    dw SamusSpritemaps_A18E                                              ;9280E5;
    dw SamusSpritemaps_A12C                                              ;9280E7;
    dw SamusSpritemaps_A13A                                              ;9280E9;
    dw SamusSpritemaps_A12C                                              ;9280EB;
    dw SamusSpritemaps_A169                                              ;9280ED;
    dw SamusSpritemaps_A12C                                              ;9280EF;
    dw SamusSpritemaps_A18E                                              ;9280F1;
    dw SamusSpritemaps_A12C                                              ;9280F3;
    dw SamusSpritemaps_A13A                                              ;9280F5;
    dw SamusSpritemaps_A12C                                              ;9280F7;
    dw SamusSpritemaps_A169                                              ;9280F9;
    dw SamusSpritemaps_A12C                                              ;9280FB;
    dw SamusSpritemaps_A18E                                              ;9280FD;
    dw SamusSpritemaps_A12C                                              ;9280FF;
    dw SamusSpritemaps_A13A                                              ;928101;
    dw SamusSpritemaps_A12C                                              ;928103;
    dw SamusSpritemaps_A169                                              ;928105;
    dw SamusSpritemaps_A12C                                              ;928107;
    dw SamusSpritemaps_A18E                                              ;928109;
    dw SamusSpritemaps_A12C                                              ;92810B;
    dw SamusSpritemaps_A13A                                              ;92810D;
    dw SamusSpritemaps_A12C                                              ;92810F;
    dw SamusSpritemaps_A169                                              ;928111;
    dw SamusSpritemaps_A12C                                              ;928113;
    dw SamusSpritemaps_A18E                                              ;928115;
    dw SamusSpritemaps_A12C                                              ;928117;
    dw SamusSpritemaps_A13A                                              ;928119;
    dw SamusSpritemaps_A12C                                              ;92811B;
    dw SamusSpritemaps_A169                                              ;92811D;
    dw SamusSpritemaps_A12C                                              ;92811F;
    dw SamusSpritemaps_A18E                                              ;928121;
    dw SamusSpritemaps_A12C                                              ;928123;
    dw SamusSpritemaps_A13A                                              ;928125;
    dw SamusSpritemaps_A12C                                              ;928127;
    dw SamusSpritemaps_A169                                              ;928129;
    dw SamusSpritemaps_A12C                                              ;92812B;
    dw SamusSpritemaps_A18E                                              ;92812D;
    dw SamusSpritemaps_A12C                                              ;92812F;
    dw SamusSpritemaps_A1C7                                              ;928131;
    dw SamusSpritemaps_A12C                                              ;928133;
    dw SamusSpritemaps_A214                                              ;928135;
    dw SamusSpritemaps_A12C                                              ;928137;
    dw SamusSpritemaps_A23E                                              ;928139;
    dw SamusSpritemaps_A12C                                              ;92813B;
    dw SamusSpritemaps_A272                                              ;92813D;
    dw SamusSpritemaps_A12C                                              ;92813F;
    dw SamusSpritemaps_A2AB                                              ;928141;
    dw SamusSpritemaps_A12C                                              ;928143;
    dw SamusSpritemaps_A23E                                              ;928145;
    dw SamusSpritemaps_A12C                                              ;928147;
    dw SamusSpritemaps_A272                                              ;928149;
    dw SamusSpritemaps_A12C                                              ;92814B;
    dw SamusSpritemaps_A2AB                                              ;92814D;
    dw SamusSpritemaps_A12C                                              ;92814F;
; 0062. Bottom half - 00: Facing forward - power suit
    dw SamusSpritemaps_AE44                                              ;928151;
    dw $0000                                                             ;928153;
    dw SamusSpritemaps_B24E                                              ;928155;
    dw SamusSpritemaps_B24E                                              ;928157;
    dw SamusSpritemaps_B24E                                              ;928159;
    dw SamusSpritemaps_B24E                                              ;92815B;
    dw SamusSpritemaps_B24E                                              ;92815D;
    dw SamusSpritemaps_B24E                                              ;92815F;
    dw SamusSpritemaps_B24E                                              ;928161;
    dw SamusSpritemaps_B24E                                              ;928163;
    dw SamusSpritemaps_B24E                                              ;928165;
    dw SamusSpritemaps_B24E                                              ;928167;
    dw SamusSpritemaps_B24E                                              ;928169;
    dw SamusSpritemaps_B24E                                              ;92816B;
    dw SamusSpritemaps_B24E                                              ;92816D;
    dw SamusSpritemaps_B24E                                              ;92816F;
    dw SamusSpritemaps_B24E                                              ;928171;
    dw SamusSpritemaps_B24E                                              ;928173;
    dw SamusSpritemaps_B24E                                              ;928175;
    dw SamusSpritemaps_B24E                                              ;928177;
    dw SamusSpritemaps_B24E                                              ;928179;
    dw SamusSpritemaps_B24E                                              ;92817B;
    dw SamusSpritemaps_B24E                                              ;92817D;
    dw SamusSpritemaps_B24E                                              ;92817F;
    dw SamusSpritemaps_B24E                                              ;928181;
    dw SamusSpritemaps_B24E                                              ;928183;
    dw SamusSpritemaps_B24E                                              ;928185;
    dw SamusSpritemaps_B24E                                              ;928187;
    dw SamusSpritemaps_B24E                                              ;928189;
    dw SamusSpritemaps_B24E                                              ;92818B;
    dw SamusSpritemaps_B24E                                              ;92818D;
    dw SamusSpritemaps_B24E                                              ;92818F;
    dw SamusSpritemaps_B24E                                              ;928191;
    dw SamusSpritemaps_B24E                                              ;928193;
    dw SamusSpritemaps_B24E                                              ;928195;
    dw SamusSpritemaps_B24E                                              ;928197;
    dw SamusSpritemaps_B24E                                              ;928199;
    dw SamusSpritemaps_B24E                                              ;92819B;
    dw SamusSpritemaps_B24E                                              ;92819D;
    dw SamusSpritemaps_B24E                                              ;92819F;
    dw SamusSpritemaps_B24E                                              ;9281A1;
    dw SamusSpritemaps_B24E                                              ;9281A3;
    dw SamusSpritemaps_B24E                                              ;9281A5;
    dw SamusSpritemaps_B24E                                              ;9281A7;
    dw SamusSpritemaps_B24E                                              ;9281A9;
    dw SamusSpritemaps_B24E                                              ;9281AB;
    dw SamusSpritemaps_B24E                                              ;9281AD;
    dw SamusSpritemaps_B24E                                              ;9281AF;
    dw SamusSpritemaps_B24E                                              ;9281B1;
    dw SamusSpritemaps_B24E                                              ;9281B3;
    dw SamusSpritemaps_B24E                                              ;9281B5;
    dw SamusSpritemaps_B24E                                              ;9281B7;
    dw SamusSpritemaps_B24E                                              ;9281B9;
    dw SamusSpritemaps_B24E                                              ;9281BB;
    dw SamusSpritemaps_B24E                                              ;9281BD;
    dw SamusSpritemaps_B24E                                              ;9281BF;
    dw SamusSpritemaps_B24E                                              ;9281C1;
    dw SamusSpritemaps_B24E                                              ;9281C3;
    dw SamusSpritemaps_B24E                                              ;9281C5;
    dw SamusSpritemaps_B24E                                              ;9281C7;
    dw SamusSpritemaps_B24E                                              ;9281C9;
    dw SamusSpritemaps_B24E                                              ;9281CB;
    dw SamusSpritemaps_B24E                                              ;9281CD;
    dw SamusSpritemaps_B24E                                              ;9281CF;
    dw SamusSpritemaps_B24E                                              ;9281D1;
    dw SamusSpritemaps_B24E                                              ;9281D3;
    dw SamusSpritemaps_B24E                                              ;9281D5;
    dw SamusSpritemaps_B24E                                              ;9281D7;
    dw SamusSpritemaps_B24E                                              ;9281D9;
    dw SamusSpritemaps_B24E                                              ;9281DB;
    dw SamusSpritemaps_B24E                                              ;9281DD;
    dw SamusSpritemaps_B24E                                              ;9281DF;
    dw SamusSpritemaps_B24E                                              ;9281E1;
    dw SamusSpritemaps_B24E                                              ;9281E3;
    dw SamusSpritemaps_B24E                                              ;9281E5;
    dw SamusSpritemaps_B24E                                              ;9281E7;
    dw SamusSpritemaps_B24E                                              ;9281E9;
    dw SamusSpritemaps_B24E                                              ;9281EB;
    dw SamusSpritemaps_B24E                                              ;9281ED;
    dw SamusSpritemaps_B24E                                              ;9281EF;
    dw SamusSpritemaps_B24E                                              ;9281F1;
    dw SamusSpritemaps_B24E                                              ;9281F3;
    dw SamusSpritemaps_B24E                                              ;9281F5;
    dw SamusSpritemaps_B24E                                              ;9281F7;
    dw SamusSpritemaps_B24E                                              ;9281F9;
    dw SamusSpritemaps_B24E                                              ;9281FB;
    dw SamusSpritemaps_B24E                                              ;9281FD;
    dw SamusSpritemaps_B24E                                              ;9281FF;
    dw SamusSpritemaps_B24E                                              ;928201;
    dw SamusSpritemaps_B24E                                              ;928203;
    dw SamusSpritemaps_B24E                                              ;928205;
    dw SamusSpritemaps_B24E                                              ;928207;
    dw SamusSpritemaps_B24E                                              ;928209;
    dw SamusSpritemaps_B24E                                              ;92820B;
    dw SamusSpritemaps_B24E                                              ;92820D;
    dw SamusSpritemaps_B24E                                              ;92820F;
; 00C2. Top half - 9B: Facing forward - varia/gravity suit
    dw SamusSpritemaps_9976                                              ;928211;
    dw $0000                                                             ;928213;
    dw SamusSpritemaps_A13A                                              ;928215;
    dw SamusSpritemaps_A12C                                              ;928217;
    dw SamusSpritemaps_A169                                              ;928219;
    dw SamusSpritemaps_A12C                                              ;92821B;
    dw SamusSpritemaps_A18E                                              ;92821D;
    dw SamusSpritemaps_A12C                                              ;92821F;
    dw SamusSpritemaps_A13A                                              ;928221;
    dw SamusSpritemaps_A12C                                              ;928223;
    dw SamusSpritemaps_A169                                              ;928225;
    dw SamusSpritemaps_A12C                                              ;928227;
    dw SamusSpritemaps_A18E                                              ;928229;
    dw SamusSpritemaps_A12C                                              ;92822B;
    dw SamusSpritemaps_A13A                                              ;92822D;
    dw SamusSpritemaps_A12C                                              ;92822F;
    dw SamusSpritemaps_A169                                              ;928231;
    dw SamusSpritemaps_A12C                                              ;928233;
    dw SamusSpritemaps_A18E                                              ;928235;
    dw SamusSpritemaps_A12C                                              ;928237;
    dw SamusSpritemaps_A13A                                              ;928239;
    dw SamusSpritemaps_A12C                                              ;92823B;
    dw SamusSpritemaps_A169                                              ;92823D;
    dw SamusSpritemaps_A12C                                              ;92823F;
    dw SamusSpritemaps_A18E                                              ;928241;
    dw SamusSpritemaps_A12C                                              ;928243;
    dw SamusSpritemaps_A13A                                              ;928245;
    dw SamusSpritemaps_A12C                                              ;928247;
    dw SamusSpritemaps_A169                                              ;928249;
    dw SamusSpritemaps_A12C                                              ;92824B;
    dw SamusSpritemaps_A18E                                              ;92824D;
    dw SamusSpritemaps_A12C                                              ;92824F;
    dw SamusSpritemaps_A13A                                              ;928251;
    dw SamusSpritemaps_A12C                                              ;928253;
    dw SamusSpritemaps_A169                                              ;928255;
    dw SamusSpritemaps_A12C                                              ;928257;
    dw SamusSpritemaps_A18E                                              ;928259;
    dw SamusSpritemaps_A12C                                              ;92825B;
    dw SamusSpritemaps_A13A                                              ;92825D;
    dw SamusSpritemaps_A12C                                              ;92825F;
    dw SamusSpritemaps_A169                                              ;928261;
    dw SamusSpritemaps_A12C                                              ;928263;
    dw SamusSpritemaps_A18E                                              ;928265;
    dw SamusSpritemaps_A12C                                              ;928267;
    dw SamusSpritemaps_A13A                                              ;928269;
    dw SamusSpritemaps_A12C                                              ;92826B;
    dw SamusSpritemaps_A169                                              ;92826D;
    dw SamusSpritemaps_A12C                                              ;92826F;
    dw SamusSpritemaps_A18E                                              ;928271;
    dw SamusSpritemaps_A12C                                              ;928273;
    dw SamusSpritemaps_A13A                                              ;928275;
    dw SamusSpritemaps_A12C                                              ;928277;
    dw SamusSpritemaps_A169                                              ;928279;
    dw SamusSpritemaps_A12C                                              ;92827B;
    dw SamusSpritemaps_A18E                                              ;92827D;
    dw SamusSpritemaps_A12C                                              ;92827F;
    dw SamusSpritemaps_A13A                                              ;928281;
    dw SamusSpritemaps_A12C                                              ;928283;
    dw SamusSpritemaps_A169                                              ;928285;
    dw SamusSpritemaps_A12C                                              ;928287;
    dw SamusSpritemaps_A18E                                              ;928289;
    dw SamusSpritemaps_A12C                                              ;92828B;
    dw SamusSpritemaps_A13A                                              ;92828D;
    dw SamusSpritemaps_A12C                                              ;92828F;
    dw SamusSpritemaps_A169                                              ;928291;
    dw SamusSpritemaps_A12C                                              ;928293;
    dw SamusSpritemaps_A18E                                              ;928295;
    dw SamusSpritemaps_A12C                                              ;928297;
    dw SamusSpritemaps_A13A                                              ;928299;
    dw SamusSpritemaps_A12C                                              ;92829B;
    dw SamusSpritemaps_A169                                              ;92829D;
    dw SamusSpritemaps_A12C                                              ;92829F;
    dw SamusSpritemaps_A18E                                              ;9282A1;
    dw SamusSpritemaps_A12C                                              ;9282A3;
    dw SamusSpritemaps_A13A                                              ;9282A5;
    dw SamusSpritemaps_A12C                                              ;9282A7;
    dw SamusSpritemaps_A169                                              ;9282A9;
    dw SamusSpritemaps_A12C                                              ;9282AB;
    dw SamusSpritemaps_A18E                                              ;9282AD;
    dw SamusSpritemaps_A12C                                              ;9282AF;
    dw SamusSpritemaps_A1C7                                              ;9282B1;
    dw SamusSpritemaps_A12C                                              ;9282B3;
    dw SamusSpritemaps_A214                                              ;9282B5;
    dw SamusSpritemaps_A12C                                              ;9282B7;
    dw SamusSpritemaps_A23E                                              ;9282B9;
    dw SamusSpritemaps_A12C                                              ;9282BB;
    dw SamusSpritemaps_A272                                              ;9282BD;
    dw SamusSpritemaps_A12C                                              ;9282BF;
    dw SamusSpritemaps_A2AB                                              ;9282C1;
    dw SamusSpritemaps_A12C                                              ;9282C3;
    dw SamusSpritemaps_A23E                                              ;9282C5;
    dw SamusSpritemaps_A12C                                              ;9282C7;
    dw SamusSpritemaps_A272                                              ;9282C9;
    dw SamusSpritemaps_A12C                                              ;9282CB;
    dw SamusSpritemaps_A2AB                                              ;9282CD;
    dw SamusSpritemaps_A12C                                              ;9282CF;
; 0122. Bottom half - 9B: Facing forward - varia/gravity suit
    dw SamusSpritemaps_AE6E                                              ;9282D1;
    dw $0000                                                             ;9282D3;
    dw SamusSpritemaps_B26E                                              ;9282D5;
    dw SamusSpritemaps_B26E                                              ;9282D7;
    dw SamusSpritemaps_B26E                                              ;9282D9;
    dw SamusSpritemaps_B26E                                              ;9282DB;
    dw SamusSpritemaps_B26E                                              ;9282DD;
    dw SamusSpritemaps_B26E                                              ;9282DF;
    dw SamusSpritemaps_B26E                                              ;9282E1;
    dw SamusSpritemaps_B26E                                              ;9282E3;
    dw SamusSpritemaps_B26E                                              ;9282E5;
    dw SamusSpritemaps_B26E                                              ;9282E7;
    dw SamusSpritemaps_B26E                                              ;9282E9;
    dw SamusSpritemaps_B26E                                              ;9282EB;
    dw SamusSpritemaps_B26E                                              ;9282ED;
    dw SamusSpritemaps_B26E                                              ;9282EF;
    dw SamusSpritemaps_B26E                                              ;9282F1;
    dw SamusSpritemaps_B26E                                              ;9282F3;
    dw SamusSpritemaps_B26E                                              ;9282F5;
    dw SamusSpritemaps_B26E                                              ;9282F7;
    dw SamusSpritemaps_B26E                                              ;9282F9;
    dw SamusSpritemaps_B26E                                              ;9282FB;
    dw SamusSpritemaps_B26E                                              ;9282FD;
    dw SamusSpritemaps_B26E                                              ;9282FF;
    dw SamusSpritemaps_B26E                                              ;928301;
    dw SamusSpritemaps_B26E                                              ;928303;
    dw SamusSpritemaps_B26E                                              ;928305;
    dw SamusSpritemaps_B26E                                              ;928307;
    dw SamusSpritemaps_B26E                                              ;928309;
    dw SamusSpritemaps_B26E                                              ;92830B;
    dw SamusSpritemaps_B26E                                              ;92830D;
    dw SamusSpritemaps_B26E                                              ;92830F;
    dw SamusSpritemaps_B26E                                              ;928311;
    dw SamusSpritemaps_B26E                                              ;928313;
    dw SamusSpritemaps_B26E                                              ;928315;
    dw SamusSpritemaps_B26E                                              ;928317;
    dw SamusSpritemaps_B26E                                              ;928319;
    dw SamusSpritemaps_B26E                                              ;92831B;
    dw SamusSpritemaps_B26E                                              ;92831D;
    dw SamusSpritemaps_B26E                                              ;92831F;
    dw SamusSpritemaps_B26E                                              ;928321;
    dw SamusSpritemaps_B26E                                              ;928323;
    dw SamusSpritemaps_B26E                                              ;928325;
    dw SamusSpritemaps_B26E                                              ;928327;
    dw SamusSpritemaps_B26E                                              ;928329;
    dw SamusSpritemaps_B26E                                              ;92832B;
    dw SamusSpritemaps_B26E                                              ;92832D;
    dw SamusSpritemaps_B26E                                              ;92832F;
    dw SamusSpritemaps_B26E                                              ;928331;
    dw SamusSpritemaps_B26E                                              ;928333;
    dw SamusSpritemaps_B26E                                              ;928335;
    dw SamusSpritemaps_B26E                                              ;928337;
    dw SamusSpritemaps_B26E                                              ;928339;
    dw SamusSpritemaps_B26E                                              ;92833B;
    dw SamusSpritemaps_B26E                                              ;92833D;
    dw SamusSpritemaps_B26E                                              ;92833F;
    dw SamusSpritemaps_B26E                                              ;928341;
    dw SamusSpritemaps_B26E                                              ;928343;
    dw SamusSpritemaps_B26E                                              ;928345;
    dw SamusSpritemaps_B26E                                              ;928347;
    dw SamusSpritemaps_B26E                                              ;928349;
    dw SamusSpritemaps_B26E                                              ;92834B;
    dw SamusSpritemaps_B26E                                              ;92834D;
    dw SamusSpritemaps_B26E                                              ;92834F;
    dw SamusSpritemaps_B26E                                              ;928351;
    dw SamusSpritemaps_B26E                                              ;928353;
    dw SamusSpritemaps_B26E                                              ;928355;
    dw SamusSpritemaps_B26E                                              ;928357;
    dw SamusSpritemaps_B26E                                              ;928359;
    dw SamusSpritemaps_B26E                                              ;92835B;
    dw SamusSpritemaps_B26E                                              ;92835D;
    dw SamusSpritemaps_B26E                                              ;92835F;
    dw SamusSpritemaps_B26E                                              ;928361;
    dw SamusSpritemaps_B26E                                              ;928363;
    dw SamusSpritemaps_B26E                                              ;928365;
    dw SamusSpritemaps_B26E                                              ;928367;
    dw SamusSpritemaps_B26E                                              ;928369;
    dw SamusSpritemaps_B26E                                              ;92836B;
    dw SamusSpritemaps_B26E                                              ;92836D;
    dw SamusSpritemaps_B26E                                              ;92836F;
    dw SamusSpritemaps_B26E                                              ;928371;
    dw SamusSpritemaps_B26E                                              ;928373;
    dw SamusSpritemaps_B26E                                              ;928375;
    dw SamusSpritemaps_B26E                                              ;928377;
    dw SamusSpritemaps_B26E                                              ;928379;
    dw SamusSpritemaps_B26E                                              ;92837B;
    dw SamusSpritemaps_B26E                                              ;92837D;
    dw SamusSpritemaps_B26E                                              ;92837F;
    dw SamusSpritemaps_B26E                                              ;928381;
    dw SamusSpritemaps_B26E                                              ;928383;
    dw SamusSpritemaps_B26E                                              ;928385;
    dw SamusSpritemaps_B26E                                              ;928387;
    dw SamusSpritemaps_B26E                                              ;928389;
    dw SamusSpritemaps_B26E                                              ;92838B;
    dw SamusSpritemaps_B26E                                              ;92838D;
    dw SamusSpritemaps_B26E                                              ;92838F;
; 0182. Samus tile viewer - Samus top half
    dw SamusTileViewer_SamusTopHalf                                      ;928391;
; 0183. Samus tile viewer - Samus bottom half
    dw SamusTileViewer_SamusBottomHalf                                   ;928393;
; 0184. Samus tile viewer - beam
    dw SamusTileViewer_Beam                                              ;928395;
; 0185. Samus tile viewer - grapple beam
    dw SamusTileViewer_GrappleBeam                                       ;928397;
; 0186. Bubbles
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_0                     ;928399;
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_1                     ;92839B;
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_2                     ;92839D;
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_3                     ;92839F;
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_4                     ;9283A1;
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_5                     ;9283A3;
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_6                     ;9283A5;
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_7                     ;9283A7;
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_8                     ;9283A9;
; 018F. Diving splash
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_0                ;9283AB;
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_1                ;9283AD;
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_2                ;9283AF;
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_3                ;9283B1;
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_4                ;9283B3;
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_5                ;9283B5;
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_6                ;9283B7;
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_7                ;9283B9;
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_8                ;9283BB;
; 0198
    dw SamusSpritemaps_9657                                              ;9283BD;
    dw SamusSpritemaps_9657                                              ;9283BF;
; Top half - 01: Facing right - normal
; Top half - 47: Unused
; Top half - 89: Facing right - ran into a wall
; 019A. Top half - A8: Unused
    dw SamusSpritemaps_A072                                              ;9283C1;
    dw SamusSpritemaps_A088                                              ;9283C3;
    dw SamusSpritemaps_A09E                                              ;9283C5;
    dw SamusSpritemaps_A088                                              ;9283C7;
    dw $0000                                                             ;9283C9;
    dw SamusSpritemaps_A072                                              ;9283CB;
    dw SamusSpritemaps_A088                                              ;9283CD;
    dw SamusSpritemaps_A0F6                                              ;9283CF;
    dw SamusSpritemaps_A088                                              ;9283D1;
; Top half - 02: Facing left-   normal
; Top half - 48: Unused
; Top half - 8A: Facing left-   ran into a wall
; 01A3. Top half - A9: Unused
    dw SamusSpritemaps_A0B4                                              ;9283D3;
    dw SamusSpritemaps_A0CA                                              ;9283D5;
    dw SamusSpritemaps_A0E0                                              ;9283D7;
    dw SamusSpritemaps_A0CA                                              ;9283D9;
    dw $0000                                                             ;9283DB;
    dw SamusSpritemaps_A0B4                                              ;9283DD;
    dw SamusSpritemaps_A0CA                                              ;9283DF;
    dw SamusSpritemaps_A111                                              ;9283E1;
    dw SamusSpritemaps_A0CA                                              ;9283E3;
    dw SamusSpritemaps_9657                                              ;9283E5;
; 01AD. Top half - 03: Facing right - aiming up
    dw SamusSpritemaps_97B1                                              ;9283E7;
    dw SamusSpritemaps_97FF                                              ;9283E9;
; 01AF. Top half - 04: Facing left-   aiming up
    dw SamusSpritemaps_97C7                                              ;9283EB;
    dw SamusSpritemaps_981A                                              ;9283ED;
; Top half - 05: Facing right - aiming up-right
; Top half - 57: Facing right - normal jump transition - aiming up-right
; Top half - CF: Facing right - ran into a wall - aiming up-right
; Top half - E2: Facing right - landing from normal jump - aiming up-right
; Top half - F3: Facing right - crouching transition - aiming up-right
; 01B1. Top half - F9: Facing right - standing transition - aiming up-right
    dw SamusSpritemaps_97B1                                              ;9283EF;
    dw SamusSpritemaps_97B1                                              ;9283F1;
; Top half - 06: Facing left-   aiming up-left
; Top half - 58: Facing left-   normal jump transition - aiming up-left
; Top half - D0: Facing left-   ran into a wall - aiming up-left
; Top half - E3: Facing left-   landing from normal jump - aiming up-left
; Top half - F4: Facing left-   crouching transition - aiming up-left
; 01B3. Top half - FA: Facing left-   standing transition - aiming up-left
    dw SamusSpritemaps_97C7                                              ;9283F3;
    dw SamusSpritemaps_97C7                                              ;9283F5;
; Top half - 07: Facing right - aiming down-right
; Top half - 59: Facing right - normal jump transition - aiming down-right
; Top half - AA: Unused
; Top half - D1: Facing right - ran into a wall - aiming down-right
; Top half - E4: Facing right - landing from normal jump - aiming down-right
; Top half - F5: Facing right - crouching transition - aiming down-right
; 01B5. Top half - FB: Facing right - standing transition - aiming down-right
    dw SamusSpritemaps_9745                                              ;9283F7;
    dw SamusSpritemaps_9745                                              ;9283F9;
; Top half - 08: Facing left-   aiming down-left
; Top half - 5A: Facing left-   normal jump transition - aiming down-left
; Top half - AB: Unused
; Top half - D2: Facing left-   ran into a wall - aiming down-left
; Top half - E5: Facing left-   landing from normal jump - aiming down-left
; Top half - F6: Facing left-   crouching transition - aiming down-left
; 01B7. Top half - FC: Facing left-   standing transition - aiming down-left
    dw SamusSpritemaps_9760                                              ;9283FB;
    dw SamusSpritemaps_9760                                              ;9283FD;
; 01B9. Top half - A4: Facing right - landing from normal jump
    dw SamusSpritemaps_9B6F                                              ;9283FF;
    dw SamusSpritemaps_9BAE                                              ;928401;
; 01BB. Top half - A5: Facing left-   landing from normal jump
    dw SamusSpritemaps_9B80                                              ;928403;
    dw SamusSpritemaps_9BBF                                              ;928405;
; 01BD. Top half - A6: Facing right - landing from spin jump
    dw SamusSpritemaps_9BAE                                              ;928407;
    dw SamusSpritemaps_9B6F                                              ;928409;
    dw SamusSpritemaps_9BAE                                              ;92840B;
; 01C0. Top half - A7: Facing left-   landing from spin jump
    dw SamusSpritemaps_9BBF                                              ;92840D;
    dw SamusSpritemaps_9B80                                              ;92840F;
    dw SamusSpritemaps_9BBF                                              ;928411;
; 01C0. Top half - A7: Facing left-   landing from spin jump
    dw SamusSpritemaps_9C26                                              ;928413;
    dw SamusSpritemaps_9C0B                                              ;928415;
    dw SamusSpritemaps_977B                                              ;928417;
    dw SamusSpritemaps_9C41                                              ;928419;
    dw SamusSpritemaps_9C5C                                              ;92841B;
; 01C0. Top half - A7: Facing left-   landing from spin jump
    dw SamusSpritemaps_9C92                                              ;92841D;
    dw SamusSpritemaps_9C77                                              ;92841F;
    dw SamusSpritemaps_9796                                              ;928421;
    dw SamusSpritemaps_9CAD                                              ;928423;
    dw SamusSpritemaps_9CC8                                              ;928425;
; Top half - 55: Facing right - normal jump transition - aiming up
; Top half - E0: Facing right - landing from normal jump - aiming up
; Top half - F1: Facing right - crouching transition - aiming up
; 01CD. Top half - F7: Facing right - standing transition - aiming up
    dw SamusSpritemaps_97FF                                              ;928427;
    dw SamusSpritemaps_97FF                                              ;928429;
; Top half - 56: Facing left-   normal jump transition - aiming up
; Top half - E1: Facing left-   landing from normal jump - aiming up
; Top half - F2: Facing left-   crouching transition - aiming up
; 01CF. Top half - F8: Facing left-   standing transition - aiming up
    dw SamusSpritemaps_981A                                              ;92842B;
    dw SamusSpritemaps_981A                                              ;92842D;
; 01D1. Top half - E6: Facing right - landing from normal jump - firing
    dw SamusSpritemaps_977B                                              ;92842F;
    dw SamusSpritemaps_977B                                              ;928431;
; 01D3. Top half - E7: Facing left-   landing from normal jump - firing
    dw SamusSpritemaps_9796                                              ;928433;
    dw SamusSpritemaps_9796                                              ;928435;
; 01D5. Top half - 49: Facing left-   moonwalk
    dw SamusSpritemaps_9796                                              ;928437;
    dw SamusSpritemaps_9E48                                              ;928439;
    dw SamusSpritemaps_9E48                                              ;92843B;
    dw SamusSpritemaps_9796                                              ;92843D;
    dw SamusSpritemaps_9E48                                              ;92843F;
    dw SamusSpritemaps_9E48                                              ;928441;
; 01DB. Top half - 4A: Facing right - moonwalk
    dw SamusSpritemaps_977B                                              ;928443;
    dw SamusSpritemaps_9E2D                                              ;928445;
    dw SamusSpritemaps_9E2D                                              ;928447;
    dw SamusSpritemaps_977B                                              ;928449;
    dw SamusSpritemaps_9E2D                                              ;92844B;
    dw SamusSpritemaps_9E2D                                              ;92844D;
; 01E1. Top half - 75: Facing left-   moonwalk - aiming up-left
    dw SamusSpritemaps_9872                                              ;92844F;
    dw SamusSpritemaps_9CFE                                              ;928451;
    dw SamusSpritemaps_9CFE                                              ;928453;
    dw SamusSpritemaps_9872                                              ;928455;
    dw SamusSpritemaps_9CFE                                              ;928457;
    dw SamusSpritemaps_9CFE                                              ;928459;
; 01E7. Top half - 76: Facing right - moonwalk - aiming up-right
    dw SamusSpritemaps_9857                                              ;92845B;
    dw SamusSpritemaps_9CE3                                              ;92845D;
    dw SamusSpritemaps_9CE3                                              ;92845F;
    dw SamusSpritemaps_9857                                              ;928461;
    dw SamusSpritemaps_9CE3                                              ;928463;
    dw SamusSpritemaps_9CE3                                              ;928465;
; 01ED. Top half - 77: Facing left-   moonwalk - aiming down-left
    dw SamusSpritemaps_9725                                              ;928467;
    dw SamusSpritemaps_9BEB                                              ;928469;
    dw SamusSpritemaps_9BEB                                              ;92846B;
    dw SamusSpritemaps_9725                                              ;92846D;
    dw SamusSpritemaps_9BEB                                              ;92846F;
    dw SamusSpritemaps_9BEB                                              ;928471;
; 01F3. Top half - 78: Facing right - moonwalk - aiming down-right
    dw SamusSpritemaps_9705                                              ;928473;
    dw SamusSpritemaps_9BCB                                              ;928475;
    dw SamusSpritemaps_9BCB                                              ;928477;
    dw SamusSpritemaps_9705                                              ;928479;
    dw SamusSpritemaps_9BCB                                              ;92847B;
    dw SamusSpritemaps_9BCB                                              ;92847D;
; 01F9. Top half - 09: Moving right - not aiming
    dw SamusSpritemaps_9657                                              ;92847F;
    dw SamusSpritemaps_9A3F                                              ;928481;
    dw SamusSpritemaps_966F                                              ;928483;
    dw SamusSpritemaps_9680                                              ;928485;
    dw SamusSpritemaps_9663                                              ;928487;
    dw SamusSpritemaps_9657                                              ;928489;
    dw SamusSpritemaps_9A4B                                              ;92848B;
    dw SamusSpritemaps_969D                                              ;92848D;
    dw SamusSpritemaps_9835                                              ;92848F;
    dw SamusSpritemaps_9691                                              ;928491;
; 0203. Top half - 0A: Moving left-   not aiming
    dw SamusSpritemaps_96AE                                              ;928493;
    dw SamusSpritemaps_9A57                                              ;928495;
    dw SamusSpritemaps_96C6                                              ;928497;
    dw SamusSpritemaps_96D7                                              ;928499;
    dw SamusSpritemaps_96BA                                              ;92849B;
    dw SamusSpritemaps_96AE                                              ;92849D;
    dw SamusSpritemaps_9A63                                              ;92849F;
    dw SamusSpritemaps_96F4                                              ;9284A1;
    dw SamusSpritemaps_9846                                              ;9284A3;
    dw SamusSpritemaps_96E8                                              ;9284A5;
; 020D. Top half - 0B: Moving right - gun extended
    dw SamusSpritemaps_A2D0                                              ;9284A7;
    dw SamusSpritemaps_A440                                              ;9284A9;
    dw SamusSpritemaps_A2F2                                              ;9284AB;
    dw SamusSpritemaps_A308                                              ;9284AD;
    dw SamusSpritemaps_A2E1                                              ;9284AF;
    dw SamusSpritemaps_A2D0                                              ;9284B1;
    dw SamusSpritemaps_A323                                              ;9284B3;
    dw SamusSpritemaps_A334                                              ;9284B5;
    dw SamusSpritemaps_A400                                              ;9284B7;
    dw SamusSpritemaps_A323                                              ;9284B9;
; 0217. Top half - 0C: Moving left-   gun extended
    dw SamusSpritemaps_A34A                                              ;9284BB;
    dw SamusSpritemaps_A451                                              ;9284BD;
    dw SamusSpritemaps_A3A0                                              ;9284BF;
    dw SamusSpritemaps_A380                                              ;9284C1;
    dw SamusSpritemaps_A365                                              ;9284C3;
    dw SamusSpritemaps_A34A                                              ;9284C5;
    dw SamusSpritemaps_A3C0                                              ;9284C7;
    dw SamusSpritemaps_A41B                                              ;9284C9;
    dw SamusSpritemaps_A3DB                                              ;9284CB;
    dw SamusSpritemaps_A3C0                                              ;9284CD;
; 0221. Top half - 0D: Moving right - aiming up (unused)
    dw SamusSpritemaps_97FF                                              ;9284CF;
    dw SamusSpritemaps_97FF                                              ;9284D1;
    dw SamusSpritemaps_9CAD                                              ;9284D3;
    dw SamusSpritemaps_9E9E                                              ;9284D5;
    dw SamusSpritemaps_9CAD                                              ;9284D7;
    dw SamusSpritemaps_97FF                                              ;9284D9;
    dw SamusSpritemaps_97FF                                              ;9284DB;
    dw SamusSpritemaps_9CAD                                              ;9284DD;
    dw SamusSpritemaps_9E9E                                              ;9284DF;
    dw SamusSpritemaps_9CAD                                              ;9284E1;
; 022B. Top half - 0E: Moving left-   aiming up (unused)
    dw SamusSpritemaps_981A                                              ;9284E3;
    dw SamusSpritemaps_981A                                              ;9284E5;
    dw SamusSpritemaps_9CC8                                              ;9284E7;
    dw SamusSpritemaps_9EB9                                              ;9284E9;
    dw SamusSpritemaps_9CC8                                              ;9284EB;
    dw SamusSpritemaps_981A                                              ;9284ED;
    dw SamusSpritemaps_981A                                              ;9284EF;
    dw SamusSpritemaps_9CC8                                              ;9284F1;
    dw SamusSpritemaps_9EB9                                              ;9284F3;
    dw SamusSpritemaps_9CC8                                              ;9284F5;
; 0235. Top half - 0F: Moving right - aiming up-right
    dw SamusSpritemaps_9857                                              ;9284F7;
    dw SamusSpritemaps_9857                                              ;9284F9;
    dw SamusSpritemaps_9CE3                                              ;9284FB;
    dw SamusSpritemaps_9DB2                                              ;9284FD;
    dw SamusSpritemaps_9CE3                                              ;9284FF;
    dw SamusSpritemaps_9857                                              ;928501;
    dw SamusSpritemaps_9857                                              ;928503;
    dw SamusSpritemaps_9CE3                                              ;928505;
    dw SamusSpritemaps_9DB2                                              ;928507;
    dw SamusSpritemaps_9CE3                                              ;928509;
; 023F. Top half - 10: Moving left-   aiming up-left
    dw SamusSpritemaps_9872                                              ;92850B;
    dw SamusSpritemaps_9872                                              ;92850D;
    dw SamusSpritemaps_9CFE                                              ;92850F;
    dw SamusSpritemaps_9DCD                                              ;928511;
    dw SamusSpritemaps_9CFE                                              ;928513;
    dw SamusSpritemaps_9872                                              ;928515;
    dw SamusSpritemaps_9872                                              ;928517;
    dw SamusSpritemaps_9CFE                                              ;928519;
    dw SamusSpritemaps_9DCD                                              ;92851B;
    dw SamusSpritemaps_9CFE                                              ;92851D;
; 0249. Top half - 11: Moving right - aiming down-right
    dw SamusSpritemaps_9705                                              ;92851F;
    dw SamusSpritemaps_9705                                              ;928521;
    dw SamusSpritemaps_9BCB                                              ;928523;
    dw SamusSpritemaps_9DED                                              ;928525;
    dw SamusSpritemaps_9BCB                                              ;928527;
    dw SamusSpritemaps_9705                                              ;928529;
    dw SamusSpritemaps_9705                                              ;92852B;
    dw SamusSpritemaps_9BCB                                              ;92852D;
    dw SamusSpritemaps_9DED                                              ;92852F;
    dw SamusSpritemaps_9BCB                                              ;928531;
; 0253. Top half - 12: Moving left-   aiming down-left
    dw SamusSpritemaps_9725                                              ;928533;
    dw SamusSpritemaps_9725                                              ;928535;
    dw SamusSpritemaps_9BEB                                              ;928537;
    dw SamusSpritemaps_9E0D                                              ;928539;
    dw SamusSpritemaps_9BEB                                              ;92853B;
    dw SamusSpritemaps_9725                                              ;92853D;
    dw SamusSpritemaps_9725                                              ;92853F;
    dw SamusSpritemaps_9BEB                                              ;928541;
    dw SamusSpritemaps_9E0D                                              ;928543;
    dw SamusSpritemaps_9BEB                                              ;928545;
; 025D. Top half - 45: Unused
    dw SamusSpritemaps_97EE                                              ;928547;
    dw SamusSpritemaps_97EE                                              ;928549;
    dw SamusSpritemaps_9C92                                              ;92854B;
    dw SamusSpritemaps_9E83                                              ;92854D;
    dw SamusSpritemaps_9C92                                              ;92854F;
    dw SamusSpritemaps_97EE                                              ;928551;
    dw SamusSpritemaps_97EE                                              ;928553;
    dw SamusSpritemaps_9C92                                              ;928555;
    dw SamusSpritemaps_9E83                                              ;928557;
    dw SamusSpritemaps_9C92                                              ;928559;
; 0267. Top half - 46: Unused
    dw SamusSpritemaps_97DD                                              ;92855B;
    dw SamusSpritemaps_97DD                                              ;92855D;
    dw SamusSpritemaps_9C77                                              ;92855F;
    dw SamusSpritemaps_9E63                                              ;928561;
    dw SamusSpritemaps_9C77                                              ;928563;
    dw SamusSpritemaps_97DD                                              ;928565;
    dw SamusSpritemaps_97DD                                              ;928567;
    dw SamusSpritemaps_9C77                                              ;928569;
    dw SamusSpritemaps_9E63                                              ;92856B;
    dw SamusSpritemaps_9C77                                              ;92856D;
; Top half - 17: Facing right - normal jump - aiming down
; 0271. Top half - AE: Unused
    dw SamusSpritemaps_9705                                              ;92856F;
    dw SamusSpritemaps_9B17                                              ;928571;
; Top half - 18: Facing left-   normal jump - aiming down
; 0273. Top half - AF: Unused
    dw SamusSpritemaps_9725                                              ;928573;
    dw SamusSpritemaps_9B2D                                              ;928575;
; Top half - 13: Facing right - normal jump - not aiming - not moving - gun extended
; 0275. Top half - AC: Unused
    dw SamusSpritemaps_977B                                              ;928577;
    dw SamusSpritemaps_977B                                              ;928579;
; Top half - 14: Facing left-   normal jump - not aiming - not moving - gun extended
; 0277. Top half - AD: Unused
    dw SamusSpritemaps_9796                                              ;92857B;
    dw SamusSpritemaps_9796                                              ;92857D;
; 0279. Top half - 15: Facing right - normal jump - aiming up
    dw SamusSpritemaps_97B1                                              ;92857F;
    dw SamusSpritemaps_97FF                                              ;928581;
; 027B. Top half - 16: Facing left-   normal jump - aiming up
    dw SamusSpritemaps_97C7                                              ;928583;
    dw SamusSpritemaps_981A                                              ;928585;
; 027D. Top half - 69: Facing right - normal jump - aiming up-right
    dw SamusSpritemaps_9857                                              ;928587;
    dw SamusSpritemaps_9857                                              ;928589;
; 027F. Top half - 6A: Facing left-   normal jump - aiming up-left
    dw SamusSpritemaps_9872                                              ;92858B;
    dw SamusSpritemaps_9872                                              ;92858D;
; Top half - 6B: Facing right - normal jump - aiming down-right
; 0281. Top half - B0: Unused
    dw SamusSpritemaps_9705                                              ;92858F;
    dw SamusSpritemaps_9705                                              ;928591;
; Top half - 6C: Facing left-   normal jump - aiming down-left
; 0283. Top half - B1: Unused
    dw SamusSpritemaps_9725                                              ;928593;
    dw SamusSpritemaps_9725                                              ;928595;
; 0285. Top half - 51: Facing right - normal jump - not aiming - moving forward
    dw SamusSpritemaps_977B                                              ;928597;
    dw SamusSpritemaps_977B                                              ;928599;
; 0287. Top half - 52: Facing left-   normal jump - not aiming - moving forward
    dw SamusSpritemaps_9796                                              ;92859B;
    dw SamusSpritemaps_9796                                              ;92859D;
; 0289. Top half - 4B: Facing right - normal jump transition
    dw SamusSpritemaps_9B6F                                              ;92859F;
; 028A. Top half - 4C: Facing left-   normal jump transition
    dw SamusSpritemaps_9B80                                              ;9285A1;
; Top half - 4D: Facing right - normal jump - not aiming - not moving - gun not extended
; 028B. Top half - C7: Facing right - vertical shinespark windup
    dw SamusSpritemaps_9691                                              ;9285A3;
    dw SamusSpritemaps_969D                                              ;9285A5;
    dw SamusSpritemaps_9691                                              ;9285A7;
    dw SamusSpritemaps_9657                                              ;9285A9;
    dw SamusSpritemaps_9663                                              ;9285AB;
    dw SamusSpritemaps_97DD                                              ;9285AD;
; Top half - 4E: Facing left-   normal jump - not aiming - not moving - gun not extended
; 0291. Top half - C8: Facing left-   vertical shinespark windup
    dw SamusSpritemaps_96E8                                              ;9285AF;
    dw SamusSpritemaps_96F4                                              ;9285B1;
    dw SamusSpritemaps_96E8                                              ;9285B3;
    dw SamusSpritemaps_96AE                                              ;9285B5;
    dw SamusSpritemaps_96BA                                              ;9285B7;
    dw SamusSpritemaps_97EE                                              ;9285B9;
; 0297. Top half - 4F: Facing left-   damage boost
    dw SamusSpritemaps_9BBF                                              ;9285BB;
    dw SamusSpritemaps_9BBF                                              ;9285BD;
    dw SamusSpritemaps_BB94                                              ;9285BF;
    dw SamusSpritemaps_BB88                                              ;9285C1;
    dw SamusSpritemaps_BB72                                              ;9285C3;
    dw SamusSpritemaps_BB66                                              ;9285C5;
    dw SamusSpritemaps_BB50                                              ;9285C7;
    dw SamusSpritemaps_BB44                                              ;9285C9;
    dw SamusSpritemaps_BB2E                                              ;9285CB;
    dw SamusSpritemaps_9EB9                                              ;9285CD;
; 02A1. Top half - 50: Facing right - damage boost
    dw SamusSpritemaps_9BAE                                              ;9285CF;
    dw SamusSpritemaps_9BAE                                              ;9285D1;
    dw SamusSpritemaps_BDD9                                              ;9285D3;
    dw SamusSpritemaps_BDCD                                              ;9285D5;
    dw SamusSpritemaps_BDB7                                              ;9285D7;
    dw SamusSpritemaps_BDAB                                              ;9285D9;
    dw SamusSpritemaps_BD95                                              ;9285DB;
    dw SamusSpritemaps_BD89                                              ;9285DD;
    dw SamusSpritemaps_BD73                                              ;9285DF;
    dw SamusSpritemaps_9E83                                              ;9285E1;
; 02AB. Top half - 63: Unused
    dw SamusSpritemaps_9A93                                              ;9285E3;
    dw SamusSpritemaps_9A1F                                              ;9285E5;
; 02AD. Top half - 64: Unused
    dw SamusSpritemaps_9AAE                                              ;9285E7;
    dw SamusSpritemaps_99FF                                              ;9285E9;
; 02AF. Top half - 65: Unused
    dw SamusSpritemaps_9A7B                                              ;9285EB;
    dw SamusSpritemaps_BD67                                              ;9285ED;
    dw SamusSpritemaps_BD73                                              ;9285EF;
    dw SamusSpritemaps_BD89                                              ;9285F1;
    dw SamusSpritemaps_BD95                                              ;9285F3;
    dw SamusSpritemaps_BDAB                                              ;9285F5;
    dw SamusSpritemaps_BDB7                                              ;9285F7;
    dw SamusSpritemaps_BDCD                                              ;9285F9;
    dw SamusSpritemaps_BDD9                                              ;9285FB;
; 02AF. Top half - 65: Unused
    dw SamusSpritemaps_9A87                                              ;9285FD;
    dw SamusSpritemaps_BB22                                              ;9285FF;
    dw SamusSpritemaps_BB2E                                              ;928601;
    dw SamusSpritemaps_BB44                                              ;928603;
    dw SamusSpritemaps_BB50                                              ;928605;
    dw SamusSpritemaps_BB66                                              ;928607;
    dw SamusSpritemaps_BB72                                              ;928609;
    dw SamusSpritemaps_BB88                                              ;92860B;
    dw SamusSpritemaps_BB94                                              ;92860D;
; 02C1. Top half - 83: Facing right - wall jump
    dw SamusSpritemaps_9A7B                                              ;92860F;
    dw SamusSpritemaps_9BAE                                              ;928611;
    dw $0000                                                             ;928613;
    dw SamusSpritemaps_BD67                                              ;928615;
    dw SamusSpritemaps_BD73                                              ;928617;
    dw SamusSpritemaps_BD89                                              ;928619;
    dw SamusSpritemaps_BD95                                              ;92861B;
    dw SamusSpritemaps_BDAB                                              ;92861D;
    dw SamusSpritemaps_BDB7                                              ;92861F;
    dw SamusSpritemaps_BDCD                                              ;928621;
    dw SamusSpritemaps_BDD9                                              ;928623;
    dw $0000                                                             ;928625;
    dw $0000                                                             ;928627;
    dw SamusSpritemaps_BEBF                                              ;928629;
    dw SamusSpritemaps_BEBF                                              ;92862B;
    dw SamusSpritemaps_BEBF                                              ;92862D;
    dw SamusSpritemaps_BEBF                                              ;92862F;
    dw SamusSpritemaps_BEBF                                              ;928631;
    dw SamusSpritemaps_BEBF                                              ;928633;
    dw SamusSpritemaps_BEBF                                              ;928635;
    dw SamusSpritemaps_BEBF                                              ;928637;
    dw $0000                                                             ;928639;
    dw $0000                                                             ;92863B;
    dw SamusSpritemaps_BDEF                                              ;92863D;
    dw SamusSpritemaps_BDEF                                              ;92863F;
    dw SamusSpritemaps_BDEF                                              ;928641;
    dw SamusSpritemaps_BEBF                                              ;928643;
    dw SamusSpritemaps_BEBF                                              ;928645;
    dw SamusSpritemaps_BEBF                                              ;928647;
    dw SamusSpritemaps_BE23                                              ;928649;
    dw SamusSpritemaps_BE23                                              ;92864B;
    dw SamusSpritemaps_BE23                                              ;92864D;
    dw SamusSpritemaps_BEBF                                              ;92864F;
    dw SamusSpritemaps_BEBF                                              ;928651;
    dw SamusSpritemaps_BEBF                                              ;928653;
    dw SamusSpritemaps_BE5C                                              ;928655;
    dw SamusSpritemaps_BE5C                                              ;928657;
    dw SamusSpritemaps_BE5C                                              ;928659;
    dw SamusSpritemaps_BEBF                                              ;92865B;
    dw SamusSpritemaps_BEBF                                              ;92865D;
    dw SamusSpritemaps_BEBF                                              ;92865F;
    dw SamusSpritemaps_BE95                                              ;928661;
    dw SamusSpritemaps_BE95                                              ;928663;
    dw SamusSpritemaps_BE95                                              ;928665;
    dw SamusSpritemaps_BEBF                                              ;928667;
    dw SamusSpritemaps_BEBF                                              ;928669;
    dw SamusSpritemaps_BEBF                                              ;92866B;
; 02F0. Top half - 84: Facing left-   wall jump
    dw SamusSpritemaps_9A87                                              ;92866D;
    dw SamusSpritemaps_9BBF                                              ;92866F;
    dw $0000                                                             ;928671;
    dw SamusSpritemaps_BB22                                              ;928673;
    dw SamusSpritemaps_BB2E                                              ;928675;
    dw SamusSpritemaps_BB44                                              ;928677;
    dw SamusSpritemaps_BB50                                              ;928679;
    dw SamusSpritemaps_BB66                                              ;92867B;
    dw SamusSpritemaps_BB72                                              ;92867D;
    dw SamusSpritemaps_BB88                                              ;92867F;
    dw SamusSpritemaps_BB94                                              ;928681;
    dw $0000                                                             ;928683;
    dw $0000                                                             ;928685;
    dw SamusSpritemaps_BC7A                                              ;928687;
    dw SamusSpritemaps_BC7A                                              ;928689;
    dw SamusSpritemaps_BC7A                                              ;92868B;
    dw SamusSpritemaps_BC7A                                              ;92868D;
    dw SamusSpritemaps_BC7A                                              ;92868F;
    dw SamusSpritemaps_BC7A                                              ;928691;
    dw SamusSpritemaps_BC7A                                              ;928693;
    dw SamusSpritemaps_BC7A                                              ;928695;
    dw $0000                                                             ;928697;
    dw $0000                                                             ;928699;
    dw SamusSpritemaps_BBAA                                              ;92869B;
    dw SamusSpritemaps_BBAA                                              ;92869D;
    dw SamusSpritemaps_BBAA                                              ;92869F;
    dw SamusSpritemaps_BC7A                                              ;9286A1;
    dw SamusSpritemaps_BC7A                                              ;9286A3;
    dw SamusSpritemaps_BC7A                                              ;9286A5;
    dw SamusSpritemaps_BBDE                                              ;9286A7;
    dw SamusSpritemaps_BBDE                                              ;9286A9;
    dw SamusSpritemaps_BBDE                                              ;9286AB;
    dw SamusSpritemaps_BC7A                                              ;9286AD;
    dw SamusSpritemaps_BC7A                                              ;9286AF;
    dw SamusSpritemaps_BC7A                                              ;9286B1;
    dw SamusSpritemaps_BC17                                              ;9286B3;
    dw SamusSpritemaps_BC17                                              ;9286B5;
    dw SamusSpritemaps_BC17                                              ;9286B7;
    dw SamusSpritemaps_BC7A                                              ;9286B9;
    dw SamusSpritemaps_BC7A                                              ;9286BB;
    dw SamusSpritemaps_BC7A                                              ;9286BD;
    dw SamusSpritemaps_BC50                                              ;9286BF;
    dw SamusSpritemaps_BC50                                              ;9286C1;
    dw SamusSpritemaps_BC50                                              ;9286C3;
    dw SamusSpritemaps_BC7A                                              ;9286C5;
    dw SamusSpritemaps_BC7A                                              ;9286C7;
    dw SamusSpritemaps_BC7A                                              ;9286C9;
; 031F. Top half - 53: Facing right - knockback
    dw SamusSpritemaps_98AD                                              ;9286CB;
    dw SamusSpritemaps_98AD                                              ;9286CD;
; 031F. Top half - 53: Facing right - knockback
    dw SamusSpritemaps_9892                                              ;9286CF;
    dw SamusSpritemaps_9892                                              ;9286D1;
    dw SamusSpritemaps_9892                                              ;9286D3;
    dw SamusSpritemaps_98AD                                              ;9286D5;
    dw SamusSpritemaps_9928                                              ;9286D7;
    dw SamusSpritemaps_9928                                              ;9286D9;
    dw SamusSpritemaps_9976                                              ;9286DB;
    dw SamusSpritemaps_9912                                              ;9286DD;
    dw SamusSpritemaps_9912                                              ;9286DF;
    dw SamusSpritemaps_996F                                              ;9286E1;
    dw SamusSpritemaps_9998                                              ;9286E3;
    dw SamusSpritemaps_99CE                                              ;9286E5;
    dw SamusSpritemaps_9982                                              ;9286E7;
    dw SamusSpritemaps_99AE                                              ;9286E9;
; Top half - 5B: Unused
; 032F. Top half - B8: Facing left-   grapple wall jump pose
    dw SamusSpritemaps_9A1F                                              ;9286EB;
; Top half - 5C: Unused
; 0330. Top half - B9: Facing right - grapple wall jump pose
    dw SamusSpritemaps_99FF                                              ;9286ED;
; Top half - 5D: Unused
; Top half - 5E: Unused
; 0331. Top half - 5F: Unused
    dw SamusSpritemaps_9B2D                                              ;9286EF;
; 0332. Top half - 60: Unused
    dw SamusSpritemaps_9B17                                              ;9286F1;
; Top half - 61: Unused
; 0333. Top half - B2: Facing clockwise   -   grapple
    dw SamusSpritemaps_A96B                                              ;9286F3;
    dw SamusSpritemaps_A955                                              ;9286F5;
    dw SamusSpritemaps_A944                                              ;9286F7;
    dw SamusSpritemaps_A933                                              ;9286F9;
    dw SamusSpritemaps_A922                                              ;9286FB;
    dw SamusSpritemaps_A911                                              ;9286FD;
    dw SamusSpritemaps_A900                                              ;9286FF;
    dw SamusSpritemaps_A8EA                                              ;928701;
    dw SamusSpritemaps_A8D4                                              ;928703;
    dw SamusSpritemaps_A584                                              ;928705;
    dw SamusSpritemaps_A573                                              ;928707;
    dw SamusSpritemaps_A562                                              ;928709;
    dw SamusSpritemaps_A551                                              ;92870B;
    dw SamusSpritemaps_A540                                              ;92870D;
    dw SamusSpritemaps_A52F                                              ;92870F;
    dw SamusSpritemaps_A519                                              ;928711;
    dw SamusSpritemaps_A503                                              ;928713;
    dw SamusSpritemaps_A4ED                                              ;928715;
    dw SamusSpritemaps_A4DC                                              ;928717;
    dw SamusSpritemaps_A4CB                                              ;928719;
    dw SamusSpritemaps_A4BA                                              ;92871B;
    dw SamusSpritemaps_A4A9                                              ;92871D;
    dw SamusSpritemaps_A498                                              ;92871F;
    dw SamusSpritemaps_A482                                              ;928721;
    dw SamusSpritemaps_A46C                                              ;928723;
    dw SamusSpritemaps_A9EC                                              ;928725;
    dw SamusSpritemaps_A9DB                                              ;928727;
    dw SamusSpritemaps_A9CA                                              ;928729;
    dw SamusSpritemaps_A9B9                                              ;92872B;
    dw SamusSpritemaps_A9A8                                              ;92872D;
    dw SamusSpritemaps_A997                                              ;92872F;
    dw SamusSpritemaps_A981                                              ;928731;
    dw SamusSpritemaps_A96B                                              ;928733;
    dw SamusSpritemaps_A955                                              ;928735;
    dw SamusSpritemaps_A944                                              ;928737;
    dw SamusSpritemaps_A933                                              ;928739;
    dw SamusSpritemaps_A922                                              ;92873B;
    dw SamusSpritemaps_A911                                              ;92873D;
    dw SamusSpritemaps_A900                                              ;92873F;
    dw SamusSpritemaps_A8EA                                              ;928741;
    dw SamusSpritemaps_A8D4                                              ;928743;
    dw SamusSpritemaps_A584                                              ;928745;
    dw SamusSpritemaps_A573                                              ;928747;
    dw SamusSpritemaps_A562                                              ;928749;
    dw SamusSpritemaps_A551                                              ;92874B;
    dw SamusSpritemaps_A540                                              ;92874D;
    dw SamusSpritemaps_A52F                                              ;92874F;
    dw SamusSpritemaps_A519                                              ;928751;
    dw SamusSpritemaps_A503                                              ;928753;
    dw SamusSpritemaps_A4ED                                              ;928755;
    dw SamusSpritemaps_A4DC                                              ;928757;
    dw SamusSpritemaps_A4CB                                              ;928759;
    dw SamusSpritemaps_A4BA                                              ;92875B;
    dw SamusSpritemaps_A4A9                                              ;92875D;
    dw SamusSpritemaps_A498                                              ;92875F;
    dw SamusSpritemaps_A482                                              ;928761;
    dw SamusSpritemaps_A46C                                              ;928763;
    dw SamusSpritemaps_A9EC                                              ;928765;
    dw SamusSpritemaps_A9DB                                              ;928767;
    dw SamusSpritemaps_A9CA                                              ;928769;
    dw SamusSpritemaps_A9B9                                              ;92876B;
    dw SamusSpritemaps_A9A8                                              ;92876D;
    dw SamusSpritemaps_A997                                              ;92876F;
    dw SamusSpritemaps_A981                                              ;928771;
    dw SamusSpritemaps_A503                                              ;928773;
    dw SamusSpritemaps_A503                                              ;928775;
; Top half - 62: Unused
; 0375. Top half - B3: Facing anticlockwise - grapple
    dw SamusSpritemaps_AB8B                                              ;928777;
    dw SamusSpritemaps_ABB5                                              ;928779;
    dw SamusSpritemaps_ABDF                                              ;92877B;
    dw SamusSpritemaps_AC0E                                              ;92877D;
    dw SamusSpritemaps_AC42                                              ;92877F;
    dw SamusSpritemaps_AC76                                              ;928781;
    dw SamusSpritemaps_ACAA                                              ;928783;
    dw SamusSpritemaps_ACDE                                              ;928785;
    dw SamusSpritemaps_A5B0                                              ;928787;
    dw SamusSpritemaps_A5DA                                              ;928789;
    dw SamusSpritemaps_A604                                              ;92878B;
    dw SamusSpritemaps_A638                                              ;92878D;
    dw SamusSpritemaps_A66C                                              ;92878F;
    dw SamusSpritemaps_A69B                                              ;928791;
    dw SamusSpritemaps_A6CA                                              ;928793;
    dw SamusSpritemaps_A6F9                                              ;928795;
    dw SamusSpritemaps_A723                                              ;928797;
    dw SamusSpritemaps_A74D                                              ;928799;
    dw SamusSpritemaps_A777                                              ;92879B;
    dw SamusSpritemaps_A7A6                                              ;92879D;
    dw SamusSpritemaps_A7DA                                              ;92879F;
    dw SamusSpritemaps_A80E                                              ;9287A1;
    dw SamusSpritemaps_A842                                              ;9287A3;
    dw SamusSpritemaps_A876                                              ;9287A5;
    dw SamusSpritemaps_AA18                                              ;9287A7;
    dw SamusSpritemaps_AA42                                              ;9287A9;
    dw SamusSpritemaps_AA6C                                              ;9287AB;
    dw SamusSpritemaps_AAA0                                              ;9287AD;
    dw SamusSpritemaps_AAD4                                              ;9287AF;
    dw SamusSpritemaps_AB03                                              ;9287B1;
    dw SamusSpritemaps_AB32                                              ;9287B3;
    dw SamusSpritemaps_AB61                                              ;9287B5;
    dw SamusSpritemaps_AB8B                                              ;9287B7;
    dw SamusSpritemaps_ABB5                                              ;9287B9;
    dw SamusSpritemaps_ABDF                                              ;9287BB;
    dw SamusSpritemaps_AC0E                                              ;9287BD;
    dw SamusSpritemaps_AC42                                              ;9287BF;
    dw SamusSpritemaps_AC76                                              ;9287C1;
    dw SamusSpritemaps_ACAA                                              ;9287C3;
    dw SamusSpritemaps_ACDE                                              ;9287C5;
    dw SamusSpritemaps_A5B0                                              ;9287C7;
    dw SamusSpritemaps_A5DA                                              ;9287C9;
    dw SamusSpritemaps_A604                                              ;9287CB;
    dw SamusSpritemaps_A638                                              ;9287CD;
    dw SamusSpritemaps_A66C                                              ;9287CF;
    dw SamusSpritemaps_A69B                                              ;9287D1;
    dw SamusSpritemaps_A6CA                                              ;9287D3;
    dw SamusSpritemaps_A6F9                                              ;9287D5;
    dw SamusSpritemaps_A723                                              ;9287D7;
    dw SamusSpritemaps_A74D                                              ;9287D9;
    dw SamusSpritemaps_A777                                              ;9287DB;
    dw SamusSpritemaps_A7A6                                              ;9287DD;
    dw SamusSpritemaps_A7DA                                              ;9287DF;
    dw SamusSpritemaps_A80E                                              ;9287E1;
    dw SamusSpritemaps_A842                                              ;9287E3;
    dw SamusSpritemaps_A876                                              ;9287E5;
    dw SamusSpritemaps_AA18                                              ;9287E7;
    dw SamusSpritemaps_AA42                                              ;9287E9;
    dw SamusSpritemaps_AA6C                                              ;9287EB;
    dw SamusSpritemaps_AAA0                                              ;9287ED;
    dw SamusSpritemaps_AAD4                                              ;9287EF;
    dw SamusSpritemaps_AB03                                              ;9287F1;
    dw SamusSpritemaps_AB32                                              ;9287F3;
    dw SamusSpritemaps_AB61                                              ;9287F5;
    dw SamusSpritemaps_A723                                              ;9287F7;
    dw SamusSpritemaps_A723                                              ;9287F9;
; 03B7. Top half - 29: Facing right - falling
    dw SamusSpritemaps_9BAE                                              ;9287FB;
    dw SamusSpritemaps_9E63                                              ;9287FD;
    dw SamusSpritemaps_9E83                                              ;9287FF;
    dw $0000                                                             ;928801;
    dw $0000                                                             ;928803;
    dw SamusSpritemaps_9E63                                              ;928805;
    dw SamusSpritemaps_9BAE                                              ;928807;
; 03BE. Top half - 2A: Facing left-   falling
    dw SamusSpritemaps_9BBF                                              ;928809;
    dw SamusSpritemaps_9E9E                                              ;92880B;
    dw SamusSpritemaps_9EB9                                              ;92880D;
    dw $0000                                                             ;92880F;
    dw $0000                                                             ;928811;
    dw SamusSpritemaps_9E9E                                              ;928813;
    dw SamusSpritemaps_9BBF                                              ;928815;
; 03C5. Top half - 67: Facing right - falling - gun extended
    dw SamusSpritemaps_977B                                              ;928817;
    dw SamusSpritemaps_977B                                              ;928819;
    dw SamusSpritemaps_977B                                              ;92881B;
    dw $0000                                                             ;92881D;
    dw $0000                                                             ;92881F;
    dw SamusSpritemaps_977B                                              ;928821;
    dw SamusSpritemaps_977B                                              ;928823;
; 03CC. Top half - 68: Facing left-   falling - gun extended
    dw SamusSpritemaps_9796                                              ;928825;
    dw SamusSpritemaps_9796                                              ;928827;
    dw SamusSpritemaps_9796                                              ;928829;
    dw $0000                                                             ;92882B;
    dw $0000                                                             ;92882D;
    dw SamusSpritemaps_9796                                              ;92882F;
    dw SamusSpritemaps_9796                                              ;928831;
; 03D3. Top half - 2B: Facing right - falling - aiming up
    dw SamusSpritemaps_97B1                                              ;928833;
    dw SamusSpritemaps_97FF                                              ;928835;
    dw SamusSpritemaps_97FF                                              ;928837;
; 03D6. Top half - 2C: Facing left-   falling - aiming up
    dw SamusSpritemaps_97C7                                              ;928839;
    dw SamusSpritemaps_981A                                              ;92883B;
    dw SamusSpritemaps_981A                                              ;92883D;
; 03D9. Top half - 2D: Facing right - falling - aiming down
    dw SamusSpritemaps_9705                                              ;92883F;
    dw SamusSpritemaps_9B17                                              ;928841;
; 03DB. Top half - 2E: Facing left-   falling - aiming down
    dw SamusSpritemaps_9725                                              ;928843;
    dw SamusSpritemaps_9B2D                                              ;928845;
; 03DD. Top half - 6D: Facing right - falling - aiming up-right
    dw SamusSpritemaps_9857                                              ;928847;
    dw SamusSpritemaps_9857                                              ;928849;
    dw SamusSpritemaps_9857                                              ;92884B;
; 03E0. Top half - 6E: Facing left-   falling - aiming up-left
    dw SamusSpritemaps_9872                                              ;92884D;
    dw SamusSpritemaps_9872                                              ;92884F;
    dw SamusSpritemaps_9872                                              ;928851;
; 03E3. Top half - 6F: Facing right - falling - aiming down-right
    dw SamusSpritemaps_9705                                              ;928853;
    dw SamusSpritemaps_9705                                              ;928855;
    dw SamusSpritemaps_9705                                              ;928857;
; 03E6. Top half - 70: Facing left-   falling - aiming down-left
    dw SamusSpritemaps_9725                                              ;928859;
    dw SamusSpritemaps_9725                                              ;92885B;
    dw SamusSpritemaps_9725                                              ;92885D;
; 03E9. Top half - 71: Facing right - crouching - aiming up-right
    dw SamusSpritemaps_97B1                                              ;92885F;
; 03EA. Top half - 72: Facing left-   crouching - aiming up-left
    dw SamusSpritemaps_97C7                                              ;928861;
; Top half - 73: Facing right - crouching - aiming down-right
; 03EB. Top half - B6: Unused
    dw SamusSpritemaps_9745                                              ;928863;
; Top half - 74: Facing left-   crouching - aiming down-left
; 03EC. Top half - B7: Unused
    dw SamusSpritemaps_9760                                              ;928865;
; 03ED. Top half - 85: Facing right - crouching - aiming up
    dw SamusSpritemaps_97B1                                              ;928867;
    dw SamusSpritemaps_97FF                                              ;928869;
; 03EF. Top half - 86: Facing left-   crouching - aiming up
    dw SamusSpritemaps_97C7                                              ;92886B;
    dw SamusSpritemaps_981A                                              ;92886D;
; Top half - 27: Facing right - crouching
; 03F1. Top half - B4: Unused
    dw SamusSpritemaps_A072                                              ;92886F;
    dw SamusSpritemaps_A088                                              ;928871;
    dw SamusSpritemaps_A09E                                              ;928873;
    dw SamusSpritemaps_A088                                              ;928875;
    dw $0000                                                             ;928877;
    dw SamusSpritemaps_A072                                              ;928879;
    dw SamusSpritemaps_A088                                              ;92887B;
    dw SamusSpritemaps_A0F6                                              ;92887D;
    dw SamusSpritemaps_A088                                              ;92887F;
; Top half - 28: Facing left-   crouching
; 03FA. Top half - B5: Unused
    dw SamusSpritemaps_A0B4                                              ;928881;
    dw SamusSpritemaps_A0CA                                              ;928883;
    dw SamusSpritemaps_A0E0                                              ;928885;
    dw SamusSpritemaps_A0CA                                              ;928887;
    dw $0000                                                             ;928889;
    dw SamusSpritemaps_A0B4                                              ;92888B;
    dw SamusSpritemaps_A0CA                                              ;92888D;
    dw SamusSpritemaps_A111                                              ;92888F;
    dw SamusSpritemaps_A0CA                                              ;928891;
; Top half - 35: Facing right - crouching transition
; 0403. Top half - 3B: Facing right - standing transition
    dw SamusSpritemaps_977B                                              ;928893;
; Top half - 36: Facing left-   crouching transition
; 0404. Top half - 3C: Facing left-   standing transition
    dw SamusSpritemaps_9796                                              ;928895;
; Bottom half - 37: Facing right - morphing transition
; 0405. Top half - 37: Facing right - morphing transition
    dw SamusSpritemaps_BCDD                                              ;928897;
    dw SamusSpritemaps_BCCC                                              ;928899;
; Bottom half - 38: Facing left-   morphing transition
; 0407. Top half - 38: Facing left-   morphing transition
    dw SamusSpritemaps_BCB1                                              ;92889B;
    dw SamusSpritemaps_BCA0                                              ;92889D;
; Bottom half - 3D: Facing right - unmorphing transition
; 0409. Top half - 3D: Facing right - unmorphing transition
    dw SamusSpritemaps_BCCC                                              ;92889F;
    dw SamusSpritemaps_BCDD                                              ;9288A1;
; Bottom half - 3E: Facing left-   unmorphing transition
; 040B. Top half - 3E: Facing left-   unmorphing transition
    dw SamusSpritemaps_BCA0                                              ;9288A3;
    dw SamusSpritemaps_BCB1                                              ;9288A5;
; 040D. Top half - DB: Unused
    dw SamusSpritemaps_977B                                              ;9288A7;
    dw SamusSpritemaps_BCDD                                              ;9288A9;
    dw SamusSpritemaps_BCCC                                              ;9288AB;
; 0410. Top half - DC: Unused
    dw SamusSpritemaps_9796                                              ;9288AD;
    dw SamusSpritemaps_BCB1                                              ;9288AF;
    dw SamusSpritemaps_BCA0                                              ;9288B1;
; 0413. Top half - DD: Unused
    dw SamusSpritemaps_BCCC                                              ;9288B3;
    dw SamusSpritemaps_BCDD                                              ;9288B5;
    dw SamusSpritemaps_977B                                              ;9288B7;
; 0416. Top half - DE: Unused
    dw SamusSpritemaps_BCA0                                              ;9288B9;
    dw SamusSpritemaps_BCB1                                              ;9288BB;
    dw SamusSpritemaps_9796                                              ;9288BD;
; Top half - 25: Facing right - turning - standing
; Top half - 2F: Facing right - turning - jumping
; Top half - 43: Facing right - turning - crouching
; Top half - 87: Facing right - turning - falling
; Top half - BF: Facing right - moonwalking - turn/jump left
; 0419. Top half - C6: Unused
    dw SamusSpritemaps_9998                                              ;9288BF;
    dw SamusSpritemaps_99E9                                              ;9288C1;
    dw SamusSpritemaps_9982                                              ;9288C3;
; Top half - 26: Facing left-   turning - standing
; Top half - 30: Facing left-   turning - jumping
; Top half - 44: Facing left-   turning - crouching
; Top half - 88: Facing left-   turning - falling
; 041C. Top half - C0: Facing left-   moonwalking - turn/jump right
    dw SamusSpritemaps_9982                                              ;9288C5;
    dw SamusSpritemaps_99E9                                              ;9288C7;
    dw SamusSpritemaps_9998                                              ;9288C9;
; Top half - 8B: Facing right - turning - standing - aiming up
; Top half - 8F: Facing right - turning - in air - aiming up
; Top half - 93: Facing right - turning - falling - aiming up
; Top half - 97: Facing right - turning - crouching - aiming up
; Top half - 9C: Facing right - turning - standing - aiming up-right
; Top half - 9E: Facing right - turning - in air - aiming up-right
; Top half - A0: Facing right - turning - falling - aiming up-right
; Top half - A2: Facing right - turning - crouching - aiming up-right
; 041F. Top half - C1: Facing right - moonwalking - turn/jump left-   aiming up-right
    dw SamusSpritemaps_99CE                                              ;9288CB;
    dw SamusSpritemaps_993E                                              ;9288CD;
    dw SamusSpritemaps_99AE                                              ;9288CF;
; Top half - 8C: Facing left-   turning - standing - aiming up
; Top half - 90: Facing left-   turning - in air - aiming up
; Top half - 94: Facing left-   turning - falling - aiming up
; Top half - 98: Facing left-   turning - crouching - aiming up
; Top half - 9D: Facing left-   turning - standing - aiming up-left
; Top half - 9F: Facing left-   turning - in air - aiming up-left
; Top half - A1: Facing left-   turning - falling - aiming up-left
; Top half - A3: Facing left-   turning - crouching - aiming up-left
; 0422. Top half - C2: Facing left-   moonwalking - turn/jump right - aiming up-left
    dw SamusSpritemaps_99AE                                              ;9288D1;
    dw SamusSpritemaps_993E                                              ;9288D3;
    dw SamusSpritemaps_99CE                                              ;9288D5;
; Top half - 8D: Facing right - turning - standing - aiming down-right
; Top half - 91: Facing right - turning - in air - aiming down/down-right
; Top half - 95: Facing right - turning - falling - aiming down/down-right
; Top half - 99: Facing right - turning - crouching - aiming down/down-right
; 0425. Top half - C3: Facing right - moonwalking - turn/jump left-   aiming down-right
    dw SamusSpritemaps_9AF7                                              ;9288D7;
    dw SamusSpritemaps_9954                                              ;9288D9;
    dw SamusSpritemaps_9AD7                                              ;9288DB;
; Top half - 8E: Facing left-   turning - standing - aiming down-left
; Top half - 92: Facing left-   turning - in air - aiming down/down-left
; Top half - 96: Facing left-   turning - falling - aiming down/down-left
; Top half - 9A: Facing left-   turning - crouching - aiming down/down-left
; 0428. Top half - C4: Facing left-   moonwalking - turn/jump right - aiming down-left
    dw SamusSpritemaps_9AD7                                              ;9288DD;
    dw SamusSpritemaps_9954                                              ;9288DF;
    dw SamusSpritemaps_9AF7                                              ;9288E1;
; 042B. Top half - EC: Facing right - grabbed by Draygon - not moving - not aiming
    dw SamusSpritemaps_9BAE                                              ;9288E3;
; 042C. Top half - ED: Facing right - grabbed by Draygon - not moving - aiming up-right
    dw SamusSpritemaps_9857                                              ;9288E5;
; 042D. Top half - EE: Facing right - grabbed by Draygon - firing
    dw SamusSpritemaps_977B                                              ;9288E7;
; 042E. Top half - EF: Facing right - grabbed by Draygon - not moving - aiming down-right
    dw SamusSpritemaps_9705                                              ;9288E9;
; 042F. Top half - BA: Facing left-   grabbed by Draygon - not moving - not aiming
    dw SamusSpritemaps_9BBF                                              ;9288EB;
; 0430. Top half - BB: Facing left-   grabbed by Draygon - not moving - aiming up-left
    dw SamusSpritemaps_9872                                              ;9288ED;
; 0431. Top half - BC: Facing left-   grabbed by Draygon - firing
    dw SamusSpritemaps_9796                                              ;9288EF;
; 0432. Top half - BD: Facing left-   grabbed by Draygon - not moving - aiming down-left
    dw SamusSpritemaps_9725                                              ;9288F1;
; 0433. Top half - F0: Facing right - grabbed by Draygon - moving
    dw SamusSpritemaps_9663                                              ;9288F3;
    dw SamusSpritemaps_966F                                              ;9288F5;
    dw SamusSpritemaps_9657                                              ;9288F7;
    dw SamusSpritemaps_9691                                              ;9288F9;
    dw SamusSpritemaps_969D                                              ;9288FB;
    dw SamusSpritemaps_9657                                              ;9288FD;
; 0439. Top half - BE: Facing left-   grabbed by Draygon - moving
    dw SamusSpritemaps_96BA                                              ;9288FF;
    dw SamusSpritemaps_96C6                                              ;928901;
    dw SamusSpritemaps_96AE                                              ;928903;
    dw SamusSpritemaps_96E8                                              ;928905;
    dw SamusSpritemaps_96F4                                              ;928907;
    dw SamusSpritemaps_96AE                                              ;928909;
; 043F. Top half - C9: Facing right - shinespark - horizontal
    dw SamusSpritemaps_9A93                                              ;92890B;
; 0440. Top half - CA: Facing left-   shinespark - horizontal
    dw SamusSpritemaps_9AAE                                              ;92890D;
; 0441. Top half - CD: Facing right - shinespark - diagonal
    dw SamusSpritemaps_9A93                                              ;92890F;
; 0442. Top half - CE: Facing left-   shinespark - diagonal
    dw SamusSpritemaps_9AAE                                              ;928911;
; 0443. Top half - D3: Facing right - crystal flash
    dw SamusSpritemaps_BCCC                                              ;928913;
    dw SamusSpritemaps_BCDD                                              ;928915;
    dw SamusSpritemaps_C207                                              ;928917;
    dw SamusSpritemaps_BCDD                                              ;928919;
    dw $0000                                                             ;92891B;
    dw $0000                                                             ;92891D;
    dw SamusSpritemaps_C207                                              ;92891F;
    dw SamusSpritemaps_C22C                                              ;928921;
    dw SamusSpritemaps_C251                                              ;928923;
    dw SamusSpritemaps_C22C                                              ;928925;
    dw $0000                                                             ;928927;
    dw $0000                                                             ;928929;
    dw SamusSpritemaps_BCDD                                              ;92892B;
    dw SamusSpritemaps_BCDD                                              ;92892D;
    dw SamusSpritemaps_977B                                              ;92892F;
; 0452. Top half - D4: Facing left-   crystal flash
    dw SamusSpritemaps_BCA0                                              ;928931;
    dw SamusSpritemaps_BCB1                                              ;928933;
    dw SamusSpritemaps_C198                                              ;928935;
    dw SamusSpritemaps_BCB1                                              ;928937;
    dw $0000                                                             ;928939;
    dw $0000                                                             ;92893B;
    dw SamusSpritemaps_C198                                              ;92893D;
    dw SamusSpritemaps_C1BD                                              ;92893F;
    dw SamusSpritemaps_C1E2                                              ;928941;
    dw SamusSpritemaps_C1BD                                              ;928943;
    dw $0000                                                             ;928945;
    dw $0000                                                             ;928947;
    dw SamusSpritemaps_BCB1                                              ;928949;
    dw SamusSpritemaps_BCB1                                              ;92894B;
    dw SamusSpritemaps_9796                                              ;92894D;
; 0461. Top half - D7: Facing right - crystal flash ending
    dw SamusSpritemaps_BAB3                                              ;92894F;
    dw SamusSpritemaps_BCCC                                              ;928951;
    dw SamusSpritemaps_BCDD                                              ;928953;
    dw SamusSpritemaps_977B                                              ;928955;
    dw SamusSpritemaps_98AD                                              ;928957;
    dw SamusSpritemaps_98AD                                              ;928959;
; 0467. Top half - D8: Facing left-   crystal flash ending
    dw SamusSpritemaps_BB16                                              ;92895B;
    dw SamusSpritemaps_BCA0                                              ;92895D;
    dw SamusSpritemaps_BCB1                                              ;92895F;
    dw SamusSpritemaps_9796                                              ;928961;
    dw SamusSpritemaps_9892                                              ;928963;
    dw SamusSpritemaps_9892                                              ;928965;
; 046D. Top half - E8: Facing right - Samus drained - crouching
    dw SamusSpritemaps_BAB3                                              ;928967;
    dw SamusSpritemaps_BCCC                                              ;928969;
    dw SamusSpritemaps_BCDD                                              ;92896B;
    dw SamusSpritemaps_98AD                                              ;92896D;
    dw SamusSpritemaps_98AD                                              ;92896F;
    dw SamusSpritemaps_98AD                                              ;928971;
    dw SamusSpritemaps_98AD                                              ;928973;
    dw SamusSpritemaps_98AD                                              ;928975;
    dw SamusSpritemaps_9F34                                              ;928977;
    dw SamusSpritemaps_9F59                                              ;928979;
    dw SamusSpritemaps_9F7E                                              ;92897B;
    dw SamusSpritemaps_9F59                                              ;92897D;
    dw $0000                                                             ;92897F;
    dw $0000                                                             ;928981;
    dw SamusSpritemaps_977B                                              ;928983;
; 047C. Top half - E9: Facing left-   Samus drained - crouching
    dw SamusSpritemaps_BCA0                                              ;928985;
    dw SamusSpritemaps_BCB1                                              ;928987;
    dw SamusSpritemaps_9892                                              ;928989;
    dw SamusSpritemaps_9892                                              ;92898B;
    dw SamusSpritemaps_9892                                              ;92898D;
    dw SamusSpritemaps_9892                                              ;92898F;
    dw SamusSpritemaps_9892                                              ;928991;
    dw SamusSpritemaps_9EF4                                              ;928993;
    dw SamusSpritemaps_9ED4                                              ;928995;
    dw SamusSpritemaps_9EF4                                              ;928997;
    dw SamusSpritemaps_9F14                                              ;928999;
    dw SamusSpritemaps_9EF4                                              ;92899B;
    dw $0000                                                             ;92899D;
    dw $0000                                                             ;92899F;
    dw SamusSpritemaps_9EF4                                              ;9289A1;
    dw SamusSpritemaps_9FC3                                              ;9289A3;
    dw SamusSpritemaps_9BA2                                              ;9289A5;
    dw $0000                                                             ;9289A7;
    dw $0000                                                             ;9289A9;
    dw SamusSpritemaps_9EF4                                              ;9289AB;
    dw SamusSpritemaps_9FC3                                              ;9289AD;
    dw SamusSpritemaps_9BA2                                              ;9289AF;
    dw SamusSpritemaps_9FC3                                              ;9289B1;
    dw SamusSpritemaps_9EF4                                              ;9289B3;
    dw $0000                                                             ;9289B5;
    dw $0000                                                             ;9289B7;
    dw SamusSpritemaps_9ED4                                              ;9289B9;
    dw $0000                                                             ;9289BB;
    dw $0000                                                             ;9289BD;
    dw SamusSpritemaps_9ED4                                              ;9289BF;
    dw $0000                                                             ;9289C1;
    dw $0000                                                             ;9289C3;
; 049C. Top half - EA: Facing right - Samus drained - standing
    dw SamusSpritemaps_A003                                              ;9289C5;
    dw SamusSpritemaps_A028                                              ;9289C7;
    dw SamusSpritemaps_A04D                                              ;9289C9;
    dw SamusSpritemaps_A028                                              ;9289CB;
    dw $0000                                                             ;9289CD;
    dw SamusSpritemaps_977B                                              ;9289CF;
; 04A2. Top half - EB: Facing left-   Samus drained - standing
    dw SamusSpritemaps_9FA3                                              ;9289D1;
    dw SamusSpritemaps_9FC3                                              ;9289D3;
    dw SamusSpritemaps_9FE3                                              ;9289D5;
    dw SamusSpritemaps_9FC3                                              ;9289D7;
    dw $0000                                                             ;9289D9;
    dw SamusSpritemaps_9796                                              ;9289DB;
    dw SamusSpritemaps_AD3C                                              ;9289DD;
    dw SamusSpritemaps_AD3C                                              ;9289DF;
; Bottom half - 01: Facing right - normal
; Bottom half - 47: Unused
; Bottom half - 89: Facing right - ran into a wall
; 04AA. Bottom half - A8: Unused
    dw SamusSpritemaps_ADBB                                              ;9289E1;
    dw SamusSpritemaps_AE98                                              ;9289E3;
    dw SamusSpritemaps_AEA9                                              ;9289E5;
    dw SamusSpritemaps_AE98                                              ;9289E7;
    dw $0000                                                             ;9289E9;
    dw SamusSpritemaps_ADBB                                              ;9289EB;
    dw SamusSpritemaps_AE98                                              ;9289ED;
    dw SamusSpritemaps_AEA9                                              ;9289EF;
    dw SamusSpritemaps_AE98                                              ;9289F1;
; Bottom half - 02: Facing left-   normal
; Bottom half - 48: Unused
; Bottom half - 8A: Facing left-   ran into a wall
; 04B3. Bottom half - A9: Unused
    dw SamusSpritemaps_B340                                              ;9289F3;
    dw SamusSpritemaps_AEBA                                              ;9289F5;
    dw SamusSpritemaps_AFA1                                              ;9289F7;
    dw SamusSpritemaps_AEBA                                              ;9289F9;
    dw $0000                                                             ;9289FB;
    dw SamusSpritemaps_B340                                              ;9289FD;
    dw SamusSpritemaps_AEBA                                              ;9289FF;
    dw SamusSpritemaps_AFA1                                              ;928A01;
    dw SamusSpritemaps_AEBA                                              ;928A03;
    dw SamusSpritemaps_ADBB                                              ;928A05;
    dw SamusSpritemaps_ADBB                                              ;928A07;
    dw SamusSpritemaps_B340                                              ;928A09;
    dw SamusSpritemaps_B340                                              ;928A0B;
; Bottom half - 03: Facing right - aiming up
; Bottom half - 05: Facing right - aiming up-right
; Bottom half - 07: Facing right - aiming down-right
; Bottom half - AA: Unused
; Bottom half - CF: Facing right - ran into a wall - aiming up-right
; 04C0. Bottom half - D1: Facing right - ran into a wall - aiming down-right
    dw SamusSpritemaps_B295                                              ;928A0D;
    dw SamusSpritemaps_B295                                              ;928A0F;
; Bottom half - 04: Facing left-   aiming up
; Bottom half - 06: Facing left-   aiming up-left
; Bottom half - 08: Facing left-   aiming down-left
; Bottom half - AB: Unused
; Bottom half - D0: Facing left-   ran into a wall - aiming up-left
; 04C2. Bottom half - D2: Facing left-   ran into a wall - aiming down-left
    dw SamusSpritemaps_B2AB                                              ;928A11;
    dw SamusSpritemaps_B2AB                                              ;928A13;
    dw SamusSpritemaps_AD3C                                              ;928A15;
; Bottom half - A4: Facing right - landing from normal jump
; Bottom half - E0: Facing right - landing from normal jump - aiming up
; Bottom half - E2: Facing right - landing from normal jump - aiming up-right
; Bottom half - E4: Facing right - landing from normal jump - aiming down-right
; 04C5. Bottom half - E6: Facing right - landing from normal jump - firing
    dw SamusSpritemaps_B021                                              ;928A17;
    dw SamusSpritemaps_ADBB                                              ;928A19;
; Bottom half - A5: Facing left-   landing from normal jump
; Bottom half - E1: Facing left-   landing from normal jump - aiming up
; Bottom half - E3: Facing left-   landing from normal jump - aiming up-left
; Bottom half - E5: Facing left-   landing from normal jump - aiming down-left
; 04C7. Bottom half - E7: Facing left-   landing from normal jump - firing
    dw SamusSpritemaps_B037                                              ;928A1B;
    dw SamusSpritemaps_B340                                              ;928A1D;
; 04C9. Bottom half - A6: Facing right - landing from spin jump
    dw SamusSpritemaps_B1C8                                              ;928A1F;
    dw SamusSpritemaps_B021                                              ;928A21;
    dw SamusSpritemaps_ADBB                                              ;928A23;
; 04CC. Bottom half - A7: Facing left-   landing from spin jump
    dw SamusSpritemaps_B1E3                                              ;928A25;
    dw SamusSpritemaps_B037                                              ;928A27;
    dw SamusSpritemaps_B340                                              ;928A29;
; 04CF. Bottom half - D5: Facing right - x-ray - standing
    dw SamusSpritemaps_ADBB                                              ;928A2B;
    dw SamusSpritemaps_ADBB                                              ;928A2D;
    dw SamusSpritemaps_ADBB                                              ;928A2F;
    dw SamusSpritemaps_ADBB                                              ;928A31;
    dw SamusSpritemaps_ADBB                                              ;928A33;
; 04D4. Bottom half - D6: Facing left-   x-ray - standing
    dw SamusSpritemaps_B340                                              ;928A35;
    dw SamusSpritemaps_B340                                              ;928A37;
    dw SamusSpritemaps_B340                                              ;928A39;
    dw SamusSpritemaps_B340                                              ;928A3B;
    dw SamusSpritemaps_B340                                              ;928A3D;
; 04D9. Bottom half - D9: Facing right - x-ray - crouching
    dw SamusSpritemaps_B351                                              ;928A3F;
    dw SamusSpritemaps_B351                                              ;928A41;
    dw SamusSpritemaps_B351                                              ;928A43;
    dw SamusSpritemaps_B351                                              ;928A45;
    dw SamusSpritemaps_B351                                              ;928A47;
; 04DE. Bottom half - DA: Facing left-   x-ray - crouching
    dw SamusSpritemaps_ADCC                                              ;928A49;
    dw SamusSpritemaps_ADCC                                              ;928A4B;
    dw SamusSpritemaps_ADCC                                              ;928A4D;
    dw SamusSpritemaps_ADCC                                              ;928A4F;
    dw SamusSpritemaps_ADCC                                              ;928A51;
; Bottom half - 09: Moving right - not aiming
; Bottom half - 0B: Moving right - gun extended
; Bottom half - 0D: Moving right - aiming up (unused)
; Bottom half - 0F: Moving right - aiming up-right
; Bottom half - 11: Moving right - aiming down-right
; 04E3. Bottom half - 45: Unused
    dw SamusSpritemaps_AD3C                                              ;928A53;
    dw SamusSpritemaps_ADD8                                              ;928A55;
    dw SamusSpritemaps_AD48                                              ;928A57;
    dw SamusSpritemaps_ADEE                                              ;928A59;
    dw SamusSpritemaps_AD63                                              ;928A5B;
    dw SamusSpritemaps_AD79                                              ;928A5D;
    dw SamusSpritemaps_AE0E                                              ;928A5F;
    dw SamusSpritemaps_AD85                                              ;928A61;
    dw SamusSpritemaps_AE24                                              ;928A63;
    dw SamusSpritemaps_ADA5                                              ;928A65;
; Bottom half - 0A: Moving left-   not aiming
; Bottom half - 0C: Moving left-   gun extended
; Bottom half - 0E: Moving left-   aiming up (unused)
; Bottom half - 10: Moving left-   aiming up-left
; Bottom half - 12: Moving left-   aiming down-left
; 04ED. Bottom half - 46: Unused
    dw SamusSpritemaps_B2C1                                              ;928A67;
    dw SamusSpritemaps_B35D                                              ;928A69;
    dw SamusSpritemaps_B2CD                                              ;928A6B;
    dw SamusSpritemaps_B373                                              ;928A6D;
    dw SamusSpritemaps_B2E8                                              ;928A6F;
    dw SamusSpritemaps_B2FE                                              ;928A71;
    dw SamusSpritemaps_B393                                              ;928A73;
    dw SamusSpritemaps_B30A                                              ;928A75;
    dw SamusSpritemaps_B3A9                                              ;928A77;
    dw SamusSpritemaps_B32A                                              ;928A79;
; Bottom half - 49: Facing left-   moonwalk
; Bottom half - 75: Facing left-   moonwalk - aiming up-left
; 04F7. Bottom half - 77: Facing left-   moonwalk - aiming down-left
    dw SamusSpritemaps_B3ED                                              ;928A7B;
    dw SamusSpritemaps_B403                                              ;928A7D;
    dw SamusSpritemaps_B184                                              ;928A7F;
    dw SamusSpritemaps_B3C9                                              ;928A81;
    dw SamusSpritemaps_B40F                                              ;928A83;
    dw SamusSpritemaps_B195                                              ;928A85;
; Bottom half - 4A: Facing right - moonwalk
; Bottom half - 76: Facing right - moonwalk - aiming up-right
; 04FD. Bottom half - 78: Facing right - moonwalk - aiming down-right
    dw SamusSpritemaps_AFF3                                              ;928A87;
    dw SamusSpritemaps_B009                                              ;928A89;
    dw SamusSpritemaps_B1A6                                              ;928A8B;
    dw SamusSpritemaps_AFCA                                              ;928A8D;
    dw SamusSpritemaps_B015                                              ;928A8F;
    dw SamusSpritemaps_B1B7                                              ;928A91;
; Bottom half - 17: Facing right - normal jump - aiming down
; 0503. Bottom half - AE: Unused
    dw SamusSpritemaps_B08D                                              ;928A93;
    dw SamusSpritemaps_B104                                              ;928A95;
; Bottom half - 18: Facing left-   normal jump - aiming down
; 0505. Bottom half - AF: Unused
    dw SamusSpritemaps_B09E                                              ;928A97;
    dw SamusSpritemaps_B124                                              ;928A99;
; Bottom half - 13: Facing right - normal jump - not aiming - not moving - gun extended
; 0507. Bottom half - AC: Unused
    dw SamusSpritemaps_B08D                                              ;928A9B;
    dw SamusSpritemaps_B1C8                                              ;928A9D;
; Bottom half - 14: Facing left-   normal jump - not aiming - not moving - gun extended
; 0509. Bottom half - AD: Unused
    dw SamusSpritemaps_B09E                                              ;928A9F;
    dw SamusSpritemaps_B1E3                                              ;928AA1;
; 050B. Bottom half - 15: Facing right - normal jump - aiming up
    dw SamusSpritemaps_B08D                                              ;928AA3;
    dw SamusSpritemaps_AEF7                                              ;928AA5;
; 050D. Bottom half - 16: Facing left-   normal jump - aiming up
    dw SamusSpritemaps_B09E                                              ;928AA7;
    dw SamusSpritemaps_AF08                                              ;928AA9;
; 050F. Bottom half - 51: Facing right - normal jump - not aiming - moving forward
    dw SamusSpritemaps_B08D                                              ;928AAB;
    dw SamusSpritemaps_B1C8                                              ;928AAD;
; 0511. Bottom half - 52: Facing left-   normal jump - not aiming - moving forward
    dw SamusSpritemaps_B09E                                              ;928AAF;
    dw SamusSpritemaps_B1E3                                              ;928AB1;
; 0513. Bottom half - 69: Facing right - normal jump - aiming up-right
    dw SamusSpritemaps_B08D                                              ;928AB3;
    dw SamusSpritemaps_AEF7                                              ;928AB5;
; 0515. Bottom half - 6A: Facing left-   normal jump - aiming up-left
    dw SamusSpritemaps_B09E                                              ;928AB7;
    dw SamusSpritemaps_AF08                                              ;928AB9;
; Bottom half - 6B: Facing right - normal jump - aiming down-right
; 0517. Bottom half - B0: Unused
    dw SamusSpritemaps_B08D                                              ;928ABB;
    dw SamusSpritemaps_B1C8                                              ;928ABD;
; Bottom half - 6C: Facing left-   normal jump - aiming down-left
; 0519. Bottom half - B1: Unused
    dw SamusSpritemaps_B09E                                              ;928ABF;
    dw SamusSpritemaps_B1E3                                              ;928AC1;
; Bottom half - 4B: Facing right - normal jump transition
; Bottom half - 55: Facing right - normal jump transition - aiming up
; Bottom half - 57: Facing right - normal jump transition - aiming up-right
; 051B. Bottom half - 59: Facing right - normal jump transition - aiming down-right
    dw SamusSpritemaps_B021                                              ;928AC3;
; Bottom half - 4C: Facing left-   normal jump transition
; Bottom half - 56: Facing left-   normal jump transition - aiming up
; Bottom half - 58: Facing left-   normal jump transition - aiming up-left
; 051C. Bottom half - 5A: Facing left-   normal jump transition - aiming down-left
    dw SamusSpritemaps_B037                                              ;928AC5;
; Bottom half - 4D: Facing right - normal jump - not aiming - not moving - gun not extended
; 051D. Bottom half - C7: Facing right - vertical shinespark windup
    dw SamusSpritemaps_AD79                                              ;928AC7;
    dw SamusSpritemaps_B0C7                                              ;928AC9;
    dw SamusSpritemaps_B04D                                              ;928ACB;
    dw SamusSpritemaps_B04D                                              ;928ACD;
    dw SamusSpritemaps_B08D                                              ;928ACF;
    dw SamusSpritemaps_B0AF                                              ;928AD1;
; Bottom half - 4E: Facing left-   normal jump - not aiming - not moving - gun not extended
; 0523. Bottom half - C8: Facing left-   vertical shinespark windup
    dw SamusSpritemaps_B2FE                                              ;928AD3;
    dw SamusSpritemaps_B0E2                                              ;928AD5;
    dw SamusSpritemaps_B06D                                              ;928AD7;
    dw SamusSpritemaps_B06D                                              ;928AD9;
    dw SamusSpritemaps_B09E                                              ;928ADB;
    dw SamusSpritemaps_B0BB                                              ;928ADD;
; 0529. Bottom half - 4F: Facing left-   damage boost
    dw SamusSpritemaps_AECB                                              ;928ADF;
    dw SamusSpritemaps_B09E                                              ;928AE1;
    dw $0000                                                             ;928AE3;
    dw $0000                                                             ;928AE5;
    dw $0000                                                             ;928AE7;
    dw $0000                                                             ;928AE9;
    dw $0000                                                             ;928AEB;
    dw $0000                                                             ;928AED;
    dw $0000                                                             ;928AEF;
    dw SamusSpritemaps_B1E3                                              ;928AF1;
; 0533. Bottom half - 50: Facing right - damage boost
    dw SamusSpritemaps_AEE1                                              ;928AF3;
    dw SamusSpritemaps_B08D                                              ;928AF5;
    dw $0000                                                             ;928AF7;
    dw $0000                                                             ;928AF9;
    dw $0000                                                             ;928AFB;
    dw $0000                                                             ;928AFD;
    dw $0000                                                             ;928AFF;
    dw $0000                                                             ;928B01;
    dw $0000                                                             ;928B03;
    dw SamusSpritemaps_B1C8                                              ;928B05;
; 053D. Bottom half - 63: Unused
    dw SamusSpritemaps_B184                                              ;928B07;
    dw SamusSpritemaps_AF69                                              ;928B09;
; 053F. Bottom half - 64: Unused
    dw SamusSpritemaps_B195                                              ;928B0B;
    dw SamusSpritemaps_AF5D                                              ;928B0D;
; 0541. Bottom half - 65: Unused
    dw SamusSpritemaps_B144                                              ;928B0F;
    dw SamusSpritemaps_BB22                                              ;928B11;
    dw SamusSpritemaps_BB2E                                              ;928B13;
    dw SamusSpritemaps_BB44                                              ;928B15;
    dw SamusSpritemaps_BB50                                              ;928B17;
    dw SamusSpritemaps_BB66                                              ;928B19;
    dw SamusSpritemaps_BB72                                              ;928B1B;
    dw SamusSpritemaps_BB88                                              ;928B1D;
    dw SamusSpritemaps_BB94                                              ;928B1F;
; 054A. Bottom half - 66: Unused
    dw SamusSpritemaps_B169                                              ;928B21;
    dw SamusSpritemaps_BD67                                              ;928B23;
    dw SamusSpritemaps_BD73                                              ;928B25;
    dw SamusSpritemaps_BD89                                              ;928B27;
    dw SamusSpritemaps_BD95                                              ;928B29;
    dw SamusSpritemaps_BDAB                                              ;928B2B;
    dw SamusSpritemaps_BDB7                                              ;928B2D;
    dw SamusSpritemaps_BDCD                                              ;928B2F;
    dw SamusSpritemaps_BDD9                                              ;928B31;
; 0553. Bottom half - 83: Facing right - wall jump
    dw SamusSpritemaps_B144                                              ;928B33;
    dw SamusSpritemaps_B1C8                                              ;928B35;
    dw $0000                                                             ;928B37;
    dw $0000                                                             ;928B39;
    dw $0000                                                             ;928B3B;
    dw $0000                                                             ;928B3D;
    dw $0000                                                             ;928B3F;
    dw $0000                                                             ;928B41;
    dw $0000                                                             ;928B43;
    dw $0000                                                             ;928B45;
    dw $0000                                                             ;928B47;
    dw $0000                                                             ;928B49;
    dw $0000                                                             ;928B4B;
    dw SamusSpritemaps_C458                                              ;928B4D;
    dw SamusSpritemaps_C46E                                              ;928B4F;
    dw SamusSpritemaps_C4A2                                              ;928B51;
    dw SamusSpritemaps_C4B8                                              ;928B53;
    dw SamusSpritemaps_C4EC                                              ;928B55;
    dw SamusSpritemaps_C502                                              ;928B57;
    dw SamusSpritemaps_C536                                              ;928B59;
    dw SamusSpritemaps_C54C                                              ;928B5B;
    dw $0000                                                             ;928B5D;
    dw $0000                                                             ;928B5F;
    dw SamusSpritemaps_C458                                              ;928B61;
    dw SamusSpritemaps_C46E                                              ;928B63;
    dw SamusSpritemaps_C4A2                                              ;928B65;
    dw SamusSpritemaps_C4B8                                              ;928B67;
    dw SamusSpritemaps_C4EC                                              ;928B69;
    dw SamusSpritemaps_C502                                              ;928B6B;
    dw SamusSpritemaps_C536                                              ;928B6D;
    dw SamusSpritemaps_C54C                                              ;928B6F;
    dw SamusSpritemaps_C458                                              ;928B71;
    dw SamusSpritemaps_C46E                                              ;928B73;
    dw SamusSpritemaps_C4A2                                              ;928B75;
    dw SamusSpritemaps_C4B8                                              ;928B77;
    dw SamusSpritemaps_C4EC                                              ;928B79;
    dw SamusSpritemaps_C502                                              ;928B7B;
    dw SamusSpritemaps_C536                                              ;928B7D;
    dw SamusSpritemaps_C54C                                              ;928B7F;
    dw SamusSpritemaps_C458                                              ;928B81;
    dw SamusSpritemaps_C46E                                              ;928B83;
    dw SamusSpritemaps_C4A2                                              ;928B85;
    dw SamusSpritemaps_C4B8                                              ;928B87;
    dw SamusSpritemaps_C4EC                                              ;928B89;
    dw SamusSpritemaps_C502                                              ;928B8B;
    dw SamusSpritemaps_C536                                              ;928B8D;
    dw SamusSpritemaps_C54C                                              ;928B8F;
; 0582. Bottom half - 84: Facing left-   wall jump
    dw SamusSpritemaps_B169                                              ;928B91;
    dw SamusSpritemaps_B1E3                                              ;928B93;
    dw $0000                                                             ;928B95;
    dw $0000                                                             ;928B97;
    dw $0000                                                             ;928B99;
    dw $0000                                                             ;928B9B;
    dw $0000                                                             ;928B9D;
    dw $0000                                                             ;928B9F;
    dw $0000                                                             ;928BA1;
    dw $0000                                                             ;928BA3;
    dw $0000                                                             ;928BA5;
    dw $0000                                                             ;928BA7;
    dw $0000                                                             ;928BA9;
    dw SamusSpritemaps_C330                                              ;928BAB;
    dw SamusSpritemaps_C346                                              ;928BAD;
    dw SamusSpritemaps_C37A                                              ;928BAF;
    dw SamusSpritemaps_C390                                              ;928BB1;
    dw SamusSpritemaps_C3C4                                              ;928BB3;
    dw SamusSpritemaps_C3DA                                              ;928BB5;
    dw SamusSpritemaps_C40E                                              ;928BB7;
    dw SamusSpritemaps_C424                                              ;928BB9;
    dw $0000                                                             ;928BBB;
    dw $0000                                                             ;928BBD;
    dw SamusSpritemaps_C330                                              ;928BBF;
    dw SamusSpritemaps_C346                                              ;928BC1;
    dw SamusSpritemaps_C37A                                              ;928BC3;
    dw SamusSpritemaps_C390                                              ;928BC5;
    dw SamusSpritemaps_C3C4                                              ;928BC7;
    dw SamusSpritemaps_C3DA                                              ;928BC9;
    dw SamusSpritemaps_C40E                                              ;928BCB;
    dw SamusSpritemaps_C424                                              ;928BCD;
    dw SamusSpritemaps_C330                                              ;928BCF;
    dw SamusSpritemaps_C346                                              ;928BD1;
    dw SamusSpritemaps_C37A                                              ;928BD3;
    dw SamusSpritemaps_C390                                              ;928BD5;
    dw SamusSpritemaps_C3C4                                              ;928BD7;
    dw SamusSpritemaps_C3DA                                              ;928BD9;
    dw SamusSpritemaps_C40E                                              ;928BDB;
    dw SamusSpritemaps_C424                                              ;928BDD;
    dw SamusSpritemaps_C330                                              ;928BDF;
    dw SamusSpritemaps_C346                                              ;928BE1;
    dw SamusSpritemaps_C37A                                              ;928BE3;
    dw SamusSpritemaps_C390                                              ;928BE5;
    dw SamusSpritemaps_C3C4                                              ;928BE7;
    dw SamusSpritemaps_C3DA                                              ;928BE9;
    dw SamusSpritemaps_C40E                                              ;928BEB;
    dw SamusSpritemaps_C424                                              ;928BED;
; 05B1. Bottom half - 53: Facing right - knockback
    dw SamusSpritemaps_B0AF                                              ;928BEF;
    dw SamusSpritemaps_B1FE                                              ;928BF1;
; 05B3. Bottom half - 54: Facing left-   knockback
    dw SamusSpritemaps_B0BB                                              ;928BF3;
    dw SamusSpritemaps_B214                                              ;928BF5;
; Bottom half - 5B: Unused
; 05B5. Bottom half - B8: Facing left-   grapple wall jump pose
    dw SamusSpritemaps_AF69                                              ;928BF7;
; Bottom half - 5C: Unused
; 05B6. Bottom half - B9: Facing right - grapple wall jump pose
    dw SamusSpritemaps_AF5D                                              ;928BF9;
; Bottom half - 5D: Unused
; Bottom half - 5E: Unused
; Bottom half - 5F: Unused
; Bottom half - 60: Unused
; Bottom half - 61: Unused
; 05B7. Bottom half - B2: Facing clockwise   -   grapple
    dw SamusSpritemaps_B63F                                              ;928BFB;
    dw SamusSpritemaps_B624                                              ;928BFD;
    dw SamusSpritemaps_B60E                                              ;928BFF;
    dw SamusSpritemaps_B5FD                                              ;928C01;
    dw SamusSpritemaps_B5FD                                              ;928C03;
    dw SamusSpritemaps_B5DD                                              ;928C05;
    dw SamusSpritemaps_B5DD                                              ;928C07;
    dw SamusSpritemaps_B5CC                                              ;928C09;
    dw SamusSpritemaps_B5CC                                              ;928C0B;
    dw SamusSpritemaps_B5CC                                              ;928C0D;
    dw SamusSpritemaps_B4E6                                              ;928C0F;
    dw SamusSpritemaps_B4E6                                              ;928C11;
    dw SamusSpritemaps_B4D0                                              ;928C13;
    dw SamusSpritemaps_B4D0                                              ;928C15;
    dw SamusSpritemaps_B4BA                                              ;928C17;
    dw SamusSpritemaps_B4A9                                              ;928C19;
    dw SamusSpritemaps_B48E                                              ;928C1B;
    dw SamusSpritemaps_B473                                              ;928C1D;
    dw SamusSpritemaps_B45D                                              ;928C1F;
    dw SamusSpritemaps_B44C                                              ;928C21;
    dw SamusSpritemaps_B44C                                              ;928C23;
    dw SamusSpritemaps_B42C                                              ;928C25;
    dw SamusSpritemaps_B42C                                              ;928C27;
    dw SamusSpritemaps_B41B                                              ;928C29;
    dw SamusSpritemaps_B41B                                              ;928C2B;
    dw SamusSpritemaps_B41B                                              ;928C2D;
    dw SamusSpritemaps_B697                                              ;928C2F;
    dw SamusSpritemaps_B697                                              ;928C31;
    dw SamusSpritemaps_B681                                              ;928C33;
    dw SamusSpritemaps_B681                                              ;928C35;
    dw SamusSpritemaps_B66B                                              ;928C37;
    dw SamusSpritemaps_B65A                                              ;928C39;
    dw SamusSpritemaps_B72B                                              ;928C3B;
    dw SamusSpritemaps_B715                                              ;928C3D;
    dw SamusSpritemaps_B709                                              ;928C3F;
    dw SamusSpritemaps_B6FD                                              ;928C41;
    dw SamusSpritemaps_B6FD                                              ;928C43;
    dw SamusSpritemaps_B6E7                                              ;928C45;
    dw SamusSpritemaps_B6E7                                              ;928C47;
    dw SamusSpritemaps_B6DB                                              ;928C49;
    dw SamusSpritemaps_B6DB                                              ;928C4B;
    dw SamusSpritemaps_B6DB                                              ;928C4D;
    dw SamusSpritemaps_B5B4                                              ;928C4F;
    dw SamusSpritemaps_B5B4                                              ;928C51;
    dw SamusSpritemaps_B59E                                              ;928C53;
    dw SamusSpritemaps_B59E                                              ;928C55;
    dw SamusSpritemaps_B592                                              ;928C57;
    dw SamusSpritemaps_B586                                              ;928C59;
    dw SamusSpritemaps_B57A                                              ;928C5B;
    dw SamusSpritemaps_B564                                              ;928C5D;
    dw SamusSpritemaps_B558                                              ;928C5F;
    dw SamusSpritemaps_B54C                                              ;928C61;
    dw SamusSpritemaps_B54C                                              ;928C63;
    dw SamusSpritemaps_B536                                              ;928C65;
    dw SamusSpritemaps_B536                                              ;928C67;
    dw SamusSpritemaps_B52A                                              ;928C69;
    dw SamusSpritemaps_B52A                                              ;928C6B;
    dw SamusSpritemaps_B52A                                              ;928C6D;
    dw SamusSpritemaps_B74F                                              ;928C6F;
    dw SamusSpritemaps_B74F                                              ;928C71;
    dw SamusSpritemaps_B743                                              ;928C73;
    dw SamusSpritemaps_B743                                              ;928C75;
    dw SamusSpritemaps_B737                                              ;928C77;
    dw SamusSpritemaps_B72B                                              ;928C79;
    dw SamusSpritemaps_B512                                              ;928C7B;
    dw SamusSpritemaps_B51E                                              ;928C7D;
; Bottom half - 62: Unused
; 05F9. Bottom half - B3: Facing anticlockwise - grapple
    dw SamusSpritemaps_B98B                                              ;928C7F;
    dw SamusSpritemaps_B9A6                                              ;928C81;
    dw SamusSpritemaps_B9B7                                              ;928C83;
    dw SamusSpritemaps_B9CD                                              ;928C85;
    dw SamusSpritemaps_B9CD                                              ;928C87;
    dw SamusSpritemaps_B9E3                                              ;928C89;
    dw SamusSpritemaps_B9E3                                              ;928C8B;
    dw SamusSpritemaps_B767                                              ;928C8D;
    dw SamusSpritemaps_B767                                              ;928C8F;
    dw SamusSpritemaps_B767                                              ;928C91;
    dw SamusSpritemaps_B778                                              ;928C93;
    dw SamusSpritemaps_B778                                              ;928C95;
    dw SamusSpritemaps_B798                                              ;928C97;
    dw SamusSpritemaps_B798                                              ;928C99;
    dw SamusSpritemaps_B7A9                                              ;928C9B;
    dw SamusSpritemaps_B7BF                                              ;928C9D;
    dw SamusSpritemaps_B7DA                                              ;928C9F;
    dw SamusSpritemaps_B7F5                                              ;928CA1;
    dw SamusSpritemaps_B806                                              ;928CA3;
    dw SamusSpritemaps_B81C                                              ;928CA5;
    dw SamusSpritemaps_B81C                                              ;928CA7;
    dw SamusSpritemaps_B832                                              ;928CA9;
    dw SamusSpritemaps_B832                                              ;928CAB;
    dw SamusSpritemaps_B918                                              ;928CAD;
    dw SamusSpritemaps_B918                                              ;928CAF;
    dw SamusSpritemaps_B918                                              ;928CB1;
    dw SamusSpritemaps_B929                                              ;928CB3;
    dw SamusSpritemaps_B929                                              ;928CB5;
    dw SamusSpritemaps_B949                                              ;928CB7;
    dw SamusSpritemaps_B949                                              ;928CB9;
    dw SamusSpritemaps_B95A                                              ;928CBB;
    dw SamusSpritemaps_B970                                              ;928CBD;
    dw SamusSpritemaps_BA77                                              ;928CBF;
    dw SamusSpritemaps_BA83                                              ;928CC1;
    dw SamusSpritemaps_BA8F                                              ;928CC3;
    dw SamusSpritemaps_BA9B                                              ;928CC5;
    dw SamusSpritemaps_BA9B                                              ;928CC7;
    dw SamusSpritemaps_BAA7                                              ;928CC9;
    dw SamusSpritemaps_BAA7                                              ;928CCB;
    dw SamusSpritemaps_B876                                              ;928CCD;
    dw SamusSpritemaps_B876                                              ;928CCF;
    dw SamusSpritemaps_B876                                              ;928CD1;
    dw SamusSpritemaps_B882                                              ;928CD3;
    dw SamusSpritemaps_B882                                              ;928CD5;
    dw SamusSpritemaps_B898                                              ;928CD7;
    dw SamusSpritemaps_B898                                              ;928CD9;
    dw SamusSpritemaps_B8A4                                              ;928CDB;
    dw SamusSpritemaps_B8B0                                              ;928CDD;
    dw SamusSpritemaps_B8C6                                              ;928CDF;
    dw SamusSpritemaps_B8D2                                              ;928CE1;
    dw SamusSpritemaps_B8DE                                              ;928CE3;
    dw SamusSpritemaps_B8EA                                              ;928CE5;
    dw SamusSpritemaps_B8EA                                              ;928CE7;
    dw SamusSpritemaps_B900                                              ;928CE9;
    dw SamusSpritemaps_B900                                              ;928CEB;
    dw SamusSpritemaps_BA27                                              ;928CED;
    dw SamusSpritemaps_BA27                                              ;928CEF;
    dw SamusSpritemaps_BA27                                              ;928CF1;
    dw SamusSpritemaps_BA33                                              ;928CF3;
    dw SamusSpritemaps_BA33                                              ;928CF5;
    dw SamusSpritemaps_BA49                                              ;928CF7;
    dw SamusSpritemaps_BA49                                              ;928CF9;
    dw SamusSpritemaps_BA55                                              ;928CFB;
    dw SamusSpritemaps_BA61                                              ;928CFD;
    dw SamusSpritemaps_B85E                                              ;928CFF;
    dw SamusSpritemaps_B86A                                              ;928D01;
; Bottom half - 29: Facing right - falling
; 063B. Bottom half - 67: Facing right - falling - gun extended
    dw SamusSpritemaps_B08D                                              ;928D03;
    dw SamusSpritemaps_B0AF                                              ;928D05;
    dw SamusSpritemaps_B0AF                                              ;928D07;
    dw $0000                                                             ;928D09;
    dw $0000                                                             ;928D0B;
    dw SamusSpritemaps_B08D                                              ;928D0D;
    dw SamusSpritemaps_B1C8                                              ;928D0F;
; Bottom half - 2A: Facing left-   falling
; 0642. Bottom half - 68: Facing left-   falling - gun extended
    dw SamusSpritemaps_B09E                                              ;928D11;
    dw SamusSpritemaps_B0BB                                              ;928D13;
    dw SamusSpritemaps_B0BB                                              ;928D15;
    dw $0000                                                             ;928D17;
    dw $0000                                                             ;928D19;
    dw SamusSpritemaps_B09E                                              ;928D1B;
    dw SamusSpritemaps_B1E3                                              ;928D1D;
; 0649. Bottom half - 2D: Facing right - falling - aiming down
    dw SamusSpritemaps_B08D                                              ;928D1F;
    dw SamusSpritemaps_B104                                              ;928D21;
; 064B. Bottom half - 2E: Facing left-   falling - aiming down
    dw SamusSpritemaps_B09E                                              ;928D23;
    dw SamusSpritemaps_B124                                              ;928D25;
; 064D. Bottom half - 2B: Facing right - falling - aiming up
    dw SamusSpritemaps_B08D                                              ;928D27;
    dw SamusSpritemaps_B0AF                                              ;928D29;
    dw SamusSpritemaps_B1C8                                              ;928D2B;
; 0650. Bottom half - 2C: Facing left-   falling - aiming up
    dw SamusSpritemaps_B09E                                              ;928D2D;
    dw SamusSpritemaps_B0BB                                              ;928D2F;
    dw SamusSpritemaps_B1E3                                              ;928D31;
; 0653. Bottom half - 6D: Facing right - falling - aiming up-right
    dw SamusSpritemaps_B08D                                              ;928D33;
    dw SamusSpritemaps_B0AF                                              ;928D35;
    dw SamusSpritemaps_B1C8                                              ;928D37;
; 0656. Bottom half - 6E: Facing left-   falling - aiming up-left
    dw SamusSpritemaps_B09E                                              ;928D39;
    dw SamusSpritemaps_B0BB                                              ;928D3B;
    dw SamusSpritemaps_B1E3                                              ;928D3D;
; 0659. Bottom half - 6F: Facing right - falling - aiming down-right
    dw SamusSpritemaps_B08D                                              ;928D3F;
    dw SamusSpritemaps_B0AF                                              ;928D41;
    dw SamusSpritemaps_B1C8                                              ;928D43;
; 065C. Bottom half - 70: Facing left-   falling - aiming down-left
    dw SamusSpritemaps_B09E                                              ;928D45;
    dw SamusSpritemaps_B0BB                                              ;928D47;
    dw SamusSpritemaps_B1E3                                              ;928D49;
; Bottom half - 27: Facing right - crouching
; 065F. Bottom half - B4: Unused
    dw SamusSpritemaps_B351                                              ;928D4B;
    dw SamusSpritemaps_B351                                              ;928D4D;
    dw SamusSpritemaps_B351                                              ;928D4F;
    dw SamusSpritemaps_B351                                              ;928D51;
    dw $0000                                                             ;928D53;
    dw SamusSpritemaps_B351                                              ;928D55;
    dw SamusSpritemaps_B351                                              ;928D57;
    dw SamusSpritemaps_B351                                              ;928D59;
    dw SamusSpritemaps_B351                                              ;928D5B;
; Bottom half - 28: Facing left-   crouching
; 0668. Bottom half - B5: Unused
    dw SamusSpritemaps_ADCC                                              ;928D5D;
    dw SamusSpritemaps_ADCC                                              ;928D5F;
    dw SamusSpritemaps_ADCC                                              ;928D61;
    dw SamusSpritemaps_ADCC                                              ;928D63;
    dw $0000                                                             ;928D65;
    dw SamusSpritemaps_ADCC                                              ;928D67;
    dw SamusSpritemaps_ADCC                                              ;928D69;
    dw SamusSpritemaps_ADCC                                              ;928D6B;
    dw SamusSpritemaps_ADCC                                              ;928D6D;
; 0671. Bottom half - 71: Facing right - crouching - aiming up-right
    dw SamusSpritemaps_B351                                              ;928D6F;
; 0672. Bottom half - 72: Facing left-   crouching - aiming up-left
    dw SamusSpritemaps_ADCC                                              ;928D71;
; Bottom half - 73: Facing right - crouching - aiming down-right
; 0673. Bottom half - B6: Unused
    dw SamusSpritemaps_B351                                              ;928D73;
; Bottom half - 74: Facing left-   crouching - aiming down-left
; 0674. Bottom half - B7: Unused
    dw SamusSpritemaps_ADCC                                              ;928D75;
; 0675. Bottom half - 85: Facing right - crouching - aiming up
    dw SamusSpritemaps_B351                                              ;928D77;
    dw SamusSpritemaps_B351                                              ;928D79;
; 0677. Bottom half - 86: Facing left-   crouching - aiming up
    dw SamusSpritemaps_ADCC                                              ;928D7B;
    dw SamusSpritemaps_ADCC                                              ;928D7D;
; Bottom half - 35: Facing right - crouching transition
; Bottom half - 3B: Facing right - standing transition
; Bottom half - F1: Facing right - crouching transition - aiming up
; Bottom half - F3: Facing right - crouching transition - aiming up-right
; Bottom half - F5: Facing right - crouching transition - aiming down-right
; Bottom half - F7: Facing right - standing transition - aiming up
; Bottom half - F9: Facing right - standing transition - aiming up-right
; 0679. Bottom half - FB: Facing right - standing transition - aiming down-right
    dw SamusSpritemaps_B021                                              ;928D7F;
; Bottom half - 36: Facing left-   crouching transition
; Bottom half - 3C: Facing left-   standing transition
; Bottom half - F2: Facing left-   crouching transition - aiming up
; Bottom half - F4: Facing left-   crouching transition - aiming up-left
; Bottom half - F6: Facing left-   crouching transition - aiming down-left
; Bottom half - F8: Facing left-   standing transition - aiming up
; Bottom half - FA: Facing left-   standing transition - aiming up-left
; 067A. Bottom half - FC: Facing left-   standing transition - aiming down-left
    dw SamusSpritemaps_B037                                              ;928D81;
    dw $0000                                                             ;928D83;
    dw $0000                                                             ;928D85;
; 067D. Bottom half - DB: Unused
    dw SamusSpritemaps_B021                                              ;928D87;
    dw $0000                                                             ;928D89;
    dw $0000                                                             ;928D8B;
; 0680. Bottom half - DC: Unused
    dw SamusSpritemaps_B021                                              ;928D8D;
; 0681. Bottom half - DD: Unused
    dw $0000                                                             ;928D8F;
    dw $0000                                                             ;928D91;
    dw SamusSpritemaps_B021                                              ;928D93;
; 0684. Bottom half - DE: Unused
    dw $0000                                                             ;928D95;
    dw $0000                                                             ;928D97;
    dw SamusSpritemaps_B021                                              ;928D99;
; Bottom half - 25: Facing right - turning - standing
; Bottom half - 8B: Facing right - turning - standing - aiming up
; Bottom half - 8D: Facing right - turning - standing - aiming down-right
; Bottom half - 9C: Facing right - turning - standing - aiming up-right
; Bottom half - BF: Facing right - moonwalking - turn/jump left
; Bottom half - C1: Facing right - moonwalking - turn/jump left-   aiming up-right
; Bottom half - C3: Facing right - moonwalking - turn/jump left-   aiming down-right
    dw SamusSpritemaps_AF2A                                              ;928D9B;
    dw SamusSpritemaps_AFE0                                              ;928D9D;
    dw SamusSpritemaps_AF19                                              ;928D9F;
; Bottom half - 26: Facing left-   turning - standing
; Bottom half - 8C: Facing left-   turning - standing - aiming up
; Bottom half - 8E: Facing left-   turning - standing - aiming down-left
; Bottom half - 9D: Facing left-   turning - standing - aiming up-left
; Bottom half - C0: Facing left-   moonwalking - turn/jump right
; Bottom half - C2: Facing left-   moonwalking - turn/jump right - aiming up-left
; 068A. Bottom half - C4: Facing left-   moonwalking - turn/jump right - aiming down-left
    dw SamusSpritemaps_AF19                                              ;928DA1;
    dw SamusSpritemaps_AFE0                                              ;928DA3;
    dw SamusSpritemaps_AF2A                                              ;928DA5;
; Bottom half - 2F: Facing right - turning - jumping
; Bottom half - 43: Facing right - turning - crouching
; Bottom half - 87: Facing right - turning - falling
; Bottom half - 8F: Facing right - turning - in air - aiming up
; Bottom half - 91: Facing right - turning - in air - aiming down/down-right
; Bottom half - 93: Facing right - turning - falling - aiming up
; Bottom half - 95: Facing right - turning - falling - aiming down/down-right
; Bottom half - 97: Facing right - turning - crouching - aiming up
; Bottom half - 99: Facing right - turning - crouching - aiming down/down-right
; Bottom half - 9E: Facing right - turning - in air - aiming up-right
; Bottom half - A0: Facing right - turning - falling - aiming up-right
; 068D. Bottom half - A2: Facing right - turning - crouching - aiming up-right
    dw SamusSpritemaps_AF4C                                              ;928DA7;
    dw SamusSpritemaps_AFEC                                              ;928DA9;
    dw SamusSpritemaps_AF3B                                              ;928DAB;
; Bottom half - 30: Facing left-   turning - jumping
; Bottom half - 44: Facing left-   turning - crouching
; Bottom half - 90: Facing left-   turning - in air - aiming up
; Bottom half - 92: Facing left-   turning - in air - aiming down/down-left
; Bottom half - 98: Facing left-   turning - crouching - aiming up
; Bottom half - 9A: Facing left-   turning - crouching - aiming down/down-left
; Bottom half - 9F: Facing left-   turning - in air - aiming up-left
; 0690. Bottom half - A3: Facing left-   turning - crouching - aiming up-left
    dw SamusSpritemaps_AF3B                                              ;928DAD;
    dw SamusSpritemaps_AFEC                                              ;928DAF;
    dw SamusSpritemaps_AF4C                                              ;928DB1;
    dw SamusSpritemaps_AF4C                                              ;928DB3;
    dw SamusSpritemaps_AFEC                                              ;928DB5;
    dw SamusSpritemaps_AF3B                                              ;928DB7;
; Bottom half - 88: Facing left-   turning - falling
; Bottom half - 94: Facing left-   turning - falling - aiming up
; Bottom half - 96: Facing left-   turning - falling - aiming down/down-left
; 0696. Bottom half - A1: Facing left-   turning - falling - aiming up-left
    dw SamusSpritemaps_AF3B                                              ;928DB9;
    dw SamusSpritemaps_AFEC                                              ;928DBB;
    dw SamusSpritemaps_AF4C                                              ;928DBD;
; Bottom half - EC: Facing right - grabbed by Draygon - not moving - not aiming
; Bottom half - ED: Facing right - grabbed by Draygon - not moving - aiming up-right
; Bottom half - EE: Facing right - grabbed by Draygon - firing
; 0699. Bottom half - EF: Facing right - grabbed by Draygon - not moving - aiming down-right
    dw SamusSpritemaps_B1FE                                              ;928DBF;
; Bottom half - BA: Facing left-   grabbed by Draygon - not moving - not aiming
; Bottom half - BB: Facing left-   grabbed by Draygon - not moving - aiming up-left
; Bottom half - BC: Facing left-   grabbed by Draygon - firing
; 069A. Bottom half - BD: Facing left-   grabbed by Draygon - not moving - aiming down-left
    dw SamusSpritemaps_B214                                              ;928DC1;
; 069B. Bottom half - F0: Facing right - grabbed by Draygon - moving
    dw SamusSpritemaps_B0AF                                              ;928DC3;
    dw SamusSpritemaps_B1FE                                              ;928DC5;
    dw SamusSpritemaps_B1C8                                              ;928DC7;
    dw SamusSpritemaps_B0AF                                              ;928DC9;
    dw SamusSpritemaps_B0C7                                              ;928DCB;
    dw SamusSpritemaps_B04D                                              ;928DCD;
; 06A1. Bottom half - BE: Facing left-   grabbed by Draygon - moving
    dw SamusSpritemaps_B0BB                                              ;928DCF;
    dw SamusSpritemaps_B214                                              ;928DD1;
    dw SamusSpritemaps_B1E3                                              ;928DD3;
    dw SamusSpritemaps_B0BB                                              ;928DD5;
    dw SamusSpritemaps_B0E2                                              ;928DD7;
    dw SamusSpritemaps_B06D                                              ;928DD9;
; 06A7. Bottom half - C9: Facing right - shinespark - horizontal
    dw SamusSpritemaps_AF75                                              ;928DDB;
; 06A8. Bottom half - CA: Facing left-   shinespark - horizontal
    dw SamusSpritemaps_AF8B                                              ;928DDD;
; 06A9. Bottom half - CD: Facing right - shinespark - diagonal
    dw SamusSpritemaps_AF75                                              ;928DDF;
; 06AA. Bottom half - CE: Facing left-   shinespark - diagonal
    dw SamusSpritemaps_AF8B                                              ;928DE1;
; 06AB. Bottom half - D3: Facing right - crystal flash
    dw SamusSpritemaps_C276                                              ;928DE3;
    dw SamusSpritemaps_C28C                                              ;928DE5;
    dw SamusSpritemaps_C2DE                                              ;928DE7;
    dw SamusSpritemaps_C2DE                                              ;928DE9;
    dw $0000                                                             ;928DEB;
    dw $0000                                                             ;928DED;
    dw SamusSpritemaps_C2DE                                              ;928DEF;
    dw SamusSpritemaps_C2DE                                              ;928DF1;
    dw SamusSpritemaps_C2DE                                              ;928DF3;
    dw SamusSpritemaps_C2DE                                              ;928DF5;
    dw $0000                                                             ;928DF7;
    dw $0000                                                             ;928DF9;
    dw SamusSpritemaps_C28C                                              ;928DFB;
    dw SamusSpritemaps_C276                                              ;928DFD;
    dw SamusSpritemaps_B021                                              ;928DFF;
; 06BA. Bottom half - D4: Facing left-   crystal flash
    dw SamusSpritemaps_C276                                              ;928E01;
    dw SamusSpritemaps_C28C                                              ;928E03;
    dw SamusSpritemaps_C2DE                                              ;928E05;
    dw SamusSpritemaps_C2DE                                              ;928E07;
    dw $0000                                                             ;928E09;
    dw $0000                                                             ;928E0B;
    dw SamusSpritemaps_C2DE                                              ;928E0D;
    dw SamusSpritemaps_C2DE                                              ;928E0F;
    dw SamusSpritemaps_C2DE                                              ;928E11;
    dw SamusSpritemaps_C2DE                                              ;928E13;
    dw $0000                                                             ;928E15;
    dw $0000                                                             ;928E17;
    dw SamusSpritemaps_C28C                                              ;928E19;
    dw SamusSpritemaps_C276                                              ;928E1B;
    dw SamusSpritemaps_B037                                              ;928E1D;
; 06C9. Bottom half - D7: Facing right - crystal flash ending
    dw $0000                                                             ;928E1F;
    dw $0000                                                             ;928E21;
    dw $0000                                                             ;928E23;
    dw SamusSpritemaps_B021                                              ;928E25;
    dw SamusSpritemaps_B0AF                                              ;928E27;
    dw SamusSpritemaps_B1FE                                              ;928E29;
; 06CF. Bottom half - D8: Facing left-   crystal flash ending
    dw $0000                                                             ;928E2B;
    dw $0000                                                             ;928E2D;
    dw $0000                                                             ;928E2F;
    dw SamusSpritemaps_B037                                              ;928E31;
    dw SamusSpritemaps_B0BB                                              ;928E33;
    dw SamusSpritemaps_B214                                              ;928E35;
; 06D5. Bottom half - E8: Facing right - Samus drained - crouching
    dw $0000                                                             ;928E37;
    dw $0000                                                             ;928E39;
    dw $0000                                                             ;928E3B;
    dw SamusSpritemaps_B0AF                                              ;928E3D;
    dw SamusSpritemaps_B0AF                                              ;928E3F;
    dw SamusSpritemaps_B0AF                                              ;928E41;
    dw SamusSpritemaps_B0AF                                              ;928E43;
    dw SamusSpritemaps_B0AF                                              ;928E45;
    dw SamusSpritemaps_B242                                              ;928E47;
    dw SamusSpritemaps_B242                                              ;928E49;
    dw SamusSpritemaps_B242                                              ;928E4B;
    dw SamusSpritemaps_B242                                              ;928E4D;
    dw $0000                                                             ;928E4F;
    dw $0000                                                             ;928E51;
    dw SamusSpritemaps_B021                                              ;928E53;
; 06E4. Bottom half - E9: Facing left-   Samus drained - crouching
    dw $0000                                                             ;928E55;
    dw $0000                                                             ;928E57;
    dw SamusSpritemaps_B0BB                                              ;928E59;
    dw SamusSpritemaps_B0BB                                              ;928E5B;
    dw SamusSpritemaps_B0BB                                              ;928E5D;
    dw SamusSpritemaps_B0BB                                              ;928E5F;
    dw SamusSpritemaps_B0BB                                              ;928E61;
    dw SamusSpritemaps_B037                                              ;928E63;
    dw SamusSpritemaps_B236                                              ;928E65;
    dw SamusSpritemaps_B236                                              ;928E67;
    dw SamusSpritemaps_B236                                              ;928E69;
    dw SamusSpritemaps_B236                                              ;928E6B;
    dw $0000                                                             ;928E6D;
    dw $0000                                                             ;928E6F;
    dw SamusSpritemaps_B1E3                                              ;928E71;
    dw SamusSpritemaps_B037                                              ;928E73;
    dw SamusSpritemaps_B2AB                                              ;928E75;
    dw $0000                                                             ;928E77;
    dw $0000                                                             ;928E79;
    dw SamusSpritemaps_B1E3                                              ;928E7B;
    dw SamusSpritemaps_B037                                              ;928E7D;
    dw SamusSpritemaps_B2AB                                              ;928E7F;
    dw SamusSpritemaps_B037                                              ;928E81;
    dw SamusSpritemaps_B1E3                                              ;928E83;
    dw $0000                                                             ;928E85;
    dw $0000                                                             ;928E87;
    dw SamusSpritemaps_B236                                              ;928E89;
    dw $0000                                                             ;928E8B;
    dw $0000                                                             ;928E8D;
    dw SamusSpritemaps_B236                                              ;928E8F;
    dw $0000                                                             ;928E91;
    dw $0000                                                             ;928E93;
; 0704. Bottom half - EA: Facing right - Samus drained - standing
    dw SamusSpritemaps_B242                                              ;928E95;
    dw SamusSpritemaps_B242                                              ;928E97;
    dw SamusSpritemaps_B242                                              ;928E99;
    dw SamusSpritemaps_B242                                              ;928E9B;
    dw $0000                                                             ;928E9D;
    dw SamusSpritemaps_B021                                              ;928E9F;
; 070A. Bottom half - EB: Facing left-   Samus drained - standing
    dw SamusSpritemaps_B236                                              ;928EA1;
    dw SamusSpritemaps_B236                                              ;928EA3;
    dw SamusSpritemaps_B236                                              ;928EA5;
    dw SamusSpritemaps_B236                                              ;928EA7;
    dw $0000                                                             ;928EA9;
    dw SamusSpritemaps_B037                                              ;928EAB;
; Bottom half - 1D: Facing right - morph ball - no springball - on ground
; Bottom half - 31: Facing right - morph ball - no springball - in air
; Bottom half - 32: Facing left-   morph ball - no springball - in air
; Bottom half - 3F: Unused
; Bottom half - 40: Unused
; Top half - 1D: Facing right - morph ball - no springball - on ground
; Top half - 31: Facing right - morph ball - no springball - in air
; Top half - 32: Facing left-   morph ball - no springball - in air
; Top half - 3F: Unused
; 0710. Top half - 40: Unused
    dw SamusSpritemaps_BAB3                                              ;928EAD;
    dw SamusSpritemaps_BAE3                                              ;928EAF;
    dw SamusSpritemaps_BABF                                              ;928EB1;
    dw SamusSpritemaps_BAFE                                              ;928EB3;
    dw SamusSpritemaps_BACB                                              ;928EB5;
    dw SamusSpritemaps_BB0A                                              ;928EB7;
    dw SamusSpritemaps_BAD7                                              ;928EB9;
    dw SamusSpritemaps_BB16                                              ;928EBB;
    dw $0000                                                             ;928EBD;
    dw SamusSpritemaps_BC88                                              ;928EBF;
; Bottom half - 41: Facing left-   morph ball - no springball - on ground
; Bottom half - C5: Unused
; Bottom half - DF: Unused
; Top half - 41: Facing left-   morph ball - no springball - on ground
; Top half - C5: Unused
; 071A. Top half - DF: Unused
    dw SamusSpritemaps_BB16                                              ;928EC1;
    dw SamusSpritemaps_BAD7                                              ;928EC3;
    dw SamusSpritemaps_BB0A                                              ;928EC5;
    dw SamusSpritemaps_BACB                                              ;928EC7;
    dw SamusSpritemaps_BAFE                                              ;928EC9;
    dw SamusSpritemaps_BABF                                              ;928ECB;
    dw SamusSpritemaps_BAE3                                              ;928ECD;
    dw SamusSpritemaps_BAB3                                              ;928ECF;
    dw $0000                                                             ;928ED1;
    dw SamusSpritemaps_BC88                                              ;928ED3;
; Bottom half - 1E: Moving right - morph ball - no springball - on ground
; 0724. Top half - 1E: Moving right - morph ball - no springball - on ground
    dw SamusSpritemaps_BAB3                                              ;928ED5;
    dw SamusSpritemaps_BAE3                                              ;928ED7;
    dw SamusSpritemaps_BABF                                              ;928ED9;
    dw SamusSpritemaps_BAFE                                              ;928EDB;
    dw SamusSpritemaps_BACB                                              ;928EDD;
    dw SamusSpritemaps_BB0A                                              ;928EDF;
    dw SamusSpritemaps_BAD7                                              ;928EE1;
    dw SamusSpritemaps_BB16                                              ;928EE3;
    dw $0000                                                             ;928EE5;
    dw SamusSpritemaps_BC88                                              ;928EE7;
; Bottom half - 1F: Moving left-   morph ball - no springball - on ground
; 072E. Top half - 1F: Moving left-   morph ball - no springball - on ground
    dw SamusSpritemaps_BB16                                              ;928EE9;
    dw SamusSpritemaps_BAD7                                              ;928EEB;
    dw SamusSpritemaps_BB0A                                              ;928EED;
    dw SamusSpritemaps_BACB                                              ;928EEF;
    dw SamusSpritemaps_BAFE                                              ;928EF1;
    dw SamusSpritemaps_BABF                                              ;928EF3;
    dw SamusSpritemaps_BAE3                                              ;928EF5;
    dw SamusSpritemaps_BAB3                                              ;928EF7;
    dw $0000                                                             ;928EF9;
    dw SamusSpritemaps_BC88                                              ;928EFB;
; Bottom half - 79: Facing right - morph ball - spring ball - on ground
; Bottom half - 7B: Moving right - morph ball - spring ball - on ground
; Bottom half - 7D: Facing right - morph ball - spring ball - falling
; Bottom half - 7F: Facing right - morph ball - spring ball - in air
; Top half - 79: Facing right - morph ball - spring ball - on ground
; Top half - 7B: Moving right - morph ball - spring ball - on ground
; Top half - 7D: Facing right - morph ball - spring ball - falling
; 0738. Top half - 7F: Facing right - morph ball - spring ball - in air
    dw SamusSpritemaps_BAB3                                              ;928EFD;
    dw SamusSpritemaps_BAE3                                              ;928EFF;
    dw SamusSpritemaps_BABF                                              ;928F01;
    dw SamusSpritemaps_BAFE                                              ;928F03;
    dw SamusSpritemaps_BACB                                              ;928F05;
    dw SamusSpritemaps_BB0A                                              ;928F07;
    dw SamusSpritemaps_BAD7                                              ;928F09;
    dw SamusSpritemaps_BB16                                              ;928F0B;
    dw $0000                                                             ;928F0D;
    dw SamusSpritemaps_BC88                                              ;928F0F;
; Bottom half - 7A: Facing left-   morph ball - spring ball - on ground
; Bottom half - 7C: Moving left-   morph ball - spring ball - on ground
; Bottom half - 7E: Facing left-   morph ball - spring ball - falling
; Bottom half - 80: Facing left-   morph ball - spring ball - in air
; Top half - 7A: Facing left-   morph ball - spring ball - on ground
; Top half - 7C: Moving left-   morph ball - spring ball - on ground
; Top half - 7E: Facing left-   morph ball - spring ball - falling
; 0742. Top half - 80: Facing left-   morph ball - spring ball - in air
    dw SamusSpritemaps_BB16                                              ;928F11;
    dw SamusSpritemaps_BAD7                                              ;928F13;
    dw SamusSpritemaps_BB0A                                              ;928F15;
    dw SamusSpritemaps_BACB                                              ;928F17;
    dw SamusSpritemaps_BAFE                                              ;928F19;
    dw SamusSpritemaps_BABF                                              ;928F1B;
    dw SamusSpritemaps_BAE3                                              ;928F1D;
    dw SamusSpritemaps_BAB3                                              ;928F1F;
    dw $0000                                                             ;928F21;
    dw SamusSpritemaps_BC88                                              ;928F23;
; Bottom half - 20: Unused
; Bottom half - 21: Unused
; Bottom half - 22: Unused
; Bottom half - 23: Unused
; Bottom half - 24: Unused
; Bottom half - 33: Unused
; Bottom half - 34: Unused
; Bottom half - 39: Unused
; Bottom half - 3A: Unused
; Bottom half - 42: Unused
; Top half - 19: Facing right - spin jump
; Top half - 20: Unused
; Top half - 21: Unused
; Top half - 22: Unused
; Top half - 23: Unused
; Top half - 24: Unused
; Top half - 33: Unused
; Top half - 34: Unused
; Top half - 39: Unused
; Top half - 3A: Unused
; 074C. Top half - 42: Unused
    dw SamusSpritemaps_9BAE                                              ;928F25;
    dw SamusSpritemaps_BD67                                              ;928F27;
    dw SamusSpritemaps_BD73                                              ;928F29;
    dw SamusSpritemaps_BD89                                              ;928F2B;
    dw SamusSpritemaps_BD95                                              ;928F2D;
    dw SamusSpritemaps_BDAB                                              ;928F2F;
    dw SamusSpritemaps_BDB7                                              ;928F31;
    dw SamusSpritemaps_BDCD                                              ;928F33;
    dw SamusSpritemaps_BDD9                                              ;928F35;
    dw $0000                                                             ;928F37;
    dw $0000                                                             ;928F39;
    dw SamusSpritemaps_9B43                                              ;928F3B;
; 0758. Bottom half - 19: Facing right - spin jump
    dw SamusSpritemaps_B1C8                                              ;928F3D;
    dw $0000                                                             ;928F3F;
    dw $0000                                                             ;928F41;
    dw $0000                                                             ;928F43;
    dw $0000                                                             ;928F45;
    dw $0000                                                             ;928F47;
    dw $0000                                                             ;928F49;
    dw $0000                                                             ;928F4B;
    dw $0000                                                             ;928F4D;
    dw $0000                                                             ;928F4F;
    dw $0000                                                             ;928F51;
    dw SamusSpritemaps_AFB2                                              ;928F53;
; 0764. Top half - 1A: Facing left-   spin jump
    dw SamusSpritemaps_9BBF                                              ;928F55;
    dw SamusSpritemaps_BB22                                              ;928F57;
    dw SamusSpritemaps_BB2E                                              ;928F59;
    dw SamusSpritemaps_BB44                                              ;928F5B;
    dw SamusSpritemaps_BB50                                              ;928F5D;
    dw SamusSpritemaps_BB66                                              ;928F5F;
    dw SamusSpritemaps_BB72                                              ;928F61;
    dw SamusSpritemaps_BB88                                              ;928F63;
    dw SamusSpritemaps_BB94                                              ;928F65;
    dw $0000                                                             ;928F67;
    dw $0000                                                             ;928F69;
    dw SamusSpritemaps_9B59                                              ;928F6B;
; 0770. Bottom half - 1A: Facing left-   spin jump
    dw SamusSpritemaps_B1E3                                              ;928F6D;
    dw $0000                                                             ;928F6F;
    dw $0000                                                             ;928F71;
    dw $0000                                                             ;928F73;
    dw $0000                                                             ;928F75;
    dw $0000                                                             ;928F77;
    dw $0000                                                             ;928F79;
    dw $0000                                                             ;928F7B;
    dw $0000                                                             ;928F7D;
    dw $0000                                                             ;928F7F;
    dw $0000                                                             ;928F81;
    dw SamusSpritemaps_AFBE                                              ;928F83;
; 077C. Top half - 1B: Facing right - space jump
    dw SamusSpritemaps_9BAE                                              ;928F85;
    dw SamusSpritemaps_BEBF                                              ;928F87;
    dw SamusSpritemaps_BEBF                                              ;928F89;
    dw SamusSpritemaps_BEBF                                              ;928F8B;
    dw SamusSpritemaps_BEBF                                              ;928F8D;
    dw SamusSpritemaps_BEBF                                              ;928F8F;
    dw SamusSpritemaps_BEBF                                              ;928F91;
    dw SamusSpritemaps_BEBF                                              ;928F93;
    dw SamusSpritemaps_BEBF                                              ;928F95;
    dw $0000                                                             ;928F97;
    dw $0000                                                             ;928F99;
    dw SamusSpritemaps_9B43                                              ;928F9B;
; 0788. Bottom half - 1B: Facing right - space jump
    dw SamusSpritemaps_B1C8                                              ;928F9D;
    dw SamusSpritemaps_C458                                              ;928F9F;
    dw SamusSpritemaps_C46E                                              ;928FA1;
    dw SamusSpritemaps_C4A2                                              ;928FA3;
    dw SamusSpritemaps_C4B8                                              ;928FA5;
    dw SamusSpritemaps_C4EC                                              ;928FA7;
    dw SamusSpritemaps_C502                                              ;928FA9;
    dw SamusSpritemaps_C536                                              ;928FAB;
    dw SamusSpritemaps_C54C                                              ;928FAD;
    dw $0000                                                             ;928FAF;
    dw $0000                                                             ;928FB1;
    dw SamusSpritemaps_AFB2                                              ;928FB3;
; 0794. Top half - 1C: Facing left-   space jump
    dw SamusSpritemaps_9BBF                                              ;928FB5;
    dw SamusSpritemaps_BC7A                                              ;928FB7;
    dw SamusSpritemaps_BC7A                                              ;928FB9;
    dw SamusSpritemaps_BC7A                                              ;928FBB;
    dw SamusSpritemaps_BC7A                                              ;928FBD;
    dw SamusSpritemaps_BC7A                                              ;928FBF;
    dw SamusSpritemaps_BC7A                                              ;928FC1;
    dw SamusSpritemaps_BC7A                                              ;928FC3;
    dw SamusSpritemaps_BC7A                                              ;928FC5;
    dw $0000                                                             ;928FC7;
    dw $0000                                                             ;928FC9;
    dw SamusSpritemaps_9B59                                              ;928FCB;
; 07A0. Bottom half - 1C: Facing left-   space jump
    dw SamusSpritemaps_B1E3                                              ;928FCD;
    dw SamusSpritemaps_C330                                              ;928FCF;
    dw SamusSpritemaps_C346                                              ;928FD1;
    dw SamusSpritemaps_C37A                                              ;928FD3;
    dw SamusSpritemaps_C390                                              ;928FD5;
    dw SamusSpritemaps_C3C4                                              ;928FD7;
    dw SamusSpritemaps_C3DA                                              ;928FD9;
    dw SamusSpritemaps_C40E                                              ;928FDB;
    dw SamusSpritemaps_C424                                              ;928FDD;
    dw $0000                                                             ;928FDF;
    dw $0000                                                             ;928FE1;
    dw SamusSpritemaps_AFBE                                              ;928FE3;
; 07AC. Top half - 81: Facing right - screw attack
    dw SamusSpritemaps_9BAE                                              ;928FE5;
    dw SamusSpritemaps_BDEF                                              ;928FE7;
    dw SamusSpritemaps_BDEF                                              ;928FE9;
    dw SamusSpritemaps_BDEF                                              ;928FEB;
    dw SamusSpritemaps_BEBF                                              ;928FED;
    dw SamusSpritemaps_BEBF                                              ;928FEF;
    dw SamusSpritemaps_BEBF                                              ;928FF1;
    dw SamusSpritemaps_BE23                                              ;928FF3;
    dw SamusSpritemaps_BE23                                              ;928FF5;
    dw SamusSpritemaps_BE23                                              ;928FF7;
    dw SamusSpritemaps_BEBF                                              ;928FF9;
    dw SamusSpritemaps_BEBF                                              ;928FFB;
    dw SamusSpritemaps_BEBF                                              ;928FFD;
    dw SamusSpritemaps_BE5C                                              ;928FFF;
    dw SamusSpritemaps_BE5C                                              ;929001;
    dw SamusSpritemaps_BE5C                                              ;929003;
    dw SamusSpritemaps_BEBF                                              ;929005;
    dw SamusSpritemaps_BEBF                                              ;929007;
    dw SamusSpritemaps_BEBF                                              ;929009;
    dw SamusSpritemaps_BE95                                              ;92900B;
    dw SamusSpritemaps_BE95                                              ;92900D;
    dw SamusSpritemaps_BE95                                              ;92900F;
    dw SamusSpritemaps_BEBF                                              ;929011;
    dw SamusSpritemaps_BEBF                                              ;929013;
    dw SamusSpritemaps_BEBF                                              ;929015;
    dw $0000                                                             ;929017;
    dw $0000                                                             ;929019;
    dw SamusSpritemaps_9B43                                              ;92901B;
; 07C8. Bottom half - 81: Facing right - screw attack
    dw SamusSpritemaps_B1C8                                              ;92901D;
    dw SamusSpritemaps_C458                                              ;92901F;
    dw SamusSpritemaps_C46E                                              ;929021;
    dw SamusSpritemaps_C4A2                                              ;929023;
    dw SamusSpritemaps_C4B8                                              ;929025;
    dw SamusSpritemaps_C4EC                                              ;929027;
    dw SamusSpritemaps_C502                                              ;929029;
    dw SamusSpritemaps_C536                                              ;92902B;
    dw SamusSpritemaps_C54C                                              ;92902D;
    dw SamusSpritemaps_C458                                              ;92902F;
    dw SamusSpritemaps_C46E                                              ;929031;
    dw SamusSpritemaps_C4A2                                              ;929033;
    dw SamusSpritemaps_C4B8                                              ;929035;
    dw SamusSpritemaps_C4EC                                              ;929037;
    dw SamusSpritemaps_C502                                              ;929039;
    dw SamusSpritemaps_C536                                              ;92903B;
    dw SamusSpritemaps_C54C                                              ;92903D;
    dw SamusSpritemaps_C458                                              ;92903F;
    dw SamusSpritemaps_C46E                                              ;929041;
    dw SamusSpritemaps_C4A2                                              ;929043;
    dw SamusSpritemaps_C4B8                                              ;929045;
    dw SamusSpritemaps_C4EC                                              ;929047;
    dw SamusSpritemaps_C502                                              ;929049;
    dw SamusSpritemaps_C536                                              ;92904B;
    dw SamusSpritemaps_C54C                                              ;92904D;
    dw $0000                                                             ;92904F;
    dw $0000                                                             ;929051;
    dw SamusSpritemaps_AFB2                                              ;929053;
; 07E4. Top half - 82: Facing left-   screw attack
    dw SamusSpritemaps_9BBF                                              ;929055;
    dw SamusSpritemaps_BBAA                                              ;929057;
    dw SamusSpritemaps_BBAA                                              ;929059;
    dw SamusSpritemaps_BBAA                                              ;92905B;
    dw SamusSpritemaps_BC7A                                              ;92905D;
    dw SamusSpritemaps_BC7A                                              ;92905F;
    dw SamusSpritemaps_BC7A                                              ;929061;
    dw SamusSpritemaps_BBDE                                              ;929063;
    dw SamusSpritemaps_BBDE                                              ;929065;
    dw SamusSpritemaps_BBDE                                              ;929067;
    dw SamusSpritemaps_BC7A                                              ;929069;
    dw SamusSpritemaps_BC7A                                              ;92906B;
    dw SamusSpritemaps_BC7A                                              ;92906D;
    dw SamusSpritemaps_BC17                                              ;92906F;
    dw SamusSpritemaps_BC17                                              ;929071;
    dw SamusSpritemaps_BC17                                              ;929073;
    dw SamusSpritemaps_BC7A                                              ;929075;
    dw SamusSpritemaps_BC7A                                              ;929077;
    dw SamusSpritemaps_BC7A                                              ;929079;
    dw SamusSpritemaps_BC50                                              ;92907B;
    dw SamusSpritemaps_BC50                                              ;92907D;
    dw SamusSpritemaps_BC50                                              ;92907F;
    dw SamusSpritemaps_BC7A                                              ;929081;
    dw SamusSpritemaps_BC7A                                              ;929083;
    dw SamusSpritemaps_BC7A                                              ;929085;
    dw $0000                                                             ;929087;
    dw $0000                                                             ;929089;
    dw SamusSpritemaps_9B59                                              ;92908B;
; 0800. Bottom half - 82: Facing left-   screw attack
    dw SamusSpritemaps_B1E3                                              ;92908D;
    dw SamusSpritemaps_C330                                              ;92908F;
    dw SamusSpritemaps_C346                                              ;929091;
    dw SamusSpritemaps_C37A                                              ;929093;
    dw SamusSpritemaps_C390                                              ;929095;
    dw SamusSpritemaps_C3C4                                              ;929097;
    dw SamusSpritemaps_C3DA                                              ;929099;
    dw SamusSpritemaps_C40E                                              ;92909B;
    dw SamusSpritemaps_C424                                              ;92909D;
    dw SamusSpritemaps_C330                                              ;92909F;
    dw SamusSpritemaps_C346                                              ;9290A1;
    dw SamusSpritemaps_C37A                                              ;9290A3;
    dw SamusSpritemaps_C390                                              ;9290A5;
    dw SamusSpritemaps_C3C4                                              ;9290A7;
    dw SamusSpritemaps_C3DA                                              ;9290A9;
    dw SamusSpritemaps_C40E                                              ;9290AB;
    dw SamusSpritemaps_C424                                              ;9290AD;
    dw SamusSpritemaps_C330                                              ;9290AF;
    dw SamusSpritemaps_C346                                              ;9290B1;
    dw SamusSpritemaps_C37A                                              ;9290B3;
    dw SamusSpritemaps_C390                                              ;9290B5;
    dw SamusSpritemaps_C3C4                                              ;9290B7;
    dw SamusSpritemaps_C3DA                                              ;9290B9;
    dw SamusSpritemaps_C40E                                              ;9290BB;
    dw SamusSpritemaps_C424                                              ;9290BD;
    dw $0000                                                             ;9290BF;
    dw $0000                                                             ;9290C1;
    dw SamusSpritemaps_AFBE                                              ;9290C3;
; 081C. Samus' suit exploding - facing right
    dw SamusSpritemaps_C8B7                                              ;9290C5;
    dw SamusSpritemaps_C8E6                                              ;9290C7;
    dw SamusSpritemaps_C956                                              ;9290C9;
    dw SamusSpritemaps_C9DA                                              ;9290CB;
    dw SamusSpritemaps_CA54                                              ;9290CD;
    dw SamusSpritemaps_CAD3                                              ;9290CF;
    dw SamusSpritemaps_CB52                                              ;9290D1;
    dw SamusSpritemaps_CB7C                                              ;9290D3;
    dw SamusSpritemaps_CBB5                                              ;9290D5;
; 0825. Samus' suit exploding - facing right
    dw SamusSpritemaps_C580                                              ;9290D7;
    dw SamusSpritemaps_C5AF                                              ;9290D9;
    dw SamusSpritemaps_C61F                                              ;9290DB;
    dw SamusSpritemaps_C6A3                                              ;9290DD;
    dw SamusSpritemaps_C71D                                              ;9290DF;
    dw SamusSpritemaps_C79C                                              ;9290E1;
    dw SamusSpritemaps_C81B                                              ;9290E3;
    dw SamusSpritemaps_C845                                              ;9290E5;
    dw SamusSpritemaps_C87E                                              ;9290E7;
; Bottom half - CB: Facing right - shinespark - vertical
; 082E. Top half - CB: Facing right - shinespark - vertical
    dw SamusSpritemaps_C162                                              ;9290E9;
; Bottom half - CC: Facing left-   shinespark - vertical
; 082F. Top half - CC: Facing left-   shinespark - vertical
    dw SamusSpritemaps_C17D                                              ;9290EB;


;;; $90ED: Samus spritemaps - debug ;;;
UNUSED_Debug_SamusSpritemap_0_9290ED:
; Unused. Samus spritemap 0
    dw $0001                                                             ;9290ED;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $15A)

UNUSED_Debug_SamusSpritemap_1_9290F4:
; Unused. Samus spritemap 1
    dw $0019                                                             ;9290F4;
    %spritemapEntry(0, $39, $E8, 0, 0, 3, 0, $136)
    %spritemapEntry(0, $31, $E8, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $29, $E8, 0, 0, 3, 0, $131)
    %spritemapEntry(0, $21, $E8, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $19, $E8, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 0, $14B)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 0, $13D)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $14A)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $13D)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $145)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_929173:
; Unused
    dw $0001                                                             ;929173;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5F)
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTileViewer_SamusTopHalf:
; Samus tile viewer - Samus top half
    dw $0010                                                             ;92917A;
    %spritemapEntry(0, $18, $00, 0, 0, 3, 4, $17)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 4, $16)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 4, $15)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 4, $14)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 4, $13)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 4, $12)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 4, $11)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 4, $10)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 4, $07)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 4, $06)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 4, $00)

SamusTileViewer_SamusBottomHalf:
; Samus tile viewer - Samus bottom half
    dw $0010                                                             ;9291CC;
    %spritemapEntry(0, $18, $00, 0, 0, 3, 4, $1F)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 4, $1E)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 4, $1D)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 4, $1C)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 4, $1B)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 4, $1A)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 4, $19)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 4, $18)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 4, $0F)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 4, $0E)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 4, $0D)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 4, $0C)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 4, $0B)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 4, $0A)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 4, $09)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 4, $08)

SamusTileViewer_Beam:
; Samus tile viewer - beam
    dw $0008                                                             ;92921E;
    %spritemapEntry(0, $18, $00, 0, 0, 3, 6, $37)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 6, $36)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 6, $35)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 6, $34)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 6, $33)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 6, $32)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 6, $31)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 6, $30)

SamusTileViewer_GrappleBeam:
; Samus tile viewer - grapple beam
    dw $0005                                                             ;929248;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $24)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $23)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 5, $22)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 5, $21)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 5, $20)


;;; $9263: Samus spritemap table indices - top half ;;;
SamusSpritemapTableIndices_TopHalf:
; Indexed by [Samus pose], base indices into SamusSpritemapTable
    dw $0002,$019A,$01A3,$01AD,$01AF,$01B1,$01B3,$01B5                   ;929263;
    dw $01B7,$01F9,$0203,$020D,$0217,$0221,$022B,$0235                   ;929273;
    dw $023F,$0249,$0253,$0275,$0277,$0279,$027B,$0271                   ;929283;
    dw $0273,$074C,$0764,$077C,$0794,$0710,$0724,$072E                   ;929293;
    dw $074C,$074C,$074C,$074C,$074C,$0419,$041C,$03F1                   ;9292A3;
    dw $03FA,$03B7,$03BE,$03D3,$03D6,$03D9,$03DB,$0419                   ;9292B3;
    dw $041C,$0710,$0710,$074C,$074C,$0403,$0404,$0405                   ;9292C3;
    dw $0407,$074C,$074C,$0403,$0404,$0409,$040B,$0710                   ;9292D3;
    dw $0710,$071A,$074C,$0419,$041C,$025D,$0267,$019A                   ;9292E3;
    dw $01A3,$01D5,$01DB,$0289,$028A,$028B,$0291,$0297                   ;9292F3;
    dw $02A1,$0285,$0287,$031F,$0321,$01CD,$01CF,$01B1                   ;929303;
    dw $01B3,$01B5,$01B7,$032F,$0330,$0331,$0331,$0331                   ;929313;
    dw $0332,$0333,$0375,$02AB,$02AD,$02AF,$02B8,$03C5                   ;929323;
    dw $03CC,$027D,$027F,$0281,$0283,$03DD,$03E0,$03E3                   ;929333;
    dw $03E6,$03E9,$03EA,$03EB,$03EC,$01E1,$01E7,$01ED                   ;929343;
    dw $01F3,$0738,$0742,$0738,$0742,$0738,$0742,$0738                   ;929353;
    dw $0742,$07AC,$07E4,$02C1,$02F0,$03ED,$03EF,$0419                   ;929363;
    dw $041C,$019A,$01A3,$041F,$0422,$0425,$0428,$041F                   ;929373;
    dw $0422,$0425,$0428,$041F,$0422,$0425,$0428,$041F                   ;929383;
    dw $0422,$0425,$0428,$00C2,$041F,$0422,$041F,$0422                   ;929393;
    dw $041F,$0422,$041F,$0422,$01B9,$01BB,$01BD,$01C0                   ;9293A3;
    dw $019A,$01A3,$01B5,$01B7,$0275,$0277,$0271,$0273                   ;9293B3;
    dw $0281,$0283,$0333,$0375,$03F1,$03FA,$03EB,$03EC                   ;9293C3;
    dw $032F,$0330,$042F,$0430,$0431,$0432,$0439,$0419                   ;9293D3;
    dw $041C,$041F,$0422,$0425,$0428,$071A,$0419,$028B                   ;9293E3;
    dw $0291,$043F,$0440,$082E,$082F,$0441,$0442,$01B1                   ;9293F3;
    dw $01B3,$01B5,$01B7,$0443,$0452,$01C3,$01C8,$0461                   ;929403;
    dw $0467,$01C3,$01C8,$040D,$0410,$0413,$0416,$071A                   ;929413;
    dw $01CD,$01CF,$01B1,$01B3,$01B5,$01B7,$01D1,$01D3                   ;929423;
    dw $046D,$047C,$049C,$04A2,$042B,$042C,$042D,$042E                   ;929433;
    dw $0433,$01CD,$01CF,$01B1,$01B3,$01B5,$01B7,$01CD                   ;929443;
    dw $01CF,$01B1,$01B3,$01B5,$01B7                                     ;929453;


;;; $945D: Samus spritemap table indices - bottom half ;;;
SamusSpritemapTableIndices_BottomHalf:
; Indexed by [Samus pose], base indices into SamusSpritemapTable
    dw $0062,$04AA,$04B3,$04C0,$04C2,$04C0,$04C2,$04C0                   ;92945D;
    dw $04C2,$04E3,$04ED,$04E3,$04ED,$04E3,$04ED,$04E3                   ;92946D;
    dw $04ED,$04E3,$04ED,$0507,$0509,$050B,$050D,$0503                   ;92947D;
    dw $0505,$0758,$0770,$0788,$07A0,$0710,$0724,$072E                   ;92948D;
    dw $074C,$074C,$074C,$074C,$074C,$0687,$068A,$065F                   ;92949D;
    dw $0668,$063B,$0642,$064D,$0650,$0649,$064B,$068D                   ;9294AD;
    dw $0690,$0710,$0710,$074C,$074C,$0679,$067A,$0405                   ;9294BD;
    dw $0407,$074C,$074C,$0679,$067A,$0409,$040B,$0710                   ;9294CD;
    dw $0710,$071A,$074C,$068D,$0690,$04E3,$04ED,$04AA                   ;9294DD;
    dw $04B3,$04F7,$04FD,$051B,$051C,$051D,$0523,$0529                   ;9294ED;
    dw $0533,$050F,$0511,$05B1,$05B3,$051B,$051C,$051B                   ;9294FD;
    dw $051C,$051B,$051C,$05B5,$05B6,$05B7,$05B7,$05B7                   ;92950D;
    dw $05B7,$05B7,$05F9,$053D,$053F,$0541,$054A,$063B                   ;92951D;
    dw $0642,$0513,$0515,$0517,$0519,$0653,$0656,$0659                   ;92952D;
    dw $065C,$0671,$0672,$0673,$0674,$04F7,$04FD,$04F7                   ;92953D;
    dw $04FD,$0738,$0742,$0738,$0742,$0738,$0742,$0738                   ;92954D;
    dw $0742,$07C8,$0800,$0553,$0582,$0675,$0677,$068D                   ;92955D;
    dw $0696,$04AA,$04B3,$0687,$068A,$0687,$068A,$068D                   ;92956D;
    dw $0690,$068D,$0690,$068D,$0696,$068D,$0696,$068D                   ;92957D;
    dw $0690,$068D,$0690,$0122,$0687,$068A,$068D,$0690                   ;92958D;
    dw $068D,$0696,$068D,$0690,$04C5,$04C7,$04C9,$04CC                   ;92959D;
    dw $04AA,$04B3,$04C0,$04C2,$0507,$0509,$0503,$0505                   ;9295AD;
    dw $0517,$0519,$05B7,$05F9,$065F,$0668,$0673,$0674                   ;9295BD;
    dw $05B5,$05B6,$069A,$069A,$069A,$069A,$06A1,$0687                   ;9295CD;
    dw $068A,$0687,$068A,$0687,$068A,$071A,$0687,$051D                   ;9295DD;
    dw $0523,$06A7,$06A8,$082E,$082F,$06A9,$06AA,$04C0                   ;9295ED;
    dw $04C2,$04C0,$04C2,$06AB,$06BA,$04CF,$04D4,$06C9                   ;9295FD;
    dw $06CF,$04D9,$04DE,$067D,$0680,$0681,$0684,$071A                   ;92960D;
    dw $04C5,$04C7,$04C5,$04C7,$04C5,$04C7,$04C5,$04C7                   ;92961D;
    dw $06D5,$06E4,$0704,$070A,$0699,$0699,$0699,$0699                   ;92962D;
    dw $069B,$0679,$067A,$0679,$067A,$0679,$067A,$0679                   ;92963D;
    dw $067A,$0679,$067A,$0679,$067A                                     ;92964D;


;;; $9657: Samus spritemaps ;;;
SamusSpritemaps_9657:
    dw $0002                                                             ;929657;
    %spritemapEntry(1, $43FB, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FB, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9663:
    dw $0002                                                             ;929663;
    %spritemapEntry(1, $43FB, $F7, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FB, $EF, 0, 0, 2, 4, $02)

SamusSpritemaps_966F:
    dw $0003                                                             ;92966F;
    %spritemapEntry(1, $43FF, $F7, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $07, $EF, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F7, $EF, 0, 0, 2, 4, $02)

SamusSpritemaps_9680:
    dw $0003                                                             ;929680;
    %spritemapEntry(0, $08, $EE, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $4200, $F6, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $EE, 0, 0, 2, 4, $02)

SamusSpritemaps_9691:
    dw $0002                                                             ;929691;
    %spritemapEntry(1, $43F9, $F7, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $EF, 0, 0, 2, 4, $02)

SamusSpritemaps_969D:
    dw $0003                                                             ;92969D;
    %spritemapEntry(1, $43FE, $EF, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F6, $F7, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F6, $EF, 0, 0, 2, 4, $04)

SamusSpritemaps_96AE:
    dw $0002                                                             ;9296AE;
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F5, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_96BA:
    dw $0002                                                             ;9296BA;
    %spritemapEntry(1, $43F5, $F7, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F5, $EF, 0, 0, 2, 4, $02)

SamusSpritemaps_96C6:
    dw $0003                                                             ;9296C6;
    %spritemapEntry(1, $43F1, $F7, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $EF, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F1, $EF, 0, 0, 2, 4, $04)

SamusSpritemaps_96D7:
    dw $0003                                                             ;9296D7;
    %spritemapEntry(1, $43F0, $F6, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $EE, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $EE, 0, 0, 2, 4, $04)

SamusSpritemaps_96E8:
    dw $0002                                                             ;9296E8;
    %spritemapEntry(1, $43F7, $F7, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F7, $EF, 0, 0, 2, 4, $02)

SamusSpritemaps_96F4:
    dw $0003                                                             ;9296F4;
    %spritemapEntry(1, $43FA, $F7, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $02, $EF, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F2, $EF, 0, 0, 2, 4, $02)

SamusSpritemaps_9705:
    dw $0006                                                             ;929705;
    %spritemapEntry(0, $1FD, $FB, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $05, $F3, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FD, $F3, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $0B, $01, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $07, $FD, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FA, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9725:
    dw $0006                                                             ;929725;
    %spritemapEntry(0, $1ED, $01, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1F1, $FD, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1FC, $FB, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F4, $F3, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1FC, $F3, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9745:
    dw $0005                                                             ;929745;
    %spritemapEntry(0, $06, $01, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43FE, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F6, $F1, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $0D, $03, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $09, $FF, 0, 0, 2, 4, $06)

SamusSpritemaps_9760:
    dw $0005                                                             ;929760;
    %spritemapEntry(0, $1EF, $FF, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F0, $01, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EB, $03, 0, 1, 2, 4, $06)
    %spritemapEntry(1, $43F8, $F1, 0, 0, 2, 4, $02)

SamusSpritemaps_977B:
    dw $0005                                                             ;92977B;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_9796:
    dw $0005                                                             ;929796;
    %spritemapEntry(0, $1FF, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F7, $00, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_97B1:
    dw $0004                                                             ;9297B1;
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 4, $04)
    %spritemapEntry(1, $43FF, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0E, $EA, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43F7, $F1, 0, 0, 2, 4, $02)

SamusSpritemaps_97C7:
    dw $0004                                                             ;9297C7;
    %spritemapEntry(0, $1EA, $E9, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F1, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EE, $ED, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F9, $F1, 0, 0, 2, 4, $02)

SamusSpritemaps_97DD:
    dw $0003                                                             ;9297DD;
    %spritemapEntry(1, $43FF, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $07, $F0, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_97EE:
    dw $0003                                                             ;9297EE;
    %spritemapEntry(1, $43F1, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 2, 4, $04)

SamusSpritemaps_97FF:
    dw $0005                                                             ;9297FF;
    %spritemapEntry(0, $1F9, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F9, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FE, $E1, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FE, $E9, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F9, $F1, 0, 0, 2, 4, $00)

SamusSpritemaps_981A:
    dw $0005                                                             ;92981A;
    %spritemapEntry(0, $1FF, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FA, $E1, 0, 1, 2, 4, $04)
    %spritemapEntry(1, $43F7, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1FA, $E9, 0, 1, 2, 4, $05)

SamusSpritemaps_9835:
    dw $0003                                                             ;929835;
    %spritemapEntry(1, $43FF, $EE, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1F7, $FE, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F7, $EE, 0, 0, 2, 4, $02)

SamusSpritemaps_9846:
    dw $0003                                                             ;929846;
    %spritemapEntry(1, $43F1, $EE, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $01, $FE, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F9, $EE, 0, 0, 2, 4, $02)

SamusSpritemaps_9857:
    dw $0005                                                             ;929857;
    %spritemapEntry(0, $0C, $EA, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1FD, $F8, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FD, $F0, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $08, $EE, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43FB, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9872:
    dw $0006                                                             ;929872;
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1EC, $EA, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F0, $EE, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F5, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9892:
    dw $0005                                                             ;929892;
    %spritemapEntry(0, $1F7, $F1, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1F3, $F5, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43F3, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FB, $E8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43FB, $F0, 0, 0, 2, 4, $04)

SamusSpritemaps_98AD:
    dw $0005                                                             ;9298AD;
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43F5, $E8, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43FD, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F5, $F0, 0, 1, 2, 4, $04)

SamusSpritemaps_98C8:
    dw $0007                                                             ;9298C8;
    %spritemapEntry(0, $1F5, $F3, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FD, $F3, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1E7, $FB, 0, 1, 2, 4, $04)
    %spritemapEntry(1, $43F6, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EF, $FB, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 4, $07)

SamusSpritemaps_98ED:
    dw $0007                                                             ;9298ED;
    %spritemapEntry(0, $1FD, $FB, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $04, $F3, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FC, $F3, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $11, $FB, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $02, $00, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FA, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $09, $FB, 0, 0, 2, 4, $07)

SamusSpritemaps_9912:
    dw $0004                                                             ;929912;
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $0A, $FE, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FE, 0, 0, 2, 4, $05)

SamusSpritemaps_9928:
    dw $0004                                                             ;929928;
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1EE, $FE, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FE, 0, 1, 2, 4, $05)

SamusSpritemaps_993E:
    dw $0004                                                             ;92993E;
    %spritemapEntry(0, $1F4, $E8, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FC, $E8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 4, $04)

SamusSpritemaps_9954:
    dw $0005                                                             ;929954;
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 4, $07)
    %spritemapEntry(1, $43FC, $E8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F4, $E8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 4, $04)

SamusSpritemaps_996F:
    dw $0001                                                             ;92996F;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $00)

SamusSpritemaps_9976:
    dw $0002                                                             ;929976;
    %spritemapEntry(1, $43FF, $F0, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9982:
    dw $0004                                                             ;929982;
    %spritemapEntry(0, $04, $E8, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9998:
    dw $0004                                                             ;929998;
    %spritemapEntry(0, $1F5, $E8, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1FD, $E8, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FA, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_99AE:
    dw $0006                                                             ;9299AE;
    %spritemapEntry(0, $1F3, $E8, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $03, $E8, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FB, $E8, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $03, $F8, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $03, $F0, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F3, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_99CE:
    dw $0005                                                             ;9299CE;
    %spritemapEntry(0, $04, $E8, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_99E9:
    dw $0004                                                             ;9299E9;
    %spritemapEntry(0, $04, $E8, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F4, $E8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $04)

SamusSpritemaps_99FF:
    dw $0006                                                             ;9299FF;
    %spritemapEntry(0, $1E2, $F4, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1EA, $F4, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43EC, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $04, $08, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 4, $07)
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9A1F:
    dw $0006                                                             ;929A1F;
    %spritemapEntry(0, $15, $F4, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $0D, $F4, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 4, $07)
    %spritemapEntry(1, $4204, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9A3F:
    dw $0002                                                             ;929A3F;
    %spritemapEntry(1, $43FA, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FA, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9A4B:
    dw $0002                                                             ;929A4B;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9A57:
    dw $0002                                                             ;929A57;
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F6, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9A63:
    dw $0002                                                             ;929A63;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9A6F:
    dw $0002                                                             ;929A6F;
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9A7B:
    dw $0002                                                             ;929A7B;
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $4204, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9A87:
    dw $0002                                                             ;929A87;
    %spritemapEntry(1, $43F4, $F0, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43EC, $F0, 0, 1, 2, 4, $02)

SamusSpritemaps_9A93:
    dw $0005                                                             ;929A93;
    %spritemapEntry(0, $1ED, $F8, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1F1, $F4, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $04)

SamusSpritemaps_9AAE:
    dw $0005                                                             ;929AAE;
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $04)

SamusSpritemaps_9AC9:
    dw $0001                                                             ;929AC9;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 4, $00)

SamusSpritemaps_9AD0:
    dw $0001                                                             ;929AD0;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 4, $00)

SamusSpritemaps_9AD7:
    dw $0006                                                             ;929AD7;
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $04, $E8, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $04, $F0, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9AF7:
    dw $0006                                                             ;929AF7;
    %spritemapEntry(0, $1F7, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F6, $E8, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1FE, $E8, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F3, $F8, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F3, $F0, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FB, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9B17:
    dw $0004                                                             ;929B17;
    %spritemapEntry(0, $1FF, $05, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1FF, $0D, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 4, $02)

SamusSpritemaps_9B2D:
    dw $0004                                                             ;929B2D;
    %spritemapEntry(0, $1F8, $05, 1, 0, 2, 4, $04)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 4, $05)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 4, $02)

SamusSpritemaps_9B43:
    dw $0004                                                             ;929B43;
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0C, $08, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $4204, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9B59:
    dw $0004                                                             ;929B59;
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EC, $08, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1EC, $00, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43EC, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9B6F:
    dw $0003                                                             ;929B6F;
    %spritemapEntry(0, $01, $FE, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F9, $FE, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9B80:
    dw $0002                                                             ;929B80;
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9B8C:
    dw $0004                                                             ;929B8C;
    %spritemapEntry(0, $1FE, $03, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FA, $FF, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9BA2:
    dw $0002                                                             ;929BA2;
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9BAE:
    dw $0003                                                             ;929BAE;
    %spritemapEntry(0, $1FB, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9BBF:
    dw $0002                                                             ;929BBF;
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_9BCB:
    dw $0006                                                             ;929BCB;
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $05, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $0B, $00, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $07, $FC, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FA, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_9BEB:
    dw $0006                                                             ;929BEB;
    %spritemapEntry(0, $1F1, $FC, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1ED, $00, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1FC, $F9, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F4, $F1, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1FC, $F1, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_9C0B:
    dw $0005                                                             ;929C0B;
    %spritemapEntry(0, $1F9, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 4, $03)
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_9C26:
    dw $0005                                                             ;929C26;
    %spritemapEntry(0, $1F9, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 4, $03)
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_9C41:
    dw $0005                                                             ;929C41;
    %spritemapEntry(0, $1F9, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 4, $03)
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_9C5C:
    dw $0005                                                             ;929C5C;
    %spritemapEntry(0, $1F9, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 4, $03)
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_9C77:
    dw $0005                                                             ;929C77;
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FF, $F0, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_9C92:
    dw $0005                                                             ;929C92;
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FF, $F0, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_9CAD:
    dw $0005                                                             ;929CAD;
    %spritemapEntry(0, $1FF, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_9CC8:
    dw $0005                                                             ;929CC8;
    %spritemapEntry(0, $1FF, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_9CE3:
    dw $0005                                                             ;929CE3;
    %spritemapEntry(0, $0C, $E9, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1FD, $F6, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FD, $EE, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $08, $ED, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43FB, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_9CFE:
    dw $0006                                                             ;929CFE;
    %spritemapEntry(0, $1FB, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F3, $F1, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1EC, $E9, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F0, $ED, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F5, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_9D1E:
    dw $0007                                                             ;929D1E;
    %spritemapEntry(0, $1F5, $F1, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1E7, $FA, 0, 1, 2, 4, $04)
    %spritemapEntry(1, $43F6, $EF, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EF, $FA, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F6, $FF, 0, 0, 2, 4, $07)

SamusSpritemaps_9D43:
    dw $0007                                                             ;929D43;
    %spritemapEntry(0, $1FC, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $04, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FC, $F1, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $11, $FA, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $02, $FF, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FA, $EF, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $09, $FA, 0, 0, 2, 4, $07)

SamusSpritemaps_9D68:
    dw $0007                                                             ;929D68;
    %spritemapEntry(0, $1F5, $F1, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1E7, $F9, 0, 1, 2, 4, $04)
    %spritemapEntry(1, $43F6, $EE, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EF, $F9, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1FE, $FE, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 4, $07)

SamusSpritemaps_9D8D:
    dw $0007                                                             ;929D8D;
    %spritemapEntry(0, $1FC, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $04, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FC, $F1, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $11, $F9, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $02, $FE, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FA, $EE, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $09, $F9, 0, 0, 2, 4, $07)

SamusSpritemaps_9DB2:
    dw $0005                                                             ;929DB2;
    %spritemapEntry(0, $0C, $E8, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1FD, $F6, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FD, $EE, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43FB, $EE, 0, 0, 2, 4, $00)

SamusSpritemaps_9DCD:
    dw $0006                                                             ;929DCD;
    %spritemapEntry(0, $1FB, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F3, $F1, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1EC, $E8, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F5, $EE, 0, 0, 2, 4, $00)

SamusSpritemaps_9DED:
    dw $0006                                                             ;929DED;
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $05, $F1, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $0B, $FF, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $07, $FB, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FA, $EE, 0, 0, 2, 4, $00)

SamusSpritemaps_9E0D:
    dw $0006                                                             ;929E0D;
    %spritemapEntry(0, $1F1, $FB, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1FC, $F9, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F4, $F1, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FC, $F1, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1ED, $FF, 0, 1, 2, 4, $06)
    %spritemapEntry(1, $43F6, $EE, 0, 0, 2, 4, $00)

SamusSpritemaps_9E2D:
    dw $0005                                                             ;929E2D;
    %spritemapEntry(0, $01, $FF, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F9, $FF, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F9, $EF, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0A, $FC, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 4, $05)

SamusSpritemaps_9E48:
    dw $0005                                                             ;929E48;
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $EF, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EE, $FC, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 4, $05)

SamusSpritemaps_9E63:
    dw $0006                                                             ;929E63;
    %spritemapEntry(0, $05, $F7, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FD, $F7, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F9, $F5, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F9, $F7, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1F9, $EF, 0, 1, 2, 4, $06)
    %spritemapEntry(1, $43FA, $F0, 0, 1, 2, 4, $00)

SamusSpritemaps_9E83:
    dw $0005                                                             ;929E83;
    %spritemapEntry(0, $05, $EF, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FD, $EF, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F9, $F6, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F9, $EE, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43FA, $F0, 0, 1, 2, 4, $00)

SamusSpritemaps_9E9E:
    dw $0005                                                             ;929E9E;
    %spritemapEntry(0, $1FD, $F6, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F5, $F6, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FE, $F7, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FE, $EF, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F6, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9EB9:
    dw $0005                                                             ;929EB9;
    %spritemapEntry(0, $1F9, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F1, $F0, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FE, $F6, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FE, $EE, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F6, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_9ED4:
    dw $0006                                                             ;929ED4;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F2, $02, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FA, $02, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $F2, 0, 0, 2, 4, $00)

SamusSpritemaps_9EF4:
    dw $0006                                                             ;929EF4;
    %spritemapEntry(0, $1FD, $F5, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F5, $F5, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F3, $03, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FB, $03, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $F3, 0, 0, 2, 4, $00)

SamusSpritemaps_9F14:
    dw $0006                                                             ;929F14;
    %spritemapEntry(0, $1FC, $F6, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F4, $F6, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $F4, 0, 0, 2, 4, $00)

SamusSpritemaps_9F34:
    dw $0007                                                             ;929F34;
    %spritemapEntry(0, $00, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $04, $04, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FE, $02, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43FA, $F2, 0, 1, 2, 4, $00)

SamusSpritemaps_9F59:
    dw $0007                                                             ;929F59;
    %spritemapEntry(0, $1FF, $01, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $03, $05, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FB, $F5, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $03, $F5, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1FD, $03, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43FA, $F3, 0, 1, 2, 4, $00)

SamusSpritemaps_9F7E:
    dw $0007                                                             ;929F7E;
    %spritemapEntry(0, $1FE, $02, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $02, $06, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FC, $F6, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $04, $F6, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1FC, $04, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43FA, $F4, 0, 1, 2, 4, $00)

SamusSpritemaps_9FA3:
    dw $0006                                                             ;929FA3;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F2, $02, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FA, $02, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $F2, 0, 0, 2, 4, $00)

SamusSpritemaps_9FC3:
    dw $0006                                                             ;929FC3;
    %spritemapEntry(0, $1FD, $F5, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F5, $F5, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F3, $03, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FB, $03, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $F3, 0, 0, 2, 4, $00)

SamusSpritemaps_9FE3:
    dw $0006                                                             ;929FE3;
    %spritemapEntry(0, $1FC, $F6, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F4, $F6, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $F4, 0, 0, 2, 4, $00)

SamusSpritemaps_A003:
    dw $0007                                                             ;92A003;
    %spritemapEntry(0, $00, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $04, $04, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1FE, $02, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43FA, $F2, 0, 1, 2, 4, $00)

SamusSpritemaps_A028:
    dw $0007                                                             ;92A028;
    %spritemapEntry(0, $1FF, $01, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $03, $05, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FB, $F5, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $03, $F5, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1FD, $03, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43FA, $F3, 0, 1, 2, 4, $00)

SamusSpritemaps_A04D:
    dw $0007                                                             ;92A04D;
    %spritemapEntry(0, $1FE, $02, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $02, $06, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1FC, $F6, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $04, $F6, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1FC, $04, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 4, $07)
    %spritemapEntry(1, $43FA, $F4, 0, 1, 2, 4, $00)

SamusSpritemaps_A072:
    dw $0004                                                             ;92A072;
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_A088:
    dw $0004                                                             ;92A088;
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_A09E:
    dw $0004                                                             ;92A09E;
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_A0B4:
    dw $0004                                                             ;92A0B4;
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_A0CA:
    dw $0004                                                             ;92A0CA;
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_A0E0:
    dw $0004                                                             ;92A0E0;
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_A0F6:
    dw $0005                                                             ;92A0F6;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F9, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $05)

SamusSpritemaps_A111:
    dw $0005                                                             ;92A111;
    %spritemapEntry(0, $1FF, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F7, $00, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $05)

SamusSpritemaps_A12C:
    dw $0001                                                             ;92A12C;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $00)

SamusSpritemaps_A133:
    dw $0001                                                             ;92A133;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 4, $00)

SamusSpritemaps_A13A:
    dw $0009                                                             ;92A13A;
    %spritemapEntry(0, $04, $10, 0, 0, 3, 4, $00)
    %spritemapEntry(0, $04, $08, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 4, $06)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 4, $07)
    %spritemapEntry(0, $1F4, $E8, 0, 0, 3, 4, $10)

SamusSpritemaps_A169:
    dw $0007                                                             ;92A169;
    %spritemapEntry(0, $04, $00, 0, 0, 3, 4, $00)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 4, $06)

SamusSpritemaps_A18E:
    dw $000B                                                             ;92A18E;
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 4, $00)
    %spritemapEntry(0, $1F4, $10, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $1F4, $08, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 4, $06)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 4, $07)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 4, $10)
    %spritemapEntry(0, $04, $E8, 0, 0, 3, 4, $11)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 4, $12)

SamusSpritemaps_A1C7:
    dw $000F                                                             ;92A1C7;
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 4, $00)
    %spritemapEntry(0, $1F4, $10, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $1F4, $08, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 4, $06)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 4, $07)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 4, $10)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 4, $11)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 4, $12)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 4, $13)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 4, $14)
    %spritemapEntry(0, $04, $E8, 0, 0, 3, 4, $15)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 4, $16)

SamusSpritemaps_A214:
    dw $0008                                                             ;92A214;
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 4, $00)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 4, $06)
    %spritemapEntry(0, $04, $E8, 0, 0, 3, 4, $07)

SamusSpritemaps_A23E:
    dw $000A                                                             ;92A23E;
    %spritemapEntry(0, $1FC, $10, 0, 0, 3, 4, $00)
    %spritemapEntry(0, $04, $08, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 4, $06)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 4, $07)
    %spritemapEntry(0, $04, $E8, 0, 0, 3, 4, $10)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 4, $11)

SamusSpritemaps_A272:
    dw $000B                                                             ;92A272;
    %spritemapEntry(0, $1F4, $10, 0, 0, 3, 4, $00)
    %spritemapEntry(0, $04, $08, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $1F4, $08, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 4, $06)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 4, $07)
    %spritemapEntry(0, $04, $E8, 0, 0, 3, 4, $10)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 4, $11)
    %spritemapEntry(0, $1F4, $E8, 0, 0, 3, 4, $12)

SamusSpritemaps_A2AB:
    dw $0007                                                             ;92A2AB;
    %spritemapEntry(0, $04, $08, 0, 0, 3, 4, $00)
    %spritemapEntry(0, $1F4, $08, 0, 0, 3, 4, $01)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 4, $02)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 4, $03)
    %spritemapEntry(0, $04, $E8, 0, 0, 3, 4, $04)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 4, $05)
    %spritemapEntry(0, $1F4, $E8, 0, 0, 3, 4, $06)

SamusSpritemaps_A2D0:
    dw $0003                                                             ;92A2D0;
    %spritemapEntry(0, $11, $FA, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $09, $FA, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43FA, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_A2E1:
    dw $0003                                                             ;92A2E1;
    %spritemapEntry(0, $11, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $09, $F9, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43FA, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_A2F2:
    dw $0004                                                             ;92A2F2;
    %spritemapEntry(0, $11, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $09, $F9, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $07, $F7, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F7, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_A308:
    dw $0005                                                             ;92A308;
    %spritemapEntry(0, $11, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $05, $EE, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $05, $F6, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F5, $EE, 0, 0, 2, 4, $00)

SamusSpritemaps_A323:
    dw $0003                                                             ;92A323;
    %spritemapEntry(0, $11, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $09, $F9, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43FA, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_A334:
    dw $0004                                                             ;92A334;
    %spritemapEntry(0, $11, $F9, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $09, $F9, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $0A, $F7, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43FA, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_A34A:
    dw $0005                                                             ;92A34A;
    %spritemapEntry(0, $1EF, $FA, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E7, $FA, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F6, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_A365:
    dw $0005                                                             ;92A365;
    %spritemapEntry(0, $1EF, $F9, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E7, $F9, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FF, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F6, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_A380:
    dw $0006                                                             ;92A380;
    %spritemapEntry(0, $1EE, $F7, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F6, $FF, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F6, $EF, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1EF, $F9, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1E7, $F9, 0, 1, 2, 4, $06)

SamusSpritemaps_A3A0:
    dw $0006                                                             ;92A3A0;
    %spritemapEntry(0, $1EE, $F6, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1EF, $F8, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1E7, $F8, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1FE, $FE, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43F6, $EE, 0, 0, 2, 4, $00)

SamusSpritemaps_A3C0:
    dw $0005                                                             ;92A3C0;
    %spritemapEntry(0, $1EF, $F9, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E7, $F9, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F6, $FF, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F6, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_A3DB:
    dw $0007                                                             ;92A3DB;
    %spritemapEntry(0, $1EF, $F9, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E7, $F9, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $06, $FF, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F6, $F7, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F6, $EF, 0, 0, 2, 4, $07)
    %spritemapEntry(1, $43FE, $EF, 0, 0, 2, 4, $00)

SamusSpritemaps_A400:
    dw $0005                                                             ;92A400;
    %spritemapEntry(0, $11, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $0A, $F6, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $0A, $EE, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43FA, $EE, 0, 0, 2, 4, $00)

SamusSpritemaps_A41B:
    dw $0007                                                             ;92A41B;
    %spritemapEntry(0, $1EF, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E7, $F8, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $06, $FE, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FE, $FE, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F6, $EE, 0, 0, 2, 4, $07)
    %spritemapEntry(1, $43FE, $EE, 0, 0, 2, 4, $00)

SamusSpritemaps_A440:
    dw $0003                                                             ;92A440;
    %spritemapEntry(0, $11, $FA, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $09, $FA, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43FA, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_A451:
    dw $0005                                                             ;92A451;
    %spritemapEntry(0, $1EF, $FA, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E7, $FA, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F6, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_A46C:
    dw $0004                                                             ;92A46C;
    %spritemapEntry(0, $1C, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $14, $FD, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $4205, $F6, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 4, $02)

SamusSpritemaps_A482:
    dw $0004                                                             ;92A482;
    %spritemapEntry(0, $1B, $F7, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $13, $F7, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $4204, $F4, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FF, $F6, 0, 0, 2, 4, $02)

SamusSpritemaps_A498:
    dw $0003                                                             ;92A498;
    %spritemapEntry(1, $4210, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $4204, $F3, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43FF, $F5, 0, 0, 2, 4, $04)

SamusSpritemaps_A4A9:
    dw $0003                                                             ;92A4A9;
    %spritemapEntry(1, $4202, $EF, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $420E, $ED, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43FF, $F2, 0, 0, 2, 4, $04)

SamusSpritemaps_A4BA:
    dw $0003                                                             ;92A4BA;
    %spritemapEntry(1, $420C, $E5, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $4202, $EF, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43FF, $F2, 0, 0, 2, 4, $04)

SamusSpritemaps_A4CB:
    dw $0003                                                             ;92A4CB;
    %spritemapEntry(1, $4209, $E5, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $4201, $EF, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43FF, $F2, 0, 0, 2, 4, $04)

SamusSpritemaps_A4DC:
    dw $0003                                                             ;92A4DC;
    %spritemapEntry(1, $4207, $E3, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $4201, $ED, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43FE, $F1, 0, 0, 2, 4, $04)

SamusSpritemaps_A4ED:
    dw $0004                                                             ;92A4ED;
    %spritemapEntry(0, $04, $E6, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $04, $DE, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43FD, $EC, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FB, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_A503:
    dw $0004                                                             ;92A503;
    %spritemapEntry(0, $1FD, $E5, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1FD, $DD, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F6, $EC, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_A519:
    dw $0004                                                             ;92A519;
    %spritemapEntry(0, $1F8, $E6, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F8, $DE, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43F3, $EC, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F7, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_A52F:
    dw $0003                                                             ;92A52F;
    %spritemapEntry(1, $43EE, $E2, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43F3, $ED, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F5, $F1, 0, 0, 2, 4, $04)

SamusSpritemaps_A540:
    dw $0003                                                             ;92A540;
    %spritemapEntry(1, $43E8, $E4, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43F0, $EF, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F2, $F2, 0, 0, 2, 4, $04)

SamusSpritemaps_A551:
    dw $0003                                                             ;92A551;
    %spritemapEntry(1, $43E3, $E5, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43EE, $EF, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F2, $F2, 0, 0, 2, 4, $04)

SamusSpritemaps_A562:
    dw $0003                                                             ;92A562;
    %spritemapEntry(1, $43E0, $E9, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43EB, $F2, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F1, $F3, 0, 0, 2, 4, $04)

SamusSpritemaps_A573:
    dw $0003                                                             ;92A573;
    %spritemapEntry(1, $43E0, $EF, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43EB, $F4, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F1, $F3, 0, 0, 2, 4, $04)

SamusSpritemaps_A584:
    dw $0004                                                             ;92A584;
    %spritemapEntry(0, $1DD, $F7, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1E5, $F7, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43EB, $F9, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F7, 0, 0, 2, 4, $02)

SamusSpritemaps_A59A:
    dw $0004                                                             ;92A59A;
    %spritemapEntry(0, $1DC, $FC, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1E4, $FC, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43EB, $F9, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 4, $02)

SamusSpritemaps_A5B0:
    dw $0008                                                             ;92A5B0;
    %spritemapEntry(0, $01, $FB, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $01, $F3, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F1, $F3, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1DC, $FC, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1E4, $FC, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $1EB, $02, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $1EB, $FA, 0, 0, 2, 4, $15)

SamusSpritemaps_A5DA:
    dw $0008                                                             ;92A5DA;
    %spritemapEntry(0, $1DC, $F8, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1E4, $F8, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $01, $FA, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $01, $F2, 0, 0, 2, 4, $07)
    %spritemapEntry(1, $43F1, $F2, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F7, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1EB, $00, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 4, $15)

SamusSpritemaps_A604:
    dw $000A                                                             ;92A604;
    %spritemapEntry(0, $05, $FA, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $05, $F2, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F5, $F2, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F1, $F5, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E0, $F8, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1E8, $F8, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $1E0, $F0, 0, 1, 2, 4, $14)
    %spritemapEntry(0, $1E8, $F0, 0, 1, 2, 4, $15)
    %spritemapEntry(0, $1EB, $FD, 0, 0, 2, 4, $16)
    %spritemapEntry(0, $1EB, $F5, 0, 0, 2, 4, $17)

SamusSpritemaps_A638:
    dw $000A                                                             ;92A638;
    %spritemapEntry(0, $05, $F9, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $05, $F1, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F5, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F1, $F4, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E0, $F5, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1E8, $F5, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $1E0, $ED, 0, 1, 2, 4, $14)
    %spritemapEntry(0, $1E8, $ED, 0, 1, 2, 4, $15)
    %spritemapEntry(0, $1EB, $FB, 0, 0, 2, 4, $16)
    %spritemapEntry(0, $1EB, $F3, 0, 0, 2, 4, $17)

SamusSpritemaps_A66C:
    dw $0009                                                             ;92A66C;
    %spritemapEntry(0, $1FD, $FE, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F5, $EE, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F2, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1E2, $EC, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1EA, $EC, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1E2, $E4, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $1EA, $E4, 0, 1, 2, 4, $14)
    %spritemapEntry(0, $1F4, $EE, 0, 0, 2, 4, $15)
    %spritemapEntry(0, $1EC, $EE, 0, 0, 2, 4, $16)

SamusSpritemaps_A69B:
    dw $0009                                                             ;92A69B;
    %spritemapEntry(0, $1FE, $FE, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F6, $EE, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F2, $F1, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1F6, $ED, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1EE, $ED, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1ED, $EB, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $1E5, $EB, 0, 1, 2, 4, $14)
    %spritemapEntry(0, $1E5, $E3, 0, 1, 2, 4, $15)
    %spritemapEntry(0, $1ED, $E3, 0, 1, 2, 4, $16)

SamusSpritemaps_A6CA:
    dw $0009                                                             ;92A6CA;
    %spritemapEntry(0, $1E9, $E9, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1FE, $FE, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F6, $EE, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F2, $F1, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1F1, $E9, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1E9, $E1, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $1F1, $E1, 0, 1, 2, 4, $14)
    %spritemapEntry(0, $1F6, $EC, 0, 0, 2, 4, $15)
    %spritemapEntry(0, $1EE, $EC, 0, 0, 2, 4, $16)

SamusSpritemaps_A6F9:
    dw $0008                                                             ;92A6F9;
    %spritemapEntry(0, $00, $02, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F8, $F2, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F6, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F0, $EB, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $1F5, $E5, 0, 1, 2, 4, $14)
    %spritemapEntry(0, $1F5, $DD, 0, 1, 2, 4, $15)

SamusSpritemaps_A723:
    dw $0008                                                             ;92A723;
    %spritemapEntry(0, $1FF, $03, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F7, $03, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F7, $F3, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F9, $F1, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1FC, $DC, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $1FD, $EB, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $1F5, $EB, 0, 0, 2, 4, $15)

SamusSpritemaps_A74D:
    dw $0008                                                             ;92A74D;
    %spritemapEntry(0, $1FF, $01, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F7, $01, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F7, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FA, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $02, $E5, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $02, $DD, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $03, $EB, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $1FB, $EB, 0, 0, 2, 4, $15)

SamusSpritemaps_A777:
    dw $0009                                                             ;92A777;
    %spritemapEntry(0, $0B, $E8, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F1, $FC, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F9, $F4, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FB, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $03, $E8, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $0B, $E0, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $03, $E0, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $05, $EB, 0, 0, 2, 4, $15)
    %spritemapEntry(0, $1FD, $EB, 0, 0, 2, 4, $16)

SamusSpritemaps_A7A6:
    dw $000A                                                             ;92A7A6;
    %spritemapEntry(0, $10, $EA, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $08, $EA, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $10, $E2, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $08, $E2, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $1F1, $FD, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $1F1, $F5, 0, 0, 2, 4, $15)
    %spritemapEntry(1, $43F9, $F5, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FD, $F2, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $08, $ED, 0, 0, 2, 4, $16)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 4, $17)

SamusSpritemaps_A7DA:
    dw $000A                                                             ;92A7DA;
    %spritemapEntry(0, $1F1, $FD, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F1, $F5, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F9, $F5, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FD, $F2, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $13, $EC, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $0B, $EC, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $13, $E4, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $0B, $E4, 0, 0, 2, 4, $15)
    %spritemapEntry(0, $09, $EE, 0, 0, 2, 4, $16)
    %spritemapEntry(0, $01, $EE, 0, 0, 2, 4, $17)

SamusSpritemaps_A80E:
    dw $000A                                                             ;92A80E;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FE, $F4, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $16, $F3, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $0E, $F3, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $16, $EB, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $0E, $EB, 0, 0, 2, 4, $15)
    %spritemapEntry(0, $0A, $F6, 0, 0, 2, 4, $16)
    %spritemapEntry(0, $0A, $EE, 0, 0, 2, 4, $17)

SamusSpritemaps_A842:
    dw $000A                                                             ;92A842;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FE, $F4, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $17, $F7, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $0F, $F7, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $17, $EF, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $0F, $EF, 0, 0, 2, 4, $15)
    %spritemapEntry(0, $0B, $F8, 0, 0, 2, 4, $16)
    %spritemapEntry(0, $0B, $F0, 0, 0, 2, 4, $17)

SamusSpritemaps_A876:
    dw $0009                                                             ;92A876;
    %spritemapEntry(1, $43FE, $F3, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1F6, $FB, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F6, $EB, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FF, $F7, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $0E, $FA, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $0E, $F9, 1, 0, 2, 4, $14)
    %spritemapEntry(0, $1C, $F7, 0, 0, 2, 4, $15)
    %spritemapEntry(0, $14, $F7, 0, 0, 2, 4, $16)

SamusSpritemaps_A8A5:
    dw $0009                                                             ;92A8A5;
    %spritemapEntry(1, $43FE, $F4, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F6, $EC, 0, 0, 2, 4, $06)
    %spritemapEntry(1, $43FF, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1C, $FC, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 4, $14)
    %spritemapEntry(0, $0E, $FD, 0, 0, 2, 4, $15)
    %spritemapEntry(0, $0E, $F5, 0, 0, 2, 4, $16)

SamusSpritemaps_A8D4:
    dw $0004                                                             ;92A8D4;
    %spritemapEntry(0, $1DC, $FB, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1E4, $FB, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43EB, $FA, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F8, 1, 1, 2, 4, $02)

SamusSpritemaps_A8EA:
    dw $0004                                                             ;92A8EA;
    %spritemapEntry(0, $1DD, $01, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1E5, $01, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43EC, $FC, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F1, $FA, 1, 1, 2, 4, $02)

SamusSpritemaps_A900:
    dw $0003                                                             ;92A900;
    %spritemapEntry(1, $43E0, $FF, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43EC, $FD, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43F1, $FB, 1, 1, 2, 4, $04)

SamusSpritemaps_A911:
    dw $0003                                                             ;92A911;
    %spritemapEntry(1, $43EE, $01, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43E2, $03, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43F1, $FE, 1, 1, 2, 4, $04)

SamusSpritemaps_A922:
    dw $0003                                                             ;92A922;
    %spritemapEntry(1, $43E4, $0B, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43EE, $01, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43F1, $FE, 1, 1, 2, 4, $04)

SamusSpritemaps_A933:
    dw $0003                                                             ;92A933;
    %spritemapEntry(1, $43E7, $0B, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43EF, $01, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43F1, $FE, 1, 1, 2, 4, $04)

SamusSpritemaps_A944:
    dw $0003                                                             ;92A944;
    %spritemapEntry(1, $43E9, $0D, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43EF, $03, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43F2, $FF, 1, 1, 2, 4, $04)

SamusSpritemaps_A955:
    dw $0004                                                             ;92A955;
    %spritemapEntry(0, $1F4, $12, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1F4, $1A, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F3, $04, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F5, $00, 1, 1, 2, 4, $02)

SamusSpritemaps_A96B:
    dw $0004                                                             ;92A96B;
    %spritemapEntry(0, $1FB, $13, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1FB, $1B, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43FA, $04, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F8, $00, 1, 1, 2, 4, $02)

SamusSpritemaps_A981:
    dw $0004                                                             ;92A981;
    %spritemapEntry(0, $00, $12, 1, 0, 2, 4, $04)
    %spritemapEntry(0, $00, $1A, 1, 0, 2, 4, $05)
    %spritemapEntry(1, $43FD, $04, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F9, $00, 1, 1, 2, 4, $02)

SamusSpritemaps_A997:
    dw $0003                                                             ;92A997;
    %spritemapEntry(1, $4202, $0E, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $43FD, $03, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43FB, $FF, 1, 1, 2, 4, $04)

SamusSpritemaps_A9A8:
    dw $0003                                                             ;92A9A8;
    %spritemapEntry(1, $4208, $0C, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $4200, $01, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43FE, $FE, 1, 1, 2, 4, $04)

SamusSpritemaps_A9B9:
    dw $0003                                                             ;92A9B9;
    %spritemapEntry(1, $420D, $0B, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $4202, $01, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43FE, $FE, 1, 1, 2, 4, $04)

SamusSpritemaps_A9CA:
    dw $0003                                                             ;92A9CA;
    %spritemapEntry(1, $4210, $07, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $4205, $FE, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43FF, $FD, 1, 1, 2, 4, $04)

SamusSpritemaps_A9DB:
    dw $0003                                                             ;92A9DB;
    %spritemapEntry(1, $4210, $01, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $4205, $FC, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43FF, $FD, 1, 1, 2, 4, $04)

SamusSpritemaps_A9EC:
    dw $0004                                                             ;92A9EC;
    %spritemapEntry(0, $1B, $01, 1, 0, 2, 4, $04)
    %spritemapEntry(0, $13, $01, 1, 0, 2, 4, $05)
    %spritemapEntry(1, $4205, $F7, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $4200, $F9, 1, 1, 2, 4, $02)

SamusSpritemaps_AA02:
    dw $0004                                                             ;92AA02;
    %spritemapEntry(0, $1C, $FC, 1, 0, 2, 4, $04)
    %spritemapEntry(0, $14, $FC, 1, 0, 2, 4, $05)
    %spritemapEntry(1, $4205, $F7, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $4200, $F8, 1, 1, 2, 4, $02)

SamusSpritemaps_AA18:
    dw $0008                                                             ;92AA18;
    %spritemapEntry(0, $1F7, $FD, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1F7, $05, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43FF, $FD, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $4200, $F8, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1C, $FC, 1, 0, 2, 4, $06)
    %spritemapEntry(0, $14, $FC, 1, 0, 2, 4, $07)
    %spritemapEntry(0, $0D, $F6, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $0D, $FE, 1, 1, 2, 4, $15)

SamusSpritemaps_AA42:
    dw $0008                                                             ;92AA42;
    %spritemapEntry(0, $1C, $00, 1, 0, 2, 4, $04)
    %spritemapEntry(0, $14, $00, 1, 0, 2, 4, $05)
    %spritemapEntry(0, $1F7, $FE, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $1F7, $06, 1, 1, 2, 4, $07)
    %spritemapEntry(1, $43FF, $FE, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $4200, $F9, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $0D, $F8, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 4, $15)

SamusSpritemaps_AA6C:
    dw $000A                                                             ;92AA6C;
    %spritemapEntry(0, $1F3, $FE, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1F3, $06, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43FB, $FE, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43FF, $FB, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $18, $00, 1, 0, 2, 4, $06)
    %spritemapEntry(0, $10, $00, 1, 0, 2, 4, $07)
    %spritemapEntry(0, $18, $08, 1, 0, 2, 4, $14)
    %spritemapEntry(0, $10, $08, 1, 0, 2, 4, $15)
    %spritemapEntry(0, $0D, $FB, 1, 1, 2, 4, $16)
    %spritemapEntry(0, $0D, $03, 1, 1, 2, 4, $17)

SamusSpritemaps_AAA0:
    dw $000A                                                             ;92AAA0;
    %spritemapEntry(0, $1F3, $FF, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1F3, $07, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43FB, $FF, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43FF, $FC, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $18, $03, 1, 0, 2, 4, $06)
    %spritemapEntry(0, $10, $03, 1, 0, 2, 4, $07)
    %spritemapEntry(0, $18, $0B, 1, 0, 2, 4, $14)
    %spritemapEntry(0, $10, $0B, 1, 0, 2, 4, $15)
    %spritemapEntry(0, $0D, $FD, 1, 1, 2, 4, $16)
    %spritemapEntry(0, $0D, $05, 1, 1, 2, 4, $17)

SamusSpritemaps_AAD4:
    dw $0009                                                             ;92AAD4;
    %spritemapEntry(0, $1FB, $FA, 1, 1, 2, 4, $04)
    %spritemapEntry(1, $43FB, $02, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $4200, $FE, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $16, $0C, 1, 0, 2, 4, $05)
    %spritemapEntry(0, $0E, $0C, 1, 0, 2, 4, $06)
    %spritemapEntry(0, $16, $14, 1, 0, 2, 4, $07)
    %spritemapEntry(0, $0E, $14, 1, 0, 2, 4, $14)
    %spritemapEntry(0, $04, $0A, 1, 1, 2, 4, $15)
    %spritemapEntry(0, $0C, $0A, 1, 1, 2, 4, $16)

SamusSpritemaps_AB03:
    dw $0009                                                             ;92AB03;
    %spritemapEntry(0, $1FA, $FA, 1, 1, 2, 4, $04)
    %spritemapEntry(1, $43FA, $02, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43FE, $FF, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $02, $0B, 1, 1, 2, 4, $05)
    %spritemapEntry(0, $0A, $0B, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $0B, $0D, 1, 0, 2, 4, $07)
    %spritemapEntry(0, $13, $0D, 1, 0, 2, 4, $14)
    %spritemapEntry(0, $13, $15, 1, 0, 2, 4, $15)
    %spritemapEntry(0, $0B, $15, 1, 0, 2, 4, $16)

SamusSpritemaps_AB32:
    dw $0009                                                             ;92AB32;
    %spritemapEntry(0, $0F, $0F, 1, 0, 2, 4, $04)
    %spritemapEntry(0, $1FA, $FA, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43FA, $02, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43FE, $FF, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $07, $0F, 1, 0, 2, 4, $06)
    %spritemapEntry(0, $0F, $17, 1, 0, 2, 4, $07)
    %spritemapEntry(0, $07, $17, 1, 0, 2, 4, $14)
    %spritemapEntry(0, $02, $0C, 1, 1, 2, 4, $15)
    %spritemapEntry(0, $0A, $0C, 1, 1, 2, 4, $16)

SamusSpritemaps_AB61:
    dw $0008                                                             ;92AB61;
    %spritemapEntry(0, $1F8, $F6, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $00, $F6, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F8, $FE, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43FA, $00, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $08, $0D, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $03, $13, 1, 0, 2, 4, $14)
    %spritemapEntry(0, $03, $1B, 1, 0, 2, 4, $15)

SamusSpritemaps_AB8B:
    dw $0008                                                             ;92AB8B;
    %spritemapEntry(0, $1F9, $F5, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $01, $F5, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F9, $FD, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F7, $FF, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1FC, $14, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $1FC, $1C, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $1FB, $0D, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $03, $0D, 1, 1, 2, 4, $15)

SamusSpritemaps_ABB5:
    dw $0008                                                             ;92ABB5;
    %spritemapEntry(0, $1F9, $F7, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $01, $F7, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F9, $FF, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F6, $00, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1F6, $13, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $1F6, $1B, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $1F5, $0D, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $1FD, $0D, 1, 1, 2, 4, $15)

SamusSpritemaps_ABDF:
    dw $0009                                                             ;92ABDF;
    %spritemapEntry(0, $1ED, $10, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $07, $FC, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F7, $FC, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F5, $00, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1F5, $10, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $1ED, $18, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $1F5, $18, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $1F3, $0D, 1, 1, 2, 4, $15)
    %spritemapEntry(0, $1FB, $0D, 1, 1, 2, 4, $16)

SamusSpritemaps_AC0E:
    dw $000A                                                             ;92AC0E;
    %spritemapEntry(0, $1E8, $0E, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $1F0, $0E, 1, 1, 2, 4, $05)
    %spritemapEntry(0, $1E8, $16, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $1F0, $16, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $07, $FB, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $07, $03, 1, 1, 2, 4, $15)
    %spritemapEntry(1, $43F7, $FB, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F3, $FE, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1F0, $0B, 1, 1, 2, 4, $16)
    %spritemapEntry(0, $1F8, $0B, 1, 1, 2, 4, $17)

SamusSpritemaps_AC42:
    dw $000A                                                             ;92AC42;
    %spritemapEntry(0, $07, $FB, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $07, $03, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F7, $FB, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F3, $FE, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1E5, $0C, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $1ED, $0C, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $1E5, $14, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $1ED, $14, 1, 1, 2, 4, $15)
    %spritemapEntry(0, $1EF, $0A, 1, 1, 2, 4, $16)
    %spritemapEntry(0, $1F7, $0A, 1, 1, 2, 4, $17)

SamusSpritemaps_AC76:
    dw $000A                                                             ;92AC76;
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $04, $04, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F4, $FC, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F2, $FC, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1E2, $05, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $1EA, $05, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $1E2, $0D, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $1EA, $0D, 1, 1, 2, 4, $15)
    %spritemapEntry(0, $1EE, $02, 1, 1, 2, 4, $16)
    %spritemapEntry(0, $1EE, $0A, 1, 1, 2, 4, $17)

SamusSpritemaps_ACAA:
    dw $000A                                                             ;92ACAA;
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $04, $04, 1, 1, 2, 4, $05)
    %spritemapEntry(1, $43F4, $FC, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F2, $FC, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1E1, $01, 1, 1, 2, 4, $06)
    %spritemapEntry(0, $1E9, $01, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $1E1, $09, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $1E9, $09, 1, 1, 2, 4, $15)
    %spritemapEntry(0, $1ED, $00, 1, 1, 2, 4, $16)
    %spritemapEntry(0, $1ED, $08, 1, 1, 2, 4, $17)

SamusSpritemaps_ACDE:
    dw $0009                                                             ;92ACDE;
    %spritemapEntry(1, $43F2, $FD, 1, 1, 2, 4, $00)
    %spritemapEntry(0, $02, $FD, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $02, $05, 1, 1, 2, 4, $05)
    %spritemapEntry(0, $02, $0D, 1, 1, 2, 4, $06)
    %spritemapEntry(1, $43F1, $F9, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1EA, $FE, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $1EA, $FF, 0, 1, 2, 4, $14)
    %spritemapEntry(0, $1DC, $01, 1, 1, 2, 4, $15)
    %spritemapEntry(0, $1E4, $01, 1, 1, 2, 4, $16)

SamusSpritemaps_AD0D:
    dw $0009                                                             ;92AD0D;
    %spritemapEntry(1, $43F2, $FC, 1, 1, 2, 4, $00)
    %spritemapEntry(0, $02, $FC, 1, 1, 2, 4, $04)
    %spritemapEntry(0, $02, $04, 1, 1, 2, 4, $05)
    %spritemapEntry(0, $02, $0C, 1, 1, 2, 4, $06)
    %spritemapEntry(1, $43F1, $F8, 1, 0, 2, 4, $02)
    %spritemapEntry(0, $1DC, $FC, 1, 1, 2, 4, $07)
    %spritemapEntry(0, $1E4, $FC, 1, 1, 2, 4, $14)
    %spritemapEntry(0, $1EA, $FB, 1, 1, 2, 4, $15)
    %spritemapEntry(0, $1EA, $03, 1, 1, 2, 4, $16)

SamusSpritemaps_AD3C:
    dw $0002                                                             ;92AD3C;
    %spritemapEntry(1, $43F8, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AD48:
    dw $0005                                                             ;92AD48;
    %spritemapEntry(1, $43F3, $07, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FB, $FF, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1EB, $0F, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F3, $17, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $03, $0F, 0, 0, 2, 4, $0E)

SamusSpritemaps_AD63:
    dw $0004                                                             ;92AD63;
    %spritemapEntry(1, $43F0, $FF, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $0F, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F8, $FF, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $08, $07, 0, 0, 2, 4, $0E)

SamusSpritemaps_AD79:
    dw $0002                                                             ;92AD79;
    %spritemapEntry(1, $43F7, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F7, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AD85:
    dw $0006                                                             ;92AD85;
    %spritemapEntry(1, $43F3, $07, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FB, $FF, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F3, $FF, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1EB, $0F, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $1F3, $17, 0, 0, 2, 4, $0E)
    %spritemapEntry(0, $03, $0F, 0, 0, 2, 4, $0F)

SamusSpritemaps_ADA5:
    dw $0004                                                             ;92ADA5;
    %spritemapEntry(1, $43EF, $FF, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FF, $0F, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F7, $FF, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F7, $0F, 0, 0, 2, 4, $0E)

SamusSpritemaps_ADBB:
    dw $0003                                                             ;92ADBB;
    %spritemapEntry(1, $43F1, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F9, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F9, $00, 0, 0, 2, 4, $0C)

SamusSpritemaps_ADCC:
    dw $0002                                                             ;92ADCC;
    %spritemapEntry(1, $43EF, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F7, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_ADD8:
    dw $0004                                                             ;92ADD8;
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F3, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F3, $08, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $03, $10, 0, 0, 2, 4, $0D)

SamusSpritemaps_ADEE:
    dw $0006                                                             ;92ADEE;
    %spritemapEntry(1, $43FF, $06, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F7, $FE, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $0F, $0F, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1EF, $0E, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $1EF, $06, 0, 0, 2, 4, $0E)
    %spritemapEntry(0, $07, $16, 0, 0, 2, 4, $0F)

SamusSpritemaps_AE0E:
    dw $0004                                                             ;92AE0E;
    %spritemapEntry(0, $1FB, $18, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F3, $08, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F3, $18, 0, 0, 2, 4, $0D)

SamusSpritemaps_AE24:
    dw $0006                                                             ;92AE24;
    %spritemapEntry(1, $43FE, $06, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F6, $FE, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $0E, $0F, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $06, $16, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $1EE, $0E, 0, 0, 2, 4, $0E)
    %spritemapEntry(0, $1EE, $06, 0, 0, 2, 4, $0F)

SamusSpritemaps_AE44:
    dw $0008                                                             ;92AE44;
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $1F4, $18, 0, 0, 2, 4, $0E)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 4, $0F)
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 4, $1C)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 4, $1D)
    %spritemapEntry(1, $43FC, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FC, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AE6E:
    dw $0008                                                             ;92AE6E;
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $1F4, $18, 0, 0, 2, 4, $0E)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 4, $0F)
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 4, $1C)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 4, $1D)
    %spritemapEntry(1, $43FC, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FC, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AE98:
    dw $0003                                                             ;92AE98;
    %spritemapEntry(1, $43F1, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F9, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F9, $00, 0, 0, 2, 4, $0C)

SamusSpritemaps_AEA9:
    dw $0003                                                             ;92AEA9;
    %spritemapEntry(1, $43F1, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F9, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F9, $00, 0, 0, 2, 4, $0C)

SamusSpritemaps_AEBA:
    dw $0003                                                             ;92AEBA;
    %spritemapEntry(1, $43FF, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F7, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F7, $00, 0, 1, 2, 4, $0C)

SamusSpritemaps_AECB:
    dw $0004                                                             ;92AECB;
    %spritemapEntry(0, $1FB, $0F, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F3, $0F, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1EB, $0F, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F3, $FF, 0, 0, 2, 4, $08)

SamusSpritemaps_AEE1:
    dw $0004                                                             ;92AEE1;
    %spritemapEntry(0, $1FD, $0F, 0, 1, 3, 4, $0A)
    %spritemapEntry(0, $05, $0F, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $0D, $0F, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43FD, $FF, 0, 1, 2, 4, $08)

SamusSpritemaps_AEF7:
    dw $0003                                                             ;92AEF7;
    %spritemapEntry(1, $43FE, $08, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F6, $00, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $06, $00, 0, 0, 2, 4, $0C)

SamusSpritemaps_AF08:
    dw $0003                                                             ;92AF08;
    %spritemapEntry(1, $43F2, $08, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FA, $00, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 4, $0C)

SamusSpritemaps_AF19:
    dw $0003                                                             ;92AF19;
    %spritemapEntry(0, $1F6, $10, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43FE, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_AF2A:
    dw $0003                                                             ;92AF2A;
    %spritemapEntry(0, $02, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F2, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AF3B:
    dw $0003                                                             ;92AF3B;
    %spritemapEntry(0, $1F1, $08, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F1, $00, 0, 0, 2, 4, $0B)
    %spritemapEntry(1, $43F9, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_AF4C:
    dw $0003                                                             ;92AF4C;
    %spritemapEntry(0, $07, $08, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $07, $00, 0, 1, 2, 4, $0B)
    %spritemapEntry(1, $43F7, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_AF5D:
    dw $0002                                                             ;92AF5D;
    %spritemapEntry(1, $43EC, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F4, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AF69:
    dw $0002                                                             ;92AF69;
    %spritemapEntry(1, $4204, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FC, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AF75:
    dw $0004                                                             ;92AF75;
    %spritemapEntry(0, $1E8, $10, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1E8, $08, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_AF8B:
    dw $0004                                                             ;92AF8B;
    %spritemapEntry(0, $10, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AFA1:
    dw $0003                                                             ;92AFA1;
    %spritemapEntry(1, $43FF, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F7, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F7, $00, 0, 1, 2, 4, $0C)

SamusSpritemaps_AFB2:
    dw $0002                                                             ;92AFB2;
    %spritemapEntry(1, $43F4, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FC, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AFBE:
    dw $0002                                                             ;92AFBE;
    %spritemapEntry(1, $43FC, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F4, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_AFCA:
    dw $0004                                                             ;92AFCA;
    %spritemapEntry(0, $1F0, $18, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F0, $10, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F8, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_AFE0:
    dw $0002                                                             ;92AFE0;
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F8, $10, 0, 0, 2, 4, $0A)

SamusSpritemaps_AFEC:
    dw $0001                                                             ;92AFEC;
    %spritemapEntry(1, $43F9, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_AFF3:
    dw $0004                                                             ;92AFF3;
    %spritemapEntry(0, $1F2, $18, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F2, $10, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $43FA, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FA, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B009:
    dw $0002                                                             ;92B009;
    %spritemapEntry(1, $43FA, $0F, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FA, $FF, 0, 1, 2, 4, $0A)

SamusSpritemaps_B015:
    dw $0002                                                             ;92B015;
    %spritemapEntry(1, $43FA, $0F, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FA, $FF, 0, 1, 2, 4, $0A)

SamusSpritemaps_B021:
    dw $0004                                                             ;92B021;
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F2, $0D, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FA, $FD, 0, 0, 2, 4, $0A)

SamusSpritemaps_B037:
    dw $0004                                                             ;92B037;
    %spritemapEntry(0, $06, $15, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $06, $0D, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F6, $FD, 0, 1, 2, 4, $0A)

SamusSpritemaps_B04D:
    dw $0006                                                             ;92B04D;
    %spritemapEntry(0, $08, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $00, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 4, $0E)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_B06D:
    dw $0006                                                             ;92B06D;
    %spritemapEntry(0, $1F0, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1F0, $08, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1F8, $10, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $00, $10, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $1F0, $00, 0, 1, 2, 4, $0E)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_B08D:
    dw $0003                                                             ;92B08D;
    %spritemapEntry(0, $09, $02, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F9, $08, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F9, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B09E:
    dw $0003                                                             ;92B09E;
    %spritemapEntry(0, $1EF, $02, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F7, $08, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F7, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B0AF:
    dw $0002                                                             ;92B0AF;
    %spritemapEntry(1, $43FC, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FC, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B0BB:
    dw $0002                                                             ;92B0BB;
    %spritemapEntry(1, $43F4, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F4, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B0C7:
    dw $0005                                                             ;92B0C7;
    %spritemapEntry(0, $04, $0F, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1FC, $17, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1FC, $0F, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $43FC, $FF, 0, 0, 2, 4, $08)

SamusSpritemaps_B0E2:
    dw $0005                                                             ;92B0E2;
    %spritemapEntry(0, $1F4, $0F, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1FC, $17, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1FC, $0F, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F4, $FF, 0, 1, 2, 4, $08)

SamusSpritemaps_B0FD:
    dw $0001                                                             ;92B0FD;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $08)

SamusSpritemaps_B104:
    dw $0006                                                             ;92B104;
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $02, $10, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1F2, $10, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F2, $08, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 4, $0E)
    %spritemapEntry(1, $43FA, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_B124:
    dw $0006                                                             ;92B124;
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F6, $10, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $06, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $06, $08, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $06, $00, 0, 0, 2, 4, $0E)
    %spritemapEntry(1, $43F6, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_B144:
    dw $0007                                                             ;92B144;
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $04, $02, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 4, $0E)
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 4, $0F)
    %spritemapEntry(1, $43FC, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_B169:
    dw $0005                                                             ;92B169;
    %spritemapEntry(0, $1FC, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $04, $08, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1EC, $00, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F4, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_B184:
    dw $0003                                                             ;92B184;
    %spritemapEntry(1, $43F8, $0F, 0, 0, 2, 4, $08)
    %spritemapEntry(0, $08, $0F, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $FF, 0, 0, 2, 4, $0A)

SamusSpritemaps_B195:
    dw $0003                                                             ;92B195;
    %spritemapEntry(1, $43F8, $0F, 0, 0, 2, 4, $08)
    %spritemapEntry(0, $08, $0F, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $FF, 0, 0, 2, 4, $0A)

SamusSpritemaps_B1A6:
    dw $0003                                                             ;92B1A6;
    %spritemapEntry(1, $43F8, $0F, 0, 1, 2, 4, $08)
    %spritemapEntry(0, $1F0, $0F, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $FF, 0, 1, 2, 4, $0A)

SamusSpritemaps_B1B7:
    dw $0003                                                             ;92B1B7;
    %spritemapEntry(1, $43F8, $0F, 0, 1, 2, 4, $08)
    %spritemapEntry(0, $1F0, $0F, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $FF, 0, 1, 2, 4, $0A)

SamusSpritemaps_B1C8:
    dw $0005                                                             ;92B1C8;
    %spritemapEntry(0, $1F6, $10, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F6, $08, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $1F6, $00, 0, 1, 2, 4, $0E)
    %spritemapEntry(1, $43FE, $08, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B1E3:
    dw $0005                                                             ;92B1E3;
    %spritemapEntry(0, $02, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $02, $08, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $02, $00, 0, 0, 2, 4, $0E)
    %spritemapEntry(1, $43F2, $08, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B1FE:
    dw $0004                                                             ;92B1FE;
    %spritemapEntry(1, $43FD, $08, 0, 1, 2, 4, $08)
    %spritemapEntry(0, $1F8, $18, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F5, $10, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43FD, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B214:
    dw $0004                                                             ;92B214;
    %spritemapEntry(1, $43F3, $08, 0, 0, 2, 4, $08)
    %spritemapEntry(0, $00, $18, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $03, $10, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $43F3, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B22A:
    dw $0002                                                             ;92B22A;
    %spritemapEntry(1, $43FA, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FA, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B236:
    dw $0002                                                             ;92B236;
    %spritemapEntry(0, $04, $08, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F4, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_B242:
    dw $0002                                                             ;92B242;
    %spritemapEntry(0, $1F4, $08, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43FC, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_B24E:
    dw $0006                                                             ;92B24E;
    %spritemapEntry(1, $43F1, $08, 0, 1, 3, 4, $08)
    %spritemapEntry(1, $4200, $08, 0, 0, 3, 4, $08)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 4, $0A)
    %spritemapEntry(1, $4200, $F8, 0, 0, 3, 4, $0C)
    %spritemapEntry(1, $43F1, $E8, 0, 1, 3, 4, $0E)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 4, $0E)

SamusSpritemaps_B26E:
    dw $0006                                                             ;92B26E;
    %spritemapEntry(1, $43F1, $08, 0, 1, 3, 4, $08)
    %spritemapEntry(1, $43F1, $E8, 0, 1, 3, 4, $0A)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 4, $0C)
    %spritemapEntry(1, $4200, $08, 0, 0, 3, 4, $08)
    %spritemapEntry(1, $4200, $F8, 0, 0, 3, 4, $0E)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 4, $0A)

SamusSpritemaps_B28E:
    dw $0001                                                             ;92B28E;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $08)

SamusSpritemaps_B295:
    dw $0004                                                             ;92B295;
    %spritemapEntry(0, $1F1, $18, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F1, $10, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $43F9, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F9, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B2AB:
    dw $0004                                                             ;92B2AB;
    %spritemapEntry(0, $07, $18, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $07, $10, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F7, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F7, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B2C1:
    dw $0002                                                             ;92B2C1;
    %spritemapEntry(1, $43F8, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B2CD:
    dw $0005                                                             ;92B2CD;
    %spritemapEntry(1, $43FD, $07, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F5, $FF, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $0D, $0F, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $05, $17, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $1F5, $0F, 0, 1, 2, 4, $0E)

SamusSpritemaps_B2E8:
    dw $0004                                                             ;92B2E8;
    %spritemapEntry(1, $4200, $FF, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $0F, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F8, $FF, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F0, $07, 0, 1, 2, 4, $0E)

SamusSpritemaps_B2FE:
    dw $0002                                                             ;92B2FE;
    %spritemapEntry(1, $43F9, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F9, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B30A:
    dw $0006                                                             ;92B30A;
    %spritemapEntry(1, $43FD, $07, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F5, $FF, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $05, $FF, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $0D, $0F, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $05, $17, 0, 1, 2, 4, $0E)
    %spritemapEntry(0, $1F5, $0F, 0, 1, 2, 4, $0F)

SamusSpritemaps_B32A:
    dw $0004                                                             ;92B32A;
    %spritemapEntry(1, $4201, $FF, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F1, $0F, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F9, $FF, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $01, $0F, 0, 1, 2, 4, $0E)

SamusSpritemaps_B340:
    dw $0003                                                             ;92B340;
    %spritemapEntry(1, $43FF, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F7, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F7, $00, 0, 1, 2, 4, $0C)

SamusSpritemaps_B351:
    dw $0002                                                             ;92B351;
    %spritemapEntry(1, $4201, $00, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F9, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B35D:
    dw $0004                                                             ;92B35D;
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FD, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $05, $08, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F5, $10, 0, 1, 2, 4, $0D)

SamusSpritemaps_B373:
    dw $0006                                                             ;92B373;
    %spritemapEntry(1, $43F1, $06, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F9, $FE, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1E9, $0F, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $09, $0E, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $09, $06, 0, 1, 2, 4, $0E)
    %spritemapEntry(0, $1F1, $16, 0, 1, 2, 4, $0F)

SamusSpritemaps_B393:
    dw $0004                                                             ;92B393;
    %spritemapEntry(0, $1FD, $18, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FD, $08, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $05, $18, 0, 1, 2, 4, $0D)

SamusSpritemaps_B3A9:
    dw $0006                                                             ;92B3A9;
    %spritemapEntry(1, $43F2, $06, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FA, $FE, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1EA, $0F, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F2, $16, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $0A, $0E, 0, 1, 2, 4, $0E)
    %spritemapEntry(0, $0A, $06, 0, 1, 2, 4, $0F)

SamusSpritemaps_B3C9:
    dw $0004                                                             ;92B3C9;
    %spritemapEntry(0, $08, $18, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $08, $10, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $43F8, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B3DF:
    dw $0001                                                             ;92B3DF;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $08)

SamusSpritemaps_B3E6:
    dw $0001                                                             ;92B3E6;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $08)

SamusSpritemaps_B3ED:
    dw $0004                                                             ;92B3ED;
    %spritemapEntry(0, $06, $18, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $06, $10, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F6, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F6, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B403:
    dw $0002                                                             ;92B403;
    %spritemapEntry(1, $43F6, $0F, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F6, $FF, 0, 0, 2, 4, $0A)

SamusSpritemaps_B40F:
    dw $0002                                                             ;92B40F;
    %spritemapEntry(1, $43F6, $0F, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F6, $FF, 0, 0, 2, 4, $0A)

SamusSpritemaps_B41B:
    dw $0003                                                             ;92B41B;
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 4, $0B)
    %spritemapEntry(1, $43F0, $FC, 0, 0, 2, 4, $08)

SamusSpritemaps_B42C:
    dw $0006                                                             ;92B42C;
    %spritemapEntry(0, $1E9, $0D, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1E9, $05, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1E9, $FD, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F9, $0D, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $1F1, $0D, 0, 0, 2, 4, $0E)
    %spritemapEntry(1, $43F1, $FD, 0, 0, 2, 4, $08)

SamusSpritemaps_B44C:
    dw $0003                                                             ;92B44C;
    %spritemapEntry(1, $43E9, $07, 0, 0, 2, 4, $08)
    %spritemapEntry(0, $1E9, $FF, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F1, $FF, 0, 0, 2, 4, $0A)

SamusSpritemaps_B45D:
    dw $0004                                                             ;92B45D;
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F0, $10, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_B473:
    dw $0005                                                             ;92B473;
    %spritemapEntry(0, $03, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1FB, $10, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1F3, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F3, $08, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_B48E:
    dw $0005                                                             ;92B48E;
    %spritemapEntry(0, $1F5, $08, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $05, $10, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1FD, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F5, $10, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $43FD, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_B4A9:
    dw $0003                                                             ;92B4A9;
    %spritemapEntry(0, $05, $10, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1FD, $10, 0, 0, 2, 4, $0B)
    %spritemapEntry(1, $43FD, $00, 0, 0, 2, 4, $08)

SamusSpritemaps_B4BA:
    dw $0004                                                             ;92B4BA;
    %spritemapEntry(0, $0F, $0F, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $07, $0F, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $4207, $FF, 0, 0, 2, 4, $08)

SamusSpritemaps_B4D0:
    dw $0004                                                             ;92B4D0;
    %spritemapEntry(0, $07, $0B, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $0F, $0B, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $0F, $03, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43FF, $FB, 0, 0, 2, 4, $08)

SamusSpritemaps_B4E6:
    dw $0005                                                             ;92B4E6;
    %spritemapEntry(0, $08, $08, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $10, $00, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 4, $08)

SamusSpritemaps_B501:
    dw $0003                                                             ;92B501;
    %spritemapEntry(0, $10, $08, 0, 0, 2, 0, $0C)
    %spritemapEntry(1, $4210, $F8, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 4, $0A)

SamusSpritemaps_B512:
    dw $0002                                                             ;92B512;
    %spritemapEntry(1, $43F8, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B51E:
    dw $0002                                                             ;92B51E;
    %spritemapEntry(1, $43F8, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B52A:
    dw $0002                                                             ;92B52A;
    %spritemapEntry(1, $43F0, $F9, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43E0, $F9, 0, 0, 2, 4, $0A)

SamusSpritemaps_B536:
    dw $0004                                                             ;92B536;
    %spritemapEntry(0, $1E1, $0F, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1E1, $07, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1F9, $FF, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43E9, $FF, 0, 0, 2, 4, $08)

SamusSpritemaps_B54C:
    dw $0002                                                             ;92B54C;
    %spritemapEntry(1, $43E9, $07, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F1, $FF, 0, 0, 2, 4, $0A)

SamusSpritemaps_B558:
    dw $0002                                                             ;92B558;
    %spritemapEntry(1, $43EB, $0F, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F3, $FF, 0, 0, 2, 4, $0A)

SamusSpritemaps_B564:
    dw $0004                                                             ;92B564;
    %spritemapEntry(0, $1F3, $07, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F3, $0F, 0, 0, 2, 4, $08)
    %spritemapEntry(0, $1FB, $07, 0, 0, 2, 4, $0B)
    %spritemapEntry(0, $1FB, $FF, 0, 0, 2, 4, $0C)

SamusSpritemaps_B57A:
    dw $0002                                                             ;92B57A;
    %spritemapEntry(1, $43F9, $10, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F9, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B586:
    dw $0002                                                             ;92B586;
    %spritemapEntry(1, $43FD, $0E, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FD, $FE, 0, 0, 2, 4, $0A)

SamusSpritemaps_B592:
    dw $0002                                                             ;92B592;
    %spritemapEntry(1, $4207, $0F, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FF, $FF, 0, 0, 2, 4, $0A)

SamusSpritemaps_B59E:
    dw $0004                                                             ;92B59E;
    %spritemapEntry(0, $18, $10, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $18, $08, 0, 0, 2, 4, $0D)
    %spritemapEntry(1, $4208, $08, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_B5B4:
    dw $0002                                                             ;92B5B4;
    %spritemapEntry(1, $420F, $04, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43FF, $FC, 0, 0, 2, 4, $0A)

SamusSpritemaps_B5C0:
    dw $0002                                                             ;92B5C0;
    %spritemapEntry(1, $4200, $F8, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4210, $F8, 1, 1, 2, 4, $0A)

SamusSpritemaps_B5CC:
    dw $0003                                                             ;92B5CC;
    %spritemapEntry(0, $10, $F4, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $10, $FC, 1, 1, 2, 4, $0B)
    %spritemapEntry(1, $4200, $F4, 1, 1, 2, 4, $08)

SamusSpritemaps_B5DD:
    dw $0006                                                             ;92B5DD;
    %spritemapEntry(0, $0F, $EB, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $0F, $F3, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $0F, $FB, 1, 1, 2, 4, $0C)
    %spritemapEntry(0, $1FF, $EB, 1, 1, 2, 4, $0D)
    %spritemapEntry(0, $07, $EB, 1, 1, 2, 4, $0E)
    %spritemapEntry(1, $43FF, $F3, 1, 1, 2, 4, $08)

SamusSpritemaps_B5FD:
    dw $0003                                                             ;92B5FD;
    %spritemapEntry(1, $4207, $E9, 1, 1, 2, 4, $08)
    %spritemapEntry(0, $0F, $F9, 1, 1, 2, 4, $0C)
    %spritemapEntry(1, $43FF, $F1, 1, 1, 2, 4, $0A)

SamusSpritemaps_B60E:
    dw $0004                                                             ;92B60E;
    %spritemapEntry(0, $00, $E8, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $08, $E8, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $08, $F0, 1, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $F0, 1, 1, 2, 4, $08)

SamusSpritemaps_B624:
    dw $0005                                                             ;92B624;
    %spritemapEntry(0, $1F5, $E8, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $1FD, $E8, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $05, $E8, 1, 1, 2, 4, $0C)
    %spritemapEntry(0, $05, $F0, 1, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F5, $F0, 1, 1, 2, 4, $08)

SamusSpritemaps_B63F:
    dw $0005                                                             ;92B63F;
    %spritemapEntry(0, $03, $F0, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $1F3, $E8, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $1FB, $E8, 1, 1, 2, 4, $0C)
    %spritemapEntry(0, $03, $E8, 1, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F3, $F0, 1, 1, 2, 4, $08)

SamusSpritemaps_B65A:
    dw $0003                                                             ;92B65A;
    %spritemapEntry(0, $1F3, $E8, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $1FB, $E8, 1, 1, 2, 4, $0B)
    %spritemapEntry(1, $43F3, $F0, 1, 1, 2, 4, $08)

SamusSpritemaps_B66B:
    dw $0004                                                             ;92B66B;
    %spritemapEntry(0, $1E9, $E9, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $1F1, $E9, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 4, $0C)
    %spritemapEntry(1, $43E9, $F1, 1, 1, 2, 4, $08)

SamusSpritemaps_B681:
    dw $0004                                                             ;92B681;
    %spritemapEntry(0, $1F1, $ED, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $1E9, $ED, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $1E9, $F5, 1, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F1, $F5, 1, 1, 2, 4, $08)

SamusSpritemaps_B697:
    dw $0005                                                             ;92B697;
    %spritemapEntry(0, $1F0, $F0, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $1E8, $00, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $1E8, $F0, 1, 1, 2, 4, $0C)
    %spritemapEntry(0, $1E8, $F8, 1, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F0, $F8, 1, 1, 2, 4, $08)

SamusSpritemaps_B6B2:
    dw $0003                                                             ;92B6B2;
    %spritemapEntry(0, $1E8, $F0, 1, 1, 2, 4, $0C)
    %spritemapEntry(1, $43E0, $F8, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F8, 1, 1, 2, 4, $0A)

SamusSpritemaps_B6C3:
    dw $0002                                                             ;92B6C3;
    %spritemapEntry(1, $43F8, $E0, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F8, $F0, 1, 1, 2, 4, $0A)

SamusSpritemaps_B6CF:
    dw $0002                                                             ;92B6CF;
    %spritemapEntry(1, $43F8, $E0, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F8, $F0, 1, 1, 2, 4, $0A)

SamusSpritemaps_B6DB:
    dw $0002                                                             ;92B6DB;
    %spritemapEntry(1, $4200, $F7, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4210, $F7, 1, 1, 2, 4, $0A)

SamusSpritemaps_B6E7:
    dw $0004                                                             ;92B6E7;
    %spritemapEntry(0, $17, $E9, 1, 1, 2, 4, $0A)
    %spritemapEntry(0, $17, $F1, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $1FF, $F9, 1, 1, 2, 4, $0C)
    %spritemapEntry(1, $4207, $F1, 1, 1, 2, 4, $08)

SamusSpritemaps_B6FD:
    dw $0002                                                             ;92B6FD;
    %spritemapEntry(1, $4207, $E9, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43FF, $F1, 1, 1, 2, 4, $0A)

SamusSpritemaps_B709:
    dw $0002                                                             ;92B709;
    %spritemapEntry(1, $4205, $E1, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43FD, $F1, 1, 1, 2, 4, $0A)

SamusSpritemaps_B715:
    dw $0004                                                             ;92B715;
    %spritemapEntry(0, $05, $F1, 1, 1, 2, 4, $0A)
    %spritemapEntry(1, $43FD, $E1, 1, 1, 2, 4, $08)
    %spritemapEntry(0, $1FD, $F1, 1, 1, 2, 4, $0B)
    %spritemapEntry(0, $1FD, $F9, 1, 1, 2, 4, $0C)

SamusSpritemaps_B72B:
    dw $0002                                                             ;92B72B;
    %spritemapEntry(1, $43F7, $E0, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F7, $F0, 1, 1, 2, 4, $0A)

SamusSpritemaps_B737:
    dw $0002                                                             ;92B737;
    %spritemapEntry(1, $43F3, $E2, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F3, $F2, 1, 1, 2, 4, $0A)

SamusSpritemaps_B743:
    dw $0002                                                             ;92B743;
    %spritemapEntry(1, $43E9, $E1, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F1, $F1, 1, 1, 2, 4, $0A)

SamusSpritemaps_B74F:
    dw $0002                                                             ;92B74F;
    %spritemapEntry(1, $43E1, $EC, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F1, $F4, 1, 1, 2, 4, $0A)

SamusSpritemaps_B75B:
    dw $0002                                                             ;92B75B;
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43E0, $F8, 0, 0, 2, 4, $0A)

SamusSpritemaps_B767:
    dw $0003                                                             ;92B767;
    %spritemapEntry(0, $10, $04, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 4, $0B)
    %spritemapEntry(1, $4200, $FC, 0, 1, 2, 4, $08)

SamusSpritemaps_B778:
    dw $0006                                                             ;92B778;
    %spritemapEntry(0, $0F, $0D, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $0F, $05, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $0F, $FD, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1FF, $0D, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $07, $0D, 0, 1, 2, 4, $0E)
    %spritemapEntry(1, $43FF, $FD, 0, 1, 2, 4, $08)

SamusSpritemaps_B798:
    dw $0003                                                             ;92B798;
    %spritemapEntry(1, $4207, $07, 0, 1, 2, 4, $08)
    %spritemapEntry(0, $0F, $FF, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43FF, $FF, 0, 1, 2, 4, $0A)

SamusSpritemaps_B7A9:
    dw $0004                                                             ;92B7A9;
    %spritemapEntry(0, $00, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $08, $10, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_B7BF:
    dw $0005                                                             ;92B7BF;
    %spritemapEntry(0, $1F5, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1FD, $10, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $05, $10, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $05, $08, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_B7DA:
    dw $0005                                                             ;92B7DA;
    %spritemapEntry(0, $03, $08, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1F3, $10, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1FB, $10, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $03, $10, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F3, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_B7F5:
    dw $0003                                                             ;92B7F5;
    %spritemapEntry(0, $1F3, $10, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1FB, $10, 0, 1, 2, 4, $0B)
    %spritemapEntry(1, $43F3, $00, 0, 1, 2, 4, $08)

SamusSpritemaps_B806:
    dw $0004                                                             ;92B806;
    %spritemapEntry(0, $1E9, $0F, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1F1, $0F, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43E9, $FF, 0, 1, 2, 4, $08)

SamusSpritemaps_B81C:
    dw $0004                                                             ;92B81C;
    %spritemapEntry(0, $1F1, $0B, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1E9, $0B, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1E9, $03, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F1, $FB, 0, 1, 2, 4, $08)

SamusSpritemaps_B832:
    dw $0005                                                             ;92B832;
    %spritemapEntry(0, $1F0, $08, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1E8, $F8, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1E8, $08, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1E8, $00, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 4, $08)

SamusSpritemaps_B84D:
    dw $0003                                                             ;92B84D;
    %spritemapEntry(0, $1E8, $08, 0, 1, 2, 0, $0C)
    %spritemapEntry(1, $43E0, $F8, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 4, $0A)

SamusSpritemaps_B85E:
    dw $0002                                                             ;92B85E;
    %spritemapEntry(1, $43F8, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B86A:
    dw $0002                                                             ;92B86A;
    %spritemapEntry(1, $43F8, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B876:
    dw $0002                                                             ;92B876;
    %spritemapEntry(1, $4200, $F9, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4210, $F9, 0, 1, 2, 4, $0A)

SamusSpritemaps_B882:
    dw $0004                                                             ;92B882;
    %spritemapEntry(0, $17, $0F, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $17, $07, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1FF, $FF, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $4207, $FF, 0, 1, 2, 4, $08)

SamusSpritemaps_B898:
    dw $0002                                                             ;92B898;
    %spritemapEntry(1, $4207, $07, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FF, $FF, 0, 1, 2, 4, $0A)

SamusSpritemaps_B8A4:
    dw $0002                                                             ;92B8A4;
    %spritemapEntry(1, $4205, $0F, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FD, $FF, 0, 1, 2, 4, $0A)

SamusSpritemaps_B8B0:
    dw $0004                                                             ;92B8B0;
    %spritemapEntry(0, $05, $07, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43FD, $0F, 0, 1, 2, 4, $08)
    %spritemapEntry(0, $1FD, $07, 0, 1, 2, 4, $0B)
    %spritemapEntry(0, $1FD, $FF, 0, 1, 2, 4, $0C)

SamusSpritemaps_B8C6:
    dw $0002                                                             ;92B8C6;
    %spritemapEntry(1, $43F7, $10, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F7, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B8D2:
    dw $0002                                                             ;92B8D2;
    %spritemapEntry(1, $43F3, $0E, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F3, $FE, 0, 1, 2, 4, $0A)

SamusSpritemaps_B8DE:
    dw $0002                                                             ;92B8DE;
    %spritemapEntry(1, $43E9, $0F, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F1, $FF, 0, 1, 2, 4, $0A)

SamusSpritemaps_B8EA:
    dw $0004                                                             ;92B8EA;
    %spritemapEntry(0, $1E0, $10, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1E0, $08, 0, 1, 2, 4, $0D)
    %spritemapEntry(1, $43E8, $08, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_B900:
    dw $0002                                                             ;92B900;
    %spritemapEntry(1, $43E1, $04, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F1, $FC, 0, 1, 2, 4, $0A)

SamusSpritemaps_B90C:
    dw $0002                                                             ;92B90C;
    %spritemapEntry(1, $43F0, $F8, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43E0, $F8, 1, 0, 2, 4, $0A)

SamusSpritemaps_B918:
    dw $0003                                                             ;92B918;
    %spritemapEntry(0, $1E8, $F4, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $1E8, $FC, 1, 0, 2, 4, $0B)
    %spritemapEntry(1, $43F0, $F4, 1, 0, 2, 4, $08)

SamusSpritemaps_B929:
    dw $0006                                                             ;92B929;
    %spritemapEntry(0, $1E9, $EB, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $1E9, $F3, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $1E9, $FB, 1, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F9, $EB, 1, 0, 2, 4, $0D)
    %spritemapEntry(0, $1F1, $EB, 1, 0, 2, 4, $0E)
    %spritemapEntry(1, $43F1, $F3, 1, 0, 2, 4, $08)

SamusSpritemaps_B949:
    dw $0003                                                             ;92B949;
    %spritemapEntry(1, $43E9, $E9, 1, 0, 2, 4, $08)
    %spritemapEntry(0, $1E9, $F9, 1, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F1, $F1, 1, 0, 2, 4, $0A)

SamusSpritemaps_B95A:
    dw $0004                                                             ;92B95A;
    %spritemapEntry(0, $1F8, $E8, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F0, $E8, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $1F0, $F0, 1, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $F0, 1, 0, 2, 4, $08)

SamusSpritemaps_B970:
    dw $0005                                                             ;92B970;
    %spritemapEntry(0, $03, $E8, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $1FB, $E8, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $1F3, $E8, 1, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F3, $F0, 1, 0, 2, 4, $0D)
    %spritemapEntry(1, $43FB, $F0, 1, 0, 2, 4, $08)

SamusSpritemaps_B98B:
    dw $0005                                                             ;92B98B;
    %spritemapEntry(0, $1F5, $F0, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $05, $E8, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $1FD, $E8, 1, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F5, $E8, 1, 0, 2, 4, $0D)
    %spritemapEntry(1, $43FD, $F0, 1, 0, 2, 4, $08)

SamusSpritemaps_B9A6:
    dw $0003                                                             ;92B9A6;
    %spritemapEntry(0, $05, $E8, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $1FD, $E8, 1, 0, 2, 4, $0B)
    %spritemapEntry(1, $43FD, $F0, 1, 0, 2, 4, $08)

SamusSpritemaps_B9B7:
    dw $0004                                                             ;92B9B7;
    %spritemapEntry(0, $0F, $E9, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $07, $E9, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 4, $0C)
    %spritemapEntry(1, $4207, $F1, 1, 0, 2, 4, $08)

SamusSpritemaps_B9CD:
    dw $0004                                                             ;92B9CD;
    %spritemapEntry(0, $07, $ED, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $0F, $ED, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $0F, $F5, 1, 0, 2, 4, $0C)
    %spritemapEntry(1, $43FF, $F5, 1, 0, 2, 4, $08)

SamusSpritemaps_B9E3:
    dw $0005                                                             ;92B9E3;
    %spritemapEntry(0, $08, $F0, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $10, $00, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $10, $F0, 1, 0, 2, 4, $0C)
    %spritemapEntry(0, $10, $F8, 1, 0, 2, 4, $0D)
    %spritemapEntry(1, $4200, $F8, 1, 0, 2, 4, $08)

SamusSpritemaps_B9FE:
    dw $0003                                                             ;92B9FE;
    %spritemapEntry(0, $10, $F0, 1, 0, 2, 4, $0C)
    %spritemapEntry(1, $4210, $F8, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F8, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA0F:
    dw $0002                                                             ;92BA0F;
    %spritemapEntry(1, $43F8, $E0, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F8, $F0, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA1B:
    dw $0002                                                             ;92BA1B;
    %spritemapEntry(1, $43F8, $E0, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F8, $F0, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA27:
    dw $0002                                                             ;92BA27;
    %spritemapEntry(1, $43F0, $F7, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43E0, $F7, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA33:
    dw $0004                                                             ;92BA33;
    %spritemapEntry(0, $1E1, $E9, 1, 0, 2, 4, $0A)
    %spritemapEntry(0, $1E1, $F1, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $1F9, $F9, 1, 0, 2, 4, $0C)
    %spritemapEntry(1, $43E9, $F1, 1, 0, 2, 4, $08)

SamusSpritemaps_BA49:
    dw $0002                                                             ;92BA49;
    %spritemapEntry(1, $43E9, $E9, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F1, $F1, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA55:
    dw $0002                                                             ;92BA55;
    %spritemapEntry(1, $43EB, $E1, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F3, $F1, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA61:
    dw $0004                                                             ;92BA61;
    %spritemapEntry(0, $1F3, $F1, 1, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F3, $E1, 1, 0, 2, 4, $08)
    %spritemapEntry(0, $1FB, $F1, 1, 0, 2, 4, $0B)
    %spritemapEntry(0, $1FB, $F9, 1, 0, 2, 4, $0C)

SamusSpritemaps_BA77:
    dw $0002                                                             ;92BA77;
    %spritemapEntry(1, $43F9, $E0, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F9, $F0, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA83:
    dw $0002                                                             ;92BA83;
    %spritemapEntry(1, $43FD, $E2, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43FD, $F2, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA8F:
    dw $0002                                                             ;92BA8F;
    %spritemapEntry(1, $4207, $E1, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43FF, $F1, 1, 0, 2, 4, $0A)

SamusSpritemaps_BA9B:
    dw $0002                                                             ;92BA9B;
    %spritemapEntry(1, $420F, $EC, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43FF, $F4, 1, 0, 2, 4, $0A)

SamusSpritemaps_BAA7:
    dw $0002                                                             ;92BAA7;
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4210, $F8, 0, 1, 2, 4, $0A)

SamusSpritemaps_BAB3:
    dw $0002                                                             ;92BAB3;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 4, $00)

SamusSpritemaps_BABF:
    dw $0002                                                             ;92BABF;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 4, $00)

SamusSpritemaps_BACB:
    dw $0002                                                             ;92BACB;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 4, $00)

SamusSpritemaps_BAD7:
    dw $0002                                                             ;92BAD7;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 4, $00)

SamusSpritemaps_BAE3:
    dw $0005                                                             ;92BAE3;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $00, $FF, 0, 0, 2, 4, $01)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $00, $F7, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F8, $F7, 0, 0, 2, 4, $04)

SamusSpritemaps_BAFE:
    dw $0002                                                             ;92BAFE;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F9, 0, 0, 2, 4, $00)

SamusSpritemaps_BB0A:
    dw $0002                                                             ;92BB0A;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F7, 1, 0, 2, 4, $00)

SamusSpritemaps_BB16:
    dw $0002                                                             ;92BB16;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F9, 0, 1, 2, 4, $00)

SamusSpritemaps_BB22:
    dw $0002                                                             ;92BB22;
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 4, $02)

SamusSpritemaps_BB2E:
    dw $0004                                                             ;92BB2E;
    %spritemapEntry(1, $4200, $F1, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $01, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $4200, $01, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 2, 4, $06)

SamusSpritemaps_BB44:
    dw $0002                                                             ;92BB44;
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 4, $02)

SamusSpritemaps_BB50:
    dw $0004                                                             ;92BB50;
    %spritemapEntry(1, $4201, $01, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F1, $F1, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $43F1, $01, 1, 1, 2, 4, $04)
    %spritemapEntry(1, $4201, $F1, 1, 1, 2, 4, $06)

SamusSpritemaps_BB66:
    dw $0002                                                             ;92BB66;
    %spritemapEntry(1, $43F8, $F0, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $43F8, $00, 1, 1, 2, 4, $02)

SamusSpritemaps_BB72:
    dw $0004                                                             ;92BB72;
    %spritemapEntry(1, $43F1, $FF, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $4201, $EF, 1, 1, 2, 4, $02)
    %spritemapEntry(1, $4201, $FF, 1, 1, 2, 4, $04)
    %spritemapEntry(1, $43F1, $EF, 1, 1, 2, 4, $06)

SamusSpritemaps_BB88:
    dw $0002                                                             ;92BB88;
    %spritemapEntry(1, $43F0, $F8, 1, 1, 2, 4, $00)
    %spritemapEntry(1, $4200, $F8, 1, 1, 2, 4, $02)

SamusSpritemaps_BB94:
    dw $0004                                                             ;92BB94;
    %spritemapEntry(1, $43EF, $EE, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43FF, $FE, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43EF, $FE, 0, 0, 2, 4, $04)
    %spritemapEntry(1, $43FF, $EE, 0, 0, 2, 4, $06)

SamusSpritemaps_BBAA:
    dw $000A                                                             ;92BBAA;
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1F0, $0A, 0, 0, 2, 4, $01)
    %spritemapEntry(0, $0A, $00, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1EE, $00, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $0A, $F6, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1EE, $F8, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $0A, $EE, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $00, $EE, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 4, $10)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 4, $11)

SamusSpritemaps_BBDE:
    dw $000B                                                             ;92BBDE;
    %spritemapEntry(0, $00, $08, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 4, $01)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $1F0, $F6, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 4, $10)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 4, $11)
    %spritemapEntry(0, $1F0, $EE, 0, 0, 2, 4, $12)

SamusSpritemaps_BC17:
    dw $000B                                                             ;92BC17;
    %spritemapEntry(0, $0A, $08, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $02, $08, 0, 0, 2, 4, $01)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $0A, $00, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1EE, $00, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $0A, $F6, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1EE, $F8, 0, 0, 2, 4, $07)
    %spritemapEntry(0, $0A, $EE, 0, 0, 2, 4, $10)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 4, $11)
    %spritemapEntry(0, $1F0, $EE, 0, 0, 2, 4, $12)

SamusSpritemaps_BC50:
    dw $0008                                                             ;92BC50;
    %spritemapEntry(0, $08, $08, 0, 0, 2, 4, $00)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 4, $01)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 4, $05)
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 4, $07)

SamusSpritemaps_BC7A:
    dw $0001                                                             ;92BC7A;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 1, 0, $00)

SamusSpritemaps_BC81:
    dw $0001                                                             ;92BC81;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 4, $00)

SamusSpritemaps_BC88:
    dw $0002                                                             ;92BC88;
    %spritemapEntry(0, $07, $FC, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F7, $F9, 0, 0, 2, 4, $00)

SamusSpritemaps_BC94:
    dw $0002                                                             ;92BC94;
    %spritemapEntry(0, $1FD, $07, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F7, 0, 0, 2, 4, $00)

SamusSpritemaps_BCA0:
    dw $0003                                                             ;92BCA0;
    %spritemapEntry(0, $00, $05, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 4, $03)
    %spritemapEntry(1, $43F8, $F5, 0, 0, 2, 4, $00)

SamusSpritemaps_BCB1:
    dw $0005                                                             ;92BCB1;
    %spritemapEntry(0, $00, $0A, 0, 0, 2, 4, $02)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 4, $03)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 4, $04)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 4, $05)
    %spritemapEntry(1, $43F8, $F2, 0, 0, 2, 4, $00)

SamusSpritemaps_BCCC:
    dw $0003                                                             ;92BCCC;
    %spritemapEntry(0, $1F8, $05, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 4, $03)
    %spritemapEntry(1, $43F8, $F5, 0, 1, 2, 4, $00)

SamusSpritemaps_BCDD:
    dw $0005                                                             ;92BCDD;
    %spritemapEntry(0, $1F8, $0A, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 4, $05)
    %spritemapEntry(1, $43F8, $F2, 0, 1, 2, 4, $00)

SamusSpritemaps_BCF8:
    dw $0002                                                             ;92BCF8;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 4, $00)

SamusSpritemaps_BD04:
    dw $0002                                                             ;92BD04;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 4, $00)

SamusSpritemaps_BD10:
    dw $0002                                                             ;92BD10;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 4, $00)

SamusSpritemaps_BD1C:
    dw $0002                                                             ;92BD1C;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 4, $00)

SamusSpritemaps_BD28:
    dw $0005                                                             ;92BD28;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 4, $00)
    %spritemapEntry(0, $1F8, $FF, 0, 1, 2, 4, $01)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1F8, $F7, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $00, $F7, 0, 1, 2, 4, $04)

SamusSpritemaps_BD43:
    dw $0002                                                             ;92BD43;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F9, 0, 1, 2, 4, $00)

SamusSpritemaps_BD4F:
    dw $0002                                                             ;92BD4F;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F7, 1, 1, 2, 4, $00)

SamusSpritemaps_BD5B:
    dw $0002                                                             ;92BD5B;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $F9, 0, 0, 2, 4, $00)

SamusSpritemaps_BD67:
    dw $0002                                                             ;92BD67;
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 4, $02)

SamusSpritemaps_BD73:
    dw $0004                                                             ;92BD73;
    %spritemapEntry(1, $43F0, $F1, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $4200, $01, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F0, $01, 0, 1, 2, 4, $04)
    %spritemapEntry(1, $4200, $F1, 0, 1, 2, 4, $06)

SamusSpritemaps_BD89:
    dw $0002                                                             ;92BD89;
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 4, $02)

SamusSpritemaps_BD95:
    dw $0004                                                             ;92BD95;
    %spritemapEntry(1, $43EF, $01, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $43FF, $F1, 1, 0, 2, 4, $02)
    %spritemapEntry(1, $43FF, $01, 1, 0, 2, 4, $04)
    %spritemapEntry(1, $43EF, $F1, 1, 0, 2, 4, $06)

SamusSpritemaps_BDAB:
    dw $0002                                                             ;92BDAB;
    %spritemapEntry(1, $43F8, $F0, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $00, 1, 0, 2, 4, $02)

SamusSpritemaps_BDB7:
    dw $0004                                                             ;92BDB7;
    %spritemapEntry(1, $43FF, $FF, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $43EF, $EF, 1, 0, 2, 4, $02)
    %spritemapEntry(1, $43EF, $FF, 1, 0, 2, 4, $04)
    %spritemapEntry(1, $43FF, $EF, 1, 0, 2, 4, $06)

SamusSpritemaps_BDCD:
    dw $0002                                                             ;92BDCD;
    %spritemapEntry(1, $4200, $F8, 1, 0, 2, 4, $00)
    %spritemapEntry(1, $43F0, $F8, 1, 0, 2, 4, $02)

SamusSpritemaps_BDD9:
    dw $0004                                                             ;92BDD9;
    %spritemapEntry(1, $4201, $EE, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43F1, $FE, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $4201, $FE, 0, 1, 2, 4, $04)
    %spritemapEntry(1, $43F1, $EE, 0, 1, 2, 4, $06)

SamusSpritemaps_BDEF:
    dw $000A                                                             ;92BDEF;
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 4, $00)
    %spritemapEntry(0, $08, $0A, 0, 1, 2, 4, $01)
    %spritemapEntry(0, $1EE, $00, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $0A, $00, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1EE, $F6, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $0A, $F8, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1EE, $EE, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1F8, $EE, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $00, $EE, 0, 1, 2, 4, $10)
    %spritemapEntry(0, $0A, $F0, 0, 1, 2, 4, $11)

SamusSpritemaps_BE23:
    dw $000B                                                             ;92BE23;
    %spritemapEntry(0, $1F8, $08, 0, 1, 2, 4, $00)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 4, $01)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $1F0, $00, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $08, $F6, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $1F0, $F0, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $1F8, $F0, 0, 1, 2, 4, $10)
    %spritemapEntry(0, $00, $EE, 0, 1, 2, 4, $11)
    %spritemapEntry(0, $08, $EE, 0, 1, 2, 4, $12)

SamusSpritemaps_BE5C:
    dw $000B                                                             ;92BE5C;
    %spritemapEntry(0, $1EE, $08, 0, 1, 2, 4, $00)
    %spritemapEntry(0, $1F6, $08, 0, 1, 2, 4, $01)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1EE, $00, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $0A, $00, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1EE, $F6, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $0A, $F8, 0, 1, 2, 4, $07)
    %spritemapEntry(0, $1EE, $EE, 0, 1, 2, 4, $10)
    %spritemapEntry(0, $00, $EE, 0, 1, 2, 4, $11)
    %spritemapEntry(0, $08, $EE, 0, 1, 2, 4, $12)

SamusSpritemaps_BE95:
    dw $0008                                                             ;92BE95;
    %spritemapEntry(0, $1F0, $08, 0, 1, 2, 4, $00)
    %spritemapEntry(0, $1F8, $08, 0, 1, 2, 4, $01)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 4, $02)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 4, $03)
    %spritemapEntry(0, $1F0, $00, 0, 1, 2, 4, $04)
    %spritemapEntry(0, $1F0, $F0, 0, 1, 2, 4, $05)
    %spritemapEntry(0, $1F8, $F0, 0, 1, 2, 4, $06)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 4, $07)

SamusSpritemaps_BEBF:
    dw $0001                                                             ;92BEBF;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $00)

SamusSpritemaps_BEC6:
    dw $0002                                                             ;92BEC6;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)

SamusSpritemaps_BED2:
    dw $0004                                                             ;92BED2;
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)

SamusSpritemaps_BEE8:
    dw $0002                                                             ;92BEE8;
    %spritemapEntry(1, $43F0, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 4, $08)

SamusSpritemaps_BEF4:
    dw $0004                                                             ;92BEF4;
    %spritemapEntry(1, $4200, $00, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)

SamusSpritemaps_BF0A:
    dw $0002                                                             ;92BF0A;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)

SamusSpritemaps_BF16:
    dw $0004                                                             ;92BF16;
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $0A)

SamusSpritemaps_BF2C:
    dw $0002                                                             ;92BF2C;
    %spritemapEntry(1, $43F0, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 4, $08)

SamusSpritemaps_BF38:
    dw $0004                                                             ;92BF38;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $F0, 1, 0, 2, 4, $0A)

SamusSpritemaps_BF4E:
    dw $0004                                                             ;92BF4E;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)

SamusSpritemaps_BF64:
    dw $0004                                                             ;92BF64;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $0A)

SamusSpritemaps_BF7A:
    dw $0004                                                             ;92BF7A;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)

SamusSpritemaps_BF90:
    dw $0004                                                             ;92BF90;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)

SamusSpritemaps_BFA6:
    dw $0004                                                             ;92BFA6;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)

SamusSpritemaps_BFBC:
    dw $0004                                                             ;92BFBC;
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $0A)

SamusSpritemaps_BFD2:
    dw $0004                                                             ;92BFD2;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)

SamusSpritemaps_BFE8:
    dw $0004                                                             ;92BFE8;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)

SamusSpritemaps_BFFE:
    dw $0004                                                             ;92BFFE;
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)

SamusSpritemaps_C014:
    dw $0002                                                             ;92C014;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)

SamusSpritemaps_C020:
    dw $0004                                                             ;92C020;
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $0A)

SamusSpritemaps_C036:
    dw $0002                                                             ;92C036;
    %spritemapEntry(1, $4200, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 1, 2, 4, $08)

SamusSpritemaps_C042:
    dw $0004                                                             ;92C042;
    %spritemapEntry(1, $43F0, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $0A)

SamusSpritemaps_C058:
    dw $0002                                                             ;92C058;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)

SamusSpritemaps_C064:
    dw $0004                                                             ;92C064;
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)

SamusSpritemaps_C07A:
    dw $0002                                                             ;92C07A;
    %spritemapEntry(1, $4200, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 1, 2, 4, $08)

SamusSpritemaps_C086:
    dw $0004                                                             ;92C086;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $F0, 1, 1, 2, 4, $0A)

SamusSpritemaps_C09C:
    dw $0004                                                             ;92C09C;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)

SamusSpritemaps_C0B2:
    dw $0004                                                             ;92C0B2;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)

SamusSpritemaps_C0C8:
    dw $0004                                                             ;92C0C8;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)

SamusSpritemaps_C0DE:
    dw $0004                                                             ;92C0DE;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $0A)

SamusSpritemaps_C0F4:
    dw $0004                                                             ;92C0F4;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)

SamusSpritemaps_C10A:
    dw $0004                                                             ;92C10A;
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)

SamusSpritemaps_C120:
    dw $0004                                                             ;92C120;
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)

SamusSpritemaps_C136:
    dw $0004                                                             ;92C136;
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $0A)

SamusSpritemaps_C14C:
    dw $0004                                                             ;92C14C;
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)

SamusSpritemaps_C162:
    dw $0005                                                             ;92C162;
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $07)
    %spritemapEntry(1, $43F8, $08, 0, 1, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 2, 4, $04)

SamusSpritemaps_C17D:
    dw $0005                                                             ;92C17D;
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 4, $06)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 4, $07)
    %spritemapEntry(1, $43F8, $08, 0, 0, 2, 4, $00)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 2, 4, $04)

SamusSpritemaps_C198:
    dw $0007                                                             ;92C198;
    %spritemapEntry(1, $43F8, $EC, 0, 0, 2, 6, $00)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 6, $02)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 6, $03)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $04)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $05)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $06)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $07)

SamusSpritemaps_C1BD:
    dw $0007                                                             ;92C1BD;
    %spritemapEntry(1, $43F8, $EB, 0, 0, 2, 6, $00)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $02)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $03)
    %spritemapEntry(0, $00, $03, 0, 0, 2, 6, $04)
    %spritemapEntry(0, $1F8, $03, 0, 0, 2, 6, $05)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 6, $06)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 6, $07)

SamusSpritemaps_C1E2:
    dw $0007                                                             ;92C1E2;
    %spritemapEntry(1, $43F8, $EA, 0, 0, 2, 6, $00)
    %spritemapEntry(0, $00, $0A, 0, 0, 2, 6, $02)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 6, $03)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 6, $04)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 6, $05)
    %spritemapEntry(0, $00, $FA, 0, 0, 2, 6, $06)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 2, 6, $07)

SamusSpritemaps_C207:
    dw $0007                                                             ;92C207;
    %spritemapEntry(1, $43F8, $EC, 0, 1, 2, 6, $00)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 6, $02)
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 6, $03)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $04)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 6, $05)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $06)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $07)

SamusSpritemaps_C22C:
    dw $0007                                                             ;92C22C;
    %spritemapEntry(1, $43F8, $EB, 0, 1, 2, 6, $00)
    %spritemapEntry(0, $1F8, $0B, 0, 1, 2, 6, $02)
    %spritemapEntry(0, $00, $0B, 0, 1, 2, 6, $03)
    %spritemapEntry(0, $1F8, $03, 0, 1, 2, 6, $04)
    %spritemapEntry(0, $00, $03, 0, 1, 2, 6, $05)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 6, $06)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 6, $07)

SamusSpritemaps_C251:
    dw $0007                                                             ;92C251;
    %spritemapEntry(1, $43F8, $EA, 0, 1, 2, 6, $00)
    %spritemapEntry(0, $1F8, $0A, 0, 1, 2, 6, $02)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 6, $03)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 6, $04)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 6, $05)
    %spritemapEntry(0, $1F8, $FA, 0, 1, 2, 6, $06)
    %spritemapEntry(0, $00, $FA, 0, 1, 2, 6, $07)

SamusSpritemaps_C276:
    dw $0004                                                             ;92C276;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 6, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 6, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 6, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 6, $08)

SamusSpritemaps_C28C:
    dw $0010                                                             ;92C28C;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 6, $08)
    %spritemapEntry(1, $4210, $00, 1, 1, 3, 6, $0A)
    %spritemapEntry(1, $4200, $10, 1, 1, 3, 6, $0C)
    %spritemapEntry(1, $4210, $10, 1, 1, 3, 6, $0E)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 6, $08)
    %spritemapEntry(1, $43E0, $00, 1, 0, 3, 6, $0A)
    %spritemapEntry(1, $43F0, $10, 1, 0, 3, 6, $0C)
    %spritemapEntry(1, $43E0, $10, 1, 0, 3, 6, $0E)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 6, $08)
    %spritemapEntry(1, $4210, $F0, 0, 1, 3, 6, $0A)
    %spritemapEntry(1, $4200, $E0, 0, 1, 3, 6, $0C)
    %spritemapEntry(1, $4210, $E0, 0, 1, 3, 6, $0E)
    %spritemapEntry(1, $43E0, $E0, 0, 0, 3, 6, $0E)
    %spritemapEntry(1, $43E0, $F0, 0, 0, 3, 6, $0A)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 3, 6, $0C)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 6, $08)

SamusSpritemaps_C2DE:
    dw $0010                                                             ;92C2DE;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 6, $08)
    %spritemapEntry(1, $4210, $00, 1, 1, 3, 6, $0A)
    %spritemapEntry(1, $4200, $10, 1, 1, 3, 6, $0C)
    %spritemapEntry(1, $4210, $10, 1, 1, 3, 6, $0E)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 6, $08)
    %spritemapEntry(1, $43E0, $00, 1, 0, 3, 6, $0A)
    %spritemapEntry(1, $43F0, $10, 1, 0, 3, 6, $0C)
    %spritemapEntry(1, $43E0, $10, 1, 0, 3, 6, $0E)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 6, $08)
    %spritemapEntry(1, $4210, $F0, 0, 1, 3, 6, $0A)
    %spritemapEntry(1, $4200, $E0, 0, 1, 3, 6, $0C)
    %spritemapEntry(1, $4210, $E0, 0, 1, 3, 6, $0E)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 6, $08)
    %spritemapEntry(1, $43E0, $F0, 0, 0, 3, 6, $0A)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 3, 6, $0C)
    %spritemapEntry(1, $43E0, $E0, 0, 0, 3, 6, $0E)

SamusSpritemaps_C330:
    dw $0004                                                             ;92C330;
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 4, $0E)

SamusSpritemaps_C346:
    dw $000A                                                             ;92C346;
    %spritemapEntry(1, $4201, $04, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F1, $F4, 0, 0, 2, 4, $0A)
    %spritemapEntry(0, $1F9, $0C, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1F1, $EC, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $01, $EC, 0, 0, 2, 4, $0E)
    %spritemapEntry(0, $1F9, $EC, 0, 0, 2, 4, $0F)
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 4, $1C)
    %spritemapEntry(0, $01, $FC, 0, 0, 2, 4, $1D)
    %spritemapEntry(0, $01, $F4, 0, 0, 2, 4, $1E)
    %spritemapEntry(0, $1F9, $04, 0, 0, 2, 4, $1F)

SamusSpritemaps_C37A:
    dw $0004                                                             ;92C37A;
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 4, $0C)
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 4, $0E)

SamusSpritemaps_C390:
    dw $000A                                                             ;92C390;
    %spritemapEntry(0, $1FC, $F0, 1, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F4, $F8, 1, 1, 2, 4, $0D)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 4, $0E)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 4, $0F)
    %spritemapEntry(0, $0C, $00, 1, 1, 2, 4, $1C)
    %spritemapEntry(0, $1EC, $F8, 1, 1, 2, 4, $1D)
    %spritemapEntry(0, $1EC, $00, 1, 1, 2, 4, $1E)
    %spritemapEntry(0, $1EC, $08, 1, 1, 2, 4, $1F)
    %spritemapEntry(1, $43F4, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4204, $F0, 1, 1, 2, 4, $0A)

SamusSpritemaps_C3C4:
    dw $0004                                                             ;92C3C4;
    %spritemapEntry(1, $43F0, $00, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 1, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F8, $F0, 1, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $00, 1, 1, 2, 4, $0E)

SamusSpritemaps_C3DA:
    dw $000A                                                             ;92C3DA;
    %spritemapEntry(0, $1F0, $FC, 1, 1, 2, 4, $0C)
    %spritemapEntry(0, $1F8, $FC, 1, 1, 2, 4, $0D)
    %spritemapEntry(0, $1F8, $04, 1, 1, 2, 4, $0E)
    %spritemapEntry(0, $08, $0C, 1, 1, 2, 4, $0F)
    %spritemapEntry(0, $00, $EC, 1, 1, 2, 4, $1C)
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 4, $1D)
    %spritemapEntry(0, $1F8, $0C, 1, 1, 2, 4, $1E)
    %spritemapEntry(0, $00, $0C, 1, 1, 2, 4, $1F)
    %spritemapEntry(1, $43F0, $EC, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $FC, 1, 1, 2, 4, $0A)

SamusSpritemaps_C40E:
    dw $0004                                                             ;92C40E;
    %spritemapEntry(1, $43F0, $F0, 1, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 4, $0A)
    %spritemapEntry(1, $4200, $F8, 1, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F0, $F8, 1, 1, 2, 4, $0E)

SamusSpritemaps_C424:
    dw $000A                                                             ;92C424;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 4, $0C)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 4, $0D)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 4, $0E)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 4, $0F)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 4, $1C)
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 4, $1D)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 4, $1E)
    %spritemapEntry(0, $0C, $F0, 0, 0, 2, 4, $1F)
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 4, $08)
    %spritemapEntry(1, $43EC, $00, 0, 0, 2, 4, $0A)

SamusSpritemaps_C458:
    dw $0004                                                             ;92C458;
    %spritemapEntry(1, $43F0, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $00, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 4, $0E)

SamusSpritemaps_C46E:
    dw $000A                                                             ;92C46E;
    %spritemapEntry(1, $43EF, $04, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $43FF, $F4, 0, 1, 2, 4, $0A)
    %spritemapEntry(0, $1FF, $0C, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $07, $EC, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $1F7, $EC, 0, 1, 2, 4, $0E)
    %spritemapEntry(0, $1FF, $EC, 0, 1, 2, 4, $0F)
    %spritemapEntry(0, $1EF, $FC, 0, 1, 2, 4, $1C)
    %spritemapEntry(0, $1F7, $FC, 0, 1, 2, 4, $1D)
    %spritemapEntry(0, $1F7, $F4, 0, 1, 2, 4, $1E)
    %spritemapEntry(0, $1FF, $04, 0, 1, 2, 4, $1F)

SamusSpritemaps_C4A2:
    dw $0004                                                             ;92C4A2;
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 4, $0A)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 4, $0C)
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 4, $0E)

SamusSpritemaps_C4B8:
    dw $000A                                                             ;92C4B8;
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 4, $0C)
    %spritemapEntry(0, $04, $F8, 1, 0, 2, 4, $0D)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 4, $0E)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 4, $0F)
    %spritemapEntry(0, $1EC, $00, 1, 0, 2, 4, $1C)
    %spritemapEntry(0, $0C, $F8, 1, 0, 2, 4, $1D)
    %spritemapEntry(0, $0C, $00, 1, 0, 2, 4, $1E)
    %spritemapEntry(0, $0C, $08, 1, 0, 2, 4, $1F)
    %spritemapEntry(1, $43FC, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43EC, $F0, 1, 0, 2, 4, $0A)

SamusSpritemaps_C4EC:
    dw $0004                                                             ;92C4EC;
    %spritemapEntry(1, $4200, $00, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $F0, 1, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F8, $F0, 1, 0, 2, 4, $0C)
    %spritemapEntry(1, $43F8, $00, 1, 0, 2, 4, $0E)

SamusSpritemaps_C502:
    dw $000A                                                             ;92C502;
    %spritemapEntry(0, $08, $FC, 1, 0, 2, 4, $0C)
    %spritemapEntry(0, $00, $FC, 1, 0, 2, 4, $0D)
    %spritemapEntry(0, $00, $04, 1, 0, 2, 4, $0E)
    %spritemapEntry(0, $1F0, $0C, 1, 0, 2, 4, $0F)
    %spritemapEntry(0, $1F8, $EC, 1, 0, 2, 4, $1C)
    %spritemapEntry(0, $1F8, $F4, 1, 0, 2, 4, $1D)
    %spritemapEntry(0, $00, $0C, 1, 0, 2, 4, $1E)
    %spritemapEntry(0, $1F8, $0C, 1, 0, 2, 4, $1F)
    %spritemapEntry(1, $4200, $EC, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $FC, 1, 0, 2, 4, $0A)

SamusSpritemaps_C536:
    dw $0004                                                             ;92C536;
    %spritemapEntry(1, $4200, $F0, 1, 0, 2, 4, $08)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 4, $0A)
    %spritemapEntry(1, $43F0, $F8, 1, 0, 2, 4, $0C)
    %spritemapEntry(1, $4200, $F8, 1, 0, 2, 4, $0E)

SamusSpritemaps_C54C:
    dw $000A                                                             ;92C54C;
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 4, $0C)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 4, $0D)
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 4, $0E)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 4, $0F)
    %spritemapEntry(0, $0C, $F8, 0, 1, 2, 4, $1C)
    %spritemapEntry(0, $1EC, $00, 0, 1, 2, 4, $1D)
    %spritemapEntry(0, $1EC, $F8, 0, 1, 2, 4, $1E)
    %spritemapEntry(0, $1EC, $F0, 0, 1, 2, 4, $1F)
    %spritemapEntry(1, $43F4, $F0, 0, 1, 2, 4, $08)
    %spritemapEntry(1, $4204, $00, 0, 1, 2, 4, $0A)

SamusSpritemaps_C580:
    dw $0009                                                             ;92C580;
    %spritemapEntry(0, $00, $10, 0, 0, 2, 4, $41)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 4, $40)
    %spritemapEntry(0, $08, $10, 0, 0, 2, 4, $42)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 4, $32)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 4, $22)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 4, $12)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 4, $02)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 4, $20)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 4, $00)

SamusSpritemaps_C5AF:
    dw $0016                                                             ;92C5AF;
    %spritemapEntry(0, $1FD, $F0, 0, 0, 2, 4, $1F)
    %spritemapEntry(0, $03, $F6, 0, 0, 2, 4, $0F)
    %spritemapEntry(0, $1FB, $F9, 0, 0, 2, 4, $0F)
    %spritemapEntry(0, $1F7, $F7, 0, 0, 2, 4, $5F)
    %spritemapEntry(0, $07, $0B, 0, 0, 2, 4, $4E)
    %spritemapEntry(0, $1FF, $0F, 0, 0, 2, 4, $5F)
    %spritemapEntry(0, $1F7, $F2, 0, 0, 2, 4, $7F)
    %spritemapEntry(0, $1F9, $EF, 0, 0, 2, 4, $6C)
    %spritemapEntry(0, $1F9, $EC, 0, 0, 2, 4, $2F)
    %spritemapEntry(0, $1FD, $E9, 0, 0, 2, 4, $1F)
    %spritemapEntry(0, $06, $F2, 0, 0, 2, 4, $08)
    %spritemapEntry(0, $1F9, $05, 0, 0, 2, 4, $58)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 4, $38)
    %spritemapEntry(0, $01, $06, 0, 0, 2, 4, $4B)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 7, $43)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 7, $33)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 2, 7, $23)
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 7, $13)
    %spritemapEntry(0, $1F8, $EA, 0, 0, 2, 7, $03)
    %spritemapEntry(1, $4200, $0A, 0, 0, 2, 7, $44)
    %spritemapEntry(1, $4200, $FA, 0, 0, 2, 7, $24)
    %spritemapEntry(1, $4200, $EA, 0, 0, 2, 7, $04)

SamusSpritemaps_C61F:
    dw $001A                                                             ;92C61F;
    %spritemapEntry(0, $03, $E7, 0, 0, 2, 4, $1F)
    %spritemapEntry(0, $01, $11, 0, 0, 2, 4, $4F)
    %spritemapEntry(0, $1FF, $0A, 0, 0, 2, 4, $4E)
    %spritemapEntry(0, $1F9, $07, 0, 0, 2, 4, $83)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 4, $83)
    %spritemapEntry(0, $06, $F0, 0, 0, 2, 4, $83)
    %spritemapEntry(0, $0C, $EB, 0, 0, 2, 4, $08)
    %spritemapEntry(0, $07, $07, 0, 1, 2, 4, $58)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 2, 4, $4B)
    %spritemapEntry(0, $1F3, $F6, 0, 0, 2, 4, $38)
    %spritemapEntry(0, $1F3, $EE, 0, 0, 2, 4, $7F)
    %spritemapEntry(0, $1F6, $E9, 0, 0, 2, 4, $6C)
    %spritemapEntry(0, $1FB, $E7, 0, 0, 2, 4, $2F)
    %spritemapEntry(0, $1F8, $F1, 0, 0, 2, 4, $3F)
    %spritemapEntry(0, $1F5, $07, 0, 0, 2, 4, $93)
    %spritemapEntry(0, $1F8, $0E, 0, 0, 2, 4, $73)
    %spritemapEntry(0, $06, $0F, 0, 0, 2, 4, $83)
    %spritemapEntry(0, $09, $01, 0, 0, 2, 4, $4F)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 4, $5F)
    %spritemapEntry(0, $08, $10, 0, 0, 2, 7, $68)
    %spritemapEntry(0, $00, $10, 0, 0, 2, 7, $67)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 7, $28)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 7, $18)
    %spritemapEntry(1, $43F8, $E0, 0, 0, 2, 7, $06)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 7, $46)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 7, $26)

SamusSpritemaps_C6A3:
    dw $0018                                                             ;92C6A3;
    %spritemapEntry(0, $0B, $DD, 0, 0, 2, 4, $3F)
    %spritemapEntry(0, $01, $17, 0, 0, 2, 4, $4F)
    %spritemapEntry(0, $1F7, $E0, 0, 0, 2, 4, $2F)
    %spritemapEntry(0, $1F1, $E1, 0, 0, 2, 4, $6C)
    %spritemapEntry(0, $0F, $E6, 0, 0, 2, 4, $1F)
    %spritemapEntry(0, $1EE, $FA, 0, 0, 2, 4, $6F)
    %spritemapEntry(0, $1ED, $F2, 0, 0, 2, 4, $4E)
    %spritemapEntry(0, $1EE, $07, 0, 0, 2, 4, $93)
    %spritemapEntry(0, $1F1, $10, 0, 0, 2, 4, $73)
    %spritemapEntry(0, $0D, $10, 0, 0, 2, 4, $83)
    %spritemapEntry(0, $0C, $02, 0, 0, 2, 4, $6F)
    %spritemapEntry(0, $10, $FB, 0, 0, 2, 4, $4F)
    %spritemapEntry(0, $0A, $F1, 0, 0, 2, 4, $5F)
    %spritemapEntry(0, $1ED, $E8, 0, 0, 2, 4, $7F)
    %spritemapEntry(0, $1F3, $ED, 0, 0, 2, 4, $3F)
    %spritemapEntry(0, $08, $FA, 0, 0, 2, 7, $3B)
    %spritemapEntry(0, $08, $F2, 0, 0, 2, 7, $2B)
    %spritemapEntry(0, $08, $12, 0, 0, 2, 7, $6B)
    %spritemapEntry(0, $00, $12, 0, 0, 2, 7, $6A)
    %spritemapEntry(0, $08, $EA, 0, 0, 2, 7, $1B)
    %spritemapEntry(0, $08, $E2, 0, 0, 2, 7, $0B)
    %spritemapEntry(1, $43F8, $02, 0, 0, 2, 7, $49)
    %spritemapEntry(1, $43F8, $F2, 0, 0, 2, 7, $29)
    %spritemapEntry(1, $43F8, $E2, 0, 0, 2, 7, $09)

SamusSpritemaps_C71D:
    dw $0019                                                             ;92C71D;
    %spritemapEntry(0, $0C, $D8, 0, 0, 2, 4, $3F)
    %spritemapEntry(0, $03, $1E, 0, 0, 2, 4, $4F)
    %spritemapEntry(0, $1F3, $DA, 0, 0, 2, 4, $2F)
    %spritemapEntry(0, $1E9, $DE, 0, 0, 2, 4, $6C)
    %spritemapEntry(0, $11, $15, 0, 0, 2, 4, $83)
    %spritemapEntry(0, $14, $04, 0, 0, 2, 4, $6F)
    %spritemapEntry(0, $15, $F2, 0, 0, 2, 4, $5F)
    %spritemapEntry(0, $12, $E1, 0, 0, 2, 4, $1F)
    %spritemapEntry(0, $1E5, $FE, 0, 0, 2, 4, $6F)
    %spritemapEntry(0, $1E3, $EA, 0, 0, 2, 4, $7F)
    %spritemapEntry(0, $18, $FC, 0, 0, 2, 4, $4F)
    %spritemapEntry(0, $1F0, $14, 0, 0, 2, 4, $73)
    %spritemapEntry(0, $1E8, $0C, 0, 0, 2, 4, $93)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 4, $4E)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 4, $3F)
    %spritemapEntry(0, $00, $14, 0, 0, 2, 7, $6D)
    %spritemapEntry(0, $08, $14, 0, 0, 2, 7, $6E)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 7, $5E)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 7, $3E)
    %spritemapEntry(0, $08, $F4, 0, 0, 2, 7, $2E)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 7, $1E)
    %spritemapEntry(0, $08, $E4, 0, 0, 2, 7, $0E)
    %spritemapEntry(1, $43F8, $04, 0, 0, 2, 7, $4C)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 7, $2C)
    %spritemapEntry(1, $43F8, $E4, 0, 0, 2, 7, $0C)

SamusSpritemaps_C79C:
    dw $0019                                                             ;92C79C;
    %spritemapEntry(0, $1DD, $E1, 0, 0, 2, 4, $7F)
    %spritemapEntry(0, $1E0, $DC, 0, 0, 2, 4, $7F)
    %spritemapEntry(0, $03, $25, 0, 0, 2, 4, $73)
    %spritemapEntry(0, $1EA, $D3, 0, 0, 2, 4, $2F)
    %spritemapEntry(0, $1D, $FB, 0, 0, 2, 4, $73)
    %spritemapEntry(0, $1DF, $FF, 0, 1, 2, 4, $83)
    %spritemapEntry(0, $19, $08, 0, 0, 2, 4, $6F)
    %spritemapEntry(0, $1E2, $12, 0, 0, 2, 4, $93)
    %spritemapEntry(0, $1EF, $19, 0, 0, 2, 4, $73)
    %spritemapEntry(0, $13, $19, 0, 0, 2, 4, $83)
    %spritemapEntry(0, $18, $F0, 0, 0, 2, 4, $5F)
    %spritemapEntry(0, $1D9, $ED, 0, 0, 2, 4, $7F)
    %spritemapEntry(0, $1E4, $F4, 0, 0, 2, 4, $4E)
    %spritemapEntry(0, $18, $DC, 0, 0, 2, 4, $1F)
    %spritemapEntry(0, $1E8, $EC, 0, 1, 2, 4, $3F)
    %spritemapEntry(0, $00, $14, 0, 0, 2, 7, $74)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 7, $64)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 7, $63)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 7, $82)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 7, $62)
    %spritemapEntry(0, $08, $E4, 0, 0, 2, 7, $52)
    %spritemapEntry(0, $00, $E4, 0, 0, 2, 7, $51)
    %spritemapEntry(0, $1F8, $E4, 0, 0, 2, 7, $50)
    %spritemapEntry(1, $43F8, $FC, 0, 0, 2, 7, $80)
    %spritemapEntry(1, $43F8, $EC, 0, 0, 2, 7, $60)

SamusSpritemaps_C81B:
    dw $0008                                                             ;92C81B;
    %spritemapEntry(0, $0E, $F4, 0, 0, 2, 7, $9C)
    %spritemapEntry(0, $0E, $EC, 0, 0, 2, 7, $8C)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 7, $99)
    %spritemapEntry(1, $43F6, $04, 0, 0, 2, 7, $78)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 7, $94)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 7, $84)
    %spritemapEntry(1, $43FE, $F4, 0, 0, 2, 7, $85)
    %spritemapEntry(1, $43FE, $E4, 0, 0, 2, 7, $65)

SamusSpritemaps_C845:
    dw $000B                                                             ;92C845;
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 7, $98)
    %spritemapEntry(0, $06, $FC, 0, 0, 2, 7, $96)
    %spritemapEntry(0, $1FE, $FC, 0, 0, 2, 7, $95)
    %spritemapEntry(0, $06, $E4, 0, 0, 2, 7, $7B)
    %spritemapEntry(0, $1FE, $E4, 0, 0, 2, 7, $7A)
    %spritemapEntry(0, $0E, $F4, 0, 0, 2, 7, $9C)
    %spritemapEntry(0, $0E, $EC, 0, 0, 2, 7, $8C)
    %spritemapEntry(1, $43FE, $EC, 0, 0, 2, 7, $8A)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 7, $99)
    %spritemapEntry(1, $43F6, $04, 0, 0, 2, 7, $78)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 7, $94)

SamusSpritemaps_C87E:
    dw $000B                                                             ;92C87E;
    %spritemapEntry(0, $1FE, $FC, 0, 0, 2, 7, $95)
    %spritemapEntry(0, $06, $FC, 0, 0, 2, 7, $96)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 7, $7C)
    %spritemapEntry(0, $06, $E4, 0, 0, 2, 7, $7E)
    %spritemapEntry(0, $1FE, $E4, 0, 0, 2, 7, $7D)
    %spritemapEntry(0, $0E, $F4, 0, 0, 2, 7, $9F)
    %spritemapEntry(0, $0E, $EC, 0, 0, 2, 7, $8F)
    %spritemapEntry(1, $43FE, $EC, 0, 0, 2, 7, $8D)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 7, $99)
    %spritemapEntry(1, $43F6, $04, 0, 0, 2, 7, $78)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 7, $94)

SamusSpritemaps_C8B7:
    dw $0009                                                             ;92C8B7;
    %spritemapEntry(0, $1F8, $10, 0, 1, 2, 4, $41)
    %spritemapEntry(0, $00, $10, 0, 1, 2, 4, $40)
    %spritemapEntry(0, $1F0, $10, 0, 1, 2, 4, $42)
    %spritemapEntry(0, $1F0, $08, 0, 1, 2, 4, $32)
    %spritemapEntry(0, $1F0, $00, 0, 1, 2, 4, $22)
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 4, $12)
    %spritemapEntry(0, $1F0, $F0, 0, 1, 2, 4, $02)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 4, $20)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 4, $00)

SamusSpritemaps_C8E6:
    dw $0016                                                             ;92C8E6;
    %spritemapEntry(0, $1FB, $F0, 0, 1, 2, 4, $1F)
    %spritemapEntry(0, $1F5, $F6, 0, 1, 2, 4, $0F)
    %spritemapEntry(0, $1FD, $F9, 0, 1, 2, 4, $0F)
    %spritemapEntry(0, $01, $F7, 0, 1, 2, 4, $5F)
    %spritemapEntry(0, $1F1, $0B, 0, 1, 2, 4, $4E)
    %spritemapEntry(0, $1F9, $0F, 0, 1, 2, 4, $5F)
    %spritemapEntry(0, $01, $F2, 0, 1, 2, 4, $7F)
    %spritemapEntry(0, $1FF, $EF, 0, 1, 2, 4, $6C)
    %spritemapEntry(0, $1FF, $EC, 0, 1, 2, 4, $2F)
    %spritemapEntry(0, $1FB, $E9, 0, 1, 2, 4, $1F)
    %spritemapEntry(0, $1F2, $F2, 0, 1, 2, 4, $08)
    %spritemapEntry(0, $1FF, $05, 0, 1, 2, 4, $58)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 4, $38)
    %spritemapEntry(0, $1F7, $06, 0, 1, 2, 4, $4B)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 7, $43)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 7, $33)
    %spritemapEntry(0, $00, $FA, 0, 1, 2, 7, $23)
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 7, $13)
    %spritemapEntry(0, $00, $EA, 0, 1, 2, 7, $03)
    %spritemapEntry(1, $43F0, $0A, 0, 1, 2, 7, $44)
    %spritemapEntry(1, $43F0, $FA, 0, 1, 2, 7, $24)
    %spritemapEntry(1, $43F0, $EA, 0, 1, 2, 7, $04)

SamusSpritemaps_C956:
    dw $001A                                                             ;92C956;
    %spritemapEntry(0, $1F5, $E7, 0, 1, 2, 4, $1F)
    %spritemapEntry(0, $1F7, $11, 0, 1, 2, 4, $4F)
    %spritemapEntry(0, $1F9, $0A, 0, 1, 2, 4, $4E)
    %spritemapEntry(0, $1FF, $07, 0, 1, 2, 4, $83)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 4, $83)
    %spritemapEntry(0, $1F2, $F0, 0, 1, 2, 4, $83)
    %spritemapEntry(0, $1EC, $EB, 0, 1, 2, 4, $08)
    %spritemapEntry(0, $1F1, $07, 0, 0, 2, 4, $58)
    %spritemapEntry(0, $01, $FF, 0, 1, 2, 4, $4B)
    %spritemapEntry(0, $05, $F6, 0, 1, 2, 4, $38)
    %spritemapEntry(0, $05, $EE, 0, 1, 2, 4, $7F)
    %spritemapEntry(0, $02, $E9, 0, 1, 2, 4, $6C)
    %spritemapEntry(0, $1FD, $E7, 0, 1, 2, 4, $2F)
    %spritemapEntry(0, $00, $F1, 0, 1, 2, 4, $3F)
    %spritemapEntry(0, $03, $07, 0, 1, 2, 4, $93)
    %spritemapEntry(0, $00, $0E, 0, 1, 2, 4, $73)
    %spritemapEntry(0, $1F2, $0F, 0, 1, 2, 4, $83)
    %spritemapEntry(0, $1EF, $01, 0, 1, 2, 4, $4F)
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 4, $5F)
    %spritemapEntry(0, $1F0, $10, 0, 1, 2, 7, $68)
    %spritemapEntry(0, $1F8, $10, 0, 1, 2, 7, $67)
    %spritemapEntry(0, $1F0, $F0, 0, 1, 2, 7, $28)
    %spritemapEntry(0, $1F0, $E8, 0, 1, 2, 7, $18)
    %spritemapEntry(1, $43F8, $E0, 0, 1, 2, 7, $06)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 7, $46)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 7, $26)

SamusSpritemaps_C9DA:
    dw $0018                                                             ;92C9DA;
    %spritemapEntry(0, $1ED, $DD, 0, 1, 2, 4, $3F)
    %spritemapEntry(0, $1F7, $17, 0, 1, 2, 4, $4F)
    %spritemapEntry(0, $01, $E0, 0, 1, 2, 4, $2F)
    %spritemapEntry(0, $07, $E1, 0, 1, 2, 4, $6C)
    %spritemapEntry(0, $1E9, $E6, 0, 1, 2, 4, $1F)
    %spritemapEntry(0, $0A, $FA, 0, 1, 2, 4, $6F)
    %spritemapEntry(0, $0B, $F2, 0, 1, 2, 4, $4E)
    %spritemapEntry(0, $0A, $07, 0, 1, 2, 4, $93)
    %spritemapEntry(0, $07, $10, 0, 1, 2, 4, $73)
    %spritemapEntry(0, $1EB, $10, 0, 1, 2, 4, $83)
    %spritemapEntry(0, $1EC, $02, 0, 1, 2, 4, $6F)
    %spritemapEntry(0, $1E8, $FB, 0, 1, 2, 4, $4F)
    %spritemapEntry(0, $1EE, $F1, 0, 1, 2, 4, $5F)
    %spritemapEntry(0, $0B, $E8, 0, 1, 2, 4, $7F)
    %spritemapEntry(0, $05, $ED, 0, 1, 2, 4, $3F)
    %spritemapEntry(0, $1F0, $FA, 0, 1, 2, 7, $3B)
    %spritemapEntry(0, $1F0, $F2, 0, 1, 2, 7, $2B)
    %spritemapEntry(0, $1F0, $12, 0, 1, 2, 7, $6B)
    %spritemapEntry(0, $1F8, $12, 0, 1, 2, 7, $6A)
    %spritemapEntry(0, $1F0, $EA, 0, 1, 2, 7, $1B)
    %spritemapEntry(0, $1F0, $E2, 0, 1, 2, 7, $0B)
    %spritemapEntry(1, $43F8, $02, 0, 1, 2, 7, $49)
    %spritemapEntry(1, $43F8, $F2, 0, 1, 2, 7, $29)
    %spritemapEntry(1, $43F8, $E2, 0, 1, 2, 7, $09)

SamusSpritemaps_CA54:
    dw $0019                                                             ;92CA54;
    %spritemapEntry(0, $1EC, $D8, 0, 1, 2, 4, $3F)
    %spritemapEntry(0, $1F5, $1E, 0, 1, 2, 4, $4F)
    %spritemapEntry(0, $05, $DA, 0, 1, 2, 4, $2F)
    %spritemapEntry(0, $0F, $DE, 0, 1, 2, 4, $6C)
    %spritemapEntry(0, $1E7, $15, 0, 1, 2, 4, $83)
    %spritemapEntry(0, $1E4, $04, 0, 1, 2, 4, $6F)
    %spritemapEntry(0, $1E3, $F2, 0, 1, 2, 4, $5F)
    %spritemapEntry(0, $1E6, $E1, 0, 1, 2, 4, $1F)
    %spritemapEntry(0, $13, $FE, 0, 1, 2, 4, $6F)
    %spritemapEntry(0, $15, $EA, 0, 1, 2, 4, $7F)
    %spritemapEntry(0, $1E0, $FC, 0, 1, 2, 4, $4F)
    %spritemapEntry(0, $08, $14, 0, 1, 2, 4, $73)
    %spritemapEntry(0, $10, $0C, 0, 1, 2, 4, $93)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 4, $4E)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 4, $3F)
    %spritemapEntry(0, $1F8, $14, 0, 1, 2, 7, $6D)
    %spritemapEntry(0, $1F0, $14, 0, 1, 2, 7, $6E)
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 7, $5E)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 7, $3E)
    %spritemapEntry(0, $1F0, $F4, 0, 1, 2, 7, $2E)
    %spritemapEntry(0, $1F0, $EC, 0, 1, 2, 7, $1E)
    %spritemapEntry(0, $1F0, $E4, 0, 1, 2, 7, $0E)
    %spritemapEntry(1, $43F8, $04, 0, 1, 2, 7, $4C)
    %spritemapEntry(1, $43F8, $F4, 0, 1, 2, 7, $2C)
    %spritemapEntry(1, $43F8, $E4, 0, 1, 2, 7, $0C)

SamusSpritemaps_CAD3:
    dw $0019                                                             ;92CAD3;
    %spritemapEntry(0, $1B, $E1, 0, 1, 2, 4, $7F)
    %spritemapEntry(0, $18, $DC, 0, 1, 2, 4, $7F)
    %spritemapEntry(0, $1F5, $25, 0, 1, 2, 4, $73)
    %spritemapEntry(0, $0E, $D3, 0, 1, 2, 4, $2F)
    %spritemapEntry(0, $1DB, $FB, 0, 1, 2, 4, $73)
    %spritemapEntry(0, $19, $FF, 0, 0, 2, 4, $83)
    %spritemapEntry(0, $1DF, $08, 0, 1, 2, 4, $6F)
    %spritemapEntry(0, $16, $12, 0, 1, 2, 4, $93)
    %spritemapEntry(0, $09, $19, 0, 1, 2, 4, $73)
    %spritemapEntry(0, $1E5, $19, 0, 1, 2, 4, $83)
    %spritemapEntry(0, $1E0, $F0, 0, 1, 2, 4, $5F)
    %spritemapEntry(0, $1F, $ED, 0, 1, 2, 4, $7F)
    %spritemapEntry(0, $14, $F4, 0, 1, 2, 4, $4E)
    %spritemapEntry(0, $1E0, $DC, 0, 1, 2, 4, $1F)
    %spritemapEntry(0, $10, $EC, 0, 0, 2, 4, $3F)
    %spritemapEntry(0, $1F8, $14, 0, 1, 2, 7, $74)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 7, $64)
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 7, $63)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 7, $82)
    %spritemapEntry(0, $1F0, $EC, 0, 1, 2, 7, $62)
    %spritemapEntry(0, $1F0, $E4, 0, 1, 2, 7, $52)
    %spritemapEntry(0, $1F8, $E4, 0, 1, 2, 7, $51)
    %spritemapEntry(0, $00, $E4, 0, 1, 2, 7, $50)
    %spritemapEntry(1, $43F8, $FC, 0, 1, 2, 7, $80)
    %spritemapEntry(1, $43F8, $EC, 0, 1, 2, 7, $60)

SamusSpritemaps_CB52:
    dw $0008                                                             ;92CB52;
    %spritemapEntry(0, $1EA, $F4, 0, 1, 2, 7, $9C)
    %spritemapEntry(0, $1EA, $EC, 0, 1, 2, 7, $8C)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 7, $99)
    %spritemapEntry(1, $43FA, $04, 0, 1, 2, 7, $78)
    %spritemapEntry(0, $02, $FC, 0, 1, 2, 7, $94)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 7, $84)
    %spritemapEntry(1, $43F2, $F4, 0, 1, 2, 7, $85)
    %spritemapEntry(1, $43F2, $E4, 0, 1, 2, 7, $65)

SamusSpritemaps_CB7C:
    dw $000B                                                             ;92CB7C;
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 7, $98)
    %spritemapEntry(0, $1F2, $FC, 0, 1, 2, 7, $96)
    %spritemapEntry(0, $1FA, $FC, 0, 1, 2, 7, $95)
    %spritemapEntry(0, $1F2, $E4, 0, 1, 2, 7, $7B)
    %spritemapEntry(0, $1FA, $E4, 0, 1, 2, 7, $7A)
    %spritemapEntry(0, $1EA, $F4, 0, 1, 2, 7, $9C)
    %spritemapEntry(0, $1EA, $EC, 0, 1, 2, 7, $8C)
    %spritemapEntry(1, $43F2, $EC, 0, 1, 2, 7, $8A)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 7, $99)
    %spritemapEntry(1, $43FA, $04, 0, 1, 2, 7, $78)
    %spritemapEntry(0, $02, $FC, 0, 1, 2, 7, $94)

SamusSpritemaps_CBB5:
    dw $000B                                                             ;92CBB5;
    %spritemapEntry(0, $1FA, $FC, 0, 1, 2, 7, $95)
    %spritemapEntry(0, $1F2, $FC, 0, 1, 2, 7, $96)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 7, $7C)
    %spritemapEntry(0, $1F2, $E4, 0, 1, 2, 7, $7E)
    %spritemapEntry(0, $1FA, $E4, 0, 1, 2, 7, $7D)
    %spritemapEntry(0, $1EA, $F4, 0, 1, 2, 7, $9F)
    %spritemapEntry(0, $1EA, $EC, 0, 1, 2, 7, $8F)
    %spritemapEntry(1, $43F2, $EC, 0, 1, 2, 7, $8D)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 7, $99)
    %spritemapEntry(1, $43FA, $04, 0, 1, 2, 7, $78)
    %spritemapEntry(0, $02, $FC, 0, 1, 2, 7, $94)


; Samus tiles definition format:
;     aaaaaa nnnn NNNN
; where:
;     a: Source address
;     n: Part 1 size, n = 0 means 10000h bytes are transferred
;     N: Part 2 size, N = 0 means no bytes are transferred


;;; $CBEE: Samus top tiles - set 0 (general) ;;;
SamusTopTiles_Set0_CBEE:
; Actually used by:
;     9: Moving right - not aiming - frame 0
;     9: Moving right - not aiming - frame 5
;     4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 3
;     C7h: Facing right - vertical shinespark windup - frame 3
;     F0h: Facing right - grabbed by Draygon - moving - frame 2
;     F0h: Facing right - grabbed by Draygon - moving - frame 5

; Meaninglessly used by:
;     0: Facing forward - power suit - frame 1
;     1: Facing right - normal - frame 4
;     2: Facing left-   normal - frame 4
;     19h: Facing right - spin jump - frames 9..Ah
;     1Ah: Facing left-   spin jump - frames 9..Ah
;     1Bh: Facing right - space jump - frames 9..Ah
;     1Ch: Facing left-   space jump - frames 9..Ah
;     1Dh: Facing right - morph ball - no springball - on ground - frame 8
;     1Eh: Moving right - morph ball - no springball - on ground - frame 8
;     1Fh: Moving left-   morph ball - no springball - on ground - frame 8
;     20h: Unused - frames 9..Ah
;     21h: Unused - frames 9..Ah
;     22h: Unused - frames 9..Ah
;     23h: Unused - frames 9..Ah
;     24h: Unused - frames 9..Ah
;     27h: Facing right - crouching - frame 4
;     28h: Facing left-   crouching - frame 4
;     29h: Facing right - falling - frames 3..4
;     2Ah: Facing left-   falling - frames 3..4
;     31h: Facing right - morph ball - no springball - in air - frame 8
;     32h: Facing left-   morph ball - no springball - in air - frame 8
;     33h: Unused - frames 9..Ah
;     34h: Unused - frames 9..Ah
;     39h: Unused - frames 9..Ah
;     3Ah: Unused - frames 9..Ah
;     3Fh: Unused - frame 8
;     40h: Unused - frame 8
;     41h: Facing left-   morph ball - no springball - on ground - frame 8
;     42h: Unused - frames 9..Ah
;     47h: Unused - frame 4
;     48h: Unused - frame 4
;     67h: Facing right - falling - gun extended - frames 3..4
;     68h: Facing left-   falling - gun extended - frames 3..4
;     79h: Facing right - morph ball - spring ball - on ground - frame 8
;     7Ah: Facing left-   morph ball - spring ball - on ground - frame 8
;     7Bh: Moving right - morph ball - spring ball - on ground - frame 8
;     7Ch: Moving left-   morph ball - spring ball - on ground - frame 8
;     7Dh: Facing right - morph ball - spring ball - falling - frame 8
;     7Eh: Facing left-   morph ball - spring ball - falling - frame 8
;     7Fh: Facing right - morph ball - spring ball - in air - frame 8
;     80h: Facing left-   morph ball - spring ball - in air - frame 8
;     81h: Facing right - screw attack - frames 19h..1Ah
;     82h: Facing left-   screw attack - frames 19h..1Ah
;     83h: Facing right - wall jump - frame 2
;     83h: Facing right - wall jump - frames Bh..Ch
;     83h: Facing right - wall jump - frames 15h..16h
;     84h: Facing left-   wall jump - frame 2
;     84h: Facing left-   wall jump - frames Bh..Ch
;     84h: Facing left-   wall jump - frames 15h..16h
;     89h: Facing right - ran into a wall - frame 4
;     8Ah: Facing left-   ran into a wall - frame 4
;     9Bh: Facing forward - varia/gravity suit - frame 1
;     A8h: Facing right - grappling - frame 4
;     A9h: Facing left-   grappling - frame 4
;     B4h: Facing right - grappling - crouching - frame 4
;     B5h: Facing left-   grappling - crouching - frame 4
;     C5h: Unused - frame 8
;     D3h: Facing right - crystal flash - frames 4..5
;     D3h: Facing right - crystal flash - frames Ah..Bh
;     D4h: Facing left-   crystal flash - frames 4..5
;     D4h: Facing left-   crystal flash - frames Ah..Bh
;     DFh: Unused. Related to Draygon - frame 8
;     E8h: Facing right - Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left-   Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left-   Samus drained - crouching/falling - frames 11h..12h
;     E9h: Facing left-   Samus drained - crouching/falling - frames 18h..19h
;     E9h: Facing left-   Samus drained - crouching/falling - frames 1Bh..1Ch
;     E9h: Facing left-   Samus drained - crouching/falling - frames 1Eh..1Fh
;     EAh: Facing right - Samus drained - standing - frame 4
;     EBh: Facing left-   Samus drained - standing - frame 4
    dl SamusTiles_Top_Set0_Entry0 : dw $0080,$0080                       ;92CBEE;

SamusTopTiles_Set0_CBF5:
; 9: Moving right - not aiming - frame 4
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 4
; C7h: Facing right - vertical shinespark windup - frame 4
; F0h: Facing right - grabbed by Draygon - moving - frame 0
    dl SamusTiles_Top_Set0_Entry1 : dw $0080,$0080                       ;92CBF5;

SamusTopTiles_Set0_CBFC:
; 9: Moving right - not aiming - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 1
    dl SamusTiles_Top_Set0_Entry2 : dw $00A0,$0080                       ;92CBFC;

SamusTopTiles_Set0_CC03:
; 9: Moving right - not aiming - frame 3
    dl SamusTiles_Top_Set0_Entry3 : dw $00A0,$0080                       ;92CC03;

SamusTopTiles_Set0_CC0A:
; 9: Moving right - not aiming - frame 9
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 2
; C7h: Facing right - vertical shinespark windup - frame 0
; C7h: Facing right - vertical shinespark windup - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 3
    dl SamusTiles_Top_Set0_Entry4 : dw $0080,$0080                       ;92CC0A;

SamusTopTiles_Set0_CC11:
; 9: Moving right - not aiming - frame 7
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
    dl SamusTiles_Top_Set0_Entry5 : dw $00C0,$00C0                       ;92CC11;

SamusTopTiles_Set0_CC18:
; Ah: Moving left-   not aiming - frame 0
; Ah: Moving left-   not aiming - frame 5
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 3
; BEh: Facing left-   grabbed by Draygon - moving - frame 2
; BEh: Facing left-   grabbed by Draygon - moving - frame 5
; C8h: Facing left-   vertical shinespark windup - frame 3
    dl SamusTiles_Top_Set0_Entry6 : dw $0080,$0080                       ;92CC18;

SamusTopTiles_Set0_CC1F:
; Ah: Moving left-   not aiming - frame 4
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 4
; BEh: Facing left-   grabbed by Draygon - moving - frame 0
; C8h: Facing left-   vertical shinespark windup - frame 4
    dl SamusTiles_Top_Set0_Entry7 : dw $0080,$0080                       ;92CC1F;

SamusTopTiles_Set0_CC26:
; Ah: Moving left-   not aiming - frame 2
; BEh: Facing left-   grabbed by Draygon - moving - frame 1
    dl SamusTiles_Top_Set0_Entry8 : dw $00C0,$00C0                       ;92CC26;

SamusTopTiles_Set0_CC2D:
; Ah: Moving left-   not aiming - frame 3
    dl SamusTiles_Top_Set0_Entry9 : dw $00C0,$00C0                       ;92CC2D;

SamusTopTiles_Set0_CC34:
; Ah: Moving left-   not aiming - frame 9
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 2
; BEh: Facing left-   grabbed by Draygon - moving - frame 3
; C8h: Facing left-   vertical shinespark windup - frame 0
; C8h: Facing left-   vertical shinespark windup - frame 2
    dl SamusTiles_Top_Set0_EntryA : dw $0080,$0080                       ;92CC34;

SamusTopTiles_Set0_CC3B:
; Ah: Moving left-   not aiming - frame 7
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left-   grabbed by Draygon - moving - frame 4
; C8h: Facing left-   vertical shinespark windup - frame 1
    dl SamusTiles_Top_Set0_EntryB : dw $00A0,$0080                       ;92CC3B;

SamusTopTiles_Set0_CC42:
; 11h: Moving right - aiming down-right - frames 0..1
; 11h: Moving right - aiming down-right - frames 5..6
; 17h: Facing right - normal jump - aiming down - frame 0
; 2Dh: Facing right - falling - aiming down - frame 0
; 6Bh: Facing right - normal jump - aiming down-right - frames 0..1
; 6Fh: Facing right - falling - aiming down-right - frames 0..2
; 78h: Facing right - moonwalk - aiming down-right - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 3
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 0
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frames 0..1
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right - frame 0
    dl SamusTiles_Top_Set0_EntryC : dw $00E0,$0040                       ;92CC42;

SamusTopTiles_Set0_CC49:
; 12h: Moving left-   aiming down-left - frames 0..1
; 12h: Moving left-   aiming down-left - frames 5..6
; 18h: Facing left-   normal jump - aiming down - frame 0
; 2Eh: Facing left-   falling - aiming down - frame 0
; 6Ch: Facing left-   normal jump - aiming down-left - frames 0..1
; 70h: Facing left-   falling - aiming down-left - frames 0..2
; 77h: Facing left-   moonwalk - aiming down-left - frame 0
; 77h: Facing left-   moonwalk - aiming down-left - frame 3
; AFh: Unused. Facing left-   grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left-   grappling - in air - aiming down-left - frames 0..1
; BDh: Facing left-   grabbed by Draygon - not moving - aiming down-left - frame 0
    dl SamusTiles_Top_Set0_EntryD : dw $00E0,$0040                       ;92CC49;

SamusTopTiles_Set0_CC50:
; 7: Facing right - aiming down-right - frame 0
; 59h: Facing right - normal jump transition - aiming down-right - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; AAh: Facing right - grappling - aiming down-right - frame 0
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; D1h: Facing right - ran into a wall - aiming down-right - frame 0
; E4h: Facing right - landing from normal jump - aiming down-right - frames 0..1
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
    dl SamusTiles_Top_Set0_EntryE : dw $00E0,$0080                       ;92CC50;

SamusTopTiles_Set0_CC57:
; 8: Facing left-   aiming down-left - frame 0
; 5Ah: Facing left-   normal jump transition - aiming down-left - frame 0
; 74h: Facing left-   crouching - aiming down-left - frame 0
; ABh: Facing left-   grappling - aiming down-left - frame 0
; B7h: Facing left-   grappling - crouching - aiming down-left - frame 0
; D2h: Facing left-   ran into a wall - aiming down-left - frame 0
; E5h: Facing left-   landing from normal jump - aiming down-left - frames 0..1
; F6h: Facing left-   crouching transition - aiming down-left - frame 0
; FCh: Facing left-   standing transition - aiming down-left - frame 0
    dl SamusTiles_Top_Set0_EntryF : dw $00E0,$0080                       ;92CC57;

SamusTopTiles_Set0_CC5E:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frames 0..1
; 35h: Facing right - crouching transition - frame 0
; 3Bh: Facing right - standing transition - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 3
; 51h: Facing right - normal jump - not aiming - moving forward - frames 0..1
; 67h: Facing right - falling - gun extended - frames 0..2
; 67h: Facing right - falling - gun extended - frames 5..6
; ACh: Unused. Facing right - grappling - in air - frames 0..1
; D3h: Facing right - crystal flash - frame Eh
; D5h: Facing right - x-ray - standing - frame 2
; D7h: Facing right - crystal flash ending - frame 3
; D9h: Facing right - x-ray - crouching - frame 2
; DBh: Unused - frame 0
; DDh: Unused - frame 2
; E6h: Facing right - landing from normal jump - firing - frames 0..1
; E8h: Facing right - Samus drained - crouching/falling - frame Eh
; EAh: Facing right - Samus drained - standing - frame 5
; EEh: Facing right - grabbed by Draygon - firing - frame 0
    dl SamusTiles_Top_Set0_Entry10 : dw $00C0,$0040                      ;92CC5E;

SamusTopTiles_Set0_CC65:
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended - frames 0..1
; 36h: Facing left-   crouching transition - frame 0
; 3Ch: Facing left-   standing transition - frame 0
; 49h: Facing left-   moonwalk - frame 0
; 49h: Facing left-   moonwalk - frame 3
; 52h: Facing left-   normal jump - not aiming - moving forward - frames 0..1
; 68h: Facing left-   falling - gun extended - frames 0..2
; 68h: Facing left-   falling - gun extended - frames 5..6
; ADh: Unused. Facing left-   grappling - in air - frames 0..1
; BCh: Facing left-   grabbed by Draygon - firing - frame 0
; D4h: Facing left-   crystal flash - frame Eh
; D6h: Facing left-   x-ray - standing - frame 2
; D8h: Facing left-   crystal flash ending - frame 3
; DAh: Facing left-   x-ray - crouching - frame 2
; DCh: Unused - frame 0
; DEh: Unused - frame 2
; E7h: Facing left-   landing from normal jump - firing - frames 0..1
; EBh: Facing left-   Samus drained - standing - frame 5
    dl SamusTiles_Top_Set0_Entry11 : dw $00C0,$0040                      ;92CC65;

SamusTopTiles_Set0_CC6C:
; 3: Facing right - aiming up - frame 0
; 5: Facing right - aiming up-right - frame 0
; 15h: Facing right - normal jump - aiming up - frame 0
; 2Bh: Facing right - falling - aiming up - frame 0
; 57h: Facing right - normal jump transition - aiming up-right - frame 0
; 71h: Facing right - crouching - aiming up-right - frame 0
; 85h: Facing right - crouching - aiming up - frame 0
; CFh: Facing right - ran into a wall - aiming up-right - frame 0
; E2h: Facing right - landing from normal jump - aiming up-right - frames 0..1
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
    dl SamusTiles_Top_Set0_Entry12 : dw $00C0,$0080                      ;92CC6C;

SamusTopTiles_Set0_CC73:
; 4: Facing left-   aiming up - frame 0
; 6: Facing left-   aiming up-left - frame 0
; 16h: Facing left-   normal jump - aiming up - frame 0
; 2Ch: Facing left-   falling - aiming up - frame 0
; 58h: Facing left-   normal jump transition - aiming up-left - frame 0
; 72h: Facing left-   crouching - aiming up-left - frame 0
; 86h: Facing left-   crouching - aiming up - frame 0
; D0h: Facing left-   ran into a wall - aiming up-left - frame 0
; E3h: Facing left-   landing from normal jump - aiming up-left - frames 0..1
; F4h: Facing left-   crouching transition - aiming up-left - frame 0
; FAh: Facing left-   standing transition - aiming up-left - frame 0
    dl SamusTiles_Top_Set0_Entry13 : dw $00C0,$0080                      ;92CC73;

SamusTopTiles_Set0_CC7A:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; C7h: Facing right - vertical shinespark windup - frame 5
    dl SamusTiles_Top_Set0_Entry14 : dw $00A0,$0080                      ;92CC7A;

SamusTopTiles_Set0_CC81:
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 5
; C8h: Facing left-   vertical shinespark windup - frame 5
    dl SamusTiles_Top_Set0_Entry15 : dw $00C0,$00C0                      ;92CC81;

SamusTopTiles_Set0_CC88:
; 3: Facing right - aiming up - frame 1
; Dh: Moving right - aiming up (unused) - frames 0..1
; Dh: Moving right - aiming up (unused) - frames 5..6
; 15h: Facing right - normal jump - aiming up - frame 1
; 2Bh: Facing right - falling - aiming up - frames 1..2
; 55h: Facing right - normal jump transition - aiming up - frame 0
; 85h: Facing right - crouching - aiming up - frame 1
; E0h: Facing right - landing from normal jump - aiming up - frames 0..1
; F1h: Facing right - crouching transition - aiming up - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
    dl SamusTiles_Top_Set0_Entry16 : dw $00C0,$0040                      ;92CC88;

SamusTopTiles_Set0_CC8F:
; 4: Facing left-   aiming up - frame 1
; Eh: Moving left-   aiming up (unused) - frames 0..1
; Eh: Moving left-   aiming up (unused) - frames 5..6
; 16h: Facing left-   normal jump - aiming up - frame 1
; 2Ch: Facing left-   falling - aiming up - frames 1..2
; 56h: Facing left-   normal jump transition - aiming up - frame 0
; 86h: Facing left-   crouching - aiming up - frame 1
; E1h: Facing left-   landing from normal jump - aiming up - frames 0..1
; F2h: Facing left-   crouching transition - aiming up - frame 0
; F8h: Facing left-   standing transition - aiming up - frame 0
    dl SamusTiles_Top_Set0_Entry17 : dw $00C0,$0040                      ;92CC8F;

SamusTopTiles_Set0_CC96:
; 9: Moving right - not aiming - frame 8
    dl SamusTiles_Top_Set0_Entry18 : dw $00A0,$0080                      ;92CC96;

SamusTopTiles_Set0_CC9D:
; Ah: Moving left-   not aiming - frame 8
    dl SamusTiles_Top_Set0_Entry19 : dw $00A0,$0080                      ;92CC9D;

SamusTopTiles_Set0_CCA4:
; Fh: Moving right - aiming up-right - frames 0..1
; Fh: Moving right - aiming up-right - frames 5..6
; 69h: Facing right - normal jump - aiming up-right - frames 0..1
; 6Dh: Facing right - falling - aiming up-right - frames 0..2
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right - frame 0
    dl SamusTiles_Top_Set0_Entry1A : dw $00C0,$0040                      ;92CCA4;

SamusTopTiles_Set0_CCAB:
; 10h: Moving left-   aiming up-left - frames 0..1
; 10h: Moving left-   aiming up-left - frames 5..6
; 6Ah: Facing left-   normal jump - aiming up-left - frames 0..1
; 6Eh: Facing left-   falling - aiming up-left - frames 0..2
; 75h: Facing left-   moonwalk - aiming up-left - frame 0
; 75h: Facing left-   moonwalk - aiming up-left - frame 3
; BBh: Facing left-   grabbed by Draygon - not moving - aiming up-left - frame 0
    dl SamusTiles_Top_Set0_Entry1B : dw $00E0,$0040                      ;92CCAB;

SamusTopTiles_Set0_CCB2:
; 54h: Facing left-   knockback - frames 0..1
; D8h: Facing left-   crystal flash ending - frames 4..5
; E9h: Facing left-   Samus drained - crouching/falling - frames 2..6
    dl SamusTiles_Top_Set0_Entry1C : dw $0100,$00C0                      ;92CCB2;

SamusTopTiles_Set0_CCB9:
; 53h: Facing right - knockback - frames 0..1
; D7h: Facing right - crystal flash ending - frames 4..5
; E8h: Facing right - Samus drained - crouching/falling - frames 3..7
    dl SamusTiles_Top_Set0_Entry1D : dw $0100,$00C0                      ;92CCB9;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set0_92CCC0:
    dl SamusTiles_Top_Set0_Entry1E : dw $0100,$0040                      ;92CCC0;

UNUSED_SamusTopTiles_Set0_92CCC7:
    dl SamusTiles_Top_Set0_Entry1F : dw $0100,$0040                      ;92CCC7;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CCCE: Samus top tiles - set 1 (general) ;;;
UNUSED_SamusTopTiles_Set1_92CCCE:
    dl SamusTiles_Top_Set1_Entry0 : dw $00C0,$0080                       ;92CCCE;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set1_92CCD5:
    dl SamusTiles_Top_Set1_Entry1 : dw $00C0,$0080                       ;92CCD5;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set1_CCDC:
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left-   turning - standing - aiming up - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left-   turning - in air - aiming up - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left-   turning - falling - aiming up - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left-   turning - crouching - aiming up - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left-   turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left-   turning - crouching - aiming up-left - frame 1
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 1
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 1
    dl SamusTiles_Top_Set1_Entry2 : dw $00E0,$00C0                       ;92CCDC;

SamusTopTiles_Set1_CCE3:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 1
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 1
    dl SamusTiles_Top_Set1_Entry3 : dw $0100,$00C0                       ;92CCE3;

SamusTopTiles_Set1_CCEA:
    dl SamusTiles_Top_Set1_Entry4 : dw $0020,$0000                       ;92CCEA;

SamusTopTiles_Set1_CCF1:
; 9Bh: Facing forward - varia/gravity suit - frame 0
    dl SamusTiles_Top_Set1_Entry5 : dw $0040,$0040                       ;92CCF1;

SamusTopTiles_Set1_CCF8:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left-   turning - standing - frame 0
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left-   turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left-   turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left-   turning - falling - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left-   moonwalking - turn/jump right - frame 0
; C6h: Unused - frame 2
    dl SamusTiles_Top_Set1_Entry6 : dw $00C0,$0080                       ;92CCF8;

SamusTopTiles_Set1_CCFF:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left-   turning - standing - frame 2
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left-   turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left-   turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left-   turning - falling - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left-   moonwalking - turn/jump right - frame 2
; C6h: Unused - frame 0
    dl SamusTiles_Top_Set1_Entry7 : dw $00C0,$0080                       ;92CCFF;

SamusTopTiles_Set1_CD06:
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left-   turning - standing - aiming up - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left-   turning - in air - aiming up - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left-   turning - falling - aiming up - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left-   turning - crouching - aiming up - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left-   turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left-   turning - crouching - aiming up-left - frame 0
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 2
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 0
    dl SamusTiles_Top_Set1_Entry8 : dw $00E0,$0040                       ;92CD06;

SamusTopTiles_Set1_CD0D:
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left-   turning - standing - aiming up - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left-   turning - in air - aiming up - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left-   turning - falling - aiming up - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left-   turning - crouching - aiming up - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left-   turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left-   turning - crouching - aiming up-left - frame 2
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 0
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 2
    dl SamusTiles_Top_Set1_Entry9 : dw $00C0,$0040                       ;92CD0D;

SamusTopTiles_Set1_CD14:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left-   turning - standing - frame 1
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left-   turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left-   turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left-   turning - falling - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left-   moonwalking - turn/jump right - frame 1
; C6h: Unused - frame 1
    dl SamusTiles_Top_Set1_EntryA : dw $00E0,$00C0                       ;92CD14;

SamusTopTiles_Set1_CD1B:
; 5Ch: Unused - frame 0
; 64h: Unused. Related to movement type Dh - frame 1
; B9h: Facing right - grapple wall jump pose - frame 0
    dl SamusTiles_Top_Set1_EntryB : dw $0100,$0080                       ;92CD1B;

SamusTopTiles_Set1_CD22:
; 45h: Unused - frame 0
; 46h: Unused - frame 0
; 5Bh: Unused - frame 0
; 63h: Unused. Related to movement type Dh - frame 1
; B8h: Facing left-   grapple wall jump pose - frame 0
    dl SamusTiles_Top_Set1_EntryC : dw $0100,$0080                       ;92CD22;

SamusTopTiles_Set1_CD29:
; 9: Moving right - not aiming - frame 1
    dl SamusTiles_Top_Set1_EntryD : dw $0080,$0080                       ;92CD29;

SamusTopTiles_Set1_CD30:
; 9: Moving right - not aiming - frame 6
    dl SamusTiles_Top_Set1_EntryE : dw $0080,$0080                       ;92CD30;

SamusTopTiles_Set1_CD37:
; Ah: Moving left-   not aiming - frame 1
    dl SamusTiles_Top_Set1_EntryF : dw $0080,$0080                       ;92CD37;

SamusTopTiles_Set1_CD3E:
; Ah: Moving left-   not aiming - frame 6
    dl SamusTiles_Top_Set1_Entry10 : dw $0080,$0080                      ;92CD3E;

SamusTopTiles_Set1_CD45:
; 0: Facing forward - power suit - frame 0
    dl SamusTiles_Top_Set1_Entry11 : dw $0080,$0080                      ;92CD45;

SamusTopTiles_Set1_CD4C:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
    dl SamusTiles_Top_Set1_Entry12 : dw $0080,$0080                      ;92CD4C;

SamusTopTiles_Set1_CD53:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left-   wall jump - frame 0
    dl SamusTiles_Top_Set1_Entry13 : dw $0080,$0080                      ;92CD53;

SamusTopTiles_Set1_CD5A:
; 63h: Unused. Related to movement type Dh - frame 0
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
    dl SamusTiles_Top_Set1_Entry14 : dw $0100,$00C0                      ;92CD5A;

SamusTopTiles_Set1_CD61:
; 64h: Unused. Related to movement type Dh - frame 0
; CAh: Facing left-   shinespark - horizontal - frame 0
; CEh: Facing left-   shinespark - diagonal - frame 0
    dl SamusTiles_Top_Set1_Entry15 : dw $0100,$00C0                      ;92CD61;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set1_92CD68:
    dl SamusTiles_Top_Set1_Entry16 : dw $0020,$0000                      ;92CD68;

UNUSED_SamusTopTiles_Set1_92CD6F:
    dl SamusTiles_Top_Set1_Entry17 : dw $0020,$0000                      ;92CD6F;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set1_CD76:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 2
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 0
    dl SamusTiles_Top_Set1_Entry18 : dw $00E0,$0040                      ;92CD76;

SamusTopTiles_Set1_CD7D:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 0
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 2
    dl SamusTiles_Top_Set1_Entry19 : dw $00E0,$0040                      ;92CD7D;

SamusTopTiles_Set1_CD84:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
    dl SamusTiles_Top_Set1_Entry1A : dw $00C0,$0080                      ;92CD84;

SamusTopTiles_Set1_CD8B:
; 18h: Facing left-   normal jump - aiming down - frame 1
; 2Eh: Facing left-   falling - aiming down - frame 1
; AFh: Unused. Facing left-   grappling - in air - aiming down - frame 1
    dl SamusTiles_Top_Set1_Entry1B : dw $00C0,$0080                      ;92CD8B;

SamusTopTiles_Set1_CD92:
; 19h: Facing right - spin jump - frame Bh
; 1Bh: Facing right - space jump - frame Bh
; 20h: Unused - frame Bh
; 21h: Unused - frame Bh
; 22h: Unused - frame Bh
; 23h: Unused - frame Bh
; 24h: Unused - frame Bh
; 33h: Unused - frame Bh
; 34h: Unused - frame Bh
; 39h: Unused - frame Bh
; 3Ah: Unused - frame Bh
; 42h: Unused - frame Bh
; 81h: Facing right - screw attack - frame 1Bh
    dl SamusTiles_Top_Set1_Entry1C : dw $00C0,$0080                      ;92CD92;

SamusTopTiles_Set1_CD99:
; 1Ah: Facing left-   spin jump - frame Bh
; 1Ch: Facing left-   space jump - frame Bh
; 82h: Facing left-   screw attack - frame 1Bh
    dl SamusTiles_Top_Set1_Entry1D : dw $00C0,$0080                      ;92CD99;


;;; $CDA0: Samus top tiles - set 2 (general) ;;;
SamusTopTiles_Set2_CDA0:
; 4Bh: Facing right - normal jump transition - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
    dl SamusTiles_Top_Set2_Entry0 : dw $0080,$0040                       ;92CDA0;

SamusTopTiles_Set2_CDA7:
; 4Ch: Facing left-   normal jump transition - frame 0
; A5h: Facing left-   landing from normal jump - frame 0
; A7h: Facing left-   landing from spin jump - frame 1
    dl SamusTiles_Top_Set2_Entry1 : dw $0080,$0080                       ;92CDA7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set2_92CDAE:
    dl SamusTiles_Top_Set2_Entry2 : dw $00C0,$0080                       ;92CDAE;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set2_CDB5:
; E9h: Facing left-   Samus drained - crouching/falling - frame 10h
; E9h: Facing left-   Samus drained - crouching/falling - frame 15h
    dl SamusTiles_Top_Set2_Entry3 : dw $0080,$0080                       ;92CDB5;

SamusTopTiles_Set2_CDBC:
; 19h: Facing right - spin jump - frame 0
; 1Bh: Facing right - space jump - frame 0
; 20h: Unused - frame 0
; 21h: Unused - frame 0
; 22h: Unused - frame 0
; 23h: Unused - frame 0
; 24h: Unused - frame 0
; 29h: Facing right - falling - frame 0
; 29h: Facing right - falling - frame 6
; 33h: Unused - frame 0
; 34h: Unused - frame 0
; 39h: Unused - frame 0
; 3Ah: Unused - frame 0
; 42h: Unused - frame 0
; 50h: Facing right - damage boost - frames 0..1
; 81h: Facing right - screw attack - frame 0
; 83h: Facing right - wall jump - frame 1
; A4h: Facing right - landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 0
; A6h: Facing right - landing from spin jump - frame 2
; ECh: Facing right - grabbed by Draygon - not moving - not aiming - frame 0
    dl SamusTiles_Top_Set2_Entry4 : dw $0080,$0040                       ;92CDBC;

SamusTopTiles_Set2_CDC3:
; 1Ah: Facing left-   spin jump - frame 0
; 1Ch: Facing left-   space jump - frame 0
; 2Ah: Facing left-   falling - frame 0
; 2Ah: Facing left-   falling - frame 6
; 4Fh: Facing left-   damage boost - frames 0..1
; 82h: Facing left-   screw attack - frame 0
; 84h: Facing left-   wall jump - frame 1
; A5h: Facing left-   landing from normal jump - frame 1
; A7h: Facing left-   landing from spin jump - frame 0
; A7h: Facing left-   landing from spin jump - frame 2
; BAh: Facing left-   grabbed by Draygon - not moving - not aiming - frame 0
    dl SamusTiles_Top_Set2_Entry5 : dw $0080,$0080                       ;92CDC3;

SamusTopTiles_Set2_CDCA:
; 11h: Moving right - aiming down-right - frame 2
; 11h: Moving right - aiming down-right - frame 4
; 11h: Moving right - aiming down-right - frame 7
; 11h: Moving right - aiming down-right - frame 9
; 78h: Facing right - moonwalk - aiming down-right - frames 1..2
; 78h: Facing right - moonwalk - aiming down-right - frames 4..5
    dl SamusTiles_Top_Set2_Entry6 : dw $00E0,$0040                       ;92CDCA;

SamusTopTiles_Set2_CDD1:
; 12h: Moving left-   aiming down-left - frame 2
; 12h: Moving left-   aiming down-left - frame 4
; 12h: Moving left-   aiming down-left - frame 7
; 12h: Moving left-   aiming down-left - frame 9
; 77h: Facing left-   moonwalk - aiming down-left - frames 1..2
; 77h: Facing left-   moonwalk - aiming down-left - frames 4..5
    dl SamusTiles_Top_Set2_Entry7 : dw $00E0,$0040                       ;92CDD1;

SamusTopTiles_Set2_CDD8:
; D5h: Facing right - x-ray - standing - frame 1
; D9h: Facing right - x-ray - crouching - frame 1
    dl SamusTiles_Top_Set2_Entry8 : dw $00C0,$0040                       ;92CDD8;

SamusTopTiles_Set2_CDDF:
; D5h: Facing right - x-ray - standing - frame 0
; D9h: Facing right - x-ray - crouching - frame 0
    dl SamusTiles_Top_Set2_Entry9 : dw $00C0,$0040                       ;92CDDF;

SamusTopTiles_Set2_CDE6:
; D5h: Facing right - x-ray - standing - frame 3
; D9h: Facing right - x-ray - crouching - frame 3
    dl SamusTiles_Top_Set2_EntryA : dw $00C0,$0040                       ;92CDE6;

SamusTopTiles_Set2_CDED:
; D5h: Facing right - x-ray - standing - frame 4
; D9h: Facing right - x-ray - crouching - frame 4
    dl SamusTiles_Top_Set2_EntryB : dw $00C0,$0040                       ;92CDED;

SamusTopTiles_Set2_CDF4:
; D6h: Facing left-   x-ray - standing - frame 1
; DAh: Facing left-   x-ray - crouching - frame 1
    dl SamusTiles_Top_Set2_EntryC : dw $00C0,$0040                       ;92CDF4;

SamusTopTiles_Set2_CDFB:
; D6h: Facing left-   x-ray - standing - frame 0
; DAh: Facing left-   x-ray - crouching - frame 0
    dl SamusTiles_Top_Set2_EntryD : dw $00C0,$0040                       ;92CDFB;

SamusTopTiles_Set2_CE02:
; Dh: Moving right - aiming up (unused) - frame 2
; Dh: Moving right - aiming up (unused) - frame 4
; Dh: Moving right - aiming up (unused) - frame 7
; Dh: Moving right - aiming up (unused) - frame 9
; D6h: Facing left-   x-ray - standing - frame 3
; DAh: Facing left-   x-ray - crouching - frame 3
    dl SamusTiles_Top_Set2_EntryE : dw $00C0,$0040                       ;92CE02;

SamusTopTiles_Set2_CE09:
; Eh: Moving left-   aiming up (unused) - frame 2
; Eh: Moving left-   aiming up (unused) - frame 4
; Eh: Moving left-   aiming up (unused) - frame 7
; Eh: Moving left-   aiming up (unused) - frame 9
; D6h: Facing left-   x-ray - standing - frame 4
; DAh: Facing left-   x-ray - crouching - frame 4
    dl SamusTiles_Top_Set2_EntryF : dw $00C0,$0040                       ;92CE09;

SamusTopTiles_Set2_CE10:
; Fh: Moving right - aiming up-right - frame 2
; Fh: Moving right - aiming up-right - frame 4
; Fh: Moving right - aiming up-right - frame 7
; Fh: Moving right - aiming up-right - frame 9
; 76h: Facing right - moonwalk - aiming up-right - frames 1..2
; 76h: Facing right - moonwalk - aiming up-right - frames 4..5
    dl SamusTiles_Top_Set2_Entry10 : dw $00C0,$0040                      ;92CE10;

SamusTopTiles_Set2_CE17:
; 10h: Moving left-   aiming up-left - frame 2
; 10h: Moving left-   aiming up-left - frame 4
; 10h: Moving left-   aiming up-left - frame 7
; 10h: Moving left-   aiming up-left - frame 9
; 75h: Facing left-   moonwalk - aiming up-left - frames 1..2
; 75h: Facing left-   moonwalk - aiming up-left - frames 4..5
    dl SamusTiles_Top_Set2_Entry11 : dw $00E0,$0040                      ;92CE17;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set2_92CE1E:
    dl SamusTiles_Top_Set2_Entry12 : dw $0100,$0040                      ;92CE1E;

UNUSED_SamusTopTiles_Set2_92CE25:
    dl SamusTiles_Top_Set2_Entry13 : dw $0100,$0040                      ;92CE25;

UNUSED_SamusTopTiles_Set2_92CE2C:
    dl SamusTiles_Top_Set2_Entry14 : dw $0100,$0040                      ;92CE2C;

UNUSED_SamusTopTiles_Set2_92CE33:
    dl SamusTiles_Top_Set2_Entry15 : dw $0100,$0040                      ;92CE33;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set2_CE3A:
; Fh: Moving right - aiming up-right - frame 3
; Fh: Moving right - aiming up-right - frame 8
    dl SamusTiles_Top_Set2_Entry16 : dw $00C0,$0040                      ;92CE3A;

SamusTopTiles_Set2_CE41:
; 10h: Moving left-   aiming up-left - frame 3
; 10h: Moving left-   aiming up-left - frame 8
    dl SamusTiles_Top_Set2_Entry17 : dw $00E0,$0040                      ;92CE41;

SamusTopTiles_Set2_CE48:
; 11h: Moving right - aiming down-right - frame 3
; 11h: Moving right - aiming down-right - frame 8
    dl SamusTiles_Top_Set2_Entry18 : dw $00E0,$0040                      ;92CE48;

SamusTopTiles_Set2_CE4F:
; 12h: Moving left-   aiming down-left - frame 3
; 12h: Moving left-   aiming down-left - frame 8
    dl SamusTiles_Top_Set2_Entry19 : dw $00E0,$0040                      ;92CE4F;

SamusTopTiles_Set2_CE56:
; 4Ah: Facing right - moonwalk - frames 1..2
; 4Ah: Facing right - moonwalk - frames 4..5
    dl SamusTiles_Top_Set2_Entry1A : dw $00C0,$0040                      ;92CE56;

SamusTopTiles_Set2_CE5D:
; 49h: Facing left-   moonwalk - frames 1..2
; 49h: Facing left-   moonwalk - frames 4..5
    dl SamusTiles_Top_Set2_Entry1B : dw $00C0,$0040                      ;92CE5D;

SamusTopTiles_Set2_CE64:
; 29h: Facing right - falling - frame 1
; 29h: Facing right - falling - frame 5
    dl SamusTiles_Top_Set2_Entry1C : dw $00E0,$0040                      ;92CE64;

SamusTopTiles_Set2_CE6B:
; 29h: Facing right - falling - frame 2
; 50h: Facing right - damage boost - frame 9
    dl SamusTiles_Top_Set2_Entry1D : dw $00C0,$0040                      ;92CE6B;

SamusTopTiles_Set2_CE72:
; Dh: Moving right - aiming up (unused) - frame 3
; Dh: Moving right - aiming up (unused) - frame 8
; 2Ah: Facing left-   falling - frame 1
; 2Ah: Facing left-   falling - frame 5
    dl SamusTiles_Top_Set2_Entry1E : dw $00C0,$0040                      ;92CE72;

SamusTopTiles_Set2_CE79:
; Eh: Moving left-   aiming up (unused) - frame 3
; Eh: Moving left-   aiming up (unused) - frame 8
; 2Ah: Facing left-   falling - frame 2
; 4Fh: Facing left-   damage boost - frame 9
    dl SamusTiles_Top_Set2_Entry1F : dw $00C0,$0040                      ;92CE79;


;;; $CE80: Samus top tiles - set 3 (facing clockwise - grappling - in air - upside up) ;;;
SamusTopTiles_Set3_CE80:
; 5Dh: Unused - frame 18h
; 5Dh: Unused - frame 38h
; 5Eh: Unused - frame 18h
; 5Eh: Unused - frame 38h
; 5Fh: Unused - frame 18h
; 5Fh: Unused - frame 38h
; 60h: Unused - frame 18h
; 60h: Unused - frame 38h
; 61h: Unused - frame 18h
; 61h: Unused - frame 38h
; B2h: Facing clockwise   -   grapple - in air - frame 18h
; B2h: Facing clockwise   -   grapple - in air - frame 38h
    dl SamusTiles_Top_Set3_Entry0 : dw $00C0,$0080                       ;92CE80;

SamusTopTiles_Set3_CE87:
; 5Dh: Unused - frame 17h
; 5Dh: Unused - frame 37h
; 5Eh: Unused - frame 17h
; 5Eh: Unused - frame 37h
; 5Fh: Unused - frame 17h
; 5Fh: Unused - frame 37h
; 60h: Unused - frame 17h
; 60h: Unused - frame 37h
; 61h: Unused - frame 17h
; 61h: Unused - frame 37h
; B2h: Facing clockwise   -   grapple - in air - frame 17h
; B2h: Facing clockwise   -   grapple - in air - frame 37h
    dl SamusTiles_Top_Set3_Entry1 : dw $00C0,$0080                       ;92CE87;

SamusTopTiles_Set3_CE8E:
; 5Dh: Unused - frame 16h
; 5Dh: Unused - frame 36h
; 5Eh: Unused - frame 16h
; 5Eh: Unused - frame 36h
; 5Fh: Unused - frame 16h
; 5Fh: Unused - frame 36h
; 60h: Unused - frame 16h
; 60h: Unused - frame 36h
; 61h: Unused - frame 16h
; 61h: Unused - frame 36h
; B2h: Facing clockwise   -   grapple - in air - frame 16h
; B2h: Facing clockwise   -   grapple - in air - frame 36h
    dl SamusTiles_Top_Set3_Entry2 : dw $00C0,$00C0                       ;92CE8E;

SamusTopTiles_Set3_CE95:
; 5Dh: Unused - frame 15h
; 5Dh: Unused - frame 35h
; 5Eh: Unused - frame 15h
; 5Eh: Unused - frame 35h
; 5Fh: Unused - frame 15h
; 5Fh: Unused - frame 35h
; 60h: Unused - frame 15h
; 60h: Unused - frame 35h
; 61h: Unused - frame 15h
; 61h: Unused - frame 35h
; B2h: Facing clockwise   -   grapple - in air - frame 15h
; B2h: Facing clockwise   -   grapple - in air - frame 35h
    dl SamusTiles_Top_Set3_Entry3 : dw $00C0,$00C0                       ;92CE95;

SamusTopTiles_Set3_CE9C:
; 5Dh: Unused - frame 14h
; 5Dh: Unused - frame 34h
; 5Eh: Unused - frame 14h
; 5Eh: Unused - frame 34h
; 5Fh: Unused - frame 14h
; 5Fh: Unused - frame 34h
; 60h: Unused - frame 14h
; 60h: Unused - frame 34h
; 61h: Unused - frame 14h
; 61h: Unused - frame 34h
; B2h: Facing clockwise   -   grapple - in air - frame 14h
; B2h: Facing clockwise   -   grapple - in air - frame 34h
    dl SamusTiles_Top_Set3_Entry4 : dw $00C0,$00C0                       ;92CE9C;

SamusTopTiles_Set3_CEA3:
; 5Dh: Unused - frame 13h
; 5Dh: Unused - frame 33h
; 5Eh: Unused - frame 13h
; 5Eh: Unused - frame 33h
; 5Fh: Unused - frame 13h
; 5Fh: Unused - frame 33h
; 60h: Unused - frame 13h
; 60h: Unused - frame 33h
; 61h: Unused - frame 13h
; 61h: Unused - frame 33h
; B2h: Facing clockwise   -   grapple - in air - frame 13h
; B2h: Facing clockwise   -   grapple - in air - frame 33h
    dl SamusTiles_Top_Set3_Entry5 : dw $00C0,$00C0                       ;92CEA3;

SamusTopTiles_Set3_CEAA:
; 5Dh: Unused - frame 12h
; 5Dh: Unused - frame 32h
; 5Eh: Unused - frame 12h
; 5Eh: Unused - frame 32h
; 5Fh: Unused - frame 12h
; 5Fh: Unused - frame 32h
; 60h: Unused - frame 12h
; 60h: Unused - frame 32h
; 61h: Unused - frame 12h
; 61h: Unused - frame 32h
; B2h: Facing clockwise   -   grapple - in air - frame 12h
; B2h: Facing clockwise   -   grapple - in air - frame 32h
    dl SamusTiles_Top_Set3_Entry6 : dw $00C0,$00C0                       ;92CEAA;

SamusTopTiles_Set3_CEB1:
; 5Dh: Unused - frame 11h
; 5Dh: Unused - frame 31h
; 5Eh: Unused - frame 11h
; 5Eh: Unused - frame 31h
; 5Fh: Unused - frame 11h
; 5Fh: Unused - frame 31h
; 60h: Unused - frame 11h
; 60h: Unused - frame 31h
; 61h: Unused - frame 11h
; 61h: Unused - frame 31h
; B2h: Facing clockwise   -   grapple - in air - frame 11h
; B2h: Facing clockwise   -   grapple - in air - frame 31h
    dl SamusTiles_Top_Set3_Entry7 : dw $00C0,$0080                       ;92CEB1;

SamusTopTiles_Set3_CEB8:
; 5Dh: Unused - frame 10h
; 5Dh: Unused - frame 30h
; 5Dh: Unused - frames 40h..41h
; 5Eh: Unused - frame 10h
; 5Eh: Unused - frame 30h
; 5Eh: Unused - frames 40h..41h
; 5Fh: Unused - frame 10h
; 5Fh: Unused - frame 30h
; 5Fh: Unused - frames 40h..41h
; 60h: Unused - frame 10h
; 60h: Unused - frame 30h
; 60h: Unused - frames 40h..41h
; 61h: Unused - frame 10h
; 61h: Unused - frame 30h
; 61h: Unused - frames 40h..41h
; B2h: Facing clockwise   -   grapple - in air - frame 10h
; B2h: Facing clockwise   -   grapple - in air - frame 30h
; B2h: Facing clockwise   -   grapple - in air - frames 40h..41h
    dl SamusTiles_Top_Set3_Entry8 : dw $00C0,$0080                       ;92CEB8;

SamusTopTiles_Set3_CEBF:
; 5Dh: Unused - frame Fh
; 5Dh: Unused - frame 2Fh
; 5Eh: Unused - frame Fh
; 5Eh: Unused - frame 2Fh
; 5Fh: Unused - frame Fh
; 5Fh: Unused - frame 2Fh
; 60h: Unused - frame Fh
; 60h: Unused - frame 2Fh
; 61h: Unused - frame Fh
; 61h: Unused - frame 2Fh
; B2h: Facing clockwise   -   grapple - in air - frame Fh
; B2h: Facing clockwise   -   grapple - in air - frame 2Fh
    dl SamusTiles_Top_Set3_Entry9 : dw $00C0,$0080                       ;92CEBF;

SamusTopTiles_Set3_CEC6:
; 5Dh: Unused - frame Eh
; 5Dh: Unused - frame 2Eh
; 5Eh: Unused - frame Eh
; 5Eh: Unused - frame 2Eh
; 5Fh: Unused - frame Eh
; 5Fh: Unused - frame 2Eh
; 60h: Unused - frame Eh
; 60h: Unused - frame 2Eh
; 61h: Unused - frame Eh
; 61h: Unused - frame 2Eh
; B2h: Facing clockwise   -   grapple - in air - frame Eh
; B2h: Facing clockwise   -   grapple - in air - frame 2Eh
    dl SamusTiles_Top_Set3_EntryA : dw $00C0,$00C0                       ;92CEC6;

SamusTopTiles_Set3_CECD:
; 5Dh: Unused - frame Dh
; 5Dh: Unused - frame 2Dh
; 5Eh: Unused - frame Dh
; 5Eh: Unused - frame 2Dh
; 5Fh: Unused - frame Dh
; 5Fh: Unused - frame 2Dh
; 60h: Unused - frame Dh
; 60h: Unused - frame 2Dh
; 61h: Unused - frame Dh
; 61h: Unused - frame 2Dh
; B2h: Facing clockwise   -   grapple - in air - frame Dh
; B2h: Facing clockwise   -   grapple - in air - frame 2Dh
    dl SamusTiles_Top_Set3_EntryB : dw $00C0,$00C0                       ;92CECD;

SamusTopTiles_Set3_CED4:
; 5Dh: Unused - frame Ch
; 5Dh: Unused - frame 2Ch
; 5Eh: Unused - frame Ch
; 5Eh: Unused - frame 2Ch
; 5Fh: Unused - frame Ch
; 5Fh: Unused - frame 2Ch
; 60h: Unused - frame Ch
; 60h: Unused - frame 2Ch
; 61h: Unused - frame Ch
; 61h: Unused - frame 2Ch
; B2h: Facing clockwise   -   grapple - in air - frame Ch
; B2h: Facing clockwise   -   grapple - in air - frame 2Ch
    dl SamusTiles_Top_Set3_EntryC : dw $00C0,$00C0                       ;92CED4;

SamusTopTiles_Set3_CEDB:
; 5Dh: Unused - frame Bh
; 5Dh: Unused - frame 2Bh
; 5Eh: Unused - frame Bh
; 5Eh: Unused - frame 2Bh
; 5Fh: Unused - frame Bh
; 5Fh: Unused - frame 2Bh
; 60h: Unused - frame Bh
; 60h: Unused - frame 2Bh
; 61h: Unused - frame Bh
; 61h: Unused - frame 2Bh
; B2h: Facing clockwise   -   grapple - in air - frame Bh
; B2h: Facing clockwise   -   grapple - in air - frame 2Bh
    dl SamusTiles_Top_Set3_EntryD : dw $00C0,$00C0                       ;92CEDB;

SamusTopTiles_Set3_CEE2:
; 5Dh: Unused - frame Ah
; 5Dh: Unused - frame 2Ah
; 5Eh: Unused - frame Ah
; 5Eh: Unused - frame 2Ah
; 5Fh: Unused - frame Ah
; 5Fh: Unused - frame 2Ah
; 60h: Unused - frame Ah
; 60h: Unused - frame 2Ah
; 61h: Unused - frame Ah
; 61h: Unused - frame 2Ah
; B2h: Facing clockwise   -   grapple - in air - frame Ah
; B2h: Facing clockwise   -   grapple - in air - frame 2Ah
    dl SamusTiles_Top_Set3_EntryE : dw $00C0,$00C0                       ;92CEE2;

SamusTopTiles_Set3_CEE9:
; 5Dh: Unused - frame 9
; 5Dh: Unused - frame 29h
; 5Eh: Unused - frame 9
; 5Eh: Unused - frame 29h
; 5Fh: Unused - frame 9
; 5Fh: Unused - frame 29h
; 60h: Unused - frame 9
; 60h: Unused - frame 29h
; 61h: Unused - frame 9
; 61h: Unused - frame 29h
; B2h: Facing clockwise   -   grapple - in air - frame 9
; B2h: Facing clockwise   -   grapple - in air - frame 29h
    dl SamusTiles_Top_Set3_EntryF : dw $00C0,$0080                       ;92CEE9;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set3_92CEF0:
    dl SamusTiles_Top_Set3_Entry10 : dw $00C0,$0080                      ;92CEF0;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CEF7: Samus top tiles - set 4 (facing anticlockwise - grappling - in air - upside up) ;;;
SamusTopTiles_Set4_CEF7:
; 62h: Unused - frame 8
; 62h: Unused - frame 28h
; B3h: Facing anticlockwise - grapple - in air - frame 8
; B3h: Facing anticlockwise - grapple - in air - frame 28h
    dl SamusTiles_Top_Set4_Entry0 : dw $0100,$00C0                       ;92CEF7;

SamusTopTiles_Set4_CEFE:
; 62h: Unused - frame 9
; 62h: Unused - frame 29h
; B3h: Facing anticlockwise - grapple - in air - frame 9
; B3h: Facing anticlockwise - grapple - in air - frame 29h
    dl SamusTiles_Top_Set4_Entry1 : dw $0100,$00C0                       ;92CEFE;

SamusTopTiles_Set4_CF05:
; 62h: Unused - frame Ah
; 62h: Unused - frame 2Ah
; B3h: Facing anticlockwise - grapple - in air - frame Ah
; B3h: Facing anticlockwise - grapple - in air - frame 2Ah
    dl SamusTiles_Top_Set4_Entry2 : dw $0100,$0100                       ;92CF05;

SamusTopTiles_Set4_CF0C:
; 62h: Unused - frame Bh
; 62h: Unused - frame 2Bh
; B3h: Facing anticlockwise - grapple - in air - frame Bh
; B3h: Facing anticlockwise - grapple - in air - frame 2Bh
    dl SamusTiles_Top_Set4_Entry3 : dw $0100,$0100                       ;92CF0C;

SamusTopTiles_Set4_CF13:
; 62h: Unused - frame Ch
; 62h: Unused - frame 2Ch
; B3h: Facing anticlockwise - grapple - in air - frame Ch
; B3h: Facing anticlockwise - grapple - in air - frame 2Ch
    dl SamusTiles_Top_Set4_Entry4 : dw $0100,$00E0                       ;92CF13;

SamusTopTiles_Set4_CF1A:
; 62h: Unused - frame Dh
; 62h: Unused - frame 2Dh
; B3h: Facing anticlockwise - grapple - in air - frame Dh
; B3h: Facing anticlockwise - grapple - in air - frame 2Dh
    dl SamusTiles_Top_Set4_Entry5 : dw $0100,$00E0                       ;92CF1A;

SamusTopTiles_Set4_CF21:
; 62h: Unused - frame Eh
; 62h: Unused - frame 2Eh
; B3h: Facing anticlockwise - grapple - in air - frame Eh
; B3h: Facing anticlockwise - grapple - in air - frame 2Eh
    dl SamusTiles_Top_Set4_Entry6 : dw $0100,$00E0                       ;92CF21;

SamusTopTiles_Set4_CF28:
; 62h: Unused - frame Fh
; 62h: Unused - frame 2Fh
; B3h: Facing anticlockwise - grapple - in air - frame Fh
; B3h: Facing anticlockwise - grapple - in air - frame 2Fh
    dl SamusTiles_Top_Set4_Entry7 : dw $0100,$00C0                       ;92CF28;

SamusTopTiles_Set4_CF2F:
; 62h: Unused - frame 10h
; 62h: Unused - frame 30h
; 62h: Unused - frames 40h..41h
; B3h: Facing anticlockwise - grapple - in air - frame 10h
; B3h: Facing anticlockwise - grapple - in air - frame 30h
; B3h: Facing anticlockwise - grapple - in air - frames 40h..41h
    dl SamusTiles_Top_Set4_Entry8 : dw $0100,$00C0                       ;92CF2F;

SamusTopTiles_Set4_CF36:
; 62h: Unused - frame 11h
; 62h: Unused - frame 31h
; B3h: Facing anticlockwise - grapple - in air - frame 11h
; B3h: Facing anticlockwise - grapple - in air - frame 31h
    dl SamusTiles_Top_Set4_Entry9 : dw $0100,$00C0                       ;92CF36;

SamusTopTiles_Set4_CF3D:
; 62h: Unused - frame 12h
; 62h: Unused - frame 32h
; B3h: Facing anticlockwise - grapple - in air - frame 12h
; B3h: Facing anticlockwise - grapple - in air - frame 32h
    dl SamusTiles_Top_Set4_EntryA : dw $0100,$00E0                       ;92CF3D;

SamusTopTiles_Set4_CF44:
; 62h: Unused - frame 13h
; 62h: Unused - frame 33h
; B3h: Facing anticlockwise - grapple - in air - frame 13h
; B3h: Facing anticlockwise - grapple - in air - frame 33h
    dl SamusTiles_Top_Set4_EntryB : dw $0100,$0100                       ;92CF44;

SamusTopTiles_Set4_CF4B:
; 62h: Unused - frame 14h
; 62h: Unused - frame 34h
; B3h: Facing anticlockwise - grapple - in air - frame 14h
; B3h: Facing anticlockwise - grapple - in air - frame 34h
    dl SamusTiles_Top_Set4_EntryC : dw $0100,$0100                       ;92CF4B;

SamusTopTiles_Set4_CF52:
; 62h: Unused - frame 15h
; 62h: Unused - frame 35h
; B3h: Facing anticlockwise - grapple - in air - frame 15h
; B3h: Facing anticlockwise - grapple - in air - frame 35h
    dl SamusTiles_Top_Set4_EntryD : dw $0100,$0100                       ;92CF52;

SamusTopTiles_Set4_CF59:
; 62h: Unused - frame 16h
; 62h: Unused - frame 36h
; B3h: Facing anticlockwise - grapple - in air - frame 16h
; B3h: Facing anticlockwise - grapple - in air - frame 36h
    dl SamusTiles_Top_Set4_EntryE : dw $0100,$0100                       ;92CF59;

SamusTopTiles_Set4_CF60:
; 62h: Unused - frame 17h
; 62h: Unused - frame 37h
; B3h: Facing anticlockwise - grapple - in air - frame 17h
; B3h: Facing anticlockwise - grapple - in air - frame 37h
    dl SamusTiles_Top_Set4_EntryF : dw $0100,$00E0                       ;92CF60;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set4_92CF67:
    dl SamusTiles_Top_Set4_Entry10 : dw $0100,$00E0                      ;92CF67;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CF6E: Samus top tiles - set 5 (facing clockwise - grappling - in air - upside down) ;;;
SamusTopTiles_Set5_CF6E:
; 5Dh: Unused - frame 8
; 5Dh: Unused - frame 28h
; 5Eh: Unused - frame 8
; 5Eh: Unused - frame 28h
; 5Fh: Unused - frame 8
; 5Fh: Unused - frame 28h
; 60h: Unused - frame 8
; 60h: Unused - frame 28h
; 61h: Unused - frame 8
; 61h: Unused - frame 28h
; B2h: Facing clockwise   -   grapple - in air - frame 8
; B2h: Facing clockwise   -   grapple - in air - frame 28h
    dl SamusTiles_Top_Set5_Entry0 : dw $00C0,$0080                       ;92CF6E;

SamusTopTiles_Set5_CF75:
; 5Dh: Unused - frame 7
; 5Dh: Unused - frame 27h
; 5Eh: Unused - frame 7
; 5Eh: Unused - frame 27h
; 5Fh: Unused - frame 7
; 5Fh: Unused - frame 27h
; 60h: Unused - frame 7
; 60h: Unused - frame 27h
; 61h: Unused - frame 7
; 61h: Unused - frame 27h
; B2h: Facing clockwise   -   grapple - in air - frame 7
; B2h: Facing clockwise   -   grapple - in air - frame 27h
    dl SamusTiles_Top_Set5_Entry1 : dw $00C0,$0080                       ;92CF75;

SamusTopTiles_Set5_CF7C:
; 5Dh: Unused - frame 6
; 5Dh: Unused - frame 26h
; 5Eh: Unused - frame 6
; 5Eh: Unused - frame 26h
; 5Fh: Unused - frame 6
; 5Fh: Unused - frame 26h
; 60h: Unused - frame 6
; 60h: Unused - frame 26h
; 61h: Unused - frame 6
; 61h: Unused - frame 26h
; B2h: Facing clockwise   -   grapple - in air - frame 6
; B2h: Facing clockwise   -   grapple - in air - frame 26h
    dl SamusTiles_Top_Set5_Entry2 : dw $00C0,$00C0                       ;92CF7C;

SamusTopTiles_Set5_CF83:
; 5Dh: Unused - frame 5
; 5Dh: Unused - frame 25h
; 5Eh: Unused - frame 5
; 5Eh: Unused - frame 25h
; 5Fh: Unused - frame 5
; 5Fh: Unused - frame 25h
; 60h: Unused - frame 5
; 60h: Unused - frame 25h
; 61h: Unused - frame 5
; 61h: Unused - frame 25h
; B2h: Facing clockwise   -   grapple - in air - frame 5
; B2h: Facing clockwise   -   grapple - in air - frame 25h
    dl SamusTiles_Top_Set5_Entry3 : dw $00C0,$00C0                       ;92CF83;

SamusTopTiles_Set5_CF8A:
; 5Dh: Unused - frame 4
; 5Dh: Unused - frame 24h
; 5Eh: Unused - frame 4
; 5Eh: Unused - frame 24h
; 5Fh: Unused - frame 4
; 5Fh: Unused - frame 24h
; 60h: Unused - frame 4
; 60h: Unused - frame 24h
; 61h: Unused - frame 4
; 61h: Unused - frame 24h
; B2h: Facing clockwise   -   grapple - in air - frame 4
; B2h: Facing clockwise   -   grapple - in air - frame 24h
    dl SamusTiles_Top_Set5_Entry4 : dw $00C0,$00C0                       ;92CF8A;

SamusTopTiles_Set5_CF91:
; 5Dh: Unused - frame 3
; 5Dh: Unused - frame 23h
; 5Eh: Unused - frame 3
; 5Eh: Unused - frame 23h
; 5Fh: Unused - frame 3
; 5Fh: Unused - frame 23h
; 60h: Unused - frame 3
; 60h: Unused - frame 23h
; 61h: Unused - frame 3
; 61h: Unused - frame 23h
; B2h: Facing clockwise   -   grapple - in air - frame 3
; B2h: Facing clockwise   -   grapple - in air - frame 23h
    dl SamusTiles_Top_Set5_Entry5 : dw $00C0,$00C0                       ;92CF91;

SamusTopTiles_Set5_CF98:
; 5Dh: Unused - frame 2
; 5Dh: Unused - frame 22h
; 5Eh: Unused - frame 2
; 5Eh: Unused - frame 22h
; 5Fh: Unused - frame 2
; 5Fh: Unused - frame 22h
; 60h: Unused - frame 2
; 60h: Unused - frame 22h
; 61h: Unused - frame 2
; 61h: Unused - frame 22h
; B2h: Facing clockwise   -   grapple - in air - frame 2
; B2h: Facing clockwise   -   grapple - in air - frame 22h
    dl SamusTiles_Top_Set5_Entry6 : dw $00C0,$00C0                       ;92CF98;

SamusTopTiles_Set5_CF9F:
; 5Dh: Unused - frame 1
; 5Dh: Unused - frame 21h
; 5Eh: Unused - frame 1
; 5Eh: Unused - frame 21h
; 5Fh: Unused - frame 1
; 5Fh: Unused - frame 21h
; 60h: Unused - frame 1
; 60h: Unused - frame 21h
; 61h: Unused - frame 1
; 61h: Unused - frame 21h
; B2h: Facing clockwise   -   grapple - in air - frame 1
; B2h: Facing clockwise   -   grapple - in air - frame 21h
    dl SamusTiles_Top_Set5_Entry7 : dw $00C0,$0080                       ;92CF9F;

SamusTopTiles_Set5_CFA6:
; 5Dh: Unused - frame 0
; 5Dh: Unused - frame 20h
; 5Eh: Unused - frame 0
; 5Eh: Unused - frame 20h
; 5Fh: Unused - frame 0
; 5Fh: Unused - frame 20h
; 60h: Unused - frame 0
; 60h: Unused - frame 20h
; 61h: Unused - frame 0
; 61h: Unused - frame 20h
; B2h: Facing clockwise   -   grapple - in air - frame 0
; B2h: Facing clockwise   -   grapple - in air - frame 20h
    dl SamusTiles_Top_Set5_Entry8 : dw $00C0,$0080                       ;92CFA6;

SamusTopTiles_Set5_CFAD:
; 5Dh: Unused - frame 1Fh
; 5Dh: Unused - frame 3Fh
; 5Eh: Unused - frame 1Fh
; 5Eh: Unused - frame 3Fh
; 5Fh: Unused - frame 1Fh
; 5Fh: Unused - frame 3Fh
; 60h: Unused - frame 1Fh
; 60h: Unused - frame 3Fh
; 61h: Unused - frame 1Fh
; 61h: Unused - frame 3Fh
; B2h: Facing clockwise   -   grapple - in air - frame 1Fh
; B2h: Facing clockwise   -   grapple - in air - frame 3Fh
    dl SamusTiles_Top_Set5_Entry9 : dw $00C0,$0080                       ;92CFAD;

SamusTopTiles_Set5_CFB4:
; 5Dh: Unused - frame 1Eh
; 5Dh: Unused - frame 3Eh
; 5Eh: Unused - frame 1Eh
; 5Eh: Unused - frame 3Eh
; 5Fh: Unused - frame 1Eh
; 5Fh: Unused - frame 3Eh
; 60h: Unused - frame 1Eh
; 60h: Unused - frame 3Eh
; 61h: Unused - frame 1Eh
; 61h: Unused - frame 3Eh
; B2h: Facing clockwise   -   grapple - in air - frame 1Eh
; B2h: Facing clockwise   -   grapple - in air - frame 3Eh
    dl SamusTiles_Top_Set5_EntryA : dw $00C0,$00C0                       ;92CFB4;

SamusTopTiles_Set5_CFBB:
; 5Dh: Unused - frame 1Dh
; 5Dh: Unused - frame 3Dh
; 5Eh: Unused - frame 1Dh
; 5Eh: Unused - frame 3Dh
; 5Fh: Unused - frame 1Dh
; 5Fh: Unused - frame 3Dh
; 60h: Unused - frame 1Dh
; 60h: Unused - frame 3Dh
; 61h: Unused - frame 1Dh
; 61h: Unused - frame 3Dh
; B2h: Facing clockwise   -   grapple - in air - frame 1Dh
; B2h: Facing clockwise   -   grapple - in air - frame 3Dh
    dl SamusTiles_Top_Set5_EntryB : dw $00C0,$00C0                       ;92CFBB;

SamusTopTiles_Set5_CFC2:
; 5Dh: Unused - frame 1Ch
; 5Dh: Unused - frame 3Ch
; 5Eh: Unused - frame 1Ch
; 5Eh: Unused - frame 3Ch
; 5Fh: Unused - frame 1Ch
; 5Fh: Unused - frame 3Ch
; 60h: Unused - frame 1Ch
; 60h: Unused - frame 3Ch
; 61h: Unused - frame 1Ch
; 61h: Unused - frame 3Ch
; B2h: Facing clockwise   -   grapple - in air - frame 1Ch
; B2h: Facing clockwise   -   grapple - in air - frame 3Ch
    dl SamusTiles_Top_Set5_EntryC : dw $00C0,$00C0                       ;92CFC2;

SamusTopTiles_Set5_CFC9:
; 5Dh: Unused - frame 1Bh
; 5Dh: Unused - frame 3Bh
; 5Eh: Unused - frame 1Bh
; 5Eh: Unused - frame 3Bh
; 5Fh: Unused - frame 1Bh
; 5Fh: Unused - frame 3Bh
; 60h: Unused - frame 1Bh
; 60h: Unused - frame 3Bh
; 61h: Unused - frame 1Bh
; 61h: Unused - frame 3Bh
; B2h: Facing clockwise   -   grapple - in air - frame 1Bh
; B2h: Facing clockwise   -   grapple - in air - frame 3Bh
    dl SamusTiles_Top_Set5_EntryD : dw $00C0,$00C0                       ;92CFC9;

SamusTopTiles_Set5_CFD0:
; 5Dh: Unused - frame 1Ah
; 5Dh: Unused - frame 3Ah
; 5Eh: Unused - frame 1Ah
; 5Eh: Unused - frame 3Ah
; 5Fh: Unused - frame 1Ah
; 5Fh: Unused - frame 3Ah
; 60h: Unused - frame 1Ah
; 60h: Unused - frame 3Ah
; 61h: Unused - frame 1Ah
; 61h: Unused - frame 3Ah
; B2h: Facing clockwise   -   grapple - in air - frame 1Ah
; B2h: Facing clockwise   -   grapple - in air - frame 3Ah
    dl SamusTiles_Top_Set5_EntryE : dw $00C0,$00C0                       ;92CFD0;

SamusTopTiles_Set5_CFD7:
; 5Dh: Unused - frame 19h
; 5Dh: Unused - frame 39h
; 5Eh: Unused - frame 19h
; 5Eh: Unused - frame 39h
; 5Fh: Unused - frame 19h
; 5Fh: Unused - frame 39h
; 60h: Unused - frame 19h
; 60h: Unused - frame 39h
; 61h: Unused - frame 19h
; 61h: Unused - frame 39h
; B2h: Facing clockwise   -   grapple - in air - frame 19h
; B2h: Facing clockwise   -   grapple - in air - frame 39h
    dl SamusTiles_Top_Set5_EntryF : dw $00C0,$0080                       ;92CFD7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set5_92CFDE:
    dl SamusTiles_Top_Set5_Entry10 : dw $00C0,$0080                      ;92CFDE;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CFE5: Samus top tiles - set 6 (facing anticlockwise - grappling - in air - upside down) ;;;
SamusTopTiles_Set6_CFE5:
; 62h: Unused - frame 18h
; 62h: Unused - frame 38h
; B3h: Facing anticlockwise - grapple - in air - frame 18h
; B3h: Facing anticlockwise - grapple - in air - frame 38h
    dl SamusTiles_Top_Set6_Entry0 : dw $0100,$00C0                       ;92CFE5;

SamusTopTiles_Set6_CFEC:
; 62h: Unused - frame 19h
; 62h: Unused - frame 39h
; B3h: Facing anticlockwise - grapple - in air - frame 19h
; B3h: Facing anticlockwise - grapple - in air - frame 39h
    dl SamusTiles_Top_Set6_Entry1 : dw $0100,$00C0                       ;92CFEC;

SamusTopTiles_Set6_CFF3:
; 62h: Unused - frame 1Ah
; 62h: Unused - frame 3Ah
; B3h: Facing anticlockwise - grapple - in air - frame 1Ah
; B3h: Facing anticlockwise - grapple - in air - frame 3Ah
    dl SamusTiles_Top_Set6_Entry2 : dw $0100,$0100                       ;92CFF3;

SamusTopTiles_Set6_CFFA:
; 62h: Unused - frame 1Bh
; 62h: Unused - frame 3Bh
; B3h: Facing anticlockwise - grapple - in air - frame 1Bh
; B3h: Facing anticlockwise - grapple - in air - frame 3Bh
    dl SamusTiles_Top_Set6_Entry3 : dw $0100,$0100                       ;92CFFA;

SamusTopTiles_Set6_D001:
; 62h: Unused - frame 1Ch
; 62h: Unused - frame 3Ch
; B3h: Facing anticlockwise - grapple - in air - frame 1Ch
; B3h: Facing anticlockwise - grapple - in air - frame 3Ch
    dl SamusTiles_Top_Set6_Entry4 : dw $0100,$00E0                       ;92D001;

SamusTopTiles_Set6_D008:
; 62h: Unused - frame 1Dh
; 62h: Unused - frame 3Dh
; B3h: Facing anticlockwise - grapple - in air - frame 1Dh
; B3h: Facing anticlockwise - grapple - in air - frame 3Dh
    dl SamusTiles_Top_Set6_Entry5 : dw $0100,$00E0                       ;92D008;

SamusTopTiles_Set6_D00F:
; 62h: Unused - frame 1Eh
; 62h: Unused - frame 3Eh
; B3h: Facing anticlockwise - grapple - in air - frame 1Eh
; B3h: Facing anticlockwise - grapple - in air - frame 3Eh
    dl SamusTiles_Top_Set6_Entry6 : dw $0100,$00E0                       ;92D00F;

SamusTopTiles_Set6_D016:
; 62h: Unused - frame 1Fh
; 62h: Unused - frame 3Fh
; B3h: Facing anticlockwise - grapple - in air - frame 1Fh
; B3h: Facing anticlockwise - grapple - in air - frame 3Fh
    dl SamusTiles_Top_Set6_Entry7 : dw $0100,$00C0                       ;92D016;

SamusTopTiles_Set6_D01D:
; 62h: Unused - frame 0
; 62h: Unused - frame 20h
; B3h: Facing anticlockwise - grapple - in air - frame 0
; B3h: Facing anticlockwise - grapple - in air - frame 20h
    dl SamusTiles_Top_Set6_Entry8 : dw $0100,$00C0                       ;92D01D;

SamusTopTiles_Set6_D024:
; 62h: Unused - frame 1
; 62h: Unused - frame 21h
; B3h: Facing anticlockwise - grapple - in air - frame 1
; B3h: Facing anticlockwise - grapple - in air - frame 21h
    dl SamusTiles_Top_Set6_Entry9 : dw $0100,$00C0                       ;92D024;

SamusTopTiles_Set6_D02B:
; 62h: Unused - frame 2
; 62h: Unused - frame 22h
; B3h: Facing anticlockwise - grapple - in air - frame 2
; B3h: Facing anticlockwise - grapple - in air - frame 22h
    dl SamusTiles_Top_Set6_EntryA : dw $0100,$00E0                       ;92D02B;

SamusTopTiles_Set6_D032:
; 62h: Unused - frame 3
; 62h: Unused - frame 23h
; B3h: Facing anticlockwise - grapple - in air - frame 3
; B3h: Facing anticlockwise - grapple - in air - frame 23h
    dl SamusTiles_Top_Set6_EntryB : dw $0100,$0100                       ;92D032;

SamusTopTiles_Set6_D039:
; 62h: Unused - frame 4
; 62h: Unused - frame 24h
; B3h: Facing anticlockwise - grapple - in air - frame 4
; B3h: Facing anticlockwise - grapple - in air - frame 24h
    dl SamusTiles_Top_Set6_EntryC : dw $0100,$0100                       ;92D039;

SamusTopTiles_Set6_D040:
; 62h: Unused - frame 5
; 62h: Unused - frame 25h
; B3h: Facing anticlockwise - grapple - in air - frame 5
; B3h: Facing anticlockwise - grapple - in air - frame 25h
    dl SamusTiles_Top_Set6_EntryD : dw $0100,$0100                       ;92D040;

SamusTopTiles_Set6_D047:
; 62h: Unused - frame 6
; 62h: Unused - frame 26h
; B3h: Facing anticlockwise - grapple - in air - frame 6
; B3h: Facing anticlockwise - grapple - in air - frame 26h
    dl SamusTiles_Top_Set6_EntryE : dw $0100,$0100                       ;92D047;

SamusTopTiles_Set6_D04E:
; 62h: Unused - frame 7
; 62h: Unused - frame 27h
; B3h: Facing anticlockwise - grapple - in air - frame 7
; B3h: Facing anticlockwise - grapple - in air - frame 27h
    dl SamusTiles_Top_Set6_EntryF : dw $0100,$00E0                       ;92D04E;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set6_92D055:
    dl SamusTiles_Top_Set6_Entry10 : dw $0100,$00E0                      ;92D055;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D05C: Samus top tiles - set 7 (standing, crouching, drained) ;;;
SamusTopTiles_Set7_D05C:
; E9h: Facing left-   Samus drained - crouching/falling - frame 8
; E9h: Facing left-   Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left-   Samus drained - crouching/falling - frame 1Dh
    dl SamusTiles_Top_Set7_Entry0 : dw $00E0,$0040                       ;92D05C;

SamusTopTiles_Set7_D063:
; E9h: Facing left-   Samus drained - crouching/falling - frame 7
; E9h: Facing left-   Samus drained - crouching/falling - frame 9
; E9h: Facing left-   Samus drained - crouching/falling - frame Bh
; E9h: Facing left-   Samus drained - crouching/falling - frame Eh
; E9h: Facing left-   Samus drained - crouching/falling - frame 13h
; E9h: Facing left-   Samus drained - crouching/falling - frame 17h
    dl SamusTiles_Top_Set7_Entry1 : dw $00E0,$0040                       ;92D063;

SamusTopTiles_Set7_D06A:
; E9h: Facing left-   Samus drained - crouching/falling - frame Ah
    dl SamusTiles_Top_Set7_Entry2 : dw $00E0,$0040                       ;92D06A;

SamusTopTiles_Set7_D071:
; E8h: Facing right - Samus drained - crouching/falling - frame 8
    dl SamusTiles_Top_Set7_Entry3 : dw $0100,$0040                       ;92D071;

SamusTopTiles_Set7_D078:
; E8h: Facing right - Samus drained - crouching/falling - frame 9
; E8h: Facing right - Samus drained - crouching/falling - frame Bh
    dl SamusTiles_Top_Set7_Entry4 : dw $0100,$0040                       ;92D078;

SamusTopTiles_Set7_D07F:
; E8h: Facing right - Samus drained - crouching/falling - frame Ah
    dl SamusTiles_Top_Set7_Entry5 : dw $0100,$0040                       ;92D07F;

SamusTopTiles_Set7_D086:
; EBh: Facing left-   Samus drained - standing - frame 0
    dl SamusTiles_Top_Set7_Entry6 : dw $00E0,$0040                       ;92D086;

SamusTopTiles_Set7_D08D:
; E9h: Facing left-   Samus drained - crouching/falling - frame Fh
; E9h: Facing left-   Samus drained - crouching/falling - frame 14h
; E9h: Facing left-   Samus drained - crouching/falling - frame 16h
; EBh: Facing left-   Samus drained - standing - frame 1
; EBh: Facing left-   Samus drained - standing - frame 3
    dl SamusTiles_Top_Set7_Entry7 : dw $00E0,$0040                       ;92D08D;

SamusTopTiles_Set7_D094:
; EBh: Facing left-   Samus drained - standing - frame 2
    dl SamusTiles_Top_Set7_Entry8 : dw $00E0,$0040                       ;92D094;

SamusTopTiles_Set7_D09B:
; EAh: Facing right - Samus drained - standing - frame 0
    dl SamusTiles_Top_Set7_Entry9 : dw $0100,$0040                       ;92D09B;

SamusTopTiles_Set7_D0A2:
; EAh: Facing right - Samus drained - standing - frame 1
; EAh: Facing right - Samus drained - standing - frame 3
    dl SamusTiles_Top_Set7_EntryA : dw $0100,$0040                       ;92D0A2;

SamusTopTiles_Set7_D0A9:
; EAh: Facing right - Samus drained - standing - frame 2
    dl SamusTiles_Top_Set7_EntryB : dw $0100,$0040                       ;92D0A9;

SamusTopTiles_Set7_D0B0:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 27h: Facing right - crouching - frame 0
; 27h: Facing right - crouching - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; B4h: Facing right - grappling - crouching - frame 0
; B4h: Facing right - grappling - crouching - frame 5
    dl SamusTiles_Top_Set7_EntryC : dw $00C0,$0080                       ;92D0B0;

SamusTopTiles_Set7_D0B7:
; 1: Facing right - normal - frame 1
; 1: Facing right - normal - frame 3
; 1: Facing right - normal - frame 6
; 1: Facing right - normal - frame 8
; 27h: Facing right - crouching - frame 1
; 27h: Facing right - crouching - frame 3
; 27h: Facing right - crouching - frame 6
; 27h: Facing right - crouching - frame 8
; 47h: Unused - frame 1
; 47h: Unused - frame 3
; 47h: Unused - frame 6
; 47h: Unused - frame 8
; 89h: Facing right - ran into a wall - frame 1
; 89h: Facing right - ran into a wall - frame 3
; 89h: Facing right - ran into a wall - frame 6
; 89h: Facing right - ran into a wall - frame 8
; A8h: Facing right - grappling - frame 1
; A8h: Facing right - grappling - frame 3
; A8h: Facing right - grappling - frame 6
; A8h: Facing right - grappling - frame 8
; B4h: Facing right - grappling - crouching - frame 1
; B4h: Facing right - grappling - crouching - frame 3
; B4h: Facing right - grappling - crouching - frame 6
; B4h: Facing right - grappling - crouching - frame 8
    dl SamusTiles_Top_Set7_EntryD : dw $00C0,$0080                       ;92D0B7;

SamusTopTiles_Set7_D0BE:
; 1: Facing right - normal - frame 2
; 27h: Facing right - crouching - frame 2
; 47h: Unused - frame 2
; 89h: Facing right - ran into a wall - frame 2
; A8h: Facing right - grappling - frame 2
; B4h: Facing right - grappling - crouching - frame 2
    dl SamusTiles_Top_Set7_EntryE : dw $00C0,$0080                       ;92D0BE;

SamusTopTiles_Set7_D0C5:
; 2: Facing left-   normal - frame 0
; 2: Facing left-   normal - frame 5
; 28h: Facing left-   crouching - frame 0
; 28h: Facing left-   crouching - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 8Ah: Facing left-   ran into a wall - frame 0
; 8Ah: Facing left-   ran into a wall - frame 5
; A9h: Facing left-   grappling - frame 0
; A9h: Facing left-   grappling - frame 5
; B5h: Facing left-   grappling - crouching - frame 0
; B5h: Facing left-   grappling - crouching - frame 5
    dl SamusTiles_Top_Set7_EntryF : dw $00C0,$0080                       ;92D0C5;

SamusTopTiles_Set7_D0CC:
; 2: Facing left-   normal - frame 1
; 2: Facing left-   normal - frame 3
; 2: Facing left-   normal - frame 6
; 2: Facing left-   normal - frame 8
; 28h: Facing left-   crouching - frame 1
; 28h: Facing left-   crouching - frame 3
; 28h: Facing left-   crouching - frame 6
; 28h: Facing left-   crouching - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left-   ran into a wall - frame 1
; 8Ah: Facing left-   ran into a wall - frame 3
; 8Ah: Facing left-   ran into a wall - frame 6
; 8Ah: Facing left-   ran into a wall - frame 8
; A9h: Facing left-   grappling - frame 1
; A9h: Facing left-   grappling - frame 3
; A9h: Facing left-   grappling - frame 6
; A9h: Facing left-   grappling - frame 8
; B5h: Facing left-   grappling - crouching - frame 1
; B5h: Facing left-   grappling - crouching - frame 3
; B5h: Facing left-   grappling - crouching - frame 6
; B5h: Facing left-   grappling - crouching - frame 8
    dl SamusTiles_Top_Set7_Entry10 : dw $00C0,$0080                      ;92D0CC;

SamusTopTiles_Set7_D0D3:
; 2: Facing left-   normal - frame 2
; 28h: Facing left-   crouching - frame 2
; 48h: Unused - frame 2
; 8Ah: Facing left-   ran into a wall - frame 2
; A9h: Facing left-   grappling - frame 2
; B5h: Facing left-   grappling - crouching - frame 2
    dl SamusTiles_Top_Set7_Entry11 : dw $00C0,$0080                      ;92D0D3;

SamusTopTiles_Set7_D0DA:
; 1: Facing right - normal - frame 7
; 27h: Facing right - crouching - frame 7
; 47h: Unused - frame 7
; 89h: Facing right - ran into a wall - frame 7
; A8h: Facing right - grappling - frame 7
; B4h: Facing right - grappling - crouching - frame 7
    dl SamusTiles_Top_Set7_Entry12 : dw $00C0,$0040                      ;92D0DA;

SamusTopTiles_Set7_D0E1:
; 2: Facing left-   normal - frame 7
; 28h: Facing left-   crouching - frame 7
; 48h: Unused - frame 7
; 8Ah: Facing left-   ran into a wall - frame 7
; A9h: Facing left-   grappling - frame 7
; B5h: Facing left-   grappling - crouching - frame 7
    dl SamusTiles_Top_Set7_Entry13 : dw $00C0,$0040                      ;92D0E1;


;;; $D0E8: Samus top tiles - set 8 (Samus appearance electricity) ;;;
SamusTopTiles_Set8_D0E8:
; 0: Facing forward - power suit - frame 3
; 0: Facing forward - power suit - frame 5
; 0: Facing forward - power suit - frame 7
; 0: Facing forward - power suit - frame 9
; 0: Facing forward - power suit - frame Bh
; 0: Facing forward - power suit - frame Dh
; 0: Facing forward - power suit - frame Fh
; 0: Facing forward - power suit - frame 11h
; 0: Facing forward - power suit - frame 13h
; 0: Facing forward - power suit - frame 15h
; 0: Facing forward - power suit - frame 17h
; 0: Facing forward - power suit - frame 19h
; 0: Facing forward - power suit - frame 1Bh
; 0: Facing forward - power suit - frame 1Dh
; 0: Facing forward - power suit - frame 1Fh
; 0: Facing forward - power suit - frame 21h
; 0: Facing forward - power suit - frame 23h
; 0: Facing forward - power suit - frame 25h
; 0: Facing forward - power suit - frame 27h
; 0: Facing forward - power suit - frame 29h
; 0: Facing forward - power suit - frame 2Bh
; 0: Facing forward - power suit - frame 2Dh
; 0: Facing forward - power suit - frame 2Fh
; 0: Facing forward - power suit - frame 31h
; 0: Facing forward - power suit - frame 33h
; 0: Facing forward - power suit - frame 35h
; 0: Facing forward - power suit - frame 37h
; 0: Facing forward - power suit - frame 39h
; 0: Facing forward - power suit - frame 3Bh
; 0: Facing forward - power suit - frame 3Dh
; 0: Facing forward - power suit - frame 3Fh
; 0: Facing forward - power suit - frame 41h
; 0: Facing forward - power suit - frame 43h
; 0: Facing forward - power suit - frame 45h
; 0: Facing forward - power suit - frame 47h
; 0: Facing forward - power suit - frame 49h
; 0: Facing forward - power suit - frame 4Bh
; 0: Facing forward - power suit - frame 4Dh
; 0: Facing forward - power suit - frame 4Fh
; 0: Facing forward - power suit - frame 51h
; 0: Facing forward - power suit - frame 53h
; 0: Facing forward - power suit - frame 55h
; 0: Facing forward - power suit - frame 57h
; 0: Facing forward - power suit - frame 59h
; 0: Facing forward - power suit - frame 5Bh
; 0: Facing forward - power suit - frame 5Dh
; 0: Facing forward - power suit - frame 5Fh
; 9Bh: Facing forward - varia/gravity suit - frame 3
; 9Bh: Facing forward - varia/gravity suit - frame 5
; 9Bh: Facing forward - varia/gravity suit - frame 7
; 9Bh: Facing forward - varia/gravity suit - frame 9
; 9Bh: Facing forward - varia/gravity suit - frame Bh
; 9Bh: Facing forward - varia/gravity suit - frame Dh
; 9Bh: Facing forward - varia/gravity suit - frame Fh
; 9Bh: Facing forward - varia/gravity suit - frame 11h
; 9Bh: Facing forward - varia/gravity suit - frame 13h
; 9Bh: Facing forward - varia/gravity suit - frame 15h
; 9Bh: Facing forward - varia/gravity suit - frame 17h
; 9Bh: Facing forward - varia/gravity suit - frame 19h
; 9Bh: Facing forward - varia/gravity suit - frame 1Bh
; 9Bh: Facing forward - varia/gravity suit - frame 1Dh
; 9Bh: Facing forward - varia/gravity suit - frame 1Fh
; 9Bh: Facing forward - varia/gravity suit - frame 21h
; 9Bh: Facing forward - varia/gravity suit - frame 23h
; 9Bh: Facing forward - varia/gravity suit - frame 25h
; 9Bh: Facing forward - varia/gravity suit - frame 27h
; 9Bh: Facing forward - varia/gravity suit - frame 29h
; 9Bh: Facing forward - varia/gravity suit - frame 2Bh
; 9Bh: Facing forward - varia/gravity suit - frame 2Dh
; 9Bh: Facing forward - varia/gravity suit - frame 2Fh
; 9Bh: Facing forward - varia/gravity suit - frame 31h
; 9Bh: Facing forward - varia/gravity suit - frame 33h
; 9Bh: Facing forward - varia/gravity suit - frame 35h
; 9Bh: Facing forward - varia/gravity suit - frame 37h
; 9Bh: Facing forward - varia/gravity suit - frame 39h
; 9Bh: Facing forward - varia/gravity suit - frame 3Bh
; 9Bh: Facing forward - varia/gravity suit - frame 3Dh
; 9Bh: Facing forward - varia/gravity suit - frame 3Fh
; 9Bh: Facing forward - varia/gravity suit - frame 41h
; 9Bh: Facing forward - varia/gravity suit - frame 43h
; 9Bh: Facing forward - varia/gravity suit - frame 45h
; 9Bh: Facing forward - varia/gravity suit - frame 47h
; 9Bh: Facing forward - varia/gravity suit - frame 49h
; 9Bh: Facing forward - varia/gravity suit - frame 4Bh
; 9Bh: Facing forward - varia/gravity suit - frame 4Dh
; 9Bh: Facing forward - varia/gravity suit - frame 4Fh
; 9Bh: Facing forward - varia/gravity suit - frame 51h
; 9Bh: Facing forward - varia/gravity suit - frame 53h
; 9Bh: Facing forward - varia/gravity suit - frame 55h
; 9Bh: Facing forward - varia/gravity suit - frame 57h
; 9Bh: Facing forward - varia/gravity suit - frame 59h
; 9Bh: Facing forward - varia/gravity suit - frame 5Bh
; 9Bh: Facing forward - varia/gravity suit - frame 5Dh
; 9Bh: Facing forward - varia/gravity suit - frame 5Fh
    dl SamusTiles_Top_Set8_Entry0 : dw $0020,$0000                       ;92D0E8;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set8_92D0EF:
    dl SamusTiles_Top_Set8_Entry1 : dw $0020,$0000                       ;92D0EF;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set8_D0F6:
; 0: Facing forward - power suit - frame 2
; 0: Facing forward - power suit - frame 8
; 0: Facing forward - power suit - frame Eh
; 0: Facing forward - power suit - frame 14h
; 0: Facing forward - power suit - frame 1Ah
; 0: Facing forward - power suit - frame 20h
; 0: Facing forward - power suit - frame 26h
; 0: Facing forward - power suit - frame 2Ch
; 0: Facing forward - power suit - frame 32h
; 0: Facing forward - power suit - frame 38h
; 0: Facing forward - power suit - frame 3Eh
; 0: Facing forward - power suit - frame 44h
; 0: Facing forward - power suit - frame 4Ah
; 9Bh: Facing forward - varia/gravity suit - frame 2
; 9Bh: Facing forward - varia/gravity suit - frame 8
; 9Bh: Facing forward - varia/gravity suit - frame Eh
; 9Bh: Facing forward - varia/gravity suit - frame 14h
; 9Bh: Facing forward - varia/gravity suit - frame 1Ah
; 9Bh: Facing forward - varia/gravity suit - frame 20h
; 9Bh: Facing forward - varia/gravity suit - frame 26h
; 9Bh: Facing forward - varia/gravity suit - frame 2Ch
; 9Bh: Facing forward - varia/gravity suit - frame 32h
; 9Bh: Facing forward - varia/gravity suit - frame 38h
; 9Bh: Facing forward - varia/gravity suit - frame 3Eh
; 9Bh: Facing forward - varia/gravity suit - frame 44h
; 9Bh: Facing forward - varia/gravity suit - frame 4Ah
    dl SamusTiles_Top_Set8_Entry2 : dw $0100,$0020                       ;92D0F6;

SamusTopTiles_Set8_D0FD:
; 0: Facing forward - power suit - frame 4
; 0: Facing forward - power suit - frame Ah
; 0: Facing forward - power suit - frame 10h
; 0: Facing forward - power suit - frame 16h
; 0: Facing forward - power suit - frame 1Ch
; 0: Facing forward - power suit - frame 22h
; 0: Facing forward - power suit - frame 28h
; 0: Facing forward - power suit - frame 2Eh
; 0: Facing forward - power suit - frame 34h
; 0: Facing forward - power suit - frame 3Ah
; 0: Facing forward - power suit - frame 40h
; 0: Facing forward - power suit - frame 46h
; 0: Facing forward - power suit - frame 4Ch
; 9Bh: Facing forward - varia/gravity suit - frame 4
; 9Bh: Facing forward - varia/gravity suit - frame Ah
; 9Bh: Facing forward - varia/gravity suit - frame 10h
; 9Bh: Facing forward - varia/gravity suit - frame 16h
; 9Bh: Facing forward - varia/gravity suit - frame 1Ch
; 9Bh: Facing forward - varia/gravity suit - frame 22h
; 9Bh: Facing forward - varia/gravity suit - frame 28h
; 9Bh: Facing forward - varia/gravity suit - frame 2Eh
; 9Bh: Facing forward - varia/gravity suit - frame 34h
; 9Bh: Facing forward - varia/gravity suit - frame 3Ah
; 9Bh: Facing forward - varia/gravity suit - frame 40h
; 9Bh: Facing forward - varia/gravity suit - frame 46h
; 9Bh: Facing forward - varia/gravity suit - frame 4Ch
    dl SamusTiles_Top_Set8_Entry3 : dw $00E0,$0000                       ;92D0FD;

SamusTopTiles_Set8_D104:
; 0: Facing forward - power suit - frame 6
; 0: Facing forward - power suit - frame Ch
; 0: Facing forward - power suit - frame 12h
; 0: Facing forward - power suit - frame 18h
; 0: Facing forward - power suit - frame 1Eh
; 0: Facing forward - power suit - frame 24h
; 0: Facing forward - power suit - frame 2Ah
; 0: Facing forward - power suit - frame 30h
; 0: Facing forward - power suit - frame 36h
; 0: Facing forward - power suit - frame 3Ch
; 0: Facing forward - power suit - frame 42h
; 0: Facing forward - power suit - frame 48h
; 0: Facing forward - power suit - frame 4Eh
; 9Bh: Facing forward - varia/gravity suit - frame 6
; 9Bh: Facing forward - varia/gravity suit - frame Ch
; 9Bh: Facing forward - varia/gravity suit - frame 12h
; 9Bh: Facing forward - varia/gravity suit - frame 18h
; 9Bh: Facing forward - varia/gravity suit - frame 1Eh
; 9Bh: Facing forward - varia/gravity suit - frame 24h
; 9Bh: Facing forward - varia/gravity suit - frame 2Ah
; 9Bh: Facing forward - varia/gravity suit - frame 30h
; 9Bh: Facing forward - varia/gravity suit - frame 36h
; 9Bh: Facing forward - varia/gravity suit - frame 3Ch
; 9Bh: Facing forward - varia/gravity suit - frame 42h
; 9Bh: Facing forward - varia/gravity suit - frame 48h
; 9Bh: Facing forward - varia/gravity suit - frame 4Eh
    dl SamusTiles_Top_Set8_Entry4 : dw $0100,$0060                       ;92D104;

SamusTopTiles_Set8_D10B:
; 0: Facing forward - power suit - frame 50h
; 9Bh: Facing forward - varia/gravity suit - frame 50h
    dl SamusTiles_Top_Set8_Entry5 : dw $0100,$00E0                       ;92D10B;

SamusTopTiles_Set8_D112:
; 0: Facing forward - power suit - frame 52h
; 9Bh: Facing forward - varia/gravity suit - frame 52h
    dl SamusTiles_Top_Set8_Entry6 : dw $0100,$0000                       ;92D112;

SamusTopTiles_Set8_D119:
; 0: Facing forward - power suit - frame 54h
; 0: Facing forward - power suit - frame 5Ah
; 9Bh: Facing forward - varia/gravity suit - frame 54h
; 9Bh: Facing forward - varia/gravity suit - frame 5Ah
    dl SamusTiles_Top_Set8_Entry7 : dw $0100,$0040                       ;92D119;

SamusTopTiles_Set8_D120:
; 0: Facing forward - power suit - frame 56h
; 0: Facing forward - power suit - frame 5Ch
; 9Bh: Facing forward - varia/gravity suit - frame 56h
; 9Bh: Facing forward - varia/gravity suit - frame 5Ch
    dl SamusTiles_Top_Set8_Entry8 : dw $0100,$0060                       ;92D120;

SamusTopTiles_Set8_D127:
; 0: Facing forward - power suit - frame 58h
; 0: Facing forward - power suit - frame 5Eh
; 9Bh: Facing forward - varia/gravity suit - frame 58h
; 9Bh: Facing forward - varia/gravity suit - frame 5Eh
    dl SamusTiles_Top_Set8_Entry9 : dw $00E0,$0000                       ;92D127;


;;; $D12E: Samus top tiles - set 9 (moving - gun extended) ;;;
SamusTopTiles_Set9_D12E:
; Bh: Moving right - gun extended - frame 0
; Bh: Moving right - gun extended - frame 5
    dl SamusTiles_Top_Set9_Entry0 : dw $0080,$0040                       ;92D12E;

SamusTopTiles_Set9_D135:
; Bh: Moving right - gun extended - frame 4
    dl SamusTiles_Top_Set9_Entry1 : dw $0080,$0040                       ;92D135;

SamusTopTiles_Set9_D13C:
; Bh: Moving right - gun extended - frame 2
    dl SamusTiles_Top_Set9_Entry2 : dw $00A0,$0040                       ;92D13C;

SamusTopTiles_Set9_D143:
; Bh: Moving right - gun extended - frame 3
    dl SamusTiles_Top_Set9_Entry3 : dw $00C0,$0040                       ;92D143;

SamusTopTiles_Set9_D14A:
; Bh: Moving right - gun extended - frame 6
; Bh: Moving right - gun extended - frame 9
    dl SamusTiles_Top_Set9_Entry4 : dw $0080,$0040                       ;92D14A;

SamusTopTiles_Set9_D151:
; Bh: Moving right - gun extended - frame 7
    dl SamusTiles_Top_Set9_Entry5 : dw $00A0,$0040                       ;92D151;

SamusTopTiles_Set9_D158:
; Ch: Moving left-   gun extended - frame 0
; Ch: Moving left-   gun extended - frame 5
    dl SamusTiles_Top_Set9_Entry6 : dw $00C0,$0040                       ;92D158;

SamusTopTiles_Set9_D15F:
; Ch: Moving left-   gun extended - frame 4
    dl SamusTiles_Top_Set9_Entry7 : dw $00C0,$0040                       ;92D15F;

SamusTopTiles_Set9_D166:
; Ch: Moving left-   gun extended - frame 3
    dl SamusTiles_Top_Set9_Entry8 : dw $00E0,$0040                       ;92D166;

SamusTopTiles_Set9_D16D:
; Ch: Moving left-   gun extended - frame 2
    dl SamusTiles_Top_Set9_Entry9 : dw $00E0,$0040                       ;92D16D;

SamusTopTiles_Set9_D174:
; Ch: Moving left-   gun extended - frame 6
; Ch: Moving left-   gun extended - frame 9
    dl SamusTiles_Top_Set9_EntryA : dw $00C0,$0040                       ;92D174;

SamusTopTiles_Set9_D17B:
; Ch: Moving left-   gun extended - frame 8
    dl SamusTiles_Top_Set9_EntryB : dw $0100,$0040                       ;92D17B;

SamusTopTiles_Set9_D182:
; Bh: Moving right - gun extended - frame 8
    dl SamusTiles_Top_Set9_EntryC : dw $00C0,$0040                       ;92D182;

SamusTopTiles_Set9_D189:
; Ch: Moving left-   gun extended - frame 7
    dl SamusTiles_Top_Set9_EntryD : dw $0100,$0040                       ;92D189;

SamusTopTiles_Set9_D190:
; Bh: Moving right - gun extended - frame 1
    dl SamusTiles_Top_Set9_EntryE : dw $0080,$0040                       ;92D190;

SamusTopTiles_Set9_D197:
; Ch: Moving left-   gun extended - frame 1
    dl SamusTiles_Top_Set9_EntryF : dw $00C0,$0040                       ;92D197;


;;; $D19E: Samus bottom tiles - set 0 (general) ;;;
SamusBottomTiles_Set0_D19E:
; Actually used by:
;     9: Moving right - not aiming - frame 0
;     Ah: Moving left-   not aiming - frame 0
;     Bh: Moving right - gun extended - frame 0
;     Ch: Moving left-   gun extended - frame 0
;     Dh: Moving right - aiming up (unused) - frame 0
;     Eh: Moving left-   aiming up (unused) - frame 0
;     Fh: Moving right - aiming up-right - frame 0
;     10h: Moving left-   aiming up-left - frame 0
;     11h: Moving right - aiming down-right - frame 0
;     12h: Moving left-   aiming down-left - frame 0

; Meaninglessly used by:
;     0: Facing forward - power suit - frame 1
;     1: Facing right - normal - frame 4
;     2: Facing left-   normal - frame 4
;     19h: Facing right - spin jump - frames 1..Ah
;     1Ah: Facing left-   spin jump - frames 1..Ah
;     1Bh: Facing right - space jump - frames 9..Ah
;     1Ch: Facing left-   space jump - frames 9..Ah
;     1Dh: Facing right - morph ball - no springball - on ground - frames 0..9
;     1Eh: Moving right - morph ball - no springball - on ground - frames 0..9
;     1Fh: Moving left-   morph ball - no springball - on ground - frames 0..9
;     20h: Unused - frames 1..Ah
;     21h: Unused - frames 1..Ah
;     22h: Unused - frames 1..Ah
;     23h: Unused - frames 1..Ah
;     24h: Unused - frames 1..Ah
;     27h: Facing right - crouching - frame 4
;     28h: Facing left-   crouching - frame 4
;     29h: Facing right - falling - frames 3..4
;     2Ah: Facing left-   falling - frames 3..4
;     31h: Facing right - morph ball - no springball - in air - frames 0..9
;     32h: Facing left-   morph ball - no springball - in air - frames 0..9
;     33h: Unused - frames 1..Ah
;     34h: Unused - frames 1..Ah
;     37h: Facing right - morphing transition - frames 0..1
;     38h: Facing left-   morphing transition - frames 0..1
;     39h: Unused - frames 1..Ah
;     3Ah: Unused - frames 1..Ah
;     3Dh: Facing right - unmorphing transition - frames 0..1
;     3Eh: Facing left-   unmorphing transition - frames 0..1
;     3Fh: Unused - frames 0..9
;     40h: Unused - frames 0..9
;     41h: Facing left-   morph ball - no springball - on ground - frames 0..9
;     42h: Unused - frames 1..Ah
;     47h: Unused - frame 4
;     48h: Unused - frame 4
;     4Fh: Facing left-   damage boost - frames 2..8
;     50h: Facing right - damage boost - frames 2..8
;     65h: Unused. Related to movement type Dh - frames 1..8
;     66h: Unused. Related to movement type Dh - frames 1..8
;     67h: Facing right - falling - gun extended - frames 3..4
;     68h: Facing left-   falling - gun extended - frames 3..4
;     79h: Facing right - morph ball - spring ball - on ground - frames 0..9
;     7Ah: Facing left-   morph ball - spring ball - on ground - frames 0..9
;     7Bh: Moving right - morph ball - spring ball - on ground - frames 0..9
;     7Ch: Moving left-   morph ball - spring ball - on ground - frames 0..9
;     7Dh: Facing right - morph ball - spring ball - falling - frames 0..9
;     7Eh: Facing left-   morph ball - spring ball - falling - frames 0..9
;     7Fh: Facing right - morph ball - spring ball - in air - frames 0..9
;     80h: Facing left-   morph ball - spring ball - in air - frames 0..9
;     81h: Facing right - screw attack - frames 19h..1Ah
;     82h: Facing left-   screw attack - frames 19h..1Ah
;     83h: Facing right - wall jump - frames 2..Ch
;     83h: Facing right - wall jump - frames 15h..16h
;     84h: Facing left-   wall jump - frames 2..Ch
;     84h: Facing left-   wall jump - frames 15h..16h
;     89h: Facing right - ran into a wall - frame 4
;     8Ah: Facing left-   ran into a wall - frame 4
;     9Bh: Facing forward - varia/gravity suit - frame 1
;     A8h: Facing right - grappling - frame 4
;     A9h: Facing left-   grappling - frame 4
;     B4h: Facing right - grappling - crouching - frame 4
;     B5h: Facing left-   grappling - crouching - frame 4
;     C5h: Unused - frames 0..9
;     CBh: Facing right - shinespark - vertical - frame 0
;     CCh: Facing left-   shinespark - vertical - frame 0
;     D3h: Facing right - crystal flash - frames 4..5
;     D3h: Facing right - crystal flash - frames Ah..Bh
;     D4h: Facing left-   crystal flash - frames 4..5
;     D4h: Facing left-   crystal flash - frames Ah..Bh
;     DBh: Unused - frames 1..2
;     DCh: Unused - frames 1..2
;     DDh: Unused - frames 0..1
;     DEh: Unused - frames 0..1
;     DFh: Unused. Related to Draygon - frames 0..9
;     E8h: Facing right - Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left-   Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left-   Samus drained - crouching/falling - frames 11h..12h
;     E9h: Facing left-   Samus drained - crouching/falling - frames 18h..19h
;     E9h: Facing left-   Samus drained - crouching/falling - frames 1Bh..1Ch
;     E9h: Facing left-   Samus drained - crouching/falling - frames 1Eh..1Fh
;     EAh: Facing right - Samus drained - standing - frame 4
;     EBh: Facing left-   Samus drained - standing - frame 4
    dl SamusTiles_Bottom_Set0_Entry0 : dw $0080,$0080                    ;92D19E;

SamusBottomTiles_Set0_D1A5:
; 9: Moving right - not aiming - frame 2
; Ah: Moving left-   not aiming - frame 2
; Bh: Moving right - gun extended - frame 2
; Ch: Moving left-   gun extended - frame 2
; Dh: Moving right - aiming up (unused) - frame 2
; Eh: Moving left-   aiming up (unused) - frame 2
; Fh: Moving right - aiming up-right - frame 2
; 10h: Moving left-   aiming up-left - frame 2
; 11h: Moving right - aiming down-right - frame 2
; 12h: Moving left-   aiming down-left - frame 2
    dl SamusTiles_Bottom_Set0_Entry1 : dw $00E0,$0080                    ;92D1A5;

SamusBottomTiles_Set0_D1AC:
; 9: Moving right - not aiming - frame 4
; Ah: Moving left-   not aiming - frame 4
; Bh: Moving right - gun extended - frame 4
; Ch: Moving left-   gun extended - frame 4
; Dh: Moving right - aiming up (unused) - frame 4
; Eh: Moving left-   aiming up (unused) - frame 4
; Fh: Moving right - aiming up-right - frame 4
; 10h: Moving left-   aiming up-left - frame 4
; 11h: Moving right - aiming down-right - frame 4
; 12h: Moving left-   aiming down-left - frame 4
    dl SamusTiles_Bottom_Set0_Entry2 : dw $00E0,$00C0                    ;92D1AC;

SamusBottomTiles_Set0_D1B3:
; 9: Moving right - not aiming - frame 5
; Ah: Moving left-   not aiming - frame 5
; Bh: Moving right - gun extended - frame 5
; Ch: Moving left-   gun extended - frame 5
; Dh: Moving right - aiming up (unused) - frame 5
; Eh: Moving left-   aiming up (unused) - frame 5
; Fh: Moving right - aiming up-right - frame 5
; 10h: Moving left-   aiming up-left - frame 5
; 11h: Moving right - aiming down-right - frame 5
; 12h: Moving left-   aiming down-left - frame 5
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 0
; C7h: Facing right - vertical shinespark windup - frame 0
; C8h: Facing left-   vertical shinespark windup - frame 0
    dl SamusTiles_Bottom_Set0_Entry3 : dw $0080,$0080                    ;92D1B3;

SamusBottomTiles_Set0_D1BA:
; 9: Moving right - not aiming - frame 7
; Ah: Moving left-   not aiming - frame 7
; Bh: Moving right - gun extended - frame 7
; Ch: Moving left-   gun extended - frame 7
; Dh: Moving right - aiming up (unused) - frame 7
; Eh: Moving left-   aiming up (unused) - frame 7
; Fh: Moving right - aiming up-right - frame 7
; 10h: Moving left-   aiming up-left - frame 7
; 11h: Moving right - aiming down-right - frame 7
; 12h: Moving left-   aiming down-left - frame 7
    dl SamusTiles_Bottom_Set0_Entry4 : dw $0100,$0080                    ;92D1BA;

SamusBottomTiles_Set0_D1C1:
; 9: Moving right - not aiming - frame 9
; Ah: Moving left-   not aiming - frame 9
; Bh: Moving right - gun extended - frame 9
; Ch: Moving left-   gun extended - frame 9
; Dh: Moving right - aiming up (unused) - frame 9
; Eh: Moving left-   aiming up (unused) - frame 9
; Fh: Moving right - aiming up-right - frame 9
; 10h: Moving left-   aiming up-left - frame 9
; 11h: Moving right - aiming down-right - frame 9
; 12h: Moving left-   aiming down-left - frame 9
    dl SamusTiles_Bottom_Set0_Entry5 : dw $00E0,$00C0                    ;92D1C1;

SamusBottomTiles_Set0_D1C8:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 2: Facing left-   normal - frame 0
; 2: Facing left-   normal - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; 8Ah: Facing left-   ran into a wall - frame 0
; 8Ah: Facing left-   ran into a wall - frame 5
; A4h: Facing right - landing from normal jump - frame 1
; A5h: Facing left-   landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 2
; A7h: Facing left-   landing from spin jump - frame 2
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; A9h: Facing left-   grappling - frame 0
; A9h: Facing left-   grappling - frame 5
; D5h: Facing right - x-ray - standing - frames 0..4
; D6h: Facing left-   x-ray - standing - frames 0..4
; E0h: Facing right - landing from normal jump - aiming up - frame 1
; E1h: Facing left-   landing from normal jump - aiming up - frame 1
; E2h: Facing right - landing from normal jump - aiming up-right - frame 1
; E3h: Facing left-   landing from normal jump - aiming up-left - frame 1
; E4h: Facing right - landing from normal jump - aiming down-right - frame 1
; E5h: Facing left-   landing from normal jump - aiming down-left - frame 1
; E6h: Facing right - landing from normal jump - firing - frame 1
; E7h: Facing left-   landing from normal jump - firing - frame 1
    dl SamusTiles_Bottom_Set0_Entry6 : dw $00C0,$00C0                    ;92D1C8;

SamusBottomTiles_Set0_D1CF:
; 27h: Facing right - crouching - frames 0..3
; 27h: Facing right - crouching - frames 5..8
; 28h: Facing left-   crouching - frames 0..3
; 28h: Facing left-   crouching - frames 5..8
; 71h: Facing right - crouching - aiming up-right - frame 0
; 72h: Facing left-   crouching - aiming up-left - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; 74h: Facing left-   crouching - aiming down-left - frame 0
; 85h: Facing right - crouching - aiming up - frames 0..1
; 86h: Facing left-   crouching - aiming up - frames 0..1
; B4h: Facing right - grappling - crouching - frames 0..3
; B4h: Facing right - grappling - crouching - frames 5..8
; B5h: Facing left-   grappling - crouching - frames 0..3
; B5h: Facing left-   grappling - crouching - frames 5..8
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; B7h: Facing left-   grappling - crouching - aiming down-left - frame 0
; D9h: Facing right - x-ray - crouching - frames 0..4
; DAh: Facing left-   x-ray - crouching - frames 0..4
    dl SamusTiles_Bottom_Set0_Entry7 : dw $0080,$0080                    ;92D1CF;

SamusBottomTiles_Set0_D1D6:
; 9: Moving right - not aiming - frame 1
; Ah: Moving left-   not aiming - frame 1
; Bh: Moving right - gun extended - frame 1
; Ch: Moving left-   gun extended - frame 1
; Dh: Moving right - aiming up (unused) - frame 1
; Eh: Moving left-   aiming up (unused) - frame 1
; Fh: Moving right - aiming up-right - frame 1
; 10h: Moving left-   aiming up-left - frame 1
; 11h: Moving right - aiming down-right - frame 1
; 12h: Moving left-   aiming down-left - frame 1
    dl SamusTiles_Bottom_Set0_Entry8 : dw $00C0,$0080                    ;92D1D6;

SamusBottomTiles_Set0_D1DD:
; 9: Moving right - not aiming - frame 3
; Ah: Moving left-   not aiming - frame 3
; Bh: Moving right - gun extended - frame 3
; Ch: Moving left-   gun extended - frame 3
; Dh: Moving right - aiming up (unused) - frame 3
; Eh: Moving left-   aiming up (unused) - frame 3
; Fh: Moving right - aiming up-right - frame 3
; 10h: Moving left-   aiming up-left - frame 3
; 11h: Moving right - aiming down-right - frame 3
; 12h: Moving left-   aiming down-left - frame 3
    dl SamusTiles_Bottom_Set0_Entry9 : dw $0100,$0080                    ;92D1DD;

SamusBottomTiles_Set0_D1E4:
; 9: Moving right - not aiming - frame 6
; Ah: Moving left-   not aiming - frame 6
; Bh: Moving right - gun extended - frame 6
; Ch: Moving left-   gun extended - frame 6
; Dh: Moving right - aiming up (unused) - frame 6
; Eh: Moving left-   aiming up (unused) - frame 6
; Fh: Moving right - aiming up-right - frame 6
; 10h: Moving left-   aiming up-left - frame 6
; 11h: Moving right - aiming down-right - frame 6
; 12h: Moving left-   aiming down-left - frame 6
    dl SamusTiles_Bottom_Set0_EntryA : dw $00C0,$0080                    ;92D1E4;

SamusBottomTiles_Set0_D1EB:
; 9: Moving right - not aiming - frame 8
; Ah: Moving left-   not aiming - frame 8
; Bh: Moving right - gun extended - frame 8
; Ch: Moving left-   gun extended - frame 8
; Dh: Moving right - aiming up (unused) - frame 8
; Eh: Moving left-   aiming up (unused) - frame 8
; Fh: Moving right - aiming up-right - frame 8
; 10h: Moving left-   aiming up-left - frame 8
; 11h: Moving right - aiming down-right - frame 8
; 12h: Moving left-   aiming down-left - frame 8
    dl SamusTiles_Bottom_Set0_EntryB : dw $0100,$0080                    ;92D1EB;

SamusBottomTiles_Set0_D1F2:
; 0: Facing forward - power suit - frame 0
    dl SamusTiles_Bottom_Set0_EntryC : dw $0100,$00C0                    ;92D1F2;

SamusBottomTiles_Set0_D1F9:
; 9Bh: Facing forward - varia/gravity suit - frame 0
    dl SamusTiles_Bottom_Set0_EntryD : dw $0100,$00C0                    ;92D1F9;

SamusBottomTiles_Set0_D200:
; 1: Facing right - normal - frame 1
; 1: Facing right - normal - frame 3
; 1: Facing right - normal - frame 6
; 1: Facing right - normal - frame 8
; 47h: Unused - frame 1
; 47h: Unused - frame 3
; 47h: Unused - frame 6
; 47h: Unused - frame 8
; 89h: Facing right - ran into a wall - frame 1
; 89h: Facing right - ran into a wall - frame 3
; 89h: Facing right - ran into a wall - frame 6
; 89h: Facing right - ran into a wall - frame 8
; A8h: Facing right - grappling - frame 1
; A8h: Facing right - grappling - frame 3
; A8h: Facing right - grappling - frame 6
; A8h: Facing right - grappling - frame 8
    dl SamusTiles_Bottom_Set0_EntryE : dw $00C0,$00C0                    ;92D200;

SamusBottomTiles_Set0_D207:
; 1: Facing right - normal - frame 2
; 1: Facing right - normal - frame 7
; 47h: Unused - frame 2
; 47h: Unused - frame 7
; 89h: Facing right - ran into a wall - frame 2
; 89h: Facing right - ran into a wall - frame 7
; A8h: Facing right - grappling - frame 2
; A8h: Facing right - grappling - frame 7
    dl SamusTiles_Bottom_Set0_EntryF : dw $00C0,$00C0                    ;92D207;

SamusBottomTiles_Set0_D20E:
; 2: Facing left-   normal - frame 1
; 2: Facing left-   normal - frame 3
; 2: Facing left-   normal - frame 6
; 2: Facing left-   normal - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left-   ran into a wall - frame 1
; 8Ah: Facing left-   ran into a wall - frame 3
; 8Ah: Facing left-   ran into a wall - frame 6
; 8Ah: Facing left-   ran into a wall - frame 8
; A9h: Facing left-   grappling - frame 1
; A9h: Facing left-   grappling - frame 3
; A9h: Facing left-   grappling - frame 6
; A9h: Facing left-   grappling - frame 8
    dl SamusTiles_Bottom_Set0_Entry10 : dw $00C0,$00C0                   ;92D20E;

SamusBottomTiles_Set0_D215:
; 4Fh: Facing left-   damage boost - frame 0
    dl SamusTiles_Bottom_Set0_Entry11 : dw $00A0,$0040                   ;92D215;

SamusBottomTiles_Set0_D21C:
; 50h: Facing right - damage boost - frame 0
    dl SamusTiles_Bottom_Set0_Entry12 : dw $00A0,$0040                   ;92D21C;

SamusBottomTiles_Set0_D223:
; 15h: Facing right - normal jump - aiming up - frame 1
; 69h: Facing right - normal jump - aiming up-right - frame 1
    dl SamusTiles_Bottom_Set0_Entry13 : dw $00A0,$0080                   ;92D223;

SamusBottomTiles_Set0_D22A:
; 16h: Facing left-   normal jump - aiming up - frame 1
; 6Ah: Facing left-   normal jump - aiming up-left - frame 1
    dl SamusTiles_Bottom_Set0_Entry14 : dw $00A0,$0080                   ;92D22A;

SamusBottomTiles_Set0_D231:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left-   turning - standing - frame 0
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left-   turning - standing - aiming up - frame 0
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left-   moonwalking - turn/jump right - frame 0
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 2
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 2
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 0
; C6h: Unused - frame 2
    dl SamusTiles_Bottom_Set0_Entry15 : dw $00A0,$0080                   ;92D231;

SamusBottomTiles_Set0_D238:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left-   turning - standing - frame 2
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left-   turning - standing - aiming up - frame 2
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left-   moonwalking - turn/jump right - frame 2
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 0
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 0
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 2
; C6h: Unused - frame 0
    dl SamusTiles_Bottom_Set0_Entry16 : dw $00A0,$0080                   ;92D238;

SamusBottomTiles_Set0_D23F:
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left-   turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left-   turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left-   turning - falling - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left-   turning - in air - aiming up - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left-   turning - falling - aiming up - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left-   turning - crouching - aiming up - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left-   turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left-   turning - crouching - aiming up-left - frame 0
    dl SamusTiles_Bottom_Set0_Entry17 : dw $0080,$0040                   ;92D23F;

SamusBottomTiles_Set0_D246:
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left-   turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left-   turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left-   turning - falling - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left-   turning - in air - aiming up - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left-   turning - falling - aiming up - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left-   turning - crouching - aiming up - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left-   turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left-   turning - crouching - aiming up-left - frame 2
    dl SamusTiles_Bottom_Set0_Entry18 : dw $0080,$0040                   ;92D246;

SamusBottomTiles_Set0_D24D:
; 5Ch: Unused - frame 0
; 64h: Unused. Related to movement type Dh - frame 1
; B9h: Facing right - grapple wall jump pose - frame 0
    dl SamusTiles_Bottom_Set0_Entry19 : dw $0080,$0080                   ;92D24D;

SamusBottomTiles_Set0_D254:
; 45h: Unused - frame 0
; 46h: Unused - frame 0
; 5Bh: Unused - frame 0
; 63h: Unused. Related to movement type Dh - frame 1
; B8h: Facing left-   grapple wall jump pose - frame 0
    dl SamusTiles_Bottom_Set0_Entry1A : dw $0080,$0080                   ;92D254;

SamusBottomTiles_Set0_D25B:
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
    dl SamusTiles_Bottom_Set0_Entry1B : dw $00C0,$0080                   ;92D25B;

SamusBottomTiles_Set0_D262:
; CAh: Facing left-   shinespark - horizontal - frame 0
; CEh: Facing left-   shinespark - diagonal - frame 0
    dl SamusTiles_Bottom_Set0_Entry1C : dw $00C0,$0080                   ;92D262;

SamusBottomTiles_Set0_D269:
; 2: Facing left-   normal - frame 2
; 2: Facing left-   normal - frame 7
; 48h: Unused - frame 2
; 48h: Unused - frame 7
; 8Ah: Facing left-   ran into a wall - frame 2
; 8Ah: Facing left-   ran into a wall - frame 7
; A9h: Facing left-   grappling - frame 2
; A9h: Facing left-   grappling - frame 7
    dl SamusTiles_Bottom_Set0_Entry1D : dw $00C0,$00C0                   ;92D269;

SamusBottomTiles_Set0_D270:
; 19h: Facing right - spin jump - frame Bh
; 1Bh: Facing right - space jump - frame Bh
; 20h: Unused - frame Bh
; 21h: Unused - frame Bh
; 22h: Unused - frame Bh
; 23h: Unused - frame Bh
; 24h: Unused - frame Bh
; 33h: Unused - frame Bh
; 34h: Unused - frame Bh
; 39h: Unused - frame Bh
; 3Ah: Unused - frame Bh
; 42h: Unused - frame Bh
; 81h: Facing right - screw attack - frame 1Bh
    dl SamusTiles_Bottom_Set0_Entry1E : dw $0080,$0080                   ;92D270;

SamusBottomTiles_Set0_D277:
; 1Ah: Facing left-   spin jump - frame Bh
; 1Ch: Facing left-   space jump - frame Bh
; 82h: Facing left-   screw attack - frame 1Bh
    dl SamusTiles_Bottom_Set0_Entry1F : dw $0080,$0080                   ;92D277;


;;; $D27E: Samus bottom tiles - set 1 (general) ;;;
SamusBottomTiles_Set1_D27E:
; 49h: Facing left-   moonwalk - frame 3
; 4Ah: Facing right - moonwalk - frame 3
; 75h: Facing left-   moonwalk - aiming up-left - frame 3
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; 77h: Facing left-   moonwalk - aiming down-left - frame 3
; 78h: Facing right - moonwalk - aiming down-right - frame 3
    dl SamusTiles_Bottom_Set1_Entry0 : dw $00C0,$0080                    ;92D27E;

SamusBottomTiles_Set1_D285:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left-   turning - standing - frame 1
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left-   turning - standing - aiming up - frame 1
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left-   moonwalking - turn/jump right - frame 1
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 1
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 1
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 1
; C6h: Unused - frame 1
    dl SamusTiles_Bottom_Set1_Entry1 : dw $0080,$0080                    ;92D285;

SamusBottomTiles_Set1_D28C:
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left-   turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left-   turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left-   turning - falling - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left-   turning - in air - aiming up - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left-   turning - falling - aiming up - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left-   turning - crouching - aiming up - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left-   turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left-   turning - crouching - aiming up-left - frame 1
    dl SamusTiles_Bottom_Set1_Entry2 : dw $0040,$0040                    ;92D28C;

SamusBottomTiles_Set1_D293:
; 49h: Facing left-   moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 75h: Facing left-   moonwalk - aiming up-left - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 77h: Facing left-   moonwalk - aiming down-left - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 0
    dl SamusTiles_Bottom_Set1_Entry3 : dw $00C0,$0080                    ;92D293;

SamusBottomTiles_Set1_D29A:
; 49h: Facing left-   moonwalk - frame 1
; 4Ah: Facing right - moonwalk - frame 1
; 75h: Facing left-   moonwalk - aiming up-left - frame 1
; 76h: Facing right - moonwalk - aiming up-right - frame 1
; 77h: Facing left-   moonwalk - aiming down-left - frame 1
; 78h: Facing right - moonwalk - aiming down-right - frame 1
    dl SamusTiles_Bottom_Set1_Entry4 : dw $0080,$0080                    ;92D29A;

SamusBottomTiles_Set1_D2A1:
; 49h: Facing left-   moonwalk - frame 4
; 4Ah: Facing right - moonwalk - frame 4
; 75h: Facing left-   moonwalk - aiming up-left - frame 4
; 76h: Facing right - moonwalk - aiming up-right - frame 4
; 77h: Facing left-   moonwalk - aiming down-left - frame 4
; 78h: Facing right - moonwalk - aiming down-right - frame 4
    dl SamusTiles_Bottom_Set1_Entry5 : dw $0080,$0080                    ;92D2A1;

SamusBottomTiles_Set1_D2A8:
; 35h: Facing right - crouching transition - frame 0
; 3Bh: Facing right - standing transition - frame 0
; 4Bh: Facing right - normal jump transition - frame 0
; 55h: Facing right - normal jump transition - aiming up - frame 0
; 57h: Facing right - normal jump transition - aiming up-right - frame 0
; 59h: Facing right - normal jump transition - aiming down-right - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
; D3h: Facing right - crystal flash - frame Eh
; D7h: Facing right - crystal flash ending - frames 0..3
; D8h: Facing left-   crystal flash ending - frames 0..2
; DBh: Unused - frame 0
; DCh: Unused - frame 0
; DDh: Unused - frame 2
; DEh: Unused - frame 2
; E0h: Facing right - landing from normal jump - aiming up - frame 0
; E2h: Facing right - landing from normal jump - aiming up-right - frame 0
; E4h: Facing right - landing from normal jump - aiming down-right - frame 0
; E6h: Facing right - landing from normal jump - firing - frame 0
; E8h: Facing right - Samus drained - crouching/falling - frames 0..2
; E8h: Facing right - Samus drained - crouching/falling - frame Eh
; E9h: Facing left-   Samus drained - crouching/falling - frames 0..1
; EAh: Facing right - Samus drained - standing - frame 5
; F1h: Facing right - crouching transition - aiming up - frame 0
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
    dl SamusTiles_Bottom_Set1_Entry6 : dw $00C0,$0080                    ;92D2A8;

SamusBottomTiles_Set1_D2AF:
; 36h: Facing left-   crouching transition - frame 0
; 3Ch: Facing left-   standing transition - frame 0
; 4Ch: Facing left-   normal jump transition - frame 0
; 56h: Facing left-   normal jump transition - aiming up - frame 0
; 58h: Facing left-   normal jump transition - aiming up-left - frame 0
; 5Ah: Facing left-   normal jump transition - aiming down-left - frame 0
; A5h: Facing left-   landing from normal jump - frame 0
; A7h: Facing left-   landing from spin jump - frame 1
; D4h: Facing left-   crystal flash - frame Eh
; D8h: Facing left-   crystal flash ending - frame 3
; E1h: Facing left-   landing from normal jump - aiming up - frame 0
; E3h: Facing left-   landing from normal jump - aiming up-left - frame 0
; E5h: Facing left-   landing from normal jump - aiming down-left - frame 0
; E7h: Facing left-   landing from normal jump - firing - frame 0
; E9h: Facing left-   Samus drained - crouching/falling - frame 7
; E9h: Facing left-   Samus drained - crouching/falling - frame Fh
; E9h: Facing left-   Samus drained - crouching/falling - frame 14h
; E9h: Facing left-   Samus drained - crouching/falling - frame 16h
; EBh: Facing left-   Samus drained - standing - frame 5
; F2h: Facing left-   crouching transition - aiming up - frame 0
; F4h: Facing left-   crouching transition - aiming up-left - frame 0
; F6h: Facing left-   crouching transition - aiming down-left - frame 0
; F8h: Facing left-   standing transition - aiming up - frame 0
; FAh: Facing left-   standing transition - aiming up-left - frame 0
; FCh: Facing left-   standing transition - aiming down-left - frame 0
    dl SamusTiles_Bottom_Set1_Entry7 : dw $00C0,$0080                    ;92D2AF;

SamusBottomTiles_Set1_D2B6:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frames 2..3
; C7h: Facing right - vertical shinespark windup - frames 2..3
; F0h: Facing right - grabbed by Draygon - moving - frame 5
    dl SamusTiles_Bottom_Set1_Entry8 : dw $00E0,$0040                    ;92D2B6;

SamusBottomTiles_Set1_D2BD:
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frames 2..3
; BEh: Facing left-   grabbed by Draygon - moving - frame 5
; C8h: Facing left-   vertical shinespark windup - frames 2..3
    dl SamusTiles_Bottom_Set1_Entry9 : dw $00E0,$0040                    ;92D2BD;

SamusBottomTiles_Set1_D2C4:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frame 0
; 15h: Facing right - normal jump - aiming up - frame 0
; 17h: Facing right - normal jump - aiming down - frame 0
; 29h: Facing right - falling - frame 0
; 29h: Facing right - falling - frame 5
; 2Bh: Facing right - falling - aiming up - frame 0
; 2Dh: Facing right - falling - aiming down - frame 0
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 4
; 50h: Facing right - damage boost - frame 1
; 51h: Facing right - normal jump - not aiming - moving forward - frame 0
; 67h: Facing right - falling - gun extended - frame 0
; 67h: Facing right - falling - gun extended - frame 5
; 69h: Facing right - normal jump - aiming up-right - frame 0
; 6Bh: Facing right - normal jump - aiming down-right - frame 0
; 6Dh: Facing right - falling - aiming up-right - frame 0
; 6Fh: Facing right - falling - aiming down-right - frame 0
; ACh: Unused. Facing right - grappling - in air - frame 0
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 0
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frame 0
; C7h: Facing right - vertical shinespark windup - frame 4
    dl SamusTiles_Bottom_Set1_EntryA : dw $00A0,$0080                    ;92D2C4;

SamusBottomTiles_Set1_D2CB:
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended - frame 0
; 16h: Facing left-   normal jump - aiming up - frame 0
; 18h: Facing left-   normal jump - aiming down - frame 0
; 2Ah: Facing left-   falling - frame 0
; 2Ah: Facing left-   falling - frame 5
; 2Ch: Facing left-   falling - aiming up - frame 0
; 2Eh: Facing left-   falling - aiming down - frame 0
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 4
; 4Fh: Facing left-   damage boost - frame 1
; 52h: Facing left-   normal jump - not aiming - moving forward - frame 0
; 68h: Facing left-   falling - gun extended - frame 0
; 68h: Facing left-   falling - gun extended - frame 5
; 6Ah: Facing left-   normal jump - aiming up-left - frame 0
; 6Ch: Facing left-   normal jump - aiming down-left - frame 0
; 6Eh: Facing left-   falling - aiming up-left - frame 0
; 70h: Facing left-   falling - aiming down-left - frame 0
; ADh: Unused. Facing left-   grappling - in air - frame 0
; AFh: Unused. Facing left-   grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left-   grappling - in air - aiming down-left - frame 0
; C8h: Facing left-   vertical shinespark windup - frame 4
    dl SamusTiles_Bottom_Set1_EntryB : dw $00A0,$0080                    ;92D2CB;

SamusBottomTiles_Set1_D2D2:
; 29h: Facing right - falling - frames 1..2
; 2Bh: Facing right - falling - aiming up - frame 1
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; 53h: Facing right - knockback - frame 0
; 67h: Facing right - falling - gun extended - frames 1..2
; 6Dh: Facing right - falling - aiming up-right - frame 1
; 6Fh: Facing right - falling - aiming down-right - frame 1
; C7h: Facing right - vertical shinespark windup - frame 5
; D7h: Facing right - crystal flash ending - frame 4
; E8h: Facing right - Samus drained - crouching/falling - frames 3..7
; F0h: Facing right - grabbed by Draygon - moving - frame 0
; F0h: Facing right - grabbed by Draygon - moving - frame 3
    dl SamusTiles_Bottom_Set1_EntryC : dw $0080,$0080                    ;92D2D2;

SamusBottomTiles_Set1_D2D9:
; 2Ah: Facing left-   falling - frames 1..2
; 2Ch: Facing left-   falling - aiming up - frame 1
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 5
; 54h: Facing left-   knockback - frame 0
; 68h: Facing left-   falling - gun extended - frames 1..2
; 6Eh: Facing left-   falling - aiming up-left - frame 1
; 70h: Facing left-   falling - aiming down-left - frame 1
; BEh: Facing left-   grabbed by Draygon - moving - frame 0
; BEh: Facing left-   grabbed by Draygon - moving - frame 3
; C8h: Facing left-   vertical shinespark windup - frame 5
; D8h: Facing left-   crystal flash ending - frame 4
; E9h: Facing left-   Samus drained - crouching/falling - frames 2..6
    dl SamusTiles_Bottom_Set1_EntryD : dw $0080,$0080                    ;92D2D9;

SamusBottomTiles_Set1_D2E0:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
    dl SamusTiles_Bottom_Set1_EntryE : dw $00C0,$0040                    ;92D2E0;

SamusBottomTiles_Set1_D2E7:
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left-   grabbed by Draygon - moving - frame 4
; C8h: Facing left-   vertical shinespark windup - frame 1
    dl SamusTiles_Bottom_Set1_EntryF : dw $00C0,$0040                    ;92D2E7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set1_92D2EE:
    dl SamusTiles_Bottom_Set1_Entry10 : dw $0020,$0000                   ;92D2EE;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set1_D2F5:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
    dl SamusTiles_Bottom_Set1_Entry11 : dw $00E0,$0040                   ;92D2F5;

SamusBottomTiles_Set1_D2FC:
; 18h: Facing left-   normal jump - aiming down - frame 1
; 2Eh: Facing left-   falling - aiming down - frame 1
; AFh: Unused. Facing left-   grappling - in air - aiming down - frame 1
    dl SamusTiles_Bottom_Set1_Entry12 : dw $00E0,$0040                   ;92D2FC;

SamusBottomTiles_Set1_D303:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
    dl SamusTiles_Bottom_Set1_Entry13 : dw $0100,$0040                   ;92D303;

SamusBottomTiles_Set1_D30A:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left-   wall jump - frame 0
    dl SamusTiles_Bottom_Set1_Entry14 : dw $00C0,$0040                   ;92D30A;

SamusBottomTiles_Set1_D311:
; 49h: Facing left-   moonwalk - frame 2
; 63h: Unused. Related to movement type Dh - frame 0
    dl SamusTiles_Bottom_Set1_Entry15 : dw $00A0,$0080                   ;92D311;

SamusBottomTiles_Set1_D318:
; 49h: Facing left-   moonwalk - frame 5
; 64h: Unused. Related to movement type Dh - frame 0
    dl SamusTiles_Bottom_Set1_Entry16 : dw $00A0,$0080                   ;92D318;

SamusBottomTiles_Set1_D31F:
; 4Ah: Facing right - moonwalk - frame 2
; 75h: Facing left-   moonwalk - aiming up-left - frame 2
; 76h: Facing right - moonwalk - aiming up-right - frame 2
; 77h: Facing left-   moonwalk - aiming down-left - frame 2
; 78h: Facing right - moonwalk - aiming down-right - frame 2
    dl SamusTiles_Bottom_Set1_Entry17 : dw $00A0,$0080                   ;92D31F;

SamusBottomTiles_Set1_D326:
; 4Ah: Facing right - moonwalk - frame 5
; 75h: Facing left-   moonwalk - aiming up-left - frame 5
; 76h: Facing right - moonwalk - aiming up-right - frame 5
; 77h: Facing left-   moonwalk - aiming down-left - frame 5
; 78h: Facing right - moonwalk - aiming down-right - frame 5
    dl SamusTiles_Bottom_Set1_Entry18 : dw $00A0,$0080                   ;92D326;

SamusBottomTiles_Set1_D32D:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frame 1
; 19h: Facing right - spin jump - frame 0
; 1Bh: Facing right - space jump - frame 0
; 20h: Unused - frame 0
; 21h: Unused - frame 0
; 22h: Unused - frame 0
; 23h: Unused - frame 0
; 24h: Unused - frame 0
; 29h: Facing right - falling - frame 6
; 2Bh: Facing right - falling - aiming up - frame 2
; 33h: Unused - frame 0
; 34h: Unused - frame 0
; 39h: Unused - frame 0
; 3Ah: Unused - frame 0
; 42h: Unused - frame 0
; 50h: Facing right - damage boost - frame 9
; 51h: Facing right - normal jump - not aiming - moving forward - frame 1
; 67h: Facing right - falling - gun extended - frame 6
; 6Bh: Facing right - normal jump - aiming down-right - frame 1
; 6Dh: Facing right - falling - aiming up-right - frame 2
; 6Fh: Facing right - falling - aiming down-right - frame 2
; 81h: Facing right - screw attack - frame 0
; 83h: Facing right - wall jump - frame 1
; A6h: Facing right - landing from spin jump - frame 0
; ACh: Unused. Facing right - grappling - in air - frame 1
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 2
    dl SamusTiles_Bottom_Set1_Entry19 : dw $00E0,$0080                   ;92D32D;

SamusBottomTiles_Set1_D334:
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended - frame 1
; 1Ah: Facing left-   spin jump - frame 0
; 1Ch: Facing left-   space jump - frame 0
; 2Ah: Facing left-   falling - frame 6
; 2Ch: Facing left-   falling - aiming up - frame 2
; 4Fh: Facing left-   damage boost - frame 9
; 52h: Facing left-   normal jump - not aiming - moving forward - frame 1
; 68h: Facing left-   falling - gun extended - frame 6
; 6Ch: Facing left-   normal jump - aiming down-left - frame 1
; 6Eh: Facing left-   falling - aiming up-left - frame 2
; 70h: Facing left-   falling - aiming down-left - frame 2
; 82h: Facing left-   screw attack - frame 0
; 84h: Facing left-   wall jump - frame 1
; A7h: Facing left-   landing from spin jump - frame 0
; ADh: Unused. Facing left-   grappling - in air - frame 1
; B1h: Unused. Facing left-   grappling - in air - aiming down-left - frame 1
; BEh: Facing left-   grabbed by Draygon - moving - frame 2
; E9h: Facing left-   Samus drained - crouching/falling - frame Eh
; E9h: Facing left-   Samus drained - crouching/falling - frame 13h
; E9h: Facing left-   Samus drained - crouching/falling - frame 17h
    dl SamusTiles_Bottom_Set1_Entry1A : dw $00E0,$0080                   ;92D334;

SamusBottomTiles_Set1_D33B:
; 53h: Facing right - knockback - frame 1
; D7h: Facing right - crystal flash ending - frame 5
; ECh: Facing right - grabbed by Draygon - not moving - not aiming - frame 0
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right - frame 0
; EEh: Facing right - grabbed by Draygon - firing - frame 0
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right - frame 0
; F0h: Facing right - grabbed by Draygon - moving - frame 1
    dl SamusTiles_Bottom_Set1_Entry1B : dw $00C0,$0080                   ;92D33B;

SamusBottomTiles_Set1_D342:
; 54h: Facing left-   knockback - frame 1
; BAh: Facing left-   grabbed by Draygon - not moving - not aiming - frame 0
; BBh: Facing left-   grabbed by Draygon - not moving - aiming up-left - frame 0
; BCh: Facing left-   grabbed by Draygon - firing - frame 0
; BDh: Facing left-   grabbed by Draygon - not moving - aiming down-left - frame 0
; BEh: Facing left-   grabbed by Draygon - moving - frame 1
; D8h: Facing left-   crystal flash ending - frame 5
    dl SamusTiles_Bottom_Set1_Entry1C : dw $00C0,$0080                   ;92D342;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set1_92D349:
    dl SamusTiles_Bottom_Set1_Entry1D : dw $0080,$0080                   ;92D349;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set1_D350:
; E9h: Facing left-   Samus drained - crouching/falling - frames 8..Bh
; E9h: Facing left-   Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left-   Samus drained - crouching/falling - frame 1Dh
; EBh: Facing left-   Samus drained - standing - frames 0..3
    dl SamusTiles_Bottom_Set1_Entry1E : dw $0060,$0040                   ;92D350;

SamusBottomTiles_Set1_D357:
; E8h: Facing right - Samus drained - crouching/falling - frames 8..Bh
; EAh: Facing right - Samus drained - standing - frames 0..3
    dl SamusTiles_Bottom_Set1_Entry1F : dw $0060,$0040                   ;92D357;


;;; $D35E: Samus bottom tiles - set 2 (facing clockwise - grappling - in air - upside up) ;;;
SamusBottomTiles_Set2_D35E:
; 5Dh: Unused - frames 17h..19h
; 5Eh: Unused - frames 17h..19h
; 5Fh: Unused - frames 17h..19h
; 60h: Unused - frames 17h..19h
; 61h: Unused - frames 17h..19h
; B2h: Facing clockwise   -   grapple - in air - frames 17h..19h
    dl SamusTiles_Bottom_Set2_Entry0 : dw $0080,$0040                    ;92D35E;

SamusBottomTiles_Set2_D365:
; 5Dh: Unused - frames 15h..16h
; 5Eh: Unused - frames 15h..16h
; 5Fh: Unused - frames 15h..16h
; 60h: Unused - frames 15h..16h
; 61h: Unused - frames 15h..16h
; B2h: Facing clockwise   -   grapple - in air - frames 15h..16h
    dl SamusTiles_Bottom_Set2_Entry1 : dw $00E0,$0040                    ;92D365;

SamusBottomTiles_Set2_D36C:
; 5Dh: Unused - frames 13h..14h
; 5Eh: Unused - frames 13h..14h
; 5Fh: Unused - frames 13h..14h
; 60h: Unused - frames 13h..14h
; 61h: Unused - frames 13h..14h
; B2h: Facing clockwise   -   grapple - in air - frames 13h..14h
    dl SamusTiles_Bottom_Set2_Entry2 : dw $00A0,$0080                    ;92D36C;

SamusBottomTiles_Set2_D373:
; 5Dh: Unused - frame 12h
; 5Eh: Unused - frame 12h
; 5Fh: Unused - frame 12h
; 60h: Unused - frame 12h
; 61h: Unused - frame 12h
; B2h: Facing clockwise   -   grapple - in air - frame 12h
    dl SamusTiles_Bottom_Set2_Entry3 : dw $00A0,$0040                    ;92D373;

SamusBottomTiles_Set2_D37A:
; 5Dh: Unused - frame 11h
; 5Eh: Unused - frame 11h
; 5Fh: Unused - frame 11h
; 60h: Unused - frame 11h
; 61h: Unused - frame 11h
; B2h: Facing clockwise   -   grapple - in air - frame 11h
    dl SamusTiles_Bottom_Set2_Entry4 : dw $00C0,$0040                    ;92D37A;

SamusBottomTiles_Set2_D381:
; 5Dh: Unused - frame 10h
; 5Eh: Unused - frame 10h
; 5Fh: Unused - frame 10h
; 60h: Unused - frame 10h
; 61h: Unused - frame 10h
; B2h: Facing clockwise   -   grapple - in air - frame 10h
    dl SamusTiles_Bottom_Set2_Entry5 : dw $00C0,$0040                    ;92D381;

SamusBottomTiles_Set2_D388:
; 5Dh: Unused - frame Fh
; 5Eh: Unused - frame Fh
; 5Fh: Unused - frame Fh
; 60h: Unused - frame Fh
; 61h: Unused - frame Fh
; B2h: Facing clockwise   -   grapple - in air - frame Fh
    dl SamusTiles_Bottom_Set2_Entry6 : dw $0080,$0040                    ;92D388;

SamusBottomTiles_Set2_D38F:
; 5Dh: Unused - frame Eh
; 5Eh: Unused - frame Eh
; 5Fh: Unused - frame Eh
; 60h: Unused - frame Eh
; 61h: Unused - frame Eh
; B2h: Facing clockwise   -   grapple - in air - frame Eh
    dl SamusTiles_Bottom_Set2_Entry7 : dw $00A0,$0040                    ;92D38F;

SamusBottomTiles_Set2_D396:
; 5Dh: Unused - frames Ch..Dh
; 5Eh: Unused - frames Ch..Dh
; 5Fh: Unused - frames Ch..Dh
; 60h: Unused - frames Ch..Dh
; 61h: Unused - frames Ch..Dh
; B2h: Facing clockwise   -   grapple - in air - frames Ch..Dh
    dl SamusTiles_Bottom_Set2_Entry8 : dw $00A0,$0040                    ;92D396;

SamusBottomTiles_Set2_D39D:
; 5Dh: Unused - frames Ah..Bh
; 5Eh: Unused - frames Ah..Bh
; 5Fh: Unused - frames Ah..Bh
; 60h: Unused - frames Ah..Bh
; 61h: Unused - frames Ah..Bh
; B2h: Facing clockwise   -   grapple - in air - frames Ah..Bh
    dl SamusTiles_Bottom_Set2_Entry9 : dw $00C0,$0040                    ;92D39D;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set2_92D3A4:
    dl SamusTiles_Bottom_Set2_EntryA : dw $00A0,$0080                    ;92D3A4;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set2_D3AB:
; 5Dh: Unused - frame 40h
; 5Eh: Unused - frame 40h
; 5Fh: Unused - frame 40h
; 60h: Unused - frame 40h
; 61h: Unused - frame 40h
; B2h: Facing clockwise   -   grapple - in air - frame 40h
    dl SamusTiles_Bottom_Set2_EntryB : dw $0080,$0080                    ;92D3AB;

SamusBottomTiles_Set2_D3B2:
; 5Dh: Unused - frame 41h
; 5Eh: Unused - frame 41h
; 5Fh: Unused - frame 41h
; 60h: Unused - frame 41h
; 61h: Unused - frame 41h
; B2h: Facing clockwise   -   grapple - in air - frame 41h
    dl SamusTiles_Bottom_Set2_EntryC : dw $0080,$0080                    ;92D3B2;

SamusBottomTiles_Set2_D3B9:
; 5Dh: Unused - frames 37h..39h
; 5Eh: Unused - frames 37h..39h
; 5Fh: Unused - frames 37h..39h
; 60h: Unused - frames 37h..39h
; 61h: Unused - frames 37h..39h
; B2h: Facing clockwise   -   grapple - in air - frames 37h..39h
    dl SamusTiles_Bottom_Set2_EntryD : dw $0080,$0080                    ;92D3B9;

SamusBottomTiles_Set2_D3C0:
; 5Dh: Unused - frames 35h..36h
; 5Eh: Unused - frames 35h..36h
; 5Fh: Unused - frames 35h..36h
; 60h: Unused - frames 35h..36h
; 61h: Unused - frames 35h..36h
; B2h: Facing clockwise   -   grapple - in air - frames 35h..36h
    dl SamusTiles_Bottom_Set2_EntryE : dw $00A0,$0040                    ;92D3C0;

SamusBottomTiles_Set2_D3C7:
; 5Dh: Unused - frames 33h..34h
; 5Eh: Unused - frames 33h..34h
; 5Fh: Unused - frames 33h..34h
; 60h: Unused - frames 33h..34h
; 61h: Unused - frames 33h..34h
; B2h: Facing clockwise   -   grapple - in air - frames 33h..34h
    dl SamusTiles_Bottom_Set2_EntryF : dw $0080,$0080                    ;92D3C7;

SamusBottomTiles_Set2_D3CE:
; 5Dh: Unused - frame 32h
; 5Eh: Unused - frame 32h
; 5Fh: Unused - frame 32h
; 60h: Unused - frame 32h
; 61h: Unused - frame 32h
; B2h: Facing clockwise   -   grapple - in air - frame 32h
    dl SamusTiles_Bottom_Set2_Entry10 : dw $0080,$0080                   ;92D3CE;

SamusBottomTiles_Set2_D3D5:
; 5Dh: Unused - frame 31h
; 5Eh: Unused - frame 31h
; 5Fh: Unused - frame 31h
; 60h: Unused - frame 31h
; 61h: Unused - frame 31h
; B2h: Facing clockwise   -   grapple - in air - frame 31h
    dl SamusTiles_Bottom_Set2_Entry11 : dw $00A0,$0040                   ;92D3D5;

SamusBottomTiles_Set2_D3DC:
; 5Dh: Unused - frame 30h
; 5Eh: Unused - frame 30h
; 5Fh: Unused - frame 30h
; 60h: Unused - frame 30h
; 61h: Unused - frame 30h
; B2h: Facing clockwise   -   grapple - in air - frame 30h
    dl SamusTiles_Bottom_Set2_Entry12 : dw $0080,$0080                   ;92D3DC;

SamusBottomTiles_Set2_D3E3:
; 5Dh: Unused - frame 2Fh
; 5Eh: Unused - frame 2Fh
; 5Fh: Unused - frame 2Fh
; 60h: Unused - frame 2Fh
; 61h: Unused - frame 2Fh
; B2h: Facing clockwise   -   grapple - in air - frame 2Fh
    dl SamusTiles_Bottom_Set2_Entry13 : dw $0080,$0080                   ;92D3E3;

SamusBottomTiles_Set2_D3EA:
; 5Dh: Unused - frame 2Eh
; 5Eh: Unused - frame 2Eh
; 5Fh: Unused - frame 2Eh
; 60h: Unused - frame 2Eh
; 61h: Unused - frame 2Eh
; B2h: Facing clockwise   -   grapple - in air - frame 2Eh
    dl SamusTiles_Bottom_Set2_Entry14 : dw $0080,$0080                   ;92D3EA;

SamusBottomTiles_Set2_D3F1:
; 5Dh: Unused - frames 2Ch..2Dh
; 5Eh: Unused - frames 2Ch..2Dh
; 5Fh: Unused - frames 2Ch..2Dh
; 60h: Unused - frames 2Ch..2Dh
; 61h: Unused - frames 2Ch..2Dh
; B2h: Facing clockwise   -   grapple - in air - frames 2Ch..2Dh
    dl SamusTiles_Bottom_Set2_Entry15 : dw $00C0,$0080                   ;92D3F1;

SamusBottomTiles_Set2_D3F8:
; 5Dh: Unused - frames 2Ah..2Bh
; 5Eh: Unused - frames 2Ah..2Bh
; 5Fh: Unused - frames 2Ah..2Bh
; 60h: Unused - frames 2Ah..2Bh
; 61h: Unused - frames 2Ah..2Bh
; B2h: Facing clockwise   -   grapple - in air - frames 2Ah..2Bh
    dl SamusTiles_Bottom_Set2_Entry16 : dw $0080,$0080                   ;92D3F8;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set2_92D3FF:
    dl SamusTiles_Bottom_Set2_Entry17 : dw $0080,$0080                   ;92D3FF;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D406: Samus bottom tiles - set 4 (facing clockwise - grappling - in air - upside down) ;;;
SamusBottomTiles_Set4_D406:
; 5Dh: Unused - frames 7..9
; 5Eh: Unused - frames 7..9
; 5Fh: Unused - frames 7..9
; 60h: Unused - frames 7..9
; 61h: Unused - frames 7..9
; B2h: Facing clockwise   -   grapple - in air - frames 7..9
    dl SamusTiles_Bottom_Set4_Entry0 : dw $0080,$0040                    ;92D406;

SamusBottomTiles_Set4_D40D:
; 5Dh: Unused - frames 5..6
; 5Eh: Unused - frames 5..6
; 5Fh: Unused - frames 5..6
; 60h: Unused - frames 5..6
; 61h: Unused - frames 5..6
; B2h: Facing clockwise   -   grapple - in air - frames 5..6
    dl SamusTiles_Bottom_Set4_Entry1 : dw $00E0,$0040                    ;92D40D;

SamusBottomTiles_Set4_D414:
; 5Dh: Unused - frames 3..4
; 5Eh: Unused - frames 3..4
; 5Fh: Unused - frames 3..4
; 60h: Unused - frames 3..4
; 61h: Unused - frames 3..4
; B2h: Facing clockwise   -   grapple - in air - frames 3..4
    dl SamusTiles_Bottom_Set4_Entry2 : dw $00A0,$0080                    ;92D414;

SamusBottomTiles_Set4_D41B:
; 5Dh: Unused - frame 2
; 5Eh: Unused - frame 2
; 5Fh: Unused - frame 2
; 60h: Unused - frame 2
; 61h: Unused - frame 2
; B2h: Facing clockwise   -   grapple - in air - frame 2
    dl SamusTiles_Bottom_Set4_Entry3 : dw $00A0,$0040                    ;92D41B;

SamusBottomTiles_Set4_D422:
; 5Dh: Unused - frame 1
; 5Eh: Unused - frame 1
; 5Fh: Unused - frame 1
; 60h: Unused - frame 1
; 61h: Unused - frame 1
; B2h: Facing clockwise   -   grapple - in air - frame 1
    dl SamusTiles_Bottom_Set4_Entry4 : dw $00C0,$0040                    ;92D422;

SamusBottomTiles_Set4_D429:
; 5Dh: Unused - frame 0
; 5Eh: Unused - frame 0
; 5Fh: Unused - frame 0
; 60h: Unused - frame 0
; 61h: Unused - frame 0
; B2h: Facing clockwise   -   grapple - in air - frame 0
    dl SamusTiles_Bottom_Set4_Entry5 : dw $00C0,$0040                    ;92D429;

SamusBottomTiles_Set4_D430:
; 5Dh: Unused - frame 1Fh
; 5Eh: Unused - frame 1Fh
; 5Fh: Unused - frame 1Fh
; 60h: Unused - frame 1Fh
; 61h: Unused - frame 1Fh
; B2h: Facing clockwise   -   grapple - in air - frame 1Fh
    dl SamusTiles_Bottom_Set4_Entry6 : dw $0080,$0040                    ;92D430;

SamusBottomTiles_Set4_D437:
; 5Dh: Unused - frame 1Eh
; 5Eh: Unused - frame 1Eh
; 5Fh: Unused - frame 1Eh
; 60h: Unused - frame 1Eh
; 61h: Unused - frame 1Eh
; B2h: Facing clockwise   -   grapple - in air - frame 1Eh
    dl SamusTiles_Bottom_Set4_Entry7 : dw $00A0,$0040                    ;92D437;

SamusBottomTiles_Set4_D43E:
; 5Dh: Unused - frames 1Ch..1Dh
; 5Eh: Unused - frames 1Ch..1Dh
; 5Fh: Unused - frames 1Ch..1Dh
; 60h: Unused - frames 1Ch..1Dh
; 61h: Unused - frames 1Ch..1Dh
; B2h: Facing clockwise   -   grapple - in air - frames 1Ch..1Dh
    dl SamusTiles_Bottom_Set4_Entry8 : dw $00A0,$0040                    ;92D43E;

SamusBottomTiles_Set4_D445:
; 5Dh: Unused - frames 1Ah..1Bh
; 5Eh: Unused - frames 1Ah..1Bh
; 5Fh: Unused - frames 1Ah..1Bh
; 60h: Unused - frames 1Ah..1Bh
; 61h: Unused - frames 1Ah..1Bh
; B2h: Facing clockwise   -   grapple - in air - frames 1Ah..1Bh
    dl SamusTiles_Bottom_Set4_Entry9 : dw $00C0,$0040                    ;92D445;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set4_92D44C:
    dl SamusTiles_Bottom_Set4_EntryA : dw $00A0,$0080                    ;92D44C;

UNUSED_SamusBottomTiles_Set4_92D453:
    dl SamusTiles_Bottom_Set4_EntryB : dw $0080,$0080                    ;92D453;

UNUSED_SamusBottomTiles_Set4_92D45A:
    dl SamusTiles_Bottom_Set4_EntryC : dw $0080,$0080                    ;92D45A;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set4_D461:
; 5Dh: Unused - frames 27h..29h
; 5Eh: Unused - frames 27h..29h
; 5Fh: Unused - frames 27h..29h
; 60h: Unused - frames 27h..29h
; 61h: Unused - frames 27h..29h
; B2h: Facing clockwise   -   grapple - in air - frames 27h..29h
    dl SamusTiles_Bottom_Set4_EntryD : dw $0080,$0080                    ;92D461;

SamusBottomTiles_Set4_D468:
; 5Dh: Unused - frames 25h..26h
; 5Eh: Unused - frames 25h..26h
; 5Fh: Unused - frames 25h..26h
; 60h: Unused - frames 25h..26h
; 61h: Unused - frames 25h..26h
; B2h: Facing clockwise   -   grapple - in air - frames 25h..26h
    dl SamusTiles_Bottom_Set4_EntryE : dw $00A0,$0040                    ;92D468;

SamusBottomTiles_Set4_D46F:
; 5Dh: Unused - frames 23h..24h
; 5Eh: Unused - frames 23h..24h
; 5Fh: Unused - frames 23h..24h
; 60h: Unused - frames 23h..24h
; 61h: Unused - frames 23h..24h
; B2h: Facing clockwise   -   grapple - in air - frames 23h..24h
    dl SamusTiles_Bottom_Set4_EntryF : dw $0080,$0080                    ;92D46F;

SamusBottomTiles_Set4_D476:
; 5Dh: Unused - frame 22h
; 5Eh: Unused - frame 22h
; 5Fh: Unused - frame 22h
; 60h: Unused - frame 22h
; 61h: Unused - frame 22h
; B2h: Facing clockwise   -   grapple - in air - frame 22h
    dl SamusTiles_Bottom_Set4_Entry10 : dw $0080,$0080                   ;92D476;

SamusBottomTiles_Set4_D47D:
; 5Dh: Unused - frame 21h
; 5Eh: Unused - frame 21h
; 5Fh: Unused - frame 21h
; 60h: Unused - frame 21h
; 61h: Unused - frame 21h
; B2h: Facing clockwise   -   grapple - in air - frame 21h
    dl SamusTiles_Bottom_Set4_Entry11 : dw $00A0,$0040                   ;92D47D;

SamusBottomTiles_Set4_D484:
; 5Dh: Unused - frame 20h
; 5Dh: Unused - frame 3Fh
; 5Eh: Unused - frame 20h
; 5Eh: Unused - frame 3Fh
; 5Fh: Unused - frame 20h
; 5Fh: Unused - frame 3Fh
; 60h: Unused - frame 20h
; 60h: Unused - frame 3Fh
; 61h: Unused - frame 20h
; 61h: Unused - frame 3Fh
; B2h: Facing clockwise   -   grapple - in air - frame 20h
; B2h: Facing clockwise   -   grapple - in air - frame 3Fh
    dl SamusTiles_Bottom_Set4_Entry12 : dw $0080,$0080                   ;92D484;

SamusBottomTiles_Set4_D48B:
; 5Dh: Unused - frame 3Eh
; 5Eh: Unused - frame 3Eh
; 5Fh: Unused - frame 3Eh
; 60h: Unused - frame 3Eh
; 61h: Unused - frame 3Eh
; B2h: Facing clockwise   -   grapple - in air - frame 3Eh
    dl SamusTiles_Bottom_Set4_Entry13 : dw $0080,$0080                   ;92D48B;

SamusBottomTiles_Set4_D492:
; 5Dh: Unused - frames 3Ch..3Dh
; 5Eh: Unused - frames 3Ch..3Dh
; 5Fh: Unused - frames 3Ch..3Dh
; 60h: Unused - frames 3Ch..3Dh
; 61h: Unused - frames 3Ch..3Dh
; B2h: Facing clockwise   -   grapple - in air - frames 3Ch..3Dh
    dl SamusTiles_Bottom_Set4_Entry14 : dw $0080,$0080                   ;92D492;

SamusBottomTiles_Set4_D499:
; 5Dh: Unused - frames 3Ah..3Bh
; 5Eh: Unused - frames 3Ah..3Bh
; 5Fh: Unused - frames 3Ah..3Bh
; 60h: Unused - frames 3Ah..3Bh
; 61h: Unused - frames 3Ah..3Bh
; B2h: Facing clockwise   -   grapple - in air - frames 3Ah..3Bh
    dl SamusTiles_Bottom_Set4_Entry15 : dw $0080,$0080                   ;92D499;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set4_92D4A0:
    dl SamusTiles_Bottom_Set4_Entry16 : dw $0080,$0080                   ;92D4A0;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D4A7: Samus bottom tiles - set 5 (facing anticlockwise - grappling - in air - upside up) ;;;
SamusBottomTiles_Set5_D4A7:
; 62h: Unused - frames 7..9
; B3h: Facing anticlockwise - grapple - in air - frames 7..9
    dl SamusTiles_Bottom_Set5_Entry0 : dw $0080,$0040                    ;92D4A7;

SamusBottomTiles_Set5_D4AE:
; 62h: Unused - frames Ah..Bh
; B3h: Facing anticlockwise - grapple - in air - frames Ah..Bh
    dl SamusTiles_Bottom_Set5_Entry1 : dw $00E0,$0040                    ;92D4AE;

SamusBottomTiles_Set5_D4B5:
; 62h: Unused - frames Ch..Dh
; B3h: Facing anticlockwise - grapple - in air - frames Ch..Dh
    dl SamusTiles_Bottom_Set5_Entry2 : dw $00A0,$0080                    ;92D4B5;

SamusBottomTiles_Set5_D4BC:
; 62h: Unused - frame Eh
; B3h: Facing anticlockwise - grapple - in air - frame Eh
    dl SamusTiles_Bottom_Set5_Entry3 : dw $00A0,$0040                    ;92D4BC;

SamusBottomTiles_Set5_D4C3:
; 62h: Unused - frame Fh
; B3h: Facing anticlockwise - grapple - in air - frame Fh
    dl SamusTiles_Bottom_Set5_Entry4 : dw $00C0,$0040                    ;92D4C3;

SamusBottomTiles_Set5_D4CA:
; 62h: Unused - frame 10h
; B3h: Facing anticlockwise - grapple - in air - frame 10h
    dl SamusTiles_Bottom_Set5_Entry5 : dw $00C0,$0040                    ;92D4CA;

SamusBottomTiles_Set5_D4D1:
; 62h: Unused - frame 11h
; B3h: Facing anticlockwise - grapple - in air - frame 11h
    dl SamusTiles_Bottom_Set5_Entry6 : dw $0080,$0040                    ;92D4D1;

SamusBottomTiles_Set5_D4D8:
; 62h: Unused - frame 12h
; B3h: Facing anticlockwise - grapple - in air - frame 12h
    dl SamusTiles_Bottom_Set5_Entry7 : dw $00A0,$0040                    ;92D4D8;

SamusBottomTiles_Set5_D4DF:
; 62h: Unused - frames 13h..14h
; B3h: Facing anticlockwise - grapple - in air - frames 13h..14h
    dl SamusTiles_Bottom_Set5_Entry8 : dw $00A0,$0040                    ;92D4DF;

SamusBottomTiles_Set5_D4E6:
; 62h: Unused - frames 15h..16h
; B3h: Facing anticlockwise - grapple - in air - frames 15h..16h
    dl SamusTiles_Bottom_Set5_Entry9 : dw $00C0,$0040                    ;92D4E6;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set5_92D4ED:
    dl SamusTiles_Bottom_Set5_EntryA : dw $00A0,$0080                    ;92D4ED;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set5_D4F4:
; 62h: Unused - frame 40h
; B3h: Facing anticlockwise - grapple - in air - frame 40h
    dl SamusTiles_Bottom_Set5_EntryB : dw $0080,$0080                    ;92D4F4;

SamusBottomTiles_Set5_D4FB:
; 62h: Unused - frame 41h
; B3h: Facing anticlockwise - grapple - in air - frame 41h
    dl SamusTiles_Bottom_Set5_EntryC : dw $0080,$0080                    ;92D4FB;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set5_92D502:
; 62h: Unused - frames 27h..29h
; B3h: Facing anticlockwise - grapple - in air - frames 27h..29h
    dl SamusTiles_Bottom_Set5_EntryD : dw $0080,$0080                    ;92D502;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set5_D509:
; 62h: Unused - frames 2Ah..2Bh
; B3h: Facing anticlockwise - grapple - in air - frames 2Ah..2Bh
    dl SamusTiles_Bottom_Set5_EntryE : dw $00A0,$0040                    ;92D509;

SamusBottomTiles_Set5_D510:
; 62h: Unused - frames 2Ch..2Dh
; B3h: Facing anticlockwise - grapple - in air - frames 2Ch..2Dh
    dl SamusTiles_Bottom_Set5_EntryF : dw $0080,$0080                    ;92D510;

SamusBottomTiles_Set5_D517:
; 62h: Unused - frame 2Eh
; B3h: Facing anticlockwise - grapple - in air - frame 2Eh
    dl SamusTiles_Bottom_Set5_Entry10 : dw $0080,$0080                   ;92D517;

SamusBottomTiles_Set5_D51E:
; 62h: Unused - frame 2Fh
; B3h: Facing anticlockwise - grapple - in air - frame 2Fh
    dl SamusTiles_Bottom_Set5_Entry11 : dw $00A0,$0040                   ;92D51E;

SamusBottomTiles_Set5_D525:
; 62h: Unused - frame 30h
; B3h: Facing anticlockwise - grapple - in air - frame 30h
    dl SamusTiles_Bottom_Set5_Entry12 : dw $0080,$0080                   ;92D525;

SamusBottomTiles_Set5_D52C:
; 62h: Unused - frame 31h
; B3h: Facing anticlockwise - grapple - in air - frame 31h
    dl SamusTiles_Bottom_Set5_Entry13 : dw $0080,$0080                   ;92D52C;

SamusBottomTiles_Set5_D533:
; 62h: Unused - frame 32h
; B3h: Facing anticlockwise - grapple - in air - frame 32h
    dl SamusTiles_Bottom_Set5_Entry14 : dw $0080,$0080                   ;92D533;

SamusBottomTiles_Set5_D53A:
; 62h: Unused - frames 33h..34h
; B3h: Facing anticlockwise - grapple - in air - frames 33h..34h
    dl SamusTiles_Bottom_Set5_Entry15 : dw $00C0,$0080                   ;92D53A;

SamusBottomTiles_Set5_D541:
; 62h: Unused - frames 35h..36h
; B3h: Facing anticlockwise - grapple - in air - frames 35h..36h
    dl SamusTiles_Bottom_Set5_Entry16 : dw $0080,$0080                   ;92D541;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set5_92D548:
    dl SamusTiles_Bottom_Set5_Entry17 : dw $0080,$0080                   ;92D548;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D54F: Samus bottom tiles - set 6 (facing anticlockwise - grappling - in air - upside down) ;;;
SamusBottomTiles_Set6_D54F:
; 62h: Unused - frames 17h..19h
; B3h: Facing anticlockwise - grapple - in air - frames 17h..19h
    dl SamusTiles_Bottom_Set6_Entry0 : dw $0080,$0040                    ;92D54F;

SamusBottomTiles_Set6_D556:
; 62h: Unused - frames 1Ah..1Bh
; B3h: Facing anticlockwise - grapple - in air - frames 1Ah..1Bh
    dl SamusTiles_Bottom_Set6_Entry1 : dw $00E0,$0040                    ;92D556;

SamusBottomTiles_Set6_D55D:
; 62h: Unused - frames 1Ch..1Dh
; B3h: Facing anticlockwise - grapple - in air - frames 1Ch..1Dh
    dl SamusTiles_Bottom_Set6_Entry2 : dw $00A0,$0080                    ;92D55D;

SamusBottomTiles_Set6_D564:
; 62h: Unused - frame 1Eh
; B3h: Facing anticlockwise - grapple - in air - frame 1Eh
    dl SamusTiles_Bottom_Set6_Entry3 : dw $00A0,$0040                    ;92D564;

SamusBottomTiles_Set6_D56B:
; 62h: Unused - frame 1Fh
; B3h: Facing anticlockwise - grapple - in air - frame 1Fh
    dl SamusTiles_Bottom_Set6_Entry4 : dw $00C0,$0040                    ;92D56B;

SamusBottomTiles_Set6_D572:
; 62h: Unused - frame 0
; B3h: Facing anticlockwise - grapple - in air - frame 0
    dl SamusTiles_Bottom_Set6_Entry5 : dw $00C0,$0040                    ;92D572;

SamusBottomTiles_Set6_D579:
; 62h: Unused - frame 1
; B3h: Facing anticlockwise - grapple - in air - frame 1
    dl SamusTiles_Bottom_Set6_Entry6 : dw $0080,$0040                    ;92D579;

SamusBottomTiles_Set6_D580:
; 62h: Unused - frame 2
; B3h: Facing anticlockwise - grapple - in air - frame 2
    dl SamusTiles_Bottom_Set6_Entry7 : dw $00A0,$0040                    ;92D580;

SamusBottomTiles_Set6_D587:
; 62h: Unused - frames 3..4
; B3h: Facing anticlockwise - grapple - in air - frames 3..4
    dl SamusTiles_Bottom_Set6_Entry8 : dw $00A0,$0040                    ;92D587;

SamusBottomTiles_Set6_D58E:
; 62h: Unused - frames 5..6
; B3h: Facing anticlockwise - grapple - in air - frames 5..6
    dl SamusTiles_Bottom_Set6_Entry9 : dw $00C0,$0040                    ;92D58E;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set6_92D595:
    dl SamusTiles_Bottom_Set6_EntryA : dw $00A0,$0080                    ;92D595;

UNUSED_SamusBottomTiles_Set6_92D59C:
    dl SamusTiles_Bottom_Set6_EntryB : dw $0080,$0080                    ;92D59C;

UNUSED_SamusBottomTiles_Set6_92D5A3:
    dl SamusTiles_Bottom_Set6_EntryC : dw $0080,$0080                    ;92D5A3;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set6_D5AA:
; 62h: Unused - frames 37h..39h
; B3h: Facing anticlockwise - grapple - in air - frames 37h..39h
    dl SamusTiles_Bottom_Set6_EntryD : dw $0080,$0080                    ;92D5AA;

SamusBottomTiles_Set6_D5B1:
; 62h: Unused - frames 3Ah..3Bh
; B3h: Facing anticlockwise - grapple - in air - frames 3Ah..3Bh
    dl SamusTiles_Bottom_Set6_EntryE : dw $00A0,$0040                    ;92D5B1;

SamusBottomTiles_Set6_D5B8:
; 62h: Unused - frames 3Ch..3Dh
; B3h: Facing anticlockwise - grapple - in air - frames 3Ch..3Dh
    dl SamusTiles_Bottom_Set6_EntryF : dw $0080,$0080                    ;92D5B8;

SamusBottomTiles_Set6_D5BF:
; 62h: Unused - frame 3Eh
; B3h: Facing anticlockwise - grapple - in air - frame 3Eh
    dl SamusTiles_Bottom_Set6_Entry10 : dw $0080,$0080                   ;92D5BF;

SamusBottomTiles_Set6_D5C6:
; 62h: Unused - frame 3Fh
; B3h: Facing anticlockwise - grapple - in air - frame 3Fh
    dl SamusTiles_Bottom_Set6_Entry11 : dw $00A0,$0040                   ;92D5C6;

SamusBottomTiles_Set6_D5CD:
; 62h: Unused - frame 20h
; B3h: Facing anticlockwise - grapple - in air - frame 20h
    dl SamusTiles_Bottom_Set6_Entry12 : dw $0080,$0080                   ;92D5CD;

SamusBottomTiles_Set6_D5D4:
; 62h: Unused - frame 21h
; B3h: Facing anticlockwise - grapple - in air - frame 21h
    dl SamusTiles_Bottom_Set6_Entry13 : dw $0080,$0080                   ;92D5D4;

SamusBottomTiles_Set6_D5DB:
; 62h: Unused - frame 22h
; B3h: Facing anticlockwise - grapple - in air - frame 22h
    dl SamusTiles_Bottom_Set6_Entry14 : dw $0080,$0080                   ;92D5DB;

SamusBottomTiles_Set6_D5E2:
; 62h: Unused - frames 23h..24h
; B3h: Facing anticlockwise - grapple - in air - frames 23h..24h
    dl SamusTiles_Bottom_Set6_Entry15 : dw $0080,$0080                   ;92D5E2;

SamusBottomTiles_Set6_D5E9:
; 62h: Unused - frames 25h..26h
; B3h: Facing anticlockwise - grapple - in air - frames 25h..26h
    dl SamusTiles_Bottom_Set6_Entry16 : dw $0080,$0080                   ;92D5E9;


;;; $D5F0: Samus bottom tiles - set 8 (facing forward) ;;;
SamusBottomTiles_Set8_D5F0:
; 0: Facing forward - power suit - frames 2..5Fh
    dl SamusTiles_Bottom_Set8_Entry0 : dw $0100,$0100                    ;92D5F0;

SamusBottomTiles_Set8_D5F7:
; 9Bh: Facing forward - varia/gravity suit - frames 2..5Fh
    dl SamusTiles_Bottom_Set8_Entry1 : dw $0100,$0100                    ;92D5F7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set8_92D5FE:
    dl SamusTiles_Bottom_Set8_Entry2 : dw $0020,$0000                    ;92D5FE;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D605: Samus bottom tiles - set Ah (general) ;;;
SamusBottomTiles_SetA_D605:
; 3: Facing right - aiming up - frames 0..1
; 5: Facing right - aiming up-right - frame 0
; 7: Facing right - aiming down-right - frame 0
; AAh: Facing right - grappling - aiming down-right - frame 0
; CFh: Facing right - ran into a wall - aiming up-right - frame 0
; D1h: Facing right - ran into a wall - aiming down-right - frame 0
    dl SamusTiles_Bottom_SetA_Entry0 : dw $00C0,$0080                    ;92D605;

SamusBottomTiles_SetA_D60C:
; 4: Facing left-   aiming up - frames 0..1
; 6: Facing left-   aiming up-left - frame 0
; 8: Facing left-   aiming down-left - frame 0
; ABh: Facing left-   grappling - aiming down-left - frame 0
; D0h: Facing left-   ran into a wall - aiming up-left - frame 0
; D2h: Facing left-   ran into a wall - aiming down-left - frame 0
; E9h: Facing left-   Samus drained - crouching/falling - frame 10h
; E9h: Facing left-   Samus drained - crouching/falling - frame 15h
    dl SamusTiles_Bottom_SetA_Entry1 : dw $00C0,$0080                    ;92D60C;


;;; $D613: Samus top tiles - set Ah (morph ball, spin jump, screw attack sparks) ;;;
SamusTopTiles_SetA_D613:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 0
; 1Eh: Moving right - morph ball - no springball - on ground - frame 0
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 7
; 31h: Facing right - morph ball - no springball - in air - frame 0
; 32h: Facing left-   morph ball - no springball - in air - frame 0
; 3Fh: Unused - frame 0
; 40h: Unused - frame 0
; 41h: Facing left-   morph ball - no springball - on ground - frame 7
; 79h: Facing right - morph ball - spring ball - on ground - frame 0
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 7
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 0
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 7
; 7Dh: Facing right - morph ball - spring ball - falling - frame 0
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 7
; 7Fh: Facing right - morph ball - spring ball - in air - frame 0
; 80h: Facing left-   morph ball - spring ball - in air - frame 7
; C5h: Unused - frame 7
; D7h: Facing right - crystal flash ending - frame 0
; DFh: Unused. Related to Draygon - frame 7
; E8h: Facing right - Samus drained - crouching/falling - frame 0
    dl SamusTiles_Top_SetA_Entry0 : dw $0060,$0040                       ;92D613;

SamusTopTiles_SetA_D61A:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 2
; 1Eh: Moving right - morph ball - no springball - on ground - frame 2
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 5
; 31h: Facing right - morph ball - no springball - in air - frame 2
; 32h: Facing left-   morph ball - no springball - in air - frame 2
; 3Fh: Unused - frame 2
; 40h: Unused - frame 2
; 41h: Facing left-   morph ball - no springball - on ground - frame 5
; 79h: Facing right - morph ball - spring ball - on ground - frame 2
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 5
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 2
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 5
; 7Dh: Facing right - morph ball - spring ball - falling - frame 2
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 5
; 7Fh: Facing right - morph ball - spring ball - in air - frame 2
; 80h: Facing left-   morph ball - spring ball - in air - frame 5
; C5h: Unused - frame 5
; DFh: Unused. Related to Draygon - frame 5
    dl SamusTiles_Top_SetA_Entry1 : dw $0060,$0040                       ;92D61A;

SamusTopTiles_SetA_D621:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 4
; 1Eh: Moving right - morph ball - no springball - on ground - frame 4
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 3
; 31h: Facing right - morph ball - no springball - in air - frame 4
; 32h: Facing left-   morph ball - no springball - in air - frame 4
; 3Fh: Unused - frame 4
; 40h: Unused - frame 4
; 41h: Facing left-   morph ball - no springball - on ground - frame 3
; 79h: Facing right - morph ball - spring ball - on ground - frame 4
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 3
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 4
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 3
; 7Dh: Facing right - morph ball - spring ball - falling - frame 4
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 3
; 7Fh: Facing right - morph ball - spring ball - in air - frame 4
; 80h: Facing left-   morph ball - spring ball - in air - frame 3
; C5h: Unused - frame 3
; DFh: Unused. Related to Draygon - frame 3
    dl SamusTiles_Top_SetA_Entry2 : dw $0060,$0040                       ;92D621;

SamusTopTiles_SetA_D628:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 6
; 1Eh: Moving right - morph ball - no springball - on ground - frame 6
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 1
; 31h: Facing right - morph ball - no springball - in air - frame 6
; 32h: Facing left-   morph ball - no springball - in air - frame 6
; 3Fh: Unused - frame 6
; 40h: Unused - frame 6
; 41h: Facing left-   morph ball - no springball - on ground - frame 1
; 79h: Facing right - morph ball - spring ball - on ground - frame 6
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 1
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 6
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 1
; 7Dh: Facing right - morph ball - spring ball - falling - frame 6
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 1
; 7Fh: Facing right - morph ball - spring ball - in air - frame 6
; 80h: Facing left-   morph ball - spring ball - in air - frame 1
; C5h: Unused - frame 1
; DFh: Unused. Related to Draygon - frame 1
    dl SamusTiles_Top_SetA_Entry3 : dw $0060,$0040                       ;92D628;

SamusTopTiles_SetA_D62F:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 1
; 1Eh: Moving right - morph ball - no springball - on ground - frame 1
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 6
; 31h: Facing right - morph ball - no springball - in air - frame 1
; 32h: Facing left-   morph ball - no springball - in air - frame 1
; 3Fh: Unused - frame 1
; 40h: Unused - frame 1
; 41h: Facing left-   morph ball - no springball - on ground - frame 6
; 79h: Facing right - morph ball - spring ball - on ground - frame 1
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 6
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 1
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 6
; 7Dh: Facing right - morph ball - spring ball - falling - frame 1
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 6
; 7Fh: Facing right - morph ball - spring ball - in air - frame 1
; 80h: Facing left-   morph ball - spring ball - in air - frame 6
; C5h: Unused - frame 6
; DFh: Unused. Related to Draygon - frame 6
    dl SamusTiles_Top_SetA_Entry4 : dw $00A0,$0000                       ;92D62F;

SamusTopTiles_SetA_D636:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 3
; 1Eh: Moving right - morph ball - no springball - on ground - frame 3
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 4
; 31h: Facing right - morph ball - no springball - in air - frame 3
; 32h: Facing left-   morph ball - no springball - in air - frame 3
; 3Fh: Unused - frame 3
; 40h: Unused - frame 3
; 41h: Facing left-   morph ball - no springball - on ground - frame 4
; 79h: Facing right - morph ball - spring ball - on ground - frame 3
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 4
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 3
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 4
; 7Dh: Facing right - morph ball - spring ball - falling - frame 3
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 4
; 7Fh: Facing right - morph ball - spring ball - in air - frame 3
; 80h: Facing left-   morph ball - spring ball - in air - frame 4
; C5h: Unused - frame 4
; DFh: Unused. Related to Draygon - frame 4
    dl SamusTiles_Top_SetA_Entry5 : dw $0060,$0040                       ;92D636;

SamusTopTiles_SetA_D63D:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 5
; 1Eh: Moving right - morph ball - no springball - on ground - frame 5
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 2
; 31h: Facing right - morph ball - no springball - in air - frame 5
; 32h: Facing left-   morph ball - no springball - in air - frame 5
; 3Fh: Unused - frame 5
; 40h: Unused - frame 5
; 41h: Facing left-   morph ball - no springball - on ground - frame 2
; 79h: Facing right - morph ball - spring ball - on ground - frame 5
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 2
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 5
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 2
; 7Dh: Facing right - morph ball - spring ball - falling - frame 5
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 2
; 7Fh: Facing right - morph ball - spring ball - in air - frame 5
; 80h: Facing left-   morph ball - spring ball - in air - frame 2
; C5h: Unused - frame 2
; DFh: Unused. Related to Draygon - frame 2
    dl SamusTiles_Top_SetA_Entry6 : dw $0060,$0040                       ;92D63D;

SamusTopTiles_SetA_D644:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 7
; 1Eh: Moving right - morph ball - no springball - on ground - frame 7
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 0
; 31h: Facing right - morph ball - no springball - in air - frame 7
; 32h: Facing left-   morph ball - no springball - in air - frame 7
; 3Fh: Unused - frame 7
; 40h: Unused - frame 7
; 41h: Facing left-   morph ball - no springball - on ground - frame 0
; 79h: Facing right - morph ball - spring ball - on ground - frame 7
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 0
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 7
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 0
; 7Dh: Facing right - morph ball - spring ball - falling - frame 7
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 0
; 7Fh: Facing right - morph ball - spring ball - in air - frame 7
; 80h: Facing left-   morph ball - spring ball - in air - frame 0
; C5h: Unused - frame 0
; DFh: Unused. Related to Draygon - frame 0
    dl SamusTiles_Top_SetA_Entry7 : dw $0060,$0040                       ;92D644;

SamusTopTiles_SetA_D64B:
; 19h: Facing right - spin jump - frame 1
; 1Ah: Facing left-   spin jump - frame 1
; 20h: Unused - frame 1
; 21h: Unused - frame 1
; 22h: Unused - frame 1
; 23h: Unused - frame 1
; 24h: Unused - frame 1
; 33h: Unused - frame 1
; 34h: Unused - frame 1
; 39h: Unused - frame 1
; 3Ah: Unused - frame 1
; 42h: Unused - frame 1
; 83h: Facing right - wall jump - frame 3
; 84h: Facing left-   wall jump - frame 3
    dl SamusTiles_Top_SetA_Entry8 : dw $0080,$0080                       ;92D64B;

SamusTopTiles_SetA_D652:
; 19h: Facing right - spin jump - frame 2
; 1Ah: Facing left-   spin jump - frame 2
; 20h: Unused - frame 2
; 21h: Unused - frame 2
; 22h: Unused - frame 2
; 23h: Unused - frame 2
; 24h: Unused - frame 2
; 33h: Unused - frame 2
; 34h: Unused - frame 2
; 39h: Unused - frame 2
; 3Ah: Unused - frame 2
; 42h: Unused - frame 2
; 4Fh: Facing left-   damage boost - frame 8
; 50h: Facing right - damage boost - frame 8
; 83h: Facing right - wall jump - frame 4
; 84h: Facing left-   wall jump - frame 4
    dl SamusTiles_Top_SetA_Entry9 : dw $0100,$0100                       ;92D652;

SamusTopTiles_SetA_D659:
; 19h: Facing right - spin jump - frame 3
; 1Ah: Facing left-   spin jump - frame 3
; 20h: Unused - frame 3
; 21h: Unused - frame 3
; 22h: Unused - frame 3
; 23h: Unused - frame 3
; 24h: Unused - frame 3
; 33h: Unused - frame 3
; 34h: Unused - frame 3
; 39h: Unused - frame 3
; 3Ah: Unused - frame 3
; 42h: Unused - frame 3
; 4Fh: Facing left-   damage boost - frame 7
; 50h: Facing right - damage boost - frame 7
; 83h: Facing right - wall jump - frame 5
; 84h: Facing left-   wall jump - frame 5
    dl SamusTiles_Top_SetA_EntryA : dw $0080,$0080                       ;92D659;

SamusTopTiles_SetA_D660:
; 19h: Facing right - spin jump - frame 4
; 1Ah: Facing left-   spin jump - frame 4
; 20h: Unused - frame 4
; 21h: Unused - frame 4
; 22h: Unused - frame 4
; 23h: Unused - frame 4
; 24h: Unused - frame 4
; 33h: Unused - frame 4
; 34h: Unused - frame 4
; 39h: Unused - frame 4
; 3Ah: Unused - frame 4
; 42h: Unused - frame 4
; 4Fh: Facing left-   damage boost - frame 6
; 50h: Facing right - damage boost - frame 6
; 83h: Facing right - wall jump - frame 6
; 84h: Facing left-   wall jump - frame 6
    dl SamusTiles_Top_SetA_EntryB : dw $0100,$0100                       ;92D660;

SamusTopTiles_SetA_D667:
; 19h: Facing right - spin jump - frame 5
; 1Ah: Facing left-   spin jump - frame 5
; 20h: Unused - frame 5
; 21h: Unused - frame 5
; 22h: Unused - frame 5
; 23h: Unused - frame 5
; 24h: Unused - frame 5
; 33h: Unused - frame 5
; 34h: Unused - frame 5
; 39h: Unused - frame 5
; 3Ah: Unused - frame 5
; 42h: Unused - frame 5
; 4Fh: Facing left-   damage boost - frame 5
; 50h: Facing right - damage boost - frame 5
; 83h: Facing right - wall jump - frame 7
; 84h: Facing left-   wall jump - frame 7
    dl SamusTiles_Top_SetA_EntryC : dw $0080,$0080                       ;92D667;

SamusTopTiles_SetA_D66E:
; 19h: Facing right - spin jump - frame 6
; 1Ah: Facing left-   spin jump - frame 6
; 20h: Unused - frame 6
; 21h: Unused - frame 6
; 22h: Unused - frame 6
; 23h: Unused - frame 6
; 24h: Unused - frame 6
; 33h: Unused - frame 6
; 34h: Unused - frame 6
; 39h: Unused - frame 6
; 3Ah: Unused - frame 6
; 42h: Unused - frame 6
; 4Fh: Facing left-   damage boost - frame 4
; 50h: Facing right - damage boost - frame 4
; 83h: Facing right - wall jump - frame 8
; 84h: Facing left-   wall jump - frame 8
    dl SamusTiles_Top_SetA_EntryD : dw $0100,$0100                       ;92D66E;

SamusTopTiles_SetA_D675:
; 19h: Facing right - spin jump - frame 7
; 1Ah: Facing left-   spin jump - frame 7
; 20h: Unused - frame 7
; 21h: Unused - frame 7
; 22h: Unused - frame 7
; 23h: Unused - frame 7
; 24h: Unused - frame 7
; 33h: Unused - frame 7
; 34h: Unused - frame 7
; 39h: Unused - frame 7
; 3Ah: Unused - frame 7
; 42h: Unused - frame 7
; 4Fh: Facing left-   damage boost - frame 3
; 50h: Facing right - damage boost - frame 3
; 83h: Facing right - wall jump - frame 9
; 84h: Facing left-   wall jump - frame 9
    dl SamusTiles_Top_SetA_EntryE : dw $0080,$0080                       ;92D675;

SamusTopTiles_SetA_D67C:
; 19h: Facing right - spin jump - frame 8
; 1Ah: Facing left-   spin jump - frame 8
; 20h: Unused - frame 8
; 21h: Unused - frame 8
; 22h: Unused - frame 8
; 23h: Unused - frame 8
; 24h: Unused - frame 8
; 33h: Unused - frame 8
; 34h: Unused - frame 8
; 39h: Unused - frame 8
; 3Ah: Unused - frame 8
; 42h: Unused - frame 8
; 4Fh: Facing left-   damage boost - frame 2
; 50h: Facing right - damage boost - frame 2
; 83h: Facing right - wall jump - frame Ah
; 84h: Facing left-   wall jump - frame Ah
    dl SamusTiles_Top_SetA_EntryF : dw $0100,$0100                       ;92D67C;

SamusTopTiles_SetA_D683:
; 65h: Unused. Related to movement type Dh - frame 1
; 66h: Unused. Related to movement type Dh - frame 1
; 81h: Facing right - screw attack - frames 1..3
; 82h: Facing left-   screw attack - frames 1..3
; 83h: Facing right - wall jump - frames 17h..19h
; 84h: Facing left-   wall jump - frames 17h..19h
    dl SamusTiles_Top_SetA_Entry10 : dw $0100,$0040                      ;92D683;

SamusTopTiles_SetA_D68A:
; 65h: Unused. Related to movement type Dh - frame 2
; 66h: Unused. Related to movement type Dh - frame 2
; 81h: Facing right - screw attack - frames 7..9
; 82h: Facing left-   screw attack - frames 7..9
; 83h: Facing right - wall jump - frames 1Dh..1Fh
; 84h: Facing left-   wall jump - frames 1Dh..1Fh
    dl SamusTiles_Top_SetA_Entry11 : dw $0100,$0060                      ;92D68A;

SamusTopTiles_SetA_D691:
; 65h: Unused. Related to movement type Dh - frame 3
; 66h: Unused. Related to movement type Dh - frame 3
; 81h: Facing right - screw attack - frames Dh..Fh
; 82h: Facing left-   screw attack - frames Dh..Fh
; 83h: Facing right - wall jump - frames 23h..25h
; 84h: Facing left-   wall jump - frames 23h..25h
    dl SamusTiles_Top_SetA_Entry12 : dw $0100,$0060                      ;92D691;

SamusTopTiles_SetA_D698:
; 65h: Unused. Related to movement type Dh - frame 4
; 66h: Unused. Related to movement type Dh - frame 4
; 81h: Facing right - screw attack - frames 13h..15h
; 82h: Facing left-   screw attack - frames 13h..15h
; 83h: Facing right - wall jump - frames 29h..2Bh
; 84h: Facing left-   wall jump - frames 29h..2Bh
    dl SamusTiles_Top_SetA_Entry13 : dw $0100,$0000                      ;92D698;

SamusTopTiles_SetA_D69F:
; 1Bh: Facing right - space jump - frames 1..8
; 1Ch: Facing left-   space jump - frames 1..8
; 65h: Unused. Related to movement type Dh - frame 5
; 66h: Unused. Related to movement type Dh - frame 5
; 81h: Facing right - screw attack - frames 4..6
; 81h: Facing right - screw attack - frames Ah..Ch
; 81h: Facing right - screw attack - frames 10h..12h
; 81h: Facing right - screw attack - frames 16h..18h
; 82h: Facing left-   screw attack - frames 4..6
; 82h: Facing left-   screw attack - frames Ah..Ch
; 82h: Facing left-   screw attack - frames 10h..12h
; 82h: Facing left-   screw attack - frames 16h..18h
; 83h: Facing right - wall jump - frames Dh..14h
; 83h: Facing right - wall jump - frames 1Ah..1Ch
; 83h: Facing right - wall jump - frames 20h..22h
; 83h: Facing right - wall jump - frames 26h..28h
; 83h: Facing right - wall jump - frames 2Ch..2Eh
; 84h: Facing left-   wall jump - frames Dh..14h
; 84h: Facing left-   wall jump - frames 1Ah..1Ch
; 84h: Facing left-   wall jump - frames 20h..22h
; 84h: Facing left-   wall jump - frames 26h..28h
; 84h: Facing left-   wall jump - frames 2Ch..2Eh
    dl SamusTiles_Top_SetA_Entry14 : dw $0020,$0000                      ;92D69F;


;;; $D6A6: Samus top tiles - set Bh (morphing transition, unused morph ball bounce) ;;;
UNUSED_SamusTopTiles_SetB_92D6A6:
    dl SamusTiles_Top_SetB_Entry0 : dw $0020,$0000                       ;92D6A6;

SamusTopTiles_SetB_D6AD:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 9
; 1Eh: Moving right - morph ball - no springball - on ground - frame 9
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 9
; 31h: Facing right - morph ball - no springball - in air - frame 9
; 32h: Facing left-   morph ball - no springball - in air - frame 9
; 3Fh: Unused - frame 9
; 40h: Unused - frame 9
; 41h: Facing left-   morph ball - no springball - on ground - frame 9
; 79h: Facing right - morph ball - spring ball - on ground - frame 9
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 9
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 9
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 9
; 7Dh: Facing right - morph ball - spring ball - falling - frame 9
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 9
; 7Fh: Facing right - morph ball - spring ball - in air - frame 9
; 80h: Facing left-   morph ball - spring ball - in air - frame 9
; C5h: Unused - frame 9
; DFh: Unused. Related to Draygon - frame 9
    dl SamusTiles_Top_SetB_Entry1 : dw $0060,$0040                       ;92D6AD;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_SetB_92D6B4:
    dl SamusTiles_Top_SetB_Entry2 : dw $0060,$0040                       ;92D6B4;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_SetB_D6BB:
; 38h: Facing left-   morphing transition - frame 1
; 3Eh: Facing left-   unmorphing transition - frame 0
; D4h: Facing left-   crystal flash - frame 0
; D8h: Facing left-   crystal flash ending - frame 1
; DCh: Unused - frame 2
; DEh: Unused - frame 0
; E9h: Facing left-   Samus drained - crouching/falling - frame 0
    dl SamusTiles_Top_SetB_Entry3 : dw $0080,$0040                       ;92D6BB;

SamusTopTiles_SetB_D6C2:
; 38h: Facing left-   morphing transition - frame 0
; 3Eh: Facing left-   unmorphing transition - frame 1
; D4h: Facing left-   crystal flash - frame 1
; D4h: Facing left-   crystal flash - frame 3
; D4h: Facing left-   crystal flash - frames Ch..Dh
; D8h: Facing left-   crystal flash ending - frame 2
; DCh: Unused - frame 1
; DEh: Unused - frame 1
; E9h: Facing left-   Samus drained - crouching/falling - frame 1
    dl SamusTiles_Top_SetB_Entry4 : dw $00C0,$0040                       ;92D6C2;

SamusTopTiles_SetB_D6C9:
; 37h: Facing right - morphing transition - frame 1
; 3Dh: Facing right - unmorphing transition - frame 0
; D3h: Facing right - crystal flash - frame 0
; D7h: Facing right - crystal flash ending - frame 1
; DBh: Unused - frame 2
; DDh: Unused - frame 0
; E8h: Facing right - Samus drained - crouching/falling - frame 1
    dl SamusTiles_Top_SetB_Entry5 : dw $0080,$0040                       ;92D6C9;

SamusTopTiles_SetB_D6D0:
; 37h: Facing right - morphing transition - frame 0
; 3Dh: Facing right - unmorphing transition - frame 1
; D3h: Facing right - crystal flash - frame 1
; D3h: Facing right - crystal flash - frame 3
; D3h: Facing right - crystal flash - frames Ch..Dh
; D7h: Facing right - crystal flash ending - frame 2
; DBh: Unused - frame 1
; DDh: Unused - frame 1
; E8h: Facing right - Samus drained - crouching/falling - frame 2
    dl SamusTiles_Top_SetB_Entry6 : dw $00C0,$0040                       ;92D6D0;


;;; $D6D7: Samus bottom tiles - set 3 (unused) ;;;
UNUSED_SamusBottomTiles_Set3_92D6D7:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry0_9EE9C0 : dw $0040,$0040      ;92D6D7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set3_92D6DE:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry1_9EEA40 : dw $0080,$0080      ;92D6DE;

UNUSED_SamusBottomTiles_Set3_92D6E5:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry2_9EEB40 : dw $0040,$0040      ;92D6E5;

UNUSED_SamusBottomTiles_Set3_92D6EC:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry3_9EEBC0 : dw $0080,$0080      ;92D6EC;

UNUSED_SamusBottomTiles_Set3_92D6F3:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry4_9EECC0 : dw $0040,$0040      ;92D6F3;

UNUSED_SamusBottomTiles_Set3_92D6FA:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry5_9EED40 : dw $0080,$0080      ;92D6FA;

UNUSED_SamusBottomTiles_Set3_92D701:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry6_9EEE40 : dw $0040,$0040      ;92D701;

UNUSED_SamusBottomTiles_Set3_92D708:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry7_9EEEC0 : dw $0080,$0080      ;92D708;

UNUSED_SamusBottomTiles_Set3_92D70F:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry8_9EEFC0 : dw $0040,$0040      ;92D70F;

UNUSED_SamusBottomTiles_Set3_92D716:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry9_9EF040 : dw $0080,$0080      ;92D716;

UNUSED_SamusBottomTiles_Set3_92D71D:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryA_9EF140 : dw $0040,$0040      ;92D71D;

UNUSED_SamusBottomTiles_Set3_92D724:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryB_9EF1C0 : dw $0080,$0080      ;92D724;

UNUSED_SamusBottomTiles_Set3_92D72B:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryC_9EF2C0 : dw $0040,$0040      ;92D72B;

UNUSED_SamusBottomTiles_Set3_92D732:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryD_9EF340 : dw $0080,$0080      ;92D732;

UNUSED_SamusBottomTiles_Set3_92D739:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryE_9EF440 : dw $0040,$0040      ;92D739;

UNUSED_SamusBottomTiles_Set3_92D740:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryF_9EF4C0 : dw $0080,$0080      ;92D740;

UNUSED_SamusBottomTiles_Set3_92D747:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry10_9EF5C0 : dw $0080,$0080     ;92D747;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D74E: Samus top tiles - set Ch (crystal flash, vertical shinespark) ;;;
SamusTopTiles_SetC_D74E:
; CBh: Facing right - shinespark - vertical - frame 0
    dl SamusTiles_Top_SetC_Entry0 : dw $0100,$00C0                       ;92D74E;

SamusTopTiles_SetC_D755:
; CCh: Facing left-   shinespark - vertical - frame 0
    dl SamusTiles_Top_SetC_Entry1 : dw $0100,$00C0                       ;92D755;

SamusTopTiles_SetC_D75C:
; D4h: Facing left-   crystal flash - frame 2
; D4h: Facing left-   crystal flash - frame 6
    dl SamusTiles_Top_SetC_Entry2 : dw $0100,$0040                       ;92D75C;

SamusTopTiles_SetC_D763:
; D4h: Facing left-   crystal flash - frame 7
; D4h: Facing left-   crystal flash - frame 9
    dl SamusTiles_Top_SetC_Entry3 : dw $0100,$0040                       ;92D763;

SamusTopTiles_SetC_D76A:
; D4h: Facing left-   crystal flash - frame 8
    dl SamusTiles_Top_SetC_Entry4 : dw $0100,$0040                       ;92D76A;

SamusTopTiles_SetC_D771:
; D3h: Facing right - crystal flash - frame 2
; D3h: Facing right - crystal flash - frame 6
    dl SamusTiles_Top_SetC_Entry5 : dw $0100,$0040                       ;92D771;

SamusTopTiles_SetC_D778:
; D3h: Facing right - crystal flash - frame 7
; D3h: Facing right - crystal flash - frame 9
    dl SamusTiles_Top_SetC_Entry6 : dw $0100,$0040                       ;92D778;

SamusTopTiles_SetC_D77F:
; D3h: Facing right - crystal flash - frame 8
    dl SamusTiles_Top_SetC_Entry7 : dw $0100,$0040                       ;92D77F;


;;; $D786: Samus bottom tiles - set 7 (crystal flash bubble) ;;;
SamusBottomTiles_Set7_D786:
; D3h: Facing right - crystal flash - frame 0
; D3h: Facing right - crystal flash - frame Dh
; D4h: Facing left-   crystal flash - frame 0
; D4h: Facing left-   crystal flash - frame Dh
    dl SamusTiles_Bottom_Set7_Entry0 : dw $0040,$0040                    ;92D786;

SamusBottomTiles_Set7_D78D:
; D3h: Facing right - crystal flash - frame 1
; D3h: Facing right - crystal flash - frame Ch
; D4h: Facing left-   crystal flash - frame 1
; D4h: Facing left-   crystal flash - frame Ch
    dl SamusTiles_Bottom_Set7_Entry1 : dw $0100,$0100                    ;92D78D;

SamusBottomTiles_Set7_D794:
; D3h: Facing right - crystal flash - frames 2..3
; D3h: Facing right - crystal flash - frames 6..9
; D4h: Facing left-   crystal flash - frames 2..3
; D4h: Facing left-   crystal flash - frames 6..9
    dl SamusTiles_Bottom_Set7_Entry2 : dw $0100,$0100                    ;92D794;


;;; $D79B: Samus bottom tiles - set 9 (space jump) ;;;
SamusBottomTiles_Set9_D79B:
; 1Bh: Facing right - space jump - frame 1
; 1Ch: Facing left-   space jump - frame 1
; 81h: Facing right - screw attack - frame 1
; 81h: Facing right - screw attack - frame 9
; 81h: Facing right - screw attack - frame 11h
; 82h: Facing left-   screw attack - frame 1
; 82h: Facing left-   screw attack - frame 9
; 82h: Facing left-   screw attack - frame 11h
; 83h: Facing right - wall jump - frame Dh
; 83h: Facing right - wall jump - frame 17h
; 83h: Facing right - wall jump - frame 1Fh
; 83h: Facing right - wall jump - frame 27h
; 84h: Facing left-   wall jump - frame Dh
; 84h: Facing left-   wall jump - frame 17h
; 84h: Facing left-   wall jump - frame 1Fh
; 84h: Facing left-   wall jump - frame 27h
    dl SamusTiles_Bottom_Set9_Entry0 : dw $0100,$0100                    ;92D79B;

SamusBottomTiles_Set9_D7A2:
; 1Bh: Facing right - space jump - frame 2
; 1Ch: Facing left-   space jump - frame 2
; 81h: Facing right - screw attack - frame 2
; 81h: Facing right - screw attack - frame Ah
; 81h: Facing right - screw attack - frame 12h
; 82h: Facing left-   screw attack - frame 2
; 82h: Facing left-   screw attack - frame Ah
; 82h: Facing left-   screw attack - frame 12h
; 83h: Facing right - wall jump - frame Eh
; 83h: Facing right - wall jump - frame 18h
; 83h: Facing right - wall jump - frame 20h
; 83h: Facing right - wall jump - frame 28h
; 84h: Facing left-   wall jump - frame Eh
; 84h: Facing left-   wall jump - frame 18h
; 84h: Facing left-   wall jump - frame 20h
; 84h: Facing left-   wall jump - frame 28h
    dl SamusTiles_Bottom_Set9_Entry1 : dw $0100,$0100                    ;92D7A2;

SamusBottomTiles_Set9_D7A9:
; 1Bh: Facing right - space jump - frame 3
; 1Ch: Facing left-   space jump - frame 3
; 81h: Facing right - screw attack - frame 3
; 81h: Facing right - screw attack - frame Bh
; 81h: Facing right - screw attack - frame 13h
; 82h: Facing left-   screw attack - frame 3
; 82h: Facing left-   screw attack - frame Bh
; 82h: Facing left-   screw attack - frame 13h
; 83h: Facing right - wall jump - frame Fh
; 83h: Facing right - wall jump - frame 19h
; 83h: Facing right - wall jump - frame 21h
; 83h: Facing right - wall jump - frame 29h
; 84h: Facing left-   wall jump - frame Fh
; 84h: Facing left-   wall jump - frame 19h
; 84h: Facing left-   wall jump - frame 21h
; 84h: Facing left-   wall jump - frame 29h
    dl SamusTiles_Bottom_Set9_Entry2 : dw $0100,$0100                    ;92D7A9;

SamusBottomTiles_Set9_D7B0:
; 1Bh: Facing right - space jump - frame 4
; 1Ch: Facing left-   space jump - frame 4
; 81h: Facing right - screw attack - frame 4
; 81h: Facing right - screw attack - frame Ch
; 81h: Facing right - screw attack - frame 14h
; 82h: Facing left-   screw attack - frame 4
; 82h: Facing left-   screw attack - frame Ch
; 82h: Facing left-   screw attack - frame 14h
; 83h: Facing right - wall jump - frame 10h
; 83h: Facing right - wall jump - frame 1Ah
; 83h: Facing right - wall jump - frame 22h
; 83h: Facing right - wall jump - frame 2Ah
; 84h: Facing left-   wall jump - frame 10h
; 84h: Facing left-   wall jump - frame 1Ah
; 84h: Facing left-   wall jump - frame 22h
; 84h: Facing left-   wall jump - frame 2Ah
    dl SamusTiles_Bottom_Set9_Entry3 : dw $0100,$0100                    ;92D7B0;

SamusBottomTiles_Set9_D7B7:
; 1Bh: Facing right - space jump - frame 5
; 1Ch: Facing left-   space jump - frame 5
; 81h: Facing right - screw attack - frame 5
; 81h: Facing right - screw attack - frame Dh
; 81h: Facing right - screw attack - frame 15h
; 82h: Facing left-   screw attack - frame 5
; 82h: Facing left-   screw attack - frame Dh
; 82h: Facing left-   screw attack - frame 15h
; 83h: Facing right - wall jump - frame 11h
; 83h: Facing right - wall jump - frame 1Bh
; 83h: Facing right - wall jump - frame 23h
; 83h: Facing right - wall jump - frame 2Bh
; 84h: Facing left-   wall jump - frame 11h
; 84h: Facing left-   wall jump - frame 1Bh
; 84h: Facing left-   wall jump - frame 23h
; 84h: Facing left-   wall jump - frame 2Bh
    dl SamusTiles_Bottom_Set9_Entry4 : dw $0100,$0100                    ;92D7B7;

SamusBottomTiles_Set9_D7BE:
; 1Bh: Facing right - space jump - frame 6
; 1Ch: Facing left-   space jump - frame 6
; 81h: Facing right - screw attack - frame 6
; 81h: Facing right - screw attack - frame Eh
; 81h: Facing right - screw attack - frame 16h
; 82h: Facing left-   screw attack - frame 6
; 82h: Facing left-   screw attack - frame Eh
; 82h: Facing left-   screw attack - frame 16h
; 83h: Facing right - wall jump - frame 12h
; 83h: Facing right - wall jump - frame 1Ch
; 83h: Facing right - wall jump - frame 24h
; 83h: Facing right - wall jump - frame 2Ch
; 84h: Facing left-   wall jump - frame 12h
; 84h: Facing left-   wall jump - frame 1Ch
; 84h: Facing left-   wall jump - frame 24h
; 84h: Facing left-   wall jump - frame 2Ch
    dl SamusTiles_Bottom_Set9_Entry5 : dw $0100,$0100                    ;92D7BE;

SamusBottomTiles_Set9_D7C5:
; 1Bh: Facing right - space jump - frame 7
; 1Ch: Facing left-   space jump - frame 7
; 81h: Facing right - screw attack - frame 7
; 81h: Facing right - screw attack - frame Fh
; 81h: Facing right - screw attack - frame 17h
; 82h: Facing left-   screw attack - frame 7
; 82h: Facing left-   screw attack - frame Fh
; 82h: Facing left-   screw attack - frame 17h
; 83h: Facing right - wall jump - frame 13h
; 83h: Facing right - wall jump - frame 1Dh
; 83h: Facing right - wall jump - frame 25h
; 83h: Facing right - wall jump - frame 2Dh
; 84h: Facing left-   wall jump - frame 13h
; 84h: Facing left-   wall jump - frame 1Dh
; 84h: Facing left-   wall jump - frame 25h
; 84h: Facing left-   wall jump - frame 2Dh
    dl SamusTiles_Bottom_Set9_Entry6 : dw $0100,$0100                    ;92D7C5;

SamusBottomTiles_Set9_D7CC:
; 1Bh: Facing right - space jump - frame 8
; 1Ch: Facing left-   space jump - frame 8
; 81h: Facing right - screw attack - frame 8
; 81h: Facing right - screw attack - frame 10h
; 81h: Facing right - screw attack - frame 18h
; 82h: Facing left-   screw attack - frame 8
; 82h: Facing left-   screw attack - frame 10h
; 82h: Facing left-   screw attack - frame 18h
; 83h: Facing right - wall jump - frame 14h
; 83h: Facing right - wall jump - frame 1Eh
; 83h: Facing right - wall jump - frame 26h
; 83h: Facing right - wall jump - frame 2Eh
; 84h: Facing left-   wall jump - frame 14h
; 84h: Facing left-   wall jump - frame 1Eh
; 84h: Facing left-   wall jump - frame 26h
; 84h: Facing left-   wall jump - frame 2Eh
    dl SamusTiles_Bottom_Set9_Entry7 : dw $0100,$0100                    ;92D7CC;


;;; $D7D3: Samus spritemaps - atmospheric graphics ;;;
; Bubbles
SamusSpritemaps_AtmosphericGraphics_Bubbles_0:
    dw $0002                                                             ;92D7D3;
    %spritemapEntry(0, $1FC, $FE, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FD, $FC, 0, 0, 3, 5, $43)

SamusSpritemaps_AtmosphericGraphics_Bubbles_1:
    dw $0003                                                             ;92D7DF;
    %spritemapEntry(0, $1FF, $FA, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FB, $F8, 1, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $FD, 0, 0, 3, 5, $25)

SamusSpritemaps_AtmosphericGraphics_Bubbles_2:
    dw $0003                                                             ;92D7F0;
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FD, $FB, 0, 0, 3, 5, $25)

SamusSpritemaps_AtmosphericGraphics_Bubbles_3:
    dw $0003                                                             ;92D801;
    %spritemapEntry(0, $00, $F7, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $FA, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F3, 0, 0, 3, 5, $43)

SamusSpritemaps_AtmosphericGraphics_Bubbles_4:
    dw $0003                                                             ;92D812;
    %spritemapEntry(0, $00, $F3, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $43)

SamusSpritemaps_AtmosphericGraphics_Bubbles_5:
    dw $0003                                                             ;92D823;
    %spritemapEntry(0, $01, $F1, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F6, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $EF, 0, 0, 3, 5, $40)

SamusSpritemaps_AtmosphericGraphics_Bubbles_6:
    dw $0003                                                             ;92D834;
    %spritemapEntry(0, $01, $EF, 0, 1, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1F9, $EC, 0, 0, 3, 5, $40)

SamusSpritemaps_AtmosphericGraphics_Bubbles_7:
    dw $0002                                                             ;92D845;
    %spritemapEntry(0, $02, $EC, 0, 1, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 5, $40)

SamusSpritemaps_AtmosphericGraphics_Bubbles_8:
    dw $0001                                                             ;92D851;
    %spritemapEntry(0, $1FC, $EC, 1, 0, 3, 5, $40)

; Diving splash
SamusSpritemaps_AtmosphericGraphics_DivingSplash_0:
    dw $0003                                                             ;92D858;
    dw $C3F8 : db $00 : dw $3A9A
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 5, $5E)

SamusSpritemaps_AtmosphericGraphics_DivingSplash_1:
    dw $0003                                                             ;92D869;
    dw $C3F8 : db $04 : dw $7A9A
    %spritemapEntry(0, $02, $F8, 0, 0, 3, 5, $BA)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 3, 5, $BA)

SamusSpritemaps_AtmosphericGraphics_DivingSplash_2:
    dw $0005                                                             ;92D87A;
    dw $C3F8 : db $04 : dw $BA9A
    %spritemapEntry(0, $00, $F4, 0, 0, 3, 5, $BA)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 3, 5, $BA)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $CA)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $CA)

SamusSpritemaps_AtmosphericGraphics_DivingSplash_3:
    dw $0005                                                             ;92D895;
    dw $C3F8 : db $03 : dw $3A9C
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $CA)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $BA)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $CA)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $BA)

SamusSpritemaps_AtmosphericGraphics_DivingSplash_4:
    dw $0007                                                             ;92D8B0;
    dw $C3F8 : db $01 : dw $BA9C
    %spritemapEntry(0, $00, $F2, 0, 0, 3, 5, $BA)
    %spritemapEntry(0, $1F8, $F1, 0, 0, 3, 5, $BA)
    %spritemapEntry(0, $00, $EB, 0, 0, 3, 5, $C7)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 3, 5, $C7)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $CA)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $CA)

SamusSpritemaps_AtmosphericGraphics_DivingSplash_5:
    dw $0005                                                             ;92D8D5;
    dw $C3F8 : db $00 : dw $7A9C
    %spritemapEntry(0, $00, $EE, 0, 0, 3, 5, $C7)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $C7)
    %spritemapEntry(0, $01, $F9, 0, 0, 3, 5, $BA)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 3, 5, $BA)

SamusSpritemaps_AtmosphericGraphics_DivingSplash_6:
    dw $0004                                                             ;92D8F0;
    %spritemapEntry(0, $1F8, $F2, 0, 0, 3, 5, $C7)
    %spritemapEntry(0, $00, $F2, 0, 0, 3, 5, $C7)
    %spritemapEntry(0, $02, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F6, $F9, 0, 0, 3, 5, $5E)

SamusSpritemaps_AtmosphericGraphics_DivingSplash_7:
    dw $0002                                                             ;92D906;
    %spritemapEntry(0, $00, $F6, 0, 0, 3, 5, $C7)
    %spritemapEntry(0, $1F8, $F6, 0, 0, 3, 5, $C7)

SamusSpritemaps_AtmosphericGraphics_DivingSplash_8:
    dw $0002                                                             ;92D912;
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $C7)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 5, $C7)


;;; $D91E: Samus top half tiles animation - tiles definition pointers ;;;
SamusTopHalfTilesAnimation_TilesDefinitionPointers:
; Indexed by first byte of animation definition
; Pointers to lists of DMA entries, sub-indexed by second byte of animation definition
    dw SamusTopTiles_Set0_CBEE                                           ;92D91E;
    dw UNUSED_SamusTopTiles_Set1_92CCCE                                  ;92D920;
    dw SamusTopTiles_Set2_CDA0                                           ;92D922;
    dw SamusTopTiles_Set3_CE80                                           ;92D924;
    dw SamusTopTiles_Set4_CEF7                                           ;92D926;
    dw SamusTopTiles_Set5_CF6E                                           ;92D928;
    dw SamusTopTiles_Set6_CFE5                                           ;92D92A;
    dw SamusTopTiles_Set7_D05C                                           ;92D92C;
    dw SamusTopTiles_Set8_D0E8                                           ;92D92E;
    dw SamusTopTiles_Set9_D12E                                           ;92D930;
    dw SamusTopTiles_SetA_D613                                           ;92D932;
    dw UNUSED_SamusTopTiles_SetB_92D6A6                                  ;92D934;
    dw SamusTopTiles_SetC_D74E                                           ;92D936;


;;; $D938: Samus bottom half tiles animation - tiles definition pointers ;;;
SamusBottomHalfTilesAnimation_TilesDefinitionPointers:
; Indexed by third byte of animation definition
; Pointers to lists of DMA entries, sub-indexed by fourth byte of animation definition
    dw SamusBottomTiles_Set0_D19E                                        ;92D938;
    dw SamusBottomTiles_Set1_D27E                                        ;92D93A;
    dw SamusBottomTiles_Set2_D35E                                        ;92D93C;
    dw UNUSED_SamusBottomTiles_Set3_92D6D7                               ;92D93E;
    dw SamusBottomTiles_Set4_D406                                        ;92D940;
    dw SamusBottomTiles_Set5_D4A7                                        ;92D942;
    dw SamusBottomTiles_Set6_D54F                                        ;92D944;
    dw SamusBottomTiles_Set7_D786                                        ;92D946;
    dw SamusBottomTiles_Set8_D5F0                                        ;92D948;
    dw SamusBottomTiles_Set9_D79B                                        ;92D94A;
    dw SamusBottomTiles_SetA_D605                                        ;92D94C;


;;; $D94E: Samus tiles animation - animation definition pointers ;;;
SamusTilesAnimation_AnimationDefinitionPointers:
; Indexed by [Samus pose]
    dw SamusTilesAnimation_AnimationDefinitions_EA24                     ;92D94E;
    dw SamusTilesAnimation_AnimationDefinitions_DB48                     ;92D950;
    dw SamusTilesAnimation_AnimationDefinitions_DB6C                     ;92D952;
    dw SamusTilesAnimation_AnimationDefinitions_E018                     ;92D954;
    dw SamusTilesAnimation_AnimationDefinitions_E020                     ;92D956;
    dw SamusTilesAnimation_AnimationDefinitions_E028                     ;92D958;
    dw SamusTilesAnimation_AnimationDefinitions_E02C                     ;92D95A;
    dw SamusTilesAnimation_AnimationDefinitions_E030                     ;92D95C;
    dw SamusTilesAnimation_AnimationDefinitions_E034                     ;92D95E;
    dw SamusTilesAnimation_AnimationDefinitions_DC48                     ;92D960;
    dw SamusTilesAnimation_AnimationDefinitions_DC70                     ;92D962;
    dw SamusTilesAnimation_AnimationDefinitions_DC98                     ;92D964;
    dw SamusTilesAnimation_AnimationDefinitions_DCC0                     ;92D966;
    dw SamusTilesAnimation_AnimationDefinitions_DF28                     ;92D968;
    dw SamusTilesAnimation_AnimationDefinitions_DF50                     ;92D96A;
    dw SamusTilesAnimation_AnimationDefinitions_DF78                     ;92D96C;
    dw SamusTilesAnimation_AnimationDefinitions_DFA0                     ;92D96E;
    dw SamusTilesAnimation_AnimationDefinitions_DFC8                     ;92D970;
    dw SamusTilesAnimation_AnimationDefinitions_DFF0                     ;92D972;
    dw SamusTilesAnimation_AnimationDefinitions_DD28                     ;92D974;
    dw SamusTilesAnimation_AnimationDefinitions_DD30                     ;92D976;
    dw SamusTilesAnimation_AnimationDefinitions_DD38                     ;92D978;
    dw SamusTilesAnimation_AnimationDefinitions_DD40                     ;92D97A;
    dw SamusTilesAnimation_AnimationDefinitions_DD18                     ;92D97C;
    dw SamusTilesAnimation_AnimationDefinitions_DD20                     ;92D97E;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D980;
    dw SamusTilesAnimation_AnimationDefinitions_E628                     ;92D982;
    dw SamusTilesAnimation_AnimationDefinitions_E658                     ;92D984;
    dw SamusTilesAnimation_AnimationDefinitions_E688                     ;92D986;
    dw SamusTilesAnimation_AnimationDefinitions_E508                     ;92D988;
    dw SamusTilesAnimation_AnimationDefinitions_E558                     ;92D98A;
    dw SamusTilesAnimation_AnimationDefinitions_E580                     ;92D98C;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D98E;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D990;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D992;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D994;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D996;
    dw SamusTilesAnimation_AnimationDefinitions_E798                     ;92D998;
    dw SamusTilesAnimation_AnimationDefinitions_E7A4                     ;92D99A;
    dw SamusTilesAnimation_AnimationDefinitions_DE18                     ;92D99C;
    dw SamusTilesAnimation_AnimationDefinitions_DE3C                     ;92D99E;
    dw SamusTilesAnimation_AnimationDefinitions_DE60                     ;92D9A0;
    dw SamusTilesAnimation_AnimationDefinitions_DE7C                     ;92D9A2;
    dw SamusTilesAnimation_AnimationDefinitions_DE98                     ;92D9A4;
    dw SamusTilesAnimation_AnimationDefinitions_DEA4                     ;92D9A6;
    dw SamusTilesAnimation_AnimationDefinitions_DEB0                     ;92D9A8;
    dw SamusTilesAnimation_AnimationDefinitions_DEB8                     ;92D9AA;
    dw SamusTilesAnimation_AnimationDefinitions_E7E0                     ;92D9AC;
    dw SamusTilesAnimation_AnimationDefinitions_E7EC                     ;92D9AE;
    dw SamusTilesAnimation_AnimationDefinitions_E508                     ;92D9B0;
    dw SamusTilesAnimation_AnimationDefinitions_E508                     ;92D9B2;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D9B4;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D9B6;
    dw SamusTilesAnimation_AnimationDefinitions_E4B0                     ;92D9B8;
    dw SamusTilesAnimation_AnimationDefinitions_E4B4                     ;92D9BA;
    dw SamusTilesAnimation_AnimationDefinitions_E4B8                     ;92D9BC;
    dw SamusTilesAnimation_AnimationDefinitions_E4C0                     ;92D9BE;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D9C0;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D9C2;
    dw SamusTilesAnimation_AnimationDefinitions_E4B0                     ;92D9C4;
    dw SamusTilesAnimation_AnimationDefinitions_E4B4                     ;92D9C6;
    dw SamusTilesAnimation_AnimationDefinitions_E4C8                     ;92D9C8;
    dw SamusTilesAnimation_AnimationDefinitions_E4D0                     ;92D9CA;
    dw SamusTilesAnimation_AnimationDefinitions_E508                     ;92D9CC;
    dw SamusTilesAnimation_AnimationDefinitions_E508                     ;92D9CE;
    dw SamusTilesAnimation_AnimationDefinitions_E530                     ;92D9D0;
    dw SamusTilesAnimation_AnimationDefinitions_E5F8                     ;92D9D2;
    dw SamusTilesAnimation_AnimationDefinitions_E7E0                     ;92D9D4;
    dw SamusTilesAnimation_AnimationDefinitions_E7EC                     ;92D9D6;
    dw SamusTilesAnimation_AnimationDefinitions_E048                     ;92D9D8;
    dw SamusTilesAnimation_AnimationDefinitions_E048                     ;92D9DA;
    dw SamusTilesAnimation_AnimationDefinitions_DB48                     ;92D9DC;
    dw SamusTilesAnimation_AnimationDefinitions_DB6C                     ;92D9DE;
    dw SamusTilesAnimation_AnimationDefinitions_DCE8                     ;92D9E0;
    dw SamusTilesAnimation_AnimationDefinitions_DD00                     ;92D9E2;
    dw SamusTilesAnimation_AnimationDefinitions_DD78                     ;92D9E4;
    dw SamusTilesAnimation_AnimationDefinitions_DD7C                     ;92D9E6;
    dw SamusTilesAnimation_AnimationDefinitions_DD98                     ;92D9E8;
    dw SamusTilesAnimation_AnimationDefinitions_DDB0                     ;92D9EA;
    dw SamusTilesAnimation_AnimationDefinitions_DDC8                     ;92D9EC;
    dw SamusTilesAnimation_AnimationDefinitions_DDF0                     ;92D9EE;
    dw SamusTilesAnimation_AnimationDefinitions_DD48                     ;92D9F0;
    dw SamusTilesAnimation_AnimationDefinitions_DD50                     ;92D9F2;
    dw SamusTilesAnimation_AnimationDefinitions_E038                     ;92D9F4;
    dw SamusTilesAnimation_AnimationDefinitions_E040                     ;92D9F6;
    dw SamusTilesAnimation_AnimationDefinitions_DD80                     ;92D9F8;
    dw SamusTilesAnimation_AnimationDefinitions_DD84                     ;92D9FA;
    dw SamusTilesAnimation_AnimationDefinitions_DD88                     ;92D9FC;
    dw SamusTilesAnimation_AnimationDefinitions_DD8C                     ;92D9FE;
    dw SamusTilesAnimation_AnimationDefinitions_DD90                     ;92DA00;
    dw SamusTilesAnimation_AnimationDefinitions_DD94                     ;92DA02;
    dw SamusTilesAnimation_AnimationDefinitions_E048                     ;92DA04;
    dw SamusTilesAnimation_AnimationDefinitions_E04C                     ;92DA06;
    dw SamusTilesAnimation_AnimationDefinitions_E050                     ;92DA08;
    dw SamusTilesAnimation_AnimationDefinitions_E050                     ;92DA0A;
    dw SamusTilesAnimation_AnimationDefinitions_E050                     ;92DA0C;
    dw SamusTilesAnimation_AnimationDefinitions_E050                     ;92DA0E;
    dw SamusTilesAnimation_AnimationDefinitions_E050                     ;92DA10;
    dw SamusTilesAnimation_AnimationDefinitions_E158                     ;92DA12;
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E260            ;92DA14;
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E268            ;92DA16;
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E270            ;92DA18;
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E294            ;92DA1A;
    dw SamusTilesAnimation_AnimationDefinitions_DEC0                     ;92DA1C;
    dw SamusTilesAnimation_AnimationDefinitions_DEDC                     ;92DA1E;
    dw SamusTilesAnimation_AnimationDefinitions_DD58                     ;92DA20;
    dw SamusTilesAnimation_AnimationDefinitions_DD60                     ;92DA22;
    dw SamusTilesAnimation_AnimationDefinitions_DD68                     ;92DA24;
    dw SamusTilesAnimation_AnimationDefinitions_DD70                     ;92DA26;
    dw SamusTilesAnimation_AnimationDefinitions_DEF8                     ;92DA28;
    dw SamusTilesAnimation_AnimationDefinitions_DF04                     ;92DA2A;
    dw SamusTilesAnimation_AnimationDefinitions_DF10                     ;92DA2C;
    dw SamusTilesAnimation_AnimationDefinitions_DF1C                     ;92DA2E;
    dw SamusTilesAnimation_AnimationDefinitions_E430                     ;92DA30;
    dw SamusTilesAnimation_AnimationDefinitions_E434                     ;92DA32;
    dw SamusTilesAnimation_AnimationDefinitions_E438                     ;92DA34;
    dw SamusTilesAnimation_AnimationDefinitions_E43C                     ;92DA36;
    dw SamusTilesAnimation_AnimationDefinitions_E450                     ;92DA38;
    dw SamusTilesAnimation_AnimationDefinitions_E468                     ;92DA3A;
    dw SamusTilesAnimation_AnimationDefinitions_E480                     ;92DA3C;
    dw SamusTilesAnimation_AnimationDefinitions_E498                     ;92DA3E;
    dw SamusTilesAnimation_AnimationDefinitions_E5A8                     ;92DA40;
    dw SamusTilesAnimation_AnimationDefinitions_E5D0                     ;92DA42;
    dw SamusTilesAnimation_AnimationDefinitions_E5A8                     ;92DA44;
    dw SamusTilesAnimation_AnimationDefinitions_E5D0                     ;92DA46;
    dw SamusTilesAnimation_AnimationDefinitions_E5A8                     ;92DA48;
    dw SamusTilesAnimation_AnimationDefinitions_E5D0                     ;92DA4A;
    dw SamusTilesAnimation_AnimationDefinitions_E5A8                     ;92DA4C;
    dw SamusTilesAnimation_AnimationDefinitions_E5D0                     ;92DA4E;
    dw SamusTilesAnimation_AnimationDefinitions_E6B8                     ;92DA50;
    dw SamusTilesAnimation_AnimationDefinitions_E728                     ;92DA52;
    dw SamusTilesAnimation_AnimationDefinitions_E2B8                     ;92DA54;
    dw SamusTilesAnimation_AnimationDefinitions_E374                     ;92DA56;
    dw SamusTilesAnimation_AnimationDefinitions_E440                     ;92DA58;
    dw SamusTilesAnimation_AnimationDefinitions_E448                     ;92DA5A;
    dw SamusTilesAnimation_AnimationDefinitions_E7E0                     ;92DA5C;
    dw SamusTilesAnimation_AnimationDefinitions_E7EC                     ;92DA5E;
    dw SamusTilesAnimation_AnimationDefinitions_DB48                     ;92DA60;
    dw SamusTilesAnimation_AnimationDefinitions_DB6C                     ;92DA62;
    dw SamusTilesAnimation_AnimationDefinitions_E7B0                     ;92DA64;
    dw SamusTilesAnimation_AnimationDefinitions_E7BC                     ;92DA66;
    dw SamusTilesAnimation_AnimationDefinitions_E7C8                     ;92DA68;
    dw SamusTilesAnimation_AnimationDefinitions_E7D4                     ;92DA6A;
    dw SamusTilesAnimation_AnimationDefinitions_E7F8                     ;92DA6C;
    dw SamusTilesAnimation_AnimationDefinitions_E804                     ;92DA6E;
    dw SamusTilesAnimation_AnimationDefinitions_E810                     ;92DA70;
    dw SamusTilesAnimation_AnimationDefinitions_E81C                     ;92DA72;
    dw SamusTilesAnimation_AnimationDefinitions_E7F8                     ;92DA74;
    dw SamusTilesAnimation_AnimationDefinitions_E804                     ;92DA76;
    dw SamusTilesAnimation_AnimationDefinitions_E810                     ;92DA78;
    dw SamusTilesAnimation_AnimationDefinitions_E81C                     ;92DA7A;
    dw SamusTilesAnimation_AnimationDefinitions_E7F8                     ;92DA7C;
    dw SamusTilesAnimation_AnimationDefinitions_E804                     ;92DA7E;
    dw SamusTilesAnimation_AnimationDefinitions_E810                     ;92DA80;
    dw SamusTilesAnimation_AnimationDefinitions_E81C                     ;92DA82;
    dw SamusTilesAnimation_AnimationDefinitions_EBA4                     ;92DA84;
    dw SamusTilesAnimation_AnimationDefinitions_E7B0                     ;92DA86;
    dw SamusTilesAnimation_AnimationDefinitions_E7BC                     ;92DA88;
    dw SamusTilesAnimation_AnimationDefinitions_E7F8                     ;92DA8A;
    dw SamusTilesAnimation_AnimationDefinitions_E804                     ;92DA8C;
    dw SamusTilesAnimation_AnimationDefinitions_E7F8                     ;92DA8E;
    dw SamusTilesAnimation_AnimationDefinitions_E804                     ;92DA90;
    dw SamusTilesAnimation_AnimationDefinitions_E7F8                     ;92DA92;
    dw SamusTilesAnimation_AnimationDefinitions_E804                     ;92DA94;
    dw SamusTilesAnimation_AnimationDefinitions_DB90                     ;92DA96;
    dw SamusTilesAnimation_AnimationDefinitions_DB98                     ;92DA98;
    dw SamusTilesAnimation_AnimationDefinitions_DBA0                     ;92DA9A;
    dw SamusTilesAnimation_AnimationDefinitions_DBAC                     ;92DA9C;
    dw SamusTilesAnimation_AnimationDefinitions_DB48                     ;92DA9E;
    dw SamusTilesAnimation_AnimationDefinitions_DB6C                     ;92DAA0;
    dw SamusTilesAnimation_AnimationDefinitions_E030                     ;92DAA2;
    dw SamusTilesAnimation_AnimationDefinitions_E034                     ;92DAA4;
    dw SamusTilesAnimation_AnimationDefinitions_DD28                     ;92DAA6;
    dw SamusTilesAnimation_AnimationDefinitions_DD30                     ;92DAA8;
    dw SamusTilesAnimation_AnimationDefinitions_DD18                     ;92DAAA;
    dw SamusTilesAnimation_AnimationDefinitions_DD20                     ;92DAAC;
    dw SamusTilesAnimation_AnimationDefinitions_DD68                     ;92DAAE;
    dw SamusTilesAnimation_AnimationDefinitions_DD70                     ;92DAB0;
    dw SamusTilesAnimation_AnimationDefinitions_E050                     ;92DAB2;
    dw SamusTilesAnimation_AnimationDefinitions_E158                     ;92DAB4;
    dw SamusTilesAnimation_AnimationDefinitions_DE18                     ;92DAB6;
    dw SamusTilesAnimation_AnimationDefinitions_DE3C                     ;92DAB8;
    dw SamusTilesAnimation_AnimationDefinitions_E438                     ;92DABA;
    dw SamusTilesAnimation_AnimationDefinitions_E43C                     ;92DABC;
    dw SamusTilesAnimation_AnimationDefinitions_E048                     ;92DABE;
    dw SamusTilesAnimation_AnimationDefinitions_E04C                     ;92DAC0;
    dw SamusTilesAnimation_AnimationDefinitions_E838                     ;92DAC2;
    dw SamusTilesAnimation_AnimationDefinitions_E83C                     ;92DAC4;
    dw SamusTilesAnimation_AnimationDefinitions_E840                     ;92DAC6;
    dw SamusTilesAnimation_AnimationDefinitions_E844                     ;92DAC8;
    dw SamusTilesAnimation_AnimationDefinitions_E860                     ;92DACA;
    dw SamusTilesAnimation_AnimationDefinitions_E798                     ;92DACC;
    dw SamusTilesAnimation_AnimationDefinitions_E7A4                     ;92DACE;
    dw SamusTilesAnimation_AnimationDefinitions_E7B0                     ;92DAD0;
    dw SamusTilesAnimation_AnimationDefinitions_E7BC                     ;92DAD2;
    dw SamusTilesAnimation_AnimationDefinitions_E7C8                     ;92DAD4;
    dw SamusTilesAnimation_AnimationDefinitions_E7D4                     ;92DAD6;
    dw SamusTilesAnimation_AnimationDefinitions_E530                     ;92DAD8;
    dw SamusTilesAnimation_AnimationDefinitions_E798                     ;92DADA;
    dw SamusTilesAnimation_AnimationDefinitions_DD98                     ;92DADC;
    dw SamusTilesAnimation_AnimationDefinitions_DDB0                     ;92DADE;
    dw SamusTilesAnimation_AnimationDefinitions_E880                     ;92DAE0;
    dw SamusTilesAnimation_AnimationDefinitions_E884                     ;92DAE2;
    dw SamusTilesAnimation_AnimationDefinitions_E878                     ;92DAE4;
    dw SamusTilesAnimation_AnimationDefinitions_E87C                     ;92DAE6;
    dw SamusTilesAnimation_AnimationDefinitions_E888                     ;92DAE8;
    dw SamusTilesAnimation_AnimationDefinitions_E88C                     ;92DAEA;
    dw SamusTilesAnimation_AnimationDefinitions_E028                     ;92DAEC;
    dw SamusTilesAnimation_AnimationDefinitions_E02C                     ;92DAEE;
    dw SamusTilesAnimation_AnimationDefinitions_E030                     ;92DAF0;
    dw SamusTilesAnimation_AnimationDefinitions_E034                     ;92DAF2;
    dw SamusTilesAnimation_AnimationDefinitions_E890                     ;92DAF4;
    dw SamusTilesAnimation_AnimationDefinitions_E8CC                     ;92DAF6;
    dw SamusTilesAnimation_AnimationDefinitions_DBF8                     ;92DAF8;
    dw SamusTilesAnimation_AnimationDefinitions_DC0C                     ;92DAFA;
    dw SamusTilesAnimation_AnimationDefinitions_E908                     ;92DAFC;
    dw SamusTilesAnimation_AnimationDefinitions_E920                     ;92DAFE;
    dw SamusTilesAnimation_AnimationDefinitions_DC20                     ;92DB00;
    dw SamusTilesAnimation_AnimationDefinitions_DC34                     ;92DB02;
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4D8            ;92DB04;
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4E4            ;92DB06;
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4F0            ;92DB08;
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4FC            ;92DB0A;
    dw SamusTilesAnimation_AnimationDefinitions_E530                     ;92DB0C;
    dw SamusTilesAnimation_AnimationDefinitions_DBB8                     ;92DB0E;
    dw SamusTilesAnimation_AnimationDefinitions_DBC0                     ;92DB10;
    dw SamusTilesAnimation_AnimationDefinitions_DBC8                     ;92DB12;
    dw SamusTilesAnimation_AnimationDefinitions_DBD0                     ;92DB14;
    dw SamusTilesAnimation_AnimationDefinitions_DBD8                     ;92DB16;
    dw SamusTilesAnimation_AnimationDefinitions_DBE0                     ;92DB18;
    dw SamusTilesAnimation_AnimationDefinitions_DBE8                     ;92DB1A;
    dw SamusTilesAnimation_AnimationDefinitions_DBF0                     ;92DB1C;
    dw SamusTilesAnimation_AnimationDefinitions_E938                     ;92DB1E;
    dw SamusTilesAnimation_AnimationDefinitions_E974                     ;92DB20;
    dw SamusTilesAnimation_AnimationDefinitions_E9F4                     ;92DB22;
    dw SamusTilesAnimation_AnimationDefinitions_EA0C                     ;92DB24;
    dw SamusTilesAnimation_AnimationDefinitions_E828                     ;92DB26;
    dw SamusTilesAnimation_AnimationDefinitions_E82C                     ;92DB28;
    dw SamusTilesAnimation_AnimationDefinitions_E830                     ;92DB2A;
    dw SamusTilesAnimation_AnimationDefinitions_E834                     ;92DB2C;
    dw SamusTilesAnimation_AnimationDefinitions_E848                     ;92DB2E;
    dw SamusTilesAnimation_AnimationDefinitions_DD80                     ;92DB30;
    dw SamusTilesAnimation_AnimationDefinitions_DD84                     ;92DB32;
    dw SamusTilesAnimation_AnimationDefinitions_DD88                     ;92DB34;
    dw SamusTilesAnimation_AnimationDefinitions_DD8C                     ;92DB36;
    dw SamusTilesAnimation_AnimationDefinitions_DD90                     ;92DB38;
    dw SamusTilesAnimation_AnimationDefinitions_DD94                     ;92DB3A;
    dw SamusTilesAnimation_AnimationDefinitions_DD80                     ;92DB3C;
    dw SamusTilesAnimation_AnimationDefinitions_DD84                     ;92DB3E;
    dw SamusTilesAnimation_AnimationDefinitions_DD88                     ;92DB40;
    dw SamusTilesAnimation_AnimationDefinitions_DD8C                     ;92DB42;
    dw SamusTilesAnimation_AnimationDefinitions_DD90                     ;92DB44;
    dw SamusTilesAnimation_AnimationDefinitions_DD94                     ;92DB46;


;;; $DB48: Samus tiles animation - animation definitions ;;;
SamusTilesAnimation_AnimationDefinitions_DB48:
; Animation definitions are indexed by [Samus animation frame]
; First byte indexes the top half tiles definitions pointer table ($D91E) for a pointer to a list of DMA entries that is indexed by the second byte
; Third byte indexes the bottom half tiles definitions pointer table ($D938) for a pointer to a list of DMA entries that is indexed by the fourth byte

; 01: Facing right - normal
; 47: Unused
; 89: Facing right - ran into a wall
; A8: Unused
    db $07,$0C,$00,$06, $07,$0D,$00,$0E, $07,$0E,$00,$0F, $07,$0D,$00,$0E ;92DB48;
    db $00,$00,$00,$00, $07,$0C,$00,$06, $07,$0D,$00,$0E, $07,$12,$00,$0F ;92DB58;
    db $07,$0D,$00,$0E                                                   ;92DB68;

SamusTilesAnimation_AnimationDefinitions_DB6C:
; 02: Facing left-   normal
; 48: Unused
; 8A: Facing left-   ran into a wall
; A9: Unused
    db $07,$0F,$00,$06, $07,$10,$00,$10, $07,$11,$00,$1D, $07,$10,$00,$10 ;92DB6C;
    db $00,$00,$00,$00, $07,$0F,$00,$06, $07,$10,$00,$10, $07,$13,$00,$1D ;92DB7C;
    db $07,$10,$00,$10                                                   ;92DB8C;

SamusTilesAnimation_AnimationDefinitions_DB90:
; A4: Facing right - landing from normal jump
    db $02,$00,$01,$06, $02,$04,$00,$06                                  ;92DB90;

SamusTilesAnimation_AnimationDefinitions_DB98:
; A5: Facing left-   landing from normal jump
    db $02,$01,$01,$07, $02,$05,$00,$06                                  ;92DB98;

SamusTilesAnimation_AnimationDefinitions_DBA0:
; A6: Facing right - landing from spin jump
    db $02,$04,$01,$19, $02,$00,$01,$06, $02,$04,$00,$06                 ;92DBA0;

SamusTilesAnimation_AnimationDefinitions_DBAC:
; A7: Facing left-   landing from spin jump
    db $02,$05,$01,$1A, $02,$01,$01,$07, $02,$05,$00,$06                 ;92DBAC;

SamusTilesAnimation_AnimationDefinitions_DBB8:
; E0: Facing right - landing from normal jump - aiming up
    db $00,$16,$01,$06, $00,$16,$00,$06                                  ;92DBB8;

SamusTilesAnimation_AnimationDefinitions_DBC0:
; E1: Facing left-   landing from normal jump - aiming up
    db $00,$17,$01,$07, $00,$17,$00,$06                                  ;92DBC0;

SamusTilesAnimation_AnimationDefinitions_DBC8:
; E2: Facing right - landing from normal jump - aiming up-right
    db $00,$12,$01,$06, $00,$12,$00,$06                                  ;92DBC8;

SamusTilesAnimation_AnimationDefinitions_DBD0:
; E3: Facing left-   landing from normal jump - aiming up-left
    db $00,$13,$01,$07, $00,$13,$00,$06                                  ;92DBD0;

SamusTilesAnimation_AnimationDefinitions_DBD8:
; E4: Facing right - landing from normal jump - aiming down-right
    db $00,$0E,$01,$06, $00,$0E,$00,$06                                  ;92DBD8;

SamusTilesAnimation_AnimationDefinitions_DBE0:
; E5: Facing left-   landing from normal jump - aiming down-left
    db $00,$0F,$01,$07, $00,$0F,$00,$06                                  ;92DBE0;

SamusTilesAnimation_AnimationDefinitions_DBE8:
; E6: Facing right - landing from normal jump - firing
    db $00,$10,$01,$06, $00,$10,$00,$06                                  ;92DBE8;

SamusTilesAnimation_AnimationDefinitions_DBF0:
; E7: Facing left-   landing from normal jump - firing
    db $00,$11,$01,$07, $00,$11,$00,$06                                  ;92DBF0;

SamusTilesAnimation_AnimationDefinitions_DBF8:
; D5: Facing right - x-ray - standing
    db $02,$09,$00,$06, $02,$08,$00,$06, $00,$10,$00,$06, $02,$0A,$00,$06 ;92DBF8;
    db $02,$0B,$00,$06                                                   ;92DC08;

SamusTilesAnimation_AnimationDefinitions_DC0C:
; D6: Facing left-   x-ray - standing
    db $02,$0D,$00,$06, $02,$0C,$00,$06, $00,$11,$00,$06, $02,$0E,$00,$06 ;92DC0C;
    db $02,$0F,$00,$06                                                   ;92DC1C;

SamusTilesAnimation_AnimationDefinitions_DC20:
; D9: Facing right - x-ray - crouching
    db $02,$09,$00,$07, $02,$08,$00,$07, $00,$10,$00,$07, $02,$0A,$00,$07 ;92DC20;
    db $02,$0B,$00,$07                                                   ;92DC30;

SamusTilesAnimation_AnimationDefinitions_DC34:
; DA: Facing left-   x-ray - crouching
    db $02,$0D,$00,$07, $02,$0C,$00,$07, $00,$11,$00,$07, $02,$0E,$00,$07 ;92DC34;
    db $02,$0F,$00,$07                                                   ;92DC44;

SamusTilesAnimation_AnimationDefinitions_DC48:
; 09: Moving right - not aiming
    db $00,$00,$00,$00, $01,$0D,$00,$08, $00,$02,$00,$01, $00,$03,$00,$09 ;92DC48;
    db $00,$01,$00,$02, $00,$00,$00,$03, $01,$0E,$00,$0A, $00,$05,$00,$04 ;92DC58;
    db $00,$18,$00,$0B, $00,$04,$00,$05                                  ;92DC68;

SamusTilesAnimation_AnimationDefinitions_DC70:
; 0A: Moving left-   not aiming
    db $00,$06,$00,$00, $01,$0F,$00,$08, $00,$08,$00,$01, $00,$09,$00,$09 ;92DC70;
    db $00,$07,$00,$02, $00,$06,$00,$03, $01,$10,$00,$0A, $00,$0B,$00,$04 ;92DC80;
    db $00,$19,$00,$0B, $00,$0A,$00,$05                                  ;92DC90;

SamusTilesAnimation_AnimationDefinitions_DC98:
; 0B: Moving right - gun extended
    db $09,$00,$00,$00, $09,$0E,$00,$08, $09,$02,$00,$01, $09,$03,$00,$09 ;92DC98;
    db $09,$01,$00,$02, $09,$00,$00,$03, $09,$04,$00,$0A, $09,$05,$00,$04 ;92DCA8;
    db $09,$0C,$00,$0B, $09,$04,$00,$05                                  ;92DCB8;

SamusTilesAnimation_AnimationDefinitions_DCC0:
; 0C: Moving left-   gun extended
    db $09,$06,$00,$00, $09,$0F,$00,$08, $09,$09,$00,$01, $09,$08,$00,$09 ;92DCC0;
    db $09,$07,$00,$02, $09,$06,$00,$03, $09,$0A,$00,$0A, $09,$0D,$00,$04 ;92DCD0;
    db $09,$0B,$00,$0B, $09,$0A,$00,$05                                  ;92DCE0;

SamusTilesAnimation_AnimationDefinitions_DCE8:
; 49: Facing left-   moonwalk
    db $00,$11,$01,$03, $02,$1B,$01,$04, $02,$1B,$01,$15, $00,$11,$01,$00 ;92DCE8;
    db $02,$1B,$01,$05, $02,$1B,$01,$16                                  ;92DCF8;

SamusTilesAnimation_AnimationDefinitions_DD00:
; 4A: Facing right - moonwalk
    db $00,$10,$01,$03, $02,$1A,$01,$04, $02,$1A,$01,$17, $00,$10,$01,$00 ;92DD00;
    db $02,$1A,$01,$05, $02,$1A,$01,$18                                  ;92DD10;

SamusTilesAnimation_AnimationDefinitions_DD18:
; 17: Facing right - normal jump - aiming down
; AE: Unused
    db $00,$0C,$01,$0A, $01,$1A,$01,$11                                  ;92DD18;

SamusTilesAnimation_AnimationDefinitions_DD20:
; 18: Facing left-   normal jump - aiming down
; AF: Unused
    db $00,$0D,$01,$0B, $01,$1B,$01,$12                                  ;92DD20;

SamusTilesAnimation_AnimationDefinitions_DD28:
; 13: Facing right - normal jump - not aiming - not moving - gun extended
; AC: Unused
    db $00,$10,$01,$0A, $00,$10,$01,$19                                  ;92DD28;

SamusTilesAnimation_AnimationDefinitions_DD30:
; 14: Facing left-   normal jump - not aiming - not moving - gun extended
; AD: Unused
    db $00,$11,$01,$0B, $00,$11,$01,$1A                                  ;92DD30;

SamusTilesAnimation_AnimationDefinitions_DD38:
; 15: Facing right - normal jump - aiming up
    db $00,$12,$01,$0A, $00,$16,$00,$13                                  ;92DD38;

SamusTilesAnimation_AnimationDefinitions_DD40:
; 16: Facing left-   normal jump - aiming up
    db $00,$13,$01,$0B, $00,$17,$00,$14                                  ;92DD40;

SamusTilesAnimation_AnimationDefinitions_DD48:
; 51: Facing right - normal jump - not aiming - moving forward
    db $00,$10,$01,$0A, $00,$10,$01,$19                                  ;92DD48;

SamusTilesAnimation_AnimationDefinitions_DD50:
; 52: Facing left-   normal jump - not aiming - moving forward
    db $00,$11,$01,$0B, $00,$11,$01,$1A                                  ;92DD50;

SamusTilesAnimation_AnimationDefinitions_DD58:
; 69: Facing right - normal jump - aiming up-right
    db $00,$1A,$01,$0A, $00,$1A,$00,$13                                  ;92DD58;

SamusTilesAnimation_AnimationDefinitions_DD60:
; 6A: Facing left-   normal jump - aiming up-left
    db $00,$1B,$01,$0B, $00,$1B,$00,$14                                  ;92DD60;

SamusTilesAnimation_AnimationDefinitions_DD68:
; 6B: Facing right - normal jump - aiming down-right
; B0: Unused
    db $00,$0C,$01,$0A, $00,$0C,$01,$19                                  ;92DD68;

SamusTilesAnimation_AnimationDefinitions_DD70:
; 6C: Facing left-   normal jump - aiming down-left
; B1: Unused
    db $00,$0D,$01,$0B, $00,$0D,$01,$1A                                  ;92DD70;

SamusTilesAnimation_AnimationDefinitions_DD78:
; 4B: Facing right - normal jump transition
    db $02,$00,$01,$06                                                   ;92DD78;

SamusTilesAnimation_AnimationDefinitions_DD7C:
; 4C: Facing left-   normal jump transition
    db $02,$01,$01,$07                                                   ;92DD7C;

SamusTilesAnimation_AnimationDefinitions_DD80:
; 55: Facing right - normal jump transition - aiming up
; F1: Facing right - crouching transition - aiming up
; F7: Facing right - standing transition - aiming up
    db $00,$16,$01,$06                                                   ;92DD80;

SamusTilesAnimation_AnimationDefinitions_DD84:
; 56: Facing left-   normal jump transition - aiming up
; F2: Facing left-   crouching transition - aiming up
; F8: Facing left-   standing transition - aiming up
    db $00,$17,$01,$07                                                   ;92DD84;

SamusTilesAnimation_AnimationDefinitions_DD88:
; 57: Facing right - normal jump transition - aiming up-right
; F3: Facing right - crouching transition - aiming up-right
; F9: Facing right - standing transition - aiming up-right
    db $00,$12,$01,$06                                                   ;92DD88;

SamusTilesAnimation_AnimationDefinitions_DD8C:
; 58: Facing left-   normal jump transition - aiming up-left
; F4: Facing left-   crouching transition - aiming up-left
; FA: Facing left-   standing transition - aiming up-left
    db $00,$13,$01,$07                                                   ;92DD8C;

SamusTilesAnimation_AnimationDefinitions_DD90:
; 59: Facing right - normal jump transition - aiming down-right
; F5: Facing right - crouching transition - aiming down-right
; FB: Facing right - standing transition - aiming down-right
    db $00,$0E,$01,$06                                                   ;92DD90;

SamusTilesAnimation_AnimationDefinitions_DD94:
; 5A: Facing left-   normal jump transition - aiming down-left
; F6: Facing left-   crouching transition - aiming down-left
; FC: Facing left-   standing transition - aiming down-left
    db $00,$0F,$01,$07                                                   ;92DD94;

SamusTilesAnimation_AnimationDefinitions_DD98:
; 4D: Facing right - normal jump - not aiming - not moving - gun not extended
; C7: Facing right - vertical shinespark windup
    db $00,$04,$00,$03, $00,$05,$01,$0E, $00,$04,$01,$08, $00,$00,$01,$08 ;92DD98;
    db $00,$01,$01,$0A, $00,$14,$01,$0C                                  ;92DDA8;

SamusTilesAnimation_AnimationDefinitions_DDB0:
; 4E: Facing left-   normal jump - not aiming - not moving - gun not extended
; C8: Facing left-   vertical shinespark windup
    db $00,$0A,$00,$03, $00,$0B,$01,$0F, $00,$0A,$01,$09, $00,$06,$01,$09 ;92DDB0;
    db $00,$07,$01,$0B, $00,$15,$01,$0D                                  ;92DDC0;

SamusTilesAnimation_AnimationDefinitions_DDC8:
; 4F: Facing left-   damage boost
    db $02,$05,$00,$11, $02,$05,$01,$0B, $0A,$0F,$00,$00, $0A,$0E,$00,$00 ;92DDC8;
    db $0A,$0D,$00,$00, $0A,$0C,$00,$00, $0A,$0B,$00,$00, $0A,$0A,$00,$00 ;92DDD8;
    db $0A,$09,$00,$00, $02,$1F,$01,$1A                                  ;92DDE8;

SamusTilesAnimation_AnimationDefinitions_DDF0:
; 50: Facing right - damage boost
    db $02,$04,$00,$12, $02,$04,$01,$0A, $0A,$0F,$00,$00, $0A,$0E,$00,$00 ;92DDF0;
    db $0A,$0D,$00,$00, $0A,$0C,$00,$00, $0A,$0B,$00,$00, $0A,$0A,$00,$00 ;92DE00;
    db $0A,$09,$00,$00, $02,$1D,$01,$19                                  ;92DE10;

SamusTilesAnimation_AnimationDefinitions_DE18:
; 27: Facing right - crouching
; B4: Unused
    db $07,$0C,$00,$07, $07,$0D,$00,$07, $07,$0E,$00,$07, $07,$0D,$00,$07 ;92DE18;
    db $00,$00,$00,$00, $07,$0C,$00,$07, $07,$0D,$00,$07, $07,$12,$00,$07 ;92DE28;
    db $07,$0D,$00,$07                                                   ;92DE38;

SamusTilesAnimation_AnimationDefinitions_DE3C:
; 28: Facing left-   crouching
; B5: Unused
    db $07,$0F,$00,$07, $07,$10,$00,$07, $07,$11,$00,$07, $07,$10,$00,$07 ;92DE3C;
    db $00,$00,$00,$00, $07,$0F,$00,$07, $07,$10,$00,$07, $07,$13,$00,$07 ;92DE4C;
    db $07,$10,$00,$07                                                   ;92DE5C;

SamusTilesAnimation_AnimationDefinitions_DE60:
; 29: Facing right - falling
    db $02,$04,$01,$0A, $02,$1C,$01,$0C, $02,$1D,$01,$0C, $00,$00,$00,$00 ;92DE60;
    db $00,$00,$00,$00, $02,$1C,$01,$0A, $02,$04,$01,$19                 ;92DE70;

SamusTilesAnimation_AnimationDefinitions_DE7C:
; 2A: Facing left-   falling
    db $02,$05,$01,$0B, $02,$1E,$01,$0D, $02,$1F,$01,$0D, $00,$00,$00,$00 ;92DE7C;
    db $00,$00,$00,$00, $02,$1E,$01,$0B, $02,$05,$01,$1A                 ;92DE8C;

SamusTilesAnimation_AnimationDefinitions_DE98:
; 2B: Facing right - falling - aiming up
    db $00,$12,$01,$0A, $00,$16,$01,$0C, $00,$16,$01,$19                 ;92DE98;

SamusTilesAnimation_AnimationDefinitions_DEA4:
; 2C: Facing left-   falling - aiming up
    db $00,$13,$01,$0B, $00,$17,$01,$0D, $00,$17,$01,$1A                 ;92DEA4;

SamusTilesAnimation_AnimationDefinitions_DEB0:
; 2D: Facing right - falling - aiming down
    db $00,$0C,$01,$0A, $01,$1A,$01,$11                                  ;92DEB0;

SamusTilesAnimation_AnimationDefinitions_DEB8:
; 2E: Facing left-   falling - aiming down
    db $00,$0D,$01,$0B, $01,$1B,$01,$12                                  ;92DEB8;

SamusTilesAnimation_AnimationDefinitions_DEC0:
; 67: Facing right - falling - gun extended
    db $00,$10,$01,$0A, $00,$10,$01,$0C, $00,$10,$01,$0C, $00,$00,$00,$00 ;92DEC0;
    db $00,$00,$00,$00, $00,$10,$01,$0A, $00,$10,$01,$19                 ;92DED0;

SamusTilesAnimation_AnimationDefinitions_DEDC:
; 68: Facing left-   falling - gun extended
    db $00,$11,$01,$0B, $00,$11,$01,$0D, $00,$11,$01,$0D, $00,$00,$00,$00 ;92DEDC;
    db $00,$00,$00,$00, $00,$11,$01,$0B, $00,$11,$01,$1A                 ;92DEEC;

SamusTilesAnimation_AnimationDefinitions_DEF8:
; 6D: Facing right - falling - aiming up-right
    db $00,$1A,$01,$0A, $00,$1A,$01,$0C, $00,$1A,$01,$19                 ;92DEF8;

SamusTilesAnimation_AnimationDefinitions_DF04:
; 6E: Facing left-   falling - aiming up-left
    db $00,$1B,$01,$0B, $00,$1B,$01,$0D, $00,$1B,$01,$1A                 ;92DF04;

SamusTilesAnimation_AnimationDefinitions_DF10:
; 6F: Facing right - falling - aiming down-right
    db $00,$0C,$01,$0A, $00,$0C,$01,$0C, $00,$0C,$01,$19                 ;92DF10;

SamusTilesAnimation_AnimationDefinitions_DF1C:
; 70: Facing left-   falling - aiming down-left
    db $00,$0D,$01,$0B, $00,$0D,$01,$0D, $00,$0D,$01,$1A                 ;92DF1C;

SamusTilesAnimation_AnimationDefinitions_DF28:
; 0D: Moving right - aiming up (unused)
    db $00,$16,$00,$00, $00,$16,$00,$08, $02,$0E,$00,$01, $02,$1E,$00,$09 ;92DF28;
    db $02,$0E,$00,$02, $00,$16,$00,$03, $00,$16,$00,$0A, $02,$0E,$00,$04 ;92DF38;
    db $02,$1E,$00,$0B, $02,$0E,$00,$05                                  ;92DF48;

SamusTilesAnimation_AnimationDefinitions_DF50:
; 0E: Moving left-   aiming up (unused)
    db $00,$17,$00,$00, $00,$17,$00,$08, $02,$0F,$00,$01, $02,$1F,$00,$09 ;92DF50;
    db $02,$0F,$00,$02, $00,$17,$00,$03, $00,$17,$00,$0A, $02,$0F,$00,$04 ;92DF60;
    db $02,$1F,$00,$0B, $02,$0F,$00,$05                                  ;92DF70;

SamusTilesAnimation_AnimationDefinitions_DF78:
; 0F: Moving right - aiming up-right
    db $00,$1A,$00,$00, $00,$1A,$00,$08, $02,$10,$00,$01, $02,$16,$00,$09 ;92DF78;
    db $02,$10,$00,$02, $00,$1A,$00,$03, $00,$1A,$00,$0A, $02,$10,$00,$04 ;92DF88;
    db $02,$16,$00,$0B, $02,$10,$00,$05                                  ;92DF98;

SamusTilesAnimation_AnimationDefinitions_DFA0:
; 10: Moving left-   aiming up-left
    db $00,$1B,$00,$00, $00,$1B,$00,$08, $02,$11,$00,$01, $02,$17,$00,$09 ;92DFA0;
    db $02,$11,$00,$02, $00,$1B,$00,$03, $00,$1B,$00,$0A, $02,$11,$00,$04 ;92DFB0;
    db $02,$17,$00,$0B, $02,$11,$00,$05                                  ;92DFC0;

SamusTilesAnimation_AnimationDefinitions_DFC8:
; 11: Moving right - aiming down-right
    db $00,$0C,$00,$00, $00,$0C,$00,$08, $02,$06,$00,$01, $02,$18,$00,$09 ;92DFC8;
    db $02,$06,$00,$02, $00,$0C,$00,$03, $00,$0C,$00,$0A, $02,$06,$00,$04 ;92DFD8;
    db $02,$18,$00,$0B, $02,$06,$00,$05                                  ;92DFE8;

SamusTilesAnimation_AnimationDefinitions_DFF0:
; 12: Moving left-   aiming down-left
    db $00,$0D,$00,$00, $00,$0D,$00,$08, $02,$07,$00,$01, $02,$19,$00,$09 ;92DFF0;
    db $02,$07,$00,$02, $00,$0D,$00,$03, $00,$0D,$00,$0A, $02,$07,$00,$04 ;92E000;
    db $02,$19,$00,$0B, $02,$07,$00,$05                                  ;92E010;

SamusTilesAnimation_AnimationDefinitions_E018:
; 03: Facing right - aiming up
    db $00,$12,$0A,$00, $00,$16,$0A,$00                                  ;92E018;

SamusTilesAnimation_AnimationDefinitions_E020:
; 04: Facing left-   aiming up
    db $00,$13,$0A,$01, $00,$17,$0A,$01                                  ;92E020;

SamusTilesAnimation_AnimationDefinitions_E028:
; 05: Facing right - aiming up-right
; CF: Facing right - ran into a wall - aiming up-right
    db $00,$12,$0A,$00                                                   ;92E028;

SamusTilesAnimation_AnimationDefinitions_E02C:
; 06: Facing left-   aiming up-left
; D0: Facing left-   ran into a wall - aiming up-left
    db $00,$13,$0A,$01                                                   ;92E02C;

SamusTilesAnimation_AnimationDefinitions_E030:
; 07: Facing right - aiming down-right
; AA: Unused
; D1: Facing right - ran into a wall - aiming down-right
    db $00,$0E,$0A,$00                                                   ;92E030;

SamusTilesAnimation_AnimationDefinitions_E034:
; 08: Facing left-   aiming down-left
; AB: Unused
; D2: Facing left-   ran into a wall - aiming down-left
    db $00,$0F,$0A,$01                                                   ;92E034;

SamusTilesAnimation_AnimationDefinitions_E038:
; 53: Facing right - knockback
    db $00,$1D,$01,$0C, $00,$1D,$01,$1B                                  ;92E038;

SamusTilesAnimation_AnimationDefinitions_E040:
; 54: Facing left-   knockback
    db $00,$1C,$01,$0D, $00,$1C,$01,$1C                                  ;92E040;

SamusTilesAnimation_AnimationDefinitions_E048:
; 45: Unused
; 46: Unused
; 5B: Unused
; B8: Facing left-   grapple wall jump pose
    db $01,$0C,$00,$1A                                                   ;92E048;

SamusTilesAnimation_AnimationDefinitions_E04C:
; 5C: Unused
; B9: Facing right - grapple wall jump pose
    db $01,$0B,$00,$19                                                   ;92E04C;

SamusTilesAnimation_AnimationDefinitions_E050:
; 5D: Unused
; 5E: Unused
; 5F: Unused
; 60: Unused
; 61: Unused
; B2: Facing clockwise   -   grapple
    db $05,$08,$04,$05, $05,$07,$04,$04, $05,$06,$04,$03, $05,$05,$04,$02 ;92E050;
    db $05,$04,$04,$02, $05,$03,$04,$01, $05,$02,$04,$01, $05,$01,$04,$00 ;92E060;
    db $05,$00,$04,$00, $03,$0F,$04,$00, $03,$0E,$02,$09, $03,$0D,$02,$09 ;92E070;
    db $03,$0C,$02,$08, $03,$0B,$02,$08, $03,$0A,$02,$07, $03,$09,$02,$06 ;92E080;
    db $03,$08,$02,$05, $03,$07,$02,$04, $03,$06,$02,$03, $03,$05,$02,$02 ;92E090;
    db $03,$04,$02,$02, $03,$03,$02,$01, $03,$02,$02,$01, $03,$01,$02,$00 ;92E0A0;
    db $03,$00,$02,$00, $05,$0F,$02,$00, $05,$0E,$04,$09, $05,$0D,$04,$09 ;92E0B0;
    db $05,$0C,$04,$08, $05,$0B,$04,$08, $05,$0A,$04,$07, $05,$09,$04,$06 ;92E0C0;
    db $05,$08,$04,$12, $05,$07,$04,$11, $05,$06,$04,$10, $05,$05,$04,$0F ;92E0D0;
    db $05,$04,$04,$0F, $05,$03,$04,$0E, $05,$02,$04,$0E, $05,$01,$04,$0D ;92E0E0;
    db $05,$00,$04,$0D, $03,$0F,$04,$0D, $03,$0E,$02,$16, $03,$0D,$02,$16 ;92E0F0;
    db $03,$0C,$02,$15, $03,$0B,$02,$15, $03,$0A,$02,$14, $03,$09,$02,$13 ;92E100;
    db $03,$08,$02,$12, $03,$07,$02,$11, $03,$06,$02,$10, $03,$05,$02,$0F ;92E110;
    db $03,$04,$02,$0F, $03,$03,$02,$0E, $03,$02,$02,$0E, $03,$01,$02,$0D ;92E120;
    db $03,$00,$02,$0D, $05,$0F,$02,$0D, $05,$0E,$04,$15, $05,$0D,$04,$15 ;92E130;
    db $05,$0C,$04,$14, $05,$0B,$04,$14, $05,$0A,$04,$13, $05,$09,$04,$12 ;92E140;
    db $03,$08,$02,$0B, $03,$08,$02,$0C                                  ;92E150;

SamusTilesAnimation_AnimationDefinitions_E158:
; 62: Unused
; B3: Facing anticlockwise - grapple
    db $06,$08,$06,$05, $06,$09,$06,$06, $06,$0A,$06,$07, $06,$0B,$06,$08 ;92E158;
    db $06,$0C,$06,$08, $06,$0D,$06,$09, $06,$0E,$06,$09, $06,$0F,$05,$00 ;92E168;
    db $04,$00,$05,$00, $04,$01,$05,$00, $04,$02,$05,$01, $04,$03,$05,$01 ;92E178;
    db $04,$04,$05,$02, $04,$05,$05,$02, $04,$06,$05,$03, $04,$07,$05,$04 ;92E188;
    db $04,$08,$05,$05, $04,$09,$05,$06, $04,$0A,$05,$07, $04,$0B,$05,$08 ;92E198;
    db $04,$0C,$05,$08, $04,$0D,$05,$09, $04,$0E,$05,$09, $04,$0F,$06,$00 ;92E1A8;
    db $06,$00,$06,$00, $06,$01,$06,$00, $06,$02,$06,$01, $06,$03,$06,$01 ;92E1B8;
    db $06,$04,$06,$02, $06,$05,$06,$02, $06,$06,$06,$03, $06,$07,$06,$04 ;92E1C8;
    db $06,$08,$06,$12, $06,$09,$06,$13, $06,$0A,$06,$14, $06,$0B,$06,$15 ;92E1D8;
    db $06,$0C,$06,$15, $06,$0D,$06,$16, $06,$0E,$06,$16, $06,$0F,$05,$0D ;92E1E8;
    db $04,$00,$05,$0D, $04,$01,$05,$0D, $04,$02,$05,$0E, $04,$03,$05,$0E ;92E1F8;
    db $04,$04,$05,$0F, $04,$05,$05,$0F, $04,$06,$05,$10, $04,$07,$05,$11 ;92E208;
    db $04,$08,$05,$12, $04,$09,$05,$13, $04,$0A,$05,$14, $04,$0B,$05,$15 ;92E218;
    db $04,$0C,$05,$15, $04,$0D,$05,$16, $04,$0E,$05,$16, $04,$0F,$06,$0D ;92E228;
    db $06,$00,$06,$0D, $06,$01,$06,$0D, $06,$02,$06,$0E, $06,$03,$06,$0E ;92E238;
    db $06,$04,$06,$0F, $06,$05,$06,$0F, $06,$06,$06,$10, $06,$07,$06,$11 ;92E248;
    db $04,$08,$05,$0B, $04,$08,$05,$0C                                  ;92E258;

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E260:
; 63: Unused
    db $01,$14,$01,$15,$01,$0C,$00,$1A                                   ;92E260;

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E268:
; 64: Unused
    db $01,$15,$01,$16, $01,$0B,$00,$19                                  ;92E268;

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E270:
; 65: Unused
    db $01,$12,$01,$13, $0A,$10,$00,$00, $0A,$11,$00,$00, $0A,$12,$00,$00 ;92E270;
    db $0A,$13,$00,$00, $0A,$14,$00,$00, $0A,$15,$00,$00, $0A,$16,$00,$00 ;92E280;
    db $0A,$17,$00,$00                                                   ;92E290;

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E294:
; 66: Unused
    db $01,$13,$01,$14, $0A,$10,$00,$00, $0A,$11,$00,$00, $0A,$12,$00,$00 ;92E294;
    db $0A,$13,$00,$00, $0A,$14,$00,$00, $0A,$15,$00,$00, $0A,$16,$00,$00 ;92E2A4;
    db $0A,$17,$00,$00                                                   ;92E2B4;

SamusTilesAnimation_AnimationDefinitions_E2B8:
; 83: Facing right - wall jump
    db $01,$12,$01,$13, $02,$04,$01,$19, $00,$00,$00,$00, $0A,$08,$00,$00 ;92E2B8;
    db $0A,$09,$00,$00, $0A,$0A,$00,$00, $0A,$0B,$00,$00, $0A,$0C,$00,$00 ;92E2C8;
    db $0A,$0D,$00,$00, $0A,$0E,$00,$00, $0A,$0F,$00,$00, $00,$00,$00,$00 ;92E2D8;
    db $00,$00,$00,$00, $0A,$14,$09,$00, $0A,$14,$09,$01, $0A,$14,$09,$02 ;92E2E8;
    db $0A,$14,$09,$03, $0A,$14,$09,$04, $0A,$14,$09,$05, $0A,$14,$09,$06 ;92E2F8;
    db $0A,$14,$09,$07, $00,$00,$00,$00, $00,$00,$00,$00, $0A,$10,$09,$00 ;92E308;
    db $0A,$10,$09,$01, $0A,$10,$09,$02, $0A,$14,$09,$03, $0A,$14,$09,$04 ;92E318;
    db $0A,$14,$09,$05, $0A,$11,$09,$06, $0A,$11,$09,$07, $0A,$11,$09,$00 ;92E328;
    db $0A,$14,$09,$01, $0A,$14,$09,$02, $0A,$14,$09,$03, $0A,$12,$09,$04 ;92E338;
    db $0A,$12,$09,$05, $0A,$12,$09,$06, $0A,$14,$09,$07, $0A,$14,$09,$00 ;92E348;
    db $0A,$14,$09,$01, $0A,$13,$09,$02, $0A,$13,$09,$03, $0A,$13,$09,$04 ;92E358;
    db $0A,$14,$09,$05, $0A,$14,$09,$06, $0A,$14,$09,$07                 ;92E368;

SamusTilesAnimation_AnimationDefinitions_E374:
; 84: Facing left-   wall jump
    db $01,$13,$01,$14, $02,$05,$01,$1A, $00,$00,$00,$00, $0A,$08,$00,$00 ;92E374;
    db $0A,$09,$00,$00, $0A,$0A,$00,$00, $0A,$0B,$00,$00, $0A,$0C,$00,$00 ;92E384;
    db $0A,$0D,$00,$00, $0A,$0E,$00,$00, $0A,$0F,$00,$00, $00,$00,$00,$00 ;92E394;
    db $00,$00,$00,$00, $0A,$14,$09,$00, $0A,$14,$09,$01, $0A,$14,$09,$02 ;92E3A4;
    db $0A,$14,$09,$03, $0A,$14,$09,$04, $0A,$14,$09,$05, $0A,$14,$09,$06 ;92E3B4;
    db $0A,$14,$09,$07, $00,$00,$00,$00, $00,$00,$00,$00, $0A,$10,$09,$00 ;92E3C4;
    db $0A,$10,$09,$01, $0A,$10,$09,$02, $0A,$14,$09,$03, $0A,$14,$09,$04 ;92E3D4;
    db $0A,$14,$09,$05, $0A,$11,$09,$06, $0A,$11,$09,$07, $0A,$11,$09,$00 ;92E3E4;
    db $0A,$14,$09,$01, $0A,$14,$09,$02, $0A,$14,$09,$03, $0A,$12,$09,$04 ;92E3F4;
    db $0A,$12,$09,$05, $0A,$12,$09,$06, $0A,$14,$09,$07, $0A,$14,$09,$00 ;92E404;
    db $0A,$14,$09,$01, $0A,$13,$09,$02, $0A,$13,$09,$03, $0A,$13,$09,$04 ;92E414;
    db $0A,$14,$09,$05, $0A,$14,$09,$06, $0A,$14,$09,$07                 ;92E424;

SamusTilesAnimation_AnimationDefinitions_E430:
; 71: Facing right - crouching - aiming up-right
    db $00,$12,$00,$07                                                   ;92E430;

SamusTilesAnimation_AnimationDefinitions_E434:
; 72: Facing left-   crouching - aiming up-left
    db $00,$13,$00,$07                                                   ;92E434;

SamusTilesAnimation_AnimationDefinitions_E438:
; 73: Facing right - crouching - aiming down-right
; B6: Unused
    db $00,$0E,$00,$07                                                   ;92E438;

SamusTilesAnimation_AnimationDefinitions_E43C:
; 74: Facing left-   crouching - aiming down-left
; B7: Unused
    db $00,$0F,$00,$07                                                   ;92E43C;

SamusTilesAnimation_AnimationDefinitions_E440:
; 85: Facing right - crouching - aiming up
    db $00,$12,$00,$07, $00,$16,$00,$07                                  ;92E440;

SamusTilesAnimation_AnimationDefinitions_E448:
; 86: Facing left-   crouching - aiming up
    db $00,$13,$00,$07, $00,$17,$00,$07                                  ;92E448;

SamusTilesAnimation_AnimationDefinitions_E450:
; 75: Facing left-   moonwalk - aiming up-left
    db $00,$1B,$01,$03, $02,$11,$01,$04, $02,$11,$01,$17, $00,$1B,$01,$00 ;92E450;
    db $02,$11,$01,$05, $02,$11,$01,$18                                  ;92E460;

SamusTilesAnimation_AnimationDefinitions_E468:
; 76: Facing right - moonwalk - aiming up-right
    db $00,$1A,$01,$03, $02,$10,$01,$04, $02,$10,$01,$17, $00,$1A,$01,$00 ;92E468;
    db $02,$10,$01,$05, $02,$10,$01,$18                                  ;92E478;

SamusTilesAnimation_AnimationDefinitions_E480:
; 77: Facing left-   moonwalk - aiming down-left
    db $00,$0D,$01,$03, $02,$07,$01,$04, $02,$07,$01,$17, $00,$0D,$01,$00 ;92E480;
    db $02,$07,$01,$05, $02,$07,$01,$18                                  ;92E490;

SamusTilesAnimation_AnimationDefinitions_E498:
; 78: Facing right - moonwalk - aiming down-right
    db $00,$0C,$01,$03, $02,$06,$01,$04, $02,$06,$01,$17, $00,$0C,$01,$00 ;92E498;
    db $02,$06,$01,$05, $02,$06,$01,$18                                  ;92E4A8;

SamusTilesAnimation_AnimationDefinitions_E4B0:
; 35: Facing right - crouching transition
; 3B: Facing right - standing transition
    db $00,$10,$01,$06                                                   ;92E4B0;

SamusTilesAnimation_AnimationDefinitions_E4B4:
; 36: Facing left-   crouching transition
; 3C: Facing left-   standing transition
    db $00,$11,$01,$07                                                   ;92E4B4;

SamusTilesAnimation_AnimationDefinitions_E4B8:
; 37: Facing right - morphing transition
    db $0B,$06,$00,$00, $0B,$05,$00,$00                                  ;92E4B8;

SamusTilesAnimation_AnimationDefinitions_E4C0:
; 38: Facing left-   morphing transition
    db $0B,$04,$00,$00, $0B,$03,$00,$00                                  ;92E4C0;

SamusTilesAnimation_AnimationDefinitions_E4C8:
; 3D: Facing right - unmorphing transition
    db $0B,$05,$00,$00, $0B,$06,$00,$00                                  ;92E4C8;

SamusTilesAnimation_AnimationDefinitions_E4D0:
; 3E: Facing left-   unmorphing transition
    db $0B,$03,$00,$00, $0B,$04,$00,$00                                  ;92E4D0;

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4D8:
; DB: Unused
    db $00,$10,$01,$06, $0B,$06,$00,$00, $0B,$05,$00,$00                 ;92E4D8;

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4E4:
; DC: Unused
    db $00,$11,$01,$06, $0B,$04,$00,$00, $0B,$03,$00,$00                 ;92E4E4;

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4F0:
; DD: Unused
    db $0B,$05,$00,$00, $0B,$06,$00,$00, $00,$10,$01,$06                 ;92E4F0;

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4FC:
; DE: Unused
    db $0B,$03,$00,$00, $0B,$04,$00,$00, $00,$11,$01,$06                 ;92E4FC;

SamusTilesAnimation_AnimationDefinitions_E508:
; 1D: Facing right - morph ball - no springball - on ground
; 31: Facing right - morph ball - no springball - in air
; 32: Facing left-   morph ball - no springball - in air
; 3F: Unused
; 40: Unused
    db $0A,$00,$00,$00, $0A,$04,$00,$00, $0A,$01,$00,$00, $0A,$05,$00,$00 ;92E508;
    db $0A,$02,$00,$00, $0A,$06,$00,$00, $0A,$03,$00,$00, $0A,$07,$00,$00 ;92E518;
    db $00,$00,$00,$00, $0B,$01,$00,$00                                  ;92E528;

SamusTilesAnimation_AnimationDefinitions_E530:
; 41: Facing left-   morph ball - no springball - on ground
; C5: Unused
; DF: Unused
    db $0A,$07,$00,$00, $0A,$03,$00,$00, $0A,$06,$00,$00, $0A,$02,$00,$00 ;92E530;
    db $0A,$05,$00,$00, $0A,$01,$00,$00, $0A,$04,$00,$00, $0A,$00,$00,$00 ;92E540;
    db $00,$00,$00,$00, $0B,$01,$00,$00                                  ;92E550;

SamusTilesAnimation_AnimationDefinitions_E558:
; 1E: Moving right - morph ball - no springball - on ground
    db $0A,$00,$00,$00, $0A,$04,$00,$00, $0A,$01,$00,$00, $0A,$05,$00,$00 ;92E558;
    db $0A,$02,$00,$00, $0A,$06,$00,$00, $0A,$03,$00,$00, $0A,$07,$00,$00 ;92E568;
    db $00,$00,$00,$00, $0B,$01,$00,$00                                  ;92E578;

SamusTilesAnimation_AnimationDefinitions_E580:
; 1F: Moving left-   morph ball - no springball - on ground
    db $0A,$07,$00,$00, $0A,$03,$00,$00, $0A,$06,$00,$00, $0A,$02,$00,$00 ;92E580;
    db $0A,$05,$00,$00, $0A,$01,$00,$00, $0A,$04,$00,$00, $0A,$00,$00,$00 ;92E590;
    db $00,$00,$00,$00, $0B,$01,$00,$00                                  ;92E5A0;

SamusTilesAnimation_AnimationDefinitions_E5A8:
; 79: Facing right - morph ball - spring ball - on ground
; 7B: Moving right - morph ball - spring ball - on ground
; 7D: Facing right - morph ball - spring ball - falling
; 7F: Facing right - morph ball - spring ball - in air
    db $0A,$00,$00,$00, $0A,$04,$00,$00, $0A,$01,$00,$00, $0A,$05,$00,$00 ;92E5A8;
    db $0A,$02,$00,$00, $0A,$06,$00,$00, $0A,$03,$00,$00, $0A,$07,$00,$00 ;92E5B8;
    db $00,$00,$00,$00, $0B,$01,$00,$00                                  ;92E5C8;

SamusTilesAnimation_AnimationDefinitions_E5D0:
; 7A: Facing left-   morph ball - spring ball - on ground
; 7C: Moving left-   morph ball - spring ball - on ground
; 7E: Facing left-   morph ball - spring ball - falling
; 80: Facing left-   morph ball - spring ball - in air
    db $0A,$07,$00,$00, $0A,$03,$00,$00, $0A,$06,$00,$00, $0A,$02,$00,$00 ;92E5D0;
    db $0A,$05,$00,$00, $0A,$01,$00,$00, $0A,$04,$00,$00, $0A,$00,$00,$00 ;92E5E0;
    db $00,$00,$00,$00, $0B,$01,$00,$00                                  ;92E5F0;

SamusTilesAnimation_AnimationDefinitions_E5F8:
; 19: Facing right - spin jump
; 20: Unused
; 21: Unused
; 22: Unused
; 23: Unused
; 24: Unused
; 33: Unused
; 34: Unused
; 39: Unused
; 3A: Unused
; 42: Unused
    db $02,$04,$01,$19, $0A,$08,$00,$00, $0A,$09,$00,$00, $0A,$0A,$00,$00 ;92E5F8;
    db $0A,$0B,$00,$00, $0A,$0C,$00,$00, $0A,$0D,$00,$00, $0A,$0E,$00,$00 ;92E608;
    db $0A,$0F,$00,$00, $00,$00,$00,$00, $00,$00,$00,$00, $01,$1C,$00,$1E ;92E618;

SamusTilesAnimation_AnimationDefinitions_E628:
; 1A: Facing left-   spin jump
    db $02,$05,$01,$1A, $0A,$08,$00,$00, $0A,$09,$00,$00, $0A,$0A,$00,$00 ;92E628;
    db $0A,$0B,$00,$00, $0A,$0C,$00,$00, $0A,$0D,$00,$00, $0A,$0E,$00,$00 ;92E638;
    db $0A,$0F,$00,$00, $00,$00,$00,$00, $00,$00,$00,$00, $01,$1D,$00,$1F ;92E648;

SamusTilesAnimation_AnimationDefinitions_E658:
; 1B: Facing right - space jump
    db $02,$04,$01,$19, $0A,$14,$09,$00, $0A,$14,$09,$01, $0A,$14,$09,$02 ;92E658;
    db $0A,$14,$09,$03, $0A,$14,$09,$04, $0A,$14,$09,$05, $0A,$14,$09,$06 ;92E668;
    db $0A,$14,$09,$07, $00,$00,$00,$00, $00,$00,$00,$00, $01,$1C,$00,$1E ;92E678;

SamusTilesAnimation_AnimationDefinitions_E688:
; 1C: Facing left-   space jump
    db $02,$05,$01,$1A, $0A,$14,$09,$00, $0A,$14,$09,$01, $0A,$14,$09,$02 ;92E688;
    db $0A,$14,$09,$03, $0A,$14,$09,$04, $0A,$14,$09,$05, $0A,$14,$09,$06 ;92E698;
    db $0A,$14,$09,$07, $00,$00,$00,$00, $00,$00,$00,$00, $01,$1D,$00,$1F ;92E6A8;

SamusTilesAnimation_AnimationDefinitions_E6B8:
; 81: Facing right - screw attack
    db $02,$04,$01,$19, $0A,$10,$09,$00, $0A,$10,$09,$01, $0A,$10,$09,$02 ;92E6B8;
    db $0A,$14,$09,$03, $0A,$14,$09,$04, $0A,$14,$09,$05, $0A,$11,$09,$06 ;92E6C8;
    db $0A,$11,$09,$07, $0A,$11,$09,$00, $0A,$14,$09,$01, $0A,$14,$09,$02 ;92E6D8;
    db $0A,$14,$09,$03, $0A,$12,$09,$04, $0A,$12,$09,$05, $0A,$12,$09,$06 ;92E6E8;
    db $0A,$14,$09,$07, $0A,$14,$09,$00, $0A,$14,$09,$01, $0A,$13,$09,$02 ;92E6F8;
    db $0A,$13,$09,$03, $0A,$13,$09,$04, $0A,$14,$09,$05, $0A,$14,$09,$06 ;92E708;
    db $0A,$14,$09,$07, $00,$00,$00,$00, $00,$00,$00,$00, $01,$1C,$00,$1E ;92E718;

SamusTilesAnimation_AnimationDefinitions_E728:
; 82: Facing left-   screw attack
    db $02,$05,$01,$1A, $0A,$10,$09,$00, $0A,$10,$09,$01, $0A,$10,$09,$02 ;92E728;
    db $0A,$14,$09,$03, $0A,$14,$09,$04, $0A,$14,$09,$05, $0A,$11,$09,$06 ;92E738;
    db $0A,$11,$09,$07, $0A,$11,$09,$00, $0A,$14,$09,$01, $0A,$14,$09,$02 ;92E748;
    db $0A,$14,$09,$03, $0A,$12,$09,$04, $0A,$12,$09,$05, $0A,$12,$09,$06 ;92E758;
    db $0A,$14,$09,$07, $0A,$14,$09,$00, $0A,$14,$09,$01, $0A,$13,$09,$02 ;92E768;
    db $0A,$13,$09,$03, $0A,$13,$09,$04, $0A,$14,$09,$05, $0A,$14,$09,$06 ;92E778;
    db $0A,$14,$09,$07, $00,$00,$00,$00, $00,$00,$00,$00, $01,$1D,$00,$1F ;92E788;

SamusTilesAnimation_AnimationDefinitions_E798:
; 25: Facing right - turning - standing
; BF: Facing right - moonwalking - turn/jump left
; C6: Unused
    db $01,$07,$00,$16, $01,$0A,$01,$01, $01,$06,$00,$15                 ;92E798;

SamusTilesAnimation_AnimationDefinitions_E7A4:
; 26: Facing left-   turning - standing
; C0: Facing left-   moonwalking - turn/jump right
    db $01,$06,$00,$15, $01,$0A,$01,$01, $01,$07,$00,$16                 ;92E7A4;

SamusTilesAnimation_AnimationDefinitions_E7B0:
; 8B: Facing right - turning - standing - aiming up
; 9C: Facing right - turning - standing - aiming up-right
; C1: Facing right - moonwalking - turn/jump left-   aiming up-right
    db $01,$09,$00,$16, $01,$02,$01,$01, $01,$08,$00,$15                 ;92E7B0;

SamusTilesAnimation_AnimationDefinitions_E7BC:
; 8C: Facing left-   turning - standing - aiming up
; 9D: Facing left-   turning - standing - aiming up-left
; C2: Facing left-   moonwalking - turn/jump right - aiming up-left
    db $01,$08,$00,$15, $01,$02,$01,$01, $01,$09,$00,$16                 ;92E7BC;

SamusTilesAnimation_AnimationDefinitions_E7C8:
; 8D: Facing right - turning - standing - aiming down-right
; C3: Facing right - moonwalking - turn/jump left-   aiming down-right
    db $01,$19,$00,$16, $01,$03,$01,$01, $01,$18,$00,$15                 ;92E7C8;

SamusTilesAnimation_AnimationDefinitions_E7D4:
; 8E: Facing left-   turning - standing - aiming down-left
; C4: Facing left-   moonwalking - turn/jump right - aiming down-left
    db $01,$18,$00,$15, $01,$03,$01,$01, $01,$19,$00,$16                 ;92E7D4;

SamusTilesAnimation_AnimationDefinitions_E7E0:
; 2F: Facing right - turning - jumping
; 43: Facing right - turning - crouching
; 87: Facing right - turning - falling
    db $01,$07,$00,$18, $01,$0A,$01,$02, $01,$06,$00,$17                 ;92E7E0;

SamusTilesAnimation_AnimationDefinitions_E7EC:
; 30: Facing left-   turning - jumping
; 44: Facing left-   turning - crouching
; 88: Facing left-   turning - falling
    db $01,$06,$00,$17, $01,$0A,$01,$02, $01,$07,$00,$18                 ;92E7EC;

SamusTilesAnimation_AnimationDefinitions_E7F8:
; 8F: Facing right - turning - in air - aiming up
; 93: Facing right - turning - falling - aiming up
; 97: Facing right - turning - crouching - aiming up
; 9E: Facing right - turning - in air - aiming up-right
; A0: Facing right - turning - falling - aiming up-right
; A2: Facing right - turning - crouching - aiming up-right
    db $01,$09,$00,$18, $01,$02,$01,$02, $01,$08,$00,$17                 ;92E7F8;

SamusTilesAnimation_AnimationDefinitions_E804:
; 90: Facing left-   turning - in air - aiming up
; 94: Facing left-   turning - falling - aiming up
; 98: Facing left-   turning - crouching - aiming up
; 9F: Facing left-   turning - in air - aiming up-left
; A1: Facing left-   turning - falling - aiming up-left
; A3: Facing left-   turning - crouching - aiming up-left
    db $01,$08,$00,$17, $01,$02,$01,$02, $01,$09,$00,$18                 ;92E804;

SamusTilesAnimation_AnimationDefinitions_E810:
; 91: Facing right - turning - in air - aiming down/down-right
; 95: Facing right - turning - falling - aiming down/down-right
; 99: Facing right - turning - crouching - aiming down/down-right
    db $01,$19,$00,$18, $01,$03,$01,$02, $01,$18,$00,$17                 ;92E810;

SamusTilesAnimation_AnimationDefinitions_E81C:
; 92: Facing left-   turning - in air - aiming down/down-left
; 96: Facing left-   turning - falling - aiming down/down-left
; 9A: Facing left-   turning - crouching - aiming down/down-left
    db $01,$18,$00,$17, $01,$03,$01,$02, $01,$19,$00,$18                 ;92E81C;

SamusTilesAnimation_AnimationDefinitions_E828:
; EC: Facing right - grabbed by Draygon - not moving - not aiming
    db $02,$04,$01,$1B                                                   ;92E828;

SamusTilesAnimation_AnimationDefinitions_E82C:
; ED: Facing right - grabbed by Draygon - not moving - aiming up-right
    db $00,$1A,$01,$1B                                                   ;92E82C;

SamusTilesAnimation_AnimationDefinitions_E830:
; EE: Facing right - grabbed by Draygon - firing
    db $00,$10,$01,$1B                                                   ;92E830;

SamusTilesAnimation_AnimationDefinitions_E834:
; EF: Facing right - grabbed by Draygon - not moving - aiming down-right
    db $00,$0C,$01,$1B                                                   ;92E834;

SamusTilesAnimation_AnimationDefinitions_E838:
; BA: Facing left-   grabbed by Draygon - not moving - not aiming
    db $02,$05,$01,$1C                                                   ;92E838;

SamusTilesAnimation_AnimationDefinitions_E83C:
; BB: Facing left-   grabbed by Draygon - not moving - aiming up-left
    db $00,$1B,$01,$1C                                                   ;92E83C;

SamusTilesAnimation_AnimationDefinitions_E840:
; BC: Facing left-   grabbed by Draygon - firing
    db $00,$11,$01,$1C                                                   ;92E840;

SamusTilesAnimation_AnimationDefinitions_E844:
; BD: Facing left-   grabbed by Draygon - not moving - aiming down-left
    db $00,$0D,$01,$1C                                                   ;92E844;

SamusTilesAnimation_AnimationDefinitions_E848:
; F0: Facing right - grabbed by Draygon - moving
    db $00,$01,$01,$0C, $00,$02,$01,$1B, $00,$00,$01,$19, $00,$04,$01,$0C ;92E848;
    db $00,$05,$01,$0E, $00,$00,$01,$08                                  ;92E858;

SamusTilesAnimation_AnimationDefinitions_E860:
; BE: Facing left-   grabbed by Draygon - moving
    db $00,$07,$01,$0D, $00,$08,$01,$1C, $00,$06,$01,$1A, $00,$0A,$01,$0D ;92E860;
    db $00,$0B,$01,$0F, $00,$06,$01,$09                                  ;92E870;

SamusTilesAnimation_AnimationDefinitions_E878:
; CB: Facing right - shinespark - vertical
    db $0C,$00,$00,$00                                                   ;92E878;

SamusTilesAnimation_AnimationDefinitions_E87C:
; CC: Facing left-   shinespark - vertical
    db $0C,$01,$00,$00                                                   ;92E87C;

SamusTilesAnimation_AnimationDefinitions_E880:
; C9: Facing right - shinespark - horizontal
    db $01,$14,$00,$1B                                                   ;92E880;

SamusTilesAnimation_AnimationDefinitions_E884:
; CA: Facing left-   shinespark - horizontal
    db $01,$15,$00,$1C                                                   ;92E884;

SamusTilesAnimation_AnimationDefinitions_E888:
; CD: Facing right - shinespark - diagonal
    db $01,$14,$00,$1B                                                   ;92E888;

SamusTilesAnimation_AnimationDefinitions_E88C:
; CE: Facing left-   shinespark - diagonal
    db $01,$15,$00,$1C                                                   ;92E88C;

SamusTilesAnimation_AnimationDefinitions_E890:
; D3: Facing right - crystal flash
    db $0B,$05,$07,$00, $0B,$06,$07,$01, $0C,$05,$07,$02, $0B,$06,$07,$02 ;92E890;
    db $00,$00,$00,$00, $00,$00,$00,$00, $0C,$05,$07,$02, $0C,$06,$07,$02 ;92E8A0;
    db $0C,$07,$07,$02, $0C,$06,$07,$02, $00,$00,$00,$00, $00,$00,$00,$00 ;92E8B0;
    db $0B,$06,$07,$01, $0B,$06,$07,$00, $00,$10,$01,$06                 ;92E8C0;

SamusTilesAnimation_AnimationDefinitions_E8CC:
; D4: Facing left-   crystal flash
    db $0B,$03,$07,$00, $0B,$04,$07,$01, $0C,$02,$07,$02, $0B,$04,$07,$02 ;92E8CC;
    db $00,$00,$00,$00, $00,$00,$00,$00, $0C,$02,$07,$02, $0C,$03,$07,$02 ;92E8DC;
    db $0C,$04,$07,$02, $0C,$03,$07,$02, $00,$00,$00,$00, $00,$00,$00,$00 ;92E8EC;
    db $0B,$04,$07,$01, $0B,$04,$07,$00, $00,$11,$01,$07                 ;92E8FC;

SamusTilesAnimation_AnimationDefinitions_E908:
; D7: Facing right - crystal flash ending
    db $0A,$00,$01,$06, $0B,$05,$01,$06, $0B,$06,$01,$06, $00,$10,$01,$06 ;92E908;
    db $00,$1D,$01,$0C, $00,$1D,$01,$1B                                  ;92E918;

SamusTilesAnimation_AnimationDefinitions_E920:
; D8: Facing left-   crystal flash ending
    db $0A,$1F,$01,$06, $0B,$03,$01,$06, $0B,$04,$01,$06, $00,$11,$01,$07 ;92E920;
    db $00,$1C,$01,$0D, $00,$1C,$01,$1C                                  ;92E930;

SamusTilesAnimation_AnimationDefinitions_E938:
; E8: Facing right - Samus drained - crouching
    db $0A,$00,$01,$06, $0B,$05,$01,$06, $0B,$06,$01,$06, $00,$1D,$01,$0C ;92E938;
    db $00,$1D,$01,$0C, $00,$1D,$01,$0C, $00,$1D,$01,$0C, $00,$1D,$01,$0C ;92E948;
    db $07,$03,$01,$1F, $07,$04,$01,$1F, $07,$05,$01,$1F, $07,$04,$01,$1F ;92E958;
    db $00,$00,$00,$00, $00,$00,$00,$00, $00,$10,$01,$06                 ;92E968;

SamusTilesAnimation_AnimationDefinitions_E974:
; E9: Facing left-   Samus drained - crouching
    db $0B,$03,$01,$06, $0B,$04,$01,$06, $00,$1C,$01,$0D, $00,$1C,$01,$0D ;92E974;
    db $00,$1C,$01,$0D, $00,$1C,$01,$0D, $00,$1C,$01,$0D, $07,$01,$01,$07 ;92E984;
    db $07,$00,$01,$1E, $07,$01,$01,$1E, $07,$02,$01,$1E, $07,$01,$01,$1E ;92E994;
    db $00,$00,$00,$00, $00,$00,$00,$00, $07,$01,$01,$1A, $07,$07,$01,$07 ;92E9A4;
    db $02,$03,$0A,$01, $00,$00,$00,$00, $00,$00,$00,$00, $07,$01,$01,$1A ;92E9B4;
    db $07,$07,$01,$07, $02,$03,$0A,$01, $07,$07,$01,$07, $07,$01,$01,$1A ;92E9C4;
    db $00,$00,$00,$00, $00,$00,$00,$00, $07,$00,$01,$1E, $00,$00,$00,$00 ;92E9D4;
    db $00,$00,$00,$00, $07,$00,$01,$1E, $00,$00,$00,$00, $00,$00,$00,$00 ;92E9E4;

SamusTilesAnimation_AnimationDefinitions_E9F4:
; EA: Facing right - Samus drained - standing
    db $07,$09,$01,$1F, $07,$0A,$01,$1F, $07,$0B,$01,$1F, $07,$0A,$01,$1F ;92E9F4;
    db $00,$00,$00,$00, $00,$10,$01,$06                                  ;92EA04;

SamusTilesAnimation_AnimationDefinitions_EA0C:
; EB: Facing left-   Samus drained - standing
    db $07,$06,$01,$1E, $07,$07,$01,$1E, $07,$08,$01,$1E, $07,$07,$01,$1E ;92EA0C;
    db $00,$00,$00,$00, $00,$11,$01,$07                                  ;92EA1C;

SamusTilesAnimation_AnimationDefinitions_EA24:
; 00: Facing forward - power suit
    db $01,$11,$00,$0C, $00,$00,$00,$00, $08,$02,$08,$00, $08,$00,$08,$00 ;92EA24;
    db $08,$03,$08,$00, $08,$00,$08,$00, $08,$04,$08,$00, $08,$00,$08,$00 ;92EA34;
    db $08,$02,$08,$00, $08,$00,$08,$00, $08,$03,$08,$00, $08,$00,$08,$00 ;92EA44;
    db $08,$04,$08,$00, $08,$00,$08,$00, $08,$02,$08,$00, $08,$00,$08,$00 ;92EA54;
    db $08,$03,$08,$00, $08,$00,$08,$00, $08,$04,$08,$00, $08,$00,$08,$00 ;92EA64;
    db $08,$02,$08,$00, $08,$00,$08,$00, $08,$03,$08,$00, $08,$00,$08,$00 ;92EA74;
    db $08,$04,$08,$00, $08,$00,$08,$00, $08,$02,$08,$00, $08,$00,$08,$00 ;92EA84;
    db $08,$03,$08,$00, $08,$00,$08,$00, $08,$04,$08,$00, $08,$00,$08,$00 ;92EA94;
    db $08,$02,$08,$00, $08,$00,$08,$00, $08,$03,$08,$00, $08,$00,$08,$00 ;92EAA4;
    db $08,$04,$08,$00, $08,$00,$08,$00, $08,$02,$08,$00, $08,$00,$08,$00 ;92EAB4;
    db $08,$03,$08,$00, $08,$00,$08,$00, $08,$04,$08,$00, $08,$00,$08,$00 ;92EAC4;
    db $08,$02,$08,$00, $08,$00,$08,$00, $08,$03,$08,$00, $08,$00,$08,$00 ;92EAD4;
    db $08,$04,$08,$00, $08,$00,$08,$00, $08,$02,$08,$00, $08,$00,$08,$00 ;92EAE4;
    db $08,$03,$08,$00, $08,$00,$08,$00, $08,$04,$08,$00, $08,$00,$08,$00 ;92EAF4;
    db $08,$02,$08,$00, $08,$00,$08,$00, $08,$03,$08,$00, $08,$00,$08,$00 ;92EB04;
    db $08,$04,$08,$00, $08,$00,$08,$00, $08,$02,$08,$00, $08,$00,$08,$00 ;92EB14;
    db $08,$03,$08,$00, $08,$00,$08,$00, $08,$04,$08,$00, $08,$00,$08,$00 ;92EB24;
    db $08,$02,$08,$00, $08,$00,$08,$00, $08,$03,$08,$00, $08,$00,$08,$00 ;92EB34;
    db $08,$04,$08,$00, $08,$00,$08,$00, $08,$02,$08,$00, $08,$00,$08,$00 ;92EB44;
    db $08,$03,$08,$00, $08,$00,$08,$00, $08,$04,$08,$00, $08,$00,$08,$00 ;92EB54;
    db $08,$05,$08,$00, $08,$00,$08,$00, $08,$06,$08,$00, $08,$00,$08,$00 ;92EB64;
    db $08,$07,$08,$00, $08,$00,$08,$00, $08,$08,$08,$00, $08,$00,$08,$00 ;92EB74;
    db $08,$09,$08,$00, $08,$00,$08,$00, $08,$07,$08,$00, $08,$00,$08,$00 ;92EB84;
    db $08,$08,$08,$00, $08,$00,$08,$00, $08,$09,$08,$00, $08,$00,$08,$00 ;92EB94;

SamusTilesAnimation_AnimationDefinitions_EBA4:
; 9B: Facing forward - varia/gravity suit
    db $01,$05,$00,$0D, $00,$00,$00,$00, $08,$02,$08,$01, $08,$00,$08,$01 ;92EBA4;
    db $08,$03,$08,$01, $08,$00,$08,$01, $08,$04,$08,$01, $08,$00,$08,$01 ;92EBB4;
    db $08,$02,$08,$01, $08,$00,$08,$01, $08,$03,$08,$01, $08,$00,$08,$01 ;92EBC4;
    db $08,$04,$08,$01, $08,$00,$08,$01, $08,$02,$08,$01, $08,$00,$08,$01 ;92EBD4;
    db $08,$03,$08,$01, $08,$00,$08,$01, $08,$04,$08,$01, $08,$00,$08,$01 ;92EBE4;
    db $08,$02,$08,$01, $08,$00,$08,$01, $08,$03,$08,$01, $08,$00,$08,$01 ;92EBF4;
    db $08,$04,$08,$01, $08,$00,$08,$01, $08,$02,$08,$01, $08,$00,$08,$01 ;92EC04;
    db $08,$03,$08,$01, $08,$00,$08,$01, $08,$04,$08,$01, $08,$00,$08,$01 ;92EC14;
    db $08,$02,$08,$01, $08,$00,$08,$01, $08,$03,$08,$01, $08,$00,$08,$01 ;92EC24;
    db $08,$04,$08,$01, $08,$00,$08,$01, $08,$02,$08,$01, $08,$00,$08,$01 ;92EC34;
    db $08,$03,$08,$01, $08,$00,$08,$01, $08,$04,$08,$01, $08,$00,$08,$01 ;92EC44;
    db $08,$02,$08,$01, $08,$00,$08,$01, $08,$03,$08,$01, $08,$00,$08,$01 ;92EC54;
    db $08,$04,$08,$01, $08,$00,$08,$01, $08,$02,$08,$01, $08,$00,$08,$01 ;92EC64;
    db $08,$03,$08,$01, $08,$00,$08,$01, $08,$04,$08,$01, $08,$00,$08,$01 ;92EC74;
    db $08,$02,$08,$01, $08,$00,$08,$01, $08,$03,$08,$01, $08,$00,$08,$01 ;92EC84;
    db $08,$04,$08,$01, $08,$00,$08,$01, $08,$02,$08,$01, $08,$00,$08,$01 ;92EC94;
    db $08,$03,$08,$01, $08,$00,$08,$01, $08,$04,$08,$01, $08,$00,$08,$01 ;92ECA4;
    db $08,$02,$08,$01, $08,$00,$08,$01, $08,$03,$08,$01, $08,$00,$08,$01 ;92ECB4;
    db $08,$04,$08,$01, $08,$00,$08,$01, $08,$02,$08,$01, $08,$00,$08,$01 ;92ECC4;
    db $08,$03,$08,$01, $08,$00,$08,$01, $08,$04,$08,$01, $08,$00,$08,$01 ;92ECD4;
    db $08,$05,$08,$01, $08,$00,$08,$01, $08,$06,$08,$01, $08,$00,$08,$01 ;92ECE4;
    db $08,$07,$08,$01, $08,$00,$08,$01, $08,$08,$08,$01, $08,$00,$08,$01 ;92ECF4;
    db $08,$09,$08,$01, $08,$00,$08,$01, $08,$07,$08,$01, $08,$00,$08,$01 ;92ED04;
    db $08,$08,$08,$01, $08,$00,$08,$01, $08,$09,$08,$01, $08,$00,$08,$01 ;92ED14;


;;; $ED24: Play Samus fanfare ;;;
PlaySamusFanfare:
;; Returns:
;;     Carry: set if finished fanfare, else clear
    PHP                                                                  ;92ED24;
    PHB                                                                  ;92ED25;
    PHK                                                                  ;92ED26;
    PLB                                                                  ;92ED27;
    REP #$30                                                             ;92ED28;
    LDA.W SamusAppearsFanfareTimer                                       ;92ED2A;
    BNE .nonZero                                                         ;92ED2D;
    LDA.W #$0001                                                         ;92ED2F;
    LDY.W #$000E                                                         ;92ED32;
    JSL.L QueueMusicDataOrTrack_YFrameDelay                              ;92ED35;
    BRA .not5                                                            ;92ED39;

  .nonZero:
    CMP.W #$0005                                                         ;92ED3B;
    BNE .not5                                                            ;92ED3E;
    LDA.W #$0168                                                         ;92ED40;
    JSL.L Play_Room_Music_Track_After_A_Frames                           ;92ED43;
    BRA .not5                                                            ;92ED47;

  .not5:
    LDA.W SamusAppearsFanfareTimer                                       ;92ED49;
    INC                                                                  ;92ED4C;
    CMP.W #$0168                                                         ;92ED4D;
    BPL .greaterThanEqualTo168                                           ;92ED50;
    STA.W SamusAppearsFanfareTimer                                       ;92ED52;
    BRA .return                                                          ;92ED55;

  .greaterThanEqualTo168:
    LDA.W PreviousPose                                                   ;92ED57;
    STA.W LastDifferentPose                                              ;92ED5A;
    LDA.W PreviousPoseXDirection                                         ;92ED5D;
    STA.W LastDifferentPoseXDirection                                    ;92ED60;
    LDA.W Pose                                                           ;92ED63;
    STA.W PreviousPose                                                   ;92ED66;
    LDA.W PoseXDirection                                                 ;92ED69;
    STA.W PreviousPoseXDirection                                         ;92ED6C;
    STZ.W SamusAppearsFanfareTimer                                       ;92ED6F;
    PLB                                                                  ;92ED72;
    PLP                                                                  ;92ED73;
    SEC                                                                  ;92ED74;
    RTL                                                                  ;92ED75;

  .return:
    PLB                                                                  ;92ED76;
    PLP                                                                  ;92ED77;
    CLC                                                                  ;92ED78;
    RTL                                                                  ;92ED79;


if !DEBUG
;;; $ED7A: Debug. Samus tile viewer ;;;
Debug_SamusTileViewer:
    PHP                                                                  ;92ED7A;
    PHB                                                                  ;92ED7B;
    PHK                                                                  ;92ED7C;
    PLB                                                                  ;92ED7D;
    REP #$30                                                             ;92ED7E;
    LDA.W #$0182                                                         ;92ED80;
    LDX.W #$0040                                                         ;92ED83;
    LDY.W #$0040                                                         ;92ED86;
    JSL.L AddSamusSpritemapToOAM                                         ;92ED89;
    LDA.W #$0182                                                         ;92ED8D;
    INC                                                                  ;92ED90;
    LDX.W #$00C0                                                         ;92ED91;
    LDY.W #$0040                                                         ;92ED94;
    JSL.L AddSamusSpritemapToOAM                                         ;92ED97;
    LDA.W #$0182                                                         ;92ED9B;
    INC                                                                  ;92ED9E;
    INC                                                                  ;92ED9F;
    LDX.W #$0080                                                         ;92EDA0;
    LDY.W #$0060                                                         ;92EDA3;
    JSL.L AddSamusSpritemapToOAM                                         ;92EDA6;
    LDA.W #$0182                                                         ;92EDAA;
    CLC                                                                  ;92EDAD;
    ADC.W #$0003                                                         ;92EDAE;
    LDX.W #$0080                                                         ;92EDB1;
    LDY.W #$0050                                                         ;92EDB4;
    JSL.L AddSamusSpritemapToOAM                                         ;92EDB7;
    PLB                                                                  ;92EDBB;
    PLP                                                                  ;92EDBC;
    RTL                                                                  ;92EDBD;
endif


;;; $EDBE: Draw Samus' suit exploding ;;;
DrawSamusSuitExploding:
    PHP                                                                  ;92EDBE;
    PHB                                                                  ;92EDBF;
    PHK                                                                  ;92EDC0;
    PLB                                                                  ;92EDC1;
    REP #$30                                                             ;92EDC2;
    LDA.W PoseXDirection                                                 ;92EDC4;
    AND.W #$00FF                                                         ;92EDC7;
    CMP.W #$0004                                                         ;92EDCA;
    BEQ .facingLeft                                                      ;92EDCD;
    LDA.W #$081C                                                         ;92EDCF;
    CLC                                                                  ;92EDD2;
    ADC.W DeathAnimation_Index                                           ;92EDD3;
    STA.B DP_Temp12                                                      ;92EDD6;
    BRA +                                                                ;92EDD8;

  .facingLeft:
    LDA.W #$0825                                                         ;92EDDA;
    CLC                                                                  ;92EDDD;
    ADC.W DeathAnimation_Index                                           ;92EDDE;
    STA.B DP_Temp12                                                      ;92EDE1;

+   LDA.W SamusXPosition                                                 ;92EDE3;
    TAX                                                                  ;92EDE6;
    LDA.W SamusYPosition                                                 ;92EDE7;
    TAY                                                                  ;92EDEA;
    LDA.B DP_Temp12                                                      ;92EDEB;
    JSL.L AddSamusSpritemapToOAM                                         ;92EDED;
    PLB                                                                  ;92EDF1;
    PLP                                                                  ;92EDF2;
    RTL                                                                  ;92EDF3;


Freespace_Bank92_EDF4:                                                   ;92EDF4;
; $120C bytes
