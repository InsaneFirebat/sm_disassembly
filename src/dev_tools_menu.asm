
; -------------
; Documentation
; -------------

; A macro system is used to cleanly build out the menu data in the rom. Each menu macro is explained below, and can be found in macros.asm.
; Macros usually start with a string of text to be displayed, followed by some arguments such as memory addresses to manipulate or code to execute.
; Executed code will start with 16-bit registers. The A register will either be loaded from the relevant address or cleared. The Y register will be
; loaded with the argument or cleared with X register. Returns can be in any status (P flag) with RTL.

;;; cm_header
; Used to assign outlined text (in all caps, see resources/header.tbl) to the top of a menu
; Takes a text string only
; This macro should only be used at the end of a end of a (sub)menu pointer list, after the zero terminator word

;;; cm_footer
; Used to assign outlined text (in all caps, see resources/header.tbl) to the bottom of a menu
; Takes a text string only
; This macro should only be used following a cm_header macro

;;; cm_mainmenu
; Jump to a submenu in any bank
; Takes a text string, followed by a 16-bit pointer to a submenu
; This macro should only be used with 'MainMenu'

;;; cm_jsl
; Executes code on demand
; Takes a text string, a 16-bit pointer to code, and an argument word
; The code to execute must live in the same bank as the macro
; The argument is set in Y before executing the code
; Code should return with RTL (tolerates 8/16-bit registers)

;;; cm_submenu
; Jump to a submenu in the same bank
; Takes a text string, followed by a 16-bit pointer to a submenu

;;; cm_numfield
; Allows editing an 8-bit value at the specified address
; Takes a text string, a 24-bit memory address, a minimum allowed value, maximum allowed value, an increment amount, and a 16-bit pointer to code
; Set the code pointer to zero if no additional code should be executed
; Code should return with RTL (tolerates 8/16-bit registers)

;;; cm_numfield_hex
; Allows editing an 8-bit value displayed in hexadecimal
; Takes a text string, a 24-bit memory address, a minimum allowed value, maximum allowed value, an increment amount, and a 16-bit pointer to code

;;; cm_numfield_word
; Allows editing a 16-bit value at the specified address
; Takes a text string, a 24-bit memory address, a minimum allowed value, maximum allowed value, an increment amount, and a 16-bit pointer to code
; Set the code pointer to zero if no additional code should be executed
; Code should return with RTL (tolerates 8/16-bit registers)

;;; cm_numfield_hex_word
; Displays a 16-bit value in hexadecimal
; Takes a text string, followed by a 24-bit address

;;; cm_toggle
; Allows an 8-bit value to be toggled between zero and the specified value
; Takes a text string, a 24-bit address, an 8-bit value as a word, and a 16-bit pointer to code
; Set the code pointer to zero if no additional code should be executed
; Code should return with RTL (tolerates 8/16-bit registers)

;;; cm_toggle_bit
; Allows a individual bits of a 16-bit value to be toggled
; Takes a text string, a 24-bit address, an 8-bit value as a word, and a 16-bit pointer to code
; Set the code pointer to zero if no additional code should be executed
; Code should return with RTL (tolerates 8/16-bit registers)

;;; cm_toggle_inverted and cm_toggle_bit_inverted
; The same toggles as above, but with zero considered ON/enabled

;;; cm_equipment_item
; Allows three-way toggling of items:  ON/OFF/UNOBTAINED
; Takes a text string, a 24-bit dummy address, a 16-bit bitmask, and a 16-bit inverted bitmask
; Dummy values are populated when the menu is first opened

;;; cm_equipment_beam
; Allows three-way toggling of beams:  ON/OFF/UNOBTAINED
; Takes a text string, a 24-bit dummy address, a 16-bit bitmask, a 16-bit inverted bitmask, and a 16-bit AND value
; Dummy values are populated when the menu is first opened
; The AND value is used to prevent incompatible beams (Spazer+Plasma)

;;; cm_ctrl_input
; Opens a submenu to assign a controller binding
; Takes a text string, followed by a 24-bit address
; The address should be one of the controller bindings at $7E09AA..BF

;;; cm_numfield_sound
; Allows sounds effects to be played from an 8-bit hexadecimal numfield by pressing Y
; Takes a text string, a 24-bit address, a minimum value, a maximum value, an increment amount, and a 16-bit pointer to code
; The code pointer is repsponsible for playing the sound effect

;;; cm_choice
; Sets a value based on the index of the selected option
; THIS IS NOT A MACRO! You must write the required data manually
;example_label:
;    dw !ACTION_CHOICE                ; starts with the action index
;    dl #!SAMUS_RESERVE_MODE          ; a 24-bit address to edit
;    dw #.routine                     ; optional 16-bit pointer to code, set to zero to skip, return with RTL
;    db #$28, "Reserve Mode", #$FF    ; an 8-bit palette/attribute byte, a title string up to 15 characters, and an FF terminator byte
;    db #$28, " UNOBTAINED", #$FF     ; an 8-bit palette/attribute byte, an option string exactly 11 characters long, and an FF terminator byte
;    db #$28, "       AUTO", #$FF
;    db #$28, "     MANUAL", #$FF
;    db #$FF                          ; an 8-bit FF terminator byte
;  .routine                           ; optional code could go anywhere, but it probably starts here


; ---------
; Main Menu
; ---------

MainMenu:
; MainMenu must live in the same bank as the core menu code
; From here, submenus can branch off into any bank
    dw #mm_goto_equipment
    dw #mm_goto_teleport
    dw #mm_goto_events
    dw #mm_goto_misc
    dw #mm_goto_gamemenu
    dw #mm_goto_soundtest
    dw #mm_goto_memoryeditor
    dw #$0000
    %cm_header("HACK DEBUG MENU")

MainMenuBanks:
; These pointers are bit-shifted to only hold the bank byte
; The order of this list must match MainMenu above
; Dummies are used to maintain balance when non-submenus are used on MainMenu
    dw #EquipmentMenu>>16
    dw #TeleportMenu>>16
    dw #EventsMenu>>16
    dw #MiscMenu>>16
    dw #GameMenu>>16
    dw #SoundTestMenu>>16
    dw #MemoryEditorMenu>>16 ; dummy

; This macro should not be used elsewhere, as it is hardcoded to MainMenu
mm_goto_equipment:
    %cm_mainmenu("Equipment", #EquipmentMenu)

mm_goto_teleport:
    %cm_mainmenu("Save Stations", #TeleportMenu)

mm_goto_events:
    %cm_mainmenu("Event Flags", #EventsMenu)

mm_goto_misc:
    %cm_mainmenu("Misc Options", #MiscMenu)

mm_goto_gamemenu:
    %cm_mainmenu("Game Options", #GameMenu)

mm_goto_soundtest:
    %cm_mainmenu("Sound Test", #SoundTestMenu)

mm_goto_memoryeditor:
    %cm_jsl("Memory Editor", .routine, #MemoryEditorMenu)
  .routine
    ; Setup for special Memory Editor menu
    LDA #$0001 : STA !ram_mem_editor_active

    ; preserve menu pointer in Y
    PHY

    ; clear tilemap
    JSL cm_tilemap_bg

    ; Set bank of new menu for manual submenu jump
    LDA.w #MemoryEditorMenu>>16 : STA !ram_cm_menu_bank
    STA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2

    PLY
    JML action_submenu


; ----------------
; Equipment menu
; ----------------

EquipmentMenu:
    dw #eq_refill
    dw #eq_toggle_category
    dw #eq_goto_toggleitems
    dw #eq_goto_togglebeams
    dw #$FFFF
    dw #eq_currentenergy
    dw #eq_setetanks
    dw #$FFFF
    dw #eq_currentreserves
    dw #eq_setreserves
    dw #eq_reservemode
    dw #$FFFF
    dw #eq_currentmissiles
    dw #eq_setmissiles
    dw #$FFFF
    dw #eq_currentsupers
    dw #eq_setsupers
    dw #$FFFF
    dw #eq_currentpbs
    dw #eq_setpbs
    dw #$0000
    %cm_header("EQUIPMENT")
    %cm_footer("HOLD Y FOR FAST SCROLL")

eq_refill:
    %cm_jsl("Refill", .refill, #$0000)
  .refill
    LDA.w MaxEnergy : STA.w Energy
    LDA.w MaxMissiles : STA.w Missiles
    LDA.w MaxSuperMissiles : STA.w SuperMissiles
    LDA.w MaxPowerBombs : STA.w PowerBombs
    LDA.w MaxReserveEnergy : STA.w ReserveEnergy
    STZ.w SamusProjectile_BombCounter
    %sfxenergy()
    RTL

eq_toggle_category:
    %cm_submenu("Category Loadouts", #ToggleCategoryMenu)

eq_goto_toggleitems:
    %cm_jsl("Toggle Items", #eq_prepare_items_menu, #ToggleItemsMenu)

eq_goto_togglebeams:
    %cm_jsl("Toggle Beams", #eq_prepare_beams_menu, #ToggleBeamsMenu)

eq_currentenergy:
    %cm_numfield_word("Current Energy", Energy, 0, 1499, #0)

eq_setetanks:
    %cm_numfield("Energy Tanks", !ram_cm_etanks, 0, 14, 1, 1, .routine)
  .routine
    TAX : BEQ .zero
    LDA #$0063 ; xx99 energy
  .loop
    ; add 100 per etank
    DEX : BMI .endloop
    CLC : ADC #$0064
    BRA .loop
  .zero
    LDA #$0063 ; 99 energy
  .endloop
    STA.w Energy : STA.w MaxEnergy
    RTL

eq_currentreserves:
    %cm_numfield_word("Current Reserves", ReserveEnergy, 0, 400, #0)

eq_setreserves:
    %cm_numfield("Reserve Tanks", !ram_cm_reserve, 0, 4, 1, 1, .routine)
  .routine
    TAX : BEQ .zero
    LDA #$0000
  .loop
    ; add 100 per reserve
    DEX : BMI .endloop
    CLC : ADC #$0064
    BRA .loop
  .zero
    STA.w ReserveTankMode
  .endloop
    STA.w ReserveEnergy : STA.w MaxReserveEnergy
    RTL

eq_reservemode:
    dw !ACTION_CHOICE
    dl #ReserveTankMode
    dw #.routine
    db #$28, "Reserve Mode", #$FF
    db #$28, " UNOBTAINED", #$FF
    db #$28, "       AUTO", #$FF
    db #$28, "     MANUAL", #$FF
    db #$FF
  .routine
    LDA.w MaxReserveEnergy : BNE +
    ; lock at UNOBTAINED if max = 0
    STA.w ReserveTankMode
    %sfxdamage()
+   RTL

eq_currentmissiles:
    %cm_numfield_word("Current Missiles", Missiles, 0, 230, #0)

eq_setmissiles:
    %cm_numfield_word("Max Missiles", MaxMissiles, 0, 230, .routine)
    .routine
        LDA.w MaxMissiles : STA.w Missiles
        RTL

eq_currentsupers:
    %cm_numfield("Current Super Missiles", SuperMissiles, 0, 50, 1, 5, #0)

eq_setsupers:
    %cm_numfield("Max Super Missiles", MaxSuperMissiles, 0, 50, 5, 5, .routine)
    .routine
        LDA.w MaxSuperMissiles : STA.w SuperMissiles
        RTL

eq_currentpbs:
    %cm_numfield("Current Power Bombs", PowerBombs, 0, 50, 1, 5, #0)

eq_setpbs:
    %cm_numfield("Max Power Bombs", MaxPowerBombs, 0, 50, 5, 5, .routine)
    .routine
        LDA.w MaxPowerBombs : STA.w PowerBombs
        RTL

eq_prepare_items_menu:
; Setup initial values for dummy equipment addresses
{
    LDA.w CollectedItems : BIT #$0001 : BEQ .noVaria
    LDA.w EquippedItems : BIT #$0001 : BNE .equipVaria
    ; unequip Varia
    LDA #$0002 : STA !ram_cm_varia : BRA +
  .equipVaria
    LDA #$0001 : STA !ram_cm_varia : BRA +
  .noVaria
    LDA #$0000 : STA !ram_cm_varia

+   LDA.w CollectedItems : BIT #$0020 : BEQ .noGravity
    LDA.w EquippedItems : BIT #$0020 : BNE .equipGravity
    ; unequip Gravity
    LDA #$0002 : STA !ram_cm_gravity : BRA +
  .equipGravity
    LDA #$0001 : STA !ram_cm_gravity : BRA +
  .noGravity
    LDA #$0000 : STA !ram_cm_gravity

+   LDA.w CollectedItems : BIT #$0004 : BEQ .noMorph
    LDA.w EquippedItems : BIT #$0004 : BNE .equipMorph
    ; unequip Morph
    LDA #$0002 : STA !ram_cm_morph : BRA +
  .equipMorph
    LDA #$0001 : STA !ram_cm_morph : BRA +
  .noMorph
    LDA #$0000 : STA !ram_cm_morph

+   LDA.w CollectedItems : BIT #$1000 : BEQ .noBombs
    LDA.w EquippedItems : BIT #$1000 : BNE .equipBombs
    ; unequip Bombs
    LDA #$0002 : STA !ram_cm_bombs : BRA +
  .equipBombs
    LDA #$0001 : STA !ram_cm_bombs : BRA +
  .noBombs
    LDA #$0000 : STA !ram_cm_bombs

+   LDA.w CollectedItems : BIT #$0002 : BEQ .noSpring
    LDA.w EquippedItems : BIT #$0002 : BNE .equipSpring
    ; unequip Spring
    LDA #$0002 : STA !ram_cm_spring : BRA +
  .equipSpring
    LDA #$0001 : STA !ram_cm_spring : BRA +
  .noSpring
    LDA #$0000 : STA !ram_cm_spring

+   LDA.w CollectedItems : BIT #$0008 : BEQ .noScrew
    LDA.w EquippedItems : BIT #$0008 : BNE .equipScrew
    ; unequip Screw
    LDA #$0002 : STA !ram_cm_screw : BRA +
  .equipScrew
    LDA #$0001 : STA !ram_cm_screw : BRA +
  .noScrew
    LDA #$0000 : STA !ram_cm_screw

+   LDA.w CollectedItems : BIT #$0100 : BEQ .noHiJump
    LDA.w EquippedItems : BIT #$0100 : BNE .equipHiJump
    ; unequip HiJump
    LDA #$0002 : STA !ram_cm_hijump : BRA +
  .equipHiJump
    LDA #$0001 : STA !ram_cm_hijump : BRA +
  .noHiJump
    LDA #$0000 : STA !ram_cm_hijump

+   LDA.w CollectedItems : BIT #$0200 : BEQ .noSpace
    LDA.w EquippedItems : BIT #$0200 : BNE .equipSpace
    ; unequip Space
    LDA #$0002 : STA !ram_cm_space : BRA +
  .equipSpace
    LDA #$0001 : STA !ram_cm_space : BRA +
  .noSpace
    LDA #$0000 : STA !ram_cm_space

+   LDA.w CollectedItems : BIT #$2000 : BEQ .noSpeed
    LDA.w EquippedItems : BIT #$2000 : BNE .equipSpeed
    ; unequip Speed
    LDA #$0002 : STA !ram_cm_speed : BRA +
  .equipSpeed
    LDA #$0001 : STA !ram_cm_speed : BRA +
  .noSpeed
    LDA #$0000 : STA !ram_cm_speed

    ; set bank for manual submenu jump
+   PHK : PHK : PLA
    STA !ram_cm_menu_bank
    JML action_submenu
}

eq_prepare_beams_menu:
{
+   LDA.w CollectedBeams : BIT #$1000 : BEQ .noCharge
    LDA.w EquippedBeams : BIT #$1000 : BNE .equipCharge
    ; unequip Charge
    LDA #$0002 : STA !ram_cm_charge : BRA +
  .equipCharge
    LDA #$0001 : STA !ram_cm_charge : BRA +
  .noCharge
    LDA #$0000 : STA !ram_cm_charge

+   LDA.w CollectedBeams : BIT #$0002 : BEQ .noIce
    LDA.w EquippedBeams : BIT #$0002 : BNE .equipIce
    ; unequip Ice
    LDA #$0002 : STA !ram_cm_ice : BRA +
  .equipIce
    LDA #$0001 : STA !ram_cm_ice : BRA +
  .noIce
    LDA #$0000 : STA !ram_cm_ice

+   LDA.w CollectedBeams : BIT #$0001 : BEQ .noWave
    LDA.w EquippedBeams : BIT #$0001 : BNE .equipWave
    ; unequip Wave
    LDA #$0002 : STA !ram_cm_wave : BRA +
  .equipWave
    LDA #$0001 : STA !ram_cm_wave : BRA +
  .noWave
    LDA #$0000 : STA !ram_cm_wave

+   LDA.w CollectedBeams : BIT #$0004 : BEQ .noSpazer
    LDA.w EquippedBeams : BIT #$0004 : BNE .equipSpazer
    ; unequip Spazer
    LDA #$0002 : STA !ram_cm_spazer : BRA +
  .equipSpazer
    LDA #$0001 : STA !ram_cm_spazer : BRA +
  .noSpazer
    LDA #$0000 : STA !ram_cm_spazer

+   LDA.w CollectedBeams : BIT #$0008 : BEQ .noPlasma
    LDA.w EquippedBeams : BIT #$0008 : BNE .equipPlasma
    ; unequip Plasma
    LDA #$0002 : STA !ram_cm_plasma : BRA +
  .equipPlasma
    LDA #$0001 : STA !ram_cm_plasma : BRA +
  .noPlasma
    LDA #$0000 : STA !ram_cm_plasma

    ; set bank for manual submenu jump
+   PHK : PHK : PLA
    STA !ram_cm_menu_bank
    JML action_submenu
}


; ---------------------
; Toggle Category Menu
; ---------------------

; These are setup as speedrun categories by default
; Edit EquipmentTable with items from different progression points in your hack

ToggleCategoryMenu:
    dw #cat_100
    dw #cat_any_new
    dw #cat_any_old
    dw #cat_14ice
    dw #cat_14speed
    dw #cat_gt_code
    dw #cat_rbo
    dw #cat_any_glitched
    dw #cat_inf_cf
    dw #cat_nothing
    dw #$0000
    %cm_header("CATEGORY PRESETS")

cat_100:
    %cm_jsl("100%", action_category, #$0000)

cat_any_new:
    %cm_jsl("Any% PRKD", action_category, #$0001)

cat_any_old:
    %cm_jsl("Any% KPDR", action_category, #$0002)

cat_14ice:
    %cm_jsl("14% Ice", action_category, #$0003)

cat_14speed:
    %cm_jsl("14% Speed", action_category, #$0004)

cat_gt_code:
    %cm_jsl("GT Code", action_category, #$0005)

cat_gt_135:
    %cm_jsl("GT Max%", action_category, #$0006)

cat_rbo:
    %cm_jsl("RBO", action_category, #$0007)

cat_any_glitched:
    %cm_jsl("Any% Glitched", action_category, #$0008)

cat_inf_cf:
    %cm_jsl("Infinite Crystal Flashes", action_category, #$0009)

cat_nothing:
    %cm_jsl("Nothing", action_category, #$000A)

action_category:
{
    ; table index in Y
    ; dummy column allows for easy math
    TYA : ASL #4 : TAX

    LDA.l EquipmentTable,X : STA.w CollectedItems : STA.w EquippedItems : INX #2

    LDA.l EquipmentTable,X : STA.w CollectedBeams : TAY
    ; check if Spazer+Plasma
    AND #$000C : CMP #$000C : BEQ .murderBeam
    TYA : STA.w EquippedBeams : INX #2 : BRA +

  .murderBeam
    ; choose Plasma over Spazer
    TYA : AND #$100B : STA.w EquippedBeams : INX #2

+   LDA.l EquipmentTable,X : STA.w Energy : STA.w MaxEnergy : INX #2
    LDA.l EquipmentTable,X : STA.w Missiles : STA.w MaxMissiles : INX #2
    LDA.l EquipmentTable,X : STA.w SuperMissiles : STA.w MaxSuperMissiles : INX #2
    LDA.l EquipmentTable,X : STA.w PowerBombs : STA.w MaxPowerBombs : INX #2
    LDA.l EquipmentTable,X : STA.w MaxReserveEnergy : STA.w ReserveEnergy : INX #2

    %sfxmissile()
    RTL
}

EquipmentTable:
    ;  Items,  Beams,  Health, Missil, Supers, PBs,    Reserv, Dummy
    dw #$F32F, #$100F, #$05DB, #$00E6, #$0032, #$0032, #$0190, #$0000 ; 100%
    dw #$3125, #$1007, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000 ; any% new
    dw #$3325, #$100B, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000 ; any% old
    dw #$1025, #$1002, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000 ; 14% ice
    dw #$3025, #$1000, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000 ; 14% speed
    dw #$F33F, #$100F, #$02BC, #$0064, #$0014, #$0014, #$012C, #$0000 ; gt code
    dw #$F33F, #$100F, #$0834, #$0145, #$0041, #$0041, #$02BC, #$0000 ; 135%
    dw #$710C, #$1001, #$031F, #$001E, #$0019, #$0014, #$0064, #$0000 ; rbo
    dw #$9004, #$0000, #$00C7, #$0005, #$0005, #$0005, #$0000, #$0000 ; any% glitched
    dw #$F32F, #$100F, #$0031, #$01A4, #$005A, #$0063, #$0000, #$0000 ; crystal flash
    dw #$0000, #$0000, #$0063, #$0000, #$0000, #$0000, #$0000, #$0000 ; nothing


; ------------------
; Toggle Items menu
; ------------------

ToggleItemsMenu:
    dw #ti_variasuit
    dw #ti_gravitysuit
    dw #$FFFF
    dw #ti_morphball
    dw #ti_bomb
    dw #ti_springball
    dw #ti_screwattack
    dw #$FFFF
    dw #ti_hijumpboots
    dw #ti_spacejump
    dw #ti_speedbooster
    dw #$FFFF
    dw #ti_grapple
    dw #ti_xray
    dw #$0000
    %cm_header("TOGGLE ITEMS")

ti_variasuit:
    %cm_equipment_item("Varia Suit", !ram_cm_varia, #$0001, #$FFFE)

ti_gravitysuit:
    %cm_equipment_item("Gravity Suit", !ram_cm_gravity, #$0020, #$FFDF)

ti_morphball:
    %cm_equipment_item("Morph Ball", !ram_cm_morph, #$0004, #$FFFB)

ti_bomb:
    %cm_equipment_item("Bombs", !ram_cm_bombs, #$1000, #$EFFF)

ti_springball:
    %cm_equipment_item("Spring Ball", !ram_cm_spring, #$0002, #$FFFD)

ti_screwattack:
    %cm_equipment_item("Screw Attack", !ram_cm_screw, #$0008, #$FFF7)

ti_hijumpboots:
    %cm_equipment_item("Hi Jump Boots", !ram_cm_hijump, #$0100, #$FEFF)

ti_spacejump:
    %cm_equipment_item("Space Jump", !ram_cm_space, #$0200, #$FDFF)

ti_speedbooster:
    %cm_equipment_item("Speed Booster", !ram_cm_speed, #$2000, #$DFFF)

ti_grapple:
    %cm_toggle_bit("Grapple", CollectedItems, #$4000, .routine)
  .routine
    LDA.w EquippedItems : EOR #$4000 : STA.w EquippedItems
    RTL

ti_xray:
    %cm_toggle_bit("X-Ray", CollectedItems, #$8000, .routine)
  .routine
    LDA.w EquippedItems : EOR #$8000 : STA.w EquippedItems
    RTL

equipment_toggle_items:
{
; DP values are passed in from the cm_equipment_item macro that calls this routine
; Address is a 24-bit pointer to dummy RAM, Increment is the inverse, ToggleValue is the bitmask
    LDA [!DP_Address] : BEQ .unobtained
    DEC : BEQ .equipped
    ; unquipped
    LDA.w EquippedItems : AND !DP_Increment : STA.w EquippedItems
    LDA.w CollectedItems : ORA !DP_ToggleValue : STA.w CollectedItems
    RTL

  .equipped
    LDA.w EquippedItems : ORA !DP_ToggleValue : STA.w EquippedItems
    LDA.w CollectedItems : ORA !DP_ToggleValue : STA.w CollectedItems
    RTL

  .unobtained
    LDA.w EquippedItems : AND !DP_Increment : STA.w EquippedItems
    LDA.w CollectedItems : AND !DP_Increment : STA.w CollectedItems
    RTL
}


; -----------------
; Toggle Beams menu
; -----------------

ToggleBeamsMenu:
    dw tb_chargebeam
    dw tb_icebeam
    dw tb_wavebeam
    dw tb_spazerbeam
    dw tb_plasmabeam
    dw #$FFFF
    dw misc_hyperbeam
    dw #$FFFF
    dw tb_glitchedbeams
    dw #$0000
    %cm_header("TOGGLE BEAMS")

tb_chargebeam:
    %cm_equipment_beam("Charge", !ram_cm_charge, #$1000, #$EFFF, #$100F)

tb_icebeam:
    %cm_equipment_beam("Ice", !ram_cm_ice, #$0002, #$FFFD, #$100F)

tb_wavebeam:
    %cm_equipment_beam("Wave", !ram_cm_wave, #$0001, #$FFFE, #$100F)

tb_spazerbeam:
    %cm_equipment_beam("Spazer", !ram_cm_spazer, #$0004, #$FFFB, #$1007)

tb_plasmabeam:
    %cm_equipment_beam("Plasma", !ram_cm_plasma, #$0008, #$FFF7, #$100B)

tb_glitchedbeams:
    %cm_submenu("Glitched Beams", #GlitchedBeamsMenu)

equipment_toggle_beams:
{
; DP values are passed in from the cm_equipment_beam macro that calls this routine
; Address is a 24-bit pointer to dummy RAM, Increment is the inverse, ToggleValue is the bitmask, Temp is the AND for Spazer+Plasma safety
; Set the AND to max beams if your hack allows Spazer+Plasma
    LDA [!DP_Address] : BEQ .unobtained
    DEC : BEQ .equipped
    ; unquipped
    LDA.w EquippedBeams : AND !DP_Increment : STA.w EquippedBeams
    LDA.w CollectedBeams : ORA !DP_ToggleValue : STA.w CollectedBeams
    BRA .done

  .equipped
    LDA.w EquippedBeams : ORA !DP_ToggleValue : AND !DP_Temp : STA.w EquippedBeams
    LDA.w CollectedBeams : ORA !DP_ToggleValue : STA.w CollectedBeams
    BRA .done

  .unobtained
    LDA.w EquippedBeams : AND !DP_Increment : STA.w EquippedBeams
    LDA.w CollectedBeams : AND !DP_Increment : STA.w CollectedBeams

  .done
    JML Update_Beam_Tiles_and_Palette
}


; -------------------
; Glitched Beams menu
; -------------------

GlitchedBeamsMenu:
    dw #gb_murder
    dw #gb_spacetime
    dw #gb_chainsaw
    dw #gb_unnamed
    dw #$0000
    %cm_header("GL1TC#ED %E4MS")
    %cm_footer("BEWARE OF CRASHES")

gb_murder:
    %cm_jsl("Murder Beam", action_glitched_beam, #$100F)

gb_spacetime:
    %cm_jsl("Spacetime Beam", action_glitched_beam, #$100E)

gb_chainsaw:
    %cm_jsl("Chainsaw Beam", action_glitched_beam, #$100D)

gb_unnamed:
    %cm_jsl("Unnamed Glitched Beam", action_glitched_beam, #$100C)

action_glitched_beam:
{
    TYA
    STA.w EquippedBeams : STA.w CollectedBeams
    ; play a song-dependent sound
    ; and hope it's the wrong song :)
    LDA #$0042 : JSL QueueSound_Lib1_Max1
    JML Update_Beam_Tiles_and_Palette
}



; -------------
; Teleport Menu
; -------------

; The entire load station list is included here, but empty entries are commented out to save space by default
; You can setup hidden load points (without a save station) in your hack to quickly warp to key locations via the menu
; Using a teleport does not load any save file. Samus will be teleported as she is, with a few flags cleared.

TeleportMenu:
    dw #tel_goto_crateria
    dw #tel_goto_brinstar
    dw #tel_goto_norfair
    dw #tel_goto_wreckedship
    dw #tel_goto_maridia
    dw #tel_goto_tourian
    dw #tel_goto_ceres
;    dw #tel_goto_debug
    dw #$0000
    %cm_header("TELEPORT TO SAVE STATION")

tel_goto_crateria:
    %cm_submenu("Crateria", #TeleportCrateriaMenu)

tel_goto_brinstar:
    %cm_submenu("Brinstar", #TeleportBrinstarMenu)

tel_goto_norfair:
    %cm_submenu("Norfair", #TeleportNorfairMenu)

tel_goto_wreckedship:
    %cm_submenu("Wrecked Ship", #TeleportWreckedShipMenu)

tel_goto_maridia:
    %cm_submenu("Maridia", #TeleportMaridiaMenu)

tel_goto_tourian:
    %cm_submenu("Tourian", #TeleportTourianMenu)

tel_goto_ceres:
    %cm_submenu("Ceres", #TeleportCeresMenu)

;tel_goto_debug:
;    %cm_submenu("Debug", #TeleportDebugMenu)

TeleportCrateriaMenu:
    dw #tel_crateriaship
    dw #tel_crateriaparlor
;    dw #tel_crateria02
;    dw #tel_crateria03
;    dw #tel_crateria04
;    dw #tel_crateria05
;    dw #tel_crateria06
;    dw #tel_crateria07
    dw #tel_crateria08
    dw #tel_crateria09
    dw #tel_crateria0A
    dw #tel_crateria0B
    dw #tel_crateria0C
;    dw #tel_crateria0D
;    dw #tel_crateria0E
;    dw #tel_crateria0F
    dw #tel_crateria10
    dw #tel_crateria11
    dw #tel_craterialanding
    dw #$0000
    %cm_header("CRATERIA SAVE STATIONS")

tel_crateriaship:
    %cm_jsl("Crateria Ship", #action_teleport, #$0000)

tel_crateriaparlor:
    %cm_jsl("Crateria Parlor", #action_teleport, #$0001)

;tel_crateria02:
;    %cm_jsl("Crateria EMPTY 02", #action_teleport, #$0002)
;
;tel_crateria03:
;    %cm_jsl("Crateria EMPTY 03", #action_teleport, #$0003)
;
;tel_crateria04:
;    %cm_jsl("Crateria EMPTY 04", #action_teleport, #$0004)
;
;tel_crateria05:
;    %cm_jsl("Crateria EMPTY 05", #action_teleport, #$0005)
;
;tel_crateria06:
;    %cm_jsl("Crateria EMPTY 06", #action_teleport, #$0006)
;
;tel_crateria07:
;    %cm_jsl("Crateria EMPTY 07", #action_teleport, #$0007)

tel_crateria08:
    %cm_jsl("Crateria DEBUG 08", #action_teleport, #$0008)

tel_crateria09:
    %cm_jsl("Crateria DEBUG 09", #action_teleport, #$0009)

tel_crateria0A:
    %cm_jsl("Crateria DEBUG 0A", #action_teleport, #$000A)

tel_crateria0B:
    %cm_jsl("Crateria DEBUG 0B", #action_teleport, #$000B)

tel_crateria0C:
    %cm_jsl("Crateria DEBUG 0C", #action_teleport, #$000C)

;tel_crateria0D:
;    %cm_jsl("Crateria EMPTY 0D", #action_teleport, #$000D)
;
;tel_crateria0E:
;    %cm_jsl("Crateria EMPTY 0E", #action_teleport, #$000E)
;
;tel_crateria0F:
;    %cm_jsl("Crateria EMPTY 0F", #action_teleport, #$000F)

tel_crateria10:
    %cm_jsl("Crateria DEBUG 10", #action_teleport, #$0010)

tel_crateria11:
    %cm_jsl("Crateria DEBUG 11", #action_teleport, #$0011)

tel_craterialanding:
    %cm_jsl("Crateria Gunship Landing", #action_teleport, #$0012)

TeleportBrinstarMenu:
    dw #tel_brinstarpink
    dw #tel_brinstargreenshaft
    dw #tel_brinstargreenetecoons
    dw #tel_brinstarkraid
    dw #tel_brinstarredtower
;    dw #tel_brinstar05
;    dw #tel_brinstar06
;    dw #tel_brinstar07
    dw #tel_brinstar08
    dw #tel_brinstar09
    dw #tel_brinstar0A
    dw #tel_brinstar0B
;    dw #tel_brinstar0C
;    dw #tel_brinstar0D
;    dw #tel_brinstar0E
;    dw #tel_brinstar0F
    dw #tel_brinstar10
    dw #tel_brinstar11
    dw #tel_brinstar12
    dw #$0000
    %cm_header("BRINSTAR SAVE STATIONS")

tel_brinstarpink:
    %cm_jsl("Brinstar Pink Spospo", #action_teleport, #$0100)

tel_brinstargreenshaft:
    %cm_jsl("Brinstar Green Shaft", #action_teleport, #$0101)

tel_brinstargreenetecoons:
    %cm_jsl("Brinstar Green Etecoons", #action_teleport, #$0102)

tel_brinstarkraid:
    %cm_jsl("Brinstar Kraid", #action_teleport, #$0103)

tel_brinstarredtower:
    %cm_jsl("Brinstar Red Tower", #action_teleport, #$0104)

;tel_brinstar05:
;    %cm_jsl("Brinstar EMPTY 05", #action_teleport, #$0105)
;
;tel_brinstar06:
;    %cm_jsl("Brinstar EMPTY 06", #action_teleport, #$0106)
;
;tel_brinstar07:
;    %cm_jsl("Brinstar EMPTY 07", #action_teleport, #$0107)

tel_brinstar08:
    %cm_jsl("Brinstar DEBUG 08", #action_teleport, #$0108)

tel_brinstar09:
    %cm_jsl("Brinstar DEBUG 09", #action_teleport, #$0109)

tel_brinstar0A:
    %cm_jsl("Brinstar DEBUG 0A", #action_teleport, #$010A)

tel_brinstar0B:
    %cm_jsl("Brinstar DEBUG 0B", #action_teleport, #$010B)

;tel_brinstar0C:
;    %cm_jsl("Brinstar EMPTY 0C", #action_teleport, #$010C)
;
;tel_brinstar0D:
;    %cm_jsl("Brinstar EMPTY 0D", #action_teleport, #$010D)
;
;tel_brinstar0E:
;    %cm_jsl("Brinstar EMPTY 0E", #action_teleport, #$010E)
;
;tel_brinstar0F:
;    %cm_jsl("Brinstar EMPTY 0F", #action_teleport, #$010F)

tel_brinstar10:
    %cm_jsl("Brinstar DEBUG 10", #action_teleport, #$0110)

tel_brinstar11:
    %cm_jsl("Brinstar DEBUG 11", #action_teleport, #$0111)

tel_brinstar12:
    %cm_jsl("Brinstar DEBUG 12", #action_teleport, #$0112)

TeleportNorfairMenu:
    dw #tel_norfairgrapple
    dw #tel_norfairbubble
    dw #tel_norfairtunnel
    dw #tel_norfaircrocomire
    dw #tel_norfairlnelevator
    dw #tel_norfairridley
;    dw #tel_norfair06
;    dw #tel_norfair07
    dw #tel_norfair08
    dw #tel_norfair09
    dw #tel_norfair0A
;    dw #tel_norfair0B
;    dw #tel_norfair0C
;    dw #tel_norfair0D
;    dw #tel_norfair0E
;    dw #tel_norfair0F
    dw #tel_norfair10
    dw #tel_norfair11
    dw #tel_norfair12
    dw #tel_norfair13
    dw #tel_norfair14
    dw #tel_norfair15
    dw #tel_norfair16
    dw #$0000
    %cm_header("NORFAIR SAVE STATIONS")

tel_norfairgrapple:
    %cm_jsl("Norfair Grapple", #action_teleport, #$0200)

tel_norfairbubble:
    %cm_jsl("Norfair Bubble Mountain", #action_teleport, #$0201)

tel_norfairtunnel:
    %cm_jsl("Norfair Tunnel", #action_teleport, #$0202)

tel_norfaircrocomire:
    %cm_jsl("Norfair Crocomire", #action_teleport, #$0203)

tel_norfairlnelevator:
    %cm_jsl("Norfair LN Elevator", #action_teleport, #$0204)

tel_norfairridley:
    %cm_jsl("Norfair Ridley", #action_teleport, #$0205)

;tel_norfair06:
;    %cm_jsl("Norfair EMPTY 06", #action_teleport, #$0206)
;
;tel_norfair07:
;    %cm_jsl("Norfair EMPTY 07", #action_teleport, #$0207)

tel_norfair08:
    %cm_jsl("Norfair DEBUG 08", #action_teleport, #$0208)

tel_norfair09:
    %cm_jsl("Norfair DEBUG 09", #action_teleport, #$0209)

tel_norfair0A:
    %cm_jsl("Norfair DEBUG 0A", #action_teleport, #$020A)

;tel_norfair0B:
;    %cm_jsl("Norfair EMPTY 0B", #action_teleport, #$020B)
;
;tel_norfair0C:
;    %cm_jsl("Norfair EMPTY 0C", #action_teleport, #$020C)
;
;tel_norfair0D:
;    %cm_jsl("Norfair EMPTY 0D", #action_teleport, #$020D)
;
;tel_norfair0E:
;    %cm_jsl("Norfair EMPTY 0E", #action_teleport, #$020E)
;
;tel_norfair0F:
;    %cm_jsl("Norfair EMPTY 0F", #action_teleport, #$020F)

tel_norfair10:
    %cm_jsl("Norfair DEBUG 10", #action_teleport, #$0210)

tel_norfair11:
    %cm_jsl("Norfair DEBUG 11", #action_teleport, #$0211)

tel_norfair12:
    %cm_jsl("Norfair DEBUG 12", #action_teleport, #$0212)

tel_norfair13:
    %cm_jsl("Norfair DEBUG 13", #action_teleport, #$0213)

tel_norfair14:
    %cm_jsl("Norfair DEBUG 14", #action_teleport, #$0214)

tel_norfair15:
    %cm_jsl("Norfair DEBUG 15", #action_teleport, #$0215)

tel_norfair16:
    %cm_jsl("Norfair DEBUG 16", #action_teleport, #$0216)

TeleportWreckedShipMenu:
    dw #tel_wreckedship
;    dw #tel_wreckedship01
;    dw #tel_wreckedship02
;    dw #tel_wreckedship03
;    dw #tel_wreckedship04
;    dw #tel_wreckedship05
;    dw #tel_wreckedship06
;    dw #tel_wreckedship07
;    dw #tel_wreckedship08
;    dw #tel_wreckedship09
;    dw #tel_wreckedship0A
;    dw #tel_wreckedship0B
;    dw #tel_wreckedship0C
;    dw #tel_wreckedship0D
;    dw #tel_wreckedship0E
;    dw #tel_wreckedship0F
    dw #tel_wreckedship10
    dw #tel_wreckedship11
    dw #$0000
    %cm_header("WRECKED SHIP SAVE STATIONS")

tel_wreckedship:
    %cm_jsl("Wrecked Ship", #action_teleport, #$0300)

;tel_wreckedship01:
;    %cm_jsl("Wrecked Ship EMPTY 01", #action_teleport, #$0301)
;
;tel_wreckedship02:
;    %cm_jsl("Wrecked Ship EMPTY 02", #action_teleport, #$0302)
;
;tel_wreckedship03:
;    %cm_jsl("Wrecked Ship EMPTY 03", #action_teleport, #$0303)
;
;tel_wreckedship04:
;    %cm_jsl("Wrecked Ship EMPTY 04", #action_teleport, #$0304)
;
;tel_wreckedship05:
;    %cm_jsl("Wrecked Ship EMPTY 05", #action_teleport, #$0305)
;
;tel_wreckedship06:
;    %cm_jsl("Wrecked Ship EMPTY 06", #action_teleport, #$0306)
;
;tel_wreckedship07:
;    %cm_jsl("Wrecked Ship EMPTY 07", #action_teleport, #$0307)
;
;tel_wreckedship08:
;    %cm_jsl("Wrecked Ship EMPTY 08", #action_teleport, #$0308)
;
;tel_wreckedship09:
;    %cm_jsl("Wrecked Ship EMPTY 09", #action_teleport, #$0309)
;
;tel_wreckedship0A:
;    %cm_jsl("Wrecked Ship EMPTY 0A", #action_teleport, #$030A)
;
;tel_wreckedship0B:
;    %cm_jsl("Wrecked Ship EMPTY 0B", #action_teleport, #$030B)
;
;tel_wreckedship0C:
;    %cm_jsl("Wrecked Ship EMPTY 0C", #action_teleport, #$030C)
;
;tel_wreckedship0D:
;    %cm_jsl("Wrecked Ship EMPTY 0D", #action_teleport, #$030D)
;
;tel_wreckedship0E:
;    %cm_jsl("Wrecked Ship EMPTY 0E", #action_teleport, #$030E)
;
;tel_wreckedship0F:
;    %cm_jsl("Wrecked Ship EMPTY 0F", #action_teleport, #$030F)

tel_wreckedship10:
    %cm_jsl("Wrecked Ship DEBUG 10", #action_teleport, #$0310)

tel_wreckedship11:
    %cm_jsl("Wrecked Ship DEBUG 11", #action_teleport, #$0311)

TeleportMaridiaMenu:
    dw #tel_maridiatube
    dw #tel_maridiaelevator
    dw #tel_maridiaaqueduct
    dw #tel_maridiadraygon
;    dw #tel_maridia04
;    dw #tel_maridia05
;    dw #tel_maridia06
;    dw #tel_maridia07
    dw #tel_maridia08
;    dw #tel_maridia09
;    dw #tel_maridia0A
;    dw #tel_maridia0B
;    dw #tel_maridia0C
;    dw #tel_maridia0D
;    dw #tel_maridia0E
;    dw #tel_maridia0F
    dw #tel_maridia10
    dw #tel_maridia11
    dw #tel_maridia12
    dw #tel_maridia13
    dw #$0000
    %cm_header("MARIDIA SAVE STATIONS")

tel_maridiatube:
    %cm_jsl("Maridia Tube", #action_teleport, #$0400)

tel_maridiaelevator:
    %cm_jsl("Maridia Elevator", #action_teleport, #$0401)

tel_maridiaaqueduct:
    %cm_jsl("Maridia Aqueduct", #action_teleport, #$0402)

tel_maridiadraygon:
    %cm_jsl("Maridia Draygon", #action_teleport, #$0403)

;tel_maridia04:
;    %cm_jsl("Maridia EMPTY 04", #action_teleport, #$0404)
;
;tel_maridia05:
;    %cm_jsl("Maridia EMPTY 05", #action_teleport, #$0405)
;
;tel_maridia06:
;    %cm_jsl("Maridia EMPTY 06", #action_teleport, #$0406)
;
;tel_maridia07:
;    %cm_jsl("Maridia EMPTY 07", #action_teleport, #$0407)

tel_maridia08:
    %cm_jsl("Maridia DEBUG 08", #action_teleport, #$0408)

;tel_maridia09:
;    %cm_jsl("Maridia EMPTY 09", #action_teleport, #$0409)
;
;tel_maridia0A:
;    %cm_jsl("Maridia EMPTY 0A", #action_teleport, #$040A)
;
;tel_maridia0B:
;    %cm_jsl("Maridia EMPTY 0B", #action_teleport, #$040B)
;
;tel_maridia0C:
;    %cm_jsl("Maridia EMPTY 0C", #action_teleport, #$040C)
;
;tel_maridia0D:
;    %cm_jsl("Maridia EMPTY 0D", #action_teleport, #$040D)
;
;tel_maridia0E:
;    %cm_jsl("Maridia EMPTY 0E", #action_teleport, #$040E)
;
;tel_maridia0F:
;    %cm_jsl("Maridia EMPTY 0F", #action_teleport, #$040F)

tel_maridia10:
    %cm_jsl("Maridia DEBUG 10", #action_teleport, #$0410)

tel_maridia11:
    %cm_jsl("Maridia DEBUG 11", #action_teleport, #$0411)

tel_maridia12:
    %cm_jsl("Maridia DEBUG 12", #action_teleport, #$0412)

tel_maridia13:
    %cm_jsl("Maridia DEBUG 13", #action_teleport, #$0413)

TeleportTourianMenu:
    dw #tel_tourianmb
    dw #tel_tourianentrance
;    dw #tel_tourian02
;    dw #tel_tourian03
;    dw #tel_tourian04
;    dw #tel_tourian05
;    dw #tel_tourian06
;    dw #tel_tourian07
    dw #tel_tourian08
;    dw #tel_tourian09
;    dw #tel_tourian0A
;    dw #tel_tourian0B
;    dw #tel_tourian0C
;    dw #tel_tourian0D
;    dw #tel_tourian0E
;    dw #tel_tourian0F
    dw #tel_tourian10
    dw #tel_tourian11
    dw #$0000
    %cm_header("TOURIAN SAVE STATIONS")

tel_tourianmb:
    %cm_jsl("Tourian MB", #action_teleport, #$0500)

tel_tourianentrance:
    %cm_jsl("Tourian Entrance", #action_teleport, #$0501)

tel_tourian02:
    %cm_jsl("Tourian EMPTY 02", #action_teleport, #$0502)

tel_tourian03:
    %cm_jsl("Tourian EMPTY 03", #action_teleport, #$0503)

tel_tourian04:
    %cm_jsl("Tourian EMPTY 04", #action_teleport, #$0504)

tel_tourian05:
    %cm_jsl("Tourian EMPTY 05", #action_teleport, #$0505)

tel_tourian06:
    %cm_jsl("Tourian EMPTY 06", #action_teleport, #$0506)

tel_tourian07:
    %cm_jsl("Tourian EMPTY 07", #action_teleport, #$0507)

tel_tourian08:
    %cm_jsl("Tourian DEBUG 08", #action_teleport, #$0508)

tel_tourian09:
    %cm_jsl("Tourian EMPTY 09", #action_teleport, #$0509)

tel_tourian0A:
    %cm_jsl("Tourian EMPTY 0A", #action_teleport, #$050A)

tel_tourian0B:
    %cm_jsl("Tourian EMPTY 0B", #action_teleport, #$050B)

tel_tourian0C:
    %cm_jsl("Tourian EMPTY 0C", #action_teleport, #$050C)

tel_tourian0D:
    %cm_jsl("Tourian EMPTY 0D", #action_teleport, #$050D)

tel_tourian0E:
    %cm_jsl("Tourian EMPTY 0E", #action_teleport, #$050E)

tel_tourian0F:
    %cm_jsl("Tourian EMPTY 0F", #action_teleport, #$050F)

tel_tourian10:
    %cm_jsl("Tourian DEBUG 10", #action_teleport, #$0510)

tel_tourian11:
    %cm_jsl("Tourian DEBUG 11", #action_teleport, #$0511)

TeleportCeresMenu:
    dw #tel_cereselevator
;    dw #tel_ceres01
;    dw #tel_ceres02
;    dw #tel_ceres03
;    dw #tel_ceres04
;    dw #tel_ceres05
;    dw #tel_ceres06
;    dw #tel_ceres07
;    dw #tel_ceres08
;    dw #tel_ceres09
;    dw #tel_ceres0A
;    dw #tel_ceres0B
;    dw #tel_ceres0C
;    dw #tel_ceres0D
;    dw #tel_ceres0E
;    dw #tel_ceres0F
;    dw #tel_ceres10
    dw #$0000
    %cm_header("Ceres SAVE STATIONS")

tel_cereselevator:
    %cm_jsl("Ceres Elevator", #action_teleport, #$0601)

;tel_ceres01:
;    %cm_jsl("Ceres EMPTY 01", #action_teleport, #$0601)
;
;tel_ceres02:
;    %cm_jsl("Ceres EMPTY 02", #action_teleport, #$0602)
;
;tel_ceres03:
;    %cm_jsl("Ceres EMPTY 03", #action_teleport, #$0603)
;
;tel_ceres04:
;    %cm_jsl("Ceres EMPTY 04", #action_teleport, #$0604)
;
;tel_ceres05:
;    %cm_jsl("Ceres EMPTY 05", #action_teleport, #$0605)
;
;tel_ceres06:
;    %cm_jsl("Ceres EMPTY 06", #action_teleport, #$0606)
;
;tel_ceres07:
;    %cm_jsl("Ceres EMPTY 07", #action_teleport, #$0607)
;
;tel_ceres08:
;    %cm_jsl("Ceres EMPTY 08", #action_teleport, #$0608)
;
;tel_ceres09:
;    %cm_jsl("Ceres EMPTY 09", #action_teleport, #$0609)
;
;tel_ceres0A:
;    %cm_jsl("Ceres EMPTY 0A", #action_teleport, #$060A)
;
;tel_ceres0B:
;    %cm_jsl("Ceres EMPTY 0B", #action_teleport, #$060B)
;
;tel_ceres0C:
;    %cm_jsl("Ceres EMPTY 0C", #action_teleport, #$060C)
;
;tel_ceres0D:
;    %cm_jsl("Ceres EMPTY 0D", #action_teleport, #$060D)
;
;tel_ceres0E:
;    %cm_jsl("Ceres EMPTY 0E", #action_teleport, #$060E)
;
;tel_ceres0F:
;    %cm_jsl("Ceres EMPTY 0F", #action_teleport, #$060F)
;
;tel_ceres10:
;    %cm_jsl("Ceres EMPTY 10", #action_teleport, #$0610)

;TeleportDebugMenu:
;    dw #tel_debugroom ; crashes :(
;    dw #tel_debug01
;    dw #tel_debug02
;    dw #tel_debug03
;    dw #tel_debug04
;    dw #tel_debug05
;    dw #tel_debug06
;    dw #tel_debug07
;    dw #tel_debug08
;    dw #tel_debug09
;    dw #tel_debug0A
;    dw #tel_debug0B
;    dw #tel_debug0C
;    dw #tel_debug0D
;    dw #tel_debug0E
;    dw #tel_debug0F
;    dw #tel_debug10
;    dw #$0000
;    %cm_header("Debug SAVE STATIONS")

;tel_debugroom:
;    %cm_jsl("Debug Room", #action_teleport, #$0701)
;
;tel_debug01:
;    %cm_jsl("Debug EMPTY 01", #action_teleport, #$0701)
;
;tel_debug02:
;    %cm_jsl("Debug EMPTY 02", #action_teleport, #$0702)
;
;tel_debug03:
;    %cm_jsl("Debug EMPTY 03", #action_teleport, #$0703)
;
;tel_debug04:
;    %cm_jsl("Debug EMPTY 04", #action_teleport, #$0704)
;
;tel_debug05:
;    %cm_jsl("Debug EMPTY 05", #action_teleport, #$0705)
;
;tel_debug06:
;    %cm_jsl("Debug EMPTY 06", #action_teleport, #$0706)
;
;tel_debug07:
;    %cm_jsl("Debug EMPTY 07", #action_teleport, #$0707)
;
;tel_debug08:
;    %cm_jsl("Debug EMPTY 08", #action_teleport, #$0708)
;
;tel_debug09:
;    %cm_jsl("Debug EMPTY 09", #action_teleport, #$0709)
;
;tel_debug0A:
;    %cm_jsl("Debug EMPTY 0A", #action_teleport, #$070A)
;
;tel_debug0B:
;    %cm_jsl("Debug EMPTY 0B", #action_teleport, #$070B)
;
;tel_debug0C:
;    %cm_jsl("Debug EMPTY 0C", #action_teleport, #$070C)
;
;tel_debug0D:
;    %cm_jsl("Debug EMPTY 0D", #action_teleport, #$070D)
;
;tel_debug0E:
;    %cm_jsl("Debug EMPTY 0E", #action_teleport, #$070E)
;
;tel_debug0F:
;    %cm_jsl("Debug EMPTY 0F", #action_teleport, #$070F)
;
;tel_debug10:
;    %cm_jsl("Debug EMPTY 10", #action_teleport, #$0710)

action_teleport:
{
    ; teleport destination in Y when called
    ; high byte is area index, low byte is load station index
    TYA
    %a8()
    STA.w LoadStationIndex
    XBA : STA.w AreaIndex

    LDA #$06 : STA.w GameState

    ; Make sure we can teleport to Zebes from Ceres
    LDA #$05 : STA.l SRAMMirror_LoadingGameState

    %a16()
    STZ.w PauseMenu_MenuIndex
    STZ.w DoorTransitionFlagElevatorsZebetites
    STZ.w ElevatorStatus
    STZ.w MessageBoxIndex

    JSL stop_all_sounds

    LDA #$0001 : STA !ram_cm_leave

    RTL
}


; -----------
; Misc menu
; -----------

MiscMenu:
    dw #misc_bluesuit
    dw #misc_flashsuit
    dw #$FFFF
    dw #misc_invincibility
    dw #misc_slowdownrate
    dw #misc_waterphysics
    dw #$FFFF
    dw #misc_killenemies
    dw #$0000
    %cm_header("MISC OPTIONS")

misc_bluesuit:
    %cm_toggle("Blue Suit", SamusBoostCounter, #$0004, #0)

misc_flashsuit:
    %cm_toggle("Flash Suit", SpecialPaletteTimer, #$0001, #0)

misc_hyperbeam:
    %cm_toggle_bit("Hyper Beam", HyperBeam, #$8000, #.routine)
  .routine
    AND #$8000 : BEQ .off
    LDA #$0003 ; jump table index
    JML DrainedSamusController

  .off
    LDA.w CollectedBeams : AND #$000C : CMP #$000C : BEQ .disableMurder
    LDA.w CollectedBeams : STA.w EquippedBeams
    BRA +

  .disableMurder
    LDA.w CollectedBeams : AND #$000B : STA.w EquippedBeams

+   LDX #$000E
  .loopFXobjects
    ; find Hyper Beam palette FX object the index
    LDA.w PaletteFXObject_IDs,X : CMP.w #PaletteFXObjects_HyperBeam : BEQ .found
    DEX #2 : BPL .loopFXobjects

  .found
    STZ.w PaletteFXObject_IDs,X ; this is probably the only one that matters
    STZ.w PaletteFXObject_ColorIndices,X : STZ.w PaletteFXObject_ColorIndices,X
    STZ.w PaletteFXObject_InstListPointers,X : STZ.w PaletteFXObject_InstructionTimers,X : STZ.w PaletteFXObject_Timers,X

    JML Update_Beam_Tiles_and_Palette

misc_slowdownrate:
    %cm_numfield("Samus Slowdown Rate", XSpeedDivisor, 0, 4, 1, 1, #0)

misc_waterphysics:
    %cm_toggle("Ignore Water this Room", FX_LiquidOptions, #$0004, #0)

misc_invincibility:
    %cm_toggle_bit("Invincibility", DebugInvincibility, #$0007, #0)

misc_killenemies:
    %cm_jsl("Kill Enemies", .kill_loop, #0)
  .kill_loop
    ; 8000 = solid to Samus, 0400 = Ignore Samus projectiles
    TAX : LDA.w Enemy.properties,X : BIT #$8400 : BNE .next_enemy
    ORA #$0200 : STA.w Enemy.properties,X
  .next_enemy
    TXA : CLC : ADC #$0040 : CMP #$0400 : BNE .kill_loop

    %sfxconfirm()
    RTL


; -----------
; Events menu
; -----------

EventsMenu:
    dw #events_resetevents
    dw #events_resetdoors
    dw #events_resetitems
    dw #$FFFF
    dw #events_goto_bosses
    dw #$FFFF
    dw #events_zebesawake
    dw #events_maridiatubebroken
    dw #events_chozoacid
    dw #events_shaktool
    dw #events_tourian
    dw #events_metroid1
    dw #events_metroid2
    dw #events_metroid3
    dw #events_metroid4
    dw #events_zeb1
    dw #events_zeb2
    dw #events_zeb3
    dw #events_mb1glass
    dw #events_zebesexploding
    dw #events_animals
    dw #$0000
    %cm_header("EVENT FLAGS")

events_resetevents:
    %cm_jsl("Reset All Events", .routine, #$0000)
  .routine
    ; clears vanilla event bits:.l SRAMMirror_Event..23
    LDA #$0000
    STA.l SRAMMirror_Event : STA.l SRAMMirror_Event+2
    %sfxquake()
    RTL

events_resetdoors:
    %cm_jsl("Reset All Doors", .routine, #$0000)
  .routine
    ; clears vanilla door bits: $7ED8B0..CF
    %ai8()
    LDA #$00 : LDX.b #SRAMMirror_Doors
-   STA.l SRAMMirror_Doors&$FFFF00,X
    INX : CPX.b #SRAMMirror_Doors+$20 : BNE -
    %ai16()
    %sfxquake()
    RTL

events_resetitems:
    %cm_jsl("Reset All Items", .routine, #$0000)
  .routine
    ; clears vanilla item bits: $7ED870..8F
    %ai8()
    LDA #$00 : LDX.b #SRAMMirror_Items
-   STA SRAMMirror_Items&$FFFF00,X
    INX : CPX #SRAMMirror_Items+$20 : BNE -
    %ai16()
    %sfxquake()
    RTL

events_goto_bosses:
    %cm_submenu("Bosses", #BossesMenu)

events_zebesawake:
    %cm_toggle_bit("Zebes Awake", SRAMMirror_Event, #$0001, #0)

events_maridiatubebroken:
    %cm_toggle_bit("Maridia Tube Broken", SRAMMirror_Event, #$0800, #0)

events_shaktool:
    %cm_toggle_bit("Shaktool Done Digging", SRAMMirror_Event, #$2000, #0)

events_chozoacid:
    %cm_toggle_bit("Chozo Lowered Acid", SRAMMirror_Event+1, #$0010, #0)

events_tourian:
    %cm_toggle_bit("Tourian Open", SRAMMirror_Event, #$0400, #0)

events_metroid1:
    %cm_toggle_bit("1st Metroids Cleared", SRAMMirror_Event+2, #$0001, #0)

events_metroid2:
    %cm_toggle_bit("2nd Metroids Cleared", SRAMMirror_Event+2, #$0002, #0)

events_metroid3:
    %cm_toggle_bit("3rd Metroids Cleared", SRAMMirror_Event+2, #$0004, #0)

events_metroid4:
    %cm_toggle_bit("4th Metroids Cleared", SRAMMirror_Event+2, #$0008, #0)

events_zeb1:
    %cm_toggle_bit("Zebetite Bit 08", SRAMMirror_Event, #$0008, #0)

events_zeb2:
    %cm_toggle_bit("Zebetite Bit 10", SRAMMirror_Event, #$0010, #0)

events_zeb3:
    %cm_toggle_bit("Zebetite Bit 20", SRAMMirror_Event, #$0020, #0)

events_mb1glass:
    %cm_toggle_bit("MB1 Glass Broken", SRAMMirror_Event, #$0004, #0)

events_zebesexploding:
    %cm_toggle_bit("Zebes Set Ablaze", SRAMMirror_Event, #$4000, #0)

events_animals:
    %cm_toggle_bit("Animals Saved", SRAMMirror_Event, #$8000, #0)


; ------------
; Bosses menu
; ------------

BossesMenu:
    dw #boss_ceresridley
    dw #boss_bombtorizo
    dw #boss_spospo
    dw #boss_kraid
    dw #boss_phantoon
    dw #boss_botwoon
    dw #boss_draygon
    dw #boss_crocomire
    dw #boss_gt
    dw #boss_ridley
    dw #boss_mb
    dw #$0000
    %cm_header("BOSSES")

boss_ceresridley:
    %cm_toggle_bit("Ceres Ridley", SRAMMirror_Boss+5, #$0001, #0)

boss_bombtorizo:
    %cm_toggle_bit("Bomb Torizo", SRAMMirror_Boss, #$0004, #0)

boss_spospo:
    %cm_toggle_bit("Spore Spawn", SRAMMirror_Boss, #$0200, #0)

boss_kraid:
    %cm_toggle_bit("Kraid", SRAMMirror_Boss, #$0100, #0)

boss_phantoon:
    %cm_toggle_bit("Phantoon", SRAMMirror_Boss+2, #$0100, #0)

boss_botwoon:
    %cm_toggle_bit("Botwoon", SRAMMirror_Boss+4, #$0002, #0)

boss_draygon:
    %cm_toggle_bit("Draygon", SRAMMirror_Boss+4, #$0001, #0)

boss_crocomire:
    %cm_toggle_bit("Crocomire", SRAMMirror_Boss+2, #$0002, #0)

boss_gt:
    %cm_toggle_bit("Golden Torizo", SRAMMirror_Boss+2, #$0004, #0)

boss_ridley:
    %cm_toggle_bit("Ridley", SRAMMirror_Boss+2, #$0001, #0)

boss_mb:
    %cm_toggle_bit("Mother Brain", SRAMMirror_Boss+4, #$0200, #0)


; ----------
; Game menu
; ----------

GameMenu:
    dw #game_alternatetext
    dw #game_moonwalk
    dw #game_iconcancel
    dw #game_goto_controls
    dw #$FFFF
    dw #game_debugmode
    dw #game_debugbrightness
    dw #game_debugprojectiles
;    dw #game_debugfixscrolloffsets
    dw #$FFFF
    dw #game_clear_minimap
    dw #$0000
    %cm_header("GAME OPTIONS")

game_alternatetext:
    %cm_toggle("Japanese Text", AltText, #$0001, #0)

game_moonwalk:
    %cm_toggle("Moon Walk", Moonwalk, #$0001, #0)

game_iconcancel:
    %cm_toggle("Icon Cancel", IconCancel, #$0001, #0)

game_goto_controls:
    %cm_submenu("Controller Setting Mode", #ControllerSettingMenu)

game_debugmode:
    %cm_toggle("Debug Mode", Debug_Enable, #$0001, #0)

game_debugbrightness:
    %cm_toggle("Debug CPU Brightness", DebugSpareCPUDisplayFlag, #$0001, #0)

game_debugprojectiles:
    %cm_toggle_bit("Enable Projectiles", EnemyProjectile_Enable, #$8000, #0)

game_clear_minimap:
    %cm_jsl("Clear Minimap", .clear_minimap, #$0000)

  .clear_minimap
    LDA #$0000 : STA.w CurrentAreaMapCollectedFlag
    ; map stations
    STA SRAMMirror_MapStations : STA SRAMMirror_MapStations+2
    STA SRAMMirror_MapStations+4 : STA SRAMMirror_MapStations+6

    LDX #$00FE
  .clear_minimap_loop
    STA ExploredMapTiles,X : STA ExploredMapTiles+$100,X
    STA ExploredMapTiles+$200,X : STA ExploredMapTiles+$300,X
    STA ExploredMapTiles+$400,X : STA ExploredMapTiles+$500,X
    STA ExploredMapTiles+$600,X : STA ExploredMapTiles+$700,X
    STA SRAMMirror_MapData,X : STA SRAMMirror_MapData+$100,X
    STA SRAMMirror_MapData+$200,X : STA SRAMMirror_MapData+$300,X
    STA SRAMMirror_MapData+$400,X : STA SRAMMirror_MapData+$500,X
    DEX #2 : BPL .clear_minimap_loop

    %sfxquake()
    RTL


; -------------------
; Controller Settings
; -------------------

ControllerSettingMenu:
    dw #controls_common_layouts
    dw #controls_save_to_file
    dw #$FFFF
    dw #controls_shot
    dw #controls_jump
    dw #controls_dash
    dw #controls_item_select
    dw #controls_item_cancel
    dw #controls_angle_up
    dw #controls_angle_down
    dw #$0000
    %cm_header("CONTROLLER SETTING MODE")

controls_common_layouts:
    %cm_submenu("Common Controller Layouts", #ControllerCommonMenu)

controls_shot:
    %cm_ctrl_input("        SHOT", ShotBinding)

controls_jump:
    %cm_ctrl_input("        JUMP", JumpBinding)

controls_dash:
    %cm_ctrl_input("        DASH", DashBinding)

controls_item_select:
    %cm_ctrl_input(" ITEM SELECT", ItemSelectBinding)

controls_item_cancel:
    %cm_ctrl_input(" ITEM CANCEL", ItemCancelBinding)

controls_angle_up:
    %cm_ctrl_input("    ANGLE UP", AimUpBinding)

controls_angle_down:
    %cm_ctrl_input("  ANGLE DOWN", AimDownBinding)

controls_save_to_file:
    %cm_jsl("Save to File", .routine, #0)
  .routine
    LDA.w GameState : CMP #$0002 : BEQ .fail
    LDA.w SaveSlotSelected : BEQ .fileA
    CMP #$0001 : BEQ .fileB
    CMP #$0002 : BEQ .fileC

  .fail
    %sfxfail()
    RTL

  .fileA
    LDX #$0020 : BRA .save

  .fileB
    LDX #$067C : BRA .save

  .fileC
    LDX #$0CD8

  .save
    LDA.w ShotBinding : STA.l SRAM_Start,X : INX #2
    LDA.w JumpBinding : STA.l SRAM_Start,X : INX #2
    LDA.w DashBinding : STA.l SRAM_Start,X : INX #2
    LDA.w ItemCancelBinding : STA.l SRAM_Start,X : INX #2
    LDA.w ItemSelectBinding : STA.l SRAM_Start,X : INX #2
    LDA.w AimUpBinding : STA.l SRAM_Start,X : INX #2
    LDA.w AimDownBinding : STA.l SRAM_Start,X
    %sfxconfirm()
    RTL

AssignControlsMenu:
    dw controls_assign_A
    dw controls_assign_B
    dw controls_assign_X
    dw controls_assign_Y
    dw controls_assign_Select
    dw controls_assign_L
    dw controls_assign_R
    dw #$0000
    %cm_header("ASSIGN AN INPUT")

controls_assign_A:
    %cm_jsl("A", action_assign_input, !CTRL_A)

controls_assign_B:
    %cm_jsl("B", action_assign_input, !CTRL_B)

controls_assign_X:
    %cm_jsl("X", action_assign_input, !CTRL_X)

controls_assign_Y:
    %cm_jsl("Y", action_assign_input, !CTRL_Y)

controls_assign_Select:
    %cm_jsl("Select", action_assign_input, !CTRL_SELECT)

controls_assign_L:
    %cm_jsl("L", action_assign_input, !CTRL_L)

controls_assign_R:
    %cm_jsl("R", action_assign_input, !CTRL_R)

;AssignAngleControlsMenu:
;    dw #controls_assign_L
;    dw #controls_assign_R
;    dw #$0000
;    %cm_header("ASSIGN AN INPUT")
;    %cm_footer("ONLY L OR R ALLOWED")

action_assign_input:
{
    LDA !ram_cm_ctrl_assign : STA.b DP_TempC2 : TAX  ; input address in $C2 and X
    LDA $7E0000,X : STA !ram_cm_ctrl_swap            ; save old input for later
    TYA : STA $7E0000,X                              ; store new input
    STY.b DP_TempC4                                  ; saved new input for later

    JSL check_duplicate_inputs

    CMP #$FFFF : BEQ +                               ; skip sfx if detection failed
    %sfxconfirm()
+   JML cm_previous_menu
}

check_duplicate_inputs:
{
    ; ram_cm_ctrl_assign = word address of input being assigned
    ; ram_cm_ctrl_swap = previous input bitmask being moved
    ; X / $C2 = word address of new input
    ; Y / $C4 = new input bitmask

    LDA.w #ShotBinding : CMP.b DP_TempC2 : BEQ .check_jump  ; check if we just assigned shot
    LDA.w ShotBinding : BEQ +                               ; check if shot is unassigned
    CMP.b DP_TempC4 : BNE .check_jump                       ; skip to check_jump if not a duplicate assignment
+   JMP .shot                                               ; swap with shot

  .check_jump
    LDA.w #JumpBinding : CMP.b DP_TempC2 : BEQ .check_dash
    LDA.w JumpBinding : BEQ +
    CMP.b DP_TempC4 : BNE .check_dash
+   JMP .jump

  .check_dash
    LDA.w #DashBinding : CMP.b DP_TempC2 : BEQ .check_cancel
    LDA.w DashBinding : BEQ +
    CMP.b DP_TempC4 : BNE .check_cancel
+   JMP .dash

  .check_cancel
    LDA.w #ItemCancelBinding : CMP.b DP_TempC2 : BEQ .check_select
    LDA.w ItemCancelBinding : BEQ +
    CMP.b DP_TempC4 : BNE .check_select
+   JMP .cancel

  .check_select
    LDA.w #ItemSelectBinding : CMP.b DP_TempC2 : BEQ .check_up
    LDA.w ItemSelectBinding : BEQ +
    CMP.b DP_TempC4 : BNE .check_up
+   JMP .select

  .check_up
    LDA.w #AimUpBinding : CMP.b DP_TempC2 : BEQ .check_down
    LDA.w AimUpBinding : BEQ +
    CMP.b DP_TempC4 : BNE .check_down
+   JMP .up

  .check_down
    LDA.w #AimDownBinding : CMP.b DP_TempC2 : BEQ .not_detected
    LDA.w AimDownBinding : BEQ +
    CMP.b DP_TempC4 : BNE .not_detected
+   JMP .down

  .not_detected
    %sfxfail()
    LDA #$FFFF
    JML cm_previous_menu

  .shot
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +  ; check if old input is L or R
    LDA #$0000 : STA.w ShotBinding              ; unassign input
    RTL
+   LDA !ram_cm_ctrl_swap : STA.w ShotBinding   ; input is safe to be assigned
    RTL

  .jump
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +
    LDA #$0000 : STA.w JumpBinding
    RTL
+   LDA !ram_cm_ctrl_swap : STA.w JumpBinding
    RTL

  .dash
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +
    LDA #$0000 : STA.w DashBinding
    RTL
+   LDA !ram_cm_ctrl_swap : STA.w DashBinding
    RTL

  .cancel
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +
    LDA #$0000 : STA.w ItemCancelBinding
    RTL
+   LDA !ram_cm_ctrl_swap : STA.w ItemCancelBinding
    RTL

  .select
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +
    LDA #$0000 : STA.w ItemSelectBinding
    RTL
+   LDA !ram_cm_ctrl_swap : STA.w ItemSelectBinding
    RTL

  .up
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .unbind_up  ; check if input is L or R, unbind if not
    LDA !ram_cm_ctrl_swap : STA.w AimUpBinding           ; safe to assign input
    CMP.w AimDownBinding : BEQ .swap_down                ; check if input matches angle down
    RTL

  .unbind_up
    STA.w AimUpBinding  ; unassign up
    RTL

  .swap_down
    CMP #$0020 : BNE +                 ; check if angle up is assigned to L
    LDA #$0010 : STA.w AimDownBinding  ; assign R to angle down
    RTL
+   LDA #$0020 : STA.w AimDownBinding  ; assign L to angle down
    RTL

  .down
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .unbind_down
    LDA !ram_cm_ctrl_swap : STA.w AimDownBinding
    CMP.w AimUpBinding : BEQ .swap_up
    RTL

  .unbind_down
    STA.w AimDownBinding  ; unassign down
    RTL

  .swap_up
    CMP #$0020 : BNE +
    LDA #$0010 : STA.w AimUpBinding
    RTL
+   LDA #$0020 : STA.w AimUpBinding
    RTL
}

ControllerCommonMenu:
    dw #controls_common_default
    dw #controls_common_d2
    dw #controls_common_d3
    dw #controls_common_d4
    dw #controls_common_d5
    dw #$0000
    %cm_header("COMMON CONTROLLER LAYOUTS")
;    %cm_footer("WIKI.SUPERMETROID.RUN")

controls_common_default:
    %cm_jsl("Default (D1)", #action_set_common_controls, #$0000)

controls_common_d2:
    %cm_jsl("Select+Cancel Swap (D2)", #action_set_common_controls, #$000E)

controls_common_d3:
    %cm_jsl("D2 + Shot+Select Swap (D3)", #action_set_common_controls, #$001C)

controls_common_d4:
    %cm_jsl("MMX Style (D4)", #action_set_common_controls, #$002A)

controls_common_d5:
    %cm_jsl("SMW Style (D5)", #action_set_common_controls, #$0038)

action_set_common_controls:
{
    TYX
    LDA.l ControllerLayoutTable,X : STA.w ShotBinding
    LDA.l ControllerLayoutTable+2,X : STA.w JumpBinding
    LDA.l ControllerLayoutTable+4,X : STA.w DashBinding
    LDA.l ControllerLayoutTable+6,X : STA.w ItemCancelBinding
    LDA.l ControllerLayoutTable+8,X : STA.w ItemSelectBinding
    LDA.l ControllerLayoutTable+10,X : STA.w AimUpBinding
    LDA.l ControllerLayoutTable+12,X : STA.w AimDownBinding
    %sfxconfirm()
    JML cm_previous_menu

ControllerLayoutTable:
    ;  shot     jump     dash     cancel        select        up       down
    dw !CTRL_X, !CTRL_A, !CTRL_B, !CTRL_Y,      !CTRL_SELECT, !CTRL_R, !CTRL_L ; Default (D1)
    dw !CTRL_X, !CTRL_A, !CTRL_B, !CTRL_SELECT, !CTRL_Y,      !CTRL_R, !CTRL_L ; Select+Cancel Swap (D2)
    dw !CTRL_Y, !CTRL_A, !CTRL_B, !CTRL_SELECT, !CTRL_X,      !CTRL_R, !CTRL_L ; D2 + Shot+Select Swap (D3)
    dw !CTRL_Y, !CTRL_B, !CTRL_A, !CTRL_SELECT, !CTRL_X,      !CTRL_R, !CTRL_L ; MMX Style (D4)
    dw !CTRL_X, !CTRL_B, !CTRL_Y, !CTRL_SELECT, !CTRL_A,      !CTRL_R, !CTRL_L ; SMW Style (D5)
}


; ----------
; Sound Test
; ----------

SoundTestMenu:
    dw #soundtest_goto_music
    dw #soundtest_music_toggle
    dw #$FFFF
    dw #soundtest_lib1_sound
    dw #soundtest_lib2_sound
    dw #soundtest_lib3_sound
    dw #soundtest_silence
    dw #$0000
    %cm_header("SOUND TEST MENU")
    %cm_footer("PRESS Y TO PLAY SOUNDS")

soundtest_lib1_sound:
    %cm_numfield_sound("Library One Sound", !ram_soundtest_lib1, 1, 66, 1, .routine)
  .routine
    LDA !ram_cm_controller : BIT !IH_INPUT_LEFTRIGHT : BNE .skip
    LDA !ram_soundtest_lib1 : JML QueueSound_Lib1_Max1
  .skip
    RTL

soundtest_lib2_sound:
    %cm_numfield_sound("Library Two Sound", !ram_soundtest_lib2, 1, 127, 1, .routine)
  .routine
    LDA !ram_cm_controller : BIT !IH_INPUT_LEFTRIGHT : BNE .skip
    LDA !ram_soundtest_lib2 : JML QueueSound_Lib2_Max1
  .skip
    RTL

soundtest_lib3_sound:
    %cm_numfield_sound("Library Three Sound", !ram_soundtest_lib3, 1, 47, 1, .routine)
  .routine
    LDA !ram_cm_controller : BIT !IH_INPUT_LEFTRIGHT : BNE .skip
    LDA !ram_soundtest_lib3 : JML QueueSound_Lib3_Max1
  .skip
    RTL

soundtest_silence:
    %cm_jsl("Silence Sound FX", .routine, #0)
  .routine
    JML stop_all_sounds

soundtest_goto_music:
    %cm_submenu("Music Selection", #MusicSelectMenu1)

MusicSelectMenu1:
    dw #soundtest_music_title1
    dw #soundtest_music_title2
    dw #soundtest_music_intro
    dw #soundtest_music_ceres
    dw #soundtest_music_escape
    dw #soundtest_music_rainstorm
    dw #soundtest_music_spacepirate
    dw #soundtest_music_samustheme
    dw #soundtest_music_greenbrinstar
    dw #soundtest_music_redbrinstar
    dw #soundtest_music_uppernorfair
    dw #soundtest_music_lowernorfair
    dw #soundtest_music_easternmaridia
    dw #soundtest_music_westernmaridia
    dw #soundtest_music_wreckedshipoff
    dw #soundtest_music_wreckedshipon
    dw #soundtest_music_hallway
    dw #soundtest_music_goldenstatue
    dw #soundtest_music_tourian
    dw #soundtest_music_goto_2
    dw #$0000
    %cm_header("PLAY MUSIC - PAGE ONE")

soundtest_music_title1:
    %cm_jsl("Title Theme Part 1", #action_soundtest_playmusic, #$0305)

soundtest_music_title2:
    %cm_jsl("Title Theme Part 2", #action_soundtest_playmusic, #$0306)

soundtest_music_intro:
    %cm_jsl("Intro", #action_soundtest_playmusic, #$3605)

soundtest_music_ceres:
    %cm_jsl("Ceres Station", #action_soundtest_playmusic, #$2D06)

soundtest_music_escape:
    %cm_jsl("Escape Sequence", #action_soundtest_playmusic, #$2407)

soundtest_music_rainstorm:
    %cm_jsl("Zebes Rainstorm", #action_soundtest_playmusic, #$0605)

soundtest_music_spacepirate:
    %cm_jsl("Space Pirate Theme", #action_soundtest_playmusic, #$0905)

soundtest_music_samustheme:
    %cm_jsl("Samus Theme", #action_soundtest_playmusic, #$0C05)

soundtest_music_greenbrinstar:
    %cm_jsl("Green Brinstar", #action_soundtest_playmusic, #$0F05)

soundtest_music_redbrinstar:
    %cm_jsl("Red Brinstar", #action_soundtest_playmusic, #$1205)

soundtest_music_uppernorfair:
    %cm_jsl("Upper Norfair", #action_soundtest_playmusic, #$1505)

soundtest_music_lowernorfair:
    %cm_jsl("Lower Norfair", #action_soundtest_playmusic, #$1805)

soundtest_music_easternmaridia:
    %cm_jsl("Eastern Maridia", #action_soundtest_playmusic, #$1B05)

soundtest_music_westernmaridia:
    %cm_jsl("Western Maridia", #action_soundtest_playmusic, #$1B06)

soundtest_music_wreckedshipoff:
    %cm_jsl("Wrecked Ship Unpowered", #action_soundtest_playmusic, #$3005)

soundtest_music_wreckedshipon:
    %cm_jsl("Wrecked Ship", #action_soundtest_playmusic, #$3006)

soundtest_music_hallway:
    %cm_jsl("Hallway to Statue", #action_soundtest_playmusic, #$0004)

soundtest_music_goldenstatue:
    %cm_jsl("Golden Statue", #action_soundtest_playmusic, #$0906)

soundtest_music_tourian:
    %cm_jsl("Tourian", #action_soundtest_playmusic, #$1E05)

soundtest_music_goto_2:
    %cm_jsl("GOTO PAGE TWO", .routine, #MusicSelectMenu2)
  .routine
    JSL cm_go_back
    ; set bank for manual submenu jump
    PHK : PHK : PLA : STA !ram_cm_menu_bank
    JML action_submenu

MusicSelectMenu2:
    dw #soundtest_music_preboss1
    dw #soundtest_music_preboss2
    dw #soundtest_music_miniboss
    dw #soundtest_music_smallboss
    dw #soundtest_music_bigboss
    dw #soundtest_music_motherbrain
    dw #soundtest_music_credits
    dw #soundtest_music_itemroom
    dw #soundtest_music_itemfanfare
    dw #soundtest_music_spacecolony
    dw #soundtest_music_zebesexplodes
    dw #soundtest_music_loadsave
    dw #soundtest_music_death
    dw #soundtest_music_lastmetroid
    dw #soundtest_music_galaxypeace
    dw #soundtest_music_goto_1
    dw #$0000
    %cm_header("PLAY MUSIC - PAGE TWO")

soundtest_music_preboss1:
    %cm_jsl("Chozo Statue Awakens", #action_soundtest_playmusic, #$2406)

soundtest_music_preboss2:
    %cm_jsl("Approaching Confrontation", #action_soundtest_playmusic, #$2706)

soundtest_music_miniboss:
    %cm_jsl("Miniboss Fight", #action_soundtest_playmusic, #$2A05)

soundtest_music_smallboss:
    %cm_jsl("Small Boss Confrontation", #action_soundtest_playmusic, #$2705)

soundtest_music_bigboss:
    %cm_jsl("Big Boss Confrontation", #action_soundtest_playmusic, #$2405)

soundtest_music_motherbrain:
    %cm_jsl("Mother Brain Fight", #action_soundtest_playmusic, #$2105)

soundtest_music_credits:
    %cm_jsl("Credits", #action_soundtest_playmusic, #$3C05)

soundtest_music_itemroom:
    %cm_jsl("Item - Elevator Room", #action_soundtest_playmusic, #$0003)

soundtest_music_itemfanfare:
    %cm_jsl("Item Fanfare", #action_soundtest_playmusic, #$0002)

soundtest_music_spacecolony:
    %cm_jsl("Arrival at Space Colony", #action_soundtest_playmusic, #$2D05)

soundtest_music_zebesexplodes:
    %cm_jsl("Zebes Explodes", #action_soundtest_playmusic, #$3305)

soundtest_music_loadsave:
    %cm_jsl("Samus Appears", #action_soundtest_playmusic, #$0001)

soundtest_music_death:
    %cm_jsl("Death", #action_soundtest_playmusic, #$3905)

soundtest_music_lastmetroid:
    %cm_jsl("Last Metroid in Captivity", #action_soundtest_playmusic, #$3F05)

soundtest_music_galaxypeace:
    %cm_jsl("The Galaxy is at Peace", #action_soundtest_playmusic, #$4205)

soundtest_music_goto_1:
    %cm_jsl("GOTO PAGE ONE", .routine, #MusicSelectMenu1)
  .routine
    JSL cm_go_back
    ; set bank for manual submenu jump
    PHK : PHK : PLA : STA !ram_cm_menu_bank
    JML action_submenu

soundtest_music_toggle:
    %cm_toggle("Music", !ram_music_toggle, #$0001, .routine)
  .routine
    ; Clear music queue
    STZ.w APU_MusicQueueTimers : STZ.w APU_MusicQueueTimers+2 : STZ.w APU_MusicQueueTimers+4 : STZ.w APU_MusicQueueTimers+6
    STZ.w APU_MusicQueueTimers+8 : STZ.w APU_MusicQueueTimers+$A : STZ.w APU_MusicQueueTimers+$C : STZ.w APU_MusicQueueTimers+$E
    STZ.w APU_MusicQueueNextIndex : STZ.w APU_MusicQueueStartIndex : STZ.w APU_MusicEntry : STZ.w APU_MusicTimer
    CMP #$0001 : BEQ .resume_music
    STZ $2140
    RTL

  .resume_music
    LDA.w MusicDataIndex : CLC : ADC #$FF00 : STZ.w MusicDataIndex : JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.w MusicTrackIndex : STZ.w MusicTrackIndex : JML QueueMusicDataOrTrack_8FrameDelay

action_soundtest_playmusic:
{
    ; always load silence first
    LDA #$0000 : JSL QueueMusicDataOrTrack_8FrameDelay

    TYA
    %a8() : STA !ram_soundtest_music
    XBA : %a16()
    STA.w RoomMusicDataIndex
    ORA #$FF00 : JSL QueueMusicDataOrTrack_8FrameDelay
    LDA !ram_soundtest_music : JSL QueueMusicDataOrTrack_8FrameDelay
    RTL
}


; ------------------
; Memory Editor Menu
; ------------------

MemoryEditorMenu:
    dw #memory_bank
    dw #memory_address
    dw #$FFFF
    dw #memory_size
    dw #$FFFF
    dw #memory_edit_value
    dw #memory_edit_write
    dw #$0000
    %cm_header("MEMORY EDITOR")
    %cm_footer("NEARBY MEMORY SHOWN HERE")

memory_bank:
    %cm_numfield_hex("Bank Byte", !ram_mem_address_bank, 0, 255, 1, 8, #0)

memory_address:
    %cm_numfield_hex_word("Address", !ram_mem_address, #$FFFF, #0)

memory_size:
    dw !ACTION_CHOICE
    dl #!ram_mem_memory_size
    dw #$0000
    db #$28, "Size", #$FF
    db #$28, "     16-BIT", #$FF
    db #$28, "      8-BIT", #$FF
    db $FF

memory_edit_value:
    %cm_numfield_hex_word("Value to Write", !ram_mem_editor_value, #$FFFF, #0)

memory_edit_write:
    %cm_jsl("Write to Address", .routine, #0)
  .routine
    ; setup indirect addressing
    %a8()
    LDA !ram_mem_address : STA !DP_Address
    LDA !ram_mem_address_bank : STA !DP_Address+2
    ; 8-bit or 16-bit?
    LDA !ram_mem_memory_size : BEQ .write
    %a8()
  .write
    LDA !ram_mem_editor_value : STA [!DP_Address]
    %a16()
    %sfxconfirm()
    RTL

