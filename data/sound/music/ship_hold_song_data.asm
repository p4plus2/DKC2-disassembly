;10 Lockjaw's Saga
;32357A
ship_hold_song_data:
	dw !bgm_loc, $07AB
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1AE0, .seq_1BA1, .seq_1CA2, .seq_1FEC, .seq_1D8C, .seq_20C8, .seq_1F82, .seq_2180
	db $A8, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131E	;01: 
	dw .chn_ptrs_1330	;02: 
	dw .chn_ptrs_1342	;03: 
	dw .chn_ptrs_1354	;04: 
	dw .chn_ptrs_1366	;05: 

;sub-track 01 channel pointers
.chn_ptrs_131E:
	dw .seq_1910, .seq_1A16, .seq_1996, .seq_1A72, .seq_1A80, .seq_197C, .seq_1A5F, .seq_195A
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_1330:
	dw .seq_161B, .seq_16A3, .seq_177F, .seq_17D9, .seq_1674, .seq_18CA, .seq_189D, .seq_1727
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1342:
	dw .seq_1484, .seq_14EE, .seq_1539, .seq_15B7, .seq_14C3, .seq_15F7, .seq_1609, .seq_15D7
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1354:
	dw .seq_1378, .seq_13BB, .seq_13D1, .seq_13F4, .seq_140A, .seq_145B, .seq_1420, .seq_1436
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 05 channel pointers
.chn_ptrs_1366:
	dw .seq_1AE0, .seq_1BA1, .seq_1CA2, .seq_1D8C, .seq_1F82, .seq_1FEC, .seq_20C8, .seq_2180
	db $A8, $FF	;music tempo, sound effect tempo

.seq_1378:
	db !play_subsequence : dw .subseq_1AD2
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

.seq_13BB:
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_vol_single_val, $6E
	db !set_adsr, $AF, $AE
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13D1:
	db !play_subsequence : dw .subseq_1AC2
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $8F, $CB
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A2, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db !set_adsr, $BF, $4B
	db $AC, $19
	db $80, $07
	db $AC, $10
	db !end_sequence

.seq_13F4:
	db !play_subsequence : dw .subseq_1A9A
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
	db !play_subsequence : dw .subseq_1A9A
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
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $23, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1436:
	db !play_subsequence : dw .subseq_1AC2
	db !set_volume_l_and_r, $11, $08
	db !set_adsr, $8E, $C8
	db $80, $0E
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A2, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db !set_adsr, $BF, $4B
	db $AC, $19
	db $80, $07
	db $AC, $10
	db !end_sequence

.seq_145B:
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

.seq_1484:
	db !play_subsequence : dw .subseq_1AD2
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_14B2
.loop_point_14A1:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_14A1

.subseq_14B2:
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

.seq_14C3:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $AF, $B2
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db !set_adsr, $8F, $F8
.loop_point_14E7:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .loop_point_14E7

.seq_14EE:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_vol_single_val, $50
	db !set_adsr, $8F, $E0
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
.loop_point_1515:
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
	db !jump_to_sequence : dw .loop_point_1515
	db !end_sequence

.seq_1539:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1555
	db !end_sequence

.subseq_1555:
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

.seq_15B7:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $80, $05
	db $9D, $20
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $1C, $12
	db $80, $0F
	db !play_subsequence : dw .subseq_1555
	db !end_sequence

.seq_15D7:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $80, $05
	db $98, $20
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $08, $0E
	db $80, $1E
	db !play_subsequence : dw .subseq_1555
	db !end_sequence

.seq_15F7:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1609:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $28, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_161B:
	db !play_subsequence : dw .subseq_1AD2
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1639
	db !end_sequence

.subseq_1639:
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

.seq_1674:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $28, $32
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_1694
	db !default_duration_off
	db !end_sequence

.subseq_1694:
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

.seq_16A3:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_16BB
	db !end_sequence

.subseq_16BB:
	db !play_subsequence : dw .subseq_16C8
	db !play_subsequence : dw .subseq_1705
	db !play_subsequence : dw .subseq_16C8
	db !play_subsequence : dw .subseq_1716
	db !return_from_sub

.subseq_16C8:
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

.subseq_1705:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_1716:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_1727:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1744
	db !end_sequence

.subseq_1744:
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

.seq_177F:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_vol_single_val, $50
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17B4
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_17B4
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17B4
	db !end_sequence

.subseq_17B4:
	db $E0, $0C
	db $80, $04
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $24
	db $E0, $08
	db $E1, $08
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $04
	db $89, $10
	db $8A, $10
	db !return_from_sub

.seq_17D9:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1854
	db !play_subsequence : dw .subseq_1832
	db !play_subsequence : dw .subseq_1AB8
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_1804
	db !end_sequence

.subseq_1804:
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

.subseq_1832:
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
.subseq_1854:
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

.seq_189D:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $80, $05
	db $97, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $07
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1854
	db !play_subsequence : dw .subseq_1832
	db !play_subsequence : dw .subseq_1AB8
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_1804
	db !end_sequence

.seq_18CA:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $28, $28
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $80, $05
	db $93, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $0F
	db !set_volume_l_and_r, $04, $0B
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1854
	db !play_subsequence : dw .subseq_1832
	db !play_subsequence : dw .subseq_1AB8
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_1804
	db !end_sequence

.subseq_18F7:
	db !load_volume_preset_1
	db $A1
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $A1
	db !load_volume_preset_2
	db $A1
	db !load_volume_preset_1
	db $9E
	db !load_volume_preset_2
	db $A1
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $9E
	db !load_volume_preset_1
	db $9E
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $9E
	db !load_volume_preset_2
	db $9E
	db !return_from_sub

.seq_1910:
	db !play_subsequence : dw .subseq_1AD2
	db !play_subsequence : dw .subseq_1AAE
	db !set_volume_presets, $08, $14, $09, $03
	db $80, $08
	db !set_default_duration, $04
	db !loop_subsequence, $02 : dw .subseq_18F7
	db !load_volume_preset_1
	db $9C
	db !load_volume_preset_2
	db $9E
	db !load_volume_preset_1
	db $9C
	db !load_volume_preset_2
	db $9C
	db !load_volume_preset_1
	db $9A
	db !load_volume_preset_2
	db $9C
	db !load_volume_preset_1
	db $97
	db !load_volume_preset_2
	db $9A
	db !load_volume_preset_1
	db $9A
	db !load_volume_preset_2
	db $97
	db !load_volume_preset_1
	db $97
	db !load_volume_preset_2
	db $9A
	db !loop_subsequence, $03 : dw .subseq_1941
	db !default_duration_off
	db !end_sequence

.subseq_1941:
	db !load_volume_preset_1
	db $9C
	db !load_volume_preset_2
	db $97
	db !load_volume_preset_1
	db $9C
	db !load_volume_preset_2
	db $9C
	db !load_volume_preset_1
	db $9A
	db !load_volume_preset_2
	db $9C
	db !load_volume_preset_1
	db $97
	db !load_volume_preset_2
	db $9A
	db !load_volume_preset_1
	db $9A
	db !load_volume_preset_2
	db $97
	db !load_volume_preset_1
	db $97
	db !load_volume_preset_2
	db $9A
	db !return_from_sub

.seq_195A:
	db !play_subsequence : dw .subseq_1AC2
	db !set_volume_l_and_r, $32, $3C
	db !set_adsr, $AF, $4B
.loop_point_1963:
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
	db $9A, $90
	db !end_sequence

.seq_197C:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $8F, $E8
	db $80, $08
	db $A1, $18
	db $A1, $18
	db $97, $10
	db $9A, $08
	db $9B, $10
	db $9C, $20
	db $9A, $60
	db !end_sequence

.seq_1996:
	db !play_subsequence : dw .subseq_1AA4
	db !set_default_duration, $08
	db $80
	db !set_volume_l_and_r, $11, $08
	db $9E
	db $A0
	db $9E
	db !set_volume_l_and_r, $04, $0B
	db $9E
	db !set_volume_l_and_r, $06, $0E
	db $A0
	db $9E
	db !set_volume_l_and_r, $11, $08
	db $9E
	db $9E
	db $9E
	db !set_volume_l_and_r, $04, $0B
	db $9E
	db !set_volume_l_and_r, $06, $0E
	db $9E
	db !set_volume_l_and_r, $11, $08
	db $9C
	db $9C
	db $9C
	db $9A
	db !set_volume_l_and_r, $04, $0B
	db $9A
	db !set_volume_l_and_r, $06, $0E
	db $9A
	db $9A
	db !set_volume_l_and_r, $11, $08
	db $9C
	db $9C
	db $9A
	db !set_volume_l_and_r, $04, $0B
	db $9A
	db !set_volume_l_and_r, $06, $0E
	db $9C
	db $9A
	db !set_volume_l_and_r, $09, $04
	db $9C
	db $9C
	db $9A
	db !set_volume_l_and_r, $02, $06
	db $9A
	db !set_volume_l_and_r, $03, $07
	db $9C
	db $9A
	db !set_volume_l_and_r, $05, $02
	db $9C
	db $9C
	db $9A
	db !set_volume_l_and_r, $01, $03
	db $9A
	db !set_volume_l_and_r, $02, $04
	db $9C
	db $9A
	db !default_duration_off
	db !end_sequence

.subseq_19F8:
	db !set_volume_l_and_r, $11, $08
	db $9B
	db $9B
	db $9B
	db !set_volume_l_and_r, $04, $0B
	db $9B
	db !set_volume_l_and_r, $06, $0E
	db $9B
	db $9B
	db !set_volume_l_and_r, $11, $08
	db $9B
	db $9B
	db $9B
	db !set_volume_l_and_r, $04, $0B
	db $9B
	db !set_volume_l_and_r, $06, $0E
	db $9B
	db !return_from_sub

.seq_1A16:
	db !play_subsequence : dw .subseq_1AA4
	db !set_default_duration, $08
	db $80
	db !loop_subsequence, $01 : dw .subseq_19F8
.loop_point_1A20:
	db !set_volume_l_and_r, $11, $08
	db $97
	db $97
	db $97
	db $97
	db !set_volume_l_and_r, $04, $0B
	db $97
	db !set_volume_l_and_r, $06, $0E
	db $97
	db $97
	db !set_volume_l_and_r, $11, $08
	db $97
	db $97
	db $97
	db !set_volume_l_and_r, $04, $0B
	db $97
	db !set_volume_l_and_r, $06, $0E
	db $97
	db $97
	db !set_volume_l_and_r, $09, $04
	db $97
	db $97
	db $97
	db !set_volume_l_and_r, $02, $06
	db $97
	db !set_volume_l_and_r, $03, $07
	db $97
	db $97
	db !set_volume_l_and_r, $05, $02
	db $97
	db $97
	db $97
	db !set_volume_l_and_r, $01, $03
	db $97
	db !set_volume_l_and_r, $02, $04
	db $97
	db $97
	db !default_duration_off
	db !end_sequence

.seq_1A5F:
	db !play_subsequence : dw .subseq_1AA4
	db !set_default_duration, $08
	db $80
	db !change_instr_pitch_rel, $FC
	db !loop_subsequence, $01 : dw .subseq_19F8
	db !change_instr_pitch_rel, $01
	db !jump_to_sequence : dw .loop_point_1A20

.unreached_1A70:
	db !default_duration_off
	db !end_sequence

.seq_1A72:
	db $80, $0A
	db !play_subsequence : dw .subseq_1AC2
	db !set_adsr, $AE, $45
	db !set_volume_l_and_r, $0A, $0A
	db !jump_to_sequence : dw .loop_point_1963

.seq_1A80:
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $78, $78
	db !set_adsr, $CE, $88
	db $80, $08
	db $8B, $18
	db $8B, $18
	db $8B, $10
	db $8E, $08
	db $8F, $10
	db $90, $20
	db $84, $90
	db !end_sequence

.subseq_1A9A:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.subseq_1AA4:
	db !set_instrument, $1D
	db !set_adsr, $8F, $52
	db !change_instr_pitch, $FF
	db !fine_tune, $FC
	db !return_from_sub

.subseq_1AAE:
	db !set_instrument, $24
	db !set_adsr, $EF, $32
	db !change_instr_pitch, $0C
	db !fine_tune, $AC
	db !return_from_sub

.subseq_1AB8:
	db !set_instrument, $1E
	db !set_adsr, $8E, $F6
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !return_from_sub

.subseq_1AC2:
	db !set_instrument, $1C
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8D, $EB
	db !change_instr_pitch, $02
	db !fine_tune, $30
	db !return_from_sub

.subseq_1ACF:
	db $80, $10
	db !return_from_sub

.subseq_1AD2:
	db !set_echo, $34, $1A, $1A
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.seq_1AE0:
	db !echo_delay, $04
	db !set_volume_presets, $08, $14, $09, $03
	db !play_subsequence : dw .subseq_1AD2
	db !play_subsequence : dw .subseq_1ACF
	db !echo_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
.loop_point_1AF2:
	db !set_instrument, $A6
	db !set_adsr, $9F, $AB
	db !loop_subsequence, $03 : dw .subseq_1B87
	db !play_subsequence : dw .subseq_1B60
	db !loop_subsequence, $06 : dw .subseq_1B06
	db !jump_to_sequence : dw .loop_point_1AF2
	db !end_sequence

.subseq_1B06:
	db !set_instrument, $A6
	db !set_adsr, $9F, $AB
	db !set_volume_l_and_r, $1E, $3C
	db $95, $08
	db !set_volume_l_and_r, $3C, $28
	db $92, $10
	db $92, $28
	db !set_instrument, $A5
	db !set_adsr, $9F, $F5
	db !play_subsequence : dw .subseq_1B55
	db !set_volume_l_and_r, $14, $26
	db $99, $08
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $1C, $2C
	db $99, $20
	db !play_subsequence : dw .subseq_1B55
	db !set_volume_l_and_r, $14, $26
	db $99, $08
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $1C, $2C
	db $99, $20
	db !play_subsequence : dw .subseq_1B55
	db !set_volume_l_and_r, $14, $26
	db $99, $08
	db $99, $10
	db !play_subsequence : dw .subseq_1B55
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $1C, $2C
	db $99, $08
	db !return_from_sub

.subseq_1B55:
	db !set_volume_l_and_r, $09, $11
	db $99, $04
	db !set_volume_l_and_r, $0D, $19
	db $99, $04
	db !return_from_sub

.subseq_1B60:
	db !set_volume_l_and_r, $1E, $3C
	db $95, $08
	db !set_volume_l_and_r, $3C, $28
	db $92, $10
	db $92, $38
	db !set_volume_l_and_r, $1E, $3C
	db $98, $10
	db $97, $30
	db !set_volume_l_and_r, $3C, $1E
	db $96, $10
	db $95, $30
	db !set_volume_l_and_r, $1E, $3C
	db $98, $10
	db !set_volume_l_and_r, $3C, $28
	db $96, $10
	db $92, $10
	db !return_from_sub

.subseq_1B87:
	db !set_volume_l_and_r, $1E, $3C
	db $95, $08
	db !set_volume_l_and_r, $3C, $28
	db $92, $10
	db $92, $30
	db $80, $B8
	db !return_from_sub

.subseq_1B96:
	db !echo_off
	db !set_instrument, $A6
	db !set_adsr, $9F, $AB
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !return_from_sub

.seq_1BA1:
	db !play_subsequence : dw .subseq_1ACF
	db !set_instrument, $A6
	db !set_volume_l_and_r, $3C, $3C
	db !set_adsr, $9F, $AB
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $A6
	db !set_volume_l_and_r, $3C, $3C
	db !set_adsr, $9F, $AB
	db !change_instr_pitch, $00
	db !fine_tune, $00
.loop_point_1BBC:
	db !loop_subsequence, $03 : dw .subseq_1C8E
	db !play_subsequence : dw .subseq_1C64
	db !loop_subsequence, $02 : dw .subseq_1C8E
	db !play_subsequence : dw .subseq_1BD1
	db !play_subsequence : dw .subseq_1C8E
	db !jump_to_sequence : dw .loop_point_1BBC
	db !end_sequence

.subseq_1BD1:
	db !play_subsequence : dw .subseq_1B96
	db !set_volume_l_and_r, $1E, $3C
	db $80, $04
	db $95, $0C
	db !set_volume_l_and_r, $3C, $28
	db $92, $10
	db $92, $10
	db !play_subsequence : dw .subseq_1AC2
	db !vibrato_with_delay, $02, $03, $12, $04
	db !set_volume_l_and_r, $12, $24
	db $99, $08
	db $9C, $08
	db $A0, $08
	db $A1, $2C
	db $80, $04
	db $A0, $08
	db $9E, $08
	db $A0, $10
	db $9C, $08
	db $99, $28
	db $80, $38
	db !play_subsequence : dw .subseq_1B96
	db !set_volume_l_and_r, $1E, $3C
	db $80, $04
	db $95, $0C
	db !set_volume_l_and_r, $3C, $28
	db $92, $10
	db $92, $10
	db !play_subsequence : dw .subseq_1AC2
	db !vibrato_with_delay, $02, $03, $12, $04
	db !set_volume_l_and_r, $12, $24
	db $99, $08
	db $9C, $08
	db $A0, $08
	db $A1, $2C
	db $80, $04
	db $A0, $08
	db $9E, $08
	db $A0, $40
	db $80, $38
	db !play_subsequence : dw .subseq_1B96
	db !set_volume_l_and_r, $1E, $3C
	db $80, $04
	db $95, $0C
	db !set_volume_l_and_r, $3C, $28
	db $92, $10
	db $92, $10
	db !play_subsequence : dw .subseq_1AC2
	db !vibrato_with_delay, $02, $03, $12, $04
	db !set_volume_l_and_r, $12, $24
	db $99, $08
	db $9C, $08
	db $A0, $08
	db $A1, $2C
	db $80, $04
	db $A0, $08
	db $9E, $08
	db $A0, $10
	db $A5, $08
	db $99, $28
	db $80, $38
	db !return_from_sub

.subseq_1C64:
	db !set_volume_l_and_r, $1E, $3C
	db $80, $04
	db $95, $0C
	db !set_volume_l_and_r, $3C, $28
	db $92, $10
	db $92, $33
	db !set_volume_l_and_r, $1E, $3C
	db $98, $15
	db $95, $2B
	db !set_volume_l_and_r, $3C, $1E
	db $95, $15
	db !set_volume_l_and_r, $3C, $28
	db $92, $2B
	db !set_volume_l_and_r, $1E, $3C
	db $98, $15
	db !set_volume_l_and_r, $3C, $28
	db $92, $18
	db !return_from_sub

.subseq_1C8E:
	db !play_subsequence : dw .subseq_1B96
	db !set_volume_l_and_r, $1E, $3C
	db $80, $04
	db $95, $0C
	db !set_volume_l_and_r, $3C, $28
	db $92, $10
	db $92, $30
	db $80, $B0
	db !return_from_sub

.seq_1CA2:
	db !play_subsequence : dw .subseq_1ACF
	db $80, $08
.loop_point_1CA7:
	db !set_instrument, $A6
	db !set_volume_l_and_r, $3C, $64
	db !set_adsr, $9F, $AB
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !loop_subsequence, $04 : dw .subseq_1D87
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1AB8
	db !set_volume_l_and_r, $03, $0C
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !play_subsequence : dw .subseq_1CF6
	db $A0, $10
	db !play_subsequence : dw .subseq_1D35
	db !vibrato_off
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $88, $E8
	db !echo_on
	db $99, $08
	db $9B, $08
	db $9C, $30
	db $9E, $10
	db $9B, $30
	db $97, $10
	db $A0, $30
	db $9E, $08
	db $9C, $08
	db $9B, $20
	db $97, $20
	db !jump_to_sequence : dw .loop_point_1CA7
	db !end_sequence

.subseq_1CF6:
	db $80, $08
	db $A0, $0C
	db $80, $04
	db $9C, $08
	db $A0, $08
	db $9C, $08
	db $A0, $08
	db $9C, $08
	db $80, $06
	db $A0, $02
	db $A1, $0C
	db $80, $04
	db $9C, $08
	db $A1, $08
	db $9C, $08
	db $A1, $08
	db $9C, $08
	db $80, $08
	db $A0, $0C
	db $80, $04
	db $9B, $08
	db $A0, $08
	db $9B, $08
	db $A0, $08
	db $9B, $08
	db $80, $08
	db $9B, $08
	db $A1, $08
	db $9B, $08
	db $98, $08
	db $9B, $08
	db !return_from_sub

.subseq_1D35:
	db $80, $11
	db $80, $28
	db !play_subsequence : dw .subseq_1AC2
	db !vibrato_with_delay, $03, $03, $15, $04
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db $9C, $08
	db $A0, $08
	db $A1, $2C
	db $80, $04
	db $A0, $08
	db $9E, $08
	db $A0, $10
	db $9C, $08
	db $99, $28
	db $80, $38
	db $80, $30
	db $99, $08
	db $9C, $08
	db $A0, $08
	db $A1, $2C
	db $80, $04
	db $A0, $08
	db $9E, $08
	db $A0, $40
	db $80, $38
	db $80, $30
	db $99, $08
	db $9C, $08
	db $A0, $08
	db $A1, $2C
	db $80, $04
	db $A0, $08
	db $9E, $08
	db $A0, $10
	db $A5, $08
	db $99, $28
	db $80, $1F
	db !return_from_sub

.subseq_1D87:
	db $8A, $18
	db $8A, $E8
	db !return_from_sub

.seq_1D8C:
	db !play_subsequence : dw .subseq_1ACF
	db !echo_on
	db $80, $08
	db $80, $80
.loop_point_1D94:
	db $80, $80
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $FF, $56
	db !set_variable_note_1, $99
	db !loop_subsequence, $06 : dw .subseq_1F1B
	db !play_subsequence : dw .subseq_1AAE
	db !set_default_duration, $04
	db !play_subsequence : dw .subseq_1E21
	db !play_subsequence : dw .subseq_1DD4
	db !play_subsequence : dw .subseq_1E21
	db !play_subsequence : dw .subseq_1DD4
	db !default_duration_off
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !vibrato_off
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $88, $E8
	db !echo_on
	db $99, $80
	db !jump_to_sequence : dw .loop_point_1D94
	db !end_sequence

.subseq_1DD4:
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_1E53
	db !set_variable_note_1, $A1
	db !play_subsequence : dw .subseq_1E53
	db !play_subsequence : dw .subseq_1DE2
	db !return_from_sub

.subseq_1DE2:
	db !load_volume_preset_1
	db $98
	db $80
	db $A0
	db !load_volume_preset_2
	db $98
	db !load_volume_preset_1
	db $A0
	db !load_volume_preset_2
	db $A0
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $A0
	db !load_volume_preset_1
	db $A0
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $A0
	db !load_volume_preset_1
	db $A0
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $A0
	db !load_volume_preset_1
	db $98
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $98
	db !load_volume_preset_1
	db $A1
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $A1
	db !load_volume_preset_1
	db $98
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $98
	db !load_volume_preset_1
	db $A0
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $A0
	db !return_from_sub

.subseq_1E21:
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_1E53
	db !set_variable_note_1, $A1
	db !play_subsequence : dw .subseq_1E53
	db !set_variable_note_1, $A0
	db !play_subsequence : dw .subseq_1E53
	db !play_subsequence : dw .subseq_1E34
	db !return_from_sub

.subseq_1E34:
	db !load_volume_preset_1
	db $99
	db $80
	db $95
	db !load_volume_preset_2
	db $99
	db !load_volume_preset_1
	db $99
	db !load_volume_preset_2
	db $95
	db !load_volume_preset_1
	db $9C
	db !load_volume_preset_2
	db $99
	db !load_volume_preset_1
	db $9B
	db !load_volume_preset_2
	db $9C
	db !load_volume_preset_1
	db $97
	db !load_volume_preset_2
	db $9B
	db !load_volume_preset_1
	db $92
	db !load_volume_preset_2
	db $97
	db !load_volume_preset_1
	db $97
	db !load_volume_preset_2
	db $92
	db !return_from_sub

.subseq_1E53:
	db !load_volume_preset_1
	db $99
	db $80
	db $E0
	db !load_volume_preset_2
	db $99
	db !load_volume_preset_1
	db $E0
	db !load_volume_preset_2
	db $E0
	db !load_volume_preset_1
	db $9C
	db !load_volume_preset_2
	db $99
	db !load_volume_preset_1
	db $E0
	db !load_volume_preset_2
	db $E0
	db !load_volume_preset_1
	db $9C
	db !load_volume_preset_2
	db $E0
	db !load_volume_preset_1
	db $E0
	db !load_volume_preset_2
	db $9C
	db !load_volume_preset_1
	db $9C
	db !load_volume_preset_2
	db $E0
	db !return_from_sub

.unreached_1E72:
	db !set_variable_note_1, $92
	db !set_instrument, $47
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $39
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $43
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $3D
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3F
	db !play_subsequence : dw .subseq_1F6C
	db !set_variable_note_1, $94
	db !set_instrument, $4F
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3D
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $43
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $39
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $37
	db !play_subsequence : dw .subseq_1F6C
	db !set_variable_note_1, $95
	db !set_instrument, $47
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $39
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $43
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $3D
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3F
	db !play_subsequence : dw .subseq_1F6C
	db !set_variable_note_1, $97
	db !set_instrument, $4F
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3D
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $43
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $39
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $37
	db !play_subsequence : dw .subseq_1F6C
	db !return_from_sub

.subseq_1F1B:
	db !set_instrument, $47
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $39
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $43
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $3D
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3F
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $4F
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3D
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $43
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $39
	db !play_subsequence : dw .subseq_1F6C
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_1F77
	db !set_instrument, $37
	db !play_subsequence : dw .subseq_1F6C
	db !return_from_sub

.subseq_1F6C:
	db !set_volume_l_and_r, $28, $0C
	db $E0, $04
	db !set_volume_l_and_r, $05, $0F
	db $E0, $04
	db !return_from_sub

.subseq_1F77:
	db !set_volume_l_and_r, $0C, $28
	db $E0, $04
	db !set_volume_l_and_r, $0F, $05
	db $E0, $04
	db !return_from_sub

.seq_1F82:
	db !play_subsequence : dw .subseq_1ACF
	db $80, $08
.loop_point_1F87:
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1A9A
	db !set_volume_l_and_r, $06, $06
	db !set_adsr, $88, $E0
	db !set_variable_note_1, $8D
	db !loop_subsequence, $08 : dw .subseq_1FE9
	db !play_subsequence : dw .subseq_1AAE
	db !set_default_duration, $04
	db !loop_subsequence, $02 : dw .subseq_1E21
	db !default_duration_off
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1AB8
	db !set_volume_l_and_r, $04, $01
	db !vibrato_with_delay, $03, $01, $0B, $02
	db $80, $07
	db !play_subsequence : dw .subseq_1CF6
	db $A0, $09
	db !vibrato_off
	db !play_subsequence : dw .subseq_1A9A
	db !change_instr_pitch_rel, $F4
	db !set_adsr, $88, $E0
	db !long_duration_on
	db !set_volume_l_and_r, $64, $64
	db $81, $01, $C0
	db !set_volume_l_and_r, $50, $50
	db $88, $00, $40
	db !set_volume_l_and_r, $64, $64
	db $81, $01, $00
	db !long_duration_off
	db !set_volume_l_and_r, $50, $50
	db $86, $40
	db $88, $40
	db !set_volume_l_and_r, $46, $46
	db $89, $40
	db $8B, $40
	db !jump_to_sequence : dw .loop_point_1F87
	db !end_sequence

.subseq_1FE9:
	db $E0, $20
	db !return_from_sub

.seq_1FEC:
	db !play_subsequence : dw .subseq_1ACF
	db $80, $08
.loop_point_1FF1:
	db !set_instrument, $9B
	db !change_instr_pitch, $00
	db !fine_tune, $A8
	db !set_volume_l_and_r, $64, $64
	db !set_adsr, $88, $E1
	db !vibrato_with_delay, $0B, $0B, $1C, $05
	db !long_duration_on
	db $89, $04, $00
	db !long_duration_off
	db !vibrato_off
	db !play_subsequence : dw .subseq_1AA4
	db !set_default_duration, $08
	db !play_subsequence : dw .subseq_207B
	db !play_subsequence : dw .subseq_2058
	db !play_subsequence : dw .subseq_207B
	db !play_subsequence : dw .subseq_2058
	db !play_subsequence : dw .subseq_2047
	db !play_subsequence : dw .subseq_2024
	db !default_duration_off
	db !jump_to_sequence : dw .loop_point_1FF1
	db !end_sequence

.subseq_2024:
	db !play_subsequence : dw .subseq_216E
	db !play_subsequence : dw .subseq_2035
	db !play_subsequence : dw .subseq_216E
	db !set_variable_note_1, $9C
	db !set_variable_note_2, $9E
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_2035:
	db !set_volume_l_and_r, $11, $08
	db $9B
	db $9B
	db $9B
	db $9B
	db !set_volume_l_and_r, $04, $0B
	db $9B
	db !set_volume_l_and_r, $06, $0E
	db $97
	db $9B
	db $97
	db !return_from_sub

.subseq_2047:
	db !play_subsequence : dw .subseq_20B6
	db !play_subsequence : dw .subseq_20A4
	db !play_subsequence : dw .subseq_20B6
	db !set_variable_note_1, $9C
	db !set_variable_note_2, $9B
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_2058:
	db !play_subsequence : dw .subseq_20B6
	db !play_subsequence : dw .subseq_20A4
	db !play_subsequence : dw .subseq_2069
	db !set_variable_note_1, $A1
	db !set_variable_note_2, $A0
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_2069:
	db !set_volume_l_and_r, $11, $08
	db $A0
	db $A0
	db $A0
	db $A0
	db !set_volume_l_and_r, $04, $0B
	db $A0
	db !set_volume_l_and_r, $06, $0E
	db $9B
	db $A0
	db $9B
	db !return_from_sub

.subseq_207B:
	db !play_subsequence : dw .subseq_20B6
	db !play_subsequence : dw .subseq_20A4
	db !play_subsequence : dw .subseq_20B6
	db !set_variable_note_1, $9C
	db !set_variable_note_2, $9E
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_208C:
	db !set_volume_l_and_r, $11, $08
	db $E0
	db $E0
	db !set_volume_l_and_r, $04, $0B
	db $E0
	db !set_volume_l_and_r, $11, $08
	db $E0
	db !set_volume_l_and_r, $11, $08
	db $E1
	db $E1
	db $E1
	db !set_volume_l_and_r, $04, $0B
	db $E1
	db !return_from_sub

.subseq_20A4:
	db !set_volume_l_and_r, $11, $08
	db $A1
	db $A1
	db $A1
	db $A1
	db !set_volume_l_and_r, $04, $0B
	db $A1
	db !set_volume_l_and_r, $06, $0E
	db $9C
	db $A1
	db $9C
	db !return_from_sub

.subseq_20B6:
	db !set_volume_l_and_r, $11, $08
	db $A0
	db $A0
	db $A0
	db $A0
	db !set_volume_l_and_r, $04, $0B
	db $A0
	db !set_volume_l_and_r, $06, $0E
	db $9C
	db $A0
	db $9C
	db !return_from_sub

.seq_20C8:
	db !play_subsequence : dw .subseq_1ACF
	db $80, $08
.loop_point_20CD:
	db !set_instrument, $99
	db !change_instr_pitch, $00
	db !fine_tune, $A8
	db !set_volume_l_and_r, $B8, $14
	db !set_adsr, $88, $E1
	db !vibrato_with_delay, $0B, $0B, $1C, $05
	db !long_duration_on
	db $87, $04, $00
	db !long_duration_off
	db !vibrato_off
	db !play_subsequence : dw .subseq_1AA4
	db !set_default_duration, $08
	db !play_subsequence : dw .subseq_2162
	db !play_subsequence : dw .subseq_2141
	db !play_subsequence : dw .subseq_2162
	db !play_subsequence : dw .subseq_2141
	db !play_subsequence : dw .subseq_2135
	db !play_subsequence : dw .subseq_2100
	db !default_duration_off
	db !jump_to_sequence : dw .loop_point_20CD
	db !end_sequence

.subseq_2100:
	db !play_subsequence : dw .subseq_2111
	db !play_subsequence : dw .subseq_2123
	db !play_subsequence : dw .subseq_2111
	db !set_variable_note_1, $99
	db !set_variable_note_2, $9B
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_2111:
	db !set_volume_l_and_r, $11, $08
	db $99
	db $99
	db $99
	db $99
	db !set_volume_l_and_r, $04, $0B
	db $99
	db !set_volume_l_and_r, $06, $0E
	db $95
	db $99
	db $95
	db !return_from_sub

.subseq_2123:
	db !set_volume_l_and_r, $11, $08
	db $97
	db $97
	db $97
	db $97
	db !set_volume_l_and_r, $04, $0B
	db $97
	db !set_volume_l_and_r, $06, $0E
	db $92
	db $97
	db $92
	db !return_from_sub

.subseq_2135:
	db !loop_subsequence, $03 : dw .subseq_216E
	db !set_variable_note_1, $99
	db !set_variable_note_2, $97
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_2141:
	db !loop_subsequence, $02 : dw .subseq_216E
	db !play_subsequence : dw .subseq_2150
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $9B
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_2150:
	db !set_volume_l_and_r, $11, $08
	db $9B
	db $9B
	db $9B
	db $9B
	db !set_volume_l_and_r, $04, $0B
	db $9B
	db !set_volume_l_and_r, $06, $0E
	db $98
	db $9B
	db $98
	db !return_from_sub

.subseq_2162:
	db !loop_subsequence, $03 : dw .subseq_216E
	db !set_variable_note_1, $99
	db !set_variable_note_2, $9B
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_216E:
	db !set_volume_l_and_r, $11, $08
	db $9C
	db $9C
	db $9C
	db $9C
	db !set_volume_l_and_r, $04, $0B
	db $9C
	db !set_volume_l_and_r, $06, $0E
	db $99
	db $9C
	db $99
	db !return_from_sub

.seq_2180:
	db !play_subsequence : dw .subseq_1ACF
	db $80, $08
.loop_point_2185:
	db !set_instrument, $99
	db !change_instr_pitch, $00
	db !fine_tune, $A8
	db !set_volume_l_and_r, $14, $B8
	db !set_adsr, $88, $E1
	db !vibrato_with_delay, $0B, $0B, $1C, $05
	db !long_duration_on
	db $88, $04, $00
	db !long_duration_off
	db !vibrato_off
	db !play_subsequence : dw .subseq_1AA4
	db !set_default_duration, $08
	db !play_subsequence : dw .subseq_2221
	db !play_subsequence : dw .subseq_21FE
	db !play_subsequence : dw .subseq_2221
	db !play_subsequence : dw .subseq_21FE
	db !play_subsequence : dw .subseq_21ED
	db !play_subsequence : dw .subseq_21B8
	db !default_duration_off
	db !jump_to_sequence : dw .loop_point_2185
	db !end_sequence

.subseq_21B8:
	db !play_subsequence : dw .subseq_21C9
	db !play_subsequence : dw .subseq_21DB
	db !play_subsequence : dw .subseq_21C9
	db !set_variable_note_1, $95
	db !set_variable_note_2, $97
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_21C9:
	db !set_volume_l_and_r, $11, $08
	db $95
	db $95
	db $95
	db $95
	db !set_volume_l_and_r, $04, $0B
	db $95
	db !set_volume_l_and_r, $06, $0E
	db $90
	db $95
	db $90
	db !return_from_sub

.subseq_21DB:
	db !set_volume_l_and_r, $11, $08
	db $92
	db $92
	db $92
	db $92
	db !set_volume_l_and_r, $04, $0B
	db $92
	db !set_volume_l_and_r, $06, $0E
	db $8F
	db $92
	db $8F
	db !return_from_sub

.subseq_21ED:
	db !play_subsequence : dw .subseq_2244
	db !play_subsequence : dw .subseq_2232
	db !play_subsequence : dw .subseq_2244
	db !set_variable_note_1, $95
	db !set_variable_note_2, $92
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_21FE:
	db !play_subsequence : dw .subseq_2244
	db !play_subsequence : dw .subseq_2232
	db !play_subsequence : dw .subseq_220F
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $98
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_220F:
	db !set_volume_l_and_r, $11, $08
	db $98
	db $98
	db $98
	db $98
	db !set_volume_l_and_r, $04, $0B
	db $98
	db !set_volume_l_and_r, $06, $0E
	db $94
	db $98
	db $94
	db !return_from_sub

.subseq_2221:
	db !play_subsequence : dw .subseq_2244
	db !play_subsequence : dw .subseq_2232
	db !play_subsequence : dw .subseq_2244
	db !set_variable_note_1, $95
	db !set_variable_note_2, $97
	db !play_subsequence : dw .subseq_208C
	db !return_from_sub

.subseq_2232:
	db !set_volume_l_and_r, $11, $08
	db $99
	db $99
	db $99
	db $99
	db !set_volume_l_and_r, $04, $0B
	db $99
	db !set_volume_l_and_r, $06, $0E
	db $95
	db $99
	db $95
	db !return_from_sub

.subseq_2244:
	db !set_volume_l_and_r, $11, $08
	db $99
	db $99
	db $99
	db $99
	db !set_volume_l_and_r, $04, $0B
	db $99
	db !set_volume_l_and_r, $06, $0E
	db $94
	db $99
	db $94
	db !return_from_sub

base off
arch 65816
.end: