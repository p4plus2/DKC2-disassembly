;Sound Effects: Ship Deck/2, Ship Hold, Ice, Rigging, Credits, Secret Ending
;32F2F1
ship_ice_ending_sfx_data:
	dw !dyn_snd_loc, $0134
;If modifying this file, comment out the line above and uncomment the line below
;	dw !dyn_snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !dyn_snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $0017)
;sound effect pointers
.pointers_start:
	dw .seq_30EE	;60: 
	dw .seq_30E4	;61: 
	dw .seq_30CD	;62: 
	dw .seq_30BB	;63: 
	dw .seq_30BA	;64: 
	dw .seq_30A2	;65: 
	dw .seq_2FA2	;66: 
	dw .seq_308A	;67: 
	dw .seq_3035	;68: 
	dw .seq_3018	;69: 
	dw .seq_2FE1	;6A: 
	dw .seq_2FB6	;6B: 
	dw .seq_3072	;6C: 
	dw .seq_305F	;6D: 
	dw .seq_3052	;6E: 
	dw .seq_2F8F	;6F: 
	dw .seq_2F75	;70: 
	dw .seq_2F61	;71: 
	dw .seq_2F4F	;72: 
	dw .seq_2F3D	;73: 
	dw .seq_2F2D	;74: 
	dw .seq_2EEC	;75: 
	dw .seq_2EC4	;76: 
.pointers_end:

.seq_2EC4:
	db $80, $0E
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_2F0A
	db $80, $03
	db !set_vol_single_val, $10
	db !play_subsequence : dw .subseq_2F0A
	db $80, $03
	db !set_vol_single_val, $08
	db !play_subsequence : dw .subseq_2F0A
	db $80, $03
	db !set_vol_single_val, $04
	db !play_subsequence : dw .subseq_2F0A
	db $80, $03
	db !set_vol_single_val, $02
	db !play_subsequence : dw .subseq_2F0A
	db !end_sequence

.seq_2EEC:
	db !set_adsr, $8F, $E0
	db !echo_on
	db !set_vol_single_val, $50
	db !play_subsequence : dw .subseq_2F0A
	db !set_vol_single_val, $28
	db !play_subsequence : dw .subseq_2F0A
	db !set_vol_single_val, $14
	db !play_subsequence : dw .subseq_2F0A
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_2F0A
	db !set_vol_single_val, $05
	db !play_subsequence : dw .subseq_2F0A
	db !end_sequence

.subseq_2F0A:
	db !set_instrument, $C1
	db $8A, $0C
	db $89, $0E
	db $88, $0E
	db !set_instrument, $C3
	db $8A, $0E
	db $8A, $0E
	db $8A, $0C
	db !set_instrument, $C2
	db $8A, $10
	db !set_instrument, $C3
	db $88, $0E
	db $88, $0E
	db $88, $0C
	db !set_instrument, $C2
	db $88, $10
	db $80, $30
	db !return_from_sub

.seq_2F2D:
	db !set_instrument, $D9
	db !set_vol_single_val, $3C
	db !set_adsr, $8E, $F4
	db !pitch_slide_up, $00, $01, $16, $4D, $00
	db $8F, $20
	db !end_sequence

.seq_2F3D:
	db !set_instrument, $88
	db !set_vol_single_val, $64
	db !change_instr_pitch, $F4
	db !set_adsr, $8E, $F4
	db !pitch_slide_up, $00, $01, $16, $4D, $00
	db $83, $20
	db !end_sequence

.seq_2F4F:
	db !set_instrument, $D9
	db !vibrato_with_delay, $03, $01, $0B, $01
	db !set_vol_single_val, $3C
	db !set_adsr, $88, $E0
	db !long_duration_on
	db $8F, $FF, $FF
	db !long_duration_off
	db !end_sequence

.seq_2F61:
	db !set_instrument, $88
	db !vibrato_with_delay, $07, $03, $3C, $01
	db !set_vol_single_val, $64
	db !change_instr_pitch, $F4
	db !set_adsr, $88, $E0
	db !long_duration_on
	db $83, $FF, $FF
	db !long_duration_off
	db !end_sequence

.seq_2F75:
	db !set_instrument, $0A
	db !set_vol_single_val, $46
	db !set_adsr, $8B, $E0
	db !vibrato_with_delay, $03, $02, $17, $01
	db !change_instr_pitch, $F4
	db $82, $20
	db !set_instrument, $D9
	db !set_vol_single_val, $78
	db !set_adsr, $88, $EB
	db $8F, $80
	db !end_sequence

.seq_2F8F:
	db !set_instrument, $0A
	db !set_vol_single_val, $46
	db !set_adsr, $8B, $E0
	db !vibrato_with_delay, $03, $02, $17, $01
	db !change_instr_pitch, $F4
	db $80, $10
	db $82, $40
	db !end_sequence

.seq_2FA2:
	db !set_instrument, $06
	db !set_vol_single_val, $46
	db !set_adsr, $8F, $E0
	db !vibrato_with_delay, $03, $02, $17, $01
	db !echo_on
	db $86, $06
	db $80, $02
	db $86, $14
	db !end_sequence

.seq_2FB6:
	db !echo_on
	db !set_instrument, $DA
	db !set_adsr, $F8, $E0
	db !set_vol_single_val, $5A
	db $8C, $08
	db $8D, $08
	db $8E, $08
	db $8F, $05
	db $90, $05
	db !set_vol_single_val, $21
	db $8E, $08
	db $8F, $05
	db $90, $05
	db !set_vol_single_val, $16
	db $8E, $08
	db $8F, $05
	db $90, $05
	db !set_vol_single_val, $0B
	db $8E, $08
	db $8F, $05
	db $90, $05
	db !end_sequence

.seq_2FE1:
	db !set_adsr, $86, $E0
	db !set_instrument, $0A
	db !pitch_slide_up, $00, $02, $0B, $0B, $02
	db !set_vol_single_val, $64
	db $81, $10
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $6E
	db $8A, $18
	db !set_instrument, $2B
	db !set_adsr, $AF, $B4
	db !set_default_duration, $12
	db !set_vol_single_val, $1E
	db $AA
	db $A8
	db $AA
	db $AC
	db !set_vol_single_val, $0A
	db $AA
	db $A8
	db $AA
	db $AC
	db !set_vol_single_val, $05
	db $AA
	db $A8
	db $AA
	db $AC
	db !set_vol_single_val, $02
	db $AA
	db $A8
	db $AA
	db $AC
	db !default_duration_off
	db !end_sequence

.seq_3018:
	db !set_instrument, $0A
	db !set_vol_single_val, $7F
	db !set_adsr, $86, $E0
	db !pitch_slide_up, $00, $03, $21, $21, $02
	db !set_vol_single_val, $7F
	db !set_default_duration, $1E
	db $81
	db !set_vol_single_val, $1E
	db $81
	db !set_vol_single_val, $14
	db $81
	db !set_vol_single_val, $0A
	db $81
	db !default_duration_off
	db !end_sequence

.seq_3035:
	db !set_instrument, $99
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !echo_on
	db !set_adsr, $87, $C1
	db !set_vol_single_val, $50
	db $96, $30
	db !set_vol_single_val, $3C
	db $96, $30
.loop_point_3047:
	db !set_vol_single_val, $28
	db $96, $30
	db !set_vol_single_val, $14
	db $96, $30
	db !jump_to_sequence : dw .loop_point_3047

.seq_3052:
	db !set_instrument, $43
	db !noise_on
	db !dsp_flag, $1A
	db !set_vol_single_val, $08
	db !set_adsr, $8B, $CF
	db $8D, $38
	db !end_sequence

.seq_305F:
	db !set_instrument, $0A
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $0C
	db $9B, $02
	db !echo_on
	db !set_vol_single_val, $28
	db $9B, $08
	db !set_vol_single_val, $08
	db $9B, $08
	db !end_sequence

.seq_3072:
	db !set_instrument, $99
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !echo_on
	db !set_vol_single_val, $3A
	db !set_adsr, $88, $E1
	db !set_default_duration, $0E
	db $A6
	db $A8
	db $A6
	db $A8
	db $A6
	db $A8
	db $A6
	db $A8
	db !default_duration_off
	db !end_sequence

.seq_308A:
	db !set_instrument, $A5
	db !vibrato_with_delay, $03, $01, $16, $08
	db !set_vol_single_val, $32
	db $B4, $04
	db !set_vol_single_val, $14
	db $B4, $0C
	db !set_vol_single_val, $28
	db $B2, $04
	db !set_vol_single_val, $11
	db $B2, $0C
	db !end_sequence

.seq_30A2:
	db !set_instrument, $50
	db !set_adsr, $88, $C0
	db !pitch_slide_up, $00, $01, $26, $44, $03
	db !set_vol_single_val, $28
	db $9A, $10
	db !set_vol_single_val, $10
	db $9A, $10
	db !set_vol_single_val, $08
	db $9A, $10
	db !end_sequence

.seq_30BA:
	db !end_sequence

.seq_30BB:
	db !set_instrument, $CD
	db !set_vol_single_val, $64
	db !set_adsr, $8F, $E0
	db $8B, $11
	db !set_vol_single_val, $1E
	db $8B, $11
	db !set_vol_single_val, $0A
	db $8B, $11
	db !end_sequence

.seq_30CD:
	db !set_instrument, $99
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !echo_on
	db !set_adsr, $8F, $F1
	db !set_vol_single_val, $7F
	db $A0, $1A
	db !set_vol_single_val, $2A
	db $A0, $1A
	db !set_vol_single_val, $0E
	db $A0, $1A
	db !end_sequence

.seq_30E4:
	db !set_instrument, $94
	db !set_vol_single_val, $7F
	db !set_adsr, $8F, $EE
	db $8E, $50
	db !end_sequence

.seq_30EE:
	db !set_instrument, $94
	db !set_vol_single_val, $78
	db !set_adsr, $8F, $F2
	db $92, $30
	db !end_sequence

base off
arch 65816
.end: