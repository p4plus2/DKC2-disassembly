hirom
optimize dp always
optimize address mirrors
!version = 1
!override_pirate_panic = 0
!pirate_panic_replacement = $23


org $008000			;dummy org so functions work
	incsrc macros.asm
	incsrc constants.asm
	incsrc ram.asm
	incsrc sram.asm
	incsrc vram.asm
	incsrc structs.asm
	incsrc mmio.asm
	incsrc audio_constants.asm

org $C00000
check bankcross half
	incsrc "bank_C0.asm"
	warnpc $C07FFC
	padbyte $00
	pad $C07FFC
if !version == 1
	db $19, $3F, $AA, $C3
else
	db $AA, $C3, $3F, $19
endif
org $808000
	incsrc "bank_80.asm"
org $C10000
	check bankcross full
	incsrc "bank_C1-ED.asm"
	padbyte $00
	pad $EE0000
org $EE0000
	incsrc "bank_EE-F2.asm"
	padbyte $00
	pad $F30000
org $F30000
	check bankcross half
	incsrc "bank_F3.asm"
	padbyte $00
	pad $F38000
org $B38000
	incsrc "bank_B3.asm"
	padbyte $00
	pad $B40000
org $F40000
	incsrc "bank_F4.asm"
	padbyte $00
	pad $F48000
org $B48000
	incsrc "bank_B4.asm"
	padbyte $00
	pad $B50000
org $F50000
if !version == 0
	db $32, $02, $93, $12
else
	db $02, $12, $93, $32
endif
	incsrc "bank_F5.asm"
	padbyte $00
	pad $F58000
org $B58000
	incsrc "bank_B5.asm"
	padbyte $00
	pad $B60000
org $F60000
	incsrc "bank_F6.asm"
	padbyte $00
	pad $F68000
org $B68000
	incsrc "bank_B6.asm"
	padbyte $00
	pad $B70000
org $F70000
	check bankcross full
	incsrc "bank_F7.asm"
	padbyte $00
	pad $F80000
org $F80000
	check bankcross half
	incsrc "bank_F8.asm"
	padbyte $00
	pad $F88000
org $B88000
DATA_B88000:
if !version == 0
	db $12, $29, $DE, $B3
else
	db $B3, $DE, $12, $29
endif
	incsrc "bank_B8.asm"
	padbyte $00
	pad $B90000
org $F90000
	check bankcross full
	incsrc "bank_F9.asm"
	warnpc $F9D000
	padbyte $00
	pad $F9D000
org $B9D000
	incsrc "bank_B9.asm"
	padbyte $00
	pad $BA0000
org $FA0000
	incsrc "bank_FA.asm"
	warnpc $FA9000
	padbyte $00
	pad $FA9000
org $BA9000
	incsrc "bank_BA.asm"
	padbyte $00
	pad $BB0000
org $FB0000
	check bankcross half
	incsrc "bank_FB.asm"
	padbyte $00
	pad $FB8000
org $BB8000
	incsrc "bank_BB.asm"
	padbyte $00
	pad $BBFFFC
if !version == 0
	db $00, $AA, $AC, $3C
else
	db $3C, $AC, $AA, $00
endif
org $FC0000
	incsrc "bank_FC.asm"
	padbyte $00
	pad $FC8000
org $BC8000
	incsrc "bank_BC.asm"
	padbyte $00
	pad $BD0000
org $FD0000
	check bankcross full
	incsrc "bank_FD.asm"
	padbyte $00
	pad $FE0000
org $FE0000
	incsrc "bank_FE.asm"
	warnpc $FEB800
	padbyte $00
	pad $FEB800
org $BEB800
	incsrc "bank_BE.asm"
	padbyte $00
	pad $BF0000
org $FF0000
	incsrc "bank_FF.asm"
	padbyte $00
	pad $FFFFFF
org $FFFFFF
	db $00
