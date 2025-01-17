
org $8D8000


EnemyProjSpritemaps:
EnemyProjSpritemaps_Blank_Default:
    dw $0000,$0000                                                       ;8D8000;
    db $00                                                               ;8D8004;
    dw $00DF                                                             ;8D8005;

EnemyProjSpritemaps_EyeDoorProjectile_0:
    dw $0001,$C3F8                                                       ;8D8007;
    db $F8                                                               ;8D800B;
    dw $2A76                                                             ;8D800C;

EnemyProjSpritemaps_EyeDoorProjectile_1:
    dw $0001,$C3F8                                                       ;8D800E;
    db $F8                                                               ;8D8012;
    dw $2A78                                                             ;8D8013;

EnemyProjSpritemaps_EyeDoorProjectile_2:
    dw $0001,$C3F8                                                       ;8D8015;
    db $F8                                                               ;8D8019;
    dw $2A98                                                             ;8D801A;

EnemyProjSpritemaps_EyeDoorProjectile_3:
    dw $0001,$C3F8                                                       ;8D801C;
    db $F8                                                               ;8D8020;
    dw $2A9E                                                             ;8D8021;

EnemyProjSpritemaps_SkreeParticle:
    dw $0001,$01FC                                                       ;8D8023;
    db $FC                                                               ;8D8027;
    dw $2115                                                             ;8D8028;

EnemyProjSpritemaps_CrocomiresProjectile_0:
    dw $0004,$0000                                                       ;8D802A;
    db $F8                                                               ;8D802E;
    dw $70D0,$0000                                                       ;8D802F;
    db $00                                                               ;8D8033;
    dw $F0D0,$01F8                                                       ;8D8034;
    db $00                                                               ;8D8038;
    dw $B0D0,$01F8                                                       ;8D8039;
    db $F8                                                               ;8D803D;
    dw $30D0                                                             ;8D803E;

EnemyProjSpritemaps_CrocomiresProjectile_1:
    dw $0004,$0000                                                       ;8D8040;
    db $F8                                                               ;8D8044;
    dw $70D1,$0000                                                       ;8D8045;
    db $00                                                               ;8D8049;
    dw $F0D1,$01F8                                                       ;8D804A;
    db $00                                                               ;8D804E;
    dw $B0D1,$01F8                                                       ;8D804F;
    db $F8                                                               ;8D8053;
    dw $30D1                                                             ;8D8054;

EnemyProjSpritemaps_CrocomiresProjectile_2:
    dw $0004,$0000                                                       ;8D8056;
    db $00                                                               ;8D805A;
    dw $F0D2,$0000                                                       ;8D805B;
    db $F8                                                               ;8D805F;
    dw $70D2,$01F8                                                       ;8D8060;
    db $00                                                               ;8D8064;
    dw $B0D2,$01F8                                                       ;8D8065;
    db $F8                                                               ;8D8069;
    dw $30D2                                                             ;8D806A;

EnemyProjSpritemaps_CrocomiresProjectile_3:
    dw $0004,$0000                                                       ;8D806C;
    db $00                                                               ;8D8070;
    dw $F0D3,$0000                                                       ;8D8071;
    db $F8                                                               ;8D8075;
    dw $70D3,$01F8                                                       ;8D8076;
    db $00                                                               ;8D807A;
    dw $B0D3,$01F8                                                       ;8D807B;
    db $F8                                                               ;8D807F;
    dw $30D3                                                             ;8D8080;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_0_8D8082:
    dw $0004,$0000                                                       ;8D8082;
    db $00                                                               ;8D8086;
    dw $E3C2,$01F8                                                       ;8D8087;
    db $00                                                               ;8D808B;
    dw $A3C2,$0000                                                       ;8D808C;
    db $F8                                                               ;8D8090;
    dw $63C2,$01F8                                                       ;8D8091;
    db $F8                                                               ;8D8095;
    dw $23C2                                                             ;8D8096;

UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_1_8D8098:
    dw $0004,$0000                                                       ;8D8098;
    db $F8                                                               ;8D809C;
    dw $63D2,$0000                                                       ;8D809D;
    db $00                                                               ;8D80A1;
    dw $E3D2,$01F8                                                       ;8D80A2;
    db $00                                                               ;8D80A6;
    dw $A3D2,$01F8                                                       ;8D80A7;
    db $F8                                                               ;8D80AB;
    dw $23D2                                                             ;8D80AC;

UNUSED_EnemyProjSpritemaps_0_8D80AE:
    dw $0001,$01F8                                                       ;8D80AE;
    db $F8                                                               ;8D80B2;
    dw $3177                                                             ;8D80B3;

UNUSED_EnemyProjSpritemaps_1_8D80B5:
    dw $0001,$01F8                                                       ;8D80B5;
    db $F8                                                               ;8D80B9;
    dw $F17B                                                             ;8D80BA;

UNUSED_EnemyProjSpritemaps_2_8D80BC:
    dw $0001,$01F8                                                       ;8D80BC;
    db $F8                                                               ;8D80C0;
    dw $F177                                                             ;8D80C1;

UNUSED_EnemyProjSpritemaps_3_8D80C3:
    dw $0001,$01F8                                                       ;8D80C3;
    db $F8                                                               ;8D80C7;
    dw $317B                                                             ;8D80C8;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_RidleysFireball_0:
    dw $0001,$C3F8                                                       ;8D80CA;
    db $F8                                                               ;8D80CE;
    dw $31C8                                                             ;8D80CF;

EnemyProjSpritemaps_RidleysFireball_1:
    dw $0001,$C3F8                                                       ;8D80D1;
    db $F8                                                               ;8D80D5;
    dw $F1CA                                                             ;8D80D6;

EnemyProjSpritemaps_RidleysFireball_2:
    dw $0001,$C3F8                                                       ;8D80D8;
    db $F8                                                               ;8D80DC;
    dw $F1C8                                                             ;8D80DD;

EnemyProjSpritemaps_RidleysFireball_3:
    dw $0001,$C3F8                                                       ;8D80DF;
    db $F8                                                               ;8D80E3;
    dw $31CA                                                             ;8D80E4;

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0:
    dw $0001,$01FC                                                       ;8D80E6;
    db $FC                                                               ;8D80EA;
    dw $3A5F                                                             ;8D80EB;

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1:
    dw $0001,$C3F8                                                       ;8D80ED;
    db $F7                                                               ;8D80F1;
    dw $3A76                                                             ;8D80F2;

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2:
    dw $0001,$C3F8                                                       ;8D80F4;
    db $F6                                                               ;8D80F8;
    dw $3A78                                                             ;8D80F9;

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3:
    dw $0001,$C3F8                                                       ;8D80FB;
    db $F5                                                               ;8D80FF;
    dw $3A98                                                             ;8D8100;

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4:
    dw $0001,$C3F8                                                       ;8D8102;
    db $F4                                                               ;8D8106;
    dw $3A9E                                                             ;8D8107;

EnemyProjSpritemaps_CrocomiresBridgeCrumbling:
    dw $0001,$C3FC                                                       ;8D8109;
    db $FC                                                               ;8D810D;
    dw $21CC                                                             ;8D810E;

EnemyProjSpritemaps_CrocomiresSpikeWallPieces:
    dw $0002,$C208                                                       ;8D8110;
    db $F8                                                               ;8D8114;
    dw $27EE,$C3F8                                                       ;8D8115;
    db $F8                                                               ;8D8119;
    dw $65CC                                                             ;8D811A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D811C:
    dw $0004,$0000                                                       ;8D811C;
    db $00                                                               ;8D8120;
    dw $21F1,$01F8                                                       ;8D8121;
    db $00                                                               ;8D8125;
    dw $21F0,$0000                                                       ;8D8126;
    db $F8                                                               ;8D812A;
    dw $21E1,$01F8                                                       ;8D812B;
    db $F8                                                               ;8D812F;
    dw $21E0                                                             ;8D8130;

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_0_8D8132:
    dw $0002,$0000                                                       ;8D8132;
    db $10                                                               ;8D8136;
    dw $61E0,$01F8                                                       ;8D8137;
    db $10                                                               ;8D813B;
    dw $21E0                                                             ;8D813C;

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_1_8D813E:
    dw $0006,$0004                                                       ;8D813E;
    db $08                                                               ;8D8142;
    dw $61DB,$0004                                                       ;8D8143;
    db $00                                                               ;8D8147;
    dw $61CB,$01FC                                                       ;8D8148;
    db $08                                                               ;8D814C;
    dw $21DC,$01F4                                                       ;8D814D;
    db $08                                                               ;8D8151;
    dw $21DB,$01FC                                                       ;8D8152;
    db $00                                                               ;8D8156;
    dw $21CC,$01F4                                                       ;8D8157;
    db $00                                                               ;8D815B;
    dw $21CB                                                             ;8D815C;

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_2_8D815E:
    dw $000C,$0000                                                       ;8D815E;
    db $F0                                                               ;8D8162;
    dw $61DF,$0008                                                       ;8D8163;
    db $F0                                                               ;8D8167;
    dw $61CF,$0000                                                       ;8D8168;
    db $00                                                               ;8D816C;
    dw $61DE,$0008                                                       ;8D816D;
    db $00                                                               ;8D8171;
    dw $61DD,$0000                                                       ;8D8172;
    db $F8                                                               ;8D8176;
    dw $61CE,$0008                                                       ;8D8177;
    db $F8                                                               ;8D817B;
    dw $61CD,$01F8                                                       ;8D817C;
    db $F0                                                               ;8D8180;
    dw $21DF,$01F0                                                       ;8D8181;
    db $F0                                                               ;8D8185;
    dw $21CF,$01F8                                                       ;8D8186;
    db $00                                                               ;8D818A;
    dw $21DE,$01F0                                                       ;8D818B;
    db $00                                                               ;8D818F;
    dw $21DD,$01F8                                                       ;8D8190;
    db $F8                                                               ;8D8194;
    dw $21CE,$01F0                                                       ;8D8195;
    db $F8                                                               ;8D8199;
    dw $21CD                                                             ;8D819A;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_PhantoonFlames_0:
    dw $0002,$C3F8                                                       ;8D819C;
    db $00                                                               ;8D81A0;
    dw $3F06,$C3F8                                                       ;8D81A1;
    db $F0                                                               ;8D81A5;
    dw $3F00                                                             ;8D81A6;

EnemyProjSpritemaps_PhantoonFlames_1:
    dw $0002,$C3F8                                                       ;8D81A8;
    db $00                                                               ;8D81AC;
    dw $3F08,$C3F8                                                       ;8D81AD;
    db $F0                                                               ;8D81B1;
    dw $3F02                                                             ;8D81B2;

EnemyProjSpritemaps_PhantoonFlames_2:
    dw $0002,$C3F8                                                       ;8D81B4;
    db $00                                                               ;8D81B8;
    dw $3F0A,$C3F8                                                       ;8D81B9;
    db $F0                                                               ;8D81BD;
    dw $3F04                                                             ;8D81BE;

EnemyProjSpritemaps_PhantoonFlames_3:
    dw $0002,$C200                                                       ;8D81C0;
    db $F8                                                               ;8D81C4;
    dw $3F0E,$C3F0                                                       ;8D81C5;
    db $F8                                                               ;8D81C9;
    dw $3F0C                                                             ;8D81CA;

EnemyProjSpritemaps_PhantoonFlames_4:
    dw $0002,$C3F8                                                       ;8D81CC;
    db $FE                                                               ;8D81D0;
    dw $3F28,$C3F8                                                       ;8D81D1;
    db $EE                                                               ;8D81D5;
    dw $3F20                                                             ;8D81D6;

EnemyProjSpritemaps_PhantoonFlames_5:
    dw $0002,$C3F8                                                       ;8D81D8;
    db $FC                                                               ;8D81DC;
    dw $3F2A,$C3F8                                                       ;8D81DD;
    db $EC                                                               ;8D81E1;
    dw $3F22                                                             ;8D81E2;

EnemyProjSpritemaps_PhantoonFlames_6:
    dw $0002,$C3F8                                                       ;8D81E4;
    db $FA                                                               ;8D81E8;
    dw $3F2C,$C3F8                                                       ;8D81E9;
    db $EA                                                               ;8D81ED;
    dw $3F24                                                             ;8D81EE;

EnemyProjSpritemaps_PhantoonFlames_7:
    dw $0002,$C3F8                                                       ;8D81F0;
    db $F8                                                               ;8D81F4;
    dw $3F2E,$C3F8                                                       ;8D81F5;
    db $E8                                                               ;8D81F9;
    dw $3F26                                                             ;8D81FA;

EnemyProjSpritemaps_PhantoonFlames_8:
    dw $0002,$C3F8                                                       ;8D81FC;
    db $F0                                                               ;8D8200;
    dw $3F00,$C3F8                                                       ;8D8201;
    db $00                                                               ;8D8205;
    dw $3F40                                                             ;8D8206;

EnemyProjSpritemaps_PhantoonFlames_9:
    dw $0002,$C3F8                                                       ;8D8208;
    db $F0                                                               ;8D820C;
    dw $3F02,$C3F8                                                       ;8D820D;
    db $00                                                               ;8D8211;
    dw $3F42                                                             ;8D8212;

EnemyProjSpritemaps_PhantoonFlames_A:
    dw $0002,$C3F8                                                       ;8D8214;
    db $F0                                                               ;8D8218;
    dw $3F04,$C3F8                                                       ;8D8219;
    db $00                                                               ;8D821D;
    dw $3F44                                                             ;8D821E;

EnemyProjSpritemaps_PhantoonStartingFlames_0:
    dw $0002,$C3F8                                                       ;8D8220;
    db $00                                                               ;8D8224;
    dw $3F46,$C3F8                                                       ;8D8225;
    db $F0                                                               ;8D8229;
    dw $3F00                                                             ;8D822A;

EnemyProjSpritemaps_PhantoonStartingFlames_1:
    dw $0002,$C3F8                                                       ;8D822C;
    db $00                                                               ;8D8230;
    dw $3F48,$C3F8                                                       ;8D8231;
    db $F0                                                               ;8D8235;
    dw $3F02                                                             ;8D8236;

EnemyProjSpritemaps_PhantoonStartingFlames_2:
    dw $0002,$C3F8                                                       ;8D8238;
    db $00                                                               ;8D823C;
    dw $3F4A,$C3F8                                                       ;8D823D;
    db $F0                                                               ;8D8241;
    dw $3F04                                                             ;8D8242;

EnemyProjSpritemaps_PhantoonStartingFlames_3:
    dw $0002,$C3F8                                                       ;8D8244;
    db $00                                                               ;8D8248;
    dw $3F4C,$C3F8                                                       ;8D8249;
    db $F0                                                               ;8D824D;
    dw $3F00                                                             ;8D824E;

EnemyProjSpritemaps_PhantoonStartingFlames_4:
    dw $0002,$C3F8                                                       ;8D8250;
    db $00                                                               ;8D8254;
    dw $3F4E,$C3F8                                                       ;8D8255;
    db $F0                                                               ;8D8259;
    dw $3F02                                                             ;8D825A;

EnemyProjSpritemaps_PhantoonStartingFlames_5:
    dw $0002,$C3F8                                                       ;8D825C;
    db $00                                                               ;8D8260;
    dw $3F4A,$C3F8                                                       ;8D8261;
    db $F0                                                               ;8D8265;
    dw $3F04                                                             ;8D8266;

EnemyProjSpritemaps_KraidRocks_KagoBugs:
    dw $0001,$81F8                                                       ;8D8268;
    db $F8                                                               ;8D826C;
    dw $31D0                                                             ;8D826D;

EnemyProjSpritemaps_KraidRisingRocks_Right:
    dw $0001,$01FC                                                       ;8D826F;
    db $FC                                                               ;8D8273;
    dw $31D2                                                             ;8D8274;

EnemyProjSpritemaps_MotherBrainOnionRings_0:
    dw $0001,$01FC                                                       ;8D8276;
    db $FC                                                               ;8D827A;
    dw $35AD                                                             ;8D827B;

EnemyProjSpritemaps_MotherBrainOnionRings_1:
    dw $0001,$C3F8                                                       ;8D827D;
    db $F8                                                               ;8D8281;
    dw $35A7                                                             ;8D8282;

EnemyProjSpritemaps_MotherBrainOnionRings_2:
    dw $0004,$C3FB                                                       ;8D8284;
    db $FB                                                               ;8D8288;
    dw $F5A9,$C3F5                                                       ;8D8289;
    db $FB                                                               ;8D828D;
    dw $B5A9,$C3FB                                                       ;8D828E;
    db $F5                                                               ;8D8292;
    dw $75A9,$C3F5                                                       ;8D8293;
    db $F5                                                               ;8D8297;
    dw $35A9                                                             ;8D8298;

EnemyProjSpritemaps_MotherBrainOnionRings_3:
    dw $0004,$C3FC                                                       ;8D829A;
    db $FC                                                               ;8D829E;
    dw $F5A9,$C3F4                                                       ;8D829F;
    db $FC                                                               ;8D82A3;
    dw $B5A9,$C3FC                                                       ;8D82A4;
    db $F4                                                               ;8D82A8;
    dw $75A9,$C3F4                                                       ;8D82A9;
    db $F4                                                               ;8D82AD;
    dw $35A9                                                             ;8D82AE;

EnemyProjSpritemaps_MotherBrainOnionRings_4:
    dw $0004,$C3FF                                                       ;8D82B0;
    db $FF                                                               ;8D82B4;
    dw $F5AB,$C3F1                                                       ;8D82B5;
    db $FF                                                               ;8D82B9;
    dw $B5AB,$C3FF                                                       ;8D82BA;
    db $F1                                                               ;8D82BE;
    dw $75AB,$C3F1                                                       ;8D82BF;
    db $F1                                                               ;8D82C3;
    dw $35AB                                                             ;8D82C4;

EnemyProjSpritemaps_MotherBrainOnionRings_5:
    dw $0004,$C200                                                       ;8D82C6;
    db $00                                                               ;8D82CA;
    dw $F5AB,$C3F0                                                       ;8D82CB;
    db $00                                                               ;8D82CF;
    dw $B5AB,$C200                                                       ;8D82D0;
    db $F0                                                               ;8D82D4;
    dw $75AB,$C3F0                                                       ;8D82D5;
    db $F0                                                               ;8D82D9;
    dw $35AB                                                             ;8D82DA;

EnemyProjSpritemaps_MotherBrainsBomb_0:
    dw $0002,$C3F8                                                       ;8D82DC;
    db $F8                                                               ;8D82E0;
    dw $35CE,$01FC                                                       ;8D82E1;
    db $FC                                                               ;8D82E5;
    dw $35AE                                                             ;8D82E6;

EnemyProjSpritemaps_MotherBrainsBomb_1:
    dw $0002,$C3F8                                                       ;8D82E8;
    db $F8                                                               ;8D82EC;
    dw $35CE,$01FC                                                       ;8D82ED;
    db $FC                                                               ;8D82F1;
    dw $35AF                                                             ;8D82F2;

EnemyProjSpritemaps_MotherBrainsBomb_2:
    dw $0002,$C3F8                                                       ;8D82F4;
    db $F8                                                               ;8D82F8;
    dw $35CE,$01FC                                                       ;8D82F9;
    db $FC                                                               ;8D82FD;
    dw $35BD                                                             ;8D82FE;

EnemyProjSpritemaps_MotherBrainsBomb_3:
    dw $0002,$C3F8                                                       ;8D8300;
    db $F8                                                               ;8D8304;
    dw $35CE,$01FC                                                       ;8D8305;
    db $FC                                                               ;8D8309;
    dw $35BE                                                             ;8D830A;

EnemyProjSpritemaps_MotherBrainsBomb_4:
    dw $0002,$C3F8                                                       ;8D830C;
    db $F8                                                               ;8D8310;
    dw $35CE,$01FC                                                       ;8D8311;
    db $FC                                                               ;8D8315;
    dw $35BF                                                             ;8D8316;

EnemyProjSpritemaps_MotherBrainsBomb_5:
    dw $0002,$C3F8                                                       ;8D8318;
    db $F8                                                               ;8D831C;
    dw $35CE,$01FC                                                       ;8D831D;
    db $FC                                                               ;8D8321;
    dw $75BF                                                             ;8D8322;

EnemyProjSpritemaps_MotherBrainsBomb_6:
    dw $0002,$C3F8                                                       ;8D8324;
    db $F8                                                               ;8D8328;
    dw $35CE,$01FC                                                       ;8D8329;
    db $FC                                                               ;8D832D;
    dw $75BE                                                             ;8D832E;

EnemyProjSpritemaps_MotherBrainsBomb_7:
    dw $0002,$C3F8                                                       ;8D8330;
    db $F8                                                               ;8D8334;
    dw $35CE,$01FC                                                       ;8D8335;
    db $FC                                                               ;8D8339;
    dw $75BD                                                             ;8D833A;

EnemyProjSpritemaps_MotherBrainsBomb_8:
    dw $0002,$C3F8                                                       ;8D833C;
    db $F8                                                               ;8D8340;
    dw $35CE,$01FC                                                       ;8D8341;
    db $FC                                                               ;8D8345;
    dw $75AF                                                             ;8D8346;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8D8348:
    dw $0001,$01FC                                                       ;8D8348;
    db $FC                                                               ;8D834C;
    dw $35E0                                                             ;8D834D;

UNUSED_EnemyProjSpritemaps_1_8D834F:
    dw $0001,$01FC                                                       ;8D834F;
    db $FC                                                               ;8D8353;
    dw $35E1                                                             ;8D8354;

UNUSED_EnemyProjSpritemaps_2_8D8356:
    dw $0001,$01FC                                                       ;8D8356;
    db $FC                                                               ;8D835A;
    dw $35E2                                                             ;8D835B;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_MotherBrainsRedBeam_0:
    dw $0001,$01FC                                                       ;8D835D;
    db $FC                                                               ;8D8361;
    dw $35E3                                                             ;8D8362;

EnemyProjSpritemaps_MotherBrainsRedBeam_1:
    dw $0001,$C3F8                                                       ;8D8364;
    db $F8                                                               ;8D8368;
    dw $35E4                                                             ;8D8369;

EnemyProjSpritemaps_MotherBrainsRedBeam_2:
    dw $0001,$C3F8                                                       ;8D836B;
    db $F8                                                               ;8D836F;
    dw $35E6                                                             ;8D8370;

EnemyProjSpritemaps_MotherBrainsRedBeam_3:
    dw $0001,$C3F8                                                       ;8D8372;
    db $F8                                                               ;8D8376;
    dw $35E8                                                             ;8D8377;

EnemyProjSpritemaps_MotherBrainsRedBeam_4:
    dw $0001,$C3F8                                                       ;8D8379;
    db $F8                                                               ;8D837D;
    dw $35EA                                                             ;8D837E;

EnemyProjSpritemaps_MotherBrainsRedBeam_5:
    dw $0001,$C3F8                                                       ;8D8380;
    db $F8                                                               ;8D8384;
    dw $35EC                                                             ;8D8385;

EnemyProjSpritemaps_MotherBrainsRedBeam_6:
    dw $0001,$C3F8                                                       ;8D8387;
    db $F8                                                               ;8D838B;
    dw $35EE                                                             ;8D838C;

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopRight:
    dw $0004,$C3FC                                                       ;8D838E;
    db $E8                                                               ;8D8392;
    dw $AF5E,$0000                                                       ;8D8393;
    db $F8                                                               ;8D8397;
    dw $2F51,$01F8                                                       ;8D8398;
    db $F8                                                               ;8D839C;
    dw $2F50,$C3F8                                                       ;8D839D;
    db $00                                                               ;8D83A1;
    dw $EF42                                                             ;8D83A2;

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopLeft:
    dw $0004,$C3F4                                                       ;8D83A4;
    db $E8                                                               ;8D83A8;
    dw $EF5E,$01F8                                                       ;8D83A9;
    db $F8                                                               ;8D83AD;
    dw $6F51,$0000                                                       ;8D83AE;
    db $F8                                                               ;8D83B2;
    dw $6F50,$C3F8                                                       ;8D83B3;
    db $00                                                               ;8D83B7;
    dw $AF42                                                             ;8D83B8;

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleLeft:
    dw $0007,$C3FA                                                       ;8D83BA;
    db $DC                                                               ;8D83BE;
    dw $AF5E,$C3F8                                                       ;8D83BF;
    db $1C                                                               ;8D83C3;
    dw $2F5E,$C3F8                                                       ;8D83C4;
    db $14                                                               ;8D83C8;
    dw $2F4E,$C3F8                                                       ;8D83C9;
    db $04                                                               ;8D83CD;
    dw $AF40,$C3F8                                                       ;8D83CE;
    db $F4                                                               ;8D83D2;
    dw $2F4B,$0000                                                       ;8D83D3;
    db $EC                                                               ;8D83D7;
    dw $2F6D,$01F8                                                       ;8D83D8;
    db $EC                                                               ;8D83DC;
    dw $2F6D                                                             ;8D83DD;

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleRight:
    dw $0007,$C3F6                                                       ;8D83DF;
    db $DC                                                               ;8D83E3;
    dw $EF5E,$C3F8                                                       ;8D83E4;
    db $1C                                                               ;8D83E8;
    dw $6F5E,$C3F8                                                       ;8D83E9;
    db $14                                                               ;8D83ED;
    dw $6F4E,$C3F8                                                       ;8D83EE;
    db $04                                                               ;8D83F2;
    dw $EF40,$C3F8                                                       ;8D83F3;
    db $F4                                                               ;8D83F7;
    dw $2F4B,$01F8                                                       ;8D83F8;
    db $EC                                                               ;8D83FC;
    dw $6F6D,$0000                                                       ;8D83FD;
    db $EC                                                               ;8D8401;
    dw $6F6D                                                             ;8D8402;

EnemyProjSpritemaps_AlcoonFireball_0:
    dw $0001,$01FC                                                       ;8D8404;
    db $FC                                                               ;8D8408;
    dw $212C                                                             ;8D8409;

EnemyProjSpritemaps_AlcoonFireball_1:
    dw $0001,$01FC                                                       ;8D840B;
    db $FC                                                               ;8D840F;
    dw $A12D                                                             ;8D8410;

EnemyProjSpritemaps_AlcoonFireball_2:
    dw $0001,$01FC                                                       ;8D8412;
    db $FC                                                               ;8D8416;
    dw $E12C                                                             ;8D8417;

EnemyProjSpritemaps_AlcoonFireball_3:
    dw $0001,$01FC                                                       ;8D8419;
    db $FC                                                               ;8D841D;
    dw $612D                                                             ;8D841E;

EnemyProjSpritemaps_MiniKraidSpit:
    dw $0001,$01FD                                                       ;8D8420;
    db $FD                                                               ;8D8424;
    dw $231F                                                             ;8D8425;

EnemyProjSpritemaps_MiniKraidSpikes_Left:
    dw $0001,$01FC                                                       ;8D8427;
    db $FC                                                               ;8D842B;
    dw $230F                                                             ;8D842C;

EnemyProjSpritemaps_MiniKraidSpikes_Right:
    dw $0001,$01FC                                                       ;8D842E;
    db $FC                                                               ;8D8432;
    dw $630F                                                             ;8D8433;

EnemyProjSpritemaps_MetareeParticle:
    dw $0001,$01FC                                                       ;8D8435;
    db $FC                                                               ;8D8439;
    dw $312B                                                             ;8D843A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8D343C:
    dw $0001,$C3F8                                                       ;8D843C;
    db $F8                                                               ;8D8440;
    dw $3A7C                                                             ;8D8441;

UNUSED_EnemyProjSpritemaps_1_8D3443:
    dw $0001,$C3F8                                                       ;8D8443;
    db $F6                                                               ;8D8447;
    dw $3A7E                                                             ;8D8448;

UNUSED_EnemyProjSpritemaps_2_8D344A:
    dw $0001,$C3F8                                                       ;8D844A;
    db $F4                                                               ;8D844E;
    dw $3A9A                                                             ;8D844F;

UNUSED_EnemyProjSpritemaps_3_8D3451:
    dw $0001,$C3F8                                                       ;8D8451;
    db $F2                                                               ;8D8455;
    dw $3A9C                                                             ;8D8456;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_KagoBugs_0:
    dw $0001,$01FC                                                       ;8D8458;
    db $FC                                                               ;8D845C;
    dw $2128                                                             ;8D845D;

EnemyProjSpritemaps_KagoBugs_1:
    dw $0001,$01FC                                                       ;8D845F;
    db $FC                                                               ;8D8463;
    dw $2129                                                             ;8D8464;

EnemyProjSpritemaps_KagoBugs_2:
    dw $0001,$01FC                                                       ;8D8466;
    db $FC                                                               ;8D846A;
    dw $212A                                                             ;8D846B;

EnemyProjSpritemaps_CeresElevatorPadLevelDataConcealer:
    dw $0004,$0008                                                       ;8D846D;
    db $FC                                                               ;8D8471;
    dw $3A20,$0000                                                       ;8D8472;
    db $FC                                                               ;8D8476;
    dw $3A20,$01F8                                                       ;8D8477;
    db $FC                                                               ;8D847B;
    dw $3A20,$01F0                                                       ;8D847C;
    db $FC                                                               ;8D8480;
    dw $3A20                                                             ;8D8481;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_0:
    dw $0001,$C3F8                                                       ;8D8483;
    db $F8                                                               ;8D8487;
    dw $3B68                                                             ;8D8488;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1:
    dw $0003,$C202                                                       ;8D848A;
    db $EE                                                               ;8D848E;
    dw $3B68,$C3F2                                                       ;8D848F;
    db $E6                                                               ;8D8493;
    dw $3B68,$C3FA                                                       ;8D8494;
    db $F6                                                               ;8D8498;
    dw $3B6A                                                             ;8D8499;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2:
    dw $0004,$C204                                                       ;8D849B;
    db $E4                                                               ;8D849F;
    dw $3B68,$C3F4                                                       ;8D84A0;
    db $E3                                                               ;8D84A4;
    dw $3B6A,$C204                                                       ;8D84A5;
    db $EB                                                               ;8D84A9;
    dw $3B6A,$C3FC                                                       ;8D84AA;
    db $F3                                                               ;8D84AE;
    dw $3B6C                                                             ;8D84AF;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_3:
    dw $0005,$C3FE                                                       ;8D84B1;
    db $D6                                                               ;8D84B5;
    dw $3B68,$C206                                                       ;8D84B6;
    db $E2                                                               ;8D84BA;
    dw $3B6A,$C3F6                                                       ;8D84BB;
    db $E0                                                               ;8D84BF;
    dw $3B6C,$C206                                                       ;8D84C0;
    db $E8                                                               ;8D84C4;
    dw $3B6C,$C3FE                                                       ;8D84C5;
    db $F0                                                               ;8D84C9;
    dw $3B6E                                                             ;8D84CA;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_4:
    dw $0005,$C200                                                       ;8D84CC;
    db $D4                                                               ;8D84D0;
    dw $3B6A,$C208                                                       ;8D84D1;
    db $E0                                                               ;8D84D5;
    dw $3B6C,$C208                                                       ;8D84D6;
    db $E5                                                               ;8D84DA;
    dw $3B6E,$C3F8                                                       ;8D84DB;
    db $DD                                                               ;8D84DF;
    dw $3B6E,$C200                                                       ;8D84E0;
    db $ED                                                               ;8D84E4;
    dw $3BE4                                                             ;8D84E5;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_5:
    dw $0004,$C202                                                       ;8D84E7;
    db $D2                                                               ;8D84EB;
    dw $3B6C,$C20A                                                       ;8D84EC;
    db $DE                                                               ;8D84F0;
    dw $3B6E,$C20A                                                       ;8D84F1;
    db $E2                                                               ;8D84F5;
    dw $3BE4,$C3FA                                                       ;8D84F6;
    db $DA                                                               ;8D84FA;
    dw $3BE4                                                             ;8D84FB;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_6:
    dw $0002,$C204                                                       ;8D84FD;
    db $D0                                                               ;8D8501;
    dw $3B6E,$C20C                                                       ;8D8502;
    db $DC                                                               ;8D8506;
    dw $3BE4                                                             ;8D8507;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_7:
    dw $0001,$C206                                                       ;8D8509;
    db $CE                                                               ;8D850D;
    dw $3BE4                                                             ;8D850E;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_8:
    dw $0001,$C3F8                                                       ;8D8510;
    db $F8                                                               ;8D8514;
    dw $3BC4                                                             ;8D8515;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_9:
    dw $0003,$C3FA                                                       ;8D8517;
    db $F6                                                               ;8D851B;
    dw $3BC6,$C202                                                       ;8D851C;
    db $EE                                                               ;8D8520;
    dw $3BC4,$C3F2                                                       ;8D8521;
    db $E6                                                               ;8D8525;
    dw $3BC4                                                             ;8D8526;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_A:
    dw $0004,$C3FC                                                       ;8D8528;
    db $F4                                                               ;8D852C;
    dw $3BC8,$C204                                                       ;8D852D;
    db $EC                                                               ;8D8531;
    dw $3BC6,$C3F4                                                       ;8D8532;
    db $E4                                                               ;8D8536;
    dw $3BC6,$C204                                                       ;8D8537;
    db $E4                                                               ;8D853B;
    dw $3BC4                                                             ;8D853C;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_B:
    dw $0005,$C3FE                                                       ;8D853E;
    db $F2                                                               ;8D8542;
    dw $3BCA,$C3F6                                                       ;8D8543;
    db $E2                                                               ;8D8547;
    dw $3BC8,$C206                                                       ;8D8548;
    db $E2                                                               ;8D854C;
    dw $3BC6,$C3FE                                                       ;8D854D;
    db $D6                                                               ;8D8551;
    dw $3BC4,$C206                                                       ;8D8552;
    db $EA                                                               ;8D8556;
    dw $3B6C                                                             ;8D8557;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_C:
    dw $0005,$C200                                                       ;8D8559;
    db $F0                                                               ;8D855D;
    dw $3BCC,$C208                                                       ;8D855E;
    db $E8                                                               ;8D8562;
    dw $3BCA,$C3F8                                                       ;8D8563;
    db $E0                                                               ;8D8567;
    dw $3BCA,$C208                                                       ;8D8568;
    db $E0                                                               ;8D856C;
    dw $3BC8,$C200                                                       ;8D856D;
    db $D4                                                               ;8D8571;
    dw $3BC6                                                             ;8D8572;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_D:
    dw $0004,$C3FA                                                       ;8D8574;
    db $DE                                                               ;8D8578;
    dw $3BCC,$C20A                                                       ;8D8579;
    db $E6                                                               ;8D857D;
    dw $3BCC,$C20A                                                       ;8D857E;
    db $DE                                                               ;8D8582;
    dw $3BCA,$C202                                                       ;8D8583;
    db $D2                                                               ;8D8587;
    dw $3BC8                                                             ;8D8588;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_E:
    dw $0002,$C20C                                                       ;8D858A;
    db $DC                                                               ;8D858E;
    dw $3BCC,$C204                                                       ;8D858F;
    db $D0                                                               ;8D8593;
    dw $3BCA                                                             ;8D8594;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_F:
    dw $0001,$C206                                                       ;8D8596;
    db $CE                                                               ;8D859A;
    dw $3BCC                                                             ;8D859B;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_10:
    dw $0006,$01FC                                                       ;8D859D;
    db $04                                                               ;8D85A1;
    dw $3BA1,$01F4                                                       ;8D85A2;
    db $04                                                               ;8D85A6;
    dw $3BA0,$0004                                                       ;8D85A7;
    db $04                                                               ;8D85AB;
    dw $3BA2,$0004                                                       ;8D85AC;
    db $FC                                                               ;8D85B0;
    dw $3B92,$0004                                                       ;8D85B1;
    db $F4                                                               ;8D85B5;
    dw $3B82,$C3F4                                                       ;8D85B6;
    db $F4                                                               ;8D85BA;
    dw $3B80                                                             ;8D85BB;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_11:
    dw $000A,$01F0                                                       ;8D85BD;
    db $F2                                                               ;8D85C1;
    dw $3BA1,$01E8                                                       ;8D85C2;
    db $F2                                                               ;8D85C6;
    dw $3BA0,$01F8                                                       ;8D85C7;
    db $F2                                                               ;8D85CB;
    dw $3BA2,$01F8                                                       ;8D85CC;
    db $EA                                                               ;8D85D0;
    dw $3B92,$01F8                                                       ;8D85D1;
    db $E2                                                               ;8D85D5;
    dw $3B82,$C3E8                                                       ;8D85D6;
    db $E2                                                               ;8D85DA;
    dw $3B80,$C204                                                       ;8D85DB;
    db $FE                                                               ;8D85DF;
    dw $3BA5,$C3F4                                                       ;8D85E0;
    db $FE                                                               ;8D85E4;
    dw $3BA3,$C204                                                       ;8D85E5;
    db $EE                                                               ;8D85E9;
    dw $3B85,$C3F4                                                       ;8D85EA;
    db $EE                                                               ;8D85EE;
    dw $3B83                                                             ;8D85EF;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_12:
    dw $000E,$0014                                                       ;8D85F1;
    db $F8                                                               ;8D85F5;
    dw $3BA1,$000C                                                       ;8D85F6;
    db $F8                                                               ;8D85FA;
    dw $3BA0,$001C                                                       ;8D85FB;
    db $F8                                                               ;8D85FF;
    dw $3BA2,$001C                                                       ;8D8600;
    db $F0                                                               ;8D8604;
    dw $3B92,$001C                                                       ;8D8605;
    db $E8                                                               ;8D8609;
    dw $3B82,$C20C                                                       ;8D860A;
    db $E8                                                               ;8D860E;
    dw $3B80,$C3F8                                                       ;8D860F;
    db $EC                                                               ;8D8613;
    dw $3BA5,$C3E8                                                       ;8D8614;
    db $EC                                                               ;8D8618;
    dw $3BA3,$C3F8                                                       ;8D8619;
    db $DC                                                               ;8D861D;
    dw $3B85,$C3E8                                                       ;8D861E;
    db $DC                                                               ;8D8622;
    dw $3B83,$C208                                                       ;8D8623;
    db $FC                                                               ;8D8627;
    dw $3BA9,$C3F8                                                       ;8D8628;
    db $FC                                                               ;8D862C;
    dw $3BA7,$C208                                                       ;8D862D;
    db $EC                                                               ;8D8631;
    dw $3B89,$C3F8                                                       ;8D8632;
    db $EC                                                               ;8D8636;
    dw $3B87                                                             ;8D8637;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_13:
    dw $000C,$C3FC                                                       ;8D8639;
    db $EA                                                               ;8D863D;
    dw $3BA9,$C3EC                                                       ;8D863E;
    db $EA                                                               ;8D8642;
    dw $3BA7,$C3FC                                                       ;8D8643;
    db $DA                                                               ;8D8647;
    dw $3B89,$C3EC                                                       ;8D8648;
    db $DA                                                               ;8D864C;
    dw $3B87,$C21C                                                       ;8D864D;
    db $F2                                                               ;8D8651;
    dw $3BA5,$C20C                                                       ;8D8652;
    db $F2                                                               ;8D8656;
    dw $3BA3,$C21C                                                       ;8D8657;
    db $E2                                                               ;8D865B;
    dw $3B85,$C20C                                                       ;8D865C;
    db $E2                                                               ;8D8660;
    dw $3B83,$C20C                                                       ;8D8661;
    db $FA                                                               ;8D8665;
    dw $3BAD,$C3FC                                                       ;8D8666;
    db $FA                                                               ;8D866A;
    dw $3BAB,$C20C                                                       ;8D866B;
    db $EA                                                               ;8D866F;
    dw $3B8D,$C3FC                                                       ;8D8670;
    db $EA                                                               ;8D8674;
    dw $3B8B                                                             ;8D8675;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_14:
    dw $000C,$C220                                                       ;8D8677;
    db $F0                                                               ;8D867B;
    dw $3BA9,$C210                                                       ;8D867C;
    db $F0                                                               ;8D8680;
    dw $3BA7,$C220                                                       ;8D8681;
    db $E0                                                               ;8D8685;
    dw $3B89,$C210                                                       ;8D8686;
    db $E0                                                               ;8D868A;
    dw $3B87,$C200                                                       ;8D868B;
    db $E8                                                               ;8D868F;
    dw $3BAD,$C3F0                                                       ;8D8690;
    db $E8                                                               ;8D8694;
    dw $3BAB,$C200                                                       ;8D8695;
    db $D8                                                               ;8D8699;
    dw $3B8D,$C3F0                                                       ;8D869A;
    db $D8                                                               ;8D869E;
    dw $3B8B,$C210                                                       ;8D869F;
    db $F8                                                               ;8D86A3;
    dw $3BE2,$C200                                                       ;8D86A4;
    db $F8                                                               ;8D86A8;
    dw $3BE0,$C210                                                       ;8D86A9;
    db $E8                                                               ;8D86AD;
    dw $3BC2,$C200                                                       ;8D86AE;
    db $E8                                                               ;8D86B2;
    dw $3BC0                                                             ;8D86B3;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_15:
    dw $0008,$C204                                                       ;8D86B5;
    db $E6                                                               ;8D86B9;
    dw $3BE2,$C3F4                                                       ;8D86BA;
    db $E6                                                               ;8D86BE;
    dw $3BE0,$C204                                                       ;8D86BF;
    db $D6                                                               ;8D86C3;
    dw $3BC2,$C3F4                                                       ;8D86C4;
    db $D6                                                               ;8D86C8;
    dw $3BC0,$C224                                                       ;8D86C9;
    db $EE                                                               ;8D86CD;
    dw $3BAD,$C214                                                       ;8D86CE;
    db $EE                                                               ;8D86D2;
    dw $3BAB,$C224                                                       ;8D86D3;
    db $DE                                                               ;8D86D7;
    dw $3B8D,$C214                                                       ;8D86D8;
    db $DE                                                               ;8D86DC;
    dw $3B8B                                                             ;8D86DD;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_16:
    dw $0004,$C228                                                       ;8D86DF;
    db $EC                                                               ;8D86E3;
    dw $3BE2,$C218                                                       ;8D86E4;
    db $EC                                                               ;8D86E8;
    dw $3BE0,$C228                                                       ;8D86E9;
    db $DC                                                               ;8D86ED;
    dw $3BC2,$C218                                                       ;8D86EE;
    db $DC                                                               ;8D86F2;
    dw $3BC0                                                             ;8D86F3;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_17:
    dw $0001,$C3F8                                                       ;8D86F5;
    db $F8                                                               ;8D86F9;
    dw $7B68                                                             ;8D86FA;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_18:
    dw $0003,$C3EE                                                       ;8D86FC;
    db $EE                                                               ;8D8700;
    dw $7B68,$C3FE                                                       ;8D8701;
    db $E6                                                               ;8D8705;
    dw $7B68,$C3F6                                                       ;8D8706;
    db $F6                                                               ;8D870A;
    dw $7B6A                                                             ;8D870B;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_19:
    dw $0004,$C3EC                                                       ;8D870D;
    db $E4                                                               ;8D8711;
    dw $7B68,$C3FC                                                       ;8D8712;
    db $E3                                                               ;8D8716;
    dw $7B6A,$C3EC                                                       ;8D8717;
    db $EB                                                               ;8D871B;
    dw $7B6A,$C3F4                                                       ;8D871C;
    db $F3                                                               ;8D8720;
    dw $7B6C                                                             ;8D8721;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1A:
    dw $0005,$C3F2                                                       ;8D8723;
    db $D6                                                               ;8D8727;
    dw $7B68,$C3EA                                                       ;8D8728;
    db $E2                                                               ;8D872C;
    dw $7B6A,$C3FA                                                       ;8D872D;
    db $E0                                                               ;8D8731;
    dw $7B6C,$C3EA                                                       ;8D8732;
    db $E8                                                               ;8D8736;
    dw $7B6C,$C3F2                                                       ;8D8737;
    db $F0                                                               ;8D873B;
    dw $7B6E                                                             ;8D873C;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1B:
    dw $0005,$C3F0                                                       ;8D873E;
    db $D4                                                               ;8D8742;
    dw $7B6A,$C3E8                                                       ;8D8743;
    db $E0                                                               ;8D8747;
    dw $7B6C,$C3E8                                                       ;8D8748;
    db $E5                                                               ;8D874C;
    dw $7B6E,$C3F8                                                       ;8D874D;
    db $DD                                                               ;8D8751;
    dw $7B6E,$C3F0                                                       ;8D8752;
    db $ED                                                               ;8D8756;
    dw $7BE4                                                             ;8D8757;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1C:
    dw $0004,$C3EE                                                       ;8D8759;
    db $D2                                                               ;8D875D;
    dw $7B6C,$C3E6                                                       ;8D875E;
    db $DE                                                               ;8D8762;
    dw $7B6E,$C3E6                                                       ;8D8763;
    db $E2                                                               ;8D8767;
    dw $7BE4,$C3F6                                                       ;8D8768;
    db $DA                                                               ;8D876C;
    dw $7BE4                                                             ;8D876D;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1D:
    dw $0002,$C3EC                                                       ;8D876F;
    db $D0                                                               ;8D8773;
    dw $7B6E,$C3E4                                                       ;8D8774;
    db $DC                                                               ;8D8778;
    dw $7BE4                                                             ;8D8779;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1E:
    dw $0001,$C3EA                                                       ;8D877B;
    db $CE                                                               ;8D877F;
    dw $7BE4                                                             ;8D8780;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1F:
    dw $0001,$C3F8                                                       ;8D8782;
    db $F8                                                               ;8D8786;
    dw $7BC4                                                             ;8D8787;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_20:
    dw $0003,$C3F6                                                       ;8D8789;
    db $F6                                                               ;8D878D;
    dw $7BC6,$C3EE                                                       ;8D878E;
    db $EE                                                               ;8D8792;
    dw $7BC4,$C3FE                                                       ;8D8793;
    db $E6                                                               ;8D8797;
    dw $7BC4                                                             ;8D8798;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_21:
    dw $0004,$C3F4                                                       ;8D879A;
    db $F4                                                               ;8D879E;
    dw $7BC8,$C3EC                                                       ;8D879F;
    db $EC                                                               ;8D87A3;
    dw $7BC6,$C3FC                                                       ;8D87A4;
    db $E4                                                               ;8D87A8;
    dw $7BC6,$C3EC                                                       ;8D87A9;
    db $E4                                                               ;8D87AD;
    dw $7BC4                                                             ;8D87AE;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_22:
    dw $0005,$C3F2                                                       ;8D87B0;
    db $F2                                                               ;8D87B4;
    dw $7BCA,$C3FA                                                       ;8D87B5;
    db $E2                                                               ;8D87B9;
    dw $7BC8,$C3EA                                                       ;8D87BA;
    db $E2                                                               ;8D87BE;
    dw $7BC6,$C3F2                                                       ;8D87BF;
    db $D6                                                               ;8D87C3;
    dw $7BC4,$C3EA                                                       ;8D87C4;
    db $EA                                                               ;8D87C8;
    dw $7B6C                                                             ;8D87C9;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_23:
    dw $0005,$C3F0                                                       ;8D87CB;
    db $F0                                                               ;8D87CF;
    dw $7BCC,$C3E8                                                       ;8D87D0;
    db $E8                                                               ;8D87D4;
    dw $7BCA,$C3F8                                                       ;8D87D5;
    db $E0                                                               ;8D87D9;
    dw $7BCA,$C3E8                                                       ;8D87DA;
    db $E0                                                               ;8D87DE;
    dw $7BC8,$C3F0                                                       ;8D87DF;
    db $D4                                                               ;8D87E3;
    dw $7BC6                                                             ;8D87E4;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_24:
    dw $0004,$C3F6                                                       ;8D87E6;
    db $DE                                                               ;8D87EA;
    dw $7BCC,$C3E6                                                       ;8D87EB;
    db $E6                                                               ;8D87EF;
    dw $7BCC,$C3E6                                                       ;8D87F0;
    db $DE                                                               ;8D87F4;
    dw $7BCA,$C3EE                                                       ;8D87F5;
    db $D2                                                               ;8D87F9;
    dw $7BC8                                                             ;8D87FA;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_25:
    dw $0002,$C3E4                                                       ;8D87FC;
    db $DC                                                               ;8D8800;
    dw $7BCC,$C3EC                                                       ;8D8801;
    db $D0                                                               ;8D8805;
    dw $7BCA                                                             ;8D8806;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_26:
    dw $0001,$C3EA                                                       ;8D8808;
    db $CE                                                               ;8D880C;
    dw $7BCC                                                             ;8D880D;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_27:
    dw $0006,$01FC                                                       ;8D880F;
    db $04                                                               ;8D8813;
    dw $7BA1,$0004                                                       ;8D8814;
    db $04                                                               ;8D8818;
    dw $7BA0,$01F4                                                       ;8D8819;
    db $04                                                               ;8D881D;
    dw $7BA2,$01F4                                                       ;8D881E;
    db $FC                                                               ;8D8822;
    dw $7B92,$01F4                                                       ;8D8823;
    db $F4                                                               ;8D8827;
    dw $7B82,$C3FC                                                       ;8D8828;
    db $F4                                                               ;8D882C;
    dw $7B80                                                             ;8D882D;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_28:
    dw $000A,$0008                                                       ;8D882F;
    db $F2                                                               ;8D8833;
    dw $7BA1,$0010                                                       ;8D8834;
    db $F2                                                               ;8D8838;
    dw $7BA0,$0000                                                       ;8D8839;
    db $F2                                                               ;8D883D;
    dw $7BA2,$0000                                                       ;8D883E;
    db $EA                                                               ;8D8842;
    dw $7B92,$0000                                                       ;8D8843;
    db $E2                                                               ;8D8847;
    dw $7B82,$C208                                                       ;8D8848;
    db $E2                                                               ;8D884C;
    dw $7B80,$C3EC                                                       ;8D884D;
    db $FE                                                               ;8D8851;
    dw $7BA5,$C3FC                                                       ;8D8852;
    db $FE                                                               ;8D8856;
    dw $7BA3,$C3EC                                                       ;8D8857;
    db $EE                                                               ;8D885B;
    dw $7B85,$C3FC                                                       ;8D885C;
    db $EE                                                               ;8D8860;
    dw $7B83                                                             ;8D8861;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_29:
    dw $000E,$01E4                                                       ;8D8863;
    db $F8                                                               ;8D8867;
    dw $7BA1,$01EC                                                       ;8D8868;
    db $F8                                                               ;8D886C;
    dw $7BA0,$01DC                                                       ;8D886D;
    db $F8                                                               ;8D8871;
    dw $7BA2,$01DC                                                       ;8D8872;
    db $F0                                                               ;8D8876;
    dw $7B92,$01DC                                                       ;8D8877;
    db $E8                                                               ;8D887B;
    dw $7B82,$C3E4                                                       ;8D887C;
    db $E8                                                               ;8D8880;
    dw $7B80,$C3F8                                                       ;8D8881;
    db $EC                                                               ;8D8885;
    dw $7BA5,$C208                                                       ;8D8886;
    db $EC                                                               ;8D888A;
    dw $7BA3,$C3F8                                                       ;8D888B;
    db $DC                                                               ;8D888F;
    dw $7B85,$C208                                                       ;8D8890;
    db $DC                                                               ;8D8894;
    dw $7B83,$C3E8                                                       ;8D8895;
    db $FC                                                               ;8D8899;
    dw $7BA9,$C3F8                                                       ;8D889A;
    db $FC                                                               ;8D889E;
    dw $7BA7,$C3E8                                                       ;8D889F;
    db $EC                                                               ;8D88A3;
    dw $7B89,$C3F8                                                       ;8D88A4;
    db $EC                                                               ;8D88A8;
    dw $7B87                                                             ;8D88A9;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2A:
    dw $000C,$C3F4                                                       ;8D88AB;
    db $EA                                                               ;8D88AF;
    dw $7BA9,$C204                                                       ;8D88B0;
    db $EA                                                               ;8D88B4;
    dw $7BA7,$C3F4                                                       ;8D88B5;
    db $DA                                                               ;8D88B9;
    dw $7B89,$C204                                                       ;8D88BA;
    db $DA                                                               ;8D88BE;
    dw $7B87,$C3D4                                                       ;8D88BF;
    db $F2                                                               ;8D88C3;
    dw $7BA5,$C3E4                                                       ;8D88C4;
    db $F2                                                               ;8D88C8;
    dw $7BA3,$C3D4                                                       ;8D88C9;
    db $E2                                                               ;8D88CD;
    dw $7B85,$C3E4                                                       ;8D88CE;
    db $E2                                                               ;8D88D2;
    dw $7B83,$C3E4                                                       ;8D88D3;
    db $FA                                                               ;8D88D7;
    dw $7BAD,$C3F4                                                       ;8D88D8;
    db $FA                                                               ;8D88DC;
    dw $7BAB,$C3E4                                                       ;8D88DD;
    db $EA                                                               ;8D88E1;
    dw $7B8D,$C3F4                                                       ;8D88E2;
    db $EA                                                               ;8D88E6;
    dw $7B8B                                                             ;8D88E7;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2B:
    dw $000C,$C3D0                                                       ;8D88E9;
    db $F0                                                               ;8D88ED;
    dw $7BA9,$C3E0                                                       ;8D88EE;
    db $F0                                                               ;8D88F2;
    dw $7BA7,$C3D0                                                       ;8D88F3;
    db $E0                                                               ;8D88F7;
    dw $7B89,$C3E0                                                       ;8D88F8;
    db $E0                                                               ;8D88FC;
    dw $7B87,$C3F0                                                       ;8D88FD;
    db $E8                                                               ;8D8901;
    dw $7BAD,$C200                                                       ;8D8902;
    db $E8                                                               ;8D8906;
    dw $7BAB,$C3F0                                                       ;8D8907;
    db $D8                                                               ;8D890B;
    dw $7B8D,$C200                                                       ;8D890C;
    db $D8                                                               ;8D8910;
    dw $7B8B,$C3E0                                                       ;8D8911;
    db $F8                                                               ;8D8915;
    dw $7BE2,$C3F0                                                       ;8D8916;
    db $F8                                                               ;8D891A;
    dw $7BE0,$C3E0                                                       ;8D891B;
    db $E8                                                               ;8D891F;
    dw $7BC2,$C3F0                                                       ;8D8920;
    db $E8                                                               ;8D8924;
    dw $7BC0                                                             ;8D8925;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2C:
    dw $0008,$C3EC                                                       ;8D8927;
    db $E6                                                               ;8D892B;
    dw $7BE2,$C3FC                                                       ;8D892C;
    db $E6                                                               ;8D8930;
    dw $7BE0,$C3EC                                                       ;8D8931;
    db $D6                                                               ;8D8935;
    dw $7BC2,$C3FC                                                       ;8D8936;
    db $D6                                                               ;8D893A;
    dw $7BC0,$C3CC                                                       ;8D893B;
    db $EE                                                               ;8D893F;
    dw $7BAD,$C3DC                                                       ;8D8940;
    db $EE                                                               ;8D8944;
    dw $7BAB,$C3CC                                                       ;8D8945;
    db $DE                                                               ;8D8949;
    dw $7B8D,$C3DC                                                       ;8D894A;
    db $DE                                                               ;8D894E;
    dw $7B8B                                                             ;8D894F;

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2D:
    dw $0004,$C3C8                                                       ;8D8951;
    db $EC                                                               ;8D8955;
    dw $7BE2,$C3D8                                                       ;8D8956;
    db $EC                                                               ;8D895A;
    dw $7BE0,$C3C8                                                       ;8D895B;
    db $DC                                                               ;8D895F;
    dw $7BC2,$C3D8                                                       ;8D8960;
    db $DC                                                               ;8D8964;
    dw $7BC0                                                             ;8D8965;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_Draygon_0_8D8967:
    dw $0001,$01FC                                                       ;8D8967;
    db $FC                                                               ;8D896B;
    dw $3100                                                             ;8D896C;

UNUSED_EnemyProjSpritemaps_Draygon_1_8D896E:
    dw $0001,$01FC                                                       ;8D896E;
    db $FC                                                               ;8D8972;
    dw $3101                                                             ;8D8973;

UNUSED_EnemyProjSpritemaps_Draygon_2_8D8975:
    dw $0001,$01FC                                                       ;8D8975;
    db $FC                                                               ;8D8979;
    dw $3102                                                             ;8D897A;

UNUSED_EnemyProjSpritemaps_0_8D897C:
    dw $0001,$01FC                                                       ;8D897C;
    db $FC                                                               ;8D8980;
    dw $3103                                                             ;8D8981;

UNUSED_EnemyProjSpritemaps_1_8D8983:
    dw $0001,$01FC                                                       ;8D8983;
    db $FC                                                               ;8D8987;
    dw $3104                                                             ;8D8988;

UNUSED_EnemyProjSpritemaps_2_8D898A:
    dw $0001,$01FC                                                       ;8D898A;
    db $FC                                                               ;8D898E;
    dw $3105                                                             ;8D898F;

UNUSED_EnemyProjSpritemaps_0_8D8991:
    dw $0001,$01FC                                                       ;8D8991;
    db $FC                                                               ;8D8995;
    dw $3106                                                             ;8D8996;

UNUSED_EnemyProjSpritemaps_1_8D8998:
    dw $0001,$01FC                                                       ;8D8998;
    db $FC                                                               ;8D899C;
    dw $3107                                                             ;8D899D;

UNUSED_EnemyProjSpritemaps_2_8D899F:
    dw $0001,$01FC                                                       ;8D899F;
    db $FC                                                               ;8D89A3;
    dw $3108                                                             ;8D89A4;

UNUSED_EnemyProjSpritemaps_0_8D89A6:
    dw $0001,$01FC                                                       ;8D89A6;
    db $FC                                                               ;8D89AA;
    dw $B103                                                             ;8D89AB;

UNUSED_EnemyProjSpritemaps_1_8D89AD:
    dw $0001,$01FC                                                       ;8D89AD;
    db $FC                                                               ;8D89B1;
    dw $B104                                                             ;8D89B2;

UNUSED_EnemyProjSpritemaps_2_8D89B4:
    dw $0001,$01FC                                                       ;8D89B4;
    db $FC                                                               ;8D89B8;
    dw $B105                                                             ;8D89B9;

UNUSED_EnemyProjSpritemaps_0_8D89BB:
    dw $0001,$01FC                                                       ;8D89BB;
    db $FC                                                               ;8D89BF;
    dw $B100                                                             ;8D89C0;

UNUSED_EnemyProjSpritemaps_1_8D89C2:
    dw $0001,$01FC                                                       ;8D89C2;
    db $FC                                                               ;8D89C6;
    dw $B101                                                             ;8D89C7;

UNUSED_EnemyProjSpritemaps_2_8D89C9:
    dw $0001,$01FC                                                       ;8D89C9;
    db $FC                                                               ;8D89CD;
    dw $B102                                                             ;8D89CE;

UNUSED_EnemyProjSpritemaps_0_8D89D0:
    dw $0001,$01FC                                                       ;8D89D0;
    db $FC                                                               ;8D89D4;
    dw $F103                                                             ;8D89D5;

UNUSED_EnemyProjSpritemaps_1_8D89D7:
    dw $0001,$01FC                                                       ;8D89D7;
    db $FC                                                               ;8D89DB;
    dw $F104                                                             ;8D89DC;

UNUSED_EnemyProjSpritemaps_2_8D89DE:
    dw $0001,$01FC                                                       ;8D89DE;
    db $FC                                                               ;8D89E2;
    dw $F105                                                             ;8D89E3;

UNUSED_EnemyProjSpritemaps_0_8D89E5:
    dw $0001,$01FC                                                       ;8D89E5;
    db $FC                                                               ;8D89E9;
    dw $7106                                                             ;8D89EA;

UNUSED_EnemyProjSpritemaps_1_8D89EC:
    dw $0001,$01FC                                                       ;8D89EC;
    db $FC                                                               ;8D89F0;
    dw $7107                                                             ;8D89F1;

UNUSED_EnemyProjSpritemaps_2_8D89F3:
    dw $0001,$01FC                                                       ;8D89F3;
    db $FC                                                               ;8D89F7;
    dw $7108                                                             ;8D89F8;

UNUSED_EnemyProjSpritemaps_0_8D89FA:
    dw $0001,$01FC                                                       ;8D89FA;
    db $FC                                                               ;8D89FE;
    dw $7103                                                             ;8D89FF;

UNUSED_EnemyProjSpritemaps_1_8D8A01:
    dw $0001,$01FC                                                       ;8D8A01;
    db $FC                                                               ;8D8A05;
    dw $7104                                                             ;8D8A06;

UNUSED_EnemyProjSpritemaps_2_8D8A08:
    dw $0001,$01FC                                                       ;8D8A08;
    db $FC                                                               ;8D8A0C;
    dw $7105                                                             ;8D8A0D;

UNUSED_EnemyProjSpritemaps_Draygon_8D8A0F:
    dw $0001,$81F8                                                       ;8D8A0F;
    db $F8                                                               ;8D8A13;
    dw $2164                                                             ;8D8A14;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DraygonGoop_0:
    dw $0001,$81F8                                                       ;8D8A16;
    db $F8                                                               ;8D8A1A;
    dw $116A                                                             ;8D8A1B;

EnemyProjSpritemaps_DraygonGoop_1:
    dw $0001,$81F8                                                       ;8D8A1D;
    db $F8                                                               ;8D8A21;
    dw $115E                                                             ;8D8A22;

EnemyProjSpritemaps_DraygonGoop_2:
    dw $0001,$81F8                                                       ;8D8A24;
    db $F8                                                               ;8D8A28;
    dw $115C                                                             ;8D8A29;

EnemyProjSpritemaps_DraygonGoop_3:
    dw $0001,$81F8                                                       ;8D8A2B;
    db $F8                                                               ;8D8A2F;
    dw $114A                                                             ;8D8A30;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_Draygon_0_8D8A32:
    dw $0001,$01FC                                                       ;8D8A32;
    db $FC                                                               ;8D8A36;
    dw $217E                                                             ;8D8A37;

UNUSED_EnemyProjSpritemaps_Draygon_1_8D8A39:
    dw $0001,$01FC                                                       ;8D8A39;
    db $FC                                                               ;8D8A3D;
    dw $217D                                                             ;8D8A3E;

UNUSED_EnemyProjSpritemaps_Draygon_2_8D8A40:
    dw $0001,$01FC                                                       ;8D8A40;
    db $FC                                                               ;8D8A44;
    dw $217C                                                             ;8D8A45;

UNUSED_EnemyProjSpritemaps_Draygon_3_8D8A47:
    dw $0001,$81F8                                                       ;8D8A47;
    db $F8                                                               ;8D8A4B;
    dw $218A                                                             ;8D8A4C;

UNUSED_EnemyProjSpritemaps_Draygon_4_8D8A4E:
    dw $0001,$01FC                                                       ;8D8A4E;
    db $FC                                                               ;8D8A52;
    dw $217F                                                             ;8D8A53;

UNUSED_EnemyProjSpritemaps_Draygon_5_8D8A55:
    dw $0001,$01FC                                                       ;8D8A55;
    db $FC                                                               ;8D8A59;
    dw $2177                                                             ;8D8A5A;

UNUSED_EnemyProjSpritemaps_Draygon_6_8D8A5C:
    dw $0001,$01FC                                                       ;8D8A5C;
    db $FC                                                               ;8D8A60;
    dw $2176                                                             ;8D8A61;

UNUSED_EnemyProjSpritemaps_0_8D8A63:
    dw $0001,$81F8                                                       ;8D8A63;
    db $F8                                                               ;8D8A67;
    dw $218C                                                             ;8D8A68;

UNUSED_EnemyProjSpritemaps_1_8D8A6A:
    dw $0001,$81F8                                                       ;8D8A6A;
    db $F8                                                               ;8D8A6E;
    dw $218E                                                             ;8D8A6F;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DraygonsWallTurretProjectile_0:
    dw $0001,$01FC                                                       ;8D8A71;
    db $FC                                                               ;8D8A75;
    dw $3B7E                                                             ;8D8A76;

EnemyProjSpritemaps_DraygonsWallTurretProjectile_1:
    dw $0001,$01FC                                                       ;8D8A78;
    db $FC                                                               ;8D8A7C;
    dw $3B7D                                                             ;8D8A7D;

EnemyProjSpritemaps_DraygonsWallTurretProjectile_2:
    dw $0001,$01FC                                                       ;8D8A7F;
    db $FC                                                               ;8D8A83;
    dw $3B7C                                                             ;8D8A84;

EnemyProjSpritemaps_DraygonsWallTurretProjectile_3:
    dw $0001,$81F8                                                       ;8D8A86;
    db $F8                                                               ;8D8A8A;
    dw $3B8A                                                             ;8D8A8B;

EnemyProjSpritemaps_DraygonGoop_4:
    dw $0001,$81F8                                                       ;8D8A8D;
    db $F8                                                               ;8D8A91;
    dw $338C                                                             ;8D8A92;

EnemyProjSpritemaps_DraygonGoop_5:
    dw $0004,$0002                                                       ;8D8A94;
    db $02                                                               ;8D8A98;
    dw $339F,$01F6                                                       ;8D8A99;
    db $02                                                               ;8D8A9D;
    dw $339E,$0002                                                       ;8D8A9E;
    db $F6                                                               ;8D8AA2;
    dw $338F,$01F6                                                       ;8D8AA3;
    db $F6                                                               ;8D8AA7;
    dw $338E                                                             ;8D8AA8;

EnemyProjSpritemaps_DraygonsWallTurretProjectile_4:
    dw $0001,$81F8                                                       ;8D8AAA;
    db $F8                                                               ;8D8AAE;
    dw $3BCA                                                             ;8D8AAF;

EnemyProjSpritemaps_DraygonsWallTurretProjectile_5:
    dw $0001,$81F8                                                       ;8D8AB1;
    db $F8                                                               ;8D8AB5;
    dw $3BCC                                                             ;8D8AB6;

EnemyProjSpritemaps_DraygonsWallTurretProjectile_6:
    dw $0001,$81F8                                                       ;8D8AB8;
    db $F8                                                               ;8D8ABC;
    dw $3BCE                                                             ;8D8ABD;

EnemyProjSpritemaps_CeresFallingTile_Light:
    dw $0001,$C3F8                                                       ;8D8ABF;
    db $F8                                                               ;8D8AC3;
    dw $20EA                                                             ;8D8AC4;

EnemyProjSpritemaps_CeresFallingTile_Dark:
    dw $0001,$C3F8                                                       ;8D8AC6;
    db $F8                                                               ;8D8ACA;
    dw $20EC                                                             ;8D8ACB;

EnemyProjSpritemaps_PirateClaw_0:
    dw $0003,$0004                                                       ;8D8ACD;
    db $FC                                                               ;8D8AD1;
    dw $314C,$01FC                                                       ;8D8AD2;
    db $FC                                                               ;8D8AD6;
    dw $314B,$01F4                                                       ;8D8AD7;
    db $FC                                                               ;8D8ADB;
    dw $314A                                                             ;8D8ADC;

EnemyProjSpritemaps_PirateClaw_1:
    dw $0002,$81FC                                                       ;8D8ADE;
    db $F8                                                               ;8D8AE2;
    dw $3128,$81F4                                                       ;8D8AE3;
    db $F8                                                               ;8D8AE7;
    dw $3127                                                             ;8D8AE8;

EnemyProjSpritemaps_PirateClaw_2:
    dw $0003,$01FC                                                       ;8D8AEA;
    db $F4                                                               ;8D8AEE;
    dw $F14D,$01FC                                                       ;8D8AEF;
    db $FC                                                               ;8D8AF3;
    dw $F13D,$01FC                                                       ;8D8AF4;
    db $04                                                               ;8D8AF8;
    dw $F12D                                                             ;8D8AF9;

EnemyProjSpritemaps_PirateClaw_3:
    dw $0002,$81F4                                                       ;8D8AFB;
    db $F8                                                               ;8D8AFF;
    dw $F12B,$81FC                                                       ;8D8B00;
    db $F8                                                               ;8D8B04;
    dw $F12A                                                             ;8D8B05;

EnemyProjSpritemaps_PirateClaw_4:
    dw $0003,$01F4                                                       ;8D8B07;
    db $FC                                                               ;8D8B0B;
    dw $F14C,$01FC                                                       ;8D8B0C;
    db $FC                                                               ;8D8B10;
    dw $F14B,$0004                                                       ;8D8B11;
    db $FC                                                               ;8D8B15;
    dw $F14A                                                             ;8D8B16;

EnemyProjSpritemaps_PirateClaw_5:
    dw $0002,$81F4                                                       ;8D8B18;
    db $F8                                                               ;8D8B1C;
    dw $F128,$81FC                                                       ;8D8B1D;
    db $F8                                                               ;8D8B21;
    dw $F127                                                             ;8D8B22;

EnemyProjSpritemaps_PirateClaw_6:
    dw $0003,$01FC                                                       ;8D8B24;
    db $04                                                               ;8D8B28;
    dw $314D,$01FC                                                       ;8D8B29;
    db $FC                                                               ;8D8B2D;
    dw $313D,$01FC                                                       ;8D8B2E;
    db $F4                                                               ;8D8B32;
    dw $312D                                                             ;8D8B33;

EnemyProjSpritemaps_PirateClaw_7:
    dw $0002,$81FC                                                       ;8D8B35;
    db $F8                                                               ;8D8B39;
    dw $312B,$81F4                                                       ;8D8B3A;
    db $F8                                                               ;8D8B3E;
    dw $312A                                                             ;8D8B3F;

EnemyProjSpritemaps_PirateClaw_8:
    dw $0003,$01F4                                                       ;8D8B41;
    db $FC                                                               ;8D8B45;
    dw $714C,$01FC                                                       ;8D8B46;
    db $FC                                                               ;8D8B4A;
    dw $714B,$0004                                                       ;8D8B4B;
    db $FC                                                               ;8D8B4F;
    dw $714A                                                             ;8D8B50;

EnemyProjSpritemaps_PirateClaw_9:
    dw $0002,$81F4                                                       ;8D8B52;
    db $F8                                                               ;8D8B56;
    dw $7128,$81FC                                                       ;8D8B57;
    db $F8                                                               ;8D8B5B;
    dw $7127                                                             ;8D8B5C;

EnemyProjSpritemaps_PirateClaw_A:
    dw $0003,$01FC                                                       ;8D8B5E;
    db $F4                                                               ;8D8B62;
    dw $B14D,$01FC                                                       ;8D8B63;
    db $FC                                                               ;8D8B67;
    dw $B13D,$01FC                                                       ;8D8B68;
    db $04                                                               ;8D8B6C;
    dw $B12D                                                             ;8D8B6D;

EnemyProjSpritemaps_PirateClaw_B:
    dw $0002,$81FC                                                       ;8D8B6F;
    db $F8                                                               ;8D8B73;
    dw $B12B,$81F4                                                       ;8D8B74;
    db $F8                                                               ;8D8B78;
    dw $B12A                                                             ;8D8B79;

EnemyProjSpritemaps_PirateClaw_C:
    dw $0003,$0004                                                       ;8D8B7B;
    db $FC                                                               ;8D8B7F;
    dw $B14C,$01FC                                                       ;8D8B80;
    db $FC                                                               ;8D8B84;
    dw $B14B,$01F4                                                       ;8D8B85;
    db $FC                                                               ;8D8B89;
    dw $B14A                                                             ;8D8B8A;

EnemyProjSpritemaps_PirateClaw_D:
    dw $0002,$81FC                                                       ;8D8B8C;
    db $F8                                                               ;8D8B90;
    dw $B128,$81F4                                                       ;8D8B91;
    db $F8                                                               ;8D8B95;
    dw $B127                                                             ;8D8B96;

EnemyProjSpritemaps_PirateClaw_E:
    dw $0003,$01FC                                                       ;8D8B98;
    db $04                                                               ;8D8B9C;
    dw $714D,$01FC                                                       ;8D8B9D;
    db $FC                                                               ;8D8BA1;
    dw $713D,$01FC                                                       ;8D8BA2;
    db $F4                                                               ;8D8BA6;
    dw $712D                                                             ;8D8BA7;

EnemyProjSpritemaps_PirateClaw_F:
    dw $0002,$81F4                                                       ;8D8BA9;
    db $F8                                                               ;8D8BAD;
    dw $712B,$81FC                                                       ;8D8BAE;
    db $F8                                                               ;8D8BB2;
    dw $712A                                                             ;8D8BB3;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_0:
    dw $0001,$01FC                                                       ;8D8BB5;
    db $FC                                                               ;8D8BB9;
    dw $3A6F                                                             ;8D8BBA;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_1:
    dw $0001,$01FC                                                       ;8D8BBC;
    db $FC                                                               ;8D8BC0;
    dw $3A6B                                                             ;8D8BC1;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_2:
    dw $0002,$0000                                                       ;8D8BC3;
    db $FC                                                               ;8D8BC7;
    dw $7A6F,$01F8                                                       ;8D8BC8;
    db $FC                                                               ;8D8BCC;
    dw $3A6F                                                             ;8D8BCD;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_3:
    dw $0002,$0000                                                       ;8D8BCF;
    db $FC                                                               ;8D8BD3;
    dw $7A6B,$01F8                                                       ;8D8BD4;
    db $FC                                                               ;8D8BD8;
    dw $3A6B                                                             ;8D8BD9;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_4:
    dw $0003,$0004                                                       ;8D8BDB;
    db $FC                                                               ;8D8BDF;
    dw $7ACD,$01FC                                                       ;8D8BE0;
    db $FC                                                               ;8D8BE4;
    dw $7A6F,$01F4                                                       ;8D8BE5;
    db $FC                                                               ;8D8BE9;
    dw $3A6F                                                             ;8D8BEA;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_5:
    dw $0003,$0004                                                       ;8D8BEC;
    db $FC                                                               ;8D8BF0;
    dw $7A6B,$01FC                                                       ;8D8BF1;
    db $FC                                                               ;8D8BF5;
    dw $3A6B,$01F4                                                       ;8D8BF6;
    db $FC                                                               ;8D8BFA;
    dw $3A6B                                                             ;8D8BFB;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_6:
    dw $0004,$0008                                                       ;8D8BFD;
    db $FC                                                               ;8D8C01;
    dw $7ACD,$01F0                                                       ;8D8C02;
    db $FC                                                               ;8D8C06;
    dw $3ACD,$0000                                                       ;8D8C07;
    db $FC                                                               ;8D8C0B;
    dw $7A6F,$01F8                                                       ;8D8C0C;
    db $FC                                                               ;8D8C10;
    dw $3A6F                                                             ;8D8C11;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_7:
    dw $0004,$0008                                                       ;8D8C13;
    db $FC                                                               ;8D8C17;
    dw $FA6B,$0000                                                       ;8D8C18;
    db $FC                                                               ;8D8C1C;
    dw $FA6B,$01F8                                                       ;8D8C1D;
    db $FC                                                               ;8D8C21;
    dw $BA6B,$01F0                                                       ;8D8C22;
    db $FC                                                               ;8D8C26;
    dw $BA6B                                                             ;8D8C27;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_8:
    dw $0001,$01FC                                                       ;8D8C29;
    db $FC                                                               ;8D8C2D;
    dw $3A53                                                             ;8D8C2E;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_9:
    dw $0001,$01FC                                                       ;8D8C30;
    db $FC                                                               ;8D8C34;
    dw $3A51                                                             ;8D8C35;

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_A:
    dw $0004,$0000                                                       ;8D8C37;
    db $00                                                               ;8D8C3B;
    dw $FA60,$0000                                                       ;8D8C3C;
    db $F8                                                               ;8D8C40;
    dw $7A60,$01F8                                                       ;8D8C41;
    db $00                                                               ;8D8C45;
    dw $BA60,$01F8                                                       ;8D8C46;
    db $F8                                                               ;8D8C4A;
    dw $3A60                                                             ;8D8C4B;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_QuestionMark_8D8C4D:
    dw $0001,$C3F8                                                       ;8D8C4D;
    db $F8                                                               ;8D8C51;
    dw $2AE0                                                             ;8D8C52;
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_0_8D8C54:
    dw $0001,$01FC                                                       ;8D8C54;
    db $FC                                                               ;8D8C58;
    dw $6B70                                                             ;8D8C59;

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_1_8D8C5B:
    dw $0001,$01FC                                                       ;8D8C5B;
    db $FC                                                               ;8D8C5F;
    dw $6B63                                                             ;8D8C60;

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_2_8D8C62:
    dw $0001,$01FC                                                       ;8D8C62;
    db $FC                                                               ;8D8C66;
    dw $6B67                                                             ;8D8C67;

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_3_8D8C69:
    dw $0001,$01FC                                                       ;8D8C69;
    db $FC                                                               ;8D8C6D;
    dw $6B6A                                                             ;8D8C6E;

EnemyProjSpritemaps_TorizoChozoOrbs_0:
    dw $0001,$C3F8                                                       ;8D8C70;
    db $F8                                                               ;8D8C74;
    dw $672C                                                             ;8D8C75;

EnemyProjSpritemaps_TorizoChozoOrbs_1:
    dw $0001,$C3F8                                                       ;8D8C77;
    db $F8                                                               ;8D8C7B;
    dw $272C                                                             ;8D8C7C;

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_0:
    dw $0001,$C3F8                                                       ;8D8C7E;
    db $F8                                                               ;8D8C82;
    dw $6B2E                                                             ;8D8C83;

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_1:
    dw $0002,$01F8                                                       ;8D8C85;
    db $00                                                               ;8D8C89;
    dw $2B80,$0000                                                       ;8D8C8A;
    db $00                                                               ;8D8C8E;
    dw $6B80                                                             ;8D8C8F;

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_2:
    dw $0004,$01F8                                                       ;8D8C91;
    db $00                                                               ;8D8C95;
    dw $2B90,$01F8                                                       ;8D8C96;
    db $F8                                                               ;8D8C9A;
    dw $2B80,$0000                                                       ;8D8C9B;
    db $00                                                               ;8D8C9F;
    dw $6B90,$0000                                                       ;8D8CA0;
    db $F8                                                               ;8D8CA4;
    dw $6B80                                                             ;8D8CA5;

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_3:
    dw $0003,$C3F8                                                       ;8D8CA7;
    db $F0                                                               ;8D8CAB;
    dw $6B80,$01F8                                                       ;8D8CAC;
    db $00                                                               ;8D8CB0;
    dw $2B99,$0000                                                       ;8D8CB1;
    db $00                                                               ;8D8CB5;
    dw $6B99                                                             ;8D8CB6;

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_4:
    dw $0003,$0000                                                       ;8D8CB8;
    db $00                                                               ;8D8CBC;
    dw $6B80,$01F8                                                       ;8D8CBD;
    db $00                                                               ;8D8CC1;
    dw $2B80,$C3F8                                                       ;8D8CC2;
    db $EC                                                               ;8D8CC6;
    dw $2B2E                                                             ;8D8CC7;

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_5:
    dw $0006,$01F8                                                       ;8D8CC9;
    db $00                                                               ;8D8CCD;
    dw $EB52,$0000                                                       ;8D8CCE;
    db $00                                                               ;8D8CD2;
    dw $AB52,$01F8                                                       ;8D8CD3;
    db $F0                                                               ;8D8CD7;
    dw $2B92,$01F8                                                       ;8D8CD8;
    db $E8                                                               ;8D8CDC;
    dw $2B82,$0000                                                       ;8D8CDD;
    db $F0                                                               ;8D8CE1;
    dw $6B92,$0000                                                       ;8D8CE2;
    db $E8                                                               ;8D8CE6;
    dw $6B82                                                             ;8D8CE7;

EnemyProjSpritemaps_TorizoSonicBoom_0:
    dw $0004,$0000                                                       ;8D8CE9;
    db $00                                                               ;8D8CED;
    dw $AB5E,$01F8                                                       ;8D8CEE;
    db $00                                                               ;8D8CF2;
    dw $AB5D,$0000                                                       ;8D8CF3;
    db $F8                                                               ;8D8CF7;
    dw $2B5E,$01F8                                                       ;8D8CF8;
    db $F8                                                               ;8D8CFC;
    dw $2B5D                                                             ;8D8CFD;

EnemyProjSpritemaps_TorizoSonicBoom_1:
    dw $0006,$01F8                                                       ;8D8CFF;
    db $00                                                               ;8D8D03;
    dw $ABBE,$0000                                                       ;8D8D04;
    db $08                                                               ;8D8D08;
    dw $ABBD,$01F8                                                       ;8D8D09;
    db $08                                                               ;8D8D0D;
    dw $ABBC,$01F8                                                       ;8D8D0E;
    db $F8                                                               ;8D8D12;
    dw $2BBE,$0000                                                       ;8D8D13;
    db $F0                                                               ;8D8D17;
    dw $2BBD,$01F8                                                       ;8D8D18;
    db $F0                                                               ;8D8D1C;
    dw $2BBC                                                             ;8D8D1D;

EnemyProjSpritemaps_TorizoSonicBoom_2:
    dw $0006,$01FC                                                       ;8D8D1F;
    db $00                                                               ;8D8D23;
    dw $ABBF,$01FC                                                       ;8D8D24;
    db $08                                                               ;8D8D28;
    dw $AB65,$01FC                                                       ;8D8D29;
    db $10                                                               ;8D8D2D;
    dw $AB49,$01FC                                                       ;8D8D2E;
    db $F8                                                               ;8D8D32;
    dw $2BBF,$01FC                                                       ;8D8D33;
    db $F0                                                               ;8D8D37;
    dw $2B65,$01FC                                                       ;8D8D38;
    db $E8                                                               ;8D8D3C;
    dw $2B49                                                             ;8D8D3D;

EnemyProjSpritemaps_TorizoSonicBoom_3:
    dw $0004,$01F8                                                       ;8D8D3F;
    db $00                                                               ;8D8D43;
    dw $EB5E,$0000                                                       ;8D8D44;
    db $00                                                               ;8D8D48;
    dw $EB5D,$01F8                                                       ;8D8D49;
    db $F8                                                               ;8D8D4D;
    dw $6B5E,$0000                                                       ;8D8D4E;
    db $F8                                                               ;8D8D52;
    dw $6B5D                                                             ;8D8D53;

EnemyProjSpritemaps_TorizoSonicBoom_4:
    dw $0006,$0000                                                       ;8D8D55;
    db $00                                                               ;8D8D59;
    dw $EBBE,$01F8                                                       ;8D8D5A;
    db $08                                                               ;8D8D5E;
    dw $EBBD,$0000                                                       ;8D8D5F;
    db $08                                                               ;8D8D63;
    dw $EBBC,$0000                                                       ;8D8D64;
    db $F8                                                               ;8D8D68;
    dw $6BBE,$01F8                                                       ;8D8D69;
    db $F0                                                               ;8D8D6D;
    dw $6BBD,$0000                                                       ;8D8D6E;
    db $F0                                                               ;8D8D72;
    dw $6BBC                                                             ;8D8D73;

EnemyProjSpritemaps_TorizoSonicBoom_5:
    dw $0006,$01FC                                                       ;8D8D75;
    db $00                                                               ;8D8D79;
    dw $EBBF,$01FC                                                       ;8D8D7A;
    db $08                                                               ;8D8D7E;
    dw $EB65,$01FC                                                       ;8D8D7F;
    db $10                                                               ;8D8D83;
    dw $EB49,$01FC                                                       ;8D8D84;
    db $F8                                                               ;8D8D88;
    dw $6BBF,$01FC                                                       ;8D8D89;
    db $F0                                                               ;8D8D8D;
    dw $6B65,$01FC                                                       ;8D8D8E;
    db $E8                                                               ;8D8D92;
    dw $6B49                                                             ;8D8D93;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D8D95:
    dw $0001,$01FC                                                       ;8D8D95;
    db $FC                                                               ;8D8D99;
    dw $2A5E                                                             ;8D8D9A;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Common_0:
    dw $0001,$01FC                                                       ;8D8D9C;
    db $FC                                                               ;8D8DA0;
    dw $2A5F                                                             ;8D8DA1;

EnemyProjSpritemaps_Common_1:
    dw $0004,$0000                                                       ;8D8DA3;
    db $00                                                               ;8D8DA7;
    dw $EA60,$0000                                                       ;8D8DA8;
    db $F8                                                               ;8D8DAC;
    dw $6A60,$01F8                                                       ;8D8DAD;
    db $00                                                               ;8D8DB1;
    dw $AA60,$01F8                                                       ;8D8DB2;
    db $F8                                                               ;8D8DB6;
    dw $2A60                                                             ;8D8DB7;

EnemyProjSpritemaps_Common_2:
    dw $0004,$0000                                                       ;8D8DB9;
    db $00                                                               ;8D8DBD;
    dw $EA61,$0000                                                       ;8D8DBE;
    db $F8                                                               ;8D8DC2;
    dw $6A61,$01F8                                                       ;8D8DC3;
    db $00                                                               ;8D8DC7;
    dw $AA61,$01F8                                                       ;8D8DC8;
    db $F8                                                               ;8D8DCC;
    dw $2A61                                                             ;8D8DCD;

EnemyProjSpritemaps_Common_3:
    dw $0004,$0000                                                       ;8D8DCF;
    db $00                                                               ;8D8DD3;
    dw $EA62,$0000                                                       ;8D8DD4;
    db $F8                                                               ;8D8DD8;
    dw $6A62,$01F8                                                       ;8D8DD9;
    db $00                                                               ;8D8DDD;
    dw $AA62,$01F8                                                       ;8D8DDE;
    db $F8                                                               ;8D8DE2;
    dw $2A62                                                             ;8D8DE3;

EnemyProjSpritemaps_Common_4:
    dw $0004,$0000                                                       ;8D8DE5;
    db $00                                                               ;8D8DE9;
    dw $EA63,$0000                                                       ;8D8DEA;
    db $F8                                                               ;8D8DEE;
    dw $6A63,$01F8                                                       ;8D8DEF;
    db $00                                                               ;8D8DF3;
    dw $AA63,$01F8                                                       ;8D8DF4;
    db $F8                                                               ;8D8DF8;
    dw $2A63                                                             ;8D8DF9;

EnemyProjSpritemaps_BombTorizoChozoBreaking_0:
    dw $0001,$C3F8                                                       ;8D8DFB;
    db $F8                                                               ;8D8DFF;
    dw $2EE0                                                             ;8D8E00;

EnemyProjSpritemaps_BombTorizoChozoBreaking_1:
    dw $0001,$C3F8                                                       ;8D8E02;
    db $F8                                                               ;8D8E06;
    dw $2EE2                                                             ;8D8E07;

EnemyProjSpritemaps_BombTorizoChozoBreaking_2:
    dw $0001,$C3F8                                                       ;8D8E09;
    db $F8                                                               ;8D8E0D;
    dw $2EE4                                                             ;8D8E0E;

EnemyProjSpritemaps_BombTorizoChozoBreaking_3:
    dw $0001,$C3F8                                                       ;8D8E10;
    db $F8                                                               ;8D8E14;
    dw $2EE6                                                             ;8D8E15;

EnemyProjSpritemaps_BombTorizoChozoBreaking_4:
    dw $0001,$C3F8                                                       ;8D8E17;
    db $F8                                                               ;8D8E1B;
    dw $2EE8                                                             ;8D8E1C;

EnemyProjSpritemaps_BombTorizoChozoBreaking_5:
    dw $0001,$C3F8                                                       ;8D8E1E;
    db $F8                                                               ;8D8E22;
    dw $2EEA                                                             ;8D8E23;

EnemyProjSpritemaps_BombTorizoChozoBreaking_6:
    dw $0001,$C3F8                                                       ;8D8E25;
    db $F8                                                               ;8D8E29;
    dw $2EEC                                                             ;8D8E2A;

EnemyProjSpritemaps_BombTorizoChozoBreaking_7:
    dw $0001,$C3F8                                                       ;8D8E2C;
    db $F8                                                               ;8D8E30;
    dw $2EEE                                                             ;8D8E31;

EnemyProjSpritemaps_BombTorizoChozoBreaking_8:
    dw $0001,$C3F8                                                       ;8D8E33;
    db $F8                                                               ;8D8E37;
    dw $6EE0                                                             ;8D8E38;

EnemyProjSpritemaps_BombTorizoChozoBreaking_9:
    dw $0001,$C3F8                                                       ;8D8E3A;
    db $F8                                                               ;8D8E3E;
    dw $6EE2                                                             ;8D8E3F;

EnemyProjSpritemaps_BombTorizoChozoBreaking_A:
    dw $0001,$C3F8                                                       ;8D8E41;
    db $F8                                                               ;8D8E45;
    dw $6EE4                                                             ;8D8E46;

EnemyProjSpritemaps_BombTorizoChozoBreaking_B:
    dw $0001,$C3F8                                                       ;8D8E48;
    db $F8                                                               ;8D8E4C;
    dw $6EE6                                                             ;8D8E4D;

EnemyProjSpritemaps_BombTorizoChozoBreaking_C:
    dw $0001,$C3F8                                                       ;8D8E4F;
    db $F8                                                               ;8D8E53;
    dw $6EE8                                                             ;8D8E54;

EnemyProjSpritemaps_BombTorizoChozoBreaking_D:
    dw $0001,$C3F8                                                       ;8D8E56;
    db $F8                                                               ;8D8E5A;
    dw $6EEA                                                             ;8D8E5B;

EnemyProjSpritemaps_BombTorizoChozoBreaking_E:
    dw $0001,$C3F8                                                       ;8D8E5D;
    db $F8                                                               ;8D8E61;
    dw $6EEC                                                             ;8D8E62;

EnemyProjSpritemaps_BombTorizoChozoBreaking_F:
    dw $0001,$C3F8                                                       ;8D8E64;
    db $F8                                                               ;8D8E68;
    dw $6EEE                                                             ;8D8E69;

EnemyProjSpritemaps_GoldenTorizoSuperMissile_0:
    dw $0002,$0000                                                       ;8D8E6B;
    db $FC                                                               ;8D8E6F;
    dw $2A65,$01F8                                                       ;8D8E70;
    db $FC                                                               ;8D8E74;
    dw $2A64                                                             ;8D8E75;

EnemyProjSpritemaps_GoldenTorizoSuperMissile_1:
    dw $0003,$0003                                                       ;8D8E77;
    db $FF                                                               ;8D8E7B;
    dw $2A68,$01FB                                                       ;8D8E7C;
    db $FF                                                               ;8D8E80;
    dw $2A67,$01FB                                                       ;8D8E81;
    db $F7                                                               ;8D8E85;
    dw $2A66                                                             ;8D8E86;

EnemyProjSpritemaps_GoldenTorizoSuperMissile_2:
    dw $0002,$01FC                                                       ;8D8E88;
    db $00                                                               ;8D8E8C;
    dw $2A6A,$01FC                                                       ;8D8E8D;
    db $F8                                                               ;8D8E91;
    dw $2A69                                                             ;8D8E92;

EnemyProjSpritemaps_GoldenTorizoSuperMissile_3:
    dw $0003,$01F5                                                       ;8D8E94;
    db $FF                                                               ;8D8E98;
    dw $6A68,$01FD                                                       ;8D8E99;
    db $FF                                                               ;8D8E9D;
    dw $6A67,$01FD                                                       ;8D8E9E;
    db $F7                                                               ;8D8EA2;
    dw $6A66                                                             ;8D8EA3;

EnemyProjSpritemaps_GoldenTorizoSuperMissile_4:
    dw $0002,$01F8                                                       ;8D8EA5;
    db $FC                                                               ;8D8EA9;
    dw $6A65,$0000                                                       ;8D8EAA;
    db $FC                                                               ;8D8EAE;
    dw $6A64                                                             ;8D8EAF;

EnemyProjSpritemaps_GoldenTorizoSuperMissile_5:
    dw $0003,$01F5                                                       ;8D8EB1;
    db $F9                                                               ;8D8EB5;
    dw $EA68,$01FD                                                       ;8D8EB6;
    db $F9                                                               ;8D8EBA;
    dw $EA67,$01FD                                                       ;8D8EBB;
    db $01                                                               ;8D8EBF;
    dw $EA66                                                             ;8D8EC0;

EnemyProjSpritemaps_GoldenTorizoSuperMissile_6:
    dw $0002,$01FC                                                       ;8D8EC2;
    db $F8                                                               ;8D8EC6;
    dw $AA6A,$01FC                                                       ;8D8EC7;
    db $00                                                               ;8D8ECB;
    dw $AA69                                                             ;8D8ECC;

EnemyProjSpritemaps_GoldenTorizoSuperMissile_7:
    dw $0003,$0003                                                       ;8D8ECE;
    db $F9                                                               ;8D8ED2;
    dw $AA68,$01FB                                                       ;8D8ED3;
    db $F9                                                               ;8D8ED7;
    dw $AA67,$01FB                                                       ;8D8ED8;
    db $01                                                               ;8D8EDC;
    dw $AA66                                                             ;8D8EDD;

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_0:
    dw $0001,$01FC                                                       ;8D8EDF;
    db $FC                                                               ;8D8EE3;
    dw $2A48                                                             ;8D8EE4;

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_1:
    dw $0001,$01FC                                                       ;8D8EE6;
    db $FC                                                               ;8D8EEA;
    dw $2A49                                                             ;8D8EEB;

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_2:
    dw $0001,$01FC                                                       ;8D8EED;
    db $FC                                                               ;8D8EF1;
    dw $2A4A                                                             ;8D8EF2;

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_3:
    dw $0001,$01FC                                                       ;8D8EF4;
    db $FC                                                               ;8D8EF8;
    dw $2A4B                                                             ;8D8EF9;

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_0:
    dw $0001,$01FC                                                       ;8D8EFB;
    db $FC                                                               ;8D8EFF;
    dw $6A48                                                             ;8D8F00;

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_1:
    dw $0001,$01FC                                                       ;8D8F02;
    db $FC                                                               ;8D8F06;
    dw $6A49                                                             ;8D8F07;

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_2:
    dw $0001,$01FC                                                       ;8D8F09;
    db $FC                                                               ;8D8F0D;
    dw $6A4A                                                             ;8D8F0E;

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_3:
    dw $0001,$01FC                                                       ;8D8F10;
    db $FC                                                               ;8D8F14;
    dw $6A4B                                                             ;8D8F15;

EnemyProjSpritemaps_GoldenTorizoEgg_0:
    dw $0001,$C3F8                                                       ;8D8F17;
    db $F8                                                               ;8D8F1B;
    dw $2B04                                                             ;8D8F1C;

EnemyProjSpritemaps_GoldenTorizoEgg_1:
    dw $0001,$C3F8                                                       ;8D8F1E;
    db $F8                                                               ;8D8F22;
    dw $2B8C                                                             ;8D8F23;

EnemyProjSpritemaps_GoldenTorizoEgg_2:
    dw $0001,$C3F8                                                       ;8D8F25;
    db $F8                                                               ;8D8F29;
    dw $2BCC                                                             ;8D8F2A;

EnemyProjSpritemaps_GoldenTorizoEgg_3:
    dw $0001,$C3F8                                                       ;8D8F2C;
    db $F8                                                               ;8D8F30;
    dw $2AD0                                                             ;8D8F31;

EnemyProjSpritemaps_GoldenTorizoEgg_4:
    dw $0001,$C3F8                                                       ;8D8F33;
    db $F6                                                               ;8D8F37;
    dw $22D2                                                             ;8D8F38;

EnemyProjSpritemaps_GoldenTorizoEgg_5:
    dw $0001,$C3F8                                                       ;8D8F3A;
    db $F6                                                               ;8D8F3E;
    dw $22D4                                                             ;8D8F3F;

EnemyProjSpritemaps_GoldenTorizoEgg_6:
    dw $0001,$C3F8                                                       ;8D8F41;
    db $F6                                                               ;8D8F45;
    dw $22D6                                                             ;8D8F46;

EnemyProjSpritemaps_GoldenTorizoEgg_7:
    dw $0001,$C3F8                                                       ;8D8F48;
    db $F6                                                               ;8D8F4C;
    dw $22D8                                                             ;8D8F4D;

EnemyProjSpritemaps_GoldenTorizoEgg_8:
    dw $0001,$C3F8                                                       ;8D8F4F;
    db $F6                                                               ;8D8F53;
    dw $22DA                                                             ;8D8F54;

EnemyProjSpritemaps_GoldenTorizoEgg_9:
    dw $0001,$C3F8                                                       ;8D8F56;
    db $F6                                                               ;8D8F5A;
    dw $22DC                                                             ;8D8F5B;

EnemyProjSpritemaps_GoldenTorizoEgg_A:
    dw $0002,$0000                                                       ;8D8F5D;
    db $FE                                                               ;8D8F61;
    dw $22EF,$01F8                                                       ;8D8F62;
    db $FE                                                               ;8D8F66;
    dw $22EE                                                             ;8D8F67;

EnemyProjSpritemaps_GoldenTorizoEgg_B:
    dw $0002,$0000                                                       ;8D8F69;
    db $FE                                                               ;8D8F6D;
    dw $22DF,$01F8                                                       ;8D8F6E;
    db $FE                                                               ;8D8F72;
    dw $22DE                                                             ;8D8F73;

EnemyProjSpritemaps_GoldenTorizoEgg_C:
    dw $0001,$C3F8                                                       ;8D8F75;
    db $F8                                                               ;8D8F79;
    dw $6B04                                                             ;8D8F7A;

EnemyProjSpritemaps_GoldenTorizoEgg_D:
    dw $0001,$C3F8                                                       ;8D8F7C;
    db $F8                                                               ;8D8F80;
    dw $6B8C                                                             ;8D8F81;

EnemyProjSpritemaps_GoldenTorizoEgg_E:
    dw $0001,$C3F8                                                       ;8D8F83;
    db $F8                                                               ;8D8F87;
    dw $6BCC                                                             ;8D8F88;

EnemyProjSpritemaps_GoldenTorizoEgg_F:
    dw $0001,$C3F8                                                       ;8D8F8A;
    db $F8                                                               ;8D8F8E;
    dw $6AD0                                                             ;8D8F8F;

EnemyProjSpritemaps_GoldenTorizoEgg_10:
    dw $0001,$C3F8                                                       ;8D8F91;
    db $F6                                                               ;8D8F95;
    dw $62D2                                                             ;8D8F96;

EnemyProjSpritemaps_GoldenTorizoEgg_11:
    dw $0001,$C3F8                                                       ;8D8F98;
    db $F6                                                               ;8D8F9C;
    dw $62D4                                                             ;8D8F9D;

EnemyProjSpritemaps_GoldenTorizoEgg_12:
    dw $0001,$C3F8                                                       ;8D8F9F;
    db $F6                                                               ;8D8FA3;
    dw $62D6                                                             ;8D8FA4;

EnemyProjSpritemaps_GoldenTorizoEgg_13:
    dw $0001,$C3F8                                                       ;8D8FA6;
    db $F6                                                               ;8D8FAA;
    dw $62D8                                                             ;8D8FAB;

EnemyProjSpritemaps_GoldenTorizoEgg_14:
    dw $0001,$C3F8                                                       ;8D8FAD;
    db $F6                                                               ;8D8FB1;
    dw $62DA                                                             ;8D8FB2;

EnemyProjSpritemaps_GoldenTorizoEgg_15:
    dw $0001,$C3F8                                                       ;8D8FB4;
    db $F6                                                               ;8D8FB8;
    dw $62DC                                                             ;8D8FB9;

EnemyProjSpritemaps_GoldenTorizoEgg_16:
    dw $0002,$0000                                                       ;8D8FBB;
    db $FE                                                               ;8D8FBF;
    dw $62EF,$01F8                                                       ;8D8FC0;
    db $FE                                                               ;8D8FC4;
    dw $62EE                                                             ;8D8FC5;

EnemyProjSpritemaps_GoldenTorizoEgg_17:
    dw $0002,$0000                                                       ;8D8FC7;
    db $FE                                                               ;8D8FCB;
    dw $62DF,$01F8                                                       ;8D8FCC;
    db $FE                                                               ;8D8FD0;
    dw $62DE                                                             ;8D8FD1;

EnemyProjSpritemaps_DragonFireball_0:
    dw $0001,$01FC                                                       ;8D8FD3;
    db $FC                                                               ;8D8FD7;
    dw $2122                                                             ;8D8FD8;

EnemyProjSpritemaps_DragonFireball_1:
    dw $0001,$01FC                                                       ;8D8FDA;
    db $FC                                                               ;8D8FDE;
    dw $2123                                                             ;8D8FDF;

EnemyProjSpritemaps_DragonFireball_2:
    dw $0001,$01FC                                                       ;8D8FE1;
    db $FC                                                               ;8D8FE5;
    dw $A122                                                             ;8D8FE6;

EnemyProjSpritemaps_DragonFireball_3:
    dw $0001,$01FC                                                       ;8D8FE8;
    db $FC                                                               ;8D8FEC;
    dw $A123                                                             ;8D8FED;

EnemyProjSpritemaps_DragonFireball_4:
    dw $0001,$01FC                                                       ;8D8FEF;
    db $FC                                                               ;8D8FF3;
    dw $6122                                                             ;8D8FF4;

EnemyProjSpritemaps_DragonFireball_5:
    dw $0001,$01FC                                                       ;8D8FF6;
    db $FC                                                               ;8D8FFA;
    dw $6123                                                             ;8D8FFB;

EnemyProjSpritemaps_DragonFireball_6:
    dw $0001,$01FC                                                       ;8D8FFD;
    db $FC                                                               ;8D9001;
    dw $E122                                                             ;8D9002;

EnemyProjSpritemaps_DragonFireball_7:
    dw $0001,$01FC                                                       ;8D9004;
    db $FC                                                               ;8D9008;
    dw $E123                                                             ;8D9009;

EnemyProjSpritemaps_EyeDoorProjectile_4:
    dw $0004,$01F8                                                       ;8D900B;
    db $F8                                                               ;8D900F;
    dw $2C63,$0000                                                       ;8D9010;
    db $F8                                                               ;8D9014;
    dw $6C63,$01F8                                                       ;8D9015;
    db $00                                                               ;8D9019;
    dw $AC63,$0000                                                       ;8D901A;
    db $00                                                               ;8D901E;
    dw $EC63                                                             ;8D901F;

EnemyProjSpritemaps_EyeDoorProjectile_5:
    dw $0004,$01F8                                                       ;8D9021;
    db $F8                                                               ;8D9025;
    dw $2C62,$0000                                                       ;8D9026;
    db $F8                                                               ;8D902A;
    dw $6C62,$01F8                                                       ;8D902B;
    db $00                                                               ;8D902F;
    dw $AC62,$0000                                                       ;8D9030;
    db $00                                                               ;8D9034;
    dw $EC62                                                             ;8D9035;

EnemyProjSpritemaps_EyeDoorProjectile_6:
    dw $0004,$01F8                                                       ;8D9037;
    db $F8                                                               ;8D903B;
    dw $2C61,$0000                                                       ;8D903C;
    db $F8                                                               ;8D9040;
    dw $6C61,$01F8                                                       ;8D9041;
    db $00                                                               ;8D9045;
    dw $AC61,$0000                                                       ;8D9046;
    db $00                                                               ;8D904A;
    dw $EC61                                                             ;8D904B;

EnemyProjSpritemaps_EyeDoorProjectile_7:
    dw $0004,$01F8                                                       ;8D904D;
    db $F8                                                               ;8D9051;
    dw $2C60,$0000                                                       ;8D9052;
    db $F8                                                               ;8D9056;
    dw $6C60,$01F8                                                       ;8D9057;
    db $00                                                               ;8D905B;
    dw $AC60,$0000                                                       ;8D905C;
    db $00                                                               ;8D9060;
    dw $EC60                                                             ;8D9061;

EnemyProjSpritemaps_EyeDoorSweat_0:
    dw $0001,$01FC                                                       ;8D9063;
    db $FC                                                               ;8D9067;
    dw $2A43                                                             ;8D9068;

EnemyProjSpritemaps_EyeDoorSweat_1:
    dw $0001,$01FC                                                       ;8D906A;
    db $FC                                                               ;8D906E;
    dw $2A2C                                                             ;8D906F;

EnemyProjSpritemaps_EyeDoorSweat_2:
    dw $0001,$01FC                                                       ;8D9071;
    db $FC                                                               ;8D9075;
    dw $2A2D                                                             ;8D9076;

EnemyProjSpritemaps_EyeDoorSweat_3:
    dw $0001,$01FC                                                       ;8D9078;
    db $FC                                                               ;8D907C;
    dw $2A2E                                                             ;8D907D;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D907F:
    dw $0001,$01FC                                                       ;8D907F;
    db $FC                                                               ;8D9083;
    dw $2A2F                                                             ;8D9084;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_0:
    dw $0001,$01FC                                                       ;8D9086;
    db $FC                                                               ;8D908A;
    dw $7E2C                                                             ;8D908B;

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_1:
    dw $0001,$01FC                                                       ;8D908D;
    db $FC                                                               ;8D9091;
    dw $7E2D                                                             ;8D9092;

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_2:
    dw $0001,$01FC                                                       ;8D9094;
    db $FC                                                               ;8D9098;
    dw $7E2E                                                             ;8D9099;

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_3:
    dw $0001,$01FC                                                       ;8D909B;
    db $FC                                                               ;8D909F;
    dw $7E2F                                                             ;8D90A0;

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_0:
    dw $0001,$01FC                                                       ;8D90A2;
    db $FC                                                               ;8D90A6;
    dw $3EDA                                                             ;8D90A7;

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_1:
    dw $0001,$01FC                                                       ;8D90A9;
    db $FC                                                               ;8D90AD;
    dw $3EDB                                                             ;8D90AE;

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_2:
    dw $0001,$01FC                                                       ;8D90B0;
    db $FC                                                               ;8D90B4;
    dw $3EDC                                                             ;8D90B5;

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_3:
    dw $0001,$01FC                                                       ;8D90B7;
    db $FC                                                               ;8D90BB;
    dw $3EDD                                                             ;8D90BC;

EnemyProjSpritemaps_TourianStatueEyeGlow_0:
    dw $0001,$01FC                                                       ;8D90BE;
    db $FC                                                               ;8D90C2;
    dw $3ED0                                                             ;8D90C3;

EnemyProjSpritemaps_TourianStatueEyeGlow_1:
    dw $0001,$01FC                                                       ;8D90C5;
    db $FC                                                               ;8D90C9;
    dw $3ED1                                                             ;8D90CA;

EnemyProjSpritemaps_TourianStatueEyeGlow_2:
    dw $0001,$01FC                                                       ;8D90CC;
    db $FC                                                               ;8D90D0;
    dw $3ED2                                                             ;8D90D1;

EnemyProjSpritemaps_TourianStatueEyeGlow_3:
    dw $0001,$C3F8                                                       ;8D90D3;
    db $F8                                                               ;8D90D7;
    dw $3EE2                                                             ;8D90D8;

EnemyProjSpritemaps_TourianStatueEyeGlow_4:
    dw $0001,$C3F8                                                       ;8D90DA;
    db $F8                                                               ;8D90DE;
    dw $3EE4                                                             ;8D90DF;

EnemyProjSpritemaps_TourianStatueEyeGlow_5:
    dw $0001,$C3F8                                                       ;8D90E1;
    db $F8                                                               ;8D90E5;
    dw $3EE6                                                             ;8D90E6;

EnemyProjSpritemaps_TourianStatueEyeGlow_6:
    dw $0001,$C3F8                                                       ;8D90E8;
    db $F8                                                               ;8D90EC;
    dw $3EE8                                                             ;8D90ED;

EnemyProjSpritemaps_TourianStatueEyeGlow_7:
    dw $0006,$0003                                                       ;8D90EF;
    db $04                                                               ;8D90F3;
    dw $FEEA,$0003                                                       ;8D90F4;
    db $FC                                                               ;8D90F8;
    dw $7EFA,$0003                                                       ;8D90F9;
    db $F4                                                               ;8D90FD;
    dw $7EEA,$01FC                                                       ;8D90FE;
    db $04                                                               ;8D9102;
    dw $BEEB,$01F4                                                       ;8D9103;
    db $04                                                               ;8D9107;
    dw $BEEA,$C3F4                                                       ;8D9108;
    db $F4                                                               ;8D910C;
    dw $3EEA                                                             ;8D910D;

EnemyProjSpritemaps_TourianStatueEyeGlow_8:
    dw $0004,$C200                                                       ;8D910F;
    db $00                                                               ;8D9113;
    dw $7EEE,$C3F0                                                       ;8D9114;
    db $00                                                               ;8D9118;
    dw $3EEE,$C200                                                       ;8D9119;
    db $F0                                                               ;8D911D;
    dw $7EEC,$C3F0                                                       ;8D911E;
    db $F0                                                               ;8D9122;
    dw $3EEC                                                             ;8D9123;

EnemyProjSpritemaps_TourianStatueUnlockingParticle_0:
    dw $0001,$01FC                                                       ;8D9125;
    db $FC                                                               ;8D9129;
    dw $3ED3                                                             ;8D912A;

EnemyProjSpritemaps_TourianStatueUnlockingParticle_1:
    dw $0001,$01FC                                                       ;8D912C;
    db $FC                                                               ;8D9130;
    dw $7ED3                                                             ;8D9131;

EnemyProjSpritemaps_TourianStatueUnlockingParticle_2:
    dw $0001,$01FC                                                       ;8D9133;
    db $FC                                                               ;8D9137;
    dw $BED3                                                             ;8D9138;

EnemyProjSpritemaps_TourianStatueUnlockingParticle_3:
    dw $0001,$01FC                                                       ;8D913A;
    db $FC                                                               ;8D913E;
    dw $FED3                                                             ;8D913F;

EnemyProjSpritemaps_TourianStatuesSoul_0:
    dw $0004,$0000                                                       ;8D9141;
    db $00                                                               ;8D9145;
    dw $3ED6,$01F8                                                       ;8D9146;
    db $00                                                               ;8D914A;
    dw $3ED5,$01FC                                                       ;8D914B;
    db $08                                                               ;8D914F;
    dw $3ED4,$C3F8                                                       ;8D9150;
    db $F8                                                               ;8D9154;
    dw $3EE0                                                             ;8D9155;

EnemyProjSpritemaps_TourianStatuesSoul_1:
    dw $0004,$01FC                                                       ;8D9157;
    db $08                                                               ;8D915B;
    dw $3ED9,$0000                                                       ;8D915C;
    db $00                                                               ;8D9160;
    dw $3ED8,$01F8                                                       ;8D9161;
    db $00                                                               ;8D9165;
    dw $3ED7,$C3F8                                                       ;8D9166;
    db $F8                                                               ;8D916A;
    dw $3EE0                                                             ;8D916B;

EnemyProjSpritemaps_TourianStatueBaseDecoration:
    dw $0007,$C228                                                       ;8D916D;
    db $F8                                                               ;8D9171;
    dw $1F9C,$C218                                                       ;8D9172;
    db $F8                                                               ;8D9176;
    dw $1F9A,$C208                                                       ;8D9177;
    db $F8                                                               ;8D917B;
    dw $1F98,$C3F8                                                       ;8D917C;
    db $F8                                                               ;8D9180;
    dw $1F96,$C3E8                                                       ;8D9181;
    db $F8                                                               ;8D9185;
    dw $1F94,$C3D8                                                       ;8D9186;
    db $F8                                                               ;8D918A;
    dw $1F92,$C3C8                                                       ;8D918B;
    db $F8                                                               ;8D918F;
    dw $1F90                                                             ;8D9190;

EnemyProjSpritemaps_TourianStatueRidley:
    dw $0017,$C3E5                                                       ;8D9192;
    db $18                                                               ;8D9196;
    dw $2344,$C3E5                                                       ;8D9197;
    db $08                                                               ;8D919B;
    dw $232C,$C3F5                                                       ;8D919C;
    db $18                                                               ;8D91A0;
    dw $2346,$000D                                                       ;8D91A1;
    db $20                                                               ;8D91A5;
    dw $237D,$000D                                                       ;8D91A6;
    db $18                                                               ;8D91AA;
    dw $236D,$0005                                                       ;8D91AB;
    db $18                                                               ;8D91AF;
    dw $2348,$C215                                                       ;8D91B0;
    db $08                                                               ;8D91B4;
    dw $2342,$C205                                                       ;8D91B5;
    db $08                                                               ;8D91B9;
    dw $2340,$C3F5                                                       ;8D91BA;
    db $08                                                               ;8D91BE;
    dw $232E,$C3D5                                                       ;8D91BF;
    db $08                                                               ;8D91C3;
    dw $232A,$C215                                                       ;8D91C4;
    db $F8                                                               ;8D91C8;
    dw $2328,$C205                                                       ;8D91C9;
    db $F8                                                               ;8D91CD;
    dw $2326,$C3F5                                                       ;8D91CE;
    db $F8                                                               ;8D91D2;
    dw $2324,$C3E5                                                       ;8D91D3;
    db $F8                                                               ;8D91D7;
    dw $2322,$C3D5                                                       ;8D91D8;
    db $F8                                                               ;8D91DC;
    dw $2320,$C215                                                       ;8D91DD;
    db $E8                                                               ;8D91E1;
    dw $230E,$C205                                                       ;8D91E2;
    db $E8                                                               ;8D91E6;
    dw $230C,$C3F5                                                       ;8D91E7;
    db $E8                                                               ;8D91EB;
    dw $230A,$C3E5                                                       ;8D91EC;
    db $E8                                                               ;8D91F0;
    dw $2308,$C215                                                       ;8D91F1;
    db $D8                                                               ;8D91F5;
    dw $2306,$C205                                                       ;8D91F6;
    db $D8                                                               ;8D91FA;
    dw $2304,$C3F5                                                       ;8D91FB;
    db $D8                                                               ;8D91FF;
    dw $2302,$C3E5                                                       ;8D9200;
    db $D8                                                               ;8D9204;
    dw $2300                                                             ;8D9205;

EnemyProjSpritemaps_TourianStatuePhantoon:
    dw $0013,$0008                                                       ;8D9207;
    db $1C                                                               ;8D920B;
    dw $2587,$0000                                                       ;8D920C;
    db $1C                                                               ;8D9210;
    dw $2586,$01F8                                                       ;8D9211;
    db $1C                                                               ;8D9215;
    dw $2585,$01F0                                                       ;8D9216;
    db $1C                                                               ;8D921A;
    dw $2584,$0000                                                       ;8D921B;
    db $04                                                               ;8D921F;
    dw $2583,$0000                                                       ;8D9220;
    db $FC                                                               ;8D9224;
    dw $2581,$01F8                                                       ;8D9225;
    db $04                                                               ;8D9229;
    dw $2582,$01F8                                                       ;8D922A;
    db $FC                                                               ;8D922E;
    dw $2580,$C208                                                       ;8D922F;
    db $EC                                                               ;8D9233;
    dw $2561,$C3E8                                                       ;8D9234;
    db $EC                                                               ;8D9238;
    dw $254D,$C208                                                       ;8D9239;
    db $FC                                                               ;8D923D;
    dw $2565,$C208                                                       ;8D923E;
    db $0C                                                               ;8D9242;
    dw $256B,$C3F8                                                       ;8D9243;
    db $0C                                                               ;8D9247;
    dw $2569,$C3E8                                                       ;8D9248;
    db $0C                                                               ;8D924C;
    dw $2567,$C3E8                                                       ;8D924D;
    db $FC                                                               ;8D9251;
    dw $2563,$C200                                                       ;8D9252;
    db $EC                                                               ;8D9256;
    dw $2560,$C3F0                                                       ;8D9257;
    db $EC                                                               ;8D925B;
    dw $254E,$C200                                                       ;8D925C;
    db $DC                                                               ;8D9260;
    dw $254B,$C3F0                                                       ;8D9261;
    db $DC                                                               ;8D9265;
    dw $2549                                                             ;8D9266;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8D9268:
    dw $0001,$81F9                                                       ;8D9268;
    db $F9                                                               ;8D926C;
    dw $230E                                                             ;8D926D;

UNUSED_EnemyProjSpritemaps_1_8D926F:
    dw $0001,$81FD                                                       ;8D926F;
    db $F5                                                               ;8D9273;
    dw $2320                                                             ;8D9274;

UNUSED_EnemyProjSpritemaps_2_8D9276:
    dw $0001,$8003                                                       ;8D9276;
    db $EE                                                               ;8D927A;
    dw $2304                                                             ;8D927B;

UNUSED_EnemyProjSpritemaps_3_8D927D:
    dw $0001,$8005                                                       ;8D927D;
    db $EC                                                               ;8D9281;
    dw $2308                                                             ;8D9282;

UNUSED_EnemyProjSpritemaps_4_8D9284:
    dw $0001,$8005                                                       ;8D9284;
    db $EC                                                               ;8D9288;
    dw $230C                                                             ;8D9289;

UNUSED_EnemyProjSpritemaps_5_8D928B:
    dw $0001,$8005                                                       ;8D928B;
    db $EC                                                               ;8D928F;
    dw $2326                                                             ;8D9290;

UNUSED_EnemyProjSpritemaps_6_8D9292:
    dw $0001,$8005                                                       ;8D9292;
    db $EC                                                               ;8D9296;
    dw $232E                                                             ;8D9297;

UNUSED_EnemyProjSpritemaps_7_8D9299:
    dw $0001,$81F8                                                       ;8D9299;
    db $F9                                                               ;8D929D;
    dw $630E                                                             ;8D929E;

UNUSED_EnemyProjSpritemaps_8_8D92A0:
    dw $0001,$81F4                                                       ;8D92A0;
    db $F5                                                               ;8D92A4;
    dw $6320                                                             ;8D92A5;

UNUSED_EnemyProjSpritemaps_9_8D92A7:
    dw $0001,$81EE                                                       ;8D92A7;
    db $EE                                                               ;8D92AB;
    dw $6304                                                             ;8D92AC;

UNUSED_EnemyProjSpritemaps_A_8D92AE:
    dw $0001,$81EC                                                       ;8D92AE;
    db $EC                                                               ;8D92B2;
    dw $6308                                                             ;8D92B3;

UNUSED_EnemyProjSpritemaps_B_8D92B5:
    dw $0001,$81EC                                                       ;8D92B5;
    db $EC                                                               ;8D92B9;
    dw $630C                                                             ;8D92BA;

UNUSED_EnemyProjSpritemaps_C_8D92BC:
    dw $0001,$81EC                                                       ;8D92BC;
    db $EC                                                               ;8D92C0;
    dw $6326                                                             ;8D92C1;

UNUSED_EnemyProjSpritemaps_D_8D92C3:
    dw $0001,$81EB                                                       ;8D92C3;
    db $EC                                                               ;8D92C7;
    dw $232E                                                             ;8D92C8;

UNUSED_EnemyProjSpritemaps_E_8D92CA:
    dw $0002,$01F1                                                       ;8D92CA;
    db $F8                                                               ;8D92CE;
    dw $6334,$0008                                                       ;8D92CF;
    db $F8                                                               ;8D92D3;
    dw $2334                                                             ;8D92D4;

UNUSED_EnemyProjSpritemaps_F_8D92D6:
    dw $0002,$01F1                                                       ;8D92D6;
    db $F8                                                               ;8D92DA;
    dw $6324,$0008                                                       ;8D92DB;
    db $F8                                                               ;8D92DF;
    dw $2324                                                             ;8D92E0;

UNUSED_EnemyProjSpritemaps_10_8D92E2:
    dw $0002,$81E9                                                       ;8D92E2;
    db $F0                                                               ;8D92E6;
    dw $6328,$8008                                                       ;8D92E7;
    db $F0                                                               ;8D92EB;
    dw $2328                                                             ;8D92EC;

UNUSED_EnemyProjSpritemaps_11_8D92EE:
    dw $0002,$81E9                                                       ;8D92EE;
    db $F0                                                               ;8D92F2;
    dw $632C,$8008                                                       ;8D92F3;
    db $F0                                                               ;8D92F7;
    dw $232C                                                             ;8D92F8;

UNUSED_EnemyProjSpritemaps_12_8D92FA:
    dw $0002,$81E8                                                       ;8D92FA;
    db $F0                                                               ;8D92FE;
    dw $632A,$8009                                                       ;8D92FF;
    db $F0                                                               ;8D9303;
    dw $232A                                                             ;8D9304;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_PuromiBody_0:
    dw $0001,$81F9                                                       ;8D9306;
    db $F8                                                               ;8D930A;
    dw $230A                                                             ;8D930B;

EnemyProjSpritemaps_PuromiBody_1:
    dw $0001,$81F9                                                       ;8D930D;
    db $F8                                                               ;8D9311;
    dw $2308                                                             ;8D9312;

EnemyProjSpritemaps_PuromiBody_2:
    dw $0001,$81F8                                                       ;8D9314;
    db $F8                                                               ;8D9318;
    dw $E30A                                                             ;8D9319;

EnemyProjSpritemaps_PuromiBody_3:
    dw $0001,$81F8                                                       ;8D931B;
    db $F8                                                               ;8D931F;
    dw $E308                                                             ;8D9320;

EnemyProjSpritemaps_PuromiBody_4:
    dw $0001,$81F9                                                       ;8D9322;
    db $F8                                                               ;8D9326;
    dw $2306                                                             ;8D9327;

EnemyProjSpritemaps_PuromiBody_5:
    dw $0001,$81F9                                                       ;8D9329;
    db $F8                                                               ;8D932D;
    dw $2322                                                             ;8D932E;

EnemyProjSpritemaps_PuromiBody_6:
    dw $0001,$81F8                                                       ;8D9330;
    db $F8                                                               ;8D9334;
    dw $E306                                                             ;8D9335;

EnemyProjSpritemaps_PuromiBody_7:
    dw $0001,$81F8                                                       ;8D9337;
    db $F8                                                               ;8D933B;
    dw $E322                                                             ;8D933C;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D933E:
    dw $0000                                                             ;8D933E;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_LavaquakeRocks:
    dw $0001,$01FC                                                       ;8D9340;
    db $FC                                                               ;8D9344;
    dw $210A                                                             ;8D9345;

EnemyProjSpritemaps_ShaktoolsAttack:
    dw $0001,$01FC                                                       ;8D9347;
    db $FC                                                               ;8D934B;
    dw $2053                                                             ;8D934C;

EnemyProjSpritemaps_ShaktoolsAttack_FrontMiddleCircle:
    dw $0001,$01FC                                                       ;8D934E;
    db $FC                                                               ;8D9352;
    dw $2051                                                             ;8D9353;

EnemyProjSpritemaps_ShaktoolsAttack_FrontCircle:
    dw $0004,$0000                                                       ;8D9355;
    db $00                                                               ;8D9359;
    dw $E060,$0000                                                       ;8D935A;
    db $F8                                                               ;8D935E;
    dw $6060,$01F8                                                       ;8D935F;
    db $00                                                               ;8D9363;
    dw $A060,$01F8                                                       ;8D9364;
    db $F8                                                               ;8D9368;
    dw $2060                                                             ;8D9369;

EnemyProjSpritemaps_MotherBrainsTurrets_Left:
    dw $0001,$01EF                                                       ;8D936B;
    db $F3                                                               ;8D936F;
    dw $259A                                                             ;8D9370;

EnemyProjSpritemaps_MotherBrainsTurrets_DownLeft:
    dw $0001,$01F2                                                       ;8D9372;
    db $FD                                                               ;8D9376;
    dw $258B                                                             ;8D9377;

EnemyProjSpritemaps_MotherBrainsTurrets_Down:
    dw $0001,$01FC                                                       ;8D9379;
    db $FF                                                               ;8D937D;
    dw $259B                                                             ;8D937E;

EnemyProjSpritemaps_MotherBrainsTurrets_DownRight:
    dw $0001,$0006                                                       ;8D9380;
    db $FD                                                               ;8D9384;
    dw $658B                                                             ;8D9385;

EnemyProjSpritemaps_MotherBrainsTurrets_Right:
    dw $0001,$0009                                                       ;8D9387;
    db $F3                                                               ;8D938B;
    dw $659A                                                             ;8D938C;

EnemyProjSpritemaps_MotherBrainsTurrets_UpRight:
    dw $0001,$0006                                                       ;8D938E;
    db $EB                                                               ;8D9392;
    dw $E58B                                                             ;8D9393;

EnemyProjSpritemaps_MotherBrainsTurrets_Up:
    dw $0001,$01FC                                                       ;8D9395;
    db $E7                                                               ;8D9399;
    dw $A59B                                                             ;8D939A;

EnemyProjSpritemaps_MotherBrainsTurrets_UpLeft:
    dw $0001,$01F2                                                       ;8D939C;
    db $EB                                                               ;8D93A0;
    dw $A58B                                                             ;8D93A1;

EnemyProjSpritemaps_MotherBrainsTurretBullets_Left:
    dw $0001,$01FC                                                       ;8D93A3;
    db $FC                                                               ;8D93A7;
    dw $25A8                                                             ;8D93A8;

EnemyProjSpritemaps_MotherBrainsTurretBullets_DownLeft:
    dw $0001,$01FC                                                       ;8D93AA;
    db $FC                                                               ;8D93AE;
    dw $25A6                                                             ;8D93AF;

EnemyProjSpritemaps_MotherBrainsTurretBullets_Down:
    dw $0001,$01FC                                                       ;8D93B1;
    db $FC                                                               ;8D93B5;
    dw $25A7                                                             ;8D93B6;

EnemyProjSpritemaps_MotherBrainsTurretBullets_DownRight:
    dw $0001,$01FC                                                       ;8D93B8;
    db $FC                                                               ;8D93BC;
    dw $65A6                                                             ;8D93BD;

EnemyProjSpritemaps_MotherBrainsTurretBullets_Right:
    dw $0001,$01FC                                                       ;8D93BF;
    db $FC                                                               ;8D93C3;
    dw $65A8                                                             ;8D93C4;

EnemyProjSpritemaps_MotherBrainsTurretBullets_UpRight:
    dw $0001,$01FC                                                       ;8D93C6;
    db $FC                                                               ;8D93CA;
    dw $E5A6                                                             ;8D93CB;

EnemyProjSpritemaps_MotherBrainsTurretBullets_Up:
    dw $0001,$01FC                                                       ;8D93CD;
    db $FC                                                               ;8D93D1;
    dw $A5A7                                                             ;8D93D2;

EnemyProjSpritemaps_MotherBrainsTurretBullets_UpLeft:
    dw $0001,$01FC                                                       ;8D93D4;
    db $FC                                                               ;8D93D8;
    dw $A5A6                                                             ;8D93D9;

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_0:
    dw $000B,$01FC                                                       ;8D93DB;
    db $E5                                                               ;8D93DF;
    dw $3AED,$000E                                                       ;8D93E0;
    db $EF                                                               ;8D93E4;
    dw $3AFC,$01EA                                                       ;8D93E5;
    db $EF                                                               ;8D93E9;
    dw $7AFC,$0025                                                       ;8D93EA;
    db $F8                                                               ;8D93EE;
    dw $3AEC,$001A                                                       ;8D93EF;
    db $D6                                                               ;8D93F3;
    dw $3AEC,$01DF                                                       ;8D93F4;
    db $D6                                                               ;8D93F8;
    dw $3AEC,$01D3                                                       ;8D93F9;
    db $F8                                                               ;8D93FD;
    dw $3AEC,$01ED                                                       ;8D93FE;
    db $F8                                                               ;8D9402;
    dw $3AEB,$000C                                                       ;8D9403;
    db $F8                                                               ;8D9407;
    dw $3AEB,$0004                                                       ;8D9408;
    db $ED                                                               ;8D940C;
    dw $3AEB,$01F5                                                       ;8D940D;
    db $ED                                                               ;8D9411;
    dw $3AEB                                                             ;8D9412;

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_1:
    dw $0007,$01FC                                                       ;8D9414;
    db $E1                                                               ;8D9418;
    dw $3AEE,$0011                                                       ;8D9419;
    db $ED                                                               ;8D941D;
    dw $3AFD,$01E7                                                       ;8D941E;
    db $ED                                                               ;8D9422;
    dw $7AFD,$01F0                                                       ;8D9423;
    db $E8                                                               ;8D9427;
    dw $7AFC,$01E8                                                       ;8D9428;
    db $F8                                                               ;8D942C;
    dw $7ADD,$0010                                                       ;8D942D;
    db $F8                                                               ;8D9431;
    dw $3ADD,$0008                                                       ;8D9432;
    db $E8                                                               ;8D9436;
    dw $3AFC                                                             ;8D9437;

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_2:
    dw $0007,$01FC                                                       ;8D9439;
    db $DE                                                               ;8D943D;
    dw $3AEF,$0018                                                       ;8D943E;
    db $E8                                                               ;8D9442;
    dw $3AFE,$01E0                                                       ;8D9443;
    db $E8                                                               ;8D9447;
    dw $7AFE,$01E5                                                       ;8D9448;
    db $F8                                                               ;8D944C;
    dw $7ADE,$0014                                                       ;8D944D;
    db $F8                                                               ;8D9451;
    dw $3ADE,$000A                                                       ;8D9452;
    db $E6                                                               ;8D9456;
    dw $3AFD,$01EE                                                       ;8D9457;
    db $E6                                                               ;8D945B;
    dw $7AFD                                                             ;8D945C;

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_3:
    dw $0007,$01FC                                                       ;8D945E;
    db $DA                                                               ;8D9462;
    dw $3AFF,$001D                                                       ;8D9463;
    db $E6                                                               ;8D9467;
    dw $3AFF,$01DC                                                       ;8D9468;
    db $E6                                                               ;8D946C;
    dw $7AFF,$01DE                                                       ;8D946D;
    db $F8                                                               ;8D9471;
    dw $7ADF,$001B                                                       ;8D9472;
    db $F8                                                               ;8D9476;
    dw $3ADF,$0010                                                       ;8D9477;
    db $E0                                                               ;8D947B;
    dw $3AFE,$01E8                                                       ;8D947C;
    db $E0                                                               ;8D9480;
    dw $7AFE                                                             ;8D9481;

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_4:
    dw $000A,$000A                                                       ;8D9483;
    db $F3                                                               ;8D9487;
    dw $3AEA,$01FC                                                       ;8D9488;
    db $EC                                                               ;8D948C;
    dw $3AEA,$01FC                                                       ;8D948D;
    db $D4                                                               ;8D9491;
    dw $3AEC,$0020                                                       ;8D9492;
    db $E4                                                               ;8D9496;
    dw $3AEC,$01F0                                                       ;8D9497;
    db $F3                                                               ;8D949B;
    dw $3AEA,$01DA                                                       ;8D949C;
    db $E4                                                               ;8D94A0;
    dw $3AEC,$01D8                                                       ;8D94A1;
    db $F8                                                               ;8D94A5;
    dw $7AFF,$0020                                                       ;8D94A6;
    db $F8                                                               ;8D94AA;
    dw $3AFF,$0014                                                       ;8D94AB;
    db $DC                                                               ;8D94AF;
    dw $3AFF,$01E4                                                       ;8D94B0;
    db $DC                                                               ;8D94B4;
    dw $7AFF                                                             ;8D94B5;

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_5:
    dw $000E,$01FC                                                       ;8D94B7;
    db $EA                                                               ;8D94BB;
    dw $3AEB,$0022                                                       ;8D94BC;
    db $E3                                                               ;8D94C0;
    dw $3AEC,$000A                                                       ;8D94C1;
    db $F3                                                               ;8D94C5;
    dw $3AEB,$01EF                                                       ;8D94C6;
    db $F3                                                               ;8D94CA;
    dw $3AEB,$01D8                                                       ;8D94CB;
    db $E3                                                               ;8D94CF;
    dw $3AEC,$01E1                                                       ;8D94D0;
    db $D8                                                               ;8D94D4;
    dw $3AEC,$01EC                                                       ;8D94D5;
    db $F8                                                               ;8D94D9;
    dw $3AEA,$01F4                                                       ;8D94DA;
    db $EC                                                               ;8D94DE;
    dw $3AEA,$0005                                                       ;8D94DF;
    db $EC                                                               ;8D94E3;
    dw $3AEA,$000C                                                       ;8D94E4;
    db $F8                                                               ;8D94E8;
    dw $3AEA,$0023                                                       ;8D94E9;
    db $F8                                                               ;8D94ED;
    dw $3AEC,$0018                                                       ;8D94EE;
    db $D8                                                               ;8D94F2;
    dw $3AEC,$01FC                                                       ;8D94F3;
    db $D1                                                               ;8D94F7;
    dw $3AEC,$01D5                                                       ;8D94F8;
    db $F8                                                               ;8D94FC;
    dw $3AEC                                                             ;8D94FD;

EnemyProjSpritemaps_MotherBrainsDrool_0:
    dw $0001,$01FC                                                       ;8D94FF;
    db $FA                                                               ;8D9503;
    dw $3AF0                                                             ;8D9504;

EnemyProjSpritemaps_MotherBrainsDrool_1:
    dw $0001,$01FC                                                       ;8D9506;
    db $FB                                                               ;8D950A;
    dw $3AF1                                                             ;8D950B;

EnemyProjSpritemaps_MotherBrainsDrool_2:
    dw $0001,$01FC                                                       ;8D950D;
    db $FC                                                               ;8D9511;
    dw $3AF2                                                             ;8D9512;

EnemyProjSpritemaps_MotherBrainsDrool_3:
    dw $0001,$01FC                                                       ;8D9514;
    db $FC                                                               ;8D9518;
    dw $3AF3                                                             ;8D9519;

EnemyProjSpritemaps_MotherBrainsDrool_4:
    dw $0001,$01FC                                                       ;8D951B;
    db $FC                                                               ;8D951F;
    dw $3AF4                                                             ;8D9520;

EnemyProjSpritemaps_MotherBrainsDrool_5:
    dw $0001,$01FC                                                       ;8D9522;
    db $FC                                                               ;8D9526;
    dw $3AF5                                                             ;8D9527;

EnemyProjSpritemaps_MotherBrainsDrool_6:
    dw $0001,$01FC                                                       ;8D9529;
    db $FC                                                               ;8D952D;
    dw $3AF6                                                             ;8D952E;

EnemyProjSpritemaps_MotherBrainsDrool_7:
    dw $0001,$01FC                                                       ;8D9530;
    db $FC                                                               ;8D9534;
    dw $3ADA                                                             ;8D9535;

EnemyProjSpritemaps_MotherBrainsDrool_8:
    dw $0002,$01FC                                                       ;8D9537;
    db $00                                                               ;8D953B;
    dw $3ADC,$01FC                                                       ;8D953C;
    db $FC                                                               ;8D9540;
    dw $3ADB                                                             ;8D9541;

EnemyProjSpritemaps_MotherBrainsDrool_9:
    dw $0002,$01FC                                                       ;8D9543;
    db $04                                                               ;8D9547;
    dw $3ADC,$01FC                                                       ;8D9548;
    db $FC                                                               ;8D954C;
    dw $3ADB                                                             ;8D954D;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_0:
    dw $0002,$01EE                                                       ;8D954F;
    db $F2                                                               ;8D9553;
    dw $3AF7,$C3F8                                                       ;8D9554;
    db $F8                                                               ;8D9558;
    dw $3AD0                                                             ;8D9559;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_1:
    dw $0004,$01EC                                                       ;8D955B;
    db $EE                                                               ;8D955F;
    dw $3AF7,$01EE                                                       ;8D9560;
    db $F1                                                               ;8D9564;
    dw $3AF8,$C200                                                       ;8D9565;
    db $00                                                               ;8D9569;
    dw $7AD0,$C3F8                                                       ;8D956A;
    db $F7                                                               ;8D956E;
    dw $3AD2                                                             ;8D956F;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_2:
    dw $0007,$01E8                                                       ;8D9571;
    db $E8                                                               ;8D9575;
    dw $3AF9,$01EE                                                       ;8D9576;
    db $EA                                                               ;8D957A;
    dw $3AF7,$01EC                                                       ;8D957B;
    db $ED                                                               ;8D957F;
    dw $3AF8,$01EE                                                       ;8D9580;
    db $F0                                                               ;8D9584;
    dw $3AF9,$C208                                                       ;8D9585;
    db $08                                                               ;8D9589;
    dw $FAD0,$C200                                                       ;8D958A;
    db $01                                                               ;8D958E;
    dw $3AD2,$C3F8                                                       ;8D958F;
    db $F6                                                               ;8D9593;
    dw $3AD4                                                             ;8D9594;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_3:
    dw $0008,$01E8                                                       ;8D9596;
    db $E6                                                               ;8D959A;
    dw $3AF7,$01EE                                                       ;8D959B;
    db $E9                                                               ;8D959F;
    dw $3AF8,$01EC                                                       ;8D95A0;
    db $EC                                                               ;8D95A4;
    dw $3AF9,$01EE                                                       ;8D95A5;
    db $EF                                                               ;8D95A9;
    dw $3AFA,$C210                                                       ;8D95AA;
    db $0E                                                               ;8D95AE;
    dw $7AD0,$C208                                                       ;8D95AF;
    db $07                                                               ;8D95B3;
    dw $3AD2,$C200                                                       ;8D95B4;
    db $00                                                               ;8D95B8;
    dw $3AD4,$C3F8                                                       ;8D95B9;
    db $F4                                                               ;8D95BD;
    dw $3AD6                                                             ;8D95BE;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_4:
    dw $0007,$01E8                                                       ;8D95C0;
    db $E5                                                               ;8D95C4;
    dw $3AF8,$01EE                                                       ;8D95C5;
    db $E8                                                               ;8D95C9;
    dw $3AF9,$01EC                                                       ;8D95CA;
    db $EB                                                               ;8D95CE;
    dw $3AFA,$C213                                                       ;8D95CF;
    db $0D                                                               ;8D95D3;
    dw $3AD2,$C208                                                       ;8D95D4;
    db $06                                                               ;8D95D8;
    dw $3AD4,$C200                                                       ;8D95D9;
    db $FE                                                               ;8D95DD;
    dw $3AD6,$C3F8                                                       ;8D95DE;
    db $F1                                                               ;8D95E2;
    dw $3AD8                                                             ;8D95E3;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_5:
    dw $0006,$01E8                                                       ;8D95E5;
    db $E4                                                               ;8D95E9;
    dw $3AF9,$01EF                                                       ;8D95EA;
    db $E7                                                               ;8D95EE;
    dw $3AFA,$01EC                                                       ;8D95EF;
    db $EA                                                               ;8D95F3;
    dw $3AFB,$C212                                                       ;8D95F4;
    db $0C                                                               ;8D95F8;
    dw $3AD4,$C208                                                       ;8D95F9;
    db $02                                                               ;8D95FD;
    dw $3AD6,$C200                                                       ;8D95FE;
    db $FB                                                               ;8D9602;
    dw $3AD8                                                             ;8D9603;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_6:
    dw $0004,$01E8                                                       ;8D9605;
    db $E3                                                               ;8D9609;
    dw $3AFA,$01F0                                                       ;8D960A;
    db $E6                                                               ;8D960E;
    dw $3AFB,$C212                                                       ;8D960F;
    db $0A                                                               ;8D9613;
    dw $3AD6,$C208                                                       ;8D9614;
    db $FF                                                               ;8D9618;
    dw $3AD8                                                             ;8D9619;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_7:
    dw $0002,$01E8                                                       ;8D961B;
    db $E3                                                               ;8D961F;
    dw $3AFB,$C212                                                       ;8D9620;
    db $07                                                               ;8D9624;
    dw $3AD8                                                             ;8D9625;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_0:
    dw $0001,$01FC                                                       ;8D9627;
    db $F8                                                               ;8D962B;
    dw $3AF7                                                             ;8D962C;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_1:
    dw $0002,$01FA                                                       ;8D962E;
    db $F4                                                               ;8D9632;
    dw $3AF7,$01FC                                                       ;8D9633;
    db $F7                                                               ;8D9637;
    dw $3AF8                                                             ;8D9638;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_2:
    dw $0004,$01F6                                                       ;8D963A;
    db $EE                                                               ;8D963E;
    dw $3AF9,$01FC                                                       ;8D963F;
    db $F0                                                               ;8D9643;
    dw $3AF7,$01FA                                                       ;8D9644;
    db $F3                                                               ;8D9648;
    dw $3AF8,$01FC                                                       ;8D9649;
    db $F6                                                               ;8D964D;
    dw $3AF9                                                             ;8D964E;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_3:
    dw $0004,$01F6                                                       ;8D9650;
    db $EC                                                               ;8D9654;
    dw $3AF7,$01FC                                                       ;8D9655;
    db $EF                                                               ;8D9659;
    dw $3AF8,$01FA                                                       ;8D965A;
    db $F2                                                               ;8D965E;
    dw $3AF9,$01FC                                                       ;8D965F;
    db $F5                                                               ;8D9663;
    dw $3AFA                                                             ;8D9664;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_4:
    dw $0003,$01F6                                                       ;8D9666;
    db $EB                                                               ;8D966A;
    dw $3AF8,$01FC                                                       ;8D966B;
    db $EE                                                               ;8D966F;
    dw $3AF9,$01FA                                                       ;8D9670;
    db $F1                                                               ;8D9674;
    dw $3AFA                                                             ;8D9675;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_5:
    dw $0003,$01F6                                                       ;8D9677;
    db $EA                                                               ;8D967B;
    dw $3AF9,$01FD                                                       ;8D967C;
    db $ED                                                               ;8D9680;
    dw $3AFA,$01FA                                                       ;8D9681;
    db $F0                                                               ;8D9685;
    dw $3AFB                                                             ;8D9686;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_6:
    dw $0002,$01F6                                                       ;8D9688;
    db $E9                                                               ;8D968C;
    dw $3AFA,$01FE                                                       ;8D968D;
    db $EC                                                               ;8D9691;
    dw $3AFB                                                             ;8D9692;

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_7:
    dw $0001,$01F6                                                       ;8D9694;
    db $E9                                                               ;8D9698;
    dw $3AFB                                                             ;8D9699;

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_0:
    dw $0001,$01FC                                                       ;8D969B;
    db $FC                                                               ;8D969F;
    dw $3302                                                             ;8D96A0;

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_1:
    dw $0001,$C3F8                                                       ;8D96A2;
    db $F8                                                               ;8D96A6;
    dw $3303                                                             ;8D96A7;

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_2:
    dw $0001,$01FC                                                       ;8D96A9;
    db $FC                                                               ;8D96AD;
    dw $3312                                                             ;8D96AE;

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_3:
    dw $0001,$C3F8                                                       ;8D96B0;
    db $F8                                                               ;8D96B4;
    dw $3305                                                             ;8D96B5;

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_4:
    dw $0001,$01FC                                                       ;8D96B7;
    db $FC                                                               ;8D96BB;
    dw $3307                                                             ;8D96BC;

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_5:
    dw $0001,$C3F8                                                       ;8D96BE;
    db $F8                                                               ;8D96C2;
    dw $3308                                                             ;8D96C3;

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_6:
    dw $0001,$01FC                                                       ;8D96C5;
    db $FC                                                               ;8D96C9;
    dw $3317                                                             ;8D96CA;

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_7:
    dw $0001,$C3F8                                                       ;8D96CC;
    db $F8                                                               ;8D96D0;
    dw $330A                                                             ;8D96D1;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8D96D3:
    dw $0001,$01FC                                                       ;8D96D3;
    db $FC                                                               ;8D96D7;
    dw $330C                                                             ;8D96D8;

UNUSED_EnemyProjSpritemaps_1_8D96DA:
    dw $0001,$01FC                                                       ;8D96DA;
    db $FC                                                               ;8D96DE;
    dw $330D                                                             ;8D96DF;

UNUSED_EnemyProjSpritemaps_2_8D96E1:
    dw $0001,$01FC                                                       ;8D96E1;
    db $FC                                                               ;8D96E5;
    dw $330E                                                             ;8D96E6;

UNUSED_EnemyProjSpritemaps_3_8D96E8:
    dw $0001,$01FC                                                       ;8D96E8;
    db $FC                                                               ;8D96EC;
    dw $330F                                                             ;8D96ED;

UNUSED_EnemyProjSpritemaps_4_8D96EF:
    dw $0001,$01FC                                                       ;8D96EF;
    db $FC                                                               ;8D96F3;
    dw $331C                                                             ;8D96F4;

UNUSED_EnemyProjSpritemaps_5_8D96F6:
    dw $0001,$01FC                                                       ;8D96F6;
    db $FC                                                               ;8D96FA;
    dw $331D                                                             ;8D96FB;

UNUSED_EnemyProjSpritemaps_6_8D96FD:
    dw $0001,$01FC                                                       ;8D96FD;
    db $FC                                                               ;8D9701;
    dw $331E                                                             ;8D9702;

UNUSED_EnemyProjSpritemaps_7_8D9704:
    dw $0001,$01FC                                                       ;8D9704;
    db $FC                                                               ;8D9708;
    dw $331F                                                             ;8D9709;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_TimeBombSetJapanSet:
    dw $000C,$0008                                                       ;8D970B;
    db $08                                                               ;8D970F;
    dw $35C9,$0008                                                       ;8D9710;
    db $00                                                               ;8D9714;
    dw $35C8,$0000                                                       ;8D9715;
    db $08                                                               ;8D9719;
    dw $35C7,$01F8                                                       ;8D971A;
    db $08                                                               ;8D971E;
    dw $35C6,$0000                                                       ;8D971F;
    db $00                                                               ;8D9723;
    dw $35C5,$01F8                                                       ;8D9724;
    db $00                                                               ;8D9728;
    dw $35C4,$C3E8                                                       ;8D9729;
    db $00                                                               ;8D972D;
    dw $35AD,$0018                                                       ;8D972E;
    db $F8                                                               ;8D9732;
    dw $35C9,$0018                                                       ;8D9733;
    db $F0                                                               ;8D9737;
    dw $35C8,$C208                                                       ;8D9738;
    db $F0                                                               ;8D973C;
    dw $35A6,$C3F8                                                       ;8D973D;
    db $F0                                                               ;8D9741;
    dw $35A2,$C3E8                                                       ;8D9742;
    db $F0                                                               ;8D9746;
    dw $35A0                                                             ;8D9747;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_0:
    dw $0001,$01FC                                                       ;8D9749;
    db $FD                                                               ;8D974D;
    dw $3121                                                             ;8D974E;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1:
    dw $0001,$01FC                                                       ;8D9750;
    db $FC                                                               ;8D9754;
    dw $3122                                                             ;8D9755;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2:
    dw $0001,$01FC                                                       ;8D9757;
    db $FB                                                               ;8D975B;
    dw $3123                                                             ;8D975C;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3:
    dw $0001,$01FC                                                       ;8D975E;
    db $FD                                                               ;8D9762;
    dw $3124                                                             ;8D9763;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_4:
    dw $0001,$01FC                                                       ;8D9765;
    db $FE                                                               ;8D9769;
    dw $B121                                                             ;8D976A;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_5:
    dw $0001,$01FC                                                       ;8D976C;
    db $FD                                                               ;8D9770;
    dw $3125                                                             ;8D9771;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_6:
    dw $0001,$01FC                                                       ;8D9773;
    db $FB                                                               ;8D9777;
    dw $3126                                                             ;8D9778;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_7:
    dw $0001,$01FC                                                       ;8D977A;
    db $FD                                                               ;8D977E;
    dw $3127                                                             ;8D977F;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_8:
    dw $0001,$01FB                                                       ;8D9781;
    db $FC                                                               ;8D9785;
    dw $3131                                                             ;8D9786;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_9:
    dw $0001,$01FC                                                       ;8D9788;
    db $FC                                                               ;8D978C;
    dw $3132                                                             ;8D978D;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_A:
    dw $0001,$01FE                                                       ;8D978F;
    db $FC                                                               ;8D9793;
    dw $3133                                                             ;8D9794;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_B:
    dw $0001,$01FB                                                       ;8D9796;
    db $FC                                                               ;8D979A;
    dw $3134                                                             ;8D979B;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_C:
    dw $0001,$01FA                                                       ;8D979D;
    db $FC                                                               ;8D97A1;
    dw $7131                                                             ;8D97A2;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_D:
    dw $0001,$01FB                                                       ;8D97A4;
    db $FC                                                               ;8D97A8;
    dw $3135                                                             ;8D97A9;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_E:
    dw $0001,$01FC                                                       ;8D97AB;
    db $FC                                                               ;8D97AF;
    dw $3136                                                             ;8D97B0;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_F:
    dw $0001,$01FB                                                       ;8D97B2;
    db $FC                                                               ;8D97B6;
    dw $3137                                                             ;8D97B7;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_10:
    dw $0001,$01FC                                                       ;8D97B9;
    db $FC                                                               ;8D97BD;
    dw $3138                                                             ;8D97BE;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_11:
    dw $0001,$01FC                                                       ;8D97C0;
    db $FB                                                               ;8D97C4;
    dw $3139                                                             ;8D97C5;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_12:
    dw $0001,$01FC                                                       ;8D97C7;
    db $FC                                                               ;8D97CB;
    dw $313A                                                             ;8D97CC;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_13:
    dw $0001,$01FC                                                       ;8D97CE;
    db $FC                                                               ;8D97D2;
    dw $313B                                                             ;8D97D3;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_14:
    dw $0001,$01FC                                                       ;8D97D5;
    db $FC                                                               ;8D97D9;
    dw $F138                                                             ;8D97DA;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_15:
    dw $0001,$01FB                                                       ;8D97DC;
    db $FD                                                               ;8D97E0;
    dw $313C                                                             ;8D97E1;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_16:
    dw $0001,$01FD                                                       ;8D97E3;
    db $FB                                                               ;8D97E7;
    dw $313D                                                             ;8D97E8;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_17:
    dw $0001,$01FC                                                       ;8D97EA;
    db $FC                                                               ;8D97EE;
    dw $313E                                                             ;8D97EF;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_18:
    dw $0001,$01FC                                                       ;8D97F1;
    db $FC                                                               ;8D97F5;
    dw $B138                                                             ;8D97F6;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_19:
    dw $0001,$01FC                                                       ;8D97F8;
    db $FB                                                               ;8D97FC;
    dw $B139                                                             ;8D97FD;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1A:
    dw $0001,$01FC                                                       ;8D97FF;
    db $FC                                                               ;8D9803;
    dw $B13A                                                             ;8D9804;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1B:
    dw $0001,$01FC                                                       ;8D9806;
    db $FC                                                               ;8D980A;
    dw $B13B                                                             ;8D980B;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1C:
    dw $0001,$01FC                                                       ;8D980D;
    db $FC                                                               ;8D9811;
    dw $7138                                                             ;8D9812;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1D:
    dw $0001,$01FB                                                       ;8D9814;
    db $FD                                                               ;8D9818;
    dw $B13C                                                             ;8D9819;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1E:
    dw $0001,$01FD                                                       ;8D981B;
    db $FB                                                               ;8D981F;
    dw $B13D                                                             ;8D9820;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1F:
    dw $0001,$01FC                                                       ;8D9822;
    db $FC                                                               ;8D9826;
    dw $B13E                                                             ;8D9827;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_20:
    dw $0001,$01FC                                                       ;8D9829;
    db $FB                                                               ;8D982D;
    dw $B121                                                             ;8D982E;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_21:
    dw $0001,$01FC                                                       ;8D9830;
    db $FC                                                               ;8D9834;
    dw $B122                                                             ;8D9835;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_22:
    dw $0001,$01FC                                                       ;8D9837;
    db $FB                                                               ;8D983B;
    dw $B123                                                             ;8D983C;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_23:
    dw $0001,$01FC                                                       ;8D983E;
    db $FC                                                               ;8D9842;
    dw $B124                                                             ;8D9843;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_24:
    dw $0001,$01FC                                                       ;8D9845;
    db $FC                                                               ;8D9849;
    dw $3121                                                             ;8D984A;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_25:
    dw $0001,$01FC                                                       ;8D984C;
    db $FC                                                               ;8D9850;
    dw $B125                                                             ;8D9851;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_26:
    dw $0001,$01FC                                                       ;8D9853;
    db $FC                                                               ;8D9857;
    dw $B126                                                             ;8D9858;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_27:
    dw $0001,$01FC                                                       ;8D985A;
    db $FB                                                               ;8D985E;
    dw $B127                                                             ;8D985F;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_28:
    dw $0001,$01FC                                                       ;8D9861;
    db $FC                                                               ;8D9865;
    dw $7131                                                             ;8D9866;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_29:
    dw $0001,$01FD                                                       ;8D9868;
    db $FC                                                               ;8D986C;
    dw $7132                                                             ;8D986D;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2A:
    dw $0001,$01FC                                                       ;8D986F;
    db $FC                                                               ;8D9873;
    dw $7133                                                             ;8D9874;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2B:
    dw $0001,$01FC                                                       ;8D9876;
    db $FC                                                               ;8D987A;
    dw $7134                                                             ;8D987B;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2C:
    dw $0001,$01FB                                                       ;8D987D;
    db $FC                                                               ;8D9881;
    dw $3131                                                             ;8D9882;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2D:
    dw $0001,$01FC                                                       ;8D9884;
    db $FC                                                               ;8D9888;
    dw $7135                                                             ;8D9889;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2E:
    dw $0001,$01FC                                                       ;8D988B;
    db $FC                                                               ;8D988F;
    dw $7136                                                             ;8D9890;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2F:
    dw $0001,$01FC                                                       ;8D9892;
    db $FC                                                               ;8D9896;
    dw $7137                                                             ;8D9897;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_30:
    dw $0001,$01FC                                                       ;8D9899;
    db $FC                                                               ;8D989D;
    dw $F138                                                             ;8D989E;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_31:
    dw $0001,$01FC                                                       ;8D98A0;
    db $FC                                                               ;8D98A4;
    dw $F139                                                             ;8D98A5;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_32:
    dw $0001,$01FC                                                       ;8D98A7;
    db $FC                                                               ;8D98AB;
    dw $F13A                                                             ;8D98AC;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_33:
    dw $0001,$01FC                                                       ;8D98AE;
    db $FC                                                               ;8D98B2;
    dw $F13B                                                             ;8D98B3;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_34:
    dw $0001,$01FC                                                       ;8D98B5;
    db $FD                                                               ;8D98B9;
    dw $3138                                                             ;8D98BA;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_35:
    dw $0001,$01FC                                                       ;8D98BC;
    db $FC                                                               ;8D98C0;
    dw $F13C                                                             ;8D98C1;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_36:
    dw $0001,$01FC                                                       ;8D98C3;
    db $FC                                                               ;8D98C7;
    dw $F13D                                                             ;8D98C8;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_37:
    dw $0001,$01FB                                                       ;8D98CA;
    db $FD                                                               ;8D98CE;
    dw $F13E                                                             ;8D98CF;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_38:
    dw $0001,$01FC                                                       ;8D98D1;
    db $FC                                                               ;8D98D5;
    dw $7138                                                             ;8D98D6;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_39:
    dw $0001,$01FC                                                       ;8D98D8;
    db $FC                                                               ;8D98DC;
    dw $7139                                                             ;8D98DD;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3A:
    dw $0001,$01FC                                                       ;8D98DF;
    db $FC                                                               ;8D98E3;
    dw $713A                                                             ;8D98E4;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3B:
    dw $0001,$01FD                                                       ;8D98E6;
    db $FD                                                               ;8D98EA;
    dw $713B                                                             ;8D98EB;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3C:
    dw $0001,$01FC                                                       ;8D98ED;
    db $FC                                                               ;8D98F1;
    dw $B138                                                             ;8D98F2;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3D:
    dw $0001,$01FC                                                       ;8D98F4;
    db $FD                                                               ;8D98F8;
    dw $713C                                                             ;8D98F9;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3E:
    dw $0001,$01FC                                                       ;8D98FB;
    db $FC                                                               ;8D98FF;
    dw $B13D                                                             ;8D9900;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3F:
    dw $0001,$01FC                                                       ;8D9902;
    db $FC                                                               ;8D9906;
    dw $B13E                                                             ;8D9907;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_0:
    dw $0001,$01FC                                                       ;8D9909;
    db $FC                                                               ;8D990D;
    dw $3528                                                             ;8D990E;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_1:
    dw $0001,$01FC                                                       ;8D9910;
    db $FC                                                               ;8D9914;
    dw $3529                                                             ;8D9915;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_2:
    dw $0001,$01FC                                                       ;8D9917;
    db $FC                                                               ;8D991B;
    dw $352A                                                             ;8D991C;

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_3:
    dw $0001,$01FC                                                       ;8D991E;
    db $FC                                                               ;8D9922;
    dw $352B                                                             ;8D9923;

EnemyProjSpritemaps_KihunterAcidSpit_Left_0:
    dw $0001,$01F8                                                       ;8D9925;
    db $FC                                                               ;8D9929;
    dw $3165                                                             ;8D992A;

EnemyProjSpritemaps_KihunterAcidSpit_Left_1:
    dw $0002,$01F0                                                       ;8D992C;
    db $FC                                                               ;8D9930;
    dw $3174,$01F8                                                       ;8D9931;
    db $FC                                                               ;8D9935;
    dw $3175                                                             ;8D9936;

EnemyProjSpritemaps_KihunterAcidSpit_Left_2:
    dw $0001,$C3F0                                                       ;8D9938;
    db $F8                                                               ;8D993C;
    dw $3166                                                             ;8D993D;

EnemyProjSpritemaps_KihunterAcidSpit_Left_3:
    dw $0002,$C3E8                                                       ;8D993F;
    db $F8                                                               ;8D9943;
    dw $314B,$C3F0                                                       ;8D9944;
    db $F8                                                               ;8D9948;
    dw $314C                                                             ;8D9949;

EnemyProjSpritemaps_KihunterAcidSpit_Left_4:
    dw $0002,$01F8                                                       ;8D994B;
    db $FC                                                               ;8D994F;
    dw $3164,$C3E8                                                       ;8D9950;
    db $F8                                                               ;8D9954;
    dw $312A                                                             ;8D9955;

EnemyProjSpritemaps_KihunterAcidSpit_Left_5:
    dw $0001,$C3F8                                                       ;8D9957;
    db $F8                                                               ;8D995B;
    dw $312A                                                             ;8D995C;

EnemyProjSpritemaps_KihunterAcidSpit_0:
    dw $0001,$C3F9                                                       ;8D995E;
    db $F8                                                               ;8D9962;
    dw $316C                                                             ;8D9963;

EnemyProjSpritemaps_KihunterAcidSpit_1:
    dw $0003,$0004                                                       ;8D9965;
    db $00                                                               ;8D9969;
    dw $317B,$01F4                                                       ;8D996A;
    db $00                                                               ;8D996E;
    dw $3179,$01FC                                                       ;8D996F;
    db $00                                                               ;8D9973;
    dw $317A                                                             ;8D9974;

EnemyProjSpritemaps_KihunterAcidSpit_2:
    dw $0004,$01F2                                                       ;8D9976;
    db $00                                                               ;8D997A;
    dw $316A,$0006                                                       ;8D997B;
    db $00                                                               ;8D997F;
    dw $316B,$01FE                                                       ;8D9980;
    db $00                                                               ;8D9984;
    dw $316A,$01FA                                                       ;8D9985;
    db $00                                                               ;8D9989;
    dw $316B                                                             ;8D998A;

EnemyProjSpritemaps_KihunterAcidSpit_3:
    dw $0004,$01FE                                                       ;8D998C;
    db $00                                                               ;8D9990;
    dw $3168,$0006                                                       ;8D9991;
    db $00                                                               ;8D9995;
    dw $3169,$01FA                                                       ;8D9996;
    db $00                                                               ;8D999A;
    dw $3169,$01F2                                                       ;8D999B;
    db $00                                                               ;8D999F;
    dw $3168                                                             ;8D99A0;

EnemyProjSpritemaps_KihunterAcidSpit_4:
    dw $0002,$0002                                                       ;8D99A2;
    db $00                                                               ;8D99A6;
    dw $3178,$01F6                                                       ;8D99A7;
    db $00                                                               ;8D99AB;
    dw $3178                                                             ;8D99AC;

EnemyProjSpritemaps_KihunterAcidSpit_Right_0:
    dw $0001,$0000                                                       ;8D99AE;
    db $FC                                                               ;8D99B2;
    dw $7165                                                             ;8D99B3;

EnemyProjSpritemaps_KihunterAcidSpit_Right_1:
    dw $0002,$0008                                                       ;8D99B5;
    db $FC                                                               ;8D99B9;
    dw $7174,$0000                                                       ;8D99BA;
    db $FC                                                               ;8D99BE;
    dw $7175                                                             ;8D99BF;

EnemyProjSpritemaps_KihunterAcidSpit_Right_2:
    dw $0001,$C200                                                       ;8D99C1;
    db $F8                                                               ;8D99C5;
    dw $7166                                                             ;8D99C6;

EnemyProjSpritemaps_KihunterAcidSpit_Right_3:
    dw $0002,$C208                                                       ;8D99C8;
    db $F8                                                               ;8D99CC;
    dw $714B,$C200                                                       ;8D99CD;
    db $F8                                                               ;8D99D1;
    dw $714C                                                             ;8D99D2;

EnemyProjSpritemaps_KihunterAcidSpit_Right_4:
    dw $0002,$0000                                                       ;8D99D4;
    db $FC                                                               ;8D99D8;
    dw $7164,$C208                                                       ;8D99D9;
    db $F8                                                               ;8D99DD;
    dw $712A                                                             ;8D99DE;

EnemyProjSpritemaps_KihunterAcidSpit_Right_5:
    dw $0001,$C3F8                                                       ;8D99E0;
    db $F8                                                               ;8D99E4;
    dw $712A                                                             ;8D99E5;

EnemyProjSpritemaps_PowampSpikes_0:
    dw $0001,$01FC                                                       ;8D99E7;
    db $FC                                                               ;8D99EB;
    dw $210F                                                             ;8D99EC;

EnemyProjSpritemaps_PowampSpikes_1:
    dw $0001,$01FC                                                       ;8D99EE;
    db $FC                                                               ;8D99F2;
    dw $211B                                                             ;8D99F3;

EnemyProjSpritemaps_PowampSpikes_2:
    dw $0001,$01FC                                                       ;8D99F5;
    db $FC                                                               ;8D99F9;
    dw $211C                                                             ;8D99FA;

EnemyProjSpritemaps_WorkRobotLaser_0:
    dw $0001,$01FC                                                       ;8D99FC;
    db $FC                                                               ;8D9A00;
    dw $2A53                                                             ;8D9A01;

EnemyProjSpritemaps_WorkRobotLaser_1:
    dw $0001,$01FC                                                       ;8D9A03;
    db $FC                                                               ;8D9A07;
    dw $2A51                                                             ;8D9A08;

EnemyProjSpritemaps_WorkRobotLaser_2:
    dw $0004,$0000                                                       ;8D9A0A;
    db $00                                                               ;8D9A0E;
    dw $EA60,$0000                                                       ;8D9A0F;
    db $F8                                                               ;8D9A13;
    dw $6A60,$01F8                                                       ;8D9A14;
    db $00                                                               ;8D9A18;
    dw $AA60,$01F8                                                       ;8D9A19;
    db $F8                                                               ;8D9A1D;
    dw $2A60                                                             ;8D9A1E;

EnemyProjSpritemaps_WorkRobotLaser_3:
    dw $0004,$0000                                                       ;8D9A20;
    db $00                                                               ;8D9A24;
    dw $EA61,$0000                                                       ;8D9A25;
    db $F8                                                               ;8D9A29;
    dw $6A61,$01F8                                                       ;8D9A2A;
    db $00                                                               ;8D9A2E;
    dw $AA61,$01F8                                                       ;8D9A2F;
    db $F8                                                               ;8D9A33;
    dw $2A61                                                             ;8D9A34;

EnemyProjSpritemaps_WorkRobotLaser_4:
    dw $0004,$0000                                                       ;8D9A36;
    db $00                                                               ;8D9A3A;
    dw $EA62,$0000                                                       ;8D9A3B;
    db $F8                                                               ;8D9A3F;
    dw $6A62,$01F8                                                       ;8D9A40;
    db $00                                                               ;8D9A44;
    dw $AA62,$01F8                                                       ;8D9A45;
    db $F8                                                               ;8D9A49;
    dw $2A62                                                             ;8D9A4A;

EnemyProjSpritemaps_WorkRobotLaser_5:
    dw $0004,$0000                                                       ;8D9A4C;
    db $00                                                               ;8D9A50;
    dw $EA63,$0000                                                       ;8D9A51;
    db $F8                                                               ;8D9A55;
    dw $6A63,$01F8                                                       ;8D9A56;
    db $00                                                               ;8D9A5A;
    dw $AA63,$01F8                                                       ;8D9A5B;
    db $F8                                                               ;8D9A5F;
    dw $2A63                                                             ;8D9A60;

EnemyProjSpritemaps_NoobTubeCrack_0:
    dw $0008,$0000                                                       ;8D9A62;
    db $00                                                               ;8D9A66;
    dw $734D,$0008                                                       ;8D9A67;
    db $00                                                               ;8D9A6B;
    dw $734C,$0000                                                       ;8D9A6C;
    db $F8                                                               ;8D9A70;
    dw $7359,$0000                                                       ;8D9A71;
    db $F0                                                               ;8D9A75;
    dw $7349,$01F9                                                       ;8D9A76;
    db $08                                                               ;8D9A7A;
    dw $335D,$01F9                                                       ;8D9A7B;
    db $00                                                               ;8D9A7F;
    dw $334D,$01F9                                                       ;8D9A80;
    db $F8                                                               ;8D9A84;
    dw $3359,$01F1                                                       ;8D9A85;
    db $F8                                                               ;8D9A89;
    dw $3358                                                             ;8D9A8A;

EnemyProjSpritemaps_NoobTubeCrack_1:
    dw $000E,$01F9                                                       ;8D9A8C;
    db $18                                                               ;8D9A90;
    dw $3371,$01F1                                                       ;8D9A91;
    db $10                                                               ;8D9A95;
    dw $3360,$01F9                                                       ;8D9A96;
    db $10                                                               ;8D9A9A;
    dw $3361,$0010                                                       ;8D9A9B;
    db $08                                                               ;8D9A9F;
    dw $735B,$0018                                                       ;8D9AA0;
    db $08                                                               ;8D9AA4;
    dw $735A,$0010                                                       ;8D9AA5;
    db $00                                                               ;8D9AA9;
    dw $734B,$0008                                                       ;8D9AAA;
    db $E0                                                               ;8D9AAE;
    dw $7328,$0000                                                       ;8D9AAF;
    db $E8                                                               ;8D9AB3;
    dw $7339,$0008                                                       ;8D9AB4;
    db $E8                                                               ;8D9AB8;
    dw $7338,$C3E1                                                       ;8D9AB9;
    db $F0                                                               ;8D9ABD;
    dw $3346,$C200                                                       ;8D9ABE;
    db $00                                                               ;8D9AC2;
    dw $734C,$C200                                                       ;8D9AC3;
    db $F0                                                               ;8D9AC7;
    dw $7348,$C3F1                                                       ;8D9AC8;
    db $00                                                               ;8D9ACC;
    dw $334C,$C3F1                                                       ;8D9ACD;
    db $F0                                                               ;8D9AD1;
    dw $3348                                                             ;8D9AD2;

EnemyProjSpritemaps_NoobTubeCrack_2:
    dw $001E,$0008                                                       ;8D9AD4;
    db $10                                                               ;8D9AD8;
    dw $7360,$0000                                                       ;8D9AD9;
    db $10                                                               ;8D9ADD;
    dw $7361,$0020                                                       ;8D9ADE;
    db $F8                                                               ;8D9AE2;
    dw $7355,$0020                                                       ;8D9AE3;
    db $00                                                               ;8D9AE7;
    dw $730F,$01E1                                                       ;8D9AE8;
    db $08                                                               ;8D9AEC;
    dw $335A,$01E1                                                       ;8D9AED;
    db $E8                                                               ;8D9AF1;
    dw $3336,$01E9                                                       ;8D9AF2;
    db $E8                                                               ;8D9AF6;
    dw $3337,$01F9                                                       ;8D9AF7;
    db $E0                                                               ;8D9AFB;
    dw $3329,$01F1                                                       ;8D9AFC;
    db $E8                                                               ;8D9B00;
    dw $3338,$01F9                                                       ;8D9B01;
    db $E8                                                               ;8D9B05;
    dw $3339,$0028                                                       ;8D9B06;
    db $18                                                               ;8D9B0A;
    dw $733E,$0020                                                       ;8D9B0B;
    db $10                                                               ;8D9B0F;
    dw $732F,$0010                                                       ;8D9B10;
    db $10                                                               ;8D9B14;
    dw $734F,$0018                                                       ;8D9B15;
    db $10                                                               ;8D9B19;
    dw $734E,$01E1                                                       ;8D9B1A;
    db $10                                                               ;8D9B1E;
    dw $334E,$01E9                                                       ;8D9B1F;
    db $10                                                               ;8D9B23;
    dw $334F,$01E9                                                       ;8D9B24;
    db $08                                                               ;8D9B28;
    dw $335B,$01E9                                                       ;8D9B29;
    db $00                                                               ;8D9B2D;
    dw $334B,$0010                                                       ;8D9B2E;
    db $D8                                                               ;8D9B32;
    dw $7317,$C210                                                       ;8D9B33;
    db $F0                                                               ;8D9B37;
    dw $7346,$C200                                                       ;8D9B38;
    db $D0                                                               ;8D9B3C;
    dw $7308,$C3D1                                                       ;8D9B3D;
    db $E8                                                               ;8D9B41;
    dw $3334,$C3F1                                                       ;8D9B42;
    db $10                                                               ;8D9B46;
    dw $3360,$C3E1                                                       ;8D9B47;
    db $F0                                                               ;8D9B4B;
    dw $3346,$C210                                                       ;8D9B4C;
    db $00                                                               ;8D9B50;
    dw $734A,$C200                                                       ;8D9B51;
    db $E0                                                               ;8D9B55;
    dw $7328,$C200                                                       ;8D9B56;
    db $00                                                               ;8D9B5A;
    dw $734C,$C200                                                       ;8D9B5B;
    db $F0                                                               ;8D9B5F;
    dw $7348,$C3F1                                                       ;8D9B60;
    db $00                                                               ;8D9B64;
    dw $334C,$C3F1                                                       ;8D9B65;
    db $F0                                                               ;8D9B69;
    dw $3348                                                             ;8D9B6A;

EnemyProjSpritemaps_NoobTubeCrack_3:
    dw $0027,$01E1                                                       ;8D9B6C;
    db $D8                                                               ;8D9B70;
    dw $3316,$01D1                                                       ;8D9B71;
    db $F8                                                               ;8D9B75;
    dw $3354,$01D9                                                       ;8D9B76;
    db $F8                                                               ;8D9B7A;
    dw $3355,$01D9                                                       ;8D9B7B;
    db $18                                                               ;8D9B7F;
    dw $333F,$C230                                                       ;8D9B80;
    db $00                                                               ;8D9B84;
    dw $730C,$C230                                                       ;8D9B85;
    db $10                                                               ;8D9B89;
    dw $732C,$C220                                                       ;8D9B8A;
    db $F0                                                               ;8D9B8E;
    dw $7344,$C220                                                       ;8D9B8F;
    db $00                                                               ;8D9B93;
    dw $730E,$01D1                                                       ;8D9B94;
    db $18                                                               ;8D9B98;
    dw $333E,$01D9                                                       ;8D9B99;
    db $10                                                               ;8D9B9D;
    dw $332F,$0020                                                       ;8D9B9E;
    db $E8                                                               ;8D9BA2;
    dw $7335,$01D9                                                       ;8D9BA3;
    db $00                                                               ;8D9BA7;
    dw $330F,$0020                                                       ;8D9BA8;
    db $D8                                                               ;8D9BAC;
    dw $7315,$01D9                                                       ;8D9BAD;
    db $E0                                                               ;8D9BB1;
    dw $3325,$01E9                                                       ;8D9BB2;
    db $D8                                                               ;8D9BB6;
    dw $3317,$01C9                                                       ;8D9BB7;
    db $F0                                                               ;8D9BBB;
    dw $3343,$01C1                                                       ;8D9BBC;
    db $E8                                                               ;8D9BC0;
    dw $3332,$01C9                                                       ;8D9BC1;
    db $E8                                                               ;8D9BC5;
    dw $3333,$C3D1                                                       ;8D9BC6;
    db $E8                                                               ;8D9BCA;
    dw $3334,$C3F1                                                       ;8D9BCB;
    db $D0                                                               ;8D9BCF;
    dw $3308,$C210                                                       ;8D9BD0;
    db $D0                                                               ;8D9BD4;
    dw $7306,$C210                                                       ;8D9BD5;
    db $E0                                                               ;8D9BD9;
    dw $7326,$C3E1                                                       ;8D9BDA;
    db $10                                                               ;8D9BDE;
    dw $334E,$C210                                                       ;8D9BDF;
    db $F0                                                               ;8D9BE3;
    dw $7346,$C3F1                                                       ;8D9BE4;
    db $E0                                                               ;8D9BE8;
    dw $3328,$C3E1                                                       ;8D9BE9;
    db $E0                                                               ;8D9BED;
    dw $3326,$C220                                                       ;8D9BEE;
    db $10                                                               ;8D9BF2;
    dw $732E,$C3E1                                                       ;8D9BF3;
    db $00                                                               ;8D9BF7;
    dw $334A,$C210                                                       ;8D9BF8;
    db $10                                                               ;8D9BFC;
    dw $734E,$C200                                                       ;8D9BFD;
    db $D0                                                               ;8D9C01;
    dw $7308,$C200                                                       ;8D9C02;
    db $10                                                               ;8D9C06;
    dw $7360,$C3F1                                                       ;8D9C07;
    db $10                                                               ;8D9C0B;
    dw $3360,$C3E1                                                       ;8D9C0C;
    db $F0                                                               ;8D9C10;
    dw $3346,$C210                                                       ;8D9C11;
    db $00                                                               ;8D9C15;
    dw $734A,$C200                                                       ;8D9C16;
    db $E0                                                               ;8D9C1A;
    dw $7328,$C200                                                       ;8D9C1B;
    db $00                                                               ;8D9C1F;
    dw $734C,$C200                                                       ;8D9C20;
    db $F0                                                               ;8D9C24;
    dw $7348,$C3F1                                                       ;8D9C25;
    db $00                                                               ;8D9C29;
    dw $334C,$C3F1                                                       ;8D9C2A;
    db $F0                                                               ;8D9C2E;
    dw $3348                                                             ;8D9C2F;

EnemyProjSpritemaps_NoobTubeCrack_4:
    dw $0032,$C3B1                                                       ;8D9C31;
    db $F0                                                               ;8D9C35;
    dw $3340,$01C1                                                       ;8D9C36;
    db $E0                                                               ;8D9C3A;
    dw $3322,$01C9                                                       ;8D9C3B;
    db $E0                                                               ;8D9C3F;
    dw $3323,$0030                                                       ;8D9C40;
    db $D8                                                               ;8D9C44;
    dw $7313,$01C1                                                       ;8D9C45;
    db $10                                                               ;8D9C49;
    dw $332C,$01B9                                                       ;8D9C4A;
    db $08                                                               ;8D9C4E;
    dw $331B,$01D9                                                       ;8D9C4F;
    db $E0                                                               ;8D9C53;
    dw $3325,$C3D1                                                       ;8D9C54;
    db $E8                                                               ;8D9C58;
    dw $3334,$C3C1                                                       ;8D9C59;
    db $E8                                                               ;8D9C5D;
    dw $3332,$0040                                                       ;8D9C5E;
    db $F0                                                               ;8D9C62;
    dw $7341,$0030                                                       ;8D9C63;
    db $E8                                                               ;8D9C67;
    dw $7333,$0038                                                       ;8D9C68;
    db $E8                                                               ;8D9C6C;
    dw $7332,$C230                                                       ;8D9C6D;
    db $F0                                                               ;8D9C71;
    dw $7342,$C240                                                       ;8D9C72;
    db $08                                                               ;8D9C76;
    dw $731A,$C240                                                       ;8D9C77;
    db $10                                                               ;8D9C7B;
    dw $732A,$C230                                                       ;8D9C7C;
    db $00                                                               ;8D9C80;
    dw $730C,$C3C1                                                       ;8D9C81;
    db $00                                                               ;8D9C85;
    dw $330C,$C3C9                                                       ;8D9C86;
    db $10                                                               ;8D9C8A;
    dw $332D,$C3D1                                                       ;8D9C8B;
    db $00                                                               ;8D9C8F;
    dw $330E,$C3C1                                                       ;8D9C90;
    db $F0                                                               ;8D9C94;
    dw $3342,$C3E1                                                       ;8D9C95;
    db $D0                                                               ;8D9C99;
    dw $3306,$C3D1                                                       ;8D9C9A;
    db $D0                                                               ;8D9C9E;
    dw $3304,$C3B1                                                       ;8D9C9F;
    db $E0                                                               ;8D9CA3;
    dw $3320,$C220                                                       ;8D9CA4;
    db $E0                                                               ;8D9CA8;
    dw $7324,$C220                                                       ;8D9CA9;
    db $D0                                                               ;8D9CAD;
    dw $7304,$C220                                                       ;8D9CAE;
    db $00                                                               ;8D9CB2;
    dw $730E,$C3F1                                                       ;8D9CB3;
    db $D0                                                               ;8D9CB7;
    dw $3308,$C210                                                       ;8D9CB8;
    db $D0                                                               ;8D9CBC;
    dw $7306,$C220                                                       ;8D9CBD;
    db $F0                                                               ;8D9CC1;
    dw $7344,$C210                                                       ;8D9CC2;
    db $E0                                                               ;8D9CC6;
    dw $7326,$C230                                                       ;8D9CC7;
    db $10                                                               ;8D9CCB;
    dw $732C,$C3D1                                                       ;8D9CCC;
    db $10                                                               ;8D9CD0;
    dw $332E,$C3E1                                                       ;8D9CD1;
    db $10                                                               ;8D9CD5;
    dw $334E,$C3D1                                                       ;8D9CD6;
    db $F0                                                               ;8D9CDA;
    dw $3344,$C210                                                       ;8D9CDB;
    db $F0                                                               ;8D9CDF;
    dw $7346,$C3F1                                                       ;8D9CE0;
    db $E0                                                               ;8D9CE4;
    dw $3328,$C3E1                                                       ;8D9CE5;
    db $E0                                                               ;8D9CE9;
    dw $3326,$C220                                                       ;8D9CEA;
    db $10                                                               ;8D9CEE;
    dw $732E,$C3E1                                                       ;8D9CEF;
    db $00                                                               ;8D9CF3;
    dw $334A,$C210                                                       ;8D9CF4;
    db $10                                                               ;8D9CF8;
    dw $734E,$C200                                                       ;8D9CF9;
    db $D0                                                               ;8D9CFD;
    dw $7308,$C200                                                       ;8D9CFE;
    db $10                                                               ;8D9D02;
    dw $7360,$C3F1                                                       ;8D9D03;
    db $10                                                               ;8D9D07;
    dw $3360,$C3E1                                                       ;8D9D08;
    db $F0                                                               ;8D9D0C;
    dw $3346,$C210                                                       ;8D9D0D;
    db $00                                                               ;8D9D11;
    dw $734A,$C200                                                       ;8D9D12;
    db $E0                                                               ;8D9D16;
    dw $7328,$C200                                                       ;8D9D17;
    db $00                                                               ;8D9D1B;
    dw $734C,$C200                                                       ;8D9D1C;
    db $F0                                                               ;8D9D20;
    dw $7348,$C3F1                                                       ;8D9D21;
    db $00                                                               ;8D9D25;
    dw $334C,$C3F1                                                       ;8D9D26;
    db $F0                                                               ;8D9D2A;
    dw $3348                                                             ;8D9D2B;

EnemyProjSpritemaps_NoobTubeCrack_5:
    dw $0032,$C210                                                       ;8D9D2D;
    db $10                                                               ;8D9D31;
    dw $734E,$C200                                                       ;8D9D32;
    db $10                                                               ;8D9D36;
    dw $7360,$C200                                                       ;8D9D37;
    db $00                                                               ;8D9D3B;
    dw $734C,$C210                                                       ;8D9D3C;
    db $00                                                               ;8D9D40;
    dw $734A,$C220                                                       ;8D9D41;
    db $10                                                               ;8D9D45;
    dw $732E,$C230                                                       ;8D9D46;
    db $10                                                               ;8D9D4A;
    dw $732C,$C240                                                       ;8D9D4B;
    db $10                                                               ;8D9D4F;
    dw $732A,$C220                                                       ;8D9D50;
    db $00                                                               ;8D9D54;
    dw $730E,$C230                                                       ;8D9D55;
    db $00                                                               ;8D9D59;
    dw $730C,$C240                                                       ;8D9D5A;
    db $00                                                               ;8D9D5E;
    dw $730A,$C200                                                       ;8D9D5F;
    db $F0                                                               ;8D9D63;
    dw $7348,$C210                                                       ;8D9D64;
    db $F0                                                               ;8D9D68;
    dw $7346,$C220                                                       ;8D9D69;
    db $F0                                                               ;8D9D6D;
    dw $7344,$C230                                                       ;8D9D6E;
    db $F0                                                               ;8D9D72;
    dw $7342,$C240                                                       ;8D9D73;
    db $F0                                                               ;8D9D77;
    dw $7340,$C200                                                       ;8D9D78;
    db $E0                                                               ;8D9D7C;
    dw $7328,$C210                                                       ;8D9D7D;
    db $E0                                                               ;8D9D81;
    dw $7326,$C220                                                       ;8D9D82;
    db $E0                                                               ;8D9D86;
    dw $7324,$C230                                                       ;8D9D87;
    db $E0                                                               ;8D9D8B;
    dw $7322,$C240                                                       ;8D9D8C;
    db $E0                                                               ;8D9D90;
    dw $7320,$C200                                                       ;8D9D91;
    db $D0                                                               ;8D9D95;
    dw $7308,$C210                                                       ;8D9D96;
    db $D0                                                               ;8D9D9A;
    dw $7306,$C220                                                       ;8D9D9B;
    db $D0                                                               ;8D9D9F;
    dw $7304,$C230                                                       ;8D9DA0;
    db $D0                                                               ;8D9DA4;
    dw $7302,$C240                                                       ;8D9DA5;
    db $D0                                                               ;8D9DA9;
    dw $7300,$C3E1                                                       ;8D9DAA;
    db $10                                                               ;8D9DAE;
    dw $334E,$C3F1                                                       ;8D9DAF;
    db $10                                                               ;8D9DB3;
    dw $3360,$C3F1                                                       ;8D9DB4;
    db $00                                                               ;8D9DB8;
    dw $334C,$C3E1                                                       ;8D9DB9;
    db $00                                                               ;8D9DBD;
    dw $334A,$C3D1                                                       ;8D9DBE;
    db $10                                                               ;8D9DC2;
    dw $332E,$C3C1                                                       ;8D9DC3;
    db $10                                                               ;8D9DC7;
    dw $332C,$C3B1                                                       ;8D9DC8;
    db $10                                                               ;8D9DCC;
    dw $332A,$C3D1                                                       ;8D9DCD;
    db $00                                                               ;8D9DD1;
    dw $330E,$C3C1                                                       ;8D9DD2;
    db $00                                                               ;8D9DD6;
    dw $330C,$C3B1                                                       ;8D9DD7;
    db $00                                                               ;8D9DDB;
    dw $330A,$C3F1                                                       ;8D9DDC;
    db $F0                                                               ;8D9DE0;
    dw $3348,$C3E1                                                       ;8D9DE1;
    db $F0                                                               ;8D9DE5;
    dw $3346,$C3D1                                                       ;8D9DE6;
    db $F0                                                               ;8D9DEA;
    dw $3344,$C3C1                                                       ;8D9DEB;
    db $F0                                                               ;8D9DEF;
    dw $3342,$C3B1                                                       ;8D9DF0;
    db $F0                                                               ;8D9DF4;
    dw $3340,$C3F1                                                       ;8D9DF5;
    db $E0                                                               ;8D9DF9;
    dw $3328,$C3E1                                                       ;8D9DFA;
    db $E0                                                               ;8D9DFE;
    dw $3326,$C3D1                                                       ;8D9DFF;
    db $E0                                                               ;8D9E03;
    dw $3324,$C3C1                                                       ;8D9E04;
    db $E0                                                               ;8D9E08;
    dw $3322,$C3B1                                                       ;8D9E09;
    db $E0                                                               ;8D9E0D;
    dw $3320,$C3F1                                                       ;8D9E0E;
    db $D0                                                               ;8D9E12;
    dw $3308,$C3E1                                                       ;8D9E13;
    db $D0                                                               ;8D9E17;
    dw $3306,$C3D1                                                       ;8D9E18;
    db $D0                                                               ;8D9E1C;
    dw $3304,$C3C1                                                       ;8D9E1D;
    db $D0                                                               ;8D9E21;
    dw $3302,$C3B1                                                       ;8D9E22;
    db $D0                                                               ;8D9E26;
    dw $3300                                                             ;8D9E27;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D9E29:
    dw $000E,$C200                                                       ;8D9E29;
    db $EF                                                               ;8D9E2D;
    dw $7363,$C208                                                       ;8D9E2E;
    db $EF                                                               ;8D9E32;
    dw $7362,$C200                                                       ;8D9E33;
    db $00                                                               ;8D9E37;
    dw $736B,$C208                                                       ;8D9E38;
    db $00                                                               ;8D9E3C;
    dw $736A,$C200                                                       ;8D9E3D;
    db $F9                                                               ;8D9E41;
    dw $7368,$C208                                                       ;8D9E42;
    db $F9                                                               ;8D9E46;
    dw $7367,$C218                                                       ;8D9E47;
    db $F9                                                               ;8D9E4B;
    dw $7365,$C3F1                                                       ;8D9E4C;
    db $EF                                                               ;8D9E50;
    dw $3363,$C3E9                                                       ;8D9E51;
    db $EF                                                               ;8D9E55;
    dw $3362,$C3F1                                                       ;8D9E56;
    db $00                                                               ;8D9E5A;
    dw $336B,$C3E9                                                       ;8D9E5B;
    db $00                                                               ;8D9E5F;
    dw $336A,$C3F1                                                       ;8D9E60;
    db $F9                                                               ;8D9E64;
    dw $3368,$C3E9                                                       ;8D9E65;
    db $F9                                                               ;8D9E69;
    dw $3367,$C3D9                                                       ;8D9E6A;
    db $F9                                                               ;8D9E6E;
    dw $3365                                                             ;8D9E6F;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_NoobTubeCrack_6:
    dw $000E,$C20C                                                       ;8D9E71;
    db $E7                                                               ;8D9E75;
    dw $7363,$C214                                                       ;8D9E76;
    db $E7                                                               ;8D9E7A;
    dw $7362,$C20C                                                       ;8D9E7B;
    db $08                                                               ;8D9E7F;
    dw $736B,$C214                                                       ;8D9E80;
    db $08                                                               ;8D9E84;
    dw $736A,$C210                                                       ;8D9E85;
    db $F9                                                               ;8D9E89;
    dw $7368,$C218                                                       ;8D9E8A;
    db $F9                                                               ;8D9E8E;
    dw $7367,$C228                                                       ;8D9E8F;
    db $F9                                                               ;8D9E93;
    dw $7365,$C3E5                                                       ;8D9E94;
    db $E7                                                               ;8D9E98;
    dw $3363,$C3DD                                                       ;8D9E99;
    db $E7                                                               ;8D9E9D;
    dw $3362,$C3E5                                                       ;8D9E9E;
    db $08                                                               ;8D9EA2;
    dw $336B,$C3DD                                                       ;8D9EA3;
    db $08                                                               ;8D9EA7;
    dw $336A,$C3E1                                                       ;8D9EA8;
    db $F9                                                               ;8D9EAC;
    dw $3368,$C3D9                                                       ;8D9EAD;
    db $F9                                                               ;8D9EB1;
    dw $3367,$C3C9                                                       ;8D9EB2;
    db $F9                                                               ;8D9EB6;
    dw $3365                                                             ;8D9EB7;

EnemyProjSpritemaps_NoobTubeCrack_7:
    dw $000E,$C218                                                       ;8D9EB9;
    db $DF                                                               ;8D9EBD;
    dw $7363,$C220                                                       ;8D9EBE;
    db $DF                                                               ;8D9EC2;
    dw $7362,$C218                                                       ;8D9EC3;
    db $10                                                               ;8D9EC7;
    dw $736B,$C220                                                       ;8D9EC8;
    db $10                                                               ;8D9ECC;
    dw $736A,$C220                                                       ;8D9ECD;
    db $F9                                                               ;8D9ED1;
    dw $7368,$C228                                                       ;8D9ED2;
    db $F9                                                               ;8D9ED6;
    dw $7367,$C238                                                       ;8D9ED7;
    db $F9                                                               ;8D9EDB;
    dw $7365,$C3D9                                                       ;8D9EDC;
    db $DF                                                               ;8D9EE0;
    dw $3363,$C3D1                                                       ;8D9EE1;
    db $DF                                                               ;8D9EE5;
    dw $3362,$C3D9                                                       ;8D9EE6;
    db $10                                                               ;8D9EEA;
    dw $336B,$C3D1                                                       ;8D9EEB;
    db $10                                                               ;8D9EEF;
    dw $336A,$C3D1                                                       ;8D9EF0;
    db $F9                                                               ;8D9EF4;
    dw $3368,$C3C9                                                       ;8D9EF5;
    db $F9                                                               ;8D9EF9;
    dw $3367,$C3B9                                                       ;8D9EFA;
    db $F9                                                               ;8D9EFE;
    dw $3365                                                             ;8D9EFF;

EnemyProjSpritemaps_NoobTubeCrack_8:
    dw $000E,$C230                                                       ;8D9F01;
    db $F9                                                               ;8D9F05;
    dw $7368,$C238                                                       ;8D9F06;
    db $F9                                                               ;8D9F0A;
    dw $7367,$C248                                                       ;8D9F0B;
    db $F9                                                               ;8D9F0F;
    dw $7365,$C224                                                       ;8D9F10;
    db $D7                                                               ;8D9F14;
    dw $7363,$C22C                                                       ;8D9F15;
    db $D7                                                               ;8D9F19;
    dw $7362,$C228                                                       ;8D9F1A;
    db $18                                                               ;8D9F1E;
    dw $736B,$C230                                                       ;8D9F1F;
    db $18                                                               ;8D9F23;
    dw $736A,$C3CD                                                       ;8D9F24;
    db $D7                                                               ;8D9F28;
    dw $3363,$C3C5                                                       ;8D9F29;
    db $D7                                                               ;8D9F2D;
    dw $3362,$C3C9                                                       ;8D9F2E;
    db $18                                                               ;8D9F32;
    dw $336B,$C3C1                                                       ;8D9F33;
    db $18                                                               ;8D9F37;
    dw $336A,$C3C1                                                       ;8D9F38;
    db $F9                                                               ;8D9F3C;
    dw $3368,$C3B9                                                       ;8D9F3D;
    db $F9                                                               ;8D9F41;
    dw $3367,$C3A9                                                       ;8D9F42;
    db $F9                                                               ;8D9F46;
    dw $3365                                                             ;8D9F47;

EnemyProjSpritemaps_NoobTubeCrack_9:
    dw $000E,$C240                                                       ;8D9F49;
    db $F9                                                               ;8D9F4D;
    dw $7368,$C248                                                       ;8D9F4E;
    db $F9                                                               ;8D9F52;
    dw $7367,$C258                                                       ;8D9F53;
    db $F9                                                               ;8D9F57;
    dw $7365,$C230                                                       ;8D9F58;
    db $CF                                                               ;8D9F5C;
    dw $7363,$C238                                                       ;8D9F5D;
    db $CF                                                               ;8D9F61;
    dw $7362,$C238                                                       ;8D9F62;
    db $20                                                               ;8D9F66;
    dw $736B,$C240                                                       ;8D9F67;
    db $20                                                               ;8D9F6B;
    dw $736A,$C3C1                                                       ;8D9F6C;
    db $CF                                                               ;8D9F70;
    dw $3363,$C3B9                                                       ;8D9F71;
    db $CF                                                               ;8D9F75;
    dw $3362,$C3B9                                                       ;8D9F76;
    db $20                                                               ;8D9F7A;
    dw $336B,$C3B1                                                       ;8D9F7B;
    db $20                                                               ;8D9F7F;
    dw $336A,$C3B1                                                       ;8D9F80;
    db $F9                                                               ;8D9F84;
    dw $3368,$C3A9                                                       ;8D9F85;
    db $F9                                                               ;8D9F89;
    dw $3367,$C399                                                       ;8D9F8A;
    db $F9                                                               ;8D9F8E;
    dw $3365                                                             ;8D9F8F;

EnemyProjSpritemaps_NoobTubeCrack_A:
    dw $000E,$C248                                                       ;8D9F91;
    db $F9                                                               ;8D9F95;
    dw $7368,$C250                                                       ;8D9F96;
    db $F9                                                               ;8D9F9A;
    dw $7367,$C260                                                       ;8D9F9B;
    db $F9                                                               ;8D9F9F;
    dw $7365,$C234                                                       ;8D9FA0;
    db $CD                                                               ;8D9FA4;
    dw $7363,$C23C                                                       ;8D9FA5;
    db $CD                                                               ;8D9FA9;
    dw $7362,$C23C                                                       ;8D9FAA;
    db $22                                                               ;8D9FAE;
    dw $736B,$C244                                                       ;8D9FAF;
    db $22                                                               ;8D9FB3;
    dw $736A,$C3BD                                                       ;8D9FB4;
    db $CD                                                               ;8D9FB8;
    dw $3363,$C3B5                                                       ;8D9FB9;
    db $CD                                                               ;8D9FBD;
    dw $3362,$C3B1                                                       ;8D9FBE;
    db $24                                                               ;8D9FC2;
    dw $336B,$C3A9                                                       ;8D9FC3;
    db $24                                                               ;8D9FC7;
    dw $336A,$C3A9                                                       ;8D9FC8;
    db $F9                                                               ;8D9FCC;
    dw $3368,$C3A1                                                       ;8D9FCD;
    db $F9                                                               ;8D9FD1;
    dw $3367,$C391                                                       ;8D9FD2;
    db $F9                                                               ;8D9FD6;
    dw $3365                                                             ;8D9FD7;

EnemyProjSpritemaps_NoobTubeCrack_B:
    dw $000E,$C24E                                                       ;8D9FD9;
    db $F9                                                               ;8D9FDD;
    dw $7368,$C256                                                       ;8D9FDE;
    db $F9                                                               ;8D9FE2;
    dw $7367,$C266                                                       ;8D9FE3;
    db $F9                                                               ;8D9FE7;
    dw $7365,$C236                                                       ;8D9FE8;
    db $CC                                                               ;8D9FEC;
    dw $7363,$C23E                                                       ;8D9FED;
    db $CC                                                               ;8D9FF1;
    dw $7362,$C23E                                                       ;8D9FF2;
    db $23                                                               ;8D9FF6;
    dw $736B,$C246                                                       ;8D9FF7;
    db $23                                                               ;8D9FFB;
    dw $736A,$C3BB                                                       ;8D9FFC;
    db $CC                                                               ;8DA000;
    dw $3363,$C3B3                                                       ;8DA001;
    db $CC                                                               ;8DA005;
    dw $3362,$C3AB                                                       ;8DA006;
    db $27                                                               ;8DA00A;
    dw $336B,$C3A3                                                       ;8DA00B;
    db $27                                                               ;8DA00F;
    dw $336A,$C3A3                                                       ;8DA010;
    db $F9                                                               ;8DA014;
    dw $3368,$C39B                                                       ;8DA015;
    db $F9                                                               ;8DA019;
    dw $3367,$C38B                                                       ;8DA01A;
    db $F9                                                               ;8DA01E;
    dw $3365                                                             ;8DA01F;

EnemyProjSpritemaps_NoobTubeCrack_C:
    dw $000E,$C252                                                       ;8DA021;
    db $F9                                                               ;8DA025;
    dw $7368,$C25A                                                       ;8DA026;
    db $F9                                                               ;8DA02A;
    dw $7367,$C26A                                                       ;8DA02B;
    db $F9                                                               ;8DA02F;
    dw $7365,$C237                                                       ;8DA030;
    db $CD                                                               ;8DA034;
    dw $7363,$C23F                                                       ;8DA035;
    db $CD                                                               ;8DA039;
    dw $7362,$C23E                                                       ;8DA03A;
    db $24                                                               ;8DA03E;
    dw $736B,$C246                                                       ;8DA03F;
    db $24                                                               ;8DA043;
    dw $736A,$C3B9                                                       ;8DA044;
    db $CD                                                               ;8DA048;
    dw $3363,$C3B1                                                       ;8DA049;
    db $CD                                                               ;8DA04D;
    dw $3362,$C3AC                                                       ;8DA04E;
    db $28                                                               ;8DA052;
    dw $336B,$C3A4                                                       ;8DA053;
    db $28                                                               ;8DA057;
    dw $336A,$C39F                                                       ;8DA058;
    db $F9                                                               ;8DA05C;
    dw $3368,$C397                                                       ;8DA05D;
    db $F9                                                               ;8DA061;
    dw $3367,$C387                                                       ;8DA062;
    db $F9                                                               ;8DA066;
    dw $3365                                                             ;8DA067;

EnemyProjSpritemaps_NoobTubeCrack_D:
    dw $000E,$C254                                                       ;8DA069;
    db $F9                                                               ;8DA06D;
    dw $7368,$C25C                                                       ;8DA06E;
    db $F9                                                               ;8DA072;
    dw $7367,$C26C                                                       ;8DA073;
    db $F9                                                               ;8DA077;
    dw $7365,$C238                                                       ;8DA078;
    db $CE                                                               ;8DA07C;
    dw $7363,$C240                                                       ;8DA07D;
    db $CE                                                               ;8DA081;
    dw $7362,$C23D                                                       ;8DA082;
    db $25                                                               ;8DA086;
    dw $736B,$C245                                                       ;8DA087;
    db $25                                                               ;8DA08B;
    dw $736A,$C3B8                                                       ;8DA08C;
    db $CE                                                               ;8DA090;
    dw $3363,$C3B0                                                       ;8DA091;
    db $CE                                                               ;8DA095;
    dw $3362,$C3AB                                                       ;8DA096;
    db $2A                                                               ;8DA09A;
    dw $336B,$C3A3                                                       ;8DA09B;
    db $2A                                                               ;8DA09F;
    dw $336A,$C39D                                                       ;8DA0A0;
    db $F9                                                               ;8DA0A4;
    dw $3368,$C395                                                       ;8DA0A5;
    db $F9                                                               ;8DA0A9;
    dw $3367,$C385                                                       ;8DA0AA;
    db $F9                                                               ;8DA0AE;
    dw $3365                                                             ;8DA0AF;

EnemyProjSpritemaps_NoobTubeCrack_E:
    dw $000E,$C256                                                       ;8DA0B1;
    db $FB                                                               ;8DA0B5;
    dw $7368,$C25E                                                       ;8DA0B6;
    db $FB                                                               ;8DA0BA;
    dw $7367,$C26E                                                       ;8DA0BB;
    db $FB                                                               ;8DA0BF;
    dw $7365,$C239                                                       ;8DA0C0;
    db $D0                                                               ;8DA0C4;
    dw $7363,$C241                                                       ;8DA0C5;
    db $D0                                                               ;8DA0C9;
    dw $7362,$C23E                                                       ;8DA0CA;
    db $26                                                               ;8DA0CE;
    dw $736B,$C246                                                       ;8DA0CF;
    db $26                                                               ;8DA0D3;
    dw $736A,$C3B7                                                       ;8DA0D4;
    db $D0                                                               ;8DA0D8;
    dw $3363,$C3AF                                                       ;8DA0D9;
    db $D0                                                               ;8DA0DD;
    dw $3362,$C3AA                                                       ;8DA0DE;
    db $2C                                                               ;8DA0E2;
    dw $336B,$C3A2                                                       ;8DA0E3;
    db $2C                                                               ;8DA0E7;
    dw $336A,$C39B                                                       ;8DA0E8;
    db $FA                                                               ;8DA0EC;
    dw $3368,$C393                                                       ;8DA0ED;
    db $FA                                                               ;8DA0F1;
    dw $3367,$C383                                                       ;8DA0F2;
    db $FA                                                               ;8DA0F6;
    dw $3365                                                             ;8DA0F7;

EnemyProjSpritemaps_NoobTubeCrack_F:
    dw $000E,$C258                                                       ;8DA0F9;
    db $FD                                                               ;8DA0FD;
    dw $7368,$C260                                                       ;8DA0FE;
    db $FD                                                               ;8DA102;
    dw $7367,$C270                                                       ;8DA103;
    db $FD                                                               ;8DA107;
    dw $7365,$C239                                                       ;8DA108;
    db $D1                                                               ;8DA10C;
    dw $7363,$C241                                                       ;8DA10D;
    db $D1                                                               ;8DA111;
    dw $7362,$C23F                                                       ;8DA112;
    db $27                                                               ;8DA116;
    dw $736B,$C247                                                       ;8DA117;
    db $27                                                               ;8DA11B;
    dw $736A,$C3B8                                                       ;8DA11C;
    db $D2                                                               ;8DA120;
    dw $3363,$C3B0                                                       ;8DA121;
    db $D2                                                               ;8DA125;
    dw $3362,$C3AB                                                       ;8DA126;
    db $2E                                                               ;8DA12A;
    dw $336B,$C3A3                                                       ;8DA12B;
    db $2E                                                               ;8DA12F;
    dw $336A,$C399                                                       ;8DA130;
    db $FB                                                               ;8DA134;
    dw $3368,$C391                                                       ;8DA135;
    db $FB                                                               ;8DA139;
    dw $3367,$C381                                                       ;8DA13A;
    db $FB                                                               ;8DA13E;
    dw $3365                                                             ;8DA13F;

EnemyProjSpritemaps_NoobTubeCrack_10:
    dw $000E,$C3AC                                                       ;8DA141;
    db $30                                                               ;8DA145;
    dw $336B,$C3A4                                                       ;8DA146;
    db $30                                                               ;8DA14A;
    dw $336A,$C258                                                       ;8DA14B;
    db $00                                                               ;8DA14F;
    dw $7368,$C260                                                       ;8DA150;
    db $00                                                               ;8DA154;
    dw $7367,$C270                                                       ;8DA155;
    db $00                                                               ;8DA159;
    dw $7365,$C238                                                       ;8DA15A;
    db $D2                                                               ;8DA15E;
    dw $7363,$C240                                                       ;8DA15F;
    db $D2                                                               ;8DA163;
    dw $7362,$C23E                                                       ;8DA164;
    db $28                                                               ;8DA168;
    dw $736B,$C246                                                       ;8DA169;
    db $28                                                               ;8DA16D;
    dw $736A,$C3B7                                                       ;8DA16E;
    db $D4                                                               ;8DA172;
    dw $3363,$C3AF                                                       ;8DA173;
    db $D4                                                               ;8DA177;
    dw $3362,$C399                                                       ;8DA178;
    db $FC                                                               ;8DA17C;
    dw $3368,$C391                                                       ;8DA17D;
    db $FC                                                               ;8DA181;
    dw $3367,$C381                                                       ;8DA182;
    db $FC                                                               ;8DA186;
    dw $3365                                                             ;8DA187;

EnemyProjSpritemaps_NoobTubeCrack_11:
    dw $000E,$C3AB                                                       ;8DA189;
    db $32                                                               ;8DA18D;
    dw $336B,$C3A3                                                       ;8DA18E;
    db $32                                                               ;8DA192;
    dw $336A,$C257                                                       ;8DA193;
    db $03                                                               ;8DA197;
    dw $7368,$C25F                                                       ;8DA198;
    db $03                                                               ;8DA19C;
    dw $7367,$C26F                                                       ;8DA19D;
    db $03                                                               ;8DA1A1;
    dw $7365,$C239                                                       ;8DA1A2;
    db $D3                                                               ;8DA1A6;
    dw $7363,$C241                                                       ;8DA1A7;
    db $D3                                                               ;8DA1AB;
    dw $7362,$C23D                                                       ;8DA1AC;
    db $29                                                               ;8DA1B0;
    dw $736B,$C245                                                       ;8DA1B1;
    db $29                                                               ;8DA1B5;
    dw $736A,$C3B6                                                       ;8DA1B6;
    db $D6                                                               ;8DA1BA;
    dw $3363,$C3AE                                                       ;8DA1BB;
    db $D6                                                               ;8DA1BF;
    dw $3362,$C39A                                                       ;8DA1C0;
    db $FD                                                               ;8DA1C4;
    dw $3368,$C392                                                       ;8DA1C5;
    db $FD                                                               ;8DA1C9;
    dw $3367,$C382                                                       ;8DA1CA;
    db $FD                                                               ;8DA1CE;
    dw $3365                                                             ;8DA1CF;

EnemyProjSpritemaps_NoobTubeCrack_12:
    dw $000E,$C3AA                                                       ;8DA1D1;
    db $34                                                               ;8DA1D5;
    dw $336B,$C3A2                                                       ;8DA1D6;
    db $34                                                               ;8DA1DA;
    dw $336A,$C258                                                       ;8DA1DB;
    db $06                                                               ;8DA1DF;
    dw $7368,$C260                                                       ;8DA1E0;
    db $06                                                               ;8DA1E4;
    dw $7367,$C270                                                       ;8DA1E5;
    db $06                                                               ;8DA1E9;
    dw $7365,$C23A                                                       ;8DA1EA;
    db $D4                                                               ;8DA1EE;
    dw $7363,$C242                                                       ;8DA1EF;
    db $D4                                                               ;8DA1F3;
    dw $7362,$C23E                                                       ;8DA1F4;
    db $2A                                                               ;8DA1F8;
    dw $736B,$C246                                                       ;8DA1F9;
    db $2A                                                               ;8DA1FD;
    dw $736A,$C3B7                                                       ;8DA1FE;
    db $D8                                                               ;8DA202;
    dw $3363,$C3AF                                                       ;8DA203;
    db $D8                                                               ;8DA207;
    dw $3362,$C399                                                       ;8DA208;
    db $FE                                                               ;8DA20C;
    dw $3368,$C391                                                       ;8DA20D;
    db $FE                                                               ;8DA211;
    dw $3367,$C381                                                       ;8DA212;
    db $FE                                                               ;8DA216;
    dw $3365                                                             ;8DA217;

EnemyProjSpritemaps_NoobTubeCrack_13:
    dw $000E,$C3AB                                                       ;8DA219;
    db $36                                                               ;8DA21D;
    dw $336B,$C3A3                                                       ;8DA21E;
    db $36                                                               ;8DA222;
    dw $336A,$C257                                                       ;8DA223;
    db $09                                                               ;8DA227;
    dw $7368,$C25F                                                       ;8DA228;
    db $09                                                               ;8DA22C;
    dw $7367,$C26F                                                       ;8DA22D;
    db $09                                                               ;8DA231;
    dw $7365,$C239                                                       ;8DA232;
    db $D5                                                               ;8DA236;
    dw $7363,$C241                                                       ;8DA237;
    db $D5                                                               ;8DA23B;
    dw $7362,$C23F                                                       ;8DA23C;
    db $2B                                                               ;8DA240;
    dw $736B,$C247                                                       ;8DA241;
    db $2B                                                               ;8DA245;
    dw $736A,$C3B8                                                       ;8DA246;
    db $DA                                                               ;8DA24A;
    dw $3363,$C3B0                                                       ;8DA24B;
    db $DA                                                               ;8DA24F;
    dw $3362,$C39A                                                       ;8DA250;
    db $FF                                                               ;8DA254;
    dw $3368,$C392                                                       ;8DA255;
    db $FF                                                               ;8DA259;
    dw $3367,$C382                                                       ;8DA25A;
    db $FF                                                               ;8DA25E;
    dw $3365                                                             ;8DA25F;

EnemyProjSpritemaps_NoobTubeCrack_14:
    dw $000E,$C3AC                                                       ;8DA261;
    db $38                                                               ;8DA265;
    dw $336B,$C3A4                                                       ;8DA266;
    db $38                                                               ;8DA26A;
    dw $336A,$C258                                                       ;8DA26B;
    db $0C                                                               ;8DA26F;
    dw $7368,$C260                                                       ;8DA270;
    db $0C                                                               ;8DA274;
    dw $7367,$C270                                                       ;8DA275;
    db $0C                                                               ;8DA279;
    dw $7365,$C238                                                       ;8DA27A;
    db $D6                                                               ;8DA27E;
    dw $7363,$C240                                                       ;8DA27F;
    db $D6                                                               ;8DA283;
    dw $7362,$C23E                                                       ;8DA284;
    db $2C                                                               ;8DA288;
    dw $736B,$C246                                                       ;8DA289;
    db $2C                                                               ;8DA28D;
    dw $736A,$C3B7                                                       ;8DA28E;
    db $DC                                                               ;8DA292;
    dw $3363,$C3AF                                                       ;8DA293;
    db $DC                                                               ;8DA297;
    dw $3362,$C399                                                       ;8DA298;
    db $00                                                               ;8DA29C;
    dw $3368,$C391                                                       ;8DA29D;
    db $00                                                               ;8DA2A1;
    dw $3367,$C381                                                       ;8DA2A2;
    db $00                                                               ;8DA2A6;
    dw $3365                                                             ;8DA2A7;

EnemyProjSpritemaps_NoobTubeCrack_15:
    dw $000E,$C3AB                                                       ;8DA2A9;
    db $3A                                                               ;8DA2AD;
    dw $336B,$C3A3                                                       ;8DA2AE;
    db $3A                                                               ;8DA2B2;
    dw $336A,$C39A                                                       ;8DA2B3;
    db $01                                                               ;8DA2B7;
    dw $3368,$C392                                                       ;8DA2B8;
    db $01                                                               ;8DA2BC;
    dw $3367,$C382                                                       ;8DA2BD;
    db $01                                                               ;8DA2C1;
    dw $3365,$C257                                                       ;8DA2C2;
    db $0F                                                               ;8DA2C6;
    dw $7368,$C25F                                                       ;8DA2C7;
    db $0F                                                               ;8DA2CB;
    dw $7367,$C26F                                                       ;8DA2CC;
    db $0F                                                               ;8DA2D0;
    dw $7365,$C239                                                       ;8DA2D1;
    db $D7                                                               ;8DA2D5;
    dw $7363,$C241                                                       ;8DA2D6;
    db $D7                                                               ;8DA2DA;
    dw $7362,$C23D                                                       ;8DA2DB;
    db $2D                                                               ;8DA2DF;
    dw $736B,$C245                                                       ;8DA2E0;
    db $2D                                                               ;8DA2E4;
    dw $736A,$C3B6                                                       ;8DA2E5;
    db $DE                                                               ;8DA2E9;
    dw $3363,$C3AE                                                       ;8DA2EA;
    db $DE                                                               ;8DA2EE;
    dw $3362                                                             ;8DA2EF;

EnemyProjSpritemaps_NoobTubeCrack_16:
    dw $000E,$C3AA                                                       ;8DA2F1;
    db $3C                                                               ;8DA2F5;
    dw $336B,$C3A2                                                       ;8DA2F6;
    db $3C                                                               ;8DA2FA;
    dw $336A,$C399                                                       ;8DA2FB;
    db $02                                                               ;8DA2FF;
    dw $3368,$C391                                                       ;8DA300;
    db $02                                                               ;8DA304;
    dw $3367,$C381                                                       ;8DA305;
    db $02                                                               ;8DA309;
    dw $3365,$C258                                                       ;8DA30A;
    db $12                                                               ;8DA30E;
    dw $7368,$C260                                                       ;8DA30F;
    db $12                                                               ;8DA313;
    dw $7367,$C270                                                       ;8DA314;
    db $12                                                               ;8DA318;
    dw $7365,$C23A                                                       ;8DA319;
    db $D8                                                               ;8DA31D;
    dw $7363,$C242                                                       ;8DA31E;
    db $D8                                                               ;8DA322;
    dw $7362,$C23E                                                       ;8DA323;
    db $2E                                                               ;8DA327;
    dw $736B,$C246                                                       ;8DA328;
    db $2E                                                               ;8DA32C;
    dw $736A,$C3B7                                                       ;8DA32D;
    db $E0                                                               ;8DA331;
    dw $3363,$C3AF                                                       ;8DA332;
    db $E0                                                               ;8DA336;
    dw $3362                                                             ;8DA337;

EnemyProjSpritemaps_NoobTubeCrack_17:
    dw $000E,$C3AB                                                       ;8DA339;
    db $3E                                                               ;8DA33D;
    dw $336B,$C3A3                                                       ;8DA33E;
    db $3E                                                               ;8DA342;
    dw $336A,$C39A                                                       ;8DA343;
    db $03                                                               ;8DA347;
    dw $3368,$C392                                                       ;8DA348;
    db $03                                                               ;8DA34C;
    dw $3367,$C382                                                       ;8DA34D;
    db $03                                                               ;8DA351;
    dw $3365,$C257                                                       ;8DA352;
    db $15                                                               ;8DA356;
    dw $7368,$C25F                                                       ;8DA357;
    db $15                                                               ;8DA35B;
    dw $7367,$C26F                                                       ;8DA35C;
    db $15                                                               ;8DA360;
    dw $7365,$C239                                                       ;8DA361;
    db $D9                                                               ;8DA365;
    dw $7363,$C241                                                       ;8DA366;
    db $D9                                                               ;8DA36A;
    dw $7362,$C23F                                                       ;8DA36B;
    db $2F                                                               ;8DA36F;
    dw $736B,$C247                                                       ;8DA370;
    db $2F                                                               ;8DA374;
    dw $736A,$C3B8                                                       ;8DA375;
    db $E2                                                               ;8DA379;
    dw $3363,$C3B0                                                       ;8DA37A;
    db $E2                                                               ;8DA37E;
    dw $3362                                                             ;8DA37F;

EnemyProjSpritemaps_NoobTubeCrack_18:
    dw $000E,$C3AC                                                       ;8DA381;
    db $40                                                               ;8DA385;
    dw $336B,$C3A4                                                       ;8DA386;
    db $40                                                               ;8DA38A;
    dw $336A,$C399                                                       ;8DA38B;
    db $04                                                               ;8DA38F;
    dw $3368,$C391                                                       ;8DA390;
    db $04                                                               ;8DA394;
    dw $3367,$C381                                                       ;8DA395;
    db $04                                                               ;8DA399;
    dw $3365,$C258                                                       ;8DA39A;
    db $18                                                               ;8DA39E;
    dw $7368,$C260                                                       ;8DA39F;
    db $18                                                               ;8DA3A3;
    dw $7367,$C270                                                       ;8DA3A4;
    db $18                                                               ;8DA3A8;
    dw $7365,$C238                                                       ;8DA3A9;
    db $DA                                                               ;8DA3AD;
    dw $7363,$C240                                                       ;8DA3AE;
    db $DA                                                               ;8DA3B2;
    dw $7362,$C23E                                                       ;8DA3B3;
    db $30                                                               ;8DA3B7;
    dw $736B,$C246                                                       ;8DA3B8;
    db $30                                                               ;8DA3BC;
    dw $736A,$C3B7                                                       ;8DA3BD;
    db $E4                                                               ;8DA3C1;
    dw $3363,$C3AF                                                       ;8DA3C2;
    db $E4                                                               ;8DA3C6;
    dw $3362                                                             ;8DA3C7;

EnemyProjSpritemaps_NoobTubeCrack_19:
    dw $000E,$C3AB                                                       ;8DA3C9;
    db $42                                                               ;8DA3CD;
    dw $336B,$C3A3                                                       ;8DA3CE;
    db $42                                                               ;8DA3D2;
    dw $336A,$C39A                                                       ;8DA3D3;
    db $05                                                               ;8DA3D7;
    dw $3368,$C392                                                       ;8DA3D8;
    db $05                                                               ;8DA3DC;
    dw $3367,$C382                                                       ;8DA3DD;
    db $05                                                               ;8DA3E1;
    dw $3365,$C257                                                       ;8DA3E2;
    db $1B                                                               ;8DA3E6;
    dw $7368,$C25F                                                       ;8DA3E7;
    db $1B                                                               ;8DA3EB;
    dw $7367,$C26F                                                       ;8DA3EC;
    db $1B                                                               ;8DA3F0;
    dw $7365,$C239                                                       ;8DA3F1;
    db $DB                                                               ;8DA3F5;
    dw $7363,$C241                                                       ;8DA3F6;
    db $DB                                                               ;8DA3FA;
    dw $7362,$C23D                                                       ;8DA3FB;
    db $31                                                               ;8DA3FF;
    dw $736B,$C245                                                       ;8DA400;
    db $31                                                               ;8DA404;
    dw $736A,$C3B6                                                       ;8DA405;
    db $E6                                                               ;8DA409;
    dw $3363,$C3AE                                                       ;8DA40A;
    db $E6                                                               ;8DA40E;
    dw $3362                                                             ;8DA40F;

EnemyProjSpritemaps_NoobTubeCrack_1A:
    dw $000E,$C3AA                                                       ;8DA411;
    db $44                                                               ;8DA415;
    dw $336B,$C3A2                                                       ;8DA416;
    db $44                                                               ;8DA41A;
    dw $336A,$C399                                                       ;8DA41B;
    db $06                                                               ;8DA41F;
    dw $3368,$C391                                                       ;8DA420;
    db $06                                                               ;8DA424;
    dw $3367,$C381                                                       ;8DA425;
    db $06                                                               ;8DA429;
    dw $3365,$C258                                                       ;8DA42A;
    db $1E                                                               ;8DA42E;
    dw $7368,$C260                                                       ;8DA42F;
    db $1E                                                               ;8DA433;
    dw $7367,$C270                                                       ;8DA434;
    db $1E                                                               ;8DA438;
    dw $7365,$C23A                                                       ;8DA439;
    db $DC                                                               ;8DA43D;
    dw $7363,$C242                                                       ;8DA43E;
    db $DC                                                               ;8DA442;
    dw $7362,$C23E                                                       ;8DA443;
    db $32                                                               ;8DA447;
    dw $736B,$C246                                                       ;8DA448;
    db $32                                                               ;8DA44C;
    dw $736A,$C3B7                                                       ;8DA44D;
    db $E8                                                               ;8DA451;
    dw $3363,$C3AF                                                       ;8DA452;
    db $E8                                                               ;8DA456;
    dw $3362                                                             ;8DA457;

EnemyProjSpritemaps_NoobTubeCrack_1B:
    dw $000E,$C3AB                                                       ;8DA459;
    db $46                                                               ;8DA45D;
    dw $336B,$C3A3                                                       ;8DA45E;
    db $46                                                               ;8DA462;
    dw $336A,$C39A                                                       ;8DA463;
    db $07                                                               ;8DA467;
    dw $3368,$C392                                                       ;8DA468;
    db $07                                                               ;8DA46C;
    dw $3367,$C382                                                       ;8DA46D;
    db $07                                                               ;8DA471;
    dw $3365,$C257                                                       ;8DA472;
    db $21                                                               ;8DA476;
    dw $7368,$C25F                                                       ;8DA477;
    db $21                                                               ;8DA47B;
    dw $7367,$C26F                                                       ;8DA47C;
    db $21                                                               ;8DA480;
    dw $7365,$C239                                                       ;8DA481;
    db $DD                                                               ;8DA485;
    dw $7363,$C241                                                       ;8DA486;
    db $DD                                                               ;8DA48A;
    dw $7362,$C23F                                                       ;8DA48B;
    db $33                                                               ;8DA48F;
    dw $736B,$C247                                                       ;8DA490;
    db $33                                                               ;8DA494;
    dw $736A,$C3B8                                                       ;8DA495;
    db $EA                                                               ;8DA499;
    dw $3363,$C3B0                                                       ;8DA49A;
    db $EA                                                               ;8DA49E;
    dw $3362                                                             ;8DA49F;

EnemyProjSpritemaps_NoobTubeCrack_1C:
    dw $000E,$C3AC                                                       ;8DA4A1;
    db $48                                                               ;8DA4A5;
    dw $336B,$C3A4                                                       ;8DA4A6;
    db $48                                                               ;8DA4AA;
    dw $336A,$C399                                                       ;8DA4AB;
    db $08                                                               ;8DA4AF;
    dw $3368,$C391                                                       ;8DA4B0;
    db $08                                                               ;8DA4B4;
    dw $3367,$C381                                                       ;8DA4B5;
    db $08                                                               ;8DA4B9;
    dw $3365,$C258                                                       ;8DA4BA;
    db $24                                                               ;8DA4BE;
    dw $7368,$C260                                                       ;8DA4BF;
    db $24                                                               ;8DA4C3;
    dw $7367,$C270                                                       ;8DA4C4;
    db $24                                                               ;8DA4C8;
    dw $7365,$C238                                                       ;8DA4C9;
    db $DE                                                               ;8DA4CD;
    dw $7363,$C240                                                       ;8DA4CE;
    db $DE                                                               ;8DA4D2;
    dw $7362,$C23E                                                       ;8DA4D3;
    db $34                                                               ;8DA4D7;
    dw $736B,$C246                                                       ;8DA4D8;
    db $34                                                               ;8DA4DC;
    dw $736A,$C3B7                                                       ;8DA4DD;
    db $EC                                                               ;8DA4E1;
    dw $3363,$C3AF                                                       ;8DA4E2;
    db $EC                                                               ;8DA4E6;
    dw $3362                                                             ;8DA4E7;

EnemyProjSpritemaps_NoobTubeCrack_1D:
    dw $000E,$C3AB                                                       ;8DA4E9;
    db $4A                                                               ;8DA4ED;
    dw $336B,$C3A3                                                       ;8DA4EE;
    db $4A                                                               ;8DA4F2;
    dw $336A,$C257                                                       ;8DA4F3;
    db $27                                                               ;8DA4F7;
    dw $7368,$C25F                                                       ;8DA4F8;
    db $27                                                               ;8DA4FC;
    dw $7367,$C26F                                                       ;8DA4FD;
    db $27                                                               ;8DA501;
    dw $7365,$C239                                                       ;8DA502;
    db $DF                                                               ;8DA506;
    dw $7363,$C241                                                       ;8DA507;
    db $DF                                                               ;8DA50B;
    dw $7362,$C23D                                                       ;8DA50C;
    db $35                                                               ;8DA510;
    dw $736B,$C245                                                       ;8DA511;
    db $35                                                               ;8DA515;
    dw $736A,$C3B6                                                       ;8DA516;
    db $EE                                                               ;8DA51A;
    dw $3363,$C3AE                                                       ;8DA51B;
    db $EE                                                               ;8DA51F;
    dw $3362,$C39A                                                       ;8DA520;
    db $09                                                               ;8DA524;
    dw $3368,$C392                                                       ;8DA525;
    db $09                                                               ;8DA529;
    dw $3367,$C382                                                       ;8DA52A;
    db $09                                                               ;8DA52E;
    dw $3365                                                             ;8DA52F;

EnemyProjSpritemaps_NoobTubeCrack_1E:
    dw $000E,$C3AA                                                       ;8DA531;
    db $4C                                                               ;8DA535;
    dw $336B,$C3A2                                                       ;8DA536;
    db $4C                                                               ;8DA53A;
    dw $336A,$C258                                                       ;8DA53B;
    db $2A                                                               ;8DA53F;
    dw $7368,$C260                                                       ;8DA540;
    db $2A                                                               ;8DA544;
    dw $7367,$C270                                                       ;8DA545;
    db $2A                                                               ;8DA549;
    dw $7365,$C23A                                                       ;8DA54A;
    db $E0                                                               ;8DA54E;
    dw $7363,$C242                                                       ;8DA54F;
    db $E0                                                               ;8DA553;
    dw $7362,$C23E                                                       ;8DA554;
    db $36                                                               ;8DA558;
    dw $736B,$C246                                                       ;8DA559;
    db $36                                                               ;8DA55D;
    dw $736A,$C3B7                                                       ;8DA55E;
    db $F0                                                               ;8DA562;
    dw $3363,$C3AF                                                       ;8DA563;
    db $F0                                                               ;8DA567;
    dw $3362,$C399                                                       ;8DA568;
    db $0A                                                               ;8DA56C;
    dw $3368,$C391                                                       ;8DA56D;
    db $0A                                                               ;8DA571;
    dw $3367,$C381                                                       ;8DA572;
    db $0A                                                               ;8DA576;
    dw $3365                                                             ;8DA577;

EnemyProjSpritemaps_NoobTubeCrack_1F:
    dw $000E,$C3AB                                                       ;8DA579;
    db $4E                                                               ;8DA57D;
    dw $336B,$C3A3                                                       ;8DA57E;
    db $4E                                                               ;8DA582;
    dw $336A,$C257                                                       ;8DA583;
    db $2D                                                               ;8DA587;
    dw $7368,$C25F                                                       ;8DA588;
    db $2D                                                               ;8DA58C;
    dw $7367,$C26F                                                       ;8DA58D;
    db $2D                                                               ;8DA591;
    dw $7365,$C239                                                       ;8DA592;
    db $E1                                                               ;8DA596;
    dw $7363,$C241                                                       ;8DA597;
    db $E1                                                               ;8DA59B;
    dw $7362,$C23F                                                       ;8DA59C;
    db $37                                                               ;8DA5A0;
    dw $736B,$C247                                                       ;8DA5A1;
    db $37                                                               ;8DA5A5;
    dw $736A,$C3B8                                                       ;8DA5A6;
    db $F2                                                               ;8DA5AA;
    dw $3363,$C3B0                                                       ;8DA5AB;
    db $F2                                                               ;8DA5AF;
    dw $3362,$C39A                                                       ;8DA5B0;
    db $0B                                                               ;8DA5B4;
    dw $3368,$C392                                                       ;8DA5B5;
    db $0B                                                               ;8DA5B9;
    dw $3367,$C382                                                       ;8DA5BA;
    db $0B                                                               ;8DA5BE;
    dw $3365                                                             ;8DA5BF;

EnemyProjSpritemaps_NoobTubeCrack_20:
    dw $000E,$C3AC                                                       ;8DA5C1;
    db $50                                                               ;8DA5C5;
    dw $336B,$C3A4                                                       ;8DA5C6;
    db $50                                                               ;8DA5CA;
    dw $336A,$C258                                                       ;8DA5CB;
    db $30                                                               ;8DA5CF;
    dw $7368,$C260                                                       ;8DA5D0;
    db $30                                                               ;8DA5D4;
    dw $7367,$C270                                                       ;8DA5D5;
    db $30                                                               ;8DA5D9;
    dw $7365,$C238                                                       ;8DA5DA;
    db $E2                                                               ;8DA5DE;
    dw $7363,$C240                                                       ;8DA5DF;
    db $E2                                                               ;8DA5E3;
    dw $7362,$C23E                                                       ;8DA5E4;
    db $38                                                               ;8DA5E8;
    dw $736B,$C246                                                       ;8DA5E9;
    db $38                                                               ;8DA5ED;
    dw $736A,$C3B7                                                       ;8DA5EE;
    db $F4                                                               ;8DA5F2;
    dw $3363,$C3AF                                                       ;8DA5F3;
    db $F4                                                               ;8DA5F7;
    dw $3362,$C399                                                       ;8DA5F8;
    db $0C                                                               ;8DA5FC;
    dw $3368,$C391                                                       ;8DA5FD;
    db $0C                                                               ;8DA601;
    dw $3367,$C381                                                       ;8DA602;
    db $0C                                                               ;8DA606;
    dw $3365                                                             ;8DA607;

EnemyProjSpritemaps_NoobTubeCrack_21:
    dw $000E,$C3AB                                                       ;8DA609;
    db $52                                                               ;8DA60D;
    dw $336B,$C3A3                                                       ;8DA60E;
    db $52                                                               ;8DA612;
    dw $336A,$C257                                                       ;8DA613;
    db $33                                                               ;8DA617;
    dw $7368,$C25F                                                       ;8DA618;
    db $33                                                               ;8DA61C;
    dw $7367,$C26F                                                       ;8DA61D;
    db $33                                                               ;8DA621;
    dw $7365,$C239                                                       ;8DA622;
    db $E3                                                               ;8DA626;
    dw $7363,$C241                                                       ;8DA627;
    db $E3                                                               ;8DA62B;
    dw $7362,$C23D                                                       ;8DA62C;
    db $39                                                               ;8DA630;
    dw $736B,$C245                                                       ;8DA631;
    db $39                                                               ;8DA635;
    dw $736A,$C3B6                                                       ;8DA636;
    db $F6                                                               ;8DA63A;
    dw $3363,$C3AE                                                       ;8DA63B;
    db $F6                                                               ;8DA63F;
    dw $3362,$C39A                                                       ;8DA640;
    db $0D                                                               ;8DA644;
    dw $3368,$C392                                                       ;8DA645;
    db $0D                                                               ;8DA649;
    dw $3367,$C382                                                       ;8DA64A;
    db $0D                                                               ;8DA64E;
    dw $3365                                                             ;8DA64F;

EnemyProjSpritemaps_NoobTubeCrack_22:
    dw $000E,$C3AA                                                       ;8DA651;
    db $54                                                               ;8DA655;
    dw $336B,$C3A2                                                       ;8DA656;
    db $54                                                               ;8DA65A;
    dw $336A,$C399                                                       ;8DA65B;
    db $0E                                                               ;8DA65F;
    dw $3368,$C391                                                       ;8DA660;
    db $0E                                                               ;8DA664;
    dw $3367,$C381                                                       ;8DA665;
    db $0E                                                               ;8DA669;
    dw $3365,$C258                                                       ;8DA66A;
    db $36                                                               ;8DA66E;
    dw $7368,$C260                                                       ;8DA66F;
    db $36                                                               ;8DA673;
    dw $7367,$C270                                                       ;8DA674;
    db $36                                                               ;8DA678;
    dw $7365,$C23A                                                       ;8DA679;
    db $E4                                                               ;8DA67D;
    dw $7363,$C242                                                       ;8DA67E;
    db $E4                                                               ;8DA682;
    dw $7362,$C23E                                                       ;8DA683;
    db $3A                                                               ;8DA687;
    dw $736B,$C246                                                       ;8DA688;
    db $3A                                                               ;8DA68C;
    dw $736A,$C3B7                                                       ;8DA68D;
    db $F8                                                               ;8DA691;
    dw $3363,$C3AF                                                       ;8DA692;
    db $F8                                                               ;8DA696;
    dw $3362                                                             ;8DA697;

EnemyProjSpritemaps_NoobTubeCrack_23:
    dw $000E,$C3AB                                                       ;8DA699;
    db $54                                                               ;8DA69D;
    dw $336B,$C3A3                                                       ;8DA69E;
    db $54                                                               ;8DA6A2;
    dw $336A,$C39A                                                       ;8DA6A3;
    db $0E                                                               ;8DA6A7;
    dw $3368,$C392                                                       ;8DA6A8;
    db $0E                                                               ;8DA6AC;
    dw $3367,$C382                                                       ;8DA6AD;
    db $0E                                                               ;8DA6B1;
    dw $3365,$C257                                                       ;8DA6B2;
    db $36                                                               ;8DA6B6;
    dw $7368,$C25F                                                       ;8DA6B7;
    db $36                                                               ;8DA6BB;
    dw $7367,$C26F                                                       ;8DA6BC;
    db $36                                                               ;8DA6C0;
    dw $7365,$C239                                                       ;8DA6C1;
    db $E4                                                               ;8DA6C5;
    dw $7363,$C241                                                       ;8DA6C6;
    db $E4                                                               ;8DA6CA;
    dw $7362,$C23F                                                       ;8DA6CB;
    db $3A                                                               ;8DA6CF;
    dw $736B,$C247                                                       ;8DA6D0;
    db $3A                                                               ;8DA6D4;
    dw $736A,$C3B8                                                       ;8DA6D5;
    db $F8                                                               ;8DA6D9;
    dw $3363,$C3B0                                                       ;8DA6DA;
    db $F8                                                               ;8DA6DE;
    dw $3362                                                             ;8DA6DF;

EnemyProjSpritemaps_NoobTubeShards_0:
    dw $0002,$C3F3                                                       ;8DA6E1;
    db $FA                                                               ;8DA6E5;
    dw $F3A2,$C203                                                       ;8DA6E6;
    db $FA                                                               ;8DA6EA;
    dw $F3A0                                                             ;8DA6EB;

EnemyProjSpritemaps_NoobTubeShards_1:
    dw $0002,$C3FE                                                       ;8DA6ED;
    db $FA                                                               ;8DA6F1;
    dw $B3A2,$C3EE                                                       ;8DA6F2;
    db $FA                                                               ;8DA6F6;
    dw $B3A0                                                             ;8DA6F7;

EnemyProjSpritemaps_NoobTubeShards_2:
    dw $0002,$C3FD                                                       ;8DA6F9;
    db $FD                                                               ;8DA6FD;
    dw $33A6,$C3F5                                                       ;8DA6FE;
    db $F5                                                               ;8DA702;
    dw $33A4                                                             ;8DA703;

EnemyProjSpritemaps_NoobTubeShards_3:
    dw $0002,$C3F4                                                       ;8DA705;
    db $FD                                                               ;8DA709;
    dw $73A6,$C3FC                                                       ;8DA70A;
    db $F5                                                               ;8DA70E;
    dw $73A4                                                             ;8DA70F;

EnemyProjSpritemaps_NoobTubeShards_4:
    dw $0001,$C3F7                                                       ;8DA711;
    db $F8                                                               ;8DA715;
    dw $33A8                                                             ;8DA716;

EnemyProjSpritemaps_NoobTubeShards_5:
    dw $0001,$C3FA                                                       ;8DA718;
    db $F8                                                               ;8DA71C;
    dw $73A8                                                             ;8DA71D;

EnemyProjSpritemaps_NoobTubeShards_6:
    dw $0002,$C3EC                                                       ;8DA71F;
    db $F9                                                               ;8DA723;
    dw $73AC,$C3FC                                                       ;8DA724;
    db $F9                                                               ;8DA728;
    dw $73AA                                                             ;8DA729;

EnemyProjSpritemaps_NoobTubeShards_7:
    dw $0002,$C205                                                       ;8DA72B;
    db $F9                                                               ;8DA72F;
    dw $33AC,$C3F5                                                       ;8DA730;
    db $F9                                                               ;8DA734;
    dw $33AA                                                             ;8DA735;

EnemyProjSpritemaps_NoobTubeShards_8:
    dw $0002,$C3F3                                                       ;8DA737;
    db $FB                                                               ;8DA73B;
    dw $73AE,$C203                                                       ;8DA73C;
    db $FB                                                               ;8DA740;
    dw $738E                                                             ;8DA741;

EnemyProjSpritemaps_NoobTubeShards_9:
    dw $0002,$C3FE                                                       ;8DA743;
    db $FB                                                               ;8DA747;
    dw $33AE,$C3EE                                                       ;8DA748;
    db $FB                                                               ;8DA74C;
    dw $338E                                                             ;8DA74D;

EnemyProjSpritemaps_NoobTubeShards_A:
    dw $0002,$C3F3                                                       ;8DA74F;
    db $F6                                                               ;8DA753;
    dw $F3AE,$C203                                                       ;8DA754;
    db $F6                                                               ;8DA758;
    dw $F38E                                                             ;8DA759;

EnemyProjSpritemaps_NoobTubeShards_B:
    dw $0002,$C3FE                                                       ;8DA75B;
    db $F6                                                               ;8DA75F;
    dw $B3AE,$C3EE                                                       ;8DA760;
    db $F6                                                               ;8DA764;
    dw $B38E                                                             ;8DA765;

EnemyProjSpritemaps_NoobTubeShards_C:
    dw $0002,$C200                                                       ;8DA767;
    db $F8                                                               ;8DA76B;
    dw $3388,$C3F0                                                       ;8DA76C;
    db $F8                                                               ;8DA770;
    dw $3386                                                             ;8DA771;

EnemyProjSpritemaps_NoobTubeShards_D:
    dw $0002,$C3F1                                                       ;8DA773;
    db $F8                                                               ;8DA777;
    dw $7388,$C201                                                       ;8DA778;
    db $F8                                                               ;8DA77C;
    dw $7386                                                             ;8DA77D;

EnemyProjSpritemaps_NoobTubeShards_E:
    dw $0002,$C201                                                       ;8DA77F;
    db $F8                                                               ;8DA783;
    dw $338C,$C3F1                                                       ;8DA784;
    db $F8                                                               ;8DA788;
    dw $338A                                                             ;8DA789;

EnemyProjSpritemaps_NoobTubeShards_F:
    dw $0002,$C3F0                                                       ;8DA78B;
    db $F8                                                               ;8DA78F;
    dw $738C,$C200                                                       ;8DA790;
    db $F8                                                               ;8DA794;
    dw $738A                                                             ;8DA795;

EnemyProjSpritemaps_NoobTubeShards_10:
    dw $0002,$C3F8                                                       ;8DA797;
    db $F4                                                               ;8DA79B;
    dw $3382,$C3F8                                                       ;8DA79C;
    db $FC                                                               ;8DA7A0;
    dw $3384                                                             ;8DA7A1;

EnemyProjSpritemaps_NoobTubeShards_11:
    dw $0002,$C3F4                                                       ;8DA7A3;
    db $F0                                                               ;8DA7A7;
    dw $336D,$C3F4                                                       ;8DA7A8;
    db $00                                                               ;8DA7AC;
    dw $3380                                                             ;8DA7AD;

EnemyProjSpritemaps_NoobTubeShards_12:
    dw $0002,$C3FC                                                       ;8DA7AF;
    db $00                                                               ;8DA7B3;
    dw $7380,$C3FC                                                       ;8DA7B4;
    db $F0                                                               ;8DA7B8;
    dw $736D                                                             ;8DA7B9;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_0:
    dw $0001,$C3F8                                                       ;8DA7BB;
    db $F8                                                               ;8DA7BF;
    dw $3A7C                                                             ;8DA7C0;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_1:
    dw $0002,$C3F8                                                       ;8DA7C2;
    db $F8                                                               ;8DA7C6;
    dw $3A7C,$C3F8                                                       ;8DA7C7;
    db $00                                                               ;8DA7CB;
    dw $3A7E                                                             ;8DA7CC;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_2:
    dw $0003,$C3F8                                                       ;8DA7CE;
    db $F8                                                               ;8DA7D2;
    dw $3A7C,$C3F8                                                       ;8DA7D3;
    db $00                                                               ;8DA7D7;
    dw $3A7E,$C3F8                                                       ;8DA7D8;
    db $08                                                               ;8DA7DC;
    dw $3A9A                                                             ;8DA7DD;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_3:
    dw $0004,$C3F8                                                       ;8DA7DF;
    db $F8                                                               ;8DA7E3;
    dw $3A7C,$C3F8                                                       ;8DA7E4;
    db $00                                                               ;8DA7E8;
    dw $3A7E,$C3F8                                                       ;8DA7E9;
    db $08                                                               ;8DA7ED;
    dw $3A9A,$C3F8                                                       ;8DA7EE;
    db $10                                                               ;8DA7F2;
    dw $3A9C                                                             ;8DA7F3;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_8DA7F5:
    dw $C3F8                                                             ;8DA7F5;
    db $C0                                                               ;8DA7F7;
    dw $3A9C                                                             ;8DA7F8;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_4:
    dw $0007,$01FD                                                       ;8DA7FA;
    db $F2                                                               ;8DA7FE;
    dw $3A43,$01FF                                                       ;8DA7FF;
    db $F3                                                               ;8DA803;
    dw $3A43,$01FA                                                       ;8DA804;
    db $F4                                                               ;8DA808;
    dw $3A43,$01FA                                                       ;8DA809;
    db $F9                                                               ;8DA80D;
    dw $3A43,$C3F8                                                       ;8DA80E;
    db $F8                                                               ;8DA812;
    dw $3A7E,$C3F8                                                       ;8DA813;
    db $00                                                               ;8DA817;
    dw $3A9A,$C3F8                                                       ;8DA818;
    db $08                                                               ;8DA81C;
    dw $3A9C                                                             ;8DA81D;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_5:
    dw $0007,$01FE                                                       ;8DA81F;
    db $F2                                                               ;8DA823;
    dw $3A43,$0000                                                       ;8DA824;
    db $F3                                                               ;8DA828;
    dw $3A43,$01FB                                                       ;8DA829;
    db $F4                                                               ;8DA82D;
    dw $3A43,$01FB                                                       ;8DA82E;
    db $F9                                                               ;8DA832;
    dw $3A43,$C3F8                                                       ;8DA833;
    db $F8                                                               ;8DA837;
    dw $3A7E,$C3F8                                                       ;8DA838;
    db $00                                                               ;8DA83C;
    dw $3A9A,$C3F8                                                       ;8DA83D;
    db $08                                                               ;8DA841;
    dw $3A9C                                                             ;8DA842;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_6:
    dw $0006,$01FA                                                       ;8DA844;
    db $F4                                                               ;8DA848;
    dw $3A25,$01FD                                                       ;8DA849;
    db $F2                                                               ;8DA84D;
    dw $3A25,$01FA                                                       ;8DA84E;
    db $F9                                                               ;8DA852;
    dw $3A25,$01FF                                                       ;8DA853;
    db $F3                                                               ;8DA857;
    dw $3A25,$C3F8                                                       ;8DA858;
    db $F8                                                               ;8DA85C;
    dw $3A9A,$C3F8                                                       ;8DA85D;
    db $00                                                               ;8DA861;
    dw $3A9C                                                             ;8DA862;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_7:
    dw $0006,$01FC                                                       ;8DA864;
    db $EC                                                               ;8DA868;
    dw $3A25,$01F8                                                       ;8DA869;
    db $F2                                                               ;8DA86D;
    dw $3A25,$01FC                                                       ;8DA86E;
    db $F5                                                               ;8DA872;
    dw $3A25,$0000                                                       ;8DA873;
    db $F0                                                               ;8DA877;
    dw $3A25,$C3F8                                                       ;8DA878;
    db $F8                                                               ;8DA87C;
    dw $3A9A,$C3F8                                                       ;8DA87D;
    db $00                                                               ;8DA881;
    dw $3A9C                                                             ;8DA882;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_8:
    dw $0005,$01FC                                                       ;8DA884;
    db $E8                                                               ;8DA888;
    dw $3A25,$01F7                                                       ;8DA889;
    db $EF                                                               ;8DA88D;
    dw $3A25,$01FB                                                       ;8DA88E;
    db $F5                                                               ;8DA892;
    dw $3A25,$0001                                                       ;8DA893;
    db $EE                                                               ;8DA897;
    dw $3A25,$C3F8                                                       ;8DA898;
    db $F8                                                               ;8DA89C;
    dw $3A9C                                                             ;8DA89D;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_9:
    dw $0005,$01FC                                                       ;8DA89F;
    db $E8                                                               ;8DA8A3;
    dw $3A25,$01F8                                                       ;8DA8A4;
    db $F0                                                               ;8DA8A8;
    dw $3A25,$01FD                                                       ;8DA8A9;
    db $F5                                                               ;8DA8AD;
    dw $3A25,$0002                                                       ;8DA8AE;
    db $EE                                                               ;8DA8B2;
    dw $3A25,$C3F8                                                       ;8DA8B3;
    db $F8                                                               ;8DA8B7;
    dw $3A9C                                                             ;8DA8B8;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_A:
    dw $0004,$01FC                                                       ;8DA8BA;
    db $E8                                                               ;8DA8BE;
    dw $3A25,$01F8                                                       ;8DA8BF;
    db $F0                                                               ;8DA8C3;
    dw $3A25,$01FD                                                       ;8DA8C4;
    db $F5                                                               ;8DA8C8;
    dw $3A25,$0002                                                       ;8DA8C9;
    db $ED                                                               ;8DA8CD;
    dw $3A25                                                             ;8DA8CE;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_B:
    dw $0004,$0002                                                       ;8DA8D0;
    db $ED                                                               ;8DA8D4;
    dw $3A25,$01FC                                                       ;8DA8D5;
    db $E8                                                               ;8DA8D9;
    dw $3A25,$01FD                                                       ;8DA8DA;
    db $F5                                                               ;8DA8DE;
    dw $3A43,$01F8                                                       ;8DA8DF;
    db $F0                                                               ;8DA8E3;
    dw $3A43                                                             ;8DA8E4;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_C:
    dw $0004,$0002                                                       ;8DA8E6;
    db $ED                                                               ;8DA8EA;
    dw $3A43,$01FC                                                       ;8DA8EB;
    db $E8                                                               ;8DA8EF;
    dw $3A43,$01FD                                                       ;8DA8F0;
    db $F5                                                               ;8DA8F4;
    dw $3A40,$01F8                                                       ;8DA8F5;
    db $F0                                                               ;8DA8F9;
    dw $3A40                                                             ;8DA8FA;

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_D:
    dw $0002,$0002                                                       ;8DA8FC;
    db $ED                                                               ;8DA900;
    dw $3A40,$01FC                                                       ;8DA901;
    db $E8                                                               ;8DA905;
    dw $3A40                                                             ;8DA906;

EnemyProjSpritemaps_CacatacSpikes_0:
    dw $0001,$01FC                                                       ;8DA908;
    db $FC                                                               ;8DA90C;
    dw $311B                                                             ;8DA90D;

EnemyProjSpritemaps_CacatacSpikes_1:
    dw $0001,$01FC                                                       ;8DA90F;
    db $FC                                                               ;8DA913;
    dw $310E                                                             ;8DA914;

EnemyProjSpritemaps_CacatacSpikes_2:
    dw $0001,$01FC                                                       ;8DA916;
    db $FC                                                               ;8DA91A;
    dw $310F                                                             ;8DA91B;

EnemyProjSpritemaps_CacatacSpikes_3:
    dw $0001,$01FC                                                       ;8DA91D;
    db $FC                                                               ;8DA921;
    dw $710E                                                             ;8DA922;

EnemyProjSpritemaps_CacatacSpikes_4:
    dw $0001,$01FC                                                       ;8DA924;
    db $FC                                                               ;8DA928;
    dw $711B                                                             ;8DA929;

EnemyProjSpritemaps_CacatacSpikes_5:
    dw $0001,$01FC                                                       ;8DA92B;
    db $FC                                                               ;8DA92F;
    dw $B11B                                                             ;8DA930;

EnemyProjSpritemaps_CacatacSpikes_6:
    dw $0001,$01FC                                                       ;8DA932;
    db $FC                                                               ;8DA936;
    dw $B10E                                                             ;8DA937;

EnemyProjSpritemaps_CacatacSpikes_7:
    dw $0001,$01FC                                                       ;8DA939;
    db $FC                                                               ;8DA93D;
    dw $B10F                                                             ;8DA93E;

EnemyProjSpritemaps_CacatacSpikes_8:
    dw $0001,$01FC                                                       ;8DA940;
    db $FC                                                               ;8DA944;
    dw $F10E                                                             ;8DA945;

EnemyProjSpritemaps_CacatacSpikes_9:
    dw $0001,$01FC                                                       ;8DA947;
    db $FC                                                               ;8DA94B;
    dw $F11B                                                             ;8DA94C;

UNUSED_EnemyProjSpritemaps_StokeProjectile_0_8DA94E:
    dw $0001,$01FC                                                       ;8DA94E;
    db $FC                                                               ;8DA952;
    dw $311E                                                             ;8DA953;

UNUSED_EnemyProjSpritemaps_StokeProjectile_1_8DA955:
    dw $0001,$01FC                                                       ;8DA955;
    db $FC                                                               ;8DA959;
    dw $311D                                                             ;8DA95A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DA95C:
    dw $0001,$C3F8                                                       ;8DA95C;
    db $F8                                                               ;8DA960;
    dw $3126                                                             ;8DA961;

UNUSED_EnemyProjSpritemaps_1_8DA963:
    dw $0001,$C3F8                                                       ;8DA963;
    db $F8                                                               ;8DA967;
    dw $3128                                                             ;8DA968;

UNUSED_EnemyProjSpritemaps_2_8DA96A:
    dw $0001,$C3F8                                                       ;8DA96A;
    db $F8                                                               ;8DA96E;
    dw $310C                                                             ;8DA96F;

UNUSED_EnemyProjSpritemaps_3_8DA971:
    dw $0001,$C3F8                                                       ;8DA971;
    db $F8                                                               ;8DA975;
    dw $310E                                                             ;8DA976;

UNUSED_EnemyProjSpritemaps_4_8DA978:
    dw $0001,$C3F8                                                       ;8DA978;
    db $F8                                                               ;8DA97C;
    dw $312C                                                             ;8DA97D;

UNUSED_EnemyProjSpritemaps_5_8DA97F:
    dw $0001,$01FC                                                       ;8DA97F;
    db $FC                                                               ;8DA983;
    dw $313E                                                             ;8DA984;

UNUSED_EnemyProjSpritemaps_6_8DA986:
    dw $0001,$01FC                                                       ;8DA986;
    db $FC                                                               ;8DA98A;
    dw $312F                                                             ;8DA98B;

UNUSED_EnemyProjSpritemaps_7_8DA98D:
    dw $0001,$01FC                                                       ;8DA98D;
    db $FC                                                               ;8DA991;
    dw $312E                                                             ;8DA992;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_SporeSpawnsStalk:
    dw $0001,$81F8                                                       ;8DA994;
    db $F8                                                               ;8DA998;
    dw $3340                                                             ;8DA999;

EnemyProjSpritemaps_SporeSpawners_0:
    dw $0001,$81F8                                                       ;8DA99B;
    db $F8                                                               ;8DA99F;
    dw $210C                                                             ;8DA9A0;

EnemyProjSpritemaps_SporeSpawners_1:
    dw $0001,$81F8                                                       ;8DA9A2;
    db $F8                                                               ;8DA9A6;
    dw $210E                                                             ;8DA9A7;

EnemyProjSpritemaps_SporeSpawners_2:
    dw $0001,$81F8                                                       ;8DA9A9;
    db $F8                                                               ;8DA9AD;
    dw $212C                                                             ;8DA9AE;

EnemyProjSpritemaps_Spores_0:
    dw $0001,$01FC                                                       ;8DA9B0;
    db $FC                                                               ;8DA9B4;
    dw $2F3E                                                             ;8DA9B5;

EnemyProjSpritemaps_Spores_1:
    dw $0001,$01FC                                                       ;8DA9B7;
    db $FC                                                               ;8DA9BB;
    dw $2F2F                                                             ;8DA9BC;

EnemyProjSpritemaps_Spores_2:
    dw $0001,$01FC                                                       ;8DA9BE;
    db $FC                                                               ;8DA9C2;
    dw $2F2E                                                             ;8DA9C3;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DA9C5:
    dw $0018,$8000                                                       ;8DA9C5;
    db $26                                                               ;8DA9C9;
    dw $614E,$8010                                                       ;8DA9CA;
    db $26                                                               ;8DA9CE;
    dw $614C,$8020                                                       ;8DA9CF;
    db $26                                                               ;8DA9D3;
    dw $614A,$8000                                                       ;8DA9D4;
    db $16                                                               ;8DA9D8;
    dw $6148,$8010                                                       ;8DA9D9;
    db $16                                                               ;8DA9DD;
    dw $6146,$8020                                                       ;8DA9DE;
    db $16                                                               ;8DA9E2;
    dw $6144,$81F0                                                       ;8DA9E3;
    db $26                                                               ;8DA9E7;
    dw $214E,$81E0                                                       ;8DA9E8;
    db $26                                                               ;8DA9EC;
    dw $214C,$81D0                                                       ;8DA9ED;
    db $26                                                               ;8DA9F1;
    dw $214A,$81F0                                                       ;8DA9F2;
    db $16                                                               ;8DA9F6;
    dw $2148,$81E0                                                       ;8DA9F7;
    db $16                                                               ;8DA9FB;
    dw $2146,$81D0                                                       ;8DA9FC;
    db $16                                                               ;8DAA00;
    dw $2144,$8000                                                       ;8DAA01;
    db $DA                                                               ;8DAA05;
    dw $6124,$8010                                                       ;8DAA06;
    db $DA                                                               ;8DAA0A;
    dw $6122,$8020                                                       ;8DAA0B;
    db $DA                                                               ;8DAA0F;
    dw $6120,$8000                                                       ;8DAA10;
    db $CA                                                               ;8DAA14;
    dw $6104,$8010                                                       ;8DAA15;
    db $CA                                                               ;8DAA19;
    dw $6102,$8020                                                       ;8DAA1A;
    db $CA                                                               ;8DAA1E;
    dw $6100,$81F0                                                       ;8DAA1F;
    db $DA                                                               ;8DAA23;
    dw $2124,$81E0                                                       ;8DAA24;
    db $DA                                                               ;8DAA28;
    dw $2122,$81D0                                                       ;8DAA29;
    db $DA                                                               ;8DAA2D;
    dw $2120,$81F0                                                       ;8DAA2E;
    db $CA                                                               ;8DAA32;
    dw $2104,$81E0                                                       ;8DAA33;
    db $CA                                                               ;8DAA37;
    dw $2102,$81D0                                                       ;8DAA38;
    db $CA                                                               ;8DAA3C;
    dw $2100                                                             ;8DAA3D;

UNUSED_EnemyProjSpritemaps_1_8DA93F:
    dw $0018,$8000                                                       ;8DAA3F;
    db $28                                                               ;8DAA43;
    dw $614E,$8010                                                       ;8DAA44;
    db $28                                                               ;8DAA48;
    dw $614C,$8020                                                       ;8DAA49;
    db $28                                                               ;8DAA4D;
    dw $614A,$8000                                                       ;8DAA4E;
    db $18                                                               ;8DAA52;
    dw $6148,$8010                                                       ;8DAA53;
    db $18                                                               ;8DAA57;
    dw $6146,$8020                                                       ;8DAA58;
    db $18                                                               ;8DAA5C;
    dw $6144,$81F0                                                       ;8DAA5D;
    db $28                                                               ;8DAA61;
    dw $214E,$81E0                                                       ;8DAA62;
    db $28                                                               ;8DAA66;
    dw $214C,$81D0                                                       ;8DAA67;
    db $28                                                               ;8DAA6B;
    dw $214A,$81F0                                                       ;8DAA6C;
    db $18                                                               ;8DAA70;
    dw $2148,$81E0                                                       ;8DAA71;
    db $18                                                               ;8DAA75;
    dw $2146,$81D0                                                       ;8DAA76;
    db $18                                                               ;8DAA7A;
    dw $2144,$8000                                                       ;8DAA7B;
    db $D8                                                               ;8DAA7F;
    dw $6124,$8010                                                       ;8DAA80;
    db $D8                                                               ;8DAA84;
    dw $6122,$8020                                                       ;8DAA85;
    db $D8                                                               ;8DAA89;
    dw $6120,$8000                                                       ;8DAA8A;
    db $C8                                                               ;8DAA8E;
    dw $6104,$8010                                                       ;8DAA8F;
    db $C8                                                               ;8DAA93;
    dw $6102,$8020                                                       ;8DAA94;
    db $C8                                                               ;8DAA98;
    dw $6100,$81F0                                                       ;8DAA99;
    db $D8                                                               ;8DAA9D;
    dw $2124,$81E0                                                       ;8DAA9E;
    db $D8                                                               ;8DAAA2;
    dw $2122,$81D0                                                       ;8DAAA3;
    db $D8                                                               ;8DAAA7;
    dw $2120,$81F0                                                       ;8DAAA8;
    db $C8                                                               ;8DAAAC;
    dw $2104,$81E0                                                       ;8DAAAD;
    db $C8                                                               ;8DAAB1;
    dw $2102,$81D0                                                       ;8DAAB2;
    db $C8                                                               ;8DAAB6;
    dw $2100                                                             ;8DAAB7;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Namihe_Fune_Fireball_0:
    dw $0001,$81F8                                                       ;8DAAB9;
    db $F8                                                               ;8DAABD;
    dw $210A                                                             ;8DAABE;

EnemyProjSpritemaps_Namihe_Fune_Fireball_1:
    dw $0001,$81F8                                                       ;8DAAC0;
    db $F8                                                               ;8DAAC4;
    dw $210C                                                             ;8DAAC5;

EnemyProjSpritemaps_Namihe_Fune_Fireball_2:
    dw $0001,$81F8                                                       ;8DAAC7;
    db $F8                                                               ;8DAACB;
    dw $210E                                                             ;8DAACC;

EnemyProjSpritemaps_Namihe_Fune_Fireball_3:
    dw $0001,$81F8                                                       ;8DAACE;
    db $F8                                                               ;8DAAD2;
    dw $610A                                                             ;8DAAD3;

EnemyProjSpritemaps_Namihe_Fune_Fireball_4:
    dw $0001,$81F8                                                       ;8DAAD5;
    db $F8                                                               ;8DAAD9;
    dw $610C                                                             ;8DAADA;

EnemyProjSpritemaps_Namihe_Fune_Fireball_5:
    dw $0001,$81F8                                                       ;8DAADC;
    db $F8                                                               ;8DAAE0;
    dw $610E                                                             ;8DAAE1;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DAAE3:
    dw $0004,$01F8                                                       ;8DAAE3;
    db $00                                                               ;8DAAE7;
    dw $612F,$0000                                                       ;8DAAE8;
    db $00                                                               ;8DAAEC;
    dw $612E,$01F8                                                       ;8DAAED;
    db $F8                                                               ;8DAAF1;
    dw $612D,$0000                                                       ;8DAAF2;
    db $F8                                                               ;8DAAF6;
    dw $612C                                                             ;8DAAF7;

UNUSED_EnemyProjSpritemaps_1_8DAAF9:
    dw $0004,$0000                                                       ;8DAAF9;
    db $00                                                               ;8DAAFD;
    dw $212F,$01F8                                                       ;8DAAFE;
    db $00                                                               ;8DAB02;
    dw $212E,$0000                                                       ;8DAB03;
    db $F8                                                               ;8DAB07;
    dw $212D,$01F8                                                       ;8DAB08;
    db $F8                                                               ;8DAB0C;
    dw $212C                                                             ;8DAB0D;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_MagdolliteFlame_0:
    dw $0004,$0000                                                       ;8DAB0F;
    db $00                                                               ;8DAB13;
    dw $212F,$01F8                                                       ;8DAB14;
    db $00                                                               ;8DAB18;
    dw $212E,$0000                                                       ;8DAB19;
    db $F8                                                               ;8DAB1D;
    dw $212D,$01F8                                                       ;8DAB1E;
    db $F8                                                               ;8DAB22;
    dw $212C                                                             ;8DAB23;

EnemyProjSpritemaps_MagdolliteFlame_1:
    dw $0004,$01F8                                                       ;8DAB25;
    db $00                                                               ;8DAB29;
    dw $612F,$0000                                                       ;8DAB2A;
    db $00                                                               ;8DAB2E;
    dw $612E,$01F8                                                       ;8DAB2F;
    db $F8                                                               ;8DAB33;
    dw $612D,$0000                                                       ;8DAB34;
    db $F8                                                               ;8DAB38;
    dw $612C                                                             ;8DAB39;

EnemyProjSpritemaps_DustCloud_Explosion_0:
    dw $0004,$0000                                                       ;8DAB3B;
    db $F8                                                               ;8DAB3F;
    dw $7A2B,$0000                                                       ;8DAB40;
    db $00                                                               ;8DAB44;
    dw $7A2B,$01F8                                                       ;8DAB45;
    db $00                                                               ;8DAB49;
    dw $3A2B,$01F8                                                       ;8DAB4A;
    db $F8                                                               ;8DAB4E;
    dw $3A2B                                                             ;8DAB4F;

EnemyProjSpritemaps_DustCloud_Explosion_1:
    dw $0004,$0002                                                       ;8DAB51;
    db $F3                                                               ;8DAB55;
    dw $7A2B,$0001                                                       ;8DAB56;
    db $FF                                                               ;8DAB5A;
    dw $7A2B,$01F7                                                       ;8DAB5B;
    db $FF                                                               ;8DAB5F;
    dw $3A2B,$01F6                                                       ;8DAB60;
    db $F3                                                               ;8DAB64;
    dw $3A2B                                                             ;8DAB65;

EnemyProjSpritemaps_DustCloud_Explosion_2:
    dw $0004,$0005                                                       ;8DAB67;
    db $EE                                                               ;8DAB6B;
    dw $7A2B,$0003                                                       ;8DAB6C;
    db $FD                                                               ;8DAB70;
    dw $7A2B,$01F5                                                       ;8DAB71;
    db $FD                                                               ;8DAB75;
    dw $3A2B,$01F3                                                       ;8DAB76;
    db $EE                                                               ;8DAB7A;
    dw $3A2B                                                             ;8DAB7B;

EnemyProjSpritemaps_DustCloud_Explosion_3:
    dw $0004,$0007                                                       ;8DAB7D;
    db $EC                                                               ;8DAB81;
    dw $7A2B,$0005                                                       ;8DAB82;
    db $FB                                                               ;8DAB86;
    dw $7A2B,$01F3                                                       ;8DAB87;
    db $FB                                                               ;8DAB8B;
    dw $3A2B,$01F1                                                       ;8DAB8C;
    db $EC                                                               ;8DAB90;
    dw $3A2B                                                             ;8DAB91;

EnemyProjSpritemaps_DustCloud_Explosion_4:
    dw $0004,$0009                                                       ;8DAB93;
    db $EA                                                               ;8DAB97;
    dw $7A2B,$0007                                                       ;8DAB98;
    db $FA                                                               ;8DAB9C;
    dw $7A2B,$01F1                                                       ;8DAB9D;
    db $FA                                                               ;8DABA1;
    dw $3A2B,$01EF                                                       ;8DABA2;
    db $EA                                                               ;8DABA6;
    dw $3A2B                                                             ;8DABA7;

EnemyProjSpritemaps_DustCloud_Explosion_5:
    dw $0004,$000A                                                       ;8DABA9;
    db $EA                                                               ;8DABAD;
    dw $7A2B,$0008                                                       ;8DABAE;
    db $F9                                                               ;8DABB2;
    dw $7A2B,$01F0                                                       ;8DABB3;
    db $F9                                                               ;8DABB7;
    dw $3A2B,$01EE                                                       ;8DABB8;
    db $EA                                                               ;8DABBC;
    dw $3A2B                                                             ;8DABBD;

EnemyProjSpritemaps_DustCloud_Explosion_6:
    dw $0004,$000C                                                       ;8DABBF;
    db $EB                                                               ;8DABC3;
    dw $7A2A,$0009                                                       ;8DABC4;
    db $FA                                                               ;8DABC8;
    dw $7A2A,$01EF                                                       ;8DABC9;
    db $FA                                                               ;8DABCD;
    dw $3A2A,$01EC                                                       ;8DABCE;
    db $EB                                                               ;8DABD2;
    dw $3A2A                                                             ;8DABD3;

EnemyProjSpritemaps_DustCloud_Explosion_7:
    dw $0004,$000E                                                       ;8DABD5;
    db $EC                                                               ;8DABD9;
    dw $7A2A,$000A                                                       ;8DABDA;
    db $FC                                                               ;8DABDE;
    dw $7A2A,$01EE                                                       ;8DABDF;
    db $FC                                                               ;8DABE3;
    dw $3A2A,$01EA                                                       ;8DABE4;
    db $EC                                                               ;8DABE8;
    dw $3A2A                                                             ;8DABE9;

EnemyProjSpritemaps_DustCloud_Explosion_8:
    dw $0004,$0010                                                       ;8DABEB;
    db $ED                                                               ;8DABEF;
    dw $7A29,$000B                                                       ;8DABF0;
    db $FE                                                               ;8DABF4;
    dw $7A29,$01ED                                                       ;8DABF5;
    db $FE                                                               ;8DABF9;
    dw $3A29,$01E8                                                       ;8DABFA;
    db $ED                                                               ;8DABFE;
    dw $3A29                                                             ;8DABFF;

EnemyProjSpritemaps_DustCloud_Explosion_9:
    dw $0004,$0012                                                       ;8DAC01;
    db $EE                                                               ;8DAC05;
    dw $7A29,$000C                                                       ;8DAC06;
    db $00                                                               ;8DAC0A;
    dw $7A29,$01EC                                                       ;8DAC0B;
    db $00                                                               ;8DAC0F;
    dw $3A29,$01E6                                                       ;8DAC10;
    db $EE                                                               ;8DAC14;
    dw $3A29                                                             ;8DAC15;

EnemyProjSpritemaps_DustCloud_Explosion_A:
    dw $0004,$0013                                                       ;8DAC17;
    db $F0                                                               ;8DAC1B;
    dw $7A28,$000D                                                       ;8DAC1C;
    db $02                                                               ;8DAC20;
    dw $7A28,$01E5                                                       ;8DAC21;
    db $F0                                                               ;8DAC25;
    dw $3A28,$01EB                                                       ;8DAC26;
    db $02                                                               ;8DAC2A;
    dw $3A28                                                             ;8DAC2B;

EnemyProjSpritemaps_DustCloud_Explosion_B:
    dw $0004,$0014                                                       ;8DAC2D;
    db $F2                                                               ;8DAC31;
    dw $7A28,$000E                                                       ;8DAC32;
    db $04                                                               ;8DAC36;
    dw $7A28,$01E4                                                       ;8DAC37;
    db $F2                                                               ;8DAC3B;
    dw $3A28,$01EA                                                       ;8DAC3C;
    db $04                                                               ;8DAC40;
    dw $3A28                                                             ;8DAC41;

EnemyProjSpritemaps_DustCloud_Explosion_C:
    dw $0004,$0015                                                       ;8DAC43;
    db $F5                                                               ;8DAC47;
    dw $7A28,$000F                                                       ;8DAC48;
    db $07                                                               ;8DAC4C;
    dw $7A28,$01E3                                                       ;8DAC4D;
    db $F5                                                               ;8DAC51;
    dw $3A28,$01E9                                                       ;8DAC52;
    db $07                                                               ;8DAC56;
    dw $3A28                                                             ;8DAC57;

EnemyProjSpritemaps_DustCloud_Explosion_D:
    dw $0004,$0016                                                       ;8DAC59;
    db $F9                                                               ;8DAC5D;
    dw $7A28,$0010                                                       ;8DAC5E;
    db $0B                                                               ;8DAC62;
    dw $7A28,$01E2                                                       ;8DAC63;
    db $F9                                                               ;8DAC67;
    dw $3A28,$01E8                                                       ;8DAC68;
    db $0B                                                               ;8DAC6C;
    dw $3A28                                                             ;8DAC6D;

EnemyProjSpritemaps_DustCloud_Explosion_E:
    dw $0004,$0017                                                       ;8DAC6F;
    db $03                                                               ;8DAC73;
    dw $7A28,$0011                                                       ;8DAC74;
    db $11                                                               ;8DAC78;
    dw $7A28,$01E1                                                       ;8DAC79;
    db $03                                                               ;8DAC7D;
    dw $3A28,$01E7                                                       ;8DAC7E;
    db $11                                                               ;8DAC82;
    dw $3A28                                                             ;8DAC83;

EnemyProjSpritemaps_DustCloud_Explosion_F:
    dw $0004,$0018                                                       ;8DAC85;
    db $0A                                                               ;8DAC89;
    dw $7A28,$0012                                                       ;8DAC8A;
    db $18                                                               ;8DAC8E;
    dw $7A28,$01E0                                                       ;8DAC8F;
    db $0A                                                               ;8DAC93;
    dw $3A28,$01E6                                                       ;8DAC94;
    db $18                                                               ;8DAC98;
    dw $3A28                                                             ;8DAC99;

EnemyProjSpritemaps_Common_BigDustCloud_0:
    dw $0001,$01F7                                                       ;8DAC9B;
    db $F7                                                               ;8DAC9F;
    dw $3A48                                                             ;8DACA0;

EnemyProjSpritemaps_Common_BigDustCloud_1:
    dw $0002,$0001                                                       ;8DACA2;
    db $01                                                               ;8DACA6;
    dw $3A48,$81F3                                                       ;8DACA7;
    db $F3                                                               ;8DACAB;
    dw $3A7C                                                             ;8DACAC;

EnemyProjSpritemaps_Common_BigDustCloud_2:
    dw $0003,$81FD                                                       ;8DACAE;
    db $FD                                                               ;8DACB2;
    dw $3A7C,$01F7                                                       ;8DACB3;
    db $01                                                               ;8DACB7;
    dw $3A48,$81F3                                                       ;8DACB8;
    db $F3                                                               ;8DACBC;
    dw $3A7E                                                             ;8DACBD;

EnemyProjSpritemaps_Common_BigDustCloud_3:
    dw $0004,$0001                                                       ;8DACBF;
    db $F7                                                               ;8DACC3;
    dw $3A48,$81FD                                                       ;8DACC4;
    db $FD                                                               ;8DACC8;
    dw $3A7E,$81F3                                                       ;8DACC9;
    db $FD                                                               ;8DACCD;
    dw $3A7C,$81F3                                                       ;8DACCE;
    db $F3                                                               ;8DACD2;
    dw $3A9A                                                             ;8DACD3;

EnemyProjSpritemaps_DustCloud_Explosion_10:
    dw $0004,$81FD                                                       ;8DACD5;
    db $F3                                                               ;8DACD9;
    dw $3A7C,$81FD                                                       ;8DACDA;
    db $FD                                                               ;8DACDE;
    dw $3A9A,$81F3                                                       ;8DACDF;
    db $FD                                                               ;8DACE3;
    dw $3A7E,$81F3                                                       ;8DACE4;
    db $F3                                                               ;8DACE8;
    dw $3A9C                                                             ;8DACE9;

EnemyProjSpritemaps_DustCloud_Explosion_11:
    dw $0003,$81FD                                                       ;8DACEB;
    db $F3                                                               ;8DACEF;
    dw $3A7E,$81FD                                                       ;8DACF0;
    db $FD                                                               ;8DACF4;
    dw $3A9C,$81F3                                                       ;8DACF5;
    db $FD                                                               ;8DACF9;
    dw $3A9A                                                             ;8DACFA;

EnemyProjSpritemaps_DustCloud_Explosion_12:
    dw $0002,$81FD                                                       ;8DACFC;
    db $F3                                                               ;8DAD00;
    dw $3A9A,$81F3                                                       ;8DAD01;
    db $FD                                                               ;8DAD05;
    dw $3A9C                                                             ;8DAD06;

EnemyProjSpritemaps_DustCloud_Explosion_13:
    dw $0001,$81FD                                                       ;8DAD08;
    db $F3                                                               ;8DAD0C;
    dw $3A9C                                                             ;8DAD0D;

EnemyProjSpritemaps_DustCloud_Explosion_14:
    dw $0001,$01FC                                                       ;8DAD0F;
    db $FC                                                               ;8DAD13;
    dw $3A6B                                                             ;8DAD14;

EnemyProjSpritemaps_DustCloud_Explosion_15:
    dw $0001,$01FC                                                       ;8DAD16;
    db $FC                                                               ;8DAD1A;
    dw $3A6C                                                             ;8DAD1B;

EnemyProjSpritemaps_DustCloud_Explosion_16:
    dw $0002,$01F8                                                       ;8DAD1D;
    db $FC                                                               ;8DAD21;
    dw $3A6B,$0000                                                       ;8DAD22;
    db $FC                                                               ;8DAD26;
    dw $3A6B                                                             ;8DAD27;

EnemyProjSpritemaps_DustCloud_Explosion_17:
    dw $0002,$01F8                                                       ;8DAD29;
    db $FC                                                               ;8DAD2D;
    dw $3A6C,$0000                                                       ;8DAD2E;
    db $FC                                                               ;8DAD32;
    dw $3A6C                                                             ;8DAD33;

EnemyProjSpritemaps_DustCloud_Explosion_18:
    dw $0003,$01F4                                                       ;8DAD35;
    db $FC                                                               ;8DAD39;
    dw $3A6C,$0004                                                       ;8DAD3A;
    db $FC                                                               ;8DAD3E;
    dw $3A6C,$01FC                                                       ;8DAD3F;
    db $FC                                                               ;8DAD43;
    dw $3A6C                                                             ;8DAD44;

EnemyProjSpritemaps_DustCloud_Explosion_19:
    dw $0003,$0004                                                       ;8DAD46;
    db $FC                                                               ;8DAD4A;
    dw $3A6B,$01F4                                                       ;8DAD4B;
    db $FC                                                               ;8DAD4F;
    dw $3A6B,$01FC                                                       ;8DAD50;
    db $FC                                                               ;8DAD54;
    dw $3A6B                                                             ;8DAD55;

EnemyProjSpritemaps_DustCloud_Explosion_1A:
    dw $0004,$0008                                                       ;8DAD57;
    db $FC                                                               ;8DAD5B;
    dw $3A6C,$0000                                                       ;8DAD5C;
    db $FC                                                               ;8DAD60;
    dw $3A6C,$01F8                                                       ;8DAD61;
    db $FC                                                               ;8DAD65;
    dw $3A6C,$01F0                                                       ;8DAD66;
    db $FC                                                               ;8DAD6A;
    dw $3A6C                                                             ;8DAD6B;

EnemyProjSpritemaps_DustCloud_Explosion_1B:
    dw $0004,$0008                                                       ;8DAD6D;
    db $FC                                                               ;8DAD71;
    dw $3A6B,$0000                                                       ;8DAD72;
    db $FC                                                               ;8DAD76;
    dw $3A6B,$01F8                                                       ;8DAD77;
    db $FC                                                               ;8DAD7B;
    dw $3A6B,$01F0                                                       ;8DAD7C;
    db $FC                                                               ;8DAD80;
    dw $3A6B                                                             ;8DAD81;

EnemyProjSpritemaps_DustCloud_Explosion_1C:
    dw $0001,$01FC                                                       ;8DAD83;
    db $FC                                                               ;8DAD87;
    dw $3A25                                                             ;8DAD88;

EnemyProjSpritemaps_DustCloud_Explosion_1D:
    dw $0003,$0000                                                       ;8DAD8A;
    db $F8                                                               ;8DAD8E;
    dw $3A25,$01FA                                                       ;8DAD8F;
    db $F6                                                               ;8DAD93;
    dw $3A25,$01FC                                                       ;8DAD94;
    db $FB                                                               ;8DAD98;
    dw $3A25                                                             ;8DAD99;

EnemyProjSpritemaps_DustCloud_Explosion_1E:
    dw $0003,$0001                                                       ;8DAD9B;
    db $F7                                                               ;8DAD9F;
    dw $3A25,$01F9                                                       ;8DADA0;
    db $F4                                                               ;8DADA4;
    dw $3A25,$01FB                                                       ;8DADA5;
    db $FA                                                               ;8DADA9;
    dw $3A25                                                             ;8DADAA;

EnemyProjSpritemaps_DustCloud_Explosion_1F:
    dw $0003,$0001                                                       ;8DADAC;
    db $F5                                                               ;8DADB0;
    dw $3A43,$01FC                                                       ;8DADB1;
    db $F8                                                               ;8DADB5;
    dw $3A43,$01FA                                                       ;8DADB6;
    db $F1                                                               ;8DADBA;
    dw $3A43                                                             ;8DADBB;

EnemyProjSpritemaps_DustCloud_Explosion_20:
    dw $0003,$0001                                                       ;8DADBD;
    db $F3                                                               ;8DADC1;
    dw $3A43,$01FC                                                       ;8DADC2;
    db $F5                                                               ;8DADC6;
    dw $3A43,$01FA                                                       ;8DADC7;
    db $EE                                                               ;8DADCB;
    dw $3A43                                                             ;8DADCC;

EnemyProjSpritemaps_DustCloud_Explosion_21:
    dw $0003,$0000                                                       ;8DADCE;
    db $F0                                                               ;8DADD2;
    dw $3A40,$01FC                                                       ;8DADD3;
    db $F4                                                               ;8DADD7;
    dw $3A40,$01FA                                                       ;8DADD8;
    db $ED                                                               ;8DADDC;
    dw $3A40                                                             ;8DADDD;

EnemyProjSpritemaps_DustCloud_Explosion_22:
    dw $0003,$0000                                                       ;8DADDF;
    db $EE                                                               ;8DADE3;
    dw $3A40,$01FC                                                       ;8DADE4;
    db $F2                                                               ;8DADE8;
    dw $3A40,$01FA                                                       ;8DADE9;
    db $EC                                                               ;8DADED;
    dw $3A40                                                             ;8DADEE;

EnemyProjSpritemaps_DustCloud_Explosion_23:
    dw $0002,$0000                                                       ;8DADF0;
    db $EC                                                               ;8DADF4;
    dw $3A40,$01FC                                                       ;8DADF5;
    db $F0                                                               ;8DADF9;
    dw $3A40                                                             ;8DADFA;

EnemyProjSpritemaps_DustCloud_Explosion_24:
    dw $0001,$01FC                                                       ;8DADFC;
    db $EE                                                               ;8DAE00;
    dw $3A40                                                             ;8DAE01;

EnemyProjSpritemaps_DustCloud_Explosion_25:
    dw $0004,$0008                                                       ;8DAE03;
    db $E0                                                               ;8DAE07;
    dw $3A6F,$0000                                                       ;8DAE08;
    db $E0                                                               ;8DAE0C;
    dw $3A6F,$01F8                                                       ;8DAE0D;
    db $E0                                                               ;8DAE11;
    dw $3A6F,$01F0                                                       ;8DAE12;
    db $E0                                                               ;8DAE16;
    dw $3A6F                                                             ;8DAE17;

EnemyProjSpritemaps_DustCloud_Explosion_26:
    dw $0004,$0008                                                       ;8DAE19;
    db $E8                                                               ;8DAE1D;
    dw $3A6F,$0000                                                       ;8DAE1E;
    db $E8                                                               ;8DAE22;
    dw $3A6F,$01F8                                                       ;8DAE23;
    db $E8                                                               ;8DAE27;
    dw $3A6F,$01F0                                                       ;8DAE28;
    db $E8                                                               ;8DAE2C;
    dw $3A6F                                                             ;8DAE2D;

EnemyProjSpritemaps_DustCloud_Explosion_27:
    dw $0004,$0008                                                       ;8DAE2F;
    db $F0                                                               ;8DAE33;
    dw $3A6F,$0000                                                       ;8DAE34;
    db $F0                                                               ;8DAE38;
    dw $3A6F,$01F8                                                       ;8DAE39;
    db $F0                                                               ;8DAE3D;
    dw $3A6F,$01F0                                                       ;8DAE3E;
    db $F0                                                               ;8DAE42;
    dw $3A6F                                                             ;8DAE43;

EnemyProjSpritemaps_DustCloud_Explosion_28:
    dw $0004,$0008                                                       ;8DAE45;
    db $F8                                                               ;8DAE49;
    dw $3A6F,$0000                                                       ;8DAE4A;
    db $F8                                                               ;8DAE4E;
    dw $3A6F,$01F8                                                       ;8DAE4F;
    db $F8                                                               ;8DAE53;
    dw $3A6F,$01F0                                                       ;8DAE54;
    db $F8                                                               ;8DAE58;
    dw $3A6F                                                             ;8DAE59;

EnemyProjSpritemaps_DustCloud_Explosion_29:
    dw $0004,$0008                                                       ;8DAE5B;
    db $00                                                               ;8DAE5F;
    dw $3A6F,$0000                                                       ;8DAE60;
    db $00                                                               ;8DAE64;
    dw $3A6F,$01F8                                                       ;8DAE65;
    db $00                                                               ;8DAE69;
    dw $3A6F,$01F0                                                       ;8DAE6A;
    db $00                                                               ;8DAE6E;
    dw $3A6F                                                             ;8DAE6F;

EnemyProjSpritemaps_DustCloud_Explosion_2A:
    dw $0004,$0008                                                       ;8DAE71;
    db $08                                                               ;8DAE75;
    dw $3A6F,$0000                                                       ;8DAE76;
    db $08                                                               ;8DAE7A;
    dw $3A6F,$01F8                                                       ;8DAE7B;
    db $08                                                               ;8DAE7F;
    dw $3A6F,$01F0                                                       ;8DAE80;
    db $08                                                               ;8DAE84;
    dw $3A6F                                                             ;8DAE85;

EnemyProjSpritemaps_DustCloud_Explosion_2B:
    dw $0004,$0008                                                       ;8DAE87;
    db $10                                                               ;8DAE8B;
    dw $3A6F,$0000                                                       ;8DAE8C;
    db $10                                                               ;8DAE90;
    dw $3A6F,$01F8                                                       ;8DAE91;
    db $10                                                               ;8DAE95;
    dw $3A6F,$01F0                                                       ;8DAE96;
    db $10                                                               ;8DAE9A;
    dw $3A6F                                                             ;8DAE9B;

EnemyProjSpritemaps_DustCloud_Explosion_2C:
    dw $0004,$0008                                                       ;8DAE9D;
    db $18                                                               ;8DAEA1;
    dw $3A6F,$0000                                                       ;8DAEA2;
    db $18                                                               ;8DAEA6;
    dw $3A6F,$01F8                                                       ;8DAEA7;
    db $18                                                               ;8DAEAB;
    dw $3A6F,$01F0                                                       ;8DAEAC;
    db $18                                                               ;8DAEB0;
    dw $3A6F                                                             ;8DAEB1;

EnemyProjSpritemaps_DustCloud_Explosion_2D:
    dw $0002,$0000                                                       ;8DAEB3;
    db $FC                                                               ;8DAEB7;
    dw $3ABF,$01F8                                                       ;8DAEB8;
    db $FC                                                               ;8DAEBC;
    dw $3ABE                                                             ;8DAEBD;

EnemyProjSpritemaps_DustCloud_Explosion_2E:
    dw $0001,$81F8                                                       ;8DAEBF;
    db $F8                                                               ;8DAEC3;
    dw $3ABE                                                             ;8DAEC4;

EnemyProjSpritemaps_DustCloud_Explosion_2F:
    dw $0002,$81F8                                                       ;8DAEC6;
    db $FC                                                               ;8DAECA;
    dw $3ABE,$81F8                                                       ;8DAECB;
    db $F4                                                               ;8DAECF;
    dw $3ABE                                                             ;8DAED0;

EnemyProjSpritemaps_DustCloud_Explosion_30:
    dw $0002,$81F8                                                       ;8DAED2;
    db $00                                                               ;8DAED6;
    dw $3ABE,$81F8                                                       ;8DAED7;
    db $F0                                                               ;8DAEDB;
    dw $3ABE                                                             ;8DAEDC;

EnemyProjSpritemaps_DustCloud_Explosion_31:
    dw $0003,$81F8                                                       ;8DAEDE;
    db $04                                                               ;8DAEE2;
    dw $3ABE,$81F8                                                       ;8DAEE3;
    db $F8                                                               ;8DAEE7;
    dw $3ABE,$81F8                                                       ;8DAEE8;
    db $EC                                                               ;8DAEEC;
    dw $3ABE                                                             ;8DAEED;

EnemyProjSpritemaps_DustCloud_Explosion_32:
    dw $0003,$81F8                                                       ;8DAEEF;
    db $08                                                               ;8DAEF3;
    dw $3ABE,$81F8                                                       ;8DAEF4;
    db $F8                                                               ;8DAEF8;
    dw $3ABE,$81F8                                                       ;8DAEF9;
    db $E8                                                               ;8DAEFD;
    dw $3ABE                                                             ;8DAEFE;

EnemyProjSpritemaps_DustCloud_Explosion_33:
    dw $0004,$81F8                                                       ;8DAF00;
    db $0C                                                               ;8DAF04;
    dw $3ABE,$81F8                                                       ;8DAF05;
    db $00                                                               ;8DAF09;
    dw $3ABE,$81F8                                                       ;8DAF0A;
    db $F0                                                               ;8DAF0E;
    dw $3ABE,$81F8                                                       ;8DAF0F;
    db $E4                                                               ;8DAF13;
    dw $3ABE                                                             ;8DAF14;

EnemyProjSpritemaps_DustCloud_Explosion_34:
    dw $0004,$81F8                                                       ;8DAF16;
    db $10                                                               ;8DAF1A;
    dw $3ABE,$81F8                                                       ;8DAF1B;
    db $00                                                               ;8DAF1F;
    dw $3ABE,$81F8                                                       ;8DAF20;
    db $F0                                                               ;8DAF24;
    dw $3ABE,$81F8                                                       ;8DAF25;
    db $E0                                                               ;8DAF29;
    dw $3ABE                                                             ;8DAF2A;

EnemyProjSpritemaps_DustCloud_Explosion_35:
    dw $0001,$01FC                                                       ;8DAF2C;
    db $FC                                                               ;8DAF30;
    dw $3C53                                                             ;8DAF31;

EnemyProjSpritemaps_DustCloud_Explosion_36:
    dw $0001,$01FC                                                       ;8DAF33;
    db $FC                                                               ;8DAF37;
    dw $3C52                                                             ;8DAF38;

EnemyProjSpritemaps_DustCloud_Explosion_37:
    dw $0001,$01FC                                                       ;8DAF3A;
    db $FC                                                               ;8DAF3E;
    dw $3C51                                                             ;8DAF3F;

EnemyProjSpritemaps_DustCloud_Explosion_38:
    dw $0004,$01F8                                                       ;8DAF41;
    db $00                                                               ;8DAF45;
    dw $BC50,$0000                                                       ;8DAF46;
    db $00                                                               ;8DAF4A;
    dw $FC50,$0000                                                       ;8DAF4B;
    db $F8                                                               ;8DAF4F;
    dw $7C50,$01F8                                                       ;8DAF50;
    db $F8                                                               ;8DAF54;
    dw $3C50                                                             ;8DAF55;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_0:
    dw $0003,$0000                                                       ;8DAF57;
    db $0C                                                               ;8DAF5B;
    dw $3A5B,$0008                                                       ;8DAF5C;
    db $EC                                                               ;8DAF60;
    dw $3A5B,$01F0                                                       ;8DAF61;
    db $F4                                                               ;8DAF65;
    dw $3A5B                                                             ;8DAF66;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_1:
    dw $0003,$01FD                                                       ;8DAF68;
    db $0A                                                               ;8DAF6C;
    dw $3A5C,$0006                                                       ;8DAF6D;
    db $EE                                                               ;8DAF71;
    dw $3A5C,$01F2                                                       ;8DAF72;
    db $F6                                                               ;8DAF76;
    dw $3A5C                                                             ;8DAF77;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_2:
    dw $0003,$01FC                                                       ;8DAF79;
    db $08                                                               ;8DAF7D;
    dw $3A5C,$0004                                                       ;8DAF7E;
    db $F0                                                               ;8DAF82;
    dw $3A5C,$01F4                                                       ;8DAF83;
    db $F8                                                               ;8DAF87;
    dw $3A5C                                                             ;8DAF88;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_3:
    dw $0003,$0002                                                       ;8DAF8A;
    db $F2                                                               ;8DAF8E;
    dw $3A5D,$01FB                                                       ;8DAF8F;
    db $06                                                               ;8DAF93;
    dw $3A5D,$01F6                                                       ;8DAF94;
    db $FA                                                               ;8DAF98;
    dw $3A5D                                                             ;8DAF99;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_4:
    dw $0003,$01FB                                                       ;8DAF9B;
    db $04                                                               ;8DAF9F;
    dw $3A5D,$01F8                                                       ;8DAFA0;
    db $FB                                                               ;8DAFA4;
    dw $3A5D,$0000                                                       ;8DAFA5;
    db $F4                                                               ;8DAFA9;
    dw $3A5D                                                             ;8DAFAA;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_5:
    dw $0003,$01FB                                                       ;8DAFAC;
    db $02                                                               ;8DAFB0;
    dw $3A5D,$01FA                                                       ;8DAFB1;
    db $FA                                                               ;8DAFB5;
    dw $3A5D,$0000                                                       ;8DAFB6;
    db $F6                                                               ;8DAFBA;
    dw $3A5D                                                             ;8DAFBB;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_6:
    dw $0003,$0000                                                       ;8DAFBD;
    db $EC                                                               ;8DAFC1;
    dw $BA5B,$0008                                                       ;8DAFC2;
    db $0C                                                               ;8DAFC6;
    dw $BA5B,$01F0                                                       ;8DAFC7;
    db $04                                                               ;8DAFCB;
    dw $BA5B                                                             ;8DAFCC;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_7:
    dw $0003,$01FE                                                       ;8DAFCE;
    db $EE                                                               ;8DAFD2;
    dw $BA5C,$0006                                                       ;8DAFD3;
    db $0A                                                               ;8DAFD7;
    dw $BA5C,$01F2                                                       ;8DAFD8;
    db $02                                                               ;8DAFDC;
    dw $BA5C                                                             ;8DAFDD;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_8:
    dw $0003,$0004                                                       ;8DAFDF;
    db $08                                                               ;8DAFE3;
    dw $BA5C,$01F4                                                       ;8DAFE4;
    db $00                                                               ;8DAFE8;
    dw $BA5C,$01FD                                                       ;8DAFE9;
    db $F0                                                               ;8DAFED;
    dw $BA5C                                                             ;8DAFEE;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_9:
    dw $0003,$0002                                                       ;8DAFF0;
    db $06                                                               ;8DAFF4;
    dw $BA5D,$01FC                                                       ;8DAFF5;
    db $F2                                                               ;8DAFF9;
    dw $BA5D,$01F6                                                       ;8DAFFA;
    db $FE                                                               ;8DAFFE;
    dw $BA5D                                                             ;8DAFFF;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_A:
    dw $0003,$01FC                                                       ;8DB001;
    db $F4                                                               ;8DB005;
    dw $BA5D,$01F8                                                       ;8DB006;
    db $FC                                                               ;8DB00A;
    dw $BA5D,$0000                                                       ;8DB00B;
    db $04                                                               ;8DB00F;
    dw $BA5D                                                             ;8DB010;

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_B:
    dw $0003,$01FC                                                       ;8DB012;
    db $F6                                                               ;8DB016;
    dw $BA5D,$01FA                                                       ;8DB017;
    db $FD                                                               ;8DB01B;
    dw $BA5D,$0000                                                       ;8DB01C;
    db $02                                                               ;8DB020;
    dw $BA5D                                                             ;8DB021;

EnemyProjSpritemaps_Common_SmallExplosion_0:
    dw $0001,$01FC                                                       ;8DB023;
    db $FC                                                               ;8DB027;
    dw $3A5F                                                             ;8DB028;

EnemyProjSpritemaps_Common_SmallExplosion_1:
    dw $0004,$0000                                                       ;8DB02A;
    db $00                                                               ;8DB02E;
    dw $FA8A,$01F8                                                       ;8DB02F;
    db $00                                                               ;8DB033;
    dw $BA8A,$0000                                                       ;8DB034;
    db $F8                                                               ;8DB038;
    dw $7A8A,$01F8                                                       ;8DB039;
    db $F8                                                               ;8DB03D;
    dw $3A8A                                                             ;8DB03E;

EnemyProjSpritemaps_Common_SmallExplosion_2:
    dw $0004,$8000                                                       ;8DB040;
    db $00                                                               ;8DB044;
    dw $FA90,$81F0                                                       ;8DB045;
    db $00                                                               ;8DB049;
    dw $BA90,$8000                                                       ;8DB04A;
    db $F0                                                               ;8DB04E;
    dw $7A90,$81F0                                                       ;8DB04F;
    db $F0                                                               ;8DB053;
    dw $3A90                                                             ;8DB054;

EnemyProjSpritemaps_Common_SmallExplosion_3:
    dw $0004,$8000                                                       ;8DB056;
    db $00                                                               ;8DB05A;
    dw $FA92,$81F0                                                       ;8DB05B;
    db $00                                                               ;8DB05F;
    dw $BA92,$8000                                                       ;8DB060;
    db $F0                                                               ;8DB064;
    dw $7A92,$81F0                                                       ;8DB065;
    db $F0                                                               ;8DB069;
    dw $3A92                                                             ;8DB06A;

EnemyProjSpritemaps_Common_SmallExplosion_4:
    dw $0004,$8000                                                       ;8DB06C;
    db $00                                                               ;8DB070;
    dw $FA94,$81F0                                                       ;8DB071;
    db $00                                                               ;8DB075;
    dw $BA94,$8000                                                       ;8DB076;
    db $F0                                                               ;8DB07A;
    dw $7A94,$81F0                                                       ;8DB07B;
    db $F0                                                               ;8DB07F;
    dw $3A94                                                             ;8DB080;

EnemyProjSpritemaps_Common_SmallExplosion_5:
    dw $0004,$8000                                                       ;8DB082;
    db $00                                                               ;8DB086;
    dw $FA96,$81F0                                                       ;8DB087;
    db $00                                                               ;8DB08B;
    dw $BA96,$8000                                                       ;8DB08C;
    db $F0                                                               ;8DB090;
    dw $7A96,$81F0                                                       ;8DB091;
    db $F0                                                               ;8DB095;
    dw $3A96                                                             ;8DB096;

EnemyProjSpritemaps_DustCloud_Explosion_39:
    dw $0004,$0000                                                       ;8DB098;
    db $00                                                               ;8DB09C;
    dw $FA8B,$01F8                                                       ;8DB09D;
    db $00                                                               ;8DB0A1;
    dw $BA8B,$0000                                                       ;8DB0A2;
    db $F8                                                               ;8DB0A6;
    dw $7A8B,$01F8                                                       ;8DB0A7;
    db $F8                                                               ;8DB0AB;
    dw $3A8B                                                             ;8DB0AC;

EnemyProjSpritemaps_DustCloud_Explosion_3A:
    dw $0004,$0000                                                       ;8DB0AE;
    db $00                                                               ;8DB0B2;
    dw $FA7A,$01F8                                                       ;8DB0B3;
    db $00                                                               ;8DB0B7;
    dw $BA7A,$0000                                                       ;8DB0B8;
    db $F8                                                               ;8DB0BC;
    dw $7A7A,$01F8                                                       ;8DB0BD;
    db $F8                                                               ;8DB0C1;
    dw $3A7A                                                             ;8DB0C2;

EnemyProjSpritemaps_DustCloud_Explosion_3B:
    dw $0004,$8000                                                       ;8DB0C4;
    db $00                                                               ;8DB0C8;
    dw $FA70,$81F0                                                       ;8DB0C9;
    db $00                                                               ;8DB0CD;
    dw $BA70,$8000                                                       ;8DB0CE;
    db $F0                                                               ;8DB0D2;
    dw $7A70,$81F0                                                       ;8DB0D3;
    db $F0                                                               ;8DB0D7;
    dw $3A70                                                             ;8DB0D8;

EnemyProjSpritemaps_DustCloud_Explosion_3C:
    dw $0004,$8000                                                       ;8DB0DA;
    db $00                                                               ;8DB0DE;
    dw $FA72,$81F0                                                       ;8DB0DF;
    db $00                                                               ;8DB0E3;
    dw $BA72,$8000                                                       ;8DB0E4;
    db $F0                                                               ;8DB0E8;
    dw $7A72,$81F0                                                       ;8DB0E9;
    db $F0                                                               ;8DB0ED;
    dw $3A72                                                             ;8DB0EE;

EnemyProjSpritemaps_DustCloud_Explosion_3D:
    dw $0004,$8000                                                       ;8DB0F0;
    db $00                                                               ;8DB0F4;
    dw $FA74,$81F0                                                       ;8DB0F5;
    db $00                                                               ;8DB0F9;
    dw $BA74,$8000                                                       ;8DB0FA;
    db $F0                                                               ;8DB0FE;
    dw $7A74,$81F0                                                       ;8DB0FF;
    db $F0                                                               ;8DB103;
    dw $3A74                                                             ;8DB104;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8DB106:
    dw $0004,$01F8                                                       ;8DB106;
    db $00                                                               ;8DB10A;
    dw $3A5E,$0000                                                       ;8DB10B;
    db $00                                                               ;8DB10F;
    dw $3A5E,$0000                                                       ;8DB110;
    db $F8                                                               ;8DB114;
    dw $3A5E,$01F8                                                       ;8DB115;
    db $F8                                                               ;8DB119;
    dw $3A5E                                                             ;8DB11A;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DustCloud_Explosion_3E:
    dw $0001,$01FC                                                       ;8DB11C;
    db $FC                                                               ;8DB120;
    dw $3C38                                                             ;8DB121;

EnemyProjSpritemaps_DustCloud_Explosion_3F:
    dw $0001,$01FC                                                       ;8DB123;
    db $FC                                                               ;8DB127;
    dw $3C39                                                             ;8DB128;

EnemyProjSpritemaps_DustCloud_Explosion_40:
    dw $0001,$01FC                                                       ;8DB12A;
    db $FC                                                               ;8DB12E;
    dw $3C3A                                                             ;8DB12F;

EnemyProjSpritemaps_DustCloud_Explosion_41:
    dw $0001,$01FC                                                       ;8DB131;
    db $FC                                                               ;8DB135;
    dw $3C3B                                                             ;8DB136;

EnemyProjSpritemaps_DustCloud_Explosion_42:
    dw $0001,$01FC                                                       ;8DB138;
    db $FC                                                               ;8DB13C;
    dw $3A26                                                             ;8DB13D;

EnemyProjSpritemaps_DustCloud_Explosion_43:
    dw $0001,$01FC                                                       ;8DB13F;
    db $FC                                                               ;8DB143;
    dw $3A27                                                             ;8DB144;

EnemyProjSpritemaps_DustCloud_Explosion_44:
    dw $0001,$01FC                                                       ;8DB146;
    db $FC                                                               ;8DB14A;
    dw $3A7B                                                             ;8DB14B;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8DB14D:
    dw $0001,$01FC                                                       ;8DB14D;
    db $FC                                                               ;8DB151;
    dw $3A5F                                                             ;8DB152;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DustCloud_Explosion_45:
    dw $0001,$01FC                                                       ;8DB154;
    db $FC                                                               ;8DB158;
    dw $3A53                                                             ;8DB159;

EnemyProjSpritemaps_DustCloud_Explosion_46:
    dw $0001,$01FC                                                       ;8DB15B;
    db $FC                                                               ;8DB15F;
    dw $3A51                                                             ;8DB160;

EnemyProjSpritemaps_DustCloud_Explosion_47:
    dw $0004,$0000                                                       ;8DB162;
    db $00                                                               ;8DB166;
    dw $FA60,$0000                                                       ;8DB167;
    db $F8                                                               ;8DB16B;
    dw $7A60,$01F8                                                       ;8DB16C;
    db $00                                                               ;8DB170;
    dw $BA60,$01F8                                                       ;8DB171;
    db $F8                                                               ;8DB175;
    dw $3A60                                                             ;8DB176;

EnemyProjSpritemaps_DustCloud_Explosion_48:
    dw $0004,$0000                                                       ;8DB178;
    db $00                                                               ;8DB17C;
    dw $FA61,$0000                                                       ;8DB17D;
    db $F8                                                               ;8DB181;
    dw $7A61,$01F8                                                       ;8DB182;
    db $00                                                               ;8DB186;
    dw $BA61,$01F8                                                       ;8DB187;
    db $F8                                                               ;8DB18B;
    dw $3A61                                                             ;8DB18C;

EnemyProjSpritemaps_DustCloud_Explosion_49:
    dw $0004,$0000                                                       ;8DB18E;
    db $00                                                               ;8DB192;
    dw $FA62,$0000                                                       ;8DB193;
    db $F8                                                               ;8DB197;
    dw $7A62,$01F8                                                       ;8DB198;
    db $00                                                               ;8DB19C;
    dw $BA62,$01F8                                                       ;8DB19D;
    db $F8                                                               ;8DB1A1;
    dw $3A62                                                             ;8DB1A2;

EnemyProjSpritemaps_DustCloud_Explosion_4A:
    dw $0004,$0000                                                       ;8DB1A4;
    db $00                                                               ;8DB1A8;
    dw $FA63,$0000                                                       ;8DB1A9;
    db $F8                                                               ;8DB1AD;
    dw $7A63,$01F8                                                       ;8DB1AE;
    db $00                                                               ;8DB1B2;
    dw $BA63,$01F8                                                       ;8DB1B3;
    db $F8                                                               ;8DB1B7;
    dw $3A63                                                             ;8DB1B8;

EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0:
    dw $0004,$01F2                                                       ;8DB1BA;
    db $FC                                                               ;8DB1BE;
    dw $7A6C,$0006                                                       ;8DB1BF;
    db $FC                                                               ;8DB1C3;
    dw $7A6C,$0000                                                       ;8DB1C4;
    db $FC                                                               ;8DB1C8;
    dw $7A6C,$01F8                                                       ;8DB1C9;
    db $FC                                                               ;8DB1CD;
    dw $3A6C                                                             ;8DB1CE;

EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1:
    dw $0004,$0000                                                       ;8DB1D0;
    db $FC                                                               ;8DB1D4;
    dw $7A6E,$0008                                                       ;8DB1D5;
    db $FC                                                               ;8DB1D9;
    dw $7A6D,$01F8                                                       ;8DB1DA;
    db $FC                                                               ;8DB1DE;
    dw $3A6E,$01F0                                                       ;8DB1DF;
    db $FC                                                               ;8DB1E3;
    dw $3A6D                                                             ;8DB1E4;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8DB1E6:
    dw $0004,$01F0                                                       ;8DB1E6;
    db $FE                                                               ;8DB1EA;
    dw $3A6F,$0008                                                       ;8DB1EB;
    db $FE                                                               ;8DB1EF;
    dw $3A6F,$0000                                                       ;8DB1F0;
    db $FE                                                               ;8DB1F4;
    dw $3A6F,$01F8                                                       ;8DB1F5;
    db $FE                                                               ;8DB1F9;
    dw $3A6F                                                             ;8DB1FA;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DustCloud_Explosion_4B:
    dw $0001,$81F8                                                       ;8DB1FC;
    db $F8                                                               ;8DB200;
    dw $3A7C                                                             ;8DB201;

EnemyProjSpritemaps_DustCloud_Explosion_4C:
    dw $0001,$81F8                                                       ;8DB203;
    db $F6                                                               ;8DB207;
    dw $3A7E                                                             ;8DB208;

EnemyProjSpritemaps_DustCloud_Explosion_4D:
    dw $0001,$81F8                                                       ;8DB20A;
    db $F4                                                               ;8DB20E;
    dw $3A9A                                                             ;8DB20F;

EnemyProjSpritemaps_DustCloud_Explosion_4E:
    dw $0001,$81F8                                                       ;8DB211;
    db $F2                                                               ;8DB215;
    dw $3A9C                                                             ;8DB216;

EnemyProjSpritemaps_DustCloud_Explosion_4F:
    dw $0001,$01FC                                                       ;8DB218;
    db $FC                                                               ;8DB21C;
    dw $3A48                                                             ;8DB21D;

EnemyProjSpritemaps_DustCloud_Explosion_50:
    dw $0001,$01FC                                                       ;8DB21F;
    db $FA                                                               ;8DB223;
    dw $3A49                                                             ;8DB224;

EnemyProjSpritemaps_DustCloud_Explosion_51:
    dw $0001,$01FC                                                       ;8DB226;
    db $F8                                                               ;8DB22A;
    dw $3A4A                                                             ;8DB22B;

EnemyProjSpritemaps_DustCloud_Explosion_52:
    dw $0001,$01FC                                                       ;8DB22D;
    db $F6                                                               ;8DB231;
    dw $3A4B                                                             ;8DB232;

EnemyProjSpritemaps_DustCloud_Explosion_53:
    dw $0001,$01FC                                                       ;8DB234;
    db $FC                                                               ;8DB238;
    dw $3A2C                                                             ;8DB239;

EnemyProjSpritemaps_DustCloud_Explosion_54:
    dw $0001,$01FC                                                       ;8DB23B;
    db $FC                                                               ;8DB23F;
    dw $3A2D                                                             ;8DB240;

EnemyProjSpritemaps_DustCloud_Explosion_55:
    dw $0001,$01FC                                                       ;8DB242;
    db $FC                                                               ;8DB246;
    dw $3A2E                                                             ;8DB247;

EnemyProjSpritemaps_DustCloud_Explosion_56:
    dw $0001,$01FC                                                       ;8DB249;
    db $FC                                                               ;8DB24D;
    dw $3A2F                                                             ;8DB24E;

EnemyProjSpritemaps_Common_Smoke_0:
    dw $0001,$81F8                                                       ;8DB250;
    db $F6                                                               ;8DB254;
    dw $3A76                                                             ;8DB255;

EnemyProjSpritemaps_Common_Smoke_1:
    dw $0001,$81F8                                                       ;8DB257;
    db $F4                                                               ;8DB25B;
    dw $3A78                                                             ;8DB25C;

EnemyProjSpritemaps_Common_Smoke_2:
    dw $0001,$81F8                                                       ;8DB25E;
    db $F2                                                               ;8DB262;
    dw $3A98                                                             ;8DB263;

EnemyProjSpritemaps_Common_Smoke_3:
    dw $0001,$81F8                                                       ;8DB265;
    db $F0                                                               ;8DB269;
    dw $3A9E                                                             ;8DB26A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DB26C:
    dw $0001,$01FC                                                       ;8DB26C;
    db $FC                                                               ;8DB270;
    dw $3A25                                                             ;8DB271;

UNUSED_EnemyProjSpritemaps_1_8DB273:
    dw $0001,$01FC                                                       ;8DB273;
    db $FC                                                               ;8DB277;
    dw $3A43                                                             ;8DB278;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_MotherBrainsTurretBullets:
    dw $0001,$01FC                                                       ;8DB27A;
    db $FC                                                               ;8DB27E;
    dw $3A40                                                             ;8DB27F;

EnemyProjSpritemaps_DustCloud_Explosion_57:
    dw $0001,$01FC                                                       ;8DB281;
    db $FC                                                               ;8DB285;
    dw $3A3E                                                             ;8DB286;

EnemyProjSpritemaps_DustCloud_Explosion_58:
    dw $0001,$01FC                                                       ;8DB288;
    db $FC                                                               ;8DB28C;
    dw $3A3D                                                             ;8DB28D;

EnemyProjSpritemaps_DustCloud_Explosion_59:
    dw $0001,$01FC                                                       ;8DB28F;
    db $FC                                                               ;8DB293;
    dw $3A41                                                             ;8DB294;

EnemyProjSpritemaps_DustCloud_Explosion_5A:
    dw $0001,$01FC                                                       ;8DB296;
    db $FC                                                               ;8DB29A;
    dw $3A42                                                             ;8DB29B;

EnemyProjSpritemaps_DustCloud_Explosion_5B:
    dw $0004,$0000                                                       ;8DB29D;
    db $00                                                               ;8DB2A1;
    dw $FA44,$01F8                                                       ;8DB2A2;
    db $00                                                               ;8DB2A6;
    dw $BA44,$0000                                                       ;8DB2A7;
    db $F8                                                               ;8DB2AB;
    dw $7A44,$01F8                                                       ;8DB2AC;
    db $F8                                                               ;8DB2B0;
    dw $3A44                                                             ;8DB2B1;

EnemyProjSpritemaps_DustCloud_Explosion_5C:
    dw $0004,$0000                                                       ;8DB2B3;
    db $00                                                               ;8DB2B7;
    dw $FA45,$0000                                                       ;8DB2B8;
    db $F8                                                               ;8DB2BC;
    dw $7A45,$01F8                                                       ;8DB2BD;
    db $00                                                               ;8DB2C1;
    dw $BA45,$01F8                                                       ;8DB2C2;
    db $F8                                                               ;8DB2C6;
    dw $3A45                                                             ;8DB2C7;

EnemyProjSpritemaps_DustCloud_Explosion_5D:
    dw $0004,$01F8                                                       ;8DB2C9;
    db $00                                                               ;8DB2CD;
    dw $BA46,$0000                                                       ;8DB2CE;
    db $00                                                               ;8DB2D2;
    dw $FA46,$0000                                                       ;8DB2D3;
    db $F8                                                               ;8DB2D7;
    dw $7A46,$01F8                                                       ;8DB2D8;
    db $F8                                                               ;8DB2DC;
    dw $3A46                                                             ;8DB2DD;

EnemyProjSpritemaps_DustCloud_Explosion_5E:
    dw $0001,$01FC                                                       ;8DB2DF;
    db $FC                                                               ;8DB2E3;
    dw $3A42                                                             ;8DB2E4;

EnemyProjSpritemaps_DustCloud_Explosion_5F:
    dw $0001,$01FC                                                       ;8DB2E6;
    db $FC                                                               ;8DB2EA;
    dw $3A4C                                                             ;8DB2EB;

EnemyProjSpritemaps_DustCloud_Explosion_60:
    dw $0001,$01FC                                                       ;8DB2ED;
    db $FC                                                               ;8DB2F1;
    dw $3A4D                                                             ;8DB2F2;

EnemyProjSpritemaps_DustCloud_Explosion_61:
    dw $0001,$01FC                                                       ;8DB2F4;
    db $FC                                                               ;8DB2F8;
    dw $3A4E                                                             ;8DB2F9;

EnemyProjSpritemaps_DustCloud_Explosion_62:
    dw $0001,$01FC                                                       ;8DB2FB;
    db $FC                                                               ;8DB2FF;
    dw $3A4F                                                             ;8DB300;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DB302:
    dw $0002,$01FF                                                       ;8DB302;
    db $FC                                                               ;8DB306;
    dw $3A55,$01F7                                                       ;8DB307;
    db $FC                                                               ;8DB30B;
    dw $3A54                                                             ;8DB30C;

UNUSED_EnemyProjSpritemaps_1_8DB30E:
    dw $0003,$01FA                                                       ;8DB30E;
    db $F5                                                               ;8DB312;
    dw $3A56,$0002                                                       ;8DB313;
    db $FD                                                               ;8DB317;
    dw $3A58,$01FA                                                       ;8DB318;
    db $FD                                                               ;8DB31C;
    dw $3A57                                                             ;8DB31D;

UNUSED_EnemyProjSpritemaps_2_8DB31F:
    dw $0002,$01FD                                                       ;8DB31F;
    db $F7                                                               ;8DB323;
    dw $3A59,$01FD                                                       ;8DB324;
    db $FF                                                               ;8DB328;
    dw $3A5A                                                             ;8DB329;

UNUSED_EnemyProjSpritemaps_3_8DB32B:
    dw $0003,$01FE                                                       ;8DB32B;
    db $F5                                                               ;8DB32F;
    dw $7A56,$01F6                                                       ;8DB330;
    db $FD                                                               ;8DB334;
    dw $7A58,$01FE                                                       ;8DB335;
    db $FD                                                               ;8DB339;
    dw $7A57                                                             ;8DB33A;

UNUSED_EnemyProjSpritemaps_4_8DB33C:
    dw $0002,$01F9                                                       ;8DB33C;
    db $FC                                                               ;8DB340;
    dw $7A55,$0001                                                       ;8DB341;
    db $FC                                                               ;8DB345;
    dw $7A54                                                             ;8DB346;

UNUSED_EnemyProjSpritemaps_5_8DB348:
    dw $0003,$01FE                                                       ;8DB348;
    db $03                                                               ;8DB34C;
    dw $FA56,$01F6                                                       ;8DB34D;
    db $FB                                                               ;8DB351;
    dw $FA58,$01FE                                                       ;8DB352;
    db $FB                                                               ;8DB356;
    dw $FA57                                                             ;8DB357;

UNUSED_EnemyProjSpritemaps_6_8DB359:
    dw $0002,$01FD                                                       ;8DB359;
    db $01                                                               ;8DB35D;
    dw $BA59,$01FD                                                       ;8DB35E;
    db $F9                                                               ;8DB362;
    dw $BA5A                                                             ;8DB363;

UNUSED_EnemyProjSpritemaps_7_8DB365:
    dw $0003,$01FA                                                       ;8DB365;
    db $03                                                               ;8DB369;
    dw $BA56,$0002                                                       ;8DB36A;
    db $FB                                                               ;8DB36E;
    dw $BA58,$01FA                                                       ;8DB36F;
    db $FB                                                               ;8DB373;
    dw $BA57                                                             ;8DB374;

UNUSED_EnemyProjSpritemaps_8_8DB376:
    dw $0002,$0000                                                       ;8DB376;
    db $FC                                                               ;8DB37A;
    dw $3A65,$01F8                                                       ;8DB37B;
    db $FC                                                               ;8DB37F;
    dw $3A64                                                             ;8DB380;

UNUSED_EnemyProjSpritemaps_9_8DB382:
    dw $0003,$0002                                                       ;8DB382;
    db $FE                                                               ;8DB386;
    dw $3A68,$01FA                                                       ;8DB387;
    db $FE                                                               ;8DB38B;
    dw $3A67,$01FA                                                       ;8DB38C;
    db $F6                                                               ;8DB390;
    dw $3A66                                                             ;8DB391;

UNUSED_EnemyProjSpritemaps_A_8DB393:
    dw $0002,$01FC                                                       ;8DB393;
    db $F8                                                               ;8DB397;
    dw $3A69,$01FC                                                       ;8DB398;
    db $00                                                               ;8DB39C;
    dw $3A6A                                                             ;8DB39D;

UNUSED_EnemyProjSpritemaps_B_8DB39F:
    dw $0003,$01F6                                                       ;8DB39F;
    db $FE                                                               ;8DB3A3;
    dw $7A68,$01FE                                                       ;8DB3A4;
    db $FE                                                               ;8DB3A8;
    dw $7A67,$01FE                                                       ;8DB3A9;
    db $F6                                                               ;8DB3AD;
    dw $7A66                                                             ;8DB3AE;

UNUSED_EnemyProjSpritemaps_C_8DB3B0:
    dw $0002,$01F8                                                       ;8DB3B0;
    db $FC                                                               ;8DB3B4;
    dw $7A65,$0000                                                       ;8DB3B5;
    db $FC                                                               ;8DB3B9;
    dw $7A64                                                             ;8DB3BA;

UNUSED_EnemyProjSpritemaps_D_8DB3BC:
    dw $0003,$01F6                                                       ;8DB3BC;
    db $FA                                                               ;8DB3C0;
    dw $FA68,$01FE                                                       ;8DB3C1;
    db $FA                                                               ;8DB3C5;
    dw $FA67,$01FE                                                       ;8DB3C6;
    db $02                                                               ;8DB3CA;
    dw $FA66                                                             ;8DB3CB;

UNUSED_EnemyProjSpritemaps_E_8DB3CD:
    dw $0002,$01FC                                                       ;8DB3CD;
    db $00                                                               ;8DB3D1;
    dw $BA69,$01FC                                                       ;8DB3D2;
    db $F8                                                               ;8DB3D6;
    dw $BA6A                                                             ;8DB3D7;

UNUSED_EnemyProjSpritemaps_F_8DB3D9:
    dw $0003,$0002                                                       ;8DB3D9;
    db $FA                                                               ;8DB3DD;
    dw $BA68,$01FA                                                       ;8DB3DE;
    db $FA                                                               ;8DB3E2;
    dw $BA67,$01FA                                                       ;8DB3E3;
    db $02                                                               ;8DB3E7;
    dw $BA66                                                             ;8DB3E8;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DustCloud_Explosion_63:
    dw $0001,$01FC                                                       ;8DB3EA;
    db $FC                                                               ;8DB3EE;
    dw $3A3C                                                             ;8DB3EF;

EnemyProjSpritemaps_DustCloud_Explosion_64:
    dw $0001,$01FC                                                       ;8DB3F1;
    db $FC                                                               ;8DB3F5;
    dw $3A3D                                                             ;8DB3F6;

EnemyProjSpritemaps_DustCloud_Explosion_65:
    dw $0001,$01FC                                                       ;8DB3F8;
    db $FC                                                               ;8DB3FC;
    dw $3A3E                                                             ;8DB3FD;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8DB3FF:
    dw $0001,$01FC                                                       ;8DB3FF;
    db $FC                                                               ;8DB403;
    dw $3A3F                                                             ;8DB404;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Common_BigExplosion_0:
    dw $0004,$0000                                                       ;8DB406;
    db $00                                                               ;8DB40A;
    dw $FA8A,$01F8                                                       ;8DB40B;
    db $00                                                               ;8DB40F;
    dw $BA8A,$0000                                                       ;8DB410;
    db $F8                                                               ;8DB414;
    dw $7A8A,$01F8                                                       ;8DB415;
    db $F8                                                               ;8DB419;
    dw $3A8A                                                             ;8DB41A;

EnemyProjSpritemaps_Common_BigExplosion_1:
    dw $0004,$C200                                                       ;8DB41C;
    db $00                                                               ;8DB420;
    dw $FA90,$C200                                                       ;8DB421;
    db $F0                                                               ;8DB425;
    dw $7A90,$C3F0                                                       ;8DB426;
    db $00                                                               ;8DB42A;
    dw $BA90,$C3F0                                                       ;8DB42B;
    db $F0                                                               ;8DB42F;
    dw $3A90                                                             ;8DB430;

EnemyProjSpritemaps_Common_BigExplosion_2:
    dw $0004,$C200                                                       ;8DB432;
    db $00                                                               ;8DB436;
    dw $FA92,$C3F0                                                       ;8DB437;
    db $00                                                               ;8DB43B;
    dw $BA92,$C200                                                       ;8DB43C;
    db $F0                                                               ;8DB440;
    dw $7A92,$C3F0                                                       ;8DB441;
    db $F0                                                               ;8DB445;
    dw $3A92                                                             ;8DB446;

EnemyProjSpritemaps_Common_BigExplosion_3:
    dw $000C,$0010                                                       ;8DB448;
    db $00                                                               ;8DB44C;
    dw $FAC2,$0010                                                       ;8DB44D;
    db $F8                                                               ;8DB451;
    dw $7AC2,$0000                                                       ;8DB452;
    db $10                                                               ;8DB456;
    dw $FAB2,$01F8                                                       ;8DB457;
    db $10                                                               ;8DB45B;
    dw $BAB2,$01E8                                                       ;8DB45C;
    db $00                                                               ;8DB460;
    dw $BAC2,$01E8                                                       ;8DB461;
    db $F8                                                               ;8DB465;
    dw $3AC2,$0000                                                       ;8DB466;
    db $E8                                                               ;8DB46A;
    dw $7AB2,$01F8                                                       ;8DB46B;
    db $E8                                                               ;8DB46F;
    dw $3AB2,$C200                                                       ;8DB470;
    db $00                                                               ;8DB474;
    dw $FAB0,$C200                                                       ;8DB475;
    db $F0                                                               ;8DB479;
    dw $7AB0,$C3F0                                                       ;8DB47A;
    db $00                                                               ;8DB47E;
    dw $BAB0,$C3F0                                                       ;8DB47F;
    db $F0                                                               ;8DB483;
    dw $3AB0                                                             ;8DB484;

EnemyProjSpritemaps_Common_BigExplosion_4:
    dw $0008,$C208                                                       ;8DB486;
    db $00                                                               ;8DB48A;
    dw $FAB5,$C200                                                       ;8DB48B;
    db $08                                                               ;8DB48F;
    dw $FAB3,$C3E8                                                       ;8DB490;
    db $00                                                               ;8DB494;
    dw $BAB5,$C3F0                                                       ;8DB495;
    db $08                                                               ;8DB499;
    dw $BAB3,$C208                                                       ;8DB49A;
    db $F0                                                               ;8DB49E;
    dw $7AB5,$C200                                                       ;8DB49F;
    db $E8                                                               ;8DB4A3;
    dw $7AB3,$C3E8                                                       ;8DB4A4;
    db $F0                                                               ;8DB4A8;
    dw $3AB5,$C3F0                                                       ;8DB4A9;
    db $E8                                                               ;8DB4AD;
    dw $3AB3                                                             ;8DB4AE;

EnemyProjSpritemaps_Common_BigExplosion_5:
    dw $000C,$0000                                                       ;8DB4B0;
    db $10                                                               ;8DB4B4;
    dw $FABB,$01F8                                                       ;8DB4B5;
    db $10                                                               ;8DB4B9;
    dw $BABB,$0000                                                       ;8DB4BA;
    db $E8                                                               ;8DB4BE;
    dw $7ABB,$01F8                                                       ;8DB4BF;
    db $E8                                                               ;8DB4C3;
    dw $3ABB,$0010                                                       ;8DB4C4;
    db $00                                                               ;8DB4C8;
    dw $FAB7,$0010                                                       ;8DB4C9;
    db $F8                                                               ;8DB4CD;
    dw $7AB7,$01E8                                                       ;8DB4CE;
    db $00                                                               ;8DB4D2;
    dw $BAB7,$01E8                                                       ;8DB4D3;
    db $F8                                                               ;8DB4D7;
    dw $3AB7,$C208                                                       ;8DB4D8;
    db $08                                                               ;8DB4DC;
    dw $FAB8,$C3E8                                                       ;8DB4DD;
    db $08                                                               ;8DB4E1;
    dw $BAB8,$C208                                                       ;8DB4E2;
    db $E8                                                               ;8DB4E6;
    dw $7AB8,$C3E8                                                       ;8DB4E7;
    db $E8                                                               ;8DB4EB;
    dw $3AB8                                                             ;8DB4EC;

EnemyProjSpritemaps_DownwardsShotGate_0:
    dw $0001,$C200                                                       ;8DB4EE;
    db $00                                                               ;8DB4F2;
    dw $2ABE                                                             ;8DB4F3;

EnemyProjSpritemaps_DownwardsShotGate_1:
    dw $0002,$C200                                                       ;8DB4F5;
    db $00                                                               ;8DB4F9;
    dw $2ABE,$C200                                                       ;8DB4FA;
    db $F0                                                               ;8DB4FE;
    dw $2ABE                                                             ;8DB4FF;

EnemyProjSpritemaps_DownwardsShotGate_2:
    dw $0003,$C200                                                       ;8DB501;
    db $00                                                               ;8DB505;
    dw $2ABE,$C200                                                       ;8DB506;
    db $F0                                                               ;8DB50A;
    dw $2ABE,$C200                                                       ;8DB50B;
    db $E0                                                               ;8DB50F;
    dw $2ABE                                                             ;8DB510;

EnemyProjSpritemaps_DownwardsShotGate_3:
    dw $0004,$C200                                                       ;8DB512;
    db $00                                                               ;8DB516;
    dw $2ABE,$C200                                                       ;8DB517;
    db $F0                                                               ;8DB51B;
    dw $2ABE,$C200                                                       ;8DB51C;
    db $E0                                                               ;8DB520;
    dw $2ABE,$C200                                                       ;8DB521;
    db $D0                                                               ;8DB525;
    dw $2ABE                                                             ;8DB526;

EnemyProjSpritemaps_UpwardsShotGate_0:
    dw $0001,$C200                                                       ;8DB528;
    db $FF                                                               ;8DB52C;
    dw $2ABE                                                             ;8DB52D;

EnemyProjSpritemaps_UpwardsShotGate_1:
    dw $0002,$C200                                                       ;8DB52F;
    db $0F                                                               ;8DB533;
    dw $2ABE,$C200                                                       ;8DB534;
    db $FF                                                               ;8DB538;
    dw $2ABE                                                             ;8DB539;

EnemyProjSpritemaps_UpwardsShotGate_2:
    dw $0003,$C200                                                       ;8DB53B;
    db $1F                                                               ;8DB53F;
    dw $2ABE,$C200                                                       ;8DB540;
    db $0F                                                               ;8DB544;
    dw $2ABE,$C200                                                       ;8DB545;
    db $FF                                                               ;8DB549;
    dw $2ABE                                                             ;8DB54A;

EnemyProjSpritemaps_UpwardsShotGate_3:
    dw $0004,$C200                                                       ;8DB54C;
    db $2F                                                               ;8DB550;
    dw $2ABE,$C200                                                       ;8DB551;
    db $1F                                                               ;8DB555;
    dw $2ABE,$C200                                                       ;8DB556;
    db $0F                                                               ;8DB55A;
    dw $2ABE,$C200                                                       ;8DB55B;
    db $FF                                                               ;8DB55F;
    dw $2ABE                                                             ;8DB560;

EnemyProjSpritemaps_SaveStationElectricity_0:
    dw $0004,$0008                                                       ;8DB562;
    db $E0                                                               ;8DB566;
    dw $7ACD,$0000                                                       ;8DB567;
    db $E0                                                               ;8DB56B;
    dw $7A6F,$01F0                                                       ;8DB56C;
    db $E0                                                               ;8DB570;
    dw $3ACD,$01F8                                                       ;8DB571;
    db $E0                                                               ;8DB575;
    dw $3A6F                                                             ;8DB576;

EnemyProjSpritemaps_SaveStationElectricity_1:
    dw $0004,$0008                                                       ;8DB578;
    db $E8                                                               ;8DB57C;
    dw $7ACD,$0000                                                       ;8DB57D;
    db $E8                                                               ;8DB581;
    dw $7A6F,$01F0                                                       ;8DB582;
    db $E8                                                               ;8DB586;
    dw $3ACD,$01F8                                                       ;8DB587;
    db $E8                                                               ;8DB58B;
    dw $3A6F                                                             ;8DB58C;

EnemyProjSpritemaps_SaveStationElectricity_2:
    dw $0004,$0008                                                       ;8DB58E;
    db $F0                                                               ;8DB592;
    dw $7ACD,$0000                                                       ;8DB593;
    db $F0                                                               ;8DB597;
    dw $7A6F,$01F0                                                       ;8DB598;
    db $F0                                                               ;8DB59C;
    dw $3ACD,$01F8                                                       ;8DB59D;
    db $F0                                                               ;8DB5A1;
    dw $3A6F                                                             ;8DB5A2;

EnemyProjSpritemaps_SaveStationElectricity_3:
    dw $0004,$0008                                                       ;8DB5A4;
    db $F8                                                               ;8DB5A8;
    dw $7ACD,$0000                                                       ;8DB5A9;
    db $F8                                                               ;8DB5AD;
    dw $7A6F,$01F0                                                       ;8DB5AE;
    db $F8                                                               ;8DB5B2;
    dw $3ACD,$01F8                                                       ;8DB5B3;
    db $F8                                                               ;8DB5B7;
    dw $3A6F                                                             ;8DB5B8;

EnemyProjSpritemaps_SaveStationElectricity_4:
    dw $0004,$0008                                                       ;8DB5BA;
    db $00                                                               ;8DB5BE;
    dw $7ACD,$0000                                                       ;8DB5BF;
    db $00                                                               ;8DB5C3;
    dw $7A6F,$01F0                                                       ;8DB5C4;
    db $00                                                               ;8DB5C8;
    dw $3ACD,$01F8                                                       ;8DB5C9;
    db $00                                                               ;8DB5CD;
    dw $3A6F                                                             ;8DB5CE;

EnemyProjSpritemaps_SaveStationElectricity_5:
    dw $0004,$0008                                                       ;8DB5D0;
    db $08                                                               ;8DB5D4;
    dw $7ACD,$0000                                                       ;8DB5D5;
    db $08                                                               ;8DB5D9;
    dw $7A6F,$01F0                                                       ;8DB5DA;
    db $08                                                               ;8DB5DE;
    dw $3ACD,$01F8                                                       ;8DB5DF;
    db $08                                                               ;8DB5E3;
    dw $3A6F                                                             ;8DB5E4;

EnemyProjSpritemaps_SaveStationElectricity_6:
    dw $0004,$0008                                                       ;8DB5E6;
    db $10                                                               ;8DB5EA;
    dw $7ACD,$0000                                                       ;8DB5EB;
    db $10                                                               ;8DB5EF;
    dw $7A6F,$01F0                                                       ;8DB5F0;
    db $10                                                               ;8DB5F4;
    dw $3ACD,$01F8                                                       ;8DB5F5;
    db $10                                                               ;8DB5F9;
    dw $3A6F                                                             ;8DB5FA;

EnemyProjSpritemaps_SaveStationElectricity_7:
    dw $0004,$0008                                                       ;8DB5FC;
    db $18                                                               ;8DB600;
    dw $7ACD,$0000                                                       ;8DB601;
    db $18                                                               ;8DB605;
    dw $7A6F,$01F0                                                       ;8DB606;
    db $18                                                               ;8DB60A;
    dw $3ACD,$01F8                                                       ;8DB60B;
    db $18                                                               ;8DB60F;
    dw $3A6F                                                             ;8DB610;

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_0:
    dw $0001,$81F8                                                       ;8DB612;
    db $F8                                                               ;8DB616;
    dw $2128                                                             ;8DB617;

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_1:
    dw $0001,$81F8                                                       ;8DB619;
    db $F8                                                               ;8DB61D;
    dw $212A                                                             ;8DB61E;

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_2:
    dw $0001,$81F8                                                       ;8DB620;
    db $F8                                                               ;8DB624;
    dw $212C                                                             ;8DB625;

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_3:
    dw $0001,$81F8                                                       ;8DB627;
    db $F8                                                               ;8DB62B;
    dw $212E                                                             ;8DB62C;

EnemyProjSpritemaps_BotwoonsBody_0:
    dw $0001,$81F8                                                       ;8DB62E;
    db $F8                                                               ;8DB632;
    dw $2148                                                             ;8DB633;

EnemyProjSpritemaps_BotwoonsBody_1:
    dw $0001,$81F8                                                       ;8DB635;
    db $F8                                                               ;8DB639;
    dw $214A                                                             ;8DB63A;

EnemyProjSpritemaps_BotwoonsBody_2:
    dw $0001,$81F8                                                       ;8DB63C;
    db $F8                                                               ;8DB640;
    dw $214C                                                             ;8DB641;

EnemyProjSpritemaps_BotwoonsBody_3:
    dw $0001,$81F8                                                       ;8DB643;
    db $F8                                                               ;8DB647;
    dw $214E                                                             ;8DB648;

EnemyProjSpritemaps_BotwoonsBody_4:
    dw $0001,$81F8                                                       ;8DB64A;
    db $F8                                                               ;8DB64E;
    dw $2140                                                             ;8DB64F;

EnemyProjSpritemaps_BotwoonsBody_5:
    dw $0001,$81F8                                                       ;8DB651;
    db $F8                                                               ;8DB655;
    dw $2142                                                             ;8DB656;

EnemyProjSpritemaps_BotwoonsBody_6:
    dw $0001,$81F8                                                       ;8DB658;
    db $F8                                                               ;8DB65C;
    dw $2144                                                             ;8DB65D;

EnemyProjSpritemaps_BotwoonsBody_7:
    dw $0001,$81F8                                                       ;8DB65F;
    db $F8                                                               ;8DB663;
    dw $2146                                                             ;8DB664;

EnemyProjSpritemaps_BotwoonsBody_8:
    dw $0001,$81F8                                                       ;8DB666;
    db $F8                                                               ;8DB66A;
    dw $2160                                                             ;8DB66B;

EnemyProjSpritemaps_BotwoonsBody_9:
    dw $0001,$81F8                                                       ;8DB66D;
    db $F8                                                               ;8DB671;
    dw $2162                                                             ;8DB672;

EnemyProjSpritemaps_BotwoonsBody_A:
    dw $0001,$81F8                                                       ;8DB674;
    db $F8                                                               ;8DB678;
    dw $2164                                                             ;8DB679;

EnemyProjSpritemaps_BotwoonsBody_B:
    dw $0001,$81F8                                                       ;8DB67B;
    db $F8                                                               ;8DB67F;
    dw $2166                                                             ;8DB680;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB682:
    dw $0001,$81F8                                                       ;8DB682;
    db $F8                                                               ;8DB686;
    dw $2168                                                             ;8DB687;

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB689:
    dw $0001,$81F8                                                       ;8DB689;
    db $F8                                                               ;8DB68D;
    dw $216A                                                             ;8DB68E;

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB690:
    dw $0001,$81F8                                                       ;8DB690;
    db $F8                                                               ;8DB694;
    dw $216C                                                             ;8DB695;

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB697:
    dw $0001,$81F8                                                       ;8DB697;
    db $F8                                                               ;8DB69B;
    dw $216E                                                             ;8DB69C;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_BotwoonsBody_C:
    dw $0001,$81F8                                                       ;8DB69E;
    db $F8                                                               ;8DB6A2;
    dw $6168                                                             ;8DB6A3;

EnemyProjSpritemaps_BotwoonsBody_D:
    dw $0001,$81F8                                                       ;8DB6A5;
    db $F8                                                               ;8DB6A9;
    dw $616A                                                             ;8DB6AA;

EnemyProjSpritemaps_BotwoonsBody_E:
    dw $0001,$81F8                                                       ;8DB6AC;
    db $F8                                                               ;8DB6B0;
    dw $616C                                                             ;8DB6B1;

EnemyProjSpritemaps_BotwoonsBody_F:
    dw $0001,$81F8                                                       ;8DB6B3;
    db $F8                                                               ;8DB6B7;
    dw $616E                                                             ;8DB6B8;

EnemyProjSpritemaps_BotwoonsBody_10:
    dw $0001,$81F8                                                       ;8DB6BA;
    db $F8                                                               ;8DB6BE;
    dw $6160                                                             ;8DB6BF;

EnemyProjSpritemaps_BotwoonsBody_11:
    dw $0001,$81F8                                                       ;8DB6C1;
    db $F8                                                               ;8DB6C5;
    dw $6162                                                             ;8DB6C6;

EnemyProjSpritemaps_BotwoonsBody_12:
    dw $0001,$81F8                                                       ;8DB6C8;
    db $F8                                                               ;8DB6CC;
    dw $6164                                                             ;8DB6CD;

EnemyProjSpritemaps_BotwoonsBody_13:
    dw $0001,$81F8                                                       ;8DB6CF;
    db $F8                                                               ;8DB6D3;
    dw $6166                                                             ;8DB6D4;

EnemyProjSpritemaps_BotwoonsBody_14:
    dw $0001,$81F8                                                       ;8DB6D6;
    db $F8                                                               ;8DB6DA;
    dw $6140                                                             ;8DB6DB;

EnemyProjSpritemaps_BotwoonsBody_15:
    dw $0001,$81F8                                                       ;8DB6DD;
    db $F8                                                               ;8DB6E1;
    dw $6142                                                             ;8DB6E2;

EnemyProjSpritemaps_BotwoonsBody_16:
    dw $0001,$81F8                                                       ;8DB6E4;
    db $F8                                                               ;8DB6E8;
    dw $6144                                                             ;8DB6E9;

EnemyProjSpritemaps_BotwoonsBody_17:
    dw $0001,$81F8                                                       ;8DB6EB;
    db $F8                                                               ;8DB6EF;
    dw $6146                                                             ;8DB6F0;

EnemyProjSpritemaps_BotwoonsBody_18:
    dw $0001,$81F8                                                       ;8DB6F2;
    db $F8                                                               ;8DB6F6;
    dw $6148                                                             ;8DB6F7;

EnemyProjSpritemaps_BotwoonsBody_19:
    dw $0001,$81F8                                                       ;8DB6F9;
    db $F8                                                               ;8DB6FD;
    dw $614A                                                             ;8DB6FE;

EnemyProjSpritemaps_BotwoonsBody_1A:
    dw $0001,$81F8                                                       ;8DB700;
    db $F8                                                               ;8DB704;
    dw $614C                                                             ;8DB705;

EnemyProjSpritemaps_BotwoonsBody_1B:
    dw $0001,$81F8                                                       ;8DB707;
    db $F8                                                               ;8DB70B;
    dw $614E                                                             ;8DB70C;

EnemyProjSpritemaps_BotwoonsBody_1C:
    dw $0001,$81F8                                                       ;8DB70E;
    db $F8                                                               ;8DB712;
    dw $6128                                                             ;8DB713;

EnemyProjSpritemaps_BotwoonsBody_1D:
    dw $0001,$81F8                                                       ;8DB715;
    db $F8                                                               ;8DB719;
    dw $612A                                                             ;8DB71A;

EnemyProjSpritemaps_BotwoonsBody_1E:
    dw $0001,$81F8                                                       ;8DB71C;
    db $F8                                                               ;8DB720;
    dw $612C                                                             ;8DB721;

EnemyProjSpritemaps_BotwoonsBody_1F:
    dw $0001,$81F8                                                       ;8DB723;
    db $F8                                                               ;8DB727;
    dw $612E                                                             ;8DB728;

EnemyProjSpritemaps_BotwoonsBody_20:
    dw $0001,$81F8                                                       ;8DB72A;
    db $F8                                                               ;8DB72E;
    dw $21A4                                                             ;8DB72F;

EnemyProjSpritemaps_BotwoonsBody_21:
    dw $0001,$81F8                                                       ;8DB731;
    db $F8                                                               ;8DB735;
    dw $21A2                                                             ;8DB736;

EnemyProjSpritemaps_BotwoonsBody_22:
    dw $0001,$81F8                                                       ;8DB738;
    db $F8                                                               ;8DB73C;
    dw $21A0                                                             ;8DB73D;

EnemyProjSpritemaps_BotwoonsBody_23:
    dw $0001,$81F8                                                       ;8DB73F;
    db $F8                                                               ;8DB743;
    dw $A1A2                                                             ;8DB744;

EnemyProjSpritemaps_BotwoonsBody_24:
    dw $0001,$81F8                                                       ;8DB746;
    db $F8                                                               ;8DB74A;
    dw $A1A4                                                             ;8DB74B;

EnemyProjSpritemaps_BotwoonsBody_25:
    dw $0001,$81F8                                                       ;8DB74D;
    db $F8                                                               ;8DB751;
    dw $E1A2                                                             ;8DB752;

EnemyProjSpritemaps_BotwoonsBody_26:
    dw $0001,$81F8                                                       ;8DB754;
    db $F8                                                               ;8DB758;
    dw $61A0                                                             ;8DB759;

EnemyProjSpritemaps_BotwoonsBody_27:
    dw $0001,$81F8                                                       ;8DB75B;
    db $F8                                                               ;8DB75F;
    dw $61A2                                                             ;8DB760;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_0_8DB762:
    dw $0001,$81F8                                                       ;8DB762;
    db $F8                                                               ;8DB766;
    dw $0128                                                             ;8DB767;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1_8DB769:
    dw $0001,$81F8                                                       ;8DB769;
    db $F8                                                               ;8DB76D;
    dw $012A                                                             ;8DB76E;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2_8DB770:
    dw $0001,$81F8                                                       ;8DB770;
    db $F8                                                               ;8DB774;
    dw $012C                                                             ;8DB775;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_3_8DB777:
    dw $0001,$81F8                                                       ;8DB777;
    db $F8                                                               ;8DB77B;
    dw $012E                                                             ;8DB77C;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_4_8DB77E:
    dw $0001,$81F8                                                       ;8DB77E;
    db $F8                                                               ;8DB782;
    dw $0148                                                             ;8DB783;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_5_8DB785:
    dw $0001,$81F8                                                       ;8DB785;
    db $F8                                                               ;8DB789;
    dw $014A                                                             ;8DB78A;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_6_8DB78C:
    dw $0001,$81F8                                                       ;8DB78C;
    db $F8                                                               ;8DB790;
    dw $014C                                                             ;8DB791;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_7_8DB793:
    dw $0001,$81F8                                                       ;8DB793;
    db $F8                                                               ;8DB797;
    dw $014E                                                             ;8DB798;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_8_8DB79A:
    dw $0001,$81F8                                                       ;8DB79A;
    db $F8                                                               ;8DB79E;
    dw $0140                                                             ;8DB79F;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_9_8DB7A1:
    dw $0001,$81F8                                                       ;8DB7A1;
    db $F8                                                               ;8DB7A5;
    dw $0142                                                             ;8DB7A6;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_A_8DB7A8:
    dw $0001,$81F8                                                       ;8DB7A8;
    db $F8                                                               ;8DB7AC;
    dw $0144                                                             ;8DB7AD;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_B_8DB7AF:
    dw $0001,$81F8                                                       ;8DB7AF;
    db $F8                                                               ;8DB7B3;
    dw $0146                                                             ;8DB7B4;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_C_8DB7B6:
    dw $0001,$81F8                                                       ;8DB7B6;
    db $F8                                                               ;8DB7BA;
    dw $0160                                                             ;8DB7BB;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_D_8DB7BD:
    dw $0001,$81F8                                                       ;8DB7BD;
    db $F8                                                               ;8DB7C1;
    dw $0162                                                             ;8DB7C2;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_E_8DB7C4:
    dw $0001,$81F8                                                       ;8DB7C4;
    db $F8                                                               ;8DB7C8;
    dw $0164                                                             ;8DB7C9;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_F_8DB7CB:
    dw $0001,$81F8                                                       ;8DB7CB;
    db $F8                                                               ;8DB7CF;
    dw $0166                                                             ;8DB7D0;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_10_8DB7D2:
    dw $0001,$81F8                                                       ;8DB7D2;
    db $F8                                                               ;8DB7D6;
    dw $0168                                                             ;8DB7D7;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_11_8DB7D9:
    dw $0001,$81F8                                                       ;8DB7D9;
    db $F8                                                               ;8DB7DD;
    dw $016A                                                             ;8DB7DE;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_12_8DB7E0:
    dw $0001,$81F8                                                       ;8DB7E0;
    db $F8                                                               ;8DB7E4;
    dw $016C                                                             ;8DB7E5;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_13_8DB7E7:
    dw $0001,$81F8                                                       ;8DB7E7;
    db $F8                                                               ;8DB7EB;
    dw $016E                                                             ;8DB7EC;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_14_8DB7EE:
    dw $0001,$81F8                                                       ;8DB7EE;
    db $F8                                                               ;8DB7F2;
    dw $4168                                                             ;8DB7F3;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_15_8DB7F5:
    dw $0001,$81F8                                                       ;8DB7F5;
    db $F8                                                               ;8DB7F9;
    dw $416A                                                             ;8DB7FA;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_16_8DB7FC:
    dw $0001,$81F8                                                       ;8DB7FC;
    db $F8                                                               ;8DB800;
    dw $416C                                                             ;8DB801;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_17_8DB803:
    dw $0001,$81F8                                                       ;8DB803;
    db $F8                                                               ;8DB807;
    dw $416E                                                             ;8DB808;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_18_8DB80A:
    dw $0001,$81F8                                                       ;8DB80A;
    db $F8                                                               ;8DB80E;
    dw $4160                                                             ;8DB80F;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_19_8DB811:
    dw $0001,$81F8                                                       ;8DB811;
    db $F8                                                               ;8DB815;
    dw $4162                                                             ;8DB816;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1A_8DB818:
    dw $0001,$81F8                                                       ;8DB818;
    db $F8                                                               ;8DB81C;
    dw $4164                                                             ;8DB81D;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1B_8DB81F:
    dw $0001,$81F8                                                       ;8DB81F;
    db $F8                                                               ;8DB823;
    dw $4166                                                             ;8DB824;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1C_8DB826:
    dw $0001,$81F8                                                       ;8DB826;
    db $F8                                                               ;8DB82A;
    dw $4140                                                             ;8DB82B;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1D_8DB82D:
    dw $0001,$81F8                                                       ;8DB82D;
    db $F8                                                               ;8DB831;
    dw $4142                                                             ;8DB832;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1E_8DB834:
    dw $0001,$81F8                                                       ;8DB834;
    db $F8                                                               ;8DB838;
    dw $4144                                                             ;8DB839;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1F_8DB83B:
    dw $0001,$81F8                                                       ;8DB83B;
    db $F8                                                               ;8DB83F;
    dw $4146                                                             ;8DB840;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_20_8DB842:
    dw $0001,$81F8                                                       ;8DB842;
    db $F8                                                               ;8DB846;
    dw $4148                                                             ;8DB847;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_21_8DB849:
    dw $0001,$81F8                                                       ;8DB849;
    db $F8                                                               ;8DB84D;
    dw $414A                                                             ;8DB84E;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_22_8DB850:
    dw $0001,$81F8                                                       ;8DB850;
    db $F8                                                               ;8DB854;
    dw $414C                                                             ;8DB855;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_23_8DB857:
    dw $0001,$81F8                                                       ;8DB857;
    db $F8                                                               ;8DB85B;
    dw $414E                                                             ;8DB85C;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_24_8DB85E:
    dw $0001,$81F8                                                       ;8DB85E;
    db $F8                                                               ;8DB862;
    dw $4128                                                             ;8DB863;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_25_8DB865:
    dw $0001,$81F8                                                       ;8DB865;
    db $F8                                                               ;8DB869;
    dw $412A                                                             ;8DB86A;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_26_8DB86C:
    dw $0001,$81F8                                                       ;8DB86C;
    db $F8                                                               ;8DB870;
    dw $412C                                                             ;8DB871;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_27_8DB873:
    dw $0001,$81F8                                                       ;8DB873;
    db $F8                                                               ;8DB877;
    dw $412E                                                             ;8DB878;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_28_8DB87A:
    dw $0001,$81F8                                                       ;8DB87A;
    db $F8                                                               ;8DB87E;
    dw $01A4                                                             ;8DB87F;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_29_8DB881:
    dw $0001,$81F8                                                       ;8DB881;
    db $F8                                                               ;8DB885;
    dw $01A2                                                             ;8DB886;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2A_8DB888:
    dw $0001,$81F8                                                       ;8DB888;
    db $F8                                                               ;8DB88C;
    dw $01A0                                                             ;8DB88D;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2B_8DB88F:
    dw $0001,$81F8                                                       ;8DB88F;
    db $F8                                                               ;8DB893;
    dw $81A2                                                             ;8DB894;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2C_8DB896:
    dw $0001,$81F8                                                       ;8DB896;
    db $F8                                                               ;8DB89A;
    dw $81A4                                                             ;8DB89B;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2D_8DB89D:
    dw $0001,$81F8                                                       ;8DB89D;
    db $F8                                                               ;8DB8A1;
    dw $C1A2                                                             ;8DB8A2;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2E_8DB8A4:
    dw $0001,$81F8                                                       ;8DB8A4;
    db $F8                                                               ;8DB8A8;
    dw $41A0                                                             ;8DB8A9;

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2F_8DB8AB:
    dw $0001,$81F8                                                       ;8DB8AB;
    db $F8                                                               ;8DB8AF;
    dw $41A2                                                             ;8DB8B0;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_BotwoonsBody_28:
    dw $0000                                                             ;8DB8B2;

EnemyProjSpritemaps_BotwoonsSpit_0:
    dw $0001,$01FC                                                       ;8DB8B4;
    db $FC                                                               ;8DB8B8;
    dw $33A8                                                             ;8DB8B9;

EnemyProjSpritemaps_BotwoonsSpit_1:
    dw $0001,$01FC                                                       ;8DB8BB;
    db $FC                                                               ;8DB8BF;
    dw $33A9                                                             ;8DB8C0;

EnemyProjSpritemaps_BotwoonsSpit_2:
    dw $0001,$01FC                                                       ;8DB8C2;
    db $FC                                                               ;8DB8C6;
    dw $33AA                                                             ;8DB8C7;

EnemyProjSpritemaps_BotwoonsSpit_3:
    dw $0001,$01FC                                                       ;8DB8C9;
    db $FC                                                               ;8DB8CD;
    dw $33AB                                                             ;8DB8CE;

EnemyProjSpritemaps_BotwoonsSpit_4:
    dw $0001,$01FC                                                       ;8DB8D0;
    db $FC                                                               ;8DB8D4;
    dw $33AC                                                             ;8DB8D5;

EnemyProjSpritemaps_YappingMawsBody_0:
    dw $0001,$81F8                                                       ;8DB8D7;
    db $F8                                                               ;8DB8DB;
    dw $210A                                                             ;8DB8DC;

EnemyProjSpritemaps_YappingMawsBody_1:
    dw $0001,$81F8                                                       ;8DB8DE;
    db $F8                                                               ;8DB8E2;
    dw $A10A                                                             ;8DB8E3;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_0_8DB8E5:
    dw $0003,$81F0                                                       ;8DB8E5;
    db $00                                                               ;8DB8E9;
    dw $3A76,$81F0                                                       ;8DB8EA;
    db $F0                                                               ;8DB8EE;
    dw $3A76,$8000                                                       ;8DB8EF;
    db $F8                                                               ;8DB8F3;
    dw $3A76                                                             ;8DB8F4;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_1_8DB8F6:
    dw $0003,$8004                                                       ;8DB8F6;
    db $F8                                                               ;8DB8FA;
    dw $7A78,$81EC                                                       ;8DB8FB;
    db $04                                                               ;8DB8FF;
    dw $FA78,$81EC                                                       ;8DB900;
    db $EC                                                               ;8DB904;
    dw $3A78                                                             ;8DB905;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_2_8DB907:
    dw $0007,$01EB                                                       ;8DB907;
    db $E2                                                               ;8DB90B;
    dw $3A2B,$800C                                                       ;8DB90C;
    db $F8                                                               ;8DB910;
    dw $7A98,$81E8                                                       ;8DB911;
    db $08                                                               ;8DB915;
    dw $BA98,$81E8                                                       ;8DB916;
    db $E8                                                               ;8DB91A;
    dw $3A98,$000D                                                       ;8DB91B;
    db $E2                                                               ;8DB91F;
    dw $7A2B,$0003                                                       ;8DB920;
    db $03                                                               ;8DB924;
    dw $7A2B,$01F5                                                       ;8DB925;
    db $03                                                               ;8DB929;
    dw $3A2B                                                             ;8DB92A;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_3_8DB92C:
    dw $0007,$01E5                                                       ;8DB92C;
    db $DC                                                               ;8DB930;
    dw $3A2B,$8010                                                       ;8DB931;
    db $F8                                                               ;8DB935;
    dw $7A9E,$81E4                                                       ;8DB936;
    db $0C                                                               ;8DB93A;
    dw $BA9E,$81E4                                                       ;8DB93B;
    db $E4                                                               ;8DB93F;
    dw $3A9E,$0013                                                       ;8DB940;
    db $DC                                                               ;8DB944;
    dw $7A2B,$0007                                                       ;8DB945;
    db $FD                                                               ;8DB949;
    dw $7A2B,$01F1                                                       ;8DB94A;
    db $FD                                                               ;8DB94E;
    dw $3A2B                                                             ;8DB94F;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_4_8DB951:
    dw $0007,$01E3                                                       ;8DB951;
    db $DA                                                               ;8DB955;
    dw $3A2B,$81E0                                                       ;8DB956;
    db $E0                                                               ;8DB95A;
    dw $3A9A,$8014                                                       ;8DB95B;
    db $F8                                                               ;8DB95F;
    dw $7A9A,$81E0                                                       ;8DB960;
    db $10                                                               ;8DB964;
    dw $BA9A,$0015                                                       ;8DB965;
    db $DA                                                               ;8DB969;
    dw $7A2B,$000B                                                       ;8DB96A;
    db $FA                                                               ;8DB96E;
    dw $7A2B,$01ED                                                       ;8DB96F;
    db $FA                                                               ;8DB973;
    dw $3A2B                                                             ;8DB974;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_5_8DB976:
    dw $0007,$01E2                                                       ;8DB976;
    db $DA                                                               ;8DB97A;
    dw $3A2B,$8018                                                       ;8DB97B;
    db $F8                                                               ;8DB97F;
    dw $7A9C,$81DC                                                       ;8DB980;
    db $14                                                               ;8DB984;
    dw $BA9C,$81DC                                                       ;8DB985;
    db $DC                                                               ;8DB989;
    dw $3A9C,$0016                                                       ;8DB98A;
    db $DA                                                               ;8DB98E;
    dw $7A2B,$000E                                                       ;8DB98F;
    db $F9                                                               ;8DB993;
    dw $7A2B,$01EA                                                       ;8DB994;
    db $F9                                                               ;8DB998;
    dw $3A2B                                                             ;8DB999;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_6_8DB99B:
    dw $0004,$0018                                                       ;8DB99B;
    db $DB                                                               ;8DB99F;
    dw $7A2A,$0011                                                       ;8DB9A0;
    db $FC                                                               ;8DB9A4;
    dw $7A2A,$01E7                                                       ;8DB9A5;
    db $FC                                                               ;8DB9A9;
    dw $3A2A,$01E0                                                       ;8DB9AA;
    db $DB                                                               ;8DB9AE;
    dw $3A2A                                                             ;8DB9AF;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_7_8DB9B1:
    dw $0004,$001A                                                       ;8DB9B1;
    db $DC                                                               ;8DB9B5;
    dw $7A2A,$0012                                                       ;8DB9B6;
    db $FC                                                               ;8DB9BA;
    dw $7A2A,$01E6                                                       ;8DB9BB;
    db $FC                                                               ;8DB9BF;
    dw $3A2A,$01DE                                                       ;8DB9C0;
    db $DC                                                               ;8DB9C4;
    dw $3A2A                                                             ;8DB9C5;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_8_8DB9C7:
    dw $0004,$001C                                                       ;8DB9C7;
    db $DD                                                               ;8DB9CB;
    dw $7A29,$0013                                                       ;8DB9CC;
    db $FE                                                               ;8DB9D0;
    dw $7A29,$01E5                                                       ;8DB9D1;
    db $FE                                                               ;8DB9D5;
    dw $3A29,$01DC                                                       ;8DB9D6;
    db $DD                                                               ;8DB9DA;
    dw $3A29                                                             ;8DB9DB;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_9_8DB9DD:
    dw $0004,$001E                                                       ;8DB9DD;
    db $DE                                                               ;8DB9E1;
    dw $7A29,$0014                                                       ;8DB9E2;
    db $00                                                               ;8DB9E6;
    dw $7A29,$01E4                                                       ;8DB9E7;
    db $00                                                               ;8DB9EB;
    dw $3A29,$01DA                                                       ;8DB9EC;
    db $DE                                                               ;8DB9F0;
    dw $3A29                                                             ;8DB9F1;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_A_8DB9F3:
    dw $0004,$001F                                                       ;8DB9F3;
    db $E0                                                               ;8DB9F7;
    dw $7A28,$0015                                                       ;8DB9F8;
    db $02                                                               ;8DB9FC;
    dw $7A28,$01D9                                                       ;8DB9FD;
    db $E0                                                               ;8DBA01;
    dw $3A28,$01E3                                                       ;8DBA02;
    db $02                                                               ;8DBA06;
    dw $3A28                                                             ;8DBA07;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_B_8DBA09:
    dw $0004,$0020                                                       ;8DBA09;
    db $E2                                                               ;8DBA0D;
    dw $7A28,$0016                                                       ;8DBA0E;
    db $04                                                               ;8DBA12;
    dw $7A28,$01D8                                                       ;8DBA13;
    db $E2                                                               ;8DBA17;
    dw $3A28,$01E2                                                       ;8DBA18;
    db $04                                                               ;8DBA1C;
    dw $3A28                                                             ;8DBA1D;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_C_8DBA1F:
    dw $0004,$0021                                                       ;8DBA1F;
    db $E9                                                               ;8DBA23;
    dw $3A28,$0017                                                       ;8DBA24;
    db $0B                                                               ;8DBA28;
    dw $3A28,$01E1                                                       ;8DBA29;
    db $0B                                                               ;8DBA2D;
    dw $3A28,$01D7                                                       ;8DBA2E;
    db $E9                                                               ;8DBA32;
    dw $3A28                                                             ;8DBA33;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_D_8DBA35:
    dw $0004,$0022                                                       ;8DBA35;
    db $F1                                                               ;8DBA39;
    dw $3A28,$0018                                                       ;8DBA3A;
    db $13                                                               ;8DBA3E;
    dw $3A28,$01E0                                                       ;8DBA3F;
    db $13                                                               ;8DBA43;
    dw $3A28,$01D6                                                       ;8DBA44;
    db $F1                                                               ;8DBA48;
    dw $3A28                                                             ;8DBA49;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_E_8DBA4B:
    dw $0004,$0023                                                       ;8DBA4B;
    db $FB                                                               ;8DBA4F;
    dw $3A28,$0019                                                       ;8DBA50;
    db $19                                                               ;8DBA54;
    dw $3A28,$01DF                                                       ;8DBA55;
    db $19                                                               ;8DBA59;
    dw $3A28,$01D5                                                       ;8DBA5A;
    db $FB                                                               ;8DBA5E;
    dw $3A28                                                             ;8DBA5F;

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_F_8DBA61:
    dw $0004,$01D4                                                       ;8DBA61;
    db $06                                                               ;8DBA65;
    dw $3A28,$01DE                                                       ;8DBA66;
    db $24                                                               ;8DBA6A;
    dw $3A28,$001A                                                       ;8DBA6B;
    db $24                                                               ;8DBA6F;
    dw $3A28,$0024                                                       ;8DBA70;
    db $06                                                               ;8DBA74;
    dw $3A28                                                             ;8DBA75;

UNUSED_EnemyProjSpritemaps_0_8DBA77:
    dw $0001,$01F7                                                       ;8DBA77;
    db $F7                                                               ;8DBA7B;
    dw $3A48                                                             ;8DBA7C;

UNUSED_EnemyProjSpritemaps_1_8DBA7E:
    dw $0002,$0001                                                       ;8DBA7E;
    db $01                                                               ;8DBA82;
    dw $3A48,$81F3                                                       ;8DBA83;
    db $F3                                                               ;8DBA87;
    dw $3A7C                                                             ;8DBA88;

UNUSED_EnemyProjSpritemaps_2_8DBA8A:
    dw $0003,$81FD                                                       ;8DBA8A;
    db $FD                                                               ;8DBA8E;
    dw $3A7C,$01F7                                                       ;8DBA8F;
    db $01                                                               ;8DBA93;
    dw $3A48,$81F3                                                       ;8DBA94;
    db $F3                                                               ;8DBA98;
    dw $3A7E                                                             ;8DBA99;

UNUSED_EnemyProjSpritemaps_3_8DBA9B:
    dw $0004,$0001                                                       ;8DBA9B;
    db $F7                                                               ;8DBA9F;
    dw $3A48,$81FD                                                       ;8DBAA0;
    db $FD                                                               ;8DBAA4;
    dw $3A7E,$81F3                                                       ;8DBAA5;
    db $FD                                                               ;8DBAA9;
    dw $3A7C,$81F3                                                       ;8DBAAA;
    db $F3                                                               ;8DBAAE;
    dw $3A9A                                                             ;8DBAAF;

UNUSED_EnemyProjSpritemaps_4_8DBAB1:
    dw $0004,$81FD                                                       ;8DBAB1;
    db $F3                                                               ;8DBAB5;
    dw $3A7C,$81FD                                                       ;8DBAB6;
    db $FD                                                               ;8DBABA;
    dw $3A9A,$81F3                                                       ;8DBABB;
    db $FD                                                               ;8DBABF;
    dw $3A7E,$81F3                                                       ;8DBAC0;
    db $F3                                                               ;8DBAC4;
    dw $3A9C                                                             ;8DBAC5;

UNUSED_EnemyProjSpritemaps_5_8DBAC7:
    dw $0003,$81FD                                                       ;8DBAC7;
    db $F3                                                               ;8DBACB;
    dw $3A7E,$81FD                                                       ;8DBACC;
    db $FD                                                               ;8DBAD0;
    dw $3A9C,$81F3                                                       ;8DBAD1;
    db $FD                                                               ;8DBAD5;
    dw $3A9A                                                             ;8DBAD6;

UNUSED_EnemyProjSpritemaps_6_8DBAD8:
    dw $0002,$81FD                                                       ;8DBAD8;
    db $F3                                                               ;8DBADC;
    dw $3A9A,$81F3                                                       ;8DBADD;
    db $FD                                                               ;8DBAE1;
    dw $3A9C                                                             ;8DBAE2;

UNUSED_EnemyProjSpritemaps_7_8DBAE4:
    dw $0001,$81FD                                                       ;8DBAE4;
    db $F3                                                               ;8DBAE8;
    dw $3A9C                                                             ;8DBAE9;

UNUSED_EnemyProjSpritemaps_8_8DBAEB:
    dw $0001,$01FC                                                       ;8DBAEB;
    db $FC                                                               ;8DBAEF;
    dw $3A6B                                                             ;8DBAF0;

UNUSED_EnemyProjSpritemaps_9_8DBAF2:
    dw $0001,$01FC                                                       ;8DBAF2;
    db $FC                                                               ;8DBAF6;
    dw $3A6C                                                             ;8DBAF7;

UNUSED_EnemyProjSpritemaps_A_8DBAF9:
    dw $0002,$01F8                                                       ;8DBAF9;
    db $FC                                                               ;8DBAFD;
    dw $3A6B,$0000                                                       ;8DBAFE;
    db $FC                                                               ;8DBB02;
    dw $3A6B                                                             ;8DBB03;

UNUSED_EnemyProjSpritemaps_B_8DBB05:
    dw $0002,$01F8                                                       ;8DBB05;
    db $FC                                                               ;8DBB09;
    dw $3A6C,$0000                                                       ;8DBB0A;
    db $FC                                                               ;8DBB0E;
    dw $3A6C                                                             ;8DBB0F;

UNUSED_EnemyProjSpritemaps_C_8DBB11:
    dw $0003,$01F4                                                       ;8DBB11;
    db $FC                                                               ;8DBB15;
    dw $3A6C,$0004                                                       ;8DBB16;
    db $FC                                                               ;8DBB1A;
    dw $3A6C,$01FC                                                       ;8DBB1B;
    db $FC                                                               ;8DBB1F;
    dw $3A6C                                                             ;8DBB20;

UNUSED_EnemyProjSpritemaps_D_8DBB22:
    dw $0003,$0004                                                       ;8DBB22;
    db $FC                                                               ;8DBB26;
    dw $3A6B,$01F4                                                       ;8DBB27;
    db $FC                                                               ;8DBB2B;
    dw $3A6B,$01FC                                                       ;8DBB2C;
    db $FC                                                               ;8DBB30;
    dw $3A6B                                                             ;8DBB31;

UNUSED_EnemyProjSpritemaps_E_8DBB33:
    dw $0004,$0008                                                       ;8DBB33;
    db $FC                                                               ;8DBB37;
    dw $3A6C,$0000                                                       ;8DBB38;
    db $FC                                                               ;8DBB3C;
    dw $3A6C,$01F8                                                       ;8DBB3D;
    db $FC                                                               ;8DBB41;
    dw $3A6C,$01F0                                                       ;8DBB42;
    db $FC                                                               ;8DBB46;
    dw $3A6C                                                             ;8DBB47;

UNUSED_EnemyProjSpritemaps_F_8DBB49:
    dw $0004,$0008                                                       ;8DBB49;
    db $FC                                                               ;8DBB4D;
    dw $3A6B,$0000                                                       ;8DBB4E;
    db $FC                                                               ;8DBB52;
    dw $3A6B,$01F8                                                       ;8DBB53;
    db $FC                                                               ;8DBB57;
    dw $3A6B,$01F0                                                       ;8DBB58;
    db $FC                                                               ;8DBB5C;
    dw $3A6B                                                             ;8DBB5D;

UNUSED_EnemyProjSpritemaps_10_8DBB5F:
    dw $0001,$01FC                                                       ;8DBB5F;
    db $FC                                                               ;8DBB63;
    dw $3A25                                                             ;8DBB64;

UNUSED_EnemyProjSpritemaps_11_8DBB66:
    dw $0003,$0000                                                       ;8DBB66;
    db $F8                                                               ;8DBB6A;
    dw $3A25,$01FA                                                       ;8DBB6B;
    db $F6                                                               ;8DBB6F;
    dw $3A25,$01FC                                                       ;8DBB70;
    db $FB                                                               ;8DBB74;
    dw $3A25                                                             ;8DBB75;

UNUSED_EnemyProjSpritemaps_12_8DBB77:
    dw $0003,$0001                                                       ;8DBB77;
    db $F7                                                               ;8DBB7B;
    dw $3A25,$01F9                                                       ;8DBB7C;
    db $F4                                                               ;8DBB80;
    dw $3A25,$01FB                                                       ;8DBB81;
    db $FA                                                               ;8DBB85;
    dw $3A25                                                             ;8DBB86;

UNUSED_EnemyProjSpritemaps_13_8DBB88:
    dw $0003,$0001                                                       ;8DBB88;
    db $F5                                                               ;8DBB8C;
    dw $3A43,$01FC                                                       ;8DBB8D;
    db $F8                                                               ;8DBB91;
    dw $3A43,$01FA                                                       ;8DBB92;
    db $F1                                                               ;8DBB96;
    dw $3A43                                                             ;8DBB97;

UNUSED_EnemyProjSpritemaps_14_8DBB99:
    dw $0003,$0001                                                       ;8DBB99;
    db $F3                                                               ;8DBB9D;
    dw $3A43,$01FC                                                       ;8DBB9E;
    db $F5                                                               ;8DBBA2;
    dw $3A43,$01FA                                                       ;8DBBA3;
    db $EE                                                               ;8DBBA7;
    dw $3A43                                                             ;8DBBA8;

UNUSED_EnemyProjSpritemaps_15_8DBBAA:
    dw $0003,$0000                                                       ;8DBBAA;
    db $F0                                                               ;8DBBAE;
    dw $3A40,$01FC                                                       ;8DBBAF;
    db $F4                                                               ;8DBBB3;
    dw $3A40,$01FA                                                       ;8DBBB4;
    db $ED                                                               ;8DBBB8;
    dw $3A40                                                             ;8DBBB9;

UNUSED_EnemyProjSpritemaps_16_8DBBBB:
    dw $0003,$0000                                                       ;8DBBBB;
    db $EE                                                               ;8DBBBF;
    dw $3A40,$01FC                                                       ;8DBBC0;
    db $F2                                                               ;8DBBC4;
    dw $3A40,$01FA                                                       ;8DBBC5;
    db $EC                                                               ;8DBBC9;
    dw $3A40                                                             ;8DBBCA;

UNUSED_EnemyProjSpritemaps_17_8DBBCC:
    dw $0002,$0000                                                       ;8DBBCC;
    db $EC                                                               ;8DBBD0;
    dw $3A40,$01FC                                                       ;8DBBD1;
    db $F0                                                               ;8DBBD5;
    dw $3A40                                                             ;8DBBD6;

UNUSED_EnemyProjSpritemaps_18_8DBBD8:
    dw $0001,$01FC                                                       ;8DBBD8;
    db $EE                                                               ;8DBBDC;
    dw $3A40                                                             ;8DBBDD;

UNUSED_EnemyProjSpritemaps_19_8DBBDF:
    dw $0004,$0008                                                       ;8DBBDF;
    db $E0                                                               ;8DBBE3;
    dw $3A6F,$0000                                                       ;8DBBE4;
    db $E0                                                               ;8DBBE8;
    dw $3A6F,$01F8                                                       ;8DBBE9;
    db $E0                                                               ;8DBBED;
    dw $3A6F,$01F0                                                       ;8DBBEE;
    db $E0                                                               ;8DBBF2;
    dw $3A6F                                                             ;8DBBF3;

UNUSED_EnemyProjSpritemaps_1A_8DBBF5:
    dw $0004,$0008                                                       ;8DBBF5;
    db $E8                                                               ;8DBBF9;
    dw $3A6F,$0000                                                       ;8DBBFA;
    db $E8                                                               ;8DBBFE;
    dw $3A6F,$01F8                                                       ;8DBBFF;
    db $E8                                                               ;8DBC03;
    dw $3A6F,$01F0                                                       ;8DBC04;
    db $E8                                                               ;8DBC08;
    dw $3A6F                                                             ;8DBC09;

UNUSED_EnemyProjSpritemaps_1B_8DBC0B:
    dw $0004,$0008                                                       ;8DBC0B;
    db $F0                                                               ;8DBC0F;
    dw $3A6F,$0000                                                       ;8DBC10;
    db $F0                                                               ;8DBC14;
    dw $3A6F,$01F8                                                       ;8DBC15;
    db $F0                                                               ;8DBC19;
    dw $3A6F,$01F0                                                       ;8DBC1A;
    db $F0                                                               ;8DBC1E;
    dw $3A6F                                                             ;8DBC1F;

UNUSED_EnemyProjSpritemaps_1C_8DBC21:
    dw $0004,$0008                                                       ;8DBC21;
    db $F8                                                               ;8DBC25;
    dw $3A6F,$0000                                                       ;8DBC26;
    db $F8                                                               ;8DBC2A;
    dw $3A6F,$01F8                                                       ;8DBC2B;
    db $F8                                                               ;8DBC2F;
    dw $3A6F,$01F0                                                       ;8DBC30;
    db $F8                                                               ;8DBC34;
    dw $3A6F                                                             ;8DBC35;

UNUSED_EnemyProjSpritemaps_1D_8DBC37:
    dw $0004,$0008                                                       ;8DBC37;
    db $00                                                               ;8DBC3B;
    dw $3A6F,$0000                                                       ;8DBC3C;
    db $00                                                               ;8DBC40;
    dw $3A6F,$01F8                                                       ;8DBC41;
    db $00                                                               ;8DBC45;
    dw $3A6F,$01F0                                                       ;8DBC46;
    db $00                                                               ;8DBC4A;
    dw $3A6F                                                             ;8DBC4B;

UNUSED_EnemyProjSpritemaps_1E_8DBC4D:
    dw $0004,$0008                                                       ;8DBC4D;
    db $08                                                               ;8DBC51;
    dw $3A6F,$0000                                                       ;8DBC52;
    db $08                                                               ;8DBC56;
    dw $3A6F,$01F8                                                       ;8DBC57;
    db $08                                                               ;8DBC5B;
    dw $3A6F,$01F0                                                       ;8DBC5C;
    db $08                                                               ;8DBC60;
    dw $3A6F                                                             ;8DBC61;

UNUSED_EnemyProjSpritemaps_1F_8DBC63:
    dw $0004,$0008                                                       ;8DBC63;
    db $10                                                               ;8DBC67;
    dw $3A6F,$0000                                                       ;8DBC68;
    db $10                                                               ;8DBC6C;
    dw $3A6F,$01F8                                                       ;8DBC6D;
    db $10                                                               ;8DBC71;
    dw $3A6F,$01F0                                                       ;8DBC72;
    db $10                                                               ;8DBC76;
    dw $3A6F                                                             ;8DBC77;

UNUSED_EnemyProjSpritemaps_20_8DBC79:
    dw $0004,$0008                                                       ;8DBC79;
    db $18                                                               ;8DBC7D;
    dw $3A6F,$0000                                                       ;8DBC7E;
    db $18                                                               ;8DBC82;
    dw $3A6F,$01F8                                                       ;8DBC83;
    db $18                                                               ;8DBC87;
    dw $3A6F,$01F0                                                       ;8DBC88;
    db $18                                                               ;8DBC8C;
    dw $3A6F                                                             ;8DBC8D;

UNUSED_EnemyProjSpritemaps_21_8DBC8F:
    dw $0002,$0000                                                       ;8DBC8F;
    db $FC                                                               ;8DBC93;
    dw $3ABF,$01F8                                                       ;8DBC94;
    db $FC                                                               ;8DBC98;
    dw $3ABE                                                             ;8DBC99;

UNUSED_EnemyProjSpritemaps_22_8DBC9B:
    dw $0001,$81F8                                                       ;8DBC9B;
    db $F8                                                               ;8DBC9F;
    dw $3ABE                                                             ;8DBCA0;

UNUSED_EnemyProjSpritemaps_23_8DBCA2:
    dw $0002,$81F8                                                       ;8DBCA2;
    db $FC                                                               ;8DBCA6;
    dw $3ABE,$81F8                                                       ;8DBCA7;
    db $F4                                                               ;8DBCAB;
    dw $3ABE                                                             ;8DBCAC;

UNUSED_EnemyProjSpritemaps_24_8DBCAE:
    dw $0002,$81F8                                                       ;8DBCAE;
    db $00                                                               ;8DBCB2;
    dw $3ABE,$81F8                                                       ;8DBCB3;
    db $F0                                                               ;8DBCB7;
    dw $3ABE                                                             ;8DBCB8;

UNUSED_EnemyProjSpritemaps_25_8DBCBA:
    dw $0003,$81F8                                                       ;8DBCBA;
    db $04                                                               ;8DBCBE;
    dw $3ABE,$81F8                                                       ;8DBCBF;
    db $F8                                                               ;8DBCC3;
    dw $3ABE,$81F8                                                       ;8DBCC4;
    db $EC                                                               ;8DBCC8;
    dw $3ABE                                                             ;8DBCC9;

UNUSED_EnemyProjSpritemaps_26_8DBCCB:
    dw $0003,$81F8                                                       ;8DBCCB;
    db $08                                                               ;8DBCCF;
    dw $3ABE,$81F8                                                       ;8DBCD0;
    db $F8                                                               ;8DBCD4;
    dw $3ABE,$81F8                                                       ;8DBCD5;
    db $E8                                                               ;8DBCD9;
    dw $3ABE                                                             ;8DBCDA;

UNUSED_EnemyProjSpritemaps_27_8DBCDC:
    dw $0004,$81F8                                                       ;8DBCDC;
    db $0C                                                               ;8DBCE0;
    dw $3ABE,$81F8                                                       ;8DBCE1;
    db $00                                                               ;8DBCE5;
    dw $3ABE,$81F8                                                       ;8DBCE6;
    db $F0                                                               ;8DBCEA;
    dw $3ABE,$81F8                                                       ;8DBCEB;
    db $E4                                                               ;8DBCEF;
    dw $3ABE                                                             ;8DBCF0;

UNUSED_EnemyProjSpritemaps_28_8DBCF2:
    dw $0004,$81F8                                                       ;8DBCF2;
    db $10                                                               ;8DBCF6;
    dw $3ABE,$81F8                                                       ;8DBCF7;
    db $00                                                               ;8DBCFB;
    dw $3ABE,$81F8                                                       ;8DBCFC;
    db $F0                                                               ;8DBD00;
    dw $3ABE,$81F8                                                       ;8DBD01;
    db $E0                                                               ;8DBD05;
    dw $3ABE                                                             ;8DBD06;

UNUSED_EnemyProjSpritemaps_29_8DBD08:
    dw $0001,$01FC                                                       ;8DBD08;
    db $FC                                                               ;8DBD0C;
    dw $3C53                                                             ;8DBD0D;

UNUSED_EnemyProjSpritemaps_2A_8DBD0F:
    dw $0001,$01FC                                                       ;8DBD0F;
    db $FC                                                               ;8DBD13;
    dw $3C52                                                             ;8DBD14;

UNUSED_EnemyProjSpritemaps_2B_8DBD16:
    dw $0001,$01FC                                                       ;8DBD16;
    db $FC                                                               ;8DBD1A;
    dw $3C51                                                             ;8DBD1B;

UNUSED_EnemyProjSpritemaps_2C_8DBD1D:
    dw $0004,$01F8                                                       ;8DBD1D;
    db $00                                                               ;8DBD21;
    dw $BC50,$0000                                                       ;8DBD22;
    db $00                                                               ;8DBD26;
    dw $FC50,$0000                                                       ;8DBD27;
    db $F8                                                               ;8DBD2B;
    dw $7C50,$01F8                                                       ;8DBD2C;
    db $F8                                                               ;8DBD30;
    dw $3C50                                                             ;8DBD31;

UNUSED_EnemyProjSpritemaps_2D_8DBD33:
    dw $0003,$0000                                                       ;8DBD33;
    db $0C                                                               ;8DBD37;
    dw $3A5B,$0008                                                       ;8DBD38;
    db $EC                                                               ;8DBD3C;
    dw $3A5B,$01F0                                                       ;8DBD3D;
    db $F4                                                               ;8DBD41;
    dw $3A5B                                                             ;8DBD42;

UNUSED_EnemyProjSpritemaps_2E_8DBD44:
    dw $0003,$01FD                                                       ;8DBD44;
    db $0A                                                               ;8DBD48;
    dw $3A5C,$0006                                                       ;8DBD49;
    db $EE                                                               ;8DBD4D;
    dw $3A5C,$01F2                                                       ;8DBD4E;
    db $F6                                                               ;8DBD52;
    dw $3A5C                                                             ;8DBD53;

UNUSED_EnemyProjSpritemaps_2F_8DBD55:
    dw $0003,$01FC                                                       ;8DBD55;
    db $08                                                               ;8DBD59;
    dw $3A5C,$0004                                                       ;8DBD5A;
    db $F0                                                               ;8DBD5E;
    dw $3A5C,$01F4                                                       ;8DBD5F;
    db $F8                                                               ;8DBD63;
    dw $3A5C                                                             ;8DBD64;

UNUSED_EnemyProjSpritemaps_30_8DBD66:
    dw $0003,$0002                                                       ;8DBD66;
    db $F2                                                               ;8DBD6A;
    dw $3A5D,$01FB                                                       ;8DBD6B;
    db $06                                                               ;8DBD6F;
    dw $3A5D,$01F6                                                       ;8DBD70;
    db $FA                                                               ;8DBD74;
    dw $3A5D                                                             ;8DBD75;

UNUSED_EnemyProjSpritemaps_31_8DBD77:
    dw $0003,$01FB                                                       ;8DBD77;
    db $04                                                               ;8DBD7B;
    dw $3A5D,$01F8                                                       ;8DBD7C;
    db $FB                                                               ;8DBD80;
    dw $3A5D,$0000                                                       ;8DBD81;
    db $F4                                                               ;8DBD85;
    dw $3A5D                                                             ;8DBD86;

UNUSED_EnemyProjSpritemaps_32_8DBD88:
    dw $0003,$01FB                                                       ;8DBD88;
    db $02                                                               ;8DBD8C;
    dw $3A5D,$01FA                                                       ;8DBD8D;
    db $FA                                                               ;8DBD91;
    dw $3A5D,$0000                                                       ;8DBD92;
    db $F6                                                               ;8DBD96;
    dw $3A5D                                                             ;8DBD97;

UNUSED_EnemyProjSpritemaps_33_8DBD99:
    dw $0003,$0000                                                       ;8DBD99;
    db $EC                                                               ;8DBD9D;
    dw $BA5B,$0008                                                       ;8DBD9E;
    db $0C                                                               ;8DBDA2;
    dw $BA5B,$01F0                                                       ;8DBDA3;
    db $04                                                               ;8DBDA7;
    dw $BA5B                                                             ;8DBDA8;

UNUSED_EnemyProjSpritemaps_34_8DBDAA:
    dw $0003,$01FE                                                       ;8DBDAA;
    db $EE                                                               ;8DBDAE;
    dw $BA5C,$0006                                                       ;8DBDAF;
    db $0A                                                               ;8DBDB3;
    dw $BA5C,$01F2                                                       ;8DBDB4;
    db $02                                                               ;8DBDB8;
    dw $BA5C                                                             ;8DBDB9;

UNUSED_EnemyProjSpritemaps_35_8DBDBB:
    dw $0003,$0004                                                       ;8DBDBB;
    db $08                                                               ;8DBDBF;
    dw $BA5C,$01F4                                                       ;8DBDC0;
    db $00                                                               ;8DBDC4;
    dw $BA5C,$01FD                                                       ;8DBDC5;
    db $F0                                                               ;8DBDC9;
    dw $BA5C                                                             ;8DBDCA;

UNUSED_EnemyProjSpritemaps_36_8DBDCC:
    dw $0003,$0002                                                       ;8DBDCC;
    db $06                                                               ;8DBDD0;
    dw $BA5D,$01FC                                                       ;8DBDD1;
    db $F2                                                               ;8DBDD5;
    dw $BA5D,$01F6                                                       ;8DBDD6;
    db $FE                                                               ;8DBDDA;
    dw $BA5D                                                             ;8DBDDB;

UNUSED_EnemyProjSpritemaps_37_8DBDDD:
    dw $0003,$01FC                                                       ;8DBDDD;
    db $F4                                                               ;8DBDE1;
    dw $BA5D,$01F8                                                       ;8DBDE2;
    db $FC                                                               ;8DBDE6;
    dw $BA5D,$0000                                                       ;8DBDE7;
    db $04                                                               ;8DBDEB;
    dw $BA5D                                                             ;8DBDEC;

UNUSED_EnemyProjSpritemaps_38_8DBDEE:
    dw $0003,$01FC                                                       ;8DBDEE;
    db $F6                                                               ;8DBDF2;
    dw $BA5D,$01FA                                                       ;8DBDF3;
    db $FD                                                               ;8DBDF7;
    dw $BA5D,$0000                                                       ;8DBDF8;
    db $02                                                               ;8DBDFC;
    dw $BA5D                                                             ;8DBDFD;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_EnemyDeathExplosion_0:
    dw $0001,$01FC                                                       ;8DBDFF;
    db $FC                                                               ;8DBE03;
    dw $3A5F                                                             ;8DBE04;

EnemyProjSpritemaps_EnemyDeathExplosion_1:
    dw $0004,$0000                                                       ;8DBE06;
    db $00                                                               ;8DBE0A;
    dw $FA8A,$01F8                                                       ;8DBE0B;
    db $00                                                               ;8DBE0F;
    dw $BA8A,$0000                                                       ;8DBE10;
    db $F8                                                               ;8DBE14;
    dw $7A8A,$01F8                                                       ;8DBE15;
    db $F8                                                               ;8DBE19;
    dw $3A8A                                                             ;8DBE1A;

EnemyProjSpritemaps_EnemyDeathExplosion_2:
    dw $0004,$8000                                                       ;8DBE1C;
    db $00                                                               ;8DBE20;
    dw $FA90,$81F0                                                       ;8DBE21;
    db $00                                                               ;8DBE25;
    dw $BA90,$8000                                                       ;8DBE26;
    db $F0                                                               ;8DBE2A;
    dw $7A90,$81F0                                                       ;8DBE2B;
    db $F0                                                               ;8DBE2F;
    dw $3A90                                                             ;8DBE30;

EnemyProjSpritemaps_EnemyDeathExplosion_3:
    dw $0004,$8000                                                       ;8DBE32;
    db $00                                                               ;8DBE36;
    dw $FA92,$81F0                                                       ;8DBE37;
    db $00                                                               ;8DBE3B;
    dw $BA92,$8000                                                       ;8DBE3C;
    db $F0                                                               ;8DBE40;
    dw $7A92,$81F0                                                       ;8DBE41;
    db $F0                                                               ;8DBE45;
    dw $3A92                                                             ;8DBE46;

EnemyProjSpritemaps_EnemyDeathExplosion_4:
    dw $0004,$8000                                                       ;8DBE48;
    db $00                                                               ;8DBE4C;
    dw $FA94,$81F0                                                       ;8DBE4D;
    db $00                                                               ;8DBE51;
    dw $BA94,$8000                                                       ;8DBE52;
    db $F0                                                               ;8DBE56;
    dw $7A94,$81F0                                                       ;8DBE57;
    db $F0                                                               ;8DBE5B;
    dw $3A94                                                             ;8DBE5C;

EnemyProjSpritemaps_EnemyDeathExplosion_5:
    dw $0004,$8000                                                       ;8DBE5E;
    db $00                                                               ;8DBE62;
    dw $FA96,$81F0                                                       ;8DBE63;
    db $00                                                               ;8DBE67;
    dw $BA96,$8000                                                       ;8DBE68;
    db $F0                                                               ;8DBE6C;
    dw $7A96,$81F0                                                       ;8DBE6D;
    db $F0                                                               ;8DBE71;
    dw $3A96                                                             ;8DBE72;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DBE74:
    dw $0004,$0000                                                       ;8DBE74;
    db $00                                                               ;8DBE78;
    dw $FA8B,$01F8                                                       ;8DBE79;
    db $00                                                               ;8DBE7D;
    dw $BA8B,$0000                                                       ;8DBE7E;
    db $F8                                                               ;8DBE82;
    dw $7A8B,$01F8                                                       ;8DBE83;
    db $F8                                                               ;8DBE87;
    dw $3A8B                                                             ;8DBE88;

UNUSED_EnemyProjSpritemaps_1_8DBE8A:
    dw $0004,$0000                                                       ;8DBE8A;
    db $00                                                               ;8DBE8E;
    dw $FA7A,$01F8                                                       ;8DBE8F;
    db $00                                                               ;8DBE93;
    dw $BA7A,$0000                                                       ;8DBE94;
    db $F8                                                               ;8DBE98;
    dw $7A7A,$01F8                                                       ;8DBE99;
    db $F8                                                               ;8DBE9D;
    dw $3A7A                                                             ;8DBE9E;

UNUSED_EnemyProjSpritemaps_2_8DBEA0:
    dw $0004,$8000                                                       ;8DBEA0;
    db $00                                                               ;8DBEA4;
    dw $FA70,$81F0                                                       ;8DBEA5;
    db $00                                                               ;8DBEA9;
    dw $BA70,$8000                                                       ;8DBEAA;
    db $F0                                                               ;8DBEAE;
    dw $7A70,$81F0                                                       ;8DBEAF;
    db $F0                                                               ;8DBEB3;
    dw $3A70                                                             ;8DBEB4;

UNUSED_EnemyProjSpritemaps_3_8DBEB6:
    dw $0004,$8000                                                       ;8DBEB6;
    db $00                                                               ;8DBEBA;
    dw $FA72,$81F0                                                       ;8DBEBB;
    db $00                                                               ;8DBEBF;
    dw $BA72,$8000                                                       ;8DBEC0;
    db $F0                                                               ;8DBEC4;
    dw $7A72,$81F0                                                       ;8DBEC5;
    db $F0                                                               ;8DBEC9;
    dw $3A72                                                             ;8DBECA;

UNUSED_EnemyProjSpritemaps_4_8DBECC:
    dw $0004,$8000                                                       ;8DBECC;
    db $00                                                               ;8DBED0;
    dw $FA74,$81F0                                                       ;8DBED1;
    db $00                                                               ;8DBED5;
    dw $BA74,$8000                                                       ;8DBED6;
    db $F0                                                               ;8DBEDA;
    dw $7A74,$81F0                                                       ;8DBEDB;
    db $F0                                                               ;8DBEDF;
    dw $3A74                                                             ;8DBEE0;

UNUSED_EnemyProjSpritemaps_5_8DBEE2:
    dw $0004,$01F8                                                       ;8DBEE2;
    db $00                                                               ;8DBEE6;
    dw $3A5E,$0000                                                       ;8DBEE7;
    db $00                                                               ;8DBEEB;
    dw $3A5E,$0000                                                       ;8DBEEC;
    db $F8                                                               ;8DBEF0;
    dw $3A5E,$01F8                                                       ;8DBEF1;
    db $F8                                                               ;8DBEF5;
    dw $3A5E                                                             ;8DBEF6;

UNUSED_EnemyProjSpritemaps_6_8DBEF8:
    dw $0001,$01FC                                                       ;8DBEF8;
    db $FC                                                               ;8DBEFC;
    dw $3C38                                                             ;8DBEFD;

UNUSED_EnemyProjSpritemaps_7_8DBEFF:
    dw $0001,$01FC                                                       ;8DBEFF;
    db $FC                                                               ;8DBF03;
    dw $3C39                                                             ;8DBF04;

UNUSED_EnemyProjSpritemaps_8_8DBF06:
    dw $0001,$01FC                                                       ;8DBF06;
    db $FC                                                               ;8DBF0A;
    dw $3C3A                                                             ;8DBF0B;

UNUSED_EnemyProjSpritemaps_9_8DBF0D:
    dw $0001,$01FC                                                       ;8DBF0D;
    db $FC                                                               ;8DBF11;
    dw $3C3B                                                             ;8DBF12;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_0:
    dw $0001,$01FC                                                       ;8DBF14;
    db $FC                                                               ;8DBF18;
    dw $3A26                                                             ;8DBF19;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_1:
    dw $0001,$01FC                                                       ;8DBF1B;
    db $FC                                                               ;8DBF1F;
    dw $3A27                                                             ;8DBF20;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_2:
    dw $0001,$01FC                                                       ;8DBF22;
    db $FC                                                               ;8DBF26;
    dw $3A7B                                                             ;8DBF27;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_3:
    dw $0001,$01FC                                                       ;8DBF29;
    db $FC                                                               ;8DBF2D;
    dw $307B                                                             ;8DBF2E;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DBF30:
    dw $0001,$01FC                                                       ;8DBF30;
    db $FC                                                               ;8DBF34;
    dw $3A5F                                                             ;8DBF35;

UNUSED_EnemyProjSpritemaps_1_8DBF37:
    dw $0001,$01FC                                                       ;8DBF37;
    db $FC                                                               ;8DBF3B;
    dw $3C53                                                             ;8DBF3C;

UNUSED_EnemyProjSpritemaps_2_8DBF3E:
    dw $0001,$01FC                                                       ;8DBF3E;
    db $FC                                                               ;8DBF42;
    dw $3C51                                                             ;8DBF43;

UNUSED_EnemyProjSpritemaps_3_8DBF45:
    dw $0004,$0000                                                       ;8DBF45;
    db $00                                                               ;8DBF49;
    dw $FC60,$0000                                                       ;8DBF4A;
    db $F8                                                               ;8DBF4E;
    dw $7C60,$01F8                                                       ;8DBF4F;
    db $00                                                               ;8DBF53;
    dw $BC60,$01F8                                                       ;8DBF54;
    db $F8                                                               ;8DBF58;
    dw $3C60                                                             ;8DBF59;

UNUSED_EnemyProjSpritemaps_4_8DBF5B:
    dw $0004,$0000                                                       ;8DBF5B;
    db $00                                                               ;8DBF5F;
    dw $FC61,$0000                                                       ;8DBF60;
    db $F8                                                               ;8DBF64;
    dw $7C61,$01F8                                                       ;8DBF65;
    db $00                                                               ;8DBF69;
    dw $BC61,$01F8                                                       ;8DBF6A;
    db $F8                                                               ;8DBF6E;
    dw $3C61                                                             ;8DBF6F;

UNUSED_EnemyProjSpritemaps_5_8DBF71:
    dw $0004,$0000                                                       ;8DBF71;
    db $00                                                               ;8DBF75;
    dw $FC62,$0000                                                       ;8DBF76;
    db $F8                                                               ;8DBF7A;
    dw $7C62,$01F8                                                       ;8DBF7B;
    db $00                                                               ;8DBF7F;
    dw $BC62,$01F8                                                       ;8DBF80;
    db $F8                                                               ;8DBF84;
    dw $3C62                                                             ;8DBF85;

UNUSED_EnemyProjSpritemaps_6_8DBF87:
    dw $0004,$0000                                                       ;8DBF87;
    db $00                                                               ;8DBF8B;
    dw $FC63,$0000                                                       ;8DBF8C;
    db $F8                                                               ;8DBF90;
    dw $7C63,$01F8                                                       ;8DBF91;
    db $00                                                               ;8DBF95;
    dw $BC63,$01F8                                                       ;8DBF96;
    db $F8                                                               ;8DBF9A;
    dw $3C63                                                             ;8DBF9B;

UNUSED_EnemyProjSpritemaps_7_8DBF9D:
    dw $0004,$01F2                                                       ;8DBF9D;
    db $FC                                                               ;8DBFA1;
    dw $7A6C,$0006                                                       ;8DBFA2;
    db $FC                                                               ;8DBFA6;
    dw $7A6C,$0000                                                       ;8DBFA7;
    db $FC                                                               ;8DBFAB;
    dw $7A6C,$01F8                                                       ;8DBFAC;
    db $FC                                                               ;8DBFB0;
    dw $3A6C                                                             ;8DBFB1;

UNUSED_EnemyProjSpritemaps_8_8DBFB3:
    dw $0004,$0000                                                       ;8DBFB3;
    db $FC                                                               ;8DBFB7;
    dw $7A6E,$0008                                                       ;8DBFB8;
    db $FC                                                               ;8DBFBC;
    dw $7A6D,$01F8                                                       ;8DBFBD;
    db $FC                                                               ;8DBFC1;
    dw $3A6E,$01F0                                                       ;8DBFC2;
    db $FC                                                               ;8DBFC6;
    dw $3A6D                                                             ;8DBFC7;

UNUSED_EnemyProjSpritemaps_9_8DBFC9:
    dw $0004,$01F0                                                       ;8DBFC9;
    db $FE                                                               ;8DBFCD;
    dw $3A6F,$0008                                                       ;8DBFCE;
    db $FE                                                               ;8DBFD2;
    dw $3A6F,$0000                                                       ;8DBFD3;
    db $FE                                                               ;8DBFD7;
    dw $3A6F,$01F8                                                       ;8DBFD8;
    db $FE                                                               ;8DBFDC;
    dw $3A6F                                                             ;8DBFDD;

UNUSED_EnemyProjSpritemaps_A_8DBFDF:
    dw $0001,$81F8                                                       ;8DBFDF;
    db $F8                                                               ;8DBFE3;
    dw $3A7C                                                             ;8DBFE4;

UNUSED_EnemyProjSpritemaps_B_8DBFE6:
    dw $0001,$81F8                                                       ;8DBFE6;
    db $F6                                                               ;8DBFEA;
    dw $3A7E                                                             ;8DBFEB;

UNUSED_EnemyProjSpritemaps_C_8DBFED:
    dw $0001,$81F8                                                       ;8DBFED;
    db $F4                                                               ;8DBFF1;
    dw $3A9A                                                             ;8DBFF2;

UNUSED_EnemyProjSpritemaps_D_8DBFF4:
    dw $0001,$81F8                                                       ;8DBFF4;
    db $F2                                                               ;8DBFF8;
    dw $3A9C                                                             ;8DBFF9;

UNUSED_EnemyProjSpritemaps_E_8DBFFB:
    dw $0001,$01FC                                                       ;8DBFFB;
    db $FC                                                               ;8DBFFF;
    dw $3A48                                                             ;8DC000;

UNUSED_EnemyProjSpritemaps_F_8DC002:
    dw $0001,$01FC                                                       ;8DC002;
    db $FA                                                               ;8DC006;
    dw $3A49                                                             ;8DC007;

UNUSED_EnemyProjSpritemaps_10_8DC009:
    dw $0001,$01FC                                                       ;8DC009;
    db $F8                                                               ;8DC00D;
    dw $3A4A                                                             ;8DC00E;

UNUSED_EnemyProjSpritemaps_11_8DC010:
    dw $0001,$01FC                                                       ;8DC010;
    db $F6                                                               ;8DC014;
    dw $3A4B                                                             ;8DC015;

UNUSED_EnemyProjSpritemaps_12_8DC017:
    dw $0001,$01FC                                                       ;8DC017;
    db $FC                                                               ;8DC01B;
    dw $3A2C                                                             ;8DC01C;

UNUSED_EnemyProjSpritemaps_13_8DC01E:
    dw $0001,$01FC                                                       ;8DC01E;
    db $FC                                                               ;8DC022;
    dw $3A2D                                                             ;8DC023;

UNUSED_EnemyProjSpritemaps_14_8DC025:
    dw $0001,$01FC                                                       ;8DC025;
    db $FC                                                               ;8DC029;
    dw $3A2E                                                             ;8DC02A;

UNUSED_EnemyProjSpritemaps_15_8DC02C:
    dw $0001,$01FC                                                       ;8DC02C;
    db $FC                                                               ;8DC030;
    dw $3A2F                                                             ;8DC031;

UNUSED_EnemyProjSpritemaps_16_8DC033:
    dw $0001,$81F8                                                       ;8DC033;
    db $F6                                                               ;8DC037;
    dw $3A76                                                             ;8DC038;

UNUSED_EnemyProjSpritemaps_17_8DC03A:
    dw $0001,$81F8                                                       ;8DC03A;
    db $F4                                                               ;8DC03E;
    dw $3A78                                                             ;8DC03F;

UNUSED_EnemyProjSpritemaps_18_8DC041:
    dw $0001,$81F8                                                       ;8DC041;
    db $F2                                                               ;8DC045;
    dw $3A98                                                             ;8DC046;

UNUSED_EnemyProjSpritemaps_19_8DC048:
    dw $0001,$81F8                                                       ;8DC048;
    db $F0                                                               ;8DC04C;
    dw $3A9E                                                             ;8DC04D;

UNUSED_EnemyProjSpritemaps_1A_8DC04F:
    dw $0001,$01FC                                                       ;8DC04F;
    db $FC                                                               ;8DC053;
    dw $3A25                                                             ;8DC054;

UNUSED_EnemyProjSpritemaps_1B_8DC056:
    dw $0001,$01FC                                                       ;8DC056;
    db $FC                                                               ;8DC05A;
    dw $3A43                                                             ;8DC05B;

UNUSED_EnemyProjSpritemaps_1C_8DC05D:
    dw $0001,$01FC                                                       ;8DC05D;
    db $FC                                                               ;8DC061;
    dw $3A40                                                             ;8DC062;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_4:
    dw $0001,$01FC                                                       ;8DC064;
    db $FC                                                               ;8DC068;
    dw $3A3E                                                             ;8DC069;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_5:
    dw $0001,$01FC                                                       ;8DC06B;
    db $FC                                                               ;8DC06F;
    dw $3A3D                                                             ;8DC070;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_6:
    dw $0001,$01FC                                                       ;8DC072;
    db $FC                                                               ;8DC076;
    dw $3A41                                                             ;8DC077;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_7:
    dw $0001,$01FC                                                       ;8DC079;
    db $FC                                                               ;8DC07D;
    dw $3A42                                                             ;8DC07E;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_8:
    dw $0004,$0000                                                       ;8DC080;
    db $00                                                               ;8DC084;
    dw $FA44,$01F8                                                       ;8DC085;
    db $00                                                               ;8DC089;
    dw $BA44,$0000                                                       ;8DC08A;
    db $F8                                                               ;8DC08E;
    dw $7A44,$01F8                                                       ;8DC08F;
    db $F8                                                               ;8DC093;
    dw $3A44                                                             ;8DC094;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_9:
    dw $0004,$0000                                                       ;8DC096;
    db $00                                                               ;8DC09A;
    dw $FA45,$0000                                                       ;8DC09B;
    db $F8                                                               ;8DC09F;
    dw $7A45,$01F8                                                       ;8DC0A0;
    db $00                                                               ;8DC0A4;
    dw $BA45,$01F8                                                       ;8DC0A5;
    db $F8                                                               ;8DC0A9;
    dw $3A45                                                             ;8DC0AA;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_A:
    dw $0004,$01F8                                                       ;8DC0AC;
    db $00                                                               ;8DC0B0;
    dw $BA46,$0000                                                       ;8DC0B1;
    db $00                                                               ;8DC0B5;
    dw $FA46,$0000                                                       ;8DC0B6;
    db $F8                                                               ;8DC0BA;
    dw $7A46,$01F8                                                       ;8DC0BB;
    db $F8                                                               ;8DC0BF;
    dw $3A46                                                             ;8DC0C0;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_B:
    dw $0001,$01FC                                                       ;8DC0C2;
    db $FC                                                               ;8DC0C6;
    dw $3A42                                                             ;8DC0C7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_Pickup_Bombs_0_8DC0C9:
    dw $0001,$01FC                                                       ;8DC0C9;
    db $FC                                                               ;8DC0CD;
    dw $3A4C                                                             ;8DC0CE;

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_1_8DC0D0:
    dw $0001,$01FC                                                       ;8DC0D0;
    db $FC                                                               ;8DC0D4;
    dw $3A4D                                                             ;8DC0D5;

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_2_8DC0D7:
    dw $0001,$01FC                                                       ;8DC0D7;
    db $FC                                                               ;8DC0DB;
    dw $3A4E                                                             ;8DC0DC;

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_3_8DC0DE:
    dw $0001,$01FC                                                       ;8DC0DE;
    db $FC                                                               ;8DC0E2;
    dw $3A4F                                                             ;8DC0E3;

UNUSED_EnemyProjSpritemaps_0_8DC0E5:
    dw $0002,$01FF                                                       ;8DC0E5;
    db $FC                                                               ;8DC0E9;
    dw $3A55,$01F7                                                       ;8DC0EA;
    db $FC                                                               ;8DC0EE;
    dw $3A54                                                             ;8DC0EF;

UNUSED_EnemyProjSpritemaps_1_8DC0F1:
    dw $0003,$01FA                                                       ;8DC0F1;
    db $F5                                                               ;8DC0F5;
    dw $3A56,$0002                                                       ;8DC0F6;
    db $FD                                                               ;8DC0FA;
    dw $3A58,$01FA                                                       ;8DC0FB;
    db $FD                                                               ;8DC0FF;
    dw $3A57                                                             ;8DC100;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_C:
    dw $0002,$01FD                                                       ;8DC102;
    db $F7                                                               ;8DC106;
    dw $3A59,$01FD                                                       ;8DC107;
    db $FF                                                               ;8DC10B;
    dw $3A5A                                                             ;8DC10C;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_D:
    dw $0002,$01FD                                                       ;8DC10E;
    db $F7                                                               ;8DC112;
    dw $3059,$01FD                                                       ;8DC113;
    db $FF                                                               ;8DC117;
    dw $305A                                                             ;8DC118;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DC11A:
    dw $0003,$01FE                                                       ;8DC11A;
    db $F5                                                               ;8DC11E;
    dw $7A56,$01F6                                                       ;8DC11F;
    db $FD                                                               ;8DC123;
    dw $7A58,$01FE                                                       ;8DC124;
    db $FD                                                               ;8DC128;
    dw $7A57                                                             ;8DC129;

UNUSED_EnemyProjSpritemaps_1_8DC12B:
    dw $0002,$01F9                                                       ;8DC12B;
    db $FC                                                               ;8DC12F;
    dw $7A55,$0001                                                       ;8DC130;
    db $FC                                                               ;8DC134;
    dw $7A54                                                             ;8DC135;

UNUSED_EnemyProjSpritemaps_2_8DC137:
    dw $0003,$01FE                                                       ;8DC137;
    db $03                                                               ;8DC13B;
    dw $FA56,$01F6                                                       ;8DC13C;
    db $FB                                                               ;8DC140;
    dw $FA58,$01FE                                                       ;8DC141;
    db $FB                                                               ;8DC145;
    dw $FA57                                                             ;8DC146;

UNUSED_EnemyProjSpritemaps_3_8DC148:
    dw $0002,$01FD                                                       ;8DC148;
    db $01                                                               ;8DC14C;
    dw $BA59,$01FD                                                       ;8DC14D;
    db $F9                                                               ;8DC151;
    dw $BA5A                                                             ;8DC152;

UNUSED_EnemyProjSpritemaps_4_8DC154:
    dw $0003,$01FA                                                       ;8DC154;
    db $03                                                               ;8DC158;
    dw $BA56,$0002                                                       ;8DC159;
    db $FB                                                               ;8DC15D;
    dw $BA58,$01FA                                                       ;8DC15E;
    db $FB                                                               ;8DC162;
    dw $BA57                                                             ;8DC163;

UNUSED_EnemyProjSpritemaps_5_8DC165:
    dw $0002,$0000                                                       ;8DC165;
    db $FC                                                               ;8DC169;
    dw $3A65,$01F8                                                       ;8DC16A;
    db $FC                                                               ;8DC16E;
    dw $3A64                                                             ;8DC16F;

UNUSED_EnemyProjSpritemaps_6_8DC171:
    dw $0003,$0002                                                       ;8DC171;
    db $FE                                                               ;8DC175;
    dw $3A68,$01FA                                                       ;8DC176;
    db $FE                                                               ;8DC17A;
    dw $3A67,$01FA                                                       ;8DC17B;
    db $F6                                                               ;8DC17F;
    dw $3A66                                                             ;8DC180;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_E:
    dw $0002,$01FC                                                       ;8DC182;
    db $F8                                                               ;8DC186;
    dw $3A69,$01FC                                                       ;8DC187;
    db $00                                                               ;8DC18B;
    dw $3A6A                                                             ;8DC18C;

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_F:
    dw $0002,$01FC                                                       ;8DC18E;
    db $F8                                                               ;8DC192;
    dw $3069,$01FC                                                       ;8DC193;
    db $00                                                               ;8DC197;
    dw $306A                                                             ;8DC198;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DC19A:
    dw $0003,$01F6                                                       ;8DC19A;
    db $FE                                                               ;8DC19E;
    dw $7A68,$01FE                                                       ;8DC19F;
    db $FE                                                               ;8DC1A3;
    dw $7A67,$01FE                                                       ;8DC1A4;
    db $F6                                                               ;8DC1A8;
    dw $7A66                                                             ;8DC1A9;

UNUSED_EnemyProjSpritemaps_1_8DC1AB:
    dw $0002,$01F8                                                       ;8DC1AB;
    db $FC                                                               ;8DC1AF;
    dw $7A65,$0000                                                       ;8DC1B0;
    db $FC                                                               ;8DC1B4;
    dw $7A64                                                             ;8DC1B5;

UNUSED_EnemyProjSpritemaps_2_8DC1B7:
    dw $0003,$01F6                                                       ;8DC1B7;
    db $FA                                                               ;8DC1BB;
    dw $FA68,$01FE                                                       ;8DC1BC;
    db $FA                                                               ;8DC1C0;
    dw $FA67,$01FE                                                       ;8DC1C1;
    db $02                                                               ;8DC1C5;
    dw $FA66                                                             ;8DC1C6;

UNUSED_EnemyProjSpritemaps_3_8DC1C8:
    dw $0002,$01FC                                                       ;8DC1C8;
    db $00                                                               ;8DC1CC;
    dw $BA69,$01FC                                                       ;8DC1CD;
    db $F8                                                               ;8DC1D1;
    dw $BA6A                                                             ;8DC1D2;

UNUSED_EnemyProjSpritemaps_4_8DC1D4:
    dw $0003,$0002                                                       ;8DC1D4;
    db $FA                                                               ;8DC1D8;
    dw $BA68,$01FA                                                       ;8DC1D9;
    db $FA                                                               ;8DC1DD;
    dw $BA67,$01FA                                                       ;8DC1DE;
    db $02                                                               ;8DC1E2;
    dw $BA66                                                             ;8DC1E3;

UNUSED_EnemyProjSpritemaps_5_8DC1E5:
    dw $0001,$01FC                                                       ;8DC1E5;
    db $FC                                                               ;8DC1E9;
    dw $3A3C                                                             ;8DC1EA;

UNUSED_EnemyProjSpritemaps_6_8DC1EC:
    dw $0001,$01FC                                                       ;8DC1EC;
    db $FC                                                               ;8DC1F0;
    dw $3A3D                                                             ;8DC1F1;

UNUSED_EnemyProjSpritemaps_7_8DC1F3:
    dw $0001,$01FC                                                       ;8DC1F3;
    db $FC                                                               ;8DC1F7;
    dw $3A3E                                                             ;8DC1F8;

UNUSED_EnemyProjSpritemaps_8_8DC1FA:
    dw $0001,$01FC                                                       ;8DC1FA;
    db $FC                                                               ;8DC1FE;
    dw $3A3F                                                             ;8DC1FF;

UNUSED_EnemyProjSpritemaps_9_8DC201:
    dw $0004,$0000                                                       ;8DC201;
    db $00                                                               ;8DC205;
    dw $FA8A,$01F8                                                       ;8DC206;
    db $00                                                               ;8DC20A;
    dw $BA8A,$0000                                                       ;8DC20B;
    db $F8                                                               ;8DC20F;
    dw $7A8A,$01F8                                                       ;8DC210;
    db $F8                                                               ;8DC214;
    dw $3A8A                                                             ;8DC215;

UNUSED_EnemyProjSpritemaps_A_8DC217:
    dw $0004,$C200                                                       ;8DC217;
    db $00                                                               ;8DC21B;
    dw $FA90,$C200                                                       ;8DC21C;
    db $F0                                                               ;8DC220;
    dw $7A90,$C3F0                                                       ;8DC221;
    db $00                                                               ;8DC225;
    dw $BA90,$C3F0                                                       ;8DC226;
    db $F0                                                               ;8DC22A;
    dw $3A90                                                             ;8DC22B;

UNUSED_EnemyProjSpritemaps_B_8DC22D:
    dw $0004,$C200                                                       ;8DC22D;
    db $00                                                               ;8DC231;
    dw $FA92,$C3F0                                                       ;8DC232;
    db $00                                                               ;8DC236;
    dw $BA92,$C200                                                       ;8DC237;
    db $F0                                                               ;8DC23B;
    dw $7A92,$C3F0                                                       ;8DC23C;
    db $F0                                                               ;8DC240;
    dw $3A92                                                             ;8DC241;

UNUSED_EnemyProjSpritemaps_C_8DC243:
    dw $000C,$0010                                                       ;8DC243;
    db $00                                                               ;8DC247;
    dw $FAC2,$0010                                                       ;8DC248;
    db $F8                                                               ;8DC24C;
    dw $7AC2,$0000                                                       ;8DC24D;
    db $10                                                               ;8DC251;
    dw $FAB2,$01F8                                                       ;8DC252;
    db $10                                                               ;8DC256;
    dw $BAB2,$01E8                                                       ;8DC257;
    db $00                                                               ;8DC25B;
    dw $BAC2,$01E8                                                       ;8DC25C;
    db $F8                                                               ;8DC260;
    dw $3AC2,$0000                                                       ;8DC261;
    db $E8                                                               ;8DC265;
    dw $7AB2,$01F8                                                       ;8DC266;
    db $E8                                                               ;8DC26A;
    dw $3AB2,$C200                                                       ;8DC26B;
    db $00                                                               ;8DC26F;
    dw $FAB0,$C200                                                       ;8DC270;
    db $F0                                                               ;8DC274;
    dw $7AB0,$C3F0                                                       ;8DC275;
    db $00                                                               ;8DC279;
    dw $BAB0,$C3F0                                                       ;8DC27A;
    db $F0                                                               ;8DC27E;
    dw $3AB0                                                             ;8DC27F;

UNUSED_EnemyProjSpritemaps_D_8DC281:
    dw $0008,$C208                                                       ;8DC281;
    db $00                                                               ;8DC285;
    dw $FAB5,$C200                                                       ;8DC286;
    db $08                                                               ;8DC28A;
    dw $FAB3,$C3E8                                                       ;8DC28B;
    db $00                                                               ;8DC28F;
    dw $BAB5,$C3F0                                                       ;8DC290;
    db $08                                                               ;8DC294;
    dw $BAB3,$C208                                                       ;8DC295;
    db $F0                                                               ;8DC299;
    dw $7AB5,$C200                                                       ;8DC29A;
    db $E8                                                               ;8DC29E;
    dw $7AB3,$C3E8                                                       ;8DC29F;
    db $F0                                                               ;8DC2A3;
    dw $3AB5,$C3F0                                                       ;8DC2A4;
    db $E8                                                               ;8DC2A8;
    dw $3AB3                                                             ;8DC2A9;

UNUSED_EnemyProjSpritemaps_E_8DC2AB:
    dw $000C,$0000                                                       ;8DC2AB;
    db $10                                                               ;8DC2AF;
    dw $FABB,$01F8                                                       ;8DC2B0;
    db $10                                                               ;8DC2B4;
    dw $BABB,$0000                                                       ;8DC2B5;
    db $E8                                                               ;8DC2B9;
    dw $7ABB,$01F8                                                       ;8DC2BA;
    db $E8                                                               ;8DC2BE;
    dw $3ABB,$0010                                                       ;8DC2BF;
    db $00                                                               ;8DC2C3;
    dw $FAB7,$0010                                                       ;8DC2C4;
    db $F8                                                               ;8DC2C8;
    dw $7AB7,$01E8                                                       ;8DC2C9;
    db $00                                                               ;8DC2CD;
    dw $BAB7,$01E8                                                       ;8DC2CE;
    db $F8                                                               ;8DC2D2;
    dw $3AB7,$C208                                                       ;8DC2D3;
    db $08                                                               ;8DC2D7;
    dw $FAB8,$C3E8                                                       ;8DC2D8;
    db $08                                                               ;8DC2DC;
    dw $BAB8,$C208                                                       ;8DC2DD;
    db $E8                                                               ;8DC2E1;
    dw $7AB8,$C3E8                                                       ;8DC2E2;
    db $E8                                                               ;8DC2E6;
    dw $3AB8                                                             ;8DC2E7;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_EnemyDeathExplosion_6:
    dw $0004,$8000                                                       ;8DC2E9;
    db $00                                                               ;8DC2ED;
    dw $FA90,$81F0                                                       ;8DC2EE;
    db $00                                                               ;8DC2F2;
    dw $BA90,$8000                                                       ;8DC2F3;
    db $F0                                                               ;8DC2F7;
    dw $7A90,$81F0                                                       ;8DC2F8;
    db $F0                                                               ;8DC2FC;
    dw $3A90                                                             ;8DC2FD;

EnemyProjSpritemaps_EnemyDeathExplosion_7:
    dw $0008,$81EB                                                       ;8DC2FF;
    db $EB                                                               ;8DC303;
    dw $3A76,$81EB                                                       ;8DC304;
    db $05                                                               ;8DC308;
    dw $BA76,$8005                                                       ;8DC309;
    db $05                                                               ;8DC30D;
    dw $FA76,$8006                                                       ;8DC30E;
    db $EB                                                               ;8DC312;
    dw $7A76,$8000                                                       ;8DC313;
    db $00                                                               ;8DC317;
    dw $FA92,$81FF                                                       ;8DC318;
    db $F0                                                               ;8DC31C;
    dw $7A92,$81F0                                                       ;8DC31D;
    db $00                                                               ;8DC321;
    dw $BA92,$81F0                                                       ;8DC322;
    db $F0                                                               ;8DC326;
    dw $3A92                                                             ;8DC327;

EnemyProjSpritemaps_EnemyDeathExplosion_8:
    dw $0008,$8000                                                       ;8DC329;
    db $00                                                               ;8DC32D;
    dw $FA94,$81F0                                                       ;8DC32E;
    db $00                                                               ;8DC332;
    dw $BA94,$8000                                                       ;8DC333;
    db $F0                                                               ;8DC337;
    dw $7A94,$81F0                                                       ;8DC338;
    db $F0                                                               ;8DC33C;
    dw $3A94,$81E2                                                       ;8DC33D;
    db $E2                                                               ;8DC341;
    dw $3A78,$800E                                                       ;8DC342;
    db $E2                                                               ;8DC346;
    dw $7A78,$81E2                                                       ;8DC347;
    db $0E                                                               ;8DC34B;
    dw $BA78,$800E                                                       ;8DC34C;
    db $0E                                                               ;8DC350;
    dw $FA78                                                             ;8DC351;

EnemyProjSpritemaps_EnemyDeathExplosion_9:
    dw $0008,$8000                                                       ;8DC353;
    db $00                                                               ;8DC357;
    dw $FA96,$8000                                                       ;8DC358;
    db $F0                                                               ;8DC35C;
    dw $7A96,$81F0                                                       ;8DC35D;
    db $00                                                               ;8DC361;
    dw $BA96,$81F0                                                       ;8DC362;
    db $F0                                                               ;8DC366;
    dw $3A96,$8014                                                       ;8DC367;
    db $DC                                                               ;8DC36B;
    dw $7A98,$81DC                                                       ;8DC36C;
    db $DC                                                               ;8DC370;
    dw $3A98,$81DC                                                       ;8DC371;
    db $14                                                               ;8DC375;
    dw $BA98,$8014                                                       ;8DC376;
    db $14                                                               ;8DC37A;
    dw $FA98                                                             ;8DC37B;

EnemyProjSpritemaps_EnemyDeathExplosion_A:
    dw $0008,$01EF                                                       ;8DC37D;
    db $FA                                                               ;8DC381;
    dw $3A2B,$0009                                                       ;8DC382;
    db $FA                                                               ;8DC386;
    dw $3A2B,$000C                                                       ;8DC387;
    db $EC                                                               ;8DC38B;
    dw $3A2B,$01EC                                                       ;8DC38C;
    db $EC                                                               ;8DC390;
    dw $3A2B,$81D8                                                       ;8DC391;
    db $D8                                                               ;8DC395;
    dw $3A9E,$81D8                                                       ;8DC396;
    db $18                                                               ;8DC39A;
    dw $BA9E,$8018                                                       ;8DC39B;
    db $18                                                               ;8DC39F;
    dw $FA9E,$8018                                                       ;8DC3A0;
    db $D8                                                               ;8DC3A4;
    dw $7A9E                                                             ;8DC3A5;

EnemyProjSpritemaps_EnemyDeathExplosion_B:
    dw $0008,$81D6                                                       ;8DC3A7;
    db $D6                                                               ;8DC3AB;
    dw $3A9C,$801A                                                       ;8DC3AC;
    db $D6                                                               ;8DC3B0;
    dw $7A9C,$81D6                                                       ;8DC3B1;
    db $1A                                                               ;8DC3B5;
    dw $BA9C,$801A                                                       ;8DC3B6;
    db $1A                                                               ;8DC3BA;
    dw $FA9C,$0012                                                       ;8DC3BB;
    db $E8                                                               ;8DC3BF;
    dw $3A2B,$000C                                                       ;8DC3C0;
    db $F9                                                               ;8DC3C4;
    dw $3A2B,$01EC                                                       ;8DC3C5;
    db $F9                                                               ;8DC3C9;
    dw $3A2B,$01E6                                                       ;8DC3CA;
    db $E8                                                               ;8DC3CE;
    dw $3A2B                                                             ;8DC3CF;

EnemyProjSpritemaps_EnemyDeathExplosion_C:
    dw $0004,$0017                                                       ;8DC3D1;
    db $E7                                                               ;8DC3D5;
    dw $7A2A,$000D                                                       ;8DC3D6;
    db $FA                                                               ;8DC3DA;
    dw $7A2A,$01EB                                                       ;8DC3DB;
    db $FA                                                               ;8DC3DF;
    dw $3A2A,$01E1                                                       ;8DC3E0;
    db $E7                                                               ;8DC3E4;
    dw $3A2A                                                             ;8DC3E5;

EnemyProjSpritemaps_EnemyDeathExplosion_D:
    dw $0004,$001B                                                       ;8DC3E7;
    db $E8                                                               ;8DC3EB;
    dw $7A2A,$000E                                                       ;8DC3EC;
    db $FC                                                               ;8DC3F0;
    dw $7A2A,$01EA                                                       ;8DC3F1;
    db $FC                                                               ;8DC3F5;
    dw $3A2A,$01DD                                                       ;8DC3F6;
    db $E8                                                               ;8DC3FA;
    dw $3A2A                                                             ;8DC3FB;

EnemyProjSpritemaps_EnemyDeathExplosion_E:
    dw $0004,$001E                                                       ;8DC3FD;
    db $E9                                                               ;8DC401;
    dw $7A29,$000F                                                       ;8DC402;
    db $FE                                                               ;8DC406;
    dw $7A29,$01E9                                                       ;8DC407;
    db $FE                                                               ;8DC40B;
    dw $3A29,$01DA                                                       ;8DC40C;
    db $E9                                                               ;8DC410;
    dw $3A29                                                             ;8DC411;

EnemyProjSpritemaps_EnemyDeathExplosion_F:
    dw $0004,$0020                                                       ;8DC413;
    db $EA                                                               ;8DC417;
    dw $7A29,$0010                                                       ;8DC418;
    db $00                                                               ;8DC41C;
    dw $7A29,$01E8                                                       ;8DC41D;
    db $00                                                               ;8DC421;
    dw $3A29,$01D8                                                       ;8DC422;
    db $EA                                                               ;8DC426;
    dw $3A29                                                             ;8DC427;

EnemyProjSpritemaps_EnemyDeathExplosion_10:
    dw $0004,$0023                                                       ;8DC429;
    db $EC                                                               ;8DC42D;
    dw $7A28,$0011                                                       ;8DC42E;
    db $02                                                               ;8DC432;
    dw $7A28,$01D5                                                       ;8DC433;
    db $EC                                                               ;8DC437;
    dw $3A28,$01E7                                                       ;8DC438;
    db $02                                                               ;8DC43C;
    dw $3A28                                                             ;8DC43D;

EnemyProjSpritemaps_EnemyDeathExplosion_11:
    dw $0004,$0027                                                       ;8DC43F;
    db $EE                                                               ;8DC443;
    dw $7A28,$0012                                                       ;8DC444;
    db $04                                                               ;8DC448;
    dw $7A28,$01D1                                                       ;8DC449;
    db $EE                                                               ;8DC44D;
    dw $3A28,$01E6                                                       ;8DC44E;
    db $04                                                               ;8DC452;
    dw $3A28                                                             ;8DC453;

EnemyProjSpritemaps_EnemyDeathExplosion_12:
    dw $0004,$0029                                                       ;8DC455;
    db $F1                                                               ;8DC459;
    dw $7A28,$0013                                                       ;8DC45A;
    db $07                                                               ;8DC45E;
    dw $7A28,$01CF                                                       ;8DC45F;
    db $F1                                                               ;8DC463;
    dw $3A28,$01E5                                                       ;8DC464;
    db $07                                                               ;8DC468;
    dw $3A28                                                             ;8DC469;

EnemyProjSpritemaps_EnemyDeathExplosion_13:
    dw $0004,$002D                                                       ;8DC46B;
    db $F5                                                               ;8DC46F;
    dw $7A28,$0014                                                       ;8DC470;
    db $0B                                                               ;8DC474;
    dw $7A28,$01CB                                                       ;8DC475;
    db $F5                                                               ;8DC479;
    dw $3A28,$01E4                                                       ;8DC47A;
    db $0B                                                               ;8DC47E;
    dw $3A28                                                             ;8DC47F;

EnemyProjSpritemaps_EnemyDeathExplosion_14:
    dw $0004,$0033                                                       ;8DC481;
    db $FF                                                               ;8DC485;
    dw $7A28,$0015                                                       ;8DC486;
    db $11                                                               ;8DC48A;
    dw $7A28,$01C5                                                       ;8DC48B;
    db $FF                                                               ;8DC48F;
    dw $3A28,$01E3                                                       ;8DC490;
    db $11                                                               ;8DC494;
    dw $3A28                                                             ;8DC495;

EnemyProjSpritemaps_EnemyDeathExplosion_15:
    dw $0004,$0039                                                       ;8DC497;
    db $0A                                                               ;8DC49B;
    dw $7A28,$0018                                                       ;8DC49C;
    db $22                                                               ;8DC4A0;
    dw $7A28,$01BF                                                       ;8DC4A1;
    db $0A                                                               ;8DC4A5;
    dw $3A28,$01E0                                                       ;8DC4A6;
    db $22                                                               ;8DC4AA;
    dw $3A28                                                             ;8DC4AB;

EnemyProjSpritemaps_Sparks_0:
    dw $0001,$01FC                                                       ;8DC4AD;
    db $FC                                                               ;8DC4B1;
    dw $210B                                                             ;8DC4B2;

EnemyProjSpritemaps_Sparks_1:
    dw $0001,$01FC                                                       ;8DC4B4;
    db $FC                                                               ;8DC4B8;
    dw $210C                                                             ;8DC4B9;

EnemyProjSpritemaps_Sparks_2:
    dw $0001,$01FC                                                       ;8DC4BB;
    db $FC                                                               ;8DC4BF;
    dw $210D                                                             ;8DC4C0;

Enable_PaletteFXObjects:
    PHP                                                                  ;8DC4C2;
    REP #$20                                                             ;8DC4C3;
    LDA.W #$8000                                                         ;8DC4C5;
    TSB.W $1E79                                                          ;8DC4C8;
    PLP                                                                  ;8DC4CB;
    RTL                                                                  ;8DC4CC;


Disable_PaletteFXObjects:
    PHP                                                                  ;8DC4CD;
    REP #$20                                                             ;8DC4CE;
    LDA.W #$8000                                                         ;8DC4D0;
    TRB.W $1E79                                                          ;8DC4D3;
    PLP                                                                  ;8DC4D6;
    RTL                                                                  ;8DC4D7;


Clear_PaletteFXObjects:
    PHP                                                                  ;8DC4D8;
    REP #$30                                                             ;8DC4D9;
    PHX                                                                  ;8DC4DB;
    LDX.W #$000E                                                         ;8DC4DC;

.loop:
    STZ.W $1E7D,X                                                        ;8DC4DF;
    DEX                                                                  ;8DC4E2;
    DEX                                                                  ;8DC4E3;
    BPL .loop                                                            ;8DC4E4;
    PLX                                                                  ;8DC4E6;
    PLP                                                                  ;8DC4E7;
    RTL                                                                  ;8DC4E8;


Spawn_PaletteFXObject:
    PHP                                                                  ;8DC4E9;
    PHB                                                                  ;8DC4EA;
    PHX                                                                  ;8DC4EB;
    PHK                                                                  ;8DC4EC;
    PLB                                                                  ;8DC4ED;
    LDX.W #$000E                                                         ;8DC4EE;

.loop:
    LDA.W $1E7D,X                                                        ;8DC4F1;
    BEQ .zero                                                            ;8DC4F4;
    DEX                                                                  ;8DC4F6;
    DEX                                                                  ;8DC4F7;
    BPL .loop                                                            ;8DC4F8;
    PLX                                                                  ;8DC4FA;
    PLB                                                                  ;8DC4FB;
    PLP                                                                  ;8DC4FC;
    SEC                                                                  ;8DC4FD;
    RTL                                                                  ;8DC4FE;


.zero:
    TYA                                                                  ;8DC4FF;
    STA.W $1E7D,X                                                        ;8DC500;
    STZ.W $1E8D,X                                                        ;8DC503;
    LDA.W #RTS_8DC526                                                    ;8DC506;
    STA.W $1EAD,X                                                        ;8DC509;
    LDA.W $0002,Y                                                        ;8DC50C;
    STA.W $1EBD,X                                                        ;8DC50F;
    LDA.W #$0001                                                         ;8DC512;
    STA.W $1ECD,X                                                        ;8DC515;
    STZ.W $1EDD,X                                                        ;8DC518;
    TXA                                                                  ;8DC51B;
    TYX                                                                  ;8DC51C;
    TAY                                                                  ;8DC51D;
    JSR.W ($0000,X)                                                      ;8DC51E;
    PLX                                                                  ;8DC521;
    PLB                                                                  ;8DC522;
    PLP                                                                  ;8DC523;
    CLC                                                                  ;8DC524;
    RTL                                                                  ;8DC525;


RTS_8DC526:
    RTS                                                                  ;8DC526;


PaletteFXObject_Handler:
    PHP                                                                  ;8DC527;
    PHB                                                                  ;8DC528;
    PHK                                                                  ;8DC529;
    PLB                                                                  ;8DC52A;
    REP #$30                                                             ;8DC52B;
    BIT.W $1E79                                                          ;8DC52D;
    BPL .return                                                          ;8DC530;
    LDX.W #$000E                                                         ;8DC532;

.loop:
    STX.W $1E7B                                                          ;8DC535;
    LDA.W $1E7D,X                                                        ;8DC538;
    BEQ .next                                                            ;8DC53B;
    JSR.W Process_PaleteFXObject                                         ;8DC53D;
    LDX.W $1E7B                                                          ;8DC540;

.next:
    DEX                                                                  ;8DC543;
    DEX                                                                  ;8DC544;
    BPL .loop                                                            ;8DC545;

.return:
    PLB                                                                  ;8DC547;
    PLP                                                                  ;8DC548;
    RTL                                                                  ;8DC549;


Process_PaleteFXObject:
    REP #$30                                                             ;8DC54A;
    JSR.W ($1EAD,X)                                                      ;8DC54C;
    LDX.W $1E7B                                                          ;8DC54F;
    DEC.W $1ECD,X                                                        ;8DC552;
    BNE Process_PaleteFXObject_return                                    ;8DC555;
    LDA.W $1EBD,X                                                        ;8DC557;
    TAY                                                                  ;8DC55A;

.loopDetermineColorIndex:
    LDA.W $0000,Y                                                        ;8DC55B;
    BPL .timer                                                           ;8DC55E;
    STA.B $12                                                            ;8DC560;
    INY                                                                  ;8DC562;
    INY                                                                  ;8DC563;
    PEA.W .loopDetermineColorIndex-1                                     ;8DC564;
    JMP.W ($0012)                                                        ;8DC567;


.timer:
    STA.W $1ECD,X                                                        ;8DC56A;
    LDA.W $1E8D,X                                                        ;8DC56D;
    TAX                                                                  ;8DC570;

.loopWriteColors:
    LDA.W $0002,Y                                                        ;8DC571;
    BPL .storeColor                                                      ;8DC574;
    STA.B $12                                                            ;8DC576;
    PEA.W .loopWriteColors-1                                             ;8DC578;
    JMP.W ($0012)                                                        ;8DC57B;


.storeColor:
    STA.L $7EC000,X                                                      ;8DC57E;
    INX                                                                  ;8DC582;
    INX                                                                  ;8DC583;
    INY                                                                  ;8DC584;
    INY                                                                  ;8DC585;
    JMP.W .loopWriteColors                                               ;8DC586;


Process_PaleteFXObject_done:
    LDX.W $1E7B                                                          ;8DC589;
    TYA                                                                  ;8DC58C;
    CLC                                                                  ;8DC58D;
    ADC.W #$0004                                                         ;8DC58E;
    STA.W $1EBD,X                                                        ;8DC591;

Process_PaleteFXObject_return:
    RTS                                                                  ;8DC594;


Instruction_PaletteFXObject_Done:
    PLA                                                                  ;8DC595;
    JMP.W Process_PaleteFXObject_done                                    ;8DC596;


Instruction_PaletteFXObject_ColorIndex_Plus4:
    TXA                                                                  ;8DC599;
    CLC                                                                  ;8DC59A;
    ADC.W #$0004                                                         ;8DC59B;
    TAX                                                                  ;8DC59E;
    INY                                                                  ;8DC59F;
    INY                                                                  ;8DC5A0;
    RTS                                                                  ;8DC5A1;


Instruction_PaletteFXObject_ColorIndex_Plus6:
    TXA                                                                  ;8DC5A2;
    CLC                                                                  ;8DC5A3;
    ADC.W #$0006                                                         ;8DC5A4;
    TAX                                                                  ;8DC5A7;
    INY                                                                  ;8DC5A8;
    INY                                                                  ;8DC5A9;
    RTS                                                                  ;8DC5AA;


Instruction_PaletteFXObject_ColorIndex_Plus8:
    TXA                                                                  ;8DC5AB;
    CLC                                                                  ;8DC5AC;
    ADC.W #$0008                                                         ;8DC5AD;
    TAX                                                                  ;8DC5B0;
    INY                                                                  ;8DC5B1;
    INY                                                                  ;8DC5B2;
    RTS                                                                  ;8DC5B3;


Instruction_PaletteFXObject_ColorIndex_Plus10:
    TXA                                                                  ;8DC5B4;
    CLC                                                                  ;8DC5B5;
    ADC.W #$0010                                                         ;8DC5B6;
    TAX                                                                  ;8DC5B9;
    INY                                                                  ;8DC5BA;
    INY                                                                  ;8DC5BB;
    RTS                                                                  ;8DC5BC;


Instruction_PaletteFXObject_ColorIndex_Plus12:
    TXA                                                                  ;8DC5BD;
    CLC                                                                  ;8DC5BE;
    ADC.W #$0012                                                         ;8DC5BF;
    TAX                                                                  ;8DC5C2;
    INY                                                                  ;8DC5C3;
    INY                                                                  ;8DC5C4;
    RTS                                                                  ;8DC5C5;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PaletteFXObject_ColorIndex_Plus1E_8DC5C6:
    TXA                                                                  ;8DC5C6;
    CLC                                                                  ;8DC5C7;
    ADC.W #$001E                                                         ;8DC5C8;
    TAX                                                                  ;8DC5CB;
    INY                                                                  ;8DC5CC;
    INY                                                                  ;8DC5CD;
    RTS                                                                  ;8DC5CE;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_Delete_8DC5CF:
    STZ.W $1E7D,X                                                        ;8DC5CF;
    PLA                                                                  ;8DC5D2;
    RTS                                                                  ;8DC5D3;


Instruction_PaletteFXObject_PreInstructionInY:
    LDA.W $0000,Y                                                        ;8DC5D4;
    STA.W $1EAD,X                                                        ;8DC5D7;
    INY                                                                  ;8DC5DA;
    INY                                                                  ;8DC5DB;
    RTS                                                                  ;8DC5DC;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PaletteFXObject_ClearPreInstruction_8DC5DD:
    LDA.W #RTS_8DC5E3                                                    ;8DC5DD;
    STA.W $1EAD,X                                                        ;8DC5E0;
endif ; !FEATURE_KEEP_UNREFERENCED

RTS_8DC5E3:
    RTS                                                                  ;8DC5E3;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PaletteFXObject_CallExternalFunctionInY_8DC5E4:
    LDA.W $0000,Y                                                        ;8DC5E4;
    STA.B $12                                                            ;8DC5E7;
    LDA.W $0001,Y                                                        ;8DC5E9;
    STA.B $13                                                            ;8DC5EC;
    PHY                                                                  ;8DC5EE;
    JSL.L .externalFunction                                              ;8DC5EF;
    PLY                                                                  ;8DC5F3;
    LDX.W $1E7B                                                          ;8DC5F4;
    INY                                                                  ;8DC5F7;
    INY                                                                  ;8DC5F8;
    INY                                                                  ;8DC5F9;
    RTS                                                                  ;8DC5FA;


.externalFunction:
    JML.W [$0012]                                                        ;8DC5FB;


UNUSED_Inst_PaletteFXObject_CallExternalFuncInYWithA_8DC5FE:
    LDA.W $0000,Y                                                        ;8DC5FE;
    STA.B $12                                                            ;8DC601;
    LDA.W $0001,Y                                                        ;8DC603;
    STA.B $13                                                            ;8DC606;
    LDA.W $0003,Y                                                        ;8DC608;
    PHY                                                                  ;8DC60B;
    JSL.L .externalFunction                                              ;8DC60C;
    PLY                                                                  ;8DC610;
    LDX.W $1E7B                                                          ;8DC611;
    TYA                                                                  ;8DC614;
    CLC                                                                  ;8DC615;
    ADC.W #$0005                                                         ;8DC616;
    TAY                                                                  ;8DC619;
    RTS                                                                  ;8DC61A;


.externalFunction:
    JML.W [$0012]                                                        ;8DC61B;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PaletteFXObject_GotoY:
    LDA.W $0000,Y                                                        ;8DC61E;
    TAY                                                                  ;8DC621;
    RTS                                                                  ;8DC622;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PaletteFXObject_GotoYPlusY_8DC623:
    STY.B $12                                                            ;8DC623;
    DEY                                                                  ;8DC625;
    LDA.W $0000,Y                                                        ;8DC626;
    XBA                                                                  ;8DC629;
    BMI .highByte                                                        ;8DC62A;
    AND.W #$00FF                                                         ;8DC62C;
    BRA +                                                                ;8DC62F;


.highByte:
    ORA.W #$FF00                                                         ;8DC631;

  + CLC                                                                  ;8DC634;
    ADC.B $12                                                            ;8DC635;
    TAY                                                                  ;8DC637;
    RTS                                                                  ;8DC638;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero:
    DEC.W $1EDD,X                                                        ;8DC639;
    BNE Instruction_PaletteFXObject_GotoY                                ;8DC63C;
    INY                                                                  ;8DC63E;
    INY                                                                  ;8DC63F;
    RTS                                                                  ;8DC640;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PaletteFXObject_DecTimer_GotoYIfNonZero_8DC641:
    DEC.W $1EDD,X                                                        ;8DC641;
    BNE UNUSED_Instruction_PaletteFXObject_GotoYPlusY_8DC623             ;8DC644;
    INY                                                                  ;8DC646;
    RTS                                                                  ;8DC647;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PaletteFXObject_TimerInY:
    SEP #$20                                                             ;8DC648;
    LDA.W $0000,Y                                                        ;8DC64A;
    STA.W $1EDD,X                                                        ;8DC64D;
    REP #$20                                                             ;8DC650;
    INY                                                                  ;8DC652;
    RTS                                                                  ;8DC653;


RTS_8DC654:
    RTS                                                                  ;8DC654;


Instruction_PaletteFXObject_ColorIndexInY:
    LDA.W $0000,Y                                                        ;8DC655;
    STA.W $1E8D,X                                                        ;8DC658;
    INY                                                                  ;8DC65B;
    INY                                                                  ;8DC65C;
    RTS                                                                  ;8DC65D;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PaletteFXObject_QueueMusicTrackInY_8DC65E:
    LDA.W $0000,Y                                                        ;8DC65E;
    AND.W #$00FF                                                         ;8DC661;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8DC664;
    INY                                                                  ;8DC668;
    RTS                                                                  ;8DC669;


UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib1_Max6_8DC66A:
    LDA.W $0000,Y                                                        ;8DC66A;
    JSL.L QueueSound_Lib1_Max6                                           ;8DC66D;
    INY                                                                  ;8DC671;
    RTS                                                                  ;8DC672;
endif ; !FEATURE_KEEP_UNREFERENCED


UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib2_Max6_8DC673:
    LDA.W $0000,Y                                                        ;8DC673;
    JSL.L QueueSound_Lib2_Max6                                           ;8DC676;
    INY                                                                  ;8DC67A;
    RTS                                                                  ;8DC67B;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib3_Max6_8DC67C:
    LDA.W $0000,Y                                                        ;8DC67C;
    JSL.L QueueSound_Lib3_Max6                                           ;8DC67F;
    INY                                                                  ;8DC683;
    RTS                                                                  ;8DC684;
endif ; !FEATURE_KEEP_UNREFERENCED


RTS_8DC685:
    RTS                                                                  ;8DC685;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_8DC686:
; Looks like garbage data
    dw $1000,$C690,$C595,$C61E,$C686,$0180,$0000,$0000                   ;8DC686;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PaletteFXObject_FadeInSuperMetroidTitleLogo:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0142                   ;8DC696;
    dw $0003
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1084,$0084,$0064,$0064,$0044,$0024,$0004,$0004
    dw $0003,$0002,$0401,$0400,$0C63,$0421,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2108,$0508,$00E8,$00C8,$0088,$0048,$0028,$0008
    dw $0006,$0405,$0803,$0C01,$18C6,$0C42,$0400
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $35AD,$05AD,$056D,$052D,$00CD,$008D,$004D,$000D
    dw $000A,$0407,$0C05,$1422,$2529,$1484,$0400
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4631,$0A31,$05D1,$0591,$0531,$00B1,$0051,$0011
    dw $000D,$080A,$1026,$1823,$318C,$1CA5,$0800
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5AD6,$0AD6,$0A56,$09F6,$0576,$00F6,$0076,$0016
    dw $0011,$080C,$1428,$2044,$3DEF,$24E7,$0800
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6B5A,$0F5A,$0ADA,$0A5A,$05BA,$011A,$009A,$001A
    dw $0014,$0C0F,$182A,$2845,$4A52,$2D08,$0C00
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $7FFF,$13FF,$0F5F,$0EBF,$0A1F,$055F,$04BF,$001F
    dw $0018,$1032,$204C,$3066,$5AB5,$354A,$1000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_FadeInNintendoBootLogo:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0132                   ;8DC7AC;

InstList_PaletteFXObject_Common_FadeInLogo:
    dw $0003                                                             ;8DC7B0;
    dw $0C63,$0C20
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1CE7,$1C60
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2D6B,$2C80
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $3DEF,$3CC0
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4E73,$4CE0
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5EF7,$5D20
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6F7B,$6D40
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $7FFF,$7D80
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_FadeInNintendoCopyright:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0192                   ;8DC7F2;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DC7F6;
    dw InstList_PaletteFXObject_Common_FadeInLogo                        ;8DC7F8;

InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0054                   ;8DC7FA;

InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_1:
    dw $000A                                                             ;8DC7FE;
    dw $0113,$000F,$175C,$0299
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $00B0,$000C,$0AF9,$0236
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $006D,$0009,$0296,$01D3
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $000A,$0006,$0233,$0170
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $0007,$0003,$01D0,$010D
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $000A,$0006,$0233,$0170
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $006D,$0009,$0296,$01D3
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $00B0,$000C,$0AF9,$0236
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_1

InstList_PaletteFXObject_TitleScreenFlickeringDisplays_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$005C                   ;8DC862;

InstList_PaletteFXObject_TitleScreenFlickeringDisplays_1:
    dw $0001                                                             ;8DC866;
    dw $13FF,$0BB1
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $00AC,$0145
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_TitleScreenFlickeringDisplays_1

InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00BE                   ;8DC87A;

InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_1:
    dw $0001                                                             ;8DC87E;
    dw $7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_1

InstList_PaletteFXObject_CutsceneCeresNavigationLight_Sprite:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01DA                   ;8DC88E;

InstList_PaletteFXObject_Common_CeresNavigationLights:
    dw $0004                                                             ;8DC892;
    dw $001F,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $001B,$0004
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0016,$0009
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0012,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $000D,$0012
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0009,$0016
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0004,$001B
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0000,$001F
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0004,$001B
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0009,$0016
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $000D,$0012
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0012,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0016,$0009
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $001B,$0004
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_CeresNavigationLights

InstList_PaletteFXObject_CutsceneCeresNavigationLights_BG:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00DA                   ;8DC906;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DC90A;
    dw InstList_PaletteFXObject_Common_CeresNavigationLights             ;8DC90C;

InstList_PaletteFXObject_FadeInPlanetZebesText:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0102                   ;8DC90E;
    dw $0003
    dw $0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1084,$0C63,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2529,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $35AD,$294A,$1084
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4A52,$39CE,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5AD6,$4631,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6F7B,$56B5,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $7FFF,$6318,$294A
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_FadeOutPlanetZebesText:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0102                   ;8DC964;
    dw $0003
    dw $7FFF,$6318,$294A
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6F7B,$56B5,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5AD6,$4631,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4A52,$39CE,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $35AD,$294A,$1084
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2529,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1084,$0C63,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_OldMotherBrainFightBGLights_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0028                   ;8DC9BA;

InstList_PaletteFXObject_OldMotherBrainFightBGLights_1:
    dw $0006                                                             ;8DC9BE;
    dw $7FFF,$6318,$294A
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $6F7B,$56B5,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $5AD6,$4631,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $4A52,$39CE,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $35AD,$294A,$1084
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $2529,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1084,$0C63,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1084,$0C63,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $2529,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $35AD,$294A,$1084
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $4A52,$39CE,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $5AD6,$4631,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $6F7B,$56B5,$2529
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_OldMotherBrainFightBGLights_1

InstList_PaletteFXObject_GunshipGlow_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01FE                   ;8DCA4E;

InstList_PaletteFXObject_GunshipGlow_1:
    dw $0005                                                             ;8DCA52;
    dw $0000
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0402
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0404
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0806
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0C08
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0C0A
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $100C
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $180E
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $100C
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0C0A
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0C08
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0806
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0404
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0402
    dw Instruction_PaletteFXObject_Done                                  ;8DCAA4;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DCAA6;
    dw InstList_PaletteFXObject_GunshipGlow_1                            ;8DCAA8;

InstList_PaletteFXObject_FadeOutZoomedOutExplodingZebes:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01E0                   ;8DCAAA;
    dw $0008
    dw $2003,$0E9A,$05F9,$0596,$0133,$008E,$0009,$0005
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2003,$01F5,$0154,$00F0,$008E,$0009,$0004,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$0150,$00AF,$004B,$0009,$0004,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$00AB,$000A,$0006,$0004,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$0006,$0005,$0001,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$0001,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_WidePartOfZebesExplosion_Foreground:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0002                   ;8DCB3C;
    dw $0004
    dw $7C00,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $7CA0,$7CA0,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $7DE0,$7DE0,$7DE0,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $003C
    dw $7DE0,$7DE0,$7DE0,$7DE0,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7E80,$7E80,$7E80,$7E80,$7E80,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7F20,$7F20,$7F20,$7F20,$7F20,$7F20,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFD,$7FE9,$7FE9,$7FE9,$7FE9,$7FE9,$7FE9,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFD,$7FFD,$7FF3,$7FF3,$7FF3,$7FF3,$7FF3,$7FE9,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFD,$7FFD,$7FFD,$7FF8,$7FF8,$7FF8,$7FF8,$7FE9,$2940,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFD,$7FFD,$7FFD,$7FFD,$7FFD,$7FFD,$7FF8,$7FF8,$7FE9,$2940,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$6B40
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FF7
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_ZebesExplosionFinale:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DCD62;
    dw $0002
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $6F7B,$6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_WidePartOfZebesExplosion_Background:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0022                   ;8DD362;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DD366;
    dw InstList_PaletteFXObject_Common_ZebesExplosion                    ;8DD368;

InstList_PaletteFXObject_WhiteOutSpaceDuringZebesExplosion:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0000                   ;8DD36A;

InstList_PaletteFXObject_Common_ZebesExplosion:
    dw $000E                                                             ;8DD36E;
    dw $0000
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0842
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $1084
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $1CE7
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $2529
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $2D6B
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $35AD
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $3DEF
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $4A52
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $5294
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $5AD6
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $6318
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $6B5A
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $77BD
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $7FFF
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01C2                   ;8DD3CA;

InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_1:
    dw $0010                                                             ;8DD3CE;
    dw $6B9C,$5EBB,$49FA,$3D58,$2CD4,$408F,$288A,$1C47
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $77FF,$6B1E,$565D,$49BB,$3516,$44B0,$288B,$1C48
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $7FFF,$777F,$62BF,$561E,$3937,$48D1,$288C,$1C49
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $7FFF,$7FDF,$7F7F,$6ABF,$3D58,$5113,$2CAE,$206B
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $7FFF,$777F,$62BF,$561E,$3937,$48D1,$288C,$1C49
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $77FF,$6B1E,$565D,$49BB,$3516,$44B0,$288B,$1C48
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_1

InstList_PaletteFXObject_ExplodingZebesLava_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0080                   ;8DD44A;

InstList_PaletteFXObject_ExplodingZebesLava_1:
    dw $0009                                                             ;8DD44E;
    dw $0012
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $000F
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $000C
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $0009
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0006
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0003
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $0006
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $0009
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $000C
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $000F
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_ExplodingZebesLava_1

InstList_PaletteFXObject_FadeOutExplodingZebesCrust:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0082                   ;8DD48E;
    dw $0014
    dw $0864,$0884,$0CA6,$10C7,$0CC8,$0D07,$0D0A,$0CEC,$0D2C,$112C,$118E,$0D70,$11F4,$1633,$1698
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0443,$0463,$0885,$0CA6,$08A7,$08E6,$08E8,$08CA,$08EA,$0CEA,$0D4C,$092E,$0DB1,$11D0,$1235
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0443,$0463,$0864,$0C85,$0886,$08C5,$08C7,$08A9,$08C9,$0CC9,$0D2A,$090C,$0D6F,$0D8E,$0DF2
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0422,$0442,$0463,$0864,$0465,$04A4,$04A6,$0487,$04A7,$08A7,$08E8,$04CA,$092C,$0D4B,$0D8F
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0422,$0442,$0443,$0863,$0464,$0483,$0485,$0466,$0486,$0886,$08C7,$04A8,$08EA,$0909,$094C
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0021,$0021,$0422,$0442,$0443,$0462,$0463,$0444,$0464,$0464,$0485,$0486,$04A7,$04C7,$04E9
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0001,$0021,$0021,$0421,$0022,$0041,$0042,$0023,$0043,$0443,$0463,$0044,$0465,$0484,$04A6
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0000,$0000,$0000,$0000,$0001,$0020,$0021,$0001,$0021,$0021,$0021,$0022,$0022,$0042,$0043
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_FadeOutExplodingZebesGreyClouds:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A2                   ;8DD5A4;
    dw $000E
    dw $0842,$0C63,$1084,$14A5,$18C6,$1CE7,$2108,$2529,$2D6B,$318C,$39CE,$4631,$4A52,$5294,$6318
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0421,$0842,$0C63,$1084,$14A5,$18C6,$1CE7,$1CE7,$2529,$294A,$318C,$39CE,$3DEF,$4631,$56B5
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0421,$0842,$0C63,$0C63,$1084,$14A5,$18C6,$18C6,$2108,$2529,$294A,$318C,$35AD,$3DEF,$4A52
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0421,$0421,$0842,$0C63,$0C63,$1084,$14A5,$14A5,$18C6,$1CE7,$2108,$294A,$2D6B,$318C,$3DEF
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0421,$0421,$0842,$0842,$0C63,$0C63,$1084,$1084,$14A5,$18C6,$1CE7,$2108,$2529,$294A,$318C
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0000,$0421,$0421,$0421,$0842,$0842,$0C63,$0C63,$1084,$1084,$14A5,$18C6,$18C6,$1CE7,$2529
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0000,$0000,$0421,$0421,$0421,$0421,$0842,$0842,$0842,$0C63,$0C63,$1084,$1084,$14A5,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0421,$0421,$0421,$0421,$0421,$0842,$0842,$0842,$0C63
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_GunshipEmergingFromZebesExplosion:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A0                   ;8DD6BA;
    dw $0018
    dw $0000,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$6F7B,$6B7B,$6B5A,$6B5A,$6B7B,$6B7B,$6B7B,$6B5B,$6F7A,$6B7A,$6B7A,$6F7B,$6F5A,$6B5A,$6B5B
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$5F18,$5AF8,$5AD6,$5AD6,$5B18,$5AF7,$5AF7,$5AD7,$5F16,$5AF6,$5AF6,$5EF7,$5ED6,$5AD6,$5AD7
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$4EB5,$4694,$4652,$4631,$4A94,$4674,$4673,$4653,$4EB1,$4A71,$4A71,$4E73,$4E52,$4A52,$4A33
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$4231,$3611,$35CE,$35AD,$3631,$3610,$35F0,$35CF,$3E2D,$3A0D,$35ED,$41EF,$3DCE,$39AD,$35AF
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$31CE,$21AD,$214A,$2108,$25AD,$218D,$216C,$214B,$2DC8,$2988,$2568,$316B,$2D4A,$2929,$250B
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$216B,$112A,$10C6,$1084,$154A,$1109,$10E8,$10C7,$1D64,$1904,$14E4,$20E7,$1CC6,$18A5,$1487
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$1508,$00C7,$0042,$0000,$04E7,$00A6,$0085,$0043,$1100,$08A0,$0460,$1484,$0C42,$0821,$0404
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$1508,$00C7,$0042,$0000,$04E7,$00A6,$0085,$0043,$1100,$08A0,$0460,$1484,$0C42,$0821,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$1D6B,$010A,$0063,$0000,$094A,$00E8,$00C7,$0064,$1560,$0CE0,$0880,$1CC6,$1063,$0C42,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$25CE,$014C,$0064,$0000,$098C,$012B,$00E9,$0086,$1DE0,$1120,$08C0,$24E7,$1884,$1042,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$2E31,$018F,$0085,$0000,$0DEF,$016D,$012B,$00A7,$2240,$1560,$0CE0,$2D29,$1CA5,$1463,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$3295,$05F1,$00A7,$0000,$0E32,$01AF,$014C,$00E9,$2AA0,$19C0,$0D00,$314A,$20C6,$1463,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$3AF8,$0634,$00C8,$0000,$1295,$01F1,$018E,$010A,$2F00,$1E00,$1120,$398C,$24E7,$1884,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$435B,$0676,$00C9,$0000,$12D7,$0234,$01B0,$012C,$3780,$2240,$1160,$41AD,$2D08,$1C84,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$4BBE,$06B9,$00EA,$0000,$173A,$0276,$01F2,$014D,$3BE0,$2680,$1580,$49EF,$3129,$20A5,$0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_HyperBeam_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01C2                   ;8DD900;

InstList_PaletteFXObject_HyperBeam_1:
    dw $0002                                                             ;8DD904;
    dw $7FFF,$661F,$351F,$001F,$673F,$4E7F,$319F,$18DF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$36BD,$1D9B,$00D9,$6B9F,$4F3F,$2EDF,$0E7F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$033B,$0216,$0173,$6BFF,$4BFF,$2BFF,$03FF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$1F8E,$164B,$0D8A,$6BFD,$4BF9,$2BF5,$03F0
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA,$03E0
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$5F60,$4A40,$3540,$77B4,$5F8E,$4B28,$3301
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7EC0,$6DE0,$54E0,$7F6E,$730A,$6665,$5E22
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7D70,$650B,$4486,$7F37,$7A75,$71B2,$652E
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7C1F,$5816,$300C,$7EDF,$7DDF,$7CDF,$681A
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$711F,$489B,$1816,$731F,$663F,$593F,$407D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_HyperBeam_1

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PaletteFXObject_8DD9D0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A0                   ;8DD9D0;
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $739C,$77BD,$73BD,$73BD,$739C,$77BD,$73BD,$73BD,$73BD,$77BC,$77BC,$77BC,$77BD,$77BD,$77BD,$77BD
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $6B5A,$6F9C,$6B7B,$6B7B,$6B5A,$6F7B,$6B7B,$6B7B,$6B7B,$6F9A,$6F7A,$6F7A,$6F7B,$6F7B,$6F7B,$739C
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $6318,$675A,$635A,$6339,$6318,$675A,$635A,$6339,$6339,$6758,$6758,$6738,$6739,$6739,$6739,$6B5A
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $5AD6,$6339,$5B18,$5AF7,$5AD6,$5F18,$5B18,$5AF8,$5AF7,$5F36,$5F16,$5EF6,$62F7,$5EF7,$5EF7,$6739
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $5294,$5AF7,$52D7,$52B5,$5294,$56F7,$52D7,$52D6,$52B6,$5AF4,$56D4,$56B4,$5AD6,$56B5,$56B5,$5EF7
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4A52,$52D6,$4AB5,$4A73,$4A52,$4EB5,$4AB5,$4A94,$4A74,$52D2,$4EB2,$4E72,$5294,$4E73,$4E73,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4210,$4A94,$4274,$4231,$4210,$4694,$4273,$4252,$4232,$4A90,$4670,$4630,$4A52,$4631,$4631,$5294
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $39CE,$4673,$3A32,$39F0,$39CE,$3E52,$3A32,$3A11,$3A10,$426E,$3E2E,$3E0E,$4610,$41EF,$3DEF,$4E73
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $318C,$3E31,$3211,$31AE,$318C,$3631,$3210,$31CF,$31CE,$3A2C,$360C,$35CC,$3DCE,$39AD,$35AD,$4631
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $294A,$3610,$29CF,$296C,$294A,$2DEF,$29CF,$29AD,$298D,$360A,$2DCA,$2D8A,$35AD,$316B,$2D6B,$4210
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PaletteFXObject_SamusLoading_PowerSuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0180                   ;8DDB62;
    dw Instruction_PaletteFXObject_TimerInY : db $24                     ;8DDB66;

InstList_PaletteFXObject_SamusLoading_PowerSuit_1:
    dw $0003                                                             ;8DDB69;
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_1
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_PowerSuit_2:
    dw $0003                                                             ;8DDBB8;
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_2
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_PowerSuit_3:
    dw $0003
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$516E,$4BBD,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$4AB5,$496B,$52B6,$61A4,$5114,$50AD
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_3
    dw Instruction_PaletteFXObject_TimerInY : db $02

InstList_PaletteFXObject_SamusLoading_PowerSuit_4:
    dw $0003
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$28CE,$37BD,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$36B5,$356B,$2A16,$3904,$2874,$280D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_4
    dw $0001
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_SamusLoading_VairaSuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0180                   ;8DDCC8;
    dw Instruction_PaletteFXObject_TimerInY : db $24                     ;8DDCCC;

InstList_PaletteFXObject_SamusLoading_VairaSuit_1:
    dw $0003                                                             ;8DDCCF;
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$765E,$752E,$524D,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_1
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_VairaSuit_2:
    dw $0003
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$765E,$752E,$524D,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_2
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_VairaSuit_3:
    dw $0003
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$5108,$52FF,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$51BE,$508E,$3E4D,$61A4,$5114,$50AD
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_3
    dw Instruction_PaletteFXObject_TimerInY : db $02

InstList_PaletteFXObject_SamusLoading_VairaSuit_4:
    dw $0003
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$2908,$2AFF,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$29BE,$288E,$2A4D,$3904,$2874,$280D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_4
    dw $0001
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_SamusLoading_GravitySuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0180                   ;8DDE2E;
    dw Instruction_PaletteFXObject_TimerInY : db $24                     ;8DDE32;

InstList_PaletteFXObject_SamusLoading_GravitySuit_1:
    dw $0003                                                             ;8DDE35;
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_1
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_GravitySuit_2:
    dw $0003
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_2
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_GravitySuit_3:
    dw $0003
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114,$50AD
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_3
    dw Instruction_PaletteFXObject_TimerInY : db $02

InstList_PaletteFXObject_SamusLoading_GravitySuit_4:
    dw $0003
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874,$280D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_4
    dw $0001
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_PostCreditsSuperMetroidIconGlare:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01E0                   ;8DDF94;
    dw $0001
    dw $2DEB,$119F,$10B2,$1088,$127F,$1153,$10AC,$135F,$11D3,$10EC,$7BE4,$79C4,$4C84,$4BFF,$13FF,$28E7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $3A4E,$21FF,$2134,$210C,$22BF,$21B5,$212F,$237F,$2235,$216F,$7BE8,$7A28,$5508,$53FF,$23FF,$356B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $4691,$365F,$35B6,$35B0,$36FF,$3637,$35B2,$379F,$3697,$35F2,$7BED,$7A8D,$5DAD,$5BFF,$37FF,$45EF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $56F5,$46BF,$4658,$4633,$473F,$4699,$4655,$479F,$46D9,$4675,$7BF1,$7AD1,$6631,$63FF,$47FF,$5273
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $6338,$5B1F,$5ADA,$5AD7,$5B7F,$5B1B,$5AD8,$5BBF,$5B3B,$5AF8,$7BF6,$7B36,$6ED6,$6BFF,$5BFF,$62F7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $6F9B,$6B7F,$6B5C,$6B5B,$6BBF,$6B7D,$6B5B,$6BDF,$6B9D,$6B7B,$7BFA,$7B9A,$775A,$73FF,$6BFF,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $6F9B,$6B7F,$6B5C,$6B5B,$6BBF,$6B7D,$6B5B,$6BDF,$6B9D,$6B7B,$7BFA,$7B9A,$775A,$73FF,$6BFF,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $6338,$5B1F,$5ADA,$5AD7,$5B7F,$5B1B,$5AD8,$5BBF,$5B3B,$5AF8,$7BF6,$7B36,$6ED6,$6BFF,$5BFF,$62F7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $56F5,$46BF,$4658,$4633,$473F,$4699,$4655,$479F,$46D9,$4675,$7BF1,$7AD1,$6631,$63FF,$47FF,$5273
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $4691,$365F,$35B6,$35B0,$36FF,$3637,$35B2,$379F,$3697,$35F2,$7BED,$7A8D,$5DAD,$5BFF,$37FF,$45EF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $3A4E,$21FF,$2134,$210C,$22BF,$21B5,$212F,$237F,$2235,$216F,$7BE8,$7A28,$5508,$53FF,$23FF,$356B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $2DEB,$119F,$10B2,$1088,$127F,$1153,$10AC,$135F,$11D3,$10EC,$7BE4,$79C4,$4C84,$4BFF,$13FF,$28E7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $21A8,$013F,$0030,$0005,$025F,$00F2,$0029,$035F,$0192,$0089,$7BE0,$7980,$4400,$43FF,$03FF,$1C84
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_Delete:
    dw Instruction_Delete_8DC5CF                                         ;8DE192;

PaletteFXObjects_FadeInSuperMetroidTitleLogo:
    dw RTS_8DC685                                                        ;8DE194;
    dw InstList_PaletteFXObject_FadeInSuperMetroidTitleLogo              ;8DE196;

if !FEATURE_KEEP_UNREFERENCED
PaletteFXObjects_FadeInNintendoBootLogoForUnusedCode:
    dw RTS_8DC685                                                        ;8DE198;
    dw InstList_PaletteFXObject_FadeInNintendoBootLogo                   ;8DE19A;
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_FadeInNintendoCopyright:
    dw RTS_8DC685                                                        ;8DE19C;
    dw InstList_PaletteFXObject_FadeInNintendoCopyright                  ;8DE19E;

PaletteFXObjects_TitleScreenBabyMetroidTubeLight:
    dw RTS_8DC685                                                        ;8DE1A0;
    dw InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_0        ;8DE1A2;

PaletteFXObjects_TitleScreenFlickeringDisplays:
    dw RTS_8DC685                                                        ;8DE1A4;
    dw InstList_PaletteFXObject_TitleScreenFlickeringDisplays_0          ;8DE1A6;

PaletteFXObjects_CutsceneGunshipEngineFlicker:
    dw RTS_8DC685                                                        ;8DE1A8;
    dw InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_0           ;8DE1AA;

PaletteFXObjects_CutsceneCeresNavigationLights_SpriteCeres:
    dw RTS_8DC685                                                        ;8DE1AC;
    dw InstList_PaletteFXObject_CutsceneCeresNavigationLight_Sprite      ;8DE1AE;

PaletteFXObjects_FadeInPlanetZebesText:
    dw RTS_8DC685                                                        ;8DE1B0;
    dw InstList_PaletteFXObject_FadeInPlanetZebesText                    ;8DE1B2;

PaletteFXObjects_FadeOutPlanetZebesText:
    dw RTS_8DC685                                                        ;8DE1B4;
    dw InstList_PaletteFXObject_FadeOutPlanetZebesText                   ;8DE1B6;

PaletteFXObjects_CutsceneCeresNavigationLights_BGCeres:
    dw RTS_8DC685                                                        ;8DE1B8;
    dw InstList_PaletteFXObject_CutsceneCeresNavigationLights_BG         ;8DE1BA;

PaletteFXObjects_OldMotherBrainFightBackgroundLights:
    dw Setup_PaletteFXObject_OldMotherBrainFightBackgroundLights         ;8DE1BC;
    dw InstList_PaletteFXObject_OldMotherBrainFightBGLights_0            ;8DE1BE;

PaletteFXObjects_GunshipGlow:
    dw RTS_8DC685                                                        ;8DE1C0;
    dw InstList_PaletteFXObject_GunshipGlow_0                            ;8DE1C2;

PaletteFXObjects_FadeOutZoomedOutExplodingZebes:
    dw RTS_8DC685                                                        ;8DE1C4;
    dw InstList_PaletteFXObject_FadeOutZoomedOutExplodingZebes           ;8DE1C6;

PaletteFXObjects_WidePartOfZebesExplosion_Foreground:
    dw RTS_8DC685                                                        ;8DE1C8;
    dw InstList_PaletteFXObject_WidePartOfZebesExplosion_Foreground      ;8DE1CA;

PaletteFXObjects_ZebesExplosionFinale:
    dw RTS_8DC685                                                        ;8DE1CC;
    dw InstList_PaletteFXObject_ZebesExplosionFinale                     ;8DE1CE;

PaletteFXObjects_WhiteOutSpaceDuringZebesExplosion:
    dw RTS_8DC685                                                        ;8DE1D0;
    dw InstList_PaletteFXObject_WhiteOutSpaceDuringZebesExplosion        ;8DE1D2;

PaletteFXObjects_ZebesExplosionPlanetAfterglow:
    dw RTS_8DC685                                                        ;8DE1D4;
    dw InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_0          ;8DE1D6;

PaletteFXObjects_ExplodingZebesLava:
    dw RTS_8DC685                                                        ;8DE1D8;
    dw InstList_PaletteFXObject_ExplodingZebesLava_0                     ;8DE1DA;

PaletteFXObjects_FadeOutExplodingZebesCrust:
    dw RTS_8DC685                                                        ;8DE1DC;
    dw InstList_PaletteFXObject_FadeOutExplodingZebesCrust               ;8DE1DE;

PaletteFXObjects_FadeOutExplodingZebesGreyClouds:
    dw RTS_8DC685                                                        ;8DE1E0;
    dw InstList_PaletteFXObject_FadeOutExplodingZebesGreyClouds          ;8DE1E2;

PaletteFXObjects_GunshipEmergineFromZebesExplosion:
    dw RTS_8DC685                                                        ;8DE1E4;
    dw InstList_PaletteFXObject_GunshipEmergingFromZebesExplosion        ;8DE1E6;

PaletteFXObjects_WidePartOfZebesExplosion_Background:
    dw RTS_8DC685                                                        ;8DE1E8;
    dw InstList_PaletteFXObject_WidePartOfZebesExplosion_Background      ;8DE1EA;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PaletteFXObjects_8DE1EC:
    dw RTS_8DC685                                                        ;8DE1EC;
    dw UNUSED_InstList_PaletteFXObject_8DD9D0                            ;8DE1EE;
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_HyperBeam:
    dw RTS_8DC685                                                        ;8DE1F0;
    dw InstList_PaletteFXObject_HyperBeam_0                              ;8DE1F2;

PaletteFXObjects_SamusLoading_PowerSuit:
    dw RTS_8DC685                                                        ;8DE1F4;
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_0                 ;8DE1F6;

PaletteFXObjects_SamusLoading_VariaSuit:
    dw RTS_8DC685                                                        ;8DE1F8;
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_0                 ;8DE1FA;

PaletteFXObjects_SamusLoading_GravitySuit:
    dw RTS_8DC685                                                        ;8DE1FC;
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_0               ;8DE1FE;

PaletteFXObjects_PostCreditsSuperMetroidIcon:
    dw RTS_8DC685                                                        ;8DE200;
    dw InstList_PaletteFXObject_PostCreditsSuperMetroidIconGlare         ;8DE202;

Setup_PaletteFXObject_OldMotherBrainFightBackgroundLights:
    LDA.W #PreInstruction_PaletteFXObject_DeleteIfIntroPage2IsActive     ;8DE204;
    STA.W $1EAD,Y                                                        ;8DE207;
    RTS                                                                  ;8DE20A;


PreInstruction_PaletteFXObject_DeleteIfIntroPage2IsActive:
    LDA.W $1F51                                                          ;8DE20B;
    CMP.W #CinematicFunction_Intro_Page2                                 ;8DE20E;
    BNE .return                                                          ;8DE211;
    LDA.W #InstList_PaletteFXObject_Delete                               ;8DE213;
    STA.W $1EBD,X                                                        ;8DE216;
    LDA.W #$0001                                                         ;8DE219;
    STA.W $1ECD,X                                                        ;8DE21C;

.return:
    RTS                                                                  ;8DE21F;


InstList_PaletteFXObject_Nothing:
    dw Instruction_Delete_8DC5CF                                         ;8DE220;

InstList_PaletteFXObject_GreyOutTourianStatue_Draygon:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00C0                   ;8DE222;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE226;
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue              ;8DE228;

InstList_PaletteFXObject_GreyOutTourianStatue_Kraid:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E0                   ;8DE22A;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE22E;
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue              ;8DE230;

InstList_PaletteFXObject_GreyOutTourianStatue_Ridley:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0120                   ;8DE232;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE236;
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue              ;8DE238;

InstList_PaletteFXObject_GreyOutTourianStatue_Phantoon:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0140                   ;8DE23A;

InstList_PaletteFXObject_Common_GreyOutTourianStatue:
    dw $0008                                                             ;8DE23E;
    dw $0000,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B,$0087
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$5BDE,$33DE,$271A,$0E57,$09AF,$050A,$0486
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$63DD,$3F9C,$2EF9,$1655,$118E,$0D0A,$0486
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$67BC,$477B,$36D7,$2234,$198D,$1109,$0885
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$6F9B,$5359,$42D6,$2A32,$1D8D,$14E9,$0885
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$737A,$5B38,$4AB4,$3611,$258C,$18E8,$0C84
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$7B79,$66F6,$5293,$3E0F,$2D6B,$20E8,$0C84
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$7F58,$6ED5,$5A71,$49EE,$356A,$24E7,$1083
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

PreInstruction_PaletteFXObject_DeleteIfEnemy0Died:
    LDA.W $0F8C                                                          ;8DE2E0;
    BNE .return                                                          ;8DE2E3;
    STZ.W $1E7D,X                                                        ;8DE2E5;

.return:
    RTS                                                                  ;8DE2E8;


InstList_PaletteFXObject_BombTorizoBelly_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0132                   ;8DE2E9;
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE2ED;
    dw PreInstruction_PaletteFXObject_DeleteIfEnemy0Died                 ;8DE2EF;

InstList_PaletteFXObject_BombTorizoBelly_1:
    dw $000A                                                             ;8DE2F1;
    dw $6F7F,$51F8,$410E
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $56BC,$3935,$284B
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $4639,$28B2,$1828
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $2D74,$100D,$0403
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $4639,$28B2,$1828
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $56BC,$3935,$284B
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_BombTorizoBelly_1

InstList_PaletteFXObject_GoldenTorizoBelly_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0132                   ;8DE331;
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE335;
    dw PreInstruction_PaletteFXObject_DeleteIfEnemy0Died                 ;8DE337;

InstList_PaletteFXObject_GoldenTorizoBelly_1:
    dw $000A                                                             ;8DE339;
    dw $73E0,$4F20,$2A20
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $5380,$2E20,$0920
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3AC0,$1560,$0480
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $2200,$00A0,$0020
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3AC0,$1560,$0480
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $5380,$2E20,$0920
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_GoldenTorizoBelly_1

PreInstruction_PaletteFXObject_SamusInHeat:
    LDA.W $09A2                                                          ;8DE379;
    AND.W #$0021                                                         ;8DE37C;
    BNE +                                                                ;8DE37F;
    LDA.W $0A4E                                                          ;8DE381;
    CLC                                                                  ;8DE384;
    ADC.W #$4000                                                         ;8DE385;
    STA.W $0A4E                                                          ;8DE388;
    LDA.W $0A50                                                          ;8DE38B;
    ADC.W #$0000                                                         ;8DE38E;
    STA.W $0A50                                                          ;8DE391;
    LDA.W $05B6                                                          ;8DE394;
    BIT.W #$0007                                                         ;8DE397;
    BNE +                                                                ;8DE39A;
    LDA.W #$0046                                                         ;8DE39C;
    CMP.W $09C2                                                          ;8DE39F;
    BCS +                                                                ;8DE3A2;
    LDA.W #$002D                                                         ;8DE3A4;
    JSL.L QueueSound_Lib3_Max6                                           ;8DE3A7;

  + LDA.W $1EED                                                          ;8DE3AB;
    CMP.W $1EEF                                                          ;8DE3AE;
    BEQ .return                                                          ;8DE3B1;
    STA.W $1EEF                                                          ;8DE3B3;
    ASL A                                                                ;8DE3B6;
    TAY                                                                  ;8DE3B7;
    LDA.W #$0001                                                         ;8DE3B8;
    STA.W $1ECD,X                                                        ;8DE3BB;
    LDA.W $09A2                                                          ;8DE3BE;
    BIT.W #$0020                                                         ;8DE3C1;
    BEQ .checkVaria                                                      ;8DE3C4;
    LDA.W #.InstListPointers_gravity                                     ;8DE3C6;
    BRA .setInstListPointer                                              ;8DE3C9;


.checkVaria:
    BIT.W #$0001                                                         ;8DE3CB;
    BEQ .powerSuit                                                       ;8DE3CE;
    LDA.W #.InstListPointers_varia                                       ;8DE3D0;
    BRA .setInstListPointer                                              ;8DE3D3;


.powerSuit:
    LDA.W #.InstListPointers_power                                        ;8DE3D5;

.setInstListPointer:
    STA.B $12                                                            ;8DE3D8;
    LDA.B ($12),Y                                                        ;8DE3DA;
    STA.W $1EBD,X                                                        ;8DE3DC;

.return:
    RTS                                                                  ;8DE3DF;


  .InstListPointers
  ..gravity:
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_2                ;8DE3E0;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_3                ;8DE3E2;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_4                ;8DE3E4;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_5                ;8DE3E6;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_6                ;8DE3E8;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_7                ;8DE3EA;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_8                ;8DE3EC;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_9                ;8DE3EE;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_A                ;8DE3F0;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_B                ;8DE3F2;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_C                ;8DE3F4;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_D                ;8DE3F6;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_E                ;8DE3F8;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_F                ;8DE3FA;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_10               ;8DE3FC;
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_11               ;8DE3FE;

  ..varia:
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_2                  ;8DE400;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_3                  ;8DE402;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_4                  ;8DE404;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_5                  ;8DE406;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_6                  ;8DE408;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_7                  ;8DE40A;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_8                  ;8DE40C;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_9                  ;8DE40E;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_A                  ;8DE410;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_B                  ;8DE412;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_C                  ;8DE414;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_D                  ;8DE416;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_E                  ;8DE418;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_F                  ;8DE41A;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_10                 ;8DE41C;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_11                 ;8DE41E;

  ..power:
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_1                  ;8DE420;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_2                  ;8DE422;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_3                  ;8DE424;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_4                  ;8DE426;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_5                  ;8DE428;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_6                  ;8DE42A;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_7                  ;8DE42C;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_8                  ;8DE42E;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_9                  ;8DE430;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_A                  ;8DE432;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_B                  ;8DE434;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_C                  ;8DE436;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_D                  ;8DE438;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_E                  ;8DE43A;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_F                  ;8DE43C;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_10                 ;8DE43E;

Setup_PaletteFXObject_Norfair1_Tourian1:
    LDA.W $09A2                                                          ;8DE440;
    BIT.W #$0020                                                         ;8DE443;
    BEQ .checkVaria                                                      ;8DE446;
    LDA.W #InstList_PaletteFXObject_SamusInHeat_GravitySuit_0            ;8DE448;
    BRA +                                                                ;8DE44B;


.checkVaria:
    BIT.W #$0001                                                         ;8DE44D;
    BEQ .powerSuit                                                       ;8DE450;
    LDA.W #InstList_PaletteFXObject_SamusInHeat_VariaSuit_0              ;8DE452;
    BRA +                                                                ;8DE455;


.powerSuit:
    LDA.W #InstList_PaletteFXObject_SamusInHeat_PowerSuit_0              ;8DE457;

  + STA.W $1EBD,Y                                                        ;8DE45A;
    RTS                                                                  ;8DE45D;


InstList_PaletteFXObject_SamusInHeat_PowerSuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE45E;
    dw PreInstruction_PaletteFXObject_SamusInHeat                        ;8DE460;
    dw Instruction_PaletteFXObject_ColorIndexInY,$0182                   ;8DE462;

InstList_PaletteFXObject_SamusInHeat_PowerSuit_1:
    dw $0010                                                             ;8DE466;
    dw $0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_2:
    dw $0004                                                             ;8DE488;
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_3:
    dw $0004                                                             ;8DE4AA;
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_4:
    dw $0005                                                             ;8DE4CC;
    dw $010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_5:
    dw $0006                                                             ;8DE4EE;
    dw $010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_6:
    dw $0007                                                             ;8DE510;
    dw $010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_7:
    dw $0008                                                             ;8DE532;
    dw $010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_8:
    dw $0008                                                             ;8DE554;
    dw $010D,$03BE,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$02BA,$0170,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_9:
    dw $0008                                                             ;8DE576;
    dw $010D,$03BE,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$02BA,$0170,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_A:
    dw $0008                                                             ;8DE598;
    dw $010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_B:
    dw $0007                                                             ;8DE5BA;
    dw $010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_C:
    dw $0006                                                             ;8DE5DC;
    dw $010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_D:
    dw $0005                                                             ;8DE5FE;
    dw $010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_E:
    dw $0004                                                             ;8DE620;
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_F:
    dw $0004                                                             ;8DE642;
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_10:
    dw $0003                                                             ;8DE664;
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_11:
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE686;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_1                  ;8DE688;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE68A;
    dw PreInstruction_PaletteFXObject_SamusInHeat                        ;8DE68C;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_1:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0182                   ;8DE68E;

InstList_PaletteFXObject_SamusInHeat_VariaSuit_2:
    dw $0010                                                             ;8DE692;
    dw $0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_3:
    dw $0004                                                             ;8DE6B4;
    dw $0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_4:
    dw $0004                                                             ;8DE6D6;
    dw $0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_5:
    dw $0005                                                             ;8DE6F8;
    dw $010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_6:
    dw $0006                                                             ;8DE71A;
    dw $010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_7:
    dw $0007                                                             ;8DE73C;
    dw $010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_8:
    dw $0008                                                             ;8DE75E;
    dw $010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_9:
    dw $0008                                                             ;8DE780;
    dw $010D,$02FF,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$01BF,$0093,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_A:
    dw $0008                                                             ;8DE7A2;
    dw $010D,$02FF,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$01BF,$0093,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_B:
    dw $0008                                                             ;8DE7C4;
    dw $010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_C:
    dw $0007                                                             ;8DE7E6;
    dw $010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_D:
    dw $0006                                                             ;8DE808;
    dw $010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_E:
    dw $0005                                                             ;8DE82A;
    dw $010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_F:
    dw $0004                                                             ;8DE84C;
    dw $0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_10:
    dw $0004                                                             ;8DE86E;
    dw $0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_11:
    dw $0010                                                             ;8DE890;
    dw $0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_12:
    dw Instruction_PaletteFXObject_GotoY                                 ;8DE8B2;
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_2                  ;8DE8B4;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DE8B6;
    dw PreInstruction_PaletteFXObject_SamusInHeat                        ;8DE8B8;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_1:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0182                   ;8DE8BA;

InstList_PaletteFXObject_SamusInHeat_GravitySuit_2:
    dw $0010                                                             ;8DE8BE;
    dw $0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_3:
    dw $0004                                                             ;8DE8E0;
    dw $0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_4:
    dw $0004                                                             ;8DE902;
    dw $0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_5:
    dw $0005                                                             ;8DE924;
    dw $010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_6:
    dw $0006                                                             ;8DE946;
    dw $010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_7:
    dw $0007                                                             ;8DE968;
    dw $010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_8:
    dw $0008                                                             ;8DE98A;
    dw $010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_9:
    dw $0008                                                             ;8DE9AC;
    dw $010D,$421F,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$5919,$30AF,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_A:
    dw $0008                                                             ;8DE9CE;
    dw $010D,$421F,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$5919,$30AF,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_B:
    dw $0008                                                             ;8DE9F0;
    dw $010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_C:
    dw $0007                                                             ;8DEA12;
    dw $010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_D:
    dw $0006                                                             ;8DEA34;
    dw $010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_E:
    dw $0005                                                             ;8DEA56;
    dw $010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_F:
    dw $0004                                                             ;8DEA78;
    dw $0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_10:
    dw $0004                                                             ;8DEA9A;
    dw $0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_11:
    dw $0010                                                             ;8DEABC;
    dw $0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_2

InstList_PaletteFXObject_WreckedShip1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0098                   ;8DEAE2;

InstList_PaletteFXObject_WreckedShip1_1:
    dw $000A                                                             ;8DEAE6;
    dw $1EA9,$0BB1                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $1667,$034E                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $0E25,$02EB                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $05E3,$0288                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $01A1,$0225                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $05E3,$0288                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $0E25,$02EB                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $1667,$034E                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw Instruction_PaletteFXObject_GotoY                           
    dw InstList_PaletteFXObject_WreckedShip1_1                     

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PreInstruction_PaletteFXObject_WaitUntilAreBossIsDead:
    LDA.W #$0001                                                         ;8DEB2A;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;8DEB2D;
    BCS .return                                                          ;8DEB31;
    PLA                                                                  ;8DEB33;
    LDA.W #$0001                                                         ;8DEB34;
    STA.W $1ECD,X                                                        ;8DEB37;

.return:
    RTS                                                                  ;8DEB3A;
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_PaletteFXObject_Crateria1_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DEB3B;
    dw PreInst_PaletteFXObject_RestartCrateria1IfSamusIsntLowEnough      ;8DEB3D;
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEB3F;
    dw $00A8                                                             ;8DEB41;

InstList_PaletteFXObject_Crateria1_1:
    dw $00F0,$2D6C,$294B,$252A,$2109,$1CE8,$18C7,$14A6                   ;8DEB43;
    dw $1085                                                             ;8DEB53;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB55;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DEB57;
    db $02                                                               ;8DEB59;

InstList_PaletteFXObject_Crateria1_2:
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C                   ;8DEB5A;
    dw $294B                                                             ;8DEB6A;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB6C;
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632                   ;8DEB6E;
    dw $4211                                                             ;8DEB7E;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB80;
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8                   ;8DEB82;
    dw $5AD7                                                             ;8DEB92;
    dw Instruction_PaletteFXObject_Done                                  ;8DEB94;
    dw $0001,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DEB96;
    dw $7FFF                                                             ;8DEBA6;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBA8;
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8                   ;8DEBAA;
    dw $5AD7                                                             ;8DEBBA;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBBC;
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632                   ;8DEBBE;
    dw $4211                                                             ;8DEBCE;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBD0;
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C                   ;8DEBD2;
    dw $294B                                                             ;8DEBE2;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBE4;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DEBE6;
    dw InstList_PaletteFXObject_Crateria1_2                              ;8DEBE8;
    dw $00F0,$2D6C,$294B,$252A,$2109,$1CE8,$18C7,$14A6                   ;8DEBEA;
    dw $1085                                                             ;8DEBFA;
    dw Instruction_PaletteFXObject_Done                                  ;8DEBFC;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DEBFE;
    db $01                                                               ;8DEC00;

InstList_PaletteFXObject_Crateria1_3:
    dw $0001,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;8DEC01;
    dw $7FFF                                                             ;8DEC11;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC13;
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8                   ;8DEC15;
    dw $5AD7                                                             ;8DEC25;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC27;
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632                   ;8DEC29;
    dw $4211                                                             ;8DEC39;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC3B;
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C                   ;8DEC3D;
    dw $294B                                                             ;8DEC4D;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC4F;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DEC51;
    dw InstList_PaletteFXObject_Crateria1_3                              ;8DEC53;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEC55;
    dw InstList_PaletteFXObject_Crateria1_1                              ;8DEC57;

PreInst_PaletteFXObject_RestartCrateria1IfSamusIsntLowEnough:
    LDA.W $0AFA                                                          ;8DEC59;
    CMP.W #$0380                                                         ;8DEC5C;
    BCS .return                                                          ;8DEC5F;
    LDA.W #$0001                                                         ;8DEC61;
    STA.W $1ECD,X                                                        ;8DEC64;
    LDA.W #InstList_PaletteFXObject_Crateria1_1                          ;8DEC67;
    STA.W $1EBD,X                                                        ;8DEC6A;

.return:
    RTS                                                                  ;8DEC6D;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PaletteFXObject_DarkLightning_0_8DEC6E:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DEC6E;
    dw UNUSED_PreInst_PalFXObj_RestartDarkLightningIfSamus_8DED84        ;8DEC70;
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEC72;
    dw $0082                                                             ;8DEC74;

UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76:
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86                   ;8DEC76;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC86;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DEC88;
    db $02                                                               ;8DEC8A;

UNUSED_InstList_PaletteFXObject_DarkLightning_2_8DEC8B:
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001                   ;8DEC8B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEC9B;
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000                   ;8DEC9D;
    dw Instruction_PaletteFXObject_Done                                  ;8DECAD;
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000                   ;8DECAF;
    dw Instruction_PaletteFXObject_Done                                  ;8DECBF;
    dw $0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DECC1;
    dw Instruction_PaletteFXObject_Done                                  ;8DECD1;
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000                   ;8DECD3;
    dw Instruction_PaletteFXObject_Done                                  ;8DECE3;
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000                   ;8DECE5;
    dw Instruction_PaletteFXObject_Done                                  ;8DECF5;
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001                   ;8DECF7;
    dw Instruction_PaletteFXObject_Done                                  ;8DED07;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DED09;
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_2_8DEC8B            ;8DED0B;
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86                   ;8DED0D;
    dw Instruction_PaletteFXObject_Done                                  ;8DED1D;
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86                   ;8DED1F;
    dw Instruction_PaletteFXObject_Done                                  ;8DED2F;
    dw Instruction_PaletteFXObject_TimerInY                              ;8DED31;
    db $01                                                               ;8DED33;

UNUSED_InstList_PaletteFXObject_DarkLightning_3_8DED34:
    dw $0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8DED34;
    dw Instruction_PaletteFXObject_Done                                  ;8DED44;
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000                   ;8DED46;
    dw Instruction_PaletteFXObject_Done                                  ;8DED56;
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000                   ;8DED58;
    dw Instruction_PaletteFXObject_Done                                  ;8DED68;
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001                   ;8DED6A;
    dw Instruction_PaletteFXObject_Done                                  ;8DED7A;
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero         ;8DED7C;
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_3_8DED34            ;8DED7E;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DED80;
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76            ;8DED82;

UNUSED_PreInst_PalFXObj_RestartDarkLightningIfSamus_8DED84:
    LDA.W $0AFA                                                          ;8DED84;
    CMP.W #$0380                                                         ;8DED87;
    BCS .return                                                          ;8DED8A;
    LDA.W #$0001                                                         ;8DED8C;
    STA.W $1ECD,X                                                        ;8DED8F;
    LDA.W #UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76        ;8DED92;
    STA.W $1EBD,X                                                        ;8DED95;

.return:
    RTS                                                                  ;8DED98;
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_PaletteFXObject_Brinstar1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DED99;
    dw $00E2                                                             ;8DED9B;

InstList_PaletteFXObject_Brinstar1_1:
    dw $000A,$5D22,$4463,$1840                                           ;8DED9D;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDA5;
    dw $000A,$5901,$4042,$1420                                           ;8DEDA7;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDAF;
    dw $000A,$54E0,$3C21,$1000                                           ;8DEDB1;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDB9;
    dw $000A,$50C0,$3C21,$1000                                           ;8DEDBB;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDC3;
    dw $000A,$4CA0,$3800,$0C00                                           ;8DEDC5;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDCD;
    dw $000A,$4880,$3800,$0C00                                           ;8DEDCF;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDD7;
    dw $000A,$4460,$3400,$0800                                           ;8DEDD9;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDE1;
    dw $000A,$4040,$3400,$0800                                           ;8DEDE3;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDEB;
    dw $000A,$4460,$3400,$0800                                           ;8DEDED;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDF5;
    dw $000A,$4880,$3800,$0C00                                           ;8DEDF7;
    dw Instruction_PaletteFXObject_Done                                  ;8DEDFF;
    dw $000A,$4CA0,$3800,$0C00                                           ;8DEE01;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE09;
    dw $000A,$50C0,$3C21,$1000                                           ;8DEE0B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE13;
    dw $000A,$54E0,$3C21,$1000                                           ;8DEE15;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE1D;
    dw $000A,$5901,$4042,$1420                                           ;8DEE1F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE27;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEE29;
    dw InstList_PaletteFXObject_Brinstar1_1                              ;8DEE2B;

InstList_PaletteFXObject_Brinstar8_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DEE2D;
    dw PreInstruction_PaletteFXObject_DeleteIfAreaMiniBossIsDead         ;8DEE2F;
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEE31;
    dw $00E2                                                             ;8DEE33;

InstList_PaletteFXObject_Brinstar8_1:
    dw $000A,$5D22,$4463,$1840                                           ;8DEE35;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE3D;
    dw $000A,$5901,$4042,$1420                                           ;8DEE3F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE47;
    dw $000A,$54E0,$3C21,$1000                                           ;8DEE49;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE51;
    dw $000A,$50C0,$3C21,$1000                                           ;8DEE53;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE5B;
    dw $000A,$4CA0,$3800,$0C00                                           ;8DEE5D;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE65;
    dw $000A,$4880,$3800,$0C00                                           ;8DEE67;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE6F;
    dw $000A,$4460,$3400,$0800                                           ;8DEE71;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE79;
    dw $000A,$4040,$3400,$0800                                           ;8DEE7B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE83;
    dw $000A,$4460,$3400,$0800                                           ;8DEE85;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE8D;
    dw $000A,$4880,$3800,$0C00                                           ;8DEE8F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEE97;
    dw $000A,$4CA0,$3800,$0C00                                           ;8DEE99;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEA1;
    dw $000A,$50C0,$3C21,$1000                                           ;8DEEA3;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEAB;
    dw $000A,$54E0,$3C21,$1000                                           ;8DEEAD;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEB5;
    dw $000A,$5901,$4042,$1420                                           ;8DEEB7;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEBF;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEEC1;
    dw InstList_PaletteFXObject_Brinstar8_1                              ;8DEEC3;

PreInstruction_PaletteFXObject_DeleteIfAreaMiniBossIsDead:
    PHX                                                                  ;8DEEC5;
    LDX.W $079F                                                          ;8DEEC6;
    LDA.L $7ED828,X                                                      ;8DEEC9;
    PLX                                                                  ;8DEECD;
    AND.W #$0002                                                         ;8DEECE;
    BEQ .return                                                          ;8DEED1;
    STZ.W $1E7D,X                                                        ;8DEED3;

.return:
    RTS                                                                  ;8DEED6;


InstList_PaletteFXObject_Brinstar2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEED7;
    dw $00C8                                                             ;8DEED9;

InstList_PaletteFXObject_Brinstar2_1:
    dw $000A,$4C17,$280F,$2409,$1C07,$1405,$0C03,$0802                   ;8DEEDB;
    dw $0401                                                             ;8DEEEB;
    dw Instruction_PaletteFXObject_Done                                  ;8DEEED;
    dw $000A,$4816,$240E,$2008,$1806,$1004,$0802,$0401                   ;8DEEEF;
    dw $0000                                                             ;8DEEFF;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF01;
    dw $000A,$4415,$200D,$1C07,$1405,$0C03,$0401,$0000                   ;8DEF03;
    dw $0000                                                             ;8DEF13;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF15;
    dw $000A,$4014,$1C0C,$1806,$1004,$0802,$0000,$0000                   ;8DEF17;
    dw $0000                                                             ;8DEF27;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF29;
    dw $000A,$3C13,$180B,$1405,$0C03,$0401,$0000,$0000                   ;8DEF2B;
    dw $0000                                                             ;8DEF3B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF3D;
    dw $000A,$3812,$140A,$1004,$0802,$0000,$0000,$0000                   ;8DEF3F;
    dw $0000                                                             ;8DEF4F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF51;
    dw $000A,$3411,$1009,$0C03,$0401,$0000,$0000,$0000                   ;8DEF53;
    dw $0000                                                             ;8DEF63;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF65;
    dw $000A,$3010,$0C08,$0802,$0000,$0000,$0000,$0000                   ;8DEF67;
    dw $0000                                                             ;8DEF77;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF79;
    dw $000A,$3411,$1009,$0C03,$0401,$0000,$0000,$0000                   ;8DEF7B;
    dw $0000                                                             ;8DEF8B;
    dw Instruction_PaletteFXObject_Done                                  ;8DEF8D;
    dw $000A,$3812,$140A,$1004,$0802,$0000,$0000,$0000                   ;8DEF8F;
    dw $0000                                                             ;8DEF9F;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFA1;
    dw $000A,$3C13,$180B,$1405,$0C03,$0401,$0000,$0000                   ;8DEFA3;
    dw $0000                                                             ;8DEFB3;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFB5;
    dw $000A,$4014,$1C0C,$1806,$1004,$0802,$0000,$0000                   ;8DEFB7;
    dw $0000                                                             ;8DEFC7;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFC9;
    dw $000A,$4415,$200D,$1C07,$1405,$0C03,$0401,$0000                   ;8DEFCB;
    dw $0000                                                             ;8DEFDB;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFDD;
    dw $000A,$4816,$240E,$2008,$1806,$1004,$0802,$0401                   ;8DEFDF;
    dw $0000                                                             ;8DEFEF;
    dw Instruction_PaletteFXObject_Done                                  ;8DEFF1;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DEFF3;
    dw InstList_PaletteFXObject_Brinstar2_1                              ;8DEFF5;

InstList_PaletteFXObject_Crateria80_Brinstar4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DEFF7;
    dw $00E2                                                             ;8DEFF9;

InstList_PaletteFXObject_Crateria80_Brinstar4_1:
    dw $000A,$02BF,$017F,$0015                                           ;8DEFFB;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF003;
    dw $7FFF                                                             ;8DF005;
    dw Instruction_PaletteFXObject_Done                                  ;8DF007;
    dw $000A,$023B,$00FB,$0011                                           ;8DF009;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF011;
    dw $739C                                                             ;8DF013;
    dw Instruction_PaletteFXObject_Done                                  ;8DF015;
    dw $000A,$01D8,$0098,$000E                                           ;8DF017;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF01F;
    dw $5AD6                                                             ;8DF021;
    dw Instruction_PaletteFXObject_Done                                  ;8DF023;
    dw $000A,$0154,$0055,$000B                                           ;8DF025;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF02D;
    dw $4E73                                                             ;8DF02F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF031;
    dw $000A,$00D0,$0010,$0007                                           ;8DF033;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF03B;
    dw $4631                                                             ;8DF03D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF03F;
    dw $000A,$00AA,$000B,$0004                                           ;8DF041;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF049;
    dw $3DEF                                                             ;8DF04B;
    dw Instruction_PaletteFXObject_Done                                  ;8DF04D;
    dw UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib2_Max6_8DC673        ;8DF04F;
    db $18                                                               ;8DF051;
    dw $000A,$00D0,$0010,$0007                                           ;8DF052;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF05A;
    dw $4631                                                             ;8DF05C;
    dw Instruction_PaletteFXObject_Done                                  ;8DF05E;
    dw $000A,$0154,$0055,$000B                                           ;8DF060;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF068;
    dw $4E73                                                             ;8DF06A;
    dw Instruction_PaletteFXObject_Done                                  ;8DF06C;
    dw $000A,$01D8,$0098,$000E                                           ;8DF06E;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF076;
    dw $5AD6                                                             ;8DF078;
    dw Instruction_PaletteFXObject_Done                                  ;8DF07A;
    dw $000A,$023B,$00FB,$0011                                           ;8DF07C;
    dw Instruction_PaletteFXObject_ColorIndex_Plus12                     ;8DF084;
    dw $739C                                                             ;8DF086;
    dw Instruction_PaletteFXObject_Done                                  ;8DF088;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF08A;
    dw InstList_PaletteFXObject_Crateria80_Brinstar4_1                   ;8DF08C;

InstList_PaletteFXObject_Norfair2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF08E;
    dw $006A                                                             ;8DF090;

InstList_PaletteFXObject_Norfair2_1:
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF092;
    db $00                                                               ;8DF094;
    dw $0010,$09FD,$093B,$0459                                           ;8DF095;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF09D;
    dw $09FD,$4A52                                                       ;8DF09F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0A3;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0A5;
    db $01                                                               ;8DF0A7;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF0A8;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0B0;
    dw $0E3D,$4214                                                       ;8DF0B2;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0B6;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0B8;
    db $02                                                               ;8DF0BA;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF0BB;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0C3;
    dw $165E,$39F5                                                       ;8DF0C5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0C9;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0CB;
    db $03                                                               ;8DF0CD;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF0CE;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0D6;
    dw $1A9E,$31D7                                                       ;8DF0D8;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0DC;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0DE;
    db $04                                                               ;8DF0E0;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF0E1;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0E9;
    dw $1EBE,$29D9                                                       ;8DF0EB;
    dw Instruction_PaletteFXObject_Done                                  ;8DF0EF;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF0F1;
    db $05                                                               ;8DF0F3;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF0F4;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF0FC;
    dw $22FE,$21BA                                                       ;8DF0FE;
    dw Instruction_PaletteFXObject_Done                                  ;8DF102;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF104;
    db $06                                                               ;8DF106;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF107;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF10F;
    dw $2B1F,$199C                                                       ;8DF111;
    dw Instruction_PaletteFXObject_Done                                  ;8DF115;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF117;
    db $07                                                               ;8DF119;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF11A;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF122;
    dw $2F5F,$0D7F                                                       ;8DF124;
    dw Instruction_PaletteFXObject_Done                                  ;8DF128;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF12A;
    db $08                                                               ;8DF12C;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF12D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF135;
    dw $2F5F,$0D7F                                                       ;8DF137;
    dw Instruction_PaletteFXObject_Done                                  ;8DF13B;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF13D;
    db $09                                                               ;8DF13F;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF140;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF148;
    dw $2B1F,$199C                                                       ;8DF14A;
    dw Instruction_PaletteFXObject_Done                                  ;8DF14E;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF150;
    db $0A                                                               ;8DF152;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF153;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF15B;
    dw $22FE,$21BA                                                       ;8DF15D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF161;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF163;
    db $0B                                                               ;8DF165;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF166;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF16E;
    dw $1EBE,$29D9                                                       ;8DF170;
    dw Instruction_PaletteFXObject_Done                                  ;8DF174;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF176;
    db $0C                                                               ;8DF178;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF179;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF181;
    dw $1A9E,$31D7                                                       ;8DF183;
    dw Instruction_PaletteFXObject_Done                                  ;8DF187;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF189;
    db $0D                                                               ;8DF18B;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF18C;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF194;
    dw $165E,$39F5                                                       ;8DF196;
    dw Instruction_PaletteFXObject_Done                                  ;8DF19A;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF19C;
    db $0E                                                               ;8DF19E;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF19F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF1A7;
    dw $0E3D,$4214                                                       ;8DF1A9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF1AD;
    dw Instruction_PaletteFXObject_1EED_InY                              ;8DF1AF;
    db $0F                                                               ;8DF1B1;
    dw $0010,$09FD,$093B,$0459                                           ;8DF1B2;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF1BA;
    dw $09FD,$4A52                                                       ;8DF1BC;
    dw Instruction_PaletteFXObject_Done                                  ;8DF1C0;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF1C2;
    dw InstList_PaletteFXObject_Norfair2_1                               ;8DF1C4;

Instruction_PaletteFXObject_1EED_InY:
    LDA.W $0000,Y                                                        ;8DF1C6;
    AND.W #$00FF                                                         ;8DF1C9;
    STA.W $1EED                                                          ;8DF1CC;
    INY                                                                  ;8DF1CF;
    RTS                                                                  ;8DF1D0;


InstList_PaletteFXObject_Norfair4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF1D1;
    dw $0082                                                             ;8DF1D3;

InstList_PaletteFXObject_Norfair4_1:
    dw $0010,$09FD,$093B,$0459                                           ;8DF1D5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF1DD;
    dw $4309,$0C77                                                       ;8DF1DF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF1E3;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF1E5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF1ED;
    dw $36AC,$0CB8                                                       ;8DF1EF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF1F3;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF1F5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF1FD;
    dw $328F,$1119                                                       ;8DF1FF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF203;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF205;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF20D;
    dw $2A52,$157A                                                       ;8DF20F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF213;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF215;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF21D;
    dw $2214,$15BB                                                       ;8DF21F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF223;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF225;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF22D;
    dw $1DF7,$1A1C                                                       ;8DF22F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF233;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF235;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF23D;
    dw $15BA,$1E7D                                                       ;8DF23F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF243;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF245;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF24D;
    dw $0D7F,$22FF                                                       ;8DF24F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF253;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF255;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF25D;
    dw $0D7F,$22FF                                                       ;8DF25F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF263;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF265;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF26D;
    dw $15BA,$1E7D                                                       ;8DF26F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF273;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF275;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF27D;
    dw $1DF7,$1A1C                                                       ;8DF27F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF283;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF285;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF28D;
    dw $2214,$15BB                                                       ;8DF28F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF293;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF295;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF29D;
    dw $2A52,$157A                                                       ;8DF29F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2A3;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF2A5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2AD;
    dw $328F,$1119                                                       ;8DF2AF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2B3;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF2B5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2BD;
    dw $36AC,$0CB8                                                       ;8DF2BF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2C3;
    dw $0010,$09FD,$093B,$0459                                           ;8DF2C5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2CD;
    dw $4309,$0C77                                                       ;8DF2CF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2D3;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF2D5;
    dw InstList_PaletteFXObject_Norfair4_1                               ;8DF2D7;

InstList_PaletteFXObject_Norfair8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF2D9;
    dw $00A2                                                             ;8DF2DB;

InstList_PaletteFXObject_Norfair8_1:
    dw $0010,$09FD,$093B,$0459                                           ;8DF2DD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2E5;
    dw $2DB3,$38CF                                                       ;8DF2E7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2EB;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF2ED;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF2F5;
    dw $2594,$30D1                                                       ;8DF2F7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF2FB;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF2FD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF305;
    dw $2176,$28D3                                                       ;8DF307;
    dw Instruction_PaletteFXObject_Done                                  ;8DF30B;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF30D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF315;
    dw $1D57,$24D5                                                       ;8DF317;
    dw Instruction_PaletteFXObject_Done                                  ;8DF31B;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF31D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF325;
    dw $1959,$20F7                                                       ;8DF327;
    dw Instruction_PaletteFXObject_Done                                  ;8DF32B;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF32D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF335;
    dw $153B,$18F9                                                       ;8DF337;
    dw Instruction_PaletteFXObject_Done                                  ;8DF33B;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF33D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF345;
    dw $111C,$14FB                                                       ;8DF347;
    dw Instruction_PaletteFXObject_Done                                  ;8DF34B;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF34D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF355;
    dw $0D1F,$0D1F                                                       ;8DF357;
    dw Instruction_PaletteFXObject_Done                                  ;8DF35B;
    dw $0008,$2F5F,$1EDF,$1A7F                                           ;8DF35D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF365;
    dw $0D1F,$0D1F                                                       ;8DF367;
    dw Instruction_PaletteFXObject_Done                                  ;8DF36B;
    dw $0008,$2B1F,$1A9E,$163E                                           ;8DF36D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF375;
    dw $111C,$14FB                                                       ;8DF377;
    dw Instruction_PaletteFXObject_Done                                  ;8DF37B;
    dw $0007,$22FE,$1A5E,$15DD                                           ;8DF37D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF385;
    dw $153B,$18F9                                                       ;8DF387;
    dw Instruction_PaletteFXObject_Done                                  ;8DF38B;
    dw $0006,$1EBE,$161D,$119C                                           ;8DF38D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF395;
    dw $1959,$20F7                                                       ;8DF397;
    dw Instruction_PaletteFXObject_Done                                  ;8DF39B;
    dw $0005,$1A9E,$11FD,$0D3C                                           ;8DF39D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3A5;
    dw $1D57,$24D5                                                       ;8DF3A7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3AB;
    dw $0004,$165E,$0DBC,$08FB                                           ;8DF3AD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3B5;
    dw $2176,$28D3                                                       ;8DF3B7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3BB;
    dw $0004,$0E3D,$0D7C,$089A                                           ;8DF3BD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3C5;
    dw $2594,$30D1                                                       ;8DF3C7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3CB;
    dw $0010,$09FD,$093B,$0459                                           ;8DF3CD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3D5;
    dw $2DB3,$38CF                                                       ;8DF3D7;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3DB;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF3DD;
    dw InstList_PaletteFXObject_Norfair8_1                               ;8DF3DF;

InstList_PaletteFXObject_Norfair10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF3E1;
    dw $00C2                                                             ;8DF3E3;

InstList_PaletteFXObject_Norfair10_1:
    dw $0010,$09DA,$091A,$087A                                           ;8DF3E5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3ED;
    dw $08A8,$0C05                                                       ;8DF3EF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF3F3;
    dw $0004,$0DDA,$093A,$089A                                           ;8DF3F5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF3FD;
    dw $08AA,$0828                                                       ;8DF3FF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF403;
    dw $0004,$0DFA,$0D5A,$08BA                                           ;8DF405;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF40D;
    dw $08AC,$084A                                                       ;8DF40F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF413;
    dw $0005,$11FA,$0D7A,$08FA                                           ;8DF415;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF41D;
    dw $08CF,$086D                                                       ;8DF41F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF423;
    dw $0006,$161A,$119A,$0D1A                                           ;8DF425;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF42D;
    dw $08D1,$0890                                                       ;8DF42F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF433;
    dw $0007,$1A1A,$11BA,$0D3A                                           ;8DF435;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF43D;
    dw $08F4,$08B3                                                       ;8DF43F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF443;
    dw $0008,$1A3A,$15DA,$0D7A                                           ;8DF445;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF44D;
    dw $08F6,$08D5                                                       ;8DF44F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF453;
    dw $0008,$225A,$1A1A,$11BA                                           ;8DF455;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF45D;
    dw $091A,$091A                                                       ;8DF45F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF463;
    dw $0008,$225A,$1A1A,$11BA                                           ;8DF465;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF46D;
    dw $091A,$091A                                                       ;8DF46F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF473;
    dw $0008,$1A3A,$15DA,$0D7A                                           ;8DF475;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF47D;
    dw $08F6,$08D5                                                       ;8DF47F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF483;
    dw $0007,$1A1A,$11BA,$0D3A                                           ;8DF485;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF48D;
    dw $08F4,$08B3                                                       ;8DF48F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF493;
    dw $0006,$161A,$119A,$0D1A                                           ;8DF495;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF49D;
    dw $08D1,$0890                                                       ;8DF49F;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4A3;
    dw $0005,$11FA,$0D7A,$08FA                                           ;8DF4A5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF4AD;
    dw $08CF,$086D                                                       ;8DF4AF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4B3;
    dw $0004,$0DFA,$0D5A,$08BA                                           ;8DF4B5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF4BD;
    dw $08AC,$084A                                                       ;8DF4BF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4C3;
    dw $0004,$0DDA,$093A,$089A                                           ;8DF4C5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF4CD;
    dw $08AA,$0828                                                       ;8DF4CF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4D3;
    dw $0010,$09DA,$091A,$087A                                           ;8DF4D5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus10                     ;8DF4DD;
    dw $08A8,$0C05                                                       ;8DF4DF;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4E3;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF4E5;
    dw InstList_PaletteFXObject_Norfair10_1                              ;8DF4E7;

InstList_PaletteFXObject_Maridia1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF4E9;
    dw $0048                                                             ;8DF4EB;

InstList_PaletteFXObject_Maridia1_1:
    dw $000A,$3ED9,$2E57,$2A35,$25F3,$25D2,$1DB0,$196E                   ;8DF4ED;
    dw $112E                                                             ;8DF4FD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF4FF;
    dw $000A,$2E57,$2A35,$25F3,$3ED9,$1DB0,$196E,$112E                   ;8DF501;
    dw $25D2                                                             ;8DF511;
    dw Instruction_PaletteFXObject_Done                                  ;8DF513;
    dw $000A,$2A35,$25F3,$3ED9,$2E57,$196E,$112E,$25D2                   ;8DF515;
    dw $1DB0                                                             ;8DF525;
    dw Instruction_PaletteFXObject_Done                                  ;8DF527;
    dw $000A,$25F3,$3ED9,$2E57,$2A35,$112E,$25D2,$1DB0                   ;8DF529;
    dw $196E                                                             ;8DF539;
    dw Instruction_PaletteFXObject_Done                                  ;8DF53B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF53D;
    dw InstList_PaletteFXObject_Maridia1_1                               ;8DF53F;

InstList_PaletteFXObject_Maridia2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF541;
    dw $0050                                                             ;8DF543;

InstList_PaletteFXObject_Maridia2_1:
    dw $000A,$25D2,$1DB0,$196E,$112E                                     ;8DF545;
    dw Instruction_PaletteFXObject_Done                                  ;8DF54F;
    dw $000A,$1DB0,$196E,$112E,$25D2                                     ;8DF551;
    dw Instruction_PaletteFXObject_Done                                  ;8DF55B;
    dw $000A,$196E,$112E,$25D2,$1DB0                                     ;8DF55D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF567;
    dw $000A,$112E,$25D2,$1DB0,$196E                                     ;8DF569;
    dw Instruction_PaletteFXObject_Done                                  ;8DF573;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF575;
    dw InstList_PaletteFXObject_Maridia2_1                               ;8DF577;

InstList_PaletteFXObject_Maridia4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF579;
    dw $0068                                                             ;8DF57B;

InstList_PaletteFXObject_Maridia4_1:
    dw $0002,$0400,$0C22,$1864,$2086,$2CC9,$1C65,$1043                   ;8DF57D;
    dw $0821                                                             ;8DF58D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF58F;
    dw $0002,$0C22,$1864,$2086,$2CC9,$1C65,$1043,$0821                   ;8DF591;
    dw $0400                                                             ;8DF5A1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5A3;
    dw $0002,$1864,$2086,$2CC9,$1C65,$1043,$0821,$0400                   ;8DF5A5;
    dw $0C22                                                             ;8DF5B5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5B7;
    dw $0002,$2086,$2CC9,$1C65,$1043,$0821,$0400,$0C22                   ;8DF5B9;
    dw $1864                                                             ;8DF5C9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5CB;
    dw $0002,$2CC9,$1C65,$1043,$0821,$0400,$0C22,$1864                   ;8DF5CD;
    dw $2086                                                             ;8DF5DD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5DF;
    dw $0002,$1C65,$1043,$0821,$0400,$0C22,$1864,$2086                   ;8DF5E1;
    dw $2CC9                                                             ;8DF5F1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF5F3;
    dw $0002,$1043,$0821,$0400,$0C22,$1864,$2086,$2CC9                   ;8DF5F5;
    dw $1C65                                                             ;8DF605;
    dw Instruction_PaletteFXObject_Done                                  ;8DF607;
    dw $0002,$0821,$0400,$0C22,$1864,$2086,$2CC9,$1C65                   ;8DF609;
    dw $1043                                                             ;8DF619;
    dw Instruction_PaletteFXObject_Done                                  ;8DF61B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF61D;
    dw InstList_PaletteFXObject_Maridia4_1                               ;8DF61F;

PreInstruction_PaletteFXObject_DeleteIf2MoreObjectsSpawned:
    LDA.W $1E79,X                                                        ;8DF621;
    BEQ .return                                                          ;8DF624;
    STZ.W $1E7D,X                                                        ;8DF626;

.return:
    RTS                                                                  ;8DF629;


InstList_PaletteFXObject_Tourian4:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF62A;
    dw $00E8                                                             ;8DF62C;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF62E;
    dw InstList_PaletteFXObject_Common_Tourian2_Tourian4_0               ;8DF630;

InstList_PaletteFXObject_Tourian2:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF632;
    dw $00E8                                                             ;8DF634;

InstList_PaletteFXObject_Common_Tourian2_Tourian4_0:
    dw Instruction_PaletteFXObject_PreInstructionInY                     ;8DF636;
    dw PreInstruction_PaletteFXObject_DeleteIf2MoreObjectsSpawned        ;8DF638;

InstList_PaletteFXObject_Common_Tourian2_Tourian4_1:
    dw $000A,$5294                                                       ;8DF63A;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF63E;
    dw $0019,$0012,$5C00,$4000,$1084,$197F,$7FFF                         ;8DF640;
    dw Instruction_PaletteFXObject_Done                                  ;8DF64E;
    dw $000A,$4A52                                                       ;8DF650;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF654;
    dw $0016,$000F,$5000,$3400,$1084,$0D1C,$739C                         ;8DF656;
    dw Instruction_PaletteFXObject_Done                                  ;8DF664;
    dw $000A,$4210                                                       ;8DF666;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF66A;
    dw $0013,$000C,$4400,$2800,$1084,$00B9,$6739                         ;8DF66C;
    dw Instruction_PaletteFXObject_Done                                  ;8DF67A;
    dw $000A,$39CE                                                       ;8DF67C;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF680;
    dw $0010,$0009,$3800,$1C00,$1084,$0056,$5AD6                         ;8DF682;
    dw Instruction_PaletteFXObject_Done                                  ;8DF690;
    dw $000A,$318C                                                       ;8DF692;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF696;
    dw $000D,$0006,$2C00,$1000,$1084,$0013,$4E73                         ;8DF698;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6A6;
    dw $000A,$294A                                                       ;8DF6A8;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF6AC;
    dw $000A,$0003,$2000,$0400,$1084,$0010,$4210                         ;8DF6AE;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6BC;
    dw $000A,$294A                                                       ;8DF6BE;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF6C2;
    dw $000A,$0003,$2000,$0400,$1084,$0010,$4210                         ;8DF6C4;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6D2;
    dw $000A,$318C                                                       ;8DF6D4;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF6D8;
    dw $000D,$0006,$2C00,$1000,$1084,$0013,$4E73                         ;8DF6DA;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6E8;
    dw $000A,$39CE                                                       ;8DF6EA;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF6EE;
    dw $0010,$0009,$3800,$1C00,$1084,$0056,$5AD6                         ;8DF6F0;
    dw Instruction_PaletteFXObject_Done                                  ;8DF6FE;
    dw $000A,$4210                                                       ;8DF700;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF704;
    dw $0013,$000C,$4400,$2800,$1084,$00B9,$6739                         ;8DF706;
    dw Instruction_PaletteFXObject_Done                                  ;8DF714;
    dw $000A,$4A52                                                       ;8DF716;
    dw Instruction_PaletteFXObject_ColorIndex_Plus6                      ;8DF71A;
    dw $0016,$000F,$5000,$3400,$1084,$0D1C,$739C                         ;8DF71C;
    dw Instruction_PaletteFXObject_Done                                  ;8DF72A;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF72C;
    dw InstList_PaletteFXObject_Common_Tourian2_Tourian4_1               ;8DF72E;

Setup_PaletteFXObject_Brinstar8:
    PHX                                                                  ;8DF730;
    LDX.W $079F                                                          ;8DF731;
    LDA.L $7ED828,X                                                      ;8DF734;
    PLX                                                                  ;8DF738;
    AND.W #$0002                                                         ;8DF739;
    BEQ .return                                                          ;8DF73C;
    LDA.W #$0000                                                         ;8DF73E;
    STA.W $1E7D,Y                                                        ;8DF741;

.return:
    RTS                                                                  ;8DF744;


PaletteFXObjects_Nothing:
    dw RTS_8DC685                                                        ;8DF745;
    dw InstList_PaletteFXObject_Nothing                                  ;8DF747;

PaletteFXObjects_GreyOutTourianStatue_Draygon:
    dw RTS_8DC685                                                        ;8DF749;
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Draygon             ;8DF74B;

PaletteFXObjects_GreyOutTourianStatue_Kraid:
    dw RTS_8DC685                                                        ;8DF74D;
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Kraid               ;8DF74F;

PaletteFXObjects_GreyOutTourianStatue_Ridley:
    dw RTS_8DC685                                                        ;8DF751;
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Ridley              ;8DF753;

PaletteFXObjects_GreyOutTourianStatue_Phantoon:
    dw RTS_8DC685                                                        ;8DF755;
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Phantoon            ;8DF757;

PaletteFXObjects_BombTorizoBelly:
    dw RTS_8DC685                                                        ;8DF759;
    dw InstList_PaletteFXObject_BombTorizoBelly_0                        ;8DF75B;

PaletteFXObjects_GoldenTorizoBelly:
    dw RTS_8DC685                                                        ;8DF75D;
    dw InstList_PaletteFXObject_GoldenTorizoBelly_0                      ;8DF75F;

PaletteFXObjects_Norfair1_Tourian1:
    dw Setup_PaletteFXObject_Norfair1_Tourian1                           ;8DF761;
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_0                  ;8DF763;

PaletteFXObjects_Crateria1_Lightning:
    dw RTS_8DC685                                                        ;8DF765;
    dw InstList_PaletteFXObject_Crateria1_0                              ;8DF767;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PaletteFXObjects_DarkLightning_8DF769:
    dw RTS_8DC685                                                        ;8DF769;
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_0_8DEC6E            ;8DF76B;
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_WreckedShip1_GreenLights:
    dw RTS_8DC685                                                        ;8DF76D;
    dw InstList_PaletteFXObject_WreckedShip1_0                           ;8DF76F;

PaletteFXObjects_WreckedShip1_GreenLights_duplicate:
    dw RTS_8DC685                                                        ;8DF771;
    dw InstList_PaletteFXObject_WreckedShip1_0                           ;8DF773;

PaletteFXObjects_Brinstar1_BlueBackgroundSpores:
    dw RTS_8DC685                                                        ;8DF775;
    dw InstList_PaletteFXObject_Brinstar1_0                              ;8DF777;

PaletteFXObjects_Brinstar8_SporeSpawnBlueBackgroundSpores:
    dw Setup_PaletteFXObject_Brinstar8                                   ;8DF779;
    dw InstList_PaletteFXObject_Brinstar8_0                              ;8DF77B;

PaletteFXObjects_Brinstar2_RedBackgroundGlow:
    dw RTS_8DC685                                                        ;8DF77D;
    dw InstList_PaletteFXObject_Brinstar2_0                              ;8DF77F;

PaletteFXObjects_Crateria80_Brinstar4_BeaconFlashing:
    dw RTS_8DC685                                                        ;8DF781;
    dw InstList_PaletteFXObject_Crateria80_Brinstar4_0                   ;8DF783;

PaletteFXObjects_Norfair2:
    dw RTS_8DC685                                                        ;8DF785;
    dw InstList_PaletteFXObject_Norfair2_0                               ;8DF787;

PaletteFXObjects_Norfair4:
    dw RTS_8DC685                                                        ;8DF789;
    dw InstList_PaletteFXObject_Norfair4_0                               ;8DF78B;

PaletteFXObjects_Norfair8:
    dw RTS_8DC685                                                        ;8DF78D;
    dw InstList_PaletteFXObject_Norfair8_0                               ;8DF78F;

PaletteFXObjects_Norfair10:
    dw RTS_8DC685                                                        ;8DF791;
    dw InstList_PaletteFXObject_Norfair10_0                              ;8DF793;

PaletteFXObjects_Maridia1_SandPits:
    dw RTS_8DC685                                                        ;8DF795;
    dw InstList_PaletteFXObject_Maridia1_0                               ;8DF797;

PaletteFXObjects_Maridia2_SandFalls:
    dw RTS_8DC685                                                        ;8DF799;
    dw InstList_PaletteFXObject_Maridia2_0                               ;8DF79B;

PaletteFXObjects_Maridia4_BackgroundWaterfalls:
    dw RTS_8DC685                                                        ;8DF79D;
    dw InstList_PaletteFXObject_Maridia4_0                               ;8DF79F;

PaletteFXObjects_Tourian2_GlowingArkanoidBlocksAndRedOrbs:
    dw RTS_8DC685                                                        ;8DF7A1;
    dw InstList_PaletteFXObject_Tourian2                                 ;8DF7A3;

UNUSED_PaletteFXObjects_Tourian4_8DF7A5:
    dw RTS_8DC685                                                        ;8DF7A5;
    dw InstList_PaletteFXObject_Tourian4                                 ;8DF7A7;

InstList_PaletteFXObject_Tourian8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF7A9;
    dw $0132                                                             ;8DF7AB;

InstList_PaletteFXObject_Tourian8_1:
    dw $0002,$5294,$4210,$318C,$2108,$1084,$7FFF                         ;8DF7AD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7BB;
    dw $0002,$4E75,$3DF1,$2D6D,$1CE8,$0C64,$77BF                         ;8DF7BD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7CB;
    dw $0002,$4A55,$39D1,$2D6D,$1CE8,$0C64,$739F                         ;8DF7CD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7DB;
    dw $0002,$4636,$35B2,$294D,$18C9,$0844,$6B5F                         ;8DF7DD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7EB;
    dw $0002,$3DF6,$3192,$252D,$14A9,$0844,$673F                         ;8DF7ED;
    dw Instruction_PaletteFXObject_Done                                  ;8DF7FB;
    dw $0002,$39D7,$2D72,$210E,$1089,$0424,$5EFF                         ;8DF7FD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF80B;
    dw $0002,$35B7,$2952,$1CEE,$1089,$0424,$5ADF                         ;8DF80D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF81B;
    dw $0002,$3198,$2533,$18CE,$0C69,$0004,$529F                         ;8DF81D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF82B;
    dw $0002,$35B7,$2952,$1CEE,$1089,$0424,$5ADF                         ;8DF82D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF83B;
    dw $0002,$39D7,$2D72,$210E,$1089,$0424,$5EFF                         ;8DF83D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF84B;
    dw $0002,$3DF6,$3192,$252D,$14A9,$0844,$673F                         ;8DF84D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF85B;
    dw $0002,$4636,$35B2,$294D,$18C9,$0844,$6B5F                         ;8DF85D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF86B;
    dw $0002,$4A55,$39D1,$2D6D,$1CE8,$0C64,$739F                         ;8DF86D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF87B;
    dw $0002,$4E75,$3DF1,$2D6D,$1CE8,$0C64,$77BF                         ;8DF87D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF88B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF88D;
    dw InstList_PaletteFXObject_Tourian8_1                               ;8DF88F;

InstList_PaletteFXObject_Tourian10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF891;
    dw $0070                                                             ;8DF893;

InstList_PaletteFXObject_Tourian10_1:
    dw $0004,$081A,$0812,$042B,$0423                                     ;8DF895;
    dw Instruction_PaletteFXObject_Done                                  ;8DF89F;
    dw $0004,$0C37,$0C30,$042A,$0423                                     ;8DF8A1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8AB;
    dw $0004,$1054,$0C2E,$0849,$0422                                     ;8DF8AD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8B7;
    dw $0004,$1471,$104C,$0848,$0422                                     ;8DF8B9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8C3;
    dw $0004,$148E,$106A,$0C66,$0842                                     ;8DF8C5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8CF;
    dw $0004,$18AB,$1488,$0C65,$0842                                     ;8DF8D1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8DB;
    dw $0004,$1CC8,$1486,$1084,$0841                                     ;8DF8DD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8E7;
    dw $0004,$20E5,$18A4,$1083,$0841                                     ;8DF8E9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8F3;
    dw $0004,$1CC8,$1486,$1084,$0841                                     ;8DF8F5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF8FF;
    dw $0004,$18AB,$1488,$0C65,$0842                                     ;8DF901;
    dw Instruction_PaletteFXObject_Done                                  ;8DF90B;
    dw $0004,$148E,$106A,$0C66,$0842                                     ;8DF90D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF917;
    dw $0004,$1471,$104C,$0848,$0422                                     ;8DF919;
    dw Instruction_PaletteFXObject_Done                                  ;8DF923;
    dw $0004,$1054,$0C2E,$0849,$0422                                     ;8DF925;
    dw Instruction_PaletteFXObject_Done                                  ;8DF92F;
    dw $0004,$0C37,$0C30,$042A,$0423                                     ;8DF931;
    dw Instruction_PaletteFXObject_Done                                  ;8DF93B;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF93D;
    dw InstList_PaletteFXObject_Tourian10_1                              ;8DF93F;

InstList_PaletteFXObject_Tourian20:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF941;
    dw $00A8                                                             ;8DF943;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DF945;
    dw InstList_PaletteFXObject_Common_Tourian20_Tourian40               ;8DF947;

InstList_PaletteFXObject_Tourian40:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DF949;
    dw $00E8                                                             ;8DF94B;

InstList_PaletteFXObject_Common_Tourian20_Tourian40:
    dw $0002,$5294,$39CE,$2108,$1084,$0019,$0012                         ;8DF94D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF95B;
    dw $7FFF                                                             ;8DF95D;
    dw Instruction_PaletteFXObject_Done                                  ;8DF95F;
    dw $0002,$4E75,$35AF,$1CE8,$0C64,$080D,$0809                         ;8DF961;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF96F;
    dw $77BF                                                             ;8DF971;
    dw Instruction_PaletteFXObject_Done                                  ;8DF973;
    dw $0002,$4A55,$318F,$1CE9,$0C64,$1000,$1000                         ;8DF975;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF983;
    dw $739F                                                             ;8DF985;
    dw Instruction_PaletteFXObject_Done                                  ;8DF987;
    dw $0002,$4636,$2D70,$18C9,$0844,$080D,$0809                         ;8DF989;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF997;
    dw $6B5F                                                             ;8DF999;
    dw Instruction_PaletteFXObject_Done                                  ;8DF99B;
    dw $0002,$3DF6,$2D70,$18CA,$0844,$0019,$0012                         ;8DF99D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9AB;
    dw $673F                                                             ;8DF9AD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9AF;
    dw $0002,$39D7,$2951,$14AA,$0424,$080D,$0809                         ;8DF9B1;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9BF;
    dw $5EFF                                                             ;8DF9C1;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9C3;
    dw $0002,$35B7,$2531,$14AB,$0424,$1000,$1000                         ;8DF9C5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9D3;
    dw $5ADF                                                             ;8DF9D5;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9D7;
    dw $0002,$3198,$2112,$108B,$0004,$080D,$0809                         ;8DF9D9;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9E7;
    dw $529F                                                             ;8DF9E9;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9EB;
    dw $0002,$35B7,$2531,$14AB,$0424,$1000,$1000                         ;8DF9ED;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DF9FB;
    dw $5ADF                                                             ;8DF9FD;
    dw Instruction_PaletteFXObject_Done                                  ;8DF9FF;
    dw $0002,$39D7,$2951,$14AA,$0424,$080D,$0809                         ;8DFA01;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA0F;
    dw $5EFF                                                             ;8DFA11;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA13;
    dw $0002,$3DF6,$2D70,$18CA,$0844,$0019,$0012                         ;8DFA15;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA23;
    dw $673F                                                             ;8DFA25;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA27;
    dw $0002,$4636,$2D70,$18C9,$0844,$080D,$0809                         ;8DFA29;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA37;
    dw $6B5F                                                             ;8DFA39;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA3B;
    dw $0002,$4A55,$318F,$1CE9,$0C64,$1000,$1000                         ;8DFA3D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA4B;
    dw $739F                                                             ;8DFA4D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA4F;
    dw $0002,$4E75,$35AF,$1CE8,$0C64,$080D,$0809                         ;8DFA51;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA5F;
    dw $77BF                                                             ;8DFA61;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA63;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFA65;
    dw InstList_PaletteFXObject_Common_Tourian20_Tourian40               ;8DFA67;

InstList_PaletteFXObject_Crateria8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFA69;
    dw $00A2                                                             ;8DFA6B;

InstList_PaletteFXObject_Crateria8_1:
    dw $0003,$5A73,$41AD,$28E7                                           ;8DFA6D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA75;
    dw $0019,$0012,$3460,$0C20                                           ;8DFA77;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFA7F;
    dw $7F9C                                                             ;8DFA81;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA83;
    dw $0003,$4E14,$396E,$24C8                                           ;8DFA85;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFA8D;
    dw $0014,$000E,$4900,$1C60                                           ;8DFA8F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFA97;
    dw $6F3C                                                             ;8DFA99;
    dw Instruction_PaletteFXObject_Done                                  ;8DFA9B;
    dw $0003,$41D5,$312E,$1CA8                                           ;8DFA9D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFAA5;
    dw $000F,$000A,$5980,$2CA0                                           ;8DFAA7;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFAAF;
    dw $62FD                                                             ;8DFAB1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFAB3;
    dw $0003,$3576,$28EF,$1889                                           ;8DFAB5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFABD;
    dw $000A,$0005,$6E20,$38C0                                           ;8DFABF;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFAC7;
    dw $529D                                                             ;8DFAC9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFACB;
    dw $0003,$2D17,$20D0,$1489                                           ;8DFACD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFAD5;
    dw $0005,$0001,$7EA0,$4900                                           ;8DFAD7;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFADF;
    dw $423E                                                             ;8DFAE1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFAE3;
    dw $0003,$20B8,$1891,$106A                                           ;8DFAE5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFAED;
    dw $000A,$0005,$6E20,$38C0                                           ;8DFAEF;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFAF7;
    dw $31DE                                                             ;8DFAF9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFAFB;
    dw $0003,$1479,$1051,$084A                                           ;8DFAFD;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB05;
    dw $000F,$000A,$5980,$2CA0                                           ;8DFB07;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB0F;
    dw $259F                                                             ;8DFB11;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB13;
    dw $0003,$081A,$0812,$042B                                           ;8DFB15;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB1D;
    dw $0014,$000E,$4900,$1C60                                           ;8DFB1F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB27;
    dw $153F                                                             ;8DFB29;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB2B;
    dw $0003,$1479,$1051,$084A                                           ;8DFB2D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB35;
    dw $000F,$000A,$5980,$2CA0                                           ;8DFB37;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB3F;
    dw $259F                                                             ;8DFB41;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB43;
    dw $0003,$20B8,$1891,$106A                                           ;8DFB45;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB4D;
    dw $000A,$0005,$6E20,$38C0                                           ;8DFB4F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB57;
    dw $31DE                                                             ;8DFB59;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB5B;
    dw $0003,$2D17,$20D0,$1489                                           ;8DFB5D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB65;
    dw $0005,$0001,$7EA0,$4900                                           ;8DFB67;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB6F;
    dw $423E                                                             ;8DFB71;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB73;
    dw $0003,$3576,$28EF,$1889                                           ;8DFB75;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB7D;
    dw $000A,$0005,$6E20,$38C0                                           ;8DFB7F;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB87;
    dw $529D                                                             ;8DFB89;
    dw Instruction_PaletteFXObject_Done                                  ;8DFB8B;
    dw $0003,$41D5,$312E,$1CA8                                           ;8DFB8D;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFB95;
    dw $000F,$000A,$5980,$2CA0                                           ;8DFB97;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFB9F;
    dw $62FD                                                             ;8DFBA1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBA3;
    dw $0003,$4E14,$396E,$24C8                                           ;8DFBA5;
    dw Instruction_PaletteFXObject_ColorIndex_Plus8                      ;8DFBAD;
    dw $0014,$000E,$4900,$1C60                                           ;8DFBAF;
    dw Instruction_PaletteFXObject_ColorIndex_Plus4                      ;8DFBB7;
    dw $6F3C                                                             ;8DFBB9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBBB;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFBBD;
    dw InstList_PaletteFXObject_Crateria8_1                              ;8DFBBF;

InstList_PaletteFXObject_Crateria10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFBC1;
    dw $00D2                                                             ;8DFBC3;

InstList_PaletteFXObject_Crateria10_1:
    dw $0010,$35AD,$1CE7,$0C63                                           ;8DFBC5;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBCD;
    dw $0001,$29D0,$150A,$0885                                           ;8DFBCF;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBD7;
    dw $0001,$1E14,$114D,$08A7                                           ;8DFBD9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBE1;
    dw $0002,$0E37,$096F,$04A8                                           ;8DFBE3;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBEB;
    dw $0001,$025A,$0192,$00CA                                           ;8DFBED;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBF5;
    dw $0002,$35AD,$1CE7,$0C63                                           ;8DFBF7;
    dw Instruction_PaletteFXObject_Done                                  ;8DFBFF;
    dw $0001,$29D0,$150A,$0885                                           ;8DFC01;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC09;
    dw $0001,$1E14,$114D,$08A7                                           ;8DFC0B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC13;
    dw $0001,$0E37,$096F,$04A8                                           ;8DFC15;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC1D;
    dw $0001,$025A,$0192,$00CA                                           ;8DFC1F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC27;
    dw $0020,$35AD,$1CE7,$0C63                                           ;8DFC29;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC31;
    dw $0002,$29D0,$150A,$0885                                           ;8DFC33;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC3B;
    dw $0001,$1E14,$114D,$08A7                                           ;8DFC3D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC45;
    dw $0001,$0E37,$096F,$04A8                                           ;8DFC47;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC4F;
    dw $0001,$025A,$0192,$00CA                                           ;8DFC51;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC59;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFC5B;
    dw InstList_PaletteFXObject_Crateria10_1                             ;8DFC5D;

InstList_PaletteFXObject_Crateria20_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFC5F;
    dw $00AA                                                             ;8DFC61;

InstList_PaletteFXObject_Crateria20_1:
    dw $0010,$28C8,$2484,$1C61                                           ;8DFC63;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC6B;
    dw $0001,$398E,$296B,$1549                                           ;8DFC6D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC75;
    dw $0001,$4A74,$2E52,$1230                                           ;8DFC77;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC7F;
    dw $0002,$5739,$3318,$0B18                                           ;8DFC81;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC89;
    dw $0001,$67FF,$43FF,$03FF                                           ;8DFC8B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC93;
    dw $0002,$28C8,$2484,$1C61                                           ;8DFC95;
    dw Instruction_PaletteFXObject_Done                                  ;8DFC9D;
    dw $0001,$398E,$296B,$1549                                           ;8DFC9F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCA7;
    dw $0001,$4A74,$2E52,$1230                                           ;8DFCA9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCB1;
    dw $0001,$5739,$3318,$0B18                                           ;8DFCB3;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCBB;
    dw $0001,$67FF,$43FF,$03FF                                           ;8DFCBD;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCC5;
    dw $0020,$28C8,$2484,$1C61                                           ;8DFCC7;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCCF;
    dw $0002,$398E,$296B,$1549                                           ;8DFCD1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCD9;
    dw $0001,$4A74,$2E52,$1230                                           ;8DFCDB;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCE3;
    dw $0001,$5739,$3318,$0B18                                           ;8DFCE5;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCED;
    dw $0001,$67FF,$43FF,$03FF                                           ;8DFCEF;
    dw Instruction_PaletteFXObject_Done                                  ;8DFCF7;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFCF9;
    dw InstList_PaletteFXObject_Crateria20_1                             ;8DFCFB;

InstList_PaletteFXObject_Crateria2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFCFD;
    dw $0082                                                             ;8DFCFF;

InstList_PaletteFXObject_Crateria2_1:
    dw $0008,$1D89,$0D06,$0CA3,$2D0E,$2D09,$28C5,$0C81                   ;8DFD01;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD11;
    dw $0007,$1D8A,$0D07,$0CA4,$2D0E,$2D09,$28C5,$0421                   ;8DFD13;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD23;
    dw $0006,$1D8A,$0D28,$0CC4,$2D0F,$2D0A,$28C6,$0423                   ;8DFD25;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD35;
    dw $0005,$1D8B,$0D29,$0CC5,$2D0F,$2D0A,$28C6,$0424                   ;8DFD37;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD47;
    dw $0004,$1DAB,$1149,$10C5,$2D0F,$2D0B,$28C7,$0845                   ;8DFD49;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD59;
    dw $0003,$1DAC,$114A,$10C6,$2D0F,$2D0B,$28C7,$0846                   ;8DFD5B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD6B;
    dw $0002,$1DAC,$116B,$10E6,$2D10,$2D0C,$28C8,$0848                   ;8DFD6D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD7D;
    dw $0001,$1DAD,$116C,$10E7,$2D10,$2D0C,$28C8,$0015                   ;8DFD7F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFD8F;
    dw $0002,$1DAC,$116B,$10E6,$2D10,$2D0C,$28C8,$0848                   ;8DFD91;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDA1;
    dw $0003,$1DAC,$114A,$10C6,$2D0F,$2D0B,$28C7,$0846                   ;8DFDA3;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDB3;
    dw $0004,$1DAB,$1149,$10C5,$2D0F,$2D0B,$28C7,$0845                   ;8DFDB5;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDC5;
    dw $0005,$1D8B,$0D29,$0CC5,$2D0F,$2D0A,$28C6,$0424                   ;8DFDC7;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDD7;
    dw $0006,$1D8A,$0D28,$0CC4,$2D0F,$2D0A,$28C6,$0423                   ;8DFDD9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDE9;
    dw $0007,$1D8A,$0D07,$0CA4,$2D0E,$2D09,$28C5,$0421                   ;8DFDEB;
    dw Instruction_PaletteFXObject_Done                                  ;8DFDFB;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFDFD;
    dw InstList_PaletteFXObject_Crateria2_1                              ;8DFDFF;

InstList_PaletteFXObject_Crateria4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFE01;
    dw $00A2                                                             ;8DFE03;

InstList_PaletteFXObject_Crateria4_1:
    dw $0031,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425                   ;8DFE05;
    dw $1024,$0C23,$0C03,$0802                                           ;8DFE15;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE1D;
    dw $0001,$3DD8,$31D5,$2991,$25B0,$218F,$1D8E,$0C23                   ;8DFE1F;
    dw $0C23,$0822,$0802,$0401                                           ;8DFE2F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE37;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFE39;
    dw $0401,$0401,$0401,$0401                                           ;8DFE49;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE51;
    dw $0001,$27FF,$27FF,$27FF,$27FF,$27FF,$27FF,$0000                   ;8DFE53;
    dw $0000,$0401,$0000,$0000                                           ;8DFE63;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE6B;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFE6D;
    dw $0401,$0401,$0401,$0401                                           ;8DFE7D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE85;
    dw $0011,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425                   ;8DFE87;
    dw $1024,$0C23,$0C03,$0802                                           ;8DFE97;
    dw Instruction_PaletteFXObject_Done                                  ;8DFE9F;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFEA1;
    dw $0401,$0401,$0401,$0401                                           ;8DFEB1;
    dw Instruction_PaletteFXObject_Done                                  ;8DFEB9;
    dw $0018,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425                   ;8DFEBB;
    dw $1024,$0C23,$0C03,$0802                                           ;8DFECB;
    dw Instruction_PaletteFXObject_Done                                  ;8DFED3;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFED5;
    dw $0401,$0401,$0401,$0401                                           ;8DFEE5;
    dw Instruction_PaletteFXObject_Done                                  ;8DFEED;
    dw $0001,$27FF,$27FF,$27FF,$27FF,$27FF,$27FF,$0000                   ;8DFEEF;
    dw $0000,$0401,$0000,$0000                                           ;8DFEFF;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF07;
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802                   ;8DFF09;
    dw $0401,$0401,$0401,$0401                                           ;8DFF19;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF21;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFF23;
    dw InstList_PaletteFXObject_Crateria4_1                              ;8DFF25;

InstList_PaletteFXObject_Crateria40_0:
    dw Instruction_PaletteFXObject_ColorIndexInY                         ;8DFF27;
    dw $00AE                                                             ;8DFF29;

InstList_PaletteFXObject_Crateria40_1:
    dw $0031,$1425,$1024,$0C23,$0C03,$0802                               ;8DFF2B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF37;
    dw $0001,$0C23,$0C23,$0822,$0802,$0401                               ;8DFF39;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF45;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFF47;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF53;
    dw $0001,$0000,$0000,$0401,$0000,$0000                               ;8DFF55;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF61;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFF63;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF6F;
    dw $0011,$1425,$1024,$0C23,$0C03,$0802                               ;8DFF71;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF7D;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFF7F;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF8B;
    dw $0018,$1425,$1024,$0C23,$0C03,$0802                               ;8DFF8D;
    dw Instruction_PaletteFXObject_Done                                  ;8DFF99;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFF9B;
    dw Instruction_PaletteFXObject_Done                                  ;8DFFA7;
    dw $0001,$0000,$0000,$0401,$0000,$0000                               ;8DFFA9;
    dw Instruction_PaletteFXObject_Done                                  ;8DFFB5;
    dw $0001,$0802,$0401,$0401,$0401,$0401                               ;8DFFB7;
    dw Instruction_PaletteFXObject_Done                                  ;8DFFC3;
    dw Instruction_PaletteFXObject_GotoY                                 ;8DFFC5;
    dw InstList_PaletteFXObject_Crateria40_1                             ;8DFFC7;

PaletteFXObjects_Tourian8_ShutterRedFlashing:
    dw RTS_8DC685                                                        ;8DFFC9;
    dw InstList_PaletteFXObject_Tourian8_0                               ;8DFFCB;

PaletteFXObjects_Tourian10_BackgroundRedFlashing:
    dw RTS_8DC685                                                        ;8DFFCD;
    dw InstList_PaletteFXObject_Tourian10_0                              ;8DFFCF;

PaletteFXObjects_Tourian20_GeneralLevelRedFlashing:
    dw RTS_8DC685                                                        ;8DFFD1;
    dw InstList_PaletteFXObject_Tourian20                                ;8DFFD3;

PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs:
    dw RTS_8DC685                                                        ;8DFFD5;
    dw InstList_PaletteFXObject_Tourian40                                ;8DFFD7;

PaletteFXObjects_Crateria8_OldTourianRedFlashing:
    dw RTS_8DC685                                                        ;8DFFD9;
    dw InstList_PaletteFXObject_Crateria8_0                              ;8DFFDB;

PaletteFXObjects_Crateria10_OldTourianBGRailingsFlashYellow:
    dw RTS_8DC685                                                        ;8DFFDD;
    dw InstList_PaletteFXObject_Crateria10_0                             ;8DFFDF;

PaletteFXObjects_Crateria20_OldTourianBGPanelsFlashYellow:
    dw RTS_8DC685                                                        ;8DFFE1;
    dw InstList_PaletteFXObject_Crateria20_0                             ;8DFFE3;

PaletteFXObjects_Crateria2_UpperCrateriaRedFlashing:
    dw RTS_8DC685                                                        ;8DFFE5;
    dw InstList_PaletteFXObject_Crateria2_0                              ;8DFFE7;

PaletteFXObjects_Crateria4_YellowLightning:
    dw RTS_8DC685                                                        ;8DFFE9;
    dw InstList_PaletteFXObject_Crateria4_0                              ;8DFFEB;

PaletteFXObjects_Crateria40_SlightlyModifiesAPixelInCREBlock:
    dw RTS_8DC685                                                        ;8DFFED;
    dw InstList_PaletteFXObject_Crateria40_0                             ;8DFFEF;

Freespace_Bank8D_FFF1:                                                   ;8DFFF1;
; $F bytes
