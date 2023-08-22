;06 Klomp's Romp
;2E52FC
ship_deck_song_data:
	dw !bgm_loc, $0684
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1A7F, .seq_1BA7, .seq_1C7F, .seq_1DDF, .seq_1AAF, .seq_1AD0, .seq_1D92, .seq_1DB1
	db $A0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_1925, .seq_19AD, .seq_1995, .seq_1A21, .seq_1A4C, .seq_1994, .seq_19F2, .seq_1961
	db $B0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_163F, .seq_16D0, .seq_17AC, .seq_1807, .seq_16A2, .seq_18F8, .seq_18CB, .seq_1754
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_1489, .seq_14FE, .seq_1549, .seq_15C7, .seq_14D2, .seq_1607, .seq_1619, .seq_15E7
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_1364, .seq_13B1, .seq_13C7, .seq_13EB, .seq_1405, .seq_145F, .seq_141F, .seq_1439
	db $C0, $FF	;music tempo, sound effect tempo

.seq_1364:
	db !set_echo, $28, $11, $11
	db !set_fir, $70, $01, $01, $01, $01, $01, $01, $01
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !set_instrument, $A0
	db !set_vol_single_val, $46
	db $9E, $09
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $3C
	db $97, $07
	db $97, $09
	db !set_instrument, $A0
	db !set_vol_single_val, $46
	db $9E, $10
	db $9E, $07
	db $9E, $05
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $3C
	db $97, $05
	db $97, $06
	db !set_instrument, $A0
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

.seq_13B1:
	db !set_instrument, $21
	db !change_instr_pitch, $00
	db !fine_tune, $AB
	db !set_vol_single_val, $46
	db !set_adsr, $DE, $93
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13C7:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $28, $50
	db !set_adsr, $8F, $CB
	db !echo_on
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

.seq_13EB:
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $AF, $AE
	db !echo_on
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_1405:
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $AF, $AE
	db !echo_on
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_141F:
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $19, $19
	db !set_adsr, $AF, $AE
	db !echo_on
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1439:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $21, $11
	db !set_adsr, $8E, $C8
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
	db !set_adsr, $BF, $4B
	db $AC, $19
	db $80, $07
	db $AC, $10
	db !end_sequence

.seq_145F:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !end_sequence

.unreached_1464:
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

.seq_1489:
	db !set_echo, $28, $11, $11
	db !set_fir, $70, $01, $01, $01, $01, $01, $01, $01
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_14C1
.loop_point_14B0:
	db !echo_on
	db !set_instrument, $A0
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_14B0

.subseq_14C1:
	db !echo_on
	db !set_instrument, $A0
	db !set_vol_single_val, $6C
	db $9F, $08
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $08
	db $99, $08
	db !return_from_sub

.seq_14D2:
	db !play_subsequence : dw .subseq_162B
	db !end_sequence

.unreached_14D6:
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
.unreached_14F7:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .unreached_14F7

.seq_14FE:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !set_instrument, $21
	db !change_instr_pitch, $00
	db !fine_tune, $AB
	db !set_vol_single_val, $46
	db !set_adsr, $DE, $93
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
.loop_point_1525:
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
	db !jump_to_sequence : dw .loop_point_1525
	db !end_sequence

.seq_1549:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1565
	db !end_sequence

.subseq_1565:
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

.seq_15C7:
	db !play_subsequence : dw .subseq_162B
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
	db !play_subsequence : dw .subseq_1565
	db !end_sequence

.seq_15E7:
	db !play_subsequence : dw .subseq_162B
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
	db !play_subsequence : dw .subseq_1565
	db !end_sequence

.seq_1607:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1619:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $28, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.subseq_162B:
	db !set_instrument, $13
	db !change_instr_pitch, $F0
	db !fine_tune, $1F
	db !set_adsr, $8A, $E0
	db !return_from_sub

.subseq_1635:
	db !set_instrument, $1E
	db !set_adsr, $8E, $F6
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !return_from_sub

.seq_163F:
	db !set_echo, $28, $11, $11
	db !set_fir, $70, $01, $01, $01, $01, $01, $01, $01
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1667
	db !end_sequence

.subseq_1667:
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db $94, $10
	db !echo_on
	db !set_instrument, $A0
	db !set_vol_single_val, $62
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $96, $09
	db !echo_on
	db !set_instrument, $A0
	db !set_vol_single_val, $21
	db $A5, $10
	db $A4, $07
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $98, $09
	db !echo_on
	db !set_instrument, $A0
	db !set_vol_single_val, $21
	db $A3, $07
	db !set_vol_single_val, $62
	db $9E, $10
	db !set_vol_single_val, $21
	db $A4, $09
	db !set_vol_single_val, $26
	db $A5, $07
	db !return_from_sub

.seq_16A2:
	db !play_subsequence : dw .subseq_162B
	db !end_sequence

.unreached_16A6:
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $28, $32
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .unreached_16C1
	db !default_duration_off
	db !end_sequence

.unreached_16C1:
	db !set_adsr, $8F, $F8
	db $99, $97
	db $9A, $97
	db $99, $96
	db $98, $10
	db $8F, $C5
	db $9A, $05
.seq_16D0:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_16E8
	db !end_sequence

.subseq_16E8:
	db !play_subsequence : dw .subseq_16F5
	db !play_subsequence : dw .subseq_1732
	db !play_subsequence : dw .subseq_16F5
	db !play_subsequence : dw .subseq_1743
	db !return_from_sub

.subseq_16F5:
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

.subseq_1732:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_1743:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_1754:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1771
	db !end_sequence

.subseq_1771:
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $97, $10
	db $94, $10
	db !echo_on
	db !set_instrument, $A0
	db !set_vol_single_val, $24
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db $96, $09
	db !echo_on
	db !set_instrument, $A0
	db !set_vol_single_val, $0C
	db $A5, $10
	db $A4, $07
	db !set_instrument, $00
	db !set_vol_single_val, $1B
	db !echo_off
	db $98, $09
	db !echo_on
	db !set_instrument, $A0
	db !set_vol_single_val, $0C
	db $A3, $07
	db !set_vol_single_val, $24
	db $9E, $10
	db !set_vol_single_val, $0C
	db $A4, $09
	db !set_vol_single_val, $11
	db $A5, $07
	db !return_from_sub

.seq_17AC:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !vibrato_off
	db !set_instrument, $21
	db !change_instr_pitch, $00
	db !fine_tune, $AB
	db !set_vol_single_val, $46
	db !set_adsr, $DE, $93
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17E2
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_17E2
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17E2
	db !end_sequence

.subseq_17E2:
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

.seq_1807:
	db !play_subsequence : dw .subseq_162B
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1882
	db !play_subsequence : dw .subseq_1860
	db !play_subsequence : dw .subseq_1635
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_1832
	db !end_sequence

.subseq_1832:
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

.subseq_1860:
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
.subseq_1882:
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

.seq_18CB:
	db !play_subsequence : dw .subseq_162B
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
	db !play_subsequence : dw .subseq_1882
	db !play_subsequence : dw .subseq_1860
	db !play_subsequence : dw .subseq_1635
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_1832
	db !end_sequence

.seq_18F8:
	db !play_subsequence : dw .subseq_162B
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
	db !play_subsequence : dw .subseq_1882
	db !play_subsequence : dw .subseq_1860
	db !play_subsequence : dw .subseq_1635
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_1832
	db !end_sequence

.seq_1925:
	db !set_echo, $28, $11, $11
	db !set_fir, $70, $01, $01, $01, $01, $01, $01, $01
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_adsr, $8C, $B7
	db !echo_on
	db !set_volume_l_and_r, $21, $0B
	db $9E, $04
	db $A0, $04
	db $A1, $18
	db $A0, $04
	db $9E, $04
	db $9D, $10
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db $99, $04
	db $9B, $04
	db $9C, $04
	db $9D, $04
	db $9E, $20
	db !end_sequence

.seq_1961:
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_adsr, $8C, $B7
	db !set_volume_l_and_r, $0B, $04
	db $80, $0F
	db !set_volume_l_and_r, $04, $0C
	db $9E, $04
	db $A0, $04
	db $A1, $18
	db $A0, $04
	db $9E, $04
	db $9D, $10
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db $99, $04
	db $9B, $04
	db $9C, $04
	db $9D, $04
	db $9E, $20
	db !end_sequence

.seq_1994:
	db !end_sequence

.seq_1995:
	db !set_instrument, $A0
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !play_subsequence : dw .subseq_1BED
	db !end_sequence

.seq_19AD:
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $46, $28
	db !set_adsr, $FE, $51
	db !echo_on
	db $80, $08
	db $97, $08
	db $9A, $08
	db $9E, $08
	db $A1, $08
	db $99, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $9E, $08
	db $A1, $08
	db $A5, $08
	db $A8, $08
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !vibrato_with_delay, $03, $02, $11, $08
	db !set_adsr, $AF, $4B
	db !set_volume_l_and_r, $1E, $32
	db $AA, $10
	db !set_volume_l_and_r, $14, $0F
	db $AA, $10
	db !set_volume_l_and_r, $07, $0A
	db $AA, $10
	db !end_sequence

.seq_19F2:
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $FE, $51
	db !echo_on
	db $80, $0A
	db $80, $08
	db $97, $08
	db $9A, $08
	db $9E, $08
	db $A1, $08
	db $99, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $9E, $08
	db $A1, $08
	db $A5, $04
	db $A8, $02
	db !set_volume_l_and_r, $50, $32
	db $AA, $20
	db !end_sequence

.seq_1A21:
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !vibrato_with_delay, $03, $02, $11, $08
	db !set_adsr, $AF, $4B
	db !set_volume_l_and_r, $28, $3C
	db $80, $08
	db $97, $20
	db $99, $18
	db $9B, $04
	db $9D, $04
	db !set_volume_l_and_r, $1E, $32
	db $9E, $10
	db !set_volume_l_and_r, $14, $0F
	db $9E, $10
	db !set_volume_l_and_r, $07, $0A
	db $9E, $10
	db !end_sequence

.seq_1A4C:
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !vibrato_with_delay, $03, $02, $11, $08
	db !set_adsr, $AF, $4B
	db $80, $08
	db $80, $60
	db !set_volume_l_and_r, $1E, $32
	db $A1, $10
	db !set_volume_l_and_r, $14, $0F
	db $A1, $10
	db !set_volume_l_and_r, $07, $0A
	db $A1, $10
	db !end_sequence

.unreached_1A6E:
	db !set_echo, $32, $1E, $1E
	db !set_fir, $70, $01, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.subseq_1A7C:
	db $80, $10
	db !return_from_sub

.seq_1A7F:
	db !echo_delay, $04
	db !play_subsequence : dw .subseq_1A7C
	db !set_master_volume_indirect, $56
	db !set_echo, $1E, $0A, $0A
	db !set_fir, $70, $01, $01, $01, $01, $01, $01, $01
	db !echo_on
	db !set_instrument, $A7
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $64, $3C
	db !set_adsr, $8F, $EB
.loop_point_1AA0:
	db !loop_subsequence, $08 : dw .subseq_1AA8
	db !jump_to_sequence : dw .loop_point_1AA0
	db !end_sequence

.subseq_1AA8:
	db $85, $60
	db $8A, $40
	db $86, $50
	db !return_from_sub

.seq_1AAF:
	db !play_subsequence : dw .subseq_1A7C
	db !set_instrument, $A7
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $3C, $64
	db !set_adsr, $8F, $E0
	db $80, $20
	db !echo_on
.loop_point_1AC1:
	db !loop_subsequence, $08 : dw .subseq_1AC9
	db !jump_to_sequence : dw .loop_point_1AC1
	db !end_sequence

.subseq_1AC9:
	db $85, $50
	db $8A, $40
	db $86, $70
	db !return_from_sub

.seq_1AD0:
	db !play_subsequence : dw .subseq_1A7C
	db !set_instrument, $A7
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $32, $14
	db !set_adsr, $8C, $EB
	db $80, $14
	db !echo_on
	db !loop_subsequence, $06 : dw .subseq_1AA8
	db $85, $50
	db $8A, $3E
.loop_point_1AEA:
	db !set_instrument, $1E
	db !change_instr_pitch, $00
	db !fine_tune, $B8
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_adsr, $8C, $B7
	db !set_volume_l_and_r, $0B, $04
	db !set_volume_l_and_r, $04, $0C
	db $A0, $04
	db $A1, $04
	db !play_subsequence : dw .subseq_1B3C
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !vibrato_with_delay, $03, $02, $11, $08
	db !set_adsr, $AF, $4B
	db !set_volume_l_and_r, $17, $0C
	db !play_subsequence : dw .subseq_1CD6
	db !set_instrument, $21
	db !change_instr_pitch, $0C
	db !fine_tune, $AB
	db !set_adsr, $8A, $EF
	db !vibrato_with_delay, $04, $02, $12, $08
	db !set_volume_l_and_r, $04, $07
	db $A0, $04
	db $A1, $04
	db !play_subsequence : dw .subseq_1B3C
	db !long_duration_on
	db $80, $02, $00
	db !long_duration_off
	db $80, $08
	db !jump_to_sequence : dw .loop_point_1AEA
	db !end_sequence

.subseq_1B3C:
	db $A2, $10
	db $A2, $08
	db $A0, $08
	db $A2, $10
	db $A2, $08
	db $A0, $08
	db $A2, $08
	db $A5, $08
	db $A6, $08
	db $A7, $10
	db $A5, $08
	db $A2, $10
	db $9E, $10
	db $9E, $08
	db $9B, $08
	db $9E, $10
	db $9E, $08
	db $99, $08
	db $9B, $08
	db $9E, $08
	db $A0, $08
	db $A1, $10
	db $A0, $08
	db $9E, $10
	db $A2, $10
	db $A2, $08
	db $A0, $08
	db $A2, $10
	db $A2, $08
	db $A0, $08
	db $A2, $08
	db $A5, $08
	db $A6, $08
	db $A7, $10
	db $A5, $08
	db $A2, $08
	db $9E, $08
	db $9B, $10
	db $9E, $10
	db $A1, $08
	db $A0, $10
	db $9E, $08
	db $80, $3C
	db $99, $04
	db $9B, $10
	db $9E, $10
	db $A1, $08
	db $A0, $10
	db $9E, $08
	db $80, $1A
	db $A8, $03
	db $A9, $03
	db $AA, $20
	db !return_from_sub

.seq_1BA7:
	db !play_subsequence : dw .subseq_1A7C
	db !set_instrument, $A7
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $14, $32
	db !set_adsr, $8C, $E0
	db $80, $14
	db $80, $20
	db !echo_on
	db !loop_subsequence, $04 : dw .subseq_1AC9
	db !set_instrument, $A0
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
.loop_point_1BD3:
	db !loop_subsequence, $04 : dw .subseq_1C4D
	db !loop_subsequence, $05 : dw .subseq_1C4D
	db !loop_subsequence, $07 : dw .subseq_1C4D
	db !play_subsequence : dw .subseq_1C19
	db !loop_subsequence, $04 : dw .subseq_1C4D
	db !play_subsequence : dw .subseq_1BED
	db !jump_to_sequence : dw .loop_point_1BD3
	db !end_sequence

.subseq_1BED:
	db !set_volume_l_and_r, $32, $32
	db $96, $18
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !set_volume_l_and_r, $32, $32
	db $96, $18
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !set_volume_l_and_r, $32, $32
	db $96, $10
	db $96, $08
	db $96, $08
	db $96, $18
	db $80, $18
	db !return_from_sub

.subseq_1C19:
	db !set_volume_l_and_r, $32, $32
	db $96, $18
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !set_volume_l_and_r, $32, $32
	db $96, $18
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !set_volume_l_and_r, $32, $32
	db $96, $10
	db $96, $10
	db $96, $18
	db $80, $20
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !return_from_sub

.subseq_1C4D:
	db !set_volume_l_and_r, $32, $32
	db $96, $18
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !set_volume_l_and_r, $32, $32
	db $96, $18
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !set_volume_l_and_r, $32, $32
	db $96, $10
	db $96, $10
	db $96, $18
	db !set_volume_l_and_r, $19, $19
	db $96, $04
	db !set_volume_l_and_r, $23, $23
	db $96, $04
	db !return_from_sub

.seq_1C7F:
	db !play_subsequence : dw .subseq_1A7C
	db !long_duration_on
	db $80, $04, $34
.loop_point_1C86:
	db !long_duration_on
	db $80, $02, $00
	db !long_duration_off
	db !set_instrument, $1E
	db !change_instr_pitch, $00
	db !fine_tune, $B8
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_adsr, $8C, $B7
	db !echo_on
	db !set_volume_l_and_r, $21, $0B
	db $A0, $04
	db $A1, $04
	db !play_subsequence : dw .subseq_1B3C
	db !set_instrument, $13
	db !change_instr_pitch, $FC
	db !fine_tune, $1F
	db !vibrato_with_delay, $03, $02, $11, $08
	db !set_adsr, $AF, $4B
	db !set_volume_l_and_r, $28, $3C
	db !play_subsequence : dw .subseq_1CD6
	db !set_instrument, $21
	db !change_instr_pitch, $0C
	db !fine_tune, $AB
	db !set_adsr, $8A, $EF
	db !vibrato_with_delay, $03, $03, $11, $08
	db !set_volume_l_and_r, $14, $0A
	db $A0, $04
	db $A1, $04
	db !play_subsequence : dw .subseq_1B3C
	db $80, $08
	db !jump_to_sequence : dw .loop_point_1C86
	db !end_sequence

.subseq_1CD6:
	db $9B, $10
	db $9E, $0C
	db $80, $04
	db $9B, $10
	db $9E, $10
	db $9B, $0C
	db $80, $04
	db $9E, $08
	db $A1, $0E
	db $80, $02
	db $A0, $08
	db $9E, $08
	db $99, $28
	db $80, $20
	db $80, $40
	db $9B, $10
	db $9E, $0C
	db $80, $04
	db $9B, $10
	db $9E, $10
	db $9B, $0C
	db $80, $04
	db $9E, $08
	db $A1, $0E
	db $80, $02
	db $A0, $08
	db $9E, $08
	db $A0, $28
	db $80, $18
	db $A0, $05
	db $A1, $03
	db $A2, $10
	db $A2, $10
	db $A0, $08
	db $9E, $18
	db $9B, $10
	db $9E, $0C
	db $80, $04
	db $9B, $08
	db $9E, $10
	db $9B, $10
	db $80, $30
	db $A0, $08
	db $A2, $10
	db $A2, $0E
	db $80, $02
	db $A2, $08
	db $A5, $11
	db $80, $04
	db $A6, $03
	db $A7, $0C
	db $80, $04
	db $A2, $10
	db $A0, $08
	db $9E, $10
	db $80, $04
	db $9E, $04
	db $A0, $0C
	db $80, $04
	db $A2, $08
	db $A0, $10
	db $9B, $08
	db $9E, $10
	db $A0, $0C
	db $80, $04
	db $A2, $08
	db $A0, $10
	db $9B, $08
	db $9E, $10
	db $A0, $0E
	db $80, $02
	db $A0, $0F
	db $80, $01
	db $A0, $0E
	db $80, $02
	db $A0, $0F
	db $80, $01
	db $A2, $0F
	db $80, $01
	db $A0, $08
	db $A2, $08
	db $A3, $38
	db !return_from_sub

.subseq_1D7B:
	db $80, $C0
	db !set_volume_l_and_r, $14, $C8
	db $8A, $80
	db !set_volume_l_and_r, $C8, $19
	db $8F, $F0
	db !set_volume_l_and_r, $19, $C8
	db $8E, $E0
	db !set_volume_l_and_r, $C8, $19
	db $8D, $C0
	db !return_from_sub

.seq_1D92:
	db !play_subsequence : dw .subseq_1A7C
	db !set_instrument, $A8
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !pitch_slide_up, $12, $04, $0B, $0B, $00
	db $80, $80
	db $80, $80
	db !echo_on
.loop_point_1DA9:
	db !loop_subsequence, $02 : dw .subseq_1D7B
	db !jump_to_sequence : dw .loop_point_1DA9
	db !end_sequence

.seq_1DB1:
	db !play_subsequence : dw .subseq_1A7C
	db !set_instrument, $9E
	db !change_instr_pitch, $F4
	db !fine_tune, $00
	db !set_adsr, $8F, $EB
	db !echo_on
.loop_point_1DBE:
	db !loop_subsequence, $02 : dw .subseq_1DC6
	db !jump_to_sequence : dw .loop_point_1DBE
	db !end_sequence

.subseq_1DC6:
	db !set_volume_l_and_r, $76, $75
	db $80, $F0
	db !pitch_slide_up, $16, $26, $21, $21, $00
	db $81, $F0
	db $84, $80
	db !set_volume_l_and_r, $75, $76
	db !set_adsr, $8F, $E8
	db $82, $F0
	db !pitch_slide_off
	db !return_from_sub

.seq_1DDF:
	db !play_subsequence : dw .subseq_1A7C
	db !long_duration_on
	db $80, $04, $34
.loop_point_1DE6:
	db !long_duration_on
	db $80, $02, $00
	db $80, $02, $88
	db !long_duration_off
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_volume_l_and_r, $46, $28
	db !set_adsr, $FE, $51
	db !echo_on
	db !play_subsequence : dw .subseq_1E9B
	db !set_instrument, $22
	db !change_instr_pitch, $05
	db !fine_tune, $B6
	db !set_adsr, $CF, $51
	db !play_subsequence : dw .subseq_1E0E
	db !jump_to_sequence : dw .loop_point_1DE6
	db !end_sequence

.subseq_1E0E:
	db !loop_subsequence, $04 : dw .subseq_1E82
	db !change_instr_pitch_rel, $F9
	db !loop_subsequence, $04 : dw .subseq_1E82
	db !change_instr_pitch_rel, $07
	db !loop_subsequence, $04 : dw .subseq_1E82
	db !change_instr_pitch_rel, $F9
	db !play_subsequence : dw .subseq_1E82
	db !change_instr_pitch_rel, $02
	db !play_subsequence : dw .subseq_1E82
	db !change_instr_pitch_rel, $05
	db !loop_subsequence, $02 : dw .subseq_1E82
	db !change_instr_pitch_rel, $F9
	db !play_subsequence : dw .subseq_1E82
	db !change_instr_pitch_rel, $02
	db !play_subsequence : dw .subseq_1E82
	db !change_instr_pitch_rel, $05
	db !set_volume_l_and_r, $26, $46
	db $96, $08
	db $92, $04
	db !set_volume_l_and_r, $19, $0F
	db $96, $04
	db !set_volume_l_and_r, $26, $3C
	db $96, $04
	db !set_volume_l_and_r, $19, $0F
	db $92, $04
	db !set_volume_l_and_r, $26, $3C
	db $99, $04
	db !set_volume_l_and_r, $19, $0F
	db $96, $04
	db !set_volume_l_and_r, $26, $3C
	db $9E, $04
	db !set_volume_l_and_r, $19, $0F
	db $99, $08
	db $9E, $14
	db $80, $08
	db !return_from_sub

.unreached_1E69:
	db !set_volume_l_and_r, $26, $3C
	db $97, $08
	db $9B, $04
	db !set_volume_l_and_r, $19, $0F
	db $97, $04
	db !set_volume_l_and_r, $26, $3C
	db $9E, $04
	db !set_volume_l_and_r, $19, $0F
	db $9B, $08
	db $9E, $04
	db !return_from_sub

.subseq_1E82:
	db !set_volume_l_and_r, $26, $3C
	db $92, $08
	db $96, $04
	db !set_volume_l_and_r, $19, $0F
	db $92, $04
	db !set_volume_l_and_r, $26, $3C
	db $99, $04
	db !set_volume_l_and_r, $19, $0F
	db $96, $08
	db $99, $04
	db !return_from_sub

.subseq_1E9B:
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $92, $08
	db $99, $08
	db $9E, $08
	db $96, $08
	db $92, $08
	db $99, $08
	db $9E, $08
	db $96, $08
	db $92, $08
	db $99, $08
	db $9E, $08
	db $96, $08
	db $92, $08
	db $99, $08
	db $9E, $08
	db $96, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $99, $08
	db $9D, $08
	db $A5, $08
	db $A0, $08
	db $99, $08
	db $9D, $08
	db $A5, $08
	db $A0, $08
	db $92, $08
	db $99, $08
	db $9E, $08
	db $96, $08
	db $92, $08
	db $99, $08
	db $9E, $08
	db $96, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $97, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $9A, $08
	db $9D, $08
	db $A6, $08
	db $A2, $08
	db $9A, $08
	db $9D, $08
	db $A6, $08
	db $A2, $08
	db $9B, $08
	db $9E, $08
	db $A7, $08
	db $A2, $08
	db $9B, $08
	db $9E, $08
	db $A7, $08
	db $A2, $08
	db $94, $08
	db $9B, $08
	db $A0, $08
	db $98, $08
	db $94, $08
	db $9B, $08
	db $A0, $08
	db $98, $08
	db $94, $08
	db $9B, $08
	db $A0, $08
	db $98, $08
	db $94, $08
	db $9B, $08
	db $A0, $08
	db $98, $08
	db $99, $08
	db $9D, $08
	db $A5, $08
	db $A0, $08
	db $99, $08
	db $9D, $08
	db $A5, $08
	db $A0, $08
	db $99, $08
	db $A2, $08
	db $A5, $08
	db $9D, $08
	db $99, $08
	db $9D, $08
	db $A0, $08
	db $A3, $08
	db $A5, $20
	db !return_from_sub

.unreached_1F9E:
	db !set_instrument, $21
	db !set_volume_l_and_r, $0C, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $AB
	db !set_adsr, $8A, $EF
	db !vibrato_with_delay, $03, $03, $11, $08
	db !play_subsequence : dw .unreached_1FB3
	db !end_sequence

.unreached_1FB3:
	db $A2, $03
	db $A2, $15
	db $A2, $0E
	db $80, $02
	db $A0, $08
	db $A2, $15
	db $80, $03
	db $A2, $10
	db $A0, $08
	db $A2, $10
	db $A5, $08
	db $A6, $10
	db $A7, $18
	db $A5, $08
	db $A2, $10
	db $A0, $08
	db $9E, $15
	db $80, $03
	db $9E, $10
	db $9B, $08
	db $9E, $18
	db $80, $10
	db $99, $08
	db $9B, $10
	db $9E, $08
	db $A0, $10
	db $A1, $18
	db $A0, $08
	db $9E, $10
	db $9B, $08
	db !return_from_sub

.unreached_1FF0:
	db !set_instrument, $21
	db !set_volume_l_and_r, $0C, $04
	db !change_instr_pitch, $0C
	db !fine_tune, $AB
	db !set_adsr, $88, $E0
	db !vibrato_with_delay, $04, $02, $17, $08
	db $80, $0A
	db !play_subsequence : dw .unreached_1FB3
	db !end_sequence

base off
arch 65816
.end: