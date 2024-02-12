;Sound Effects: Klubba, Rescue Kong, Big Boss(Krow/Kudgel/Kreepy Krow), K.Rool
;32F723
boss_1_sfx_data:
	dw !dyn_snd_loc, $012B
;If modifying this file, comment out the line above and uncomment the line below
;	dw !dyn_snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !dyn_snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $001D)
;sound effect pointers
.pointers_start:
	dw .seq_30B6	;60: Egg cracking
	dw .seq_30AF	;61: Krow flapping wings
	dw .seq_3092	;62: Krow hit with egg
	dw .seq_304A	;63: Krow defeated
	dw .seq_303E	;64: Krow pulling egg from nest
	dw .seq_302E	;65: Egg/Kudgel falling
	dw .seq_3023	;66: Hanging hooks appearing
	dw .seq_3015	;67: Piece of debris falling
	dw .seq_2F42	;68: Blunderbuss flame
	dw .seq_2F67	;69: Spikes retracting on cannonball
	dw .seq_2F56	;6A: Swirling
	dw .seq_2F49	;6B: Cannonball bouncing
	dw .seq_3002	;6C: Blunderbuss flame (repeats indefinitely)
	dw .seq_2FEC	;6D: Kudgel landing
	dw .seq_2FEB	;6E: -Nothing-
	dw .seq_2FD5	;6F: Kudgel swinging cudgel
	dw .seq_2FC9	;70: K. Rool using blunderbuss as a vacuum (whoosh channel)
	dw .seq_2FB8	;71: D.K. punching K. Rool
	dw .seq_2FB1	;72: D.K. oof
	dw .seq_2FA6	;73: K. Rool blinking eyes
	dw .seq_2F9C	;74: K. Rool's blunderbuss backfiring
	dw .seq_2F8B	;75: D.K. grunt
	dw .seq_2F72	;76: K. Rool using blunderbuss as a vacuum (vroom channel)
	dw .seq_2F71	;77: -Nothing-
	dw .seq_2F1F	;78: Kongs panicking
	dw .seq_309E	;79: Krow cawing
	dw .seq_2F0F	;7A: Kudgel flying into background
	dw .seq_30D3	;7B: Slam
	dw .seq_2ED0	;7C: Kreepy Krow destroyed
.pointers_end:

.seq_2ED0:
	db !set_vol_single_val, $78
	db !set_adsr, $8E, $F4
	db !set_instrument, $0A
	db !set_vol_single_val, $78
	db !set_adsr, $8F, $EA
	db $81, $10
	db $85, $10
	db !set_adsr, $8F, $E0
	db $81, $10
	db !change_instr_pitch_rel, $FE
	db !set_vol_single_val, $50
	db $81, $10
	db $85, $10
	db !set_adsr, $8F, $E0
	db $81, $25
	db !set_instrument, $2B
	db !set_default_duration, $08
	db !set_vol_single_val, $32
	db $AA
	db $A8
	db $AA
	db $AC
	db !set_vol_single_val, $14
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
	db !end_sequence

.seq_2F0F:
	db !set_vol_single_val, $30
	db !set_instrument, $49
	db !set_adsr, $8B, $E8
	db !pitch_slide_down, $00, $02, $63, $0C, $09
	db $A0, $90
	db !end_sequence

.seq_2F1F:
	db !echo_on
	db !set_vol_single_val, $3C
	db !play_subsequence : dw .subseq_2F35
	db !set_vol_single_val, $1E
	db !play_subsequence : dw .subseq_2F35
	db !set_vol_single_val, $14
	db !play_subsequence : dw .subseq_2F35
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_2F35
	db !end_sequence

.subseq_2F35:
	db !set_instrument, $02
	db $96, $0A
	db $96, $0A
	db !set_instrument, $04
	db $99, $0C
	db $98, $08
	db !return_from_sub

.seq_2F42:
	db !set_instrument, $D9
	db !set_vol_single_val, $7F
	db $90, $40
	db !end_sequence

.seq_2F49:
	db !set_instrument, $0D
	db !set_vol_single_val, $7F
	db !pitch_slide_up, $00, $01, $04, $2C, $01
	db $81, $14
	db !end_sequence

.seq_2F56:
	db !set_instrument, $D2
	db !set_vol_single_val, $32
	db !set_adsr, $88, $E0
	db !vibrato_with_delay, $08, $04, $2C, $01
	db !long_duration_on
	db $92, $FF, $FF
	db !end_sequence

.seq_2F67:
	db !set_instrument, $D2
	db !set_vol_single_val, $64
	db !set_adsr, $86, $E0
	db $9A, $20
	db !end_sequence

.seq_2F71:
	db !end_sequence

.seq_2F72:
	db !set_adsr, $87, $E0
	db !set_vol_single_val, $64
	db !set_instrument, $53
	db !change_instr_pitch, $E8
	db !pitch_slide_up, $00, $08, $06, $16, $00
	db !vibrato_with_delay, $04, $01, $08, $01
	db !long_duration_on
	db $89, $FF, $FF
	db !end_sequence

.seq_2F8B:
	db !set_vol_single_val, $50
	db !set_instrument, $05
	db !set_default_duration, $0A
	db $88
	db !set_instrument, $BC
	db $88
	db !set_instrument, $07
	db $88
	db !set_instrument, $01
	db $88
	db !end_sequence

.seq_2F9C:
	db !set_instrument, $0A
	db !set_vol_single_val, $64
	db !set_adsr, $DF, $40
	db $82, $28
	db !end_sequence

.seq_2FA6:
	db !set_instrument, $BC
	db !set_vol_single_val, $64
	db $85, $12
	db !set_vol_single_val, $19
	db $85, $12
	db !end_sequence

.seq_2FB1:
	db !set_instrument, $05
	db !set_vol_single_val, $78
	db $90, $14
	db !end_sequence

.seq_2FB8:
	db !set_instrument, $90
	db !set_adsr, $86, $E0
	db !set_vol_single_val, $7F
	db $94, $0B
	db !set_instrument, $AD
	db !set_adsr, $EF, $E8
	db $8F, $20
	db !end_sequence

.seq_2FC9:
	db !set_instrument, $9D
	db !set_vol_single_val, $3C
	db !set_adsr, $8B, $E0
	db !long_duration_on
	db $8E, $FF, $FF
	db !end_sequence

.seq_2FD5:
	db !set_instrument, $0A
	db !set_adsr, $88, $E0
	db !pitch_slide_down, $00, $01, $21, $21, $05
	db !set_default_duration, $11
	db !set_vol_single_val, $64
	db $95
	db !set_vol_single_val, $1E
	db $95
	db !set_vol_single_val, $0F
	db $95
.seq_2FEB:
	db !end_sequence

.seq_2FEC:
	db !set_instrument, $A4
	db !set_adsr, $DF, $C0
	db !set_vol_single_val, $64
	db $8A, $0A
	db !set_default_duration, $10
	db $8A
	db !set_vol_single_val, $28
	db $8A
	db !set_vol_single_val, $14
	db $8A
	db !set_vol_single_val, $0A
	db $8A
	db !end_sequence

.seq_3002:
	db !set_instrument, $D9
	db !set_vol_single_val, $50
	db !set_adsr, $8B, $E0
	db !change_instr_pitch, $00
	db !long_duration_on
	db !vibrato_with_delay, $02, $02, $02, $02
	db $94, $FF, $FF
	db !end_sequence

.seq_3015:
	db !set_instrument, $86
	db !set_default_duration, $0A
	db !set_vol_single_val, $3C
	db $8D
	db !set_vol_single_val, $14
	db $8D
	db !set_vol_single_val, $0F
	db $8D
	db !end_sequence

.seq_3023:
	db !set_instrument, $D7
	db !set_vol_single_val, $78
	db $8D, $0A
	db !set_vol_single_val, $28
	db $9E, $08
	db !end_sequence

.seq_302E:
	db !set_instrument, $2B
	db !set_adsr, $8B, $E0
	db !set_vol_single_val, $50
	db !pitch_slide_down, $00, $01, $4D, $0B, $00
	db $90, $40
	db !end_sequence

.seq_303E:
	db !set_instrument, $AB
	db !set_volume_l_and_r, $75, $89
	db $98, $08
	db !set_vol_single_val, $28
	db $98, $08
	db !end_sequence

.seq_304A:
	db !set_instrument, $0A
	db !set_vol_single_val, $64
	db !set_vol_single_val, $28
	db $8E, $04
	db !set_vol_single_val, $64
	db $8A, $18
	db !set_instrument, $C4
	db !set_adsr, $8E, $F4
	db !set_vol_single_val, $78
	db $8B, $15
	db !set_vol_single_val, $28
	db $8B, $15
	db !set_vol_single_val, $14
	db $8B, $17
	db !fine_tune, $E2
	db !set_vol_single_val, $78
	db $8B, $15
	db !set_vol_single_val, $28
	db $8B, $15
	db !set_vol_single_val, $14
	db $8B, $17
	db !fine_tune, $C4
	db !set_vol_single_val, $78
	db $8B, $15
	db !set_vol_single_val, $28
	db $8B, $15
	db !set_vol_single_val, $14
	db $8B, $17
	db !fine_tune, $A6
	db !set_vol_single_val, $78
	db $8B, $15
	db !set_vol_single_val, $28
	db $8B, $15
	db !set_vol_single_val, $14
	db $8B, $17
	db !end_sequence

.seq_3092:
	db !set_instrument, $0A
	db !set_vol_single_val, $64
	db !set_vol_single_val, $28
	db $8E, $04
	db !set_vol_single_val, $64
	db $8A, $18
.seq_309E:
	db !set_instrument, $C4
	db !set_adsr, $8E, $F4
	db !set_default_duration, $14
	db !set_vol_single_val, $78
	db $8A
	db !set_vol_single_val, $28
	db $89
	db !set_vol_single_val, $14
	db $88
	db !end_sequence

.seq_30AF:
	db !set_instrument, $A1
	db !set_vol_single_val, $80
	db $8E, $18
	db !end_sequence

.seq_30B6:
	db !set_instrument, $AB
	db !set_volume_l_and_r, $75, $89
	db $96, $12
	db !set_vol_single_val, $28
	db $96, $0A
	db !set_volume_l_and_r, $89, $75
	db $97, $10
	db !set_vol_single_val, $28
	db $97, $06
	db !set_volume_l_and_r, $75, $89
	db $98, $10
	db !set_vol_single_val, $28
	db $98, $0A
.seq_30D3:
	db !set_instrument, $0A
	db !set_vol_single_val, $28
	db $8E, $04
	db !set_vol_single_val, $64
	db $8A, $12
	db !set_vol_single_val, $1E
	db $8A, $12
	db !set_vol_single_val, $0A
	db $8A, $14
	db !end_sequence

base off
arch 65816
.end: