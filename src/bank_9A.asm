
org $9A8000


; Palette loaded when loading a save or demo. (although nothing is displayed during this time)
; Palettes for common sprites, beams and flashing enemies are loaded from here during door transition
Initial_Palette_BGPalette0:
    dw $14E0,$7FFF,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A                   ;9A8000;
    dw $6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A                   ;9A8010;

Initial_Palette_BGPalette1:
    dw $2003,$6F7B,$4E12,$2884,$0000,$6F7B,$209F,$2884                   ;9A8020;
    dw $0000,$4E31,$354C,$2884,$0000,$023F,$0198,$006F                   ;9A8030;

Initial_Palette_BGPalette2:
    dw $2003,$7FFF,$0000,$2FEF,$030D,$0209,$0145,$5EBB                   ;9A8040;
    dw $3DB3,$292E,$1486,$03BF,$025D,$0179,$0099,$6B5A                   ;9A8050;

Initial_Palette_BGPalette3:
    dw $0000,$7FFF,$0000,$031F,$01DA,$00F5,$0067,$0000                   ;9A8060;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$6B5A                   ;9A8070;

Initial_Palette_BGPalette4:
    dw $0000,$7FFF,$0000,$5C17,$380E,$1C07,$0C03,$26FA                   ;9A8080;
    dw $0E1A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A                   ;9A8090;

Initial_Palette_BGPalette5:
    dw $0000,$7FFF,$0000,$7290,$4D8B,$38E6,$1C62,$3F33                   ;9A80A0;
    dw $2E6D,$1D8A,$0D06,$0ED7,$01DD,$141F,$201F,$6B5A                   ;9A80B0;

Initial_Palette_BGPalette6:
    dw $0000,$7FFF,$0000,$02A0,$0940,$08E0,$0860,$0213                   ;9A80C0;
    dw $0150,$00A9,$0022,$0000,$0000,$0000,$0000,$6B5A                   ;9A80D0;

Initial_Palette_BGPalette7:
    dw $0000,$7FFF,$0000,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A                   ;9A80E0;
    dw $6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A,$6B5A                   ;9A80F0;

Initial_Palette_spritePalette0:
    dw $3800,$00CE,$00BB,$0C21,$3BE0,$318C,$263E,$5AD6                   ;9A8100;
    dw $4A52,$3BE0,$0074,$000D,$0173,$2108,$7E94,$7D08                   ;9A8110;

Initial_Palette_spritePalette1:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9A8120;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9A8130;

Initial_Palette_spritePalette2:
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9A8140;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9A8150;

Initial_Palette_spritePalette3:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9A8160;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9A8170;

Initial_Palette_spritePalette4:
    dw $3800,$00CE,$033F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9A8180;
    dw $3A4E,$00BB,$021B,$010E,$0216,$1104,$0074,$000D                   ;9A8190;

Initial_Palette_spritePalette5:
    dw $3800,$7F5A,$033B,$0216,$0113,$7C1D,$5814,$300A                   ;9A81A0;
    dw $3BE0,$2680,$1580,$5294,$39CE,$2108,$2484,$7D08                   ;9A81B0;

Initial_Palette_spritePalette6:
    dw $3800,$7F5A,$7EC0,$6DE0,$54E0,$7F6E,$730A,$6665                   ;9A81C0;
    dw $5E22,$7FA0,$7B60,$7720,$72A0,$6E60,$7F91,$0000                   ;9A81D0;

Initial_Palette_spritePalette7:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9A81E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9A81F0;

Tiles_GrappleBeam_Horizontal_Beam:
incbin "../data/Tiles_GrappleBeam_Horizontal_Beam.bin" ; $800 bytes

Tiles_GrappleBeam_Diagonal_Beam:
incbin "../data/Tiles_GrappleBeam_Diagonal_Beam.bin" ; $800 bytes

Tiles_GrappleBeam_Vertical_Beam:
incbin "../data/Tiles_GrappleBeam_Vertical_Beam.bin" ; $800 bytes

Tiles_NonClosed_ArmCannon_Vertical_0:
incbin "../data/Tiles_NonClosed_ArmCannon_Vertical_0.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_Vertical_1:
incbin "../data/Tiles_NonClosed_ArmCannon_Vertical_1.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_Vertical_2:
incbin "../data/Tiles_NonClosed_ArmCannon_Vertical_2.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_Horizontal_0:
incbin "../data/Tiles_NonClosed_ArmCannon_Horizontal_0.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_Horizontal_1:
incbin "../data/Tiles_NonClosed_ArmCannon_Horizontal_1.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_Horizontal_2:
incbin "../data/Tiles_NonClosed_ArmCannon_Horizontal_2.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_DownwardsDiagonal_0:
incbin "../data/Tiles_NonClosed_ArmCannon_DownwardsDiagonal_0.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_DownwardsDiagonal_1:
incbin "../data/Tiles_NonClosed_ArmCannon_DownwardsDiagonal_1.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_DownwardsDiagonal_2:
incbin "../data/Tiles_NonClosed_ArmCannon_DownwardsDiagonal_2.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_UpwardsDiagonal_0:
incbin "../data/Tiles_NonClosed_ArmCannon_UpwardsDiagonal_0.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_UpwardsDiagonal_1:
incbin "../data/Tiles_NonClosed_ArmCannon_UpwardsDiagonal_1.bin" ; $200 bytes

Tiles_NonClosed_ArmCannon_UpwardsDiagonal_2:
incbin "../data/Tiles_NonClosed_ArmCannon_UpwardsDiagonal_2.bin" ; $200 bytes

Tiles_Standard_BG3:
incbin "../data/Tiles_Standard_BG3.bin" ; $1000 bytes

Clear_BG2Tilemap:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC200;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC210;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC220;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC230;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC240;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC250;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC260;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC270;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC280;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC290;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC2A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC2B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC2C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC2D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC2E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC2F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC300;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC310;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC320;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC330;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC340;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC350;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC360;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC370;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC380;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC390;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC3A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC3B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC3C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC3D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC3E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC3F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC400;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC410;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC420;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC430;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC440;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC450;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC460;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC470;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC480;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC490;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC4A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC4B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC4C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC4D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC4E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC4F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC500;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC510;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC520;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC530;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC540;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC550;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC560;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC570;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC580;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC590;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC5A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC5B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC5C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC5D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC5E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC5F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC600;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC610;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC620;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC630;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC640;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC650;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC660;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC670;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC680;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC690;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC6A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC6B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC6C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC6D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC6E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC6F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC700;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC710;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC720;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC730;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC740;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC750;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC760;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC770;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC780;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC790;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC7A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC7B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC7C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC7D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC7E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC7F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC800;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC810;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC820;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC830;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC840;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC850;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC860;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC870;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC880;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC890;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC8A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC8B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC8C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC8D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC8E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC8F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC900;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC910;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC920;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC930;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC940;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC950;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC960;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC970;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC980;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC990;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC9A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC9B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC9C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC9D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC9E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AC9F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA00;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA10;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA20;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA30;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA40;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA50;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA60;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA70;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA80;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACA90;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACAA0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACAB0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACAC0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACAD0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACAE0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACAF0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB00;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB10;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB20;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB30;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB40;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB50;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB60;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB70;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB80;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACB90;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACBA0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACBB0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACBC0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACBD0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACBE0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACBF0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC00;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC10;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC20;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC30;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC40;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC50;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC60;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC70;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC80;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACC90;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACCA0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACCB0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACCC0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACCD0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACCE0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACCF0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD00;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD10;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD20;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD30;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD40;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD50;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD60;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD70;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD80;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACD90;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACDA0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACDB0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACDC0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACDD0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACDE0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACDF0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE00;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE10;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE20;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE30;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE40;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE50;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE60;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE70;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE80;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACE90;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACEA0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACEB0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACEC0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACED0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACEE0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACEF0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF00;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF10;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF20;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF30;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF40;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF50;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF60;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF70;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF80;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACF90;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACFA0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACFB0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACFC0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACFD0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACFE0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9ACFF0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD000;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD010;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD020;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD030;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD040;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD050;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD060;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD070;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD080;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD090;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD0A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD0B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD0C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD0D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD0E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD0F0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD100;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD110;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD120;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD130;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD140;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD150;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD160;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD170;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD180;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD190;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD1A0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD1B0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD1C0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD1D0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD1E0;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;9AD1F0;

Tiles_Standard_Sprite_0:
incbin "../data/Tiles_Standard_Sprite_0.bin" ; $1800 bytes

Tiles_Standard_Sprite_1:
incbin "../data/Tiles_Standard_Sprite_1.bin" ; $800 bytes

Tiles_PowerBeam:
incbin "../data/Tiles_PowerBeam.bin" ; $200 bytes

Tiles_IceBeam:
incbin "../data/Tiles_IceBeam.bin" ; $200 bytes

Tiles_WaveBeam:
incbin "../data/Tiles_WaveBeam.bin" ; $200 bytes

Tiles_PlasmaBeam:
incbin "../data/Tiles_PlasmaBeam.bin" ; $200 bytes

Tiles_Spazer:
incbin "../data/Tiles_Spazer.bin" ; $200 bytes

Standard_Target_Sprite_Palette_Line0:
    dw $0000,$7FFF,$77BD,$6B5A,$6318,$7FFF,$77BD,$6B5A                   ;9AFC00;
    dw $6318,$7FFF,$77BD,$6B5A,$6318,$7FFF,$77BD,$6B5A                   ;9AFC10;

Freespace_Bank9A_FC20:                                                   ;9AFC20;
; $3E0 bytes
