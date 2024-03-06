upload_spc_engine:
	JMP .upload_spc_engine_wrapper		;$B58000   |

#queue_sound_effect:
	JMP .queue_sound_effect			;$B58003   |

#queue_song:
	JMP .queue_song				;$B58006   |

#play_queued_song:
	JMP .play_queued_song			;$B58009   |

#play_song:
	JMP .play_song				;$B5800C   |

#play_song_with_transition:
	JMP .play_song_with_transition		;$B5800F   |

#CODE_B58012:
	JMP .CODE_B581CE			;$B58012   |

#null_spc_command:
	JMP .null_spc_command			;$B58015   |

#transition_song:
	JMP .transition_song			;$B58018   |

#CODE_B5801B:
	JMP .CODE_B581C2			;$B5801B   |

#play_queued_sound_effect:
	JMP .play_queued_sound_effect		;$B5801E   |

#play_high_priority_sound:
	JMP .play_high_priority_sound		;$B58021   |

.unused_play_sound_effect
	PHB					;$B58024  \
	PHK					;$B58025   |\ Use current databank
	PLB					;$B58026   |/
	ORA #$0500				;$B58027   |\ Play sound effect on channel 5
	TAX					;$B5802A   | |
	JSR .write_spc_command			;$B5802B   |/
	PLB					;$B5802E   |
	RTL					;$B5802F  /

.queue_sound_effect
	PHB					;$B58030  \
	PHY					;$B58031   | Preserve Y (routine will only clobber A/X)
	PHK					;$B58032   |\ Use current databank
	PLB					;$B58033   |/
	LDX $0634				;$B58034   |\ If the current slot already has same the sound effect
	CMP $0622,x				;$B58037   | |
	BEQ ..return				;$B5803A   |/ skip adding it to the queue
	TAY					;$B5803C   | Preserve the sournd effect
	INX					;$B5803D   |\ Increment write ring index the next buffer slot
	INX					;$B5803E   | |
	TXA					;$B5803F   | |
	AND #$000E				;$B58040   | |
	TAX					;$B58043   |/
	LDA $0622,x				;$B58044   |\ If the slot is not empty, return -- buffer is full
	BNE ..return				;$B58047   |/
	TYA					;$B58049   | Restore the sound effect
	STA $0622,x				;$B5804A   | Write sound effect to the buffer
	STX $0634				;$B5804D   | Write new ring buffer index
..return					;	   |
	PLY					;$B58050   |\ Restore Y and databank
	PLB					;$B58051   |/
	RTL					;$B58052  /

.play_queued_sound_effect
	PHB					;$B58053  \
	PHK					;$B58054   |\ Use current databank
	PLB					;$B58055   |/
	LDA global_frame_counter		;$B58056   |\ If a sound effect was already uploaded this frame
	CMP $0636				;$B58058   | |
	BEQ ..return				;$B5805B   |/ return -- one effect per frame
	LDX $0632				;$B5805D   |\ If the sound effect slot is empty
	LDA $0622,x				;$B58060   | |
	BEQ ..return				;$B58063   |/ return -- nothing to do
	STZ $0622,x				;$B58065   | Clear slot after it is loaded
	BMI ..upgrade_sound_priority		;$B58068   | If MSB is set, the sound effect is high priority
	JSR .play_low_priority_sound		;$B5806A   | If MSB is clear, handle the sound effect as low priority
	BRA ..increment_queue			;$B5806D  / increment the sound effect read ring buffer index

..upgrade_sound_priority
	AND #$7FFF				;$B5806F  \ Mask off MSB to get the true sound effect value
	JSL .play_high_priority_sound		;$B58072   | Play the sound effect
..increment_queue				;	   |
	LDA $0632				;$B58076   |\ Increment the read ring buffer index
	INC A					;$B58079   | |
	INC A					;$B5807A   | |
	AND #$000E				;$B5807B   | |
	STA $0632				;$B5807E   |/
	LDA global_frame_counter		;$B58081   |\ Write the frame of the last sound effect upload
	STA $0636				;$B58083   |/
..return					;	   |
	PLB					;$B58086   | restore data bank
	RTL					;$B58087  /

.play_low_priority_sound
	SEP #$30				;$B58088  \ Enter 8 bit mode (to split sound effect and channel)
	XBA					;$B5808A   |\ Check if the target channel is already being used
	TAX					;$B5808B   | |
	LDA $0621				;$B5808C   | |
	BIT .index_to_bit,x			;$B5808F   | |
	BNE .test_sound_backup_channel		;$B58092   |/ If so, check if the backup channel is free
.write_low_priority_sound			;	   |
	TXA					;$B58094   |\ Since the channel is free
	XBA					;$B58095   | |
	STA $0619,x				;$B58096   |/ write effect id to channel buffer
	REP #$30				;$B58099   |\ Return to 16 bit mode
	TAX					;$B5809B   |/
	JMP .write_spc_command			;$B5809C  / Transfer the sound effect to the SPC700

.test_sound_backup_channel			;	  \
	LDX #$04				;$B5809F   |\ If the original channel was full, try channel 4 instead
	BIT .index_to_bit,x			;$B580A1   | |
	BEQ .write_low_priority_sound		;$B580A4   |/
	REP #$30				;$B580A6   | Otherwise restore 16  bit mode and return -- no slots left
	RTS					;$B580A8  /

.play_high_priority_sound
	SEP #$30				;$B580A9  \ Enter 8 bit mode (to split sound effect and channel)
	XBA					;$B580AB   |\ Get the sound effect channel
	AND #$0F				;$B580AC   | |
	TAX					;$B580AE   |/
	XBA					;$B580AF   |\ Write the sound effect id to the channel buffer
	STA $0619,x				;$B580B0   |/
	BEQ .reset_channel			;$B580B3   | Branch if the slot was empty
	LDA .index_to_bit,x			;$B580B5   |\ Mark the channel as used
	TSB $0621				;$B580B8   |/
	BRA .write_sound			;$B580BB  / skip marking the slot empty

.reset_channel					;	  \
	LDA .index_to_bit,x			;$B580BD   |\ Since the slot was empty mark the channel as empty
	TRB $0621				;$B580C0   |/
.write_sound					;	   |
	LDA $0619,x				;$B580C3   |\ Write the sound effect to the SPC700
	REP #$30				;$B580C6   | |
	TAX					;$B580C8   | |
	JSR .write_spc_command			;$B580C9   |/
	RTL					;$B580CC  /

.index_to_bit
	db $01, $02, $04, $08, $10, $20, $40, $80

.queue_song
	PHB					;$B580D5  \
	PHK					;$B580D6   |\ Use current databank
	PLB					;$B580D7   |/
	STA current_song			;$B580D8   | Set the active song
	LDX #$00FF				;$B580DA   |\ Place SPC engine into upload mode
	JSR .write_spc_command			;$B580DD   |/
	JSR .upload_song_sample_set		;$B580E0   |\ Upload song data, sound effects, and samples
	JSR .upload_song_data			;$B580E3   | |
	JSR .upload_song_sound_effects		;$B580E6   |/
	JSR .execute_spc_sound_engine		;$B580E9   | Resume the SPC engine main loop
	PLB					;$B580EC   |
	RTL					;$B580ED  /

.play_queued_song				;	  \
	PHB					;$B580EE   |\ Change to current databank
	PHK					;$B580EF   | |
	PLB					;$B580F0   |/
	JSR .clear_sound_buffers		;$B580F1   |
	LDX #$00FE				;$B580F4   |\ Tell the SPC engine to start playing music
	JSR .write_spc_command			;$B580F7   |/
	LDA stereo_select			;$B580FA   |\ Write mono or stereo setting to SPC engine
	XBA					;$B580FC   | |
	ORA #$00FA				;$B580FD   | |
	TAX					;$B58100   | |
	JSR .write_spc_command			;$B58101   |/
	PLB					;$B58104   | Restore databank
	RTL					;$B58105  /

.play_song
	PHB					;$B58106  \
	PHK					;$B58107   |\ Use current databank
	PLB					;$B58108   |/
	STA current_song			;$B58109   | Set the active song
	LDX #$00FF				;$B5810B   |\ Place SPC engine into upload mode
	JSR .write_spc_command			;$B5810E   |/
	JSR .upload_song_sample_set		;$B58111   |\ Upload song data, sound effects, and samples
	JSR .upload_song_data			;$B58114   | |
	JSR .upload_song_sound_effects		;$B58117   |/
	JSR .clear_sound_buffers		;$B5811A   | Clear the sound effect ring buffers
	JSR .execute_spc_sound_engine		;$B5811D   | Resume the SPC main loop
	LDX #$00FE				;$B58120   |\ Tell the SPC engine to start playing music
	JSR .write_spc_command			;$B58123   |/
	LDA stereo_select			;$B58126   |\ Write mono or stereo setting to SPC engine
	XBA					;$B58128   | |
	ORA #$00FA				;$B58129   | |
	TAX					;$B5812C   | |
	JSR .write_spc_command			;$B5812D   |/
	PLB					;$B58130   | Restore databank
	RTL					;$B58131  /

