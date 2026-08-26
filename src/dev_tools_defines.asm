
; --------
; Menu RAM
; --------

!ram_tilemap_buffer = $7E5800

!DP_MenuIndices = $00 ; 0x4
!DP_CurrentMenu = $04 ; 0x4
!DP_Address = $08 ; 0x4
!DP_JSLTarget = $0C ; 0x4
!DP_CtrlInput = $10 ; 0x4
!DP_Palette = $14
!DP_Temp = $16
; v these repeat v
!DP_ToggleValue = $18
!DP_Increment = $1A
!DP_Minimum = $1C
!DP_Maximum = $1E
!DP_DrawValue = $18
!DP_FirstDigit = $1A
!DP_SecondDigit = $1C
!DP_ThirdDigit = $1E
; v single digit editing v
!DP_DigitAddress = $20 ; 0x4
!DP_DigitValue = $24
!DP_DigitMinimum = $26
!DP_DigitMaximum = $28

!DEBUGMENU = $7EFD00 ; Change this to move all menu RAM at once, ~$B0 bytes, initialized to zero

!ram_cm_menu_stack = !DEBUGMENU+$00 ; $10 bytes
!ram_cm_cursor_stack = !DEBUGMENU+$10 ; $10 bytes

!ram_cm_stack_index = !DEBUGMENU+$20
!ram_cm_cursor_max = !DEBUGMENU+$22
!ram_cm_horizontal_cursor = !DEBUGMENU+$24
!ram_cm_menu_bank = !DEBUGMENU+$26
!ram_cm_leave = !DEBUGMENU+$28
!ram_cm_controller = !DEBUGMENU+$2A
!ram_cm_input_counter = !DEBUGMENU+$2C
!ram_cm_input_timer = !DEBUGMENU+$2E
!ram_cm_init = !DEBUGMENU+$30
!ram_cm_ctrl_mode = !DEBUGMENU+$32
!ram_cm_ctrl_assign = !DEBUGMENU+$34
!ram_cm_ctrl_swap = !DEBUGMENU+$36

!ram_mem_editor_active = !DEBUGMENU+$38
!ram_mem_editor_value = !DEBUGMENU+$3A
!ram_mem_address_bank = !DEBUGMENU+$3C
!ram_mem_address = !DEBUGMENU+$3E
!ram_mem_memory_size = !DEBUGMENU+$40
!ram_mem_line_position = !DEBUGMENU+$42
!ram_mem_loop_counter = !DEBUGMENU+$44

!ram_fix_scroll_offsets = !DEBUGMENU+$46

!ram_soundtest_lib1 = !DEBUGMENU+$48
!ram_soundtest_lib2 = !DEBUGMENU+$4A
!ram_soundtest_lib3 = !DEBUGMENU+$4C
!ram_soundtest_music = !DEBUGMENU+$4E
!ram_music_toggle = !DEBUGMENU+$50

!ram_cm_etanks = !DEBUGMENU+$52
!ram_cm_reserve = !DEBUGMENU+$54
!ram_cm_varia = !DEBUGMENU+$56
!ram_cm_gravity = !DEBUGMENU+$58
!ram_cm_morph = !DEBUGMENU+$5A
!ram_cm_bombs = !DEBUGMENU+$5C
!ram_cm_spring = !DEBUGMENU+$5E
!ram_cm_screw = !DEBUGMENU+$60
!ram_cm_hijump = !DEBUGMENU+$62
!ram_cm_space = !DEBUGMENU+$64
!ram_cm_speed = !DEBUGMENU+$66
!ram_cm_charge = !DEBUGMENU+$68
!ram_cm_ice = !DEBUGMENU+$6A
!ram_cm_wave = !DEBUGMENU+$6C
!ram_cm_spazer = !DEBUGMENU+$6E
!ram_cm_plasma = !DEBUGMENU+$70

; free space up to +$7F

!ram_cgram_cache = !DEBUGMENU+$80 ; $30 bytes


; -----------------
; Crash Handler RAM
; -----------------

!CRASHDUMP = $7EFF00

!ram_crash_a = !CRASHDUMP
!ram_crash_x = !CRASHDUMP+$02
!ram_crash_y = !CRASHDUMP+$04
!ram_crash_dbp = !CRASHDUMP+$06
!ram_crash_sp = !CRASHDUMP+$08
!ram_crash_type = !CRASHDUMP+$0A
!ram_crash_draw_value = !CRASHDUMP+$0C
!ram_crash_stack_size = !CRASHDUMP+$0E

; Reserve 48 bytes for stack
!ram_crash_stack = !CRASHDUMP+$10

!ram_crash_page = !CRASHDUMP+$40
!ram_crash_palette = !CRASHDUMP+$42
!ram_crash_bg = !CRASHDUMP+$44
!ram_crash_cursor = !CRASHDUMP+$46
!ram_crash_loop_counter = !CRASHDUMP+$48
!ram_crash_bytes_to_write = !CRASHDUMP+$4A
!ram_crash_stack_line_position = !CRASHDUMP+$4C
!ram_crash_text = !CRASHDUMP+$4E
!ram_crash_text_bank = !CRASHDUMP+$50
!ram_crash_text_palette = !CRASHDUMP+$52
!ram_crash_mem_viewer = !CRASHDUMP+$54
!ram_crash_mem_viewer_bank = !CRASHDUMP+$56
!ram_crash_temp = !CRASHDUMP+$58
!ram_crash_emu = !CRASHDUMP+$5A

!ram_crash_input = !CRASHDUMP+$60
!ram_crash_input_new = !CRASHDUMP+$62
!ram_crash_input_prev = !CRASHDUMP+$64
!ram_crash_input_timer = !CRASHDUMP+$66


; ---------
; Constants
; ---------

!DEBUG_MENU_SHORTCUT = #$3000 ; Start + Select

!MENU_CLEAR = #$000E
!MENU_BLANK = #$281F

!IH_INPUT_HELD = #$0001
!IH_INPUT_START = #$1000
!IH_INPUT_UPDOWN = #$0C00
!IH_INPUT_UP = #$0800
!IH_INPUT_DOWN = #$0400
!IH_INPUT_LEFTRIGHT = #$0300
!IH_INPUT_LEFT = #$0200
!IH_INPUT_RIGHT = #$0100

!CTRL_B = #$8000
!CTRL_Y = #$4000
!CTRL_SELECT = #$2000
!CTRL_A = #$0080
!CTRL_X = #$0040
!CTRL_L = #$0020
!CTRL_R = #$0010

!ACTION_TOGGLE              = #$0000
!ACTION_TOGGLE_BIT          = #$0002
!ACTION_TOGGLE_INVERTED     = #$0004
!ACTION_TOGGLE_BIT_INVERTED = #$0006
!ACTION_NUMFIELD            = #$0008
!ACTION_NUMFIELD_HEX        = #$000A
!ACTION_NUMFIELD_WORD       = #$000C
!ACTION_NUMFIELD_HEX_WORD   = #$000E
!ACTION_CHOICE              = #$0010
!ACTION_CTRL_INPUT          = #$0012
!ACTION_JSL                 = #$0014
!ACTION_JSL_SUBMENU         = #$0016
!ACTION_NUMFIELD_SOUND      = #$0018
