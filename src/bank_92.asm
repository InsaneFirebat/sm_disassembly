
org $928000


Set_SamusTilesDefinitions_ForCurrentAnimation:
    PHP                                                                  ;928000;
    PHB                                                                  ;928001;
    PHK                                                                  ;928002;
    PLB                                                                  ;928003;
    REP #$30                                                             ;928004;
    LDA.W $0A96                                                          ;928006;
    ASL A                                                                ;928009;
    ASL A                                                                ;92800A;
    STA.B $12                                                            ;92800B;
    INC A                                                                ;92800D;
    INC A                                                                ;92800E;
    STA.B $14                                                            ;92800F;
    LDA.W $0A1C                                                          ;928011;
    ASL A                                                                ;928014;
    TAX                                                                  ;928015;
    LDA.W SamusTilesAnimation_AnimationDefinitionPointers,X              ;928016;
    CLC                                                                  ;928019;
    ADC.B $12                                                            ;92801A;
    TAX                                                                  ;92801C;
    LDA.W $0000,X                                                        ;92801D;
    AND.W #$00FF                                                         ;928020;
    STA.B $16                                                            ;928023;
    ASL A                                                                ;928025;
    TAY                                                                  ;928026;
    INX                                                                  ;928027;
    LDA.W $0000,X                                                        ;928028;
    AND.W #$00FF                                                         ;92802B;
    STA.W $0B24                                                          ;92802E;
    ASL A                                                                ;928031;
    ASL A                                                                ;928032;
    ASL A                                                                ;928033;
    SEC                                                                  ;928034;
    SBC.W $0B24                                                          ;928035;
    STA.B $12                                                            ;928038;
    LDA.W SamusTopHalfTilesAnimation_TilesDefinitionPointers,Y           ;92803A;
    CLC                                                                  ;92803D;
    ADC.B $12                                                            ;92803E;
    STA.W $071F                                                          ;928040;
    SEP #$20                                                             ;928043;
    LDA.B #$01                                                           ;928045;
    STA.W $071D                                                          ;928047;
    REP #$20                                                             ;92804A;
    LDA.W $0A1C                                                          ;92804C;
    ASL A                                                                ;92804F;
    TAX                                                                  ;928050;
    LDA.W SamusTilesAnimation_AnimationDefinitionPointers,X              ;928051;
    CLC                                                                  ;928054;
    ADC.B $14                                                            ;928055;
    TAX                                                                  ;928057;
    LDA.W $0000,X                                                        ;928058;
    AND.W #$00FF                                                         ;92805B;
    CMP.W #$00FF                                                         ;92805E;
    BEQ .return                                                          ;928061;
    ASL A                                                                ;928063;
    TAY                                                                  ;928064;
    INX                                                                  ;928065;
    LDA.W $0000,X                                                        ;928066;
    AND.W #$00FF                                                         ;928069;
    STA.W $0B26                                                          ;92806C;
    ASL A                                                                ;92806F;
    ASL A                                                                ;928070;
    ASL A                                                                ;928071;
    SEC                                                                  ;928072;
    SBC.W $0B26                                                          ;928073;
    STA.B $14                                                            ;928076;
    LDA.W SamusBottomHalfTilesAnimation_TilesDefinitionPointers,Y        ;928078;
    CLC                                                                  ;92807B;
    ADC.B $14                                                            ;92807C;
    STA.W $0721                                                          ;92807E;
    SEP #$20                                                             ;928081;
    LDA.B #$01                                                           ;928083;
    STA.W $071E                                                          ;928085;
    REP #$20                                                             ;928088;

.return:
    PLB                                                                  ;92808A;
    PLP                                                                  ;92808B;
    RTL                                                                  ;92808C;


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
; Top half - 02: Facing left  - normal
; Top half - 48: Unused
; Top half - 8A: Facing left  - ran into a wall
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
; 01AF. Top half - 04: Facing left  - aiming up
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
; Top half - 06: Facing left  - aiming up-left
; Top half - 58: Facing left  - normal jump transition - aiming up-left
; Top half - D0: Facing left  - ran into a wall - aiming up-left
; Top half - E3: Facing left  - landing from normal jump - aiming up-left
; Top half - F4: Facing left  - crouching transition - aiming up-left
; 01B3. Top half - FA: Facing left  - standing transition - aiming up-left
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
; Top half - 08: Facing left  - aiming down-left
; Top half - 5A: Facing left  - normal jump transition - aiming down-left
; Top half - AB: Unused
; Top half - D2: Facing left  - ran into a wall - aiming down-left
; Top half - E5: Facing left  - landing from normal jump - aiming down-left
; Top half - F6: Facing left  - crouching transition - aiming down-left
; 01B7. Top half - FC: Facing left  - standing transition - aiming down-left
    dw SamusSpritemaps_9760                                              ;9283FB;
    dw SamusSpritemaps_9760                                              ;9283FD;
; 01B9. Top half - A4: Facing right - landing from normal jump
    dw SamusSpritemaps_9B6F                                              ;9283FF;
    dw SamusSpritemaps_9BAE                                              ;928401;
; 01BB. Top half - A5: Facing left  - landing from normal jump
    dw SamusSpritemaps_9B80                                              ;928403;
    dw SamusSpritemaps_9BBF                                              ;928405;
; 01BD. Top half - A6: Facing right - landing from spin jump
    dw SamusSpritemaps_9BAE                                              ;928407;
    dw SamusSpritemaps_9B6F                                              ;928409;
    dw SamusSpritemaps_9BAE                                              ;92840B;
; 01C0. Top half - A7: Facing left  - landing from spin jump
    dw SamusSpritemaps_9BBF                                              ;92840D;
    dw SamusSpritemaps_9B80                                              ;92840F;
    dw SamusSpritemaps_9BBF                                              ;928411;
; 01C0. Top half - A7: Facing left  - landing from spin jump
    dw SamusSpritemaps_9C26                                              ;928413;
    dw SamusSpritemaps_9C0B                                              ;928415;
    dw SamusSpritemaps_977B                                              ;928417;
    dw SamusSpritemaps_9C41                                              ;928419;
    dw SamusSpritemaps_9C5C                                              ;92841B;
; 01C0. Top half - A7: Facing left  - landing from spin jump
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
; Top half - 56: Facing left  - normal jump transition - aiming up
; Top half - E1: Facing left  - landing from normal jump - aiming up
; Top half - F2: Facing left  - crouching transition - aiming up
; 01CF. Top half - F8: Facing left  - standing transition - aiming up
    dw SamusSpritemaps_981A                                              ;92842B;
    dw SamusSpritemaps_981A                                              ;92842D;
; 01D1. Top half - E6: Facing right - landing from normal jump - firing
    dw SamusSpritemaps_977B                                              ;92842F;
    dw SamusSpritemaps_977B                                              ;928431;
; 01D3. Top half - E7: Facing left  - landing from normal jump - firing
    dw SamusSpritemaps_9796                                              ;928433;
    dw SamusSpritemaps_9796                                              ;928435;
; 01D5. Top half - 49: Facing left  - moonwalk
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
; 01E1. Top half - 75: Facing left  - moonwalk - aiming up-left
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
; 01ED. Top half - 77: Facing left  - moonwalk - aiming down-left
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
; 0203. Top half - 0A: Moving left  - not aiming
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
; 0217. Top half - 0C: Moving left  - gun extended
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
; 022B. Top half - 0E: Moving left  - aiming up (unused)
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
; 023F. Top half - 10: Moving left  - aiming up-left
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
; 0253. Top half - 12: Moving left  - aiming down-left
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
; Top half - 18: Facing left  - normal jump - aiming down
; 0273. Top half - AF: Unused
    dw SamusSpritemaps_9725                                              ;928573;
    dw SamusSpritemaps_9B2D                                              ;928575;
; Top half - 13: Facing right - normal jump - not aiming - not moving - gun extended
; 0275. Top half - AC: Unused
    dw SamusSpritemaps_977B                                              ;928577;
    dw SamusSpritemaps_977B                                              ;928579;
; Top half - 14: Facing left  - normal jump - not aiming - not moving - gun extended
; 0277. Top half - AD: Unused
    dw SamusSpritemaps_9796                                              ;92857B;
    dw SamusSpritemaps_9796                                              ;92857D;
; 0279. Top half - 15: Facing right - normal jump - aiming up
    dw SamusSpritemaps_97B1                                              ;92857F;
    dw SamusSpritemaps_97FF                                              ;928581;
; 027B. Top half - 16: Facing left  - normal jump - aiming up
    dw SamusSpritemaps_97C7                                              ;928583;
    dw SamusSpritemaps_981A                                              ;928585;
; 027D. Top half - 69: Facing right - normal jump - aiming up-right
    dw SamusSpritemaps_9857                                              ;928587;
    dw SamusSpritemaps_9857                                              ;928589;
; 027F. Top half - 6A: Facing left  - normal jump - aiming up-left
    dw SamusSpritemaps_9872                                              ;92858B;
    dw SamusSpritemaps_9872                                              ;92858D;
; Top half - 6B: Facing right - normal jump - aiming down-right
; 0281. Top half - B0: Unused
    dw SamusSpritemaps_9705                                              ;92858F;
    dw SamusSpritemaps_9705                                              ;928591;
; Top half - 6C: Facing left  - normal jump - aiming down-left
; 0283. Top half - B1: Unused
    dw SamusSpritemaps_9725                                              ;928593;
    dw SamusSpritemaps_9725                                              ;928595;
; 0285. Top half - 51: Facing right - normal jump - not aiming - moving forward
    dw SamusSpritemaps_977B                                              ;928597;
    dw SamusSpritemaps_977B                                              ;928599;
; 0287. Top half - 52: Facing left  - normal jump - not aiming - moving forward
    dw SamusSpritemaps_9796                                              ;92859B;
    dw SamusSpritemaps_9796                                              ;92859D;
; 0289. Top half - 4B: Facing right - normal jump transition
    dw SamusSpritemaps_9B6F                                              ;92859F;
; 028A. Top half - 4C: Facing left  - normal jump transition
    dw SamusSpritemaps_9B80                                              ;9285A1;
; Top half - 4D: Facing right - normal jump - not aiming - not moving - gun not extended
; 028B. Top half - C7: Facing right - vertical shinespark windup
    dw SamusSpritemaps_9691                                              ;9285A3;
    dw SamusSpritemaps_969D                                              ;9285A5;
    dw SamusSpritemaps_9691                                              ;9285A7;
    dw SamusSpritemaps_9657                                              ;9285A9;
    dw SamusSpritemaps_9663                                              ;9285AB;
    dw SamusSpritemaps_97DD                                              ;9285AD;
; Top half - 4E: Facing left  - normal jump - not aiming - not moving - gun not extended
; 0291. Top half - C8: Facing left  - vertical shinespark windup
    dw SamusSpritemaps_96E8                                              ;9285AF;
    dw SamusSpritemaps_96F4                                              ;9285B1;
    dw SamusSpritemaps_96E8                                              ;9285B3;
    dw SamusSpritemaps_96AE                                              ;9285B5;
    dw SamusSpritemaps_96BA                                              ;9285B7;
    dw SamusSpritemaps_97EE                                              ;9285B9;
; 0297. Top half - 4F: Facing left  - damage boost
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
; 02F0. Top half - 84: Facing left  - wall jump
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
; 032F. Top half - B8: Facing left  - grapple wall jump pose
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
; 0333. Top half - B2: Facing clockwise     - grapple
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
; 03BE. Top half - 2A: Facing left  - falling
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
; 03CC. Top half - 68: Facing left  - falling - gun extended
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
; 03D6. Top half - 2C: Facing left  - falling - aiming up
    dw SamusSpritemaps_97C7                                              ;928839;
    dw SamusSpritemaps_981A                                              ;92883B;
    dw SamusSpritemaps_981A                                              ;92883D;
; 03D9. Top half - 2D: Facing right - falling - aiming down
    dw SamusSpritemaps_9705                                              ;92883F;
    dw SamusSpritemaps_9B17                                              ;928841;
; 03DB. Top half - 2E: Facing left  - falling - aiming down
    dw SamusSpritemaps_9725                                              ;928843;
    dw SamusSpritemaps_9B2D                                              ;928845;
; 03DD. Top half - 6D: Facing right - falling - aiming up-right
    dw SamusSpritemaps_9857                                              ;928847;
    dw SamusSpritemaps_9857                                              ;928849;
    dw SamusSpritemaps_9857                                              ;92884B;
; 03E0. Top half - 6E: Facing left  - falling - aiming up-left
    dw SamusSpritemaps_9872                                              ;92884D;
    dw SamusSpritemaps_9872                                              ;92884F;
    dw SamusSpritemaps_9872                                              ;928851;
; 03E3. Top half - 6F: Facing right - falling - aiming down-right
    dw SamusSpritemaps_9705                                              ;928853;
    dw SamusSpritemaps_9705                                              ;928855;
    dw SamusSpritemaps_9705                                              ;928857;
; 03E6. Top half - 70: Facing left  - falling - aiming down-left
    dw SamusSpritemaps_9725                                              ;928859;
    dw SamusSpritemaps_9725                                              ;92885B;
    dw SamusSpritemaps_9725                                              ;92885D;
; 03E9. Top half - 71: Facing right - crouching - aiming up-right
    dw SamusSpritemaps_97B1                                              ;92885F;
; 03EA. Top half - 72: Facing left  - crouching - aiming up-left
    dw SamusSpritemaps_97C7                                              ;928861;
; Top half - 73: Facing right - crouching - aiming down-right
; 03EB. Top half - B6: Unused
    dw SamusSpritemaps_9745                                              ;928863;
; Top half - 74: Facing left  - crouching - aiming down-left
; 03EC. Top half - B7: Unused
    dw SamusSpritemaps_9760                                              ;928865;
; 03ED. Top half - 85: Facing right - crouching - aiming up
    dw SamusSpritemaps_97B1                                              ;928867;
    dw SamusSpritemaps_97FF                                              ;928869;
; 03EF. Top half - 86: Facing left  - crouching - aiming up
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
; Top half - 28: Facing left  - crouching
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
; Top half - 36: Facing left  - crouching transition
; 0404. Top half - 3C: Facing left  - standing transition
    dw SamusSpritemaps_9796                                              ;928895;
; Bottom half - 37: Facing right - morphing transition
; 0405. Top half - 37: Facing right - morphing transition
    dw SamusSpritemaps_BCDD                                              ;928897;
    dw SamusSpritemaps_BCCC                                              ;928899;
; Bottom half - 38: Facing left  - morphing transition
; 0407. Top half - 38: Facing left  - morphing transition
    dw SamusSpritemaps_BCB1                                              ;92889B;
    dw SamusSpritemaps_BCA0                                              ;92889D;
; Bottom half - 3D: Facing right - unmorphing transition
; 0409. Top half - 3D: Facing right - unmorphing transition
    dw SamusSpritemaps_BCCC                                              ;92889F;
    dw SamusSpritemaps_BCDD                                              ;9288A1;
; Bottom half - 3E: Facing left  - unmorphing transition
; 040B. Top half - 3E: Facing left  - unmorphing transition
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
; Top half - 26: Facing left  - turning - standing
; Top half - 30: Facing left  - turning - jumping
; Top half - 44: Facing left  - turning - crouching
; Top half - 88: Facing left  - turning - falling
; 041C. Top half - C0: Facing left  - moonwalking - turn/jump right
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
; 041F. Top half - C1: Facing right - moonwalking - turn/jump left  - aiming up-right
    dw SamusSpritemaps_99CE                                              ;9288CB;
    dw SamusSpritemaps_993E                                              ;9288CD;
    dw SamusSpritemaps_99AE                                              ;9288CF;
; Top half - 8C: Facing left  - turning - standing - aiming up
; Top half - 90: Facing left  - turning - in air - aiming up
; Top half - 94: Facing left  - turning - falling - aiming up
; Top half - 98: Facing left  - turning - crouching - aiming up
; Top half - 9D: Facing left  - turning - standing - aiming up-left
; Top half - 9F: Facing left  - turning - in air - aiming up-left
; Top half - A1: Facing left  - turning - falling - aiming up-left
; Top half - A3: Facing left  - turning - crouching - aiming up-left
; 0422. Top half - C2: Facing left  - moonwalking - turn/jump right - aiming up-left
    dw SamusSpritemaps_99AE                                              ;9288D1;
    dw SamusSpritemaps_993E                                              ;9288D3;
    dw SamusSpritemaps_99CE                                              ;9288D5;
; Top half - 8D: Facing right - turning - standing - aiming down-right
; Top half - 91: Facing right - turning - in air - aiming down/down-right
; Top half - 95: Facing right - turning - falling - aiming down/down-right
; Top half - 99: Facing right - turning - crouching - aiming down/down-right
; 0425. Top half - C3: Facing right - moonwalking - turn/jump left  - aiming down-right
    dw SamusSpritemaps_9AF7                                              ;9288D7;
    dw SamusSpritemaps_9954                                              ;9288D9;
    dw SamusSpritemaps_9AD7                                              ;9288DB;
; Top half - 8E: Facing left  - turning - standing - aiming down-left
; Top half - 92: Facing left  - turning - in air - aiming down/down-left
; Top half - 96: Facing left  - turning - falling - aiming down/down-left
; Top half - 9A: Facing left  - turning - crouching - aiming down/down-left
; 0428. Top half - C4: Facing left  - moonwalking - turn/jump right - aiming down-left
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
; 042F. Top half - BA: Facing left  - grabbed by Draygon - not moving - not aiming
    dw SamusSpritemaps_9BBF                                              ;9288EB;
; 0430. Top half - BB: Facing left  - grabbed by Draygon - not moving - aiming up-left
    dw SamusSpritemaps_9872                                              ;9288ED;
; 0431. Top half - BC: Facing left  - grabbed by Draygon - firing
    dw SamusSpritemaps_9796                                              ;9288EF;
; 0432. Top half - BD: Facing left  - grabbed by Draygon - not moving - aiming down-left
    dw SamusSpritemaps_9725                                              ;9288F1;
; 0433. Top half - F0: Facing right - grabbed by Draygon - moving
    dw SamusSpritemaps_9663                                              ;9288F3;
    dw SamusSpritemaps_966F                                              ;9288F5;
    dw SamusSpritemaps_9657                                              ;9288F7;
    dw SamusSpritemaps_9691                                              ;9288F9;
    dw SamusSpritemaps_969D                                              ;9288FB;
    dw SamusSpritemaps_9657                                              ;9288FD;
; 0439. Top half - BE: Facing left  - grabbed by Draygon - moving
    dw SamusSpritemaps_96BA                                              ;9288FF;
    dw SamusSpritemaps_96C6                                              ;928901;
    dw SamusSpritemaps_96AE                                              ;928903;
    dw SamusSpritemaps_96E8                                              ;928905;
    dw SamusSpritemaps_96F4                                              ;928907;
    dw SamusSpritemaps_96AE                                              ;928909;
; 043F. Top half - C9: Facing right - shinespark - horizontal
    dw SamusSpritemaps_9A93                                              ;92890B;
; 0440. Top half - CA: Facing left  - shinespark - horizontal
    dw SamusSpritemaps_9AAE                                              ;92890D;
; 0441. Top half - CD: Facing right - shinespark - diagonal
    dw SamusSpritemaps_9A93                                              ;92890F;
; 0442. Top half - CE: Facing left  - shinespark - diagonal
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
; 0452. Top half - D4: Facing left  - crystal flash
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
; 0467. Top half - D8: Facing left  - crystal flash ending
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
; 047C. Top half - E9: Facing left  - Samus drained - crouching
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
; 04A2. Top half - EB: Facing left  - Samus drained - standing
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
; Bottom half - 02: Facing left  - normal
; Bottom half - 48: Unused
; Bottom half - 8A: Facing left  - ran into a wall
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
; Bottom half - 04: Facing left  - aiming up
; Bottom half - 06: Facing left  - aiming up-left
; Bottom half - 08: Facing left  - aiming down-left
; Bottom half - AB: Unused
; Bottom half - D0: Facing left  - ran into a wall - aiming up-left
; 04C2. Bottom half - D2: Facing left  - ran into a wall - aiming down-left
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
; Bottom half - A5: Facing left  - landing from normal jump
; Bottom half - E1: Facing left  - landing from normal jump - aiming up
; Bottom half - E3: Facing left  - landing from normal jump - aiming up-left
; Bottom half - E5: Facing left  - landing from normal jump - aiming down-left
; 04C7. Bottom half - E7: Facing left  - landing from normal jump - firing
    dw SamusSpritemaps_B037                                              ;928A1B;
    dw SamusSpritemaps_B340                                              ;928A1D;
; 04C9. Bottom half - A6: Facing right - landing from spin jump
    dw SamusSpritemaps_B1C8                                              ;928A1F;
    dw SamusSpritemaps_B021                                              ;928A21;
    dw SamusSpritemaps_ADBB                                              ;928A23;
; 04CC. Bottom half - A7: Facing left  - landing from spin jump
    dw SamusSpritemaps_B1E3                                              ;928A25;
    dw SamusSpritemaps_B037                                              ;928A27;
    dw SamusSpritemaps_B340                                              ;928A29;
; 04CF. Bottom half - D5: Facing right - x-ray - standing
    dw SamusSpritemaps_ADBB                                              ;928A2B;
    dw SamusSpritemaps_ADBB                                              ;928A2D;
    dw SamusSpritemaps_ADBB                                              ;928A2F;
    dw SamusSpritemaps_ADBB                                              ;928A31;
    dw SamusSpritemaps_ADBB                                              ;928A33;
; 04D4. Bottom half - D6: Facing left  - x-ray - standing
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
; 04DE. Bottom half - DA: Facing left  - x-ray - crouching
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
; Bottom half - 0A: Moving left  - not aiming
; Bottom half - 0C: Moving left  - gun extended
; Bottom half - 0E: Moving left  - aiming up (unused)
; Bottom half - 10: Moving left  - aiming up-left
; Bottom half - 12: Moving left  - aiming down-left
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
; Bottom half - 49: Facing left  - moonwalk
; Bottom half - 75: Facing left  - moonwalk - aiming up-left
; 04F7. Bottom half - 77: Facing left  - moonwalk - aiming down-left
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
; Bottom half - 18: Facing left  - normal jump - aiming down
; 0505. Bottom half - AF: Unused
    dw SamusSpritemaps_B09E                                              ;928A97;
    dw SamusSpritemaps_B124                                              ;928A99;
; Bottom half - 13: Facing right - normal jump - not aiming - not moving - gun extended
; 0507. Bottom half - AC: Unused
    dw SamusSpritemaps_B08D                                              ;928A9B;
    dw SamusSpritemaps_B1C8                                              ;928A9D;
; Bottom half - 14: Facing left  - normal jump - not aiming - not moving - gun extended
; 0509. Bottom half - AD: Unused
    dw SamusSpritemaps_B09E                                              ;928A9F;
    dw SamusSpritemaps_B1E3                                              ;928AA1;
; 050B. Bottom half - 15: Facing right - normal jump - aiming up
    dw SamusSpritemaps_B08D                                              ;928AA3;
    dw SamusSpritemaps_AEF7                                              ;928AA5;
; 050D. Bottom half - 16: Facing left  - normal jump - aiming up
    dw SamusSpritemaps_B09E                                              ;928AA7;
    dw SamusSpritemaps_AF08                                              ;928AA9;
; 050F. Bottom half - 51: Facing right - normal jump - not aiming - moving forward
    dw SamusSpritemaps_B08D                                              ;928AAB;
    dw SamusSpritemaps_B1C8                                              ;928AAD;
; 0511. Bottom half - 52: Facing left  - normal jump - not aiming - moving forward
    dw SamusSpritemaps_B09E                                              ;928AAF;
    dw SamusSpritemaps_B1E3                                              ;928AB1;
; 0513. Bottom half - 69: Facing right - normal jump - aiming up-right
    dw SamusSpritemaps_B08D                                              ;928AB3;
    dw SamusSpritemaps_AEF7                                              ;928AB5;
; 0515. Bottom half - 6A: Facing left  - normal jump - aiming up-left
    dw SamusSpritemaps_B09E                                              ;928AB7;
    dw SamusSpritemaps_AF08                                              ;928AB9;
; Bottom half - 6B: Facing right - normal jump - aiming down-right
; 0517. Bottom half - B0: Unused
    dw SamusSpritemaps_B08D                                              ;928ABB;
    dw SamusSpritemaps_B1C8                                              ;928ABD;
; Bottom half - 6C: Facing left  - normal jump - aiming down-left
; 0519. Bottom half - B1: Unused
    dw SamusSpritemaps_B09E                                              ;928ABF;
    dw SamusSpritemaps_B1E3                                              ;928AC1;
; Bottom half - 4B: Facing right - normal jump transition
; Bottom half - 55: Facing right - normal jump transition - aiming up
; Bottom half - 57: Facing right - normal jump transition - aiming up-right
; 051B. Bottom half - 59: Facing right - normal jump transition - aiming down-right
    dw SamusSpritemaps_B021                                              ;928AC3;
; Bottom half - 4C: Facing left  - normal jump transition
; Bottom half - 56: Facing left  - normal jump transition - aiming up
; Bottom half - 58: Facing left  - normal jump transition - aiming up-left
; 051C. Bottom half - 5A: Facing left  - normal jump transition - aiming down-left
    dw SamusSpritemaps_B037                                              ;928AC5;
; Bottom half - 4D: Facing right - normal jump - not aiming - not moving - gun not extended
; 051D. Bottom half - C7: Facing right - vertical shinespark windup
    dw SamusSpritemaps_AD79                                              ;928AC7;
    dw SamusSpritemaps_B0C7                                              ;928AC9;
    dw SamusSpritemaps_B04D                                              ;928ACB;
    dw SamusSpritemaps_B04D                                              ;928ACD;
    dw SamusSpritemaps_B08D                                              ;928ACF;
    dw SamusSpritemaps_B0AF                                              ;928AD1;
; Bottom half - 4E: Facing left  - normal jump - not aiming - not moving - gun not extended
; 0523. Bottom half - C8: Facing left  - vertical shinespark windup
    dw SamusSpritemaps_B2FE                                              ;928AD3;
    dw SamusSpritemaps_B0E2                                              ;928AD5;
    dw SamusSpritemaps_B06D                                              ;928AD7;
    dw SamusSpritemaps_B06D                                              ;928AD9;
    dw SamusSpritemaps_B09E                                              ;928ADB;
    dw SamusSpritemaps_B0BB                                              ;928ADD;
; 0529. Bottom half - 4F: Facing left  - damage boost
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
; 0582. Bottom half - 84: Facing left  - wall jump
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
; 05B3. Bottom half - 54: Facing left  - knockback
    dw SamusSpritemaps_B0BB                                              ;928BF3;
    dw SamusSpritemaps_B214                                              ;928BF5;
; Bottom half - 5B: Unused
; 05B5. Bottom half - B8: Facing left  - grapple wall jump pose
    dw SamusSpritemaps_AF69                                              ;928BF7;
; Bottom half - 5C: Unused
; 05B6. Bottom half - B9: Facing right - grapple wall jump pose
    dw SamusSpritemaps_AF5D                                              ;928BF9;
; Bottom half - 5D: Unused
; Bottom half - 5E: Unused
; Bottom half - 5F: Unused
; Bottom half - 60: Unused
; Bottom half - 61: Unused
; 05B7. Bottom half - B2: Facing clockwise     - grapple
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
; Bottom half - 2A: Facing left  - falling
; 0642. Bottom half - 68: Facing left  - falling - gun extended
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
; 064B. Bottom half - 2E: Facing left  - falling - aiming down
    dw SamusSpritemaps_B09E                                              ;928D23;
    dw SamusSpritemaps_B124                                              ;928D25;
; 064D. Bottom half - 2B: Facing right - falling - aiming up
    dw SamusSpritemaps_B08D                                              ;928D27;
    dw SamusSpritemaps_B0AF                                              ;928D29;
    dw SamusSpritemaps_B1C8                                              ;928D2B;
; 0650. Bottom half - 2C: Facing left  - falling - aiming up
    dw SamusSpritemaps_B09E                                              ;928D2D;
    dw SamusSpritemaps_B0BB                                              ;928D2F;
    dw SamusSpritemaps_B1E3                                              ;928D31;
; 0653. Bottom half - 6D: Facing right - falling - aiming up-right
    dw SamusSpritemaps_B08D                                              ;928D33;
    dw SamusSpritemaps_B0AF                                              ;928D35;
    dw SamusSpritemaps_B1C8                                              ;928D37;
; 0656. Bottom half - 6E: Facing left  - falling - aiming up-left
    dw SamusSpritemaps_B09E                                              ;928D39;
    dw SamusSpritemaps_B0BB                                              ;928D3B;
    dw SamusSpritemaps_B1E3                                              ;928D3D;
; 0659. Bottom half - 6F: Facing right - falling - aiming down-right
    dw SamusSpritemaps_B08D                                              ;928D3F;
    dw SamusSpritemaps_B0AF                                              ;928D41;
    dw SamusSpritemaps_B1C8                                              ;928D43;
; 065C. Bottom half - 70: Facing left  - falling - aiming down-left
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
; Bottom half - 28: Facing left  - crouching
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
; 0672. Bottom half - 72: Facing left  - crouching - aiming up-left
    dw SamusSpritemaps_ADCC                                              ;928D71;
; Bottom half - 73: Facing right - crouching - aiming down-right
; 0673. Bottom half - B6: Unused
    dw SamusSpritemaps_B351                                              ;928D73;
; Bottom half - 74: Facing left  - crouching - aiming down-left
; 0674. Bottom half - B7: Unused
    dw SamusSpritemaps_ADCC                                              ;928D75;
; 0675. Bottom half - 85: Facing right - crouching - aiming up
    dw SamusSpritemaps_B351                                              ;928D77;
    dw SamusSpritemaps_B351                                              ;928D79;
; 0677. Bottom half - 86: Facing left  - crouching - aiming up
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
; Bottom half - 36: Facing left  - crouching transition
; Bottom half - 3C: Facing left  - standing transition
; Bottom half - F2: Facing left  - crouching transition - aiming up
; Bottom half - F4: Facing left  - crouching transition - aiming up-left
; Bottom half - F6: Facing left  - crouching transition - aiming down-left
; Bottom half - F8: Facing left  - standing transition - aiming up
; Bottom half - FA: Facing left  - standing transition - aiming up-left
; 067A. Bottom half - FC: Facing left  - standing transition - aiming down-left
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
; Bottom half - C1: Facing right - moonwalking - turn/jump left  - aiming up-right
; Bottom half - C3: Facing right - moonwalking - turn/jump left  - aiming down-right
    dw SamusSpritemaps_AF2A                                              ;928D9B;
    dw SamusSpritemaps_AFE0                                              ;928D9D;
    dw SamusSpritemaps_AF19                                              ;928D9F;
; Bottom half - 26: Facing left  - turning - standing
; Bottom half - 8C: Facing left  - turning - standing - aiming up
; Bottom half - 8E: Facing left  - turning - standing - aiming down-left
; Bottom half - 9D: Facing left  - turning - standing - aiming up-left
; Bottom half - C0: Facing left  - moonwalking - turn/jump right
; Bottom half - C2: Facing left  - moonwalking - turn/jump right - aiming up-left
; 068A. Bottom half - C4: Facing left  - moonwalking - turn/jump right - aiming down-left
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
; Bottom half - 30: Facing left  - turning - jumping
; Bottom half - 44: Facing left  - turning - crouching
; Bottom half - 90: Facing left  - turning - in air - aiming up
; Bottom half - 92: Facing left  - turning - in air - aiming down/down-left
; Bottom half - 98: Facing left  - turning - crouching - aiming up
; Bottom half - 9A: Facing left  - turning - crouching - aiming down/down-left
; Bottom half - 9F: Facing left  - turning - in air - aiming up-left
; 0690. Bottom half - A3: Facing left  - turning - crouching - aiming up-left
    dw SamusSpritemaps_AF3B                                              ;928DAD;
    dw SamusSpritemaps_AFEC                                              ;928DAF;
    dw SamusSpritemaps_AF4C                                              ;928DB1;
    dw SamusSpritemaps_AF4C                                              ;928DB3;
    dw SamusSpritemaps_AFEC                                              ;928DB5;
    dw SamusSpritemaps_AF3B                                              ;928DB7;
; Bottom half - 88: Facing left  - turning - falling
; Bottom half - 94: Facing left  - turning - falling - aiming up
; Bottom half - 96: Facing left  - turning - falling - aiming down/down-left
; 0696. Bottom half - A1: Facing left  - turning - falling - aiming up-left
    dw SamusSpritemaps_AF3B                                              ;928DB9;
    dw SamusSpritemaps_AFEC                                              ;928DBB;
    dw SamusSpritemaps_AF4C                                              ;928DBD;
; Bottom half - EC: Facing right - grabbed by Draygon - not moving - not aiming
; Bottom half - ED: Facing right - grabbed by Draygon - not moving - aiming up-right
; Bottom half - EE: Facing right - grabbed by Draygon - firing
; 0699. Bottom half - EF: Facing right - grabbed by Draygon - not moving - aiming down-right
    dw SamusSpritemaps_B1FE                                              ;928DBF;
; Bottom half - BA: Facing left  - grabbed by Draygon - not moving - not aiming
; Bottom half - BB: Facing left  - grabbed by Draygon - not moving - aiming up-left
; Bottom half - BC: Facing left  - grabbed by Draygon - firing
; 069A. Bottom half - BD: Facing left  - grabbed by Draygon - not moving - aiming down-left
    dw SamusSpritemaps_B214                                              ;928DC1;
; 069B. Bottom half - F0: Facing right - grabbed by Draygon - moving
    dw SamusSpritemaps_B0AF                                              ;928DC3;
    dw SamusSpritemaps_B1FE                                              ;928DC5;
    dw SamusSpritemaps_B1C8                                              ;928DC7;
    dw SamusSpritemaps_B0AF                                              ;928DC9;
    dw SamusSpritemaps_B0C7                                              ;928DCB;
    dw SamusSpritemaps_B04D                                              ;928DCD;
; 06A1. Bottom half - BE: Facing left  - grabbed by Draygon - moving
    dw SamusSpritemaps_B0BB                                              ;928DCF;
    dw SamusSpritemaps_B214                                              ;928DD1;
    dw SamusSpritemaps_B1E3                                              ;928DD3;
    dw SamusSpritemaps_B0BB                                              ;928DD5;
    dw SamusSpritemaps_B0E2                                              ;928DD7;
    dw SamusSpritemaps_B06D                                              ;928DD9;
; 06A7. Bottom half - C9: Facing right - shinespark - horizontal
    dw SamusSpritemaps_AF75                                              ;928DDB;
; 06A8. Bottom half - CA: Facing left  - shinespark - horizontal
    dw SamusSpritemaps_AF8B                                              ;928DDD;
; 06A9. Bottom half - CD: Facing right - shinespark - diagonal
    dw SamusSpritemaps_AF75                                              ;928DDF;
; 06AA. Bottom half - CE: Facing left  - shinespark - diagonal
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
; 06BA. Bottom half - D4: Facing left  - crystal flash
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
; 06CF. Bottom half - D8: Facing left  - crystal flash ending
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
; 06E4. Bottom half - E9: Facing left  - Samus drained - crouching
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
; 070A. Bottom half - EB: Facing left  - Samus drained - standing
    dw SamusSpritemaps_B236                                              ;928EA1;
    dw SamusSpritemaps_B236                                              ;928EA3;
    dw SamusSpritemaps_B236                                              ;928EA5;
    dw SamusSpritemaps_B236                                              ;928EA7;
    dw $0000                                                             ;928EA9;
    dw SamusSpritemaps_B037                                              ;928EAB;
; Bottom half - 1D: Facing right - morph ball - no springball - on ground
; Bottom half - 31: Facing right - morph ball - no springball - in air
; Bottom half - 32: Facing left  - morph ball - no springball - in air
; Bottom half - 3F: Unused
; Bottom half - 40: Unused
; Top half - 1D: Facing right - morph ball - no springball - on ground
; Top half - 31: Facing right - morph ball - no springball - in air
; Top half - 32: Facing left  - morph ball - no springball - in air
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
; Bottom half - 41: Facing left  - morph ball - no springball - on ground
; Bottom half - C5: Unused
; Bottom half - DF: Unused
; Top half - 41: Facing left  - morph ball - no springball - on ground
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
; Bottom half - 1F: Moving left  - morph ball - no springball - on ground
; 072E. Top half - 1F: Moving left  - morph ball - no springball - on ground
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
; Bottom half - 7A: Facing left  - morph ball - spring ball - on ground
; Bottom half - 7C: Moving left  - morph ball - spring ball - on ground
; Bottom half - 7E: Facing left  - morph ball - spring ball - falling
; Bottom half - 80: Facing left  - morph ball - spring ball - in air
; Top half - 7A: Facing left  - morph ball - spring ball - on ground
; Top half - 7C: Moving left  - morph ball - spring ball - on ground
; Top half - 7E: Facing left  - morph ball - spring ball - falling
; 0742. Top half - 80: Facing left  - morph ball - spring ball - in air
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
; 0764. Top half - 1A: Facing left  - spin jump
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
; 0770. Bottom half - 1A: Facing left  - spin jump
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
; 0794. Top half - 1C: Facing left  - space jump
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
; 07A0. Bottom half - 1C: Facing left  - space jump
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
; 07E4. Top half - 82: Facing left  - screw attack
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
; 0800. Bottom half - 82: Facing left  - screw attack
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
; Bottom half - CC: Facing left  - shinespark - vertical
; 082F. Top half - CC: Facing left  - shinespark - vertical
    dw SamusSpritemaps_C17D                                              ;9290EB;

UNUSED_Debug_SamusSpritemap_0_9290ED:
    dw $0001                                                             ;9290ED;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $15A)

UNUSED_Debug_SamusSpritemap_1_9290F4:
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
    dw $0001                                                             ;929173;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5F)
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTileViewer_SamusTopHalf:
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
    dw $0005                                                             ;929248;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $24)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $23)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 5, $22)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 5, $21)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 5, $20)

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

SamusSpritemaps_9657:
    dw $0002,$C3FB                                                       ;929657;
    db $F8                                                               ;92965B;
    dw $2800,$C3FB                                                       ;92965C;
    db $F0                                                               ;929660;
    dw $2802                                                             ;929661;

SamusSpritemaps_9663:
    dw $0002,$C3FB                                                       ;929663;
    db $F7                                                               ;929667;
    dw $2800,$C3FB                                                       ;929668;
    db $EF                                                               ;92966C;
    dw $2802                                                             ;92966D;

SamusSpritemaps_966F:
    dw $0003,$C3FF                                                       ;92966F;
    db $F7                                                               ;929673;
    dw $2800,$0007                                                       ;929674;
    db $EF                                                               ;929678;
    dw $2804,$C3F7                                                       ;929679;
    db $EF                                                               ;92967D;
    dw $2802                                                             ;92967E;

SamusSpritemaps_9680:
    dw $0003,$0008                                                       ;929680;
    db $EE                                                               ;929684;
    dw $2804,$C200                                                       ;929685;
    db $F6                                                               ;929689;
    dw $2800,$C3F8                                                       ;92968A;
    db $EE                                                               ;92968E;
    dw $2802                                                             ;92968F;

SamusSpritemaps_9691:
    dw $0002,$C3F9                                                       ;929691;
    db $F7                                                               ;929695;
    dw $2800,$C3F9                                                       ;929696;
    db $EF                                                               ;92969A;
    dw $2802                                                             ;92969B;

SamusSpritemaps_969D:
    dw $0003,$C3FE                                                       ;92969D;
    db $EF                                                               ;9296A1;
    dw $2800,$C3F6                                                       ;9296A2;
    db $F7                                                               ;9296A6;
    dw $2802,$C3F6                                                       ;9296A7;
    db $EF                                                               ;9296AB;
    dw $2804                                                             ;9296AC;

SamusSpritemaps_96AE:
    dw $0002,$C3F5                                                       ;9296AE;
    db $F8                                                               ;9296B2;
    dw $2800,$C3F5                                                       ;9296B3;
    db $F0                                                               ;9296B7;
    dw $2802                                                             ;9296B8;

SamusSpritemaps_96BA:
    dw $0002,$C3F5                                                       ;9296BA;
    db $F7                                                               ;9296BE;
    dw $2800,$C3F5                                                       ;9296BF;
    db $EF                                                               ;9296C3;
    dw $2802                                                             ;9296C4;

SamusSpritemaps_96C6:
    dw $0003,$C3F1                                                       ;9296C6;
    db $F7                                                               ;9296CA;
    dw $2800,$C3F9                                                       ;9296CB;
    db $EF                                                               ;9296CF;
    dw $2802,$C3F1                                                       ;9296D0;
    db $EF                                                               ;9296D4;
    dw $2804                                                             ;9296D5;

SamusSpritemaps_96D7:
    dw $0003,$C3F0                                                       ;9296D7;
    db $F6                                                               ;9296DB;
    dw $2800,$C3F0                                                       ;9296DC;
    db $EE                                                               ;9296E0;
    dw $2802,$C3F8                                                       ;9296E1;
    db $EE                                                               ;9296E5;
    dw $2804                                                             ;9296E6;

SamusSpritemaps_96E8:
    dw $0002,$C3F7                                                       ;9296E8;
    db $F7                                                               ;9296EC;
    dw $2800,$C3F7                                                       ;9296ED;
    db $EF                                                               ;9296F1;
    dw $2802                                                             ;9296F2;

SamusSpritemaps_96F4:
    dw $0003,$C3FA                                                       ;9296F4;
    db $F7                                                               ;9296F8;
    dw $2800,$0002                                                       ;9296F9;
    db $EF                                                               ;9296FD;
    dw $2804,$C3F2                                                       ;9296FE;
    db $EF                                                               ;929702;
    dw $2802                                                             ;929703;

SamusSpritemaps_9705:
    dw $0006,$01FD                                                       ;929705;
    db $FB                                                               ;929709;
    dw $2802,$0005                                                       ;92970A;
    db $F3                                                               ;92970E;
    dw $2803,$01FD                                                       ;92970F;
    db $F3                                                               ;929713;
    dw $2804,$000B                                                       ;929714;
    db $01                                                               ;929718;
    dw $2805,$0007                                                       ;929719;
    db $FD                                                               ;92971D;
    dw $2806,$C3FA                                                       ;92971E;
    db $F0                                                               ;929722;
    dw $2800                                                             ;929723;

SamusSpritemaps_9725:
    dw $0006,$01ED                                                       ;929725;
    db $01                                                               ;929729;
    dw $6802,$01F1                                                       ;92972A;
    db $FD                                                               ;92972E;
    dw $6803,$01FC                                                       ;92972F;
    db $FB                                                               ;929733;
    dw $2804,$01F4                                                       ;929734;
    db $F3                                                               ;929738;
    dw $2805,$01FC                                                       ;929739;
    db $F3                                                               ;92973D;
    dw $2806,$C3F6                                                       ;92973E;
    db $F0                                                               ;929742;
    dw $2800                                                             ;929743;

SamusSpritemaps_9745:
    dw $0005,$0006                                                       ;929745;
    db $01                                                               ;929749;
    dw $2804,$C3FE                                                       ;92974A;
    db $F1                                                               ;92974E;
    dw $2800,$C3F6                                                       ;92974F;
    db $F1                                                               ;929753;
    dw $2802,$000D                                                       ;929754;
    db $03                                                               ;929758;
    dw $2805,$0009                                                       ;929759;
    db $FF                                                               ;92975D;
    dw $2806                                                             ;92975E;

SamusSpritemaps_9760:
    dw $0005,$01EF                                                       ;929760;
    db $FF                                                               ;929764;
    dw $6804,$01F0                                                       ;929765;
    db $01                                                               ;929769;
    dw $2805,$C3F0                                                       ;92976A;
    db $F1                                                               ;92976E;
    dw $2800,$01EB                                                       ;92976F;
    db $03                                                               ;929773;
    dw $6806,$C3F8                                                       ;929774;
    db $F1                                                               ;929778;
    dw $2802                                                             ;929779;

SamusSpritemaps_977B:
    dw $0005,$0001                                                       ;92977B;
    db $00                                                               ;92977F;
    dw $2802,$01F9                                                       ;929780;
    db $00                                                               ;929784;
    dw $2803,$C3F9                                                       ;929785;
    db $F0                                                               ;929789;
    dw $2800,$000A                                                       ;92978A;
    db $FD                                                               ;92978E;
    dw $2804,$0002                                                       ;92978F;
    db $FD                                                               ;929793;
    dw $2805                                                             ;929794;

SamusSpritemaps_9796:
    dw $0005,$01FF                                                       ;929796;
    db $00                                                               ;92979A;
    dw $2802,$01F7                                                       ;92979B;
    db $00                                                               ;92979F;
    dw $2803,$C3F7                                                       ;9297A0;
    db $F0                                                               ;9297A4;
    dw $2800,$01EE                                                       ;9297A5;
    db $FD                                                               ;9297A9;
    dw $6804,$01F6                                                       ;9297AA;
    db $FD                                                               ;9297AE;
    dw $6805                                                             ;9297AF;

SamusSpritemaps_97B1:
    dw $0004,$000A,$04EE                                                 ;9297B1;
    db $68                                                               ;9297B7;
    dw $C3FF,$00F1                                                       ;9297B8;
    db $28                                                               ;9297BC;
    dw $000E,$05EA                                                       ;9297BD;
    db $68                                                               ;9297C1;
    dw $C3F7,$02F1                                                       ;9297C2;
    db $28                                                               ;9297C6;

SamusSpritemaps_97C7:
    dw $0004,$01EA                                                       ;9297C7;
    db $E9                                                               ;9297CB;
    dw $2804,$C3F1                                                       ;9297CC;
    db $F1                                                               ;9297D0;
    dw $2800,$01EE                                                       ;9297D1;
    db $ED                                                               ;9297D5;
    dw $2805,$C3F9                                                       ;9297D6;
    db $F1                                                               ;9297DA;
    dw $2802                                                             ;9297DB;

SamusSpritemaps_97DD:
    dw $0003,$C3FF                                                       ;9297DD;
    db $F8                                                               ;9297E1;
    dw $2800,$0007                                                       ;9297E2;
    db $F0                                                               ;9297E6;
    dw $2804,$C3F7                                                       ;9297E7;
    db $F0                                                               ;9297EB;
    dw $2802                                                             ;9297EC;

SamusSpritemaps_97EE:
    dw $0003,$C3F1                                                       ;9297EE;
    db $F8                                                               ;9297F2;
    dw $2800,$C3F9                                                       ;9297F3;
    db $F0                                                               ;9297F7;
    dw $2802,$C3F1                                                       ;9297F8;
    db $F0                                                               ;9297FC;
    dw $2804                                                             ;9297FD;

SamusSpritemaps_97FF:
    dw $0005,$01F9                                                       ;9297FF;
    db $F9                                                               ;929803;
    dw $2802,$01F9                                                       ;929804;
    db $F1                                                               ;929808;
    dw $2803,$01FE                                                       ;929809;
    db $E1                                                               ;92980D;
    dw $2804,$01FE                                                       ;92980E;
    db $E9                                                               ;929812;
    dw $2805,$C3F9                                                       ;929813;
    db $F1                                                               ;929817;
    dw $2800                                                             ;929818;

SamusSpritemaps_981A:
    dw $0005,$01FF                                                       ;92981A;
    db $F9                                                               ;92981E;
    dw $2802,$01FF                                                       ;92981F;
    db $F1                                                               ;929823;
    dw $2803,$01FA                                                       ;929824;
    db $E1                                                               ;929828;
    dw $6804,$C3F7                                                       ;929829;
    db $F1                                                               ;92982D;
    dw $2800,$01FA                                                       ;92982E;
    db $E9                                                               ;929832;
    dw $6805                                                             ;929833;

SamusSpritemaps_9835:
    dw $0003,$C3FF                                                       ;929835;
    db $EE                                                               ;929839;
    dw $2800,$01F7                                                       ;92983A;
    db $FE                                                               ;92983E;
    dw $2804,$C3F7                                                       ;92983F;
    db $EE                                                               ;929843;
    dw $2802                                                             ;929844;

SamusSpritemaps_9846:
    dw $0003,$C3F1                                                       ;929846;
    db $EE                                                               ;92984A;
    dw $2800,$0001                                                       ;92984B;
    db $FE                                                               ;92984F;
    dw $2804,$C3F9                                                       ;929850;
    db $EE                                                               ;929854;
    dw $2802                                                             ;929855;

SamusSpritemaps_9857:
    dw $0005,$000C                                                       ;929857;
    db $EA                                                               ;92985B;
    dw $6802,$01FD                                                       ;92985C;
    db $F8                                                               ;929860;
    dw $2803,$01FD                                                       ;929861;
    db $F0                                                               ;929865;
    dw $2804,$0008                                                       ;929866;
    db $EE                                                               ;92986A;
    dw $6805,$C3FB                                                       ;92986B;
    db $F0                                                               ;92986F;
    dw $2800                                                             ;929870;

SamusSpritemaps_9872:
    dw $0006,$01FB                                                       ;929872;
    db $FB                                                               ;929876;
    dw $2802,$01FB                                                       ;929877;
    db $F3                                                               ;92987B;
    dw $2803,$01F3                                                       ;92987C;
    db $F3                                                               ;929880;
    dw $2804,$01EC                                                       ;929881;
    db $EA                                                               ;929885;
    dw $2805,$01F0                                                       ;929886;
    db $EE                                                               ;92988A;
    dw $2806,$C3F5                                                       ;92988B;
    db $F0                                                               ;92988F;
    dw $2800                                                             ;929890;

SamusSpritemaps_9892:
    dw $0005,$01F7                                                       ;929892;
    db $F1                                                               ;929896;
    dw $6806,$01F3                                                       ;929897;
    db $F5                                                               ;92989B;
    dw $6807,$C3F3                                                       ;92989C;
    db $F0                                                               ;9298A0;
    dw $2800,$C3FB                                                       ;9298A1;
    db $E8                                                               ;9298A5;
    dw $2802,$C3FB                                                       ;9298A6;
    db $F0                                                               ;9298AA;
    dw $2804                                                             ;9298AB;

SamusSpritemaps_98AD:
    dw $0005,$0004                                                       ;9298AD;
    db $F4                                                               ;9298B1;
    dw $6806,$0000                                                       ;9298B2;
    db $F8                                                               ;9298B6;
    dw $6807,$C3F5                                                       ;9298B7;
    db $E8                                                               ;9298BB;
    dw $6800,$C3FD                                                       ;9298BC;
    db $F0                                                               ;9298C0;
    dw $6802,$C3F5                                                       ;9298C1;
    db $F0                                                               ;9298C5;
    dw $6804                                                             ;9298C6;

SamusSpritemaps_98C8:
    dw $0007,$01F5                                                       ;9298C8;
    db $F3                                                               ;9298CC;
    dw $2802,$01FD                                                       ;9298CD;
    db $F3                                                               ;9298D1;
    dw $2803,$01E7                                                       ;9298D2;
    db $FB                                                               ;9298D6;
    dw $6804,$C3F6                                                       ;9298D7;
    db $F0                                                               ;9298DB;
    dw $2800,$01EF                                                       ;9298DC;
    db $FB                                                               ;9298E0;
    dw $6805,$01FE                                                       ;9298E1;
    db $00                                                               ;9298E5;
    dw $2806,$01F6                                                       ;9298E6;
    db $00                                                               ;9298EA;
    dw $2807                                                             ;9298EB;

SamusSpritemaps_98ED:
    dw $0007,$01FD                                                       ;9298ED;
    db $FB                                                               ;9298F1;
    dw $2802,$0004                                                       ;9298F2;
    db $F3                                                               ;9298F6;
    dw $2803,$01FC                                                       ;9298F7;
    db $F3                                                               ;9298FB;
    dw $2804,$0011                                                       ;9298FC;
    db $FB                                                               ;929900;
    dw $2805,$0002                                                       ;929901;
    db $00                                                               ;929905;
    dw $2806,$C3FA                                                       ;929906;
    db $F0                                                               ;92990A;
    dw $2800,$0009                                                       ;92990B;
    db $FB                                                               ;92990F;
    dw $2807                                                             ;929910;

SamusSpritemaps_9912:
    dw $0004,$C3F9                                                       ;929912;
    db $F8                                                               ;929916;
    dw $2800,$C3F9                                                       ;929917;
    db $F0                                                               ;92991B;
    dw $2802,$000A                                                       ;92991C;
    db $FE                                                               ;929920;
    dw $2804,$0002                                                       ;929921;
    db $FE                                                               ;929925;
    dw $2805                                                             ;929926;

SamusSpritemaps_9928:
    dw $0004,$C3F7                                                       ;929928;
    db $F8                                                               ;92992C;
    dw $2800,$C3F7                                                       ;92992D;
    db $F0                                                               ;929931;
    dw $2802,$01EE                                                       ;929932;
    db $FE                                                               ;929936;
    dw $6804,$01F6                                                       ;929937;
    db $FE                                                               ;92993B;
    dw $6805                                                             ;92993C;

SamusSpritemaps_993E:
    dw $0004,$01F4                                                       ;92993E;
    db $E8                                                               ;929942;
    dw $2806,$C3FC                                                       ;929943;
    db $E8                                                               ;929947;
    dw $2800,$C3FC                                                       ;929948;
    db $F0                                                               ;92994C;
    dw $2802,$C3F4                                                       ;92994D;
    db $F0                                                               ;929951;
    dw $2804                                                             ;929952;

SamusSpritemaps_9954:
    dw $0005,$01F4                                                       ;929954;
    db $00                                                               ;929958;
    dw $2806,$0004                                                       ;929959;
    db $F8                                                               ;92995D;
    dw $2807,$C3FC                                                       ;92995E;
    db $E8                                                               ;929962;
    dw $2800,$C3F4                                                       ;929963;
    db $E8                                                               ;929967;
    dw $2802,$C3F4                                                       ;929968;
    db $F0                                                               ;92996C;
    dw $2804                                                             ;92996D;

SamusSpritemaps_996F:
    dw $0001,$01F8                                                       ;92996F;
    db $F8                                                               ;929973;
    dw $2C00                                                             ;929974;

SamusSpritemaps_9976:
    dw $0002,$C3FF                                                       ;929976;
    db $F0                                                               ;92997A;
    dw $6800,$C3F0                                                       ;92997B;
    db $F0                                                               ;92997F;
    dw $2800                                                             ;929980;

SamusSpritemaps_9982:
    dw $0004,$0004                                                       ;929982;
    db $E8                                                               ;929986;
    dw $2804,$01FC                                                       ;929987;
    db $E8                                                               ;92998B;
    dw $2805,$C3FC                                                       ;92998C;
    db $F0                                                               ;929990;
    dw $2800,$C3F4                                                       ;929991;
    db $F0                                                               ;929995;
    dw $2802                                                             ;929996;

SamusSpritemaps_9998:
    dw $0004,$01F5                                                       ;929998;
    db $E8                                                               ;92999C;
    dw $6804,$01FD                                                       ;92999D;
    db $E8                                                               ;9299A1;
    dw $6805,$C3F2                                                       ;9299A2;
    db $F0                                                               ;9299A6;
    dw $2800,$C3FA                                                       ;9299A7;
    db $F0                                                               ;9299AB;
    dw $2802                                                             ;9299AC;

SamusSpritemaps_99AE:
    dw $0006,$01F3                                                       ;9299AE;
    db $E8                                                               ;9299B2;
    dw $2802,$0003                                                       ;9299B3;
    db $E8                                                               ;9299B7;
    dw $2803,$01FB                                                       ;9299B8;
    db $E8                                                               ;9299BC;
    dw $2804,$0003                                                       ;9299BD;
    db $F8                                                               ;9299C1;
    dw $2805,$0003                                                       ;9299C2;
    db $F0                                                               ;9299C6;
    dw $2806,$C3F3                                                       ;9299C7;
    db $F0                                                               ;9299CB;
    dw $2800                                                             ;9299CC;

SamusSpritemaps_99CE:
    dw $0005,$0004                                                       ;9299CE;
    db $E8                                                               ;9299D2;
    dw $2802,$01FC                                                       ;9299D3;
    db $E8                                                               ;9299D7;
    dw $2803,$01F4                                                       ;9299D8;
    db $F8                                                               ;9299DC;
    dw $2804,$01F4                                                       ;9299DD;
    db $F0                                                               ;9299E1;
    dw $2805,$C3FC                                                       ;9299E2;
    db $F0                                                               ;9299E6;
    dw $2800                                                             ;9299E7;

SamusSpritemaps_99E9:
    dw $0004,$0004                                                       ;9299E9;
    db $E8                                                               ;9299ED;
    dw $2806,$C3F4                                                       ;9299EE;
    db $E8                                                               ;9299F2;
    dw $2800,$C3F4                                                       ;9299F3;
    db $F0                                                               ;9299F7;
    dw $2802,$C3FC                                                       ;9299F8;
    db $F0                                                               ;9299FC;
    dw $2804                                                             ;9299FD;

SamusSpritemaps_99FF:
    dw $0006,$01E2                                                       ;9299FF;
    db $F4                                                               ;929A03;
    dw $6804,$01EA                                                       ;929A04;
    db $F4                                                               ;929A08;
    dw $6805,$C3EC                                                       ;929A09;
    db $F0                                                               ;929A0D;
    dw $2800,$0004                                                       ;929A0E;
    db $08                                                               ;929A12;
    dw $2806,$0004                                                       ;929A13;
    db $00                                                               ;929A17;
    dw $2807,$C3FC                                                       ;929A18;
    db $F0                                                               ;929A1C;
    dw $2802                                                             ;929A1D;

SamusSpritemaps_9A1F:
    dw $0006,$0015                                                       ;929A1F;
    db $F4                                                               ;929A23;
    dw $2804,$000D                                                       ;929A24;
    db $F4                                                               ;929A28;
    dw $2805,$01F4                                                       ;929A29;
    db $08                                                               ;929A2D;
    dw $2806,$01F4                                                       ;929A2E;
    db $00                                                               ;929A32;
    dw $2807,$C204                                                       ;929A33;
    db $F0                                                               ;929A37;
    dw $2800,$C3F4                                                       ;929A38;
    db $F0                                                               ;929A3C;
    dw $2802                                                             ;929A3D;

SamusSpritemaps_9A3F:
    dw $0002,$C3FA                                                       ;929A3F;
    db $F8                                                               ;929A43;
    dw $2800,$C3FA                                                       ;929A44;
    db $F0                                                               ;929A48;
    dw $2802                                                             ;929A49;

SamusSpritemaps_9A4B:
    dw $0002,$C3F8                                                       ;929A4B;
    db $F8                                                               ;929A4F;
    dw $2800,$C3F8                                                       ;929A50;
    db $F0                                                               ;929A54;
    dw $2802                                                             ;929A55;

SamusSpritemaps_9A57:
    dw $0002,$C3F6                                                       ;929A57;
    db $F8                                                               ;929A5B;
    dw $2800,$C3F6                                                       ;929A5C;
    db $F0                                                               ;929A60;
    dw $2802                                                             ;929A61;

SamusSpritemaps_9A63:
    dw $0002,$C3F8                                                       ;929A63;
    db $F8                                                               ;929A67;
    dw $2800,$C3F8                                                       ;929A68;
    db $F0                                                               ;929A6C;
    dw $2802                                                             ;929A6D;

SamusSpritemaps_9A6F:
    dw $0002,$C3FC                                                       ;929A6F;
    db $F0                                                               ;929A73;
    dw $2800,$C3F4                                                       ;929A74;
    db $F0                                                               ;929A78;
    dw $2802                                                             ;929A79;

SamusSpritemaps_9A7B:
    dw $0002,$C3FC                                                       ;929A7B;
    db $F0                                                               ;929A7F;
    dw $2800,$C204                                                       ;929A80;
    db $F0                                                               ;929A84;
    dw $2802                                                             ;929A85;

SamusSpritemaps_9A87:
    dw $0002,$C3F4                                                       ;929A87;
    db $F0                                                               ;929A8B;
    dw $6800,$C3EC                                                       ;929A8C;
    db $F0                                                               ;929A90;
    dw $6802                                                             ;929A91;

SamusSpritemaps_9A93:
    dw $0005,$01ED                                                       ;929A93;
    db $F8                                                               ;929A97;
    dw $6806,$01F1                                                       ;929A98;
    db $F4                                                               ;929A9C;
    dw $6807,$C200                                                       ;929A9D;
    db $F8                                                               ;929AA1;
    dw $6800,$C3F0                                                       ;929AA2;
    db $F0                                                               ;929AA6;
    dw $6802,$C200                                                       ;929AA7;
    db $F0                                                               ;929AAB;
    dw $6804                                                             ;929AAC;

SamusSpritemaps_9AAE:
    dw $0005,$01F6                                                       ;929AAE;
    db $FC                                                               ;929AB2;
    dw $6806,$01F2                                                       ;929AB3;
    db $00                                                               ;929AB7;
    dw $6807,$C3F0                                                       ;929AB8;
    db $F8                                                               ;929ABC;
    dw $2800,$C200                                                       ;929ABD;
    db $F0                                                               ;929AC1;
    dw $2802,$C3F0                                                       ;929AC2;
    db $F0                                                               ;929AC6;
    dw $2804                                                             ;929AC7;

SamusSpritemaps_9AC9:
    dw $0001,$01F8                                                       ;929AC9;
    db $F8                                                               ;929ACD;
    dw $3800                                                             ;929ACE;

SamusSpritemaps_9AD0:
    dw $0001,$01F8                                                       ;929AD0;
    db $F8                                                               ;929AD4;
    dw $3800                                                             ;929AD5;

SamusSpritemaps_9AD7:
    dw $0006,$01F8                                                       ;929AD7;
    db $00                                                               ;929ADB;
    dw $2802,$0004                                                       ;929ADC;
    db $E8                                                               ;929AE0;
    dw $2803,$01FC                                                       ;929AE1;
    db $E8                                                               ;929AE5;
    dw $2804,$0004                                                       ;929AE6;
    db $F8                                                               ;929AEA;
    dw $2805,$0004                                                       ;929AEB;
    db $F0                                                               ;929AEF;
    dw $2806,$C3F4                                                       ;929AF0;
    db $F0                                                               ;929AF4;
    dw $2800                                                             ;929AF5;

SamusSpritemaps_9AF7:
    dw $0006,$01F7                                                       ;929AF7;
    db $00                                                               ;929AFB;
    dw $2802,$01F6                                                       ;929AFC;
    db $E8                                                               ;929B00;
    dw $6803,$01FE                                                       ;929B01;
    db $E8                                                               ;929B05;
    dw $6804,$01F3                                                       ;929B06;
    db $F8                                                               ;929B0A;
    dw $2805,$01F3                                                       ;929B0B;
    db $F0                                                               ;929B0F;
    dw $2806,$C3FB                                                       ;929B10;
    db $F0                                                               ;929B14;
    dw $2800                                                             ;929B15;

SamusSpritemaps_9B17:
    dw $0004,$01FF                                                       ;929B17;
    db $05                                                               ;929B1B;
    dw $E804,$01FF                                                       ;929B1C;
    db $0D                                                               ;929B20;
    dw $E805,$C3F8                                                       ;929B21;
    db $F0                                                               ;929B25;
    dw $2800,$C3F8                                                       ;929B26;
    db $F8                                                               ;929B2A;
    dw $2802                                                             ;929B2B;

SamusSpritemaps_9B2D:
    dw $0004,$01F8                                                       ;929B2D;
    db $05                                                               ;929B31;
    dw $A804,$01F8                                                       ;929B32;
    db $0D                                                               ;929B36;
    dw $A805,$C3F8                                                       ;929B37;
    db $F0                                                               ;929B3B;
    dw $2800,$C3F8                                                       ;929B3C;
    db $F8                                                               ;929B40;
    dw $2802                                                             ;929B41;

SamusSpritemaps_9B43:
    dw $0004,$C3F4                                                       ;929B43;
    db $F0                                                               ;929B47;
    dw $2800,$000C                                                       ;929B48;
    db $08                                                               ;929B4C;
    dw $2804,$000C                                                       ;929B4D;
    db $00                                                               ;929B51;
    dw $2805,$C204                                                       ;929B52;
    db $F0                                                               ;929B56;
    dw $2802                                                             ;929B57;

SamusSpritemaps_9B59:
    dw $0004,$C3FC                                                       ;929B59;
    db $F0                                                               ;929B5D;
    dw $2800,$01EC                                                       ;929B5E;
    db $08                                                               ;929B62;
    dw $2804,$01EC                                                       ;929B63;
    db $00                                                               ;929B67;
    dw $2805,$C3EC                                                       ;929B68;
    db $F0                                                               ;929B6C;
    dw $2802                                                             ;929B6D;

SamusSpritemaps_9B6F:
    dw $0003,$0001                                                       ;929B6F;
    db $FE                                                               ;929B73;
    dw $2802,$01F9                                                       ;929B74;
    db $FE                                                               ;929B78;
    dw $2803,$C3F7                                                       ;929B79;
    db $F0                                                               ;929B7D;
    dw $2800                                                             ;929B7E;

SamusSpritemaps_9B80:
    dw $0002,$C3F9                                                       ;929B80;
    db $F8                                                               ;929B84;
    dw $2800,$C3F9                                                       ;929B85;
    db $F0                                                               ;929B89;
    dw $2802                                                             ;929B8A;

SamusSpritemaps_9B8C:
    dw $0004,$01FE                                                       ;929B8C;
    db $03                                                               ;929B90;
    dw $2804,$01FA                                                       ;929B91;
    db $FF                                                               ;929B95;
    dw $2805,$C3F7                                                       ;929B96;
    db $F8                                                               ;929B9A;
    dw $2800,$C3F7                                                       ;929B9B;
    db $F0                                                               ;929B9F;
    dw $2802                                                             ;929BA0;

SamusSpritemaps_9BA2:
    dw $0002,$C3F9                                                       ;929BA2;
    db $F8                                                               ;929BA6;
    dw $2800,$C3F9                                                       ;929BA7;
    db $F0                                                               ;929BAB;
    dw $2802                                                             ;929BAC;

SamusSpritemaps_9BAE:
    dw $0003,$01FB                                                       ;929BAE;
    db $00                                                               ;929BB2;
    dw $2802,$01F7                                                       ;929BB3;
    db $FC                                                               ;929BB7;
    dw $2803,$C3F7                                                       ;929BB8;
    db $F0                                                               ;929BBC;
    dw $2800                                                             ;929BBD;

SamusSpritemaps_9BBF:
    dw $0002,$C3F9                                                       ;929BBF;
    db $F8                                                               ;929BC3;
    dw $2800,$C3F9                                                       ;929BC4;
    db $F0                                                               ;929BC8;
    dw $2802                                                             ;929BC9;

SamusSpritemaps_9BCB:
    dw $0006,$01FD                                                       ;929BCB;
    db $F9                                                               ;929BCF;
    dw $2802,$0005                                                       ;929BD0;
    db $F1                                                               ;929BD4;
    dw $2803,$01FD                                                       ;929BD5;
    db $F1                                                               ;929BD9;
    dw $2804,$000B                                                       ;929BDA;
    db $00                                                               ;929BDE;
    dw $2805,$0007                                                       ;929BDF;
    db $FC                                                               ;929BE3;
    dw $2806,$C3FA                                                       ;929BE4;
    db $EF                                                               ;929BE8;
    dw $2800                                                             ;929BE9;

SamusSpritemaps_9BEB:
    dw $0006,$01F1                                                       ;929BEB;
    db $FC                                                               ;929BEF;
    dw $6802,$01ED                                                       ;929BF0;
    db $00                                                               ;929BF4;
    dw $6803,$01FC                                                       ;929BF5;
    db $F9                                                               ;929BF9;
    dw $2804,$01F4                                                       ;929BFA;
    db $F1                                                               ;929BFE;
    dw $2805,$01FC                                                       ;929BFF;
    db $F1                                                               ;929C03;
    dw $2806,$C3F6                                                       ;929C04;
    db $EF                                                               ;929C08;
    dw $2800                                                             ;929C09;

SamusSpritemaps_9C0B:
    dw $0005,$01F9                                                       ;929C0B;
    db $F0                                                               ;929C0F;
    dw $6802,$0001                                                       ;929C10;
    db $F0                                                               ;929C14;
    dw $6803,$C3F9                                                       ;929C15;
    db $F8                                                               ;929C19;
    dw $2800,$000A                                                       ;929C1A;
    db $FD                                                               ;929C1E;
    dw $2804,$0002                                                       ;929C1F;
    db $FD                                                               ;929C23;
    dw $2805                                                             ;929C24;

SamusSpritemaps_9C26:
    dw $0005,$01F9                                                       ;929C26;
    db $F0                                                               ;929C2A;
    dw $6802,$0001                                                       ;929C2B;
    db $F0                                                               ;929C2F;
    dw $6803,$C3F9                                                       ;929C30;
    db $F8                                                               ;929C34;
    dw $2800,$000A                                                       ;929C35;
    db $FD                                                               ;929C39;
    dw $2804,$0002                                                       ;929C3A;
    db $FD                                                               ;929C3E;
    dw $2805                                                             ;929C3F;

SamusSpritemaps_9C41:
    dw $0005,$01F9                                                       ;929C41;
    db $F0                                                               ;929C45;
    dw $6802,$0001                                                       ;929C46;
    db $F0                                                               ;929C4A;
    dw $6803,$C3F9                                                       ;929C4B;
    db $F8                                                               ;929C4F;
    dw $2800,$000A                                                       ;929C50;
    db $FD                                                               ;929C54;
    dw $2804,$0002                                                       ;929C55;
    db $FD                                                               ;929C59;
    dw $2805                                                             ;929C5A;

SamusSpritemaps_9C5C:
    dw $0005,$01F9                                                       ;929C5C;
    db $F0                                                               ;929C60;
    dw $6802,$0001                                                       ;929C61;
    db $F0                                                               ;929C65;
    dw $6803,$C3F9                                                       ;929C66;
    db $F8                                                               ;929C6A;
    dw $2800,$000A                                                       ;929C6B;
    db $FD                                                               ;929C6F;
    dw $2804,$0002                                                       ;929C70;
    db $FD                                                               ;929C74;
    dw $2805                                                             ;929C75;

SamusSpritemaps_9C77:
    dw $0005,$01F7                                                       ;929C77;
    db $F0                                                               ;929C7B;
    dw $2802,$01FF                                                       ;929C7C;
    db $F0                                                               ;929C80;
    dw $2803,$C3F7                                                       ;929C81;
    db $F8                                                               ;929C85;
    dw $2800,$01EE                                                       ;929C86;
    db $FD                                                               ;929C8A;
    dw $6804,$01F6                                                       ;929C8B;
    db $FD                                                               ;929C8F;
    dw $6805                                                             ;929C90;

SamusSpritemaps_9C92:
    dw $0005,$01F7                                                       ;929C92;
    db $F0                                                               ;929C96;
    dw $2802,$01FF                                                       ;929C97;
    db $F0                                                               ;929C9B;
    dw $2803,$C3F7                                                       ;929C9C;
    db $F8                                                               ;929CA0;
    dw $2800,$01EE                                                       ;929CA1;
    db $FD                                                               ;929CA5;
    dw $6804,$01F6                                                       ;929CA6;
    db $FD                                                               ;929CAA;
    dw $6805                                                             ;929CAB;

SamusSpritemaps_9CAD:
    dw $0005,$01FF                                                       ;929CAD;
    db $F0                                                               ;929CB1;
    dw $2802,$01F7                                                       ;929CB2;
    db $F0                                                               ;929CB6;
    dw $2803,$C3F7                                                       ;929CB7;
    db $F8                                                               ;929CBB;
    dw $2800,$01EE                                                       ;929CBC;
    db $FD                                                               ;929CC0;
    dw $6804,$01F6                                                       ;929CC1;
    db $FD                                                               ;929CC5;
    dw $6805                                                             ;929CC6;

SamusSpritemaps_9CC8:
    dw $0005,$01FF                                                       ;929CC8;
    db $F0                                                               ;929CCC;
    dw $2802,$01F7                                                       ;929CCD;
    db $F0                                                               ;929CD1;
    dw $2803,$C3F7                                                       ;929CD2;
    db $F8                                                               ;929CD6;
    dw $2800,$01EE                                                       ;929CD7;
    db $FD                                                               ;929CDB;
    dw $6804,$01F6                                                       ;929CDC;
    db $FD                                                               ;929CE0;
    dw $6805                                                             ;929CE1;

SamusSpritemaps_9CE3:
    dw $0005,$000C                                                       ;929CE3;
    db $E9                                                               ;929CE7;
    dw $6802,$01FD                                                       ;929CE8;
    db $F6                                                               ;929CEC;
    dw $2803,$01FD                                                       ;929CED;
    db $EE                                                               ;929CF1;
    dw $2804,$0008                                                       ;929CF2;
    db $ED                                                               ;929CF6;
    dw $6805,$C3FB                                                       ;929CF7;
    db $EF                                                               ;929CFB;
    dw $2800                                                             ;929CFC;

SamusSpritemaps_9CFE:
    dw $0006,$01FB                                                       ;929CFE;
    db $F9                                                               ;929D02;
    dw $2802,$01FB                                                       ;929D03;
    db $F1                                                               ;929D07;
    dw $2803,$01F3                                                       ;929D08;
    db $F1                                                               ;929D0C;
    dw $2804,$01EC                                                       ;929D0D;
    db $E9                                                               ;929D11;
    dw $2805,$01F0                                                       ;929D12;
    db $ED                                                               ;929D16;
    dw $2806,$C3F5                                                       ;929D17;
    db $EF                                                               ;929D1B;
    dw $2800                                                             ;929D1C;

SamusSpritemaps_9D1E:
    dw $0007,$01F5                                                       ;929D1E;
    db $F1                                                               ;929D22;
    dw $2802,$01FD                                                       ;929D23;
    db $F1                                                               ;929D27;
    dw $2803,$01E7                                                       ;929D28;
    db $FA                                                               ;929D2C;
    dw $6804,$C3F6                                                       ;929D2D;
    db $EF                                                               ;929D31;
    dw $2800,$01EF                                                       ;929D32;
    db $FA                                                               ;929D36;
    dw $6805,$01FE                                                       ;929D37;
    db $FF                                                               ;929D3B;
    dw $2806,$01F6                                                       ;929D3C;
    db $FF                                                               ;929D40;
    dw $2807                                                             ;929D41;

SamusSpritemaps_9D43:
    dw $0007,$01FC                                                       ;929D43;
    db $F9                                                               ;929D47;
    dw $2802,$0004                                                       ;929D48;
    db $F1                                                               ;929D4C;
    dw $2803,$01FC                                                       ;929D4D;
    db $F1                                                               ;929D51;
    dw $2804,$0011                                                       ;929D52;
    db $FA                                                               ;929D56;
    dw $2805,$0002                                                       ;929D57;
    db $FF                                                               ;929D5B;
    dw $2806,$C3FA                                                       ;929D5C;
    db $EF                                                               ;929D60;
    dw $2800,$0009                                                       ;929D61;
    db $FA                                                               ;929D65;
    dw $2807                                                             ;929D66;

SamusSpritemaps_9D68:
    dw $0007,$01F5                                                       ;929D68;
    db $F1                                                               ;929D6C;
    dw $2802,$01FD                                                       ;929D6D;
    db $F1                                                               ;929D71;
    dw $2803,$01E7                                                       ;929D72;
    db $F9                                                               ;929D76;
    dw $6804,$C3F6                                                       ;929D77;
    db $EE                                                               ;929D7B;
    dw $2800,$01EF                                                       ;929D7C;
    db $F9                                                               ;929D80;
    dw $6805,$01FE                                                       ;929D81;
    db $FE                                                               ;929D85;
    dw $2806,$01F6                                                       ;929D86;
    db $FE                                                               ;929D8A;
    dw $2807                                                             ;929D8B;

SamusSpritemaps_9D8D:
    dw $0007,$01FC                                                       ;929D8D;
    db $F9                                                               ;929D91;
    dw $2802,$0004                                                       ;929D92;
    db $F1                                                               ;929D96;
    dw $2803,$01FC                                                       ;929D97;
    db $F1                                                               ;929D9B;
    dw $2804,$0011                                                       ;929D9C;
    db $F9                                                               ;929DA0;
    dw $2805,$0002                                                       ;929DA1;
    db $FE                                                               ;929DA5;
    dw $2806,$C3FA                                                       ;929DA6;
    db $EE                                                               ;929DAA;
    dw $2800,$0009                                                       ;929DAB;
    db $F9                                                               ;929DAF;
    dw $2807                                                             ;929DB0;

SamusSpritemaps_9DB2:
    dw $0005,$000C                                                       ;929DB2;
    db $E8                                                               ;929DB6;
    dw $6802,$01FD                                                       ;929DB7;
    db $F6                                                               ;929DBB;
    dw $2803,$01FD                                                       ;929DBC;
    db $EE                                                               ;929DC0;
    dw $2804,$0008                                                       ;929DC1;
    db $EC                                                               ;929DC5;
    dw $6805,$C3FB                                                       ;929DC6;
    db $EE                                                               ;929DCA;
    dw $2800                                                             ;929DCB;

SamusSpritemaps_9DCD:
    dw $0006,$01FB                                                       ;929DCD;
    db $F9                                                               ;929DD1;
    dw $2802,$01FB                                                       ;929DD2;
    db $F1                                                               ;929DD6;
    dw $2803,$01F3                                                       ;929DD7;
    db $F1                                                               ;929DDB;
    dw $2804,$01EC                                                       ;929DDC;
    db $E8                                                               ;929DE0;
    dw $2805,$01F0                                                       ;929DE1;
    db $EC                                                               ;929DE5;
    dw $2806,$C3F5                                                       ;929DE6;
    db $EE                                                               ;929DEA;
    dw $2800                                                             ;929DEB;

SamusSpritemaps_9DED:
    dw $0006,$01FD                                                       ;929DED;
    db $F9                                                               ;929DF1;
    dw $2802,$0005                                                       ;929DF2;
    db $F1                                                               ;929DF6;
    dw $2803,$01FD                                                       ;929DF7;
    db $F1                                                               ;929DFB;
    dw $2804,$000B                                                       ;929DFC;
    db $FF                                                               ;929E00;
    dw $2805,$0007                                                       ;929E01;
    db $FB                                                               ;929E05;
    dw $2806,$C3FA                                                       ;929E06;
    db $EE                                                               ;929E0A;
    dw $2800                                                             ;929E0B;

SamusSpritemaps_9E0D:
    dw $0006,$01F1                                                       ;929E0D;
    db $FB                                                               ;929E11;
    dw $6802,$01FC                                                       ;929E12;
    db $F9                                                               ;929E16;
    dw $2803,$01F4                                                       ;929E17;
    db $F1                                                               ;929E1B;
    dw $2804,$01FC                                                       ;929E1C;
    db $F1                                                               ;929E20;
    dw $2805,$01ED                                                       ;929E21;
    db $FF                                                               ;929E25;
    dw $6806,$C3F6                                                       ;929E26;
    db $EE                                                               ;929E2A;
    dw $2800                                                             ;929E2B;

SamusSpritemaps_9E2D:
    dw $0005,$0001                                                       ;929E2D;
    db $FF                                                               ;929E31;
    dw $2802,$01F9                                                       ;929E32;
    db $FF                                                               ;929E36;
    dw $2803,$C3F9                                                       ;929E37;
    db $EF                                                               ;929E3B;
    dw $2800,$000A                                                       ;929E3C;
    db $FC                                                               ;929E40;
    dw $2804,$0002                                                       ;929E41;
    db $FC                                                               ;929E45;
    dw $2805                                                             ;929E46;

SamusSpritemaps_9E48:
    dw $0005,$01FF                                                       ;929E48;
    db $FF                                                               ;929E4C;
    dw $2802,$01F7                                                       ;929E4D;
    db $FF                                                               ;929E51;
    dw $2803,$C3F7                                                       ;929E52;
    db $EF                                                               ;929E56;
    dw $2800,$01EE                                                       ;929E57;
    db $FC                                                               ;929E5B;
    dw $6804,$01F6                                                       ;929E5C;
    db $FC                                                               ;929E60;
    dw $6805                                                             ;929E61;

SamusSpritemaps_9E63:
    dw $0006,$0005                                                       ;929E63;
    db $F7                                                               ;929E67;
    dw $2802,$01FD                                                       ;929E68;
    db $F7                                                               ;929E6C;
    dw $2803,$01F9                                                       ;929E6D;
    db $F5                                                               ;929E71;
    dw $2804,$01F9                                                       ;929E72;
    db $F7                                                               ;929E76;
    dw $6805,$01F9                                                       ;929E77;
    db $EF                                                               ;929E7B;
    dw $6806,$C3FA                                                       ;929E7C;
    db $F0                                                               ;929E80;
    dw $6800                                                             ;929E81;

SamusSpritemaps_9E83:
    dw $0005,$0005                                                       ;929E83;
    db $EF                                                               ;929E87;
    dw $2802,$01FD                                                       ;929E88;
    db $EF                                                               ;929E8C;
    dw $2803,$01F9                                                       ;929E8D;
    db $F6                                                               ;929E91;
    dw $6804,$01F9                                                       ;929E92;
    db $EE                                                               ;929E96;
    dw $6805,$C3FA                                                       ;929E97;
    db $F0                                                               ;929E9B;
    dw $6800                                                             ;929E9C;

SamusSpritemaps_9E9E:
    dw $0005,$01FD                                                       ;929E9E;
    db $F6                                                               ;929EA2;
    dw $2802,$01F5                                                       ;929EA3;
    db $F6                                                               ;929EA7;
    dw $2803,$01FE                                                       ;929EA8;
    db $F7                                                               ;929EAC;
    dw $2804,$01FE                                                       ;929EAD;
    db $EF                                                               ;929EB1;
    dw $2805,$C3F6                                                       ;929EB2;
    db $F0                                                               ;929EB6;
    dw $2800                                                             ;929EB7;

SamusSpritemaps_9EB9:
    dw $0005,$01F9                                                       ;929EB9;
    db $F0                                                               ;929EBD;
    dw $2802,$01F1                                                       ;929EBE;
    db $F0                                                               ;929EC2;
    dw $2803,$01FE                                                       ;929EC3;
    db $F6                                                               ;929EC7;
    dw $2804,$01FE                                                       ;929EC8;
    db $EE                                                               ;929ECC;
    dw $2805,$C3F6                                                       ;929ECD;
    db $F0                                                               ;929ED1;
    dw $2800                                                             ;929ED2;

SamusSpritemaps_9ED4:
    dw $0006,$01FE                                                       ;929ED4;
    db $F4                                                               ;929ED8;
    dw $2802,$01F6                                                       ;929ED9;
    db $F4                                                               ;929EDD;
    dw $2803,$01F2                                                       ;929EDE;
    db $02                                                               ;929EE2;
    dw $2804,$01FA                                                       ;929EE3;
    db $02                                                               ;929EE7;
    dw $2805,$01FA                                                       ;929EE8;
    db $FA                                                               ;929EEC;
    dw $2806,$C3F6                                                       ;929EED;
    db $F2                                                               ;929EF1;
    dw $2800                                                             ;929EF2;

SamusSpritemaps_9EF4:
    dw $0006,$01FD                                                       ;929EF4;
    db $F5                                                               ;929EF8;
    dw $2802,$01F5                                                       ;929EF9;
    db $F5                                                               ;929EFD;
    dw $2803,$01F3                                                       ;929EFE;
    db $03                                                               ;929F02;
    dw $2804,$01FB                                                       ;929F03;
    db $03                                                               ;929F07;
    dw $2805,$01FB                                                       ;929F08;
    db $FB                                                               ;929F0C;
    dw $2806,$C3F6                                                       ;929F0D;
    db $F3                                                               ;929F11;
    dw $2800                                                             ;929F12;

SamusSpritemaps_9F14:
    dw $0006,$01FC                                                       ;929F14;
    db $F6                                                               ;929F18;
    dw $2802,$01F4                                                       ;929F19;
    db $F6                                                               ;929F1D;
    dw $2803,$01F4                                                       ;929F1E;
    db $04                                                               ;929F22;
    dw $2804,$01FC                                                       ;929F23;
    db $04                                                               ;929F27;
    dw $2805,$01FC                                                       ;929F28;
    db $FC                                                               ;929F2C;
    dw $2806,$C3F6                                                       ;929F2D;
    db $F4                                                               ;929F31;
    dw $2800                                                             ;929F32;

SamusSpritemaps_9F34:
    dw $0007,$0000                                                       ;929F34;
    db $00                                                               ;929F38;
    dw $2802,$0004                                                       ;929F39;
    db $04                                                               ;929F3D;
    dw $2803,$01FE                                                       ;929F3E;
    db $02                                                               ;929F42;
    dw $6804,$01FA                                                       ;929F43;
    db $F4                                                               ;929F47;
    dw $6805,$0002                                                       ;929F48;
    db $F4                                                               ;929F4C;
    dw $6806,$01FE                                                       ;929F4D;
    db $FA                                                               ;929F51;
    dw $6807,$C3FA                                                       ;929F52;
    db $F2                                                               ;929F56;
    dw $6800                                                             ;929F57;

SamusSpritemaps_9F59:
    dw $0007,$01FF                                                       ;929F59;
    db $01                                                               ;929F5D;
    dw $2802,$0003                                                       ;929F5E;
    db $05                                                               ;929F62;
    dw $2803,$01FB                                                       ;929F63;
    db $F5                                                               ;929F67;
    dw $6804,$0003                                                       ;929F68;
    db $F5                                                               ;929F6C;
    dw $6805,$01FD                                                       ;929F6D;
    db $03                                                               ;929F71;
    dw $6806,$01FD                                                       ;929F72;
    db $FB                                                               ;929F76;
    dw $6807,$C3FA                                                       ;929F77;
    db $F3                                                               ;929F7B;
    dw $6800                                                             ;929F7C;

SamusSpritemaps_9F7E:
    dw $0007,$01FE                                                       ;929F7E;
    db $02                                                               ;929F82;
    dw $2802,$0002                                                       ;929F83;
    db $06                                                               ;929F87;
    dw $2803,$01FC                                                       ;929F88;
    db $F6                                                               ;929F8C;
    dw $6804,$0004                                                       ;929F8D;
    db $F6                                                               ;929F91;
    dw $6805,$01FC                                                       ;929F92;
    db $04                                                               ;929F96;
    dw $6806,$01FC                                                       ;929F97;
    db $FC                                                               ;929F9B;
    dw $6807,$C3FA                                                       ;929F9C;
    db $F4                                                               ;929FA0;
    dw $6800                                                             ;929FA1;

SamusSpritemaps_9FA3:
    dw $0006,$01FE                                                       ;929FA3;
    db $F4                                                               ;929FA7;
    dw $2802,$01F6                                                       ;929FA8;
    db $F4                                                               ;929FAC;
    dw $2803,$01F2                                                       ;929FAD;
    db $02                                                               ;929FB1;
    dw $2804,$01FA                                                       ;929FB2;
    db $02                                                               ;929FB6;
    dw $2805,$01FA                                                       ;929FB7;
    db $FA                                                               ;929FBB;
    dw $2806,$C3F6                                                       ;929FBC;
    db $F2                                                               ;929FC0;
    dw $2800                                                             ;929FC1;

SamusSpritemaps_9FC3:
    dw $0006,$01FD                                                       ;929FC3;
    db $F5                                                               ;929FC7;
    dw $2802,$01F5                                                       ;929FC8;
    db $F5                                                               ;929FCC;
    dw $2803,$01F3                                                       ;929FCD;
    db $03                                                               ;929FD1;
    dw $2804,$01FB                                                       ;929FD2;
    db $03                                                               ;929FD6;
    dw $2805,$01FB                                                       ;929FD7;
    db $FB                                                               ;929FDB;
    dw $2806,$C3F6                                                       ;929FDC;
    db $F3                                                               ;929FE0;
    dw $2800                                                             ;929FE1;

SamusSpritemaps_9FE3:
    dw $0006,$01FC                                                       ;929FE3;
    db $F6                                                               ;929FE7;
    dw $2802,$01F4                                                       ;929FE8;
    db $F6                                                               ;929FEC;
    dw $2803,$01F4                                                       ;929FED;
    db $04                                                               ;929FF1;
    dw $2804,$01FC                                                       ;929FF2;
    db $04                                                               ;929FF6;
    dw $2805,$01FC                                                       ;929FF7;
    db $FC                                                               ;929FFB;
    dw $2806,$C3F6                                                       ;929FFC;
    db $F4                                                               ;92A000;
    dw $2800                                                             ;92A001;

SamusSpritemaps_A003:
    dw $0007,$0000                                                       ;92A003;
    db $00                                                               ;92A007;
    dw $2802,$0004                                                       ;92A008;
    db $04                                                               ;92A00C;
    dw $2803,$01FA                                                       ;92A00D;
    db $F4                                                               ;92A011;
    dw $6804,$0002                                                       ;92A012;
    db $F4                                                               ;92A016;
    dw $6805,$01FE                                                       ;92A017;
    db $02                                                               ;92A01B;
    dw $6806,$01FE                                                       ;92A01C;
    db $FA                                                               ;92A020;
    dw $6807,$C3FA                                                       ;92A021;
    db $F2                                                               ;92A025;
    dw $6800                                                             ;92A026;

SamusSpritemaps_A028:
    dw $0007,$01FF                                                       ;92A028;
    db $01                                                               ;92A02C;
    dw $2802,$0003                                                       ;92A02D;
    db $05                                                               ;92A031;
    dw $2803,$01FB                                                       ;92A032;
    db $F5                                                               ;92A036;
    dw $6804,$0003                                                       ;92A037;
    db $F5                                                               ;92A03B;
    dw $6805,$01FD                                                       ;92A03C;
    db $03                                                               ;92A040;
    dw $6806,$01FD                                                       ;92A041;
    db $FB                                                               ;92A045;
    dw $6807,$C3FA                                                       ;92A046;
    db $F3                                                               ;92A04A;
    dw $6800                                                             ;92A04B;

SamusSpritemaps_A04D:
    dw $0007,$01FE                                                       ;92A04D;
    db $02                                                               ;92A051;
    dw $2802,$0002                                                       ;92A052;
    db $06                                                               ;92A056;
    dw $2803,$01FC                                                       ;92A057;
    db $F6                                                               ;92A05B;
    dw $6804,$0004                                                       ;92A05C;
    db $F6                                                               ;92A060;
    dw $6805,$01FC                                                       ;92A061;
    db $04                                                               ;92A065;
    dw $6806,$01FC                                                       ;92A066;
    db $FC                                                               ;92A06A;
    dw $6807,$C3FA                                                       ;92A06B;
    db $F4                                                               ;92A06F;
    dw $6800                                                             ;92A070;

SamusSpritemaps_A072:
    dw $0004,$C3F9                                                       ;92A072;
    db $F8                                                               ;92A076;
    dw $2800,$C3F9                                                       ;92A077;
    db $F0                                                               ;92A07B;
    dw $2802,$000A                                                       ;92A07C;
    db $FD                                                               ;92A080;
    dw $2804,$0002                                                       ;92A081;
    db $FD                                                               ;92A085;
    dw $2805                                                             ;92A086;

SamusSpritemaps_A088:
    dw $0004,$C3F9                                                       ;92A088;
    db $F8                                                               ;92A08C;
    dw $2800,$C3F9                                                       ;92A08D;
    db $F0                                                               ;92A091;
    dw $2802,$000A                                                       ;92A092;
    db $FD                                                               ;92A096;
    dw $2804,$0002                                                       ;92A097;
    db $FD                                                               ;92A09B;
    dw $2805                                                             ;92A09C;

SamusSpritemaps_A09E:
    dw $0004,$C3F9                                                       ;92A09E;
    db $F8                                                               ;92A0A2;
    dw $2800,$C3F9                                                       ;92A0A3;
    db $F0                                                               ;92A0A7;
    dw $2802,$000A                                                       ;92A0A8;
    db $FD                                                               ;92A0AC;
    dw $2804,$0002                                                       ;92A0AD;
    db $FD                                                               ;92A0B1;
    dw $2805                                                             ;92A0B2;

SamusSpritemaps_A0B4:
    dw $0004,$C3F7                                                       ;92A0B4;
    db $F8                                                               ;92A0B8;
    dw $2800,$C3F7                                                       ;92A0B9;
    db $F0                                                               ;92A0BD;
    dw $2802,$01EE                                                       ;92A0BE;
    db $FD                                                               ;92A0C2;
    dw $6804,$01F6                                                       ;92A0C3;
    db $FD                                                               ;92A0C7;
    dw $6805                                                             ;92A0C8;

SamusSpritemaps_A0CA:
    dw $0004,$C3F7                                                       ;92A0CA;
    db $F8                                                               ;92A0CE;
    dw $2800,$C3F7                                                       ;92A0CF;
    db $F0                                                               ;92A0D3;
    dw $2802,$01EE                                                       ;92A0D4;
    db $FD                                                               ;92A0D8;
    dw $6804,$01F6                                                       ;92A0D9;
    db $FD                                                               ;92A0DD;
    dw $6805                                                             ;92A0DE;

SamusSpritemaps_A0E0:
    dw $0004,$C3F7                                                       ;92A0E0;
    db $F8                                                               ;92A0E4;
    dw $2800,$C3F7                                                       ;92A0E5;
    db $F0                                                               ;92A0E9;
    dw $2802,$01EE                                                       ;92A0EA;
    db $FD                                                               ;92A0EE;
    dw $6804,$01F6                                                       ;92A0EF;
    db $FD                                                               ;92A0F3;
    dw $6805                                                             ;92A0F4;

SamusSpritemaps_A0F6:
    dw $0005,$0001                                                       ;92A0F6;
    db $00                                                               ;92A0FA;
    dw $2802,$01F9                                                       ;92A0FB;
    db $00                                                               ;92A0FF;
    dw $2803,$C3F9                                                       ;92A100;
    db $F0                                                               ;92A104;
    dw $2800,$000A                                                       ;92A105;
    db $FD                                                               ;92A109;
    dw $2804,$0002                                                       ;92A10A;
    db $FD                                                               ;92A10E;
    dw $2805                                                             ;92A10F;

SamusSpritemaps_A111:
    dw $0005,$01FF                                                       ;92A111;
    db $00                                                               ;92A115;
    dw $2802,$01F7                                                       ;92A116;
    db $00                                                               ;92A11A;
    dw $2803,$C3F7                                                       ;92A11B;
    db $F0                                                               ;92A11F;
    dw $2800,$01EE                                                       ;92A120;
    db $FD                                                               ;92A124;
    dw $6804,$01F6                                                       ;92A125;
    db $FD                                                               ;92A129;
    dw $6805                                                             ;92A12A;

SamusSpritemaps_A12C:
    dw $0001,$01F8                                                       ;92A12C;
    db $F8                                                               ;92A130;
    dw $3000                                                             ;92A131;

SamusSpritemaps_A133:
    dw $0001,$01F8                                                       ;92A133;
    db $F8                                                               ;92A137;
    dw $3800                                                             ;92A138;

SamusSpritemaps_A13A:
    dw $0009,$0004                                                       ;92A13A;
    db $10                                                               ;92A13E;
    dw $3800,$0004                                                       ;92A13F;
    db $08                                                               ;92A143;
    dw $3801,$01FC                                                       ;92A144;
    db $08                                                               ;92A148;
    dw $3802,$01FC                                                       ;92A149;
    db $00                                                               ;92A14D;
    dw $3803,$01FC                                                       ;92A14E;
    db $F8                                                               ;92A152;
    dw $3804,$0004                                                       ;92A153;
    db $F0                                                               ;92A157;
    dw $3805,$01FC                                                       ;92A158;
    db $F0                                                               ;92A15C;
    dw $3806,$01F4                                                       ;92A15D;
    db $F0                                                               ;92A161;
    dw $3807,$01F4                                                       ;92A162;
    db $E8                                                               ;92A166;
    dw $3810                                                             ;92A167;

SamusSpritemaps_A169:
    dw $0007,$0004                                                       ;92A169;
    db $00                                                               ;92A16D;
    dw $3800,$01FC                                                       ;92A16E;
    db $00                                                               ;92A172;
    dw $3801,$01F4                                                       ;92A173;
    db $00                                                               ;92A177;
    dw $3802,$0004                                                       ;92A178;
    db $F8                                                               ;92A17C;
    dw $3803,$01FC                                                       ;92A17D;
    db $F8                                                               ;92A181;
    dw $3804,$01F4                                                       ;92A182;
    db $F8                                                               ;92A186;
    dw $3805,$01F4                                                       ;92A187;
    db $F0                                                               ;92A18B;
    dw $3806                                                             ;92A18C;

SamusSpritemaps_A18E:
    dw $000B,$01FC                                                       ;92A18E;
    db $10                                                               ;92A192;
    dw $3800,$01F4                                                       ;92A193;
    db $10                                                               ;92A197;
    dw $3801,$01FC                                                       ;92A198;
    db $08                                                               ;92A19C;
    dw $3802,$01F4                                                       ;92A19D;
    db $08                                                               ;92A1A1;
    dw $3803,$0004                                                       ;92A1A2;
    db $00                                                               ;92A1A6;
    dw $3804,$01FC                                                       ;92A1A7;
    db $00                                                               ;92A1AB;
    dw $3805,$0004                                                       ;92A1AC;
    db $F8                                                               ;92A1B0;
    dw $3806,$01FC                                                       ;92A1B1;
    db $F8                                                               ;92A1B5;
    dw $3807,$01FC                                                       ;92A1B6;
    db $F0                                                               ;92A1BA;
    dw $3810,$0004                                                       ;92A1BB;
    db $E8                                                               ;92A1BF;
    dw $3811,$01FC                                                       ;92A1C0;
    db $E8                                                               ;92A1C4;
    dw $3812                                                             ;92A1C5;

SamusSpritemaps_A1C7:
    dw $000F,$01FC                                                       ;92A1C7;
    db $10                                                               ;92A1CB;
    dw $3800,$01F4                                                       ;92A1CC;
    db $10                                                               ;92A1D0;
    dw $3801,$01FC                                                       ;92A1D1;
    db $08                                                               ;92A1D5;
    dw $3802,$01F4                                                       ;92A1D6;
    db $08                                                               ;92A1DA;
    dw $3803,$0004                                                       ;92A1DB;
    db $00                                                               ;92A1DF;
    dw $3804,$01FC                                                       ;92A1E0;
    db $00                                                               ;92A1E4;
    dw $3805,$01F4                                                       ;92A1E5;
    db $00                                                               ;92A1E9;
    dw $3806,$0004                                                       ;92A1EA;
    db $F8                                                               ;92A1EE;
    dw $3807,$01FC                                                       ;92A1EF;
    db $F8                                                               ;92A1F3;
    dw $3810,$01F4                                                       ;92A1F4;
    db $F8                                                               ;92A1F8;
    dw $3811,$0004                                                       ;92A1F9;
    db $F0                                                               ;92A1FD;
    dw $3812,$01FC                                                       ;92A1FE;
    db $F0                                                               ;92A202;
    dw $3813,$01F4                                                       ;92A203;
    db $F0                                                               ;92A207;
    dw $3814,$0004                                                       ;92A208;
    db $E8                                                               ;92A20C;
    dw $3815,$01FC                                                       ;92A20D;
    db $E8                                                               ;92A211;
    dw $3816                                                             ;92A212;

SamusSpritemaps_A214:
    dw $0008,$01FC                                                       ;92A214;
    db $10                                                               ;92A218;
    dw $3800,$01FC                                                       ;92A219;
    db $08                                                               ;92A21D;
    dw $3801,$01FC                                                       ;92A21E;
    db $00                                                               ;92A222;
    dw $3802,$0004                                                       ;92A223;
    db $F8                                                               ;92A227;
    dw $3803,$01F4                                                       ;92A228;
    db $F8                                                               ;92A22C;
    dw $3804,$0004                                                       ;92A22D;
    db $F0                                                               ;92A231;
    dw $3805,$01F4                                                       ;92A232;
    db $F0                                                               ;92A236;
    dw $3806,$0004                                                       ;92A237;
    db $E8                                                               ;92A23B;
    dw $3807                                                             ;92A23C;

SamusSpritemaps_A23E:
    dw $000A,$01FC                                                       ;92A23E;
    db $10                                                               ;92A242;
    dw $3800,$0004                                                       ;92A243;
    db $08                                                               ;92A247;
    dw $3801,$01FC                                                       ;92A248;
    db $08                                                               ;92A24C;
    dw $3802,$0004                                                       ;92A24D;
    db $00                                                               ;92A251;
    dw $3803,$01FC                                                       ;92A252;
    db $00                                                               ;92A256;
    dw $3804,$0004                                                       ;92A257;
    db $F0                                                               ;92A25B;
    dw $3805,$01FC                                                       ;92A25C;
    db $F0                                                               ;92A260;
    dw $3806,$01F4                                                       ;92A261;
    db $F0                                                               ;92A265;
    dw $3807,$0004                                                       ;92A266;
    db $E8                                                               ;92A26A;
    dw $3810,$01FC                                                       ;92A26B;
    db $E8                                                               ;92A26F;
    dw $3811                                                             ;92A270;

SamusSpritemaps_A272:
    dw $000B,$01F4                                                       ;92A272;
    db $10                                                               ;92A276;
    dw $3800,$0004                                                       ;92A277;
    db $08                                                               ;92A27B;
    dw $3801,$01FC                                                       ;92A27C;
    db $08                                                               ;92A280;
    dw $3802,$01F4                                                       ;92A281;
    db $08                                                               ;92A285;
    dw $3803,$0004                                                       ;92A286;
    db $00                                                               ;92A28A;
    dw $3804,$01FC                                                       ;92A28B;
    db $00                                                               ;92A28F;
    dw $3805,$01F4                                                       ;92A290;
    db $00                                                               ;92A294;
    dw $3806,$01F4                                                       ;92A295;
    db $F0                                                               ;92A299;
    dw $3807,$0004                                                       ;92A29A;
    db $E8                                                               ;92A29E;
    dw $3810,$01FC                                                       ;92A29F;
    db $E8                                                               ;92A2A3;
    dw $3811,$01F4                                                       ;92A2A4;
    db $E8                                                               ;92A2A8;
    dw $3812                                                             ;92A2A9;

SamusSpritemaps_A2AB:
    dw $0007,$0004                                                       ;92A2AB;
    db $08                                                               ;92A2AF;
    dw $3800,$01F4                                                       ;92A2B0;
    db $08                                                               ;92A2B4;
    dw $3801,$01F4                                                       ;92A2B5;
    db $00                                                               ;92A2B9;
    dw $3802,$0004                                                       ;92A2BA;
    db $F8                                                               ;92A2BE;
    dw $3803,$0004                                                       ;92A2BF;
    db $E8                                                               ;92A2C3;
    dw $3804,$01FC                                                       ;92A2C4;
    db $E8                                                               ;92A2C8;
    dw $3805,$01F4                                                       ;92A2C9;
    db $E8                                                               ;92A2CD;
    dw $3806                                                             ;92A2CE;

SamusSpritemaps_A2D0:
    dw $0003,$0011                                                       ;92A2D0;
    db $FA                                                               ;92A2D4;
    dw $2802,$0009                                                       ;92A2D5;
    db $FA                                                               ;92A2D9;
    dw $2803,$C3FA                                                       ;92A2DA;
    db $F0                                                               ;92A2DE;
    dw $2800                                                             ;92A2DF;

SamusSpritemaps_A2E1:
    dw $0003,$0011                                                       ;92A2E1;
    db $F9                                                               ;92A2E5;
    dw $2802,$0009                                                       ;92A2E6;
    db $F9                                                               ;92A2EA;
    dw $2803,$C3FA                                                       ;92A2EB;
    db $EF                                                               ;92A2EF;
    dw $2800                                                             ;92A2F0;

SamusSpritemaps_A2F2:
    dw $0004,$0011                                                       ;92A2F2;
    db $F9                                                               ;92A2F6;
    dw $2802,$0009                                                       ;92A2F7;
    db $F9                                                               ;92A2FB;
    dw $2803,$0007                                                       ;92A2FC;
    db $F7                                                               ;92A300;
    dw $2804,$C3F7                                                       ;92A301;
    db $EF                                                               ;92A305;
    dw $2800                                                             ;92A306;

SamusSpritemaps_A308:
    dw $0005,$0011                                                       ;92A308;
    db $F8                                                               ;92A30C;
    dw $2802,$0009                                                       ;92A30D;
    db $F8                                                               ;92A311;
    dw $2803,$0005                                                       ;92A312;
    db $EE                                                               ;92A316;
    dw $2804,$0005                                                       ;92A317;
    db $F6                                                               ;92A31B;
    dw $2805,$C3F5                                                       ;92A31C;
    db $EE                                                               ;92A320;
    dw $2800                                                             ;92A321;

SamusSpritemaps_A323:
    dw $0003,$0011                                                       ;92A323;
    db $F9                                                               ;92A327;
    dw $2802,$0009                                                       ;92A328;
    db $F9                                                               ;92A32C;
    dw $2803,$C3FA                                                       ;92A32D;
    db $EF                                                               ;92A331;
    dw $2800                                                             ;92A332;

SamusSpritemaps_A334:
    dw $0004,$0011                                                       ;92A334;
    db $F9                                                               ;92A338;
    dw $2802,$0009                                                       ;92A339;
    db $F9                                                               ;92A33D;
    dw $2803,$000A                                                       ;92A33E;
    db $F7                                                               ;92A342;
    dw $2804,$C3FA                                                       ;92A343;
    db $EF                                                               ;92A347;
    dw $2800                                                             ;92A348;

SamusSpritemaps_A34A:
    dw $0005,$01EF                                                       ;92A34A;
    db $FA                                                               ;92A34E;
    dw $6802,$01E7                                                       ;92A34F;
    db $FA                                                               ;92A353;
    dw $6803,$01FE                                                       ;92A354;
    db $00                                                               ;92A358;
    dw $2804,$01F6                                                       ;92A359;
    db $00                                                               ;92A35D;
    dw $2805,$C3F6                                                       ;92A35E;
    db $F0                                                               ;92A362;
    dw $2800                                                             ;92A363;

SamusSpritemaps_A365:
    dw $0005,$01EF                                                       ;92A365;
    db $F9                                                               ;92A369;
    dw $6802,$01E7                                                       ;92A36A;
    db $F9                                                               ;92A36E;
    dw $6803,$01FE                                                       ;92A36F;
    db $FF                                                               ;92A373;
    dw $2804,$01F6                                                       ;92A374;
    db $FF                                                               ;92A378;
    dw $2805,$C3F6                                                       ;92A379;
    db $EF                                                               ;92A37D;
    dw $2800                                                             ;92A37E;

SamusSpritemaps_A380:
    dw $0006,$01EE                                                       ;92A380;
    db $F7                                                               ;92A384;
    dw $2802,$01FE                                                       ;92A385;
    db $FF                                                               ;92A389;
    dw $2803,$01F6                                                       ;92A38A;
    db $FF                                                               ;92A38E;
    dw $2804,$C3F6                                                       ;92A38F;
    db $EF                                                               ;92A393;
    dw $2800,$01EF                                                       ;92A394;
    db $F9                                                               ;92A398;
    dw $6805,$01E7                                                       ;92A399;
    db $F9                                                               ;92A39D;
    dw $6806                                                             ;92A39E;

SamusSpritemaps_A3A0:
    dw $0006,$01EE                                                       ;92A3A0;
    db $F6                                                               ;92A3A4;
    dw $2802,$01EF                                                       ;92A3A5;
    db $F8                                                               ;92A3A9;
    dw $6803,$01E7                                                       ;92A3AA;
    db $F8                                                               ;92A3AE;
    dw $6804,$01FE                                                       ;92A3AF;
    db $FE                                                               ;92A3B3;
    dw $2805,$01F6                                                       ;92A3B4;
    db $FE                                                               ;92A3B8;
    dw $2806,$C3F6                                                       ;92A3B9;
    db $EE                                                               ;92A3BD;
    dw $2800                                                             ;92A3BE;

SamusSpritemaps_A3C0:
    dw $0005,$01EF                                                       ;92A3C0;
    db $F9                                                               ;92A3C4;
    dw $6802,$01E7                                                       ;92A3C5;
    db $F9                                                               ;92A3C9;
    dw $6803,$01FE                                                       ;92A3CA;
    db $FF                                                               ;92A3CE;
    dw $2804,$01F6                                                       ;92A3CF;
    db $FF                                                               ;92A3D3;
    dw $2805,$C3F6                                                       ;92A3D4;
    db $EF                                                               ;92A3D8;
    dw $2800                                                             ;92A3D9;

SamusSpritemaps_A3DB:
    dw $0007,$01EF                                                       ;92A3DB;
    db $F9                                                               ;92A3DF;
    dw $6802,$01E7                                                       ;92A3E0;
    db $F9                                                               ;92A3E4;
    dw $6803,$0006                                                       ;92A3E5;
    db $FF                                                               ;92A3E9;
    dw $2804,$01FE                                                       ;92A3EA;
    db $FF                                                               ;92A3EE;
    dw $2805,$01F6                                                       ;92A3EF;
    db $F7                                                               ;92A3F3;
    dw $2806,$01F6                                                       ;92A3F4;
    db $EF                                                               ;92A3F8;
    dw $2807,$C3FE                                                       ;92A3F9;
    db $EF                                                               ;92A3FD;
    dw $2800                                                             ;92A3FE;

SamusSpritemaps_A400:
    dw $0005,$0011                                                       ;92A400;
    db $F8                                                               ;92A404;
    dw $2802,$0009                                                       ;92A405;
    db $F8                                                               ;92A409;
    dw $2803,$000A                                                       ;92A40A;
    db $F6                                                               ;92A40E;
    dw $2804,$000A                                                       ;92A40F;
    db $EE                                                               ;92A413;
    dw $2805,$C3FA                                                       ;92A414;
    db $EE                                                               ;92A418;
    dw $2800                                                             ;92A419;

SamusSpritemaps_A41B:
    dw $0007,$01EF                                                       ;92A41B;
    db $F8                                                               ;92A41F;
    dw $6802,$01E7                                                       ;92A420;
    db $F8                                                               ;92A424;
    dw $6803,$0006                                                       ;92A425;
    db $FE                                                               ;92A429;
    dw $2804,$01FE                                                       ;92A42A;
    db $FE                                                               ;92A42E;
    dw $2805,$01F6                                                       ;92A42F;
    db $F6                                                               ;92A433;
    dw $2806,$01F6                                                       ;92A434;
    db $EE                                                               ;92A438;
    dw $2807,$C3FE                                                       ;92A439;
    db $EE                                                               ;92A43D;
    dw $2800                                                             ;92A43E;

SamusSpritemaps_A440:
    dw $0003,$0011                                                       ;92A440;
    db $FA                                                               ;92A444;
    dw $2802,$0009                                                       ;92A445;
    db $FA                                                               ;92A449;
    dw $2803,$C3FA                                                       ;92A44A;
    db $F0                                                               ;92A44E;
    dw $2800                                                             ;92A44F;

SamusSpritemaps_A451:
    dw $0005,$01EF                                                       ;92A451;
    db $FA                                                               ;92A455;
    dw $6802,$01E7                                                       ;92A456;
    db $FA                                                               ;92A45A;
    dw $6803,$01FE                                                       ;92A45B;
    db $00                                                               ;92A45F;
    dw $2804,$01F6                                                       ;92A460;
    db $00                                                               ;92A464;
    dw $2805,$C3F6                                                       ;92A465;
    db $F0                                                               ;92A469;
    dw $2800                                                             ;92A46A;

SamusSpritemaps_A46C:
    dw $0004,$001C                                                       ;92A46C;
    db $FD                                                               ;92A470;
    dw $2804,$0014                                                       ;92A471;
    db $FD                                                               ;92A475;
    dw $2805,$C205                                                       ;92A476;
    db $F6                                                               ;92A47A;
    dw $2800,$C200                                                       ;92A47B;
    db $F8                                                               ;92A47F;
    dw $2802                                                             ;92A480;

SamusSpritemaps_A482:
    dw $0004,$001B                                                       ;92A482;
    db $F7                                                               ;92A486;
    dw $2804,$0013                                                       ;92A487;
    db $F7                                                               ;92A48B;
    dw $2805,$C204                                                       ;92A48C;
    db $F4                                                               ;92A490;
    dw $2800,$C3FF                                                       ;92A491;
    db $F6                                                               ;92A495;
    dw $2802                                                             ;92A496;

SamusSpritemaps_A498:
    dw $0003,$C210                                                       ;92A498;
    db $F1                                                               ;92A49C;
    dw $2800,$C204                                                       ;92A49D;
    db $F3                                                               ;92A4A1;
    dw $2802,$C3FF                                                       ;92A4A2;
    db $F5                                                               ;92A4A6;
    dw $2804                                                             ;92A4A7;

SamusSpritemaps_A4A9:
    dw $0003,$C202                                                       ;92A4A9;
    db $EF                                                               ;92A4AD;
    dw $2800,$C20E                                                       ;92A4AE;
    db $ED                                                               ;92A4B2;
    dw $2802,$C3FF                                                       ;92A4B3;
    db $F2                                                               ;92A4B7;
    dw $2804                                                             ;92A4B8;

SamusSpritemaps_A4BA:
    dw $0003,$C20C                                                       ;92A4BA;
    db $E5                                                               ;92A4BE;
    dw $2800,$C202                                                       ;92A4BF;
    db $EF                                                               ;92A4C3;
    dw $2802,$C3FF                                                       ;92A4C4;
    db $F2                                                               ;92A4C8;
    dw $2804                                                             ;92A4C9;

SamusSpritemaps_A4CB:
    dw $0003,$C209                                                       ;92A4CB;
    db $E5                                                               ;92A4CF;
    dw $2800,$C201                                                       ;92A4D0;
    db $EF                                                               ;92A4D4;
    dw $2802,$C3FF                                                       ;92A4D5;
    db $F2                                                               ;92A4D9;
    dw $2804                                                             ;92A4DA;

SamusSpritemaps_A4DC:
    dw $0003,$C207                                                       ;92A4DC;
    db $E3                                                               ;92A4E0;
    dw $2800,$C201                                                       ;92A4E1;
    db $ED                                                               ;92A4E5;
    dw $2802,$C3FE                                                       ;92A4E6;
    db $F1                                                               ;92A4EA;
    dw $2804                                                             ;92A4EB;

SamusSpritemaps_A4ED:
    dw $0004,$0004                                                       ;92A4ED;
    db $E6                                                               ;92A4F1;
    dw $2804,$0004                                                       ;92A4F2;
    db $DE                                                               ;92A4F6;
    dw $2805,$C3FD                                                       ;92A4F7;
    db $EC                                                               ;92A4FB;
    dw $2800,$C3FB                                                       ;92A4FC;
    db $F0                                                               ;92A500;
    dw $2802                                                             ;92A501;

SamusSpritemaps_A503:
    dw $0004,$01FD                                                       ;92A503;
    db $E5                                                               ;92A507;
    dw $2804,$01FD                                                       ;92A508;
    db $DD                                                               ;92A50C;
    dw $2805,$C3F6                                                       ;92A50D;
    db $EC                                                               ;92A511;
    dw $2800,$C3F8                                                       ;92A512;
    db $F0                                                               ;92A516;
    dw $2802                                                             ;92A517;

SamusSpritemaps_A519:
    dw $0004,$01F8                                                       ;92A519;
    db $E6                                                               ;92A51D;
    dw $6804,$01F8                                                       ;92A51E;
    db $DE                                                               ;92A522;
    dw $6805,$C3F3                                                       ;92A523;
    db $EC                                                               ;92A527;
    dw $2800,$C3F7                                                       ;92A528;
    db $F0                                                               ;92A52C;
    dw $2802                                                             ;92A52D;

SamusSpritemaps_A52F:
    dw $0003,$C3EE                                                       ;92A52F;
    db $E2                                                               ;92A533;
    dw $6800,$C3F3                                                       ;92A534;
    db $ED                                                               ;92A538;
    dw $2802,$C3F5                                                       ;92A539;
    db $F1                                                               ;92A53D;
    dw $2804                                                             ;92A53E;

SamusSpritemaps_A540:
    dw $0003,$C3E8                                                       ;92A540;
    db $E4                                                               ;92A544;
    dw $6800,$C3F0                                                       ;92A545;
    db $EF                                                               ;92A549;
    dw $2802,$C3F2                                                       ;92A54A;
    db $F2                                                               ;92A54E;
    dw $2804                                                             ;92A54F;

SamusSpritemaps_A551:
    dw $0003,$C3E3                                                       ;92A551;
    db $E5                                                               ;92A555;
    dw $6800,$C3EE                                                       ;92A556;
    db $EF                                                               ;92A55A;
    dw $2802,$C3F2                                                       ;92A55B;
    db $F2                                                               ;92A55F;
    dw $2804                                                             ;92A560;

SamusSpritemaps_A562:
    dw $0003,$C3E0                                                       ;92A562;
    db $E9                                                               ;92A566;
    dw $6800,$C3EB                                                       ;92A567;
    db $F2                                                               ;92A56B;
    dw $2802,$C3F1                                                       ;92A56C;
    db $F3                                                               ;92A570;
    dw $2804                                                             ;92A571;

SamusSpritemaps_A573:
    dw $0003,$C3E0                                                       ;92A573;
    db $EF                                                               ;92A577;
    dw $6800,$C3EB                                                       ;92A578;
    db $F4                                                               ;92A57C;
    dw $2802,$C3F1                                                       ;92A57D;
    db $F3                                                               ;92A581;
    dw $2804                                                             ;92A582;

SamusSpritemaps_A584:
    dw $0004,$01DD                                                       ;92A584;
    db $F7                                                               ;92A588;
    dw $6804,$01E5                                                       ;92A589;
    db $F7                                                               ;92A58D;
    dw $6805,$C3EB                                                       ;92A58E;
    db $F9                                                               ;92A592;
    dw $2800,$C3F0                                                       ;92A593;
    db $F7                                                               ;92A597;
    dw $2802                                                             ;92A598;

SamusSpritemaps_A59A:
    dw $0004,$01DC                                                       ;92A59A;
    db $FC                                                               ;92A59E;
    dw $6804,$01E4                                                       ;92A59F;
    db $FC                                                               ;92A5A3;
    dw $6805,$C3EB                                                       ;92A5A4;
    db $F9                                                               ;92A5A8;
    dw $2800,$C3F0                                                       ;92A5A9;
    db $F8                                                               ;92A5AD;
    dw $2802                                                             ;92A5AE;

SamusSpritemaps_A5B0:
    dw $0008,$0001                                                       ;92A5B0;
    db $FB                                                               ;92A5B4;
    dw $2804,$0001                                                       ;92A5B5;
    db $F3                                                               ;92A5B9;
    dw $2805,$C3F1                                                       ;92A5BA;
    db $F3                                                               ;92A5BE;
    dw $2800,$C3F0                                                       ;92A5BF;
    db $F8                                                               ;92A5C3;
    dw $6802,$01DC                                                       ;92A5C4;
    db $FC                                                               ;92A5C8;
    dw $6806,$01E4                                                       ;92A5C9;
    db $FC                                                               ;92A5CD;
    dw $6807,$01EB                                                       ;92A5CE;
    db $02                                                               ;92A5D2;
    dw $2814,$01EB                                                       ;92A5D3;
    db $FA                                                               ;92A5D7;
    dw $2815                                                             ;92A5D8;

SamusSpritemaps_A5DA:
    dw $0008,$01DC                                                       ;92A5DA;
    db $F8                                                               ;92A5DE;
    dw $6804,$01E4                                                       ;92A5DF;
    db $F8                                                               ;92A5E3;
    dw $6805,$0001                                                       ;92A5E4;
    db $FA                                                               ;92A5E8;
    dw $2806,$0001                                                       ;92A5E9;
    db $F2                                                               ;92A5ED;
    dw $2807,$C3F1                                                       ;92A5EE;
    db $F2                                                               ;92A5F2;
    dw $2800,$C3F0                                                       ;92A5F3;
    db $F7                                                               ;92A5F7;
    dw $6802,$01EB                                                       ;92A5F8;
    db $00                                                               ;92A5FC;
    dw $2814,$01EB                                                       ;92A5FD;
    db $F8                                                               ;92A601;
    dw $2815                                                             ;92A602;

SamusSpritemaps_A604:
    dw $000A,$0005                                                       ;92A604;
    db $FA                                                               ;92A608;
    dw $2804,$0005                                                       ;92A609;
    db $F2                                                               ;92A60D;
    dw $2805,$C3F5                                                       ;92A60E;
    db $F2                                                               ;92A612;
    dw $2800,$C3F1                                                       ;92A613;
    db $F5                                                               ;92A617;
    dw $6802,$01E0                                                       ;92A618;
    db $F8                                                               ;92A61C;
    dw $6806,$01E8                                                       ;92A61D;
    db $F8                                                               ;92A621;
    dw $6807,$01E0                                                       ;92A622;
    db $F0                                                               ;92A626;
    dw $6814,$01E8                                                       ;92A627;
    db $F0                                                               ;92A62B;
    dw $6815,$01EB                                                       ;92A62C;
    db $FD                                                               ;92A630;
    dw $2816,$01EB                                                       ;92A631;
    db $F5                                                               ;92A635;
    dw $2817                                                             ;92A636;

SamusSpritemaps_A638:
    dw $000A,$0005                                                       ;92A638;
    db $F9                                                               ;92A63C;
    dw $2804,$0005                                                       ;92A63D;
    db $F1                                                               ;92A641;
    dw $2805,$C3F5                                                       ;92A642;
    db $F1                                                               ;92A646;
    dw $2800,$C3F1                                                       ;92A647;
    db $F4                                                               ;92A64B;
    dw $6802,$01E0                                                       ;92A64C;
    db $F5                                                               ;92A650;
    dw $6806,$01E8                                                       ;92A651;
    db $F5                                                               ;92A655;
    dw $6807,$01E0                                                       ;92A656;
    db $ED                                                               ;92A65A;
    dw $6814,$01E8                                                       ;92A65B;
    db $ED                                                               ;92A65F;
    dw $6815,$01EB                                                       ;92A660;
    db $FB                                                               ;92A664;
    dw $2816,$01EB                                                       ;92A665;
    db $F3                                                               ;92A669;
    dw $2817                                                             ;92A66A;

SamusSpritemaps_A66C:
    dw $0009,$01FD                                                       ;92A66C;
    db $FE                                                               ;92A670;
    dw $2804,$C3F5                                                       ;92A671;
    db $EE                                                               ;92A675;
    dw $2800,$C3F0                                                       ;92A676;
    db $F2                                                               ;92A67A;
    dw $6802,$01E2                                                       ;92A67B;
    db $EC                                                               ;92A67F;
    dw $6805,$01EA                                                       ;92A680;
    db $EC                                                               ;92A684;
    dw $6806,$01E2                                                       ;92A685;
    db $E4                                                               ;92A689;
    dw $6807,$01EA                                                       ;92A68A;
    db $E4                                                               ;92A68E;
    dw $6814,$01F4                                                       ;92A68F;
    db $EE                                                               ;92A693;
    dw $2815,$01EC                                                       ;92A694;
    db $EE                                                               ;92A698;
    dw $2816                                                             ;92A699;

SamusSpritemaps_A69B:
    dw $0009,$01FE                                                       ;92A69B;
    db $FE                                                               ;92A69F;
    dw $2804,$C3F6                                                       ;92A6A0;
    db $EE                                                               ;92A6A4;
    dw $2800,$C3F2                                                       ;92A6A5;
    db $F1                                                               ;92A6A9;
    dw $6802,$01F6                                                       ;92A6AA;
    db $ED                                                               ;92A6AE;
    dw $2805,$01EE                                                       ;92A6AF;
    db $ED                                                               ;92A6B3;
    dw $2806,$01ED                                                       ;92A6B4;
    db $EB                                                               ;92A6B8;
    dw $6807,$01E5                                                       ;92A6B9;
    db $EB                                                               ;92A6BD;
    dw $6814,$01E5                                                       ;92A6BE;
    db $E3                                                               ;92A6C2;
    dw $6815,$01ED                                                       ;92A6C3;
    db $E3                                                               ;92A6C7;
    dw $6816                                                             ;92A6C8;

SamusSpritemaps_A6CA:
    dw $0009,$01E9                                                       ;92A6CA;
    db $E9                                                               ;92A6CE;
    dw $6804,$01FE                                                       ;92A6CF;
    db $FE                                                               ;92A6D3;
    dw $2805,$C3F6                                                       ;92A6D4;
    db $EE                                                               ;92A6D8;
    dw $2800,$C3F2                                                       ;92A6D9;
    db $F1                                                               ;92A6DD;
    dw $6802,$01F1                                                       ;92A6DE;
    db $E9                                                               ;92A6E2;
    dw $6806,$01E9                                                       ;92A6E3;
    db $E1                                                               ;92A6E7;
    dw $6807,$01F1                                                       ;92A6E8;
    db $E1                                                               ;92A6EC;
    dw $6814,$01F6                                                       ;92A6ED;
    db $EC                                                               ;92A6F1;
    dw $2815,$01EE                                                       ;92A6F2;
    db $EC                                                               ;92A6F6;
    dw $2816                                                             ;92A6F7;

SamusSpritemaps_A6F9:
    dw $0008,$0000                                                       ;92A6F9;
    db $02                                                               ;92A6FD;
    dw $2804,$01F8                                                       ;92A6FE;
    db $02                                                               ;92A702;
    dw $2805,$C3F8                                                       ;92A703;
    db $F2                                                               ;92A707;
    dw $2800,$C3F6                                                       ;92A708;
    db $F0                                                               ;92A70C;
    dw $6802,$01F8                                                       ;92A70D;
    db $EB                                                               ;92A711;
    dw $2806,$01F0                                                       ;92A712;
    db $EB                                                               ;92A716;
    dw $2807,$01F5                                                       ;92A717;
    db $E5                                                               ;92A71B;
    dw $6814,$01F5                                                       ;92A71C;
    db $DD                                                               ;92A720;
    dw $6815                                                             ;92A721;

SamusSpritemaps_A723:
    dw $0008,$01FF                                                       ;92A723;
    db $03                                                               ;92A727;
    dw $2804,$01F7                                                       ;92A728;
    db $03                                                               ;92A72C;
    dw $2805,$C3F7                                                       ;92A72D;
    db $F3                                                               ;92A731;
    dw $2800,$C3F9                                                       ;92A732;
    db $F1                                                               ;92A736;
    dw $6802,$01FC                                                       ;92A737;
    db $E4                                                               ;92A73B;
    dw $2806,$01FC                                                       ;92A73C;
    db $DC                                                               ;92A740;
    dw $2807,$01FD                                                       ;92A741;
    db $EB                                                               ;92A745;
    dw $2814,$01F5                                                       ;92A746;
    db $EB                                                               ;92A74A;
    dw $2815                                                             ;92A74B;

SamusSpritemaps_A74D:
    dw $0008,$01FF                                                       ;92A74D;
    db $01                                                               ;92A751;
    dw $2804,$01F7                                                       ;92A752;
    db $01                                                               ;92A756;
    dw $2805,$C3F7                                                       ;92A757;
    db $F1                                                               ;92A75B;
    dw $2800,$C3FA                                                       ;92A75C;
    db $F0                                                               ;92A760;
    dw $6802,$0002                                                       ;92A761;
    db $E5                                                               ;92A765;
    dw $2806,$0002                                                       ;92A766;
    db $DD                                                               ;92A76A;
    dw $2807,$0003                                                       ;92A76B;
    db $EB                                                               ;92A76F;
    dw $2814,$01FB                                                       ;92A770;
    db $EB                                                               ;92A774;
    dw $2815                                                             ;92A775;

SamusSpritemaps_A777:
    dw $0009,$000B                                                       ;92A777;
    db $E8                                                               ;92A77B;
    dw $2804,$01F1                                                       ;92A77C;
    db $FC                                                               ;92A780;
    dw $2805,$C3F9                                                       ;92A781;
    db $F4                                                               ;92A785;
    dw $2800,$C3FB                                                       ;92A786;
    db $F0                                                               ;92A78A;
    dw $6802,$0003                                                       ;92A78B;
    db $E8                                                               ;92A78F;
    dw $2806,$000B                                                       ;92A790;
    db $E0                                                               ;92A794;
    dw $2807,$0003                                                       ;92A795;
    db $E0                                                               ;92A799;
    dw $2814,$0005                                                       ;92A79A;
    db $EB                                                               ;92A79E;
    dw $2815,$01FD                                                       ;92A79F;
    db $EB                                                               ;92A7A3;
    dw $2816                                                             ;92A7A4;

SamusSpritemaps_A7A6:
    dw $000A,$0010                                                       ;92A7A6;
    db $EA                                                               ;92A7AA;
    dw $2804,$0008                                                       ;92A7AB;
    db $EA                                                               ;92A7AF;
    dw $2805,$0010                                                       ;92A7B0;
    db $E2                                                               ;92A7B4;
    dw $2806,$0008                                                       ;92A7B5;
    db $E2                                                               ;92A7B9;
    dw $2807,$01F1                                                       ;92A7BA;
    db $FD                                                               ;92A7BE;
    dw $2814,$01F1                                                       ;92A7BF;
    db $F5                                                               ;92A7C3;
    dw $2815,$C3F9                                                       ;92A7C4;
    db $F5                                                               ;92A7C8;
    dw $2800,$C3FD                                                       ;92A7C9;
    db $F2                                                               ;92A7CD;
    dw $6802,$0008                                                       ;92A7CE;
    db $ED                                                               ;92A7D2;
    dw $2816,$0000                                                       ;92A7D3;
    db $ED                                                               ;92A7D7;
    dw $2817                                                             ;92A7D8;

SamusSpritemaps_A7DA:
    dw $000A,$01F1                                                       ;92A7DA;
    db $FD                                                               ;92A7DE;
    dw $2804,$01F1                                                       ;92A7DF;
    db $F5                                                               ;92A7E3;
    dw $2805,$C3F9                                                       ;92A7E4;
    db $F5                                                               ;92A7E8;
    dw $2800,$C3FD                                                       ;92A7E9;
    db $F2                                                               ;92A7ED;
    dw $6802,$0013                                                       ;92A7EE;
    db $EC                                                               ;92A7F2;
    dw $2806,$000B                                                       ;92A7F3;
    db $EC                                                               ;92A7F7;
    dw $2807,$0013                                                       ;92A7F8;
    db $E4                                                               ;92A7FC;
    dw $2814,$000B                                                       ;92A7FD;
    db $E4                                                               ;92A801;
    dw $2815,$0009                                                       ;92A802;
    db $EE                                                               ;92A806;
    dw $2816,$0001                                                       ;92A807;
    db $EE                                                               ;92A80B;
    dw $2817                                                             ;92A80C;

SamusSpritemaps_A80E:
    dw $000A,$01F4                                                       ;92A80E;
    db $FC                                                               ;92A812;
    dw $2804,$01F4                                                       ;92A813;
    db $F4                                                               ;92A817;
    dw $2805,$C3FC                                                       ;92A818;
    db $F4                                                               ;92A81C;
    dw $2800,$C3FE                                                       ;92A81D;
    db $F4                                                               ;92A821;
    dw $6802,$0016                                                       ;92A822;
    db $F3                                                               ;92A826;
    dw $2806,$000E                                                       ;92A827;
    db $F3                                                               ;92A82B;
    dw $2807,$0016                                                       ;92A82C;
    db $EB                                                               ;92A830;
    dw $2814,$000E                                                       ;92A831;
    db $EB                                                               ;92A835;
    dw $2815,$000A                                                       ;92A836;
    db $F6                                                               ;92A83A;
    dw $2816,$000A                                                       ;92A83B;
    db $EE                                                               ;92A83F;
    dw $2817                                                             ;92A840;

SamusSpritemaps_A842:
    dw $000A,$01F4                                                       ;92A842;
    db $FC                                                               ;92A846;
    dw $2804,$01F4                                                       ;92A847;
    db $F4                                                               ;92A84B;
    dw $2805,$C3FC                                                       ;92A84C;
    db $F4                                                               ;92A850;
    dw $2800,$C3FE                                                       ;92A851;
    db $F4                                                               ;92A855;
    dw $6802,$0017                                                       ;92A856;
    db $F7                                                               ;92A85A;
    dw $2806,$000F                                                       ;92A85B;
    db $F7                                                               ;92A85F;
    dw $2807,$0017                                                       ;92A860;
    db $EF                                                               ;92A864;
    dw $2814,$000F                                                       ;92A865;
    db $EF                                                               ;92A869;
    dw $2815,$000B                                                       ;92A86A;
    db $F8                                                               ;92A86E;
    dw $2816,$000B                                                       ;92A86F;
    db $F0                                                               ;92A873;
    dw $2817                                                             ;92A874;

SamusSpritemaps_A876:
    dw $0009,$C3FE                                                       ;92A876;
    db $F3                                                               ;92A87A;
    dw $2800,$01F6                                                       ;92A87B;
    db $FB                                                               ;92A87F;
    dw $2804,$01F6                                                       ;92A880;
    db $F3                                                               ;92A884;
    dw $2805,$01F6                                                       ;92A885;
    db $EB                                                               ;92A889;
    dw $2806,$C3FF                                                       ;92A88A;
    db $F7                                                               ;92A88E;
    dw $6802,$000E                                                       ;92A88F;
    db $FA                                                               ;92A893;
    dw $2807,$000E                                                       ;92A894;
    db $F9                                                               ;92A898;
    dw $A814,$001C                                                       ;92A899;
    db $F7                                                               ;92A89D;
    dw $2815,$0014                                                       ;92A89E;
    db $F7                                                               ;92A8A2;
    dw $2816                                                             ;92A8A3;

SamusSpritemaps_A8A5:
    dw $0009,$C3FE                                                       ;92A8A5;
    db $F4                                                               ;92A8A9;
    dw $2800,$01F6                                                       ;92A8AA;
    db $FC                                                               ;92A8AE;
    dw $2804,$01F6                                                       ;92A8AF;
    db $F4                                                               ;92A8B3;
    dw $2805,$01F6                                                       ;92A8B4;
    db $EC                                                               ;92A8B8;
    dw $2806,$C3FF                                                       ;92A8B9;
    db $F8                                                               ;92A8BD;
    dw $6802,$001C                                                       ;92A8BE;
    db $FC                                                               ;92A8C2;
    dw $2807,$0014                                                       ;92A8C3;
    db $FC                                                               ;92A8C7;
    dw $2814,$000E                                                       ;92A8C8;
    db $FD                                                               ;92A8CC;
    dw $2815,$000E                                                       ;92A8CD;
    db $F5                                                               ;92A8D1;
    dw $2816                                                             ;92A8D2;

SamusSpritemaps_A8D4:
    dw $0004,$01DC                                                       ;92A8D4;
    db $FB                                                               ;92A8D8;
    dw $E804,$01E4                                                       ;92A8D9;
    db $FB                                                               ;92A8DD;
    dw $E805,$C3EB                                                       ;92A8DE;
    db $FA                                                               ;92A8E2;
    dw $E800,$C3F0                                                       ;92A8E3;
    db $F8                                                               ;92A8E7;
    dw $E802                                                             ;92A8E8;

SamusSpritemaps_A8EA:
    dw $0004,$01DD                                                       ;92A8EA;
    db $01                                                               ;92A8EE;
    dw $E804,$01E5                                                       ;92A8EF;
    db $01                                                               ;92A8F3;
    dw $E805,$C3EC                                                       ;92A8F4;
    db $FC                                                               ;92A8F8;
    dw $E800,$C3F1                                                       ;92A8F9;
    db $FA                                                               ;92A8FD;
    dw $E802                                                             ;92A8FE;

SamusSpritemaps_A900:
    dw $0003,$C3E0                                                       ;92A900;
    db $FF                                                               ;92A904;
    dw $E800,$C3EC                                                       ;92A905;
    db $FD                                                               ;92A909;
    dw $E802,$C3F1                                                       ;92A90A;
    db $FB                                                               ;92A90E;
    dw $E804                                                             ;92A90F;

SamusSpritemaps_A911:
    dw $0003,$C3EE                                                       ;92A911;
    db $01                                                               ;92A915;
    dw $E800,$C3E2                                                       ;92A916;
    db $03                                                               ;92A91A;
    dw $E802,$C3F1                                                       ;92A91B;
    db $FE                                                               ;92A91F;
    dw $E804                                                             ;92A920;

SamusSpritemaps_A922:
    dw $0003,$C3E4                                                       ;92A922;
    db $0B                                                               ;92A926;
    dw $E800,$C3EE                                                       ;92A927;
    db $01                                                               ;92A92B;
    dw $E802,$C3F1                                                       ;92A92C;
    db $FE                                                               ;92A930;
    dw $E804                                                             ;92A931;

SamusSpritemaps_A933:
    dw $0003,$C3E7                                                       ;92A933;
    db $0B                                                               ;92A937;
    dw $E800,$C3EF                                                       ;92A938;
    db $01                                                               ;92A93C;
    dw $E802,$C3F1                                                       ;92A93D;
    db $FE                                                               ;92A941;
    dw $E804                                                             ;92A942;

SamusSpritemaps_A944:
    dw $0003,$C3E9                                                       ;92A944;
    db $0D                                                               ;92A948;
    dw $E800,$C3EF                                                       ;92A949;
    db $03                                                               ;92A94D;
    dw $E802,$C3F2                                                       ;92A94E;
    db $FF                                                               ;92A952;
    dw $E804                                                             ;92A953;

SamusSpritemaps_A955:
    dw $0004,$01F4                                                       ;92A955;
    db $12                                                               ;92A959;
    dw $E804,$01F4                                                       ;92A95A;
    db $1A                                                               ;92A95E;
    dw $E805,$C3F3                                                       ;92A95F;
    db $04                                                               ;92A963;
    dw $E800,$C3F5                                                       ;92A964;
    db $00                                                               ;92A968;
    dw $E802                                                             ;92A969;

SamusSpritemaps_A96B:
    dw $0004,$01FB                                                       ;92A96B;
    db $13                                                               ;92A96F;
    dw $E804,$01FB                                                       ;92A970;
    db $1B                                                               ;92A974;
    dw $E805,$C3FA                                                       ;92A975;
    db $04                                                               ;92A979;
    dw $E800,$C3F8                                                       ;92A97A;
    db $00                                                               ;92A97E;
    dw $E802                                                             ;92A97F;

SamusSpritemaps_A981:
    dw $0004,$0000                                                       ;92A981;
    db $12                                                               ;92A985;
    dw $A804,$0000                                                       ;92A986;
    db $1A                                                               ;92A98A;
    dw $A805,$C3FD                                                       ;92A98B;
    db $04                                                               ;92A98F;
    dw $E800,$C3F9                                                       ;92A990;
    db $00                                                               ;92A994;
    dw $E802                                                             ;92A995;

SamusSpritemaps_A997:
    dw $0003,$C202                                                       ;92A997;
    db $0E                                                               ;92A99B;
    dw $A800,$C3FD                                                       ;92A99C;
    db $03                                                               ;92A9A0;
    dw $E802,$C3FB                                                       ;92A9A1;
    db $FF                                                               ;92A9A5;
    dw $E804                                                             ;92A9A6;

SamusSpritemaps_A9A8:
    dw $0003,$C208                                                       ;92A9A8;
    db $0C                                                               ;92A9AC;
    dw $A800,$C200                                                       ;92A9AD;
    db $01                                                               ;92A9B1;
    dw $E802,$C3FE                                                       ;92A9B2;
    db $FE                                                               ;92A9B6;
    dw $E804                                                             ;92A9B7;

SamusSpritemaps_A9B9:
    dw $0003,$C20D                                                       ;92A9B9;
    db $0B                                                               ;92A9BD;
    dw $A800,$C202                                                       ;92A9BE;
    db $01                                                               ;92A9C2;
    dw $E802,$C3FE                                                       ;92A9C3;
    db $FE                                                               ;92A9C7;
    dw $E804                                                             ;92A9C8;

SamusSpritemaps_A9CA:
    dw $0003,$C210                                                       ;92A9CA;
    db $07                                                               ;92A9CE;
    dw $A800,$C205                                                       ;92A9CF;
    db $FE                                                               ;92A9D3;
    dw $E802,$C3FF                                                       ;92A9D4;
    db $FD                                                               ;92A9D8;
    dw $E804                                                             ;92A9D9;

SamusSpritemaps_A9DB:
    dw $0003,$C210                                                       ;92A9DB;
    db $01                                                               ;92A9DF;
    dw $A800,$C205                                                       ;92A9E0;
    db $FC                                                               ;92A9E4;
    dw $E802,$C3FF                                                       ;92A9E5;
    db $FD                                                               ;92A9E9;
    dw $E804                                                             ;92A9EA;

SamusSpritemaps_A9EC:
    dw $0004,$001B                                                       ;92A9EC;
    db $01                                                               ;92A9F0;
    dw $A804,$0013                                                       ;92A9F1;
    db $01                                                               ;92A9F5;
    dw $A805,$C205                                                       ;92A9F6;
    db $F7                                                               ;92A9FA;
    dw $E800,$C200                                                       ;92A9FB;
    db $F9                                                               ;92A9FF;
    dw $E802                                                             ;92AA00;

SamusSpritemaps_AA02:
    dw $0004,$001C                                                       ;92AA02;
    db $FC                                                               ;92AA06;
    dw $A804,$0014                                                       ;92AA07;
    db $FC                                                               ;92AA0B;
    dw $A805,$C205                                                       ;92AA0C;
    db $F7                                                               ;92AA10;
    dw $E800,$C200                                                       ;92AA11;
    db $F8                                                               ;92AA15;
    dw $E802                                                             ;92AA16;

SamusSpritemaps_AA18:
    dw $0008,$01F7                                                       ;92AA18;
    db $FD                                                               ;92AA1C;
    dw $E804,$01F7                                                       ;92AA1D;
    db $05                                                               ;92AA21;
    dw $E805,$C3FF                                                       ;92AA22;
    db $FD                                                               ;92AA26;
    dw $E800,$C200                                                       ;92AA27;
    db $F8                                                               ;92AA2B;
    dw $A802,$001C                                                       ;92AA2C;
    db $FC                                                               ;92AA30;
    dw $A806,$0014                                                       ;92AA31;
    db $FC                                                               ;92AA35;
    dw $A807,$000D                                                       ;92AA36;
    db $F6                                                               ;92AA3A;
    dw $E814,$000D                                                       ;92AA3B;
    db $FE                                                               ;92AA3F;
    dw $E815                                                             ;92AA40;

SamusSpritemaps_AA42:
    dw $0008,$001C                                                       ;92AA42;
    db $00                                                               ;92AA46;
    dw $A804,$0014                                                       ;92AA47;
    db $00                                                               ;92AA4B;
    dw $A805,$01F7                                                       ;92AA4C;
    db $FE                                                               ;92AA50;
    dw $E806,$01F7                                                       ;92AA51;
    db $06                                                               ;92AA55;
    dw $E807,$C3FF                                                       ;92AA56;
    db $FE                                                               ;92AA5A;
    dw $E800,$C200                                                       ;92AA5B;
    db $F9                                                               ;92AA5F;
    dw $A802,$000D                                                       ;92AA60;
    db $F8                                                               ;92AA64;
    dw $E814,$000D                                                       ;92AA65;
    db $00                                                               ;92AA69;
    dw $E815                                                             ;92AA6A;

SamusSpritemaps_AA6C:
    dw $000A,$01F3                                                       ;92AA6C;
    db $FE                                                               ;92AA70;
    dw $E804,$01F3                                                       ;92AA71;
    db $06                                                               ;92AA75;
    dw $E805,$C3FB                                                       ;92AA76;
    db $FE                                                               ;92AA7A;
    dw $E800,$C3FF                                                       ;92AA7B;
    db $FB                                                               ;92AA7F;
    dw $A802,$0018                                                       ;92AA80;
    db $00                                                               ;92AA84;
    dw $A806,$0010                                                       ;92AA85;
    db $00                                                               ;92AA89;
    dw $A807,$0018                                                       ;92AA8A;
    db $08                                                               ;92AA8E;
    dw $A814,$0010                                                       ;92AA8F;
    db $08                                                               ;92AA93;
    dw $A815,$000D                                                       ;92AA94;
    db $FB                                                               ;92AA98;
    dw $E816,$000D                                                       ;92AA99;
    db $03                                                               ;92AA9D;
    dw $E817                                                             ;92AA9E;

SamusSpritemaps_AAA0:
    dw $000A,$01F3                                                       ;92AAA0;
    db $FF                                                               ;92AAA4;
    dw $E804,$01F3                                                       ;92AAA5;
    db $07                                                               ;92AAA9;
    dw $E805,$C3FB                                                       ;92AAAA;
    db $FF                                                               ;92AAAE;
    dw $E800,$C3FF                                                       ;92AAAF;
    db $FC                                                               ;92AAB3;
    dw $A802,$0018                                                       ;92AAB4;
    db $03                                                               ;92AAB8;
    dw $A806,$0010                                                       ;92AAB9;
    db $03                                                               ;92AABD;
    dw $A807,$0018                                                       ;92AABE;
    db $0B                                                               ;92AAC2;
    dw $A814,$0010                                                       ;92AAC3;
    db $0B                                                               ;92AAC7;
    dw $A815,$000D                                                       ;92AAC8;
    db $FD                                                               ;92AACC;
    dw $E816,$000D                                                       ;92AACD;
    db $05                                                               ;92AAD1;
    dw $E817                                                             ;92AAD2;

SamusSpritemaps_AAD4:
    dw $0009,$01FB                                                       ;92AAD4;
    db $FA                                                               ;92AAD8;
    dw $E804,$C3FB                                                       ;92AAD9;
    db $02                                                               ;92AADD;
    dw $E800,$C200                                                       ;92AADE;
    db $FE                                                               ;92AAE2;
    dw $A802,$0016                                                       ;92AAE3;
    db $0C                                                               ;92AAE7;
    dw $A805,$000E                                                       ;92AAE8;
    db $0C                                                               ;92AAEC;
    dw $A806,$0016                                                       ;92AAED;
    db $14                                                               ;92AAF1;
    dw $A807,$000E                                                       ;92AAF2;
    db $14                                                               ;92AAF6;
    dw $A814,$0004                                                       ;92AAF7;
    db $0A                                                               ;92AAFB;
    dw $E815,$000C                                                       ;92AAFC;
    db $0A                                                               ;92AB00;
    dw $E816                                                             ;92AB01;

SamusSpritemaps_AB03:
    dw $0009,$01FA                                                       ;92AB03;
    db $FA                                                               ;92AB07;
    dw $E804,$C3FA                                                       ;92AB08;
    db $02                                                               ;92AB0C;
    dw $E800,$C3FE                                                       ;92AB0D;
    db $FF                                                               ;92AB11;
    dw $A802,$0002                                                       ;92AB12;
    db $0B                                                               ;92AB16;
    dw $E805,$000A                                                       ;92AB17;
    db $0B                                                               ;92AB1B;
    dw $E806,$000B                                                       ;92AB1C;
    db $0D                                                               ;92AB20;
    dw $A807,$0013                                                       ;92AB21;
    db $0D                                                               ;92AB25;
    dw $A814,$0013                                                       ;92AB26;
    db $15                                                               ;92AB2A;
    dw $A815,$000B                                                       ;92AB2B;
    db $15                                                               ;92AB2F;
    dw $A816                                                             ;92AB30;

SamusSpritemaps_AB32:
    dw $0009,$000F                                                       ;92AB32;
    db $0F                                                               ;92AB36;
    dw $A804,$01FA                                                       ;92AB37;
    db $FA                                                               ;92AB3B;
    dw $E805,$C3FA                                                       ;92AB3C;
    db $02                                                               ;92AB40;
    dw $E800,$C3FE                                                       ;92AB41;
    db $FF                                                               ;92AB45;
    dw $A802,$0007                                                       ;92AB46;
    db $0F                                                               ;92AB4A;
    dw $A806,$000F                                                       ;92AB4B;
    db $17                                                               ;92AB4F;
    dw $A807,$0007                                                       ;92AB50;
    db $17                                                               ;92AB54;
    dw $A814,$0002                                                       ;92AB55;
    db $0C                                                               ;92AB59;
    dw $E815,$000A                                                       ;92AB5A;
    db $0C                                                               ;92AB5E;
    dw $E816                                                             ;92AB5F;

SamusSpritemaps_AB61:
    dw $0008,$01F8                                                       ;92AB61;
    db $F6                                                               ;92AB65;
    dw $E804,$0000                                                       ;92AB66;
    db $F6                                                               ;92AB6A;
    dw $E805,$C3F8                                                       ;92AB6B;
    db $FE                                                               ;92AB6F;
    dw $E800,$C3FA                                                       ;92AB70;
    db $00                                                               ;92AB74;
    dw $A802,$0000                                                       ;92AB75;
    db $0D                                                               ;92AB79;
    dw $E806,$0008                                                       ;92AB7A;
    db $0D                                                               ;92AB7E;
    dw $E807,$0003                                                       ;92AB7F;
    db $13                                                               ;92AB83;
    dw $A814,$0003                                                       ;92AB84;
    db $1B                                                               ;92AB88;
    dw $A815                                                             ;92AB89;

SamusSpritemaps_AB8B:
    dw $0008,$01F9                                                       ;92AB8B;
    db $F5                                                               ;92AB8F;
    dw $E804,$0001                                                       ;92AB90;
    db $F5                                                               ;92AB94;
    dw $E805,$C3F9                                                       ;92AB95;
    db $FD                                                               ;92AB99;
    dw $E800,$C3F7                                                       ;92AB9A;
    db $FF                                                               ;92AB9E;
    dw $A802,$01FC                                                       ;92AB9F;
    db $14                                                               ;92ABA3;
    dw $E806,$01FC                                                       ;92ABA4;
    db $1C                                                               ;92ABA8;
    dw $E807,$01FB                                                       ;92ABA9;
    db $0D                                                               ;92ABAD;
    dw $E814,$0003                                                       ;92ABAE;
    db $0D                                                               ;92ABB2;
    dw $E815                                                             ;92ABB3;

SamusSpritemaps_ABB5:
    dw $0008,$01F9                                                       ;92ABB5;
    db $F7                                                               ;92ABB9;
    dw $E804,$0001                                                       ;92ABBA;
    db $F7                                                               ;92ABBE;
    dw $E805,$C3F9                                                       ;92ABBF;
    db $FF                                                               ;92ABC3;
    dw $E800,$C3F6                                                       ;92ABC4;
    db $00                                                               ;92ABC8;
    dw $A802,$01F6                                                       ;92ABC9;
    db $13                                                               ;92ABCD;
    dw $E806,$01F6                                                       ;92ABCE;
    db $1B                                                               ;92ABD2;
    dw $E807,$01F5                                                       ;92ABD3;
    db $0D                                                               ;92ABD7;
    dw $E814,$01FD                                                       ;92ABD8;
    db $0D                                                               ;92ABDC;
    dw $E815                                                             ;92ABDD;

SamusSpritemaps_ABDF:
    dw $0009,$01ED                                                       ;92ABDF;
    db $10                                                               ;92ABE3;
    dw $E804,$0007                                                       ;92ABE4;
    db $FC                                                               ;92ABE8;
    dw $E805,$C3F7                                                       ;92ABE9;
    db $FC                                                               ;92ABED;
    dw $E800,$C3F5                                                       ;92ABEE;
    db $00                                                               ;92ABF2;
    dw $A802,$01F5                                                       ;92ABF3;
    db $10                                                               ;92ABF7;
    dw $E806,$01ED                                                       ;92ABF8;
    db $18                                                               ;92ABFC;
    dw $E807,$01F5                                                       ;92ABFD;
    db $18                                                               ;92AC01;
    dw $E814,$01F3                                                       ;92AC02;
    db $0D                                                               ;92AC06;
    dw $E815,$01FB                                                       ;92AC07;
    db $0D                                                               ;92AC0B;
    dw $E816                                                             ;92AC0C;

SamusSpritemaps_AC0E:
    dw $000A,$01E8                                                       ;92AC0E;
    db $0E                                                               ;92AC12;
    dw $E804,$01F0                                                       ;92AC13;
    db $0E                                                               ;92AC17;
    dw $E805,$01E8                                                       ;92AC18;
    db $16                                                               ;92AC1C;
    dw $E806,$01F0                                                       ;92AC1D;
    db $16                                                               ;92AC21;
    dw $E807,$0007                                                       ;92AC22;
    db $FB                                                               ;92AC26;
    dw $E814,$0007                                                       ;92AC27;
    db $03                                                               ;92AC2B;
    dw $E815,$C3F7                                                       ;92AC2C;
    db $FB                                                               ;92AC30;
    dw $E800,$C3F3                                                       ;92AC31;
    db $FE                                                               ;92AC35;
    dw $A802,$01F0                                                       ;92AC36;
    db $0B                                                               ;92AC3A;
    dw $E816,$01F8                                                       ;92AC3B;
    db $0B                                                               ;92AC3F;
    dw $E817                                                             ;92AC40;

SamusSpritemaps_AC42:
    dw $000A,$0007                                                       ;92AC42;
    db $FB                                                               ;92AC46;
    dw $E804,$0007                                                       ;92AC47;
    db $03                                                               ;92AC4B;
    dw $E805,$C3F7                                                       ;92AC4C;
    db $FB                                                               ;92AC50;
    dw $E800,$C3F3                                                       ;92AC51;
    db $FE                                                               ;92AC55;
    dw $A802,$01E5                                                       ;92AC56;
    db $0C                                                               ;92AC5A;
    dw $E806,$01ED                                                       ;92AC5B;
    db $0C                                                               ;92AC5F;
    dw $E807,$01E5                                                       ;92AC60;
    db $14                                                               ;92AC64;
    dw $E814,$01ED                                                       ;92AC65;
    db $14                                                               ;92AC69;
    dw $E815,$01EF                                                       ;92AC6A;
    db $0A                                                               ;92AC6E;
    dw $E816,$01F7                                                       ;92AC6F;
    db $0A                                                               ;92AC73;
    dw $E817                                                             ;92AC74;

SamusSpritemaps_AC76:
    dw $000A,$0004                                                       ;92AC76;
    db $FC                                                               ;92AC7A;
    dw $E804,$0004                                                       ;92AC7B;
    db $04                                                               ;92AC7F;
    dw $E805,$C3F4                                                       ;92AC80;
    db $FC                                                               ;92AC84;
    dw $E800,$C3F2                                                       ;92AC85;
    db $FC                                                               ;92AC89;
    dw $A802,$01E2                                                       ;92AC8A;
    db $05                                                               ;92AC8E;
    dw $E806,$01EA                                                       ;92AC8F;
    db $05                                                               ;92AC93;
    dw $E807,$01E2                                                       ;92AC94;
    db $0D                                                               ;92AC98;
    dw $E814,$01EA                                                       ;92AC99;
    db $0D                                                               ;92AC9D;
    dw $E815,$01EE                                                       ;92AC9E;
    db $02                                                               ;92ACA2;
    dw $E816,$01EE                                                       ;92ACA3;
    db $0A                                                               ;92ACA7;
    dw $E817                                                             ;92ACA8;

SamusSpritemaps_ACAA:
    dw $000A,$0004                                                       ;92ACAA;
    db $FC                                                               ;92ACAE;
    dw $E804,$0004                                                       ;92ACAF;
    db $04                                                               ;92ACB3;
    dw $E805,$C3F4                                                       ;92ACB4;
    db $FC                                                               ;92ACB8;
    dw $E800,$C3F2                                                       ;92ACB9;
    db $FC                                                               ;92ACBD;
    dw $A802,$01E1                                                       ;92ACBE;
    db $01                                                               ;92ACC2;
    dw $E806,$01E9                                                       ;92ACC3;
    db $01                                                               ;92ACC7;
    dw $E807,$01E1                                                       ;92ACC8;
    db $09                                                               ;92ACCC;
    dw $E814,$01E9                                                       ;92ACCD;
    db $09                                                               ;92ACD1;
    dw $E815,$01ED                                                       ;92ACD2;
    db $00                                                               ;92ACD6;
    dw $E816,$01ED                                                       ;92ACD7;
    db $08                                                               ;92ACDB;
    dw $E817                                                             ;92ACDC;

SamusSpritemaps_ACDE:
    dw $0009,$C3F2                                                       ;92ACDE;
    db $FD                                                               ;92ACE2;
    dw $E800,$0002                                                       ;92ACE3;
    db $FD                                                               ;92ACE7;
    dw $E804,$0002                                                       ;92ACE8;
    db $05                                                               ;92ACEC;
    dw $E805,$0002                                                       ;92ACED;
    db $0D                                                               ;92ACF1;
    dw $E806,$C3F1                                                       ;92ACF2;
    db $F9                                                               ;92ACF6;
    dw $A802,$01EA                                                       ;92ACF7;
    db $FE                                                               ;92ACFB;
    dw $E807,$01EA                                                       ;92ACFC;
    db $FF                                                               ;92AD00;
    dw $6814,$01DC                                                       ;92AD01;
    db $01                                                               ;92AD05;
    dw $E815,$01E4                                                       ;92AD06;
    db $01                                                               ;92AD0A;
    dw $E816                                                             ;92AD0B;

SamusSpritemaps_AD0D:
    dw $0009,$C3F2                                                       ;92AD0D;
    db $FC                                                               ;92AD11;
    dw $E800,$0002                                                       ;92AD12;
    db $FC                                                               ;92AD16;
    dw $E804,$0002                                                       ;92AD17;
    db $04                                                               ;92AD1B;
    dw $E805,$0002                                                       ;92AD1C;
    db $0C                                                               ;92AD20;
    dw $E806,$C3F1                                                       ;92AD21;
    db $F8                                                               ;92AD25;
    dw $A802,$01DC                                                       ;92AD26;
    db $FC                                                               ;92AD2A;
    dw $E807,$01E4                                                       ;92AD2B;
    db $FC                                                               ;92AD2F;
    dw $E814,$01EA                                                       ;92AD30;
    db $FB                                                               ;92AD34;
    dw $E815,$01EA                                                       ;92AD35;
    db $03                                                               ;92AD39;
    dw $E816                                                             ;92AD3A;

SamusSpritemaps_AD3C:
    dw $0002,$C3F8                                                       ;92AD3C;
    db $10                                                               ;92AD40;
    dw $2808,$C3F8                                                       ;92AD41;
    db $00                                                               ;92AD45;
    dw $280A                                                             ;92AD46;

SamusSpritemaps_AD48:
    dw $0005,$C3F3                                                       ;92AD48;
    db $07                                                               ;92AD4C;
    dw $2808,$C3FB                                                       ;92AD4D;
    db $FF                                                               ;92AD51;
    dw $280A,$01EB                                                       ;92AD52;
    db $0F                                                               ;92AD56;
    dw $280C,$01F3                                                       ;92AD57;
    db $17                                                               ;92AD5B;
    dw $280D,$0003                                                       ;92AD5C;
    db $0F                                                               ;92AD60;
    dw $280E                                                             ;92AD61;

SamusSpritemaps_AD63:
    dw $0004,$C3F0                                                       ;92AD63;
    db $FF                                                               ;92AD67;
    dw $2808,$C200                                                       ;92AD68;
    db $0F                                                               ;92AD6C;
    dw $280A,$C3F8                                                       ;92AD6D;
    db $FF                                                               ;92AD71;
    dw $280C,$0008                                                       ;92AD72;
    db $07                                                               ;92AD76;
    dw $280E                                                             ;92AD77;

SamusSpritemaps_AD79:
    dw $0002,$C3F7                                                       ;92AD79;
    db $10                                                               ;92AD7D;
    dw $2808,$C3F7                                                       ;92AD7E;
    db $00                                                               ;92AD82;
    dw $280A                                                             ;92AD83;

SamusSpritemaps_AD85:
    dw $0006,$C3F3                                                       ;92AD85;
    db $07                                                               ;92AD89;
    dw $2808,$C3FB                                                       ;92AD8A;
    db $FF                                                               ;92AD8E;
    dw $280A,$01F3                                                       ;92AD8F;
    db $FF                                                               ;92AD93;
    dw $280C,$01EB                                                       ;92AD94;
    db $0F                                                               ;92AD98;
    dw $280D,$01F3                                                       ;92AD99;
    db $17                                                               ;92AD9D;
    dw $280E,$0003                                                       ;92AD9E;
    db $0F                                                               ;92ADA2;
    dw $280F                                                             ;92ADA3;

SamusSpritemaps_ADA5:
    dw $0004,$C3EF                                                       ;92ADA5;
    db $FF                                                               ;92ADA9;
    dw $2808,$C3FF                                                       ;92ADAA;
    db $0F                                                               ;92ADAE;
    dw $280A,$C3F7                                                       ;92ADAF;
    db $FF                                                               ;92ADB3;
    dw $280C,$01F7                                                       ;92ADB4;
    db $0F                                                               ;92ADB8;
    dw $280E                                                             ;92ADB9;

SamusSpritemaps_ADBB:
    dw $0003,$C3F1                                                       ;92ADBB;
    db $10                                                               ;92ADBF;
    dw $2808,$C3F9                                                       ;92ADC0;
    db $10                                                               ;92ADC4;
    dw $280A,$C3F9                                                       ;92ADC5;
    db $00                                                               ;92ADC9;
    dw $280C                                                             ;92ADCA;

SamusSpritemaps_ADCC:
    dw $0002,$C3EF                                                       ;92ADCC;
    db $00                                                               ;92ADD0;
    dw $2808,$C3F7                                                       ;92ADD1;
    db $00                                                               ;92ADD5;
    dw $280A                                                             ;92ADD6;

SamusSpritemaps_ADD8:
    dw $0004,$C3FB                                                       ;92ADD8;
    db $00                                                               ;92ADDC;
    dw $2808,$C3F3                                                       ;92ADDD;
    db $10                                                               ;92ADE1;
    dw $280A,$01F3                                                       ;92ADE2;
    db $08                                                               ;92ADE6;
    dw $280C,$0003                                                       ;92ADE7;
    db $10                                                               ;92ADEB;
    dw $280D                                                             ;92ADEC;

SamusSpritemaps_ADEE:
    dw $0006,$C3FF                                                       ;92ADEE;
    db $06                                                               ;92ADF2;
    dw $2808,$C3F7                                                       ;92ADF3;
    db $FE                                                               ;92ADF7;
    dw $280A,$000F                                                       ;92ADF8;
    db $0F                                                               ;92ADFC;
    dw $280C,$01EF                                                       ;92ADFD;
    db $0E                                                               ;92AE01;
    dw $280D,$01EF                                                       ;92AE02;
    db $06                                                               ;92AE06;
    dw $280E,$0007                                                       ;92AE07;
    db $16                                                               ;92AE0B;
    dw $280F                                                             ;92AE0C;

SamusSpritemaps_AE0E:
    dw $0004,$01FB                                                       ;92AE0E;
    db $18                                                               ;92AE12;
    dw $280C,$C3FB                                                       ;92AE13;
    db $00                                                               ;92AE17;
    dw $2808,$C3F3                                                       ;92AE18;
    db $08                                                               ;92AE1C;
    dw $280A,$01F3                                                       ;92AE1D;
    db $18                                                               ;92AE21;
    dw $280D                                                             ;92AE22;

SamusSpritemaps_AE24:
    dw $0006,$C3FE                                                       ;92AE24;
    db $06                                                               ;92AE28;
    dw $2808,$C3F6                                                       ;92AE29;
    db $FE                                                               ;92AE2D;
    dw $280A,$000E                                                       ;92AE2E;
    db $0F                                                               ;92AE32;
    dw $280C,$0006                                                       ;92AE33;
    db $16                                                               ;92AE37;
    dw $280D,$01EE                                                       ;92AE38;
    db $0E                                                               ;92AE3C;
    dw $280E,$01EE                                                       ;92AE3D;
    db $06                                                               ;92AE41;
    dw $280F                                                             ;92AE42;

SamusSpritemaps_AE44:
    dw $0008,$01F0                                                       ;92AE44;
    db $08                                                               ;92AE48;
    dw $280C,$01F0                                                       ;92AE49;
    db $00                                                               ;92AE4D;
    dw $280D,$01F4                                                       ;92AE4E;
    db $18                                                               ;92AE52;
    dw $280E,$01F4                                                       ;92AE53;
    db $10                                                               ;92AE57;
    dw $280F,$01F4                                                       ;92AE58;
    db $08                                                               ;92AE5C;
    dw $281C,$01F4                                                       ;92AE5D;
    db $00                                                               ;92AE61;
    dw $281D,$C3FC                                                       ;92AE62;
    db $10                                                               ;92AE66;
    dw $2808,$C3FC                                                       ;92AE67;
    db $00                                                               ;92AE6B;
    dw $280A                                                             ;92AE6C;

SamusSpritemaps_AE6E:
    dw $0008,$01F0                                                       ;92AE6E;
    db $08                                                               ;92AE72;
    dw $280C,$01F0                                                       ;92AE73;
    db $00                                                               ;92AE77;
    dw $280D,$01F4                                                       ;92AE78;
    db $18                                                               ;92AE7C;
    dw $280E,$01F4                                                       ;92AE7D;
    db $10                                                               ;92AE81;
    dw $280F,$01F4                                                       ;92AE82;
    db $08                                                               ;92AE86;
    dw $281C,$01F4                                                       ;92AE87;
    db $00                                                               ;92AE8B;
    dw $281D,$C3FC                                                       ;92AE8C;
    db $10                                                               ;92AE90;
    dw $2808,$C3FC                                                       ;92AE91;
    db $00                                                               ;92AE95;
    dw $280A                                                             ;92AE96;

SamusSpritemaps_AE98:
    dw $0003,$C3F1                                                       ;92AE98;
    db $10                                                               ;92AE9C;
    dw $2808,$C3F9                                                       ;92AE9D;
    db $10                                                               ;92AEA1;
    dw $280A,$C3F9                                                       ;92AEA2;
    db $00                                                               ;92AEA6;
    dw $280C                                                             ;92AEA7;

SamusSpritemaps_AEA9:
    dw $0003,$C3F1                                                       ;92AEA9;
    db $10                                                               ;92AEAD;
    dw $2808,$C3F9                                                       ;92AEAE;
    db $10                                                               ;92AEB2;
    dw $280A,$C3F9                                                       ;92AEB3;
    db $00                                                               ;92AEB7;
    dw $280C                                                             ;92AEB8;

SamusSpritemaps_AEBA:
    dw $0003,$C3FF                                                       ;92AEBA;
    db $10                                                               ;92AEBE;
    dw $6808,$C3F7                                                       ;92AEBF;
    db $10                                                               ;92AEC3;
    dw $680A,$C3F7                                                       ;92AEC4;
    db $00                                                               ;92AEC8;
    dw $680C                                                             ;92AEC9;

SamusSpritemaps_AECB:
    dw $0004,$01FB                                                       ;92AECB;
    db $0F                                                               ;92AECF;
    dw $280A,$01F3                                                       ;92AED0;
    db $0F                                                               ;92AED4;
    dw $280B,$01EB                                                       ;92AED5;
    db $0F                                                               ;92AED9;
    dw $280C,$C3F3                                                       ;92AEDA;
    db $FF                                                               ;92AEDE;
    dw $2808                                                             ;92AEDF;

SamusSpritemaps_AEE1:
    dw $0004,$01FD                                                       ;92AEE1;
    db $0F                                                               ;92AEE5;
    dw $780A,$0005                                                       ;92AEE6;
    db $0F                                                               ;92AEEA;
    dw $680B,$000D                                                       ;92AEEB;
    db $0F                                                               ;92AEEF;
    dw $680C,$C3FD                                                       ;92AEF0;
    db $FF                                                               ;92AEF4;
    dw $6808                                                             ;92AEF5;

SamusSpritemaps_AEF7:
    dw $0003,$C3FE                                                       ;92AEF7;
    db $08                                                               ;92AEFB;
    dw $2808,$C3F6                                                       ;92AEFC;
    db $00                                                               ;92AF00;
    dw $280A,$0006                                                       ;92AF01;
    db $00                                                               ;92AF05;
    dw $280C                                                             ;92AF06;

SamusSpritemaps_AF08:
    dw $0003,$C3F2                                                       ;92AF08;
    db $08                                                               ;92AF0C;
    dw $6808,$C3FA                                                       ;92AF0D;
    db $00                                                               ;92AF11;
    dw $680A,$01F2                                                       ;92AF12;
    db $00                                                               ;92AF16;
    dw $680C                                                             ;92AF17;

SamusSpritemaps_AF19:
    dw $0003,$01F6                                                       ;92AF19;
    db $10                                                               ;92AF1D;
    dw $680C,$C3FE                                                       ;92AF1E;
    db $10                                                               ;92AF22;
    dw $6808,$C3F6                                                       ;92AF23;
    db $00                                                               ;92AF27;
    dw $680A                                                             ;92AF28;

SamusSpritemaps_AF2A:
    dw $0003,$0002                                                       ;92AF2A;
    db $10                                                               ;92AF2E;
    dw $280C,$C3F2                                                       ;92AF2F;
    db $10                                                               ;92AF33;
    dw $2808,$C3FA                                                       ;92AF34;
    db $00                                                               ;92AF38;
    dw $280A                                                             ;92AF39;

SamusSpritemaps_AF3B:
    dw $0003,$01F1                                                       ;92AF3B;
    db $08                                                               ;92AF3F;
    dw $280A,$01F1                                                       ;92AF40;
    db $00                                                               ;92AF44;
    dw $280B,$C3F9                                                       ;92AF45;
    db $00                                                               ;92AF49;
    dw $2808                                                             ;92AF4A;

SamusSpritemaps_AF4C:
    dw $0003,$0007                                                       ;92AF4C;
    db $08                                                               ;92AF50;
    dw $680A,$0007                                                       ;92AF51;
    db $00                                                               ;92AF55;
    dw $680B,$C3F7                                                       ;92AF56;
    db $00                                                               ;92AF5A;
    dw $6808                                                             ;92AF5B;

SamusSpritemaps_AF5D:
    dw $0002,$C3EC                                                       ;92AF5D;
    db $00                                                               ;92AF61;
    dw $2808,$C3F4                                                       ;92AF62;
    db $00                                                               ;92AF66;
    dw $280A                                                             ;92AF67;

SamusSpritemaps_AF69:
    dw $0002,$C204                                                       ;92AF69;
    db $00                                                               ;92AF6D;
    dw $2808,$C3FC                                                       ;92AF6E;
    db $00                                                               ;92AF72;
    dw $280A                                                             ;92AF73;

SamusSpritemaps_AF75:
    dw $0004,$01E8                                                       ;92AF75;
    db $10                                                               ;92AF79;
    dw $680C,$01E8                                                       ;92AF7A;
    db $08                                                               ;92AF7E;
    dw $680D,$C3F0                                                       ;92AF7F;
    db $00                                                               ;92AF83;
    dw $6808,$C200                                                       ;92AF84;
    db $00                                                               ;92AF88;
    dw $680A                                                             ;92AF89;

SamusSpritemaps_AF8B:
    dw $0004,$0010                                                       ;92AF8B;
    db $10                                                               ;92AF8F;
    dw $280C,$0010                                                       ;92AF90;
    db $08                                                               ;92AF94;
    dw $280D,$C200                                                       ;92AF95;
    db $00                                                               ;92AF99;
    dw $2808,$C3F0                                                       ;92AF9A;
    db $00                                                               ;92AF9E;
    dw $280A                                                             ;92AF9F;

SamusSpritemaps_AFA1:
    dw $0003,$C3FF                                                       ;92AFA1;
    db $10                                                               ;92AFA5;
    dw $6808,$C3F7                                                       ;92AFA6;
    db $10                                                               ;92AFAA;
    dw $680A,$C3F7                                                       ;92AFAB;
    db $00                                                               ;92AFAF;
    dw $680C                                                             ;92AFB0;

SamusSpritemaps_AFB2:
    dw $0002,$C3F4                                                       ;92AFB2;
    db $00                                                               ;92AFB6;
    dw $2808,$C3FC                                                       ;92AFB7;
    db $00                                                               ;92AFBB;
    dw $280A                                                             ;92AFBC;

SamusSpritemaps_AFBE:
    dw $0002,$C3FC                                                       ;92AFBE;
    db $00                                                               ;92AFC2;
    dw $2808,$C3F4                                                       ;92AFC3;
    db $00                                                               ;92AFC7;
    dw $280A                                                             ;92AFC8;

SamusSpritemaps_AFCA:
    dw $0004,$01F0                                                       ;92AFCA;
    db $18                                                               ;92AFCE;
    dw $680C,$01F0                                                       ;92AFCF;
    db $10                                                               ;92AFD3;
    dw $680D,$C3F8                                                       ;92AFD4;
    db $10                                                               ;92AFD8;
    dw $6808,$C3F8                                                       ;92AFD9;
    db $00                                                               ;92AFDD;
    dw $680A                                                             ;92AFDE;

SamusSpritemaps_AFE0:
    dw $0002,$C3F8                                                       ;92AFE0;
    db $00                                                               ;92AFE4;
    dw $2808,$C3F8                                                       ;92AFE5;
    db $10                                                               ;92AFE9;
    dw $280A                                                             ;92AFEA;

SamusSpritemaps_AFEC:
    dw $0001,$C3F9                                                       ;92AFEC;
    db $00                                                               ;92AFF0;
    dw $2808                                                             ;92AFF1;

SamusSpritemaps_AFF3:
    dw $0004,$01F2                                                       ;92AFF3;
    db $18                                                               ;92AFF7;
    dw $280C,$01F2                                                       ;92AFF8;
    db $10                                                               ;92AFFC;
    dw $280D,$C3FA                                                       ;92AFFD;
    db $10                                                               ;92B001;
    dw $2808,$C3FA                                                       ;92B002;
    db $00                                                               ;92B006;
    dw $280A                                                             ;92B007;

SamusSpritemaps_B009:
    dw $0002,$C3FA                                                       ;92B009;
    db $0F                                                               ;92B00D;
    dw $6808,$C3FA                                                       ;92B00E;
    db $FF                                                               ;92B012;
    dw $680A                                                             ;92B013;

SamusSpritemaps_B015:
    dw $0002,$C3FA                                                       ;92B015;
    db $0F                                                               ;92B019;
    dw $6808,$C3FA                                                       ;92B01A;
    db $FF                                                               ;92B01E;
    dw $680A                                                             ;92B01F;

SamusSpritemaps_B021:
    dw $0004,$01F2                                                       ;92B021;
    db $15                                                               ;92B025;
    dw $280C,$01F2                                                       ;92B026;
    db $0D                                                               ;92B02A;
    dw $280D,$C3FA                                                       ;92B02B;
    db $0D                                                               ;92B02F;
    dw $2808,$C3FA                                                       ;92B030;
    db $FD                                                               ;92B034;
    dw $280A                                                             ;92B035;

SamusSpritemaps_B037:
    dw $0004,$0006                                                       ;92B037;
    db $15                                                               ;92B03B;
    dw $680C,$0006                                                       ;92B03C;
    db $0D                                                               ;92B040;
    dw $680D,$C3F6                                                       ;92B041;
    db $0D                                                               ;92B045;
    dw $6808,$C3F6                                                       ;92B046;
    db $FD                                                               ;92B04A;
    dw $680A                                                             ;92B04B;

SamusSpritemaps_B04D:
    dw $0006,$0008                                                       ;92B04D;
    db $10                                                               ;92B051;
    dw $280A,$0008                                                       ;92B052;
    db $08                                                               ;92B056;
    dw $280B,$0000                                                       ;92B057;
    db $10                                                               ;92B05B;
    dw $280C,$01F8                                                       ;92B05C;
    db $10                                                               ;92B060;
    dw $280D,$0008                                                       ;92B061;
    db $00                                                               ;92B065;
    dw $280E,$C3F8                                                       ;92B066;
    db $00                                                               ;92B06A;
    dw $2808                                                             ;92B06B;

SamusSpritemaps_B06D:
    dw $0006,$01F0                                                       ;92B06D;
    db $10                                                               ;92B071;
    dw $680A,$01F0                                                       ;92B072;
    db $08                                                               ;92B076;
    dw $680B,$01F8                                                       ;92B077;
    db $10                                                               ;92B07B;
    dw $680C,$0000                                                       ;92B07C;
    db $10                                                               ;92B080;
    dw $680D,$01F0                                                       ;92B081;
    db $00                                                               ;92B085;
    dw $680E,$C3F8                                                       ;92B086;
    db $00                                                               ;92B08A;
    dw $6808                                                             ;92B08B;

SamusSpritemaps_B08D:
    dw $0003,$0009                                                       ;92B08D;
    db $02                                                               ;92B091;
    dw $680C,$C3F9                                                       ;92B092;
    db $08                                                               ;92B096;
    dw $6808,$C3F9                                                       ;92B097;
    db $00                                                               ;92B09B;
    dw $680A                                                             ;92B09C;

SamusSpritemaps_B09E:
    dw $0003,$01EF                                                       ;92B09E;
    db $02                                                               ;92B0A2;
    dw $280C,$C3F7                                                       ;92B0A3;
    db $08                                                               ;92B0A7;
    dw $2808,$C3F7                                                       ;92B0A8;
    db $00                                                               ;92B0AC;
    dw $280A                                                             ;92B0AD;

SamusSpritemaps_B0AF:
    dw $0002,$C3FC                                                       ;92B0AF;
    db $10                                                               ;92B0B3;
    dw $6808,$C3FC                                                       ;92B0B4;
    db $00                                                               ;92B0B8;
    dw $680A                                                             ;92B0B9;

SamusSpritemaps_B0BB:
    dw $0002,$C3F4                                                       ;92B0BB;
    db $10                                                               ;92B0BF;
    dw $2808,$C3F4                                                       ;92B0C0;
    db $00                                                               ;92B0C4;
    dw $280A                                                             ;92B0C5;

SamusSpritemaps_B0C7:
    dw $0005,$0004                                                       ;92B0C7;
    db $0F                                                               ;92B0CB;
    dw $280A,$01F4                                                       ;92B0CC;
    db $10                                                               ;92B0D0;
    dw $280B,$01FC                                                       ;92B0D1;
    db $17                                                               ;92B0D5;
    dw $280C,$01FC                                                       ;92B0D6;
    db $0F                                                               ;92B0DA;
    dw $280D,$C3FC                                                       ;92B0DB;
    db $FF                                                               ;92B0DF;
    dw $2808                                                             ;92B0E0;

SamusSpritemaps_B0E2:
    dw $0005,$01F4                                                       ;92B0E2;
    db $0F                                                               ;92B0E6;
    dw $680A,$0004                                                       ;92B0E7;
    db $10                                                               ;92B0EB;
    dw $680B,$01FC                                                       ;92B0EC;
    db $17                                                               ;92B0F0;
    dw $680C,$01FC                                                       ;92B0F1;
    db $0F                                                               ;92B0F5;
    dw $680D,$C3F4                                                       ;92B0F6;
    db $FF                                                               ;92B0FA;
    dw $6808                                                             ;92B0FB;

SamusSpritemaps_B0FD:
    dw $0001,$01F8                                                       ;92B0FD;
    db $F8                                                               ;92B101;
    dw $2C08                                                             ;92B102;

SamusSpritemaps_B104:
    dw $0006,$01FA                                                       ;92B104;
    db $10                                                               ;92B108;
    dw $680A,$0002                                                       ;92B109;
    db $10                                                               ;92B10D;
    dw $680B,$01F2                                                       ;92B10E;
    db $10                                                               ;92B112;
    dw $680C,$01F2                                                       ;92B113;
    db $08                                                               ;92B117;
    dw $680D,$01F2                                                       ;92B118;
    db $00                                                               ;92B11C;
    dw $680E,$C3FA                                                       ;92B11D;
    db $00                                                               ;92B121;
    dw $6808                                                             ;92B122;

SamusSpritemaps_B124:
    dw $0006,$01FE                                                       ;92B124;
    db $10                                                               ;92B128;
    dw $280A,$01F6                                                       ;92B129;
    db $10                                                               ;92B12D;
    dw $280B,$0006                                                       ;92B12E;
    db $10                                                               ;92B132;
    dw $280C,$0006                                                       ;92B133;
    db $08                                                               ;92B137;
    dw $280D,$0006                                                       ;92B138;
    db $00                                                               ;92B13C;
    dw $280E,$C3F6                                                       ;92B13D;
    db $00                                                               ;92B141;
    dw $2808                                                             ;92B142;

SamusSpritemaps_B144:
    dw $0007,$000C                                                       ;92B144;
    db $01                                                               ;92B148;
    dw $280A,$0004                                                       ;92B149;
    db $02                                                               ;92B14D;
    dw $280B,$01FC                                                       ;92B14E;
    db $10                                                               ;92B152;
    dw $280C,$01F4                                                       ;92B153;
    db $10                                                               ;92B157;
    dw $280D,$01F4                                                       ;92B158;
    db $08                                                               ;92B15C;
    dw $280E,$000C                                                       ;92B15D;
    db $00                                                               ;92B161;
    dw $280F,$C3FC                                                       ;92B162;
    db $00                                                               ;92B166;
    dw $2808                                                             ;92B167;

SamusSpritemaps_B169:
    dw $0005,$01FC                                                       ;92B169;
    db $10                                                               ;92B16D;
    dw $680A,$0004                                                       ;92B16E;
    db $10                                                               ;92B172;
    dw $680B,$0004                                                       ;92B173;
    db $08                                                               ;92B177;
    dw $680C,$01EC                                                       ;92B178;
    db $00                                                               ;92B17C;
    dw $680D,$C3F4                                                       ;92B17D;
    db $00                                                               ;92B181;
    dw $6808                                                             ;92B182;

SamusSpritemaps_B184:
    dw $0003,$C3F8                                                       ;92B184;
    db $0F                                                               ;92B188;
    dw $2808,$0008                                                       ;92B189;
    db $0F                                                               ;92B18D;
    dw $280C,$C3F8                                                       ;92B18E;
    db $FF                                                               ;92B192;
    dw $280A                                                             ;92B193;

SamusSpritemaps_B195:
    dw $0003,$C3F8                                                       ;92B195;
    db $0F                                                               ;92B199;
    dw $2808,$0008                                                       ;92B19A;
    db $0F                                                               ;92B19E;
    dw $280C,$C3F8                                                       ;92B19F;
    db $FF                                                               ;92B1A3;
    dw $280A                                                             ;92B1A4;

SamusSpritemaps_B1A6:
    dw $0003,$C3F8                                                       ;92B1A6;
    db $0F                                                               ;92B1AA;
    dw $6808,$01F0                                                       ;92B1AB;
    db $0F                                                               ;92B1AF;
    dw $680C,$C3F8                                                       ;92B1B0;
    db $FF                                                               ;92B1B4;
    dw $680A                                                             ;92B1B5;

SamusSpritemaps_B1B7:
    dw $0003,$C3F8                                                       ;92B1B7;
    db $0F                                                               ;92B1BB;
    dw $6808,$01F0                                                       ;92B1BC;
    db $0F                                                               ;92B1C0;
    dw $680C,$C3F8                                                       ;92B1C1;
    db $FF                                                               ;92B1C5;
    dw $680A                                                             ;92B1C6;

SamusSpritemaps_B1C8:
    dw $0005,$01F6                                                       ;92B1C8;
    db $10                                                               ;92B1CC;
    dw $680C,$01F6                                                       ;92B1CD;
    db $08                                                               ;92B1D1;
    dw $680D,$01F6                                                       ;92B1D2;
    db $00                                                               ;92B1D6;
    dw $680E,$C3FE                                                       ;92B1D7;
    db $08                                                               ;92B1DB;
    dw $6808,$C3FE                                                       ;92B1DC;
    db $00                                                               ;92B1E0;
    dw $680A                                                             ;92B1E1;

SamusSpritemaps_B1E3:
    dw $0005,$0002                                                       ;92B1E3;
    db $10                                                               ;92B1E7;
    dw $280C,$0002                                                       ;92B1E8;
    db $08                                                               ;92B1EC;
    dw $280D,$0002                                                       ;92B1ED;
    db $00                                                               ;92B1F1;
    dw $280E,$C3F2                                                       ;92B1F2;
    db $08                                                               ;92B1F6;
    dw $2808,$C3F2                                                       ;92B1F7;
    db $00                                                               ;92B1FB;
    dw $280A                                                             ;92B1FC;

SamusSpritemaps_B1FE:
    dw $0004,$C3FD                                                       ;92B1FE;
    db $08                                                               ;92B202;
    dw $6808,$01F8                                                       ;92B203;
    db $18                                                               ;92B207;
    dw $680C,$01F5                                                       ;92B208;
    db $10                                                               ;92B20C;
    dw $680D,$C3FD                                                       ;92B20D;
    db $00                                                               ;92B211;
    dw $680A                                                             ;92B212;

SamusSpritemaps_B214:
    dw $0004,$C3F3                                                       ;92B214;
    db $08                                                               ;92B218;
    dw $2808,$0000                                                       ;92B219;
    db $18                                                               ;92B21D;
    dw $280C,$0003                                                       ;92B21E;
    db $10                                                               ;92B222;
    dw $280D,$C3F3                                                       ;92B223;
    db $00                                                               ;92B227;
    dw $280A                                                             ;92B228;

SamusSpritemaps_B22A:
    dw $0002,$C3FA                                                       ;92B22A;
    db $10                                                               ;92B22E;
    dw $6808,$C3FA                                                       ;92B22F;
    db $00                                                               ;92B233;
    dw $680A                                                             ;92B234;

SamusSpritemaps_B236:
    dw $0002,$0004                                                       ;92B236;
    db $08                                                               ;92B23A;
    dw $280A,$C3F4                                                       ;92B23B;
    db $00                                                               ;92B23F;
    dw $2808                                                             ;92B240;

SamusSpritemaps_B242:
    dw $0002,$01F4                                                       ;92B242;
    db $08                                                               ;92B246;
    dw $680A,$C3FC                                                       ;92B247;
    db $00                                                               ;92B24B;
    dw $6808                                                             ;92B24C;

SamusSpritemaps_B24E:
    dw $0006,$C3F1                                                       ;92B24E;
    db $08                                                               ;92B252;
    dw $7808,$C200                                                       ;92B253;
    db $08                                                               ;92B257;
    dw $3808,$C3F0                                                       ;92B258;
    db $F8                                                               ;92B25C;
    dw $380A,$C200                                                       ;92B25D;
    db $F8                                                               ;92B261;
    dw $380C,$C3F1                                                       ;92B262;
    db $E8                                                               ;92B266;
    dw $780E,$C200                                                       ;92B267;
    db $E8                                                               ;92B26B;
    dw $380E                                                             ;92B26C;

SamusSpritemaps_B26E:
    dw $0006,$C3F1                                                       ;92B26E;
    db $08                                                               ;92B272;
    dw $7808,$C3F1                                                       ;92B273;
    db $E8                                                               ;92B277;
    dw $780A,$C3F0                                                       ;92B278;
    db $F8                                                               ;92B27C;
    dw $380C,$C200                                                       ;92B27D;
    db $08                                                               ;92B281;
    dw $3808,$C200                                                       ;92B282;
    db $F8                                                               ;92B286;
    dw $380E,$C200                                                       ;92B287;
    db $E8                                                               ;92B28B;
    dw $380A                                                             ;92B28C;

SamusSpritemaps_B28E:
    dw $0001,$01F8                                                       ;92B28E;
    db $F8                                                               ;92B292;
    dw $3008                                                             ;92B293;

SamusSpritemaps_B295:
    dw $0004,$01F1                                                       ;92B295;
    db $18                                                               ;92B299;
    dw $280C,$01F1                                                       ;92B29A;
    db $10                                                               ;92B29E;
    dw $280D,$C3F9                                                       ;92B29F;
    db $10                                                               ;92B2A3;
    dw $2808,$C3F9                                                       ;92B2A4;
    db $00                                                               ;92B2A8;
    dw $280A                                                             ;92B2A9;

SamusSpritemaps_B2AB:
    dw $0004,$0007                                                       ;92B2AB;
    db $18                                                               ;92B2AF;
    dw $680C,$0007                                                       ;92B2B0;
    db $10                                                               ;92B2B4;
    dw $680D,$C3F7                                                       ;92B2B5;
    db $10                                                               ;92B2B9;
    dw $6808,$C3F7                                                       ;92B2BA;
    db $00                                                               ;92B2BE;
    dw $680A                                                             ;92B2BF;

SamusSpritemaps_B2C1:
    dw $0002,$C3F8                                                       ;92B2C1;
    db $10                                                               ;92B2C5;
    dw $6808,$C3F8                                                       ;92B2C6;
    db $00                                                               ;92B2CA;
    dw $680A                                                             ;92B2CB;

SamusSpritemaps_B2CD:
    dw $0005,$C3FD                                                       ;92B2CD;
    db $07                                                               ;92B2D1;
    dw $6808,$C3F5                                                       ;92B2D2;
    db $FF                                                               ;92B2D6;
    dw $680A,$000D                                                       ;92B2D7;
    db $0F                                                               ;92B2DB;
    dw $680C,$0005                                                       ;92B2DC;
    db $17                                                               ;92B2E0;
    dw $680D,$01F5                                                       ;92B2E1;
    db $0F                                                               ;92B2E5;
    dw $680E                                                             ;92B2E6;

SamusSpritemaps_B2E8:
    dw $0004,$C200                                                       ;92B2E8;
    db $FF                                                               ;92B2EC;
    dw $6808,$C3F0                                                       ;92B2ED;
    db $0F                                                               ;92B2F1;
    dw $680A,$C3F8                                                       ;92B2F2;
    db $FF                                                               ;92B2F6;
    dw $680C,$01F0                                                       ;92B2F7;
    db $07                                                               ;92B2FB;
    dw $680E                                                             ;92B2FC;

SamusSpritemaps_B2FE:
    dw $0002,$C3F9                                                       ;92B2FE;
    db $10                                                               ;92B302;
    dw $6808,$C3F9                                                       ;92B303;
    db $00                                                               ;92B307;
    dw $680A                                                             ;92B308;

SamusSpritemaps_B30A:
    dw $0006,$C3FD                                                       ;92B30A;
    db $07                                                               ;92B30E;
    dw $6808,$C3F5                                                       ;92B30F;
    db $FF                                                               ;92B313;
    dw $680A,$0005                                                       ;92B314;
    db $FF                                                               ;92B318;
    dw $680C,$000D                                                       ;92B319;
    db $0F                                                               ;92B31D;
    dw $680D,$0005                                                       ;92B31E;
    db $17                                                               ;92B322;
    dw $680E,$01F5                                                       ;92B323;
    db $0F                                                               ;92B327;
    dw $680F                                                             ;92B328;

SamusSpritemaps_B32A:
    dw $0004,$C201                                                       ;92B32A;
    db $FF                                                               ;92B32E;
    dw $6808,$C3F1                                                       ;92B32F;
    db $0F                                                               ;92B333;
    dw $680A,$C3F9                                                       ;92B334;
    db $FF                                                               ;92B338;
    dw $680C,$0001                                                       ;92B339;
    db $0F                                                               ;92B33D;
    dw $680E                                                             ;92B33E;

SamusSpritemaps_B340:
    dw $0003,$C3FF                                                       ;92B340;
    db $10                                                               ;92B344;
    dw $6808,$C3F7                                                       ;92B345;
    db $10                                                               ;92B349;
    dw $680A,$C3F7                                                       ;92B34A;
    db $00                                                               ;92B34E;
    dw $680C                                                             ;92B34F;

SamusSpritemaps_B351:
    dw $0002,$C201                                                       ;92B351;
    db $00                                                               ;92B355;
    dw $6808,$C3F9                                                       ;92B356;
    db $00                                                               ;92B35A;
    dw $680A                                                             ;92B35B;

SamusSpritemaps_B35D:
    dw $0004,$C3F5                                                       ;92B35D;
    db $00                                                               ;92B361;
    dw $6808,$C3FD                                                       ;92B362;
    db $10                                                               ;92B366;
    dw $680A,$0005                                                       ;92B367;
    db $08                                                               ;92B36B;
    dw $680C,$01F5                                                       ;92B36C;
    db $10                                                               ;92B370;
    dw $680D                                                             ;92B371;

SamusSpritemaps_B373:
    dw $0006,$C3F1                                                       ;92B373;
    db $06                                                               ;92B377;
    dw $6808,$C3F9                                                       ;92B378;
    db $FE                                                               ;92B37C;
    dw $680A,$01E9                                                       ;92B37D;
    db $0F                                                               ;92B381;
    dw $680C,$0009                                                       ;92B382;
    db $0E                                                               ;92B386;
    dw $680D,$0009                                                       ;92B387;
    db $06                                                               ;92B38B;
    dw $680E,$01F1                                                       ;92B38C;
    db $16                                                               ;92B390;
    dw $680F                                                             ;92B391;

SamusSpritemaps_B393:
    dw $0004,$01FD                                                       ;92B393;
    db $18                                                               ;92B397;
    dw $680C,$C3F5                                                       ;92B398;
    db $00                                                               ;92B39C;
    dw $6808,$C3FD                                                       ;92B39D;
    db $08                                                               ;92B3A1;
    dw $680A,$0005                                                       ;92B3A2;
    db $18                                                               ;92B3A6;
    dw $680D                                                             ;92B3A7;

SamusSpritemaps_B3A9:
    dw $0006,$C3F2                                                       ;92B3A9;
    db $06                                                               ;92B3AD;
    dw $6808,$C3FA                                                       ;92B3AE;
    db $FE                                                               ;92B3B2;
    dw $680A,$01EA                                                       ;92B3B3;
    db $0F                                                               ;92B3B7;
    dw $680C,$01F2                                                       ;92B3B8;
    db $16                                                               ;92B3BC;
    dw $680D,$000A                                                       ;92B3BD;
    db $0E                                                               ;92B3C1;
    dw $680E,$000A                                                       ;92B3C2;
    db $06                                                               ;92B3C6;
    dw $680F                                                             ;92B3C7;

SamusSpritemaps_B3C9:
    dw $0004,$0008                                                       ;92B3C9;
    db $18                                                               ;92B3CD;
    dw $280C,$0008                                                       ;92B3CE;
    db $10                                                               ;92B3D2;
    dw $280D,$C3F8                                                       ;92B3D3;
    db $10                                                               ;92B3D7;
    dw $2808,$C3F8                                                       ;92B3D8;
    db $00                                                               ;92B3DC;
    dw $280A                                                             ;92B3DD;

SamusSpritemaps_B3DF:
    dw $0001,$01F8                                                       ;92B3DF;
    db $F8                                                               ;92B3E3;
    dw $3C08                                                             ;92B3E4;

SamusSpritemaps_B3E6:
    dw $0001,$01F8                                                       ;92B3E6;
    db $F8                                                               ;92B3EA;
    dw $3C08                                                             ;92B3EB;

SamusSpritemaps_B3ED:
    dw $0004,$0006                                                       ;92B3ED;
    db $18                                                               ;92B3F1;
    dw $680C,$0006                                                       ;92B3F2;
    db $10                                                               ;92B3F6;
    dw $680D,$C3F6                                                       ;92B3F7;
    db $10                                                               ;92B3FB;
    dw $6808,$C3F6                                                       ;92B3FC;
    db $00                                                               ;92B400;
    dw $680A                                                             ;92B401;

SamusSpritemaps_B403:
    dw $0002,$C3F6                                                       ;92B403;
    db $0F                                                               ;92B407;
    dw $2808,$C3F6                                                       ;92B408;
    db $FF                                                               ;92B40C;
    dw $280A                                                             ;92B40D;

SamusSpritemaps_B40F:
    dw $0002,$C3F6                                                       ;92B40F;
    db $0F                                                               ;92B413;
    dw $2808,$C3F6                                                       ;92B414;
    db $FF                                                               ;92B418;
    dw $280A                                                             ;92B419;

SamusSpritemaps_B41B:
    dw $0003,$01E8                                                       ;92B41B;
    db $04                                                               ;92B41F;
    dw $280A,$01E8                                                       ;92B420;
    db $FC                                                               ;92B424;
    dw $280B,$C3F0                                                       ;92B425;
    db $FC                                                               ;92B429;
    dw $2808                                                             ;92B42A;

SamusSpritemaps_B42C:
    dw $0006,$01E9                                                       ;92B42C;
    db $0D                                                               ;92B430;
    dw $280A,$01E9                                                       ;92B431;
    db $05                                                               ;92B435;
    dw $280B,$01E9                                                       ;92B436;
    db $FD                                                               ;92B43A;
    dw $280C,$01F9                                                       ;92B43B;
    db $0D                                                               ;92B43F;
    dw $280D,$01F1                                                       ;92B440;
    db $0D                                                               ;92B444;
    dw $280E,$C3F1                                                       ;92B445;
    db $FD                                                               ;92B449;
    dw $2808                                                             ;92B44A;

SamusSpritemaps_B44C:
    dw $0003,$C3E9                                                       ;92B44C;
    db $07                                                               ;92B450;
    dw $2808,$01E9                                                       ;92B451;
    db $FF                                                               ;92B455;
    dw $280C,$C3F1                                                       ;92B456;
    db $FF                                                               ;92B45A;
    dw $280A                                                             ;92B45B;

SamusSpritemaps_B45D:
    dw $0004,$01F8                                                       ;92B45D;
    db $10                                                               ;92B461;
    dw $280A,$01F0                                                       ;92B462;
    db $10                                                               ;92B466;
    dw $280B,$01F0                                                       ;92B467;
    db $08                                                               ;92B46B;
    dw $280C,$C3F8                                                       ;92B46C;
    db $00                                                               ;92B470;
    dw $2808                                                             ;92B471;

SamusSpritemaps_B473:
    dw $0005,$0003                                                       ;92B473;
    db $10                                                               ;92B477;
    dw $280A,$01FB                                                       ;92B478;
    db $10                                                               ;92B47C;
    dw $280B,$01F3                                                       ;92B47D;
    db $10                                                               ;92B481;
    dw $280C,$01F3                                                       ;92B482;
    db $08                                                               ;92B486;
    dw $280D,$C3FB                                                       ;92B487;
    db $00                                                               ;92B48B;
    dw $2808                                                             ;92B48C;

SamusSpritemaps_B48E:
    dw $0005,$01F5                                                       ;92B48E;
    db $08                                                               ;92B492;
    dw $280A,$0005                                                       ;92B493;
    db $10                                                               ;92B497;
    dw $280B,$01FD                                                       ;92B498;
    db $10                                                               ;92B49C;
    dw $280C,$01F5                                                       ;92B49D;
    db $10                                                               ;92B4A1;
    dw $280D,$C3FD                                                       ;92B4A2;
    db $00                                                               ;92B4A6;
    dw $2808                                                             ;92B4A7;

SamusSpritemaps_B4A9:
    dw $0003,$0005                                                       ;92B4A9;
    db $10                                                               ;92B4AD;
    dw $280A,$01FD                                                       ;92B4AE;
    db $10                                                               ;92B4B2;
    dw $280B,$C3FD                                                       ;92B4B3;
    db $00                                                               ;92B4B7;
    dw $2808                                                             ;92B4B8;

SamusSpritemaps_B4BA:
    dw $0004,$000F                                                       ;92B4BA;
    db $0F                                                               ;92B4BE;
    dw $280A,$0007                                                       ;92B4BF;
    db $0F                                                               ;92B4C3;
    dw $280B,$01FF                                                       ;92B4C4;
    db $FF                                                               ;92B4C8;
    dw $280C,$C207                                                       ;92B4C9;
    db $FF                                                               ;92B4CD;
    dw $2808                                                             ;92B4CE;

SamusSpritemaps_B4D0:
    dw $0004,$0007                                                       ;92B4D0;
    db $0B                                                               ;92B4D4;
    dw $280A,$000F                                                       ;92B4D5;
    db $0B                                                               ;92B4D9;
    dw $280B,$000F                                                       ;92B4DA;
    db $03                                                               ;92B4DE;
    dw $280C,$C3FF                                                       ;92B4DF;
    db $FB                                                               ;92B4E3;
    dw $2808                                                             ;92B4E4;

SamusSpritemaps_B4E6:
    dw $0005,$0008                                                       ;92B4E6;
    db $08                                                               ;92B4EA;
    dw $280A,$0010                                                       ;92B4EB;
    db $F8                                                               ;92B4EF;
    dw $280B,$0010                                                       ;92B4F0;
    db $08                                                               ;92B4F4;
    dw $280C,$0010                                                       ;92B4F5;
    db $00                                                               ;92B4F9;
    dw $280D,$C200                                                       ;92B4FA;
    db $F8                                                               ;92B4FE;
    dw $2808                                                             ;92B4FF;

SamusSpritemaps_B501:
    dw $0003,$0010                                                       ;92B501;
    db $08                                                               ;92B505;
    dw $200C,$C210                                                       ;92B506;
    db $F8                                                               ;92B50A;
    dw $2808,$C200                                                       ;92B50B;
    db $F8                                                               ;92B50F;
    dw $280A                                                             ;92B510;

SamusSpritemaps_B512:
    dw $0002,$C3F8                                                       ;92B512;
    db $10                                                               ;92B516;
    dw $2808,$C3F8                                                       ;92B517;
    db $00                                                               ;92B51B;
    dw $280A                                                             ;92B51C;

SamusSpritemaps_B51E:
    dw $0002,$C3F8                                                       ;92B51E;
    db $10                                                               ;92B522;
    dw $2808,$C3F8                                                       ;92B523;
    db $00                                                               ;92B527;
    dw $280A                                                             ;92B528;

SamusSpritemaps_B52A:
    dw $0002,$C3F0                                                       ;92B52A;
    db $F9                                                               ;92B52E;
    dw $2808,$C3E0                                                       ;92B52F;
    db $F9                                                               ;92B533;
    dw $280A                                                             ;92B534;

SamusSpritemaps_B536:
    dw $0004,$01E1                                                       ;92B536;
    db $0F                                                               ;92B53A;
    dw $280A,$01E1                                                       ;92B53B;
    db $07                                                               ;92B53F;
    dw $280B,$01F9                                                       ;92B540;
    db $FF                                                               ;92B544;
    dw $280C,$C3E9                                                       ;92B545;
    db $FF                                                               ;92B549;
    dw $2808                                                             ;92B54A;

SamusSpritemaps_B54C:
    dw $0002,$C3E9                                                       ;92B54C;
    db $07                                                               ;92B550;
    dw $2808,$C3F1                                                       ;92B551;
    db $FF                                                               ;92B555;
    dw $280A                                                             ;92B556;

SamusSpritemaps_B558:
    dw $0002,$C3EB                                                       ;92B558;
    db $0F                                                               ;92B55C;
    dw $2808,$C3F3                                                       ;92B55D;
    db $FF                                                               ;92B561;
    dw $280A                                                             ;92B562;

SamusSpritemaps_B564:
    dw $0004,$01F3                                                       ;92B564;
    db $07                                                               ;92B568;
    dw $280A,$C3F3                                                       ;92B569;
    db $0F                                                               ;92B56D;
    dw $2808,$01FB                                                       ;92B56E;
    db $07                                                               ;92B572;
    dw $280B,$01FB                                                       ;92B573;
    db $FF                                                               ;92B577;
    dw $280C                                                             ;92B578;

SamusSpritemaps_B57A:
    dw $0002,$C3F9                                                       ;92B57A;
    db $10                                                               ;92B57E;
    dw $2808,$C3F9                                                       ;92B57F;
    db $00                                                               ;92B583;
    dw $280A                                                             ;92B584;

SamusSpritemaps_B586:
    dw $0002,$C3FD                                                       ;92B586;
    db $0E                                                               ;92B58A;
    dw $2808,$C3FD                                                       ;92B58B;
    db $FE                                                               ;92B58F;
    dw $280A                                                             ;92B590;

SamusSpritemaps_B592:
    dw $0002,$C207                                                       ;92B592;
    db $0F                                                               ;92B596;
    dw $2808,$C3FF                                                       ;92B597;
    db $FF                                                               ;92B59B;
    dw $280A                                                             ;92B59C;

SamusSpritemaps_B59E:
    dw $0004,$0018                                                       ;92B59E;
    db $10                                                               ;92B5A2;
    dw $280C,$0018                                                       ;92B5A3;
    db $08                                                               ;92B5A7;
    dw $280D,$C208                                                       ;92B5A8;
    db $08                                                               ;92B5AC;
    dw $2808,$C200                                                       ;92B5AD;
    db $00                                                               ;92B5B1;
    dw $280A                                                             ;92B5B2;

SamusSpritemaps_B5B4:
    dw $0002,$C20F                                                       ;92B5B4;
    db $04                                                               ;92B5B8;
    dw $2808,$C3FF                                                       ;92B5B9;
    db $FC                                                               ;92B5BD;
    dw $280A                                                             ;92B5BE;

SamusSpritemaps_B5C0:
    dw $0002,$C200                                                       ;92B5C0;
    db $F8                                                               ;92B5C4;
    dw $E808,$C210                                                       ;92B5C5;
    db $F8                                                               ;92B5C9;
    dw $E80A                                                             ;92B5CA;

SamusSpritemaps_B5CC:
    dw $0003,$0010                                                       ;92B5CC;
    db $F4                                                               ;92B5D0;
    dw $E80A,$0010                                                       ;92B5D1;
    db $FC                                                               ;92B5D5;
    dw $E80B,$C200                                                       ;92B5D6;
    db $F4                                                               ;92B5DA;
    dw $E808                                                             ;92B5DB;

SamusSpritemaps_B5DD:
    dw $0006,$000F                                                       ;92B5DD;
    db $EB                                                               ;92B5E1;
    dw $E80A,$000F                                                       ;92B5E2;
    db $F3                                                               ;92B5E6;
    dw $E80B,$000F                                                       ;92B5E7;
    db $FB                                                               ;92B5EB;
    dw $E80C,$01FF                                                       ;92B5EC;
    db $EB                                                               ;92B5F0;
    dw $E80D,$0007                                                       ;92B5F1;
    db $EB                                                               ;92B5F5;
    dw $E80E,$C3FF                                                       ;92B5F6;
    db $F3                                                               ;92B5FA;
    dw $E808                                                             ;92B5FB;

SamusSpritemaps_B5FD:
    dw $0003,$C207                                                       ;92B5FD;
    db $E9                                                               ;92B601;
    dw $E808,$000F                                                       ;92B602;
    db $F9                                                               ;92B606;
    dw $E80C,$C3FF                                                       ;92B607;
    db $F1                                                               ;92B60B;
    dw $E80A                                                             ;92B60C;

SamusSpritemaps_B60E:
    dw $0004,$0000                                                       ;92B60E;
    db $E8                                                               ;92B612;
    dw $E80A,$0008                                                       ;92B613;
    db $E8                                                               ;92B617;
    dw $E80B,$0008                                                       ;92B618;
    db $F0                                                               ;92B61C;
    dw $E80C,$C3F8                                                       ;92B61D;
    db $F0                                                               ;92B621;
    dw $E808                                                             ;92B622;

SamusSpritemaps_B624:
    dw $0005,$01F5                                                       ;92B624;
    db $E8                                                               ;92B628;
    dw $E80A,$01FD                                                       ;92B629;
    db $E8                                                               ;92B62D;
    dw $E80B,$0005                                                       ;92B62E;
    db $E8                                                               ;92B632;
    dw $E80C,$0005                                                       ;92B633;
    db $F0                                                               ;92B637;
    dw $E80D,$C3F5                                                       ;92B638;
    db $F0                                                               ;92B63C;
    dw $E808                                                             ;92B63D;

SamusSpritemaps_B63F:
    dw $0005,$0003                                                       ;92B63F;
    db $F0                                                               ;92B643;
    dw $E80A,$01F3                                                       ;92B644;
    db $E8                                                               ;92B648;
    dw $E80B,$01FB                                                       ;92B649;
    db $E8                                                               ;92B64D;
    dw $E80C,$0003                                                       ;92B64E;
    db $E8                                                               ;92B652;
    dw $E80D,$C3F3                                                       ;92B653;
    db $F0                                                               ;92B657;
    dw $E808                                                             ;92B658;

SamusSpritemaps_B65A:
    dw $0003,$01F3                                                       ;92B65A;
    db $E8                                                               ;92B65E;
    dw $E80A,$01FB                                                       ;92B65F;
    db $E8                                                               ;92B663;
    dw $E80B,$C3F3                                                       ;92B664;
    db $F0                                                               ;92B668;
    dw $E808                                                             ;92B669;

SamusSpritemaps_B66B:
    dw $0004,$01E9                                                       ;92B66B;
    db $E9                                                               ;92B66F;
    dw $E80A,$01F1                                                       ;92B670;
    db $E9                                                               ;92B674;
    dw $E80B,$01F9                                                       ;92B675;
    db $F9                                                               ;92B679;
    dw $E80C,$C3E9                                                       ;92B67A;
    db $F1                                                               ;92B67E;
    dw $E808                                                             ;92B67F;

SamusSpritemaps_B681:
    dw $0004,$01F1                                                       ;92B681;
    db $ED                                                               ;92B685;
    dw $E80A,$01E9                                                       ;92B686;
    db $ED                                                               ;92B68A;
    dw $E80B,$01E9                                                       ;92B68B;
    db $F5                                                               ;92B68F;
    dw $E80C,$C3F1                                                       ;92B690;
    db $F5                                                               ;92B694;
    dw $E808                                                             ;92B695;

SamusSpritemaps_B697:
    dw $0005,$01F0                                                       ;92B697;
    db $F0                                                               ;92B69B;
    dw $E80A,$01E8                                                       ;92B69C;
    db $00                                                               ;92B6A0;
    dw $E80B,$01E8                                                       ;92B6A1;
    db $F0                                                               ;92B6A5;
    dw $E80C,$01E8                                                       ;92B6A6;
    db $F8                                                               ;92B6AA;
    dw $E80D,$C3F0                                                       ;92B6AB;
    db $F8                                                               ;92B6AF;
    dw $E808                                                             ;92B6B0;

SamusSpritemaps_B6B2:
    dw $0003,$01E8                                                       ;92B6B2;
    db $F0                                                               ;92B6B6;
    dw $E80C,$C3E0                                                       ;92B6B7;
    db $F8                                                               ;92B6BB;
    dw $E808,$C3F0                                                       ;92B6BC;
    db $F8                                                               ;92B6C0;
    dw $E80A                                                             ;92B6C1;

SamusSpritemaps_B6C3:
    dw $0002,$C3F8                                                       ;92B6C3;
    db $E0                                                               ;92B6C7;
    dw $E808,$C3F8                                                       ;92B6C8;
    db $F0                                                               ;92B6CC;
    dw $E80A                                                             ;92B6CD;

SamusSpritemaps_B6CF:
    dw $0002,$C3F8                                                       ;92B6CF;
    db $E0                                                               ;92B6D3;
    dw $E808,$C3F8                                                       ;92B6D4;
    db $F0                                                               ;92B6D8;
    dw $E80A                                                             ;92B6D9;

SamusSpritemaps_B6DB:
    dw $0002,$C200                                                       ;92B6DB;
    db $F7                                                               ;92B6DF;
    dw $E808,$C210                                                       ;92B6E0;
    db $F7                                                               ;92B6E4;
    dw $E80A                                                             ;92B6E5;

SamusSpritemaps_B6E7:
    dw $0004,$0017                                                       ;92B6E7;
    db $E9                                                               ;92B6EB;
    dw $E80A,$0017                                                       ;92B6EC;
    db $F1                                                               ;92B6F0;
    dw $E80B,$01FF                                                       ;92B6F1;
    db $F9                                                               ;92B6F5;
    dw $E80C,$C207                                                       ;92B6F6;
    db $F1                                                               ;92B6FA;
    dw $E808                                                             ;92B6FB;

SamusSpritemaps_B6FD:
    dw $0002,$C207                                                       ;92B6FD;
    db $E9                                                               ;92B701;
    dw $E808,$C3FF                                                       ;92B702;
    db $F1                                                               ;92B706;
    dw $E80A                                                             ;92B707;

SamusSpritemaps_B709:
    dw $0002,$C205                                                       ;92B709;
    db $E1                                                               ;92B70D;
    dw $E808,$C3FD                                                       ;92B70E;
    db $F1                                                               ;92B712;
    dw $E80A                                                             ;92B713;

SamusSpritemaps_B715:
    dw $0004,$0005                                                       ;92B715;
    db $F1                                                               ;92B719;
    dw $E80A,$C3FD                                                       ;92B71A;
    db $E1                                                               ;92B71E;
    dw $E808,$01FD                                                       ;92B71F;
    db $F1                                                               ;92B723;
    dw $E80B,$01FD                                                       ;92B724;
    db $F9                                                               ;92B728;
    dw $E80C                                                             ;92B729;

SamusSpritemaps_B72B:
    dw $0002,$C3F7                                                       ;92B72B;
    db $E0                                                               ;92B72F;
    dw $E808,$C3F7                                                       ;92B730;
    db $F0                                                               ;92B734;
    dw $E80A                                                             ;92B735;

SamusSpritemaps_B737:
    dw $0002,$C3F3                                                       ;92B737;
    db $E2                                                               ;92B73B;
    dw $E808,$C3F3                                                       ;92B73C;
    db $F2                                                               ;92B740;
    dw $E80A                                                             ;92B741;

SamusSpritemaps_B743:
    dw $0002,$C3E9                                                       ;92B743;
    db $E1                                                               ;92B747;
    dw $E808,$C3F1                                                       ;92B748;
    db $F1                                                               ;92B74C;
    dw $E80A                                                             ;92B74D;

SamusSpritemaps_B74F:
    dw $0002,$C3E1                                                       ;92B74F;
    db $EC                                                               ;92B753;
    dw $E808,$C3F1                                                       ;92B754;
    db $F4                                                               ;92B758;
    dw $E80A                                                             ;92B759;

SamusSpritemaps_B75B:
    dw $0002,$C3F0                                                       ;92B75B;
    db $F8                                                               ;92B75F;
    dw $2808,$C3E0                                                       ;92B760;
    db $F8                                                               ;92B764;
    dw $280A                                                             ;92B765;

SamusSpritemaps_B767:
    dw $0003,$0010                                                       ;92B767;
    db $04                                                               ;92B76B;
    dw $680A,$0010                                                       ;92B76C;
    db $FC                                                               ;92B770;
    dw $680B,$C200                                                       ;92B771;
    db $FC                                                               ;92B775;
    dw $6808                                                             ;92B776;

SamusSpritemaps_B778:
    dw $0006,$000F                                                       ;92B778;
    db $0D                                                               ;92B77C;
    dw $680A,$000F                                                       ;92B77D;
    db $05                                                               ;92B781;
    dw $680B,$000F                                                       ;92B782;
    db $FD                                                               ;92B786;
    dw $680C,$01FF                                                       ;92B787;
    db $0D                                                               ;92B78B;
    dw $680D,$0007                                                       ;92B78C;
    db $0D                                                               ;92B790;
    dw $680E,$C3FF                                                       ;92B791;
    db $FD                                                               ;92B795;
    dw $6808                                                             ;92B796;

SamusSpritemaps_B798:
    dw $0003,$C207                                                       ;92B798;
    db $07                                                               ;92B79C;
    dw $6808,$000F                                                       ;92B79D;
    db $FF                                                               ;92B7A1;
    dw $680C,$C3FF                                                       ;92B7A2;
    db $FF                                                               ;92B7A6;
    dw $680A                                                             ;92B7A7;

SamusSpritemaps_B7A9:
    dw $0004,$0000                                                       ;92B7A9;
    db $10                                                               ;92B7AD;
    dw $680A,$0008                                                       ;92B7AE;
    db $10                                                               ;92B7B2;
    dw $680B,$0008                                                       ;92B7B3;
    db $08                                                               ;92B7B7;
    dw $680C,$C3F8                                                       ;92B7B8;
    db $00                                                               ;92B7BC;
    dw $6808                                                             ;92B7BD;

SamusSpritemaps_B7BF:
    dw $0005,$01F5                                                       ;92B7BF;
    db $10                                                               ;92B7C3;
    dw $680A,$01FD                                                       ;92B7C4;
    db $10                                                               ;92B7C8;
    dw $680B,$0005                                                       ;92B7C9;
    db $10                                                               ;92B7CD;
    dw $680C,$0005                                                       ;92B7CE;
    db $08                                                               ;92B7D2;
    dw $680D,$C3F5                                                       ;92B7D3;
    db $00                                                               ;92B7D7;
    dw $6808                                                             ;92B7D8;

SamusSpritemaps_B7DA:
    dw $0005,$0003                                                       ;92B7DA;
    db $08                                                               ;92B7DE;
    dw $680A,$01F3                                                       ;92B7DF;
    db $10                                                               ;92B7E3;
    dw $680B,$01FB                                                       ;92B7E4;
    db $10                                                               ;92B7E8;
    dw $680C,$0003                                                       ;92B7E9;
    db $10                                                               ;92B7ED;
    dw $680D,$C3F3                                                       ;92B7EE;
    db $00                                                               ;92B7F2;
    dw $6808                                                             ;92B7F3;

SamusSpritemaps_B7F5:
    dw $0003,$01F3                                                       ;92B7F5;
    db $10                                                               ;92B7F9;
    dw $680A,$01FB                                                       ;92B7FA;
    db $10                                                               ;92B7FE;
    dw $680B,$C3F3                                                       ;92B7FF;
    db $00                                                               ;92B803;
    dw $6808                                                             ;92B804;

SamusSpritemaps_B806:
    dw $0004,$01E9                                                       ;92B806;
    db $0F                                                               ;92B80A;
    dw $680A,$01F1                                                       ;92B80B;
    db $0F                                                               ;92B80F;
    dw $680B,$01F9                                                       ;92B810;
    db $FF                                                               ;92B814;
    dw $680C,$C3E9                                                       ;92B815;
    db $FF                                                               ;92B819;
    dw $6808                                                             ;92B81A;

SamusSpritemaps_B81C:
    dw $0004,$01F1                                                       ;92B81C;
    db $0B                                                               ;92B820;
    dw $680A,$01E9                                                       ;92B821;
    db $0B                                                               ;92B825;
    dw $680B,$01E9                                                       ;92B826;
    db $03                                                               ;92B82A;
    dw $680C,$C3F1                                                       ;92B82B;
    db $FB                                                               ;92B82F;
    dw $6808                                                             ;92B830;

SamusSpritemaps_B832:
    dw $0005,$01F0                                                       ;92B832;
    db $08                                                               ;92B836;
    dw $680A,$01E8                                                       ;92B837;
    db $F8                                                               ;92B83B;
    dw $680B,$01E8                                                       ;92B83C;
    db $08                                                               ;92B840;
    dw $680C,$01E8                                                       ;92B841;
    db $00                                                               ;92B845;
    dw $680D,$C3F0                                                       ;92B846;
    db $F8                                                               ;92B84A;
    dw $6808                                                             ;92B84B;

SamusSpritemaps_B84D:
    dw $0003,$01E8                                                       ;92B84D;
    db $08                                                               ;92B851;
    dw $600C,$C3E0                                                       ;92B852;
    db $F8                                                               ;92B856;
    dw $6808,$C3F0                                                       ;92B857;
    db $F8                                                               ;92B85B;
    dw $680A                                                             ;92B85C;

SamusSpritemaps_B85E:
    dw $0002,$C3F8                                                       ;92B85E;
    db $10                                                               ;92B862;
    dw $6808,$C3F8                                                       ;92B863;
    db $00                                                               ;92B867;
    dw $680A                                                             ;92B868;

SamusSpritemaps_B86A:
    dw $0002,$C3F8                                                       ;92B86A;
    db $10                                                               ;92B86E;
    dw $6808,$C3F8                                                       ;92B86F;
    db $00                                                               ;92B873;
    dw $680A                                                             ;92B874;

SamusSpritemaps_B876:
    dw $0002,$C200                                                       ;92B876;
    db $F9                                                               ;92B87A;
    dw $6808,$C210                                                       ;92B87B;
    db $F9                                                               ;92B87F;
    dw $680A                                                             ;92B880;

SamusSpritemaps_B882:
    dw $0004,$0017                                                       ;92B882;
    db $0F                                                               ;92B886;
    dw $680A,$0017                                                       ;92B887;
    db $07                                                               ;92B88B;
    dw $680B,$01FF                                                       ;92B88C;
    db $FF                                                               ;92B890;
    dw $680C,$C207                                                       ;92B891;
    db $FF                                                               ;92B895;
    dw $6808                                                             ;92B896;

SamusSpritemaps_B898:
    dw $0002,$C207                                                       ;92B898;
    db $07                                                               ;92B89C;
    dw $6808,$C3FF                                                       ;92B89D;
    db $FF                                                               ;92B8A1;
    dw $680A                                                             ;92B8A2;

SamusSpritemaps_B8A4:
    dw $0002,$C205                                                       ;92B8A4;
    db $0F                                                               ;92B8A8;
    dw $6808,$C3FD                                                       ;92B8A9;
    db $FF                                                               ;92B8AD;
    dw $680A                                                             ;92B8AE;

SamusSpritemaps_B8B0:
    dw $0004,$0005                                                       ;92B8B0;
    db $07                                                               ;92B8B4;
    dw $680A,$C3FD                                                       ;92B8B5;
    db $0F                                                               ;92B8B9;
    dw $6808,$01FD                                                       ;92B8BA;
    db $07                                                               ;92B8BE;
    dw $680B,$01FD                                                       ;92B8BF;
    db $FF                                                               ;92B8C3;
    dw $680C                                                             ;92B8C4;

SamusSpritemaps_B8C6:
    dw $0002,$C3F7                                                       ;92B8C6;
    db $10                                                               ;92B8CA;
    dw $6808,$C3F7                                                       ;92B8CB;
    db $00                                                               ;92B8CF;
    dw $680A                                                             ;92B8D0;

SamusSpritemaps_B8D2:
    dw $0002,$C3F3                                                       ;92B8D2;
    db $0E                                                               ;92B8D6;
    dw $6808,$C3F3                                                       ;92B8D7;
    db $FE                                                               ;92B8DB;
    dw $680A                                                             ;92B8DC;

SamusSpritemaps_B8DE:
    dw $0002,$C3E9                                                       ;92B8DE;
    db $0F                                                               ;92B8E2;
    dw $6808,$C3F1                                                       ;92B8E3;
    db $FF                                                               ;92B8E7;
    dw $680A                                                             ;92B8E8;

SamusSpritemaps_B8EA:
    dw $0004,$01E0                                                       ;92B8EA;
    db $10                                                               ;92B8EE;
    dw $680C,$01E0                                                       ;92B8EF;
    db $08                                                               ;92B8F3;
    dw $680D,$C3E8                                                       ;92B8F4;
    db $08                                                               ;92B8F8;
    dw $6808,$C3F0                                                       ;92B8F9;
    db $00                                                               ;92B8FD;
    dw $680A                                                             ;92B8FE;

SamusSpritemaps_B900:
    dw $0002,$C3E1                                                       ;92B900;
    db $04                                                               ;92B904;
    dw $6808,$C3F1                                                       ;92B905;
    db $FC                                                               ;92B909;
    dw $680A                                                             ;92B90A;

SamusSpritemaps_B90C:
    dw $0002,$C3F0                                                       ;92B90C;
    db $F8                                                               ;92B910;
    dw $A808,$C3E0                                                       ;92B911;
    db $F8                                                               ;92B915;
    dw $A80A                                                             ;92B916;

SamusSpritemaps_B918:
    dw $0003,$01E8                                                       ;92B918;
    db $F4                                                               ;92B91C;
    dw $A80A,$01E8                                                       ;92B91D;
    db $FC                                                               ;92B921;
    dw $A80B,$C3F0                                                       ;92B922;
    db $F4                                                               ;92B926;
    dw $A808                                                             ;92B927;

SamusSpritemaps_B929:
    dw $0006,$01E9                                                       ;92B929;
    db $EB                                                               ;92B92D;
    dw $A80A,$01E9                                                       ;92B92E;
    db $F3                                                               ;92B932;
    dw $A80B,$01E9                                                       ;92B933;
    db $FB                                                               ;92B937;
    dw $A80C,$01F9                                                       ;92B938;
    db $EB                                                               ;92B93C;
    dw $A80D,$01F1                                                       ;92B93D;
    db $EB                                                               ;92B941;
    dw $A80E,$C3F1                                                       ;92B942;
    db $F3                                                               ;92B946;
    dw $A808                                                             ;92B947;

SamusSpritemaps_B949:
    dw $0003,$C3E9                                                       ;92B949;
    db $E9                                                               ;92B94D;
    dw $A808,$01E9                                                       ;92B94E;
    db $F9                                                               ;92B952;
    dw $A80C,$C3F1                                                       ;92B953;
    db $F1                                                               ;92B957;
    dw $A80A                                                             ;92B958;

SamusSpritemaps_B95A:
    dw $0004,$01F8                                                       ;92B95A;
    db $E8                                                               ;92B95E;
    dw $A80A,$01F0                                                       ;92B95F;
    db $E8                                                               ;92B963;
    dw $A80B,$01F0                                                       ;92B964;
    db $F0                                                               ;92B968;
    dw $A80C,$C3F8                                                       ;92B969;
    db $F0                                                               ;92B96D;
    dw $A808                                                             ;92B96E;

SamusSpritemaps_B970:
    dw $0005,$0003                                                       ;92B970;
    db $E8                                                               ;92B974;
    dw $A80A,$01FB                                                       ;92B975;
    db $E8                                                               ;92B979;
    dw $A80B,$01F3                                                       ;92B97A;
    db $E8                                                               ;92B97E;
    dw $A80C,$01F3                                                       ;92B97F;
    db $F0                                                               ;92B983;
    dw $A80D,$C3FB                                                       ;92B984;
    db $F0                                                               ;92B988;
    dw $A808                                                             ;92B989;

SamusSpritemaps_B98B:
    dw $0005,$01F5                                                       ;92B98B;
    db $F0                                                               ;92B98F;
    dw $A80A,$0005                                                       ;92B990;
    db $E8                                                               ;92B994;
    dw $A80B,$01FD                                                       ;92B995;
    db $E8                                                               ;92B999;
    dw $A80C,$01F5                                                       ;92B99A;
    db $E8                                                               ;92B99E;
    dw $A80D,$C3FD                                                       ;92B99F;
    db $F0                                                               ;92B9A3;
    dw $A808                                                             ;92B9A4;

SamusSpritemaps_B9A6:
    dw $0003,$0005                                                       ;92B9A6;
    db $E8                                                               ;92B9AA;
    dw $A80A,$01FD                                                       ;92B9AB;
    db $E8                                                               ;92B9AF;
    dw $A80B,$C3FD                                                       ;92B9B0;
    db $F0                                                               ;92B9B4;
    dw $A808                                                             ;92B9B5;

SamusSpritemaps_B9B7:
    dw $0004,$000F                                                       ;92B9B7;
    db $E9                                                               ;92B9BB;
    dw $A80A,$0007                                                       ;92B9BC;
    db $E9                                                               ;92B9C0;
    dw $A80B,$01FF                                                       ;92B9C1;
    db $F9                                                               ;92B9C5;
    dw $A80C,$C207                                                       ;92B9C6;
    db $F1                                                               ;92B9CA;
    dw $A808                                                             ;92B9CB;

SamusSpritemaps_B9CD:
    dw $0004,$0007                                                       ;92B9CD;
    db $ED                                                               ;92B9D1;
    dw $A80A,$000F                                                       ;92B9D2;
    db $ED                                                               ;92B9D6;
    dw $A80B,$000F                                                       ;92B9D7;
    db $F5                                                               ;92B9DB;
    dw $A80C,$C3FF                                                       ;92B9DC;
    db $F5                                                               ;92B9E0;
    dw $A808                                                             ;92B9E1;

SamusSpritemaps_B9E3:
    dw $0005,$0008                                                       ;92B9E3;
    db $F0                                                               ;92B9E7;
    dw $A80A,$0010                                                       ;92B9E8;
    db $00                                                               ;92B9EC;
    dw $A80B,$0010                                                       ;92B9ED;
    db $F0                                                               ;92B9F1;
    dw $A80C,$0010                                                       ;92B9F2;
    db $F8                                                               ;92B9F6;
    dw $A80D,$C200                                                       ;92B9F7;
    db $F8                                                               ;92B9FB;
    dw $A808                                                             ;92B9FC;

SamusSpritemaps_B9FE:
    dw $0003,$0010                                                       ;92B9FE;
    db $F0                                                               ;92BA02;
    dw $A80C,$C210                                                       ;92BA03;
    db $F8                                                               ;92BA07;
    dw $A808,$C200                                                       ;92BA08;
    db $F8                                                               ;92BA0C;
    dw $A80A                                                             ;92BA0D;

SamusSpritemaps_BA0F:
    dw $0002,$C3F8                                                       ;92BA0F;
    db $E0                                                               ;92BA13;
    dw $A808,$C3F8                                                       ;92BA14;
    db $F0                                                               ;92BA18;
    dw $A80A                                                             ;92BA19;

SamusSpritemaps_BA1B:
    dw $0002,$C3F8                                                       ;92BA1B;
    db $E0                                                               ;92BA1F;
    dw $A808,$C3F8                                                       ;92BA20;
    db $F0                                                               ;92BA24;
    dw $A80A                                                             ;92BA25;

SamusSpritemaps_BA27:
    dw $0002,$C3F0                                                       ;92BA27;
    db $F7                                                               ;92BA2B;
    dw $A808,$C3E0                                                       ;92BA2C;
    db $F7                                                               ;92BA30;
    dw $A80A                                                             ;92BA31;

SamusSpritemaps_BA33:
    dw $0004,$01E1                                                       ;92BA33;
    db $E9                                                               ;92BA37;
    dw $A80A,$01E1                                                       ;92BA38;
    db $F1                                                               ;92BA3C;
    dw $A80B,$01F9                                                       ;92BA3D;
    db $F9                                                               ;92BA41;
    dw $A80C,$C3E9                                                       ;92BA42;
    db $F1                                                               ;92BA46;
    dw $A808                                                             ;92BA47;

SamusSpritemaps_BA49:
    dw $0002,$C3E9                                                       ;92BA49;
    db $E9                                                               ;92BA4D;
    dw $A808,$C3F1                                                       ;92BA4E;
    db $F1                                                               ;92BA52;
    dw $A80A                                                             ;92BA53;

SamusSpritemaps_BA55:
    dw $0002,$C3EB                                                       ;92BA55;
    db $E1                                                               ;92BA59;
    dw $A808,$C3F3                                                       ;92BA5A;
    db $F1                                                               ;92BA5E;
    dw $A80A                                                             ;92BA5F;

SamusSpritemaps_BA61:
    dw $0004,$01F3                                                       ;92BA61;
    db $F1                                                               ;92BA65;
    dw $A80A,$C3F3                                                       ;92BA66;
    db $E1                                                               ;92BA6A;
    dw $A808,$01FB                                                       ;92BA6B;
    db $F1                                                               ;92BA6F;
    dw $A80B,$01FB                                                       ;92BA70;
    db $F9                                                               ;92BA74;
    dw $A80C                                                             ;92BA75;

SamusSpritemaps_BA77:
    dw $0002,$C3F9                                                       ;92BA77;
    db $E0                                                               ;92BA7B;
    dw $A808,$C3F9                                                       ;92BA7C;
    db $F0                                                               ;92BA80;
    dw $A80A                                                             ;92BA81;

SamusSpritemaps_BA83:
    dw $0002,$C3FD                                                       ;92BA83;
    db $E2                                                               ;92BA87;
    dw $A808,$C3FD                                                       ;92BA88;
    db $F2                                                               ;92BA8C;
    dw $A80A                                                             ;92BA8D;

SamusSpritemaps_BA8F:
    dw $0002,$C207                                                       ;92BA8F;
    db $E1                                                               ;92BA93;
    dw $A808,$C3FF                                                       ;92BA94;
    db $F1                                                               ;92BA98;
    dw $A80A                                                             ;92BA99;

SamusSpritemaps_BA9B:
    dw $0002,$C20F                                                       ;92BA9B;
    db $EC                                                               ;92BA9F;
    dw $A808,$C3FF                                                       ;92BAA0;
    db $F4                                                               ;92BAA4;
    dw $A80A                                                             ;92BAA5;

SamusSpritemaps_BAA7:
    dw $0002,$C200                                                       ;92BAA7;
    db $F8                                                               ;92BAAB;
    dw $6808,$C210                                                       ;92BAAC;
    db $F8                                                               ;92BAB0;
    dw $680A                                                             ;92BAB1;

SamusSpritemaps_BAB3:
    dw $0002,$01F8                                                       ;92BAB3;
    db $F8                                                               ;92BAB7;
    dw $2802,$C3F8                                                       ;92BAB8;
    db $F8                                                               ;92BABC;
    dw $2800                                                             ;92BABD;

SamusSpritemaps_BABF:
    dw $0002,$01F8                                                       ;92BABF;
    db $F8                                                               ;92BAC3;
    dw $2802,$C3F8                                                       ;92BAC4;
    db $F8                                                               ;92BAC8;
    dw $6800                                                             ;92BAC9;

SamusSpritemaps_BACB:
    dw $0002,$01F8                                                       ;92BACB;
    db $F8                                                               ;92BACF;
    dw $2802,$C3F8                                                       ;92BAD0;
    db $F8                                                               ;92BAD4;
    dw $E800                                                             ;92BAD5;

SamusSpritemaps_BAD7:
    dw $0002,$01F8                                                       ;92BAD7;
    db $F8                                                               ;92BADB;
    dw $2802,$C3F8                                                       ;92BADC;
    db $F8                                                               ;92BAE0;
    dw $A800                                                             ;92BAE1;

SamusSpritemaps_BAE3:
    dw $0005,$01F8                                                       ;92BAE3;
    db $F8                                                               ;92BAE7;
    dw $2800,$0000                                                       ;92BAE8;
    db $FF                                                               ;92BAEC;
    dw $2801,$01F8                                                       ;92BAED;
    db $FF                                                               ;92BAF1;
    dw $2802,$0000                                                       ;92BAF2;
    db $F7                                                               ;92BAF6;
    dw $2803,$01F8                                                       ;92BAF7;
    db $F7                                                               ;92BAFB;
    dw $2804                                                             ;92BAFC;

SamusSpritemaps_BAFE:
    dw $0002,$01F8                                                       ;92BAFE;
    db $F8                                                               ;92BB02;
    dw $2802,$C3F8                                                       ;92BB03;
    db $F9                                                               ;92BB07;
    dw $2800                                                             ;92BB08;

SamusSpritemaps_BB0A:
    dw $0002,$01F8                                                       ;92BB0A;
    db $F8                                                               ;92BB0E;
    dw $2802,$C3F8                                                       ;92BB0F;
    db $F7                                                               ;92BB13;
    dw $A800                                                             ;92BB14;

SamusSpritemaps_BB16:
    dw $0002,$01F8                                                       ;92BB16;
    db $F8                                                               ;92BB1A;
    dw $2802,$C3F8                                                       ;92BB1B;
    db $F9                                                               ;92BB1F;
    dw $6800                                                             ;92BB20;

SamusSpritemaps_BB22:
    dw $0002,$C3F8                                                       ;92BB22;
    db $00                                                               ;92BB26;
    dw $2800,$C3F8                                                       ;92BB27;
    db $F0                                                               ;92BB2B;
    dw $2802                                                             ;92BB2C;

SamusSpritemaps_BB2E:
    dw $0004,$C200                                                       ;92BB2E;
    db $F1                                                               ;92BB32;
    dw $2800,$C3F0                                                       ;92BB33;
    db $01                                                               ;92BB37;
    dw $2802,$C200                                                       ;92BB38;
    db $01                                                               ;92BB3C;
    dw $2804,$C3F0                                                       ;92BB3D;
    db $F1                                                               ;92BB41;
    dw $2806                                                             ;92BB42;

SamusSpritemaps_BB44:
    dw $0002,$C200                                                       ;92BB44;
    db $F8                                                               ;92BB48;
    dw $2800,$C3F0                                                       ;92BB49;
    db $F8                                                               ;92BB4D;
    dw $2802                                                             ;92BB4E;

SamusSpritemaps_BB50:
    dw $0004,$C201                                                       ;92BB50;
    db $01                                                               ;92BB54;
    dw $E800,$C3F1                                                       ;92BB55;
    db $F1                                                               ;92BB59;
    dw $E802,$C3F1                                                       ;92BB5A;
    db $01                                                               ;92BB5E;
    dw $E804,$C201                                                       ;92BB5F;
    db $F1                                                               ;92BB63;
    dw $E806                                                             ;92BB64;

SamusSpritemaps_BB66:
    dw $0002,$C3F8                                                       ;92BB66;
    db $F0                                                               ;92BB6A;
    dw $E800,$C3F8                                                       ;92BB6B;
    db $00                                                               ;92BB6F;
    dw $E802                                                             ;92BB70;

SamusSpritemaps_BB72:
    dw $0004,$C3F1                                                       ;92BB72;
    db $FF                                                               ;92BB76;
    dw $E800,$C201                                                       ;92BB77;
    db $EF                                                               ;92BB7B;
    dw $E802,$C201                                                       ;92BB7C;
    db $FF                                                               ;92BB80;
    dw $E804,$C3F1                                                       ;92BB81;
    db $EF                                                               ;92BB85;
    dw $E806                                                             ;92BB86;

SamusSpritemaps_BB88:
    dw $0002,$C3F0                                                       ;92BB88;
    db $F8                                                               ;92BB8C;
    dw $E800,$C200                                                       ;92BB8D;
    db $F8                                                               ;92BB91;
    dw $E802                                                             ;92BB92;

SamusSpritemaps_BB94:
    dw $0004,$C3EF                                                       ;92BB94;
    db $EE                                                               ;92BB98;
    dw $2800,$C3FF                                                       ;92BB99;
    db $FE                                                               ;92BB9D;
    dw $2802,$C3EF                                                       ;92BB9E;
    db $FE                                                               ;92BBA2;
    dw $2804,$C3FF                                                       ;92BBA3;
    db $EE                                                               ;92BBA7;
    dw $2806                                                             ;92BBA8;

SamusSpritemaps_BBAA:
    dw $000A,$01F8                                                       ;92BBAA;
    db $0A                                                               ;92BBAE;
    dw $2800,$01F0                                                       ;92BBAF;
    db $0A                                                               ;92BBB3;
    dw $2801,$000A                                                       ;92BBB4;
    db $00                                                               ;92BBB8;
    dw $2802,$01EE                                                       ;92BBB9;
    db $00                                                               ;92BBBD;
    dw $2803,$000A                                                       ;92BBBE;
    db $F6                                                               ;92BBC2;
    dw $2804,$01EE                                                       ;92BBC3;
    db $F8                                                               ;92BBC7;
    dw $2805,$000A                                                       ;92BBC8;
    db $EE                                                               ;92BBCC;
    dw $2806,$0000                                                       ;92BBCD;
    db $EE                                                               ;92BBD1;
    dw $2807,$01F8                                                       ;92BBD2;
    db $EE                                                               ;92BBD6;
    dw $2810,$01EE                                                       ;92BBD7;
    db $F0                                                               ;92BBDB;
    dw $2811                                                             ;92BBDC;

SamusSpritemaps_BBDE:
    dw $000B,$0000                                                       ;92BBDE;
    db $08                                                               ;92BBE2;
    dw $2800,$01F8                                                       ;92BBE3;
    db $08                                                               ;92BBE7;
    dw $2801,$01F0                                                       ;92BBE8;
    db $08                                                               ;92BBEC;
    dw $2802,$0008                                                       ;92BBED;
    db $00                                                               ;92BBF1;
    dw $2803,$01F0                                                       ;92BBF2;
    db $00                                                               ;92BBF6;
    dw $2804,$0008                                                       ;92BBF7;
    db $F8                                                               ;92BBFB;
    dw $2805,$01F0                                                       ;92BBFC;
    db $F6                                                               ;92BC00;
    dw $2806,$0008                                                       ;92BC01;
    db $F0                                                               ;92BC05;
    dw $2807,$0000                                                       ;92BC06;
    db $F0                                                               ;92BC0A;
    dw $2810,$01F8                                                       ;92BC0B;
    db $EE                                                               ;92BC0F;
    dw $2811,$01F0                                                       ;92BC10;
    db $EE                                                               ;92BC14;
    dw $2812                                                             ;92BC15;

SamusSpritemaps_BC17:
    dw $000B,$000A                                                       ;92BC17;
    db $08                                                               ;92BC1B;
    dw $2800,$0002                                                       ;92BC1C;
    db $08                                                               ;92BC20;
    dw $2801,$01F8                                                       ;92BC21;
    db $08                                                               ;92BC25;
    dw $2802,$01F0                                                       ;92BC26;
    db $08                                                               ;92BC2A;
    dw $2803,$000A                                                       ;92BC2B;
    db $00                                                               ;92BC2F;
    dw $2804,$01EE                                                       ;92BC30;
    db $00                                                               ;92BC34;
    dw $2805,$000A                                                       ;92BC35;
    db $F6                                                               ;92BC39;
    dw $2806,$01EE                                                       ;92BC3A;
    db $F8                                                               ;92BC3E;
    dw $2807,$000A                                                       ;92BC3F;
    db $EE                                                               ;92BC43;
    dw $2810,$01F8                                                       ;92BC44;
    db $EE                                                               ;92BC48;
    dw $2811,$01F0                                                       ;92BC49;
    db $EE                                                               ;92BC4D;
    dw $2812                                                             ;92BC4E;

SamusSpritemaps_BC50:
    dw $0008,$0008                                                       ;92BC50;
    db $08                                                               ;92BC54;
    dw $2800,$0000                                                       ;92BC55;
    db $08                                                               ;92BC59;
    dw $2801,$01F8                                                       ;92BC5A;
    db $08                                                               ;92BC5E;
    dw $2802,$01F0                                                       ;92BC5F;
    db $08                                                               ;92BC63;
    dw $2803,$0008                                                       ;92BC64;
    db $00                                                               ;92BC68;
    dw $2804,$0008                                                       ;92BC69;
    db $F0                                                               ;92BC6D;
    dw $2805,$0000                                                       ;92BC6E;
    db $F0                                                               ;92BC72;
    dw $2806,$01F0                                                       ;92BC73;
    db $F0                                                               ;92BC77;
    dw $2807                                                             ;92BC78;

SamusSpritemaps_BC7A:
    dw $0001,$01F8                                                       ;92BC7A;
    db $F8                                                               ;92BC7E;
    dw $1000                                                             ;92BC7F;

SamusSpritemaps_BC81:
    dw $0001,$01F8                                                       ;92BC81;
    db $F8                                                               ;92BC85;
    dw $3800                                                             ;92BC86;

SamusSpritemaps_BC88:
    dw $0002,$0007                                                       ;92BC88;
    db $FC                                                               ;92BC8C;
    dw $2802,$C3F7                                                       ;92BC8D;
    db $F9                                                               ;92BC91;
    dw $2800                                                             ;92BC92;

SamusSpritemaps_BC94:
    dw $0002,$01FD                                                       ;92BC94;
    db $07                                                               ;92BC98;
    dw $2802,$C3F8                                                       ;92BC99;
    db $F7                                                               ;92BC9D;
    dw $2800                                                             ;92BC9E;

SamusSpritemaps_BCA0:
    dw $0003,$0000                                                       ;92BCA0;
    db $05                                                               ;92BCA4;
    dw $2802,$01F8                                                       ;92BCA5;
    db $05                                                               ;92BCA9;
    dw $2803,$C3F8                                                       ;92BCAA;
    db $F5                                                               ;92BCAE;
    dw $2800                                                             ;92BCAF;

SamusSpritemaps_BCB1:
    dw $0005,$0000                                                       ;92BCB1;
    db $0A                                                               ;92BCB5;
    dw $2802,$01F8                                                       ;92BCB6;
    db $0A                                                               ;92BCBA;
    dw $2803,$0000                                                       ;92BCBB;
    db $02                                                               ;92BCBF;
    dw $2804,$01F8                                                       ;92BCC0;
    db $02                                                               ;92BCC4;
    dw $2805,$C3F8                                                       ;92BCC5;
    db $F2                                                               ;92BCC9;
    dw $2800                                                             ;92BCCA;

SamusSpritemaps_BCCC:
    dw $0003,$01F8                                                       ;92BCCC;
    db $05                                                               ;92BCD0;
    dw $6802,$0000                                                       ;92BCD1;
    db $05                                                               ;92BCD5;
    dw $6803,$C3F8                                                       ;92BCD6;
    db $F5                                                               ;92BCDA;
    dw $6800                                                             ;92BCDB;

SamusSpritemaps_BCDD:
    dw $0005,$01F8                                                       ;92BCDD;
    db $0A                                                               ;92BCE1;
    dw $6802,$0000                                                       ;92BCE2;
    db $0A                                                               ;92BCE6;
    dw $6803,$01F8                                                       ;92BCE7;
    db $02                                                               ;92BCEB;
    dw $6804,$0000                                                       ;92BCEC;
    db $02                                                               ;92BCF0;
    dw $6805,$C3F8                                                       ;92BCF1;
    db $F2                                                               ;92BCF5;
    dw $6800                                                             ;92BCF6;

SamusSpritemaps_BCF8:
    dw $0002,$01F8                                                       ;92BCF8;
    db $F8                                                               ;92BCFC;
    dw $6802,$C3F8                                                       ;92BCFD;
    db $F8                                                               ;92BD01;
    dw $6800                                                             ;92BD02;

SamusSpritemaps_BD04:
    dw $0002,$01F8                                                       ;92BD04;
    db $F8                                                               ;92BD08;
    dw $6802,$C3F8                                                       ;92BD09;
    db $F8                                                               ;92BD0D;
    dw $2800                                                             ;92BD0E;

SamusSpritemaps_BD10:
    dw $0002,$01F8                                                       ;92BD10;
    db $F8                                                               ;92BD14;
    dw $6802,$C3F8                                                       ;92BD15;
    db $F8                                                               ;92BD19;
    dw $A800                                                             ;92BD1A;

SamusSpritemaps_BD1C:
    dw $0002,$01F8                                                       ;92BD1C;
    db $F8                                                               ;92BD20;
    dw $6802,$C3F8                                                       ;92BD21;
    db $F8                                                               ;92BD25;
    dw $E800                                                             ;92BD26;

SamusSpritemaps_BD28:
    dw $0005,$01F8                                                       ;92BD28;
    db $F8                                                               ;92BD2C;
    dw $6800,$01F8                                                       ;92BD2D;
    db $FF                                                               ;92BD31;
    dw $6801,$0000                                                       ;92BD32;
    db $FF                                                               ;92BD36;
    dw $6802,$01F8                                                       ;92BD37;
    db $F7                                                               ;92BD3B;
    dw $6803,$0000                                                       ;92BD3C;
    db $F7                                                               ;92BD40;
    dw $6804                                                             ;92BD41;

SamusSpritemaps_BD43:
    dw $0002,$01F8                                                       ;92BD43;
    db $F8                                                               ;92BD47;
    dw $6802,$C3F8                                                       ;92BD48;
    db $F9                                                               ;92BD4C;
    dw $6800                                                             ;92BD4D;

SamusSpritemaps_BD4F:
    dw $0002,$01F8                                                       ;92BD4F;
    db $F8                                                               ;92BD53;
    dw $6802,$C3F8                                                       ;92BD54;
    db $F7                                                               ;92BD58;
    dw $E800                                                             ;92BD59;

SamusSpritemaps_BD5B:
    dw $0002,$01F8                                                       ;92BD5B;
    db $F8                                                               ;92BD5F;
    dw $6802,$C3F8                                                       ;92BD60;
    db $F9                                                               ;92BD64;
    dw $2800                                                             ;92BD65;

SamusSpritemaps_BD67:
    dw $0002,$C3F8                                                       ;92BD67;
    db $00                                                               ;92BD6B;
    dw $6800,$C3F8                                                       ;92BD6C;
    db $F0                                                               ;92BD70;
    dw $6802                                                             ;92BD71;

SamusSpritemaps_BD73:
    dw $0004,$C3F0                                                       ;92BD73;
    db $F1                                                               ;92BD77;
    dw $6800,$C200                                                       ;92BD78;
    db $01                                                               ;92BD7C;
    dw $6802,$C3F0                                                       ;92BD7D;
    db $01                                                               ;92BD81;
    dw $6804,$C200                                                       ;92BD82;
    db $F1                                                               ;92BD86;
    dw $6806                                                             ;92BD87;

SamusSpritemaps_BD89:
    dw $0002,$C3F0                                                       ;92BD89;
    db $F8                                                               ;92BD8D;
    dw $6800,$C200                                                       ;92BD8E;
    db $F8                                                               ;92BD92;
    dw $6802                                                             ;92BD93;

SamusSpritemaps_BD95:
    dw $0004,$C3EF                                                       ;92BD95;
    db $01                                                               ;92BD99;
    dw $A800,$C3FF                                                       ;92BD9A;
    db $F1                                                               ;92BD9E;
    dw $A802,$C3FF                                                       ;92BD9F;
    db $01                                                               ;92BDA3;
    dw $A804,$C3EF                                                       ;92BDA4;
    db $F1                                                               ;92BDA8;
    dw $A806                                                             ;92BDA9;

SamusSpritemaps_BDAB:
    dw $0002,$C3F8                                                       ;92BDAB;
    db $F0                                                               ;92BDAF;
    dw $A800,$C3F8                                                       ;92BDB0;
    db $00                                                               ;92BDB4;
    dw $A802                                                             ;92BDB5;

SamusSpritemaps_BDB7:
    dw $0004,$C3FF                                                       ;92BDB7;
    db $FF                                                               ;92BDBB;
    dw $A800,$C3EF                                                       ;92BDBC;
    db $EF                                                               ;92BDC0;
    dw $A802,$C3EF                                                       ;92BDC1;
    db $FF                                                               ;92BDC5;
    dw $A804,$C3FF                                                       ;92BDC6;
    db $EF                                                               ;92BDCA;
    dw $A806                                                             ;92BDCB;

SamusSpritemaps_BDCD:
    dw $0002,$C200                                                       ;92BDCD;
    db $F8                                                               ;92BDD1;
    dw $A800,$C3F0                                                       ;92BDD2;
    db $F8                                                               ;92BDD6;
    dw $A802                                                             ;92BDD7;

SamusSpritemaps_BDD9:
    dw $0004,$C201                                                       ;92BDD9;
    db $EE                                                               ;92BDDD;
    dw $6800,$C3F1                                                       ;92BDDE;
    db $FE                                                               ;92BDE2;
    dw $6802,$C201                                                       ;92BDE3;
    db $FE                                                               ;92BDE7;
    dw $6804,$C3F1                                                       ;92BDE8;
    db $EE                                                               ;92BDEC;
    dw $6806                                                             ;92BDED;

SamusSpritemaps_BDEF:
    dw $000A,$0000                                                       ;92BDEF;
    db $0A                                                               ;92BDF3;
    dw $6800,$0008                                                       ;92BDF4;
    db $0A                                                               ;92BDF8;
    dw $6801,$01EE                                                       ;92BDF9;
    db $00                                                               ;92BDFD;
    dw $6802,$000A                                                       ;92BDFE;
    db $00                                                               ;92BE02;
    dw $6803,$01EE                                                       ;92BE03;
    db $F6                                                               ;92BE07;
    dw $6804,$000A                                                       ;92BE08;
    db $F8                                                               ;92BE0C;
    dw $6805,$01EE                                                       ;92BE0D;
    db $EE                                                               ;92BE11;
    dw $6806,$01F8                                                       ;92BE12;
    db $EE                                                               ;92BE16;
    dw $6807,$0000                                                       ;92BE17;
    db $EE                                                               ;92BE1B;
    dw $6810,$000A                                                       ;92BE1C;
    db $F0                                                               ;92BE20;
    dw $6811                                                             ;92BE21;

SamusSpritemaps_BE23:
    dw $000B,$01F8                                                       ;92BE23;
    db $08                                                               ;92BE27;
    dw $6800,$0000                                                       ;92BE28;
    db $08                                                               ;92BE2C;
    dw $6801,$0008                                                       ;92BE2D;
    db $08                                                               ;92BE31;
    dw $6802,$01F0                                                       ;92BE32;
    db $00                                                               ;92BE36;
    dw $6803,$0008                                                       ;92BE37;
    db $00                                                               ;92BE3B;
    dw $6804,$01F0                                                       ;92BE3C;
    db $F8                                                               ;92BE40;
    dw $6805,$0008                                                       ;92BE41;
    db $F6                                                               ;92BE45;
    dw $6806,$01F0                                                       ;92BE46;
    db $F0                                                               ;92BE4A;
    dw $6807,$01F8                                                       ;92BE4B;
    db $F0                                                               ;92BE4F;
    dw $6810,$0000                                                       ;92BE50;
    db $EE                                                               ;92BE54;
    dw $6811,$0008                                                       ;92BE55;
    db $EE                                                               ;92BE59;
    dw $6812                                                             ;92BE5A;

SamusSpritemaps_BE5C:
    dw $000B,$01EE                                                       ;92BE5C;
    db $08                                                               ;92BE60;
    dw $6800,$01F6                                                       ;92BE61;
    db $08                                                               ;92BE65;
    dw $6801,$0000                                                       ;92BE66;
    db $08                                                               ;92BE6A;
    dw $6802,$0008                                                       ;92BE6B;
    db $08                                                               ;92BE6F;
    dw $6803,$01EE                                                       ;92BE70;
    db $00                                                               ;92BE74;
    dw $6804,$000A                                                       ;92BE75;
    db $00                                                               ;92BE79;
    dw $6805,$01EE                                                       ;92BE7A;
    db $F6                                                               ;92BE7E;
    dw $6806,$000A                                                       ;92BE7F;
    db $F8                                                               ;92BE83;
    dw $6807,$01EE                                                       ;92BE84;
    db $EE                                                               ;92BE88;
    dw $6810,$0000                                                       ;92BE89;
    db $EE                                                               ;92BE8D;
    dw $6811,$0008                                                       ;92BE8E;
    db $EE                                                               ;92BE92;
    dw $6812                                                             ;92BE93;

SamusSpritemaps_BE95:
    dw $0008,$01F0                                                       ;92BE95;
    db $08                                                               ;92BE99;
    dw $6800,$01F8                                                       ;92BE9A;
    db $08                                                               ;92BE9E;
    dw $6801,$0000                                                       ;92BE9F;
    db $08                                                               ;92BEA3;
    dw $6802,$0008                                                       ;92BEA4;
    db $08                                                               ;92BEA8;
    dw $6803,$01F0                                                       ;92BEA9;
    db $00                                                               ;92BEAD;
    dw $6804,$01F0                                                       ;92BEAE;
    db $F0                                                               ;92BEB2;
    dw $6805,$01F8                                                       ;92BEB3;
    db $F0                                                               ;92BEB7;
    dw $6806,$0008                                                       ;92BEB8;
    db $F0                                                               ;92BEBC;
    dw $6807                                                             ;92BEBD;

SamusSpritemaps_BEBF:
    dw $0001,$01F8                                                       ;92BEBF;
    db $F8                                                               ;92BEC3;
    dw $3000                                                             ;92BEC4;

SamusSpritemaps_BEC6:
    dw $0002,$C200                                                       ;92BEC6;
    db $00                                                               ;92BECA;
    dw $E808,$C3F0                                                       ;92BECB;
    db $F0                                                               ;92BECF;
    dw $2808                                                             ;92BED0;

SamusSpritemaps_BED2:
    dw $0004,$C3F0                                                       ;92BED2;
    db $F0                                                               ;92BED6;
    dw $2808,$C200                                                       ;92BED7;
    db $F0                                                               ;92BEDB;
    dw $680A,$C200                                                       ;92BEDC;
    db $00                                                               ;92BEE0;
    dw $E808,$C3F0                                                       ;92BEE1;
    db $00                                                               ;92BEE5;
    dw $A80A                                                             ;92BEE6;

SamusSpritemaps_BEE8:
    dw $0002,$C3F0                                                       ;92BEE8;
    db $00                                                               ;92BEEC;
    dw $E808,$C200                                                       ;92BEED;
    db $F0                                                               ;92BEF1;
    dw $2808                                                             ;92BEF2;

SamusSpritemaps_BEF4:
    dw $0004,$C200                                                       ;92BEF4;
    db $00                                                               ;92BEF8;
    dw $6808,$C3F0                                                       ;92BEF9;
    db $F0                                                               ;92BEFD;
    dw $A808,$C3F0                                                       ;92BEFE;
    db $00                                                               ;92BF02;
    dw $A80A,$C200                                                       ;92BF03;
    db $F0                                                               ;92BF07;
    dw $680A                                                             ;92BF08;

SamusSpritemaps_BF0A:
    dw $0002,$C200                                                       ;92BF0A;
    db $00                                                               ;92BF0E;
    dw $E808,$C3F0                                                       ;92BF0F;
    db $F0                                                               ;92BF13;
    dw $2808                                                             ;92BF14;

SamusSpritemaps_BF16:
    dw $0004,$C200                                                       ;92BF16;
    db $F0                                                               ;92BF1A;
    dw $6808,$C3F0                                                       ;92BF1B;
    db $00                                                               ;92BF1F;
    dw $A808,$C3F0                                                       ;92BF20;
    db $F0                                                               ;92BF24;
    dw $280A,$C200                                                       ;92BF25;
    db $00                                                               ;92BF29;
    dw $E80A                                                             ;92BF2A;

SamusSpritemaps_BF2C:
    dw $0002,$C3F0                                                       ;92BF2C;
    db $00                                                               ;92BF30;
    dw $E808,$C200                                                       ;92BF31;
    db $F0                                                               ;92BF35;
    dw $2808                                                             ;92BF36;

SamusSpritemaps_BF38:
    dw $0004,$C3F0                                                       ;92BF38;
    db $00                                                               ;92BF3C;
    dw $A808,$C200                                                       ;92BF3D;
    db $F0                                                               ;92BF41;
    dw $6808,$C200                                                       ;92BF42;
    db $00                                                               ;92BF46;
    dw $680A,$C3F0                                                       ;92BF47;
    db $F0                                                               ;92BF4B;
    dw $A80A                                                             ;92BF4C;

SamusSpritemaps_BF4E:
    dw $0004,$C200                                                       ;92BF4E;
    db $00                                                               ;92BF52;
    dw $E808,$C3F0                                                       ;92BF53;
    db $F0                                                               ;92BF57;
    dw $2808,$C3F0                                                       ;92BF58;
    db $00                                                               ;92BF5C;
    dw $A808,$C200                                                       ;92BF5D;
    db $F0                                                               ;92BF61;
    dw $6808                                                             ;92BF62;

SamusSpritemaps_BF64:
    dw $0004,$C3F0                                                       ;92BF64;
    db $00                                                               ;92BF68;
    dw $A808,$C200                                                       ;92BF69;
    db $F0                                                               ;92BF6D;
    dw $6808,$C200                                                       ;92BF6E;
    db $00                                                               ;92BF72;
    dw $E80A,$C3F0                                                       ;92BF73;
    db $F0                                                               ;92BF77;
    dw $280A                                                             ;92BF78;

SamusSpritemaps_BF7A:
    dw $0004,$C3F0                                                       ;92BF7A;
    db $00                                                               ;92BF7E;
    dw $A808,$C200                                                       ;92BF7F;
    db $F0                                                               ;92BF83;
    dw $6808,$C200                                                       ;92BF84;
    db $00                                                               ;92BF88;
    dw $E808,$C3F0                                                       ;92BF89;
    db $F0                                                               ;92BF8D;
    dw $2808                                                             ;92BF8E;

SamusSpritemaps_BF90:
    dw $0004,$C200                                                       ;92BF90;
    db $00                                                               ;92BF94;
    dw $E808,$C3F0                                                       ;92BF95;
    db $F0                                                               ;92BF99;
    dw $2808,$C200                                                       ;92BF9A;
    db $F0                                                               ;92BF9E;
    dw $680A,$C3F0                                                       ;92BF9F;
    db $00                                                               ;92BFA3;
    dw $A80A                                                             ;92BFA4;

SamusSpritemaps_BFA6:
    dw $0004,$C200                                                       ;92BFA6;
    db $00                                                               ;92BFAA;
    dw $E808,$C3F0                                                       ;92BFAB;
    db $F0                                                               ;92BFAF;
    dw $2808,$C200                                                       ;92BFB0;
    db $F0                                                               ;92BFB4;
    dw $6808,$C3F0                                                       ;92BFB5;
    db $00                                                               ;92BFB9;
    dw $A808                                                             ;92BFBA;

SamusSpritemaps_BFBC:
    dw $0004,$C200                                                       ;92BFBC;
    db $F0                                                               ;92BFC0;
    dw $6808,$C3F0                                                       ;92BFC1;
    db $00                                                               ;92BFC5;
    dw $A808,$C200                                                       ;92BFC6;
    db $00                                                               ;92BFCA;
    dw $E80A,$C3F0                                                       ;92BFCB;
    db $F0                                                               ;92BFCF;
    dw $280A                                                             ;92BFD0;

SamusSpritemaps_BFD2:
    dw $0004,$C3F0                                                       ;92BFD2;
    db $00                                                               ;92BFD6;
    dw $A808,$C200                                                       ;92BFD7;
    db $F0                                                               ;92BFDB;
    dw $6808,$C3F0                                                       ;92BFDC;
    db $F0                                                               ;92BFE0;
    dw $2808,$C200                                                       ;92BFE1;
    db $00                                                               ;92BFE5;
    dw $E808                                                             ;92BFE6;

SamusSpritemaps_BFE8:
    dw $0004,$C200                                                       ;92BFE8;
    db $00                                                               ;92BFEC;
    dw $E808,$C3F0                                                       ;92BFED;
    db $F0                                                               ;92BFF1;
    dw $2808,$C200                                                       ;92BFF2;
    db $F0                                                               ;92BFF6;
    dw $680A,$C3F0                                                       ;92BFF7;
    db $00                                                               ;92BFFB;
    dw $A80A                                                             ;92BFFC;

SamusSpritemaps_BFFE:
    dw $0004,$C3F0                                                       ;92BFFE;
    db $F0                                                               ;92C002;
    dw $2808,$C200                                                       ;92C003;
    db $00                                                               ;92C007;
    dw $E808,$C3F0                                                       ;92C008;
    db $00                                                               ;92C00C;
    dw $A80A,$C200                                                       ;92C00D;
    db $F0                                                               ;92C011;
    dw $680A                                                             ;92C012;

SamusSpritemaps_C014:
    dw $0002,$C3F0                                                       ;92C014;
    db $00                                                               ;92C018;
    dw $A808,$C200                                                       ;92C019;
    db $F0                                                               ;92C01D;
    dw $6808                                                             ;92C01E;

SamusSpritemaps_C020:
    dw $0004,$C200                                                       ;92C020;
    db $F0                                                               ;92C024;
    dw $6808,$C3F0                                                       ;92C025;
    db $F0                                                               ;92C029;
    dw $280A,$C3F0                                                       ;92C02A;
    db $00                                                               ;92C02E;
    dw $A808,$C200                                                       ;92C02F;
    db $00                                                               ;92C033;
    dw $E80A                                                             ;92C034;

SamusSpritemaps_C036:
    dw $0002,$C200                                                       ;92C036;
    db $00                                                               ;92C03A;
    dw $A808,$C3F0                                                       ;92C03B;
    db $F0                                                               ;92C03F;
    dw $6808                                                             ;92C040;

SamusSpritemaps_C042:
    dw $0004,$C3F0                                                       ;92C042;
    db $00                                                               ;92C046;
    dw $2808,$C200                                                       ;92C047;
    db $F0                                                               ;92C04B;
    dw $E808,$C200                                                       ;92C04C;
    db $00                                                               ;92C050;
    dw $E80A,$C3F0                                                       ;92C051;
    db $F0                                                               ;92C055;
    dw $280A                                                             ;92C056;

SamusSpritemaps_C058:
    dw $0002,$C3F0                                                       ;92C058;
    db $00                                                               ;92C05C;
    dw $A808,$C200                                                       ;92C05D;
    db $F0                                                               ;92C061;
    dw $6808                                                             ;92C062;

SamusSpritemaps_C064:
    dw $0004,$C3F0                                                       ;92C064;
    db $F0                                                               ;92C068;
    dw $2808,$C200                                                       ;92C069;
    db $00                                                               ;92C06D;
    dw $E808,$C200                                                       ;92C06E;
    db $F0                                                               ;92C072;
    dw $680A,$C3F0                                                       ;92C073;
    db $00                                                               ;92C077;
    dw $A80A                                                             ;92C078;

SamusSpritemaps_C07A:
    dw $0002,$C200                                                       ;92C07A;
    db $00                                                               ;92C07E;
    dw $A808,$C3F0                                                       ;92C07F;
    db $F0                                                               ;92C083;
    dw $6808                                                             ;92C084;

SamusSpritemaps_C086:
    dw $0004,$C200                                                       ;92C086;
    db $00                                                               ;92C08A;
    dw $E808,$C3F0                                                       ;92C08B;
    db $F0                                                               ;92C08F;
    dw $2808,$C3F0                                                       ;92C090;
    db $00                                                               ;92C094;
    dw $280A,$C200                                                       ;92C095;
    db $F0                                                               ;92C099;
    dw $E80A                                                             ;92C09A;

SamusSpritemaps_C09C:
    dw $0004,$C3F0                                                       ;92C09C;
    db $00                                                               ;92C0A0;
    dw $A808,$C200                                                       ;92C0A1;
    db $F0                                                               ;92C0A5;
    dw $6808,$C200                                                       ;92C0A6;
    db $00                                                               ;92C0AA;
    dw $E808,$C3F0                                                       ;92C0AB;
    db $F0                                                               ;92C0AF;
    dw $2808                                                             ;92C0B0;

SamusSpritemaps_C0B2:
    dw $0004,$C200                                                       ;92C0B2;
    db $00                                                               ;92C0B6;
    dw $E808,$C3F0                                                       ;92C0B7;
    db $F0                                                               ;92C0BB;
    dw $2808,$C3F0                                                       ;92C0BC;
    db $00                                                               ;92C0C0;
    dw $A80A,$C200                                                       ;92C0C1;
    db $F0                                                               ;92C0C5;
    dw $680A                                                             ;92C0C6;

SamusSpritemaps_C0C8:
    dw $0004,$C200                                                       ;92C0C8;
    db $00                                                               ;92C0CC;
    dw $E808,$C3F0                                                       ;92C0CD;
    db $F0                                                               ;92C0D1;
    dw $2808,$C3F0                                                       ;92C0D2;
    db $00                                                               ;92C0D6;
    dw $A808,$C200                                                       ;92C0D7;
    db $F0                                                               ;92C0DB;
    dw $6808                                                             ;92C0DC;

SamusSpritemaps_C0DE:
    dw $0004,$C3F0                                                       ;92C0DE;
    db $00                                                               ;92C0E2;
    dw $A808,$C200                                                       ;92C0E3;
    db $F0                                                               ;92C0E7;
    dw $6808,$C3F0                                                       ;92C0E8;
    db $F0                                                               ;92C0EC;
    dw $280A,$C200                                                       ;92C0ED;
    db $00                                                               ;92C0F1;
    dw $E80A                                                             ;92C0F2;

SamusSpritemaps_C0F4:
    dw $0004,$C3F0                                                       ;92C0F4;
    db $00                                                               ;92C0F8;
    dw $A808,$C200                                                       ;92C0F9;
    db $F0                                                               ;92C0FD;
    dw $6808,$C3F0                                                       ;92C0FE;
    db $F0                                                               ;92C102;
    dw $2808,$C200                                                       ;92C103;
    db $00                                                               ;92C107;
    dw $E808                                                             ;92C108;

SamusSpritemaps_C10A:
    dw $0004,$C3F0                                                       ;92C10A;
    db $F0                                                               ;92C10E;
    dw $2808,$C200                                                       ;92C10F;
    db $00                                                               ;92C113;
    dw $E808,$C3F0                                                       ;92C114;
    db $00                                                               ;92C118;
    dw $A80A,$C200                                                       ;92C119;
    db $F0                                                               ;92C11D;
    dw $680A                                                             ;92C11E;

SamusSpritemaps_C120:
    dw $0004,$C200                                                       ;92C120;
    db $00                                                               ;92C124;
    dw $E808,$C3F0                                                       ;92C125;
    db $F0                                                               ;92C129;
    dw $2808,$C200                                                       ;92C12A;
    db $F0                                                               ;92C12E;
    dw $6808,$C3F0                                                       ;92C12F;
    db $00                                                               ;92C133;
    dw $A808                                                             ;92C134;

SamusSpritemaps_C136:
    dw $0004,$C3F0                                                       ;92C136;
    db $00                                                               ;92C13A;
    dw $A808,$C200                                                       ;92C13B;
    db $F0                                                               ;92C13F;
    dw $6808,$C3F0                                                       ;92C140;
    db $F0                                                               ;92C144;
    dw $280A,$C200                                                       ;92C145;
    db $00                                                               ;92C149;
    dw $E80A                                                             ;92C14A;

SamusSpritemaps_C14C:
    dw $0004,$C3F0                                                       ;92C14C;
    db $F0                                                               ;92C150;
    dw $2808,$C200                                                       ;92C151;
    db $00                                                               ;92C155;
    dw $E808,$C3F0                                                       ;92C156;
    db $00                                                               ;92C15A;
    dw $A80A,$C200                                                       ;92C15B;
    db $F0                                                               ;92C15F;
    dw $680A                                                             ;92C160;

SamusSpritemaps_C162:
    dw $0005,$0000                                                       ;92C162;
    db $F8                                                               ;92C166;
    dw $2806,$01F8                                                       ;92C167;
    db $F8                                                               ;92C16B;
    dw $2807,$C3F8                                                       ;92C16C;
    db $08                                                               ;92C170;
    dw $6800,$C3F8                                                       ;92C171;
    db $F8                                                               ;92C175;
    dw $6802,$C3F8                                                       ;92C176;
    db $E8                                                               ;92C17A;
    dw $2804                                                             ;92C17B;

SamusSpritemaps_C17D:
    dw $0005,$0000                                                       ;92C17D;
    db $F8                                                               ;92C181;
    dw $2806,$01F8                                                       ;92C182;
    db $F8                                                               ;92C186;
    dw $2807,$C3F8                                                       ;92C187;
    db $08                                                               ;92C18B;
    dw $2800,$C3F8                                                       ;92C18C;
    db $F8                                                               ;92C190;
    dw $2802,$C3F8                                                       ;92C191;
    db $E8                                                               ;92C195;
    dw $2804                                                             ;92C196;

SamusSpritemaps_C198:
    dw $0007,$C3F8                                                       ;92C198;
    db $EC                                                               ;92C19C;
    dw $2C00,$0000                                                       ;92C19D;
    db $0C                                                               ;92C1A1;
    dw $2C02,$01F8                                                       ;92C1A2;
    db $0C                                                               ;92C1A6;
    dw $2C03,$0000                                                       ;92C1A7;
    db $04                                                               ;92C1AB;
    dw $2C04,$01F8                                                       ;92C1AC;
    db $04                                                               ;92C1B0;
    dw $2C05,$0000                                                       ;92C1B1;
    db $FC                                                               ;92C1B5;
    dw $2C06,$01F8                                                       ;92C1B6;
    db $FC                                                               ;92C1BA;
    dw $2C07                                                             ;92C1BB;

SamusSpritemaps_C1BD:
    dw $0007,$C3F8                                                       ;92C1BD;
    db $EB                                                               ;92C1C1;
    dw $2C00,$0000                                                       ;92C1C2;
    db $0B                                                               ;92C1C6;
    dw $2C02,$01F8                                                       ;92C1C7;
    db $0B                                                               ;92C1CB;
    dw $2C03,$0000                                                       ;92C1CC;
    db $03                                                               ;92C1D0;
    dw $2C04,$01F8                                                       ;92C1D1;
    db $03                                                               ;92C1D5;
    dw $2C05,$0000                                                       ;92C1D6;
    db $FB                                                               ;92C1DA;
    dw $2C06,$01F8                                                       ;92C1DB;
    db $FB                                                               ;92C1DF;
    dw $2C07                                                             ;92C1E0;

SamusSpritemaps_C1E2:
    dw $0007,$C3F8                                                       ;92C1E2;
    db $EA                                                               ;92C1E6;
    dw $2C00,$0000                                                       ;92C1E7;
    db $0A                                                               ;92C1EB;
    dw $2C02,$01F8                                                       ;92C1EC;
    db $0A                                                               ;92C1F0;
    dw $2C03,$0000                                                       ;92C1F1;
    db $02                                                               ;92C1F5;
    dw $2C04,$01F8                                                       ;92C1F6;
    db $02                                                               ;92C1FA;
    dw $2C05,$0000                                                       ;92C1FB;
    db $FA                                                               ;92C1FF;
    dw $2C06,$01F8                                                       ;92C200;
    db $FA                                                               ;92C204;
    dw $2C07                                                             ;92C205;

SamusSpritemaps_C207:
    dw $0007,$C3F8                                                       ;92C207;
    db $EC                                                               ;92C20B;
    dw $6C00,$01F8                                                       ;92C20C;
    db $0C                                                               ;92C210;
    dw $6C02,$0000                                                       ;92C211;
    db $0C                                                               ;92C215;
    dw $6C03,$01F8                                                       ;92C216;
    db $04                                                               ;92C21A;
    dw $6C04,$0000                                                       ;92C21B;
    db $04                                                               ;92C21F;
    dw $6C05,$01F8                                                       ;92C220;
    db $FC                                                               ;92C224;
    dw $6C06,$0000                                                       ;92C225;
    db $FC                                                               ;92C229;
    dw $6C07                                                             ;92C22A;

SamusSpritemaps_C22C:
    dw $0007,$C3F8                                                       ;92C22C;
    db $EB                                                               ;92C230;
    dw $6C00,$01F8                                                       ;92C231;
    db $0B                                                               ;92C235;
    dw $6C02,$0000                                                       ;92C236;
    db $0B                                                               ;92C23A;
    dw $6C03,$01F8                                                       ;92C23B;
    db $03                                                               ;92C23F;
    dw $6C04,$0000                                                       ;92C240;
    db $03                                                               ;92C244;
    dw $6C05,$01F8                                                       ;92C245;
    db $FB                                                               ;92C249;
    dw $6C06,$0000                                                       ;92C24A;
    db $FB                                                               ;92C24E;
    dw $6C07                                                             ;92C24F;

SamusSpritemaps_C251:
    dw $0007,$C3F8                                                       ;92C251;
    db $EA                                                               ;92C255;
    dw $6C00,$01F8                                                       ;92C256;
    db $0A                                                               ;92C25A;
    dw $6C02,$0000                                                       ;92C25B;
    db $0A                                                               ;92C25F;
    dw $6C03,$01F8                                                       ;92C260;
    db $02                                                               ;92C264;
    dw $6C04,$0000                                                       ;92C265;
    db $02                                                               ;92C269;
    dw $6C05,$01F8                                                       ;92C26A;
    db $FA                                                               ;92C26E;
    dw $6C06,$0000                                                       ;92C26F;
    db $FA                                                               ;92C273;
    dw $6C07                                                             ;92C274;

SamusSpritemaps_C276:
    dw $0004,$C200                                                       ;92C276;
    db $00                                                               ;92C27A;
    dw $FC08,$C3F0                                                       ;92C27B;
    db $00                                                               ;92C27F;
    dw $BC08,$C200                                                       ;92C280;
    db $F0                                                               ;92C284;
    dw $7C08,$C3F0                                                       ;92C285;
    db $F0                                                               ;92C289;
    dw $3C08                                                             ;92C28A;

SamusSpritemaps_C28C:
    dw $0010,$C200                                                       ;92C28C;
    db $00                                                               ;92C290;
    dw $FC08,$C210                                                       ;92C291;
    db $00                                                               ;92C295;
    dw $FC0A,$C200                                                       ;92C296;
    db $10                                                               ;92C29A;
    dw $FC0C,$C210                                                       ;92C29B;
    db $10                                                               ;92C29F;
    dw $FC0E,$C3F0                                                       ;92C2A0;
    db $00                                                               ;92C2A4;
    dw $BC08,$C3E0                                                       ;92C2A5;
    db $00                                                               ;92C2A9;
    dw $BC0A,$C3F0                                                       ;92C2AA;
    db $10                                                               ;92C2AE;
    dw $BC0C,$C3E0                                                       ;92C2AF;
    db $10                                                               ;92C2B3;
    dw $BC0E,$C200                                                       ;92C2B4;
    db $F0                                                               ;92C2B8;
    dw $7C08,$C210                                                       ;92C2B9;
    db $F0                                                               ;92C2BD;
    dw $7C0A,$C200                                                       ;92C2BE;
    db $E0                                                               ;92C2C2;
    dw $7C0C,$C210                                                       ;92C2C3;
    db $E0                                                               ;92C2C7;
    dw $7C0E,$C3E0                                                       ;92C2C8;
    db $E0                                                               ;92C2CC;
    dw $3C0E,$C3E0                                                       ;92C2CD;
    db $F0                                                               ;92C2D1;
    dw $3C0A,$C3F0                                                       ;92C2D2;
    db $E0                                                               ;92C2D6;
    dw $3C0C,$C3F0                                                       ;92C2D7;
    db $F0                                                               ;92C2DB;
    dw $3C08                                                             ;92C2DC;

SamusSpritemaps_C2DE:
    dw $0010,$C200                                                       ;92C2DE;
    db $00                                                               ;92C2E2;
    dw $FC08,$C210                                                       ;92C2E3;
    db $00                                                               ;92C2E7;
    dw $FC0A,$C200                                                       ;92C2E8;
    db $10                                                               ;92C2EC;
    dw $FC0C,$C210                                                       ;92C2ED;
    db $10                                                               ;92C2F1;
    dw $FC0E,$C3F0                                                       ;92C2F2;
    db $00                                                               ;92C2F6;
    dw $BC08,$C3E0                                                       ;92C2F7;
    db $00                                                               ;92C2FB;
    dw $BC0A,$C3F0                                                       ;92C2FC;
    db $10                                                               ;92C300;
    dw $BC0C,$C3E0                                                       ;92C301;
    db $10                                                               ;92C305;
    dw $BC0E,$C200                                                       ;92C306;
    db $F0                                                               ;92C30A;
    dw $7C08,$C210                                                       ;92C30B;
    db $F0                                                               ;92C30F;
    dw $7C0A,$C200                                                       ;92C310;
    db $E0                                                               ;92C314;
    dw $7C0C,$C210                                                       ;92C315;
    db $E0                                                               ;92C319;
    dw $7C0E,$C3F0                                                       ;92C31A;
    db $F0                                                               ;92C31E;
    dw $3C08,$C3E0                                                       ;92C31F;
    db $F0                                                               ;92C323;
    dw $3C0A,$C3F0                                                       ;92C324;
    db $E0                                                               ;92C328;
    dw $3C0C,$C3E0                                                       ;92C329;
    db $E0                                                               ;92C32D;
    dw $3C0E                                                             ;92C32E;

SamusSpritemaps_C330:
    dw $0004,$C200                                                       ;92C330;
    db $F0                                                               ;92C334;
    dw $2808,$C3F0                                                       ;92C335;
    db $00                                                               ;92C339;
    dw $280A,$C3F8                                                       ;92C33A;
    db $00                                                               ;92C33E;
    dw $280C,$C3F8                                                       ;92C33F;
    db $F0                                                               ;92C343;
    dw $280E                                                             ;92C344;

SamusSpritemaps_C346:
    dw $000A,$C201                                                       ;92C346;
    db $04                                                               ;92C34A;
    dw $2808,$C3F1                                                       ;92C34B;
    db $F4                                                               ;92C34F;
    dw $280A,$01F9                                                       ;92C350;
    db $0C                                                               ;92C354;
    dw $280C,$01F1                                                       ;92C355;
    db $EC                                                               ;92C359;
    dw $280D,$0001                                                       ;92C35A;
    db $EC                                                               ;92C35E;
    dw $280E,$01F9                                                       ;92C35F;
    db $EC                                                               ;92C363;
    dw $280F,$0009                                                       ;92C364;
    db $FC                                                               ;92C368;
    dw $281C,$0001                                                       ;92C369;
    db $FC                                                               ;92C36D;
    dw $281D,$0001                                                       ;92C36E;
    db $F4                                                               ;92C372;
    dw $281E,$01F9                                                       ;92C373;
    db $04                                                               ;92C377;
    dw $281F                                                             ;92C378;

SamusSpritemaps_C37A:
    dw $0004,$C200                                                       ;92C37A;
    db $00                                                               ;92C37E;
    dw $2808,$C3F0                                                       ;92C37F;
    db $F0                                                               ;92C383;
    dw $280A,$C3F0                                                       ;92C384;
    db $F8                                                               ;92C388;
    dw $280C,$C200                                                       ;92C389;
    db $F8                                                               ;92C38D;
    dw $280E                                                             ;92C38E;

SamusSpritemaps_C390:
    dw $000A,$01FC                                                       ;92C390;
    db $F0                                                               ;92C394;
    dw $E80C,$01F4                                                       ;92C395;
    db $F8                                                               ;92C399;
    dw $E80D,$01FC                                                       ;92C39A;
    db $F8                                                               ;92C39E;
    dw $E80E,$0004                                                       ;92C39F;
    db $00                                                               ;92C3A3;
    dw $E80F,$000C                                                       ;92C3A4;
    db $00                                                               ;92C3A8;
    dw $E81C,$01EC                                                       ;92C3A9;
    db $F8                                                               ;92C3AD;
    dw $E81D,$01EC                                                       ;92C3AE;
    db $00                                                               ;92C3B2;
    dw $E81E,$01EC                                                       ;92C3B3;
    db $08                                                               ;92C3B7;
    dw $E81F,$C3F4                                                       ;92C3B8;
    db $00                                                               ;92C3BC;
    dw $E808,$C204                                                       ;92C3BD;
    db $F0                                                               ;92C3C1;
    dw $E80A                                                             ;92C3C2;

SamusSpritemaps_C3C4:
    dw $0004,$C3F0                                                       ;92C3C4;
    db $00                                                               ;92C3C8;
    dw $E808,$C200                                                       ;92C3C9;
    db $F0                                                               ;92C3CD;
    dw $E80A,$C3F8                                                       ;92C3CE;
    db $F0                                                               ;92C3D2;
    dw $E80C,$C3F8                                                       ;92C3D3;
    db $00                                                               ;92C3D7;
    dw $E80E                                                             ;92C3D8;

SamusSpritemaps_C3DA:
    dw $000A,$01F0                                                       ;92C3DA;
    db $FC                                                               ;92C3DE;
    dw $E80C,$01F8                                                       ;92C3DF;
    db $FC                                                               ;92C3E3;
    dw $E80D,$01F8                                                       ;92C3E4;
    db $04                                                               ;92C3E8;
    dw $E80E,$0008                                                       ;92C3E9;
    db $0C                                                               ;92C3ED;
    dw $E80F,$0000                                                       ;92C3EE;
    db $EC                                                               ;92C3F2;
    dw $E81C,$0000                                                       ;92C3F3;
    db $F4                                                               ;92C3F7;
    dw $E81D,$01F8                                                       ;92C3F8;
    db $0C                                                               ;92C3FC;
    dw $E81E,$0000                                                       ;92C3FD;
    db $0C                                                               ;92C401;
    dw $E81F,$C3F0                                                       ;92C402;
    db $EC                                                               ;92C406;
    dw $E808,$C200                                                       ;92C407;
    db $FC                                                               ;92C40B;
    dw $E80A                                                             ;92C40C;

SamusSpritemaps_C40E:
    dw $0004,$C3F0                                                       ;92C40E;
    db $F0                                                               ;92C412;
    dw $E808,$C200                                                       ;92C413;
    db $00                                                               ;92C417;
    dw $E80A,$C200                                                       ;92C418;
    db $F8                                                               ;92C41C;
    dw $E80C,$C3F0                                                       ;92C41D;
    db $F8                                                               ;92C421;
    dw $E80E                                                             ;92C422;

SamusSpritemaps_C424:
    dw $000A,$01FC                                                       ;92C424;
    db $00                                                               ;92C428;
    dw $280C,$01FC                                                       ;92C429;
    db $08                                                               ;92C42D;
    dw $280D,$0004                                                       ;92C42E;
    db $00                                                               ;92C432;
    dw $280E,$01F4                                                       ;92C433;
    db $F8                                                               ;92C437;
    dw $280F,$01EC                                                       ;92C438;
    db $F8                                                               ;92C43C;
    dw $281C,$000C                                                       ;92C43D;
    db $00                                                               ;92C441;
    dw $281D,$000C                                                       ;92C442;
    db $F8                                                               ;92C446;
    dw $281E,$000C                                                       ;92C447;
    db $F0                                                               ;92C44B;
    dw $281F,$C3FC                                                       ;92C44C;
    db $F0                                                               ;92C450;
    dw $2808,$C3EC                                                       ;92C451;
    db $00                                                               ;92C455;
    dw $280A                                                             ;92C456;

SamusSpritemaps_C458:
    dw $0004,$C3F0                                                       ;92C458;
    db $F0                                                               ;92C45C;
    dw $6808,$C200                                                       ;92C45D;
    db $00                                                               ;92C461;
    dw $680A,$C3F8                                                       ;92C462;
    db $00                                                               ;92C466;
    dw $680C,$C3F8                                                       ;92C467;
    db $F0                                                               ;92C46B;
    dw $680E                                                             ;92C46C;

SamusSpritemaps_C46E:
    dw $000A,$C3EF                                                       ;92C46E;
    db $04                                                               ;92C472;
    dw $6808,$C3FF                                                       ;92C473;
    db $F4                                                               ;92C477;
    dw $680A,$01FF                                                       ;92C478;
    db $0C                                                               ;92C47C;
    dw $680C,$0007                                                       ;92C47D;
    db $EC                                                               ;92C481;
    dw $680D,$01F7                                                       ;92C482;
    db $EC                                                               ;92C486;
    dw $680E,$01FF                                                       ;92C487;
    db $EC                                                               ;92C48B;
    dw $680F,$01EF                                                       ;92C48C;
    db $FC                                                               ;92C490;
    dw $681C,$01F7                                                       ;92C491;
    db $FC                                                               ;92C495;
    dw $681D,$01F7                                                       ;92C496;
    db $F4                                                               ;92C49A;
    dw $681E,$01FF                                                       ;92C49B;
    db $04                                                               ;92C49F;
    dw $681F                                                             ;92C4A0;

SamusSpritemaps_C4A2:
    dw $0004,$C3F0                                                       ;92C4A2;
    db $00                                                               ;92C4A6;
    dw $6808,$C200                                                       ;92C4A7;
    db $F0                                                               ;92C4AB;
    dw $680A,$C200                                                       ;92C4AC;
    db $F8                                                               ;92C4B0;
    dw $680C,$C3F0                                                       ;92C4B1;
    db $F8                                                               ;92C4B5;
    dw $680E                                                             ;92C4B6;

SamusSpritemaps_C4B8:
    dw $000A,$01FC                                                       ;92C4B8;
    db $F0                                                               ;92C4BC;
    dw $A80C,$0004                                                       ;92C4BD;
    db $F8                                                               ;92C4C1;
    dw $A80D,$01FC                                                       ;92C4C2;
    db $F8                                                               ;92C4C6;
    dw $A80E,$01F4                                                       ;92C4C7;
    db $00                                                               ;92C4CB;
    dw $A80F,$01EC                                                       ;92C4CC;
    db $00                                                               ;92C4D0;
    dw $A81C,$000C                                                       ;92C4D1;
    db $F8                                                               ;92C4D5;
    dw $A81D,$000C                                                       ;92C4D6;
    db $00                                                               ;92C4DA;
    dw $A81E,$000C                                                       ;92C4DB;
    db $08                                                               ;92C4DF;
    dw $A81F,$C3FC                                                       ;92C4E0;
    db $00                                                               ;92C4E4;
    dw $A808,$C3EC                                                       ;92C4E5;
    db $F0                                                               ;92C4E9;
    dw $A80A                                                             ;92C4EA;

SamusSpritemaps_C4EC:
    dw $0004,$C200                                                       ;92C4EC;
    db $00                                                               ;92C4F0;
    dw $A808,$C3F0                                                       ;92C4F1;
    db $F0                                                               ;92C4F5;
    dw $A80A,$C3F8                                                       ;92C4F6;
    db $F0                                                               ;92C4FA;
    dw $A80C,$C3F8                                                       ;92C4FB;
    db $00                                                               ;92C4FF;
    dw $A80E                                                             ;92C500;

SamusSpritemaps_C502:
    dw $000A,$0008                                                       ;92C502;
    db $FC                                                               ;92C506;
    dw $A80C,$0000                                                       ;92C507;
    db $FC                                                               ;92C50B;
    dw $A80D,$0000                                                       ;92C50C;
    db $04                                                               ;92C510;
    dw $A80E,$01F0                                                       ;92C511;
    db $0C                                                               ;92C515;
    dw $A80F,$01F8                                                       ;92C516;
    db $EC                                                               ;92C51A;
    dw $A81C,$01F8                                                       ;92C51B;
    db $F4                                                               ;92C51F;
    dw $A81D,$0000                                                       ;92C520;
    db $0C                                                               ;92C524;
    dw $A81E,$01F8                                                       ;92C525;
    db $0C                                                               ;92C529;
    dw $A81F,$C200                                                       ;92C52A;
    db $EC                                                               ;92C52E;
    dw $A808,$C3F0                                                       ;92C52F;
    db $FC                                                               ;92C533;
    dw $A80A                                                             ;92C534;

SamusSpritemaps_C536:
    dw $0004,$C200                                                       ;92C536;
    db $F0                                                               ;92C53A;
    dw $A808,$C3F0                                                       ;92C53B;
    db $00                                                               ;92C53F;
    dw $A80A,$C3F0                                                       ;92C540;
    db $F8                                                               ;92C544;
    dw $A80C,$C200                                                       ;92C545;
    db $F8                                                               ;92C549;
    dw $A80E                                                             ;92C54A;

SamusSpritemaps_C54C:
    dw $000A,$01FC                                                       ;92C54C;
    db $00                                                               ;92C550;
    dw $680C,$01FC                                                       ;92C551;
    db $08                                                               ;92C555;
    dw $680D,$01F4                                                       ;92C556;
    db $00                                                               ;92C55A;
    dw $680E,$0004                                                       ;92C55B;
    db $F8                                                               ;92C55F;
    dw $680F,$000C                                                       ;92C560;
    db $F8                                                               ;92C564;
    dw $681C,$01EC                                                       ;92C565;
    db $00                                                               ;92C569;
    dw $681D,$01EC                                                       ;92C56A;
    db $F8                                                               ;92C56E;
    dw $681E,$01EC                                                       ;92C56F;
    db $F0                                                               ;92C573;
    dw $681F,$C3F4                                                       ;92C574;
    db $F0                                                               ;92C578;
    dw $6808,$C204                                                       ;92C579;
    db $00                                                               ;92C57D;
    dw $680A                                                             ;92C57E;

SamusSpritemaps_C580:
    dw $0009,$0000                                                       ;92C580;
    db $10                                                               ;92C584;
    dw $2841,$01F8                                                       ;92C585;
    db $10                                                               ;92C589;
    dw $2840,$0008                                                       ;92C58A;
    db $10                                                               ;92C58E;
    dw $2842,$0008                                                       ;92C58F;
    db $08                                                               ;92C593;
    dw $2832,$0008                                                       ;92C594;
    db $00                                                               ;92C598;
    dw $2822,$0008                                                       ;92C599;
    db $F8                                                               ;92C59D;
    dw $2812,$0008                                                       ;92C59E;
    db $F0                                                               ;92C5A2;
    dw $2802,$C3F8                                                       ;92C5A3;
    db $00                                                               ;92C5A7;
    dw $2820,$C3F8                                                       ;92C5A8;
    db $F0                                                               ;92C5AC;
    dw $2800                                                             ;92C5AD;

SamusSpritemaps_C5AF:
    dw $0016,$01FD                                                       ;92C5AF;
    db $F0                                                               ;92C5B3;
    dw $281F,$0003                                                       ;92C5B4;
    db $F6                                                               ;92C5B8;
    dw $280F,$01FB                                                       ;92C5B9;
    db $F9                                                               ;92C5BD;
    dw $280F,$01F7                                                       ;92C5BE;
    db $F7                                                               ;92C5C2;
    dw $285F,$0007                                                       ;92C5C3;
    db $0B                                                               ;92C5C7;
    dw $284E,$01FF                                                       ;92C5C8;
    db $0F                                                               ;92C5CC;
    dw $285F,$01F7                                                       ;92C5CD;
    db $F2                                                               ;92C5D1;
    dw $287F,$01F9                                                       ;92C5D2;
    db $EF                                                               ;92C5D6;
    dw $286C,$01F9                                                       ;92C5D7;
    db $EC                                                               ;92C5DB;
    dw $282F,$01FD                                                       ;92C5DC;
    db $E9                                                               ;92C5E0;
    dw $281F,$0006                                                       ;92C5E1;
    db $F2                                                               ;92C5E5;
    dw $2808,$01F9                                                       ;92C5E6;
    db $05                                                               ;92C5EA;
    dw $2858,$0002                                                       ;92C5EB;
    db $FD                                                               ;92C5EF;
    dw $2838,$0001                                                       ;92C5F0;
    db $06                                                               ;92C5F4;
    dw $284B,$01F8                                                       ;92C5F5;
    db $0A                                                               ;92C5F9;
    dw $2E43,$01F8                                                       ;92C5FA;
    db $02                                                               ;92C5FE;
    dw $2E33,$01F8                                                       ;92C5FF;
    db $FA                                                               ;92C603;
    dw $2E23,$01F8                                                       ;92C604;
    db $F2                                                               ;92C608;
    dw $2E13,$01F8                                                       ;92C609;
    db $EA                                                               ;92C60D;
    dw $2E03,$C200                                                       ;92C60E;
    db $0A                                                               ;92C612;
    dw $2E44,$C200                                                       ;92C613;
    db $FA                                                               ;92C617;
    dw $2E24,$C200                                                       ;92C618;
    db $EA                                                               ;92C61C;
    dw $2E04                                                             ;92C61D;

SamusSpritemaps_C61F:
    dw $001A,$0003                                                       ;92C61F;
    db $E7                                                               ;92C623;
    dw $281F,$0001                                                       ;92C624;
    db $11                                                               ;92C628;
    dw $284F,$01FF                                                       ;92C629;
    db $0A                                                               ;92C62D;
    dw $284E,$01F9                                                       ;92C62E;
    db $07                                                               ;92C632;
    dw $2883,$0000                                                       ;92C633;
    db $04                                                               ;92C637;
    dw $2883,$0006                                                       ;92C638;
    db $F0                                                               ;92C63C;
    dw $2883,$000C                                                       ;92C63D;
    db $EB                                                               ;92C641;
    dw $2808,$0007                                                       ;92C642;
    db $07                                                               ;92C646;
    dw $6858,$01F7                                                       ;92C647;
    db $FF                                                               ;92C64B;
    dw $284B,$01F3                                                       ;92C64C;
    db $F6                                                               ;92C650;
    dw $2838,$01F3                                                       ;92C651;
    db $EE                                                               ;92C655;
    dw $287F,$01F6                                                       ;92C656;
    db $E9                                                               ;92C65A;
    dw $286C,$01FB                                                       ;92C65B;
    db $E7                                                               ;92C65F;
    dw $282F,$01F8                                                       ;92C660;
    db $F1                                                               ;92C664;
    dw $283F,$01F5                                                       ;92C665;
    db $07                                                               ;92C669;
    dw $2893,$01F8                                                       ;92C66A;
    db $0E                                                               ;92C66E;
    dw $2873,$0006                                                       ;92C66F;
    db $0F                                                               ;92C673;
    dw $2883,$0009                                                       ;92C674;
    db $01                                                               ;92C678;
    dw $284F,$0008                                                       ;92C679;
    db $F8                                                               ;92C67D;
    dw $285F,$0008                                                       ;92C67E;
    db $10                                                               ;92C682;
    dw $2E68,$0000                                                       ;92C683;
    db $10                                                               ;92C687;
    dw $2E67,$0008                                                       ;92C688;
    db $F0                                                               ;92C68C;
    dw $2E28,$0008                                                       ;92C68D;
    db $E8                                                               ;92C691;
    dw $2E18,$C3F8                                                       ;92C692;
    db $E0                                                               ;92C696;
    dw $2E06,$C3F8                                                       ;92C697;
    db $00                                                               ;92C69B;
    dw $2E46,$C3F8                                                       ;92C69C;
    db $F0                                                               ;92C6A0;
    dw $2E26                                                             ;92C6A1;

SamusSpritemaps_C6A3:
    dw $0018,$000B                                                       ;92C6A3;
    db $DD                                                               ;92C6A7;
    dw $283F,$0001                                                       ;92C6A8;
    db $17                                                               ;92C6AC;
    dw $284F,$01F7                                                       ;92C6AD;
    db $E0                                                               ;92C6B1;
    dw $282F,$01F1                                                       ;92C6B2;
    db $E1                                                               ;92C6B6;
    dw $286C,$000F                                                       ;92C6B7;
    db $E6                                                               ;92C6BB;
    dw $281F,$01EE                                                       ;92C6BC;
    db $FA                                                               ;92C6C0;
    dw $286F,$01ED                                                       ;92C6C1;
    db $F2                                                               ;92C6C5;
    dw $284E,$01EE                                                       ;92C6C6;
    db $07                                                               ;92C6CA;
    dw $2893,$01F1                                                       ;92C6CB;
    db $10                                                               ;92C6CF;
    dw $2873,$000D                                                       ;92C6D0;
    db $10                                                               ;92C6D4;
    dw $2883,$000C                                                       ;92C6D5;
    db $02                                                               ;92C6D9;
    dw $286F,$0010                                                       ;92C6DA;
    db $FB                                                               ;92C6DE;
    dw $284F,$000A                                                       ;92C6DF;
    db $F1                                                               ;92C6E3;
    dw $285F,$01ED                                                       ;92C6E4;
    db $E8                                                               ;92C6E8;
    dw $287F,$01F3                                                       ;92C6E9;
    db $ED                                                               ;92C6ED;
    dw $283F,$0008                                                       ;92C6EE;
    db $FA                                                               ;92C6F2;
    dw $2E3B,$0008                                                       ;92C6F3;
    db $F2                                                               ;92C6F7;
    dw $2E2B,$0008                                                       ;92C6F8;
    db $12                                                               ;92C6FC;
    dw $2E6B,$0000                                                       ;92C6FD;
    db $12                                                               ;92C701;
    dw $2E6A,$0008                                                       ;92C702;
    db $EA                                                               ;92C706;
    dw $2E1B,$0008                                                       ;92C707;
    db $E2                                                               ;92C70B;
    dw $2E0B,$C3F8                                                       ;92C70C;
    db $02                                                               ;92C710;
    dw $2E49,$C3F8                                                       ;92C711;
    db $F2                                                               ;92C715;
    dw $2E29,$C3F8                                                       ;92C716;
    db $E2                                                               ;92C71A;
    dw $2E09                                                             ;92C71B;

SamusSpritemaps_C71D:
    dw $0019,$000C                                                       ;92C71D;
    db $D8                                                               ;92C721;
    dw $283F,$0003                                                       ;92C722;
    db $1E                                                               ;92C726;
    dw $284F,$01F3                                                       ;92C727;
    db $DA                                                               ;92C72B;
    dw $282F,$01E9                                                       ;92C72C;
    db $DE                                                               ;92C730;
    dw $286C,$0011                                                       ;92C731;
    db $15                                                               ;92C735;
    dw $2883,$0014                                                       ;92C736;
    db $04                                                               ;92C73A;
    dw $286F,$0015                                                       ;92C73B;
    db $F2                                                               ;92C73F;
    dw $285F,$0012                                                       ;92C740;
    db $E1                                                               ;92C744;
    dw $281F,$01E5                                                       ;92C745;
    db $FE                                                               ;92C749;
    dw $286F,$01E3                                                       ;92C74A;
    db $EA                                                               ;92C74E;
    dw $287F,$0018                                                       ;92C74F;
    db $FC                                                               ;92C753;
    dw $284F,$01F0                                                       ;92C754;
    db $14                                                               ;92C758;
    dw $2873,$01E8                                                       ;92C759;
    db $0C                                                               ;92C75D;
    dw $2893,$01E8                                                       ;92C75E;
    db $F4                                                               ;92C762;
    dw $284E,$01F0                                                       ;92C763;
    db $EC                                                               ;92C767;
    dw $283F,$0000                                                       ;92C768;
    db $14                                                               ;92C76C;
    dw $2E6D,$0008                                                       ;92C76D;
    db $14                                                               ;92C771;
    dw $2E6E,$0008                                                       ;92C772;
    db $0C                                                               ;92C776;
    dw $2E5E,$0008                                                       ;92C777;
    db $FC                                                               ;92C77B;
    dw $2E3E,$0008                                                       ;92C77C;
    db $F4                                                               ;92C780;
    dw $2E2E,$0008                                                       ;92C781;
    db $EC                                                               ;92C785;
    dw $2E1E,$0008                                                       ;92C786;
    db $E4                                                               ;92C78A;
    dw $2E0E,$C3F8                                                       ;92C78B;
    db $04                                                               ;92C78F;
    dw $2E4C,$C3F8                                                       ;92C790;
    db $F4                                                               ;92C794;
    dw $2E2C,$C3F8                                                       ;92C795;
    db $E4                                                               ;92C799;
    dw $2E0C                                                             ;92C79A;

SamusSpritemaps_C79C:
    dw $0019,$01DD                                                       ;92C79C;
    db $E1                                                               ;92C7A0;
    dw $287F,$01E0                                                       ;92C7A1;
    db $DC                                                               ;92C7A5;
    dw $287F,$0003                                                       ;92C7A6;
    db $25                                                               ;92C7AA;
    dw $2873,$01EA                                                       ;92C7AB;
    db $D3                                                               ;92C7AF;
    dw $282F,$001D                                                       ;92C7B0;
    db $FB                                                               ;92C7B4;
    dw $2873,$01DF                                                       ;92C7B5;
    db $FF                                                               ;92C7B9;
    dw $6883,$0019                                                       ;92C7BA;
    db $08                                                               ;92C7BE;
    dw $286F,$01E2                                                       ;92C7BF;
    db $12                                                               ;92C7C3;
    dw $2893,$01EF                                                       ;92C7C4;
    db $19                                                               ;92C7C8;
    dw $2873,$0013                                                       ;92C7C9;
    db $19                                                               ;92C7CD;
    dw $2883,$0018                                                       ;92C7CE;
    db $F0                                                               ;92C7D2;
    dw $285F,$01D9                                                       ;92C7D3;
    db $ED                                                               ;92C7D7;
    dw $287F,$01E4                                                       ;92C7D8;
    db $F4                                                               ;92C7DC;
    dw $284E,$0018                                                       ;92C7DD;
    db $DC                                                               ;92C7E1;
    dw $281F,$01E8                                                       ;92C7E2;
    db $EC                                                               ;92C7E6;
    dw $683F,$0000                                                       ;92C7E7;
    db $14                                                               ;92C7EB;
    dw $2E74,$0000                                                       ;92C7EC;
    db $0C                                                               ;92C7F0;
    dw $2E64,$01F8                                                       ;92C7F1;
    db $0C                                                               ;92C7F5;
    dw $2E63,$0008                                                       ;92C7F6;
    db $FC                                                               ;92C7FA;
    dw $2E82,$0008                                                       ;92C7FB;
    db $EC                                                               ;92C7FF;
    dw $2E62,$0008                                                       ;92C800;
    db $E4                                                               ;92C804;
    dw $2E52,$0000                                                       ;92C805;
    db $E4                                                               ;92C809;
    dw $2E51,$01F8                                                       ;92C80A;
    db $E4                                                               ;92C80E;
    dw $2E50,$C3F8                                                       ;92C80F;
    db $FC                                                               ;92C813;
    dw $2E80,$C3F8                                                       ;92C814;
    db $EC                                                               ;92C818;
    dw $2E60                                                             ;92C819;

SamusSpritemaps_C81B:
    dw $0008,$000E                                                       ;92C81B;
    db $F4                                                               ;92C81F;
    dw $2E9C,$000E                                                       ;92C820;
    db $EC                                                               ;92C824;
    dw $2E8C,$01FE                                                       ;92C825;
    db $14                                                               ;92C829;
    dw $2E99,$C3F6                                                       ;92C82A;
    db $04                                                               ;92C82E;
    dw $2E78,$01F6                                                       ;92C82F;
    db $FC                                                               ;92C833;
    dw $2E94,$01F6                                                       ;92C834;
    db $F4                                                               ;92C838;
    dw $2E84,$C3FE                                                       ;92C839;
    db $F4                                                               ;92C83D;
    dw $2E85,$C3FE                                                       ;92C83E;
    db $E4                                                               ;92C842;
    dw $2E65                                                             ;92C843;

SamusSpritemaps_C845:
    dw $000B,$01F6                                                       ;92C845;
    db $F4                                                               ;92C849;
    dw $2E98,$0006                                                       ;92C84A;
    db $FC                                                               ;92C84E;
    dw $2E96,$01FE                                                       ;92C84F;
    db $FC                                                               ;92C853;
    dw $2E95,$0006                                                       ;92C854;
    db $E4                                                               ;92C858;
    dw $2E7B,$01FE                                                       ;92C859;
    db $E4                                                               ;92C85D;
    dw $2E7A,$000E                                                       ;92C85E;
    db $F4                                                               ;92C862;
    dw $2E9C,$000E                                                       ;92C863;
    db $EC                                                               ;92C867;
    dw $2E8C,$C3FE                                                       ;92C868;
    db $EC                                                               ;92C86C;
    dw $2E8A,$01FE                                                       ;92C86D;
    db $14                                                               ;92C871;
    dw $2E99,$C3F6                                                       ;92C872;
    db $04                                                               ;92C876;
    dw $2E78,$01F6                                                       ;92C877;
    db $FC                                                               ;92C87B;
    dw $2E94                                                             ;92C87C;

SamusSpritemaps_C87E:
    dw $000B,$01FE                                                       ;92C87E;
    db $FC                                                               ;92C882;
    dw $2E95,$0006                                                       ;92C883;
    db $FC                                                               ;92C887;
    dw $2E96,$01F6                                                       ;92C888;
    db $F4                                                               ;92C88C;
    dw $2E7C,$0006                                                       ;92C88D;
    db $E4                                                               ;92C891;
    dw $2E7E,$01FE                                                       ;92C892;
    db $E4                                                               ;92C896;
    dw $2E7D,$000E                                                       ;92C897;
    db $F4                                                               ;92C89B;
    dw $2E9F,$000E                                                       ;92C89C;
    db $EC                                                               ;92C8A0;
    dw $2E8F,$C3FE                                                       ;92C8A1;
    db $EC                                                               ;92C8A5;
    dw $2E8D,$01FE                                                       ;92C8A6;
    db $14                                                               ;92C8AA;
    dw $2E99,$C3F6                                                       ;92C8AB;
    db $04                                                               ;92C8AF;
    dw $2E78,$01F6                                                       ;92C8B0;
    db $FC                                                               ;92C8B4;
    dw $2E94                                                             ;92C8B5;

SamusSpritemaps_C8B7:
    dw $0009,$01F8                                                       ;92C8B7;
    db $10                                                               ;92C8BB;
    dw $6841,$0000                                                       ;92C8BC;
    db $10                                                               ;92C8C0;
    dw $6840,$01F0                                                       ;92C8C1;
    db $10                                                               ;92C8C5;
    dw $6842,$01F0                                                       ;92C8C6;
    db $08                                                               ;92C8CA;
    dw $6832,$01F0                                                       ;92C8CB;
    db $00                                                               ;92C8CF;
    dw $6822,$01F0                                                       ;92C8D0;
    db $F8                                                               ;92C8D4;
    dw $6812,$01F0                                                       ;92C8D5;
    db $F0                                                               ;92C8D9;
    dw $6802,$C3F8                                                       ;92C8DA;
    db $00                                                               ;92C8DE;
    dw $6820,$C3F8                                                       ;92C8DF;
    db $F0                                                               ;92C8E3;
    dw $6800                                                             ;92C8E4;

SamusSpritemaps_C8E6:
    dw $0016,$01FB                                                       ;92C8E6;
    db $F0                                                               ;92C8EA;
    dw $681F,$01F5                                                       ;92C8EB;
    db $F6                                                               ;92C8EF;
    dw $680F,$01FD                                                       ;92C8F0;
    db $F9                                                               ;92C8F4;
    dw $680F,$0001                                                       ;92C8F5;
    db $F7                                                               ;92C8F9;
    dw $685F,$01F1                                                       ;92C8FA;
    db $0B                                                               ;92C8FE;
    dw $684E,$01F9                                                       ;92C8FF;
    db $0F                                                               ;92C903;
    dw $685F,$0001                                                       ;92C904;
    db $F2                                                               ;92C908;
    dw $687F,$01FF                                                       ;92C909;
    db $EF                                                               ;92C90D;
    dw $686C,$01FF                                                       ;92C90E;
    db $EC                                                               ;92C912;
    dw $682F,$01FB                                                       ;92C913;
    db $E9                                                               ;92C917;
    dw $681F,$01F2                                                       ;92C918;
    db $F2                                                               ;92C91C;
    dw $6808,$01FF                                                       ;92C91D;
    db $05                                                               ;92C921;
    dw $6858,$01F6                                                       ;92C922;
    db $FD                                                               ;92C926;
    dw $6838,$01F7                                                       ;92C927;
    db $06                                                               ;92C92B;
    dw $684B,$0000                                                       ;92C92C;
    db $0A                                                               ;92C930;
    dw $6E43,$0000                                                       ;92C931;
    db $02                                                               ;92C935;
    dw $6E33,$0000                                                       ;92C936;
    db $FA                                                               ;92C93A;
    dw $6E23,$0000                                                       ;92C93B;
    db $F2                                                               ;92C93F;
    dw $6E13,$0000                                                       ;92C940;
    db $EA                                                               ;92C944;
    dw $6E03,$C3F0                                                       ;92C945;
    db $0A                                                               ;92C949;
    dw $6E44,$C3F0                                                       ;92C94A;
    db $FA                                                               ;92C94E;
    dw $6E24,$C3F0                                                       ;92C94F;
    db $EA                                                               ;92C953;
    dw $6E04                                                             ;92C954;

SamusSpritemaps_C956:
    dw $001A,$01F5                                                       ;92C956;
    db $E7                                                               ;92C95A;
    dw $681F,$01F7                                                       ;92C95B;
    db $11                                                               ;92C95F;
    dw $684F,$01F9                                                       ;92C960;
    db $0A                                                               ;92C964;
    dw $684E,$01FF                                                       ;92C965;
    db $07                                                               ;92C969;
    dw $6883,$01F8                                                       ;92C96A;
    db $04                                                               ;92C96E;
    dw $6883,$01F2                                                       ;92C96F;
    db $F0                                                               ;92C973;
    dw $6883,$01EC                                                       ;92C974;
    db $EB                                                               ;92C978;
    dw $6808,$01F1                                                       ;92C979;
    db $07                                                               ;92C97D;
    dw $2858,$0001                                                       ;92C97E;
    db $FF                                                               ;92C982;
    dw $684B,$0005                                                       ;92C983;
    db $F6                                                               ;92C987;
    dw $6838,$0005                                                       ;92C988;
    db $EE                                                               ;92C98C;
    dw $687F,$0002                                                       ;92C98D;
    db $E9                                                               ;92C991;
    dw $686C,$01FD                                                       ;92C992;
    db $E7                                                               ;92C996;
    dw $682F,$0000                                                       ;92C997;
    db $F1                                                               ;92C99B;
    dw $683F,$0003                                                       ;92C99C;
    db $07                                                               ;92C9A0;
    dw $6893,$0000                                                       ;92C9A1;
    db $0E                                                               ;92C9A5;
    dw $6873,$01F2                                                       ;92C9A6;
    db $0F                                                               ;92C9AA;
    dw $6883,$01EF                                                       ;92C9AB;
    db $01                                                               ;92C9AF;
    dw $684F,$01F0                                                       ;92C9B0;
    db $F8                                                               ;92C9B4;
    dw $685F,$01F0                                                       ;92C9B5;
    db $10                                                               ;92C9B9;
    dw $6E68,$01F8                                                       ;92C9BA;
    db $10                                                               ;92C9BE;
    dw $6E67,$01F0                                                       ;92C9BF;
    db $F0                                                               ;92C9C3;
    dw $6E28,$01F0                                                       ;92C9C4;
    db $E8                                                               ;92C9C8;
    dw $6E18,$C3F8                                                       ;92C9C9;
    db $E0                                                               ;92C9CD;
    dw $6E06,$C3F8                                                       ;92C9CE;
    db $00                                                               ;92C9D2;
    dw $6E46,$C3F8                                                       ;92C9D3;
    db $F0                                                               ;92C9D7;
    dw $6E26                                                             ;92C9D8;

SamusSpritemaps_C9DA:
    dw $0018,$01ED                                                       ;92C9DA;
    db $DD                                                               ;92C9DE;
    dw $683F,$01F7                                                       ;92C9DF;
    db $17                                                               ;92C9E3;
    dw $684F,$0001                                                       ;92C9E4;
    db $E0                                                               ;92C9E8;
    dw $682F,$0007                                                       ;92C9E9;
    db $E1                                                               ;92C9ED;
    dw $686C,$01E9                                                       ;92C9EE;
    db $E6                                                               ;92C9F2;
    dw $681F,$000A                                                       ;92C9F3;
    db $FA                                                               ;92C9F7;
    dw $686F,$000B                                                       ;92C9F8;
    db $F2                                                               ;92C9FC;
    dw $684E,$000A                                                       ;92C9FD;
    db $07                                                               ;92CA01;
    dw $6893,$0007                                                       ;92CA02;
    db $10                                                               ;92CA06;
    dw $6873,$01EB                                                       ;92CA07;
    db $10                                                               ;92CA0B;
    dw $6883,$01EC                                                       ;92CA0C;
    db $02                                                               ;92CA10;
    dw $686F,$01E8                                                       ;92CA11;
    db $FB                                                               ;92CA15;
    dw $684F,$01EE                                                       ;92CA16;
    db $F1                                                               ;92CA1A;
    dw $685F,$000B                                                       ;92CA1B;
    db $E8                                                               ;92CA1F;
    dw $687F,$0005                                                       ;92CA20;
    db $ED                                                               ;92CA24;
    dw $683F,$01F0                                                       ;92CA25;
    db $FA                                                               ;92CA29;
    dw $6E3B,$01F0                                                       ;92CA2A;
    db $F2                                                               ;92CA2E;
    dw $6E2B,$01F0                                                       ;92CA2F;
    db $12                                                               ;92CA33;
    dw $6E6B,$01F8                                                       ;92CA34;
    db $12                                                               ;92CA38;
    dw $6E6A,$01F0                                                       ;92CA39;
    db $EA                                                               ;92CA3D;
    dw $6E1B,$01F0                                                       ;92CA3E;
    db $E2                                                               ;92CA42;
    dw $6E0B,$C3F8                                                       ;92CA43;
    db $02                                                               ;92CA47;
    dw $6E49,$C3F8                                                       ;92CA48;
    db $F2                                                               ;92CA4C;
    dw $6E29,$C3F8                                                       ;92CA4D;
    db $E2                                                               ;92CA51;
    dw $6E09                                                             ;92CA52;

SamusSpritemaps_CA54:
    dw $0019,$01EC                                                       ;92CA54;
    db $D8                                                               ;92CA58;
    dw $683F,$01F5                                                       ;92CA59;
    db $1E                                                               ;92CA5D;
    dw $684F,$0005                                                       ;92CA5E;
    db $DA                                                               ;92CA62;
    dw $682F,$000F                                                       ;92CA63;
    db $DE                                                               ;92CA67;
    dw $686C,$01E7                                                       ;92CA68;
    db $15                                                               ;92CA6C;
    dw $6883,$01E4                                                       ;92CA6D;
    db $04                                                               ;92CA71;
    dw $686F,$01E3                                                       ;92CA72;
    db $F2                                                               ;92CA76;
    dw $685F,$01E6                                                       ;92CA77;
    db $E1                                                               ;92CA7B;
    dw $681F,$0013                                                       ;92CA7C;
    db $FE                                                               ;92CA80;
    dw $686F,$0015                                                       ;92CA81;
    db $EA                                                               ;92CA85;
    dw $687F,$01E0                                                       ;92CA86;
    db $FC                                                               ;92CA8A;
    dw $684F,$0008                                                       ;92CA8B;
    db $14                                                               ;92CA8F;
    dw $6873,$0010                                                       ;92CA90;
    db $0C                                                               ;92CA94;
    dw $6893,$0010                                                       ;92CA95;
    db $F4                                                               ;92CA99;
    dw $684E,$0008                                                       ;92CA9A;
    db $EC                                                               ;92CA9E;
    dw $683F,$01F8                                                       ;92CA9F;
    db $14                                                               ;92CAA3;
    dw $6E6D,$01F0                                                       ;92CAA4;
    db $14                                                               ;92CAA8;
    dw $6E6E,$01F0                                                       ;92CAA9;
    db $0C                                                               ;92CAAD;
    dw $6E5E,$01F0                                                       ;92CAAE;
    db $FC                                                               ;92CAB2;
    dw $6E3E,$01F0                                                       ;92CAB3;
    db $F4                                                               ;92CAB7;
    dw $6E2E,$01F0                                                       ;92CAB8;
    db $EC                                                               ;92CABC;
    dw $6E1E,$01F0                                                       ;92CABD;
    db $E4                                                               ;92CAC1;
    dw $6E0E,$C3F8                                                       ;92CAC2;
    db $04                                                               ;92CAC6;
    dw $6E4C,$C3F8                                                       ;92CAC7;
    db $F4                                                               ;92CACB;
    dw $6E2C,$C3F8                                                       ;92CACC;
    db $E4                                                               ;92CAD0;
    dw $6E0C                                                             ;92CAD1;

SamusSpritemaps_CAD3:
    dw $0019,$001B                                                       ;92CAD3;
    db $E1                                                               ;92CAD7;
    dw $687F,$0018                                                       ;92CAD8;
    db $DC                                                               ;92CADC;
    dw $687F,$01F5                                                       ;92CADD;
    db $25                                                               ;92CAE1;
    dw $6873,$000E                                                       ;92CAE2;
    db $D3                                                               ;92CAE6;
    dw $682F,$01DB                                                       ;92CAE7;
    db $FB                                                               ;92CAEB;
    dw $6873,$0019                                                       ;92CAEC;
    db $FF                                                               ;92CAF0;
    dw $2883,$01DF                                                       ;92CAF1;
    db $08                                                               ;92CAF5;
    dw $686F,$0016                                                       ;92CAF6;
    db $12                                                               ;92CAFA;
    dw $6893,$0009                                                       ;92CAFB;
    db $19                                                               ;92CAFF;
    dw $6873,$01E5                                                       ;92CB00;
    db $19                                                               ;92CB04;
    dw $6883,$01E0                                                       ;92CB05;
    db $F0                                                               ;92CB09;
    dw $685F,$001F                                                       ;92CB0A;
    db $ED                                                               ;92CB0E;
    dw $687F,$0014                                                       ;92CB0F;
    db $F4                                                               ;92CB13;
    dw $684E,$01E0                                                       ;92CB14;
    db $DC                                                               ;92CB18;
    dw $681F,$0010                                                       ;92CB19;
    db $EC                                                               ;92CB1D;
    dw $283F,$01F8                                                       ;92CB1E;
    db $14                                                               ;92CB22;
    dw $6E74,$01F8                                                       ;92CB23;
    db $0C                                                               ;92CB27;
    dw $6E64,$0000                                                       ;92CB28;
    db $0C                                                               ;92CB2C;
    dw $6E63,$01F0                                                       ;92CB2D;
    db $FC                                                               ;92CB31;
    dw $6E82,$01F0                                                       ;92CB32;
    db $EC                                                               ;92CB36;
    dw $6E62,$01F0                                                       ;92CB37;
    db $E4                                                               ;92CB3B;
    dw $6E52,$01F8                                                       ;92CB3C;
    db $E4                                                               ;92CB40;
    dw $6E51,$0000                                                       ;92CB41;
    db $E4                                                               ;92CB45;
    dw $6E50,$C3F8                                                       ;92CB46;
    db $FC                                                               ;92CB4A;
    dw $6E80,$C3F8                                                       ;92CB4B;
    db $EC                                                               ;92CB4F;
    dw $6E60                                                             ;92CB50;

SamusSpritemaps_CB52:
    dw $0008,$01EA                                                       ;92CB52;
    db $F4                                                               ;92CB56;
    dw $6E9C,$01EA                                                       ;92CB57;
    db $EC                                                               ;92CB5B;
    dw $6E8C,$01FA                                                       ;92CB5C;
    db $14                                                               ;92CB60;
    dw $6E99,$C3FA                                                       ;92CB61;
    db $04                                                               ;92CB65;
    dw $6E78,$0002                                                       ;92CB66;
    db $FC                                                               ;92CB6A;
    dw $6E94,$0002                                                       ;92CB6B;
    db $F4                                                               ;92CB6F;
    dw $6E84,$C3F2                                                       ;92CB70;
    db $F4                                                               ;92CB74;
    dw $6E85,$C3F2                                                       ;92CB75;
    db $E4                                                               ;92CB79;
    dw $6E65                                                             ;92CB7A;

SamusSpritemaps_CB7C:
    dw $000B,$0002                                                       ;92CB7C;
    db $F4                                                               ;92CB80;
    dw $6E98,$01F2                                                       ;92CB81;
    db $FC                                                               ;92CB85;
    dw $6E96,$01FA                                                       ;92CB86;
    db $FC                                                               ;92CB8A;
    dw $6E95,$01F2                                                       ;92CB8B;
    db $E4                                                               ;92CB8F;
    dw $6E7B,$01FA                                                       ;92CB90;
    db $E4                                                               ;92CB94;
    dw $6E7A,$01EA                                                       ;92CB95;
    db $F4                                                               ;92CB99;
    dw $6E9C,$01EA                                                       ;92CB9A;
    db $EC                                                               ;92CB9E;
    dw $6E8C,$C3F2                                                       ;92CB9F;
    db $EC                                                               ;92CBA3;
    dw $6E8A,$01FA                                                       ;92CBA4;
    db $14                                                               ;92CBA8;
    dw $6E99,$C3FA                                                       ;92CBA9;
    db $04                                                               ;92CBAD;
    dw $6E78,$0002                                                       ;92CBAE;
    db $FC                                                               ;92CBB2;
    dw $6E94                                                             ;92CBB3;

SamusSpritemaps_CBB5:
    dw $000B,$01FA                                                       ;92CBB5;
    db $FC                                                               ;92CBB9;
    dw $6E95,$01F2                                                       ;92CBBA;
    db $FC                                                               ;92CBBE;
    dw $6E96,$0002                                                       ;92CBBF;
    db $F4                                                               ;92CBC3;
    dw $6E7C,$01F2                                                       ;92CBC4;
    db $E4                                                               ;92CBC8;
    dw $6E7E,$01FA                                                       ;92CBC9;
    db $E4                                                               ;92CBCD;
    dw $6E7D,$01EA                                                       ;92CBCE;
    db $F4                                                               ;92CBD2;
    dw $6E9F,$01EA                                                       ;92CBD3;
    db $EC                                                               ;92CBD7;
    dw $6E8F,$C3F2                                                       ;92CBD8;
    db $EC                                                               ;92CBDC;
    dw $6E8D,$01FA                                                       ;92CBDD;
    db $14                                                               ;92CBE1;
    dw $6E99,$C3FA                                                       ;92CBE2;
    db $04                                                               ;92CBE6;
    dw $6E78,$0002                                                       ;92CBE7;
    db $FC                                                               ;92CBEB;
    dw $6E94                                                             ;92CBEC;


; Samus tiles definition format:
;     aaaaaa nnnn NNNN
; where:
;     a: Source address
;     n: Part 1 size, n = 0 means 10000h bytes are transferred
;     N: Part 2 size, N = 0 means no bytes are transferred

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
;     2: Facing left  - normal - frame 4
;     19h: Facing right - spin jump - frames 9..Ah
;     1Ah: Facing left  - spin jump - frames 9..Ah
;     1Bh: Facing right - space jump - frames 9..Ah
;     1Ch: Facing left  - space jump - frames 9..Ah
;     1Dh: Facing right - morph ball - no springball - on ground - frame 8
;     1Eh: Moving right - morph ball - no springball - on ground - frame 8
;     1Fh: Moving left  - morph ball - no springball - on ground - frame 8
;     20h: Unused - frames 9..Ah
;     21h: Unused - frames 9..Ah
;     22h: Unused - frames 9..Ah
;     23h: Unused - frames 9..Ah
;     24h: Unused - frames 9..Ah
;     27h: Facing right - crouching - frame 4
;     28h: Facing left  - crouching - frame 4
;     29h: Facing right - falling - frames 3..4
;     2Ah: Facing left  - falling - frames 3..4
;     31h: Facing right - morph ball - no springball - in air - frame 8
;     32h: Facing left  - morph ball - no springball - in air - frame 8
;     33h: Unused - frames 9..Ah
;     34h: Unused - frames 9..Ah
;     39h: Unused - frames 9..Ah
;     3Ah: Unused - frames 9..Ah
;     3Fh: Unused - frame 8
;     40h: Unused - frame 8
;     41h: Facing left  - morph ball - no springball - on ground - frame 8
;     42h: Unused - frames 9..Ah
;     47h: Unused - frame 4
;     48h: Unused - frame 4
;     67h: Facing right - falling - gun extended - frames 3..4
;     68h: Facing left  - falling - gun extended - frames 3..4
;     79h: Facing right - morph ball - spring ball - on ground - frame 8
;     7Ah: Facing left  - morph ball - spring ball - on ground - frame 8
;     7Bh: Moving right - morph ball - spring ball - on ground - frame 8
;     7Ch: Moving left  - morph ball - spring ball - on ground - frame 8
;     7Dh: Facing right - morph ball - spring ball - falling - frame 8
;     7Eh: Facing left  - morph ball - spring ball - falling - frame 8
;     7Fh: Facing right - morph ball - spring ball - in air - frame 8
;     80h: Facing left  - morph ball - spring ball - in air - frame 8
;     81h: Facing right - screw attack - frames 19h..1Ah
;     82h: Facing left  - screw attack - frames 19h..1Ah
;     83h: Facing right - wall jump - frame 2
;     83h: Facing right - wall jump - frames Bh..Ch
;     83h: Facing right - wall jump - frames 15h..16h
;     84h: Facing left  - wall jump - frame 2
;     84h: Facing left  - wall jump - frames Bh..Ch
;     84h: Facing left  - wall jump - frames 15h..16h
;     89h: Facing right - ran into a wall - frame 4
;     8Ah: Facing left  - ran into a wall - frame 4
;     9Bh: Facing forward - varia/gravity suit - frame 1
;     A8h: Facing right - grappling - frame 4
;     A9h: Facing left  - grappling - frame 4
;     B4h: Facing right - grappling - crouching - frame 4
;     B5h: Facing left  - grappling - crouching - frame 4
;     C5h: Unused - frame 8
;     D3h: Facing right - crystal flash - frames 4..5
;     D3h: Facing right - crystal flash - frames Ah..Bh
;     D4h: Facing left  - crystal flash - frames 4..5
;     D4h: Facing left  - crystal flash - frames Ah..Bh
;     DFh: Unused. Related to Draygon - frame 8
;     E8h: Facing right - Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left  - Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left  - Samus drained - crouching/falling - frames 11h..12h
;     E9h: Facing left  - Samus drained - crouching/falling - frames 18h..19h
;     E9h: Facing left  - Samus drained - crouching/falling - frames 1Bh..1Ch
;     E9h: Facing left  - Samus drained - crouching/falling - frames 1Eh..1Fh
;     EAh: Facing right - Samus drained - standing - frame 4
;     EBh: Facing left  - Samus drained - standing - frame 4
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
; Ah: Moving left  - not aiming - frame 0
; Ah: Moving left  - not aiming - frame 5
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 3
; BEh: Facing left  - grabbed by Draygon - moving - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 5
; C8h: Facing left  - vertical shinespark windup - frame 3
    dl SamusTiles_Top_Set0_Entry6 : dw $0080,$0080                       ;92CC18;

SamusTopTiles_Set0_CC1F:
; Ah: Moving left  - not aiming - frame 4
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 4
; BEh: Facing left  - grabbed by Draygon - moving - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 4
    dl SamusTiles_Top_Set0_Entry7 : dw $0080,$0080                       ;92CC1F;

SamusTopTiles_Set0_CC26:
; Ah: Moving left  - not aiming - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 1
    dl SamusTiles_Top_Set0_Entry8 : dw $00C0,$00C0                       ;92CC26;

SamusTopTiles_Set0_CC2D:
; Ah: Moving left  - not aiming - frame 3
    dl SamusTiles_Top_Set0_Entry9 : dw $00C0,$00C0                       ;92CC2D;

SamusTopTiles_Set0_CC34:
; Ah: Moving left  - not aiming - frame 9
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 3
; C8h: Facing left  - vertical shinespark windup - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 2
    dl SamusTiles_Top_Set0_EntryA : dw $0080,$0080                       ;92CC34;

SamusTopTiles_Set0_CC3B:
; Ah: Moving left  - not aiming - frame 7
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 4
; C8h: Facing left  - vertical shinespark windup - frame 1
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
; 12h: Moving left  - aiming down-left - frames 0..1
; 12h: Moving left  - aiming down-left - frames 5..6
; 18h: Facing left  - normal jump - aiming down - frame 0
; 2Eh: Facing left  - falling - aiming down - frame 0
; 6Ch: Facing left  - normal jump - aiming down-left - frames 0..1
; 70h: Facing left  - falling - aiming down-left - frames 0..2
; 77h: Facing left  - moonwalk - aiming down-left - frame 0
; 77h: Facing left  - moonwalk - aiming down-left - frame 3
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frames 0..1
; BDh: Facing left  - grabbed by Draygon - not moving - aiming down-left - frame 0
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
; 8: Facing left  - aiming down-left - frame 0
; 5Ah: Facing left  - normal jump transition - aiming down-left - frame 0
; 74h: Facing left  - crouching - aiming down-left - frame 0
; ABh: Facing left  - grappling - aiming down-left - frame 0
; B7h: Facing left  - grappling - crouching - aiming down-left - frame 0
; D2h: Facing left  - ran into a wall - aiming down-left - frame 0
; E5h: Facing left  - landing from normal jump - aiming down-left - frames 0..1
; F6h: Facing left  - crouching transition - aiming down-left - frame 0
; FCh: Facing left  - standing transition - aiming down-left - frame 0
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
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frames 0..1
; 36h: Facing left  - crouching transition - frame 0
; 3Ch: Facing left  - standing transition - frame 0
; 49h: Facing left  - moonwalk - frame 0
; 49h: Facing left  - moonwalk - frame 3
; 52h: Facing left  - normal jump - not aiming - moving forward - frames 0..1
; 68h: Facing left  - falling - gun extended - frames 0..2
; 68h: Facing left  - falling - gun extended - frames 5..6
; ADh: Unused. Facing left  - grappling - in air - frames 0..1
; BCh: Facing left  - grabbed by Draygon - firing - frame 0
; D4h: Facing left  - crystal flash - frame Eh
; D6h: Facing left  - x-ray - standing - frame 2
; D8h: Facing left  - crystal flash ending - frame 3
; DAh: Facing left  - x-ray - crouching - frame 2
; DCh: Unused - frame 0
; DEh: Unused - frame 2
; E7h: Facing left  - landing from normal jump - firing - frames 0..1
; EBh: Facing left  - Samus drained - standing - frame 5
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
; 4: Facing left  - aiming up - frame 0
; 6: Facing left  - aiming up-left - frame 0
; 16h: Facing left  - normal jump - aiming up - frame 0
; 2Ch: Facing left  - falling - aiming up - frame 0
; 58h: Facing left  - normal jump transition - aiming up-left - frame 0
; 72h: Facing left  - crouching - aiming up-left - frame 0
; 86h: Facing left  - crouching - aiming up - frame 0
; D0h: Facing left  - ran into a wall - aiming up-left - frame 0
; E3h: Facing left  - landing from normal jump - aiming up-left - frames 0..1
; F4h: Facing left  - crouching transition - aiming up-left - frame 0
; FAh: Facing left  - standing transition - aiming up-left - frame 0
    dl SamusTiles_Top_Set0_Entry13 : dw $00C0,$0080                      ;92CC73;

SamusTopTiles_Set0_CC7A:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; C7h: Facing right - vertical shinespark windup - frame 5
    dl SamusTiles_Top_Set0_Entry14 : dw $00A0,$0080                      ;92CC7A;

SamusTopTiles_Set0_CC81:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 5
; C8h: Facing left  - vertical shinespark windup - frame 5
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
; 4: Facing left  - aiming up - frame 1
; Eh: Moving left  - aiming up (unused) - frames 0..1
; Eh: Moving left  - aiming up (unused) - frames 5..6
; 16h: Facing left  - normal jump - aiming up - frame 1
; 2Ch: Facing left  - falling - aiming up - frames 1..2
; 56h: Facing left  - normal jump transition - aiming up - frame 0
; 86h: Facing left  - crouching - aiming up - frame 1
; E1h: Facing left  - landing from normal jump - aiming up - frames 0..1
; F2h: Facing left  - crouching transition - aiming up - frame 0
; F8h: Facing left  - standing transition - aiming up - frame 0
    dl SamusTiles_Top_Set0_Entry17 : dw $00C0,$0040                      ;92CC8F;

SamusTopTiles_Set0_CC96:
; 9: Moving right - not aiming - frame 8
    dl SamusTiles_Top_Set0_Entry18 : dw $00A0,$0080                      ;92CC96;

SamusTopTiles_Set0_CC9D:
; Ah: Moving left  - not aiming - frame 8
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
; 10h: Moving left  - aiming up-left - frames 0..1
; 10h: Moving left  - aiming up-left - frames 5..6
; 6Ah: Facing left  - normal jump - aiming up-left - frames 0..1
; 6Eh: Facing left  - falling - aiming up-left - frames 0..2
; 75h: Facing left  - moonwalk - aiming up-left - frame 0
; 75h: Facing left  - moonwalk - aiming up-left - frame 3
; BBh: Facing left  - grabbed by Draygon - not moving - aiming up-left - frame 0
    dl SamusTiles_Top_Set0_Entry1B : dw $00E0,$0040                      ;92CCAB;

SamusTopTiles_Set0_CCB2:
; 54h: Facing left  - knockback - frames 0..1
; D8h: Facing left  - crystal flash ending - frames 4..5
; E9h: Facing left  - Samus drained - crouching/falling - frames 2..6
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

UNUSED_SamusTopTiles_Set1_92CCCE:
    dl SamusTiles_Top_Set1_Entry0 : dw $00C0,$0080                       ;92CCCE;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set1_92CCD5:
    dl SamusTiles_Top_Set1_Entry1 : dw $00C0,$0080                       ;92CCD5;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set1_CCDC:
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left  - turning - standing - aiming up - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left  - turning - in air - aiming up - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left  - turning - falling - aiming up - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left  - turning - crouching - aiming up - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left  - turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left  - turning - crouching - aiming up-left - frame 1
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 1
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 1
    dl SamusTiles_Top_Set1_Entry2 : dw $00E0,$00C0                       ;92CCDC;

SamusTopTiles_Set1_CCE3:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 1
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 1
    dl SamusTiles_Top_Set1_Entry3 : dw $0100,$00C0                       ;92CCE3;

SamusTopTiles_Set1_CCEA:
    dl SamusTiles_Top_Set1_Entry4 : dw $0020,$0000                       ;92CCEA;

SamusTopTiles_Set1_CCF1:
; 9Bh: Facing forward - varia/gravity suit - frame 0
    dl SamusTiles_Top_Set1_Entry5 : dw $0040,$0040                       ;92CCF1;

SamusTopTiles_Set1_CCF8:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left  - turning - standing - frame 0
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left  - turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left  - turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left  - turning - falling - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left  - moonwalking - turn/jump right - frame 0
; C6h: Unused - frame 2
    dl SamusTiles_Top_Set1_Entry6 : dw $00C0,$0080                       ;92CCF8;

SamusTopTiles_Set1_CCFF:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left  - turning - standing - frame 2
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left  - turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left  - turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left  - turning - falling - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left  - moonwalking - turn/jump right - frame 2
; C6h: Unused - frame 0
    dl SamusTiles_Top_Set1_Entry7 : dw $00C0,$0080                       ;92CCFF;

SamusTopTiles_Set1_CD06:
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left  - turning - standing - aiming up - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left  - turning - in air - aiming up - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left  - turning - falling - aiming up - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left  - turning - crouching - aiming up - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left  - turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left  - turning - crouching - aiming up-left - frame 0
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 2
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 0
    dl SamusTiles_Top_Set1_Entry8 : dw $00E0,$0040                       ;92CD06;

SamusTopTiles_Set1_CD0D:
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left  - turning - standing - aiming up - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left  - turning - in air - aiming up - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left  - turning - falling - aiming up - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left  - turning - crouching - aiming up - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left  - turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left  - turning - crouching - aiming up-left - frame 2
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 0
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 2
    dl SamusTiles_Top_Set1_Entry9 : dw $00C0,$0040                       ;92CD0D;

SamusTopTiles_Set1_CD14:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left  - turning - standing - frame 1
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left  - turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left  - turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left  - turning - falling - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left  - moonwalking - turn/jump right - frame 1
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
; B8h: Facing left  - grapple wall jump pose - frame 0
    dl SamusTiles_Top_Set1_EntryC : dw $0100,$0080                       ;92CD22;

SamusTopTiles_Set1_CD29:
; 9: Moving right - not aiming - frame 1
    dl SamusTiles_Top_Set1_EntryD : dw $0080,$0080                       ;92CD29;

SamusTopTiles_Set1_CD30:
; 9: Moving right - not aiming - frame 6
    dl SamusTiles_Top_Set1_EntryE : dw $0080,$0080                       ;92CD30;

SamusTopTiles_Set1_CD37:
; Ah: Moving left  - not aiming - frame 1
    dl SamusTiles_Top_Set1_EntryF : dw $0080,$0080                       ;92CD37;

SamusTopTiles_Set1_CD3E:
; Ah: Moving left  - not aiming - frame 6
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
; 84h: Facing left  - wall jump - frame 0
    dl SamusTiles_Top_Set1_Entry13 : dw $0080,$0080                      ;92CD53;

SamusTopTiles_Set1_CD5A:
; 63h: Unused. Related to movement type Dh - frame 0
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
    dl SamusTiles_Top_Set1_Entry14 : dw $0100,$00C0                      ;92CD5A;

SamusTopTiles_Set1_CD61:
; 64h: Unused. Related to movement type Dh - frame 0
; CAh: Facing left  - shinespark - horizontal - frame 0
; CEh: Facing left  - shinespark - diagonal - frame 0
    dl SamusTiles_Top_Set1_Entry15 : dw $0100,$00C0                      ;92CD61;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set1_92CD68:
    dl SamusTiles_Top_Set1_Entry16 : dw $0020,$0000                      ;92CD68;

UNUSED_SamusTopTiles_Set1_92CD6F:
    dl SamusTiles_Top_Set1_Entry17 : dw $0020,$0000                      ;92CD6F;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set1_CD76:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 2
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 0
    dl SamusTiles_Top_Set1_Entry18 : dw $00E0,$0040                      ;92CD76;

SamusTopTiles_Set1_CD7D:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 0
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 2
    dl SamusTiles_Top_Set1_Entry19 : dw $00E0,$0040                      ;92CD7D;

SamusTopTiles_Set1_CD84:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
    dl SamusTiles_Top_Set1_Entry1A : dw $00C0,$0080                      ;92CD84;

SamusTopTiles_Set1_CD8B:
; 18h: Facing left  - normal jump - aiming down - frame 1
; 2Eh: Facing left  - falling - aiming down - frame 1
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 1
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
; 1Ah: Facing left  - spin jump - frame Bh
; 1Ch: Facing left  - space jump - frame Bh
; 82h: Facing left  - screw attack - frame 1Bh
    dl SamusTiles_Top_Set1_Entry1D : dw $00C0,$0080                      ;92CD99;

SamusTopTiles_Set2_CDA0:
; 4Bh: Facing right - normal jump transition - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
    dl SamusTiles_Top_Set2_Entry0 : dw $0080,$0040                       ;92CDA0;

SamusTopTiles_Set2_CDA7:
; 4Ch: Facing left  - normal jump transition - frame 0
; A5h: Facing left  - landing from normal jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 1
    dl SamusTiles_Top_Set2_Entry1 : dw $0080,$0080                       ;92CDA7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set2_92CDAE:
    dl SamusTiles_Top_Set2_Entry2 : dw $00C0,$0080                       ;92CDAE;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set2_CDB5:
; E9h: Facing left  - Samus drained - crouching/falling - frame 10h
; E9h: Facing left  - Samus drained - crouching/falling - frame 15h
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
; 1Ah: Facing left  - spin jump - frame 0
; 1Ch: Facing left  - space jump - frame 0
; 2Ah: Facing left  - falling - frame 0
; 2Ah: Facing left  - falling - frame 6
; 4Fh: Facing left  - damage boost - frames 0..1
; 82h: Facing left  - screw attack - frame 0
; 84h: Facing left  - wall jump - frame 1
; A5h: Facing left  - landing from normal jump - frame 1
; A7h: Facing left  - landing from spin jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 2
; BAh: Facing left  - grabbed by Draygon - not moving - not aiming - frame 0
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
; 12h: Moving left  - aiming down-left - frame 2
; 12h: Moving left  - aiming down-left - frame 4
; 12h: Moving left  - aiming down-left - frame 7
; 12h: Moving left  - aiming down-left - frame 9
; 77h: Facing left  - moonwalk - aiming down-left - frames 1..2
; 77h: Facing left  - moonwalk - aiming down-left - frames 4..5
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
; D6h: Facing left  - x-ray - standing - frame 1
; DAh: Facing left  - x-ray - crouching - frame 1
    dl SamusTiles_Top_Set2_EntryC : dw $00C0,$0040                       ;92CDF4;

SamusTopTiles_Set2_CDFB:
; D6h: Facing left  - x-ray - standing - frame 0
; DAh: Facing left  - x-ray - crouching - frame 0
    dl SamusTiles_Top_Set2_EntryD : dw $00C0,$0040                       ;92CDFB;

SamusTopTiles_Set2_CE02:
; Dh: Moving right - aiming up (unused) - frame 2
; Dh: Moving right - aiming up (unused) - frame 4
; Dh: Moving right - aiming up (unused) - frame 7
; Dh: Moving right - aiming up (unused) - frame 9
; D6h: Facing left  - x-ray - standing - frame 3
; DAh: Facing left  - x-ray - crouching - frame 3
    dl SamusTiles_Top_Set2_EntryE : dw $00C0,$0040                       ;92CE02;

SamusTopTiles_Set2_CE09:
; Eh: Moving left  - aiming up (unused) - frame 2
; Eh: Moving left  - aiming up (unused) - frame 4
; Eh: Moving left  - aiming up (unused) - frame 7
; Eh: Moving left  - aiming up (unused) - frame 9
; D6h: Facing left  - x-ray - standing - frame 4
; DAh: Facing left  - x-ray - crouching - frame 4
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
; 10h: Moving left  - aiming up-left - frame 2
; 10h: Moving left  - aiming up-left - frame 4
; 10h: Moving left  - aiming up-left - frame 7
; 10h: Moving left  - aiming up-left - frame 9
; 75h: Facing left  - moonwalk - aiming up-left - frames 1..2
; 75h: Facing left  - moonwalk - aiming up-left - frames 4..5
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
; 10h: Moving left  - aiming up-left - frame 3
; 10h: Moving left  - aiming up-left - frame 8
    dl SamusTiles_Top_Set2_Entry17 : dw $00E0,$0040                      ;92CE41;

SamusTopTiles_Set2_CE48:
; 11h: Moving right - aiming down-right - frame 3
; 11h: Moving right - aiming down-right - frame 8
    dl SamusTiles_Top_Set2_Entry18 : dw $00E0,$0040                      ;92CE48;

SamusTopTiles_Set2_CE4F:
; 12h: Moving left  - aiming down-left - frame 3
; 12h: Moving left  - aiming down-left - frame 8
    dl SamusTiles_Top_Set2_Entry19 : dw $00E0,$0040                      ;92CE4F;

SamusTopTiles_Set2_CE56:
; 4Ah: Facing right - moonwalk - frames 1..2
; 4Ah: Facing right - moonwalk - frames 4..5
    dl SamusTiles_Top_Set2_Entry1A : dw $00C0,$0040                      ;92CE56;

SamusTopTiles_Set2_CE5D:
; 49h: Facing left  - moonwalk - frames 1..2
; 49h: Facing left  - moonwalk - frames 4..5
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
; 2Ah: Facing left  - falling - frame 1
; 2Ah: Facing left  - falling - frame 5
    dl SamusTiles_Top_Set2_Entry1E : dw $00C0,$0040                      ;92CE72;

SamusTopTiles_Set2_CE79:
; Eh: Moving left  - aiming up (unused) - frame 3
; Eh: Moving left  - aiming up (unused) - frame 8
; 2Ah: Facing left  - falling - frame 2
; 4Fh: Facing left  - damage boost - frame 9
    dl SamusTiles_Top_Set2_Entry1F : dw $00C0,$0040                      ;92CE79;

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
; B2h: Facing clockwise     - grapple - in air - frame 18h
; B2h: Facing clockwise     - grapple - in air - frame 38h
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
; B2h: Facing clockwise     - grapple - in air - frame 17h
; B2h: Facing clockwise     - grapple - in air - frame 37h
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
; B2h: Facing clockwise     - grapple - in air - frame 16h
; B2h: Facing clockwise     - grapple - in air - frame 36h
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
; B2h: Facing clockwise     - grapple - in air - frame 15h
; B2h: Facing clockwise     - grapple - in air - frame 35h
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
; B2h: Facing clockwise     - grapple - in air - frame 14h
; B2h: Facing clockwise     - grapple - in air - frame 34h
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
; B2h: Facing clockwise     - grapple - in air - frame 13h
; B2h: Facing clockwise     - grapple - in air - frame 33h
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
; B2h: Facing clockwise     - grapple - in air - frame 12h
; B2h: Facing clockwise     - grapple - in air - frame 32h
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
; B2h: Facing clockwise     - grapple - in air - frame 11h
; B2h: Facing clockwise     - grapple - in air - frame 31h
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
; B2h: Facing clockwise     - grapple - in air - frame 10h
; B2h: Facing clockwise     - grapple - in air - frame 30h
; B2h: Facing clockwise     - grapple - in air - frames 40h..41h
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
; B2h: Facing clockwise     - grapple - in air - frame Fh
; B2h: Facing clockwise     - grapple - in air - frame 2Fh
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
; B2h: Facing clockwise     - grapple - in air - frame Eh
; B2h: Facing clockwise     - grapple - in air - frame 2Eh
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
; B2h: Facing clockwise     - grapple - in air - frame Dh
; B2h: Facing clockwise     - grapple - in air - frame 2Dh
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
; B2h: Facing clockwise     - grapple - in air - frame Ch
; B2h: Facing clockwise     - grapple - in air - frame 2Ch
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
; B2h: Facing clockwise     - grapple - in air - frame Bh
; B2h: Facing clockwise     - grapple - in air - frame 2Bh
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
; B2h: Facing clockwise     - grapple - in air - frame Ah
; B2h: Facing clockwise     - grapple - in air - frame 2Ah
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
; B2h: Facing clockwise     - grapple - in air - frame 9
; B2h: Facing clockwise     - grapple - in air - frame 29h
    dl SamusTiles_Top_Set3_EntryF : dw $00C0,$0080                       ;92CEE9;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set3_92CEF0:
    dl SamusTiles_Top_Set3_Entry10 : dw $00C0,$0080                      ;92CEF0;
endif ; !FEATURE_KEEP_UNREFERENCED

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
; B2h: Facing clockwise     - grapple - in air - frame 8
; B2h: Facing clockwise     - grapple - in air - frame 28h
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
; B2h: Facing clockwise     - grapple - in air - frame 7
; B2h: Facing clockwise     - grapple - in air - frame 27h
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
; B2h: Facing clockwise     - grapple - in air - frame 6
; B2h: Facing clockwise     - grapple - in air - frame 26h
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
; B2h: Facing clockwise     - grapple - in air - frame 5
; B2h: Facing clockwise     - grapple - in air - frame 25h
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
; B2h: Facing clockwise     - grapple - in air - frame 4
; B2h: Facing clockwise     - grapple - in air - frame 24h
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
; B2h: Facing clockwise     - grapple - in air - frame 3
; B2h: Facing clockwise     - grapple - in air - frame 23h
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
; B2h: Facing clockwise     - grapple - in air - frame 2
; B2h: Facing clockwise     - grapple - in air - frame 22h
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
; B2h: Facing clockwise     - grapple - in air - frame 1
; B2h: Facing clockwise     - grapple - in air - frame 21h
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
; B2h: Facing clockwise     - grapple - in air - frame 0
; B2h: Facing clockwise     - grapple - in air - frame 20h
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
; B2h: Facing clockwise     - grapple - in air - frame 1Fh
; B2h: Facing clockwise     - grapple - in air - frame 3Fh
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
; B2h: Facing clockwise     - grapple - in air - frame 1Eh
; B2h: Facing clockwise     - grapple - in air - frame 3Eh
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
; B2h: Facing clockwise     - grapple - in air - frame 1Dh
; B2h: Facing clockwise     - grapple - in air - frame 3Dh
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
; B2h: Facing clockwise     - grapple - in air - frame 1Ch
; B2h: Facing clockwise     - grapple - in air - frame 3Ch
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
; B2h: Facing clockwise     - grapple - in air - frame 1Bh
; B2h: Facing clockwise     - grapple - in air - frame 3Bh
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
; B2h: Facing clockwise     - grapple - in air - frame 1Ah
; B2h: Facing clockwise     - grapple - in air - frame 3Ah
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
; B2h: Facing clockwise     - grapple - in air - frame 19h
; B2h: Facing clockwise     - grapple - in air - frame 39h
    dl SamusTiles_Top_Set5_EntryF : dw $00C0,$0080                       ;92CFD7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set5_92CFDE:
    dl SamusTiles_Top_Set5_Entry10 : dw $00C0,$0080                      ;92CFDE;
endif ; !FEATURE_KEEP_UNREFERENCED

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

SamusTopTiles_Set7_D05C:
; E9h: Facing left  - Samus drained - crouching/falling - frame 8
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Dh
    dl SamusTiles_Top_Set7_Entry0 : dw $00E0,$0040                       ;92D05C;

SamusTopTiles_Set7_D063:
; E9h: Facing left  - Samus drained - crouching/falling - frame 7
; E9h: Facing left  - Samus drained - crouching/falling - frame 9
; E9h: Facing left  - Samus drained - crouching/falling - frame Bh
; E9h: Facing left  - Samus drained - crouching/falling - frame Eh
; E9h: Facing left  - Samus drained - crouching/falling - frame 13h
; E9h: Facing left  - Samus drained - crouching/falling - frame 17h
    dl SamusTiles_Top_Set7_Entry1 : dw $00E0,$0040                       ;92D063;

SamusTopTiles_Set7_D06A:
; E9h: Facing left  - Samus drained - crouching/falling - frame Ah
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
; EBh: Facing left  - Samus drained - standing - frame 0
    dl SamusTiles_Top_Set7_Entry6 : dw $00E0,$0040                       ;92D086;

SamusTopTiles_Set7_D08D:
; E9h: Facing left  - Samus drained - crouching/falling - frame Fh
; E9h: Facing left  - Samus drained - crouching/falling - frame 14h
; E9h: Facing left  - Samus drained - crouching/falling - frame 16h
; EBh: Facing left  - Samus drained - standing - frame 1
; EBh: Facing left  - Samus drained - standing - frame 3
    dl SamusTiles_Top_Set7_Entry7 : dw $00E0,$0040                       ;92D08D;

SamusTopTiles_Set7_D094:
; EBh: Facing left  - Samus drained - standing - frame 2
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
; 2: Facing left  - normal - frame 0
; 2: Facing left  - normal - frame 5
; 28h: Facing left  - crouching - frame 0
; 28h: Facing left  - crouching - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 8Ah: Facing left  - ran into a wall - frame 0
; 8Ah: Facing left  - ran into a wall - frame 5
; A9h: Facing left  - grappling - frame 0
; A9h: Facing left  - grappling - frame 5
; B5h: Facing left  - grappling - crouching - frame 0
; B5h: Facing left  - grappling - crouching - frame 5
    dl SamusTiles_Top_Set7_EntryF : dw $00C0,$0080                       ;92D0C5;

SamusTopTiles_Set7_D0CC:
; 2: Facing left  - normal - frame 1
; 2: Facing left  - normal - frame 3
; 2: Facing left  - normal - frame 6
; 2: Facing left  - normal - frame 8
; 28h: Facing left  - crouching - frame 1
; 28h: Facing left  - crouching - frame 3
; 28h: Facing left  - crouching - frame 6
; 28h: Facing left  - crouching - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left  - ran into a wall - frame 1
; 8Ah: Facing left  - ran into a wall - frame 3
; 8Ah: Facing left  - ran into a wall - frame 6
; 8Ah: Facing left  - ran into a wall - frame 8
; A9h: Facing left  - grappling - frame 1
; A9h: Facing left  - grappling - frame 3
; A9h: Facing left  - grappling - frame 6
; A9h: Facing left  - grappling - frame 8
; B5h: Facing left  - grappling - crouching - frame 1
; B5h: Facing left  - grappling - crouching - frame 3
; B5h: Facing left  - grappling - crouching - frame 6
; B5h: Facing left  - grappling - crouching - frame 8
    dl SamusTiles_Top_Set7_Entry10 : dw $00C0,$0080                      ;92D0CC;

SamusTopTiles_Set7_D0D3:
; 2: Facing left  - normal - frame 2
; 28h: Facing left  - crouching - frame 2
; 48h: Unused - frame 2
; 8Ah: Facing left  - ran into a wall - frame 2
; A9h: Facing left  - grappling - frame 2
; B5h: Facing left  - grappling - crouching - frame 2
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
; 2: Facing left  - normal - frame 7
; 28h: Facing left  - crouching - frame 7
; 48h: Unused - frame 7
; 8Ah: Facing left  - ran into a wall - frame 7
; A9h: Facing left  - grappling - frame 7
; B5h: Facing left  - grappling - crouching - frame 7
    dl SamusTiles_Top_Set7_Entry13 : dw $00C0,$0040                      ;92D0E1;

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
; Ch: Moving left  - gun extended - frame 0
; Ch: Moving left  - gun extended - frame 5
    dl SamusTiles_Top_Set9_Entry6 : dw $00C0,$0040                       ;92D158;

SamusTopTiles_Set9_D15F:
; Ch: Moving left  - gun extended - frame 4
    dl SamusTiles_Top_Set9_Entry7 : dw $00C0,$0040                       ;92D15F;

SamusTopTiles_Set9_D166:
; Ch: Moving left  - gun extended - frame 3
    dl SamusTiles_Top_Set9_Entry8 : dw $00E0,$0040                       ;92D166;

SamusTopTiles_Set9_D16D:
; Ch: Moving left  - gun extended - frame 2
    dl SamusTiles_Top_Set9_Entry9 : dw $00E0,$0040                       ;92D16D;

SamusTopTiles_Set9_D174:
; Ch: Moving left  - gun extended - frame 6
; Ch: Moving left  - gun extended - frame 9
    dl SamusTiles_Top_Set9_EntryA : dw $00C0,$0040                       ;92D174;

SamusTopTiles_Set9_D17B:
; Ch: Moving left  - gun extended - frame 8
    dl SamusTiles_Top_Set9_EntryB : dw $0100,$0040                       ;92D17B;

SamusTopTiles_Set9_D182:
; Bh: Moving right - gun extended - frame 8
    dl SamusTiles_Top_Set9_EntryC : dw $00C0,$0040                       ;92D182;

SamusTopTiles_Set9_D189:
; Ch: Moving left  - gun extended - frame 7
    dl SamusTiles_Top_Set9_EntryD : dw $0100,$0040                       ;92D189;

SamusTopTiles_Set9_D190:
; Bh: Moving right - gun extended - frame 1
    dl SamusTiles_Top_Set9_EntryE : dw $0080,$0040                       ;92D190;

SamusTopTiles_Set9_D197:
; Ch: Moving left  - gun extended - frame 1
    dl SamusTiles_Top_Set9_EntryF : dw $00C0,$0040                       ;92D197;

SamusBottomTiles_Set0_D19E:
; Actually used by:
;     9: Moving right - not aiming - frame 0
;     Ah: Moving left  - not aiming - frame 0
;     Bh: Moving right - gun extended - frame 0
;     Ch: Moving left  - gun extended - frame 0
;     Dh: Moving right - aiming up (unused) - frame 0
;     Eh: Moving left  - aiming up (unused) - frame 0
;     Fh: Moving right - aiming up-right - frame 0
;     10h: Moving left  - aiming up-left - frame 0
;     11h: Moving right - aiming down-right - frame 0
;     12h: Moving left  - aiming down-left - frame 0

; Meaninglessly used by:
;     0: Facing forward - power suit - frame 1
;     1: Facing right - normal - frame 4
;     2: Facing left  - normal - frame 4
;     19h: Facing right - spin jump - frames 1..Ah
;     1Ah: Facing left  - spin jump - frames 1..Ah
;     1Bh: Facing right - space jump - frames 9..Ah
;     1Ch: Facing left  - space jump - frames 9..Ah
;     1Dh: Facing right - morph ball - no springball - on ground - frames 0..9
;     1Eh: Moving right - morph ball - no springball - on ground - frames 0..9
;     1Fh: Moving left  - morph ball - no springball - on ground - frames 0..9
;     20h: Unused - frames 1..Ah
;     21h: Unused - frames 1..Ah
;     22h: Unused - frames 1..Ah
;     23h: Unused - frames 1..Ah
;     24h: Unused - frames 1..Ah
;     27h: Facing right - crouching - frame 4
;     28h: Facing left  - crouching - frame 4
;     29h: Facing right - falling - frames 3..4
;     2Ah: Facing left  - falling - frames 3..4
;     31h: Facing right - morph ball - no springball - in air - frames 0..9
;     32h: Facing left  - morph ball - no springball - in air - frames 0..9
;     33h: Unused - frames 1..Ah
;     34h: Unused - frames 1..Ah
;     37h: Facing right - morphing transition - frames 0..1
;     38h: Facing left  - morphing transition - frames 0..1
;     39h: Unused - frames 1..Ah
;     3Ah: Unused - frames 1..Ah
;     3Dh: Facing right - unmorphing transition - frames 0..1
;     3Eh: Facing left  - unmorphing transition - frames 0..1
;     3Fh: Unused - frames 0..9
;     40h: Unused - frames 0..9
;     41h: Facing left  - morph ball - no springball - on ground - frames 0..9
;     42h: Unused - frames 1..Ah
;     47h: Unused - frame 4
;     48h: Unused - frame 4
;     4Fh: Facing left  - damage boost - frames 2..8
;     50h: Facing right - damage boost - frames 2..8
;     65h: Unused. Related to movement type Dh - frames 1..8
;     66h: Unused. Related to movement type Dh - frames 1..8
;     67h: Facing right - falling - gun extended - frames 3..4
;     68h: Facing left  - falling - gun extended - frames 3..4
;     79h: Facing right - morph ball - spring ball - on ground - frames 0..9
;     7Ah: Facing left  - morph ball - spring ball - on ground - frames 0..9
;     7Bh: Moving right - morph ball - spring ball - on ground - frames 0..9
;     7Ch: Moving left  - morph ball - spring ball - on ground - frames 0..9
;     7Dh: Facing right - morph ball - spring ball - falling - frames 0..9
;     7Eh: Facing left  - morph ball - spring ball - falling - frames 0..9
;     7Fh: Facing right - morph ball - spring ball - in air - frames 0..9
;     80h: Facing left  - morph ball - spring ball - in air - frames 0..9
;     81h: Facing right - screw attack - frames 19h..1Ah
;     82h: Facing left  - screw attack - frames 19h..1Ah
;     83h: Facing right - wall jump - frames 2..Ch
;     83h: Facing right - wall jump - frames 15h..16h
;     84h: Facing left  - wall jump - frames 2..Ch
;     84h: Facing left  - wall jump - frames 15h..16h
;     89h: Facing right - ran into a wall - frame 4
;     8Ah: Facing left  - ran into a wall - frame 4
;     9Bh: Facing forward - varia/gravity suit - frame 1
;     A8h: Facing right - grappling - frame 4
;     A9h: Facing left  - grappling - frame 4
;     B4h: Facing right - grappling - crouching - frame 4
;     B5h: Facing left  - grappling - crouching - frame 4
;     C5h: Unused - frames 0..9
;     CBh: Facing right - shinespark - vertical - frame 0
;     CCh: Facing left  - shinespark - vertical - frame 0
;     D3h: Facing right - crystal flash - frames 4..5
;     D3h: Facing right - crystal flash - frames Ah..Bh
;     D4h: Facing left  - crystal flash - frames 4..5
;     D4h: Facing left  - crystal flash - frames Ah..Bh
;     DBh: Unused - frames 1..2
;     DCh: Unused - frames 1..2
;     DDh: Unused - frames 0..1
;     DEh: Unused - frames 0..1
;     DFh: Unused. Related to Draygon - frames 0..9
;     E8h: Facing right - Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left  - Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left  - Samus drained - crouching/falling - frames 11h..12h
;     E9h: Facing left  - Samus drained - crouching/falling - frames 18h..19h
;     E9h: Facing left  - Samus drained - crouching/falling - frames 1Bh..1Ch
;     E9h: Facing left  - Samus drained - crouching/falling - frames 1Eh..1Fh
;     EAh: Facing right - Samus drained - standing - frame 4
;     EBh: Facing left  - Samus drained - standing - frame 4
    dl SamusTiles_Bottom_Set0_Entry0 : dw $0080,$0080                    ;92D19E;

SamusBottomTiles_Set0_D1A5:
; 9: Moving right - not aiming - frame 2
; Ah: Moving left  - not aiming - frame 2
; Bh: Moving right - gun extended - frame 2
; Ch: Moving left  - gun extended - frame 2
; Dh: Moving right - aiming up (unused) - frame 2
; Eh: Moving left  - aiming up (unused) - frame 2
; Fh: Moving right - aiming up-right - frame 2
; 10h: Moving left  - aiming up-left - frame 2
; 11h: Moving right - aiming down-right - frame 2
; 12h: Moving left  - aiming down-left - frame 2
    dl SamusTiles_Bottom_Set0_Entry1 : dw $00E0,$0080                    ;92D1A5;

SamusBottomTiles_Set0_D1AC:
; 9: Moving right - not aiming - frame 4
; Ah: Moving left  - not aiming - frame 4
; Bh: Moving right - gun extended - frame 4
; Ch: Moving left  - gun extended - frame 4
; Dh: Moving right - aiming up (unused) - frame 4
; Eh: Moving left  - aiming up (unused) - frame 4
; Fh: Moving right - aiming up-right - frame 4
; 10h: Moving left  - aiming up-left - frame 4
; 11h: Moving right - aiming down-right - frame 4
; 12h: Moving left  - aiming down-left - frame 4
    dl SamusTiles_Bottom_Set0_Entry2 : dw $00E0,$00C0                    ;92D1AC;

SamusBottomTiles_Set0_D1B3:
; 9: Moving right - not aiming - frame 5
; Ah: Moving left  - not aiming - frame 5
; Bh: Moving right - gun extended - frame 5
; Ch: Moving left  - gun extended - frame 5
; Dh: Moving right - aiming up (unused) - frame 5
; Eh: Moving left  - aiming up (unused) - frame 5
; Fh: Moving right - aiming up-right - frame 5
; 10h: Moving left  - aiming up-left - frame 5
; 11h: Moving right - aiming down-right - frame 5
; 12h: Moving left  - aiming down-left - frame 5
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 0
; C7h: Facing right - vertical shinespark windup - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 0
    dl SamusTiles_Bottom_Set0_Entry3 : dw $0080,$0080                    ;92D1B3;

SamusBottomTiles_Set0_D1BA:
; 9: Moving right - not aiming - frame 7
; Ah: Moving left  - not aiming - frame 7
; Bh: Moving right - gun extended - frame 7
; Ch: Moving left  - gun extended - frame 7
; Dh: Moving right - aiming up (unused) - frame 7
; Eh: Moving left  - aiming up (unused) - frame 7
; Fh: Moving right - aiming up-right - frame 7
; 10h: Moving left  - aiming up-left - frame 7
; 11h: Moving right - aiming down-right - frame 7
; 12h: Moving left  - aiming down-left - frame 7
    dl SamusTiles_Bottom_Set0_Entry4 : dw $0100,$0080                    ;92D1BA;

SamusBottomTiles_Set0_D1C1:
; 9: Moving right - not aiming - frame 9
; Ah: Moving left  - not aiming - frame 9
; Bh: Moving right - gun extended - frame 9
; Ch: Moving left  - gun extended - frame 9
; Dh: Moving right - aiming up (unused) - frame 9
; Eh: Moving left  - aiming up (unused) - frame 9
; Fh: Moving right - aiming up-right - frame 9
; 10h: Moving left  - aiming up-left - frame 9
; 11h: Moving right - aiming down-right - frame 9
; 12h: Moving left  - aiming down-left - frame 9
    dl SamusTiles_Bottom_Set0_Entry5 : dw $00E0,$00C0                    ;92D1C1;

SamusBottomTiles_Set0_D1C8:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 2: Facing left  - normal - frame 0
; 2: Facing left  - normal - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; 8Ah: Facing left  - ran into a wall - frame 0
; 8Ah: Facing left  - ran into a wall - frame 5
; A4h: Facing right - landing from normal jump - frame 1
; A5h: Facing left  - landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 2
; A7h: Facing left  - landing from spin jump - frame 2
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; A9h: Facing left  - grappling - frame 0
; A9h: Facing left  - grappling - frame 5
; D5h: Facing right - x-ray - standing - frames 0..4
; D6h: Facing left  - x-ray - standing - frames 0..4
; E0h: Facing right - landing from normal jump - aiming up - frame 1
; E1h: Facing left  - landing from normal jump - aiming up - frame 1
; E2h: Facing right - landing from normal jump - aiming up-right - frame 1
; E3h: Facing left  - landing from normal jump - aiming up-left - frame 1
; E4h: Facing right - landing from normal jump - aiming down-right - frame 1
; E5h: Facing left  - landing from normal jump - aiming down-left - frame 1
; E6h: Facing right - landing from normal jump - firing - frame 1
; E7h: Facing left  - landing from normal jump - firing - frame 1
    dl SamusTiles_Bottom_Set0_Entry6 : dw $00C0,$00C0                    ;92D1C8;

SamusBottomTiles_Set0_D1CF:
; 27h: Facing right - crouching - frames 0..3
; 27h: Facing right - crouching - frames 5..8
; 28h: Facing left  - crouching - frames 0..3
; 28h: Facing left  - crouching - frames 5..8
; 71h: Facing right - crouching - aiming up-right - frame 0
; 72h: Facing left  - crouching - aiming up-left - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; 74h: Facing left  - crouching - aiming down-left - frame 0
; 85h: Facing right - crouching - aiming up - frames 0..1
; 86h: Facing left  - crouching - aiming up - frames 0..1
; B4h: Facing right - grappling - crouching - frames 0..3
; B4h: Facing right - grappling - crouching - frames 5..8
; B5h: Facing left  - grappling - crouching - frames 0..3
; B5h: Facing left  - grappling - crouching - frames 5..8
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; B7h: Facing left  - grappling - crouching - aiming down-left - frame 0
; D9h: Facing right - x-ray - crouching - frames 0..4
; DAh: Facing left  - x-ray - crouching - frames 0..4
    dl SamusTiles_Bottom_Set0_Entry7 : dw $0080,$0080                    ;92D1CF;

SamusBottomTiles_Set0_D1D6:
; 9: Moving right - not aiming - frame 1
; Ah: Moving left  - not aiming - frame 1
; Bh: Moving right - gun extended - frame 1
; Ch: Moving left  - gun extended - frame 1
; Dh: Moving right - aiming up (unused) - frame 1
; Eh: Moving left  - aiming up (unused) - frame 1
; Fh: Moving right - aiming up-right - frame 1
; 10h: Moving left  - aiming up-left - frame 1
; 11h: Moving right - aiming down-right - frame 1
; 12h: Moving left  - aiming down-left - frame 1
    dl SamusTiles_Bottom_Set0_Entry8 : dw $00C0,$0080                    ;92D1D6;

SamusBottomTiles_Set0_D1DD:
; 9: Moving right - not aiming - frame 3
; Ah: Moving left  - not aiming - frame 3
; Bh: Moving right - gun extended - frame 3
; Ch: Moving left  - gun extended - frame 3
; Dh: Moving right - aiming up (unused) - frame 3
; Eh: Moving left  - aiming up (unused) - frame 3
; Fh: Moving right - aiming up-right - frame 3
; 10h: Moving left  - aiming up-left - frame 3
; 11h: Moving right - aiming down-right - frame 3
; 12h: Moving left  - aiming down-left - frame 3
    dl SamusTiles_Bottom_Set0_Entry9 : dw $0100,$0080                    ;92D1DD;

SamusBottomTiles_Set0_D1E4:
; 9: Moving right - not aiming - frame 6
; Ah: Moving left  - not aiming - frame 6
; Bh: Moving right - gun extended - frame 6
; Ch: Moving left  - gun extended - frame 6
; Dh: Moving right - aiming up (unused) - frame 6
; Eh: Moving left  - aiming up (unused) - frame 6
; Fh: Moving right - aiming up-right - frame 6
; 10h: Moving left  - aiming up-left - frame 6
; 11h: Moving right - aiming down-right - frame 6
; 12h: Moving left  - aiming down-left - frame 6
    dl SamusTiles_Bottom_Set0_EntryA : dw $00C0,$0080                    ;92D1E4;

SamusBottomTiles_Set0_D1EB:
; 9: Moving right - not aiming - frame 8
; Ah: Moving left  - not aiming - frame 8
; Bh: Moving right - gun extended - frame 8
; Ch: Moving left  - gun extended - frame 8
; Dh: Moving right - aiming up (unused) - frame 8
; Eh: Moving left  - aiming up (unused) - frame 8
; Fh: Moving right - aiming up-right - frame 8
; 10h: Moving left  - aiming up-left - frame 8
; 11h: Moving right - aiming down-right - frame 8
; 12h: Moving left  - aiming down-left - frame 8
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
; 2: Facing left  - normal - frame 1
; 2: Facing left  - normal - frame 3
; 2: Facing left  - normal - frame 6
; 2: Facing left  - normal - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left  - ran into a wall - frame 1
; 8Ah: Facing left  - ran into a wall - frame 3
; 8Ah: Facing left  - ran into a wall - frame 6
; 8Ah: Facing left  - ran into a wall - frame 8
; A9h: Facing left  - grappling - frame 1
; A9h: Facing left  - grappling - frame 3
; A9h: Facing left  - grappling - frame 6
; A9h: Facing left  - grappling - frame 8
    dl SamusTiles_Bottom_Set0_Entry10 : dw $00C0,$00C0                   ;92D20E;

SamusBottomTiles_Set0_D215:
; 4Fh: Facing left  - damage boost - frame 0
    dl SamusTiles_Bottom_Set0_Entry11 : dw $00A0,$0040                   ;92D215;

SamusBottomTiles_Set0_D21C:
; 50h: Facing right - damage boost - frame 0
    dl SamusTiles_Bottom_Set0_Entry12 : dw $00A0,$0040                   ;92D21C;

SamusBottomTiles_Set0_D223:
; 15h: Facing right - normal jump - aiming up - frame 1
; 69h: Facing right - normal jump - aiming up-right - frame 1
    dl SamusTiles_Bottom_Set0_Entry13 : dw $00A0,$0080                   ;92D223;

SamusBottomTiles_Set0_D22A:
; 16h: Facing left  - normal jump - aiming up - frame 1
; 6Ah: Facing left  - normal jump - aiming up-left - frame 1
    dl SamusTiles_Bottom_Set0_Entry14 : dw $00A0,$0080                   ;92D22A;

SamusBottomTiles_Set0_D231:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left  - turning - standing - frame 0
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left  - turning - standing - aiming up - frame 0
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left  - moonwalking - turn/jump right - frame 0
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 2
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 2
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 0
; C6h: Unused - frame 2
    dl SamusTiles_Bottom_Set0_Entry15 : dw $00A0,$0080                   ;92D231;

SamusBottomTiles_Set0_D238:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left  - turning - standing - frame 2
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left  - turning - standing - aiming up - frame 2
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left  - moonwalking - turn/jump right - frame 2
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 0
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 0
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 2
; C6h: Unused - frame 0
    dl SamusTiles_Bottom_Set0_Entry16 : dw $00A0,$0080                   ;92D238;

SamusBottomTiles_Set0_D23F:
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left  - turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left  - turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left  - turning - falling - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left  - turning - in air - aiming up - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left  - turning - falling - aiming up - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left  - turning - crouching - aiming up - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left  - turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left  - turning - crouching - aiming up-left - frame 0
    dl SamusTiles_Bottom_Set0_Entry17 : dw $0080,$0040                   ;92D23F;

SamusBottomTiles_Set0_D246:
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left  - turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left  - turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left  - turning - falling - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left  - turning - in air - aiming up - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left  - turning - falling - aiming up - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left  - turning - crouching - aiming up - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left  - turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left  - turning - crouching - aiming up-left - frame 2
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
; B8h: Facing left  - grapple wall jump pose - frame 0
    dl SamusTiles_Bottom_Set0_Entry1A : dw $0080,$0080                   ;92D254;

SamusBottomTiles_Set0_D25B:
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
    dl SamusTiles_Bottom_Set0_Entry1B : dw $00C0,$0080                   ;92D25B;

SamusBottomTiles_Set0_D262:
; CAh: Facing left  - shinespark - horizontal - frame 0
; CEh: Facing left  - shinespark - diagonal - frame 0
    dl SamusTiles_Bottom_Set0_Entry1C : dw $00C0,$0080                   ;92D262;

SamusBottomTiles_Set0_D269:
; 2: Facing left  - normal - frame 2
; 2: Facing left  - normal - frame 7
; 48h: Unused - frame 2
; 48h: Unused - frame 7
; 8Ah: Facing left  - ran into a wall - frame 2
; 8Ah: Facing left  - ran into a wall - frame 7
; A9h: Facing left  - grappling - frame 2
; A9h: Facing left  - grappling - frame 7
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
; 1Ah: Facing left  - spin jump - frame Bh
; 1Ch: Facing left  - space jump - frame Bh
; 82h: Facing left  - screw attack - frame 1Bh
    dl SamusTiles_Bottom_Set0_Entry1F : dw $0080,$0080                   ;92D277;

SamusBottomTiles_Set1_D27E:
; 49h: Facing left  - moonwalk - frame 3
; 4Ah: Facing right - moonwalk - frame 3
; 75h: Facing left  - moonwalk - aiming up-left - frame 3
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; 77h: Facing left  - moonwalk - aiming down-left - frame 3
; 78h: Facing right - moonwalk - aiming down-right - frame 3
    dl SamusTiles_Bottom_Set1_Entry0 : dw $00C0,$0080                    ;92D27E;

SamusBottomTiles_Set1_D285:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left  - turning - standing - frame 1
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left  - turning - standing - aiming up - frame 1
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left  - moonwalking - turn/jump right - frame 1
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 1
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 1
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 1
; C6h: Unused - frame 1
    dl SamusTiles_Bottom_Set1_Entry1 : dw $0080,$0080                    ;92D285;

SamusBottomTiles_Set1_D28C:
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left  - turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left  - turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left  - turning - falling - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left  - turning - in air - aiming up - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left  - turning - falling - aiming up - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left  - turning - crouching - aiming up - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left  - turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left  - turning - crouching - aiming up-left - frame 1
    dl SamusTiles_Bottom_Set1_Entry2 : dw $0040,$0040                    ;92D28C;

SamusBottomTiles_Set1_D293:
; 49h: Facing left  - moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 75h: Facing left  - moonwalk - aiming up-left - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 77h: Facing left  - moonwalk - aiming down-left - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 0
    dl SamusTiles_Bottom_Set1_Entry3 : dw $00C0,$0080                    ;92D293;

SamusBottomTiles_Set1_D29A:
; 49h: Facing left  - moonwalk - frame 1
; 4Ah: Facing right - moonwalk - frame 1
; 75h: Facing left  - moonwalk - aiming up-left - frame 1
; 76h: Facing right - moonwalk - aiming up-right - frame 1
; 77h: Facing left  - moonwalk - aiming down-left - frame 1
; 78h: Facing right - moonwalk - aiming down-right - frame 1
    dl SamusTiles_Bottom_Set1_Entry4 : dw $0080,$0080                    ;92D29A;

SamusBottomTiles_Set1_D2A1:
; 49h: Facing left  - moonwalk - frame 4
; 4Ah: Facing right - moonwalk - frame 4
; 75h: Facing left  - moonwalk - aiming up-left - frame 4
; 76h: Facing right - moonwalk - aiming up-right - frame 4
; 77h: Facing left  - moonwalk - aiming down-left - frame 4
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
; D8h: Facing left  - crystal flash ending - frames 0..2
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
; E9h: Facing left  - Samus drained - crouching/falling - frames 0..1
; EAh: Facing right - Samus drained - standing - frame 5
; F1h: Facing right - crouching transition - aiming up - frame 0
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
    dl SamusTiles_Bottom_Set1_Entry6 : dw $00C0,$0080                    ;92D2A8;

SamusBottomTiles_Set1_D2AF:
; 36h: Facing left  - crouching transition - frame 0
; 3Ch: Facing left  - standing transition - frame 0
; 4Ch: Facing left  - normal jump transition - frame 0
; 56h: Facing left  - normal jump transition - aiming up - frame 0
; 58h: Facing left  - normal jump transition - aiming up-left - frame 0
; 5Ah: Facing left  - normal jump transition - aiming down-left - frame 0
; A5h: Facing left  - landing from normal jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 1
; D4h: Facing left  - crystal flash - frame Eh
; D8h: Facing left  - crystal flash ending - frame 3
; E1h: Facing left  - landing from normal jump - aiming up - frame 0
; E3h: Facing left  - landing from normal jump - aiming up-left - frame 0
; E5h: Facing left  - landing from normal jump - aiming down-left - frame 0
; E7h: Facing left  - landing from normal jump - firing - frame 0
; E9h: Facing left  - Samus drained - crouching/falling - frame 7
; E9h: Facing left  - Samus drained - crouching/falling - frame Fh
; E9h: Facing left  - Samus drained - crouching/falling - frame 14h
; E9h: Facing left  - Samus drained - crouching/falling - frame 16h
; EBh: Facing left  - Samus drained - standing - frame 5
; F2h: Facing left  - crouching transition - aiming up - frame 0
; F4h: Facing left  - crouching transition - aiming up-left - frame 0
; F6h: Facing left  - crouching transition - aiming down-left - frame 0
; F8h: Facing left  - standing transition - aiming up - frame 0
; FAh: Facing left  - standing transition - aiming up-left - frame 0
; FCh: Facing left  - standing transition - aiming down-left - frame 0
    dl SamusTiles_Bottom_Set1_Entry7 : dw $00C0,$0080                    ;92D2AF;

SamusBottomTiles_Set1_D2B6:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frames 2..3
; C7h: Facing right - vertical shinespark windup - frames 2..3
; F0h: Facing right - grabbed by Draygon - moving - frame 5
    dl SamusTiles_Bottom_Set1_Entry8 : dw $00E0,$0040                    ;92D2B6;

SamusBottomTiles_Set1_D2BD:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frames 2..3
; BEh: Facing left  - grabbed by Draygon - moving - frame 5
; C8h: Facing left  - vertical shinespark windup - frames 2..3
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
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frame 0
; 16h: Facing left  - normal jump - aiming up - frame 0
; 18h: Facing left  - normal jump - aiming down - frame 0
; 2Ah: Facing left  - falling - frame 0
; 2Ah: Facing left  - falling - frame 5
; 2Ch: Facing left  - falling - aiming up - frame 0
; 2Eh: Facing left  - falling - aiming down - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 4
; 4Fh: Facing left  - damage boost - frame 1
; 52h: Facing left  - normal jump - not aiming - moving forward - frame 0
; 68h: Facing left  - falling - gun extended - frame 0
; 68h: Facing left  - falling - gun extended - frame 5
; 6Ah: Facing left  - normal jump - aiming up-left - frame 0
; 6Ch: Facing left  - normal jump - aiming down-left - frame 0
; 6Eh: Facing left  - falling - aiming up-left - frame 0
; 70h: Facing left  - falling - aiming down-left - frame 0
; ADh: Unused. Facing left  - grappling - in air - frame 0
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 4
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
; 2Ah: Facing left  - falling - frames 1..2
; 2Ch: Facing left  - falling - aiming up - frame 1
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 5
; 54h: Facing left  - knockback - frame 0
; 68h: Facing left  - falling - gun extended - frames 1..2
; 6Eh: Facing left  - falling - aiming up-left - frame 1
; 70h: Facing left  - falling - aiming down-left - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 0
; BEh: Facing left  - grabbed by Draygon - moving - frame 3
; C8h: Facing left  - vertical shinespark windup - frame 5
; D8h: Facing left  - crystal flash ending - frame 4
; E9h: Facing left  - Samus drained - crouching/falling - frames 2..6
    dl SamusTiles_Bottom_Set1_EntryD : dw $0080,$0080                    ;92D2D9;

SamusBottomTiles_Set1_D2E0:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
    dl SamusTiles_Bottom_Set1_EntryE : dw $00C0,$0040                    ;92D2E0;

SamusBottomTiles_Set1_D2E7:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 4
; C8h: Facing left  - vertical shinespark windup - frame 1
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
; 18h: Facing left  - normal jump - aiming down - frame 1
; 2Eh: Facing left  - falling - aiming down - frame 1
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 1
    dl SamusTiles_Bottom_Set1_Entry12 : dw $00E0,$0040                   ;92D2FC;

SamusBottomTiles_Set1_D303:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
    dl SamusTiles_Bottom_Set1_Entry13 : dw $0100,$0040                   ;92D303;

SamusBottomTiles_Set1_D30A:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left  - wall jump - frame 0
    dl SamusTiles_Bottom_Set1_Entry14 : dw $00C0,$0040                   ;92D30A;

SamusBottomTiles_Set1_D311:
; 49h: Facing left  - moonwalk - frame 2
; 63h: Unused. Related to movement type Dh - frame 0
    dl SamusTiles_Bottom_Set1_Entry15 : dw $00A0,$0080                   ;92D311;

SamusBottomTiles_Set1_D318:
; 49h: Facing left  - moonwalk - frame 5
; 64h: Unused. Related to movement type Dh - frame 0
    dl SamusTiles_Bottom_Set1_Entry16 : dw $00A0,$0080                   ;92D318;

SamusBottomTiles_Set1_D31F:
; 4Ah: Facing right - moonwalk - frame 2
; 75h: Facing left  - moonwalk - aiming up-left - frame 2
; 76h: Facing right - moonwalk - aiming up-right - frame 2
; 77h: Facing left  - moonwalk - aiming down-left - frame 2
; 78h: Facing right - moonwalk - aiming down-right - frame 2
    dl SamusTiles_Bottom_Set1_Entry17 : dw $00A0,$0080                   ;92D31F;

SamusBottomTiles_Set1_D326:
; 4Ah: Facing right - moonwalk - frame 5
; 75h: Facing left  - moonwalk - aiming up-left - frame 5
; 76h: Facing right - moonwalk - aiming up-right - frame 5
; 77h: Facing left  - moonwalk - aiming down-left - frame 5
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
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frame 1
; 1Ah: Facing left  - spin jump - frame 0
; 1Ch: Facing left  - space jump - frame 0
; 2Ah: Facing left  - falling - frame 6
; 2Ch: Facing left  - falling - aiming up - frame 2
; 4Fh: Facing left  - damage boost - frame 9
; 52h: Facing left  - normal jump - not aiming - moving forward - frame 1
; 68h: Facing left  - falling - gun extended - frame 6
; 6Ch: Facing left  - normal jump - aiming down-left - frame 1
; 6Eh: Facing left  - falling - aiming up-left - frame 2
; 70h: Facing left  - falling - aiming down-left - frame 2
; 82h: Facing left  - screw attack - frame 0
; 84h: Facing left  - wall jump - frame 1
; A7h: Facing left  - landing from spin jump - frame 0
; ADh: Unused. Facing left  - grappling - in air - frame 1
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 2
; E9h: Facing left  - Samus drained - crouching/falling - frame Eh
; E9h: Facing left  - Samus drained - crouching/falling - frame 13h
; E9h: Facing left  - Samus drained - crouching/falling - frame 17h
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
; 54h: Facing left  - knockback - frame 1
; BAh: Facing left  - grabbed by Draygon - not moving - not aiming - frame 0
; BBh: Facing left  - grabbed by Draygon - not moving - aiming up-left - frame 0
; BCh: Facing left  - grabbed by Draygon - firing - frame 0
; BDh: Facing left  - grabbed by Draygon - not moving - aiming down-left - frame 0
; BEh: Facing left  - grabbed by Draygon - moving - frame 1
; D8h: Facing left  - crystal flash ending - frame 5
    dl SamusTiles_Bottom_Set1_Entry1C : dw $00C0,$0080                   ;92D342;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set1_92D349:
    dl SamusTiles_Bottom_Set1_Entry1D : dw $0080,$0080                   ;92D349;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set1_D350:
; E9h: Facing left  - Samus drained - crouching/falling - frames 8..Bh
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Dh
; EBh: Facing left  - Samus drained - standing - frames 0..3
    dl SamusTiles_Bottom_Set1_Entry1E : dw $0060,$0040                   ;92D350;

SamusBottomTiles_Set1_D357:
; E8h: Facing right - Samus drained - crouching/falling - frames 8..Bh
; EAh: Facing right - Samus drained - standing - frames 0..3
    dl SamusTiles_Bottom_Set1_Entry1F : dw $0060,$0040                   ;92D357;

SamusBottomTiles_Set2_D35E:
; 5Dh: Unused - frames 17h..19h
; 5Eh: Unused - frames 17h..19h
; 5Fh: Unused - frames 17h..19h
; 60h: Unused - frames 17h..19h
; 61h: Unused - frames 17h..19h
; B2h: Facing clockwise     - grapple - in air - frames 17h..19h
    dl SamusTiles_Bottom_Set2_Entry0 : dw $0080,$0040                    ;92D35E;

SamusBottomTiles_Set2_D365:
; 5Dh: Unused - frames 15h..16h
; 5Eh: Unused - frames 15h..16h
; 5Fh: Unused - frames 15h..16h
; 60h: Unused - frames 15h..16h
; 61h: Unused - frames 15h..16h
; B2h: Facing clockwise     - grapple - in air - frames 15h..16h
    dl SamusTiles_Bottom_Set2_Entry1 : dw $00E0,$0040                    ;92D365;

SamusBottomTiles_Set2_D36C:
; 5Dh: Unused - frames 13h..14h
; 5Eh: Unused - frames 13h..14h
; 5Fh: Unused - frames 13h..14h
; 60h: Unused - frames 13h..14h
; 61h: Unused - frames 13h..14h
; B2h: Facing clockwise     - grapple - in air - frames 13h..14h
    dl SamusTiles_Bottom_Set2_Entry2 : dw $00A0,$0080                    ;92D36C;

SamusBottomTiles_Set2_D373:
; 5Dh: Unused - frame 12h
; 5Eh: Unused - frame 12h
; 5Fh: Unused - frame 12h
; 60h: Unused - frame 12h
; 61h: Unused - frame 12h
; B2h: Facing clockwise     - grapple - in air - frame 12h
    dl SamusTiles_Bottom_Set2_Entry3 : dw $00A0,$0040                    ;92D373;

SamusBottomTiles_Set2_D37A:
; 5Dh: Unused - frame 11h
; 5Eh: Unused - frame 11h
; 5Fh: Unused - frame 11h
; 60h: Unused - frame 11h
; 61h: Unused - frame 11h
; B2h: Facing clockwise     - grapple - in air - frame 11h
    dl SamusTiles_Bottom_Set2_Entry4 : dw $00C0,$0040                    ;92D37A;

SamusBottomTiles_Set2_D381:
; 5Dh: Unused - frame 10h
; 5Eh: Unused - frame 10h
; 5Fh: Unused - frame 10h
; 60h: Unused - frame 10h
; 61h: Unused - frame 10h
; B2h: Facing clockwise     - grapple - in air - frame 10h
    dl SamusTiles_Bottom_Set2_Entry5 : dw $00C0,$0040                    ;92D381;

SamusBottomTiles_Set2_D388:
; 5Dh: Unused - frame Fh
; 5Eh: Unused - frame Fh
; 5Fh: Unused - frame Fh
; 60h: Unused - frame Fh
; 61h: Unused - frame Fh
; B2h: Facing clockwise     - grapple - in air - frame Fh
    dl SamusTiles_Bottom_Set2_Entry6 : dw $0080,$0040                    ;92D388;

SamusBottomTiles_Set2_D38F:
; 5Dh: Unused - frame Eh
; 5Eh: Unused - frame Eh
; 5Fh: Unused - frame Eh
; 60h: Unused - frame Eh
; 61h: Unused - frame Eh
; B2h: Facing clockwise     - grapple - in air - frame Eh
    dl SamusTiles_Bottom_Set2_Entry7 : dw $00A0,$0040                    ;92D38F;

SamusBottomTiles_Set2_D396:
; 5Dh: Unused - frames Ch..Dh
; 5Eh: Unused - frames Ch..Dh
; 5Fh: Unused - frames Ch..Dh
; 60h: Unused - frames Ch..Dh
; 61h: Unused - frames Ch..Dh
; B2h: Facing clockwise     - grapple - in air - frames Ch..Dh
    dl SamusTiles_Bottom_Set2_Entry8 : dw $00A0,$0040                    ;92D396;

SamusBottomTiles_Set2_D39D:
; 5Dh: Unused - frames Ah..Bh
; 5Eh: Unused - frames Ah..Bh
; 5Fh: Unused - frames Ah..Bh
; 60h: Unused - frames Ah..Bh
; 61h: Unused - frames Ah..Bh
; B2h: Facing clockwise     - grapple - in air - frames Ah..Bh
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
; B2h: Facing clockwise     - grapple - in air - frame 40h
    dl SamusTiles_Bottom_Set2_EntryB : dw $0080,$0080                    ;92D3AB;

SamusBottomTiles_Set2_D3B2:
; 5Dh: Unused - frame 41h
; 5Eh: Unused - frame 41h
; 5Fh: Unused - frame 41h
; 60h: Unused - frame 41h
; 61h: Unused - frame 41h
; B2h: Facing clockwise     - grapple - in air - frame 41h
    dl SamusTiles_Bottom_Set2_EntryC : dw $0080,$0080                    ;92D3B2;

SamusBottomTiles_Set2_D3B9:
; 5Dh: Unused - frames 37h..39h
; 5Eh: Unused - frames 37h..39h
; 5Fh: Unused - frames 37h..39h
; 60h: Unused - frames 37h..39h
; 61h: Unused - frames 37h..39h
; B2h: Facing clockwise     - grapple - in air - frames 37h..39h
    dl SamusTiles_Bottom_Set2_EntryD : dw $0080,$0080                    ;92D3B9;

SamusBottomTiles_Set2_D3C0:
; 5Dh: Unused - frames 35h..36h
; 5Eh: Unused - frames 35h..36h
; 5Fh: Unused - frames 35h..36h
; 60h: Unused - frames 35h..36h
; 61h: Unused - frames 35h..36h
; B2h: Facing clockwise     - grapple - in air - frames 35h..36h
    dl SamusTiles_Bottom_Set2_EntryE : dw $00A0,$0040                    ;92D3C0;

SamusBottomTiles_Set2_D3C7:
; 5Dh: Unused - frames 33h..34h
; 5Eh: Unused - frames 33h..34h
; 5Fh: Unused - frames 33h..34h
; 60h: Unused - frames 33h..34h
; 61h: Unused - frames 33h..34h
; B2h: Facing clockwise     - grapple - in air - frames 33h..34h
    dl SamusTiles_Bottom_Set2_EntryF : dw $0080,$0080                    ;92D3C7;

SamusBottomTiles_Set2_D3CE:
; 5Dh: Unused - frame 32h
; 5Eh: Unused - frame 32h
; 5Fh: Unused - frame 32h
; 60h: Unused - frame 32h
; 61h: Unused - frame 32h
; B2h: Facing clockwise     - grapple - in air - frame 32h
    dl SamusTiles_Bottom_Set2_Entry10 : dw $0080,$0080                   ;92D3CE;

SamusBottomTiles_Set2_D3D5:
; 5Dh: Unused - frame 31h
; 5Eh: Unused - frame 31h
; 5Fh: Unused - frame 31h
; 60h: Unused - frame 31h
; 61h: Unused - frame 31h
; B2h: Facing clockwise     - grapple - in air - frame 31h
    dl SamusTiles_Bottom_Set2_Entry11 : dw $00A0,$0040                   ;92D3D5;

SamusBottomTiles_Set2_D3DC:
; 5Dh: Unused - frame 30h
; 5Eh: Unused - frame 30h
; 5Fh: Unused - frame 30h
; 60h: Unused - frame 30h
; 61h: Unused - frame 30h
; B2h: Facing clockwise     - grapple - in air - frame 30h
    dl SamusTiles_Bottom_Set2_Entry12 : dw $0080,$0080                   ;92D3DC;

SamusBottomTiles_Set2_D3E3:
; 5Dh: Unused - frame 2Fh
; 5Eh: Unused - frame 2Fh
; 5Fh: Unused - frame 2Fh
; 60h: Unused - frame 2Fh
; 61h: Unused - frame 2Fh
; B2h: Facing clockwise     - grapple - in air - frame 2Fh
    dl SamusTiles_Bottom_Set2_Entry13 : dw $0080,$0080                   ;92D3E3;

SamusBottomTiles_Set2_D3EA:
; 5Dh: Unused - frame 2Eh
; 5Eh: Unused - frame 2Eh
; 5Fh: Unused - frame 2Eh
; 60h: Unused - frame 2Eh
; 61h: Unused - frame 2Eh
; B2h: Facing clockwise     - grapple - in air - frame 2Eh
    dl SamusTiles_Bottom_Set2_Entry14 : dw $0080,$0080                   ;92D3EA;

SamusBottomTiles_Set2_D3F1:
; 5Dh: Unused - frames 2Ch..2Dh
; 5Eh: Unused - frames 2Ch..2Dh
; 5Fh: Unused - frames 2Ch..2Dh
; 60h: Unused - frames 2Ch..2Dh
; 61h: Unused - frames 2Ch..2Dh
; B2h: Facing clockwise     - grapple - in air - frames 2Ch..2Dh
    dl SamusTiles_Bottom_Set2_Entry15 : dw $00C0,$0080                   ;92D3F1;

SamusBottomTiles_Set2_D3F8:
; 5Dh: Unused - frames 2Ah..2Bh
; 5Eh: Unused - frames 2Ah..2Bh
; 5Fh: Unused - frames 2Ah..2Bh
; 60h: Unused - frames 2Ah..2Bh
; 61h: Unused - frames 2Ah..2Bh
; B2h: Facing clockwise     - grapple - in air - frames 2Ah..2Bh
    dl SamusTiles_Bottom_Set2_Entry16 : dw $0080,$0080                   ;92D3F8;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set2_92D3FF:
    dl SamusTiles_Bottom_Set2_Entry17 : dw $0080,$0080                   ;92D3FF;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set4_D406:
; 5Dh: Unused - frames 7..9
; 5Eh: Unused - frames 7..9
; 5Fh: Unused - frames 7..9
; 60h: Unused - frames 7..9
; 61h: Unused - frames 7..9
; B2h: Facing clockwise     - grapple - in air - frames 7..9
    dl SamusTiles_Bottom_Set4_Entry0 : dw $0080,$0040                    ;92D406;

SamusBottomTiles_Set4_D40D:
; 5Dh: Unused - frames 5..6
; 5Eh: Unused - frames 5..6
; 5Fh: Unused - frames 5..6
; 60h: Unused - frames 5..6
; 61h: Unused - frames 5..6
; B2h: Facing clockwise     - grapple - in air - frames 5..6
    dl SamusTiles_Bottom_Set4_Entry1 : dw $00E0,$0040                    ;92D40D;

SamusBottomTiles_Set4_D414:
; 5Dh: Unused - frames 3..4
; 5Eh: Unused - frames 3..4
; 5Fh: Unused - frames 3..4
; 60h: Unused - frames 3..4
; 61h: Unused - frames 3..4
; B2h: Facing clockwise     - grapple - in air - frames 3..4
    dl SamusTiles_Bottom_Set4_Entry2 : dw $00A0,$0080                    ;92D414;

SamusBottomTiles_Set4_D41B:
; 5Dh: Unused - frame 2
; 5Eh: Unused - frame 2
; 5Fh: Unused - frame 2
; 60h: Unused - frame 2
; 61h: Unused - frame 2
; B2h: Facing clockwise     - grapple - in air - frame 2
    dl SamusTiles_Bottom_Set4_Entry3 : dw $00A0,$0040                    ;92D41B;

SamusBottomTiles_Set4_D422:
; 5Dh: Unused - frame 1
; 5Eh: Unused - frame 1
; 5Fh: Unused - frame 1
; 60h: Unused - frame 1
; 61h: Unused - frame 1
; B2h: Facing clockwise     - grapple - in air - frame 1
    dl SamusTiles_Bottom_Set4_Entry4 : dw $00C0,$0040                    ;92D422;

SamusBottomTiles_Set4_D429:
; 5Dh: Unused - frame 0
; 5Eh: Unused - frame 0
; 5Fh: Unused - frame 0
; 60h: Unused - frame 0
; 61h: Unused - frame 0
; B2h: Facing clockwise     - grapple - in air - frame 0
    dl SamusTiles_Bottom_Set4_Entry5 : dw $00C0,$0040                    ;92D429;

SamusBottomTiles_Set4_D430:
; 5Dh: Unused - frame 1Fh
; 5Eh: Unused - frame 1Fh
; 5Fh: Unused - frame 1Fh
; 60h: Unused - frame 1Fh
; 61h: Unused - frame 1Fh
; B2h: Facing clockwise     - grapple - in air - frame 1Fh
    dl SamusTiles_Bottom_Set4_Entry6 : dw $0080,$0040                    ;92D430;

SamusBottomTiles_Set4_D437:
; 5Dh: Unused - frame 1Eh
; 5Eh: Unused - frame 1Eh
; 5Fh: Unused - frame 1Eh
; 60h: Unused - frame 1Eh
; 61h: Unused - frame 1Eh
; B2h: Facing clockwise     - grapple - in air - frame 1Eh
    dl SamusTiles_Bottom_Set4_Entry7 : dw $00A0,$0040                    ;92D437;

SamusBottomTiles_Set4_D43E:
; 5Dh: Unused - frames 1Ch..1Dh
; 5Eh: Unused - frames 1Ch..1Dh
; 5Fh: Unused - frames 1Ch..1Dh
; 60h: Unused - frames 1Ch..1Dh
; 61h: Unused - frames 1Ch..1Dh
; B2h: Facing clockwise     - grapple - in air - frames 1Ch..1Dh
    dl SamusTiles_Bottom_Set4_Entry8 : dw $00A0,$0040                    ;92D43E;

SamusBottomTiles_Set4_D445:
; 5Dh: Unused - frames 1Ah..1Bh
; 5Eh: Unused - frames 1Ah..1Bh
; 5Fh: Unused - frames 1Ah..1Bh
; 60h: Unused - frames 1Ah..1Bh
; 61h: Unused - frames 1Ah..1Bh
; B2h: Facing clockwise     - grapple - in air - frames 1Ah..1Bh
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
; B2h: Facing clockwise     - grapple - in air - frames 27h..29h
    dl SamusTiles_Bottom_Set4_EntryD : dw $0080,$0080                    ;92D461;

SamusBottomTiles_Set4_D468:
; 5Dh: Unused - frames 25h..26h
; 5Eh: Unused - frames 25h..26h
; 5Fh: Unused - frames 25h..26h
; 60h: Unused - frames 25h..26h
; 61h: Unused - frames 25h..26h
; B2h: Facing clockwise     - grapple - in air - frames 25h..26h
    dl SamusTiles_Bottom_Set4_EntryE : dw $00A0,$0040                    ;92D468;

SamusBottomTiles_Set4_D46F:
; 5Dh: Unused - frames 23h..24h
; 5Eh: Unused - frames 23h..24h
; 5Fh: Unused - frames 23h..24h
; 60h: Unused - frames 23h..24h
; 61h: Unused - frames 23h..24h
; B2h: Facing clockwise     - grapple - in air - frames 23h..24h
    dl SamusTiles_Bottom_Set4_EntryF : dw $0080,$0080                    ;92D46F;

SamusBottomTiles_Set4_D476:
; 5Dh: Unused - frame 22h
; 5Eh: Unused - frame 22h
; 5Fh: Unused - frame 22h
; 60h: Unused - frame 22h
; 61h: Unused - frame 22h
; B2h: Facing clockwise     - grapple - in air - frame 22h
    dl SamusTiles_Bottom_Set4_Entry10 : dw $0080,$0080                   ;92D476;

SamusBottomTiles_Set4_D47D:
; 5Dh: Unused - frame 21h
; 5Eh: Unused - frame 21h
; 5Fh: Unused - frame 21h
; 60h: Unused - frame 21h
; 61h: Unused - frame 21h
; B2h: Facing clockwise     - grapple - in air - frame 21h
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
; B2h: Facing clockwise     - grapple - in air - frame 20h
; B2h: Facing clockwise     - grapple - in air - frame 3Fh
    dl SamusTiles_Bottom_Set4_Entry12 : dw $0080,$0080                   ;92D484;

SamusBottomTiles_Set4_D48B:
; 5Dh: Unused - frame 3Eh
; 5Eh: Unused - frame 3Eh
; 5Fh: Unused - frame 3Eh
; 60h: Unused - frame 3Eh
; 61h: Unused - frame 3Eh
; B2h: Facing clockwise     - grapple - in air - frame 3Eh
    dl SamusTiles_Bottom_Set4_Entry13 : dw $0080,$0080                   ;92D48B;

SamusBottomTiles_Set4_D492:
; 5Dh: Unused - frames 3Ch..3Dh
; 5Eh: Unused - frames 3Ch..3Dh
; 5Fh: Unused - frames 3Ch..3Dh
; 60h: Unused - frames 3Ch..3Dh
; 61h: Unused - frames 3Ch..3Dh
; B2h: Facing clockwise     - grapple - in air - frames 3Ch..3Dh
    dl SamusTiles_Bottom_Set4_Entry14 : dw $0080,$0080                   ;92D492;

SamusBottomTiles_Set4_D499:
; 5Dh: Unused - frames 3Ah..3Bh
; 5Eh: Unused - frames 3Ah..3Bh
; 5Fh: Unused - frames 3Ah..3Bh
; 60h: Unused - frames 3Ah..3Bh
; 61h: Unused - frames 3Ah..3Bh
; B2h: Facing clockwise     - grapple - in air - frames 3Ah..3Bh
    dl SamusTiles_Bottom_Set4_Entry15 : dw $0080,$0080                   ;92D499;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set4_92D4A0:
    dl SamusTiles_Bottom_Set4_Entry16 : dw $0080,$0080                   ;92D4A0;
endif ; !FEATURE_KEEP_UNREFERENCED

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

SamusBottomTiles_SetA_D605:
; 3: Facing right - aiming up - frames 0..1
; 5: Facing right - aiming up-right - frame 0
; 7: Facing right - aiming down-right - frame 0
; AAh: Facing right - grappling - aiming down-right - frame 0
; CFh: Facing right - ran into a wall - aiming up-right - frame 0
; D1h: Facing right - ran into a wall - aiming down-right - frame 0
    dl SamusTiles_Bottom_SetA_Entry0 : dw $00C0,$0080                    ;92D605;

SamusBottomTiles_SetA_D60C:
; 4: Facing left  - aiming up - frames 0..1
; 6: Facing left  - aiming up-left - frame 0
; 8: Facing left  - aiming down-left - frame 0
; ABh: Facing left  - grappling - aiming down-left - frame 0
; D0h: Facing left  - ran into a wall - aiming up-left - frame 0
; D2h: Facing left  - ran into a wall - aiming down-left - frame 0
; E9h: Facing left  - Samus drained - crouching/falling - frame 10h
; E9h: Facing left  - Samus drained - crouching/falling - frame 15h
    dl SamusTiles_Bottom_SetA_Entry1 : dw $00C0,$0080                    ;92D60C;

SamusTopTiles_SetA_D613:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 0
; 1Eh: Moving right - morph ball - no springball - on ground - frame 0
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 7
; 31h: Facing right - morph ball - no springball - in air - frame 0
; 32h: Facing left  - morph ball - no springball - in air - frame 0
; 3Fh: Unused - frame 0
; 40h: Unused - frame 0
; 41h: Facing left  - morph ball - no springball - on ground - frame 7
; 79h: Facing right - morph ball - spring ball - on ground - frame 0
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 7
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 0
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 7
; 7Dh: Facing right - morph ball - spring ball - falling - frame 0
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 7
; 7Fh: Facing right - morph ball - spring ball - in air - frame 0
; 80h: Facing left  - morph ball - spring ball - in air - frame 7
; C5h: Unused - frame 7
; D7h: Facing right - crystal flash ending - frame 0
; DFh: Unused. Related to Draygon - frame 7
; E8h: Facing right - Samus drained - crouching/falling - frame 0
    dl SamusTiles_Top_SetA_Entry0 : dw $0060,$0040                       ;92D613;

SamusTopTiles_SetA_D61A:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 2
; 1Eh: Moving right - morph ball - no springball - on ground - frame 2
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 5
; 31h: Facing right - morph ball - no springball - in air - frame 2
; 32h: Facing left  - morph ball - no springball - in air - frame 2
; 3Fh: Unused - frame 2
; 40h: Unused - frame 2
; 41h: Facing left  - morph ball - no springball - on ground - frame 5
; 79h: Facing right - morph ball - spring ball - on ground - frame 2
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 5
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 2
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 5
; 7Dh: Facing right - morph ball - spring ball - falling - frame 2
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 5
; 7Fh: Facing right - morph ball - spring ball - in air - frame 2
; 80h: Facing left  - morph ball - spring ball - in air - frame 5
; C5h: Unused - frame 5
; DFh: Unused. Related to Draygon - frame 5
    dl SamusTiles_Top_SetA_Entry1 : dw $0060,$0040                       ;92D61A;

SamusTopTiles_SetA_D621:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 4
; 1Eh: Moving right - morph ball - no springball - on ground - frame 4
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 3
; 31h: Facing right - morph ball - no springball - in air - frame 4
; 32h: Facing left  - morph ball - no springball - in air - frame 4
; 3Fh: Unused - frame 4
; 40h: Unused - frame 4
; 41h: Facing left  - morph ball - no springball - on ground - frame 3
; 79h: Facing right - morph ball - spring ball - on ground - frame 4
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 3
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 4
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 3
; 7Dh: Facing right - morph ball - spring ball - falling - frame 4
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 3
; 7Fh: Facing right - morph ball - spring ball - in air - frame 4
; 80h: Facing left  - morph ball - spring ball - in air - frame 3
; C5h: Unused - frame 3
; DFh: Unused. Related to Draygon - frame 3
    dl SamusTiles_Top_SetA_Entry2 : dw $0060,$0040                       ;92D621;

SamusTopTiles_SetA_D628:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 6
; 1Eh: Moving right - morph ball - no springball - on ground - frame 6
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 1
; 31h: Facing right - morph ball - no springball - in air - frame 6
; 32h: Facing left  - morph ball - no springball - in air - frame 6
; 3Fh: Unused - frame 6
; 40h: Unused - frame 6
; 41h: Facing left  - morph ball - no springball - on ground - frame 1
; 79h: Facing right - morph ball - spring ball - on ground - frame 6
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 1
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 6
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 1
; 7Dh: Facing right - morph ball - spring ball - falling - frame 6
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 1
; 7Fh: Facing right - morph ball - spring ball - in air - frame 6
; 80h: Facing left  - morph ball - spring ball - in air - frame 1
; C5h: Unused - frame 1
; DFh: Unused. Related to Draygon - frame 1
    dl SamusTiles_Top_SetA_Entry3 : dw $0060,$0040                       ;92D628;

SamusTopTiles_SetA_D62F:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 1
; 1Eh: Moving right - morph ball - no springball - on ground - frame 1
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 6
; 31h: Facing right - morph ball - no springball - in air - frame 1
; 32h: Facing left  - morph ball - no springball - in air - frame 1
; 3Fh: Unused - frame 1
; 40h: Unused - frame 1
; 41h: Facing left  - morph ball - no springball - on ground - frame 6
; 79h: Facing right - morph ball - spring ball - on ground - frame 1
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 6
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 1
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 6
; 7Dh: Facing right - morph ball - spring ball - falling - frame 1
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 6
; 7Fh: Facing right - morph ball - spring ball - in air - frame 1
; 80h: Facing left  - morph ball - spring ball - in air - frame 6
; C5h: Unused - frame 6
; DFh: Unused. Related to Draygon - frame 6
    dl SamusTiles_Top_SetA_Entry4 : dw $00A0,$0000                       ;92D62F;

SamusTopTiles_SetA_D636:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 3
; 1Eh: Moving right - morph ball - no springball - on ground - frame 3
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 4
; 31h: Facing right - morph ball - no springball - in air - frame 3
; 32h: Facing left  - morph ball - no springball - in air - frame 3
; 3Fh: Unused - frame 3
; 40h: Unused - frame 3
; 41h: Facing left  - morph ball - no springball - on ground - frame 4
; 79h: Facing right - morph ball - spring ball - on ground - frame 3
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 4
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 3
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 4
; 7Dh: Facing right - morph ball - spring ball - falling - frame 3
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 4
; 7Fh: Facing right - morph ball - spring ball - in air - frame 3
; 80h: Facing left  - morph ball - spring ball - in air - frame 4
; C5h: Unused - frame 4
; DFh: Unused. Related to Draygon - frame 4
    dl SamusTiles_Top_SetA_Entry5 : dw $0060,$0040                       ;92D636;

SamusTopTiles_SetA_D63D:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 5
; 1Eh: Moving right - morph ball - no springball - on ground - frame 5
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 2
; 31h: Facing right - morph ball - no springball - in air - frame 5
; 32h: Facing left  - morph ball - no springball - in air - frame 5
; 3Fh: Unused - frame 5
; 40h: Unused - frame 5
; 41h: Facing left  - morph ball - no springball - on ground - frame 2
; 79h: Facing right - morph ball - spring ball - on ground - frame 5
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 2
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 5
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 2
; 7Dh: Facing right - morph ball - spring ball - falling - frame 5
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 2
; 7Fh: Facing right - morph ball - spring ball - in air - frame 5
; 80h: Facing left  - morph ball - spring ball - in air - frame 2
; C5h: Unused - frame 2
; DFh: Unused. Related to Draygon - frame 2
    dl SamusTiles_Top_SetA_Entry6 : dw $0060,$0040                       ;92D63D;

SamusTopTiles_SetA_D644:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 7
; 1Eh: Moving right - morph ball - no springball - on ground - frame 7
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 0
; 31h: Facing right - morph ball - no springball - in air - frame 7
; 32h: Facing left  - morph ball - no springball - in air - frame 7
; 3Fh: Unused - frame 7
; 40h: Unused - frame 7
; 41h: Facing left  - morph ball - no springball - on ground - frame 0
; 79h: Facing right - morph ball - spring ball - on ground - frame 7
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 0
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 7
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 0
; 7Dh: Facing right - morph ball - spring ball - falling - frame 7
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 0
; 7Fh: Facing right - morph ball - spring ball - in air - frame 7
; 80h: Facing left  - morph ball - spring ball - in air - frame 0
; C5h: Unused - frame 0
; DFh: Unused. Related to Draygon - frame 0
    dl SamusTiles_Top_SetA_Entry7 : dw $0060,$0040                       ;92D644;

SamusTopTiles_SetA_D64B:
; 19h: Facing right - spin jump - frame 1
; 1Ah: Facing left  - spin jump - frame 1
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
; 84h: Facing left  - wall jump - frame 3
    dl SamusTiles_Top_SetA_Entry8 : dw $0080,$0080                       ;92D64B;

SamusTopTiles_SetA_D652:
; 19h: Facing right - spin jump - frame 2
; 1Ah: Facing left  - spin jump - frame 2
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
; 4Fh: Facing left  - damage boost - frame 8
; 50h: Facing right - damage boost - frame 8
; 83h: Facing right - wall jump - frame 4
; 84h: Facing left  - wall jump - frame 4
    dl SamusTiles_Top_SetA_Entry9 : dw $0100,$0100                       ;92D652;

SamusTopTiles_SetA_D659:
; 19h: Facing right - spin jump - frame 3
; 1Ah: Facing left  - spin jump - frame 3
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
; 4Fh: Facing left  - damage boost - frame 7
; 50h: Facing right - damage boost - frame 7
; 83h: Facing right - wall jump - frame 5
; 84h: Facing left  - wall jump - frame 5
    dl SamusTiles_Top_SetA_EntryA : dw $0080,$0080                       ;92D659;

SamusTopTiles_SetA_D660:
; 19h: Facing right - spin jump - frame 4
; 1Ah: Facing left  - spin jump - frame 4
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
; 4Fh: Facing left  - damage boost - frame 6
; 50h: Facing right - damage boost - frame 6
; 83h: Facing right - wall jump - frame 6
; 84h: Facing left  - wall jump - frame 6
    dl SamusTiles_Top_SetA_EntryB : dw $0100,$0100                       ;92D660;

SamusTopTiles_SetA_D667:
; 19h: Facing right - spin jump - frame 5
; 1Ah: Facing left  - spin jump - frame 5
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
; 4Fh: Facing left  - damage boost - frame 5
; 50h: Facing right - damage boost - frame 5
; 83h: Facing right - wall jump - frame 7
; 84h: Facing left  - wall jump - frame 7
    dl SamusTiles_Top_SetA_EntryC : dw $0080,$0080                       ;92D667;

SamusTopTiles_SetA_D66E:
; 19h: Facing right - spin jump - frame 6
; 1Ah: Facing left  - spin jump - frame 6
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
; 4Fh: Facing left  - damage boost - frame 4
; 50h: Facing right - damage boost - frame 4
; 83h: Facing right - wall jump - frame 8
; 84h: Facing left  - wall jump - frame 8
    dl SamusTiles_Top_SetA_EntryD : dw $0100,$0100                       ;92D66E;

SamusTopTiles_SetA_D675:
; 19h: Facing right - spin jump - frame 7
; 1Ah: Facing left  - spin jump - frame 7
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
; 4Fh: Facing left  - damage boost - frame 3
; 50h: Facing right - damage boost - frame 3
; 83h: Facing right - wall jump - frame 9
; 84h: Facing left  - wall jump - frame 9
    dl SamusTiles_Top_SetA_EntryE : dw $0080,$0080                       ;92D675;

SamusTopTiles_SetA_D67C:
; 19h: Facing right - spin jump - frame 8
; 1Ah: Facing left  - spin jump - frame 8
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
; 4Fh: Facing left  - damage boost - frame 2
; 50h: Facing right - damage boost - frame 2
; 83h: Facing right - wall jump - frame Ah
; 84h: Facing left  - wall jump - frame Ah
    dl SamusTiles_Top_SetA_EntryF : dw $0100,$0100                       ;92D67C;

SamusTopTiles_SetA_D683:
; 65h: Unused. Related to movement type Dh - frame 1
; 66h: Unused. Related to movement type Dh - frame 1
; 81h: Facing right - screw attack - frames 1..3
; 82h: Facing left  - screw attack - frames 1..3
; 83h: Facing right - wall jump - frames 17h..19h
; 84h: Facing left  - wall jump - frames 17h..19h
    dl SamusTiles_Top_SetA_Entry10 : dw $0100,$0040                      ;92D683;

SamusTopTiles_SetA_D68A:
; 65h: Unused. Related to movement type Dh - frame 2
; 66h: Unused. Related to movement type Dh - frame 2
; 81h: Facing right - screw attack - frames 7..9
; 82h: Facing left  - screw attack - frames 7..9
; 83h: Facing right - wall jump - frames 1Dh..1Fh
; 84h: Facing left  - wall jump - frames 1Dh..1Fh
    dl SamusTiles_Top_SetA_Entry11 : dw $0100,$0060                      ;92D68A;

SamusTopTiles_SetA_D691:
; 65h: Unused. Related to movement type Dh - frame 3
; 66h: Unused. Related to movement type Dh - frame 3
; 81h: Facing right - screw attack - frames Dh..Fh
; 82h: Facing left  - screw attack - frames Dh..Fh
; 83h: Facing right - wall jump - frames 23h..25h
; 84h: Facing left  - wall jump - frames 23h..25h
    dl SamusTiles_Top_SetA_Entry12 : dw $0100,$0060                      ;92D691;

SamusTopTiles_SetA_D698:
; 65h: Unused. Related to movement type Dh - frame 4
; 66h: Unused. Related to movement type Dh - frame 4
; 81h: Facing right - screw attack - frames 13h..15h
; 82h: Facing left  - screw attack - frames 13h..15h
; 83h: Facing right - wall jump - frames 29h..2Bh
; 84h: Facing left  - wall jump - frames 29h..2Bh
    dl SamusTiles_Top_SetA_Entry13 : dw $0100,$0000                      ;92D698;

SamusTopTiles_SetA_D69F:
; 1Bh: Facing right - space jump - frames 1..8
; 1Ch: Facing left  - space jump - frames 1..8
; 65h: Unused. Related to movement type Dh - frame 5
; 66h: Unused. Related to movement type Dh - frame 5
; 81h: Facing right - screw attack - frames 4..6
; 81h: Facing right - screw attack - frames Ah..Ch
; 81h: Facing right - screw attack - frames 10h..12h
; 81h: Facing right - screw attack - frames 16h..18h
; 82h: Facing left  - screw attack - frames 4..6
; 82h: Facing left  - screw attack - frames Ah..Ch
; 82h: Facing left  - screw attack - frames 10h..12h
; 82h: Facing left  - screw attack - frames 16h..18h
; 83h: Facing right - wall jump - frames Dh..14h
; 83h: Facing right - wall jump - frames 1Ah..1Ch
; 83h: Facing right - wall jump - frames 20h..22h
; 83h: Facing right - wall jump - frames 26h..28h
; 83h: Facing right - wall jump - frames 2Ch..2Eh
; 84h: Facing left  - wall jump - frames Dh..14h
; 84h: Facing left  - wall jump - frames 1Ah..1Ch
; 84h: Facing left  - wall jump - frames 20h..22h
; 84h: Facing left  - wall jump - frames 26h..28h
; 84h: Facing left  - wall jump - frames 2Ch..2Eh
    dl SamusTiles_Top_SetA_Entry14 : dw $0020,$0000                      ;92D69F;

UNUSED_SamusTopTiles_SetB_92D6A6:
    dl SamusTiles_Top_SetB_Entry0 : dw $0020,$0000                       ;92D6A6;

SamusTopTiles_SetB_D6AD:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 9
; 1Eh: Moving right - morph ball - no springball - on ground - frame 9
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 9
; 31h: Facing right - morph ball - no springball - in air - frame 9
; 32h: Facing left  - morph ball - no springball - in air - frame 9
; 3Fh: Unused - frame 9
; 40h: Unused - frame 9
; 41h: Facing left  - morph ball - no springball - on ground - frame 9
; 79h: Facing right - morph ball - spring ball - on ground - frame 9
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 9
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 9
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 9
; 7Dh: Facing right - morph ball - spring ball - falling - frame 9
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 9
; 7Fh: Facing right - morph ball - spring ball - in air - frame 9
; 80h: Facing left  - morph ball - spring ball - in air - frame 9
; C5h: Unused - frame 9
; DFh: Unused. Related to Draygon - frame 9
    dl SamusTiles_Top_SetB_Entry1 : dw $0060,$0040                       ;92D6AD;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_SetB_92D6B4:
    dl SamusTiles_Top_SetB_Entry2 : dw $0060,$0040                       ;92D6B4;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_SetB_D6BB:
; 38h: Facing left  - morphing transition - frame 1
; 3Eh: Facing left  - unmorphing transition - frame 0
; D4h: Facing left  - crystal flash - frame 0
; D8h: Facing left  - crystal flash ending - frame 1
; DCh: Unused - frame 2
; DEh: Unused - frame 0
; E9h: Facing left  - Samus drained - crouching/falling - frame 0
    dl SamusTiles_Top_SetB_Entry3 : dw $0080,$0040                       ;92D6BB;

SamusTopTiles_SetB_D6C2:
; 38h: Facing left  - morphing transition - frame 0
; 3Eh: Facing left  - unmorphing transition - frame 1
; D4h: Facing left  - crystal flash - frame 1
; D4h: Facing left  - crystal flash - frame 3
; D4h: Facing left  - crystal flash - frames Ch..Dh
; D8h: Facing left  - crystal flash ending - frame 2
; DCh: Unused - frame 1
; DEh: Unused - frame 1
; E9h: Facing left  - Samus drained - crouching/falling - frame 1
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

SamusTopTiles_SetC_D74E:
; CBh: Facing right - shinespark - vertical - frame 0
    dl SamusTiles_Top_SetC_Entry0 : dw $0100,$00C0                       ;92D74E;

SamusTopTiles_SetC_D755:
; CCh: Facing left  - shinespark - vertical - frame 0
    dl SamusTiles_Top_SetC_Entry1 : dw $0100,$00C0                       ;92D755;

SamusTopTiles_SetC_D75C:
; D4h: Facing left  - crystal flash - frame 2
; D4h: Facing left  - crystal flash - frame 6
    dl SamusTiles_Top_SetC_Entry2 : dw $0100,$0040                       ;92D75C;

SamusTopTiles_SetC_D763:
; D4h: Facing left  - crystal flash - frame 7
; D4h: Facing left  - crystal flash - frame 9
    dl SamusTiles_Top_SetC_Entry3 : dw $0100,$0040                       ;92D763;

SamusTopTiles_SetC_D76A:
; D4h: Facing left  - crystal flash - frame 8
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

SamusBottomTiles_Set7_D786:
; D3h: Facing right - crystal flash - frame 0
; D3h: Facing right - crystal flash - frame Dh
; D4h: Facing left  - crystal flash - frame 0
; D4h: Facing left  - crystal flash - frame Dh
    dl SamusTiles_Bottom_Set7_Entry0 : dw $0040,$0040                    ;92D786;

SamusBottomTiles_Set7_D78D:
; D3h: Facing right - crystal flash - frame 1
; D3h: Facing right - crystal flash - frame Ch
; D4h: Facing left  - crystal flash - frame 1
; D4h: Facing left  - crystal flash - frame Ch
    dl SamusTiles_Bottom_Set7_Entry1 : dw $0100,$0100                    ;92D78D;

SamusBottomTiles_Set7_D794:
; D3h: Facing right - crystal flash - frames 2..3
; D3h: Facing right - crystal flash - frames 6..9
; D4h: Facing left  - crystal flash - frames 2..3
; D4h: Facing left  - crystal flash - frames 6..9
    dl SamusTiles_Bottom_Set7_Entry2 : dw $0100,$0100                    ;92D794;

SamusBottomTiles_Set9_D79B:
; 1Bh: Facing right - space jump - frame 1
; 1Ch: Facing left  - space jump - frame 1
; 81h: Facing right - screw attack - frame 1
; 81h: Facing right - screw attack - frame 9
; 81h: Facing right - screw attack - frame 11h
; 82h: Facing left  - screw attack - frame 1
; 82h: Facing left  - screw attack - frame 9
; 82h: Facing left  - screw attack - frame 11h
; 83h: Facing right - wall jump - frame Dh
; 83h: Facing right - wall jump - frame 17h
; 83h: Facing right - wall jump - frame 1Fh
; 83h: Facing right - wall jump - frame 27h
; 84h: Facing left  - wall jump - frame Dh
; 84h: Facing left  - wall jump - frame 17h
; 84h: Facing left  - wall jump - frame 1Fh
; 84h: Facing left  - wall jump - frame 27h
    dl SamusTiles_Bottom_Set9_Entry0 : dw $0100,$0100                    ;92D79B;

SamusBottomTiles_Set9_D7A2:
; 1Bh: Facing right - space jump - frame 2
; 1Ch: Facing left  - space jump - frame 2
; 81h: Facing right - screw attack - frame 2
; 81h: Facing right - screw attack - frame Ah
; 81h: Facing right - screw attack - frame 12h
; 82h: Facing left  - screw attack - frame 2
; 82h: Facing left  - screw attack - frame Ah
; 82h: Facing left  - screw attack - frame 12h
; 83h: Facing right - wall jump - frame Eh
; 83h: Facing right - wall jump - frame 18h
; 83h: Facing right - wall jump - frame 20h
; 83h: Facing right - wall jump - frame 28h
; 84h: Facing left  - wall jump - frame Eh
; 84h: Facing left  - wall jump - frame 18h
; 84h: Facing left  - wall jump - frame 20h
; 84h: Facing left  - wall jump - frame 28h
    dl SamusTiles_Bottom_Set9_Entry1 : dw $0100,$0100                    ;92D7A2;

SamusBottomTiles_Set9_D7A9:
; 1Bh: Facing right - space jump - frame 3
; 1Ch: Facing left  - space jump - frame 3
; 81h: Facing right - screw attack - frame 3
; 81h: Facing right - screw attack - frame Bh
; 81h: Facing right - screw attack - frame 13h
; 82h: Facing left  - screw attack - frame 3
; 82h: Facing left  - screw attack - frame Bh
; 82h: Facing left  - screw attack - frame 13h
; 83h: Facing right - wall jump - frame Fh
; 83h: Facing right - wall jump - frame 19h
; 83h: Facing right - wall jump - frame 21h
; 83h: Facing right - wall jump - frame 29h
; 84h: Facing left  - wall jump - frame Fh
; 84h: Facing left  - wall jump - frame 19h
; 84h: Facing left  - wall jump - frame 21h
; 84h: Facing left  - wall jump - frame 29h
    dl SamusTiles_Bottom_Set9_Entry2 : dw $0100,$0100                    ;92D7A9;

SamusBottomTiles_Set9_D7B0:
; 1Bh: Facing right - space jump - frame 4
; 1Ch: Facing left  - space jump - frame 4
; 81h: Facing right - screw attack - frame 4
; 81h: Facing right - screw attack - frame Ch
; 81h: Facing right - screw attack - frame 14h
; 82h: Facing left  - screw attack - frame 4
; 82h: Facing left  - screw attack - frame Ch
; 82h: Facing left  - screw attack - frame 14h
; 83h: Facing right - wall jump - frame 10h
; 83h: Facing right - wall jump - frame 1Ah
; 83h: Facing right - wall jump - frame 22h
; 83h: Facing right - wall jump - frame 2Ah
; 84h: Facing left  - wall jump - frame 10h
; 84h: Facing left  - wall jump - frame 1Ah
; 84h: Facing left  - wall jump - frame 22h
; 84h: Facing left  - wall jump - frame 2Ah
    dl SamusTiles_Bottom_Set9_Entry3 : dw $0100,$0100                    ;92D7B0;

SamusBottomTiles_Set9_D7B7:
; 1Bh: Facing right - space jump - frame 5
; 1Ch: Facing left  - space jump - frame 5
; 81h: Facing right - screw attack - frame 5
; 81h: Facing right - screw attack - frame Dh
; 81h: Facing right - screw attack - frame 15h
; 82h: Facing left  - screw attack - frame 5
; 82h: Facing left  - screw attack - frame Dh
; 82h: Facing left  - screw attack - frame 15h
; 83h: Facing right - wall jump - frame 11h
; 83h: Facing right - wall jump - frame 1Bh
; 83h: Facing right - wall jump - frame 23h
; 83h: Facing right - wall jump - frame 2Bh
; 84h: Facing left  - wall jump - frame 11h
; 84h: Facing left  - wall jump - frame 1Bh
; 84h: Facing left  - wall jump - frame 23h
; 84h: Facing left  - wall jump - frame 2Bh
    dl SamusTiles_Bottom_Set9_Entry4 : dw $0100,$0100                    ;92D7B7;

SamusBottomTiles_Set9_D7BE:
; 1Bh: Facing right - space jump - frame 6
; 1Ch: Facing left  - space jump - frame 6
; 81h: Facing right - screw attack - frame 6
; 81h: Facing right - screw attack - frame Eh
; 81h: Facing right - screw attack - frame 16h
; 82h: Facing left  - screw attack - frame 6
; 82h: Facing left  - screw attack - frame Eh
; 82h: Facing left  - screw attack - frame 16h
; 83h: Facing right - wall jump - frame 12h
; 83h: Facing right - wall jump - frame 1Ch
; 83h: Facing right - wall jump - frame 24h
; 83h: Facing right - wall jump - frame 2Ch
; 84h: Facing left  - wall jump - frame 12h
; 84h: Facing left  - wall jump - frame 1Ch
; 84h: Facing left  - wall jump - frame 24h
; 84h: Facing left  - wall jump - frame 2Ch
    dl SamusTiles_Bottom_Set9_Entry5 : dw $0100,$0100                    ;92D7BE;

SamusBottomTiles_Set9_D7C5:
; 1Bh: Facing right - space jump - frame 7
; 1Ch: Facing left  - space jump - frame 7
; 81h: Facing right - screw attack - frame 7
; 81h: Facing right - screw attack - frame Fh
; 81h: Facing right - screw attack - frame 17h
; 82h: Facing left  - screw attack - frame 7
; 82h: Facing left  - screw attack - frame Fh
; 82h: Facing left  - screw attack - frame 17h
; 83h: Facing right - wall jump - frame 13h
; 83h: Facing right - wall jump - frame 1Dh
; 83h: Facing right - wall jump - frame 25h
; 83h: Facing right - wall jump - frame 2Dh
; 84h: Facing left  - wall jump - frame 13h
; 84h: Facing left  - wall jump - frame 1Dh
; 84h: Facing left  - wall jump - frame 25h
; 84h: Facing left  - wall jump - frame 2Dh
    dl SamusTiles_Bottom_Set9_Entry6 : dw $0100,$0100                    ;92D7C5;

SamusBottomTiles_Set9_D7CC:
; 1Bh: Facing right - space jump - frame 8
; 1Ch: Facing left  - space jump - frame 8
; 81h: Facing right - screw attack - frame 8
; 81h: Facing right - screw attack - frame 10h
; 81h: Facing right - screw attack - frame 18h
; 82h: Facing left  - screw attack - frame 8
; 82h: Facing left  - screw attack - frame 10h
; 82h: Facing left  - screw attack - frame 18h
; 83h: Facing right - wall jump - frame 14h
; 83h: Facing right - wall jump - frame 1Eh
; 83h: Facing right - wall jump - frame 26h
; 83h: Facing right - wall jump - frame 2Eh
; 84h: Facing left  - wall jump - frame 14h
; 84h: Facing left  - wall jump - frame 1Eh
; 84h: Facing left  - wall jump - frame 26h
; 84h: Facing left  - wall jump - frame 2Eh
    dl SamusTiles_Bottom_Set9_Entry7 : dw $0100,$0100                    ;92D7CC;

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


; Animation definitions are indexed by [Samus animation frame]
; First byte indexes the top half tiles definitions pointer table ($D91E) for a pointer to a list of DMA entries that is indexed by the second byte
; Third byte indexes the bottom half tiles definitions pointer table ($D938) for a pointer to a list of DMA entries that is indexed by the fourth byte

SamusTilesAnimation_AnimationDefinitions_DB48:
; 01: Facing right - normal
; 47: Unused
; 89: Facing right - ran into a wall
; A8: Unused
    db $07,$0C,$00,$06, $07,$0D,$00,$0E, $07,$0E,$00,$0F, $07,$0D,$00,$0E ;92DB48;
    db $00,$00,$00,$00, $07,$0C,$00,$06, $07,$0D,$00,$0E, $07,$12,$00,$0F ;92DB58;
    db $07,$0D,$00,$0E                                                   ;92DB68;

SamusTilesAnimation_AnimationDefinitions_DB6C:
; 02: Facing left  - normal
; 48: Unused
; 8A: Facing left  - ran into a wall
; A9: Unused
    db $07,$0F,$00,$06, $07,$10,$00,$10, $07,$11,$00,$1D, $07,$10,$00,$10 ;92DB6C;
    db $00,$00,$00,$00, $07,$0F,$00,$06, $07,$10,$00,$10, $07,$13,$00,$1D ;92DB7C;
    db $07,$10,$00,$10                                                   ;92DB8C;

SamusTilesAnimation_AnimationDefinitions_DB90:
; A4: Facing right - landing from normal jump
    db $02,$00,$01,$06, $02,$04,$00,$06                                  ;92DB90;

SamusTilesAnimation_AnimationDefinitions_DB98:
; A5: Facing left  - landing from normal jump
    db $02,$01,$01,$07, $02,$05,$00,$06                                  ;92DB98;

SamusTilesAnimation_AnimationDefinitions_DBA0:
; A6: Facing right - landing from spin jump
    db $02,$04,$01,$19, $02,$00,$01,$06, $02,$04,$00,$06                 ;92DBA0;

SamusTilesAnimation_AnimationDefinitions_DBAC:
; A7: Facing left  - landing from spin jump
    db $02,$05,$01,$1A, $02,$01,$01,$07, $02,$05,$00,$06                 ;92DBAC;

SamusTilesAnimation_AnimationDefinitions_DBB8:
; E0: Facing right - landing from normal jump - aiming up
    db $00,$16,$01,$06, $00,$16,$00,$06                                  ;92DBB8;

SamusTilesAnimation_AnimationDefinitions_DBC0:
; E1: Facing left  - landing from normal jump - aiming up
    db $00,$17,$01,$07, $00,$17,$00,$06                                  ;92DBC0;

SamusTilesAnimation_AnimationDefinitions_DBC8:
; E2: Facing right - landing from normal jump - aiming up-right
    db $00,$12,$01,$06, $00,$12,$00,$06                                  ;92DBC8;

SamusTilesAnimation_AnimationDefinitions_DBD0:
; E3: Facing left  - landing from normal jump - aiming up-left
    db $00,$13,$01,$07, $00,$13,$00,$06                                  ;92DBD0;

SamusTilesAnimation_AnimationDefinitions_DBD8:
; E4: Facing right - landing from normal jump - aiming down-right
    db $00,$0E,$01,$06, $00,$0E,$00,$06                                  ;92DBD8;

SamusTilesAnimation_AnimationDefinitions_DBE0:
; E5: Facing left  - landing from normal jump - aiming down-left
    db $00,$0F,$01,$07, $00,$0F,$00,$06                                  ;92DBE0;

SamusTilesAnimation_AnimationDefinitions_DBE8:
; E6: Facing right - landing from normal jump - firing
    db $00,$10,$01,$06, $00,$10,$00,$06                                  ;92DBE8;

SamusTilesAnimation_AnimationDefinitions_DBF0:
; E7: Facing left  - landing from normal jump - firing
    db $00,$11,$01,$07, $00,$11,$00,$06                                  ;92DBF0;

SamusTilesAnimation_AnimationDefinitions_DBF8:
; D5: Facing right - x-ray - standing
    db $02,$09,$00,$06, $02,$08,$00,$06, $00,$10,$00,$06, $02,$0A,$00,$06 ;92DBF8;
    db $02,$0B,$00,$06                                                   ;92DC08;

SamusTilesAnimation_AnimationDefinitions_DC0C:
; D6: Facing left  - x-ray - standing
    db $02,$0D,$00,$06, $02,$0C,$00,$06, $00,$11,$00,$06, $02,$0E,$00,$06 ;92DC0C;
    db $02,$0F,$00,$06                                                   ;92DC1C;

SamusTilesAnimation_AnimationDefinitions_DC20:
; D9: Facing right - x-ray - crouching
    db $02,$09,$00,$07, $02,$08,$00,$07, $00,$10,$00,$07, $02,$0A,$00,$07 ;92DC20;
    db $02,$0B,$00,$07                                                   ;92DC30;

SamusTilesAnimation_AnimationDefinitions_DC34:
; DA: Facing left  - x-ray - crouching
    db $02,$0D,$00,$07, $02,$0C,$00,$07, $00,$11,$00,$07, $02,$0E,$00,$07 ;92DC34;
    db $02,$0F,$00,$07                                                   ;92DC44;

SamusTilesAnimation_AnimationDefinitions_DC48:
; 09: Moving right - not aiming
    db $00,$00,$00,$00, $01,$0D,$00,$08, $00,$02,$00,$01, $00,$03,$00,$09 ;92DC48;
    db $00,$01,$00,$02, $00,$00,$00,$03, $01,$0E,$00,$0A, $00,$05,$00,$04 ;92DC58;
    db $00,$18,$00,$0B, $00,$04,$00,$05                                  ;92DC68;

SamusTilesAnimation_AnimationDefinitions_DC70:
; 0A: Moving left  - not aiming
    db $00,$06,$00,$00, $01,$0F,$00,$08, $00,$08,$00,$01, $00,$09,$00,$09 ;92DC70;
    db $00,$07,$00,$02, $00,$06,$00,$03, $01,$10,$00,$0A, $00,$0B,$00,$04 ;92DC80;
    db $00,$19,$00,$0B, $00,$0A,$00,$05                                  ;92DC90;

SamusTilesAnimation_AnimationDefinitions_DC98:
; 0B: Moving right - gun extended
    db $09,$00,$00,$00, $09,$0E,$00,$08, $09,$02,$00,$01, $09,$03,$00,$09 ;92DC98;
    db $09,$01,$00,$02, $09,$00,$00,$03, $09,$04,$00,$0A, $09,$05,$00,$04 ;92DCA8;
    db $09,$0C,$00,$0B, $09,$04,$00,$05                                  ;92DCB8;

SamusTilesAnimation_AnimationDefinitions_DCC0:
; 0C: Moving left  - gun extended
    db $09,$06,$00,$00, $09,$0F,$00,$08, $09,$09,$00,$01, $09,$08,$00,$09 ;92DCC0;
    db $09,$07,$00,$02, $09,$06,$00,$03, $09,$0A,$00,$0A, $09,$0D,$00,$04 ;92DCD0;
    db $09,$0B,$00,$0B, $09,$0A,$00,$05                                  ;92DCE0;

SamusTilesAnimation_AnimationDefinitions_DCE8:
; 49: Facing left  - moonwalk
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
; 18: Facing left  - normal jump - aiming down
; AF: Unused
    db $00,$0D,$01,$0B, $01,$1B,$01,$12                                  ;92DD20;

SamusTilesAnimation_AnimationDefinitions_DD28:
; 13: Facing right - normal jump - not aiming - not moving - gun extended
; AC: Unused
    db $00,$10,$01,$0A, $00,$10,$01,$19                                  ;92DD28;

SamusTilesAnimation_AnimationDefinitions_DD30:
; 14: Facing left  - normal jump - not aiming - not moving - gun extended
; AD: Unused
    db $00,$11,$01,$0B, $00,$11,$01,$1A                                  ;92DD30;

SamusTilesAnimation_AnimationDefinitions_DD38:
; 15: Facing right - normal jump - aiming up
    db $00,$12,$01,$0A, $00,$16,$00,$13                                  ;92DD38;

SamusTilesAnimation_AnimationDefinitions_DD40:
; 16: Facing left  - normal jump - aiming up
    db $00,$13,$01,$0B, $00,$17,$00,$14                                  ;92DD40;

SamusTilesAnimation_AnimationDefinitions_DD48:
; 51: Facing right - normal jump - not aiming - moving forward
    db $00,$10,$01,$0A, $00,$10,$01,$19                                  ;92DD48;

SamusTilesAnimation_AnimationDefinitions_DD50:
; 52: Facing left  - normal jump - not aiming - moving forward
    db $00,$11,$01,$0B, $00,$11,$01,$1A                                  ;92DD50;

SamusTilesAnimation_AnimationDefinitions_DD58:
; 69: Facing right - normal jump - aiming up-right
    db $00,$1A,$01,$0A, $00,$1A,$00,$13                                  ;92DD58;

SamusTilesAnimation_AnimationDefinitions_DD60:
; 6A: Facing left  - normal jump - aiming up-left
    db $00,$1B,$01,$0B, $00,$1B,$00,$14                                  ;92DD60;

SamusTilesAnimation_AnimationDefinitions_DD68:
; 6B: Facing right - normal jump - aiming down-right
; B0: Unused
    db $00,$0C,$01,$0A, $00,$0C,$01,$19                                  ;92DD68;

SamusTilesAnimation_AnimationDefinitions_DD70:
; 6C: Facing left  - normal jump - aiming down-left
; B1: Unused
    db $00,$0D,$01,$0B, $00,$0D,$01,$1A                                  ;92DD70;

SamusTilesAnimation_AnimationDefinitions_DD78:
; 4B: Facing right - normal jump transition
    db $02,$00,$01,$06                                                   ;92DD78;

SamusTilesAnimation_AnimationDefinitions_DD7C:
; 4C: Facing left  - normal jump transition
    db $02,$01,$01,$07                                                   ;92DD7C;

SamusTilesAnimation_AnimationDefinitions_DD80:
; 55: Facing right - normal jump transition - aiming up
; F1: Facing right - crouching transition - aiming up
; F7: Facing right - standing transition - aiming up
    db $00,$16,$01,$06                                                   ;92DD80;

SamusTilesAnimation_AnimationDefinitions_DD84:
; 56: Facing left  - normal jump transition - aiming up
; F2: Facing left  - crouching transition - aiming up
; F8: Facing left  - standing transition - aiming up
    db $00,$17,$01,$07                                                   ;92DD84;

SamusTilesAnimation_AnimationDefinitions_DD88:
; 57: Facing right - normal jump transition - aiming up-right
; F3: Facing right - crouching transition - aiming up-right
; F9: Facing right - standing transition - aiming up-right
    db $00,$12,$01,$06                                                   ;92DD88;

SamusTilesAnimation_AnimationDefinitions_DD8C:
; 58: Facing left  - normal jump transition - aiming up-left
; F4: Facing left  - crouching transition - aiming up-left
; FA: Facing left  - standing transition - aiming up-left
    db $00,$13,$01,$07                                                   ;92DD8C;

SamusTilesAnimation_AnimationDefinitions_DD90:
; 59: Facing right - normal jump transition - aiming down-right
; F5: Facing right - crouching transition - aiming down-right
; FB: Facing right - standing transition - aiming down-right
    db $00,$0E,$01,$06                                                   ;92DD90;

SamusTilesAnimation_AnimationDefinitions_DD94:
; 5A: Facing left  - normal jump transition - aiming down-left
; F6: Facing left  - crouching transition - aiming down-left
; FC: Facing left  - standing transition - aiming down-left
    db $00,$0F,$01,$07                                                   ;92DD94;

SamusTilesAnimation_AnimationDefinitions_DD98:
; 4D: Facing right - normal jump - not aiming - not moving - gun not extended
; C7: Facing right - vertical shinespark windup
    db $00,$04,$00,$03, $00,$05,$01,$0E, $00,$04,$01,$08, $00,$00,$01,$08 ;92DD98;
    db $00,$01,$01,$0A, $00,$14,$01,$0C                                  ;92DDA8;

SamusTilesAnimation_AnimationDefinitions_DDB0:
; 4E: Facing left  - normal jump - not aiming - not moving - gun not extended
; C8: Facing left  - vertical shinespark windup
    db $00,$0A,$00,$03, $00,$0B,$01,$0F, $00,$0A,$01,$09, $00,$06,$01,$09 ;92DDB0;
    db $00,$07,$01,$0B, $00,$15,$01,$0D                                  ;92DDC0;

SamusTilesAnimation_AnimationDefinitions_DDC8:
; 4F: Facing left  - damage boost
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
; 28: Facing left  - crouching
; B5: Unused
    db $07,$0F,$00,$07, $07,$10,$00,$07, $07,$11,$00,$07, $07,$10,$00,$07 ;92DE3C;
    db $00,$00,$00,$00, $07,$0F,$00,$07, $07,$10,$00,$07, $07,$13,$00,$07 ;92DE4C;
    db $07,$10,$00,$07                                                   ;92DE5C;

SamusTilesAnimation_AnimationDefinitions_DE60:
; 29: Facing right - falling
    db $02,$04,$01,$0A, $02,$1C,$01,$0C, $02,$1D,$01,$0C, $00,$00,$00,$00 ;92DE60;
    db $00,$00,$00,$00, $02,$1C,$01,$0A, $02,$04,$01,$19                 ;92DE70;

SamusTilesAnimation_AnimationDefinitions_DE7C:
; 2A: Facing left  - falling
    db $02,$05,$01,$0B, $02,$1E,$01,$0D, $02,$1F,$01,$0D, $00,$00,$00,$00 ;92DE7C;
    db $00,$00,$00,$00, $02,$1E,$01,$0B, $02,$05,$01,$1A                 ;92DE8C;

SamusTilesAnimation_AnimationDefinitions_DE98:
; 2B: Facing right - falling - aiming up
    db $00,$12,$01,$0A, $00,$16,$01,$0C, $00,$16,$01,$19                 ;92DE98;

SamusTilesAnimation_AnimationDefinitions_DEA4:
; 2C: Facing left  - falling - aiming up
    db $00,$13,$01,$0B, $00,$17,$01,$0D, $00,$17,$01,$1A                 ;92DEA4;

SamusTilesAnimation_AnimationDefinitions_DEB0:
; 2D: Facing right - falling - aiming down
    db $00,$0C,$01,$0A, $01,$1A,$01,$11                                  ;92DEB0;

SamusTilesAnimation_AnimationDefinitions_DEB8:
; 2E: Facing left  - falling - aiming down
    db $00,$0D,$01,$0B, $01,$1B,$01,$12                                  ;92DEB8;

SamusTilesAnimation_AnimationDefinitions_DEC0:
; 67: Facing right - falling - gun extended
    db $00,$10,$01,$0A, $00,$10,$01,$0C, $00,$10,$01,$0C, $00,$00,$00,$00 ;92DEC0;
    db $00,$00,$00,$00, $00,$10,$01,$0A, $00,$10,$01,$19                 ;92DED0;

SamusTilesAnimation_AnimationDefinitions_DEDC:
; 68: Facing left  - falling - gun extended
    db $00,$11,$01,$0B, $00,$11,$01,$0D, $00,$11,$01,$0D, $00,$00,$00,$00 ;92DEDC;
    db $00,$00,$00,$00, $00,$11,$01,$0B, $00,$11,$01,$1A                 ;92DEEC;

SamusTilesAnimation_AnimationDefinitions_DEF8:
; 6D: Facing right - falling - aiming up-right
    db $00,$1A,$01,$0A, $00,$1A,$01,$0C, $00,$1A,$01,$19                 ;92DEF8;

SamusTilesAnimation_AnimationDefinitions_DF04:
; 6E: Facing left  - falling - aiming up-left
    db $00,$1B,$01,$0B, $00,$1B,$01,$0D, $00,$1B,$01,$1A                 ;92DF04;

SamusTilesAnimation_AnimationDefinitions_DF10:
; 6F: Facing right - falling - aiming down-right
    db $00,$0C,$01,$0A, $00,$0C,$01,$0C, $00,$0C,$01,$19                 ;92DF10;

SamusTilesAnimation_AnimationDefinitions_DF1C:
; 70: Facing left  - falling - aiming down-left
    db $00,$0D,$01,$0B, $00,$0D,$01,$0D, $00,$0D,$01,$1A                 ;92DF1C;

SamusTilesAnimation_AnimationDefinitions_DF28:
; 0D: Moving right - aiming up (unused)
    db $00,$16,$00,$00, $00,$16,$00,$08, $02,$0E,$00,$01, $02,$1E,$00,$09 ;92DF28;
    db $02,$0E,$00,$02, $00,$16,$00,$03, $00,$16,$00,$0A, $02,$0E,$00,$04 ;92DF38;
    db $02,$1E,$00,$0B, $02,$0E,$00,$05                                  ;92DF48;

SamusTilesAnimation_AnimationDefinitions_DF50:
; 0E: Moving left  - aiming up (unused)
    db $00,$17,$00,$00, $00,$17,$00,$08, $02,$0F,$00,$01, $02,$1F,$00,$09 ;92DF50;
    db $02,$0F,$00,$02, $00,$17,$00,$03, $00,$17,$00,$0A, $02,$0F,$00,$04 ;92DF60;
    db $02,$1F,$00,$0B, $02,$0F,$00,$05                                  ;92DF70;

SamusTilesAnimation_AnimationDefinitions_DF78:
; 0F: Moving right - aiming up-right
    db $00,$1A,$00,$00, $00,$1A,$00,$08, $02,$10,$00,$01, $02,$16,$00,$09 ;92DF78;
    db $02,$10,$00,$02, $00,$1A,$00,$03, $00,$1A,$00,$0A, $02,$10,$00,$04 ;92DF88;
    db $02,$16,$00,$0B, $02,$10,$00,$05                                  ;92DF98;

SamusTilesAnimation_AnimationDefinitions_DFA0:
; 10: Moving left  - aiming up-left
    db $00,$1B,$00,$00, $00,$1B,$00,$08, $02,$11,$00,$01, $02,$17,$00,$09 ;92DFA0;
    db $02,$11,$00,$02, $00,$1B,$00,$03, $00,$1B,$00,$0A, $02,$11,$00,$04 ;92DFB0;
    db $02,$17,$00,$0B, $02,$11,$00,$05                                  ;92DFC0;

SamusTilesAnimation_AnimationDefinitions_DFC8:
; 11: Moving right - aiming down-right
    db $00,$0C,$00,$00, $00,$0C,$00,$08, $02,$06,$00,$01, $02,$18,$00,$09 ;92DFC8;
    db $02,$06,$00,$02, $00,$0C,$00,$03, $00,$0C,$00,$0A, $02,$06,$00,$04 ;92DFD8;
    db $02,$18,$00,$0B, $02,$06,$00,$05                                  ;92DFE8;

SamusTilesAnimation_AnimationDefinitions_DFF0:
; 12: Moving left  - aiming down-left
    db $00,$0D,$00,$00, $00,$0D,$00,$08, $02,$07,$00,$01, $02,$19,$00,$09 ;92DFF0;
    db $02,$07,$00,$02, $00,$0D,$00,$03, $00,$0D,$00,$0A, $02,$07,$00,$04 ;92E000;
    db $02,$19,$00,$0B, $02,$07,$00,$05                                  ;92E010;

SamusTilesAnimation_AnimationDefinitions_E018:
; 03: Facing right - aiming up
    db $00,$12,$0A,$00, $00,$16,$0A,$00                                  ;92E018;

SamusTilesAnimation_AnimationDefinitions_E020:
; 04: Facing left  - aiming up
    db $00,$13,$0A,$01, $00,$17,$0A,$01                                  ;92E020;

SamusTilesAnimation_AnimationDefinitions_E028:
; 05: Facing right - aiming up-right
; CF: Facing right - ran into a wall - aiming up-right
    db $00,$12,$0A,$00                                                   ;92E028;

SamusTilesAnimation_AnimationDefinitions_E02C:
; 06: Facing left  - aiming up-left
; D0: Facing left  - ran into a wall - aiming up-left
    db $00,$13,$0A,$01                                                   ;92E02C;

SamusTilesAnimation_AnimationDefinitions_E030:
; 07: Facing right - aiming down-right
; AA: Unused
; D1: Facing right - ran into a wall - aiming down-right
    db $00,$0E,$0A,$00                                                   ;92E030;

SamusTilesAnimation_AnimationDefinitions_E034:
; 08: Facing left  - aiming down-left
; AB: Unused
; D2: Facing left  - ran into a wall - aiming down-left
    db $00,$0F,$0A,$01                                                   ;92E034;

SamusTilesAnimation_AnimationDefinitions_E038:
; 53: Facing right - knockback
    db $00,$1D,$01,$0C, $00,$1D,$01,$1B                                  ;92E038;

SamusTilesAnimation_AnimationDefinitions_E040:
; 54: Facing left  - knockback
    db $00,$1C,$01,$0D, $00,$1C,$01,$1C                                  ;92E040;

SamusTilesAnimation_AnimationDefinitions_E048:
; 45: Unused
; 46: Unused
; 5B: Unused
; B8: Facing left  - grapple wall jump pose
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
; B2: Facing clockwise     - grapple
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
; 84: Facing left  - wall jump
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
; 72: Facing left  - crouching - aiming up-left
    db $00,$13,$00,$07                                                   ;92E434;

SamusTilesAnimation_AnimationDefinitions_E438:
; 73: Facing right - crouching - aiming down-right
; B6: Unused
    db $00,$0E,$00,$07                                                   ;92E438;

SamusTilesAnimation_AnimationDefinitions_E43C:
; 74: Facing left  - crouching - aiming down-left
; B7: Unused
    db $00,$0F,$00,$07                                                   ;92E43C;

SamusTilesAnimation_AnimationDefinitions_E440:
; 85: Facing right - crouching - aiming up
    db $00,$12,$00,$07, $00,$16,$00,$07                                  ;92E440;

SamusTilesAnimation_AnimationDefinitions_E448:
; 86: Facing left  - crouching - aiming up
    db $00,$13,$00,$07, $00,$17,$00,$07                                  ;92E448;

SamusTilesAnimation_AnimationDefinitions_E450:
; 75: Facing left  - moonwalk - aiming up-left
    db $00,$1B,$01,$03, $02,$11,$01,$04, $02,$11,$01,$17, $00,$1B,$01,$00 ;92E450;
    db $02,$11,$01,$05, $02,$11,$01,$18                                  ;92E460;

SamusTilesAnimation_AnimationDefinitions_E468:
; 76: Facing right - moonwalk - aiming up-right
    db $00,$1A,$01,$03, $02,$10,$01,$04, $02,$10,$01,$17, $00,$1A,$01,$00 ;92E468;
    db $02,$10,$01,$05, $02,$10,$01,$18                                  ;92E478;

SamusTilesAnimation_AnimationDefinitions_E480:
; 77: Facing left  - moonwalk - aiming down-left
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
; 36: Facing left  - crouching transition
; 3C: Facing left  - standing transition
    db $00,$11,$01,$07                                                   ;92E4B4;

SamusTilesAnimation_AnimationDefinitions_E4B8:
; 37: Facing right - morphing transition
    db $0B,$06,$00,$00, $0B,$05,$00,$00                                  ;92E4B8;

SamusTilesAnimation_AnimationDefinitions_E4C0:
; 38: Facing left  - morphing transition
    db $0B,$04,$00,$00, $0B,$03,$00,$00                                  ;92E4C0;

SamusTilesAnimation_AnimationDefinitions_E4C8:
; 3D: Facing right - unmorphing transition
    db $0B,$05,$00,$00, $0B,$06,$00,$00                                  ;92E4C8;

SamusTilesAnimation_AnimationDefinitions_E4D0:
; 3E: Facing left  - unmorphing transition
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
; 32: Facing left  - morph ball - no springball - in air
; 3F: Unused
; 40: Unused
    db $0A,$00,$00,$00, $0A,$04,$00,$00, $0A,$01,$00,$00, $0A,$05,$00,$00 ;92E508;
    db $0A,$02,$00,$00, $0A,$06,$00,$00, $0A,$03,$00,$00, $0A,$07,$00,$00 ;92E518;
    db $00,$00,$00,$00, $0B,$01,$00,$00                                  ;92E528;

SamusTilesAnimation_AnimationDefinitions_E530:
; 41: Facing left  - morph ball - no springball - on ground
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
; 1F: Moving left  - morph ball - no springball - on ground
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
; 7A: Facing left  - morph ball - spring ball - on ground
; 7C: Moving left  - morph ball - spring ball - on ground
; 7E: Facing left  - morph ball - spring ball - falling
; 80: Facing left  - morph ball - spring ball - in air
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
; 1A: Facing left  - spin jump
    db $02,$05,$01,$1A, $0A,$08,$00,$00, $0A,$09,$00,$00, $0A,$0A,$00,$00 ;92E628;
    db $0A,$0B,$00,$00, $0A,$0C,$00,$00, $0A,$0D,$00,$00, $0A,$0E,$00,$00 ;92E638;
    db $0A,$0F,$00,$00, $00,$00,$00,$00, $00,$00,$00,$00, $01,$1D,$00,$1F ;92E648;

SamusTilesAnimation_AnimationDefinitions_E658:
; 1B: Facing right - space jump
    db $02,$04,$01,$19, $0A,$14,$09,$00, $0A,$14,$09,$01, $0A,$14,$09,$02 ;92E658;
    db $0A,$14,$09,$03, $0A,$14,$09,$04, $0A,$14,$09,$05, $0A,$14,$09,$06 ;92E668;
    db $0A,$14,$09,$07, $00,$00,$00,$00, $00,$00,$00,$00, $01,$1C,$00,$1E ;92E678;

SamusTilesAnimation_AnimationDefinitions_E688:
; 1C: Facing left  - space jump
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
; 82: Facing left  - screw attack
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
; 26: Facing left  - turning - standing
; C0: Facing left  - moonwalking - turn/jump right
    db $01,$06,$00,$15, $01,$0A,$01,$01, $01,$07,$00,$16                 ;92E7A4;

SamusTilesAnimation_AnimationDefinitions_E7B0:
; 8B: Facing right - turning - standing - aiming up
; 9C: Facing right - turning - standing - aiming up-right
; C1: Facing right - moonwalking - turn/jump left  - aiming up-right
    db $01,$09,$00,$16, $01,$02,$01,$01, $01,$08,$00,$15                 ;92E7B0;

SamusTilesAnimation_AnimationDefinitions_E7BC:
; 8C: Facing left  - turning - standing - aiming up
; 9D: Facing left  - turning - standing - aiming up-left
; C2: Facing left  - moonwalking - turn/jump right - aiming up-left
    db $01,$08,$00,$15, $01,$02,$01,$01, $01,$09,$00,$16                 ;92E7BC;

SamusTilesAnimation_AnimationDefinitions_E7C8:
; 8D: Facing right - turning - standing - aiming down-right
; C3: Facing right - moonwalking - turn/jump left  - aiming down-right
    db $01,$19,$00,$16, $01,$03,$01,$01, $01,$18,$00,$15                 ;92E7C8;

SamusTilesAnimation_AnimationDefinitions_E7D4:
; 8E: Facing left  - turning - standing - aiming down-left
; C4: Facing left  - moonwalking - turn/jump right - aiming down-left
    db $01,$18,$00,$15, $01,$03,$01,$01, $01,$19,$00,$16                 ;92E7D4;

SamusTilesAnimation_AnimationDefinitions_E7E0:
; 2F: Facing right - turning - jumping
; 43: Facing right - turning - crouching
; 87: Facing right - turning - falling
    db $01,$07,$00,$18, $01,$0A,$01,$02, $01,$06,$00,$17                 ;92E7E0;

SamusTilesAnimation_AnimationDefinitions_E7EC:
; 30: Facing left  - turning - jumping
; 44: Facing left  - turning - crouching
; 88: Facing left  - turning - falling
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
; 90: Facing left  - turning - in air - aiming up
; 94: Facing left  - turning - falling - aiming up
; 98: Facing left  - turning - crouching - aiming up
; 9F: Facing left  - turning - in air - aiming up-left
; A1: Facing left  - turning - falling - aiming up-left
; A3: Facing left  - turning - crouching - aiming up-left
    db $01,$08,$00,$17, $01,$02,$01,$02, $01,$09,$00,$18                 ;92E804;

SamusTilesAnimation_AnimationDefinitions_E810:
; 91: Facing right - turning - in air - aiming down/down-right
; 95: Facing right - turning - falling - aiming down/down-right
; 99: Facing right - turning - crouching - aiming down/down-right
    db $01,$19,$00,$18, $01,$03,$01,$02, $01,$18,$00,$17                 ;92E810;

SamusTilesAnimation_AnimationDefinitions_E81C:
; 92: Facing left  - turning - in air - aiming down/down-left
; 96: Facing left  - turning - falling - aiming down/down-left
; 9A: Facing left  - turning - crouching - aiming down/down-left
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
; BA: Facing left  - grabbed by Draygon - not moving - not aiming
    db $02,$05,$01,$1C                                                   ;92E838;

SamusTilesAnimation_AnimationDefinitions_E83C:
; BB: Facing left  - grabbed by Draygon - not moving - aiming up-left
    db $00,$1B,$01,$1C                                                   ;92E83C;

SamusTilesAnimation_AnimationDefinitions_E840:
; BC: Facing left  - grabbed by Draygon - firing
    db $00,$11,$01,$1C                                                   ;92E840;

SamusTilesAnimation_AnimationDefinitions_E844:
; BD: Facing left  - grabbed by Draygon - not moving - aiming down-left
    db $00,$0D,$01,$1C                                                   ;92E844;

SamusTilesAnimation_AnimationDefinitions_E848:
; F0: Facing right - grabbed by Draygon - moving
    db $00,$01,$01,$0C, $00,$02,$01,$1B, $00,$00,$01,$19, $00,$04,$01,$0C ;92E848;
    db $00,$05,$01,$0E, $00,$00,$01,$08                                  ;92E858;

SamusTilesAnimation_AnimationDefinitions_E860:
; BE: Facing left  - grabbed by Draygon - moving
    db $00,$07,$01,$0D, $00,$08,$01,$1C, $00,$06,$01,$1A, $00,$0A,$01,$0D ;92E860;
    db $00,$0B,$01,$0F, $00,$06,$01,$09                                  ;92E870;

SamusTilesAnimation_AnimationDefinitions_E878:
; CB: Facing right - shinespark - vertical
    db $0C,$00,$00,$00                                                   ;92E878;

SamusTilesAnimation_AnimationDefinitions_E87C:
; CC: Facing left  - shinespark - vertical
    db $0C,$01,$00,$00                                                   ;92E87C;

SamusTilesAnimation_AnimationDefinitions_E880:
; C9: Facing right - shinespark - horizontal
    db $01,$14,$00,$1B                                                   ;92E880;

SamusTilesAnimation_AnimationDefinitions_E884:
; CA: Facing left  - shinespark - horizontal
    db $01,$15,$00,$1C                                                   ;92E884;

SamusTilesAnimation_AnimationDefinitions_E888:
; CD: Facing right - shinespark - diagonal
    db $01,$14,$00,$1B                                                   ;92E888;

SamusTilesAnimation_AnimationDefinitions_E88C:
; CE: Facing left  - shinespark - diagonal
    db $01,$15,$00,$1C                                                   ;92E88C;

SamusTilesAnimation_AnimationDefinitions_E890:
; D3: Facing right - crystal flash
    db $0B,$05,$07,$00, $0B,$06,$07,$01, $0C,$05,$07,$02, $0B,$06,$07,$02 ;92E890;
    db $00,$00,$00,$00, $00,$00,$00,$00, $0C,$05,$07,$02, $0C,$06,$07,$02 ;92E8A0;
    db $0C,$07,$07,$02, $0C,$06,$07,$02, $00,$00,$00,$00, $00,$00,$00,$00 ;92E8B0;
    db $0B,$06,$07,$01, $0B,$06,$07,$00, $00,$10,$01,$06                 ;92E8C0;

SamusTilesAnimation_AnimationDefinitions_E8CC:
; D4: Facing left  - crystal flash
    db $0B,$03,$07,$00, $0B,$04,$07,$01, $0C,$02,$07,$02, $0B,$04,$07,$02 ;92E8CC;
    db $00,$00,$00,$00, $00,$00,$00,$00, $0C,$02,$07,$02, $0C,$03,$07,$02 ;92E8DC;
    db $0C,$04,$07,$02, $0C,$03,$07,$02, $00,$00,$00,$00, $00,$00,$00,$00 ;92E8EC;
    db $0B,$04,$07,$01, $0B,$04,$07,$00, $00,$11,$01,$07                 ;92E8FC;

SamusTilesAnimation_AnimationDefinitions_E908:
; D7: Facing right - crystal flash ending
    db $0A,$00,$01,$06, $0B,$05,$01,$06, $0B,$06,$01,$06, $00,$10,$01,$06 ;92E908;
    db $00,$1D,$01,$0C, $00,$1D,$01,$1B                                  ;92E918;

SamusTilesAnimation_AnimationDefinitions_E920:
; D8: Facing left  - crystal flash ending
    db $0A,$1F,$01,$06, $0B,$03,$01,$06, $0B,$04,$01,$06, $00,$11,$01,$07 ;92E920;
    db $00,$1C,$01,$0D, $00,$1C,$01,$1C                                  ;92E930;

SamusTilesAnimation_AnimationDefinitions_E938:
; E8: Facing right - Samus drained - crouching
    db $0A,$00,$01,$06, $0B,$05,$01,$06, $0B,$06,$01,$06, $00,$1D,$01,$0C ;92E938;
    db $00,$1D,$01,$0C, $00,$1D,$01,$0C, $00,$1D,$01,$0C, $00,$1D,$01,$0C ;92E948;
    db $07,$03,$01,$1F, $07,$04,$01,$1F, $07,$05,$01,$1F, $07,$04,$01,$1F ;92E958;
    db $00,$00,$00,$00, $00,$00,$00,$00, $00,$10,$01,$06                 ;92E968;

SamusTilesAnimation_AnimationDefinitions_E974:
; E9: Facing left  - Samus drained - crouching
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
; EB: Facing left  - Samus drained - standing
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

PlaySamusFanfare:
    PHP                                                                  ;92ED24;
    PHB                                                                  ;92ED25;
    PHK                                                                  ;92ED26;
    PLB                                                                  ;92ED27;
    REP #$30                                                             ;92ED28;
    LDA.W $0DEC                                                          ;92ED2A;
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
    LDA.W $0DEC                                                          ;92ED49;
    INC A                                                                ;92ED4C;
    CMP.W #$0168                                                         ;92ED4D;
    BPL .greaterThanEqualTo168                                           ;92ED50;
    STA.W $0DEC                                                          ;92ED52;
    BRA .return                                                          ;92ED55;


.greaterThanEqualTo168:
    LDA.W $0A20                                                          ;92ED57;
    STA.W $0A24                                                          ;92ED5A;
    LDA.W $0A22                                                          ;92ED5D;
    STA.W $0A26                                                          ;92ED60;
    LDA.W $0A1C                                                          ;92ED63;
    STA.W $0A20                                                          ;92ED66;
    LDA.W $0A1E                                                          ;92ED69;
    STA.W $0A22                                                          ;92ED6C;
    STZ.W $0DEC                                                          ;92ED6F;
    PLB                                                                  ;92ED72;
    PLP                                                                  ;92ED73;
    SEC                                                                  ;92ED74;
    RTL                                                                  ;92ED75;


.return:
    PLB                                                                  ;92ED76;
    PLP                                                                  ;92ED77;
    CLC                                                                  ;92ED78;
    RTL                                                                  ;92ED79;


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
    INC A                                                                ;92ED90;
    LDX.W #$00C0                                                         ;92ED91;
    LDY.W #$0040                                                         ;92ED94;
    JSL.L AddSamusSpritemapToOAM                                         ;92ED97;
    LDA.W #$0182                                                         ;92ED9B;
    INC A                                                                ;92ED9E;
    INC A                                                                ;92ED9F;
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


DrawSamusSuitExploding:
    PHP                                                                  ;92EDBE;
    PHB                                                                  ;92EDBF;
    PHK                                                                  ;92EDC0;
    PLB                                                                  ;92EDC1;
    REP #$30                                                             ;92EDC2;
    LDA.W $0A1E                                                          ;92EDC4;
    AND.W #$00FF                                                         ;92EDC7;
    CMP.W #$0004                                                         ;92EDCA;
    BEQ .facingLeft                                                      ;92EDCD;
    LDA.W #$081C                                                         ;92EDCF;
    CLC                                                                  ;92EDD2;
    ADC.W $0DE4                                                          ;92EDD3;
    STA.B $12                                                            ;92EDD6;
    BRA +                                                                ;92EDD8;


.facingLeft:
    LDA.W #$0825                                                         ;92EDDA;
    CLC                                                                  ;92EDDD;
    ADC.W $0DE4                                                          ;92EDDE;
    STA.B $12                                                            ;92EDE1;

  + LDA.W $0AF6                                                          ;92EDE3;
    TAX                                                                  ;92EDE6;
    LDA.W $0AFA                                                          ;92EDE7;
    TAY                                                                  ;92EDEA;
    LDA.B $12                                                            ;92EDEB;
    JSL.L AddSamusSpritemapToOAM                                         ;92EDED;
    PLB                                                                  ;92EDF1;
    PLP                                                                  ;92EDF2;
    RTL                                                                  ;92EDF3;


Freespace_Bank92_EDF4:                                                   ;92EDF4;
; $120C bytes
