;1B Primal Rave
;32AB97
jungle_song_data:
	dw !bgm_loc, $079C
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_19F5, .seq_1B38, .seq_1CA4, .seq_2131, .seq_2004, .seq_1D6C, .seq_1EC9, .seq_21A6
	db $BA, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_18EC, .seq_1921, .seq_1951, .seq_1998, .seq_198F, .seq_1967, .seq_197B, .seq_19A0
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_15FB, .seq_1683, .seq_175D, .seq_17B6, .seq_1653, .seq_18A7, .seq_187A, .seq_1706
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_1469, .seq_14D1, .seq_151E, .seq_159B, .seq_14A7, .seq_15D9, .seq_15EA, .seq_15BA
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_1364, .seq_13A7, .seq_13BB, .seq_13DB, .seq_13FA, .seq_1440, .seq_1419, .seq_1437
	db $C0, $FF	;music tempo, sound effect tempo

.seq_1364:
	db !play_subsequence : dw .subseq_19E7
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
	db !set_instrument, $CA
	db !change_instr_pitch, $12
	db !fine_tune, $FE
	db !set_adsr, $8F, $EB
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13BB:
	db !set_volume_l_and_r, $14, $28
.loop_point_13BE:
	db !play_subsequence : dw .subseq_18D3
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

.seq_13DB:
	db !set_instrument, $0D
	db !change_instr_pitch, $FD
	db !fine_tune, $E4
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_13FA:
	db !set_instrument, $0D
	db !change_instr_pitch, $FD
	db !fine_tune, $E4
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_1419:
	db !set_instrument, $0D
	db !change_instr_pitch, $FD
	db !fine_tune, $E4
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1437:
	db $80, $0A
	db !set_volume_l_and_r, $11, $08
	db !jump_to_sequence : dw .loop_point_13BE
	db !end_sequence

.seq_1440:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $31
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

.seq_1469:
	db !play_subsequence : dw .subseq_19E7
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $32
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_1496
.loop_point_1485:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_1485

.subseq_1496:
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

.seq_14A7:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $32
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !change_instr_pitch, $08
	db !set_instrument, $31
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $AF, $B9
	db $99, $18
	db $99, $18
	db $99, $18
	db $99, $18
	db !set_adsr, $8F, $F8
.loop_point_14CA:
	db $99, $08
	db $99, $08
	db !jump_to_sequence : dw .loop_point_14CA

.seq_14D1:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $32
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !set_adsr, $AF, $F3
	db !set_instrument, $96
	db !change_instr_pitch, $12
	db !fine_tune, $DF
	db !set_vol_single_val, $3C
	db !set_adsr, $DF, $72
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
.loop_point_14FA:
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
	db !jump_to_sequence : dw .loop_point_14FA
	db !end_sequence

.seq_151E:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $78
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1539
	db !end_sequence

.subseq_1539:
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

.seq_159B:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $14
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $80, $05
	db $9D, $20
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $1C, $12
	db $80, $0F
	db !play_subsequence : dw .subseq_1539
	db !end_sequence

.seq_15BA:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $14
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $80, $05
	db $98, $20
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $08, $0E
	db $80, $1E
	db !play_subsequence : dw .subseq_1539
	db !end_sequence

.seq_15D9:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $14
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15EA:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $3C
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15FB:
	db !play_subsequence : dw .subseq_19E7
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $32
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1618
	db !end_sequence

.subseq_1618:
	db !echo_off
	db !set_instrument, $CA
	db !set_vol_single_val, $50
	db $87, $10
	db $84, $10
	db !echo_on
	db !set_instrument, $86
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $CA
	db !set_vol_single_val, $50
	db $86, $09
	db !echo_on
	db !set_instrument, $86
	db !set_vol_single_val, $26
	db $9E, $10
	db $9F, $07
	db !set_instrument, $CA
	db !set_vol_single_val, $50
	db !echo_off
	db $88, $09
	db !echo_on
	db !set_instrument, $86
	db !set_vol_single_val, $26
	db $9E, $07
	db !set_vol_single_val, $6C
	db $9E, $10
	db !set_vol_single_val, $26
	db $9F, $09
	db !set_vol_single_val, $2C
	db $9F, $07
	db !return_from_sub

.seq_1653:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $32
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $31
	db !set_volume_l_and_r, $14, $1E
	db !change_instr_pitch, $08
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_1674
	db !default_duration_off
	db !end_sequence

.subseq_1674:
	db !set_adsr, $8F, $99
	db $99
	db $99
	db $99
	db $99
	db $99
	db $99
	db $99
	db !set_adsr, $8F, $65
	db $9A
	db !return_from_sub

.seq_1683:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $32
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_169A
	db !end_sequence

.subseq_169A:
	db !play_subsequence : dw .subseq_16A7
	db !play_subsequence : dw .subseq_16E4
	db !play_subsequence : dw .subseq_16A7
	db !play_subsequence : dw .subseq_16F5
	db !return_from_sub

.subseq_16A7:
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

.subseq_16E4:
	db !set_instrument, $08
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_16F5:
	db !set_instrument, $06
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_1706:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $78
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1722
	db !end_sequence

.subseq_1722:
	db !echo_off
	db !set_instrument, $CA
	db !set_vol_single_val, $1B
	db $87, $10
	db $84, $10
	db !echo_on
	db !set_instrument, $86
	db !set_vol_single_val, $24
	db $9E, $10
	db !echo_off
	db !set_instrument, $CA
	db !set_vol_single_val, $1B
	db $86, $09
	db !echo_on
	db !set_instrument, $86
	db !set_vol_single_val, $0C
	db $9F, $10
	db $9F, $07
	db !set_instrument, $CA
	db !set_vol_single_val, $1B
	db !echo_off
	db $88, $09
	db !echo_on
	db !set_instrument, $86
	db !set_vol_single_val, $0C
	db $9E, $07
	db !set_vol_single_val, $24
	db $9E, $10
	db !set_vol_single_val, $0C
	db $9F, $09
	db !set_vol_single_val, $11
	db $9F, $07
	db !return_from_sub

.seq_175D:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $14
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !set_instrument, $28
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_vol_single_val, $6E
	db !set_adsr, $DF, $B2
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1791
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_1791
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1791
	db !end_sequence

.subseq_1791:
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

.seq_17B6:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $14
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1831
	db !play_subsequence : dw .subseq_180F
	db !echo_on
	db !play_subsequence : dw .subseq_18D3
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_17E1
	db !end_sequence

.subseq_17E1:
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

.subseq_180F:
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
.subseq_1831:
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

.seq_187A:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $14
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $80, $05
	db $97, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $0F
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1831
	db !play_subsequence : dw .subseq_180F
	db !echo_on
	db !play_subsequence : dw .subseq_18D3
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_17E1
	db !end_sequence

.seq_18A7:
	db !play_subsequence : dw .subseq_18E2
	db !set_vol_single_val, $3C
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $80, $05
	db $93, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $0F
	db !set_volume_l_and_r, $04, $0B
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1831
	db !play_subsequence : dw .subseq_180F
	db !play_subsequence : dw .subseq_18D3
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_17E1
	db !end_sequence

.subseq_18D3:
	db !set_instrument, $29
	db !change_instr_pitch, $0B
	db !fine_tune, $F5
	db !set_adsr, $8F, $E0
	db !vibrato_with_delay, $02, $03, $05, $08
	db !return_from_sub

.subseq_18E2:
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_18EC:
	db !echo_delay, $06
	db !set_master_volume_indirect, $4B
	db !loop_subsequence, $01 : dw .subseq_19E7
	db !set_volume_l_and_r, $1E, $14
.loop_point_18F7:
	db !set_instrument, $29
	db !change_instr_pitch, $0B
	db !fine_tune, $F5
	db !vibrato_with_delay, $02, $03, $03, $08
	db !set_adsr, $8F, $E0
	db !echo_on
	db $9E, $08
	db $A0, $08
	db $A1, $10
	db $A0, $08
	db $9E, $10
	db $9C, $08
	db $97, $10
	db $99, $08
	db $9B, $10
	db $9C, $18
	db $97, $08
	db $99, $10
	db $9A, $40
	db !end_sequence

.seq_1921:
	db !set_vol_single_val, $46
.loop_point_1923:
	db !set_instrument, $CA
	db !change_instr_pitch, $06
	db !fine_tune, $FE
	db !set_adsr, $8F, $EB
	db $80, $10
	db $8B, $10
	db $8B, $20
	db $8B, $10
	db $8D, $08
	db $8F, $10
	db $90, $18
	db $90, $08
	db $90, $10
	db $90, $20
	db !end_sequence

.subseq_1941:
	db !set_instrument, $0D
	db !change_instr_pitch, $F1
	db !fine_tune, $E4
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db !echo_on
	db $80, $10
	db !return_from_sub

.seq_1951:
	db !play_subsequence : dw .subseq_1941
	db $80, $01
	db $A1, $10
	db $A1, $20
	db $A1, $10
	db $A1, $18
	db $A3, $18
	db $A3, $08
	db $A3, $10
	db $A3, $40
	db !end_sequence

.seq_1967:
	db !play_subsequence : dw .subseq_1941
	db $9E, $10
	db $9E, $20
	db $9E, $10
	db $9E, $18
	db $A0, $18
	db $A0, $08
	db $A0, $10
	db $A0, $40
	db !end_sequence

.seq_197B:
	db !play_subsequence : dw .subseq_1941
	db $9B, $10
	db $9B, $20
	db $9B, $10
	db $9B, $18
	db $9C, $18
	db $9A, $08
	db $9A, $10
	db $9A, $40
	db !end_sequence

.seq_198F:
	db $80, $0E
	db !set_volume_l_and_r, $04, $0B
	db !jump_to_sequence : dw .loop_point_18F7
	db !end_sequence

.seq_1998:
	db $80, $0A
	db !set_vol_single_val, $14
	db !jump_to_sequence : dw .loop_point_1923
	db !end_sequence

.seq_19A0:
	db !set_instrument, $31
	db !change_instr_pitch, $F4
	db !fine_tune, $EE
	db !set_volume_l_and_r, $0A, $28
	db !set_adsr, $DF, $AB
	db $80, $10
	db $A1, $08
	db $A1, $08
	db $A0, $08
	db $A1, $08
	db $A3, $08
	db $9E, $08
	db $A1, $08
	db $A1, $08
	db $A0, $08
	db $A1, $08
	db $A3, $08
	db $A3, $08
	db !echo_on
	db !play_subsequence : dw .subseq_19D7
	db !set_volume_l_and_r, $12, $0A
	db !play_subsequence : dw .subseq_19D7
	db !set_volume_l_and_r, $05, $0A
	db !play_subsequence : dw .subseq_19D7
	db !end_sequence

.subseq_19D7:
	db $A0, $08
	db $A0, $08
	db $9E, $08
	db $A0, $08
	db $9A, $08
	db $9C, $08
	db !return_from_sub

.subseq_19E4:
	db $80, $10
	db !return_from_sub

.subseq_19E7:
	db !set_echo, $2C, $19, $19
	db !set_fir, $50, $BF, $DB, $E0, $E0, $0A, $C8, $C8
	db !return_from_sub

.seq_19F5:
	db !echo_delay, $06
	db !loop_subsequence, $01 : dw .subseq_19E4
	db !loop_subsequence, $01 : dw .subseq_19E7
	db !set_master_volume_indirect, $4B
	db $80, $10
.loop_point_1A03:
	db !long_duration_on
	db $80, $05, $00
	db !long_duration_off
	db !set_instrument, $29
	db !change_instr_pitch, $0B
	db !fine_tune, $F5
	db !vibrato_with_delay, $02, $03, $05, $08
	db !echo_on
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8F, $E0
	db $80, $08
	db $99, $04
	db $9A, $04
	db $9B, $09
	db $99, $07
	db $9B, $10
	db $99, $09
	db $9B, $10
	db $99, $10
	db $94, $17
	db $80, $20
	db $9B, $09
	db $99, $07
	db $9B, $10
	db $9C, $09
	db $9E, $10
	db $9C, $10
	db $9B, $17
	db $99, $10
	db $80, $08
	db $99, $04
	db $9A, $04
	db $9B, $09
	db $99, $07
	db $9B, $10
	db $99, $09
	db $9B, $10
	db $99, $10
	db $94, $17
	db $80, $20
	db $9B, $09
	db $99, $07
	db $9B, $10
	db $9C, $09
	db $9E, $10
	db $9C, $10
	db $9E, $17
	db $9C, $20
	db $80, $80
	db $80, $70
	db $80, $08
	db $9E, $04
	db $9F, $04
	db $A0, $09
	db $9E, $07
	db $A0, $10
	db $9E, $09
	db $A0, $10
	db $9E, $10
	db $99, $17
	db $80, $20
	db $A0, $09
	db $9E, $07
	db $A0, $10
	db $A1, $09
	db $A3, $10
	db $A1, $10
	db $A0, $10
	db $9E, $17
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !loop_subsequence, $03 : dw .subseq_1ACB
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $0A, $0A
	db !set_adsr, $81, $E0
	db !vibrato_with_delay, $03, $02, $0E, $08
	db !long_duration_on
	db $A7, $02, $00
	db !set_adsr, $88, $E0
	db $A0, $01, $00
	db $A3, $01, $00
	db $A3, $01, $00
	db $A7, $02, $00
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_1A03
	db !end_sequence

.subseq_1ACB:
	db !echo_on
	db !set_adsr, $8F, $E0
	db !change_instr_pitch, $00
	db !set_instrument, $C8
	db !set_volume_l_and_r, $08, $14
	db $99, $04
	db $99, $04
	db $99, $04
	db $9A, $08
	db !set_volume_l_and_r, $14, $06
	db $A3, $04
	db $A3, $04
	db $A4, $04
	db $A5, $18
	db !set_volume_l_and_r, $0D, $0A
	db $8D, $04
	db $8A, $04
	db $8D, $04
	db $8E, $08
	db !set_adsr, $8B, $E0
	db !set_volume_l_and_r, $0A, $1C
	db !pitch_slide_up, $00, $01, $2C, $2C, $02
	db $8A, $09
	db $89, $0A
	db $88, $0B
	db !pitch_slide_off
	db $80, $26
	db !set_volume_l_and_r, $02, $05
	db $99, $04
	db $99, $04
	db $99, $04
	db $9A, $08
	db !set_volume_l_and_r, $04, $0A
	db $99, $04
	db $99, $04
	db $99, $04
	db $9A, $08
	db !set_volume_l_and_r, $06, $0F
	db $99, $04
	db $99, $04
	db $99, $04
	db $9A, $08
	db !set_volume_l_and_r, $08, $14
	db $99, $04
	db $99, $04
	db $99, $04
	db $9A, $08
	db $9B, $20
	db !return_from_sub

.seq_1B38:
	db !loop_subsequence, $01 : dw .subseq_19E4
.loop_point_1B3C:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $A6
	db !set_adsr, $EE, $AE
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !loop_subsequence, $08 : dw .subseq_1C88
	db !loop_subsequence, $0A : dw .subseq_1C88
	db !loop_subsequence, $04 : dw .subseq_1C88
	db !loop_subsequence, $01 : dw .subseq_1C6E
	db !echo_on
	db !loop_subsequence, $0F : dw .subseq_1BCD
	db !set_instrument, $CA
	db !change_instr_pitch, $06
	db !fine_tune, $FE
	db !set_volume_l_and_r, $05, $0F
	db !set_adsr, $DF, $B2
	db $8D, $10
	db !set_instrument, $0D
	db !change_instr_pitch, $F1
	db !fine_tune, $E4
	db !set_volume_l_and_r, $0A, $05
	db !set_adsr, $8F, $E0
	db $99, $10
	db !set_instrument, $31
	db !change_instr_pitch, $F4
	db !fine_tune, $EE
	db !set_volume_l_and_r, $05, $0A
	db !set_adsr, $DF, $AE
	db $99, $10
	db !set_instrument, $29
	db !change_instr_pitch, $FF
	db !fine_tune, $F5
	db !vibrato_with_delay, $02, $03, $05, $08
	db !set_volume_l_and_r, $14, $21
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $01 : dw .subseq_1C0B
	db !set_volume_l_and_r, $1E, $12
	db !play_subsequence : dw .subseq_1BC2
	db !set_volume_l_and_r, $0C, $14
	db !play_subsequence : dw .subseq_1BC2
	db !set_volume_l_and_r, $0F, $08
	db !play_subsequence : dw .subseq_1BC2
	db !set_volume_l_and_r, $06, $0A
	db !play_subsequence : dw .subseq_1BC2
	db !set_volume_l_and_r, $08, $04
	db !play_subsequence : dw .subseq_1BC2
	db $80, $B0
	db !echo_off
	db !jump_to_sequence : dw .loop_point_1B3C
	db !end_sequence

.subseq_1BC2:
	db $A7, $10
	db $80, $08
	db $A5, $10
	db $80, $08
	db $A0, $10
	db !return_from_sub

.subseq_1BCD:
	db !set_instrument, $CA
	db !change_instr_pitch, $06
	db !fine_tune, $FE
	db !set_volume_l_and_r, $05, $19
	db !set_adsr, $DF, $B2
	db $8D, $10
	db !set_instrument, $0D
	db !change_instr_pitch, $F1
	db !fine_tune, $E4
	db !set_volume_l_and_r, $0F, $05
	db !set_adsr, $8F, $E0
	db $99, $10
	db !set_instrument, $31
	db !change_instr_pitch, $F4
	db !fine_tune, $EE
	db !set_volume_l_and_r, $05, $0F
	db !set_adsr, $DF, $AE
	db $99, $10
	db !set_instrument, $0C
	db !change_instr_pitch, $F5
	db !fine_tune, $13
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $19, $0F
	db $81, $09
	db !set_volume_l_and_r, $05, $12
	db $8D, $07
	db !return_from_sub

.subseq_1C0B:
	db $A0, $08
	db $A1, $08
	db $A0, $20
	db $80, $30
	db $A0, $08
	db $A1, $08
	db $A0, $08
	db $9E, $08
	db $A0, $20
	db $80, $20
	db $9C, $08
	db $9B, $08
	db $99, $20
	db $80, $50
	db $A3, $10
	db $A3, $18
	db $A1, $18
	db $A0, $10
	db $9C, $20
	db $80, $50
	db $A0, $08
	db $A1, $08
	db $A3, $18
	db $A1, $18
	db $A0, $10
	db $9C, $20
	db $80, $10
	db $A0, $08
	db $A1, $08
	db $A3, $18
	db $A1, $18
	db $A0, $10
	db $9C, $20
	db $80, $10
	db $A0, $10
	db $A3, $10
	db $80, $08
	db $A3, $18
	db $A0, $10
	db $A3, $10
	db $80, $08
	db $A3, $10
	db $80, $08
	db $A3, $08
	db $A5, $08
	db $A3, $20
	db $80, $50
	db $A3, $0C
	db $80, $04
	db !return_from_sub

.subseq_1C6E:
	db !loop_subsequence, $04 : dw .subseq_1C99
	db !set_volume_l_and_r, $21, $30
	db $9A, $30
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !loop_subsequence, $04 : dw .subseq_1C99
	db !set_volume_l_and_r, $21, $30
	db !set_volume_l_and_r, $2C, $3C
	db $98, $40
	db !return_from_sub

.subseq_1C88:
	db !loop_subsequence, $07 : dw .subseq_1C99
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !return_from_sub

.subseq_1C91:
	db $80, $05
	db !set_volume_l_and_r, $1C, $32
	db $99, $0B
	db !return_from_sub

.subseq_1C99:
	db !set_volume_l_and_r, $21, $30
	db $9A, $09
	db !set_volume_l_and_r, $12, $26
	db $9A, $07
	db !return_from_sub

.seq_1CA4:
	db !loop_subsequence, $01 : dw .subseq_19E4
.loop_point_1CA8:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $A6
	db !set_adsr, $EF, $8B
	db !loop_subsequence, $01 : dw .subseq_1D64
	db !loop_subsequence, $08 : dw .subseq_1D45
	db !loop_subsequence, $0A : dw .subseq_1D45
	db !loop_subsequence, $04 : dw .subseq_1D45
	db !loop_subsequence, $01 : dw .subseq_1D1F
	db $80, $80
	db $80, $80
	db !echo_on
	db !set_instrument, $CA
	db !change_instr_pitch, $06
	db !fine_tune, $FE
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $DF, $B1
	db !loop_subsequence, $04 : dw .subseq_1D14
	db !loop_subsequence, $04 : dw .subseq_1D05
	db !change_instr_pitch_rel, $05
	db !loop_subsequence, $02 : dw .subseq_1D05
	db !change_instr_pitch_rel, $03
	db !loop_subsequence, $02 : dw .subseq_1D05
	db !change_instr_pitch_rel, $02
	db !loop_subsequence, $02 : dw .subseq_1D05
	db !change_instr_pitch_rel, $F6
	db !loop_subsequence, $03 : dw .subseq_1D05
	db $8D, $09
	db $8D, $10
	db $99, $17
	db $8B, $10
	db $8D, $30
	db !echo_off
	db !jump_to_sequence : dw .loop_point_1CA8
	db !end_sequence

.subseq_1D05:
	db $8D, $09
	db $8D, $10
	db $97, $17
	db $8B, $10
	db $8D, $19
	db $94, $17
	db $97, $10
	db !return_from_sub

.subseq_1D14:
	db $8D, $09
	db $8D, $10
	db $99, $17
	db $8B, $10
	db $8D, $40
	db !return_from_sub

.subseq_1D1F:
	db !set_volume_l_and_r, $50, $1E
	db $92, $09
	db $92, $10
	db $92, $07
	db $98, $10
	db $94, $10
	db $94, $30
	db !loop_subsequence, $01 : dw .subseq_1D64
	db !set_volume_l_and_r, $50, $1E
	db $92, $09
	db $92, $10
	db $92, $07
	db $98, $10
	db $94, $10
	db !set_volume_l_and_r, $5A, $32
	db $8F, $40
	db !return_from_sub

.subseq_1D45:
	db !loop_subsequence, $01 : dw .subseq_1D4E
	db !loop_subsequence, $01 : dw .subseq_1D64
	db !return_from_sub

.subseq_1D4E:
	db !set_volume_l_and_r, $50, $1E
	db $92, $09
	db $92, $10
	db $92, $07
	db $98, $10
	db $94, $09
	db $94, $10
	db $94, $10
	db $94, $07
	db $91, $10
	db !return_from_sub

.subseq_1D64:
	db !set_volume_l_and_r, $1C, $32
	db $99, $0A
	db $98, $06
	db !return_from_sub

.seq_1D6C:
	db !loop_subsequence, $01 : dw .subseq_19E4
.loop_point_1D70:
	db !set_instrument, $0D
	db !change_instr_pitch, $F1
	db !fine_tune, $E4
	db !set_volume_l_and_r, $0A, $E6
	db !set_adsr, $8F, $E0
	db !change_instr_pitch_rel, $0C
	db $99, $04
	db $99, $04
	db $99, $04
	db $99, $04
	db !echo_on
	db !loop_subsequence, $04 : dw .subseq_1E92
	db $9E, $20
	db $9E, $20
	db $9E, $20
	db $9E, $20
	db $9E, $20
	db $9E, $20
	db $9E, $20
	db $9E, $1C
	db !change_instr_pitch, $08
	db !set_instrument, $CB
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $3C, $50
	db $8E, $40
	db $8E, $40
	db $8E, $40
	db $8E, $40
	db $8E, $40
	db $8E, $40
	db $8E, $40
	db $8E, $40
	db $80, $60
	db $8E, $20
	db $80, $74
	db !set_instrument, $09
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_default_duration, $02
	db !set_adsr, $8E, $E0
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $16, $20
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $18, $22
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $1A, $24
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $1C, $26
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $1E, $28
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $20, $2A
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $21, $2C
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $24, $2E
	db !loop_subsequence, $01 : dw .subseq_1E86
	db !set_volume_l_and_r, $26, $30
	db !loop_subsequence, $0C : dw .subseq_1E86
	db !echo_off
	db !set_volume_l_and_r, $21, $2C
	db !loop_subsequence, $0C : dw .subseq_1E86
	db !set_volume_l_and_r, $1E, $28
	db !loop_subsequence, $06 : dw .subseq_1E86
	db !set_volume_l_and_r, $1C, $26
	db !loop_subsequence, $06 : dw .subseq_1E86
	db !default_duration_off
	db $80, $22
	db $80, $14
	db !echo_on
	db !set_instrument, $29
	db !change_instr_pitch, $FF
	db !fine_tune, $F5
	db !vibrato_with_delay, $02, $03, $05, $08
	db !set_volume_l_and_r, $0C, $06
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $01 : dw .subseq_1C0B
	db !set_volume_l_and_r, $08, $0C
	db $A7, $10
	db $80, $08
	db $A5, $10
	db $80, $08
	db $A0, $10
	db !set_volume_l_and_r, $08, $04
	db $A7, $10
	db $80, $08
	db $A5, $10
	db $80, $08
	db $A0, $10
	db !set_volume_l_and_r, $02, $05
	db $A7, $10
	db $80, $08
	db $A5, $10
	db $80, $08
	db $A0, $10
	db !set_volume_l_and_r, $03, $01
	db $A7, $10
	db $80, $08
	db $A5, $10
	db $80, $08
	db $A0, $10
	db !set_volume_l_and_r, $01, $02
	db $A7, $10
	db $80, $08
	db $A5, $10
	db $80, $08
	db $A0, $10
	db $80, $40
	db $80, $5C
	db !jump_to_sequence : dw .loop_point_1D70
	db !end_sequence

.subseq_1E86:
	db $99
	db $99
	db $99
	db $99
	db $96
	db $95
	db $96
	db $9A
	db $92
	db $99
	db $99
	db !return_from_sub

.subseq_1E92:
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $10
	db $9C, $09
	db $9E, $07
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $10
	db $97, $09
	db $98, $07
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $10
	db $9C, $09
	db $9E, $07
	db $99, $10
	db $A3, $09
	db $A5, $07
	db $A3, $10
	db $A0, $10
	db $90, $20
	db $99, $10
	db $97, $09
	db $98, $07
	db !return_from_sub

.seq_1EC9:
	db !loop_subsequence, $01 : dw .subseq_19E4
	db $80, $10
.loop_point_1ECF:
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_instrument, $86
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !echo_on
	db !set_volume_l_and_r, $1E, $F0
	db !set_adsr, $8F, $E0
	db $80, $09
	db $80, $10
	db $94, $07
	db $94, $10
	db $98, $09
	db $98, $10
	db $94, $07
	db $94, $10
	db $98, $05
	db $97, $05
	db $98, $06
	db $98, $02
	db $98, $0E
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !loop_subsequence, $02 : dw .subseq_1FCB
	db !loop_subsequence, $02 : dw .subseq_1FB4
	db !loop_subsequence, $02 : dw .subseq_1F55
	db $80, $60
	db !loop_subsequence, $01 : dw .subseq_1F55
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $0A, $0A
	db !set_adsr, $83, $E0
	db !vibrato_with_delay, $04, $03, $0B, $08
	db !long_duration_on
	db $A0, $02, $00
	db !set_adsr, $88, $E0
	db $99, $01, $00
	db $9C, $01, $00
	db $9E, $01, $00
	db $A0, $02, $00
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_1ECF
	db !end_sequence

.subseq_1F55:
	db !echo_on
	db !change_instr_pitch, $00
	db !set_instrument, $04
	db !set_adsr, $8E, $E0
	db !set_volume_l_and_r, $03, $0C
	db $94, $08
	db $95, $04
	db $94, $08
	db $95, $04
	db !set_volume_l_and_r, $0F, $04
	db $94, $08
	db $95, $04
	db $94, $08
	db $95, $04
	db !set_volume_l_and_r, $08, $14
	db $94, $08
	db $95, $04
	db $94, $08
	db $95, $04
	db !set_volume_l_and_r, $0F, $04
	db $94, $08
	db $95, $04
	db $94, $08
	db $95, $04
	db !set_volume_l_and_r, $03, $0C
	db $94, $08
	db $95, $04
	db $94, $08
	db $95, $04
	db !set_volume_l_and_r, $06, $02
	db $94, $08
	db $95, $04
	db $94, $08
	db $95, $04
	db !set_instrument, $CB
	db !set_adsr, $8B, $E0
	db !set_volume_l_and_r, $17, $08
	db !pitch_slide_down, $00, $01, $42, $4D, $02
	db $A8, $10
	db $A7, $10
	db $A6, $30
	db !return_from_sub

.subseq_1FB4:
	db $80, $09
	db $98, $02
	db $98, $05
	db $94, $09
	db $94, $07
	db $98, $05
	db $98, $05
	db $98, $06
	db $94, $10
	db $98, $02
	db $98, $3E
	db !return_from_sub

.subseq_1FCB:
	db $80, $10
	db $98, $02
	db $98, $07
	db $94, $10
	db $98, $07
	db $94, $10
	db $98, $02
	db $98, $07
	db $94, $10
	db $98, $07
	db $94, $09
	db $98, $02
	db $98, $05
	db $94, $10
	db $80, $10
	db $98, $02
	db $98, $07
	db $94, $10
	db $98, $07
	db $94, $10
	db $98, $02
	db $98, $07
	db $94, $10
	db $98, $07
	db $98, $05
	db $98, $05
	db $98, $06
	db $94, $10
	db !return_from_sub

.seq_2004:
	db !loop_subsequence, $01 : dw .subseq_19E4
	db $80, $10
.loop_point_200A:
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_instrument, $C7
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !echo_on
	db !set_volume_l_and_r, $EE, $28
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_2114
	db !set_instrument, $CA
	db !change_instr_pitch, $06
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $DF, $B1
	db !loop_subsequence, $06 : dw .subseq_2107
	db !change_instr_pitch_rel, $05
	db !loop_subsequence, $04 : dw .subseq_2107
	db !set_instrument, $C7
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !echo_on
	db !set_volume_l_and_r, $EE, $28
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_2114
	db !loop_subsequence, $01 : dw .subseq_20D4
	db !loop_subsequence, $03 : dw .subseq_207D
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $0A, $0A
	db !set_adsr, $85, $E0
	db !vibrato_with_delay, $04, $02, $11, $08
	db !long_duration_on
	db $9C, $02, $00
	db !set_adsr, $88, $E0
	db $95, $01, $00
	db $99, $01, $00
	db $9B, $01, $00
	db $9C, $02, $00
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_200A
	db !end_sequence

.subseq_207D:
	db !echo_on
	db !change_instr_pitch, $00
	db !set_instrument, $C9
	db !set_adsr, $8E, $E0
	db $80, $18
	db !set_volume_l_and_r, $1E, $03
	db $9E, $03
	db $9E, $03
	db $9E, $03
	db $9E, $03
	db $9E, $18
	db !set_volume_l_and_r, $08, $28
	db $99, $08
	db $99, $08
	db $98, $07
	db $96, $06
	db !set_volume_l_and_r, $17, $05
	db $99, $08
	db $99, $08
	db $98, $07
	db $96, $06
	db !set_volume_l_and_r, $03, $0B
	db $99, $08
	db $99, $08
	db $98, $07
	db $96, $06
	db $80, $18
	db !set_volume_l_and_r, $1E, $0C
	db $A2, $04
	db $A2, $04
	db $A2, $04
	db $A2, $04
	db $A2, $18
	db $80, $18
	db !set_volume_l_and_r, $0B, $17
	db $A2, $04
	db $A2, $04
	db $A2, $04
	db $A2, $04
	db $A2, $05
	db !return_from_sub

.subseq_20D4:
	db $9A, $09
	db $9A, $07
	db $95, $09
	db $9A, $07
	db $9A, $05
	db $9A, $05
	db $9A, $06
	db $9A, $09
	db $9A, $07
	db $9A, $02
	db $9A, $2E
	db $95, $05
	db $95, $05
	db $95, $06
	db $9A, $09
	db $9A, $07
	db $95, $09
	db $9A, $07
	db $9A, $05
	db $9A, $05
	db $9A, $06
	db $9A, $09
	db $9A, $07
	db $9A, $02
	db $9A, $3E
	db !return_from_sub

.subseq_2107:
	db $80, $10
	db $94, $10
	db $97, $20
	db $94, $19
	db $97, $17
	db $94, $10
	db !return_from_sub

.subseq_2114:
	db $9A, $09
	db $9A, $10
	db $9A, $07
	db $9A, $02
	db $9A, $0E
	db $95, $09
	db $95, $10
	db $9A, $07
	db $95, $10
	db $9A, $02
	db $9A, $0E
	db $9A, $05
	db $9A, $05
	db $9A, $06
	db !return_from_sub

.seq_2131:
	db !loop_subsequence, $01 : dw .subseq_19E4
	db $80, $10
	db !echo_on
.loop_point_2138:
	db !set_instrument, $28
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $DF, $B2
	db !loop_subsequence, $02 : dw .subseq_2187
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !loop_subsequence, $03 : dw .subseq_2187
	db !change_instr_pitch_rel, $05
	db !loop_subsequence, $02 : dw .subseq_2187
	db !set_instrument, $C0
	db !change_instr_pitch, $E4
	db !fine_tune, $18
	db !set_volume_l_and_r, $50, $50
	db !set_adsr, $88, $E0
	db !long_duration_on
	db $81, $02, $00
	db $80, $00, $C0
	db $81, $05, $40
	db !set_volume_l_and_r, $46, $46
	db $86, $01, $00
	db $89, $01, $00
	db !set_volume_l_and_r, $50, $50
	db $83, $01, $00
	db $81, $02, $00
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_2138
	db !end_sequence

.subseq_2187:
	db $99, $09
	db $99, $10
	db $99, $17
	db $97, $10
	db $99, $09
	db $99, $10
	db $99, $17
	db $9C, $10
	db $99, $09
	db $99, $10
	db $99, $17
	db $97, $10
	db $99, $10
	db $97, $10
	db $99, $20
	db !return_from_sub

.seq_21A6:
	db !loop_subsequence, $01 : dw .subseq_19E4
	db $80, $10
.loop_point_21AC:
	db !change_instr_pitch, $08
	db !set_instrument, $CB
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $64, $3C
	db !echo_on
	db $80, $EA
	db $8E, $16
	db $80, $EA
	db $8E, $11
	db !set_volume_l_and_r, $50, $32
	db $8A, $20
	db !set_volume_l_and_r, $0F, $1E
	db $8A, $20
	db !set_volume_l_and_r, $14, $0A
	db $8A, $20
	db !set_volume_l_and_r, $05, $0A
	db $8A, $A0
	db !set_volume_l_and_r, $32, $50
	db $8A, $20
	db !set_volume_l_and_r, $1E, $0F
	db $8A, $20
	db !set_volume_l_and_r, $0A, $14
	db $8A, $20
	db !set_volume_l_and_r, $0A, $05
	db $8A, $A5
	db !set_instrument, $09
	db !set_adsr, $8E, $E0
	db !echo_on
	db !loop_subsequence, $05 : dw .subseq_2201
	db !loop_subsequence, $02 : dw .subseq_2201
	db !loop_subsequence, $06 : dw .subseq_2201
	db !loop_subsequence, $05 : dw .subseq_2201
	db !jump_to_sequence : dw .loop_point_21AC
	db !end_sequence

.subseq_2201:
	db !set_volume_l_and_r, $D7, $1E
	db $9A, $0E
	db $9A, $0E
	db $9A, $0E
	db $9A, $0E
	db !set_volume_l_and_r, $14, $32
	db $9A, $0E
	db $9A, $0E
	db $9A, $0E
	db $9A, $0E
	db !set_volume_l_and_r, $1E, $D7
	db $9A, $0E
	db $9A, $0E
	db $9A, $0E
	db $9A, $0E
	db !set_volume_l_and_r, $32, $14
	db $9A, $0E
	db $9A, $0E
	db $9A, $0E
	db $9A, $0E
	db !set_volume_l_and_r, $0A, $3C
	db $9A, $0E
	db $9A, $0E
	db $9A, $04
	db !return_from_sub

base off
arch 65816
.end: