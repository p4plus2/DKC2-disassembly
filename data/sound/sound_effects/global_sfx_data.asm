;Global Sound Effects
;32E730
global_sfx_data:
	dw !snd_loc, $04EC
;If modifying this file, comment out the line above and uncomment the line below
;	dw !snd_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !snd_loc
	dw (.pointers_end-.pointers_start)>>1	;quantity of sound effects (default $0060)
;sound effect pointers
.pointers_start:
	dw .seq_2DDA	;00: 
	dw .seq_2DDB	;01: 
	dw .seq_2DCB	;02: Klomp walking, bumped by Klobber
	dw .seq_2DB6	;03: Kong chant (unused)
	dw .seq_2DA1	;04: Neek hit
	dw .seq_2D75	;05: Tagging partner
	dw .seq_2D6E	;06: Diddy hit
	dw .seq_2D67	;07: Dixie hit
	dw .seq_2D56	;08: Collecting Banana
	dw .seq_2D2D	;09: Collecting Banana Bunch (UNUSED)
	dw .seq_2CE9	;0A: Stars around Diddy's head
	dw .seq_2CD4	;0B: Rambi scuffing foot on ground (readying to charge)
	dw .seq_2CC2	;0C: 
	dw .seq_2CB2	;0D: Jumping sound? 
	dw .seq_2C9C	;0E: Zinger hit
	dw .seq_2C8E	;0F: Click Clack walking
	dw .seq_2C7E	;10: Click Clack defeated
	dw .seq_2C77	;11: Klobber skidding
	dw .seq_2C60	;12: Klobber popping out of barrel
	dw .seq_2C52	;13: Diddy/Dixie hitting ground when defeated/Rattly bouncing while idle
	dw .seq_2C40	;14: Boom
	dw .seq_2C0E	;15: Explosion
	dw .seq_2C07	;16: Chomping
	dw .seq_2BFD	;17: Teeth clamping
	dw .seq_2BF6	;18: Klomp/Klobber hit
	dw .seq_2BAA	;19: Wall breaking (usually played with 15)
	dw .seq_2B9C	;1A: Busting Barrel, Barrel Cannon shot, Klobber slamming into walls
	dw .seq_2B60	;1B: Kong held captive in DK barrel
	dw .seq_2B48	;1C: Clock ticking
	dw .seq_2B36	;1D: Rambi jump
	dw .seq_2B28	;1E: Kutlass swinging cutlass/Kleever swinging
	dw .seq_2B18	;1F: Klinger sliding down rope
	dw .seq_2B0B	;20: Dixie crying
	dw .seq_2AFB	;21: Kremkoin appearing (fizz)
	dw .seq_2AC9	;22: Kremkoin appearing (echo)
	dw .seq_2AB9	;23: Diddy juggling
	dw .seq_2AAD	;24: Neek squeaking
	dw .seq_2A9D	;25: Dixie sipping through straw
	dw .seq_2A89	;26: Dixie blowing bubble
	dw .seq_2A07	;27: KONG letter K
	dw .seq_29FF	;28: KONG letter O
	dw .seq_29F7	;29: KONG letter N
	dw .seq_29EF	;2A: KONG letter G
	dw .seq_29DD	;2B: Balloon popping
	dw .seq_29A9	;2C: Extra Life Balloon collection
	dw .seq_297F	;2D: Banana Coin collection
	dw .seq_295F	;2E: Reading K. Rool's note
	dw .seq_2951	;2F: Squawks spitting
	dw .seq_2942	;30: Squawks flapping wings
	dw .seq_2933	;31: Flapping wings (deeper)
	dw .seq_291F	;32: Necky ready to dive
	dw .seq_2910	;33: Menu cursor movement
	dw .seq_28FB	;34: Menu confirmation
	dw .seq_28CF	;35: Kremkoin appearing
	dw .seq_28C9	;36: Kremkoin collection
	dw .seq_28B0	;37: Click Clack flipping over
	dw .seq_289F	;38: Extra life point
	dw .seq_2857	;39: Animal Crate busted (channel 1)
	dw .seq_2806	;3A: Animal Crate busted (channel 2)
	dw .seq_27EF	;3B: Animal Crate busted (channel 3)
	dw .seq_27D8	;3C: Animal Crate busted (channel 4)
	dw .seq_27C3	;3D: Zinger drone
	dw .seq_27C0	;3E: Increase music tempo by 5 units (used in bonus areas)
	dw .seq_27AB	;3F: Flitter drone
	dw .seq_279D	;40: Kongs teaming up
	dw .seq_2787	;41: Animal buddy becoming item (channel 1)
	dw .seq_2775	;42: Animal buddy becoming item (channel 2)
	dw .seq_275D	;43: Animal buddy becoming item (channel 3)
	dw .seq_2747	;44: Animal buddy becoming item (channel 4)
	dw .seq_2738	;45: Squitter/Rattly hit
	dw .seq_2730	;46: Squitter shooting an attack web
	dw .seq_271F	;47: Squitter shooting a platform web
	dw .seq_2705	;48: Rattly hopping
	dw .seq_26EB	;49: Rattly leaping
	dw .seq_26D3	;4A: Loading Cannon
	dw .seq_26B1	;4B: Firing Cannon
	dw .seq_26A2	;4C: Dropping Cannonball
	dw .seq_2681	;4D: Squitter jumping
	dw .seq_2665	;4E: Spiny walking
	dw .seq_2656	;4F: Squawks hit
	dw .seq_2628	;50: Invincibility
	dw .seq_2621	;51: Kruncha roar
	dw .seq_2609	;52: Barrel rolling
	dw .seq_25F8	;53: Rambi attacking
	dw .seq_25E9	;54: Rambi footstep
	dw .seq_258B	;55: Kongs transforming into animal (semi-unused)
	dw .seq_2580	;56: Hero Coin collection
	dw .seq_2575	;57: Necky defeated
	dw .seq_2566	;58: Cat O' 9 Tails defeated
	dw .seq_2557	;59: Kudgel hit
	dw .seq_2539	;5A: K. Rool knocked out
	dw .seq_252F	;5B: K. Rool falling into water
	dw .seq_2523	;5C: K. Rool falling into water (lower pitch; unused?)
	dw .seq_2516	;5D: Klinger hit
	dw .seq_24E5	;5E: Pause/unpause
	dw .seq_24D2	;5F: Incorrect answer/menu unavailable option
.pointers_end:

.seq_24D2:
	db !set_instrument, $8F
	db !set_vol_single_val, $6E
	db $85, $09
	db !set_vol_single_val, $32
	db $85, $03
	db !set_vol_single_val, $6E
	db $81, $10
	db !set_vol_single_val, $32
	db $81, $08
	db !end_sequence

.seq_24E5:
	db !set_instrument, $8B
	db !set_adsr, $8F, $FA
	db !change_instr_pitch, $14
	db !fine_tune, $F2
	db !set_vol_single_val, $32
	db $81, $06
	db !play_subsequence : dw .subseq_2505
	db !set_vol_single_val, $14
	db !play_subsequence : dw .subseq_2505
	db !set_vol_single_val, $0A
	db !play_subsequence : dw .subseq_2505
	db !set_vol_single_val, $06
	db !play_subsequence : dw .subseq_2505
	db !end_sequence

.subseq_2505:
	db $88, $06
	db $8D, $06
	db $94, $06
	db $A0, $06
	db $94, $06
	db $8D, $06
	db $88, $06
	db $81, $06
	db !return_from_sub

.seq_2516:
	db !set_instrument, $08
	db !set_vol_single_val, $64
	db !pitch_slide_up, $00, $02, $16, $16, $00
	db $90, $20
	db !end_sequence

.seq_2523:
	db !set_instrument, $94
	db !set_vol_single_val, $7F
	db !set_adsr, $8F, $EB
	db $80, $08
	db $8F, $58
	db !end_sequence

.seq_252F:
	db !set_instrument, $94
	db !set_vol_single_val, $7F
	db !set_adsr, $8F, $EB
	db $8E, $60
	db !end_sequence

.seq_2539:
	db !set_instrument, $08
	db !set_adsr, $8D, $E0
	db !set_vol_single_val, $78
	db $90, $14
	db !set_vol_single_val, $28
	db $90, $14
	db !set_vol_single_val, $14
	db $90, $14
	db !set_vol_single_val, $0A
	db $90, $14
	db !set_vol_single_val, $06
	db $90, $14
	db !set_vol_single_val, $03
	db $90, $14
	db !end_sequence

.seq_2557:
	db !set_instrument, $9A
	db !set_vol_single_val, $6E
	db $81, $2A
	db !set_vol_single_val, $32
	db $81, $2A
	db !set_vol_single_val, $19
	db $81, $2A
	db !end_sequence

.seq_2566:
	db !set_instrument, $06
	db !set_vol_single_val, $5A
	db !pitch_slide_down, $00, $02, $0B, $16, $00
	db !change_instr_pitch_rel, $FC
	db $81, $18
	db !end_sequence

.seq_2575:
	db !set_instrument, $C4
	db !set_vol_single_val, $78
	db $86, $14
	db !set_vol_single_val, $28
	db $86, $14
	db !end_sequence

.seq_2580:
	db !change_instr_pitch, $09
	db !play_subsequence : dw .subseq_2985
	db !change_instr_pitch, $0C
	db !play_subsequence : dw .subseq_2985
	db !end_sequence

.seq_258B:
	db !echo_on
	db !set_vol_single_val, $14
	db !set_instrument, $01
	db $99, $06
	db !set_instrument, $00
	db $91, $06
	db !set_vol_single_val, $1E
	db !set_instrument, $06
	db $90, $06
	db !set_instrument, $00
	db $8E, $06
	db !set_vol_single_val, $28
	db !set_instrument, $02
	db $99, $06
	db !set_instrument, $00
	db $8E, $06
	db !set_vol_single_val, $32
	db !set_instrument, $03
	db $99, $06
	db !set_instrument, $00
	db $8E, $06
	db !set_vol_single_val, $3C
	db !set_instrument, $02
	db $99, $06
	db !set_instrument, $00
	db $8E, $06
	db !set_vol_single_val, $46
	db !set_instrument, $01
	db $99, $06
	db !set_instrument, $00
	db $91, $06
	db !set_instrument, $04
	db $99, $08
	db $98, $08
	db !set_instrument, $00
	db $90, $06
	db $91, $06
	db !set_instrument, $04
	db $98, $08
	db $97, $08
	db !set_instrument, $00
	db $90, $06
	db $8F, $06
	db !set_instrument, $04
	db $9A, $08
	db $99, $08
	db $98, $08
	db !end_sequence

.seq_25E9:
	db !set_instrument, $00
	db !set_vol_single_val, $3C
	db !set_adsr, $AD, $B4
	db $99, $02
	db !set_adsr, $8D, $EA
	db $8E, $06
	db !end_sequence

.seq_25F8:
	db !set_instrument, $07
	db !set_vol_single_val, $78
	db !pitch_slide_up, $00, $01, $16, $16, $00
	db !change_instr_pitch, $FB
	db $81, $11
	db $85, $10
	db !end_sequence

.seq_2609:
	db !set_instrument, $A5
	db !set_vol_single_val, $55
	db !set_adsr, $88, $E0
	db !pitch_slide_down, $00, $01, $21, $21, $07
.loop_point_2616:
	db $85, $1A
	db $81, $1A
	db $85, $1A
	db $82, $1A
	db !jump_to_sequence : dw .loop_point_2616

.seq_2621:
	db !set_instrument, $9A
	db !set_vol_single_val, $7F
	db $81, $2A
	db !end_sequence

.seq_2628:
	db !change_instr_pitch, $08
	db !fine_tune, $E9
	db !set_vol_single_val, $78
	db !set_adsr, $ED, $5C
.loop_point_2631:
	db !set_default_duration, $09
	db !set_instrument, $43
	db $99
	db !set_instrument, $47
	db $94
	db !set_instrument, $49
	db $99
	db !set_instrument, $4B
	db $A0
	db !set_instrument, $4D
	db $A5
	db !set_instrument, $4D
	db $8D
	db !set_instrument, $49
	db $94
	db !set_instrument, $4B
	db $A5
	db !set_instrument, $43
	db $A0
	db !set_instrument, $47
	db $94
	db !default_duration_off
	db !jump_to_sequence : dw .loop_point_2631
	db !end_sequence

.seq_2656:
	db !set_instrument, $BC
	db !set_vol_single_val, $78
	db $8A, $0A
	db $89, $0B
	db $88, $0C
	db $87, $0D
	db $86, $0E
	db !end_sequence

.seq_2665:
	db !set_instrument, $01
	db !change_instr_pitch, $00
	db !set_vol_single_val, $7E
	db !set_adsr, $85, $C0
.loop_point_266E:
	db !fine_tune, $00
	db $8A, $20
	db !fine_tune, $E2
	db $8A, $20
	db !fine_tune, $0A
	db $8A, $20
	db !fine_tune, $EC
	db $8A, $20
	db !jump_to_sequence : dw .loop_point_266E

.seq_2681:
	db !set_vol_single_val, $50
	db !set_adsr, $8B, $E0
	db !set_instrument, $00
	db $AB, $03
	db $AC, $03
	db $AD, $03
	db $AE, $03
	db !set_instrument, $8F
	db !set_vol_single_val, $1E
	db !change_instr_pitch, $F4
	db !set_adsr, $AD, $59
	db !pitch_slide_up, $00, $01, $21, $16, $00
	db $8D, $18
	db !end_sequence

.seq_26A2:
	db !set_instrument, $00
	db !set_vol_single_val, $78
	db $8D, $0E
	db !set_vol_single_val, $28
	db $8D, $0E
	db !set_vol_single_val, $14
	db $8D, $0E
	db !end_sequence

.seq_26B1:
	db !set_instrument, $0A
	db !fine_tune, $AB
	db !set_adsr, $8F, $F7
	db !set_volume_l_and_r, $64, $3C
	db $8E, $04
	db $8D, $06
	db $85, $06
	db !set_volume_l_and_r, $32, $50
	db $8F, $04
	db $8C, $06
	db $86, $06
	db !set_volume_l_and_r, $64, $64
	db !set_adsr, $8F, $E0
	db $81, $40
	db !end_sequence

.seq_26D3:
	db !set_instrument, $0D
	db !change_instr_pitch, $F2
	db !set_adsr, $8F, $C6
	db !set_vol_single_val, $7F
	db $87, $08
	db $85, $08
	db $86, $10
	db !set_vol_single_val, $28
	db $85, $10
	db !set_vol_single_val, $14
	db $84, $10
	db !end_sequence

.seq_26EB:
	db !set_instrument, $53
	db !set_adsr, $8E, $EE
	db !pitch_slide_up, $00, $01, $2C, $42, $02
	db !change_instr_pitch, $F4
	db !vibrato, $0B, $02, $13
	db !set_vol_single_val, $32
	db $83, $18
	db !set_vol_single_val, $08
	db $83, $18
	db !end_sequence

.seq_2705:
	db !set_instrument, $53
	db !set_adsr, $8E, $EE
	db !pitch_slide_up, $00, $01, $2C, $42, $02
	db !change_instr_pitch, $F4
	db !vibrato, $0B, $02, $13
	db !set_vol_single_val, $1E
	db $83, $11
	db !set_vol_single_val, $05
	db $83, $11
	db !end_sequence

.seq_271F:
	db !set_instrument, $0E
	db !change_instr_pitch, $FB
.loop_point_2723:
	db !set_vol_single_val, $64
	db $84, $0E
	db !set_vol_single_val, $1E
	db $84, $0E
	db !set_vol_single_val, $0F
	db $84, $0E
	db !end_sequence

.seq_2730:
	db !set_instrument, $0E
	db !set_adsr, $FD, $80
	db !jump_to_sequence : dw .loop_point_2723

.seq_2738:
	db !set_instrument, $9F
	db !set_vol_single_val, $78
	db !change_instr_pitch, $F0
	db !pitch_slide_down, $00, $01, $16, $02, $00
	db $94, $20
	db !end_sequence

.seq_2747:
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_vol_single_val, $32
	db !pitch_slide_down, $00, $03, $16, $21, $00
	db !vibrato_with_delay, $03, $02, $0B, $01
	db $8D, $30
	db !end_sequence

.seq_275D:
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_vol_single_val, $16
	db $80, $0E
	db !pitch_slide_down, $00, $03, $16, $21, $00
	db !vibrato_with_delay, $03, $02, $0B, $01
	db $8D, $30
	db !end_sequence

.seq_2775:
	db !set_instrument, $0A
	db !set_vol_single_val, $5A
	db !set_adsr, $8B, $E0
	db !change_instr_pitch, $F4
	db !pitch_slide_up, $00, $05, $0B, $0B, $00
	db $81, $40
	db !end_sequence

.seq_2787:
	db !set_instrument, $A5
	db !set_vol_single_val, $5A
	db !set_adsr, $8D, $E0
	db !change_instr_pitch, $00
	db $80, $04
	db $8D, $06
	db $8E, $08
	db $85, $08
	db $84, $08
	db $83, $08
	db !end_sequence

.seq_279D:
	db !set_vol_single_val, $50
	db !set_adsr, $8F, $E0
	db !set_instrument, $04
	db $99, $0C
	db !set_instrument, $02
	db $99, $0C
	db !end_sequence

.seq_27AB:
	db !echo_on
	db !set_instrument, $C6
	db !set_vol_single_val, $28
	db !vibrato_with_delay, $02, $02, $0F, $05
	db !set_adsr, $98, $E0
	db !long_duration_on
	db $85, $FF, $FF
	db !long_duration_off
	db !echo_off
	db !vibrato_off
	db !end_sequence

.seq_27C0:
	db !change_tempo_rel, $05
	db !end_sequence

.seq_27C3:
	db !echo_on
	db !set_instrument, $C6
	db !set_vol_single_val, $28
	db !vibrato_with_delay, $02, $04, $12, $05
	db !set_adsr, $98, $E0
	db !long_duration_on
	db $8D, $FF, $FF
	db !long_duration_off
	db !echo_off
	db !vibrato_off
	db !end_sequence

.seq_27D8:
	db !set_instrument, $4D
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !echo_on
	db !set_volume_l_and_r, $5A, $6E
	db !set_adsr, $8E, $F2
	db !pitch_slide_up, $02, $02, $0F, $2D, $00
	db $94, $48
	db !pitch_slide_off
	db !end_sequence

.seq_27EF:
	db !set_instrument, $4D
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !echo_on
	db !set_volume_l_and_r, $6E, $5A
	db !set_adsr, $8E, $F1
	db !pitch_slide_up, $02, $02, $0F, $2C, $00
	db $8D, $48
	db !pitch_slide_off
	db !end_sequence

.seq_2806:
	db !set_instrument, $0A
	db !set_volume_l_and_r, $64, $64
	db $92, $02
	db $81, $0E
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !set_adsr, $DE, $5C
	db !echo_on
	db !set_volume_l_and_r, $04, $14
	db !set_instrument, $43
	db !set_default_duration, $06
	db $99
	db !set_volume_l_and_r, $14, $04
	db !set_instrument, $49
	db $A0
	db !set_volume_l_and_r, $04, $14
	db !set_instrument, $47
	db $A5
	db !set_volume_l_and_r, $14, $04
	db !set_instrument, $4D
	db $AC
	db !set_volume_l_and_r, $04, $14
	db !set_instrument, $4B
	db $99
	db !set_volume_l_and_r, $14, $04
	db !set_instrument, $43
	db $A0
	db !set_volume_l_and_r, $03, $10
	db !set_instrument, $49
	db $A5
	db !set_volume_l_and_r, $0C, $02
	db !set_instrument, $47
	db $AC
	db !set_volume_l_and_r, $01, $08
	db !set_instrument, $4D
	db $A5
	db !set_volume_l_and_r, $04, $00
	db !set_instrument, $4B
	db $AC
	db !default_duration_off
	db !end_sequence

.seq_2857:
	db !change_instr_pitch, $05
	db !fine_tune, $E9
	db !set_adsr, $DE, $5C
	db !echo_on
	db !set_default_duration, $06
	db !set_volume_l_and_r, $3C, $0A
	db !set_instrument, $43
	db $99
	db !set_volume_l_and_r, $0A, $3C
	db !set_instrument, $49
	db $A0
	db !set_volume_l_and_r, $3C, $0A
	db !set_instrument, $47
	db $A5
	db !set_volume_l_and_r, $0A, $3C
	db !set_instrument, $4D
	db $AC
	db !set_volume_l_and_r, $3C, $0A
	db !set_instrument, $4B
	db $99
	db !set_volume_l_and_r, $0A, $3C
	db !set_instrument, $43
	db $A0
	db !set_volume_l_and_r, $32, $08
	db !set_instrument, $49
	db $A5
	db !set_volume_l_and_r, $06, $28
	db !set_instrument, $47
	db $AC
	db !set_volume_l_and_r, $1E, $04
	db !set_instrument, $4D
	db $A5
	db !set_volume_l_and_r, $02, $14
	db !set_instrument, $4B
	db $AC
	db !default_duration_off
	db !end_sequence

.seq_289F:
	db !set_instrument, $8B
	db !set_adsr, $8F, $FA
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db !change_instr_pitch, $0C
	db !fine_tune, $E9
	db !play_subsequence : dw .subseq_29BA
	db !end_sequence

.seq_28B0:
	db !set_instrument, $0D
	db !set_adsr, $EF, $AB
	db !set_default_duration, $04
	db !set_vol_single_val, $50
	db $8D
	db $94
	db $99
	db $A0
	db $A5
	db !set_vol_single_val, $1E
	db $99
	db $A0
	db $A5
	db !set_vol_single_val, $04
	db $A0
	db $A5
	db !default_duration_off
	db !end_sequence

.seq_28C9:
	db !change_instr_pitch, $0A
	db !play_subsequence : dw .subseq_2985
	db !end_sequence

.seq_28CF:
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_vol_single_val, $64
	db !set_adsr, $AD, $B2
	db !pitch_slide_up, $00, $02, $16, $17, $00
	db !vibrato_with_delay, $03, $02, $0B, $01
	db $8D, $20
	db !pitch_slide_off
	db !set_adsr, $EE, $31
	db !change_instr_pitch_rel, $10
	db !set_vol_single_val, $28
	db !set_default_duration, $06
	db $99
	db $94
	db $91
	db $8D
	db $91
	db $94
	db !default_duration_off
	db $99, $10
	db !end_sequence

.seq_28FB:
	db !set_instrument, $2B
	db !set_vol_single_val, $19
	db !set_adsr, $9F, $B3
	db !vibrato_with_delay, $06, $02, $11, $03
	db $A0, $05
	db $A4, $05
	db $A7, $05
	db $AC, $23
	db !end_sequence

.seq_2910:
	db !set_instrument, $2B
	db !set_vol_single_val, $1E
	db !set_adsr, $9F, $B3
	db !vibrato_with_delay, $06, $02, $11, $03
	db $A2, $30
	db !end_sequence

.seq_291F:
	db !set_instrument, $C4
	db !set_adsr, $8E, $F4
	db !set_vol_single_val, $78
	db $87, $16
	db !set_vol_single_val, $28
	db $87, $16
	db !set_vol_single_val, $14
	db $87, $16
	db !jump_to_sequence : dw .loop_point_2933

.seq_2933:
.loop_point_2933:
	db !set_instrument, $A1
	db !set_vol_single_val, $7F
	db $98, $0B
	db !set_vol_single_val, $2C
	db $98, $0B
	db !set_vol_single_val, $17
	db $98, $0B
	db !end_sequence

.seq_2942:
	db !set_instrument, $A1
	db !set_vol_single_val, $78
	db $9A, $0A
	db !set_vol_single_val, $28
	db $9A, $0A
	db !set_vol_single_val, $14
	db $9A, $0A
	db !end_sequence

.seq_2951:
	db !set_instrument, $BC
	db !set_adsr, $8F, $EB
	db !set_vol_single_val, $64
	db $8E, $0A
	db !set_vol_single_val, $1E
	db $8E, $0A
	db !end_sequence

.seq_295F:
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_vol_single_val, $28
	db !set_adsr, $8D, $E1
	db !vibrato_with_delay, $03, $01, $02, $0F
	db !echo_on
	db $A2, $0B
	db $80, $01
	db $9F, $07
	db $80, $01
	db $A2, $03
	db $80, $01
	db $A7, $10
	db !end_sequence

.seq_297F:
	db !change_instr_pitch, $08
	db !play_subsequence : dw .subseq_2985
	db !end_sequence

.subseq_2985:
	db !set_vol_single_val, $48
	db !set_instrument, $8B
	db !set_adsr, $8F, $FA
	db !fine_tune, $F2
	db !set_adsr, $AF, $91
	db !set_default_duration, $06
	db $97
	db $9B
	db $9E
	db $A0
	db $A3
	db !set_vol_single_val, $1B
	db $9E
	db $A0
	db $A3
	db !set_vol_single_val, $12
	db $9E
	db $A0
	db $A3
	db !set_vol_single_val, $09
	db $9E
	db $A0
	db $A3
	db !default_duration_off
	db !return_from_sub

.seq_29A9:
	db !set_instrument, $8B
	db !set_adsr, $8F, $FA
	db !change_instr_pitch, $08
	db !fine_tune, $F2
	db !change_instr_pitch, $07
	db !fine_tune, $E9
	db !play_subsequence : dw .subseq_29BA
	db !end_sequence

.subseq_29BA:
	db !set_adsr, $AF, $91
	db !set_volume_l_and_r, $50, $50
	db !set_instrument, $43
	db !set_default_duration, $07
	db $A0
	db $AC
	db !set_volume_l_and_r, $1E, $1E
	db !set_instrument, $47
	db $A0
	db $AC
	db !set_volume_l_and_r, $14, $14
	db !set_instrument, $49
	db $A0
	db $AC
	db !set_volume_l_and_r, $0A, $0A
	db !set_instrument, $4B
	db $A0
	db $AC
	db !default_duration_off
	db !return_from_sub

.seq_29DD:
	db !set_instrument, $0A
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $64
	db $99, $0A
	db !set_vol_single_val, $28
	db $99, $0A
	db !set_vol_single_val, $14
	db $99, $0A
	db !end_sequence

.seq_29EF:
	db !change_instr_pitch, $1A
	db !fine_tune, $E9
	db !jump_to_sequence : dw .loop_point_2A0E
	db !end_sequence

.seq_29F7:
	db !change_instr_pitch, $17
	db !fine_tune, $E9
	db !jump_to_sequence : dw .loop_point_2A0E
	db !end_sequence

.seq_29FF:
	db !change_instr_pitch, $14
	db !fine_tune, $E9
	db !jump_to_sequence : dw .loop_point_2A0E
	db !end_sequence

.seq_2A07:
	db !change_instr_pitch, $11
	db !fine_tune, $E9
	db !jump_to_sequence : dw .loop_point_2A0E

.loop_point_2A0E:
	db !pitch_slide_off
	db !vibrato_off
	db !set_vol_single_val, $28
	db !set_instrument, $43
	db $96, $04
	db !set_instrument, $47
	db !set_default_duration, $02
	db $9A
	db !set_vol_single_val, $0F
	db !set_instrument, $43
	db $96
	db !set_vol_single_val, $28
	db !set_instrument, $49
	db $9D
	db !set_vol_single_val, $0F
	db !set_instrument, $47
	db $9A
	db !set_vol_single_val, $28
	db !set_instrument, $4B
	db $9F
	db !set_vol_single_val, $0F
	db !set_instrument, $49
	db $9D
	db !set_vol_single_val, $28
	db !set_instrument, $47
	db $96
	db !set_vol_single_val, $0F
	db !set_instrument, $4B
	db $9F
	db !set_vol_single_val, $28
	db !set_instrument, $49
	db $9A
	db !set_vol_single_val, $0F
	db !set_instrument, $47
	db $96
	db !set_vol_single_val, $28
	db !set_instrument, $4B
	db $9D
	db !set_vol_single_val, $0F
	db !set_instrument, $49
	db $9A
	db !set_vol_single_val, $28
	db !set_instrument, $4D
	db $A2
	db !set_vol_single_val, $0F
	db !set_instrument, $4B
	db $9D
	db !set_vol_single_val, $14
	db !set_instrument, $47
	db $96
	db !set_vol_single_val, $08
	db !set_instrument, $4B
	db $A2
	db !set_vol_single_val, $14
	db !set_instrument, $49
	db $9A
	db !set_vol_single_val, $07
	db !set_instrument, $47
	db $96
	db !set_vol_single_val, $14
	db !set_instrument, $4B
	db $9D
	db !set_vol_single_val, $07
	db !set_instrument, $49
	db $9A
	db !set_vol_single_val, $14
	db !set_instrument, $4D
	db $A2
	db !default_duration_off
	db !set_vol_single_val, $07
	db !set_instrument, $4B
	db $9D, $04
	db $A2, $04
	db !end_sequence

.seq_2A89:
	db !set_instrument, $0A
	db !set_adsr, $87, $E0
	db !pitch_slide_up, $00, $01, $2C, $2C, $01
	db !set_vol_single_val, $3C
	db $95, $14
	db !set_vol_single_val, $14
	db $95, $14
	db !end_sequence

.seq_2A9D:
	db !set_instrument, $0A
	db !set_vol_single_val, $7F
	db !set_adsr, $85, $E0
	db !pitch_slide_up, $00, $01, $37, $37, $02
	db $9A, $0B
	db !end_sequence

.seq_2AAD:
	db !set_instrument, $9F
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $3C
	db $9E, $0A
	db $9E, $0A
	db !end_sequence

.seq_2AB9:
	db !set_instrument, $0A
	db !set_vol_single_val, $46
	db !set_adsr, $85, $E0
	db !pitch_slide_up, $00, $01, $4D, $4D, $01
	db $90, $0A
	db !end_sequence

.seq_2AC9:
	db !set_instrument, $8F
	db !change_instr_pitch, $F8
	db !fine_tune, $FC
	db !set_vol_single_val, $21
	db !set_adsr, $AD, $B2
	db $80, $0E
	db !pitch_slide_up, $00, $02, $16, $17, $00
	db !vibrato_with_delay, $03, $02, $0B, $01
	db $8D, $20
	db !pitch_slide_off
	db !set_adsr, $EE, $31
	db !change_instr_pitch_rel, $10
	db !set_vol_single_val, $0F
	db $99, $06
	db $94, $06
	db $91, $06
	db $8D, $06
	db $91, $06
	db $94, $06
	db $99, $10
	db !end_sequence

.unreached_2AFA:
	db !end_sequence

.seq_2AFB:
	db !set_instrument, $43
	db !noise_on
	db !echo_on
	db !set_adsr, $88, $D3
	db !set_vol_single_val, $07
	db !dsp_flag, $1A
	db $99, $20
	db !noise_off
	db !end_sequence

.unreached_2B0A:
	db !end_sequence

.seq_2B0B:
	db !set_instrument, $11
	db !set_vol_single_val, $50
	db $95, $18
	db $94, $18
	db $93, $18
	db $93, $18
	db !end_sequence

.seq_2B18:
	db !set_instrument, $D8
	db !set_vol_single_val, $7F
	db !set_adsr, $8B, $EF
	db !pitch_slide_down, $14, $01, $21, $05, $00
	db $89, $38
	db !end_sequence

.seq_2B28:
	db !set_instrument, $D7
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $64
	db $90, $10
	db !set_vol_single_val, $1E
	db $92, $10
	db !end_sequence

.seq_2B36:
	db !set_instrument, $D8
	db !change_instr_pitch, $E8
	db !set_vol_single_val, $7F
	db !set_adsr, $8E, $F1
	db !pitch_slide_up, $00, $03, $0B, $0B, $01
	db $8C, $28
	db !end_sequence

.seq_2B48:
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

.seq_2B60:
	db !echo_on
	db !set_instrument, $00
	db !change_instr_pitch, $FB
	db !set_vol_single_val, $3C
	db !set_default_duration, $08
	db $AA
	db !set_vol_single_val, $14
	db $AA
	db !set_vol_single_val, $3C
	db $AA
	db !set_vol_single_val, $14
	db $AA
	db !set_vol_single_val, $3C
	db $AA
	db !set_vol_single_val, $14
	db $AA
	db !default_duration_off
	db $80, $0E
	db !change_instr_pitch, $00
	db !set_instrument, $04
	db !set_vol_single_val, $32
	db !set_default_duration, $0A
	db $9E
	db !set_vol_single_val, $14
	db $9E
	db !set_vol_single_val, $32
	db $9D
	db !set_vol_single_val, $14
	db $9D
	db !set_vol_single_val, $32
	db $9D
	db !set_vol_single_val, $14
	db $9D
	db !set_vol_single_val, $32
	db $9C
	db !set_vol_single_val, $14
	db $9C
	db !default_duration_off
	db !end_sequence

.seq_2B9C:
	db !set_instrument, $0A
	db !set_vol_single_val, $50
	db !set_adsr, $8F, $EB
	db $8E, $06
	db !set_vol_single_val, $41
	db $85, $28
	db !end_sequence

.seq_2BAA:
	db !set_instrument, $0A
	db !change_instr_pitch, $F4
	db !fine_tune, $AB
	db !set_vol_single_val, $7F
	db !pitch_slide_up, $05, $08, $21, $21, $00
	db $81, $38
	db !pitch_slide_off
	db !change_instr_pitch, $00
	db !set_vol_single_val, $64
	db !set_instrument, $0C
	db $81, $06
	db !set_instrument, $0D
	db $81, $06
	db !set_instrument, $00
	db $8D, $06
	db !set_instrument, $A5
	db $81, $06
	db !set_vol_single_val, $3C
	db !set_instrument, $0C
	db $85, $04
	db $82, $04
	db !set_instrument, $0D
	db $81, $06
	db !set_instrument, $00
	db $8D, $06
	db !set_instrument, $A5
	db $82, $06
	db !set_vol_single_val, $1E
	db !set_instrument, $0C
	db $81, $06
	db !set_instrument, $0D
	db $84, $06
	db !set_instrument, $00
	db $8D, $06
	db !set_instrument, $A5
	db $83, $18
	db !end_sequence

.seq_2BF6:
	db !set_instrument, $08
	db !set_vol_single_val, $64
	db $8F, $1D
	db !end_sequence

.seq_2BFD:
	db !set_instrument, $0F
	db !set_adsr, $8F, $E0
	db !set_vol_single_val, $50
	db $90, $0C
	db !end_sequence

.seq_2C07:
	db !set_instrument, $10
	db !set_vol_single_val, $66
	db $8D, $1C
	db !end_sequence

.seq_2C0E:
	db !set_instrument, $0A
	db !fine_tune, $AB
	db !set_adsr, $8F, $F7
	db !set_volume_l_and_r, $5A, $3C
	db $8E, $04
	db $8D, $06
	db $85, $06
	db !set_volume_l_and_r, $32, $50
	db $8F, $04
	db $8C, $06
	db $86, $06
	db !set_volume_l_and_r, $46, $28
	db $8D, $04
	db $8A, $06
	db $89, $06
	db !set_volume_l_and_r, $64, $64
	db !set_adsr, $8F, $EA
	db $81, $10
	db $85, $10
	db !set_adsr, $8F, $E0
	db $81, $40
	db !end_sequence

.seq_2C40:
	db !set_instrument, $0A
	db !change_instr_pitch, $F4
	db !fine_tune, $AB
	db !set_vol_single_val, $6E
	db !pitch_slide_up, $05, $08, $21, $21, $00
	db $81, $90
	db !pitch_slide_off
	db !end_sequence

.seq_2C52:
	db !set_instrument, $00
	db !set_adsr, $8B, $E0
	db !set_vol_single_val, $3C
	db $A8, $04
	db !set_vol_single_val, $50
	db $A8, $08
	db !end_sequence

.seq_2C60:
	db !set_instrument, $9A
	db !set_vol_single_val, $78
	db $88, $16
	db !set_vol_single_val, $50
	db $88, $16
	db !set_vol_single_val, $32
	db $88, $16
	db !set_vol_single_val, $1E
	db $88, $16
	db !set_vol_single_val, $0F
	db $88, $16
	db !end_sequence

.seq_2C77:
	db !set_instrument, $0B
	db !set_vol_single_val, $32
	db $89, $2E
	db !end_sequence

.seq_2C7E:
	db !set_instrument, $0E
	db !set_vol_single_val, $64
	db !set_adsr, $BF, $EC
	db !pitch_slide_up, $00, $01, $16, $16, $01
	db $8E, $18
	db !end_sequence

.seq_2C8E:
	db !set_instrument, $0D
	db !set_vol_single_val, $14
	db !set_adsr, $DF, $32
	db $AA, $0A
	db !fine_tune, $E2
	db $AA, $0A
	db !end_sequence

.seq_2C9C:
	db !echo_on
	db !set_instrument, $C6
	db !set_vol_single_val, $7F
	db !vibrato_with_delay, $02, $04, $12, $05
	db !set_adsr, $AE, $AB
	db !pitch_slide_down, $02, $03, $16, $2C, $01
	db $91, $28
	db !end_sequence

.seq_2CB2:
	db !set_instrument, $43
	db !set_vol_single_val, $7F
	db !pitch_slide_up, $00, $01, $2C, $2C, $03
	db !set_adsr, $AE, $F5
	db $92, $1A
	db !end_sequence

.seq_2CC2:
	db !set_instrument, $0A
	db !set_vol_single_val, $78
	db !set_adsr, $8F, $EF
	db !pitch_slide_up, $0C, $01, $0B, $17, $01
	db $85, $06
	db $81, $30
	db !end_sequence

.seq_2CD4:
	db !set_instrument, $43
	db !noise_on
	db !dsp_flag, $18
	db !set_vol_single_val, $12
	db !set_adsr, $89, $E0
	db $8E, $07
	db !set_vol_single_val, $05
	db !set_adsr, $8F, $F2
	db $8E, $10
	db !noise_off
	db !end_sequence

.seq_2CE9:
	db !set_instrument, $09
	db !set_volume_l_and_r, $7F, $7F
	db !set_adsr, $9E, $D7
	db !pitch_slide_up, $00, $01, $07, $0B, $00
	db !set_default_duration, $04
	db $8A
	db $9A
	db $8A
	db $8A
	db !set_default_duration, $08
	db $8D
	db $8D
	db $8F
	db $8A
	db $8D
	db $8D
	db $8F
	db $8A
	db !set_vol_single_val, $70
	db $93
	db $93
	db $8F
	db $9A
	db !set_vol_single_val, $60
	db $91
	db $92
	db $8A
	db $8E
	db !set_vol_single_val, $50
	db $8D
	db $8D
	db $8F
	db $8A
	db !set_vol_single_val, $40
	db $8D
	db $8D
	db $8F
	db $8A
	db !set_vol_single_val, $30
	db $93
	db $93
	db $8F
	db $8A
	db !set_vol_single_val, $20
	db $91
	db $92
	db $8A
	db $8E
	db !default_duration_off
	db !end_sequence

.seq_2D2D:
	db !set_instrument, $0C
	db !set_vol_single_val, $60
	db !set_default_duration, $04
	db $8F
	db $96
	db $9B
	db $A2
	db $A7
	db !set_vol_single_val, $28
	db $8F
	db $96
	db $9B
	db $A2
	db $A7
	db !set_vol_single_val, $14
	db $8F
	db $96
	db $9B
	db $A2
	db $A7
	db !set_vol_single_val, $0A
	db $8F
	db $96
	db $9B
	db $A2
	db $A7
	db !set_vol_single_val, $05
	db $8F
	db $96
	db $9B
	db $A2
	db $A7
	db !default_duration_off
	db !end_sequence

.seq_2D56:
	db !set_instrument, $0C
	db !set_vol_single_val, $3C
	db !set_default_duration, $04
	db $8D
	db !set_vol_single_val, $5A
	db $99
	db $A5
	db !set_vol_single_val, $19
	db $99
	db $A5
	db !default_duration_off
	db !end_sequence

.seq_2D67:
	db !set_instrument, $06
	db !set_vol_single_val, $50
	db $8F, $18
	db !end_sequence

.seq_2D6E:
	db !set_instrument, $06
	db !set_vol_single_val, $50
	db $88, $1C
	db !end_sequence

.seq_2D75:
	db !set_instrument, $0D
	db !set_vol_single_val, $28
	db !set_adsr, $8F, $F4
	db !set_default_duration, $04
	db $A0
	db $A5
	db $A0
	db $A5
	db !default_duration_off
	db $80, $10
	db !set_vol_single_val, $3C
	db !set_adsr, $8F, $E0
	db !set_instrument, $00
	db $92, $02
	db !set_instrument, $01
	db $90, $0C
	db $80, $0C
	db !set_instrument, $03
	db $99, $07
	db $9A, $06
	db $98, $07
	db $98, $07
	db $96, $08
	db !end_sequence

.seq_2DA1:
	db !set_instrument, $0D
	db !set_adsr, $8F, $F4
	db !pitch_slide_down, $01, $01, $21, $21, $00
	db !set_vol_single_val, $64
	db $85, $0E
	db !set_vol_single_val, $1E
	db $85, $0E
	db !pitch_slide_off
	db !end_sequence

.seq_2DB6:
	db !set_vol_single_val, $3C
	db !set_default_duration, $10
	db !set_instrument, $01
	db $99
	db $99
	db !set_instrument, $02
	db $99
	db !set_instrument, $03
	db $99
	db !set_instrument, $04
	db $99
	db $98
	db $98
	db !default_duration_off
	db !end_sequence

.seq_2DCB:
	db !set_instrument, $A5
	db !set_vol_single_val, $50
	db !set_adsr, $AF, $B4
	db $8D, $04
	db !set_adsr, $8F, $EA
	db $82, $06
	db !end_sequence

.seq_2DDA:
	db !end_sequence

.seq_2DDB:
	db !set_volume_l_and_r, $00, $00
.loop_point_2DDE:
	db $80, $08
	db !jump_to_sequence : dw .loop_point_2DDE

base off
arch 65816
.end: