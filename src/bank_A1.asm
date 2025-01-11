
org $A18000


EnemyPopulations_Draygon_State1_MotherBrain_State2:
    dw $FFFF                                                             ;A18000;

EnemyPopulations_EastOcean:
    dw EnemyHeaders_Choot                                                ;A18002;
    dw $0150,$054C,$0000,$2000,$0000,$0203,$0010                         ;A18004;
    dw EnemyHeaders_Choot                                                ;A18012;
    dw $0190,$050C,$0000,$2000,$0000,$0203,$0010                         ;A18014;
    dw EnemyHeaders_Choot                                                ;A18022;
    dw $0214,$053C,$0000,$2000,$0000,$0203,$0010                         ;A18024;
    dw EnemyHeaders_Choot                                                ;A18032;
    dw $05C8,$05BE,$0000,$2000,$0000,$0203,$0010                         ;A18034;
    dw EnemyHeaders_Choot                                                ;A18042;
    dw $00B0,$051C,$0000,$2000,$0000,$0203,$0010                         ;A18044;
    dw EnemyHeaders_Skultera                                             ;A18052;
    dw $00FC,$0563,$0000,$2000,$0000,$0110,$0210                         ;A18054;
    dw EnemyHeaders_Skultera                                             ;A18062;
    dw $01D5,$0571,$0000,$2000,$0000,$0010,$0210                         ;A18064;
    dw EnemyHeaders_Skultera                                             ;A18072;
    dw $0314,$0587,$0000,$2000,$0000,$0110,$0210                         ;A18074;
    dw EnemyHeaders_Skultera                                             ;A18082;
    dw $03C4,$056B,$0000,$2800,$0000,$0010,$0210                         ;A18084;
    dw EnemyHeaders_Skultera                                             ;A18092;
    dw $04D5,$0577,$0000,$2800,$0000,$0010,$0210                         ;A18094;
    dw EnemyHeaders_Kamer2                                               ;A180A2;
    dw $04C0,$04F0,$0000,$A000,$0000,$0000,$2800                         ;A180A4;
    dw EnemyHeaders_Kamer2                                               ;A180B2;
    dw $03C0,$04F0,$0000,$A000,$0000,$0000,$2800                         ;A180B4;
    dw EnemyHeaders_Kamer2                                               ;A180C2;
    dw $02C8,$04F0,$0000,$A000,$0000,$0000,$2800,$FFFF                   ;A180C4;
    db $0A                                                               ;A180D4;

EnemyPopulations_CrateriaPowerBombs:
    dw EnemyHeaders_Alcoon                                               ;A180D5;
    dw $0088,$00D8,$0000,$2800,$0000,$0000,$0000                         ;A180D7;
    dw EnemyHeaders_Alcoon                                               ;A180E5;
    dw $0108,$00D8,$0000,$2800,$0000,$0000,$0000                         ;A180E7;
    dw EnemyHeaders_Alcoon                                               ;A180F5;
    dw $0178,$00D8,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A180F7;
    db $03                                                               ;A18107;

EnemyPopulations_Terminator:
    dw EnemyHeaders_Waver                                                ;A18108;
    dw $0316,$015C,$0000,$2800,$0000,$0001,$0000                         ;A1810A;
    dw EnemyHeaders_Waver                                                ;A18118;
    dw $0213,$01E0,$0000,$2800,$0000,$0000,$0000                         ;A1811A;
    dw EnemyHeaders_Waver                                                ;A18128;
    dw $0102,$0262,$0000,$2800,$0000,$0001,$0000                         ;A1812A;
    dw EnemyHeaders_Zoomer                                               ;A18138;
    dw $0378,$0130,$0003,$2800,$0000,$0002,$0000                         ;A1813A;
    dw EnemyHeaders_Zoomer                                               ;A18148;
    dw $0498,$00A0,$0003,$2001,$0000,$0002,$0000                         ;A1814A;
    dw EnemyHeaders_Zoomer                                               ;A18158;
    dw $02E9,$01D6,$0003,$2001,$0000,$0002,$0000                         ;A1815A;
    dw EnemyHeaders_Zoomer                                               ;A18168;
    dw $0207,$024A,$0003,$2000,$0000,$0002,$0000                         ;A1816A;
    dw EnemyHeaders_Zoomer                                               ;A18178;
    dw $0178,$0230,$0003,$2800,$0000,$0002,$0000                         ;A1817A;
    dw EnemyHeaders_Zoomer                                               ;A18188;
    dw $0298,$01A0,$0003,$2001,$0000,$0002,$0000,$FFFF                   ;A1818A;
    db $09                                                               ;A1819A;

EnemyPopulations_FinalMissileBombway_1:
    dw EnemyHeaders_FaceBlock                                            ;A1819B;
    dw $0100,$0048,$0000,$A000,$0000,$0000,$0000                         ;A1819D;
    dw EnemyHeaders_FaceBlock                                            ;A181AB;
    dw $0080,$0048,$0000,$A000,$0000,$0000,$0000                         ;A181AD;
    dw EnemyHeaders_FaceBlock                                            ;A181BB;
    dw $0180,$0048,$0000,$A000,$0000,$0000,$0000                         ;A181BD;
    dw EnemyHeaders_FaceBlock                                            ;A181CB;
    dw $0080,$00B8,$0000,$A000,$0000,$0000,$0000                         ;A181CD;
    dw EnemyHeaders_FaceBlock                                            ;A181DB;
    dw $0100,$00B8,$0000,$A000,$0000,$0000,$0000                         ;A181DD;
    dw EnemyHeaders_FaceBlock                                            ;A181EB;
    dw $0180,$00B8,$0000,$A000,$0000,$0000,$0000,$FFFF                   ;A181ED;
    db $00                                                               ;A181FD;

EnemyPopulations_FinalMissileBombway_0:
    dw EnemyHeaders_FaceBlock                                            ;A181FE;
    dw $0100,$0048,$0000,$A000,$0000,$0000,$0000                         ;A18200;
    dw EnemyHeaders_FaceBlock                                            ;A1820E;
    dw $0080,$0048,$0000,$A000,$0000,$0000,$0000                         ;A18210;
    dw EnemyHeaders_FaceBlock                                            ;A1821E;
    dw $0180,$0048,$0000,$A000,$0000,$0000,$0000                         ;A18220;
    dw EnemyHeaders_FaceBlock                                            ;A1822E;
    dw $0080,$00B8,$0000,$A000,$0000,$0000,$0000                         ;A18230;
    dw EnemyHeaders_FaceBlock                                            ;A1823E;
    dw $0100,$00B8,$0000,$A000,$0000,$0000,$0000                         ;A18240;
    dw EnemyHeaders_FaceBlock                                            ;A1824E;
    dw $0180,$00B8,$0000,$A000,$0000,$0000,$0000,$FFFF                   ;A18250;
    db $00                                                               ;A18260;

EnemyPopulations_Parlor_1:
    dw EnemyHeaders_Zoomer                                               ;A18261;
    dw $0498,$0040,$0002,$2801,$0000,$0001,$0000                         ;A18263;
    dw EnemyHeaders_Zoomer                                               ;A18271;
    dw $041F,$0088,$0003,$2801,$0000,$0001,$0000                         ;A18273;
    dw EnemyHeaders_Zoomer                                               ;A18281;
    dw $0448,$00B8,$0003,$2001,$0000,$0001,$0000                         ;A18283;
    dw EnemyHeaders_Skree                                                ;A18291;
    dw $02FE,$003B,$0000,$2000,$0000,$0000,$0000                         ;A18293;
    dw EnemyHeaders_Skree                                                ;A182A1;
    dw $02BE,$005B,$0000,$2000,$0000,$0000,$0000                         ;A182A3;
    dw EnemyHeaders_Skree                                                ;A182B1;
    dw $027E,$003B,$0000,$2000,$0000,$0000,$0000                         ;A182B3;
    dw EnemyHeaders_Zoomer                                               ;A182C1;
    dw $01A0,$0178,$0003,$2001,$0000,$0001,$0000                         ;A182C3;
    dw EnemyHeaders_Ripper                                               ;A182D1;
    dw $01B8,$0228,$0000,$2000,$0000,$0010,$0000                         ;A182D3;
    dw EnemyHeaders_Zoomer                                               ;A182E1;
    dw $0128,$0438,$0000,$2003,$0000,$0001,$0000                         ;A182E3;
    dw EnemyHeaders_Zoomer                                               ;A182F1;
    dw $01D4,$0438,$0003,$2000,$0000,$0001,$0000                         ;A182F3;
    dw EnemyHeaders_Zoomer                                               ;A18301;
    dw $0180,$0408,$0003,$2001,$0000,$0001,$0000                         ;A18303;
    dw EnemyHeaders_Zoomer                                               ;A18311;
    dw $0168,$0328,$0000,$2002,$0000,$0001,$0000                         ;A18313;
    dw EnemyHeaders_Zoomer                                               ;A18321;
    dw $01EA,$02EA,$0001,$2003,$0000,$0001,$0000                         ;A18323;
    dw EnemyHeaders_Zoomer                                               ;A18331;
    dw $01C8,$0278,$0003,$2001,$0000,$0001,$0000                         ;A18333;
    dw EnemyHeaders_Zoomer                                               ;A18341;
    dw $0181,$0115,$0002,$2001,$0000,$0001,$0000                         ;A18343;
    dw EnemyHeaders_Ripper                                               ;A18351;
    dw $03AD,$01E8,$0000,$2000,$0000,$0010,$0000,$FFFF                   ;A18353;
    db $10                                                               ;A18363;

EnemyPopulations_Flyway_0_1:
    dw EnemyHeaders_Mellow                                               ;A18364;
    dw $00ED,$0061,$0000,$2000,$0000,$0000,$0000                         ;A18366;
    dw EnemyHeaders_Mellow                                               ;A18374;
    dw $015E,$005C,$0000,$2000,$0000,$0000,$0000                         ;A18376;
    dw EnemyHeaders_Mellow                                               ;A18384;
    dw $011B,$0060,$0000,$2000,$0000,$0000,$0000                         ;A18386;
    dw EnemyHeaders_Mellow                                               ;A18394;
    dw $0132,$0049,$0000,$2000,$0000,$0000,$0000                         ;A18396;
    dw EnemyHeaders_Mellow                                               ;A183A4;
    dw $013A,$0065,$0000,$2000,$0000,$0000,$0000                         ;A183A6;
    dw EnemyHeaders_Mellow                                               ;A183B4;
    dw $00EA,$0042,$0000,$2000,$0000,$0000,$0000                         ;A183B6;
    dw EnemyHeaders_Mellow                                               ;A183C4;
    dw $01CA,$006B,$0000,$2000,$0000,$0000,$0000                         ;A183C6;
    dw EnemyHeaders_Mellow                                               ;A183D4;
    dw $0100,$0076,$0000,$2000,$0000,$0000,$0000                         ;A183D6;
    dw EnemyHeaders_Mellow                                               ;A183E4;
    dw $019A,$0058,$0000,$2000,$0000,$0000,$0000                         ;A183E6;
    dw EnemyHeaders_Mellow                                               ;A183F4;
    dw $0190,$007E,$0000,$2000,$0000,$0000,$0000                         ;A183F6;
    dw EnemyHeaders_Mellow                                               ;A18404;
    dw $017F,$003E,$0000,$2000,$0000,$0000,$0000                         ;A18406;
    dw EnemyHeaders_Mellow                                               ;A18414;
    dw $01C2,$0041,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A18416;
    db $00                                                               ;A18426;

EnemyPopulations_Pit_1:
    dw EnemyHeaders_PirateGreyWalking                                    ;A18427;
    dw $0268,$0070,$0000,$2000,$0004,$8001,$0010                         ;A18429;
    dw EnemyHeaders_PirateGreyWall                                       ;A18437;
    dw $02CD,$003F,$0000,$2000,$0004,$0001,$0020                         ;A18439;
    dw EnemyHeaders_PirateGreyWalking                                    ;A18447;
    dw $01F9,$0070,$0000,$2000,$0004,$8000,$0010                         ;A18449;
    dw EnemyHeaders_PirateGreyWalking                                    ;A18457;
    dw $0178,$0070,$0000,$2000,$0004,$8001,$0010                         ;A18459;
    dw EnemyHeaders_PirateGreyWalking                                    ;A18467;
    dw $0068,$0080,$0000,$2000,$0004,$8001,$0020,$FFFF                   ;A18469;
    db $05                                                               ;A18479;

EnemyPopulations_GauntletEntrance:
    dw EnemyHeaders_YappingMaw                                           ;A1847A;
    dw $0408,$0038,$0000,$2000,$0000,$0070,$0000                         ;A1847C;
    dw EnemyHeaders_YappingMaw                                           ;A1848A;
    dw $02F8,$00C8,$0000,$2000,$0000,$0070,$0001                         ;A1848C;
    dw EnemyHeaders_YappingMaw                                           ;A1849A;
    dw $01F8,$0038,$0000,$2000,$0000,$0070,$0000                         ;A1849C;
    dw EnemyHeaders_Waver                                                ;A184AA;
    dw $0371,$0065,$0000,$2000,$0000,$0000,$0000                         ;A184AC;
    dw EnemyHeaders_Waver                                                ;A184BA;
    dw $023A,$007D,$0000,$2800,$0000,$0001,$0000                         ;A184BC;
    dw EnemyHeaders_Waver                                                ;A184CA;
    dw $0166,$0077,$0000,$2000,$0000,$0000,$0000                         ;A184CC;
    dw EnemyHeaders_YappingMaw                                           ;A184DA;
    dw $0108,$00C8,$0000,$2000,$0000,$0070,$0001,$FFFF                   ;A184DC;
    db $03                                                               ;A184EC;

EnemyPopulations_BombTorizo_0_1:
    dw EnemyHeaders_BombTorizo                                           ;A184ED;
    dw $00DB,$00B3,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A184EF;
    db $00                                                               ;A184FF;

EnemyPopulations_GreenPiratesShaft:
    dw EnemyHeaders_PirateGreenWalking                                   ;A18500;
    dw $0080,$04D0,$0000,$2000,$0004,$8000,$0018                         ;A18502;
    dw EnemyHeaders_PirateGreenWalking                                   ;A18510;
    dw $008D,$0520,$0000,$2000,$0004,$8001,$0018                         ;A18512;
    dw EnemyHeaders_PirateGreenWalking                                   ;A18520;
    dw $008B,$0570,$0000,$2000,$0004,$8000,$0018                         ;A18522;
    dw EnemyHeaders_PirateGreenWalking                                   ;A18530;
    dw $0084,$05C0,$0000,$2000,$0004,$8001,$0018                         ;A18532;
    dw EnemyHeaders_PirateGreenWalking                                   ;A18540;
    dw $0096,$0610,$0000,$2000,$0004,$8000,$0018                         ;A18542;
    dw EnemyHeaders_Beetom                                               ;A18550;
    dw $00B8,$03D8,$0000,$2000,$0000,$0000,$0000                         ;A18552;
    dw EnemyHeaders_Beetom                                               ;A18560;
    dw $0048,$03D8,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A18562;
    db $07                                                               ;A18572;

EnemyPopulations_GreenBrinstarElev:
    dw EnemyHeaders_Elevator                                             ;A18573;
    dw $0080,$00A2,$0000,$2C00,$0000,$0000,$0140,$FFFF                   ;A18575;
    db $00                                                               ;A18585;

EnemyPopulations_FinalMissile_0:
    dw EnemyHeaders_Eye                                                  ;A18586;
    dw $0032,$0078,$0000,$2C00,$0000,$0000,$8000                         ;A18588;
    dw EnemyHeaders_Eye                                                  ;A18596;
    dw $0032,$0078,$0000,$2C00,$0000,$0000,$0000,$FFFF                   ;A18598;
    db $00                                                               ;A185A8;

EnemyPopulations_CrateriaMap:
    dw $FFFF                                                             ;A185A9;
    db $00                                                               ;A185AB;

UNUSED_EnemyPopulations_A185AC:
    dw $FFFF                                                             ;A185AC;
    db $00                                                               ;A185AE;

EnemyPopulations_FinalMissile_1:
    dw $FFFF                                                             ;A185AF;
    db $00                                                               ;A185B1;

EnemyPopulations_Climb_2:
    dw EnemyHeaders_PirateSilverNinja                                    ;A185B2;
    dw $0080,$0880,$0000,$2800,$0004,$0000,$0000                         ;A185B4;
    dw EnemyHeaders_PirateSilverNinja                                    ;A185C2;
    dw $00C0,$0880,$0000,$2800,$0004,$0000,$0000,$FFFF                   ;A185C4;
    db $02                                                               ;A185D4;

UNUSED_EnemyPopulations_A185D5:
    dw $FFFF                                                             ;A185D5;
    db $00                                                               ;A185D7;

EnemyPopulations_CrateriaSave:
    dw $FFFF                                                             ;A185D8;
    db $00                                                               ;A185DA;

EnemyPopulations_ForgottenHighwayElbow:
    dw $FFFF                                                             ;A185DB;
    db $00                                                               ;A185DD;

EnemyPopulations_Moat:
    dw $FFFF                                                             ;A185DE;
    db $00                                                               ;A185E0;

EnemyPopulations_Climb_0:
    dw EnemyHeaders_Sbug                                                 ;A185E1;
    dw $0114,$004C,$0000,$2400,$0000,$5003,$0050                         ;A185E3;
    dw EnemyHeaders_Sbug                                                 ;A185F1;
    dw $0110,$0058,$0000,$2400,$0000,$9002,$0050                         ;A185F3;
    dw EnemyHeaders_Sbug                                                 ;A18601;
    dw $010D,$0072,$0000,$2400,$0000,$AC03,$0050                         ;A18603;
    dw EnemyHeaders_Sbug                                                 ;A18611;
    dw $01EB,$0096,$0000,$2400,$0000,$C804,$0050                         ;A18613;
    dw EnemyHeaders_Sbug                                                 ;A18621;
    dw $01F3,$009A,$0000,$2400,$0000,$C303,$0050                         ;A18623;
    dw EnemyHeaders_Sbug                                                 ;A18631;
    dw $0115,$0126,$0000,$2400,$0000,$9203,$0050                         ;A18633;
    dw EnemyHeaders_Sbug                                                 ;A18641;
    dw $0114,$0123,$0000,$2400,$0000,$6003,$0050                         ;A18643;
    dw EnemyHeaders_Sbug                                                 ;A18651;
    dw $0111,$0128,$0000,$2400,$0000,$9C02,$0050                         ;A18653;
    dw EnemyHeaders_Sbug                                                 ;A18661;
    dw $01EE,$0217,$0000,$2400,$0000,$F004,$0050                         ;A18663;
    dw EnemyHeaders_Sbug                                                 ;A18671;
    dw $0116,$06B9,$0000,$2400,$0000,$BC02,$0050,$FFFF                   ;A18673;
    db $00                                                               ;A18683;

EnemyPopulations_WestOcean:
    dw EnemyHeaders_Skultera                                             ;A18684;
    dw $04A4,$0570,$0000,$2000,$0000,$0010,$0210                         ;A18686;
    dw EnemyHeaders_Skultera                                             ;A18694;
    dw $03CB,$057A,$0000,$2000,$0000,$0110,$0210                         ;A18696;
    dw EnemyHeaders_Zeb                                                  ;A186A4;
    dw $0278,$02C0,$0000,$6900,$0000,$0000,$0000                         ;A186A6;
    dw EnemyHeaders_GRipper                                              ;A186B4;
    dw $0590,$0430,$0010,$2800,$0000,$0560,$05C0                         ;A186B6;
    dw EnemyHeaders_Tripper                                              ;A186C4;
    dw $0150,$00D8,$0000,$A000,$0000,$0000,$0010                         ;A186C6;
    dw EnemyHeaders_Tripper                                              ;A186D4;
    dw $0388,$0058,$0000,$A000,$0000,$0000,$0010                         ;A186D6;
    dw EnemyHeaders_Tripper                                              ;A186E4;
    dw $0370,$0160,$0000,$A000,$0000,$0001,$0010,$FFFF                   ;A186E6;
    db $07                                                               ;A186F6;

UNUSED_EnemyPopulations_A186F7:
    dw $FFFF                                                             ;A186F7;
    db $00                                                               ;A186F9;

EnemyPopulations_Parlor_0:
    dw EnemyHeaders_Sbug                                                 ;A186FA;
    dw $04BE,$00C0,$0000,$2400,$0000,$AA02,$0050                         ;A186FC;
    dw EnemyHeaders_Sbug                                                 ;A1870A;
    dw $04A4,$00C9,$0000,$2400,$0000,$B502,$0050                         ;A1870C;
    dw EnemyHeaders_Sbug                                                 ;A1871A;
    dw $04BB,$00CF,$0000,$2400,$0000,$D003,$0050                         ;A1871C;
    dw EnemyHeaders_Sbug                                                 ;A1872A;
    dw $04E4,$0041,$0000,$2400,$0000,$4804,$0080                         ;A1872C;
    dw EnemyHeaders_Sbug                                                 ;A1873A;
    dw $0455,$002A,$0000,$2400,$0000,$6003,$00A0                         ;A1873C;
    dw EnemyHeaders_Sbug                                                 ;A1874A;
    dw $043F,$002E,$0000,$2400,$0000,$6C03,$00A0                         ;A1874C;
    dw EnemyHeaders_Sbug                                                 ;A1875A;
    dw $046F,$0027,$0000,$2400,$0000,$7802,$00A0                         ;A1875C;
    dw EnemyHeaders_Sbug                                                 ;A1876A;
    dw $03D8,$00C3,$0000,$2400,$0000,$CA03,$0050                         ;A1876C;
    dw EnemyHeaders_Sbug                                                 ;A1877A;
    dw $03D2,$00C9,$0000,$2400,$0000,$C803,$0050                         ;A1877C;
    dw EnemyHeaders_Sbug                                                 ;A1878A;
    dw $03DB,$00CE,$0000,$2400,$0000,$E202,$0050                         ;A1878C;
    dw EnemyHeaders_Sbug                                                 ;A1879A;
    dw $011B,$00BC,$0000,$2400,$0000,$A002,$0050                         ;A1879C;
    dw EnemyHeaders_Sbug                                                 ;A187AA;
    dw $0112,$00C4,$0000,$2400,$0000,$AB02,$0050                         ;A187AC;
    dw EnemyHeaders_Sbug                                                 ;A187BA;
    dw $012C,$0229,$0000,$2400,$0000,$7C03,$0080                         ;A187BC;
    dw EnemyHeaders_Sbug                                                 ;A187CA;
    dw $0124,$022D,$0000,$2400,$0000,$9403,$0080                         ;A187CC;
    dw EnemyHeaders_Sbug                                                 ;A187DA;
    dw $0143,$023F,$0000,$2400,$0000,$8402,$0080                         ;A187DC;
    dw EnemyHeaders_Sbug                                                 ;A187EA;
    dw $013F,$02BF,$0000,$2400,$0000,$A102,$0040                         ;A187EC;
    dw EnemyHeaders_Sbug                                                 ;A187FA;
    dw $0145,$02BA,$0000,$2400,$0000,$9103,$0040                         ;A187FC;
    dw EnemyHeaders_Sbug                                                 ;A1880A;
    dw $013D,$02C3,$0000,$2400,$0000,$8C02,$0040                         ;A1880C;
    dw EnemyHeaders_Sbug                                                 ;A1881A;
    dw $010D,$02DB,$0000,$2400,$0000,$AC03,$0080                         ;A1881C;
    dw EnemyHeaders_Sbug                                                 ;A1882A;
    dw $01A5,$04E0,$0000,$2400,$0000,$E804,$0020,$FFFF                   ;A1882C;
    db $00                                                               ;A1883C;

EnemyPopulations_LandingSite_0_1_2:
    dw EnemyHeaders_ShipTop                                              ;A1883D;
    dw $0480,$0478,$0000,$2400,$0000,$0000,$0000                         ;A1883F;
    dw EnemyHeaders_ShipBottomEntrance                                   ;A1884D;
    dw $0480,$0478,$0000,$2400,$0000,$0000,$0000                         ;A1884F;
    dw EnemyHeaders_ShipBottomEntrance                                   ;A1885D;
    dw $0480,$0478,$0000,$2400,$0000,$0000,$0001,$FFFF                   ;A1885F;
    db $00                                                               ;A1886F;

EnemyPopulations_CrateriaSuper:
    dw EnemyHeaders_Boyon                                                ;A18870;
    dw $0258,$07A8,$0000,$2000,$0000,$0103,$0020                         ;A18872;
    dw EnemyHeaders_Boyon                                                ;A18880;
    dw $0278,$07A8,$0000,$2000,$0000,$0103,$0020                         ;A18882;
    dw EnemyHeaders_Boyon                                                ;A18890;
    dw $0298,$07A8,$0000,$2000,$0000,$0103,$0020                         ;A18892;
    dw EnemyHeaders_Boyon                                                ;A188A0;
    dw $02B8,$07A8,$0000,$2000,$0000,$0103,$0020,$FFFF                   ;A188A2;
    db $00                                                               ;A188B2;

UNUSED_EnemyPopulations_A188B3:
    dw $FFFF                                                             ;A188B3;
    db $00                                                               ;A188B5;

EnemyPopulations_PreBowling:
    dw EnemyHeaders_HZoomer                                              ;A188B6;
    dw $0080,$0048,$0003,$2001,$0000,$0001,$0000,$FFFF                   ;A188B8;
    db $01                                                               ;A188C8;

EnemyPopulations_Climb_1:
    dw EnemyHeaders_PirateGreyWall                                       ;A188C9;
    dw $0130,$00D8,$0000,$2000,$0004,$8000,$00A0                         ;A188CB;
    dw EnemyHeaders_PirateGreyWall                                       ;A188D9;
    dw $01D0,$0128,$0000,$2000,$0004,$8001,$00A0                         ;A188DB;
    dw EnemyHeaders_PirateGreyWall                                       ;A188E9;
    dw $0130,$01D8,$0000,$2000,$0004,$8000,$00A0                         ;A188EB;
    dw EnemyHeaders_PirateGreyWall                                       ;A188F9;
    dw $0130,$0338,$0000,$2000,$0004,$8000,$00A0                         ;A188FB;
    dw EnemyHeaders_PirateGreyWall                                       ;A18909;
    dw $01D0,$03D8,$0000,$2000,$0004,$8001,$00A0                         ;A1890B;
    dw EnemyHeaders_PirateGreyWall                                       ;A18919;
    dw $0130,$04B8,$0000,$2000,$0004,$8000,$00A0                         ;A1891B;
    dw EnemyHeaders_PirateGreyWall                                       ;A18929;
    dw $01D0,$05A8,$0000,$2000,$0004,$8001,$00A0                         ;A1892B;
    dw EnemyHeaders_PirateGreyWall                                       ;A18939;
    dw $012D,$0698,$0000,$2000,$0004,$8000,$00A0                         ;A1893B;
    dw EnemyHeaders_PirateGreyWall                                       ;A18949;
    dw $01D0,$0278,$0000,$2000,$0004,$8001,$00A0                         ;A1894B;
    dw EnemyHeaders_PirateGreyWall                                       ;A18959;
    dw $01D0,$0708,$0000,$2000,$0004,$8001,$00A0                         ;A1895B;
    dw EnemyHeaders_PirateGreyWall                                       ;A18969;
    dw $0130,$07C8,$0000,$2000,$0004,$8000,$00A0,$FFFF                   ;A1896B;
    db $0B                                                               ;A1897B;

EnemyPopulations_BowlingAlleyPath:
    dw EnemyHeaders_Choot                                                ;A1897C;
    dw $0070,$00CC,$0000,$2000,$0000,$0204,$0000                         ;A1897E;
    dw EnemyHeaders_Choot                                                ;A1898C;
    dw $00E0,$00CC,$0000,$2000,$0000,$0204,$0000                         ;A1898E;
    dw EnemyHeaders_Choot                                                ;A1899C;
    dw $0150,$00CC,$0000,$2000,$0000,$0204,$0000                         ;A1899E;
    dw EnemyHeaders_Waver                                                ;A189AC;
    dw $00AA,$005D,$0000,$2800,$0000,$0000,$0000                         ;A189AE;
    dw EnemyHeaders_Waver                                                ;A189BC;
    dw $00E9,$0075,$0000,$2800,$0000,$0001,$0000                         ;A189BE;
    dw EnemyHeaders_Waver                                                ;A189CC;
    dw $0136,$0063,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A189CE;
    db $06                                                               ;A189DE;

EnemyPopulations_RedBinstarElev:
    dw EnemyHeaders_Elevator                                             ;A189DF;
    dw $0080,$00C2,$0000,$2C00,$0000,$0000,$0140,$FFFF                   ;A189E1;
    db $00                                                               ;A189F1;

EnemyPopulations_GauntletETank:
    dw EnemyHeaders_YappingMaw                                           ;A189F2;
    dw $0088,$0038,$0000,$2000,$0000,$0070,$0000                         ;A189F4;
    dw EnemyHeaders_Zebbo                                                ;A18A02;
    dw $0088,$00B8,$0000,$6900,$0000,$0002,$0000,$FFFF                   ;A18A04;
    db $01                                                               ;A18A14;

EnemyPopulations_Pit_0:
    dw EnemyHeaders_Sbug                                                 ;A18A15;
    dw $006B,$0038,$0000,$2400,$0000,$2802,$0050                         ;A18A17;
    dw EnemyHeaders_Sbug                                                 ;A18A25;
    dw $0070,$0034,$0000,$2400,$0000,$7803,$0050                         ;A18A27;
    dw EnemyHeaders_Sbug                                                 ;A18A35;
    dw $005A,$002D,$0000,$2400,$0000,$7C02,$0050                         ;A18A37;
    dw EnemyHeaders_Sbug                                                 ;A18A45;
    dw $0073,$00AD,$0000,$2400,$0000,$9402,$0050                         ;A18A47;
    dw EnemyHeaders_Sbug                                                 ;A18A55;
    dw $007A,$00B7,$0000,$2400,$0000,$C403,$0050                         ;A18A57;
    dw EnemyHeaders_Sbug                                                 ;A18A65;
    dw $006C,$00C3,$0000,$2400,$0000,$7C03,$0050                         ;A18A67;
    dw EnemyHeaders_Sbug                                                 ;A18A75;
    dw $007F,$00B2,$0000,$2400,$0000,$C203,$0050                         ;A18A77;
    dw EnemyHeaders_Sbug                                                 ;A18A85;
    dw $00BD,$00CA,$0000,$2400,$0000,$C103,$0050                         ;A18A87;
    dw EnemyHeaders_Sbug                                                 ;A18A95;
    dw $02C9,$00A6,$0000,$2400,$0000,$F002,$0050                         ;A18A97;
    dw EnemyHeaders_Sbug                                                 ;A18AA5;
    dw $02CC,$00AB,$0000,$2400,$0000,$EC04,$0050,$FFFF                   ;A18AA7;
    db $00                                                               ;A18AB7;

EnemyPopulations_CrabMaze:
    dw EnemyHeaders_Sciser                                               ;A18AB8;
    dw $0278,$00AC,$0003,$2000,$0000,$0002,$0000                         ;A18ABA;
    dw EnemyHeaders_Sciser                                               ;A18AC8;
    dw $0015,$0098,$0003,$2001,$0000,$0002,$0000                         ;A18ACA;
    dw EnemyHeaders_Sciser                                               ;A18AD8;
    dw $00D1,$00C8,$0003,$2000,$0000,$0002,$0000                         ;A18ADA;
    dw EnemyHeaders_Sciser                                               ;A18AE8;
    dw $0202,$0068,$0003,$2000,$0000,$0001,$0000                         ;A18AEA;
    dw EnemyHeaders_Sciser                                               ;A18AF8;
    dw $011E,$01D8,$0003,$2801,$0000,$0003,$0000                         ;A18AFA;
    dw EnemyHeaders_Sciser                                               ;A18B08;
    dw $0118,$0158,$0003,$2001,$0000,$0001,$0000                         ;A18B0A;
    dw EnemyHeaders_Sciser                                               ;A18B18;
    dw $00B2,$01B8,$0003,$2001,$0000,$0001,$0000                         ;A18B1A;
    dw EnemyHeaders_Sciser                                               ;A18B28;
    dw $02A8,$01C4,$0003,$2800,$0000,$0003,$0000,$FFFF                   ;A18B2A;
    db $08                                                               ;A18B3A;

EnemyPopulations_CrateriaTube:
    dw $FFFF                                                             ;A18B3B;
    db $00                                                               ;A18B3D;

EnemyPopulations_ForgottenHighwayKagos:
    dw EnemyHeaders_Kago                                                 ;A18B3E;
    dw $0050,$0340,$0000,$A000,$0000,$000A,$0000                         ;A18B40;
    dw EnemyHeaders_Kago                                                 ;A18B4E;
    dw $00A8,$0200,$0000,$A000,$0000,$000A,$0000,$FFFF                   ;A18B50;
    db $02                                                               ;A18B60;

EnemyPopulations_ElevToBlueBrinstar:
    dw EnemyHeaders_Elevator                                             ;A18B61;
    dw $0080,$00A2,$0000,$2C00,$0000,$0000,$0140,$FFFF                   ;A18B63;
    db $00                                                               ;A18B73;

EnemyPopulations_ForgottenHighwayElev:
    dw EnemyHeaders_Elevator                                             ;A18B74;
    dw $0080,$00C0,$0000,$2C00,$0000,$0000,$0140,$FFFF                   ;A18B76;
    db $00                                                               ;A18B86;

EnemyPopulations_PreMapFlyway:
    dw EnemyHeaders_Mellow                                               ;A18B87;
    dw $014C,$006E,$0000,$2000,$0000,$0000,$0000                         ;A18B89;
    dw EnemyHeaders_Mellow                                               ;A18B97;
    dw $00FB,$0059,$0000,$2000,$0000,$0000,$0000                         ;A18B99;
    dw EnemyHeaders_Mellow                                               ;A18BA7;
    dw $01A7,$005A,$0000,$2000,$0000,$0000,$0000                         ;A18BA9;
    dw EnemyHeaders_Rio                                                  ;A18BB7;
    dw $014B,$0045,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A18BB9;
    db $01                                                               ;A18BC9;

EnemyPopulations_LowerMushrooms:
    dw EnemyHeaders_Kago                                                 ;A18BCA;
    dw $0100,$00A0,$0000,$A000,$0000,$000A,$0000                         ;A18BCC;
    dw EnemyHeaders_Kago                                                 ;A18BDA;
    dw $0210,$00B0,$0000,$A000,$0000,$000A,$0000                         ;A18BDC;
    dw EnemyHeaders_MZoomer                                              ;A18BEA;
    dw $02F8,$0070,$0003,$2000,$0000,$0002,$0000                         ;A18BEC;
    dw EnemyHeaders_MZoomer                                              ;A18BFA;
    dw $01A8,$0070,$0003,$2001,$0000,$0002,$0000,$FFFF                   ;A18BFC;
    db $04                                                               ;A18C0C;

EnemyPopulations_LandingSite_3:
    dw EnemyHeaders_ShipTop                                              ;A18C0D;
    dw $0480,$0478,$0000,$2400,$0000,$0000,$0000                         ;A18C0F;
    dw EnemyHeaders_ShipBottomEntrance                                   ;A18C1D;
    dw $0480,$0478,$0000,$2400,$0000,$0000,$0000                         ;A18C1F;
    dw EnemyHeaders_ShipBottomEntrance                                   ;A18C2D;
    dw $0480,$0478,$0000,$2400,$0000,$0000,$0001                         ;A18C2F;
    dw EnemyHeaders_Steam                                                ;A18C3D;
    dw $0051,$04AA,$0000,$2000,$0000,$0000,$0000                         ;A18C3F;
    dw EnemyHeaders_Steam                                                ;A18C4D;
    dw $0080,$04BC,$0000,$2000,$0000,$0000,$0000                         ;A18C4F;
    dw EnemyHeaders_Steam                                                ;A18C5D;
    dw $00A1,$04D0,$0000,$2000,$0000,$0000,$0000                         ;A18C5F;
    dw EnemyHeaders_Steam                                                ;A18C6D;
    dw $00E5,$04D7,$0000,$2000,$0000,$0000,$0000                         ;A18C6F;
    dw EnemyHeaders_Steam                                                ;A18C7D;
    dw $015B,$04D7,$0000,$2000,$0000,$0000,$0000                         ;A18C7F;
    dw EnemyHeaders_Steam                                                ;A18C8D;
    dw $019D,$04D5,$0000,$2000,$0000,$0000,$0000                         ;A18C8F;
    dw EnemyHeaders_Steam                                                ;A18C9D;
    dw $01C0,$04C9,$0000,$2000,$0000,$0000,$0000                         ;A18C9F;
    dw EnemyHeaders_Steam                                                ;A18CAD;
    dw $0222,$04C8,$0000,$2000,$0000,$0000,$0000                         ;A18CAF;
    dw EnemyHeaders_Steam                                                ;A18CBD;
    dw $0243,$04C4,$0000,$2000,$0000,$0000,$0000                         ;A18CBF;
    dw EnemyHeaders_Steam                                                ;A18CCD;
    dw $027C,$04CE,$0000,$2000,$0000,$0000,$0000                         ;A18CCF;
    dw EnemyHeaders_Steam                                                ;A18CDD;
    dw $0317,$04D7,$0000,$2000,$0000,$0000,$0000                         ;A18CDF;
    dw EnemyHeaders_Steam                                                ;A18CED;
    dw $033F,$04C9,$0000,$2000,$0000,$0000,$0000                         ;A18CEF;
    dw EnemyHeaders_Steam                                                ;A18CFD;
    dw $036C,$04B6,$0000,$2000,$0000,$0000,$0000                         ;A18CFF;
    dw EnemyHeaders_Steam                                                ;A18D0D;
    dw $0390,$04A9,$0000,$2000,$0000,$0000,$0000                         ;A18D0F;
    dw EnemyHeaders_Steam                                                ;A18D1D;
    dw $03D9,$04B7,$0000,$2000,$0000,$0000,$0000                         ;A18D1F;
    dw EnemyHeaders_Steam                                                ;A18D2D;
    dw $041A,$04D9,$0000,$2000,$0000,$0000,$0000                         ;A18D2F;
    dw EnemyHeaders_Steam                                                ;A18D3D;
    dw $049C,$04D8,$0000,$2000,$0000,$0000,$0000                         ;A18D3F;
    dw EnemyHeaders_Steam                                                ;A18D4D;
    dw $04F9,$04CA,$0000,$2000,$0000,$0000,$0000                         ;A18D4F;
    dw EnemyHeaders_Steam                                                ;A18D5D;
    dw $0525,$04BB,$0000,$2000,$0000,$0000,$0000                         ;A18D5F;
    dw EnemyHeaders_Steam                                                ;A18D6D;
    dw $0557,$04C9,$0000,$2000,$0000,$0000,$0000                         ;A18D6F;
    dw EnemyHeaders_Steam                                                ;A18D7D;
    dw $05C6,$04D4,$0000,$2000,$0000,$0000,$0000                         ;A18D7F;
    dw EnemyHeaders_Steam                                                ;A18D8D;
    dw $0624,$04D4,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A18D8F;
    db $00                                                               ;A18D9F;

EnemyPopulations_Parlor_2:
    dw EnemyHeaders_Steam                                                ;A18DA0;
    dw $0145,$00B5,$0000,$2000,$0000,$0000,$0000                         ;A18DA2;
    dw EnemyHeaders_Steam                                                ;A18DB0;
    dw $01B9,$00BA,$0000,$2000,$0000,$0000,$0000                         ;A18DB2;
    dw EnemyHeaders_Steam                                                ;A18DC0;
    dw $01DE,$00A9,$0000,$2000,$0000,$0000,$0000                         ;A18DC2;
    dw EnemyHeaders_Steam                                                ;A18DD0;
    dw $0227,$00B1,$0000,$2000,$0000,$0000,$0000                         ;A18DD2;
    dw EnemyHeaders_Steam                                                ;A18DE0;
    dw $023D,$00B9,$0000,$2000,$0000,$0000,$0000                         ;A18DE2;
    dw EnemyHeaders_Steam                                                ;A18DF0;
    dw $026F,$00C0,$0000,$2000,$0000,$0000,$0000                         ;A18DF2;
    dw EnemyHeaders_Steam                                                ;A18E00;
    dw $02B1,$00D0,$0000,$2000,$0000,$0000,$0000                         ;A18E02;
    dw EnemyHeaders_Steam                                                ;A18E10;
    dw $02D1,$00C8,$0000,$2000,$0000,$0000,$0000                         ;A18E12;
    dw EnemyHeaders_Steam                                                ;A18E20;
    dw $030B,$00C0,$0000,$2000,$0000,$0000,$0000                         ;A18E22;
    dw EnemyHeaders_Steam                                                ;A18E30;
    dw $032F,$00A0,$0000,$2000,$0000,$0000,$0000                         ;A18E32;
    dw EnemyHeaders_Steam                                                ;A18E40;
    dw $035E,$0088,$0000,$2000,$0000,$0000,$0000                         ;A18E42;
    dw EnemyHeaders_Steam                                                ;A18E50;
    dw $0384,$0077,$0000,$2000,$0000,$0000,$0000                         ;A18E52;
    dw EnemyHeaders_Steam                                                ;A18E60;
    dw $03DC,$0079,$0000,$2000,$0000,$0000,$0000                         ;A18E62;
    dw EnemyHeaders_Steam                                                ;A18E70;
    dw $03FE,$008E,$0000,$2000,$0000,$0000,$0000                         ;A18E72;
    dw EnemyHeaders_Steam                                                ;A18E80;
    dw $041F,$00A1,$0000,$2000,$0000,$0000,$0000                         ;A18E82;
    dw EnemyHeaders_Steam                                                ;A18E90;
    dw $045C,$00C4,$0000,$2000,$0000,$0000,$0000                         ;A18E92;
    dw EnemyHeaders_Steam                                                ;A18EA0;
    dw $047F,$00B3,$0000,$2000,$0000,$0000,$0000                         ;A18EA2;
    dw EnemyHeaders_Steam                                                ;A18EB0;
    dw $04AA,$00AE,$0000,$2000,$0000,$0000,$0000                         ;A18EB2;
    dw EnemyHeaders_Steam                                                ;A18EC0;
    dw $04CC,$00A6,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A18EC2;
    db $00                                                               ;A18ED2;

EnemyPopulations_BombTorizo_2:
    dw EnemyHeaders_DachoraEscape                                        ;A18ED3;
    dw $00E0,$00B8,$0000,$2400,$0000,$0000,$0000                         ;A18ED5;
    dw EnemyHeaders_EtecoonEscape                                        ;A18EE3;
    dw $00E0,$00B8,$0000,$2000,$0000,$0000,$0000                         ;A18EE5;
    dw EnemyHeaders_EtecoonEscape                                        ;A18EF3;
    dw $00E0,$00B8,$0000,$2000,$0000,$0002,$0000                         ;A18EF5;
    dw EnemyHeaders_EtecoonEscape                                        ;A18F03;
    dw $00E0,$00B8,$0000,$2000,$0000,$0004,$0000,$FFFF                   ;A18F05;
    db $04                                                               ;A18F15;

EnemyPopulations_Flyway_2:
    dw $FFFF                                                             ;A18F16;
    db $00                                                               ;A18F18;

EnemyPopulations_CrateriaKihunter:
    dw EnemyHeaders_KihunterGreen                                        ;A18F19;
    dw $0264,$0073,$0000,$2800,$0000,$0000,$0000                         ;A18F1B;
    dw EnemyHeaders_KihunterGreenWings                                   ;A18F29;
    dw $0264,$0073,$0000,$2C00,$0000,$0020,$0000                         ;A18F2B;
    dw EnemyHeaders_KihunterGreen                                        ;A18F39;
    dw $00A8,$0087,$0000,$2800,$0000,$0000,$0000                         ;A18F3B;
    dw EnemyHeaders_KihunterGreenWings                                   ;A18F49;
    dw $00A8,$0087,$0000,$2C00,$0000,$0020,$0000                         ;A18F4B;
    dw EnemyHeaders_Sciser                                               ;A18F59;
    dw $0198,$01D8,$0003,$2801,$0000,$0001,$0000                         ;A18F5B;
    dw EnemyHeaders_Sciser                                               ;A18F69;
    dw $0165,$021A,$0003,$2000,$0000,$0001,$0000,$FFFF                   ;A18F6B;
    db $04                                                               ;A18F7B;

EnemyPopulations_BrinstarPreMap:
    dw EnemyHeaders_Sidehopper                                           ;A18F7C;
    dw $0244,$003B,$0000,$2000,$0000,$0001,$0000                         ;A18F7E;
    dw EnemyHeaders_Zeela                                                ;A18F8C;
    dw $0178,$0058,$0003,$2001,$0000,$0001,$0002                         ;A18F8E;
    dw EnemyHeaders_Zeela                                                ;A18F9C;
    dw $01A8,$0058,$0003,$2801,$0000,$0001,$0002                         ;A18F9E;
    dw EnemyHeaders_Zeela                                                ;A18FAC;
    dw $0049,$0040,$0001,$2000,$0000,$0000,$0002,$FFFF                   ;A18FAE;
    db $04                                                               ;A18FBE;

EnemyPopulations_GreenBrinstarMap:
    dw $FFFF                                                             ;A18FBF;
    db $00                                                               ;A18FC1;

EnemyPopulations_GreenBrinstarMissileRefill:
    dw $FFFF                                                             ;A18FC2;
    db $00                                                               ;A18FC4;

EnemyPopulations_SporeSpawnKihunters:
    dw EnemyHeaders_KihunterGreen                                        ;A18FC5;
    dw $00D9,$0068,$0000,$2800,$0000,$003C,$0000                         ;A18FC7;
    dw EnemyHeaders_KihunterGreenWings                                   ;A18FD5;
    dw $00D9,$0068,$0000,$2C00,$0000,$0020,$0000                         ;A18FD7;
    dw EnemyHeaders_KihunterGreen                                        ;A18FE5;
    dw $02D5,$0062,$0000,$2800,$0000,$003C,$0000                         ;A18FE7;
    dw EnemyHeaders_KihunterGreenWings                                   ;A18FF5;
    dw $02D5,$0062,$0000,$2C00,$0000,$0020,$0000                         ;A18FF7;
    dw EnemyHeaders_KihunterGreen                                        ;A19005;
    dw $03D7,$0068,$0000,$2800,$0000,$003C,$0000                         ;A19007;
    dw EnemyHeaders_KihunterGreenWings                                   ;A19015;
    dw $03D7,$0068,$0000,$2C00,$0000,$0020,$0000,$FFFF                   ;A19017;
    db $03                                                               ;A19027;

EnemyPopulations_EtecoonSuper:
    dw $FFFF                                                             ;A19028;
    db $00                                                               ;A1902A;

EnemyPopulations_DachoraEnergyRefill:
    dw $FFFF                                                             ;A1902B;
    db $00                                                               ;A1902D;

EnemyPopulations_SporeSpawnFarming:
    dw EnemyHeaders_Zeb                                                  ;A1902E;
    dw $0180,$00B8,$0000,$6900,$0000,$0000,$0000                         ;A19030;
    dw EnemyHeaders_Zeb                                                  ;A1903E;
    dw $0110,$00B8,$0000,$6900,$0000,$0000,$0000                         ;A19040;
    dw EnemyHeaders_Zeb                                                  ;A1904E;
    dw $00E0,$00B8,$0000,$6900,$0000,$0000,$0000                         ;A19050;
    dw EnemyHeaders_Zeela                                                ;A1905E;
    dw $0080,$0042,$0002,$2001,$0000,$00FF,$0002                         ;A19060;
    dw EnemyHeaders_Zeela                                                ;A1906E;
    dw $00B0,$0042,$0002,$2001,$0000,$00FF,$0002,$FFFF                   ;A19070;
    db $05                                                               ;A19080;

EnemyPopulations_Statues:
    dw EnemyHeaders_Elevator                                             ;A19081;
    dw $0080,$01B0,$0000,$2C00,$0000,$0000,$0240                         ;A19083;
    dw EnemyHeaders_TourianStatue                                        ;A19091;
    dw $0078,$00B8,$0000,$2000,$0000,$0000,$0000                         ;A19093;
    dw EnemyHeaders_TourianStatue                                        ;A190A1;
    dw $008E,$0055,$0000,$2000,$0000,$0002,$0000                         ;A190A3;
    dw EnemyHeaders_TourianStatue                                        ;A190B1;
    dw $0084,$0088,$0000,$2000,$0000,$0004,$0000,$FFFF                   ;A190B3;
    db $00                                                               ;A190C3;

EnemyPopulations_HopperETank:
    dw $FFFF                                                             ;A190C4;
    db $00                                                               ;A190C6;

EnemyPopulations_BetaPowerBomb:
    dw EnemyHeaders_YappingMaw                                           ;A190C7;
    dw $0170,$00D0,$0000,$2000,$0000,$0036,$0001                         ;A190C9;
    dw EnemyHeaders_YappingMaw                                           ;A190D7;
    dw $00F0,$00D0,$0000,$2000,$0000,$0036,$0001                         ;A190D9;
    dw EnemyHeaders_SidehopperLarge                                      ;A190E7;
    dw $00F0,$0058,$0000,$2000,$0000,$8000,$0000                         ;A190E9;
    dw EnemyHeaders_SidehopperLarge                                      ;A190F7;
    dw $0170,$0058,$0000,$2000,$0000,$8000,$0000                         ;A190F9;
    dw EnemyHeaders_SidehopperLarge                                      ;A19107;
    dw $0078,$0058,$0000,$2000,$0000,$8000,$0000,$FFFF                   ;A19109;
    db $03                                                               ;A19119;

EnemyPopulations_WaterwayETank:
    dw EnemyHeaders_Skultera                                             ;A1911A;
    dw $0140,$00AE,$0000,$2800,$0000,$0010,$1001                         ;A1911C;
    dw EnemyHeaders_Puyo                                                 ;A1912A;
    dw $0169,$00B3,$0000,$2000,$0000,$0002,$0001                         ;A1912C;
    dw EnemyHeaders_Puyo                                                 ;A1913A;
    dw $01F7,$00B3,$0000,$2000,$0000,$0002,$0001                         ;A1913C;
    dw EnemyHeaders_Puyo                                                 ;A1914A;
    dw $0224,$00B5,$0000,$2000,$0000,$0002,$0001                         ;A1914C;
    dw EnemyHeaders_Skultera                                             ;A1915A;
    dw $024B,$00AE,$0000,$2000,$0000,$0010,$1001                         ;A1915C;
    dw EnemyHeaders_Zero                                                 ;A1916A;
    dw $0430,$00B8,$0003,$2001,$0000,$0000,$0000                         ;A1916C;
    dw EnemyHeaders_Zero                                                 ;A1917A;
    dw $05F0,$0058,$0002,$2001,$0000,$0000,$0000,$FFFF                   ;A1917C;
    db $07                                                               ;A1918C;

EnemyPopulations_ConstructionZone_1:
    dw EnemyHeaders_Zoomer                                               ;A1918D;
    dw $0058,$0078,$0003,$2001,$0000,$0002,$0000                         ;A1918F;
    dw EnemyHeaders_Zoomer                                               ;A1919D;
    dw $00A8,$0094,$0002,$2001,$0000,$0002,$0000                         ;A1919F;
    dw EnemyHeaders_FaceBlock                                            ;A191AD;
    dw $0048,$0088,$0000,$A000,$0000,$0000,$0000                         ;A191AF;
    dw EnemyHeaders_FaceBlock                                            ;A191BD;
    dw $00B8,$0088,$0000,$A000,$0000,$0000,$0000                         ;A191BF;
    dw EnemyHeaders_FaceBlock                                            ;A191CD;
    dw $00E8,$0116,$0000,$A000,$0000,$0000,$0000                         ;A191CF;
    dw EnemyHeaders_FaceBlock                                            ;A191DD;
    dw $00E8,$0166,$0000,$A000,$0000,$0000,$0000                         ;A191DF;
    dw EnemyHeaders_FaceBlock                                            ;A191ED;
    dw $0018,$0116,$0000,$A000,$0000,$0000,$0000,$FFFF                   ;A191EF;
    db $02                                                               ;A191FF;

EnemyPopulations_BlueBrinstarETank_1:
    dw EnemyHeaders_Zoomer                                               ;A19200;
    dw $00A8,$02C8,$0003,$2800,$0000,$0002,$0000                         ;A19202;
    dw EnemyHeaders_Zoomer                                               ;A19210;
    dw $00D8,$02C8,$0003,$2000,$0000,$0002,$0000                         ;A19212;
    dw EnemyHeaders_Skree                                                ;A19220;
    dw $00DE,$024B,$0000,$2000,$0000,$0000,$0000                         ;A19222;
    dw EnemyHeaders_Skree                                                ;A19230;
    dw $00FE,$023B,$0000,$2000,$0000,$0000,$0000                         ;A19232;
    dw EnemyHeaders_Rio                                                  ;A19240;
    dw $01F0,$0240,$0000,$2000,$0000,$0000,$0000                         ;A19242;
    dw EnemyHeaders_FaceBlock                                            ;A19250;
    dw $0038,$0228,$0000,$A000,$0000,$0000,$0000                         ;A19252;
    dw EnemyHeaders_FaceBlock                                            ;A19260;
    dw $0038,$02A8,$0000,$A000,$0000,$0000,$0000                         ;A19262;
    dw EnemyHeaders_FaceBlock                                            ;A19270;
    dw $02E8,$02B8,$0000,$A000,$0000,$0000,$0000                         ;A19272;
    dw EnemyHeaders_FaceBlock                                            ;A19280;
    dw $0268,$0088,$0000,$A000,$0000,$0000,$0000                         ;A19282;
    dw EnemyHeaders_FaceBlock                                            ;A19290;
    dw $0288,$0088,$0000,$A000,$0000,$0000,$0000,$FFFF                   ;A19292;
    db $05                                                               ;A192A2;

EnemyPopulations_NoobBridge:
    dw EnemyHeaders_Cacatac                                              ;A192A3;
    dw $00C0,$00B3,$0000,$2000,$0000,$0100,$0301                         ;A192A5;
    dw EnemyHeaders_Cacatac                                              ;A192B3;
    dw $01B0,$00B3,$0000,$2000,$0000,$0100,$0301                         ;A192B5;
    dw EnemyHeaders_Cacatac                                              ;A192C3;
    dw $0570,$00B3,$0000,$2000,$0000,$0101,$0301                         ;A192C5;
    dw EnemyHeaders_Cacatac                                              ;A192D3;
    dw $03D0,$00B3,$0000,$2000,$0000,$0100,$0301                         ;A192D5;
    dw EnemyHeaders_Zeela                                                ;A192E3;
    dw $0248,$0076,$0002,$2801,$0000,$0000,$0002                         ;A192E5;
    dw EnemyHeaders_Zeela                                                ;A192F3;
    dw $02A8,$0076,$0002,$2801,$0000,$0000,$0002                         ;A192F5;
    dw EnemyHeaders_Zeela                                                ;A19303;
    dw $0300,$0076,$0002,$2801,$0000,$0000,$0002                         ;A19305;
    dw EnemyHeaders_Zeela                                                ;A19313;
    dw $0368,$0076,$0002,$2801,$0000,$0000,$0002,$FFFF                   ;A19315;
    db $08                                                               ;A19325;

EnemyPopulations_MorphBall_1:
    dw EnemyHeaders_Elevator                                             ;A19326;
    dw $0580,$02C2,$0000,$2C00,$0000,$0001,$0018                         ;A19328;
    dw EnemyHeaders_SidehopperLarge                                      ;A19336;
    dw $0098,$02A6,$0000,$2000,$0000,$0000,$0000                         ;A19338;
    dw EnemyHeaders_SidehopperLarge                                      ;A19346;
    dw $017C,$02A6,$0000,$2000,$0000,$0000,$0000                         ;A19348;
    dw EnemyHeaders_SidehopperLarge                                      ;A19356;
    dw $0107,$026C,$0000,$2000,$0000,$8000,$0000                         ;A19358;
    dw EnemyHeaders_FaceBlock                                            ;A19366;
    dw $0548,$0240,$0000,$A000,$0000,$0000,$0000                         ;A19368;
    dw EnemyHeaders_FaceBlock                                            ;A19376;
    dw $05B8,$0240,$0000,$A000,$0000,$0000,$0000                         ;A19378;
    dw EnemyHeaders_FaceBlock                                            ;A19386;
    dw $0488,$02B8,$0000,$A000,$0000,$0000,$0000                         ;A19388;
    dw EnemyHeaders_FaceBlock                                            ;A19396;
    dw $0428,$02B8,$0000,$A000,$0000,$0000,$0000,$FFFF                   ;A19398;
    db $03                                                               ;A193A8;

EnemyPopulations_WarehouseSave:
    dw $FFFF                                                             ;A193A9;
    db $00                                                               ;A193AB;

EnemyPopulations_MorphBall_0:
    dw EnemyHeaders_Eye                                                  ;A193AC;
    dw $0408,$0248,$0000,$2C00,$0000,$0000,$8000                         ;A193AE;
    dw EnemyHeaders_Eye                                                  ;A193BC;
    dw $0408,$0248,$0000,$2C00,$0000,$0001,$0000                         ;A193BE;
    dw EnemyHeaders_Elevator                                             ;A193CC;
    dw $0580,$02C2,$0000,$2C00,$0000,$0001,$0018                         ;A193CE;
    dw EnemyHeaders_FaceBlock                                            ;A193DC;
    dw $0548,$0240,$0000,$A000,$0000,$0040,$0001                         ;A193DE;
    dw EnemyHeaders_FaceBlock                                            ;A193EC;
    dw $05B8,$0240,$0000,$A000,$0000,$0040,$0000                         ;A193EE;
    dw EnemyHeaders_FaceBlock                                            ;A193FC;
    dw $0488,$02B8,$0000,$A000,$0000,$0040,$0000                         ;A193FE;
    dw EnemyHeaders_FaceBlock                                            ;A1940C;
    dw $0428,$02B8,$0000,$A000,$0000,$0040,$0001,$FFFF                   ;A1940E;
    db $00                                                               ;A1941E;

EnemyPopulations_WarehouseZeela:
    dw EnemyHeaders_Zeela                                                ;A1941F;
    dw $006A,$0040,$0001,$2800,$0000,$0002,$0002                         ;A19421;
    dw EnemyHeaders_Zeela                                                ;A1942F;
    dw $006A,$0068,$0001,$2800,$0000,$0002,$0002                         ;A19431;
    dw EnemyHeaders_Zeela                                                ;A1943F;
    dw $002B,$00E8,$0003,$2800,$0000,$0002,$0002,$FFFF                   ;A19441;
    db $03                                                               ;A19451;

EnemyPopulations_RedTower:
    dw EnemyHeaders_Ripper                                               ;A19452;
    dw $0098,$0208,$0000,$2000,$0000,$0010,$0000                         ;A19454;
    dw EnemyHeaders_Ripper                                               ;A19462;
    dw $0060,$00E8,$0000,$2000,$0000,$0010,$0001                         ;A19464;
    dw EnemyHeaders_Ripper                                               ;A19472;
    dw $0098,$0140,$0000,$2000,$0000,$0010,$0000                         ;A19474;
    dw EnemyHeaders_Ripper                                               ;A19482;
    dw $0068,$01A0,$0000,$2000,$0000,$0010,$0001                         ;A19484;
    dw EnemyHeaders_Beetom                                               ;A19492;
    dw $00CF,$0658,$0000,$2000,$0000,$0000,$0000                         ;A19494;
    dw EnemyHeaders_Ripper                                               ;A194A2;
    dw $0098,$0948,$0000,$2000,$0000,$0010,$0000                         ;A194A4;
    dw EnemyHeaders_Ripper                                               ;A194B2;
    dw $005F,$08E8,$0000,$2000,$0000,$0010,$0001                         ;A194B4;
    dw EnemyHeaders_Ripper                                               ;A194C2;
    dw $009D,$0888,$0000,$2000,$0000,$0010,$0000                         ;A194C4;
    dw EnemyHeaders_Ripper                                               ;A194D2;
    dw $0068,$0800,$0000,$2000,$0000,$0010,$0001                         ;A194D4;
    dw EnemyHeaders_Geega                                                ;A194E2;
    dw $0018,$0530,$0000,$6100,$0000,$0000,$0020                         ;A194E4;
    dw EnemyHeaders_Geega                                                ;A194F2;
    dw $00C8,$0550,$0000,$6100,$0000,$0001,$0020,$FFFF                   ;A194F4;
    db $0B                                                               ;A19504;

EnemyPopulations_BlueBrinstarBoulders:
    dw EnemyHeaders_Boulder                                              ;A19505;
    dw $0158,$00C0,$0080,$2000,$0000,$0200,$A050                         ;A19507;
    dw EnemyHeaders_Boulder                                              ;A19515;
    dw $00F0,$00C0,$0080,$2000,$0000,$0200,$A050                         ;A19517;
    dw EnemyHeaders_Boulder                                              ;A19525;
    dw $0090,$00C0,$0080,$2000,$0000,$0200,$A050,$FFFF                   ;A19527;
    db $00                                                               ;A19537;

EnemyPopulations_BillyMays:
    dw $FFFF                                                             ;A19538;
    db $00                                                               ;A1953A;

EnemyPopulations_BigPinkSaveRoom:
    dw $FFFF                                                             ;A1953B;
    db $00                                                               ;A1953D;

EnemyPopulations_BigPink:
    dw EnemyHeaders_Rio                                                  ;A1953E;
    dw $02E8,$0478,$0000,$2000,$0000,$0000,$0000                         ;A19540;
    dw EnemyHeaders_Rio                                                  ;A1954E;
    dw $0328,$0478,$0000,$2800,$0000,$0000,$0000                         ;A19550;
    dw EnemyHeaders_Rio                                                  ;A1955E;
    dw $0335,$05A9,$0000,$2000,$0000,$0000,$0000                         ;A19560;
    dw EnemyHeaders_Sidehopper                                           ;A1956E;
    dw $0239,$00FC,$0000,$2000,$0000,$0001,$0000                         ;A19570;
    dw EnemyHeaders_Sidehopper                                           ;A1957E;
    dw $02F8,$00ED,$0000,$2000,$0000,$0001,$0000                         ;A19580;
    dw EnemyHeaders_Sidehopper                                           ;A1958E;
    dw $0250,$0418,$0000,$2000,$0000,$0000,$0000                         ;A19590;
    dw EnemyHeaders_Sidehopper                                           ;A1959E;
    dw $02B0,$0418,$0000,$2000,$0000,$0000,$0000                         ;A195A0;
    dw EnemyHeaders_Zeb                                                  ;A195AE;
    dw $02C0,$0098,$0000,$6900,$0000,$0000,$0000                         ;A195B0;
    dw EnemyHeaders_Zeb                                                  ;A195BE;
    dw $02B0,$0228,$0000,$6900,$0000,$0000,$0000                         ;A195C0;
    dw EnemyHeaders_Zeb                                                  ;A195CE;
    dw $0320,$0549,$0000,$6900,$0000,$0000,$0000,$FFFF                   ;A195D0;
    db $0A                                                               ;A195E0;

EnemyPopulations_EtecoonSave:
    dw $FFFF                                                             ;A195E1;
    db $00                                                               ;A195E3;

EnemyPopulations_BelowSpazer:
    dw EnemyHeaders_YappingMaw                                           ;A195E4;
    dw $0190,$01C8,$0000,$2000,$0000,$0030,$0001                         ;A195E6;
    dw EnemyHeaders_YappingMaw                                           ;A195F4;
    dw $0080,$01C8,$0000,$2000,$0000,$0030,$0001                         ;A195F6;
    dw EnemyHeaders_Cacatac                                              ;A19604;
    dw $0108,$0193,$0000,$2000,$0000,$0100,$0200,$FFFF                   ;A19606;
    db $01                                                               ;A19616;

EnemyPopulations_GreenBrinstarSave:
    dw $FFFF                                                             ;A19617;
    db $00                                                               ;A19619;

EnemyPopulations_Spazer:
    dw $FFFF                                                             ;A1961A;
    db $00                                                               ;A1961C;

EnemyPopulations_PinkBrinstarPowerBombs:
    dw EnemyHeaders_ShutterShootable                                     ;A1961D;
    dw $0038,$0190,$0008,$A800,$FFFF,$6004,$0000                         ;A1961F;
    dw EnemyHeaders_ShutterShootable                                     ;A1962D;
    dw $0198,$01F0,$0008,$A800,$FFFF,$4004,$0000                         ;A1962F;
    dw EnemyHeaders_SidehopperLarge                                      ;A1963D;
    dw $00F1,$00A6,$0000,$2000,$0000,$0000,$0000                         ;A1963F;
    dw EnemyHeaders_SidehopperLarge                                      ;A1964D;
    dw $0068,$0064,$0000,$2000,$0000,$8000,$0000,$FFFF                   ;A1964F;
    db $02                                                               ;A1965F;

EnemyPopulations_RedTowerRefill:
    dw $FFFF                                                             ;A19660;
    db $00                                                               ;A19662;

EnemyPopulations_KraidRefill:
    dw $FFFF                                                             ;A19663;
    db $00                                                               ;A19665;

EnemyPopulations_VariaSuit:
    dw $FFFF                                                             ;A19666;
    db $00                                                               ;A19668;

EnemyPopulations_RedBrinstarSave:
    dw $FFFF                                                             ;A19669;
    db $00                                                               ;A1966B;

UNUSED_EnemyPopulations_A1966C:
    dw $FFFF                                                             ;A1966C;
    db $00                                                               ;A1966E;

EnemyPopulations_BlueBrinstarETank_0:
    dw EnemyHeaders_Eye                                                  ;A1966F;
    dw $0228,$0268,$0000,$2C00,$0000,$0000,$8001                         ;A19671;
    dw EnemyHeaders_Eye                                                  ;A1967F;
    dw $0228,$0268,$0000,$2C00,$0000,$0000,$0000                         ;A19681;
    dw EnemyHeaders_FaceBlock                                            ;A1968F;
    dw $0038,$0228,$0000,$A000,$0000,$0000,$0000                         ;A19691;
    dw EnemyHeaders_FaceBlock                                            ;A1969F;
    dw $0038,$02A8,$0000,$A000,$0000,$0000,$0000                         ;A196A1;
    dw EnemyHeaders_FaceBlock                                            ;A196AF;
    dw $02E8,$02B8,$0000,$A000,$0000,$0000,$0000                         ;A196B1;
    dw EnemyHeaders_FaceBlock                                            ;A196BF;
    dw $0268,$0088,$0000,$A000,$0000,$0000,$0000                         ;A196C1;
    dw EnemyHeaders_FaceBlock                                            ;A196CF;
    dw $0288,$0088,$0000,$A000,$0000,$0000,$0000,$FFFF                   ;A196D1;
    db $00                                                               ;A196E1;

EnemyPopulations_GreenBrinstarFirefleas:
    dw EnemyHeaders_Fireflea                                             ;A196E2;
    dw $0180,$005F,$0000,$2000,$0000,$0002,$0210                         ;A196E4;
    dw EnemyHeaders_Fireflea                                             ;A196F2;
    dw $00E1,$006A,$0000,$2000,$0000,$0003,$0210                         ;A196F4;
    dw EnemyHeaders_Fireflea                                             ;A19702;
    dw $0045,$005B,$0000,$2000,$0000,$0002,$0210                         ;A19704;
    dw EnemyHeaders_Fireflea                                             ;A19712;
    dw $0070,$0118,$0000,$2000,$0000,$0000,$0308                         ;A19714;
    dw EnemyHeaders_Fireflea                                             ;A19722;
    dw $00A0,$0138,$0000,$2000,$0000,$0000,$0408,$FFFF                   ;A19724;
    db $05                                                               ;A19734;

EnemyPopulations_GreenBrinstarBeetoms:
    dw EnemyHeaders_Beetom                                               ;A19735;
    dw $0050,$00B8,$0000,$2000,$0000,$0000,$0000                         ;A19737;
    dw EnemyHeaders_Beetom                                               ;A19745;
    dw $0070,$00B8,$0000,$2000,$0000,$0000,$0000                         ;A19747;
    dw EnemyHeaders_Beetom                                               ;A19755;
    dw $0090,$00B8,$0000,$2000,$0000,$0000,$0000                         ;A19757;
    dw EnemyHeaders_Beetom                                               ;A19765;
    dw $00B0,$00B8,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A19767;
    db $04                                                               ;A19777;

EnemyPopulations_EtecoonETank:
    dw EnemyHeaders_Zebbo                                                ;A19778;
    dw $0250,$01D8,$0000,$6900,$0000,$0002,$0000                         ;A1977A;
    dw EnemyHeaders_Zebbo                                                ;A19788;
    dw $02F0,$01D8,$0000,$6900,$0000,$0002,$0000                         ;A1978A;
    dw EnemyHeaders_Zebbo                                                ;A19798;
    dw $0430,$01D8,$0000,$6900,$0000,$0002,$0000                         ;A1979A;
    dw EnemyHeaders_Beetom                                               ;A197A8;
    dw $01D8,$0198,$0000,$2000,$0000,$0000,$0000                         ;A197AA;
    dw EnemyHeaders_Beetom                                               ;A197B8;
    dw $0278,$0198,$0000,$2000,$0000,$0000,$0000                         ;A197BA;
    dw EnemyHeaders_Beetom                                               ;A197C8;
    dw $0360,$01A8,$0000,$2000,$0000,$0000,$0000                         ;A197CA;
    dw EnemyHeaders_Beetom                                               ;A197D8;
    dw $03D8,$01A8,$0000,$2000,$0000,$0000,$0000                         ;A197DA;
    dw EnemyHeaders_Beetom                                               ;A197E8;
    dw $0458,$01A8,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A197EA;
    db $08                                                               ;A197FA;

EnemyPopulations_PinkBrinstarHoppers:
    dw EnemyHeaders_SidehopperLarge                                      ;A197FB;
    dw $00B5,$01B5,$0000,$2000,$0000,$0000,$0000                         ;A197FD;
    dw EnemyHeaders_Sidehopper                                           ;A1980B;
    dw $00F8,$01A0,$0000,$2000,$0000,$0000,$0000                         ;A1980D;
    dw EnemyHeaders_Sidehopper                                           ;A1981B;
    dw $006A,$01C1,$0000,$2000,$0000,$0000,$0000                         ;A1981D;
    dw EnemyHeaders_ShutterShootable                                     ;A1982B;
    dw $0158,$01E0,$0008,$A800,$00FF,$4003,$0000                         ;A1982D;
    dw EnemyHeaders_ShutterShootable                                     ;A1983B;
    dw $0158,$01E0,$0008,$A800,$00FF,$8003,$0000                         ;A1983D;
    dw EnemyHeaders_ShutterShootable                                     ;A1984B;
    dw $0158,$01E0,$0008,$A800,$00FF,$C003,$0000                         ;A1984D;
    dw EnemyHeaders_ShutterShootable                                     ;A1985B;
    dw $0158,$01E0,$0008,$A800,$00FF,$F003,$0000                         ;A1985D;
    dw EnemyHeaders_ShutterShootable                                     ;A1986B;
    dw $0148,$01E0,$0000,$A800,$0000,$0000,$0000                         ;A1986D;
    dw EnemyHeaders_ShutterShootable                                     ;A1987B;
    dw $0168,$01E0,$0000,$A800,$0000,$0000,$0000,$FFFF                   ;A1987D;
    db $03                                                               ;A1988D;

EnemyPopulations_WarehouseETank:
    dw EnemyHeaders_Beetom                                               ;A1988E;
    dw $002D,$0098,$0000,$2000,$0000,$0000,$0000                         ;A19890;
    dw EnemyHeaders_Beetom                                               ;A1989E;
    dw $0047,$0098,$0000,$2000,$0000,$0000,$0000                         ;A198A0;
    dw EnemyHeaders_Beetom                                               ;A198AE;
    dw $008B,$00A8,$0000,$2000,$0000,$0000,$0000                         ;A198B0;
    dw EnemyHeaders_Beetom                                               ;A198BE;
    dw $0060,$0098,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A198C0;
    db $04                                                               ;A198D0;

UNUSED_EnemyPopulations_A198D1:
    dw EnemyHeaders_Elevator                                             ;A198D1;
    dw $0080,$00A0,$0000,$2C00,$0000,$0000,$0140,$FFFF                   ;A198D3;
    db $00                                                               ;A198E3;

EnemyPopulations_WarehouseEntrance:
    dw EnemyHeaders_Elevator                                             ;A198E4;
    dw $0080,$00A0,$0000,$2C00,$0000,$0000,$0140,$FFFF                   ;A198E6;
    db $00                                                               ;A198F6;

EnemyPopulations_WarehouseKihunter:
    dw EnemyHeaders_KihunterGreen                                        ;A198F7;
    dw $0169,$0070,$0000,$2800,$0000,$0000,$0000                         ;A198F9;
    dw EnemyHeaders_KihunterGreenWings                                   ;A19907;
    dw $0169,$0070,$0000,$2C00,$0000,$0020,$0000                         ;A19909;
    dw EnemyHeaders_KihunterGreen                                        ;A19917;
    dw $0289,$0059,$0000,$2800,$0000,$0000,$0000                         ;A19919;
    dw EnemyHeaders_KihunterGreenWings                                   ;A19927;
    dw $0289,$0059,$0000,$2C00,$0000,$0020,$0000                         ;A19929;
    dw EnemyHeaders_KihunterGreen                                        ;A19937;
    dw $01FE,$0063,$0000,$2800,$0000,$0000,$0000                         ;A19939;
    dw EnemyHeaders_KihunterGreenWings                                   ;A19947;
    dw $01FE,$0063,$0000,$2C00,$0000,$0020,$0000                         ;A19949;
    dw EnemyHeaders_KihunterGreen                                        ;A19957;
    dw $0242,$007A,$0000,$2800,$0000,$0000,$0000                         ;A19959;
    dw EnemyHeaders_KihunterGreenWings                                   ;A19967;
    dw $0242,$007A,$0000,$2C00,$0000,$0020,$0000,$FFFF                   ;A19969;
    db $04                                                               ;A19979;

EnemyPopulations_GreenBrinstarMainShaft:
    dw EnemyHeaders_Elevator                                             ;A1997A;
    dw $0080,$02C2,$0000,$2C00,$0000,$0001,$0018                         ;A1997C;
    dw EnemyHeaders_Zeela                                                ;A1998A;
    dw $00DA,$02CB,$0001,$2803,$0000,$0001,$0002                         ;A1998C;
    dw EnemyHeaders_Zeela                                                ;A1999A;
    dw $0070,$0398,$0003,$2001,$0000,$0001,$0002                         ;A1999C;
    dw EnemyHeaders_Ripper2                                              ;A199AA;
    dw $006C,$03F6,$0000,$2000,$0000,$0018,$0001                         ;A199AC;
    dw EnemyHeaders_Zeela                                                ;A199BA;
    dw $0079,$06E8,$0003,$2000,$0000,$0001,$0002                         ;A199BC;
    dw EnemyHeaders_Ripper2                                              ;A199CA;
    dw $0043,$0548,$0000,$2000,$0000,$0018,$0001                         ;A199CC;
    dw EnemyHeaders_Zeela                                                ;A199DA;
    dw $007B,$05F8,$0001,$2002,$0000,$0001,$0002                         ;A199DC;
    dw EnemyHeaders_Zeela                                                ;A199EA;
    dw $0027,$03CC,$0000,$2003,$0000,$0001,$0002                         ;A199EC;
    dw EnemyHeaders_Etecoon                                              ;A199FA;
    dw $025F,$0B98,$0000,$0C00,$0000,$0000,$0000                         ;A199FC;
    dw EnemyHeaders_Etecoon                                              ;A19A0A;
    dw $026F,$0B98,$0000,$0C00,$0000,$0000,$0001                         ;A19A0C;
    dw EnemyHeaders_Etecoon                                              ;A19A1A;
    dw $027F,$0B98,$0000,$0C00,$0000,$0000,$0002,$FFFF                   ;A19A1C;
    db $07                                                               ;A19A2C;

EnemyPopulations_SporeSpawnSuper:
    dw EnemyHeaders_Zeb                                                  ;A19A2D;
    dw $00C0,$00B8,$0000,$6900,$0000,$0000,$0000,$FFFF                   ;A19A2F;
    db $01                                                               ;A19A3F;

EnemyPopulations_EarlySupers:
    dw EnemyHeaders_Sidehopper                                           ;A19A40;
    dw $01BA,$01A8,$0000,$2000,$0000,$0000,$0000                         ;A19A42;
    dw EnemyHeaders_Sidehopper                                           ;A19A50;
    dw $0200,$01A8,$0000,$2000,$0000,$0000,$0000                         ;A19A52;
    dw EnemyHeaders_ShutterGrowing                                       ;A19A60;
    dw $0198,$0128,$0001,$A800,$0000,$0090,$0010                         ;A19A62;
    dw EnemyHeaders_ShutterGrowing                                       ;A19A70;
    dw $0228,$0128,$0001,$A800,$0000,$0090,$0010                         ;A19A72;
    dw EnemyHeaders_ShutterGrowing                                       ;A19A80;
    dw $0288,$0128,$0001,$A800,$0000,$0090,$0010                         ;A19A82;
    dw EnemyHeaders_Waver                                                ;A19A90;
    dw $00AB,$004B,$0000,$2000,$0000,$0000,$0000                         ;A19A92;
    dw EnemyHeaders_Waver                                                ;A19AA0;
    dw $0108,$006B,$0000,$2800,$0000,$0001,$0000                         ;A19AA2;
    dw EnemyHeaders_Waver                                                ;A19AB0;
    dw $0211,$0065,$0000,$2000,$0000,$0001,$0000                         ;A19AB2;
    dw EnemyHeaders_Waver                                                ;A19AC0;
    dw $0141,$0056,$0000,$2800,$0000,$0001,$0000                         ;A19AC2;
    dw EnemyHeaders_Zeb                                                  ;A19AD0;
    dw $0090,$01B8,$0000,$6900,$0000,$0000,$0000                         ;A19AD2;
    dw EnemyHeaders_Sidehopper                                           ;A19AE0;
    dw $0142,$0085,$0000,$2000,$0000,$0000,$0000                         ;A19AE2;
    dw EnemyHeaders_Sidehopper                                           ;A19AF0;
    dw $01C3,$0084,$0000,$2000,$0000,$0000,$0000                         ;A19AF2;
    dw EnemyHeaders_Sidehopper                                           ;A19B00;
    dw $0183,$003D,$0000,$2000,$0000,$0001,$0000,$FFFF                   ;A19B02;
    db $0A                                                               ;A19B12;

EnemyPopulations_RedBrinstarFirefleas:
    dw EnemyHeaders_Fireflea                                             ;A19B13;
    dw $06D0,$0090,$0000,$2000,$0000,$0000,$0306                         ;A19B15;
    dw EnemyHeaders_Fireflea                                             ;A19B23;
    dw $0710,$0070,$0000,$2000,$0000,$0002,$0518                         ;A19B25;
    dw EnemyHeaders_Fireflea                                             ;A19B33;
    dw $0688,$0060,$0000,$2000,$0000,$0003,$0418                         ;A19B35;
    dw EnemyHeaders_Fireflea                                             ;A19B43;
    dw $04E0,$00A8,$0000,$2000,$0000,$0002,$0210                         ;A19B45;
    dw EnemyHeaders_Fireflea                                             ;A19B53;
    dw $0630,$0080,$0000,$2000,$0000,$0003,$0220                         ;A19B55;
    dw EnemyHeaders_Waver                                                ;A19B63;
    dw $0745,$0050,$0000,$2800,$0000,$0000,$0000                         ;A19B65;
    dw EnemyHeaders_Waver                                                ;A19B73;
    dw $0690,$0060,$0000,$2800,$0000,$0000,$0000                         ;A19B75;
    dw EnemyHeaders_Waver                                                ;A19B83;
    dw $0600,$0060,$0000,$2800,$0000,$0001,$0000                         ;A19B85;
    dw EnemyHeaders_YappingMaw                                           ;A19B93;
    dw $0198,$00C8,$0000,$2000,$0000,$0050,$0001                         ;A19B95;
    dw EnemyHeaders_YappingMaw                                           ;A19BA3;
    dw $0258,$00C0,$0000,$2000,$0000,$0050,$0001                         ;A19BA5;
    dw EnemyHeaders_YappingMaw                                           ;A19BB3;
    dw $03A8,$00C0,$0000,$2000,$0000,$0050,$0001,$FFFF                   ;A19BB5;
    db $08                                                               ;A19BC5;

EnemyPopulations_ConstructionZone_0:
    dw EnemyHeaders_Sbug                                                 ;A19BC6;
    dw $002E,$00C0,$0000,$2400,$0000,$8A03,$0050                         ;A19BC8;
    dw EnemyHeaders_Sbug                                                 ;A19BD6;
    dw $00DE,$00B3,$0000,$2400,$0000,$C803,$0050                         ;A19BD8;
    dw EnemyHeaders_Sbug                                                 ;A19BE6;
    dw $00DB,$00B7,$0000,$2400,$0000,$F802,$0050                         ;A19BE8;
    dw EnemyHeaders_Sbug                                                 ;A19BF6;
    dw $00D9,$00B1,$0000,$2400,$0000,$EC02,$0050                         ;A19BF8;
    dw EnemyHeaders_Sbug                                                 ;A19C06;
    dw $00D7,$00C1,$0000,$2400,$0000,$F403,$0050                         ;A19C08;
    dw EnemyHeaders_Sbug                                                 ;A19C16;
    dw $00B3,$01D3,$0000,$2400,$0000,$C402,$0050                         ;A19C18;
    dw EnemyHeaders_Sbug                                                 ;A19C26;
    dw $00B9,$01DB,$0000,$2400,$0000,$D003,$0050                         ;A19C28;
    dw EnemyHeaders_Sbug                                                 ;A19C36;
    dw $00BB,$01EA,$0000,$2400,$0000,$DC03,$0050                         ;A19C38;
    dw EnemyHeaders_Sbug                                                 ;A19C46;
    dw $00AE,$01DC,$0000,$2400,$0000,$BB02,$0050                         ;A19C48;
    dw EnemyHeaders_Sbug                                                 ;A19C56;
    dw $00D5,$01F0,$0000,$2400,$0000,$0303,$0080                         ;A19C58;
    dw EnemyHeaders_FaceBlock                                            ;A19C66;
    dw $0048,$0088,$0000,$A000,$0000,$0000,$0000                         ;A19C68;
    dw EnemyHeaders_FaceBlock                                            ;A19C76;
    dw $00B8,$0088,$0000,$A000,$0000,$0000,$0001                         ;A19C78;
    dw EnemyHeaders_FaceBlock                                            ;A19C86;
    dw $00E8,$0116,$0000,$A000,$0000,$0000,$0000                         ;A19C88;
    dw EnemyHeaders_FaceBlock                                            ;A19C96;
    dw $00E8,$0166,$0000,$A000,$0000,$0000,$0000                         ;A19C98;
    dw EnemyHeaders_FaceBlock                                            ;A19CA6;
    dw $0018,$0116,$0000,$A000,$0000,$0000,$0000,$FFFF                   ;A19CA8;
    db $00                                                               ;A19CB8;

EnemyPopulations_GreenHillZone:
    dw EnemyHeaders_Sidehopper                                           ;A19CB9;
    dw $0400,$02A0,$0000,$2000,$0000,$0000,$0000                         ;A19CBB;
    dw EnemyHeaders_Sidehopper                                           ;A19CC9;
    dw $0500,$0300,$0000,$2000,$0000,$0000,$0000                         ;A19CCB;
    dw EnemyHeaders_Sidehopper                                           ;A19CD9;
    dw $0687,$03B6,$0000,$2000,$0000,$0000,$0000                         ;A19CDB;
    dw EnemyHeaders_Geega                                                ;A19CE9;
    dw $0170,$0120,$0000,$6100,$0000,$0001,$0024                         ;A19CEB;
    dw EnemyHeaders_Geega                                                ;A19CF9;
    dw $0230,$01E0,$0000,$6100,$0000,$0000,$0024                         ;A19CFB;
    dw EnemyHeaders_Geega                                                ;A19D09;
    dw $0380,$0220,$0000,$6100,$0000,$0001,$0024                         ;A19D0B;
    dw EnemyHeaders_Geega                                                ;A19D19;
    dw $0560,$02E0,$0000,$6100,$0000,$0001,$0024                         ;A19D1B;
    dw EnemyHeaders_Geega                                                ;A19D29;
    dw $0500,$0340,$0000,$6100,$0000,$0000,$0024                         ;A19D2B;
    dw EnemyHeaders_Sidehopper                                           ;A19D39;
    dw $06D0,$0350,$0000,$2000,$0000,$0001,$0000                         ;A19D3B;
    dw EnemyHeaders_Sidehopper                                           ;A19D49;
    dw $0718,$0350,$0000,$2000,$0000,$0001,$0000,$FFFF                   ;A19D4B;
    db $0A                                                               ;A19D5B;

EnemyPopulations_Dachora:
    dw EnemyHeaders_Zeela                                                ;A19D5C;
    dw $00E0,$00B8,$0000,$2803,$0000,$0002,$0002                         ;A19D5E;
    dw EnemyHeaders_Zeela                                                ;A19D6C;
    dw $0108,$00B8,$0000,$2003,$0000,$0002,$0002                         ;A19D6E;
    dw EnemyHeaders_Metaree                                              ;A19D7C;
    dw $062D,$006C,$0000,$2000,$0000,$0000,$0000                         ;A19D7E;
    dw EnemyHeaders_Metaree                                              ;A19D8C;
    dw $0658,$004C,$0000,$2000,$0000,$0000,$0000                         ;A19D8E;
    dw EnemyHeaders_Metaree                                              ;A19D9C;
    dw $0673,$004C,$0000,$2000,$0000,$0000,$0000                         ;A19D9E;
    dw EnemyHeaders_Rio                                                  ;A19DAC;
    dw $0130,$0060,$0000,$2000,$0000,$0000,$0000                         ;A19DAE;
    dw EnemyHeaders_Rio                                                  ;A19DBC;
    dw $01B0,$0060,$0000,$2000,$0000,$0000,$0000                         ;A19DBE;
    dw EnemyHeaders_Rio                                                  ;A19DCC;
    dw $02E8,$0060,$0000,$2000,$0000,$0000,$0000                         ;A19DCE;
    dw EnemyHeaders_Dachora                                              ;A19DDC;
    dw $0060,$06A8,$0000,$0C00,$0000,$0001,$0000                         ;A19DDE;
    dw EnemyHeaders_Dachora                                              ;A19DEC;
    dw $0060,$06A8,$0000,$0D00,$0000,$8001,$0000                         ;A19DEE;
    dw EnemyHeaders_Dachora                                              ;A19DFC;
    dw $0060,$06A8,$0000,$0D00,$0000,$8001,$0000                         ;A19DFE;
    dw EnemyHeaders_Dachora                                              ;A19E0C;
    dw $0060,$06A8,$0000,$0D00,$0000,$8001,$0000                         ;A19E0E;
    dw EnemyHeaders_Dachora                                              ;A19E1C;
    dw $0060,$06A8,$0000,$0D00,$0000,$8001,$0000,$FFFF                   ;A19E1E;
    db $08                                                               ;A19E2E;

EnemyPopulations_Hellway:
    dw EnemyHeaders_Zeela                                                ;A19E2F;
    dw $00A0,$0098,$0003,$2000,$0000,$0002,$0002                         ;A19E31;
    dw EnemyHeaders_Zeela                                                ;A19E3F;
    dw $0127,$0088,$0003,$2001,$0000,$0002,$0002                         ;A19E41;
    dw EnemyHeaders_Zeela                                                ;A19E4F;
    dw $0170,$0098,$0003,$2000,$0000,$0002,$0002                         ;A19E51;
    dw EnemyHeaders_Zeela                                                ;A19E5F;
    dw $01BF,$0098,$0003,$2001,$0000,$0002,$0002                         ;A19E61;
    dw EnemyHeaders_Zebbo                                                ;A19E6F;
    dw $01A0,$00D8,$0000,$6900,$0000,$0002,$0000                         ;A19E71;
    dw EnemyHeaders_Zebbo                                                ;A19E7F;
    dw $0100,$00D8,$0000,$6900,$0000,$0002,$0000                         ;A19E81;
    dw EnemyHeaders_Zebbo                                                ;A19E8F;
    dw $01E0,$00D8,$0000,$6900,$0000,$0002,$0000                         ;A19E91;
    dw EnemyHeaders_Zebbo                                                ;A19E9F;
    dw $0080,$00D8,$0000,$6900,$0000,$0002,$0000,$FFFF                   ;A19EA1;
    db $08                                                               ;A19EB1;

EnemyPopulations_FirstMissile:
    dw $FFFF                                                             ;A19EB2;
    db $00                                                               ;A19EB4;

EnemyPopulations_Kraid:
    dw EnemyHeaders_Kraid                                                ;A19EB5;
    dw $0100,$0218,$0000,$0D00,$0004,$0000,$0000                         ;A19EB7;
    dw EnemyHeaders_KraidArm                                             ;A19EC5;
    dw $00E8,$01E8,$0000,$2800,$0004,$0000,$0001                         ;A19EC7;
    dw EnemyHeaders_LintTop                                              ;A19ED5;
    dw $00C8,$0210,$0000,$A800,$0000,$0000,$0000                         ;A19ED7;
    dw EnemyHeaders_LintMiddle                                           ;A19EE5;
    dw $00B0,$0250,$0000,$A800,$0000,$0000,$0001                         ;A19EE7;
    dw EnemyHeaders_LintBottom                                           ;A19EF5;
    dw $00B2,$0288,$0000,$A800,$0000,$0000,$0002                         ;A19EF7;
    dw EnemyHeaders_KraidFoot                                            ;A19F05;
    dw $0100,$0278,$0000,$2C00,$0004,$0000,$0003                         ;A19F07;
    dw EnemyHeaders_KraidNail                                            ;A19F15;
    dw $00E8,$01E8,$0000,$6800,$0000,$0000,$0000                         ;A19F17;
    dw EnemyHeaders_KraidNailBad                                         ;A19F25;
    dw $00E8,$01E8,$0000,$6800,$0000,$0000,$0000,$FFFF                   ;A19F27;
    db $00                                                               ;A19F37;

EnemyPopulations_BrinstarReserveTank:
    dw $FFFF                                                             ;A19F38;
    db $00                                                               ;A19F3A;

EnemyPopulations_XrayScope:
    dw EnemyHeaders_ShutterShootable                                     ;A19F3B;
    dw $0168,$00A0,$0008,$A800,$FFFF,$4004,$0000                         ;A19F3D;
    dw EnemyHeaders_ShutterShootable                                     ;A19F4B;
    dw $00B8,$00E0,$0008,$A800,$FFFF,$4004,$0000,$FFFF                   ;A19F4D;
    db $00                                                               ;A19F5D;

EnemyPopulations_StatuesHallway:
    dw $FFFF                                                             ;A19F5E;
    db $00                                                               ;A19F60;

EnemyPopulations_AlphaPowerBomb:
    dw EnemyHeaders_Boyon                                                ;A19F61;
    dw $0258,$00A8,$0000,$2000,$0000,$0003,$0020                         ;A19F63;
    dw EnemyHeaders_Boyon                                                ;A19F71;
    dw $0268,$00A8,$0000,$2000,$0000,$0003,$0020                         ;A19F73;
    dw EnemyHeaders_Boyon                                                ;A19F81;
    dw $01F8,$00A8,$0000,$2000,$0000,$0003,$0020                         ;A19F83;
    dw EnemyHeaders_Boyon                                                ;A19F91;
    dw $0208,$00A8,$0000,$2000,$0000,$0003,$0020,$FFFF                   ;A19F93;
    db $00                                                               ;A19FA3;

EnemyPopulations_KraidEyeDoor:
    dw EnemyHeaders_Zeb                                                  ;A19FA4;
    dw $0090,$01C8,$0000,$6900,$0000,$0000,$0000                         ;A19FA6;
    dw EnemyHeaders_Sbug                                                 ;A19FB4;
    dw $0136,$019D,$0000,$2400,$0000,$C803,$0030                         ;A19FB6;
    dw EnemyHeaders_Sbug                                                 ;A19FC4;
    dw $0137,$01A4,$0000,$2400,$0000,$BA03,$0030                         ;A19FC6;
    dw EnemyHeaders_Sbug                                                 ;A19FD4;
    dw $013D,$01AB,$0000,$2400,$0000,$A802,$0030                         ;A19FD6;
    dw EnemyHeaders_Sbug                                                 ;A19FE4;
    dw $0133,$01AC,$0000,$2400,$0000,$B403,$0030                         ;A19FE6;
    dw EnemyHeaders_Sbug                                                 ;A19FF4;
    dw $013B,$019E,$0000,$2400,$0000,$CA02,$0030                         ;A19FF6;
    dw EnemyHeaders_Sbug                                                 ;A1A004;
    dw $0142,$01A4,$0000,$2400,$0000,$C903,$0030                         ;A1A006;
    dw EnemyHeaders_Sbug                                                 ;A1A014;
    dw $0145,$01A7,$0000,$2400,$0000,$BE02,$0030                         ;A1A016;
    dw EnemyHeaders_Sbug                                                 ;A1A024;
    dw $0143,$01AF,$0000,$2400,$0000,$C203,$0030                         ;A1A026;
    dw EnemyHeaders_Sbug                                                 ;A1A034;
    dw $0137,$01B0,$0000,$2400,$0000,$9003,$0030                         ;A1A036;
    dw EnemyHeaders_Sbug                                                 ;A1A044;
    dw $014E,$01AC,$0000,$2400,$0000,$C802,$0020,$FFFF                   ;A1A046;
    db $01                                                               ;A1A056;

EnemyPopulations_Caterpillar:
    dw EnemyHeaders_Elevator                                             ;A1A057;
    dw $0080,$02C2,$0000,$2C00,$0000,$0001,$0018                         ;A1A059;
    dw EnemyHeaders_Zero                                                 ;A1A067;
    dw $005F,$0788,$0003,$2001,$0000,$0000,$0000                         ;A1A069;
    dw EnemyHeaders_Zero                                                 ;A1A077;
    dw $0017,$06DE,$0000,$2002,$0000,$0000,$0000                         ;A1A079;
    dw EnemyHeaders_Zero                                                 ;A1A087;
    dw $0078,$068F,$0001,$2002,$0000,$0000,$0000                         ;A1A089;
    dw EnemyHeaders_Cacatac                                              ;A1A097;
    dw $0071,$0473,$0000,$2000,$0000,$0101,$0300                         ;A1A099;
    dw EnemyHeaders_Cacatac                                              ;A1A0A7;
    dw $00C0,$0503,$0000,$2000,$0000,$0100,$0300,$FFFF                   ;A1A0A9;
    db $05                                                               ;A1A0B9;

EnemyPopulations_MiniKraid:
    dw EnemyHeaders_PirateGreenWalking                                   ;A1A0BA;
    dw $00D9,$00A0,$0000,$2000,$0004,$8000,$0050                         ;A1A0BC;
    dw EnemyHeaders_PirateGreenWalking                                   ;A1A0CA;
    dw $0120,$00A0,$0000,$2000,$0004,$8000,$0050                         ;A1A0CC;
    dw EnemyHeaders_PirateGreenWalking                                   ;A1A0DA;
    dw $01F4,$00A0,$0000,$2000,$0004,$8000,$0050                         ;A1A0DC;
    dw EnemyHeaders_MiniKraid                                            ;A1A0EA;
    dw $0530,$00A0,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A1A0EC;
    db $04                                                               ;A1A0FC;

EnemyPopulations_SporeSpawn:
    dw EnemyHeaders_SporeSpawn                                           ;A1A0FD;
    dw $0080,$0270,$0000,$2800,$0004,$0000,$0000,$FFFF                   ;A1A0FF;
    db $00                                                               ;A1A10F;

EnemyPopulations_SkreeBoost:
    dw EnemyHeaders_Skree                                                ;A1A110;
    dw $0148,$003C,$0000,$2000,$0000,$0000,$0000                         ;A1A112;
    dw EnemyHeaders_Skree                                                ;A1A120;
    dw $0170,$003C,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1A122;
    db $02                                                               ;A1A132;

EnemyPopulations_GrappleTutorial3:
    dw EnemyHeaders_Gamet                                                ;A1A133;
    dw $00D0,$0168,$0000,$6800,$0000,$0000,$3030                         ;A1A135;
    dw EnemyHeaders_Gamet                                                ;A1A143;
    dw $00D0,$0168,$0000,$6800,$0000,$0000,$3000                         ;A1A145;
    dw EnemyHeaders_Gamet                                                ;A1A153;
    dw $00D0,$0168,$0000,$6800,$0000,$0000,$3000                         ;A1A155;
    dw EnemyHeaders_Gamet                                                ;A1A163;
    dw $00D0,$0168,$0000,$6800,$0000,$0000,$3000                         ;A1A165;
    dw EnemyHeaders_Gamet                                                ;A1A173;
    dw $00D0,$0168,$0000,$6800,$0000,$0000,$3000                         ;A1A175;
    dw EnemyHeaders_Puyo                                                 ;A1A183;
    dw $01CD,$014C,$0000,$2000,$0000,$0000,$0000                         ;A1A185;
    dw EnemyHeaders_Puyo                                                 ;A1A193;
    dw $01BA,$0114,$0000,$2000,$0000,$0000,$0000                         ;A1A195;
    dw EnemyHeaders_Puyo                                                 ;A1A1A3;
    dw $0208,$01A2,$0000,$2000,$0000,$0000,$0000                         ;A1A1A5;
    dw EnemyHeaders_Puyo                                                 ;A1A1B3;
    dw $023C,$01A7,$0000,$2000,$0000,$0000,$0000                         ;A1A1B5;
    dw EnemyHeaders_Puyo                                                 ;A1A1C3;
    dw $0270,$01A1,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1A1C5;
    db $06                                                               ;A1A1D5;

EnemyPopulations_PostCrocShaft:
    dw EnemyHeaders_Viola                                                ;A1A1D6;
    dw $0077,$0348,$0003,$2001,$0000,$0002,$0006                         ;A1A1D8;
    dw EnemyHeaders_Viola                                                ;A1A1E6;
    dw $0060,$03A8,$0003,$2000,$0000,$0002,$0006                         ;A1A1E8;
    dw EnemyHeaders_Viola                                                ;A1A1F6;
    dw $0093,$03F8,$0003,$2001,$0000,$0002,$0006                         ;A1A1F8;
    dw EnemyHeaders_Viola                                                ;A1A206;
    dw $007D,$0478,$0003,$2000,$0000,$0002,$0006,$FFFF                   ;A1A208;
    db $04                                                               ;A1A218;

EnemyPopulations_MetalPirates:
    dw EnemyHeaders_PirateGoldNinja                                      ;A1A219;
    dw $00E8,$00B0,$0000,$2800,$0004,$0001,$00C0                         ;A1A21B;
    dw EnemyHeaders_PirateGoldNinja                                      ;A1A229;
    dw $0218,$00B0,$0000,$2800,$0004,$0000,$00C0,$FFFF                   ;A1A22B;
    db $02                                                               ;A1A23B;

EnemyPopulations_AcidStatue:
    dw EnemyHeaders_Chozo                                                ;A1A23C;
    dw $002C,$009A,$0000,$2000,$0000,$0000,$0002                         ;A1A23E;
    dw EnemyHeaders_Magdollite                                           ;A1A24C;
    dw $01D8,$02D8,$0000,$2800,$0000,$0000,$20F0                         ;A1A24E;
    dw EnemyHeaders_Magdollite                                           ;A1A25C;
    dw $01D8,$02D8,$0000,$2C00,$0000,$0001,$0000                         ;A1A25E;
    dw EnemyHeaders_Magdollite                                           ;A1A26C;
    dw $01D8,$02D8,$0000,$2C00,$0000,$0002,$0000                         ;A1A26E;
    dw EnemyHeaders_Holtz                                                ;A1A27C;
    dw $0200,$0268,$0000,$2000,$0000,$0000,$0000                         ;A1A27E;
    dw EnemyHeaders_Holtz                                                ;A1A28C;
    dw $0200,$0268,$0006,$2400,$0000,$8000,$0000                         ;A1A28E;
    dw EnemyHeaders_Holtz                                                ;A1A29C;
    dw $01B0,$0250,$0000,$2000,$0000,$0000,$0000                         ;A1A29E;
    dw EnemyHeaders_Holtz                                                ;A1A2AC;
    dw $01B0,$0250,$0006,$2400,$0000,$8000,$0000                         ;A1A2AE;
    dw EnemyHeaders_Holtz                                                ;A1A2BC;
    dw $0254,$024D,$0000,$2000,$0000,$0000,$0000                         ;A1A2BE;
    dw EnemyHeaders_Holtz                                                ;A1A2CC;
    dw $0254,$024D,$0006,$2400,$0000,$8000,$0000,$FFFF                   ;A1A2CE;
    db $04                                                               ;A1A2DE;

EnemyPopulations_PurpleFarming:
    dw EnemyHeaders_Gamet                                                ;A1A2DF;
    dw $0080,$00B8,$0000,$6800,$0000,$0000,$3030                         ;A1A2E1;
    dw EnemyHeaders_Gamet                                                ;A1A2EF;
    dw $0080,$00B8,$0000,$6800,$0000,$0000,$3000                         ;A1A2F1;
    dw EnemyHeaders_Gamet                                                ;A1A2FF;
    dw $0080,$00B8,$0000,$6800,$0000,$0000,$3000                         ;A1A301;
    dw EnemyHeaders_Gamet                                                ;A1A30F;
    dw $0080,$00B8,$0000,$6800,$0000,$0000,$3000                         ;A1A311;
    dw EnemyHeaders_Gamet                                                ;A1A31F;
    dw $0080,$00B8,$0000,$6800,$0000,$0000,$3000,$FFFF                   ;A1A321;
    db $01                                                               ;A1A331;

EnemyPopulations_IceBeamGate:
    dw EnemyHeaders_ShutterGrowing                                       ;A1A332;
    dw $0408,$0258,$0001,$A800,$0000,$00F0,$000D                         ;A1A334;
    dw EnemyHeaders_ShutterGrowing                                       ;A1A342;
    dw $0608,$0258,$0001,$A800,$0000,$0068,$0010                         ;A1A344;
    dw EnemyHeaders_Dessgeega                                            ;A1A352;
    dw $0104,$03AF,$0000,$2000,$0000,$0000,$0000                         ;A1A354;
    dw EnemyHeaders_Dessgeega                                            ;A1A362;
    dw $0195,$035F,$0000,$2000,$0000,$0001,$0000                         ;A1A364;
    dw EnemyHeaders_Dessgeega                                            ;A1A372;
    dw $0222,$03B2,$0000,$2000,$0000,$0000,$0000                         ;A1A374;
    dw EnemyHeaders_Mella                                                ;A1A382;
    dw $0139,$0374,$0000,$2000,$0000,$0000,$0000                         ;A1A384;
    dw EnemyHeaders_Mella                                                ;A1A392;
    dw $0196,$03A7,$0000,$2000,$0000,$0000,$0000                         ;A1A394;
    dw EnemyHeaders_Mella                                                ;A1A3A2;
    dw $01FC,$0371,$0000,$2000,$0000,$0000,$0000                         ;A1A3A4;
    dw EnemyHeaders_Mella                                                ;A1A3B2;
    dw $0254,$0379,$0000,$2000,$0000,$0000,$0000                         ;A1A3B4;
    dw EnemyHeaders_Mella                                                ;A1A3C2;
    dw $0281,$039E,$0000,$2000,$0000,$0000,$0000                         ;A1A3C4;
    dw EnemyHeaders_Mella                                                ;A1A3D2;
    dw $00B0,$0362,$0000,$2000,$0000,$0000,$0000                         ;A1A3D4;
    dw EnemyHeaders_Sova                                                 ;A1A3E2;
    dw $05C8,$0238,$0003,$2800,$0000,$0003,$0004,$FFFF                   ;A1A3E4;
    db $04                                                               ;A1A3F4;

EnemyPopulations_SpikyAcidSnakesTunnel:
    dw EnemyHeaders_YappingMaw                                           ;A1A3F5;
    dw $0188,$00D8,$0000,$2000,$0000,$0080,$0001                         ;A1A3F7;
    dw EnemyHeaders_YappingMaw                                           ;A1A405;
    dw $0219,$00D7,$0000,$2000,$0000,$0080,$0001                         ;A1A407;
    dw EnemyHeaders_YappingMaw                                           ;A1A415;
    dw $02F8,$00D8,$0000,$2000,$0000,$0080,$0001,$FFFF                   ;A1A417;
    db $00                                                               ;A1A427;

EnemyPopulations_RedKihunterShaft:
    dw EnemyHeaders_KihunterRed                                          ;A1A428;
    dw $00B9,$01D6,$0000,$2800,$0000,$0050,$0000                         ;A1A42A;
    dw EnemyHeaders_KihunterRedWings                                     ;A1A438;
    dw $00B9,$01D6,$0000,$2C00,$0000,$0020,$0000                         ;A1A43A;
    dw EnemyHeaders_KihunterRed                                          ;A1A448;
    dw $004D,$023A,$0000,$2800,$0000,$0050,$0000                         ;A1A44A;
    dw EnemyHeaders_KihunterRedWings                                     ;A1A458;
    dw $004D,$023A,$0000,$2C00,$0000,$0020,$0000                         ;A1A45A;
    dw EnemyHeaders_KihunterRed                                          ;A1A468;
    dw $0087,$02F2,$0000,$2800,$0000,$0050,$0000                         ;A1A46A;
    dw EnemyHeaders_KihunterRedWings                                     ;A1A478;
    dw $0087,$02F2,$0000,$2C00,$0000,$0020,$0000,$FFFF                   ;A1A47A;
    db $03                                                               ;A1A48A;

EnemyPopulations_FastRipper:
    dw EnemyHeaders_Ripper2                                              ;A1A48B;
    dw $01D8,$0078,$0000,$2800,$0000,$0040,$0000                         ;A1A48D;
    dw EnemyHeaders_Ripper2                                              ;A1A49B;
    dw $01D8,$0058,$0000,$2800,$0000,$0040,$0000                         ;A1A49D;
    dw EnemyHeaders_Ripper2                                              ;A1A4AB;
    dw $0268,$0068,$0000,$2800,$0000,$0040,$0000                         ;A1A4AD;
    dw EnemyHeaders_Ripper2                                              ;A1A4BB;
    dw $0268,$0088,$0000,$2800,$0000,$0040,$0000                         ;A1A4BD;
    dw EnemyHeaders_Ripper2                                              ;A1A4CB;
    dw $0268,$0048,$0000,$2800,$0000,$0040,$0000                         ;A1A4CD;
    dw EnemyHeaders_Ripper2                                              ;A1A4DB;
    dw $0158,$0098,$0000,$2800,$0000,$0040,$0000,$FFFF                   ;A1A4DD;
    db $06                                                               ;A1A4ED;

EnemyPopulations_WaveBeam:
    dw $FFFF                                                             ;A1A4EE;
    db $00                                                               ;A1A4F0;

EnemyPopulations_FastPillarsSetup:
    dw EnemyHeaders_PirateGoldWall                                       ;A1A4F1;
    dw $00D1,$0138,$0000,$2000,$0004,$0001,$00A0                         ;A1A4F3;
    dw EnemyHeaders_PirateGoldWall                                       ;A1A501;
    dw $002D,$00B8,$0000,$2000,$0004,$0000,$00A0                         ;A1A503;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1A511;
    dw $00B0,$0180,$0000,$2000,$0004,$8000,$00A0                         ;A1A513;
    dw EnemyHeaders_Viola                                                ;A1A521;
    dw $0078,$0237,$0002,$2000,$0000,$0001,$0006                         ;A1A523;
    dw EnemyHeaders_Viola                                                ;A1A531;
    dw $0088,$0237,$0002,$2001,$0000,$0001,$0006,$FFFF                   ;A1A533;
    db $05                                                               ;A1A543;

EnemyPopulations_LowerNorfairElev:
    dw EnemyHeaders_Elevator                                             ;A1A544;
    dw $0080,$00A0,$0000,$2C00,$0000,$0000,$0140,$FFFF                   ;A1A546;
    db $00                                                               ;A1A556;

EnemyPopulations_LNSave:
    dw $FFFF                                                             ;A1A557;
    db $00                                                               ;A1A559;

EnemyPopulations_UpperNorfairRefill:
    dw $FFFF                                                             ;A1A55A;
    db $00                                                               ;A1A55C;

EnemyPopulations_NorfairMap:
    dw $FFFF                                                             ;A1A55D;
    db $00                                                               ;A1A55F;

EnemyPopulations_MickeyMouse:
    dw EnemyHeaders_DessgeegaLarge                                       ;A1A560;
    dw $03C0,$038B,$0000,$2000,$0000,$0000,$0000                         ;A1A562;
    dw EnemyHeaders_DessgeegaLarge                                       ;A1A570;
    dw $0357,$038A,$0000,$2000,$0000,$0000,$0000                         ;A1A572;
    dw EnemyHeaders_DessgeegaLarge                                       ;A1A580;
    dw $01B1,$038B,$0000,$2000,$0000,$0000,$0000                         ;A1A582;
    dw EnemyHeaders_DessgeegaLarge                                       ;A1A590;
    dw $0105,$0380,$0000,$2000,$0000,$8000,$0000                         ;A1A592;
    dw EnemyHeaders_DessgeegaLarge                                       ;A1A5A0;
    dw $026A,$0381,$0000,$2000,$0000,$8000,$0000                         ;A1A5A2;
    dw EnemyHeaders_Multiviola                                           ;A1A5B0;
    dw $0095,$0377,$0000,$2000,$0000,$000E,$0006                         ;A1A5B2;
    dw EnemyHeaders_Multiviola                                           ;A1A5C0;
    dw $0161,$0390,$0000,$2000,$0000,$00A8,$0006                         ;A1A5C2;
    dw EnemyHeaders_Multiviola                                           ;A1A5D0;
    dw $0396,$0316,$0000,$2000,$0000,$0000,$0007                         ;A1A5D2;
    dw EnemyHeaders_Multiviola                                           ;A1A5E0;
    dw $0349,$02FB,$0000,$2000,$0000,$0050,$0007                         ;A1A5E2;
    dw EnemyHeaders_Multiviola                                           ;A1A5F0;
    dw $0373,$02A9,$0000,$2000,$0000,$00C8,$0006                         ;A1A5F2;
    dw EnemyHeaders_Multiviola                                           ;A1A600;
    dw $0358,$0238,$0000,$2000,$0000,$00F0,$0006                         ;A1A602;
    dw EnemyHeaders_Multiviola                                           ;A1A610;
    dw $03CB,$0214,$0000,$2000,$0000,$0048,$0005,$FFFF                   ;A1A612;
    db $05                                                               ;A1A622;

EnemyPopulations_GTEnergyRefill:
    dw $FFFF                                                             ;A1A623;
    db $00                                                               ;A1A625;

EnemyPopulations_Ridley:
    dw EnemyHeaders_Ridley                                               ;A1A626;
    dw $0030,$FFF0,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A1A628;
    db $00                                                               ;A1A638;

EnemyPopulations_PostCrocPowerBombs:
    dw $FFFF                                                             ;A1A639;
    db $00                                                               ;A1A63B;

EnemyPopulations_IceBeam:
    dw $FFFF                                                             ;A1A63C;
    db $00                                                               ;A1A63E;

EnemyPopulations_HiJumpBoots:
    dw $FFFF                                                             ;A1A63F;
    db $00                                                               ;A1A641;

EnemyPopulations_PostCrocSave:
    dw $FFFF                                                             ;A1A642;
    db $00                                                               ;A1A644;

EnemyPopulations_FrogSpeedway:
    dw EnemyHeaders_Beetom                                               ;A1A645;
    dw $02B8,$0098,$0000,$2000,$0000,$0000,$0000                         ;A1A647;
    dw EnemyHeaders_Beetom                                               ;A1A655;
    dw $02E8,$0098,$0000,$2000,$0000,$0000,$0000                         ;A1A657;
    dw EnemyHeaders_Beetom                                               ;A1A665;
    dw $0310,$0098,$0000,$2000,$0000,$0000,$0000                         ;A1A667;
    dw EnemyHeaders_Beetom                                               ;A1A675;
    dw $0390,$0098,$0000,$2000,$0000,$0000,$0000                         ;A1A677;
    dw EnemyHeaders_Beetom                                               ;A1A685;
    dw $0400,$0098,$0000,$2000,$0000,$0000,$0000                         ;A1A687;
    dw EnemyHeaders_Beetom                                               ;A1A695;
    dw $0460,$0098,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1A697;
    db $06                                                               ;A1A6A7;

EnemyPopulations_RisingTide:
    dw EnemyHeaders_Squeept                                              ;A1A6A8;
    dw $00E8,$00F0,$0000,$2000,$0000,$0000,$0000                         ;A1A6AA;
    dw EnemyHeaders_Squeept                                              ;A1A6B8;
    dw $00E8,$00F0,$0002,$2400,$0000,$8000,$0000                         ;A1A6BA;
    dw EnemyHeaders_Sova                                                 ;A1A6C8;
    dw $01E8,$0098,$0003,$2000,$0000,$0001,$0004                         ;A1A6CA;
    dw EnemyHeaders_Sova                                                 ;A1A6D8;
    dw $03E8,$00A8,$0003,$2000,$0000,$0002,$0004                         ;A1A6DA;
    dw EnemyHeaders_Sova                                                 ;A1A6E8;
    dw $0178,$00A0,$0003,$2001,$0000,$0002,$0004                         ;A1A6EA;
    dw EnemyHeaders_Sova                                                 ;A1A6F8;
    dw $02C8,$00AB,$0001,$2002,$0000,$0001,$0004                         ;A1A6FA;
    dw EnemyHeaders_Sova                                                 ;A1A708;
    dw $0288,$00A8,$0000,$2003,$0000,$0001,$0004                         ;A1A70A;
    dw EnemyHeaders_Dragon                                               ;A1A718;
    dw $0238,$00F0,$0000,$2000,$0000,$0000,$0000                         ;A1A71A;
    dw EnemyHeaders_Dragon                                               ;A1A728;
    dw $0238,$00F0,$0002,$2400,$0000,$0001,$0000                         ;A1A72A;
    dw EnemyHeaders_Dragon                                               ;A1A738;
    dw $0338,$00F0,$0000,$2000,$0000,$0000,$0000                         ;A1A73A;
    dw EnemyHeaders_Dragon                                               ;A1A748;
    dw $0338,$00F0,$0002,$2400,$0000,$0001,$0000                         ;A1A74A;
    dw EnemyHeaders_Dragon                                               ;A1A758;
    dw $0468,$00F0,$0000,$2000,$0000,$0000,$0000                         ;A1A75A;
    dw EnemyHeaders_Dragon                                               ;A1A768;
    dw $0468,$00F0,$0002,$2400,$0000,$0001,$0000                         ;A1A76A;
    dw EnemyHeaders_Dragon                                               ;A1A778;
    dw $03B8,$00F0,$0000,$2000,$0000,$0000,$0000                         ;A1A77A;
    dw EnemyHeaders_Dragon                                               ;A1A788;
    dw $03B8,$00F0,$0002,$2400,$0000,$0001,$0000                         ;A1A78A;
    dw EnemyHeaders_Squeept                                              ;A1A798;
    dw $0168,$00F0,$0000,$2000,$0000,$0000,$0000                         ;A1A79A;
    dw EnemyHeaders_Squeept                                              ;A1A7A8;
    dw $0168,$00F0,$0002,$2400,$0000,$8000,$0000,$FFFF                   ;A1A7AA;
    db $0B                                                               ;A1A7BA;

EnemyPopulations_PostCrocFarming:
    dw EnemyHeaders_Gamet                                                ;A1A7BB;
    dw $0130,$01C8,$0000,$6800,$0000,$0000,$3030                         ;A1A7BD;
    dw EnemyHeaders_Gamet                                                ;A1A7CB;
    dw $0130,$01C8,$0000,$6800,$0000,$0000,$3000                         ;A1A7CD;
    dw EnemyHeaders_Gamet                                                ;A1A7DB;
    dw $0130,$01C8,$0000,$6800,$0000,$0000,$3000                         ;A1A7DD;
    dw EnemyHeaders_Gamet                                                ;A1A7EB;
    dw $0130,$01C8,$0000,$6800,$0000,$0000,$3000                         ;A1A7ED;
    dw EnemyHeaders_Gamet                                                ;A1A7FB;
    dw $0130,$01C8,$0000,$6800,$0000,$0000,$3000                         ;A1A7FD;
    dw EnemyHeaders_GRipper                                              ;A1A80B;
    dw $0100,$0050,$0010,$2800,$0000,$00E8,$0130                         ;A1A80D;
    dw EnemyHeaders_Kamer2                                               ;A1A81B;
    dw $0158,$0148,$0000,$A800,$0000,$0000,$2800,$FFFF                   ;A1A81D;
    db $02                                                               ;A1A82D;

EnemyPopulations_WorstRoomInTheGame:
    dw EnemyHeaders_Namihe                                               ;A1A82E;
    dw $00DA,$0577,$0000,$A000,$0000,$1001,$4007                         ;A1A830;
    dw EnemyHeaders_PirateGoldWall                                       ;A1A83E;
    dw $00D0,$04F8,$0000,$2000,$0004,$0001,$00A0                         ;A1A840;
    dw EnemyHeaders_PirateGoldWall                                       ;A1A84E;
    dw $0030,$0490,$0000,$2000,$0004,$0000,$00A0                         ;A1A850;
    dw EnemyHeaders_PirateGoldWall                                       ;A1A85E;
    dw $00D0,$0440,$0000,$2000,$0004,$0001,$00A0                         ;A1A860;
    dw EnemyHeaders_Namihe                                               ;A1A86E;
    dw $0027,$0320,$0000,$A000,$0000,$1011,$4007                         ;A1A870;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1A87E;
    dw $0030,$02B0,$0000,$2000,$0004,$0000,$0001                         ;A1A880;
    dw EnemyHeaders_Namihe                                               ;A1A88E;
    dw $00DA,$0388,$0000,$A000,$0000,$1001,$4007                         ;A1A890;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1A89E;
    dw $00D0,$02E0,$0000,$2000,$0004,$0000,$0000                         ;A1A8A0;
    dw EnemyHeaders_Namihe                                               ;A1A8AE;
    dw $00DA,$0240,$0000,$A000,$0000,$1001,$4007                         ;A1A8B0;
    dw EnemyHeaders_Namihe                                               ;A1A8BE;
    dw $0027,$01E0,$0000,$A000,$0000,$1011,$4007                         ;A1A8C0;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1A8CE;
    dw $0080,$0170,$0000,$2000,$0004,$0000,$0010,$FFFF                   ;A1A8D0;
    db $0B                                                               ;A1A8E0;

EnemyPopulations_DoubleChamber:
    dw EnemyHeaders_Fune                                                 ;A1A8E1;
    dw $0030,$00D0,$0000,$A000,$0000,$5010,$F007                         ;A1A8E3;
    dw EnemyHeaders_Fune                                                 ;A1A8F1;
    dw $01C0,$00D8,$0000,$A000,$0000,$5000,$F007                         ;A1A8F3;
    dw EnemyHeaders_Kamer                                                ;A1A901;
    dw $0088,$00A8,$0108,$A800,$0404,$4001,$0020                         ;A1A903;
    dw EnemyHeaders_Kamer                                                ;A1A911;
    dw $00D0,$00E8,$0008,$A800,$0808,$3001,$0030                         ;A1A913;
    dw EnemyHeaders_Kamer                                                ;A1A921;
    dw $0110,$00A8,$0108,$A800,$0202,$6001,$0030                         ;A1A923;
    dw EnemyHeaders_Kamer                                                ;A1A931;
    dw $0178,$00A8,$0108,$A800,$0303,$5001,$0030                         ;A1A933;
    dw EnemyHeaders_Kago                                                 ;A1A941;
    dw $02F0,$01D0,$0000,$A000,$0000,$000A,$0000                         ;A1A943;
    dw EnemyHeaders_GRipper                                              ;A1A951;
    dw $02E8,$00F0,$0010,$2000,$0000,$0298,$0338,$FFFF                   ;A1A953;
    db $04                                                               ;A1A963;

EnemyPopulations_GrappleBeam:
    dw $FFFF                                                             ;A1A964;
    db $00                                                               ;A1A966;

EnemyPopulations_RedPirateShaft:
    dw EnemyHeaders_PirateRedWalking                                     ;A1A967;
    dw $0050,$0200,$0000,$2000,$0004,$8001,$0008                         ;A1A969;
    dw EnemyHeaders_PirateRedWalking                                     ;A1A977;
    dw $00B0,$0180,$0000,$2000,$0004,$8000,$0008                         ;A1A979;
    dw EnemyHeaders_PirateRedWalking                                     ;A1A987;
    dw $0050,$0100,$0000,$2000,$0004,$8001,$0008                         ;A1A989;
    dw EnemyHeaders_MZoomer                                              ;A1A997;
    dw $0080,$0268,$0003,$2000,$0000,$0002,$0000                         ;A1A999;
    dw EnemyHeaders_MZoomer                                              ;A1A9A7;
    dw $0080,$01D8,$0003,$2001,$0000,$0002,$0000                         ;A1A9A9;
    dw EnemyHeaders_MZoomer                                              ;A1A9B7;
    dw $0080,$0158,$0003,$2000,$0000,$0002,$0000                         ;A1A9B9;
    dw EnemyHeaders_MZoomer                                              ;A1A9C7;
    dw $0080,$00D8,$0003,$2001,$0000,$0002,$0000,$FFFF                   ;A1A9C9;
    db $07                                                               ;A1A9D9;

EnemyPopulations_CrocomireSpeedway:
    dw EnemyHeaders_PirateRedWalking                                     ;A1A9DA;
    dw $08B8,$0270,$0000,$2000,$0004,$8000,$0000                         ;A1A9DC;
    dw EnemyHeaders_Multiviola                                           ;A1A9EA;
    dw $0413,$00CC,$0000,$2000,$0000,$00F0,$0003                         ;A1A9EC;
    dw EnemyHeaders_PirateRedWalking                                     ;A1A9FA;
    dw $02F4,$00B0,$0000,$2000,$0004,$8000,$0030                         ;A1A9FC;
    dw EnemyHeaders_Multiviola                                           ;A1AA0A;
    dw $048D,$0116,$0000,$2000,$0000,$0030,$0003                         ;A1AA0C;
    dw EnemyHeaders_PirateRedWalking                                     ;A1AA1A;
    dw $039A,$00E0,$0000,$2000,$0004,$8000,$0020                         ;A1AA1C;
    dw EnemyHeaders_Multiviola                                           ;A1AA2A;
    dw $050C,$0158,$0000,$2000,$0000,$0068,$0003                         ;A1AA2C;
    dw EnemyHeaders_Multiviola                                           ;A1AA3A;
    dw $05AF,$01C8,$0000,$2000,$0000,$00D0,$0003                         ;A1AA3C;
    dw EnemyHeaders_PirateRedWalking                                     ;A1AA4A;
    dw $09FB,$0270,$0000,$2000,$0004,$8000,$0000                         ;A1AA4C;
    dw EnemyHeaders_PirateRedWalking                                     ;A1AA5A;
    dw $06E7,$0290,$0000,$2000,$0004,$8000,$0010                         ;A1AA5C;
    dw EnemyHeaders_Cacatac                                              ;A1AA6A;
    dw $0C58,$01E3,$0000,$2000,$0000,$0100,$0000                         ;A1AA6C;
    dw EnemyHeaders_Cacatac                                              ;A1AA7A;
    dw $0CA8,$01E3,$0000,$2000,$0000,$0100,$0000,$FFFF                   ;A1AA7C;
    db $07                                                               ;A1AA8C;

EnemyPopulations_Plowerhouse:
    dw EnemyHeaders_Holtz                                                ;A1AA8D;
    dw $0258,$0058,$0000,$2000,$0000,$0000,$0000                         ;A1AA8F;
    dw EnemyHeaders_Holtz                                                ;A1AA9D;
    dw $0258,$0058,$0006,$2400,$0000,$8000,$0000                         ;A1AA9F;
    dw EnemyHeaders_Holtz                                                ;A1AAAD;
    dw $0288,$0058,$0000,$2000,$0000,$0000,$0000                         ;A1AAAF;
    dw EnemyHeaders_Holtz                                                ;A1AABD;
    dw $0288,$0058,$0006,$2400,$0000,$8000,$0000                         ;A1AABF;
    dw EnemyHeaders_Holtz                                                ;A1AACD;
    dw $0118,$0058,$0000,$2000,$0000,$0000,$0000                         ;A1AACF;
    dw EnemyHeaders_Holtz                                                ;A1AADD;
    dw $0118,$0058,$0006,$2400,$0000,$8000,$0000                         ;A1AADF;
    dw EnemyHeaders_Holtz                                                ;A1AAED;
    dw $01C8,$0058,$0000,$2000,$0000,$0000,$0000                         ;A1AAEF;
    dw EnemyHeaders_Holtz                                                ;A1AAFD;
    dw $01C8,$0058,$0006,$2400,$0000,$8000,$0000                         ;A1AAFF;
    dw EnemyHeaders_Holtz                                                ;A1AB0D;
    dw $0068,$0058,$0000,$2000,$0000,$0000,$0000                         ;A1AB0F;
    dw EnemyHeaders_Holtz                                                ;A1AB1D;
    dw $0068,$0058,$0006,$2400,$0000,$8000,$0000                         ;A1AB1F;
    dw EnemyHeaders_Holtz                                                ;A1AB2D;
    dw $0098,$0058,$0000,$2000,$0000,$0000,$0000                         ;A1AB2F;
    dw EnemyHeaders_Holtz                                                ;A1AB3D;
    dw $0098,$0058,$0006,$2400,$0000,$8000,$0000                         ;A1AB3F;
    dw EnemyHeaders_Zebbo                                                ;A1AB4D;
    dw $00C0,$00B8,$0000,$6900,$0000,$0002,$0000                         ;A1AB4F;
    dw EnemyHeaders_Zebbo                                                ;A1AB5D;
    dw $0180,$00B8,$0000,$6900,$0000,$0002,$0000                         ;A1AB5F;
    dw EnemyHeaders_Zebbo                                                ;A1AB6D;
    dw $0240,$00B8,$0000,$6900,$0000,$0002,$0000,$FFFF                   ;A1AB6F;
    db $09                                                               ;A1AB7F;

EnemyPopulations_LNFireflea:
    dw EnemyHeaders_Fune                                                 ;A1AB80;
    dw $01F0,$02D0,$0000,$A000,$0000,$0100,$0F07                         ;A1AB82;
    dw EnemyHeaders_Fune                                                 ;A1AB90;
    dw $0110,$01E8,$0000,$A000,$0000,$0110,$0F07                         ;A1AB92;
    dw EnemyHeaders_Fune                                                 ;A1ABA0;
    dw $01F0,$01B0,$0000,$A000,$0000,$0100,$0F07                         ;A1ABA2;
    dw EnemyHeaders_Fune                                                 ;A1ABB0;
    dw $01D0,$00D8,$0000,$A000,$0000,$0100,$0F07                         ;A1ABB2;
    dw EnemyHeaders_Fune                                                 ;A1ABC0;
    dw $01F0,$0380,$0000,$A000,$0000,$0100,$0F07                         ;A1ABC2;
    dw EnemyHeaders_Boulder                                              ;A1ABD0;
    dw $0150,$0130,$0050,$2000,$0000,$0000,$0080                         ;A1ABD2;
    dw EnemyHeaders_Boulder                                              ;A1ABE0;
    dw $01B8,$01D0,$0050,$2800,$0000,$0100,$0080                         ;A1ABE2;
    dw EnemyHeaders_Boulder                                              ;A1ABF0;
    dw $0128,$0260,$0050,$2800,$0000,$0000,$0080                         ;A1ABF2;
    dw EnemyHeaders_Fireflea                                             ;A1AC00;
    dw $0156,$0558,$0000,$2000,$0000,$0002,$0520                         ;A1AC02;
    dw EnemyHeaders_Fireflea                                             ;A1AC10;
    dw $01C8,$0538,$0000,$2000,$0000,$0003,$0518                         ;A1AC12;
    dw EnemyHeaders_Fireflea                                             ;A1AC20;
    dw $0238,$0558,$0000,$2000,$0000,$0002,$0520                         ;A1AC22;
    dw EnemyHeaders_Fireflea                                             ;A1AC30;
    dw $02A8,$0538,$0000,$2000,$0000,$0003,$0518                         ;A1AC32;
    dw EnemyHeaders_Fireflea                                             ;A1AC40;
    dw $0170,$0476,$0000,$2000,$0000,$0002,$0720,$FFFF                   ;A1AC42;
    db $0A                                                               ;A1AC52;

EnemyPopulations_MagdolliteTunnel:
    dw EnemyHeaders_Magdollite                                           ;A1AC53;
    dw $00F8,$00B8,$0000,$2800,$0000,$0000,$3A60                         ;A1AC55;
    dw EnemyHeaders_Magdollite                                           ;A1AC63;
    dw $00F8,$00B8,$0000,$2C00,$0000,$0001,$0000                         ;A1AC65;
    dw EnemyHeaders_Magdollite                                           ;A1AC73;
    dw $00F8,$00B8,$0000,$2C00,$0000,$0002,$0000                         ;A1AC75;
    dw EnemyHeaders_Magdollite                                           ;A1AC83;
    dw $01E8,$00B8,$0000,$2800,$0000,$0000,$3A60                         ;A1AC85;
    dw EnemyHeaders_Magdollite                                           ;A1AC93;
    dw $01E8,$00B8,$0000,$2C00,$0000,$0001,$0000                         ;A1AC95;
    dw EnemyHeaders_Magdollite                                           ;A1ACA3;
    dw $01E8,$00B8,$0000,$2C00,$0000,$0002,$0000                         ;A1ACA5;
    dw EnemyHeaders_Magdollite                                           ;A1ACB3;
    dw $0248,$00B8,$0000,$2800,$0000,$0000,$3A60                         ;A1ACB5;
    dw EnemyHeaders_Magdollite                                           ;A1ACC3;
    dw $0248,$00B8,$0000,$2C00,$0000,$0001,$0000                         ;A1ACC5;
    dw EnemyHeaders_Magdollite                                           ;A1ACD3;
    dw $0248,$00B8,$0000,$2C00,$0000,$0002,$0000                         ;A1ACD5;
    dw EnemyHeaders_Multiviola                                           ;A1ACE3;
    dw $0078,$0058,$0000,$2000,$0000,$0060,$0002                         ;A1ACE5;
    dw EnemyHeaders_Multiviola                                           ;A1ACF3;
    dw $023C,$005D,$0000,$2000,$0000,$0030,$0002,$FFFF                   ;A1ACF5;
    db $03                                                               ;A1AD05;

UNUSED_EnemyPopulations_8FB3EE_A1AD06:
    dw $FFFF                                                             ;A1AD06;
    db $00                                                               ;A1AD08;

EnemyPopulations_LavaDive:
    dw EnemyHeaders_Namihe                                               ;A1AD09;
    dw $01F0,$0108,$0000,$A000,$0000,$1001,$8005                         ;A1AD0B;
    dw EnemyHeaders_Namihe                                               ;A1AD19;
    dw $0120,$01D0,$0000,$A000,$0000,$1011,$8005                         ;A1AD1B;
    dw EnemyHeaders_Namihe                                               ;A1AD29;
    dw $0120,$0248,$0000,$A000,$0000,$1011,$8005                         ;A1AD2B;
    dw EnemyHeaders_Namihe                                               ;A1AD39;
    dw $027F,$0238,$0000,$A000,$0000,$1001,$8005                         ;A1AD3B;
    dw EnemyHeaders_Namihe                                               ;A1AD49;
    dw $0390,$0118,$0000,$A000,$0000,$1001,$8005                         ;A1AD4B;
    dw EnemyHeaders_Namihe                                               ;A1AD59;
    dw $0340,$0198,$0000,$A000,$0000,$1001,$8005,$FFFF                   ;A1AD5B;
    db $06                                                               ;A1AD6B;

EnemyPopulations_Pillar:
    dw EnemyHeaders_Puromi                                               ;A1AD6C;
    dw $0190,$00D0,$0000,$2000,$0000,$4010,$2001                         ;A1AD6E;
    dw EnemyHeaders_Puromi                                               ;A1AD7C;
    dw $02D0,$00D0,$0000,$2000,$0000,$4010,$2001,$FFFF                   ;A1AD7E;
    db $00                                                               ;A1AD8E;

EnemyPopulations_CrocomireEscape:
    dw EnemyHeaders_Dragon                                               ;A1AD8F;
    dw $0380,$01E8,$0000,$2000,$0000,$0000,$0000                         ;A1AD91;
    dw EnemyHeaders_Dragon                                               ;A1AD9F;
    dw $0380,$01E8,$0002,$2400,$0000,$0001,$0000                         ;A1ADA1;
    dw EnemyHeaders_Geruta                                               ;A1ADAF;
    dw $0396,$007F,$0000,$2000,$0000,$0000,$0000                         ;A1ADB1;
    dw EnemyHeaders_Geruta                                               ;A1ADBF;
    dw $0396,$007F,$0005,$2400,$0000,$8000,$0000                         ;A1ADC1;
    dw EnemyHeaders_Dragon                                               ;A1ADCF;
    dw $02C0,$01E8,$0000,$2000,$0000,$0000,$0000                         ;A1ADD1;
    dw EnemyHeaders_Dragon                                               ;A1ADDF;
    dw $02C0,$01E8,$0002,$2400,$0000,$0001,$0000                         ;A1ADE1;
    dw EnemyHeaders_Dragon                                               ;A1ADEF;
    dw $0200,$01E8,$0000,$2000,$0000,$0000,$0000                         ;A1ADF1;
    dw EnemyHeaders_Dragon                                               ;A1ADFF;
    dw $0200,$01E8,$0002,$2400,$0000,$0001,$0000                         ;A1AE01;
    dw EnemyHeaders_Dragon                                               ;A1AE0F;
    dw $0140,$01E8,$0000,$2000,$0000,$0000,$0000                         ;A1AE11;
    dw EnemyHeaders_Dragon                                               ;A1AE1F;
    dw $0140,$01E8,$0002,$2400,$0000,$0001,$0000                         ;A1AE21;
    dw EnemyHeaders_Dragon                                               ;A1AE2F;
    dw $0080,$01E8,$0000,$2000,$0000,$0000,$0000                         ;A1AE31;
    dw EnemyHeaders_Dragon                                               ;A1AE3F;
    dw $0080,$01E8,$0002,$2400,$0000,$0001,$0000,$FFFF                   ;A1AE41;
    db $06                                                               ;A1AE51;

EnemyPopulations_LNSpringBallMaze:
    dw EnemyHeaders_Alcoon                                               ;A1AE52;
    dw $0100,$0200,$0000,$2800,$0000,$0000,$0000                         ;A1AE54;
    dw EnemyHeaders_Alcoon                                               ;A1AE62;
    dw $0151,$0200,$0000,$2800,$0000,$0000,$0000                         ;A1AE64;
    dw EnemyHeaders_Alcoon                                               ;A1AE72;
    dw $0060,$0200,$0000,$2800,$0000,$0000,$0000                         ;A1AE74;
    dw EnemyHeaders_Alcoon                                               ;A1AE82;
    dw $0198,$00D8,$0000,$2800,$0000,$0000,$0000                         ;A1AE84;
    dw EnemyHeaders_Alcoon                                               ;A1AE92;
    dw $03FB,$04C9,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A1AE94;
    db $05                                                               ;A1AEA4;

EnemyPopulations_LNEscapePowerBombs:
    dw $FFFF                                                             ;A1AEA5;
    db $00                                                               ;A1AEA7;

EnemyPopulations_PurpleShaft:
    dw $FFFF                                                             ;A1AEA8;
    db $00                                                               ;A1AEAA;

EnemyPopulations_RidleyETank:
    dw $FFFF                                                             ;A1AEAB;
    db $00                                                               ;A1AEAD;

EnemyPopulations_ScrewAttack:
    dw $FFFF                                                             ;A1AEAE;
    db $00                                                               ;A1AEB0;

EnemyPopulations_GreenBubblesMissiles:
    dw EnemyHeaders_ShutterShootable                                     ;A1AEB1;
    dw $0128,$0100,$0008,$A800,$FFFF,$4003,$0000                         ;A1AEB3;
    dw EnemyHeaders_ShutterShootable                                     ;A1AEC1;
    dw $0128,$0100,$0008,$A800,$FFFF,$8003,$0000                         ;A1AEC3;
    dw EnemyHeaders_Geruta                                               ;A1AED1;
    dw $0184,$0060,$0000,$2000,$0000,$0000,$0000                         ;A1AED3;
    dw EnemyHeaders_Geruta                                               ;A1AEE1;
    dw $0184,$0060,$0005,$2400,$0000,$8000,$0000,$FFFF                   ;A1AEE3;
    db $01                                                               ;A1AEF3;

EnemyPopulations_Amphitheatre:
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AEF4;
    dw $01C0,$00D0,$0000,$2000,$0004,$8000,$0010                         ;A1AEF6;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AF04;
    dw $02C0,$00B0,$0000,$2000,$0004,$8000,$0008                         ;A1AF06;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AF14;
    dw $02B8,$0230,$0000,$2000,$0004,$8000,$0008                         ;A1AF16;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AF24;
    dw $0158,$0120,$0000,$2000,$0004,$8001,$0008                         ;A1AF26;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AF34;
    dw $01D0,$0440,$0000,$2000,$0004,$8000,$0010                         ;A1AF36;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AF44;
    dw $00C5,$0450,$0000,$2000,$0004,$8000,$00A0                         ;A1AF46;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AF54;
    dw $037D,$039D,$0000,$2000,$0004,$8000,$0010                         ;A1AF56;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AF64;
    dw $03C0,$0310,$0000,$2000,$0004,$8000,$0010                         ;A1AF66;
    dw EnemyHeaders_PirateGoldWalking                                    ;A1AF74;
    dw $0238,$01A0,$0000,$2000,$0004,$8000,$0008,$FFFF                   ;A1AF76;
    db $09                                                               ;A1AF86;

EnemyPopulations_CathedralEntrance:
    dw EnemyHeaders_Sova                                                 ;A1AF87;
    dw $0028,$0100,$0000,$2000,$0000,$0003,$0004                         ;A1AF89;
    dw EnemyHeaders_Sova                                                 ;A1AF97;
    dw $0018,$0138,$0000,$2800,$0000,$0003,$0004                         ;A1AF99;
    dw EnemyHeaders_Sova                                                 ;A1AFA7;
    dw $00F8,$0098,$0003,$2001,$0000,$0003,$0004                         ;A1AFA9;
    dw EnemyHeaders_Sova                                                 ;A1AFB7;
    dw $00B0,$00D8,$0003,$2000,$0000,$0003,$0004                         ;A1AFB9;
    dw EnemyHeaders_Dessgeega                                            ;A1AFC7;
    dw $0188,$019F,$0000,$2000,$0000,$0000,$0000                         ;A1AFC9;
    dw EnemyHeaders_Dessgeega                                            ;A1AFD7;
    dw $022F,$019E,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1AFD9;
    db $06                                                               ;A1AFE9;

EnemyPopulations_MainHall:
    dw EnemyHeaders_Elevator                                             ;A1AFEA;
    dw $0480,$02A2,$0000,$2C00,$0000,$0001,$0018                         ;A1AFEC;
    dw EnemyHeaders_Dragon                                               ;A1AFFA;
    dw $02D0,$02F8,$0000,$2000,$0000,$0000,$0000                         ;A1AFFC;
    dw EnemyHeaders_Dragon                                               ;A1B00A;
    dw $02D0,$02F8,$0002,$2400,$0000,$0001,$0000                         ;A1B00C;
    dw EnemyHeaders_Dragon                                               ;A1B01A;
    dw $0330,$02F8,$0000,$2000,$0000,$0000,$0000                         ;A1B01C;
    dw EnemyHeaders_Dragon                                               ;A1B02A;
    dw $0330,$02F8,$0002,$2400,$0000,$0001,$0000                         ;A1B02C;
    dw EnemyHeaders_Hibashi                                              ;A1B03A;
    dw $0197,$02B8,$0000,$2500,$0000,$0050,$0000                         ;A1B03C;
    dw EnemyHeaders_Hibashi                                              ;A1B04A;
    dw $0197,$02B8,$0000,$2100,$0000,$0000,$0001                         ;A1B04C;
    dw EnemyHeaders_Hibashi                                              ;A1B05A;
    dw $0117,$02A8,$0000,$2500,$0000,$0060,$0000                         ;A1B05C;
    dw EnemyHeaders_Hibashi                                              ;A1B06A;
    dw $0117,$02A8,$0000,$2100,$0000,$0000,$0001                         ;A1B06C;
    dw EnemyHeaders_Hibashi                                              ;A1B07A;
    dw $0097,$0288,$0000,$2500,$0000,$0060,$0000                         ;A1B07C;
    dw EnemyHeaders_Hibashi                                              ;A1B08A;
    dw $0097,$0288,$0000,$2100,$0000,$0000,$0001                         ;A1B08C;
    dw EnemyHeaders_Hibashi                                              ;A1B09A;
    dw $0217,$02B8,$0000,$2500,$0000,$0050,$0000                         ;A1B09C;
    dw EnemyHeaders_Hibashi                                              ;A1B0AA;
    dw $0217,$02B8,$0000,$2100,$0000,$0000,$0001                         ;A1B0AC;
    dw EnemyHeaders_Dragon                                               ;A1B0BA;
    dw $0238,$02F8,$0000,$2000,$0000,$0000,$0000                         ;A1B0BC;
    dw EnemyHeaders_Dragon                                               ;A1B0CA;
    dw $0238,$02F8,$0002,$2400,$0000,$0001,$0000                         ;A1B0CC;
    dw EnemyHeaders_Dragon                                               ;A1B0DA;
    dw $0138,$02F8,$0000,$2000,$0000,$0000,$0000                         ;A1B0DC;
    dw EnemyHeaders_Dragon                                               ;A1B0EA;
    dw $0138,$02F8,$0002,$2400,$0000,$0001,$0000                         ;A1B0EC;
    dw EnemyHeaders_Dragon                                               ;A1B0FA;
    dw $01B8,$02F8,$0000,$2000,$0000,$0000,$0000                         ;A1B0FC;
    dw EnemyHeaders_Dragon                                               ;A1B10A;
    dw $01B8,$02F8,$0002,$2400,$0000,$0001,$0000,$FFFF                   ;A1B10C;
    db $05                                                               ;A1B11C;

EnemyPopulations_PostCrocJump:
    dw EnemyHeaders_Mella                                                ;A1B11D;
    dw $05C3,$0253,$0000,$2000,$0000,$0000,$0000                         ;A1B11F;
    dw EnemyHeaders_Mella                                                ;A1B12D;
    dw $0599,$0268,$0000,$2000,$0000,$0000,$0000                         ;A1B12F;
    dw EnemyHeaders_Mella                                                ;A1B13D;
    dw $05F1,$0272,$0000,$2000,$0000,$0000,$0000                         ;A1B13F;
    dw EnemyHeaders_Mella                                                ;A1B14D;
    dw $0552,$025C,$0000,$2000,$0000,$0000,$0000                         ;A1B14F;
    dw EnemyHeaders_Mella                                                ;A1B15D;
    dw $057B,$027D,$0000,$2000,$0000,$0000,$0000                         ;A1B15F;
    dw EnemyHeaders_GRipper                                              ;A1B16D;
    dw $00D1,$009B,$0010,$2000,$0000,$00B1,$0111                         ;A1B16F;
    dw EnemyHeaders_GRipper                                              ;A1B17D;
    dw $0198,$0068,$0120,$2800,$0000,$0168,$01C8                         ;A1B17F;
    dw EnemyHeaders_GRipper                                              ;A1B18D;
    dw $0228,$0098,$0020,$2800,$0000,$0210,$0268                         ;A1B18F;
    dw EnemyHeaders_GRipper                                              ;A1B19D;
    dw $0360,$0058,$0110,$2800,$0000,$0300,$03C0                         ;A1B19F;
    dw EnemyHeaders_Kamer2                                               ;A1B1AD;
    dw $00B0,$0298,$0000,$A000,$0000,$0000,$2800                         ;A1B1AF;
    dw EnemyHeaders_Kamer2                                               ;A1B1BD;
    dw $0110,$0298,$0000,$A000,$0000,$0000,$2800                         ;A1B1BF;
    dw EnemyHeaders_Kamer2                                               ;A1B1CD;
    dw $0170,$0298,$0000,$A000,$0000,$0000,$2800                         ;A1B1CF;
    dw EnemyHeaders_Kamer2                                               ;A1B1DD;
    dw $01D0,$0298,$0000,$A000,$0000,$0000,$2800,$FFFF                   ;A1B1DF;
    db $04                                                               ;A1B1EF;

EnemyPopulations_FrogSave:
    dw $FFFF                                                             ;A1B1F0;
    db $00                                                               ;A1B1F2;

EnemyPopulations_CrocomireSave:
    dw $FFFF                                                             ;A1B1F3;
    db $00                                                               ;A1B1F5;

EnemyPopulations_CrumbleShaft:
    dw EnemyHeaders_Sova                                                 ;A1B1F6;
    dw $0078,$0106,$0002,$2001,$0000,$0001,$0004                         ;A1B1F8;
    dw EnemyHeaders_Sova                                                 ;A1B206;
    dw $0038,$0138,$0003,$2000,$0000,$0001,$0004                         ;A1B208;
    dw EnemyHeaders_Sova                                                 ;A1B216;
    dw $00C0,$01D8,$0003,$2000,$0000,$0001,$0004                         ;A1B218;
    dw EnemyHeaders_Sova                                                 ;A1B226;
    dw $0080,$0256,$0002,$2000,$0000,$0001,$0004                         ;A1B228;
    dw EnemyHeaders_Sova                                                 ;A1B236;
    dw $0080,$02F6,$0002,$2000,$0000,$0001,$0004                         ;A1B238;
    dw EnemyHeaders_Sova                                                 ;A1B246;
    dw $00C0,$0346,$0002,$2001,$0000,$0001,$0004,$FFFF                   ;A1B248;
    db $06                                                               ;A1B258;

EnemyPopulations_Wasteland:
    dw EnemyHeaders_Hibashi                                              ;A1B259;
    dw $05C0,$00E0,$0000,$2500,$0000,$0008,$0000                         ;A1B25B;
    dw EnemyHeaders_Hibashi                                              ;A1B269;
    dw $05C0,$00E0,$0000,$2100,$0000,$0000,$0001                         ;A1B26B;
    dw EnemyHeaders_DessgeegaLarge                                       ;A1B279;
    dw $0288,$005A,$0000,$2000,$0000,$8000,$0000                         ;A1B27B;
    dw EnemyHeaders_DessgeegaLarge                                       ;A1B289;
    dw $0228,$00A8,$0000,$2000,$0000,$0000,$0000                         ;A1B28B;
    dw EnemyHeaders_DessgeegaLarge                                       ;A1B299;
    dw $02F0,$00A8,$0000,$2000,$0000,$0000,$0000                         ;A1B29B;
    dw EnemyHeaders_DessgeegaLarge                                       ;A1B2A9;
    dw $0138,$0058,$0000,$2000,$0000,$8000,$0000                         ;A1B2AB;
    dw EnemyHeaders_Hibashi                                              ;A1B2B9;
    dw $0540,$00E0,$0000,$2500,$0000,$0000,$0000                         ;A1B2BB;
    dw EnemyHeaders_Hibashi                                              ;A1B2C9;
    dw $0540,$00E0,$0000,$2100,$0000,$0000,$0001                         ;A1B2CB;
    dw EnemyHeaders_ShutterShootable                                     ;A1B2D9;
    dw $0528,$00E0,$0008,$A800,$00FF,$2003,$0000                         ;A1B2DB;
    dw EnemyHeaders_KzanTop                                              ;A1B2E9;
    dw $0180,$025C,$0000,$A000,$0000,$0040,$5070                         ;A1B2EB;
    dw EnemyHeaders_KzanBottom                                           ;A1B2F9;
    dw $0180,$0264,$0000,$0100,$0000,$0000,$0000                         ;A1B2FB;
    dw EnemyHeaders_KzanTop                                              ;A1B309;
    dw $0180,$015C,$0000,$A000,$0000,$0040,$8070                         ;A1B30B;
    dw EnemyHeaders_KzanBottom                                           ;A1B319;
    dw $0180,$0164,$0000,$0100,$0000,$0000,$0000,$FFFF                   ;A1B31B;
    db $04                                                               ;A1B32B;

EnemyPopulations_AcidSnakesTunnel:
    dw EnemyHeaders_Gamet                                                ;A1B32C;
    dw $0110,$00E8,$0000,$6800,$0000,$0000,$3030                         ;A1B32E;
    dw EnemyHeaders_Gamet                                                ;A1B33C;
    dw $0110,$00E8,$0000,$6800,$0000,$0000,$3000                         ;A1B33E;
    dw EnemyHeaders_Gamet                                                ;A1B34C;
    dw $0110,$00E8,$0000,$6800,$0000,$0000,$3000                         ;A1B34E;
    dw EnemyHeaders_Gamet                                                ;A1B35C;
    dw $0110,$00E8,$0000,$6800,$0000,$0000,$3000                         ;A1B35E;
    dw EnemyHeaders_Gamet                                                ;A1B36C;
    dw $0110,$00E8,$0000,$6800,$0000,$0000,$3000                         ;A1B36E;
    dw EnemyHeaders_Dragon                                               ;A1B37C;
    dw $0200,$00F0,$0000,$2000,$0000,$0000,$0000                         ;A1B37E;
    dw EnemyHeaders_Dragon                                               ;A1B38C;
    dw $0200,$00F0,$0002,$2400,$0000,$0001,$0000                         ;A1B38E;
    dw EnemyHeaders_Dragon                                               ;A1B39C;
    dw $02F0,$00F0,$0000,$2000,$0000,$0000,$0000                         ;A1B39E;
    dw EnemyHeaders_Dragon                                               ;A1B3AC;
    dw $02F0,$00F0,$0002,$2400,$0000,$0001,$0000,$FFFF                   ;A1B3AE;
    db $03                                                               ;A1B3BE;

EnemyPopulations_GrappleTutorial1:
    dw $FFFF                                                             ;A1B3BF;
    db $00                                                               ;A1B3C1;

EnemyPopulations_BubbleMountainSave:
    dw $FFFF                                                             ;A1B3C2;
    db $00                                                               ;A1B3C4;

EnemyPopulations_HiJumpETank:
    dw EnemyHeaders_Sova                                                 ;A1B3C5;
    dw $0177,$00B5,$0002,$2801,$0000,$0004,$0004,$FFFF                   ;A1B3C7;
    db $01                                                               ;A1B3D7;

EnemyPopulations_BubbleMountain:
    dw EnemyHeaders_Ripper2                                              ;A1B3D8;
    dw $0178,$0370,$0000,$2800,$0000,$0020,$0000                         ;A1B3DA;
    dw EnemyHeaders_Sova                                                 ;A1B3E8;
    dw $0118,$0380,$0001,$2002,$0000,$0002,$0004                         ;A1B3EA;
    dw EnemyHeaders_Sova                                                 ;A1B3F8;
    dw $0151,$02DA,$0003,$2000,$0000,$0002,$0004                         ;A1B3FA;
    dw EnemyHeaders_Sova                                                 ;A1B408;
    dw $0048,$0329,$0003,$2000,$0000,$0002,$0004                         ;A1B40A;
    dw EnemyHeaders_Waver                                                ;A1B418;
    dw $00B9,$01B8,$0000,$2800,$0000,$0000,$0000                         ;A1B41A;
    dw EnemyHeaders_Waver                                                ;A1B428;
    dw $01C0,$0220,$0000,$2000,$0000,$0001,$0000                         ;A1B42A;
    dw EnemyHeaders_Waver                                                ;A1B438;
    dw $0093,$00DE,$0000,$2800,$0000,$0000,$0000                         ;A1B43A;
    dw EnemyHeaders_Cacatac                                              ;A1B448;
    dw $010C,$0095,$0000,$2000,$0000,$0100,$0000,$FFFF                   ;A1B44A;
    db $08                                                               ;A1B45A;

EnemyPopulations_IceBeamAcid:
    dw EnemyHeaders_Tripper                                              ;A1B45B;
    dw $0190,$00A8,$0000,$A000,$0000,$0000,$1010                         ;A1B45D;
    dw EnemyHeaders_Tripper                                              ;A1B46B;
    dw $0100,$00A8,$0000,$A000,$0000,$0000,$1010                         ;A1B46D;
    dw EnemyHeaders_Tripper                                              ;A1B47B;
    dw $0070,$00A8,$0000,$A000,$0000,$0000,$1010,$FFFF                   ;A1B47D;
    db $03                                                               ;A1B48D;

EnemyPopulations_IceBeamTutorial:
    dw EnemyHeaders_Boyon                                                ;A1B48E;
    dw $0078,$00D9,$0000,$2000,$0000,$0103,$0040                         ;A1B490;
    dw EnemyHeaders_Boyon                                                ;A1B49E;
    dw $00A8,$00D9,$0000,$2000,$0000,$0103,$0040                         ;A1B4A0;
    dw EnemyHeaders_Boyon                                                ;A1B4AE;
    dw $00D8,$00D9,$0000,$2000,$0000,$0203,$0040                         ;A1B4B0;
    dw EnemyHeaders_Ripper2                                              ;A1B4BE;
    dw $0158,$00A8,$0000,$2800,$0000,$0018,$0000,$FFFF                   ;A1B4C0;
    db $01                                                               ;A1B4D0;

EnemyPopulations_PostCrocMissile:
    dw EnemyHeaders_Metaree                                              ;A1B4D1;
    dw $0118,$0038,$0000,$2000,$0000,$0000,$0000                         ;A1B4D3;
    dw EnemyHeaders_Metaree                                              ;A1B4E1;
    dw $00F8,$0040,$0000,$2000,$0000,$0000,$0000                         ;A1B4E3;
    dw EnemyHeaders_Gamet                                                ;A1B4F1;
    dw $02B0,$00E0,$0000,$6800,$0000,$0000,$3030                         ;A1B4F3;
    dw EnemyHeaders_Gamet                                                ;A1B501;
    dw $02B0,$00E0,$0000,$6800,$0000,$0000,$3000                         ;A1B503;
    dw EnemyHeaders_Gamet                                                ;A1B511;
    dw $02B0,$00E0,$0000,$6800,$0000,$0000,$3000                         ;A1B513;
    dw EnemyHeaders_Gamet                                                ;A1B521;
    dw $02B0,$00E0,$0000,$6800,$0000,$0000,$3000                         ;A1B523;
    dw EnemyHeaders_Gamet                                                ;A1B531;
    dw $02B0,$00E0,$0000,$6800,$0000,$0000,$3000,$FFFF                   ;A1B533;
    db $03                                                               ;A1B543;

EnemyPopulations_Cathedral:
    dw EnemyHeaders_Geruta                                               ;A1B544;
    dw $00A1,$0053,$0000,$2000,$0000,$0000,$0000                         ;A1B546;
    dw EnemyHeaders_Geruta                                               ;A1B554;
    dw $00A1,$0053,$0005,$2400,$0000,$8000,$0000                         ;A1B556;
    dw EnemyHeaders_Geruta                                               ;A1B564;
    dw $01DE,$0141,$0000,$2000,$0000,$0000,$0000                         ;A1B566;
    dw EnemyHeaders_Geruta                                               ;A1B574;
    dw $01DE,$0141,$0005,$2400,$0000,$8000,$0000                         ;A1B576;
    dw EnemyHeaders_Geruta                                               ;A1B584;
    dw $0224,$007D,$0000,$2000,$0000,$0000,$0000                         ;A1B586;
    dw EnemyHeaders_Geruta                                               ;A1B594;
    dw $0224,$007D,$0005,$2400,$0000,$8000,$0000                         ;A1B596;
    dw EnemyHeaders_Sova                                                 ;A1B5A4;
    dw $0140,$00E5,$0003,$2000,$0000,$0002,$0004                         ;A1B5A6;
    dw EnemyHeaders_Sova                                                 ;A1B5B4;
    dw $006E,$0116,$0003,$2000,$0000,$0002,$0004                         ;A1B5B6;
    dw EnemyHeaders_Sova                                                 ;A1B5C4;
    dw $00D8,$00B8,$0000,$2002,$0000,$0002,$0004                         ;A1B5C6;
    dw EnemyHeaders_Sova                                                 ;A1B5D4;
    dw $029C,$00F4,$0003,$2001,$0000,$0002,$0004,$FFFF                   ;A1B5D6;
    db $07                                                               ;A1B5E6;

EnemyPopulations_NorfairReserveTank:
    dw EnemyHeaders_Dragon                                               ;A1B5E7;
    dw $0158,$00F8,$0000,$2000,$0000,$0000,$0000                         ;A1B5E9;
    dw EnemyHeaders_Dragon                                               ;A1B5F7;
    dw $0158,$00F8,$0002,$2400,$0000,$0001,$0000                         ;A1B5F9;
    dw EnemyHeaders_Dragon                                               ;A1B607;
    dw $00D8,$00F8,$0000,$2000,$0000,$0000,$0000                         ;A1B609;
    dw EnemyHeaders_Dragon                                               ;A1B617;
    dw $00D8,$00F8,$0002,$2400,$0000,$0001,$0000                         ;A1B619;
    dw EnemyHeaders_Dragon                                               ;A1B627;
    dw $0098,$00F8,$0000,$2000,$0000,$0000,$0000                         ;A1B629;
    dw EnemyHeaders_Dragon                                               ;A1B637;
    dw $0098,$00F8,$0002,$2400,$0000,$0001,$0000                         ;A1B639;
    dw EnemyHeaders_Sova                                                 ;A1B647;
    dw $0078,$0045,$0002,$2001,$0000,$0006,$0004                         ;A1B649;
    dw EnemyHeaders_Sova                                                 ;A1B657;
    dw $00F8,$0050,$0002,$2001,$0000,$0006,$0004                         ;A1B659;
    dw EnemyHeaders_Sova                                                 ;A1B667;
    dw $0187,$003A,$0002,$2001,$0000,$0006,$0004,$FFFF                   ;A1B669;
    db $06                                                               ;A1B679;

EnemyPopulations_GrappleTutorial2:
    dw EnemyHeaders_Fune                                                 ;A1B67A;
    dw $00F0,$0290,$0000,$A000,$0000,$2000,$A007                         ;A1B67C;
    dw EnemyHeaders_Fune                                                 ;A1B68A;
    dw $0010,$01B0,$0000,$A000,$0000,$2010,$A007                         ;A1B68C;
    dw EnemyHeaders_Fune                                                 ;A1B69A;
    dw $00F0,$0210,$0000,$A000,$0000,$2000,$A007,$FFFF                   ;A1B69C;
    db $03                                                               ;A1B6AC;

EnemyPopulations_IceBeamSnake:
    dw EnemyHeaders_Sova                                                 ;A1B6AD;
    dw $0158,$01B8,$0003,$2800,$0000,$0001,$0004                         ;A1B6AF;
    dw EnemyHeaders_Sova                                                 ;A1B6BD;
    dw $0198,$01B8,$0003,$2800,$0000,$0001,$0004                         ;A1B6BF;
    dw EnemyHeaders_Sova                                                 ;A1B6CD;
    dw $0178,$01B8,$0003,$2800,$0000,$0001,$0004                         ;A1B6CF;
    dw EnemyHeaders_Fune                                                 ;A1B6DD;
    dw $00B0,$01C4,$0000,$A000,$0000,$5000,$5007                         ;A1B6DF;
    dw EnemyHeaders_Fune                                                 ;A1B6ED;
    dw $0020,$0100,$0000,$A000,$0000,$5010,$5007                         ;A1B6EF;
    dw EnemyHeaders_Fune                                                 ;A1B6FD;
    dw $00B0,$0144,$0000,$A000,$0000,$5000,$5007                         ;A1B6FF;
    dw EnemyHeaders_Fune                                                 ;A1B70D;
    dw $0020,$0290,$0000,$A000,$0000,$5010,$5007,$FFFF                   ;A1B70F;
    db $07                                                               ;A1B71F;

EnemyPopulations_GoldenTorizo:
    dw EnemyHeaders_GoldenTorizo                                         ;A1B720;
    dw $0080,$0180,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1B722;
    db $00                                                               ;A1B732;

EnemyPopulations_SpikyPlatformsTunnel:
    dw EnemyHeaders_Tripper                                              ;A1B733;
    dw $0280,$00A8,$0000,$A800,$0000,$0001,$0018                         ;A1B735;
    dw EnemyHeaders_Tripper                                              ;A1B743;
    dw $0180,$00A8,$0000,$A800,$0000,$0000,$0718                         ;A1B745;
    dw EnemyHeaders_ShutterShootable                                     ;A1B753;
    dw $0200,$0008,$0110,$A800,$0303,$4002,$0030,$FFFF                   ;A1B755;
    db $02                                                               ;A1B765;

EnemyPopulations_SpeedBooster:
    dw $FFFF                                                             ;A1B766;
    db $00                                                               ;A1B768;

EnemyPopulations_LNFarming:
    dw EnemyHeaders_Viola                                                ;A1B769;
    dw $0228,$0088,$0003,$2001,$0000,$0002,$0006                         ;A1B76B;
    dw EnemyHeaders_Viola                                                ;A1B779;
    dw $0238,$00D8,$0002,$2001,$0000,$0002,$0006                         ;A1B77B;
    dw EnemyHeaders_Viola                                                ;A1B789;
    dw $0168,$0088,$0003,$2000,$0000,$0002,$0006                         ;A1B78B;
    dw EnemyHeaders_Viola                                                ;A1B799;
    dw $0168,$00D8,$0002,$2000,$0000,$0002,$0006                         ;A1B79B;
    dw EnemyHeaders_Viola                                                ;A1B7A9;
    dw $00D8,$0098,$0003,$2001,$0000,$0002,$0006                         ;A1B7AB;
    dw EnemyHeaders_Zebbo                                                ;A1B7B9;
    dw $0298,$00F0,$0000,$6900,$0000,$0002,$0000                         ;A1B7BB;
    dw EnemyHeaders_Zebbo                                                ;A1B7C9;
    dw $0258,$00F0,$0000,$6900,$0000,$0002,$0000                         ;A1B7CB;
    dw EnemyHeaders_Zebbo                                                ;A1B7D9;
    dw $0208,$00F0,$0000,$6900,$0000,$0002,$0000                         ;A1B7DB;
    dw EnemyHeaders_Zebbo                                                ;A1B7E9;
    dw $01C8,$00F0,$0000,$6900,$0000,$0002,$0000                         ;A1B7EB;
    dw EnemyHeaders_Zebbo                                                ;A1B7F9;
    dw $0148,$00F0,$0000,$6900,$0000,$0002,$0000                         ;A1B7FB;
    dw EnemyHeaders_Zebbo                                                ;A1B809;
    dw $00F8,$00F0,$0000,$6900,$0000,$0002,$0000,$FFFF                   ;A1B80B;
    db $0B                                                               ;A1B81B;

EnemyPopulations_SingleChamber:
    dw EnemyHeaders_Multiviola                                           ;A1B81C;
    dw $003C,$0356,$0000,$2800,$0000,$00D0,$0002                         ;A1B81E;
    dw EnemyHeaders_Multiviola                                           ;A1B82C;
    dw $0099,$01E3,$0000,$2000,$0000,$0058,$0002                         ;A1B82E;
    dw EnemyHeaders_Multiviola                                           ;A1B83C;
    dw $00CF,$00D2,$0000,$2800,$0000,$0088,$0002                         ;A1B83E;
    dw EnemyHeaders_Alcoon                                               ;A1B84C;
    dw $0080,$0338,$0000,$2800,$0000,$0000,$0000                         ;A1B84E;
    dw EnemyHeaders_Alcoon                                               ;A1B85C;
    dw $0080,$0238,$0000,$2800,$0000,$0000,$0000                         ;A1B85E;
    dw EnemyHeaders_Alcoon                                               ;A1B86C;
    dw $00D8,$0138,$0000,$2800,$0000,$0000,$0000                         ;A1B86E;
    dw EnemyHeaders_Alcoon                                               ;A1B87C;
    dw $0088,$0138,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A1B87E;
    db $04                                                               ;A1B88E;

EnemyPopulations_SpeedBoosterHall:
    dw EnemyHeaders_Geruta                                               ;A1B88F;
    dw $0388,$0128,$0000,$2000,$0000,$0000,$0000                         ;A1B891;
    dw EnemyHeaders_Geruta                                               ;A1B89F;
    dw $0388,$0128,$0005,$2400,$0000,$8000,$0000                         ;A1B8A1;
    dw EnemyHeaders_Geruta                                               ;A1B8AF;
    dw $0488,$0128,$0000,$2000,$0000,$0000,$0000                         ;A1B8B1;
    dw EnemyHeaders_Geruta                                               ;A1B8BF;
    dw $0488,$0128,$0005,$2400,$0000,$8000,$0000                         ;A1B8C1;
    dw EnemyHeaders_Geruta                                               ;A1B8CF;
    dw $062C,$0188,$0000,$2000,$0000,$0000,$0000                         ;A1B8D1;
    dw EnemyHeaders_Geruta                                               ;A1B8DF;
    dw $062C,$0188,$0005,$2400,$0000,$8000,$0000                         ;A1B8E1;
    dw EnemyHeaders_Metaree                                              ;A1B8EF;
    dw $0120,$0064,$0000,$2000,$0000,$0000,$0000                         ;A1B8F1;
    dw EnemyHeaders_Metaree                                              ;A1B8FF;
    dw $00F0,$0056,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1B901;
    db $05                                                               ;A1B911;

EnemyPopulations_BatCave:
    dw EnemyHeaders_Gamet                                                ;A1B912;
    dw $0060,$00B0,$0000,$6800,$0000,$0000,$2020                         ;A1B914;
    dw EnemyHeaders_Gamet                                                ;A1B922;
    dw $0060,$00B0,$0000,$6800,$0000,$0000,$2000                         ;A1B924;
    dw EnemyHeaders_Gamet                                                ;A1B932;
    dw $0060,$00B0,$0000,$6800,$0000,$0000,$2000                         ;A1B934;
    dw EnemyHeaders_Gamet                                                ;A1B942;
    dw $0060,$00B0,$0000,$6800,$0000,$0000,$2000                         ;A1B944;
    dw EnemyHeaders_Gamet                                                ;A1B952;
    dw $0060,$00B0,$0000,$6800,$0000,$0000,$2000                         ;A1B954;
    dw EnemyHeaders_Skree                                                ;A1B962;
    dw $00C8,$0148,$0000,$2000,$0000,$0000,$0000                         ;A1B964;
    dw EnemyHeaders_Skree                                                ;A1B972;
    dw $00A8,$0140,$0000,$2000,$0000,$0000,$0000                         ;A1B974;
    dw EnemyHeaders_Skree                                                ;A1B982;
    dw $0080,$0138,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1B984;
    db $04                                                               ;A1B994;

EnemyPopulations_KronicBoost:
    dw EnemyHeaders_Viola                                                ;A1B995;
    dw $0188,$00A8,$0003,$2000,$0000,$0002,$0006                         ;A1B997;
    dw EnemyHeaders_Viola                                                ;A1B9A5;
    dw $0160,$01C8,$0003,$2000,$0000,$0002,$0006                         ;A1B9A7;
    dw EnemyHeaders_Viola                                                ;A1B9B5;
    dw $01A0,$0208,$0003,$2001,$0000,$0002,$0006                         ;A1B9B7;
    dw EnemyHeaders_Viola                                                ;A1B9C5;
    dw $0180,$0258,$0003,$2000,$0000,$0002,$0006,$FFFF                   ;A1B9C7;
    db $04                                                               ;A1B9D7;

EnemyPopulations_BusinessCenter:
    dw EnemyHeaders_Elevator                                             ;A1B9D8;
    dw $0080,$02C2,$0000,$2C00,$0000,$0001,$0018                         ;A1B9DA;
    dw EnemyHeaders_Sova                                                 ;A1B9E8;
    dw $007B,$0358,$0003,$2001,$0000,$0001,$0004                         ;A1B9EA;
    dw EnemyHeaders_Sova                                                 ;A1B9F8;
    dw $0090,$03E8,$0003,$2000,$0000,$0001,$0004                         ;A1B9FA;
    dw EnemyHeaders_Sova                                                 ;A1BA08;
    dw $0061,$0438,$0003,$2001,$0000,$0001,$0004                         ;A1BA0A;
    dw EnemyHeaders_Sova                                                 ;A1BA18;
    dw $00A0,$0518,$0003,$2000,$0000,$0001,$0004                         ;A1BA1A;
    dw EnemyHeaders_Sova                                                 ;A1BA28;
    dw $0060,$0548,$0000,$2000,$0000,$0000,$0004                         ;A1BA2A;
    dw EnemyHeaders_Sova                                                 ;A1BA38;
    dw $0081,$05E8,$0003,$2000,$0000,$0001,$0004,$FFFF                   ;A1BA3A;
    db $06                                                               ;A1BA4A;

EnemyPopulations_ThreeMusketeers:
    dw EnemyHeaders_Hibashi                                              ;A1BA4B;
    dw $0297,$0280,$0000,$2500,$0000,$0030,$0000                         ;A1BA4D;
    dw EnemyHeaders_Hibashi                                              ;A1BA5B;
    dw $0297,$0280,$0000,$2100,$0000,$0000,$0001                         ;A1BA5D;
    dw EnemyHeaders_Hibashi                                              ;A1BA6B;
    dw $0337,$0280,$0000,$2500,$0000,$0030,$0000                         ;A1BA6D;
    dw EnemyHeaders_Hibashi                                              ;A1BA7B;
    dw $0337,$0280,$0000,$2100,$0000,$0000,$0001                         ;A1BA7D;
    dw EnemyHeaders_KihunterRed                                          ;A1BA8B;
    dw $0155,$01F2,$0000,$2800,$0000,$0384,$0000                         ;A1BA8D;
    dw EnemyHeaders_KihunterRedWings                                     ;A1BA9B;
    dw $0155,$01F2,$0000,$2C00,$0000,$0020,$0000                         ;A1BA9D;
    dw EnemyHeaders_KihunterRed                                          ;A1BAAB;
    dw $0165,$0174,$0000,$2800,$0000,$0384,$0000                         ;A1BAAD;
    dw EnemyHeaders_KihunterRedWings                                     ;A1BABB;
    dw $0165,$0174,$0000,$2C00,$0000,$0020,$0000                         ;A1BABD;
    dw EnemyHeaders_KihunterRed                                          ;A1BACB;
    dw $014A,$0108,$0000,$2800,$0000,$0384,$0000                         ;A1BACD;
    dw EnemyHeaders_KihunterRedWings                                     ;A1BADB;
    dw $014A,$0108,$0000,$2C00,$0000,$0020,$0000                         ;A1BADD;
    dw EnemyHeaders_ShutterShootable                                     ;A1BAEB;
    dw $02E8,$025A,$0108,$A800,$FF00,$4003,$0000                         ;A1BAED;
    dw EnemyHeaders_ShutterShootable                                     ;A1BAFB;
    dw $0388,$023A,$0108,$A800,$FF00,$4003,$0000,$FFFF                   ;A1BAFD;
    db $03                                                               ;A1BB0D;

EnemyPopulations_Crocomire:
    dw EnemyHeaders_Crocomire                                            ;A1BB0E;
    dw $0480,$0078,$BD2A,$A800,$0004,$0000,$0000                         ;A1BB10;
    dw EnemyHeaders_CrocomireTongue                                      ;A1BB1E;
    dw $0480,$0078,$BD2A,$A800,$0004,$0000,$0000,$FFFF                   ;A1BB20;
    db $00                                                               ;A1BB30;

EnemyPopulations_LNElevSave:
    dw $FFFF                                                             ;A1BB31;
    db $00                                                               ;A1BB33;

EnemyPopulations_Volcano:
    dw EnemyHeaders_Fune                                                 ;A1BB34;
    dw $01D0,$0280,$0000,$A000,$0000,$8000,$8005                         ;A1BB36;
    dw EnemyHeaders_Fune                                                 ;A1BB44;
    dw $02E0,$0210,$0000,$A000,$0000,$8000,$0007                         ;A1BB46;
    dw EnemyHeaders_Fune                                                 ;A1BB54;
    dw $0220,$01C8,$0000,$A000,$0000,$8010,$0007                         ;A1BB56;
    dw EnemyHeaders_Fune                                                 ;A1BB64;
    dw $02E0,$0178,$0000,$A000,$0000,$8000,$0007                         ;A1BB66;
    dw EnemyHeaders_Fune                                                 ;A1BB74;
    dw $0220,$0128,$0000,$A000,$0000,$8010,$0007                         ;A1BB76;
    dw EnemyHeaders_Fune                                                 ;A1BB84;
    dw $02E0,$00D8,$0000,$A000,$0000,$8000,$0007                         ;A1BB86;
    dw EnemyHeaders_LavaRocks                                            ;A1BB94;
    dw $00F8,$02C8,$0000,$2500,$0000,$0000,$0000                         ;A1BB96;
    dw EnemyHeaders_LavaRocks                                            ;A1BBA4;
    dw $0080,$02C8,$0000,$2500,$0000,$0000,$0000                         ;A1BBA6;
    dw EnemyHeaders_LavaRocks                                            ;A1BBB4;
    dw $0088,$02C8,$0000,$2500,$0000,$0000,$0000                         ;A1BBB6;
    dw EnemyHeaders_LavaRocks                                            ;A1BBC4;
    dw $0108,$02C8,$0000,$2500,$0000,$0000,$0000,$FFFF                   ;A1BBC6;
    db $0A                                                               ;A1BBD6;

EnemyPopulations_UpperNorfairFarming:
    dw EnemyHeaders_Fune                                                 ;A1BBD7;
    dw $01F0,$0190,$0000,$A000,$0000,$2000,$2007                         ;A1BBD9;
    dw EnemyHeaders_Gamet                                                ;A1BBE7;
    dw $0130,$01C0,$0000,$6800,$0000,$0000,$4050                         ;A1BBE9;
    dw EnemyHeaders_Gamet                                                ;A1BBF7;
    dw $0130,$01C0,$0000,$6800,$0000,$0000,$4000                         ;A1BBF9;
    dw EnemyHeaders_Gamet                                                ;A1BC07;
    dw $0130,$01C0,$0000,$6800,$0000,$0000,$4000                         ;A1BC09;
    dw EnemyHeaders_Gamet                                                ;A1BC17;
    dw $0130,$01C0,$0000,$6800,$0000,$0000,$4000                         ;A1BC19;
    dw EnemyHeaders_Gamet                                                ;A1BC27;
    dw $0130,$01C0,$0000,$6800,$0000,$0000,$4000,$FFFF                   ;A1BC29;
    db $02                                                               ;A1BC39;

EnemyPopulations_SpongeBath_1:
    dw EnemyHeaders_Bull                                                 ;A1BC3A;
    dw $00F0,$0088,$0000,$2800,$0000,$0003,$0003,$FFFF                   ;A1BC3C;
    db $01                                                               ;A1BC4C;

EnemyPopulations_WreckedShipETank_1:
    dw EnemyHeaders_Skultera                                             ;A1BC4D;
    dw $00AD,$0176,$0000,$2000,$0000,$0010,$0210                         ;A1BC4F;
    dw EnemyHeaders_Skultera                                             ;A1BC5D;
    dw $0240,$012C,$0000,$2000,$0000,$0110,$0210                         ;A1BC5F;
    dw EnemyHeaders_Kamer2                                               ;A1BC6D;
    dw $0118,$00A8,$0000,$A800,$0000,$0000,$2000                         ;A1BC6F;
    dw EnemyHeaders_Kamer2                                               ;A1BC7D;
    dw $0180,$00A8,$0000,$A800,$0000,$0000,$2000                         ;A1BC7F;
    dw EnemyHeaders_Kamer2                                               ;A1BC8D;
    dw $01F0,$00A8,$0000,$A800,$0000,$0000,$2000,$FFFF                   ;A1BC8F;
    db $02                                                               ;A1BC9F;

EnemyPopulations_WreckedShipMainShaft_0:
    dw EnemyHeaders_Coven                                                ;A1BCA0;
    dw $0038,$03D8,$0000,$6800,$0000,$0000,$0000                         ;A1BCA2;
    dw EnemyHeaders_Sbug                                                 ;A1BCB0;
    dw $0442,$034A,$0000,$2400,$0000,$7002,$0050                         ;A1BCB2;
    dw EnemyHeaders_Sbug                                                 ;A1BCC0;
    dw $044D,$0351,$0000,$2400,$0000,$7C02,$0050                         ;A1BCC2;
    dw EnemyHeaders_Sbug                                                 ;A1BCD0;
    dw $04C8,$03CC,$0000,$2400,$0000,$CC03,$0050                         ;A1BCD2;
    dw EnemyHeaders_Sbug                                                 ;A1BCE0;
    dw $04C5,$03D3,$0000,$2400,$0000,$D804,$0080                         ;A1BCE2;
    dw EnemyHeaders_Sbug                                                 ;A1BCF0;
    dw $04CE,$03D9,$0000,$2400,$0000,$D003,$00A0                         ;A1BCF2;
    dw EnemyHeaders_Sbug                                                 ;A1BD00;
    dw $04CB,$04CB,$0000,$2400,$0000,$2003,$00A0                         ;A1BD02;
    dw EnemyHeaders_Sbug                                                 ;A1BD10;
    dw $04CC,$04D6,$0000,$2400,$0000,$FF02,$00A0                         ;A1BD12;
    dw EnemyHeaders_Sbug                                                 ;A1BD20;
    dw $04C4,$04D1,$0000,$2400,$0000,$0A03,$0050                         ;A1BD22;
    dw EnemyHeaders_Sbug                                                 ;A1BD30;
    dw $04DE,$04BE,$0000,$2400,$0000,$D003,$0050                         ;A1BD32;
    dw EnemyHeaders_Sbug                                                 ;A1BD40;
    dw $03A7,$0521,$0000,$2400,$0000,$7A02,$0050                         ;A1BD42;
    dw EnemyHeaders_Sbug                                                 ;A1BD50;
    dw $03B9,$052C,$0000,$2400,$0000,$7E02,$0050                         ;A1BD52;
    dw EnemyHeaders_Sbug                                                 ;A1BD60;
    dw $04C4,$027D,$0000,$2400,$0000,$FC02,$0050                         ;A1BD62;
    dw EnemyHeaders_Sbug                                                 ;A1BD70;
    dw $04CA,$028A,$0000,$2400,$0000,$0803,$0080                         ;A1BD72;
    dw EnemyHeaders_Sbug                                                 ;A1BD80;
    dw $04DB,$0278,$0000,$2400,$0000,$E003,$0080                         ;A1BD82;
    dw EnemyHeaders_Sbug                                                 ;A1BD90;
    dw $0425,$0210,$0000,$2400,$0000,$8402,$0080                         ;A1BD92;
    dw EnemyHeaders_Sbug                                                 ;A1BDA0;
    dw $0424,$0206,$0000,$2400,$0000,$7802,$0040                         ;A1BDA2;
    dw EnemyHeaders_Sbug                                                 ;A1BDB0;
    dw $0145,$02BA,$0000,$2400,$0000,$9103,$0040                         ;A1BDB2;
    dw EnemyHeaders_Sbug                                                 ;A1BDC0;
    dw $013D,$02C3,$0000,$2400,$0000,$8C02,$0040                         ;A1BDC2;
    dw EnemyHeaders_Sbug                                                 ;A1BDD0;
    dw $010D,$02DB,$0000,$2400,$0000,$AC03,$0080                         ;A1BDD2;
    dw EnemyHeaders_Sbug                                                 ;A1BDE0;
    dw $01AD,$04E8,$0000,$2400,$0000,$E804,$0020                         ;A1BDE2;
    dw EnemyHeaders_KzanTop                                              ;A1BDF0;
    dw $0260,$0558,$0000,$A000,$0000,$0000,$0000                         ;A1BDF2;
    dw EnemyHeaders_KzanBottom                                           ;A1BE00;
    dw $0260,$0560,$0000,$0100,$0000,$0000,$0000                         ;A1BE02;
    dw EnemyHeaders_KzanTop                                              ;A1BE10;
    dw $01C0,$0558,$0000,$A000,$0000,$0000,$0000                         ;A1BE12;
    dw EnemyHeaders_KzanBottom                                           ;A1BE20;
    dw $01C0,$0560,$0000,$0100,$0000,$0000,$0000                         ;A1BE22;
    dw EnemyHeaders_KzanTop                                              ;A1BE30;
    dw $0120,$0558,$0000,$A000,$0000,$0000,$0000                         ;A1BE32;
    dw EnemyHeaders_KzanBottom                                           ;A1BE40;
    dw $0120,$0560,$0000,$0100,$0000,$0000,$0000                         ;A1BE42;
    dw EnemyHeaders_KzanTop                                              ;A1BE50;
    dw $0080,$0558,$0000,$A000,$0000,$0000,$0000                         ;A1BE52;
    dw EnemyHeaders_KzanBottom                                           ;A1BE60;
    dw $0080,$0560,$0000,$0100,$0000,$0000,$0000                         ;A1BE62;
    dw EnemyHeaders_Atomic                                               ;A1BE70;
    dw $0430,$07D0,$0000,$2000,$0000,$0000,$0000                         ;A1BE72;
    dw EnemyHeaders_Atomic                                               ;A1BE80;
    dw $04D0,$07D0,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1BE82;
    db $03                                                               ;A1BE92;

EnemyPopulations_BowlingAlley_0:
    dw EnemyHeaders_Chozo                                                ;A1BE93;
    dw $04C8,$018A,$0000,$2000,$0000,$0000,$0000                         ;A1BE95;
    dw EnemyHeaders_Sbug                                                 ;A1BEA3;
    dw $04CB,$0189,$0000,$2400,$0000,$C203,$0080                         ;A1BEA5;
    dw EnemyHeaders_Sbug                                                 ;A1BEB3;
    dw $04CC,$017C,$0000,$2400,$0000,$DC04,$0080                         ;A1BEB5;
    dw EnemyHeaders_Sbug                                                 ;A1BEC3;
    dw $04C5,$0184,$0000,$2400,$0000,$DE03,$0080                         ;A1BEC5;
    dw EnemyHeaders_Sbug                                                 ;A1BED3;
    dw $04D1,$0191,$0000,$2400,$0000,$C402,$0080                         ;A1BED5;
    dw EnemyHeaders_Sbug                                                 ;A1BEE3;
    dw $04CC,$019D,$0000,$2400,$0000,$D803,$0080                         ;A1BEE5;
    dw EnemyHeaders_Sbug                                                 ;A1BEF3;
    dw $0026,$01D2,$0000,$2400,$0000,$8802,$0080                         ;A1BEF5;
    dw EnemyHeaders_Sbug                                                 ;A1BF03;
    dw $009D,$01EA,$0000,$2400,$0000,$8C03,$0080                         ;A1BF05;
    dw EnemyHeaders_Sbug                                                 ;A1BF13;
    dw $00CE,$01D2,$0000,$2400,$0000,$9802,$0080                         ;A1BF15;
    dw EnemyHeaders_Sbug                                                 ;A1BF23;
    dw $00D3,$01CF,$0000,$2400,$0000,$9004,$0080                         ;A1BF25;
    dw EnemyHeaders_Sbug                                                 ;A1BF33;
    dw $0025,$01B0,$0000,$2400,$0000,$8802,$0080                         ;A1BF35;
    dw EnemyHeaders_Sbug                                                 ;A1BF43;
    dw $002D,$01B9,$0000,$2400,$0000,$9802,$0080                         ;A1BF45;
    dw EnemyHeaders_Sbug                                                 ;A1BF53;
    dw $0030,$01BF,$0000,$2400,$0000,$9202,$0080                         ;A1BF55;
    dw EnemyHeaders_Sbug                                                 ;A1BF63;
    dw $01E2,$01DA,$0000,$2400,$0000,$B802,$0080                         ;A1BF65;
    dw EnemyHeaders_Sbug                                                 ;A1BF73;
    dw $01DD,$01E3,$0000,$2400,$0000,$8803,$0080                         ;A1BF75;
    dw EnemyHeaders_Sbug                                                 ;A1BF83;
    dw $01F8,$01E3,$0000,$2400,$0000,$E003,$0080                         ;A1BF85;
    dw EnemyHeaders_Sbug                                                 ;A1BF93;
    dw $0275,$01E1,$0000,$2400,$0000,$D003,$0080                         ;A1BF95;
    dw EnemyHeaders_Sbug                                                 ;A1BFA3;
    dw $035D,$01D2,$0000,$2400,$0000,$C802,$0080                         ;A1BFA5;
    dw EnemyHeaders_Sbug                                                 ;A1BFB3;
    dw $0332,$01E7,$0000,$2400,$0000,$D002,$0080                         ;A1BFB5;
    dw EnemyHeaders_Sbug                                                 ;A1BFC3;
    dw $035F,$01D9,$0000,$2400,$0000,$C804,$0080                         ;A1BFC5;
    dw EnemyHeaders_Sbug                                                 ;A1BFD3;
    dw $0324,$01E2,$0000,$2400,$0000,$C402,$0080,$FFFF                   ;A1BFD5;
    db $00                                                               ;A1BFE5;

EnemyPopulations_Attic_1:
    dw EnemyHeaders_KihunterYellow                                       ;A1BFE6;
    dw $0419,$00C8,$0000,$2800,$0000,$FFFF,$0000                         ;A1BFE8;
    dw EnemyHeaders_KihunterYellowWings                                  ;A1BFF6;
    dw $0419,$00C8,$0000,$2C00,$0000,$0020,$0000                         ;A1BFF8;
    dw EnemyHeaders_KihunterYellow                                       ;A1C006;
    dw $01FF,$008E,$0000,$2800,$0000,$0000,$0000                         ;A1C008;
    dw EnemyHeaders_KihunterYellowWings                                  ;A1C016;
    dw $01FF,$008E,$0000,$2C00,$0000,$0020,$0000                         ;A1C018;
    dw EnemyHeaders_KihunterYellow                                       ;A1C026;
    dw $05D5,$0076,$0000,$2800,$0000,$0000,$0000                         ;A1C028;
    dw EnemyHeaders_KihunterYellowWings                                  ;A1C036;
    dw $05D5,$0076,$0000,$2C00,$0000,$0020,$0000                         ;A1C038;
    dw EnemyHeaders_Atomic                                               ;A1C046;
    dw $058F,$005A,$0000,$2000,$0000,$0001,$0008                         ;A1C048;
    dw EnemyHeaders_Atomic                                               ;A1C056;
    dw $0352,$0061,$0000,$2000,$0000,$0001,$0008                         ;A1C058;
    dw EnemyHeaders_Atomic                                               ;A1C066;
    dw $022C,$0060,$0000,$2000,$0000,$0001,$0008                         ;A1C068;
    dw EnemyHeaders_Atomic                                               ;A1C076;
    dw $0093,$007C,$0000,$2000,$0000,$0000,$0008                         ;A1C078;
    dw EnemyHeaders_KihunterYellow                                       ;A1C086;
    dw $04E8,$00C8,$0000,$2800,$0000,$FFFF,$0000                         ;A1C088;
    dw EnemyHeaders_KihunterYellowWings                                  ;A1C096;
    dw $04E8,$00C8,$0000,$2C00,$0000,$0020,$0000                         ;A1C098;
    dw EnemyHeaders_Spark                                                ;A1C0A6;
    dw $00E0,$0058,$0000,$2000,$0000,$0002,$0090                         ;A1C0A8;
    dw EnemyHeaders_Spark                                                ;A1C0B6;
    dw $0130,$00B8,$0000,$2000,$0000,$0001,$0050                         ;A1C0B8;
    dw EnemyHeaders_Spark                                                ;A1C0C6;
    dw $0290,$00B8,$0000,$2000,$0000,$0001,$0020                         ;A1C0C8;
    dw EnemyHeaders_Spark                                                ;A1C0D6;
    dw $02F0,$0068,$0000,$2000,$0000,$0002,$0080                         ;A1C0D8;
    dw EnemyHeaders_Spark                                                ;A1C0E6;
    dw $0370,$00D8,$0000,$2000,$0000,$0001,$0030                         ;A1C0E8;
    dw EnemyHeaders_Spark                                                ;A1C0F6;
    dw $0430,$0088,$0000,$2000,$0000,$0002,$0080                         ;A1C0F8;
    dw EnemyHeaders_Spark                                                ;A1C106;
    dw $04D0,$0088,$0000,$2000,$0000,$0002,$0070                         ;A1C108;
    dw EnemyHeaders_Spark                                                ;A1C116;
    dw $05D0,$00B8,$0000,$2000,$0000,$0001,$0010                         ;A1C118;
    dw EnemyHeaders_Spark                                                ;A1C126;
    dw $0630,$0078,$0000,$2000,$0000,$0002,$0060,$FFFF                   ;A1C128;
    db $08                                                               ;A1C138;

EnemyPopulations_Basement_1:
    dw EnemyHeaders_Robot                                                ;A1C139;
    dw $004D,$00B0,$0000,$2800,$0000,$0000,$0000                         ;A1C13B;
    dw EnemyHeaders_Robot                                                ;A1C149;
    dw $0370,$00B0,$0000,$2800,$0000,$0000,$0000                         ;A1C14B;
    dw EnemyHeaders_Atomic                                               ;A1C159;
    dw $0098,$004D,$0000,$2000,$0000,$0000,$0008                         ;A1C15B;
    dw EnemyHeaders_Atomic                                               ;A1C169;
    dw $027E,$00A8,$0000,$2000,$0000,$0002,$0008                         ;A1C16B;
    dw EnemyHeaders_Atomic                                               ;A1C179;
    dw $0354,$0049,$0000,$2000,$0000,$0002,$0008                         ;A1C17B;
    dw EnemyHeaders_Spark                                                ;A1C189;
    dw $0479,$006A,$0000,$2000,$0000,$0001,$0020,$FFFF                   ;A1C18B;
    db $05                                                               ;A1C19B;

EnemyPopulations_WreckedShipMap_1:
    dw $FFFF                                                             ;A1C19C;
    db $00                                                               ;A1C19E;

EnemyPopulations_WSWestSuper_0:
    dw $FFFF                                                             ;A1C19F;
    db $00                                                               ;A1C1A1;

EnemyPopulations_SpikyDeath_0:
    dw $FFFF                                                             ;A1C1A2;
    db $00                                                               ;A1C1A4;

EnemyPopulations_SpongeBath_0:
    dw $FFFF                                                             ;A1C1A5;
    db $00                                                               ;A1C1A7;

EnemyPopulations_WreckedShipEntrance_1:
    dw $FFFF                                                             ;A1C1A8;
    db $00                                                               ;A1C1AA;

EnemyPopulations_ElectricDeath_0:
    dw $FFFF                                                             ;A1C1AB;
    db $00                                                               ;A1C1AD;

EnemyPopulations_BowlingAlley_1:
    dw EnemyHeaders_Chozo                                                ;A1C1AE;
    dw $04C8,$018A,$0000,$2000,$0000,$0000,$0000                         ;A1C1B0;
    dw EnemyHeaders_Robot                                                ;A1C1BE;
    dw $02F0,$0270,$0000,$2800,$0000,$0000,$0000                         ;A1C1C0;
    dw EnemyHeaders_Robot                                                ;A1C1CE;
    dw $0370,$0270,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A1C1D0;
    db $02                                                               ;A1C1E0;

EnemyPopulations_AssemblyLine_0:
    dw $FFFF                                                             ;A1C1E1;
    db $00                                                               ;A1C1E3;

EnemyPopulations_Phantoon_1:
    dw $FFFF                                                             ;A1C1E4;
    db $00                                                               ;A1C1E6;

EnemyPopulations_WreckedShipETank_0:
    dw $FFFF                                                             ;A1C1E7;
    db $00                                                               ;A1C1E9;

EnemyPopulations_GravitySuit_0:
    dw $FFFF                                                             ;A1C1EA;
    db $00                                                               ;A1C1EC;

EnemyPopulations_WreckedShipMap_0:
    dw EnemyHeaders_Coven                                                ;A1C1ED;
    dw $0088,$0088,$0000,$6800,$0000,$0000,$0000                         ;A1C1EF;
    dw EnemyHeaders_Sbug                                                 ;A1C1FD;
    dw $0058,$00B8,$0000,$2400,$0000,$B802,$0050                         ;A1C1FF;
    dw EnemyHeaders_Sbug                                                 ;A1C20D;
    dw $0050,$00A8,$0000,$2400,$0000,$C402,$0050                         ;A1C20F;
    dw EnemyHeaders_Sbug                                                 ;A1C21D;
    dw $004D,$00CF,$0000,$2400,$0000,$FA03,$0050                         ;A1C21F;
    dw EnemyHeaders_Sbug                                                 ;A1C22D;
    dw $00CD,$00B8,$0000,$2400,$0000,$B004,$0080                         ;A1C22F;
    dw EnemyHeaders_Sbug                                                 ;A1C23D;
    dw $00C8,$00B0,$0000,$2400,$0000,$B803,$00A0                         ;A1C23F;
    dw EnemyHeaders_Sbug                                                 ;A1C24D;
    dw $00D0,$00B8,$0000,$2400,$0000,$D003,$00A0                         ;A1C24F;
    dw EnemyHeaders_Sbug                                                 ;A1C25D;
    dw $008B,$0027,$0000,$2400,$0000,$7802,$00A0                         ;A1C25F;
    dw EnemyHeaders_Sbug                                                 ;A1C26D;
    dw $008D,$0008,$0000,$2400,$0000,$8A02,$0050,$FFFF                   ;A1C26F;
    db $01                                                               ;A1C27F;

EnemyPopulations_GravitySuit_1:
    dw $FFFF                                                             ;A1C280;
    db $00                                                               ;A1C282;

EnemyPopulations_Basement_0:
    dw EnemyHeaders_Sbug                                                 ;A1C283;
    dw $036B,$00BB,$0000,$2400,$0000,$C203,$0080                         ;A1C285;
    dw EnemyHeaders_Sbug                                                 ;A1C293;
    dw $0370,$00B8,$0000,$2400,$0000,$DC04,$0080                         ;A1C295;
    dw EnemyHeaders_Sbug                                                 ;A1C2A3;
    dw $0370,$00BC,$0000,$2400,$0000,$DE03,$0080                         ;A1C2A5;
    dw EnemyHeaders_Sbug                                                 ;A1C2B3;
    dw $0368,$00C3,$0000,$2400,$0000,$C402,$0080                         ;A1C2B5;
    dw EnemyHeaders_Sbug                                                 ;A1C2C3;
    dw $0372,$00C9,$0000,$2400,$0000,$D803,$0080                         ;A1C2C5;
    dw EnemyHeaders_Sbug                                                 ;A1C2D3;
    dw $004E,$00AA,$0000,$2400,$0000,$8802,$0080                         ;A1C2D5;
    dw EnemyHeaders_Sbug                                                 ;A1C2E3;
    dw $0051,$00AD,$0000,$2400,$0000,$8C03,$0080                         ;A1C2E5;
    dw EnemyHeaders_Sbug                                                 ;A1C2F3;
    dw $0048,$00C8,$0000,$2400,$0000,$7002,$0080                         ;A1C2F5;
    dw EnemyHeaders_Sbug                                                 ;A1C303;
    dw $0052,$00C2,$0000,$2400,$0000,$9004,$0080                         ;A1C305;
    dw EnemyHeaders_Sbug                                                 ;A1C313;
    dw $0029,$00AA,$0000,$2400,$0000,$8802,$0080                         ;A1C315;
    dw EnemyHeaders_Sbug                                                 ;A1C323;
    dw $002D,$00B9,$0000,$2400,$0000,$9802,$0080                         ;A1C325;
    dw EnemyHeaders_Sbug                                                 ;A1C333;
    dw $0030,$00BF,$0000,$2400,$0000,$9202,$0080                         ;A1C335;
    dw EnemyHeaders_Sbug                                                 ;A1C343;
    dw $01E2,$00DA,$0000,$2400,$0000,$B802,$0080                         ;A1C345;
    dw EnemyHeaders_Sbug                                                 ;A1C353;
    dw $01DD,$00E3,$0000,$2400,$0000,$8803,$0080                         ;A1C355;
    dw EnemyHeaders_Sbug                                                 ;A1C363;
    dw $01F8,$00E3,$0000,$2400,$0000,$E003,$0080                         ;A1C365;
    dw EnemyHeaders_Sbug                                                 ;A1C373;
    dw $03F3,$00AF,$0000,$2400,$0000,$D003,$0080                         ;A1C375;
    dw EnemyHeaders_Sbug                                                 ;A1C383;
    dw $03EF,$00B3,$0000,$2400,$0000,$C802,$0080                         ;A1C385;
    dw EnemyHeaders_Sbug                                                 ;A1C393;
    dw $03EA,$00CB,$0000,$2400,$0000,$D002,$0080                         ;A1C395;
    dw EnemyHeaders_Sbug                                                 ;A1C3A3;
    dw $03CC,$00DE,$0000,$2400,$0000,$C804,$0080                         ;A1C3A5;
    dw EnemyHeaders_Sbug                                                 ;A1C3B3;
    dw $03CE,$00DE,$0000,$2400,$0000,$C402,$0080                         ;A1C3B5;
    dw EnemyHeaders_RobotNoPower                                         ;A1C3C3;
    dw $004D,$00C0,$0000,$A800,$0000,$0001,$0000                         ;A1C3C5;
    dw EnemyHeaders_RobotNoPower                                         ;A1C3D3;
    dw $0370,$00C0,$0000,$A800,$0000,$0000,$0000,$FFFF                   ;A1C3D5;
    db $02                                                               ;A1C3E5;

EnemyPopulations_WreckedShipEntrance_0:
    dw EnemyHeaders_Sbug                                                 ;A1C3E6;
    dw $0074,$0040,$0000,$2400,$0000,$1802,$0050                         ;A1C3E8;
    dw EnemyHeaders_Sbug                                                 ;A1C3F6;
    dw $007C,$00BD,$0000,$2400,$0000,$E002,$0050                         ;A1C3F8;
    dw EnemyHeaders_Sbug                                                 ;A1C406;
    dw $0096,$00C5,$0000,$2400,$0000,$B803,$0050                         ;A1C408;
    dw EnemyHeaders_Sbug                                                 ;A1C416;
    dw $0073,$004A,$0000,$2400,$0000,$7804,$0080                         ;A1C418;
    dw EnemyHeaders_Sbug                                                 ;A1C426;
    dw $00BA,$0042,$0000,$2400,$0000,$3003,$00A0                         ;A1C428;
    dw EnemyHeaders_Sbug                                                 ;A1C436;
    dw $00B4,$00C8,$0000,$2400,$0000,$9803,$00A0                         ;A1C438;
    dw EnemyHeaders_Sbug                                                 ;A1C446;
    dw $0041,$0049,$0000,$2400,$0000,$7802,$00A0                         ;A1C448;
    dw EnemyHeaders_Sbug                                                 ;A1C456;
    dw $0082,$00BC,$0000,$2400,$0000,$D803,$0050                         ;A1C458;
    dw EnemyHeaders_Sbug                                                 ;A1C466;
    dw $0044,$004B,$0000,$2400,$0000,$5803,$0050                         ;A1C468;
    dw EnemyHeaders_Sbug                                                 ;A1C476;
    dw $0257,$0041,$0000,$2400,$0000,$1802,$0050                         ;A1C478;
    dw EnemyHeaders_Sbug                                                 ;A1C486;
    dw $011B,$00BC,$0000,$2400,$0000,$E802,$0050                         ;A1C488;
    dw EnemyHeaders_Sbug                                                 ;A1C496;
    dw $0112,$00C4,$0000,$2400,$0000,$F802,$0050                         ;A1C498;
    dw EnemyHeaders_Sbug                                                 ;A1C4A6;
    dw $012D,$021E,$0000,$2400,$0000,$7C03,$0080                         ;A1C4A8;
    dw EnemyHeaders_Sbug                                                 ;A1C4B6;
    dw $0125,$0226,$0000,$2400,$0000,$9403,$0080                         ;A1C4B8;
    dw EnemyHeaders_Sbug                                                 ;A1C4C6;
    dw $0143,$023F,$0000,$2400,$0000,$8402,$0080                         ;A1C4C8;
    dw EnemyHeaders_Sbug                                                 ;A1C4D6;
    dw $013F,$02BF,$0000,$2400,$0000,$A102,$0040                         ;A1C4D8;
    dw EnemyHeaders_Sbug                                                 ;A1C4E6;
    dw $0145,$02BA,$0000,$2400,$0000,$9103,$0040                         ;A1C4E8;
    dw EnemyHeaders_Sbug                                                 ;A1C4F6;
    dw $013D,$02C3,$0000,$2400,$0000,$8C02,$0040                         ;A1C4F8;
    dw EnemyHeaders_Sbug                                                 ;A1C506;
    dw $010D,$02DB,$0000,$2400,$0000,$AC03,$0080                         ;A1C508;
    dw EnemyHeaders_Sbug                                                 ;A1C516;
    dw $01AD,$04E8,$0000,$2400,$0000,$E804,$0020                         ;A1C518;
    dw EnemyHeaders_Sbug                                                 ;A1C526;
    dw $0261,$0042,$0000,$2400,$0000,$5002,$0050                         ;A1C528;
    dw EnemyHeaders_Sbug                                                 ;A1C536;
    dw $0293,$0037,$0000,$2400,$0000,$4802,$0050                         ;A1C538;
    dw EnemyHeaders_Sbug                                                 ;A1C546;
    dw $027A,$00B5,$0000,$2400,$0000,$CC02,$0050                         ;A1C548;
    dw EnemyHeaders_Sbug                                                 ;A1C556;
    dw $028B,$00BE,$0000,$2400,$0000,$DD02,$0050                         ;A1C558;
    dw EnemyHeaders_Sbug                                                 ;A1C566;
    dw $0261,$00CB,$0000,$2400,$0000,$8802,$0050                         ;A1C568;
    dw EnemyHeaders_Sbug                                                 ;A1C576;
    dw $03E9,$00B3,$0000,$2400,$0000,$D802,$0050                         ;A1C578;
    dw EnemyHeaders_Sbug                                                 ;A1C586;
    dw $03D9,$00C0,$0000,$2400,$0000,$D802,$0050                         ;A1C588;
    dw EnemyHeaders_Sbug                                                 ;A1C596;
    dw $03EB,$00C4,$0000,$2400,$0000,$D802,$0050                         ;A1C598;
    dw EnemyHeaders_Sbug                                                 ;A1C5A6;
    dw $03DE,$0051,$0000,$2400,$0000,$7D02,$0050                         ;A1C5A8;
    dw EnemyHeaders_Sbug                                                 ;A1C5B6;
    dw $03EF,$004C,$0000,$2400,$0000,$3C02,$0050                         ;A1C5B8;
    dw EnemyHeaders_Sbug                                                 ;A1C5C6;
    dw $036B,$004B,$0000,$2400,$0000,$7002,$0050                         ;A1C5C8;
    dw EnemyHeaders_Sbug                                                 ;A1C5D6;
    dw $0317,$00B0,$0000,$2400,$0000,$F802,$0050,$FFFF                   ;A1C5D8;
    db $00                                                               ;A1C5E8;

EnemyPopulations_AssemblyLine_1:
    dw EnemyHeaders_Spark                                                ;A1C5E9;
    dw $01D0,$005D,$0000,$2000,$0000,$0002,$0098                         ;A1C5EB;
    dw EnemyHeaders_Spark                                                ;A1C5F9;
    dw $0270,$005B,$0000,$2000,$0000,$0001,$0040                         ;A1C5FB;
    dw EnemyHeaders_Spark                                                ;A1C609;
    dw $0090,$0058,$0000,$2000,$0000,$0002,$00A0                         ;A1C60B;
    dw EnemyHeaders_Spark                                                ;A1C619;
    dw $00F0,$0058,$0000,$2000,$0000,$0001,$0030                         ;A1C61B;
    dw EnemyHeaders_Spark                                                ;A1C629;
    dw $012D,$0058,$0000,$2000,$0000,$0001,$0010                         ;A1C62B;
    dw EnemyHeaders_Spark                                                ;A1C639;
    dw $0190,$0058,$0000,$2000,$0000,$0002,$0080                         ;A1C63B;
    dw EnemyHeaders_Spark                                                ;A1C649;
    dw $0230,$0058,$0000,$2000,$0000,$0001,$0028                         ;A1C64B;
    dw EnemyHeaders_Spark                                                ;A1C659;
    dw $02D8,$0048,$0000,$2000,$0000,$0001,$0020                         ;A1C65B;
    dw EnemyHeaders_Robot                                                ;A1C669;
    dw $0250,$0080,$0000,$2800,$0000,$0000,$0000                         ;A1C66B;
    dw EnemyHeaders_Robot                                                ;A1C679;
    dw $0110,$0080,$0000,$2800,$0000,$0000,$0000                         ;A1C67B;
    dw EnemyHeaders_Robot                                                ;A1C689;
    dw $01B0,$0080,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A1C68B;
    db $03                                                               ;A1C69B;

EnemyPopulations_WreckedShipSave_1:
    dw $FFFF                                                             ;A1C69C;
    db $00                                                               ;A1C69E;

EnemyPopulations_WSWestSuper_1:
    dw EnemyHeaders_Spark                                                ;A1C69F;
    dw $009A,$003A,$0000,$2000,$0000,$0001,$0030                         ;A1C6A1;
    dw EnemyHeaders_Spark                                                ;A1C6AF;
    dw $0034,$003B,$0000,$2000,$0000,$0001,$0020                         ;A1C6B1;
    dw EnemyHeaders_Spark                                                ;A1C6BF;
    dw $0097,$00B8,$0000,$2000,$0000,$0001,$0028                         ;A1C6C1;
    dw EnemyHeaders_Spark                                                ;A1C6CF;
    dw $0067,$00C8,$0000,$2000,$0000,$0001,$0030                         ;A1C6D1;
    dw EnemyHeaders_Spark                                                ;A1C6DF;
    dw $00B2,$00C8,$0000,$2000,$0000,$0001,$0018,$FFFF                   ;A1C6E1;
    db $00                                                               ;A1C6F1;

EnemyPopulations_Attic_0:
    dw EnemyHeaders_Coven                                                ;A1C6F2;
    dw $02D7,$0098,$0000,$6800,$0000,$0000,$0000                         ;A1C6F4;
    dw EnemyHeaders_Sbug                                                 ;A1C702;
    dw $06A9,$00BA,$0000,$2400,$0000,$AA02,$0050                         ;A1C704;
    dw EnemyHeaders_Sbug                                                 ;A1C712;
    dw $06AF,$00BD,$0000,$2400,$0000,$D403,$0550                         ;A1C714;
    dw EnemyHeaders_Sbug                                                 ;A1C722;
    dw $06AD,$00C5,$0000,$2400,$0000,$D002,$0050                         ;A1C724;
    dw EnemyHeaders_Sbug                                                 ;A1C732;
    dw $06B9,$00B2,$0000,$2400,$0000,$F002,$0080                         ;A1C734;
    dw EnemyHeaders_Sbug                                                 ;A1C742;
    dw $0028,$00B9,$0000,$2400,$0000,$7403,$00A0                         ;A1C744;
    dw EnemyHeaders_Sbug                                                 ;A1C752;
    dw $0025,$00BE,$0000,$2400,$0000,$8803,$05A0                         ;A1C754;
    dw EnemyHeaders_Sbug                                                 ;A1C762;
    dw $001B,$00C6,$0000,$2400,$0000,$A002,$00A0                         ;A1C764;
    dw EnemyHeaders_Sbug                                                 ;A1C772;
    dw $0033,$0052,$0000,$2400,$0000,$7803,$0050                         ;A1C774;
    dw EnemyHeaders_Sbug                                                 ;A1C782;
    dw $0028,$0043,$0000,$2400,$0000,$5002,$0550                         ;A1C784;
    dw EnemyHeaders_Sbug                                                 ;A1C792;
    dw $040E,$00E6,$0000,$2400,$0000,$8203,$0050                         ;A1C794;
    dw EnemyHeaders_Sbug                                                 ;A1C7A2;
    dw $011E,$00EA,$0000,$2400,$0000,$8402,$0050                         ;A1C7A4;
    dw EnemyHeaders_Sbug                                                 ;A1C7B2;
    dw $0114,$00E6,$0000,$2400,$0000,$8203,$0050                         ;A1C7B4;
    dw EnemyHeaders_Sbug                                                 ;A1C7C2;
    dw $001A,$0049,$0000,$2400,$0000,$9803,$0580                         ;A1C7C4;
    dw EnemyHeaders_Sbug                                                 ;A1C7D2;
    dw $0431,$00E9,$0000,$2400,$0000,$B802,$0080                         ;A1C7D4;
    dw EnemyHeaders_Sbug                                                 ;A1C7E2;
    dw $043D,$00ED,$0000,$2400,$0000,$BA04,$0580                         ;A1C7E4;
    dw EnemyHeaders_Sbug                                                 ;A1C7F2;
    dw $05C3,$00E3,$0000,$2400,$0000,$C401,$0540                         ;A1C7F4;
    dw EnemyHeaders_Sbug                                                 ;A1C802;
    dw $05D2,$00D7,$0000,$2400,$0000,$B802,$0040                         ;A1C804;
    dw EnemyHeaders_Sbug                                                 ;A1C812;
    dw $01A7,$0094,$0000,$2400,$0000,$4003,$0540                         ;A1C814;
    dw EnemyHeaders_Sbug                                                 ;A1C822;
    dw $06D5,$00C5,$0000,$2400,$0000,$E002,$0080                         ;A1C824;
    dw EnemyHeaders_Atomic                                               ;A1C832;
    dw $00E0,$004E,$0000,$2000,$0000,$0000,$0000                         ;A1C834;
    dw EnemyHeaders_Atomic                                               ;A1C842;
    dw $02F0,$005E,$0000,$2000,$0000,$0000,$0000                         ;A1C844;
    dw EnemyHeaders_Atomic                                               ;A1C852;
    dw $0630,$006E,$0000,$2000,$0000,$0000,$0000                         ;A1C854;
    dw EnemyHeaders_Atomic                                               ;A1C862;
    dw $05D0,$00BE,$0000,$2000,$0000,$0000,$0000                         ;A1C864;
    dw EnemyHeaders_Atomic                                               ;A1C872;
    dw $0290,$00BE,$0000,$2000,$0000,$0000,$0000                         ;A1C874;
    dw EnemyHeaders_Atomic                                               ;A1C882;
    dw $0130,$00BE,$0000,$2000,$0000,$0000,$0000                         ;A1C884;
    dw EnemyHeaders_Atomic                                               ;A1C892;
    dw $0370,$00DE,$0000,$2000,$0000,$0000,$0000                         ;A1C894;
    dw EnemyHeaders_Atomic                                               ;A1C8A2;
    dw $04D0,$007E,$0000,$2000,$0000,$0000,$0000                         ;A1C8A4;
    dw EnemyHeaders_Atomic                                               ;A1C8B2;
    dw $0430,$007E,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1C8B4;
    db $0A                                                               ;A1C8C4;

EnemyPopulations_WSEastSuper_0:
    dw EnemyHeaders_Coven                                                ;A1C8C5;
    dw $0088,$0088,$0000,$6800,$0000,$0000,$0000                         ;A1C8C7;
    dw EnemyHeaders_Sbug                                                 ;A1C8D5;
    dw $034F,$009A,$0000,$2400,$0000,$C203,$0080                         ;A1C8D7;
    dw EnemyHeaders_Sbug                                                 ;A1C8E5;
    dw $00FF,$00E9,$0000,$2400,$0000,$FC04,$0080                         ;A1C8E7;
    dw EnemyHeaders_Sbug                                                 ;A1C8F5;
    dw $0354,$00A6,$0000,$2400,$0000,$DE02,$0080                         ;A1C8F7;
    dw EnemyHeaders_Sbug                                                 ;A1C905;
    dw $0354,$00A4,$0000,$2400,$0000,$C402,$0080                         ;A1C907;
    dw EnemyHeaders_Sbug                                                 ;A1C915;
    dw $0347,$00A6,$0000,$2400,$0000,$D802,$0080                         ;A1C917;
    dw EnemyHeaders_Sbug                                                 ;A1C925;
    dw $0175,$00D1,$0000,$2400,$0000,$8802,$0080                         ;A1C927;
    dw EnemyHeaders_Sbug                                                 ;A1C935;
    dw $0051,$00AD,$0000,$2400,$0000,$8C03,$0080                         ;A1C937;
    dw EnemyHeaders_Sbug                                                 ;A1C945;
    dw $0048,$00C8,$0000,$2400,$0000,$7002,$0080                         ;A1C947;
    dw EnemyHeaders_Sbug                                                 ;A1C955;
    dw $02DE,$0099,$0000,$2400,$0000,$3003,$0080                         ;A1C957;
    dw EnemyHeaders_Sbug                                                 ;A1C965;
    dw $02CB,$008F,$0000,$2400,$0000,$B802,$0080                         ;A1C967;
    dw EnemyHeaders_Sbug                                                 ;A1C975;
    dw $002D,$00B9,$0000,$2400,$0000,$9803,$0080                         ;A1C977;
    dw EnemyHeaders_Sbug                                                 ;A1C985;
    dw $0030,$00BF,$0000,$2400,$0000,$9202,$0080                         ;A1C987;
    dw EnemyHeaders_Sbug                                                 ;A1C995;
    dw $02C9,$008A,$0000,$2400,$0000,$B802,$0080                         ;A1C997;
    dw EnemyHeaders_Sbug                                                 ;A1C9A5;
    dw $02E3,$0073,$0000,$2400,$0000,$A804,$0080                         ;A1C9A7;
    dw EnemyHeaders_Sbug                                                 ;A1C9B5;
    dw $02E7,$00AA,$0000,$2400,$0000,$E002,$0080                         ;A1C9B7;
    dw EnemyHeaders_Sbug                                                 ;A1C9C5;
    dw $03F3,$00AF,$0000,$2400,$0000,$D004,$0080                         ;A1C9C7;
    dw EnemyHeaders_Sbug                                                 ;A1C9D5;
    dw $03EF,$00B3,$0000,$2400,$0000,$C802,$0080                         ;A1C9D7;
    dw EnemyHeaders_Sbug                                                 ;A1C9E5;
    dw $03EA,$00CB,$0000,$2400,$0000,$D002,$0080                         ;A1C9E7;
    dw EnemyHeaders_Sbug                                                 ;A1C9F5;
    dw $0184,$00D8,$0000,$2400,$0000,$C802,$0080                         ;A1C9F7;
    dw EnemyHeaders_Sbug                                                 ;A1CA05;
    dw $00F0,$00E5,$0000,$2400,$0000,$8202,$0080                         ;A1CA07;
    dw EnemyHeaders_RobotNoPower                                         ;A1CA15;
    dw $0178,$0090,$0000,$A800,$0000,$0000,$0000                         ;A1CA17;
    dw EnemyHeaders_RobotNoPower                                         ;A1CA25;
    dw $02C4,$0090,$0000,$A800,$0000,$0002,$0000                         ;A1CA27;
    dw EnemyHeaders_Atomic                                               ;A1CA35;
    dw $00A0,$0050,$0000,$2000,$0000,$0000,$0000                         ;A1CA37;
    dw EnemyHeaders_Atomic                                               ;A1CA45;
    dw $0120,$0050,$0000,$2000,$0000,$0001,$0000                         ;A1CA47;
    dw EnemyHeaders_Atomic                                               ;A1CA55;
    dw $01D0,$0050,$0000,$2000,$0000,$0002,$0000                         ;A1CA57;
    dw EnemyHeaders_Atomic                                               ;A1CA65;
    dw $0250,$0050,$0000,$2000,$0000,$0003,$0000,$FFFF                   ;A1CA67;
    db $07                                                               ;A1CA77;

EnemyPopulations_WreckedShipSave_0:
    dw EnemyHeaders_Coven                                                ;A1CA78;
    dw $0088,$0088,$0000,$6800,$0000,$0000,$0000                         ;A1CA7A;
    dw EnemyHeaders_Sbug                                                 ;A1CA88;
    dw $0083,$00BA,$0000,$2400,$0000,$B002,$0030                         ;A1CA8A;
    dw EnemyHeaders_Sbug                                                 ;A1CA98;
    dw $007B,$00B5,$0000,$2400,$0000,$CA02,$0030                         ;A1CA9A;
    dw EnemyHeaders_Sbug                                                 ;A1CAA8;
    dw $008E,$00C0,$0000,$2400,$0000,$FA02,$0030                         ;A1CAAA;
    dw EnemyHeaders_Sbug                                                 ;A1CAB8;
    dw $0074,$00C4,$0000,$2400,$0000,$8302,$0030                         ;A1CABA;
    dw EnemyHeaders_Sbug                                                 ;A1CAC8;
    dw $00B9,$002E,$0000,$2400,$0000,$7B02,$0050                         ;A1CACA;
    dw EnemyHeaders_Sbug                                                 ;A1CAD8;
    dw $00C1,$0035,$0000,$2400,$0000,$E002,$0050                         ;A1CADA;
    dw EnemyHeaders_Sbug                                                 ;A1CAE8;
    dw $00BA,$0036,$0000,$2400,$0000,$F802,$0050                         ;A1CAEA;
    dw EnemyHeaders_Sbug                                                 ;A1CAF8;
    dw $00CB,$0040,$0000,$2400,$0000,$1802,$0050                         ;A1CAFA;
    dw EnemyHeaders_Sbug                                                 ;A1CB08;
    dw $00C5,$0046,$0000,$2400,$0000,$FD02,$0050                         ;A1CB0A;
    dw EnemyHeaders_Sbug                                                 ;A1CB18;
    dw $0033,$00AB,$0000,$2400,$0000,$8802,$0130                         ;A1CB1A;
    dw EnemyHeaders_Sbug                                                 ;A1CB28;
    dw $0038,$00AC,$0000,$2400,$0000,$9002,$0030,$FFFF                   ;A1CB2A;
    db $01                                                               ;A1CB3A;

EnemyPopulations_ElectricDeath_1:
    dw EnemyHeaders_Spark                                                ;A1CB3B;
    dw $0068,$0258,$0000,$2000,$0000,$0002,$0080                         ;A1CB3D;
    dw EnemyHeaders_Spark                                                ;A1CB4B;
    dw $002A,$0227,$0000,$2000,$0000,$0001,$0080                         ;A1CB4D;
    dw EnemyHeaders_Spark                                                ;A1CB5B;
    dw $00C8,$01DD,$0000,$2000,$0000,$0001,$0010                         ;A1CB5D;
    dw EnemyHeaders_Spark                                                ;A1CB6B;
    dw $0086,$018A,$0000,$2000,$0000,$0002,$0090                         ;A1CB6D;
    dw EnemyHeaders_Spark                                                ;A1CB7B;
    dw $004F,$0033,$0000,$2000,$0000,$0002,$0090                         ;A1CB7D;
    dw EnemyHeaders_Spark                                                ;A1CB8B;
    dw $0035,$00DA,$0000,$2000,$0000,$0001,$0010                         ;A1CB8D;
    dw EnemyHeaders_Spark                                                ;A1CB9B;
    dw $005C,$0098,$0000,$2000,$0000,$0002,$00A0,$FFFF                   ;A1CB9D;
    db $00                                                               ;A1CBAD;

EnemyPopulations_SpikyDeath_1:
    dw EnemyHeaders_KzanTop                                              ;A1CBAE;
    dw $0050,$0060,$0000,$A800,$0000,$0040,$6810                         ;A1CBB0;
    dw EnemyHeaders_KzanBottom                                           ;A1CBBE;
    dw $0050,$0068,$0000,$0100,$0000,$0000,$0000                         ;A1CBC0;
    dw EnemyHeaders_KzanTop                                              ;A1CBCE;
    dw $00A0,$0060,$0000,$A000,$0000,$0040,$680C                         ;A1CBD0;
    dw EnemyHeaders_KzanBottom                                           ;A1CBDE;
    dw $00A0,$0068,$0000,$0100,$0000,$0000,$0000                         ;A1CBE0;
    dw EnemyHeaders_KzanTop                                              ;A1CBEE;
    dw $0100,$0060,$0000,$A800,$0000,$0040,$6811                         ;A1CBF0;
    dw EnemyHeaders_KzanBottom                                           ;A1CBFE;
    dw $0100,$0068,$0000,$0100,$0000,$0000,$0000                         ;A1CC00;
    dw EnemyHeaders_KzanTop                                              ;A1CC0E;
    dw $0160,$0060,$0000,$A000,$0000,$0040,$680A                         ;A1CC10;
    dw EnemyHeaders_KzanBottom                                           ;A1CC1E;
    dw $0160,$0068,$0000,$0100,$0000,$0000,$0000                         ;A1CC20;
    dw EnemyHeaders_KzanTop                                              ;A1CC2E;
    dw $01B0,$0060,$0000,$A800,$0000,$0040,$6814                         ;A1CC30;
    dw EnemyHeaders_KzanBottom                                           ;A1CC3E;
    dw $01B0,$0068,$0000,$0100,$0000,$0000,$0000,$FFFF                   ;A1CC40;
    db $00                                                               ;A1CC50;

EnemyPopulations_WSEastSuper_1:
    dw EnemyHeaders_Robot                                                ;A1CC51;
    dw $0178,$0080,$0000,$2800,$0000,$0000,$0000                         ;A1CC53;
    dw EnemyHeaders_Robot                                                ;A1CC61;
    dw $02C0,$0080,$0000,$2800,$0000,$0000,$0000                         ;A1CC63;
    dw EnemyHeaders_Bull                                                 ;A1CC71;
    dw $00E0,$0078,$0000,$2800,$0000,$0003,$0003                         ;A1CC73;
    dw EnemyHeaders_Bull                                                 ;A1CC81;
    dw $0210,$0075,$0000,$2800,$0000,$0003,$0003                         ;A1CC83;
    dw EnemyHeaders_Spark                                                ;A1CC91;
    dw $00A0,$0050,$0000,$2000,$0000,$0001,$0080                         ;A1CC93;
    dw EnemyHeaders_Spark                                                ;A1CCA1;
    dw $0120,$0050,$0000,$2000,$0000,$0001,$0010                         ;A1CCA3;
    dw EnemyHeaders_Spark                                                ;A1CCB1;
    dw $01D0,$0050,$0000,$2000,$0000,$0001,$00A0                         ;A1CCB3;
    dw EnemyHeaders_Spark                                                ;A1CCC1;
    dw $0250,$0050,$0000,$2000,$0000,$0001,$0080,$FFFF                   ;A1CCC3;
    db $04                                                               ;A1CCD3;

EnemyPopulations_Phantoon_0:
    dw EnemyHeaders_PhantoonBody                                         ;A1CCD4;
    dw $0080,$0060,$0000,$2800,$0004,$0000,$0000                         ;A1CCD6;
    dw EnemyHeaders_PhantoonEye                                          ;A1CCE4;
    dw $0080,$0060,$0000,$2C00,$0004,$0000,$0001                         ;A1CCE6;
    dw EnemyHeaders_PhantoonTentacles                                    ;A1CCF4;
    dw $0080,$0060,$0000,$2C00,$0004,$0000,$0002                         ;A1CCF6;
    dw EnemyHeaders_PhantoonMouth                                        ;A1CD04;
    dw $0080,$0060,$0000,$2C00,$0004,$0000,$0003,$FFFF                   ;A1CD06;
    db $00                                                               ;A1CD16;

EnemyPopulations_WreckedShipMainShaft_1:
    dw EnemyHeaders_Spark                                                ;A1CD17;
    dw $0498,$02A8,$0000,$2000,$0000,$0001,$0030                         ;A1CD19;
    dw EnemyHeaders_Spark                                                ;A1CD27;
    dw $0470,$0359,$0000,$2000,$0000,$0001,$0028                         ;A1CD29;
    dw EnemyHeaders_Spark                                                ;A1CD37;
    dw $0420,$048C,$0000,$2000,$0000,$0001,$0020                         ;A1CD39;
    dw EnemyHeaders_Spark                                                ;A1CD47;
    dw $04C8,$0508,$0000,$2000,$0000,$0001,$0020                         ;A1CD49;
    dw EnemyHeaders_Spark                                                ;A1CD57;
    dw $0488,$05BC,$0000,$2000,$0000,$0001,$0018                         ;A1CD59;
    dw EnemyHeaders_Spark                                                ;A1CD67;
    dw $0469,$071A,$0000,$2000,$0000,$0000,$0000                         ;A1CD69;
    dw EnemyHeaders_Spark                                                ;A1CD77;
    dw $0418,$0788,$0000,$2000,$0000,$0002,$0030                         ;A1CD79;
    dw EnemyHeaders_Atomic                                               ;A1CD87;
    dw $0478,$0252,$0000,$2000,$0000,$0000,$0008                         ;A1CD89;
    dw EnemyHeaders_Atomic                                               ;A1CD97;
    dw $04D5,$02AB,$0000,$2000,$0000,$0001,$0008                         ;A1CD99;
    dw EnemyHeaders_Atomic                                               ;A1CDA7;
    dw $04C0,$0507,$0000,$2000,$0000,$0002,$0008                         ;A1CDA9;
    dw EnemyHeaders_Atomic                                               ;A1CDB7;
    dw $0426,$05B9,$0000,$2000,$0000,$0002,$0008                         ;A1CDB9;
    dw EnemyHeaders_KzanTop                                              ;A1CDC7;
    dw $0260,$0558,$0000,$A000,$0000,$0020,$5030                         ;A1CDC9;
    dw EnemyHeaders_KzanBottom                                           ;A1CDD7;
    dw $0260,$0560,$0000,$0100,$0000,$0000,$0000                         ;A1CDD9;
    dw EnemyHeaders_KzanTop                                              ;A1CDE7;
    dw $01C0,$0558,$0000,$A000,$0000,$0020,$5030                         ;A1CDE9;
    dw EnemyHeaders_KzanBottom                                           ;A1CDF7;
    dw $01C0,$0560,$0000,$0100,$0000,$0000,$0000                         ;A1CDF9;
    dw EnemyHeaders_KzanTop                                              ;A1CE07;
    dw $0120,$0558,$0000,$A000,$0000,$0020,$5030                         ;A1CE09;
    dw EnemyHeaders_KzanBottom                                           ;A1CE17;
    dw $0120,$0560,$0000,$0100,$0000,$0000,$0000                         ;A1CE19;
    dw EnemyHeaders_KzanTop                                              ;A1CE27;
    dw $0080,$0558,$0000,$A000,$0000,$0020,$5030                         ;A1CE29;
    dw EnemyHeaders_KzanBottom                                           ;A1CE37;
    dw $0080,$0560,$0000,$0100,$0000,$0000,$0000                         ;A1CE39;
    dw EnemyHeaders_Spark                                                ;A1CE47;
    dw $04D0,$07C8,$0000,$2000,$0000,$0001,$0030                         ;A1CE49;
    dw EnemyHeaders_Spark                                                ;A1CE57;
    dw $0430,$07C8,$0000,$2000,$0000,$0001,$0020,$FFFF                   ;A1CE59;
    db $04                                                               ;A1CE69;

EnemyPopulations_MtEverest:
    dw EnemyHeaders_Powamp                                               ;A1CE6A;
    dw $0200,$0180,$0000,$2C00,$0000,$0001,$0070                         ;A1CE6C;
    dw EnemyHeaders_Powamp                                               ;A1CE7A;
    dw $0200,$0180,$0000,$2800,$0000,$0000,$0000                         ;A1CE7C;
    dw EnemyHeaders_Powamp                                               ;A1CE8A;
    dw $0308,$0200,$0000,$2C00,$0000,$0001,$0120                         ;A1CE8C;
    dw EnemyHeaders_Powamp                                               ;A1CE9A;
    dw $0308,$0200,$0000,$2800,$0000,$0000,$0000                         ;A1CE9C;
    dw EnemyHeaders_Powamp                                               ;A1CEAA;
    dw $0400,$0230,$0000,$2C00,$0000,$0001,$0030                         ;A1CEAC;
    dw EnemyHeaders_Powamp                                               ;A1CEBA;
    dw $0400,$0230,$0000,$2800,$0000,$0000,$0000                         ;A1CEBC;
    dw EnemyHeaders_Sciser                                               ;A1CECA;
    dw $02F0,$0387,$0002,$2000,$0000,$0001,$0000                         ;A1CECC;
    dw EnemyHeaders_Sciser                                               ;A1CEDA;
    dw $0228,$3B60,$0002,$2000,$0000,$0004,$0000                         ;A1CEDC;
    dw EnemyHeaders_Sciser                                               ;A1CEEA;
    dw $0168,$0240,$0000,$2000,$0000,$0002,$0000                         ;A1CEEC;
    dw EnemyHeaders_Sciser                                               ;A1CEFA;
    dw $03C0,$03B8,$0003,$2001,$0000,$0002,$0000                         ;A1CEFC;
    dw EnemyHeaders_Sciser                                               ;A1CF0A;
    dw $0268,$02A0,$0000,$2000,$0000,$0004,$0000                         ;A1CF0C;
    dw EnemyHeaders_Sciser                                               ;A1CF1A;
    dw $0499,$0358,$0001,$2000,$0000,$0002,$0000,$FFFF                   ;A1CF1C;
    db $09                                                               ;A1CF2C;

EnemyPopulations_HalfieClimb:
    dw EnemyHeaders_Oum                                                  ;A1CF2D;
    dw $0250,$0260,$0000,$A800,$0004,$0000,$0000                         ;A1CF2F;
    dw EnemyHeaders_Oum                                                  ;A1CF3D;
    dw $02D0,$0260,$0000,$A800,$0004,$0000,$0000                         ;A1CF3F;
    dw EnemyHeaders_Oum                                                  ;A1CF4D;
    dw $0370,$0260,$0000,$A800,$0004,$0000,$0000                         ;A1CF4F;
    dw EnemyHeaders_Mochtroid                                            ;A1CF5D;
    dw $00A0,$0238,$0000,$2000,$0000,$0000,$0000                         ;A1CF5F;
    dw EnemyHeaders_Mochtroid                                            ;A1CF6D;
    dw $0050,$0190,$0000,$2000,$0000,$0000,$0000                         ;A1CF6F;
    dw EnemyHeaders_Mochtroid                                            ;A1CF7D;
    dw $0060,$0080,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1CF7F;
    db $06                                                               ;A1CF8F;

EnemyPopulations_WateringHole:
    dw EnemyHeaders_Choot                                                ;A1CF90;
    dw $0078,$01E0,$0000,$2000,$0000,$0005,$0008                         ;A1CF92;
    dw EnemyHeaders_Zeb                                                  ;A1CFA0;
    dw $0110,$00CC,$0000,$6900,$0000,$0000,$0000                         ;A1CFA2;
    dw EnemyHeaders_Zeb                                                  ;A1CFB0;
    dw $0190,$00CC,$0000,$6900,$0000,$0000,$0000,$FFFF                   ;A1CFB2;
    db $03                                                               ;A1CFC2;

EnemyPopulations_CrabShaft:
    dw EnemyHeaders_Sciser                                               ;A1CFC3;
    dw $0170,$0367,$0002,$2801,$0000,$0003,$0000                         ;A1CFC5;
    dw EnemyHeaders_Sciser                                               ;A1CFD3;
    dw $0030,$03B8,$0003,$2000,$0000,$0001,$0000                         ;A1CFD5;
    dw EnemyHeaders_Sciser                                               ;A1CFE3;
    dw $00E0,$0367,$0002,$2000,$0000,$0001,$0000                         ;A1CFE5;
    dw EnemyHeaders_Sciser                                               ;A1CFF3;
    dw $0080,$00B8,$0003,$2800,$0000,$0004,$0000,$FFFF                   ;A1CFF5;
    db $04                                                               ;A1D005;

EnemyPopulations_MaridiaElev:
    dw EnemyHeaders_Elevator                                             ;A1D006;
    dw $0080,$02C0,$0000,$2C00,$0000,$0001,$0018                         ;A1D008;
    dw EnemyHeaders_Ripper                                               ;A1D016;
    dw $00D0,$0314,$0000,$2000,$0000,$0010,$0000                         ;A1D018;
    dw EnemyHeaders_Ripper                                               ;A1D026;
    dw $0070,$0384,$0000,$2000,$0000,$0010,$0001                         ;A1D028;
    dw EnemyHeaders_Ripper                                               ;A1D036;
    dw $0080,$03F4,$0000,$2000,$0000,$0010,$0000                         ;A1D038;
    dw EnemyHeaders_Ripper                                               ;A1D046;
    dw $0090,$0454,$0000,$2000,$0000,$0010,$0000                         ;A1D048;
    dw EnemyHeaders_Ripper                                               ;A1D056;
    dw $0040,$04C8,$0000,$2000,$0000,$0010,$0000                         ;A1D058;
    dw EnemyHeaders_Ripper                                               ;A1D066;
    dw $0038,$02D0,$0000,$2000,$0000,$0010,$0000                         ;A1D068;
    dw EnemyHeaders_Owtch                                                ;A1D076;
    dw $0098,$05C8,$0000,$2000,$0000,$0300,$0104,$FFFF                   ;A1D078;
    db $07                                                               ;A1D088;

EnemyPopulations_Colosseum:
    dw EnemyHeaders_Mochtroid                                            ;A1D089;
    dw $0080,$0078,$0000,$2000,$0000,$0000,$0000                         ;A1D08B;
    dw EnemyHeaders_Mochtroid                                            ;A1D099;
    dw $0290,$0068,$0000,$2000,$0000,$0000,$0000                         ;A1D09B;
    dw EnemyHeaders_Mochtroid                                            ;A1D0A9;
    dw $0450,$00B0,$0000,$2000,$0000,$0000,$0000                         ;A1D0AB;
    dw EnemyHeaders_Mochtroid                                            ;A1D0B9;
    dw $0490,$0060,$0000,$2000,$0000,$0000,$0000                         ;A1D0BB;
    dw EnemyHeaders_Mochtroid                                            ;A1D0C9;
    dw $0660,$0088,$0000,$2000,$0000,$0000,$0000                         ;A1D0CB;
    dw EnemyHeaders_Mochtroid                                            ;A1D0D9;
    dw $00A8,$01A0,$0000,$2000,$0000,$0000,$0000                         ;A1D0DB;
    dw EnemyHeaders_Mochtroid                                            ;A1D0E9;
    dw $0168,$0158,$0000,$2000,$0000,$0000,$0000                         ;A1D0EB;
    dw EnemyHeaders_Mochtroid                                            ;A1D0F9;
    dw $0630,$01A0,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1D0FB;
    db $08                                                               ;A1D10B;

EnemyPopulations_AqueductSave:
    dw $FFFF                                                             ;A1D10C;
    db $00                                                               ;A1D10E;

EnemyPopulations_ThePrecious:
    dw $FFFF                                                             ;A1D10F;
    db $00                                                               ;A1D111;

EnemyPopulations_BotwoonETank:
    dw EnemyHeaders_Puyo                                                 ;A1D112;
    dw $0120,$0080,$0000,$2000,$0000,$0000,$0016                         ;A1D114;
    dw EnemyHeaders_Puyo                                                 ;A1D122;
    dw $0190,$0070,$0000,$2000,$0000,$0000,$0016                         ;A1D124;
    dw EnemyHeaders_Puyo                                                 ;A1D132;
    dw $01F0,$0080,$0000,$2000,$0000,$0000,$0016                         ;A1D134;
    dw EnemyHeaders_Puyo                                                 ;A1D142;
    dw $0250,$0080,$0000,$2000,$0000,$0000,$0016                         ;A1D144;
    dw EnemyHeaders_Puyo                                                 ;A1D152;
    dw $03F0,$00AC,$0000,$2000,$0000,$0010,$0016                         ;A1D154;
    dw EnemyHeaders_Zoa                                                  ;A1D162;
    dw $0560,$00D8,$0000,$6100,$0000,$0000,$0000                         ;A1D164;
    dw EnemyHeaders_Zoa                                                  ;A1D172;
    dw $0560,$00E0,$0000,$6100,$0000,$0000,$0000                         ;A1D174;
    dw EnemyHeaders_Zoa                                                  ;A1D182;
    dw $0560,$00E8,$0000,$6100,$0000,$0000,$0000                         ;A1D184;
    dw EnemyHeaders_Zoa                                                  ;A1D192;
    dw $0560,$00F0,$0000,$6100,$0000,$0000,$0000                         ;A1D194;
    dw EnemyHeaders_Zoa                                                  ;A1D1A2;
    dw $0560,$00F8,$0000,$6100,$0000,$0000,$0000,$FFFF                   ;A1D1A4;
    db $0A                                                               ;A1D1B4;

EnemyPopulations_DraygonSave:
    dw $FFFF                                                             ;A1D1B5;
    db $00                                                               ;A1D1B7;

EnemyPopulations_MaridiaMissileRefill:
    dw $FFFF                                                             ;A1D1B8;
    db $00                                                               ;A1D1BA;

EnemyPopulations_PlasmaBeachQuicksand:
    dw EnemyHeaders_Bull                                                 ;A1D1BB;
    dw $0020,$0038,$0000,$2800,$0000,$0001,$0000                         ;A1D1BD;
    dw EnemyHeaders_Bull                                                 ;A1D1CB;
    dw $00E0,$0078,$0000,$2800,$0000,$0001,$0001                         ;A1D1CD;
    dw EnemyHeaders_Bull                                                 ;A1D1DB;
    dw $0058,$00C8,$0000,$2800,$0000,$0005,$0007,$FFFF                   ;A1D1DD;
    db $03                                                               ;A1D1ED;

EnemyPopulations_BotwoonQuicksand:
    dw EnemyHeaders_Bull                                                 ;A1D1EE;
    dw $0048,$0020,$0000,$2800,$0000,$0001,$0001                         ;A1D1F0;
    dw EnemyHeaders_Bull                                                 ;A1D1FE;
    dw $0048,$0068,$0000,$2800,$0000,$0003,$0002                         ;A1D200;
    dw EnemyHeaders_Bull                                                 ;A1D20E;
    dw $00F0,$0090,$0000,$2800,$0000,$0005,$0006                         ;A1D210;
    dw EnemyHeaders_Bull                                                 ;A1D21E;
    dw $0048,$00D0,$0000,$2800,$0000,$0001,$0007                         ;A1D220;
    dw EnemyHeaders_Bull                                                 ;A1D22E;
    dw $0100,$0038,$0000,$2800,$0000,$0002,$0002                         ;A1D230;
    dw EnemyHeaders_Bull                                                 ;A1D23E;
    dw $01B8,$0028,$0000,$2800,$0000,$0001,$0001                         ;A1D240;
    dw EnemyHeaders_Bull                                                 ;A1D24E;
    dw $01C8,$0068,$0000,$2800,$0000,$0003,$0002                         ;A1D250;
    dw EnemyHeaders_Bull                                                 ;A1D25E;
    dw $01E0,$00C0,$0000,$2800,$0000,$0001,$0007                         ;A1D260;
    dw EnemyHeaders_Bull                                                 ;A1D26E;
    dw $0100,$00E0,$0000,$2800,$0000,$0002,$0007,$FFFF                   ;A1D270;
    db $09                                                               ;A1D280;

EnemyPopulations_Shaktool:
    dw EnemyHeaders_Shaktool                                             ;A1D281;
    dw $00A8,$00B8,$0000,$2000,$0000,$0000,$0000                         ;A1D283;
    dw EnemyHeaders_Shaktool                                             ;A1D291;
    dw $00A8,$00B8,$0000,$2000,$0000,$0000,$0002                         ;A1D293;
    dw EnemyHeaders_Shaktool                                             ;A1D2A1;
    dw $00A8,$00B8,$0000,$2000,$0000,$0000,$0004                         ;A1D2A3;
    dw EnemyHeaders_Shaktool                                             ;A1D2B1;
    dw $00A8,$00B8,$0000,$2000,$0000,$0000,$0006                         ;A1D2B3;
    dw EnemyHeaders_Shaktool                                             ;A1D2C1;
    dw $00A8,$00B8,$0000,$2000,$0000,$0000,$0008                         ;A1D2C3;
    dw EnemyHeaders_Shaktool                                             ;A1D2D1;
    dw $00A8,$00B8,$0000,$2000,$0000,$0000,$000A                         ;A1D2D3;
    dw EnemyHeaders_Shaktool                                             ;A1D2E1;
    dw $00A8,$00B8,$0000,$2000,$0000,$0000,$000C                         ;A1D2E3;
    dw EnemyHeaders_Yard                                                 ;A1D2F1;
    dw $0398,$00B8,$0006,$A000,$0000,$0001,$0000                         ;A1D2F3;
    dw EnemyHeaders_Yard                                                 ;A1D301;
    dw $03D8,$0050,$0002,$A000,$0000,$0001,$0000,$FFFF                   ;A1D303;
    db $03                                                               ;A1D313;

EnemyPopulations_Draygon_0:
    dw EnemyHeaders_DraygonBody                                          ;A1D314;
    dw $FFB0,$FFB0,$0000,$2800,$0004,$0000,$0000                         ;A1D316;
    dw EnemyHeaders_DraygonEye                                           ;A1D324;
    dw $FFB0,$FFB0,$0000,$2C00,$0004,$0000,$0000                         ;A1D326;
    dw EnemyHeaders_DraygonTail                                          ;A1D334;
    dw $FFB0,$FFB0,$0000,$2C00,$0004,$0000,$0000                         ;A1D336;
    dw EnemyHeaders_DraygonArms                                          ;A1D344;
    dw $FFB0,$FFB0,$0000,$2C00,$0004,$0000,$0000,$FFFF                   ;A1D346;
    db $00                                                               ;A1D356;

EnemyPopulations_Aqueduct:
    dw EnemyHeaders_Yard                                                 ;A1D357;
    dw $0544,$01D8,$0007,$A800,$0000,$0004,$0000                         ;A1D359;
    dw EnemyHeaders_Yard                                                 ;A1D367;
    dw $0220,$0294,$0006,$A800,$0000,$0003,$0000                         ;A1D369;
    dw EnemyHeaders_Yard                                                 ;A1D377;
    dw $0420,$0264,$0004,$A800,$0000,$0005,$0000                         ;A1D379;
    dw EnemyHeaders_Yard                                                 ;A1D387;
    dw $01D8,$0130,$0003,$A800,$0000,$0007,$0000                         ;A1D389;
    dw EnemyHeaders_Yard                                                 ;A1D397;
    dw $0550,$02B8,$0004,$A000,$0000,$0002,$0000,$FFFF                   ;A1D399;
    db $05                                                               ;A1D3A9;

EnemyPopulations_RedFish:
    dw EnemyHeaders_Skultera                                             ;A1D3AA;
    dw $02C0,$01B0,$0000,$2000,$0000,$0008,$1001                         ;A1D3AC;
    dw EnemyHeaders_Zebbo                                                ;A1D3BA;
    dw $0088,$00CC,$0000,$6900,$0000,$0002,$0000                         ;A1D3BC;
    dw EnemyHeaders_Zebbo                                                ;A1D3CA;
    dw $0088,$00D4,$0000,$6900,$0000,$0002,$0000                         ;A1D3CC;
    dw EnemyHeaders_Zebbo                                                ;A1D3DA;
    dw $0088,$00DC,$0000,$6900,$0000,$0002,$0000,$FFFF                   ;A1D3DC;
    db $04                                                               ;A1D3EC;

EnemyPopulations_Plasma:
    dw EnemyHeaders_PirateMagentaWalking                                 ;A1D3ED;
    dw $0100,$0080,$0000,$2000,$0004,$8001,$0020                         ;A1D3EF;
    dw EnemyHeaders_PirateMagentaWalking                                 ;A1D3FD;
    dw $0080,$01D0,$0000,$2000,$0004,$8000,$0030                         ;A1D3FF;
    dw EnemyHeaders_PirateMagentaWalking                                 ;A1D40D;
    dw $01B0,$01D0,$0000,$2000,$0004,$8001,$0030                         ;A1D40F;
    dw EnemyHeaders_PirateMagentaWall                                    ;A1D41D;
    dw $0030,$0180,$0000,$2000,$0004,$0000,$01A0                         ;A1D41F;
    dw EnemyHeaders_PirateMagentaWall                                    ;A1D42D;
    dw $01D0,$0130,$0000,$2000,$0004,$0001,$01A0                         ;A1D42F;
    dw EnemyHeaders_PirateMagentaWalking                                 ;A1D43D;
    dw $0078,$0280,$0000,$2000,$0004,$8001,$0080,$FFFF                   ;A1D43F;
    db $06                                                               ;A1D44F;

EnemyPopulations_SpaceJump:
    dw $FFFF                                                             ;A1D450;
    db $00                                                               ;A1D452;

EnemyPopulations_Pants:
    dw EnemyHeaders_Menu                                                 ;A1D453;
    dw $0050,$0050,$0000,$2000,$0000,$0000,$0000                         ;A1D455;
    dw EnemyHeaders_Menu                                                 ;A1D463;
    dw $0030,$0078,$0000,$2000,$0000,$0000,$0000                         ;A1D465;
    dw EnemyHeaders_Menu                                                 ;A1D473;
    dw $00B8,$0050,$0000,$2000,$0000,$0000,$0000                         ;A1D475;
    dw EnemyHeaders_Puyo                                                 ;A1D483;
    dw $0170,$029C,$0000,$2000,$0000,$0080,$0016                         ;A1D485;
    dw EnemyHeaders_Puyo                                                 ;A1D493;
    dw $0160,$01FC,$0000,$2000,$0000,$0080,$0016                         ;A1D495;
    dw EnemyHeaders_Menu                                                 ;A1D4A3;
    dw $0170,$0078,$0000,$2000,$0000,$0000,$0000                         ;A1D4A5;
    dw EnemyHeaders_Menu                                                 ;A1D4B3;
    dw $0198,$0070,$0000,$2000,$0000,$0000,$0000                         ;A1D4B5;
    dw EnemyHeaders_Menu                                                 ;A1D4C3;
    dw $0090,$0070,$0000,$2000,$0000,$0000,$0000                         ;A1D4C5;
    dw EnemyHeaders_Puyo                                                 ;A1D4D3;
    dw $01C0,$02DC,$0000,$2000,$0000,$0020,$0016                         ;A1D4D5;
    dw EnemyHeaders_Puyo                                                 ;A1D4E3;
    dw $0180,$032C,$0000,$2000,$0000,$0030,$0016                         ;A1D4E5;
    dw EnemyHeaders_Puyo                                                 ;A1D4F3;
    dw $01A0,$019C,$0000,$2000,$0000,$0040,$0016                         ;A1D4F5;
    dw EnemyHeaders_Puyo                                                 ;A1D503;
    dw $0150,$03F0,$0000,$2000,$0000,$0010,$0008                         ;A1D505;
    dw EnemyHeaders_Puyo                                                 ;A1D513;
    dw $01B0,$03F0,$0000,$2000,$0000,$0008,$0008,$FFFF                   ;A1D515;
    db $07                                                               ;A1D525;

EnemyPopulations_GlassTunnelSave:
    dw $FFFF                                                             ;A1D526;
    db $00                                                               ;A1D528;

EnemyPopulations_GlassTunnel:
    dw EnemyHeaders_NoobTubeCrack                                        ;A1D529;
    dw $0080,$0100,$0000,$2200,$0000,$0000,$0000,$FFFF                   ;A1D52B;
    db $00                                                               ;A1D53B;

EnemyPopulations_WestTunnel:
    dw $FFFF                                                             ;A1D53C;
    db $00                                                               ;A1D53E;

EnemyPopulations_EastTunnel:
    dw EnemyHeaders_Boyon                                                ;A1D53F;
    dw $0088,$00C0,$0000,$2000,$0000,$0104,$0008                         ;A1D541;
    dw EnemyHeaders_Boyon                                                ;A1D54F;
    dw $01E8,$00D0,$0000,$2000,$0000,$0004,$0008                         ;A1D551;
    dw EnemyHeaders_Boyon                                                ;A1D55F;
    dw $0218,$00D0,$0000,$2000,$0000,$0104,$0020                         ;A1D561;
    dw EnemyHeaders_Boyon                                                ;A1D56F;
    dw $0278,$00D0,$0000,$2000,$0000,$0304,$0008                         ;A1D571;
    dw EnemyHeaders_Boyon                                                ;A1D57F;
    dw $02D8,$00D0,$0000,$2000,$0000,$0306,$0008                         ;A1D581;
    dw EnemyHeaders_Boyon                                                ;A1D58F;
    dw $0308,$00D0,$0000,$2000,$0000,$0304,$0008                         ;A1D591;
    dw EnemyHeaders_Boyon                                                ;A1D59F;
    dw $0368,$00D0,$0000,$2000,$0000,$0004,$0008                         ;A1D5A1;
    dw EnemyHeaders_Zebbo                                                ;A1D5AF;
    dw $00B8,$00C8,$0000,$6900,$0000,$0002,$0000                         ;A1D5B1;
    dw EnemyHeaders_Zebbo                                                ;A1D5BF;
    dw $02A8,$00C8,$0000,$6900,$0000,$0002,$0000                         ;A1D5C1;
    dw EnemyHeaders_Zebbo                                                ;A1D5CF;
    dw $0248,$00C8,$0000,$6900,$0000,$0002,$0000,$FFFF                   ;A1D5D1;
    db $03                                                               ;A1D5E1;

EnemyPopulations_MamaTurtle:
    dw EnemyHeaders_MamaTurtle                                           ;A1D5E2;
    dw $01D8,$03CD,$0000,$A800,$0000,$0000,$0000                         ;A1D5E4;
    dw EnemyHeaders_BabyTurtle                                           ;A1D5F2;
    dw $01B0,$03CD,$0000,$A800,$0000,$FFFF,$0000                         ;A1D5F4;
    dw EnemyHeaders_BabyTurtle                                           ;A1D602;
    dw $01D8,$03CD,$0000,$A800,$0000,$FFFF,$0000                         ;A1D604;
    dw EnemyHeaders_BabyTurtle                                           ;A1D612;
    dw $01E8,$03CD,$0000,$A800,$0000,$0001,$0000                         ;A1D614;
    dw EnemyHeaders_BabyTurtle                                           ;A1D622;
    dw $0218,$03CD,$0000,$A800,$0000,$0001,$0000,$FFFF                   ;A1D624;
    db $01                                                               ;A1D634;

EnemyPopulations_CrabTunnel:
    dw EnemyHeaders_Sciser                                               ;A1D635;
    dw $0080,$0047,$0002,$2001,$0000,$0001,$0000                         ;A1D637;
    dw EnemyHeaders_Sciser                                               ;A1D645;
    dw $0130,$0087,$0002,$2000,$0000,$0002,$0000                         ;A1D647;
    dw EnemyHeaders_Sciser                                               ;A1D655;
    dw $01C0,$00C8,$0003,$2800,$0000,$0003,$0000                         ;A1D657;
    dw EnemyHeaders_Sciser                                               ;A1D665;
    dw $0200,$0047,$0002,$2800,$0000,$0001,$0000                         ;A1D667;
    dw EnemyHeaders_Sciser                                               ;A1D675;
    dw $02B0,$00C8,$0003,$2000,$0000,$0002,$0000                         ;A1D677;
    dw EnemyHeaders_Sciser                                               ;A1D685;
    dw $0370,$0047,$0002,$2000,$0000,$0001,$0000,$FFFF                   ;A1D687;
    db $06                                                               ;A1D697;

EnemyPopulations_NWestMaridiaBug:
    dw EnemyHeaders_Owtch                                                ;A1D698;
    dw $0040,$01C8,$0000,$2000,$0000,$0101,$0004                         ;A1D69A;
    dw EnemyHeaders_Owtch                                                ;A1D6A8;
    dw $00B8,$01C8,$0000,$2000,$0000,$0100,$0108                         ;A1D6AA;
    dw EnemyHeaders_Owtch                                                ;A1D6B8;
    dw $0170,$01C8,$0000,$2000,$0000,$0100,$0308                         ;A1D6BA;
    dw EnemyHeaders_Owtch                                                ;A1D6C8;
    dw $0198,$01C8,$0000,$2000,$0000,$0301,$0104                         ;A1D6CA;
    dw EnemyHeaders_Owtch                                                ;A1D6D8;
    dw $0290,$01B8,$0000,$2000,$0000,$0101,$0008                         ;A1D6DA;
    dw EnemyHeaders_Owtch                                                ;A1D6E8;
    dw $0308,$01C8,$0000,$2000,$0000,$0500,$0104                         ;A1D6EA;
    dw EnemyHeaders_Owtch                                                ;A1D6F8;
    dw $0378,$01C8,$0000,$2000,$0000,$0501,$0108                         ;A1D6FA;
    dw EnemyHeaders_Menu                                                 ;A1D708;
    dw $0020,$0110,$0000,$2000,$0000,$0000,$0000                         ;A1D70A;
    dw EnemyHeaders_Menu                                                 ;A1D718;
    dw $0018,$0140,$0000,$2000,$0000,$0000,$0000                         ;A1D71A;
    dw EnemyHeaders_Menu                                                 ;A1D728;
    dw $0010,$0170,$0000,$2000,$0000,$0000,$0000                         ;A1D72A;
    dw EnemyHeaders_Menu                                                 ;A1D738;
    dw $02F0,$0160,$0000,$2000,$0000,$0000,$0000                         ;A1D73A;
    dw EnemyHeaders_Menu                                                 ;A1D748;
    dw $0360,$0140,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1D74A;
    db $07                                                               ;A1D75A;

EnemyPopulations_PseudoPlasmaSpark:
    dw EnemyHeaders_Owtch                                                ;A1D75B;
    dw $0180,$02B8,$0000,$2000,$0000,$0101,$0208                         ;A1D75D;
    dw EnemyHeaders_Choot                                                ;A1D76B;
    dw $00F0,$01A4,$0000,$2000,$0000,$0203,$0002                         ;A1D76D;
    dw EnemyHeaders_Choot                                                ;A1D77B;
    dw $0210,$017C,$0000,$2000,$0000,$0004,$0004                         ;A1D77D;
    dw EnemyHeaders_Choot                                                ;A1D78B;
    dw $02A8,$013C,$0000,$2000,$0000,$0102,$0010                         ;A1D78D;
    dw EnemyHeaders_Choot                                                ;A1D79B;
    dw $0310,$00DC,$0000,$2000,$0000,$0002,$0008                         ;A1D79D;
    dw EnemyHeaders_Choot                                                ;A1D7AB;
    dw $0368,$009C,$0000,$2000,$0000,$0002,$0004                         ;A1D7AD;
    dw EnemyHeaders_Skultera                                             ;A1D7BB;
    dw $0070,$0258,$0000,$2800,$0000,$0010,$0210                         ;A1D7BD;
    dw EnemyHeaders_Skultera                                             ;A1D7CB;
    dw $01C0,$0280,$0000,$2800,$0000,$0110,$0210                         ;A1D7CD;
    dw EnemyHeaders_Choot                                                ;A1D7DB;
    dw $03B8,$01E0,$0000,$2000,$0000,$0005,$0008,$FFFF                   ;A1D7DD;
    db $09                                                               ;A1D7ED;

EnemyPopulations_WestSandHallTunnel:
    dw EnemyHeaders_Sciser                                               ;A1D7EE;
    dw $0088,$0067,$0002,$2000,$0000,$0004,$0000,$FFFF                   ;A1D7F0;
    db $01                                                               ;A1D800;

EnemyPopulations_PlasmaTutorial:
    dw EnemyHeaders_Puyo                                                 ;A1D801;
    dw $0057,$009C,$0000,$2000,$0000,$0F00,$0000                         ;A1D803;
    dw EnemyHeaders_Puyo                                                 ;A1D811;
    dw $0062,$009C,$0000,$2000,$0000,$0F00,$0000                         ;A1D813;
    dw EnemyHeaders_Puyo                                                 ;A1D821;
    dw $0069,$009C,$0000,$2000,$0000,$0F00,$0000                         ;A1D823;
    dw EnemyHeaders_Puyo                                                 ;A1D831;
    dw $005B,$0098,$0000,$2000,$0000,$0E00,$0000                         ;A1D833;
    dw EnemyHeaders_Puyo                                                 ;A1D841;
    dw $0065,$0098,$0000,$2000,$0000,$0E00,$0000                         ;A1D843;
    dw EnemyHeaders_Puyo                                                 ;A1D851;
    dw $0061,$0094,$0000,$2000,$0000,$0D00,$0000,$FFFF                   ;A1D853;
    db $06                                                               ;A1D863;

EnemyPopulations_ThreadTheNeedle:
    dw EnemyHeaders_Puyo                                                 ;A1D864;
    dw $0118,$008C,$0000,$2000,$0000,$0020,$0016                         ;A1D866;
    dw EnemyHeaders_Puyo                                                 ;A1D874;
    dw $0144,$00AC,$0000,$2000,$0000,$0020,$0016                         ;A1D876;
    dw EnemyHeaders_Puyo                                                 ;A1D884;
    dw $02C4,$008C,$0000,$2000,$0000,$0040,$0016                         ;A1D886;
    dw EnemyHeaders_Puyo                                                 ;A1D894;
    dw $05F8,$006C,$0000,$2000,$0000,$0030,$0016                         ;A1D896;
    dw EnemyHeaders_Puyo                                                 ;A1D8A4;
    dw $0410,$006C,$0000,$2000,$0000,$0020,$0016                         ;A1D8A6;
    dw EnemyHeaders_Puyo                                                 ;A1D8B4;
    dw $0470,$008C,$0000,$2000,$0000,$0040,$0016                         ;A1D8B6;
    dw EnemyHeaders_Puyo                                                 ;A1D8C4;
    dw $0440,$005C,$0000,$2000,$0000,$0010,$0016                         ;A1D8C6;
    dw EnemyHeaders_Choot                                                ;A1D8D4;
    dw $00D8,$008C,$0000,$2000,$0000,$0201,$0000                         ;A1D8D6;
    dw EnemyHeaders_Choot                                                ;A1D8E4;
    dw $01B0,$00AC,$0000,$2000,$0000,$0202,$0000                         ;A1D8E6;
    dw EnemyHeaders_Choot                                                ;A1D8F4;
    dw $0318,$006C,$0000,$2000,$0000,$0201,$0000                         ;A1D8F6;
    dw EnemyHeaders_Choot                                                ;A1D904;
    dw $0518,$00AC,$0000,$2000,$0000,$0202,$0000                         ;A1D906;
    dw EnemyHeaders_Choot                                                ;A1D914;
    dw $05A8,$008C,$0000,$2000,$0000,$0102,$0000                         ;A1D916;
    dw EnemyHeaders_Choot                                                ;A1D924;
    dw $0278,$00AC,$0000,$2000,$0000,$0003,$0000                         ;A1D926;
    dw EnemyHeaders_Choot                                                ;A1D934;
    dw $03A8,$00AC,$0000,$2000,$0000,$0003,$0000                         ;A1D936;
    dw EnemyHeaders_Choot                                                ;A1D944;
    dw $065C,$00AC,$0000,$2000,$0000,$0202,$0000,$FFFF                   ;A1D946;
    db $0F                                                               ;A1D956;

EnemyPopulations_PlasmaSpark:
    dw EnemyHeaders_Owtch                                                ;A1D957;
    dw $0350,$04F8,$0000,$2000,$0000,$0100,$0304                         ;A1D959;
    dw EnemyHeaders_Owtch                                                ;A1D967;
    dw $0338,$04F8,$0000,$2000,$0000,$0101,$0204                         ;A1D969;
    dw EnemyHeaders_Owtch                                                ;A1D977;
    dw $0170,$0568,$0000,$2000,$0000,$0301,$0002                         ;A1D979;
    dw EnemyHeaders_Owtch                                                ;A1D987;
    dw $01A0,$05C8,$0000,$2000,$0000,$0501,$0204                         ;A1D989;
    dw EnemyHeaders_Choot                                                ;A1D997;
    dw $0100,$029C,$0000,$2000,$0000,$0001,$0010                         ;A1D999;
    dw EnemyHeaders_Choot                                                ;A1D9A7;
    dw $0230,$039C,$0000,$2000,$0000,$0005,$0000                         ;A1D9A9;
    dw EnemyHeaders_Choot                                                ;A1D9B7;
    dw $0300,$03A4,$0000,$2000,$0000,$0207,$0000                         ;A1D9B9;
    dw EnemyHeaders_Choot                                                ;A1D9C7;
    dw $01E0,$00AC,$0000,$2000,$0000,$0001,$0010                         ;A1D9C9;
    dw EnemyHeaders_Choot                                                ;A1D9D7;
    dw $0270,$00EC,$0000,$2000,$0000,$0001,$0010                         ;A1D9D9;
    dw EnemyHeaders_Skultera                                             ;A1D9E7;
    dw $0300,$0420,$0000,$2800,$0000,$0010,$0210                         ;A1D9E9;
    dw EnemyHeaders_Skultera                                             ;A1D9F7;
    dw $0270,$0488,$0000,$2800,$0000,$0110,$0210,$FFFF                   ;A1D9F9;
    db $0B                                                               ;A1DA09;

EnemyPopulations_Toilet:
    dw EnemyHeaders_Mochtroid                                            ;A1DA0A;
    dw $00A0,$0388,$0000,$2000,$0000,$0000,$0000                         ;A1DA0C;
    dw EnemyHeaders_Puyo                                                 ;A1DA1A;
    dw $0064,$0358,$0000,$2000,$0000,$0010,$0004                         ;A1DA1C;
    dw EnemyHeaders_Yard                                                 ;A1DA2A;
    dw $0030,$0698,$0006,$A000,$0000,$0002,$0000,$FFFF                   ;A1DA2C;
    db $03                                                               ;A1DA3C;

EnemyPopulations_WestSandHall:
    dw EnemyHeaders_Evir                                                 ;A1DA3D;
    dw $01F8,$00A0,$0000,$2000,$0000,$0000,$F808                         ;A1DA3F;
    dw EnemyHeaders_Evir                                                 ;A1DA4D;
    dw $01F8,$00A0,$0000,$2400,$0000,$0001,$0000                         ;A1DA4F;
    dw EnemyHeaders_EvirProjectile                                       ;A1DA5D;
    dw $01F8,$00A0,$0000,$2800,$0000,$0002,$0000                         ;A1DA5F;
    dw EnemyHeaders_Evir                                                 ;A1DA6D;
    dw $02E0,$0078,$0000,$2000,$0000,$0000,$D00C                         ;A1DA6F;
    dw EnemyHeaders_Evir                                                 ;A1DA7D;
    dw $02E0,$0078,$0000,$2400,$0000,$0001,$0000                         ;A1DA7F;
    dw EnemyHeaders_EvirProjectile                                       ;A1DA8D;
    dw $02E0,$0078,$0000,$2800,$0000,$0002,$0000                         ;A1DA8F;
    dw EnemyHeaders_Evir                                                 ;A1DA9D;
    dw $0340,$00A0,$0000,$2000,$0000,$0000,$F808                         ;A1DA9F;
    dw EnemyHeaders_Evir                                                 ;A1DAAD;
    dw $0340,$00A0,$0000,$2400,$0000,$0001,$0000                         ;A1DAAF;
    dw EnemyHeaders_EvirProjectile                                       ;A1DABD;
    dw $0340,$00A0,$0000,$2800,$0000,$0002,$0000,$FFFF                   ;A1DABF;
    db $03                                                               ;A1DACF;

EnemyPopulations_Oasis:
    dw $FFFF                                                             ;A1DAD0;
    db $00                                                               ;A1DAD2;

EnemyPopulations_EastSandHall:
    dw EnemyHeaders_Evir                                                 ;A1DAD3;
    dw $00A8,$00A0,$0000,$2000,$0000,$0000,$F808                         ;A1DAD5;
    dw EnemyHeaders_Evir                                                 ;A1DAE3;
    dw $00A8,$00A0,$0000,$2400,$0000,$0001,$0000                         ;A1DAE5;
    dw EnemyHeaders_EvirProjectile                                       ;A1DAF3;
    dw $00A8,$00A0,$0000,$2800,$0000,$0002,$0000                         ;A1DAF5;
    dw EnemyHeaders_Evir                                                 ;A1DB03;
    dw $0100,$0078,$0000,$2000,$0000,$0000,$D00C                         ;A1DB05;
    dw EnemyHeaders_Evir                                                 ;A1DB13;
    dw $0100,$0078,$0000,$2400,$0000,$0001,$0000                         ;A1DB15;
    dw EnemyHeaders_EvirProjectile                                       ;A1DB23;
    dw $0100,$0078,$0000,$2800,$0000,$0002,$0000                         ;A1DB25;
    dw EnemyHeaders_Evir                                                 ;A1DB33;
    dw $0220,$0078,$0000,$2000,$0000,$0000,$D00C                         ;A1DB35;
    dw EnemyHeaders_Evir                                                 ;A1DB43;
    dw $0220,$0078,$0000,$2400,$0000,$0001,$0000                         ;A1DB45;
    dw EnemyHeaders_EvirProjectile                                       ;A1DB53;
    dw $0220,$0078,$0000,$2800,$0000,$0002,$0000,$FFFF                   ;A1DB55;
    db $03                                                               ;A1DB65;

EnemyPopulations_WestAqueductQuicksand:
    dw EnemyHeaders_Bull                                                 ;A1DB66;
    dw $0028,$00B8,$0000,$2800,$0000,$0008,$0001                         ;A1DB68;
    dw EnemyHeaders_Bull                                                 ;A1DB76;
    dw $0048,$0138,$0000,$2800,$0000,$0008,$0001                         ;A1DB78;
    dw EnemyHeaders_Bull                                                 ;A1DB86;
    dw $00B8,$0118,$0000,$2800,$0000,$0006,$0000                         ;A1DB88;
    dw EnemyHeaders_Bull                                                 ;A1DB96;
    dw $00A8,$0178,$0000,$2800,$0000,$0007,$0002                         ;A1DB98;
    dw EnemyHeaders_Bull                                                 ;A1DBA6;
    dw $00D8,$0068,$0000,$2800,$0000,$000A,$0000                         ;A1DBA8;
    dw EnemyHeaders_Bull                                                 ;A1DBB6;
    dw $0028,$0038,$0000,$2800,$0000,$000A,$0000                         ;A1DBB8;
    dw EnemyHeaders_Bull                                                 ;A1DBC6;
    dw $0070,$01B8,$0000,$2800,$0000,$0007,$0002,$FFFF                   ;A1DBC8;
    db $07                                                               ;A1DBD8;

EnemyPopulations_EastAqueductQuicksand:
    dw EnemyHeaders_Bull                                                 ;A1DBD9;
    dw $0038,$00D8,$0000,$2800,$0000,$0009,$0001                         ;A1DBDB;
    dw EnemyHeaders_Bull                                                 ;A1DBE9;
    dw $00D8,$0098,$0000,$2800,$0000,$000A,$0001                         ;A1DBEB;
    dw EnemyHeaders_Bull                                                 ;A1DBF9;
    dw $0058,$0178,$0000,$2800,$0000,$0007,$0002                         ;A1DBFB;
    dw EnemyHeaders_Bull                                                 ;A1DC09;
    dw $00B8,$0138,$0000,$2800,$0000,$0008,$0002                         ;A1DC0B;
    dw EnemyHeaders_Bull                                                 ;A1DC19;
    dw $0028,$0028,$0000,$2800,$0000,$000A,$0000                         ;A1DC1B;
    dw EnemyHeaders_Bull                                                 ;A1DC29;
    dw $0098,$01C8,$0000,$2800,$0000,$0007,$0002,$FFFF                   ;A1DC2B;
    db $06                                                               ;A1DC3B;

EnemyPopulations_Butterfly:
    dw EnemyHeaders_Zoa                                                  ;A1DC3C;
    dw $0098,$00D8,$0000,$6100,$0000,$0000,$0000                         ;A1DC3E;
    dw EnemyHeaders_Zoa                                                  ;A1DC4C;
    dw $0068,$00D8,$0000,$6100,$0000,$0000,$0000                         ;A1DC4E;
    dw EnemyHeaders_Zoa                                                  ;A1DC5C;
    dw $0098,$00E0,$0000,$6100,$0000,$0000,$0000,$FFFF                   ;A1DC5E;
    db $03                                                               ;A1DC6E;

EnemyPopulations_BotwoonHallway:
    dw EnemyHeaders_Mochtroid                                            ;A1DC6F;
    dw $0030,$0048,$0000,$2000,$0000,$0000,$0000                         ;A1DC71;
    dw EnemyHeaders_Mochtroid                                            ;A1DC7F;
    dw $00C0,$0090,$0000,$2000,$0000,$0000,$0000                         ;A1DC81;
    dw EnemyHeaders_Mochtroid                                            ;A1DC8F;
    dw $0170,$0048,$0000,$2000,$0000,$0000,$0000                         ;A1DC91;
    dw EnemyHeaders_Mochtroid                                            ;A1DC9F;
    dw $0298,$0098,$0000,$2000,$0000,$0000,$0000                         ;A1DCA1;
    dw EnemyHeaders_Mochtroid                                            ;A1DCAF;
    dw $02F0,$0780,$0000,$2000,$0000,$0000,$0000                         ;A1DCB1;
    dw EnemyHeaders_Puyo                                                 ;A1DCBF;
    dw $0260,$0058,$0000,$2000,$0000,$0020,$0008                         ;A1DCC1;
    dw EnemyHeaders_Puyo                                                 ;A1DCCF;
    dw $0360,$0058,$0000,$2000,$0000,$0020,$0008,$FFFF                   ;A1DCD1;
    db $07                                                               ;A1DCE1;

EnemyPopulations_EastPants:
    dw EnemyHeaders_Puyo                                                 ;A1DCE2;
    dw $0080,$022C,$0000,$2000,$0000,$0030,$0016                         ;A1DCE4;
    dw EnemyHeaders_Puyo                                                 ;A1DCF2;
    dw $00C0,$01DC,$0000,$2000,$0000,$0020,$0016                         ;A1DCF4;
    dw EnemyHeaders_Puyo                                                 ;A1DD02;
    dw $0070,$019C,$0000,$2000,$0000,$0080,$0016                         ;A1DD04;
    dw EnemyHeaders_Puyo                                                 ;A1DD12;
    dw $0050,$02F0,$0000,$2000,$0000,$0010,$0008                         ;A1DD14;
    dw EnemyHeaders_Puyo                                                 ;A1DD22;
    dw $00B0,$02F0,$0000,$2000,$0000,$0008,$0008,$FFFF                   ;A1DD24;
    db $05                                                               ;A1DD34;

EnemyPopulations_Springball:
    dw $FFFF                                                             ;A1DD35;
    db $00                                                               ;A1DD37;

EnemyPopulations_BelowBotwoonETank:
    dw EnemyHeaders_Zoa                                                  ;A1DD38;
    dw $02B8,$00C8,$0000,$6100,$0000,$0000,$0000                         ;A1DD3A;
    dw EnemyHeaders_Zoa                                                  ;A1DD48;
    dw $01C8,$00D0,$0000,$6100,$0000,$0000,$0000                         ;A1DD4A;
    dw EnemyHeaders_Zoa                                                  ;A1DD58;
    dw $01C8,$00D8,$0000,$6100,$0000,$0000,$0000                         ;A1DD5A;
    dw EnemyHeaders_Zoa                                                  ;A1DD68;
    dw $03B8,$00D8,$0000,$6100,$0000,$0000,$0000                         ;A1DD6A;
    dw EnemyHeaders_Zoa                                                  ;A1DD78;
    dw $01C8,$00E0,$0000,$6100,$0000,$0000,$0000                         ;A1DD7A;
    dw EnemyHeaders_Owtch                                                ;A1DD88;
    dw $00C0,$00A8,$0000,$2000,$0000,$0101,$031C,$FFFF                   ;A1DD8A;
    db $06                                                               ;A1DD9A;

EnemyPopulations_Kassiuz:
    dw EnemyHeaders_Choot                                                ;A1DD9B;
    dw $0070,$00BC,$0000,$2000,$0000,$0203,$0010                         ;A1DD9D;
    dw EnemyHeaders_Choot                                                ;A1DDAB;
    dw $0090,$01DC,$0000,$2000,$0000,$0202,$0010                         ;A1DDAD;
    dw EnemyHeaders_Choot                                                ;A1DDBB;
    dw $0060,$02CC,$0000,$2000,$0000,$0104,$0010                         ;A1DDBD;
    dw EnemyHeaders_Puyo                                                 ;A1DDCB;
    dw $00D8,$02BC,$0000,$2000,$0000,$0040,$0008                         ;A1DDCD;
    dw EnemyHeaders_Puyo                                                 ;A1DDDB;
    dw $0038,$01CC,$0000,$2000,$0000,$0040,$0008                         ;A1DDDD;
    dw EnemyHeaders_Puyo                                                 ;A1DDEB;
    dw $00D4,$037C,$0000,$2000,$0000,$0040,$0008                         ;A1DDED;
    dw EnemyHeaders_Puyo                                                 ;A1DDFB;
    dw $00A8,$03AC,$0000,$2000,$0000,$0040,$0008,$FFFF                   ;A1DDFD;
    db $07                                                               ;A1DE0D;

EnemyPopulations_ForgottenHighwaySave:
    dw $FFFF                                                             ;A1DE0E;
    db $00                                                               ;A1DE10;

EnemyPopulations_MaridiaEnergyRefill:
    dw $FFFF                                                             ;A1DE11;
    db $00                                                               ;A1DE13;

EnemyPopulations_MaridiaMap:
    dw $FFFF                                                             ;A1DE14;
    db $00                                                               ;A1DE16;

EnemyPopulations_CrabHole:
    dw EnemyHeaders_Sciser                                               ;A1DE17;
    dw $0060,$0037,$0002,$2800,$0000,$0001,$0000                         ;A1DE19;
    dw EnemyHeaders_Sciser                                               ;A1DE27;
    dw $0076,$00E8,$0000,$2801,$0000,$0004,$0000                         ;A1DE29;
    dw EnemyHeaders_Sciser                                               ;A1DE37;
    dw $0076,$0100,$0000,$2801,$0000,$0002,$0000                         ;A1DE39;
    dw EnemyHeaders_Sciser                                               ;A1DE47;
    dw $0080,$01B8,$0003,$2800,$0000,$0002,$0000,$FFFF                   ;A1DE49;
    db $04                                                               ;A1DE59;

EnemyPopulations_Botwoon:
    dw EnemyHeaders_Botwoon                                              ;A1DE5A;
    dw $0080,$0080,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A1DE5C;
    db $01                                                               ;A1DE6C;

EnemyPopulations_MainStreet:
    dw EnemyHeaders_Skultera                                             ;A1DE6D;
    dw $0100,$01A0,$0000,$2000,$0000,$0010,$0210                         ;A1DE6F;
    dw EnemyHeaders_Skultera                                             ;A1DE7D;
    dw $00F0,$03D8,$0000,$2800,$0000,$0010,$0210                         ;A1DE7F;
    dw EnemyHeaders_Skultera                                             ;A1DE8D;
    dw $0120,$04F0,$0000,$2000,$0000,$0010,$0210                         ;A1DE8F;
    dw EnemyHeaders_Skultera                                             ;A1DE9D;
    dw $00D0,$05A0,$0000,$2000,$0000,$0010,$0210                         ;A1DE9F;
    dw EnemyHeaders_Skultera                                             ;A1DEAD;
    dw $0100,$0724,$0000,$2000,$0000,$0010,$0210                         ;A1DEAF;
    dw EnemyHeaders_Sciser                                               ;A1DEBD;
    dw $0090,$0118,$0003,$2001,$0000,$0002,$0000                         ;A1DEBF;
    dw EnemyHeaders_Sciser                                               ;A1DECD;
    dw $00F0,$0298,$0003,$2000,$0000,$0003,$0000                         ;A1DECF;
    dw EnemyHeaders_Sciser                                               ;A1DEDD;
    dw $00F8,$0487,$0002,$2001,$0000,$0001,$0000                         ;A1DEDF;
    dw EnemyHeaders_Sciser                                               ;A1DEED;
    dw $0108,$0658,$0003,$2001,$0000,$0001,$0000                         ;A1DEEF;
    dw EnemyHeaders_Sciser                                               ;A1DEFD;
    dw $0168,$0257,$0002,$2000,$0000,$0001,$0000                         ;A1DEFF;
    dw EnemyHeaders_Sciser                                               ;A1DF0D;
    dw $0160,$0047,$0002,$2000,$0000,$0002,$0000                         ;A1DF0F;
    dw EnemyHeaders_Sciser                                               ;A1DF1D;
    dw $0097,$07A0,$0000,$2800,$0000,$0001,$0000,$FFFF                   ;A1DF1F;
    db $0C                                                               ;A1DF2F;

EnemyPopulations_BugSandHole:
    dw EnemyHeaders_YappingMaw                                           ;A1DF30;
    dw $00B0,$00F0,$0000,$2000,$0000,$0040,$0001                         ;A1DF32;
    dw EnemyHeaders_Zoa                                                  ;A1DF40;
    dw $0080,$00DC,$0000,$6100,$0000,$0000,$0000                         ;A1DF42;
    dw EnemyHeaders_YappingMaw                                           ;A1DF50;
    dw $004D,$00F0,$0000,$2000,$0000,$0040,$0001,$FFFF                   ;A1DF52;
    db $01                                                               ;A1DF62;

EnemyPopulations_EastSandHole:
    dw EnemyHeaders_Boulder                                              ;A1DF63;
    dw $0190,$00A0,$0072,$2800,$0000,$0200,$7204                         ;A1DF65;
    dw EnemyHeaders_Boulder                                              ;A1DF73;
    dw $0150,$00C0,$0098,$2800,$0000,$0200,$A204                         ;A1DF75;
    dw EnemyHeaders_Boulder                                              ;A1DF83;
    dw $00D0,$00D0,$00C0,$2800,$0000,$0200,$A204,$FFFF                   ;A1DF85;
    db $00                                                               ;A1DF95;

EnemyPopulations_WestSandHole:
    dw EnemyHeaders_Boulder                                              ;A1DF96;
    dw $01D0,$0090,$0050,$2800,$0000,$0200,$6204                         ;A1DF98;
    dw EnemyHeaders_Boulder                                              ;A1DFA6;
    dw $00B0,$0140,$0080,$2800,$0000,$0200,$A004                         ;A1DFA8;
    dw EnemyHeaders_Boulder                                              ;A1DFB6;
    dw $00F0,$0160,$00F0,$2800,$0000,$0200,$F004                         ;A1DFB8;
    dw EnemyHeaders_Boulder                                              ;A1DFC6;
    dw $0030,$0090,$0040,$2800,$0000,$0200,$5204,$FFFF                   ;A1DFC8;
    db $00                                                               ;A1DFD8;

EnemyPopulations_WestCactusAlley:
    dw EnemyHeaders_Cacatac                                              ;A1DFD9;
    dw $0048,$00B4,$0000,$2000,$0000,$0101,$0000                         ;A1DFDB;
    dw EnemyHeaders_Cacatac                                              ;A1DFE9;
    dw $00B0,$0134,$0000,$2000,$0000,$0101,$0000                         ;A1DFEB;
    dw EnemyHeaders_Cacatac                                              ;A1DFF9;
    dw $0068,$01B4,$0000,$2000,$0000,$0100,$0000                         ;A1DFFB;
    dw EnemyHeaders_Cacatac                                              ;A1E009;
    dw $00A0,$004A,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1E00B;
    db $04                                                               ;A1E01B;

EnemyPopulations_EastCactusAlley:
    dw EnemyHeaders_Cacatac                                              ;A1E01C;
    dw $0180,$0094,$0000,$2000,$0000,$0101,$0000                         ;A1E01E;
    dw EnemyHeaders_Cacatac                                              ;A1E02C;
    dw $0290,$00A4,$0000,$2000,$0000,$0100,$0000                         ;A1E02E;
    dw EnemyHeaders_Cacatac                                              ;A1E03C;
    dw $0390,$0104,$0000,$2000,$0000,$0101,$0000                         ;A1E03E;
    dw EnemyHeaders_Cacatac                                              ;A1E04C;
    dw $02D0,$01B4,$0000,$2000,$0000,$0100,$0000                         ;A1E04E;
    dw EnemyHeaders_Cacatac                                              ;A1E05C;
    dw $00F0,$015A,$0000,$2000,$0000,$0001,$0000                         ;A1E05E;
    dw EnemyHeaders_Cacatac                                              ;A1E06C;
    dw $02D0,$016A,$0000,$2000,$0000,$0000,$0201,$FFFF                   ;A1E06E;
    db $06                                                               ;A1E07E;

EnemyPopulations_FishTank:
    dw EnemyHeaders_Skultera                                             ;A1E07F;
    dw $0070,$0098,$0000,$2800,$0000,$0110,$0210                         ;A1E081;
    dw EnemyHeaders_Skultera                                             ;A1E08F;
    dw $00B8,$02A8,$0000,$2000,$0000,$0010,$0210                         ;A1E091;
    dw EnemyHeaders_Skultera                                             ;A1E09F;
    dw $0190,$00F0,$0000,$2800,$0000,$0010,$0210                         ;A1E0A1;
    dw EnemyHeaders_PirateMagentaWalking                                 ;A1E0AF;
    dw $01A8,$02A0,$0000,$2000,$0004,$8000,$0018                         ;A1E0B1;
    dw EnemyHeaders_PirateMagentaWalking                                 ;A1E0BF;
    dw $0190,$0140,$0000,$2000,$0004,$8001,$0008                         ;A1E0C1;
    dw EnemyHeaders_PirateMagentaWalking                                 ;A1E0CF;
    dw $02A0,$00D0,$0000,$2000,$0004,$8000,$0008                         ;A1E0D1;
    dw EnemyHeaders_PirateMagentaWalking                                 ;A1E0DF;
    dw $0378,$01B0,$0000,$2000,$0004,$8001,$0028                         ;A1E0E1;
    dw EnemyHeaders_Skultera                                             ;A1E0EF;
    dw $0368,$00B8,$0000,$2000,$0000,$0010,$0210,$FFFF                   ;A1E0F1;
    db $08                                                               ;A1E101;

EnemyPopulations_TourianEscape4:
    dw EnemyHeaders_PirateSilverWall                                     ;A1E102;
    dw $002B,$04D0,$0000,$2000,$0004,$0000,$0084                         ;A1E104;
    dw EnemyHeaders_PirateSilverWall                                     ;A1E112;
    dw $00B2,$0428,$0000,$2000,$0004,$0001,$0084                         ;A1E114;
    dw EnemyHeaders_PirateSilverWall                                     ;A1E122;
    dw $002B,$0308,$0000,$2000,$0004,$0000,$0084                         ;A1E124;
    dw EnemyHeaders_PirateSilverWall                                     ;A1E132;
    dw $00B2,$0278,$0000,$2000,$0004,$0001,$0084                         ;A1E134;
    dw EnemyHeaders_PirateSilverWall                                     ;A1E142;
    dw $002B,$01E8,$0000,$2000,$0004,$0000,$0084                         ;A1E144;
    dw EnemyHeaders_PirateSilverWall                                     ;A1E152;
    dw $00B2,$0158,$0000,$2000,$0004,$0001,$0084                         ;A1E154;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E162;
    dw $0270,$0180,$0000,$2000,$0004,$0000,$0020                         ;A1E164;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E172;
    dw $01D0,$0180,$0000,$2000,$0004,$0000,$0020                         ;A1E174;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E182;
    dw $01C8,$02D0,$0000,$2000,$0004,$0000,$0010                         ;A1E184;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E192;
    dw $0140,$0200,$0000,$2000,$0004,$0000,$0020                         ;A1E194;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E1A2;
    dw $01B8,$03B0,$0000,$2000,$0004,$0000,$0010                         ;A1E1A4;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E1B2;
    dw $0168,$0500,$0000,$2000,$0004,$0000,$0010                         ;A1E1B4;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E1C2;
    dw $0278,$0450,$0000,$2000,$0004,$0000,$0010,$FFFF                   ;A1E1C4;
    db $0D                                                               ;A1E1D4;

EnemyPopulations_MotherBrainSave:
    dw $FFFF                                                             ;A1E1D5;
    db $00                                                               ;A1E1D7;

EnemyPopulations_Metroids1_0:
    dw EnemyHeaders_Metroid                                              ;A1E1D8;
    dw $010C,$006A,$0000,$2000,$0000,$0000,$0005                         ;A1E1DA;
    dw EnemyHeaders_Metroid                                              ;A1E1E8;
    dw $027D,$0074,$0000,$2000,$0000,$0000,$0005                         ;A1E1EA;
    dw EnemyHeaders_Metroid                                              ;A1E1F8;
    dw $036D,$0092,$0000,$2000,$0000,$0000,$0005                         ;A1E1FA;
    dw EnemyHeaders_Metroid                                              ;A1E208;
    dw $04AD,$008C,$0000,$2000,$0000,$0000,$0005                         ;A1E20A;
    dw EnemyHeaders_Rinka                                                ;A1E218;
    dw $0028,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E21A;
    dw EnemyHeaders_Rinka                                                ;A1E228;
    dw $0218,$00D8,$0000,$6000,$0000,$0000,$0000                         ;A1E22A;
    dw EnemyHeaders_Rinka                                                ;A1E238;
    dw $0498,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E23A;
    dw EnemyHeaders_Rinka                                                ;A1E248;
    dw $0468,$00D8,$0000,$6000,$0000,$0000,$0000,$FFFF                   ;A1E24A;
    db $04                                                               ;A1E25A;

EnemyPopulations_DustTorizo:
    dw EnemyHeaders_CorpseTorizo                                         ;A1E25B;
    dw $0120,$0094,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;A1E25D;
    db $00                                                               ;A1E26D;

EnemyPopulations_BigBoy:
    dw EnemyHeaders_BabyMetroid                                          ;A1E26E;
    dw $0180,$0040,$0000,$2800,$0000,$0000,$0000                         ;A1E270;
    dw EnemyHeaders_CorpseSidehopper                                     ;A1E27E;
    dw $0228,$00A0,$0000,$A000,$0000,$0000,$0000                         ;A1E280;
    dw EnemyHeaders_CorpseSidehopper                                     ;A1E28E;
    dw $00A0,$0040,$0000,$A000,$0000,$0002,$0000                         ;A1E290;
    dw EnemyHeaders_CorpseZoomer                                         ;A1E29E;
    dw $00F0,$0040,$0000,$A000,$0000,$0000,$0000                         ;A1E2A0;
    dw EnemyHeaders_CorpseZoomer                                         ;A1E2AE;
    dw $0298,$00C8,$0000,$A000,$0000,$0002,$0000                         ;A1E2B0;
    dw EnemyHeaders_CorpseZoomer                                         ;A1E2BE;
    dw $0108,$0036,$0000,$A000,$0000,$0004,$0000                         ;A1E2C0;
    dw EnemyHeaders_CorpseRipper                                         ;A1E2CE;
    dw $0320,$00A8,$0000,$A000,$0000,$0000,$0000                         ;A1E2D0;
    dw EnemyHeaders_CorpseRipper                                         ;A1E2DE;
    dw $00C2,$00C8,$0000,$A000,$0000,$0002,$0000                         ;A1E2E0;
    dw EnemyHeaders_CorpseSkree                                          ;A1E2EE;
    dw $0380,$0047,$0000,$A000,$0000,$0000,$0000                         ;A1E2F0;
    dw EnemyHeaders_CorpseSkree                                          ;A1E2FE;
    dw $0260,$0047,$0000,$A000,$0000,$0002,$0000                         ;A1E300;
    dw EnemyHeaders_CorpseSkree                                          ;A1E30E;
    dw $0180,$0047,$0000,$A000,$0000,$0004,$0000,$FFFF                   ;A1E310;
    db $00                                                               ;A1E320;

EnemyPopulations_MotherBrain_0_1:
    dw EnemyHeaders_MotherBrainBody                                      ;A1E321;
    dw $0081,$006F,$0000,$2800,$0004,$0000,$0000                         ;A1E323;
    dw EnemyHeaders_MotherBrainHead                                      ;A1E331;
    dw $0081,$006F,$0000,$2800,$0004,$0000,$0000                         ;A1E333;
    dw EnemyHeaders_Zebetite                                             ;A1E341;
    dw $0000,$0000,$0000,$2000,$0000,$0000,$0000                         ;A1E343;
    dw EnemyHeaders_Rinka                                                ;A1E351;
    dw $0337,$0036,$0000,$6000,$0000,$0001,$0000                         ;A1E353;
    dw EnemyHeaders_Rinka                                                ;A1E361;
    dw $0337,$00A6,$0000,$6000,$0000,$0002,$0000                         ;A1E363;
    dw EnemyHeaders_Rinka                                                ;A1E371;
    dw $0277,$001C,$0000,$6000,$0000,$0003,$0000,$FFFF                   ;A1E373;
    db $00                                                               ;A1E383;

EnemyPopulations_TourianEyeDoor:
    dw $FFFF                                                             ;A1E384;
    db $00                                                               ;A1E386;

EnemyPopulations_BlueHopper:
    dw EnemyHeaders_SidehopperTourian                                    ;A1E387;
    dw $00F8,$0061,$0000,$2000,$0000,$8000,$0000                         ;A1E389;
    dw EnemyHeaders_SidehopperTourian                                    ;A1E397;
    dw $0086,$00A9,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1E399;
    db $02                                                               ;A1E3A9;

EnemyPopulations_TourianEscape1:
    dw EnemyHeaders_ShutterDestroyable                                   ;A1E3AA;
    dw $01B8,$0040,$0108,$A800,$FF00,$2000,$0010                         ;A1E3AC;
    dw EnemyHeaders_ShutterDestroyable                                   ;A1E3BA;
    dw $01B8,$00C0,$0008,$A800,$00FF,$2000,$0010                         ;A1E3BC;
    dw EnemyHeaders_ShutterDestroyable                                   ;A1E3CA;
    dw $0168,$0040,$0108,$A800,$FF00,$2000,$0010                         ;A1E3CC;
    dw EnemyHeaders_ShutterDestroyable                                   ;A1E3DA;
    dw $0168,$00C0,$0008,$A800,$00FF,$2000,$0010                         ;A1E3DC;
    dw EnemyHeaders_ShutterDestroyable                                   ;A1E3EA;
    dw $0118,$0040,$0108,$A800,$FF00,$2000,$0018                         ;A1E3EC;
    dw EnemyHeaders_ShutterDestroyable                                   ;A1E3FA;
    dw $0118,$00C0,$0008,$A800,$00FF,$2000,$0018                         ;A1E3FC;
    dw EnemyHeaders_ShutterDestroyable                                   ;A1E40A;
    dw $00C8,$0040,$0108,$A800,$FF00,$2000,$0020                         ;A1E40C;
    dw EnemyHeaders_ShutterDestroyable                                   ;A1E41A;
    dw $00C8,$00C0,$0008,$A800,$00FF,$2000,$0020,$FFFF                   ;A1E41C;
    db $00                                                               ;A1E42C;

EnemyPopulations_TourianFirst:
    dw EnemyHeaders_Elevator                                             ;A1E42D;
    dw $0080,$02C2,$0000,$2C00,$0000,$0001,$0018,$FFFF                   ;A1E42F;
    db $00                                                               ;A1E43F;

EnemyPopulations_Metroids2_0:
    dw EnemyHeaders_Metroid                                              ;A1E440;
    dw $0098,$0115,$0000,$2000,$0000,$0000,$0005                         ;A1E442;
    dw EnemyHeaders_Rinka                                                ;A1E450;
    dw $0098,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E452;
    dw EnemyHeaders_Rinka                                                ;A1E460;
    dw $00D8,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E462;
    dw EnemyHeaders_Rinka                                                ;A1E470;
    dw $00D8,$01B8,$0000,$6000,$0000,$0000,$0000                         ;A1E472;
    dw EnemyHeaders_Rinka                                                ;A1E480;
    dw $0008,$0148,$0000,$6000,$0000,$0000,$0000                         ;A1E482;
    dw EnemyHeaders_Metroid                                              ;A1E490;
    dw $0056,$018A,$0000,$2000,$0000,$0000,$0005,$FFFF                   ;A1E492;
    db $02                                                               ;A1E4A2;

EnemyPopulations_Metroids4_0:
    dw EnemyHeaders_Metroid                                              ;A1E4A3;
    dw $00C4,$0152,$0000,$2000,$0000,$0000,$0005                         ;A1E4A5;
    dw EnemyHeaders_Metroid                                              ;A1E4B3;
    dw $003E,$00FB,$0000,$2000,$0000,$0000,$0005                         ;A1E4B5;
    dw EnemyHeaders_Rinka                                                ;A1E4C3;
    dw $0098,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E4C5;
    dw EnemyHeaders_Rinka                                                ;A1E4D3;
    dw $0098,$0188,$0000,$6000,$0000,$0000,$0000                         ;A1E4D5;
    dw EnemyHeaders_Rinka                                                ;A1E4E3;
    dw $0068,$0128,$0000,$6000,$0000,$0000,$0000                         ;A1E4E5;
    dw EnemyHeaders_Rinka                                                ;A1E4F3;
    dw $00F8,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E4F5;
    dw EnemyHeaders_Metroid                                              ;A1E503;
    dw $0046,$01BE,$0000,$2000,$0000,$0000,$0005,$FFFF                   ;A1E505;
    db $03                                                               ;A1E515;

EnemyPopulations_Metroids1_1:
    dw EnemyHeaders_Rinka                                                ;A1E516;
    dw $0028,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E518;
    dw EnemyHeaders_Rinka                                                ;A1E526;
    dw $0218,$00D8,$0000,$6000,$0000,$0000,$0000                         ;A1E528;
    dw EnemyHeaders_Rinka                                                ;A1E536;
    dw $0498,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E538;
    dw EnemyHeaders_Rinka                                                ;A1E546;
    dw $0468,$00D8,$0000,$6000,$0000,$0000,$0000,$FFFF                   ;A1E548;
    db $00                                                               ;A1E558;

EnemyPopulations_Metroids2_1:
    dw EnemyHeaders_Rinka                                                ;A1E559;
    dw $0098,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E55B;
    dw EnemyHeaders_Rinka                                                ;A1E569;
    dw $00D8,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E56B;
    dw EnemyHeaders_Rinka                                                ;A1E579;
    dw $00D8,$01B8,$0000,$6000,$0000,$0000,$0000                         ;A1E57B;
    dw EnemyHeaders_Rinka                                                ;A1E589;
    dw $0008,$0148,$0000,$6000,$0000,$0000,$0000,$FFFF                   ;A1E58B;
    db $00                                                               ;A1E59B;

EnemyPopulations_TourianEscape2:
    dw EnemyHeaders_PirateSilverWall                                     ;A1E59C;
    dw $002B,$00D8,$0000,$2000,$0004,$0000,$00A0                         ;A1E59E;
    dw EnemyHeaders_PirateSilverWall                                     ;A1E5AC;
    dw $00D0,$0128,$0000,$2000,$0004,$0001,$00A0,$FFFF                   ;A1E5AE;
    db $02                                                               ;A1E5BE;

EnemyPopulations_Metroids3_1:
    dw EnemyHeaders_Rinka                                                ;A1E5BF;
    dw $0108,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E5C1;
    dw EnemyHeaders_Rinka                                                ;A1E5CF;
    dw $0018,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E5D1;
    dw EnemyHeaders_Rinka                                                ;A1E5DF;
    dw $0028,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E5E1;
    dw EnemyHeaders_Rinka                                                ;A1E5EF;
    dw $00E8,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E5F1;
    dw EnemyHeaders_Rinka                                                ;A1E5FF;
    dw $01B8,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E601;
    dw EnemyHeaders_Rinka                                                ;A1E60F;
    dw $0268,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E611;
    dw EnemyHeaders_Rinka                                                ;A1E61F;
    dw $0268,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E621;
    dw EnemyHeaders_Rinka                                                ;A1E62F;
    dw $05D8,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E631;
    dw EnemyHeaders_Rinka                                                ;A1E63F;
    dw $05B8,$00B8,$0000,$6000,$0000,$0000,$0000,$FFFF                   ;A1E641;
    db $00                                                               ;A1E651;

EnemyPopulations_Metroids4_1:
    dw EnemyHeaders_Rinka                                                ;A1E652;
    dw $0098,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E654;
    dw EnemyHeaders_Rinka                                                ;A1E662;
    dw $0098,$0188,$0000,$6000,$0000,$0000,$0000                         ;A1E664;
    dw EnemyHeaders_Rinka                                                ;A1E672;
    dw $0068,$0128,$0000,$6000,$0000,$0000,$0000                         ;A1E674;
    dw EnemyHeaders_Rinka                                                ;A1E682;
    dw $00F8,$00B8,$0000,$6000,$0000,$0000,$0000,$FFFF                   ;A1E684;
    db $00                                                               ;A1E694;

EnemyPopulations_TourianEscape3:
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E695;
    dw $00C0,$0160,$0000,$2000,$0004,$0000,$0010                         ;A1E697;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E6A5;
    dw $0538,$0160,$0000,$2000,$0004,$0000,$0010                         ;A1E6A7;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E6B5;
    dw $0488,$0160,$0000,$2000,$0004,$0000,$0010                         ;A1E6B7;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E6C5;
    dw $03D8,$0160,$0000,$2000,$0004,$0000,$0010                         ;A1E6C7;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E6D5;
    dw $0478,$0050,$0000,$2000,$0004,$0000,$0010                         ;A1E6D7;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E6E5;
    dw $04E0,$0050,$0000,$2000,$0004,$0000,$0010                         ;A1E6E7;
    dw EnemyHeaders_PirateSilverWalking                                  ;A1E6F5;
    dw $0560,$0050,$0000,$2000,$0004,$0000,$0010,$FFFF                   ;A1E6F7;
    db $07                                                               ;A1E707;

EnemyPopulations_Seaweed:
    dw $FFFF                                                             ;A1E708;
    db $00                                                               ;A1E70A;

EnemyPopulations_TourianRecharge:
    dw $FFFF                                                             ;A1E70B;
    db $00                                                               ;A1E70D;

UNUSED_EnemyPopulations_A1E70E:
    dw EnemyHeaders_CorpseZoomer                                         ;A1E70E;
    dw $00F0,$0040,$0000,$A000,$0000,$0000,$0000                         ;A1E710;
    dw EnemyHeaders_CorpseZoomer                                         ;A1E71E;
    dw $0298,$00C8,$0000,$A000,$0000,$0002,$0000                         ;A1E720;
    dw EnemyHeaders_CorpseZoomer                                         ;A1E72E;
    dw $0108,$0036,$0000,$A000,$0000,$0004,$0000                         ;A1E730;
    dw EnemyHeaders_CorpseRipper                                         ;A1E73E;
    dw $0320,$00A8,$0000,$A000,$0000,$0000,$0000                         ;A1E740;
    dw EnemyHeaders_CorpseRipper                                         ;A1E74E;
    dw $00C2,$00C8,$0000,$A000,$0000,$0002,$0000                         ;A1E750;
    dw EnemyHeaders_CorpseSkree                                          ;A1E75E;
    dw $0380,$0047,$0000,$A000,$0000,$0000,$0000                         ;A1E760;
    dw EnemyHeaders_CorpseSkree                                          ;A1E76E;
    dw $0260,$0047,$0000,$A000,$0000,$0002,$0000                         ;A1E770;
    dw EnemyHeaders_CorpseSkree                                          ;A1E77E;
    dw $0180,$0047,$0000,$A000,$0000,$0004,$0000,$FFFF                   ;A1E780;
    db $00                                                               ;A1E790;

EnemyPopulations_UpperTourianSave:
    dw $FFFF                                                             ;A1E791;
    db $00                                                               ;A1E793;

EnemyPopulations_Metroids3_0:
    dw EnemyHeaders_Metroid                                              ;A1E794;
    dw $018A,$0081,$0000,$2000,$0000,$0000,$0005                         ;A1E796;
    dw EnemyHeaders_Metroid                                              ;A1E7A4;
    dw $0367,$0077,$0000,$2000,$0000,$0000,$0005                         ;A1E7A6;
    dw EnemyHeaders_Metroid                                              ;A1E7B4;
    dw $046A,$0073,$0000,$2000,$0000,$0000,$0005                         ;A1E7B6;
    dw EnemyHeaders_Rinka                                                ;A1E7C4;
    dw $0108,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E7C6;
    dw EnemyHeaders_Rinka                                                ;A1E7D4;
    dw $0018,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E7D6;
    dw EnemyHeaders_Rinka                                                ;A1E7E4;
    dw $0028,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E7E6;
    dw EnemyHeaders_Rinka                                                ;A1E7F4;
    dw $00E8,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E7F6;
    dw EnemyHeaders_Rinka                                                ;A1E804;
    dw $01B8,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E806;
    dw EnemyHeaders_Rinka                                                ;A1E814;
    dw $0268,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E816;
    dw EnemyHeaders_Rinka                                                ;A1E824;
    dw $0268,$00B8,$0000,$6000,$0000,$0000,$0000                         ;A1E826;
    dw EnemyHeaders_Rinka                                                ;A1E834;
    dw $05D8,$0048,$0000,$6000,$0000,$0000,$0000                         ;A1E836;
    dw EnemyHeaders_Rinka                                                ;A1E844;
    dw $05B8,$00B8,$0000,$6000,$0000,$0000,$0000,$FFFF                   ;A1E846;
    db $03                                                               ;A1E856;

EnemyPopulations_RinkaShaft:
    dw EnemyHeaders_Rinka                                                ;A1E857;
    dw $00E8,$01B8,$0000,$6000,$0000,$0000,$0000                         ;A1E859;
    dw EnemyHeaders_Rinka                                                ;A1E867;
    dw $00E8,$0208,$0000,$6000,$0000,$0000,$0000                         ;A1E869;
    dw EnemyHeaders_Rinka                                                ;A1E877;
    dw $0008,$0248,$0000,$6000,$0000,$0000,$0000,$FFFF                   ;A1E879;
    db $00                                                               ;A1E889;

EnemyPopulations_CeresElev_0:
    dw EnemyHeaders_CeresDoor                                            ;A1E88A;
    dw $00E8,$0277,$0002,$A800,$0000,$0002,$0000                         ;A1E88C;
    dw EnemyHeaders_CeresDoor                                            ;A1E89A;
    dw $00E0,$027F,$0001,$A800,$0000,$0001,$0000,$FFFF                   ;A1E89C;
    db $00                                                               ;A1E8AC;

EnemyPopulations_FallingTile_0:
    dw EnemyHeaders_CeresDoor                                            ;A1E8AD;
    dw $0020,$007F,$0000,$A800,$0000,$0000,$0000                         ;A1E8AF;
    dw EnemyHeaders_CeresDoor                                            ;A1E8BD;
    dw $01E0,$007F,$0001,$A800,$0000,$0001,$0000,$FFFF                   ;A1E8BF;
    db $00                                                               ;A1E8CF;

EnemyPopulations_MagnetStairs_0:
    dw EnemyHeaders_CeresDoor                                            ;A1E8D0;
    dw $0020,$007F,$0000,$A800,$0000,$0000,$0000                         ;A1E8D2;
    dw EnemyHeaders_CeresDoor                                            ;A1E8E0;
    dw $00E0,$017F,$0001,$A800,$0000,$0001,$0000,$FFFF                   ;A1E8E2;
    db $00                                                               ;A1E8F2;

EnemyPopulations_DeadScientist_0:
    dw EnemyHeaders_CeresDoor                                            ;A1E8F3;
    dw $0020,$007F,$0000,$A800,$0000,$0000,$0000                         ;A1E8F5;
    dw EnemyHeaders_CeresDoor                                            ;A1E903;
    dw $01E0,$007F,$0001,$A800,$0000,$0001,$0000,$FFFF                   ;A1E905;
    db $00                                                               ;A1E915;

EnemyPopulations_58Escape_0:
    dw EnemyHeaders_CeresDoor                                            ;A1E916;
    dw $0020,$007F,$0000,$A800,$0000,$0000,$0000                         ;A1E918;
    dw EnemyHeaders_CeresDoor                                            ;A1E926;
    dw $01E0,$007F,$0001,$A800,$0000,$0001,$0000,$FFFF                   ;A1E928;
    db $00                                                               ;A1E938;

EnemyPopulations_CeresRidley_0:
    dw EnemyHeaders_RidleyCeres                                          ;A1E939;
    dw $00BA,$00AB,$0000,$2800,$0000,$0000,$0000                         ;A1E93B;
    dw EnemyHeaders_CeresDoor                                            ;A1E949;
    dw $0010,$007F,$0003,$A800,$0000,$0003,$0000,$FFFF                   ;A1E94B;
    db $00                                                               ;A1E95B;

EnemyPopulations_CeresElev_1:
    dw EnemyHeaders_CeresDoor                                            ;A1E95C;
    dw $00E8,$0277,$0002,$A800,$0000,$0002,$0000                         ;A1E95E;
    dw EnemyHeaders_CeresDoor                                            ;A1E96C;
    dw $00E0,$027F,$0004,$A800,$0000,$0004,$0000                         ;A1E96E;
    dw EnemyHeaders_Steam                                                ;A1E97C;
    dw $005E,$006C,$0000,$2000,$0000,$0004,$0000                         ;A1E97E;
    dw EnemyHeaders_Steam                                                ;A1E98C;
    dw $00A2,$006C,$0000,$2000,$0000,$0005,$0000                         ;A1E98E;
    dw EnemyHeaders_Steam                                                ;A1E99C;
    dw $009E,$00C8,$0000,$2000,$0000,$0004,$0000                         ;A1E99E;
    dw EnemyHeaders_Steam                                                ;A1E9AC;
    dw $0062,$00C8,$0000,$2000,$0000,$0005,$0000                         ;A1E9AE;
    dw EnemyHeaders_Steam                                                ;A1E9BC;
    dw $005E,$0128,$0000,$2000,$0000,$0004,$0000                         ;A1E9BE;
    dw EnemyHeaders_Steam                                                ;A1E9CC;
    dw $00A2,$0128,$0000,$2000,$0000,$0005,$0000                         ;A1E9CE;
    dw EnemyHeaders_Steam                                                ;A1E9DC;
    dw $009E,$0188,$0000,$2000,$0000,$0004,$0000                         ;A1E9DE;
    dw EnemyHeaders_Steam                                                ;A1E9EC;
    dw $0062,$0198,$0000,$2000,$0000,$0005,$0000                         ;A1E9EE;
    dw EnemyHeaders_Steam                                                ;A1E9FC;
    dw $005E,$01F8,$0000,$2000,$0000,$0004,$0000                         ;A1E9FE;
    dw EnemyHeaders_Steam                                                ;A1EA0C;
    dw $00A2,$01F8,$0000,$2000,$0000,$0005,$0000                         ;A1EA0E;
    dw EnemyHeaders_Steam                                                ;A1EA1C;
    dw $0072,$0258,$0000,$2000,$0000,$0005,$0000,$FFFF                   ;A1EA1E;
    db $00                                                               ;A1EA2E;

EnemyPopulations_FallingTile_1:
    dw EnemyHeaders_Steam                                                ;A1EA2F;
    dw $00A0,$00CC,$0000,$2000,$0000,$0000,$0000                         ;A1EA31;
    dw EnemyHeaders_Steam                                                ;A1EA3F;
    dw $00E0,$00BC,$0000,$2000,$0000,$0000,$0000                         ;A1EA41;
    dw EnemyHeaders_Steam                                                ;A1EA4F;
    dw $0120,$00BC,$0000,$2000,$0000,$0000,$0000                         ;A1EA51;
    dw EnemyHeaders_Steam                                                ;A1EA5F;
    dw $0160,$00CC,$0000,$2000,$0000,$0000,$0000                         ;A1EA61;
    dw EnemyHeaders_Steam                                                ;A1EA6F;
    dw $01B8,$00A8,$0000,$2000,$0000,$0001,$0000                         ;A1EA71;
    dw EnemyHeaders_Steam                                                ;A1EA7F;
    dw $0080,$0042,$0000,$2000,$0000,$0002,$0000                         ;A1EA81;
    dw EnemyHeaders_Steam                                                ;A1EA8F;
    dw $00C0,$0042,$0000,$2000,$0000,$0002,$0000                         ;A1EA91;
    dw EnemyHeaders_Steam                                                ;A1EA9F;
    dw $0100,$0042,$0000,$2000,$0000,$0002,$0000                         ;A1EAA1;
    dw EnemyHeaders_Steam                                                ;A1EAAF;
    dw $0140,$0042,$0000,$2000,$0000,$0002,$0000                         ;A1EAB1;
    dw EnemyHeaders_Steam                                                ;A1EABF;
    dw $0180,$0042,$0000,$2000,$0000,$0002,$0000                         ;A1EAC1;
    dw EnemyHeaders_Steam                                                ;A1EACF;
    dw $0048,$00A8,$0000,$2000,$0000,$0003,$0000                         ;A1EAD1;
    dw EnemyHeaders_CeresDoor                                            ;A1EADF;
    dw $0020,$007F,$0000,$A800,$0000,$0000,$0000                         ;A1EAE1;
    dw EnemyHeaders_CeresDoor                                            ;A1EAEF;
    dw $01E0,$007F,$0001,$A800,$0000,$0001,$0000,$FFFF                   ;A1EAF1;
    db $00                                                               ;A1EB01;

EnemyPopulations_MagnetStairs_1:
    dw EnemyHeaders_CeresDoor                                            ;A1EB02;
    dw $0020,$007F,$0000,$A800,$0000,$0000,$0000                         ;A1EB04;
    dw EnemyHeaders_CeresDoor                                            ;A1EB12;
    dw $00E0,$017F,$0001,$A800,$0000,$0001,$0000                         ;A1EB14;
    dw EnemyHeaders_Steam                                                ;A1EB22;
    dw $0070,$009C,$0000,$2000,$0000,$0000,$0000                         ;A1EB24;
    dw EnemyHeaders_Steam                                                ;A1EB32;
    dw $00C2,$00B0,$0000,$2000,$0000,$0003,$0000                         ;A1EB34;
    dw EnemyHeaders_Steam                                                ;A1EB42;
    dw $0078,$0116,$0000,$2000,$0000,$0000,$0000                         ;A1EB44;
    dw EnemyHeaders_Steam                                                ;A1EB52;
    dw $003E,$0130,$0000,$2000,$0000,$0001,$0000                         ;A1EB54;
    dw EnemyHeaders_Steam                                                ;A1EB62;
    dw $0088,$0194,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;A1EB64;
    db $00                                                               ;A1EB74;

EnemyPopulations_DeadScientist_1:
    dw EnemyHeaders_CeresDoor                                            ;A1EB75;
    dw $0020,$007F,$0000,$A800,$0000,$0000,$0000                         ;A1EB77;
    dw EnemyHeaders_CeresDoor                                            ;A1EB85;
    dw $01E0,$007F,$0001,$A800,$0000,$0001,$0000,$FFFF                   ;A1EB87;
    db $00                                                               ;A1EB97;

EnemyPopulations_58Escape_1:
    dw EnemyHeaders_CeresDoor                                            ;A1EB98;
    dw $0020,$007F,$0000,$A800,$0000,$0000,$0000                         ;A1EB9A;
    dw EnemyHeaders_CeresDoor                                            ;A1EBA8;
    dw $01E0,$007F,$0001,$A800,$0000,$0001,$0000,$FFFF                   ;A1EBAA;
    db $00                                                               ;A1EBBA;

EnemyPopulations_CeresRidley_1:
    dw EnemyHeaders_CeresDoor                                            ;A1EBBB;
    dw $0010,$007F,$0003,$A800,$0000,$0003,$0000,$FFFF                   ;A1EBBD;
    db $00                                                               ;A1EBCD;

EnemyPopulations_Debug:
    dw $FFFF                                                             ;A1EBCE;
    db $00                                                               ;A1EBD0;

Freespace_BankA1_EBD1:                                                   ;A1EBD1;
; $142F bytes
