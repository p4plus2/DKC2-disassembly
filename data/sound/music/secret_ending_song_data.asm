;24 K. Rool's Escape
;32E6A1
secret_ending_song_data:
	dw !bgm_loc, $0040
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1314, .seq_133D, .seq_1357, .seq_1370, .seq_1373, .seq_1376, .seq_1379, .seq_137C
	db $A0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.seq_1314:
	db !echo_delay, $0C
	db $80, $10
	db !set_master_volume_indirect, $56
	db !set_echo, $1E, $0A, $0A
	db !set_fir, $70, $01, $01, $01, $01, $01, $01, $01
	db !set_instrument, $A7
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $64, $3C
	db !set_adsr, $8F, $EB
	db !echo_on
.loop_point_1334:
	db $85, $60
	db $8A, $40
	db $86, $50
	db !jump_to_sequence : dw .loop_point_1334

.seq_133D:
	db $80, $10
	db !set_instrument, $A7
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $3C, $64
	db !set_adsr, $8F, $E0
	db $80, $20
	db !echo_on
.loop_point_134E:
	db $85, $50
	db $8A, $40
	db $86, $70
	db !jump_to_sequence : dw .loop_point_134E

.seq_1357:
	db $80, $10
	db !set_instrument, $9D
	db !change_instr_pitch, $00
	db !set_volume_l_and_r, $D0, $28
	db !set_adsr, $81, $E0
	db !vibrato_with_delay, $0B, $0B, $0E, $05
.loop_point_1368:
	db !long_duration_on
	db $86, $FF, $FF
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_1368

.seq_1370:
	db $80, $10
	db !end_sequence

.seq_1373:
	db $80, $10
	db !end_sequence

.seq_1376:
	db $80, $10
	db !end_sequence

.seq_1379:
	db $80, $10
	db !end_sequence

.seq_137C:
	db $80, $10
	db !end_sequence

base off
arch 65816
.end: