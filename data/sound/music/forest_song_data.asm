;05 Forest Interlude
;2E421F
forest_song_data:
	dw !bgm_loc, $086D
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1A55, .seq_1BC5, .seq_1CB2, .seq_20A1, .seq_1DF0, .seq_22DD, .seq_1E8A, .seq_1F24
	db $A5, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_190B, .seq_1A1D, .seq_19A1, .seq_1A2E, .seq_1991, .seq_1A40, .seq_19D8, .seq_1A0B
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_1624, .seq_16B6, .seq_1792, .seq_17ED, .seq_1687, .seq_18DE, .seq_18B1, .seq_173A
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_1482, .seq_14F6, .seq_1542, .seq_15C0, .seq_14CB, .seq_1600, .seq_1612, .seq_15E0
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_136E, .seq_13BB, .seq_13D2, .seq_1408, .seq_141E, .seq_1459, .seq_1434, .seq_144A
	db $C0, $FF	;music tempo, sound effect tempo

.subseq_1364:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.seq_136E:
	db !set_echo, $37, $20, $20
	db !set_fir, $7F, $0A, $00, $00, $00, $00, $00, $00
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

.seq_13D2:
	db !change_instr_pitch, $05
	db !fine_tune, $EC
	db !set_adsr, $8D, $E0
	db !set_volume_l_and_r, $20, $10
.loop_point_13DC:
	db !echo_on
	db !set_instrument, $49
	db $A0, $09
	db !set_instrument, $4B
	db $9B, $07
	db !set_instrument, $4C
	db $9D, $09
	db !set_instrument, $4B
	db $A0, $10
	db !set_instrument, $4A
	db $A2, $07
	db !set_instrument, $49
	db $A4, $05
	db !set_instrument, $48
	db $A7, $04
	db !set_instrument, $47
	db $A9, $06
	db !set_instrument, $3F
	db $AC, $19
	db $80, $07
	db !set_instrument, $43
	db $AC, $10
	db !end_sequence

.seq_1408:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_141E:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_1434:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $23, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_144A:
	db $80, $14
	db !change_instr_pitch, $05
	db !fine_tune, $EC
	db !set_adsr, $8D, $E0
	db !set_volume_l_and_r, $06, $0B
	db !jump_to_sequence : dw .loop_point_13DC

.seq_1459:
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

.seq_1482:
	db !set_echo, $2C, $17, $17
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_14BA
.loop_point_14A9:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_14A9

.subseq_14BA:
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

.seq_14CB:
	db !play_subsequence : dw .subseq_1364
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
.loop_point_14EF:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .loop_point_14EF

.seq_14F6:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $1E, $1E
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
.loop_point_151E:
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
	db !jump_to_sequence : dw .loop_point_151E
	db !end_sequence

.seq_1542:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_155E
	db !end_sequence

.subseq_155E:
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

.seq_15C0:
	db !play_subsequence : dw .subseq_1364
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
	db !play_subsequence : dw .subseq_155E
	db !end_sequence

.seq_15E0:
	db !play_subsequence : dw .subseq_1364
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
	db !play_subsequence : dw .subseq_155E
	db !end_sequence

.seq_1600:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1612:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $28, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1624:
	db !set_echo, $2C, $17, $17
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_164C
	db !end_sequence

.subseq_164C:
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

.seq_1687:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $28, $32
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_16A7
	db !default_duration_off
	db !end_sequence

.subseq_16A7:
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

.seq_16B6:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $1E, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_16CE
	db !end_sequence

.subseq_16CE:
	db !play_subsequence : dw .subseq_16DB
	db !play_subsequence : dw .subseq_1718
	db !play_subsequence : dw .subseq_16DB
	db !play_subsequence : dw .subseq_1729
	db !return_from_sub

.subseq_16DB:
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

.subseq_1718:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_1729:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_173A:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $64, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1757
	db !end_sequence

.subseq_1757:
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

.seq_1792:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $0A, $0A
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
	db !loop_subsequence, $02 : dw .subseq_17C8
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_17C8
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_17C8
	db !end_sequence

.subseq_17C8:
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

.seq_17ED:
	db !play_subsequence : dw .subseq_1364
	db !set_volume_l_and_r, $0A, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1868
	db !play_subsequence : dw .subseq_1846
	db !play_subsequence : dw .subseq_2273
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_1818
	db !end_sequence

.subseq_1818:
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

.subseq_1846:
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
.subseq_1868:
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

.seq_18B1:
	db !play_subsequence : dw .subseq_1364
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
	db !play_subsequence : dw .subseq_1868
	db !play_subsequence : dw .subseq_1846
	db !play_subsequence : dw .subseq_2273
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_1818
	db !end_sequence

.seq_18DE:
	db !play_subsequence : dw .subseq_1364
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
	db !play_subsequence : dw .subseq_1868
	db !play_subsequence : dw .subseq_1846
	db !play_subsequence : dw .subseq_2273
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_1818
	db !end_sequence

.seq_190B:
	db !set_echo, $37, $20, $20
	db !set_fir, $7F, $0A, $00, $00, $00, $00, $00, $00
	db !change_instr_pitch, $11
	db !fine_tune, $EC
	db !set_adsr, $8D, $E0
	db !set_volume_l_and_r, $20, $10
.loop_point_1922:
	db !set_instrument, $39
	db $9E, $04
	db !set_instrument, $3B
	db $A0, $04
	db !set_instrument, $3D
	db $A1, $10
	db !set_instrument, $3F
	db $A0, $10
	db !set_instrument, $41
	db $9E, $10
	db !set_instrument, $43
	db $9C, $08
	db !set_instrument, $45
	db $9B, $08
	db !set_instrument, $47
	db $97, $10
	db !set_instrument, $48
	db $9A, $10
	db !set_instrument, $49
	db $9B, $10
	db !set_instrument, $4A
	db $9C, $20
	db !set_default_duration, $08
	db !set_instrument, $4F
	db $9A
	db !set_instrument, $4E
	db $9A
	db !set_instrument, $4D
	db $9A
	db !set_instrument, $4C
	db $9A
	db !set_instrument, $4B
	db $9A
	db !set_instrument, $4A
	db $9A
	db !set_instrument, $49
	db $9A
	db !set_instrument, $48
	db $9A
	db !play_subsequence : dw .subseq_1978
	db !set_adsr, $FC, $60
	db !play_subsequence : dw .subseq_1978
	db !set_adsr, $FB, $20
	db !play_subsequence : dw .subseq_1978
	db !end_sequence

.subseq_1978:
	db !set_instrument, $47
	db $9A
	db !set_instrument, $45
	db $9A
	db !set_instrument, $43
	db $9A
	db !set_instrument, $41
	db $9A
	db !set_instrument, $3F
	db $9A
	db !set_instrument, $3D
	db $9A
	db !set_instrument, $3B
	db $9A
	db !set_instrument, $39
	db $9A
	db !return_from_sub

.seq_1991:
	db !change_instr_pitch, $11
	db !fine_tune, $E4
	db !set_adsr, $8D, $E0
	db !set_volume_l_and_r, $06, $0B
	db $80, $0B
	db !jump_to_sequence : dw .loop_point_1922
	db !end_sequence

.seq_19A1:
	db !set_adsr, $8D, $E0
	db !set_instrument, $8A
	db !pitch_slide_up, $02, $01, $0B, $07, $03
	db !change_instr_pitch, $00
	db $80, $08
	db !loop_subsequence, $04 : dw .subseq_1BAB
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $8F, $D6
	db $82, $10
	db $8A, $10
	db $8F, $10
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $8F, $D6
	db $82, $20
	db !set_volume_l_and_r, $0C, $0C
	db $82, $20
	db !set_volume_l_and_r, $08, $08
	db $82, $20
	db !set_volume_l_and_r, $04, $04
	db $82, $20
	db !end_sequence

.seq_19D8:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $7A, $7A
	db !set_adsr, $CE, $AF
	db $80, $08
	db $8B, $10
	db $8B, $08
	db $8B, $20
	db $8B, $08
	db $8B, $10
	db $8B, $30
	db $85, $10
	db $85, $08
	db $85, $20
	db $85, $08
	db $85, $10
	db $85, $08
	db $85, $20
	db $85, $08
	db $85, $10
	db $85, $18
	db $80, $08
	db $85, $80
	db !end_sequence

.seq_1A0B:
	db !echo_on
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $C1, $AE
	db $A1, $80
	db $A0, $F0
	db !end_sequence

.seq_1A1D:
	db !change_instr_pitch, $11
	db !fine_tune, $E4
	db !set_adsr, $8D, $E0
	db !set_volume_l_and_r, $07, $02
	db $80, $15
	db !echo_on
	db !jump_to_sequence : dw .loop_point_1922
	db !end_sequence

.seq_1A2E:
	db !echo_on
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $C1, $AE
	db $9E, $80
	db $9C, $F0
	db !end_sequence

.seq_1A40:
	db !echo_on
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $C1, $AE
	db $9A, $80
	db $9A, $F0
	db !end_sequence

.subseq_1A52:
	db $80, $10
	db !return_from_sub

.seq_1A55:
	db !echo_delay, $06
	db !play_subsequence : dw .subseq_1A52
	db !set_echo, $37, $20, $20
	db !set_fir, $7F, $0A, $00, $00, $00, $00, $00, $00
	db !echo_on
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !set_adsr, $8D, $E0
.loop_point_1A6F:
	db !set_volume_l_and_r, $10, $08
	db !play_subsequence : dw .subseq_1AC2
	db !set_volume_l_and_r, $0C, $06
	db !play_subsequence : dw .subseq_1AC2
	db !set_volume_l_and_r, $08, $04
	db !play_subsequence : dw .subseq_1AC2
	db !set_instrument, $8A
	db !pitch_slide_up, $02, $01, $0B, $07, $03
	db !change_instr_pitch, $00
	db !loop_subsequence, $08 : dw .subseq_1BAB
	db !loop_subsequence, $18 : dw .subseq_1BAB
	db !loop_subsequence, $12 : dw .subseq_1BAB
	db !set_instrument, $8A
	db !pitch_slide_up, $02, $01, $0B, $07, $03
	db !change_instr_pitch, $00
	db !loop_subsequence, $1C : dw .subseq_1BAB
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !set_adsr, $8D, $E0
	db !set_volume_l_and_r, $0C, $06
	db !play_subsequence : dw .subseq_1B12
	db !jump_to_sequence : dw .loop_point_1A6F
	db !end_sequence

.unreached_1AB6:
	db !loop_subsequence, $20 : dw .subseq_1BAB
	db !loop_subsequence, $08 : dw .subseq_1BAB
	db !jump_to_sequence : dw .unreached_1AB6
	db !end_sequence

.subseq_1AC2:
	db !set_instrument, $37
	db !play_subsequence : dw .subseq_1B63
	db !set_instrument, $39
	db !play_subsequence : dw .subseq_1B6C
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_1B75
	db !set_instrument, $3D
	db !play_subsequence : dw .subseq_1B7E
	db !set_instrument, $3F
	db !play_subsequence : dw .subseq_1B87
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_1B90
	db !set_instrument, $43
	db !play_subsequence : dw .subseq_1B99
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_1BA2
	db !set_instrument, $47
	db !play_subsequence : dw .subseq_1B63
	db !set_instrument, $48
	db !play_subsequence : dw .subseq_1B6C
	db !set_instrument, $49
	db !play_subsequence : dw .subseq_1B75
	db !set_instrument, $4A
	db !play_subsequence : dw .subseq_1B7E
	db !set_instrument, $4B
	db !play_subsequence : dw .subseq_1B87
	db !set_instrument, $4C
	db !play_subsequence : dw .subseq_1B90
	db !set_instrument, $4D
	db !play_subsequence : dw .subseq_1B99
	db !set_instrument, $4E
	db !play_subsequence : dw .subseq_1BA2
.subseq_1B12:
	db !set_instrument, $4F
	db !play_subsequence : dw .subseq_1B63
	db !set_instrument, $4E
	db !play_subsequence : dw .subseq_1B6C
	db !set_instrument, $4D
	db !play_subsequence : dw .subseq_1B75
	db !set_instrument, $4C
	db !play_subsequence : dw .subseq_1B7E
	db !set_instrument, $4B
	db !play_subsequence : dw .subseq_1B87
	db !set_instrument, $4A
	db !play_subsequence : dw .subseq_1B90
	db !set_instrument, $49
	db !play_subsequence : dw .subseq_1B99
	db !set_instrument, $48
	db !play_subsequence : dw .subseq_1BA2
	db !set_instrument, $47
	db !play_subsequence : dw .subseq_1B63
	db !set_instrument, $45
	db !play_subsequence : dw .subseq_1B6C
	db !set_instrument, $43
	db !play_subsequence : dw .subseq_1B75
	db !set_instrument, $41
	db !play_subsequence : dw .subseq_1B7E
	db !set_instrument, $3F
	db !play_subsequence : dw .subseq_1B87
	db !set_instrument, $3D
	db !play_subsequence : dw .subseq_1B90
	db !set_instrument, $3B
	db !play_subsequence : dw .subseq_1B99
	db !set_instrument, $39
	db !play_subsequence : dw .subseq_1BA2
	db !return_from_sub

.subseq_1B63:
	db !pitch_slide_down, $00, $01, $05, $68, $00
	db $97, $10
	db !return_from_sub

.subseq_1B6C:
	db !pitch_slide_up, $00, $01, $05, $75, $00
	db $97, $10
	db !return_from_sub

.subseq_1B75:
	db !pitch_slide_up, $00, $01, $06, $74, $00
	db $9A, $10
	db !return_from_sub

.subseq_1B7E:
	db !pitch_slide_down, $00, $01, $06, $6D, $00
	db $9B, $10
	db !return_from_sub

.subseq_1B87:
	db !pitch_slide_up, $00, $01, $07, $7B, $00
	db $9E, $10
	db !return_from_sub

.subseq_1B90:
	db !pitch_slide_up, $00, $01, $07, $7B, $00
	db $9E, $10
	db !return_from_sub

.subseq_1B99:
	db !pitch_slide_down, $00, $01, $07, $73, $00
	db $9E, $10
	db !return_from_sub

.subseq_1BA2:
	db !pitch_slide_up, $00, $01, $07, $73, $00
	db $9C, $10
	db !return_from_sub

.subseq_1BAB:
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $8F, $D6
	db $82, $10
	db $8A, $10
	db $8F, $10
	db !set_volume_l_and_r, $08, $08
	db $8F, $08
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $8F, $FA
	db $94, $08
	db !return_from_sub

.seq_1BC5:
	db !play_subsequence : dw .subseq_1A52
	db !echo_on
	db $80, $11
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !set_adsr, $8D, $E0
.loop_point_1BD2:
	db !set_volume_l_and_r, $04, $06
	db !play_subsequence : dw .subseq_1AC2
	db !set_volume_l_and_r, $02, $03
	db !play_subsequence : dw .subseq_1AC2
	db !set_volume_l_and_r, $01, $02
	db !play_subsequence : dw .subseq_1AC2
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $6F
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !loop_subsequence, $0C : dw .subseq_1C19
	db !loop_subsequence, $09 : dw .subseq_1C19
	db !change_instr_pitch, $F4
	db !loop_subsequence, $0C : dw .subseq_1C19
	db $80, $80
	db $80, $80
	db $80, $11
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !set_adsr, $8D, $E0
	db !set_volume_l_and_r, $02, $03
	db !play_subsequence : dw .subseq_1B12
	db !jump_to_sequence : dw .loop_point_1BD2
	db !end_sequence

.subseq_1C19:
	db !set_instrument, $2D
	db !set_volume_l_and_r, $26, $26
	db !set_adsr, $8F, $E0
	db $99, $08
	db !set_instrument, $2E
	db !set_adsr, $EF, $FA
	db !set_volume_l_and_r, $14, $14
	db $9E, $08
	db !set_volume_l_and_r, $06, $06
	db $9E, $08
	db !set_instrument, $0D
	db !set_adsr, $8F, $F8
	db !set_volume_l_and_r, $2C, $2C
	db $88, $08
	db !set_volume_l_and_r, $0E, $0E
	db $88, $08
	db !set_instrument, $09
	db !set_volume_l_and_r, $70, $70
	db !set_adsr, $8F, $E0
	db $91, $02
	db $91, $02
	db $91, $02
	db $92, $02
	db !set_default_duration, $08
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $8F, $D2
	db $9E
	db !set_instrument, $2F
	db !set_volume_l_and_r, $17, $17
	db !set_adsr, $8F, $F5
	db $9A
	db !set_instrument, $A3
	db !set_adsr, $8F, $B5
	db !vibrato_with_delay, $05, $01, $11, $01
	db !set_volume_l_and_r, $0A, $0A
	db $A2
	db !set_volume_l_and_r, $03, $03
	db $A2
	db !vibrato_off
	db !set_instrument, $32
	db !set_volume_l_and_r, $4A, $4A
	db !set_adsr, $8F, $D0
	db !pitch_slide_up, $00, $01, $37, $37, $01
	db $9A
	db !pitch_slide_off
	db !set_instrument, $09
	db !set_adsr, $8F, $E0
	db !set_volume_l_and_r, $7F, $7F
	db $8A
	db !set_volume_l_and_r, $2A, $2A
	db $8A
	db !set_instrument, $A5
	db !set_volume_l_and_r, $2C, $2C
	db !set_adsr, $8F, $E0
	db $AA
	db !set_instrument, $8D
	db !set_volume_l_and_r, $2C, $2C
	db !set_adsr, $AF, $F5
	db $AE
	db !set_instrument, $0D
	db !set_volume_l_and_r, $1C, $1C
	db !set_adsr, $8E, $E0
	db $9A
	db !default_duration_off
	db !return_from_sub

.seq_1CB2:
	db !play_subsequence : dw .subseq_1A52
.loop_point_1CB5:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $7A, $7A
	db !set_adsr, $D8, $E5
	db !long_duration_on
	db $89, $00, $80
	db $86, $00, $80
	db $8B, $01, $00
	db $89, $00, $80
	db $86, $00, $80
	db $8B, $01, $00
	db $89, $00, $80
	db $86, $00, $80
	db $8B, $01, $00
	db $89, $00, $80
	db $86, $00, $80
	db $8B, $01, $00
	db !long_duration_off
	db !set_adsr, $CE, $AF
	db !play_subsequence : dw .subseq_1DAB
	db !play_subsequence : dw .subseq_1DC7
	db !play_subsequence : dw .subseq_1DAB
	db !loop_subsequence, $02 : dw .subseq_1D8B
	db !play_subsequence : dw .subseq_1DA5
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $7A, $7A
	db !set_adsr, $CE, $AF
	db !loop_subsequence, $02 : dw .subseq_1D57
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1D3B
	db !set_variable_note_1, $8E
	db !play_subsequence : dw .subseq_1D3B
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1D3B
	db $8B, $10
	db $8B, $08
	db $8B, $20
	db $8B, $08
	db $8B, $10
	db $8B, $10
	db $8B, $10
	db $8A, $10
	db !set_variable_note_1, $89
	db !play_subsequence : dw .subseq_1D4A
	db !set_variable_note_1, $86
	db !play_subsequence : dw .subseq_1D4A
	db !loop_subsequence, $02 : dw .subseq_1DA5
	db !jump_to_sequence : dw .loop_point_1CB5
	db !end_sequence

.subseq_1D3B:
	db $E0, $10
	db $E0, $08
	db $E0, $20
	db $E0, $08
	db $E0, $10
	db $E0, $20
	db $E0, $10
	db !return_from_sub

.subseq_1D4A:
	db $E0, $10
	db $E0, $08
	db $E0, $20
	db $E0, $08
	db $E0, $10
	db $E0, $30
	db !return_from_sub

.subseq_1D57:
	db $8F, $10
	db $8F, $08
	db $8F, $20
	db $8F, $08
	db $8F, $10
	db $8F, $10
	db $83, $10
	db $85, $10
	db $86, $10
	db $86, $08
	db $86, $20
	db $86, $08
	db $86, $10
	db $86, $10
	db $86, $20
	db $8A, $10
	db $8A, $08
	db $8A, $20
	db $8A, $08
	db $8A, $10
	db $8A, $20
	db $8D, $08
	db $8F, $08
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1D3B
	db !return_from_sub

.subseq_1D8B:
	db !set_variable_note_1, $89
	db !play_subsequence : dw .subseq_1D4A
	db $86, $10
	db $86, $08
	db $86, $20
	db $86, $08
	db $86, $10
	db $86, $10
	db $88, $10
	db $89, $10
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1D4A
.subseq_1DA5:
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1D4A
	db !return_from_sub

.subseq_1DAB:
	db !set_variable_note_1, $86
	db !play_subsequence : dw .subseq_1D4A
	db $86, $10
	db $86, $08
	db $86, $20
	db $86, $08
	db $86, $10
	db $86, $10
	db $88, $10
	db $89, $10
	db !set_variable_note_1, $8B
	db !loop_subsequence, $02 : dw .subseq_1D4A
	db !return_from_sub

.subseq_1DC7:
	db !set_variable_note_1, $86
	db !play_subsequence : dw .subseq_1D4A
	db $86, $10
	db $86, $08
	db $86, $20
	db $86, $08
	db $86, $10
	db $86, $10
	db $88, $10
	db $89, $10
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1D4A
	db $8B, $10
	db $8B, $08
	db $8B, $20
	db $8B, $08
	db $8B, $10
	db $8B, $10
	db $8B, $20
	db !return_from_sub

.seq_1DF0:
	db !play_subsequence : dw .subseq_1A52
.loop_point_1DF3:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $10, $18
	db !set_adsr, $D5, $E5
	db !long_duration_on
	db $A0, $00, $80
	db $A3, $00, $80
	db $9E, $01, $00
	db $A0, $00, $80
	db $A3, $00, $80
	db $9E, $01, $00
	db $A0, $00, $80
	db $A3, $00, $80
	db $9E, $01, $00
	db $A0, $00, $80
	db $A3, $00, $80
	db $9E, $01, $00
	db $A0, $01, $00
	db $9E, $01, $00
	db $A0, $01, $00
	db $9E, $01, $00
	db $A0, $01, $00
	db $9E, $01, $00
	db $A0, $00, $80
	db $A3, $00, $80
	db $9E, $01, $00
	db $A0, $00, $80
	db $A3, $00, $80
	db $9E, $01, $80
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $10, $18
	db !set_adsr, $D5, $E5
	db !long_duration_on
	db $A2, $00, $80
	db $A2, $00, $80
	db $A2, $00, $80
	db $A0, $00, $80
	db $A2, $00, $80
	db $A2, $00, $80
	db $A2, $00, $80
	db $A0, $00, $80
	db $A2, $00, $80
	db $A2, $00, $80
	db $A2, $00, $80
	db $9E, $00, $80
	db $9C, $00, $80
	db $A0, $00, $80
	db $A0, $00, $80
	db $9E, $00, $80
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_1DF3
	db !end_sequence

.seq_1E8A:
	db !play_subsequence : dw .subseq_1A52
.loop_point_1E8D:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $18, $10
	db !set_adsr, $D5, $E5
	db !long_duration_on
	db $9C, $00, $80
	db $9C, $00, $80
	db $9B, $01, $00
	db $9C, $00, $80
	db $9C, $00, $80
	db $9B, $01, $00
	db $9C, $00, $80
	db $9C, $00, $80
	db $9B, $01, $00
	db $9C, $00, $80
	db $9C, $00, $80
	db $9B, $01, $00
	db $9C, $01, $00
	db $9B, $01, $00
	db $9C, $01, $00
	db $9B, $01, $00
	db $9C, $01, $00
	db $9B, $01, $00
	db $9C, $00, $80
	db $9C, $00, $80
	db $9B, $01, $00
	db $9C, $00, $80
	db $9C, $00, $80
	db $9B, $01, $80
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $18, $10
	db !set_adsr, $D5, $E5
	db !long_duration_on
	db $9E, $00, $80
	db $9E, $00, $80
	db $9D, $00, $80
	db $9D, $00, $80
	db $9E, $00, $80
	db $9E, $00, $80
	db $9D, $00, $80
	db $9D, $00, $80
	db $9E, $00, $80
	db $9D, $00, $80
	db $9C, $00, $80
	db $9B, $00, $80
	db $99, $00, $80
	db $9C, $00, $80
	db $99, $00, $80
	db $9B, $00, $80
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_1E8D
	db !end_sequence

.seq_1F24:
	db !play_subsequence : dw .subseq_1A52
.loop_point_1F27:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $D5, $E5
	db !long_duration_on
	db $99, $00, $80
	db $99, $00, $80
	db $97, $01, $00
	db $99, $00, $80
	db $99, $00, $80
	db $97, $01, $00
	db $99, $00, $80
	db $99, $00, $80
	db $97, $01, $00
	db $99, $00, $80
	db $99, $00, $80
	db $97, $01, $00
	db $99, $01, $00
	db $97, $01, $00
	db $99, $01, $00
	db $97, $01, $00
	db $99, $01, $00
	db $97, $01, $00
	db $99, $00, $80
	db $99, $00, $80
	db $97, $01, $00
	db $99, $00, $80
	db $99, $00, $80
	db $97, $01, $80
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $D5, $E5
	db !long_duration_on
	db $9B, $00, $80
	db $99, $00, $80
	db $99, $00, $80
	db $99, $00, $80
	db $9B, $00, $80
	db $99, $00, $80
	db $99, $00, $80
	db $99, $00, $80
	db $9B, $00, $80
	db $9A, $00, $80
	db $99, $00, $80
	db $97, $00, $80
	db $95, $00, $80
	db $99, $00, $80
	db $95, $00, $80
	db $97, $00, $80
	db !long_duration_off
	db !jump_to_sequence : dw .loop_point_1F27
	db !end_sequence

.subseq_1FBE:
	db !change_instr_pitch, $FB
	db !fine_tune, $2E
	db !set_adsr, $DC, $8B
	db !set_default_duration, $08
	db !set_instrument, $51
	db $A3
	db $A5
	db !set_instrument, $52
	db $A0
	db $A3
	db !set_instrument, $53
	db $A5
	db $A0
	db !set_instrument, $53
	db $A3
	db $A5
	db !set_instrument, $54
	db $A0
	db $A3
	db !set_instrument, $55
	db $A5
	db $A0
	db !set_instrument, $57
	db $A3
	db $A5
	db !set_instrument, $59
	db $A0
	db $A3
	db !default_duration_off
	db !return_from_sub

.subseq_1FE9:
	db !change_instr_pitch, $FB
	db !fine_tune, $2E
	db !set_adsr, $DA, $8B
	db !set_default_duration, $04
	db !set_instrument, $59
	db $A8
	db $A7
	db $A3
	db !set_instrument, $58
	db $A8
	db $A7
	db $A3
	db !set_instrument, $57
	db $A8
	db $A7
	db $A3
	db !set_instrument, $56
	db $A8
	db $A7
	db $A3
	db !set_instrument, $55
	db $A8
	db $A7
	db $A3
	db !set_instrument, $54
	db $A8
	db $A7
.subseq_200F:
	db !set_default_duration, $04
	db $A3
	db !set_instrument, $53
	db $A8
	db $A7
	db $A3
	db !set_instrument, $52
	db $A8
	db $A7
	db $A3
	db !set_instrument, $51
	db $A8
	db $A7
	db $A3
	db !set_instrument, $50
	db $A8
	db $A7
	db $A3
	db !default_duration_off
	db !return_from_sub

.subseq_2028:
	db $99, $10
	db !pitch_slide_up, $00, $01, $0B, $58, $00
	db $9A, $10
	db !pitch_slide_off
	db $99, $08
	db !pitch_slide_up, $00, $01, $0B, $58, $00
	db !return_from_sub

.subseq_203C:
	db !pitch_slide_up, $00, $01, $0B, $58, $00
	db $9A, $10
	db !pitch_slide_off
	db $9C, $10
	db $9C, $10
	db $9E, $08
	db !return_from_sub

.subseq_204C:
	db !change_instr_pitch, $07
	db !fine_tune, $2E
	db !set_adsr, $DA, $8B
	db !set_default_duration, $08
	db !set_instrument, $50
	db $9B
	db $9C
	db $A3
	db !set_instrument, $51
	db $9B
	db $9C
	db $A3
	db !set_instrument, $52
	db $9B
	db $9C
	db $A3
	db !set_instrument, $53
	db $9B
	db $9C
	db $A3
	db !set_instrument, $52
	db $9B
	db $9C
	db !set_instrument, $51
	db $A3
	db $9B
	db !default_duration_off
	db !return_from_sub

.subseq_2073:
	db $99, $10
	db !pitch_slide_up, $00, $01, $0B, $58, $00
	db $9A, $10
	db !pitch_slide_off
	db $9E, $08
	db !pitch_slide_up, $00, $01, $0E, $58, $00
	db !return_from_sub

.subseq_2087:
	db !pitch_slide_up, $00, $01, $0B, $58, $00
	db $9A, $10
	db !pitch_slide_off
	db $9C, $10
	db $9C, $10
	db $9E, $08
	db $9B, $28
	db $9C, $10
	db $9B, $30
	db $99, $10
	db $97, $30
	db !return_from_sub

.seq_20A1:
	db !play_subsequence : dw .subseq_1A52
.loop_point_20A4:
	db !echo_on
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $C1, $AE
	db !long_duration_on
	db $A0, $00, $80
	db $A3, $00, $80
	db $9E, $01, $00
	db !set_adsr, $C1, $A8
	db $A0, $00, $80
	db $A3, $01, $60
	db !long_duration_off
	db !set_volume_l_and_r, $0A, $20
	db !set_adsr, $8F, $F1
	db !play_subsequence : dw .subseq_227F
	db !set_volume_l_and_r, $18, $08
	db !play_subsequence : dw .subseq_1FBE
	db !set_volume_l_and_r, $0A, $20
	db !set_adsr, $8F, $F1
	db !play_subsequence : dw .subseq_22AD
	db !set_volume_l_and_r, $18, $08
	db !play_subsequence : dw .subseq_1FE9
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $68
	db !play_subsequence : dw .subseq_2267
	db !set_adsr, $9C, $AB
	db $80, $10
	db !set_volume_l_and_r, $08, $10
	db !play_subsequence : dw .subseq_2028
	db $9A, $18
	db !pitch_slide_off
	db !set_volume_l_and_r, $07, $03
	db !play_subsequence : dw .subseq_2028
	db $9A, $18
	db !pitch_slide_off
	db !set_volume_l_and_r, $01, $03
	db !play_subsequence : dw .subseq_2028
	db $9A, $08
	db !pitch_slide_off
	db !set_volume_l_and_r, $08, $10
	db !play_subsequence : dw .subseq_203C
	db $9B, $08
	db !set_volume_l_and_r, $07, $03
	db !play_subsequence : dw .subseq_203C
	db $9B, $08
	db !set_volume_l_and_r, $01, $03
	db !play_subsequence : dw .subseq_203C
	db $9B, $18
	db !set_volume_l_and_r, $18, $08
	db !play_subsequence : dw .subseq_204C
	db !play_subsequence : dw .subseq_2267
	db !set_adsr, $9C, $AB
	db !set_volume_l_and_r, $08, $10
	db !play_subsequence : dw .subseq_2073
	db $9E, $18
	db !pitch_slide_off
	db !set_volume_l_and_r, $07, $03
	db !play_subsequence : dw .subseq_2073
	db $9E, $18
	db !pitch_slide_off
	db !set_volume_l_and_r, $01, $03
	db !play_subsequence : dw .subseq_2073
	db $9E, $08
	db !pitch_slide_off
	db !set_volume_l_and_r, $08, $10
	db !play_subsequence : dw .subseq_2087
	db !set_volume_l_and_r, $05, $03
	db $99, $10
	db $97, $30
	db !set_volume_l_and_r, $0A, $20
	db !set_adsr, $8F, $F1
	db !play_subsequence : dw .subseq_227F
	db !set_volume_l_and_r, $18, $08
	db !play_subsequence : dw .subseq_1FBE
	db !set_volume_l_and_r, $0A, $20
	db !set_adsr, $8F, $F1
	db !play_subsequence : dw .subseq_22AD
	db !set_volume_l_and_r, $18, $08
	db !play_subsequence : dw .subseq_1FE9
	db !set_volume_l_and_r, $05, $08
	db !play_subsequence : dw .subseq_200F
	db !set_volume_l_and_r, $03, $01
	db !play_subsequence : dw .subseq_200F
	db !set_volume_l_and_r, $14, $09
	db !loop_subsequence, $02 : dw .subseq_21E2
	db !play_subsequence : dw .subseq_2267
	db !set_adsr, $9C, $AB
	db !set_volume_l_and_r, $08, $10
	db !play_subsequence : dw .subseq_219B
	db !jump_to_sequence : dw .loop_point_20A4
	db !end_sequence

.subseq_219B:
	db $A2, $20
	db $A0, $10
	db $9E, $40
	db $9E, $08
	db $A0, $08
	db $A2, $20
	db $A0, $10
	db $9E, $40
	db $9E, $08
	db $A0, $08
	db $A2, $20
	db $A3, $10
	db $A2, $30
	db $A0, $10
	db $9E, $60
	db $80, $18
	db $9B, $08
	db $9D, $08
	db $9E, $08
	db $A0, $20
	db $9E, $10
	db $9C, $40
	db $9C, $08
	db $9E, $08
	db $A0, $20
	db $9E, $10
	db $9C, $20
	db $9E, $10
	db $A0, $10
	db $A0, $50
	db $A0, $15
	db $A1, $16
	db $A0, $15
	db $9E, $40
	db $80, $40
	db !return_from_sub

.subseq_21E2:
	db !change_instr_pitch, $07
	db !fine_tune, $2E
	db !set_adsr, $EB, $6B
	db !set_default_duration, $08
	db !set_instrument, $50
	db $9B
	db $9D
	db $9E
	db $A2
	db !set_instrument, $51
	db $9B
	db $9D
	db $9E
	db $A2
	db !set_instrument, $52
	db $9B
	db $9D
	db $9E
	db $A2
	db !set_instrument, $53
	db $9B
	db $9D
	db $9E
	db $A2
	db !set_instrument, $50
	db $9E
	db $A2
	db $A5
	db $A7
	db !set_instrument, $51
	db $9E
	db $A2
	db $A5
	db $A7
	db !set_instrument, $52
	db $9E
	db $A2
	db $A5
	db $A7
	db !set_instrument, $53
	db $9E
	db $A2
	db $A5
	db $A7
	db !set_instrument, $50
	db $9D
	db $A2
	db $A5
	db $A7
	db !set_instrument, $51
	db $9D
	db $A2
	db $A5
	db $A7
	db !set_instrument, $52
	db $9D
	db $A2
	db $A5
	db $A7
	db !set_instrument, $53
	db $9D
	db $A2
	db $A5
	db $A7
	db !set_default_duration, $04
	db !set_instrument, $50
	db $9D
	db $A0
	db $A5
	db $A7
	db !set_instrument, $51
	db $9D
	db $A0
	db $A5
	db $A7
	db !set_instrument, $52
	db $9D
	db $A0
	db $A5
	db $A7
	db !set_instrument, $53
	db $9D
	db $A0
	db $A5
	db $A7
	db !set_instrument, $54
	db $A7
	db $A5
	db $A0
	db $9D
	db !set_instrument, $52
	db $A7
	db $A5
	db $A0
	db $9D
	db !set_instrument, $51
	db $A7
	db $A5
	db $A0
	db $9D
	db !set_instrument, $50
	db $A7
	db $A5
	db $A0
	db $9D
	db !default_duration_off
	db !return_from_sub

.subseq_2267:
	db !set_instrument, $21
	db !change_instr_pitch, $18
	db !fine_tune, $AB
	db !vibrato_with_delay, $05, $02, $0A, $16
	db !return_from_sub

.subseq_2273:
	db !set_instrument, $29
	db !change_instr_pitch, $0B
	db !fine_tune, $F5
	db !vibrato_with_delay, $02, $03, $05, $08
	db !return_from_sub

.subseq_227F:
	db !play_subsequence : dw .subseq_2273
	db $99, $08
	db $9B, $08
	db $9C, $08
	db $9E, $08
	db $A0, $20
	db $9E, $10
	db $9C, $30
	db $99, $08
	db $9B, $08
	db $9C, $08
	db $9E, $08
	db $A0, $20
	db $9E, $10
	db $9C, $20
	db $9E, $10
	db $A0, $10
	db $9E, $44
	db $99, $04
	db $9B, $04
	db $99, $04
	db $97, $20
	db !return_from_sub

.subseq_22AD:
	db !play_subsequence : dw .subseq_2273
	db $99, $08
	db $9B, $08
	db $9C, $08
	db $9E, $08
	db $A0, $20
	db $9E, $10
	db $9C, $48
	db $9C, $04
	db $9E, $04
	db $A0, $20
	db $9E, $10
	db $9C, $40
	db $A3, $08
	db $A5, $08
	db $A3, $38
	db $9E, $04
	db $A0, $04
	db $9E, $34
	db $99, $04
	db $9B, $04
	db $99, $04
	db $97, $20
	db !return_from_sub

.seq_22DD:
	db !play_subsequence : dw .subseq_1A52
	db $80, $0F
.loop_point_22E2:
	db !echo_on
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $18, $18
	db !set_adsr, $C1, $AE
	db !long_duration_on
	db $9C, $00, $80
	db $9C, $00, $80
	db $9B, $01, $00
	db $9C, $00, $80
	db $9C, $00, $80
	db $9B, $00, $E0
	db !long_duration_off
	db !set_volume_l_and_r, $0B, $05
	db !set_adsr, $8C, $EE
	db !play_subsequence : dw .subseq_227F
	db !set_volume_l_and_r, $03, $08
	db !play_subsequence : dw .subseq_1FBE
	db !set_volume_l_and_r, $0B, $05
	db !set_adsr, $8C, $EE
	db !play_subsequence : dw .subseq_22AD
	db !set_volume_l_and_r, $03, $08
	db !play_subsequence : dw .subseq_1FE9
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $68
	db !play_subsequence : dw .subseq_2267
	db !set_adsr, $9C, $A8
	db $80, $10
	db !set_volume_l_and_r, $05, $03
	db !play_subsequence : dw .subseq_2028
	db $9A, $18
	db !pitch_slide_off
	db !set_volume_l_and_r, $01, $03
	db !play_subsequence : dw .subseq_2028
	db $9A, $18
	db !pitch_slide_off
	db !set_volume_l_and_r, $02, $00
	db !play_subsequence : dw .subseq_2028
	db $9A, $08
	db !pitch_slide_off
	db !set_volume_l_and_r, $05, $03
	db !play_subsequence : dw .subseq_203C
	db $9B, $08
	db !set_volume_l_and_r, $01, $03
	db !play_subsequence : dw .subseq_203C
	db $9B, $08
	db !set_volume_l_and_r, $02, $00
	db !play_subsequence : dw .subseq_203C
	db $9B, $18
	db !set_volume_l_and_r, $03, $08
	db !play_subsequence : dw .subseq_204C
	db !play_subsequence : dw .subseq_2267
	db !set_adsr, $9C, $A8
	db !set_volume_l_and_r, $05, $03
	db !play_subsequence : dw .subseq_2073
	db $9E, $18
	db !pitch_slide_off
	db !set_volume_l_and_r, $01, $03
	db !play_subsequence : dw .subseq_2073
	db $9E, $18
	db !pitch_slide_off
	db !set_volume_l_and_r, $02, $00
	db !play_subsequence : dw .subseq_2073
	db $9E, $08
	db !pitch_slide_off
	db !set_volume_l_and_r, $05, $03
	db !play_subsequence : dw .subseq_2087
	db !set_volume_l_and_r, $01, $03
	db $99, $10
	db $97, $30
	db !set_volume_l_and_r, $0B, $05
	db !set_adsr, $8C, $EE
	db !play_subsequence : dw .subseq_227F
	db !set_volume_l_and_r, $03, $08
	db !play_subsequence : dw .subseq_1FBE
	db !set_volume_l_and_r, $0B, $05
	db !set_adsr, $8C, $EE
	db !play_subsequence : dw .subseq_22AD
	db !set_volume_l_and_r, $03, $08
	db !play_subsequence : dw .subseq_1FE9
	db !set_volume_l_and_r, $03, $01
	db !play_subsequence : dw .subseq_200F
	db !set_volume_l_and_r, $00, $02
	db !play_subsequence : dw .subseq_200F
	db !set_volume_l_and_r, $03, $0A
	db !loop_subsequence, $02 : dw .subseq_21E2
	db !play_subsequence : dw .subseq_2267
	db !set_adsr, $9C, $A8
	db !set_volume_l_and_r, $05, $03
	db !play_subsequence : dw .subseq_219B
	db !jump_to_sequence : dw .loop_point_22E2
	db !end_sequence

base off
arch 65816
.end: