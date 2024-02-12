;1A In a Snow-Bound Land
;329F81
ice_song_data:
	dw !bgm_loc, $0609
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_19C8, .seq_1A6E, .seq_1B0E, .seq_1DA4, .seq_1CD5, .seq_1E96, .seq_1C34, .seq_1E17
	db $B2, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_18D9, .seq_1916, .seq_1924, .seq_1956, .seq_1948, .seq_199D, .seq_193A, .seq_195F
	db $B2, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_1600, .seq_1688, .seq_1762, .seq_17BC, .seq_1658, .seq_18AD, .seq_1880, .seq_170B
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_1457, .seq_14BF, .seq_150A, .seq_1587, .seq_1495, .seq_15C5, .seq_15D6, .seq_15A6
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_1364, .seq_13A7, .seq_13BE, .seq_13E4, .seq_13FA, .seq_142E, .seq_1410, .seq_1425
	db $C0, $FF	;music tempo, sound effect tempo

.seq_1364:
	db !play_subsequence : dw .subseq_19BA
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

.seq_13BE:
	db !set_volume_l_and_r, $14, $28
.loop_point_13C1:
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0B, $1C
	db !set_adsr, $AE, $AE
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

.seq_13E4:
	db !play_subsequence : dw .subseq_15F6
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
	db !play_subsequence : dw .subseq_15F6
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_1410:
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1425:
	db $80, $0A
	db !set_volume_l_and_r, $11, $08
	db !jump_to_sequence : dw .loop_point_13C1
	db !end_sequence

.seq_142E:
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

.seq_1457:
	db !play_subsequence : dw .subseq_19BA
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_1484
.loop_point_1473:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_1473

.subseq_1484:
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

.seq_1495:
	db !play_subsequence : dw .subseq_15F6
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
.loop_point_14B8:
	db $99, $08
	db $99, $08
	db !jump_to_sequence : dw .loop_point_14B8

.seq_14BF:
	db !play_subsequence : dw .subseq_15F6
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
.loop_point_14E6:
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
	db !jump_to_sequence : dw .loop_point_14E6
	db !end_sequence

.seq_150A:
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1525
	db !end_sequence

.subseq_1525:
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

.seq_1587:
	db !play_subsequence : dw .subseq_15F6
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
	db !play_subsequence : dw .subseq_1525
	db !end_sequence

.seq_15A6:
	db !play_subsequence : dw .subseq_15F6
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
	db !play_subsequence : dw .subseq_1525
	db !end_sequence

.seq_15C5:
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15D6:
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.subseq_15E7:
	db !set_instrument, $AF
	db !change_instr_pitch, $FA
	db !fine_tune, $F2
	db !set_adsr, $9E, $CA
	db !vibrato_with_delay, $02, $03, $07, $0B
	db !return_from_sub

.subseq_15F6:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_1600:
	db !play_subsequence : dw .subseq_19BA
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_161D
	db !end_sequence

.subseq_161D:
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

.seq_1658:
	db !play_subsequence : dw .subseq_15F6
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
	db !loop_subsequence, $0C : dw .subseq_1679
	db !default_duration_off
	db !end_sequence

.subseq_1679:
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

.seq_1688:
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_169F
	db !end_sequence

.subseq_169F:
	db !play_subsequence : dw .subseq_16AC
	db !play_subsequence : dw .subseq_16E9
	db !play_subsequence : dw .subseq_16AC
	db !play_subsequence : dw .subseq_16FA
	db !return_from_sub

.subseq_16AC:
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

.subseq_16E9:
	db !set_instrument, $08
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_16FA:
	db !set_instrument, $06
	db !set_vol_single_val, $1E
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $26
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_170B:
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1727
	db !end_sequence

.subseq_1727:
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

.seq_1762:
	db !play_subsequence : dw .subseq_15F6
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
	db !loop_subsequence, $02 : dw .subseq_1797
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_1797
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1797
	db !end_sequence

.subseq_1797:
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

.seq_17BC:
	db !play_subsequence : dw .subseq_15F6
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1837
	db !play_subsequence : dw .subseq_1815
	db !echo_on
	db !play_subsequence : dw .subseq_15E7
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_17E7
	db !end_sequence

.subseq_17E7:
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

.subseq_1815:
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
.subseq_1837:
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

.seq_1880:
	db !play_subsequence : dw .subseq_15F6
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
	db !play_subsequence : dw .subseq_1837
	db !play_subsequence : dw .subseq_1815
	db !echo_on
	db !play_subsequence : dw .subseq_15E7
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_17E7
	db !end_sequence

.seq_18AD:
	db !play_subsequence : dw .subseq_15F6
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
	db !play_subsequence : dw .subseq_1837
	db !play_subsequence : dw .subseq_1815
	db !play_subsequence : dw .subseq_15E7
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_17E7
	db !end_sequence

.seq_18D9:
	db !play_subsequence : dw .subseq_19BA
	db !set_volume_l_and_r, $3C, $14
.loop_point_18DF:
	db !set_instrument, $C0
	db !change_instr_pitch, $FC
	db !fine_tune, $18
	db !vibrato_with_delay, $04, $03, $11, $08
	db !set_adsr, $8B, $EE
	db !echo_on
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
	db $97, $08
	db $99, $10
	db $9A, $40
	db !end_sequence

.subseq_1909:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $0B, $21
	db !set_adsr, $8B, $EB
	db !return_from_sub

.seq_1916:
	db !loop_subsequence, $01 : dw .subseq_1909
	db !echo_on
	db $80, $10
	db $A1, $58
	db $A0, $30
	db $A0, $40
	db !end_sequence

.seq_1924:
	db !set_instrument, $12
	db !set_vol_single_val, $64
	db !change_instr_pitch, $17
	db !fine_tune, $04
	db !set_adsr, $8F, $8E
	db $80, $10
	db $8B, $30
	db $8B, $28
	db $90, $30
	db $90, $40
	db !end_sequence

.seq_193A:
	db !loop_subsequence, $01 : dw .subseq_1909
	db !echo_on
	db $80, $10
	db $9E, $58
	db $9C, $30
	db $9C, $40
	db !end_sequence

.seq_1948:
	db !loop_subsequence, $01 : dw .subseq_1909
	db !echo_on
	db $80, $10
	db $9B, $58
	db $97, $30
	db $9A, $40
	db !end_sequence

.seq_1956:
	db $80, $0E
	db !set_volume_l_and_r, $0A, $14
	db !jump_to_sequence : dw .loop_point_18DF
	db !end_sequence

.seq_195F:
	db !set_instrument, $8B
	db !set_adsr, $FF, $35
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db !set_volume_l_and_r, $32, $1E
	db $80, $10
	db $80, $10
	db $A1, $08
	db $A1, $08
	db $A1, $08
	db $A1, $10
	db $A1, $10
	db $A1, $10
	db $A0, $18
	db $A0, $08
	db !echo_on
	db $A0, $08
	db $A0, $08
	db $A0, $08
	db $A0, $10
	db !set_volume_l_and_r, $0F, $19
	db $A0, $10
	db !set_volume_l_and_r, $0C, $08
	db $A0, $10
	db !set_volume_l_and_r, $04, $06
	db $A0, $10
	db !set_volume_l_and_r, $03, $02
	db $A0, $10
	db !end_sequence

.seq_199D:
	db !set_instrument, $AF
	db !change_instr_pitch, $12
	db !fine_tune, $F2
	db !vibrato_with_delay, $06, $02, $11, $0B
	db !set_adsr, $80, $E5
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $80, $F3
	db !echo_on
	db $A1, $70
	db $A0, $70
	db !end_sequence

.subseq_19B7:
	db $80, $10
	db !return_from_sub

.subseq_19BA:
	db !set_echo, $30, $21, $21
	db !set_fir, $50, $BF, $DB, $E0, $E0, $0A, $C8, $C8
	db !return_from_sub

.seq_19C8:
	db !echo_delay, $06
	db !loop_subsequence, $01 : dw .subseq_19B7
	db !set_master_volume_indirect, $52
	db !play_subsequence : dw .subseq_19BA
	db !set_instrument, $12
	db !set_volume_l_and_r, $5A, $5A
	db !change_instr_pitch, $0B
	db !fine_tune, $04
.loop_point_19DC:
	db !set_adsr, $AE, $A8
	db !loop_subsequence, $03 : dw .subseq_1A5F
	db !set_adsr, $AE, $AE
	db !loop_subsequence, $01 : dw .subseq_19EE
	db !jump_to_sequence : dw .loop_point_19DC
	db !end_sequence

.subseq_19EE:
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $90, $20
	db $90, $20
	db $90, $20
	db $90, $20
	db $90, $20
	db $90, $20
	db $90, $20
	db $90, $20
	db $92, $20
	db $92, $20
	db $92, $20
	db $92, $20
	db $92, $20
	db $92, $20
	db $92, $20
	db $92, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $99, $20
	db $9C, $20
	db $90, $20
	db $90, $20
	db $90, $20
	db $9C, $20
	db $90, $20
	db $90, $20
	db $90, $20
	db !return_from_sub

.subseq_1A5F:
	db !long_duration_on
	db $92, $01, $00
	db $97, $01, $00
	db $8F, $01, $00
	db $91, $01, $00
	db !long_duration_off
	db !return_from_sub

.seq_1A6E:
	db !loop_subsequence, $01 : dw .subseq_19B7
	db !set_adsr, $ED, $73
	db !set_volume_l_and_r, $28, $3C
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !echo_on
.loop_point_1A7D:
	db !loop_subsequence, $03 : dw .subseq_1AB4
	db !loop_subsequence, $01 : dw .subseq_1A89
	db !jump_to_sequence : dw .loop_point_1A7D
	db !end_sequence

.subseq_1A89:
	db !set_variable_note_1, $88
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $8D
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $84
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $86
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $88
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $8D
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $84
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !return_from_sub

.subseq_1AB4:
	db !set_variable_note_1, $86
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $8B
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $83
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !set_variable_note_1, $85
	db !loop_subsequence, $02 : dw .subseq_1ACD
	db !return_from_sub

.subseq_1ACD:
	db !set_instrument, $3F
	db $E0, $08
	db !set_instrument, $37
	db $E0, $08
	db !set_instrument, $41
	db $E0, $08
	db !set_instrument, $37
	db $E0, $08
	db !set_instrument, $43
	db $E0, $08
	db !set_instrument, $37
	db $E0, $08
	db !set_instrument, $45
	db $E0, $08
	db !set_instrument, $47
	db $E0, $08
	db !set_instrument, $39
	db $E0, $08
	db !set_instrument, $48
	db $E0, $08
	db !set_instrument, $3B
	db $E0, $08
	db !set_instrument, $45
	db $E0, $08
	db !set_instrument, $4A
	db $E0, $08
	db !set_instrument, $47
	db $E0, $08
	db !set_instrument, $45
	db $E0, $08
	db !set_instrument, $39
	db $E0, $08
	db !return_from_sub

.seq_1B0E:
	db !loop_subsequence, $01 : dw .subseq_19B7
	db !echo_on
	db !set_instrument, $AF
	db !change_instr_pitch, $12
	db !fine_tune, $F2
	db !vibrato_with_delay, $06, $02, $11, $0B
	db !set_adsr, $80, $E5
	db !long_duration_on
	db !set_volume_l_and_r, $19, $3C
	db !set_adsr, $80, $E5
	db $99, $02, $00
	db !set_volume_l_and_r, $32, $19
	db $A0, $02, $00
	db !long_duration_off
.loop_point_1B32:
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0B, $1C
	db !set_adsr, $AE, $AE
	db !vibrato_off
	db !loop_subsequence, $01 : dw .subseq_1C05
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !set_volume_l_and_r, $2C, $16
	db !vibrato_with_delay, $04, $03, $11, $08
	db !set_adsr, $8B, $EE
	db !loop_subsequence, $01 : dw .subseq_1BBE
	db !set_instrument, $14
	db !change_instr_pitch, $08
	db !fine_tune, $02
	db !set_volume_l_and_r, $0B, $17
	db !set_adsr, $88, $EB
	db !vibrato_off
	db !loop_subsequence, $01 : dw .subseq_1B8E
	db $99, $40
	db !set_instrument, $AF
	db !change_instr_pitch, $12
	db !fine_tune, $F2
	db !vibrato_with_delay, $06, $02, $11, $0B
	db !set_adsr, $80, $E5
	db !long_duration_on
	db !set_volume_l_and_r, $19, $3C
	db !set_adsr, $80, $E5
	db $99, $01, $C0
	db !set_volume_l_and_r, $32, $19
	db $A0, $02, $00
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_1B32
	db !end_sequence

.subseq_1B8E:
	db !set_adsr, $8A, $EB
	db $97, $80
	db $96, $60
	db $92, $10
	db $94, $C0
	db $80, $10
	db $94, $20
	db $96, $20
	db $97, $80
	db $96, $60
	db $94, $10
	db $92, $C0
	db $80, $50
	db $97, $80
	db $96, $60
	db $92, $10
	db $94, $C0
	db $80, $10
	db $94, $20
	db $96, $20
	db $97, $80
	db $96, $60
	db $92, $20
	db !return_from_sub

.subseq_1BBE:
	db $A2, $20
	db $A3, $10
	db $A5, $30
	db $A7, $10
	db $A5, $80
	db $A3, $10
	db $A2, $20
	db $A3, $10
	db $A5, $30
	db $A7, $10
	db $9E, $70
	db $A2, $10
	db $A3, $10
	db $A5, $10
	db $80, $10
	db $9E, $10
	db $9E, $30
	db !set_adsr, $AB, $6E
	db !change_instr_pitch_rel, $0C
	db $A2, $10
	db $A3, $10
	db $A5, $10
	db $80, $10
	db $9E, $10
	db $9E, $30
	db !change_instr_pitch_rel, $F4
	db !set_adsr, $8B, $EE
	db $A2, $10
	db $A3, $10
	db $A5, $20
	db $A0, $10
	db $A5, $30
	db $A7, $10
	db $A5, $90
	db !return_from_sub

.subseq_1C05:
	db $A2, $20
	db $A3, $10
	db $A2, $10
	db $9E, $80
	db $A5, $18
	db $A3, $18
	db $A2, $10
	db $A3, $20
	db $A2, $10
	db $9E, $B0
	db $9E, $10
	db $A0, $10
	db $A2, $20
	db $A3, $10
	db $A2, $10
	db $9E, $A0
	db $9E, $10
	db $A0, $10
	db $A2, $20
	db $A3, $10
	db $A2, $30
	db $A3, $10
	db $A0, $90
	db !return_from_sub

.seq_1C34:
	db !loop_subsequence, $01 : dw .subseq_19B7
	db !echo_on
	db !set_instrument, $88
	db !set_volume_l_and_r, $08, $11
	db !set_adsr, $FE, $95
.loop_point_1C41:
	db !loop_subsequence, $03 : dw .subseq_1C78
	db !loop_subsequence, $01 : dw .subseq_1C4D
	db !jump_to_sequence : dw .loop_point_1C41
	db !end_sequence

.subseq_1C4D:
	db !set_variable_note_1, $8F
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $8D
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $88
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $8A
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $8B
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $8B
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $88
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !return_from_sub

.subseq_1C78:
	db !set_variable_note_1, $86
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $8A
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $8A
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !set_variable_note_1, $88
	db !loop_subsequence, $01 : dw .subseq_1C91
	db !return_from_sub

.subseq_1C91:
	db !set_instrument, $AF
	db !change_instr_pitch, $12
	db !fine_tune, $F2
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $AF, $8C
	db !vibrato_with_delay, $04, $03, $0E, $0B
	db $E0, $10
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $88
	db !set_volume_l_and_r, $08, $11
	db !set_adsr, $FE, $95
	db $A4, $10
	db $A5, $10
	db $A4, $10
	db $A5, $10
	db $A4, $10
	db $A5, $10
	db $A4, $10
	db $A5, $08
	db $A5, $10
	db $A5, $08
	db $A5, $08
	db $A5, $08
	db $A5, $08
	db $A5, $08
	db $A5, $10
	db $A4, $10
	db $A5, $10
	db $A4, $10
	db !return_from_sub

.seq_1CD5:
	db !loop_subsequence, $01 : dw .subseq_19B7
	db !echo_on
.loop_point_1CDA:
	db !loop_subsequence, $03 : dw .subseq_1D4E
	db !loop_subsequence, $01 : dw .subseq_1CE6
	db !jump_to_sequence : dw .loop_point_1CDA
	db !end_sequence

.subseq_1CE6:
	db !set_variable_note_1, $88
	db !set_variable_note_2, $94
	db !loop_subsequence, $02 : dw .subseq_1D1F
	db !set_variable_note_1, $8D
	db !set_variable_note_2, $99
	db !loop_subsequence, $02 : dw .subseq_1D1F
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_1D1F
	db !set_variable_note_1, $86
	db !set_variable_note_2, $92
	db !loop_subsequence, $02 : dw .subseq_1D1F
	db !set_variable_note_1, $88
	db !set_variable_note_2, $94
	db !loop_subsequence, $02 : dw .subseq_1D1F
	db !set_variable_note_1, $8D
	db !set_variable_note_2, $99
	db !loop_subsequence, $02 : dw .subseq_1D1F
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_1D1F
	db !return_from_sub

.subseq_1D1F:
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $AF, $EE
	db $E0, $18
	db $E0, $18
	db !set_instrument, $8B
	db !set_volume_l_and_r, $3C, $28
	db !set_adsr, $FF, $35
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db $E1, $08
	db $E1, $08
	db !set_instrument, $C5
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $AE, $EE
	db $99, $40
	db !return_from_sub

.subseq_1D4E:
	db !set_variable_note_1, $86
	db !set_variable_note_2, $92
	db !loop_subsequence, $01 : dw .subseq_1D6F
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $01 : dw .subseq_1D6F
	db !set_variable_note_1, $83
	db !set_variable_note_2, $8F
	db !loop_subsequence, $01 : dw .subseq_1D6F
	db !set_variable_note_1, $85
	db !set_variable_note_2, $91
	db !loop_subsequence, $01 : dw .subseq_1D6F
	db !return_from_sub

.subseq_1D6F:
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $AF, $EE
	db $E0, $40
	db !set_instrument, $C5
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $AE, $EE
	db $99, $88
	db !set_instrument, $8B
	db !set_volume_l_and_r, $3C, $28
	db !set_adsr, $FF, $35
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db $E1, $10
	db $E1, $08
	db $E1, $08
	db $E1, $08
	db $E1, $08
	db $E1, $08
	db !return_from_sub

.seq_1DA4:
	db !loop_subsequence, $01 : dw .subseq_19B7
.loop_point_1DA8:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $E8
	db !loop_subsequence, $03 : dw .subseq_1E06
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !set_volume_l_and_r, $30, $21
	db !vibrato_with_delay, $04, $03, $11, $08
	db !set_adsr, $8E, $EE
	db !vibrato_off
	db $A3, $40
	db $A3, $40
	db $A3, $40
	db $A3, $40
	db $A5, $40
	db $A5, $40
	db $A5, $40
	db $A5, $40
	db $A3, $40
	db $A3, $40
	db $A3, $40
	db $A3, $40
	db $A2, $40
	db $A2, $40
	db $A2, $40
	db $A2, $40
	db $A3, $40
	db $A3, $40
	db $A3, $40
	db $A3, $40
	db $A5, $40
	db $A5, $40
	db $A5, $40
	db $A5, $40
	db $A3, $40
	db $A3, $40
	db $A3, $40
	db $A3, $40
	db !jump_to_sequence : dw .loop_point_1DA8
	db !end_sequence

.subseq_1E06:
	db $A2, $FF
	db $80, $01
	db $A2, $FF
	db $80, $01
	db $A2, $FF
	db $80, $01
	db $A0, $FF
	db $80, $01
	db !return_from_sub

.seq_1E17:
	db !loop_subsequence, $01 : dw .subseq_19B7
.loop_point_1E1B:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $E8
	db !loop_subsequence, $03 : dw .subseq_1E85
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !set_volume_l_and_r, $30, $21
	db !vibrato_with_delay, $04, $03, $11, $08
	db !set_adsr, $8E, $EE
	db !vibrato_off
	db $A0, $40
	db $A0, $40
	db $A0, $40
	db $A0, $40
	db $9D, $40
	db $9D, $40
	db $9D, $40
	db $9D, $40
	db $A0, $40
	db $A0, $40
	db $A0, $40
	db $A0, $40
	db $9E, $40
	db $9E, $40
	db $9E, $40
	db $9E, $40
	db $A0, $40
	db $A0, $40
	db $A0, $40
	db $A0, $40
	db $9D, $40
	db $9D, $40
	db $9D, $40
	db $9D, $40
	db $A0, $40
	db $A0, $40
	db $A0, $40
	db $A0, $40
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $EB
	db !jump_to_sequence : dw .loop_point_1E1B
	db !end_sequence

.subseq_1E85:
	db $9E, $FF
	db $80, $01
	db $9E, $FF
	db $80, $01
	db $9E, $FF
	db $80, $01
	db $9D, $FF
	db $80, $01
	db !return_from_sub

.seq_1E96:
	db !loop_subsequence, $01 : dw .subseq_19B7
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $E8
	db !loop_subsequence, $01 : dw .subseq_1F01
.loop_point_1EAB:
	db $80, $17
	db !set_instrument, $2C
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0E, $06
	db !set_adsr, $AD, $A8
	db !loop_subsequence, $01 : dw .subseq_1C05
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !set_volume_l_and_r, $0B, $12
	db !vibrato_with_delay, $03, $02, $11, $08
	db !set_adsr, $8B, $EE
	db !loop_subsequence, $01 : dw .subseq_1BBE
	db !set_instrument, $14
	db !change_instr_pitch, $08
	db !fine_tune, $02
	db !set_volume_l_and_r, $0E, $06
	db !set_adsr, $88, $EB
	db !vibrato_off
	db !loop_subsequence, $01 : dw .subseq_1B8E
	db $99, $E9
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $E8
	db $9B, $FF
	db $80, $01
	db $99, $FF
	db $80, $01
	db $99, $FF
	db $80, $01
	db !jump_to_sequence : dw .loop_point_1EAB
	db !end_sequence

.subseq_1F01:
	db $99, $FF
	db $80, $01
	db $9B, $FF
	db $80, $01
	db $99, $FF
	db $80, $01
	db $99, $FF
	db $80, $01
	db !return_from_sub

base off
arch 65816
.end: