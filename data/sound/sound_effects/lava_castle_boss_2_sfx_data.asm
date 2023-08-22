;Sound Effects: Lava, Castle, Big Boss(Kleever/King Zing)
;32F979
lava_castle_boss_2_sfx_data:
	dw !dyn_snd_loc, $00F7
;If modifying this file, comment out the line above and uncomment the line below
;	dw !dyn_snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !dyn_snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $0020)
;sound effect pointers
.pointers_start:
	dw .seq_2F46	;60: 
	dw .seq_2F46	;61: 
	dw .seq_2F46	;62: 
	dw .seq_2F46	;63: 
	dw .seq_2F46	;64: 
	dw .seq_2F46	;65: 
	dw .seq_306F	;66: Hanging hooks appearing (Kleever's Kiln/Kreepy Krow)
	dw .seq_305D	;67: Piece of debris falling (Kleever's Kiln/K. Rool Duel)
	dw .seq_3042	;68: Broken Kleever spiraling to his demise
	dw .seq_302E	;69: Lava bubbling 1
	dw .seq_300E	;6A: Lava bubbling 2
	dw .seq_2FEA	;6B: Kleever hit with cannonball
	dw .seq_2FD6	;6C: Fireball flying
	dw .seq_2ED6	;6D: Lava bubbling 3
	dw .seq_2F12	;6E: Landing on a Green Krockhead
	dw .seq_2F01	;6F: Bouncing on a Brown Krockhead
	dw .seq_2F46	;70: 
	dw .seq_2F46	;71: 
	dw .seq_2F46	;72: 
	dw .seq_2F46	;73: 
	dw .seq_2F46	;74: 
	dw .seq_2F46	;75: 
	dw .seq_2F46	;76: 
	dw .seq_2F46	;77: 
	dw .seq_2F23	;78: Kongs scared
	dw .seq_2FB1	;79: Fireball sound
	dw .seq_2F9D	;7A: King Zing hit
	dw .seq_2F90	;7B: King Zing spawning Zingers
	dw .seq_2F57	;7C: King Zing firing spikes
	dw .seq_2F47	;7D: Squawks egg bouncing off King Zing
	dw .seq_2FC1	;7E: Lava bubbling 4
	dw .seq_2EEB	;7F: King Zing defeated
.pointers_end:

.seq_2ED6:
	db !set_instrument, $A9
	db !set_vol_single_val, $7F
	db $A2, $0A
	db $A2, $0B
	db $A0, $0C
	db $9F, $0D
	db $9E, $0E
	db $9D, $0F
	db $9C, $10
	db $9B, $11
	db !end_sequence

.seq_2EEB:
	db !set_instrument, $C6
	db !set_vol_single_val, $6F
	db !set_adsr, $8C, $E5
	db !vibrato_with_delay, $03, $04, $12, $05
	db !pitch_slide_down, $05, $08, $6F, $32, $00
	db !echo_on
	db $9A, $F0
	db !end_sequence

.seq_2F01:
	db !set_instrument, $4B
	db !set_vol_single_val, $64
	db !set_adsr, $8E, $EE
	db !pitch_slide_up, $00, $01, $2C, $6F, $08
	db !echo_on
	db $90, $21
	db !end_sequence

.seq_2F12:
	db !set_instrument, $4B
	db !set_vol_single_val, $64
	db !set_adsr, $8E, $E0
	db !pitch_slide_up, $00, $01, $2C, $6F, $08
	db !echo_on
	db $90, $10
	db !end_sequence

.seq_2F23:
	db !echo_on
	db !set_vol_single_val, $3C
	db !play_subsequence : dw .subseq_2F39
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_2F39
	db !set_vol_single_val, $14
	db !play_subsequence : dw .subseq_2F39
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_2F39
	db !end_sequence

.subseq_2F39:
	db !set_instrument, $02
	db $96, $0A
	db $96, $0A
	db !set_instrument, $04
	db $99, $0C
	db $98, $08
	db !return_from_sub

.seq_2F46:
	db !end_sequence

.seq_2F47:
	db !set_instrument, $24
	db !set_adsr, $8E, $F3
	db !set_vol_single_val, $46
	db !pitch_slide_up, $00, $01, $16, $16, $01
	db $92, $18
	db !end_sequence

.seq_2F57:
	db !set_adsr, $86, $E0
	db !set_instrument, $0A
	db !pitch_slide_up, $00, $02, $0B, $0B, $02
	db !set_vol_single_val, $64
	db $81, $10
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $6E
	db $8A, $18
	db !set_vol_single_val, $7F
	db !set_instrument, $C6
	db !set_adsr, $AF, $F3
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

.seq_2F90:
	db !set_instrument, $D9
	db !set_vol_single_val, $7F
	db !pitch_slide_up, $00, $04, $11, $2C, $00
	db $81, $40
	db !end_sequence

.seq_2F9D:
	db !set_instrument, $C6
	db !set_adsr, $9D, $E8
	db !pitch_slide_up, $00, $01, $11, $2C, $00
	db !set_vol_single_val, $7F
	db $85, $20
	db !set_vol_single_val, $28
	db $85, $20
	db !end_sequence

.seq_2FB1:
	db !set_instrument, $D9
	db !set_adsr, $AE, $F3
	db !pitch_slide_up, $00, $01, $11, $2C, $02
	db !set_vol_single_val, $7F
	db $95, $30
	db !end_sequence

.seq_2FC1:
	db !set_instrument, $AA
	db !set_vol_single_val, $7F
	db $8F, $12
	db !set_vol_single_val, $5A
	db !set_instrument, $A9
	db $A0, $0A
	db $A1, $0B
	db $A2, $0C
	db $A3, $0D
	db $A4, $0A
	db !end_sequence

.seq_2FD6:
	db !set_instrument, $D9
	db !set_vol_single_val, $50
	db !set_adsr, $8B, $E0
	db !change_instr_pitch, $00
	db !long_duration_on
	db !vibrato_with_delay, $02, $02, $02, $02
	db $94, $FF, $FF
	db !long_duration_off
	db !end_sequence

.seq_2FEA:
	db !set_instrument, $2F
	db !set_vol_single_val, $7E
	db !set_adsr, $CF, $F1
	db !vibrato_with_delay, $03, $02, $17, $08
	db $85, $20
	db !set_instrument, $08
	db !set_adsr, $8D, $E0
	db $88, $08
	db $87, $08
	db $86, $08
	db $85, $0E
	db !set_vol_single_val, $1E
	db $85, $0E
	db !set_vol_single_val, $0F
	db $85, $0E
	db !end_sequence

.seq_300E:
	db !set_instrument, $AA
	db !set_vol_single_val, $6E
	db !set_adsr, $FF, $E0
	db $95, $14
	db $92, $14
	db !set_vol_single_val, $78
	db !set_instrument, $A9
	db $94, $16
	db $93, $16
	db $92, $16
	db $91, $18
	db $94, $16
	db $93, $16
	db $92, $16
	db $91, $18
	db !end_sequence

.seq_302E:
	db !set_instrument, $A9
	db !set_vol_single_val, $6E
	db !set_adsr, $FF, $E0
	db $92, $12
	db $93, $12
	db $92, $12
	db $94, $12
	db !set_instrument, $AA
	db $94, $18
	db !end_sequence

.seq_3042:
	db !set_instrument, $0A
	db !set_vol_single_val, $78
	db !set_adsr, $BF, $C8
	db $86, $11
	db !set_instrument, $BD
	db !set_vol_single_val, $64
	db !set_adsr, $F8, $E0
	db !vibrato_with_delay, $07, $03, $21, $01
	db !long_duration_on
	db $8D, $FF, $FF
	db !long_duration_off
	db !end_sequence

.seq_305D:
	db !set_instrument, $86
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $3C
	db $8D, $0A
	db !set_vol_single_val, $14
	db $8D, $0A
	db !set_vol_single_val, $0F
	db $8D, $0A
	db !end_sequence

.seq_306F:
	db !set_instrument, $D7
	db !set_vol_single_val, $78
	db !set_adsr, $8F, $E0
	db $8D, $0A
	db !set_vol_single_val, $28
	db $9E, $08
	db !end_sequence

base off
arch 65816
.end: