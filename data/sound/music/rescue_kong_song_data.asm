;13 Stronghold Showdown
;325872
rescue_kong_song_data:
	dw !bgm_loc, $0252
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1518, .seq_16D9, .seq_1638, .seq_1600, .seq_1664, .seq_15E0, .seq_1719, .seq_1578
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_1316	;01: 

;sub-track 01 channel pointers
.chn_ptrs_1316:
	dw .seq_1328, .seq_1468, .seq_13EB, .seq_13BE, .seq_1429, .seq_137C, .seq_14E1, .seq_132C
	db $A0, $FF	;music tempo, sound effect tempo

.seq_1328:
	db !play_subsequence : dw .subseq_150A
	db !end_sequence

.seq_132C:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $05, $11
	db !set_adsr, $8D, $E0
	db !echo_on
	db !change_instr_pitch_rel, $F4
	db $9B, $18
	db $9A, $18
	db $99, $18
	db $98, $18
	db $97, $30
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $3C, $1E
.loop_point_134A:
	db !loop_subsequence, $02 : dw .subseq_135A
	db !jump_to_sequence : dw .loop_point_134A

.subseq_1351:
	db $96
	db $E0
	db $9A
	db $E0
	db $9B
	db $E0
	db $9A
	db $E0
	db !return_from_sub

.subseq_135A:
	db !echo_on
	db !set_instrument, $1D
	db !set_adsr, $DF, $2B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !echo_on
	db !set_default_duration, $08
	db !set_variable_note_1, $93
	db !loop_subsequence, $02 : dw .subseq_1351
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1351
	db $9D
	db $92
	db $9B
	db $92
	db $9A
	db $92
	db $9B
	db $92
	db !default_duration_off
	db !return_from_sub

.seq_137C:
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db $80, $0E
	db !set_volume_l_and_r, $05, $11
	db !vibrato_with_delay, $02, $01, $03, $07
	db !set_adsr, $FB, $E0
	db !pitch_slide_up, $00, $02, $08, $17, $00
	db $A4, $18
	db !pitch_slide_up, $00, $02, $08, $15, $00
	db $A3, $18
	db !pitch_slide_up, $00, $02, $08, $14, $00
	db $A2, $18
	db !pitch_slide_up, $00, $02, $08, $13, $00
	db $A1, $18
	db !pitch_slide_up, $01, $03, $08, $12, $00
	db $A0, $30
	db !pitch_slide_off
	db !set_volume_l_and_r, $0A, $14
	db !jump_to_sequence : dw .loop_point_134A

.seq_13BE:
	db !set_instrument, $1C
	db !change_instr_pitch, $02
	db !fine_tune, $30
	db !set_adsr, $8C, $EB
	db !vibrato_with_delay, $02, $04, $0B, $05
	db !set_vol_single_val, $1E
	db $95, $18
	db $94, $18
	db $93, $18
	db $92, $18
	db $91, $30
	db !vibrato_off
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $66
	db !set_adsr, $8D, $E0
.loop_point_13E4:
	db $87, $80
	db $86, $80
	db !jump_to_sequence : dw .loop_point_13E4

.seq_13EB:
	db !set_instrument, $14
	db !change_instr_pitch, $08
	db !fine_tune, $02
	db !set_volume_l_and_r, $05, $11
	db !set_adsr, $8D, $E0
	db !echo_on
	db !change_instr_pitch_rel, $F4
	db $A0, $18
	db $9F, $18
	db $9E, $18
	db $9D, $18
	db $9C, $30
	db !change_instr_pitch_rel, $0C
.loop_point_1406:
	db !set_adsr, $88, $E0
	db $9B, $80
	db !set_adsr, $8E, $F1
	db $9B, $20
	db $9B, $20
	db $9B, $20
	db $9B, $20
	db !set_adsr, $88, $E0
	db $99, $80
	db !set_adsr, $8E, $F1
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db !jump_to_sequence : dw .loop_point_1406

.seq_1429:
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $08
	db !fine_tune, $02
	db !set_volume_l_and_r, $05, $11
	db !set_adsr, $8D, $E0
	db !echo_on
	db !change_instr_pitch_rel, $F4
	db $A5, $18
	db $A4, $18
	db $A3, $18
	db $A2, $18
	db $A1, $30
	db !change_instr_pitch_rel, $0C
.loop_point_1445:
	db !set_adsr, $88, $E0
	db $9A, $80
	db !set_adsr, $8E, $F1
	db $9A, $20
	db $9A, $20
	db $9A, $20
	db $9A, $20
	db !set_adsr, $88, $E0
	db $9A, $80
	db !set_adsr, $8E, $F1
	db $98, $20
	db $98, $20
	db $98, $20
	db $98, $20
	db !jump_to_sequence : dw .loop_point_1445

.seq_1468:
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $26, $11
	db !vibrato_with_delay, $02, $01, $03, $07
	db !set_adsr, $FB, $E0
	db !pitch_slide_up, $00, $02, $08, $17, $00
	db $A4, $18
	db !pitch_slide_up, $00, $02, $08, $15, $00
	db $A3, $18
	db !pitch_slide_up, $00, $02, $08, $14, $00
	db $A2, $18
	db !pitch_slide_up, $00, $02, $08, $13, $00
	db $A1, $18
	db !pitch_slide_up, $01, $03, $08, $12, $00
	db $A0, $30
	db !pitch_slide_off
	db !vibrato_off
	db !set_volume_l_and_r, $0A, $06
	db !set_adsr, $8F, $CB
.loop_point_14A9:
	db !echo_on
	db !set_instrument, $AF
	db !change_instr_pitch, $12
	db !fine_tune, $F2
	db $8E, $10
	db $8A, $10
	db $87, $20
	db $9A, $10
	db $96, $10
	db $93, $20
	db !set_default_duration, $10
	db $9A
	db $9B
	db $9A
	db $96
	db $9A
	db $9B
	db $9A
	db $96
	db $8E
	db $8A
	db !default_duration_off
	db $86, $20
	db $9A, $10
	db $96, $10
	db $92, $20
	db !change_instr_pitch_rel, $FB
	db !set_default_duration, $10
	db $9A
	db $9B
	db $9A
	db $97
	db $9A
	db $9B
	db $9A
	db $97
	db !default_duration_off
	db !jump_to_sequence : dw .loop_point_14A9

.seq_14E1:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $05, $11
	db !set_adsr, $8D, $E0
	db !echo_on
	db !change_instr_pitch_rel, $F4
	db $95, $18
	db $94, $18
	db $93, $18
	db $92, $18
	db $91, $30
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $02, $06
	db !set_adsr, $8E, $C8
	db $80, $0E
	db !jump_to_sequence : dw .loop_point_14A9

.subseq_1507:
	db $80, $10
	db !return_from_sub

.subseq_150A:
	db !set_echo, $30, $21, $21
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.seq_1518:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_1507
	db !play_subsequence : dw .subseq_150A
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_adsr, $8F, $EE
	db !set_volume_l_and_r, $07, $11
	db !echo_on
	db !loop_subsequence, $0C : dw .subseq_156B
	db !loop_subsequence, $04 : dw .subseq_1542
	db $A2, $10
	db !set_volume_l_and_r, $07, $03
	db $A2, $08
	db !set_volume_l_and_r, $02, $03
	db $A2, $08
	db !end_sequence

.subseq_1542:
	db !set_volume_l_and_r, $0A, $14
	db $A2, $08
	db $A2, $08
	db $A2, $10
	db $A2, $10
	db $A2, $08
	db $A2, $08
	db $A2, $08
	db $A2, $08
	db $A2, $10
	db $A2, $08
	db !set_volume_l_and_r, $07, $03
	db $A2, $08
	db !set_volume_l_and_r, $02, $03
	db $A2, $08
	db !set_volume_l_and_r, $0A, $14
	db $A2, $04
	db $A2, $04
	db !return_from_sub

.subseq_156B:
	db $A2, $08
	db $A2, $08
	db $A2, $10
	db $A2, $10
	db $A2, $08
	db $A2, $08
	db !return_from_sub

.seq_1578:
	db !play_subsequence : dw .subseq_1507
	db !set_instrument, $1D
	db !set_volume_l_and_r, $50, $28
	db !set_adsr, $DF, $2B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !echo_on
	db !loop_subsequence, $03 : dw .subseq_159F
	db !set_volume_l_and_r, $3C, $28
	db !loop_subsequence, $10 : dw .subseq_1596
	db $A2, $10
	db !end_sequence

.subseq_1596:
	db $A2, $08
	db $9D, $08
	db $96, $08
	db $9D, $08
	db !return_from_sub

.subseq_159F:
	db $9A, $08
	db $96, $08
	db $9A, $08
	db $9B, $08
	db $9D, $08
	db $96, $08
	db $9A, $08
	db $96, $08
	db $9A, $08
	db $96, $08
	db $9A, $08
	db $9B, $08
	db $9D, $08
	db $96, $08
	db $9A, $08
	db $96, $08
	db $98, $08
	db $94, $08
	db $98, $08
	db $9A, $08
	db $9B, $08
	db $94, $08
	db $98, $08
	db $94, $08
	db $98, $08
	db $93, $08
	db $98, $08
	db $9A, $08
	db $9B, $08
	db $98, $08
	db $9B, $08
	db $9D, $08
	db !return_from_sub

.seq_15E0:
	db !play_subsequence : dw .subseq_1507
	db !set_instrument, $1D
	db !set_volume_l_and_r, $16, $21
	db !set_adsr, $DF, $2B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !echo_on
	db $80, $0B
	db !loop_subsequence, $03 : dw .subseq_159F
	db !set_volume_l_and_r, $12, $20
	db !loop_subsequence, $10 : dw .subseq_1596
	db $A2, $10
	db !end_sequence

.seq_1600:
	db !play_subsequence : dw .subseq_1507
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $62
	db !set_adsr, $8D, $E0
	db !loop_subsequence, $03 : dw .subseq_1631
	db !set_adsr, $DE, $D2
	db !loop_subsequence, $04 : dw .subseq_161C
	db $8A, $10
	db !end_sequence

.subseq_161C:
	db $8A, $08
	db $8A, $08
	db $8A, $10
	db $8A, $10
	db $8A, $08
	db $8A, $08
	db $8A, $08
	db $8A, $08
	db $8A, $10
	db $8A, $20
	db !return_from_sub

.subseq_1631:
	db $8A, $80
	db $88, $40
	db $8C, $40
	db !return_from_sub

.seq_1638:
	db !play_subsequence : dw .subseq_1507
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_vol_single_val, $14
	db !set_adsr, $8C, $E0
	db $98, $40
	db $96, $40
	db $96, $40
	db $80, $40
	db $98, $40
	db $96, $40
	db $9A, $10
	db !end_sequence

.seq_1664:
	db !play_subsequence : dw .subseq_1507
	db !set_instrument, $1C
	db !change_instr_pitch, $0E
	db !fine_tune, $30
	db !set_adsr, $8C, $EB
	db !vibrato_with_delay, $02, $04, $0B, $05
	db !set_volume_l_and_r, $0F, $19
	db $80, $80
	db $80, $80
	db !loop_subsequence, $01 : dw .subseq_16A2
	db $A2, $20
	db $80, $20
	db $80, $40
	db !vibrato_off
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_vol_single_val, $14
	db !set_adsr, $8C, $E0
	db $A0, $40
	db $9F, $40
	db $9D, $40
	db $80, $40
	db $A0, $40
	db $9F, $40
	db $A2, $10
	db !end_sequence

.subseq_16A2:
	db $96, $20
	db $9A, $18
	db $9B, $08
	db $9D, $28
	db $80, $08
	db $9D, $08
	db $9F, $08
	db $A0, $18
	db $9F, $18
	db $9B, $10
	db $A0, $18
	db $9F, $18
	db $9B, $10
	db $9D, $2C
	db $80, $04
	db $9D, $08
	db $9F, $08
	db $9D, $24
	db $80, $0C
	db $9D, $08
	db $9F, $08
	db $A0, $18
	db $9F, $18
	db $9B, $10
	db $A0, $18
	db $A2, $18
	db $A0, $10
	db !return_from_sub

.seq_16D9:
	db !play_subsequence : dw .subseq_1507
	db !set_instrument, $1C
	db !change_instr_pitch, $0E
	db !fine_tune, $30
	db !set_adsr, $8C, $EB
	db !vibrato_with_delay, $02, $04, $0B, $05
	db !set_volume_l_and_r, $0B, $06
	db $80, $0B
	db $80, $80
	db $80, $80
	db !loop_subsequence, $01 : dw .subseq_16A2
	db $A2, $20
	db $80, $15
	db $80, $40
	db !vibrato_off
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_vol_single_val, $14
	db !set_adsr, $8C, $E0
	db $9B, $40
	db $9B, $40
	db $9A, $40
	db $80, $40
	db $9B, $40
	db $9B, $40
	db $9D, $10
	db !end_sequence

.seq_1719:
	db !play_subsequence : dw .subseq_1507
	db !set_instrument, $A5
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $DF, $AE
	db !echo_on
	db !loop_subsequence, $03 : dw .subseq_1777
	db !loop_subsequence, $03 : dw .subseq_175A
	db !loop_subsequence, $01 : dw .subseq_1732
	db !end_sequence

.subseq_1732:
	db !set_vol_single_val, $26
	db $A0, $08
	db $A0, $08
	db $A0, $10
	db $A0, $10
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db $A0, $10
	db $A0, $10
	db !set_vol_single_val, $17
	db $A0, $04
	db $A0, $04
	db !set_vol_single_val, $21
	db $A0, $04
	db $A0, $04
	db !echo_on
	db !set_vol_single_val, $28
	db $A0, $20
	db !return_from_sub

.subseq_175A:
	db !set_vol_single_val, $26
	db $A0, $08
	db $A0, $08
	db $A0, $10
	db $A0, $10
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db $A0, $10
	db $A0, $18
	db !set_vol_single_val, $17
	db $A0, $04
	db $A0, $04
	db !return_from_sub

.subseq_1777:
	db !loop_subsequence, $02 : dw .subseq_1791
	db !loop_subsequence, $02 : dw .subseq_1784
	db !loop_subsequence, $01 : dw .subseq_1791
	db !return_from_sub

.subseq_1784:
	db !set_volume_l_and_r, $1E, $1E
	db $A0, $18
	db !set_volume_l_and_r, $14, $14
	db $A0, $04
	db $A0, $04
	db !return_from_sub

.subseq_1791:
	db !set_volume_l_and_r, $1E, $1E
	db $A0, $08
	db $A0, $08
	db $A0, $10
	db $A0, $18
	db !set_volume_l_and_r, $14, $14
	db $A0, $04
	db $A0, $04
	db !return_from_sub

base off
arch 65816
.end: