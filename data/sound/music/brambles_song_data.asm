;09 Stickerbush Symphony
;2E748C
brambles_song_data:
	dw !bgm_loc, $0871
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1BC4, .seq_22E3, .seq_1E5E, .seq_1D6D, .seq_1C8C, .seq_221C, .seq_1D1D, .seq_1CD1
	db $A8, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: Stickerbush Symphony
	dw .chn_ptrs_131E	;01: Lost Life
	dw .chn_ptrs_1330	;02: Diddy Victory
	dw .chn_ptrs_1342	;03: Dixie Victory
	dw .chn_ptrs_1354	;04: Hit Target
	dw .chn_ptrs_1366	;05: Bad Bird Rag

;sub-track 01 channel pointers
.chn_ptrs_131E:
	dw .seq_1AF7, .seq_1B04, .seq_1B1D, .seq_1B3C, .seq_1B8A, .seq_1B96, .seq_1BA8, .seq_1B59
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_1330:
	dw .seq_181A, .seq_189F, .seq_1977, .seq_19C8, .seq_1872, .seq_1AAD, .seq_1A7F, .seq_1920
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1342:
	dw .seq_169E, .seq_1703, .seq_1740, .seq_17AE, .seq_16DC, .seq_17EA, .seq_17FB, .seq_17CC
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1354:
	dw .seq_15BF, .seq_15FF, .seq_1614, .seq_1632, .seq_1648, .seq_167E, .seq_165E, .seq_1673
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 05 channel pointers
.chn_ptrs_1366:
	dw .seq_137B, .seq_159E, .seq_138D, .seq_1467, .seq_1533, .seq_156D, .seq_14CE, .seq_13F1
	db $DA, $FF	;music tempo, sound effect tempo

.subseq_1378:
	db $80, $10
	db !return_from_sub

.seq_137B:
	db !play_subsequence : dw .subseq_180C
	db $80, $10
.loop_point_1380:
	db !play_subsequence : dw .subseq_1DCF
	db !play_subsequence : dw .subseq_1DE8
	db $99, $08
	db $98, $08
	db !jump_to_sequence : dw .loop_point_1380

.seq_138D:
	db $80, $10
.loop_point_138F:
	db !change_tempo, $DA
	db !play_subsequence : dw .subseq_13E7
	db !loop_subsequence, $06 : dw .subseq_13BF
	db !change_instr_pitch, $FB
	db !loop_subsequence, $04 : dw .subseq_13A1
	db !jump_to_sequence : dw .loop_point_138F

.subseq_13A1:
	db !loop_subsequence, $04 : dw .subseq_13B5
	db !play_subsequence : dw .subseq_13AC
	db !loop_subsequence, $04 : dw .subseq_13BA
.subseq_13AC:
	db $A4, $08
	db $A4, $08
	db $A4, $08
	db $A4, $08
	db !return_from_sub

.subseq_13B5:
	db $A2, $08
	db $A2, $10
	db !return_from_sub

.subseq_13BA:
	db $A5, $08
	db $A5, $10
	db !return_from_sub

.subseq_13BF:
	db !loop_subsequence, $02 : dw .subseq_13C6
	db !change_instr_pitch_rel, $01
	db !return_from_sub

.subseq_13C6:
	db !play_subsequence : dw .subseq_13D8
	db $99, $10
	db $9B, $10
	db !play_subsequence : dw .subseq_13D8
	db !set_default_duration, $08
	db $96
	db $98
	db $99
	db $9B
	db !default_duration_off
	db !return_from_sub

.subseq_13D8:
	db $80, $10
	db $9D, $10
	db $9B, $10
	db $98, $08
	db $99, $10
	db $99, $10
	db $98, $08
	db !return_from_sub

.subseq_13E7:
	db !set_voice_parameters, $28, $FC, $F2, $1E, $28, $CE, $CE
	db !echo_on
	db !return_from_sub

.seq_13F1:
	db $80, $10
.loop_point_13F3:
	db !play_subsequence : dw .subseq_13E7
	db !loop_subsequence, $06 : dw .subseq_1434
	db !change_instr_pitch, $FB
	db !loop_subsequence, $04 : dw .subseq_1403
	db !jump_to_sequence : dw .loop_point_13F3

.subseq_1403:
	db $9D, $08
	db $9D, $10
	db $9D, $08
	db $9D, $10
	db $9D, $08
	db $9D, $10
	db $9D, $08
	db $9D, $10
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db $A2, $08
	db $A2, $10
	db $A2, $08
	db $A2, $10
	db $A2, $08
	db $A2, $10
	db $A2, $08
	db $A2, $10
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db !return_from_sub

.subseq_1434:
	db !loop_subsequence, $02 : dw .subseq_143B
	db !change_instr_pitch_rel, $01
	db !return_from_sub

.subseq_143B:
	db !play_subsequence : dw .subseq_144E
	db $96, $10
	db $98, $10
	db !play_subsequence : dw .subseq_144E
	db $91, $08
	db $94, $08
	db $96, $08
	db $98, $08
	db !return_from_sub

.subseq_144E:
	db $80, $10
	db $99, $10
	db $98, $10
	db $94, $08
	db $96, $10
	db $96, $10
	db $94, $08
	db !return_from_sub

.subseq_145D:
	db !change_instr_pitch, $00
	db !set_instrument, $A6
	db !set_adsr, $9F, $AB
	db !set_vol_single_val, $46
	db !return_from_sub

.seq_1467:
.loop_point_1467:
	db !set_variable_note_1, $96
	db !set_variable_note_2, $8A
	db !play_subsequence : dw .subseq_1498
	db !set_variable_note_1, $97
	db !set_variable_note_2, $8B
	db !play_subsequence : dw .subseq_1498
	db !set_variable_note_1, $98
	db !set_variable_note_2, $8C
	db !play_subsequence : dw .subseq_1498
	db !set_variable_note_1, $99
	db !set_variable_note_2, $8D
	db !play_subsequence : dw .subseq_1498
	db !set_variable_note_1, $9A
	db !set_variable_note_2, $8E
	db !play_subsequence : dw .subseq_1498
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $8F
	db !play_subsequence : dw .subseq_1498
	db !loop_subsequence, $08 : dw .subseq_14BA
	db !jump_to_sequence : dw .loop_point_1467

.subseq_1498:
	db !play_subsequence : dw .subseq_145D
	db $8D, $0A
	db $8F, $86
	db !play_subsequence : dw .subseq_1AE9
	db !set_vol_single_val, $7F
	db !set_adsr, $8F, $E0
	db !change_instr_pitch_rel, $F4
	db !pitch_slide_down, $01, $02, $78, $02, $00
	db $E0, $80
	db !pitch_slide_off
	db $E1, $10
	db $80, $10
	db $E1, $50
	db !change_tempo_rel, $01
.subseq_14BA:
	db !play_subsequence : dw .subseq_145D
	db $96, $0A
	db $98, $0E
	db $9A, $18
	db $98, $18
	db $94, $18
	db $90, $18
	db $8F, $08
	db !change_tempo_rel, $01
	db !return_from_sub

.seq_14CE:
.loop_point_14CE:
	db !set_variable_note_1, $96
	db !set_variable_note_2, $8A
	db !play_subsequence : dw .subseq_14FF
	db !set_variable_note_1, $97
	db !set_variable_note_2, $8B
	db !play_subsequence : dw .subseq_14FF
	db !set_variable_note_1, $98
	db !set_variable_note_2, $8C
	db !play_subsequence : dw .subseq_14FF
	db !set_variable_note_1, $99
	db !set_variable_note_2, $8D
	db !play_subsequence : dw .subseq_14FF
	db !set_variable_note_1, $9A
	db !set_variable_note_2, $8E
	db !play_subsequence : dw .subseq_14FF
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $8F
	db !play_subsequence : dw .subseq_14FF
	db !loop_subsequence, $08 : dw .subseq_1521
	db !jump_to_sequence : dw .loop_point_14CE

.subseq_14FF:
	db !play_subsequence : dw .subseq_145D
	db $80, $05
	db $8E, $8B
	db $80, $0B
	db !play_subsequence : dw .subseq_1AE9
	db !set_vol_single_val, $28
	db !set_adsr, $8F, $E0
	db !change_instr_pitch_rel, $F4
	db !pitch_slide_down, $01, $02, $7F, $02, $00
	db $E0, $80
	db !pitch_slide_off
	db $E1, $10
	db $80, $10
	db $E1, $45
.subseq_1521:
	db !play_subsequence : dw .subseq_145D
	db $80, $05
	db $97, $0B
	db $9A, $18
	db $98, $18
	db $94, $18
	db $90, $18
	db $8F, $10
	db !return_from_sub

.seq_1533:
	db $80, $10
	db !set_voice_parameters, $50, $EF, $2E, $78, $78, $AE, $F5
.loop_point_153D:
	db !set_variable_note_1, $8A
	db !loop_subsequence, $20 : dw .subseq_156A
	db !set_variable_note_1, $8B
	db !loop_subsequence, $20 : dw .subseq_156A
	db !set_variable_note_1, $8C
	db !loop_subsequence, $20 : dw .subseq_156A
	db !set_variable_note_1, $8D
	db !loop_subsequence, $20 : dw .subseq_156A
	db !set_variable_note_1, $8E
	db !loop_subsequence, $20 : dw .subseq_156A
	db !set_variable_note_1, $8F
	db !loop_subsequence, $20 : dw .subseq_156A
	db !set_variable_note_1, $88
	db !loop_subsequence, $40 : dw .subseq_156A
	db !jump_to_sequence : dw .loop_point_153D

.subseq_156A:
	db $E0, $10
	db !return_from_sub

.seq_156D:
	db $80, $10
	db !play_subsequence : dw .subseq_1E57
	db !echo_on
	db !set_adsr, $EF, $51
.loop_point_1576:
	db !loop_subsequence, $06 : dw .subseq_1583
	db !change_instr_pitch, $00
	db !loop_subsequence, $20 : dw .subseq_158A
	db !jump_to_sequence : dw .loop_point_1576

.subseq_1583:
	db !loop_subsequence, $10 : dw .subseq_158A
	db !change_instr_pitch_rel, $01
	db !return_from_sub

.subseq_158A:
	db !set_default_duration, $08
	db !set_volume_l_and_r, $11, $0B
	db $A2
	db !set_volume_l_and_r, $03, $08
	db $9D
	db !set_volume_l_and_r, $11, $0B
	db $9D
	db !set_volume_l_and_r, $03, $08
	db $A2
	db !default_duration_off
	db !return_from_sub

.seq_159E:
	db $80, $10
	db !fine_tune, $E9
	db !change_instr_pitch, $11
	db !set_vol_single_val, $7F
	db !set_adsr, $AE, $A0
.loop_point_15A9:
	db !change_instr_pitch, $02
	db !loop_subsequence, $06 : dw .subseq_15B8
	db !change_instr_pitch, $01
	db !loop_subsequence, $08 : dw .subseq_23A2
	db !jump_to_sequence : dw .loop_point_15A9

.subseq_15B8:
	db !loop_subsequence, $04 : dw .subseq_23A2
	db !change_instr_pitch_rel, $01
	db !return_from_sub

.seq_15BF:
	db !play_subsequence : dw .subseq_180C
	db !set_voice_parameters, $A5, $00, $00, $46, $46, $8F, $E0
	db $9E, $09
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $3C
	db $97, $07
	db $97, $09
	db !set_instrument, $A5
	db !set_vol_single_val, $46
	db $9E, $10
	db $9E, $07
	db $9E, $05
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $3C
	db $97, $05
	db $97, $06
	db !set_instrument, $A5
	db !set_vol_single_val, $46
	db $9E, $17
	db !set_vol_single_val, $1E
	db $9E, $03
	db !set_vol_single_val, $28
	db $9E, $03
	db !set_vol_single_val, $32
	db $9E, $03
	db !set_vol_single_val, $46
	db $9E, $10
	db !end_sequence

.seq_15FF:
	db !play_subsequence : dw .subseq_1AE9
	db !change_instr_pitch_rel, $F4
	db !set_vol_single_val, $7A
	db !set_adsr, $CE, $AF
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_1614:
	db !play_subsequence : dw .subseq_1ADB
	db !set_volume_l_and_r, $30, $15
.loop_point_161A:
	db !echo_on
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A2, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db $AC, $19
	db $80, $07
	db $AC, $10
	db !end_sequence

.seq_1632:
	db !play_subsequence : dw .subseq_1AF0
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_1648:
	db !play_subsequence : dw .subseq_1AF0
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_165E:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1673:
	db !play_subsequence : dw .subseq_1ADB
	db !set_volume_l_and_r, $08, $11
	db $80, $14
	db !jump_to_sequence : dw .loop_point_161A

.seq_167E:
	db !set_voice_parameters, $2E, $00, $00, $0A, $14, $FF, $58
	db !loop_subsequence, $03 : dw .subseq_1699
	db $9E, $09
	db $9E, $03
	db $9E, $03
	db $9E, $03
	db !loop_subsequence, $02 : dw .subseq_1699
	db $9E, $10
	db !end_sequence

.subseq_1699:
	db $9E, $09
	db $9D, $07
	db !return_from_sub

.seq_169E:
	db !play_subsequence : dw .subseq_180C
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_16CB
.loop_point_16BA:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_16BA

.subseq_16CB:
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

.seq_16DC:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !set_voice_parameters, $2E, $00, $FE, $14, $1E, $AF, $B2
	db !set_default_duration, $18
	db $9A
	db $9A
	db $9A
	db $9A
	db !default_duration_off
	db !set_adsr, $8F, $F8
.loop_point_16FC:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .loop_point_16FC

.seq_1703:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_1AE9
	db !change_instr_pitch_rel, $F4
	db !set_vol_single_val, $7B
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
.loop_point_1728:
	db !loop_subsequence, $10 : dw .subseq_173C
	db !loop_subsequence, $08 : dw .subseq_173E
	db $88
	db $88
	db $88
	db $88
	db $8A
	db $8A
	db $8A
	db $8A
	db !jump_to_sequence : dw .loop_point_1728
	db !end_sequence

.subseq_173C:
	db $8C
	db !return_from_sub

.subseq_173E:
	db $85
	db !return_from_sub

.seq_1740:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_voice_parameters, $8F, $F8, $FC, $32, $46, $EF, $80
	db !play_subsequence : dw .subseq_175A
	db !end_sequence

.subseq_175A:
	db $80, $58
	db !pitch_slide_up, $01, $02, $08, $21, $00
	db $A2, $10
	db $A2, $10
	db $A2, $0F
	db !loop_subsequence, $02 : dw .subseq_1798
	db !play_subsequence : dw .subseq_17A4
	db !vibrato_with_delay, $04, $02, $11, $05
	db $A4, $0F
	db $80, $01
	db $A4, $07
	db !play_subsequence : dw .subseq_17A4
	db $A4, $08
	db !pitch_slide_up, $01, $02, $08, $2C, $00
	db !set_default_duration, $10
	db $A7
	db $A7
	db $A7
	db !set_adsr, $EE, $40
	db $A7
	db !set_adsr, $EC, $20
	db $A7
	db !set_adsr, $EB, $00
	db $A7
	db !default_duration_off
	db !return_from_sub

.subseq_1798:
	db !pitch_slide_up, $00, $01, $08, $2B, $00
	db $9F, $09
	db !pitch_slide_off
	db $9F, $07
	db !return_from_sub

.subseq_17A4:
	db !pitch_slide_up, $00, $01, $08, $39, $00
	db $A4, $09
	db !pitch_slide_off
	db !return_from_sub

.seq_17AE:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $80, $05
	db $9D, $20
	db !pitch_slide_off
	db !set_voice_parameters, $8F, $F8, $FC, $1C, $12, $EF, $80
	db $80, $0F
	db !play_subsequence : dw .subseq_175A
	db !end_sequence

.seq_17CC:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $80, $05
	db $98, $20
	db !pitch_slide_off
	db !set_voice_parameters, $8F, $F8, $FC, $08, $0E, $EF, $80
	db $80, $1E
	db !play_subsequence : dw .subseq_175A
	db !end_sequence

.seq_17EA:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_17FB:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.subseq_180C:
	db !set_echo, $2C, $17, $17
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !return_from_sub

.seq_181A:
	db !play_subsequence : dw .subseq_180C
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1837
	db !end_sequence

.subseq_1837:
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

.seq_1872:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !set_voice_parameters, $2E, $00, $00, $14, $1E, $8F, $F8
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_1890
	db !default_duration_off
	db !end_sequence

.subseq_1890:
	db !set_adsr, $8F, $F8
	db $99
	db $97
	db $9A
	db $97
	db $99
	db $96
	db $98
	db !set_adsr, $8F, $C5
	db $9A
	db !return_from_sub

.seq_189F:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_18B6
	db !end_sequence

.subseq_18B6:
	db !play_subsequence : dw .subseq_18C3
	db !play_subsequence : dw .subseq_18FD
	db !play_subsequence : dw .subseq_18C3
	db !play_subsequence : dw .subseq_1910
	db !return_from_sub

.subseq_18C3:
	db !set_instrument, $05
	db !set_vol_single_val, $4A
	db !set_adsr, $8F, $E0
	db !pitch_slide_down, $01, $01, $0B, $0B, $00
	db $8D
	db !pitch_slide_off
	db !set_vol_single_val, $11
	db !play_subsequence : dw .subseq_18F2
	db !set_instrument, $01
	db !set_adsr, $8E, $EF
	db $88
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_18F2
	db !set_instrument, $02
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $87
	db !set_instrument, $03
	db !set_adsr, $8F, $EF
	db $88
	db !return_from_sub

.subseq_18F2:
	db !set_instrument, $07
	db !pitch_slide_up, $02, $01, $16, $16, $00
	db $9A
	db !pitch_slide_off
	db !return_from_sub

.subseq_18FD:
	db !play_subsequence : dw .subseq_1918
	db !end_sequence

.unreached_1901:
	db !end_sequence

.unreached_1902:
	db !end_sequence

.unreached_1903:
	db !end_sequence

.unreached_1904:
	db !end_sequence

.unreached_1905:
	db !end_sequence

.unreached_1906:
	db $8A
.subseq_1907:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_1910:
	db !play_subsequence : dw .subseq_1907
	db !play_subsequence : dw .subseq_1918
	db $8E
	db !return_from_sub

.subseq_1918:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db !return_from_sub

.seq_1920:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_193C
	db !end_sequence

.subseq_193C:
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

.seq_1977:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_1AE9
	db !change_instr_pitch_rel, $F4
	db !set_vol_single_val, $7B
	db !set_adsr, $CE, $AF
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_19AA
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_19AA
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_19AA
	db !end_sequence

.subseq_19AA:
	db !play_subsequence : dw .subseq_19B9
	db $80, $24
	db !play_subsequence : dw .subseq_19B9
	db $80, $04
	db $89, $10
	db $8A, $10
	db !return_from_sub

.subseq_19B9:
	db $E0, $0C
	db $80, $04
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db !return_from_sub

.seq_19C8:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1A35
	db !play_subsequence : dw .subseq_1A1F
	db !play_subsequence : dw .subseq_1ADB
	db !change_instr_pitch, $FC
	db !loop_subsequence, $02 : dw .subseq_19F1
	db !end_sequence

.subseq_19F1:
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

.subseq_1A1F:
	db !play_subsequence : dw .subseq_1A6A
	db $95, $10
	db !play_subsequence : dw .subseq_1A71
	db $97, $10
	db !play_subsequence : dw .subseq_1A78
	db $97, $08
	db $95, $10
	db !play_subsequence : dw .subseq_1A63
	db $97, $40
.subseq_1A35:
	db !play_subsequence : dw .subseq_1A63
	db $97, $08
	db !play_subsequence : dw .subseq_1A6A
	db $95, $10
	db !play_subsequence : dw .subseq_1A71
	db $97, $10
	db !play_subsequence : dw .subseq_1A78
	db $97, $08
	db !play_subsequence : dw .subseq_1A6A
	db $99, $10
	db !play_subsequence : dw .subseq_1A71
	db $9A, $10
	db !play_subsequence : dw .subseq_1A63
	db $9A, $08
	db !play_subsequence : dw .subseq_1A78
	db $99, $10
	db !play_subsequence : dw .subseq_1A63
	db $97, $20
	db !return_from_sub

.subseq_1A63:
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db !return_from_sub

.subseq_1A6A:
	db !set_instrument, $01
	db !change_instr_pitch, $02
	db !fine_tune, $F2
	db !return_from_sub

.subseq_1A71:
	db !set_instrument, $02
	db !change_instr_pitch, $FE
	db !fine_tune, $18
	db !return_from_sub

.subseq_1A78:
	db !set_instrument, $03
	db !change_instr_pitch, $FD
	db !fine_tune, $00
	db !return_from_sub

.seq_1A7F:
	db !play_subsequence : dw .subseq_1AF0
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $80, $05
	db $97, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $07
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1A35
	db !play_subsequence : dw .subseq_1A1F
	db !play_subsequence : dw .subseq_1ADB
	db !change_instr_pitch, $FC
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_19F1
	db !end_sequence

.seq_1AAD:
	db !play_subsequence : dw .subseq_1AF0
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
	db !play_subsequence : dw .subseq_1A35
	db !play_subsequence : dw .subseq_1A1F
	db !play_subsequence : dw .subseq_1ADB
	db !change_instr_pitch, $FC
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_19F1
	db !end_sequence

.subseq_1ADB:
	db !set_voice_parameters, $1B, $F0, $02, $14, $1E, $8F, $E0
	db !vibrato_with_delay, $04, $02, $0A, $07
	db !return_from_sub

.subseq_1AE9:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !return_from_sub

.subseq_1AF0:
	db !play_subsequence : dw .subseq_1AE9
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_1AF7:
	db !play_subsequence : dw .subseq_1BB6
	db $80, $10
	db !play_subsequence : dw .subseq_1E04
	db !loop_subsequence, $02 : dw .subseq_1DB6
	db !end_sequence

.seq_1B04:
	db $80, $10
	db !play_subsequence : dw .subseq_1AE9
	db !set_adsr, $AE, $A0
	db !set_vol_single_val, $6A
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !change_instr_pitch_rel, $FE
	db !play_subsequence : dw .subseq_23A2
	db !change_instr_pitch_rel, $F9
	db !play_subsequence : dw .subseq_23A2
	db !end_sequence

.seq_1B1D:
	db !vibrato_with_delay, $04, $02, $0A, $07
	db !set_voice_parameters, $1B, $FC, $02, $3C, $1E, $FF, $60
.loop_point_1B2A:
	db $9E, $08
	db $A0, $08
	db $A1, $10
	db $A0, $10
	db $9E, $18
	db $9B, $08
	db !play_subsequence : dw .subseq_1B7B
	db $9A, $50
	db !end_sequence

.seq_1B3C:
	db !play_subsequence : dw .subseq_1E50
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8E, $EE
.loop_point_1B45:
	db $80, $10
	db $9E, $20
	db $9E, $10
	db $9E, $08
	db $9E, $08
	db !play_subsequence : dw .subseq_1B7B
	db !loop_subsequence, $04 : dw .subseq_1B84
	db $9A, $0C
	db !end_sequence

.seq_1B59:
	db !play_subsequence : dw .subseq_1E50
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8E, $EE
.loop_point_1B62:
	db $80, $10
	db $9B, $20
	db $9B, $10
	db $9B, $08
	db $9B, $08
	db $92, $10
	db $92, $10
	db $97, $10
	db $97, $20
	db !loop_subsequence, $04 : dw .subseq_1B87
	db $97, $0C
	db !end_sequence

.subseq_1B7B:
	db $97, $10
	db $99, $10
	db $9B, $10
	db $9C, $20
	db !return_from_sub

.subseq_1B84:
	db $9A, $18
	db !return_from_sub

.subseq_1B87:
	db $97, $18
	db !return_from_sub

.seq_1B8A:
	db !play_subsequence : dw .subseq_1E50
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8E, $EE
	db !jump_to_sequence : dw .loop_point_1B45

.seq_1B96:
	db !vibrato_with_delay, $04, $02, $0A, $07
	db !set_voice_parameters, $1B, $FC, $02, $08, $17, $FE, $60
	db $80, $14
	db !jump_to_sequence : dw .loop_point_1B2A

.seq_1BA8:
	db !play_subsequence : dw .subseq_1E50
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8E, $EE
	db $80, $0E
	db !jump_to_sequence : dw .loop_point_1B62

.subseq_1BB6:
	db !set_echo, $37, $2C, $2C
	db !set_fir, $58, $BF, $DB, $E0, $FE, $01, $2C, $2C
	db !return_from_sub

.seq_1BC4:
	db !echo_delay, $00
	db !set_master_volume_indirect, $64
	db !play_subsequence : dw .subseq_1378
	db !play_subsequence : dw .subseq_1BB6
	db !set_instrument, $8B
	db !set_adsr, $8F, $FA
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db !echo_on
.loop_point_1BD8:
	db !loop_subsequence, $07 : dw .subseq_1C1E
	db !loop_subsequence, $05 : dw .subseq_1BE7
	db !play_subsequence : dw .subseq_1C1E
	db !jump_to_sequence : dw .loop_point_1BD8
	db !end_sequence

.subseq_1BE7:
	db !loop_subsequence, $03 : dw .subseq_1BFE
	db !play_subsequence : dw .subseq_1C13
	db !return_from_sub

.subseq_1BEF:
	db !set_vol_single_val, $70
	db !set_adsr, $CF, $70
	db !change_instr_pitch, $F0
	db $8A, $10
	db !change_instr_pitch_rel, $18
	db !set_adsr, $8F, $FA
	db !return_from_sub

.subseq_1BFE:
	db !play_subsequence : dw .subseq_1BEF
	db !play_subsequence : dw .subseq_1C31
	db !play_subsequence : dw .subseq_1C08
	db !return_from_sub

.subseq_1C08:
	db !set_volume_l_and_r, $03, $0A
	db $94, $08
	db !set_volume_l_and_r, $04, $01
	db $94, $08
	db !return_from_sub

.subseq_1C13:
	db !play_subsequence : dw .subseq_1BEF
	db !play_subsequence : dw .subseq_1C31
	db !loop_subsequence, $02 : dw .subseq_1C67
	db !return_from_sub

.subseq_1C1E:
	db !loop_subsequence, $03 : dw .subseq_1C54
	db !play_subsequence : dw .subseq_1C5D
	db !return_from_sub

.subseq_1C26:
.loop_point_1C26:
	db !set_volume_l_and_r, $20, $40
	db $E0, $08
	db !set_volume_l_and_r, $18, $08
	db $E0, $08
	db !return_from_sub

.subseq_1C31:
	db !set_variable_note_1, $98
	db !play_subsequence : dw .subseq_1C26
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1C26
	db !set_volume_l_and_r, $03, $0A
	db $99, $08
	db !set_variable_note_1, $98
	db !play_subsequence : dw .subseq_1C26
	db !set_volume_l_and_r, $03, $0A
	db $98, $08
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1C26
	db !set_variable_note_1, $94
	db !jump_to_sequence : dw .loop_point_1C26

.subseq_1C54:
	db $80, $10
	db !play_subsequence : dw .subseq_1C31
	db !play_subsequence : dw .subseq_1C08
	db !return_from_sub

.subseq_1C5D:
	db $80, $10
	db !play_subsequence : dw .subseq_1C31
	db !loop_subsequence, $02 : dw .subseq_1C67
	db !return_from_sub

.subseq_1C67:
	db !set_volume_l_and_r, $1A, $3A
	db $A0, $04
	db !set_volume_l_and_r, $14, $06
	db $A0, $04
	db !return_from_sub

.subseq_1C72:
	db !echo_on
	db !set_voice_parameters, $15, $FC, $03, $28, $10, $81, $EA
	db !return_from_sub

.subseq_1C7C:
	db $E0, $01, $00
	db $E1, $01, $00
	db !return_from_sub

.subseq_1C83:
	db $99, $80
	db $9D, $80
	db $9E, $C0
	db $A0, $40
	db !return_from_sub

.seq_1C8C:
	db !play_subsequence : dw .subseq_1378
	db !play_subsequence : dw .subseq_1C72
	db !vibrato_with_delay, $02, $03, $08, $05
.loop_point_1C97:
	db !long_duration_on
	db !set_variable_note_1, $9D
	db !set_variable_note_2, $A0
	db !loop_subsequence, $02 : dw .subseq_1C7C
	db !long_duration_off
	db !loop_subsequence, $04 : dw .subseq_1CBE
	db !play_subsequence : dw .subseq_1C83
	db !long_duration_on
	db !set_variable_note_1, $9D
	db !set_variable_note_2, $9D
	db !loop_subsequence, $02 : dw .subseq_1C7C
	db !long_duration_off
	db !loop_subsequence, $02 : dw .subseq_1CBE
	db !loop_subsequence, $02 : dw .subseq_1C83
	db !jump_to_sequence : dw .loop_point_1C97
	db !end_sequence

.subseq_1CBE:
	db $9D, $80
	db $94, $80
	db $A0, $80
	db $9D, $80
	db !return_from_sub

.subseq_1CC7:
	db $96, $00, $80
	db $99, $01, $40
	db $9B, $00, $40
	db !return_from_sub

.seq_1CD1:
	db !play_subsequence : dw .subseq_1378
	db !play_subsequence : dw .subseq_1C72
	db !set_volume_l_and_r, $20, $18
	db !vibrato_with_delay, $03, $02, $0B, $05
	db !long_duration_on
.loop_point_1CE0:
	db !set_variable_note_1, $99
	db !set_variable_note_2, $9D
	db !loop_subsequence, $02 : dw .subseq_1C7C
	db !loop_subsequence, $04 : dw .subseq_1D03
	db !play_subsequence : dw .subseq_1CC7
	db !set_variable_note_1, $99
	db !set_variable_note_2, $98
	db !loop_subsequence, $02 : dw .subseq_1C7C
	db !loop_subsequence, $02 : dw .subseq_1D03
	db !loop_subsequence, $02 : dw .subseq_1CC7
	db !jump_to_sequence : dw .loop_point_1CE0
	db !end_sequence

.subseq_1D03:
	db $99, $00, $80
	db $9B, $01, $00
	db $99, $00, $40
	db $98, $00, $40
	db !return_from_sub

.subseq_1D10:
	db $92, $00, $80
	db $94, $00, $80
	db $96, $00, $C0
	db $98, $00, $40
	db !return_from_sub

.seq_1D1D:
	db !play_subsequence : dw .subseq_1378
	db !play_subsequence : dw .subseq_1C72
	db !set_volume_l_and_r, $10, $28
	db !vibrato_with_delay, $02, $02, $0F, $05
	db !long_duration_on
.loop_point_1D2C:
	db !set_variable_note_1, $94
	db !set_variable_note_2, $98
	db !loop_subsequence, $02 : dw .subseq_1C7C
	db !loop_subsequence, $04 : dw .subseq_1D4F
	db !play_subsequence : dw .subseq_1D10
	db !set_variable_note_1, $94
	db !set_variable_note_2, $94
	db !loop_subsequence, $02 : dw .subseq_1C7C
	db !loop_subsequence, $02 : dw .subseq_1D4F
	db !loop_subsequence, $02 : dw .subseq_1D10
	db !jump_to_sequence : dw .loop_point_1D2C
	db !end_sequence

.subseq_1D4F:
	db $96, $00, $80
	db $98, $01, $00
	db $94, $00, $80
	db !return_from_sub

.subseq_1D59:
	db $86, $00, $80
	db !change_instr_pitch_rel, $F4
	db $8C, $00, $80
	db !change_instr_pitch_rel, $0C
	db $85, $00, $80
	db $8A, $00, $40
	db $88, $00, $40
	db !return_from_sub

.seq_1D6D:
	db !play_subsequence : dw .subseq_1378
	db !echo_on
.loop_point_1D71:
	db !play_subsequence : dw .subseq_1AE9
	db !set_vol_single_val, $40
	db !set_adsr, $85, $E8
	db !long_duration_on
	db $8A, $01, $00
	db $8D, $01, $00
	db $8A, $01, $00
	db $81, $01, $00
	db !loop_subsequence, $02 : dw .subseq_1D59
	db $80, $06, $00
	db !long_duration_off
	db !loop_subsequence, $14 : dw .subseq_1E04
	db !set_instrument, $2E
	db !change_instr_pitch, $02
	db !set_volume_l_and_r, $1C, $2C
	db !loop_subsequence, $02 : dw .subseq_1DB6
	db !set_volume_l_and_r, $15, $21
	db !loop_subsequence, $02 : dw .subseq_1DB6
	db !set_volume_l_and_r, $0E, $16
	db !loop_subsequence, $02 : dw .subseq_1DB6
	db !set_volume_l_and_r, $07, $0B
	db !loop_subsequence, $02 : dw .subseq_1DB6
	db !jump_to_sequence : dw .loop_point_1D71
	db !end_sequence

.subseq_1DB6:
	db $80, $08
	db !set_adsr, $DF, $57
	db $99, $08
	db !set_adsr, $AF, $6B
	db $99, $10
	db !set_adsr, $DF, $57
	db $99, $08
	db $98, $08
	db !set_adsr, $AF, $6B
	db $99, $10
	db !return_from_sub

.subseq_1DCF:
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !set_adsr, $FF, $20
	db !change_instr_pitch, $08
	db $8D, $08
	db !echo_on
	db !return_from_sub

.subseq_1DDD:
	db !set_voice_parameters, $2E, $02, $00, $17, $26, $DF, $57
	db $99, $08
	db !return_from_sub

.subseq_1DE8:
	db !set_voice_parameters, $2E, $02, $00, $11, $1C, $DF, $59
	db $99, $08
	db !return_from_sub

.subseq_1DF3:
	db !set_voice_parameters, $A5, $00, $00, $4A, $60, $DF, $CA
	db $99, $08
	db !return_from_sub

.subseq_1DFE:
	db !set_adsr, $AF, $6B
	db $99, $10
	db !return_from_sub

.subseq_1E04:
	db !play_subsequence : dw .subseq_1DCF
	db !play_subsequence : dw .subseq_1DDD
	db !play_subsequence : dw .subseq_1DFE
	db !play_subsequence : dw .subseq_1DF3
	db !play_subsequence : dw .subseq_1DDD
	db !set_adsr, $AF, $6B
	db $99, $08
	db !play_subsequence : dw .subseq_1DCF
	db !play_subsequence : dw .subseq_1DDD
	db !play_subsequence : dw .subseq_1DCF
	db $8C, $08
	db !play_subsequence : dw .subseq_1DDD
	db !play_subsequence : dw .subseq_1DF3
	db !play_subsequence : dw .subseq_1DDD
	db !play_subsequence : dw .subseq_1DFE
	db !return_from_sub

.subseq_1E30:
	db !set_voice_parameters, $33, $FC, $19, $0E, $06, $FE, $80
	db !return_from_sub

.subseq_1E39:
	db !set_voice_parameters, $1B, $FC, $02, $11, $19, $FF, $60
	db !return_from_sub

.subseq_1E42:
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !set_adsr, $8E, $3C
	db !play_subsequence : dw .subseq_21EF
	db !play_subsequence : dw .subseq_21BF
	db !return_from_sub

.subseq_1E50:
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !return_from_sub

.subseq_1E57:
	db !set_instrument, $8E
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !return_from_sub

.seq_1E5E:
	db !play_subsequence : dw .subseq_1378
	db !echo_on
.loop_point_1E62:
	db !long_duration_on
	db $80, $02, $00
	db !long_duration_off
	db !play_subsequence : dw .subseq_1E42
	db !set_instrument, $34
	db !change_instr_pitch, $03
	db !fine_tune, $FE
	db !set_adsr, $9F, $8A
	db !play_subsequence : dw .subseq_2064
	db !set_volume_l_and_r, $04, $0C
	db !set_adsr, $AA, $6A
	db !play_subsequence : dw .subseq_207D
	db !play_subsequence : dw .subseq_1E57
	db !set_adsr, $9F, $8A
	db !play_subsequence : dw .subseq_1FDD
	db !set_volume_l_and_r, $0C, $04
	db !set_adsr, $AA, $6A
	db !play_subsequence : dw .subseq_207D
	db !vibrato_with_delay, $04, $02, $0A, $07
	db !play_subsequence : dw .subseq_1E39
	db !set_volume_l_and_r, $32, $23
	db !play_subsequence : dw .subseq_20DA
	db !play_subsequence : dw .subseq_1E30
	db !set_volume_l_and_r, $0A, $17
	db !play_subsequence : dw .subseq_2119
	db !play_subsequence : dw .subseq_1E39
	db !set_volume_l_and_r, $32, $23
	db !play_subsequence : dw .subseq_2127
	db !play_subsequence : dw .subseq_1E30
	db !set_volume_l_and_r, $11, $1B
	db !play_subsequence : dw .subseq_1FD0
	db !play_subsequence : dw .subseq_1E39
	db !set_volume_l_and_r, $32, $23
	db !play_subsequence : dw .subseq_1FBE
	db !play_subsequence : dw .subseq_1E30
	db !set_volume_l_and_r, $11, $1B
	db !play_subsequence : dw .subseq_1FB4
	db !set_default_duration, $80
	db $9D
	db $80
	db $80
	db $80
	db !default_duration_off
	db !play_subsequence : dw .subseq_1E42
	db !play_subsequence : dw .subseq_1E50
	db !set_adsr, $DE, $D1
	db !play_subsequence : dw .subseq_1F63
	db !set_volume_l_and_r, $3C, $64
	db !play_subsequence : dw .subseq_1F80
	db !play_subsequence : dw .subseq_1E30
	db !set_volume_l_and_r, $11, $1B
	db !play_subsequence : dw .subseq_1FD0
	db !play_subsequence : dw .subseq_1E39
	db !set_volume_l_and_r, $32, $23
	db !play_subsequence : dw .subseq_1FBE
	db !play_subsequence : dw .subseq_1E30
	db !set_volume_l_and_r, $11, $1B
	db !play_subsequence : dw .subseq_1FB4
	db $9D, $40
	db !play_subsequence : dw .subseq_1FD0
	db !play_subsequence : dw .subseq_1E39
	db !set_volume_l_and_r, $32, $23
	db !play_subsequence : dw .subseq_1FBE
	db !play_subsequence : dw .subseq_1E30
	db !set_volume_l_and_r, $0A, $1B
	db !play_subsequence : dw .subseq_1F27
	db !set_volume_l_and_r, $11, $06
	db $9D, $20
	db $9E, $10
	db !set_volume_l_and_r, $03, $08
	db $9B, $20
	db !jump_to_sequence : dw .loop_point_1E62
	db !end_sequence

.subseq_1F27:
	db $99, $10
	db $96, $15
	db $98, $16
	db $99, $15
	db $9D, $20
	db $9E, $10
	db !return_from_sub

.subseq_1F34:
	db $9D, $10
	db $9B, $10
	db $99, $08
	db $9B, $18
	db !return_from_sub

.subseq_1F3D:
	db $9D, $10
	db $9B, $10
	db $99, $08
	db $9B, $08
	db !return_from_sub

.subseq_1F46:
	db $80, $40
	db !set_volume_l_and_r, $21, $11
	db $9B, $10
	db !play_subsequence : dw .subseq_1F34
	db !set_volume_l_and_r, $0A, $11
	db !play_subsequence : dw .subseq_1F34
	db !set_volume_l_and_r, $0F, $07
	db !play_subsequence : dw .subseq_1F34
	db !set_volume_l_and_r, $03, $08
	db !play_subsequence : dw .subseq_1F3D
	db !return_from_sub

.subseq_1F63:
	db $80, $40
	db !set_volume_l_and_r, $3C, $64
	db $9B, $10
	db !play_subsequence : dw .subseq_1F34
	db !set_volume_l_and_r, $32, $1E
	db !play_subsequence : dw .subseq_1F34
	db !set_volume_l_and_r, $14, $28
	db !play_subsequence : dw .subseq_1F34
	db !set_volume_l_and_r, $17, $0B
	db !play_subsequence : dw .subseq_1F3D
	db !return_from_sub

.subseq_1F80:
	db !set_default_duration, $10
	db $9B
	db $9D
	db $A0
	db $9D
	db !default_duration_off
	db $9B, $30
	db $9D, $08
	db $9B, $08
	db $99, $20
	db $98, $10
	db $99, $10
	db $A2, $50
	db $A2, $20
	db $9D, $10
	db $9B, $50
	db $94, $20
	db $A0, $10
	db $A0, $40
	db $A0, $15
	db $A2, $16
	db $A4, $15
	db $A4, $20
	db $A5, $10
	db $A4, $20
	db $A0, $10
	db $9D, $10
	db $A2, $50
	db !return_from_sub

.subseq_1FB4:
	db !play_subsequence : dw .subseq_1F27
	db $9D, $20
	db $9B, $20
	db $99, $10
	db !return_from_sub

.subseq_1FBE:
	db $99, $10
	db $98, $16
	db $99, $15
	db $9D, $15
	db !pitch_slide_up, $00, $01, $0B, $1B, $00
	db $A0, $30
	db !pitch_slide_off
	db !return_from_sub

.subseq_1FD0:
	db $99, $16
	db $9B, $15
	db $9D, $15
	db !play_subsequence : dw .subseq_20D3
	db $9E, $30
	db !pitch_slide_off
	db !return_from_sub

.subseq_1FDD:
	db !play_subsequence : dw .subseq_201A
	db $80
	db $80
	db $80
	db $80
	db !set_variable_note_1, $A5
	db !play_subsequence : dw .subseq_1FFF
	db !set_variable_note_1, $A4
	db !play_subsequence : dw .subseq_1FFF
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_1FFF
	db !set_variable_note_1, $9D
	db !play_subsequence : dw .subseq_1FFF
	db !set_variable_note_1, $A2
	db !play_subsequence : dw .subseq_1FFF
	db !default_duration_off
	db !return_from_sub

.subseq_1FFF:
	db !set_volume_l_and_r, $10, $30
	db $E0
	db !set_volume_l_and_r, $0E, $08
	db $E0
	db !return_from_sub

.subseq_2008:
	db !set_volume_l_and_r, $10, $05
	db $E0
	db !set_volume_l_and_r, $02, $05
	db $E0
	db !return_from_sub

.subseq_2011:
	db !set_volume_l_and_r, $03, $07
	db $E0
	db !set_volume_l_and_r, $04, $02
	db $E0
	db !return_from_sub

.subseq_201A:
	db $80, $50
	db !set_default_duration, $08
	db !set_variable_note_1, $98
	db !play_subsequence : dw .subseq_1FFF
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1FFF
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_1FFF
	db !set_volume_l_and_r, $05, $09
	db $A0
	db !set_volume_l_and_r, $06, $03
	db $A0
	db !set_variable_note_1, $98
	db !play_subsequence : dw .subseq_2008
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_2008
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_2008
	db !set_volume_l_and_r, $04, $02
	db $A0
	db !set_volume_l_and_r, $01, $02
	db $A0
	db !set_variable_note_1, $98
	db !play_subsequence : dw .subseq_2011
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_2011
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_2011
	db !set_volume_l_and_r, $02, $03
	db $A0
	db !set_volume_l_and_r, $01, $02
	db $A0
	db !return_from_sub

.subseq_2064:
	db !play_subsequence : dw .subseq_201A
	db !default_duration_off
	db $80, $40
	db !set_default_duration, $08
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_1FFF
	db !set_variable_note_1, $A2
	db !play_subsequence : dw .subseq_1FFF
	db !set_variable_note_1, $9D
	db !play_subsequence : dw .subseq_1FFF
	db !default_duration_off
	db !return_from_sub

.subseq_207D:
	db !change_instr_pitch, $FB
	db !change_instr_pitch_rel, $0C
	db !fine_tune, $2E
	db !set_instrument, $59
	db !set_default_duration, $04
	db $99
	db $98
	db $94
	db !set_instrument, $58
	db $99
	db $98
	db $94
	db !set_instrument, $57
	db $99
	db $98
	db $94
	db !set_instrument, $56
	db $99
	db $98
	db $94
	db !set_instrument, $55
	db $99
	db $98
	db $94
	db !set_instrument, $54
	db $99
	db $98
	db $94
	db !set_instrument, $57
	db $99
	db $98
	db $94
	db !set_instrument, $52
	db $99
	db $98
	db $94
	db !set_instrument, $51
	db $99
	db $98
	db $94
	db $99
	db !set_instrument, $50
	db $98
	db $94
	db $99
	db $98
	db !default_duration_off
	db !return_from_sub

.subseq_20BB:
	db $94, $0E
	db $80, $02
	db !pitch_slide_up, $01, $01, $0B, $18, $00
	db $9E, $10
	db !play_subsequence : dw .subseq_20D3
	db $9E, $40
	db !play_subsequence : dw .subseq_20D3
	db $9E, $16
	db !pitch_slide_off
	db !return_from_sub

.subseq_20D3:
	db !pitch_slide_up, $01, $02, $0B, $18, $00
	db !return_from_sub

.subseq_20DA:
	db $80, $70
	db !pitch_slide_up, $05, $01, $0B, $15, $00
	db $9B, $10
	db !pitch_slide_off
	db $9B, $60
	db !play_subsequence : dw .subseq_20BB
	db $9E, $15
	db $9D, $15
	db !pitch_slide_up, $00, $01, $0B, $13, $00
	db $99, $30
	db !pitch_slide_up, $00, $01, $0B, $15, $00
	db $9B, $08
	db !pitch_slide_off
	db $9B, $08
	db $99, $16
	db $98, $15
	db $99, $15
	db !pitch_slide_up, $00, $01, $0B, $1B, $00
	db $A0, $40
	db $80, $10
	db $A0, $20
	db !pitch_slide_off
	db $9D, $10
	db $9B, $10
	db !return_from_sub

.subseq_2119:
	db !pitch_slide_up, $00, $01, $0B, $1B, $00
	db $A0, $20
	db !pitch_slide_off
	db $9D, $10
	db $9B, $20
	db !return_from_sub

.subseq_2127:
	db !play_subsequence : dw .subseq_20BB
	db $A2, $15
	db !pitch_slide_up, $00, $01, $0B, $1D, $00
	db $A2, $15
	db !pitch_slide_off
	db $A4, $20
	db !pitch_slide_up, $00, $01, $0B, $10, $00
	db $A4, $10
	db !pitch_slide_off
	db $A4, $20
	db $A0, $20
	db $9D, $10
	db !pitch_slide_up, $00, $01, $0B, $1B, $00
	db $A0, $40
	db !pitch_slide_off
	db !return_from_sub

.subseq_2150:
	db !set_volume_l_and_r, $1A, $06
	db $99
	db !set_volume_l_and_r, $02, $08
	db $99
	db !set_volume_l_and_r, $1A, $06
	db $99
	db $99
	db !set_volume_l_and_r, $02, $08
	db $99
	db !return_from_sub

.subseq_2162:
	db !set_volume_l_and_r, $16, $0A
	db $99
	db !set_volume_l_and_r, $03, $07
	db $99
	db !set_volume_l_and_r, $16, $0A
	db $99
	db !return_from_sub

.subseq_216F:
	db !set_volume_l_and_r, $12, $0E
	db $99
	db !set_volume_l_and_r, $04, $06
	db $99
	db !set_volume_l_and_r, $12, $0E
	db $99
	db $99
	db !return_from_sub

.subseq_217D:
	db $80
	db !set_volume_l_and_r, $0E, $12
	db $99
	db $99
	db !set_volume_l_and_r, $06, $04
	db $99
	db !return_from_sub

.subseq_2188:
	db !set_volume_l_and_r, $0A, $16
	db $99
	db !set_volume_l_and_r, $07, $03
	db $99
	db !set_volume_l_and_r, $0A, $16
	db $99
	db $99
	db !set_volume_l_and_r, $07, $03
	db $99
	db !return_from_sub

.subseq_219A:
	db !set_volume_l_and_r, $06, $1A
	db $99
	db !set_volume_l_and_r, $08, $02
	db $99
	db !set_volume_l_and_r, $06, $1A
	db $99
	db !return_from_sub

.subseq_21A7:
	db !set_volume_l_and_r, $02, $1E
	db $99
	db !set_volume_l_and_r, $0A, $01
	db $99
	db !set_volume_l_and_r, $02, $1E
	db $99
	db $99
	db !return_from_sub

.subseq_21B5:
	db !set_volume_l_and_r, $1E, $02
	db $99
	db $99
	db !set_volume_l_and_r, $01, $0A
	db $99
	db !return_from_sub

.subseq_21BF:
	db !set_default_duration, $08
	db !set_instrument, $4D
	db !set_volume_l_and_r, $01, $0A
	db $99
	db !play_subsequence : dw .subseq_21B5
	db !set_instrument, $4A
	db !play_subsequence : dw .subseq_2150
	db !set_instrument, $48
	db !play_subsequence : dw .subseq_2162
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_216F
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_217D
	db !set_instrument, $3F
	db !play_subsequence : dw .subseq_2188
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_219A
	db !set_instrument, $37
	db !play_subsequence : dw .subseq_21A7
	db !default_duration_off
	db !return_from_sub

.subseq_21EF:
	db !set_default_duration, $08
	db !set_instrument, $3B
	db $80
	db !play_subsequence : dw .subseq_21B5
	db !set_instrument, $3F
	db !play_subsequence : dw .subseq_2150
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_2162
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_216F
	db !set_instrument, $48
	db !play_subsequence : dw .subseq_217D
	db !set_instrument, $4A
	db !play_subsequence : dw .subseq_2188
	db !set_instrument, $4D
	db !play_subsequence : dw .subseq_219A
	db !set_instrument, $4F
	db !play_subsequence : dw .subseq_21A7
	db !default_duration_off
	db !return_from_sub

.seq_221C:
	db !play_subsequence : dw .subseq_1378
	db !echo_on
.loop_point_2220:
	db !long_duration_on
	db $80, $02, $00
	db !long_duration_off
	db !set_adsr, $8E, $3C
	db !change_instr_pitch, $0E
	db !fine_tune, $E9
	db !play_subsequence : dw .subseq_21EF
	db !change_instr_pitch, $15
	db !play_subsequence : dw .subseq_21BF
	db $80, $11
	db !set_instrument, $35
	db !change_instr_pitch, $05
	db !change_instr_pitch_rel, $0C
	db !fine_tune, $EA
	db !set_adsr, $FD, $2E
	db !play_subsequence : dw .subseq_2064
	db !set_volume_l_and_r, $07, $03
	db !set_adsr, $A8, $65
	db !play_subsequence : dw .subseq_207D
	db !play_subsequence : dw .subseq_1E57
	db !set_adsr, $FB, $25
	db !play_subsequence : dw .subseq_1FDD
	db !set_volume_l_and_r, $03, $07
	db !set_adsr, $A8, $65
	db !play_subsequence : dw .subseq_207D
	db !vibrato_with_delay, $05, $01, $0B, $07
	db !play_subsequence : dw .subseq_1E39
	db !play_subsequence : dw .subseq_20DA
	db !play_subsequence : dw .subseq_1E30
	db !play_subsequence : dw .subseq_2119
	db !play_subsequence : dw .subseq_1E39
	db !play_subsequence : dw .subseq_2127
	db !play_subsequence : dw .subseq_1E30
	db !play_subsequence : dw .subseq_1FD0
	db !play_subsequence : dw .subseq_1E39
	db !play_subsequence : dw .subseq_1FBE
	db !play_subsequence : dw .subseq_1E30
	db !play_subsequence : dw .subseq_1FB4
	db $9D, $80
	db $80, $6F
	db $80, $80
	db $80, $80
	db !set_adsr, $8E, $3C
	db !change_instr_pitch, $0E
	db !fine_tune, $E9
	db !play_subsequence : dw .subseq_21EF
	db !change_instr_pitch, $15
	db !play_subsequence : dw .subseq_21BF
	db $80, $11
	db !play_subsequence : dw .subseq_1E50
	db !set_adsr, $DD, $CF
	db !play_subsequence : dw .subseq_1F46
	db !set_volume_l_and_r, $21, $11
	db !play_subsequence : dw .subseq_1F80
	db !play_subsequence : dw .subseq_1E30
	db !play_subsequence : dw .subseq_1FD0
	db !play_subsequence : dw .subseq_1E39
	db !play_subsequence : dw .subseq_1FBE
	db !play_subsequence : dw .subseq_1E30
	db !play_subsequence : dw .subseq_1FB4
	db $9D, $40
	db !play_subsequence : dw .subseq_1FD0
	db !play_subsequence : dw .subseq_1E39
	db !play_subsequence : dw .subseq_1FBE
	db !play_subsequence : dw .subseq_1E30
	db !play_subsequence : dw .subseq_1F27
	db !set_volume_l_and_r, $03, $08
	db $9D, $20
	db $9E, $10
	db !set_volume_l_and_r, $05, $01
	db $9B, $0F
	db !jump_to_sequence : dw .loop_point_2220
	db !end_sequence

.seq_22E3:
	db !play_subsequence : dw .subseq_1378
.loop_point_22E6:
	db !play_subsequence : dw .subseq_1AE9
	db !set_volume_l_and_r, $05, $0A
	db !set_adsr, $81, $E1
	db !pitch_slide_up, $00, $19, $FF, $7E, $00
	db !long_duration_on
	db $8A, $04, $00
	db !long_duration_off
	db !pitch_slide_off
	db !set_adsr, $AE, $A0
	db !set_vol_single_val, $6A
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !loop_subsequence, $04 : dw .subseq_2364
	db !play_subsequence : dw .subseq_234F
	db !set_adsr, $AE, $A0
	db !set_vol_single_val, $6A
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !play_subsequence : dw .subseq_2336
	db !loop_subsequence, $02 : dw .subseq_2364
	db !play_subsequence : dw .subseq_234F
	db !play_subsequence : dw .subseq_1AE9
	db !set_vol_single_val, $7F
	db !set_adsr, $DE, $EB
	db !change_instr_pitch, $E4
	db $83, $80
	db $85, $80
	db $86, $80
	db $88, $40
	db $88, $40
	db !jump_to_sequence : dw .loop_point_22E6
	db !end_sequence

.subseq_2336:
	db !change_instr_pitch, $0E
	db !loop_subsequence, $02 : dw .subseq_23A2
	db !change_instr_pitch, $05
	db !loop_subsequence, $02 : dw .subseq_23A2
	db !change_instr_pitch, $0E
	db !loop_subsequence, $02 : dw .subseq_23A2
	db !change_instr_pitch, $05
	db !loop_subsequence, $02 : dw .subseq_23A2
	db !return_from_sub

.subseq_234F:
	db !change_instr_pitch, $07
	db !play_subsequence : dw .subseq_23A2
	db !change_instr_pitch, $09
	db !play_subsequence : dw .subseq_23A2
	db !change_instr_pitch, $0A
	db !play_subsequence : dw .subseq_23A2
	db !change_instr_pitch, $0C
	db !play_subsequence : dw .subseq_23A2
	db !return_from_sub

.subseq_2364:
	db !change_instr_pitch, $0A
	db !play_subsequence : dw .subseq_23A2
	db !change_instr_pitch, $10
	db !play_subsequence : dw .subseq_23A2
	db !change_instr_pitch, $09
	db !play_subsequence : dw .subseq_23A2
	db !change_instr_pitch, $0E
	db !play_subsequence : dw .subseq_237E
	db !change_instr_pitch, $0C
	db !play_subsequence : dw .subseq_237E
	db !return_from_sub

.subseq_237E:
	db !set_default_duration, $08
	db !set_vol_single_val, $60
	db !set_instrument, $37
	db $81
	db !set_instrument, $3B
	db $81
	db !set_instrument, $3F
	db $81
	db !set_instrument, $43
	db $81
	db !set_instrument, $47
	db $81
	db !set_instrument, $49
	db $81
	db !set_volume_l_and_r, $9F, $60
	db !set_instrument, $4D
	db $81
	db !set_volume_l_and_r, $60, $9F
	db !set_instrument, $4F
	db $81
	db !default_duration_off
	db !return_from_sub

.subseq_23A2:
	db !set_default_duration, $08
	db !set_vol_single_val, $60
	db !set_instrument, $37
	db $81
	db !set_instrument, $39
	db $81
	db !set_instrument, $3B
	db $81
	db !set_instrument, $3D
	db $81
	db !set_instrument, $3F
	db $81
	db !set_instrument, $41
	db $81
	db !set_instrument, $43
	db $81
	db !set_instrument, $45
	db $81
	db !set_instrument, $47
	db $81
	db !set_instrument, $48
	db $81
	db !set_instrument, $49
	db $81
	db !set_instrument, $4A
	db $81
	db !set_instrument, $4B
	db $8D
	db !set_instrument, $4C
	db $81
	db !set_instrument, $4D
	db !set_volume_l_and_r, $C0, $3F
	db $8D
	db !set_instrument, $4E
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $7F, $80
	db $81
	db !change_instr_pitch_rel, $0C
	db !default_duration_off
	db !return_from_sub

base off
arch 65816
.end: