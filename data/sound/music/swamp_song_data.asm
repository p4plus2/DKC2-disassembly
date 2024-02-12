;03 Bayou Boogie
;2E2CD3
swamp_song_data:
	dw !bgm_loc, $0851
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1CB7, .seq_221C, .seq_1BA6, .seq_1C2D, .seq_207C, .seq_1DDA, .seq_1AA2, .seq_1B26
	db $A0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131E	;01: 
	dw .chn_ptrs_1330	;02: 
	dw .chn_ptrs_1342	;03: 
	dw .chn_ptrs_1354	;04: 
	dw .chn_ptrs_1366	;05: 

;sub-track 01 channel pointers
.chn_ptrs_131E:
	dw .seq_1917, .seq_196C, .seq_1955, .seq_199A, .seq_19B1, .seq_194C, .seq_1983, .seq_1921
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_1330:
	dw .seq_163F, .seq_16C3, .seq_179F, .seq_17F9, .seq_1694, .seq_18EA, .seq_18BD, .seq_1747
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1342:
	dw .seq_14A8, .seq_1512, .seq_155D, .seq_15DB, .seq_14E7, .seq_161B, .seq_162D, .seq_15FB
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1354:
	dw .seq_138C, .seq_13CF, .seq_13E5, .seq_1411, .seq_1427, .seq_1481, .seq_143D, .seq_1453
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 05 channel pointers
.chn_ptrs_1366:
	dw .seq_1CB7, .seq_207C, .seq_1BA6, .seq_221C, .seq_1AA2, .seq_1B26, .seq_1DDA, .seq_1C2D
	db $A0, $FF	;music tempo, sound effect tempo

.subseq_1378:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.subseq_1382:
	db !set_instrument, $29
	db !change_instr_pitch, $0B
	db !fine_tune, $F5
	db !set_adsr, $DF, $90
	db !return_from_sub

.seq_138C:
	db !play_subsequence : dw .subseq_1A94
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !set_instrument, $89
	db !set_vol_single_val, $46
	db $9E, $09
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $3C
	db $97, $07
	db $97, $09
	db !set_instrument, $89
	db !set_vol_single_val, $46
	db $9E, $10
	db $9E, $07
	db $9E, $05
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $3C
	db $97, $05
	db $97, $06
	db !set_instrument, $89
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

.seq_13CF:
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_vol_single_val, $5A
	db !set_adsr, $AF, $AE
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13E5:
	db !set_instrument, $27
	db !change_instr_pitch, $F4
	db !fine_tune, $2E
	db !vibrato_with_delay, $03, $02, $04, $0B
	db !set_volume_l_and_r, $11, $21
	db !set_adsr, $8E, $E8
	db !echo_on
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A2, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db !set_adsr, $8F, $4B
	db $AC, $19
	db $80, $07
	db $AC, $10
	db !end_sequence

.seq_1411:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $23, $19
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_1427:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $19, $23
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_143D:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1453:
	db !set_instrument, $27
	db !change_instr_pitch, $F4
	db !fine_tune, $2E
	db !vibrato_with_delay, $03, $02, $04, $0B
	db !set_adsr, $8E, $E8
	db !set_volume_l_and_r, $11, $08
	db $80, $0E
	db !echo_on
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A2, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db !set_adsr, $8E, $4B
	db $AC, $19
	db $80, $07
	db $AC, $10
	db !end_sequence

.seq_1481:
	db !change_instr_pitch, $08
	db !set_instrument, $88
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

.seq_14A8:
	db !play_subsequence : dw .subseq_1A94
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_14D6
.loop_point_14C5:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_14C5

.subseq_14D6:
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

.seq_14E7:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !change_instr_pitch, $08
	db !set_instrument, $88
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $AF, $B2
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db !set_adsr, $8F, $F8
.loop_point_150B:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .loop_point_150B

.seq_1512:
	db !play_subsequence : dw .subseq_1378
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
.loop_point_1539:
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
	db !jump_to_sequence : dw .loop_point_1539
	db !end_sequence

.seq_155D:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $64, $64
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
	db !play_subsequence : dw .subseq_1378
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
	db !play_subsequence : dw .subseq_1579
	db !end_sequence

.seq_15FB:
	db !play_subsequence : dw .subseq_1378
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
	db !play_subsequence : dw .subseq_1579
	db !end_sequence

.seq_161B:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_162D:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $28, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_163F:
	db !play_subsequence : dw .subseq_1A94
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_165D
	db !end_sequence

.subseq_165D:
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db $94, $10
	db !set_instrument, $89
	db !set_vol_single_val, $6C
	db $9E, $10
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $96, $09
	db !set_instrument, $89
	db !set_vol_single_val, $26
	db $A5, $10
	db $A4, $07
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $98, $09
	db !set_instrument, $89
	db !set_vol_single_val, $26
	db $A3, $07
	db !set_vol_single_val, $6C
	db $9E, $10
	db !set_vol_single_val, $26
	db $A4, $09
	db !set_vol_single_val, $2C
	db $A5, $07
	db !return_from_sub

.seq_1694:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $08
	db !fine_tune, $00
	db !set_instrument, $88
	db !set_volume_l_and_r, $14, $1E
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_16B4
	db !default_duration_off
	db !end_sequence

.subseq_16B4:
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

.seq_16C3:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_16DB
	db !end_sequence

.subseq_16DB:
	db !play_subsequence : dw .subseq_16E8
	db !play_subsequence : dw .subseq_1725
	db !play_subsequence : dw .subseq_16E8
	db !play_subsequence : dw .subseq_1736
	db !return_from_sub

.subseq_16E8:
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

.subseq_1725:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_1736:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_1747:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1764
	db !end_sequence

.subseq_1764:
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $97, $10
	db $94, $10
	db !echo_on
	db !set_instrument, $89
	db !set_vol_single_val, $24
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $96, $09
	db !echo_on
	db !set_instrument, $89
	db !set_vol_single_val, $0C
	db $A5, $10
	db $A4, $07
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $98, $09
	db !echo_on
	db !set_instrument, $89
	db !set_vol_single_val, $0C
	db $A3, $07
	db !set_vol_single_val, $24
	db $9E, $10
	db !set_vol_single_val, $0C
	db $A4, $09
	db !set_vol_single_val, $11
	db $A5, $07
	db !return_from_sub

.seq_179F:
	db !play_subsequence : dw .subseq_1378
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
	db !loop_subsequence, $02 : dw .subseq_17D4
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_17D4
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17D4
	db !end_sequence

.subseq_17D4:
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

.seq_17F9:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1874
	db !play_subsequence : dw .subseq_1852
	db !play_subsequence : dw .subseq_1382
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_1824
	db !end_sequence

.subseq_1824:
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

.subseq_1852:
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
.subseq_1874:
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

.seq_18BD:
	db !play_subsequence : dw .subseq_1378
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
	db !play_subsequence : dw .subseq_1874
	db !play_subsequence : dw .subseq_1852
	db !play_subsequence : dw .subseq_1382
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_1824
	db !end_sequence

.seq_18EA:
	db !play_subsequence : dw .subseq_1378
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
	db !play_subsequence : dw .subseq_1874
	db !play_subsequence : dw .subseq_1852
	db !play_subsequence : dw .subseq_1382
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_1824
	db !end_sequence

.seq_1917:
	db !play_subsequence : dw .subseq_1A94
	db $80, $10
	db !loop_subsequence, $03 : dw .subseq_1B55
	db !end_sequence

.seq_1921:
	db !set_instrument, $26
	db !change_instr_pitch, $0C
	db !fine_tune, $A8
	db !vibrato_with_delay, $03, $02, $0E, $08
	db !set_volume_l_and_r, $21, $0B
	db !set_adsr, $B9, $6F
.loop_point_1932:
	db !echo_on
	db $9E, $08
	db $A0, $08
	db $A1, $18
	db $A0, $08
	db $9E, $10
	db $9C, $08
	db $9B, $08
	db $97, $10
	db $9A, $10
	db $9B, $10
	db $9C, $30
	db $9A, $FF
	db !end_sequence

.seq_194C:
	db $80, $10
	db !change_instr_pitch, $F8
	db !loop_subsequence, $03 : dw .subseq_1C02
	db !end_sequence

.seq_1955:
	db !set_instrument, $15
	db !change_instr_pitch, $08
	db !change_instr_pitch_rel, $E8
	db !fine_tune, $03
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $CA, $AB
	db $80, $10
	db $A1, $20
	db $A1, $80
	db $9A, $D0
	db !end_sequence

.seq_196C:
	db !set_instrument, $15
	db !change_instr_pitch, $08
	db !change_instr_pitch_rel, $E8
	db !fine_tune, $03
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $CA, $AB
	db $80, $10
	db $9E, $20
	db $9E, $80
	db $97, $D0
	db !end_sequence

.seq_1983:
	db !set_instrument, $26
	db !change_instr_pitch, $0C
	db !fine_tune, $A8
	db !vibrato_with_delay, $03, $02, $0E, $08
	db !set_volume_l_and_r, $05, $0E
	db !set_adsr, $B9, $6F
	db $80, $0E
	db !jump_to_sequence : dw .loop_point_1932
	db !end_sequence

.seq_199A:
	db !set_instrument, $15
	db !change_instr_pitch, $08
	db !change_instr_pitch_rel, $E8
	db !fine_tune, $03
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $CA, $AB
	db $80, $10
	db $9B, $20
	db $9B, $80
	db $A0, $D0
	db !end_sequence

.seq_19B1:
	db !set_variable_note_1, $8B
	db !loop_subsequence, $01 : dw .subseq_22B5
	db !set_default_duration, $08
	db !set_instrument, $28
	db !change_instr_pitch, $EB
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $9F, $B0
	db $8B
	db !set_instrument, $2A
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $8B
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $F8
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $85
	db $8E
	db !set_instrument, $8B
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $8E
	db !set_instrument, $29
	db !change_instr_pitch, $F3
	db !fine_tune, $F5
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $8F
	db !set_instrument, $50
	db !change_instr_pitch, $EF
	db !fine_tune, $2E
	db !set_volume_l_and_r, $46, $46
	db !set_adsr, $DE, $90
	db $8F
	db !set_instrument, $2A
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $90
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $F8
	db !set_volume_l_and_r, $32, $32
	db !set_adsr, $AF, $85
	db $90
	db !set_instrument, $28
	db !change_instr_pitch, $EB
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $9F, $B0
	db $90
	db !set_instrument, $2A
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $90
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $F8
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $85
	db $90
	db !set_instrument, $8B
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $90
	db !set_instrument, $29
	db !change_instr_pitch, $F3
	db !fine_tune, $F5
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $90
	db !set_instrument, $50
	db !change_instr_pitch, $EF
	db !fine_tune, $2E
	db !set_volume_l_and_r, $46, $46
	db !set_adsr, $DE, $90
	db $90
	db !set_instrument, $2A
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $84
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $F8
	db !set_volume_l_and_r, $32, $32
	db !set_adsr, $AF, $85
	db $84
	db !default_duration_off
	db !set_variable_note_1, $84
	db !loop_subsequence, $03 : dw .subseq_22B5
	db !end_sequence

.subseq_1A91:
	db $80, $10
	db !return_from_sub

.subseq_1A94:
	db !set_echo, $32, $21, $21
	db !set_fir, $77, $08, $08, $20, $00, $00, $00, $00
	db !return_from_sub

.seq_1AA2:
	db !play_subsequence : dw .subseq_1A91
	db !echo_off
	db !set_instrument, $17
	db !change_instr_pitch, $0F
	db !fine_tune, $E9
	db !set_volume_l_and_r, $05, $05
	db !pitch_slide_up, $02, $03, $17, $6F, $05
	db !set_adsr, $FC, $F4
	db !loop_subsequence, $24 : dw .subseq_1B14
.loop_point_1ABC:
	db !pitch_slide_off
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_adsr, $88, $E5
	db !change_instr_pitch_rel, $F4
	db $80, $80
	db $80, $80
	db !set_volume_l_and_r, $05, $0A
	db !loop_subsequence, $06 : dw .subseq_1B08
	db !loop_subsequence, $02 : dw .subseq_1AFC
	db !loop_subsequence, $04 : dw .subseq_1B08
	db $80, $80
	db $80, $80
	db !echo_off
	db !set_instrument, $17
	db !change_instr_pitch, $0F
	db !fine_tune, $E9
	db !set_volume_l_and_r, $05, $05
	db !pitch_slide_up, $02, $03, $17, $6F, $05
	db !set_adsr, $FC, $F4
	db !loop_subsequence, $18 : dw .subseq_1B14
	db !pitch_slide_off
	db !jump_to_sequence : dw .loop_point_1ABC
	db !end_sequence

.subseq_1AFC:
	db !set_default_duration, $10
	db $9E
	db $A2
	db $A4
	db $A5
	db $A4
	db $A2
	db $9D
	db $9E
	db !default_duration_off
	db !return_from_sub

.subseq_1B08:
	db !set_default_duration, $10
	db $9D
	db $A2
	db $A4
	db $A5
	db $A4
	db $A2
	db $9D
	db $9E
	db !default_duration_off
	db !return_from_sub

.subseq_1B14:
	db !set_adsr, $FC, $F4
	db $99, $10
	db $9A, $06
	db $80, $0A
	db $99, $06
	db $80, $0A
	db $99, $06
	db $80, $0A
	db !return_from_sub

.seq_1B26:
	db !play_subsequence : dw .subseq_1A91
	db !set_volume_l_and_r, $20, $20
	db !set_instrument, $88
	db !change_instr_pitch, $10
	db !pitch_slide_up, $02, $03, $17, $6F, $01
	db !loop_subsequence, $12 : dw .subseq_1B8D
.loop_point_1B3A:
	db !pitch_slide_off
	db !loop_subsequence, $0C : dw .subseq_1B55
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !pitch_slide_up, $02, $03, $17, $6F, $01
	db !loop_subsequence, $0C : dw .subseq_1B8D
	db !jump_to_sequence : dw .loop_point_1B3A
	db !end_sequence

.subseq_1B55:
	db !set_volume_l_and_r, $20, $20
	db !set_instrument, $88
	db !change_instr_pitch, $10
	db !set_adsr, $DE, $92
	db $9A, $10
	db !set_adsr, $FE, $5B
	db $9A, $20
	db $9A, $10
	db !set_instrument, $17
	db !change_instr_pitch, $0F
	db !fine_tune, $E9
	db !set_volume_l_and_r, $05, $05
	db !set_adsr, $FC, $F4
	db $99, $10
	db !set_volume_l_and_r, $20, $20
	db !set_instrument, $88
	db !change_instr_pitch, $10
	db !set_adsr, $FE, $5B
	db $9A, $10
	db !set_adsr, $DE, $92
	db $9A, $10
	db !set_adsr, $FE, $5B
	db $9A, $10
	db !return_from_sub

.subseq_1B8D:
	db !set_adsr, $DE, $92
	db $9A, $10
	db !set_adsr, $FE, $5B
	db $9A, $20
	db $9A, $20
	db $9A, $10
	db !set_adsr, $DE, $92
	db $9A, $10
	db !set_adsr, $FE, $5B
	db $9A, $10
	db !return_from_sub

.seq_1BA6:
	db !play_subsequence : dw .subseq_1A91
	db !change_instr_pitch, $F8
	db !loop_subsequence, $12 : dw .subseq_1C02
.loop_point_1BAF:
	db !loop_subsequence, $0C : dw .subseq_1BC3
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !loop_subsequence, $0C : dw .subseq_1C02
	db !jump_to_sequence : dw .loop_point_1BAF
	db !end_sequence

.subseq_1BC3:
	db !set_instrument, $00
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $AF, $FC
	db $99, $10
	db !set_instrument, $8B
	db !set_volume_l_and_r, $2C, $2C
	db !set_adsr, $FF, $59
	db $99, $10
	db !set_instrument, $89
	db !set_volume_l_and_r, $60, $60
	db !set_adsr, $AF, $FC
	db $99, $10
	db !set_instrument, $8B
	db !set_volume_l_and_r, $2C, $2C
	db !set_adsr, $FF, $59
	db $99, $20
	db $99, $10
	db !set_instrument, $89
	db !set_volume_l_and_r, $60, $60
	db !set_adsr, $AF, $FC
	db $99, $10
	db !set_instrument, $00
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $AF, $FC
	db $96, $10
	db !return_from_sub

.subseq_1C02:
	db $80, $10
	db !set_instrument, $8B
	db !set_volume_l_and_r, $2C, $2C
	db !set_adsr, $FF, $59
	db $99, $10
	db !set_instrument, $00
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $AF, $FC
	db $99, $10
	db !set_instrument, $8B
	db !set_volume_l_and_r, $2C, $2C
	db !set_adsr, $FF, $59
	db $99, $30
	db !set_instrument, $00
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $AF, $FC
	db $99, $20
	db !return_from_sub

.seq_1C2D:
	db !play_subsequence : dw .subseq_1A91
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !change_instr_pitch_rel, $E8
	db !fine_tune, $03
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $CC, $A8
	db !long_duration_on
	db $80, $04, $00
	db !long_duration_off
.loop_point_1C43:
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $88, $20
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $8C, $20
	db $8D, $60
	db $8D, $20
	db $8D, $60
	db $8D, $20
	db $8F, $60
	db $8F, $20
	db $8F, $50
	db $91, $30
	db $92, $60
	db $92, $20
	db $92, $60
	db $94, $20
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $88, $20
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $88, $20
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $8C, $20
	db $8D, $60
	db $8D, $20
	db $8D, $60
	db $8D, $20
	db $8F, $60
	db $8F, $20
	db $8F, $60
	db $91, $20
	db $92, $60
	db $92, $20
	db $92, $60
	db $94, $20
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $88, $20
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $88, $20
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $88, $20
	db !jump_to_sequence : dw .loop_point_1C43
	db !end_sequence

.seq_1CB7:
	db !echo_delay, $04
	db !play_subsequence : dw .subseq_1A91
	db !play_subsequence : dw .subseq_1A94
	db !echo_on
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $05, $08
	db !set_adsr, $AE, $A4
	db !vibrato_with_delay, $02, $02, $08, $08
	db !long_duration_on
	db $80, $05, $00
	db !long_duration_off
.loop_point_1CD6:
	db !loop_subsequence, $02 : dw .subseq_220D
	db !loop_subsequence, $02 : dw .subseq_21FE
	db !loop_subsequence, $01 : dw .subseq_21E1
	db !loop_subsequence, $01 : dw .subseq_21D6
	db !loop_subsequence, $01 : dw .subseq_21D2
	db !echo_off
	db !set_instrument, $22
	db !set_volume_l_and_r, $18, $0A
	db !change_instr_pitch, $05
	db !fine_tune, $B6
	db !set_adsr, $8F, $E5
	db !change_instr_pitch_rel, $F4
	db $80, $80
	db $80, $80
	db !loop_subsequence, $06 : dw .subseq_2181
	db !loop_subsequence, $02 : dw .subseq_2130
	db !loop_subsequence, $04 : dw .subseq_2181
	db !echo_on
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $05, $08
	db !set_adsr, $AE, $A4
	db !vibrato_with_delay, $02, $02, $08, $08
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1CD6
	db !end_sequence

.subseq_1D2B:
	db !set_instrument, $09
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $50, $20
	db !set_adsr, $8E, $F2
	db !set_volume_l_and_r, $50, $20
	db $8C, $02
	db $8C, $02
	db $8C, $02
	db $8D, $03
	db $8E, $03
	db $8F, $03
	db $90, $05
	db $90, $05
	db $90, $05
	db $80, $20
	db !set_volume_l_and_r, $50, $50
	db $90, $02
	db $90, $02
	db $90, $02
	db $95, $03
	db $96, $03
	db $97, $05
	db $97, $05
	db $98, $05
	db $80, $10
	db !set_instrument, $17
	db !change_instr_pitch, $F8
	db !fine_tune, $00
	db !echo_off
	db !set_adsr, $8F, $F2
	db !pitch_slide_up, $03, $02, $60, $7F, $00
	db !set_volume_l_and_r, $20, $20
	db $81, $08
	db !set_volume_l_and_r, $0A, $0A
	db $81, $08
	db !pitch_slide_off
	db !echo_on
	db !set_instrument, $09
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $30, $60
	db $8C, $02
	db $8C, $02
	db $8C, $02
	db $8D, $03
	db $8E, $03
	db $8F, $03
	db $90, $05
	db $90, $05
	db $90, $04
	db !set_volume_l_and_r, $20, $70
	db $8C, $02
	db $8C, $02
	db $8C, $02
	db $8D, $03
	db $8E, $03
	db $8F, $03
	db $90, $05
	db $90, $05
	db $90, $05
	db $80, $38
	db !set_instrument, $17
	db !change_instr_pitch, $0C
	db !fine_tune, $E9
	db !set_volume_l_and_r, $12, $18
	db !set_adsr, $FF, $F4
	db !pitch_slide_up, $01, $03, $17, $6F, $02
	db $81, $0A
	db !set_instrument, $0C
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $40, $08
	db !set_adsr, $9F, $EF
	db $A0, $02
	db $A1, $02
	db $A3, $02
	db $A4, $02
	db !return_from_sub

.seq_1DDA:
	db !play_subsequence : dw .subseq_1A91
	db !echo_on
	db !set_instrument, $25
	db !set_adsr, $FB, $28
	db !simple_pitch_slide_down, $00, $01, $21, $4E
	db !set_volume_l_and_r, $00, $02
	db !fine_tune, $00
	db $B6, $0A
	db $B6, $12
	db !set_volume_l_and_r, $03, $01
	db !fine_tune, $E4
	db $B6, $0A
	db $B6, $1A
	db !loop_subsequence, $07 : dw .subseq_2057
	db !set_volume_l_and_r, $01, $04
	db !fine_tune, $00
	db $B6, $0A
	db $B6, $1A
	db !set_volume_l_and_r, $03, $01
	db !fine_tune, $E4
	db $B6, $0A
	db $B6, $1A
	db !set_volume_l_and_r, $01, $02
	db !fine_tune, $FC
	db $B6, $0A
	db $B6, $1A
	db !set_volume_l_and_r, $01, $00
	db !fine_tune, $0B
	db $B6, $0A
	db $B6, $1A
	db !pitch_slide_off
	db $80, $40
.loop_point_1E25:
	db !set_instrument, $29
	db !change_instr_pitch, $0B
	db !fine_tune, $F5
	db !set_adsr, $DF, $6F
	db !loop_subsequence, $02 : dw .subseq_2016
	db !set_variable_note_1, $96
	db !loop_subsequence, $01 : dw .subseq_1FD5
	db !set_variable_note_1, $9D
	db !loop_subsequence, $01 : dw .subseq_1FD5
	db !loop_subsequence, $01 : dw .subseq_1F57
	db !loop_subsequence, $01 : dw .subseq_1F2A
	db !loop_subsequence, $01 : dw .subseq_1F16
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_instrument, $26
	db !change_instr_pitch, $0C
	db !fine_tune, $A8
	db !set_adsr, $E9, $4F
	db !vibrato_with_delay, $03, $02, $0E, $08
	db !set_volume_l_and_r, $16, $0E
	db !loop_subsequence, $01 : dw .subseq_1F03
	db !set_volume_l_and_r, $09, $10
	db $9B, $08
	db $9D, $18
	db !set_volume_l_and_r, $08, $04
	db $9B, $08
	db $9D, $18
	db !set_volume_l_and_r, $02, $04
	db $9B, $08
	db $9D, $18
	db !set_volume_l_and_r, $16, $0E
	db !loop_subsequence, $01 : dw .subseq_1EEC
	db !set_instrument, $27
	db !change_instr_pitch, $F4
	db !fine_tune, $2E
	db !vibrato_with_delay, $03, $02, $04, $0B
	db !set_adsr, $A8, $AF
	db !set_volume_l_and_r, $0F, $08
	db !loop_subsequence, $01 : dw .subseq_1ECD
	db !set_instrument, $1C
	db !change_instr_pitch, $02
	db !fine_tune, $30
	db !set_volume_l_and_r, $08, $12
	db !set_adsr, $8F, $AB
	db !loop_subsequence, $01 : dw .subseq_1EB8
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1E25
	db !end_sequence

.subseq_1EB8:
	db $A2, $08
	db $A4, $08
	db $A5, $10
	db $A5, $08
	db $A7, $08
	db $A9, $10
	db $A9, $20
	db $A7, $10
	db $A9, $90
	db $80, $80
	db !return_from_sub

.subseq_1ECD:
	db $AA, $10
	db $A9, $08
	db $A7, $18
	db $A5, $08
	db $A2, $28
	db $80, $10
	db $A7, $08
	db $A9, $08
	db $AA, $10
	db $A9, $08
	db $A7, $18
	db $A5, $20
	db $AC, $10
	db $A5, $10
	db $A5, $90
	db !return_from_sub

.subseq_1EEC:
	db $9D, $10
	db $A2, $08
	db $A0, $18
	db $A2, $08
	db $9D, $58
	db $A2, $08
	db $A0, $18
	db $A2, $08
	db $A5, $18
	db $A4, $08
	db $A2, $28
	db !return_from_sub

.subseq_1F03:
	db $9D, $10
	db $A2, $08
	db $A0, $18
	db $A2, $08
	db $9D, $38
	db $9B, $08
	db $99, $08
	db $9B, $08
	db $9D, $18
	db !return_from_sub

.subseq_1F16:
	db !set_volume_l_and_r, $06, $0E
	db $98, $08
	db !set_volume_l_and_r, $05, $02
	db $96, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $08
	db !set_volume_l_and_r, $05, $02
	db $98, $08
.subseq_1F2A:
	db !set_volume_l_and_r, $06, $0E
	db $94, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $08
	db !set_volume_l_and_r, $06, $0E
	db $98, $08
	db !set_volume_l_and_r, $05, $02
	db $94, $10
	db $98, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $10
	db $91, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $08
	db !set_volume_l_and_r, $06, $0E
	db $96, $08
	db !set_volume_l_and_r, $05, $02
	db $91, $08
	db !return_from_sub

.subseq_1F57:
	db !set_volume_l_and_r, $06, $0E
	db $9E, $08
	db !set_volume_l_and_r, $05, $02
	db $9D, $08
	db !set_volume_l_and_r, $06, $0E
	db $9D, $08
	db !set_volume_l_and_r, $05, $02
	db $9E, $08
	db !set_volume_l_and_r, $06, $0E
	db $9B, $08
	db !set_volume_l_and_r, $05, $02
	db $9D, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $08
	db !set_volume_l_and_r, $05, $02
	db $9B, $08
	db !set_volume_l_and_r, $06, $0E
	db $96, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $10
	db $96, $18
	db !set_volume_l_and_r, $06, $0E
	db $9B, $08
	db $9D, $08
	db !set_volume_l_and_r, $06, $0E
	db $9E, $08
	db !set_volume_l_and_r, $05, $02
	db $9B, $08
	db !set_volume_l_and_r, $06, $0E
	db $9D, $08
	db !set_volume_l_and_r, $05, $02
	db $9E, $08
	db !set_volume_l_and_r, $06, $0E
	db $9B, $08
	db !set_volume_l_and_r, $05, $02
	db $9D, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $08
	db !set_volume_l_and_r, $05, $02
	db $9B, $10
	db $99, $08
	db !set_volume_l_and_r, $06, $0E
	db $A0, $10
	db $99, $08
	db !set_volume_l_and_r, $05, $02
	db $A0, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $08
	db $99, $20
	db !return_from_sub

.subseq_1FD5:
	db !set_volume_l_and_r, $06, $0E
	db $98, $08
	db !set_volume_l_and_r, $05, $02
	db $E0, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $08
	db !set_volume_l_and_r, $05, $02
	db $98, $08
	db !set_volume_l_and_r, $06, $0E
	db $A2, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $08
	db !set_volume_l_and_r, $06, $0E
	db $9D, $08
	db !set_volume_l_and_r, $05, $02
	db $A2, $10
	db $9D, $08
	db !set_volume_l_and_r, $06, $0E
	db $A0, $10
	db $9B, $08
	db !set_volume_l_and_r, $05, $02
	db $A0, $08
	db !set_volume_l_and_r, $06, $0E
	db $9D, $08
	db !set_volume_l_and_r, $05, $02
	db $9B, $08
	db !return_from_sub

.subseq_2016:
	db !set_volume_l_and_r, $06, $0E
	db $98, $08
	db !set_volume_l_and_r, $05, $02
	db $96, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $08
	db !set_volume_l_and_r, $05, $02
	db $98, $08
	db !set_volume_l_and_r, $06, $0E
	db $A0, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $08
	db !set_volume_l_and_r, $06, $0E
	db $98, $08
	db !set_volume_l_and_r, $05, $02
	db $A0, $10
	db $98, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $10
	db $91, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $08
	db !set_volume_l_and_r, $06, $0E
	db $96, $08
	db !set_volume_l_and_r, $05, $02
	db $91, $08
	db !return_from_sub

.subseq_2057:
	db !set_volume_l_and_r, $00, $05
	db !fine_tune, $00
	db $B6, $0A
	db $B6, $1A
	db !set_volume_l_and_r, $04, $01
	db !fine_tune, $E4
	db $B6, $0A
	db $B6, $1A
	db !set_volume_l_and_r, $01, $04
	db !fine_tune, $FC
	db $B6, $0A
	db $B6, $1A
	db !set_volume_l_and_r, $05, $00
	db !fine_tune, $0B
	db $B6, $0A
	db $B6, $1A
	db !return_from_sub

.seq_207C:
	db !play_subsequence : dw .subseq_1A91
	db $80, $80
	db !echo_on
	db !loop_subsequence, $0A : dw .subseq_1D2B
	db !pitch_slide_off
	db $80, $14
	db $80, $80
.loop_point_208B:
	db $80, $14
	db !set_instrument, $26
	db !change_instr_pitch, $0C
	db !fine_tune, $A8
	db !set_adsr, $E6, $48
	db !vibrato_with_delay, $04, $01, $0F, $08
	db !set_volume_l_and_r, $04, $08
	db !loop_subsequence, $01 : dw .subseq_1F03
	db !set_volume_l_and_r, $08, $06
	db $9B, $08
	db $9D, $18
	db !set_volume_l_and_r, $03, $05
	db $9B, $08
	db $9D, $18
	db !set_volume_l_and_r, $03, $01
	db $9B, $08
	db $9D, $18
	db !set_volume_l_and_r, $04, $08
	db !loop_subsequence, $01 : dw .subseq_1EEC
	db !set_instrument, $27
	db !change_instr_pitch, $F4
	db !fine_tune, $2E
	db !vibrato_with_delay, $03, $02, $04, $0B
	db !set_adsr, $A6, $A8
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $01 : dw .subseq_1ECD
	db !set_instrument, $1C
	db !change_instr_pitch, $02
	db !fine_tune, $30
	db !set_volume_l_and_r, $06, $03
	db !set_adsr, $8F, $A8
	db !loop_subsequence, $01 : dw .subseq_1EB8
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $6C
	db !echo_off
	db !loop_subsequence, $01 : dw .subseq_22A4
	db !set_variable_note_1, $8A
	db !loop_subsequence, $03 : dw .subseq_22B5
	db !loop_subsequence, $01 : dw .subseq_22BE
	db !set_variable_note_1, $8C
	db !loop_subsequence, $01 : dw .subseq_22F5
	db !set_variable_note_1, $8D
	db !loop_subsequence, $04 : dw .subseq_22B5
	db !set_variable_note_1, $8F
	db !loop_subsequence, $03 : dw .subseq_22B5
	db !loop_subsequence, $01 : dw .subseq_22BE
	db !set_variable_note_1, $91
	db !loop_subsequence, $01 : dw .subseq_22F5
	db !set_variable_note_1, $92
	db !loop_subsequence, $03 : dw .subseq_22B5
	db !loop_subsequence, $01 : dw .subseq_22BE
	db !set_variable_note_1, $94
	db !loop_subsequence, $01 : dw .subseq_22F5
	db !set_variable_note_1, $8A
	db !loop_subsequence, $02 : dw .subseq_22A4
	db !jump_to_sequence : dw .loop_point_208B
	db !end_sequence

.subseq_2130:
	db !set_volume_l_and_r, $0B, $06
	db $9E, $08
	db !set_volume_l_and_r, $02, $07
	db $9E, $08
	db !set_volume_l_and_r, $0B, $06
	db $A2, $08
	db !set_volume_l_and_r, $02, $07
	db $9E, $08
	db !set_volume_l_and_r, $0B, $06
	db $A4, $08
	db !set_volume_l_and_r, $02, $07
	db $A2, $08
	db !set_volume_l_and_r, $0B, $06
	db $A5, $08
	db !set_volume_l_and_r, $02, $07
	db $A4, $08
	db !set_volume_l_and_r, $0B, $06
	db $A4, $08
	db !set_volume_l_and_r, $02, $07
	db $A5, $08
	db !set_volume_l_and_r, $0B, $06
	db $A2, $08
	db !set_volume_l_and_r, $02, $07
	db $A4, $08
	db !set_volume_l_and_r, $0B, $06
	db $9D, $08
	db !set_volume_l_and_r, $02, $07
	db $A2, $08
	db !set_volume_l_and_r, $0B, $06
	db $9E, $08
	db !set_volume_l_and_r, $02, $07
	db $9D, $08
	db !return_from_sub

.subseq_2181:
	db !set_volume_l_and_r, $0B, $06
	db $9D, $08
	db !set_volume_l_and_r, $02, $07
	db $9E, $08
	db !set_volume_l_and_r, $0B, $06
	db $A2, $08
	db !set_volume_l_and_r, $02, $07
	db $9D, $08
	db !set_volume_l_and_r, $0B, $06
	db $A4, $08
	db !set_volume_l_and_r, $02, $07
	db $A2, $08
	db !set_volume_l_and_r, $0B, $06
	db $A5, $08
	db !set_volume_l_and_r, $02, $07
	db $A4, $08
	db !set_volume_l_and_r, $0B, $06
	db $A4, $08
	db !set_volume_l_and_r, $02, $07
	db $A5, $08
	db !set_volume_l_and_r, $0B, $06
	db $A2, $08
	db !set_volume_l_and_r, $02, $07
	db $A4, $08
	db !set_volume_l_and_r, $0B, $06
	db $9D, $08
	db !set_volume_l_and_r, $02, $07
	db $A2, $08
	db !set_volume_l_and_r, $0B, $06
	db $9E, $08
	db !set_volume_l_and_r, $02, $07
	db $9D, $08
	db !return_from_sub

.subseq_21D2:
	db $98, $10
	db $99, $10
.subseq_21D6:
	db $94, $10
	db $98, $20
	db $99, $10
	db $91, $10
	db $96, $10
	db !return_from_sub

.subseq_21E1:
	db $9E, $10
	db $9D, $10
	db $9B, $10
	db $99, $10
	db $96, $30
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db $9D, $10
	db $9B, $10
	db $99, $20
	db $A0, $10
	db $99, $10
	db $99, $30
	db !return_from_sub

.subseq_21FE:
	db $98, $10
	db $99, $10
	db $A2, $10
	db $9D, $20
	db $A0, $10
	db $9B, $10
	db $9D, $10
	db !return_from_sub

.subseq_220D:
	db $98, $10
	db $99, $10
	db $A0, $10
	db $98, $20
	db $99, $10
	db $91, $10
	db $96, $10
	db !return_from_sub

.seq_221C:
	db !play_subsequence : dw .subseq_1A91
	db !long_duration_on
	db $80, $04, $00
	db !long_duration_off
.loop_point_2224:
	db !set_instrument, $2B
	db !change_instr_pitch, $E0
	db !fine_tune, $1B
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $9F, $EA
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $88, $20
	db $8A, $60
	db $8A, $20
	db $8A, $60
	db $8C, $20
	db !set_volume_l_and_r, $1E, $1E
	db $8D, $60
	db $8D, $20
	db $8D, $80
	db !echo_on
	db !set_instrument, $29
	db !change_instr_pitch, $0B
	db !fine_tune, $F5
	db !set_adsr, $DF, $6F
	db !loop_subsequence, $01 : dw .subseq_232B
	db $80, $80
	db $80, $70
	db !echo_off
	db !loop_subsequence, $02 : dw .subseq_22A4
	db !set_variable_note_1, $8A
	db !loop_subsequence, $03 : dw .subseq_22B5
	db !loop_subsequence, $01 : dw .subseq_22BE
	db !set_variable_note_1, $8C
	db !loop_subsequence, $01 : dw .subseq_22F5
	db !set_variable_note_1, $8D
	db !loop_subsequence, $04 : dw .subseq_22B5
	db !set_variable_note_1, $8F
	db !loop_subsequence, $03 : dw .subseq_22B5
	db !loop_subsequence, $01 : dw .subseq_22BE
	db !set_variable_note_1, $91
	db !loop_subsequence, $01 : dw .subseq_22F5
	db !set_variable_note_1, $92
	db !loop_subsequence, $03 : dw .subseq_22B5
	db !loop_subsequence, $01 : dw .subseq_22BE
	db !set_variable_note_1, $94
	db !loop_subsequence, $01 : dw .subseq_22F5
	db !set_variable_note_1, $8A
	db !loop_subsequence, $02 : dw .subseq_22A4
	db !loop_subsequence, $01 : dw .subseq_22A4
	db !jump_to_sequence : dw .loop_point_2224
	db !end_sequence

.subseq_22A4:
	db !set_variable_note_1, $8A
	db !loop_subsequence, $03 : dw .subseq_22B5
	db !loop_subsequence, $01 : dw .subseq_22BE
	db !set_variable_note_1, $88
	db !loop_subsequence, $01 : dw .subseq_22F5
	db !return_from_sub

.subseq_22B5:
	db !loop_subsequence, $01 : dw .subseq_22BE
	db !loop_subsequence, $01 : dw .subseq_22F5
	db !return_from_sub

.subseq_22BE:
	db !set_default_duration, $08
	db !set_instrument, $28
	db !change_instr_pitch, $EB
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $9F, $B0
	db $E0
	db !set_instrument, $2A
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $E0
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $F8
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $85
	db $E0
	db !set_instrument, $8B
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $E0
	db !return_from_sub

.subseq_22F5:
	db !set_instrument, $29
	db !change_instr_pitch, $F3
	db !fine_tune, $F5
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $E0
	db !set_instrument, $50
	db !change_instr_pitch, $EF
	db !fine_tune, $2E
	db !set_volume_l_and_r, $46, $46
	db !set_adsr, $DE, $90
	db $E0
	db !set_instrument, $2A
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $90
	db $E0
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $F8
	db !set_volume_l_and_r, $32, $32
	db !set_adsr, $AF, $85
	db $E0
	db !default_duration_off
	db !return_from_sub

.subseq_232B:
	db !set_volume_l_and_r, $06, $0E
	db $96, $10
	db $94, $08
	db !set_volume_l_and_r, $05, $02
	db $96, $08
	db !set_volume_l_and_r, $06, $0E
	db $92, $08
	db !set_volume_l_and_r, $05, $02
	db $94, $08
	db !set_volume_l_and_r, $06, $0E
	db $91, $08
	db !set_volume_l_and_r, $05, $02
	db $92, $08
	db !set_volume_l_and_r, $06, $0E
	db $92, $08
	db !set_volume_l_and_r, $05, $02
	db $91, $10
	db $92, $18
	db !set_volume_l_and_r, $06, $0E
	db $92, $08
	db $94, $08
	db !set_volume_l_and_r, $06, $0E
	db $96, $08
	db !set_volume_l_and_r, $05, $02
	db $92, $08
	db !set_volume_l_and_r, $06, $0E
	db $94, $08
	db !set_volume_l_and_r, $05, $02
	db $96, $08
	db !set_volume_l_and_r, $06, $0E
	db $92, $08
	db !set_volume_l_and_r, $05, $02
	db $94, $08
	db !set_volume_l_and_r, $06, $0E
	db $91, $08
	db !set_volume_l_and_r, $05, $02
	db $92, $10
	db $91, $08
	db !set_volume_l_and_r, $06, $0E
	db $99, $10
	db $94, $08
	db !set_volume_l_and_r, $05, $02
	db $99, $08
	db !set_volume_l_and_r, $06, $0E
	db $96, $08
	db !set_volume_l_and_r, $05, $02
	db $94, $08
	db $96, $10
	db !return_from_sub

base off
arch 65816
.end: