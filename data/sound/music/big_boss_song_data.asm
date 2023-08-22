;15,21 Boss Bossanova
;325FC2
big_boss_song_data:
	dw !bgm_loc, $07CB
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_19C3, .seq_1AF0, .seq_1C3D, .seq_2125, .seq_1E73, .seq_1F80, .seq_2042, .seq_1D42
	db $A8, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131A	;01: 
	dw .chn_ptrs_132C	;02: 
	dw .chn_ptrs_133E	;03: 

;sub-track 01 channel pointers
.chn_ptrs_131A:
	dw .seq_1831, .seq_185A, .seq_1893, .seq_18B0, .seq_1912, .seq_1947, .seq_1950, .seq_1981
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132C:
	dw .seq_1558, .seq_15E0, .seq_16BA, .seq_1714, .seq_15B0, .seq_1805, .seq_17D8, .seq_1663
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_133E:
	dw .seq_1364, .seq_13CC, .seq_1417, .seq_1494, .seq_13A2, .seq_14D2, .seq_1515, .seq_14B3
	db $C0, $FF	;music tempo, sound effect tempo

.subseq_1350:
	db !set_instrument, $23
	db !change_instr_pitch, $F4
	db !fine_tune, $2A
	db !set_adsr, $8E, $E0
	db !return_from_sub

.subseq_135A:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_adsr, $8C, $E0
	db !return_from_sub

.seq_1364:
	db !play_subsequence : dw .subseq_19B5
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_1391
.loop_point_1380:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_1380

.subseq_1391:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9F, $08
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $08
	db $99, $08
	db !return_from_sub

.seq_13A2:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !change_instr_pitch, $08
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $AF, $B9
	db $99, $18
	db $99, $18
	db $99, $18
	db $99, $18
	db !set_adsr, $8F, $F8
.loop_point_13C5:
	db $99, $08
	db $99, $08
	db !jump_to_sequence : dw .loop_point_13C5

.seq_13CC:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $7A, $7A
	db !set_adsr, $CE, $AF
	db !set_default_duration, $08
	db $8A
	db $8A
	db $8A
	db $85
	db $85
	db $88
	db $88
	db $8A
	db $87
	db $8A
	db $8B
.loop_point_13F3:
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $8C
	db $85
	db $85
	db $85
	db $85
	db $85
	db $85
	db $85
	db $85
	db $88
	db $88
	db $88
	db $88
	db $8A
	db $8A
	db $8A
	db $8A
	db !jump_to_sequence : dw .loop_point_13F3
	db !end_sequence

.seq_1417:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1432
	db !end_sequence

.subseq_1432:
	db !set_adsr, $EF, $80
	db $80, $58
	db !pitch_slide_up, $01, $02, $08, $21, $00
	db $A2, $10
	db $A2, $10
	db $A2, $0F
	db !pitch_slide_up, $00, $01, $08, $2B, $00
	db $9F, $09
	db !pitch_slide_off
	db $9F, $07
	db !pitch_slide_up, $00, $01, $08, $2B, $00
	db $9F, $09
	db !pitch_slide_off
	db $9F, $07
	db !pitch_slide_up, $00, $01, $08, $39, $00
	db $A4, $09
	db !pitch_slide_off
	db !vibrato_with_delay, $04, $02, $11, $05
	db $A4, $0F
	db $80, $01
	db $A4, $07
	db !pitch_slide_up, $00, $01, $08, $39, $00
	db $A4, $09
	db !pitch_slide_off
	db $A4, $08
	db !pitch_slide_up, $01, $02, $08, $2C, $00
	db $A7, $10
	db $A7, $10
	db $A7, $10
	db !set_adsr, $EE, $40
	db $A7, $10
	db !set_adsr, $EC, $20
	db $A7, $10
	db !set_adsr, $EB, $00
	db $A7, $10
	db !return_from_sub

.seq_1494:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $80, $05
	db $9D, $20
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $1C, $12
	db $80, $0F
	db !play_subsequence : dw .subseq_1432
	db !end_sequence

.seq_14B3:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $80, $05
	db $98, $20
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $08, $0E
	db $80, $1E
	db !play_subsequence : dw .subseq_1432
	db !end_sequence

.seq_14D2:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db $80, $08
	db $80, $40
	db !play_subsequence : dw .subseq_1350
	db !set_volume_l_and_r, $32, $50
	db !set_adsr, $AF, $92
	db !change_instr_pitch_rel, $F4
	db !echo_on
.loop_point_14F2:
	db $80, $10
	db $98, $10
	db $98, $08
	db $98, $18
	db $98, $08
	db $98, $10
	db $98, $10
	db $80, $18
	db $80, $10
	db $98, $10
	db $98, $08
	db $98, $18
	db $98, $08
	db $98, $10
	db $96, $10
	db $80, $18
	db !jump_to_sequence : dw .loop_point_14F2

.seq_1515:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db $80, $08
	db $80, $40
	db !play_subsequence : dw .subseq_1350
	db !set_volume_l_and_r, $32, $50
	db !set_adsr, $AF, $92
	db !change_instr_pitch_rel, $F4
	db !echo_on
.loop_point_1535:
	db $80, $10
	db $93, $10
	db $93, $08
	db $93, $18
	db $93, $08
	db $93, $10
	db $93, $10
	db $80, $18
	db $80, $10
	db $94, $10
	db $94, $08
	db $94, $18
	db $94, $08
	db $94, $10
	db $91, $10
	db $80, $18
	db !jump_to_sequence : dw .loop_point_1535

.seq_1558:
	db !play_subsequence : dw .subseq_19B5
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1575
	db !end_sequence

.subseq_1575:
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db $94, $10
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $96, $09
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $26
	db $A5, $10
	db $A4, $07
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $98, $09
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $26
	db $A3, $07
	db !set_vol_single_val, $6C
	db $9E, $10
	db !set_vol_single_val, $26
	db $A4, $09
	db !set_vol_single_val, $2C
	db $A5, $07
	db !return_from_sub

.seq_15B0:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !change_instr_pitch, $08
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_15D1
	db !default_duration_off
	db !end_sequence

.subseq_15D1:
	db !set_adsr, $8F, $F9
	db $99
	db $99
	db $99
	db $99
	db $99
	db $99
	db $99
	db !set_adsr, $8F, $C5
	db $9A
	db !return_from_sub

.seq_15E0:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_15F7
	db !end_sequence

.subseq_15F7:
	db !play_subsequence : dw .subseq_1604
	db !play_subsequence : dw .subseq_1641
	db !play_subsequence : dw .subseq_1604
	db !play_subsequence : dw .subseq_1652
	db !return_from_sub

.subseq_1604:
	db !set_instrument, $05
	db !set_vol_single_val, $50
	db !set_adsr, $8F, $E0
	db !pitch_slide_down, $01, $01, $0B, $0B, $00
	db $8D
	db !pitch_slide_off
	db !set_instrument, $07
	db !set_vol_single_val, $1E
	db !pitch_slide_down, $02, $01, $16, $16, $00
	db $88
	db !pitch_slide_off
	db !set_instrument, $01
	db !set_adsr, $8E, $EF
	db $87
	db !set_instrument, $07
	db !set_adsr, $8F, $E0
	db !pitch_slide_up, $02, $01, $16, $16, $00
	db $89
	db !pitch_slide_off
	db !set_instrument, $02
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $EF
	db $87
	db !set_instrument, $03
	db !set_adsr, $8F, $EF
	db $88
	db !return_from_sub

.subseq_1641:
	db !set_instrument, $08
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_1652:
	db !set_instrument, $06
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_1663:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_167F
	db !end_sequence

.subseq_167F:
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $97, $10
	db $94, $10
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $24
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $96, $09
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $0C
	db $A5, $10
	db $A4, $07
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $98, $09
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $0C
	db $A3, $07
	db !set_vol_single_val, $24
	db $9E, $10
	db !set_vol_single_val, $0C
	db $A4, $09
	db !set_vol_single_val, $11
	db $A5, $07
	db !return_from_sub

.seq_16BA:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $7A, $7A
	db !set_adsr, $CE, $AF
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_16EF
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_16EF
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_16EF
	db !end_sequence

.subseq_16EF:
	db $E0, $0C
	db $80, $04
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $24
	db $E0, $0C
	db $80, $04
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $04
	db $89, $10
	db $8A, $10
	db !return_from_sub

.seq_1714:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_178F
	db !play_subsequence : dw .subseq_176D
	db !echo_on
	db !play_subsequence : dw .subseq_1350
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_173F
	db !end_sequence

.subseq_173F:
	db !set_adsr, $8E, $E0
	db $80, $18
	db $9A, $04
	db $9B, $04
	db $9C, $1C
	db $80, $04
	db $9A, $10
	db $97, $0C
	db $80, $04
	db $80, $18
	db $9A, $04
	db $9B, $04
	db $9C, $10
	db $9A, $10
	db $9C, $08
	db $9E, $08
	db $80, $08
	db $9A, $14
	db $80, $04
	db $99, $10
	db $97, $10
	db $80, $10
	db !return_from_sub

.subseq_176D:
	db !set_instrument, $01
	db !change_instr_pitch, $02
	db !fine_tune, $F2
	db $95, $10
	db !set_instrument, $02
	db !change_instr_pitch, $FE
	db !fine_tune, $18
	db $97, $10
	db !set_instrument, $03
	db !change_instr_pitch, $FD
	db !fine_tune, $00
	db $97, $08
	db $95, $10
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db $97, $40
.subseq_178F:
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db $97, $08
	db !set_instrument, $01
	db !change_instr_pitch, $02
	db !fine_tune, $F2
	db $95, $10
	db !set_instrument, $02
	db !change_instr_pitch, $FE
	db !fine_tune, $18
	db $97, $10
	db !set_instrument, $03
	db !change_instr_pitch, $FD
	db !fine_tune, $00
	db $97, $08
	db !set_instrument, $01
	db !change_instr_pitch, $02
	db !fine_tune, $F2
	db $99, $10
	db !set_instrument, $02
	db !change_instr_pitch, $FE
	db !fine_tune, $18
	db $9A, $10
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db $9A, $08
	db !set_instrument, $03
	db !change_instr_pitch, $FD
	db !fine_tune, $00
	db $99, $10
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db $97, $20
	db !return_from_sub

.seq_17D8:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $80, $05
	db $97, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $0F
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_178F
	db !play_subsequence : dw .subseq_176D
	db !echo_on
	db !play_subsequence : dw .subseq_1350
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_173F
	db !end_sequence

.seq_1805:
	db !play_subsequence : dw .subseq_135A
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $80, $05
	db $93, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $0F
	db !set_volume_l_and_r, $04, $0B
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_178F
	db !play_subsequence : dw .subseq_176D
	db !play_subsequence : dw .subseq_1350
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_173F
	db !end_sequence

.seq_1831:
	db !set_master_volume_indirect, $4B
	db !play_subsequence : dw .subseq_19B5
	db !set_volume_l_and_r, $28, $3C
.loop_point_1839:
	db !set_instrument, $A2
	db !change_instr_pitch, $F0
	db !fine_tune, $F6
	db !set_adsr, $8F, $E0
	db !echo_on
	db $9E, $08
	db $A0, $08
	db $A1, $10
	db $A0, $08
	db $9E, $10
	db $9B, $08
	db $97, $10
	db $99, $08
	db $9B, $10
	db $9C, $20
	db $9A, $60
	db !end_sequence

.seq_185A:
	db !set_instrument, $21
	db !set_volume_l_and_r, $4A, $4A
	db !change_instr_pitch, $00
	db !fine_tune, $AE
	db !vibrato_with_delay, $02, $02, $0B, $03
	db $80, $10
	db $8B, $08
	db $8B, $08
	db $8B, $08
	db $8B, $08
	db $8B, $08
	db $8B, $08
	db $8B, $10
	db $8D, $08
	db $8F, $10
	db $90, $20
	db $84, $08
	db $84, $08
	db $84, $08
	db $84, $08
	db $84, $08
	db $84, $08
	db $84, $08
	db $84, $08
	db $84, $08
	db $84, $20
	db !end_sequence

.seq_1893:
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $DF, $AE
	db $80, $10
	db $8B, $30
	db $8B, $10
	db $8D, $08
	db $8F, $10
	db $90, $20
	db $84, $48
	db $84, $18
	db !end_sequence

.seq_18B0:
	db !echo_on
	db !set_instrument, $24
	db !set_volume_l_and_r, $21, $0B
	db !change_instr_pitch, $0C
	db !fine_tune, $AB
	db !set_adsr, $DF, $75
	db $80, $10
	db $80, $08
	db $92, $04
	db $97, $04
	db $9B, $04
	db $9E, $04
	db $A1, $08
	db $9E, $08
	db $9B, $08
	db $80, $08
	db $92, $04
	db $97, $04
	db $9B, $04
	db $9E, $04
	db $A1, $08
	db $9E, $08
	db $9B, $08
	db $80, $08
	db $90, $04
	db $94, $04
	db $97, $04
	db $9C, $04
	db $A0, $08
	db $9C, $08
	db $97, $08
	db $80, $08
	db $90, $04
	db $94, $04
	db $97, $04
	db $9A, $04
	db $A0, $08
	db $9A, $08
	db $97, $08
	db !set_volume_l_and_r, $04, $0B
	db $A0, $08
	db $9A, $08
	db $97, $08
	db !set_volume_l_and_r, $06, $02
	db $A0, $08
	db $9A, $08
	db $97, $08
	db !end_sequence

.seq_1912:
	db $80, $10
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $DB, $8A
	db $A1, $10
	db $A1, $08
	db $A1, $10
	db $A1, $08
	db $A3, $08
	db $A1, $08
	db $A0, $08
	db $A1, $08
	db $A0, $08
	db $9E, $08
	db $A0, $10
	db $94, $08
	db $A0, $10
	db $94, $08
	db $A0, $10
	db $94, $08
	db $A0, $10
	db $94, $08
	db $A0, $18
	db !end_sequence

.seq_1947:
	db $80, $0E
	db !set_volume_l_and_r, $19, $0F
	db !jump_to_sequence : dw .loop_point_1839
	db !end_sequence

.seq_1950:
	db $80, $10
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $DB, $8A
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9C, $10
	db $9C, $08
	db $9A, $10
	db $9A, $08
	db $9A, $10
	db $9A, $08
	db $9A, $10
	db $9A, $08
	db $9A, $18
	db !end_sequence

.seq_1981:
	db $80, $10
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $DB, $8A
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $97, $10
	db $97, $08
	db $97, $10
	db $97, $08
	db $97, $10
	db $97, $08
	db $97, $10
	db $97, $08
	db $97, $18
	db !end_sequence

.subseq_19B2:
	db $80, $10
	db !return_from_sub

.subseq_19B5:
	db !set_echo, $2D, $0F, $0F
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.seq_19C3:
	db !echo_delay, $04
	db !play_subsequence : dw .subseq_19B2
	db !set_master_volume_indirect, $4B
	db !play_subsequence : dw .subseq_19B5
	db !echo_off
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $DF, $B1
	db $84, $08
	db $81, $08
	db $84, $08
.loop_point_19E0:
	db !loop_subsequence, $02 : dw .subseq_1AAD
	db $86, $10
	db !set_instrument, $A5
	db !set_adsr, $DF, $92
	db !change_instr_pitch, $06
	db !loop_subsequence, $03 : dw .subseq_1A88
	db !set_volume_l_and_r, $1E, $1E
	db $99, $18
	db $99, $0A
	db !set_volume_l_and_r, $0F, $0F
	db $99, $03
	db !set_volume_l_and_r, $17, $17
	db $99, $03
	db !set_volume_l_and_r, $1E, $1E
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $19, $19
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $1E, $1E
	db $99, $0A
	db !set_volume_l_and_r, $0F, $0F
	db $99, $03
	db !set_volume_l_and_r, $17, $17
	db $99, $03
	db !set_volume_l_and_r, $1E, $1E
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $19, $19
	db $99, $08
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $1E, $1E
	db $99, $08
	db !set_volume_l_and_r, $0A, $0A
	db $99, $08
	db !set_volume_l_and_r, $06, $06
	db $99, $08
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $DF, $B1
	db $84, $08
	db $81, $08
	db $84, $08
	db !loop_subsequence, $02 : dw .subseq_1AAD
	db $86, $60
	db $80, $60
	db $80, $60
	db !set_instrument, $A2
	db !change_instr_pitch, $F0
	db !fine_tune, $F6
	db !set_volume_l_and_r, $28, $3C
	db !set_adsr, $8F, $E0
	db !echo_on
	db $9A, $08
	db $99, $08
	db $97, $08
	db $95, $18
	db $92, $18
	db !echo_off
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $DF, $B1
	db $84, $08
	db $81, $08
	db $84, $08
	db !jump_to_sequence : dw .loop_point_19E0
	db !end_sequence

.subseq_1A88:
	db !set_volume_l_and_r, $1E, $1E
	db $99, $18
	db $99, $0A
	db !set_volume_l_and_r, $0F, $0F
	db $99, $03
	db !set_volume_l_and_r, $17, $17
	db $99, $03
	db !set_volume_l_and_r, $1E, $1E
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $19, $19
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $1E, $1E
	db $99, $18
	db !return_from_sub

.subseq_1AAD:
	db $86, $12
	db !set_instrument, $A5
	db !set_adsr, $DF, $92
	db !change_instr_pitch, $06
	db !loop_subsequence, $03 : dw .subseq_1AD4
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $DF, $55
	db $86, $03
	db $86, $03
	db !set_adsr, $DF, $B2
	db $84, $08
	db $81, $08
	db $84, $08
	db !return_from_sub

.subseq_1AD4:
	db !set_volume_l_and_r, $14, $14
	db $99, $03
	db !set_volume_l_and_r, $19, $19
	db $99, $03
	db !set_volume_l_and_r, $1E, $1E
	db $99, $08
	db !set_volume_l_and_r, $17, $17
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $1E, $1E
	db $99, $12
	db !return_from_sub

.seq_1AF0:
	db !play_subsequence : dw .subseq_19B2
.loop_point_1AF3:
	db !echo_off
	db !set_instrument, $21
	db !set_volume_l_and_r, $4A, $4A
	db !change_instr_pitch, $F4
	db !fine_tune, $AE
	db !vibrato_with_delay, $02, $02, $0B, $03
	db !set_adsr, $AE, $94
	db $91, $08
	db $8D, $08
	db $91, $08
	db !loop_subsequence, $02 : dw .subseq_1C04
	db !set_instrument, $22
	db !change_instr_pitch, $F9
	db !fine_tune, $B6
	db !set_adsr, $DE, $A0
	db !loop_subsequence, $01 : dw .subseq_1BAB
	db !set_instrument, $23
	db !change_instr_pitch, $E8
	db !fine_tune, $2A
	db !set_volume_l_and_r, $30, $18
	db !set_adsr, $8E, $E0
	db $99, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $A0, $08
	db $99, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $A5, $08
	db $A3, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $A5, $08
	db $A9, $08
	db $A5, $08
	db $A0, $08
	db $A3, $08
	db $A5, $08
	db $A9, $08
	db $AC, $08
	db $AF, $08
	db $B1, $08
	db !echo_off
	db !set_instrument, $21
	db !set_volume_l_and_r, $4A, $4A
	db !change_instr_pitch, $F4
	db !fine_tune, $AE
	db !vibrato_with_delay, $02, $02, $0B, $03
	db !loop_subsequence, $02 : dw .subseq_1C04
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_volume_l_and_r, $07, $0B
	db !set_adsr, $AB, $95
	db !echo_on
	db !loop_subsequence, $01 : dw .subseq_1B8E
	db $A0, $10
	db $A0, $08
	db !loop_subsequence, $01 : dw .subseq_1B8E
	db !echo_on
	db !jump_to_sequence : dw .loop_point_1AF3
	db !end_sequence

.subseq_1B8E:
	db $A1, $10
	db $A1, $08
	db $A1, $10
	db $A1, $08
	db $A3, $10
	db $A3, $08
	db $A1, $10
	db $A1, $08
	db $A3, $10
	db $A3, $08
	db $A1, $10
	db $A1, $08
	db $A1, $10
	db $A1, $08
	db !return_from_sub

.subseq_1BAB:
	db !set_variable_note_1, $A1
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $A1
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $A0
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9D
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $99
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $A1
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $A1
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !return_from_sub

.subseq_1BF4:
	db !set_volume_l_and_r, $28, $0F
	db $E0, $08
	db !set_volume_l_and_r, $06, $10
	db $E0, $08
	db !set_volume_l_and_r, $07, $03
	db $E0, $08
	db !return_from_sub

.subseq_1C04:
	db !set_adsr, $AE, $B2
	db $92, $18
	db !set_adsr, $AE, $74
	db $92, $08
	db $92, $08
	db $92, $08
	db !set_adsr, $AE, $B2
	db $92, $18
	db !set_adsr, $AE, $74
	db $92, $08
	db $92, $08
	db $92, $08
	db !set_adsr, $AE, $B2
	db $92, $18
	db !set_adsr, $AE, $74
	db $92, $08
	db $92, $08
	db $92, $08
	db !set_adsr, $AE, $B2
	db $92, $18
	db !set_adsr, $AE, $74
	db $91, $08
	db $8D, $08
	db $91, $08
	db !return_from_sub

.seq_1C3D:
	db !play_subsequence : dw .subseq_19B2
	db $80, $18
.loop_point_1C42:
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $0E, $18
	db !vibrato_with_delay, $03, $02, $0A, $01
	db !set_adsr, $8F, $E0
	db !echo_on
	db !loop_subsequence, $02 : dw .subseq_1D12
	db !vibrato_off
	db !set_volume_l_and_r, $18, $30
	db $92, $10
	db $92, $08
	db $95, $10
	db $92, $08
	db $95, $18
	db !set_volume_l_and_r, $11, $0B
	db $95, $10
	db !set_volume_l_and_r, $18, $30
	db $92, $08
	db $91, $10
	db $91, $08
	db $92, $10
	db $94, $08
	db $92, $18
	db $8D, $18
	db $92, $10
	db $92, $08
	db $95, $10
	db $92, $08
	db $95, $18
	db !set_volume_l_and_r, $11, $0B
	db $95, $10
	db !set_volume_l_and_r, $18, $30
	db $92, $08
	db $91, $10
	db $91, $08
	db $92, $10
	db $91, $18
	db $91, $04
	db $91, $04
	db $94, $10
	db $92, $08
	db $91, $10
	db $91, $08
	db $92, $10
	db $94, $18
	db $94, $04
	db $94, $04
	db $95, $10
	db $97, $08
	db !set_volume_l_and_r, $0E, $18
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $02 : dw .subseq_1D12
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $32, $14
	db !set_adsr, $DB, $8A
	db $A1, $10
	db $9E, $08
	db $A1, $10
	db $9E, $08
	db $A3, $08
	db $A1, $08
	db $A0, $08
	db $A1, $10
	db $9E, $08
	db $A3, $08
	db $A1, $08
	db $A0, $08
	db $A1, $10
	db $9E, $08
	db $9E, $08
	db $A0, $08
	db $A1, $08
	db $A0, $18
	db $A1, $10
	db $9E, $08
	db $A1, $10
	db $9E, $08
	db $A3, $08
	db $A1, $08
	db $A0, $08
	db $A1, $10
	db $9E, $08
	db $A6, $08
	db $A5, $08
	db $A3, $08
	db $A5, $10
	db $A1, $08
	db $A1, $08
	db $A3, $08
	db $A5, $08
	db $A3, $18
	db !jump_to_sequence : dw .loop_point_1C42
	db !end_sequence

.subseq_1D12:
	db $80, $18
	db !set_volume_l_and_r, $0E, $18
	db $99, $12
	db !set_volume_l_and_r, $08, $05
	db $99, $06
	db !set_volume_l_and_r, $0E, $18
	db $9A, $18
	db !set_volume_l_and_r, $08, $05
	db $9A, $18
	db !set_volume_l_and_r, $02, $03
	db $9A, $18
	db !set_volume_l_and_r, $0E, $18
	db $99, $12
	db !set_volume_l_and_r, $08, $05
	db $99, $06
	db !set_volume_l_and_r, $0E, $18
	db $97, $18
	db !set_volume_l_and_r, $08, $05
	db $97, $18
	db !return_from_sub

.seq_1D42:
	db !play_subsequence : dw .subseq_19B2
	db $80, $18
.loop_point_1D47:
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $0E, $18
	db !vibrato_with_delay, $02, $01, $08, $01
	db !set_adsr, $8F, $E0
	db !echo_on
	db !loop_subsequence, $02 : dw .subseq_1E43
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $DF, $97
	db $80, $10
	db $A5, $08
	db $80, $10
	db $A5, $08
	db $80, $08
	db $A5, $08
	db $A1, $08
	db $A5, $08
	db $A5, $08
	db $A1, $08
	db $80, $10
	db $A3, $08
	db $80, $10
	db $A3, $08
	db $80, $08
	db $A5, $08
	db $A5, $08
	db $A5, $08
	db $A5, $08
	db $A5, $08
	db $80, $10
	db $A5, $08
	db $80, $10
	db $A5, $08
	db $80, $08
	db $A5, $08
	db $A1, $08
	db $A5, $08
	db $A5, $08
	db $A1, $08
	db $80, $10
	db $A3, $08
	db $80, $10
	db $A3, $08
	db $80, $08
	db $A3, $08
	db $A0, $08
	db $A3, $08
	db $A3, $08
	db $A0, $08
	db $80, $08
	db $A3, $08
	db $A0, $08
	db $A3, $08
	db $A3, $08
	db $A0, $08
	db $A3, $08
	db !echo_off
	db !set_instrument, $21
	db !set_volume_l_and_r, $4A, $4A
	db !change_instr_pitch, $F4
	db !fine_tune, $AE
	db !vibrato_with_delay, $02, $02, $0B, $03
	db !set_adsr, $AE, $94
	db $8D, $08
	db $8D, $08
	db $91, $08
	db $8D, $08
	db $91, $08
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $0E, $18
	db !vibrato_with_delay, $02, $01, $08, $01
	db !set_adsr, $8F, $E0
	db !echo_on
	db !loop_subsequence, $02 : dw .subseq_1E43
	db !set_instrument, $1D
	db !change_instr_pitch, $F3
	db !fine_tune, $03
	db !set_volume_l_and_r, $0A, $11
	db !set_adsr, $8F, $E0
	db $A5, $10
	db $A5, $08
	db $A5, $10
	db $A5, $08
	db $A6, $10
	db $A6, $08
	db $A5, $10
	db $A5, $08
	db $A6, $10
	db $A6, $08
	db $A5, $10
	db $A5, $08
	db $A1, $10
	db $A1, $08
	db $A0, $10
	db $A0, $08
	db $A5, $10
	db $A5, $08
	db $A5, $10
	db $A5, $08
	db $A6, $10
	db $A6, $08
	db $A5, $10
	db $A5, $08
	db $A6, $10
	db $A6, $08
	db $A5, $10
	db $A5, $08
	db $A1, $10
	db $A1, $08
	db $A3, $10
	db $A3, $08
	db !jump_to_sequence : dw .loop_point_1D47
	db !end_sequence

.subseq_1E43:
	db $80, $18
	db !set_volume_l_and_r, $0E, $18
	db $95, $12
	db !set_volume_l_and_r, $08, $05
	db $95, $06
	db !set_volume_l_and_r, $0E, $18
	db $95, $18
	db !set_volume_l_and_r, $08, $05
	db $95, $18
	db !set_volume_l_and_r, $02, $03
	db $95, $18
	db !set_volume_l_and_r, $0E, $18
	db $95, $12
	db !set_volume_l_and_r, $08, $05
	db $95, $06
	db !set_volume_l_and_r, $0E, $18
	db $94, $18
	db !set_volume_l_and_r, $08, $05
	db $94, $18
	db !return_from_sub

.seq_1E73:
	db !play_subsequence : dw .subseq_19B2
	db $80, $18
.loop_point_1E78:
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $0E, $18
	db !vibrato_with_delay, $02, $01, $08, $01
	db !set_adsr, $8F, $E0
	db !echo_on
	db !loop_subsequence, $02 : dw .subseq_1F50
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $DF, $97
	db $80, $10
	db $A1, $08
	db $80, $10
	db $A1, $08
	db $80, $08
	db $A1, $08
	db $9E, $08
	db $A1, $08
	db $A1, $08
	db $9E, $08
	db $80, $10
	db $A0, $08
	db $80, $10
	db $A0, $08
	db $80, $08
	db $A1, $08
	db $A1, $08
	db $A1, $08
	db $A1, $08
	db $A0, $08
	db $80, $10
	db $A1, $08
	db $80, $10
	db $A1, $08
	db $80, $08
	db $A1, $08
	db $9E, $08
	db $A1, $08
	db $A1, $08
	db $9E, $08
	db $80, $10
	db $A0, $08
	db $80, $10
	db $A0, $08
	db $80, $08
	db $A0, $08
	db $9D, $08
	db $A0, $08
	db $A0, $08
	db $9D, $08
	db $80, $08
	db $A0, $08
	db $9D, $08
	db $A0, $08
	db $A0, $08
	db $9D, $08
	db $A0, $08
	db $80, $10
	db $80, $18
	db !set_volume_l_and_r, $0E, $18
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $02 : dw .subseq_1F50
	db !set_instrument, $1D
	db !change_instr_pitch, $F3
	db !fine_tune, $03
	db !set_volume_l_and_r, $0A, $11
	db !set_adsr, $8F, $E0
	db $A1, $10
	db $A1, $08
	db $A1, $10
	db $A1, $08
	db $A3, $10
	db $A3, $08
	db $A1, $10
	db $A1, $08
	db $A3, $10
	db $A3, $08
	db $A1, $10
	db $A1, $08
	db $9E, $10
	db $9E, $08
	db $9D, $10
	db $9D, $08
	db $A1, $10
	db $A1, $08
	db $A1, $10
	db $A1, $08
	db $A3, $10
	db $A3, $08
	db $A1, $10
	db $A1, $08
	db $A3, $10
	db $A3, $08
	db $A1, $10
	db $A1, $08
	db $9E, $10
	db $9E, $08
	db $9D, $10
	db $9D, $08
	db !jump_to_sequence : dw .loop_point_1E78
	db !end_sequence

.subseq_1F50:
	db $80, $18
	db !set_volume_l_and_r, $0E, $18
	db $92, $12
	db !set_volume_l_and_r, $08, $05
	db $92, $06
	db !set_volume_l_and_r, $0E, $18
	db $92, $18
	db !set_volume_l_and_r, $08, $05
	db $92, $18
	db !set_volume_l_and_r, $02, $03
	db $92, $18
	db !set_volume_l_and_r, $0E, $18
	db $92, $12
	db !set_volume_l_and_r, $08, $05
	db $92, $06
	db !set_volume_l_and_r, $0E, $18
	db $91, $18
	db !set_volume_l_and_r, $08, $05
	db $91, $18
	db !return_from_sub

.seq_1F80:
	db !play_subsequence : dw .subseq_19B2
	db $80, $18
.loop_point_1F85:
	db !set_instrument, $23
	db !change_instr_pitch, $00
	db !fine_tune, $2A
	db !set_volume_l_and_r, $0E, $08
	db !set_adsr, $AF, $8B
	db !echo_on
	db !loop_subsequence, $02 : dw .subseq_2011
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $21, $12
	db !set_adsr, $88, $E3
	db $95, $60
	db $94, $30
	db $95, $30
	db $95, $60
	db $94, $30
	db $94, $30
	db $94, $60
	db !set_instrument, $23
	db !change_instr_pitch, $00
	db !fine_tune, $2A
	db !echo_on
	db !set_volume_l_and_r, $0E, $08
	db !set_adsr, $AF, $8B
	db !loop_subsequence, $02 : dw .subseq_2011
	db !set_instrument, $1D
	db !change_instr_pitch, $F3
	db !fine_tune, $03
	db !set_volume_l_and_r, $0A, $11
	db !set_adsr, $8F, $E0
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9A, $10
	db $9A, $08
	db $99, $10
	db $99, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9A, $10
	db $9A, $08
	db $99, $10
	db $99, $08
	db !jump_to_sequence : dw .loop_point_1F85
	db !end_sequence

.subseq_2011:
	db $99, $08
	db $99, $08
	db $95, $08
	db $99, $08
	db $99, $08
	db $95, $08
	db $9A, $08
	db $9A, $08
	db $95, $08
	db $9A, $08
	db $9A, $08
	db $95, $08
	db $99, $08
	db $99, $08
	db $95, $08
	db $99, $08
	db $99, $08
	db $95, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db !return_from_sub

.seq_2042:
	db !play_subsequence : dw .subseq_19B2
	db $80, $18
.loop_point_2047:
	db !set_instrument, $23
	db !change_instr_pitch, $00
	db !fine_tune, $2A
	db !echo_on
	db !set_volume_l_and_r, $0E, $08
	db !set_adsr, $AF, $8B
	db !loop_subsequence, $02 : dw .subseq_20F4
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $21, $12
	db !set_adsr, $88, $E3
	db $92, $60
	db $91, $30
	db $92, $30
	db $92, $60
	db $91, $30
	db $91, $30
	db $91, $60
	db !set_instrument, $23
	db !change_instr_pitch, $00
	db !fine_tune, $2A
	db !echo_on
	db !set_volume_l_and_r, $0E, $08
	db !set_adsr, $AF, $8B
	db !loop_subsequence, $02 : dw .subseq_20F4
	db !echo_on
	db !set_instrument, $24
	db !set_volume_l_and_r, $21, $0B
	db !change_instr_pitch, $0C
	db !fine_tune, $AB
	db !set_adsr, $DF, $75
	db $A1, $08
	db $9E, $08
	db $99, $08
	db $A1, $08
	db $9E, $08
	db $99, $08
	db $A3, $08
	db $9E, $08
	db $9A, $08
	db $A1, $08
	db $9E, $08
	db $99, $08
	db $A3, $08
	db $9E, $08
	db $9A, $08
	db $A1, $08
	db $9E, $08
	db $99, $08
	db $A1, $08
	db $9E, $08
	db $9A, $08
	db $A3, $08
	db $A0, $08
	db $9D, $08
	db $A1, $08
	db $9E, $08
	db $99, $08
	db $A1, $08
	db $9E, $08
	db $99, $08
	db $A3, $08
	db $9E, $08
	db $9A, $08
	db $A1, $08
	db $9E, $08
	db $99, $08
	db $A3, $08
	db $9E, $08
	db $9A, $08
	db $A1, $08
	db $9E, $08
	db $99, $08
	db $A1, $08
	db $9E, $08
	db $9A, $08
	db $99, $08
	db $9D, $08
	db $A0, $08
	db !jump_to_sequence : dw .loop_point_2047
	db !end_sequence

.subseq_20F4:
	db $95, $08
	db $95, $08
	db $92, $08
	db $95, $08
	db $95, $08
	db $92, $08
	db $95, $08
	db $95, $08
	db $92, $08
	db $95, $08
	db $95, $08
	db $92, $08
	db $95, $08
	db $95, $08
	db $92, $08
	db $95, $08
	db $95, $08
	db $92, $08
	db $94, $08
	db $94, $08
	db $91, $08
	db $94, $08
	db $94, $08
	db $91, $08
	db !return_from_sub

.seq_2125:
	db !play_subsequence : dw .subseq_19B2
	db $80, $18
.loop_point_212A:
	db $80, $08
	db !echo_on
	db !loop_subsequence, $01 : dw .subseq_222F
	db $8D, $08
	db !loop_subsequence, $01 : dw .subseq_222F
	db !set_instrument, $22
	db !change_instr_pitch, $F9
	db !fine_tune, $B6
	db !set_adsr, $DE, $A0
	db !loop_subsequence, $01 : dw .subseq_21E6
	db !set_instrument, $23
	db !change_instr_pitch, $E8
	db !fine_tune, $2A
	db !set_volume_l_and_r, $0A, $15
	db !set_adsr, $8E, $E0
	db $80, $0A
	db $99, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $A0, $08
	db $99, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $A5, $08
	db $A3, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $A5, $08
	db $A9, $08
	db $A5, $08
	db $A0, $08
	db $A3, $08
	db $A5, $08
	db $A9, $08
	db $AC, $08
	db $AF, $08
	db $B1, $06
	db !loop_subsequence, $01 : dw .subseq_222F
	db $8D, $08
	db !loop_subsequence, $01 : dw .subseq_222F
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $08, $11
	db !set_adsr, $DB, $8A
	db $80, $0A
	db $A1, $10
	db $9E, $08
	db $A1, $10
	db $9E, $08
	db $A3, $08
	db $A1, $08
	db $A0, $08
	db $A1, $10
	db $9E, $08
	db $A3, $08
	db $A1, $08
	db $A0, $08
	db $A1, $10
	db $9E, $08
	db $9E, $08
	db $A0, $08
	db $A1, $08
	db $A0, $18
	db $A1, $10
	db $9E, $08
	db $A1, $10
	db $9E, $08
	db $A3, $08
	db $A1, $08
	db $A0, $08
	db $A1, $10
	db $9E, $08
	db $A6, $08
	db $A5, $08
	db $A3, $08
	db $A5, $10
	db $A1, $08
	db $A1, $08
	db $A3, $08
	db $A5, $08
	db $A3, $0E
	db !jump_to_sequence : dw .loop_point_212A
	db !end_sequence

.subseq_21E6:
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $99
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $99
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9D
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $99
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $99
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $95
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $99
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $9E
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !set_variable_note_1, $99
	db !loop_subsequence, $01 : dw .subseq_1BF4
	db !return_from_sub

.subseq_222F:
	db !set_instrument, $A3
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $EF, $72
	db !set_volume_l_and_r, $0B, $11
	db $92, $08
	db $95, $08
	db $99, $08
	db $95, $08
	db $92, $08
	db $9A, $0F
	db !set_instrument, $24
	db !set_volume_l_and_r, $21, $0B
	db !change_instr_pitch, $18
	db !fine_tune, $AB
	db !set_adsr, $DF, $72
	db $92, $03
	db $95, $03
	db $99, $03
	db $9A, $06
	db $99, $06
	db $95, $06
	db $92, $06
	db $8D, $08
	db !set_instrument, $A3
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $EF, $72
	db !set_volume_l_and_r, $0B, $11
	db $92, $08
	db $95, $08
	db $99, $08
	db $95, $08
	db $92, $08
	db $94, $0F
	db !set_instrument, $24
	db !set_volume_l_and_r, $21, $0B
	db !set_adsr, $DF, $72
	db !change_instr_pitch, $18
	db !fine_tune, $AB
	db $8D, $03
	db $91, $03
	db $94, $03
	db $97, $06
	db $94, $06
	db $91, $06
	db $8D, $06
	db !return_from_sub

base off
arch 65816
.end: