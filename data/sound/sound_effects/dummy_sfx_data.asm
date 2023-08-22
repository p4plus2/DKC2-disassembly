;Sound Effects: NULL, Island Map, Main Theme, Funky, Wrinkly, Fanfare, Game Over, File Select, Cranky, Lost World
;32F107
dummy_sfx_data:
	dw !dyn_snd_loc, $0014
;If modifying this file, comment out the line above and uncomment the line below
;	dw !dyn_snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !dyn_snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $0002)
;sound effect pointers
.pointers_start:
	dw .seq_2E9A	;60: 
	dw .seq_2E9B	;61: 
.pointers_end:

.seq_2E9A:
	db !end_sequence

.seq_2E9B:
	db !set_volume_l_and_r, $3C, $3C
	db !set_adsr, $8F, $E0
	db !set_instrument, $01
	db $99, $10
	db $99, $10
	db !set_instrument, $02
	db $99, $10
	db !set_instrument, $03
	db $99, $10
	db !set_instrument, $04
	db $99, $10
	db $98, $10
	db $98, $10
	db !end_sequence

base off
arch 65816
.end: