;0B Flight of the Zinger
;2E8BC0
wasp_hive_song_data:
	dw !bgm_loc, $080E
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1EB2, .seq_1EF3, .seq_21D3, .seq_1FA2, .seq_2172, .seq_22C6, .seq_20C9, .seq_2273
	db $80, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: Flight of the Zinger
	dw .chn_ptrs_131E	;01: Lost Life
	dw .chn_ptrs_1330	;02: Diddy Victory
	dw .chn_ptrs_1342	;03: Dixie Victory
	dw .chn_ptrs_1354	;04: Hit Target
	dw .chn_ptrs_1366	;05: Run, Rambi! Run!

;sub-track 01 channel pointers
.chn_ptrs_131E:
	dw .seq_1D4E, .seq_1DE9, .seq_1E49, .seq_1E29, .seq_1E0C, .seq_1E65, .seq_1E7E, .seq_1E9A
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_1330:
	dw .seq_1A59, .seq_1AE9, .seq_1BC3, .seq_1C1C, .seq_1ABB, .seq_1D0B, .seq_1CDF, .seq_1B6C
	db $DE, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_1342:
	dw .seq_18C1, .seq_1933, .seq_197C, .seq_19F9, .seq_1909, .seq_1A37, .seq_1A48, .seq_1A18
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 04 channel pointers
.chn_ptrs_1354:
	dw .seq_17C5, .seq_1812, .seq_1828, .seq_1848, .seq_185E, .seq_1896, .seq_1874, .seq_1889
	db $C0, $FF	;music tempo, sound effect tempo

;sub-track 05 channel pointers
.chn_ptrs_1366:
	dw .seq_1379, .seq_13DF, .seq_153E, .seq_16E9, .seq_144D, .seq_17AD, .seq_1661, .seq_1733
	db $70, $FF	;music tempo, sound effect tempo

.unreached_1378:
	db !end_sequence

.seq_1379:
	db !set_echo, $2C, $21, $21
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !change_instr_pitch, $FC
	db !fine_tune, $F8
	db !set_volume_l_and_r, $17, $26
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_default_duration, $04
.loop_point_1393:
	db !loop_subsequence, $04 : dw .subseq_13A1
	db !set_variable_note_1, $99
	db !loop_subsequence, $04 : dw .subseq_13AE
	db !jump_to_sequence : dw .loop_point_1393
	db !end_sequence

.subseq_13A1:
	db !set_variable_note_1, $94
	db !loop_subsequence, $01 : dw .subseq_13AE
	db !set_variable_note_1, $95
	db !loop_subsequence, $01 : dw .subseq_13AE
	db !return_from_sub

.subseq_13AE:
	db !set_instrument, $92
	db $E0
	db !set_instrument, $91
	db $E0
	db !set_instrument, $93
	db $E0
	db !set_instrument, $91
	db $E0
	db !set_instrument, $92
	db $E0
	db !set_instrument, $91
	db $E0
	db !set_instrument, $93
	db $E0
	db !set_instrument, $92
	db $E0
	db !set_instrument, $91
	db $E0
	db !set_instrument, $92
	db $E0
	db !set_instrument, $92
	db $E0
	db !set_instrument, $93
	db $E0
	db !set_instrument, $92
	db $E0
	db !set_instrument, $91
	db $E0
	db !set_instrument, $93
	db $E0
	db !set_instrument, $91
	db $E0
	db !return_from_sub

.seq_13DF:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $7F
	db !set_adsr, $8E, $F1
.loop_point_13EA:
	db !change_instr_pitch, $E4
	db !loop_subsequence, $04 : dw .subseq_13FA
	db !change_instr_pitch, $EB
	db !loop_subsequence, $04 : dw .subseq_1438
	db !jump_to_sequence : dw .loop_point_13EA
	db !end_sequence

.subseq_13FA:
	db !loop_subsequence, $01 : dw .subseq_1407
	db !change_instr_pitch_rel, $01
	db !loop_subsequence, $01 : dw .subseq_1407
	db !change_instr_pitch_rel, $FF
	db !return_from_sub

.subseq_1407:
	db $88, $03
	db $80, $01
	db $88, $03
	db $80, $01
	db $88, $03
	db $80, $01
	db $88, $08
	db $80, $04
	db $88, $03
	db $80, $01
	db $88, $03
	db $80, $01
	db $88, $03
	db $80, $01
	db $88, $03
	db $80, $01
	db $88, $06
	db $80, $02
	db $88, $03
	db $80, $01
	db $88, $03
	db $80, $01
	db $88, $06
	db $80, $02
	db !return_from_sub

.subseq_1438:
	db $86, $0C
	db $80, $04
	db $86, $08
	db $80, $04
	db $86, $08
	db $80, $04
	db $86, $06
	db $80, $02
	db $86, $0C
	db $80, $04
	db !return_from_sub

.seq_144D:
	db !set_instrument, $19
	db !set_adsr, $8F, $F4
	db !set_volume_l_and_r, $1C, $0C
	db !echo_on
	db !echo_on
.loop_point_1457:
	db !set_volume_l_and_r, $14, $23
	db !play_subsequence : dw .subseq_1501
	db !set_volume_l_and_r, $23, $0F
	db !play_subsequence : dw .subseq_14E8
	db !set_volume_l_and_r, $14, $23
	db !play_subsequence : dw .subseq_1501
	db !set_volume_l_and_r, $23, $0F
	db !play_subsequence : dw .subseq_14CD
	db !set_volume_l_and_r, $14, $23
	db !play_subsequence : dw .subseq_1501
	db !set_volume_l_and_r, $23, $0F
	db !play_subsequence : dw .subseq_14E8
	db !set_volume_l_and_r, $14, $23
	db !play_subsequence : dw .subseq_1501
	db !set_volume_l_and_r, $23, $0F
	db !play_subsequence : dw .subseq_14B2
	db !set_volume_l_and_r, $11, $21
	db !loop_subsequence, $04 : dw .subseq_1492
	db !jump_to_sequence : dw .loop_point_1457
	db !end_sequence

.subseq_1492:
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_adsr, $8F, $E0
	db $A5, $04
	db $A5, $04
	db $A5, $04
	db $A5, $04
	db $A5, $0C
	db $A5, $08
	db $A5, $04
	db $A5, $08
	db $A5, $08
	db $A5, $04
	db $A5, $04
	db !return_from_sub

.subseq_14B2:
	db !set_instrument, $1C
	db !change_instr_pitch, $0E
	db !fine_tune, $30
	db !set_adsr, $8D, $EB
	db !vibrato_with_delay, $02, $04, $0B, $05
	db $95, $10
	db $9B, $08
	db $9C, $10
	db $A0, $08
	db $A1, $08
	db $A3, $08
	db !return_from_sub

.subseq_14CD:
	db !set_instrument, $1C
	db !change_instr_pitch, $0E
	db !fine_tune, $30
	db !set_adsr, $8D, $EB
	db !vibrato_with_delay, $02, $04, $0B, $05
	db $95, $10
	db $9B, $08
	db $9C, $10
	db $A0, $08
	db $A1, $08
	db $A0, $08
	db !return_from_sub

.subseq_14E8:
	db !set_instrument, $1C
	db !change_instr_pitch, $0E
	db !fine_tune, $30
	db !set_adsr, $8D, $EB
	db !vibrato_with_delay, $02, $04, $0B, $05
	db $95, $10
	db $9B, $08
	db $9C, $18
	db $9E, $08
	db $9C, $08
	db !return_from_sub

.subseq_1501:
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_adsr, $8F, $E0
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $08
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $04
	db $A0, $08
	db $A0, $04
	db $A0, $04
	db $A0, $08
	db !return_from_sub

.unreached_1525:
	db $A0, $04
	db $9D, $04
	db $9D, $04
	db $9D, $04
	db $9D, $0C
	db $9D, $08
	db $A0, $04
	db $A0, $08
	db $A0, $04
	db $9D, $04
	db $A4, $04
	db $A4, $04
	db !return_from_sub

.seq_153E:
	db !echo_on
.loop_point_153F:
	db !loop_subsequence, $08 : dw .subseq_15AF
	db !loop_subsequence, $04 : dw .subseq_154B
	db !jump_to_sequence : dw .loop_point_153F
	db !end_sequence

.subseq_154B:
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db $95, $04
	db $95, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db $95, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $04
	db !set_vol_single_val, $1E
	db $9A, $04
	db !set_vol_single_val, $50
	db $9A, $04
	db $9A, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $04
	db $9A, $04
	db !return_from_sub

.subseq_15AF:
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db $95, $04
	db $95, $08
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $08
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db $95, $04
	db $95, $04
	db $95, $04
	db $95, $04
	db !set_adsr, $EF, $33
	db !set_instrument, $90
	db !set_volume_l_and_r, $14, $1E
	db $A2, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $04
	db $9A, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $08
	db !return_from_sub

.unreached_15F5:
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db !set_adsr, $EF, $33
	db !set_instrument, $90
	db !set_volume_l_and_r, $1E, $28
	db $A2, $04
	db $A2, $04
	db !set_volume_l_and_r, $0F, $0A
	db $A2, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $04
	db !set_adsr, $EF, $33
	db !set_instrument, $90
	db !set_volume_l_and_r, $28, $1E
	db $A2, $04
	db $A2, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db !set_vol_single_val, $1E
	db $95, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $00
	db !set_vol_single_val, $46
	db $95, $04
	db $95, $04
	db !set_adsr, $EF, $33
	db !set_instrument, $90
	db !set_volume_l_and_r, $1E, $28
	db $A5, $04
	db !set_adsr, $8F, $F2
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db $9A, $04
	db !set_adsr, $EF, $33
	db !set_instrument, $90
	db !set_volume_l_and_r, $28, $1E
	db $A2, $04
	db $A2, $04
	db !set_volume_l_and_r, $0F, $0A
	db $A2, $04
	db !return_from_sub

.seq_1661:
	db !echo_on
	db !set_instrument, $D5
	db !change_instr_pitch, $F3
	db !fine_tune, $F6
	db !set_adsr, $8E, $E0
	db !set_volume_l_and_r, $32, $1E
.loop_point_166E:
	db !loop_subsequence, $04 : dw .subseq_1691
	db !loop_subsequence, $04 : dw .subseq_167A
	db !jump_to_sequence : dw .loop_point_166E
	db !end_sequence

.subseq_167A:
	db $99, $04
	db $99, $04
	db $99, $04
	db $99, $04
	db $99, $0C
	db $99, $08
	db $99, $04
	db $99, $08
	db $99, $08
	db $99, $04
	db $99, $04
	db !return_from_sub

.subseq_1691:
	db !loop_subsequence, $01 : dw .subseq_169E
	db !change_instr_pitch_rel, $01
	db !loop_subsequence, $01 : dw .subseq_169E
	db !change_instr_pitch_rel, $FF
	db !return_from_sub

.subseq_169E:
	db $94, $10
	db $94, $08
	db $94, $08
	db $94, $04
	db $94, $04
	db $94, $08
	db $94, $10
	db !return_from_sub

.unreached_16AD:
	db !set_volume_l_and_r, $32, $1E
	db $97, $08
	db $95, $08
	db $97, $0C
	db !set_volume_l_and_r, $0A, $1E
	db $97, $0C
	db $95, $08
	db $97, $10
	db !set_volume_l_and_r, $32, $1E
	db $97, $08
	db $95, $08
	db $97, $0C
	db $97, $0C
	db $95, $08
	db $92, $10
	db !return_from_sub

.unreached_16CF:
	db !set_volume_l_and_r, $32, $1E
	db $90, $08
	db $92, $18
	db !set_volume_l_and_r, $0A, $1E
	db $90, $08
	db $92, $18
	db !set_volume_l_and_r, $32, $1E
	db $90, $0C
	db $92, $0C
	db $95, $08
	db $92, $20
	db !return_from_sub

.seq_16E9:
	db !set_instrument, $D5
	db !change_instr_pitch, $F3
	db !fine_tune, $F6
	db !set_adsr, $FE, $40
	db $80, $09
	db !set_volume_l_and_r, $32, $1E
	db !echo_on
.loop_point_16F8:
	db !set_volume_l_and_r, $0C, $08
	db !play_subsequence : dw .subseq_1501
	db !set_volume_l_and_r, $06, $11
	db !play_subsequence : dw .subseq_14E8
	db !set_volume_l_and_r, $0C, $08
	db !play_subsequence : dw .subseq_1501
	db !set_volume_l_and_r, $06, $11
	db !play_subsequence : dw .subseq_14CD
	db !set_volume_l_and_r, $0C, $08
	db !play_subsequence : dw .subseq_1501
	db !set_volume_l_and_r, $06, $11
	db !play_subsequence : dw .subseq_14E8
	db !set_volume_l_and_r, $0C, $08
	db !play_subsequence : dw .subseq_1501
	db !set_volume_l_and_r, $06, $11
	db !play_subsequence : dw .subseq_14B2
	db !set_volume_l_and_r, $11, $0A
	db !loop_subsequence, $04 : dw .subseq_1492
	db !jump_to_sequence : dw .loop_point_16F8
	db !end_sequence

.seq_1733:
.loop_point_1733:
	db !play_subsequence : dw .subseq_1D37
	db !echo_on
	db !set_volume_l_and_r, $17, $0B
	db !loop_subsequence, $04 : dw .subseq_178C
	db !set_volume_l_and_r, $28, $0F
	db !loop_subsequence, $01 : dw .subseq_1749
	db !jump_to_sequence : dw .loop_point_1733
	db !end_sequence

.subseq_1749:
	db !set_instrument, $1C
	db !change_instr_pitch, $0E
	db !fine_tune, $30
	db !set_adsr, $8D, $EB
	db !vibrato_with_delay, $02, $04, $0B, $05
	db $99, $0C
	db $9E, $02
	db $9F, $02
	db $A0, $20
	db $80, $10
	db $99, $0C
	db $9F, $02
	db $A0, $02
	db $A1, $10
	db $99, $0C
	db $A0, $02
	db $A1, $02
	db $A2, $10
	db $99, $0C
	db $A1, $02
	db $A2, $02
	db $A3, $20
	db $80, $10
	db $99, $0C
	db $A2, $02
	db $A3, $02
	db $A4, $10
	db $99, $0C
	db $A3, $02
	db $A4, $02
	db $A5, $10
	db !return_from_sub

.subseq_178C:
	db $A3, $08
	db $A0, $08
	db $A8, $08
	db $A7, $08
	db $AC, $08
	db $A7, $08
	db $A8, $08
	db $A5, $08
	db $A1, $08
	db $A5, $08
	db $A8, $08
	db $A7, $08
	db $AE, $08
	db $A7, $08
	db $A8, $08
	db $AA, $08
	db !return_from_sub

.seq_17AD:
	db $80, $0E
.loop_point_17AF:
	db !play_subsequence : dw .subseq_1D37
	db !echo_on
	db !set_volume_l_and_r, $03, $08
	db !loop_subsequence, $04 : dw .subseq_178C
	db !set_volume_l_and_r, $08, $11
	db !loop_subsequence, $01 : dw .subseq_1749
	db !jump_to_sequence : dw .loop_point_17AF
	db !end_sequence

.seq_17C5:
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

.seq_1812:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $7A
	db !set_adsr, $CE, $AF
	db $8C, $19
	db $8D, $17
	db $8F, $10
	db $88, $20
	db $88, $10
	db !end_sequence

.seq_1828:
	db !play_subsequence : dw .subseq_1D37
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $3C, $1E
.loop_point_1830:
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

.seq_1848:
	db !play_subsequence : dw .subseq_1D41
	db !set_volume_l_and_r, $28, $1E
	db !set_adsr, $AF, $AE
	db $A0, $19
	db $A0, $17
	db $A4, $10
	db $A0, $19
	db $80, $07
	db $A0, $10
	db !end_sequence

.seq_185E:
	db !play_subsequence : dw .subseq_1D41
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $AF, $AE
	db $9B, $19
	db $9D, $17
	db $9F, $10
	db $9B, $19
	db $80, $07
	db $9B, $10
	db !end_sequence

.seq_1874:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $23
	db !set_adsr, $AF, $AE
	db $98, $19
	db $99, $17
	db $9B, $10
	db $98, $19
	db $80, $07
	db $98, $10
	db !end_sequence

.seq_1889:
	db !play_subsequence : dw .subseq_1D37
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $0B, $17
	db $80, $0E
	db !jump_to_sequence : dw .loop_point_1830

.seq_1896:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $0A, $14
	db !set_adsr, $FF, $58
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
	db $9E, $09
	db $9D, $07
	db $9E, $10
	db !end_sequence

.seq_18C1:
	db !set_echo, $2C, $17, $17
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2B, $00
	db $9D, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $03 : dw .subseq_18F8
.loop_point_18E7:
	db !echo_on
	db !set_instrument, $A5
	db !set_vol_single_val, $6C
	db $9E, $10
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $97, $10
	db !jump_to_sequence : dw .loop_point_18E7

.subseq_18F8:
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

.seq_1909:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $20, $00
	db $98, $25
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $AF, $B2
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db $9A, $18
	db !set_adsr, $8F, $F8
.loop_point_192C:
	db $99, $08
	db $97, $08
	db !jump_to_sequence : dw .loop_point_192C

.seq_1933:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $94, $25
	db !pitch_slide_off
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $7B
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
.loop_point_1959:
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
	db !jump_to_sequence : dw .loop_point_1959

.seq_197C:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $91, $25
	db !pitch_slide_off
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_volume_l_and_r, $32, $46
	db !play_subsequence : dw .subseq_1997
	db !end_sequence

.subseq_1997:
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

.seq_19F9:
	db !play_subsequence : dw .subseq_1D41
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
	db !play_subsequence : dw .subseq_1997
	db !end_sequence

.seq_1A18:
	db !play_subsequence : dw .subseq_1D41
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
	db !play_subsequence : dw .subseq_1997
	db !end_sequence

.seq_1A37:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1F, $00
	db $80, $05
	db $94, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1A48:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $28
	db !pitch_slide_down, $00, $04, $05, $22, $00
	db $80, $05
	db $91, $30
	db !pitch_slide_off
	db !end_sequence

.seq_1A59:
	db !set_echo, $2C, $17, $17
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $9E, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1A80
	db !end_sequence

.subseq_1A80:
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

.seq_1ABB:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $9A, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_instrument, $2E
	db !set_volume_l_and_r, $14, $1E
	db !set_default_duration, $10
	db !loop_subsequence, $0C : dw .subseq_1ADA
	db !default_duration_off
	db !end_sequence

.subseq_1ADA:
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

.seq_1AE9:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $1E
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $97, $20
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_default_duration, $10
	db !loop_subsequence, $06 : dw .subseq_1B00
	db !end_sequence

.subseq_1B00:
	db !play_subsequence : dw .subseq_1B0D
	db !play_subsequence : dw .subseq_1B4A
	db !play_subsequence : dw .subseq_1B0D
	db !play_subsequence : dw .subseq_1B5B
	db !return_from_sub

.subseq_1B0D:
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

.subseq_1B4A:
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8A
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !return_from_sub

.subseq_1B5B:
	db !set_instrument, $06
	db !set_vol_single_val, $15
	db !set_adsr, $8E, $E0
	db $82
	db !set_instrument, $08
	db !set_vol_single_val, $12
	db !set_adsr, $8E, $EF
	db $8E
	db !return_from_sub

.seq_1B6C:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $64
	db !pitch_slide_down, $00, $03, $05, $2B, $00
	db $93, $20
	db !pitch_slide_off
	db $80, $05
	db !change_instr_pitch, $00
	db !fine_tune, $1E
	db !set_adsr, $8F, $D2
	db !loop_subsequence, $0C : dw .subseq_1B88
	db !end_sequence

.subseq_1B88:
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

.seq_1BC3:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $2D, $00
	db $80, $05
	db $9E, $1B
	db !pitch_slide_off
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $7B
	db !set_adsr, $CE, $AF
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1BF7
	db !set_variable_note_1, $84
	db !set_variable_note_2, $90
	db !loop_subsequence, $02 : dw .subseq_1BF7
	db !set_variable_note_1, $8B
	db !set_variable_note_2, $97
	db !loop_subsequence, $02 : dw .subseq_1BF7
	db !end_sequence

.subseq_1BF7:
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

.seq_1C1C:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $1D, $00
	db $80, $05
	db $9A, $1B
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1C96
	db !play_subsequence : dw .subseq_1C74
	db !play_subsequence : dw .subseq_1D37
	db !set_volume_l_and_r, $14, $1E
	db !loop_subsequence, $02 : dw .subseq_1C46
	db !end_sequence

.subseq_1C46:
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

.subseq_1C74:
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
.subseq_1C96:
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

.seq_1CDF:
	db !play_subsequence : dw .subseq_1D41
	db !set_vol_single_val, $0A
	db !pitch_slide_up, $00, $04, $08, $11, $00
	db $80, $05
	db $97, $1B
	db !pitch_slide_off
	db !echo_on
	db $80, $07
	db !set_volume_l_and_r, $17, $08
	db !set_adsr, $8F, $E0
	db $80, $78
	db !play_subsequence : dw .subseq_1C96
	db !play_subsequence : dw .subseq_1C74
	db !play_subsequence : dw .subseq_1D37
	db !set_volume_l_and_r, $0B, $06
	db !loop_subsequence, $02 : dw .subseq_1C46
	db !end_sequence

.seq_1D0B:
	db !play_subsequence : dw .subseq_1D41
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
	db !play_subsequence : dw .subseq_1C96
	db !play_subsequence : dw .subseq_1C74
	db !play_subsequence : dw .subseq_1D37
	db !set_volume_l_and_r, $03, $07
	db !loop_subsequence, $02 : dw .subseq_1C46
	db !end_sequence

.subseq_1D37:
	db !set_instrument, $8E
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_adsr, $DF, $72
	db !return_from_sub

.subseq_1D41:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $FE
	db !set_adsr, $8C, $E8
	db !return_from_sub

.subseq_1D4B:
	db $80, $10
	db !return_from_sub

.seq_1D4E:
	db !set_echo, $3A, $23, $23
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
	db !set_volume_l_and_r, $0B, $17
	db !play_subsequence : dw .subseq_1D72
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8C
	db !loop_subsequence, $04 : dw .subseq_1D95
	db !end_sequence

.subseq_1D72:
	db !echo_on
	db !set_instrument, $8E
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_adsr, $DF, $72
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
	db $9C, $18
	db $9A, $10
	db !return_from_sub

.subseq_1D95:
	db !set_default_duration, $08
	db !set_instrument, $92
	db !change_instr_pitch, $F4
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $FB
	db $E0
	db !set_instrument, $91
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $F8
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $FE
	db $E0
	db !set_instrument, $91
	db !change_instr_pitch, $F4
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $07
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $91
	db !change_instr_pitch, $04
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $FE
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $0C
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $91
	db !change_instr_pitch, $FB
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $F8
	db $E0
	db !default_duration_off
	db !return_from_sub

.seq_1DE9:
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $08
	db !set_volume_l_and_r, $46, $50
	db !set_adsr, $FF, $F3
	db $80, $10
	db $8E, $20
	db $8E, $10
	db $8E, $40
	db $8E, $80
	db $8A, $10
	db $8A, $70
	db $8A, $10
	db $8A, $70
	db $8A, $10
	db $8A, $70
	db !end_sequence

.seq_1E0C:
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $F8
	db !set_volume_l_and_r, $50, $46
	db !set_adsr, $FF, $F3
	db $80, $28
	db $8E, $10
	db $8E, $20
	db $8E, $10
	db $8E, $A0
	db $8A, $80
	db $8A, $80
	db $8A, $80
	db !end_sequence

.seq_1E29:
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $5A
	db !set_adsr, $8E, $E0
	db $80, $10
	db $8B, $18
	db $8B, $08
	db $8B, $08
	db $8B, $08
	db $8B, $10
	db $8D, $08
	db $8F, $10
	db $90, $18
	db $90, $F0
	db !end_sequence

.seq_1E49:
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !vibrato_with_delay, $02, $02, $06, $08
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8B, $E8
	db $80, $10
	db $A1, $18
	db $A1, $40
	db $A0, $18
	db $A0, $F0
	db !end_sequence

.seq_1E65:
	db $80, $0E
	db !set_volume_l_and_r, $08, $03
	db !play_subsequence : dw .subseq_1D72
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $0B, $08
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8C
	db !loop_subsequence, $04 : dw .subseq_1D95
	db !end_sequence

.seq_1E7E:
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !vibrato_with_delay, $03, $02, $06, $08
	db !set_volume_l_and_r, $0A, $14
	db !set_adsr, $8B, $E8
	db $80, $10
	db $9E, $18
	db $9E, $40
	db $9C, $18
	db $9A, $F0
	db !end_sequence

.seq_1E9A:
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !vibrato_with_delay, $02, $03, $06, $08
	db !set_vol_single_val, $0F
	db $80, $10
	db $9B, $18
	db $9B, $40
	db $97, $18
	db $97, $F0
	db !end_sequence

.seq_1EB2:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_1D4B
	db !set_master_volume_indirect, $80
	db !set_echo, $3A, $23, $23
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $50
	db !set_adsr, $88, $E0
.loop_point_1ED1:
	db !long_duration_on
	db $85, $05, $00
	db $85, $04, $00
	db !long_duration_off
	db $8C, $80
	db $85, $80
	db $87, $80
	db $8A, $80
	db $8C, $40
	db $90, $40
	db $85, $80
	db $87, $80
	db $8A, $80
	db $8C, $40
	db $90, $40
	db !jump_to_sequence : dw .loop_point_1ED1
	db !end_sequence

.seq_1EF3:
	db !play_subsequence : dw .subseq_1D4B
.loop_point_1EF6:
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $14, $3C
	db !set_adsr, $CF, $50
	db $80, $78
	db $8E, $04
	db $8E, $04
	db $8E, $38
	db !set_volume_l_and_r, $32, $1E
	db $8A, $04
	db $8A, $04
	db $8A, $18
	db !set_volume_l_and_r, $46, $0A
	db $86, $04
	db $86, $04
	db $86, $20
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !vibrato_with_delay, $02, $02, $06, $08
	db !set_volume_l_and_r, $08, $10
	db !set_adsr, $80, $8B
	db $A4, $FF
	db $80, $01
	db $A2, $FF
	db $80, $01
	db $A0, $FF
	db $80, $01
	db $9F, $FF
	db $80, $01
	db !set_instrument, $28
	db !change_instr_pitch, $F0
	db !fine_tune, $F2
	db !set_vol_single_val, $28
	db !set_adsr, $8F, $EF
	db !set_variable_note_1, $91
	db !set_variable_note_2, $85
	db !loop_subsequence, $20 : dw .subseq_1F9D
	db !loop_subsequence, $20 : dw .subseq_1F9D
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_vol_single_val, $14
	db !set_adsr, $88, $E5
	db $9F, $80
	db !set_instrument, $28
	db !change_instr_pitch, $F0
	db !fine_tune, $F2
	db !set_vol_single_val, $28
	db !set_adsr, $8F, $EF
	db !loop_subsequence, $02 : dw .subseq_1F74
	db !jump_to_sequence : dw .loop_point_1EF6
	db !end_sequence

.subseq_1F74:
	db !loop_subsequence, $08 : dw .subseq_1F9D
	db !loop_subsequence, $08 : dw .subseq_1F98
	db !loop_subsequence, $08 : dw .subseq_1F93
	db !loop_subsequence, $04 : dw .subseq_1F8E
	db !loop_subsequence, $04 : dw .subseq_1F89
	db !return_from_sub

.subseq_1F89:
	db $9C, $08
	db $90, $08
	db !return_from_sub

.subseq_1F8E:
	db $98, $08
	db $8C, $08
	db !return_from_sub

.subseq_1F93:
	db $96, $08
	db $8A, $08
	db !return_from_sub

.subseq_1F98:
	db $9F, $08
	db $93, $08
	db !return_from_sub

.subseq_1F9D:
	db $9D, $08
	db $91, $08
	db !return_from_sub

.seq_1FA2:
	db !play_subsequence : dw .subseq_1D4B
.loop_point_1FA5:
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $14, $07
	db !set_adsr, $CF, $50
	db $80, $07
	db $80, $78
	db $8E, $04
	db $8E, $04
	db $8E, $38
	db !set_volume_l_and_r, $0A, $11
	db $8A, $04
	db $8A, $04
	db $8A, $18
	db !set_volume_l_and_r, $03, $18
	db $86, $04
	db $86, $04
	db $86, $19
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !vibrato_with_delay, $02, $03, $06, $08
	db !set_volume_l_and_r, $08, $10
	db !set_adsr, $80, $8B
	db !long_duration_on
	db $A0, $01, $00
	db $9F, $01, $00
	db $9D, $01, $00
	db $9B, $01, $00
	db !long_duration_off
	db !echo_on
	db !set_instrument, $8F
	db !change_instr_pitch, $08
	db !fine_tune, $FC
	db !set_volume_l_and_r, $09, $12
	db !set_adsr, $80, $8B
	db !long_duration_on
	db $80, $01, $00
	db !vibrato_with_delay, $05, $02, $0A, $16
	db !pitch_slide_down, $DC, $0B, $0A, $0B, $00
	db $90, $01, $00
	db !vibrato_with_delay, $05, $02, $08, $16
	db !pitch_slide_up, $DC, $06, $0B, $10, $00
	db $8B, $01, $00
	db !long_duration_off
	db !pitch_slide_off
	db !vibrato_off
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $64, $3C
	db !set_adsr, $CF, $32
	db $80, $70
	db $90, $08
	db $90, $08
	db !set_adsr, $CF, $2C
	db $90, $70
	db !set_adsr, $CF, $32
	db $90, $08
	db $90, $08
	db $8E, $80
	db !echo_on
	db !set_instrument, $8E
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_volume_l_and_r, $09, $15
	db !set_adsr, $DF, $72
	db !play_subsequence : dw .subseq_2090
	db !play_subsequence : dw .subseq_2053
	db !jump_to_sequence : dw .loop_point_1FA5
	db !end_sequence

.subseq_2053:
	db $A4, $10
	db $A0, $08
	db $9D, $30
	db $A4, $10
	db $A4, $08
	db $A4, $0C
	db $A2, $0C
	db $A0, $08
	db $A2, $10
	db $9F, $08
	db $9B, $30
	db $A2, $10
	db $A2, $08
	db $A2, $0C
	db $A0, $0C
	db $9F, $08
	db $A0, $10
	db $A9, $38
	db $A0, $10
	db $A0, $08
	db $A0, $0C
	db $A2, $0C
	db $A0, $08
	db $9F, $10
	db $A8, $38
	db $9F, $10
	db $9F, $08
	db $9F, $0C
	db $A0, $0C
	db $9F, $08
	db !return_from_sub

.subseq_2090:
	db $80, $08
	db $98, $08
	db $9D, $08
	db $9F, $08
	db $A0, $28
	db $98, $08
	db $9D, $08
	db $9F, $08
	db $A0, $18
	db $9F, $04
	db $9D, $04
	db $9F, $30
	db $9B, $10
	db $96, $40
	db $80, $08
	db $99, $08
	db $9D, $08
	db $9F, $08
	db $A0, $28
	db $99, $08
	db $9D, $08
	db $9F, $08
	db $A0, $18
	db $9F, $04
	db $9D, $04
	db $9F, $30
	db $A0, $10
	db $A2, $40
	db !return_from_sub

.seq_20C9:
	db !play_subsequence : dw .subseq_1D4B
.loop_point_20CC:
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $04, $0A
	db !set_adsr, $CF, $50
	db $80, $0B
	db $80, $78
	db $8E, $04
	db $8E, $04
	db $8E, $38
	db !set_volume_l_and_r, $09, $05
	db $8A, $04
	db $8A, $04
	db $8A, $18
	db !set_volume_l_and_r, $0C, $02
	db $86, $04
	db $86, $04
	db $86, $15
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !vibrato_with_delay, $03, $02, $0B, $08
	db !set_volume_l_and_r, $08, $10
	db !set_adsr, $80, $8B
	db !long_duration_on
	db $9D, $01, $00
	db $9B, $01, $00
	db $99, $01, $00
	db $96, $01, $00
	db !long_duration_off
	db $80, $14
	db !echo_on
	db !set_instrument, $8F
	db !change_instr_pitch, $08
	db !fine_tune, $FC
	db !set_volume_l_and_r, $07, $02
	db !set_adsr, $80, $8B
	db !long_duration_on
	db $80, $01, $00
	db !vibrato_with_delay, $05, $02, $0A, $16
	db !pitch_slide_down, $DC, $0B, $0A, $0B, $00
	db $90, $01, $00
	db !vibrato_with_delay, $05, $02, $08, $16
	db !pitch_slide_up, $DC, $06, $0B, $10, $00
	db $8B, $01, $00
	db !long_duration_off
	db !pitch_slide_off
	db !vibrato_off
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $64, $3C
	db !set_adsr, $CF, $32
	db $80, $60
	db $90, $08
	db $90, $78
	db $90, $08
	db $90, $84
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0F, $06
	db !set_adsr, $8B, $A7
	db !play_subsequence : dw .subseq_2090
	db !play_subsequence : dw .subseq_2053
	db !jump_to_sequence : dw .loop_point_20CC
	db !end_sequence

.seq_2172:
	db !play_subsequence : dw .subseq_1D4B
.loop_point_2175:
	db !set_instrument, $90
	db !change_instr_pitch, $FB
	db !fine_tune, $00
	db !set_vol_single_val, $60
	db !set_adsr, $CF, $52
	db !long_duration_on
	db $80, $05, $00
	db !long_duration_off
	db !loop_subsequence, $06 : dw .subseq_21C3
	db !loop_subsequence, $02 : dw .subseq_21A1
	db !set_vol_single_val, $60
	db !set_adsr, $CF, $4B
	db $8A, $80
	db !set_vol_single_val, $50
	db !set_adsr, $CF, $52
	db !loop_subsequence, $08 : dw .subseq_21C3
	db !jump_to_sequence : dw .loop_point_2175
	db !end_sequence

.subseq_21A1:
	db !set_vol_single_val, $60
	db !set_adsr, $CF, $4E
	db $8D, $20
	db !set_vol_single_val, $42
	db !set_adsr, $CF, $50
	db $94, $20
	db !set_vol_single_val, $60
	db !set_adsr, $CF, $52
	db $8D, $08
	db !set_adsr, $CF, $4C
	db $8D, $18
	db !set_vol_single_val, $42
	db !set_adsr, $CF, $50
	db $94, $20
	db !return_from_sub

.subseq_21C3:
	db !set_adsr, $CF, $4E
	db $8D, $40
	db !set_adsr, $CF, $52
	db $8D, $08
	db !set_adsr, $CF, $4C
	db $8D, $38
	db !return_from_sub

.seq_21D3:
	db !play_subsequence : dw .subseq_1D4B
.loop_point_21D6:
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_vol_single_val, $0A
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8D
	db !loop_subsequence, $08 : dw .subseq_221F
	db !set_vol_single_val, $0F
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_vol_single_val, $14
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_vol_single_val, $19
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_vol_single_val, $1E
	db !loop_subsequence, $10 : dw .subseq_221F
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !set_vol_single_val, $0A
	db !set_adsr, $85, $E7
	db $80, $10
	db $9C, $70
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_vol_single_val, $1E
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8D
	db !loop_subsequence, $10 : dw .subseq_221F
	db !jump_to_sequence : dw .loop_point_21D6
	db !end_sequence

.subseq_221F:
	db !set_default_duration, $04
	db !set_instrument, $92
	db !change_instr_pitch, $F4
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $FB
	db $E0
	db !set_instrument, $91
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $F9
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $FE
	db $E0
	db !set_instrument, $91
	db !change_instr_pitch, $F4
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $07
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $91
	db !change_instr_pitch, $05
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $FE
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $0C
	db $E0
	db !set_instrument, $92
	db !change_instr_pitch, $00
	db $E0
	db !set_instrument, $91
	db !change_instr_pitch, $FB
	db $E0
	db !set_instrument, $93
	db !change_instr_pitch, $F9
	db $E0
	db !default_duration_off
	db !return_from_sub

.seq_2273:
	db !play_subsequence : dw .subseq_1D4B
	db $80, $07
.loop_point_2278:
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8D
	db !set_volume_l_and_r, $02, $06
	db !loop_subsequence, $08 : dw .subseq_221F
	db !set_volume_l_and_r, $04, $08
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_volume_l_and_r, $04, $0C
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_volume_l_and_r, $06, $10
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_volume_l_and_r, $15, $0E
	db !loop_subsequence, $10 : dw .subseq_221F
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !set_volume_l_and_r, $05, $0F
	db !set_adsr, $85, $E7
	db $80, $19
	db $A2, $67
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $15, $0E
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8D
	db !loop_subsequence, $10 : dw .subseq_221F
	db !jump_to_sequence : dw .loop_point_2278
	db !end_sequence

.seq_22C6:
	db !play_subsequence : dw .subseq_1D4B
	db $80, $0E
.loop_point_22CB:
	db !fine_tune, $00
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8D
	db !set_volume_l_and_r, $03, $01
	db !loop_subsequence, $08 : dw .subseq_221F
	db !set_volume_l_and_r, $04, $02
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_volume_l_and_r, $06, $03
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_volume_l_and_r, $08, $04
	db !loop_subsequence, $04 : dw .subseq_221F
	db !set_volume_l_and_r, $06, $0C
	db !loop_subsequence, $10 : dw .subseq_221F
	db !set_instrument, $15
	db !change_instr_pitch, $F0
	db !fine_tune, $03
	db !set_volume_l_and_r, $0F, $05
	db !set_adsr, $85, $E7
	db $80, $22
	db $A5, $5E
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $F8
	db !set_volume_l_and_r, $03, $07
	db !set_adsr, $8B, $A7
	db !play_subsequence : dw .subseq_2090
	db !play_subsequence : dw .subseq_2053
	db !jump_to_sequence : dw .loop_point_22CB
	db !end_sequence

base off
arch 65816
.end: