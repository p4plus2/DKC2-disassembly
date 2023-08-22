;16 Krook's March
;326F5C
castle_song_data:
	dw !bgm_loc, $0872
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_19F1, .seq_1E2B, .seq_1ADE, .seq_205C, .seq_1D1D, .seq_1EDC, .seq_2287, .seq_1C05
	db $C2, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_18E8, .seq_190E, .seq_1956, .seq_1976, .seq_198B, .seq_19A5, .seq_19AD, .seq_19CB
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_15F6, .seq_167E, .seq_1758, .seq_17B2, .seq_164E, .seq_18A3, .seq_1876, .seq_1701
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_1467, .seq_14CF, .seq_1519, .seq_1596, .seq_14A5, .seq_15D4, .seq_15E5, .seq_15B5
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_137A, .seq_13BD, .seq_13D4, .seq_13F4, .seq_140A, .seq_1420, .seq_1435, .seq_143E
	db $C0, $FF	;music tempo, sound effect tempo

.subseq_1364:
	db !set_instrument, $B1
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !vibrato_with_delay, $02, $01, $05, $0B
	db !return_from_sub

.subseq_1370:
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $AB
	db !set_adsr, $DF, $48
	db !return_from_sub

.seq_137A:
	db !play_subsequence : dw .subseq_19CF
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !set_instrument, $A5
	db !set_vol_single_val, $46
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

.seq_13BD:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $7A, $7A
	db !set_adsr, $CE, $AF
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13D4:
	db !set_volume_l_and_r, $14, $28
.loop_point_13D7:
	db !play_subsequence : dw .subseq_1364
	db !set_adsr, $AF, $C4
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A3, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db $AC, $19
	db $80, $07
	db $AC, $10
	db !end_sequence

.seq_13F4:
	db !play_subsequence : dw .subseq_18DE
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_140A:
	db !play_subsequence : dw .subseq_18DE
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_1420:
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1435:
	db $80, $0A
	db !set_volume_l_and_r, $11, $08
	db !jump_to_sequence : dw .loop_point_13D7
	db !end_sequence

.seq_143E:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $0A, $1E
	db !set_adsr, $DF, $55
	db $9E, $09
	db $9D, $07
	db $9E, $09
	db $9D, $07
	db $9E, $09
	db $9D, $07
	db $9E, $09
	db $9E, $03
	db $9E, $03
	db $9E, $03
	db $9E, $09
	db $9D, $07
	db $9E, $10
	db $9E, $10
	db !end_sequence

.seq_1467:
	db !play_subsequence : dw .subseq_19CF
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_1494
.loop_point_1483:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_1483

.subseq_1494:
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

.seq_14A5:
	db !play_subsequence : dw .subseq_18DE
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
.loop_point_14C8:
	db $99, $08
	db $99, $08
	db !jump_to_sequence : dw .loop_point_14C8

.seq_14CF:
	db !play_subsequence : dw .subseq_18DE
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
.loop_point_14F6:
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
	db !jump_to_sequence : dw .loop_point_14F6

.seq_1519:
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1534
	db !end_sequence

.subseq_1534:
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

.seq_1596:
	db !play_subsequence : dw .subseq_18DE
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
	db !play_subsequence : dw .subseq_1534
	db !end_sequence

.seq_15B5:
	db !play_subsequence : dw .subseq_18DE
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
	db !play_subsequence : dw .subseq_1534
	db !end_sequence

.seq_15D4:
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15E5:
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15F6:
	db !play_subsequence : dw .subseq_19CF
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1613
	db !end_sequence

.subseq_1613:
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

.seq_164E:
	db !play_subsequence : dw .subseq_18DE
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
	db !loop_subsequence, $0C : dw .subseq_166F
	db !default_duration_off
	db !end_sequence

.subseq_166F:
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

.seq_167E:
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_1695
	db !end_sequence

.subseq_1695:
	db !play_subsequence : dw .subseq_16A2
	db !play_subsequence : dw .subseq_16DF
	db !play_subsequence : dw .subseq_16A2
	db !play_subsequence : dw .subseq_16F0
	db !return_from_sub

.subseq_16A2:
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

.subseq_16DF:
	db !set_instrument, $08
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_16F0:
	db !set_instrument, $06
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_1701:
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_171D
	db !end_sequence

.subseq_171D:
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

.seq_1758:
	db !play_subsequence : dw .subseq_18DE
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
	db !loop_subsequence, $02 : dw .subseq_178D
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_178D
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_178D
	db !end_sequence

.subseq_178D:
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

.seq_17B2:
	db !play_subsequence : dw .subseq_18DE
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_182D
	db !play_subsequence : dw .subseq_180B
	db !echo_on
	db !play_subsequence : dw .subseq_18CF
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_17DD
	db !end_sequence

.subseq_17DD:
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

.subseq_180B:
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
.subseq_182D:
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

.seq_1876:
	db !play_subsequence : dw .subseq_18DE
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
	db !play_subsequence : dw .subseq_182D
	db !play_subsequence : dw .subseq_180B
	db !echo_on
	db !play_subsequence : dw .subseq_18CF
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_17DD
	db !end_sequence

.seq_18A3:
	db !play_subsequence : dw .subseq_18DE
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
	db !play_subsequence : dw .subseq_182D
	db !play_subsequence : dw .subseq_180B
	db !play_subsequence : dw .subseq_18CF
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_17DD
	db !end_sequence

.subseq_18CF:
	db !set_instrument, $AF
	db !change_instr_pitch, $FA
	db !fine_tune, $F2
	db !set_adsr, $9E, $CA
	db !vibrato_with_delay, $02, $03, $07, $0B
	db !return_from_sub

.subseq_18DE:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_18E8:
	db !play_subsequence : dw .subseq_19CF
	db !set_volume_l_and_r, $0A, $21
.loop_point_18EE:
	db !play_subsequence : dw .subseq_1364
	db !set_adsr, $AE, $84
	db !echo_on
	db $9E, $08
	db $A0, $08
	db $A1, $10
	db $A0, $08
	db $9E, $08
	db $9C, $08
	db $9B, $08
	db $97, $10
	db $99, $08
	db $9B, $10
	db $9C, $20
	db $9A, $40
	db !end_sequence

.seq_190E:
	db !set_instrument, $A5
	db !set_adsr, $DF, $A0
	db !set_vol_single_val, $0F
	db $9E, $04
	db $9E, $04
	db !set_vol_single_val, $14
	db $9E, $04
	db $9E, $04
	db !set_vol_single_val, $28
	db $9E, $10
	db $9E, $04
	db $9E, $04
	db $9E, $08
	db $9E, $08
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $10
	db !set_vol_single_val, $0F
	db $9E, $04
	db $9E, $04
	db !set_vol_single_val, $14
	db $9E, $04
	db $9E, $04
	db !set_vol_single_val, $28
	db $9E, $38
	db !set_vol_single_val, $0F
	db $9E, $04
	db $9E, $04
	db !set_vol_single_val, $14
	db $9E, $04
	db $9E, $04
	db !set_vol_single_val, $28
	db $9E, $38
	db !end_sequence

.seq_1956:
	db !play_subsequence : dw .subseq_19DD
	db !set_volume_l_and_r, $28, $50
	db $80, $10
	db !set_variable_note_1, $95
	db !loop_subsequence, $04 : dw .subseq_196B
	db !set_variable_note_1, $94
	db !loop_subsequence, $05 : dw .subseq_196B
	db !end_sequence

.subseq_196B:
	db !set_volume_l_and_r, $1E, $3C
	db $E0, $0C
	db !set_volume_l_and_r, $08, $0F
	db $E0, $0C
	db !return_from_sub

.seq_1976:
	db !play_subsequence : dw .subseq_19DD
	db !set_volume_l_and_r, $28, $50
	db $80, $10
	db !set_variable_note_1, $92
	db !loop_subsequence, $04 : dw .subseq_196B
	db !set_variable_note_1, $90
	db !loop_subsequence, $05 : dw .subseq_196B
	db !end_sequence

.seq_198B:
	db !play_subsequence : dw .subseq_19DD
	db !set_volume_l_and_r, $28, $50
	db $80, $10
	db !set_variable_note_1, $8F
	db !loop_subsequence, $04 : dw .subseq_196B
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_196B
	db !set_variable_note_1, $8E
	db !loop_subsequence, $04 : dw .subseq_196B
	db !end_sequence

.seq_19A5:
	db $80, $0A
	db !set_volume_l_and_r, $0B, $03
	db !jump_to_sequence : dw .loop_point_18EE

.seq_19AD:
	db !set_instrument, $B0
	db !set_adsr, $8E, $E0
	db !change_instr_pitch, $F7
	db !fine_tune, $F2
	db !set_vol_single_val, $62
	db !set_adsr, $DF, $45
	db $80, $10
	db $8B, $30
	db $8B, $10
	db $8D, $08
	db $8F, $10
	db $90, $20
	db $84, $48
	db $84, $10
.seq_19CB:
	db !end_sequence

.subseq_19CC:
	db $80, $10
	db !return_from_sub

.subseq_19CF:
	db !set_echo, $49, $0E, $0E
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.subseq_19DD:
	db !set_instrument, $1D
	db !set_adsr, $DF, $4B
	db !change_instr_pitch, $FF
	db !fine_tune, $03
	db !return_from_sub

.subseq_19E7:
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_adsr, $EF, $8B
	db !return_from_sub

.seq_19F1:
	db !echo_delay, $04
	db !play_subsequence : dw .subseq_19CC
	db !play_subsequence : dw .subseq_19CF
	db !set_instrument, $A5
	db !set_adsr, $DF, $A0
	db !set_vol_single_val, $0A
	db $9E, $04
	db !set_vol_single_val, $0F
	db $9E, $04
	db !set_vol_single_val, $14
	db $9E, $04
.loop_point_1A0A:
	db !play_subsequence : dw .subseq_1A97
	db !loop_subsequence, $06 : dw .subseq_1A97
	db !loop_subsequence, $02 : dw .subseq_1A97
	db !set_instrument, $AF
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !set_volume_l_and_r, $17, $17
	db !set_adsr, $9F, $CA
	db !vibrato_with_delay, $02, $03, $07, $0B
	db !long_duration_on
	db !change_instr_pitch_rel, $0C
	db $94, $01, $00
	db $94, $01, $00
	db $94, $01, $00
	db $94, $01, $00
	db !long_duration_off
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $06, $04
	db !set_adsr, $86, $E1
	db !long_duration_on
	db $AF, $02, $00
	db !long_duration_off
	db !set_volume_l_and_r, $10, $18
	db !set_adsr, $8B, $E5
	db !play_subsequence : dw .subseq_1A67
	db !set_instrument, $A5
	db !set_adsr, $DF, $A0
	db !loop_subsequence, $08 : dw .subseq_1A97
	db !jump_to_sequence : dw .loop_point_1A0A

.subseq_1A5C:
	db $80, $10
	db $9B, $20
	db $99, $10
	db $97, $30
	db $99, $08
	db !return_from_sub

.subseq_1A67:
	db !play_subsequence : dw .subseq_1A5C
	db $9B, $08
	db $9C, $30
	db $9B, $10
	db $99, $40
	db !play_subsequence : dw .subseq_1A5C
	db $97, $08
	db $9B, $30
	db $9C, $08
	db $9B, $08
	db $96, $30
	db $80, $10
	db !return_from_sub

.subseq_1A82:
	db !set_vol_single_val, $1E
	db $9E, $08
	db !set_vol_single_val, $08
	db $9E, $08
	db !set_vol_single_val, $04
	db $9E, $08
	db !set_vol_single_val, $0A
	db $9E, $04
	db !set_vol_single_val, $14
	db $9E, $04
	db !return_from_sub

.subseq_1A97:
	db !loop_subsequence, $02 : dw .subseq_1A82
	db !set_vol_single_val, $1E
	db $9E, $08
	db $9E, $08
	db $9E, $08
	db !set_vol_single_val, $08
	db $9E, $08
	db !set_vol_single_val, $04
	db $9E, $14
	db !set_vol_single_val, $0A
	db $9E, $04
	db $9E, $04
	db !set_vol_single_val, $14
	db $9E, $04
	db !set_vol_single_val, $1E
	db $9E, $10
	db $9E, $08
	db !set_vol_single_val, $19
	db $9E, $08
	db !set_vol_single_val, $1E
	db $9E, $08
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db !set_vol_single_val, $08
	db $9E, $08
	db !set_vol_single_val, $04
	db $9E, $24
	db !set_vol_single_val, $0A
	db $9E, $04
	db !set_vol_single_val, $0F
	db $9E, $04
	db !set_vol_single_val, $14
	db $9E, $04
	db !return_from_sub

.seq_1ADE:
	db !play_subsequence : dw .subseq_19CC
	db $80, $0C
.loop_point_1AE3:
	db !play_subsequence : dw .subseq_19DD
	db !set_variable_note_1, $96
	db !loop_subsequence, $08 : dw .subseq_1BFA
	db !loop_subsequence, $03 : dw .subseq_1BE1
	db !set_variable_note_1, $96
	db !loop_subsequence, $04 : dw .subseq_1BFA
	db !set_variable_note_1, $97
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !set_variable_note_1, $96
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $19, $12
	db !set_adsr, $8B, $E1
	db $97, $40
	db $96, $40
	db $95, $80
	db !set_volume_l_and_r, $03, $08
	db !set_adsr, $88, $E1
	db $80, $40
	db !pitch_slide_up, $00, $04, $16, $0F, $00
	db !long_duration_on
	db $A1, $01, $C0
	db !pitch_slide_down, $01, $0B, $58, $21, $00
	db $A3, $01, $00
	db !long_duration_off
	db !pitch_slide_off
	db !set_instrument, $AF
	db !change_instr_pitch, $19
	db !fine_tune, $F2
	db !set_adsr, $DF, $31
	db !set_volume_l_and_r, $09, $10
	db !change_instr_pitch, $19
	db !play_subsequence : dw .subseq_1BD5
	db !set_volume_l_and_r, $0E, $07
	db !change_instr_pitch, $13
	db !play_subsequence : dw .subseq_1BD5
	db !set_volume_l_and_r, $05, $0A
	db !change_instr_pitch, $0E
	db !play_subsequence : dw .subseq_1BD5
	db !set_volume_l_and_r, $08, $03
	db !change_instr_pitch, $08
	db !play_subsequence : dw .subseq_1BD5
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $15, $0E
	db !set_adsr, $8B, $E1
	db $97, $80
	db $96, $80
	db $97, $80
	db $97, $40
	db $96, $40
	db $97, $80
	db $96, $80
	db $97, $80
	db $97, $40
	db $96, $40
	db !play_subsequence : dw .subseq_19DD
	db !set_volume_l_and_r, $1E, $3C
	db $80, $80
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1B95
	db $E0, $80
	db !play_subsequence : dw .subseq_1B95
	db !set_variable_note_1, $97
	db !loop_subsequence, $0C : dw .subseq_1B95
	db !jump_to_sequence : dw .loop_point_1AE3

.subseq_1B95:
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db !return_from_sub

.subseq_1BAC:
	db $9F, $03
	db $9A, $03
	db $9E, $02
	db $99, $03
	db $9D, $03
	db $98, $02
	db $9C, $03
	db $97, $03
	db $9B, $02
	db $96, $03
	db $9A, $03
	db $95, $02
	db $99, $03
	db $94, $03
	db $98, $02
	db $93, $03
	db $97, $03
	db $92, $02
	db $96, $03
	db $91, $03
	db !return_from_sub

.subseq_1BD5:
	db !play_subsequence : dw .subseq_1BAC
	db $95, $02
	db $90, $03
	db $94, $03
	db $8F, $02
	db !return_from_sub

.subseq_1BE1:
	db !set_variable_note_1, $96
	db !loop_subsequence, $06 : dw .subseq_1BFA
	db !set_variable_note_1, $95
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !set_variable_note_1, $97
	db !loop_subsequence, $06 : dw .subseq_1BFA
	db !set_variable_note_1, $9A
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !return_from_sub

.subseq_1BFA:
	db !set_volume_l_and_r, $1E, $3C
	db $E0, $10
	db !set_volume_l_and_r, $08, $0F
	db $E0, $10
	db !return_from_sub

.seq_1C05:
	db !play_subsequence : dw .subseq_19CC
	db $80, $0C
.loop_point_1C0A:
	db !play_subsequence : dw .subseq_19DD
	db !set_variable_note_1, $92
	db !loop_subsequence, $08 : dw .subseq_1BFA
	db !loop_subsequence, $03 : dw .subseq_1CEA
	db !set_variable_note_1, $92
	db !loop_subsequence, $04 : dw .subseq_1BFA
	db !set_variable_note_1, $94
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !set_variable_note_1, $92
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $19, $12
	db !set_adsr, $8B, $E1
	db $94, $40
	db $92, $40
	db $91, $80
	db !set_volume_l_and_r, $03, $08
	db !set_adsr, $88, $E1
	db $80, $40
	db !pitch_slide_up, $00, $04, $16, $0E, $00
	db !long_duration_on
	db $A0, $01, $C0
	db !pitch_slide_down, $01, $0B, $58, $21, $00
	db $A1, $01, $00
	db !long_duration_off
	db !pitch_slide_off
	db !set_instrument, $AF
	db !change_instr_pitch, $19
	db !fine_tune, $F2
	db !set_adsr, $DF, $31
	db $80, $0A
	db !set_volume_l_and_r, $06, $04
	db !change_instr_pitch, $19
	db !play_subsequence : dw .subseq_1BD5
	db !set_volume_l_and_r, $02, $05
	db !change_instr_pitch, $13
	db !play_subsequence : dw .subseq_1BD5
	db !set_volume_l_and_r, $04, $02
	db !change_instr_pitch, $0E
	db !play_subsequence : dw .subseq_1BD5
	db !set_volume_l_and_r, $01, $03
	db !change_instr_pitch, $08
	db !play_subsequence : dw .subseq_1BAC
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $15, $0E
	db !set_adsr, $8B, $E1
	db $94, $80
	db $93, $80
	db $94, $80
	db $94, $40
	db $93, $40
	db $94, $80
	db $93, $80
	db $94, $80
	db $94, $40
	db $93, $40
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_19E7
	db !loop_subsequence, $03 : dw .subseq_1CDB
	db !jump_to_sequence : dw .loop_point_1C0A

.subseq_1CB5:
	db !load_volume_preset_1
	db $E0, $04
	db !load_volume_preset_2
	db $E0, $04
	db !return_from_sub

.subseq_1CBC:
	db $80, $80
	db $80, $10
	db !set_volume_presets, $14, $23, $08, $04
	db !loop_subsequence, $02 : dw .subseq_1CB5
	db !play_subsequence : dw .subseq_20C9
	db !load_volume_preset_1
	db $E1, $04
	db !load_volume_preset_2
	db $E1, $0C
	db !load_volume_preset_1
	db $E1, $0C
	db !load_volume_preset_2
	db $E1, $0C
	db $80, $28
	db !return_from_sub

.subseq_1CDB:
	db !set_variable_note_1, $A3
	db !set_variable_note_2, $A3
	db !play_subsequence : dw .subseq_1CBC
	db !set_variable_note_1, $A3
	db !set_variable_note_2, $A5
	db !play_subsequence : dw .subseq_1CBC
	db !return_from_sub

.subseq_1CEA:
	db !set_variable_note_1, $92
	db !loop_subsequence, $06 : dw .subseq_1BFA
	db !set_variable_note_1, $91
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !set_variable_note_1, $94
	db !loop_subsequence, $06 : dw .subseq_1BFA
	db !set_variable_note_1, $96
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !return_from_sub

.subseq_1D03:
	db !play_subsequence : dw .subseq_19DD
	db !set_default_duration, $10
	db !set_volume_l_and_r, $08, $0F
	db $8F
	db !set_volume_l_and_r, $1E, $3C
	db $8F
	db !set_volume_l_and_r, $08, $0F
	db $8F
	db !set_volume_l_and_r, $1E, $3C
	db $8F
	db !set_volume_l_and_r, $08, $0F
	db $8F
	db !return_from_sub

.seq_1D1D:
	db !play_subsequence : dw .subseq_19CC
	db $80, $0C
.loop_point_1D22:
	db !play_subsequence : dw .subseq_19DD
	db !set_variable_note_1, $8F
	db !loop_subsequence, $08 : dw .subseq_1BFA
	db !loop_subsequence, $02 : dw .subseq_1E12
	db !set_volume_l_and_r, $1E, $3C
	db $8F, $10
	db !play_subsequence : dw .subseq_19E7
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_1DF6
	db !play_subsequence : dw .subseq_1D03
	db !set_volume_l_and_r, $1E, $3C
	db $8C
	db !default_duration_off
	db !play_subsequence : dw .subseq_19E7
	db !set_variable_note_1, $A1
	db !play_subsequence : dw .subseq_1DDC
	db !set_volume_l_and_r, $04, $02
	db $E0, $10
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_1DF6
	db !play_subsequence : dw .subseq_1D03
	db !set_volume_l_and_r, $1E, $3C
	db $91
	db !default_duration_off
	db !play_subsequence : dw .subseq_19E7
	db !set_variable_note_1, $A6
	db !play_subsequence : dw .subseq_1DDC
	db !play_subsequence : dw .subseq_19DD
	db !set_variable_note_1, $8F
	db !loop_subsequence, $08 : dw .subseq_1BFA
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $19, $12
	db !set_adsr, $8B, $E1
	db $8F, $80
	db $8C, $80
	db !set_instrument, $AF
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_volume_l_and_r, $0B, $0B
	db !set_adsr, $9F, $CA
	db !vibrato_with_delay, $02, $02, $08, $0B
	db !long_duration_on
	db !change_instr_pitch_rel, $0C
	db $94, $01, $00
	db $94, $01, $00
	db $94, $01, $00
	db $94, $01, $00
	db !long_duration_off
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $15, $0E
	db !set_adsr, $8B, $E1
	db !loop_subsequence, $07 : dw .subseq_1DCD
	db $8F, $40
	db $8F, $40
	db !set_instrument, $AC
	db !change_instr_pitch, $F0
	db !fine_tune, $F6
	db !long_duration_on
	db $80, $04, $00
	db !long_duration_off
	db !echo_on
	db !set_volume_l_and_r, $15, $08
	db !set_adsr, $AF, $AB
	db !loop_subsequence, $10 : dw .subseq_1DD0
	db !jump_to_sequence : dw .loop_point_1D22

.subseq_1DCD:
	db $8F, $80
	db !return_from_sub

.subseq_1DD0:
	db !set_default_duration, $08
	db $96
	db $92
	db $97
	db $92
	db $9B
	db $92
	db $9E
	db $92
	db !default_duration_off
	db !return_from_sub

.subseq_1DDC:
	db !set_volume_l_and_r, $0F, $1A
	db $E0, $06
	db !set_volume_l_and_r, $08, $04
	db $E0, $02
	db !set_volume_l_and_r, $0F, $1A
	db $E0, $06
	db !set_volume_l_and_r, $04, $08
	db $E0, $02
	db !set_volume_l_and_r, $0F, $1A
	db $E0, $20
	db !return_from_sub

.subseq_1DF6:
	db !set_volume_presets, $14, $23, $08, $04
	db !load_volume_preset_1
	db $E0, $08
	db !load_volume_preset_2
	db $E0, $18
	db !load_volume_preset_1
	db $E0, $08
	db !load_volume_preset_2
	db $E0, $08
	db !loop_subsequence, $02 : dw .subseq_20D0
	db !load_volume_preset_1
	db $E0, $08
	db !load_volume_preset_2
	db $E0, $18
	db !return_from_sub

.subseq_1E12:
	db !set_variable_note_1, $8F
	db !loop_subsequence, $06 : dw .subseq_1BFA
	db !set_variable_note_1, $8C
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !set_variable_note_1, $8F
	db !loop_subsequence, $06 : dw .subseq_1BFA
	db !set_variable_note_1, $91
	db !loop_subsequence, $02 : dw .subseq_1BFA
	db !return_from_sub

.seq_1E2B:
	db !play_subsequence : dw .subseq_19CC
	db $80, $0C
.loop_point_1E30:
	db !set_instrument, $B0
	db !set_adsr, $8E, $E0
	db !change_instr_pitch, $F7
	db !fine_tune, $F2
	db !set_vol_single_val, $62
	db !set_adsr, $DF, $45
	db $80, $80
	db $97, $30
	db $96, $10
	db $92, $10
	db $91, $30
	db !loop_subsequence, $03 : dw .subseq_1ED1
	db $8F, $20
	db $8D, $20
	db $8B, $20
	db $8A, $20
	db $88, $20
	db $86, $10
	db $85, $10
	db $83, $40
	db $88, $40
	db $86, $40
	db $89, $80
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $14
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1EA1
	db !set_instrument, $B0
	db !set_adsr, $8E, $E0
	db !change_instr_pitch, $F7
	db !fine_tune, $F2
	db !set_vol_single_val, $64
	db !set_adsr, $DF, $85
	db $88, $80
	db $87, $80
	db $90, $80
	db $8F, $80
	db $88, $80
	db $87, $80
	db $90, $80
	db $8F, $40
	db $87, $40
	db !loop_subsequence, $04 : dw .subseq_1E94
	db !jump_to_sequence : dw .loop_point_1E30

.subseq_1E94:
	db $88, $60
	db $8A, $20
	db $8B, $80
	db $84, $60
	db $88, $20
	db $86, $80
	db !return_from_sub

.subseq_1EA1:
	db $88, $40
	db $90, $40
	db $8F, $80
	db $8B, $40
	db $8D, $40
	db $8F, $80
	db $88, $40
	db $84, $40
	db $83, $80
	db $81, $40
	db $82, $40
	db $83, $80
	db !return_from_sub

.subseq_1EBA:
	db $8F, $30
	db $91, $10
	db $92, $08
	db $91, $08
	db $92, $10
	db $80, $30
	db $94, $08
	db $96, $08
	db $97, $10
	db $96, $10
	db $95, $40
	db !return_from_sub

.subseq_1ED1:
	db !play_subsequence : dw .subseq_1EBA
	db !change_instr_pitch_rel, $05
	db !play_subsequence : dw .subseq_1EBA
	db !change_instr_pitch_rel, $FB
	db !return_from_sub

.seq_1EDC:
	db !play_subsequence : dw .subseq_19CC
	db $80, $0C
.loop_point_1EE1:
	db !set_instrument, $B0
	db !set_adsr, $8E, $E0
	db !change_instr_pitch, $F7
	db !fine_tune, $F2
	db !set_vol_single_val, $23
	db !set_adsr, $DF, $44
	db $80, $0F
	db $80, $80
	db $97, $30
	db $96, $10
	db $92, $10
	db $91, $30
	db !loop_subsequence, $02 : dw .subseq_1ED1
	db !play_subsequence : dw .subseq_19E7
	db $80, $01
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_1DF6
	db $80, $60
	db !set_variable_note_1, $9D
	db !play_subsequence : dw .subseq_1DDC
	db !set_volume_l_and_r, $04, $02
	db $E0, $10
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_1DF6
	db $80, $60
	db !set_variable_note_1, $A4
	db !play_subsequence : dw .subseq_1DDC
	db !set_volume_l_and_r, $0E, $26
	db !play_subsequence : dw .subseq_2003
	db !set_volume_l_and_r, $14, $0E
	db !play_subsequence : dw .subseq_1F53
	db !change_instr_pitch_rel, $0C
	db !loop_subsequence, $04 : dw .subseq_1FD9
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $08, $14
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1F6F
	db $80, $10
	db !play_subsequence : dw .subseq_1F69
	db !play_subsequence : dw .subseq_19E7
	db !long_duration_on
	db $80, $02, $00
	db !long_duration_off
	db !loop_subsequence, $03 : dw .subseq_1F5A
	db !jump_to_sequence : dw .loop_point_1EE1

.subseq_1F53:
	db !play_subsequence : dw .subseq_1370
	db !play_subsequence : dw .subseq_201C
	db !return_from_sub

.subseq_1F5A:
	db !set_variable_note_1, $A2
	db !set_variable_note_2, $A0
	db !play_subsequence : dw .subseq_1CBC
	db !set_variable_note_1, $A2
	db !set_variable_note_2, $A2
	db !play_subsequence : dw .subseq_1CBC
	db !return_from_sub

.subseq_1F69:
	db !play_subsequence : dw .subseq_1F80
	db $96, $40
	db !return_from_sub

.subseq_1F6F:
	db !play_subsequence : dw .subseq_1F80
	db $96, $30
	db !return_from_sub

.subseq_1F75:
	db $80, $10
	db $97, $20
	db $96, $10
	db $94, $30
	db $96, $08
	db !return_from_sub

.subseq_1F80:
	db !play_subsequence : dw .subseq_1F75
	db $97, $08
	db $9B, $30
	db $99, $10
	db $96, $40
	db !play_subsequence : dw .subseq_1F75
	db $94, $08
	db $97, $30
	db $99, $08
	db $97, $08
	db !return_from_sub

.subseq_1F97:
	db !set_volume_l_and_r, $0A, $1E
	db $E0, $08
	db !set_volume_l_and_r, $0B, $04
	db $E0, $08
	db !return_from_sub

.subseq_1FA2:
	db !play_subsequence : dw .subseq_1FB0
	db !set_volume_l_and_r, $03, $08
	db $E0, $08
	db !set_volume_l_and_r, $06, $02
	db $E0, $08
	db !return_from_sub

.subseq_1FB0:
	db !set_volume_l_and_r, $1E, $0A
	db $E0, $08
	db !set_volume_l_and_r, $04, $0B
	db $E0, $08
	db !return_from_sub

.subseq_1FBB:
	db !play_subsequence : dw .subseq_1FB0
	db !set_volume_l_and_r, $08, $03
	db $E0, $08
	db !set_volume_l_and_r, $02, $06
	db $E0, $08
	db !return_from_sub

.subseq_1FC9:
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1FBB
	db !return_from_sub

.subseq_1FD9:
	db !play_subsequence : dw .subseq_1FC9
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1FBB
	db !play_subsequence : dw .subseq_1FC9
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1FB0
	db !return_from_sub

.subseq_2003:
	db $9E, $30
	db $9D, $10
	db $9E, $28
	db $80, $08
	db $A0, $08
	db $A2, $08
	db $A3, $20
	db $A2, $10
	db $A0, $10
	db $A2, $10
	db $9E, $10
	db $9B, $A0
	db !return_from_sub

.subseq_201C:
	db $80, $08
	db !set_default_duration, $04
	db $91
	db $95
	db $98
	db $9D
	db $A1
	db $A4
	db $A9
	db $AD
	db $B0
	db $B5
	db $B0
	db $AD
	db $A9
	db $A4
	db $A1
	db $9D
	db $98
	db $95
	db $98
	db $9D
	db $A1
	db $A4
	db $A9
	db $AD
	db $A9
	db $A4
	db $98
	db $95
	db !default_duration_off
	db $91, $08
	db !return_from_sub

.subseq_2040:
	db !play_subsequence : dw .subseq_1370
	db $80, $4D
	db $96, $03
	db !play_subsequence : dw .subseq_2273
	db !return_from_sub

.subseq_204B:
	db !set_instrument, $AF
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !play_subsequence : dw .subseq_23C9
	db !return_from_sub

.subseq_2055:
	db !play_subsequence : dw .subseq_1370
	db !play_subsequence : dw .subseq_2273
	db !return_from_sub

.seq_205C:
	db !play_subsequence : dw .subseq_19CC
	db $80, $0C
.loop_point_2061:
	db !long_duration_on
	db $80, $02, $80
	db !long_duration_off
	db !set_vol_single_val, $16
	db !play_subsequence : dw .subseq_2040
	db !set_vol_single_val, $08
	db !set_adsr, $8F, $CB
	db !play_subsequence : dw .subseq_204B
	db !set_vol_single_val, $16
	db !play_subsequence : dw .subseq_2055
	db !set_vol_single_val, $08
	db !set_adsr, $8F, $CB
	db !play_subsequence : dw .subseq_204B
	db !set_vol_single_val, $16
	db !play_subsequence : dw .subseq_2055
	db !play_subsequence : dw .subseq_19E7
	db !set_vol_single_val, $3C
	db !set_default_duration, $20
	db $8F
	db $8D
	db $8B
	db $8A
	db $88
	db !default_duration_off
	db $86, $10
	db $85, $10
	db $83, $40
	db $88, $40
	db $86, $40
	db $89, $80
	db !set_instrument, $22
	db !change_instr_pitch, $05
	db !fine_tune, $B6
	db !loop_subsequence, $04 : dw .subseq_2237
	db !play_subsequence : dw .subseq_21CD
	db !play_subsequence : dw .subseq_2261
	db !play_subsequence : dw .subseq_21CD
	db !set_vol_single_val, $16
	db !play_subsequence : dw .subseq_1370
	db !play_subsequence : dw .subseq_21B9
	db !set_adsr, $DF, $B1
	db !loop_subsequence, $10 : dw .subseq_219B
	db !play_subsequence : dw .subseq_19E7
	db !play_subsequence : dw .subseq_20E5
	db !jump_to_sequence : dw .loop_point_2061

.subseq_20C9:
	db !load_volume_preset_1
	db $E0, $0C
	db !load_volume_preset_2
	db $E0, $04
	db !return_from_sub

.subseq_20D0:
	db !load_volume_preset_1
	db $E0, $06
	db !load_volume_preset_2
	db $E0, $02
	db !return_from_sub

.subseq_20D7:
	db !load_volume_preset_1
	db $E0, $18
	db !load_volume_preset_2
	db $E0, $08
	db !return_from_sub

.subseq_20DE:
	db !load_volume_preset_1
	db $E0, $10
	db !load_volume_preset_2
	db $E0, $08
	db !return_from_sub

.subseq_20E5:
	db !set_volume_presets, $28, $1C, $0A, $11
	db $80, $20
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_20DE
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_20D0
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_20C9
	db !load_volume_preset_1
	db $9B, $30
	db !load_volume_preset_2
	db $9B, $20
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_20DE
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_20D0
	db !load_volume_preset_1
	db $97, $40
	db !load_volume_preset_2
	db $97, $20
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_20DE
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_20D0
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_20C9
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_20C9
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_20C9
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_20C9
	db !load_volume_preset_1
	db $99, $40
	db !load_volume_preset_2
	db $99, $40
	db $80, $20
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_20DE
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_20D0
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_20C9
	db !load_volume_preset_1
	db $9B, $20
	db !load_volume_preset_2
	db $9B, $10
	db !set_variable_note_1, $9C
	db !play_subsequence : dw .subseq_20D7
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_20DE
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_20D0
	db !load_volume_preset_1
	db $9B, $20
	db !load_volume_preset_2
	db $9B, $10
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_20D0
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_20D0
	db !set_variable_note_1, $9C
	db !play_subsequence : dw .subseq_20D7
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_20DE
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_20D0
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_20D7
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_20D7
	db !load_volume_preset_1
	db $97, $20
	db !load_volume_preset_2
	db $97, $10
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_20D0
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_20D0
	db !load_volume_preset_1
	db $99, $20
	db !load_volume_preset_2
	db $99, $20
	db !return_from_sub

.subseq_219B:
	db !set_volume_presets, $0A, $26, $0F, $04
	db !load_volume_preset_1
	db $96, $08
	db !load_volume_preset_2
	db $9E, $08
	db !load_volume_preset_1
	db $97, $08
	db !load_volume_preset_2
	db $96, $08
	db !load_volume_preset_1
	db $9B, $08
	db !load_volume_preset_2
	db $97, $08
	db !load_volume_preset_1
	db $9E, $08
	db !load_volume_preset_2
	db $9B, $08
	db !return_from_sub

.subseq_21B9:
	db !set_default_duration, $04
	db $93
	db $96
	db $9B
	db $9F
	db $96
	db $9B
	db $9F
	db $A2
	db $9B
	db $9F
	db $A2
	db $A7
	db $9F
	db $A2
	db $A7
	db $AB
	db !default_duration_off
	db !return_from_sub

.subseq_21CD:
	db $80, $10
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_1FB0
	db $80, $30
	db $80, $10
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $93
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_1FB0
	db $80, $30
	db $80, $10
	db !set_variable_note_1, $90
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $9C
	db !play_subsequence : dw .subseq_1FB0
	db $80, $30
	db $80, $10
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1FB0
	db !return_from_sub

.subseq_2227:
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1F97
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1F97
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1FA2
	db !return_from_sub

.subseq_2237:
	db !play_subsequence : dw .subseq_2227
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1F97
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1F97
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1FA2
	db !play_subsequence : dw .subseq_2227
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1F97
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_1F97
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1F97
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1F97
	db !return_from_sub

.subseq_2261:
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $93
	db !play_subsequence : dw .subseq_1FB0
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1FB0
	db $80, $10
	db !return_from_sub

.subseq_2273:
	db !set_default_duration, $03
	db $91
	db $96
	db $9A
	db $9D
	db $A2
	db $A6
	db $A9
	db $AE
	db $A9
	db $A6
	db $A2
	db $9D
	db $A6
	db $A2
	db $9D
	db $9A
	db !default_duration_off
	db !return_from_sub

.seq_2287:
	db !play_subsequence : dw .subseq_19CC
	db $80, $0C
.loop_point_228C:
	db !long_duration_on
	db $80, $02, $80
	db !long_duration_off
	db $80, $0F
	db !set_vol_single_val, $08
	db !play_subsequence : dw .subseq_2040
	db !set_vol_single_val, $04
	db !set_adsr, $8E, $C8
	db !play_subsequence : dw .subseq_204B
	db !set_vol_single_val, $08
	db !play_subsequence : dw .subseq_2055
	db !play_subsequence : dw .subseq_19E7
	db $80, $01
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1DF6
	db $80, $0A
	db !set_instrument, $AF
	db !set_vol_single_val, $04
	db !set_adsr, $8E, $C8
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db $9B, $10
	db $A3, $10
	db $A2, $10
	db $9E, $10
	db $9B, $10
	db $A1, $06
	db !play_subsequence : dw .subseq_19E7
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_1DDC
	db !set_volume_l_and_r, $04, $02
	db $E0, $10
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1DF6
	db $80, $0A
	db !set_instrument, $AF
	db !set_vol_single_val, $04
	db !set_adsr, $8E, $C8
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db $A0, $10
	db $A8, $10
	db $A7, $10
	db $A3, $10
	db $A0, $10
	db $A6, $06
	db !play_subsequence : dw .subseq_19E7
	db !set_variable_note_1, $9D
	db !play_subsequence : dw .subseq_1DDC
	db !set_volume_l_and_r, $0E, $05
	db $80, $0F
	db !play_subsequence : dw .subseq_2003
	db !set_volume_l_and_r, $04, $0B
	db !play_subsequence : dw .subseq_1F53
	db !play_subsequence : dw .subseq_1364
	db !set_vol_single_val, $08
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1EA1
	db !set_volume_l_and_r, $08, $04
	db !play_subsequence : dw .subseq_1F6F
	db $80, $01
	db !set_instrument, $AF
	db !change_instr_pitch, $19
	db !fine_tune, $F2
	db !set_volume_l_and_r, $05, $0B
	db !set_adsr, $AF, $C2
	db !play_subsequence : dw .subseq_2368
	db !play_subsequence : dw .subseq_1370
	db !set_volume_l_and_r, $04, $0B
	db $80, $0A
	db !play_subsequence : dw .subseq_21B9
	db !play_subsequence : dw .subseq_19E7
	db !long_duration_on
	db $80, $01, $F6
	db !long_duration_off
	db !loop_subsequence, $03 : dw .subseq_2352
	db !echo_on
	db !set_volume_l_and_r, $09, $04
	db !set_adsr, $AF, $AB
	db !set_instrument, $AC
	db !change_instr_pitch, $F0
	db !fine_tune, $F6
	db !jump_to_sequence : dw .loop_point_228C

.subseq_2352:
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $9B
	db !play_subsequence : dw .subseq_1CBC
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $9E
	db !play_subsequence : dw .subseq_1CBC
	db !return_from_sub

.subseq_2361:
	db !load_volume_preset_1
	db $99, $08
	db !load_volume_preset_2
	db $99, $08
	db !return_from_sub

.subseq_2368:
	db $80, $10
	db !set_volume_presets, $05, $0B, $06, $02
	db !load_volume_preset_1
	db $9B, $08
	db !load_volume_preset_2
	db $9B, $18
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_2361
	db !load_volume_preset_1
	db $97, $08
	db !load_volume_preset_2
	db $97, $28
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1CB5
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_1CB5
	db !load_volume_preset_1
	db $9C, $08
	db !load_volume_preset_2
	db $9C, $28
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_2361
	db !load_volume_preset_1
	db $99, $08
	db !load_volume_preset_2
	db $99, $38
	db $80, $10
	db !load_volume_preset_1
	db $9B, $08
	db !load_volume_preset_2
	db $9B, $18
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_2361
	db !load_volume_preset_1
	db $97, $08
	db !load_volume_preset_2
	db $97, $28
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1CB5
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1CB5
	db !load_volume_preset_1
	db $9B, $08
	db !load_volume_preset_2
	db $9B, $28
	db !set_variable_note_1, $9C
	db !play_subsequence : dw .subseq_1CB5
	db !set_variable_note_1, $9B
	db !play_subsequence : dw .subseq_1CB5
	db !return_from_sub

.subseq_23C9:
	db !set_default_duration, $10
	db !loop_subsequence, $03 : dw .subseq_23DA
	db $A1
	db $9D
	db $A1
	db $9D
	db !loop_subsequence, $03 : dw .subseq_23DF
	db $A6
	db !default_duration_off
	db !return_from_sub

.subseq_23DA:
	db $A3
	db $A2
	db $9E
	db $9B
	db !return_from_sub

.subseq_23DF:
	db $A8
	db $A7
	db $A3
	db $A0
	db !return_from_sub

base off
arch 65816
.end: