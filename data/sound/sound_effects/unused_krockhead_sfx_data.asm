;Sound Effects: Krockheads only (UNUSED)
;32F697
unused_krockhead_sfx_data:
	dw !dyn_snd_loc, $0018
;If modifying this file, comment out the line above and uncomment the line below
;	dw !dyn_snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !dyn_snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $0003)
;sound effect pointers
.pointers_start:
	dw .seq_2EAE	;60: 
	dw .seq_2E9D	;61: 
	dw .seq_2E9C	;62: 
.pointers_end:

.seq_2E9C:
	db !end_sequence

.seq_2E9D:
	db !set_instrument, $4B
	db !set_vol_single_val, $64
	db !set_adsr, $8E, $EE
	db !pitch_slide_up, $00, $01, $2C, $6F, $08
	db !echo_on
	db $90, $21
	db !end_sequence

.seq_2EAE:
	db !set_instrument, $4B
	db !set_vol_single_val, $64
	db !set_adsr, $8E, $E0
	db !pitch_slide_up, $00, $01, $2C, $6F, $08
	db !echo_on
	db $90, $10
	db !end_sequence

base off
arch 65816
.end: