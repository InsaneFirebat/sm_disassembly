
; ---------------
; General Purpose
; ---------------

macro a8() ; A = 8-bit
    SEP #$20
endmacro

macro a16() ; A = 16-bit
    REP #$20
endmacro

macro i8() ; X/Y = 8-bit
    SEP #$10
endmacro

macro i16() ; X/Y = 16-bit
    REP #$10
endmacro

macro ai8() ; A + X/Y = 8-bit
    SEP #$30
endmacro

macro ai16() ; A + X/Y = 16-bit
    REP #$30
endmacro


; ----------
; Debug Menu
; ----------

macro item_index_to_vram_index()
; Find screen position from Y (item number)
    TYA : ASL #5
    CLC : ADC #$0146 : TAX
endmacro

macro cm_header(title)
; Used to assign outlined text (in all caps, see header.tbl) to the top of a menu
table header.tbl
    db #$28, "<title>", #$FF
table normal.tbl
endmacro

macro cm_footer(title)
; Used to assign outlined text (in all caps, see header.tbl) to the bottom of a menu
table header.tbl
    dw #$F007 : db #$28, "<title>", #$FF
table normal.tbl
endmacro

macro cm_numfield(title, addr, start, end, increment, heldincrement, jsltarget)
; Allows editing an 8-bit value at the specified address
    dw !ACTION_NUMFIELD
    dl <addr>
    db <start>, <end>, <increment>;, <heldincrement>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_word(title, addr, start, end, jsltarget)
; Allows editing an 16-bit value at the specified address
    dw !ACTION_NUMFIELD_WORD
    dl <addr>
    dw <start>, <end>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_hex(title, addr, start, end, increment, heldincrement, jsltarget)
; Allows editing an 8-bit value displayed in hexadecimal
    dw !ACTION_NUMFIELD_HEX
    dl <addr>
    db <start>, <end>, <increment>;, <heldincrement>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_hex_word(title, addr, bitmask, jsltarget)
; Displays a 16-bit value in hexadecimal
    dw !ACTION_NUMFIELD_HEX_WORD
    dl <addr>
    dw <bitmask>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle(title, addr, value, jsltarget)
; Allows an 8-bit value to be toggled between zero and the specified value
    dw !ACTION_TOGGLE
    dl <addr>
    db <value>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_inverted(title, addr, value, jsltarget)
; The same toggle as above, but with zero considered ON/enabled
    dw !ACTION_TOGGLE_INVERTED
    dl <addr>
    db <value>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_bit(title, addr, mask, jsltarget)
; Allows a individual bits of a 16-bit value to be toggled
    dw !ACTION_TOGGLE_BIT
    dl <addr>
    dw <mask>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_bit_inverted(title, addr, mask, jsltarget)
; The same toggle as above, but with zero considered ON/enabled
    dw !ACTION_TOGGLE_BIT_INVERTED
    dl <addr>
    dw <mask>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_jsl(title, routine, argument)
; Executes code on demand
    dw !ACTION_JSL
    dw <routine>
    dw <argument>
    db #$28, "<title>", #$FF
endmacro

macro cm_mainmenu(title, target)
; Jump to a submenu in any bank
    %cm_jsl("<title>", #action_mainmenu, <target>)
endmacro

macro cm_jsl_submenu(title, routine, argument)
; Not sure if this is still necessary
    dw !ACTION_JSL_SUBMENU
    dw <routine>
    dw <argument>
    db #$28, "<title>", #$FF
endmacro

macro cm_submenu(title, target)
; Jump to a submenu in the same bank
    %cm_jsl_submenu("<title>", #action_submenu, <target>)
endmacro

macro cm_ctrl_input(title, addr)
; Opens a submenu to assign a controller binding
    dw !ACTION_CTRL_INPUT
    dl <addr>
    dw action_submenu
    dw AssignControlsMenu
    db #$28, "<title>", #$FF
endmacro

macro cm_equipment_item(title, addr, bitmask, inverse)
; Allows three-way toggling of items:  ON/OFF/UNOBTAINED
    dw !ACTION_CHOICE
    dl <addr>
    dw #.routine
    db #$28, "<title>", #$FF
    db #$28, " UNOBTAINED", #$FF
    db #$28, "         ON", #$FF
    db #$28, "        OFF", #$FF
    db #$FF
  .routine
    LDA.w #<addr> : STA !DP_Address
    LDA.w #<addr>>>16 : STA !DP_Address+2
    LDA <bitmask> : STA !DP_ToggleValue
    LDA <inverse> : STA !DP_Increment
    JMP equipment_toggle_items
endmacro

macro cm_equipment_beam(name, addr, bitmask, inverse, and)
; Allows three-way toggling of beams:  ON/OFF/UNOBTAINED
    dw !ACTION_CHOICE
    dl <addr>
    dw #.routine
    db #$28, "<name>", #$FF
    db #$28, " UNOBTAINED", #$FF
    db #$28, "         ON", #$FF
    db #$28, "        OFF", #$FF
    db #$FF
  .routine
    LDA.w #<addr> : STA !DP_Address
    LDA.w #<addr>>>16 : STA !DP_Address+2
    LDA <bitmask> : STA !DP_ToggleValue
    LDA <inverse> : STA !DP_Increment
    LDA <and> : STA !DP_Temp
    JMP equipment_toggle_beams
endmacro

macro cm_numfield_sound(title, addr, start, end, increment, jsltarget)
    dw !ACTION_NUMFIELD_SOUND
    dl <addr>
    db <start>, <end>, <increment>
    dw <jsltarget>
    db #$28, "<title>", #$FF
endmacro

macro SDE_add(label, value, mask, inverse)
cm_SDE_add_<label>:
; subroutine to add to a specific hex digit, used in cm_edit_digits
    AND <mask> : CMP <mask> : BEQ .inc2zero
    CLC : ADC <value> : BRA .store
  .inc2zero
    LDA #$0000
  .store
    STA !DP_DigitValue
    ; return original value with edited digit masked away
    LDA [!DP_DigitAddress] : AND <inverse>
    RTS
endmacro

macro SDE_sub(label, value, mask, inverse)
cm_SDE_sub_<label>:
; subroutine to subtract from a specific hex digit, used in cm_edit_digits
    AND <mask> : BEQ .set2max
    SEC : SBC <value> : BRA .store
  .set2max
    LDA <mask>
  .store
    STA !DP_DigitValue
    ; return original value with edited digit masked away
    LDA [!DP_DigitAddress] : AND <inverse>
    RTS
endmacro

macro SDE_dec(label, address)
; increments or decrements an address based on controller input, used in cm_edit_decimal_digits
    LDA.b DP_Controller1Input : BIT !IH_INPUT_UP : BNE .<label>_inc
    ; dec
    LDA <address> : DEC : BPL .store_<label>
    LDA #$0009 : BRA .store_<label>
  .<label>_inc
    LDA <address> : INC
    CMP #$000A : BMI .store_<label>
    LDA #$0000
  .store_<label>
    STA <address>
endmacro


; -------------
; Sound Effects
; -------------

macro sfxmove() ; Move Cursor
    LDA #$0037 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxconfirm() ; Confirm Selection
    LDA #$0028 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxtoggle() ; Toggle
    LDA #$0038 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxnumber() ; Number Selection
    LDA #$002A : JSL QueueSound_Lib1_Max1
endmacro

macro sfxgoback() ; Go Back
    LDA #$0007 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxclick() ; play click sound lib1
    LDA #$0037 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxtype() ; play typing sound lib2
    LDA #$0045 : JSL QueueSound_Lib2_Max1
endmacro

macro sfxpause() ; play pause menu sound lib1
    LDA #$0038 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxstatue() ; play statue break sound lib2
    LDA #$0019 : JSL QueueSound_Lib2_Max1
endmacro

macro sfxbubble() ; play bubble sound lib2
    LDA #$0011 : JSL QueueSound_Lib2_Max1
endmacro

macro sfxquake() ; play earthquake sound lib3
    LDA #$001E : JSL QueueSound_Lib3_Max1
endmacro

macro sfxenergy() ; play energy drop sound lib2
    LDA #$0002 : JSL QueueSound_Lib2_Max1
endmacro

macro sfxgrapple() ; play grapple sound lib1
    LDA #$0005 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxdoor() ; play door close sound lib3
    LDA #$0008 : JSL QueueSound_Lib3_Max1
endmacro

macro sfxship() ; play ship close sound lib3
    LDA #$0015 : JSL QueueSound_Lib3_Max1
endmacro

macro sfxmissile() ; play missile sound lib2
    LDA #$0003 : JSL QueueSound_Lib2_Max1
endmacro

macro sfxdisengage() ; play refill disengage sound lib2
    LDA #$0038 : JSL QueueSound_Lib2_Max1
endmacro

macro sfxbeep() ; play minimap movement beep sound lib1
    LDA #$0036 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxdachora() ; play dachora cry sound lib2
    LDA #$001D : JSL QueueSound_Lib2_Max1
endmacro

macro sfxdamage() ; play damage boost sound lib1
    LDA #$0035 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxshot() ; play credits shot sound lib1
    LDA #$0022 : JSL QueueSound_Lib1_Max1
endmacro

macro sfxsave() ; play save station sound lib1
    LDA #$002E : JSL QueueSound_Lib1_Max1
endmacro

macro sfxfail() ; play grapple end sound lib1
    LDA #$0007 : JSL QueueSound_Lib1_Max1
endmacro
