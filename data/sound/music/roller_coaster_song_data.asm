;0E Disco Train
;2EAF4A
roller_coaster_song_data:
	dw !bgm_loc, $0738
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1B08, .seq_1CD6, .seq_1BB2, .seq_1EA7, .seq_1B5F, .seq_1C36, .seq_2084, .seq_1E1C
	db $75, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_1935, .seq_19C9, .seq_1976, .seq_1ACF, .seq_194A, .seq_19A2, .seq_1AE3, .seq_19F2
	db $75, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_162B, .seq_16BB, .seq_1795, .seq_17F4, .seq_168B, .seq_18FB, .seq_18C3, .seq_173E
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_147D, .seq_14FF, .seq_154E, .seq_15CB, .seq_14D5, .seq_1609, .seq_161A, .seq_15EA
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_136E, .seq_13B5, .seq_13D0, .seq_13FA, .seq_1410, .seq_1452, .seq_1426, .seq_143B
	db $C0, $FF	;music tempo, sound effect tempo

.subseq_1364:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_136E:
	db !play_subsequence : dw .subseq_1AFA
	db !change_instr_pitch, $08
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !set_instrument, $89
	db !set_vol_single_val, $46
	db $99, $09
	db !set_instrument, $97
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $6E
	db $99, $07
	db $99, $09
	db !set_instrument, $89
	db !set_vol_single_val, $46
	db $99, $10
	db $99, $07
	db $99, $05
	db !set_instrument, $97
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $6E
	db $99, $05
	db $99, $06
	db !set_instrument, $89
	db !set_vol_single_val, $46
	db $99, $17
	db !set_vol_single_val, $1E
	db $99, $03
	db !set_vol_single_val, $28
	db $99, $03
	db !set_vol_single_val, $32
	db $99, $03
	db !set_vol_single_val, $46
	db $99, $10
	db !end_sequence

.seq_13B5:
	db !set_adsr, $AF, $F5
	db !set_instrument, $96
	db !set_vol_single_val, $28
	db !change_instr_pitch, $12
	db !fine_tune, $D6
	db !vibrato_with_delay, $02, $02, $0B, $05
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13D0:
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $16
	db !fine_tune, $20
	db !set_adsr, $DC, $F2
	db !vibrato_with_delay, $02, $02, $0B, $01
	db !set_volume_l_and_r, $06, $0B
.loop_point_13E2:
	db !echo_on
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A2, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_13FA:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_1410:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_1426:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_143B:
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $16
	db !fine_tune, $20
	db !set_adsr, $DC, $F2
	db !vibrato_with_delay, $02, $02, $0B, $01
	db !set_volume_l_and_r, $07, $03
	db $80, $14
	db !jump_to_sequence : dw .loop_point_13E2

.seq_1452:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $88
	db !set_volume_l_and_r, $0A, $14
	db !set_adsr, $FF, $58
	db $99, $09
	db $99, $07
	db $99, $09
	db $99, $07
	db $99, $09
	db $99, $07
	db $99, $09
	db $99, $03
	db $99, $03
	db $99, $03
	db $99, $09
	db $99, $07
	db $99, $09
	db $99, $07
	db $99, $10
	db !end_sequence

.seq_147D:
	db !play_subsequence : dw .subseq_1AFA
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !change_instr_pitch, $08
	db !loop_subsequence, $03 : dw .subseq_14BB
.loop_point_149B:
	db !set_instrument, $89
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $64
	db $98, $08
	db !set_adsr, $AE, $99
	db !set_vol_single_val, $14
	db $98, $08
	db !set_instrument, $97
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $6E
	db $99, $08
	db !set_vol_single_val, $14
	db $99, $08
	db !jump_to_sequence : dw .loop_point_149B

.subseq_14BB:
	db !set_instrument, $89
	db !set_vol_single_val, $64
	db $98, $04
	db !set_adsr, $AE, $99
	db !set_vol_single_val, $14
	db $98, $04
	db !set_instrument, $97
	db !set_volume_l_and_r, $6E, $6E
	db !set_adsr, $AF, $99
	db $99, $08
	db $99, $08
	db !return_from_sub

.seq_14D5:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !change_instr_pitch, $08
	db !set_instrument, $88
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $AF, $B9
	db $99, $18
	db $99, $18
	db $99, $18
	db $99, $18
	db !set_adsr, $8F, $F8
.loop_point_14F8:
	db $99, $08
	db $99, $08
	db !jump_to_sequence : dw .loop_point_14F8

.seq_14FF:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !set_adsr, $AF, $F5
	db !set_instrument, $96
	db !set_vol_single_val, $28
	db !change_instr_pitch, $12
	db !fine_tune, $D6
	db !vibrato_with_delay, $02, $02, $0B, $05
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
.loop_point_152A:
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
	db !jump_to_sequence : dw .loop_point_152A
	db !end_sequence

.seq_154E:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1569
	db !end_sequence

.subseq_1569:
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

.seq_15CB:
	db !play_subsequence : dw .subseq_1364
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
	db !play_subsequence : dw .subseq_1569
	db !end_sequence

.seq_15EA:
	db !play_subsequence : dw .subseq_1364
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
	db !play_subsequence : dw .subseq_1569
	db !end_sequence

.seq_1609:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_161A:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_162B:
	db !play_subsequence : dw .subseq_1AFA
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !change_instr_pitch, $08
	db !loop_subsequence, $0C : dw .subseq_164A
	db !end_sequence

.subseq_164A:
	db !set_instrument, $97
	db !set_volume_l_and_r, $6E, $6E
	db !set_adsr, $AF, $99
	db $99, $10
	db $99, $10
	db !set_instrument, $89
	db !set_vol_single_val, $6C
	db $99, $10
	db !set_instrument, $97
	db !set_volume_l_and_r, $6E, $6E
	db !set_adsr, $AF, $99
	db $99, $09
	db !set_instrument, $89
	db !set_vol_single_val, $26
	db $99, $10
	db $99, $07
	db !set_instrument, $97
	db !set_volume_l_and_r, $6E, $6E
	db !set_adsr, $AF, $99
	db $99, $09
	db !set_instrument, $89
	db !set_vol_single_val, $26
	db $99, $07
	db !set_vol_single_val, $6C
	db $99, $10
	db !set_vol_single_val, $26
	db $99, $09
	db !set_vol_single_val, $2C
	db $99, $07
	db !return_from_sub

.seq_168B:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $88
	db !set_volume_l_and_r, $14, $1E
	db !change_instr_pitch, $08
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_16AC
	db !default_duration_off
	db !end_sequence

.subseq_16AC:
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

.seq_16BB:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_16D2
	db !end_sequence

.subseq_16D2:
	db !play_subsequence : dw .subseq_16DF
	db !play_subsequence : dw .subseq_171C
	db !play_subsequence : dw .subseq_16DF
	db !play_subsequence : dw .subseq_172D
	db !return_from_sub

.subseq_16DF:
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

.subseq_171C:
	db !set_instrument, $08
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_172D:
	db !set_instrument, $06
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_173E:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_175A
	db !end_sequence

.subseq_175A:
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

.seq_1795:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !set_adsr, $AF, $F3
	db !set_instrument, $96
	db !set_volume_l_and_r, $1E, $1E
	db !change_instr_pitch, $12
	db !fine_tune, $DF
	db !vibrato_with_delay, $02, $02, $0B, $05
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17CF
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_17CF
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17CF
	db !end_sequence

.subseq_17CF:
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

.seq_17F4:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_187A
	db !play_subsequence : dw .subseq_1858
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $16
	db !fine_tune, $20
	db !set_adsr, $DC, $F2
	db !vibrato_with_delay, $02, $02, $0B, $01
	db !set_volume_l_and_r, $06, $0B
	db !loop_subsequence, $02 : dw .subseq_182A
	db !end_sequence

.subseq_182A:
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

.subseq_1858:
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
.subseq_187A:
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

.seq_18C3:
	db !play_subsequence : dw .subseq_1364
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
	db !play_subsequence : dw .subseq_187A
	db !play_subsequence : dw .subseq_1858
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $16
	db !fine_tune, $16
	db !set_adsr, $DC, $F2
	db !vibrato_with_delay, $02, $02, $0B, $01
	db !set_volume_l_and_r, $07, $03
	db !loop_subsequence, $02 : dw .subseq_182A
	db !end_sequence

.seq_18FB:
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $80, $05
	db $93, $1B
	db !pitch_slide_off
	db !set_adsr, $AF, $F3
	db !set_instrument, $96
	db !set_volume_l_and_r, $1E, $1E
	db !change_instr_pitch, $12
	db !fine_tune, $D4
	db !vibrato_with_delay, $02, $02, $0B, $05
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17CF
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_17CF
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17CF
	db !end_sequence

.seq_1935:
	db !play_subsequence : dw .subseq_1AFA
	db !echo_off
	db !set_instrument, $97
	db !set_volume_l_and_r, $6E, $6E
	db !set_adsr, $AF, $99
	db !change_instr_pitch, $08
	db $80, $08
	db !loop_subsequence, $02 : dw .subseq_1B56
	db !end_sequence

.seq_194A:
	db !set_adsr, $AF, $F3
	db !set_instrument, $96
	db !set_volume_l_and_r, $1E, $1E
	db !change_instr_pitch, $12
	db !fine_tune, $DF
	db !vibrato_with_delay, $02, $02, $0B, $05
	db $80, $08
	db $8B, $10
	db $8B, $10
	db $8B, $08
	db $8D, $08
	db $8F, $08
	db $90, $10
	db $84, $08
	db $90, $10
	db $90, $0C
	db $90, $04
	db $8E, $08
	db $8B, $10
	db !end_sequence

.seq_1976:
	db !set_adsr, $AF, $F3
	db !set_instrument, $96
	db !set_volume_l_and_r, $1E, $1E
	db !change_instr_pitch, $12
	db !fine_tune, $D4
	db !vibrato_with_delay, $02, $02, $0B, $05
	db $80, $08
	db $8B, $10
	db $8B, $10
	db $8B, $08
	db $8D, $08
	db $8F, $08
	db $90, $10
	db $84, $08
	db $90, $10
	db $90, $0C
	db $90, $04
	db $8E, $08
	db $8B, $10
	db !end_sequence

.seq_19A2:
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $0A
	db !fine_tune, $20
	db !set_adsr, $DC, $F2
	db !vibrato_with_delay, $02, $02, $0B, $01
	db !set_volume_l_and_r, $04, $0B
	db $9E, $04
	db $A0, $04
	db $A1, $08
	db $A0, $08
	db $9E, $08
	db $9B, $08
	db $A1, $08
	db $A3, $08
	db $A1, $08
	db $A0, $40
	db !end_sequence

.seq_19C9:
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $0A
	db !fine_tune, $16
	db !set_adsr, $DC, $F2
	db !vibrato_with_delay, $02, $02, $0B, $01
	db $80, $0B
	db !set_volume_l_and_r, $05, $02
	db $9E, $04
	db $A0, $04
	db $A1, $08
	db $A0, $08
	db $9E, $08
	db $9B, $08
	db $A1, $08
	db $A3, $08
	db $A1, $08
	db $A0, $40
	db !end_sequence

.seq_19F2:
	db !echo_on
	db !set_adsr, $AF, $F5
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_variable_note_1, $A1
	db !set_variable_note_2, $A0
	db !loop_subsequence, $01 : dw .subseq_1A03
	db !end_sequence

.subseq_1A03:
	db $80, $10
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $5D
	db $E0, $04
	db !set_instrument, $5F
	db $E0, $04
	db !set_instrument, $61
	db $E0, $04
	db !set_instrument, $63
	db $E0, $04
	db !set_instrument, $65
	db $E0, $04
	db !set_volume_l_and_r, $08, $04
	db $E0, $04
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $61
	db $E0, $04
	db !set_volume_l_and_r, $08, $04
	db !set_instrument, $5F
	db $E0, $04
	db !set_volume_l_and_r, $02, $04
	db !set_instrument, $5D
	db $E0, $04
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $5F
	db $E0, $04
	db !set_volume_l_and_r, $08, $04
	db !set_instrument, $5D
	db $E0, $04
	db !set_volume_l_and_r, $02, $04
	db !set_instrument, $5B
	db $E0, $04
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $63
	db $E1, $04
	db !set_volume_l_and_r, $08, $04
	db !set_instrument, $61
	db $E1, $04
	db !set_volume_l_and_r, $02, $04
	db !set_instrument, $5F
	db $E1, $04
	db !set_volume_l_and_r, $02, $01
	db !set_instrument, $5D
	db $E1, $04
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $5B
	db $E1, $04
	db !set_instrument, $5D
	db $E1, $04
	db !set_instrument, $5F
	db $E1, $04
	db !set_instrument, $61
	db $E1, $04
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $63
	db $E1, $04
	db !set_volume_l_and_r, $08, $04
	db !set_instrument, $61
	db $E1, $04
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $69
	db $E1, $04
	db !set_volume_l_and_r, $08, $04
	db !set_instrument, $67
	db $E1, $04
	db !set_volume_l_and_r, $02, $04
	db !set_instrument, $63
	db $E1, $04
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $65
	db $E1, $04
	db !set_volume_l_and_r, $08, $04
	db !set_instrument, $63
	db $E1, $04
	db !set_volume_l_and_r, $02, $04
	db !set_instrument, $5F
	db $E1, $04
	db !set_volume_l_and_r, $08, $14
	db !set_instrument, $61
	db $E1, $04
	db !set_volume_l_and_r, $08, $04
	db !set_instrument, $5F
	db $E1, $04
	db !set_volume_l_and_r, $02, $04
	db !set_instrument, $5D
	db $E1, $04
	db !set_volume_l_and_r, $02, $01
	db !set_instrument, $5B
	db $E1, $04
	db !return_from_sub

.seq_1ACF:
	db !echo_on
	db !set_volume_l_and_r, $08, $14
	db !set_adsr, $AF, $F5
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $9C
	db !loop_subsequence, $01 : dw .subseq_1A03
	db !end_sequence

.seq_1AE3:
	db !echo_on
	db !set_volume_l_and_r, $08, $14
	db !set_adsr, $AF, $F5
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $9A
	db !loop_subsequence, $01 : dw .subseq_1A03
	db !end_sequence

.subseq_1AF7:
	db $80, $10
	db !return_from_sub

.subseq_1AFA:
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !set_echo, $3A, $23, $23
	db !return_from_sub

.seq_1B08:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_1AF7
	db !play_subsequence : dw .subseq_1AFA
.loop_point_1B10:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $EC
	db $94, $40
	db $92, $20
	db $94, $20
	db $92, $40
	db $92, $20
	db $94, $20
	db !echo_off
	db !set_instrument, $97
	db !set_volume_l_and_r, $6E, $6E
	db !set_adsr, $AF, $99
	db !change_instr_pitch, $08
	db !loop_subsequence, $23 : dw .subseq_1B56
	db !loop_subsequence, $01 : dw .subseq_1B47
	db !loop_subsequence, $08 : dw .subseq_1B56
	db !loop_subsequence, $08 : dw .subseq_1B56
	db !jump_to_sequence : dw .loop_point_1B10
	db !end_sequence

.subseq_1B47:
	db $99, $10
	db $99, $0C
	db $99, $04
	db $99, $08
	db $99, $08
	db $99, $08
	db $99, $08
	db !return_from_sub

.subseq_1B56:
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db !return_from_sub

.seq_1B5F:
	db !play_subsequence : dw .subseq_1AF7
.loop_point_1B62:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $EC
	db $9B, $40
	db $9B, $20
	db $99, $20
	db $97, $40
	db $9B, $20
	db $99, $20
	db $9B, $40
	db $9B, $20
	db $99, $20
	db $97, $40
	db $9B, $20
	db $99, $20
	db !set_instrument, $88
	db !set_volume_l_and_r, $0B, $11
	db !change_instr_pitch, $08
	db !loop_subsequence, $40 : dw .subseq_1BA5
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !loop_subsequence, $40 : dw .subseq_1BA5
	db !loop_subsequence, $20 : dw .subseq_1BA5
	db !jump_to_sequence : dw .loop_point_1B62
	db !end_sequence

.subseq_1BA5:
	db !set_adsr, $DF, $5C
	db $99, $04
	db $99, $04
	db !set_adsr, $8F, $F5
	db $99, $08
	db !return_from_sub

.seq_1BB2:
	db !play_subsequence : dw .subseq_1AF7
.loop_point_1BB5:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $EC
	db $97, $40
	db $97, $20
	db $97, $20
	db $94, $40
	db $97, $20
	db $97, $20
	db $97, $40
	db $97, $20
	db $97, $20
	db $94, $40
	db $97, $20
	db $97, $20
	db !set_instrument, $85
	db !set_volume_l_and_r, $21, $17
	db !set_adsr, $8F, $E0
	db !change_instr_pitch, $00
	db !loop_subsequence, $08 : dw .subseq_1C2F
	db !loop_subsequence, $08 : dw .subseq_1C07
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !loop_subsequence, $08 : dw .subseq_1C07
	db !loop_subsequence, $08 : dw .subseq_1C07
	db !jump_to_sequence : dw .loop_point_1BB5
	db !end_sequence

.subseq_1C07:
	db $80, $08
	db !set_instrument, $89
	db !set_volume_l_and_r, $14, $14
	db $99, $08
	db !set_instrument, $85
	db !set_volume_l_and_r, $21, $17
	db $99, $0C
	db !set_instrument, $89
	db !set_volume_l_and_r, $14, $14
	db $99, $0C
	db $99, $08
	db !set_instrument, $85
	db !set_volume_l_and_r, $21, $17
	db $99, $08
	db !set_instrument, $89
	db !set_volume_l_and_r, $14, $14
	db $99, $08
	db !return_from_sub

.subseq_1C2F:
	db $80, $10
	db $99, $20
	db $99, $10
	db !return_from_sub

.seq_1C36:
	db !play_subsequence : dw .subseq_1AF7
.loop_point_1C39:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $EC
	db $9E, $40
	db $9E, $20
	db $9D, $20
	db $9B, $40
	db $9E, $20
	db $9D, $20
	db $9E, $40
	db $9E, $20
	db $9D, $20
	db $9B, $40
	db $9E, $20
	db $9D, $20
	db !set_instrument, $89
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $8F, $E0
	db !change_instr_pitch, $00
	db !loop_subsequence, $07 : dw .subseq_1CC5
	db !loop_subsequence, $01 : dw .subseq_1CAD
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $16
	db !fine_tune, $20
	db !set_adsr, $DF, $52
	db !vibrato_with_delay, $02, $02, $0B, $01
	db $80, $80
	db $80, $80
	db !loop_subsequence, $01 : dw .subseq_1D2D
	db $80, $80
	db $80, $80
	db $80, $80
	db !loop_subsequence, $02 : dw .subseq_1D2D
	db !echo_off
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1C39
	db !end_sequence

.subseq_1CAD:
	db $80, $08
	db $99, $08
	db !set_volume_l_and_r, $28, $28
	db $80, $0C
	db $99, $04
	db $99, $08
	db $99, $08
	db $99, $04
	db $99, $04
	db $99, $04
	db $99, $04
	db !return_from_sub

.subseq_1CC5:
	db $80, $08
	db $99, $08
	db $80, $0C
	db $99, $04
	db $80, $08
	db $99, $08
	db $80, $08
	db $99, $08
	db !return_from_sub

.seq_1CD6:
	db !play_subsequence : dw .subseq_1AF7
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $16
	db !fine_tune, $20
	db !set_adsr, $DF, $52
	db !vibrato_with_delay, $02, $02, $0B, $01
.loop_point_1CE8:
	db $80, $80
	db !loop_subsequence, $01 : dw .subseq_1D2D
	db $80, $80
	db !loop_subsequence, $01 : dw .subseq_1D2D
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !vibrato_off
	db !echo_off
	db !set_instrument, $45
	db !change_instr_pitch, $F9
	db !fine_tune, $E8
	db !set_volume_l_and_r, $3C, $3C
	db !set_adsr, $AF, $AF
	db !loop_subsequence, $08 : dw .subseq_1DB6
	db !echo_on
	db !set_instrument, $95
	db !change_instr_pitch, $16
	db !fine_tune, $20
	db !set_adsr, $DF, $52
	db !vibrato_with_delay, $02, $02, $0B, $01
	db $80, $80
	db !loop_subsequence, $01 : dw .subseq_1D2D
	db $80, $80
	db !loop_subsequence, $01 : dw .subseq_1D2D
	db !jump_to_sequence : dw .loop_point_1CE8
	db !end_sequence

.subseq_1D2D:
	db $80, $08
	db !set_volume_l_and_r, $08, $05
	db $94, $06
	db !set_volume_l_and_r, $02, $04
	db $94, $02
	db !set_volume_l_and_r, $08, $06
	db $A0, $06
	db !set_volume_l_and_r, $02, $04
	db $A0, $02
	db !set_volume_l_and_r, $08, $05
	db $94, $04
	db $A0, $02
	db !set_volume_l_and_r, $02, $04
	db $94, $04
	db $A0, $06
	db !set_volume_l_and_r, $03, $05
	db $94, $06
	db !set_volume_l_and_r, $02, $01
	db $94, $02
	db !set_volume_l_and_r, $03, $05
	db $A0, $06
	db !set_volume_l_and_r, $02, $01
	db $A0, $02
	db !set_volume_l_and_r, $03, $05
	db $94, $04
	db $A0, $02
	db !set_volume_l_and_r, $02, $01
	db $94, $04
	db $A0, $06
	db !set_volume_l_and_r, $04, $02
	db $94, $06
	db !set_volume_l_and_r, $01, $02
	db $94, $02
	db !set_volume_l_and_r, $04, $02
	db $A0, $06
	db !set_volume_l_and_r, $01, $02
	db $A0, $02
	db !set_volume_l_and_r, $04, $02
	db $94, $04
	db $A0, $02
	db !set_volume_l_and_r, $01, $02
	db $94, $04
	db $A0, $06
	db !set_volume_l_and_r, $01, $03
	db $94, $06
	db !set_volume_l_and_r, $01, $00
	db $94, $02
	db !set_volume_l_and_r, $01, $03
	db $A0, $06
	db !set_volume_l_and_r, $01, $00
	db $A0, $02
	db !set_volume_l_and_r, $01, $03
	db $94, $04
	db $A0, $02
	db !set_volume_l_and_r, $01, $00
	db $94, $02
	db !return_from_sub

.subseq_1DB6:
	db !loop_subsequence, $01 : dw .subseq_1DC7
	db !loop_subsequence, $01 : dw .subseq_1DFA
	db !loop_subsequence, $01 : dw .subseq_1DC7
	db !loop_subsequence, $01 : dw .subseq_1E0B
	db !return_from_sub

.subseq_1DC7:
	db $88, $08
	db $94, $08
	db $88, $08
	db $94, $08
	db $88, $08
	db $92, $08
	db $8B, $08
	db $8A, $08
	db !return_from_sub

.unreached_1DD8:
	db !loop_subsequence, $01 : dw .unreached_1DE9
	db !loop_subsequence, $01 : dw .subseq_1DFA
	db !loop_subsequence, $01 : dw .unreached_1DE9
	db !loop_subsequence, $01 : dw .subseq_1E0B
	db !return_from_sub

.unreached_1DE9:
	db $88, $08
	db $94, $08
	db $88, $08
	db $94, $08
	db $88, $08
	db $94, $08
	db $88, $08
	db $8A, $08
	db !return_from_sub

.subseq_1DFA:
	db $8B, $08
	db $97, $08
	db $8B, $08
	db $97, $08
	db $8D, $08
	db $99, $08
	db $8D, $08
	db $8F, $08
	db !return_from_sub

.subseq_1E0B:
	db $8B, $08
	db $97, $08
	db $8B, $08
	db $97, $08
	db $86, $08
	db $92, $08
	db $86, $08
	db $8B, $08
	db !return_from_sub

.seq_1E1C:
	db !play_subsequence : dw .subseq_1AF7
.loop_point_1E1F:
	db !change_instr_pitch, $F9
	db !fine_tune, $E8
	db !set_adsr, $8F, $EF
	db !loop_subsequence, $18 : dw .subseq_1E36
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1E1F
	db !end_sequence

.subseq_1E36:
	db !set_adsr, $DF, $53
	db !set_instrument, $3D
	db !set_volume_l_and_r, $32, $0A
	db $A0, $04
	db $AC, $04
	db $AC, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db !set_volume_l_and_r, $2D, $0F
	db !set_instrument, $3F
	db $A0, $04
	db $A0, $04
	db !set_volume_l_and_r, $28, $14
	db !set_instrument, $41
	db $A0, $04
	db $A0, $04
	db !set_volume_l_and_r, $23, $19
	db !set_instrument, $43
	db $A0, $04
	db $A0, $04
	db !set_volume_l_and_r, $1E, $1E
	db !set_instrument, $45
	db $A0, $04
	db $A0, $04
	db !set_volume_l_and_r, $19, $23
	db !set_instrument, $47
	db $A0, $04
	db $A0, $04
	db !set_volume_l_and_r, $14, $28
	db !set_instrument, $48
	db $A0, $04
	db $A0, $04
	db !set_volume_l_and_r, $0F, $2D
	db !set_instrument, $49
	db $A0, $04
	db $A0, $04
	db !set_volume_l_and_r, $0A, $32
	db !set_instrument, $4A
	db $A0, $04
	db $A0, $04
	db !return_from_sub

.seq_1EA7:
	db !play_subsequence : dw .subseq_1AF7
.loop_point_1EAA:
	db !set_volume_l_and_r, $08, $18
	db !set_adsr, $CF, $90
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !loop_subsequence, $04 : dw .subseq_1F71
	db !set_instrument, $4F
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $88, $E0
	db !pitch_slide_down, $01, $06, $37, $37, $0F
	db $88, $80
	db !pitch_slide_down, $01, $06, $3A, $3A, $10
	db $88, $80
	db !pitch_slide_down, $01, $06, $41, $41, $11
	db $8A, $80
	db !pitch_slide_down, $01, $06, $46, $46, $13
	db $8B, $80
	db !pitch_slide_off
	db !echo_off
	db !set_adsr, $AF, $F3
	db !set_instrument, $96
	db !set_volume_l_and_r, $1E, $1E
	db !change_instr_pitch, $06
	db !fine_tune, $DF
	db !vibrato_with_delay, $02, $02, $0B, $05
	db !loop_subsequence, $04 : dw .subseq_1F66
	db !set_instrument, $98
	db !change_instr_pitch, $00
	db !fine_tune, $18
	db !set_adsr, $8E, $EE
	db !set_volume_l_and_r, $28, $28
	db !pitch_slide_down, $02, $02, $08, $0B, $00
	db $8D, $80
	db $8E, $10
	db $8F, $70
	db $80, $80
	db $8D, $80
	db !pitch_slide_off
	db !loop_subsequence, $04 : dw .subseq_1FFB
	db !set_volume_l_and_r, $0A, $1E
	db !set_adsr, $CF, $90
	db !loop_subsequence, $04 : dw .subseq_1FB2
	db $80, $40
	db !loop_subsequence, $01 : dw .subseq_1FD6
	db $80, $40
	db !loop_subsequence, $01 : dw .subseq_1FD6
	db !loop_subsequence, $02 : dw .subseq_1F3A
	db !jump_to_sequence : dw .loop_point_1EAA
	db !end_sequence

.subseq_1F3A:
	db !echo_off
	db !set_adsr, $AF, $F3
	db !set_instrument, $96
	db !set_volume_l_and_r, $1E, $1E
	db !change_instr_pitch, $06
	db !fine_tune, $DF
	db !vibrato_with_delay, $02, $02, $0B, $05
	db $94, $10
	db $94, $10
	db $94, $08
	db $92, $08
	db $97, $10
	db !vibrato_off
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_volume_l_and_r, $0A, $1E
	db !set_adsr, $CF, $90
	db !loop_subsequence, $01 : dw .subseq_1FD6
	db !return_from_sub

.subseq_1F66:
	db $94, $10
	db $94, $10
	db $94, $08
	db $92, $08
	db $97, $50
	db !return_from_sub

.subseq_1F71:
	db !set_instrument, $69
	db $94, $08
	db !set_instrument, $6B
	db $97, $08
	db !set_instrument, $5B
	db $9E, $08
	db !set_instrument, $5A
	db $94, $08
	db !set_instrument, $65
	db $97, $08
	db !set_instrument, $67
	db $9E, $08
	db !set_instrument, $5B
	db $94, $08
	db !set_instrument, $5D
	db $9B, $08
	db !set_instrument, $71
	db $96, $08
	db !set_instrument, $5A
	db $97, $08
	db !set_instrument, $5E
	db $9E, $08
	db !set_instrument, $6D
	db $9B, $08
	db !set_instrument, $73
	db $9D, $08
	db !set_instrument, $71
	db $9E, $08
	db !set_instrument, $6B
	db $9D, $08
	db !set_instrument, $5C
	db $99, $08
	db !return_from_sub

.subseq_1FB2:
	db !set_instrument, $5F
	db $9B, $08
	db !set_instrument, $5B
	db $A3, $08
	db !set_instrument, $60
	db $A2, $08
	db !set_instrument, $5A
	db $9B, $04
	db !set_instrument, $61
	db $9E, $08
	db !set_instrument, $5B
	db $9E, $04
	db !set_instrument, $62
	db $9B, $08
	db !set_instrument, $5A
	db $9E, $08
	db !set_instrument, $64
	db $A0, $08
.subseq_1FD6:
	db !set_instrument, $65
	db $99, $08
	db !set_instrument, $5B
	db $9B, $08
	db !set_instrument, $67
	db $9E, $08
	db !set_instrument, $5B
	db $9B, $04
	db !set_instrument, $68
	db $9E, $08
	db !set_instrument, $5E
	db $9E, $04
	db !set_instrument, $5D
	db $9B, $08
	db !set_instrument, $69
	db $9E, $08
	db !set_instrument, $6A
	db $A0, $08
	db !return_from_sub

.subseq_1FFB:
	db !echo_off
	db !set_adsr, $AE, $99
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_instrument, $5A
	db $88, $04
	db !set_instrument, $5B
	db $88, $04
	db !set_instrument, $5C
	db $88, $04
	db !set_instrument, $5D
	db $88, $04
	db !set_instrument, $5E
	db $88, $04
	db !set_instrument, $5F
	db $88, $04
	db !set_instrument, $60
	db $88, $04
	db !set_instrument, $61
	db $88, $04
	db !set_instrument, $62
	db $88, $04
	db !set_instrument, $63
	db $88, $04
	db !set_instrument, $64
	db $88, $04
	db !set_instrument, $65
	db $88, $04
	db !set_instrument, $66
	db $88, $04
	db !set_instrument, $67
	db $88, $04
	db !set_instrument, $68
	db $88, $04
	db !set_instrument, $69
	db $88, $04
	db !set_instrument, $6A
	db $88, $04
	db !set_instrument, $6B
	db $88, $04
	db !set_instrument, $6C
	db $88, $04
	db !set_instrument, $6D
	db $88, $04
	db !set_instrument, $6E
	db $88, $04
	db !set_instrument, $6F
	db $88, $04
	db !set_instrument, $70
	db $88, $04
	db !set_instrument, $71
	db $88, $04
	db !set_instrument, $72
	db $88, $04
	db !set_instrument, $73
	db $88, $04
	db !set_instrument, $74
	db $88, $04
	db !set_instrument, $75
	db $88, $04
	db !set_instrument, $76
	db $88, $04
	db !set_instrument, $77
	db $88, $04
	db !set_instrument, $78
	db $88, $04
	db !set_instrument, $79
	db $88, $04
	db !return_from_sub

.seq_2084:
	db !play_subsequence : dw .subseq_1AF7
.loop_point_2087:
	db !set_volume_l_and_r, $0E, $06
	db !set_adsr, $CF, $90
	db !change_instr_pitch, $FE
	db !fine_tune, $E8
	db !loop_subsequence, $02 : dw .subseq_1F71
	db !change_instr_pitch, $05
	db $80, $0C
	db !loop_subsequence, $02 : dw .subseq_1F71
	db !set_instrument, $4F
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_volume_l_and_r, $0E, $08
	db !set_adsr, $88, $E0
	db !pitch_slide_down, $01, $06, $37, $37, $0F
	db $88, $80
	db !pitch_slide_down, $01, $06, $3A, $3A, $10
	db $89, $80
	db !pitch_slide_down, $01, $06, $41, $41, $11
	db $8A, $80
	db !pitch_slide_down, $01, $06, $46, $46, $13
	db $8B, $74
	db !pitch_slide_off
	db $80, $01
	db !echo_off
	db !set_adsr, $AE, $F2
	db !set_instrument, $96
	db !set_volume_l_and_r, $1A, $1A
	db !change_instr_pitch, $06
	db !fine_tune, $D4
	db !vibrato_with_delay, $02, $01, $12, $05
	db !loop_subsequence, $04 : dw .subseq_1F66
	db $80, $0B
	db !set_instrument, $98
	db !change_instr_pitch, $00
	db !fine_tune, $E8
	db !set_adsr, $8E, $EB
	db !set_volume_l_and_r, $12, $12
	db !pitch_slide_down, $02, $02, $08, $0B, $00
	db $8D, $80
	db $8E, $10
	db $8F, $70
	db $80, $80
	db $8D, $80
	db !pitch_slide_off
	db !loop_subsequence, $04 : dw .subseq_1FFB
	db !set_volume_l_and_r, $11, $06
	db !set_adsr, $CF, $90
	db !loop_subsequence, $04 : dw .subseq_1FB2
	db $80, $40
	db !loop_subsequence, $01 : dw .subseq_1FD6
	db $80, $40
	db !loop_subsequence, $01 : dw .subseq_2143
	db !loop_subsequence, $02 : dw .subseq_2123
	db !jump_to_sequence : dw .loop_point_2087
	db !end_sequence

.subseq_2123:
	db !echo_off
	db !set_adsr, $AE, $F2
	db !set_instrument, $96
	db !set_volume_l_and_r, $1A, $1A
	db !change_instr_pitch, $06
	db !fine_tune, $D4
	db !vibrato_with_delay, $02, $01, $12, $05
	db $80, $01
	db $94, $10
	db $94, $10
	db $94, $08
	db $92, $08
	db $97, $0F
	db $80, $0C
.subseq_2143:
	db !set_volume_l_and_r, $11, $06
	db !set_adsr, $CF, $90
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !vibrato_off
	db !set_instrument, $65
	db $99, $08
	db !set_instrument, $5B
	db $9B, $08
	db !set_instrument, $67
	db $9E, $08
	db !set_instrument, $5B
	db $9B, $04
	db !set_instrument, $68
	db $9E, $08
	db !set_instrument, $5E
	db $9E, $04
	db !set_instrument, $5D
	db $9B, $08
	db !set_instrument, $69
	db $9E, $04
	db !return_from_sub

base off
arch 65816
.end: