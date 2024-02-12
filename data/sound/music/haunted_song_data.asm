;17 Haunted Chase
;328044
haunted_song_data:
	dw !bgm_loc, $0845
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_19C3, .seq_1AD1, .seq_1C23, .seq_1F22, .seq_1C96, .seq_209C, .seq_2231, .seq_1D81
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_18CF, .seq_18F4, .seq_190E, .seq_197F, .seq_1939, .seq_1988, .seq_199F, .seq_1968
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_15F5, .seq_167F, .seq_1759, .seq_17B2, .seq_164F, .seq_18A3, .seq_1876, .seq_1702
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_1450, .seq_14BA, .seq_1504, .seq_1581, .seq_1490, .seq_15BF, .seq_15D0, .seq_15A0
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_1364, .seq_13A7, .seq_13BD, .seq_13DD, .seq_13F3, .seq_1409, .seq_141E, .seq_1427
	db $C0, $FF	;music tempo, sound effect tempo

.seq_1364:
	db !play_subsequence : dw .subseq_19B2
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

.seq_13A7:
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A7
	db !set_vol_single_val, $50
	db !set_adsr, $9F, $CE
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13BD:
	db !set_volume_l_and_r, $14, $28
.loop_point_13C0:
	db !play_subsequence : dw .subseq_205B
	db !set_adsr, $AF, $C4
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $9B, $07
	db $9D, $05
	db $9E, $04
	db $9F, $06
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_13DD:
	db !play_subsequence : dw .subseq_15EB
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_13F3:
	db !play_subsequence : dw .subseq_15EB
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_1409:
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_141E:
	db $80, $0A
	db !set_volume_l_and_r, $11, $08
	db !jump_to_sequence : dw .loop_point_13C0
	db !end_sequence

.seq_1427:
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

.seq_1450:
	db !play_subsequence : dw .subseq_19B2
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !change_instr_pitch, $08
	db !loop_subsequence, $03 : dw .subseq_147F
.loop_point_146E:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_146E

.subseq_147F:
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

.seq_1490:
	db !play_subsequence : dw .subseq_15EB
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
.loop_point_14B3:
	db $99, $08
	db $99, $08
	db !jump_to_sequence : dw .loop_point_14B3

.seq_14BA:
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A7
	db !set_vol_single_val, $50
	db !set_adsr, $9F, $CE
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
.loop_point_14E0:
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
	db !jump_to_sequence : dw .loop_point_14E0
	db !end_sequence

.seq_1504:
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_151F
	db !end_sequence

.subseq_151F:
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

.seq_1581:
	db !play_subsequence : dw .subseq_15EB
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
	db !play_subsequence : dw .subseq_151F
	db !end_sequence

.seq_15A0:
	db !play_subsequence : dw .subseq_15EB
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
	db !play_subsequence : dw .subseq_151F
	db !end_sequence

.seq_15BF:
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15D0:
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.subseq_15E1:
	db !set_instrument, $1E
	db !set_adsr, $8E, $F6
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !return_from_sub

.subseq_15EB:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_15F5:
	db !play_subsequence : dw .subseq_19B2
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !change_instr_pitch, $08
	db !loop_subsequence, $0C : dw .subseq_1614
	db !end_sequence

.subseq_1614:
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

.seq_164F:
	db !play_subsequence : dw .subseq_15EB
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
	db !loop_subsequence, $0C : dw .subseq_1670
	db !default_duration_off
	db !end_sequence

.subseq_1670:
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

.seq_167F:
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_1696
	db !end_sequence

.subseq_1696:
	db !play_subsequence : dw .subseq_16A3
	db !play_subsequence : dw .subseq_16E0
	db !play_subsequence : dw .subseq_16A3
	db !play_subsequence : dw .subseq_16F1
	db !return_from_sub

.subseq_16A3:
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

.subseq_16E0:
	db !set_instrument, $08
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_16F1:
	db !set_instrument, $06
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_1702:
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_171E
	db !end_sequence

.subseq_171E:
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

.seq_1759:
	db !play_subsequence : dw .subseq_15EB
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A7
	db !set_vol_single_val, $50
	db !set_adsr, $9F, $CE
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
	db !play_subsequence : dw .subseq_15EB
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
	db !play_subsequence : dw .subseq_15E1
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
	db !play_subsequence : dw .subseq_15EB
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
	db !play_subsequence : dw .subseq_15E1
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_17DD
	db !end_sequence

.seq_18A3:
	db !play_subsequence : dw .subseq_15EB
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
	db !play_subsequence : dw .subseq_15E1
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_17DD
	db !end_sequence

.seq_18CF:
	db !play_subsequence : dw .subseq_19B2
	db !set_volume_l_and_r, $14, $28
.loop_point_18D5:
	db !play_subsequence : dw .subseq_205B
	db !set_adsr, $AF, $C4
	db $9E, $08
	db $A0, $08
	db $A1, $10
	db $A0, $08
	db $9E, $10
	db $9B, $08
	db $97, $10
	db $99, $08
	db $9B, $10
	db $9C, $18
	db $80, $08
	db $9A, $20
	db !end_sequence

.seq_18F4:
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A7
	db !set_vol_single_val, $50
	db !set_adsr, $9F, $CE
	db $80, $10
	db $8B, $30
	db $8B, $10
	db $8D, $08
	db $8F, $10
	db $90, $20
	db $90, $40
	db !end_sequence

.seq_190E:
	db !set_instrument, $BE
	db !change_instr_pitch, $FC
	db !fine_tune, $1E
	db !set_volume_l_and_r, $1E, $0A
	db !set_adsr, $8F, $E0
	db !echo_on
	db $80, $10
	db !set_default_duration, $08
	db $A1
	db $A1
	db $A0
	db $A1
	db $A3
	db $9E
	db $A1
	db $A1
	db $A0
	db $A1
	db $A3
	db $A3
	db $9A
	db $9A
	db $99
	db $9A
	db $9C
	db $97
	db $9A
	db $9A
	db $99
	db $9A
	db $9C
	db $97
	db !default_duration_off
	db !end_sequence

.seq_1939:
	db !set_instrument, $BE
	db !change_instr_pitch, $FC
	db !fine_tune, $1E
	db !set_volume_l_and_r, $1E, $0A
	db !set_adsr, $8F, $E0
	db !echo_on
	db $80, $10
	db $9E, $08
	db $9E, $08
	db $9E, $08
	db $9E, $08
	db $9E, $10
	db !set_default_duration, $08
	db $9E
	db $9E
	db $9E
	db $9E
	db $9E
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db $A0
	db !default_duration_off
	db !end_sequence

.seq_1968:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $8E, $EB
	db $80, $10
	db $9B, $30
	db $9B, $28
	db $9C, $20
	db $9A, $40
	db !end_sequence

.seq_197F:
	db $80, $0E
	db !set_volume_l_and_r, $11, $07
	db !jump_to_sequence : dw .loop_point_18D5
	db !end_sequence

.seq_1988:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $8E, $EB
	db $80, $10
	db $95, $30
	db $97, $28
	db $97, $20
	db $97, $40
	db !end_sequence

.seq_199F:
	db !play_subsequence : dw .subseq_21EA
	db !set_vol_single_val, $50
	db !set_adsr, $8F, $EB
	db $80, $10
	db $8B, $30
	db $8B, $28
	db $90, $20
	db $90, $40
	db !end_sequence

.subseq_19B2:
	db !set_echo, $28, $1B, $1B
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.subseq_19C0:
	db $80, $10
	db !return_from_sub

.seq_19C3:
	db !echo_delay, $06
	db !play_subsequence : dw .subseq_19C0
	db !set_master_volume_indirect, $46
	db !set_volume_presets, $14, $1E, $0B, $06
	db !play_subsequence : dw .subseq_19B2
.loop_point_19D2:
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A7
	db !set_vol_single_val, $50
	db !set_adsr, $9F, $CE
	db !loop_subsequence, $04 : dw .subseq_1AC8
	db $88, $30
	db $88, $18
	db $88, $18
	db $84, $30
	db $83, $30
	db $82, $60
	db $84, $30
	db $83, $30
	db $82, $60
	db !set_variable_note_1, $88
	db !loop_subsequence, $14 : dw .subseq_1A7C
	db !set_variable_note_1, $8E
	db !loop_subsequence, $04 : dw .subseq_1A7C
	db !set_variable_note_1, $8D
	db !loop_subsequence, $04 : dw .subseq_1A7C
	db !set_variable_note_1, $88
	db !loop_subsequence, $08 : dw .subseq_1A7C
	db !set_variable_note_1, $87
	db !loop_subsequence, $02 : dw .subseq_1A7C
	db !set_variable_note_1, $86
	db !loop_subsequence, $04 : dw .subseq_1A7C
	db !set_variable_note_1, $85
	db !loop_subsequence, $02 : dw .subseq_1A7C
	db $80, $C0
	db !play_subsequence : dw .subseq_2227
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db !change_instr_pitch_rel, $F4
	db !play_subsequence : dw .subseq_1A53
	db !play_subsequence : dw .subseq_21E0
	db !set_volume_l_and_r, $14, $32
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $0C
	db !set_volume_l_and_r, $0A, $14
	db $80, $0C
	db !set_volume_l_and_r, $14, $32
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $0C
	db !set_volume_l_and_r, $0A, $14
	db $80, $0C
	db !jump_to_sequence : dw .loop_point_19D2
	db !end_sequence

.subseq_1A53:
	db $8B, $30
	db $8A, $28
	db $88, $08
	db $8A, $18
	db $8B, $18
	db $8D, $18
	db $8F, $18
	db $90, $30
	db $8F, $28
	db $8D, $08
	db $8F, $30
	db $8B, $18
	db $8D, $0C
	db $8F, $0C
	db $90, $30
	db $8F, $28
	db $8D, $08
	db $8F, $40
	db $8B, $10
	db $8A, $10
	db !return_from_sub

.subseq_1A7C:
	db !set_default_duration, $08
	db !set_instrument, $BA
	db !change_instr_pitch, $F0
	db !fine_tune, $F2
	db !set_vol_single_val, $50
	db !set_adsr, $DE, $4B
	db $E0
	db !set_instrument, $3F
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !set_vol_single_val, $3C
	db !set_adsr, $AF, $A0
	db $E0
	db !set_instrument, $BB
	db !change_instr_pitch, $DD
	db !fine_tune, $F0
	db !set_vol_single_val, $78
	db !set_adsr, $AF, $AE
	db $E0
	db !set_instrument, $28
	db !change_instr_pitch, $FC
	db !fine_tune, $F0
	db !set_vol_single_val, $32
	db !set_adsr, $AF, $A0
	db $E0
	db !set_instrument, $BB
	db !change_instr_pitch, $E9
	db !fine_tune, $F0
	db !set_vol_single_val, $64
	db !set_adsr, $AE, $AE
	db $E0
	db !set_instrument, $49
	db !change_instr_pitch, $F9
	db !fine_tune, $E9
	db !set_vol_single_val, $3C
	db !set_adsr, $CE, $54
	db $E0
	db !default_duration_off
	db !return_from_sub

.subseq_1AC8:
	db $88, $18
	db $86, $18
	db $88, $18
	db $89, $18
	db !return_from_sub

.seq_1AD1:
	db !play_subsequence : dw .subseq_19C0
.loop_point_1AD4:
	db !set_instrument, $BE
	db !change_instr_pitch, $FC
	db !fine_tune, $1E
	db !set_volume_l_and_r, $28, $19
	db !set_adsr, $8F, $E0
	db !echo_on
	db !loop_subsequence, $04 : dw .subseq_1C19
	db !play_subsequence : dw .subseq_1C09
	db !loop_subsequence, $02 : dw .subseq_1C19
	db $80, $60
	db !loop_subsequence, $02 : dw .subseq_1BED
	db $80, $C0
	db !play_subsequence : dw .subseq_1B89
	db !set_variable_note_1, $8E
	db !loop_subsequence, $02 : dw .subseq_1B79
	db !set_variable_note_1, $8D
	db !loop_subsequence, $02 : dw .subseq_1B79
	db !loop_subsequence, $04 : dw .subseq_1B5D
	db !set_volume_l_and_r, $28, $19
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1B29
	db !set_volume_l_and_r, $14, $0A
	db !change_instr_pitch_rel, $0C
	db !loop_subsequence, $10 : dw .subseq_1B1F
	db $80, $60
	db !jump_to_sequence : dw .loop_point_1AD4
	db !end_sequence

.subseq_1B1F:
	db !set_default_duration, $08
	db $94
	db $94
	db $94
	db $94
	db $94
	db $94
	db !default_duration_off
	db !return_from_sub

.subseq_1B29:
	db !set_default_duration, $08
	db $87
	db $96
	db $97
	db $99
	db $97
	db $96
	db $9B
	db $99
	db $97
	db $99
	db $97
	db $96
	db $86
	db $96
	db $97
	db $99
	db $97
	db $96
	db $9B
	db $99
	db $97
	db $99
	db $97
	db $96
	db $86
	db $96
	db $97
	db $99
	db $97
	db $96
	db $9B
	db $99
	db $97
	db $99
	db $97
	db $96
	db $85
	db $96
	db $97
	db $99
	db $97
	db $96
	db $9B
	db $99
	db $97
	db $99
	db $97
	db $96
	db !default_duration_off
	db !return_from_sub

.subseq_1B5D:
	db !set_volume_l_and_r, $3C, $28
	db !set_adsr, $8F, $E0
	db !set_default_duration, $08
	db $94
	db $94
	db $92
	db $94
	db $95
	db $94
	db !set_volume_l_and_r, $14, $0F
	db $94
	db $94
	db $94
	db !set_volume_l_and_r, $0A, $05
	db $94
	db $94
	db $94
	db !default_duration_off
	db !return_from_sub

.subseq_1B79:
	db !set_default_duration, $08
	db $E0
	db $94
	db $96
	db $97
	db $96
	db $94
	db $99
	db $97
	db $96
	db $97
	db $96
	db $94
	db !default_duration_off
	db !return_from_sub

.subseq_1B89:
	db !set_default_duration, $08
	db $88
	db $94
	db $96
	db $97
	db $96
	db $94
	db $88
	db $94
	db $96
	db $97
	db $96
	db $94
	db $88
	db $94
	db $96
	db $97
	db $96
	db $94
	db $90
	db $97
	db $96
	db $8F
	db $97
	db $96
	db $88
	db $94
	db $96
	db $97
	db $96
	db $94
	db $9C
	db $94
	db $96
	db $97
	db $96
	db $94
	db $88
	db $94
	db $96
	db $97
	db $96
	db $94
	db $90
	db $97
	db $96
	db $8F
	db $97
	db $96
	db $88
	db $94
	db $96
	db $97
	db $96
	db $94
	db $88
	db $99
	db $9B
	db $9C
	db $9B
	db $99
	db $88
	db $96
	db $97
	db $99
	db $97
	db $96
	db $90
	db $97
	db $96
	db $8F
	db $97
	db $96
	db $88
	db $94
	db $96
	db $97
	db $96
	db $94
	db $9C
	db $99
	db $9B
	db $9C
	db $9B
	db $99
	db $9D
	db $96
	db $97
	db $99
	db $97
	db $96
	db $9C
	db $97
	db $96
	db $9B
	db $97
	db $96
	db !default_duration_off
	db !return_from_sub

.subseq_1BED:
	db !set_default_duration, $08
	db $90
	db $94
	db $96
	db $97
	db $96
	db $94
	db $8F
	db $94
	db $96
	db $97
	db $96
	db $94
	db $8E
	db $94
	db $96
	db $97
	db $96
	db $94
	db $99
	db $97
	db $96
	db $97
	db $96
	db $94
	db !default_duration_off
	db !return_from_sub

.subseq_1C09:
	db !set_default_duration, $08
	db $94
	db $92
	db $94
	db $95
	db $97
	db $99
	db $9A
	db $99
	db $97
	db $99
	db $97
	db $95
	db !default_duration_off
	db !return_from_sub

.subseq_1C19:
	db !set_default_duration, $08
	db $94
	db $92
	db $94
	db $95
	db $94
	db $92
	db !default_duration_off
	db !return_from_sub

.seq_1C23:
	db !play_subsequence : dw .subseq_19C0
.loop_point_1C26:
	db !set_instrument, $BE
	db !change_instr_pitch, $08
	db !fine_tune, $1E
	db !echo_on
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_1C19
	db !play_subsequence : dw .subseq_1C09
	db !loop_subsequence, $02 : dw .subseq_1C19
	db $80, $60
	db !loop_subsequence, $02 : dw .subseq_1BED
	db $80, $C0
	db !play_subsequence : dw .subseq_1B89
	db !set_variable_note_1, $8E
	db $80, $60
	db !play_subsequence : dw .subseq_1B79
	db !set_variable_note_1, $8D
	db $80, $60
	db !play_subsequence : dw .subseq_1B79
	db !loop_subsequence, $04 : dw .subseq_1C7A
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1B29
	db !change_instr_pitch_rel, $0C
	db !loop_subsequence, $10 : dw .subseq_1C70
	db $80, $60
	db !jump_to_sequence : dw .loop_point_1C26
	db !end_sequence

.subseq_1C70:
	db !set_default_duration, $08
	db $97
	db $97
	db $96
	db $97
	db $99
	db $96
	db !default_duration_off
	db !return_from_sub

.subseq_1C7A:
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $8F, $E0
	db !set_default_duration, $08
	db $94
	db $94
	db $92
	db $94
	db $95
	db $94
	db !set_volume_l_and_r, $0F, $0A
	db $94
	db $94
	db $94
	db !set_volume_l_and_r, $08, $03
	db $94
	db $94
	db $94
	db !default_duration_off
	db !return_from_sub

.seq_1C96:
	db !play_subsequence : dw .subseq_19C0
.loop_point_1C99:
	db !set_volume_l_and_r, $1E, $3C
	db !set_adsr, $AF, $C4
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !loop_subsequence, $02 : dw .subseq_1D6A
	db $80, $60
	db !loop_subsequence, $02 : dw .subseq_1D20
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db !set_vol_single_val, $1E
	db !set_adsr, $8A, $EB
	db $88, $90
	db $84, $18
	db $83, $18
	db $88, $90
	db $84, $18
	db $83, $18
	db $88, $90
	db $84, $18
	db $83, $18
	db !set_vol_single_val, $32
	db $88, $30
	db $90, $30
	db $91, $30
	db $90, $18
	db $8F, $18
	db $88, $30
	db $90, $30
	db $91, $30
	db $90, $18
	db $8F, $18
	db !set_vol_single_val, $3C
	db $8E, $C0
	db $8D, $C0
	db $80, $C0
	db $80, $C0
	db $80, $C0
	db $80, $C0
	db $80, $C0
	db !play_subsequence : dw .subseq_2227
	db !set_volume_l_and_r, $2C, $32
	db !set_adsr, $8F, $E0
	db !change_instr_pitch_rel, $0C
	db !play_subsequence : dw .subseq_1A53
	db !set_volume_l_and_r, $1E, $3C
	db !set_adsr, $AF, $C4
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $10
	db $80, $08
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $10
	db $80, $08
	db !change_instr_pitch_rel, $F4
	db !jump_to_sequence : dw .loop_point_1C99
	db !end_sequence

.subseq_1D20:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db !load_volume_preset_1
	db $80, $08
	db $97, $08
	db $97, $08
	db $97, $0C
	db !set_volume_l_and_r, $11, $06
	db $97, $0C
	db !load_volume_preset_1
	db $80, $08
	db $97, $08
	db $97, $08
	db $97, $0C
	db !set_volume_l_and_r, $11, $06
	db $97, $0C
	db !set_volume_l_and_r, $14, $28
	db !set_default_duration, $08
	db $80
	db $96
	db $96
	db $96
	db $96
	db $96
	db !set_volume_l_and_r, $14, $28
	db $96
	db !set_volume_l_and_r, $11, $06
	db $96
	db !set_volume_l_and_r, $14, $28
	db $96
	db !set_volume_l_and_r, $11, $06
	db $96
	db !set_volume_l_and_r, $14, $28
	db $96
	db !set_volume_l_and_r, $11, $06
	db $96
	db !default_duration_off
	db !return_from_sub

.subseq_1D6A:
	db $80, $60
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $10
	db $80, $08
	db $94, $12
	db $9A, $03
	db $9B, $03
	db $9C, $10
	db $80, $08
	db !return_from_sub

.seq_1D81:
	db !play_subsequence : dw .subseq_19C0
	db $80, $0F
.loop_point_1D86:
	db !set_volume_l_and_r, $1C, $06
	db !set_adsr, $AF, $C4
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !loop_subsequence, $02 : dw .subseq_1D6A
	db $80, $51
	db !loop_subsequence, $02 : dw .subseq_1ED4
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db !set_vol_single_val, $1E
	db !set_adsr, $8A, $EB
	db $8F, $30
	db $90, $30
	db $91, $30
	db $90, $18
	db $8F, $18
	db $8F, $30
	db $90, $30
	db $91, $30
	db $90, $18
	db $8F, $18
	db $8F, $30
	db $90, $30
	db $91, $30
	db $90, $18
	db $8F, $0F
	db !set_instrument, $A5
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $32, $3C
	db !set_adsr, $AF, $A8
	db !set_volume_l_and_r, $0A, $14
	db $99, $03
	db !load_volume_preset_1
	db $99, $03
	db !set_volume_l_and_r, $1E, $28
	db $99, $03
	db !set_volume_l_and_r, $32, $3C
	db $99, $18
	db $99, $18
	db $80, $3F
	db !set_volume_l_and_r, $0A, $14
	db $99, $03
	db !load_volume_preset_1
	db $99, $03
	db !set_volume_l_and_r, $1E, $28
	db $99, $03
	db !set_volume_l_and_r, $32, $3C
	db $99, $18
	db $99, $08
	db $98, $08
	db $99, $08
	db $99, $18
	db !loop_subsequence, $02 : dw .subseq_236E
	db $80, $0F
	db !set_volume_l_and_r, $0A, $14
	db $99, $03
	db !load_volume_preset_1
	db $99, $03
	db !set_volume_l_and_r, $1E, $28
	db $99, $03
	db !set_volume_l_and_r, $32, $3C
	db $99, $18
	db $99, $08
	db $98, $08
	db $99, $08
	db $99, $18
	db !play_subsequence : dw .subseq_21EA
	db !set_vol_single_val, $50
	db !set_adsr, $8F, $EB
	db $8E, $40
	db !set_instrument, $BD
	db !set_vol_single_val, $64
	db !set_adsr, $90, $F1
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db $94, $80
	db !set_vol_single_val, $46
	db !set_adsr, $9F, $8B
	db $94, $C0
	db !loop_subsequence, $02 : dw .subseq_1E79
	db $80, $C0
	db $80, $C0
	db $80, $C0
	db !play_subsequence : dw .subseq_2227
	db !set_volume_l_and_r, $11, $0E
	db $80, $0F
	db !set_adsr, $8F, $E0
	db !change_instr_pitch_rel, $0C
	db !play_subsequence : dw .subseq_1A53
	db !set_volume_l_and_r, $1C, $06
	db !set_adsr, $AF, $C4
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $10
	db $80, $08
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $10
	db $80, $08
	db !change_instr_pitch_rel, $F4
	db !jump_to_sequence : dw .loop_point_1D86
	db !end_sequence

.subseq_1E79:
	db !play_subsequence : dw .subseq_21EA
	db !set_volume_l_and_r, $46, $46
	db !set_adsr, $AF, $8E
	db $88, $08
	db $88, $08
	db $88, $08
	db $88, $08
	db $88, $08
	db $88, $20
	db !set_volume_l_and_r, $32, $3C
	db !set_instrument, $A5
	db !set_volume_l_and_r, $3C, $46
	db !set_adsr, $8F, $EB
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db !play_subsequence : dw .subseq_21EA
	db !set_vol_single_val, $46
	db !set_adsr, $AF, $8E
	db $88, $08
	db $88, $08
	db $88, $08
	db $88, $08
	db $88, $08
	db $88, $08
	db !set_volume_l_and_r, $32, $3C
	db !set_instrument, $A5
	db !set_adsr, $8F, $EB
	db !set_volume_l_and_r, $3C, $46
	db $9A, $08
	db !load_volume_preset_1
	db $9A, $08
	db !set_volume_l_and_r, $3C, $46
	db $9A, $08
	db !load_volume_preset_1
	db $9A, $08
	db !set_volume_l_and_r, $3C, $46
	db $9A, $08
	db !load_volume_preset_1
	db $9A, $08
	db !return_from_sub

.subseq_1ED4:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db !set_volume_l_and_r, $14, $28
	db $80, $08
	db $94, $08
	db $94, $08
	db $94, $0C
	db !set_volume_l_and_r, $11, $06
	db $94, $0C
	db !set_volume_l_and_r, $14, $28
	db $80, $08
	db $94, $08
	db $94, $08
	db $94, $0C
	db !set_volume_l_and_r, $11, $06
	db $94, $0C
	db !set_volume_l_and_r, $14, $28
	db !set_default_duration, $08
	db $80
	db $94
	db $94
	db $94
	db $94
	db $94
	db !set_volume_l_and_r, $14, $28
	db $94
	db !set_volume_l_and_r, $11, $06
	db $94
	db !set_volume_l_and_r, $14, $28
	db $94
	db !set_volume_l_and_r, $11, $06
	db $94
	db !set_volume_l_and_r, $14, $28
	db $94
	db !set_volume_l_and_r, $11, $06
	db $94
	db !default_duration_off
	db !return_from_sub

.seq_1F22:
	db !play_subsequence : dw .subseq_19C0
.loop_point_1F25:
	db !set_instrument, $BA
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $0F, $19
	db !set_adsr, $91, $80
	db !vibrato_with_delay, $02, $01, $08, $08
	db $A0, $C0
	db $A0, $C0
	db !set_instrument, $B9
	db !change_instr_pitch, $01
	db !fine_tune, $F6
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $78
	db $92, $18
	db !set_vol_single_val, $1E
	db $92, $18
	db !set_vol_single_val, $78
	db $92, $18
	db $92, $18
	db !set_vol_single_val, $1E
	db $92, $18
	db !set_vol_single_val, $14
	db $92, $18
	db !set_vol_single_val, $0A
	db $92, $18
	db !set_vol_single_val, $05
	db $92, $18
	db !set_instrument, $BD
	db !set_vol_single_val, $64
	db !set_adsr, $90, $F1
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db $80, $40
	db $96, $80
	db !set_vol_single_val, $46
	db !set_adsr, $9F, $8B
	db $96, $C0
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db $80, $60
	db $80, $C0
	db $80, $B7
	db !set_volume_l_and_r, $11, $1C
	db $A0, $03
	db $A1, $03
	db $A2, $03
	db !load_volume_preset_1
	db $A3, $10
	db !load_volume_preset_2
	db $A3, $08
	db !load_volume_preset_1
	db $A2, $10
	db !load_volume_preset_2
	db $A2, $08
	db $80, $48
	db !load_volume_preset_1
	db $A3, $10
	db !load_volume_preset_2
	db $A3, $08
	db !load_volume_preset_1
	db $A3, $18
	db $A2, $10
	db !load_volume_preset_2
	db $A2, $08
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $AF, $C4
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $10
	db $80, $08
	db $94, $12
	db $9A, $03
	db $9B, $03
	db $9C, $10
	db $80, $08
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db $80, $18
	db !load_volume_preset_1
	db $A3, $10
	db !load_volume_preset_2
	db $A3, $08
	db !load_volume_preset_1
	db $A3, $18
	db $A2, $10
	db !load_volume_preset_2
	db $A2, $08
	db $80, $C0
	db $80, $C0
	db !loop_subsequence, $02 : dw .subseq_2062
	db !play_subsequence : dw .subseq_205B
	db !set_volume_l_and_r, $0A, $14
	db !set_adsr, $8F, $E0
	db $9F, $1C
	db $80, $04
	db $9F, $06
	db $80, $02
	db $9F, $06
	db $80, $02
	db $9F, $0C
	db $80, $04
	db $9F, $0C
	db $80, $04
	db $9F, $0C
	db $80, $04
	db $9E, $30
	db $80, $30
	db $9E, $1C
	db $80, $04
	db $9E, $06
	db $80, $02
	db $9E, $06
	db $80, $02
	db $9E, $0C
	db $80, $04
	db $9E, $0C
	db $80, $04
	db $9E, $0C
	db $80, $04
	db $9D, $30
	db $80, $30
	db !set_volume_l_and_r, $0E, $1C
	db !loop_subsequence, $10 : dw .subseq_2051
	db !set_instrument, $B9
	db !change_instr_pitch, $01
	db !fine_tune, $F6
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $78
	db $92, $18
	db !set_vol_single_val, $1E
	db $92, $18
	db !set_vol_single_val, $78
	db $92, $18
	db !set_vol_single_val, $1E
	db $92, $18
	db !jump_to_sequence : dw .loop_point_1F25
	db !end_sequence

.subseq_2051:
	db !set_default_duration, $08
	db $9B
	db $9B
	db $99
	db $9B
	db $9C
	db $99
	db !default_duration_off
	db !return_from_sub

.subseq_205B:
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !return_from_sub

.subseq_2062:
	db !play_subsequence : dw .subseq_205B
	db !load_volume_preset_1
	db !set_adsr, $8F, $E0
	db $A0, $08
	db $A0, $08
	db $9E, $08
	db $A0, $08
	db $A1, $08
	db $A0, $08
	db !load_volume_preset_2
	db $A0, $08
	db $80, $10
	db !play_subsequence : dw .subseq_2227
	db !load_volume_preset_1
	db $A0, $08
	db $A2, $08
	db $A3, $08
	db !load_volume_preset_2
	db $A3, $08
	db $80, $28
	db !load_volume_preset_1
	db $A8, $08
	db !load_volume_preset_2
	db $A8, $08
	db !load_volume_preset_1
	db $A7, $08
	db !load_volume_preset_2
	db $A7, $08
	db !load_volume_preset_1
	db $A5, $08
	db !load_volume_preset_2
	db $A5, $08
	db !return_from_sub

.seq_209C:
	db !play_subsequence : dw .subseq_19C0
.loop_point_209F:
	db !echo_on
	db !loop_subsequence, $02 : dw .subseq_21F4
	db !echo_off
	db !set_instrument, $BD
	db !set_vol_single_val, $50
	db !set_adsr, $9F, $91
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db $96, $30
	db $96, $18
	db $96, $18
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_vol_single_val, $3C
	db !set_adsr, $8F, $E0
	db $84, $30
	db $83, $30
	db $82, $60
	db $84, $30
	db $83, $30
	db $82, $60
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db $80, $C0
	db $80, $C0
	db $80, $C0
	db !load_volume_preset_1
	db $A0, $10
	db !load_volume_preset_2
	db $A0, $08
	db !load_volume_preset_1
	db $A0, $10
	db !load_volume_preset_2
	db $A0, $08
	db $80, $48
	db !load_volume_preset_1
	db $A0, $10
	db !load_volume_preset_2
	db $A0, $08
	db !load_volume_preset_1
	db $A0, $18
	db $A0, $10
	db !load_volume_preset_2
	db $A0, $08
	db !set_volume_l_and_r, $11, $07
	db !set_adsr, $AF, $C4
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db $80, $0F
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $10
	db $80, $08
	db $94, $12
	db $9A, $03
	db $9B, $03
	db $9C, $10
	db $80, $08
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db $80, $09
	db !load_volume_preset_1
	db $A0, $10
	db !load_volume_preset_2
	db $A0, $08
	db !load_volume_preset_1
	db $A0, $18
	db $A0, $10
	db !load_volume_preset_2
	db $A0, $08
	db $80, $C0
	db $80, $C0
	db !loop_subsequence, $02 : dw .subseq_21A2
	db !play_subsequence : dw .subseq_205B
	db !load_volume_preset_2
	db !set_adsr, $8F, $E0
	db $80, $0F
	db $9F, $1C
	db $80, $04
	db $9F, $06
	db $80, $02
	db $9F, $06
	db $80, $02
	db $9F, $0C
	db $80, $04
	db $9F, $0C
	db $80, $04
	db $9F, $0C
	db $80, $04
	db $9E, $30
	db $80, $30
	db $9E, $1C
	db $80, $04
	db $9E, $06
	db $80, $02
	db $9E, $06
	db $80, $02
	db $9E, $0C
	db $80, $04
	db $9E, $0C
	db $80, $04
	db $9E, $0C
	db $80, $04
	db $9D, $30
	db $80, $21
	db $80, $05
	db !load_volume_preset_2
	db !loop_subsequence, $0F : dw .subseq_2051
	db $9B, $08
	db $9B, $08
	db $99, $08
	db $9B, $08
	db $9C, $08
	db $99, $03
	db !set_instrument, $BD
	db !set_vol_single_val, $50
	db !set_adsr, $9F, $91
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db $96, $30
	db $96, $30
	db !jump_to_sequence : dw .loop_point_209F
	db !end_sequence

.subseq_21A2:
	db !play_subsequence : dw .subseq_205B
	db !load_volume_preset_2
	db !set_adsr, $8F, $E0
	db $80, $0F
	db $A0, $08
	db $A0, $08
	db $9E, $08
	db $A0, $08
	db $A1, $08
	db $A0, $08
	db !set_volume_l_and_r, $02, $05
	db $A0, $08
	db $80, $01
	db !play_subsequence : dw .subseq_2227
	db !load_volume_preset_1
	db $9C, $08
	db $9C, $08
	db $9C, $08
	db !load_volume_preset_2
	db $9C, $08
	db $80, $28
	db !load_volume_preset_1
	db $A5, $08
	db !load_volume_preset_2
	db $A5, $08
	db !load_volume_preset_1
	db $A3, $08
	db !load_volume_preset_2
	db $A3, $08
	db !load_volume_preset_1
	db $A3, $08
	db !load_volume_preset_2
	db $A3, $08
	db !return_from_sub

.subseq_21E0:
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B3
	db !set_adsr, $AF, $C4
	db !return_from_sub

.subseq_21EA:
	db !change_instr_pitch, $00
	db !fine_tune, $AD
	db !set_adsr, $8F, $E0
	db !set_instrument, $A4
	db !return_from_sub

.subseq_21F4:
	db !play_subsequence : dw .subseq_21E0
	db $80, $60
	db !set_volume_l_and_r, $14, $32
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $0C
	db !set_volume_l_and_r, $0A, $14
	db $80, $0C
	db !set_volume_l_and_r, $14, $32
	db $94, $12
	db $9A, $03
	db $9B, $03
	db $9C, $0C
	db !set_volume_l_and_r, $0A, $14
	db $80, $0C
	db !return_from_sub

.subseq_221A:
	db !set_instrument, $A5
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_volume_l_and_r, $32, $3C
	db !set_adsr, $8F, $E1
	db !return_from_sub

.subseq_2227:
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db !return_from_sub

.seq_2231:
	db !play_subsequence : dw .subseq_19C0
.loop_point_2234:
	db $80, $60
	db !loop_subsequence, $02 : dw .subseq_236E
	db $80, $60
	db !loop_subsequence, $02 : dw .subseq_236E
	db !set_vol_single_val, $46
	db !play_subsequence : dw .subseq_21EA
	db $88, $30
	db $88, $18
	db $88, $18
	db !loop_subsequence, $02 : dw .subseq_2328
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db $80, $C0
	db $80, $C0
	db $80, $C0
	db !load_volume_preset_1
	db $9B, $10
	db !load_volume_preset_2
	db $9B, $08
	db !load_volume_preset_1
	db $9B, $10
	db !load_volume_preset_2
	db $9B, $08
	db $80, $48
	db !load_volume_preset_1
	db $91, $10
	db !load_volume_preset_2
	db $91, $08
	db !load_volume_preset_1
	db $90, $18
	db $8F, $10
	db !load_volume_preset_2
	db $8F, $08
	db !play_subsequence : dw .subseq_21E0
	db !set_volume_l_and_r, $14, $32
	db $94, $12
	db $99, $03
	db $9A, $03
	db $9B, $0C
	db !set_volume_l_and_r, $0A, $14
	db $80, $0C
	db !set_volume_l_and_r, $14, $32
	db $94, $12
	db $9A, $03
	db $9B, $03
	db $9C, $0C
	db !set_volume_l_and_r, $0A, $14
	db $80, $0C
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F1
	db !set_adsr, $AF, $AE
	db $80, $18
	db !load_volume_preset_1
	db $91, $10
	db !load_volume_preset_2
	db $91, $08
	db !load_volume_preset_1
	db $90, $18
	db $8F, $10
	db !load_volume_preset_2
	db $8F, $08
	db $80, $C0
	db $80, $C0
	db !loop_subsequence, $02 : dw .subseq_22E8
	db $80, $C0
	db $80, $C0
	db !play_subsequence : dw .subseq_21E0
	db !echo_on
	db !set_volume_l_and_r, $08, $11
	db !loop_subsequence, $10 : dw .subseq_22DB
	db !echo_off
	db !set_vol_single_val, $46
	db !play_subsequence : dw .subseq_21EA
	db $88, $30
	db $88, $30
	db !jump_to_sequence : dw .loop_point_2234
	db !end_sequence

.subseq_22DB:
	db $9B, $08
	db $80, $08
	db $99, $08
	db $9B, $08
	db $9C, $08
	db $99, $08
	db !return_from_sub

.subseq_22E8:
	db !play_subsequence : dw .subseq_221A
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db $80, $18
	db !play_subsequence : dw .subseq_2227
	db !load_volume_preset_1
	db $9B, $08
	db $9B, $08
	db $9B, $08
	db !play_subsequence : dw .subseq_221A
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db $9A, $08
	db !play_subsequence : dw .subseq_2227
	db !load_volume_preset_1
	db $A3, $08
	db !load_volume_preset_2
	db $A3, $08
	db !load_volume_preset_1
	db $A0, $08
	db !load_volume_preset_2
	db $A0, $08
	db !load_volume_preset_1
	db $A0, $08
	db !load_volume_preset_2
	db $A0, $08
	db !return_from_sub

.subseq_2328:
	db !set_volume_l_and_r, $32, $3C
	db !set_instrument, $A5
	db !set_volume_l_and_r, $1E, $28
	db $80, $02
	db $98, $03
	db $98, $03
	db !set_volume_l_and_r, $32, $3C
	db $98, $08
	db $98, $08
	db $98, $18
	db !set_volume_l_and_r, $1E, $28
	db $80, $02
	db $98, $03
	db $98, $03
	db !set_volume_l_and_r, $32, $3C
	db $98, $08
	db $98, $08
	db $98, $18
	db !set_volume_l_and_r, $1E, $28
	db $80, $02
	db $98, $03
	db $98, $03
	db !set_volume_l_and_r, $32, $3C
	db $98, $08
	db $98, $08
	db $98, $08
	db $98, $08
	db $98, $08
	db $98, $10
	db $98, $10
	db $98, $10
	db !return_from_sub

.subseq_236E:
	db !set_vol_single_val, $46
	db !play_subsequence : dw .subseq_21EA
	db $88, $12
	db !set_volume_l_and_r, $3C, $50
	db !set_instrument, $A5
	db $96, $03
	db $96, $03
	db $96, $08
	db !load_volume_preset_1
	db $96, $08
	db !set_volume_l_and_r, $0A, $14
	db $96, $08
	db !return_from_sub

base off
arch 65816
.end: