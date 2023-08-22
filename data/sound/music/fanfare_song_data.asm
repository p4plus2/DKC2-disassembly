;11 Opening Fanfare
;3244D4
fanfare_song_data:
	dw !bgm_loc, $0144
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1325, .seq_1389, .seq_1438, .seq_1458, .seq_1478, .seq_149B, .seq_14E6, .seq_150A
	db $CA, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.subseq_1314:
	db $80, $10
	db !return_from_sub

.subseq_1317:
	db !set_echo, $32, $21, $21
	db !set_fir, $77, $08, $08, $10, $00, $00, $00, $00
	db !return_from_sub

.seq_1325:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_1314
	db $80, $08
	db !play_subsequence : dw .subseq_1317
	db !echo_on
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !change_instr_pitch_rel, $FC
	db !fine_tune, $EF
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $03 : dw .subseq_1356
	db !play_subsequence : dw .subseq_135F
	db $A9, $08
	db $A9, $08
	db !set_volume_l_and_r, $09, $05
	db $A9, $08
	db !set_volume_l_and_r, $05, $03
	db $A9, $08
	db !set_volume_l_and_r, $03, $01
	db $A9, $08
	db !end_sequence

.subseq_1356:
	db !play_subsequence : dw .subseq_135F
	db !set_volume_l_and_r, $09, $05
	db $A9, $08
	db !return_from_sub

.subseq_135F:
	db !set_volume_l_and_r, $0F, $19
	db $A9, $08
	db $A9, $08
	db $A9, $08
	db !set_volume_l_and_r, $09, $05
	db $A9, $18
	db !set_volume_l_and_r, $0F, $19
	db $A9, $08
	db $A9, $08
	db $A9, $08
	db !set_volume_l_and_r, $09, $05
	db $A9, $08
	db !set_volume_l_and_r, $0F, $19
	db $A9, $08
	db $A9, $08
	db $A9, $08
	db $A9, $08
	db $A9, $08
	db !return_from_sub

.seq_1389:
	db !play_subsequence : dw .subseq_1314
	db $80, $08
	db !set_variable_note_1, $A4
	db !loop_subsequence, $01 : dw .subseq_1402
	db !set_variable_note_1, $A7
	db !loop_subsequence, $01 : dw .subseq_1402
	db !set_variable_note_1, $A5
	db !set_variable_note_2, $A7
	db !loop_subsequence, $01 : dw .subseq_13D1
	db !set_variable_note_1, $A9
	db !loop_subsequence, $01 : dw .subseq_13A9
	db !end_sequence

.subseq_13A9:
	db !set_volume_l_and_r, $0F, $14
	db !set_adsr, $8E, $AE
	db $E0, $18
	db !set_volume_l_and_r, $14, $19
	db !set_adsr, $82, $E5
	db $E0, $68
	db !set_volume_l_and_r, $0F, $14
	db !set_adsr, $9E, $B1
	db $E0, $08
	db !set_volume_l_and_r, $07, $05
	db $E0, $08
	db !set_volume_l_and_r, $03, $05
	db $E0, $08
	db !set_volume_l_and_r, $03, $01
	db $E0, $08
	db !return_from_sub

.subseq_13D1:
	db !set_adsr, $9D, $B1
	db !set_volume_l_and_r, $0F, $14
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db !set_volume_l_and_r, $07, $05
	db $E0, $08
	db !set_volume_l_and_r, $03, $05
	db $E0, $08
	db !set_volume_l_and_r, $03, $01
	db $E0, $08
	db !set_volume_l_and_r, $0F, $14
	db $E0, $08
	db $E0, $08
	db !set_adsr, $BB, $A1
	db !vibrato_with_delay, $03, $02, $08, $05
	db $E1, $18
	db $E0, $18
	db $E1, $10
	db !return_from_sub

.subseq_1402:
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F7
	db !change_instr_pitch_rel, $FC
	db !echo_on
	db !set_adsr, $9D, $B1
	db !set_volume_l_and_r, $0F, $14
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db !set_volume_l_and_r, $07, $05
	db $E0, $08
	db !set_volume_l_and_r, $03, $05
	db $E0, $08
	db !set_volume_l_and_r, $03, $01
	db $E0, $08
	db !set_volume_l_and_r, $0F, $14
	db $E0, $08
	db $E0, $08
	db !set_adsr, $BB, $A1
	db !vibrato_with_delay, $03, $02, $08, $05
	db $E0, $40
	db !return_from_sub

.seq_1438:
	db !play_subsequence : dw .subseq_1314
	db $80, $08
	db !set_variable_note_1, $A1
	db !loop_subsequence, $01 : dw .subseq_1402
	db !set_variable_note_1, $A2
	db !loop_subsequence, $01 : dw .subseq_1402
	db !set_variable_note_1, $A2
	db !set_variable_note_2, $A4
	db !loop_subsequence, $01 : dw .subseq_13D1
	db !set_variable_note_1, $A6
	db !loop_subsequence, $01 : dw .subseq_13A9
	db !end_sequence

.seq_1458:
	db !play_subsequence : dw .subseq_1314
	db $80, $08
	db !set_variable_note_1, $9D
	db !loop_subsequence, $01 : dw .subseq_1402
	db !set_variable_note_1, $9F
	db !loop_subsequence, $01 : dw .subseq_1402
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $A0
	db !loop_subsequence, $01 : dw .subseq_13D1
	db !set_variable_note_1, $A2
	db !loop_subsequence, $01 : dw .subseq_13A9
	db !end_sequence

.seq_1478:
	db !play_subsequence : dw .subseq_1314
	db $80, $08
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !change_instr_pitch_rel, $FC
	db !set_vol_single_val, $64
	db !set_adsr, $8C, $E0
	db $85, $80
	db $91, $80
	db $92, $40
	db $88, $40
	db !set_adsr, $8C, $EA
	db !long_duration_on
	db $8A, $02, $00
	db !long_duration_on
	db !end_sequence

.seq_149B:
	db !play_subsequence : dw .subseq_1314
	db $80, $08
	db !set_instrument, $BE
	db !change_instr_pitch, $FC
	db !fine_tune, $1E
	db !change_instr_pitch_rel, $FC
	db !set_volume_l_and_r, $1E, $0A
	db !set_adsr, $8F, $E0
	db !echo_on
	db !loop_subsequence, $08 : dw .subseq_14DD
	db !loop_subsequence, $04 : dw .subseq_14D4
	db !loop_subsequence, $03 : dw .subseq_14CB
	db !loop_subsequence, $01 : dw .subseq_14C0
	db !end_sequence

.subseq_14C0:
	db $A4, $08
	db $A6, $08
	db $A9, $08
	db $AD, $08
	db $AE, $10
	db !return_from_sub

.subseq_14CB:
	db $A9, $08
	db $A4, $08
	db $A6, $08
	db $A2, $08
	db !return_from_sub

.subseq_14D4:
	db $A9, $08
	db $A5, $08
	db $A4, $08
	db $A5, $08
	db !return_from_sub

.subseq_14DD:
	db $A9, $08
	db $A4, $08
	db $A2, $08
	db $A4, $08
	db !return_from_sub

.seq_14E6:
	db !play_subsequence : dw .subseq_1314
	db $80, $08
	db !set_instrument, $BE
	db !change_instr_pitch, $FC
	db !fine_tune, $1E
	db !change_instr_pitch_rel, $FC
	db !echo_on
	db !set_volume_l_and_r, $04, $0B
	db $80, $09
	db !loop_subsequence, $08 : dw .subseq_14DD
	db !loop_subsequence, $04 : dw .subseq_14D4
	db !loop_subsequence, $03 : dw .subseq_14CB
	db !loop_subsequence, $01 : dw .subseq_14C0
	db !end_sequence

.seq_150A:
	db !play_subsequence : dw .subseq_1314
	db !change_instr_pitch, $08
	db !set_instrument, $A0
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $BF, $B1
	db !play_subsequence : dw .subseq_157D
	db !loop_subsequence, $02 : dw .subseq_1553
	db !play_subsequence : dw .subseq_155A
	db $99, $08
	db !set_instrument, $A4
	db !set_vol_single_val, $5A
	db !change_instr_pitch, $00
	db !fine_tune, $AD
	db !change_instr_pitch_rel, $FC
	db !set_adsr, $AE, $AE
	db $8A, $10
	db !change_tempo_rel, $FC
	db $85, $10
	db !change_tempo_rel, $FC
	db $8A, $10
	db !change_tempo_rel, $FC
	db $85, $10
	db !change_tempo_rel, $FC
	db $8A, $10
	db !change_tempo_rel, $FC
	db $85, $10
	db !change_tempo_rel, $FC
	db $8A, $10
	db !change_tempo_rel, $FC
	db $85, $10
	db !change_tempo_rel, $F8
	db $8A, $FF
	db !end_sequence

.subseq_1553:
	db !play_subsequence : dw .subseq_155A
	db !play_subsequence : dw .subseq_157D
	db !return_from_sub

.subseq_155A:
	db !set_vol_single_val, $1E
	db $99, $08
	db $99, $08
	db $99, $18
	db !play_subsequence : dw .subseq_157D
	db !set_vol_single_val, $1E
	db $99, $08
	db $99, $08
	db $99, $08
	db !play_subsequence : dw .subseq_157D
	db !set_vol_single_val, $1E
	db $99, $08
	db $99, $08
	db $99, $08
	db $99, $08
	db $99, $08
	db !return_from_sub

.subseq_157D:
	db $80, $02
	db !set_vol_single_val, $0A
	db $99, $03
	db !set_vol_single_val, $14
	db $99, $03
	db !return_from_sub

base off
arch 65816
.end: