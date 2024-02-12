;08 Funky the Main Monkey
;2E6F47
funky_song_data:
	dw !bgm_loc, $02A1
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1352, .seq_13E0, .seq_1442, .seq_15CB, .seq_168E, .seq_1802, .seq_1764, .seq_165E
	db $BD, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.unreached_1314:
	db !set_echo, $3A, $23, $23
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
	db !set_instrument, $7A
	db !change_instr_pitch, $11
	db !fine_tune, $E8
	db !set_volume_l_and_r, $50, $50
	db !set_adsr, $DF, $4F
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db $99, $10
	db !end_sequence

.unreached_134E:
	db !end_sequence

.subseq_134F:
	db $80, $10
	db !return_from_sub

.seq_1352:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_134F
	db !set_master_volume_indirect, $6E
	db !set_echo, $3A, $23, $23
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
.loop_point_1366:
	db !set_instrument, $7B
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $6F, $6F
	db !set_adsr, $8F, $E0
	db $87, $08
	db $80, $78
	db $80, $50
	db $87, $08
	db $80, $10
	db $87, $08
	db $80, $10
	db $87, $08
	db $80, $08
	db !set_instrument, $7C
	db !change_instr_pitch, $03
	db !fine_tune, $02
	db !set_volume_l_and_r, $0F, $28
	db !set_adsr, $8F, $E0
	db $91, $18
	db $8C, $18
	db $8A, $10
	db $80, $28
	db !set_instrument, $7B
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $3C, $3C
	db $87, $08
	db !loop_subsequence, $03 : dw .subseq_13CC
	db !set_instrument, $A5
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $50, $50
	db $99, $09
	db $9A, $07
	db $99, $09
	db $98, $07
	db !set_instrument, $7B
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $6F, $6F
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $10 : dw .subseq_13DD
	db !jump_to_sequence : dw .loop_point_1366
	db !end_sequence

.subseq_13CC:
	db !set_instrument, $A5
	db !set_volume_l_and_r, $50, $50
	db $99, $10
	db !set_instrument, $7B
	db !set_volume_l_and_r, $5A, $5A
	db $87, $08
	db $80, $08
	db !return_from_sub

.subseq_13DD:
	db $87, $80
	db !return_from_sub

.seq_13E0:
	db !play_subsequence : dw .subseq_134F
	db !echo_on
.loop_point_13E4:
	db !set_instrument, $7D
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $32, $32
	db !set_adsr, $8F, $E0
	db !set_instrument, $7D
	db !change_instr_pitch, $FF
	db !fine_tune, $07
	db $96, $80
	db $80, $50
	db $94, $18
	db $95, $18
	db $96, $80
	db $94, $20
	db $94, $20
	db $94, $20
	db $94, $10
	db $95, $10
	db $96, $10
	db !set_volume_l_and_r, $28, $0A
	db !set_adsr, $8F, $E0
	db !set_instrument, $7E
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db $90, $20
	db $80, $50
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $10
	db $91, $20
	db $80, $50
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_13E4
	db !end_sequence

.seq_1442:
	db !play_subsequence : dw .subseq_134F
	db !set_volume_l_and_r, $3C, $1E
	db !set_adsr, $8F, $E0
.loop_point_144B:
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_154F
	db !play_subsequence : dw .subseq_1586
	db !play_subsequence : dw .subseq_154F
	db !play_subsequence : dw .subseq_1586
	db !play_subsequence : dw .subseq_154F
	db !play_subsequence : dw .subseq_1586
	db !loop_subsequence, $02 : dw .subseq_1586
	db !play_subsequence : dw .subseq_14CB
	db !play_subsequence : dw .subseq_14C2
	db !play_subsequence : dw .subseq_14CB
	db !play_subsequence : dw .subseq_14C2
	db !play_subsequence : dw .subseq_14CB
	db !play_subsequence : dw .subseq_14C2
	db !play_subsequence : dw .subseq_14CB
	db !play_subsequence : dw .subseq_14C2
	db !jump_to_sequence : dw .loop_point_144B
	db !end_sequence

.unreached_147F:
	db !set_instrument, $84
	db !change_instr_pitch, $FC
	db !fine_tune, $09
	db $E0, $10
	db !set_instrument, $80
	db !change_instr_pitch, $FD
	db !fine_tune, $EA
	db $E1, $08
	db !set_instrument, $7F
	db !change_instr_pitch, $FD
	db !fine_tune, $E9
	db $E1, $08
	db !return_from_sub

.unreached_1498:
	db !set_instrument, $84
	db !change_instr_pitch, $FC
	db !fine_tune, $14
	db $E0, $10
	db !set_instrument, $80
	db !change_instr_pitch, $FD
	db !fine_tune, $F5
	db $E1, $08
	db !set_instrument, $7F
	db !change_instr_pitch, $FD
	db !fine_tune, $F4
	db $E1, $08
	db !return_from_sub

.subseq_14B1:
	db !loop_subsequence, $02 : dw .subseq_14F9
	db !loop_subsequence, $03 : dw .subseq_150A
	db !return_from_sub

.subseq_14BA:
	db !play_subsequence : dw .subseq_14D3
	db !loop_subsequence, $03 : dw .subseq_150A
	db !return_from_sub

.subseq_14C2:
	db !loop_subsequence, $02 : dw .subseq_1575
	db !loop_subsequence, $03 : dw .subseq_1586
	db !return_from_sub

.subseq_14CB:
	db !play_subsequence : dw .subseq_154F
	db !loop_subsequence, $03 : dw .subseq_1586
	db !return_from_sub

.subseq_14D3:
	db !play_subsequence : dw .subseq_14F9
	db !set_instrument, $80
	db !change_instr_pitch, $FD
	db !fine_tune, $EC
	db !set_instrument, $80
	db $E0, $09
	db !set_instrument, $81
	db !change_instr_pitch, $FD
	db !fine_tune, $03
	db $E0, $07
	db !set_instrument, $82
	db !change_instr_pitch, $FC
	db !fine_tune, $09
	db $E0, $09
	db !set_instrument, $83
	db !change_instr_pitch, $FD
	db !fine_tune, $03
	db $E0, $07
	db !return_from_sub

.subseq_14F9:
	db !change_instr_pitch, $FC
	db !fine_tune, $09
	db !set_instrument, $84
	db $E0, $19
	db !set_instrument, $83
	db !change_instr_pitch, $FD
	db !fine_tune, $03
	db $E0, $07
	db !return_from_sub

.subseq_150A:
	db !set_instrument, $7F
	db !change_instr_pitch, $FD
	db !fine_tune, $FF
	db !set_instrument, $7F
	db $E0, $09
	db !set_instrument, $81
	db !change_instr_pitch, $FD
	db !fine_tune, $03
	db $E0, $07
	db !set_instrument, $82
	db !change_instr_pitch, $FC
	db !fine_tune, $09
	db $E0, $09
	db !set_instrument, $83
	db !change_instr_pitch, $FD
	db !fine_tune, $03
	db $E0, $07
	db !set_instrument, $80
	db !change_instr_pitch, $FD
	db !fine_tune, $EC
	db !set_instrument, $80
	db $E0, $09
	db !set_instrument, $81
	db !change_instr_pitch, $FD
	db !fine_tune, $03
	db $E0, $07
	db !set_instrument, $82
	db !change_instr_pitch, $FC
	db !fine_tune, $09
	db $E0, $09
	db !set_instrument, $83
	db !change_instr_pitch, $FD
	db !fine_tune, $03
	db $E0, $07
	db !return_from_sub

.subseq_154F:
	db !play_subsequence : dw .subseq_1575
	db !set_instrument, $80
	db !change_instr_pitch, $FD
	db !fine_tune, $F5
	db !set_instrument, $80
	db $E0, $09
	db !set_instrument, $81
	db !change_instr_pitch, $FD
	db !fine_tune, $0E
	db $E0, $07
	db !set_instrument, $82
	db !change_instr_pitch, $FC
	db !fine_tune, $14
	db $E0, $09
	db !set_instrument, $83
	db !change_instr_pitch, $FD
	db !fine_tune, $0E
	db $E0, $07
	db !return_from_sub

.subseq_1575:
	db !change_instr_pitch, $FC
	db !fine_tune, $14
	db !set_instrument, $84
	db $E0, $19
	db !set_instrument, $83
	db !change_instr_pitch, $FD
	db !fine_tune, $0E
	db $E0, $07
	db !return_from_sub

.subseq_1586:
	db !set_instrument, $7F
	db !change_instr_pitch, $FD
	db !fine_tune, $F4
	db !set_instrument, $7F
	db $E0, $09
	db !set_instrument, $81
	db !change_instr_pitch, $FD
	db !fine_tune, $0E
	db $E0, $07
	db !set_instrument, $82
	db !change_instr_pitch, $FC
	db !fine_tune, $14
	db $E0, $09
	db !set_instrument, $83
	db !change_instr_pitch, $FD
	db !fine_tune, $0E
	db $E0, $07
	db !set_instrument, $80
	db !change_instr_pitch, $FD
	db !fine_tune, $F5
	db !set_instrument, $80
	db $E0, $09
	db !set_instrument, $81
	db !change_instr_pitch, $FD
	db !fine_tune, $0E
	db $E0, $07
	db !set_instrument, $82
	db !change_instr_pitch, $FC
	db !fine_tune, $14
	db $E0, $09
	db !set_instrument, $83
	db !change_instr_pitch, $FD
	db !fine_tune, $0E
	db $E0, $07
	db !return_from_sub

.seq_15CB:
	db !play_subsequence : dw .subseq_134F
.loop_point_15CE:
	db !set_instrument, $7C
	db !change_instr_pitch, $03
	db !fine_tune, $02
	db !set_volume_l_and_r, $0F, $28
	db !set_adsr, $8F, $E0
	db $80, $10
	db $91, $18
	db $8C, $18
	db $8A, $10
	db $80, $B0
	db !set_instrument, $18
	db !change_instr_pitch, $FB
	db !fine_tune, $D4
	db !set_volume_l_and_r, $64, $64
	db !set_adsr, $8F, $EF
	db !pitch_slide_down, $14, $01, $1E, $16, $00
	db $96, $38
	db $80, $C8
	db !pitch_slide_off
	db !loop_subsequence, $04 : dw .subseq_1603
	db !jump_to_sequence : dw .loop_point_15CE
	db !end_sequence

.subseq_1603:
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $8F, $EF
	db !pitch_slide_down, $14, $01, $1E, $16, $00
	db $96, $39
	db !pitch_slide_off
	db !set_adsr, $8F, $F2
	db $96, $07
	db $96, $19
	db $80, $20
	db $96, $07
	db $96, $19
	db $80, $20
	db $96, $07
	db $96, $10
	db $96, $19
	db $94, $17
	db !set_volume_l_and_r, $64, $64
	db !set_adsr, $8F, $EF
	db $92, $21
	db $80, $18
	db !set_adsr, $8F, $F2
	db $92, $07
	db $92, $19
	db $80, $20
	db $92, $07
	db $8F, $10
	db $8F, $10
	db $91, $10
	db $91, $10
	db $92, $10
	db $92, $10
	db !set_volume_l_and_r, $50, $50
	db $94, $06
	db $80, $03
	db !set_volume_l_and_r, $28, $28
	db $A0, $04
	db $80, $03
	db !set_volume_l_and_r, $50, $50
	db $95, $10
	db !return_from_sub

.seq_165E:
	db !play_subsequence : dw .subseq_134F
.loop_point_1661:
	db !set_instrument, $85
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $28, $50
	db !set_adsr, $8F, $E0
	db $80, $20
	db !loop_subsequence, $28 : dw .subseq_1679
	db $80, $20
	db !jump_to_sequence : dw .loop_point_1661
	db !end_sequence

.subseq_1679:
	db !set_volume_l_and_r, $28, $50
	db $8E, $09
	db !set_volume_l_and_r, $14, $0A
	db $8E, $07
	db !set_volume_l_and_r, $08, $0A
	db $8E, $09
	db !set_volume_l_and_r, $05, $04
	db $8E, $27
	db !return_from_sub

.seq_168E:
	db !play_subsequence : dw .subseq_134F
.loop_point_1691:
	db !vibrato_off
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_instrument, $7A
	db !change_instr_pitch, $11
	db !fine_tune, $E8
	db !set_volume_l_and_r, $08, $18
	db !set_adsr, $DF, $55
	db $9B, $09
	db $9C, $07
	db $9D, $09
	db $A0, $10
	db $A0, $07
	db $9D, $09
	db $9C, $07
	db $A0, $10
	db $A0, $10
	db $A0, $09
	db $A2, $17
	db !set_instrument, $7C
	db !change_instr_pitch, $03
	db !fine_tune, $02
	db !set_volume_l_and_r, $21, $0B
	db !set_adsr, $8F, $E0
	db $80, $10
	db $94, $19
	db $91, $10
	db !set_instrument, $7A
	db !change_instr_pitch, $11
	db !fine_tune, $E8
	db !set_volume_l_and_r, $08, $18
	db !set_adsr, $DF, $55
	db $9D, $07
	db $A0, $10
	db $A0, $10
	db $A0, $09
	db $A2, $17
	db $80, $80
	db !set_instrument, $7A
	db !change_instr_pitch, $11
	db !fine_tune, $E8
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $DF, $55
	db $83, $10
	db $8F, $10
	db $85, $10
	db $91, $10
	db $86, $10
	db $92, $10
	db $94, $10
	db $95, $10
	db !set_instrument, $7C
	db !change_instr_pitch, $03
	db !fine_tune, $02
	db !set_volume_l_and_r, $21, $0B
	db !set_adsr, $8F, $E0
	db $80, $30
	db $94, $10
	db $96, $10
	db $80, $30
	db !set_instrument, $7A
	db !change_instr_pitch, $11
	db !fine_tune, $E8
	db !set_volume_l_and_r, $08, $18
	db !set_adsr, $DF, $55
	db $9B, $09
	db $9C, $07
	db $9D, $09
	db $A0, $10
	db $A0, $07
	db $9D, $09
	db $9C, $07
	db $A0, $10
	db $A0, $10
	db $A0, $09
	db $A2, $17
	db $80, $80
	db $9B, $09
	db $9C, $07
	db $9D, $09
	db $A0, $10
	db $A0, $07
	db $9D, $09
	db $9C, $07
	db $A0, $10
	db $A0, $10
	db $A0, $09
	db $A2, $17
	db !jump_to_sequence : dw .loop_point_1691
	db !end_sequence

.seq_1764:
	db !play_subsequence : dw .subseq_134F
.loop_point_1767:
	db !vibrato_off
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_instrument, $7A
	db !change_instr_pitch, $11
	db !fine_tune, $DD
	db !set_volume_l_and_r, $11, $0A
	db !set_adsr, $DF, $55
	db $80, $02
	db $9B, $09
	db $9C, $07
	db $9D, $09
	db $A0, $10
	db $A0, $07
	db $9D, $09
	db $9C, $07
	db $A0, $10
	db $A0, $10
	db $A0, $09
	db $A2, $17
	db $80, $39
	db $9D, $07
	db $A0, $10
	db $A0, $10
	db $A0, $09
	db $A2, $17
	db $80, $80
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $AF, $56
	db $83, $10
	db $8F, $10
	db $85, $10
	db $91, $10
	db $86, $10
	db $92, $10
	db $94, $10
	db $95, $10
	db !set_volume_l_and_r, $14, $0C
	db !set_adsr, $CF, $56
	db $80, $80
	db $9B, $09
	db $9C, $07
	db $9D, $09
	db $A0, $10
	db $A0, $07
	db $9D, $09
	db $9C, $07
	db $A0, $10
	db $A0, $10
	db $A0, $09
	db $A2, $17
	db $80, $80
	db $9B, $09
	db $9C, $07
	db $9D, $09
	db $A0, $10
	db $A0, $07
	db $9D, $09
	db $9C, $07
	db $A0, $10
	db $A0, $10
	db $A0, $09
	db $A2, $15
	db !jump_to_sequence : dw .loop_point_1767
	db !end_sequence

.seq_1802:
	db !play_subsequence : dw .subseq_134F
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $8F, $E0
	db $80, $02
.loop_point_180D:
	db !set_variable_note_1, $96
	db !play_subsequence : dw .subseq_14D3
	db !play_subsequence : dw .subseq_150A
	db !play_subsequence : dw .subseq_14D3
	db !play_subsequence : dw .subseq_150A
	db !play_subsequence : dw .subseq_14D3
	db !play_subsequence : dw .subseq_150A
	db !loop_subsequence, $02 : dw .subseq_150A
	db !play_subsequence : dw .subseq_14BA
	db !play_subsequence : dw .subseq_14B1
	db !play_subsequence : dw .subseq_14BA
	db !play_subsequence : dw .subseq_14B1
	db !play_subsequence : dw .subseq_14BA
	db !play_subsequence : dw .subseq_14B1
	db !play_subsequence : dw .subseq_14BA
	db !play_subsequence : dw .subseq_14B1
	db !jump_to_sequence : dw .loop_point_180D
	db !end_sequence

base off
arch 65816
.end: