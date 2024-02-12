;02 K. Rool Returns
;2E1F6E
main_theme_song_data:
	dw !bgm_loc, $06B1
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_131B, .seq_1B32, .seq_1503, .seq_15F8, .seq_183D, .seq_1CB9, .seq_1467, .seq_19E6
	db $A5, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.unreached_1314:
	db !return_from_sub

.unreached_1315:
	db $80, $80
	db !return_from_sub

.subseq_1318:
	db $80, $10
	db !return_from_sub

.seq_131B:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_1318
	db !set_master_volume_indirect, $46
	db !echo_off
	db !set_echo, $37, $12, $12
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !echo_on
	db !play_subsequence : dw .subseq_1460
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $8B, $F2
	db !play_subsequence : dw .subseq_1416
	db !vibrato_off
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $4A, $3C
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_13EC
	db $9A, $30
	db !play_subsequence : dw .subseq_140F
	db !set_volume_l_and_r, $25, $27
	db !set_adsr, $8D, $A1
	db !vibrato_with_delay, $02, $03, $05, $05
	db !play_subsequence : dw .subseq_13BF
	db !vibrato_off
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $4A, $3C
	db !set_adsr, $8F, $E0
	db !play_subsequence : dw .subseq_1376
	db !end_sequence

.subseq_1376:
	db $8F, $20
	db $80, $10
	db $92, $20
	db $80, $10
	db $8F, $20
	db $80, $08
	db $8B, $08
	db $8A, $20
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
	db $80, $0C
	db $94, $0C
	db $96, $0C
	db $97, $0C
	db $96, $0E
	db $80, $02
	db $92, $08
	db $8F, $18
	db $91, $16
	db $80, $02
	db $92, $0C
	db $94, $0C
	db $97, $1E
	db $80, $02
	db $96, $1E
	db $80, $02
	db !return_from_sub

.subseq_13BF:
	db $A3, $18
	db $A2, $10
	db $A0, $08
	db $A2, $18
	db $9E, $18
	db $A0, $18
	db $9E, $10
	db $9C, $08
	db $9B, $30
	db $9C, $18
	db $9B, $10
	db $99, $08
	db $9B, $0C
	db $97, $0C
	db $94, $18
	db $95, $18
	db $96, $0C
	db $98, $0C
	db $9A, $10
	db $9B, $08
	db $9D, $0C
	db $9E, $0C
	db !return_from_sub

.subseq_13EC:
	db $8F, $28
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $92, $10
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $96, $10
	db $97, $08
	db $96, $18
	db $92, $18
	db $95, $18
	db $96, $10
	db $98, $08
	db !return_from_sub

.subseq_140F:
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !return_from_sub

.subseq_1416:
	db !loop_subsequence, $02 : dw .subseq_144F
	db $A2, $10
	db $A2, $08
	db $A3, $10
	db $A2, $08
	db $A2, $10
	db $A2, $08
	db $A2, $10
	db $A2, $08
	db !loop_subsequence, $02 : dw .subseq_143E
	db !set_default_duration, $08
	db $A1
	db $9D
	db $A1
	db $A1
	db $9D
	db $A1
	db $A2
	db $9D
	db $A2
	db $A2
	db $9D
	db $A2
	db !default_duration_off
	db !return_from_sub

.subseq_143E:
	db $A3, $10
	db $A3, $08
	db $A3, $10
	db $A3, $08
	db $A2, $10
	db $A2, $08
	db $A2, $10
	db $A2, $08
	db !return_from_sub

.subseq_144F:
	db $A2, $10
	db $A3, $08
	db $A3, $10
	db $A2, $08
	db $A2, $10
	db $9E, $08
	db $A2, $10
	db $9E, $08
	db !return_from_sub

.subseq_1460:
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !return_from_sub

.seq_1467:
	db !play_subsequence : dw .subseq_1318
	db !echo_on
	db !set_instrument, $A3
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $8F, $D5
	db !set_default_duration, $04
	db !set_volume_l_and_r, $06, $12
	db $9E
	db $9C
	db !set_volume_l_and_r, $08, $18
	db $9A
	db $98
	db $96
	db $94
	db !set_volume_l_and_r, $04, $0C
	db $98
	db $96
	db $94
	db !set_volume_l_and_r, $02, $06
	db $98
	db $96
	db $94
	db !default_duration_off
	db $80, $90
	db !set_instrument, $1F
	db !set_volume_l_and_r, $30, $30
	db !set_adsr, $8F, $E8
	db !change_instr_pitch, $FD
	db !fine_tune, $19
	db $8F, $28
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $92, $10
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $96, $10
	db $97, $08
	db $96, $18
	db $92, $18
	db $91, $18
	db $91, $18
	db $96, $30
	db !vibrato_off
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $0E, $1B
	db !set_adsr, $8F, $E0
	db !vibrato_with_delay, $03, $02, $0B, $01
	db $80, $0B
	db !play_subsequence : dw .subseq_13EC
	db $9A, $24
	db !play_subsequence : dw .subseq_140F
	db !set_volume_l_and_r, $0A, $10
	db !set_adsr, $8D, $A1
	db !vibrato_with_delay, $02, $03, $05, $05
	db $80, $0E
	db !play_subsequence : dw .subseq_13BF
	db !vibrato_off
	db !set_instrument, $A2
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $0E, $1B
	db !set_adsr, $8F, $E0
	db !vibrato_with_delay, $03, $02, $0B, $01
	db $80, $0B
	db !play_subsequence : dw .subseq_1376
	db !end_sequence

.seq_1503:
	db !play_subsequence : dw .subseq_1318
	db !echo_on
	db !set_instrument, $A3
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $8F, $D5
	db !set_volume_l_and_r, $06, $12
	db $80, $02
	db !set_default_duration, $04
	db $9D
	db !set_volume_l_and_r, $08, $18
	db $9B
	db $99
	db $97
	db $95
	db $93
	db !set_volume_l_and_r, $04, $0C
	db $97
	db $95
	db $93
	db !set_volume_l_and_r, $02, $06
	db $97
	db $95
	db $93
	db !default_duration_off
	db $80, $8E
	db !set_instrument, $20
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $8B, $E8
	db !change_instr_pitch, $00
	db !fine_tune, $29
	db !vibrato_with_delay, $04, $02, $03, $05
	db $8F, $28
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $92, $10
	db $91, $08
	db $92, $18
	db $8F, $18
	db $94, $18
	db $96, $10
	db $97, $08
	db $96, $18
	db $92, $18
	db $91, $18
	db $91, $18
	db $96, $30
	db !echo_off
	db !set_instrument, $21
	db !set_volume_l_and_r, $4A, $4A
	db !change_instr_pitch, $00
	db !fine_tune, $AE
	db !vibrato_with_delay, $02, $02, $0B, $03
	db !set_adsr, $8E, $67
	db $8F, $60
	db $88, $48
	db !set_adsr, $8E, $76
	db $86, $0C
	db $83, $0C
	db $88, $18
	db $88, $18
	db $83, $18
	db $86, $18
	db $89, $18
	db $8C, $18
	db $8E, $18
	db $8A, $18
	db !set_volume_l_and_r, $44, $44
	db !set_adsr, $8E, $D7
	db $88, $18
	db $88, $18
	db $8F, $18
	db $8F, $18
	db $84, $18
	db $84, $18
	db $8B, $18
	db $8B, $18
	db $8D, $18
	db $8D, $18
	db $88, $18
	db $88, $18
	db $85, $18
	db $85, $18
	db $8A, $18
	db $8A, $18
	db !set_volume_l_and_r, $3A, $3A
	db !set_adsr, $8E, $C1
	db $8F, $20
	db $80, $10
	db $92, $20
	db $80, $10
	db $8F, $20
	db $80, $08
	db $8B, $08
	db $8A, $20
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
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $EA
	db $9B, $30
	db $9B, $30
	db $9A, $30
	db $9A, $40
	db !end_sequence

.seq_15F8:
	db !play_subsequence : dw .subseq_1318
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $10, $10
	db !set_adsr, $8C, $A2
	db !vibrato_with_delay, $02, $03, $05, $05
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $A0, $10
	db $A0, $08
	db $A0, $10
	db $A0, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $A0, $10
	db $A0, $08
	db $A0, $10
	db $A0, $08
	db $9E, $10
	db $9E, $08
	db $9E, $10
	db $9E, $08
	db $9D, $10
	db $9D, $08
	db $9D, $10
	db $9D, $08
	db $9D, $10
	db $9D, $08
	db $9D, $10
	db $9D, $08
	db !set_adsr, $8C, $A0
	db $9E, $60
	db $A0, $30
	db $9E, $30
	db !set_volume_l_and_r, $30, $30
	db $97, $18
	db $99, $18
	db $9B, $18
	db $9E, $18
	db $9D, $18
	db $A1, $18
	db $A2, $30
	db !set_instrument, $22
	db !set_volume_l_and_r, $40, $20
	db !change_instr_pitch, $05
	db !fine_tune, $B6
	db !set_adsr, $8F, $E0
	db $80, $08
	db !set_volume_l_and_r, $28, $0A
	db $9B, $04
	db !set_volume_l_and_r, $06, $10
	db $9B, $04
	db !set_volume_l_and_r, $28, $0A
	db $A0, $04
	db !set_volume_l_and_r, $06, $10
	db $A0, $04
	db !set_volume_l_and_r, $28, $0A
	db $A3, $04
	db !set_volume_l_and_r, $06, $10
	db $A3, $04
	db $80, $18
	db !set_volume_l_and_r, $28, $0A
	db $A2, $04
	db !set_volume_l_and_r, $06, $10
	db $A2, $04
	db !set_volume_l_and_r, $28, $0A
	db $A3, $04
	db !set_volume_l_and_r, $06, $10
	db $A3, $04
	db !set_volume_l_and_r, $28, $0A
	db $A2, $04
	db !set_volume_l_and_r, $06, $10
	db $A2, $04
	db !set_volume_l_and_r, $28, $0A
	db $9E, $04
	db !set_volume_l_and_r, $06, $10
	db $9E, $04
	db !set_volume_l_and_r, $28, $0A
	db $9B, $04
	db !set_volume_l_and_r, $06, $10
	db $9B, $04
	db $80, $08
	db !set_volume_l_and_r, $28, $0A
	db $97, $04
	db !set_volume_l_and_r, $06, $10
	db $97, $04
	db !set_volume_l_and_r, $28, $0A
	db $9C, $04
	db !set_volume_l_and_r, $06, $10
	db $9C, $04
	db !set_volume_l_and_r, $28, $0A
	db $A0, $04
	db !set_volume_l_and_r, $06, $10
	db $A0, $04
	db $80, $18
	db !set_volume_l_and_r, $28, $0A
	db $9B, $04
	db !set_volume_l_and_r, $06, $10
	db $9B, $04
	db !set_volume_l_and_r, $28, $0A
	db $9C, $04
	db !set_volume_l_and_r, $06, $10
	db $9C, $04
	db !set_volume_l_and_r, $28, $0A
	db $9B, $04
	db !set_volume_l_and_r, $06, $10
	db $9B, $04
	db !set_volume_l_and_r, $28, $0A
	db $99, $04
	db !set_volume_l_and_r, $06, $10
	db $99, $04
	db !set_volume_l_and_r, $28, $0A
	db $97, $04
	db !set_volume_l_and_r, $06, $10
	db $97, $04
	db $80, $08
	db !set_volume_l_and_r, $28, $0A
	db $99, $04
	db !set_volume_l_and_r, $06, $10
	db $99, $04
	db !set_volume_l_and_r, $28, $0A
	db $9B, $04
	db !set_volume_l_and_r, $06, $10
	db $9B, $04
	db !set_volume_l_and_r, $28, $0A
	db $9C, $04
	db !set_volume_l_and_r, $06, $10
	db $9C, $04
	db $80, $18
	db !set_volume_l_and_r, $28, $0A
	db $99, $04
	db !set_volume_l_and_r, $06, $10
	db $99, $04
	db !set_volume_l_and_r, $28, $0A
	db $9C, $04
	db !set_volume_l_and_r, $06, $10
	db $9C, $04
	db !set_volume_l_and_r, $28, $0A
	db $9B, $04
	db !set_volume_l_and_r, $06, $10
	db $9B, $04
	db !set_volume_l_and_r, $28, $0A
	db $97, $04
	db !set_volume_l_and_r, $06, $10
	db $97, $04
	db !set_volume_l_and_r, $28, $0A
	db $94, $04
	db !set_volume_l_and_r, $06, $10
	db $94, $04
	db !set_instrument, $23
	db !set_volume_l_and_r, $1A, $2A
	db !set_adsr, $8D, $EA
	db !change_instr_pitch, $00
	db !fine_tune, $2A
	db $80, $08
	db $95, $08
	db $96, $08
	db $98, $08
	db $99, $08
	db $9B, $10
	db $9D, $08
	db $9E, $08
	db $9D, $04
	db $9B, $04
	db $99, $04
	db $98, $04
	db $96, $08
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
	db $9E, $03
	db $A0, $03
	db $A2, $03
	db $A3, $10
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $18
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $EA
	db $A3, $30
	db $A2, $30
	db $A0, $30
	db $A3, $20
	db $A2, $20
	db !end_sequence

.seq_183D:
	db !play_subsequence : dw .subseq_1318
	db !echo_on
	db !set_instrument, $24
	db !change_instr_pitch, $0C
	db !fine_tune, $AB
	db !set_volume_l_and_r, $0A, $20
	db !set_adsr, $8E, $FA
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A3, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A3, $08
	db $A0, $08
	db $9B, $08
	db $A3, $08
	db $A0, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A3, $08
	db $A0, $08
	db $9B, $08
	db $A3, $08
	db $A0, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A2, $08
	db $9E, $08
	db $9B, $08
	db $A1, $08
	db $9D, $08
	db $98, $08
	db $A1, $08
	db $9D, $08
	db $98, $08
	db !set_volume_l_and_r, $30, $10
	db !change_instr_pitch_rel, $F4
	db !set_adsr, $8E, $D5
	db $8E, $03
	db $8F, $03
	db $91, $03
	db $93, $03
	db $94, $03
	db $96, $03
	db $98, $03
	db $9A, $03
	db $9B, $03
	db $9D, $03
	db $9F, $03
	db $A0, $03
	db $A2, $03
	db $A4, $03
	db $A6, $03
	db $A7, $03
	db !echo_off
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $00
	db !fine_tune, $AD
	db !set_adsr, $8F, $92
	db $8F, $60
	db $88, $48
	db $86, $0C
	db $83, $0C
	db $88, $90
	db !echo_on
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $AB
	db !set_volume_l_and_r, $30, $10
	db !set_adsr, $8E, $D5
	db $8A, $03
	db $8C, $03
	db $8E, $03
	db $8F, $03
	db $91, $03
	db $93, $03
	db $94, $03
	db $96, $03
	db $98, $03
	db $9A, $03
	db $9B, $03
	db $9D, $03
	db $9F, $03
	db $A0, $03
	db $A2, $03
	db $A4, $03
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $28, $18
	db !set_adsr, $8C, $A2
	db !vibrato_with_delay, $02, $03, $05, $05
	db $9B, $30
	db $9E, $18
	db $9B, $18
	db $97, $60
	db $99, $30
	db $94, $30
	db $91, $30
	db $96, $30
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !set_adsr, $8E, $F2
	db !vibrato_with_delay, $03, $01, $0B, $02
	db $80, $0B
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
	db $9E, $03
	db $A0, $03
	db $A2, $03
	db $A3, $10
	db $80, $14
	db $9B, $03
	db $9D, $03
	db $9E, $03
	db $A0, $03
	db $A2, $0D
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $14, $14
	db !set_adsr, $88, $EA
	db $A0, $30
	db $9E, $30
	db $9D, $30
	db $A0, $40
	db !end_sequence

.seq_19E6:
	db !play_subsequence : dw .subseq_1318
	db !echo_on
	db !set_instrument, $23
	db !set_volume_l_and_r, $30, $30
	db !set_adsr, $8E, $EA
	db !change_instr_pitch, $00
	db !fine_tune, $2A
	db $96, $08
	db $92, $08
	db $97, $08
	db $97, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $97, $08
	db $97, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $97, $08
	db $97, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $95, $08
	db $91, $08
	db $95, $08
	db $95, $08
	db $91, $08
	db $95, $08
	db $96, $08
	db $91, $08
	db $96, $08
	db $96, $08
	db $91, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $97, $08
	db $97, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $95, $08
	db $91, $08
	db $95, $08
	db $98, $08
	db $95, $08
	db $98, $08
	db $9A, $08
	db $96, $08
	db $9A, $08
	db $9A, $08
	db $96, $08
	db $9A, $08
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $18, $28
	db !set_adsr, $8C, $A2
	db !vibrato_with_delay, $02, $03, $05, $05
	db $97, $30
	db $9B, $18
	db $96, $18
	db $94, $30
	db $92, $30
	db $94, $30
	db $8F, $30
	db $8C, $30
	db $91, $30
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
	db $83, $0C
	db $A2, $24
	db $92, $0C
	db $A2, $24
	db $88, $0C
	db $A2, $24
	db $8A, $0C
	db $A2, $24
	db !end_sequence

.seq_1B32:
	db !play_subsequence : dw .subseq_1318
	db !set_instrument, $23
	db !set_volume_l_and_r, $08, $18
	db !set_adsr, $8E, $EA
	db !change_instr_pitch, $00
	db !fine_tune, $2A
	db $80, $0B
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $95, $08
	db $91, $08
	db $95, $08
	db $95, $08
	db $91, $08
	db $95, $08
	db $96, $08
	db $91, $08
	db $96, $08
	db $96, $08
	db $91, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $97, $08
	db $97, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $97, $08
	db $94, $08
	db $97, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $96, $08
	db $92, $08
	db $96, $08
	db $95, $08
	db $91, $08
	db $95, $08
	db $98, $08
	db $95, $08
	db $98, $08
	db $9A, $08
	db $96, $08
	db $9A, $08
	db $9A, $08
	db $96, $08
	db $9A, $08
	db $80, $8D
	db !set_instrument, $1E
	db !change_instr_pitch, $0C
	db !fine_tune, $B8
	db !set_adsr, $8E, $F2
	db !vibrato_with_delay, $03, $01, $0B, $02
	db !set_volume_l_and_r, $0F, $1E
	db !set_adsr, $88, $D1
	db $9B, $08
	db $9E, $08
	db $A3, $04
	db $A2, $04
	db $A3, $04
	db $A2, $04
	db $A3, $04
	db $A2, $04
	db !set_volume_l_and_r, $0C, $1E
	db !set_adsr, $8B, $EF
	db $A3, $6F
	db !set_instrument, $23
	db !set_volume_l_and_r, $11, $05
	db !set_adsr, $8D, $EA
	db !change_instr_pitch, $00
	db !fine_tune, $2A
	db $80, $08
	db $95, $08
	db $96, $08
	db $98, $08
	db $99, $08
	db $9B, $10
	db $9D, $08
	db $9E, $08
	db $9D, $04
	db $9B, $04
	db $99, $04
	db $98, $01
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
	db $8A, $0C
	db $9B, $24
	db $86, $0C
	db $9B, $24
	db $8F, $0C
	db $9B, $24
	db $8F, $0C
	db $9B, $24
	db !end_sequence

.seq_1CB9:
	db !play_subsequence : dw .subseq_1318
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $10, $10
	db !set_adsr, $8C, $A2
	db !vibrato_with_delay, $02, $03, $05, $05
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $9B, $10
	db $9B, $08
	db $98, $10
	db $98, $08
	db $98, $10
	db $98, $08
	db $9A, $10
	db $9A, $08
	db $9A, $10
	db $9A, $08
	db !set_adsr, $8C, $A0
	db $9B, $C0
	db !set_adsr, $8C, $A0
	db !set_volume_l_and_r, $30, $30
	db $94, $18
	db $94, $18
	db $96, $18
	db $96, $18
	db $98, $18
	db $9D, $18
	db $9D, $30
	db !set_instrument, $A3
	db !change_instr_pitch, $0C
	db !fine_tune, $AD
	db !set_adsr, $8F, $D5
	db !set_volume_l_and_r, $06, $12
	db !set_volume_l_and_r, $06, $12
	db $A3, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $A3, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $A3, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $A3, $05
	db !change_instr_pitch_rel, $F4
	db $80, $08
	db !set_volume_l_and_r, $06, $12
	db $A2, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $A2, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $A2, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $A2, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $A0, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $A0, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $A2, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $A2, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $A2, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $A2, $05
	db !change_instr_pitch_rel, $F4
	db $80, $08
	db !set_volume_l_and_r, $06, $12
	db $9E, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9E, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9E, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9E, $05
	db !change_instr_pitch_rel, $F4
	db $80, $08
	db !set_volume_l_and_r, $06, $12
	db !set_volume_l_and_r, $06, $12
	db $A0, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $A0, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $A0, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $A0, $05
	db !change_instr_pitch_rel, $F4
	db $80, $08
	db !set_volume_l_and_r, $06, $12
	db $9E, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9E, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9E, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9E, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $9C, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9C, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $9B, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9B, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9B, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9B, $05
	db !change_instr_pitch_rel, $F4
	db $80, $20
	db !set_volume_l_and_r, $06, $12
	db $9C, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9C, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9C, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9C, $05
	db !change_instr_pitch_rel, $F4
	db $80, $08
	db !set_volume_l_and_r, $06, $12
	db $9B, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9B, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9B, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9B, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $99, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $99, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $9B, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9B, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9B, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9B, $01
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $97, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $97, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $97, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $97, $01
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $94, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $94, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $94, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $94, $05
	db !change_instr_pitch_rel, $F4
	db $80, $08
	db !set_volume_l_and_r, $06, $12
	db $9A, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9A, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9A, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9A, $05
	db !change_instr_pitch_rel, $F4
	db $80, $08
	db !set_volume_l_and_r, $06, $12
	db $96, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $96, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $96, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $96, $01
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $98, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $98, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $98, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $98, $01
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $9A, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9A, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9A, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9A, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $9B, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9B, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $9D, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9D, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db $9D, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $01, $03
	db $9D, $01
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $06, $12
	db $9E, $03
	db !change_instr_pitch_rel, $0C
	db !set_volume_l_and_r, $04, $0A
	db $9E, $05
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $02, $06
	db !echo_off
	db $9E, $04
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db !change_instr_pitch, $00
	db !fine_tune, $AD
	db !set_adsr, $8F, $92
	db $8F, $0C
	db !play_subsequence : dw .subseq_2010
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $92, $0C
	db !play_subsequence : dw .subseq_2010
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $8F, $0C
	db !play_subsequence : dw .subseq_203B
	db !set_instrument, $A4
	db !set_volume_l_and_r, $50, $50
	db $8B, $08
	db $8A, $0C
	db !play_subsequence : dw .subseq_2010
	db $80, $0C
	db !play_subsequence : dw .subseq_2010
	db $80, $0C
	db !play_subsequence : dw .subseq_2010
	db $80, $0C
	db !play_subsequence : dw .subseq_2010
	db $80, $0C
	db !play_subsequence : dw .subseq_2010
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

.subseq_2010:
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

.subseq_203B:
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