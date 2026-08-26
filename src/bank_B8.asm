
; Bank $B8 is empty
; RecordDemoInputFrame in bank $91 stores demo input recordings here
; Presumably, their dev carts had SRAM at this address

org $B88000


; see labels.asm for DemoRecorder:


Freespace_BankB8_8000:
; $8000 bytes


if !DEV_TOOLS
table normal.tbl
incsrc dev_tools.asm
incsrc dev_tools_menu.asm
cleartable ; restore default (ASCII)
endif
