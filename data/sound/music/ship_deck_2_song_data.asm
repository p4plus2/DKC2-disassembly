;12 Snakey Chantey
;324760
ship_deck_2_song_data:
	dw !bgm_loc, $0887
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_18F7, .seq_225C, .seq_1F56, .seq_1D36, .seq_2114, .seq_1BEA, .seq_2396, .seq_1A8E
	db $C6, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: Snakey Chantey
	dw .chn_ptrs_131C	;01: Lost Life
	dw .chn_ptrs_132E	;02: Diddy Victory
	dw .chn_ptrs_1340	;03: Dixie Victory
	dw .chn_ptrs_1352	;04: Hit Target

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_1770, .seq_17EE, .seq_180A, .seq_188A, .seq_1853, .seq_1869, .seq_1831, .seq_18AD
	db $C6, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_152A, .seq_15B0, .seq_162F, .seq_1673, .seq_157D, .seq_1754, .seq_1738, .seq_1617
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
if !version == 1
	dw .seq_140C, .seq_1468, .seq_14BB, .seq_1511, .seq_1448, .seq_1364, .seq_1364, .seq_1510
else
	dw .seq_140C, .seq_1468, .seq_14BB, .seq_1511, .seq_1448, .seq_13F2, .seq_13F1, .seq_1510
endif
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_1365, .seq_139A, .seq_13A8, .seq_13C5, .seq_13D1, .seq_13F1, .seq_13E6, .seq_13F2
	db $C0, $FF	;music tempo, sound effect tempo

if !version == 1
.seq_1364:
	db !end_sequence
endif

.seq_1365:
	db !play_subsequence : dw .subseq_18B8
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $41
	db !set_instrument, $A5
	db $9E, $09
	db !set_instrument, $00
	db $97, $07
	db $97, $09
	db !set_instrument, $A5
	db $9E, $10
	db $9E, $07
	db $9E, $05
	db !set_instrument, $00
	db $97, $05
	db $97, $06
	db !set_instrument, $A5
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

.seq_139A:
	db !play_subsequence : dw .subseq_1624
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13A8:
	db !set_voice_parameters, $33, $FC, $19, $14, $28, $8F, $E0
.loop_point_13B0:
	db $A0, $09
	db $9B, $07
	db $9D, $09
	db $A0, $10
	db $A2, $07
	db $A4, $05
	db $A7, $04
	db $A9, $06
	db $AC, $1F
	db $AC, $10
	db !end_sequence

.seq_13C5:
	db !play_subsequence : dw .subseq_13DD
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $2F
	db !end_sequence

.seq_13D1:
	db !play_subsequence : dw .subseq_13DD
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $2F
	db !end_sequence

.subseq_13DD:
	db !play_subsequence : dw .subseq_18ED
	db !set_vol_single_val, $1E
	db !set_adsr, $AF, $AE
	db !return_from_sub

.seq_13E6:
	db !play_subsequence : dw .subseq_13DD
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $2F
.seq_13F1:
	db !end_sequence

.seq_13F2:
	db !set_voice_parameters, $33, $FC, $19, $0F, $08, $8F, $E0
	db $80, $14
	db !jump_to_sequence : dw .loop_point_13B0

.subseq_13FF:
	db !play_subsequence : dw .subseq_18ED
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !return_from_sub

.seq_140C:
	db !play_subsequence : dw .subseq_18B8
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_13FF
	db !change_instr_pitch, $00
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_142C
.loop_point_141D:
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_141D

.subseq_142C:
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9F, $08
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $08
	db $99, $08
	db !return_from_sub

.subseq_143B:
	db !play_subsequence : dw .subseq_18ED
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !return_from_sub

.seq_1448:
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_143B
	db !change_instr_pitch, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $AF, $B2
	db !set_default_duration, $18
	db $9A
	db $9A
	db $9A
	db $9A
	db !default_duration_off
	db !set_adsr, $8F, $F8
.loop_point_1461:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .loop_point_1461

.seq_1468:
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_18ED
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_1624
	db !set_default_duration, $08
	db !set_variable_note_1, $8A
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
.loop_point_1488:
	db !set_variable_note_1, $8C
	db !loop_subsequence, $10 : dw .subseq_14A3
	db !set_variable_note_1, $85
	db !loop_subsequence, $08 : dw .subseq_14A3
	db !set_variable_note_1, $88
	db !loop_subsequence, $04 : dw .subseq_14A3
	db !set_variable_note_1, $8A
	db !loop_subsequence, $04 : dw .subseq_14A3
	db !jump_to_sequence : dw .loop_point_1488

.subseq_14A3:
	db $E0
	db !return_from_sub

.subseq_14A5:
	db !pitch_slide_up, $00, $01, $08, $2B, $00
	db $9F, $09
	db !pitch_slide_off
	db $9F, $07
	db !return_from_sub

.subseq_14B1:
	db !pitch_slide_up, $00, $01, $08, $39, $00
	db $A4, $09
	db !pitch_slide_off
	db !return_from_sub

.seq_14BB:
	db !set_vol_single_val, $64
	db !play_subsequence : dw .subseq_18ED
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_volume_l_and_r, $32, $46
.loop_point_14CC:
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_adsr, $EF, $80
	db $80, $58
	db !pitch_slide_up, $01, $02, $08, $21, $00
	db $A2, $10
	db $A2, $10
	db $A2, $0F
	db !loop_subsequence, $02 : dw .subseq_14A5
	db !play_subsequence : dw .subseq_14B1
	db !vibrato_with_delay, $04, $02, $11, $05
	db $A4, $10
	db $A4, $07
	db !play_subsequence : dw .subseq_14B1
	db $A4, $08
	db !pitch_slide_up, $01, $02, $08, $2C, $00
	db !set_default_duration, $10
	db $A7
	db $A7
	db $A7
	db !set_adsr, $EE, $40
	db $A7
	db !set_adsr, $EC, $20
	db $A7
	db !set_adsr, $EB, $00
	db $A7
	db !default_duration_off
.seq_1510:
	db !end_sequence

.seq_1511:
	db $80, $05
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_13FF
	db $80, $0A
	db !set_volume_l_and_r, $1C, $12
	db !jump_to_sequence : dw .loop_point_14CC

.subseq_1520:
	db !play_subsequence : dw .subseq_18ED
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db !return_from_sub

.seq_152A:
	db !play_subsequence : dw .subseq_18B8
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_1520
	db $9E, $20
	db !pitch_slide_off
	db !set_adsr, $FF, $F2
.loop_point_1538:
	db !change_instr_pitch, $00
	db !loop_subsequence, $0C : dw .subseq_153F
	db !end_sequence

.subseq_153F:
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db $94, $10
	db !set_instrument, $A5
	db !set_vol_single_val, $64
	db $9E, $10
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $96, $09
	db !set_instrument, $A5
	db !set_vol_single_val, $26
	db $A3, $10
	db $A2, $07
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !echo_off
	db $98, $09
	db !set_instrument, $A5
	db !set_vol_single_val, $26
	db $A1, $07
	db !set_vol_single_val, $64
	db $9E, $10
	db !set_vol_single_val, $2A
	db $A2, $09
	db $A3, $07
	db !return_from_sub

.subseq_1573:
	db !play_subsequence : dw .subseq_18ED
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db !return_from_sub

.seq_157D:
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_1573
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_1594
	db !default_duration_off
	db !end_sequence

.subseq_1594:
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

.subseq_15A3:
	db !play_subsequence : dw .subseq_18ED
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !return_from_sub

.seq_15B0:
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_15A3
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !set_adsr, $8E, $E0
	db !loop_subsequence, $06 : dw .subseq_15C1
	db !end_sequence

.subseq_15C1:
	db !play_subsequence : dw .subseq_15CE
	db !play_subsequence : dw .subseq_15F4
	db !play_subsequence : dw .subseq_15CE
	db !play_subsequence : dw .subseq_15FF
	db !return_from_sub

.subseq_15CE:
	db !set_instrument, $05
	db !set_vol_single_val, $4A
	db !pitch_slide_down, $01, $01, $0B, $0B, $00
	db $8D
	db !set_instrument, $07
	db !set_vol_single_val, $11
	db !pitch_slide_up, $02, $01, $16, $16, $00
	db $9A
	db !set_instrument, $01
	db $88
	db !set_instrument, $07
	db $9A
	db !pitch_slide_off
	db !set_instrument, $02
	db !set_vol_single_val, $12
	db $87
	db !set_instrument, $03
	db $88
	db !return_from_sub

.subseq_15F4:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db $82
	db !return_from_sub

.subseq_15FF:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db $8E
	db !return_from_sub

.subseq_160A:
	db !play_subsequence : dw .subseq_18ED
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db !return_from_sub

.seq_1617:
	db !set_vol_single_val, $64
	db !play_subsequence : dw .subseq_160A
	db $80, $09
	db !set_adsr, $FB, $32
	db !jump_to_sequence : dw .loop_point_1538

.subseq_1624:
	db !play_subsequence : dw .subseq_18ED
	db !change_instr_pitch_rel, $F4
	db !set_vol_single_val, $7B
	db !set_adsr, $CE, $AF
	db !return_from_sub

.seq_162F:
	db $80, $05
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_1520
	db $9E, $1B
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_1624
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1664
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_1664
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1664
	db !end_sequence

.subseq_1655:
	db $E0, $0C
	db $80, $04
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db !return_from_sub

.subseq_1664:
	db !play_subsequence : dw .subseq_1655
	db $80, $24
	db !play_subsequence : dw .subseq_1655
	db $80, $04
	db $89, $10
	db $8A, $10
	db !return_from_sub

.seq_1673:
	db $80, $05
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_1573
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1698
	db !set_volume_l_and_r, $14, $1E
	db !play_subsequence : dw .subseq_1690
	db !end_sequence

.subseq_1690:
	db !play_subsequence : dw .subseq_18E6
	db !loop_subsequence, $02 : dw .subseq_169F
	db !return_from_sub

.subseq_1698:
	db !play_subsequence : dw .subseq_16EF
	db !play_subsequence : dw .subseq_16CD
	db !return_from_sub

.subseq_169F:
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

.subseq_16CD:
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
.subseq_16EF:
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

.seq_1738:
	db $80, $05
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_15A3
	db !echo_on
	db $80, $02
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1698
	db !set_volume_l_and_r, $0B, $06
	db !play_subsequence : dw .subseq_1690
	db !end_sequence

.seq_1754:
	db $80, $05
	db !set_vol_single_val, $28
	db !play_subsequence : dw .subseq_160A
	db !echo_on
	db $80, $14
	db !set_volume_l_and_r, $04, $0B
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1698
	db !set_volume_l_and_r, $03, $07
	db !play_subsequence : dw .subseq_1690
	db !end_sequence

.seq_1770:
	db !play_subsequence : dw .subseq_18B8
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $40
	db !play_subsequence : dw .subseq_20FB
	db !set_instrument, $00
	db !set_vol_single_val, $2A
	db !set_adsr, $8F, $E0
	db $99, $10
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $40
	db $9A, $10
	db !set_instrument, $00
	db !set_vol_single_val, $2A
	db !set_adsr, $8F, $E0
	db $99, $09
	db $99, $07
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $40
	db $9A, $09
	db !set_instrument, $00
	db !set_vol_single_val, $2A
	db !set_adsr, $8F, $E0
	db $99, $17
	db $99, $07
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !play_subsequence : dw .subseq_20FB
	db !set_vol_single_val, $3C
	db $9A, $09
	db $9A, $07
	db !play_subsequence : dw .subseq_20FB
	db !set_vol_single_val, $3C
	db $9A, $09
	db $9A, $07
	db !play_subsequence : dw .subseq_20FB
	db !set_vol_single_val, $3C
	db $9A, $09
	db $9A, $07
	db !set_instrument, $36
	db !set_adsr, $8F, $CB
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !set_vol_single_val, $1E
	db $8F, $03
	db !set_vol_single_val, $28
	db $90, $03
	db !set_vol_single_val, $32
	db $91, $03
	db !set_adsr, $8F, $C8
	db !set_vol_single_val, $4B
	db $91, $10
	db !pitch_slide_off
	db !end_sequence

.seq_17EE:
	db !set_instrument, $18
	db !set_vol_single_val, $58
	db !set_adsr, $8D, $F2
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db $80, $09
	db $8B, $10
	db $8B, $10
	db $8B, $09
	db $8E, $07
	db $8F, $09
	db $90, $17
	db $84, $40
	db !end_sequence

.seq_180A:
	db !play_subsequence : dw .subseq_18D5
	db !echo_on
	db !set_volume_l_and_r, $04, $0C
	db $80, $09
	db $A1, $10
	db $A1, $10
	db $97, $09
	db $9A, $07
	db $9B, $09
	db $9C, $17
	db $9A, $0F
	db !set_variable_note_1, $9A
	db !loop_subsequence, $06 : dw .subseq_1887
	db !set_default_duration, $03
	db $99
	db $97
	db $95
	db $90
	db $8E
	db $8B
	db !default_duration_off
	db !end_sequence

.seq_1831:
	db !play_subsequence : dw .subseq_18D5
	db !echo_on
	db !set_volume_l_and_r, $04, $0C
	db $80, $09
	db $9E, $10
	db $9E, $40
	db $97, $06
	db !set_variable_note_1, $97
	db !loop_subsequence, $07 : dw .subseq_1887
	db !set_volume_l_and_r, $07, $02
	db !set_default_duration, $03
	db $99
	db $97
	db $95
	db $90
	db $8E
	db $8B
	db !default_duration_off
	db !end_sequence

.seq_1853:
	db !play_subsequence : dw .subseq_18D5
	db !echo_on
	db !set_volume_l_and_r, $04, $0C
	db $80, $09
	db $9B, $10
	db $9B, $40
	db $94, $09
	db !set_variable_note_1, $94
	db !loop_subsequence, $07 : dw .subseq_1887
	db !end_sequence

.seq_1869:
	db !play_subsequence : dw .subseq_18D5
	db !echo_on
	db !set_volume_l_and_r, $04, $0C
	db $80, $09
	db $97, $10
	db $97, $10
	db !change_instr_pitch_rel, $F4
	db $97, $09
	db $9A, $07
	db $9B, $09
	db $9C, $17
	db !set_variable_note_1, $90
	db !loop_subsequence, $08 : dw .subseq_1887
	db !end_sequence

.subseq_1887:
	db $E0, $0C
	db !return_from_sub

.seq_188A:
	db !set_volume_l_and_r, $10, $20
.loop_point_188D:
	db !play_subsequence : dw .subseq_18E6
	db !set_adsr, $8F, $E0
	db !echo_on
	db $9E, $05
	db $A0, $04
	db $A1, $09
	db $A0, $07
	db $9E, $09
	db $9B, $05
	db $80, $02
	db $97, $09
	db $9A, $07
	db $9B, $09
	db $9C, $19
	db $9A, $30
	db !end_sequence

.seq_18AD:
	db $80, $11
	db !set_volume_l_and_r, $0B, $06
	db !jump_to_sequence : dw .loop_point_188D

.subseq_18B5:
	db $80, $10
	db !return_from_sub

.subseq_18B8:
	db !set_echo, $32, $06, $06
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.subseq_18C6:
	db !set_adsr, $8C, $8E
	db !set_instrument, $21
	db !change_instr_pitch, $18
	db !fine_tune, $AB
	db !vibrato_with_delay, $05, $02, $0C, $03
	db !return_from_sub

.subseq_18D5:
	db !set_instrument, $34
	db !change_instr_pitch, $03
	db !fine_tune, $FE
	db !set_adsr, $8F, $E0
	db !return_from_sub

.subseq_18DF:
	db !set_instrument, $1B
	db !change_instr_pitch, $08
	db !fine_tune, $02
	db !return_from_sub

.subseq_18E6:
	db !set_instrument, $1B
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !return_from_sub

.subseq_18ED:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_18F7:
	db !echo_delay, $04
	db !play_subsequence : dw .subseq_18B5
	db !play_subsequence : dw .subseq_18B8
	db !set_master_volume_indirect, $58
	db !set_volume_presets, $18, $0C, $03, $09
	db !set_volume_l_and_r, $0F, $08
	db !play_subsequence : dw .subseq_18C6
	db !echo_on
	db $9E, $08
	db $9D, $08
	db !play_subsequence : dw .subseq_1A79
	db !play_subsequence : dw .subseq_1A21
	db $9E, $20
	db !echo_on
	db $80, $80
.loop_point_191C:
	db !vibrato_off
	db !play_subsequence : dw .subseq_18D5
	db !set_adsr, $8F, $F5
	db !loop_subsequence, $02 : dw .subseq_19BD
	db !play_subsequence : dw .subseq_19AB
	db !play_subsequence : dw .subseq_1930
	db !jump_to_sequence : dw .loop_point_191C

.subseq_1930:
	db !play_subsequence : dw .subseq_19EA
	db !play_subsequence : dw .subseq_19FC
	db !play_subsequence : dw .subseq_19EA
	db !play_subsequence : dw .subseq_1998
	db !play_subsequence : dw .subseq_1965
	db !loop_subsequence, $03 : dw .subseq_195C
	db !play_subsequence : dw .subseq_1947
	db !return_from_sub

.subseq_1947:
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1BCC
	db !set_variable_note_1, $95
	db !play_subsequence : dw .subseq_1BCC
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_1BCC
	db !set_variable_note_1, $97
	db !play_subsequence : dw .subseq_1BCC
	db !return_from_sub

.subseq_195C:
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1B9B
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.subseq_1965:
	db !set_variable_note_1, $92
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BBC
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BB3
	db !set_variable_note_1, $96
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !load_volume_preset_1
	db $96, $09
	db $94, $0B
	db !set_volume_l_and_r, $03, $09
	db $94, $05
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BCC
	db !load_volume_preset_1
	db $91, $09
	db $92, $0B
	db !load_volume_preset_2
	db $92, $0C
	db !return_from_sub

.subseq_1998:
	db !set_variable_note_1, $94
	db !loop_subsequence, $04 : dw .subseq_1BCC
	db !set_variable_note_1, $96
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !set_variable_note_1, $94
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !return_from_sub

.subseq_19AB:
	db !load_volume_preset_2
	db $92, $0B
	db !set_volume_l_and_r, $04, $01
	db $92, $05
	db !play_subsequence : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1B92
	db !play_subsequence : dw .subseq_1B86
	db !return_from_sub

.subseq_19BD:
	db !play_subsequence : dw .subseq_19FC
	db !play_subsequence : dw .subseq_19EA
	db !play_subsequence : dw .subseq_19FC
	db !play_subsequence : dw .subseq_19CA
	db !return_from_sub

.subseq_19CA:
	db $80, $09
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BBC
	db !load_volume_preset_1
	db $92, $0B
	db !load_volume_preset_2
	db $92, $0A
	db !set_volume_l_and_r, $1B, $0E
	db $8C, $02
	db $95, $09
	db $94, $10
	db $92, $07
	db $8F, $09
	db $92, $07
	db !return_from_sub

.subseq_19EA:
	db $80, $09
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1BC5
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BBC
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.subseq_19FC:
	db !load_volume_preset_2
	db $92, $09
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_1BC5
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BBC
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.subseq_1A0F:
	db $A2, $10
	db $A2, $08
	db $A0, $08
	db $A2, $10
	db !set_default_duration, $08
	db $A2
	db $A0
	db $A2
	db $A0
	db $A2
	db $A3
	db !default_duration_off
	db !return_from_sub

.subseq_1A21:
	db !play_subsequence : dw .subseq_1A0F
	db $A5, $10
	db $A2, $10
	db $9E, $10
	db $9E, $08
	db $9D, $08
	db $9E, $10
	db $9E, $08
	db $9D, $08
	db $9E, $08
	db $9D, $08
	db $9E, $08
	db $A0, $08
	db $A2, $10
	db $9E, $08
	db $A0, $08
	db !play_subsequence : dw .subseq_1A0F
	db !set_default_duration, $08
	db $A5
	db $A3
	db $A2
	db $A0
	db $9E
	db $9D
	db $9E
	db $A0
	db $A2
	db $A0
	db $9E
	db $9D
	db !default_duration_off
	db $9E, $10
	db $A2, $10
	db $9E, $10
	db !set_default_duration, $08
	db $9E
	db $9D
	db !play_subsequence : dw .subseq_1A67
	db !default_duration_off
	db $9E, $10
	db $A2, $10
	db !return_from_sub

.subseq_1A67:
	db $9B
	db $99
	db $9B
	db $9D
	db $9E
	db $9D
	db $9B
	db $9D
	db !return_from_sub

.subseq_1A70:
	db !set_default_duration, $08
	db !play_subsequence : dw .subseq_1A67
	db !default_duration_off
	db $9E, $10
	db !return_from_sub

.subseq_1A79:
	db !play_subsequence : dw .subseq_1A70
	db $A2, $10
	db $9E, $10
	db $9E, $08
	db $9D, $08
	db !play_subsequence : dw .subseq_1A70
	db $80, $20
	db $A5, $08
	db $A3, $08
	db !return_from_sub

.seq_1A8E:
	db !play_subsequence : dw .subseq_18B5
	db !set_volume_l_and_r, $03, $05
	db !play_subsequence : dw .subseq_18C6
	db !echo_on
	db $80, $09
	db $9E, $08
	db $9D, $08
	db !play_subsequence : dw .subseq_1A79
	db !play_subsequence : dw .subseq_1A21
	db $9E, $17
	db !echo_on
	db $80, $80
.loop_point_1AA9:
	db !vibrato_off
	db !play_subsequence : dw .subseq_18D5
	db !load_volume_preset_1
	db !set_adsr, $8F, $F1
	db !loop_subsequence, $02 : dw .subseq_1B42
	db !play_subsequence : dw .subseq_1B2A
	db !play_subsequence : dw .subseq_1ABE
	db !jump_to_sequence : dw .loop_point_1AA9

.subseq_1ABE:
	db !play_subsequence : dw .subseq_1B70
	db !play_subsequence : dw .subseq_1BD3
	db !play_subsequence : dw .subseq_1B70
	db !play_subsequence : dw .subseq_1B17
	db !play_subsequence : dw .subseq_1AF0
	db !loop_subsequence, $02 : dw .subseq_1AE7
	db !play_subsequence : dw .subseq_1AD5
	db !return_from_sub

.subseq_1AD5:
	db !set_variable_note_1, $91
	db !play_subsequence : dw .subseq_1B9B
	db !play_subsequence : dw .subseq_1BA7
	db !loop_subsequence, $03 : dw .subseq_1BCC
	db !set_variable_note_1, $94
	db !play_subsequence : dw .subseq_1BCC
	db !return_from_sub

.subseq_1AE7:
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1B9B
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.subseq_1AF0:
	db !set_variable_note_1, $8F
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BBC
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BB3
	db !set_variable_note_1, $91
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BBC
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BB3
	db !return_from_sub

.subseq_1B17:
	db !set_variable_note_1, $91
	db !loop_subsequence, $04 : dw .subseq_1BCC
	db !set_variable_note_1, $92
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !set_variable_note_1, $91
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !return_from_sub

.subseq_1B2A:
	db !load_volume_preset_2
	db $8D, $0B
	db !set_volume_l_and_r, $04, $01
	db $8F, $05
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1BCC
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1B92
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1B86
	db !return_from_sub

.subseq_1B42:
	db !play_subsequence : dw .subseq_1BD3
	db !play_subsequence : dw .subseq_1B70
	db !play_subsequence : dw .subseq_1BD3
	db !play_subsequence : dw .subseq_1B4F
	db !return_from_sub

.subseq_1B4F:
	db $80, $09
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BBC
	db !load_volume_preset_1
	db $8D, $0B
	db !load_volume_preset_2
	db $8D, $0B
	db !load_volume_preset_1
	db $8F, $0A
	db $8F, $0B
	db !load_volume_preset_2
	db $8F, $0B
	db !set_volume_l_and_r, $04, $01
	db $8F, $0A
	db !load_volume_preset_1
	db $8D, $07
	db !return_from_sub

.subseq_1B70:
	db $80, $09
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1BC5
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1BBC
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.subseq_1B86:
	db !load_volume_preset_1
	db $E0, $0B
	db !load_volume_preset_2
	db $E0, $0B
	db !set_volume_l_and_r, $04, $01
	db $E0, $30
	db !return_from_sub

.subseq_1B92:
	db !load_volume_preset_1
	db $E0, $09
	db $E0, $07
	db !load_volume_preset_2
	db $E0, $0A
	db !return_from_sub

.subseq_1B9B:
	db !load_volume_preset_1
	db $E0, $0B
	db !load_volume_preset_2
	db $E0, $0B
	db !set_volume_l_and_r, $04, $02
	db $E0, $03
	db !return_from_sub

.subseq_1BA7:
	db !load_volume_preset_1
	db $E0, $0B
	db !load_volume_preset_2
	db $E0, $0B
	db !set_volume_l_and_r, $04, $02
	db $E0, $11
	db !return_from_sub

.subseq_1BB3:
	db !load_volume_preset_1
	db $E0, $09
	db $E0, $0B
	db !load_volume_preset_2
	db $E0, $0C
	db !return_from_sub

.subseq_1BBC:
	db !load_volume_preset_1
	db $E0, $09
	db $E0, $0B
	db !load_volume_preset_2
	db $E0, $05
	db !return_from_sub

.subseq_1BC5:
	db !load_volume_preset_1
	db $E0, $0B
	db !load_volume_preset_2
	db $E0, $0C
	db !return_from_sub

.subseq_1BCC:
	db !load_volume_preset_1
	db $E0, $0B
	db !load_volume_preset_2
	db $E0, $05
	db !return_from_sub

.subseq_1BD3:
	db !load_volume_preset_2
	db $8D, $09
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1BC5
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !set_variable_note_1, $91
	db !play_subsequence : dw .subseq_1BBC
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.seq_1BEA:
	db !play_subsequence : dw .subseq_18B5
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_18C6
	db !echo_on
	db $80, $10
	db !play_subsequence : dw .subseq_1D25
	db !loop_subsequence, $04 : dw .subseq_1D03
	db !loop_subsequence, $04 : dw .subseq_1CFA
	db !loop_subsequence, $04 : dw .subseq_1D03
	db !play_subsequence : dw .subseq_1D25
	db !echo_on
	db $80, $80
.loop_point_1C0A:
	db !vibrato_off
	db !play_subsequence : dw .subseq_18D5
	db !load_volume_preset_1
	db !set_adsr, $8F, $F5
	db !loop_subsequence, $02 : dw .subseq_1C9C
	db !play_subsequence : dw .subseq_1C84
	db !play_subsequence : dw .subseq_1C1F
	db !jump_to_sequence : dw .loop_point_1C0A

.subseq_1C1F:
	db !play_subsequence : dw .subseq_1CC9
	db !play_subsequence : dw .subseq_1CE1
	db !play_subsequence : dw .subseq_1CC9
	db !play_subsequence : dw .subseq_1C78
	db !play_subsequence : dw .subseq_1C51
	db !loop_subsequence, $02 : dw .subseq_1C48
	db !play_subsequence : dw .subseq_1C36
	db !return_from_sub

.subseq_1C36:
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1B9B
	db !play_subsequence : dw .subseq_1BA7
	db !loop_subsequence, $03 : dw .subseq_1BCC
	db !set_variable_note_1, $91
	db !play_subsequence : dw .subseq_1BCC
	db !return_from_sub

.subseq_1C48:
	db !set_variable_note_1, $8C
	db !play_subsequence : dw .subseq_1B9B
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.subseq_1C51:
	db !set_variable_note_1, $8B
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BBC
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BB3
	db !set_variable_note_1, $8E
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BBC
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BCC
	db !play_subsequence : dw .subseq_1BB3
	db !return_from_sub

.subseq_1C78:
	db !set_variable_note_1, $8D
	db !loop_subsequence, $07 : dw .subseq_1BCC
	db !set_variable_note_1, $8E
	db !play_subsequence : dw .subseq_1BCC
	db !return_from_sub

.subseq_1C84:
	db !load_volume_preset_2
	db $8A, $0B
	db !set_volume_l_and_r, $04, $01
	db $8B, $05
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1BCC
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1B92
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_1B86
	db !return_from_sub

.subseq_1C9C:
	db !play_subsequence : dw .subseq_1CE1
	db !play_subsequence : dw .subseq_1CC9
	db !play_subsequence : dw .subseq_1CE1
	db !play_subsequence : dw .subseq_1CA9
	db !return_from_sub

.subseq_1CA9:
	db $80, $09
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1BC5
	db !play_subsequence : dw .subseq_1BBC
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_1BC5
	db !load_volume_preset_1
	db $8C, $09
	db $8B, $0B
	db !load_volume_preset_2
	db $8B, $0B
	db !set_volume_l_and_r, $04, $01
	db $8B, $0A
	db !load_volume_preset_1
	db $8A, $07
	db !return_from_sub

.subseq_1CC9:
	db $80, $09
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1BC5
	db !set_variable_note_1, $8B
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_1BBC
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.subseq_1CE1:
	db !load_volume_preset_2
	db $8A, $09
	db !set_variable_note_1, $91
	db !play_subsequence : dw .subseq_1BC5
	db !set_variable_note_1, $8F
	db !loop_subsequence, $02 : dw .subseq_1BCC
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1BBC
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1BA7
	db !return_from_sub

.subseq_1CFA:
	db $8B, $0C
	db $80, $04
	db $92, $0C
	db $80, $04
	db !return_from_sub

.subseq_1D03:
	db $86, $0C
	db $80, $04
	db $8D, $0C
	db $80, $04
	db !return_from_sub

.subseq_1D0C:
	db $8B, $0C
	db $80, $04
	db $92, $0C
	db $80, $04
	db $8D, $0C
	db $80, $04
	db $94, $0C
	db $80, $04
	db $86, $0C
	db $80, $04
	db $8D, $0C
	db $80, $04
	db !return_from_sub

.subseq_1D25:
	db !play_subsequence : dw .subseq_1D0C
	db $86, $0C
	db $80, $04
	db $8D, $0C
	db $80, $04
	db !play_subsequence : dw .subseq_1D0C
	db $8D, $20
	db !return_from_sub

.seq_1D36:
	db !play_subsequence : dw .subseq_18B5
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_18C6
	db !echo_on
	db $80, $10
	db !play_subsequence : dw .subseq_1F45
	db !loop_subsequence, $04 : dw .subseq_1F23
	db !loop_subsequence, $04 : dw .subseq_1F1A
	db !loop_subsequence, $04 : dw .subseq_1F23
	db !play_subsequence : dw .subseq_1F45
	db !vibrato_off
	db !echo_on
	db $80, $7C
.loop_point_1D57:
	db !set_voice_parameters, $8E, $F5, $F2, $16, $33, $8F, $D5
	db !play_subsequence : dw .subseq_1EED
	db !play_subsequence : dw .subseq_18DF
	db !set_volume_l_and_r, $10, $20
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1E42
	db !set_voice_parameters, $33, $FC, $19, $1A, $33, $8F, $E0
	db !play_subsequence : dw .subseq_1D9B
	db !jump_to_sequence : dw .loop_point_1D57

.subseq_1D7C:
	db $9C, $02
	db $9B, $0E
	db $9E, $0C
	db $80, $04
	db $9B, $0B
	db $80, $05
	db $9E, $08
	db $80, $08
	db $9B, $0E
	db $80, $02
	db $9E, $09
	db $A0, $02
	db $A1, $0E
	db $A0, $07
	db $9E, $09
	db !return_from_sub

.subseq_1D9B:
	db !play_subsequence : dw .subseq_1D7C
	db $99, $07
	db $80, $80
	db !play_subsequence : dw .subseq_1D7C
	db $A0, $07
	db $80, $39
	db !pitch_slide_up, $04, $02, $0B, $1C, $00
	db $A0, $15
	db $80, $04
	db !pitch_slide_up, $03, $02, $0B, $1C, $00
	db $A0, $10
	db !pitch_slide_off
	db $A0, $05
	db $80, $02
	db $9E, $09
	db $80, $0C
	db $99, $02
	db $9B, $0C
	db $80, $04
	db $9E, $0C
	db $80, $04
	db $9B, $07
	db $80, $02
	db $9E, $09
	db $80, $07
	db $9B, $07
	db $80, $39
	db $A0, $05
	db $A1, $02
	db $A2, $0C
	db $80, $04
	db $A2, $0C
	db $80, $04
	db $A2, $07
	db $80, $02
	db $A0, $0E
	db $80, $02
	db $9E, $07
	db $80, $30
	db $9E, $09
	db $9F, $07
	db $A0, $0C
	db $80, $04
	db !pitch_slide_up, $00, $01, $0B, $1C, $00
	db $A0, $09
	db !pitch_slide_off
	db $A0, $07
	db $80, $10
	db $9E, $09
	db $9F, $07
	db $A0, $0C
	db $80, $04
	db !pitch_slide_up, $00, $01, $0B, $1C, $00
	db $A0, $09
	db !pitch_slide_off
	db $A0, $07
	db $80, $10
	db $9E, $09
	db $9F, $07
	db $A0, $0C
	db $80, $04
	db $A0, $0C
	db $80, $04
	db $A0, $0C
	db $80, $04
	db $A0, $0C
	db $80, $04
	db !pitch_slide_up, $00, $01, $0B, $1C, $00
	db $A0, $10
	db $A0, $10
	db !pitch_slide_off
	db $A1, $09
	db $A0, $07
	db $80, $0C
	db !return_from_sub

.subseq_1E42:
	db !pitch_slide_up, $00, $02, $16, $1A, $00
	db $92, $2F
	db $80, $01
	db !pitch_slide_off
	db $96, $0C
	db $80, $04
	db $96, $09
	db $94, $07
	db $96, $0C
	db $94, $02
	db $95, $02
	db $96, $09
	db $94, $07
	db $96, $09
	db $94, $07
	db $95, $09
	db $96, $10
	db $94, $07
	db $92, $0A
	db $80, $06
	db $8F, $0C
	db $80, $04
	db $8F, $09
	db $8D, $07
	db $8F, $0E
	db $80, $02
	db $8F, $09
	db $8D, $07
	db $8F, $09
	db $8D, $07
	db $8E, $09
	db $8F, $0F
	db $80, $01
	db $92, $07
	db $8F, $09
	db $80, $07
	db $92, $0C
	db $80, $04
	db $92, $09
	db $94, $07
	db $96, $0C
	db $94, $02
	db $95, $02
	db $96, $09
	db $94, $07
	db $96, $09
	db $94, $07
	db $95, $09
	db $96, $10
	db $94, $07
	db $92, $09
	db $80, $07
	db $8D, $09
	db $8E, $07
	db $8F, $09
	db $92, $07
	db $95, $09
	db $94, $10
	db $92, $07
	db $80, $39
	db $8E, $07
	db $8D, $09
	db $8E, $07
	db $8F, $09
	db $92, $05
	db $94, $02
	db $95, $09
	db $94, $10
	db $92, $09
	db $80, $3E
	db !return_from_sub

.subseq_1ED2:
	db $A2, $10
	db $A2, $09
	db $A0, $07
	db $A2, $10
	db $A2, $09
	db $A0, $07
	db $A2, $09
	db $A5, $07
	db $A6, $09
	db $A7, $10
	db $A5, $07
	db $A2, $09
	db $A1, $07
	db !return_from_sub

.subseq_1EED:
	db $A0, $02
	db $A1, $02
	db !play_subsequence : dw .subseq_1ED2
	db $9E, $10
	db $9E, $09
	db $9B, $07
	db $9E, $10
	db $9E, $09
	db $99, $07
	db $9A, $09
	db $9B, $07
	db $9E, $09
	db $A1, $10
	db $A0, $07
	db $9E, $10
	db !play_subsequence : dw .subseq_1ED2
	db $9E, $10
	db $9E, $10
	db $9E, $09
	db $9E, $10
	db $9E, $17
	db !return_from_sub

.subseq_1F1A:
	db $97, $0C
	db $80, $04
	db $97, $0C
	db $80, $04
	db !return_from_sub

.subseq_1F23:
	db $92, $0C
	db $80, $04
	db $92, $0C
	db $80, $04
	db !return_from_sub

.subseq_1F2C:
	db $97, $0C
	db $80, $04
	db $97, $0C
	db $80, $04
	db $99, $0C
	db $80, $04
	db $99, $0C
	db $80, $04
	db $92, $0C
	db $80, $04
	db $92, $0C
	db $80, $04
	db !return_from_sub

.subseq_1F45:
	db !play_subsequence : dw .subseq_1F2C
	db $92, $0C
	db $80, $04
	db $92, $0C
	db $80, $04
	db !play_subsequence : dw .subseq_1F2C
	db $92, $20
	db !return_from_sub

.seq_1F56:
	db !play_subsequence : dw .subseq_18B5
	db $80, $90
	db $80, $80
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $1A, $0C
	db !set_adsr, $84, $E8
	db !vibrato_with_delay, $03, $03, $08, $05
	db $96, $80
	db $97, $80
	db $96, $80
	db $97, $20
	db $99, $20
	db $96, $40
	db $97, $20
	db $99, $20
	db $96, $37
	db !change_instr_pitch, $00
	db !echo_on
	db !play_subsequence : dw .subseq_20FB
	db !loop_subsequence, $02 : dw .subseq_20D6
	db !play_subsequence : dw .subseq_2054
	db $99, $07
	db !play_subsequence : dw .subseq_20FB
	db !set_vol_single_val, $4A
	db !set_adsr, $8F, $F1
	db $99, $10
.loop_point_1F99:
	db !loop_subsequence, $03 : dw .subseq_20CB
	db !play_subsequence : dw .subseq_20BC
	db !loop_subsequence, $03 : dw .subseq_20CB
	db !play_subsequence : dw .subseq_2097
	db !loop_subsequence, $04 : dw .subseq_20CB
	db !play_subsequence : dw .subseq_2074
	db !play_subsequence : dw .subseq_20CB
	db !play_subsequence : dw .subseq_20AD
	db !loop_subsequence, $07 : dw .subseq_20CB
	db !play_subsequence : dw .subseq_20BC
	db !loop_subsequence, $07 : dw .subseq_20CB
	db !play_subsequence : dw .subseq_20AD
	db !play_subsequence : dw .subseq_2074
	db !play_subsequence : dw .subseq_20CB
	db !play_subsequence : dw .subseq_20BC
	db !loop_subsequence, $0E : dw .subseq_20CB
	db !play_subsequence : dw .subseq_201C
	db !loop_subsequence, $07 : dw .subseq_20CB
	db !play_subsequence : dw .subseq_20BC
	db !play_subsequence : dw .subseq_1FFA
	db $80, $09
	db !play_subsequence : dw .subseq_1FFA
	db !play_subsequence : dw .subseq_20FB
	db !loop_subsequence, $02 : dw .subseq_20D6
	db !play_subsequence : dw .subseq_2054
	db $99, $07
	db !play_subsequence : dw .subseq_20FB
	db !set_vol_single_val, $4A
	db !set_adsr, $8F, $F1
	db $99, $10
	db !jump_to_sequence : dw .loop_point_1F99

.subseq_1FFA:
	db !play_subsequence : dw .subseq_2054
	db $99, $09
	db !play_subsequence : dw .subseq_2048
	db !set_volume_l_and_r, $25, $4A
	db $95, $07
	db !set_volume_l_and_r, $4A, $25
	db $92, $09
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_2054
	db $99, $10
	db !play_subsequence : dw .subseq_2064
	db $99, $07
	db !set_vol_single_val, $40
	db $98, $07
	db !return_from_sub

.subseq_201C:
	db !play_subsequence : dw .subseq_2054
	db $99, $09
	db !play_subsequence : dw .subseq_2048
	db !set_volume_l_and_r, $25, $4A
	db $95, $07
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_206C
	db $9A, $10
	db !play_subsequence : dw .subseq_2054
	db $99, $07
	db !play_subsequence : dw .subseq_20FB
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $40
	db $9A, $09
	db !play_subsequence : dw .subseq_2048
	db !set_volume_l_and_r, $4A, $25
	db $92, $07
	db !pitch_slide_off
	db !return_from_sub

.subseq_2048:
	db !set_instrument, $36
	db !set_adsr, $8F, $D1
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !return_from_sub

.subseq_2054:
	db !set_instrument, $00
	db !set_vol_single_val, $2A
	db !set_adsr, $8F, $E0
	db !return_from_sub

.subseq_205C:
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $3A
	db !return_from_sub

.subseq_2064:
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $30
	db !return_from_sub

.subseq_206C:
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $40
	db !return_from_sub

.subseq_2074:
	db !play_subsequence : dw .subseq_2054
	db $99, $09
	db !play_subsequence : dw .subseq_2064
	db $9A, $07
	db !play_subsequence : dw .subseq_2054
	db $99, $09
	db $98, $07
	db !play_subsequence : dw .subseq_206C
	db $9A, $09
	db !play_subsequence : dw .subseq_2054
	db $98, $07
	db !play_subsequence : dw .subseq_205C
	db $9A, $09
	db $9A, $07
	db !return_from_sub

.subseq_2097:
	db !play_subsequence : dw .subseq_2054
	db $99, $09
	db !play_subsequence : dw .subseq_2048
	db !set_volume_l_and_r, $40, $20
	db $98, $07
	db $98, $09
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_206C
	db $9A, $07
	db !return_from_sub

.subseq_20AD:
	db !play_subsequence : dw .subseq_2054
	db $99, $07
	db !play_subsequence : dw .subseq_20FB
	db !set_vol_single_val, $40
	db $98, $09
	db $99, $07
	db !return_from_sub

.subseq_20BC:
	db !play_subsequence : dw .subseq_2054
	db $99, $09
	db !play_subsequence : dw .subseq_2064
	db $99, $07
	db !set_vol_single_val, $40
	db $98, $10
	db !return_from_sub

.subseq_20CB:
	db !play_subsequence : dw .subseq_2054
	db $99, $10
	db !play_subsequence : dw .subseq_206C
	db $98, $10
	db !return_from_sub

.subseq_20D6:
	db !play_subsequence : dw .subseq_206C
	db $98, $09
	db !play_subsequence : dw .subseq_2048
	db !set_volume_l_and_r, $20, $40
	db $99, $07
	db !set_vol_single_val, $30
	db $96, $09
	db !pitch_slide_off
	db !play_subsequence : dw .subseq_206C
	db $98, $07
	db !play_subsequence : dw .subseq_2048
	db !set_vol_single_val, $30
	db $99, $09
	db !set_volume_l_and_r, $40, $20
	db $92, $07
	db !pitch_slide_off
	db !return_from_sub

.subseq_20FB:
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $08
	db $9A, $03
	db !set_vol_single_val, $10
	db $99, $03
	db !set_vol_single_val, $18
	db $98, $03
	db !return_from_sub

.subseq_210D:
	db $92, $20
	db $94, $20
	db $92, $40
	db !return_from_sub

.seq_2114:
	db !play_subsequence : dw .subseq_18B5
	db $80, $90
	db $80, $80
	db !set_voice_parameters, $14, $FC, $FE, $1A, $0C, $84, $E8
	db !vibrato_with_delay, $04, $02, $08, $05
	db $92, $80
	db $92, $80
	db $92, $80
	db !loop_subsequence, $02 : dw .subseq_210D
	db $80, $02
	db !change_instr_pitch, $00
	db !echo_on
	db !play_subsequence : dw .subseq_2241
	db !loop_subsequence, $02 : dw .subseq_2204
	db !set_instrument, $00
	db !set_vol_single_val, $0E
	db !set_adsr, $8F, $E0
	db $99, $07
	db !play_subsequence : dw .subseq_2241
	db !set_vol_single_val, $18
	db !set_adsr, $8F, $F1
	db $99, $05
.loop_point_2151:
	db !set_instrument, $8D
	db !set_volume_l_and_r, $10, $26
	db !set_adsr, $8F, $91
	db !change_instr_pitch, $00
	db !loop_subsequence, $10 : dw .subseq_21FD
	db !loop_subsequence, $10 : dw .subseq_21FD
	db !loop_subsequence, $04 : dw .subseq_21FD
	db !set_instrument, $2E
	db !loop_subsequence, $0E : dw .subseq_21E7
	db !play_subsequence : dw .subseq_21A6
	db !set_instrument, $2E
	db !loop_subsequence, $08 : dw .subseq_21E7
	db !loop_subsequence, $02 : dw .subseq_2199
	db $80, $02
	db !play_subsequence : dw .subseq_2241
	db !loop_subsequence, $02 : dw .subseq_2204
	db !set_instrument, $00
	db !set_vol_single_val, $0E
	db !set_adsr, $8F, $E0
	db $99, $07
	db !play_subsequence : dw .subseq_2241
	db !set_vol_single_val, $18
	db !set_adsr, $8F, $F1
	db $99, $05
	db !jump_to_sequence : dw .loop_point_2151

.subseq_2199:
	db !set_instrument, $2E
	db !set_volume_l_and_r, $0B, $2A
	db !set_adsr, $8E, $D1
	db $9E, $19
	db $9E, $27
	db !return_from_sub

.subseq_21A6:
	db !set_instrument, $2E
	db !set_volume_l_and_r, $0B, $2A
	db !set_adsr, $8E, $D1
	db $9E, $0B
	db !set_instrument, $00
	db !set_vol_single_val, $0E
	db !set_adsr, $8F, $E0
	db $99, $09
	db !set_instrument, $36
	db !set_adsr, $8F, $D1
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !set_volume_l_and_r, $0C, $18
	db $95, $07
	db !pitch_slide_off
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $15
	db $9A, $10
	db !set_instrument, $00
	db !set_vol_single_val, $0E
	db !set_adsr, $8F, $E0
	db $99, $07
	db !play_subsequence : dw .subseq_2241
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $15
	db $9A, $05
	db !return_from_sub

.subseq_21E7:
	db !set_volume_l_and_r, $0B, $2A
	db !set_adsr, $8E, $D1
	db $9E, $10
	db !set_volume_l_and_r, $0A, $28
	db !set_adsr, $8F, $DA
	db $9E, $09
	db !set_adsr, $8F, $DA
	db $9E, $07
	db !return_from_sub

.subseq_21FD:
	db $98, $10
	db $98, $09
	db $98, $07
	db !return_from_sub

.subseq_2204:
	db !set_instrument, $A5
	db !set_vol_single_val, $15
	db !set_adsr, $8F, $F1
	db $98, $09
	db !set_instrument, $36
	db !set_adsr, $8F, $D5
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !set_volume_l_and_r, $0A, $15
	db $99, $07
	db !set_vol_single_val, $10
	db $96, $09
	db !pitch_slide_off
	db !set_instrument, $A5
	db !set_vol_single_val, $15
	db !set_adsr, $8F, $F1
	db $98, $07
	db !set_instrument, $36
	db !set_adsr, $8F, $D5
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !set_vol_single_val, $10
	db $99, $09
	db !set_volume_l_and_r, $15, $0A
	db $92, $07
	db !pitch_slide_off
	db !return_from_sub

.subseq_2241:
	db !set_instrument, $A5
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $02
	db $9A, $03
	db !set_vol_single_val, $05
	db $99, $03
	db !set_vol_single_val, $08
	db $98, $03
	db !return_from_sub

.subseq_2253:
	db !set_voice_parameters, $24, $0C, $A9, $08, $20, $8E, $95
	db !return_from_sub

.seq_225C:
	db !play_subsequence : dw .subseq_18B5
	db $80, $90
	db $80, $80
	db !echo_on
	db !play_subsequence : dw .subseq_2253
	db !play_subsequence : dw .subseq_2348
	db !echo_off
	db $80, $60
.loop_point_226D:
	db !set_voice_parameters, $18, $07, $D4, $58, $58, $8D, $F2
	db !loop_subsequence, $02 : dw .subseq_22E8
	db !set_default_duration, $10
	db $8B
	db $8B
	db $8D
	db $8D
	db $86
	db $86
	db $88
	db $8A
	db !default_duration_off
	db !play_subsequence : dw .subseq_2291
	db !jump_to_sequence : dw .loop_point_226D

.subseq_228A:
	db $8B
	db $8B
	db $8B
	db $8B
	db $8B
	db $8B
	db !return_from_sub

.subseq_2291:
	db !set_default_duration, $10
	db !play_subsequence : dw .subseq_228A
	db $8A
	db $88
	db $86
	db $86
	db $86
	db $86
	db $86
	db $86
	db $88
	db $8A
	db !play_subsequence : dw .subseq_228A
	db $8A
	db !default_duration_off
	db $8B, $09
	db $8C, $07
	db !set_default_duration, $10
	db $8D
	db $8D
	db $8D
	db $8D
	db !default_duration_off
	db $86, $09
	db $92, $05
	db $80, $02
	db !set_default_duration, $10
	db $86
	db $88
	db $8A
	db !play_subsequence : dw .subseq_228A
	db $8C
	db $8D
	db $8E
	db $8E
	db $8A
	db $8A
	db $83
	db $83
	db $85
	db $86
	db !default_duration_off
	db $88, $19
	db $88, $10
	db $83, $07
	db $86, $10
	db $88, $19
	db $88, $10
	db $8A, $07
	db $8B, $10
	db $8D, $19
	db $8D, $10
	db $88, $07
	db !set_default_duration, $10
	db $8B
	db $8D
	db $8D
	db $8F
	db $91
	db !default_duration_off
	db !return_from_sub

.subseq_22E8:
	db !set_default_duration, $10
	db $86
	db $86
	db $86
	db $86
	db $86
	db $86
	db $88
	db $8A
	db !play_subsequence : dw .subseq_228A
	db !default_duration_off
	db $8B, $09
	db $8B, $07
	db $8A, $09
	db $8D, $07
	db !loop_subsequence, $06 : dw .subseq_231B
	db $86, $09
	db $86, $07
	db $88, $09
	db $8A, $07
	db !set_default_duration, $10
	db $8B
	db $8B
	db $8D
	db $8D
	db $86
	db !default_duration_off
	db $8C, $09
	db $8D, $10
	db $8D, $10
	db $86, $07
	db !return_from_sub

.subseq_231B:
	db $86, $10
	db !return_from_sub

.subseq_231E:
	db !set_volume_l_and_r, $02, $0C
	db !play_subsequence : dw .subseq_2393
	db !set_volume_l_and_r, $03, $0E
	db !play_subsequence : dw .subseq_2393
	db !set_volume_l_and_r, $04, $10
	db !loop_subsequence, $02 : dw .subseq_2393
	db !return_from_sub

.subseq_2332:
	db !set_volume_l_and_r, $05, $12
	db !loop_subsequence, $04 : dw .subseq_2393
	db !set_volume_l_and_r, $06, $14
	db !loop_subsequence, $04 : dw .subseq_2393
	db !return_from_sub

.subseq_2341:
	db !play_subsequence : dw .subseq_231E
	db !play_subsequence : dw .subseq_2332
	db !return_from_sub

.subseq_2348:
	db !set_variable_note_1, $A2
	db !play_subsequence : dw .subseq_2341
	db !set_variable_note_1, $A5
	db !play_subsequence : dw .subseq_231E
	db !set_variable_note_1, $A7
	db !play_subsequence : dw .subseq_2341
	db !loop_subsequence, $04 : dw .subseq_2393
	db !set_variable_note_1, $A2
	db !play_subsequence : dw .subseq_2341
	db !set_variable_note_1, $A2
	db !play_subsequence : dw .subseq_231E
	db !set_variable_note_1, $A2
	db !set_volume_l_and_r, $04, $10
	db !loop_subsequence, $04 : dw .subseq_2393
	db !set_variable_note_1, $A5
	db !loop_subsequence, $0C : dw .subseq_2393
	db !set_variable_note_1, $A7
	db !loop_subsequence, $04 : dw .subseq_2393
	db !set_variable_note_1, $A5
	db !loop_subsequence, $0C : dw .subseq_2393
	db !play_subsequence : dw .subseq_2384
	db !return_from_sub

.subseq_2384:
	db !set_volume_l_and_r, $08, $02
	db !loop_subsequence, $02 : dw .subseq_2393
	db !set_volume_l_and_r, $01, $05
	db !loop_subsequence, $02 : dw .subseq_2393
	db !return_from_sub

.subseq_2393:
	db $E0, $08
	db !return_from_sub

.seq_2396:
	db !play_subsequence : dw .subseq_18B5
	db $80, $90
	db $80, $84
	db !echo_on
	db !play_subsequence : dw .subseq_2253
	db !play_subsequence : dw .subseq_23E6
	db !echo_on
	db $80, $67
.loop_point_23A7:
	db !set_voice_parameters, $8E, $F5, $F2, $0E, $06, $8C, $D1
	db !play_subsequence : dw .subseq_1EED
	db !play_subsequence : dw .subseq_18DF
	db !set_volume_l_and_r, $0C, $05
	db !set_adsr, $8C, $E0
	db !play_subsequence : dw .subseq_1E42
	db !set_voice_parameters, $33, $FC, $19, $17, $0A, $8C, $E0
	db !play_subsequence : dw .subseq_1D9B
	db !jump_to_sequence : dw .loop_point_23A7

.subseq_23CC:
	db !play_subsequence : dw .subseq_231E
	db !play_subsequence : dw .subseq_2332
	db !return_from_sub

.subseq_23D3:
	db !set_variable_note_1, $A3
	db !loop_subsequence, $04 : dw .subseq_2393
	db !set_variable_note_1, $A0
	db !loop_subsequence, $04 : dw .subseq_2393
	db !set_variable_note_1, $A2
	db !loop_subsequence, $08 : dw .subseq_2393
	db !return_from_sub

.subseq_23E6:
	db !set_variable_note_1, $9E
	db !play_subsequence : dw .subseq_23CC
	db !set_variable_note_1, $A2
	db !play_subsequence : dw .subseq_231E
	db !set_variable_note_1, $A3
	db !play_subsequence : dw .subseq_23CC
	db !loop_subsequence, $04 : dw .subseq_2393
	db !set_variable_note_1, $9E
	db !play_subsequence : dw .subseq_23CC
	db !set_variable_note_1, $A2
	db !play_subsequence : dw .subseq_231E
	db !set_volume_l_and_r, $04, $10
	db !loop_subsequence, $02 : dw .subseq_23D3
	db !play_subsequence : dw .subseq_2384
	db !return_from_sub

base off
arch 65816
.end: