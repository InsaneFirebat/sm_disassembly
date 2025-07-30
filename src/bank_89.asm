
; Item graphics, palette blends, FX handler

org $898000


;;; $8000: Item PLM graphics - bombs ;;;
ItemPLMGFX_Bombs:
incbin "../data/ItemPLMGraphics_Bombs.bin" ; $100 bytes


;;; $8100: Item PLM graphics - gravity suit ;;;
ItemPLMGFX_GravitySuit:
incbin "../data/ItemPLMGraphics_GravitySuit.bin" ; $100 bytes


;;; $8200: Item PLM graphics - spring ball ;;;
ItemPLMGFX_SpringBall:
incbin "../data/ItemPLMGraphics_SpringBall.bin" ; $100 bytes


;;; $8300: Item PLM graphics - varia suit ;;;
ItemPLMGFX_VariaSuit:
incbin "../data/ItemPLMGraphics_VariaSuit.bin" ; $100 bytes


;;; $8400: Item PLM graphics - hi-jump ;;;
ItemPLMGFX_HiJumpBoots:
incbin "../data/ItemPLMGraphics_HiJumpBoots.bin" ; $100 bytes


;;; $8500: Item PLM graphics - screw attack ;;;
ItemPLMGFX_ScrewAttack:
incbin "../data/ItemPLMGraphics_ScrewAttack.bin" ; $100 bytes


;;; $8600: Item PLM graphics - space jump ;;;
ItemPLMGFX_SpaceJump:
incbin "../data/ItemPLMGraphics_SpaceJump.bin" ; $100 bytes


;;; $8700: Item PLM graphics - morph ball ;;;
ItemPLMGFX_MorphBall:
incbin "../data/ItemPLMGraphics_MorphBall.bin" ; $100 bytes


;;; $8800: Item PLM graphics - grapple beam ;;;
ItemPLMGFX_GrappleBeam:
incbin "../data/ItemPLMGraphics_GrappleBeam.bin" ; $100 bytes


;;; $8900: Item PLM graphics - x-ray scope ;;;
ItemPLMGFX_XrayScope:
incbin "../data/ItemPLMGraphics_XrayScope.bin" ; $100 bytes


;;; $8A00: Item PLM graphics - speed booster ;;;
ItemPLMGFX_SpeedBooster:
incbin "../data/ItemPLMGraphics_SpeedBooster.bin" ; $100 bytes


;;; $8B00: Item PLM graphics - charge beam ;;;
ItemPLMGFX_ChargeBeam:
incbin "../data/ItemPLMGraphics_ChargeBeam.bin" ; $100 bytes


;;; $8C00: Item PLM graphics - ice beam ;;;
ItemPLMGFX_IceBeam:
incbin "../data/ItemPLMGraphics_IceBeam.bin" ; $100 bytes


;;; $8D00: Item PLM graphics - wave beam ;;;
ItemPLMGFX_WaveBeam:
incbin "../data/ItemPLMGraphics_WaveBeam.bin" ; $100 bytes


;;; $8E00: Item PLM graphics - plasma beam ;;;
ItemPLMGFX_PlasmaBeam:
incbin "../data/ItemPLMGraphics_PlasmaBeam.bin" ; $100 bytes


;;; $8F00: Item PLM graphics - spazer beam ;;;
ItemPLMGFX_Spazer:
incbin "../data/ItemPLMGraphics_Spazer.bin" ; $100 bytes


;;; $9000: Item PLM graphics - reserve tank ;;;
ItemPLMGFX_ReserveTank:
incbin "../data/ItemPLMGraphics_ReserveTank.bin" ; $100 bytes


;;; $9100: Zeros ;;;
Freespace_Bank89_9100:
; $700 zero bytes
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899100;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899110;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899120;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899130;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899140;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899150;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899160;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899170;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899180;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899190;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8991A0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8991B0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8991C0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8991D0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8991E0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8991F0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899200;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899210;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899220;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899230;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899240;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899250;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899260;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899270;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899280;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899290;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8992A0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8992B0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8992C0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8992D0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8992E0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8992F0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899300;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899310;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899320;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899330;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899340;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899350;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899360;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899370;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899380;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899390;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8993A0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8993B0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8993C0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8993D0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8993E0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8993F0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899400;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899410;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899420;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899430;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899440;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899450;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899460;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899470;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899480;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899490;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8994A0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8994B0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8994C0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8994D0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8994E0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8994F0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899500;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899510;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899520;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899530;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899540;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899550;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899560;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899570;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899580;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899590;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8995A0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8995B0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8995C0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8995D0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8995E0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8995F0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899600;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899610;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899620;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899630;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899640;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899650;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899660;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899670;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899680;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899690;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8996A0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8996B0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8996C0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8996D0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8996E0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8996F0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899700;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899710;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899720;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899730;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899740;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899750;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899760;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899770;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899780;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;899790;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8997A0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8997B0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8997C0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8997D0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8997E0;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8997F0;


;;; $9800: Indirect HDMA table - power bomb explosion window 2 left ;;;
IndirectHDMATable_PowerBombExplosionWindow2_Left_200below:
; Power bomb explosion origin is 200h pixels below the screen
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899800;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899803;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899806;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899809;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89980C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89980F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899812;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899815;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899818;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89981B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89981E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899821;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899824;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899827;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89982A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89982D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899830;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899833;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899836;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899839;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89983C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89983F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899842;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899845;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899848;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89984B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89984E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899851;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899854;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899857;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89985A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89985D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899860;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899863;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899866;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899869;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89986C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89986F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899872;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899875;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899878;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89987B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89987E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899881;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899884;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899887;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89988A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89988D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899890;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899893;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899896;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899899;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89989C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89989F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998A2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998A5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998A8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998AB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998AE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998B1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998B4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998B7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998BA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998BD;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998C0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998C3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998C6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998C9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998CC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998CF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998D2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998D5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998D8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998DB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998DE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998E1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998E4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998E7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998EA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998ED;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998F0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998F3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998F6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998F9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998FC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8998FF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899902;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899905;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899908;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89990B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89990E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899911;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899914;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899917;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89991A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89991D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899920;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899923;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899926;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899929;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89992C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89992F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899932;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899935;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899938;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89993B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89993E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899941;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899944;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899947;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89994A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89994D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899950;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899953;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899956;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899959;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89995C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89995F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899962;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899965;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899968;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89996B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89996E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899971;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899974;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899977;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89997A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89997D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899980;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899983;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899986;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899989;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89998C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89998F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899992;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899995;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899998;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89999B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89999E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999A1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999A4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999A7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999AA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999AD;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999B0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999B3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999B6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999B9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999BC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999BF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999C2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999C5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999C8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999CB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999CE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999D1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999D4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999D7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999DA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999DD;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999E0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999E3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999E6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999E9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999EC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999EF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999F2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999F5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999F8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999FB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;8999FE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A01;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A04;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A07;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A0A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A0D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A10;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A13;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A16;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A19;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A1C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A1F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A22;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A25;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A28;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A2B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A2E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A31;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A34;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A37;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A3A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A3D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A40;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A43;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A46;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A49;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A4C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A4F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A52;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A55;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A58;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A5B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A5E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A61;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A64;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A67;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A6A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A6D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A70;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A73;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A76;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A79;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A7C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A7F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A82;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A85;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A88;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A8B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A8E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A91;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A94;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A97;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A9A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899A9D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AA0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AA3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AA6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AA9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AAC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AAF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AB2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AB5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AB8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899ABB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899ABE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AC1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AC4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AC7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899ACA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899ACD;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AD0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AD3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AD6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AD9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899ADC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899ADF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AE2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AE5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AE8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AEB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AEE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AF1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AF4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AF7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AFA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899AFD;

IndirectHDMATable_PowerBombExplosionWindow2_Left_100below:
; Power bomb explosion origin is 100h pixels below the screen
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B00;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B03;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B06;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B09;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B0C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B0F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B12;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B15;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B18;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B1B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B1E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B21;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B24;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B27;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B2A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B2D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B30;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B33;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B36;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B39;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B3C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B3F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B42;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B45;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B48;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B4B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B4E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B51;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B54;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B57;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B5A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B5D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B60;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B63;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B66;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B69;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B6C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B6F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B72;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B75;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B78;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B7B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B7E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B81;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B84;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B87;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B8A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B8D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B90;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B93;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B96;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B99;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B9C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899B9F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BA2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BA5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BA8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BAB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BAE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BB1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BB4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BB7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BBA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;899BBD;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BF           ;899BC0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BE           ;899BC3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BD           ;899BC6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BC           ;899BC9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BB           ;899BCC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BA           ;899BCF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B9           ;899BD2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B8           ;899BD5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B7           ;899BD8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B6           ;899BDB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B5           ;899BDE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B4           ;899BE1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B3           ;899BE4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B2           ;899BE7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B1           ;899BEA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B0           ;899BED;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AF           ;899BF0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AE           ;899BF3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AD           ;899BF6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AC           ;899BF9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AB           ;899BFC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AA           ;899BFF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A9           ;899C02;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A8           ;899C05;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A7           ;899C08;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A6           ;899C0B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A5           ;899C0E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A4           ;899C11;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A3           ;899C14;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A2           ;899C17;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A1           ;899C1A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A0           ;899C1D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9F           ;899C20;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9E           ;899C23;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9D           ;899C26;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9C           ;899C29;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9B           ;899C2C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9A           ;899C2F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$99           ;899C32;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$98           ;899C35;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$97           ;899C38;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$96           ;899C3B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$95           ;899C3E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$94           ;899C41;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$93           ;899C44;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$92           ;899C47;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$91           ;899C4A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$90           ;899C4D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8F           ;899C50;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8E           ;899C53;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8D           ;899C56;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8C           ;899C59;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8B           ;899C5C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8A           ;899C5F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$89           ;899C62;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$88           ;899C65;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$87           ;899C68;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$86           ;899C6B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$85           ;899C6E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$84           ;899C71;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$83           ;899C74;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$82           ;899C77;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$81           ;899C7A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$80           ;899C7D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7F           ;899C80;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7E           ;899C83;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7D           ;899C86;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7C           ;899C89;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7B           ;899C8C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7A           ;899C8F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$79           ;899C92;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$78           ;899C95;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$77           ;899C98;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$76           ;899C9B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$75           ;899C9E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$74           ;899CA1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$73           ;899CA4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$72           ;899CA7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$71           ;899CAA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$70           ;899CAD;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6F           ;899CB0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6E           ;899CB3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6D           ;899CB6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6C           ;899CB9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6B           ;899CBC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6A           ;899CBF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$69           ;899CC2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$68           ;899CC5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$67           ;899CC8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$66           ;899CCB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$65           ;899CCE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$64           ;899CD1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$63           ;899CD4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$62           ;899CD7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$61           ;899CDA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$60           ;899CDD;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5F           ;899CE0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5E           ;899CE3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5D           ;899CE6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5C           ;899CE9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5B           ;899CEC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5A           ;899CEF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$59           ;899CF2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$58           ;899CF5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$57           ;899CF8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$56           ;899CFB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$55           ;899CFE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$54           ;899D01;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$53           ;899D04;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$52           ;899D07;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$51           ;899D0A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$50           ;899D0D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4F           ;899D10;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4E           ;899D13;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4D           ;899D16;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4C           ;899D19;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4B           ;899D1C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4A           ;899D1F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$49           ;899D22;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$48           ;899D25;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$47           ;899D28;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$46           ;899D2B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$45           ;899D2E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$44           ;899D31;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$43           ;899D34;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$42           ;899D37;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$41           ;899D3A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$40           ;899D3D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3F           ;899D40;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3E           ;899D43;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3D           ;899D46;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3C           ;899D49;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3B           ;899D4C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3A           ;899D4F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$39           ;899D52;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$38           ;899D55;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$37           ;899D58;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$36           ;899D5B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$35           ;899D5E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$34           ;899D61;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$33           ;899D64;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$32           ;899D67;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$31           ;899D6A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$30           ;899D6D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2F           ;899D70;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2E           ;899D73;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2D           ;899D76;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2C           ;899D79;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2B           ;899D7C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2A           ;899D7F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$29           ;899D82;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$28           ;899D85;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$27           ;899D88;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$26           ;899D8B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$25           ;899D8E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$24           ;899D91;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$23           ;899D94;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$22           ;899D97;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$21           ;899D9A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$20           ;899D9D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1F           ;899DA0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1E           ;899DA3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1D           ;899DA6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1C           ;899DA9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1B           ;899DAC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1A           ;899DAF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$19           ;899DB2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$18           ;899DB5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$17           ;899DB8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$16           ;899DBB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$15           ;899DBE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$14           ;899DC1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$13           ;899DC4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$12           ;899DC7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$11           ;899DCA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$10           ;899DCD;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$F            ;899DD0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$E            ;899DD3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$D            ;899DD6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$C            ;899DD9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B            ;899DDC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A            ;899DDF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+9             ;899DE2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+8             ;899DE5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+7             ;899DE8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+6             ;899DEB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+5             ;899DEE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+4             ;899DF1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+3             ;899DF4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+2             ;899DF7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+1             ;899DFA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable               ;899DFD;

IndirectHDMATable_PowerBombExplosionWindow2_Left_top:
; Power bomb explosion origin is at the top of the screen
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable               ;899E00;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+1             ;899E03;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+2             ;899E06;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+3             ;899E09;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+4             ;899E0C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+5             ;899E0F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+6             ;899E12;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+7             ;899E15;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+8             ;899E18;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+9             ;899E1B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A            ;899E1E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B            ;899E21;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$C            ;899E24;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$D            ;899E27;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$E            ;899E2A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$F            ;899E2D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$10           ;899E30;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$11           ;899E33;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$12           ;899E36;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$13           ;899E39;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$14           ;899E3C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$15           ;899E3F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$16           ;899E42;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$17           ;899E45;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$18           ;899E48;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$19           ;899E4B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1A           ;899E4E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1B           ;899E51;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1C           ;899E54;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1D           ;899E57;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1E           ;899E5A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$1F           ;899E5D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$20           ;899E60;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$21           ;899E63;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$22           ;899E66;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$23           ;899E69;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$24           ;899E6C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$25           ;899E6F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$26           ;899E72;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$27           ;899E75;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$28           ;899E78;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$29           ;899E7B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2A           ;899E7E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2B           ;899E81;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2C           ;899E84;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2D           ;899E87;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2E           ;899E8A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$2F           ;899E8D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$30           ;899E90;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$31           ;899E93;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$32           ;899E96;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$33           ;899E99;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$34           ;899E9C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$35           ;899E9F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$36           ;899EA2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$37           ;899EA5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$38           ;899EA8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$39           ;899EAB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3A           ;899EAE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3B           ;899EB1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3C           ;899EB4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3D           ;899EB7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3E           ;899EBA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$3F           ;899EBD;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$40           ;899EC0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$41           ;899EC3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$42           ;899EC6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$43           ;899EC9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$44           ;899ECC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$45           ;899ECF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$46           ;899ED2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$47           ;899ED5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$48           ;899ED8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$49           ;899EDB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4A           ;899EDE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4B           ;899EE1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4C           ;899EE4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4D           ;899EE7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4E           ;899EEA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$4F           ;899EED;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$50           ;899EF0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$51           ;899EF3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$52           ;899EF6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$53           ;899EF9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$54           ;899EFC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$55           ;899EFF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$56           ;899F02;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$57           ;899F05;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$58           ;899F08;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$59           ;899F0B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5A           ;899F0E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5B           ;899F11;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5C           ;899F14;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5D           ;899F17;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5E           ;899F1A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$5F           ;899F1D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$60           ;899F20;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$61           ;899F23;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$62           ;899F26;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$63           ;899F29;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$64           ;899F2C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$65           ;899F2F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$66           ;899F32;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$67           ;899F35;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$68           ;899F38;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$69           ;899F3B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6A           ;899F3E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6B           ;899F41;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6C           ;899F44;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6D           ;899F47;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6E           ;899F4A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$6F           ;899F4D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$70           ;899F50;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$71           ;899F53;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$72           ;899F56;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$73           ;899F59;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$74           ;899F5C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$75           ;899F5F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$76           ;899F62;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$77           ;899F65;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$78           ;899F68;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$79           ;899F6B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7A           ;899F6E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7B           ;899F71;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7C           ;899F74;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7D           ;899F77;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7E           ;899F7A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$7F           ;899F7D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$80           ;899F80;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$81           ;899F83;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$82           ;899F86;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$83           ;899F89;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$84           ;899F8C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$85           ;899F8F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$86           ;899F92;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$87           ;899F95;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$88           ;899F98;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$89           ;899F9B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8A           ;899F9E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8B           ;899FA1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8C           ;899FA4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8D           ;899FA7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8E           ;899FAA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$8F           ;899FAD;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$90           ;899FB0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$91           ;899FB3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$92           ;899FB6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$93           ;899FB9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$94           ;899FBC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$95           ;899FBF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$96           ;899FC2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$97           ;899FC5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$98           ;899FC8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$99           ;899FCB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9A           ;899FCE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9B           ;899FD1;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9C           ;899FD4;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9D           ;899FD7;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9E           ;899FDA;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$9F           ;899FDD;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A0           ;899FE0;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A1           ;899FE3;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A2           ;899FE6;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A3           ;899FE9;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A4           ;899FEC;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A5           ;899FEF;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A6           ;899FF2;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A7           ;899FF5;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A8           ;899FF8;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$A9           ;899FFB;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AA           ;899FFE;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AB           ;89A001;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AC           ;89A004;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AD           ;89A007;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AE           ;89A00A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$AF           ;89A00D;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B0           ;89A010;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B1           ;89A013;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B2           ;89A016;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B3           ;89A019;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B4           ;89A01C;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B5           ;89A01F;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B6           ;89A022;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B7           ;89A025;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B8           ;89A028;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$B9           ;89A02B;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BA           ;89A02E;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BB           ;89A031;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BC           ;89A034;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BD           ;89A037;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BE           ;89A03A;
    db $81 : dw PowerBombExplosionWindow2LeftHDMADataTable+$BF           ;89A03D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A040;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A043;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A046;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A049;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A04C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A04F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A052;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A055;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A058;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A05B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A05E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A061;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A064;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A067;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A06A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A06D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A070;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A073;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A076;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A079;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A07C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A07F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A082;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A085;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A088;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A08B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A08E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A091;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A094;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A097;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A09A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A09D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0A0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0A3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0A6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0A9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0AC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0AF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0B2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0B5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0B8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0BB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0BE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0C1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0C4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0C7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0CA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0CD;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0D0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0D3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0D6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0D9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0DC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0DF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0E2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0E5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0E8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0EB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0EE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0F1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0F4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0F7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0FA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable      ;89A0FD;
    db $00                                                               ;89A100;


;;; $A101: Indirect HDMA table - power bomb explosion window 2 right ;;;
IndirectHDMATable_PowerBombExplosionWindow2_Right_200below:
; Power bomb explosion origin is 200h pixels below the screen
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A101;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A104;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A107;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A10A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A10D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A110;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A113;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A116;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A119;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A11C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A11F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A122;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A125;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A128;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A12B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A12E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A131;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A134;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A137;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A13A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A13D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A140;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A143;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A146;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A149;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A14C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A14F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A152;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A155;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A158;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A15B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A15E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A161;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A164;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A167;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A16A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A16D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A170;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A173;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A176;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A179;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A17C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A17F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A182;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A185;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A188;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A18B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A18E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A191;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A194;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A197;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A19A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A19D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1A0;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1A3;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1A6;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1A9;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1AC;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1AF;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1B2;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1B5;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1B8;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1BB;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1BE;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1C1;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1C4;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1C7;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1CA;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1CD;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1D0;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1D3;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1D6;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1D9;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1DC;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1DF;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1E2;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1E5;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1E8;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1EB;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1EE;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1F1;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1F4;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1F7;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1FA;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A1FD;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A200;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A203;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A206;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A209;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A20C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A20F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A212;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A215;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A218;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A21B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A21E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A221;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A224;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A227;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A22A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A22D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A230;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A233;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A236;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A239;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A23C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A23F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A242;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A245;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A248;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A24B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A24E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A251;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A254;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A257;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A25A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A25D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A260;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A263;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A266;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A269;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A26C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A26F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A272;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A275;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A278;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A27B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A27E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A281;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A284;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A287;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A28A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A28D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A290;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A293;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A296;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A299;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A29C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A29F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2A2;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2A5;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2A8;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2AB;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2AE;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2B1;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2B4;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2B7;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2BA;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2BD;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2C0;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2C3;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2C6;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2C9;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2CC;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2CF;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2D2;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2D5;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2D8;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2DB;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2DE;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2E1;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2E4;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2E7;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2EA;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2ED;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2F0;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2F3;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2F6;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2F9;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2FC;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A2FF;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A302;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A305;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A308;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A30B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A30E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A311;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A314;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A317;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A31A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A31D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A320;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A323;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A326;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A329;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A32C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A32F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A332;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A335;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A338;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A33B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A33E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A341;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A344;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A347;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A34A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A34D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A350;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A353;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A356;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A359;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A35C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A35F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A362;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A365;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A368;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A36B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A36E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A371;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A374;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A377;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A37A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A37D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A380;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A383;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A386;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A389;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A38C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A38F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A392;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A395;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A398;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A39B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A39E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3A1;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3A4;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3A7;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3AA;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3AD;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3B0;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3B3;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3B6;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3B9;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3BC;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3BF;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3C2;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3C5;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3C8;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3CB;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3CE;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3D1;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3D4;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3D7;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3DA;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3DD;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3E0;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3E3;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3E6;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3E9;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3EC;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3EF;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3F2;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3F5;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3F8;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3FB;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A3FE;

IndirectHDMATable_PowerBombExplosionWindow2_Right_100below:
; Power bomb explosion origin is 100h pixels below the screen
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A401;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A404;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A407;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A40A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A40D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A410;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A413;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A416;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A419;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A41C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A41F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A422;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A425;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A428;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A42B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A42E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A431;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A434;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A437;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A43A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A43D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A440;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A443;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A446;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A449;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A44C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A44F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A452;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A455;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A458;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A45B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A45E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A461;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A464;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A467;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A46A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A46D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A470;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A473;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A476;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A479;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A47C;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A47F;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A482;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A485;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A488;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A48B;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A48E;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A491;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A494;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A497;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A49A;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A49D;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4A0;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4A3;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4A6;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4A9;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4AC;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4AF;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4B2;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4B5;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4B8;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4BB;
    db $81 : dw OffScreenPowerBombExplosionWindow2RightHDMADataTable     ;89A4BE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BF          ;89A4C1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BE          ;89A4C4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BD          ;89A4C7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BC          ;89A4CA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BB          ;89A4CD;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BA          ;89A4D0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B9          ;89A4D3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B8          ;89A4D6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B7          ;89A4D9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B6          ;89A4DC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B5          ;89A4DF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B4          ;89A4E2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B3          ;89A4E5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B2          ;89A4E8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B1          ;89A4EB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B0          ;89A4EE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AF          ;89A4F1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AE          ;89A4F4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AD          ;89A4F7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AC          ;89A4FA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AB          ;89A4FD;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AA          ;89A500;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A9          ;89A503;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A8          ;89A506;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A7          ;89A509;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A6          ;89A50C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A5          ;89A50F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A4          ;89A512;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A3          ;89A515;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A2          ;89A518;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A1          ;89A51B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A0          ;89A51E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9F          ;89A521;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9E          ;89A524;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9D          ;89A527;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9C          ;89A52A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9B          ;89A52D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9A          ;89A530;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$99          ;89A533;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$98          ;89A536;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$97          ;89A539;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$96          ;89A53C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$95          ;89A53F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$94          ;89A542;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$93          ;89A545;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$92          ;89A548;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$91          ;89A54B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$90          ;89A54E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8F          ;89A551;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8E          ;89A554;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8D          ;89A557;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8C          ;89A55A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8B          ;89A55D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8A          ;89A560;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$89          ;89A563;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$88          ;89A566;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$87          ;89A569;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$86          ;89A56C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$85          ;89A56F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$84          ;89A572;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$83          ;89A575;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$82          ;89A578;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$81          ;89A57B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$80          ;89A57E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7F          ;89A581;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7E          ;89A584;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7D          ;89A587;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7C          ;89A58A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7B          ;89A58D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7A          ;89A590;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$79          ;89A593;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$78          ;89A596;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$77          ;89A599;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$76          ;89A59C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$75          ;89A59F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$74          ;89A5A2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$73          ;89A5A5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$72          ;89A5A8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$71          ;89A5AB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$70          ;89A5AE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6F          ;89A5B1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6E          ;89A5B4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6D          ;89A5B7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6C          ;89A5BA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6B          ;89A5BD;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6A          ;89A5C0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$69          ;89A5C3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$68          ;89A5C6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$67          ;89A5C9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$66          ;89A5CC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$65          ;89A5CF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$64          ;89A5D2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$63          ;89A5D5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$62          ;89A5D8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$61          ;89A5DB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$60          ;89A5DE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5F          ;89A5E1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5E          ;89A5E4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5D          ;89A5E7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5C          ;89A5EA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5B          ;89A5ED;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5A          ;89A5F0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$59          ;89A5F3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$58          ;89A5F6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$57          ;89A5F9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$56          ;89A5FC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$55          ;89A5FF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$54          ;89A602;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$53          ;89A605;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$52          ;89A608;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$51          ;89A60B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$50          ;89A60E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4F          ;89A611;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4E          ;89A614;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4D          ;89A617;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4C          ;89A61A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4B          ;89A61D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4A          ;89A620;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$49          ;89A623;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$48          ;89A626;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$47          ;89A629;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$46          ;89A62C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$45          ;89A62F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$44          ;89A632;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$43          ;89A635;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$42          ;89A638;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$41          ;89A63B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$40          ;89A63E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3F          ;89A641;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3E          ;89A644;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3D          ;89A647;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3C          ;89A64A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3B          ;89A64D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3A          ;89A650;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$39          ;89A653;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$38          ;89A656;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$37          ;89A659;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$36          ;89A65C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$35          ;89A65F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$34          ;89A662;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$33          ;89A665;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$32          ;89A668;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$31          ;89A66B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$30          ;89A66E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2F          ;89A671;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2E          ;89A674;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2D          ;89A677;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2C          ;89A67A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2B          ;89A67D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2A          ;89A680;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$29          ;89A683;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$28          ;89A686;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$27          ;89A689;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$26          ;89A68C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$25          ;89A68F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$24          ;89A692;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$23          ;89A695;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$22          ;89A698;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$21          ;89A69B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$20          ;89A69E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1F          ;89A6A1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1E          ;89A6A4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1D          ;89A6A7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1C          ;89A6AA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1B          ;89A6AD;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1A          ;89A6B0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$19          ;89A6B3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$18          ;89A6B6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$17          ;89A6B9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$16          ;89A6BC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$15          ;89A6BF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$14          ;89A6C2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$13          ;89A6C5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$12          ;89A6C8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$11          ;89A6CB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$10          ;89A6CE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$F           ;89A6D1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$E           ;89A6D4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$D           ;89A6D7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$C           ;89A6DA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B           ;89A6DD;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A           ;89A6E0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+9            ;89A6E3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+8            ;89A6E6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+7            ;89A6E9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+6            ;89A6EC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+5            ;89A6EF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+4            ;89A6F2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+3            ;89A6F5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+2            ;89A6F8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+1            ;89A6FB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable              ;89A6FE;

IndirectHDMATable_PowerBombExplosionWindow2_Right_top:
; Power bomb explosion origin is at the top of the screen
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable              ;89A701;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+1            ;89A704;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+2            ;89A707;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+3            ;89A70A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+4            ;89A70D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+5            ;89A710;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+6            ;89A713;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+7            ;89A716;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+8            ;89A719;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+9            ;89A71C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A           ;89A71F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B           ;89A722;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$C           ;89A725;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$D           ;89A728;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$E           ;89A72B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$F           ;89A72E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$10          ;89A731;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$11          ;89A734;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$12          ;89A737;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$13          ;89A73A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$14          ;89A73D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$15          ;89A740;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$16          ;89A743;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$17          ;89A746;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$18          ;89A749;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$19          ;89A74C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1A          ;89A74F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1B          ;89A752;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1C          ;89A755;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1D          ;89A758;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1E          ;89A75B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$1F          ;89A75E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$20          ;89A761;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$21          ;89A764;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$22          ;89A767;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$23          ;89A76A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$24          ;89A76D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$25          ;89A770;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$26          ;89A773;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$27          ;89A776;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$28          ;89A779;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$29          ;89A77C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2A          ;89A77F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2B          ;89A782;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2C          ;89A785;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2D          ;89A788;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2E          ;89A78B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$2F          ;89A78E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$30          ;89A791;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$31          ;89A794;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$32          ;89A797;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$33          ;89A79A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$34          ;89A79D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$35          ;89A7A0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$36          ;89A7A3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$37          ;89A7A6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$38          ;89A7A9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$39          ;89A7AC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3A          ;89A7AF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3B          ;89A7B2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3C          ;89A7B5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3D          ;89A7B8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3E          ;89A7BB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$3F          ;89A7BE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$40          ;89A7C1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$41          ;89A7C4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$42          ;89A7C7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$43          ;89A7CA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$44          ;89A7CD;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$45          ;89A7D0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$46          ;89A7D3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$47          ;89A7D6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$48          ;89A7D9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$49          ;89A7DC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4A          ;89A7DF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4B          ;89A7E2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4C          ;89A7E5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4D          ;89A7E8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4E          ;89A7EB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$4F          ;89A7EE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$50          ;89A7F1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$51          ;89A7F4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$52          ;89A7F7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$53          ;89A7FA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$54          ;89A7FD;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$55          ;89A800;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$56          ;89A803;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$57          ;89A806;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$58          ;89A809;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$59          ;89A80C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5A          ;89A80F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5B          ;89A812;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5C          ;89A815;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5D          ;89A818;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5E          ;89A81B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$5F          ;89A81E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$60          ;89A821;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$61          ;89A824;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$62          ;89A827;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$63          ;89A82A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$64          ;89A82D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$65          ;89A830;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$66          ;89A833;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$67          ;89A836;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$68          ;89A839;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$69          ;89A83C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6A          ;89A83F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6B          ;89A842;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6C          ;89A845;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6D          ;89A848;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6E          ;89A84B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$6F          ;89A84E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$70          ;89A851;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$71          ;89A854;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$72          ;89A857;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$73          ;89A85A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$74          ;89A85D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$75          ;89A860;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$76          ;89A863;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$77          ;89A866;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$78          ;89A869;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$79          ;89A86C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7A          ;89A86F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7B          ;89A872;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7C          ;89A875;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7D          ;89A878;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7E          ;89A87B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$7F          ;89A87E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$80          ;89A881;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$81          ;89A884;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$82          ;89A887;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$83          ;89A88A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$84          ;89A88D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$85          ;89A890;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$86          ;89A893;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$87          ;89A896;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$88          ;89A899;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$89          ;89A89C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8A          ;89A89F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8B          ;89A8A2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8C          ;89A8A5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8D          ;89A8A8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8E          ;89A8AB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$8F          ;89A8AE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$90          ;89A8B1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$91          ;89A8B4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$92          ;89A8B7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$93          ;89A8BA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$94          ;89A8BD;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$95          ;89A8C0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$96          ;89A8C3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$97          ;89A8C6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$98          ;89A8C9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$99          ;89A8CC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9A          ;89A8CF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9B          ;89A8D2;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9C          ;89A8D5;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9D          ;89A8D8;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9E          ;89A8DB;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$9F          ;89A8DE;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A0          ;89A8E1;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A1          ;89A8E4;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A2          ;89A8E7;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A3          ;89A8EA;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A4          ;89A8ED;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A5          ;89A8F0;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A6          ;89A8F3;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A7          ;89A8F6;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A8          ;89A8F9;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$A9          ;89A8FC;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AA          ;89A8FF;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AB          ;89A902;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AC          ;89A905;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AD          ;89A908;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AE          ;89A90B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$AF          ;89A90E;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B0          ;89A911;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B1          ;89A914;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B2          ;89A917;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B3          ;89A91A;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B4          ;89A91D;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B5          ;89A920;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B6          ;89A923;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B7          ;89A926;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B8          ;89A929;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$B9          ;89A92C;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BA          ;89A92F;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BB          ;89A932;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BC          ;89A935;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BD          ;89A938;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BE          ;89A93B;
    db $81 : dw PowerBombExplosionWindow2RightHDMADataTable+$BF          ;89A93E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A941;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A944;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A947;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A94A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A94D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A950;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A953;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A956;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A959;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A95C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A95F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A962;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A965;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A968;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A96B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A96E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A971;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A974;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A977;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A97A;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A97D;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A980;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A983;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A986;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A989;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A98C;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A98F;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A992;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A995;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A998;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A99B;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A99E;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9A1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9A4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9A7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9AA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9AD;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9B0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9B3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9B6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9B9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9BC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9BF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9C2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9C5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9C8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9CB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9CE;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9D1;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9D4;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9D7;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9DA;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9DD;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9E0;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9E3;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9E6;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9E9;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9EC;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9EF;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9F2;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9F5;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9F8;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9FB;
    db $81 : dw OffScreenPowerBombExplosionWindow2LeftHDMADataTable+1    ;89A9FE;
    db $00                                                               ;89AA01;


;;; $AA02: Palette blends ;;;
; The palette blends are indices into this big palette table where 3 colours are selected

; Used palette blends:
;     2: Tourian acid/lava rooms
;     22h: Landing site before power bombs
;     42h: Yellow Maridia
;     48h: Water rooms
;     62h: Fog & rain, Crateria before Zebes awakens
;     E2h: Lower green/pink Maridia
;     E8h: Sandy Maridia
;     EEh: Upper green/pink Maridia

;                       0     2               8               Eh              14h             1Ah
PaletteBlends_Bank89_Color1:
    dw $0000                                                             ;89AA02;

PaletteBlends_Bank89_Color2:
    dw        $0E3F                                                      ;89AA04;

PaletteBlends_Bank89_Color3:                                             ;89AA06;
    dw              $0D7F,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000 ; 0

PaletteBlends_Bank89_20:                                                 ;89AA22;
    dw $3800, $314A,$20C6,$0820, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000 ; 20h

PaletteBlends_Bank89_40:                                                 ;89AA42;
    dw $3800, $0400,$1C63,$0000, $28E3,$1C60,$0000, $2485,$3D88,$0000, $0880,$0420,$0000, $28E3,$1C60,$0000 ; 40h

PaletteBlends_Bank89_60:                                                 ;89AA62;
    dw $3800, $20A5,$1C84,$1024, $1087,$14A8,$0844, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000 ; 60h

PaletteBlends_Bank89_80:                                                 ;89AA82;
    dw $3800, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000 ; 80h

PaletteBlends_Bank89_A0:                                                 ;89AAA2;
    dw $3800, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000 ; A0h

PaletteBlends_Bank89_C0:                                                 ;89AAC2;
    dw $3800, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000, $6318,$6318,$0000 ; C0h

PaletteBlends_Bank89_E0:                                                 ;89AAE2;
    dw $3800, $0400,$18A2,$0000, $0020,$0C62,$0000, $0400,$1C45,$0000, $6318,$6318,$0000, $6318,$6318,$0000 ; E0h


;;; $AB02: Load FX entry ;;;
Load_FX_Entry:
;; Parameters:
;;     A: FX entry index

; Called by Mother Brain
    PHP                                                                  ;89AB02;
    PHB                                                                  ;89AB03;
    REP #$30                                                             ;89AB04;
    AND.W #$0007                                                         ;89AB06;
    ASL                                                                  ;89AB09;
    ASL                                                                  ;89AB0A;
    ASL                                                                  ;89AB0B;
    ASL                                                                  ;89AB0C;
    STA.W FX_CurrentEntryOffset                                          ;89AB0D;
    CLC                                                                  ;89AB10;
    ADC.W FXPointer                                                      ;89AB11;
    STA.W FX_CurrentEntryPointer                                         ;89AB14;
    PEA.W FXHeaders>>8                                                    ;89AB17;
    PLB                                                                  ;89AB1A;
    PLB                                                                  ;89AB1B;
    LDX.W FX_CurrentEntryPointer                                         ;89AB1C;
    LDA.W $0002,X                                                        ;89AB1F;
    STA.W FX_BaseYPosition                                               ;89AB22;
    LDA.W $0004,X                                                        ;89AB25;
    STA.W FX_TargetYPosition                                             ;89AB28;
    LDA.W $0006,X                                                        ;89AB2B;
    STA.W FX_YSubVelocity                                                ;89AB2E;
    LDA.W $0008,X                                                        ;89AB31;
    AND.W #$00FF                                                         ;89AB34;
    STA.W FX_Timer                                                       ;89AB37;
    LDA.W $000A,X                                                        ;89AB3A;
    AND.W #$00FF                                                         ;89AB3D;
    STA.W LayerBlending_DefaultConfig                                    ;89AB40;
    LDA.W $000B,X                                                        ;89AB43;
    AND.W #$00FF                                                         ;89AB46;
    STA.W LayerBlending_Layer3Config                                     ;89AB49;
    LDA.W $000C,X                                                        ;89AB4C;
    AND.W #$00FF                                                         ;89AB4F;
    STA.W FX_LiquidOptions                                               ;89AB52;
    LDA.W $000F,X                                                        ;89AB55;
    AND.W #$00FF                                                         ;89AB58;
    BEQ .blend0                                                          ;89AB5B;
    TAX                                                                  ;89AB5D;
    LDA.L PaletteBlends_Bank89_Color1,X                                  ;89AB5E;
    STA.L Palettes_BG3P6FXPrimary                                        ;89AB62;
    LDA.L PaletteBlends_Bank89_Color2,X                                  ;89AB66;
    STA.L Palettes_BG3P6FXSecondary                                      ;89AB6A;
    LDA.L PaletteBlends_Bank89_Color3,X                                  ;89AB6E;
    STA.L Palettes_BG3P6FXBackground                                     ;89AB72;
    BRA .return                                                          ;89AB76;

  .blend0:
    LDA.W #$0000                                                         ;89AB78;
    STA.L Palettes_BG3P6FXBackground                                     ;89AB7B;

  .return:
    PLB                                                                  ;89AB7F;
    PLP                                                                  ;89AB80;
    RTL                                                                  ;89AB81;


;;; $AB82: Load FX header ;;;
Load_FX_Header:
    PHP                                                                  ;89AB82;
    PHB                                                                  ;89AB83;
    REP #$30                                                             ;89AB84;
    PEA.W FXHeaders>>8                                                   ;89AB86;
    PLB                                                                  ;89AB89;
    PLB                                                                  ;89AB8A;
    LDX.W FXPointer                                                      ;89AB8B;
    BNE +                                                                ;89AB8E;
    PLB                                                                  ;89AB90;
    PLP                                                                  ;89AB91;
    RTL                                                                  ;89AB92;

+   LDA.W $0000,X                                                        ;89AB93;
    LDY.W #$0000                                                         ;89AB96;

  .loopDoor:
    LDA.W $0000,X                                                        ;89AB99;
    BEQ .load                                                            ;89AB9C;
    CMP.W #$FFFF                                                         ;89AB9E;
    BNE +                                                                ;89ABA1;
    PLB                                                                  ;89ABA3;
    PLP                                                                  ;89ABA4;
    RTL                                                                  ;89ABA5;

+   CMP.W DoorPointer                                                    ;89ABA6;
    BEQ .load                                                            ;89ABA9;
    TXA                                                                  ;89ABAB;
    CLC                                                                  ;89ABAC;
    ADC.W #$0010                                                         ;89ABAD;
    TAX                                                                  ;89ABB0;
    TYA                                                                  ;89ABB1;
    CLC                                                                  ;89ABB2;
    ADC.W #$0010                                                         ;89ABB3;
    TAY                                                                  ;89ABB6;
    BRA .loopDoor                                                        ;89ABB7;

  .load:
    STY.W FX_CurrentEntryOffset                                          ;89ABB9;
    STX.W FX_CurrentEntryPointer                                         ;89ABBC;
    LDX.W FX_CurrentEntryPointer                                         ;89ABBF;
    LDA.W $0002,X                                                        ;89ABC2;
    STA.W FX_BaseYPosition                                               ;89ABC5;
    LDA.W $0004,X                                                        ;89ABC8;
    STA.W FX_TargetYPosition                                             ;89ABCB;
    LDA.W $0006,X                                                        ;89ABCE;
    STA.W FX_YSubVelocity                                                ;89ABD1;
    LDA.W $0008,X                                                        ;89ABD4;
    AND.W #$00FF                                                         ;89ABD7;
    STA.W FX_Timer                                                       ;89ABDA;
    LDA.W $000A,X                                                        ;89ABDD;
    AND.W #$00FF                                                         ;89ABE0;
    STA.W LayerBlending_DefaultConfig                                    ;89ABE3;
    LDA.W $000B,X                                                        ;89ABE6;
    AND.W #$00FF                                                         ;89ABE9;
    STA.W LayerBlending_Layer3Config                                     ;89ABEC;
    LDA.W $000C,X                                                        ;89ABEF;
    AND.W #$00FF                                                         ;89ABF2;
    STA.W FX_LiquidOptions                                               ;89ABF5;
    LDA.W $000F,X                                                        ;89ABF8;
    AND.W #$00FF                                                         ;89ABFB;
    BEQ .blend0                                                          ;89ABFE;
    TAX                                                                  ;89AC00;
    LDA.L PaletteBlends_Bank89_Color1,X                                  ;89AC01;
    STA.L TargetPalettes_BGP1+$12                                        ;89AC05;
    LDA.L PaletteBlends_Bank89_Color2,X                                  ;89AC09;
    STA.L TargetPalettes_BGP1+$14                                        ;89AC0D;
    LDA.L PaletteBlends_Bank89_Color3,X                                  ;89AC11;
    STA.L TargetPalettes_BGP1+$16                                        ;89AC15;
    BRA +                                                                ;89AC19;

  .blend0:
    LDA.W #$0000                                                         ;89AC1B;
    STA.L TargetPalettes_BGP1+$16                                        ;89AC1E;

+   LDX.W FX_CurrentEntryPointer                                         ;89AC22;
    LDA.W $0009,X                                                        ;89AC25;
    AND.W #$00FF                                                         ;89AC28;
    STA.W FX_Type                                                        ;89AC2B;
    BEQ +                                                                ;89AC2E;
    TAY                                                                  ;89AC30;
    LDA.W FXType_Tilemap_Pointers,Y                                      ;89AC31;
    STA.W FX_TilemapPointer                                              ;89AC34;

+   LDX.W FX_CurrentEntryPointer                                         ;89AC37;
    LDA.W $0009,X                                                        ;89AC3A;
    AND.W #$00FF                                                         ;89AC3D;
    BEQ .JMLreturn                                                       ;89AC40;
    TAY                                                                  ;89AC42;
    LDA.W #$8800                                                         ;89AC43;
    STA.B DP_Temp13                                                      ;89AC46;
    LDA.W FXType_Function_Pointers,Y                                     ;89AC48;
    STA.B DP_Temp12                                                      ;89AC4B;
    PHK                                                                  ;89AC4D;
    PEA.W .JMLreturn-1                                                   ;89AC4E;
    JML.W [DP_Temp12]                                                    ;89AC51;

  .JMLreturn:
    LDX.W FX_CurrentEntryPointer                                         ;89AC54;
    LDA.W $000D,X                                                        ;89AC57;
    AND.W #$00FF                                                         ;89AC5A;
    BEQ .paletteFXEnd                                                    ;89AC5D;
    STA.W FX_CurrentPaletteAnimatedTilesBitset                           ;89AC5F;
    LDA.W AreaIndex                                                      ;89AC62;
    ASL                                                                  ;89AC65;
    TAY                                                                  ;89AC66;
    LDA.W AreaSpecific_PaletteFXObjectList_Pointers,Y                    ;89AC67;
    STA.B DP_CurrentAreaFXAnimTilesObjTable                              ;89AC6A;
    LDY.W #$0000                                                         ;89AC6C;

  .loopPaletteFX:
    LSR.W FX_CurrentPaletteAnimatedTilesBitset                           ;89AC6F;
    BCS .spawnPaletteFX                                                  ;89AC72;
    INY                                                                  ;89AC74;
    INY                                                                  ;89AC75;
    CPY.W #$0010                                                         ;89AC76;
    BNE .loopPaletteFX                                                   ;89AC79;
    BRA .paletteFXEnd                                                    ;89AC7B;

  .spawnPaletteFX:
    LDA.B (DP_CurrentAreaFXAnimTilesObjTable),Y                          ;89AC7D;
    PHY                                                                  ;89AC7F;
    TAY                                                                  ;89AC80;
    JSL.L Spawn_PaletteFXObject                                          ;89AC81;
    PLY                                                                  ;89AC85;
    INY                                                                  ;89AC86;
    INY                                                                  ;89AC87;
    BRA .loopPaletteFX                                                   ;89AC88;

  .paletteFXEnd:
    LDX.W FX_CurrentEntryPointer                                         ;89AC8A;
    LDA.W $000E,X                                                        ;89AC8D;
    AND.W #$00FF                                                         ;89AC90;
    BEQ .return                                                          ;89AC93;
    STA.W FX_CurrentPaletteAnimatedTilesBitset                           ;89AC95;
    LDA.W AreaIndex                                                      ;89AC98;
    ASL                                                                  ;89AC9B;
    TAY                                                                  ;89AC9C;
    LDA.W AreaSpecific_AnimatedTilesObjectList_Pointers,Y                ;89AC9D;
    STA.B DP_CurrentAreaFXAnimTilesObjTable                              ;89ACA0;
    LDY.W #$0000                                                         ;89ACA2;

  .loopAnimatedTiles:
    LSR.W FX_CurrentPaletteAnimatedTilesBitset                           ;89ACA5;
    BCS .spawnAnimatedTiles                                              ;89ACA8;
    INY                                                                  ;89ACAA;
    INY                                                                  ;89ACAB;
    CPY.W #$0010                                                         ;89ACAC;
    BNE .loopAnimatedTiles                                               ;89ACAF;
    BRA .return                                                          ;89ACB1;

  .spawnAnimatedTiles:
    LDA.B (DP_CurrentAreaFXAnimTilesObjTable),Y                          ;89ACB3;
    PHY                                                                  ;89ACB5;
    TAY                                                                  ;89ACB6;
    JSL.L Spawn_AnimatedTilesObject                                      ;89ACB7;
    PLY                                                                  ;89ACBB;
    INY                                                                  ;89ACBC;
    INY                                                                  ;89ACBD;
    BRA .loopAnimatedTiles                                               ;89ACBE;

  .return:
    PLB                                                                  ;89ACC0;
    PLP                                                                  ;89ACC1;
    RTL                                                                  ;89ACC2;


;;; $ACC3: Room main ASM - Ceres elevator shaft ;;;
RoomMainASM_CeresElevatorShaft:
; Handles landing on elevator and setting mode 7 rotation matrix
    PHB                                                                  ;89ACC3;
    PHK                                                                  ;89ACC4;
    PLB                                                                  ;89ACC5;
    LDA.W CeresStatus                                                    ;89ACC6;
    BMI .rotating                                                        ;89ACC9;
    PLB                                                                  ;89ACCB;
    RTL                                                                  ;89ACCC;

  .rotating:
    LDA.W #$0080                                                         ;89ACCD;
    SEC                                                                  ;89ACD0;
    SBC.W #$0010                                                         ;89ACD1;
    CMP.W SamusXPosition                                                 ;89ACD4;
    BPL .handleRotationMatrix                                            ;89ACD7;
    LDA.W #$0080                                                         ;89ACD9;
    CLC                                                                  ;89ACDC;
    ADC.W #$0010                                                         ;89ACDD;
    CMP.W SamusXPosition                                                 ;89ACE0;
    BMI .handleRotationMatrix                                            ;89ACE3;
    LDA.W SamusYPosition                                                 ;89ACE5;
    CMP.W #$0080                                                         ;89ACE8;
    BPL .handleRotationMatrix                                            ;89ACEB;
    LDA.W SamusYPosition                                                 ;89ACED;
    CMP.W #$004B                                                         ;89ACF0;
    BMI .handleRotationMatrix                                            ;89ACF3;
    LDA.W SamusYSpeed                                                    ;89ACF5;
    BNE .handleRotationMatrix                                            ;89ACF8;
    LDA.W SamusYSubSpeed                                                 ;89ACFA;
    BNE .handleRotationMatrix                                            ;89ACFD;
    LDA.W GameState                                                      ;89ACFF;
    CMP.W #$0008                                                         ;89AD02;
    BNE .handleRotationMatrix                                            ;89AD05;
    LDA.W #$0002                                                         ;89AD07;
    JSL.L Run_Samus_Command                                              ;89AD0A;
    STZ.W ScreenFadeDelay                                                ;89AD0E;
    STZ.W ScreenFadeCounter                                              ;89AD11;
    LDA.W #$0020                                                         ;89AD14;
    STA.W GameState                                                      ;89AD17;

  .handleRotationMatrix:
    DEC.W RoomMainASMVar2                                                ;89AD1A;
    BPL .return                                                          ;89AD1D;
    LDA.W RoomMainASMVar1                                                ;89AD1F;
    ASL                                                                  ;89AD22;
    CLC                                                                  ;89AD23;
    ADC.W RoomMainASMVar1                                                ;89AD24;
    ASL                                                                  ;89AD27;
    TAX                                                                  ;89AD28;
    LDA.W .timer,X                                                       ;89AD29;
    STA.W RoomMainASMVar2                                                ;89AD2C;
    LDA.W .sinT,X                                                        ;89AD2F;
    STA.B DP_Mode7TransMatrixB                                           ;89AD32;
    EOR.W #$FFFF                                                         ;89AD34;
    INC                                                                  ;89AD37;
    STA.B DP_Mode7TransMatrixC                                           ;89AD38;
    LDA.W .cosT,X                                                        ;89AD3A;
    STA.B DP_Mode7TransMatrixA                                           ;89AD3D;
    STA.B DP_Mode7TransMatrixD                                           ;89AD3F;
    LDA.W RoomMainASMVar1                                                ;89AD41;
    BMI .decRotationMatrixIndex                                          ;89AD44;
    INC                                                                  ;89AD46;
    CMP.W #$0044                                                         ;89AD47;
    BNE .storeIndex                                                      ;89AD4A;
    ORA.W #$8000                                                         ;89AD4C;
    BRA .storeIndex                                                      ;89AD4F;

  .decRotationMatrixIndex:
    DEC                                                                  ;89AD51;
    CMP.W #$8000                                                         ;89AD52;
    BNE .storeIndex                                                      ;89AD55;
    LDA.W #$0000                                                         ;89AD57;

  .storeIndex:
    STA.W RoomMainASMVar1                                                ;89AD5A;

  .return:
    PLB                                                                  ;89AD5D;
    RTL                                                                  ;89AD5E;

;        _____________ Timer
;       |      _______ sin(t)
;       |     |      _ cos(t)
;       |     |     |
  .timer:
    dw $003C                                                             ;89AD5F;
  .sinT:
    dw       $FFDE                                                       ;89AD61;
  .cosT:
    dw             $00FE                                                 ;89AD63;
    dw $001A,$FFDF,$00FE
    dw $0018,$FFE0,$00FE
    dw $0016,$FFE1,$00FE
    dw $0014,$FFE2,$00FE
    dw $0012,$FFE3,$00FE
    dw $0010,$FFE4,$00FE
    dw $000E,$FFE5,$00FF
    dw $000C,$FFE6,$00FF
    dw $000B,$FFE7,$00FF
    dw $000A,$FFE8,$00FF
    dw $0009,$FFE9,$00FF
    dw $0008,$FFEA,$00FF
    dw $0007,$FFEB,$00FF
    dw $0007,$FFEC,$00FF
    dw $0006,$FFED,$00FF
    dw $0006,$FFEE,$00FF
    dw $0005,$FFEF,$00FF
    dw $0005,$FFF0,$0100
    dw $0004,$FFF1,$0100
    dw $0004,$FFF2,$0100
    dw $0004,$FFF3,$0100
    dw $0003,$FFF4,$0100
    dw $0003,$FFF5,$0100
    dw $0003,$FFF6,$0100
    dw $0003,$FFF7,$0100
    dw $0002,$FFF8,$0100
    dw $0002,$FFF9,$0100
    dw $0002,$FFFA,$0100
    dw $0002,$FFFB,$0100
    dw $0001,$FFFC,$0100
    dw $0001,$FFFD,$0100
    dw $0001,$FFFE,$0100
    dw $0001,$FFFF,$0100                        

  .initialEntry:
    dw $0001,$0000,$0100
    dw $0001,$0001,$0100
    dw $0001,$0002,$0100
    dw $0001,$0003,$0100
    dw $0001,$0004,$0100
    dw $0002,$0005,$0100
    dw $0002,$0006,$0100
    dw $0002,$0007,$0100
    dw $0002,$0008,$0100
    dw $0003,$0009,$0100
    dw $0003,$000A,$0100
    dw $0003,$000B,$0100
    dw $0003,$000C,$0100
    dw $0004,$000D,$0100
    dw $0004,$000E,$0100
    dw $0004,$000F,$0100
    dw $0005,$0010,$0100
    dw $0005,$0011,$00FF
    dw $0006,$0012,$00FF
    dw $0006,$0013,$00FF
    dw $0007,$0014,$00FF
    dw $0007,$0015,$00FF
    dw $0008,$0016,$00FF
    dw $0009,$0017,$00FF
    dw $000A,$0018,$00FF
    dw $000B,$0019,$00FF
    dw $000C,$001A,$00FF
    dw $000E,$001B,$00FF
    dw $0010,$001C,$00FE
    dw $0012,$001D,$00FE
    dw $0014,$001E,$00FE
    dw $0016,$001F,$00FE
    dw $0018,$0020,$00FE
    dw $001A,$0021,$00FE
    dw $003C,$0022,$00FE                                          


Freespace_Bank89_AEFD:                                                   ;89AEFD;
; $5103 bytes
