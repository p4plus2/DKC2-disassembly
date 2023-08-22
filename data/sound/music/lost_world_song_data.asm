;1C Lost World Anthem
;32BAD2
lost_world_song_data:
	dw !bgm_loc, $026D
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1317, .seq_13C7, .seq_14D5, .seq_158D, .seq_1456, .seq_1719, .seq_16E3, .seq_1754
	db $BA, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.subseq_1314:
	db $80, $10
	db !return_from_sub

.seq_1317:
	db !echo_delay, $06
	db !loop_subsequence, $01 : dw .subseq_1314
	db !set_echo, $2A, $21, $21
	db !set_fir, $7F, $02, $01, $01, $01, $01, $01, $01
.loop_point_132A:
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0F, $0A
	db !set_adsr, $86, $E0
	db $94, $80
	db $93, $80
	db $94, $80
	db $93, $80
	db !set_instrument, $1D
	db !change_instr_pitch, $FF
	db !fine_tune, $F8
	db !echo_on
	db !set_volume_l_and_r, $19, $19
	db !set_adsr, $DF, $88
	db !set_variable_note_1, $A0
	db !loop_subsequence, $02 : dw .subseq_13AC
	db !set_variable_note_1, $9F
	db !loop_subsequence, $02 : dw .subseq_13AC
	db !set_variable_note_1, $A0
	db !loop_subsequence, $02 : dw .subseq_13AC
	db !set_variable_note_1, $9F
	db !loop_subsequence, $02 : dw .subseq_13AC
	db !set_variable_note_1, $A0
	db !loop_subsequence, $02 : dw .subseq_13AC
	db !set_variable_note_1, $9F
	db !loop_subsequence, $02 : dw .subseq_13AC
	db !set_variable_note_1, $95
	db !loop_subsequence, $04 : dw .subseq_1393
	db !jump_to_sequence : dw .loop_point_132A
	db !end_sequence

.unreached_137A:
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db !return_from_sub

.subseq_1393:
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db !return_from_sub

.subseq_13AC:
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $10
	db $E0, $08
	db $E0, $08
	db !return_from_sub

.seq_13C7:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_13CB:
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $E4
	db !fine_tune, $02
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $88, $E0
	db $88, $80
	db $87, $80
	db $88, $80
	db $87, $80
	db !echo_off
	db !set_instrument, $21
	db !change_instr_pitch, $00
	db !fine_tune, $A8
	db !set_volume_l_and_r, $41, $41
	db !set_adsr, $EE, $6E
	db !vibrato_with_delay, $02, $02, $0B, $03
	db !set_variable_note_1, $88
	db !loop_subsequence, $02 : dw .subseq_1445
	db !set_variable_note_1, $87
	db !loop_subsequence, $02 : dw .subseq_1445
	db !set_variable_note_1, $88
	db !loop_subsequence, $02 : dw .subseq_1445
	db !set_variable_note_1, $87
	db !loop_subsequence, $02 : dw .subseq_1445
	db !set_variable_note_1, $88
	db !loop_subsequence, $02 : dw .subseq_1445
	db !set_variable_note_1, $87
	db !loop_subsequence, $02 : dw .subseq_1445
	db !set_variable_note_1, $8C
	db !loop_subsequence, $01 : dw .subseq_1432
	db !set_variable_note_1, $8B
	db !loop_subsequence, $01 : dw .subseq_1432
	db !set_variable_note_1, $8C
	db !loop_subsequence, $01 : dw .subseq_1432
	db !set_variable_note_1, $8B
	db !loop_subsequence, $01 : dw .subseq_1432
	db !jump_to_sequence : dw .loop_point_13CB
	db !end_sequence

.subseq_1432:
	db $E0, $10
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $10
	db $E0, $10
	db !return_from_sub

.subseq_1445:
	db $E0, $10
	db $E0, $18
	db $E0, $10
	db $E0, $08
	db $E0, $10
	db $E0, $10
	db $E0, $10
	db $E0, $10
	db !return_from_sub

.seq_1456:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_145A:
	db !echo_on
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !loop_subsequence, $04 : dw .subseq_14C0
	db !loop_subsequence, $0C : dw .subseq_14C0
	db !loop_subsequence, $04 : dw .subseq_1474
	db !jump_to_sequence : dw .loop_point_145A
	db !end_sequence

.subseq_1474:
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $DF, $52
	db $9E, $10
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !set_volume_l_and_r, $2D, $19
	db $94, $18
	db !set_volume_l_and_r, $1E, $28
	db $96, $18
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $DF, $52
	db $9E, $10
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !set_volume_l_and_r, $2D, $19
	db $94, $20
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !set_volume_l_and_r, $1E, $28
	db $96, $10
	db !return_from_sub

.subseq_14C0:
	db !set_volume_l_and_r, $1E, $28
	db $99, $10
	db $96, $18
	db $96, $10
	db $96, $10
	db $96, $10
	db $9A, $18
	db !set_volume_l_and_r, $2D, $19
	db $94, $10
	db !return_from_sub

.seq_14D5:
	db !loop_subsequence, $01 : dw .subseq_1314
	db $80, $08
	db !echo_on
.loop_point_14DC:
	db !loop_subsequence, $04 : dw .subseq_1541
	db !loop_subsequence, $0C : dw .subseq_1541
	db !loop_subsequence, $04 : dw .subseq_14EC
	db !jump_to_sequence : dw .loop_point_14DC
	db !end_sequence

.subseq_14EC:
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !set_volume_l_and_r, $1E, $28
	db $96, $10
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $DF, $52
	db $9D, $20
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !set_volume_l_and_r, $1E, $28
	db $96, $10
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !set_volume_l_and_r, $1E, $28
	db $96, $18
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $DF, $52
	db $9F, $18
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !set_volume_l_and_r, $2D, $19
	db $94, $10
	db !return_from_sub

.subseq_1541:
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_adsr, $BF, $C8
	db !set_volume_l_and_r, $1E, $28
	db $96, $10
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $5A, $5A
	db !set_adsr, $DF, $52
	db $9E, $28
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $1E, $28
	db !set_adsr, $BF, $C8
	db $9A, $10
	db !set_volume_l_and_r, $2D, $19
	db $94, $10
	db !set_instrument, $90
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $50, $50
	db !set_adsr, $DF, $52
	db $A0, $18
	db !set_instrument, $A6
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $3C, $28
	db !set_adsr, $BF, $C8
	db $91, $10
	db !return_from_sub

.seq_158D:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_1591:
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0C, $0C
	db !set_adsr, $86, $E0
	db $9A, $80
	db $9A, $80
	db $9A, $80
	db $9A, $80
	db !set_instrument, $1D
	db !change_instr_pitch, $FF
	db !fine_tune, $F8
	db !echo_on
	db !set_volume_l_and_r, $19, $19
	db !set_adsr, $DF, $4B
	db !loop_subsequence, $02 : dw .subseq_16C8
	db !change_instr_pitch_rel, $FF
	db !loop_subsequence, $02 : dw .subseq_16C8
	db !change_instr_pitch_rel, $01
	db !set_instrument, $CE
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !set_volume_l_and_r, $14, $32
	db !vibrato_with_delay, $02, $04, $12, $0B
	db !loop_subsequence, $01 : dw .subseq_15DF
	db $80, $20
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !jump_to_sequence : dw .loop_point_1591
	db !end_sequence

.subseq_15DF:
	db !set_adsr, $8E, $E0
	db !set_instrument, $CE
	db $97, $08
	db !set_instrument, $CF
	db $94, $08
	db $9A, $08
	db !set_instrument, $CE
	db $9D, $28
	db $80, $10
	db $9A, $08
	db !set_instrument, $CF
	db $9D, $08
	db $A0, $20
	db $80, $10
	db !set_instrument, $CE
	db $9D, $08
	db !set_instrument, $CF
	db $A0, $08
	db !pitch_slide_up, $00, $01, $0B, $12, $00
	db $A0, $1E
	db $80, $02
	db !set_instrument, $CE
	db !pitch_slide_up, $01, $02, $0B, $12, $00
	db $A0, $18
	db !pitch_slide_up, $00, $01, $0B, $12, $00
	db $A0, $18
	db !set_instrument, $CF
	db !pitch_slide_down, $01, $01, $0B, $12, $00
	db $A2, $10
	db !pitch_slide_off
	db !set_instrument, $CE
	db $9F, $18
	db $9A, $38
	db $80, $10
	db $98, $10
	db !pitch_slide_up, $00, $01, $0B, $0C, $00
	db $98, $08
	db !pitch_slide_off
	db !set_instrument, $CF
	db $98, $08
	db !set_instrument, $CE
	db $97, $18
	db !set_adsr, $BE, $68
	db !pitch_slide_down, $15, $11, $08, $0F, $00
	db $A3, $68
	db !pitch_slide_off
	db !set_adsr, $8E, $E0
	db !set_instrument, $CE
	db $94, $08
	db !set_instrument, $CF
	db $97, $08
	db !set_instrument, $CE
	db $9A, $08
	db !set_instrument, $CF
	db $9D, $28
	db $80, $10
	db !set_instrument, $CE
	db $9A, $08
	db !set_instrument, $CF
	db $9D, $08
	db $A0, $20
	db $80, $10
	db !set_instrument, $CE
	db $9D, $08
	db !set_instrument, $CF
	db $A0, $08
	db !pitch_slide_up, $00, $01, $0B, $12, $00
	db $A0, $1E
	db $80, $02
	db !set_instrument, $CE
	db !pitch_slide_up, $01, $02, $0B, $12, $00
	db $A0, $18
	db !pitch_slide_up, $00, $01, $0B, $12, $00
	db $A0, $18
	db !set_instrument, $CF
	db !pitch_slide_down, $01, $01, $0B, $12, $00
	db $A2, $10
	db !pitch_slide_off
	db !set_instrument, $CE
	db $9F, $18
	db !set_adsr, $8E, $60
	db $A6, $38
	db $80, $10
	db $A4, $10
	db !set_instrument, $CF
	db !pitch_slide_up, $00, $01, $0B, $16, $00
	db $A4, $08
	db !pitch_slide_off
	db $A4, $08
	db !set_instrument, $CE
	db $A3, $18
	db !set_adsr, $8E, $C0
	db !set_instrument, $CF
	db $9F, $48
	db !return_from_sub

.subseq_16C8:
	db $94, $08
	db $94, $08
	db $94, $08
	db $94, $10
	db $94, $10
	db $94, $08
	db $94, $08
	db $94, $08
	db $94, $08
	db $94, $08
	db $94, $10
	db $94, $08
	db $94, $08
	db !return_from_sub

.seq_16E3:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_16E7:
	db !echo_on
	db !set_instrument, $14
	db !change_instr_pitch, $FC
	db !fine_tune, $02
	db !set_volume_l_and_r, $0A, $0F
	db !set_adsr, $86, $E0
	db $9D, $80
	db $9D, $80
	db $9D, $80
	db $9D, $80
	db !set_instrument, $1D
	db !change_instr_pitch, $FF
	db !fine_tune, $F8
	db !echo_on
	db !set_volume_l_and_r, $19, $19
	db !set_adsr, $DF, $4B
	db !set_variable_note_1, $9D
	db !loop_subsequence, $0C : dw .subseq_13AC
	db !set_variable_note_1, $9E
	db !loop_subsequence, $04 : dw .subseq_1393
	db !jump_to_sequence : dw .loop_point_16E7
	db !end_sequence

.seq_1719:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_171D:
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_instrument, $1D
	db !change_instr_pitch, $FF
	db !fine_tune, $F8
	db !echo_on
	db !set_volume_l_and_r, $19, $19
	db !set_adsr, $DF, $4B
	db !set_variable_note_1, $9A
	db !loop_subsequence, $0C : dw .subseq_13AC
	db !set_variable_note_1, $98
	db !loop_subsequence, $01 : dw .subseq_1393
	db !set_variable_note_1, $97
	db !loop_subsequence, $01 : dw .subseq_1393
	db !set_variable_note_1, $98
	db !loop_subsequence, $01 : dw .subseq_1393
	db !set_variable_note_1, $97
	db !loop_subsequence, $01 : dw .subseq_1393
	db !jump_to_sequence : dw .loop_point_171D
	db !end_sequence

.seq_1754:
	db !loop_subsequence, $01 : dw .subseq_1314
.loop_point_1758:
	db $80, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !set_instrument, $00
	db !set_vol_single_val, $32
	db !set_adsr, $8F, $E0
	db !change_instr_pitch, $08
	db !fine_tune, $00
	db !loop_subsequence, $04 : dw .subseq_17CE
	db !echo_on
	db !set_instrument, $CE
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !set_volume_l_and_r, $1E, $08
	db !set_adsr, $8E, $E0
	db $80, $17
	db !vibrato_with_delay, $03, $04, $13, $0B
	db !loop_subsequence, $01 : dw .subseq_15DF
	db $80, $07
	db !echo_on
	db !set_instrument, $BF
	db !change_instr_pitch, $F1
	db !fine_tune, $F0
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $04 : dw .subseq_17A0
	db $80, $02
	db !jump_to_sequence : dw .loop_point_1758
	db !end_sequence

.subseq_17A0:
	db !set_volume_l_and_r, $32, $1E
	db $95, $10
	db !set_volume_l_and_r, $0A, $14
	db $95, $08
	db !set_volume_l_and_r, $32, $1E
	db $95, $10
	db !set_volume_l_and_r, $0A, $14
	db $95, $10
	db !set_volume_l_and_r, $0B, $06
	db $95, $08
	db !set_volume_l_and_r, $32, $1E
	db $95, $10
	db !set_volume_l_and_r, $0A, $14
	db $95, $10
	db !set_volume_l_and_r, $32, $1E
	db $95, $10
	db !set_volume_l_and_r, $0A, $14
	db $95, $10
	db !return_from_sub

.subseq_17CE:
	db $8D, $10
	db $8D, $18
	db $8D, $10
	db $8A, $08
	db $8D, $40
	db !return_from_sub

base off
arch 65816
.end: