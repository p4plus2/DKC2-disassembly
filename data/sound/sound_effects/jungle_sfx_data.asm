;Sound Effects: Jungle
;32F6C6
jungle_sfx_data:
	dw !dyn_snd_loc, $002F
;If modifying this file, comment out the line above and uncomment the line below
;	dw !dyn_snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !dyn_snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $0004)
;sound effect pointers
.pointers_start:
	dw .seq_2ED9	;60: 
	dw .seq_2EC3	;61: 
	dw .seq_2EAF	;62: 
	dw .seq_2E9E	;63: 
.pointers_end:

.seq_2E9E:
	db !set_instrument, $B8
	db !set_vol_single_val, $50
	db !vibrato, $08, $03, $42
	db !set_adsr, $88, $E0
	db !long_duration_on
	db $8E, $FF, $FF
	db !long_duration_off
	db !end_sequence

.seq_2EAF:
	db !set_instrument, $B8
	db !set_vol_single_val, $5A
	db !vibrato, $03, $03, $42
	db !pitch_slide_down, $00, $01, $28, $42, $08
	db !set_adsr, $9E, $CF
	db $9F, $24
	db !end_sequence

.seq_2EC3:
	db !set_instrument, $B8
	db !set_vol_single_val, $5A
	db !vibrato, $03, $03, $42
	db !pitch_slide_up, $00, $01, $21, $3A, $08
	db !set_adsr, $9E, $D1
	db $9A, $08
	db $9A, $20
	db !end_sequence

.seq_2ED9:
	db !set_instrument, $B8
	db !set_vol_single_val, $5A
	db !vibrato, $03, $03, $42
	db !pitch_slide_up, $00, $01, $21, $3A, $08
	db !set_adsr, $9E, $D1
	db $A0, $20
	db !end_sequence

base off
arch 65816
.end: