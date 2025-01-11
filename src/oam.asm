MapOfOAMIndex:
  .highXPosBit
    dw $0001                                                             ;81839F;
  .sizeBit
    dw       $0002                                                       ;8183A1;
    dw              $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000

MapOfOAMIndexToHighOAM:
  .address
    dw $0570                                                             ;81859F;
  .bitmask
    dw       $0003                                                       ;8185A1;
    dw              $0570,$000C, $0570,$0030, $0570,$00C0
    dw $0570,$0300, $0570,$0C00, $0570,$3000, $0570,$C000
    dw $0572,$0003, $0572,$000C, $0572,$0030, $0572,$00C0
    dw $0572,$0300, $0572,$0C00, $0572,$3000, $0572,$C000
    dw $0574,$0003, $0574,$000C, $0574,$0030, $0574,$00C0
    dw $0574,$0300, $0574,$0C00, $0574,$3000, $0574,$C000
    dw $0576,$0003, $0576,$000C, $0576,$0030, $0576,$00C0
    dw $0576,$0300, $0576,$0C00, $0576,$3000, $0576,$C000
    dw $0578,$0003, $0578,$000C, $0578,$0030, $0578,$00C0
    dw $0578,$0300, $0578,$0C00, $0578,$3000, $0578,$C000
    dw $057A,$0003, $057A,$000C, $057A,$0030, $057A,$00C0
    dw $057A,$0300, $057A,$0C00, $057A,$3000, $057A,$C000
    dw $057C,$0003, $057C,$000C, $057C,$0030, $057C,$00C0
    dw $057C,$0300, $057C,$0C00, $057C,$3000, $057C,$C000
    dw $057E,$0003, $057E,$000C, $057E,$0030, $057E,$00C0
    dw $057E,$0300, $057E,$0C00, $057E,$3000, $057E,$C000
    dw $0580,$0003, $0580,$000C, $0580,$0030, $0580,$00C0
    dw $0580,$0300, $0580,$0C00, $0580,$3000, $0580,$C000
    dw $0582,$0003, $0582,$000C, $0582,$0030, $0582,$00C0
    dw $0582,$0300, $0582,$0C00, $0582,$3000, $0582,$C000
    dw $0584,$0003, $0584,$000C, $0584,$0030, $0584,$00C0
    dw $0584,$0300, $0584,$0C00, $0584,$3000, $0584,$C000
    dw $0586,$0003, $0586,$000C, $0586,$0030, $0586,$00C0
    dw $0586,$0300, $0586,$0C00, $0586,$3000, $0586,$C000
    dw $0588,$0003, $0588,$000C, $0588,$0030, $0588,$00C0
    dw $0588,$0300, $0588,$0C00, $0588,$3000, $0588,$C000
    dw $058A,$0003, $058A,$000C, $058A,$0030, $058A,$00C0
    dw $058A,$0300, $058A,$0C00, $058A,$3000, $058A,$C000
    dw $058C,$0003, $058C,$000C, $058C,$0030, $058C,$00C0
    dw $058C,$0300, $058C,$0C00, $058C,$3000, $058C,$C000
    dw $058E,$0003, $058E,$000C, $058E,$0030, $058E,$00C0
    dw $058E,$0300, $058E,$0C00, $058E,$3000, $058E,$C000      

AddSpritemapToOAM:
    PHX                                                                  ;81879F;
    LDA.W $0000,Y                                                        ;8187A0;
    BNE +                                                                ;8187A3;
    PLX                                                                  ;8187A5;
    RTL                                                                  ;8187A6;


.gotoReturn:
    JMP.W .return                                                        ;8187A7;


  + STA.B $18                                                            ;8187AA;
    INY                                                                  ;8187AC;
    INY                                                                  ;8187AD;
    LDA.W $0590                                                          ;8187AE;
    BIT.W #$FE00                                                         ;8187B1;
    BNE .gotoReturn                                                      ;8187B4;
    TAX                                                                  ;8187B6;
    CLC                                                                  ;8187B7;

.loop:
    LDA.W $0000,Y                                                        ;8187B8;
    ADC.B $14                                                            ;8187BB;
    STA.W $0370,X                                                        ;8187BD;
    AND.W #$0100                                                         ;8187C0;
    BEQ .xHighClear                                                      ;8187C3;
    LDA.W $0000,Y                                                        ;8187C5;
    BPL +                                                                ;8187C8;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8187CA;
    STA.B $1C                                                            ;8187CE;
    LDA.B ($1C)                                                          ;8187D0;
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X                               ;8187D2;
    STA.B ($1C)                                                          ;8187D6;
    JMP.W .merge                                                         ;8187D8;


  + LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8187DB;
    STA.B $1C                                                            ;8187DF;
    LDA.B ($1C)                                                          ;8187E1;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;8187E3;
    STA.B ($1C)                                                          ;8187E7;
    BRA .merge                                                           ;8187E9;


.xHighClear:
    LDA.W $0000,Y                                                        ;8187EB;
    BPL .merge                                                           ;8187EE;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8187F0;
    STA.B $1C                                                            ;8187F4;
    LDA.B ($1C)                                                          ;8187F6;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;8187F8;
    STA.B ($1C)                                                          ;8187FC;

.merge:
    SEP #$20                                                             ;8187FE;
    LDA.W $0002,Y                                                        ;818800;
    CLC                                                                  ;818803;
    BMI +                                                                ;818804;
    ADC.B $12                                                            ;818806;
    BCS .setOAMPos180h                                                   ;818808;
    CMP.B #$E0                                                           ;81880A;
    BCC .onScreen                                                        ;81880C;
    BRA .setOAMPos180h                                                   ;81880E;


  + ADC.B $12                                                            ;818810;
    BCS .lessThanE0h                                                     ;818812;
    CMP.B #$E0                                                           ;818814;
    BCS .onScreen                                                        ;818816;
    BRA .setOAMPos180h                                                   ;818818;


.lessThanE0h:
    CMP.B #$E0                                                           ;81881A;
    BCC .onScreen                                                        ;81881C;

.setOAMPos180h:
    JSR.W OAMEntry_XPosition_180h                                        ;81881E;
    LDA.B #$E0                                                           ;818821;

.onScreen:
    STA.W $0371,X                                                        ;818823;
    REP #$21                                                             ;818826;
    LDA.W $0003,Y                                                        ;818828;
    AND.W #$F1FF                                                         ;81882B;
    ORA.B $16                                                            ;81882E;
    STA.W $0372,X                                                        ;818830;
    TXA                                                                  ;818833;
    ADC.W #$0004                                                         ;818834;
    BIT.W #$FE00                                                         ;818837;
    BNE .return                                                          ;81883A;
    TAX                                                                  ;81883C;
    TYA                                                                  ;81883D;
    ADC.W #$0005                                                         ;81883E;
    TAY                                                                  ;818841;
    DEC.B $18                                                            ;818842;
    BEQ +                                                                ;818844;
    JMP.W .loop                                                          ;818846;


  + STX.W $0590                                                          ;818849;
    PLX                                                                  ;81884C;
    RTL                                                                  ;81884D;


.return:
    STA.W $0590                                                          ;81884E;
    PLX                                                                  ;818851;
    RTL                                                                  ;818852;


AddSpritemapToOAM_Offscreen:
    PHX                                                                  ;818853;
    LDA.W $0000,Y                                                        ;818854;
    BNE +                                                                ;818857;
    PLX                                                                  ;818859;
    RTL                                                                  ;81885A;


.goto_return:
    JMP.W .return                                                        ;81885B;


  + STA.B $18                                                            ;81885E;
    INY                                                                  ;818860;
    INY                                                                  ;818861;
    LDA.W $0590                                                          ;818862;
    BIT.W #$FE00                                                         ;818865;
    BNE .goto_return                                                     ;818868;
    TAX                                                                  ;81886A;
    CLC                                                                  ;81886B;

.loop:
    LDA.W $0000,Y                                                        ;81886C;
    ADC.B $14                                                            ;81886F;
    STA.W $0370,X                                                        ;818871;
    AND.W #$0100                                                         ;818874;
    BEQ .xHighClear                                                      ;818877;
    LDA.W $0000,Y                                                        ;818879;
    BPL +                                                                ;81887C;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81887E;
    STA.B $1C                                                            ;818882;
    LDA.B ($1C)                                                          ;818884;
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X                               ;818886;
    STA.B ($1C)                                                          ;81888A;
    JMP.W .merge                                                         ;81888C;


  + LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81888F;
    STA.B $1C                                                            ;818893;
    LDA.B ($1C)                                                          ;818895;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818897;
    STA.B ($1C)                                                          ;81889B;
    BRA .merge                                                           ;81889D;


.xHighClear:
    LDA.W $0000,Y                                                        ;81889F;
    BPL .merge                                                           ;8188A2;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8188A4;
    STA.B $1C                                                            ;8188A8;
    LDA.B ($1C)                                                          ;8188AA;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;8188AC;
    STA.B ($1C)                                                          ;8188B0;

.merge:
    SEP #$20                                                             ;8188B2;
    LDA.W $0002,Y                                                        ;8188B4;
    CLC                                                                  ;8188B7;
    BMI +                                                                ;8188B8;
    ADC.B $12                                                            ;8188BA;
    BCS .onScreen                                                        ;8188BC;
    CMP.B #$E0                                                           ;8188BE;
    BCS .onScreen                                                        ;8188C0;
    BRA .setOAMPos180h                                                   ;8188C2;


  + ADC.B $12                                                            ;8188C4;
    BCS .lessThanE0h                                                     ;8188C6;
    CMP.B #$E0                                                           ;8188C8;
    BCC .onScreen                                                        ;8188CA;
    BRA .setOAMPos180h                                                   ;8188CC;


.lessThanE0h:
    CMP.B #$E0                                                           ;8188CE;
    BCS .onScreen                                                        ;8188D0;

.setOAMPos180h:
    JSR.W OAMEntry_XPosition_180h                                        ;8188D2;
    LDA.B #$E0                                                           ;8188D5;

.onScreen:
    STA.W $0371,X                                                        ;8188D7;
    REP #$21                                                             ;8188DA;
    LDA.W $0003,Y                                                        ;8188DC;
    AND.W #$F1FF                                                         ;8188DF;
    ORA.B $16                                                            ;8188E2;
    STA.W $0372,X                                                        ;8188E4;
    TXA                                                                  ;8188E7;
    ADC.W #$0004                                                         ;8188E8;
    BIT.W #$FE00                                                         ;8188EB;
    BNE .return                                                          ;8188EE;
    TAX                                                                  ;8188F0;
    TYA                                                                  ;8188F1;
    ADC.W #$0005                                                         ;8188F2;
    TAY                                                                  ;8188F5;
    DEC.B $18                                                            ;8188F6;
    BEQ +                                                                ;8188F8;
    JMP.W .loop                                                          ;8188FA;


  + STX.W $0590                                                          ;8188FD;
    PLX                                                                  ;818900;
    RTL                                                                  ;818901;


.return:
    STA.W $0590                                                          ;818902;
    PLX                                                                  ;818905;
    RTL                                                                  ;818906;


OAMEntry_XPosition_180h:
    LDA.B #$80                                                           ;818907;
    STA.W $0370,X                                                        ;818909;
    REP #$20                                                             ;81890C;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81890E;
    STA.B $1C                                                            ;818912;
    LDA.B ($1C)                                                          ;818914;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818916;
    STA.B ($1C)                                                          ;81891A;
    SEP #$20                                                             ;81891C;
    RTS                                                                  ;81891E;


AddSpritemapFrom_82C569_TableToOAM:
    PHB                                                                  ;81891F;
    PEA.W $8200                                                          ;818920;
    PLB                                                                  ;818923;
    PLB                                                                  ;818924;
    STY.B $12                                                            ;818925;
    STX.B $14                                                            ;818927;
    ASL A                                                                ;818929;
    TAX                                                                  ;81892A;
    LDY.W MenuSpritemap_Pointers,X                                       ;81892B;
    LDA.W $0000,Y                                                        ;81892E;
    BEQ .return                                                          ;818931;
    STA.B $18                                                            ;818933;
    INY                                                                  ;818935;
    INY                                                                  ;818936;
    LDX.W $0590                                                          ;818937;
    CLC                                                                  ;81893A;

.loop:
    LDA.W $0000,Y                                                        ;81893B;
    ADC.B $14                                                            ;81893E;
    STA.W $0370,X                                                        ;818940;
    AND.W #$0100                                                         ;818943;
    BEQ .xHighClear                                                      ;818946;
    LDA.W $0000,Y                                                        ;818948;
    BPL .preMerge                                                        ;81894B;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81894D;
    STA.B $16                                                            ;818951;
    LDA.B ($16)                                                          ;818953;
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X                               ;818955;
    STA.B ($16)                                                          ;818959;
    JMP.W .merge                                                         ;81895B;


.preMerge:
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;81895E;
    STA.B $16                                                            ;818962;
    LDA.B ($16)                                                          ;818964;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818966;
    STA.B ($16)                                                          ;81896A;
    JMP.W .merge                                                         ;81896C;


.xHighClear:
    LDA.W $0000,Y                                                        ;81896F;
    BPL .merge                                                           ;818972;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818974;
    STA.B $16                                                            ;818978;
    LDA.B ($16)                                                          ;81897A;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;81897C;
    STA.B ($16)                                                          ;818980;

.merge:
    LDA.W $0002,Y                                                        ;818982;
    CLC                                                                  ;818985;
    ADC.B $12                                                            ;818986;
    STA.W $0371,X                                                        ;818988;
    LDA.W $0003,Y                                                        ;81898B;
    AND.W #$F1FF                                                         ;81898E;
    ORA.B $03                                                            ;818991;
    STA.W $0372,X                                                        ;818993;
    TYA                                                                  ;818996;
    CLC                                                                  ;818997;
    ADC.W #$0005                                                         ;818998;
    TAY                                                                  ;81899B;
    TXA                                                                  ;81899C;
    CLC                                                                  ;81899D;
    ADC.W #$0004                                                         ;81899E;
    AND.W #$01FF                                                         ;8189A1;
    TAX                                                                  ;8189A4;
    DEC.B $18                                                            ;8189A5;
    BNE .loop                                                            ;8189A7;
    STX.W $0590                                                          ;8189A9;

.return:
    PLB                                                                  ;8189AC;
    RTL                                                                  ;8189AD;


AddSamusSpritemapToOAM:
    PHB                                                                  ;8189AE;
    PEA.W $9200                                                          ;8189AF;
    PLB                                                                  ;8189B2;
    PLB                                                                  ;8189B3;
    STY.B $12                                                            ;8189B4;
    STX.B $14                                                            ;8189B6;
    ASL A                                                                ;8189B8;
    TAX                                                                  ;8189B9;
    LDY.W SamusSpritemapTable,X                                          ;8189BA;
    LDA.W $0000,Y                                                        ;8189BD;
    BEQ .return                                                          ;8189C0;
    STA.B $18                                                            ;8189C2;
    INY                                                                  ;8189C4;
    INY                                                                  ;8189C5;
    LDX.W $0590                                                          ;8189C6;
    CLC                                                                  ;8189C9;

.loop:
    LDA.W $0000,Y                                                        ;8189CA;
    ADC.B $14                                                            ;8189CD;
    STA.W $0370,X                                                        ;8189CF;
    AND.W #$0100                                                         ;8189D2;
    BEQ .xHighClear                                                      ;8189D5;
    LDA.W $0000,Y                                                        ;8189D7;
    BPL .preMerge                                                        ;8189DA;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8189DC;
    STA.B $16                                                            ;8189E0;
    LDA.B ($16)                                                          ;8189E2;
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X                               ;8189E4;
    STA.B ($16)                                                          ;8189E8;
    JMP.W .merge                                                         ;8189EA;


.preMerge:
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;8189ED;
    STA.B $16                                                            ;8189F1;
    LDA.B ($16)                                                          ;8189F3;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;8189F5;
    STA.B ($16)                                                          ;8189F9;
    JMP.W .merge                                                         ;8189FB;


.xHighClear:
    LDA.W $0000,Y                                                        ;8189FE;
    BPL .merge                                                           ;818A01;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818A03;
    STA.B $16                                                            ;818A07;
    LDA.B ($16)                                                          ;818A09;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818A0B;
    STA.B ($16)                                                          ;818A0F;

.merge:
    LDA.W $0002,Y                                                        ;818A11;
    CLC                                                                  ;818A14;
    ADC.B $12                                                            ;818A15;
    STA.W $0371,X                                                        ;818A17;
    LDA.W $0003,Y                                                        ;818A1A;
    STA.W $0372,X                                                        ;818A1D;
    TYA                                                                  ;818A20;
    CLC                                                                  ;818A21;
    ADC.W #$0005                                                         ;818A22;
    TAY                                                                  ;818A25;
    TXA                                                                  ;818A26;
    ADC.W #$0004                                                         ;818A27;
    AND.W #$01FF                                                         ;818A2A;
    TAX                                                                  ;818A2D;
    DEC.B $18                                                            ;818A2E;
    BNE .loop                                                            ;818A30;
    STX.W $0590                                                          ;818A32;

.return:
    PLB                                                                  ;818A35;
    RTL                                                                  ;818A36;


AddSpritemapFrom_93A1A1_TableToOAM:
    PHB                                                                  ;818A37;
    PEA.W $9300                                                          ;818A38;
    PLB                                                                  ;818A3B;
    PLB                                                                  ;818A3C;
    ASL A                                                                ;818A3D;
    TAX                                                                  ;818A3E;
    LDY.W FlareSpritemapPointers,X                                       ;818A3F;
    LDA.W $0000,Y                                                        ;818A42;
    STA.B $18                                                            ;818A45;
    INY                                                                  ;818A47;
    INY                                                                  ;818A48;
    BRA AddSpritemapToOAM_Common                                         ;818A49;


AddProjectileSpritemapToOAM:
    PHB                                                                  ;818A4B;
    PEA.W $9300                                                          ;818A4C;
    PLB                                                                  ;818A4F;
    PLB                                                                  ;818A50;
    LDY.W $0CB8,X                                                        ;818A51;
    LDA.W $0000,Y                                                        ;818A54;
    BNE +                                                                ;818A57;
    PLB                                                                  ;818A59;
    RTL                                                                  ;818A5A;


  + STA.B $18                                                            ;818A5B;
    INY                                                                  ;818A5D;
    INY                                                                  ;818A5E; fallthrough to AddSpritemapToOAM_Common

AddSpritemapToOAM_Common:
    LDX.W $0590                                                          ;818A5F;
    CLC                                                                  ;818A62;

.loop:
    LDA.W $0000,Y                                                        ;818A63;
    ADC.B $14                                                            ;818A66;
    STA.W $0370,X                                                        ;818A68;
    AND.W #$0100                                                         ;818A6B;
    BEQ +                                                                ;818A6E;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818A70;
    STA.B $16                                                            ;818A74;
    LDA.B ($16)                                                          ;818A76;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818A78;
    STA.B ($16)                                                          ;818A7C;

  + LDA.W $0000,Y                                                        ;818A7E;
    BPL +                                                                ;818A81;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818A83;
    STA.B $16                                                            ;818A87;
    LDA.B ($16)                                                          ;818A89;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818A8B;
    STA.B ($16)                                                          ;818A8F;

  + LDA.W $0002,Y                                                        ;818A91;
    CLC                                                                  ;818A94;
    ADC.B $12                                                            ;818A95;
    STA.W $0371,X                                                        ;818A97;
    LDA.W $0003,Y                                                        ;818A9A;
    STA.W $0372,X                                                        ;818A9D;
    TYA                                                                  ;818AA0;
    CLC                                                                  ;818AA1;
    ADC.W #$0005                                                         ;818AA2;
    TAY                                                                  ;818AA5;
    TXA                                                                  ;818AA6;
    ADC.W #$0004                                                         ;818AA7;
    AND.W #$01FF                                                         ;818AAA;
    TAX                                                                  ;818AAD;
    DEC.B $18                                                            ;818AAE;
    BNE .loop                                                            ;818AB0;
    STX.W $0590                                                          ;818AB2;
    PLB                                                                  ;818AB5;
    RTL                                                                  ;818AB6;


RTL_818AB7:
    RTL                                                                  ;818AB7;


AddSpritemapToOAM_WithBaseTileNumber_8AB8:
    PHY                                                                  ;818AB8;
    LDA.W $0000,Y                                                        ;818AB9;
    BEQ .return                                                          ;818ABC;
    INY                                                                  ;818ABE;
    INY                                                                  ;818ABF;
    STA.B $18                                                            ;818AC0;
    LDX.W $0590                                                          ;818AC2;
    CLC                                                                  ;818AC5;

.loop:
    LDA.W $0000,Y                                                        ;818AC6;
    ADC.B $14                                                            ;818AC9;
    STA.W $0370,X                                                        ;818ACB;
    AND.W #$0100                                                         ;818ACE;
    BEQ +                                                                ;818AD1;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818AD3;
    STA.B $16                                                            ;818AD7;
    LDA.B ($16)                                                          ;818AD9;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818ADB;
    STA.B ($16)                                                          ;818ADF;

  + LDA.W $0000,Y                                                        ;818AE1;
    BPL +                                                                ;818AE4;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818AE6;
    STA.B $16                                                            ;818AEA;
    LDA.B ($16)                                                          ;818AEC;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818AEE;
    STA.B ($16)                                                          ;818AF2;

  + SEP #$20                                                             ;818AF4;
    LDA.W $0002,Y                                                        ;818AF6;
    CLC                                                                  ;818AF9;
    ADC.B $12                                                            ;818AFA;
    STA.W $0371,X                                                        ;818AFC;
    REP #$21                                                             ;818AFF;
    LDA.W $0003,Y                                                        ;818B01;
    ADC.B $00                                                            ;818B04;
    ORA.B $03                                                            ;818B06;
    STA.W $0372,X                                                        ;818B08;
    TYA                                                                  ;818B0B;
    ADC.W #$0005                                                         ;818B0C;
    TAY                                                                  ;818B0F;
    TXA                                                                  ;818B10;
    ADC.W #$0004                                                         ;818B11;
    AND.W #$01FF                                                         ;818B14;
    TAX                                                                  ;818B17;
    DEC.B $18                                                            ;818B18;
    BNE .loop                                                            ;818B1A;
    STX.W $0590                                                          ;818B1C;

.return:
    PLY                                                                  ;818B1F;
    RTL                                                                  ;818B20;


RTL_818B21:
    RTL                                                                  ;818B21;


AddSpritemapToOAM_WithBaseTileNumber_8B22:
    PHY                                                                  ;818B22;
    LDA.W $0000,Y                                                        ;818B23;
    BEQ .return                                                          ;818B26;
    INY                                                                  ;818B28;
    INY                                                                  ;818B29;
    STA.B $18                                                            ;818B2A;
    LDX.W $0590                                                          ;818B2C;
    CLC                                                                  ;818B2F;

.loop:
    LDA.W $0000,Y                                                        ;818B30;
    ADC.B $14                                                            ;818B33;
    STA.W $0370,X                                                        ;818B35;
    AND.W #$0100                                                         ;818B38;
    BEQ +                                                                ;818B3B;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818B3D;
    STA.B $16                                                            ;818B41;
    LDA.B ($16)                                                          ;818B43;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818B45;
    STA.B ($16)                                                          ;818B49;

  + LDA.W $0000,Y                                                        ;818B4B;
    BPL +                                                                ;818B4E;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818B50;
    STA.B $16                                                            ;818B54;
    LDA.B ($16)                                                          ;818B56;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818B58;
    STA.B ($16)                                                          ;818B5C;

  + SEP #$20                                                             ;818B5E;
    LDA.W $0002,Y                                                        ;818B60;
    BMI +                                                                ;818B63;
    ADC.B $12                                                            ;818B65;
    BCC .onScreen                                                        ;818B67;
    BCS .yPosF0h                                                         ;818B69;

  + ADC.B $12                                                            ;818B6B;
    BCS .onScreen                                                        ;818B6D;

.yPosF0h:
    LDA.B #$F0                                                           ;818B6F;

.onScreen:
    STA.W $0371,X                                                        ;818B71;
    REP #$21                                                             ;818B74;
    LDA.W $0003,Y                                                        ;818B76;
    ADC.B $00                                                            ;818B79;
    ORA.B $03                                                            ;818B7B;
    STA.W $0372,X                                                        ;818B7D;
    TYA                                                                  ;818B80;
    ADC.W #$0005                                                         ;818B81;
    TAY                                                                  ;818B84;
    TXA                                                                  ;818B85;
    ADC.W #$0004                                                         ;818B86;
    AND.W #$01FF                                                         ;818B89;
    TAX                                                                  ;818B8C;
    DEC.B $18                                                            ;818B8D;
    BNE .loop                                                            ;818B8F;
    STX.W $0590                                                          ;818B91;

.return:
    PLY                                                                  ;818B94;
    RTL                                                                  ;818B95;


AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8B96:
    PHY                                                                  ;818B96;
    LDA.W $0000,Y                                                        ;818B97;
    BEQ .return                                                          ;818B9A;
    INY                                                                  ;818B9C;
    INY                                                                  ;818B9D;
    STA.B $18                                                            ;818B9E;
    LDX.W $0590                                                          ;818BA0;
    CLC                                                                  ;818BA3;

.loop:
    LDA.W $0000,Y                                                        ;818BA4;
    ADC.B $14                                                            ;818BA7;
    STA.W $0370,X                                                        ;818BA9;
    AND.W #$0100                                                         ;818BAC;
    BEQ +                                                                ;818BAF;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818BB1;
    STA.B $16                                                            ;818BB5;
    LDA.B ($16)                                                          ;818BB7;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818BB9;
    STA.B ($16)                                                          ;818BBD;

  + LDA.W $0000,Y                                                        ;818BBF;
    BPL +                                                                ;818BC2;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818BC4;
    STA.B $16                                                            ;818BC8;
    LDA.B ($16)                                                          ;818BCA;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818BCC;
    STA.B ($16)                                                          ;818BD0;

  + SEP #$20                                                             ;818BD2;
    LDA.W $0002,Y                                                        ;818BD4;
    BMI +                                                                ;818BD7;
    ADC.B $12                                                            ;818BD9;
    BCS .onScreen                                                        ;818BDB;
    BCC .yPosF0h                                                         ;818BDD;

  + ADC.B $12                                                            ;818BDF;
    BCC .onScreen                                                        ;818BE1;

.yPosF0h:
    LDA.B #$F0                                                           ;818BE3;

.onScreen:
    STA.W $0371,X                                                        ;818BE5;
    REP #$21                                                             ;818BE8;
    LDA.W $0003,Y                                                        ;818BEA;
    ADC.B $00                                                            ;818BED;
    ORA.B $03                                                            ;818BEF;
    STA.W $0372,X                                                        ;818BF1;
    TYA                                                                  ;818BF4;
    ADC.W #$0005                                                         ;818BF5;
    TAY                                                                  ;818BF8;
    TXA                                                                  ;818BF9;
    ADC.W #$0004                                                         ;818BFA;
    AND.W #$01FF                                                         ;818BFD;
    TAX                                                                  ;818C00;
    DEC.B $18                                                            ;818C01;
    BNE .loop                                                            ;818C03;
    STX.W $0590                                                          ;818C05;

.return:
    PLY                                                                  ;818C08;
    RTL                                                                  ;818C09;


AddSpritemapToOAM_WithBaseTileNumber_8C0A:
    LDA.W $0000,Y                                                        ;818C0A;
    BNE +                                                                ;818C0D;
    RTL                                                                  ;818C0F;


  + STA.B $18                                                            ;818C10;
    INY                                                                  ;818C12;
    INY                                                                  ;818C13;
    LDX.W $0590                                                          ;818C14;
    CLC                                                                  ;818C17;

.loop:
    LDA.W $0000,Y                                                        ;818C18;
    CLC                                                                  ;818C1B;
    ADC.B $14                                                            ;818C1C;
    STA.W $0370,X                                                        ;818C1E;
    BIT.W #$0100                                                         ;818C21;
    BEQ +                                                                ;818C24;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818C26;
    STA.B $16                                                            ;818C2A;
    LDA.B ($16)                                                          ;818C2C;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818C2E;
    STA.B ($16)                                                          ;818C32;

  + SEP #$20                                                             ;818C34;
    CLC                                                                  ;818C36;
    LDA.W $0002,Y                                                        ;818C37;
    BMI +                                                                ;818C3A;
    ADC.B $12                                                            ;818C3C;
    BCC .onScreen                                                        ;818C3E;
    BCS .yPosF0h                                                         ;818C40;

  + ADC.B $12                                                            ;818C42;
    BCS .onScreen                                                        ;818C44;

.yPosF0h:
    LDA.B #$F0                                                           ;818C46;

.onScreen:
    STA.W $0371,X                                                        ;818C48;
    REP #$21                                                             ;818C4B;
    LDA.W $0000,Y                                                        ;818C4D;
    BPL +                                                                ;818C50;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818C52;
    STA.B $16                                                            ;818C56;
    LDA.B ($16)                                                          ;818C58;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818C5A;
    STA.B ($16)                                                          ;818C5E;

  + LDA.W $0003,Y                                                        ;818C60;
    ADC.B $1A                                                            ;818C63;
    ORA.B $1C                                                            ;818C65;
    STA.W $0372,X                                                        ;818C67;
    TXA                                                                  ;818C6A;
    ADC.W #$0004                                                         ;818C6B;
    AND.W #$01FF                                                         ;818C6E;
    TAX                                                                  ;818C71;
    TYA                                                                  ;818C72;
    ADC.W #$0005                                                         ;818C73;
    TAY                                                                  ;818C76;
    DEC.B $18                                                            ;818C77;
    BNE .loop                                                            ;818C79;
    STX.W $0590                                                          ;818C7B;
    RTL                                                                  ;818C7E;


AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8C7F:
    LDA.W $0000,Y                                                        ;818C7F;
    BNE +                                                                ;818C82;
    RTL                                                                  ;818C84;


  + STA.B $18                                                            ;818C85;
    INY                                                                  ;818C87;
    INY                                                                  ;818C88;
    LDX.W $0590                                                          ;818C89;
    CLC                                                                  ;818C8C;

.loop:
    LDA.W $0000,Y                                                        ;818C8D;
    CLC                                                                  ;818C90;
    ADC.B $14                                                            ;818C91;
    STA.W $0370,X                                                        ;818C93;
    BIT.W #$0100                                                         ;818C96;
    BEQ +                                                                ;818C99;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818C9B;
    STA.B $16                                                            ;818C9F;
    LDA.B ($16)                                                          ;818CA1;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;818CA3;
    STA.B ($16)                                                          ;818CA7;

  + SEP #$20                                                             ;818CA9;
    CLC                                                                  ;818CAB;
    LDA.W $0002,Y                                                        ;818CAC;
    BMI +                                                                ;818CAF;
    ADC.B $12                                                            ;818CB1;
    BCS .onScreen                                                        ;818CB3;
    BCC .yPosF0h                                                         ;818CB5;

  + ADC.B $12                                                            ;818CB7;
    BCC .onScreen                                                        ;818CB9;

.yPosF0h:
    LDA.B #$F0                                                           ;818CBB;

.onScreen:
    STA.W $0371,X                                                        ;818CBD;
    REP #$21                                                             ;818CC0;
    LDA.W $0000,Y                                                        ;818CC2;
    BPL +                                                                ;818CC5;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;818CC7;
    STA.B $16                                                            ;818CCB;
    LDA.B ($16)                                                          ;818CCD;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;818CCF;
    STA.B ($16)                                                          ;818CD3;

  + LDA.W $0003,Y                                                        ;818CD5;
    ADC.B $1A                                                            ;818CD8;
    ORA.B $1C                                                            ;818CDA;
    STA.W $0372,X                                                        ;818CDC;
    TXA                                                                  ;818CDF;
    ADC.W #$0004                                                         ;818CE0;
    AND.W #$01FF                                                         ;818CE3;
    TAX                                                                  ;818CE6;
    TYA                                                                  ;818CE7;
    ADC.W #$0005                                                         ;818CE8;
    TAY                                                                  ;818CEB;
    DEC.B $18                                                            ;818CEC;
    BNE .loop                                                            ;818CEE;
    STX.W $0590                                                          ;818CF0;
    RTL                                                                  ;818CF3;
