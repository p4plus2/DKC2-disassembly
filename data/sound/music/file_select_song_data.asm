;18 Steel Drum Rhumba
;3290D1
file_select_song_data:
	dw !bgm_loc, $02C0
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1315, .seq_162B, .seq_174B, .seq_1581, .seq_13E4, .seq_1438, .seq_14F3, .seq_17EE
	db $CE, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.unreached_1314:
	db !end_sequence

.seq_1315:
	db !set_echo, $3A, $23, $23
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
	db !set_instrument, $0C
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $01 : dw .subseq_1393
.loop_point_1332:
	db !loop_subsequence, $07 : dw .subseq_1393
	db !loop_subsequence, $01 : dw .subseq_1393
	db !loop_subsequence, $02 : dw .subseq_1393
	db !loop_subsequence, $07 : dw .subseq_1393
	db !loop_subsequence, $01 : dw .subseq_1393
	db !jump_to_sequence : dw .loop_point_1332
	db !end_sequence

.unreached_134A:
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $05, $09
	db $96, $08
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $05, $09
	db $96, $08
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $05, $09
	db $96, $08
	db !set_volume_l_and_r, $05, $02
	db $96, $08
	db !return_from_sub

.subseq_1393:
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $05, $09
	db $96, $08
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $05, $09
	db $96, $08
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $05, $09
	db $96, $08
	db !set_volume_l_and_r, $05, $02
	db $96, $08
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $1E, $32
	db $96, $08
	db !set_volume_l_and_r, $10, $0A
	db $96, $08
	db !set_volume_l_and_r, $05, $09
	db $96, $08
	db !set_volume_l_and_r, $05, $02
	db $96, $08
	db !return_from_sub

.seq_13E4:
	db !set_instrument, $17
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $0A, $28
	db !pitch_slide_up, $00, $01, $16, $16, $02
	db !loop_subsequence, $01 : dw .subseq_140F
.loop_point_13F7:
	db !loop_subsequence, $1C : dw .subseq_142B
	db !loop_subsequence, $01 : dw .subseq_140F
	db !loop_subsequence, $08 : dw .subseq_142B
	db !loop_subsequence, $1C : dw .subseq_142B
	db !loop_subsequence, $01 : dw .subseq_140F
	db !jump_to_sequence : dw .loop_point_13F7
	db !end_sequence

.subseq_140F:
	db !loop_subsequence, $01 : dw .subseq_142B
	db !set_adsr, $8F, $F5
	db $99, $10
	db !set_adsr, $AF, $BD
	db $9A, $08
	db $98, $10
	db $98, $10
	db $9A, $08
	db $98, $10
	db !set_adsr, $8F, $F5
	db $99, $10
	db !return_from_sub

.subseq_142B:
	db !set_adsr, $8F, $F5
	db $99, $10
	db !set_adsr, $AF, $BD
	db $9A, $08
	db $98, $08
	db !return_from_sub

.seq_1438:
	db !set_instrument, $0D
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $0C, $06
	db !set_adsr, $8F, $E0
	db !loop_subsequence, $01 : dw .subseq_1460
.loop_point_1448:
	db !loop_subsequence, $07 : dw .subseq_14AB
	db !loop_subsequence, $01 : dw .subseq_1460
	db !loop_subsequence, $02 : dw .subseq_14AB
	db !loop_subsequence, $07 : dw .subseq_14AB
	db !loop_subsequence, $01 : dw .subseq_1460
	db !jump_to_sequence : dw .loop_point_1448
	db !end_sequence

.subseq_1460:
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $02, $01
	db $99, $08
	db !set_volume_l_and_r, $00, $01
	db $99, $08
	db !return_from_sub

.subseq_14AB:
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db $99, $08
	db !set_volume_l_and_r, $02, $04
	db $99, $08
	db !set_volume_l_and_r, $0C, $06
	db $99, $08
	db !return_from_sub

.seq_14F3:
	db !set_instrument, $19
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $0B, $16
	db !loop_subsequence, $01 : dw .subseq_1518
.loop_point_1500:
	db !loop_subsequence, $07 : dw .subseq_1545
	db !loop_subsequence, $01 : dw .subseq_1518
	db !loop_subsequence, $02 : dw .subseq_1545
	db !loop_subsequence, $07 : dw .subseq_1545
	db !loop_subsequence, $01 : dw .subseq_1518
	db !jump_to_sequence : dw .loop_point_1500
	db !end_sequence

.subseq_1518:
	db !set_adsr, $AF, $9C
	db $96, $08
	db $96, $08
	db !set_adsr, $8A, $E0
	db $91, $08
	db !set_adsr, $AF, $9C
	db $91, $08
	db $96, $08
	db $96, $08
	db !set_adsr, $8F, $80
	db $91, $08
	db !set_adsr, $AF, $9C
	db $91, $10
	db $91, $10
	db !set_adsr, $8F, $80
	db $96, $08
	db $96, $10
	db $91, $08
	db $91, $08
	db !return_from_sub

.subseq_1545:
	db !set_adsr, $AF, $9C
	db $96, $08
	db $96, $08
	db !set_adsr, $8A, $E0
	db $91, $08
	db !set_adsr, $AF, $9C
	db $91, $08
	db $96, $08
	db $96, $08
	db !set_adsr, $8F, $80
	db $91, $08
	db $91, $08
	db !set_adsr, $AF, $9C
	db $96, $08
	db $96, $08
	db !set_adsr, $8A, $E0
	db $91, $08
	db !set_adsr, $8F, $80
	db $91, $08
	db $91, $08
	db !set_adsr, $AF, $9C
	db $96, $08
	db !set_adsr, $8F, $80
	db $91, $08
	db $91, $08
	db !return_from_sub

.seq_1581:
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_volume_l_and_r, $50, $50
	db !set_adsr, $AE, $B4
	db !loop_subsequence, $01 : dw .subseq_15A9
.loop_point_1591:
	db !loop_subsequence, $01 : dw .subseq_15BA
	db !loop_subsequence, $01 : dw .subseq_15A9
	db $80, $80
	db $80, $80
	db !loop_subsequence, $01 : dw .subseq_15BA
	db !loop_subsequence, $01 : dw .subseq_15A9
	db !jump_to_sequence : dw .loop_point_1591
	db !end_sequence

.subseq_15A9:
	db $86, $18
	db $8D, $08
	db $8D, $18
	db $86, $10
	db $86, $10
	db $86, $08
	db $86, $10
	db $81, $10
	db !return_from_sub

.subseq_15BA:
	db $86, $18
	db $8D, $08
	db $8D, $18
	db $86, $10
	db $86, $10
	db $8D, $08
	db $8D, $10
	db $86, $10
	db $8B, $18
	db $86, $08
	db $86, $18
	db $8B, $10
	db $8B, $10
	db $86, $08
	db $86, $10
	db $86, $10
	db $88, $18
	db $8F, $08
	db $8F, $18
	db $88, $10
	db $88, $10
	db $8F, $08
	db $8F, $10
	db $88, $10
	db $8D, $18
	db $88, $08
	db $88, $18
	db $8D, $10
	db $8D, $10
	db $88, $08
	db $8D, $10
	db $8B, $10
	db $8A, $18
	db $85, $08
	db $85, $18
	db $8A, $10
	db $8A, $10
	db $85, $08
	db $85, $10
	db $8A, $10
	db $8B, $18
	db $86, $08
	db $86, $18
	db $8B, $10
	db $8B, $10
	db $86, $08
	db $86, $10
	db $8B, $10
	db $86, $18
	db $8D, $08
	db $8D, $18
	db $8D, $10
	db $8D, $10
	db $88, $08
	db $8D, $10
	db $8D, $10
	db !return_from_sub

.seq_162B:
	db $80, $80
.loop_point_162D:
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $3C, $64
	db !set_adsr, $EF, $21
	db !echo_on
	db !vibrato_with_delay, $02, $02, $0B, $05
	db !loop_subsequence, $01 : dw .subseq_16C8
	db $80, $A0
	db !set_instrument, $28
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_adsr, $AF, $D1
	db !loop_subsequence, $01 : dw .subseq_1656
	db !jump_to_sequence : dw .loop_point_162D
	db !end_sequence

.subseq_1656:
	db !set_variable_note_1, $A3
	db !set_variable_note_2, $A2
	db !loop_subsequence, $01 : dw .subseq_1699
	db !set_variable_note_1, $A0
	db !set_variable_note_2, $9E
	db !loop_subsequence, $01 : dw .subseq_1699
	db !set_variable_note_1, $A3
	db !set_variable_note_2, $A3
	db !loop_subsequence, $01 : dw .subseq_1699
	db !set_variable_note_1, $A3
	db !set_variable_note_2, $A5
	db !loop_subsequence, $01 : dw .subseq_1699
	db !set_variable_note_1, $A5
	db !set_variable_note_2, $A5
	db !loop_subsequence, $01 : dw .subseq_1699
	db !set_variable_note_1, $A5
	db !set_variable_note_2, $A7
	db !loop_subsequence, $01 : dw .subseq_1699
	db !set_variable_note_1, $A3
	db !set_variable_note_2, $A2
	db !loop_subsequence, $01 : dw .subseq_1699
	db !set_variable_note_1, $A0
	db !set_variable_note_2, $9E
	db !loop_subsequence, $01 : dw .subseq_1699
	db $80, $20
	db !return_from_sub

.subseq_1699:
	db !set_volume_l_and_r, $20, $18
	db $E0, $10
	db $E0, $10
	db $E0, $08
	db !set_volume_l_and_r, $16, $0E
	db $E0, $08
	db $E0, $08
	db !set_volume_l_and_r, $20, $18
	db $E1, $08
	db !set_volume_l_and_r, $16, $0E
	db $E1, $08
	db $E1, $08
	db $E1, $08
	db !set_volume_l_and_r, $0C, $06
	db $E1, $08
	db $E1, $08
	db $E1, $08
	db !set_volume_l_and_r, $08, $02
	db $E1, $08
	db $E1, $08
	db !return_from_sub

.subseq_16C8:
	db $96, $18
	db $92, $08
	db $80, $10
	db $96, $18
	db $92, $08
	db $80, $10
	db $96, $10
	db $92, $0C
	db $80, $02
	db $93, $02
	db $94, $18
	db $92, $10
	db $80, $07
	db $8F, $19
	db $80, $38
	db $97, $18
	db $94, $08
	db $80, $10
	db $97, $18
	db $94, $08
	db $80, $10
	db $96, $10
	db $97, $0C
	db $80, $04
	db $99, $1E
	db $80, $02
	db $97, $0C
	db $80, $04
	db $96, $20
	db $80, $10
	db $97, $10
	db $96, $10
	db $99, $18
	db $96, $08
	db $80, $10
	db $99, $18
	db $96, $08
	db $80, $10
	db $97, $10
	db $99, $0C
	db $80, $04
	db $9B, $18
	db $9D, $10
	db $80, $08
	db $9E, $10
	db $80, $40
	db $96, $18
	db $92, $08
	db $80, $10
	db $91, $18
	db $91, $08
	db $80, $10
	db $92, $10
	db $94, $0C
	db $80, $04
	db $92, $18
	db $80, $08
	db $91, $08
	db $80, $08
	db $92, $18
	db $80, $08
	db $91, $08
	db $80, $08
	db $92, $10
	db $80, $50
	db !return_from_sub

.seq_174B:
	db $80, $80
.loop_point_174D:
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $2C, $17
	db !set_adsr, $EF, $21
	db $80, $0E
	db !echo_on
	db !vibrato_with_delay, $02, $02, $0B, $05
	db !loop_subsequence, $01 : dw .subseq_16C8
	db $80, $92
	db !set_instrument, $28
	db !change_instr_pitch, $FC
	db !fine_tune, $F2
	db !set_adsr, $AF, $D1
	db !loop_subsequence, $01 : dw .subseq_1778
	db !jump_to_sequence : dw .loop_point_174D
	db !end_sequence

.subseq_1778:
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $9E
	db !loop_subsequence, $01 : dw .subseq_17BB
	db !set_variable_note_1, $9B
	db !set_variable_note_2, $9B
	db !loop_subsequence, $01 : dw .subseq_17BB
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $A0
	db !loop_subsequence, $01 : dw .subseq_17BB
	db !set_variable_note_1, $A0
	db !set_variable_note_2, $A0
	db !loop_subsequence, $01 : dw .subseq_17BB
	db !set_variable_note_1, $A0
	db !set_variable_note_2, $A2
	db !loop_subsequence, $01 : dw .subseq_17BB
	db !set_variable_note_1, $A2
	db !set_variable_note_2, $9E
	db !loop_subsequence, $01 : dw .subseq_17BB
	db !set_variable_note_1, $9E
	db !set_variable_note_2, $9E
	db !loop_subsequence, $01 : dw .subseq_17BB
	db !set_variable_note_1, $9D
	db !set_variable_note_2, $99
	db !loop_subsequence, $01 : dw .subseq_17BB
	db $80, $20
	db !return_from_sub

.subseq_17BB:
	db !set_volume_l_and_r, $18, $20
	db $E0, $10
	db $E0, $10
	db $E0, $04
	db !set_volume_l_and_r, $0E, $16
	db $E0, $08
	db $E0, $08
	db $E0, $04
	db !set_volume_l_and_r, $18, $20
	db $E1, $04
	db !set_volume_l_and_r, $0E, $16
	db $E1, $08
	db $E1, $08
	db $E1, $08
	db !set_volume_l_and_r, $06, $0C
	db $E1, $08
	db $E1, $08
	db $E1, $08
	db !set_volume_l_and_r, $02, $08
	db $E1, $08
	db $E1, $08
	db $E1, $04
	db !return_from_sub

.seq_17EE:
	db !set_instrument, $18
	db !change_instr_pitch, $1F
	db !fine_tune, $D4
	db !set_volume_l_and_r, $08, $0E
	db !set_adsr, $AF, $94
	db !vibrato_with_delay, $02, $02, $18, $01
	db !echo_on
	db !loop_subsequence, $01 : dw .subseq_184D
.loop_point_1804:
	db !loop_subsequence, $07 : dw .subseq_1864
	db !loop_subsequence, $01 : dw .subseq_184D
	db !echo_off
	db !set_instrument, $87
	db !set_volume_l_and_r, $0C, $08
	db !pitch_slide_up, $08, $01, $21, $21, $00
	db !loop_subsequence, $10 : dw .subseq_1842
	db !pitch_slide_off
	db !set_adsr, $8E, $F6
	db $A2, $80
	db $80, $80
	db $80, $80
	db $80, $80
	db !loop_subsequence, $20 : dw .subseq_1842
	db !set_instrument, $18
	db !change_instr_pitch, $1F
	db !fine_tune, $D4
	db !set_volume_l_and_r, $08, $0E
	db !set_adsr, $AF, $94
	db !vibrato_with_delay, $02, $02, $18, $01
	db !echo_on
	db !jump_to_sequence : dw .loop_point_1804
	db !end_sequence

.subseq_1842:
	db !set_adsr, $8E, $F6
	db $A2, $08
	db !set_adsr, $8D, $F6
	db $A2, $08
	db !return_from_sub

.subseq_184D:
	db $80, $10
	db $92, $10
	db $91, $08
	db $8D, $08
	db $80, $08
	db $92, $08
	db $80, $08
	db $92, $08
	db $80, $08
	db $91, $08
	db $92, $20
	db !return_from_sub

.subseq_1864:
	db $80, $10
	db $92, $10
	db $91, $08
	db $8D, $08
	db $80, $08
	db $92, $08
	db $80, $08
	db $92, $08
	db $80, $08
	db $91, $08
	db $92, $10
	db $92, $08
	db $94, $08
	db !return_from_sub

base off
arch 65816
.end: