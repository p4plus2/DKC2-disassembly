;0A Klubba's Reveille
;2E8572
klubba_song_data:
	dw !bgm_loc, $0325
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1317, .seq_1453, .seq_14FE, .seq_17A6, .seq_16DE, .seq_167A, .seq_13D5, .seq_1745
	db $A5, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.subseq_1314:
	db $80, $10
	db !return_from_sub

.seq_1317:
	db !echo_delay, $08
	db !loop_subsequence, $01 : dw .subseq_1314
	db !set_master_volume_indirect, $50
	db !set_echo, $21, $1C, $1C
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !echo_on
.loop_point_132D:
	db !vibrato_off
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $4A, $3C
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $01 : dw .subseq_1369
	db !loop_subsequence, $01 : dw .subseq_137C
	db $80, $C0
	db $80, $60
	db $8A, $10
	db $80, $08
	db $8B, $10
	db $80, $08
	db $8A, $10
	db $80, $08
	db $88, $10
	db $80, $08
	db $8A, $10
	db $80, $08
	db $88, $10
	db $80, $08
	db $86, $14
	db $80, $04
	db $85, $16
	db $80, $02
	db !jump_to_sequence : dw .loop_point_132D

.subseq_1369:
	db $8F, $20
	db $80, $10
	db $92, $20
	db $80, $10
	db $8F, $20
	db $80, $08
	db $8B, $08
	db $8A, $20
	db $80, $10
	db !return_from_sub

.subseq_137C:
	db $8F, $20
	db $80, $08
	db $91, $08
	db $92, $20
	db $80, $10
	db $94, $18
	db $92, $0E
	db $80, $02
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $96, $0E
	db $80, $02
	db $97, $08
	db $96, $18
	db $92, $18
	db $91, $18
	db $92, $0C
	db $8F, $0C
	db $91, $20
	db $80, $10
	db $8F, $20
	db $80, $08
	db $91, $08
	db $92, $20
	db $80, $10
	db $94, $18
	db $92, $0E
	db $80, $02
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $96, $0E
	db $80, $02
	db $97, $08
	db $96, $18
	db $92, $18
	db $91, $18
	db $92, $0C
	db $94, $0C
	db $96, $20
	db $80, $10
	db !return_from_sub

.seq_13D5:
	db !loop_subsequence, $01 : dw .subseq_1314
	db !echo_on
.loop_point_13DA:
	db $80, $19
	db !vibrato_off
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $0E, $1B
	db !set_adsr, $8F, $E0
	db !vibrato_with_delay, $03, $02, $0B, $01
	db !loop_subsequence, $01 : dw .subseq_1369
	db $8F, $20
	db $80, $08
	db $91, $08
	db $92, $20
	db $80, $10
	db $94, $18
	db $92, $0E
	db $80, $02
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $96, $0E
	db $80, $02
	db $97, $08
	db $96, $18
	db $92, $18
	db $91, $18
	db $92, $0C
	db $8F, $0C
	db $91, $17
	db !loop_subsequence, $01 : dw .subseq_17F0
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $0E, $1B
	db !set_adsr, $8F, $E0
	db $80, $C0
	db $80, $60
	db $8A, $10
	db $80, $08
	db $8B, $10
	db $80, $08
	db $8A, $10
	db $80, $08
	db $88, $10
	db $80, $08
	db $8A, $10
	db $80, $08
	db $88, $10
	db $80, $08
	db $86, $14
	db $80, $04
	db $85, $16
	db $80, $02
	db !jump_to_sequence : dw .loop_point_13DA

.seq_1453:
	db !loop_subsequence, $01 : dw .subseq_1314
	db !echo_off
.loop_point_1458:
	db !set_instrument, $21
	db !change_instr_pitch, $00
	db !fine_tune, $AE
	db !vibrato_with_delay, $02, $02, $0B, $03
	db !set_adsr, $8E, $67
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $8E, $C1
	db !loop_subsequence, $01 : dw .subseq_1369
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_adsr, $AC, $8B
	db !set_volume_l_and_r, $1E, $11
	db !loop_subsequence, $02 : dw .subseq_14BD
	db !loop_subsequence, $02 : dw .subseq_148C
	db !loop_subsequence, $02 : dw .subseq_14B0
	db !jump_to_sequence : dw .loop_point_1458

.subseq_148C:
	db $9E, $08
	db $A3, $08
	db $A7, $08
	db $AA, $08
	db $A7, $08
	db $A3, $08
	db $A0, $08
	db $A3, $08
	db $A7, $08
	db $AA, $08
	db $A7, $08
	db $A3, $08
	db $A2, $08
	db $A6, $08
	db $A9, $08
	db $AC, $08
	db $A9, $08
	db $A6, $08
.subseq_14B0:
	db $A0, $08
	db $A6, $08
	db $A9, $08
	db $AC, $08
	db $A9, $08
	db $A6, $08
	db !return_from_sub

.subseq_14BD:
	db $9B, $10
	db $9E, $08
	db $A2, $10
	db $A7, $08
	db $AA, $10
	db $A7, $08
	db $A2, $10
	db $9E, $08
	db $A0, $10
	db $A3, $08
	db $A7, $10
	db $AC, $08
	db $AA, $10
	db $A7, $08
	db $A2, $10
	db $9E, $08
	db $A0, $10
	db $A3, $08
	db $A7, $10
	db $AC, $08
	db $AA, $10
	db $A7, $08
	db $A2, $10
	db $9E, $08
	db $9D, $10
	db $A1, $08
	db $A4, $10
	db $A9, $08
	db $AE, $10
	db $AC, $08
	db $A9, $10
	db $A6, $08
	db !return_from_sub

.seq_14FE:
	db !loop_subsequence, $01 : dw .subseq_1314
	db !echo_on
.loop_point_1503:
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !set_adsr, $8E, $F2
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_volume_l_and_r, $14, $0A
	db $80, $0C
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $10
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $10
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $10
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $10
	db $80, $C0
	db $80, $C0
	db !loop_subsequence, $01 : dw .subseq_15CF
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_adsr, $8F, $E0
	db $80, $14
	db !set_volume_l_and_r, $19, $11
	db $A3, $06
	db $80, $02
	db $A3, $05
	db $80, $03
	db $A3, $18
	db $80, $08
	db $A2, $05
	db $80, $03
	db $A0, $06
	db $80, $02
	db $A2, $18
	db !set_volume_l_and_r, $0C, $06
	db $A2, $18
	db !set_volume_l_and_r, $08, $04
	db $A2, $18
	db !set_volume_l_and_r, $04, $02
	db $A2, $18
	db $80, $20
	db !set_volume_l_and_r, $19, $11
	db $A3, $06
	db $80, $02
	db $A3, $05
	db $80, $03
	db $A3, $18
	db $80, $08
	db $A2, $05
	db $80, $03
	db $A0, $06
	db $80, $02
	db $A2, $18
	db !set_volume_l_and_r, $0C, $06
	db $A2, $08
	db !set_volume_l_and_r, $19, $11
	db $A2, $05
	db $80, $03
	db $A2, $06
	db $80, $02
	db $A2, $18
	db !set_volume_l_and_r, $0C, $06
	db $A2, $08
	db !set_volume_l_and_r, $19, $11
	db $A2, $05
	db $80, $03
	db $A2, $06
	db $80, $02
	db $A2, $10
	db $80, $08
	db $A0, $10
	db $80, $08
	db $9E, $10
	db $80, $08
	db $9D, $10
	db $80, $08
	db !jump_to_sequence : dw .loop_point_1503

.subseq_15CF:
	db !set_volume_l_and_r, $14, $0A
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db !set_volume_l_and_r, $14, $0A
	db $A2, $10
	db !set_volume_l_and_r, $03, $0B
	db $A2, $14
	db !set_volume_l_and_r, $14, $0A
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db !set_volume_l_and_r, $14, $0A
	db $A2, $10
	db !set_volume_l_and_r, $03, $0B
	db $A2, $14
	db !set_volume_l_and_r, $14, $0A
	db $9B, $03
	db $9E, $03
	db $A0, $03
	db $A2, $03
	db !set_volume_l_and_r, $14, $0A
	db $A3, $10
	db !set_volume_l_and_r, $03, $0B
	db $A3, $14
	db !set_volume_l_and_r, $14, $0A
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db !set_volume_l_and_r, $14, $0A
	db $A2, $10
	db !set_volume_l_and_r, $03, $0B
	db $A2, $14
	db !set_volume_l_and_r, $14, $0A
	db $9B, $03
	db $9E, $03
	db $A0, $03
	db $A2, $03
	db !set_volume_l_and_r, $14, $0A
	db $A3, $10
	db !set_volume_l_and_r, $03, $0B
	db $A3, $14
	db !set_volume_l_and_r, $14, $0A
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db !set_volume_l_and_r, $14, $0A
	db $A2, $10
	db !set_volume_l_and_r, $03, $0B
	db $A2, $14
	db !set_volume_l_and_r, $14, $0A
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db !set_volume_l_and_r, $14, $0A
	db $A1, $10
	db !set_volume_l_and_r, $03, $0B
	db $A1, $14
	db !set_volume_l_and_r, $14, $0A
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db !set_volume_l_and_r, $14, $0A
	db $A2, $10
	db !set_volume_l_and_r, $03, $0B
	db $A2, $14
	db !return_from_sub

.seq_167A:
	db !loop_subsequence, $01 : dw .subseq_1314
	db !echo_on
	db $80, $0B
.loop_point_1681:
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !set_adsr, $8E, $F2
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_volume_l_and_r, $04, $0F
	db $80, $0C
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $10
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $10
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $10
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $18
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_adsr, $AC, $8B
	db !set_volume_l_and_r, $05, $11
	db !loop_subsequence, $02 : dw .subseq_14BD
	db !loop_subsequence, $02 : dw .subseq_148C
	db !loop_subsequence, $02 : dw .subseq_14B0
	db !jump_to_sequence : dw .loop_point_1681

.seq_16DE:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_16E2:
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $18, $28
	db !set_adsr, $8C, $A2
	db !vibrato_with_delay, $02, $03, $05, $05
	db !set_volume_l_and_r, $32, $14
	db !change_instr_pitch_rel, $F4
	db !set_adsr, $8E, $A2
	db $83, $0C
	db $A2, $24
	db $92, $0C
	db $A2, $24
	db $83, $0C
	db $A2, $24
	db $8A, $0C
	db $A2, $24
	db !loop_subsequence, $02 : dw .subseq_1724
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $89, $E0
	db $A3, $30
	db $A3, $30
	db $A2, $60
	db $A3, $30
	db $A3, $30
	db $A2, $C0
	db !jump_to_sequence : dw .loop_point_16E2

.subseq_1724:
	db $83, $0C
	db $A2, $24
	db $92, $0C
	db $A2, $24
	db $94, $0C
	db $A3, $24
	db $83, $0C
	db $A2, $24
	db $94, $0C
	db $A3, $24
	db $83, $0C
	db $A2, $24
	db $85, $0C
	db $A1, $24
	db $91, $0C
	db $A2, $24
	db !return_from_sub

.seq_1745:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_1749:
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $32
	db !change_instr_pitch_rel, $F4
	db !set_adsr, $8E, $A2
	db !vibrato_with_delay, $02, $03, $05, $05
	db $8A, $0C
	db $9B, $24
	db $86, $0C
	db $9B, $24
	db $8A, $0C
	db $9B, $24
	db $8F, $0C
	db $9B, $24
	db !loop_subsequence, $02 : dw .subseq_1785
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $89, $E0
	db $9E, $30
	db $A0, $30
	db $9D, $60
	db $9E, $30
	db $A0, $30
	db $9D, $C0
	db !jump_to_sequence : dw .loop_point_1749

.subseq_1785:
	db $8A, $0C
	db $9B, $24
	db $86, $0C
	db $9B, $24
	db $88, $0C
	db $A0, $24
	db $8A, $0C
	db $9E, $24
	db $88, $0C
	db $A0, $24
	db $8A, $0C
	db $9E, $24
	db $8C, $0C
	db $9D, $24
	db $8A, $0C
	db $9D, $24
	db !return_from_sub

.seq_17A6:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_17AA:
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $01 : dw .subseq_183E
	db !echo_off
	db !set_instrument, $21
	db !change_instr_pitch, $00
	db !fine_tune, $AE
	db !vibrato_with_delay, $02, $02, $0B, $03
	db !set_adsr, $8E, $67
	db !set_volume_l_and_r, $32, $32
	db !set_adsr, $8E, $C1
	db !loop_subsequence, $01 : dw .subseq_137C
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $32
	db !set_adsr, $8E, $A2
	db !vibrato_with_delay, $02, $03, $05, $05
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $89, $E0
	db $A7, $30
	db $A7, $30
	db $A6, $60
	db $A7, $30
	db $A7, $30
	db $A6, $C0
	db !jump_to_sequence : dw .loop_point_17AA

.subseq_17F0:
	db !set_adsr, $8F, $E0
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_182C
	db !set_variable_note_1, $92
	db !play_subsequence : dw .subseq_182C
	db !set_variable_note_1, $88
	db !play_subsequence : dw .subseq_182C
	db !set_variable_note_1, $8F
	db !play_subsequence : dw .subseq_182C
	db !echo_off
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $88, $0C
	db !loop_subsequence, $01 : dw .subseq_1924
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $8B, $08
	db $8A, $0C
	db !echo_on
	db !loop_subsequence, $01 : dw .subseq_18F9
	db !set_variable_note_1, $91
	db !play_subsequence : dw .subseq_182C
	db !set_variable_note_1, $8A
	db !play_subsequence : dw .subseq_182C
	db !return_from_sub

.subseq_182C:
	db !echo_off
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $00
	db !fine_tune, $AD
	db $E0, $0C
	db !echo_on
	db !loop_subsequence, $01 : dw .subseq_18F9
	db !return_from_sub

.subseq_183E:
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $00
	db !fine_tune, $AD
	db $8F, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $92, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $8F, $0C
	db !loop_subsequence, $01 : dw .subseq_1924
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $8B, $08
	db $8A, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db !return_from_sub

.unreached_1871:
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $00
	db !fine_tune, $AD
	db $8F, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $92, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $8F, $0C
	db !loop_subsequence, $01 : dw .subseq_1924
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $8B, $08
	db $8A, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db $80, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db $80, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db $80, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db $80, $0C
	db !loop_subsequence, $01 : dw .subseq_18F9
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !set_adsr, $8F, $E5
	db $80, $0C
	db $94, $0C
	db $96, $0C
	db $97, $0C
	db $96, $10
	db $92, $08
	db $8F, $18
	db $91, $18
	db $92, $0C
	db $94, $0C
	db $8A, $18
	db !set_adsr, $98, $AB
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db $8A, $04
	db !end_sequence

.subseq_18F9:
	db !set_instrument, $A5
	db !set_volume_l_and_r, $10, $10
	db $9E, $03
	db !set_volume_l_and_r, $1A, $1A
	db $9E, $03
	db !set_volume_l_and_r, $20, $20
	db $9E, $03
	db !set_volume_l_and_r, $2A, $2A
	db $9E, $03
	db !set_volume_l_and_r, $30, $30
	db $9E, $06
	db !set_volume_l_and_r, $10, $10
	db $9E, $06
	db !set_volume_l_and_r, $08, $08
	db $9E, $06
	db !set_volume_l_and_r, $04, $04
	db $9E, $06
	db !return_from_sub

.subseq_1924:
	db !set_instrument, $A5
	db !set_volume_l_and_r, $10, $10
	db $9E, $03
	db !set_volume_l_and_r, $1A, $1A
	db $9E, $03
	db !set_volume_l_and_r, $20, $20
	db $9E, $03
	db !set_volume_l_and_r, $2A, $2A
	db $9E, $03
	db !set_volume_l_and_r, $30, $30
	db $9E, $06
	db !set_volume_l_and_r, $10, $10
	db $9E, $06
	db !set_volume_l_and_r, $08, $08
	db $9E, $04
	db !return_from_sub

base off
arch 65816
.end: