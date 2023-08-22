;1D Jib Jig
;32BFAF
rigging_song_data:
	dw !bgm_loc, $0819
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_19D7, .seq_1B69, .seq_1CEA, .seq_2284, .seq_201C, .seq_219A, .seq_2200, .seq_1EA0
	db $A0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_18D6, .seq_191F, .seq_1944, .seq_199D, .seq_197A, .seq_198B, .seq_1994, .seq_195B
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_1603, .seq_1689, .seq_1763, .seq_17BB, .seq_165B, .seq_18AA, .seq_187E, .seq_170C
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_1475, .seq_14DD, .seq_1526, .seq_15A3, .seq_14B3, .seq_15E1, .seq_15F2, .seq_15C2
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_1388, .seq_13CB, .seq_13E0, .seq_13FE, .seq_1414, .seq_144A, .seq_142A, .seq_143F
	db $C0, $FF	;music tempo, sound effect tempo

.unreached_1364:
	db !return_from_sub

.subseq_1365:
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !set_adsr, $AF, $4B
	db !return_from_sub

.subseq_136F:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.subseq_1379:
	db !set_adsr, $8C, $8E
	db !set_instrument, $21
	db !change_instr_pitch, $0C
	db !fine_tune, $AB
	db !vibrato_with_delay, $05, $02, $0C, $03
	db !return_from_sub

.seq_1388:
	db !play_subsequence : dw .subseq_19C6
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

.seq_13CB:
	db !play_subsequence : dw .subseq_136F
	db !change_instr_pitch_rel, $F4
	db !set_vol_single_val, $7A
	db !set_adsr, $CE, $AF
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13E0:
	db !play_subsequence : dw .subseq_1365
	db !set_volume_l_and_r, $32, $14
.loop_point_13E6:
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

.seq_13FE:
	db !play_subsequence : dw .subseq_136F
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_1414:
	db !play_subsequence : dw .subseq_136F
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_142A:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_143F:
	db !play_subsequence : dw .subseq_1365
	db !set_volume_l_and_r, $08, $12
	db $80, $14
	db !jump_to_sequence : dw .loop_point_13E6

.seq_144A:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $0A, $14
	db !set_adsr, $FF, $58
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
	db $9E, $09
	db $9D, $07
	db $9E, $10
	db !end_sequence

.seq_1475:
	db !play_subsequence : dw .subseq_19C6
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_14A2
.loop_point_1491:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_1491

.subseq_14A2:
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

.seq_14B3:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $AF, $B2
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db !set_adsr, $8F, $F8
.loop_point_14D6:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .loop_point_14D6

.seq_14DD:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_136F
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
.loop_point_1502:
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
	db !jump_to_sequence : dw .loop_point_1502
	db !end_sequence

.seq_1526:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1541
	db !end_sequence

.subseq_1541:
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

.seq_15A3:
	db !play_subsequence : dw .subseq_136F
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
	db !play_subsequence : dw .subseq_1541
	db !end_sequence

.seq_15C2:
	db !play_subsequence : dw .subseq_136F
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
	db !play_subsequence : dw .subseq_1541
	db !end_sequence

.seq_15E1:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15F2:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1603:
	db !play_subsequence : dw .subseq_19C6
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1620
	db !end_sequence

.subseq_1620:
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

.seq_165B:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_167A
	db !default_duration_off
	db !end_sequence

.subseq_167A:
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

.seq_1689:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_16A0
	db !end_sequence

.subseq_16A0:
	db !play_subsequence : dw .subseq_16AD
	db !play_subsequence : dw .subseq_16EA
	db !play_subsequence : dw .subseq_16AD
	db !play_subsequence : dw .subseq_16FB
	db !return_from_sub

.subseq_16AD:
	db !set_instrument, $05
	db !set_vol_single_val, $4A
	db !set_adsr, $8F, $E0
	db !pitch_slide_down, $01, $01, $0B, $0B, $00
	db $8D
	db !pitch_slide_off
	db !set_instrument, $07
	db !set_vol_single_val, $11
	db !pitch_slide_up, $02, $01, $16, $16, $00
	db $9A
	db !pitch_slide_off
	db !set_instrument, $01
	db !set_adsr, $8E, $EF
	db $88
	db !set_instrument, $07
	db !set_adsr, $8F, $E0
	db !pitch_slide_up, $02, $01, $16, $16, $00
	db $9A
	db !pitch_slide_off
	db !set_instrument, $02
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $87
	db !set_instrument, $03
	db !set_adsr, $8F, $EF
	db $88
	db !return_from_sub

.subseq_16EA:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_16FB:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_170C:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1728
	db !end_sequence

.subseq_1728:
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

.seq_1763:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_136F
	db !change_instr_pitch_rel, $F4
	db !set_vol_single_val, $7B
	db !set_adsr, $CE, $AF
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1796
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_1796
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1796
	db !end_sequence

.subseq_1796:
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

.seq_17BB:
	db !play_subsequence : dw .subseq_136F
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1835
	db !play_subsequence : dw .subseq_1813
	db !play_subsequence : dw .subseq_1365
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_17E5
	db !end_sequence

.subseq_17E5:
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

.subseq_1813:
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
.subseq_1835:
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

.seq_187E:
	db !play_subsequence : dw .subseq_136F
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
	db !play_subsequence : dw .subseq_1835
	db !play_subsequence : dw .subseq_1813
	db !play_subsequence : dw .subseq_1365
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_17E5
	db !end_sequence

.seq_18AA:
	db !play_subsequence : dw .subseq_136F
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
	db !play_subsequence : dw .subseq_1835
	db !play_subsequence : dw .subseq_1813
	db !play_subsequence : dw .subseq_1365
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_17E5
	db !end_sequence

.seq_18D6:
	db !play_subsequence : dw .subseq_19C6
	db !set_volume_l_and_r, $18, $18
	db !play_subsequence : dw .subseq_18E0
	db !end_sequence

.subseq_18E0:
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $04
	db $92, $04
	db $92, $02
	db $92, $0E
	db $92, $08
	db $92, $02
	db $92, $06
	db $92, $08
	db $92, $08
	db $92, $02
	db $92, $0E
	db $92, $08
	db $92, $02
	db $92, $0E
	db $92, $02
	db $92, $1E
	db $92, $02
	db $92, $02
	db !loop_subsequence, $10 : dw .subseq_191C
	db $92, $03
	db $92, $03
	db $92, $03
	db $92, $08
	db !return_from_sub

.subseq_191C:
	db $92, $04
	db !return_from_sub

.seq_191F:
	db !set_volume_l_and_r, $28, $14
.loop_point_1922:
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !set_adsr, $AF, $4B
	db $9E, $04
	db $A0, $04
	db $A1, $10
	db $A0, $08
	db $9E, $08
	db $9C, $08
	db $9B, $08
	db $97, $10
	db $9A, $08
	db $9B, $10
	db $9C, $20
	db $9A, $60
	db !end_sequence

.seq_1944:
	db !play_subsequence : dw .subseq_1379
	db !set_volume_l_and_r, $06, $0C
	db $80, $08
	db $A1, $18
	db $A1, $18
	db $97, $10
	db $9A, $08
	db $9B, $10
	db $9C, $20
	db $9A, $60
	db !end_sequence

.seq_195B:
	db !play_subsequence : dw .subseq_1379
	db $80, $08
	db !set_volume_l_and_r, $06, $0C
	db $9E, $18
	db $9E, $18
	db $80, $07
	db !set_volume_l_and_r, $08, $04
	db $97, $10
	db $9A, $08
	db $9B, $10
	db $9C, $19
	db !set_volume_l_and_r, $06, $0C
	db $97, $60
	db !end_sequence

.seq_197A:
	db !play_subsequence : dw .subseq_1379
	db !set_volume_l_and_r, $06, $0C
	db $80, $08
	db $97, $18
	db $97, $18
	db $80, $48
	db $94, $60
	db !end_sequence

.seq_198B:
	db $80, $09
	db !set_volume_l_and_r, $08, $08
	db !play_subsequence : dw .subseq_18E0
	db !end_sequence

.seq_1994:
	db $80, $0A
	db !set_volume_l_and_r, $05, $0F
	db !jump_to_sequence : dw .loop_point_1922
	db !end_sequence

.seq_199D:
	db !play_subsequence : dw .subseq_1379
	db !set_volume_l_and_r, $08, $10
	db $80, $08
	db $8B, $18
	db $8B, $18
	db $8B, $10
	db $8E, $08
	db $8F, $10
	db $90, $20
	db $84, $60
	db !end_sequence

.unreached_19B4:
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !set_echo, $32, $14, $14
	db !end_sequence

.unreached_19C2:
	db !end_sequence

.unreached_19C3:
	db !end_sequence

.unreached_19C4:
	db !end_sequence

.unreached_19C5:
	db !end_sequence

.subseq_19C6:
	db !set_echo, $32, $15, $15
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.subseq_19D4:
	db $80, $10
	db !return_from_sub

.seq_19D7:
	db !echo_delay, $04
	db !play_subsequence : dw .subseq_19D4
	db !play_subsequence : dw .subseq_19C6
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db !set_volume_l_and_r, $09, $09
	db $92, $04
	db $92, $04
	db !set_volume_l_and_r, $09, $09
	db !play_subsequence : dw .subseq_1B38
	db !set_volume_l_and_r, $0C, $0C
	db !play_subsequence : dw .subseq_1B38
	db !set_volume_l_and_r, $10, $10
	db !play_subsequence : dw .subseq_1B38
	db !set_volume_l_and_r, $15, $15
	db !play_subsequence : dw .subseq_1B38
.loop_point_1A09:
	db !set_volume_l_and_r, $17, $17
	db !loop_subsequence, $04 : dw .subseq_1B1F
	db !set_volume_l_and_r, $15, $15
	db !loop_subsequence, $04 : dw .subseq_1AE4
	db !play_subsequence : dw .subseq_1AB1
	db !set_instrument, $9D
	db !change_instr_pitch, $00
	db !set_volume_l_and_r, $DA, $28
	db !set_adsr, $81, $E2
	db !vibrato_with_delay, $0B, $0B, $0E, $05
	db !long_duration_on
	db $87, $01, $E0
	db $87, $01, $80
	db !long_duration_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $15, $15
	db !loop_subsequence, $04 : dw .subseq_1A47
	db !set_volume_l_and_r, $15, $15
	db !loop_subsequence, $04 : dw .subseq_1B38
	db !jump_to_sequence : dw .loop_point_1A09
	db !end_sequence

.subseq_1A47:
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $08
	db $92, $08
	db $92, $08
	db $92, $02
	db $92, $16
	db !echo_on
	db !set_instrument, $86
	db !set_adsr, $8F, $E1
	db !pitch_slide_off
	db $9C, $02
	db $9C, $0E
	db $98, $08
	db $9C, $02
	db $9C, $0E
	db !echo_off
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $04
	db $92, $04
	db !return_from_sub

.subseq_1A7E:
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $02
	db $92, $0E
	db $92, $02
	db $92, $06
	db !echo_on
	db !set_instrument, $86
	db !set_adsr, $8F, $E1
	db !pitch_slide_off
	db $98, $02
	db $98, $0E
	db !echo_off
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $02
	db $92, $06
	db $92, $02
	db $92, $25
	db !return_from_sub

.subseq_1AB1:
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $02
	db $92, $0E
	db $92, $02
	db $92, $06
	db !echo_on
	db !set_instrument, $86
	db !set_adsr, $8F, $E1
	db !pitch_slide_off
	db $98, $02
	db $98, $0E
	db !echo_off
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $02
	db $92, $06
	db $92, $02
	db $92, $2E
	db !return_from_sub

.subseq_1AE4:
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $02
	db $92, $0E
	db $92, $02
	db $92, $06
	db !echo_on
	db !set_instrument, $86
	db !set_adsr, $8F, $E1
	db !pitch_slide_off
	db $98, $02
	db $98, $06
	db !echo_off
	db !set_instrument, $36
	db !set_adsr, $DF, $92
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db $92, $08
	db $92, $08
	db $92, $02
	db $92, $16
	db $92, $02
	db $92, $06
	db $92, $08
	db $92, $08
	db !return_from_sub

.subseq_1B1F:
	db $92, $02
	db $92, $0E
	db $92, $10
	db $92, $08
	db $92, $08
	db $92, $02
	db $92, $0E
	db $92, $08
	db $92, $02
	db $92, $0E
	db $92, $04
	db $92, $04
	db !return_from_sub

.subseq_1B38:
	db $92, $02
	db $92, $16
	db $92, $02
	db $92, $16
	db $92, $02
	db $92, $06
	db $92, $08
	db $92, $08
	db $92, $02
	db $92, $0E
	db $92, $08
	db $92, $02
	db $92, $16
	db $92, $02
	db $92, $0E
	db $92, $08
	db $92, $02
	db $92, $06
	db $92, $08
	db $92, $08
	db $92, $02
	db $92, $0E
	db $92, $04
	db $92, $04
	db !return_from_sub

.seq_1B69:
	db !play_subsequence : dw .subseq_19D4
	db $80, $08
.loop_point_1B6E:
	db $80, $C0
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $28, $B4
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_instrument, $A1
	db $8D, $10
	db $8D, $08
	db $8D, $08
	db $8D, $20
	db !set_volume_l_and_r, $78, $3C
	db $8D, $30
	db $8D, $18
	db !set_volume_l_and_r, $28, $78
	db $8D, $08
	db $8D, $08
	db $8D, $08
	db $8D, $18
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $AF, $4B
	db $96, $04
	db $98, $04
	db !play_subsequence : dw .subseq_1C99
	db $A1, $14
	db $80, $04
	db !play_subsequence : dw .subseq_1C4E
	db $98, $0E
	db !pitch_slide_up, $01, $02, $0B, $16, $00
	db $9B, $1A
	db !pitch_slide_off
	db $96, $04
	db $98, $04
	db !play_subsequence : dw .subseq_1C99
	db $A1, $10
	db $9F, $04
	db $A1, $04
	db $A2, $18
	db $80, $18
	db $80, $30
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !set_volume_l_and_r, $0E, $0E
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_adsr, $8C, $B1
	db !play_subsequence : dw .subseq_1C0F
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $AF, $4B
	db !vibrato_off
	db $96, $04
	db $98, $04
	db !play_subsequence : dw .subseq_1C99
	db $A1, $14
	db $80, $04
	db !play_subsequence : dw .subseq_1C4E
	db $98, $0E
	db !pitch_slide_up, $01, $02, $0B, $16, $00
	db $9B, $1A
	db !pitch_slide_off
	db $80, $08
	db !jump_to_sequence : dw .loop_point_1B6E
	db !end_sequence

.subseq_1C0F:
	db $80, $18
	db $98, $08
	db $9A, $08
	db $9B, $08
	db $9A, $10
	db $96, $10
	db $93, $20
	db $98, $08
	db $98, $08
	db $9A, $08
	db $9B, $08
	db $9A, $10
	db $9B, $08
	db $9A, $18
	db $80, $18
	db $98, $08
	db $9A, $08
	db $9B, $08
	db $9A, $10
	db $96, $10
	db $93, $10
	db $96, $10
	db $96, $10
	db $96, $10
	db $96, $28
	db $94, $04
	db $93, $04
	db $96, $20
	db $98, $08
	db $9A, $08
	db $98, $28
	db !return_from_sub

.subseq_1C4E:
	db $9A, $0E
	db $80, $02
	db $A2, $0E
	db $80, $02
	db $A1, $08
	db $9F, $08
	db $A1, $10
	db $9D, $08
	db $A0, $02
	db $A1, $0E
	db $9D, $08
	db $96, $0C
	db $80, $04
	db $9F, $10
	db $9D, $08
	db $9B, $08
	db $9A, $0E
	db $80, $02
	db $9B, $08
	db $9A, $18
	db $9B, $0E
	db $80, $02
	db $9B, $10
	db $9A, $08
	db $98, $08
	db $9A, $0E
	db $80, $02
	db $96, $08
	db $9A, $0E
	db $80, $02
	db $96, $08
	db $9A, $0E
	db $80, $02
	db $9B, $08
	db $9A, $08
	db $98, $08
	db $96, $08
	db !return_from_sub

.subseq_1C99:
	db $9A, $0C
	db $80, $04
	db $96, $08
	db $9A, $10
	db $96, $08
	db $9B, $08
	db $9A, $08
	db $98, $08
	db $9A, $10
	db $96, $08
	db $9B, $08
	db $9A, $08
	db $98, $08
	db $9A, $10
	db $96, $08
	db $96, $08
	db $98, $08
	db $9A, $08
	db $98, $0C
	db $80, $04
	db $96, $04
	db $98, $04
	db $9A, $0C
	db $80, $04
	db $96, $08
	db $9A, $10
	db $96, $08
	db $9B, $08
	db $9A, $08
	db $98, $08
	db $9A, $10
	db $96, $08
	db $9F, $08
	db $9D, $08
	db $9B, $08
	db $9D, $10
	db $9A, $08
	db $9F, $08
	db $A1, $08
	db $A2, $08
	db !return_from_sub

.seq_1CEA:
	db !play_subsequence : dw .subseq_19D4
	db $80, $08
.loop_point_1CEF:
	db !set_instrument, $9C
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $C8, $0F
	db !set_adsr, $80, $E6
	db !vibrato_with_delay, $0F, $08, $0E, $02
	db !long_duration_on
	db $9C, $03, $00
	db !long_duration_off
	db !vibrato_off
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $18, $0E
	db !set_adsr, $FE, $51
	db !echo_on
	db !play_subsequence : dw .subseq_1DCD
	db !play_subsequence : dw .subseq_1379
	db !set_volume_l_and_r, $04, $08
	db !play_subsequence : dw .subseq_1DA9
	db $9D, $60
	db !play_subsequence : dw .subseq_1D44
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $15, $15
	db !loop_subsequence, $04 : dw .subseq_1A47
	db !pitch_slide_off
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $18, $0E
	db !set_adsr, $FE, $51
	db !echo_on
	db !play_subsequence : dw .subseq_1DCD
	db !jump_to_sequence : dw .loop_point_1CEF
	db !end_sequence

.subseq_1D44:
	db !set_adsr, $8B, $8D
	db $9F, $18
	db !set_adsr, $AA, $4B
	db $9F, $18
	db !set_adsr, $8B, $8D
	db $9A, $18
	db !set_adsr, $AA, $4B
	db $9A, $18
	db !set_adsr, $8B, $8D
	db $9F, $18
	db !set_adsr, $AA, $4B
	db $9F, $18
	db !set_adsr, $8B, $8D
	db $9A, $18
	db !set_adsr, $AA, $4B
	db $9A, $18
	db !set_adsr, $8B, $8D
	db $9F, $18
	db !set_adsr, $AA, $4B
	db $9F, $18
	db !set_adsr, $8B, $8D
	db $9A, $18
	db !set_adsr, $AA, $4B
	db $9A, $18
	db !set_adsr, $8B, $8D
	db $9B, $18
	db !set_adsr, $AA, $4B
	db $9B, $18
	db !set_adsr, $8B, $8D
	db $9B, $18
	db !set_adsr, $AA, $4B
	db $9B, $18
	db !set_adsr, $8B, $8D
	db $9B, $18
	db !set_adsr, $AA, $4B
	db $9B, $18
	db !set_adsr, $8B, $8D
	db $9D, $18
	db !set_adsr, $AA, $4B
	db $9D, $18
	db !return_from_sub

.subseq_1DA9:
	db !set_adsr, $8C, $8E
	db $9D, $18
	db $9D, $18
	db $9F, $18
	db $9D, $18
	db $9F, $18
	db $9D, $18
	db $9A, $18
	db $98, $18
	db $9D, $18
	db $9D, $18
	db $9F, $18
	db $9D, $18
	db $9F, $18
	db $9D, $18
	db $9F, $18
	db $A1, $18
	db !return_from_sub

.subseq_1DCD:
	db !play_subsequence : dw .subseq_1E7C
	db !play_subsequence : dw .subseq_1E58
	db !play_subsequence : dw .subseq_1E34
	db !play_subsequence : dw .subseq_1E10
	db !play_subsequence : dw .subseq_1DEC
	db !play_subsequence : dw .subseq_1E7C
	db !change_instr_pitch, $F4
	db !play_subsequence : dw .subseq_1E34
	db !change_instr_pitch, $F6
	db !play_subsequence : dw .subseq_1E34
	db !change_instr_pitch, $00
	db !return_from_sub

.subseq_1DEC:
	db !set_volume_l_and_r, $18, $0E
	db $98, $06
	db !set_volume_l_and_r, $07, $0C
	db $98, $06
	db !set_volume_l_and_r, $18, $0E
	db $A4, $06
	db !set_volume_l_and_r, $07, $0C
	db $A4, $06
	db !set_volume_l_and_r, $18, $0E
	db $B0, $06
	db !set_volume_l_and_r, $07, $0C
	db $B0, $03
	db !set_volume_l_and_r, $05, $02
	db $B0, $0F
	db !return_from_sub

.subseq_1E10:
	db !set_volume_l_and_r, $18, $0E
	db $96, $06
	db !set_volume_l_and_r, $07, $0C
	db $96, $06
	db !set_volume_l_and_r, $18, $0E
	db $A2, $06
	db !set_volume_l_and_r, $07, $0C
	db $A2, $06
	db !set_volume_l_and_r, $18, $0E
	db $AE, $06
	db !set_volume_l_and_r, $07, $0C
	db $AE, $03
	db !set_volume_l_and_r, $05, $02
	db $AE, $0F
	db !return_from_sub

.subseq_1E34:
	db !set_volume_l_and_r, $18, $0E
	db $9B, $06
	db !set_volume_l_and_r, $07, $0C
	db $9B, $06
	db !set_volume_l_and_r, $18, $0E
	db $A7, $06
	db !set_volume_l_and_r, $07, $0C
	db $A7, $06
	db !set_volume_l_and_r, $18, $0E
	db $B3, $06
	db !set_volume_l_and_r, $07, $0C
	db $B3, $03
	db !set_volume_l_and_r, $05, $02
	db $B3, $0F
	db !return_from_sub

.subseq_1E58:
	db !set_volume_l_and_r, $18, $0E
	db $9A, $06
	db !set_volume_l_and_r, $07, $0C
	db $9A, $06
	db !set_volume_l_and_r, $18, $0E
	db $A6, $06
	db !set_volume_l_and_r, $07, $0C
	db $A6, $06
	db !set_volume_l_and_r, $18, $0E
	db $B2, $06
	db !set_volume_l_and_r, $07, $0C
	db $B2, $03
	db !set_volume_l_and_r, $05, $02
	db $B2, $0F
	db !return_from_sub

.subseq_1E7C:
	db !set_volume_l_and_r, $18, $0E
	db $93, $06
	db !set_volume_l_and_r, $07, $0C
	db $93, $06
	db !set_volume_l_and_r, $18, $0E
	db $9F, $06
	db !set_volume_l_and_r, $07, $0C
	db $9F, $06
	db !set_volume_l_and_r, $18, $0E
	db $AB, $06
	db !set_volume_l_and_r, $07, $0C
	db $AB, $03
	db !set_volume_l_and_r, $05, $02
	db $AB, $0F
	db !return_from_sub

.seq_1EA0:
	db !play_subsequence : dw .subseq_19D4
	db $80, $08
.loop_point_1EA5:
	db !set_instrument, $9C
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $14, $C2
	db !set_adsr, $80, $E6
	db !vibrato_with_delay, $0B, $0B, $1C, $02
	db !long_duration_on
	db $9A, $03, $00
	db !long_duration_off
	db !vibrato_off
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $18, $0E
	db !set_adsr, $FE, $41
	db !echo_on
	db !play_subsequence : dw .subseq_1F8A
	db !play_subsequence : dw .subseq_1379
	db !set_volume_l_and_r, $04, $08
	db !set_adsr, $98, $92
	db !play_subsequence : dw .subseq_1F66
	db $9A, $60
	db !play_subsequence : dw .subseq_1F01
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $36
	db !set_adsr, $FF, $AF
	db !set_volume_l_and_r, $3C, $3C
	db !loop_subsequence, $04 : dw .subseq_22FB
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $18, $0E
	db !set_adsr, $FE, $41
	db !echo_on
	db !play_subsequence : dw .subseq_1F8A
	db !jump_to_sequence : dw .loop_point_1EA5
	db !end_sequence

.subseq_1F01:
	db !set_adsr, $8B, $8D
	db $9B, $18
	db !set_adsr, $AA, $4B
	db $9B, $18
	db !set_adsr, $8B, $8D
	db $96, $18
	db !set_adsr, $AA, $4B
	db $96, $18
	db !set_adsr, $8B, $8D
	db $9B, $18
	db !set_adsr, $AA, $4B
	db $9B, $18
	db !set_adsr, $8B, $8D
	db $96, $18
	db !set_adsr, $AA, $4B
	db $96, $18
	db !set_adsr, $8B, $8D
	db $9B, $18
	db !set_adsr, $AA, $4B
	db $9B, $18
	db !set_adsr, $8B, $8D
	db $96, $18
	db !set_adsr, $AA, $4B
	db $96, $18
	db !set_adsr, $8B, $8D
	db $98, $18
	db !set_adsr, $AA, $4B
	db $98, $18
	db !set_adsr, $8B, $8D
	db $98, $18
	db !set_adsr, $AA, $4B
	db $98, $18
	db !set_adsr, $8B, $8D
	db $96, $18
	db !set_adsr, $AA, $4B
	db $96, $18
	db !set_adsr, $8B, $8D
	db $98, $18
	db !set_adsr, $AA, $4B
	db $98, $18
	db !return_from_sub

.subseq_1F66:
	db !set_adsr, $8C, $8E
	db $9A, $18
	db $9A, $18
	db $9B, $18
	db $9A, $18
	db $9B, $18
	db $9A, $18
	db $96, $18
	db $95, $18
	db $9A, $18
	db $9A, $18
	db $9B, $18
	db $9A, $18
	db $9B, $18
	db $9A, $18
	db $9A, $18
	db $9D, $18
	db !return_from_sub

.subseq_1F8A:
	db !play_subsequence : dw .subseq_2005
	db !play_subsequence : dw .subseq_1FEE
	db !play_subsequence : dw .subseq_1FD7
	db !play_subsequence : dw .subseq_1FC0
	db !play_subsequence : dw .subseq_1FA9
	db !play_subsequence : dw .subseq_2005
	db !change_instr_pitch, $F4
	db !play_subsequence : dw .subseq_1FD7
	db !change_instr_pitch, $F6
	db !play_subsequence : dw .subseq_1FD7
	db !change_instr_pitch, $00
	db !return_from_sub

.subseq_1FA9:
	db $80, $04
	db !set_volume_l_and_r, $18, $0E
	db $9B, $06
	db !set_volume_l_and_r, $07, $0C
	db $9B, $06
	db !set_volume_l_and_r, $18, $0E
	db $A7, $06
	db !set_volume_l_and_r, $07, $0C
	db $A7, $1A
	db !return_from_sub

.subseq_1FC0:
	db $80, $04
	db !set_volume_l_and_r, $18, $0E
	db $9A, $06
	db !set_volume_l_and_r, $07, $0C
	db $9A, $06
	db !set_volume_l_and_r, $18, $0E
	db $A6, $06
	db !set_volume_l_and_r, $07, $0C
	db $A6, $1A
	db !return_from_sub

.subseq_1FD7:
	db $80, $04
	db !set_volume_l_and_r, $18, $0E
	db $9F, $06
	db !set_volume_l_and_r, $07, $0C
	db $9F, $06
	db !set_volume_l_and_r, $18, $0E
	db $AB, $06
	db !set_volume_l_and_r, $07, $0C
	db $AB, $1A
	db !return_from_sub

.subseq_1FEE:
	db $80, $04
	db !set_volume_l_and_r, $18, $0E
	db $9D, $06
	db !set_volume_l_and_r, $07, $0C
	db $9D, $06
	db !set_volume_l_and_r, $18, $0E
	db $A9, $06
	db !set_volume_l_and_r, $07, $0C
	db $A9, $1A
	db !return_from_sub

.subseq_2005:
	db $80, $04
	db !set_volume_l_and_r, $18, $0E
	db $96, $06
	db !set_volume_l_and_r, $07, $0C
	db $96, $06
	db !set_volume_l_and_r, $18, $0E
	db $A2, $06
	db !set_volume_l_and_r, $07, $0C
	db $A2, $1A
	db !return_from_sub

.seq_201C:
	db !play_subsequence : dw .subseq_19D4
	db $80, $08
.loop_point_2021:
	db !set_instrument, $9D
	db !change_instr_pitch, $00
	db !set_volume_l_and_r, $DA, $28
	db !set_adsr, $81, $E2
	db !vibrato_with_delay, $0B, $0B, $0E, $05
	db !long_duration_on
	db $87, $03, $00
	db !long_duration_off
	db !vibrato_off
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $18, $0E
	db !set_adsr, $FE, $51
	db !echo_on
	db !play_subsequence : dw .subseq_2108
	db !play_subsequence : dw .subseq_1379
	db !set_volume_l_and_r, $04, $08
	db !set_adsr, $98, $92
	db !play_subsequence : dw .subseq_20E4
	db $96, $20
	db !set_instrument, $9C
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $C8, $0F
	db !vibrato_with_delay, $0F, $08, $0E, $02
	db !long_duration_on
	db !set_adsr, $80, $E2
	db $9C, $03, $A0
	db !long_duration_off
	db !vibrato_off
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $18, $0E
	db !set_adsr, $FE, $51
	db !echo_on
	db !play_subsequence : dw .subseq_2108
	db !jump_to_sequence : dw .loop_point_2021
	db !end_sequence

.subseq_207F:
	db !set_adsr, $8B, $8D
	db $98, $18
	db !set_adsr, $AA, $4B
	db $98, $18
	db !set_adsr, $8B, $8D
	db $93, $18
	db !set_adsr, $AA, $4B
	db $93, $18
	db !set_adsr, $8B, $8D
	db $98, $18
	db !set_adsr, $AA, $4B
	db $98, $18
	db !set_adsr, $8B, $8D
	db $93, $18
	db !set_adsr, $AA, $4B
	db $93, $18
	db !set_adsr, $8B, $8D
	db $98, $18
	db !set_adsr, $AA, $4B
	db $98, $18
	db !set_adsr, $8B, $8D
	db $93, $18
	db !set_adsr, $AA, $4B
	db $93, $18
	db !set_adsr, $8B, $8D
	db $94, $18
	db !set_adsr, $AA, $4B
	db $94, $18
	db !set_adsr, $8B, $8D
	db $94, $18
	db !set_adsr, $AA, $4B
	db $94, $18
	db !set_adsr, $8B, $8D
	db $93, $18
	db !set_adsr, $AA, $4B
	db $93, $18
	db !set_adsr, $8B, $8D
	db $95, $18
	db !set_adsr, $AA, $4B
	db $95, $18
	db !return_from_sub

.subseq_20E4:
	db !set_adsr, $8C, $8E
	db $96, $18
	db $96, $18
	db $96, $18
	db $96, $18
	db $96, $18
	db $96, $18
	db $93, $18
	db $91, $18
	db $96, $18
	db $96, $18
	db $96, $18
	db $96, $18
	db $96, $18
	db $96, $18
	db $96, $18
	db $98, $18
	db !return_from_sub

.subseq_2108:
	db !play_subsequence : dw .subseq_2183
	db !play_subsequence : dw .subseq_216C
	db !play_subsequence : dw .subseq_2155
	db !play_subsequence : dw .subseq_213E
	db !play_subsequence : dw .subseq_2127
	db !play_subsequence : dw .subseq_2183
	db !change_instr_pitch, $F4
	db !play_subsequence : dw .subseq_2155
	db !change_instr_pitch, $F6
	db !play_subsequence : dw .subseq_2155
	db !change_instr_pitch, $00
	db !return_from_sub

.subseq_2127:
	db $80, $08
	db !set_volume_l_and_r, $18, $0E
	db $9F, $06
	db !set_volume_l_and_r, $07, $0C
	db $9F, $06
	db !set_volume_l_and_r, $18, $0E
	db $AB, $06
	db !set_volume_l_and_r, $07, $0C
	db $AB, $16
	db !return_from_sub

.subseq_213E:
	db $80, $08
	db !set_volume_l_and_r, $18, $0E
	db $9D, $06
	db !set_volume_l_and_r, $07, $0C
	db $9D, $06
	db !set_volume_l_and_r, $18, $0E
	db $A9, $06
	db !set_volume_l_and_r, $07, $0C
	db $A9, $16
	db !return_from_sub

.subseq_2155:
	db $80, $08
	db !set_volume_l_and_r, $18, $0E
	db $A2, $06
	db !set_volume_l_and_r, $07, $0C
	db $A2, $06
	db !set_volume_l_and_r, $18, $0E
	db $AE, $06
	db !set_volume_l_and_r, $07, $0C
	db $AE, $16
	db !return_from_sub

.subseq_216C:
	db $80, $08
	db !set_volume_l_and_r, $18, $0E
	db $A1, $06
	db !set_volume_l_and_r, $07, $0C
	db $A1, $06
	db !set_volume_l_and_r, $18, $0E
	db $AD, $06
	db !set_volume_l_and_r, $07, $0C
	db $AD, $16
	db !return_from_sub

.subseq_2183:
	db $80, $08
	db !set_volume_l_and_r, $18, $0E
	db $9A, $06
	db !set_volume_l_and_r, $07, $0C
	db $9A, $06
	db !set_volume_l_and_r, $18, $0E
	db $A6, $06
	db !set_volume_l_and_r, $07, $0C
	db $A6, $16
	db !return_from_sub

.seq_219A:
	db !play_subsequence : dw .subseq_19D4
	db $80, $09
	db !set_instrument, $36
	db !set_adsr, $DE, $8F
	db !pitch_slide_down, $00, $01, $16, $08, $01
	db !echo_on
	db !set_volume_l_and_r, $03, $03
	db $92, $04
	db $92, $04
	db !set_volume_l_and_r, $03, $03
	db !play_subsequence : dw .subseq_1B38
	db !set_volume_l_and_r, $04, $04
	db !play_subsequence : dw .subseq_1B38
	db !set_volume_l_and_r, $05, $05
	db !play_subsequence : dw .subseq_1B38
	db !set_volume_l_and_r, $07, $07
	db !play_subsequence : dw .subseq_1B38
.loop_point_21CA:
	db !set_volume_l_and_r, $08, $08
	db !loop_subsequence, $04 : dw .subseq_1B1F
	db !set_volume_l_and_r, $06, $06
	db !loop_subsequence, $04 : dw .subseq_1AE4
	db !play_subsequence : dw .subseq_1A7E
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_1379
	db !set_volume_l_and_r, $04, $08
	db !set_adsr, $98, $92
	db !play_subsequence : dw .subseq_207F
	db $80, $09
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $06, $06
	db !loop_subsequence, $08 : dw .subseq_1A47
	db !set_volume_l_and_r, $08, $08
	db !loop_subsequence, $04 : dw .subseq_1B38
	db !jump_to_sequence : dw .loop_point_21CA
	db !end_sequence

.seq_2200:
	db !play_subsequence : dw .subseq_19D4
	db $80, $08
	db $80, $0A
.loop_point_2207:
	db $80, $C0
	db $80, $B8
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !set_adsr, $AE, $45
	db !echo_on
	db !set_volume_l_and_r, $0A, $0A
	db $96, $04
	db $98, $04
	db !play_subsequence : dw .subseq_1C99
	db $A1, $14
	db $80, $04
	db !play_subsequence : dw .subseq_1C4E
	db $98, $0E
	db !pitch_slide_up, $01, $02, $0B, $16, $00
	db $9B, $1A
	db !pitch_slide_off
	db $96, $04
	db $98, $04
	db !play_subsequence : dw .subseq_1C99
	db $A1, $10
	db $9F, $04
	db $A1, $04
	db $A2, $18
	db $80, $18
	db $80, $30
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !set_volume_l_and_r, $05, $05
	db !set_adsr, $8B, $AF
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !play_subsequence : dw .subseq_1C0F
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !vibrato_off
	db !set_volume_l_and_r, $0A, $0A
	db !set_adsr, $AE, $45
	db $96, $04
	db $98, $04
	db !play_subsequence : dw .subseq_1C99
	db $A1, $14
	db $80, $04
	db !play_subsequence : dw .subseq_1C4E
	db $98, $0E
	db !pitch_slide_up, $01, $02, $0B, $16, $00
	db $9B, $1A
	db !pitch_slide_off
	db $80, $08
	db !jump_to_sequence : dw .loop_point_2207
	db !end_sequence

.seq_2284:
	db !play_subsequence : dw .subseq_19D4
	db $80, $08
.loop_point_2289:
	db $80, $C0
	db $80, $C0
	db $80, $C0
	db $80, $C0
	db !set_instrument, $9D
	db !change_instr_pitch, $00
	db !set_volume_l_and_r, $DA, $28
	db !set_adsr, $81, $E2
	db !vibrato_with_delay, $0B, $0B, $0E, $05
	db !long_duration_on
	db $87, $01, $80
	db !long_duration_off
	db !vibrato_off
	db !echo_on
	db !loop_subsequence, $04 : dw .subseq_2300
	db !set_instrument, $36
	db !set_volume_l_and_r, $3C, $3C
	db !set_adsr, $FF, $AC
	db $84, $10
	db $84, $18
	db $84, $08
	db $84, $10
	db !set_instrument, $9C
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $14, $C2
	db !vibrato_with_delay, $0B, $0B, $1C, $02
	db !long_duration_on
	db !set_adsr, $80, $E2
	db $9A, $03, $80
	db !long_duration_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $36
	db !set_adsr, $FF, $AF
	db !set_volume_l_and_r, $3C, $3C
	db !loop_subsequence, $04 : dw .subseq_22FB
	db !jump_to_sequence : dw .loop_point_2289

.unreached_22E4:
	db !set_instrument, $9C
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $14, $C2
	db !vibrato_with_delay, $0B, $0B, $1C, $02
	db !long_duration_on
	db !set_adsr, $80, $E2
	db $9A, $03, $00
	db !long_duration_off
	db !end_sequence

.subseq_22FB:
	db $84, $18
	db $84, $48
	db !return_from_sub

.subseq_2300:
	db !set_instrument, $36
	db !set_volume_l_and_r, $3C, $3C
	db !set_adsr, $FF, $AC
	db $84, $10
	db $84, $10
	db !set_instrument, $A5
	db !set_adsr, $9C, $E0
	db !set_volume_l_and_r, $14, $14
	db $9A, $08
	db $9A, $08
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $3C, $3C
	db $94, $02
	db $92, $0E
	db !set_volume_l_and_r, $14, $14
	db $94, $02
	db $92, $0E
	db !set_volume_l_and_r, $07, $07
	db $94, $02
	db $92, $0E
	db !return_from_sub

base off
arch 65816
.end: