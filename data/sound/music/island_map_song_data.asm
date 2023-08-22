;01 Welcome to Crocodile Isle
;2E195F
island_map_song_data:
	dw !bgm_loc, $0306
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1317, .seq_1754, .seq_1604, .seq_17F8, .seq_141C, .seq_170A, .seq_152B, .seq_1488
	db $CA, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.subseq_1314:
	db $80, $10
	db !return_from_sub

.seq_1317:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_1314
	db !set_master_volume_indirect, $6E
	db !set_echo, $37, $20, $20
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db $80, $10
.loop_point_132D:
	db !set_instrument, $1D
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $DF, $2B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !set_default_duration, $08
	db !loop_subsequence, $20 : dw .subseq_141A
	db !set_instrument, $1D
	db !set_adsr, $CF, $4B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !loop_subsequence, $02 : dw .subseq_13F0
	db !play_subsequence : dw .subseq_13B3
	db !default_duration_off
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $99
	db !play_subsequence : dw .subseq_1374
	db !set_instrument, $1D
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $DF, $2B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !set_default_duration, $08
	db !loop_subsequence, $10 : dw .subseq_141A
	db !default_duration_off
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $99
	db !play_subsequence : dw .subseq_1374
	db !jump_to_sequence : dw .loop_point_132D

.subseq_1374:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $16, $0E
	db !set_adsr, $DE, $A8
	db $80, $10
	db !set_volume_l_and_r, $11, $0C
	db $E0, $06
	db $80, $02
	db $E0, $06
	db $80, $02
	db $E0, $10
	db !set_volume_l_and_r, $04, $07
	db $E0, $08
	db !set_volume_l_and_r, $04, $02
	db $E0, $08
	db $80, $10
	db !set_volume_l_and_r, $11, $0C
	db $E1, $06
	db $80, $02
	db $E1, $06
	db $80, $02
	db $E1, $10
	db !set_volume_l_and_r, $04, $07
	db $E1, $08
	db $E1, $08
	db !set_volume_l_and_r, $04, $02
	db !return_from_sub

.subseq_13B3:
	db !set_variable_note_1, $9D
	db !set_variable_note_2, $99
	db !loop_subsequence, $04 : dw .subseq_1409
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $9B
	db !play_subsequence : dw .subseq_1409
	db !set_variable_note_1, $99
	db !set_variable_note_2, $9B
	db !play_subsequence : dw .subseq_1409
	db !set_variable_note_1, $9D
	db !set_variable_note_2, $99
	db !play_subsequence : dw .subseq_1409
	db !set_variable_note_1, $96
	db !set_variable_note_2, $99
	db !play_subsequence : dw .subseq_1409
	db !set_variable_note_1, $99
	db !set_variable_note_2, $96
	db !loop_subsequence, $04 : dw .subseq_1409
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $98
	db !loop_subsequence, $04 : dw .subseq_1409
	db !set_variable_note_1, $9D
	db !set_variable_note_2, $98
	db !loop_subsequence, $04 : dw .subseq_1409
	db !return_from_sub

.subseq_13F0:
	db !set_variable_note_1, $99
	db !set_variable_note_2, $96
	db !loop_subsequence, $04 : dw .subseq_1409
	db !set_variable_note_1, $98
	db !set_variable_note_2, $95
	db !loop_subsequence, $02 : dw .subseq_1409
	db !set_variable_note_1, $99
	db !set_variable_note_2, $96
	db !loop_subsequence, $02 : dw .subseq_1409
	db !return_from_sub

.subseq_1409:
	db !set_volume_l_and_r, $18, $28
	db $E0
	db !set_volume_l_and_r, $0D, $08
	db $E0
	db !set_volume_l_and_r, $18, $28
	db $E1
	db !set_volume_l_and_r, $0D, $08
	db $E1
	db !return_from_sub

.subseq_141A:
	db $91
	db !return_from_sub

.seq_141C:
	db !play_subsequence : dw .subseq_1314
	db $80, $10
.loop_point_1421:
	db !set_instrument, $1D
	db !set_adsr, $CF, $4B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !set_default_duration, $08
	db !loop_subsequence, $02 : dw .subseq_1479
	db !set_variable_note_1, $98
	db !set_variable_note_2, $99
	db !loop_subsequence, $02 : dw .subseq_1409
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $99
	db !play_subsequence : dw .subseq_1409
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $9D
	db !play_subsequence : dw .subseq_1409
	db !set_variable_note_1, $91
	db !set_variable_note_2, $91
	db !loop_subsequence, $1C : dw .subseq_1409
	db !set_volume_l_and_r, $16, $16
	db !loop_subsequence, $20 : dw .subseq_1477
	db !default_duration_off
	db !set_variable_note_1, $99
	db !set_variable_note_2, $92
	db !play_subsequence : dw .subseq_1374
	db !set_instrument, $1D
	db !set_adsr, $CF, $4B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !set_default_duration, $08
	db !loop_subsequence, $02 : dw .subseq_1479
	db !default_duration_off
	db !set_variable_note_1, $99
	db !set_variable_note_2, $92
	db !play_subsequence : dw .subseq_1374
	db !jump_to_sequence : dw .loop_point_1421

.subseq_1477:
	db $95
	db !return_from_sub

.subseq_1479:
	db !set_variable_note_1, $98
	db !set_variable_note_2, $99
	db !play_subsequence : dw .subseq_1409
	db !set_variable_note_1, $98
	db !set_variable_note_2, $96
	db !play_subsequence : dw .subseq_1409
	db !return_from_sub

.seq_1488:
	db !play_subsequence : dw .subseq_1314
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $60, $60
	db !set_adsr, $D8, $E5
	db !long_duration_on
	db $85, $01, $10
	db !long_duration_off
.loop_point_149C:
	db !set_instrument, $1D
	db !set_adsr, $CF, $4B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !set_default_duration, $08
	db !loop_subsequence, $02 : dw .subseq_1512
	db !play_subsequence : dw .subseq_14F9
	db !set_variable_note_1, $8D
	db !set_variable_note_2, $8D
	db !loop_subsequence, $04 : dw .subseq_1409
	db !set_volume_l_and_r, $18, $18
	db !loop_subsequence, $20 : dw .subseq_14F7
	db !default_duration_off
	db !set_variable_note_1, $92
	db !set_variable_note_2, $91
	db !play_subsequence : dw .subseq_1374
	db !set_instrument, $1D
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $DF, $2B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !set_variable_note_1, $95
	db !set_variable_note_2, $95
	db !set_default_duration, $08
	db !loop_subsequence, $04 : dw .subseq_1409
	db !default_duration_off
	db !set_variable_note_1, $92
	db !set_variable_note_2, $91
	db !play_subsequence : dw .subseq_1374
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $60, $60
	db !set_adsr, $D8, $E5
	db !long_duration_on
	db $85, $01, $00
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_149C

.subseq_14F7:
	db $91
	db !return_from_sub

.subseq_14F9:
	db !set_variable_note_1, $96
	db !set_variable_note_2, $96
	db !loop_subsequence, $04 : dw .subseq_1409
	db !set_variable_note_1, $95
	db !set_variable_note_2, $95
	db !loop_subsequence, $02 : dw .subseq_1409
	db !set_variable_note_1, $96
	db !set_variable_note_2, $96
	db !loop_subsequence, $02 : dw .subseq_1409
	db !return_from_sub

.subseq_1512:
	db !set_variable_note_1, $8D
	db !set_variable_note_2, $8D
	db !loop_subsequence, $04 : dw .subseq_1409
	db !set_variable_note_1, $8C
	db !set_variable_note_2, $8C
	db !loop_subsequence, $02 : dw .subseq_1409
	db !set_variable_note_1, $8D
	db !set_variable_note_2, $8D
	db !loop_subsequence, $02 : dw .subseq_1409
	db !return_from_sub

.seq_152B:
	db !play_subsequence : dw .subseq_1314
	db $80, $10
.loop_point_1530:
	db !set_instrument, $A5
	db !change_instr_pitch, $00
	db !set_adsr, $AF, $EB
	db $80, $30
	db !set_volume_l_and_r, $14, $08
	db $99, $05
	db $99, $05
	db $99, $06
	db $99, $08
	db !set_volume_l_and_r, $03, $08
	db $99, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $20
	db !set_volume_l_and_r, $08, $14
	db $99, $05
	db $99, $05
	db $99, $06
	db $99, $08
	db !set_volume_l_and_r, $08, $03
	db $99, $08
	db !set_volume_l_and_r, $02, $05
	db $99, $20
	db !set_volume_l_and_r, $14, $08
	db $99, $05
	db $99, $05
	db $99, $06
	db $99, $08
	db !set_volume_l_and_r, $03, $08
	db $99, $08
	db !set_volume_l_and_r, $0E, $0E
	db $99, $05
	db $99, $05
	db $99, $06
	db !set_volume_l_and_r, $11, $11
	db $99, $08
	db $99, $08
	db $9A, $08
	db $99, $08
	db !set_instrument, $A3
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $FF, $72
	db !set_volume_l_and_r, $03, $08
	db $9D, $10
	db $99, $20
	db $96, $10
	db $9D, $10
	db $99, $20
	db $96, $10
	db $9B, $20
	db $99, $10
	db $98, $10
	db $99, $10
	db $96, $10
	db $91, $20
	db $9D, $10
	db $99, $20
	db $96, $10
	db $9D, $10
	db $99, $20
	db $96, $10
	db $9B, $20
	db $99, $10
	db $98, $10
	db $96, $40
	db $9D, $10
	db $99, $10
	db $A2, $20
	db $9D, $10
	db $99, $10
	db $A2, $20
	db $A1, $18
	db $A1, $08
	db $A2, $10
	db $A4, $10
	db $A5, $10
	db $A4, $10
	db $A2, $20
	db $9D, $10
	db $99, $10
	db $A2, $20
	db $9D, $10
	db $99, $10
	db $A2, $20
	db $95, $20
	db $96, $10
	db $98, $20
	db $99, $10
	db $9B, $10
	db $9D, $10
	db $95, $20
	db $96, $10
	db $98, $20
	db $99, $10
	db $9B, $10
	db $9D, $10
	db $80, $C0
	db $80, $C0
	db !jump_to_sequence : dw .loop_point_1530

.seq_1604:
	db !play_subsequence : dw .subseq_1314
	db $80, $10
.loop_point_1609:
	db $80, $80
	db $80, $80
	db !set_instrument, $1C
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8D, $EB
	db !change_instr_pitch, $0E
	db !fine_tune, $30
	db !vibrato_with_delay, $02, $04, $0B, $05
	db !play_subsequence : dw .subseq_16C2
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $16, $0E
	db !set_adsr, $DE, $AB
	db !play_subsequence : dw .subseq_1655
	db !set_instrument, $1D
	db !set_adsr, $CF, $4B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !set_volume_l_and_r, $0A, $15
	db !set_adsr, $9E, $E1
	db !loop_subsequence, $04 : dw .subseq_164C
	db $80, $80
	db !loop_subsequence, $04 : dw .subseq_164C
	db !jump_to_sequence : dw .loop_point_1609

.subseq_164C:
	db $9E, $08
	db $99, $08
	db $96, $08
	db $92, $08
	db !return_from_sub

.subseq_1655:
	db $96, $14
	db $80, $04
	db $96, $06
	db $80, $02
	db $99, $0E
	db $80, $02
	db $96, $0C
	db $80, $04
	db $99, $28
	db $80, $08
	db $96, $0E
	db $80, $02
	db $95, $16
	db $80, $02
	db $95, $08
	db $96, $10
	db $98, $10
	db $96, $0E
	db $80, $02
	db $91, $0E
	db $80, $02
	db $96, $11
	db $80, $0F
	db $96, $16
	db $80, $02
	db $96, $08
	db $99, $10
	db $96, $10
	db $99, $30
	db $96, $0E
	db $80, $02
	db $95, $16
	db $80, $02
	db $95, $06
	db $80, $02
	db $96, $10
	db $95, $0C
	db $80, $1C
	db $96, $06
	db $80, $02
	db $98, $10
	db $96, $0E
	db $80, $02
	db $95, $16
	db $80, $02
	db $95, $08
	db $96, $10
	db $98, $12
	db $80, $0E
	db $99, $08
	db $99, $06
	db $80, $02
	db $9B, $10
	db $9D, $10
	db !return_from_sub

.subseq_16C2:
	db !simple_pitch_slide_up, $03, $01, $02, $26
	db $96, $16
	db $80, $02
	db $96, $08
	db $99, $10
	db $96, $10
	db $99, $28
	db $80, $08
	db $96, $0E
	db $80, $02
	db $95, $16
	db $80, $02
	db $95, $08
	db $96, $10
	db $98, $10
	db $96, $20
	db $91, $1C
	db $80, $04
	db $96, $16
	db $80, $02
	db $96, $08
	db $99, $10
	db $96, $10
	db $99, $30
	db $96, $0E
	db $80, $02
	db $95, $16
	db $80, $02
	db $95, $08
	db $96, $10
	db $98, $10
	db $96, $30
	db $80, $0C
	db $80, $04
	db !return_from_sub

.seq_170A:
	db !play_subsequence : dw .subseq_1314
	db $80, $11
	db $80, $10
.loop_point_1711:
	db !set_instrument, $1C
	db !set_volume_l_and_r, $03, $07
	db !set_adsr, $8C, $E7
	db !change_instr_pitch, $0E
	db !fine_tune, $30
	db !vibrato_with_delay, $03, $03, $0E, $07
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_16C2
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $03, $08
	db !set_adsr, $DE, $AB
	db !play_subsequence : dw .subseq_1655
	db !set_instrument, $1D
	db !set_adsr, $CF, $4B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !set_volume_l_and_r, $0A, $05
	db !set_adsr, $9E, $E1
	db !loop_subsequence, $04 : dw .subseq_164C
	db $80, $80
	db !loop_subsequence, $04 : dw .subseq_164C
	db !jump_to_sequence : dw .loop_point_1711

.seq_1754:
	db !play_subsequence : dw .subseq_1314
	db $80, $08
.loop_point_1759:
	db !set_instrument, $A4
	db !set_volume_l_and_r, $40, $40
	db !change_instr_pitch, $00
	db !fine_tune, $AD
	db !set_adsr, $DF, $51
	db $8A, $80
	db $80, $60
	db $85, $10
	db $85, $10
	db $85, $08
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $60, $60
	db !set_adsr, $D8, $E5
	db !long_duration_on
	db $8A, $01, $80
	db !long_duration_off
	db $85, $40
	db $8A, $40
	db !set_adsr, $EC, $8F
	db $8A, $10
	db $8A, $20
	db $8A, $08
	db $8A, $08
	db $8A, $08
	db $8A, $08
	db $8A, $30
	db $8A, $10
	db $8A, $20
	db $8A, $08
	db $8A, $08
	db $8A, $08
	db $8A, $08
	db $8A, $10
	db $8A, $08
	db $8A, $08
	db $8A, $10
	db $8A, $10
	db $8A, $20
	db $8A, $08
	db $8A, $08
	db $8A, $08
	db $8A, $08
	db $8A, $20
	db $8A, $08
	db $8A, $08
	db !set_adsr, $EE, $AF
	db $85, $10
	db $85, $20
	db $85, $08
	db $85, $08
	db $85, $08
	db $85, $08
	db $85, $10
	db $85, $10
	db $85, $08
	db $85, $08
	db $85, $10
	db $85, $20
	db $85, $08
	db $85, $08
	db $85, $08
	db $85, $08
	db $85, $10
	db $85, $08
	db $85, $08
	db $85, $08
	db $85, $08
	db !set_adsr, $AC, $E5
	db $83, $40
	db $86, $40
	db $85, $80
	db $83, $40
	db $86, $38
	db !jump_to_sequence : dw .loop_point_1759

.seq_17F8:
	db !play_subsequence : dw .subseq_1314
	db !set_instrument, $A4
	db !set_volume_l_and_r, $40, $40
	db !change_instr_pitch, $F4
	db !fine_tune, $AD
	db !set_adsr, $DF, $51
	db $96, $10
.loop_point_1809:
	db $91, $20
	db $8A, $40
	db $8A, $40
	db $8A, $20
	db $8A, $20
	db $91, $10
	db $91, $10
	db $96, $80
	db $80, $80
	db $80, $80
	db $80, $40
	db $80, $30
	db $96, $08
	db $96, $08
	db $96, $10
	db !change_instr_pitch, $00
	db !set_instrument, $A5
	db !set_adsr, $AF, $EB
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_volume_l_and_r, $03, $03
	db $99, $10
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db $99, $08
	db $99, $08
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_volume_l_and_r, $03, $03
	db $99, $10
	db !play_subsequence : dw .subseq_1901
	db !play_subsequence : dw .subseq_18E0
	db !loop_subsequence, $02 : dw .subseq_18CE
	db !play_subsequence : dw .subseq_18E0
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_volume_l_and_r, $03, $03
	db $99, $10
	db $99, $08
	db $99, $08
	db !play_subsequence : dw .subseq_18E0
	db $99, $08
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db $99, $08
	db !play_subsequence : dw .subseq_18E0
	db $99, $08
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_instrument, $A4
	db !set_volume_l_and_r, $40, $40
	db !change_instr_pitch, $F4
	db !fine_tune, $AD
	db !set_adsr, $DF, $51
	db $91, $08
	db $91, $08
	db $91, $08
	db $91, $08
	db $9B, $40
	db $9E, $40
	db $9D, $60
	db $91, $08
	db $91, $08
	db $91, $08
	db $91, $08
	db $9B, $40
	db $9E, $40
	db !jump_to_sequence : dw .loop_point_1809

.subseq_18CE:
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !return_from_sub

.subseq_18E0:
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_volume_l_and_r, $03, $03
	db $99, $10
	db !set_volume_l_and_r, $16, $16
	db $99, $08
	db $99, $08
	db !return_from_sub

.subseq_1901:
	db !set_volume_l_and_r, $14, $14
	db $99, $05
	db $99, $05
	db $99, $06
	db !return_from_sub

base off
arch 65816
.end: