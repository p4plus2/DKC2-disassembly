;07 Kannon's Klaim
;2E6007
mine_song_data:
	dw !bgm_loc, $079E
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1971, .seq_1AE0, .seq_1CE2, .seq_1F47, .seq_1DDA, .seq_2010, .seq_20C0, .seq_2178
	db $A0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131C	;01: 
	dw .chn_ptrs_132E	;02: 
	dw .chn_ptrs_1340	;03: 
	dw .chn_ptrs_1352	;04: 

;sub-track 01 channel pointers
.chn_ptrs_131C:
	dw .seq_18A6, .seq_18C9, .seq_18D9, .seq_190F, .seq_18F0, .seq_192E, .seq_193F, .seq_1949
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132E:
	dw .seq_15CE, .seq_1654, .seq_1728, .seq_177A, .seq_1626, .seq_185C, .seq_1832, .seq_16D1
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1340:
	dw .seq_145A, .seq_14BF, .seq_14F9, .seq_156E, .seq_1498, .seq_15AC, .seq_15BD, .seq_158D
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1352:
	dw .seq_1364, .seq_13AE, .seq_13C1, .seq_13DE, .seq_13F4, .seq_142C, .seq_140A, .seq_141F
	db $C0, $FF	;music tempo, sound effect tempo

.seq_1364:
	db !set_echo, $37, $20, $20
	db !set_fir, $7F, $0A, $00, $00, $00, $00, $00, $00
	db !set_voice_parameters, $A5, $00, $00, $46, $46, $8F, $E0
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

.seq_13AE:
	db !set_voice_parameters, $14, $E4, $02, $7A, $7A, $CE, $AF
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_13C1:
	db !play_subsequence : dw .subseq_1886
	db !change_instr_pitch, $F0
.loop_point_13C6:
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

.seq_13DE:
	db !play_subsequence : dw .subseq_188F
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_13F4:
	db !play_subsequence : dw .subseq_188F
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_140A:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_141F:
	db !play_subsequence : dw .subseq_1886
	db !change_instr_pitch, $F0
	db !set_volume_l_and_r, $08, $11
	db $80, $14
	db !jump_to_sequence : dw .loop_point_13C6

.seq_142C:
	db !set_voice_parameters, $AE, $00, $00, $0A, $14, $FF, $58
	db !loop_subsequence, $03 : dw .subseq_1447
	db $9E, $09
	db $9E, $03
	db $9E, $03
	db $9E, $03
	db !loop_subsequence, $02 : dw .subseq_1447
	db $9E, $10
	db !end_sequence

.subseq_1447:
	db $9E, $09
	db $9D, $07
	db !return_from_sub

.subseq_144C:
	db !set_echo, $2C, $17, $17
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !return_from_sub

.seq_145A:
	db !play_subsequence : dw .subseq_144C
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_1487
.loop_point_1476:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_1476

.subseq_1487:
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

.seq_1498:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !set_voice_parameters, $AE, $00, $00, $14, $1E, $AF, $B2
	db !set_default_duration, $18
	db $9A
	db $9A
	db $9A
	db $9A
	db !default_duration_off
	db !set_adsr, $8F, $F8
.loop_point_14B8:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .loop_point_14B8

.seq_14BF:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !set_voice_parameters, $14, $E4, $02, $7A, $7A, $CE, $AF
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
.loop_point_14E2:
	db !loop_subsequence, $10 : dw .subseq_14F5
	db !loop_subsequence, $08 : dw .subseq_14F7
	db $88
	db $88
	db $88
	db $88
	db $8A
	db $8A
	db $8A
	db $8A
	db !jump_to_sequence : dw .loop_point_14E2

.subseq_14F5:
	db $8C
	db !return_from_sub

.subseq_14F7:
	db $85
	db !return_from_sub

.seq_14F9:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1514
	db !end_sequence

.subseq_1514:
	db !set_adsr, $EF, $80
	db $80, $58
	db !pitch_slide_up, $01, $02, $08, $21, $00
	db $A2, $10
	db $A2, $10
	db $A2, $0F
	db !loop_subsequence, $02 : dw .subseq_1558
	db !play_subsequence : dw .subseq_1564
	db !vibrato_with_delay, $04, $02, $11, $05
	db $A4, $0F
	db $80, $01
	db $A4, $07
	db !play_subsequence : dw .subseq_1564
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

.subseq_1558:
	db !pitch_slide_up, $00, $01, $08, $2B, $00
	db $9F, $09
	db !pitch_slide_off
	db $9F, $07
	db !return_from_sub

.subseq_1564:
	db !pitch_slide_up, $00, $01, $08, $39, $00
	db $A4, $09
	db !pitch_slide_off
	db !return_from_sub

.seq_156E:
	db !play_subsequence : dw .subseq_188F
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
	db !play_subsequence : dw .subseq_1514
	db !end_sequence

.seq_158D:
	db !play_subsequence : dw .subseq_188F
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
	db !play_subsequence : dw .subseq_1514
	db !end_sequence

.seq_15AC:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15BD:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_15CE:
	db !play_subsequence : dw .subseq_144C
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_15EB
	db !end_sequence

.subseq_15EB:
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

.seq_1626:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $AE
	db !set_volume_l_and_r, $14, $1E
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_1645
	db !default_duration_off
	db !end_sequence

.subseq_1645:
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

.seq_1654:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_166B
	db !end_sequence

.subseq_166B:
	db !play_subsequence : dw .subseq_1678
	db !play_subsequence : dw .subseq_16B4
	db !play_subsequence : dw .subseq_1678
	db !play_subsequence : dw .subseq_16C5
	db !return_from_sub

.subseq_1678:
	db !set_instrument, $05
	db !set_vol_single_val, $4A
	db !set_adsr, $8F, $E0
	db !pitch_slide_down, $01, $01, $0B, $0B, $00
	db $8D
	db !pitch_slide_off
	db !set_instrument, $07
	db !set_vol_single_val, $11
	db !play_subsequence : dw .subseq_16AB
	db !set_instrument, $01
	db !set_adsr, $8E, $EF
	db $88
	db !set_instrument, $07
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_16AB
	db !set_instrument, $02
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $87
	db !set_instrument, $03
	db !set_adsr, $8F, $EF
	db $88
	db !return_from_sub

.subseq_16AB:
	db !pitch_slide_up, $02, $01, $16, $16, $00
	db $9A
	db !pitch_slide_off
	db !return_from_sub

.subseq_16B4:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8A
.subseq_16BC:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_16C5:
	db !play_subsequence : dw .subseq_16BC
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_16D1:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_16ED
	db !end_sequence

.subseq_16ED:
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

.seq_1728:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $7A
	db !set_adsr, $CE, $AF
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_175C
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_175C
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_175C
	db !end_sequence

.subseq_175C:
	db !play_subsequence : dw .subseq_176B
	db $80, $24
	db !play_subsequence : dw .subseq_176B
	db $80, $04
	db $89, $10
	db $8A, $10
	db !return_from_sub

.subseq_176B:
	db $E0, $0C
	db $80, $04
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db $80, $14
	db $E0, $0C
	db !return_from_sub

.seq_177A:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_17E8
	db !play_subsequence : dw .subseq_17D2
	db !play_subsequence : dw .subseq_1886
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_17A4
	db !end_sequence

.subseq_17A4:
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

.subseq_17D2:
	db !play_subsequence : dw .subseq_1816
	db $95, $10
	db !play_subsequence : dw .subseq_181D
	db $97, $10
	db !play_subsequence : dw .subseq_1824
	db $97, $08
	db $95, $10
	db !play_subsequence : dw .subseq_182B
	db $97, $40
.subseq_17E8:
	db !play_subsequence : dw .subseq_182B
	db $97, $08
	db !play_subsequence : dw .subseq_1816
	db $95, $10
	db !play_subsequence : dw .subseq_181D
	db $97, $10
	db !play_subsequence : dw .subseq_1824
	db $97, $08
	db !play_subsequence : dw .subseq_1816
	db $99, $10
	db !play_subsequence : dw .subseq_181D
	db $9A, $10
	db !play_subsequence : dw .subseq_182B
	db $9A, $08
	db !play_subsequence : dw .subseq_1824
	db $99, $10
	db !play_subsequence : dw .subseq_182B
	db $97, $20
	db !return_from_sub

.subseq_1816:
	db !set_instrument, $01
	db !change_instr_pitch, $02
	db !fine_tune, $F2
	db !return_from_sub

.subseq_181D:
	db !set_instrument, $02
	db !change_instr_pitch, $FE
	db !fine_tune, $18
	db !return_from_sub

.subseq_1824:
	db !set_instrument, $03
	db !change_instr_pitch, $FD
	db !fine_tune, $00
	db !return_from_sub

.subseq_182B:
	db !set_instrument, $04
	db !change_instr_pitch, $FC
	db !fine_tune, $FE
	db !return_from_sub

.seq_1832:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $80, $05
	db $97, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $7F
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_17E8
	db !play_subsequence : dw .subseq_17D2
	db !play_subsequence : dw .subseq_1886
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_17A4
	db !end_sequence

.seq_185C:
	db !play_subsequence : dw .subseq_188F
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $80, $05
	db $93, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $04, $0B
	db !set_adsr, $8F, $E0
	db $80, $87
	db !play_subsequence : dw .subseq_17E8
	db !play_subsequence : dw .subseq_17D2
	db !play_subsequence : dw .subseq_1886
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_17A4
	db !end_sequence

.subseq_1886:
	db !set_voice_parameters, $B3, $FC, $F6, $30, $15, $8F, $F2
	db !return_from_sub

.subseq_188F:
	db !set_voice_parameters, $14, $F0, $FE, $28, $1E, $8C, $E8
	db !return_from_sub

.subseq_1898:
	db !set_echo, $3A, $21, $21
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !return_from_sub

.seq_18A6:
	db !play_subsequence : dw .subseq_1898
	db !set_voice_parameters, $B2, $02, $F2, $2D, $19, $8E, $E0
.loop_point_18B1:
	db !echo_on
	db $9E, $08
	db $A0, $08
	db $A1, $10
	db $A0, $10
	db $9E, $10
	db $9C, $08
	db $9B, $08
	db $97, $10
	db $9A, $10
	db $9B, $10
	db $9C, $50
	db !end_sequence

.seq_18C9:
	db $80, $10
	db !loop_subsequence, $02 : dw .subseq_1AA9
	db !set_instrument, $AD
	db !set_vol_single_val, $3C
	db !set_adsr, $8F, $E0
	db $90, $40
	db !end_sequence

.seq_18D9:
	db !set_voice_parameters, $B2, $F6, $F2, $6E, $6E, $8F, $EE
	db $80, $10
	db $8B, $20
	db $8B, $20
	db $8B, $10
	db $8E, $10
	db $8F, $10
	db $90, $A0
	db !end_sequence

.seq_18F0:
	db $80, $10
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_variable_note_1, $A1
	db !set_variable_note_2, $A1
	db !play_subsequence : dw .subseq_21E2
	db !set_variable_note_1, $A0
	db !set_variable_note_2, $A0
	db !play_subsequence : dw .subseq_21E2
	db !set_adsr, $EE, $40
	db !play_subsequence : dw .subseq_21E2
	db !end_sequence

.seq_190F:
	db $80, $10
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $9E
	db !play_subsequence : dw .subseq_21E2
	db !set_variable_note_1, $9A
	db !set_variable_note_2, $9A
	db !play_subsequence : dw .subseq_21E2
	db !set_adsr, $EE, $40
	db !play_subsequence : dw .subseq_21E2
	db !end_sequence

.seq_192E:
	db !change_instr_pitch, $02
	db !fine_tune, $F2
	db !set_instrument, $B2
	db !set_volume_l_and_r, $08, $0F
	db !set_adsr, $8E, $E0
	db $80, $14
	db !jump_to_sequence : dw .loop_point_18B1

.seq_193F:
	db $80, $10
	db !loop_subsequence, $02 : dw .subseq_1ED8
	db !play_subsequence : dw .subseq_1FA1
	db !end_sequence

.seq_1949:
	db $80, $10
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_variable_note_1, $97
	db !set_variable_note_2, $97
	db !play_subsequence : dw .subseq_21E2
	db !set_variable_note_1, $97
	db !set_variable_note_2, $97
	db !play_subsequence : dw .subseq_21E2
	db !set_adsr, $EF, $40
	db !play_subsequence : dw .subseq_21E2
	db !end_sequence

.subseq_1968:
	db $80, $10
	db !return_from_sub

.unreached_196B:
	db !echo_off
	db !set_vol_single_val, $00
	db $80, $10
	db !return_from_sub

.seq_1971:
	db !echo_delay, $02
	db !set_master_volume_indirect, $56
	db !play_subsequence : dw .subseq_1968
	db !play_subsequence : dw .subseq_1898
	db $80, $80
	db $80, $80
.loop_point_197F:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !loop_subsequence, $0C : dw .subseq_1AA9
	db !echo_on
	db !set_voice_parameters, $B3, $FC, $F6, $1C, $0B, $BC, $8F
	db !play_subsequence : dw .subseq_19CC
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !loop_subsequence, $08 : dw .subseq_1AA9
	db !set_instrument, $2F
	db !change_instr_pitch, $00
	db !set_adsr, $DF, $B4
	db !loop_subsequence, $08 : dw .subseq_1CD2
	db $80, $04
	db !set_voice_parameters, $B2, $F6, $F2, $2D, $19, $8E, $E0
	db !play_subsequence : dw .subseq_1B67
	db $9B, $2C
	db !set_instrument, $AD
	db !set_vol_single_val, $3C
	db !set_adsr, $8F, $E0
	db $99, $08
	db $96, $08
	db $99, $10
	db $99, $08
	db $96, $08
	db $94, $10
	db !jump_to_sequence : dw .loop_point_197F
	db !end_sequence

.subseq_19CC:
	db $80, $0E
	db !set_volume_l_and_r, $14, $0E
	db $9E, $10
	db !set_volume_l_and_r, $05, $0A
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $05, $03
	db $9B, $08
	db !play_subsequence : dw .subseq_1A95
	db $9D, $10
	db !set_volume_l_and_r, $14, $0E
	db $99, $18
	db !set_volume_l_and_r, $05, $0A
	db $99, $08
	db !set_volume_l_and_r, $14, $0E
	db $96, $18
	db !set_volume_l_and_r, $05, $0A
	db $96, $08
	db !set_volume_l_and_r, $14, $0E
	db $9B, $18
	db !set_volume_l_and_r, $05, $0A
	db $9B, $10
	db !set_volume_l_and_r, $05, $03
	db $9B, $08
	db !set_volume_l_and_r, $14, $0E
	db $9D, $10
	db $9E, $10
	db !set_volume_l_and_r, $05, $0A
	db $9D, $10
	db $9E, $10
	db !set_volume_l_and_r, $05, $03
	db $9D, $08
	db !play_subsequence : dw .subseq_1A95
	db !set_volume_l_and_r, $14, $0E
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $05, $0A
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $05, $03
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $01, $04
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $14, $0E
	db !set_adsr, $BE, $91
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $05, $0A
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $05, $03
	db $9B, $08
	db !play_subsequence : dw .subseq_1A95
	db $9D, $10
	db !set_volume_l_and_r, $14, $0E
	db $A2, $10
	db !set_volume_l_and_r, $05, $0A
	db $A2, $10
	db !set_volume_l_and_r, $05, $03
	db $A2, $10
	db !set_volume_l_and_r, $14, $0E
	db $A3, $08
	db $A2, $08
	db $A0, $10
	db $A2, $08
	db $A0, $08
	db $9E, $10
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $05, $0A
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $05, $03
	db $9B, $08
	db !play_subsequence : dw .subseq_1A95
	db !set_volume_l_and_r, $14, $0E
	db $99, $02
	db !return_from_sub

.subseq_1A95:
	db !set_volume_l_and_r, $14, $0E
	db $A0, $08
	db $9D, $10
	db !set_volume_l_and_r, $05, $0A
	db $A0, $08
	db $9D, $10
	db !set_volume_l_and_r, $05, $03
	db $A0, $08
	db !return_from_sub

.subseq_1AA9:
	db !set_instrument, $AD
	db !set_vol_single_val, $3C
	db !set_adsr, $8F, $E0
	db $90, $20
	db !set_instrument, $AE
	db !set_vol_single_val, $32
	db !set_adsr, $8F, $E0
	db $91, $10
	db !set_adsr, $8C, $E0
	db !set_vol_single_val, $0B
	db $91, $08
	db !set_instrument, $AD
	db !set_vol_single_val, $3C
	db !set_adsr, $8F, $E0
	db $92, $08
	db $90, $10
	db $90, $10
	db !set_instrument, $AE
	db !set_vol_single_val, $32
	db !set_adsr, $8F, $E0
	db $91, $10
	db !set_adsr, $8C, $E0
	db !set_vol_single_val, $0B
	db $91, $10
	db !return_from_sub

.seq_1AE0:
	db !play_subsequence : dw .subseq_1968
	db !set_instrument, $2F
	db !change_instr_pitch, $00
	db !set_adsr, $DF, $B4
	db !loop_subsequence, $04 : dw .subseq_1CD2
.loop_point_1AEE:
	db !loop_subsequence, $0E : dw .subseq_1CD2
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_instrument, $3F
	db !set_adsr, $DF, $53
	db !play_subsequence : dw .subseq_1C94
	db $80, $04
	db $AA, $04
	db $80, $B8
	db !play_subsequence : dw .subseq_1C94
	db $80, $04
	db $AA, $04
	db $80, $B8
	db !play_subsequence : dw .subseq_1C94
	db $80, $04
	db $AA, $04
	db $80, $28
	db !echo_on
	db !set_voice_parameters, $B3, $FC, $F6, $28, $32, $BE, $91
	db $9B, $08
	db $9D, $08
	db !play_subsequence : dw .subseq_1BB9
	db !echo_off
	db !loop_subsequence, $04 : dw .subseq_1B59
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_instrument, $3F
	db !set_adsr, $DF, $53
	db !play_subsequence : dw .subseq_1B5F
	db $80, $38
	db !play_subsequence : dw .subseq_1B5F
	db $80, $38
	db !play_subsequence : dw .subseq_1B5F
	db $80, $38
	db !play_subsequence : dw .subseq_1B5F
	db $80, $28
	db !set_voice_parameters, $B2, $F6, $F2, $5A, $6E, $8E, $E0
	db !loop_subsequence, $01 : dw .subseq_1B67
	db $9B, $80
	db !jump_to_sequence : dw .loop_point_1AEE

.subseq_1B59:
	db !play_subsequence : dw .subseq_1B9E
	db $80, $38
	db !return_from_sub

.subseq_1B5F:
	db !play_subsequence : dw .subseq_1C94
	db $80, $04
	db $AA, $04
	db !return_from_sub

.subseq_1B67:
	db $9B, $10
	db $9E, $30
	db $A0, $10
	db $9D, $40
	db $99, $20
	db $96, $20
	db $9B, $30
	db $9D, $10
	db $9E, $30
	db $A0, $10
	db $9D, $20
	db $99, $20
	db $9B, $60
	db $80, $10
	db $9D, $10
	db $9E, $30
	db $A0, $10
	db $9D, $40
	db $A2, $20
	db $A3, $10
	db $A2, $10
	db $A0, $20
	db $9D, $20
	db $9E, $30
	db $A0, $10
	db $9D, $20
	db $99, $20
	db !return_from_sub

.subseq_1B9E:
	db !set_voice_parameters, $8B, $F8, $F2, $7F, $7F, $CF, $70
	db $83, $80
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_instrument, $3F
	db !set_adsr, $DF, $53
	db !play_subsequence : dw .subseq_1C94
	db $80, $04
	db $AA, $04
	db !return_from_sub

.subseq_1BB9:
	db !set_volume_l_and_r, $28, $3C
	db $9E, $10
	db !set_volume_l_and_r, $1C, $10
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $08, $0E
	db $9B, $08
	db !play_subsequence : dw .subseq_1C80
	db $9D, $10
	db !set_volume_l_and_r, $28, $3C
	db $99, $18
	db !set_volume_l_and_r, $1C, $10
	db $99, $08
	db !set_volume_l_and_r, $28, $3C
	db $96, $18
	db !set_volume_l_and_r, $1C, $10
	db $96, $08
	db !set_volume_l_and_r, $28, $3C
	db $9B, $18
	db !set_volume_l_and_r, $1C, $10
	db $9B, $10
	db !set_volume_l_and_r, $08, $0E
	db $9B, $08
	db !set_volume_l_and_r, $28, $3C
	db $9D, $10
	db $9E, $10
	db !set_volume_l_and_r, $1C, $10
	db $9D, $10
	db $9E, $10
	db !set_volume_l_and_r, $08, $0E
	db $9D, $08
	db !play_subsequence : dw .subseq_1C80
	db !set_volume_l_and_r, $28, $3C
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $1C, $10
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $08, $0E
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $07, $04
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $28, $3C
	db !set_adsr, $BE, $91
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $1C, $10
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $08, $0E
	db $9B, $08
	db !play_subsequence : dw .subseq_1C80
	db $9D, $10
	db !set_volume_l_and_r, $28, $3C
	db $A2, $10
	db !set_volume_l_and_r, $1C, $10
	db $A2, $10
	db !set_volume_l_and_r, $08, $0E
	db $A2, $10
	db !set_volume_l_and_r, $28, $3C
	db $A3, $08
	db $A2, $08
	db $A0, $10
	db $A2, $08
	db $A0, $08
	db $9E, $10
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $1C, $10
	db $9B, $08
	db $9D, $08
	db $9E, $10
	db !set_volume_l_and_r, $08, $0E
	db $9B, $08
	db !play_subsequence : dw .subseq_1C80
	db !set_volume_l_and_r, $28, $3C
	db $99, $10
	db !return_from_sub

.subseq_1C80:
	db !set_volume_l_and_r, $28, $3C
	db $A0, $08
	db $9D, $10
	db !set_volume_l_and_r, $1C, $10
	db $A0, $08
	db $9D, $10
	db !set_volume_l_and_r, $08, $0E
	db $A0, $08
	db !return_from_sub

.subseq_1C94:
	db !set_volume_l_and_r, $32, $14
	db $8F, $08
	db !set_default_duration, $04
	db $92
	db !set_volume_l_and_r, $08, $15
	db $8F
	db !set_volume_l_and_r, $32, $14
	db $96
	db !set_volume_l_and_r, $08, $15
	db $92
	db !set_volume_l_and_r, $32, $14
	db $9B
	db !set_volume_l_and_r, $08, $15
	db $96
	db !set_volume_l_and_r, $32, $14
	db $9E
	db !set_volume_l_and_r, $08, $15
	db $9B
	db !set_volume_l_and_r, $32, $14
	db $A2
	db !set_volume_l_and_r, $08, $15
	db $9E
	db !set_volume_l_and_r, $32, $14
	db $A7
	db !set_volume_l_and_r, $08, $15
	db $A2
	db !set_volume_l_and_r, $32, $14
	db $AA
	db !set_volume_l_and_r, $08, $15
	db $A7
	db !default_duration_off
	db !return_from_sub

.subseq_1CD2:
	db !set_default_duration, $10
	db !set_vol_single_val, $28
	db $90
	db !set_vol_single_val, $0F
	db $90
	db !set_vol_single_val, $32
	db $85
	db !set_vol_single_val, $11
	db $85
	db !default_duration_off
	db !return_from_sub

.seq_1CE2:
	db !play_subsequence : dw .subseq_1968
	db $80, $80
	db $80, $80
.loop_point_1CE9:
	db !set_voice_parameters, $8B, $F8, $F2, $7F, $7F, $CF, $70
	db !loop_subsequence, $03 : dw .subseq_1D33
	db $83, $58
	db !set_voice_parameters, $18, $FB, $D4, $64, $64, $9F, $75
	db $92, $08
	db $94, $08
	db $92, $08
	db $94, $10
	db !loop_subsequence, $02 : dw .subseq_1D91
	db !play_subsequence : dw .subseq_1D36
	db !set_instrument, $18
	db !change_instr_pitch, $FB
	db !fine_tune, $D4
	db !set_adsr, $9F, $75
	db !loop_subsequence, $02 : dw .subseq_1D91
	db !set_voice_parameters, $14, $E4, $02, $7F, $7F, $8B, $E0
	db !loop_subsequence, $04 : dw .subseq_1D33
	db !play_subsequence : dw .subseq_1D36
	db !set_variable_note_1, $8F
	db !loop_subsequence, $02 : dw .subseq_1D65
	db !jump_to_sequence : dw .loop_point_1CE9

.subseq_1D33:
	db $83, $80
	db !return_from_sub

.subseq_1D36:
	db !play_subsequence : dw .subseq_1D50
	db !play_subsequence : dw .subseq_1D45
	db !set_variable_note_1, $8F
	db !loop_subsequence, $02 : dw .subseq_1D65
	db !play_subsequence : dw .subseq_1D50
.subseq_1D45:
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1D65
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1D65
	db !return_from_sub

.subseq_1D50:
	db !set_variable_note_1, $8B
	db !play_subsequence : dw .subseq_1D65
	db !set_variable_note_1, $8D
	db !play_subsequence : dw .subseq_1D65
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_1D65
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_1D65
	db !return_from_sub

.subseq_1D65:
	db !set_voice_parameters, $18, $FB, $D4, $64, $64, $9F, $75
	db !set_default_duration, $08
	db $E0
	db !set_voice_parameters, $47, $F9, $E8, $3C, $3C, $9F, $92
	db $E0
	db !set_instrument, $49
	db $E0
	db !set_instrument, $4B
	db $E0
	db !set_vol_single_val, $1A
	db $E0
	db !set_instrument, $4D
	db !set_vol_single_val, $3C
	db $E0
	db !set_vol_single_val, $1A
	db $E0
	db !set_instrument, $4F
	db !set_vol_single_val, $3C
	db $E0
	db !default_duration_off
	db !return_from_sub

.subseq_1D91:
	db !set_adsr, $9F, $73
	db !set_vol_single_val, $50
	db $9B, $58
	db !play_subsequence : dw .subseq_1DCC
	db !set_adsr, $9F, $73
	db !set_vol_single_val, $50
	db $9B, $10
	db $99, $08
	db $9B, $40
	db !play_subsequence : dw .subseq_1DCC
	db $9B, $58
	db !set_adsr, $9F, $75
	db !set_vol_single_val, $64
	db $92, $08
	db $94, $08
	db $92, $08
	db $94, $10
	db !set_adsr, $9F, $73
	db !set_vol_single_val, $50
	db $9B, $08
	db $9B, $08
	db $99, $08
	db $9B, $50
	db !set_vol_single_val, $64
	db $92, $08
	db $94, $10
	db !return_from_sub

.subseq_1DCC:
	db !set_adsr, $9F, $75
	db !set_vol_single_val, $64
	db $92, $08
	db $94, $08
	db $92, $08
	db $94, $10
	db !return_from_sub

.seq_1DDA:
	db !play_subsequence : dw .subseq_1968
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !loop_subsequence, $02 : dw .subseq_1ED8
.loop_point_1DE5:
	db !loop_subsequence, $13 : dw .subseq_1ED8
	db !echo_on
	db !set_voice_parameters, $B4, $F8, $F2, $3C, $3C, $9E, $C0
	db $9B, $10
	db !set_volume_l_and_r, $14, $0A
	db !play_subsequence : dw .subseq_1E7D
	db $80, $60
	db !set_voice_parameters, $B4, $F8, $F2, $32, $32, $9E, $C0
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $0F, $14
	db !play_subsequence : dw .subseq_1E7D
	db $80, $70
	db !echo_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !loop_subsequence, $0F : dw .subseq_1ED8
	db $80, $40
	db !set_voice_parameters, $B4, $F8, $F2, $3C, $28, $9E, $C0
	db $9B, $08
	db $99, $08
	db $9B, $10
	db $9B, $08
	db $99, $08
	db $9B, $10
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !jump_to_sequence : dw .loop_point_1DE5

.subseq_1E36:
	db !change_instr_pitch, $11
	db !fine_tune, $E8
	db !set_adsr, $8B, $E0
	db !set_instrument, $4C
	db !pitch_slide_up, $00, $01, $0C, $52, $00
	db $A0, $10
	db !set_instrument, $4E
	db !pitch_slide_up, $00, $01, $0A, $58, $00
	db $9E, $10
	db !set_instrument, $4F
	db !pitch_slide_up, $00, $01, $0C, $52, $00
	db $A0, $08
	db !set_instrument, $4D
	db !pitch_slide_up, $00, $01, $05, $50, $00
	db $9D, $10
	db $9D, $08
	db !set_instrument, $4B
	db !pitch_slide_up, $00, $01, $0A, $58, $00
	db $9E, $10
	db !set_instrument, $49
	db !pitch_slide_up, $00, $01, $09, $52, $00
	db $9B, $10
	db !pitch_slide_off
	db !return_from_sub

.subseq_1E7D:
	db !change_instr_pitch, $11
	db !fine_tune, $E8
	db !set_adsr, $8B, $E0
	db !set_instrument, $41
	db !pitch_slide_up, $00, $01, $0C, $52, $00
	db $A0, $10
	db !set_instrument, $43
	db !pitch_slide_up, $00, $01, $0A, $58, $00
	db $9E, $10
	db !set_instrument, $45
	db !pitch_slide_up, $00, $01, $0C, $52, $00
	db $A0, $08
	db !set_instrument, $47
	db !pitch_slide_up, $00, $01, $05, $50, $00
	db $9D, $10
	db $9D, $08
	db !set_instrument, $48
	db !pitch_slide_up, $00, $01, $0A, $58, $00
	db $9E, $10
	db !set_instrument, $49
	db !pitch_slide_up, $00, $01, $09, $52, $00
	db $9B, $10
	db !set_instrument, $4A
	db !pitch_slide_down, $00, $01, $08, $52, $00
	db $9B, $10
	db !set_instrument, $4B
	db !pitch_slide_up, $00, $01, $08, $52, $00
	db $99, $10
	db !pitch_slide_off
	db !return_from_sub

.subseq_1ED8:
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $AB, $51
	db !set_instrument, $0D
	db $8D, $10
	db !set_volume_l_and_r, $0A, $28
	db !set_adsr, $AF, $51
	db !set_instrument, $1A
	db $81, $08
	db !set_volume_l_and_r, $0A, $08
	db !set_adsr, $CF, $34
	db !set_instrument, $2B
	db $B0, $10
	db !set_volume_l_and_r, $32, $14
	db !set_adsr, $CF, $37
	db !set_instrument, $AE
	db $8D, $08
	db !set_volume_l_and_r, $08, $14
	db !set_adsr, $AF, $2B
	db !set_instrument, $2F
	db $A8, $08
	db !set_volume_l_and_r, $3C, $0A
	db $85, $10
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $AC, $37
	db !set_instrument, $0D
	db $95, $08
	db !set_volume_l_and_r, $04, $14
	db !set_adsr, $AF, $51
	db !set_instrument, $1A
	db $A1, $08
	db !set_volume_l_and_r, $0A, $08
	db !set_adsr, $CF, $34
	db !set_instrument, $2B
	db $B0, $10
	db !set_volume_l_and_r, $32, $14
	db !set_adsr, $CF, $37
	db !set_instrument, $AE
	db $8D, $08
	db !set_volume_l_and_r, $08, $14
	db !set_adsr, $AF, $2B
	db !set_instrument, $2F
	db $A8, $08
	db !set_volume_l_and_r, $3C, $0A
	db $85, $08
	db !return_from_sub

.seq_1F47:
	db !play_subsequence : dw .subseq_1968
	db $80, $0C
	db !loop_subsequence, $02 : dw .subseq_1FA1
.loop_point_1F50:
	db !loop_subsequence, $13 : dw .subseq_1FA1
	db !echo_on
	db !set_voice_parameters, $B4, $F8, $F2, $17, $17, $9E, $C0
	db $9B, $10
	db !set_volume_l_and_r, $03, $08
	db !play_subsequence : dw .subseq_1E7D
	db $80, $60
	db !set_voice_parameters, $B4, $F8, $F2, $14, $14, $9E, $C0
	db $99, $10
	db $9B, $10
	db !set_volume_l_and_r, $08, $03
	db !play_subsequence : dw .subseq_1E7D
	db $80, $70
	db !echo_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !loop_subsequence, $0F : dw .subseq_1FA1
	db $80, $40
	db !set_voice_parameters, $B4, $F8, $F2, $0A, $1E, $9E, $C0
	db $9B, $08
	db $99, $08
	db $9B, $10
	db $9B, $08
	db $99, $08
	db $9B, $10
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !jump_to_sequence : dw .loop_point_1F50

.subseq_1FA1:
	db !set_volume_l_and_r, $03, $0B
	db !set_adsr, $AB, $51
	db !set_instrument, $0D
	db $8D, $10
	db !set_volume_l_and_r, $0E, $02
	db !set_adsr, $AF, $51
	db !set_instrument, $1A
	db $81, $08
	db !set_volume_l_and_r, $01, $04
	db !set_adsr, $CF, $34
	db !set_instrument, $2B
	db $B0, $10
	db !set_volume_l_and_r, $06, $11
	db !set_adsr, $CF, $37
	db !set_instrument, $AE
	db $8D, $08
	db !set_volume_l_and_r, $05, $02
	db !set_adsr, $AF, $2B
	db !set_instrument, $2F
	db $A8, $08
	db !set_volume_l_and_r, $03, $12
	db $85, $10
	db !set_volume_l_and_r, $05, $09
	db !set_adsr, $AC, $37
	db !set_instrument, $0D
	db $95, $08
	db !set_volume_l_and_r, $07, $02
	db !set_adsr, $AF, $51
	db !set_instrument, $1A
	db $A1, $08
	db !set_volume_l_and_r, $01, $03
	db !set_adsr, $CF, $34
	db !set_instrument, $2B
	db $B0, $10
	db !set_volume_l_and_r, $05, $11
	db !set_adsr, $CF, $37
	db !set_instrument, $AE
	db $8D, $08
	db !set_volume_l_and_r, $05, $01
	db !set_adsr, $AF, $2B
	db !set_instrument, $2F
	db $A8, $08
	db !set_volume_l_and_r, $03, $12
	db $85, $08
	db !return_from_sub

.seq_2010:
	db !play_subsequence : dw .subseq_1968
	db $80, $80
	db $80, $80
.loop_point_2017:
	db $80, $C0
	db $80, $C0
	db !set_voice_parameters, $AE, $F8, $00, $3C, $64, $BE, $4B
	db $80, $08
	db $98, $10
	db $98, $18
	db $94, $08
	db $94, $10
	db !set_volume_l_and_r, $64, $3C
	db $90, $08
	db $90, $10
	db $90, $08
	db $8E, $08
	db !set_volume_l_and_r, $32, $50
	db $85, $10
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_20B1
	db !set_voice_parameters, $14, $F0, $02, $26, $0A, $88, $E8
	db !play_subsequence : dw .subseq_209A
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_20B1
	db !echo_on
	db !set_voice_parameters, $3F, $11, $E8, $0C, $14, $8B, $E0
	db !pitch_slide_up, $00, $01, $08, $52, $00
	db $99, $10
	db !play_subsequence : dw .subseq_1E7D
	db !set_volume_l_and_r, $0A, $05
	db !play_subsequence : dw .subseq_1E7D
	db !set_volume_l_and_r, $0C, $14
	db !play_subsequence : dw .subseq_1E7D
	db !set_volume_l_and_r, $0A, $05
	db !play_subsequence : dw .subseq_1E36
	db $80, $10
	db !set_voice_parameters, $14, $F0, $02, $14, $06, $86, $E8
	db !change_instr_pitch_rel, $0C
	db !play_subsequence : dw .subseq_209A
	db $A2, $80
	db !change_instr_pitch_rel, $F4
	db !jump_to_sequence : dw .loop_point_2017

.subseq_209A:
	db $9E, $40
	db $9D, $80
	db $9B, $40
	db $9E, $40
	db $A0, $40
	db $A2, $80
	db $9E, $40
	db $9D, $80
	db $9B, $40
	db $9E, $40
	db $A0, $40
	db !return_from_sub

.subseq_20B1:
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $9E
	db !play_subsequence : dw .subseq_21E2
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $A0
	db !play_subsequence : dw .subseq_21E2
	db !return_from_sub

.seq_20C0:
	db !play_subsequence : dw .subseq_1968
	db $80, $80
	db $80, $80
.loop_point_20C7:
	db $80, $C0
	db $80, $C0
	db !set_instrument, $AE
	db !set_adsr, $BD, $45
	db !change_instr_pitch, $F8
	db !fine_tune, $00
	db $80, $0E
	db !set_volume_l_and_r, $11, $1E
	db $80, $08
	db $98, $10
	db $98, $18
	db $94, $08
	db $94, $10
	db !set_volume_l_and_r, $1E, $11
	db $90, $08
	db $90, $10
	db $90, $08
	db $8E, $08
	db !set_volume_l_and_r, $0B, $1C
	db $85, $02
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_2169
	db !set_voice_parameters, $14, $F0, $02, $0A, $26, $88, $E8
	db !play_subsequence : dw .subseq_2152
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_2169
	db $80, $0E
	db !echo_on
	db !set_voice_parameters, $3F, $11, $E8, $08, $04, $8B, $E0
	db !pitch_slide_up, $00, $01, $08, $52, $00
	db $99, $10
	db !play_subsequence : dw .subseq_1E7D
	db !set_volume_l_and_r, $02, $05
	db !play_subsequence : dw .subseq_1E7D
	db !set_volume_l_and_r, $08, $04
	db !play_subsequence : dw .subseq_1E7D
	db !set_volume_l_and_r, $02, $05
	db !play_subsequence : dw .subseq_1E36
	db $80, $02
	db !set_voice_parameters, $14, $F0, $02, $06, $14, $86, $E8
	db !change_instr_pitch_rel, $0C
	db !play_subsequence : dw .subseq_2152
	db $9E, $80
	db !change_instr_pitch_rel, $F4
	db !jump_to_sequence : dw .loop_point_20C7

.subseq_2152:
	db $9B, $40
	db $99, $80
	db $96, $40
	db $9B, $40
	db $9D, $40
	db $9E, $80
	db $9B, $40
	db $99, $80
	db $96, $40
	db $9B, $40
	db $9D, $40
	db !return_from_sub

.subseq_2169:
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $A0
	db !play_subsequence : dw .subseq_21E2
	db !set_variable_note_1, $A2
	db !set_variable_note_2, $A4
	db !play_subsequence : dw .subseq_21E2
	db !return_from_sub

.seq_2178:
	db !play_subsequence : dw .subseq_1968
	db $80, $80
	db $80, $80
.loop_point_217F:
	db $80, $80
	db $80, $C0
	db $80, $C0
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_21D3
	db !set_vol_single_val, $18
	db !set_adsr, $88, $E8
	db !play_subsequence : dw .subseq_21BB
	db !change_instr_pitch, $05
	db !fine_tune, $E8
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_21D3
	db $80, $80
	db $80, $C0
	db $80, $C0
	db !set_vol_single_val, $0F
	db !set_adsr, $86, $E8
	db !change_instr_pitch_rel, $0C
	db !play_subsequence : dw .subseq_21BB
	db $9B, $80
	db !change_instr_pitch_rel, $F4
	db !jump_to_sequence : dw .loop_point_217F
	db !end_sequence

.subseq_21BB:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_default_duration, $40
	db $97
	db $94
	db $96
	db $92
	db $97
	db $99
	db $9D
	db $9B
	db $97
	db $94
	db $96
	db $92
	db $97
	db $99
	db !default_duration_off
	db !return_from_sub

.subseq_21D3:
	db !set_variable_note_1, $A2
	db !set_variable_note_2, $A4
	db !play_subsequence : dw .subseq_21E2
	db !set_variable_note_1, $A5
	db !set_variable_note_2, $A5
	db !play_subsequence : dw .subseq_21E2
	db !return_from_sub

.subseq_21E2:
	db !set_default_duration, $08
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $49
	db $E0
	db !set_instrument, $39
	db $E0
	db !set_instrument, $3B
	db $E0
	db !set_instrument, $3D
	db $E0
	db !set_instrument, $4F
	db $E0
	db !set_volume_l_and_r, $07, $02
	db $E0
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $49
	db !set_default_duration, $04
	db $E0
	db !set_volume_l_and_r, $07, $02
	db $E0
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $4A
	db !set_default_duration, $08
	db $E0
	db !set_volume_l_and_r, $07, $02
	db $E0
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $4B
	db $E0
	db !set_volume_l_and_r, $07, $02
	db $E0
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $4C
	db $E0
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $4E
	db $E1
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $48
	db $E1
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $4B
	db $E1
	db !set_volume_l_and_r, $06, $0E
	db !set_instrument, $4D
	db $E1
	db !default_duration_off
	db !return_from_sub

base off
arch 65816
.end: