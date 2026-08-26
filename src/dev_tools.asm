
; Developer tools not part of the original disassembly
; Useful for testing and debugging non-vanilla branches


GameStateStart:
{
    LDA.b DP_Controller1New : BNE .newInputs
    ; No shortcuts configured, CLC so we won't skip normal gameplay
    CLC : RTL

  .newInputs
    LDA.b DP_Controller1Input : AND !DEBUG_MENU_SHORTCUT : CMP !DEBUG_MENU_SHORTCUT : BNE .returnContinue
    AND.b DP_Controller1New : BNE .openMenu

  .returnContinue
    ; No shortcuts matched, CLC so we won't skip normal gameplay
    CLC : RTL

  .openMenu
    ; Set IRQ vector
    PEI.b (DP_IRQCmd)
    LDA #$0004 : STA.b DP_IRQCmd
    PEI.b (DP_Brightness)

    ; skip accidental pause from default Start+Select shortcut
    LDA.w GameState : CMP #$000C : BNE .cmStart
    LDA #$0008 : STA.w GameState
    ; clear screen fade delay/counter
    STZ.w ScreenFadeDelay : STZ.w ScreenFadeCounter
    ; Brightness = $F (max)
    LDA.b DP_Brightness : AND #$FF0F : ORA #$000F : STA.b DP_Brightness

  .cmStart
    ; Enter MainMenu
    JSL cm_start

    ; Restore IRQ vector and forced blanking
    PLA : STA.b DP_Brightness
    PLA : STA.b DP_IRQCmd

    ; SEC to skip normal gameplay for one frame after handling the menu
    SEC : RTL
}

cm_start:
{
    PHP
    PHB : PHK : PLB

    ; Ensure sound is enabled when menu is open
    LDA.w DisableSounds : PHA
    STZ.w DisableSounds
    LDA.w PowerBombExplosionStatus : PHA
    STZ.w PowerBombExplosionStatus
    JSL Cancel_Sound_Effects

    JSR cm_init
    JSL cm_draw
    JSL play_music_long ; Play 2 lag frames of music and sound effects

    JSR cm_loop

    ; Restore sounds variables
    PLA : STA.w PowerBombExplosionStatus
    PLA : STA.w DisableSounds
    ; Makes the game checks Samus' health again, to see if we need annoying sound
    STZ.w CriticalEnergyWarning

    JSR cm_exit

    PLB : PLP
    RTL
}

cm_init:
{
    ; Setup registers
    %a8()
    STZ $420C
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$A1 : STA $4200 ; enable NMI, v-IRQ, and auto-joy read
    LDA #$09 : STA $2105 ; BG Mode 1, enable BG3 priority
    LDA #$0F : STA $0F2100 ; disable forced blanking
    %a16()

    JSL initialize_ppu_long
    JSL cm_transfer_custom_tileset
    JSL cm_transfer_custom_cgram
    JSL cm_clear_tilemap

    ; Set up menu state
    LDA #$0000 : STA !ram_cm_leave
    STA !ram_cm_stack_index : STA !ram_cm_cursor_stack
    STA !ram_cm_horizontal_cursor : STA !ram_cm_ctrl_mode
    STA.b DP_Controller1New : STA.b DP_Controller1Input

    LDA.b NMI_8bitFrameCounter : STA !ram_cm_input_counter
    LDA.w #MainMenu : STA !ram_cm_menu_stack
    LDA.w #MainMenu>>16 : STA !ram_cm_menu_bank

    LDA !ram_cm_init : BNE +
    JSR cm_first_menu_open

+   JSL cm_calculate_max

    RTS
}

cm_first_menu_open:
{
; Init non-zero values that can be retained after menu is closed
    LDA #$0001
    STA !ram_soundtest_lib1 : STA !ram_soundtest_lib2
    STA !ram_soundtest_lib3 : STA !ram_music_toggle
    STA !ram_cm_init

    LDA.w #Energy>>16 : STA !ram_mem_address_bank
    LDA.w #Energy : STA !ram_mem_address

    RTS
}

cm_exit:
{
    JSL wait_for_lag_frame_long
    JSL cm_transfer_original_tileset
    JSR cm_transfer_original_cgram

    ; Update HUD (in case we added missiles etc.)
    JSL InitialiseHUD_GameLoading
    JSL HandleHUDTilemap_PausedAndRunning

    JSL restore_ppu_long ; Restore PPU

    ; skip sound effects if not gameplay ($7-13 allowed)
    %ai16()
    LDA.w GameState : CMP #$0006 : BMI .skipSFX
    CMP #$0014 : BPL .skipSFX
    JSL Queue_Samus_Movement_SoundEffects

  .skipSFX
    JSL play_music_long ; Play 2 lag frames of music and sound effects
    JSL maybe_trigger_pause_long ; Maybe trigger pause screen or return save confirmation selection
    RTS
}


; ----------
; Drawing
; ----------

cm_transfer_custom_tileset:
{
    PHP : %i16() : %a8()
    LDX.w RoomPointer : CPX.w #RoomHeader_Kraid : BEQ .kraid_vram

    ; Load custom vram to normal location
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$04 : STA $210C ; BG3 starts at $4000 (8000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX #cm_hud_table : STX $4302 ; Source offset
    LDA.b #cm_hud_table>>16 : STA $4304 ; Source bank
    LDX.w #cm_hud_table_end-cm_hud_table : STX $4305 ; Size
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; enable forced blanking
    PLP
    RTL

  .kraid_vram
    ; Load custom vram to kraid location
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$02 : STA $210C ; BG3 starts at $2000 (4000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$2000 : STX $2116 ; VRAM address (4000 in vram)
    LDX #cm_hud_table : STX $4302 ; Source offset
    LDA.b #cm_hud_table>>16 : STA $4304 ; Source bank
    LDX.w #cm_hud_table_end-cm_hud_table : STX $4305 ; Size
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTL
}

cm_transfer_original_tileset:
{
    PHP : %i16() : %a8()
    LDX.w RoomPointer : CPX.w #RoomHeader_Kraid : BEQ .kraid_vram

    ; Load in normal vram to normal location
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$04 : STA $210C ; BG3 starts at $4000 (8000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX.w #Tiles_Standard_BG3 : STX $4302 ; Source offset
    LDA.b #Tiles_Standard_BG3>>16 : STA $4304 ; Source bank
    LDX #Tiles_Standard_BG3_end-Tiles_Standard_BG3 : STX $4305 ; Size
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTL

  .kraid_vram
    ; Load in normal vram to kraid location
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$02 : STA $210C ; BG3 starts at $2000 (4000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$2000 : STX $2116 ; VRAM address (4000 in vram)
    LDX.w #Tiles_Standard_BG3 : STX $4302 ; Source offset
    LDA.b #Tiles_Standard_BG3>>16 : STA $4304 ; Source bank
    LDX #Tiles_Standard_BG3_end-Tiles_Standard_BG3 : STX $4305 ; Size
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTL
}

cm_transfer_custom_cgram:
{
; $0A = Border & OFF   $7277
; $12 = Header         $48F3
; $1A = Num            $0000, $7FFF
; $32 = ON / Sel Num   $4376
; $34 = Selected item  $761F
; $3A = Sel Num        $0000, $761F
    %a16()
    ; backup gameplay palettes
    LDA.l Palettes+$0A : STA !ram_cgram_cache
    LDA.l Palettes+$0E : STA !ram_cgram_cache+$02
    LDA.l Palettes_BG3P2MinimapExplored : STA !ram_cgram_cache+$04
    LDA.l Palettes_BG3P2MinimapExploredFeature : STA !ram_cgram_cache+$06
    LDA.l Palettes+$16 : STA !ram_cgram_cache+$08
    LDA.l Palettes_BG3P3MinimapUnexplored : STA !ram_cgram_cache+$0A
    LDA.l Palettes_BG3P3MinimapUnexploredFeature : STA !ram_cgram_cache+$0C
    LDA.l Palettes+$1E : STA !ram_cgram_cache+$0E
    LDA.l Palettes_BG3P6FXPrimary : STA !ram_cgram_cache+$10
    LDA.l Palettes_BG3P6FXSecondary : STA !ram_cgram_cache+$12
    LDA.l Palettes_BG3P6FXBackground : STA !ram_cgram_cache+$14
    LDA.l Palettes_BG3P7MinimapRoomHighlight : STA !ram_cgram_cache+$16
    LDA.l Palettes+$3C : STA !ram_cgram_cache+$18
    LDA.l Palettes+$3E : STA !ram_cgram_cache+$1A

    ; apply menu palettes
    LDA #$0000 : STA.l Palettes
    STA.l Palettes+$16 : STA.l Palettes+$0E : STA.l Palettes+$1E ; background
    LDA #$7277 : STA.l Palettes+$0A ; border
    LDA #$48F3 : STA.l Palettes_BG3P2MinimapExplored ; header outline
    LDA #$7FFF : STA.l Palettes_BG3P2MinimapExploredFeature ; text
    LDA #$0000 : STA.l Palettes_BG3P3MinimapUnexplored ; number outline
    LDA #$7FFF : STA.l Palettes_BG3P3MinimapUnexploredFeature ; number fill
    LDA #$4376 : STA.l Palettes_BG3P6FXPrimary ; toggle on
    LDA #$761F : STA.l Palettes_BG3P6FXSecondary ; selected text
    LDA #$0000 : STA.l Palettes_BG3P6FXBackground : STA.l Palettes+$3E ; selected text background
    LDA #$0000 : STA.l Palettes_BG3P7MinimapRoomHighlight ; selected number outline
    LDA #$761F : STA.l Palettes+$3C ; selected number fill

    JSL transfer_cgram_long
    %ai16()
    RTL
}

cm_transfer_original_cgram:
{
    PHP : %a16()
    ; restore gameplay palettes
    LDA !ram_cgram_cache : STA Palettes+$0A
    LDA !ram_cgram_cache+$02 : STA Palettes+$0E
    LDA !ram_cgram_cache+$04 : STA Palettes_BG3P2MinimapExplored
    LDA !ram_cgram_cache+$06 : STA Palettes_BG3P2MinimapExploredFeature
    LDA !ram_cgram_cache+$08 : STA Palettes+$16
    LDA !ram_cgram_cache+$0A : STA Palettes_BG3P3MinimapUnexplored
    LDA !ram_cgram_cache+$0C : STA Palettes_BG3P3MinimapUnexploredFeature
    LDA !ram_cgram_cache+$0E : STA Palettes+$1E
    LDA !ram_cgram_cache+$10 : STA Palettes_BG3P6FXPrimary
    LDA !ram_cgram_cache+$12 : STA Palettes_BG3P6FXSecondary
    LDA !ram_cgram_cache+$14 : STA Palettes_BG3P6FXBackground
    LDA !ram_cgram_cache+$16 : STA Palettes_BG3P7MinimapRoomHighlight
    LDA !ram_cgram_cache+$18 : STA Palettes+$3C
    LDA !ram_cgram_cache+$1A : STA Palettes+$3E

    JSL transfer_cgram_long
    PLP
    RTS
}

cm_draw:
{
    PHP
    %ai16()
    JSL cm_tilemap_bg
    JSR cm_tilemap_menu
    JSR cm_memory_editor
    JSR cm_tilemap_transfer
    PLP
    RTL
}

cm_clear_tilemap:
{
    RTL
}

cm_tilemap_bg:
{
    ; top left corner  = $042
    ; top right corner = $07C
    ; bot left corner  = $682
    ; bot right corner = $6BC
	; Empty out !ram_tilemap_buffer
    LDX #$07FE
    LDA !MENU_BLANK ; change to !MENU_CLEAR for transparent backgrounds
  .clearBG3
    STA !ram_tilemap_buffer,X
    DEX #2 : BPL .clearBG3

    ; Vertical edges
    LDX #$0000
    LDY #$0019 ; 25 rows
  .loopVertical
    LDA #$647A : STA !ram_tilemap_buffer+$082,X
    LDA #$247A : STA !ram_tilemap_buffer+$0BC,X
    TXA : CLC : ADC #$0040 : TAX
    DEY : BPL .loopVertical

    ; Horizontal edges
    LDX #$0000
    LDY #$001B ; 28 columns
  .loopHorizontal
    LDA #$A47B : STA !ram_tilemap_buffer+$044,X
    LDA #$247B : STA !ram_tilemap_buffer+$704,X
    INX #2
    DEY : BPL .loopHorizontal

    ; Interior
    LDX #$0000
    LDY #$001B
    LDA !MENU_BLANK

  .interior_loop
;    STA !ram_tilemap_buffer+$004,X
    STA !ram_tilemap_buffer+$084,X
    STA !ram_tilemap_buffer+$0C4,X
    STA !ram_tilemap_buffer+$104,X
    STA !ram_tilemap_buffer+$144,X
    STA !ram_tilemap_buffer+$184,X
    STA !ram_tilemap_buffer+$1C4,X
    STA !ram_tilemap_buffer+$204,X
    STA !ram_tilemap_buffer+$244,X
    STA !ram_tilemap_buffer+$284,X
    STA !ram_tilemap_buffer+$2C4,X
    STA !ram_tilemap_buffer+$304,X
    STA !ram_tilemap_buffer+$344,X
    STA !ram_tilemap_buffer+$384,X
    STA !ram_tilemap_buffer+$3C4,X
    STA !ram_tilemap_buffer+$404,X
    STA !ram_tilemap_buffer+$444,X
    STA !ram_tilemap_buffer+$484,X
    STA !ram_tilemap_buffer+$4C4,X
    STA !ram_tilemap_buffer+$504,X
    STA !ram_tilemap_buffer+$544,X
    STA !ram_tilemap_buffer+$584,X
    STA !ram_tilemap_buffer+$5C4,X
    STA !ram_tilemap_buffer+$604,X
    STA !ram_tilemap_buffer+$644,X
    STA !ram_tilemap_buffer+$684,X
    STA !ram_tilemap_buffer+$6C4,X

    INX #2
    DEY : BPL .interior_loop

  .done
    RTL
}

cm_tilemap_menu:
{
    LDA !ram_cm_stack_index : TAX
    LDA !ram_cm_menu_stack,X : STA !DP_MenuIndices
    LDA !ram_cm_menu_bank : STA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2

    LDY #$0000 ; Y = menu item index
  .loop
    ; highlight if selected row
    TYA : CMP !ram_cm_cursor_stack,X : BEQ .selected
    LDA #$0000
    BRA .continue

  .selected
    LDA #$0010

  .continue
    ; later ORA'd with tile attributes
    STA !DP_Palette

    ; check for special entries (header/blank lines)
    LDA [!DP_MenuIndices],Y : BEQ .header
    CMP #$FFFF : BEQ .blank
    STA !DP_CurrentMenu

    PHY : PHX

    ; X = action index (action type)
    LDA [!DP_CurrentMenu] : TAX

    ; !DP_CurrentMenu points to data after the action type index
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; draw menu item
    JSR (cm_draw_action_table,X)

    PLX : PLY

  .blank
    ; skip drawing blank lines
    INY #2
    BRA .loop

  .header
    STZ !DP_Palette
    ; menu pointer + index + 2 = header
    TYA : CLC : ADC !DP_MenuIndices : INC #2 : STA !DP_CurrentMenu
    ; draw menu header
    LDX #$00C6
    JSR cm_draw_text

    ; menu pointer + header pointer + 1 = footer
    TYA : CLC : ADC !DP_CurrentMenu : INC : STA !DP_CurrentMenu
    LDA [!DP_CurrentMenu] : CMP #$F007 : BNE .done

    ; INC past #$F007
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : STZ !DP_Palette
    ; Optional footer
    LDX #$0686
    JMP cm_draw_text

  .done
    ; no footer, back up two bytes
    DEC !DP_CurrentMenu : DEC !DP_CurrentMenu
    RTS
}

cm_memory_editor:
; Draws the memory values identified by the last digit of the 24-bit address
{
    LDA !ram_mem_editor_active : BNE +
    RTS

    ; draw the address bank
+   LDA !ram_mem_address_bank : STA !DP_DrawValue
    LDX #$03CE : JSL cm_draw2_hex

    ; draw the address word
    %a16()
    LDA !ram_mem_address : STA !DP_DrawValue
    LDX #$03D2 : JSL cm_draw4_hex

    ; assemble indirect address
    LDA !ram_mem_address_bank : STA !DP_Address+2
    LDA !ram_mem_address : STA !DP_Address
    LDA [!DP_Address] : STA !DP_DrawValue

    ; 16-bit or 8-bit
    LDA !ram_mem_memory_size : BNE .eight_bit

    ; draw the 16-bit hex value at address
    LDX #$03AA : JSL cm_draw4_hex
    LDX #$03E8 : JSL cm_draw5
    BRA .labels

  .eight_bit
    ; draw the 8-bit hex value at address
    %a8()
    LDX #$03AA : JSL cm_draw2_hex
    LDX #$03E8 : JSL cm_draw3

  .labels
    ; bunch of $ symbols
    LDA #'$'|$2800
    STA !ram_tilemap_buffer+$174 ; $Bank
    STA !ram_tilemap_buffer+$1B0 ; $Addr
    STA !ram_tilemap_buffer+$2B0 ; $Value
    STA !ram_tilemap_buffer+$3A8 ; $Value
    STA !ram_tilemap_buffer+$3CC ; $Address

    ; labeling for newbies
    LDA #'B'|$2C00
    STA !ram_tilemap_buffer+$38E : STA !ram_tilemap_buffer+$390
    LDA #'I'|$2C00 : STA !ram_tilemap_buffer+$394
    LDA #'L'|$2C00 : STA !ram_tilemap_buffer+$396
    LDA #'O'|$2C00 : STA !ram_tilemap_buffer+$398
    LDA #'H'|$2C00 : STA !ram_tilemap_buffer+$392

    ; HEX and DEC labels
    STA !ram_tilemap_buffer+$3A0 ; H
    LDA #'E'|$2C00
    STA !ram_tilemap_buffer+$3A2 : STA !ram_tilemap_buffer+$3E2
    LDA #'X'|$2C00 : STA !ram_tilemap_buffer+$3A4
    LDA #'D'|$2C00 : STA !ram_tilemap_buffer+$3E0
    LDA #'C'|$2C00 : STA !ram_tilemap_buffer+$3E4

    ; setup to draw $10 bytes of nearby RAM
    LDX #$0508
    LDA !DP_Address : STA !DP_Temp
    %a8()
    LDA #$00 : STA !ram_mem_line_position : STA !ram_mem_loop_counter
    LDA !DP_Address : AND #$F0 : STA !DP_Address

  .drawNearbyMem
    ; draw a byte
    LDA [!DP_Address] : STA !DP_DrawValue
    JSL cm_draw2_hex

    %a16()
    LDA !DP_Address : CMP !DP_Temp : BNE +
    ; highlight selected byte
    LDA !ram_tilemap_buffer,X : ORA #$1000 : STA !ram_tilemap_buffer,X
    LDA !ram_tilemap_buffer+2,X : ORA #$1000 : STA !ram_tilemap_buffer+2,X

    ; inc address and tilemap position
+   %a8()
    INC !DP_Address
    INX #6
    LDA !ram_mem_line_position : INC
    STA !ram_mem_line_position : AND #$08 : BEQ +

    ; start a new line
    LDA #$00 : STA !ram_mem_line_position
    %a16()
    ; skip a row and wrap to the beginning
    TXA : CLC : ADC #$0050 : TAX
    CPX #$05BA : BPL .doneNearbyMem
    %a8()

    ; inc bytes drawn
+   LDA !ram_mem_loop_counter : INC : STA !ram_mem_loop_counter
    CMP #$20 : BNE .drawNearbyMem
    %a16()

  .doneNearbyMem
    RTS
}

cm_tilemap_transfer:
{
    JSL wait_for_lag_frame_long ; Wait for lag frame

    %a16()
    LDA #$5800 : STA $2116 ; VRAM addr
    LDA #$1801 : STA $4310 ; VRAM write
    LDA.w #!ram_tilemap_buffer : STA $4312 ; src addr
    LDA.w #!ram_tilemap_buffer>>16 : STA $4314 ; src bank
    LDA #$0800 : STA $4315 ; size
    STZ $4317 : STZ $4319 ; clear HDMA registers
    %a8()
    LDA #$80 : STA $2115 ; INC mode
    LDA #$02 : STA $420B ; enable DMA, channel 1
    JSL HandleMusicQueue
    JSL HandleSounds
    %a16()
    RTS
}

cm_tilemap_transfer_long:
{
    JSR cm_tilemap_transfer
    RTL
}

cm_draw_action_table:
{
    dw draw_toggle
    dw draw_toggle_bit
    dw draw_toggle_inverted
    dw draw_toggle_bit_inverted
    dw draw_numfield
    dw draw_numfield_hex
    dw draw_numfield_word
    dw draw_numfield_hex_word
    dw draw_choice
    dw draw_controller_input
    dw draw_jsl
    dw draw_submenu
    dw draw_numfield_sound

draw_toggle:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab the toggle value
    LDA [!DP_CurrentMenu] : AND #$00FF : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : CMP !DP_ToggleValue : BEQ .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_bit:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab bitmask
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : AND !DP_ToggleValue : BNE .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_inverted:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab the toggle value
    LDA [!DP_CurrentMenu] : AND #$00FF : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : CMP !DP_ToggleValue : BNE .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_bit_inverted:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab bitmask
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002C : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : AND !DP_ToggleValue : BEQ .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    LDA #$244D : STA !ram_tilemap_buffer+6,X
    RTS

  .checked
    ; On
    LDA #$384B : STA !ram_tilemap_buffer+4,X
    LDA #$384C : STA !ram_tilemap_buffer+6,X
    RTS
}

draw_numfield:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip bounds and increment values
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu; : INC !DP_CurrentMenu

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002E : TAX

    ; convert value to decimal
    LDA [!DP_Address] : AND #$00FF : JSR cm_hex2dec

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X

    ; Set palette
    %a8()
    LDA #$24 : ORA !DP_Palette : STA !DP_Palette+1
    LDA #$70 : STA !DP_Palette ; number tiles are 70-79

    ; Draw numbers
    %a16()
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit : BEQ .done
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; hundreds
    LDA !DP_FirstDigit : BEQ .done
    CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .done
    RTS
}

draw_numfield_sound:
draw_numfield_hex:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip bounds and increment values
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu; : INC !DP_CurrentMenu

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$0030 : TAX

    ; load the value
    LDA [!DP_Address] : AND #$00FF : STA !DP_DrawValue

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X

    ; Draw numbers
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X

    ; overwrite palette bytes
    %a8()
    LDA #$24 : ORA !DP_Palette
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    %a16()

    RTS
}

draw_numfield_word:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip bounds and increment values
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002C : TAX

    ; convert value to decimal
    LDA [!DP_Address] : JSR cm_hex2dec

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X
                      STA !ram_tilemap_buffer+6,X

    ; Set palette
    %a8()
    LDA #$24 : ORA !DP_Palette : STA !DP_Palette+1
    LDA #$70 : STA !DP_Palette ; number tiles are 70-79

    ; Draw numbers
    %a16()
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+6,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .done
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; hundreds
    LDA !DP_FirstDigit : ORA !DP_Temp : BEQ .done
    LDA !DP_FirstDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; thousands
    LDA !DP_Temp : BEQ .done
    CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .done
    RTS
}

draw_numfield_hex_word:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip bitmask and JSL address
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002C : TAX

    ; load the value
    LDA [!DP_Address] : STA !DP_DrawValue

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X
                      STA !ram_tilemap_buffer+6,X

    ; Draw numbers
    ; (X000)
    LDA !DP_DrawValue : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA !DP_DrawValue : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X

    ; overwrite palette bytes
    %a8()
    LDA #$2C : ORA !DP_Palette
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    STA !ram_tilemap_buffer+5,X : STA !ram_tilemap_buffer+7,X
    %a16()
    RTS
}

draw_choice:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip the JSL target
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text first
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for choice
    TXA : CLC : ADC #$001E : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : TAY

    ; find the correct text that should be drawn (the selected choice)
    ; skipping the first text that we already drew
    INY #2 ; uh, ..

  .loop_choices
    DEY : BEQ .found

  .loop_text
    LDA [!DP_CurrentMenu] : %a16() : INC !DP_CurrentMenu : %a8()
    CMP #$FF : BEQ .loop_choices
    BRA .loop_text

  .found
    %a16()
    JSR cm_draw_text
    RTS
}

draw_controller_input:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    STA !ram_cm_ctrl_assign
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip JSL target + argument
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the input
    TXA : CLC : ADC #$0020 : TAX

    ; check if anything to draw
    LDA (!DP_Address) : AND #$E0F0 : BEQ .unbound

    ; determine which input to draw, using Y to refresh A
    BIT !CTRL_A : BEQ + : LDY #$0000 : BRA .draw
+   BIT !CTRL_B : BEQ + : LDY #$0002 : BRA .draw
+   BIT !CTRL_X : BEQ + : LDY #$0004 : BRA .draw
+   BIT !CTRL_Y : BEQ + : LDY #$0006 : BRA .draw
+   BIT !CTRL_L : BEQ + : LDY #$0008 : BRA .draw
+   BIT !CTRL_R : BEQ + : LDY #$000A : BRA .draw
+   BIT !CTRL_SELECT : BEQ .unbound : LDY #$000C

  .draw
    LDA.w CtrlMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    RTS

  .unbound
    LDA !MENU_BLANK : STA !ram_tilemap_buffer,X
    RTS

CtrlMenuGFXTable:
    ;    A      B      X      Y      L      R    Select
    ;  $0080  $8000  $0040  $4000  $0020  $0010  $2000
    dw $288F, $2887, $288E, $2886, $288D, $288C, $2885
}

draw_jsl:
draw_submenu:
{
    ; skip JSL address
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; skip argument
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; draw text normally
    %item_index_to_vram_index()
    JSR cm_draw_text
    RTS
}

cm_draw_text:
; X = pointer to tilemap area (STA !ram_tilemap_buffer,X)
    %a8()
    LDY #$0000
    ; terminator
    LDA [!DP_CurrentMenu],Y : INY : CMP #$FF : BEQ .end
    ; ORA with palette info
    ORA !DP_Palette : STA !DP_Palette

  .loop
    LDA [!DP_CurrentMenu],Y : CMP #$FF : BEQ .end       ; terminator
    STA !ram_tilemap_buffer,X : INX                     ; tile
    LDA !DP_Palette : STA !ram_tilemap_buffer,X : INX   ; palette
    INY : BRA .loop

  .end
    %a16()
    RTS


; ---------
; Logic
; ---------

cm_loop:
{
    %ai16()
    JSL wait_for_lag_frame_long  ; Wait for lag frame
    JSL HandleMusicQueue
    JSL HandleSounds

    LDA !ram_cm_leave : BEQ +
    LDA #$0000 : STA !ram_mem_editor_active
    RTS ; Exit menu loop

+   LDA !ram_cm_ctrl_mode : BEQ +
    JSR cm_edit_digits
    BRA cm_loop

+   JSR cm_get_inputs : STA !ram_cm_controller : BEQ cm_loop

;    BIT #$0040 : BNE .pressedX
    BIT !CTRL_A : BEQ + : JMP .pressedA ; more wiggle room with branch limits...
+   BIT !CTRL_B : BEQ + : JMP .pressedB
+   BIT !CTRL_Y : BNE .pressedY
    BIT !CTRL_SELECT : BNE .pressedSelect
    BIT !IH_INPUT_START : BNE .pressedStart
    BIT !IH_INPUT_UP : BNE .pressedUp
    BIT !IH_INPUT_DOWN : BNE .pressedDown
    BIT !IH_INPUT_RIGHT : BNE .pressedRight
    BIT !IH_INPUT_LEFT : BNE .pressedLeft
    BIT !CTRL_L : BNE .pressedL
    BIT !CTRL_R : BNE .pressedR
    JMP cm_loop

  .pressedB
    JSL cm_previous_menu
    BRA .redraw

  .pressedDown
    LDA #$0002
    JSR cm_move
    BRA .redraw

  .pressedUp
    LDA #$FFFE
    JSR cm_move
    BRA .redraw

  .pressedL
    ; jump to top menu item
    LDA !ram_cm_stack_index : TAX
    LDA #$0000 : STA !ram_cm_cursor_stack,X
    %sfxmove()
    BRA .redraw

  .pressedR
    ; jump to bottom menu item
    LDA !ram_cm_stack_index : TAX
    LDA !ram_cm_cursor_max : DEC #2 : STA !ram_cm_cursor_stack,X
    %sfxmove()
    BRA .redraw

  .pressedA
;  .pressedX
  .pressedY
  .pressedLeft
  .pressedRight
    JSR cm_execute
    BRA .redraw

  .pressedStart
  .pressedSelect
    LDA #$0001 : STA !ram_cm_leave
    JMP cm_loop

  .redraw
    JSL cm_draw
    JMP cm_loop
}

cm_previous_menu:
{
    JSL cm_go_back
    JML cm_calculate_max
}

cm_go_back:
{
    ; disable memory editor
    LDA #$0000 : STA !ram_mem_editor_active

    ; make sure next time we go to a submenu, we start on the first line.
    LDA !ram_cm_stack_index : TAX
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    ; make sure we dont set a negative number
    LDA !ram_cm_stack_index : DEC #2 : BPL .done

    ; leave menu
    LDA #$0001 : STA !ram_cm_leave

    LDA #$0000
  .done
    STA !ram_cm_stack_index
    LDA !ram_cm_stack_index : BNE .end
    ; Reset submenu bank when back at main menu
    LDA.w #MainMenu>>16 : STA !ram_cm_menu_bank

  .end
    %sfxgoback()
    RTL
}

cm_calculate_max:
{
    LDA !ram_cm_stack_index : TAX
    LDA !ram_cm_menu_stack,X : STA !DP_MenuIndices
    LDA !ram_cm_menu_bank : STA !DP_MenuIndices+2

    LDX #$0000
  .loop
    LDA [!DP_MenuIndices] : BEQ .done
    INC !DP_MenuIndices : INC !DP_MenuIndices
    INX #2 ; count menu items in X
    BRA .loop

  .done
    ; store total menu items +2
    TXA : STA !ram_cm_cursor_max
    RTL
}

cm_get_inputs:
{
    ; Make sure we don't read joysticks twice in the same frame
    LDA.b NMI_8bitFrameCounter : CMP !ram_cm_input_counter : PHP : STA !ram_cm_input_counter : PLP : BNE +

    JSL ReadControllerInput

+   LDA.b DP_Controller1New : BEQ .check_holding

    ; Initial delay of $0E frames
    LDA #$000E : STA !ram_cm_input_timer

    ; Return the new input
    LDA.b DP_Controller1New
    RTS

  .check_holding
    ; Check if we're holding the dpad
    LDA.b DP_Controller1Input : AND #$0F00 : BEQ .noinput

    ; Decrement delay timer and check if it's zero
    LDA !ram_cm_input_timer : DEC : STA !ram_cm_input_timer : BNE .noinput

    ; Set new delay to two frames and return the input we're holding
    LDA #$0002 : STA !ram_cm_input_timer
    LDA.b DP_Controller1Input : AND #$4F00 : ORA !IH_INPUT_HELD
    RTS

  .noinput
    LDA #$0000
    RTS
}

cm_move:
{
    STA !DP_Temp
    LDA !ram_cm_stack_index : TAX
    LDA !DP_Temp : CLC : ADC !ram_cm_cursor_stack,X : BPL .positive
    LDA !ram_cm_cursor_max : DEC #2 : BRA .inBounds

  .positive
    CMP !ram_cm_cursor_max : BNE .inBounds
    LDA #$0000

  .inBounds
    STA !ram_cm_cursor_stack,X : TAY

    ; check for blank menu line ($FFFF)
    LDA [!DP_MenuIndices],Y : CMP #$FFFF : BNE .end

    ; repeat move to skip blank line
    LDA !DP_Temp : BRA cm_move

  .end
    %sfxmove()
    RTS
}

action_mainmenu:
{
    ; Set bank of new menu
    LDA !ram_cm_cursor_stack : TAX
    LDA.l MainMenuBanks,X : STA !ram_cm_menu_bank
    STA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2

    ; fallthrough to action_submenu
}

action_submenu:
{
    ; Increment stack pointer by 2, then store current menu from Y
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    TYA : STA !ram_cm_menu_stack,X

    LDA #$0000 : STA !ram_cm_cursor_stack,X

    %sfxmove()
    JSL cm_calculate_max
    JML cm_draw
}

stop_all_sounds:
{
; If sounds are not enabled, the game won't clear the sounds
    LDA.w DisableSounds : PHA
    STZ.w DisableSounds
    JSL Cancel_Sound_Effects
    PLA : STA.w DisableSounds

    ; Makes the game check Samus' health again, to see if we need annoying sound
    STZ.w CriticalEnergyWarning
    RTL
}


; --------
; Execute
; --------

cm_execute:
{
    LDA !ram_cm_stack_index : TAX
    LDA !ram_cm_menu_stack,X : STA !DP_CurrentMenu
    LDA !ram_cm_menu_bank : STA !DP_CurrentMenu+2
    LDA !ram_cm_cursor_stack,X : TAY
    LDA [!DP_CurrentMenu],Y : STA !DP_CurrentMenu

    ; Increment past the action index
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : TAX

    ; Safety net incase blank line selected
    CPX #$FFFF : BEQ +

    ; Execute action
    JSR (cm_execute_action_table,X)
+   RTS
}

cm_execute_action_table:
    dw execute_toggle
    dw execute_toggle_bit
    dw execute_toggle ; inverted
    dw execute_toggle_bit ; inverted
    dw execute_numfield
    dw execute_numfield_hex
    dw execute_numfield_word
    dw execute_numfield_hex_word
    dw execute_choice
    dw execute_controller_input
    dw execute_jsl
    dw execute_submenu
    dw execute_numfield_sound

execute_toggle:
{
    ; Grab address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; Grab toggle value
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_ToggleValue

    ; Grab JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    %a8()
    LDA [!DP_Address] : CMP !DP_ToggleValue : BEQ .toggleOff
    ; toggle on
    LDA !DP_ToggleValue : STA [!DP_Address]
    BRA .jsl

  .toggleOff
    LDA #$00 : STA [!DP_Address]

  .jsl
    %a16()
    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_toggle_bit:
{
    ; Load the address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; Load which bit(s) to toggle
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; Load JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; Toggle the bit
    LDA [!DP_Address] : EOR !DP_ToggleValue : STA [!DP_Address]

    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

 .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_numfield:
execute_numfield_hex:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab minimum (!DP_Minimum) and maximum (!DP_Maximum) values
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_Minimum
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : INC : STA !DP_Maximum ; INC for convenience

    ; grab normal increment
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_Increment

    ; check if fast scroll button (Y) is held
    LDA.b DP_Controller1Input : AND !CTRL_Y : BEQ .load_jsl_target
    ; 4x scroll speed if held
    LDA !DP_Increment : ASL #2 : STA !DP_Increment

; "hold dpad to fast-scroll" is disabled here
;    ; check for held inputs
;    LDA !ram_cm_controller : BIT !IH_INPUT_HELD : BNE .input_held
;    ; grab normal increment and skip past both
;    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu; : AND #$00FF : STA !DP_Increment
;    BRA .load_jsl_target

;  .input_held
;    ; grab faster increment and skip past both
;    INC !DP_CurrentMenu : LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_Increment

  .load_jsl_target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; determine dpad direction
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right, inc
    LDA [!DP_Address] : CLC : ADC !DP_Increment
    CMP !DP_Maximum : BCS .set_to_min
    %a8() : STA [!DP_Address] : BRA .jsl

  .pressed_left ; dec
    LDA [!DP_Address] : SEC : SBC !DP_Increment : BMI .set_to_max
    CMP !DP_Maximum : BCS .set_to_max
    %a8() : STA [!DP_Address] : BRA .jsl

  .set_to_min
    LDA !DP_Minimum : %a8() : STA [!DP_Address] : BRA .jsl

  .set_to_max
    LDA !DP_Maximum : DEC : %a8() : STA [!DP_Address]

  .jsl
    %a16()
    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    %sfxnumber()
    RTS
}

execute_numfield_word:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_DigitAddress
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_DigitAddress+2

    ; grab minimum (!DP_DigitMinimum) and maximum (!DP_DigitMaximum) values
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_DigitMinimum
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC : STA !DP_DigitMaximum ; INC for convenience

    ; check if maximum requires 3 digits or 4
    CMP #1000 : BPL +
    LDA !ram_cm_horizontal_cursor : CMP #$0003 : BNE +
    LDA #$0002 : STA !ram_cm_horizontal_cursor

    ; grab JSL address
+   LDA [!DP_CurrentMenu] : STA !DP_JSLTarget

    LDA [!DP_DigitAddress] : STA !DP_DigitValue
    LDA #$8001 : STA !ram_cm_ctrl_mode
    %sfxnumber()

    RTS
}

execute_numfield_hex_word:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_DigitAddress
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_DigitAddress+2

    ; grab maximum bitmask
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_DigitMaximum

    ; grab JSL address
    LDA [!DP_CurrentMenu] : STA !DP_JSLTarget

    ; enable single digit numfield editing
    LDA #$FFFF : STA !ram_cm_ctrl_mode
    %sfxnumber()

  .done
    RTS
}

execute_choice:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; we either increment or decrement
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right
    LDA [!DP_Address] : INC : BRA .bounds_check

  .pressed_left
    LDA [!DP_Address] : DEC

  .bounds_check
    TAX         ; X = new value
    LDY #$0000  ; Y will be set to max
    %a8()

  .loop_choices
    LDA [!DP_CurrentMenu] : %a16() : INC !DP_CurrentMenu : %a8() : CMP #$FF : BEQ .loop_done

  .loop_text
    LDA [!DP_CurrentMenu] : %a16() : INC !DP_CurrentMenu : %a8()
    CMP #$FF : BNE .loop_text
    INY : BRA .loop_choices

  .loop_done
    ; Y = maximum + 2
    ; for convenience so we can use BCS. We do one more DEC in `.set_to_max`
    ; below, so we get the actual max.
    DEY

    %a16()
    ; X = new value (might be out of bounds)
    TXA : BMI .set_to_max
    TYA : STA !DP_Maximum
    TXA : CMP !DP_Maximum : BCS .set_to_zero

    BRA .store

  .set_to_zero
    LDA #$0000 : BRA .store

  .set_to_max
    TYA : DEC

  .store
    STA [!DP_Address]

    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_controller_input:
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; store long address as short address for now
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu
    STA !ram_cm_ctrl_assign

    ; !DP_JSLTarget = JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; Use bank of action_submenu
    ; instead of new menu's bank
    LDA.l #action_submenu>>16 : STA !DP_JSLTarget+2

    ; Set return address for indirect JSL
    PHK : PEA .end-1

    ; Y = Argument
    LDA [!DP_CurrentMenu] : TAY

    LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    RTS
}

execute_jsl:
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; !DP_JSLTarget = JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; Y = Argument
    LDA [!DP_CurrentMenu] : TAY

    LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    RTS
}

execute_submenu:
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; !DP_JSLTarget = JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; Set bank of action_submenu
    ; instead of the new menu's bank
    LDA.w #action_submenu>>16 : STA !DP_JSLTarget+2

    ; Set return address for indirect JSL
    PHK : PEA .end-1

    ; Y = Argument
    LDA [!DP_CurrentMenu] : TAY

    LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    RTS
}

execute_numfield_sound:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab minimum (!DP_Minimum) and maximum (!DP_Maximum) values
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_Minimum
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : INC : STA !DP_Maximum ; INC for convenience

    ; grab normal increment
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_Increment

    ; check if fast scroll button is held
    LDA.b DP_Controller1Input : AND !CTRL_Y : BEQ .load_jsl_target
    ; 4x scroll speed if held
    LDA !DP_Increment : ASL #2 : STA !DP_Increment

  .load_jsl_target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; check for Y pressed
    LDA !ram_cm_controller : BIT #$4000 : BNE .jsl

    ; determine dpad direction
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right, inc
    LDA [!DP_Address] : CLC : ADC !DP_Increment
    CMP !DP_Maximum : BCS .set_to_min
    %a8() : STA [!DP_Address] : BRA .jsl

  .pressed_left ; dec
    LDA [!DP_Address] : SEC : SBC !DP_Increment : BMI .set_to_max
    CMP !DP_Minimum : BCC .set_to_max
    %a8() : STA [!DP_Address] : BRA .jsl

  .set_to_min
    LDA !DP_Minimum : STA [!DP_Address] : BRA .end

  .set_to_max
    LDA !DP_Maximum : DEC : STA [!DP_Address] : BRA .end

  .jsl
    %ai16()
    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    RTS
}


; -------
; Numbers
; -------

cm_hex2dec:
{
    ; store 16-bit dividend
    STA $4204

    %a8()
    ; divide by 100
    LDA #$64 : STA $4206

    %a16()
    PEA $0000 : PLA ; wait for math

    ; store result and use remainder as new dividend
    LDA $4214 : STA !DP_Temp
    LDA $4216 : STA $4204

    %a8()
    ; divide by 10
    LDA #$0A : STA $4206

    %a16()
    PEA $0000 : PLA ; wait for math

    ; store result and remainder, divide the rest
    LDA $4214 : STA !DP_SecondDigit ; tens
    LDA $4216 : STA !DP_ThirdDigit ; ones
    LDA !DP_Temp : STA $4204

    %a8()
    ; divide by 10
    LDA #$0A : STA $4206

    %a16()
    PEA $0000 : PLA ; wait for math

    ; store result and remainder
    LDA $4214 : STA !DP_Temp ; thousands
    LDA $4216 : STA !DP_FirstDigit ; hundreds

    RTS
}

cm_reverse_hex2dec:
{
; Reconstructs a 16bit decimal number from individual digit values
    LDA !DP_Temp
    %ai8()
    STA $211B : XBA : STA $211B ; Thousands
    LDY #$0A : STY $211C ; multiply by 10
    %a16()
    LDA $2134 : CLC : ADC !DP_FirstDigit ; add Hundreds
    %a8()
    STA $211B : XBA : STA $211B
    STY $211C ; multiply by 10
    %a16()
    LDA $2134 : CLC : ADC !DP_SecondDigit ; add Tens
    %a8()
    STA $211B : XBA : STA $211B 
    STY $211C ; multiply by 10
    %ai16()
    LDA $2134 : CLC : ADC !DP_ThirdDigit : STA !DP_DigitValue ; add Ones
    RTS
}

cm_draw2_hex:
{
    PHP : %a16()
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    PLP
    RTL
}

cm_draw3:
; Converts a hex number into a three digit decimal number
; expects value to be drawn in !DP_DrawValue
; expects tilemap pointer in X
{
    LDA !DP_DrawValue : STA $4204
    %a8()
    LDA #$0A : STA $4206 ; divide by 10
    PEA $0000 : PLA : PLA ; wait for CPU math
    %a16()
    LDA $4214 : STA !DP_SecondDigit

    ; Ones digit
    LDA $4216 : ASL : TAY
    LDA.w DecMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X

    LDA !DP_SecondDigit : BEQ .blanktens
    STA $4204
    %a8()
    LDA #$0A : STA $4206 ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA !DP_ThirdDigit

    ; Tens digit
    LDA $4216 : ASL : TAY
    LDA.w DecMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X

    ; Hundreds digit
    LDA !DP_ThirdDigit : BEQ .blankhundreds : ASL : TAY
    LDA.w DecMenuGFXTable,Y : STA !ram_tilemap_buffer,X

  .done
    INX #6
    RTL

  .blanktens
    LDA !MENU_BLANK
    STA !ram_tilemap_buffer,X : STA !ram_tilemap_buffer+2,X
    BRA .done

  .blankhundreds
    LDA !MENU_BLANK : STA !ram_tilemap_buffer,X
    BRA .done
}

cm_draw4_hex:
{
    PHP : %a16()
    ; (X000)
    LDA !DP_DrawValue : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA !DP_DrawValue : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X
    PLP
    RTL
}

cm_draw5:
; Converts a hex number into a five digit decimal number
; expects value to be drawn in !DP_DrawValue
; expects tilemap pointer in X
{
    LDA !DP_DrawValue : STA $4204
    %a8()
    LDA #$0A : STA $4206 ; divide by 10
    PEA $0000 : PLA : PLA ; wait for CPU math
    %a16()
    LDA $4214 : STA !DP_SecondDigit

    ; Ones digit
    LDA $4216 : ASL : TAY
    LDA.w DecMenuGFXTable,Y : STA !ram_tilemap_buffer+8,X

    LDA !DP_SecondDigit : BNE +
    BRL .blanktens
+   STA $4204
    %a8()
    LDA #$0A : STA $4206 ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA !DP_ThirdDigit

    ; Tens digit
    LDA $4216 : ASL : TAY
    LDA.w DecMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X

    LDA !DP_ThirdDigit : BNE +
    BRL .blankhundreds
+   STA $4204
    %a8()
    LDA #$0A : STA $4206 ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA !DP_DrawValue

    ; Hundreds digit
    LDA $4216 : ASL : TAY
    LDA.w DecMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X

    LDA !DP_DrawValue : BEQ .blankthousands
    STA $4204
    %a8()
    LDA #$0A : STA $4206 ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA !DP_Temp

    ; Thousands digit
    LDA $4216 : ASL : TAY
    LDA.w DecMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X

    ; Ten thousands digit
    LDA !DP_Temp : BEQ .blanktenthousands
    ASL : TAY
    LDA.w DecMenuGFXTable,Y : STA !ram_tilemap_buffer,X

  .done
    INX #10
    RTL

  .blanktens
    LDA !MENU_BLANK
    STA !ram_tilemap_buffer,X : STA !ram_tilemap_buffer+2,X
    STA !ram_tilemap_buffer+4,X : STA !ram_tilemap_buffer+6,X
    BRA .done

  .blankhundreds
    LDA !MENU_BLANK
    STA !ram_tilemap_buffer,X : STA !ram_tilemap_buffer+2,X : STA !ram_tilemap_buffer+4,X
    BRA .done

  .blankthousands
    LDA !MENU_BLANK
    STA !ram_tilemap_buffer,X : STA !ram_tilemap_buffer+2,X
    BRA .done

  .blanktenthousands
    LDA !MENU_BLANK : STA !ram_tilemap_buffer,X
    BRA .done
}

cm_edit_digits:
{
    ; hex or decimal
    LDA !ram_cm_ctrl_mode : CMP #$8001 : BEQ .decimal_mode

    ; check for A, B, and D-pad
    JSR cm_get_inputs : STA !ram_cm_controller
    AND #$8F80 : BEQ .redraw
    BIT !IH_INPUT_LEFTRIGHT : BNE .selecting
    BIT !IH_INPUT_UPDOWN : BNE .editing
    BIT #$8080 : BEQ .redraw

    ; exit if A or B pressed
    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end
    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1
    ; addr in A
    LDA [!DP_DigitAddress] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    LDA #$0000 : STA !ram_cm_ctrl_mode
    %sfxconfirm()
    JSL cm_draw
    RTS

  .decimal_mode
    JMP cm_edit_decimal_digits

  .selecting
    %sfxmove()
    ; determine which direction was pressed
    LDA !ram_cm_controller : BIT !IH_INPUT_LEFT : BNE .left
    ; inc/dec horizontal cursor index
    LDA !ram_cm_horizontal_cursor : DEC : AND #$0003 : STA !ram_cm_horizontal_cursor
    BRA .redraw
  .left
    LDA !ram_cm_horizontal_cursor : INC : AND #$0003 : STA !ram_cm_horizontal_cursor
  .redraw
    ; redraw numbers so selected digit is highlighted
    LDA !ram_cm_stack_index : TAX
    LDA !ram_cm_cursor_stack,X : TAY
    %item_index_to_vram_index()
    TXA : CLC : ADC #$002C : TAX
    LDA [!DP_DigitAddress]
    JMP cm_draw4_editing ; and return from there

  .editing
    ; use horizontal cursor index to ADC/SBC
    LDA !ram_cm_horizontal_cursor : ASL : TAX
    ; determine which direction was pressed
    LDA.b DP_Controller1Input : BIT !IH_INPUT_UP : BNE +
    TXA : CLC : ADC #$0008 : TAX

    ; subroutine to inc/dec digit
+   LDA [!DP_DigitAddress] : JSR (cm_SingleDigitEdit,X)
    ; returns full value with selected digit cleared
    ; combine with modified digit and cap with bitmask in !DP_DigitMaximum
    ORA !DP_DigitValue : AND !DP_DigitMaximum : STA [!DP_DigitAddress]
    %sfxnumber()

    ; redraw numbers
    LDA !ram_cm_stack_index : TAX
    LDA !ram_cm_cursor_stack,X : TAY
    %item_index_to_vram_index()
    TXA : CLC : ADC #$002C : TAX
    LDA [!DP_DigitAddress]

    ; fallthrough to cm_draw4_editing and return from there
}

cm_draw4_editing:
{
    ; (X000)
    STA !DP_DrawValue : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA !DP_DrawValue : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X

    ; set palette bytes to unselected
    %a8()
    LDA #$2C
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    STA !ram_tilemap_buffer+5,X : STA !ram_tilemap_buffer+7,X

    ; highlight selected digit only
    LDA !ram_cm_horizontal_cursor : BEQ .ones
    DEC : BEQ .tens
    DEC : BEQ .hundreds
    ; thousands $X000
    LDA #$3C : STA !ram_tilemap_buffer+1,X
    BRA .done
  .hundreds ; $0X00
    LDA #$3C : STA !ram_tilemap_buffer+3,X
    BRA .done
  .tens ; $00X0
    LDA #$3C : STA !ram_tilemap_buffer+5,X
    BRA .done
  .ones ; $000X
    LDA #$3C : STA !ram_tilemap_buffer+7,X

  .done
    %a16()
    JSR cm_tilemap_transfer
    RTS
}

cm_SingleDigitEdit:
    dw #cm_SDE_add_ones
    dw #cm_SDE_add_tens
    dw #cm_SDE_add_hundreds
    dw #cm_SDE_add_thousands
    dw #cm_SDE_sub_ones
    dw #cm_SDE_sub_tens
    dw #cm_SDE_sub_hundreds
    dw #cm_SDE_sub_thousands

    %SDE_add(ones, #$0001, #$000F, #$FFF0)
    %SDE_add(tens, #$0010, #$00F0, #$FF0F)
    %SDE_add(hundreds, #$0100, #$0F00, #$F0FF)
    %SDE_add(thousands, #$1000, #$F000, #$0FFF)
    %SDE_sub(ones, #$0001, #$000F, #$FFF0)
    %SDE_sub(tens, #$0010, #$00F0, #$FF0F)
    %SDE_sub(hundreds, #$0100, #$0F00, #$F0FF)
    %SDE_sub(thousands, #$1000, #$F000, #$0FFF)

cm_edit_decimal_digits:
{
    ; check for A, B, and D-pad
    JSR cm_get_inputs : STA !ram_cm_controller
    AND #$8F80 : BEQ .redraw
    BIT !IH_INPUT_LEFTRIGHT : BNE .selecting
    BIT !IH_INPUT_UPDOWN : BNE .editing
    BIT #$8080 : BEQ .redraw

    ; exit if A or B pressed
    BRL .exit

  .selecting
    %sfxmove()
    ; determine which direction was pressed
    LDA !ram_cm_controller : BIT !IH_INPUT_LEFT : BNE .left
    ; inc/dec horizontal cursor index
    LDA !ram_cm_horizontal_cursor : DEC : AND #$0003 : STA !ram_cm_horizontal_cursor
    CMP #$0003 : BNE .redraw
    ; is editing thousands digit allowed?
    LDA !DP_DigitMaximum : CMP #1000 : BPL .redraw
    ; limit cursor to 3 positions (0-2)
    LDA #$0002 : STA !ram_cm_horizontal_cursor
    BRL .draw
  .left
    LDA !ram_cm_horizontal_cursor : INC : AND #$0003 : STA !ram_cm_horizontal_cursor
    CMP #$0003 : BNE .redraw
    ; is editing thousands digit allowed?
    LDA !DP_DigitMaximum : CMP #1000 : BPL .redraw
    ; limit cursor to 3 positions (0-2)
    LDA #$0000 : STA !ram_cm_horizontal_cursor

  .redraw
    BRL .draw

  .editing
    ; convert value to decimal
    LDA !DP_DigitValue : JSR cm_hex2dec

    ; determine which digit to edit
    LDA !ram_cm_horizontal_cursor : BEQ .ones
    DEC : BEQ .tens
    DEC : BEQ .hundreds

    %SDE_dec(thousands, !DP_Temp)
    BRA .dec2hex
  .hundreds
    %SDE_dec(hundreds, !DP_FirstDigit)
    BRA .dec2hex
  .tens
    %SDE_dec(tens, !DP_SecondDigit)
    BRA .dec2hex
  .ones
    %SDE_dec(ones, !DP_ThirdDigit)

  .dec2hex
    %sfxnumber()
    JSR cm_reverse_hex2dec

  .draw
    ; convert value to decimal
    LDA !DP_DigitValue : JSR cm_hex2dec

    ; get tilemap address
    LDA !ram_cm_stack_index : TAX
    LDA !ram_cm_cursor_stack,X : TAY
    %item_index_to_vram_index()
    TXA : CLC : ADC #$002C : TAX

    ; is editing thousands digit allowed?
    ; number tiles are 70-79
    LDA #$2C70
    LDY !DP_DigitMaximum : CPY #1000 : BMI +

    ; start with zero tiles
    STA !ram_tilemap_buffer+0,X
+   STA !ram_tilemap_buffer+2,X
    STA !ram_tilemap_buffer+4,X
    STA !ram_tilemap_buffer+6,X

    ; set palette and default zero tile
    STA !DP_Palette

    ; Draw numbers
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+6,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .highlighting
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; hundreds
    LDA !DP_FirstDigit : ORA !DP_Temp : BEQ .highlighting
    LDA !DP_FirstDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; thousands
    LDA !DP_Temp : BEQ .highlighting
    CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .highlighting
    ; highlight the selected tile
    %a8()
    LDA !ram_cm_horizontal_cursor : BEQ .highlight_ones
    DEC : BEQ .highlight_tens
    DEC : BEQ .highlight_hundreds
    ; thousands $X000
    LDA #$3C : STA !ram_tilemap_buffer+1,X
    BRA .done
  .highlight_hundreds ; $0X00
    LDA #$3C : STA !ram_tilemap_buffer+3,X
    BRA .done
  .highlight_tens ; $00X0
    LDA #$3C : STA !ram_tilemap_buffer+5,X
    BRA .done
  .highlight_ones ; $000X
    LDA #$3C : STA !ram_tilemap_buffer+7,X

  .done
    %a16()
    JSR cm_tilemap_transfer
    RTS

  .exit
    ; check if value is inbounds
    LDA !DP_DigitValue : CMP !DP_DigitMaximum : BMI .check_minimum
    LDA !DP_DigitMaximum : DEC : BRA + ; was max+1 for convenience

  .check_minimum
    CMP !DP_DigitMinimum : BPL +
    LDA !DP_DigitMinimum
+   STA [!DP_DigitAddress]

    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end
    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1
    ; addr in A
    LDA [!DP_DigitAddress]
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    %sfxconfirm()
    LDA #$0000 : STA !ram_cm_ctrl_mode
    JSL cm_draw
    RTS
}

HexMenuGFXTable:
    dw $2C70, $2C71, $2C72, $2C73, $2C74, $2C75, $2C76, $2C77, $2C78, $2C79, $2C50, $2C51, $2C52, $2C53, $2C54, $2C55

DecMenuGFXTable:
    dw $2C20, $2C21, $2C22, $2C23, $2C24, $2C25, $2C26, $2C27, $2C28, $2C29

cm_hud_table:
incbin "../data/dev_tools_gfx.bin" ; 900h bytes
  .end