.play_song_with_transition
	PHB					;$B58132  \
	PHK					;$B58133   |\ Use current databank
	PLB					;$B58134   |/
	PHA					;$B58135   | Preserve input (used to extract transition state later)
	AND #$00FF				;$B58136   |\ Set the active song (mask off transition state)
	STA current_song			;$B58139   |/
	LDX #$00FF				;$B5813B   |\ Place SPC engine into upload mode
	JSR .write_spc_command			;$B5813E   |/
	JSR .upload_song_sample_set		;$B58141   |\ Upload song data, sound effects, and samples
	JSR .upload_song_data			;$B58144   | |
	JSR .upload_song_sound_effects		;$B58147   |/
	JSR .clear_sound_buffers		;$B5814A   | Clear the sound effect ring buffers
	JSR .execute_spc_sound_engine		;$B5814D   | Resume the SPC main loop
	PLA					;$B58150   |\ Set initial transition state (from preserved input)
	AND #$FF00				;$B58151   | |
	ORA #$00FB				;$B58154   | |
	TAX					;$B58157   | |
	JSR .write_spc_command			;$B58158   |/
	LDX #$00FE				;$B5815B   |\ Tell the SPC engine to start playing music
	JSR .write_spc_command			;$B5815E   |/
	LDA stereo_select			;$B58161   |\ Write mono or stereo setting to SPC engine
	XBA					;$B58163   | |
	ORA #$00FA				;$B58164   | |
	TAX					;$B58167   | |
	JSR .write_spc_command			;$B58168   |/
	PLB					;$B5816B   | Restore databank
	RTL					;$B5816C  /

.clear_sound_buffers
	LDX #$0007				;$B5816D  \ Load number of slots to clear
.clear_buffer_entry				;	   |\ Iterate and clear sound betters
if !version == 0				;	   | |
	STZ $0622,x				;$B58170   | |\ Clear main ring buffer
	STZ $062A,x				;$B58173   | | |
else						;	   | | |
	STZ $0621,x				;$B58170   | | |
	STZ $0629,x				;$B58173   | | |
endif						;	   | |/
	STZ $0619,x				;$B58176   | | Clear the high priority buffer
	DEX					;$B58179   | |
	DEX					;$B5817A   | |
	BPL .clear_buffer_entry			;$B5817B   |/
	STZ $0634				;$B5817D   | Clear next buffer position
	STZ $0636				;$B58180   | Clear last upload frame
	LDA #$0002				;$B58183   |\ Reset next read position
	STA $0632				;$B58186   |/
	STZ $19B0				;$B58189   |
	RTS					;$B5818C  /

.upload_spc_engine_wrapper
	JSR .upload_spc_engine			;$B5818D  \ Wrapper around SPC engine upload routine
	RTL					;$B58190  /

.upload_spc_engine
	JSR .upload_spc_base_engine		;$B58191  \ Upload the core of the SPC engine
	JSR .upload_spc_sound_engine		;$B58194   | Upload the sound processor of the SPC engine
	JSR .upload_global_samples		;$B58197   |
	LDA #global_sfx_data			;$B5819A   |\ Load pointer to sound effect data
	STA $32					;$B5819D   | |
	LDA.w #global_sfx_data>>16		;$B5819F   | |
	STA $34					;$B581A2   |/
	JSR .upload_inline_spc_block		;$B581A4   | Upload the sound effect data
	JSR .execute_spc_sound_engine		;$B581A7   | Jump to the sound engine entry
	RTS					;$B581AA  /

.dead_code
	RTS					;$B581AB  > Dead code

.execute_spc_sound_engine			;	  \
	LDA #$0672				;$B581AC   |\ Load the sound engine entry point
	STA $35					;$B581AF   |/
	STZ $37					;$B581B1   | Zero size transfer means execute jump
	JSR .upload_spc_block			;$B581B3   | Call the upload routine
	RTS					;$B581B6  /

.unused_spc_execute
	LDA #$06E3				;$B581B7  \ Dead code, would crash SPC engine.
	STA $35					;$B581BA   |
	STZ $37					;$B581BC   |
	JSR .upload_spc_block			;$B581BE   |
	RTS					;$B581C1  /

.CODE_B581C2
	AND #$00FF				;$B581C2  \
	XBA					;$B581C5   |
	ORA #$00FC				;$B581C6   |
	TAX					;$B581C9   |
	JSR .write_spc_command			;$B581CA   |
	RTL					;$B581CD  /

.CODE_B581CE
	AND #$00FF				;$B581CE  \
	XBA					;$B581D1   |
	ORA #$00FD				;$B581D2   |
	TAX					;$B581D5   |
	JSR .write_spc_command			;$B581D6   |
	RTL					;$B581D9  /

.null_spc_command
	RTL					;$B581DA  > Unused SPC command that does nothing

.transition_song
	PHB					;$B581DB  \
	PHK					;$B581DC   |\ Use current databank
	PLB					;$B581DD   |/
	AND #$00FF				;$B581DE   |\ Select transition
	XBA					;$B581E1   | |
	ORA #$00FB				;$B581E2   | |
	TAX					;$B581E5   | |
	JSR .write_spc_command			;$B581E6   |/
	LDX #$00FE				;$B581E9   |\ Tell the SPC engine to start playing music
	JSR .write_spc_command			;$B581EC   |/
	LDA stereo_select			;$B581EF   |\ Write mono or stereo setting to SPC engine
	XBA					;$B581F1   | |
	ORA #$00FA				;$B581F2   | |
	TAX					;$B581F5   | |
	JSR .write_spc_command			;$B581F6   |/
	PLB					;$B581F9   | Restore databank
	RTL					;$B581FA  /

.write_spc_command
	TXA					;$B581FB  \ Move the command into A
	REP #$20				;$B581FC   |\ Use index as 8 bit, with 16 bit accumulator
	SEP #$10				;$B581FE   |/
	LDX spc_transaction			;$B58200   | Load the previous SPC transaction id
-						;	   |
	CPX APU.IO1				;$B58202   |\ Wait for the SPC engine to echo the previous transaction id
	BNE -					;$B58205   |/
	STA APU.IO2				;$B58207   | Write the command to the SPC engine
	INX					;$B5820A   |\ Increment and send the SPC transaction id
	STX APU.IO1				;$B5820B   |/
	STX spc_transaction			;$B5820E   | Store the SPC transaction id
	REP #$30				;$B58210   |
	RTS					;$B58212  / Command upload finished

.upload_spc_base_engine				;	  \
	REP #$20				;$B58213   |\ Use index as 8 bit, with 16 bit accumulator
	SEP #$10				;$B58215   |/
	LDA #$BBAA				;$B58217   | The IPL uses BBAA to indicate ready state
-						;	   |\ Wait for the SPC 700 to be ready
	CMP APU.IO1				;$B5821A   | |
	BNE -					;$B5821D   |/
	LDA #$04D8				;$B5821F   |\ Set ARAM address for data transfer
	STA APU.IO3				;$B58222   |/
	LDA #$01CC				;$B58225   |\ Acknowledge the SPC-700 IPL and initiate a data transfer
	STA APU.IO1				;$B58228   |/
	TAX					;$B5822B   | SPC echo is only a single byte, so use index registers
-						;	   |\ Wait for the SPC-700 to acknowledge the SNES CPU
	CPX APU.IO1				;$B5822C   | |
	BNE -					;$B5822F   |/
	LDX #$00				;$B58231   | Initialize the transfer counter
..next_byte					;	   |\
	LDA.l spc_base_engine,x			;$B58233   | |\ Load and store the current engine byte
	TAY					;$B58237   | | |
	STY APU.IO2				;$B58238   | |/
	STX APU.IO1				;$B5823B   | | Store the transaction counter
-						;	   | |\ Wait for the SPC to echo the counter
	CPX APU.IO1				;$B5823E   | | |
	BNE -					;$B58241   | |/
	INX					;$B58243   | | Increment the counter
	CPX #$88				;$B58244   | | Compare against the engine size
	BNE ..next_byte				;$B58246   |/ If we haven't hit the engine size, load the next byte
	INX					;$B58248   |\ Increment counter by two to end transfer
	TXA					;$B58249   | | Use A to write the counter for 16 bit (high byte = 00)
	STA APU.IO1				;$B5824A   |/ Since 00 is written, the uploaded code will be executed
-						;	   |\ Wait for the SPC echo
	CPX APU.IO1				;$B5824D   | |
	BNE -					;$B58250   |/
	STZ spc_transaction			;$B58252   | Reset the SPC transaction id
	LDA #$0001				;$B58254   |\ Default to mono audio
	STA stereo_select			;$B58257   |/
	REP #$30				;$B58259   |
	RTS					;$B5825B  / All done, new SPC base engine set up.

.upload_song_data
	LDA current_song			;$B5825C  \ Load currently set song
	CLC					;$B5825E   |\ Multiply song number by 6 to get an offset to song data
	ROL A					;$B5825F   | | Effectively (X << 1) + (X << 2)
	STA $32					;$B58260   | |
	ROL A					;$B58262   | |
	CLC					;$B58263   | |
	ADC $32					;$B58264   |/
	TAX					;$B58266   | Move offset to an index register
	LDA.l song_data,x			;$B58267   |\ Load pointer to song data
	STA $32					;$B5826B   | |
	LDA.l song_data+2,x			;$B5826D   | |
	STA $34					;$B58271   |/
	JSR .upload_inline_spc_block		;$B58273   | Upload song data
	RTS					;$B58276  /

.upload_song_sound_effects			;	  \
	LDA current_song			;$B58277   |\ Triple song id
	CLC					;$B58279   | |
	ADC current_song			;$B5827A   | |
	ADC current_song			;$B5827C   |/
	TAX					;$B5827E   | Move offset to an index register
	LDA.l DATA_EE117B,x			;$B5827F   |\ Load pointer to song specific sound effects
	STA $32					;$B58283   | |
	LDA.l DATA_EE117D,x			;$B58285   | |
	STA $34					;$B58289   |/
	JSR .upload_inline_spc_block		;$B5828B   | Upload sound effect data
	RTS					;$B5828E  /

.upload_spc_sound_engine
	REP #$30				;$B5828F  \
	LDA #spc_sound_engine			;$B58291   |\ Load a pointer to SPC sound engine
	STA $32					;$B58294   | |
	LDA.w #spc_sound_engine>>16		;$B58296   | |
	STA $34					;$B58299   |/
	LDA #$0560				;$B5829B   |\ Set the ARAM destination
	STA $35					;$B5829E   |/
	LDA #$067F				;$B582A0   |\ Set the number of words to transfer
	STA $37					;$B582A3   |/
	JSR .upload_spc_block			;$B582A5   | Upload SPC block
	RTS					;$B582A8  /

.upload_global_samples				;	  \
	LDA #global_sample_map			;$B582A9   |\ Load the pointer to the global sample map
	STA $0E					;$B582AC   | |
	LDA.w #global_sample_map>>16		;$B582AE   | |
	STA $10					;$B582B1   |/
	LDA #$3100				;$B582B3   |\ Source directory ARAM destination
	STA $02					;$B582B6   |/
	STZ $0A					;$B582B8   |
	LDA #$3400				;$B582BA   |\ Sample data ARAM destination
	STA $06					;$B582BD   |/
	STZ $0A					;$B582BF   | Reset the sample counter
	JSR .sample_uploader			;$B582C1   |
	LDA $02					;$B582C4   |\ Set next pending source directory ARAM destination
	STA $04					;$B582C6   |/
	LDA $06					;$B582C8   |\ Set next pending sample data ARAM destination
	STA $08					;$B582CA   |/
	LDA $0A					;$B582CC   |\ Set next pending sample number
	STA $0C					;$B582CE   |/
	RTS					;$B582D0  /

.sample_uploader
	STZ $0A					;$B582D1  \ Reset the sample counter
	LDX #$0000				;$B582D3   |
	LDA $0A					;$B582D6   |\ Copy sample number (always zero in this case)
	STA $3A					;$B582D8   |/
	LDA $0E					;$B582DA   |\ Copy sample map pointer
	STA $3E					;$B582DC   | |
	LDA $10					;$B582DE   | |
	STA $40					;$B582E0   |/
	LDA $02					;$B582E2   |\ Copy source directory ARAM destination
	STA $42					;$B582E4   |/
	LDA $06					;$B582E6   |\ Copy sample data ARAM destination
	STA $44					;$B582E8   |/
.parse_next_sample				;	   |
	LDA [$3E]				;$B582EA   | Load sample number
	INC $3E					;$B582EC   |\  Increment the sample map pointer
	INC $3E					;$B582EE   |/
	CMP #$FFFF				;$B582F0   |\ Sample number FFFF implies end of table, branch and upload
	BEQ .upload_sample_directory		;$B582F3   |/
	STA $3C					;$B582F5   |\ Triple sample number to index sample pointer table
	CLC					;$B582F7   | |
	ADC $3C					;$B582F8   | |
	ADC $3C					;$B582FA   |/
	TXY					;$B582FC   | Preserve ARAM buffer index
	TAX					;$B582FD   |\ Load pointer to the current sample
	LDA.l sample_table,x			;$B582FE   | |
	STA $32					;$B58302   | |
	LDA.l sample_table+2,x			;$B58304   | |
	STA $34					;$B58308   |/
	TYX					;$B5830A   | Restore ARAM buffer index
	LDA $06					;$B5830B   |\ Store sample data ARAM destination
	STA $7E2200,x				;$B5830D   |/
	INX					;$B58311   |\ Increment ARAM buffer index
	INX					;$B58312   |/
	LDA [$32]				;$B58313   |\ Load size of unlooped sample data
	CLC					;$B58315   | |
	ADC $06					;$B58316   | | Add unlooped sample data and ARAM destination
	STA $7E2200,x				;$B58318   |/ Store destination of sample loop entry
	INX					;$B5831C   |\ Increment ARAM buffer index
	INX					;$B5831D   |/
	INC $02					;$B5831E   |\ Increase source directory ARAM destination by 4 bytes
	INC $02					;$B58320   | |
	INC $02					;$B58322   | |
	INC $02					;$B58324   |/
	INC $32					;$B58326   |\ Increment pointer to current sample data
	INC $32					;$B58328   |/
	LDA [$32]				;$B5832A   |\ Load size of looped sample data
	CLC					;$B5832C   | |
	ADC $06					;$B5832D   | | Add looped sample data and ARAM destination
	STA $06					;$B5832F   |/ Store next potential ARAM sample destination
	BRA .parse_next_sample			;$B58331  / Parse the next sample

.upload_sample_directory			;	  \
	LDA #$2200				;$B58333   |\ Set upload source to $7E2200
	STA $32					;$B58336   | |
	LDA #$007E				;$B58338   | |
	STA $34					;$B5833B   |/
	LDA $42					;$B5833D   |\ Set ARAM destination
	STA $35					;$B5833F   |/
	LDA #$3400				;$B58341   |\ Calculate and set upload size
	SEC					;$B58344   | |
	SBC $42					;$B58345   | | word count = ($3400 - ARAM dest + 1) / 2
	CLC					;$B58347   | |
	INC A					;$B58348   | |
	LSR A					;$B58349   | |
	STA $37					;$B5834A   |/
	JSR .upload_spc_block			;$B5834C   | Upload sample directory
	LDA #global_sample_map			;$B5834F   |\ Load global sample map pointer
	STA $3E					;$B58352   | |
	LDA.w #global_sample_map>>16		;$B58354   | |
	STA $40					;$B58357   |/
	LDA $0E					;$B58359   |\ If the sample map pointer is not the global samples
	CMP $3E					;$B5835B   | |
	BNE  .map_global_sample			;$B5835D   |/ Branch and include global samples in the mapping
	LDA $10					;$B5835F   |\ If the pointer does match the global samples
	CMP $40					;$B58361   | |
	BEQ .upload_samples			;$B58363   |/ Branch ahead and don't double map global samples
 .map_global_sample				;	   |
	LDA [$3E]				;$B58365   | Load the sample number
	CMP #$FFFF				;$B58367   |\ Sample number FFFF implies end of table, in that case
	BEQ .map_set_specific_samples		;$B5836A   |/ Branch and map set specific samples
	INC $3E					;$B5836C   |\ Increment sample map pointer
	INC $3E					;$B5836E   |/
	TAX					;$B58370   | Use sample number as an index
	LDA $0A					;$B58371   |\ Store the sample id at the sample number index
	SEP #$20				;$B58373   | |
	STA $7E2200,x				;$B58375   | |
	REP #$20				;$B58379   |/
	INC $0A					;$B5837B   | Increment the sample number count
	BRA .map_global_sample			;$B5837D  / Parse next sample map entry

.map_set_specific_samples			;	  \
	LDA $0E					;$B5837F   |\ Load target sample map pointer
	STA $3E					;$B58381   | |
	LDA $10					;$B58383   | |
	STA $40					;$B58385   |/
.map_sample					;	   |
	LDA [$3E]				;$B58387   | Load the sample number
	CMP #$FFFF				;$B58389   |\ Sample number FFFF implies end of table, branch and upload
	BEQ .upload_source_number_map		;$B5838C   |/
	INC $3E					;$B5838E   |\ Increment sample map pointer
	INC $3E					;$B58390   |/
	TAX					;$B58392   | Use sample number as an index
	LDA $0A					;$B58393   |\ Store the sample id at the sample number index
	SEP #$20				;$B58395   | |
	STA $7E2200,x				;$B58397   | |
	REP #$20				;$B5839B   |/
	INC $0A					;$B5839D   | Increment the sample number count
	BRA .map_sample				;$B5839F  / Parse next sample map entry

.upload_source_number_map			;	  \
	LDA #$2200				;$B583A1   |\ Set upload source to $7E2200
	STA $32					;$B583A4   | |
	LDA #$007E				;$B583A6   | |
	STA $34					;$B583A9   |/
	LDA #$0560				;$B583AB   |\ Set ARAM Destination to $0560
	STA $35					;$B583AE   |/
	LDA #$0080				;$B583B0   |\ Set transfer size to 128 words
	STA $37					;$B583B3   |/
	JSR .upload_spc_block			;$B583B5   | Upload the source number table
.upload_samples					;	   |
	LDA $44					;$B583B8   |\ Load and copy the sample destination pointer
	STA $06					;$B583BA   |/
.upload_next_sample				;	   |
	LDA [$0E]				;$B583BC   | Load the sample number
	CMP #$FFFF				;$B583BE   |\ Sample number FFFF implies end of table, branch and return
	BEQ ..return				;$B583C1   |/
	INC $0E					;$B583C3   |\ Increment sample map pointer
	INC $0E					;$B583C5   |/
	STA $3C					;$B583C7   |\ Triple sample number to index sample data pointer table
	CLC					;$B583C9   | |
	ADC $3C					;$B583CA   | |
	ADC $3C					;$B583CC   | |
	TAX					;$B583CE   |/
	LDA.l sample_table,x			;$B583CF   |\ Load a the pointer to the sample.
	STA $32					;$B583D3   | |
	LDA.l sample_table+2,x			;$B583D5   | |
	STA $34					;$B583D9   |/
	INC $32					;$B583DB   |\ Skip unlooped intro size
	INC $32					;$B583DD   |/
	LDA $06					;$B583DF   |\ Load and copy the ARAM destination
	STA $35					;$B583E1   |/
	LDA [$32]				;$B583E3   |\ Load and copy the size of the sample to upload
	STA $37					;$B583E5   |/
	CLC					;$B583E7   |\ Add the ARAM destination and sample size
	ADC $35					;$B583E8   | |
	STA $06					;$B583EA   |/ Store this as the next ARAM destination
	CLC					;$B583EC   |\ Convert bytes to upload to words to upload
	INC $37					;$B583ED   | |
	LSR $37					;$B583EF   |/
	INC $32					;$B583F1   |\ Increment pointer so the sample data start is the next byte
	INC $32					;$B583F3   |/
	JSR .upload_spc_block			;$B583F5   | Upload the sample data
	BRA .upload_next_sample			;$B583F8  / Continue uploading samples

..return
	RTS					;$B583FA  > All done, no more samples.

.upload_inline_spc_block			;	  \
	LDA [$32]				;$B583FB   |\ Load the destination ARAM address from the block
	STA $35					;$B583FD   |/
	INC $32					;$B583FF   |\ Increment the pointer
	INC $32					;$B58401   |/
	LDA [$32]				;$B58403   |\ Load the transfer length from the block
	STA $37					;$B58405   |/
	INC $32					;$B58407   |\ Increment the pointer
	INC $32					;$B58409   |/
	BRA .upload_spc_block			;$B5840B  / Continue to the normal SPC block upload

.upload_spc_block
	SEP #$10				;$B5840D  \ 16 bit A, with 8 bit index
	LDX spc_transaction			;$B5840F   | Load the last SPC transaction id
-						;	   |\ Wait for the previous transaction id to be echoed
	CPX APU.IO1				;$B58411   | | Which will signify the SPC engine is ready.
	BNE -					;$B58414   |/
	LDA $35					;$B58416   |\ Write the ARAM target address
	STA APU.IO2				;$B58418   |/
	INX					;$B5841B   |\ Increment and set the transaction id
	STX APU.IO1				;$B5841C   |/
	LDA $37					;$B5841F   |\ Copy the byte count
	STA $39					;$B58421   |/
-						;	   |\ Wait for the transaction id to echo for completion
	CPX APU.IO1				;$B58423   | |
	BNE -					;$B58426   |/
	STA APU.IO2				;$B58428   | Write the length of the transfer
	INX					;$B5842B   |\ Increment and set the transaction id
	STX APU.IO1				;$B5842C   |/
	LDA $37					;$B5842F   |\ If there are no bytes to transfer simply exit
	BEQ .return				;$B58431   |/ This means we were only executing a jump
	LDY #$00				;$B58433   |
.next_byte					;	   |
	LDA [$32],y				;$B58435   | Load next byte
	INY					;$B58437   |\ Advance the data index
	INY					;$B58438   |/
	BEQ .advance_pointer			;$B58439   | If the index has wrapped, advance the pointer
.wait_for_echo					;	   |\ Wait for the transaction id to echo for completion
	CPX APU.IO1				;$B5843B   | |
	BNE .wait_for_echo			;$B5843E   |/
	INX					;$B58440   | Increment the transaction id
	STA APU.IO2				;$B58441   | Write the data (two bytes)
	STX APU.IO1				;$B58444   | Write the transaction id
	DEC $37					;$B58447   |\ Continue if there are more bytes to upload
	BNE .next_byte				;$B58449   |/
.return						;	   |
	STX spc_transaction			;$B5844B   | Store the final SPC transaction id
	REP #$30				;$B5844D   | Return to full 16 bit
	LDA $39					;$B5844F   |\ Store double the transfer count in A
	ASL A					;$B58451   |/
	RTS					;$B58452  / Finished with SPC block upload

.advance_pointer				;	  \
	LDY $33					;$B58453   |\ Increment the pointer high byte
	INY					;$B58455   |/
	BNE .skip_pointer_bank_cross		;$B58456   | If it doesn't roll over, skip incrementing the bank
	STY $33					;$B58458   | Set the new pointer mid byte
	LDY $34					;$B5845A   |\ Increment the pointer bank
	INY					;$B5845C   | |
	STY $34					;$B5845D   |/
	LDY #$00				;$B5845F   | Reset the data index
	BRA .wait_for_echo			;$B58461  /

.skip_pointer_bank_cross
	STY $33					;$B58463  \ Store the new pointer offset
	LDY #$00				;$B58465   | Reset the data index
	BRA .wait_for_echo			;$B58467  /

.upload_song_sample_set
	LDA current_song			;$B58469  \ Load currently set song
	CLC					;$B5846B   |\ Multiply song number by 6 to song sample map offset
	ROL A					;$B5846C   | | Effectively (X << 1) + (X << 2)
	STA $32					;$B5846D   | |
	ROL A					;$B5846F   | |
	CLC					;$B58470   | |
	ADC $32					;$B58471   |/
	TAX					;$B58473   | Move offset to an index register
	LDA.l song_sample_maps,x		;$B58474   |\ Load pointer to song sample map
	STA $0E					;$B58478   | |
	LDA.l song_sample_maps+2,x		;$B5847A   | |
	STA $10					;$B5847E   |/
	LDA $04					;$B58480   |\ Set next pending source directory ARAM destination
	STA $02					;$B58482   |/
	LDA $08					;$B58484   |\ Set next pending sample data ARAM destination
	STA $06					;$B58486   |/
	LDA $0C					;$B58488   |\ Set next pending sample number
	STA $0A					;$B5848A   |/
	JSR .sample_uploader			;$B5848C   | Upload the samples
	RTS					;$B5848F  /