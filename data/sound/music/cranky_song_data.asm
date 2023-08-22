;19 Cranky's Conga
;329654
cranky_song_data:
	dw !bgm_loc, $0495
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1317, .seq_13D9, .seq_1A0B, .seq_1484, .seq_1B84, .seq_1849, .seq_1392, .seq_1679
	db $90, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.subseq_1314:
	db $80, $10
	db !return_from_sub

.seq_1317:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_1314
	db !set_echo, $3A, $2B, $2B
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
.loop_point_1329:
	db !echo_off
	db !set_instrument, $00
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $3B, $3B
	db $96, $10
	db !echo_on
	db !set_instrument, $0C
	db !set_volume_l_and_r, $18, $04
	db !set_adsr, $FF, $E0
	db $9E, $08
	db !echo_off
	db !set_instrument, $00
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $28, $28
	db $96, $08
	db !set_volume_l_and_r, $3B, $3B
	db $96, $08
	db !echo_on
	db !set_instrument, $0C
	db !set_volume_l_and_r, $18, $04
	db !set_adsr, $FF, $E0
	db $9E, $10
	db $9E, $08
	db !echo_off
	db !set_instrument, $00
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $3B, $3B
	db $96, $10
	db !echo_on
	db !set_instrument, $0C
	db !set_volume_l_and_r, $18, $04
	db !set_adsr, $FF, $E0
	db $9E, $08
	db !echo_off
	db !set_instrument, $00
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $28, $28
	db $96, $08
	db !set_volume_l_and_r, $3B, $3B
	db $96, $08
	db !echo_on
	db !set_instrument, $0C
	db !set_volume_l_and_r, $18, $04
	db !set_adsr, $FF, $E0
	db $9E, $08
	db $9E, $10
	db !jump_to_sequence : dw .loop_point_1329

.seq_1392:
	db !play_subsequence : dw .subseq_1314
.loop_point_1395:
	db !change_instr_pitch, $00
	db !set_instrument, $17
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $8F, $D4
	db !echo_on
	db !pitch_slide_up, $00, $01, $2C, $26, $01
	db $9A, $0A
	db !pitch_slide_off
	db !echo_off
	db !change_instr_pitch, $05
	db !set_instrument, $19
	db !set_volume_l_and_r, $18, $0A
	db !set_adsr, $8F, $A0
	db $99, $03
	db $99, $03
	db $96, $08
	db $96, $08
	db $99, $08
	db $99, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $99, $04
	db $99, $04
	db $96, $08
	db $96, $08
	db $99, $08
	db $99, $08
	db $92, $08
	db $92, $08
	db !jump_to_sequence : dw .loop_point_1395

.seq_13D9:
	db !play_subsequence : dw .subseq_1314
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A6
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db $80, $70
	db !pitch_slide_down, $02, $01, $21, $0E, $01
	db $8D, $10
	db !set_adsr, $8F, $C0
	db !pitch_slide_off
	db !set_adsr, $8F, $96
	db !play_subsequence : dw .subseq_1459
.loop_point_13FB:
	db !set_adsr, $8F, $96
	db $86, $18
	db $86, $08
	db $8A, $10
	db $86, $10
	db $8B, $18
	db $8B, $08
	db $8F, $10
	db $8B, $10
	db $88, $18
	db $88, $08
	db $8B, $10
	db $88, $10
	db $8D, $18
	db $8D, $08
	db $91, $10
	db $8D, $10
	db $8A, $18
	db $8A, $08
	db $8D, $10
	db $8A, $10
	db $8B, $18
	db $8B, $08
	db $8F, $10
	db $8B, $10
	db $86, $18
	db $86, $08
	db $8D, $10
	db $8D, $10
	db $86, $0A
	db $80, $02
	db $86, $03
	db $80, $01
	db $92, $06
	db $80, $02
	db $92, $06
	db $80, $02
	db $92, $0C
	db $80, $04
	db !pitch_slide_down, $02, $01, $21, $0E, $01
	db $8D, $10
	db !set_adsr, $8F, $73
	db !pitch_slide_off
	db !jump_to_sequence : dw .loop_point_13FB

.subseq_1459:
	db $86, $18
	db $86, $08
	db $8A, $10
	db $86, $10
	db $8B, $18
	db $8B, $08
	db $8F, $10
	db $8B, $10
	db $86, $18
	db $86, $08
	db $8A, $10
	db $86, $08
	db $8A, $04
	db $8C, $04
	db $8D, $08
	db $8D, $08
	db $8B, $08
	db $8B, $08
	db $8A, $08
	db $8A, $08
	db $88, $10
	db !return_from_sub

.seq_1484:
	db !play_subsequence : dw .subseq_1314
	db !echo_on
	db !set_instrument, $28
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db !set_adsr, $8F, $F2
	db $80, $80
	db !play_subsequence : dw .subseq_1570
	db !play_subsequence : dw .subseq_14A1
.loop_point_1499:
	db $80, $02
	db !play_subsequence : dw .subseq_14A1
	db !jump_to_sequence : dw .loop_point_1499

.subseq_14A1:
	db $80, $06
	db !play_subsequence : dw .subseq_15FF
	db $80, $06
	db !play_subsequence : dw .subseq_15C2
	db $80, $06
	db !play_subsequence : dw .subseq_15C2
	db $80, $06
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $04
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $04
	db !set_volume_l_and_r, $0C, $18
	db $A0, $04
	db !set_volume_l_and_r, $08, $03
	db $A0, $02
	db !set_volume_l_and_r, $0C, $18
	db $A0, $04
	db !set_volume_l_and_r, $08, $03
	db $A0, $02
	db !set_volume_l_and_r, $0C, $18
	db $A0, $04
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $04
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db $80, $06
	db !play_subsequence : dw .subseq_163C
	db $80, $06
	db !play_subsequence : dw .subseq_15C2
	db $80, $06
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $04
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $0C
	db !set_volume_l_and_r, $0C, $18
	db $AA, $04
	db !set_volume_l_and_r, $08, $03
	db $AA, $04
	db !set_volume_l_and_r, $0C, $18
	db $AA, $04
	db !set_volume_l_and_r, $08, $03
	db $AA, $04
	db !set_volume_l_and_r, $0C, $18
	db $AA, $04
	db !set_volume_l_and_r, $08, $03
	db $AA, $1C
	db !return_from_sub

.subseq_1570:
	db $80, $08
	db !play_subsequence : dw .subseq_15FF
	db $80, $06
	db !play_subsequence : dw .subseq_15C2
	db $80, $06
	db !play_subsequence : dw .subseq_15FF
	db $80, $06
	db !play_subsequence : dw .subseq_1585
	db !return_from_sub

.subseq_1585:
	db !set_volume_l_and_r, $0C, $18
	db $A0, $04
	db !set_volume_l_and_r, $08, $03
	db $A0, $0C
	db !set_volume_l_and_r, $0C, $18
	db $A0, $04
	db !set_volume_l_and_r, $08, $03
	db $A0, $0C
	db !set_volume_l_and_r, $0C, $18
	db $A0, $04
	db !set_volume_l_and_r, $08, $03
	db $A0, $04
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db !return_from_sub

.subseq_15C2:
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $04
	db !set_volume_l_and_r, $0C, $18
	db $9B, $04
	db !set_volume_l_and_r, $08, $03
	db $9B, $02
	db !set_volume_l_and_r, $0C, $18
	db $9B, $04
	db !set_volume_l_and_r, $08, $03
	db $9B, $02
	db !set_volume_l_and_r, $0C, $18
	db $9B, $04
	db !set_volume_l_and_r, $08, $03
	db $9B, $02
	db !return_from_sub

.subseq_15FF:
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9E, $04
	db !set_volume_l_and_r, $08, $03
	db $9E, $04
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !return_from_sub

.subseq_163C:
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $04
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !return_from_sub

.seq_1679:
	db !play_subsequence : dw .subseq_1314
	db $80, $80
	db !echo_on
	db !set_instrument, $28
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db !set_adsr, $8F, $F2
	db !set_volume_l_and_r, $0C, $18
	db !play_subsequence : dw .subseq_1763
	db !play_subsequence : dw .subseq_1699
.loop_point_1691:
	db $80, $05
	db !play_subsequence : dw .subseq_1699
	db !jump_to_sequence : dw .loop_point_1691

.subseq_1699:
	db $80, $03
	db !play_subsequence : dw .subseq_17F2
	db $80, $03
	db !play_subsequence : dw .subseq_17B5
	db $80, $03
	db !play_subsequence : dw .subseq_17B5
	db $80, $03
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $04
	db !set_volume_l_and_r, $0C, $18
	db $9B, $04
	db !set_volume_l_and_r, $08, $03
	db $9B, $07
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $02
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $03
	db !set_volume_l_and_r, $0C, $18
	db $9B, $04
	db !set_volume_l_and_r, $08, $03
	db $9B, $07
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db $80, $03
	db !play_subsequence : dw .subseq_17F2
	db $80, $03
	db !play_subsequence : dw .subseq_17B5
	db $80, $03
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $0C
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $0C
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $07
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $01
	db $96, $04
	db !set_volume_l_and_r, $08, $03
	db $96, $0C
	db !set_volume_l_and_r, $0C, $18
	db $A2, $04
	db !set_volume_l_and_r, $08, $03
	db $A2, $04
	db !set_volume_l_and_r, $0C, $18
	db $A2, $04
	db !set_volume_l_and_r, $08, $03
	db $A2, $04
	db !set_volume_l_and_r, $0C, $18
	db $A2, $04
	db !set_volume_l_and_r, $08, $03
	db $A2, $1C
	db !return_from_sub

.subseq_1763:
	db $80, $08
	db !play_subsequence : dw .subseq_17F2
	db $80, $03
	db !play_subsequence : dw .subseq_17B5
	db $80, $03
	db !play_subsequence : dw .subseq_17F2
	db $80, $03
	db !play_subsequence : dw .subseq_1778
	db !return_from_sub

.subseq_1778:
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9D, $04
	db !set_volume_l_and_r, $08, $03
	db $9D, $07
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $02
	db !return_from_sub

.subseq_17B5:
	db !set_volume_l_and_r, $0C, $18
	db $9B, $04
	db !set_volume_l_and_r, $08, $03
	db $9B, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9B, $04
	db !set_volume_l_and_r, $08, $03
	db $9B, $0C
	db !set_volume_l_and_r, $0C, $18
	db $9B, $04
	db !set_volume_l_and_r, $08, $03
	db $9B, $07
	db !set_volume_l_and_r, $0C, $18
	db $97, $04
	db !set_volume_l_and_r, $08, $03
	db $97, $02
	db !set_volume_l_and_r, $0C, $18
	db $97, $04
	db !set_volume_l_and_r, $08, $03
	db $97, $02
	db !set_volume_l_and_r, $0C, $18
	db $97, $04
	db !set_volume_l_and_r, $08, $03
	db $97, $02
	db !return_from_sub

.subseq_17F2:
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $0C
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $0C
	db !set_volume_l_and_r, $0C, $18
	db $99, $04
	db !set_volume_l_and_r, $08, $03
	db $99, $07
	db !set_volume_l_and_r, $0C, $18
	db $96, $04
	db !set_volume_l_and_r, $08, $03
	db $96, $02
	db !set_volume_l_and_r, $0C, $18
	db $96, $04
	db !set_volume_l_and_r, $08, $03
	db $96, $02
	db !set_volume_l_and_r, $0C, $18
	db $96, $04
	db !set_volume_l_and_r, $08, $03
	db $96, $02
	db !return_from_sub

.subseq_182F:
	db !set_instrument, $28
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db !set_adsr, $DE, $D2
	db !set_volume_l_and_r, $32, $14
	db !return_from_sub

.subseq_183C:
	db !set_instrument, $29
	db !change_instr_pitch, $FF
	db !fine_tune, $F5
	db !set_volume_l_and_r, $0B, $18
	db !set_adsr, $ED, $6B
	db !return_from_sub

.seq_1849:
	db !play_subsequence : dw .subseq_1314
	db !echo_on
	db $80, $0B
	db !loop_subsequence, $05 : dw .subseq_19C4
	db !play_subsequence : dw .subseq_1999
	db !vibrato_with_delay, $03, $02, $0B, $05
.loop_point_185B:
	db !play_subsequence : dw .subseq_182F
	db $9E, $05
	db !play_subsequence : dw .subseq_183C
	db $9E, $03
	db !play_subsequence : dw .subseq_182F
	db $A0, $05
	db !play_subsequence : dw .subseq_183C
	db $A0, $03
	db !play_subsequence : dw .subseq_182F
	db $A2, $05
	db !play_subsequence : dw .subseq_183C
	db $A2, $0B
	db !play_subsequence : dw .subseq_182F
	db $A3, $05
	db !play_subsequence : dw .subseq_183C
	db $A3, $03
	db !play_subsequence : dw .subseq_182F
	db $A0, $05
	db !play_subsequence : dw .subseq_183C
	db $A0, $13
	db !play_subsequence : dw .subseq_182F
	db $A2, $05
	db !play_subsequence : dw .subseq_183C
	db $A2, $03
	db !play_subsequence : dw .subseq_182F
	db $9E, $05
	db !play_subsequence : dw .subseq_183C
	db $9E, $33
	db !play_subsequence : dw .subseq_182F
	db $A0, $05
	db !play_subsequence : dw .subseq_183C
	db $A0, $03
	db !play_subsequence : dw .subseq_182F
	db $A2, $05
	db !play_subsequence : dw .subseq_183C
	db $A2, $03
	db !play_subsequence : dw .subseq_182F
	db $A3, $05
	db !play_subsequence : dw .subseq_183C
	db $A3, $0B
	db !play_subsequence : dw .subseq_182F
	db $A5, $05
	db !play_subsequence : dw .subseq_183C
	db $A5, $03
	db !play_subsequence : dw .subseq_182F
	db $A2, $05
	db !play_subsequence : dw .subseq_183C
	db $A2, $13
	db !play_subsequence : dw .subseq_182F
	db $A3, $05
	db !play_subsequence : dw .subseq_183C
	db $A3, $03
	db !play_subsequence : dw .subseq_182F
	db $A0, $05
	db !play_subsequence : dw .subseq_183C
	db $A0, $33
	db !play_subsequence : dw .subseq_182F
	db $A2, $05
	db !play_subsequence : dw .subseq_183C
	db $A2, $03
	db !play_subsequence : dw .subseq_182F
	db $A3, $05
	db !play_subsequence : dw .subseq_183C
	db $A3, $03
	db !play_subsequence : dw .subseq_182F
	db $A5, $05
	db !play_subsequence : dw .subseq_183C
	db $A5, $0B
	db !play_subsequence : dw .subseq_182F
	db $A7, $05
	db !play_subsequence : dw .subseq_183C
	db $A7, $03
	db !play_subsequence : dw .subseq_182F
	db $A5, $05
	db !play_subsequence : dw .subseq_183C
	db $A5, $13
	db !play_subsequence : dw .subseq_182F
	db $A9, $05
	db !play_subsequence : dw .subseq_183C
	db $A9, $03
	db !play_subsequence : dw .subseq_182F
	db $AA, $05
	db !play_subsequence : dw .subseq_183C
	db $AA, $2B
	db !play_subsequence : dw .subseq_182F
	db $80, $05
	db !play_subsequence : dw .subseq_183C
	db $80, $03
	db !play_subsequence : dw .subseq_182F
	db $9E, $05
	db !play_subsequence : dw .subseq_183C
	db $9E, $03
	db !play_subsequence : dw .subseq_182F
	db $A0, $05
	db !play_subsequence : dw .subseq_183C
	db $A0, $03
	db !play_subsequence : dw .subseq_182F
	db $A2, $05
	db !play_subsequence : dw .subseq_183C
	db $A2, $0B
	db !play_subsequence : dw .subseq_182F
	db $A3, $05
	db !play_subsequence : dw .subseq_183C
	db $A3, $03
	db !play_subsequence : dw .subseq_182F
	db $A0, $05
	db !play_subsequence : dw .subseq_183C
	db $A0, $13
	db !play_subsequence : dw .subseq_182F
	db $9D, $05
	db !play_subsequence : dw .subseq_183C
	db $9D, $03
	db !play_subsequence : dw .subseq_182F
	db $9E, $05
	db !play_subsequence : dw .subseq_183C
	db $9E, $2B
	db $80, $08
	db $80, $0B
	db !set_volume_l_and_r, $0B, $18
	db !set_adsr, $FE, $E0
	db !play_subsequence : dw .subseq_1A7D
	db $9D, $08
	db $9E, $2D
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_185B

.subseq_1999:
	db !set_instrument, $AF
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !set_volume_l_and_r, $07, $02
	db !set_adsr, $EE, $B2
	db $9E, $10
	db !set_instrument, $2B
	db !change_instr_pitch, $EC
	db !fine_tune, $1B
	db !set_volume_l_and_r, $0B, $04
	db !set_adsr, $EE, $B0
	db $9E, $10
	db !set_instrument, $16
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_volume_l_and_r, $11, $06
	db !set_adsr, $EE, $75
	db $9E, $05
	db !return_from_sub

.subseq_19C4:
	db !set_instrument, $AF
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !set_volume_l_and_r, $07, $02
	db !set_adsr, $EE, $B2
	db $9E, $10
	db !set_instrument, $2B
	db !change_instr_pitch, $EC
	db !fine_tune, $1B
	db !set_volume_l_and_r, $0B, $04
	db !set_adsr, $EE, $B0
	db $9E, $10
	db !set_instrument, $16
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_volume_l_and_r, $11, $06
	db !set_adsr, $EE, $75
	db $9E, $10
	db !set_instrument, $2B
	db !change_instr_pitch, $F8
	db !fine_tune, $1B
	db !set_volume_l_and_r, $0B, $04
	db !set_adsr, $EE, $B0
	db $9E, $08
	db !set_instrument, $AF
	db !change_instr_pitch, $06
	db !fine_tune, $E3
	db !set_volume_l_and_r, $0B, $00
	db !set_adsr, $EE, $B1
	db $9E, $08
	db !return_from_sub

.seq_1A0B:
	db !play_subsequence : dw .subseq_1314
	db !echo_on
	db !loop_subsequence, $05 : dw .subseq_1B3D
	db !play_subsequence : dw .subseq_1B12
.loop_point_1A16:
	db !set_instrument, $29
	db !change_instr_pitch, $FF
	db !fine_tune, $F5
	db !set_volume_l_and_r, $46, $1E
	db !set_adsr, $EE, $6B
	db !vibrato_with_delay, $03, $02, $0B, $05
	db $9E, $08
	db $A0, $08
	db $A2, $10
	db $A3, $08
	db $A0, $18
	db $A2, $08
	db $9E, $30
	db $80, $08
	db $A0, $08
	db $A2, $08
	db $A3, $10
	db $A5, $08
	db $A2, $18
	db $A3, $08
	db $A0, $30
	db $80, $08
	db $A2, $08
	db $A3, $08
	db $A5, $10
	db $A7, $08
	db $A5, $18
	db $A9, $08
	db $AA, $30
	db $80, $08
	db $9E, $08
	db $A0, $08
	db $A2, $10
	db $A3, $08
	db $A0, $18
	db $9D, $08
	db $9E, $38
	db !set_volume_l_and_r, $46, $1E
	db !set_adsr, $FE, $E0
	db !play_subsequence : dw .subseq_1A7D
	db $9D, $08
	db $9E, $38
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1A16

.subseq_1A7D:
	db !set_instrument, $01
	db !change_instr_pitch, $F6
	db !fine_tune, $F2
	db $9E, $08
	db $A0, $08
	db !set_instrument, $02
	db !change_instr_pitch, $F2
	db !fine_tune, $18
	db $A2, $10
	db !set_instrument, $03
	db !change_instr_pitch, $F1
	db !fine_tune, $00
	db $A3, $08
	db $A0, $18
	db !set_instrument, $04
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db $A2, $08
	db $9E, $38
	db !set_instrument, $01
	db !change_instr_pitch, $F6
	db !fine_tune, $F2
	db $A0, $08
	db $A2, $08
	db !set_instrument, $02
	db !change_instr_pitch, $F2
	db !fine_tune, $18
	db $A3, $10
	db !set_instrument, $03
	db !change_instr_pitch, $F1
	db !fine_tune, $00
	db $A5, $08
	db $A2, $18
	db !set_instrument, $04
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db $A3, $08
	db $A0, $38
	db !set_instrument, $01
	db !change_instr_pitch, $F6
	db !fine_tune, $F2
	db $A2, $08
	db $A3, $08
	db !set_instrument, $02
	db !change_instr_pitch, $F2
	db !fine_tune, $18
	db $A5, $10
	db !set_instrument, $03
	db !change_instr_pitch, $F1
	db !fine_tune, $00
	db $A7, $08
	db $A5, $18
	db !set_instrument, $04
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db $A9, $08
	db $AA, $38
	db !set_instrument, $01
	db !change_instr_pitch, $F6
	db !fine_tune, $F2
	db $9E, $08
	db $A0, $08
	db !set_instrument, $02
	db !change_instr_pitch, $F2
	db !fine_tune, $18
	db $A2, $10
	db !set_instrument, $03
	db !change_instr_pitch, $F1
	db !fine_tune, $00
	db $A3, $08
	db $A0, $18
	db !set_instrument, $04
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !return_from_sub

.subseq_1B12:
	db !set_instrument, $AF
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !set_volume_l_and_r, $06, $12
	db !set_adsr, $EE, $B2
	db $9E, $10
	db !set_instrument, $2B
	db !change_instr_pitch, $EC
	db !fine_tune, $1B
	db !set_volume_l_and_r, $0A, $1E
	db !set_adsr, $EE, $B0
	db $9E, $10
	db !set_instrument, $16
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $EE, $75
	db $9E, $10
	db !return_from_sub

.subseq_1B3D:
	db !set_instrument, $AF
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !set_volume_l_and_r, $06, $12
	db !set_adsr, $EE, $B2
	db $9E, $10
	db !set_instrument, $2B
	db !change_instr_pitch, $EC
	db !fine_tune, $1B
	db !set_volume_l_and_r, $0A, $1E
	db !set_adsr, $EE, $B0
	db $9E, $10
	db !set_instrument, $16
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $EE, $75
	db $9E, $10
	db !set_instrument, $2B
	db !change_instr_pitch, $F8
	db !fine_tune, $1B
	db !set_volume_l_and_r, $0A, $1E
	db !set_adsr, $EE, $B0
	db $9E, $08
	db !set_instrument, $AF
	db !change_instr_pitch, $06
	db !fine_tune, $E3
	db !set_volume_l_and_r, $0A, $1E
	db !set_adsr, $EE, $B1
	db $9E, $08
	db !return_from_sub

.seq_1B84:
	db !play_subsequence : dw .subseq_1314
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $0B, $11
	db !set_adsr, $D8, $C4
	db !echo_on
	db $92, $80
	db $92, $80
	db $92, $80
.loop_point_1B9A:
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_variable_note_1, $9E
	db !play_subsequence : dw .subseq_1BC9
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1BC9
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1BC9
	db !set_variable_note_1, $99
	db !play_subsequence : dw .subseq_1BC9
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_1BC9
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1BC9
	db !set_variable_note_1, $9E
	db !loop_subsequence, $02 : dw .subseq_1BC9
	db !jump_to_sequence : dw .loop_point_1B9A

.subseq_1BC9:
	db !set_instrument, $AF
	db !change_instr_pitch, $FA
	db !fine_tune, $E3
	db !set_adsr, $EE, $B2
	db !set_volume_l_and_r, $06, $12
	db $E0, $08
	db !set_volume_l_and_r, $06, $02
	db $E0, $08
	db !set_instrument, $2B
	db !change_instr_pitch, $EC
	db !fine_tune, $1B
	db !set_adsr, $EE, $B0
	db !set_volume_l_and_r, $0A, $1E
	db $E0, $08
	db !set_volume_l_and_r, $0A, $03
	db $E0, $08
	db !set_instrument, $16
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_adsr, $EE, $75
	db !set_volume_l_and_r, $14, $28
	db $E0, $08
	db !set_volume_l_and_r, $0F, $07
	db $E0, $08
	db !set_instrument, $2B
	db !change_instr_pitch, $F8
	db !fine_tune, $1B
	db !set_adsr, $EE, $B0
	db !set_volume_l_and_r, $0A, $1E
	db $E0, $04
	db !set_volume_l_and_r, $0A, $03
	db $E0, $04
	db !set_instrument, $AF
	db !change_instr_pitch, $06
	db !fine_tune, $E3
	db !set_adsr, $EE, $B1
	db !set_volume_l_and_r, $0A, $1E
	db $E0, $04
	db !set_volume_l_and_r, $0A, $03
	db $E0, $04
	db !return_from_sub

base off
arch 65816
.end: