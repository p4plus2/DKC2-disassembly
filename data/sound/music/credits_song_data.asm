;1E Donkey Kong Rescued
;32CFE4
credits_song_data:
	dw !bgm_loc, $0332
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1337, .seq_13D3, .seq_15CB, .seq_14F7, .seq_1431, .seq_1826, .seq_188B, .seq_1492
	db $6A, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.subseq_1314:
	db $80, $10
	db !echo_off
	db !return_from_sub

.subseq_1318:
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !set_adsr, $8C, $EB
	db !set_volume_l_and_r, $19, $23
	db !return_from_sub

.subseq_1325:
	db !set_instrument, $C0
	db !change_instr_pitch, $F0
	db !fine_tune, $18
	db !set_adsr, $8C, $E1
	db !vibrato_with_delay, $02, $01, $03, $05
	db !set_volume_l_and_r, $19, $23
	db !return_from_sub

.seq_1337:
	db !echo_delay, $08
	db !play_subsequence : dw .subseq_1314
	db !set_echo, $37, $21, $21
	db !set_fir, $7F, $01, $00, $00, $00, $00, $00, $00
	db $80, $08
.loop_point_134B:
	db $80, $80
	db $80, $78
	db !play_subsequence : dw .subseq_1318
	db $A2, $18
	db $A2, $28
	db $A0, $18
	db $A0, $28
	db $9E, $18
	db $A0, $28
	db $A2, $30
	db !set_vol_single_val, $7E
	db !set_adsr, $88, $E0
	db !change_instr_pitch_rel, $F4
	db !long_duration_on
	db $83, $01, $10
	db !long_duration_off
	db !change_instr_pitch, $00
	db $80, $08
	db !loop_subsequence, $01 : dw .subseq_13AF
	db !loop_subsequence, $02 : dw .subseq_138F
	db !loop_subsequence, $01 : dw .subseq_13AF
	db !loop_subsequence, $07 : dw .subseq_138F
	db !loop_subsequence, $01 : dw .subseq_13AF
	db !loop_subsequence, $07 : dw .subseq_138F
	db !loop_subsequence, $01 : dw .subseq_13AF
	db !jump_to_sequence : dw .loop_point_134B

.subseq_138F:
	db !set_instrument, $A6
	db !set_adsr, $FF, $E8
	db !set_volume_l_and_r, $32, $46
	db $9A, $08
	db $98, $08
	db !set_volume_l_and_r, $5A, $3C
	db $94, $10
	db !set_volume_l_and_r, $14, $1E
	db $94, $08
	db !set_instrument, $90
	db !set_vol_single_val, $7E
	db !set_adsr, $DF, $51
	db $9A, $18
	db !return_from_sub

.subseq_13AF:
	db !set_instrument, $A6
	db !set_adsr, $FF, $E8
	db !set_volume_l_and_r, $32, $46
	db $9A, $08
	db $98, $08
	db !set_volume_l_and_r, $5A, $3C
	db $94, $08
	db !set_volume_l_and_r, $1E, $2D
	db $94, $08
	db !set_vol_single_val, $58
	db $8C, $08
	db !set_instrument, $90
	db !set_vol_single_val, $7E
	db !set_adsr, $DF, $51
	db $9A, $18
	db !return_from_sub

.seq_13D3:
	db !play_subsequence : dw .subseq_1314
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A6
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $EE
.loop_point_13E1:
	db !loop_subsequence, $0C : dw .subseq_1428
	db !set_variable_note_1, $8F
	db !loop_subsequence, $04 : dw .subseq_140B
	db !loop_subsequence, $02 : dw .subseq_13F8
	db !set_variable_note_1, $8F
	db !loop_subsequence, $08 : dw .subseq_140B
	db !jump_to_sequence : dw .loop_point_13E1

.subseq_13F8:
	db !set_variable_note_1, $8B
	db !loop_subsequence, $01 : dw .subseq_140B
	db !set_variable_note_1, $8D
	db !loop_subsequence, $01 : dw .subseq_140B
	db !set_variable_note_1, $8F
	db !loop_subsequence, $02 : dw .subseq_140B
	db !return_from_sub

.subseq_140B:
	db !set_adsr, $FF, $EE
	db $E0, $08
	db !set_adsr, $FF, $8E
	db $E0, $08
	db $E0, $08
	db !set_adsr, $FF, $EE
	db $E0, $08
	db !set_adsr, $FF, $8E
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db $E0, $08
	db !return_from_sub

.subseq_1428:
	db $8F, $10
	db $80, $08
	db $8F, $10
	db $80, $18
	db !return_from_sub

.seq_1431:
	db !play_subsequence : dw .subseq_1314
	db !set_instrument, $2E
	db !set_volume_l_and_r, $0F, $19
.loop_point_1439:
	db !loop_subsequence, $08 : dw .subseq_1475
	db !loop_subsequence, $04 : dw .subseq_1450
	db !loop_subsequence, $04 : dw .subseq_1450
	db !loop_subsequence, $08 : dw .subseq_1450
	db !loop_subsequence, $08 : dw .subseq_1450
	db !jump_to_sequence : dw .loop_point_1439

.subseq_1450:
	db !loop_subsequence, $02 : dw .subseq_145F
	db !set_adsr, $CE, $91
	db $9E, $08
	db !set_adsr, $CE, $55
	db $9E, $08
	db !return_from_sub

.subseq_145F:
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db $96, $08
	db !set_instrument, $2E
	db !set_volume_l_and_r, $0F, $19
	db !set_adsr, $CE, $55
	db $9E, $08
	db $9E, $08
	db !return_from_sub

.subseq_1475:
	db !set_adsr, $CE, $91
	db $9E, $08
	db !set_adsr, $CE, $55
	db $9E, $08
	db $9E, $08
	db !set_adsr, $CE, $91
	db $9E, $08
	db !set_adsr, $CE, $55
	db $9E, $08
	db $9E, $08
	db $9E, $08
	db $9E, $08
	db !return_from_sub

.seq_1492:
	db !play_subsequence : dw .subseq_1314
.loop_point_1495:
	db !set_instrument, $34
	db !change_instr_pitch, $03
	db !fine_tune, $02
	db !set_adsr, $AE, $80
	db !echo_on
	db !set_volume_l_and_r, $17, $11
	db !loop_subsequence, $60 : dw .subseq_14F4
	db !set_volume_l_and_r, $14, $0C
	db !loop_subsequence, $08 : dw .subseq_14F4
	db !set_volume_l_and_r, $08, $0F
	db !loop_subsequence, $08 : dw .subseq_14F4
	db !set_volume_l_and_r, $0A, $04
	db !loop_subsequence, $08 : dw .subseq_14F4
	db !set_volume_l_and_r, $02, $05
	db !loop_subsequence, $08 : dw .subseq_14F4
	db !echo_on
	db !play_subsequence : dw .subseq_1325
	db $9B, $40
	db $9D, $40
	db $9F, $80
	db $9B, $40
	db $9D, $40
	db $9F, $80
	db !play_subsequence : dw .subseq_1318
	db $A2, $18
	db $A2, $28
	db $A0, $18
	db $A0, $28
	db $9E, $18
	db $A0, $28
	db $A2, $40
	db $A2, $18
	db $A2, $28
	db $A0, $18
	db $A0, $28
	db $9E, $18
	db $A0, $28
	db $A2, $40
	db !jump_to_sequence : dw .loop_point_1495

.subseq_14F4:
	db $8F, $08
	db !return_from_sub

.seq_14F7:
	db !play_subsequence : dw .subseq_1314
.loop_point_14FA:
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1318
	db $9F, $18
	db $9E, $28
	db $9D, $18
	db $9B, $28
	db $9B, $18
	db $9D, $28
	db $9F, $40
	db !echo_on
	db !change_instr_pitch, $F9
	db !fine_tune, $E8
	db !loop_subsequence, $02 : dw .subseq_154A
	db !echo_on
	db !play_subsequence : dw .subseq_1325
	db $97, $40
	db $99, $40
	db $9B, $80
	db $97, $40
	db $99, $40
	db $9B, $80
	db !play_subsequence : dw .subseq_1318
	db $9F, $18
	db $9E, $28
	db $9D, $18
	db $9B, $28
	db $9B, $18
	db $9D, $28
	db $9F, $40
	db $9F, $18
	db $9E, $28
	db $9D, $18
	db $9B, $28
	db $9B, $18
	db $9D, $28
	db $9F, $40
	db !jump_to_sequence : dw .loop_point_14FA

.subseq_154A:
	db !set_instrument, $5A
	db $83, $08
	db !set_instrument, $5C
	db $83, $08
	db !set_instrument, $5E
	db $83, $08
	db !set_instrument, $60
	db $83, $08
	db !set_instrument, $62
	db $83, $08
	db !set_instrument, $64
	db $83, $08
	db !set_instrument, $66
	db $83, $08
	db !set_instrument, $68
	db $83, $08
	db !set_instrument, $6A
	db $83, $08
	db !set_instrument, $6C
	db $83, $08
	db !set_instrument, $6E
	db $83, $08
	db !set_instrument, $70
	db $83, $08
	db !set_instrument, $72
	db $83, $08
	db !set_instrument, $74
	db $83, $08
	db !set_instrument, $76
	db $83, $08
	db !set_instrument, $78
	db $83, $08
	db !set_instrument, $78
	db $83, $08
	db !set_instrument, $76
	db $83, $08
	db !set_instrument, $74
	db $83, $08
	db !set_instrument, $72
	db $83, $08
	db !set_instrument, $70
	db $83, $08
	db !set_instrument, $6E
	db $83, $08
	db !set_instrument, $6C
	db $83, $08
	db !set_instrument, $6A
	db $83, $08
	db !set_instrument, $6A
	db $83, $08
	db !set_instrument, $68
	db $83, $08
	db !set_instrument, $66
	db $83, $08
	db !set_instrument, $64
	db $83, $08
	db !set_instrument, $62
	db $83, $08
	db !set_instrument, $60
	db $83, $08
	db !set_instrument, $5E
	db $83, $08
	db !set_instrument, $5C
	db $83, $08
	db !end_sequence

.seq_15CB:
	db !play_subsequence : dw .subseq_1314
.loop_point_15CE:
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !set_adsr, $8D, $E0
	db !set_volume_l_and_r, $10, $0C
	db !play_subsequence : dw .subseq_16E5
	db !set_volume_l_and_r, $09, $0C
	db !play_subsequence : dw .subseq_16E5
	db !set_volume_l_and_r, $08, $06
	db !play_subsequence : dw .subseq_16E5
	db !set_volume_l_and_r, $04, $06
	db !play_subsequence : dw .subseq_16E5
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $2D, $15
	db !fine_tune, $EA
	db !vibrato_with_delay, $02, $02, $03, $06
	db !play_subsequence : dw .subseq_16BB
	db !set_volume_l_and_r, $0A, $1E
	db !play_subsequence : dw .subseq_16A1
	db !set_volume_l_and_r, $2D, $15
	db !fine_tune, $EA
	db !play_subsequence : dw .subseq_167F
	db !set_volume_l_and_r, $0A, $1E
	db !play_subsequence : dw .subseq_16A1
	db !set_volume_l_and_r, $17, $26
	db !loop_subsequence, $01 : dw .subseq_162D
	db $99, $08
	db $9B, $40
	db !loop_subsequence, $01 : dw .subseq_162D
	db $A5, $08
	db !pitch_slide_up, $00, $03, $04, $40, $00
	db $A5, $40
	db !pitch_slide_off
	db !jump_to_sequence : dw .loop_point_15CE

.subseq_162D:
	db !vibrato_with_delay, $02, $04, $12, $0B
	db !set_instrument, $CE
	db !change_instr_pitch, $F5
	db !fine_tune, $F2
	db !set_volume_l_and_r, $14, $1E
	db !set_adsr, $8F, $E0
	db !pitch_slide_up, $00, $01, $04, $32, $00
	db $80, $08
	db $A0, $08
	db !set_adsr, $8E, $E0
	db !set_instrument, $CF
	db $A0, $08
	db $A0, $08
	db !set_instrument, $CE
	db $A0, $18
	db !pitch_slide_off
	db $A0, $04
	db !set_instrument, $CF
	db $9E, $04
	db !pitch_slide_up, $00, $01, $03, $3A, $00
	db $9E, $18
	db !pitch_slide_off
	db $A0, $04
	db $9E, $04
	db !set_instrument, $CE
	db !pitch_slide_up, $00, $02, $03, $3A, $00
	db $9E, $18
	db !pitch_slide_off
	db $9E, $08
	db $9E, $0C
	db $A0, $0C
	db $A2, $08
	db $9D, $18
	db !return_from_sub

.subseq_167F:
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !set_adsr, $DF, $8B
	db $9E, $0C
	db $9D, $0C
	db $9B, $08
	db $9B, $18
	db $9B, $04
	db $9D, $04
	db $9E, $0C
	db $A0, $0C
	db $9E, $08
	db $A0, $10
	db $9E, $08
	db $A0, $08
	db $A2, $40
	db !return_from_sub

.subseq_16A1:
	db !set_instrument, $8E
	db !change_instr_pitch, $01
	db !fine_tune, $F2
	db !set_adsr, $DF, $32
	db $AB, $08
	db $AC, $08
	db $AB, $08
	db $A7, $08
	db $9F, $08
	db $A0, $08
	db $A2, $08
	db $A7, $08
	db !return_from_sub

.subseq_16BB:
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !set_adsr, $DF, $8B
	db $9E, $0C
	db $9D, $0C
	db $9B, $08
	db $9B, $18
	db $9B, $04
	db $9D, $04
	db $9E, $0C
	db $9D, $0C
	db $9B, $08
	db $9D, $0C
	db $9E, $0C
	db $A2, $08
	db $A2, $17
	db $9F, $03
	db $A0, $03
	db $9F, $03
	db $9B, $20
	db !return_from_sub

.subseq_16E5:
	db !set_instrument, $4F
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $4E
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $4D
	db !pitch_slide_up, $00, $01, $0B, $78, $00
	db $A5, $08
	db !set_instrument, $4C
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $4B
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $4A
	db !pitch_slide_up, $00, $01, $0B, $78, $00
	db $A5, $08
	db !set_instrument, $49
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $48
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $47
	db !pitch_slide_up, $00, $01, $0B, $78, $00
	db $A5, $08
	db !set_instrument, $3F
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $3D
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $3B
	db !pitch_slide_up, $00, $01, $0B, $78, $00
	db $A5, $08
	db !set_instrument, $39
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $3B
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $3D
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $3F
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $41
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $45
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $43
	db !pitch_slide_up, $00, $01, $0B, $78, $00
	db $A5, $08
	db !set_instrument, $45
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $47
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $48
	db !pitch_slide_up, $00, $01, $0B, $78, $00
	db $A5, $08
	db !set_instrument, $49
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $48
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $47
	db !pitch_slide_up, $00, $01, $0B, $78, $00
	db $A5, $08
	db !set_instrument, $48
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $49
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $4A
	db !pitch_slide_up, $00, $01, $0B, $78, $00
	db $A5, $08
	db !set_instrument, $4B
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $4C
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !set_instrument, $4D
	db !pitch_slide_down, $00, $01, $05, $6E, $00
	db $98, $08
	db !set_instrument, $4E
	db !pitch_slide_up, $00, $01, $06, $6C, $00
	db $99, $08
	db !return_from_sub

.seq_1826:
	db !play_subsequence : dw .subseq_1314
	db $80, $0E
.loop_point_182B:
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !set_adsr, $8D, $E0
	db !echo_on
	db !set_volume_l_and_r, $04, $08
	db !play_subsequence : dw .subseq_16E5
	db !set_volume_l_and_r, $06, $03
	db !play_subsequence : dw .subseq_16E5
	db !set_volume_l_and_r, $02, $04
	db !play_subsequence : dw .subseq_16E5
	db !set_volume_l_and_r, $03, $01
	db !play_subsequence : dw .subseq_16E5
	db !pitch_slide_off
	db !echo_on
	db !set_volume_l_and_r, $07, $0F
	db !fine_tune, $DF
	db !vibrato_with_delay, $03, $01, $03, $06
	db !play_subsequence : dw .subseq_16BB
	db !set_volume_l_and_r, $0B, $07
	db !play_subsequence : dw .subseq_16A1
	db !set_volume_l_and_r, $07, $0F
	db !fine_tune, $DF
	db !play_subsequence : dw .subseq_167F
	db !set_volume_l_and_r, $0B, $07
	db !play_subsequence : dw .subseq_16A1
	db !set_volume_l_and_r, $0F, $08
	db !loop_subsequence, $01 : dw .subseq_162D
	db $99, $08
	db $9B, $40
	db !loop_subsequence, $01 : dw .subseq_162D
	db $A5, $08
	db !pitch_slide_up, $00, $03, $04, $40, $00
	db $A5, $40
	db !pitch_slide_off
	db !jump_to_sequence : dw .loop_point_182B

.seq_188B:
	db !play_subsequence : dw .subseq_1314
.loop_point_188E:
	db $80, $80
	db $80, $80
	db !play_subsequence : dw .subseq_1318
	db $9B, $18
	db $99, $28
	db $99, $18
	db $98, $28
	db $97, $18
	db $99, $28
	db $9B, $40
	db !change_instr_pitch, $F9
	db !fine_tune, $E8
	db !echo_on
	db !loop_subsequence, $02 : dw .subseq_18E0
	db !echo_on
	db !play_subsequence : dw .subseq_1325
	db !change_instr_pitch_rel, $0C
	db $92, $40
	db $94, $40
	db $96, $80
	db $92, $40
	db $94, $40
	db $96, $80
	db !play_subsequence : dw .subseq_1318
	db $9B, $18
	db $99, $28
	db $99, $18
	db $98, $28
	db $97, $18
	db $99, $28
	db $9B, $40
	db $9B, $18
	db $99, $28
	db $99, $18
	db $98, $28
	db $97, $18
	db $99, $28
	db $9B, $40
	db !jump_to_sequence : dw .loop_point_188E

.subseq_18E0:
	db $80, $04
	db !set_instrument, $5B
	db $83, $08
	db !set_instrument, $5D
	db $83, $08
	db !set_instrument, $5F
	db $83, $08
	db !set_instrument, $61
	db $83, $08
	db !set_instrument, $63
	db $83, $08
	db !set_instrument, $65
	db $83, $08
	db !set_instrument, $67
	db $83, $08
	db !set_instrument, $69
	db $83, $08
	db !set_instrument, $6B
	db $83, $08
	db !set_instrument, $6D
	db $83, $08
	db !set_instrument, $6F
	db $83, $08
	db !set_instrument, $71
	db $83, $08
	db !set_instrument, $71
	db $83, $08
	db !set_instrument, $73
	db $83, $08
	db !set_instrument, $75
	db $83, $08
	db !set_instrument, $77
	db $83, $08
	db !set_instrument, $79
	db $83, $08
	db !set_instrument, $77
	db $83, $08
	db !set_instrument, $75
	db $83, $08
	db !set_instrument, $73
	db $83, $08
	db !set_instrument, $71
	db $83, $08
	db !set_instrument, $6F
	db $83, $08
	db !set_instrument, $6D
	db $83, $08
	db !set_instrument, $6B
	db $83, $08
	db !set_instrument, $6B
	db $83, $08
	db !set_instrument, $69
	db $83, $08
	db !set_instrument, $67
	db $83, $08
	db !set_instrument, $65
	db $83, $08
	db !set_instrument, $63
	db $83, $08
	db !set_instrument, $61
	db $83, $08
	db !set_instrument, $5F
	db $83, $08
	db !set_instrument, $5D
	db $83, $04
	db !return_from_sub

base off
arch 65816
.end: