
org $DF8000


if !FEATURE_KEEP_UNREFERENCED
;;; $8000:  ;;;
UNUSED_Music_DF8000:
incbin "../data/UNUSED_Music_DF8000.bin" ; $54DE bytes
endif ; !FEATURE_KEEP_UNREFERENCED


Freespace_BankDF_D4DF:                                                   ;DFD4DF;
; $2B21 bytes

macro WRITE_IO_PORT()
    sta   $4201
    bit   $4016   ; Strobe
endmacro

macro ZERO_IO_PORT()
    stz   $4201
    bit   $4016   ; Strobe
endmacro





rumblehan_l:
    sep   #$20

    lda rumble_time
	beq .turnoff_rumble
	dec.B rumble_time
	bra .continue
.turnoff_rumble
	stz.B	rumble_data

.continue
    ; HACK: apparently this is needed to work on hardware?
    lda   #$01
    sta   $4016
    nop
    nop
    stz   $4016
    nop
    nop

    lda	#16-1    ; Read 16 Controller Bits
.readjoy2
    bit   $4016    ; Controller I
    dec   a
    bpl   .readjoy2

    ; Write 01110010 to the Controller Port
    lda   #$40
    %ZERO_IO_PORT()     ; 0
    %WRITE_IO_PORT()    ; 1
    bit   $4016       ; 1 (just strobing works: the IO port already has 1)
    bit   $4016       ; 1
    %ZERO_IO_PORT()     ; 0
    bit   $4016       ; 0
    %WRITE_IO_PORT()    ; 1
    %ZERO_IO_PORT()     ; 0

    ; Now we write the rumble intensity: rrrrllll (right and left motors)
    lda   rumble_data
    lsr   a             ; -7654321, C <- 0
    %WRITE_IO_PORT()    ; bit7

    rol   a             ; 76543210
    %WRITE_IO_PORT()    ; bit6

    asl   a             ; 6543210-
    %WRITE_IO_PORT()    ; bit5

    asl   a             ; 543210--
    %WRITE_IO_PORT()    ; bit4

    asl   a             ; 43210---
    %WRITE_IO_PORT()    ; bit3

    asl   a             ; 3210----
    %WRITE_IO_PORT()    ; bit2

    asl   a             ; 210-----
    %WRITE_IO_PORT()    ; bit1

    asl   a             ; 10------
    %WRITE_IO_PORT()    ; bit0
	rtl