;Sound Effects: Roller Coaster, Haunted
;32F12F
roller_coaster_sfx_data:
	dw !dyn_snd_loc, $00E1
;If modifying this file, comment out the line above and uncomment the line below
;	dw !dyn_snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !dyn_snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $000F)
;sound effect pointers
.pointers_start:
	dw .seq_303D	;60: 
	dw .seq_3019	;61: 
	dw .seq_2FF5	;62: 
	dw .seq_2FB9	;63: 
	dw .seq_2FA2	;64: 
	dw .seq_2F8D	;65: 
	dw .seq_2F74	;66: 
	dw .seq_2F4C	;67: 
	dw .seq_2F3B	;68: 
	dw .seq_2F31	;69: 
	dw .seq_2F1E	;6A: 
	dw .seq_2F0F	;6B: 
	dw .seq_2F00	;6C: 
	dw .seq_2ED6	;6D: 
	dw .seq_2EB4	;6E: 
.pointers_end:

.seq_2EB4:
	db !set_vol_single_val, $7F
	db !set_instrument, $A5
	db $88, $04
	db $81, $12
	db !set_instrument, $8E
	db !set_adsr, $85, $E0
	db !pitch_slide_up, $00, $01, $3E, $3E, $04
	db !set_vol_single_val, $32
	db $AF, $10
	db $AE, $10
	db !set_vol_single_val, $14
	db $AE, $10
	db !set_vol_single_val, $0A
	db $AE, $10
	db !end_sequence

.seq_2ED6:
	db !echo_on
	db !set_instrument, $C1
	db !set_vol_single_val, $50
	db !set_adsr, $8F, $E0
	db $8A, $0C
	db $89, $0E
	db $88, $0E
	db !set_instrument, $C3
	db $8A, $0E
	db $8A, $0E
	db $8A, $0C
	db !set_instrument, $C2
	db $8A, $10
	db !set_volume_l_and_r, $19, $32
	db !set_instrument, $C3
	db $88, $0E
	db $88, $0E
	db $88, $0C
	db !set_instrument, $C2
	db $88, $10
	db !end_sequence

.seq_2F00:
	db !set_instrument, $8F
	db !set_vol_single_val, $2C
	db !set_adsr, $EE, $30
	db !vibrato_with_delay, $05, $02, $17, $01
	db $A4, $1E
	db !end_sequence

.seq_2F0F:
	db !set_instrument, $8F
	db !set_vol_single_val, $32
	db !set_adsr, $EE, $30
	db !vibrato_with_delay, $04, $02, $15, $01
	db $98, $1E
	db !end_sequence

.seq_2F1E:
	db !set_instrument, $D2
	db !set_adsr, $8F, $E0
	db !pitch_slide_up, $01, $01, $03, $05, $00
	db !set_vol_single_val, $3C
	db !set_adsr, $8F, $F3
	db $90, $30
	db !end_sequence

.seq_2F31:
	db !set_instrument, $0A
	db !set_vol_single_val, $7F
	db !set_adsr, $DF, $40
	db $81, $28
	db !end_sequence

.seq_2F3B:
	db !echo_on
	db !set_instrument, $67
	db !pitch_slide_down, $00, $01, $58, $2C, $01
	db !set_adsr, $8C, $F1
	db !set_vol_single_val, $11
	db $B8, $24
	db !end_sequence

.seq_2F4C:
	db !set_instrument, $00
	db !set_adsr, $8D, $E0
	db !set_vol_single_val, $0A
	db $8B, $03
	db !set_vol_single_val, $28
	db $8B, $03
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $50
	db $8B, $08
	db !set_adsr, $8D, $E0
	db !set_vol_single_val, $32
	db $8B, $08
	db !set_vol_single_val, $14
	db $8B, $08
	db !set_vol_single_val, $0A
	db $8B, $08
	db !set_vol_single_val, $05
	db $8B, $08
	db !end_sequence

.seq_2F74:
	db !echo_on
	db !set_instrument, $0A
	db !pitch_slide_down, $00, $01, $78, $78, $05
	db !set_adsr, $88, $E0
	db !set_vol_single_val, $1E
	db $99, $10
	db !set_adsr, $88, $EB
	db !pitch_slide_off
	db !set_vol_single_val, $08
	db $99, $10
	db !end_sequence

.seq_2F8D:
	db !set_instrument, $CC
	db !change_instr_pitch, $00
	db !set_volume_l_and_r, $F0, $1E
	db !set_adsr, $88, $E0
	db !vibrato_with_delay, $0B, $0B, $0E, $05
	db !long_duration_on
	db $90, $FF, $FF
	db !long_duration_off
	db !end_sequence

.seq_2FA2:
	db !set_instrument, $D2
	db !set_vol_single_val, $64
	db !set_adsr, $8F, $E0
	db !pitch_slide_up, $00, $01, $02, $02, $00
	db $8E, $12
	db !set_vol_single_val, $1E
	db !set_adsr, $8F, $F1
	db $8E, $40
	db !end_sequence

.seq_2FB9:
	db !set_instrument, $D1
	db !set_vol_single_val, $1E
	db !set_adsr, $8F, $EE
	db !set_vol_single_val, $32
	db $8B, $18
	db !set_vol_single_val, $3C
	db $8B, $18
	db !set_vol_single_val, $46
	db $8B, $18
	db !set_vol_single_val, $50
	db $8B, $18
	db !set_vol_single_val, $5A
	db $8B, $18
	db !set_vol_single_val, $64
	db $8B, $18
	db !set_vol_single_val, $6E
	db $8B, $18
	db !set_vol_single_val, $64
	db $8B, $18
	db !set_vol_single_val, $5A
	db $8B, $18
	db !set_vol_single_val, $50
	db $8B, $18
	db !set_vol_single_val, $46
	db $8B, $18
	db !set_vol_single_val, $3C
	db $8B, $18
	db !set_vol_single_val, $32
	db $8B, $18
	db !end_sequence

.seq_2FF5:
	db !set_instrument, $0A
	db !set_vol_single_val, $6E
	db !set_adsr, $8F, $E0
	db $82, $12
	db !echo_on
	db !set_instrument, $D0
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $7F
	db $84, $0E
	db !set_vol_single_val, $28
	db $84, $06
	db !set_vol_single_val, $7F
	db $82, $0E
	db !set_vol_single_val, $28
	db $82, $0E
	db !set_vol_single_val, $14
	db $82, $0E
	db !end_sequence

.seq_3019:
	db !set_instrument, $0A
	db !set_vol_single_val, $5A
	db !set_adsr, $8F, $E0
	db $85, $11
	db !echo_on
	db !set_instrument, $D0
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $78
	db $86, $0E
	db !set_vol_single_val, $28
	db $86, $06
	db !set_vol_single_val, $78
	db $86, $0E
	db !set_vol_single_val, $28
	db $86, $0E
	db !set_vol_single_val, $14
	db $86, $0E
	db !end_sequence

.seq_303D:
	db !set_instrument, $CC
	db !change_instr_pitch, $00
	db !set_volume_l_and_r, $D2, $32
	db !set_adsr, $88, $E0
	db !vibrato_with_delay, $0B, $0B, $0E, $05
	db !long_duration_on
	db $90, $FF, $FF
	db !long_duration_off
	db !end_sequence

base off
arch 65816
.end: