!spc_base_eng_loc	= $04D8			;Starting ARAM location of SPC base engine (default: $04D8)
!spc_base_eng_len	= spc_sound_engine-spc_base_engine	;Length to upload for SPC base engine (default $88)
!spc_sound_eng_loc	= $0560			;Starting ARAM location of SPC sound engine (default: $0560)
!spc_sound_eng_len	= ((sample_table-spc_sound_engine)+((sample_table-spc_sound_engine)&$0001))>>1 ;Number of words to upload for SPC sound engine (default $067F)

!bgm_loc 		= $1300			;Starting ARAM location of music block (default: $1300)
!bgm_ptr_loc		= !bgm_loc+$12		;Starting ARAM location of music pointers (default: $1312)

!snd_loc 		= $2410			;Starting ARAM location of global sound effect block (default: $2410)
!snd_ptr_loc		= !snd_loc+$2		;Starting ARAM location of global sound effect pointers (default: $2412)

!dyn_snd_loc 		= $2E94			;Starting ARAM location of track-specific sound effect block (default: $2E94)
!dyn_snd_ptr_loc	= !dyn_snd_loc+$2	;Starting ARAM location of track-specific sound effect pointers (default: $2E96)
!dyn_snd_base_id	= $60			;Base ID of track-specific sound effects (default: $60)

!src_dir_loc		= $3100			;Starting ARAM destination of BRR sample source directory (default: $3100)
!brr_data_loc		= $3400			;Starting ARAM destination of BRR sample uploads (default: $3400)

!end_sequence 			= $00	;00				End of sequence
!set_instrument 		= $01	;01 ??				Set instrument
!set_volume_l_and_r 		= $02	;02 LL RR			Set volume levels (separate values for left and right speakers)
!jump_to_sequence 		= $03	;03 yy XX			Jump to sequence data at SPC RAM address XXyy
!loop_subsequence 		= $04	;04 NN yy XX			Play subsequence at SPC RAM address XXyy NN times
!return_from_sub 		= $05	;05				End of subsequence (return to main)
!set_default_duration		= $06	;06 ??				Set and enable default note duration (if not set, must specify a note length after each note value)
!default_duration_off 		= $07	;07				Disable default note duration
!pitch_slide_up 		= $08	;08 ?? ?? ?? ?? ??   		Pitch slide up
!pitch_slide_down 		= $09	;09 ?? ?? ?? ?? ??		Pitch slide down
!pitch_slide_off 		= $0A	;0A				Pitch slide off
!change_tempo 			= $0B	;0B ??				Change tempo
!change_tempo_rel 		= $0C	;0C ??				Increase/decrease tempo relative to current tempo
!vibrato 			= $0D	;0D XX YY ZZ			Vibrato (XX = Range, YY = Rate, ZZ = depth)
!vibrato_off 			= $0E	;0E
!vibrato_with_delay 		= $0F	;0F XX YY ZZ TT			Vibrato (same as 0D, but with TT = delay)
!set_adsr 			= $10	;10 ?? ??			Attack/decay/sustain/release (ADSR) of current instrument
;!set_master_volume 		= $11	;11 LL RR			Master level (DKC1 only; LL = left, RR = right; valid range: #$00-#$7F); unimplemented in DKC2 & 3
!fine_tune 			= $12	;12 ??				Fine tune (signed)
!change_instr_pitch		= $13	;13 ??				Set instrument pitch (signed)
!change_instr_pitch_rel		= $14	;14 ??				Increase/decrease instrument pitch relative to current pitch (signed)
!set_echo 			= $15	;15 KK LL RR			Echo of entire song (KK = feedback, LL = left echo level, RR = right echo level)
!echo_on 			= $16	;16				Echo on
!echo_off 			= $17	;17				Echo off
!set_fir 			= $18	;18 ?? ?? ?? ?? ?? ?? ?? ??	Finite impulse response (FIR) filter for whole song
!dsp_flag 			= $19	;19 ??
!noise_on 			= $1A	;1A
!noise_off 			= $1B	;1B
!set_variable_note_1 		= $1C	;1C ??				?? is the note value that note $E0 will play
!set_variable_note_2 		= $1D	;1D ??				?? is the note value that note $E1 will play
!set_volume_presets		= $1E	;1E LL RR ll rr			LL and RR = left and right levels of volume preset 1; ll and rr = left and right levels of volume preset 2
!echo_delay			= $1F	;1F ??
!load_volume_preset_1 		= $20	;20				Set volume to first and second bytes of command 1E
!play_subsequence 		= $21	;21 yy XX			Play subsequence at SPC RAM address XXyy once
!set_voice_parameters 		= $22	;22 ?? ?? ?? ?? ?? ?? ??
!set_vol_single_val		= $23	;23 ??				Set volume Levels (same value for both speakers, DKC2 & 3 only)
!set_master_volume_indirect	= $24	;24 ??
!audio_command_25		= $25	;unimplemented command
!simple_pitch_slide_down	= $26	;26 ?? ?? ?? ?? ??
!simple_pitch_slide_up		= $27	;27 ?? ?? ?? ?? ??
!audio_command_28 		= $28	;unimplemented command
!audio_command_29 		= $29	;unimplemented command
!audio_command_2A 		= $2A	;unimplemented command
!long_duration_on 		= $2B	;2B
!long_duration_off 		= $2C	;2C
!audio_command_2D 		= $2D	;unimplemented command
!audio_command_2E 		= $2E	;unimplemented command
!audio_command_2F 		= $2F	;unimplemented command
!echo_off_copy_1 		= $30	;30				Duplicate of 17, 32
!load_volume_preset_2 		= $31	;31				Set volume to third and fourth bytes of command 1E
!echo_off_copy_2		= $32	;32				Duplicate of 17, 30
