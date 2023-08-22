;04 Swanky's Swing
;2E3D78
swanky_song_data:
	dw !bgm_loc, $0252
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_133E, .seq_14B4, .seq_140B, .seq_16C0, .seq_1615, .seq_1761, .seq_1575, .seq_13C4
	db $B0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.unreached_1314:
	db !set_echo, $37, $20, $20
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !echo_on
	db !change_instr_pitch, $F9
	db !fine_tune, $00
	db !set_volume_l_and_r, $7F, $7F
	db !set_adsr, $8F, $E0
	db $81, $0C
	db $88, $0A
	db $81, $0C
	db $88, $0A
	db $81, $0C
	db $88, $0A
	db $81, $0C
	db $88, $0A
	db !end_sequence

.unreached_133D:
	db !end_sequence

.seq_133E:
	db !echo_delay, $08
	db $80, $10
	db !set_echo, $37, $20, $20
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db !set_instrument, $8C
	db !set_volume_l_and_r, $20, $20
	db !echo_on
	db !set_adsr, $CF, $96
	db $80, $06
	db $91, $02
	db $92, $03
	db $91, $05
	db $8F, $06
	db !echo_off
.loop_point_1363:
	db !set_instrument, $00
	db !set_volume_l_and_r, $50, $50
	db !set_adsr, $CF, $96
	db $8E, $0A
	db !echo_on
	db !set_instrument, $19
	db !set_volume_l_and_r, $24, $10
	db !set_adsr, $CF, $96
	db $90, $10
	db $90, $06
	db !set_instrument, $A5
	db !set_volume_l_and_r, $3A, $40
	db !set_adsr, $AF, $EB
	db $99, $10
	db !set_instrument, $19
	db !set_volume_l_and_r, $1C, $18
	db !set_adsr, $CF, $96
	db $95, $0A
	db $95, $06
	db !echo_off
	db !set_instrument, $00
	db !set_volume_l_and_r, $50, $50
	db !set_adsr, $CF, $96
	db $8E, $0A
	db !echo_on
	db !set_instrument, $19
	db !set_volume_l_and_r, $0C, $28
	db !set_adsr, $DF, $99
	db $A4, $10
	db $A4, $06
	db !set_instrument, $A5
	db !set_volume_l_and_r, $3A, $40
	db !set_adsr, $AF, $EB
	db $99, $10
	db !set_instrument, $19
	db !set_volume_l_and_r, $24, $10
	db !set_adsr, $CF, $96
	db $95, $05
	db $95, $05
	db $95, $06
	db !echo_off
	db !jump_to_sequence : dw .loop_point_1363

.seq_13C4:
	db $80, $10
	db $80, $16
.loop_point_13C8:
	db !set_instrument, $8D
	db !set_volume_l_and_r, $30, $1A
	db !change_instr_pitch, $00
	db !loop_subsequence, $20 : dw .subseq_13FB
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $1C, $0A
	db !set_adsr, $9B, $A8
	db $93, $E0
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_adsr, $DE, $51
	db !set_volume_l_and_r, $18, $20
	db $93, $08
	db $80, $02
	db $93, $0D
	db !set_volume_l_and_r, $0A, $08
	db $93, $09
	db !jump_to_sequence : dw .loop_point_13C8

.subseq_13FB:
	db !set_adsr, $FF, $4B
	db $98, $10
	db !set_adsr, $FE, $4B
	db $98, $0A
	db !set_adsr, $FF, $4E
	db $98, $06
	db !return_from_sub

.seq_140B:
	db $80, $10
	db $80, $16
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_volume_l_and_r, $50, $50
.loop_point_1418:
	db !loop_subsequence, $02 : dw .subseq_1475
	db !loop_subsequence, $02 : dw .subseq_1449
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $10
	db $87, $0A
	db $87, $06
	db $8C, $08
	db $80, $02
	db $8C, $06
	db $80, $10
	db !jump_to_sequence : dw .loop_point_1418

.subseq_1449:
	db !set_adsr, $DF, $88
	db $8E, $10
	db $8E, $10
	db $8E, $10
	db $8E, $0A
	db $8E, $06
	db $8E, $10
	db $8E, $10
	db $8E, $10
	db $8E, $0A
	db $8E, $06
	db $8E, $10
	db $8E, $10
	db $8E, $10
	db $8E, $0A
	db $8E, $06
	db $8A, $10
	db $8A, $10
	db $89, $10
	db $89, $0A
	db $8D, $06
	db !return_from_sub

.subseq_1475:
	db !set_adsr, $DF, $E2
	db $89, $10
	db $89, $10
	db $89, $0A
	db $89, $06
	db $87, $0A
	db $88, $06
	db !set_adsr, $DF, $E2
	db $89, $10
	db $89, $10
	db $89, $0A
	db $89, $06
	db !set_adsr, $FF, $50
	db $93, $05
	db $94, $05
	db $95, $06
	db !set_adsr, $DF, $E2
	db $89, $10
	db $89, $10
	db $89, $10
	db $89, $0A
	db $89, $10
	db $89, $06
	db $89, $10
	db $89, $0A
	db $89, $06
	db $86, $05
	db $87, $05
	db $88, $06
	db !return_from_sub

.seq_14B4:
	db $80, $10
	db $80, $16
.loop_point_14B8:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $18, $20
	db !set_adsr, $DE, $51
	db !loop_subsequence, $02 : dw .subseq_1526
	db !change_instr_pitch, $FC
	db !loop_subsequence, $02 : dw .subseq_14F6
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0A, $1C
	db !set_adsr, $9B, $A8
	db $9D, $E0
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_adsr, $DE, $51
	db !set_volume_l_and_r, $18, $20
	db $9D, $08
	db $80, $02
	db $9D, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9D, $09
	db !jump_to_sequence : dw .loop_point_14B8

.subseq_14F6:
	db !loop_subsequence, $03 : dw .subseq_1512
	db !play_subsequence : dw .subseq_1505
	db !change_instr_pitch_rel, $FF
	db !play_subsequence : dw .subseq_1505
	db !change_instr_pitch_rel, $01
	db !return_from_sub

.subseq_1505:
	db $80, $0A
	db !set_volume_l_and_r, $18, $20
	db $9D, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9D, $09
	db !return_from_sub

.subseq_1512:
	db !set_volume_l_and_r, $18, $20
	db $9D, $18
	db $80, $02
	db $9D, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9D, $0D
	db !set_volume_l_and_r, $04, $06
	db $9D, $0C
	db !return_from_sub

.subseq_1526:
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $99, $14
	db $80, $02
	db $9A, $0C
	db !set_volume_l_and_r, $0A, $08
	db $9A, $0C
	db !set_volume_l_and_r, $04, $06
	db $9A, $08
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $99, $14
	db $80, $02
	db $9A, $0C
	db !set_volume_l_and_r, $0A, $08
	db $9A, $0C
	db !set_volume_l_and_r, $04, $06
	db $9A, $08
	db $80, $0A
	db !set_volume_l_and_r, $18, $20
	db $99, $14
	db $80, $02
	db $9A, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9A, $0D
	db !set_volume_l_and_r, $18, $20
	db $9C, $14
	db $80, $02
	db $9A, $0E
	db $80, $02
	db $99, $0A
	db $9A, $0C
	db !set_volume_l_and_r, $0A, $08
	db $9A, $0A
	db !return_from_sub

.seq_1575:
	db $80, $10
	db $80, $16
.loop_point_1579:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $18, $20
	db !set_adsr, $DE, $51
	db !loop_subsequence, $02 : dw .subseq_15C6
	db !loop_subsequence, $02 : dw .subseq_15B5
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $1C, $0A
	db !set_adsr, $9B, $A8
	db $9A, $E0
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_adsr, $DE, $51
	db !set_volume_l_and_r, $18, $20
	db $9A, $08
	db $80, $02
	db $9A, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9A, $09
	db !jump_to_sequence : dw .loop_point_1579

.subseq_15B5:
	db !change_instr_pitch_rel, $FD
	db !loop_subsequence, $03 : dw .subseq_1512
	db !play_subsequence : dw .subseq_1505
	db !change_instr_pitch_rel, $FE
	db !play_subsequence : dw .subseq_1505
	db !change_instr_pitch_rel, $05
	db !return_from_sub

.subseq_15C6:
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $93, $14
	db $80, $02
	db $93, $0C
	db !set_volume_l_and_r, $0A, $08
	db $93, $0C
	db !set_volume_l_and_r, $04, $06
	db $93, $08
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $93, $14
	db $80, $02
	db $93, $0C
	db !set_volume_l_and_r, $0A, $08
	db $93, $0C
	db !set_volume_l_and_r, $04, $06
	db $93, $08
	db $80, $0A
	db !set_volume_l_and_r, $18, $20
	db $93, $14
	db $80, $02
	db $93, $0D
	db !set_volume_l_and_r, $0A, $08
	db $93, $0D
	db !set_volume_l_and_r, $18, $20
	db $99, $14
	db $80, $02
	db $97, $0E
	db $80, $02
	db $95, $0A
	db $97, $0C
	db !set_volume_l_and_r, $0A, $08
	db $97, $0A
	db !return_from_sub

.seq_1615:
	db $80, $10
	db $80, $16
.loop_point_1619:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $18, $20
	db !set_adsr, $DE, $51
	db !loop_subsequence, $02 : dw .subseq_1671
	db !loop_subsequence, $02 : dw .subseq_1655
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0A, $1C
	db !set_adsr, $9B, $A8
	db $96, $E0
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_adsr, $DE, $51
	db !set_volume_l_and_r, $18, $20
	db $96, $08
	db $80, $02
	db $96, $0D
	db !set_volume_l_and_r, $0A, $08
	db $96, $09
	db !jump_to_sequence : dw .loop_point_1619

.subseq_1655:
	db !change_instr_pitch_rel, $F8
	db !play_subsequence : dw .subseq_1512
	db !change_instr_pitch_rel, $01
	db !play_subsequence : dw .subseq_1512
	db !change_instr_pitch_rel, $01
	db !play_subsequence : dw .subseq_1512
	db !change_instr_pitch_rel, $FE
	db !play_subsequence : dw .subseq_1505
	db !change_instr_pitch_rel, $FE
	db !play_subsequence : dw .subseq_1505
	db !change_instr_pitch_rel, $0A
	db !return_from_sub

.subseq_1671:
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $90, $14
	db $80, $02
	db $90, $0C
	db !set_volume_l_and_r, $0A, $08
	db $90, $0C
	db !set_volume_l_and_r, $04, $06
	db $90, $08
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $90, $14
	db $80, $02
	db $90, $0C
	db !set_volume_l_and_r, $0A, $08
	db $90, $0C
	db !set_volume_l_and_r, $04, $06
	db $90, $08
	db $80, $0A
	db !set_volume_l_and_r, $18, $20
	db $90, $14
	db $80, $02
	db $90, $0D
	db !set_volume_l_and_r, $0A, $08
	db $90, $0D
	db !set_volume_l_and_r, $18, $20
	db $93, $14
	db $80, $02
	db $93, $0E
	db $80, $02
	db $93, $0A
	db $93, $0C
	db !set_volume_l_and_r, $0A, $08
	db $93, $0A
	db !return_from_sub

.seq_16C0:
	db $80, $10
.loop_point_16C2:
	db !set_instrument, $1B
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $60, $30
	db !set_adsr, $EF, $21
	db $93, $06
	db $99, $0A
	db $9A, $06
	db !play_subsequence : dw .subseq_1732
	db $95, $0A
	db $97, $06
	db $99, $0A
	db $9A, $06
	db !play_subsequence : dw .subseq_1732
	db $8D, $0A
	db $8E, $06
	db $90, $0A
	db $80, $06
	db !set_instrument, $8E
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_adsr, $9F, $91
	db !set_volume_l_and_r, $1E, $18
	db !loop_subsequence, $02 : dw .subseq_170B
	db !play_subsequence : dw .subseq_1700
	db !jump_to_sequence : dw .loop_point_16C2

.subseq_1700:
	db $9D, $30
	db $9C, $10
	db $9A, $30
	db $98, $10
	db $96, $6A
	db !return_from_sub

.subseq_170B:
	db $80, $10
	db $9A, $10
	db $9D, $0A
	db $9A, $16
	db $9D, $10
	db $9A, $0A
	db $9D, $16
	db $9D, $0A
	db $9D, $06
	db $80, $10
	db $9A, $10
	db $9D, $0A
	db $9A, $10
	db $9D, $10
	db $9D, $06
	db $9F, $0A
	db $A1, $06
	db $9F, $0A
	db $9C, $16
	db !return_from_sub

.subseq_1732:
	db $99, $0A
	db $95, $0E
	db $80, $02
	db $93, $10
	db $80, $06
	db $99, $0A
	db $9A, $06
	db $99, $0A
	db $95, $0E
	db $80, $02
	db $93, $10
	db $93, $06
	db $99, $0A
	db $9A, $06
	db $99, $0A
	db $95, $0E
	db $80, $02
	db $93, $10
	db $93, $06
	db $97, $0A
	db $95, $10
	db $90, $10
	db $90, $06
	db !return_from_sub

.seq_1761:
	db $80, $10
	db $80, $0A
.loop_point_1765:
	db !set_instrument, $1B
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $20, $3A
	db !set_adsr, $EF, $20
	db $93, $06
	db $99, $0A
	db $9A, $06
	db !play_subsequence : dw .subseq_1732
	db $95, $0A
	db $97, $06
	db $99, $0A
	db $9A, $06
	db !play_subsequence : dw .subseq_1732
	db $8D, $0A
	db $8E, $06
	db $90, $0A
	db $80, $06
	db !set_instrument, $8E
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_adsr, $9F, $8A
	db !set_volume_l_and_r, $06, $0C
	db !loop_subsequence, $02 : dw .subseq_170B
	db !play_subsequence : dw .subseq_1700
	db !jump_to_sequence : dw .loop_point_1765

base off
arch 65816
.end: