;Sound Effects: Swamp, Forest, Mine, Brambles, Wasp Hive
;32F559
swamp_forest_mine_brambles_hive_sfx_data:
	dw !dyn_snd_loc, $009F
;If modifying this file, comment out the line above and uncomment the line below
;	dw !dyn_snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !dyn_snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $0015)
;sound effect pointers
.pointers_start:
	dw .seq_2F2C	;60: 
	dw .seq_2F22	;61: 
	dw .seq_2EC0	;62: 
	dw .seq_2EC0	;63: 
	dw .seq_2F49	;64: 
	dw .seq_2F36	;65: 
	dw .seq_2F2C	;66: 
	dw .seq_2F22	;67: 
	dw .seq_2F12	;68: 
	dw .seq_2F11	;69: 
	dw .seq_2F11	;6A: 
	dw .seq_2F02	;6B: 
	dw .seq_2EF3	;6C: 
	dw .seq_2EE3	;6D: 
	dw .seq_2ED2	;6E: 
	dw .seq_2EC1	;6F: 
	dw .seq_2FB8	;70: 
	dw .seq_2FA0	;71: 
	dw .seq_2F8A	;72: 
	dw .seq_2F72	;73: 
	dw .seq_2EC0	;74: 
.pointers_end:

.seq_2EC0:
	db !end_sequence

.seq_2EC1:
	db !set_instrument, $4B
	db !set_vol_single_val, $64
	db !set_adsr, $8E, $EE
	db !pitch_slide_up, $00, $01, $2C, $6F, $08
	db !echo_on
	db $90, $21
	db !end_sequence

.seq_2ED2:
	db !set_instrument, $4B
	db !set_vol_single_val, $64
	db !set_adsr, $8E, $E0
	db !pitch_slide_up, $00, $01, $2C, $6F, $08
	db !echo_on
	db $90, $10
	db !end_sequence

.seq_2EE3:
	db !set_instrument, $94
	db !set_vol_single_val, $62
	db !set_adsr, $F1, $EB
	db !pitch_slide_up, $00, $01, $21, $0B, $00
	db $8E, $78
	db !end_sequence

.seq_2EF3:
	db !set_instrument, $8F
	db !set_vol_single_val, $2C
	db !set_adsr, $EE, $30
	db !vibrato_with_delay, $05, $02, $17, $01
	db $A4, $1E
	db !end_sequence

.seq_2F02:
	db !set_instrument, $8F
	db !set_vol_single_val, $32
	db !set_adsr, $EE, $30
	db !vibrato_with_delay, $04, $02, $15, $01
	db $98, $1E
	db !end_sequence

.seq_2F11:
	db !end_sequence

.seq_2F12:
	db !set_instrument, $A9
	db !set_vol_single_val, $21
	db !set_adsr, $8F, $E1
	db !pitch_slide_down, $00, $01, $2C, $2C, $00
	db $A0, $0F
	db !end_sequence

.seq_2F22:
	db !set_instrument, $94
	db !set_vol_single_val, $7F
	db !set_adsr, $8F, $EE
	db $8E, $50
	db !end_sequence

.seq_2F2C:
	db !set_instrument, $94
	db !set_vol_single_val, $78
	db !set_adsr, $8F, $F2
	db $92, $30
	db !end_sequence

.seq_2F36:
	db !set_instrument, $9D
	db !set_volume_l_and_r, $D3, $32
	db !set_adsr, $81, $E0
	db !vibrato_with_delay, $0B, $0B, $0E, $05
	db !long_duration_on
	db $87, $FF, $FF
	db !long_duration_off
	db !end_sequence

.seq_2F49:
	db !set_instrument, $D3
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $8E, $E0
	db !echo_on
	db !fine_tune, $0A
	db !set_vol_single_val, $3C
	db $8A, $0B
	db !set_vol_single_val, $14
	db $8A, $0B
	db !fine_tune, $E2
	db !set_vol_single_val, $3C
	db $8A, $0B
	db !set_vol_single_val, $14
	db $8A, $0B
	db !fine_tune, $C4
	db !set_vol_single_val, $3C
	db $8A, $0B
	db !set_vol_single_val, $14
	db $8A, $0B
	db !end_sequence

.seq_2F72:
	db $80, $1C
	db !set_instrument, $15
	db !set_adsr, $F5, $B5
	db !vibrato_with_delay, $04, $02, $17, $01
	db !pitch_slide_down, $00, $06, $58, $37, $02
	db !set_volume_l_and_r, $14, $14
	db $9A, $60
	db !end_sequence

.seq_2F8A:
	db !set_instrument, $15
	db !set_adsr, $F5, $B5
	db !vibrato_with_delay, $04, $02, $17, $01
	db !pitch_slide_down, $00, $06, $58, $37, $02
	db !set_volume_l_and_r, $32, $32
	db $9A, $60
	db !end_sequence

.seq_2FA0:
	db $80, $14
	db !set_instrument, $15
	db !set_adsr, $F2, $BC
	db !vibrato_with_delay, $04, $02, $17, $01
	db !pitch_slide_up, $00, $06, $58, $37, $00
	db !set_volume_l_and_r, $1E, $1E
	db $8E, $54
	db !end_sequence

.seq_2FB8:
	db !set_instrument, $15
	db !set_adsr, $F2, $BC
	db !vibrato_with_delay, $04, $02, $17, $01
	db !pitch_slide_up, $00, $06, $58, $37, $00
	db !set_volume_l_and_r, $46, $46
	db $8E, $54
	db !end_sequence

base off
arch 65816
.end: