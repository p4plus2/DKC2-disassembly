;0D Hot-Head Bop
;2EA050
lava_song_data:
	dw !bgm_loc, $077B
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1A54, .seq_2101, .seq_1C2D, .seq_218A, .seq_1DC4, .seq_1F49, .seq_1BC7, .seq_1D4E
	db $BA, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_1911, .seq_1A18, .seq_197B, .seq_1A2F, .seq_19F9, .seq_1A10, .seq_1934, .seq_1995
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_1625, .seq_16A9, .seq_1794, .seq_17F3, .seq_168E, .seq_18E4, .seq_18B7, .seq_172D
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_1482, .seq_14F7, .seq_1543, .seq_15C1, .seq_14CB, .seq_1601, .seq_1613, .seq_15E1
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_1389, .seq_13D9, .seq_13EF, .seq_1412, .seq_1428, .seq_145A, .seq_143E, .seq_1454
	db $C0, $FF	;music tempo, sound effect tempo

.subseq_1364:
	db $80, $10
	db !return_from_sub

.unreached_1367:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !return_from_sub

.unreached_136E:
	db !set_adsr, $FF, $20
	db !set_instrument, $D4
	db !change_instr_pitch, $09
	db !fine_tune, $DC
	db !return_from_sub

.subseq_1378:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !return_from_sub

.subseq_137F:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_1389:
	db !play_subsequence : dw .subseq_1A46
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $09
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $94, $07
	db $94, $09
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $10
	db $A0, $07
	db $A0, $05
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $94, $05
	db $94, $06
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $17
	db !set_vol_single_val, $1E
	db $A1, $03
	db !set_vol_single_val, $28
	db $A1, $03
	db !set_vol_single_val, $32
	db $A1, $03
	db !set_vol_single_val, $46
	db $A0, $10
	db !end_sequence

.seq_13D9:
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_vol_single_val, $78
	db !set_adsr, $DF, $AF
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13EF:
	db !set_volume_l_and_r, $14, $28
.loop_point_13F2:
	db !play_subsequence : dw .subseq_2173
	db !set_adsr, $8F, $E0
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A2, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db !set_adsr, $8F, $40
	db $AC, $19
	db $80, $07
	db $AC, $10
	db !end_sequence

.seq_1412:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_1428:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_143E:
	db !play_subsequence : dw .subseq_1378
	db !set_volume_l_and_r, $23, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1454:
	db !set_volume_l_and_r, $0F, $07
	db !jump_to_sequence : dw .loop_point_13F2

.seq_145A:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $0A, $1E
	db !end_sequence

.unreached_1462:
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

.seq_1482:
	db !play_subsequence : dw .subseq_1A46
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_14B5
.loop_point_149F:
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $10
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $94, $10
	db !jump_to_sequence : dw .loop_point_149F

.subseq_14B5:
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $08
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $94, $08
	db $94, $08
	db !return_from_sub

.seq_14CB:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !play_subsequence : dw .subseq_1C1A
	db !set_volume_l_and_r, $32, $28
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db $9A, $10
.loop_point_14EA:
	db !set_volume_l_and_r, $32, $28
	db $9A, $08
	db !set_volume_l_and_r, $28, $1E
	db $9A, $08
	db !jump_to_sequence : dw .loop_point_14EA

.seq_14F7:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !echo_off
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_vol_single_val, $78
	db !set_adsr, $DF, $AF
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
.loop_point_151F:
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
	db !jump_to_sequence : dw .loop_point_151F
	db !end_sequence

.seq_1543:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_155F
	db !end_sequence

.subseq_155F:
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

.seq_15C1:
	db !play_subsequence : dw .subseq_137F
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
	db !play_subsequence : dw .subseq_155F
	db !end_sequence

.seq_15E1:
	db !play_subsequence : dw .subseq_137F
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
	db !play_subsequence : dw .subseq_155F
	db !end_sequence

.seq_1601:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1613:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $28, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1625:
	db !play_subsequence : dw .subseq_1A46
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1643
	db !end_sequence

.subseq_1643:
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db $94, $10
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $10
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $96, $09
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $28, $32
	db $A1, $10
	db $A1, $07
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $98, $09
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $28, $32
	db $A1, $07
	db !set_volume_l_and_r, $46, $50
	db $A0, $10
	db !set_volume_l_and_r, $28, $32
	db $A1, $09
	db $A1, $07
	db !return_from_sub

.seq_168E:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !play_subsequence : dw .subseq_1C1A
	db !loop_subsequence, $20 : dw .subseq_1C22
	db !end_sequence

.seq_16A9:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_16C1
	db !end_sequence

.subseq_16C1:
	db !play_subsequence : dw .subseq_16CE
	db !play_subsequence : dw .subseq_170B
	db !play_subsequence : dw .subseq_16CE
	db !play_subsequence : dw .subseq_171C
	db !return_from_sub

.subseq_16CE:
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

.subseq_170B:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_171C:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_172D:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_174A
	db !end_sequence

.subseq_174A:
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $97, $10
	db $94, $10
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $1B, $17
	db $A0, $10
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $96, $09
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $11, $0C
	db $A1, $10
	db $A1, $07
	db !set_adsr, $8F, $E1
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $98, $09
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $11, $0C
	db $A1, $07
	db !set_volume_l_and_r, $1B, $17
	db $A0, $10
	db !set_volume_l_and_r, $11, $0C
	db $A1, $09
	db $A1, $07
	db !return_from_sub

.seq_1794:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !vibrato_with_delay, $04, $02, $17, $0B
	db !set_vol_single_val, $64
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17CE
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_17CE
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17CE
	db !end_sequence

.subseq_17CE:
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

.seq_17F3:
	db !play_subsequence : dw .subseq_137F
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_186E
	db !play_subsequence : dw .subseq_184C
	db !play_subsequence : dw .subseq_1B28
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_181E
	db !end_sequence

.subseq_181E:
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

.subseq_184C:
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
	db $9A, $08
	db $9C, $10
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db $9A, $40
.subseq_186E:
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
	db $9A, $08
	db !set_instrument, $01
	db !change_instr_pitch, $02
	db !fine_tune, $F2
	db $9C, $10
	db !set_instrument, $02
	db !change_instr_pitch, $FE
	db !fine_tune, $18
	db $9D, $10
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db $9D, $08
	db !set_instrument, $03
	db !change_instr_pitch, $FD
	db !fine_tune, $00
	db $9C, $10
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db $9A, $20
	db !return_from_sub

.seq_18B7:
	db !play_subsequence : dw .subseq_137F
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
	db !play_subsequence : dw .subseq_186E
	db !play_subsequence : dw .subseq_184C
	db !play_subsequence : dw .subseq_1B28
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_181E
	db !end_sequence

.seq_18E4:
	db !play_subsequence : dw .subseq_137F
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
	db !play_subsequence : dw .subseq_186E
	db !play_subsequence : dw .subseq_184C
	db !play_subsequence : dw .subseq_1B28
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_181E
	db !end_sequence

.seq_1911:
	db !play_subsequence : dw .subseq_1A46
	db !play_subsequence : dw .subseq_1928
	db $80, $10
	db $8B, $30
	db $8B, $10
	db $8D, $08
	db $8F, $10
	db $90, $20
	db $84, $48
	db $84, $10
	db !end_sequence

.subseq_1928:
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_vol_single_val, $78
	db !set_adsr, $DF, $AF
	db !return_from_sub

.seq_1934:
	db !set_volume_l_and_r, $14, $1E
.loop_point_1937:
	db !play_subsequence : dw .subseq_1B28
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
	db $9A, $04
	db $97, $04
	db $9A, $04
	db $97, $04
	db $9A, $04
	db $97, $04
	db $9A, $04
	db $97, $04
	db $9A, $04
	db $97, $04
	db $9A, $04
	db $97, $04
	db $9A, $04
	db $97, $04
	db $9A, $04
	db $97, $04
	db $95, $04
	db $93, $04
	db $90, $04
	db $8E, $04
	db $8B, $04
	db !end_sequence

.seq_197B:
	db $80, $10
	db !play_subsequence : dw .subseq_1C1A
	db !loop_subsequence, $08 : dw .subseq_198A
	db !set_volume_l_and_r, $32, $28
	db $9A, $30
	db !end_sequence

.subseq_198A:
	db !set_volume_l_and_r, $32, $28
	db $9A, $10
	db !set_volume_l_and_r, $28, $1E
	db $9A, $08
	db !return_from_sub

.seq_1995:
	db $80, $10
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $10
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $10
	db !set_volume_l_and_r, $28, $32
	db $A1, $08
	db $A1, $08
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $10
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $18
	db !set_volume_l_and_r, $28, $32
	db $A1, $04
	db $A1, $04
	db !set_volume_l_and_r, $46, $50
	db $A0, $10
	db !set_volume_l_and_r, $14, $1E
	db $A1, $08
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $3C
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $14, $1E
	db $A1, $04
	db !set_volume_l_and_r, $28, $32
	db $A1, $04
	db $A1, $04
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $10
	db !end_sequence

.seq_19F9:
	db $80, $10
	db !play_subsequence : dw .subseq_2173
	db !set_volume_l_and_r, $14, $0F
	db $9E, $18
	db $9E, $18
	db $9E, $10
	db $9E, $18
	db $A0, $20
	db $A0, $48
	db $A0, $10
	db !end_sequence

.seq_1A10:
	db $80, $0E
	db !set_volume_l_and_r, $0B, $06
	db !jump_to_sequence : dw .loop_point_1937

.seq_1A18:
	db $80, $10
	db !play_subsequence : dw .subseq_2173
	db !set_volume_l_and_r, $14, $0F
	db $9B, $18
	db $9B, $18
	db $9B, $10
	db $9B, $18
	db $9C, $20
	db $9A, $48
	db $9A, $10
	db !end_sequence

.seq_1A2F:
	db $80, $10
	db !play_subsequence : dw .subseq_2173
	db !set_volume_l_and_r, $14, $0F
	db $95, $18
	db $95, $18
	db $95, $10
	db $95, $18
	db $97, $20
	db $97, $48
	db $97, $10
	db !end_sequence

.subseq_1A46:
	db !set_echo, $3C, $2C, $2C
	db !set_fir, $77, $08, $08, $08, $00, $00, $00, $00
	db !return_from_sub

.seq_1A54:
	db !echo_delay, $06
	db !play_subsequence : dw .subseq_1364
	db !play_subsequence : dw .subseq_1A46
	db !change_instr_pitch, $00
.loop_point_1A5E:
	db $80, $80
	db $80, $80
	db $80, $B0
	db !loop_subsequence, $01 : dw .subseq_1B33
	db !loop_subsequence, $06 : dw .subseq_1B76
	db !loop_subsequence, $02 : dw .subseq_1B76
	db $80, $80
	db $80, $80
	db $80, $B0
	db !loop_subsequence, $01 : dw .subseq_1B33
	db !loop_subsequence, $03 : dw .subseq_1B76
	db !loop_subsequence, $01 : dw .subseq_1A8D
	db !loop_subsequence, $07 : dw .subseq_1B76
	db !loop_subsequence, $01 : dw .subseq_1A8D
	db !jump_to_sequence : dw .loop_point_1A5E

.subseq_1A8D:
	db !play_subsequence : dw .subseq_1ADC
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $19
	db $94, $07
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $17
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $DE, $B4
	db $A1, $03
	db $A1, $03
	db $A1, $03
	db !set_volume_l_and_r, $46, $50
	db $A0, $09
	db $A0, $07
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $07
	db !set_instrument, $A0
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $DE, $B4
	db $A1, $03
	db $A1, $03
	db $A1, $03
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $09
	db $A0, $07
	db $A1, $10
	db !return_from_sub

.subseq_1ADC:
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $19
	db $94, $07
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $19
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $DE, $B4
	db $A1, $10
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $07
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $10
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $09
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $10
	db !set_instrument, $A0
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $DE, $B4
	db $A1, $07
	db !return_from_sub

.subseq_1B28:
	db !echo_on
	db !set_instrument, $8E
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_adsr, $BF, $8F
	db !return_from_sub

.subseq_1B33:
	db !set_instrument, $A0
	db !set_adsr, $DE, $B4
	db !set_volume_l_and_r, $28, $32
	db $A0, $05
	db !set_volume_l_and_r, $32, $3C
	db $A0, $05
	db !set_volume_l_and_r, $3C, $46
	db $A0, $06
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $09
	db $A0, $0E
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $03
	db !set_instrument, $A0
	db !set_adsr, $DE, $B4
	db !set_volume_l_and_r, $28, $32
	db $A0, $03
	db !set_volume_l_and_r, $32, $3C
	db $A0, $03
	db !set_volume_l_and_r, $46, $50
	db !set_adsr, $DF, $B4
	db $A0, $09
	db $A0, $07
	db $A1, $10
	db !return_from_sub

.subseq_1B76:
	db !play_subsequence : dw .subseq_1ADC
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $19
	db $94, $07
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $19
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $DE, $B4
	db $A1, $10
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $07
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $10
	db !set_instrument, $A0
	db !set_adsr, $DF, $B4
	db !set_volume_l_and_r, $46, $50
	db $A0, $09
	db !set_adsr, $8F, $E1
	db !set_vol_single_val, $50
	db !set_instrument, $00
	db $94, $07
	db !set_instrument, $A0
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $DF, $B4
	db $A1, $09
	db $A1, $07
	db !return_from_sub

.seq_1BC7:
	db !play_subsequence : dw .subseq_1364
.loop_point_1BCA:
	db !play_subsequence : dw .subseq_1C1A
	db !loop_subsequence, $40 : dw .subseq_1C22
	db !loop_subsequence, $10 : dw .subseq_1C22
	db !play_subsequence : dw .subseq_1C13
	db !set_vol_single_val, $50
	db !set_adsr, $88, $E0
	db $8A, $FF
	db $86, $81
	db $88, $80
	db $8A, $FF
	db $86, $81
	db $88, $80
	db !play_subsequence : dw .subseq_1C1A
	db !loop_subsequence, $10 : dw .subseq_1C22
	db !loop_subsequence, $20 : dw .subseq_1C22
	db !play_subsequence : dw .subseq_1C13
	db !echo_on
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8C, $E0
	db !change_instr_pitch_rel, $0C
	db $9D, $FF
	db $80, $01
	db $99, $FF
	db $80, $01
	db $96, $FF
	db $80, $01
	db $9B, $FF
	db $80, $01
	db !jump_to_sequence : dw .loop_point_1BCA

.subseq_1C13:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !return_from_sub

.subseq_1C1A:
	db !change_instr_pitch, $00
	db !set_instrument, $8D
	db !set_adsr, $DF, $91
	db !return_from_sub

.subseq_1C22:
	db !set_volume_l_and_r, $32, $28
	db $9A, $10
	db !set_volume_l_and_r, $28, $1E
	db $9A, $10
	db !return_from_sub

.seq_1C2D:
	db !play_subsequence : dw .subseq_1364
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_adsr, $CF, $F0
.loop_point_1C39:
	db !loop_subsequence, $08 : dw .subseq_1D1B
	db !play_subsequence : dw .subseq_1CEE
	db !play_subsequence : dw .subseq_1D1B
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1CC1
	db !play_subsequence : dw .subseq_1D1B
	db !play_subsequence : dw .subseq_1CC1
	db !play_subsequence : dw .subseq_1D1B
	db !play_subsequence : dw .subseq_1CB5
	db !play_subsequence : dw .subseq_1C5C
	db !jump_to_sequence : dw .loop_point_1C39

.subseq_1C5C:
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1D27
	db $8A, $10
	db $89, $10
	db $88, $10
	db !set_variable_note_1, $86
	db !play_subsequence : dw .subseq_1D27
	db $86, $10
	db $85, $10
	db $84, $10
	db !set_variable_note_1, $83
	db !play_subsequence : dw .subseq_1D27
	db $83, $10
	db $85, $10
	db $86, $10
	db !set_variable_note_1, $88
	db !play_subsequence : dw .subseq_1D27
	db $88, $10
	db $88, $10
	db $89, $10
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_1D27
	db $8A, $10
	db $89, $10
	db $88, $10
	db !set_variable_note_1, $86
	db !play_subsequence : dw .subseq_1D27
	db $86, $10
	db $85, $10
	db $84, $10
	db !set_variable_note_1, $83
	db !play_subsequence : dw .subseq_1D27
	db $83, $10
	db $84, $10
	db $85, $10
	db !set_variable_note_1, $85
	db !play_subsequence : dw .subseq_1D27
	db $85, $10
	db $88, $10
	db $89, $10
	db !return_from_sub

.subseq_1CB5:
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_1D27
	db $8A, $10
	db $8B, $10
	db $8C, $10
	db !return_from_sub

.subseq_1CC1:
	db !set_vol_single_val, $78
	db $86, $09
	db $86, $07
	db $80, $20
	db $86, $09
	db $86, $07
	db $80, $39
	db !set_vol_single_val, $3C
	db $88, $07
	db !set_vol_single_val, $78
	db $88, $09
	db $88, $07
	db $80, $19
	db !set_vol_single_val, $3C
	db $88, $07
	db !set_vol_single_val, $78
	db $88, $09
	db $88, $07
	db $80, $10
	db $85, $10
	db $88, $10
	db $89, $10
	db !return_from_sub

.subseq_1CEE:
	db !set_vol_single_val, $78
	db $86, $09
	db $86, $07
	db $80, $20
	db $86, $09
	db $86, $07
	db $80, $39
	db !set_vol_single_val, $3C
	db $83, $07
	db !set_vol_single_val, $78
	db $83, $09
	db $83, $07
	db $80, $19
	db !set_vol_single_val, $3C
	db $83, $07
	db !set_vol_single_val, $78
	db $83, $09
	db $83, $07
	db $80, $10
	db $85, $10
	db $88, $10
	db $89, $10
	db !return_from_sub

.subseq_1D1B:
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_1D27
	db $85, $10
	db $88, $10
	db $89, $10
	db !return_from_sub

.subseq_1D27:
	db !set_vol_single_val, $78
	db $E0, $09
	db $E0, $07
	db $80, $20
	db $E0, $09
	db $E0, $07
	db $80, $39
	db !set_vol_single_val, $3C
	db $E0, $07
	db !set_vol_single_val, $78
	db $E0, $09
	db $E0, $07
	db $80, $19
	db !set_vol_single_val, $3C
	db $E0, $07
	db !set_vol_single_val, $78
	db $E0, $09
	db $E0, $07
	db $80, $10
	db !return_from_sub

.seq_1D4E:
	db !play_subsequence : dw .subseq_1364
.loop_point_1D51:
	db !play_subsequence : dw .subseq_1D99
	db !loop_subsequence, $10 : dw .subseq_1DA3
	db !set_adsr, $FF, $E0
	db !loop_subsequence, $02 : dw .subseq_1EE2
	db !play_subsequence : dw .subseq_1D99
	db !loop_subsequence, $08 : dw .subseq_1DA3
	db !play_subsequence : dw .subseq_1C1A
	db !loop_subsequence, $10 : dw .subseq_1C22
	db !long_duration_on
	db $80, $06, $00
	db !long_duration_off
	db !play_subsequence : dw .subseq_1C13
	db !echo_on
	db !set_volume_l_and_r, $0A, $14
	db !set_adsr, $8C, $E0
	db !change_instr_pitch_rel, $0C
	db $99, $FF
	db $80, $01
	db $96, $FF
	db $80, $01
	db $92, $FF
	db $80, $01
	db $95, $FF
	db $80, $01
	db !jump_to_sequence : dw .loop_point_1D51

.subseq_1D91:
	db !set_adsr, $8E, $EE
	db !change_instr_pitch, $11
	db !fine_tune, $E8
	db !return_from_sub

.subseq_1D99:
	db !echo_off
	db !set_instrument, $19
	db !set_volume_l_and_r, $21, $30
	db !set_adsr, $8E, $F2
	db !return_from_sub

.subseq_1DA3:
	db !change_instr_pitch, $18
	db $84, $09
	db !change_instr_pitch, $F9
	db $84, $07
	db !change_instr_pitch, $07
	db $84, $09
	db !change_instr_pitch, $0C
	db $84, $07
	db !change_instr_pitch, $F4
	db $84, $09
	db !change_instr_pitch, $13
	db $84, $07
	db !change_instr_pitch, $05
	db $84, $09
	db !change_instr_pitch, $07
	db $84, $07
	db !return_from_sub

.seq_1DC4:
	db !play_subsequence : dw .subseq_1364
.loop_point_1DC7:
	db !echo_off
	db !set_adsr, $FF, $E0
	db !loop_subsequence, $02 : dw .subseq_1EE2
	db !play_subsequence : dw .subseq_1E8D
	db !set_volume_l_and_r, $0A, $14
	db !loop_subsequence, $01 : dw .subseq_1E97
	db !play_subsequence : dw .subseq_1B28
	db !loop_subsequence, $02 : dw .subseq_20C2
	db !play_subsequence : dw .subseq_1D91
	db !loop_subsequence, $02 : dw .subseq_2007
	db !echo_off
	db !set_adsr, $FF, $E0
	db !loop_subsequence, $01 : dw .subseq_1F01
	db !play_subsequence : dw .subseq_1B28
	db !set_volume_l_and_r, $0C, $1B
	db !echo_on
	db !play_subsequence : dw .subseq_1E4C
	db !set_volume_l_and_r, $09, $11
	db !play_subsequence : dw .subseq_2164
	db !play_subsequence : dw .subseq_1E05
	db !jump_to_sequence : dw .loop_point_1DC7

.subseq_1E05:
	db $80, $80
	db $80, $10
	db $9D, $10
	db $9E, $10
	db $A0, $10
	db $A0, $18
	db $9E, $18
	db $9D, $10
	db $9D, $60
	db $80, $20
	db $80, $10
	db $9D, $10
	db $9E, $10
	db $A0, $10
	db $A0, $18
	db $9E, $18
	db $9D, $10
	db $9D, $20
	db $99, $10
	db $99, $50
	db $80, $10
	db $9D, $10
	db $9E, $10
	db $A0, $10
	db $A0, $18
	db $9E, $18
	db $9D, $10
	db $9B, $60
	db $80, $30
	db $9B, $10
	db $9B, $10
	db $9D, $10
	db $9E, $10
	db $9D, $10
	db $9B, $20
	db !return_from_sub

.subseq_1E4C:
	db $80, $80
	db $80, $10
	db $9D, $10
	db $9E, $10
	db $A0, $10
	db $A5, $18
	db $A0, $18
	db $9E, $10
	db $9D, $20
	db $99, $10
	db $99, $50
	db $80, $10
	db $9D, $10
	db $9E, $10
	db $A0, $10
	db $A5, $18
	db $A0, $18
	db $9E, $10
	db $9D, $20
	db $9E, $10
	db $9D, $20
	db $99, $30
	db $80, $10
	db $9D, $10
	db $9E, $10
	db $A0, $10
	db $A5, $18
	db $A5, $18
	db $A7, $10
	db $A7, $40
	db $80, $40
	db $80, $80
	db !return_from_sub

.subseq_1E8D:
	db !set_instrument, $AF
	db !change_instr_pitch, $FA
	db !fine_tune, $F2
	db !set_adsr, $8E, $C2
	db !return_from_sub

.subseq_1E97:
	db $80, $10
	db $99, $10
	db $98, $10
	db $99, $09
	db $98, $10
	db $96, $37
	db $80, $10
	db $99, $10
	db $98, $10
	db $99, $09
	db $9B, $17
	db $99, $10
	db $98, $10
	db $99, $10
	db $98, $10
	db $96, $10
	db $96, $10
	db $94, $09
	db $96, $57
	db $80, $70
	db $80, $10
	db $99, $10
	db $98, $10
	db $99, $09
	db $98, $10
	db $96, $27
	db $96, $10
	db $9B, $20
	db $99, $20
	db $98, $20
	db $99, $20
	db $98, $10
	db $96, $10
	db $96, $10
	db $94, $09
	db $96, $57
	db $80, $70
	db !return_from_sub

.subseq_1EE2:
	db !change_instr_pitch, $00
	db !set_instrument, $A9
	db !set_volume_l_and_r, $50, $28
	db $85, $30
	db !set_volume_l_and_r, $28, $50
	db $8A, $20
	db $8A, $20
	db !set_volume_l_and_r, $3C, $46
	db $88, $30
	db !set_volume_l_and_r, $64, $32
	db $82, $48
	db !set_volume_l_and_r, $0A, $50
	db $91, $18
.subseq_1F01:
	db !change_instr_pitch, $00
	db !set_instrument, $A9
	db $92, $18
	db $93, $20
	db !set_instrument, $AA
	db !set_volume_l_and_r, $5A, $1E
	db $85, $20
	db !set_instrument, $A9
	db !set_volume_l_and_r, $50, $28
	db $88, $30
	db !set_instrument, $AA
	db !set_volume_l_and_r, $1E, $46
	db $8F, $20
	db !set_instrument, $A9
	db !set_volume_l_and_r, $50, $28
	db $84, $20
	db $86, $20
	db !set_volume_l_and_r, $50, $28
	db $85, $20
	db $83, $20
	db !set_volume_l_and_r, $32, $64
	db $82, $50
	db !set_instrument, $AA
	db !set_volume_l_and_r, $1E, $46
	db $8A, $20
	db !set_instrument, $A9
	db !set_volume_l_and_r, $0A, $6E
	db $81, $30
	db !set_volume_l_and_r, $50, $28
	db $90, $18
	db $8F, $20
	db !return_from_sub

.seq_1F49:
	db !play_subsequence : dw .subseq_1364
	db $80, $14
.loop_point_1F4E:
	db !echo_on
	db !set_adsr, $FF, $40
	db !loop_subsequence, $02 : dw .subseq_1EE2
	db !play_subsequence : dw .subseq_1E8D
	db !set_volume_l_and_r, $0B, $05
	db !loop_subsequence, $01 : dw .subseq_1E97
	db !play_subsequence : dw .subseq_1B28
	db !loop_subsequence, $02 : dw .subseq_2083
	db !play_subsequence : dw .subseq_1D91
	db !loop_subsequence, $02 : dw .subseq_1F8B
	db !set_adsr, $FF, $40
	db !loop_subsequence, $01 : dw .subseq_1F01
	db !play_subsequence : dw .subseq_1B28
	db !set_volume_l_and_r, $0B, $05
	db !echo_on
	db !play_subsequence : dw .subseq_1E4C
	db !play_subsequence : dw .subseq_2164
	db !set_volume_l_and_r, $08, $03
	db !play_subsequence : dw .subseq_1E05
	db !jump_to_sequence : dw .loop_point_1F4E

.subseq_1F8B:
	db !set_default_duration, $08
	db !set_volume_l_and_r, $09, $04
	db !set_instrument, $3D
	db $9D
	db !set_instrument, $3F
	db $99
	db !set_instrument, $41
	db $96
	db !set_instrument, $43
	db $9D
	db !set_instrument, $45
	db $99
	db !set_instrument, $47
	db $96
	db !set_volume_l_and_r, $06, $03
	db !set_instrument, $45
	db $9D
	db !set_instrument, $47
	db $99
	db !set_instrument, $48
	db $96
	db !set_volume_l_and_r, $05, $02
	db !set_instrument, $47
	db $9D
	db !set_instrument, $48
	db $99
	db !set_instrument, $49
	db $96
	db !set_volume_l_and_r, $09, $04
	db !set_instrument, $47
	db $9E
	db !set_instrument, $48
	db $99
	db !set_instrument, $49
	db $96
	db !set_instrument, $4A
	db $96
	db !set_instrument, $4B
	db $A0
	db !set_instrument, $4C
	db $9B
	db !set_instrument, $4D
	db $98
	db !set_volume_l_and_r, $06, $03
	db !set_instrument, $4C
	db $A0
	db !set_instrument, $4D
	db $9B
	db !set_instrument, $4E
	db $98
	db !set_volume_l_and_r, $05, $02
	db !set_instrument, $4B
	db $A0
	db !set_instrument, $4C
	db $9B
	db !set_instrument, $4D
	db $98
	db !set_volume_l_and_r, $03, $01
	db !set_instrument, $4A
	db $A0
	db !set_instrument, $4B
	db $9B
	db !set_instrument, $4C
	db $98
	db !set_volume_l_and_r, $02, $00
	db !set_instrument, $49
	db $A0
	db !set_instrument, $4A
	db $9B
	db !set_instrument, $4B
	db $A0
	db !set_instrument, $4C
	db $9B
	db !default_duration_off
	db !return_from_sub

.subseq_2007:
	db !set_volume_l_and_r, $0A, $14
	db !set_default_duration, $08
	db !set_instrument, $3D
	db $9D
	db !set_instrument, $3F
	db $99
	db !set_instrument, $41
	db $96
	db !set_instrument, $43
	db $9D
	db !set_instrument, $45
	db $99
	db !set_instrument, $47
	db $96
	db !set_volume_l_and_r, $06, $0A
	db !set_instrument, $45
	db $9D
	db !set_instrument, $47
	db $99
	db !set_instrument, $48
	db $96
	db !set_volume_l_and_r, $04, $08
	db !set_instrument, $47
	db $9D
	db !set_instrument, $48
	db $99
	db !set_instrument, $49
	db $96
	db !set_volume_l_and_r, $0A, $14
	db !set_instrument, $47
	db $9E
	db !set_instrument, $48
	db $99
	db !set_instrument, $49
	db $96
	db !set_instrument, $4A
	db $96
	db !set_instrument, $4B
	db $A0
	db !set_instrument, $4C
	db $9B
	db !set_instrument, $4D
	db $98
	db !set_volume_l_and_r, $06, $0A
	db !set_instrument, $4C
	db $A0
	db !set_instrument, $4D
	db $9B
	db !set_instrument, $4E
	db $98
	db !set_volume_l_and_r, $04, $08
	db !set_instrument, $4B
	db $A0
	db !set_instrument, $4C
	db $9B
	db !set_instrument, $4D
	db $98
	db !set_volume_l_and_r, $02, $06
	db !set_instrument, $4A
	db $A0
	db !set_instrument, $4B
	db $9B
	db !set_instrument, $4C
	db $98
	db !set_volume_l_and_r, $01, $03
	db !set_instrument, $49
	db $A0
	db !set_instrument, $4A
	db $9B
	db !set_instrument, $4B
	db $A0
	db !set_instrument, $4C
	db $9B
	db !default_duration_off
	db !return_from_sub

.subseq_2083:
	db !set_default_duration, $08
	db !set_volume_l_and_r, $09, $04
	db $9D
	db $99
	db $96
	db !set_volume_l_and_r, $06, $03
	db $9D
	db $99
	db $96
	db !set_volume_l_and_r, $05, $02
	db $9D
	db $99
	db $96
	db !set_volume_l_and_r, $01, $00
	db $9D
	db $99
	db $96
	db !set_volume_l_and_r, $09, $04
	db $9E
	db $99
	db $96
	db $9E
	db $A0
	db $9B
	db $98
	db !set_volume_l_and_r, $06, $03
	db $A0
	db $9B
	db $98
	db !set_volume_l_and_r, $05, $02
	db $A0
	db $9B
	db $98
	db !set_volume_l_and_r, $03, $01
	db $A0
	db $9B
	db $98
	db !set_volume_l_and_r, $01, $00
	db $A0
	db $9B
	db $A0
	db $9B
	db !default_duration_off
	db !return_from_sub

.subseq_20C2:
	db !set_default_duration, $08
	db !set_volume_l_and_r, $0A, $14
	db $9D
	db $99
	db $96
	db !set_volume_l_and_r, $06, $0A
	db $9D
	db $99
	db $96
	db !set_volume_l_and_r, $04, $08
	db $9D
	db $99
	db $96
	db !set_volume_l_and_r, $02, $06
	db $9D
	db $99
	db $96
	db !set_volume_l_and_r, $0A, $14
	db $9E
	db $99
	db $96
	db $9E
	db $A0
	db $9B
	db $98
	db !set_volume_l_and_r, $06, $0A
	db $A0
	db $9B
	db $98
	db !set_volume_l_and_r, $04, $08
	db $A0
	db $9B
	db $98
	db !set_volume_l_and_r, $02, $06
	db $A0
	db $9B
	db $98
	db !set_volume_l_and_r, $01, $03
	db $A0
	db $9B
	db $A0
	db $9B
	db !default_duration_off
	db !return_from_sub

.seq_2101:
	db !play_subsequence : dw .subseq_1364
.loop_point_2104:
	db !set_volume_l_and_r, $0E, $04
	db !play_subsequence : dw .subseq_2148
	db !play_subsequence : dw .subseq_2173
	db !loop_subsequence, $08 : dw .subseq_2181
	db !loop_subsequence, $04 : dw .subseq_2181
	db !set_volume_l_and_r, $0E, $04
	db !play_subsequence : dw .subseq_2148
	db !long_duration_on
	db $80, $02, $00
	db !long_duration_off
	db !play_subsequence : dw .subseq_2173
	db !loop_subsequence, $06 : dw .subseq_213F
	db !loop_subsequence, $02 : dw .subseq_2136
	db !loop_subsequence, $06 : dw .subseq_213F
	db !loop_subsequence, $02 : dw .subseq_2136
	db !jump_to_sequence : dw .loop_point_2104

.subseq_2136:
	db $9B, $20
	db $9B, $20
	db $9B, $20
	db $9B, $20
	db !return_from_sub

.subseq_213F:
	db $9D, $20
	db $9D, $20
	db $9D, $20
	db $9D, $20
	db !return_from_sub

.subseq_2148:
	db !echo_on
	db !set_instrument, $D4
	db !change_instr_pitch, $09
	db !fine_tune, $DC
	db !set_adsr, $81, $C4
	db !vibrato_with_delay, $05, $02, $11, $08
	db !long_duration_on
	db $A5, $01, $00
	db $A4, $01, $00
	db $A9, $02, $00
	db !long_duration_off
	db !vibrato_off
	db !return_from_sub

.subseq_2164:
	db !set_instrument, $21
	db !change_instr_pitch, $18
	db !fine_tune, $AB
	db !set_adsr, $89, $CE
	db !vibrato_with_delay, $06, $01, $0C, $16
	db !return_from_sub

.subseq_2173:
	db !echo_on
	db !set_instrument, $D4
	db !change_instr_pitch, $FD
	db !fine_tune, $DC
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8F, $EB
	db !return_from_sub

.subseq_2181:
	db $96, $20
	db $9B, $20
	db $9B, $20
	db $98, $20
	db !return_from_sub

.seq_218A:
	db !play_subsequence : dw .subseq_1364
	db $80, $10
.loop_point_218F:
	db !set_volume_l_and_r, $02, $06
	db !play_subsequence : dw .subseq_2148
	db !play_subsequence : dw .subseq_2173
	db !loop_subsequence, $08 : dw .subseq_21ED
	db !loop_subsequence, $04 : dw .subseq_21ED
	db !set_volume_l_and_r, $02, $06
	db !play_subsequence : dw .subseq_2148
	db !long_duration_on
	db $80, $02, $00
	db !long_duration_off
	db !play_subsequence : dw .subseq_2173
	db !loop_subsequence, $02 : dw .subseq_21DB
	db !loop_subsequence, $04 : dw .subseq_21E4
	db !loop_subsequence, $02 : dw .subseq_21D2
	db !loop_subsequence, $02 : dw .subseq_21DB
	db !loop_subsequence, $04 : dw .subseq_21E4
	db !loop_subsequence, $02 : dw .subseq_21C9
	db !jump_to_sequence : dw .loop_point_218F

.subseq_21C9:
	db $95, $20
	db $9D, $20
	db $98, $20
	db $98, $20
	db !return_from_sub

.subseq_21D2:
	db $98, $20
	db $9D, $20
	db $94, $20
	db $98, $20
	db !return_from_sub

.subseq_21DB:
	db $99, $20
	db $9E, $20
	db $94, $20
	db $99, $20
	db !return_from_sub

.subseq_21E4:
	db $99, $20
	db $9E, $20
	db $96, $20
	db $99, $20
	db !return_from_sub

.subseq_21ED:
	db $9D, $20
	db $A0, $20
	db $9D, $20
	db $99, $20
	db !return_from_sub

base off
arch 65816
.end: