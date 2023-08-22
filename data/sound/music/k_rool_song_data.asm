;1F Crocodile Cacophony
;32D64B
k_rool_song_data:
	dw !bgm_loc, $0821
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1985, .seq_1A57, .seq_1C23, .seq_223E, .seq_1E6D, .seq_1F66, .seq_20B4, .seq_1D4F
	db $C8, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131A	;01: 
	dw .chn_ptrs_132C	;02: 
	dw .chn_ptrs_133E	;03: 

;sub-track 01 channel pointers
.chn_ptrs_131A:
	dw .seq_1350, .seq_13B3, .seq_13DE, .seq_1405, .seq_1413, .seq_1420, .seq_1432, .seq_1444
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132C:
	dw .seq_169B, .seq_1723, .seq_17FD, .seq_1857, .seq_16F3, .seq_1948, .seq_191B, .seq_17A6
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_133E:
	dw .seq_14AB, .seq_1513, .seq_155E, .seq_15DB, .seq_14E9, .seq_1619, .seq_165A, .seq_15FA
	db $C0, $FF	;music tempo, sound effect tempo

.seq_1350:
	db !play_subsequence : dw .subseq_1977
	db !play_subsequence : dw .subseq_1C16
	db !play_subsequence : dw .subseq_1C16
	db !echo_on
	db !set_volume_l_and_r, $1E, $46
	db !set_default_duration, $08
	db $97
	db $97
	db !set_volume_l_and_r, $50, $1E
	db $94
	db !set_volume_l_and_r, $0A, $1E
	db $94
	db !set_volume_l_and_r, $50, $1E
	db $94
	db !default_duration_off
	db !set_volume_l_and_r, $0A, $1E
	db $94, $18
	db !set_volume_l_and_r, $14, $32
	db !set_default_duration, $08
	db $97
	db $97
	db !set_volume_l_and_r, $50, $1E
	db $93
	db !set_volume_l_and_r, $0A, $1E
	db $93
	db !set_volume_l_and_r, $50, $1E
	db $95
	db !set_volume_l_and_r, $0A, $1E
	db $95
	db !set_volume_l_and_r, $1E, $50
	db $98
	db !set_volume_l_and_r, $1E, $0A
	db $98
	db !set_volume_l_and_r, $1E, $50
	db $96
	db !default_duration_off
	db !set_volume_l_and_r, $1E, $0A
	db $96, $18
	db !set_volume_l_and_r, $28, $50
	db !set_default_duration, $08
	db $98
	db $98
	db !set_volume_l_and_r, $46, $32
	db $96
	db $96
	db !set_volume_l_and_r, $5A, $1E
	db $94
	db $94
	db !default_duration_off
	db !set_vol_single_val, $46
	db $92, $20
	db !end_sequence

.seq_13B3:
	db !echo_off
	db !set_instrument, $21
	db !vibrato_with_delay, $02, $02, $0B, $08
	db !set_vol_single_val, $50
	db !change_instr_pitch, $00
	db !fine_tune, $AE
	db !set_adsr, $CE, $D3
	db $80, $10
	db $8B, $10
	db $8B, $30
	db $8B, $10
	db $8E, $10
	db $95, $10
	db $91, $20
	db !set_default_duration, $08
	db $91
	db $91
	db $91
	db $91
	db $91
	db $91
	db !default_duration_off
	db $91, $30
	db !end_sequence

.seq_13DE:
	db !set_volume_l_and_r, $11, $21
	db !vibrato_with_delay, $02, $01, $03, $01
.loop_point_13E6:
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_adsr, $8F, $E8
	db !echo_on
	db $9E, $08
	db $A0, $08
	db $A1, $10
	db $A0, $20
	db $9E, $08
	db $9A, $08
	db $97, $10
	db $9A, $10
	db $A1, $10
	db $A0, $50
	db !end_sequence

.seq_1405:
	db $80, $0E
	db !vibrato_with_delay, $03, $02, $0B, $05
	db !set_volume_l_and_r, $10, $08
	db !jump_to_sequence : dw .loop_point_13E6
	db !end_sequence

.seq_1413:
	db !play_subsequence : dw .subseq_1C0C
	db $80, $10
	db !set_variable_note_1, $97
	db !set_variable_note_2, $98
	db !play_subsequence : dw .subseq_1456
	db !end_sequence

.seq_1420:
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $1E, $0F
	db $97, $08
	db $97, $08
	db !set_variable_note_1, $9A
	db !set_variable_note_2, $9D
	db !play_subsequence : dw .subseq_1456
	db !end_sequence

.seq_1432:
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $1E, $0F
	db $9A, $08
	db $9A, $08
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $A0
	db !play_subsequence : dw .subseq_1456
	db !end_sequence

.seq_1444:
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $1E, $0F
	db $9E, $08
	db $A0, $08
	db !set_variable_note_1, $A1
	db !set_variable_note_2, $A3
	db !play_subsequence : dw .subseq_1456
	db !end_sequence

.subseq_1456:
	db !set_default_duration, $08
	db !set_volume_l_and_r, $1E, $0F
	db $E0
	db $E0
	db $E0
	db $E0
	db !set_volume_l_and_r, $08, $10
	db $E0
	db !set_volume_l_and_r, $04, $08
	db $E0
	db !set_volume_l_and_r, $28, $14
	db $E0
	db $E0
	db !loop_subsequence, $03 : dw .subseq_1498
	db !set_volume_l_and_r, $1E, $0F
	db $E1
	db !set_volume_l_and_r, $08, $10
	db $E1
	db !set_volume_l_and_r, $04, $08
	db $E1
	db !set_volume_l_and_r, $02, $04
	db $E1
	db !set_volume_l_and_r, $1E, $0F
	db $E1
	db $E1
	db $E1
	db $E1
	db $E1
	db $E1
	db $E1
	db !set_volume_l_and_r, $08, $10
	db $E1
	db !set_volume_l_and_r, $04, $08
	db $E1
	db !set_volume_l_and_r, $02, $04
	db $E1
	db !default_duration_off
	db !return_from_sub

.subseq_1498:
	db !set_volume_l_and_r, $1E, $0F
	db $E0
	db !set_volume_l_and_r, $08, $10
	db $E0
	db !return_from_sub

.subseq_14A1:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_adsr, $8C, $E0
	db !return_from_sub

.seq_14AB:
	db !play_subsequence : dw .subseq_1977
	db !play_subsequence : dw .subseq_14A1
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_14D8
.loop_point_14C7:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_14C7

.subseq_14D8:
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

.seq_14E9:
	db !play_subsequence : dw .subseq_14A1
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
.loop_point_150C:
	db $99, $08
	db $99, $08
	db !jump_to_sequence : dw .loop_point_150C

.seq_1513:
	db !play_subsequence : dw .subseq_14A1
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
.loop_point_153A:
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
	db !jump_to_sequence : dw .loop_point_153A
	db !end_sequence

.seq_155E:
	db !play_subsequence : dw .subseq_14A1
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1579
	db !end_sequence

.subseq_1579:
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

.seq_15DB:
	db !play_subsequence : dw .subseq_14A1
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
	db !play_subsequence : dw .subseq_1579
	db !end_sequence

.seq_15FA:
	db !play_subsequence : dw .subseq_14A1
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
	db !play_subsequence : dw .subseq_1579
	db !end_sequence

.seq_1619:
	db !play_subsequence : dw .subseq_14A1
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db $80, $08
	db $80, $40
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $32, $50
	db !set_adsr, $AF, $92
	db !echo_on
.loop_point_1637:
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
	db !jump_to_sequence : dw .loop_point_1637

.seq_165A:
	db !play_subsequence : dw .subseq_14A1
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db $80, $08
	db $80, $40
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $32, $50
	db !set_adsr, $AF, $92
	db !echo_on
.loop_point_1678:
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
	db !jump_to_sequence : dw .loop_point_1678

.seq_169B:
	db !play_subsequence : dw .subseq_1977
	db !play_subsequence : dw .subseq_14A1
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_16B8
	db !end_sequence

.subseq_16B8:
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

.seq_16F3:
	db !play_subsequence : dw .subseq_14A1
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
	db !loop_subsequence, $0C : dw .subseq_1714
	db !default_duration_off
	db !end_sequence

.subseq_1714:
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

.seq_1723:
	db !play_subsequence : dw .subseq_14A1
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_173A
	db !end_sequence

.subseq_173A:
	db !play_subsequence : dw .subseq_1747
	db !play_subsequence : dw .subseq_1784
	db !play_subsequence : dw .subseq_1747
	db !play_subsequence : dw .subseq_1795
	db !return_from_sub

.subseq_1747:
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

.subseq_1784:
	db !set_instrument, $08
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_1795:
	db !set_instrument, $06
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_17A6:
	db !play_subsequence : dw .subseq_14A1
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_17C2
	db !end_sequence

.subseq_17C2:
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

.seq_17FD:
	db !play_subsequence : dw .subseq_14A1
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
	db !loop_subsequence, $02 : dw .subseq_1832
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_1832
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1832
	db !end_sequence

.subseq_1832:
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

.seq_1857:
	db !play_subsequence : dw .subseq_14A1
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_18D2
	db !play_subsequence : dw .subseq_18B0
	db !echo_on
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_1882
	db !end_sequence

.subseq_1882:
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

.subseq_18B0:
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
.subseq_18D2:
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

.seq_191B:
	db !play_subsequence : dw .subseq_14A1
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
	db !play_subsequence : dw .subseq_18D2
	db !play_subsequence : dw .subseq_18B0
	db !echo_on
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_1882
	db !end_sequence

.seq_1948:
	db !play_subsequence : dw .subseq_14A1
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
	db !play_subsequence : dw .subseq_18D2
	db !play_subsequence : dw .subseq_18B0
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_1882
	db !end_sequence

.subseq_1974:
	db $80, $10
	db !return_from_sub

.subseq_1977:
	db !set_echo, $32, $1E, $1E
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.seq_1985:
	db !echo_delay, $06
	db !play_subsequence : dw .subseq_1974
	db !set_master_volume_indirect, $5A
	db !play_subsequence : dw .subseq_1977
.loop_point_198F:
	db !set_instrument, $A2
	db !change_instr_pitch, $F0
	db !fine_tune, $F6
	db !set_vol_single_val, $3C
	db !set_adsr, $88, $C0
	db !long_duration_on
	db $83, $02, $00
	db !long_duration_off
	db !echo_off
	db !set_instrument, $21
	db !vibrato_with_delay, $02, $02, $0B, $08
	db !set_vol_single_val, $3C
	db !change_instr_pitch, $00
	db !fine_tune, $AE
	db !set_adsr, $CE, $91
	db !loop_subsequence, $20 : dw .subseq_1A54
	db !set_vol_single_val, $50
	db !loop_subsequence, $01 : dw .subseq_1A4E
	db !loop_subsequence, $01 : dw .subseq_1A48
	db !loop_subsequence, $01 : dw .subseq_1A4E
	db !loop_subsequence, $01 : dw .subseq_1A42
	db !set_volume_l_and_r, $3C, $28
	db !loop_subsequence, $01 : dw .subseq_19F3
	db !echo_off
	db !set_instrument, $21
	db !vibrato_with_delay, $02, $02, $0B, $08
	db !set_vol_single_val, $3C
	db !change_instr_pitch, $00
	db !fine_tune, $AE
	db !set_adsr, $CE, $91
	db !loop_subsequence, $14 : dw .subseq_19EA
	db !loop_subsequence, $08 : dw .subseq_1A54
	db !jump_to_sequence : dw .loop_point_198F
	db !end_sequence

.subseq_19EA:
	db !set_vol_single_val, $50
	db $88, $10
	db !set_vol_single_val, $32
	db $88, $10
	db !return_from_sub

.subseq_19F3:
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_adsr, $8F, $E0
	db !vibrato_with_delay, $02, $01, $08, $03
	db !play_subsequence : dw .subseq_1A20
	db $94, $18
	db $94, $08
	db $92, $10
	db $94, $10
	db $96, $10
	db $92, $10
	db $8F, $20
	db !play_subsequence : dw .subseq_1A20
	db $94, $10
	db $94, $10
	db $92, $10
	db $91, $10
	db $8F, $40
	db !return_from_sub

.subseq_1A20:
	db $8F, $18
	db $8F, $08
	db $92, $10
	db $94, $10
	db $96, $20
	db $80, $10
	db $92, $10
	db !return_from_sub

.subseq_1A2F:
	db $88, $08
	db $88, $08
	db $88, $08
	db $88, $08
	db $8B, $10
	db $88, $08
	db $80, $18
	db $88, $08
	db $88, $08
	db !return_from_sub

.subseq_1A42:
	db !play_subsequence : dw .subseq_1A2F
	db $8A, $20
	db !return_from_sub

.subseq_1A48:
	db !play_subsequence : dw .subseq_1A2F
	db $87, $20
	db !return_from_sub

.subseq_1A4E:
	db !play_subsequence : dw .subseq_1A2F
	db $8B, $20
	db !return_from_sub

.subseq_1A54:
	db $88, $20
	db !return_from_sub

.seq_1A57:
	db !play_subsequence : dw .subseq_1974
.loop_point_1A5A:
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $CF, $53
	db !loop_subsequence, $08 : dw .subseq_1C03
	db !loop_subsequence, $08 : dw .subseq_1B95
	db !loop_subsequence, $03 : dw .subseq_1B66
	db !loop_subsequence, $01 : dw .subseq_1B41
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $30
	db !play_subsequence : dw .subseq_1C16
	db !set_default_duration, $10
	db !set_volume_l_and_r, $14, $3C
	db $99
	db !set_volume_l_and_r, $1E, $32
	db $97
	db !set_volume_l_and_r, $28, $28
	db $95
	db !set_volume_l_and_r, $32, $1E
	db $93
	db !set_volume_l_and_r, $3C, $14
	db $91
	db !default_duration_off
	db !loop_subsequence, $01 : dw .subseq_1AA4
	db !loop_subsequence, $01 : dw .subseq_1AF2
	db !loop_subsequence, $02 : dw .subseq_1AA4
	db !jump_to_sequence : dw .loop_point_1A5A
	db !end_sequence

.subseq_1AA4:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $10
	db $96, $10
	db !echo_on
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $10
	db $96, $08
	db !echo_on
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $14, $3C
	db $99, $08
	db $97, $08
	db !set_volume_l_and_r, $1E, $0A
	db $97, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $3C, $14
	db $93, $08
	db !set_volume_l_and_r, $08, $18
	db $93, $08
.subseq_1AF2:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $10
	db $96, $10
	db !echo_on
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $10
	db $96, $08
	db !echo_on
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $14, $3C
	db $99, $08
	db $97, $08
	db !set_volume_l_and_r, $1E, $0A
	db $97, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $32, $1E
	db $93, $08
	db !set_volume_l_and_r, $3C, $14
	db $91, $08
	db !return_from_sub

.subseq_1B41:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $08
	db $96, $10
	db $96, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $20
	db !set_vol_single_val, $7F
	db !set_adsr, $83, $E1
	db $9E, $20
	db !set_adsr, $DF, $71
	db $9E, $20
	db !echo_on
	db !return_from_sub

.subseq_1B66:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $08
	db $96, $10
	db $96, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $30
	db !echo_on
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $08
	db $96, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $20
	db !echo_on
	db !return_from_sub

.subseq_1B95:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $08
	db !echo_on
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $14, $3C
	db $99, $08
	db !set_volume_l_and_r, $1E, $32
	db $97, $08
	db !set_volume_l_and_r, $28, $28
	db $95, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $32, $1E
	db $93, $08
	db !set_volume_l_and_r, $3C, $14
	db $91, $08
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $96, $08
	db !echo_on
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $14, $3C
	db $99, $10
	db !set_volume_l_and_r, $1E, $32
	db $97, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $6E
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $32, $1E
	db $93, $08
	db !set_volume_l_and_r, $3C, $14
	db $91, $08
	db !return_from_sub

.subseq_1C03:
	db $9E, $10
	db $9E, $10
	db $9E, $10
	db $9E, $10
	db !return_from_sub

.subseq_1C0C:
	db !set_instrument, $BE
	db !change_instr_pitch, $FC
	db !fine_tune, $1E
	db !set_adsr, $8F, $E0
	db !return_from_sub

.subseq_1C16:
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $64, $3C
	db !set_adsr, $AF, $C8
	db !return_from_sub

.seq_1C23:
	db !play_subsequence : dw .subseq_1974
	db !echo_on
.loop_point_1C27:
	db !play_subsequence : dw .subseq_1CBC
	db !play_subsequence : dw .subseq_1C0C
	db !set_variable_note_1, $A3
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db !set_variable_note_1, $A2
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db !set_variable_note_1, $A3
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db !set_variable_note_1, $A2
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $19, $0F
	db !loop_subsequence, $02 : dw .subseq_1C9B
	db !change_instr_pitch_rel, $F9
	db !loop_subsequence, $01 : dw .subseq_1C9B
	db $A2, $10
	db $A2, $20
	db $A2, $10
	db $A2, $08
	db $A2, $08
	db $A2, $20
	db $A2, $10
	db !change_instr_pitch_rel, $07
	db !set_variable_note_1, $A2
	db !play_subsequence : dw .subseq_1C7A
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1C27
	db !end_sequence

.subseq_1C7A:
	db $E0, $10
	db $E0, $20
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db $E0, $20
	db $E0, $10
	db $E0, $10
	db $E0, $20
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db !return_from_sub

.subseq_1C9B:
	db $A2, $10
	db $A2, $20
	db $A2, $10
	db $A2, $08
	db $A2, $08
	db $A2, $20
	db $A2, $10
	db $A0, $10
	db $A0, $20
	db $A0, $10
	db $A2, $08
	db $A2, $08
	db $A2, $10
	db $A2, $10
	db $A2, $08
	db $A2, $08
	db !return_from_sub

.subseq_1CBC:
	db !play_subsequence : dw .subseq_1C16
	db $8E, $40
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $19, $0F
	db $96, $08
	db !set_volume_l_and_r, $05, $08
	db $96, $10
	db !set_volume_l_and_r, $19, $0F
	db $97, $08
	db !set_volume_l_and_r, $05, $08
	db $97, $10
	db !set_volume_l_and_r, $19, $0F
	db $98, $08
	db !set_volume_l_and_r, $05, $08
	db $98, $08
	db !play_subsequence : dw .subseq_1C16
	db $8E, $40
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $19, $0F
	db $99, $08
	db !set_volume_l_and_r, $05, $08
	db $99, $10
	db !set_volume_l_and_r, $19, $0F
	db $9A, $08
	db !set_volume_l_and_r, $05, $08
	db $9A, $10
	db !set_volume_l_and_r, $19, $0F
	db $9B, $08
	db $9B, $08
	db !play_subsequence : dw .subseq_1C16
	db $8E, $40
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $19, $0F
	db $98, $08
	db !set_volume_l_and_r, $05, $08
	db $98, $10
	db !set_volume_l_and_r, $19, $0F
	db $99, $08
	db !set_volume_l_and_r, $05, $08
	db $99, $10
	db !set_volume_l_and_r, $19, $0F
	db $9A, $08
	db !set_volume_l_and_r, $05, $08
	db $9A, $08
	db !play_subsequence : dw .subseq_1C16
	db $8E, $40
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $19, $0F
	db $9B, $08
	db !set_volume_l_and_r, $05, $08
	db $9B, $10
	db !set_volume_l_and_r, $19, $0F
	db $9C, $08
	db !set_volume_l_and_r, $05, $08
	db $9C, $10
	db !set_volume_l_and_r, $19, $0F
	db $9D, $08
	db $9D, $08
	db !return_from_sub

.seq_1D4F:
	db !play_subsequence : dw .subseq_1974
.loop_point_1D52:
	db !play_subsequence : dw .subseq_1DF5
	db !play_subsequence : dw .subseq_1C0C
	db !set_variable_note_1, $A0
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db !set_variable_note_1, $9F
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db !set_variable_note_1, $A0
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db !set_variable_note_1, $9F
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $19, $0F
	db !loop_subsequence, $02 : dw .subseq_1DA5
	db !change_instr_pitch_rel, $05
	db !loop_subsequence, $01 : dw .subseq_1DA5
	db $9E, $10
	db $9E, $20
	db $9E, $10
	db $9B, $08
	db $9B, $08
	db $9B, $20
	db $9B, $10
	db !change_instr_pitch_rel, $FB
	db !set_variable_note_1, $9F
	db !play_subsequence : dw .subseq_1C7A
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1D52
	db !end_sequence

.subseq_1DA5:
	db $9E, $10
	db $9E, $20
	db $9E, $10
	db $9B, $08
	db $9B, $08
	db $9B, $20
	db $9B, $10
	db $9D, $10
	db $9D, $20
	db $9D, $10
	db $9E, $08
	db $9E, $08
	db $9E, $10
	db $9E, $10
	db $9E, $08
	db $9E, $08
	db !return_from_sub

.subseq_1DC6:
	db !set_default_duration, $08
	db !set_volume_l_and_r, $19, $0F
	db $E0
	db $E0
	db $E0
	db !set_volume_l_and_r, $05, $08
	db $E0
	db !set_volume_l_and_r, $19, $0F
	db $E0
	db !set_volume_l_and_r, $05, $08
	db $E0
	db !set_volume_l_and_r, $19, $0F
	db $E0
	db $E0
	db $E0
	db $E0
	db !set_volume_l_and_r, $05, $08
	db $E0
	db !set_volume_l_and_r, $19, $0F
	db $E0
	db $E0
	db !set_volume_l_and_r, $05, $08
	db $E0
	db !set_volume_l_and_r, $19, $0F
	db $E0
	db $E0
	db !default_duration_off
	db !return_from_sub

.subseq_1DF5:
	db !play_subsequence : dw .subseq_1C16
	db $80, $08
	db $8E, $38
	db !play_subsequence : dw .subseq_1C0C
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1E4E
	db !play_subsequence : dw .subseq_1C16
	db $80, $08
	db $8E, $38
	db !play_subsequence : dw .subseq_1C0C
	db !set_variable_note_1, $95
	db !play_subsequence : dw .subseq_1E32
	db $E0, $08
	db !play_subsequence : dw .subseq_1C16
	db $8E, $38
	db !play_subsequence : dw .subseq_1C0C
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1E4E
	db !play_subsequence : dw .subseq_1C16
	db $80, $08
	db $8E, $38
	db !play_subsequence : dw .subseq_1C0C
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1E32
	db !return_from_sub

.subseq_1E32:
	db !set_volume_l_and_r, $19, $0F
	db $E0, $08
	db !set_volume_l_and_r, $05, $08
	db $E0, $10
	db !set_volume_l_and_r, $19, $0F
	db $E0, $08
	db !set_volume_l_and_r, $05, $08
	db $E0, $10
	db !set_volume_l_and_r, $19, $0F
	db $E0, $08
	db $E0, $08
	db !return_from_sub

.subseq_1E4E:
	db !set_volume_l_and_r, $19, $0F
	db $E0, $08
	db !set_volume_l_and_r, $05, $08
	db $E0, $10
	db !set_volume_l_and_r, $19, $0F
	db $E0, $08
	db !set_volume_l_and_r, $05, $08
	db $E0, $10
	db !set_volume_l_and_r, $19, $0F
	db $E0, $08
	db !set_volume_l_and_r, $05, $08
	db $E0, $08
	db !return_from_sub

.seq_1E6D:
	db !play_subsequence : dw .subseq_1974
	db !set_instrument, $96
	db !fine_tune, $D6
	db !set_adsr, $CE, $B6
.loop_point_1E77:
	db !change_instr_pitch, $12
	db !loop_subsequence, $10 : dw .subseq_1F4A
	db !change_instr_pitch_rel, $05
	db !loop_subsequence, $20 : dw .subseq_1F4A
	db !loop_subsequence, $10 : dw .subseq_1F4A
	db !change_instr_pitch_rel, $FB
	db !set_adsr, $CE, $F6
	db !loop_subsequence, $10 : dw .subseq_1F4A
	db !set_volume_l_and_r, $1E, $14
	db !play_subsequence : dw .subseq_1EB4
	db !pitch_slide_up, $00, $01, $08, $2C, $01
	db !set_instrument, $CF
	db $A5, $20
	db !pitch_slide_off
	db !set_instrument, $96
	db !fine_tune, $D6
	db !set_adsr, $CE, $B6
	db !change_instr_pitch, $12
	db !change_instr_pitch_rel, $05
	db !loop_subsequence, $08 : dw .subseq_1F4A
	db !jump_to_sequence : dw .loop_point_1E77
	db !end_sequence

.subseq_1EB4:
	db !set_instrument, $CE
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !echo_on
	db !set_adsr, $8E, $E7
	db !vibrato_with_delay, $03, $03, $12, $04
	db $80, $10
	db !pitch_slide_up, $00, $01, $08, $2C, $01
	db $A5, $20
	db $A5, $10
	db !set_instrument, $CF
	db $A5, $30
	db !pitch_slide_off
	db !set_instrument, $CE
	db $A5, $08
	db !set_instrument, $CF
	db $A3, $08
	db !set_instrument, $CE
	db $A2, $20
	db !set_instrument, $CF
	db $A3, $10
	db $A2, $10
	db !set_instrument, $CE
	db $A3, $10
	db !set_instrument, $CF
	db $A2, $10
	db !set_instrument, $CE
	db $A0, $30
	db !pitch_slide_up, $00, $01, $08, $2C, $01
	db $A5, $20
	db !set_instrument, $CF
	db $A5, $10
	db !set_instrument, $CE
	db $A5, $30
	db !pitch_slide_off
	db $A5, $08
	db !set_instrument, $CF
	db $A3, $08
	db !set_instrument, $CE
	db $A2, $16
	db $80, $02
	db $A2, $08
	db !set_instrument, $CF
	db $A3, $10
	db $A2, $20
	db $80, $10
	db !pitch_slide_up, $00, $01, $07, $2F, $01
	db !set_instrument, $CE
	db $A3, $10
	db !pitch_slide_off
	db !set_instrument, $CF
	db $A3, $10
	db !set_instrument, $CE
	db $A2, $16
	db $80, $02
	db $A2, $08
	db !set_instrument, $CF
	db $A3, $10
	db !pitch_slide_up, $00, $01, $07, $2F, $01
	db !set_instrument, $CE
	db $A3, $1C
	db $80, $04
	db !pitch_slide_off
	db !set_instrument, $CE
	db $A2, $08
	db !set_instrument, $CF
	db $A3, $08
	db !return_from_sub

.subseq_1F4A:
	db !set_default_duration, $08
	db !set_volume_l_and_r, $1E, $32
	db !fine_tune, $D6
	db $83
	db !set_volume_l_and_r, $3C, $14
	db !fine_tune, $D2
	db $83
	db !set_volume_l_and_r, $32, $1E
	db !fine_tune, $DA
	db $83
	db !set_volume_l_and_r, $14, $3C
	db !fine_tune, $D0
	db $83
	db !default_duration_off
	db !return_from_sub

.seq_1F66:
	db !play_subsequence : dw .subseq_1974
	db !echo_on
.loop_point_1F6A:
	db !play_subsequence : dw .subseq_1C0C
	db !play_subsequence : dw .subseq_2034
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_variable_note_1, $97
	db !loop_subsequence, $01 : dw .subseq_1FAC
	db !set_variable_note_1, $96
	db !loop_subsequence, $01 : dw .subseq_1FAC
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $0E
	db !set_volume_l_and_r, $0B, $17
	db !loop_subsequence, $01 : dw .subseq_19F3
	db !set_volume_l_and_r, $07, $0B
	db !play_subsequence : dw .subseq_1EB4
	db !pitch_slide_up, $00, $01, $08, $2C, $01
	db !set_instrument, $CF
	db $A5, $A0
	db $80, $72
	db !pitch_slide_off
	db !jump_to_sequence : dw .loop_point_1F6A
	db !end_sequence

.subseq_1FAC:
	db $80, $01
	db !fine_tune, $21
	db !set_volume_l_and_r, $14, $28
	db $9C, $10
	db !set_default_duration, $08
	db !set_volume_l_and_r, $14, $28
	db $9B
	db !set_volume_l_and_r, $11, $08
	db $9C
	db !set_volume_l_and_r, $14, $28
	db $E0
	db !set_volume_l_and_r, $11, $08
	db $9B
	db !set_volume_l_and_r, $14, $28
	db $9C
	db !set_volume_l_and_r, $11, $08
	db $E0
	db !set_volume_l_and_r, $14, $28
	db $9B
	db !set_volume_l_and_r, $11, $08
	db $9C
	db !set_volume_l_and_r, $14, $28
	db $E0
	db !set_volume_l_and_r, $11, $08
	db $9B
	db !set_volume_l_and_r, $14, $28
	db $9C
	db !set_volume_l_and_r, $11, $08
	db $E0
	db !set_volume_l_and_r, $14, $28
	db $9B
	db !set_volume_l_and_r, $11, $08
	db $9C
	db !set_volume_l_and_r, $14, $28
	db $9C
	db !set_volume_l_and_r, $11, $08
	db $9B
	db !set_volume_l_and_r, $14, $28
	db $9B
	db !set_volume_l_and_r, $11, $08
	db $9C
	db !set_volume_l_and_r, $14, $28
	db $E0
	db !set_volume_l_and_r, $11, $08
	db $9B
	db !set_volume_l_and_r, $14, $28
	db $9C
	db !set_volume_l_and_r, $11, $08
	db $E0
	db !set_volume_l_and_r, $14, $28
	db $9B
	db !set_volume_l_and_r, $11, $08
	db $9C
	db !set_volume_l_and_r, $14, $28
	db $E0
	db !set_volume_l_and_r, $11, $08
	db $9B
	db !set_volume_l_and_r, $14, $28
	db $9E
	db !set_volume_l_and_r, $11, $08
	db $E0
	db !set_volume_l_and_r, $14, $28
	db $9B
	db !default_duration_off
	db !set_volume_l_and_r, $11, $08
	db $9E, $07
	db !fine_tune, $1E
	db !return_from_sub

.subseq_2034:
	db $80, $40
	db !set_volume_l_and_r, $19, $0F
	db $9B, $08
	db !set_volume_l_and_r, $05, $08
	db $9B, $10
	db !set_volume_l_and_r, $19, $0F
	db $9C, $08
	db !set_volume_l_and_r, $05, $08
	db $9C, $10
	db !set_volume_l_and_r, $19, $0F
	db $9C, $08
	db !set_volume_l_and_r, $05, $08
	db $9C, $08
	db $80, $40
	db !set_volume_l_and_r, $19, $0F
	db $9D, $08
	db !set_volume_l_and_r, $05, $08
	db $9D, $10
	db !set_volume_l_and_r, $19, $0F
	db $9E, $08
	db !set_volume_l_and_r, $05, $08
	db $9E, $10
	db !set_volume_l_and_r, $19, $0F
	db $9E, $08
	db $9F, $08
	db !set_volume_l_and_r, $05, $08
	db $9F, $08
	db $80, $38
	db !set_volume_l_and_r, $19, $0F
	db $9D, $08
	db !set_volume_l_and_r, $05, $08
	db $9D, $10
	db !set_volume_l_and_r, $19, $0F
	db $9E, $08
	db !set_volume_l_and_r, $05, $08
	db $9E, $10
	db !set_volume_l_and_r, $19, $0F
	db $9F, $08
	db !set_volume_l_and_r, $05, $08
	db $9F, $08
	db $80, $40
	db !set_volume_l_and_r, $19, $0F
	db $9F, $08
	db !set_volume_l_and_r, $05, $08
	db $9F, $10
	db !set_volume_l_and_r, $19, $0F
	db $A0, $08
	db !set_volume_l_and_r, $05, $08
	db $A0, $10
	db !set_volume_l_and_r, $19, $0F
	db $A0, $08
	db $A1, $08
	db !return_from_sub

.seq_20B4:
	db !play_subsequence : dw .subseq_1974
	db !set_instrument, $CF
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !echo_on
	db !set_volume_l_and_r, $0F, $08
	db !set_adsr, $80, $E7
	db !vibrato_with_delay, $03, $03, $12, $04
	db !long_duration_on
	db $A7, $01, $B0
	db !long_duration_off
.loop_point_20CE:
	db !play_subsequence : dw .subseq_1C16
	db !set_default_duration, $10
	db !set_volume_l_and_r, $14, $3C
	db $99
	db !set_volume_l_and_r, $1E, $32
	db $97
	db !set_volume_l_and_r, $28, $28
	db $95
	db !set_volume_l_and_r, $32, $1E
	db $93
	db !set_volume_l_and_r, $3C, $14
	db $91
	db !default_duration_off
	db $80, $0E
	db !loop_subsequence, $08 : dw .subseq_22D4
	db !loop_subsequence, $03 : dw .subseq_220F
	db !loop_subsequence, $01 : dw .subseq_21EA
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $22
	db $80, $08
	db !play_subsequence : dw .subseq_1C16
	db !set_default_duration, $10
	db !set_volume_l_and_r, $14, $3C
	db $99
	db !set_volume_l_and_r, $1E, $32
	db $97
	db !set_volume_l_and_r, $28, $28
	db $95
	db !set_volume_l_and_r, $32, $1E
	db $93
	db !default_duration_off
	db !set_volume_l_and_r, $3C, $14
	db $91, $08
	db $80, $0E
	db !loop_subsequence, $01 : dw .subseq_2144
	db !loop_subsequence, $01 : dw .subseq_2198
	db !loop_subsequence, $02 : dw .subseq_2144
	db !set_instrument, $CF
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !echo_on
	db !set_volume_l_and_r, $0F, $08
	db !set_adsr, $80, $E7
	db !vibrato_with_delay, $03, $03, $12, $04
	db !long_duration_on
	db $A7, $01, $A2
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_20CE
	db !end_sequence

.subseq_2144:
	db !set_adsr, $8C, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $10
	db $96, $10
	db !echo_on
	db !set_adsr, $8F, $E0
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $10
	db !set_adsr, $8C, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $10
	db $96, $08
	db !echo_on
	db !set_adsr, $8F, $E0
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $07, $14
	db $99, $08
	db $97, $08
	db !set_volume_l_and_r, $0A, $11
	db $97, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $07, $17
	db $93, $08
	db !set_volume_l_and_r, $08, $03
	db $93, $08
.subseq_2198:
	db !set_adsr, $8C, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $10
	db $96, $10
	db !echo_on
	db !set_adsr, $8F, $E0
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $10
	db !set_adsr, $8C, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $10
	db $96, $08
	db !echo_on
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $17, $07
	db $99, $08
	db $97, $08
	db !set_volume_l_and_r, $03, $0B
	db $97, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $0A, $11
	db $93, $08
	db !set_volume_l_and_r, $07, $17
	db $91, $08
	db !return_from_sub

.subseq_21EA:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $08
	db $96, $10
	db $96, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $20
	db !set_vol_single_val, $2C
	db !set_adsr, $83, $E1
	db $9E, $20
	db !set_adsr, $DF, $71
	db $9E, $20
	db !echo_on
	db !return_from_sub

.subseq_220F:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $08
	db $96, $10
	db $96, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $30
	db !echo_on
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $08
	db $96, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $20
	db !echo_on
	db !return_from_sub

.seq_223E:
	db !play_subsequence : dw .subseq_1974
.loop_point_2241:
	db !set_instrument, $CF
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !echo_on
	db !set_volume_l_and_r, $05, $09
	db !set_adsr, $80, $E7
	db !vibrato_with_delay, $03, $03, $12, $04
	db $80, $08
	db !long_duration_on
	db $A7, $01, $B0
	db !long_duration_off
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $14, $3C
	db !set_default_duration, $10
	db $99
	db !set_volume_l_and_r, $1E, $32
	db $97
	db !set_volume_l_and_r, $28, $28
	db $95
	db !set_volume_l_and_r, $32, $1E
	db $93
	db !default_duration_off
	db !set_volume_l_and_r, $3C, $14
	db $91, $08
	db !play_subsequence : dw .subseq_1C0C
	db !set_variable_note_1, $9B
	db !loop_subsequence, $08 : dw .subseq_1DC6
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1C0C
	db !set_volume_l_and_r, $19, $0F
	db !loop_subsequence, $02 : dw .subseq_22B3
	db !change_instr_pitch_rel, $05
	db !loop_subsequence, $01 : dw .subseq_22B3
	db $9B, $10
	db $9B, $20
	db $9B, $10
	db $97, $08
	db $97, $08
	db $97, $20
	db $97, $10
	db !change_instr_pitch_rel, $FB
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_1C7A
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_2241
	db !end_sequence

.subseq_22B3:
	db $9B, $10
	db $9B, $20
	db $9B, $10
	db $97, $08
	db $97, $08
	db $97, $20
	db $97, $10
	db $9A, $10
	db $9A, $20
	db $9A, $10
	db $9B, $08
	db $9B, $08
	db $9B, $10
	db $9B, $10
	db $9B, $08
	db $9B, $08
	db !return_from_sub

.subseq_22D4:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $08
	db !echo_on
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $07, $14
	db $99, $08
	db !set_volume_l_and_r, $0A, $11
	db $97, $08
	db !set_volume_l_and_r, $0D, $0D
	db $95, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $11, $0A
	db $93, $08
	db !set_volume_l_and_r, $14, $07
	db $91, $08
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $96, $08
	db !echo_on
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $07, $14
	db $99, $10
	db !set_volume_l_and_r, $0A, $11
	db $97, $08
	db !set_instrument, $90
	db !set_adsr, $DF, $71
	db !set_vol_single_val, $25
	db $9E, $10
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1C16
	db !set_volume_l_and_r, $11, $0A
	db $93, $08
	db !set_volume_l_and_r, $14, $07
	db $91, $08
	db !return_from_sub

base off
arch 65816
.end: