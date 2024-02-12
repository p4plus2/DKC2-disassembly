;0C School House Harmony
;2E9BE0
wrinkly_song_data:
	dw !bgm_loc, $0236
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1314, .seq_138C, .seq_15F0, .seq_1546, .seq_1681, .seq_14E9, .seq_15B3, .seq_16EE
	db $A0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.seq_1314:
	db !play_subsequence : dw .subseq_1759
	db !play_subsequence : dw .subseq_175E
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A8
	db !set_vol_single_val, $54
	db !set_adsr, $AE, $B4
.loop_point_1325:
	db !set_variable_note_1, $91
	db !loop_subsequence, $04 : dw .subseq_1377
	db !set_variable_note_1, $92
	db !loop_subsequence, $01 : dw .subseq_1377
	db !loop_subsequence, $01 : dw .subseq_1362
	db !loop_subsequence, $01 : dw .subseq_1377
	db !loop_subsequence, $01 : dw .subseq_1362
	db !set_variable_note_1, $91
	db !loop_subsequence, $02 : dw .subseq_1377
	db !set_variable_note_1, $92
	db !loop_subsequence, $01 : dw .subseq_1377
	db !loop_subsequence, $01 : dw .subseq_1362
	db !loop_subsequence, $01 : dw .subseq_1377
	db !loop_subsequence, $01 : dw .subseq_1362
	db !change_instr_pitch_rel, $FB
	db !set_variable_note_1, $91
	db !loop_subsequence, $04 : dw .subseq_1377
	db !change_instr_pitch_rel, $05
	db !jump_to_sequence : dw .loop_point_1325

.subseq_1362:
	db $90, $18
	db $90, $08
	db $94, $18
	db $90, $10
	db $8B, $10
	db $8A, $08
	db $8B, $08
	db $8A, $08
	db $8B, $08
	db $8F, $08
	db !return_from_sub

.subseq_1377:
	db $92, $18
	db $92, $08
	db $92, $18
	db $92, $10
	db $92, $10
	db $92, $08
	db $90, $08
	db $8D, $08
	db $90, $08
	db $E0, $08
	db !return_from_sub

.seq_138C:
	db !play_subsequence : dw .subseq_1759
	db !echo_on
	db !set_volume_l_and_r, $28, $14
	db !play_subsequence : dw .subseq_14AD
.loop_point_1396:
	db !loop_subsequence, $02 : dw .subseq_1498
	db !set_volume_l_and_r, $6E, $3C
	db !loop_subsequence, $01 : dw .subseq_1460
	db !set_volume_l_and_r, $5A, $3C
	db !loop_subsequence, $01 : dw .subseq_144C
	db !loop_subsequence, $02 : dw .subseq_1498
	db !set_volume_l_and_r, $6E, $3C
	db !loop_subsequence, $01 : dw .subseq_1414
	db !set_volume_l_and_r, $5A, $3C
	db !loop_subsequence, $01 : dw .subseq_144C
	db !set_volume_l_and_r, $6E, $3C
	db !loop_subsequence, $01 : dw .subseq_13C8
	db $9E, $40
	db $80, $C0
	db !jump_to_sequence : dw .loop_point_1396

.subseq_13C8:
	db !set_instrument, $C0
	db !change_instr_pitch, $FC
	db !fine_tune, $18
	db !set_adsr, $AC, $AE
	db $80, $10
	db $99, $10
	db $9D, $10
	db $99, $10
	db $9E, $10
	db $9D, $08
	db $9E, $10
	db $9E, $10
	db $9E, $18
	db $9B, $10
	db $9E, $10
	db $9B, $10
	db $9E, $10
	db $9D, $08
	db $9E, $18
	db $A0, $10
	db $9D, $08
	db $9B, $08
	db $99, $10
	db $9D, $10
	db $99, $10
	db $9E, $10
	db $9D, $08
	db $9E, $10
	db $9E, $10
	db $9E, $18
	db $9B, $10
	db $9E, $10
	db $9B, $10
	db $9E, $10
	db $9D, $08
	db $9E, $18
	db $A0, $10
	db !return_from_sub

.subseq_1414:
	db !set_instrument, $D6
	db !set_adsr, $AF, $D1
	db !change_instr_pitch, $E5
	db !fine_tune, $F2
	db $80, $10
	db $A2, $08
	db $A2, $08
	db $A5, $08
	db $A5, $10
	db $A3, $10
	db $A2, $38
	db $80, $10
	db $A0, $08
	db $A0, $08
	db $A3, $08
	db $A3, $10
	db $A2, $10
	db $9E, $10
	db $9E, $08
	db $A0, $08
	db $9E, $08
	db $A0, $08
	db $A3, $08
	db $A2, $10
	db $A3, $08
	db $A5, $18
	db $80, $40
	db !return_from_sub

.subseq_144C:
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !set_adsr, $8A, $EF
	db $80, $20
	db $9C, $10
	db $A0, $20
	db $9E, $10
	db $9B, $30
	db !return_from_sub

.subseq_1460:
	db !set_instrument, $D6
	db !set_adsr, $AF, $D1
	db !change_instr_pitch, $E5
	db !fine_tune, $F2
	db $80, $10
	db $9E, $08
	db $9E, $08
	db $A2, $08
	db $A2, $10
	db $A0, $10
	db $9E, $38
	db $80, $10
	db $9C, $08
	db $9C, $08
	db $A0, $08
	db $A0, $10
	db $9E, $10
	db $9B, $10
	db $9B, $08
	db $9E, $08
	db $9B, $08
	db $9E, $08
	db $A0, $08
	db $9E, $10
	db $A0, $08
	db $A2, $18
	db $80, $40
	db !return_from_sub

.subseq_1498:
	db !set_instrument, $D4
	db !change_instr_pitch, $FD
	db !fine_tune, $DC
	db !set_adsr, $CF, $AB
	db !set_volume_l_and_r, $1E, $14
	db $99, $20
	db $A2, $20
	db $A3, $20
	db $9E, $20
	db !return_from_sub

.subseq_14AD:
	db !set_instrument, $D1
	db !set_adsr, $CF, $91
	db !change_instr_pitch, $00
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $20
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $20
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $06
	db $9E, $36
	db !return_from_sub

.seq_14E9:
	db !play_subsequence : dw .subseq_1759
	db !echo_on
	db $80, $03
	db !set_volume_l_and_r, $14, $28
	db !play_subsequence : dw .subseq_14AD
	db $80, $0D
.loop_point_14F7:
	db !play_subsequence : dw .subseq_1529
	db !set_volume_l_and_r, $14, $32
	db !loop_subsequence, $01 : dw .subseq_1460
	db !set_volume_l_and_r, $28, $3C
	db !loop_subsequence, $01 : dw .subseq_144C
	db $80, $06
	db !play_subsequence : dw .subseq_1529
	db !set_volume_l_and_r, $14, $32
	db !loop_subsequence, $01 : dw .subseq_1414
	db !set_volume_l_and_r, $28, $3C
	db !loop_subsequence, $01 : dw .subseq_144C
	db !set_volume_l_and_r, $14, $32
	db !loop_subsequence, $01 : dw .subseq_13C8
	db $9E, $40
	db $80, $C6
	db !jump_to_sequence : dw .loop_point_14F7

.subseq_1529:
	db !set_instrument, $D4
	db !change_instr_pitch, $FD
	db !fine_tune, $DC
	db !set_adsr, $CF, $AB
	db !set_volume_l_and_r, $1E, $14
	db $9E, $20
	db $9E, $20
	db $A2, $20
	db $A0, $20
	db $9E, $20
	db $9E, $20
	db $A2, $20
	db $A0, $1A
	db !return_from_sub

.seq_1546:
	db !play_subsequence : dw .subseq_1759
	db !set_instrument, $D4
	db !change_instr_pitch, $FD
	db !fine_tune, $DC
	db !set_adsr, $CE, $AE
	db !set_volume_l_and_r, $0B, $17
	db $80, $80
	db $80, $80
	db $80, $02
.loop_point_155B:
	db !loop_subsequence, $02 : dw .subseq_15A2
	db !loop_subsequence, $02 : dw .subseq_1581
	db !loop_subsequence, $02 : dw .subseq_15A2
	db !loop_subsequence, $02 : dw .subseq_1581
	db !loop_subsequence, $02 : dw .subseq_1576
	db $9E, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_155B

.subseq_1576:
	db $9D, $38
	db $9E, $48
	db $9E, $38
	db $9E, $28
	db $9E, $20
	db !return_from_sub

.subseq_1581:
	db $9E, $18
	db $9E, $08
	db $9E, $18
	db $9E, $10
	db $9E, $10
	db $9E, $08
	db $9C, $10
	db $9C, $10
	db $A0, $18
	db $A0, $08
	db $A0, $18
	db $9E, $10
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $10
	db !return_from_sub

.subseq_15A2:
	db $9E, $18
	db $9E, $08
	db $9E, $18
	db $9E, $10
	db $9E, $10
	db $9E, $08
	db $9C, $10
	db $9C, $10
	db !return_from_sub

.seq_15B3:
	db !play_subsequence : dw .subseq_1759
.loop_point_15B6:
	db !set_instrument, $C5
	db !set_volume_l_and_r, $1E, $3C
	db !set_adsr, $AF, $B1
	db $80, $10
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $10
	db !set_volume_l_and_r, $08, $11
	db !set_adsr, $CE, $96
	db !set_instrument, $88
	db !loop_subsequence, $30 : dw .subseq_15E7
	db !loop_subsequence, $30 : dw .subseq_15E7
	db !loop_subsequence, $20 : dw .subseq_15E7
	db !jump_to_sequence : dw .loop_point_15B6

.subseq_15E7:
	db !fine_tune, $0A
	db $9E, $08
	db !fine_tune, $EC
	db $9E, $08
	db !return_from_sub

.seq_15F0:
	db !play_subsequence : dw .subseq_1759
	db !set_instrument, $89
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db $80, $E0
	db !echo_on
.loop_point_15FD:
	db $94, $08
	db $94, $04
	db $94, $04
	db $94, $08
	db $94, $08
	db !echo_off
	db !loop_subsequence, $08 : dw .subseq_1621
	db !loop_subsequence, $04 : dw .subseq_1621
	db !loop_subsequence, $04 : dw .subseq_1621
	db !set_instrument, $89
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db !echo_on
	db $94, $E0
	db !jump_to_sequence : dw .loop_point_15FD

.subseq_1621:
	db !set_instrument, $97
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $5A
	db $9A, $10
	db !set_instrument, $89
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db !echo_on
	db $94, $08
	db !echo_off
	db !set_instrument, $97
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $5A
	db $9A, $08
	db $9A, $10
	db !set_instrument, $89
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db !echo_on
	db $94, $08
	db !echo_off
	db !set_instrument, $97
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $5A
	db $9A, $10
	db $9A, $08
	db !set_instrument, $89
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db !echo_on
	db $94, $08
	db !echo_off
	db !set_instrument, $97
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $5A
	db $9A, $08
	db $9A, $10
	db !set_instrument, $89
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db !echo_on
	db $94, $08
	db !echo_off
	db !set_instrument, $97
	db !set_adsr, $AF, $99
	db !set_vol_single_val, $5A
	db $9A, $08
	db !return_from_sub

.seq_1681:
	db !play_subsequence : dw .subseq_1759
	db !set_instrument, $D4
	db !change_instr_pitch, $FD
	db !fine_tune, $E5
	db !set_adsr, $CE, $AE
	db !set_volume_l_and_r, $19, $08
	db $80, $80
	db $80, $80
	db $80, $01
.loop_point_1696:
	db !loop_subsequence, $02 : dw .subseq_16DD
	db !loop_subsequence, $02 : dw .subseq_16BC
	db !loop_subsequence, $02 : dw .subseq_16DD
	db !loop_subsequence, $02 : dw .subseq_16BC
	db !loop_subsequence, $02 : dw .subseq_16B1
	db $99, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1696

.subseq_16B1:
	db $99, $38
	db $99, $48
	db $9B, $38
	db $99, $28
	db $9B, $20
	db !return_from_sub

.subseq_16BC:
	db $99, $18
	db $99, $08
	db $99, $18
	db $99, $10
	db $99, $10
	db $99, $08
	db $97, $10
	db $97, $10
	db $9C, $18
	db $9C, $08
	db $9C, $18
	db $9B, $10
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $10
	db !return_from_sub

.subseq_16DD:
	db $99, $18
	db $99, $08
	db $99, $18
	db $99, $10
	db $99, $10
	db $99, $08
	db $97, $10
	db $97, $10
	db !return_from_sub

.seq_16EE:
	db !play_subsequence : dw .subseq_1759
	db !set_instrument, $D4
	db !change_instr_pitch, $FD
	db !fine_tune, $DC
	db !set_adsr, $CE, $AE
	db !set_volume_l_and_r, $08, $19
	db $80, $80
	db $80, $80
.loop_point_1701:
	db !loop_subsequence, $02 : dw .subseq_1748
	db !loop_subsequence, $02 : dw .subseq_1727
	db !loop_subsequence, $02 : dw .subseq_1748
	db !loop_subsequence, $02 : dw .subseq_1727
	db !loop_subsequence, $02 : dw .subseq_171C
	db $96, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1701

.subseq_171C:
	db $94, $38
	db $96, $48
	db $97, $38
	db $96, $28
	db $97, $20
	db !return_from_sub

.subseq_1727:
	db $96, $18
	db $96, $08
	db $96, $18
	db $96, $10
	db $96, $10
	db $96, $08
	db $94, $10
	db $94, $10
	db $97, $18
	db $97, $08
	db $97, $18
	db $97, $10
	db $97, $10
	db $97, $08
	db $97, $10
	db $97, $10
	db !return_from_sub

.subseq_1748:
	db $96, $18
	db $96, $08
	db $96, $18
	db $96, $10
	db $96, $10
	db $96, $08
	db $94, $10
	db $94, $10
	db !return_from_sub

.subseq_1759:
	db !change_instr_pitch, $00
	db $80, $10
	db !return_from_sub

.subseq_175E:
	db !set_echo, $37, $28, $28
	db !set_fir, $70, $BF, $DB, $E0, $E0, $0A, $C8, $C8
	db !return_from_sub

base off
arch 65816
.end: