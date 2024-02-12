;14 Game Over
;325D1A
game_over_song_data:
	dw !bgm_loc, $0152
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1314, .seq_14EA, .seq_1406, .seq_1469, .seq_1448, .seq_150E, .seq_13BD, .seq_1427
	db $5A, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.seq_1314:
	db !set_echo, $32, $15, $15
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !set_instrument, $8D
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $32, $17
	db !set_adsr, $DF, $2F
	db $9A, $10
	db $99, $10
	db $9A, $10
	db $99, $09
	db $99, $07
	db $9A, $10
	db $99, $10
	db $9A, $10
	db $99, $09
	db $99, $07
	db $9A, $10
	db $99, $10
	db $9A, $10
	db $99, $09
	db $99, $07
	db $9A, $10
	db $99, $10
	db $9A, $10
	db $99, $09
	db $99, $07
	db $9A, $10
	db $99, $10
	db $9A, $10
	db $99, $09
	db $99, $07
	db $9A, $10
	db $99, $10
	db $99, $09
	db $99, $27
	db $99, $0B
	db !echo_on
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_adsr, $EF, $31
	db !set_volume_l_and_r, $14, $0A
	db $86, $02
	db $8A, $02
	db $8D, $02
	db $90, $02
	db !set_volume_l_and_r, $10, $07
	db $92, $02
	db $96, $02
	db $99, $02
	db $9C, $02
	db $92, $02
	db $96, $02
	db $99, $02
	db $9C, $02
	db !set_volume_l_and_r, $0C, $05
	db $9E, $02
	db $A2, $02
	db $A5, $02
	db $A8, $02
	db $9E, $02
	db $A2, $02
	db $A5, $02
	db $A8, $02
	db !set_volume_l_and_r, $06, $02
	db !set_adsr, $FF, $32
	db $AA, $02
	db $AE, $02
	db $B1, $02
	db $B4, $02
	db $AA, $03
	db $AE, $03
	db $B1, $03
	db $B4, $03
	db $B6, $10
	db !end_sequence

.seq_13BD:
	db !set_instrument, $18
	db !change_instr_pitch, $07
	db !fine_tune, $D4
	db !set_volume_l_and_r, $4E, $4E
	db !set_adsr, $8F, $F1
	db $86, $10
	db $86, $10
	db $86, $10
	db $86, $09
	db $86, $07
	db $86, $10
	db $86, $10
	db $86, $10
	db $86, $09
	db $86, $07
	db $8B, $10
	db $8B, $10
	db $8B, $10
	db $8B, $09
	db $8B, $07
	db $8C, $10
	db $8C, $10
	db $8C, $10
	db $8C, $09
	db $8C, $07
	db $86, $10
	db $86, $10
	db $86, $10
	db $86, $09
	db $86, $07
	db $8B, $10
	db $8B, $10
	db $8D, $09
	db $8D, $27
	db $86, $80
	db !end_sequence

.seq_1406:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $12, $12
	db !set_adsr, $8A, $EB
	db $A2, $20
	db $A2, $20
	db $A2, $40
	db $9E, $20
	db $9E, $20
	db $A1, $40
	db $A2, $40
	db $9E, $20
	db $A1, $30
	db $9C, $80
	db !end_sequence

.seq_1427:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $15, $15
	db !set_adsr, $8A, $EB
	db $9E, $20
	db $9D, $20
	db $9C, $40
	db $97, $20
	db $96, $20
	db $98, $40
	db $9E, $40
	db $9B, $20
	db $9D, $30
	db $96, $80
	db !end_sequence

.seq_1448:
	db !set_instrument, $14
	db !change_instr_pitch, $F0
	db !fine_tune, $02
	db !set_volume_l_and_r, $12, $12
	db !set_adsr, $8A, $EB
	db $99, $20
	db $99, $20
	db $99, $40
	db $9B, $20
	db $9B, $20
	db $9B, $40
	db $99, $40
	db $97, $20
	db $99, $30
	db $92, $80
	db !end_sequence

.seq_1469:
	db !echo_on
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $19, $08
	db !set_adsr, $8F, $E5
	db !play_subsequence : dw .subseq_148B
	db !set_volume_l_and_r, $05, $11
	db $9B, $02
	db $9C, $0C
	db $80, $02
	db $9B, $09
	db $80, $07
	db $99, $09
	db $96, $10
	db !end_sequence

.subseq_148B:
	db $80, $09
	db $A2, $07
	db $A5, $0D
	db $80, $03
	db $A2, $09
	db $A5, $10
	db $80, $07
	db $80, $09
	db $A2, $07
	db $A5, $09
	db $A6, $05
	db $A6, $02
	db $A7, $09
	db $A5, $07
	db $A2, $09
	db $9E, $07
	db $80, $09
	db $9B, $07
	db $9E, $0D
	db $80, $03
	db $9B, $09
	db $9E, $10
	db $A0, $02
	db $A1, $0B
	db $80, $0A
	db $A0, $0D
	db $80, $03
	db $9E, $09
	db $9B, $10
	db $80, $07
	db $80, $09
	db $A0, $02
	db $A2, $05
	db $A5, $10
	db $A2, $09
	db $A0, $07
	db $9E, $09
	db $99, $07
	db $9B, $10
	db $9E, $0B
	db $9F, $03
	db $A0, $02
	db $A1, $08
	db $80, $01
	db $A0, $20
	db $80, $07
	db $9E, $20
	db !return_from_sub

.seq_14EA:
	db !echo_on
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $03, $08
	db !set_adsr, $8F, $E0
	db $80, $0A
	db !play_subsequence : dw .subseq_148B
	db !set_volume_l_and_r, $06, $02
	db $9B, $02
	db $9C, $0C
	db $80, $02
	db $9B, $09
	db $80, $07
	db $99, $09
	db $96, $10
	db !end_sequence

.seq_150E:
	db !echo_on
	db !set_instrument, $24
	db !change_instr_pitch, $00
	db !fine_tune, $A9
	db !set_adsr, $EF, $32
	db !set_volume_l_and_r, $0B, $21
	db $99, $02
	db $9E, $02
	db $A2, $1B
	db $99, $02
	db $9D, $02
	db $A2, $1C
	db $99, $02
	db $9C, $02
	db $A2, $1C
	db $80, $20
	db $97, $02
	db $9B, $02
	db $9E, $1C
	db $96, $02
	db $9B, $02
	db $9E, $1C
	db $98, $02
	db $9B, $02
	db $9E, $02
	db $A1, $1B
	db $80, $20
	db $99, $02
	db $9E, $02
	db $A2, $3C
	db $97, $02
	db $9B, $02
	db $9E, $1C
	db $99, $02
	db $9D, $02
	db $A1, $33
	db !set_adsr, $EF, $31
	db !set_volume_l_and_r, $1E, $3C
	db $86, $02
	db $8A, $02
	db $8D, $02
	db $90, $02
	db !set_volume_l_and_r, $14, $32
	db $92, $02
	db $96, $02
	db $99, $02
	db $9C, $02
	db $92, $02
	db $96, $02
	db $99, $02
	db $9C, $02
	db !set_volume_l_and_r, $0F, $26
	db $9E, $02
	db $A2, $02
	db $A5, $02
	db $A8, $02
	db $9E, $02
	db $A2, $02
	db $A5, $02
	db $A8, $02
	db !set_volume_l_and_r, $05, $11
	db !set_adsr, $FF, $32
	db $AA, $02
	db $AE, $02
	db $B1, $02
	db $B4, $02
	db $AA, $03
	db $AE, $03
	db $B1, $03
	db $B4, $03
	db $B6, $10
	db !end_sequence

base off
arch 65816
.end: