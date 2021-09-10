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
	LDA #sound_effect_data			;$B5819A   |\ Load pointer to sound effect data
	STA $32					;$B5819D   | |
	LDA.w #sound_effect_data>>16		;$B5819F   | |
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
	CLC					;$B5846B   |\ Multiply song number by 6 to song sample set offset
	ROL A					;$B5846C   | | Effectively (X << 1) + (X << 2)
	STA $32					;$B5846D   | |
	ROL A					;$B5846F   | |
	CLC					;$B58470   | |
	ADC $32					;$B58471   |/
	TAX					;$B58473   | Move offset to an index register
	LDA.l song_sample_sets,x		;$B58474   |\ Load pointer to song sample set
	STA $0E					;$B58478   | |
	LDA.l song_sample_sets+2,x		;$B5847A   | |
	STA $10					;$B5847E   |/
	LDA $04					;$B58480   |\ Set next pending source directory ARAM destination
	STA $02					;$B58482   |/
	LDA $08					;$B58484   |\ Set next pending sample data ARAM destination
	STA $06					;$B58486   |/
	LDA $0C					;$B58488   |\ Set next pending sample number
	STA $0A					;$B5848A   |/
	JSR .sample_uploader			;$B5848C   | Upload the samples
	RTS					;$B5848F  /

DATA_B58490:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00

CODE_B59C00:
	LDY current_sprite			;$B59C00  \
	LDX $1A,y				;$B59C02   |
	LDA $1730				;$B59C04   |
	CMP $78					;$B59C07   |
	BCC CODE_B59C0C				;$B59C09   |
	RTL					;$B59C0B  /

CODE_B59C0C:
	STX $18,y				;$B59C0C  \
	STX $16,y				;$B59C0E   |
	LDA $0012,y				;$B59C10   |
	STA $32					;$B59C13   |
	LDA.l DATA_BC8000,x			;$B59C15   |
	STA $40					;$B59C19   |
	LDA.l DATA_BC8002,x			;$B59C1B   |
	STA $42					;$B59C1F   |
	LDY #$0000				;$B59C21   |
	LDA [$40],y				;$B59C24   |
	STA $36					;$B59C26   |
	LDY #$0002				;$B59C28   |
	LDA [$40],y				;$B59C2B   |
	STA $38					;$B59C2D   |
	LDY #$0004				;$B59C2F   |
	LDA [$40],y				;$B59C32   |
	STA $3A					;$B59C34   |
	LDY #$0006				;$B59C36   |
	LDA [$40],y				;$B59C39   |
	STA $3C					;$B59C3B   |
	LDA #$0004				;$B59C3D   |
	CLC					;$B59C40   |
	SEP #$20				;$B59C41   |
	ADC $36					;$B59C43   |
	ADC $37					;$B59C45   |
	ADC $39					;$B59C47   |
	REP #$20				;$B59C49   |
	ASL A					;$B59C4B   |
	TAY					;$B59C4C   |
	JSR CODE_B59D3E				;$B59C4D   |
	CLC					;$B59C50   |
	RTL					;$B59C51  /

CODE_B59C52:
	PHB					;$B59C52  \
	PHK					;$B59C53   |
	PLB					;$B59C54   |
	LDX $0638				;$B59C55   |
CODE_B59C58:					;	   |
	LDY $0638,x				;$B59C58   |
	LDA $001C,y				;$B59C5B   |
	AND #$1000				;$B59C5E   |
	BEQ CODE_B59C91				;$B59C61   |
	LDA $000A,y				;$B59C63   |
	SEC					;$B59C66   |
	SBC $17C0				;$B59C67   |
	SEC					;$B59C6A   |
	SBC #$0070				;$B59C6B   |
	STA $74					;$B59C6E   |
	CLC					;$B59C70   |
	ADC #$0080				;$B59C71   |
	CMP #$0130				;$B59C74   |
	BCS CODE_B59CA8				;$B59C77   |
	LDA $0006,y				;$B59C79   |
	SEC					;$B59C7C   |
	SBC $17BA				;$B59C7D   |
	SEC					;$B59C80   |
	SBC #$0080				;$B59C81   |
	STA $72					;$B59C84   |
	CLC					;$B59C86   |
	ADC #$00B0				;$B59C87   |
	CMP #$0160				;$B59C8A   |
	BCC CODE_B59CA3				;$B59C8D   |
	BRA CODE_B59CA8				;$B59C8F  /

CODE_B59C91:
	LDA $000A,y				;$B59C91  \
	SEC					;$B59C94   |
	SBC #$0070				;$B59C95   |
	STA $74					;$B59C98   |
	LDA $0006,y				;$B59C9A   |
	SEC					;$B59C9D   |
	SBC #$0080				;$B59C9E   |
	STA $72					;$B59CA1   |
CODE_B59CA3:					;	   |
	PHX					;$B59CA3   |
	JSR CODE_B59CCB				;$B59CA4   |
	PLX					;$B59CA7   |
CODE_B59CA8:					;	   |
	DEX					;$B59CA8   |
	DEX					;$B59CA9   |
	BNE CODE_B59C58				;$B59CAA   |
	PLB					;$B59CAC   |
	RTL					;$B59CAD  /

CODE_B59CAE:
	PHB					;$B59CAE  \
	PHK					;$B59CAF   |
	PLB					;$B59CB0   |
	LSR A					;$B59CB1   |
	LSR A					;$B59CB2   |
	LSR A					;$B59CB3   |
	LSR A					;$B59CB4   |
	SEC					;$B59CB5   |
	SBC #$0170				;$B59CB6   |
	STA $74					;$B59CB9   |
	TXA					;$B59CBB   |
	LSR A					;$B59CBC   |
	LSR A					;$B59CBD   |
	LSR A					;$B59CBE   |
	LSR A					;$B59CBF   |
	SEC					;$B59CC0   |
	SBC #$0180				;$B59CC1   |
	STA $72					;$B59CC4   |
	JSR CODE_B59CCB				;$B59CC6   |
	PLB					;$B59CC9   |
	RTL					;$B59CCA  /

CODE_B59CCB:
	LDA $0012,y				;$B59CCB  \
	STA $32					;$B59CCE   |
	STA $34					;$B59CD0   |
	SEP #$20				;$B59CD2   |
	LDA $70					;$B59CD4   |
	LSR A					;$B59CD6   |
	LSR A					;$B59CD7   |
	LSR A					;$B59CD8   |
	LSR A					;$B59CD9   |
	AND #$1F				;$B59CDA   |
	STA $56					;$B59CDC   |
	REP #$20				;$B59CDE   |
	LDX $1A,y				;$B59CE0   |
	BEQ CODE_B59CFF				;$B59CE2   |
	CPX #$02C5				;$B59CE4   |
	BCS CODE_B59D14				;$B59CE7   |
	STX $18,y				;$B59CE9   |
	LDA.l DATA_BC8000,x			;$B59CEB   |
	STA $40					;$B59CEF   |
	INC A					;$B59CF1   |
	STA $44					;$B59CF2   |
	LDA.l DATA_BC8002,x			;$B59CF4   |
	STA $42					;$B59CF8   |
	STA $46					;$B59CFA   |
	JMP CODE_B59DAB				;$B59CFC  /

CODE_B59CFF:
	RTS					;$B59CFF  /

CODE_B59D00:
	LDA.l DATA_BC8000,x			;$B59D00  \
	STA $40					;$B59D04   |
	INC A					;$B59D06   |
	STA $44					;$B59D07   |
	LDA.l DATA_BC8002,x			;$B59D09   |
	STA $42					;$B59D0D   |
	STA $46					;$B59D0F   |
	JMP CODE_B59DC5				;$B59D11  /

CODE_B59D14:
	TXA					;$B59D14  \
	CMP $0018,y				;$B59D15   |
	BEQ CODE_B59D00				;$B59D18   |
	LDA $1730				;$B59D1A   |
	CMP $78					;$B59D1D   |
	BCC CODE_B59D26				;$B59D1F   |
	LDX $16,y				;$B59D21   |
	BNE CODE_B59D00				;$B59D23   |
	RTS					;$B59D25  /

CODE_B59D26:
	STX $18,y				;$B59D26  \
	STX $16,y				;$B59D28   |
	LDA.l DATA_BC8000,x			;$B59D2A   |
	STA $40					;$B59D2E   |
	INC A					;$B59D30   |
	STA $44					;$B59D31   |
	LDA.l DATA_BC8002,x			;$B59D33   |
	STA $42					;$B59D37   |
	STA $46					;$B59D39   |
	JSR CODE_B59DC5				;$B59D3B   |
CODE_B59D3E:					;	   |
	LDX $1730				;$B59D3E   |
	TYA					;$B59D41   |
	CLC					;$B59D42   |
	ADC $40					;$B59D43   |
	STA $1736,x				;$B59D45   |
	LDA $3B					;$B59D48   |
	AND #$00FF				;$B59D4A   |
	ASL A					;$B59D4D   |
	ASL A					;$B59D4E   |
	ASL A					;$B59D4F   |
	ASL A					;$B59D50   |
	ASL A					;$B59D51   |
	STA $1732,x				;$B59D52   |
	ADC $1736,x				;$B59D55   |
	TAY					;$B59D58   |
	LDA $32					;$B59D59   |
	AND #$01FF				;$B59D5B   |
	ASL A					;$B59D5E   |
	ASL A					;$B59D5F   |
	ASL A					;$B59D60   |
	ASL A					;$B59D61   |
	STA $1734,x				;$B59D62   |
	LDA $42					;$B59D65   |
	ORA #$FF00				;$B59D67   |
	STA $1738,x				;$B59D6A   |
	LDA $3D					;$B59D6D   |
	AND #$000F				;$B59D6F   |
	BNE CODE_B59D7F				;$B59D72   |
	TXA					;$B59D74   |
	ADC #$0008				;$B59D75   |
	STA $1730				;$B59D78   |
	STZ $1740,x				;$B59D7B   |
	RTS					;$B59D7E  /

CODE_B59D7F:
	ASL A					;$B59D7F  \
	ASL A					;$B59D80   |
	ASL A					;$B59D81   |
	ASL A					;$B59D82   |
	ASL A					;$B59D83   |
	STA $173A,x				;$B59D84   |
	TXA					;$B59D87   |
	ADC #$0010				;$B59D88   |
	STA $1730				;$B59D8B   |
	STZ $1748,x				;$B59D8E   |
	LDA $3C					;$B59D91   |
	AND #$00FF				;$B59D93   |
	ASL A					;$B59D96   |
	ASL A					;$B59D97   |
	ASL A					;$B59D98   |
	ASL A					;$B59D99   |
	ADC $1734,x				;$B59D9A   |
	STA $173C,x				;$B59D9D   |
	TYA					;$B59DA0   |
	STA $173E,x				;$B59DA1   |
	LDA $1738,x				;$B59DA4   |
	STA $1740,x				;$B59DA7   |
	RTS					;$B59DAA  /

CODE_B59DAB:
	LDY #$0000				;$B59DAB  \
	LDA [$40],y				;$B59DAE   |
	STA $36					;$B59DB0   |
	LDY #$0002				;$B59DB2   |
	LDA [$40],y				;$B59DB5   |
	STA $38					;$B59DB7   |
	LDY #$0004				;$B59DB9   |
	LDA [$40],y				;$B59DBC   |
	STA $3A					;$B59DBE   |
	LDY #$0005				;$B59DC0   |
	BRA CODE_B59DE4				;$B59DC3  /

CODE_B59DC5:
	LDY #$0000				;$B59DC5  \
	LDA [$40],y				;$B59DC8   |
	STA $36					;$B59DCA   |
	LDY #$0002				;$B59DCC   |
	LDA [$40],y				;$B59DCF   |
	STA $38					;$B59DD1   |
	LDY #$0004				;$B59DD3   |
	LDA [$40],y				;$B59DD6   |
	STA $3A					;$B59DD8   |
	LDY #$0006				;$B59DDA   |
	LDA [$40],y				;$B59DDD   |
	STA $3C					;$B59DDF   |
	LDY #$0008				;$B59DE1   |
CODE_B59DE4:					;	   |
	LDA $70					;$B59DE4   |
	LSR A					;$B59DE6   |
	LSR A					;$B59DE7   |
	SEP #$20				;$B59DE8   |
	TAX					;$B59DEA   |
	ADC $36					;$B59DEB   |
	BMI CODE_B59DF2				;$B59DED   |
	REP #$20				;$B59DEF   |
	RTS					;$B59DF1  /

CODE_B59DF2:
	TXA					;$B59DF2  \
	LSR A					;$B59DF3   |
	LSR A					;$B59DF4   |
	AND #$851F				;$B59DF5   |
	LSR $8A,x				;$B59DF8   |
	AND #$AA03				;$B59DFA   |
	LDA DATA_B5A190,x			;$B59DFD   |
	STA $3E					;$B59E00   |
	LDX $70					;$B59E02   |
	CLC					;$B59E04   |
CODE_B59E05:					;	   |
	DEC $36					;$B59E05   |
	BMI CODE_B59E63				;$B59E07   |
	LDA [$44],y				;$B59E09   |
	REP #$20				;$B59E0B   |
	AND #$00FF				;$B59E0D   |
	ADC $74					;$B59E10   |
	CMP #$00F0				;$B59E12   |
	BCS CODE_B59E4E				;$B59E15   |
	SBC #$000F				;$B59E17   |
	STA $01,x				;$B59E1A   |
	LDA [$40],y				;$B59E1C   |
	AND #$00FF				;$B59E1E   |
	CLC					;$B59E21   |
	ADC $72					;$B59E22   |
	CMP #$0100				;$B59E24   |
	SEP #$20				;$B59E27   |
	STA $00,x				;$B59E29   |
	LDA $3E					;$B59E2B   |
	BCS CODE_B59E31				;$B59E2D   |
	AND #$AA				;$B59E2F   |
CODE_B59E31:					;	   |
	ORA ($56)				;$B59E31   |
	STA ($56)				;$B59E33   |
	LDA $3E					;$B59E35   |
	BPL CODE_B59E40				;$B59E37   |
	INC $56					;$B59E39   |
	LDA #$03				;$B59E3B   |
	CLC					;$B59E3D   |
	BRA CODE_B59E42				;$B59E3E  /

CODE_B59E40:
	ASL A					;$B59E40  \
	ASL A					;$B59E41   |
CODE_B59E42:					;	   |
	STA $3E					;$B59E42   |
	REP #$20				;$B59E44   |
	LDA $34					;$B59E46   |
	STA $02,x				;$B59E48   |
	INX					;$B59E4A   |
	INX					;$B59E4B   |
	INX					;$B59E4C   |
	INX					;$B59E4D   |
CODE_B59E4E:					;	   |
	CLC					;$B59E4E   |
	LDA $34					;$B59E4F   |
	INC A					;$B59E51   |
	INC A					;$B59E52   |
	BIT #$0010				;$B59E53   |
	BEQ CODE_B59E5B				;$B59E56   |
	ADC #$0010				;$B59E58   |
CODE_B59E5B:					;	   |
	STA $34					;$B59E5B   |
	SEP #$20				;$B59E5D   |
	INY					;$B59E5F   |
	INY					;$B59E60   |
	BRA CODE_B59E05				;$B59E61  /

CODE_B59E63:
	REP #$20				;$B59E63  \
	TXA					;$B59E65   |
	LSR A					;$B59E66   |
	LSR A					;$B59E67   |
	SEP #$20				;$B59E68   |
	ADC $37					;$B59E6A   |
	BMI CODE_B59E73				;$B59E6C   |
	REP #$20				;$B59E6E   |
	STX $70					;$B59E70   |
	RTS					;$B59E72  /

CODE_B59E73:
	LDA $38					;$B59E73  \
	CLC					;$B59E75   |
	ADC $32					;$B59E76   |
	STA $34					;$B59E78   |
CODE_B59E7A:					;	   |
	DEC $37					;$B59E7A   |
	BMI CODE_B59ECF				;$B59E7C   |
	LDA [$44],y				;$B59E7E   |
	REP #$20				;$B59E80   |
	AND #$00FF				;$B59E82   |
	CLC					;$B59E85   |
	ADC $74					;$B59E86   |
	CMP #$00F0				;$B59E88   |
	BCS CODE_B59EC7				;$B59E8B   |
	SBC #$000F				;$B59E8D   |
	STA $01,x				;$B59E90   |
	LDA [$40],y				;$B59E92   |
	AND #$00FF				;$B59E94   |
	CLC					;$B59E97   |
	ADC $72					;$B59E98   |
	BIT #$0100				;$B59E9A   |
	SEP #$20				;$B59E9D   |
	STA $00,x				;$B59E9F   |
	BEQ CODE_B59EBD				;$B59EA1   |
	STX $54					;$B59EA3   |
	REP #$20				;$B59EA5   |
	TXA					;$B59EA7   |
	AND #$01FC				;$B59EA8   |
	LSR A					;$B59EAB   |
	LSR A					;$B59EAC   |
	TAX					;$B59EAD   |
	LSR A					;$B59EAE   |
	LSR A					;$B59EAF   |
	SEP #$20				;$B59EB0   |
	STA $56					;$B59EB2   |
	LDA DATA_B5A194,x			;$B59EB4   |
	ORA ($56)				;$B59EB7   |
	STA ($56)				;$B59EB9   |
	LDX $54					;$B59EBB   |
CODE_B59EBD:					;	   |
	REP #$20				;$B59EBD   |
	LDA $34					;$B59EBF   |
	STA $02,x				;$B59EC1   |
	INX					;$B59EC3   |
	INX					;$B59EC4   |
	INX					;$B59EC5   |
	INX					;$B59EC6   |
CODE_B59EC7:					;	   |
	INC $34					;$B59EC7   |
	SEP #$20				;$B59EC9   |
	INY					;$B59ECB   |
	INY					;$B59ECC   |
	BRA CODE_B59E7A				;$B59ECD  /

CODE_B59ECF:
	REP #$20				;$B59ECF  \
	TXA					;$B59ED1   |
	LSR A					;$B59ED2   |
	LSR A					;$B59ED3   |
	SEP #$20				;$B59ED4   |
	ADC $39					;$B59ED6   |
	BMI CODE_B59EDF				;$B59ED8   |
	REP #$20				;$B59EDA   |
	STX $70					;$B59EDC   |
	RTS					;$B59EDE  /

CODE_B59EDF:
	LDA $3A					;$B59EDF  \
	CLC					;$B59EE1   |
	ADC $32					;$B59EE2   |
	STA $34					;$B59EE4   |
CODE_B59EE6:					;	   |
	DEC $39					;$B59EE6   |
	BMI CODE_B59F3B				;$B59EE8   |
	LDA [$44],y				;$B59EEA   |
	REP #$20				;$B59EEC   |
	AND #$00FF				;$B59EEE   |
	CLC					;$B59EF1   |
	ADC $74					;$B59EF2   |
	CMP #$00F0				;$B59EF4   |
	BCS CODE_B59F33				;$B59EF7   |
	SBC #$000F				;$B59EF9   |
	STA $01,x				;$B59EFC   |
	LDA [$40],y				;$B59EFE   |
	AND #$00FF				;$B59F00   |
	CLC					;$B59F03   |
	ADC $72					;$B59F04   |
	BIT #$0100				;$B59F06   |
	SEP #$20				;$B59F09   |
	STA $00,x				;$B59F0B   |
	BEQ CODE_B59F29				;$B59F0D   |
	STX $54					;$B59F0F   |
	REP #$20				;$B59F11   |
	TXA					;$B59F13   |
	AND #$01FC				;$B59F14   |
	LSR A					;$B59F17   |
	LSR A					;$B59F18   |
	TAX					;$B59F19   |
	LSR A					;$B59F1A   |
	LSR A					;$B59F1B   |
	SEP #$20				;$B59F1C   |
	STA $56					;$B59F1E   |
	LDA DATA_B5A194,x			;$B59F20   |
	ORA ($56)				;$B59F23   |
	STA ($56)				;$B59F25   |
	LDX $54					;$B59F27   |
CODE_B59F29:					;	   |
	REP #$20				;$B59F29   |
	LDA $34					;$B59F2B   |
	STA $02,x				;$B59F2D   |
	INX					;$B59F2F   |
	INX					;$B59F30   |
	INX					;$B59F31   |
	INX					;$B59F32   |
CODE_B59F33:					;	   |
	INC $34					;$B59F33   |
	SEP #$20				;$B59F35   |
	INY					;$B59F37   |
	INY					;$B59F38   |
	BRA CODE_B59EE6				;$B59F39  /

CODE_B59F3B:
	REP #$20				;$B59F3B  \
	STX $70					;$B59F3D   |
	RTS					;$B59F3F  /

CODE_B59F40:
	SEP #$20				;$B59F40  \
	LDA $70					;$B59F42   |
	LSR A					;$B59F44   |
	LSR A					;$B59F45   |
	LSR A					;$B59F46   |
	LSR A					;$B59F47   |
	AND #$1F				;$B59F48   |
	STA $56					;$B59F4A   |
	REP #$20				;$B59F4C   |
	STZ $62					;$B59F4E   |
	STZ $0638				;$B59F50   |
CODE_B59F53:					;	   |
	LDA $70					;$B59F53   |
	CMP #$0400				;$B59F55   |
	BNE CODE_B59F69				;$B59F58   |
	SEP #$20				;$B59F5A   |
	LDA #$07				;$B59F5C   |
	STA PPU.screen				;$B59F5E   |
	REP #$20				;$B59F61   |
	PEA $8080				;$B59F63   |
	PLB					;$B59F66   |
	PLB					;$B59F67   |
	RTL					;$B59F68  /

CODE_B59F69:
	PHK					;$B59F69  \
	PLB					;$B59F6A   |
	LDY $62					;$B59F6B   |
	LDA $16FE,y				;$B59F6D   |
	TAY					;$B59F70   |
	LDA $0000,y				;$B59F71   |
	BNE CODE_B59F79				;$B59F74   |
CODE_B59F76:					;	   |
	JMP CODE_B5A17C				;$B59F76  /

CODE_B59F79:
	LDA $1730				;$B59F79  \
	CMP $78					;$B59F7C   |
	BCS CODE_B59F84				;$B59F7E   |
	LDX $1A,y				;$B59F80   |
	BRA CODE_B59F8D				;$B59F82  /

CODE_B59F84:
	LDX $1A,y				;$B59F84  \
	CPX #$02C5				;$B59F86   |
	BCC CODE_B59F8D				;$B59F89   |
	LDX $16,y				;$B59F8B   |
CODE_B59F8D:					;	   |
	TXA					;$B59F8D   |
	STA $0018,y				;$B59F8E   |
	BEQ CODE_B59F76				;$B59F91   |
	LDA.l DATA_BC8000,x			;$B59F93   |
	STA $40					;$B59F97   |
	INC A					;$B59F99   |
	STA $44					;$B59F9A   |
	LDA.l DATA_BC8002,x			;$B59F9C   |
	STA $42					;$B59FA0   |
	STA $46					;$B59FA2   |
	XBA					;$B59FA4   |
	AND #$00FF				;$B59FA5   |
	CLC					;$B59FA8   |
	ADC $0002,y				;$B59FA9   |
	STA $0014,y				;$B59FAC   |
	LDA $001C,y				;$B59FAF   |
	BMI CODE_B5A024				;$B59FB2   |
	LDA $000A,y				;$B59FB4   |
	SEC					;$B59FB7   |
	SBC #$0080				;$B59FB8   |
	SEC					;$B59FBB   |
	SBC $17C0				;$B59FBC   |
	STA $74					;$B59FBF   |
	ADC #$0090				;$B59FC1   |
	CMP #$0130				;$B59FC4   |
	BCS CODE_B59F76				;$B59FC7   |
	LDA $0006,y				;$B59FC9   |
	SBC $17BA				;$B59FCC   |
	STA $72					;$B59FCF   |
	CLC					;$B59FD1   |
	ADC #$0030				;$B59FD2   |
	CMP #$0160				;$B59FD5   |
	BCC CODE_B5A03C				;$B59FD8   |
	JMP CODE_B5A17C				;$B59FDA  /

CODE_B59FDD:
	LDA $0050,y				;$B59FDD  \
	BMI CODE_B59FE7				;$B59FE0   |
	AND #$FF00				;$B59FE2   |
	BRA CODE_B59FEA				;$B59FE5  /

CODE_B59FE7:
	ORA #$00FF				;$B59FE7  \
CODE_B59FEA:					;	   |
	XBA					;$B59FEA   |
	CLC					;$B59FEB   |
	ADC $000A,y				;$B59FEC   |
	SEC					;$B59FEF   |
	SBC #$0080				;$B59FF0   |
	SEC					;$B59FF3   |
	SBC $17C0				;$B59FF4   |
	STA $74					;$B59FF7   |
	ADC #$0090				;$B59FF9   |
	CMP #$0130				;$B59FFC   |
	BCS CODE_B5A021				;$B59FFF   |
	LDA $004F,y				;$B5A001   |
	BMI CODE_B5A00B				;$B5A004   |
	AND #$FF00				;$B5A006   |
	BRA CODE_B5A00E				;$B5A009  /

CODE_B5A00B:
	ORA #$00FF				;$B5A00B  \
CODE_B5A00E:					;	   |
	XBA					;$B5A00E   |
	CLC					;$B5A00F   |
	ADC $0006,y				;$B5A010   |
	SBC $17BA				;$B5A013   |
	STA $72					;$B5A016   |
	CLC					;$B5A018   |
	ADC #$0030				;$B5A019   |
	CMP #$0160				;$B5A01C   |
	BCC CODE_B5A03C				;$B5A01F   |
CODE_B5A021:					;	   |
	JMP CODE_B5A17C				;$B5A021  /

CODE_B5A024:
	BIT #$4000				;$B5A024  \
	BNE CODE_B5A068				;$B5A027   |
	AND #$000F				;$B5A029   |
	BNE CODE_B59FDD				;$B5A02C   |
	LDA $0006,y				;$B5A02E   |
	STA $72					;$B5A031   |
	LDA $000A,y				;$B5A033   |
	SEC					;$B5A036   |
	SBC #$0080				;$B5A037   |
	STA $74					;$B5A03A   |
CODE_B5A03C:					;	   |
	LDA $0012,y				;$B5A03C   |
	STA $32					;$B5A03F   |
	STA $34					;$B5A041   |
	BIT #$8000				;$B5A043   |
	BNE CODE_B5A0AD				;$B5A046   |
	BIT #$4000				;$B5A048   |
	BNE CODE_B5A08D				;$B5A04B   |
	LDA $72					;$B5A04D   |
	SEC					;$B5A04F   |
	SBC #$0080				;$B5A050   |
	STA $72					;$B5A053   |
	LDA $74					;$B5A055   |
	CLC					;$B5A057   |
	ADC #$0010				;$B5A058   |
	STA $74					;$B5A05B   |
	CPX #$02C4				;$B5A05D   |
	BCS CODE_B5A088				;$B5A060   |
	JSR CODE_B5A214				;$B5A062   |
	JMP CODE_B5A17C				;$B5A065  /

CODE_B5A068:
	BIT #$2000				;$B5A068  \
	BEQ CODE_B5A07F				;$B5A06B   |
	TYA					;$B5A06D   |
	LDY $0638				;$B5A06E   |
	CPY #$0010				;$B5A071   |
	BCS CODE_B5A07E				;$B5A074   |
	STA $063A,y				;$B5A076   |
	INY					;$B5A079   |
	INY					;$B5A07A   |
	STY $0638				;$B5A07B   |
CODE_B5A07E:					;	   |
	TAY					;$B5A07E   |
CODE_B5A07F:					;	   |
	LDA $0016,y				;$B5A07F   |
	STA $0018,y				;$B5A082   |
	JMP CODE_B5A17C				;$B5A085  /

CODE_B5A088:
	JSR CODE_B5A22F				;$B5A088  \
	BRA CODE_B5A0E4				;$B5A08B  /

CODE_B5A08D:
	LDA $72					;$B5A08D  \
	SEC					;$B5A08F   |
	SBC #$008F				;$B5A090   |
	STA $72					;$B5A093   |
	LDA $74					;$B5A095   |
	CLC					;$B5A097   |
	ADC #$0010				;$B5A098   |
	STA $74					;$B5A09B   |
	CPX #$02C4				;$B5A09D   |
	BCS CODE_B5A0A8				;$B5A0A0   |
	JSR CODE_B5A3B3				;$B5A0A2   |
	JMP CODE_B5A17C				;$B5A0A5  /

CODE_B5A0A8:
	JSR CODE_B5A3CE				;$B5A0A8  \
	BRA CODE_B5A0E4				;$B5A0AB  /

CODE_B5A0AD:
	BIT #$4000				;$B5A0AD  \
	BNE CODE_B5A0CC				;$B5A0B0   |
	LDA $72					;$B5A0B2   |
	SEC					;$B5A0B4   |
	SBC #$0080				;$B5A0B5   |
	STA $72					;$B5A0B8   |
	INC $74					;$B5A0BA   |
	CPX #$02C4				;$B5A0BC   |
	BCS CODE_B5A0C7				;$B5A0BF   |
	JSR CODE_B5A567				;$B5A0C1   |
	JMP CODE_B5A17C				;$B5A0C4  /

CODE_B5A0C7:
	JSR CODE_B5A582				;$B5A0C7  \
	BRA CODE_B5A0E4				;$B5A0CA  /

CODE_B5A0CC:
	LDA $72					;$B5A0CC  \
	SEC					;$B5A0CE   |
	SBC #$008F				;$B5A0CF   |
	STA $72					;$B5A0D2   |
	INC $74					;$B5A0D4   |
	CPX #$02C4				;$B5A0D6   |
	BCS CODE_B5A0E1				;$B5A0D9   |
	JSR CODE_B5A718				;$B5A0DB   |
	JMP CODE_B5A17C				;$B5A0DE  /

CODE_B5A0E1:
	JSR CODE_B5A733				;$B5A0E1  \
CODE_B5A0E4:					;	   |
	LDA $1730				;$B5A0E4   |
	CMP $78					;$B5A0E7   |
	BCS CODE_B5A0F7				;$B5A0E9   |
	LDX $62					;$B5A0EB   |
	LDA $16FE,x				;$B5A0ED   |
	TAX					;$B5A0F0   |
	LDA $1A,x				;$B5A0F1   |
	CMP $16,x				;$B5A0F3   |
	BNE CODE_B5A0FA				;$B5A0F5   |
CODE_B5A0F7:					;	   |
	JMP CODE_B5A17C				;$B5A0F7  /

CODE_B5A0FA:
	STA $16,x				;$B5A0FA  \
	LDX $1730				;$B5A0FC   |
	TYA					;$B5A0FF   |
	CLC					;$B5A100   |
	ADC $40					;$B5A101   |
	TAY					;$B5A103   |
	STA $1736,x				;$B5A104   |
	LDA $3B					;$B5A107   |
	AND #$00FF				;$B5A109   |
	ASL A					;$B5A10C   |
	ASL A					;$B5A10D   |
	ASL A					;$B5A10E   |
	ASL A					;$B5A10F   |
	ASL A					;$B5A110   |
	STA $1732,x				;$B5A111   |
	STA $54					;$B5A114   |
	TYA					;$B5A116   |
	CLC					;$B5A117   |
	ADC $54					;$B5A118   |
	TAY					;$B5A11A   |
	LDA $32					;$B5A11B   |
	AND #$01FF				;$B5A11D   |
	ASL A					;$B5A120   |
	ASL A					;$B5A121   |
	ASL A					;$B5A122   |
	ASL A					;$B5A123   |
	STA $1734,x				;$B5A124   |
	LDA $42					;$B5A127   |
	ORA #$FF00				;$B5A129   |
	STA $1738,x				;$B5A12C   |
	TXA					;$B5A12F   |
	CLC					;$B5A130   |
	ADC #$0008				;$B5A131   |
	TAX					;$B5A134   |
	STZ $1738,x				;$B5A135   |
	LDA $3D					;$B5A138   |
	AND #$000F				;$B5A13A   |
	CMP #$0000				;$B5A13D   |
	BEQ CODE_B5A176				;$B5A140   |
	ASL A					;$B5A142   |
	ASL A					;$B5A143   |
	ASL A					;$B5A144   |
	ASL A					;$B5A145   |
	ASL A					;$B5A146   |
	STA $1732,x				;$B5A147   |
	LDA $3C					;$B5A14A   |
	AND #$00FF				;$B5A14C   |
	ASL A					;$B5A14F   |
	ASL A					;$B5A150   |
	ASL A					;$B5A151   |
	ASL A					;$B5A152   |
	STA $54					;$B5A153   |
	LDA $32					;$B5A155   |
	AND #$01FF				;$B5A157   |
	ASL A					;$B5A15A   |
	ASL A					;$B5A15B   |
	ASL A					;$B5A15C   |
	ASL A					;$B5A15D   |
	CLC					;$B5A15E   |
	ADC $54					;$B5A15F   |
	STA $1734,x				;$B5A161   |
	TYA					;$B5A164   |
	STA $1736,x				;$B5A165   |
	LDA $42					;$B5A168   |
	ORA #$FF00				;$B5A16A   |
	STA $1738,x				;$B5A16D   |
	TXA					;$B5A170   |
	CLC					;$B5A171   |
	ADC #$0008				;$B5A172   |
	TAX					;$B5A175   |
CODE_B5A176:					;	   |
	STX $1730				;$B5A176   |
	STZ $1738,x				;$B5A179   |
CODE_B5A17C:					;	   |
	INC $62					;$B5A17C   |
	INC $62					;$B5A17E   |
	LDA $62					;$B5A180   |
	CMP #$0032				;$B5A182   |
	BEQ CODE_B5A18A				;$B5A185   |
	JMP CODE_B59F53				;$B5A187  /

CODE_B5A18A:
	PEA $8080				;$B5A18A  \
	PLB					;$B5A18D   |
	PLB					;$B5A18E   |
	RTL					;$B5A18F  /

DATA_B5A190:
	db $03, $0C, $30, $C0

DATA_B5A194:
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40
	db $01, $04, $10, $40, $01, $04, $10, $40


CODE_B5A214:
	LDY #$0000				;$B5A214  \
	LDA [$40],y				;$B5A217   |
	STA $36					;$B5A219   |
	LDY #$0002				;$B5A21B   |
	LDA [$40],y				;$B5A21E   |
	STA $38					;$B5A220   |
	LDY #$0004				;$B5A222   |
	LDA [$40],y				;$B5A225   |
	STA $3A					;$B5A227   |
	LDY #$0005				;$B5A229   |
	JMP CODE_B5A24E				;$B5A22C  /

CODE_B5A22F:
	LDY #$0000				;$B5A22F  \
	LDA [$40],y				;$B5A232   |
	STA $36					;$B5A234   |
	LDY #$0002				;$B5A236   |
	LDA [$40],y				;$B5A239   |
	STA $38					;$B5A23B   |
	LDY #$0004				;$B5A23D   |
	LDA [$40],y				;$B5A240   |
	STA $3A					;$B5A242   |
	LDY #$0006				;$B5A244   |
	LDA [$40],y				;$B5A247   |
	STA $3C					;$B5A249   |
	LDY #$0008				;$B5A24B   |
CODE_B5A24E:					;	   |
	LDA $70					;$B5A24E   |
	LSR A					;$B5A250   |
	LSR A					;$B5A251   |
	SEP #$20				;$B5A252   |
	TAX					;$B5A254   |
	ADC $36					;$B5A255   |
	BMI CODE_B5A25F				;$B5A257   |
	REP #$20				;$B5A259   |
	PLA					;$B5A25B   |
	JMP CODE_B5A18A				;$B5A25C  /

CODE_B5A25F:
	TXA					;$B5A25F  \
	LSR A					;$B5A260   |
	LSR A					;$B5A261   |
	AND #$851F				;$B5A262   |
	LSR $8A,x				;$B5A265   |
	AND #$AA03				;$B5A267   |
	LDA DATA_B5A190,x			;$B5A26A   |
	STA $3E					;$B5A26D   |
	LDX $70					;$B5A26F   |
	CLC					;$B5A271   |
CODE_B5A272:					;	   |
	DEC $36					;$B5A272   |
	BMI CODE_B5A2D0				;$B5A274   |
	LDA [$44],y				;$B5A276   |
	REP #$20				;$B5A278   |
	AND #$00FF				;$B5A27A   |
	ADC $74					;$B5A27D   |
	CMP #$00F0				;$B5A27F   |
	BCS CODE_B5A2BB				;$B5A282   |
	SBC #$000F				;$B5A284   |
	STA $01,x				;$B5A287   |
	LDA [$40],y				;$B5A289   |
	AND #$00FF				;$B5A28B   |
	CLC					;$B5A28E   |
	ADC $72					;$B5A28F   |
	CMP #$0100				;$B5A291   |
	SEP #$20				;$B5A294   |
	STA $00,x				;$B5A296   |
	LDA $3E					;$B5A298   |
	BCS CODE_B5A29E				;$B5A29A   |
	AND #$AA				;$B5A29C   |
CODE_B5A29E:					;	   |
	ORA ($56)				;$B5A29E   |
	STA ($56)				;$B5A2A0   |
	LDA $3E					;$B5A2A2   |
	BPL CODE_B5A2AD				;$B5A2A4   |
	INC $56					;$B5A2A6   |
	LDA #$03				;$B5A2A8   |
	CLC					;$B5A2AA   |
	BRA CODE_B5A2AF				;$B5A2AB  /

CODE_B5A2AD:
	ASL A					;$B5A2AD  \
	ASL A					;$B5A2AE   |
CODE_B5A2AF:					;	   |
	STA $3E					;$B5A2AF   |
	REP #$20				;$B5A2B1   |
	LDA $34					;$B5A2B3   |
	STA $02,x				;$B5A2B5   |
	INX					;$B5A2B7   |
	INX					;$B5A2B8   |
	INX					;$B5A2B9   |
	INX					;$B5A2BA   |
CODE_B5A2BB:					;	   |
	CLC					;$B5A2BB   |
	LDA $34					;$B5A2BC   |
	INC A					;$B5A2BE   |
	INC A					;$B5A2BF   |
	BIT #$0010				;$B5A2C0   |
	BEQ CODE_B5A2C8				;$B5A2C3   |
	ADC #$0010				;$B5A2C5   |
CODE_B5A2C8:					;	   |
	STA $34					;$B5A2C8   |
	SEP #$20				;$B5A2CA   |
	INY					;$B5A2CC   |
	INY					;$B5A2CD   |
	BRA CODE_B5A272				;$B5A2CE  /

CODE_B5A2D0:
	REP #$20				;$B5A2D0  \
	TXA					;$B5A2D2   |
	LSR A					;$B5A2D3   |
	LSR A					;$B5A2D4   |
	SEP #$20				;$B5A2D5   |
	ADC $37					;$B5A2D7   |
	BMI CODE_B5A2E3				;$B5A2D9   |
	REP #$20				;$B5A2DB   |
	STX $70					;$B5A2DD   |
	PLA					;$B5A2DF   |
	JMP CODE_B5A18A				;$B5A2E0  /

CODE_B5A2E3:
	LDA $38					;$B5A2E3  \
	CLC					;$B5A2E5   |
	ADC $32					;$B5A2E6   |
	STA $34					;$B5A2E8   |
CODE_B5A2EA:					;	   |
	DEC $37					;$B5A2EA   |
	BMI CODE_B5A33F				;$B5A2EC   |
	LDA [$44],y				;$B5A2EE   |
	REP #$20				;$B5A2F0   |
	AND #$00FF				;$B5A2F2   |
	CLC					;$B5A2F5   |
	ADC $74					;$B5A2F6   |
	CMP #$00F0				;$B5A2F8   |
	BCS CODE_B5A337				;$B5A2FB   |
	SBC #$000F				;$B5A2FD   |
	STA $01,x				;$B5A300   |
	LDA [$40],y				;$B5A302   |
	AND #$00FF				;$B5A304   |
	CLC					;$B5A307   |
	ADC $72					;$B5A308   |
	BIT #$0100				;$B5A30A   |
	SEP #$20				;$B5A30D   |
	STA $00,x				;$B5A30F   |
	BEQ CODE_B5A32D				;$B5A311   |
	STX $54					;$B5A313   |
	REP #$20				;$B5A315   |
	TXA					;$B5A317   |
	AND #$01FC				;$B5A318   |
	LSR A					;$B5A31B   |
	LSR A					;$B5A31C   |
	TAX					;$B5A31D   |
	LSR A					;$B5A31E   |
	LSR A					;$B5A31F   |
	SEP #$20				;$B5A320   |
	STA $56					;$B5A322   |
	LDA DATA_B5A194,x			;$B5A324   |
	ORA ($56)				;$B5A327   |
	STA ($56)				;$B5A329   |
	LDX $54					;$B5A32B   |
CODE_B5A32D:					;	   |
	REP #$20				;$B5A32D   |
	LDA $34					;$B5A32F   |
	STA $02,x				;$B5A331   |
	INX					;$B5A333   |
	INX					;$B5A334   |
	INX					;$B5A335   |
	INX					;$B5A336   |
CODE_B5A337:					;	   |
	INC $34					;$B5A337   |
	SEP #$20				;$B5A339   |
	INY					;$B5A33B   |
	INY					;$B5A33C   |
	BRA CODE_B5A2EA				;$B5A33D  /

CODE_B5A33F:
	REP #$20				;$B5A33F  \
	TXA					;$B5A341   |
	LSR A					;$B5A342   |
	LSR A					;$B5A343   |
	SEP #$20				;$B5A344   |
	ADC $39					;$B5A346   |
	BMI CODE_B5A352				;$B5A348   |
	REP #$20				;$B5A34A   |
	STX $70					;$B5A34C   |
	PLA					;$B5A34E   |
	JMP CODE_B5A18A				;$B5A34F  /

CODE_B5A352:
	LDA $3A					;$B5A352  \
	CLC					;$B5A354   |
	ADC $32					;$B5A355   |
	STA $34					;$B5A357   |
CODE_B5A359:					;	   |
	DEC $39					;$B5A359   |
	BMI CODE_B5A3AE				;$B5A35B   |
	LDA [$44],y				;$B5A35D   |
	REP #$20				;$B5A35F   |
	AND #$00FF				;$B5A361   |
	CLC					;$B5A364   |
	ADC $74					;$B5A365   |
	CMP #$00F0				;$B5A367   |
	BCS CODE_B5A3A6				;$B5A36A   |
	SBC #$000F				;$B5A36C   |
	STA $01,x				;$B5A36F   |
	LDA [$40],y				;$B5A371   |
	AND #$00FF				;$B5A373   |
	CLC					;$B5A376   |
	ADC $72					;$B5A377   |
	BIT #$0100				;$B5A379   |
	SEP #$20				;$B5A37C   |
	STA $00,x				;$B5A37E   |
	BEQ CODE_B5A39C				;$B5A380   |
	STX $54					;$B5A382   |
	REP #$20				;$B5A384   |
	TXA					;$B5A386   |
	AND #$01FC				;$B5A387   |
	LSR A					;$B5A38A   |
	LSR A					;$B5A38B   |
	TAX					;$B5A38C   |
	LSR A					;$B5A38D   |
	LSR A					;$B5A38E   |
	SEP #$20				;$B5A38F   |
	STA $56					;$B5A391   |
	LDA DATA_B5A194,x			;$B5A393   |
	ORA ($56)				;$B5A396   |
	STA ($56)				;$B5A398   |
	LDX $54					;$B5A39A   |
CODE_B5A39C:					;	   |
	REP #$20				;$B5A39C   |
	LDA $34					;$B5A39E   |
	STA $02,x				;$B5A3A0   |
	INX					;$B5A3A2   |
	INX					;$B5A3A3   |
	INX					;$B5A3A4   |
	INX					;$B5A3A5   |
CODE_B5A3A6:					;	   |
	INC $34					;$B5A3A6   |
	SEP #$20				;$B5A3A8   |
	INY					;$B5A3AA   |
	INY					;$B5A3AB   |
	BRA CODE_B5A359				;$B5A3AC  /

CODE_B5A3AE:
	REP #$20				;$B5A3AE  \
	STX $70					;$B5A3B0   |
	RTS					;$B5A3B2  /

CODE_B5A3B3:
	LDY #$0000				;$B5A3B3  \
	LDA [$40],y				;$B5A3B6   |
	STA $36					;$B5A3B8   |
	LDY #$0002				;$B5A3BA   |
	LDA [$40],y				;$B5A3BD   |
	STA $38					;$B5A3BF   |
	LDY #$0004				;$B5A3C1   |
	LDA [$40],y				;$B5A3C4   |
	STA $3A					;$B5A3C6   |
	LDY #$0005				;$B5A3C8   |
	JMP CODE_B5A3ED				;$B5A3CB  /

CODE_B5A3CE:
	LDY #$0000				;$B5A3CE  \
	LDA [$40],y				;$B5A3D1   |
	STA $36					;$B5A3D3   |
	LDY #$0002				;$B5A3D5   |
	LDA [$40],y				;$B5A3D8   |
	STA $38					;$B5A3DA   |
	LDY #$0004				;$B5A3DC   |
	LDA [$40],y				;$B5A3DF   |
	STA $3A					;$B5A3E1   |
	LDY #$0006				;$B5A3E3   |
	LDA [$40],y				;$B5A3E6   |
	STA $3C					;$B5A3E8   |
	LDY #$0008				;$B5A3EA   |
CODE_B5A3ED:					;	   |
	LDA $70					;$B5A3ED   |
	LSR A					;$B5A3EF   |
	LSR A					;$B5A3F0   |
	SEP #$20				;$B5A3F1   |
	TAX					;$B5A3F3   |
	ADC $36					;$B5A3F4   |
	BMI CODE_B5A3FE				;$B5A3F6   |
	REP #$20				;$B5A3F8   |
	PLA					;$B5A3FA   |
	JMP CODE_B5A18A				;$B5A3FB  /

CODE_B5A3FE:
	TXA					;$B5A3FE  \
	LSR A					;$B5A3FF   |
	LSR A					;$B5A400   |
	AND #$851F				;$B5A401   |
	LSR $8A,x				;$B5A404   |
	AND #$AA03				;$B5A406   |
	LDA DATA_B5A190,x			;$B5A409   |
	STA $3E					;$B5A40C   |
	LDX $70					;$B5A40E   |
	CLC					;$B5A410   |
CODE_B5A411:					;	   |
	DEC $36					;$B5A411   |
	BMI CODE_B5A472				;$B5A413   |
	LDA [$44],y				;$B5A415   |
	REP #$20				;$B5A417   |
	AND #$00FF				;$B5A419   |
	ADC $74					;$B5A41C   |
	CMP #$00F0				;$B5A41E   |
	BCS CODE_B5A45D				;$B5A421   |
	SBC #$000F				;$B5A423   |
	STA $01,x				;$B5A426   |
	LDA [$40],y				;$B5A428   |
	EOR #$00FF				;$B5A42A   |
	AND #$00FF				;$B5A42D   |
	CLC					;$B5A430   |
	ADC $72					;$B5A431   |
	CMP #$0100				;$B5A433   |
	SEP #$20				;$B5A436   |
	STA $00,x				;$B5A438   |
	LDA $3E					;$B5A43A   |
	BCS CODE_B5A440				;$B5A43C   |
	AND #$AA				;$B5A43E   |
CODE_B5A440:					;	   |
	ORA ($56)				;$B5A440   |
	STA ($56)				;$B5A442   |
	LDA $3E					;$B5A444   |
	BPL CODE_B5A44F				;$B5A446   |
	INC $56					;$B5A448   |
	LDA #$03				;$B5A44A   |
	CLC					;$B5A44C   |
	BRA CODE_B5A451				;$B5A44D  /

CODE_B5A44F:
	ASL A					;$B5A44F  \
	ASL A					;$B5A450   |
CODE_B5A451:					;	   |
	STA $3E					;$B5A451   |
	REP #$20				;$B5A453   |
	LDA $34					;$B5A455   |
	STA $02,x				;$B5A457   |
	INX					;$B5A459   |
	INX					;$B5A45A   |
	INX					;$B5A45B   |
	INX					;$B5A45C   |
CODE_B5A45D:					;	   |
	CLC					;$B5A45D   |
	LDA $34					;$B5A45E   |
	INC A					;$B5A460   |
	INC A					;$B5A461   |
	BIT #$0010				;$B5A462   |
	BEQ CODE_B5A46A				;$B5A465   |
	ADC #$0010				;$B5A467   |
CODE_B5A46A:					;	   |
	STA $34					;$B5A46A   |
	SEP #$20				;$B5A46C   |
	INY					;$B5A46E   |
	INY					;$B5A46F   |
	BRA CODE_B5A411				;$B5A470  /

CODE_B5A472:
	REP #$20				;$B5A472  \
	TXA					;$B5A474   |
	LSR A					;$B5A475   |
	LSR A					;$B5A476   |
	SEP #$20				;$B5A477   |
	ADC $37					;$B5A479   |
	BMI CODE_B5A485				;$B5A47B   |
	REP #$20				;$B5A47D   |
	STX $70					;$B5A47F   |
	PLA					;$B5A481   |
	JMP CODE_B5A18A				;$B5A482  /

CODE_B5A485:
	LDA $38					;$B5A485  \
	CLC					;$B5A487   |
	ADC $32					;$B5A488   |
	STA $34					;$B5A48A   |
	REP #$20				;$B5A48C   |
	LDA $72					;$B5A48E   |
	CLC					;$B5A490   |
	ADC #$0008				;$B5A491   |
	STA $72					;$B5A494   |
	SEP #$20				;$B5A496   |
CODE_B5A498:					;	   |
	DEC $37					;$B5A498   |
	BMI CODE_B5A4F0				;$B5A49A   |
	LDA [$44],y				;$B5A49C   |
	REP #$20				;$B5A49E   |
	AND #$00FF				;$B5A4A0   |
	CLC					;$B5A4A3   |
	ADC $74					;$B5A4A4   |
	CMP #$00F0				;$B5A4A6   |
	BCS CODE_B5A4E8				;$B5A4A9   |
	SBC #$000F				;$B5A4AB   |
	STA $01,x				;$B5A4AE   |
	LDA [$40],y				;$B5A4B0   |
	EOR #$00FF				;$B5A4B2   |
	AND #$00FF				;$B5A4B5   |
	CLC					;$B5A4B8   |
	ADC $72					;$B5A4B9   |
	BIT #$0100				;$B5A4BB   |
	SEP #$20				;$B5A4BE   |
	STA $00,x				;$B5A4C0   |
	BEQ CODE_B5A4DE				;$B5A4C2   |
	STX $54					;$B5A4C4   |
	REP #$20				;$B5A4C6   |
	TXA					;$B5A4C8   |
	AND #$01FC				;$B5A4C9   |
	LSR A					;$B5A4CC   |
	LSR A					;$B5A4CD   |
	TAX					;$B5A4CE   |
	LSR A					;$B5A4CF   |
	LSR A					;$B5A4D0   |
	SEP #$20				;$B5A4D1   |
	STA $56					;$B5A4D3   |
	LDA DATA_B5A194,x			;$B5A4D5   |
	ORA ($56)				;$B5A4D8   |
	STA ($56)				;$B5A4DA   |
	LDX $54					;$B5A4DC   |
CODE_B5A4DE:					;	   |
	REP #$20				;$B5A4DE   |
	LDA $34					;$B5A4E0   |
	STA $02,x				;$B5A4E2   |
	INX					;$B5A4E4   |
	INX					;$B5A4E5   |
	INX					;$B5A4E6   |
	INX					;$B5A4E7   |
CODE_B5A4E8:					;	   |
	INC $34					;$B5A4E8   |
	SEP #$20				;$B5A4EA   |
	INY					;$B5A4EC   |
	INY					;$B5A4ED   |
	BRA CODE_B5A498				;$B5A4EE  /

CODE_B5A4F0:
	REP #$20				;$B5A4F0  \
	TXA					;$B5A4F2   |
	LSR A					;$B5A4F3   |
	LSR A					;$B5A4F4   |
	SEP #$20				;$B5A4F5   |
	ADC $39					;$B5A4F7   |
	BMI CODE_B5A503				;$B5A4F9   |
	REP #$20				;$B5A4FB   |
	STX $70					;$B5A4FD   |
	PLA					;$B5A4FF   |
	JMP CODE_B5A18A				;$B5A500  /

CODE_B5A503:
	LDA $3A					;$B5A503  \
	CLC					;$B5A505   |
	ADC $32					;$B5A506   |
	STA $34					;$B5A508   |
CODE_B5A50A:					;	   |
	DEC $39					;$B5A50A   |
	BMI CODE_B5A562				;$B5A50C   |
	LDA [$44],y				;$B5A50E   |
	REP #$20				;$B5A510   |
	AND #$00FF				;$B5A512   |
	CLC					;$B5A515   |
	ADC $74					;$B5A516   |
	CMP #$00F0				;$B5A518   |
	BCS CODE_B5A55A				;$B5A51B   |
	SBC #$000F				;$B5A51D   |
	STA $01,x				;$B5A520   |
	LDA [$40],y				;$B5A522   |
	EOR #$00FF				;$B5A524   |
	AND #$00FF				;$B5A527   |
	CLC					;$B5A52A   |
	ADC $72					;$B5A52B   |
	BIT #$0100				;$B5A52D   |
	SEP #$20				;$B5A530   |
	STA $00,x				;$B5A532   |
	BEQ CODE_B5A550				;$B5A534   |
	STX $54					;$B5A536   |
	REP #$20				;$B5A538   |
	TXA					;$B5A53A   |
	AND #$01FC				;$B5A53B   |
	LSR A					;$B5A53E   |
	LSR A					;$B5A53F   |
	TAX					;$B5A540   |
	LSR A					;$B5A541   |
	LSR A					;$B5A542   |
	SEP #$20				;$B5A543   |
	STA $56					;$B5A545   |
	LDA DATA_B5A194,x			;$B5A547   |
	ORA ($56)				;$B5A54A   |
	STA ($56)				;$B5A54C   |
	LDX $54					;$B5A54E   |
CODE_B5A550:					;	   |
	REP #$20				;$B5A550   |
	LDA $34					;$B5A552   |
	STA $02,x				;$B5A554   |
	INX					;$B5A556   |
	INX					;$B5A557   |
	INX					;$B5A558   |
	INX					;$B5A559   |
CODE_B5A55A:					;	   |
	INC $34					;$B5A55A   |
	SEP #$20				;$B5A55C   |
	INY					;$B5A55E   |
	INY					;$B5A55F   |
	BRA CODE_B5A50A				;$B5A560  /

CODE_B5A562:
	REP #$20				;$B5A562  \
	STX $70					;$B5A564   |
	RTS					;$B5A566  /

CODE_B5A567:
	LDY #$0000				;$B5A567  \
	LDA [$40],y				;$B5A56A   |
	STA $36					;$B5A56C   |
	LDY #$0002				;$B5A56E   |
	LDA [$40],y				;$B5A571   |
	STA $38					;$B5A573   |
	LDY #$0004				;$B5A575   |
	LDA [$40],y				;$B5A578   |
	STA $3A					;$B5A57A   |
	LDY #$0005				;$B5A57C   |
	JMP CODE_B5A5A1				;$B5A57F  /

CODE_B5A582:
	LDY #$0000				;$B5A582  \
	LDA [$40],y				;$B5A585   |
	STA $36					;$B5A587   |
	LDY #$0002				;$B5A589   |
	LDA [$40],y				;$B5A58C   |
	STA $38					;$B5A58E   |
	LDY #$0004				;$B5A590   |
	LDA [$40],y				;$B5A593   |
	STA $3A					;$B5A595   |
	LDY #$0006				;$B5A597   |
	LDA [$40],y				;$B5A59A   |
	STA $3C					;$B5A59C   |
	LDY #$0008				;$B5A59E   |
CODE_B5A5A1:					;	   |
	LDA $70					;$B5A5A1   |
	LSR A					;$B5A5A3   |
	LSR A					;$B5A5A4   |
	SEP #$20				;$B5A5A5   |
	TAX					;$B5A5A7   |
	ADC $36					;$B5A5A8   |
	BMI CODE_B5A5B2				;$B5A5AA   |
	REP #$20				;$B5A5AC   |
	PLA					;$B5A5AE   |
	JMP CODE_B5A18A				;$B5A5AF  /

CODE_B5A5B2:
	TXA					;$B5A5B2  \
	LSR A					;$B5A5B3   |
	LSR A					;$B5A5B4   |
	AND #$1F				;$B5A5B5   |
	STA $56					;$B5A5B7   |
	TXA					;$B5A5B9   |
	AND #$03				;$B5A5BA   |
	TAX					;$B5A5BC   |
	LDA DATA_B5A190,x			;$B5A5BD   |
	STA $3E					;$B5A5C0   |
	LDX $70					;$B5A5C2   |
	CLC					;$B5A5C4   |
CODE_B5A5C5:					;	   |
	DEC $36					;$B5A5C5   |
	BMI CODE_B5A625				;$B5A5C7   |
	LDA [$44],y				;$B5A5C9   |
	EOR #$FF				;$B5A5CB   |
	REP #$20				;$B5A5CD   |
	AND #$00FF				;$B5A5CF   |
	ADC $74					;$B5A5D2   |
	CMP #$00F0				;$B5A5D4   |
	BCS CODE_B5A610				;$B5A5D7   |
	SBC #$000F				;$B5A5D9   |
	STA $01,x				;$B5A5DC   |
	LDA [$40],y				;$B5A5DE   |
	AND #$00FF				;$B5A5E0   |
	CLC					;$B5A5E3   |
	ADC $72					;$B5A5E4   |
	CMP #$0100				;$B5A5E6   |
	SEP #$20				;$B5A5E9   |
	STA $00,x				;$B5A5EB   |
	LDA $3E					;$B5A5ED   |
	BCS CODE_B5A5F3				;$B5A5EF   |
	AND #$AA				;$B5A5F1   |
CODE_B5A5F3:					;	   |
	ORA ($56)				;$B5A5F3   |
	STA ($56)				;$B5A5F5   |
	LDA $3E					;$B5A5F7   |
	BPL CODE_B5A602				;$B5A5F9   |
	INC $56					;$B5A5FB   |
	LDA #$03				;$B5A5FD   |
	CLC					;$B5A5FF   |
	BRA CODE_B5A604				;$B5A600  /

CODE_B5A602:
	ASL A					;$B5A602  \
	ASL A					;$B5A603   |
CODE_B5A604:					;	   |
	STA $3E					;$B5A604   |
	REP #$20				;$B5A606   |
	LDA $34					;$B5A608   |
	STA $02,x				;$B5A60A   |
	INX					;$B5A60C   |
	INX					;$B5A60D   |
	INX					;$B5A60E   |
	INX					;$B5A60F   |
CODE_B5A610:					;	   |
	CLC					;$B5A610   |
	LDA $34					;$B5A611   |
	INC A					;$B5A613   |
	INC A					;$B5A614   |
	BIT #$0010				;$B5A615   |
	BEQ CODE_B5A61D				;$B5A618   |
	ADC #$0010				;$B5A61A   |
CODE_B5A61D:					;	   |
	STA $34					;$B5A61D   |
	SEP #$20				;$B5A61F   |
	INY					;$B5A621   |
	INY					;$B5A622   |
	BRA CODE_B5A5C5				;$B5A623  /

CODE_B5A625:
	REP #$20				;$B5A625  \
	TXA					;$B5A627   |
	LSR A					;$B5A628   |
	LSR A					;$B5A629   |
	SEP #$20				;$B5A62A   |
	ADC $37					;$B5A62C   |
	BMI CODE_B5A638				;$B5A62E   |
	REP #$20				;$B5A630   |
	STX $70					;$B5A632   |
	PLA					;$B5A634   |
	JMP CODE_B5A18A				;$B5A635  /

CODE_B5A638:
	LDA $38					;$B5A638  \
	CLC					;$B5A63A   |
	ADC $32					;$B5A63B   |
	STA $34					;$B5A63D   |
	REP #$20				;$B5A63F   |
	LDA $74					;$B5A641   |
	CLC					;$B5A643   |
	ADC #$0008				;$B5A644   |
	STA $74					;$B5A647   |
	SEP #$20				;$B5A649   |
CODE_B5A64B:					;	   |
	DEC $37					;$B5A64B   |
	BMI CODE_B5A6A2				;$B5A64D   |
	LDA [$44],y				;$B5A64F   |
	EOR #$FF				;$B5A651   |
	REP #$20				;$B5A653   |
	AND #$00FF				;$B5A655   |
	CLC					;$B5A658   |
	ADC $74					;$B5A659   |
	CMP #$00F0				;$B5A65B   |
	BCS CODE_B5A69A				;$B5A65E   |
	SBC #$000F				;$B5A660   |
	STA $01,x				;$B5A663   |
	LDA [$40],y				;$B5A665   |
	AND #$00FF				;$B5A667   |
	CLC					;$B5A66A   |
	ADC $72					;$B5A66B   |
	BIT #$0100				;$B5A66D   |
	SEP #$20				;$B5A670   |
	STA $00,x				;$B5A672   |
	BEQ CODE_B5A690				;$B5A674   |
	STX $54					;$B5A676   |
	REP #$20				;$B5A678   |
	TXA					;$B5A67A   |
	AND #$01FC				;$B5A67B   |
	LSR A					;$B5A67E   |
	LSR A					;$B5A67F   |
	TAX					;$B5A680   |
	LSR A					;$B5A681   |
	LSR A					;$B5A682   |
	SEP #$20				;$B5A683   |
	STA $56					;$B5A685   |
	LDA DATA_B5A194,x			;$B5A687   |
	ORA ($56)				;$B5A68A   |
	STA ($56)				;$B5A68C   |
	LDX $54					;$B5A68E   |
CODE_B5A690:					;	   |
	REP #$20				;$B5A690   |
	LDA $34					;$B5A692   |
	STA $02,x				;$B5A694   |
	INX					;$B5A696   |
	INX					;$B5A697   |
	INX					;$B5A698   |
	INX					;$B5A699   |
CODE_B5A69A:					;	   |
	INC $34					;$B5A69A   |
	SEP #$20				;$B5A69C   |
	INY					;$B5A69E   |
	INY					;$B5A69F   |
	BRA CODE_B5A64B				;$B5A6A0  /

CODE_B5A6A2:
	REP #$20				;$B5A6A2  \
	TXA					;$B5A6A4   |
	LSR A					;$B5A6A5   |
	LSR A					;$B5A6A6   |
	SEP #$20				;$B5A6A7   |
	ADC $39					;$B5A6A9   |
	BMI CODE_B5A6B5				;$B5A6AB   |
	REP #$20				;$B5A6AD   |
	STX $70					;$B5A6AF   |
	PLA					;$B5A6B1   |
	JMP CODE_B5A18A				;$B5A6B2  /

CODE_B5A6B5:
	LDA $3A					;$B5A6B5  \
	CLC					;$B5A6B7   |
	ADC $32					;$B5A6B8   |
	STA $34					;$B5A6BA   |
CODE_B5A6BC:					;	   |
	DEC $39					;$B5A6BC   |
	BMI CODE_B5A713				;$B5A6BE   |
	LDA [$44],y				;$B5A6C0   |
	EOR #$FF				;$B5A6C2   |
	REP #$20				;$B5A6C4   |
	AND #$00FF				;$B5A6C6   |
	CLC					;$B5A6C9   |
	ADC $74					;$B5A6CA   |
	CMP #$00F0				;$B5A6CC   |
	BCS CODE_B5A70B				;$B5A6CF   |
	SBC #$000F				;$B5A6D1   |
	STA $01,x				;$B5A6D4   |
	LDA [$40],y				;$B5A6D6   |
	AND #$00FF				;$B5A6D8   |
	CLC					;$B5A6DB   |
	ADC $72					;$B5A6DC   |
	BIT #$0100				;$B5A6DE   |
	SEP #$20				;$B5A6E1   |
	STA $00,x				;$B5A6E3   |
	BEQ CODE_B5A701				;$B5A6E5   |
	STX $54					;$B5A6E7   |
	REP #$20				;$B5A6E9   |
	TXA					;$B5A6EB   |
	AND #$01FC				;$B5A6EC   |
	LSR A					;$B5A6EF   |
	LSR A					;$B5A6F0   |
	TAX					;$B5A6F1   |
	LSR A					;$B5A6F2   |
	LSR A					;$B5A6F3   |
	SEP #$20				;$B5A6F4   |
	STA $56					;$B5A6F6   |
	LDA DATA_B5A194,x			;$B5A6F8   |
	ORA ($56)				;$B5A6FB   |
	STA ($56)				;$B5A6FD   |
	LDX $54					;$B5A6FF   |
CODE_B5A701:					;	   |
	REP #$20				;$B5A701   |
	LDA $34					;$B5A703   |
	STA $02,x				;$B5A705   |
	INX					;$B5A707   |
	INX					;$B5A708   |
	INX					;$B5A709   |
	INX					;$B5A70A   |
CODE_B5A70B:					;	   |
	INC $34					;$B5A70B   |
	SEP #$20				;$B5A70D   |
	INY					;$B5A70F   |
	INY					;$B5A710   |
	BRA CODE_B5A6BC				;$B5A711  /



CODE_B5A713:
	REP #$20				;$B5A713  \
	STX $70					;$B5A715   |
	RTS					;$B5A717  /

CODE_B5A718:
	LDY #$0000				;$B5A718  \
	LDA [$40],y				;$B5A71B   |
	STA $36					;$B5A71D   |
	LDY #$0002				;$B5A71F   |
	LDA [$40],y				;$B5A722   |
	STA $38					;$B5A724   |
	LDY #$0004				;$B5A726   |
	LDA [$40],y				;$B5A729   |
	STA $3A					;$B5A72B   |
	LDY #$0005				;$B5A72D   |
	JMP CODE_B5A752				;$B5A730  /

CODE_B5A733:
	LDY #$0000				;$B5A733  \
	LDA [$40],y				;$B5A736   |
	STA $36					;$B5A738   |
	LDY #$0002				;$B5A73A   |
	LDA [$40],y				;$B5A73D   |
	STA $38					;$B5A73F   |
	LDY #$0004				;$B5A741   |
	LDA [$40],y				;$B5A744   |
	STA $3A					;$B5A746   |
	LDY #$0006				;$B5A748   |
	LDA [$40],y				;$B5A74B   |
	STA $3C					;$B5A74D   |
	LDY #$0008				;$B5A74F   |
CODE_B5A752:					;	   |
	LDA $70					;$B5A752   |
	LSR A					;$B5A754   |
	LSR A					;$B5A755   |
	SEP #$20				;$B5A756   |
	TAX					;$B5A758   |
	ADC $36					;$B5A759   |
	BMI CODE_B5A763				;$B5A75B   |
	REP #$20				;$B5A75D   |
	PLA					;$B5A75F   |
	JMP CODE_B5A18A				;$B5A760  /

CODE_B5A763:
	TXA					;$B5A763  \
	LSR A					;$B5A764   |
	LSR A					;$B5A765   |
	AND #$1F				;$B5A766   |
	STA $56					;$B5A768   |
	TXA					;$B5A76A   |
	AND #$03				;$B5A76B   |
	TAX					;$B5A76D   |
	LDA DATA_B5A190,x			;$B5A76E   |
	STA $3E					;$B5A771   |
	LDX $70					;$B5A773   |
	CLC					;$B5A775   |
CODE_B5A776:					;	   |
	DEC $36					;$B5A776   |
	BMI CODE_B5A7D9				;$B5A778   |
	LDA [$44],y				;$B5A77A   |
	EOR #$FF				;$B5A77C   |
	REP #$20				;$B5A77E   |
	AND #$00FF				;$B5A780   |
	ADC $74					;$B5A783   |
	CMP #$00F0				;$B5A785   |
	BCS CODE_B5A7C4				;$B5A788   |
	SBC #$000F				;$B5A78A   |
	STA $01,x				;$B5A78D   |
	LDA [$40],y				;$B5A78F   |
	EOR #$00FF				;$B5A791   |
	AND #$00FF				;$B5A794   |
	CLC					;$B5A797   |
	ADC $72					;$B5A798   |
	CMP #$0100				;$B5A79A   |
	SEP #$20				;$B5A79D   |
	STA $00,x				;$B5A79F   |
	LDA $3E					;$B5A7A1   |
	BCS CODE_B5A7A7				;$B5A7A3   |
	AND #$AA				;$B5A7A5   |
CODE_B5A7A7:					;	   |
	ORA ($56)				;$B5A7A7   |
	STA ($56)				;$B5A7A9   |
	LDA $3E					;$B5A7AB   |
	BPL CODE_B5A7B6				;$B5A7AD   |
	INC $56					;$B5A7AF   |
	LDA #$03				;$B5A7B1   |
	CLC					;$B5A7B3   |
	BRA CODE_B5A7B8				;$B5A7B4  /

CODE_B5A7B6:
	ASL A					;$B5A7B6  \
	ASL A					;$B5A7B7   |
CODE_B5A7B8:					;	   |
	STA $3E					;$B5A7B8   |
	REP #$20				;$B5A7BA   |
	LDA $34					;$B5A7BC   |
	STA $02,x				;$B5A7BE   |
	INX					;$B5A7C0   |
	INX					;$B5A7C1   |
	INX					;$B5A7C2   |
	INX					;$B5A7C3   |
CODE_B5A7C4:					;	   |
	CLC					;$B5A7C4   |
	LDA $34					;$B5A7C5   |
	INC A					;$B5A7C7   |
	INC A					;$B5A7C8   |
	BIT #$0010				;$B5A7C9   |
	BEQ CODE_B5A7D1				;$B5A7CC   |
	ADC #$0010				;$B5A7CE   |
CODE_B5A7D1:					;	   |
	STA $34					;$B5A7D1   |
	SEP #$20				;$B5A7D3   |
	INY					;$B5A7D5   |
	INY					;$B5A7D6   |
	BRA CODE_B5A776				;$B5A7D7  /

CODE_B5A7D9:
	REP #$20				;$B5A7D9  \
	TXA					;$B5A7DB   |
	LSR A					;$B5A7DC   |
	LSR A					;$B5A7DD   |
	SEP #$20				;$B5A7DE   |
	ADC $37					;$B5A7E0   |
	BMI CODE_B5A7EC				;$B5A7E2   |
	REP #$20				;$B5A7E4   |
	STX $70					;$B5A7E6   |
	PLA					;$B5A7E8   |
	JMP CODE_B5A18A				;$B5A7E9  /

CODE_B5A7EC:
	LDA $38					;$B5A7EC  \
	CLC					;$B5A7EE   |
	ADC $32					;$B5A7EF   |
	STA $34					;$B5A7F1   |
	REP #$20				;$B5A7F3   |
	LDA $72					;$B5A7F5   |
	CLC					;$B5A7F7   |
	ADC #$0008				;$B5A7F8   |
	STA $72					;$B5A7FB   |
	LDA $74					;$B5A7FD   |
	CLC					;$B5A7FF   |
	ADC #$0008				;$B5A800   |
	STA $74					;$B5A803   |
	SEP #$20				;$B5A805   |
CODE_B5A807:					;	   |
	DEC $37					;$B5A807   |
	BMI CODE_B5A861				;$B5A809   |
	LDA [$44],y				;$B5A80B   |
	EOR #$FF				;$B5A80D   |
	REP #$20				;$B5A80F   |
	AND #$00FF				;$B5A811   |
	CLC					;$B5A814   |
	ADC $74					;$B5A815   |
	CMP #$00F0				;$B5A817   |
	BCS CODE_B5A859				;$B5A81A   |
	SBC #$000F				;$B5A81C   |
	STA $01,x				;$B5A81F   |
	LDA [$40],y				;$B5A821   |
	EOR #$00FF				;$B5A823   |
	AND #$00FF				;$B5A826   |
	CLC					;$B5A829   |
	ADC $72					;$B5A82A   |
	BIT #$0100				;$B5A82C   |
	SEP #$20				;$B5A82F   |
	STA $00,x				;$B5A831   |
	BEQ CODE_B5A84F				;$B5A833   |
	STX $54					;$B5A835   |
	REP #$20				;$B5A837   |
	TXA					;$B5A839   |
	AND #$01FC				;$B5A83A   |
	LSR A					;$B5A83D   |
	LSR A					;$B5A83E   |
	TAX					;$B5A83F   |
	LSR A					;$B5A840   |
	LSR A					;$B5A841   |
	SEP #$20				;$B5A842   |
	STA $56					;$B5A844   |
	LDA DATA_B5A194,x			;$B5A846   |
	ORA ($56)				;$B5A849   |
	STA ($56)				;$B5A84B   |
	LDX $54					;$B5A84D   |
CODE_B5A84F:					;	   |
	REP #$20				;$B5A84F   |
	LDA $34					;$B5A851   |
	STA $02,x				;$B5A853   |
	INX					;$B5A855   |
	INX					;$B5A856   |
	INX					;$B5A857   |
	INX					;$B5A858   |
CODE_B5A859:					;	   |
	INC $34					;$B5A859   |
	SEP #$20				;$B5A85B   |
	INY					;$B5A85D   |
	INY					;$B5A85E   |
	BRA CODE_B5A807				;$B5A85F  /

CODE_B5A861:
	REP #$20				;$B5A861  \
	TXA					;$B5A863   |
	LSR A					;$B5A864   |
	LSR A					;$B5A865   |
	SEP #$20				;$B5A866   |
	ADC $39					;$B5A868   |
	BMI CODE_B5A874				;$B5A86A   |
	REP #$20				;$B5A86C   |
	STX $70					;$B5A86E   |
	PLA					;$B5A870   |
	JMP CODE_B5A18A				;$B5A871  /

CODE_B5A874:
	LDA $3A					;$B5A874  \
	CLC					;$B5A876   |
	ADC $32					;$B5A877   |
	STA $34					;$B5A879   |
CODE_B5A87B:					;	   |
	DEC $39					;$B5A87B   |
	BMI CODE_B5A8D5				;$B5A87D   |
	LDA [$44],y				;$B5A87F   |
	EOR #$FF				;$B5A881   |
	REP #$20				;$B5A883   |
	AND #$00FF				;$B5A885   |
	CLC					;$B5A888   |
	ADC $74					;$B5A889   |
	CMP #$00F0				;$B5A88B   |
	BCS CODE_B5A8CD				;$B5A88E   |
	SBC #$000F				;$B5A890   |
	STA $01,x				;$B5A893   |
	LDA [$40],y				;$B5A895   |
	EOR #$00FF				;$B5A897   |
	AND #$00FF				;$B5A89A   |
	CLC					;$B5A89D   |
	ADC $72					;$B5A89E   |
	BIT #$0100				;$B5A8A0   |
	SEP #$20				;$B5A8A3   |
	STA $00,x				;$B5A8A5   |
	BEQ CODE_B5A8C3				;$B5A8A7   |
	STX $54					;$B5A8A9   |
	REP #$20				;$B5A8AB   |
	TXA					;$B5A8AD   |
	AND #$01FC				;$B5A8AE   |
	LSR A					;$B5A8B1   |
	LSR A					;$B5A8B2   |
	TAX					;$B5A8B3   |
	LSR A					;$B5A8B4   |
	LSR A					;$B5A8B5   |
	SEP #$20				;$B5A8B6   |
	STA $56					;$B5A8B8   |
	LDA DATA_B5A194,x			;$B5A8BA   |
	ORA ($56)				;$B5A8BD   |
	STA ($56)				;$B5A8BF   |
	LDX $54					;$B5A8C1   |
CODE_B5A8C3:					;	   |
	REP #$20				;$B5A8C3   |
	LDA $34					;$B5A8C5   |
	STA $02,x				;$B5A8C7   |
	INX					;$B5A8C9   |
	INX					;$B5A8CA   |
	INX					;$B5A8CB   |
	INX					;$B5A8CC   |
CODE_B5A8CD:					;	   |
	INC $34					;$B5A8CD   |
	SEP #$20				;$B5A8CF   |
	INY					;$B5A8D1   |
	INY					;$B5A8D2   |
	BRA CODE_B5A87B				;$B5A8D3  /

CODE_B5A8D5:
	REP #$20				;$B5A8D5  \
	STX $70					;$B5A8D7   |
	RTS					;$B5A8D9  /

CODE_B5A8DA:
	LDA $16FE				;$B5A8DA  \
	TAY					;$B5A8DD   |
	LDA $0014,y				;$B5A8DE   |
	STA $54					;$B5A8E1   |
	LDX #$16FC				;$B5A8E3   |
CODE_B5A8E6:					;	   |
	LDY $04,x				;$B5A8E6   |
	LDA $0014,y				;$B5A8E8   |
	CMP $54					;$B5A8EB   |
	STA $54					;$B5A8ED   |
	BCC CODE_B5A8F9				;$B5A8EF   |
	BEQ CODE_B5A8F9				;$B5A8F1   |
	LDA $02,x				;$B5A8F3   |
	STA $04,x				;$B5A8F5   |
	STY $02,x				;$B5A8F7   |
CODE_B5A8F9:					;	   |
	INX					;$B5A8F9   |
	INX					;$B5A8FA   |
	CPX #$172C				;$B5A8FB   |
	BNE CODE_B5A8E6				;$B5A8FE   |
CODE_B5A900:					;	   |
	LDY $00,x				;$B5A900   |
	LDA $0014,y				;$B5A902   |
	CMP $54					;$B5A905   |
	STA $54					;$B5A907   |
	BCS CODE_B5A911				;$B5A909   |
	LDA $02,x				;$B5A90B   |
	STA $00,x				;$B5A90D   |
	STY $02,x				;$B5A90F   |
CODE_B5A911:					;	   |
	DEX					;$B5A911   |
	DEX					;$B5A912   |
	CPX #$16FC				;$B5A913   |
	BNE CODE_B5A900				;$B5A916   |
	RTL					;$B5A918  /

CODE_B5A919:
	LDA #$1801				;$B5A919  \
	STA DMA[0].settings			;$B5A91C   |
	SEP #$10				;$B5A91F   |
	LDY #$01				;$B5A921   |
	LDX #$00				;$B5A923   |
CODE_B5A925:					;	   |
	LDA $1738,x				;$B5A925   |
	BPL CODE_B5A94D				;$B5A928   |
	STA DMA[0].source_bank			;$B5A92A   |
	LDA $1732,x				;$B5A92D   |
	STA DMA[0].size				;$B5A930   |
	LDA $1734,x				;$B5A933   |
	STA PPU.vram_address			;$B5A936   |
	LDA $1736,x				;$B5A939   |
	STA DMA[0].source			;$B5A93C   |
	STZ $1738,x				;$B5A93F   |
	STY CPU.enable_dma			;$B5A942   |
	TXA					;$B5A945   |
	CLC					;$B5A946   |
	ADC #$0008				;$B5A947   |
	TAX					;$B5A94A   |
	BRA CODE_B5A925				;$B5A94B  /

CODE_B5A94D:
	REP #$10				;$B5A94D  \
	RTL					;$B5A94F  /

CODE_B5A950:
	LDA $B8					;$B5A950  \
	AND #$FFF8				;$B5A952   |
	SEC					;$B5A955   |
	SBC $C6					;$B5A956   |
	BNE CODE_B5A95B				;$B5A958   |
	RTL					;$B5A95A  /

CODE_B5A95B:
	LDA $B6					;$B5A95B  \
	BCC CODE_B5A96A				;$B5A95D   |
	ADC #$00FF				;$B5A95F   |
	CMP #$0500				;$B5A962   |
	BCC CODE_B5A96A				;$B5A965   |
	SBC #$0500				;$B5A967   |
CODE_B5A96A:					;	   |
	TAY					;$B5A96A   |
	AND #$0FE0				;$B5A96B   |
	CLC					;$B5A96E   |
	ADC #$26A7				;$B5A96F   |
	STA $32					;$B5A972   |
	LDA $17C0				;$B5A974   |
	SEC					;$B5A977   |
	SBC #$0100				;$B5A978   |
	AND #$01E0				;$B5A97B   |
	LSR A					;$B5A97E   |
	LSR A					;$B5A97F   |
	LSR A					;$B5A980   |
	LSR A					;$B5A981   |
	CLC					;$B5A982   |
	ADC $32					;$B5A983   |
	STA $32					;$B5A985   |
	TYA					;$B5A987   |
	AND #$0018				;$B5A988   |
	LSR A					;$B5A98B   |
	LSR A					;$B5A98C   |
	ADC #$2087				;$B5A98D   |
	STA $34					;$B5A990   |
	TYA					;$B5A992   |
	AND #$0018				;$B5A993   |
	EOR #$0018				;$B5A996   |
	LSR A					;$B5A999   |
	LSR A					;$B5A99A   |
	ADC #$2087				;$B5A99B   |
	STA $36					;$B5A99E   |
	LDA #$00F5				;$B5A9A0   |
	PHA					;$B5A9A3   |
	PLB					;$B5A9A4   |
	LDX #$195A				;$B5A9A5   |
CODE_B5A9A8:					;	   |
	LDA ($32)				;$B5A9A8   |
	BMI CODE_B5AA09				;$B5A9AA   |
	BIT #$4000				;$B5A9AC   |
	BNE CODE_B5A9E1				;$B5A9AF   |
	ASL A					;$B5A9B1   |
	ASL A					;$B5A9B2   |
	ASL A					;$B5A9B3   |
	ASL A					;$B5A9B4   |
	ASL A					;$B5A9B5   |
	ADC $34					;$B5A9B6   |
	TAY					;$B5A9B8   |
	LDA $0000,y				;$B5A9B9   |
	STA $00,x				;$B5A9BC   |
	LDA $0008,y				;$B5A9BE   |
	STA $02,x				;$B5A9C1   |
	LDA $0010,y				;$B5A9C3   |
	STA $04,x				;$B5A9C6   |
	LDA $0018,y				;$B5A9C8   |
CODE_B5A9CB:					;	   |
	STA $06,x				;$B5A9CB   |
	INC $32					;$B5A9CD   |
	INC $32					;$B5A9CF   |
	TXA					;$B5A9D1   |
	CLC					;$B5A9D2   |
	ADC #$0008				;$B5A9D3   |
	TAX					;$B5A9D6   |
	CMP #$19A2				;$B5A9D7   |
	BNE CODE_B5A9A8				;$B5A9DA   |
	PLB					;$B5A9DC   |
	JSR CODE_B5AA5F				;$B5A9DD   |
	RTL					;$B5A9E0  /

CODE_B5A9E1:
	ASL A					;$B5A9E1  \
	ASL A					;$B5A9E2   |
	ASL A					;$B5A9E3   |
	ASL A					;$B5A9E4   |
	ASL A					;$B5A9E5   |
	ADC $36					;$B5A9E6   |
	TAY					;$B5A9E8   |
	LDA $0000,y				;$B5A9E9   |
	EOR #$4000				;$B5A9EC   |
	STA $00,x				;$B5A9EF   |
	LDA $0008,y				;$B5A9F1   |
	EOR #$4000				;$B5A9F4   |
	STA $02,x				;$B5A9F7   |
	LDA $0010,y				;$B5A9F9   |
	EOR #$4000				;$B5A9FC   |
	STA $04,x				;$B5A9FF   |
	LDA $0018,y				;$B5AA01   |
	EOR #$4000				;$B5AA04   |
	BRA CODE_B5A9CB				;$B5AA07  /

CODE_B5AA09:
	BIT #$4000				;$B5AA09  \
	BNE CODE_B5AA36				;$B5AA0C   |
	ASL A					;$B5AA0E   |
	ASL A					;$B5AA0F   |
	ASL A					;$B5AA10   |
	ASL A					;$B5AA11   |
	ASL A					;$B5AA12   |
	ADC $34					;$B5AA13   |
	TAY					;$B5AA15   |
	LDA $0018,y				;$B5AA16   |
	EOR #$8000				;$B5AA19   |
	STA $00,x				;$B5AA1C   |
	LDA $0010,y				;$B5AA1E   |
	EOR #$8000				;$B5AA21   |
	STA $02,x				;$B5AA24   |
	LDA $0008,y				;$B5AA26   |
	EOR #$8000				;$B5AA29   |
	STA $04,x				;$B5AA2C   |
	LDA $0000,y				;$B5AA2E   |
	EOR #$8000				;$B5AA31   |
	BRA CODE_B5A9CB				;$B5AA34  /

CODE_B5AA36:
	ASL A					;$B5AA36  \
	ASL A					;$B5AA37   |
	ASL A					;$B5AA38   |
	ASL A					;$B5AA39   |
	ASL A					;$B5AA3A   |
	ADC $36					;$B5AA3B   |
	TAY					;$B5AA3D   |
	LDA $0018,y				;$B5AA3E   |
	EOR #$C000				;$B5AA41   |
	STA $00,x				;$B5AA44   |
	LDA $0010,y				;$B5AA46   |
	EOR #$C000				;$B5AA49   |
	STA $02,x				;$B5AA4C   |
	LDA $0008,y				;$B5AA4E   |
	EOR #$C000				;$B5AA51   |
	STA $04,x				;$B5AA54   |
	LDA $0000,y				;$B5AA56   |
	EOR #$C000				;$B5AA59   |
	JMP CODE_B5A9CB				;$B5AA5C  /

CODE_B5AA5F:
	LDA $17C0				;$B5AA5F  \
	AND #$00F8				;$B5AA62   |
	LSR A					;$B5AA65   |
	LSR A					;$B5AA66   |
	TAY					;$B5AA67   |
	AND #$0006				;$B5AA68   |
	TAX					;$B5AA6B   |
	CLC					;$B5AA6C   |
	ADC #$0040				;$B5AA6D   |
	STA $34					;$B5AA70   |
CODE_B5AA72:					;	   |
	LDA $195A,x				;$B5AA72   |
	STA $189A,y				;$B5AA75   |
	TYA					;$B5AA78   |
	CLC					;$B5AA79   |
	ADC #$0002				;$B5AA7A   |
	AND #$003E				;$B5AA7D   |
	TAY					;$B5AA80   |
	INX					;$B5AA81   |
	INX					;$B5AA82   |
	CPX $34					;$B5AA83   |
	BNE CODE_B5AA72				;$B5AA85   |
	RTS					;$B5AA87  /

CODE_B5AA88:
	LDA $B8					;$B5AA88  \
	AND #$FFF8				;$B5AA8A   |
	TAY					;$B5AA8D   |
	SEC					;$B5AA8E   |
	SBC $C6					;$B5AA8F   |
	BNE CODE_B5AA94				;$B5AA91   |
	RTL					;$B5AA93  /

CODE_B5AA94:
	STY $C6					;$B5AA94  \
	SEP #$20				;$B5AA96   |
	LDA #$81				;$B5AA98   |
	STA PPU.vram_control			;$B5AA9A   |
	REP #$20				;$B5AA9D   |
	LDA $B8					;$B5AA9F   |
	BCC CODE_B5AAA6				;$B5AAA1   |
	ADC #$00FF				;$B5AAA3   |
CODE_B5AAA6:					;	   |
	LSR A					;$B5AAA6   |
	LSR A					;$B5AAA7   |
	LSR A					;$B5AAA8   |
	AND #$003F				;$B5AAA9   |
	BIT #$0020				;$B5AAAC   |
	CLC					;$B5AAAF   |
	BEQ CODE_B5AAB5				;$B5AAB0   |
	ADC #$03E0				;$B5AAB2   |
CODE_B5AAB5:					;	   |
	ADC #$7800				;$B5AAB5   |
	STA PPU.vram_address			;$B5AAB8   |
	LDA #$189A				;$B5AABB   |
	STA DMA[0].source			;$B5AABE   |
	STA DMA[0].unused_2			;$B5AAC1   |
	LDA #$0040				;$B5AAC4   |
	STA DMA[0].size				;$B5AAC7   |
	LDA #$1801				;$B5AACA   |
	STA DMA[0].settings			;$B5AACD   |
	SEP #$20				;$B5AAD0   |
	STZ DMA[0].source_bank			;$B5AAD2   |
	LDA #$01				;$B5AAD5   |
	STA CPU.enable_dma			;$B5AAD7   |
	REP #$20				;$B5AADA   |
	SEP #$20				;$B5AADC   |
	LDA #$80				;$B5AADE   |
	STA PPU.vram_control			;$B5AAE0   |
	REP #$20				;$B5AAE3   |
	RTL					;$B5AAE5  /

CODE_B5AAE6:
	LDA $17C0				;$B5AAE6  \
	AND #$00F8				;$B5AAE9   |
	CMP $17CE				;$B5AAEC   |
	BNE CODE_B5AAF2				;$B5AAEF   |
	RTL					;$B5AAF1  /

CODE_B5AAF2:
	LDA $B6					;$B5AAF2  \
	AND #$0FE0				;$B5AAF4   |
	CLC					;$B5AAF7   |
	ADC #$26A7				;$B5AAF8   |
	STA $32					;$B5AAFB   |
	LDA $17D2				;$B5AAFD   |
	BPL CODE_B5AB0B				;$B5AB00   |
	LDA $17C0				;$B5AB02   |
	SEC					;$B5AB05   |
	SBC #$0100				;$B5AB06   |
	BRA CODE_B5AB12				;$B5AB09  /

CODE_B5AB0B:
	LDA $17C0				;$B5AB0B  \
	SEC					;$B5AB0E   |
	SBC #$0020				;$B5AB0F   |
CODE_B5AB12:					;	   |
	TAY					;$B5AB12   |
	AND #$01E0				;$B5AB13   |
	LSR A					;$B5AB16   |
	LSR A					;$B5AB17   |
	LSR A					;$B5AB18   |
	LSR A					;$B5AB19   |
	ADC $32					;$B5AB1A   |
	STA $32					;$B5AB1C   |
	TYA					;$B5AB1E   |
	AND #$0018				;$B5AB1F   |
	ADC #$2087				;$B5AB22   |
	STA $34					;$B5AB25   |
	TYA					;$B5AB27   |
	AND #$0018				;$B5AB28   |
	EOR #$0018				;$B5AB2B   |
	ADC #$2087				;$B5AB2E   |
	STA $36					;$B5AB31   |
	LDA #$00F5				;$B5AB33   |
	PHA					;$B5AB36   |
	PLB					;$B5AB37   |
	LDX #$195A				;$B5AB38   |
CODE_B5AB3B:					;	   |
	LDA ($32)				;$B5AB3B   |
	BMI CODE_B5ABA7				;$B5AB3D   |
	BIT #$4000				;$B5AB3F   |
	BNE CODE_B5AB7F				;$B5AB42   |
	ASL A					;$B5AB44   |
	ASL A					;$B5AB45   |
	ASL A					;$B5AB46   |
	ASL A					;$B5AB47   |
	ASL A					;$B5AB48   |
	ADC $34					;$B5AB49   |
	TAY					;$B5AB4B   |
	LDA $0000,y				;$B5AB4C   |
	STA $00,x				;$B5AB4F   |
	LDA $0002,y				;$B5AB51   |
	STA $02,x				;$B5AB54   |
	LDA $0004,y				;$B5AB56   |
	STA $04,x				;$B5AB59   |
	LDA $0006,y				;$B5AB5B   |
CODE_B5AB5E:					;	   |
	STA $06,x				;$B5AB5E   |
	LDA $32					;$B5AB60   |
	CLC					;$B5AB62   |
	ADC #$0020				;$B5AB63   |
	CMP #$2BA7				;$B5AB66   |
	BCC CODE_B5AB6E				;$B5AB69   |
	SBC #$0500				;$B5AB6B   |
CODE_B5AB6E:					;	   |
	STA $32					;$B5AB6E   |
	TXA					;$B5AB70   |
	CLC					;$B5AB71   |
	ADC #$0008				;$B5AB72   |
	TAX					;$B5AB75   |
	CMP #$19A2				;$B5AB76   |
	BNE CODE_B5AB3B				;$B5AB79   |
	PLB					;$B5AB7B   |
	JMP CODE_B5ABFD				;$B5AB7C  /

CODE_B5AB7F:
	ASL A					;$B5AB7F  \
	ASL A					;$B5AB80   |
	ASL A					;$B5AB81   |
	ASL A					;$B5AB82   |
	ASL A					;$B5AB83   |
	ADC $34					;$B5AB84   |
	TAY					;$B5AB86   |
	LDA $0006,y				;$B5AB87   |
	EOR #$4000				;$B5AB8A   |
	STA $00,x				;$B5AB8D   |
	LDA $0004,y				;$B5AB8F   |
	EOR #$4000				;$B5AB92   |
	STA $02,x				;$B5AB95   |
	LDA $0002,y				;$B5AB97   |
	EOR #$4000				;$B5AB9A   |
	STA $04,x				;$B5AB9D   |
	LDA $0000,y				;$B5AB9F   |
	EOR #$4000				;$B5ABA2   |
	BRA CODE_B5AB5E				;$B5ABA5  /

CODE_B5ABA7:
	BIT #$4000				;$B5ABA7  \
	BNE CODE_B5ABD4				;$B5ABAA   |
	ASL A					;$B5ABAC   |
	ASL A					;$B5ABAD   |
	ASL A					;$B5ABAE   |
	ASL A					;$B5ABAF   |
	ASL A					;$B5ABB0   |
	ADC $36					;$B5ABB1   |
	TAY					;$B5ABB3   |
	LDA $0000,y				;$B5ABB4   |
	EOR #$8000				;$B5ABB7   |
	STA $00,x				;$B5ABBA   |
	LDA $0002,y				;$B5ABBC   |
	EOR #$8000				;$B5ABBF   |
	STA $02,x				;$B5ABC2   |
	LDA $0004,y				;$B5ABC4   |
	EOR #$8000				;$B5ABC7   |
	STA $04,x				;$B5ABCA   |
	LDA $0006,y				;$B5ABCC   |
	EOR #$8000				;$B5ABCF   |
	BRA CODE_B5AB5E				;$B5ABD2  /

CODE_B5ABD4:
	ASL A					;$B5ABD4  \
	ASL A					;$B5ABD5   |
	ASL A					;$B5ABD6   |
	ASL A					;$B5ABD7   |
	ASL A					;$B5ABD8   |
	ADC $36					;$B5ABD9   |
	TAY					;$B5ABDB   |
	LDA $0006,y				;$B5ABDC   |
	EOR #$C000				;$B5ABDF   |
	STA $00,x				;$B5ABE2   |
	LDA $0004,y				;$B5ABE4   |
	EOR #$C000				;$B5ABE7   |
	STA $02,x				;$B5ABEA   |
	LDA $0002,y				;$B5ABEC   |
	EOR #$C000				;$B5ABEF   |
	STA $04,x				;$B5ABF2   |
	LDA $0000,y				;$B5ABF4   |
	EOR #$C000				;$B5ABF7   |
	JMP CODE_B5AB5E				;$B5ABFA  /

CODE_B5ABFD:
	LDA $B8					;$B5ABFD  \
	AND #$01F8				;$B5ABFF   |
	LSR A					;$B5AC02   |
	LSR A					;$B5AC03   |
	TAY					;$B5AC04   |
	AND #$0006				;$B5AC05   |
	TAX					;$B5AC08   |
	CLC					;$B5AC09   |
	ADC #$0042				;$B5AC0A   |
	STA $34					;$B5AC0D   |
CODE_B5AC0F:					;	   |
	LDA $195A,x				;$B5AC0F   |
	STA $18DA,y				;$B5AC12   |
	TYA					;$B5AC15   |
	CLC					;$B5AC16   |
	ADC #$0002				;$B5AC17   |
	AND #$007E				;$B5AC1A   |
	TAY					;$B5AC1D   |
	INX					;$B5AC1E   |
	INX					;$B5AC1F   |
	CPX $34					;$B5AC20   |
	BNE CODE_B5AC0F				;$B5AC22   |
	RTL					;$B5AC24  /

CODE_B5AC25:
	LDA $17C0				;$B5AC25  \
	AND #$00F8				;$B5AC28   |
	CMP $17CE				;$B5AC2B   |
	BNE CODE_B5AC31				;$B5AC2E   |
	RTL					;$B5AC30  /

CODE_B5AC31:
	LDA $17D2				;$B5AC31  \
	BPL CODE_B5AC3B				;$B5AC34   |
	LDA $17C0				;$B5AC36   |
	BRA CODE_B5AC42				;$B5AC39  /

CODE_B5AC3B:
	LDA $17C0				;$B5AC3B  \
	CLC					;$B5AC3E   |
	ADC #$00E0				;$B5AC3F   |
CODE_B5AC42:					;	   |
	ASL A					;$B5AC42   |
	ASL A					;$B5AC43   |
	AND #$03E0				;$B5AC44   |
	CLC					;$B5AC47   |
	ADC #$7800				;$B5AC48   |
	STA $32					;$B5AC4B   |
	STA PPU.vram_address			;$B5AC4D   |
	LDA #$18DA				;$B5AC50   |
	STA DMA[0].source			;$B5AC53   |
	STA DMA[0].unused_2			;$B5AC56   |
	LDA #$0040				;$B5AC59   |
	STA DMA[0].size				;$B5AC5C   |
	LDA #$1801				;$B5AC5F   |
	STA DMA[0].settings			;$B5AC62   |
	SEP #$20				;$B5AC65   |
	STZ DMA[0].source_bank			;$B5AC67   |
	LDA #$01				;$B5AC6A   |
	STA CPU.enable_dma			;$B5AC6C   |
	REP #$20				;$B5AC6F   |
	LDA $32					;$B5AC71   |
	CLC					;$B5AC73   |
	ADC #$0400				;$B5AC74   |
	STA PPU.vram_address			;$B5AC77   |
	LDA #$191A				;$B5AC7A   |
	STA DMA[0].source			;$B5AC7D   |
	STA DMA[0].unused_2			;$B5AC80   |
	LDA #$0040				;$B5AC83   |
	STA DMA[0].size				;$B5AC86   |
	LDA #$1801				;$B5AC89   |
	STA DMA[0].settings			;$B5AC8C   |
	SEP #$20				;$B5AC8F   |
	STZ DMA[0].source_bank			;$B5AC91   |
	LDA #$01				;$B5AC94   |
	STA CPU.enable_dma			;$B5AC96   |
	REP #$20				;$B5AC99   |
	RTL					;$B5AC9B  /

CODE_B5AC9C:
	LDA $17BA				;$B5AC9C  \
	AND #$FFF8				;$B5AC9F   |
	CMP $17CA				;$B5ACA2   |
	BNE CODE_B5ACA8				;$B5ACA5   |
	RTL					;$B5ACA7  /

CODE_B5ACA8:
	LDA $17BA				;$B5ACA8  \
	LDX $17D6				;$B5ACAB   |
	BPL CODE_B5ACB7				;$B5ACAE   |
	LDA $17BA				;$B5ACB0   |
	SEC					;$B5ACB3   |
	SBC #$0100				;$B5ACB4   |
CODE_B5ACB7:					;	   |
	TAY					;$B5ACB7   |
	AND #$FFE0				;$B5ACB8   |
	CLC					;$B5ACBB   |
	ADC $98					;$B5ACBC   |
	STA $32					;$B5ACBE   |
	LDA $17C0				;$B5ACC0   |
	SEC					;$B5ACC3   |
	SBC #$0100				;$B5ACC4   |
	AND #$01E0				;$B5ACC7   |
	LSR A					;$B5ACCA   |
	LSR A					;$B5ACCB   |
	LSR A					;$B5ACCC   |
	LSR A					;$B5ACCD   |
	CLC					;$B5ACCE   |
	ADC $32					;$B5ACCF   |
	STA $32					;$B5ACD1   |
	TYA					;$B5ACD3   |
	AND #$0018				;$B5ACD4   |
	LSR A					;$B5ACD7   |
	LSR A					;$B5ACD8   |
	ADC $17B4				;$B5ACD9   |
	STA $34					;$B5ACDC   |
	TYA					;$B5ACDE   |
	AND #$0018				;$B5ACDF   |
	EOR #$0018				;$B5ACE2   |
	LSR A					;$B5ACE5   |
	LSR A					;$B5ACE6   |
	ADC $17B4				;$B5ACE7   |
	STA $36					;$B5ACEA   |
	LDA $9A					;$B5ACEC   |
	PHA					;$B5ACEE   |
	PLB					;$B5ACEF   |
	LDX #$195A				;$B5ACF0   |
CODE_B5ACF3:					;	   |
	LDA ($32)				;$B5ACF3   |
	BMI CODE_B5AD53				;$B5ACF5   |
	BIT #$4000				;$B5ACF7   |
	BNE CODE_B5AD2B				;$B5ACFA   |
	ASL A					;$B5ACFC   |
	ASL A					;$B5ACFD   |
	ASL A					;$B5ACFE   |
	ASL A					;$B5ACFF   |
	ASL A					;$B5AD00   |
	ADC $34					;$B5AD01   |
	TAY					;$B5AD03   |
	LDA $0000,y				;$B5AD04   |
	STA $00,x				;$B5AD07   |
	LDA $0008,y				;$B5AD09   |
	STA $02,x				;$B5AD0C   |
	LDA $0010,y				;$B5AD0E   |
	STA $04,x				;$B5AD11   |
	LDA $0018,y				;$B5AD13   |
CODE_B5AD16:					;	   |
	STA $06,x				;$B5AD16   |
	INC $32					;$B5AD18   |
	INC $32					;$B5AD1A   |
	TXA					;$B5AD1C   |
	CLC					;$B5AD1D   |
	ADC #$0008				;$B5AD1E   |
	TAX					;$B5AD21   |
	CMP #$19A2				;$B5AD22   |
	BNE CODE_B5ACF3				;$B5AD25   |
	PLB					;$B5AD27   |
	JMP CODE_B5ADA9				;$B5AD28  /

CODE_B5AD2B:
	ASL A					;$B5AD2B  \
	ASL A					;$B5AD2C   |
	ASL A					;$B5AD2D   |
	ASL A					;$B5AD2E   |
	ASL A					;$B5AD2F   |
	ADC $36					;$B5AD30   |
	TAY					;$B5AD32   |
	LDA $0000,y				;$B5AD33   |
	EOR #$4000				;$B5AD36   |
	STA $00,x				;$B5AD39   |
	LDA $0008,y				;$B5AD3B   |
	EOR #$4000				;$B5AD3E   |
	STA $02,x				;$B5AD41   |
	LDA $0010,y				;$B5AD43   |
	EOR #$4000				;$B5AD46   |
	STA $04,x				;$B5AD49   |
	LDA $0018,y				;$B5AD4B   |
	EOR #$4000				;$B5AD4E   |
	BRA CODE_B5AD16				;$B5AD51  /

CODE_B5AD53:
	BIT #$4000				;$B5AD53  \
	BNE CODE_B5AD80				;$B5AD56   |
	ASL A					;$B5AD58   |
	ASL A					;$B5AD59   |
	ASL A					;$B5AD5A   |
	ASL A					;$B5AD5B   |
	ASL A					;$B5AD5C   |
	ADC $34					;$B5AD5D   |
	TAY					;$B5AD5F   |
	LDA $0018,y				;$B5AD60   |
	EOR #$8000				;$B5AD63   |
	STA $00,x				;$B5AD66   |
	LDA $0010,y				;$B5AD68   |
	EOR #$8000				;$B5AD6B   |
	STA $02,x				;$B5AD6E   |
	LDA $0008,y				;$B5AD70   |
	EOR #$8000				;$B5AD73   |
	STA $04,x				;$B5AD76   |
	LDA $0000,y				;$B5AD78   |
	EOR #$8000				;$B5AD7B   |
	BRA CODE_B5AD16				;$B5AD7E  /

CODE_B5AD80:
	ASL A					;$B5AD80  \
	ASL A					;$B5AD81   |
	ASL A					;$B5AD82   |
	ASL A					;$B5AD83   |
	ASL A					;$B5AD84   |
	ADC $36					;$B5AD85   |
	TAY					;$B5AD87   |
	LDA $0018,y				;$B5AD88   |
	EOR #$C000				;$B5AD8B   |
	STA $00,x				;$B5AD8E   |
	LDA $0010,y				;$B5AD90   |
	EOR #$C000				;$B5AD93   |
	STA $02,x				;$B5AD96   |
	LDA $0008,y				;$B5AD98   |
	EOR #$C000				;$B5AD9B   |
	STA $04,x				;$B5AD9E   |
	LDA $0000,y				;$B5ADA0   |
	EOR #$C000				;$B5ADA3   |
	JMP CODE_B5AD16				;$B5ADA6  /

CODE_B5ADA9:
	LDA $17C0				;$B5ADA9  \
	AND #$00F8				;$B5ADAC   |
	LSR A					;$B5ADAF   |
	LSR A					;$B5ADB0   |
	ORA $17C8				;$B5ADB1   |
	TAY					;$B5ADB4   |
	AND #$0006				;$B5ADB5   |
	TAX					;$B5ADB8   |
	CLC					;$B5ADB9   |
	ADC #$0040				;$B5ADBA   |
	STA $34					;$B5ADBD   |
CODE_B5ADBF:					;	   |
	LDA $195A,x				;$B5ADBF   |
	STA $185A,y				;$B5ADC2   |
	TYA					;$B5ADC5   |
	CLC					;$B5ADC6   |
	ADC #$0002				;$B5ADC7   |
	AND #$003E				;$B5ADCA   |
	ORA $17C8				;$B5ADCD   |
	TAY					;$B5ADD0   |
	INX					;$B5ADD1   |
	INX					;$B5ADD2   |
	CPX $34					;$B5ADD3   |
	BNE CODE_B5ADBF				;$B5ADD5   |
	RTL					;$B5ADD7  /

CODE_B5ADD8:
	LDA $17BA				;$B5ADD8  \
	AND #$FFF8				;$B5ADDB   |
	CMP $17CA				;$B5ADDE   |
	BNE CODE_B5ADE4				;$B5ADE1   |
	RTL					;$B5ADE3  /

CODE_B5ADE4:
	STA $17CA				;$B5ADE4  \
	SEP #$20				;$B5ADE7   |
	LDA #$81				;$B5ADE9   |
	STA PPU.vram_control			;$B5ADEB   |
	REP #$20				;$B5ADEE   |
	LDA $17D6				;$B5ADF0   |
	BPL CODE_B5ADFA				;$B5ADF3   |
	LDA $17BA				;$B5ADF5   |
	BRA CODE_B5AE01				;$B5ADF8  /

CODE_B5ADFA:
	LDA $17BA				;$B5ADFA  \
	CLC					;$B5ADFD   |
	ADC #$0100				;$B5ADFE   |
CODE_B5AE01:					;	   |
	LSR A					;$B5AE01   |
	LSR A					;$B5AE02   |
	LSR A					;$B5AE03   |
	AND #$003F				;$B5AE04   |
	BIT #$0020				;$B5AE07   |
	CLC					;$B5AE0A   |
	BEQ CODE_B5AE10				;$B5AE0B   |
	ADC #$03E0				;$B5AE0D   |
CODE_B5AE10:					;	   |
	ADC $17B6				;$B5AE10   |
	STA PPU.vram_address			;$B5AE13   |
	LDA #$185A				;$B5AE16   |
	STA DMA[0].source			;$B5AE19   |
	STA DMA[0].unused_2			;$B5AE1C   |
	LDA #$0040				;$B5AE1F   |
	STA DMA[0].size				;$B5AE22   |
	LDA #$1801				;$B5AE25   |
	STA DMA[0].settings			;$B5AE28   |
	SEP #$20				;$B5AE2B   |
	STZ DMA[0].source_bank			;$B5AE2D   |
	LDA #$01				;$B5AE30   |
	STA CPU.enable_dma			;$B5AE32   |
	REP #$20				;$B5AE35   |
	SEP #$20				;$B5AE37   |
	LDA #$80				;$B5AE39   |
	STA PPU.vram_control			;$B5AE3B   |
	REP #$20				;$B5AE3E   |
	RTL					;$B5AE40  /

	LDA $17BA				;$B5AE41   |
	AND #$FFF8				;$B5AE44   |
	CMP $17CA				;$B5AE47   |
	BNE CODE_B5AE4D				;$B5AE4A   |
	RTL					;$B5AE4C  /

CODE_B5AE4D:
	SEP #$20				;$B5AE4D  \
	LDA #$81				;$B5AE4F   |
	STA PPU.vram_control			;$B5AE51   |
	REP #$20				;$B5AE54   |
	LDA $17D6				;$B5AE56   |
	BPL CODE_B5AE60				;$B5AE59   |
	LDA $17BA				;$B5AE5B   |
	BRA CODE_B5AE67				;$B5AE5E  /

CODE_B5AE60:
	LDA $17BA				;$B5AE60  \
	CLC					;$B5AE63   |
	ADC #$0100				;$B5AE64   |
CODE_B5AE67:					;	   |
	LSR A					;$B5AE67   |
	LSR A					;$B5AE68   |
	LSR A					;$B5AE69   |
	AND #$003F				;$B5AE6A   |
	BIT #$0020				;$B5AE6D   |
	CLC					;$B5AE70   |
	BEQ CODE_B5AE76				;$B5AE71   |
	ADC #$03E0				;$B5AE73   |
CODE_B5AE76:					;	   |
	ADC #$7800				;$B5AE76   |
	STA PPU.vram_address			;$B5AE79   |
	LDA #$191A				;$B5AE7C   |
	STA DMA[0].source			;$B5AE7F   |
	STA DMA[0].unused_2			;$B5AE82   |
	LDA #$0040				;$B5AE85   |
	STA DMA[0].size				;$B5AE88   |
	LDA #$1801				;$B5AE8B   |
	STA DMA[0].settings			;$B5AE8E   |
	SEP #$20				;$B5AE91   |
	STZ DMA[0].source_bank			;$B5AE93   |
	LDA #$01				;$B5AE96   |
	STA CPU.enable_dma			;$B5AE98   |
	REP #$20				;$B5AE9B   |
	SEP #$20				;$B5AE9D   |
	LDA #$80				;$B5AE9F   |
	STA PPU.vram_control			;$B5AEA1   |
	REP #$20				;$B5AEA4   |
	RTL					;$B5AEA6  /

CODE_B5AEA7:
	LDA $17C0				;$B5AEA7  \
	AND #$00F8				;$B5AEAA   |
	CMP $17CE				;$B5AEAD   |
	BNE CODE_B5AEB3				;$B5AEB0   |
	RTL					;$B5AEB2  /

CODE_B5AEB3:
	LDA $17BA				;$B5AEB3  \
	SEC					;$B5AEB6   |
	SBC #$0100				;$B5AEB7   |
	AND #$FFE0				;$B5AEBA   |
	CLC					;$B5AEBD   |
	ADC $98					;$B5AEBE   |
	STA $32					;$B5AEC0   |
	LDA $17C0				;$B5AEC2   |
	SEC					;$B5AEC5   |
	SBC #$0020				;$B5AEC6   |
	LDX $17D2				;$B5AEC9   |
	BPL CODE_B5AED2				;$B5AECC   |
	SEC					;$B5AECE   |
	SBC #$00E0				;$B5AECF   |
CODE_B5AED2:					;	   |
	TAY					;$B5AED2   |
	AND #$01E0				;$B5AED3   |
	LSR A					;$B5AED6   |
	LSR A					;$B5AED7   |
	LSR A					;$B5AED8   |
	LSR A					;$B5AED9   |
	ADC $32					;$B5AEDA   |
	STA $32					;$B5AEDC   |
	TYA					;$B5AEDE   |
	AND #$0018				;$B5AEDF   |
	ADC $17B4				;$B5AEE2   |
	STA $34					;$B5AEE5   |
	TYA					;$B5AEE7   |
	AND #$0018				;$B5AEE8   |
	EOR #$0018				;$B5AEEB   |
	ADC $17B4				;$B5AEEE   |
	STA $36					;$B5AEF1   |
	LDA $9A					;$B5AEF3   |
	PHA					;$B5AEF5   |
	PLB					;$B5AEF6   |
	LDX #$195A				;$B5AEF7   |
CODE_B5AEFA:					;	   |
	LDA ($32)				;$B5AEFA   |
	BMI CODE_B5AF5E				;$B5AEFC   |
	BIT #$4000				;$B5AEFE   |
	BNE CODE_B5AF36				;$B5AF01   |
	ASL A					;$B5AF03   |
	ASL A					;$B5AF04   |
	ASL A					;$B5AF05   |
	ASL A					;$B5AF06   |
	ASL A					;$B5AF07   |
	ADC $34					;$B5AF08   |
	TAY					;$B5AF0A   |
	LDA $0000,y				;$B5AF0B   |
	STA $00,x				;$B5AF0E   |
	LDA $0002,y				;$B5AF10   |
	STA $02,x				;$B5AF13   |
	LDA $0004,y				;$B5AF15   |
	STA $04,x				;$B5AF18   |
	LDA $0006,y				;$B5AF1A   |
CODE_B5AF1D:					;	   |
	STA $06,x				;$B5AF1D   |
	LDA $32					;$B5AF1F   |
	CLC					;$B5AF21   |
	ADC #$0020				;$B5AF22   |
	STA $32					;$B5AF25   |
	TXA					;$B5AF27   |
	CLC					;$B5AF28   |
	ADC #$0008				;$B5AF29   |
	TAX					;$B5AF2C   |
	CMP #$19A2				;$B5AF2D   |
	BNE CODE_B5AEFA				;$B5AF30   |
	PLB					;$B5AF32   |
	JMP CODE_B5AFB4				;$B5AF33  /

CODE_B5AF36:
	ASL A					;$B5AF36  \
	ASL A					;$B5AF37   |
	ASL A					;$B5AF38   |
	ASL A					;$B5AF39   |
	ASL A					;$B5AF3A   |
	ADC $34					;$B5AF3B   |
	TAY					;$B5AF3D   |
	LDA $0006,y				;$B5AF3E   |
	EOR #$4000				;$B5AF41   |
	STA $00,x				;$B5AF44   |
	LDA $0004,y				;$B5AF46   |
	EOR #$4000				;$B5AF49   |
	STA $02,x				;$B5AF4C   |
	LDA $0002,y				;$B5AF4E   |
	EOR #$4000				;$B5AF51   |
	STA $04,x				;$B5AF54   |
	LDA $0000,y				;$B5AF56   |
	EOR #$4000				;$B5AF59   |
	BRA CODE_B5AF1D				;$B5AF5C  /

CODE_B5AF5E:
	BIT #$4000				;$B5AF5E  \
	BNE CODE_B5AF8B				;$B5AF61   |
	ASL A					;$B5AF63   |
	ASL A					;$B5AF64   |
	ASL A					;$B5AF65   |
	ASL A					;$B5AF66   |
	ASL A					;$B5AF67   |
	ADC $36					;$B5AF68   |
	TAY					;$B5AF6A   |
	LDA $0000,y				;$B5AF6B   |
	EOR #$8000				;$B5AF6E   |
	STA $00,x				;$B5AF71   |
	LDA $0002,y				;$B5AF73   |
	EOR #$8000				;$B5AF76   |
	STA $02,x				;$B5AF79   |
	LDA $0004,y				;$B5AF7B   |
	EOR #$8000				;$B5AF7E   |
	STA $04,x				;$B5AF81   |
	LDA $0006,y				;$B5AF83   |
	EOR #$8000				;$B5AF86   |
	BRA CODE_B5AF1D				;$B5AF89  /

CODE_B5AF8B:
	ASL A					;$B5AF8B  \
	ASL A					;$B5AF8C   |
	ASL A					;$B5AF8D   |
	ASL A					;$B5AF8E   |
	ASL A					;$B5AF8F   |
	ADC $36					;$B5AF90   |
	TAY					;$B5AF92   |
	LDA $0006,y				;$B5AF93   |
	EOR #$C000				;$B5AF96   |
	STA $00,x				;$B5AF99   |
	LDA $0004,y				;$B5AF9B   |
	EOR #$C000				;$B5AF9E   |
	STA $02,x				;$B5AFA1   |
	LDA $0002,y				;$B5AFA3   |
	EOR #$C000				;$B5AFA6   |
	STA $04,x				;$B5AFA9   |
	LDA $0000,y				;$B5AFAB   |
	EOR #$C000				;$B5AFAE   |
	JMP CODE_B5AF1D				;$B5AFB1  /

CODE_B5AFB4:
	LDA $17C8				;$B5AFB4  \
	BNE CODE_B5AFE2				;$B5AFB7   |
	LDA $17BA				;$B5AFB9   |
	AND #$01F8				;$B5AFBC   |
	LSR A					;$B5AFBF   |
	LSR A					;$B5AFC0   |
	TAY					;$B5AFC1   |
	AND #$0006				;$B5AFC2   |
	TAX					;$B5AFC5   |
	CLC					;$B5AFC6   |
	ADC #$0042				;$B5AFC7   |
	STA $34					;$B5AFCA   |
CODE_B5AFCC:					;	   |
	LDA $195A,x				;$B5AFCC   |
	STA $17DA,y				;$B5AFCF   |
	TYA					;$B5AFD2   |
	CLC					;$B5AFD3   |
	ADC #$0002				;$B5AFD4   |
	AND #$007E				;$B5AFD7   |
	TAY					;$B5AFDA   |
	INX					;$B5AFDB   |
	INX					;$B5AFDC   |
	CPX $34					;$B5AFDD   |
	BNE CODE_B5AFCC				;$B5AFDF   |
	RTL					;$B5AFE1  /

CODE_B5AFE2:
	LDA $17BA				;$B5AFE2  \
	AND #$01F8				;$B5AFE5   |
	LSR A					;$B5AFE8   |
	LSR A					;$B5AFE9   |
	TAY					;$B5AFEA   |
	AND #$0006				;$B5AFEB   |
	TAX					;$B5AFEE   |
	CLC					;$B5AFEF   |
	ADC #$0042				;$B5AFF0   |
	STA $34					;$B5AFF3   |
CODE_B5AFF5:					;	   |
	LDA $195A,x				;$B5AFF5   |
	STA $189A,y				;$B5AFF8   |
	TYA					;$B5AFFB   |
	CLC					;$B5AFFC   |
	ADC #$0002				;$B5AFFD   |
	AND #$007E				;$B5B000   |
	TAY					;$B5B003   |
	INX					;$B5B004   |
	INX					;$B5B005   |
	CPX $34					;$B5B006   |
	BNE CODE_B5AFF5				;$B5B008   |
	RTL					;$B5B00A  /

CODE_B5B00B:
	LDA $17C0				;$B5B00B  \
	AND #$00F8				;$B5B00E   |
	CMP $17CE				;$B5B011   |
	BNE CODE_B5B017				;$B5B014   |
	RTL					;$B5B016  /

CODE_B5B017:
	STA $17CE				;$B5B017  \
	LDA $17D2				;$B5B01A   |
	BPL CODE_B5B024				;$B5B01D   |
	LDA $17C0				;$B5B01F   |
	BRA CODE_B5B02B				;$B5B022  /

CODE_B5B024:
	LDA $17C0				;$B5B024  \
	CLC					;$B5B027   |
	ADC #$00E0				;$B5B028   |
CODE_B5B02B:					;	   |
	ASL A					;$B5B02B   |
	ASL A					;$B5B02C   |
	AND #$03E0				;$B5B02D   |
	CLC					;$B5B030   |
	ADC $17B6				;$B5B031   |
	STA $32					;$B5B034   |
	STA PPU.vram_address			;$B5B036   |
	LDA #$17DA				;$B5B039   |
	STA DMA[0].source			;$B5B03C   |
	STA DMA[0].unused_2			;$B5B03F   |
	LDA #$0040				;$B5B042   |
	STA DMA[0].size				;$B5B045   |
	LDA #$1801				;$B5B048   |
	STA DMA[0].settings			;$B5B04B   |
	SEP #$20				;$B5B04E   |
	STZ DMA[0].source_bank			;$B5B050   |
	LDA #$01				;$B5B053   |
	STA CPU.enable_dma			;$B5B055   |
	REP #$20				;$B5B058   |
	LDA $32					;$B5B05A   |
	CLC					;$B5B05C   |
	ADC #$0400				;$B5B05D   |
	STA PPU.vram_address			;$B5B060   |
	LDA #$181A				;$B5B063   |
	STA DMA[0].source			;$B5B066   |
	STA DMA[0].unused_2			;$B5B069   |
	LDA #$0040				;$B5B06C   |
	STA DMA[0].size				;$B5B06F   |
	LDA #$1801				;$B5B072   |
	STA DMA[0].settings			;$B5B075   |
	SEP #$20				;$B5B078   |
	STZ DMA[0].source_bank			;$B5B07A   |
	LDA #$01				;$B5B07D   |
	STA CPU.enable_dma			;$B5B07F   |
	REP #$20				;$B5B082   |
	RTL					;$B5B084  /

	LDA $17C0				;$B5B085   |
	AND #$FFF8				;$B5B088   |
	CMP $17CE				;$B5B08B   |
	BNE CODE_B5B091				;$B5B08E   |
	RTL					;$B5B090  /

CODE_B5B091:
	LDA $17D2				;$B5B091  \
	BPL CODE_B5B09B				;$B5B094   |
	LDA $17C0				;$B5B096   |
	BRA CODE_B5B0A2				;$B5B099  /

CODE_B5B09B:
	LDA $17C0				;$B5B09B  \
	CLC					;$B5B09E   |
	ADC #$00E0				;$B5B09F   |
CODE_B5B0A2:					;	   |
	ASL A					;$B5B0A2   |
	ASL A					;$B5B0A3   |
	AND #$03E0				;$B5B0A4   |
	CLC					;$B5B0A7   |
	ADC #$7800				;$B5B0A8   |
	STA $32					;$B5B0AB   |
	STA PPU.vram_address			;$B5B0AD   |
	LDA #$189A				;$B5B0B0   |
	STA DMA[0].source			;$B5B0B3   |
	STA DMA[0].unused_2			;$B5B0B6   |
	LDA #$0040				;$B5B0B9   |
	STA DMA[0].size				;$B5B0BC   |
	LDA #$1801				;$B5B0BF   |
	STA DMA[0].settings			;$B5B0C2   |
	SEP #$20				;$B5B0C5   |
	STZ DMA[0].source_bank			;$B5B0C7   |
	LDA #$01				;$B5B0CA   |
	STA CPU.enable_dma			;$B5B0CC   |
	REP #$20				;$B5B0CF   |
	LDA $32					;$B5B0D1   |
	CLC					;$B5B0D3   |
	ADC #$0400				;$B5B0D4   |
	STA PPU.vram_address			;$B5B0D7   |
	LDA #$18DA				;$B5B0DA   |
	STA DMA[0].source			;$B5B0DD   |
	STA DMA[0].unused_2			;$B5B0E0   |
	LDA #$0040				;$B5B0E3   |
	STA DMA[0].size				;$B5B0E6   |
	LDA #$1801				;$B5B0E9   |
	STA DMA[0].settings			;$B5B0EC   |
	SEP #$20				;$B5B0EF   |
	STZ DMA[0].source_bank			;$B5B0F1   |
	LDA #$01				;$B5B0F4   |
	STA CPU.enable_dma			;$B5B0F6   |
	REP #$20				;$B5B0F9   |
	RTL					;$B5B0FB  /

CODE_B5B0FC:
	LDA $17BA				;$B5B0FC  \
	AND #$FFF8				;$B5B0FF   |
	CMP $17CA				;$B5B102   |
	BNE CODE_B5B108				;$B5B105   |
	RTL					;$B5B107  /

CODE_B5B108:
	LDA $17BA				;$B5B108  \
	LDX $17D6				;$B5B10B   |
	BPL CODE_B5B117				;$B5B10E   |
	LDA $17BA				;$B5B110   |
	SEC					;$B5B113   |
	SBC #$0100				;$B5B114   |
CODE_B5B117:					;	   |
	TAY					;$B5B117   |
	AND #$FFE0				;$B5B118   |
	LSR A					;$B5B11B   |
	LSR A					;$B5B11C   |
	LSR A					;$B5B11D   |
	LSR A					;$B5B11E   |
	CLC					;$B5B11F   |
	ADC $98					;$B5B120   |
	STA $32					;$B5B122   |
	LDA $17C0				;$B5B124   |
	SEC					;$B5B127   |
	SBC #$0100				;$B5B128   |
	AND #$FFE0				;$B5B12B   |
	CLC					;$B5B12E   |
	ADC $32					;$B5B12F   |
	STA $32					;$B5B131   |
	TYA					;$B5B133   |
	AND #$0018				;$B5B134   |
	LSR A					;$B5B137   |
	LSR A					;$B5B138   |
	ADC $17B4				;$B5B139   |
	STA $34					;$B5B13C   |
	TYA					;$B5B13E   |
	AND #$0018				;$B5B13F   |
	EOR #$0018				;$B5B142   |
	LSR A					;$B5B145   |
	LSR A					;$B5B146   |
	ADC $17B4				;$B5B147   |
	STA $36					;$B5B14A   |
	LDA $9A					;$B5B14C   |
	PHA					;$B5B14E   |
	PLB					;$B5B14F   |
	LDX #$195A				;$B5B150   |
CODE_B5B153:					;	   |
	LDA ($32)				;$B5B153   |
	BMI CODE_B5B1B7				;$B5B155   |
	BIT #$4000				;$B5B157   |
	BNE CODE_B5B18F				;$B5B15A   |
	ASL A					;$B5B15C   |
	ASL A					;$B5B15D   |
	ASL A					;$B5B15E   |
	ASL A					;$B5B15F   |
	ASL A					;$B5B160   |
	ADC $34					;$B5B161   |
	TAY					;$B5B163   |
	LDA $0000,y				;$B5B164   |
	STA $00,x				;$B5B167   |
	LDA $0008,y				;$B5B169   |
	STA $02,x				;$B5B16C   |
	LDA $0010,y				;$B5B16E   |
	STA $04,x				;$B5B171   |
	LDA $0018,y				;$B5B173   |
CODE_B5B176:					;	   |
	STA $06,x				;$B5B176   |
	LDA $32					;$B5B178   |
	CLC					;$B5B17A   |
	ADC #$0020				;$B5B17B   |
	STA $32					;$B5B17E   |
	TXA					;$B5B180   |
	CLC					;$B5B181   |
	ADC #$0008				;$B5B182   |
	TAX					;$B5B185   |
	CMP #$19A2				;$B5B186   |
	BNE CODE_B5B153				;$B5B189   |
	PLB					;$B5B18B   |
	JMP CODE_B5ADA9				;$B5B18C  /

CODE_B5B18F:
	ASL A					;$B5B18F  \
	ASL A					;$B5B190   |
	ASL A					;$B5B191   |
	ASL A					;$B5B192   |
	ASL A					;$B5B193   |
	ADC $36					;$B5B194   |
	TAY					;$B5B196   |
	LDA $0000,y				;$B5B197   |
	EOR #$4000				;$B5B19A   |
	STA $00,x				;$B5B19D   |
	LDA $0008,y				;$B5B19F   |
	EOR #$4000				;$B5B1A2   |
	STA $02,x				;$B5B1A5   |
	LDA $0010,y				;$B5B1A7   |
	EOR #$4000				;$B5B1AA   |
	STA $04,x				;$B5B1AD   |
	LDA $0018,y				;$B5B1AF   |
	EOR #$4000				;$B5B1B2   |
	BRA CODE_B5B176				;$B5B1B5  /

CODE_B5B1B7:
	BIT #$4000				;$B5B1B7  \
	BNE CODE_B5B1E4				;$B5B1BA   |
	ASL A					;$B5B1BC   |
	ASL A					;$B5B1BD   |
	ASL A					;$B5B1BE   |
	ASL A					;$B5B1BF   |
	ASL A					;$B5B1C0   |
	ADC $34					;$B5B1C1   |
	TAY					;$B5B1C3   |
	LDA $0018,y				;$B5B1C4   |
	EOR #$8000				;$B5B1C7   |
	STA $00,x				;$B5B1CA   |
	LDA $0010,y				;$B5B1CC   |
	EOR #$8000				;$B5B1CF   |
	STA $02,x				;$B5B1D2   |
	LDA $0008,y				;$B5B1D4   |
	EOR #$8000				;$B5B1D7   |
	STA $04,x				;$B5B1DA   |
	LDA $0000,y				;$B5B1DC   |
	EOR #$8000				;$B5B1DF   |
	BRA CODE_B5B176				;$B5B1E2  /

CODE_B5B1E4:
	ASL A					;$B5B1E4  \
	ASL A					;$B5B1E5   |
	ASL A					;$B5B1E6   |
	ASL A					;$B5B1E7   |
	ASL A					;$B5B1E8   |
	ADC $36					;$B5B1E9   |
	TAY					;$B5B1EB   |
	LDA $0018,y				;$B5B1EC   |
	EOR #$C000				;$B5B1EF   |
	STA $00,x				;$B5B1F2   |
	LDA $0010,y				;$B5B1F4   |
	EOR #$C000				;$B5B1F7   |
	STA $02,x				;$B5B1FA   |
	LDA $0008,y				;$B5B1FC   |
	EOR #$C000				;$B5B1FF   |
	STA $04,x				;$B5B202   |
	LDA $0000,y				;$B5B204   |
	EOR #$C000				;$B5B207   |
	JMP CODE_B5B176				;$B5B20A  /

CODE_B5B20D:
	LDA $17C0				;$B5B20D  \
	AND #$00F8				;$B5B210   |
	CMP $17CE				;$B5B213   |
	BNE CODE_B5B219				;$B5B216   |
	RTL					;$B5B218  /

CODE_B5B219:
	LDA $17BA				;$B5B219  \
	SEC					;$B5B21C   |
	SBC #$0100				;$B5B21D   |
	AND #$FFE0				;$B5B220   |
	LSR A					;$B5B223   |
	LSR A					;$B5B224   |
	LSR A					;$B5B225   |
	LSR A					;$B5B226   |
	CLC					;$B5B227   |
	ADC $98					;$B5B228   |
	STA $32					;$B5B22A   |
	LDA $17C0				;$B5B22C   |
	SEC					;$B5B22F   |
	SBC #$0020				;$B5B230   |
	LDX $17D2				;$B5B233   |
	BPL CODE_B5B23C				;$B5B236   |
	SEC					;$B5B238   |
	SBC #$00E0				;$B5B239   |
CODE_B5B23C:					;	   |
	TAY					;$B5B23C   |
	AND #$FFE0				;$B5B23D   |
	CLC					;$B5B240   |
	ADC $32					;$B5B241   |
	STA $32					;$B5B243   |
	TYA					;$B5B245   |
	AND #$0018				;$B5B246   |
	ADC $17B4				;$B5B249   |
	STA $34					;$B5B24C   |
	TYA					;$B5B24E   |
	AND #$0018				;$B5B24F   |
	EOR #$0018				;$B5B252   |
	ADC $17B4				;$B5B255   |
	STA $36					;$B5B258   |
	LDA $9A					;$B5B25A   |
	PHA					;$B5B25C   |
	PLB					;$B5B25D   |
	LDX #$195A				;$B5B25E   |
CODE_B5B261:					;	   |
	LDA ($32)				;$B5B261   |
	BMI CODE_B5B2C1				;$B5B263   |
	BIT #$4000				;$B5B265   |
	BNE CODE_B5B299				;$B5B268   |
	ASL A					;$B5B26A   |
	ASL A					;$B5B26B   |
	ASL A					;$B5B26C   |
	ASL A					;$B5B26D   |
	ASL A					;$B5B26E   |
	ADC $34					;$B5B26F   |
	TAY					;$B5B271   |
	LDA $0000,y				;$B5B272   |
	STA $00,x				;$B5B275   |
	LDA $0002,y				;$B5B277   |
	STA $02,x				;$B5B27A   |
	LDA $0004,y				;$B5B27C   |
	STA $04,x				;$B5B27F   |
	LDA $0006,y				;$B5B281   |
CODE_B5B284:					;	   |
	STA $06,x				;$B5B284   |
	INC $32					;$B5B286   |
	INC $32					;$B5B288   |
	TXA					;$B5B28A   |
	CLC					;$B5B28B   |
	ADC #$0008				;$B5B28C   |
	TAX					;$B5B28F   |
	CMP #$19A2				;$B5B290   |
	BNE CODE_B5B261				;$B5B293   |
	PLB					;$B5B295   |
	JMP CODE_B5AFB4				;$B5B296  /

CODE_B5B299:
	ASL A					;$B5B299  \
	ASL A					;$B5B29A   |
	ASL A					;$B5B29B   |
	ASL A					;$B5B29C   |
	ASL A					;$B5B29D   |
	ADC $34					;$B5B29E   |
	TAY					;$B5B2A0   |
	LDA $0006,y				;$B5B2A1   |
	EOR #$4000				;$B5B2A4   |
	STA $00,x				;$B5B2A7   |
	LDA $0004,y				;$B5B2A9   |
	EOR #$4000				;$B5B2AC   |
	STA $02,x				;$B5B2AF   |
	LDA $0002,y				;$B5B2B1   |
	EOR #$4000				;$B5B2B4   |
	STA $04,x				;$B5B2B7   |
	LDA $0000,y				;$B5B2B9   |
	EOR #$4000				;$B5B2BC   |
	BRA CODE_B5B284				;$B5B2BF  /

CODE_B5B2C1:
	BIT #$4000				;$B5B2C1  \
	BNE CODE_B5B2EE				;$B5B2C4   |
	ASL A					;$B5B2C6   |
	ASL A					;$B5B2C7   |
	ASL A					;$B5B2C8   |
	ASL A					;$B5B2C9   |
	ASL A					;$B5B2CA   |
	ADC $36					;$B5B2CB   |
	TAY					;$B5B2CD   |
	LDA $0000,y				;$B5B2CE   |
	EOR #$8000				;$B5B2D1   |
	STA $00,x				;$B5B2D4   |
	LDA $0002,y				;$B5B2D6   |
	EOR #$8000				;$B5B2D9   |
	STA $02,x				;$B5B2DC   |
	LDA $0004,y				;$B5B2DE   |
	EOR #$8000				;$B5B2E1   |
	STA $04,x				;$B5B2E4   |
	LDA $0006,y				;$B5B2E6   |
	EOR #$8000				;$B5B2E9   |
	BRA CODE_B5B284				;$B5B2EC  /

CODE_B5B2EE:
	ASL A					;$B5B2EE  \
	ASL A					;$B5B2EF   |
	ASL A					;$B5B2F0   |
	ASL A					;$B5B2F1   |
	ASL A					;$B5B2F2   |
	ADC $36					;$B5B2F3   |
	TAY					;$B5B2F5   |
	LDA $0006,y				;$B5B2F6   |
	EOR #$C000				;$B5B2F9   |
	STA $00,x				;$B5B2FC   |
	LDA $0004,y				;$B5B2FE   |
	EOR #$C000				;$B5B301   |
	STA $02,x				;$B5B304   |
	LDA $0002,y				;$B5B306   |
	EOR #$C000				;$B5B309   |
	STA $04,x				;$B5B30C   |
	LDA $0000,y				;$B5B30E   |
	EOR #$C000				;$B5B311   |
	JMP CODE_B5B284				;$B5B314  /

CODE_B5B317:
	STZ $17C8				;$B5B317  \
	JSL CODE_B5B0FC				;$B5B31A   |
	JML CODE_B5B20D				;$B5B31E  /

CODE_B5B322:
	LDA $17BA				;$B5B322  \
	AND #$FFF8				;$B5B325   |
	CMP $17CA				;$B5B328   |
	BNE CODE_B5B32E				;$B5B32B   |
	RTL					;$B5B32D  /

CODE_B5B32E:
	LDA $17BA				;$B5B32E  \
	LDX $17D6				;$B5B331   |
	BPL CODE_B5B33D				;$B5B334   |
	LDA $17BA				;$B5B336   |
	SEC					;$B5B339   |
	SBC #$0100				;$B5B33A   |
CODE_B5B33D:					;	   |
	TAY					;$B5B33D   |
	AND #$FFE0				;$B5B33E   |
	LSR A					;$B5B341   |
	LSR A					;$B5B342   |
	LSR A					;$B5B343   |
	LSR A					;$B5B344   |
	CLC					;$B5B345   |
	ADC $98					;$B5B346   |
	STA $32					;$B5B348   |
	LDA $17C0				;$B5B34A   |
	SEC					;$B5B34D   |
	SBC #$0100				;$B5B34E   |
	AND #$FFE0				;$B5B351   |
	STA $34					;$B5B354   |
	ASL A					;$B5B356   |
	ASL A					;$B5B357   |
	CLC					;$B5B358   |
	ADC $34					;$B5B359   |
	CLC					;$B5B35B   |
	ADC $32					;$B5B35C   |
	STA $32					;$B5B35E   |
	TYA					;$B5B360   |
	AND #$0018				;$B5B361   |
	LSR A					;$B5B364   |
	LSR A					;$B5B365   |
	ADC $17B4				;$B5B366   |
	STA $34					;$B5B369   |
	TYA					;$B5B36B   |
	AND #$0018				;$B5B36C   |
	EOR #$0018				;$B5B36F   |
	LSR A					;$B5B372   |
	LSR A					;$B5B373   |
	ADC $17B4				;$B5B374   |
	STA $36					;$B5B377   |
	LDA $9A					;$B5B379   |
	PHA					;$B5B37B   |
	PLB					;$B5B37C   |
	LDX #$195A				;$B5B37D   |
CODE_B5B380:					;	   |
	LDA ($32)				;$B5B380   |
	BMI CODE_B5B3E4				;$B5B382   |
	BIT #$4000				;$B5B384   |
	BNE CODE_B5B3BC				;$B5B387   |
	ASL A					;$B5B389   |
	ASL A					;$B5B38A   |
	ASL A					;$B5B38B   |
	ASL A					;$B5B38C   |
	ASL A					;$B5B38D   |
	ADC $34					;$B5B38E   |
	TAY					;$B5B390   |
	LDA $0000,y				;$B5B391   |
	STA $00,x				;$B5B394   |
	LDA $0008,y				;$B5B396   |
	STA $02,x				;$B5B399   |
	LDA $0010,y				;$B5B39B   |
	STA $04,x				;$B5B39E   |
	LDA $0018,y				;$B5B3A0   |
CODE_B5B3A3:					;	   |
	STA $06,x				;$B5B3A3   |
	LDA $32					;$B5B3A5   |
	CLC					;$B5B3A7   |
	ADC #$00A0				;$B5B3A8   |
	STA $32					;$B5B3AB   |
	TXA					;$B5B3AD   |
	CLC					;$B5B3AE   |
	ADC #$0008				;$B5B3AF   |
	TAX					;$B5B3B2   |
	CMP #$19A2				;$B5B3B3   |
	BNE CODE_B5B380				;$B5B3B6   |
	PLB					;$B5B3B8   |
	JMP CODE_B5ADA9				;$B5B3B9  /

CODE_B5B3BC:
	ASL A					;$B5B3BC  \
	ASL A					;$B5B3BD   |
	ASL A					;$B5B3BE   |
	ASL A					;$B5B3BF   |
	ASL A					;$B5B3C0   |
	ADC $36					;$B5B3C1   |
	TAY					;$B5B3C3   |
	LDA $0000,y				;$B5B3C4   |
	EOR #$4000				;$B5B3C7   |
	STA $00,x				;$B5B3CA   |
	LDA $0008,y				;$B5B3CC   |
	EOR #$4000				;$B5B3CF   |
	STA $02,x				;$B5B3D2   |
	LDA $0010,y				;$B5B3D4   |
	EOR #$4000				;$B5B3D7   |
	STA $04,x				;$B5B3DA   |
	LDA $0018,y				;$B5B3DC   |
	EOR #$4000				;$B5B3DF   |
	BRA CODE_B5B3A3				;$B5B3E2  /

CODE_B5B3E4:
	BIT #$4000				;$B5B3E4  \
	BNE CODE_B5B411				;$B5B3E7   |
	ASL A					;$B5B3E9   |
	ASL A					;$B5B3EA   |
	ASL A					;$B5B3EB   |
	ASL A					;$B5B3EC   |
	ASL A					;$B5B3ED   |
	ADC $34					;$B5B3EE   |
	TAY					;$B5B3F0   |
	LDA $0018,y				;$B5B3F1   |
	EOR #$8000				;$B5B3F4   |
	STA $00,x				;$B5B3F7   |
	LDA $0010,y				;$B5B3F9   |
	EOR #$8000				;$B5B3FC   |
	STA $02,x				;$B5B3FF   |
	LDA $0008,y				;$B5B401   |
	EOR #$8000				;$B5B404   |
	STA $04,x				;$B5B407   |
	LDA $0000,y				;$B5B409   |
	EOR #$8000				;$B5B40C   |
	BRA CODE_B5B3A3				;$B5B40F  /

CODE_B5B411:
	ASL A					;$B5B411  \
	ASL A					;$B5B412   |
	ASL A					;$B5B413   |
	ASL A					;$B5B414   |
	ASL A					;$B5B415   |
	ADC $36					;$B5B416   |
	TAY					;$B5B418   |
	LDA $0018,y				;$B5B419   |
	EOR #$C000				;$B5B41C   |
	STA $00,x				;$B5B41F   |
	LDA $0010,y				;$B5B421   |
	EOR #$C000				;$B5B424   |
	STA $02,x				;$B5B427   |
	LDA $0008,y				;$B5B429   |
	EOR #$C000				;$B5B42C   |
	STA $04,x				;$B5B42F   |
	LDA $0000,y				;$B5B431   |
	EOR #$C000				;$B5B434   |
	JMP CODE_B5B3A3				;$B5B437  /

CODE_B5B43A:
	LDA $17C0				;$B5B43A  \
	AND #$00F8				;$B5B43D   |
	CMP $17CE				;$B5B440   |
	BNE CODE_B5B446				;$B5B443   |
	RTL					;$B5B445  /

CODE_B5B446:
	LDA $17BA				;$B5B446  \
	SEC					;$B5B449   |
	SBC #$0100				;$B5B44A   |
	AND #$FFE0				;$B5B44D   |
	LSR A					;$B5B450   |
	LSR A					;$B5B451   |
	LSR A					;$B5B452   |
	LSR A					;$B5B453   |
	CLC					;$B5B454   |
	ADC $98					;$B5B455   |
	STA $32					;$B5B457   |
	LDA $17C0				;$B5B459   |
	SEC					;$B5B45C   |
	SBC #$0020				;$B5B45D   |
	LDX $17D2				;$B5B460   |
	BPL CODE_B5B469				;$B5B463   |
	SEC					;$B5B465   |
	SBC #$00E0				;$B5B466   |
CODE_B5B469:					;	   |
	TAY					;$B5B469   |
	AND #$FFE0				;$B5B46A   |
	STA $34					;$B5B46D   |
	ASL A					;$B5B46F   |
	ASL A					;$B5B470   |
	CLC					;$B5B471   |
	ADC $34					;$B5B472   |
	ADC $32					;$B5B474   |
	STA $32					;$B5B476   |
	TYA					;$B5B478   |
	AND #$0018				;$B5B479   |
	ADC $17B4				;$B5B47C   |
	STA $34					;$B5B47F   |
	TYA					;$B5B481   |
	AND #$0018				;$B5B482   |
	EOR #$0018				;$B5B485   |
	ADC $17B4				;$B5B488   |
	STA $36					;$B5B48B   |
	LDA $9A					;$B5B48D   |
	PHA					;$B5B48F   |
	PLB					;$B5B490   |
	LDX #$195A				;$B5B491   |
CODE_B5B494:					;	   |
	LDA ($32)				;$B5B494   |
	BMI CODE_B5B4F4				;$B5B496   |
	BIT #$4000				;$B5B498   |
	BNE CODE_B5B4CC				;$B5B49B   |
	ASL A					;$B5B49D   |
	ASL A					;$B5B49E   |
	ASL A					;$B5B49F   |
	ASL A					;$B5B4A0   |
	ASL A					;$B5B4A1   |
	ADC $34					;$B5B4A2   |
	TAY					;$B5B4A4   |
	LDA $0000,y				;$B5B4A5   |
	STA $00,x				;$B5B4A8   |
	LDA $0002,y				;$B5B4AA   |
	STA $02,x				;$B5B4AD   |
	LDA $0004,y				;$B5B4AF   |
	STA $04,x				;$B5B4B2   |
	LDA $0006,y				;$B5B4B4   |
CODE_B5B4B7:					;	   |
	STA $06,x				;$B5B4B7   |
	INC $32					;$B5B4B9   |
	INC $32					;$B5B4BB   |
	TXA					;$B5B4BD   |
	CLC					;$B5B4BE   |
	ADC #$0008				;$B5B4BF   |
	TAX					;$B5B4C2   |
	CMP #$19A2				;$B5B4C3   |
	BNE CODE_B5B494				;$B5B4C6   |
	PLB					;$B5B4C8   |
	JMP CODE_B5AFB4				;$B5B4C9  /

CODE_B5B4CC:
	ASL A					;$B5B4CC  \
	ASL A					;$B5B4CD   |
	ASL A					;$B5B4CE   |
	ASL A					;$B5B4CF   |
	ASL A					;$B5B4D0   |
	ADC $34					;$B5B4D1   |
	TAY					;$B5B4D3   |
	LDA $0006,y				;$B5B4D4   |
	EOR #$4000				;$B5B4D7   |
	STA $00,x				;$B5B4DA   |
	LDA $0004,y				;$B5B4DC   |
	EOR #$4000				;$B5B4DF   |
	STA $02,x				;$B5B4E2   |
	LDA $0002,y				;$B5B4E4   |
	EOR #$4000				;$B5B4E7   |
	STA $04,x				;$B5B4EA   |
	LDA $0000,y				;$B5B4EC   |
	EOR #$4000				;$B5B4EF   |
	BRA CODE_B5B4B7				;$B5B4F2  /

CODE_B5B4F4:
	BIT #$4000				;$B5B4F4  \
	BNE CODE_B5B521				;$B5B4F7   |
	ASL A					;$B5B4F9   |
	ASL A					;$B5B4FA   |
	ASL A					;$B5B4FB   |
	ASL A					;$B5B4FC   |
	ASL A					;$B5B4FD   |
	ADC $36					;$B5B4FE   |
	TAY					;$B5B500   |
	LDA $0000,y				;$B5B501   |
	EOR #$8000				;$B5B504   |
	STA $00,x				;$B5B507   |
	LDA $0002,y				;$B5B509   |
	EOR #$8000				;$B5B50C   |
	STA $02,x				;$B5B50F   |
	LDA $0004,y				;$B5B511   |
	EOR #$8000				;$B5B514   |
	STA $04,x				;$B5B517   |
	LDA $0006,y				;$B5B519   |
	EOR #$8000				;$B5B51C   |
	BRA CODE_B5B4B7				;$B5B51F  /

CODE_B5B521:
	ASL A					;$B5B521  \
	ASL A					;$B5B522   |
	ASL A					;$B5B523   |
	ASL A					;$B5B524   |
	ASL A					;$B5B525   |
	ADC $36					;$B5B526   |
	TAY					;$B5B528   |
	LDA $0006,y				;$B5B529   |
	EOR #$C000				;$B5B52C   |
	STA $00,x				;$B5B52F   |
	LDA $0004,y				;$B5B531   |
	EOR #$C000				;$B5B534   |
	STA $02,x				;$B5B537   |
	LDA $0002,y				;$B5B539   |
	EOR #$C000				;$B5B53C   |
	STA $04,x				;$B5B53F   |
	LDA $0000,y				;$B5B541   |
	EOR #$C000				;$B5B544   |
	JMP CODE_B5B4B7				;$B5B547  /

CODE_B5B54A:
	STZ $17C8				;$B5B54A  \
	JSL CODE_B5B322				;$B5B54D   |
	JML CODE_B5B43A				;$B5B551  /

CODE_B5B555:
	LDA $17BA				;$B5B555  \
	AND #$FFF8				;$B5B558   |
	CMP $17CA				;$B5B55B   |
	BNE CODE_B5B561				;$B5B55E   |
	RTL					;$B5B560  /

CODE_B5B561:
	LDA $17BA				;$B5B561  \
	LDX $17D6				;$B5B564   |
	BPL CODE_B5B570				;$B5B567   |
	LDA $17BA				;$B5B569   |
	SEC					;$B5B56C   |
	SBC #$0100				;$B5B56D   |
CODE_B5B570:					;	   |
	TAY					;$B5B570   |
	AND #$FFE0				;$B5B571   |
	LSR A					;$B5B574   |
	LSR A					;$B5B575   |
	LSR A					;$B5B576   |
	LSR A					;$B5B577   |
	CLC					;$B5B578   |
	ADC $98					;$B5B579   |
	STA $32					;$B5B57B   |
	LDA $17C0				;$B5B57D   |
	SEC					;$B5B580   |
	SBC #$0100				;$B5B581   |
	AND #$FFE0				;$B5B584   |
	ASL A					;$B5B587   |
	STA $34					;$B5B588   |
	ASL A					;$B5B58A   |
	CLC					;$B5B58B   |
	ADC $34					;$B5B58C   |
	CLC					;$B5B58E   |
	ADC $32					;$B5B58F   |
	STA $32					;$B5B591   |
	TYA					;$B5B593   |
	AND #$0018				;$B5B594   |
	LSR A					;$B5B597   |
	LSR A					;$B5B598   |
	ADC $17B4				;$B5B599   |
	STA $34					;$B5B59C   |
	TYA					;$B5B59E   |
	AND #$0018				;$B5B59F   |
	EOR #$0018				;$B5B5A2   |
	LSR A					;$B5B5A5   |
	LSR A					;$B5B5A6   |
	ADC $17B4				;$B5B5A7   |
	STA $36					;$B5B5AA   |
	LDA $9A					;$B5B5AC   |
	PHA					;$B5B5AE   |
	PLB					;$B5B5AF   |
	LDX #$195A				;$B5B5B0   |
CODE_B5B5B3:					;	   |
	LDA ($32)				;$B5B5B3   |
	BMI CODE_B5B617				;$B5B5B5   |
	BIT #$4000				;$B5B5B7   |
	BNE CODE_B5B5EF				;$B5B5BA   |
	ASL A					;$B5B5BC   |
	ASL A					;$B5B5BD   |
	ASL A					;$B5B5BE   |
	ASL A					;$B5B5BF   |
	ASL A					;$B5B5C0   |
	ADC $34					;$B5B5C1   |
	TAY					;$B5B5C3   |
	LDA $0000,y				;$B5B5C4   |
	STA $00,x				;$B5B5C7   |
	LDA $0008,y				;$B5B5C9   |
	STA $02,x				;$B5B5CC   |
	LDA $0010,y				;$B5B5CE   |
	STA $04,x				;$B5B5D1   |
	LDA $0018,y				;$B5B5D3   |
CODE_B5B5D6:					;	   |
	STA $06,x				;$B5B5D6   |
	LDA $32					;$B5B5D8   |
	CLC					;$B5B5DA   |
	ADC #$00C0				;$B5B5DB   |
	STA $32					;$B5B5DE   |
	TXA					;$B5B5E0   |
	CLC					;$B5B5E1   |
	ADC #$0008				;$B5B5E2   |
	TAX					;$B5B5E5   |
	CMP #$19A2				;$B5B5E6   |
	BNE CODE_B5B5B3				;$B5B5E9   |
	PLB					;$B5B5EB   |
	JMP CODE_B5ADA9				;$B5B5EC  /

CODE_B5B5EF:
	ASL A					;$B5B5EF  \
	ASL A					;$B5B5F0   |
	ASL A					;$B5B5F1   |
	ASL A					;$B5B5F2   |
	ASL A					;$B5B5F3   |
	ADC $36					;$B5B5F4   |
	TAY					;$B5B5F6   |
	LDA $0000,y				;$B5B5F7   |
	EOR #$4000				;$B5B5FA   |
	STA $00,x				;$B5B5FD   |
	LDA $0008,y				;$B5B5FF   |
	EOR #$4000				;$B5B602   |
	STA $02,x				;$B5B605   |
	LDA $0010,y				;$B5B607   |
	EOR #$4000				;$B5B60A   |
	STA $04,x				;$B5B60D   |
	LDA $0018,y				;$B5B60F   |
	EOR #$4000				;$B5B612   |
	BRA CODE_B5B5D6				;$B5B615  /

CODE_B5B617:
	BIT #$4000				;$B5B617  \
	BNE CODE_B5B644				;$B5B61A   |
	ASL A					;$B5B61C   |
	ASL A					;$B5B61D   |
	ASL A					;$B5B61E   |
	ASL A					;$B5B61F   |
	ASL A					;$B5B620   |
	ADC $34					;$B5B621   |
	TAY					;$B5B623   |
	LDA $0018,y				;$B5B624   |
	EOR #$8000				;$B5B627   |
	STA $00,x				;$B5B62A   |
	LDA $0010,y				;$B5B62C   |
	EOR #$8000				;$B5B62F   |
	STA $02,x				;$B5B632   |
	LDA $0008,y				;$B5B634   |
	EOR #$8000				;$B5B637   |
	STA $04,x				;$B5B63A   |
	LDA $0000,y				;$B5B63C   |
	EOR #$8000				;$B5B63F   |
	BRA CODE_B5B5D6				;$B5B642  /

CODE_B5B644:
	ASL A					;$B5B644  \
	ASL A					;$B5B645   |
	ASL A					;$B5B646   |
	ASL A					;$B5B647   |
	ASL A					;$B5B648   |
	ADC $36					;$B5B649   |
	TAY					;$B5B64B   |
	LDA $0018,y				;$B5B64C   |
	EOR #$C000				;$B5B64F   |
	STA $00,x				;$B5B652   |
	LDA $0010,y				;$B5B654   |
	EOR #$C000				;$B5B657   |
	STA $02,x				;$B5B65A   |
	LDA $0008,y				;$B5B65C   |
	EOR #$C000				;$B5B65F   |
	STA $04,x				;$B5B662   |
	LDA $0000,y				;$B5B664   |
	EOR #$C000				;$B5B667   |
	JMP CODE_B5B5D6				;$B5B66A  /

CODE_B5B66D:
	LDA $17C0				;$B5B66D  \
	AND #$00F8				;$B5B670   |
	CMP $17CE				;$B5B673   |
	BNE CODE_B5B679				;$B5B676   |
	RTL					;$B5B678  /

CODE_B5B679:
	LDA $17BA				;$B5B679  \
	SEC					;$B5B67C   |
	SBC #$0100				;$B5B67D   |
	AND #$FFE0				;$B5B680   |
	LSR A					;$B5B683   |
	LSR A					;$B5B684   |
	LSR A					;$B5B685   |
	LSR A					;$B5B686   |
	CLC					;$B5B687   |
	ADC $98					;$B5B688   |
	STA $32					;$B5B68A   |
	LDA $17C0				;$B5B68C   |
	SEC					;$B5B68F   |
	SBC #$0020				;$B5B690   |
	LDX $17D2				;$B5B693   |
	BPL CODE_B5B69C				;$B5B696   |
	SEC					;$B5B698   |
	SBC #$00E0				;$B5B699   |
CODE_B5B69C:					;	   |
	TAY					;$B5B69C   |
	AND #$FFE0				;$B5B69D   |
	ASL A					;$B5B6A0   |
	STA $34					;$B5B6A1   |
	ASL A					;$B5B6A3   |
	CLC					;$B5B6A4   |
	ADC $34					;$B5B6A5   |
	ADC $32					;$B5B6A7   |
	STA $32					;$B5B6A9   |
	TYA					;$B5B6AB   |
	AND #$0018				;$B5B6AC   |
	ADC $17B4				;$B5B6AF   |
	STA $34					;$B5B6B2   |
	TYA					;$B5B6B4   |
	AND #$0018				;$B5B6B5   |
	EOR #$0018				;$B5B6B8   |
	ADC $17B4				;$B5B6BB   |
	STA $36					;$B5B6BE   |
	LDA $9A					;$B5B6C0   |
	PHA					;$B5B6C2   |
	PLB					;$B5B6C3   |
	LDX #$195A				;$B5B6C4   |
CODE_B5B6C7:					;	   |
	LDA ($32)				;$B5B6C7   |
	BMI CODE_B5B727				;$B5B6C9   |
	BIT #$4000				;$B5B6CB   |
	BNE CODE_B5B6FF				;$B5B6CE   |
	ASL A					;$B5B6D0   |
	ASL A					;$B5B6D1   |
	ASL A					;$B5B6D2   |
	ASL A					;$B5B6D3   |
	ASL A					;$B5B6D4   |
	ADC $34					;$B5B6D5   |
	TAY					;$B5B6D7   |
	LDA $0000,y				;$B5B6D8   |
	STA $00,x				;$B5B6DB   |
	LDA $0002,y				;$B5B6DD   |
	STA $02,x				;$B5B6E0   |
	LDA $0004,y				;$B5B6E2   |
	STA $04,x				;$B5B6E5   |
	LDA $0006,y				;$B5B6E7   |
CODE_B5B6EA:					;	   |
	STA $06,x				;$B5B6EA   |
	INC $32					;$B5B6EC   |
	INC $32					;$B5B6EE   |
	TXA					;$B5B6F0   |
	CLC					;$B5B6F1   |
	ADC #$0008				;$B5B6F2   |
	TAX					;$B5B6F5   |
	CMP #$19A2				;$B5B6F6   |
	BNE CODE_B5B6C7				;$B5B6F9   |
	PLB					;$B5B6FB   |
	JMP CODE_B5AFB4				;$B5B6FC  /

CODE_B5B6FF:
	ASL A					;$B5B6FF  \
	ASL A					;$B5B700   |
	ASL A					;$B5B701   |
	ASL A					;$B5B702   |
	ASL A					;$B5B703   |
	ADC $34					;$B5B704   |
	TAY					;$B5B706   |
	LDA $0006,y				;$B5B707   |
	EOR #$4000				;$B5B70A   |
	STA $00,x				;$B5B70D   |
	LDA $0004,y				;$B5B70F   |
	EOR #$4000				;$B5B712   |
	STA $02,x				;$B5B715   |
	LDA $0002,y				;$B5B717   |
	EOR #$4000				;$B5B71A   |
	STA $04,x				;$B5B71D   |
	LDA $0000,y				;$B5B71F   |
	EOR #$4000				;$B5B722   |
	BRA CODE_B5B6EA				;$B5B725  /

CODE_B5B727:
	BIT #$4000				;$B5B727  \
	BNE CODE_B5B754				;$B5B72A   |
	ASL A					;$B5B72C   |
	ASL A					;$B5B72D   |
	ASL A					;$B5B72E   |
	ASL A					;$B5B72F   |
	ASL A					;$B5B730   |
	ADC $36					;$B5B731   |
	TAY					;$B5B733   |
	LDA $0000,y				;$B5B734   |
	EOR #$8000				;$B5B737   |
	STA $00,x				;$B5B73A   |
	LDA $0002,y				;$B5B73C   |
	EOR #$8000				;$B5B73F   |
	STA $02,x				;$B5B742   |
	LDA $0004,y				;$B5B744   |
	EOR #$8000				;$B5B747   |
	STA $04,x				;$B5B74A   |
	LDA $0006,y				;$B5B74C   |
	EOR #$8000				;$B5B74F   |
	BRA CODE_B5B6EA				;$B5B752  /

CODE_B5B754:
	ASL A					;$B5B754  \
	ASL A					;$B5B755   |
	ASL A					;$B5B756   |
	ASL A					;$B5B757   |
	ASL A					;$B5B758   |
	ADC $36					;$B5B759   |
	TAY					;$B5B75B   |
	LDA $0006,y				;$B5B75C   |
	EOR #$C000				;$B5B75F   |
	STA $00,x				;$B5B762   |
	LDA $0004,y				;$B5B764   |
	EOR #$C000				;$B5B767   |
	STA $02,x				;$B5B76A   |
	LDA $0002,y				;$B5B76C   |
	EOR #$C000				;$B5B76F   |
	STA $04,x				;$B5B772   |
	LDA $0000,y				;$B5B774   |
	EOR #$C000				;$B5B777   |
	JMP CODE_B5B6EA				;$B5B77A  /

CODE_B5B77D:
	STZ $17C8				;$B5B77D  \
	JSL CODE_B5B555				;$B5B780   |
	JML CODE_B5B66D				;$B5B784  /

CODE_B5B788:
	LDA $17BA				;$B5B788  \
	AND #$FFF8				;$B5B78B   |
	CMP $17CA				;$B5B78E   |
	BNE CODE_B5B794				;$B5B791   |
	RTL					;$B5B793  /

CODE_B5B794:
	LDA $17BA				;$B5B794  \
	LDX $17D6				;$B5B797   |
	BPL CODE_B5B7A3				;$B5B79A   |
	LDA $17BA				;$B5B79C   |
	SEC					;$B5B79F   |
	SBC #$0100				;$B5B7A0   |
CODE_B5B7A3:					;	   |
	TAY					;$B5B7A3   |
	AND #$FFE0				;$B5B7A4   |
	LSR A					;$B5B7A7   |
	LSR A					;$B5B7A8   |
	LSR A					;$B5B7A9   |
	LSR A					;$B5B7AA   |
	CLC					;$B5B7AB   |
	ADC $98					;$B5B7AC   |
	STA $32					;$B5B7AE   |
	LDA $17C0				;$B5B7B0   |
	SEC					;$B5B7B3   |
	SBC #$0100				;$B5B7B4   |
	AND #$FFE0				;$B5B7B7   |
	ASL A					;$B5B7BA   |
	CLC					;$B5B7BB   |
	ADC $32					;$B5B7BC   |
	STA $32					;$B5B7BE   |
	TYA					;$B5B7C0   |
	AND #$0018				;$B5B7C1   |
	LSR A					;$B5B7C4   |
	LSR A					;$B5B7C5   |
	ADC $17B4				;$B5B7C6   |
	STA $34					;$B5B7C9   |
	TYA					;$B5B7CB   |
	AND #$0018				;$B5B7CC   |
	EOR #$0018				;$B5B7CF   |
	LSR A					;$B5B7D2   |
	LSR A					;$B5B7D3   |
	ADC $17B4				;$B5B7D4   |
	STA $36					;$B5B7D7   |
	LDA $9A					;$B5B7D9   |
	PHA					;$B5B7DB   |
	PLB					;$B5B7DC   |
	LDX #$195A				;$B5B7DD   |
CODE_B5B7E0:					;	   |
	LDA ($32)				;$B5B7E0   |
	BMI CODE_B5B844				;$B5B7E2   |
	BIT #$4000				;$B5B7E4   |
	BNE CODE_B5B81C				;$B5B7E7   |
	ASL A					;$B5B7E9   |
	ASL A					;$B5B7EA   |
	ASL A					;$B5B7EB   |
	ASL A					;$B5B7EC   |
	ASL A					;$B5B7ED   |
	ADC $34					;$B5B7EE   |
	TAY					;$B5B7F0   |
	LDA $0000,y				;$B5B7F1   |
	STA $00,x				;$B5B7F4   |
	LDA $0008,y				;$B5B7F6   |
	STA $02,x				;$B5B7F9   |
	LDA $0010,y				;$B5B7FB   |
	STA $04,x				;$B5B7FE   |
	LDA $0018,y				;$B5B800   |
CODE_B5B803:					;	   |
	STA $06,x				;$B5B803   |
	LDA $32					;$B5B805   |
	CLC					;$B5B807   |
	ADC #$0040				;$B5B808   |
	STA $32					;$B5B80B   |
	TXA					;$B5B80D   |
	CLC					;$B5B80E   |
	ADC #$0008				;$B5B80F   |
	TAX					;$B5B812   |
	CMP #$19A2				;$B5B813   |
	BNE CODE_B5B7E0				;$B5B816   |
	PLB					;$B5B818   |
	JMP CODE_B5ADA9				;$B5B819  /

CODE_B5B81C:
	ASL A					;$B5B81C  \
	ASL A					;$B5B81D   |
	ASL A					;$B5B81E   |
	ASL A					;$B5B81F   |
	ASL A					;$B5B820   |
	ADC $36					;$B5B821   |
	TAY					;$B5B823   |
	LDA $0000,y				;$B5B824   |
	EOR #$4000				;$B5B827   |
	STA $00,x				;$B5B82A   |
	LDA $0008,y				;$B5B82C   |
	EOR #$4000				;$B5B82F   |
	STA $02,x				;$B5B832   |
	LDA $0010,y				;$B5B834   |
	EOR #$4000				;$B5B837   |
	STA $04,x				;$B5B83A   |
	LDA $0018,y				;$B5B83C   |
	EOR #$4000				;$B5B83F   |
	BRA CODE_B5B803				;$B5B842  /

CODE_B5B844:
	BIT #$4000				;$B5B844  \
	BNE CODE_B5B871				;$B5B847   |
	ASL A					;$B5B849   |
	ASL A					;$B5B84A   |
	ASL A					;$B5B84B   |
	ASL A					;$B5B84C   |
	ASL A					;$B5B84D   |
	ADC $34					;$B5B84E   |
	TAY					;$B5B850   |
	LDA $0018,y				;$B5B851   |
	EOR #$8000				;$B5B854   |
	STA $00,x				;$B5B857   |
	LDA $0010,y				;$B5B859   |
	EOR #$8000				;$B5B85C   |
	STA $02,x				;$B5B85F   |
	LDA $0008,y				;$B5B861   |
	EOR #$8000				;$B5B864   |
	STA $04,x				;$B5B867   |
	LDA $0000,y				;$B5B869   |
	EOR #$8000				;$B5B86C   |
	BRA CODE_B5B803				;$B5B86F  /

CODE_B5B871:
	ASL A					;$B5B871  \
	ASL A					;$B5B872   |
	ASL A					;$B5B873   |
	ASL A					;$B5B874   |
	ASL A					;$B5B875   |
	ADC $36					;$B5B876   |
	TAY					;$B5B878   |
	LDA $0018,y				;$B5B879   |
	EOR #$C000				;$B5B87C   |
	STA $00,x				;$B5B87F   |
	LDA $0010,y				;$B5B881   |
	EOR #$C000				;$B5B884   |
	STA $02,x				;$B5B887   |
	LDA $0008,y				;$B5B889   |
	EOR #$C000				;$B5B88C   |
	STA $04,x				;$B5B88F   |
	LDA $0000,y				;$B5B891   |
	EOR #$C000				;$B5B894   |
	JMP CODE_B5B803				;$B5B897  /

CODE_B5B89A:
	LDA $17C0				;$B5B89A  \
	AND #$00F8				;$B5B89D   |
	CMP $17CE				;$B5B8A0   |
	BNE CODE_B5B8A6				;$B5B8A3   |
	RTL					;$B5B8A5  /

CODE_B5B8A6:
	LDA $17BA				;$B5B8A6  \
	SEC					;$B5B8A9   |
	SBC #$0100				;$B5B8AA   |
	AND #$FFE0				;$B5B8AD   |
	LSR A					;$B5B8B0   |
	LSR A					;$B5B8B1   |
	LSR A					;$B5B8B2   |
	LSR A					;$B5B8B3   |
	CLC					;$B5B8B4   |
	ADC $98					;$B5B8B5   |
	STA $32					;$B5B8B7   |
	LDA $17C0				;$B5B8B9   |
	SEC					;$B5B8BC   |
	SBC #$0020				;$B5B8BD   |
	LDX $17D2				;$B5B8C0   |
	BPL CODE_B5B8C9				;$B5B8C3   |
	SEC					;$B5B8C5   |
	SBC #$00E0				;$B5B8C6   |
CODE_B5B8C9:					;	   |
	TAY					;$B5B8C9   |
	AND #$FFE0				;$B5B8CA   |
	ASL A					;$B5B8CD   |
	CLC					;$B5B8CE   |
	ADC $32					;$B5B8CF   |
	STA $32					;$B5B8D1   |
	TYA					;$B5B8D3   |
	AND #$0018				;$B5B8D4   |
	ADC $17B4				;$B5B8D7   |
	STA $34					;$B5B8DA   |
	TYA					;$B5B8DC   |
	AND #$0018				;$B5B8DD   |
	EOR #$0018				;$B5B8E0   |
	ADC $17B4				;$B5B8E3   |
	STA $36					;$B5B8E6   |
	LDA $9A					;$B5B8E8   |
	PHA					;$B5B8EA   |
	PLB					;$B5B8EB   |
	LDX #$195A				;$B5B8EC   |
CODE_B5B8EF:					;	   |
	LDA ($32)				;$B5B8EF   |
	BMI CODE_B5B94F				;$B5B8F1   |
	BIT #$4000				;$B5B8F3   |
	BNE CODE_B5B927				;$B5B8F6   |
	ASL A					;$B5B8F8   |
	ASL A					;$B5B8F9   |
	ASL A					;$B5B8FA   |
	ASL A					;$B5B8FB   |
	ASL A					;$B5B8FC   |
	ADC $34					;$B5B8FD   |
	TAY					;$B5B8FF   |
	LDA $0000,y				;$B5B900   |
	STA $00,x				;$B5B903   |
	LDA $0002,y				;$B5B905   |
	STA $02,x				;$B5B908   |
	LDA $0004,y				;$B5B90A   |
	STA $04,x				;$B5B90D   |
	LDA $0006,y				;$B5B90F   |
CODE_B5B912:					;	   |
	STA $06,x				;$B5B912   |
	INC $32					;$B5B914   |
	INC $32					;$B5B916   |
	TXA					;$B5B918   |
	CLC					;$B5B919   |
	ADC #$0008				;$B5B91A   |
	TAX					;$B5B91D   |
	CMP #$19A2				;$B5B91E   |
	BNE CODE_B5B8EF				;$B5B921   |
	PLB					;$B5B923   |
	JMP CODE_B5AFB4				;$B5B924  /

CODE_B5B927:
	ASL A					;$B5B927  \
	ASL A					;$B5B928   |
	ASL A					;$B5B929   |
	ASL A					;$B5B92A   |
	ASL A					;$B5B92B   |
	ADC $34					;$B5B92C   |
	TAY					;$B5B92E   |
	LDA $0006,y				;$B5B92F   |
	EOR #$4000				;$B5B932   |
	STA $00,x				;$B5B935   |
	LDA $0004,y				;$B5B937   |
	EOR #$4000				;$B5B93A   |
	STA $02,x				;$B5B93D   |
	LDA $0002,y				;$B5B93F   |
	EOR #$4000				;$B5B942   |
	STA $04,x				;$B5B945   |
	LDA $0000,y				;$B5B947   |
	EOR #$4000				;$B5B94A   |
	BRA CODE_B5B912				;$B5B94D  /

CODE_B5B94F:
	BIT #$4000				;$B5B94F  \
	BNE CODE_B5B97C				;$B5B952   |
	ASL A					;$B5B954   |
	ASL A					;$B5B955   |
	ASL A					;$B5B956   |
	ASL A					;$B5B957   |
	ASL A					;$B5B958   |
	ADC $36					;$B5B959   |
	TAY					;$B5B95B   |
	LDA $0000,y				;$B5B95C   |
	EOR #$8000				;$B5B95F   |
	STA $00,x				;$B5B962   |
	LDA $0002,y				;$B5B964   |
	EOR #$8000				;$B5B967   |
	STA $02,x				;$B5B96A   |
	LDA $0004,y				;$B5B96C   |
	EOR #$8000				;$B5B96F   |
	STA $04,x				;$B5B972   |
	LDA $0006,y				;$B5B974   |
	EOR #$8000				;$B5B977   |
	BRA CODE_B5B912				;$B5B97A  /

CODE_B5B97C:
	ASL A					;$B5B97C  \
	ASL A					;$B5B97D   |
	ASL A					;$B5B97E   |
	ASL A					;$B5B97F   |
	ASL A					;$B5B980   |
	ADC $36					;$B5B981   |
	TAY					;$B5B983   |
	LDA $0006,y				;$B5B984   |
	EOR #$C000				;$B5B987   |
	STA $00,x				;$B5B98A   |
	LDA $0004,y				;$B5B98C   |
	EOR #$C000				;$B5B98F   |
	STA $02,x				;$B5B992   |
	LDA $0002,y				;$B5B994   |
	EOR #$C000				;$B5B997   |
	STA $04,x				;$B5B99A   |
	LDA $0000,y				;$B5B99C   |
	EOR #$C000				;$B5B99F   |
	JMP CODE_B5B912				;$B5B9A2  /

CODE_B5B9A5:
	STZ $17C8				;$B5B9A5  \
	JSL CODE_B5B788				;$B5B9A8   |
	JML CODE_B5B89A				;$B5B9AC  /

CODE_B5B9B0:
	STZ $17C8				;$B5B9B0  \
	JSL CODE_B5AC9C				;$B5B9B3   |
	JML CODE_B5AEA7				;$B5B9B7  /

CODE_B5B9BB:
	JSL CODE_B5A950				;$B5B9BB  \
	JSL CODE_B5AAE6				;$B5B9BF   |
	RTL					;$B5B9C3  /

	LDA #$00C0				;$B5B9C4   |
	STA $17C8				;$B5B9C7   |
	LDA $98					;$B5B9CA   |
	CLC					;$B5B9CC   |
	ADC #$4B00				;$B5B9CD   |
	STA $98					;$B5B9D0   |
	JSL CODE_B5AC9C				;$B5B9D2   |
	JSL CODE_B5AEA7				;$B5B9D6   |
	LDA $98					;$B5B9DA   |
	SEC					;$B5B9DC   |
	SBC #$4B00				;$B5B9DD   |
	STA $98					;$B5B9E0   |
	STZ $17C8				;$B5B9E2   |
	JSL CODE_B5AC9C				;$B5B9E5   |
	JML CODE_B5AEA7				;$B5B9E9  /

CODE_B5B9ED:
	JSR CODE_B5B9F1				;$B5B9ED  \
	RTL					;$B5B9F0  /

CODE_B5B9F1:
	JSL CODE_B5E0E2				;$B5B9F1  \
	LDA #$FFFF				;$B5B9F5   |
	STA $10					;$B5B9F8   |
	STA $12					;$B5B9FA   |
	JSL CODE_B5E50D				;$B5B9FC   |
	LDA $0AE2				;$B5BA00   |
	STA $0ADA				;$B5BA03   |
	LDA $0AE4				;$B5BA06   |
	STA $0ADC				;$B5BA09   |
	LDA $0ADE				;$B5BA0C   |
	STA $0AD6				;$B5BA0F   |
	LDA $0AE0				;$B5BA12   |
	STA $0AD8				;$B5BA15   |
	LDA $0AE3				;$B5BA18   |
	STA $17C0				;$B5BA1B   |
	DEC A					;$B5BA1E   |
	STA $17C2				;$B5BA1F   |
	LDA $052B				;$B5BA22   |
	AND #$0004				;$B5BA25   |
	BNE CODE_B5BA83				;$B5BA28   |
	LDA $0ADF				;$B5BA2A   |
	SEC					;$B5BA2D   |
	SBC #$0100				;$B5BA2E   |
	STA $17BA				;$B5BA31   |
	STZ $0ACE				;$B5BA34   |
	STZ $0AD0				;$B5BA37   |
	STZ $0AD2				;$B5BA3A   |
	STZ $0AD4				;$B5BA3D   |
	LDA $17C0				;$B5BA40   |
	AND #$00F8				;$B5BA43   |
	STA $17CE				;$B5BA46   |
	LDA $17BA				;$B5BA49   |
	CLC					;$B5BA4C   |
	ADC #$0008				;$B5BA4D   |
	AND #$00F8				;$B5BA50   |
	STA $17CA				;$B5BA53   |
	STZ $17D2				;$B5BA56   |
	LDA #$0004				;$B5BA59   |
	STA $17D6				;$B5BA5C   |
	LDA #$0040				;$B5BA5F   |
CODE_B5BA62:					;	   |
	PHA					;$B5BA62   |
	JSR CODE_B5BA99				;$B5BA63   |
	JSR CODE_B5BADE				;$B5BA66   |
	LDA #$0004				;$B5BA69   |
	STA $17D6				;$B5BA6C   |
	CLC					;$B5BA6F   |
	ADC $17BA				;$B5BA70   |
	STA $17BA				;$B5BA73   |
	PLA					;$B5BA76   |
	DEC A					;$B5BA77   |
	BNE CODE_B5BA62				;$B5BA78   |
	STZ $17D2				;$B5BA7A   |
	STZ $17D6				;$B5BA7D   |
	JSR CODE_B5BA99				;$B5BA80   |
CODE_B5BA83:					;	   |
	LDA $17C0				;$B5BA83   |
	AND #$00F8				;$B5BA86   |
	STA $17CE				;$B5BA89   |
	STZ $0ACE				;$B5BA8C   |
	STZ $0AD0				;$B5BA8F   |
	STZ $0AD2				;$B5BA92   |
	STZ $0AD4				;$B5BA95   |
	RTS					;$B5BA98  /

CODE_B5BA99:
	LDA $052B				;$B5BA99  \
	AND #$0001				;$B5BA9C   |
	BEQ CODE_B5BAA9				;$B5BA9F   |
	JSL CODE_80E522				;$B5BAA1   |
	JSL CODE_B5A950				;$B5BAA5   |
CODE_B5BAA9:					;	   |
	LDA $0AB4				;$B5BAA9   |
	AND #$000F				;$B5BAAC   |
	BNE CODE_B5BAB6				;$B5BAAF   |
CODE_B5BAB1:					;	   |
	JSL CODE_B5AC9C				;$B5BAB1   |
	RTS					;$B5BAB5  /

CODE_B5BAB6:
	CMP #$0008				;$B5BAB6  \
	BEQ CODE_B5BAB1				;$B5BAB9   |
	CMP #$0005				;$B5BABB   |
	BEQ CODE_B5BAD4				;$B5BABE   |
	CMP #$0004				;$B5BAC0   |
	BEQ CODE_B5BACF				;$B5BAC3   |
	CMP #$0006				;$B5BAC5   |
	BEQ CODE_B5BAD9				;$B5BAC8   |
	JSL CODE_B5B322				;$B5BACA   |
	RTS					;$B5BACE  /

CODE_B5BACF:
	JSL CODE_B5B788				;$B5BACF  \
	RTS					;$B5BAD3  /

CODE_B5BAD4:
	JSL CODE_B5B0FC				;$B5BAD4  \
	RTS					;$B5BAD8  /

CODE_B5BAD9:
	JSL CODE_B5B555				;$B5BAD9  \
	RTS					;$B5BADD  /

CODE_B5BADE:
	LDA $052B				;$B5BADE  \
	AND #$0001				;$B5BAE1   |
	BEQ CODE_B5BAEA				;$B5BAE4   |
	JSL CODE_B5AA88				;$B5BAE6   |
CODE_B5BAEA:					;	   |
	JSL CODE_B5ADD8				;$B5BAEA   |
	RTS					;$B5BAEE  /

DATA_B5BAEF:
	%offset(DATA_B5BAF1, 2)
	dl DATA_E3438B
	dl DATA_E36F39
	dl DATA_E3B5D4
	dl DATA_E3E006
	dl DATA_E3F9B2
	dl DATA_E4186E
	dl DATA_E45ADE
	dl DATA_E3A1C4
	dl DATA_E479EE
	dl DATA_E49E44
	dl DATA_E4B767
	dl DATA_E4F714
	dl DATA_E5264B
	dl DATA_E52732
	dl DATA_E52832
	dl DATA_E54E8A
	dl !null_pointer
	dl DATA_E54351
	dl DATA_E4E649
	dl DATA_E43D8A
	dl DATA_E4F714


DATA_B5BB2E:
	%offset(DATA_B5BB30, 2)
	dl DATA_E572C5
	dl DATA_E597E1
	dl DATA_E5A71C
	dl DATA_E5C627
	dl DATA_E5E0C8
	dl DATA_E5F52D
	dl DATA_E60FB1
	dl DATA_E5A71C
	dl DATA_E6303A
	dl DATA_E64C7F
	dl DATA_E665F8
	dl DATA_E68077
	dl DATA_E694EC
	dl DATA_E69CE2
	dl DATA_E6A896
	dl DATA_E6C9FF
	dl !null_pointer
	dl DATA_E6A896
	dl DATA_E665F8
	dl DATA_E5F52D
	dl DATA_E68077


DATA_B5BB6D:
	db $00, $68, $00, $38, $00, $78, $00, $70
	db $00, $78, $00, $78, $00, $78, $00, $78
	db $00, $78, $00, $78, $00, $78, $00, $68
	db $00, $78, $00, $78, $00, $78, $00, $78
	db $00, $78, $00, $78, $00, $78, $00, $78
	db $00, $68

DATA_B5BB97:
	%offset(DATA_B5BB99, 2)
	dl DATA_FC5900
	dl DATA_FC5B8C
	dl DATA_FC5D94
	dl DATA_FC6154
	dl DATA_FC63FC
	dl DATA_FC665C
	dl DATA_FC689C
	dl DATA_FC5D94
	dl DATA_FC6A0C
	dl DATA_FC6AA8
	dl DATA_FC6B30
	dl DATA_FC70E8
	dl DATA_FC7478
	dl DATA_FC749C
	dl DATA_FC74E0
	dl DATA_FC7A58
	dl DATA_FC5900
	dl DATA_FC74E0
	dl DATA_FC6B30
	dl DATA_FC665C
	dl DATA_FC70E8


DATA_B5BBD6:
	db $A3, $00, $82, $00, $F0, $00, $AA, $00
	db $98, $00, $90, $00, $5C, $00, $F0, $00
	db $27, $00, $22, $00, $6E, $01, $E4, $00
	db $09, $00, $11, $00, $5E, $01, $E1, $00
	db $A3, $00, $5E, $01, $6E, $01, $90, $00
	db $E4, $00

DATA_B5BC00:
	dw CODE_B5C82C
	dw CODE_B5C60B
	dw CODE_B5C60B
	dw CODE_B5C82C
	dw CODE_B5C414
	dw CODE_B5C80D
	dw CODE_B5C82C
	dw CODE_B5C510
	dw CODE_B5C414
	dw CODE_B5C82C
	dw CODE_B5C70C
	dw CODE_B5C510
	dw CODE_B5C510
	dw CODE_B5C384
	dw CODE_B5C39F
	dw CODE_B5C82C
	dw CODE_B5C397
	dw CODE_B5C510
	dw CODE_B5C70C
	dw CODE_B5C80D
	dw CODE_B5C2DB

DATA_B5BC2A:
	dw DATA_FD06F0
	dw DATA_FD0910
	dw DATA_FD0A10
	dw DATA_FD0CD0
	dw DATA_FD14F0
	dw DATA_FD1710
	dw DATA_FD0DF0
	dw DATA_FD0A10
	dw DATA_FD228E
	dw DATA_FD27EE
	dw DATA_FD28EE
	dw DATA_FD2DEE
	dw DATA_FD2CEE
	dw DATA_FD314E
	dw DATA_FD398E
	dw DATA_FD3B6E
	dw DATA_FD2170
	dw DATA_FD398E
	dw DATA_FD28EE
	dw DATA_FD1710
	dw DATA_FD2DEE


DATA_B5BC54:
	dw $0420, $0420, $0420, $0420
	dw $0420, $0420, $0420, $0420
	dw $0420, $0420, $0420, $0420
	dw $0420, $0020, $0420, $0420
	dw $0000, $0420, $0420, $0420
	dw $0420

DATA_B5BC7E:
	dw DATA_B5BD05
	dw DATA_B5BD79
	dw DATA_B5BDC5
	dw DATA_B5BE25
	dw DATA_B5BE8F
	dw DATA_B5BF21
	dw DATA_B5BF45
	dw DATA_B5BFAF
	dw DATA_B5BFDD
	dw DATA_B5C03D
	dw DATA_B5C0BB
	dw DATA_B5C0F3
	dw DATA_B5C153
	dw DATA_B5C163
	dw DATA_B5C173
	dw DATA_B5C1C9
	dw DATA_B5BD05
	dw DATA_B5C21F
	dw DATA_B5C22F
	dw DATA_B5C28F
	dw DATA_B5C0F3


CODE_B5BCA8:
	PHB					;$B5BCA8  \
	PHK					;$B5BCA9   |
	PLB					;$B5BCAA   |
	STA $32					;$B5BCAB   |
	ASL A					;$B5BCAD   |
	TAY					;$B5BCAE   |
	CLC					;$B5BCAF   |
	ADC $32					;$B5BCB0   |
	TAX					;$B5BCB2   |
	LDA DATA_B5BAEF,x			;$B5BCB3   |
	STA $98					;$B5BCB6   |
	SEP #$20				;$B5BCB8   |
	LDA DATA_B5BB30,x			;$B5BCBA   |
	XBA					;$B5BCBD   |
	LDA DATA_B5BAF1,x			;$B5BCBE   |
	REP #$20				;$B5BCC1   |
	STA $9A					;$B5BCC3   |
	LDA DATA_B5BB97,x			;$B5BCC5   |
	STA $9C					;$B5BCC8   |
	LDA DATA_B5BB99,x			;$B5BCCA   |
	AND #$00FF				;$B5BCCD   |
	ORA #$8000				;$B5BCD0   |
	STA $9E					;$B5BCD3   |
	LDA DATA_B5BB2E,x			;$B5BCD5   |
	STA $17B4				;$B5BCD8   |
	LDA DATA_B5BB6D,y			;$B5BCDB   |
	STA $17B6				;$B5BCDE   |
	LDA DATA_B5BBD6,y			;$B5BCE1   |
	STA $A0					;$B5BCE4   |
	LDA DATA_B5BC00,y			;$B5BCE6   |
	STA $17B2				;$B5BCE9   |
	LDA $0A8E				;$B5BCEC   |
	BNE CODE_B5BCF7				;$B5BCEF   |
	LDA DATA_B5BC2A,y			;$B5BCF1   |
	STA $0A8E				;$B5BCF4   |
CODE_B5BCF7:					;	   |
	LDA DATA_B5BC7E,y			;$B5BCF7   |
	STA $0B84				;$B5BCFA   |
	LDA DATA_B5BC54,y			;$B5BCFD   |
	STA $0B86				;$B5BD00   |
	PLB					;$B5BD03   |
	RTL					;$B5BD04  /

DATA_B5BD05:
	db $00, $30, $00, $02, $20, $00, $00, $2F
	db $00, $00, $00, $02, $00, $00, $20, $2F
	db $00, $60, $00, $00, $00, $02, $00, $00
	db $20, $60, $E0, $88, $00, $00, $00, $02
	db $00, $00, $00, $92, $00, $93, $00, $00
	db $00, $01, $00, $00, $00, $92, $00, $93
	db $00, $00, $00, $02, $00, $00, $00, $92
	db $00, $93, $00, $00, $00, $02, $00, $00
	db $00, $60, $E0, $88, $00, $00, $00, $02
	db $00, $00, $E0, $88, $80, $8C, $00, $00
	db $00, $02, $00, $00, $80, $8C, $60, $90
	db $00, $00, $00, $02, $00, $00, $60, $90
	db $00, $92, $00, $00, $00, $02, $00, $00
	db $00, $93, $E0, $96, $00, $00, $00, $02
	db $00, $00, $FF, $FF

DATA_B5BD79:
	db $00, $0A, $00, $40, $00, $00, $00, $0A
	db $00, $00, $A0, $08, $07, $00, $00, $00
	db $00, $0A, $A0, $08, $00, $10, $07, $00
	db $00, $00, $00, $0A, $00, $10, $00, $17
	db $07, $00, $00, $00, $00, $03, $00, $17
	db $80, $1A, $07, $00, $00, $03, $C0, $05
	db $00, $17, $C0, $19, $07, $00, $C0, $05
	db $40, $09, $00, $17, $00, $19, $07, $00
	db $C0, $05, $40, $09, $00, $19, $80, $1A
	db $07, $00, $FF, $FF

DATA_B5BDC5:
	db $00, $0A, $00, $40, $00, $00, $00, $0A
	db $00, $00, $20, $0A, $07, $00, $00, $00
	db $00, $0A, $80, $0A, $80, $16, $07, $00
	db $80, $04, $80, $05, $20, $09, $20, $0A
	db $07, $00, $80, $05, $80, $06, $20, $09
	db $20, $0A, $07, $00, $00, $00, $80, $05
	db $80, $16, $80, $17, $07, $00, $00, $00
	db $80, $04, $80, $17, $80, $18, $07, $00
	db $80, $05, $80, $06, $80, $16, $80, $18
	db $07, $00, $80, $06, $A0, $07, $80, $16
	db $80, $19, $07, $00, $A0, $07, $00, $0A
	db $80, $16, $40, $1A, $07, $00, $FF, $FF

DATA_B5BE25:
	db $00, $30, $00, $02, $20, $00, $00, $1C
	db $00, $00, $00, $02, $00, $00, $00, $1C
	db $00, $3C, $00, $00, $00, $02, $00, $00
	db $20, $3C, $A0, $64, $00, $00, $00, $02
	db $00, $00, $A0, $64, $A0, $65, $00, $00
	db $00, $02, $00, $00, $A0, $64, $A0, $65
	db $00, $00, $00, $02, $00, $00, $A0, $65
	db $A0, $67, $00, $00, $00, $02, $00, $00
	db $A0, $67, $A0, $6C, $00, $00, $00, $01
	db $00, $00, $A0, $6C, $A0, $6E, $00, $00
	db $00, $02, $00, $00, $A0, $6E, $A0, $71
	db $00, $00, $00, $02, $00, $00, $A0, $71
	db $80, $73, $00, $00, $00, $02, $00, $00
	db $FF, $FF

DATA_B5BE8F:
	db $00, $04, $00, $40, $00, $00, $80, $01
	db $00, $00, $00, $01, $04, $00, $00, $00
	db $00, $04, $00, $01, $80, $17, $04, $00
	db $00, $00, $00, $03, $40, $18, $40, $27
	db $04, $00, $00, $00, $00, $03, $40, $27
	db $40, $32, $04, $00, $00, $00, $80, $01
	db $40, $32, $80, $3D, $04, $00, $40, $01
	db $40, $02, $20, $19, $20, $1A, $04, $00
	db $80, $01, $C0, $03, $40, $32, $A0, $36
	db $04, $00, $80, $01, $20, $03, $A0, $36
	db $40, $38, $04, $00, $80, $01, $80, $02
	db $40, $38, $60, $39, $04, $00, $80, $01
	db $60, $03, $60, $39, $00, $3B, $04, $00
	db $80, $01, $C0, $02, $00, $3B, $40, $3E
	db $04, $00, $00, $00, $20, $01, $80, $3D
	db $A0, $3E, $04, $00, $00, $00, $00, $01
	db $A0, $40, $00, $44, $04, $00, $00, $00
	db $00, $04, $A0, $3E, $A0, $40, $04, $00
	db $FF, $FF

DATA_B5BF21:
	db $00, $30, $00, $02, $00, $00, $40, $43
	db $00, $00, $00, $02, $08, $00, $C0, $49
	db $C0, $A8, $00, $00, $00, $02, $08, $00
	db $40, $43, $C0, $49, $00, $00, $00, $02
	db $08, $00, $FF, $FF

DATA_B5BF45:
	db $00, $30, $00, $02, $00, $00, $80, $23
	db $00, $00, $00, $02, $00, $00, $80, $23
	db $00, $4C, $00, $00, $00, $02, $00, $00
	db $00, $4E, $00, $80, $00, $00, $00, $02
	db $00, $00, $00, $80, $00, $81, $00, $00
	db $00, $02, $00, $00, $00, $4C, $00, $4E
	db $00, $00, $00, $02, $00, $00, $00, $81
	db $00, $87, $00, $00, $00, $02, $00, $00
	db $00, $87, $80, $89, $00, $00, $00, $02
	db $00, $00, $80, $89, $C0, $8B, $00, $00
	db $00, $02, $00, $00, $C0, $8B, $C0, $91
	db $00, $00, $00, $02, $00, $00, $C0, $91
	db $60, $93, $00, $00, $00, $02, $00, $00
	db $FF, $FF

DATA_B5BFAF:
	db $00, $02, $00, $40, $00, $00, $00, $02
	db $20, $02, $20, $35, $05, $00, $00, $00
	db $00, $02, $00, $00, $20, $02, $05, $00
	db $00, $00, $00, $01, $20, $35, $80, $37
	db $05, $00, $00, $01, $00, $02, $20, $35
	db $20, $38, $05, $00, $FF, $FF

DATA_B5BFDD:
	db $00, $03, $00, $40, $00, $00, $00, $03
	db $00, $00, $20, $1A, $04, $00, $00, $00
	db $00, $03, $20, $1A, $A0, $2C, $04, $00
	db $00, $00, $00, $01, $A0, $2B, $A0, $2C
	db $04, $00, $00, $00, $00, $03, $A0, $2C
	db $A0, $4C, $04, $00, $00, $00, $00, $03
	db $A0, $4C, $A0, $4E, $04, $00, $00, $00
	db $00, $03, $A0, $4E, $A0, $4F, $04, $00
	db $00, $00, $00, $02, $A0, $4F, $E0, $56
	db $04, $00, $00, $00, $60, $01, $E0, $56
	db $C0, $58, $04, $00, $A0, $01, $00, $03
	db $60, $2E, $C0, $32, $04, $00, $FF, $FF

DATA_B5C03D:
	db $00, $30, $00, $02, $00, $00, $80, $2E
	db $00, $00, $00, $02, $00, $00, $80, $2E
	db $A0, $57, $00, $00, $00, $02, $00, $00
	db $C0, $32, $C0, $33, $00, $00, $00, $02
	db $00, $00, $A0, $57, $20, $8A, $00, $00
	db $00, $02, $00, $00, $C0, $32, $C0, $33
	db $00, $00, $00, $02, $00, $00, $20, $8A
	db $20, $8B, $00, $00, $00, $02, $00, $00
	db $20, $8B, $20, $8F, $00, $00, $00, $02
	db $00, $00, $20, $8F, $A0, $90, $00, $00
	db $00, $02, $00, $00, $A0, $90, $A0, $92
	db $00, $00, $00, $02, $00, $00, $A0, $92
	db $A0, $96, $00, $00, $00, $02, $00, $00
	db $A0, $96, $20, $9A, $00, $00, $00, $02
	db $00, $00, $00, $58, $80, $59, $00, $00
	db $00, $02, $00, $00, $FF, $FF

DATA_B5C0BB:
	db $00, $0C, $00, $10, $00, $00, $60, $08
	db $00, $00, $00, $0B, $07, $00, $00, $00
	db $00, $0C, $00, $0B, $00, $15, $06, $00
	db $00, $00, $00, $0C, $00, $15, $00, $1F
	db $06, $00, $60, $08, $20, $0A, $00, $00
	db $30, $09, $06, $00, $20, $0A, $00, $0C
	db $00, $00, $80, $06, $06, $00, $FF, $FF

DATA_B5C0F3:
	db $00, $02, $00, $10, $00, $00, $00, $02
	db $00, $01, $E0, $30, $05, $00, $00, $00
	db $00, $02, $00, $00, $00, $01, $05, $00
	db $00, $00, $00, $02, $E0, $30, $C0, $57
	db $05, $00, $00, $00, $00, $02, $C0, $57
	db $A0, $7E, $05, $00, $00, $00, $00, $02
	db $A0, $7E, $60, $82, $05, $00, $00, $00
	db $00, $01, $60, $82, $80, $87, $05, $00
	db $00, $00, $80, $01, $80, $87, $80, $8A
	db $05, $00, $00, $00, $80, $01, $80, $8A
	db $20, $96, $05, $00, $00, $00, $00, $02
	db $20, $96, $20, $97, $05, $00, $FF, $FF

DATA_B5C153:
	db $00, $02, $00, $10, $00, $00, $00, $02
	db $00, $00, $00, $01, $05, $00, $FF, $FF

DATA_B5C163:
	db $00, $02, $00, $10, $00, $00, $00, $02
	db $00, $00, $00, $01, $05, $00, $FF, $FF

DATA_B5C173:
	db $00, $0A, $00, $10, $00, $00, $00, $0A
	db $00, $00, $80, $06, $07, $00, $00, $00
	db $00, $0A, $80, $06, $40, $0E, $07, $00
	db $00, $00, $00, $0A, $40, $0E, $20, $13
	db $07, $00, $00, $00, $60, $03, $20, $13
	db $C0, $15, $07, $00, $60, $03, $20, $09
	db $20, $13, $00, $16, $07, $00, $00, $00
	db $80, $01, $00, $16, $80, $1B, $07, $00
	db $80, $01, $60, $03, $00, $16, $60, $1A
	db $07, $00, $60, $03, $20, $07, $00, $16
	db $C0, $18, $07, $00, $FF, $FF

DATA_B5C1C9:
	db $00, $30, $00, $02, $00, $02, $E0, $36
	db $00, $00, $00, $02, $00, $00, $00, $00
	db $00, $02, $00, $00, $00, $02, $00, $00
	db $E0, $36, $80, $41, $00, $00, $00, $02
	db $00, $00, $80, $41, $80, $49, $00, $00
	db $00, $01, $00, $00, $80, $41, $60, $44
	db $00, $01, $00, $02, $00, $00, $80, $49
	db $40, $77, $00, $00, $00, $02, $00, $00
	db $40, $77, $20, $83, $00, $00, $00, $02
	db $00, $00, $20, $83, $40, $8F, $00, $00
	db $00, $02, $00, $00, $FF, $FF

DATA_B5C21F:
	db $00, $02, $00, $10, $00, $00, $00, $02
	db $00, $00, $60, $24, $05, $00, $FF, $FF

DATA_B5C22F:
	db $00, $0C, $00, $10, $00, $00, $00, $0C
	db $20, $04, $A0, $09, $06, $00, $00, $00
	db $60, $05, $00, $00, $40, $04, $06, $00
	db $60, $05, $00, $08, $00, $00, $80, $03
	db $06, $00, $00, $08, $80, $0B, $00, $00
	db $A0, $02, $06, $00, $00, $08, $80, $09
	db $A0, $02, $C0, $03, $06, $00, $00, $00
	db $A0, $04, $A0, $09, $E0, $0A, $06, $00
	db $00, $00, $80, $02, $E0, $0A, $C0, $0E
	db $06, $00, $A0, $02, $00, $07, $00, $0B
	db $60, $0E, $06, $00, $00, $07, $20, $0A
	db $A0, $09, $40, $0F, $06, $00, $FF, $FF

DATA_B5C28F:
	db $00, $30, $00, $02, $00, $00, $40, $55
	db $00, $00, $00, $02, $08, $00, $40, $55
	db $A0, $56, $00, $00, $00, $02, $08, $00
	db $A0, $56, $80, $58, $00, $00, $00, $02
	db $08, $00, $80, $58, $A0, $6C, $00, $00
	db $00, $02, $08, $00, $A0, $6C, $40, $7A
	db $00, $00, $00, $02, $08, $00, $40, $7A
	db $E0, $8A, $00, $00, $00, $02, $08, $00
	db $E0, $8A, $80, $93, $00, $00, $00, $02
	db $08, $00, $FF, $FF

CODE_B5C2DB:
	LDA #$6240				;$B5C2DB  \
	SEC					;$B5C2DE   |
	SBC $0D54				;$B5C2DF   |
	STA $3A					;$B5C2E2   |
	LDA #$6300				;$B5C2E4   |
	SEC					;$B5C2E7   |
	SBC $34					;$B5C2E8   |
	STA $3C					;$B5C2EA   |
	LDA $0D4A				;$B5C2EC   |
	BMI CODE_B5C30B				;$B5C2EF   |
	BEQ CODE_B5C30B				;$B5C2F1   |
	LDX current_sprite			;$B5C2F3   |
	LDA $00,x				;$B5C2F5   |
	CMP #$00E9				;$B5C2F7   |
	BCS CODE_B5C30B				;$B5C2FA   |
	LDA $6E					;$B5C2FC   |
	CMP #$0198				;$B5C2FE   |
	BEQ CODE_B5C30B				;$B5C301   |
	BIT $24,x				;$B5C303   |
	BPL CODE_B5C366				;$B5C305   |
	STZ $24,x				;$B5C307   |
	BRA CODE_B5C366				;$B5C309  /

CODE_B5C30B:
	JSL CODE_B5C510				;$B5C30B  \
	STA $A2					;$B5C30F   |
	EOR #$FFFF				;$B5C311   |
	BPL CODE_B5C36A				;$B5C314   |
	SEC					;$B5C316   |
	ADC $3C					;$B5C317   |
	BCS CODE_B5C341				;$B5C319   |
	LDA $AE					;$B5C31B   |
	CMP #$0001				;$B5C31D   |
	BNE CODE_B5C341				;$B5C320   |
	LDA $E5					;$B5C322   |
	AND #$FEFF				;$B5C324   |
	BEQ CODE_B5C363				;$B5C327   |
	LDA $3C					;$B5C329   |
	SEC					;$B5C32B   |
	SBC $3A					;$B5C32C   |
	BCC CODE_B5C335				;$B5C32E   |
	CMP #$0004				;$B5C330   |
	BCS CODE_B5C341				;$B5C333   |
CODE_B5C335:					;	   |
	LDA #$0100				;$B5C335   |
	TSB $AC					;$B5C338   |
	TSB $AE					;$B5C33A   |
	TSB $E5					;$B5C33C   |
	LDA $3A					;$B5C33E   |
	RTL					;$B5C340  /

CODE_B5C341:
	LDA $E5					;$B5C341  \
	AND #$0100				;$B5C343   |
	TSB $AC					;$B5C346   |
	TSB $AE					;$B5C348   |
	LDA $A2					;$B5C34A   |
	CMP #$8000				;$B5C34C   |
	BCS CODE_B5C36A				;$B5C34F   |
	CMP $3A					;$B5C351   |
	BCC CODE_B5C36A				;$B5C353   |
	CMP $3C					;$B5C355   |
	BCS CODE_B5C383				;$B5C357   |
	LDA $3C					;$B5C359   |
	SEC					;$B5C35B   |
	SBC $3A					;$B5C35C   |
	CMP #$0050				;$B5C35E   |
	BMI CODE_B5C381				;$B5C361   |
CODE_B5C363:					;	   |
	LDA $A2					;$B5C363   |
	RTL					;$B5C365  /

CODE_B5C366:
	STZ $AC					;$B5C366  \
	STZ $AE					;$B5C368   |
CODE_B5C36A:					;	   |
	LDA $E5					;$B5C36A   |
	AND #$0100				;$B5C36C   |
	TSB $AC					;$B5C36F   |
	TSB $AE					;$B5C371   |
	LDA $3C					;$B5C373   |
	SEC					;$B5C375   |
	SBC $3A					;$B5C376   |
	CMP #$0050				;$B5C378   |
	BMI CODE_B5C381				;$B5C37B   |
	LDA #$FFC0				;$B5C37D   |
	RTL					;$B5C380  /

CODE_B5C381:
	LDA $3A					;$B5C381  \
CODE_B5C383:					;	   |
	RTL					;$B5C383  /

CODE_B5C384:
	STZ $AC					;$B5C384  \
	STZ $AE					;$B5C386   |
	LDA $06,x				;$B5C388   |
	CMP #$02A0				;$B5C38A   |
	BPL CODE_B5C393				;$B5C38D   |
	LDA #$613F				;$B5C38F   |
	RTL					;$B5C392  /

CODE_B5C393:
	LDA #$6300				;$B5C393  \
	RTL					;$B5C396  /

CODE_B5C397:
	STZ $AC					;$B5C397  \
	STZ $AE					;$B5C399   |
	LDA #$6140				;$B5C39B   |
	RTL					;$B5C39E  /

CODE_B5C39F:
	LDA $0915				;$B5C39F  \
	BEQ CODE_B5C3C2				;$B5C3A2   |
	LDA $0D4E				;$B5C3A4   |
	CMP $34					;$B5C3A7   |
	BMI CODE_B5C3C8				;$B5C3A9   |
	EOR #$FFFF				;$B5C3AB   |
	CLC					;$B5C3AE   |
	ADC #$6301				;$B5C3AF   |
	STA $3A					;$B5C3B2   |
	JSL CODE_B5C60B				;$B5C3B4   |
	CMP #$0000				;$B5C3B8   |
	BMI CODE_B5C3C5				;$B5C3BB   |
	CMP $3A					;$B5C3BD   |
	BMI CODE_B5C3C5				;$B5C3BF   |
	RTL					;$B5C3C1  /

CODE_B5C3C2:
	JMP CODE_B5C60B				;$B5C3C2  /

CODE_B5C3C5:
	LDA $0D4E				;$B5C3C5  \
CODE_B5C3C8:					;	   |
	EOR #$FFFF				;$B5C3C8   |
	CLC					;$B5C3CB   |
	ADC #$6301				;$B5C3CC   |
	STZ $AC					;$B5C3CF   |
	STZ $AE					;$B5C3D1   |
	CLC					;$B5C3D3   |
	RTL					;$B5C3D4  /

CODE_B5C3D5:
	SEC					;$B5C3D5  \
	SBC #$0100				;$B5C3D6   |
	STA $32					;$B5C3D9   |
	LDA $0A,x				;$B5C3DB   |
	STA $34					;$B5C3DD   |
	BRA CODE_B5C3ED				;$B5C3DF  /

CODE_B5C3E1:
	LDA $0A,x				;$B5C3E1  \
CODE_B5C3E3:					;	   |
	STA $34					;$B5C3E3   |
	LDA $06,x				;$B5C3E5   |
CODE_B5C3E7:					;	   |
	SEC					;$B5C3E7   |
	SBC #$0100				;$B5C3E8   |
	STA $32					;$B5C3EB   |
CODE_B5C3ED:					;	   |
	PHK					;$B5C3ED   |
	PLB					;$B5C3EE   |
	STX $62					;$B5C3EF   |
	JMP ($17B2)				;$B5C3F1  /

CODE_B5C3F4:
if !version == 1				;	  \
	LDA $0A,x				;$B5C3F4   |
	CMP #$0B50				;$B5C3F6   |
	BPL CODE_B5C414				;$B5C3F9   |
	PHX					;$B5C3FB   |
	LDA.l $000654				;$B5C3FC   |
	BEQ CODE_B5C40A				;$B5C400   |
	TAX					;$B5C402   |
	LDA $0A,x				;$B5C403   |
	CMP #$0B50				;$B5C405   |
	BMI CODE_B5C413				;$B5C408   |
CODE_B5C40A:					;	   |
	PLX					;$B5C40A   |
	STZ $AC					;$B5C40B   |
	STZ $AE					;$B5C40D   |
	LDA #$FFC0				;$B5C40F   |
	RTL					;$B5C412  /

CODE_B5C413:
	PLX					;$B5C413  \
endif						;	   |
CODE_B5C414:					;	   |
	LDA $32					;$B5C414   |
	AND #$001F				;$B5C416   |
	STA $A6					;$B5C419   |
	STZ $AC					;$B5C41B   |
	LDA $34					;$B5C41D   |
	SEC					;$B5C41F   |
	SBC #$0100				;$B5C420   |
	EOR #$FFFF				;$B5C423   |
	INC A					;$B5C426   |
	AND #$FFE0				;$B5C427   |
	STA $A4					;$B5C42A   |
	LDA $32					;$B5C42C   |
	AND #$FFE0				;$B5C42E   |
	LSR A					;$B5C431   |
	LSR A					;$B5C432   |
	LSR A					;$B5C433   |
	LSR A					;$B5C434   |
	STA $32					;$B5C435   |
	LDA $A4					;$B5C437   |
	EOR #$FFE0				;$B5C439   |
	ASL A					;$B5C43C   |
	CLC					;$B5C43D   |
	ADC $32					;$B5C43E   |
	TAY					;$B5C440   |
	JSR CODE_B5C94D				;$B5C441   |
	PHA					;$B5C444   |
	LDA $AC					;$B5C445   |
	STA $AE					;$B5C447   |
	PLA					;$B5C449   |
	BMI CODE_B5C459				;$B5C44A   |
	CMP #$001F				;$B5C44C   |
	BNE CODE_B5C454				;$B5C44F   |
	JMP CODE_B5C4E8				;$B5C451  /

CODE_B5C454:
	TAY					;$B5C454  \
	ORA $A4					;$B5C455   |
	BRA CODE_B5C488				;$B5C457  /

CODE_B5C459:
	TYA					;$B5C459  \
	CLC					;$B5C45A   |
	ADC #$0040				;$B5C45B   |
	TAY					;$B5C45E   |
	LDA $A4					;$B5C45F   |
	SEC					;$B5C461   |
	SBC #$0020				;$B5C462   |
	STA $A4					;$B5C465   |
	JSR CODE_B5C94D				;$B5C467   |
	CMP #$0000				;$B5C46A   |
	BPL CODE_B5C485				;$B5C46D   |
	TYA					;$B5C46F   |
	CLC					;$B5C470   |
	ADC #$0040				;$B5C471   |
	TAY					;$B5C474   |
	LDA $A4					;$B5C475   |
	SEC					;$B5C477   |
	SBC #$0020				;$B5C478   |
	STA $A4					;$B5C47B   |
	JSR CODE_B5C94D				;$B5C47D   |
	CMP #$0000				;$B5C480   |
	BMI CODE_B5C4E0				;$B5C483   |
CODE_B5C485:					;	   |
	TAY					;$B5C485   |
	ORA $A4					;$B5C486   |
CODE_B5C488:					;	   |
	PHA					;$B5C488   |
	LDA $AC					;$B5C489   |
	AND #$7FFF				;$B5C48B   |
	CMP #$4004				;$B5C48E   |
	BEQ CODE_B5C49D				;$B5C491   |
	CMP #$4005				;$B5C493   |
	BEQ CODE_B5C49D				;$B5C496   |
	CMP #$4001				;$B5C498   |
	BNE CODE_B5C4A2				;$B5C49B   |
CODE_B5C49D:					;	   |
	LDA #$2000				;$B5C49D   |
	TSB $AC					;$B5C4A0   |
CODE_B5C4A2:					;	   |
	LDA $AC					;$B5C4A2   |
	STA $32					;$B5C4A4   |
	AND #$003F				;$B5C4A6   |
	TRB $AC					;$B5C4A9   |
	ASL A					;$B5C4AB   |
	TAX					;$B5C4AC   |
	LDA DATA_B5C9B5,x			;$B5C4AD   |
	AND #$801F				;$B5C4B0   |
	BPL CODE_B5C4BD				;$B5C4B3   |
	CPY #$000F				;$B5C4B5   |
	BEQ CODE_B5C4BF				;$B5C4B8   |
	AND #$001F				;$B5C4BA   |
CODE_B5C4BD:					;	   |
	TSB $AC					;$B5C4BD   |
CODE_B5C4BF:					;	   |
	LDA $AE					;$B5C4BF   |
	AND #$7FFF				;$B5C4C1   |
	CMP #$4004				;$B5C4C4   |
	BEQ CODE_B5C4D3				;$B5C4C7   |
	CMP #$4005				;$B5C4C9   |
	BEQ CODE_B5C4D3				;$B5C4CC   |
	CMP #$4001				;$B5C4CE   |
	BNE CODE_B5C4D8				;$B5C4D1   |
CODE_B5C4D3:					;	   |
	LDA #$2000				;$B5C4D3   |
	TSB $AE					;$B5C4D6   |
CODE_B5C4D8:					;	   |
	PLA					;$B5C4D8   |
	LDX $62					;$B5C4D9   |
	CLC					;$B5C4DB   |
	ADC #$6200				;$B5C4DC   |
	RTL					;$B5C4DF  /

CODE_B5C4E0:
	LDA #$FFC0				;$B5C4E0  \
	STZ $AC					;$B5C4E3   |
	LDX $62					;$B5C4E5   |
	RTL					;$B5C4E7  /

CODE_B5C4E8:
	TYA					;$B5C4E8  \
	SEC					;$B5C4E9   |
	SBC #$0040				;$B5C4EA   |
	TAY					;$B5C4ED   |
	LDA $AC					;$B5C4EE   |
	STA $32					;$B5C4F0   |
	JSR CODE_B5C94D				;$B5C4F2   |
	CMP #$0000				;$B5C4F5   |
	BMI CODE_B5C503				;$B5C4F8   |
	TAY					;$B5C4FA   |
	ORA #$0020				;$B5C4FB   |
	CLC					;$B5C4FE   |
	ADC $A4					;$B5C4FF   |
	BRA CODE_B5C488				;$B5C501  /

CODE_B5C503:
	LDA $32					;$B5C503  \
	STA $AC					;$B5C505   |
	LDA #$001F				;$B5C507   |
	TAY					;$B5C50A   |
	ORA $A4					;$B5C50B   |
	JMP CODE_B5C488				;$B5C50D  /

CODE_B5C510:
	LDA $32					;$B5C510  \
	AND #$001F				;$B5C512   |
	STA $A6					;$B5C515   |
	STZ $AC					;$B5C517   |
	LDA $34					;$B5C519   |
	SEC					;$B5C51B   |
	SBC #$0100				;$B5C51C   |
	EOR #$FFFF				;$B5C51F   |
	INC A					;$B5C522   |
	AND #$FFE0				;$B5C523   |
	STA $A4					;$B5C526   |
	LDA $32					;$B5C528   |
	AND #$FFE0				;$B5C52A   |
	LSR A					;$B5C52D   |
	LSR A					;$B5C52E   |
	LSR A					;$B5C52F   |
	LSR A					;$B5C530   |
	STA $32					;$B5C531   |
	LDA $A4					;$B5C533   |
	EOR #$FFE0				;$B5C535   |
	CLC					;$B5C538   |
	ADC $32					;$B5C539   |
	TAY					;$B5C53B   |
	JSR CODE_B5C94D				;$B5C53C   |
	PHA					;$B5C53F   |
	LDA $AC					;$B5C540   |
	STA $AE					;$B5C542   |
	PLA					;$B5C544   |
	BMI CODE_B5C554				;$B5C545   |
	CMP #$001F				;$B5C547   |
	BNE CODE_B5C54F				;$B5C54A   |
	JMP CODE_B5C5E3				;$B5C54C  /

CODE_B5C54F:
	TAY					;$B5C54F  \
	ORA $A4					;$B5C550   |
	BRA CODE_B5C583				;$B5C552  /

CODE_B5C554:
	TYA					;$B5C554  \
	CLC					;$B5C555   |
	ADC #$0020				;$B5C556   |
	TAY					;$B5C559   |
	LDA $A4					;$B5C55A   |
	SEC					;$B5C55C   |
	SBC #$0020				;$B5C55D   |
	STA $A4					;$B5C560   |
	JSR CODE_B5C94D				;$B5C562   |
	CMP #$0000				;$B5C565   |
	BPL CODE_B5C580				;$B5C568   |
	TYA					;$B5C56A   |
	CLC					;$B5C56B   |
	ADC #$0020				;$B5C56C   |
	TAY					;$B5C56F   |
	LDA $A4					;$B5C570   |
	SEC					;$B5C572   |
	SBC #$0020				;$B5C573   |
	STA $A4					;$B5C576   |
	JSR CODE_B5C94D				;$B5C578   |
	CMP #$0000				;$B5C57B   |
	BMI CODE_B5C5DB				;$B5C57E   |
CODE_B5C580:					;	   |
	TAY					;$B5C580   |
	ORA $A4					;$B5C581   |
CODE_B5C583:					;	   |
	PHA					;$B5C583   |
	LDA $AC					;$B5C584   |
	AND #$7FFF				;$B5C586   |
	CMP #$4004				;$B5C589   |
	BEQ CODE_B5C598				;$B5C58C   |
	CMP #$4005				;$B5C58E   |
	BEQ CODE_B5C598				;$B5C591   |
	CMP #$4001				;$B5C593   |
	BNE CODE_B5C59D				;$B5C596   |
CODE_B5C598:					;	   |
	LDA #$2000				;$B5C598   |
	TSB $AC					;$B5C59B   |
CODE_B5C59D:					;	   |
	LDA $AC					;$B5C59D   |
	STA $32					;$B5C59F   |
	AND #$003F				;$B5C5A1   |
	TRB $AC					;$B5C5A4   |
	ASL A					;$B5C5A6   |
	TAX					;$B5C5A7   |
	LDA DATA_B5C9B5,x			;$B5C5A8   |
	AND #$801F				;$B5C5AB   |
	BPL CODE_B5C5B8				;$B5C5AE   |
	CPY #$000F				;$B5C5B0   |
	BEQ CODE_B5C5BA				;$B5C5B3   |
	AND #$001F				;$B5C5B5   |
CODE_B5C5B8:					;	   |
	TSB $AC					;$B5C5B8   |
CODE_B5C5BA:					;	   |
	LDA $AE					;$B5C5BA   |
	AND #$7FFF				;$B5C5BC   |
	CMP #$4004				;$B5C5BF   |
	BEQ CODE_B5C5CE				;$B5C5C2   |
	CMP #$4005				;$B5C5C4   |
	BEQ CODE_B5C5CE				;$B5C5C7   |
	CMP #$4001				;$B5C5C9   |
	BNE CODE_B5C5D3				;$B5C5CC   |
CODE_B5C5CE:					;	   |
	LDA #$2000				;$B5C5CE   |
	TSB $AE					;$B5C5D1   |
CODE_B5C5D3:					;	   |
	PLA					;$B5C5D3   |
	LDX $62					;$B5C5D4   |
	CLC					;$B5C5D6   |
	ADC #$6200				;$B5C5D7   |
	RTL					;$B5C5DA  /

CODE_B5C5DB:
	LDA #$FFC0				;$B5C5DB  \
	STZ $AC					;$B5C5DE   |
	LDX $62					;$B5C5E0   |
	RTL					;$B5C5E2  /

CODE_B5C5E3:
	TYA					;$B5C5E3  \
	SEC					;$B5C5E4   |
	SBC #$0020				;$B5C5E5   |
	TAY					;$B5C5E8   |
	LDA $AC					;$B5C5E9   |
	STA $32					;$B5C5EB   |
	JSR CODE_B5C94D				;$B5C5ED   |
	CMP #$0000				;$B5C5F0   |
	BMI CODE_B5C5FE				;$B5C5F3   |
	TAY					;$B5C5F5   |
	ORA #$0020				;$B5C5F6   |
	CLC					;$B5C5F9   |
	ADC $A4					;$B5C5FA   |
	BRA CODE_B5C583				;$B5C5FC  /

CODE_B5C5FE:
	LDA $32					;$B5C5FE  \
	STA $AC					;$B5C600   |
	LDA #$001F				;$B5C602   |
	TAY					;$B5C605   |
	ORA $A4					;$B5C606   |
	JMP CODE_B5C583				;$B5C608  /

CODE_B5C60B:
	LDA $32					;$B5C60B  \
	AND #$001F				;$B5C60D   |
	STA $A6					;$B5C610   |
	STZ $AC					;$B5C612   |
	LDA $34					;$B5C614   |
	SEC					;$B5C616   |
	SBC #$0100				;$B5C617   |
	EOR #$FFFF				;$B5C61A   |
	INC A					;$B5C61D   |
	AND #$FFE0				;$B5C61E   |
	STA $A4					;$B5C621   |
	LDA $32					;$B5C623   |
	AND #$FFE0				;$B5C625   |
	LSR A					;$B5C628   |
	LSR A					;$B5C629   |
	LSR A					;$B5C62A   |
	LSR A					;$B5C62B   |
	STA $32					;$B5C62C   |
	LDA $A4					;$B5C62E   |
	EOR #$FFE0				;$B5C630   |
	STA $36					;$B5C633   |
	ASL A					;$B5C635   |
	ASL A					;$B5C636   |
	CLC					;$B5C637   |
	ADC $36					;$B5C638   |
	ADC $32					;$B5C63A   |
	TAY					;$B5C63C   |
	JSR CODE_B5C94D				;$B5C63D   |
	PHA					;$B5C640   |
	LDA $AC					;$B5C641   |
	STA $AE					;$B5C643   |
	PLA					;$B5C645   |
	BMI CODE_B5C655				;$B5C646   |
	CMP #$001F				;$B5C648   |
	BNE CODE_B5C650				;$B5C64B   |
	JMP CODE_B5C6E4				;$B5C64D  /

CODE_B5C650:
	TAY					;$B5C650  \
	ORA $A4					;$B5C651   |
	BRA CODE_B5C684				;$B5C653  /

CODE_B5C655:
	TYA					;$B5C655  \
	CLC					;$B5C656   |
	ADC #$00A0				;$B5C657   |
	TAY					;$B5C65A   |
	LDA $A4					;$B5C65B   |
	SEC					;$B5C65D   |
	SBC #$0020				;$B5C65E   |
	STA $A4					;$B5C661   |
	JSR CODE_B5C94D				;$B5C663   |
	CMP #$0000				;$B5C666   |
	BPL CODE_B5C681				;$B5C669   |
	TYA					;$B5C66B   |
	CLC					;$B5C66C   |
	ADC #$00A0				;$B5C66D   |
	TAY					;$B5C670   |
	LDA $A4					;$B5C671   |
	SEC					;$B5C673   |
	SBC #$0020				;$B5C674   |
	STA $A4					;$B5C677   |
	JSR CODE_B5C94D				;$B5C679   |
	CMP #$0000				;$B5C67C   |
	BMI CODE_B5C6DC				;$B5C67F   |
CODE_B5C681:					;	   |
	TAY					;$B5C681   |
	ORA $A4					;$B5C682   |
CODE_B5C684:					;	   |
	PHA					;$B5C684   |
	LDA $AC					;$B5C685   |
	AND #$7FFF				;$B5C687   |
	CMP #$4004				;$B5C68A   |
	BEQ CODE_B5C699				;$B5C68D   |
	CMP #$4005				;$B5C68F   |
	BEQ CODE_B5C699				;$B5C692   |
	CMP #$4001				;$B5C694   |
	BNE CODE_B5C69E				;$B5C697   |
CODE_B5C699:					;	   |
	LDA #$2000				;$B5C699   |
	TSB $AC					;$B5C69C   |
CODE_B5C69E:					;	   |
	LDA $AC					;$B5C69E   |
	STA $32					;$B5C6A0   |
	AND #$003F				;$B5C6A2   |
	TRB $AC					;$B5C6A5   |
	ASL A					;$B5C6A7   |
	TAX					;$B5C6A8   |
	LDA DATA_B5C9B5,x			;$B5C6A9   |
	AND #$801F				;$B5C6AC   |
	BPL CODE_B5C6B9				;$B5C6AF   |
	CPY #$000F				;$B5C6B1   |
	BEQ CODE_B5C6BB				;$B5C6B4   |
	AND #$001F				;$B5C6B6   |
CODE_B5C6B9:					;	   |
	TSB $AC					;$B5C6B9   |
CODE_B5C6BB:					;	   |
	LDA $AE					;$B5C6BB   |
	AND #$7FFF				;$B5C6BD   |
	CMP #$4004				;$B5C6C0   |
	BEQ CODE_B5C6CF				;$B5C6C3   |
	CMP #$4005				;$B5C6C5   |
	BEQ CODE_B5C6CF				;$B5C6C8   |
	CMP #$4001				;$B5C6CA   |
	BNE CODE_B5C6D4				;$B5C6CD   |
CODE_B5C6CF:					;	   |
	LDA #$2000				;$B5C6CF   |
	TSB $AE					;$B5C6D2   |
CODE_B5C6D4:					;	   |
	PLA					;$B5C6D4   |
	LDX $62					;$B5C6D5   |
	CLC					;$B5C6D7   |
	ADC #$6200				;$B5C6D8   |
	RTL					;$B5C6DB  /

CODE_B5C6DC:
	LDA #$FFC0				;$B5C6DC  \
	STZ $AC					;$B5C6DF   |
	LDX $62					;$B5C6E1   |
	RTL					;$B5C6E3  /

CODE_B5C6E4:
	TYA					;$B5C6E4  \
	SEC					;$B5C6E5   |
	SBC #$00A0				;$B5C6E6   |
	TAY					;$B5C6E9   |
	LDA $AC					;$B5C6EA   |
	STA $32					;$B5C6EC   |
	JSR CODE_B5C94D				;$B5C6EE   |
	CMP #$0000				;$B5C6F1   |
	BMI CODE_B5C6FF				;$B5C6F4   |
	TAY					;$B5C6F6   |
	ORA #$0020				;$B5C6F7   |
	CLC					;$B5C6FA   |
	ADC $A4					;$B5C6FB   |
	BRA CODE_B5C684				;$B5C6FD  /

CODE_B5C6FF:
	LDA $32					;$B5C6FF  \
	STA $AC					;$B5C701   |
	LDA #$001F				;$B5C703   |
	TAY					;$B5C706   |
	ORA $A4					;$B5C707   |
	JMP CODE_B5C684				;$B5C709  /

CODE_B5C70C:
	LDA $32					;$B5C70C  \
	AND #$001F				;$B5C70E   |
	STA $A6					;$B5C711   |
	STZ $AC					;$B5C713   |
	LDA $34					;$B5C715   |
	SEC					;$B5C717   |
	SBC #$0100				;$B5C718   |
	EOR #$FFFF				;$B5C71B   |
	INC A					;$B5C71E   |
	AND #$FFE0				;$B5C71F   |
	STA $A4					;$B5C722   |
	LDA $32					;$B5C724   |
	AND #$FFE0				;$B5C726   |
	LSR A					;$B5C729   |
	LSR A					;$B5C72A   |
	LSR A					;$B5C72B   |
	LSR A					;$B5C72C   |
	STA $32					;$B5C72D   |
	LDA $A4					;$B5C72F   |
	EOR #$FFE0				;$B5C731   |
	ASL A					;$B5C734   |
	STA $36					;$B5C735   |
	ASL A					;$B5C737   |
	CLC					;$B5C738   |
	ADC $36					;$B5C739   |
	ADC $32					;$B5C73B   |
	TAY					;$B5C73D   |
	JSR CODE_B5C94D				;$B5C73E   |
	PHA					;$B5C741   |
	LDA $AC					;$B5C742   |
	STA $AE					;$B5C744   |
	PLA					;$B5C746   |
	BMI CODE_B5C756				;$B5C747   |
	CMP #$001F				;$B5C749   |
	BNE CODE_B5C751				;$B5C74C   |
	JMP CODE_B5C7E5				;$B5C74E  /

CODE_B5C751:
	TAY					;$B5C751  \
	ORA $A4					;$B5C752   |
	BRA CODE_B5C785				;$B5C754  /

CODE_B5C756:
	TYA					;$B5C756  \
	CLC					;$B5C757   |
	ADC #$00C0				;$B5C758   |
	TAY					;$B5C75B   |
	LDA $A4					;$B5C75C   |
	SEC					;$B5C75E   |
	SBC #$0020				;$B5C75F   |
	STA $A4					;$B5C762   |
	JSR CODE_B5C94D				;$B5C764   |
	CMP #$0000				;$B5C767   |
	BPL CODE_B5C782				;$B5C76A   |
	TYA					;$B5C76C   |
	CLC					;$B5C76D   |
	ADC #$00C0				;$B5C76E   |
	TAY					;$B5C771   |
	LDA $A4					;$B5C772   |
	SEC					;$B5C774   |
	SBC #$0020				;$B5C775   |
	STA $A4					;$B5C778   |
	JSR CODE_B5C94D				;$B5C77A   |
	CMP #$0000				;$B5C77D   |
	BMI CODE_B5C7DD				;$B5C780   |
CODE_B5C782:					;	   |
	TAY					;$B5C782   |
	ORA $A4					;$B5C783   |
CODE_B5C785:					;	   |
	PHA					;$B5C785   |
	LDA $AC					;$B5C786   |
	AND #$7FFF				;$B5C788   |
	CMP #$4004				;$B5C78B   |
	BEQ CODE_B5C79A				;$B5C78E   |
	CMP #$4005				;$B5C790   |
	BEQ CODE_B5C79A				;$B5C793   |
	CMP #$4001				;$B5C795   |
	BNE CODE_B5C79F				;$B5C798   |
CODE_B5C79A:					;	   |
	LDA #$2000				;$B5C79A   |
	TSB $AC					;$B5C79D   |
CODE_B5C79F:					;	   |
	LDA $AC					;$B5C79F   |
	STA $32					;$B5C7A1   |
	AND #$003F				;$B5C7A3   |
	TRB $AC					;$B5C7A6   |
	ASL A					;$B5C7A8   |
	TAX					;$B5C7A9   |
	LDA DATA_B5C9B5,x			;$B5C7AA   |
	AND #$801F				;$B5C7AD   |
	BPL CODE_B5C7BA				;$B5C7B0   |
	CPY #$000F				;$B5C7B2   |
	BEQ CODE_B5C7BC				;$B5C7B5   |
	AND #$001F				;$B5C7B7   |
CODE_B5C7BA:					;	   |
	TSB $AC					;$B5C7BA   |
CODE_B5C7BC:					;	   |
	LDA $AE					;$B5C7BC   |
	AND #$7FFF				;$B5C7BE   |
	CMP #$4004				;$B5C7C1   |
	BEQ CODE_B5C7D0				;$B5C7C4   |
	CMP #$4005				;$B5C7C6   |
	BEQ CODE_B5C7D0				;$B5C7C9   |
	CMP #$4001				;$B5C7CB   |
	BNE CODE_B5C7D5				;$B5C7CE   |
CODE_B5C7D0:					;	   |
	LDA #$2000				;$B5C7D0   |
	TSB $AE					;$B5C7D3   |
CODE_B5C7D5:					;	   |
	PLA					;$B5C7D5   |
	LDX $62					;$B5C7D6   |
	CLC					;$B5C7D8   |
	ADC #$6200				;$B5C7D9   |
	RTL					;$B5C7DC  /

CODE_B5C7DD:
	LDA #$FFC0				;$B5C7DD  \
	STZ $AC					;$B5C7E0   |
	LDX $62					;$B5C7E2   |
	RTL					;$B5C7E4  /

CODE_B5C7E5:
	TYA					;$B5C7E5  \
	SEC					;$B5C7E6   |
	SBC #$00C0				;$B5C7E7   |
	TAY					;$B5C7EA   |
	LDA $AC					;$B5C7EB   |
	STA $32					;$B5C7ED   |
	JSR CODE_B5C94D				;$B5C7EF   |
	CMP #$0000				;$B5C7F2   |
	BMI CODE_B5C800				;$B5C7F5   |
	TAY					;$B5C7F7   |
	ORA #$0020				;$B5C7F8   |
	CLC					;$B5C7FB   |
	ADC $A4					;$B5C7FC   |
	BRA CODE_B5C785				;$B5C7FE  /

CODE_B5C800:
	LDA $32					;$B5C800  \
	STA $AC					;$B5C802   |
	LDA #$001F				;$B5C804   |
	TAY					;$B5C807   |
	ORA $A4					;$B5C808   |
	JMP CODE_B5C785				;$B5C80A  /

CODE_B5C80D:
	LDA current_sprite			;$B5C80D  \
	LDA #$0E40				;$B5C80F   |
	CMP current_sprite			;$B5C812   |
	BCC CODE_B5C82C				;$B5C814   |
	JSL CODE_B5C82C				;$B5C816   |
	STA $32					;$B5C81A   |
	LDA #$0100				;$B5C81C   |
	TRB $AC					;$B5C81F   |
	BEQ CODE_B5C829				;$B5C821   |
	STZ $AC					;$B5C823   |
	LDA #$FFC0				;$B5C825   |
	RTL					;$B5C828  /

CODE_B5C829:
	LDA $32					;$B5C829  \
	RTL					;$B5C82B  /

CODE_B5C82C:
	LDA $32					;$B5C82C  \
	AND #$001F				;$B5C82E   |
	STA $A6					;$B5C831   |
	STZ $AC					;$B5C833   |
	LDA $34					;$B5C835   |
	SEC					;$B5C837   |
	SBC #$0100				;$B5C838   |
	BPL CODE_B5C840				;$B5C83B   |
	LDA #$0000				;$B5C83D   |
CODE_B5C840:					;	   |
	CMP #$01FF				;$B5C840   |
	BCC CODE_B5C848				;$B5C843   |
	LDA #$01FF				;$B5C845   |
CODE_B5C848:					;	   |
	EOR #$FFFF				;$B5C848   |
	INC A					;$B5C84B   |
	AND #$01E0				;$B5C84C   |
	STA $A4					;$B5C84F   |
	LDA $32					;$B5C851   |
	AND #$FFE0				;$B5C853   |
	STA $32					;$B5C856   |
	LDA $A4					;$B5C858   |
	EOR #$01E0				;$B5C85A   |
	LSR A					;$B5C85D   |
	LSR A					;$B5C85E   |
	LSR A					;$B5C85F   |
	LSR A					;$B5C860   |
	CLC					;$B5C861   |
	ADC $32					;$B5C862   |
	TAY					;$B5C864   |
	JSR CODE_B5C94D				;$B5C865   |
	PHA					;$B5C868   |
	LDA $AC					;$B5C869   |
	STA $AE					;$B5C86B   |
	PLA					;$B5C86D   |
	BMI CODE_B5C87D				;$B5C86E   |
	CMP #$001F				;$B5C870   |
	BNE CODE_B5C878				;$B5C873   |
	JMP CODE_B5C91B				;$B5C875  /

CODE_B5C878:
	TAY					;$B5C878  \
	ORA $A4					;$B5C879   |
	BRA CODE_B5C8B3				;$B5C87B  /

CODE_B5C87D:
	INY					;$B5C87D  \
	INY					;$B5C87E   |
	TYA					;$B5C87F   |
	BIT #$001E				;$B5C880   |
	BNE CODE_B5C888				;$B5C883   |
	JMP CODE_B5C913				;$B5C885  /

CODE_B5C888:
	LDA $A4					;$B5C888  \
	SEC					;$B5C88A   |
	SBC #$0020				;$B5C88B   |
	STA $A4					;$B5C88E   |
	JSR CODE_B5C94D				;$B5C890   |
	CMP #$0000				;$B5C893   |
	BPL CODE_B5C8B0				;$B5C896   |
	INY					;$B5C898   |
	INY					;$B5C899   |
	TYA					;$B5C89A   |
	BIT #$001E				;$B5C89B   |
	BEQ CODE_B5C913				;$B5C89E   |
	LDA $A4					;$B5C8A0   |
	SEC					;$B5C8A2   |
	SBC #$0020				;$B5C8A3   |
	STA $A4					;$B5C8A6   |
	JSR CODE_B5C94D				;$B5C8A8   |
	CMP #$0000				;$B5C8AB   |
	BMI CODE_B5C913				;$B5C8AE   |
CODE_B5C8B0:					;	   |
	TAY					;$B5C8B0   |
	ORA $A4					;$B5C8B1   |
CODE_B5C8B3:					;	   |
	PHA					;$B5C8B3   |
	LDA $AC					;$B5C8B4   |
	AND #$7FFF				;$B5C8B6   |
	CMP #$4004				;$B5C8B9   |
	BEQ CODE_B5C8C8				;$B5C8BC   |
	CMP #$4005				;$B5C8BE   |
	BEQ CODE_B5C8C8				;$B5C8C1   |
	CMP #$4001				;$B5C8C3   |
	BNE CODE_B5C8CD				;$B5C8C6   |
CODE_B5C8C8:					;	   |
	LDA #$2000				;$B5C8C8   |
	TSB $AC					;$B5C8CB   |
CODE_B5C8CD:					;	   |
	LDA $AC					;$B5C8CD   |
	STA $32					;$B5C8CF   |
	AND #$003F				;$B5C8D1   |
	TRB $AC					;$B5C8D4   |
	ASL A					;$B5C8D6   |
	TAX					;$B5C8D7   |
	LDA DATA_B5C9B5,x			;$B5C8D8   |
	AND #$801F				;$B5C8DB   |
	BPL CODE_B5C8E8				;$B5C8DE   |
	CPY #$000F				;$B5C8E0   |
	BEQ CODE_B5C8EA				;$B5C8E3   |
	AND #$001F				;$B5C8E5   |
CODE_B5C8E8:					;	   |
	TSB $AC					;$B5C8E8   |
CODE_B5C8EA:					;	   |
	LDA $AE					;$B5C8EA   |
	AND #$7FFF				;$B5C8EC   |
	CMP #$4004				;$B5C8EF   |
	BEQ CODE_B5C8FE				;$B5C8F2   |
	CMP #$4005				;$B5C8F4   |
	BEQ CODE_B5C8FE				;$B5C8F7   |
	CMP #$4001				;$B5C8F9   |
	BNE CODE_B5C903				;$B5C8FC   |
CODE_B5C8FE:					;	   |
	LDA #$2000				;$B5C8FE   |
	TSB $AE					;$B5C901   |
CODE_B5C903:					;	   |
	PLA					;$B5C903   |
	LDX $62					;$B5C904   |
	CMP #$01FF				;$B5C906   |
	BNE CODE_B5C90E				;$B5C909   |
	LDA #$0800				;$B5C90B   |
CODE_B5C90E:					;	   |
	CLC					;$B5C90E   |
	ADC #$6000				;$B5C90F   |
	RTL					;$B5C912  /

CODE_B5C913:
	LDA #$FFC0				;$B5C913  \
	STZ $AC					;$B5C916   |
	LDX $62					;$B5C918   |
	RTL					;$B5C91A  /

CODE_B5C91B:
	TYA					;$B5C91B  \
	AND #$001E				;$B5C91C   |
	BEQ CODE_B5C939				;$B5C91F   |
	DEY					;$B5C921   |
	DEY					;$B5C922   |
	LDA $AC					;$B5C923   |
	STA $32					;$B5C925   |
	JSR CODE_B5C94D				;$B5C927   |
	CMP #$0000				;$B5C92A   |
	BMI CODE_B5C941				;$B5C92D   |
	TAY					;$B5C92F   |
	ORA #$0020				;$B5C930   |
	CLC					;$B5C933   |
	ADC $A4					;$B5C934   |
CODE_B5C936:					;	   |
	JMP CODE_B5C8B3				;$B5C936  /

CODE_B5C939:
	LDY #$001F				;$B5C939  \
	LDA #$01FF				;$B5C93C   |
	BRA CODE_B5C936				;$B5C93F  /

CODE_B5C941:
	LDA $32					;$B5C941  \
	STA $AC					;$B5C943   |
	LDA #$001F				;$B5C945   |
	TAY					;$B5C948   |
	ORA $A4					;$B5C949   |
	BRA CODE_B5C936				;$B5C94B  /

CODE_B5C94D:
	LDA $A6					;$B5C94D  \
	STA $A2					;$B5C94F   |
	LDA [$98],y				;$B5C951   |
	TYX					;$B5C953   |
	STA $A8					;$B5C954   |
	BEQ CODE_B5C9B1				;$B5C956   |
	BIT #$4000				;$B5C958   |
	BEQ CODE_B5C966				;$B5C95B   |
	LDA $A6					;$B5C95D   |
	EOR #$001F				;$B5C95F   |
	STA $A2					;$B5C962   |
	LDA $A8					;$B5C964   |
CODE_B5C966:					;	   |
	AND #$3FFF				;$B5C966   |
	CMP $A0					;$B5C969   |
	BCS CODE_B5C9B1				;$B5C96B   |
	ASL A					;$B5C96D   |
	ASL A					;$B5C96E   |
	TAY					;$B5C96F   |
	LDA $A2					;$B5C970   |
	AND #$0010				;$B5C972   |
	BEQ CODE_B5C979				;$B5C975   |
	INY					;$B5C977   |
	INY					;$B5C978   |
CODE_B5C979:					;	   |
	LDA [$9C],y				;$B5C979   |
	BIT #$8000				;$B5C97B   |
	BEQ CODE_B5C989				;$B5C97E   |
	LDA $A2					;$B5C980   |
	EOR #$000F				;$B5C982   |
	STA $A2					;$B5C985   |
	LDA [$9C],y				;$B5C987   |
CODE_B5C989:					;	   |
	TXY					;$B5C989   |
	BIT $A8					;$B5C98A   |
	BVC CODE_B5C991				;$B5C98C   |
	EOR #$8000				;$B5C98E   |
CODE_B5C991:					;	   |
	STA $AC					;$B5C991   |
	AND #$00FF				;$B5C993   |
	BEQ CODE_B5C9B1				;$B5C996   |
	ASL A					;$B5C998   |
	TAX					;$B5C999   |
	LDA.l DATA_B5CA58,x			;$B5C99A   |
	STA $AA					;$B5C99E   |
	LDA $A2					;$B5C9A0   |
	AND #$000F				;$B5C9A2   |
	JSR CODE_B5CA55				;$B5C9A5   |
	CMP #$001F				;$B5C9A8   |
	BMI CODE_B5C9B0				;$B5C9AB   |
	LDA #$001F				;$B5C9AD   |
CODE_B5C9B0:					;	   |
	RTS					;$B5C9B0  /

CODE_B5C9B1:
	LDA #$FFFF				;$B5C9B1  \
	RTS					;$B5C9B4  /

DATA_B5C9B5:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $03, $00, $03, $00
	db $03, $00, $03, $00, $03, $00, $03, $00
	db $03, $00, $03, $00, $03, $00, $03, $00
	db $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $05, $00
	db $05, $00, $05, $00, $05, $00, $05, $00
	db $05, $00, $05, $00, $06, $00, $06, $00
	db $06, $00, $06, $00, $06, $00, $06, $80
	db $06, $80, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $05, $80, $05, $80, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00

CODE_B5CA55:
	JMP ($00AA)				;$B5CA55  /

DATA_B5CA58:
	dw CODE_B5CC0C
	dw CODE_B5CC10
	dw CODE_B5CC14
	dw CODE_B5CC18
	dw CODE_B5CC1C
	dw CODE_B5CC20
	dw CODE_B5CC24
	dw CODE_B5CC28
	dw CODE_B5CC2C
	dw CODE_B5CD89
	dw CODE_B5CD82
	dw CODE_B5CD7B
	dw CODE_B5CD74
	dw CODE_B5CD6D
	dw CODE_B5CD66
	dw CODE_B5CD5F
	dw CODE_B5CD58
	dw CODE_B5CD8C
	dw CODE_B5CD92
	dw CODE_B5CD94
	dw CODE_B5CD9A
	dw CODE_B5CDA0
	dw CODE_B5CDA6
	dw CODE_B5CDAC
	dw CODE_B5CDB2
	dw CODE_B5CDB8
	dw CODE_B5CD4B
	dw CODE_B5CD3E
	dw CODE_B5CD35
	dw CODE_B5CD28
	dw CODE_B5CD1B
	dw CODE_B5CD0E
	dw CODE_B5CD01
	dw CODE_B5CCF4
	dw CODE_B5CCE7
	dw CODE_B5CCDA
	dw CODE_B5CCA7
	dw CODE_B5CCAC
	dw CODE_B5CCB1
	dw CODE_B5CCB6
	dw CODE_B5CCB7
	dw CODE_B5CCBC
	dw CODE_B5CCC1
	dw CODE_B5CCC6
	dw CODE_B5CCCB
	dw CODE_B5CCD0
	dw CODE_B5CCD5
	dw CODE_B5CCA1
	dw CODE_B5CC9B
	dw CODE_B5CC95
	dw CODE_B5CC93
	dw CODE_B5CC8D
	dw CODE_B5CC87
	dw CODE_B5CC81
	dw CODE_B5CC48
	dw CODE_B5CC41
	dw CODE_B5CC3A
	dw CODE_B5CC37
	dw CODE_B5CC30
	dw CODE_B5CC4F
	dw CODE_B5CC5E
	dw CODE_B5CC10
	dw CODE_B5CC20
	dw CODE_B5CBCC
	dw CODE_B5CBDA
	dw CODE_B5CBE3
	dw CODE_B5CBF5
	dw CODE_B5CB75
	dw CODE_B5CB89
	dw CODE_B5CB9D
	dw CODE_B5CBBA
	dw CODE_B5CB63
	dw CODE_B5CB6C
	dw CODE_B5CC6D
	dw CODE_B5CC77
	dw CODE_B5CAF8
	dw CODE_B5CB0F
	dw CODE_B5CB2A
	dw CODE_B5CB3D
	dw CODE_B5CB56


CODE_B5CAF8:
	STA $36					;$B5CAF8  \
	LDA $34					;$B5CAFA   |
	DEC A					;$B5CAFC   |
	AND #$001F				;$B5CAFD   |
	EOR #$001F				;$B5CB00   |
	CMP $36					;$B5CB03   |
	BCS CODE_B5CB0B				;$B5CB05   |
	LDA #$FFFF				;$B5CB07   |
	RTS					;$B5CB0A  /

CODE_B5CB0B:
	LDA #$001F				;$B5CB0B  \
	RTS					;$B5CB0E  /

CODE_B5CB0F:
	CLC					;$B5CB0F  \
	ADC #$0010				;$B5CB10   |
	STA $36					;$B5CB13   |
	LDA $34					;$B5CB15   |
	DEC A					;$B5CB17   |
	AND #$001F				;$B5CB18   |
	EOR #$001F				;$B5CB1B   |
	CMP $36					;$B5CB1E   |
	BCS CODE_B5CB26				;$B5CB20   |
	LDA #$FFFF				;$B5CB22   |
	RTS					;$B5CB25  /

CODE_B5CB26:
	LDA #$001F				;$B5CB26  \
	RTS					;$B5CB29  /

CODE_B5CB2A:
	LDA $34					;$B5CB2A  \
	DEC A					;$B5CB2C   |
	AND #$001F				;$B5CB2D   |
	CMP #$000F				;$B5CB30   |
	BCC CODE_B5CB39				;$B5CB33   |
	LDA #$FFFF				;$B5CB35   |
	RTS					;$B5CB38  /

CODE_B5CB39:
	LDA #$001F				;$B5CB39  \
	RTS					;$B5CB3C  /

CODE_B5CB3D:
	ASL A					;$B5CB3D  \
	ASL A					;$B5CB3E   |
	STA $36					;$B5CB3F   |
	LDA $34					;$B5CB41   |
	DEC A					;$B5CB43   |
	AND #$001F				;$B5CB44   |
	EOR #$001F				;$B5CB47   |
	CMP $36					;$B5CB4A   |
	BCS CODE_B5CB52				;$B5CB4C   |
	LDA #$FFFF				;$B5CB4E   |
	RTS					;$B5CB51  /

CODE_B5CB52:
	LDA #$001F				;$B5CB52  \
	RTS					;$B5CB55  /

CODE_B5CB56:
	CMP #$0008				;$B5CB56  \
	BCC CODE_B5CB5F				;$B5CB59   |
	LDA #$FFFF				;$B5CB5B   |
	RTS					;$B5CB5E  /

CODE_B5CB5F:
	LDA #$001F				;$B5CB5F  \
	RTS					;$B5CB62  /

CODE_B5CB63:
	LDA #$0200				;$B5CB63  \
	TSB $AC					;$B5CB66   |
	LDA #$001F				;$B5CB68   |
	RTS					;$B5CB6B  /

CODE_B5CB6C:
	LDA #$0200				;$B5CB6C  \
	TSB $AC					;$B5CB6F   |
	LDA #$000F				;$B5CB71   |
	RTS					;$B5CB74  /

CODE_B5CB75:
	CMP #$0004				;$B5CB75  \
	BCS CODE_B5CB85				;$B5CB78   |
	LDA $34					;$B5CB7A   |
	DEC A					;$B5CB7C   |
	AND #$001F				;$B5CB7D   |
	CMP #$0018				;$B5CB80   |
	BCC CODE_B5CBB1				;$B5CB83   |
CODE_B5CB85:					;	   |
	LDA #$FFFF				;$B5CB85   |
	RTS					;$B5CB88  /

CODE_B5CB89:
	CMP #$0004				;$B5CB89  \
	BCS CODE_B5CB99				;$B5CB8C   |
	LDA $34					;$B5CB8E   |
	DEC A					;$B5CB90   |
	AND #$001F				;$B5CB91   |
	CMP #$0010				;$B5CB94   |
	BCC CODE_B5CBB1				;$B5CB97   |
CODE_B5CB99:					;	   |
	LDA #$FFFF				;$B5CB99   |
	RTS					;$B5CB9C  /

CODE_B5CB9D:
	CMP #$0004				;$B5CB9D  \
	BCS CODE_B5CBAD				;$B5CBA0   |
	LDA $34					;$B5CBA2   |
	DEC A					;$B5CBA4   |
	AND #$001F				;$B5CBA5   |
	CMP #$0008				;$B5CBA8   |
	BCC CODE_B5CBB1				;$B5CBAB   |
CODE_B5CBAD:					;	   |
	LDA #$FFFF				;$B5CBAD   |
	RTS					;$B5CBB0  /

CODE_B5CBB1:
	LDA #$1000				;$B5CBB1  \
	TSB $AC					;$B5CBB4   |
	LDA #$001F				;$B5CBB6   |
	RTS					;$B5CBB9  /

CODE_B5CBBA:
	CMP #$0004				;$B5CBBA  \
	BCS CODE_B5CBC8				;$B5CBBD   |
	LDA #$1000				;$B5CBBF   |
	TSB $AC					;$B5CBC2   |
	LDA #$001F				;$B5CBC4   |
	RTS					;$B5CBC7  /

CODE_B5CBC8:
	LDA #$0013				;$B5CBC8  \
	RTS					;$B5CBCB  /

CODE_B5CBCC:
	CMP #$0004				;$B5CBCC  \
	BCS CODE_B5CBD6				;$B5CBCF   |
	LDA #$1400				;$B5CBD1   |
	TSB $AC					;$B5CBD4   |
CODE_B5CBD6:					;	   |
	LDA #$0013				;$B5CBD6   |
	RTS					;$B5CBD9  /

CODE_B5CBDA:
	LDA #$0800				;$B5CBDA  \
	TSB $AC					;$B5CBDD   |
	LDA #$000F				;$B5CBDF   |
	RTS					;$B5CBE2  /

CODE_B5CBE3:
	CMP #$0004				;$B5CBE3  \
	BCS CODE_B5CBF1				;$B5CBE6   |
	LDA #$1000				;$B5CBE8   |
	TSB $AC					;$B5CBEB   |
	LDA #$001F				;$B5CBED   |
	RTS					;$B5CBF0  /

CODE_B5CBF1:
	LDA #$FFFF				;$B5CBF1  \
	RTS					;$B5CBF4  /

CODE_B5CBF5:
	CMP #$0004				;$B5CBF5  \
	BCS CODE_B5CC03				;$B5CBF8   |
	LDA #$1000				;$B5CBFA   |
	TSB $AC					;$B5CBFD   |
	LDA #$001F				;$B5CBFF   |
	RTS					;$B5CC02  /

CODE_B5CC03:
	LDA #$0800				;$B5CC03  \
	TSB $AC					;$B5CC06   |
	LDA #$000F				;$B5CC08   |
	RTS					;$B5CC0B  /

CODE_B5CC0C:
	LDA #$FFFF				;$B5CC0C  \
	RTS					;$B5CC0F  /

CODE_B5CC10:
	LDA #$001F				;$B5CC10  \
	RTS					;$B5CC13  /

CODE_B5CC14:
	LDA #$001B				;$B5CC14  \
	RTS					;$B5CC17  /

CODE_B5CC18:
	LDA #$0017				;$B5CC18  \
	RTS					;$B5CC1B  /

CODE_B5CC1C:
	LDA #$0013				;$B5CC1C  \
	RTS					;$B5CC1F  /

CODE_B5CC20:
	LDA #$000F				;$B5CC20  \
	RTS					;$B5CC23  /

CODE_B5CC24:
	LDA #$000B				;$B5CC24  \
	RTS					;$B5CC27  /

CODE_B5CC28:
	LDA #$0007				;$B5CC28  \
	RTS					;$B5CC2B  /

CODE_B5CC2C:
	LDA #$0003				;$B5CC2C  \
	RTS					;$B5CC2F  /

CODE_B5CC30:
	ASL A					;$B5CC30  \
	ASL A					;$B5CC31   |
	CLC					;$B5CC32   |
	ADC #$0010				;$B5CC33   |
	RTS					;$B5CC36  /

CODE_B5CC37:
	ASL A					;$B5CC37  \
	ASL A					;$B5CC38   |
	RTS					;$B5CC39  /

CODE_B5CC3A:
	ASL A					;$B5CC3A  \
	ASL A					;$B5CC3B   |
	SEC					;$B5CC3C   |
	SBC #$0010				;$B5CC3D   |
	RTS					;$B5CC40  /

CODE_B5CC41:
	ASL A					;$B5CC41  \
	ASL A					;$B5CC42   |
	SEC					;$B5CC43   |
	SBC #$0020				;$B5CC44   |
	RTS					;$B5CC47  /

CODE_B5CC48:
	ASL A					;$B5CC48  \
	ASL A					;$B5CC49   |
	SEC					;$B5CC4A   |
	SBC #$0030				;$B5CC4B   |
	RTS					;$B5CC4E  /

CODE_B5CC4F:
	ASL A					;$B5CC4F  \
	ASL A					;$B5CC50   |
	SEC					;$B5CC51   |
	SBC #$0010				;$B5CC52   |
	CMP #$000F				;$B5CC55   |
	BMI CODE_B5CC5D				;$B5CC58   |
	LDA #$000F				;$B5CC5A   |
CODE_B5CC5D:					;	   |
	RTS					;$B5CC5D  /

CODE_B5CC5E:
	ASL A					;$B5CC5E  \
	ASL A					;$B5CC5F   |
	SEC					;$B5CC60   |
	SBC #$0010				;$B5CC61   |
	CMP #$000F				;$B5CC64   |
	BPL CODE_B5CC6C				;$B5CC67   |
	LDA #$000F				;$B5CC69   |
CODE_B5CC6C:					;	   |
	RTS					;$B5CC6C  /

CODE_B5CC6D:
	ASL A					;$B5CC6D  \
	CMP #$000F				;$B5CC6E   |
	BMI CODE_B5CC76				;$B5CC71   |
	LDA #$000F				;$B5CC73   |
CODE_B5CC76:					;	   |
	RTS					;$B5CC76  /

CODE_B5CC77:
	ASL A					;$B5CC77  \
	CMP #$000F				;$B5CC78   |
	BPL CODE_B5CC80				;$B5CC7B   |
	LDA #$000F				;$B5CC7D   |
CODE_B5CC80:					;	   |
	RTS					;$B5CC80  /

CODE_B5CC81:
	ASL A					;$B5CC81  \
	CLC					;$B5CC82   |
	ADC #$0018				;$B5CC83   |
	RTS					;$B5CC86  /

CODE_B5CC87:
	ASL A					;$B5CC87  \
	CLC					;$B5CC88   |
	ADC #$0010				;$B5CC89   |
	RTS					;$B5CC8C  /

CODE_B5CC8D:
	ASL A					;$B5CC8D  \
	CLC					;$B5CC8E   |
	ADC #$0008				;$B5CC8F   |
	RTS					;$B5CC92  /

CODE_B5CC93:
	ASL A					;$B5CC93  \
	RTS					;$B5CC94  /

CODE_B5CC95:
	ASL A					;$B5CC95  \
	SEC					;$B5CC96   |
	SBC #$0008				;$B5CC97   |
	RTS					;$B5CC9A  /

CODE_B5CC9B:
	ASL A					;$B5CC9B  \
	SEC					;$B5CC9C   |
	SBC #$0010				;$B5CC9D   |
	RTS					;$B5CCA0  /

CODE_B5CCA1:
	ASL A					;$B5CCA1  \
	SEC					;$B5CCA2   |
	SBC #$0018				;$B5CCA3   |
	RTS					;$B5CCA6  /

CODE_B5CCA7:
	SEC					;$B5CCA7  \
	SBC #$000C				;$B5CCA8   |
	RTS					;$B5CCAB  /

CODE_B5CCAC:
	SEC					;$B5CCAC  \
	SBC #$0008				;$B5CCAD   |
	RTS					;$B5CCB0  /

CODE_B5CCB1:
	SEC					;$B5CCB1  \
	SBC #$0004				;$B5CCB2   |
	RTS					;$B5CCB5  /

CODE_B5CCB6:
	RTS					;$B5CCB6  /

CODE_B5CCB7:
	CLC					;$B5CCB7  \
	ADC #$0004				;$B5CCB8   |
	RTS					;$B5CCBB  /

CODE_B5CCBC:
	CLC					;$B5CCBC  \
	ADC #$0008				;$B5CCBD   |
	RTS					;$B5CCC0  /

CODE_B5CCC1:
	CLC					;$B5CCC1  \
	ADC #$000C				;$B5CCC2   |
	RTS					;$B5CCC5  /

CODE_B5CCC6:
	CLC					;$B5CCC6  \
	ADC #$0010				;$B5CCC7   |
	RTS					;$B5CCCA  /

CODE_B5CCCB:
	CLC					;$B5CCCB  \
	ADC #$0014				;$B5CCCC   |
	RTS					;$B5CCCF  /

CODE_B5CCD0:
	CLC					;$B5CCD0  \
	ADC #$0018				;$B5CCD1   |
	RTS					;$B5CCD4  /

CODE_B5CCD5:
	CLC					;$B5CCD5  \
	ADC #$001C				;$B5CCD6   |
	RTS					;$B5CCD9  /

CODE_B5CCDA:
	TAX					;$B5CCDA  \
	LDA.l DATA_B5CDBE,x			;$B5CCDB   |
	AND #$00FF				;$B5CCDF   |
	CLC					;$B5CCE2   |
	ADC #$001C				;$B5CCE3   |
	RTS					;$B5CCE6  /

CODE_B5CCE7:
	TAX					;$B5CCE7  \
	LDA.l DATA_B5CDBE,x			;$B5CCE8   |
	AND #$00FF				;$B5CCEC   |
	CLC					;$B5CCEF   |
	ADC #$0018				;$B5CCF0   |
	RTS					;$B5CCF3  /

CODE_B5CCF4:
	TAX					;$B5CCF4  \
	LDA.l DATA_B5CDBE,x			;$B5CCF5   |
	AND #$00FF				;$B5CCF9   |
	CLC					;$B5CCFC   |
	ADC #$0014				;$B5CCFD   |
	RTS					;$B5CD00  /

CODE_B5CD01:
	TAX					;$B5CD01  \
	LDA.l DATA_B5CDBE,x			;$B5CD02   |
	AND #$00FF				;$B5CD06   |
	CLC					;$B5CD09   |
	ADC #$0010				;$B5CD0A   |
	RTS					;$B5CD0D  /

CODE_B5CD0E:
	TAX					;$B5CD0E  \
	LDA.l DATA_B5CDBE,x			;$B5CD0F   |
	AND #$00FF				;$B5CD13   |
	CLC					;$B5CD16   |
	ADC #$000C				;$B5CD17   |
	RTS					;$B5CD1A  /

CODE_B5CD1B:
	TAX					;$B5CD1B  \
	LDA.l DATA_B5CDBE,x			;$B5CD1C   |
	AND #$00FF				;$B5CD20   |
	CLC					;$B5CD23   |
	ADC #$0008				;$B5CD24   |
	RTS					;$B5CD27  /

CODE_B5CD28:
	TAX					;$B5CD28  \
	LDA.l DATA_B5CDBE,x			;$B5CD29   |
	AND #$00FF				;$B5CD2D   |
	CLC					;$B5CD30   |
	ADC #$0004				;$B5CD31   |
	RTS					;$B5CD34  /

CODE_B5CD35:
	TAX					;$B5CD35  \
	LDA.l DATA_B5CDBE,x			;$B5CD36   |
	AND #$00FF				;$B5CD3A   |
	RTS					;$B5CD3D  /

CODE_B5CD3E:
	TAX					;$B5CD3E  \
	LDA.l DATA_B5CDBE,x			;$B5CD3F   |
	AND #$00FF				;$B5CD43   |
	SEC					;$B5CD46   |
	SBC #$0004				;$B5CD47   |
	RTS					;$B5CD4A  /

CODE_B5CD4B:
	TAX					;$B5CD4B  \
	LDA.l DATA_B5CDBE,x			;$B5CD4C   |
	AND #$00FF				;$B5CD50   |
	SEC					;$B5CD53   |
	SBC #$0008				;$B5CD54   |
	RTS					;$B5CD57  /

CODE_B5CD58:
	LSR A					;$B5CD58  \
	LSR A					;$B5CD59   |
	CLC					;$B5CD5A   |
	ADC #$001C				;$B5CD5B   |
	RTS					;$B5CD5E  /

CODE_B5CD5F:
	LSR A					;$B5CD5F  \
	LSR A					;$B5CD60   |
	CLC					;$B5CD61   |
	ADC #$0018				;$B5CD62   |
	RTS					;$B5CD65  /

CODE_B5CD66:
	LSR A					;$B5CD66  \
	LSR A					;$B5CD67   |
	CLC					;$B5CD68   |
	ADC #$0014				;$B5CD69   |
	RTS					;$B5CD6C  /

CODE_B5CD6D:
	LSR A					;$B5CD6D  \
	LSR A					;$B5CD6E   |
	CLC					;$B5CD6F   |
	ADC #$0010				;$B5CD70   |
	RTS					;$B5CD73  /

CODE_B5CD74:
	LSR A					;$B5CD74  \
	LSR A					;$B5CD75   |
	CLC					;$B5CD76   |
	ADC #$000C				;$B5CD77   |
	RTS					;$B5CD7A  /

CODE_B5CD7B:
	LSR A					;$B5CD7B  \
	LSR A					;$B5CD7C   |
	CLC					;$B5CD7D   |
	ADC #$0008				;$B5CD7E   |
	RTS					;$B5CD81  /

CODE_B5CD82:
	LSR A					;$B5CD82  \
	LSR A					;$B5CD83   |
	CLC					;$B5CD84   |
	ADC #$0004				;$B5CD85   |
	RTS					;$B5CD88  /

CODE_B5CD89:
	LSR A					;$B5CD89  \
	LSR A					;$B5CD8A   |
	RTS					;$B5CD8B  /

CODE_B5CD8C:
	LSR A					;$B5CD8C  \
	SEC					;$B5CD8D   |
	SBC #$0004				;$B5CD8E   |
	RTS					;$B5CD91  /

CODE_B5CD92:
	LSR A					;$B5CD92  \
	RTS					;$B5CD93  /

CODE_B5CD94:
	LSR A					;$B5CD94  \
	CLC					;$B5CD95   |
	ADC #$0004				;$B5CD96   |
	RTS					;$B5CD99  /

CODE_B5CD9A:
	LSR A					;$B5CD9A  \
	CLC					;$B5CD9B   |
	ADC #$0008				;$B5CD9C   |
	RTS					;$B5CD9F  /

CODE_B5CDA0:
	LSR A					;$B5CDA0  \
	CLC					;$B5CDA1   |
	ADC #$000C				;$B5CDA2   |
	RTS					;$B5CDA5  /

CODE_B5CDA6:
	LSR A					;$B5CDA6  \
	CLC					;$B5CDA7   |
	ADC #$0010				;$B5CDA8   |
	RTS					;$B5CDAB  /

CODE_B5CDAC:
	LSR A					;$B5CDAC  \
	CLC					;$B5CDAD   |
	ADC #$0014				;$B5CDAE   |
	RTS					;$B5CDB1  /

CODE_B5CDB2:
	LSR A					;$B5CDB2  \
	CLC					;$B5CDB3   |
	ADC #$0018				;$B5CDB4   |
	RTS					;$B5CDB7  /

CODE_B5CDB8:
	LSR A					;$B5CDB8  \
	CLC					;$B5CDB9   |
	ADC #$001C				;$B5CDBA   |
	RTS					;$B5CDBD  /

DATA_B5CDBE:
	db $01, $02, $02, $03, $04, $04, $05, $06
	db $06, $07, $08, $08, $09, $0A, $0A, $0B
	db $0C, $0C, $0D, $0E, $0E, $0F, $10, $10
	db $11, $12, $12, $13, $14, $14, $15, $16

CODE_B5CDDE:
	LDX $0593				;$B5CDDE  \
	BEQ CODE_B5CDEE				;$B5CDE1   |
	JSR CODE_B5CDEF				;$B5CDE3   |
	LDX $0597				;$B5CDE6   |
	BEQ CODE_B5CDEE				;$B5CDE9   |
	JSR CODE_B5CDEF				;$B5CDEB   |
CODE_B5CDEE:					;	   |
	RTS					;$B5CDEE  /

CODE_B5CDEF:
	STX current_sprite			;$B5CDEF  \
	JSL CODE_B9D100				;$B5CDF1   |
	RTS					;$B5CDF5  /

	STX current_sprite			;$B5CDF6   |
	JSL CODE_B9D0C6				;$B5CDF8   |
	RTS					;$B5CDFC  /

CODE_B5CDFD:
	STA $0006B1				;$B5CDFD  \
	JSL disable_screen			;$B5CE01   |
	JSL CODE_8088D2				;$B5CE05   |
	JSL init_registers_wrapper		;$B5CE09   |
	JSL CODE_808E6A				;$B5CE0D   |
	PHK					;$B5CE11   |
	PLB					;$B5CE12   |
	LDA.l $0006B1				;$B5CE13   |
	ASL A					;$B5CE17   |
	TAX					;$B5CE18   |
	JMP (DATA_B5CE1C,x)			;$B5CE19  /

DATA_B5CE1C:
	dw CODE_B5CE3A
	dw CODE_B5CE49
	dw CODE_B5CE58
	dw CODE_B5CE67
	dw CODE_B5CE76
	dw CODE_B5CE85
	dw CODE_B5CE94
	dw CODE_B5CEA3
	dw CODE_B5CEB2
	dw CODE_B5CEC1
	dw CODE_B5CED0
	dw CODE_B5CED0
	dw CODE_B5CED0
	dw CODE_B5CED0
	dw CODE_B5CED0



CODE_B5CE3A:
	JSR CODE_B5CE40				;$B5CE3A  \
	JMP CODE_B5CF63				;$B5CE3D  /

CODE_B5CE40:
	JSR CODE_B5E0A1				;$B5CE40  /

DATA_B5CE43:
	db $05, $04 : dw DATA_FD0B10 : db $04, $04


CODE_B5CE49:
	JSR CODE_B5CE4F				;$B5CE49  \
	JMP CODE_B5CEF0				;$B5CE4C  /

CODE_B5CE4F:
	JSR CODE_B5E0A1				;$B5CE4F  /

DATA_B5CE52:
	db $0D, $09 : dw DATA_FD1870 : db $0B, $0B


CODE_B5CE58:
	JSR CODE_B5CE5E				;$B5CE58  \
	JMP CODE_B5CEF0				;$B5CE5B  /

CODE_B5CE5E:
	JSR CODE_B5E0A1				;$B5CE5E  /

DATA_B5CE61:
	db $0E, $09 : dw DATA_FD1970 : db $0B, $0B


CODE_B5CE67:
	JSR CODE_B5CE6D				;$B5CE67  \
	JMP CODE_B5CEF0				;$B5CE6A  /

CODE_B5CE6D:
	JSR CODE_B5E0A1				;$B5CE6D  /

DATA_B5CE70:
	db $0F, $0A : dw DATA_FD1A70 : db $0B, $0B


CODE_B5CE76:
	JSR CODE_B5CE7C				;$B5CE76  \
	JMP CODE_B5CEF0				;$B5CE79  /

CODE_B5CE7C:
	JSR CODE_B5E0A1				;$B5CE7C  /

DATA_B5CE7F:
	db $10, $09 : dw DATA_FD1B70 : db $0B, $0B


CODE_B5CE85:
	JSR CODE_B5CE8B				;$B5CE85  \
	JMP CODE_B5CEF0				;$B5CE88  /

CODE_B5CE8B:
	JSR CODE_B5E0A1				;$B5CE8B  /

DATA_B5CE8E:
	db $11, $09 : dw DATA_FD1C70 : db $0B, $0B


CODE_B5CE94:
	JSR CODE_B5CE9A				;$B5CE94  \
	JMP CODE_B5CEF0				;$B5CE97  /

CODE_B5CE9A:
	JSR CODE_B5E0A1				;$B5CE9A  /

DATA_B5CE9D:
	db $12, $0C : dw DATA_FD1D70 : db $0B, $0B


CODE_B5CEA3:
	JSR CODE_B5CEA9				;$B5CEA3  \
	JMP CODE_B5CEF0				;$B5CEA6  /

CODE_B5CEA9:
	JSR CODE_B5E0A1				;$B5CEA9  /

DATA_B5CEAC:
	db $14, $09 : dw DATA_FD1E70 : db $0B, $0B


CODE_B5CEB2:
	JSR CODE_B5CEB8				;$B5CEB2  \
	JMP CODE_B5CEF0				;$B5CEB5  /

CODE_B5CEB8:
	JSR CODE_B5E0A1				;$B5CEB8  /

DATA_B5CEBB:
	db $13, $09 : dw DATA_FD1F70 : db $0B, $0B


CODE_B5CEC1:
	JSR CODE_B5CEC7				;$B5CEC1  \
	JMP CODE_B5CEF0				;$B5CEC4  /

CODE_B5CEC7:
	JSR CODE_B5E0A1				;$B5CEC7  /

DATA_B5CECA:
	db $15, $09 : dw DATA_FD2070 : db $0B, $0B


CODE_B5CED0:
	JSR CODE_B5CED6				;$B5CED0  \
	JMP CODE_B5CEF0				;$B5CED3  /

CODE_B5CED6:
	JSR CODE_B5E0A1				;$B5CED6  /

DATA_B5CED9:
	db $13, $0D : dw DATA_FD1F70 : db $21, $0B

CODE_B5CEDF:
	SEP #$20				;$B5CEDF  \
	LDA #$0F				;$B5CEE1   |
	STA PPU.screen				;$B5CEE3   |
CODE_B5CEE6:					;	   |
	BRA CODE_B5CEE6				;$B5CEE6  /

CODE_B5CEE8:
	REP #$20				;$B5CEE8   |
	RTS					;$B5CEEA  /

CODE_B5CEEB:
	JSL CODE_BB91F7				;$B5CEEB  \
	RTS					;$B5CEEF  /

CODE_B5CEF0:
	CLC					;$B5CEF0  \
	XCE					;$B5CEF1   |
	SEI					;$B5CEF2   |
	REP #$30				;$B5CEF3   |
	LDA #$0000				;$B5CEF5   |
	TCD					;$B5CEF8   |
	LDX #$01FF				;$B5CEF9   |
	TXS					;$B5CEFC   |
	JSR CODE_B5CEEB				;$B5CEFD   |
	JSR CODE_B5D96E				;$B5CF00   |
	JSL CODE_B480CD				;$B5CF03   |
	LDA.l $0006A3				;$B5CF07   |
	BIT #$0020				;$B5CF0B   |
	BNE CODE_B5CF20				;$B5CF0E   |
	JSL CODE_B49C2A				;$B5CF10   |
	LDA.l $0006A3				;$B5CF14   |
	BIT #$0040				;$B5CF18   |
	BNE CODE_B5CF20				;$B5CF1B   |
	JSR CODE_B5D23F				;$B5CF1D   |
CODE_B5CF20:					;	   |
	LDX $0593				;$B5CF20   |
	LDA.l $000790				;$B5CF23   |
	STA $12,x				;$B5CF27   |
	SEP #$20				;$B5CF29   |
	LDA CPU.irq_flag			;$B5CF2B   |
	LDA #$80				;$B5CF2E   |
	STA PPU.oam_address_high		;$B5CF30   |
	LDA #$01				;$B5CF33   |
	STA CPU.rom_speed			;$B5CF35   |
	REP #$20				;$B5CF38   |
	LDA #$0100				;$B5CF3A   |
	JSL CODE_808C2E				;$B5CF3D   |
	JSL CODE_808CA8				;$B5CF41   |
	LDA.l $0006A3				;$B5CF45   |
	AND #$FF9F				;$B5CF49   |
	STA $0006A3				;$B5CF4C   |
	LDX #CODE_808CF1			;$B5CF50   |
	LDA.l $0006A3				;$B5CF53   |
	BIT #$8000				;$B5CF57   |
	BEQ CODE_B5CF5F				;$B5CF5A   |
	LDX #CODE_808CD9			;$B5CF5C   |
CODE_B5CF5F:					;	   |
	TXA					;$B5CF5F   |
	JMP CODE_B5CFF6				;$B5CF60  /

CODE_B5CF63:
	CLC					;$B5CF63  \
	XCE					;$B5CF64   |
	SEI					;$B5CF65   |
	REP #$30				;$B5CF66   |
	LDA #$0000				;$B5CF68   |
	TCD					;$B5CF6B   |
	LDX #$01FF				;$B5CF6C   |
	TXS					;$B5CF6F   |
	JSR CODE_B5CEEB				;$B5CF70   |
	JSL CODE_B480CD				;$B5CF73   |
	JSL CODE_B49C2A				;$B5CF77   |
	JSR CODE_B5D580				;$B5CF7B   |
	LDA.l $0006A5				;$B5CF7E   |
	BIT #$0040				;$B5CF82   |
	BNE CODE_B5CFD3				;$B5CF85   |
	LDA.l $0006AD				;$B5CF87   |
	BEQ CODE_B5CF99				;$B5CF8B   |
	LDA.l $0006A3				;$B5CF8D   |
	BIT #$0040				;$B5CF91   |
	BNE CODE_B5CF99				;$B5CF94   |
	JSR CODE_B5D23F				;$B5CF96   |
CODE_B5CF99:					;	   |
	SEP #$20				;$B5CF99   |
	LDA CPU.irq_flag			;$B5CF9B   |
	LDA #$80				;$B5CF9E   |
	STA PPU.oam_address_high		;$B5CFA0   |
	LDA #$01				;$B5CFA3   |
	STA CPU.rom_speed			;$B5CFA5   |
	REP #$20				;$B5CFA8   |
	LDA #$0100				;$B5CFAA   |
	JSL CODE_808C2E				;$B5CFAD   |
	JSL CODE_808CA8				;$B5CFB1   |
	LDA.l $0006A3				;$B5CFB5   |
	AND #$FF9F				;$B5CFB9   |
	STA $0006A3				;$B5CFBC   |
	LDX #CODE_808CE9			;$B5CFC0   |
	LDA.l $0006A3				;$B5CFC3   |
	BIT #$8000				;$B5CFC7   |
	BEQ CODE_B5CFCF				;$B5CFCA   |
	LDX #CODE_808CD9			;$B5CFCC   |
CODE_B5CFCF:					;	   |
	TXA					;$B5CFCF   |
	JMP CODE_B5CFF6				;$B5CFD0  /

CODE_B5CFD3:
	LDA CPU.irq_flag			;$B5CFD3  \
	LDA #$0080				;$B5CFD6   |
	STA PPU.oam_address_high		;$B5CFD9   |
	LDA #$0001				;$B5CFDC   |
	STA CPU.rom_speed			;$B5CFDF   |
	REP #$20				;$B5CFE2   |
	LDA #$000F				;$B5CFE4   |
	STA screen_brightness			;$B5CFE7   |
	JSL CODE_808CA8				;$B5CFEA   |
	STZ global_frame_counter		;$B5CFEE   |
	LDA #CODE_808CED			;$B5CFF0   |
	JMP CODE_B5CFF6				;$B5CFF3  /

CODE_B5CFF6:
	STA NMI_pointer				;$B5CFF6  \
	SEP #$20				;$B5CFF8   |
	LDA CPU.nmi_flag			;$B5CFFA   |
CODE_B5CFFD:					;	   |
	LDA CPU.nmi_flag			;$B5CFFD   |
	AND #$80				;$B5D000   |
	BNE CODE_B5CFFD				;$B5D002   |
	SEP #$20				;$B5D004   |
	LDA #$81				;$B5D006   |
	STA CPU.enable_interrupts		;$B5D008   |
	STZ joypad.port_0			;$B5D00B   |
CODE_B5D00E:					;	   |
	WAI					;$B5D00E   |
	BRA CODE_B5D00E				;$B5D00F  /

DATA_B5D011:
	db $19, $13, $04, $7F, $13, $14, $01, $11
	db $06, $00, $19, $01, $01, $42, $08, $40
	db $01, $01, $42, $08, $87, $31, $31, $EF
	db $3D, $32, $32, $EF, $3D, $33, $33, $EF
	db $3D, $34, $34, $EF, $3D, $35, $35, $EF
	db $3D, $36, $36, $EF, $3D, $37, $37, $EF
	db $3D, $38, $01, $01, $42, $08, $01, $01
	db $01, $00, $00, $00, $19, $00, $00, $FF
	db $00, $74, $00, $00, $FF, $00, $04, $FF
	db $00, $FF, $00, $04, $FF, $00, $FE, $00
	db $04, $FF, $00, $FF, $00, $04, $FF, $00
	db $FE, $00, $04, $FF, $00, $FF, $00, $04
	db $FF, $00, $FE, $00, $04, $FF, $00, $FF
	db $00, $04, $FF, $00, $FE, $00, $04, $FF
	db $00, $FF, $00, $04, $FF, $00, $FE, $00
	db $04, $FF, $00, $FF, $00, $04, $FF, $00
	db $FE, $00, $03, $FF, $00, $FF, $00, $02
	db $FE, $00, $FF, $00, $01, $FE, $00, $FE
	db $00, $02, $FF, $00, $FE, $00, $03, $FF
	db $00, $FF, $00, $02, $FE, $00, $FF, $00
	db $01, $FE, $00, $FE, $00, $02, $FF, $00
	db $FE, $00, $03, $FF, $00, $FF, $00, $02
	db $FE, $00, $FF, $00, $01, $FE, $00, $FE
	db $00, $02, $FF, $00, $FE, $00, $03, $FF
	db $00, $FF, $00, $02, $FE, $00, $FF, $00
	db $01, $FE, $00, $FE, $00, $02, $FF, $00
	db $FE, $00, $03, $FF, $00, $FF, $00, $02
	db $FE, $00, $FF, $00, $01, $FE, $00, $FE
	db $00, $02, $FF, $00, $FE, $00, $03, $FF
	db $00, $FF, $00, $02, $FE, $00, $FF, $00
	db $01, $FE, $00, $FE, $00, $02, $FF, $00
	db $FE, $00, $03, $FF, $00, $FF, $00, $02
	db $FE, $00, $FF, $00, $01, $FE, $00, $FE
	db $00, $02, $FF, $00, $FE, $00, $03, $FF
	db $00, $FF, $00, $02, $FE, $00, $FF, $00
	db $01, $FE, $00, $FE, $00, $02, $FF, $00
	db $FE, $00, $00, $7F, $80, $00, $01, $00
	db $00, $00


CODE_B5D13B:
	PHK					;$B5D13B  \
	PLB					;$B5D13C   |
	LDX #$01FF				;$B5D13D   |
	TXS					;$B5D140   |
	STZ PPU.oam_address			;$B5D141   |
	LDA #$1E01				;$B5D144   |
	STA CPU.enable_dma			;$B5D147   |
	JSL CODE_B5A919				;$B5D14A   |
	LDA $17C0				;$B5D14E   |
	STA $7E8051				;$B5D151   |
	STA $7E8056				;$B5D155   |
	LDX #$0000				;$B5D159   |
	LDY #$0006				;$B5D15C   |
CODE_B5D15F:					;	   |
	LDA $17C0				;$B5D15F   |
	STA $7E805B,x				;$B5D162   |
	DEC A					;$B5D166   |
	STA $7E8060,x				;$B5D167   |
	TXA					;$B5D16B   |
	CLC					;$B5D16C   |
	ADC #$000A				;$B5D16D   |
	TAX					;$B5D170   |
	DEY					;$B5D171   |
	BNE CODE_B5D15F				;$B5D172   |
	LDY #$0008				;$B5D174   |
CODE_B5D177:					;	   |
	LDA $17C0				;$B5D177   |
	STA $7E805B,x				;$B5D17A   |
	STA $7E8060,x				;$B5D17E   |
	DEC A					;$B5D182   |
	STA $7E8065,x				;$B5D183   |
	STA $7E806A,x				;$B5D187   |
	TXA					;$B5D18B   |
	CLC					;$B5D18C   |
	ADC #$0014				;$B5D18D   |
	TAX					;$B5D190   |
	DEY					;$B5D191   |
	BNE CODE_B5D177				;$B5D192   |
	JSR CODE_B5DF4F				;$B5D194   |
	JSL CODE_B48368				;$B5D197   |
	LDA.l $0006A3				;$B5D19B   |
	BIT #$0001				;$B5D19F   |
	BEQ CODE_B5D1AC				;$B5D1A2   |
CODE_B5D1A4:					;	   |
	LDA screen_brightness			;$B5D1A4   |
	BNE CODE_B5D1AC				;$B5D1A7   |
	BRL CODE_B5D2CA				;$B5D1A9  /

CODE_B5D1AC:
	LDA screen_brightness			;$B5D1AC  \
	BNE CODE_B5D1BD				;$B5D1AF   |
	LDA.l $0006A5				;$B5D1B1   |
	BIT #$0010				;$B5D1B5   |
	BEQ CODE_B5D1BD				;$B5D1B8   |
	BRL CODE_B5D44A				;$B5D1BA  /

CODE_B5D1BD:
	LDA.l $0006A3				;$B5D1BD  \
	BIT #$8000				;$B5D1C1   |
	BEQ CODE_B5D1D0				;$B5D1C4   |
	LDA screen_brightness			;$B5D1C6   |
	BNE CODE_B5D1D0				;$B5D1C9   |
	LDA #CODE_808CD9			;$B5D1CB   |
	STA NMI_pointer				;$B5D1CE   |
CODE_B5D1D0:					;	   |
	LDA.l $0006A5				;$B5D1D0   |
	BIT #$2000				;$B5D1D4   |
	BEQ CODE_B5D1F5				;$B5D1D7   |
	LDA screen_brightness			;$B5D1D9   |
	BNE CODE_B5D1F5				;$B5D1DC   |
	LDA.l $0006A5				;$B5D1DE   |
	AND #$DFFF				;$B5D1E2   |
	STA $0006A5				;$B5D1E5   |
	LDA #CODE_8087D9			;$B5D1E9   |
	STA gameloop_pointer			;$B5D1EC   |
	LDA #CODE_808608			;$B5D1EE   |
	JML CODE_808C80				;$B5D1F1  /

CODE_B5D1F5:
	JSL CODE_80897C				;$B5D1F5  \
	INC global_frame_counter		;$B5D1F9   |
	LDA.l $0006AB				;$B5D1FB   |
	CMP #$0072				;$B5D1FF   |
	BEQ CODE_B5D229				;$B5D202   |
	CMP #$0073				;$B5D204   |
	BEQ CODE_B5D229				;$B5D207   |
	CMP #$0074				;$B5D209   |
	BEQ CODE_B5D229				;$B5D20C   |
	CMP #$0075				;$B5D20E   |
	BEQ CODE_B5D229				;$B5D211   |
	CMP #$0076				;$B5D213   |
	BEQ CODE_B5D229				;$B5D216   |
	LDA.l $0006A3				;$B5D218   |
	BIT #$0020				;$B5D21C   |
	BNE CODE_B5D229				;$B5D21F   |
	JSR CODE_B5CDDE				;$B5D221   |
	JSR CODE_B5DA3D				;$B5D224   |
	BRA CODE_B5D22D				;$B5D227  /

CODE_B5D229:
	JSL sprite_handler			;$B5D229  \
CODE_B5D22D:					;	   |
	JSL CODE_B5A8DA				;$B5D22D   |
	JSR CODE_B5D48E				;$B5D231   |
	JSL fade_screen_global			;$B5D234   |
	JSL CODE_808CA8				;$B5D238   |
CODE_B5D23C:					;	   |
	WAI					;$B5D23C   |
	BRA CODE_B5D23C				;$B5D23D  /

CODE_B5D23F:
	PEA $7E00				;$B5D23F  \
	PLB					;$B5D242   |
	PLB					;$B5D243   |
	LDA.l $0006AB				;$B5D244   |
	ASL A					;$B5D248   |
	ASL A					;$B5D249   |
	TAY					;$B5D24A   |
	LDX $3202,y				;$B5D24B   |
	LDA #$B400				;$B5D24E   |
	PHA					;$B5D251   |
	PLB					;$B5D252   |
	PLB					;$B5D253   |
	LDA.l $0006AD				;$B5D254   |
	BNE CODE_B5D25F				;$B5D258   |
	LDA $000D,x				;$B5D25A   |
	BRA CODE_B5D263				;$B5D25D  /

CODE_B5D25F:
	LDA.l $000792				;$B5D25F  \
CODE_B5D263:					;	   |
	ASL A					;$B5D263   |
	ASL A					;$B5D264   |
	ADC #$2A00				;$B5D265   |
	TAY					;$B5D268   |
	PEA $7E00				;$B5D269   |
	PLB					;$B5D26C   |
	PLB					;$B5D26D   |
	LDA $0002,y				;$B5D26E   |
	PHA					;$B5D271   |
	LDA #$B400				;$B5D272   |
	PHA					;$B5D275   |
	PLB					;$B5D276   |
	PLB					;$B5D277   |
	LDY $06AD				;$B5D278   |
	BNE CODE_B5D280				;$B5D27B   |
	LDY $000B,x				;$B5D27D   |
CODE_B5D280:					;	   |
	STY $06AB				;$B5D280   |
	PLX					;$B5D283   |
	STX $06AF				;$B5D284   |
	LDA $0000,x				;$B5D287   |
	AND #$00FF				;$B5D28A   |
	INC A					;$B5D28D   |
	STA $0006C5				;$B5D28E   |
	LDY $0593				;$B5D292   |
	LDA #$CFFF				;$B5D295   |
	AND $0012,y				;$B5D298   |
	ORA $0003,x				;$B5D29B   |
	STA $0012,y				;$B5D29E   |
	STA $000790				;$B5D2A1   |
	LDA.l $0006A1				;$B5D2A5   |
	ORA #$0100				;$B5D2A9   |
	STA $0006A1				;$B5D2AC   |
	BIT #$0004				;$B5D2B0   |
	BEQ CODE_B5D2C5				;$B5D2B3   |
	LDA.l $0006C5				;$B5D2B5   |
	DEC A					;$B5D2B9   |
	ASL A					;$B5D2BA   |
	ASL A					;$B5D2BB   |
	CLC					;$B5D2BC   |
	ADC $0006AF				;$B5D2BD   |
	STA $0006AF				;$B5D2C1   |
CODE_B5D2C5:					;	   |
	JSL CODE_B4B025				;$B5D2C5   |
	RTS					;$B5D2C9  /

CODE_B5D2CA:
	PHB					;$B5D2CA  \
	LDA.l $0006A3				;$B5D2CB   |
	AND #$FFFE				;$B5D2CF   |
	STA $0006A3				;$B5D2D2   |
	BIT #$0020				;$B5D2D6   |
	BEQ CODE_B5D2E4				;$B5D2D9   |
	JSL CODE_B49C2A				;$B5D2DB   |
	JSR CODE_B5D23F				;$B5D2DF   |
	BRA CODE_B5D310				;$B5D2E2  /

CODE_B5D2E4:
	LDA.l $0006AB				;$B5D2E4  \
	STA $0006A9				;$B5D2E8   |
	INC A					;$B5D2EC   |
	STA $0006B1				;$B5D2ED   |
	LDA.l $0006B1				;$B5D2F1   |
	ASL A					;$B5D2F5   |
	TAX					;$B5D2F6   |
	LDA #$B400				;$B5D2F7   |
	PHA					;$B5D2FA   |
	PLB					;$B5D2FB   |
	PLB					;$B5D2FC   |
	LDY.w DATA_B4C44C,x			;$B5D2FD   |
	STY $06AB				;$B5D300   |
	JSL CODE_B49C2A				;$B5D303   |
	LDA.l $0006A9				;$B5D307   |
	INC A					;$B5D30B   |
	STA $0006B1				;$B5D30C   |
CODE_B5D310:					;	   |
	JSL CODE_B489ED				;$B5D310   |
	LDA.l $0006B1				;$B5D314   |
	PLB					;$B5D318   |
	JMP CODE_B5CDFD				;$B5D319  /

DATA_B5D31C:
	dw DATA_FA0B20
	dw DATA_FA0EA0
	dw DATA_FA1220
	dw DATA_FA15A0
	dw DATA_FA1920
	dw DATA_FA1CA0
	dw DATA_FA2020
	dw DATA_FA23A0

DATA_B5D32C:
	dw DATA_FA2720
	dw DATA_FA2E20
	dw DATA_FA3520
	dw DATA_FA3C20

CODE_B5D334:
	PHK					;$B5D334  \
	PLB					;$B5D335   |
	LDX #$01FF				;$B5D336   |
	TXS					;$B5D339   |
	STZ PPU.oam_address			;$B5D33A   |
	LDA.l $0006B1				;$B5D33D   |
	CMP #$000A				;$B5D341   |
	BCS CODE_B5D349				;$B5D344   |
	BRL CODE_B5D3D9				;$B5D346  /

CODE_B5D349:
	LDA #$6390				;$B5D349  \
	STA PPU.vram_address			;$B5D34C   |
	LDA global_frame_counter		;$B5D34F   |
	BIT #$0007				;$B5D351   |
	BNE CODE_B5D37F				;$B5D354   |
	LSR A					;$B5D356   |
	LSR A					;$B5D357   |
	AND #$000E				;$B5D358   |
	TAX					;$B5D35B   |
	LDA DATA_B5D31C,x			;$B5D35C   |
	STA DMA[1].source			;$B5D35F   |
	STA DMA[1].unused_2			;$B5D362   |
	LDA #$0380				;$B5D365   |
	STA DMA[1].size				;$B5D368   |
	LDA #$1801				;$B5D36B   |
	STA DMA[1].settings			;$B5D36E   |
	SEP #$20				;$B5D371   |
	LDA #$FA				;$B5D373   |
	STA DMA[1].source_bank			;$B5D375   |
	LDA #$02				;$B5D378   |
	STA CPU.enable_dma			;$B5D37A   |
	REP #$20				;$B5D37D   |
CODE_B5D37F:					;	   |
	LDA $08FC				;$B5D37F   |
	AND #$0004				;$B5D382   |
	BEQ CODE_B5D3D4				;$B5D385   |
	LDA global_frame_counter		;$B5D387   |
	BIT #$0007				;$B5D389   |
	BNE CODE_B5D3D4				;$B5D38C   |
	LDA #$0013				;$B5D38E   |
	STA $7E8016				;$B5D391   |
	LDX $08FE				;$B5D395   |
	CPX #$0008				;$B5D398   |
	BNE CODE_B5D3A5				;$B5D39B   |
	LDA #$0004				;$B5D39D   |
	TRB $08FC				;$B5D3A0   |
	BRA CODE_B5D3D4				;$B5D3A3  /

CODE_B5D3A5:
	INC $08FE				;$B5D3A5  \
	INC $08FE				;$B5D3A8   |
	LDA #$6010				;$B5D3AB   |
	STA PPU.vram_address			;$B5D3AE   |
	LDA DATA_B5D32C,x			;$B5D3B1   |
	STA DMA[1].source			;$B5D3B4   |
	STA DMA[1].unused_2			;$B5D3B7   |
	LDA #$0700				;$B5D3BA   |
	STA DMA[1].size				;$B5D3BD   |
	LDA #$1801				;$B5D3C0   |
	STA DMA[1].settings			;$B5D3C3   |
	SEP #$20				;$B5D3C6   |
	LDA #$FA				;$B5D3C8   |
	STA DMA[1].source_bank			;$B5D3CA   |
	LDA #$02				;$B5D3CD   |
	STA CPU.enable_dma			;$B5D3CF   |
	REP #$20				;$B5D3D2   |
CODE_B5D3D4:					;	   |
	LDA #$0401				;$B5D3D4   |
	BRA CODE_B5D3DC				;$B5D3D7  /

CODE_B5D3D9:
	LDA #$0001				;$B5D3D9  \
CODE_B5D3DC:					;	   |
	STA CPU.enable_dma			;$B5D3DC   |
	JSL CODE_B5A919				;$B5D3DF   |
	JSL CODE_B48368				;$B5D3E3   |
	LDA.l $0006A3				;$B5D3E7   |
	BIT #$0020				;$B5D3EB   |
	BEQ CODE_B5D3F3				;$B5D3EE   |
	BRL CODE_B5D1A4				;$B5D3F0  /

CODE_B5D3F3:
	BIT #$0001				;$B5D3F3  \
	BEQ CODE_B5D400				;$B5D3F6   |
	LDA screen_brightness			;$B5D3F8   |
	BNE CODE_B5D400				;$B5D3FB   |
	JMP CODE_B5D47A				;$B5D3FD  /

CODE_B5D400:
	LDA screen_brightness			;$B5D400  \
	BNE CODE_B5D411				;$B5D403   |
	LDA.l $0006A5				;$B5D405   |
	BIT #$0010				;$B5D409   |
	BEQ CODE_B5D411				;$B5D40C   |
	BRL CODE_B5D44A				;$B5D40E  /

CODE_B5D411:
	LDA.l $0006A3				;$B5D411  \
	BIT #$8000				;$B5D415   |
	BEQ CODE_B5D424				;$B5D418   |
	LDA screen_brightness			;$B5D41A   |
	BNE CODE_B5D424				;$B5D41D   |
	LDA #CODE_808CD9			;$B5D41F   |
	STA NMI_pointer				;$B5D422   |
CODE_B5D424:					;	   |
	SEP #$20				;$B5D424   |
	LDA screen_brightness			;$B5D426   |
	STA PPU.screen				;$B5D429   |
	REP #$20				;$B5D42C   |
	JSL CODE_80897C				;$B5D42E   |
	INC global_frame_counter		;$B5D432   |
	JSL sprite_handler			;$B5D434   |
	JSL CODE_B5A8DA				;$B5D438   |
	JSR CODE_B5D48E				;$B5D43C   |
	JSL fade_screen_global			;$B5D43F   |
	JSL CODE_808CA8				;$B5D443   |
CODE_B5D447:					;	   |
	WAI					;$B5D447   |
	BRA CODE_B5D447				;$B5D448  /

CODE_B5D44A:
	JSL CODE_B49BDC				;$B5D44A  \
	JSL CODE_BBC85B				;$B5D44E   |
	LDA.l $0006A5				;$B5D452   |
	AND #$FFEF				;$B5D456   |
	ORA #$4000				;$B5D459   |
	STA $0006A5				;$B5D45C   |
	LDA.l $0006A3				;$B5D460   |
	ORA #$0040				;$B5D464   |
	STA $0006A3				;$B5D467   |
	STZ $06AF				;$B5D46B   |
	LDA #CODE_8087D9			;$B5D46E   |
	STA gameloop_pointer			;$B5D471   |
	LDA #CODE_808608			;$B5D473   |
	JML CODE_808C80				;$B5D476  /

CODE_B5D47A:
	LDA level_number			;$B5D47A  \
	STA $08A8				;$B5D47C   |
	LDA.l $0006A3				;$B5D47F   |
	AND #$FFFE				;$B5D483   |
	STA $0006A3				;$B5D486   |
	JML CODE_8087E1				;$B5D48A  /

CODE_B5D48E:
	PHB					;$B5D48E  \
	LDA #$0300				;$B5D48F   |
	STA $70					;$B5D492   |
	LDA #$0404				;$B5D494   |
	STA $56					;$B5D497   |
	LDA #$0054				;$B5D499   |
	STA $78					;$B5D49C   |
	JSL CODE_B59F40				;$B5D49E   |
	STZ $1730				;$B5D4A2   |
	PLB					;$B5D4A5   |
	RTS					;$B5D4A6  /

CODE_B5D4A7:
	LDX #$01FF				;$B5D4A7  \
	TXS					;$B5D4AA   |
	PHK					;$B5D4AB   |
	PLB					;$B5D4AC   |
	STZ PPU.oam_address			;$B5D4AD   |
	LDA #$1E01				;$B5D4B0   |
	STA CPU.enable_dma			;$B5D4B3   |
	JSL CODE_B5A919				;$B5D4B6   |
	LDA $17C0				;$B5D4BA   |
	STA $7E8051				;$B5D4BD   |
	STA $7E8056				;$B5D4C1   |
	LDX #$0000				;$B5D4C5   |
	LDY #$0006				;$B5D4C8   |
CODE_B5D4CB:					;	   |
	LDA $17C0				;$B5D4CB   |
	STA $7E805B,x				;$B5D4CE   |
	DEC A					;$B5D4D2   |
	STA $7E8060,x				;$B5D4D3   |
	TXA					;$B5D4D7   |
	CLC					;$B5D4D8   |
	ADC #$000A				;$B5D4D9   |
	TAX					;$B5D4DC   |
	DEY					;$B5D4DD   |
	BNE CODE_B5D4CB				;$B5D4DE   |
	LDY #$0008				;$B5D4E0   |
CODE_B5D4E3:					;	   |
	LDA $17C0				;$B5D4E3   |
	STA $7E805B,x				;$B5D4E6   |
	STA $7E8060,x				;$B5D4EA   |
	DEC A					;$B5D4EE   |
	STA $7E8065,x				;$B5D4EF   |
	STA $7E806A,x				;$B5D4F3   |
	TXA					;$B5D4F7   |
	CLC					;$B5D4F8   |
	ADC #$0014				;$B5D4F9   |
	TAX					;$B5D4FC   |
	DEY					;$B5D4FD   |
	BNE CODE_B5D4E3				;$B5D4FE   |
	JSR CODE_B5DF4F				;$B5D500   |
	SEP #$20				;$B5D503   |
	LDA screen_brightness			;$B5D505   |
	STA PPU.screen				;$B5D508   |
	REP #$20				;$B5D50B   |
	INC global_frame_counter		;$B5D50D   |
	JSL CODE_BAC7C0				;$B5D50F   |
	JSR CODE_B5DA3D				;$B5D513   |
	LDX #$1364				;$B5D516   |
	LDA $0A,x				;$B5D519   |
	SEC					;$B5D51B   |
	SBC #$0040				;$B5D51C   |
	BPL CODE_B5D524				;$B5D51F   |
	LDA #$0000				;$B5D521   |
CODE_B5D524:					;	   |
	CMP #$0106				;$B5D524   |
	BCC CODE_B5D52C				;$B5D527   |
	LDA #$0106				;$B5D529   |
CODE_B5D52C:					;	   |
	SEC					;$B5D52C   |
	SBC $17C0				;$B5D52D   |
	CMP #$8000				;$B5D530   |
	ROR A					;$B5D533   |
	CMP #$8000				;$B5D534   |
	ROR A					;$B5D537   |
	CMP #$8000				;$B5D538   |
	ROR A					;$B5D53B   |
	SEC					;$B5D53C   |
	SBC $D2					;$B5D53D   |
	CMP #$8000				;$B5D53F   |
	ROR A					;$B5D542   |
	CMP #$8000				;$B5D543   |
	ROR A					;$B5D546   |
	CMP #$8000				;$B5D547   |
	ROR A					;$B5D54A   |
	CLC					;$B5D54B   |
	ADC $D2					;$B5D54C   |
	STA $D2					;$B5D54E   |
	CLC					;$B5D550   |
	ADC $17C0				;$B5D551   |
	STA $17C0				;$B5D554   |
	JSL CODE_B5A8DA				;$B5D557   |
	JSL CODE_B380EC				;$B5D55B   |
	JSR CODE_B5D48E				;$B5D55F   |
	JSL fade_screen_global			;$B5D562   |
	JSL CODE_808CA8				;$B5D566   |
	LDA screen_brightness			;$B5D56A   |
	BNE CODE_B5D57D				;$B5D56D   |
	LDA #CODE_B48DFA			;$B5D56F   |
	STA $00067D				;$B5D572   |
	LDA #CODE_808CD9			;$B5D576   |
	JML CODE_808C80				;$B5D579  /

CODE_B5D57D:
	WAI					;$B5D57D  \
	BRA CODE_B5D57D				;$B5D57E  /

CODE_B5D580:
	LDA #$0004				;$B5D580  \
	STA $0D84				;$B5D583   |
	STA $0DE2				;$B5D586   |
	LDA #$002C				;$B5D589   |
	STA $0D8A				;$B5D58C   |
	STA $0DE8				;$B5D58F   |
	LDA #$0101				;$B5D592   |
	STA $0D86				;$B5D595   |
	STA $0DE4				;$B5D598   |
	LDA #$0180				;$B5D59B   |
	STA $0D8E				;$B5D59E   |
	LDA #$01A0				;$B5D5A1   |
	STA $0DEC				;$B5D5A4   |
	LDA #$0C68				;$B5D5A7   |
	STA $0D9E				;$B5D5AA   |
	LDA #$0C88				;$B5D5AD   |
	STA $0DFC				;$B5D5B0   |
	LDA #$4280				;$B5D5B3   |
	STA $0D96				;$B5D5B6   |
	LDA #$02A0				;$B5D5B9   |
	STA $0DF4				;$B5D5BC   |
	LDA #$0004				;$B5D5BF   |
	STA $0E40				;$B5D5C2   |
	STA $0E9E				;$B5D5C5   |
	LDA #$000C				;$B5D5C8   |
	STA $0E46				;$B5D5CB   |
	STA $0EA4				;$B5D5CE   |
	LDA #$0101				;$B5D5D1   |
	STA $0E42				;$B5D5D4   |
	STA $0EA0				;$B5D5D7   |
	LDA #$0180				;$B5D5DA   |
	STA $0E4A				;$B5D5DD   |
	LDA #$0160				;$B5D5E0   |
	STA $0EA8				;$B5D5E3   |
	LDA #$0C68				;$B5D5E6   |
	STA $0E5A				;$B5D5E9   |
	LDA #$0C88				;$B5D5EC   |
	STA $0EB8				;$B5D5EF   |
	LDA #$8280				;$B5D5F2   |
	STA $0E52				;$B5D5F5   |
	LDA #$C2A0				;$B5D5F8   |
	STA $0EB0				;$B5D5FB   |
	LDA #$0004				;$B5D5FE   |
	STA $0EFC				;$B5D601   |
	LDA #$00D0				;$B5D604   |
	STA $0F02				;$B5D607   |
	LDA #$01C8				;$B5D60A   |
	STA $0F06				;$B5D60D   |
	LDA #$0100				;$B5D610   |
	STA $0EFE				;$B5D613   |
	LDA #$62E0				;$B5D616   |
	STA $0F0E				;$B5D619   |
	LDY #$0000				;$B5D61C   |
	LDX #$01D6				;$B5D61F   |
CODE_B5D622:					;	   |
	LDA #$0004				;$B5D622   |
	STA $0D84,x				;$B5D625   |
	LDA #$00C0				;$B5D628   |
	STA $0D8A,x				;$B5D62B   |
	LDA #$0180				;$B5D62E   |
	STA $0D8E,x				;$B5D631   |
	LDA #$0100				;$B5D634   |
	STA $0D86,x				;$B5D637   |
	TYA					;$B5D63A   |
	CMP #$0003				;$B5D63B   |
	BCC CODE_B5D644				;$B5D63E   |
	ADC #$000B				;$B5D640   |
	CLC					;$B5D643   |
CODE_B5D644:					;	   |
	ADC #$32C0				;$B5D644   |
	STA $0D96,x				;$B5D647   |
	LDA #$0BB8				;$B5D64A   |
	STA $0D9E,x				;$B5D64D   |
	LDA #$0004				;$B5D650   |
	STA $0E9E,x				;$B5D653   |
	LDA #$0080				;$B5D656   |
	STA $0EA4,x				;$B5D659   |
	LDA #$0040				;$B5D65C   |
	STA $0EA8,x				;$B5D65F   |
	LDA #$0101				;$B5D662   |
	STA $0EA0,x				;$B5D665   |
	TYA					;$B5D668   |
	ASL A					;$B5D669   |
	CLC					;$B5D66A   |
	ADC #$26C4				;$B5D66B   |
	STA $0EB0,x				;$B5D66E   |
	TYA					;$B5D671   |
	CLC					;$B5D672   |
	ADC #$0002				;$B5D673   |
	TAY					;$B5D676   |
	TXA					;$B5D677   |
	CLC					;$B5D678   |
	ADC #$005E				;$B5D679   |
	TAX					;$B5D67C   |
	CPX #$02F0				;$B5D67D   |
	BNE CODE_B5D622				;$B5D680   |
	LDA $0FCA				;$B5D682   |
	EOR #$4000				;$B5D685   |
	STA $0FCA				;$B5D688   |
	LDA #$0004				;$B5D68B   |
	STA $118E				;$B5D68E   |
	LDA #$0089				;$B5D691   |
	STA $1194				;$B5D694   |
	LDA #$0100				;$B5D697   |
	STA $1190				;$B5D69A   |
	LDA #$0038				;$B5D69D   |
	STA $1198				;$B5D6A0   |
	LDA #$20E0				;$B5D6A3   |
	STA $11A0				;$B5D6A6   |
	LDA #$0C38				;$B5D6A9   |
	STA $11A8				;$B5D6AC   |
	LDA #$0004				;$B5D6AF   |
	STA $11EC				;$B5D6B2   |
	LDA #$0095				;$B5D6B5   |
	STA $11F2				;$B5D6B8   |
	LDA #$0101				;$B5D6BB   |
	STA $11EE				;$B5D6BE   |
	LDA #$009D				;$B5D6C1   |
	STA $11F6				;$B5D6C4   |
	LDA #$30D2				;$B5D6C7   |
	STA $11FE				;$B5D6CA   |
	LDA #$0B98				;$B5D6CD   |
	STA $1206				;$B5D6D0   |
	LDA #$0004				;$B5D6D3   |
	STA $124A				;$B5D6D6   |
	LDA #$007C				;$B5D6D9   |
	STA $1250				;$B5D6DC   |
	LDA #$0101				;$B5D6DF   |
	STA $124C				;$B5D6E2   |
	LDA #$009C				;$B5D6E5   |
	STA $1254				;$B5D6E8   |
	LDA #$30D2				;$B5D6EB   |
	STA $125C				;$B5D6EE   |
	LDA #$0B98				;$B5D6F1   |
	STA $1264				;$B5D6F4   |
	LDA #$0004				;$B5D6F7   |
	STA $12A8				;$B5D6FA   |
	LDA #$00C8				;$B5D6FD   |
	STA $12AE				;$B5D700   |
	LDA #$0101				;$B5D703   |
	STA $12AA				;$B5D706   |
	LDA #$018C				;$B5D709   |
	STA $12B2				;$B5D70C   |
	LDA #$30D2				;$B5D70F   |
	STA $12BA				;$B5D712   |
	LDA #$0B98				;$B5D715   |
	STA $12C2				;$B5D718   |
	LDA #$0004				;$B5D71B   |
	STA $1306				;$B5D71E   |
	LDA #$00A8				;$B5D721   |
	STA $130C				;$B5D724   |
	LDA #$0101				;$B5D727   |
	STA $1308				;$B5D72A   |
	LDA #$0190				;$B5D72D   |
	STA $1310				;$B5D730   |
	LDA #$30D2				;$B5D733   |
	STA $1318				;$B5D736   |
	LDA #$0B98				;$B5D739   |
	STA $1320				;$B5D73C   |
	LDA #$0004				;$B5D73F   |
	STA $1364				;$B5D742   |
	LDA #$0010				;$B5D745   |
	STA $136A				;$B5D748   |
	LDA #$0110				;$B5D74B   |
	STA $1366				;$B5D74E   |
	LDA #$01A0				;$B5D751   |
	STA $136E				;$B5D754   |
	LDA #$3822				;$B5D757   |
	STA $1376				;$B5D75A   |
	LDA #$0F50				;$B5D75D   |
	STA $137E				;$B5D760   |
	LDA $08FC				;$B5D763   |
	BIT #$0002				;$B5D766   |
	BNE CODE_B5D76E				;$B5D769   |
	JMP CODE_B5D8FB				;$B5D76B  /

CODE_B5D76E:
	LDA #$0004				;$B5D76E  \
	STA $13C2				;$B5D771   |
	LDA #$0160				;$B5D774   |
	STA $13C8				;$B5D777   |
	LDA #$0110				;$B5D77A   |
	STA $13C4				;$B5D77D   |
	LDA #$000C				;$B5D780   |
	STA $13CC				;$B5D783   |
	LDA #$2489				;$B5D786   |
	STA $13D4				;$B5D789   |
	LDA #$3128				;$B5D78C   |
	STA $13DC				;$B5D78F   |
	STZ $1406				;$B5D792   |
	LDA #$0004				;$B5D795   |
	STA $1420				;$B5D798   |
	LDA #$009A				;$B5D79B   |
	STA $1426				;$B5D79E   |
	LDA #$010E				;$B5D7A1   |
	STA $1422				;$B5D7A4   |
	LDA #$003F				;$B5D7A7   |
	STA $142A				;$B5D7AA   |
	LDA #$24A9				;$B5D7AD   |
	STA $1432				;$B5D7B0   |
	LDA #$0000				;$B5D7B3   |
	STA $143A				;$B5D7B6   |
	LDA $08FC				;$B5D7B9   |
	BIT #$0010				;$B5D7BC   |
	BNE CODE_B5D7C4				;$B5D7BF   |
	JMP CODE_B5D8AE				;$B5D7C1  /

CODE_B5D7C4:
	LDA #$0004				;$B5D7C4  \
	STA $147E				;$B5D7C7   |
	STA $14DC				;$B5D7CA   |
	STA $153A				;$B5D7CD   |
	STA $1598				;$B5D7D0   |
	STA $1364				;$B5D7D3   |
	LDA #$0240				;$B5D7D6   |
	STA $1484				;$B5D7D9   |
	LDA #$01CC				;$B5D7DC   |
	STA $1488				;$B5D7DF   |
	LDA #$0100				;$B5D7E2   |
	STA $153C				;$B5D7E5   |
	STA $1480				;$B5D7E8   |
	STA $14DE				;$B5D7EB   |
	LDA #$72E0				;$B5D7EE   |
	STA $1490				;$B5D7F1   |
	LDA #$0CA8				;$B5D7F4   |
	STA $14F6				;$B5D7F7   |
	STA $1498				;$B5D7FA   |
	STA $1554				;$B5D7FD   |
	LDA #$FE00				;$B5D800   |
	STA $149E				;$B5D803   |
	LDA #$FEC0				;$B5D806   |
	STA $14E2				;$B5D809   |
	LDA #$01D0				;$B5D80C   |
	STA $14E6				;$B5D80F   |
	LDA #$32E0				;$B5D812   |
	STA $14EE				;$B5D815   |
	STA $154C				;$B5D818   |
	LDA #$0200				;$B5D81B   |
	STA $14FC				;$B5D81E   |
	LDA #$FE40				;$B5D821   |
	STA $1540				;$B5D824   |
	LDA #$01B0				;$B5D827   |
	STA $1544				;$B5D82A   |
	LDA #$0280				;$B5D82D   |
	STA $155A				;$B5D830   |
	LDA #$0020				;$B5D833   |
	STA $155E				;$B5D836   |
	LDA #$01D0				;$B5D839   |
	STA $15A2				;$B5D83C   |
	LDA #$0110				;$B5D83F   |
	STA $159A				;$B5D842   |
	LDA #$3F00				;$B5D845   |
	STA $15AA				;$B5D848   |
	LDA #$0000				;$B5D84B   |
	STA $15B2				;$B5D84E   |
	LDA #$008A				;$B5D851   |
	STA $159E				;$B5D854   |
	LDA #$0000				;$B5D857   |
	STA $0EFC				;$B5D85A   |
	STA $1388				;$B5D85D   |
	LDA #$FFE0				;$B5D860   |
	STA $1384				;$B5D863   |
	LDA #$0020				;$B5D866   |
	STA $136E				;$B5D869   |
	LDA #$010F				;$B5D86C   |
	STA $1366				;$B5D86F   |
	LDA #$38E6				;$B5D872   |
	STA $1376				;$B5D875   |
	LDA #$315C				;$B5D878   |
	STA $137E				;$B5D87B   |
	LDA #$008F				;$B5D87E   |
	STA $136A				;$B5D881   |
	LDX #$0004				;$B5D884   |
	LDY #$00C0				;$B5D887   |
	LDA.l DATA_FD616E			;$B5D88A   |
	DEC A					;$B5D88E   |
	DEC A					;$B5D88F   |
	JSL DMA_palette				;$B5D890   |
	LDX #$0004				;$B5D894   |
	LDY #$00F0				;$B5D897   |
	LDA.l DATA_FD6170			;$B5D89A   |
	DEC A					;$B5D89E   |
	DEC A					;$B5D89F   |
	JSL DMA_palette				;$B5D8A0   |
	LDA #$0000				;$B5D8A4   |
	STA $17C0				;$B5D8A7   |
	STA $D2					;$B5D8AA   |
	BRA CODE_B5D8E9				;$B5D8AC  /

CODE_B5D8AE:
	BIT #$0001				;$B5D8AE  \
	BEQ CODE_B5D8E9				;$B5D8B1   |
	LDA #$0050				;$B5D8B3   |
	STA $136E				;$B5D8B6   |
	LDA #$010F				;$B5D8B9   |
	STA $1366				;$B5D8BC   |
	LDA #$28E6				;$B5D8BF   |
	STA $1376				;$B5D8C2   |
	LDA #$315C				;$B5D8C5   |
	STA $137E				;$B5D8C8   |
	LDA #$0004				;$B5D8CB   |
	STA $1364				;$B5D8CE   |
	LDA #$008F				;$B5D8D1   |
	STA $136A				;$B5D8D4   |
	LDX #$0004				;$B5D8D7   |
	LDY #$00C0				;$B5D8DA   |
	LDA.l DATA_FD616E			;$B5D8DD   |
	DEC A					;$B5D8E1   |
	DEC A					;$B5D8E2   |
	JSL DMA_palette				;$B5D8E3   |
	BRA CODE_B5D8FB				;$B5D8E7  /

CODE_B5D8E9:
	LDA #$0001				;$B5D8E9  \
	STA $1406				;$B5D8EC   |
	LDA #$002D				;$B5D8EF   |
	STA $13CC				;$B5D8F2   |
	LDA #$3140				;$B5D8F5   |
	STA $143A				;$B5D8F8   |
CODE_B5D8FB:					;	   |
	LDA.l $0006A5				;$B5D8FB   |
	BIT #$0040				;$B5D8FF   |
	BNE CODE_B5D907				;$B5D902   |
	JSR CODE_B5D96E				;$B5D904   |
CODE_B5D907:					;	   |
	LDX #$0000				;$B5D907   |
CODE_B5D90A:					;	   |
	LDA.l DATA_B5D011,x			;$B5D90A   |
	STA $7E8012,x				;$B5D90E   |
	INX					;$B5D912   |
	INX					;$B5D913   |
	CPX #$012A				;$B5D914   |
	BCC CODE_B5D90A				;$B5D917   |
	SEP #$20				;$B5D919   |
	LDX #$2C01				;$B5D91B   |
	STX HDMA[1].settings			;$B5D91E   |
	LDX #$8012				;$B5D921   |
	STX HDMA[1].source			;$B5D924   |
	LDA #$7E				;$B5D927   |
	STA HDMA[1].source_bank			;$B5D929   |
	STZ HDMA[1].indirect_source_bank	;$B5D92C   |
	LDX #$2103				;$B5D92F   |
	STX HDMA[2].settings			;$B5D932   |
	LDX #$801C				;$B5D935   |
	STX HDMA[2].source			;$B5D938   |
	LDA #$7E				;$B5D93B   |
	STA HDMA[2].source_bank			;$B5D93D   |
	STZ HDMA[2].indirect_source_bank	;$B5D940   |
	LDX #$0F03				;$B5D943   |
	STX HDMA[3].settings			;$B5D946   |
	LDX #$804E				;$B5D949   |
	STX HDMA[3].source			;$B5D94C   |
	LDA #$7E				;$B5D94F   |
	STA HDMA[3].source_bank			;$B5D951   |
	STZ HDMA[3].indirect_source_bank	;$B5D954   |
	LDX #$1102				;$B5D957   |
	STX HDMA[4].settings			;$B5D95A   |
	LDX #$8135				;$B5D95D   |
	STX HDMA[4].source			;$B5D960   |
	LDA #$7E				;$B5D963   |
	STA HDMA[4].source_bank			;$B5D965   |
	STZ HDMA[4].indirect_source_bank	;$B5D968   |
	REP #$20				;$B5D96B   |
	RTS					;$B5D96D  /

CODE_B5D96E:
	LDA.l $0006A3				;$B5D96E  \
	BIT #$1000				;$B5D972   |
	BEQ CODE_B5D988				;$B5D975   |
	LDY #$011A				;$B5D977   |
	JSL CODE_BB8412				;$B5D97A   |
	LDX alternate_sprite			;$B5D97E   |
	STX $0593				;$B5D980   |
	STZ $0597				;$B5D983   |
	BRA CODE_B5D9BD				;$B5D986  /

CODE_B5D988:
	LDA $08A4				;$B5D988  \
	BNE CODE_B5D99C				;$B5D98B   |
	JSR CODE_B5D9BE				;$B5D98D   |
	STX $0597				;$B5D990   |
	JSR CODE_B5D9CE				;$B5D993   |
	INC $02,x				;$B5D996   |
	INC $02,x				;$B5D998   |
	BRA CODE_B5D9A9				;$B5D99A  /

CODE_B5D99C:
	JSR CODE_B5D9CE				;$B5D99C  \
	STX $0597				;$B5D99F   |
	JSR CODE_B5D9BE				;$B5D9A2   |
	INC $02,x				;$B5D9A5   |
	INC $02,x				;$B5D9A7   |
CODE_B5D9A9:					;	   |
	STX $0593				;$B5D9A9   |
	LDA $08C2				;$B5D9AC   |
	BIT #$4000				;$B5D9AF   |
	BNE CODE_B5D9BD				;$B5D9B2   |
	LDY $0597				;$B5D9B4   |
	LDA #$C000				;$B5D9B7   |
	STA $001C,y				;$B5D9BA   |
CODE_B5D9BD:					;	   |
	RTS					;$B5D9BD  /

CODE_B5D9BE:
	LDY #$0144				;$B5D9BE  \
	JSL CODE_BB8412				;$B5D9C1   |
	LDX alternate_sprite			;$B5D9C5   |
	LDA $12,x				;$B5D9C7   |
	STA $000790				;$B5D9C9   |
	RTS					;$B5D9CD  /

CODE_B5D9CE:
	LDY #$0146				;$B5D9CE  \
	JSL CODE_BB8412				;$B5D9D1   |
	LDX alternate_sprite			;$B5D9D5   |
	LDA $12,x				;$B5D9D7   |
	STA $000790				;$B5D9D9   |
	RTS					;$B5D9DD  /

DATA_B5D9DE:
	db $00, $06, $0C, $12, $19, $1F, $25, $2B
	db $31, $38, $3E, $44, $4A, $50, $56, $5C
	db $61, $67, $6D, $73, $78, $7E, $83, $88
	db $8E, $93, $98, $9D, $A2, $A7, $AB, $B0
	db $B5, $B9, $BD, $C1, $C5, $C9, $CD, $D1
	db $D4, $D8, $DB, $DE, $E1, $E4, $E7, $EA
	db $EC, $EE, $F1, $F3, $F4, $F6, $F8, $F9
	db $FB, $FC, $FD, $FE, $FE, $FF, $FF, $FF

CODE_B5DA1E:
	BIT #$0080				;$B5DA1E  \
	PHP					;$B5DA21   |
	BIT #$0040				;$B5DA22   |
	BEQ CODE_B5DA2A				;$B5DA25   |
	EOR #$003F				;$B5DA27   |
CODE_B5DA2A:					;	   |
	AND #$003F				;$B5DA2A   |
	TAX					;$B5DA2D   |
	LDA.l DATA_B5D9DE,x			;$B5DA2E   |
	AND #$00FF				;$B5DA32   |
	PLP					;$B5DA35   |
	BEQ CODE_B5DA3C				;$B5DA36   |
	EOR #$FFFF				;$B5DA38   |
	INC A					;$B5DA3B   |
CODE_B5DA3C:					;	   |
	RTS					;$B5DA3C  /

CODE_B5DA3D:
	LDA $08FC				;$B5DA3D  \
	BIT #$0002				;$B5DA40   |
	BEQ CODE_B5DA48				;$B5DA43   |
	JSR CODE_B5DCBB				;$B5DA45   |
CODE_B5DA48:					;	   |
	LDA global_frame_counter		;$B5DA48   |
	AND #$001C				;$B5DA4A   |
	CLC					;$B5DA4D   |
	ADC #$0B98				;$B5DA4E   |
	STA $1206				;$B5DA51   |
	STA $1264				;$B5DA54   |
	STA $1260				;$B5DA57   |
	STA $12C2				;$B5DA5A   |
	STA $1320				;$B5DA5D   |
	STA $131C				;$B5DA60   |
	LDA #$000A				;$B5DA63   |
	STA $34					;$B5DA66   |
	LDY #$0F5A				;$B5DA68   |
CODE_B5DA6B:					;	   |
	CPY #$0F5A				;$B5DA6B   |
	BEQ CODE_B5DA8C				;$B5DA6E   |
	CPY #$0FB8				;$B5DA70   |
	BEQ CODE_B5DA7F				;$B5DA73   |
	LDA global_frame_counter		;$B5DA75   |
	LSR A					;$B5DA77   |
	LSR A					;$B5DA78   |
	LSR A					;$B5DA79   |
	CLC					;$B5DA7A   |
	ADC global_frame_counter		;$B5DA7B   |
	BRA CODE_B5DA8E				;$B5DA7D  /

CODE_B5DA7F:
	LDA global_frame_counter		;$B5DA7F  \
	LSR A					;$B5DA81   |
	LSR A					;$B5DA82   |
	SEC					;$B5DA83   |
	SBC global_frame_counter		;$B5DA84   |
	CLC					;$B5DA86   |
	ADC #$0020				;$B5DA87   |
	BRA CODE_B5DA8E				;$B5DA8A  /

CODE_B5DA8C:
	LDA global_frame_counter		;$B5DA8C  \
CODE_B5DA8E:					;	   |
	STA $54					;$B5DA8E   |
	LDA $54					;$B5DA90   |
	AND #$007C				;$B5DA92   |
	CLC					;$B5DA95   |
	ADC #$0BB8				;$B5DA96   |
	STA $001A,y				;$B5DA99   |
	SEC					;$B5DA9C   |
	LDX #$2000				;$B5DA9D   |
	SBC #$0BD8				;$B5DAA0   |
	CMP #$0040				;$B5DAA3   |
	BCC CODE_B5DAAB				;$B5DAA6   |
	LDX #$3000				;$B5DAA8   |
CODE_B5DAAB:					;	   |
	TXA					;$B5DAAB   |
	EOR $0012,y				;$B5DAAC   |
	AND #$3000				;$B5DAAF   |
	EOR $0012,y				;$B5DAB2   |
	STA $0012,y				;$B5DAB5   |
	LDA $001A,y				;$B5DAB8   |
	SEC					;$B5DABB   |
	SBC #$0C18				;$B5DABC   |
	LDX #$4000				;$B5DABF   |
	CMP #$0040				;$B5DAC2   |
	BCC CODE_B5DACA				;$B5DAC5   |
	LDX #$0000				;$B5DAC7   |
CODE_B5DACA:					;	   |
	TXA					;$B5DACA   |
	EOR $0012,y				;$B5DACB   |
	AND #$4000				;$B5DACE   |
	EOR $0012,y				;$B5DAD1   |
	LDA $54					;$B5DAD4   |
	ASL A					;$B5DAD6   |
	JSR CODE_B5DA1E				;$B5DAD7   |
	CMP #$8000				;$B5DADA   |
	ROR A					;$B5DADD   |
	CMP #$8000				;$B5DADE   |
	ROR A					;$B5DAE1   |
	CPY #$000E				;$B5DAE2   |
	BNE CODE_B5DAEB				;$B5DAE5   |
	CMP #$8000				;$B5DAE7   |
	ROR A					;$B5DAEA   |
CODE_B5DAEB:					;	   |
	CLC					;$B5DAEB   |
	ADC #$0068				;$B5DAEC   |
	STA $32					;$B5DAEF   |
	LDA $34					;$B5DAF1   |
	AND #$0006				;$B5DAF3   |
	ASL A					;$B5DAF6   |
	ASL A					;$B5DAF7   |
	CLC					;$B5DAF8   |
	ADC $32					;$B5DAF9   |
	STA $0006,y				;$B5DAFB   |
	LDA $54					;$B5DAFE   |
	LSR A					;$B5DB00   |
	LSR A					;$B5DB01   |
	CLC					;$B5DB02   |
	ADC global_frame_counter		;$B5DB03   |
	CLC					;$B5DB05   |
	ADC #$0020				;$B5DB06   |
	ASL A					;$B5DB09   |
	JSR CODE_B5DA1E				;$B5DB0A   |
	CMP #$8000				;$B5DB0D   |
	ROR A					;$B5DB10   |
	CMP #$8000				;$B5DB11   |
	ROR A					;$B5DB14   |
	CMP #$8000				;$B5DB15   |
	ROR A					;$B5DB18   |
	STA $32					;$B5DB19   |
	LDA $34					;$B5DB1B   |
	SEC					;$B5DB1D   |
	SBC #$000A				;$B5DB1E   |
	ASL A					;$B5DB21   |
	ASL A					;$B5DB22   |
	ASL A					;$B5DB23   |
	ASL A					;$B5DB24   |
	EOR #$FFFF				;$B5DB25   |
	CLC					;$B5DB28   |
	ADC #$0080				;$B5DB29   |
	ADC $32					;$B5DB2C   |
	STA $000A,y				;$B5DB2E   |
	INC $34					;$B5DB31   |
	INC $34					;$B5DB33   |
	TYA					;$B5DB35   |
	CLC					;$B5DB36   |
	ADC #$005E				;$B5DB37   |
	TAY					;$B5DB3A   |
	CPY #$1074				;$B5DB3B   |
	BEQ CODE_B5DB43				;$B5DB3E   |
	JMP CODE_B5DA6B				;$B5DB40  /

CODE_B5DB43:
	LDA global_frame_counter		;$B5DB43  \
	BIT #$0001				;$B5DB45   |
	BEQ CODE_B5DB5C				;$B5DB48   |
	LDA $11A8				;$B5DB4A   |
	SEC					;$B5DB4D   |
	SBC #$0004				;$B5DB4E   |
	CMP #$0C38				;$B5DB51   |
	BPL CODE_B5DB59				;$B5DB54   |
	LDA #$0C64				;$B5DB56   |
CODE_B5DB59:					;	   |
	STA $11A8				;$B5DB59   |
CODE_B5DB5C:					;	   |
	LDA #$0010				;$B5DB5C   |
	STA $36					;$B5DB5F   |
	LDY #$1074				;$B5DB61   |
CODE_B5DB64:					;	   |
	LDA $36					;$B5DB64   |
	STA $32					;$B5DB66   |
	ASL A					;$B5DB68   |
	ASL A					;$B5DB69   |
	ASL A					;$B5DB6A   |
	CLC					;$B5DB6B   |
	ADC $32					;$B5DB6C   |
	CLC					;$B5DB6E   |
	ADC global_frame_counter		;$B5DB6F   |
	STA $32					;$B5DB71   |
	ASL A					;$B5DB73   |
	AND #$001C				;$B5DB74   |
	CLC					;$B5DB77   |
	ADC #$0CE8				;$B5DB78   |
	STA $001A,y				;$B5DB7B   |
	LDA $32					;$B5DB7E   |
	ASL A					;$B5DB80   |
	JSR CODE_B5DA1E				;$B5DB81   |
	CMP #$8000				;$B5DB84   |
	ROR A					;$B5DB87   |
	CMP #$8000				;$B5DB88   |
	ROR A					;$B5DB8B   |
	CMP #$8000				;$B5DB8C   |
	ROR A					;$B5DB8F   |
	CMP #$8000				;$B5DB90   |
	ROR A					;$B5DB93   |
	CLC					;$B5DB94   |
	ADC #$0080				;$B5DB95   |
	STA $34					;$B5DB98   |
	LDA $36					;$B5DB9A   |
	SEC					;$B5DB9C   |
	SBC #$0010				;$B5DB9D   |
	ASL A					;$B5DBA0   |
	ASL A					;$B5DBA1   |
	ASL A					;$B5DBA2   |
	ASL A					;$B5DBA3   |
	CLC					;$B5DBA4   |
	ADC $34					;$B5DBA5   |
	STA $0006,y				;$B5DBA7   |
	LDA $32					;$B5DBAA   |
	CLC					;$B5DBAC   |
	ADC #$003C				;$B5DBAD   |
	XBA					;$B5DBB0   |
	EOR $0012,y				;$B5DBB1   |
	AND #$4000				;$B5DBB4   |
	EOR $0012,y				;$B5DBB7   |
	STA $0012,y				;$B5DBBA   |
	LDA $32					;$B5DBBD   |
	AND #$003C				;$B5DBBF   |
	CMP #$0008				;$B5DBC2   |
	BEQ CODE_B5DBCB				;$B5DBC5   |
	BCS CODE_B5DBD5				;$B5DBC7   |
	BRA CODE_B5DBCE				;$B5DBC9  /

CODE_B5DBCB:
	LDA #$0000				;$B5DBCB  \
CODE_B5DBCE:					;	   |
	CLC					;$B5DBCE   |
	ADC #$3120				;$B5DBCF   |
	STA $001A,y				;$B5DBD2   |
CODE_B5DBD5:					;	   |
	LDA $32					;$B5DBD5   |
	SEC					;$B5DBD7   |
	SBC #$0040				;$B5DBD8   |
	JSR CODE_B5DA1E				;$B5DBDB   |
	CMP #$8000				;$B5DBDE   |
	ROR A					;$B5DBE1   |
	CMP #$8000				;$B5DBE2   |
	ROR A					;$B5DBE5   |
	CMP #$8000				;$B5DBE6   |
	ROR A					;$B5DBE9   |
	CMP #$8000				;$B5DBEA   |
	ROR A					;$B5DBED   |
	CMP #$8000				;$B5DBEE   |
	ROR A					;$B5DBF1   |
	CLC					;$B5DBF2   |
	ADC #$0140				;$B5DBF3   |
	STA $000A,y				;$B5DBF6   |
	INC $36					;$B5DBF9   |
	INC $36					;$B5DBFB   |
	TYA					;$B5DBFD   |
	CLC					;$B5DBFE   |
	ADC #$005E				;$B5DBFF   |
	TAY					;$B5DC02   |
	CPY #$118E				;$B5DC03   |
	BEQ CODE_B5DC0B				;$B5DC06   |
	JMP CODE_B5DB64				;$B5DC08  /

CODE_B5DC0B:
	LDX #$0000				;$B5DC0B  \
CODE_B5DC0E:					;	   |
	LDA global_frame_counter		;$B5DC0E   |
	AND #$0007				;$B5DC10   |
	BNE CODE_B5DC3D				;$B5DC13   |
	LDA $0D9E,x				;$B5DC15   |
	CLC					;$B5DC18   |
	ADC #$0004				;$B5DC19   |
	CMP #$0CA8				;$B5DC1C   |
	BNE CODE_B5DC32				;$B5DC1F   |
	LDA #$0190				;$B5DC21   |
	CPX #$0004				;$B5DC24   |
	BCC CODE_B5DC2C				;$B5DC27   |
	LDA #$0184				;$B5DC29   |
CODE_B5DC2C:					;	   |
	STA $0D8E,x				;$B5DC2C   |
	LDA #$0C68				;$B5DC2F   |
CODE_B5DC32:					;	   |
	CPX #$00BB				;$B5DC32   |
	BCC CODE_B5DC3A				;$B5DC35   |
	STA $0D9A,x				;$B5DC37   |
CODE_B5DC3A:					;	   |
	STA $0D9E,x				;$B5DC3A   |
CODE_B5DC3D:					;	   |
	STZ $34					;$B5DC3D   |
	SEC					;$B5DC3F   |
	LDA $0D8E,x				;$B5DC40   |
	SBC #$0130				;$B5DC43   |
	XBA					;$B5DC46   |
	ASL A					;$B5DC47   |
	ASL A					;$B5DC48   |
	ROL $34					;$B5DC49   |
	STA $32					;$B5DC4B   |
	LDA $0D8C,x				;$B5DC4D   |
	SEC					;$B5DC50   |
	SBC $32					;$B5DC51   |
	STA $0D8C,x				;$B5DC53   |
	LDA $0D8E,x				;$B5DC56   |
	SBC $34					;$B5DC59   |
	STA $0D8E,x				;$B5DC5B   |
	TXA					;$B5DC5E   |
	CLC					;$B5DC5F   |
	ADC #$005E				;$B5DC60   |
	TAX					;$B5DC63   |
	CPX #$0178				;$B5DC64   |
	BNE CODE_B5DC0E				;$B5DC67   |
	LDA global_frame_counter		;$B5DC69   |
	LSR A					;$B5DC6B   |
	CLC					;$B5DC6C   |
	ADC global_frame_counter		;$B5DC6D   |
	LSR A					;$B5DC6F   |
	LSR A					;$B5DC70   |
	LSR A					;$B5DC71   |
	AND #$0007				;$B5DC72   |
	BIT #$0004				;$B5DC75   |
	BEQ CODE_B5DC7D				;$B5DC78   |
	EOR #$0007				;$B5DC7A   |
CODE_B5DC7D:					;	   |
	STA $32					;$B5DC7D   |
	LDA global_frame_counter		;$B5DC7F   |
	LSR A					;$B5DC81   |
	LSR A					;$B5DC82   |
	LSR A					;$B5DC83   |
	AND #$0007				;$B5DC84   |
	BIT #$0004				;$B5DC87   |
	BEQ CODE_B5DC8F				;$B5DC8A   |
	EOR #$0007				;$B5DC8C   |
CODE_B5DC8F:					;	   |
	CLC					;$B5DC8F   |
	ADC $32					;$B5DC90   |
	CMP #$0006				;$B5DC92   |
	BNE CODE_B5DC9A				;$B5DC95   |
	LDA #$0005				;$B5DC97   |
CODE_B5DC9A:					;	   |
	STA $32					;$B5DC9A   |
	PEA $B57E				;$B5DC9C   |
	PLB					;$B5DC9F   |
	LDX #$0000				;$B5DCA0   |
	TXY					;$B5DCA3   |
CODE_B5DCA4:					;	   |
	LDA.l DATA_FD0B72,x			;$B5DCA4   |
	SEC					;$B5DCA8   |
	SBC $32					;$B5DCA9   |
	STA $8029,y				;$B5DCAB   |
	INY					;$B5DCAE   |
	INY					;$B5DCAF   |
	INY					;$B5DCB0   |
	INY					;$B5DCB1   |
	INX					;$B5DCB2   |
	INX					;$B5DCB3   |
	CPX #$000E				;$B5DCB4   |
	BNE CODE_B5DCA4				;$B5DCB7   |
	PLB					;$B5DCB9   |
	RTS					;$B5DCBA  /

CODE_B5DCBB:
	LDA $08FC				;$B5DCBB  \
	AND #$0003				;$B5DCBE   |
	CMP #$0003				;$B5DCC1   |
	BNE CODE_B5DCF4				;$B5DCC4   |
	LDX #$13C2				;$B5DCC6   |
	LDA $44,x				;$B5DCC9   |
	BEQ CODE_B5DCF4				;$B5DCCB   |
	LDX #$1364				;$B5DCCD   |
	LDA global_frame_counter		;$B5DCD0   |
	AND #$001C				;$B5DCD2   |
	BIT #$0010				;$B5DCD5   |
	BEQ CODE_B5DCDD				;$B5DCD8   |
	EOR #$001C				;$B5DCDA   |
CODE_B5DCDD:					;	   |
	CLC					;$B5DCDD   |
	ADC #$3154				;$B5DCDE   |
	STA $1A,x				;$B5DCE1   |
	LDA global_frame_counter		;$B5DCE3   |
	BIT #$0001				;$B5DCE5   |
	BNE CODE_B5DCF4				;$B5DCE8   |
	DEC $0A,x				;$B5DCEA   |
	BNE CODE_B5DCF4				;$B5DCEC   |
	LDA #$0001				;$B5DCEE   |
	TRB $08FC				;$B5DCF1   |
CODE_B5DCF4:					;	   |
	LDA $08FC				;$B5DCF4   |
	BIT #$0010				;$B5DCF7   |
	BNE CODE_B5DCFF				;$B5DCFA   |
	JMP CODE_B5DE9D				;$B5DCFC  /

CODE_B5DCFF:
	LDA global_frame_counter		;$B5DCFF  \
	CMP #$00F0				;$B5DD01   |
	BNE CODE_B5DD0D				;$B5DD04   |
	LDA #$0716				;$B5DD06   |
	JSL queue_sound_effect			;$B5DD09   |
CODE_B5DD0D:					;	   |
	LDA global_frame_counter		;$B5DD0D   |
	CMP #$0100				;$B5DD0F   |
	BNE CODE_B5DD1B				;$B5DD12   |
	LDA #$0716				;$B5DD14   |
	JSL queue_sound_effect			;$B5DD17   |
CODE_B5DD1B:					;	   |
	LDA global_frame_counter		;$B5DD1B   |
	CMP #$0125				;$B5DD1D   |
	BNE CODE_B5DD29				;$B5DD20   |
	LDA #$0716				;$B5DD22   |
	JSL queue_sound_effect			;$B5DD25   |
CODE_B5DD29:					;	   |
	LDA global_frame_counter		;$B5DD29   |
	CMP #$0130				;$B5DD2B   |
	BNE CODE_B5DD37				;$B5DD2E   |
	LDA #$0716				;$B5DD30   |
	JSL queue_sound_effect			;$B5DD33   |
CODE_B5DD37:					;	   |
	LDA global_frame_counter		;$B5DD37   |
	CMP #$0160				;$B5DD39   |
	BNE CODE_B5DD45				;$B5DD3C   |
	LDA #$0716				;$B5DD3E   |
	JSL queue_sound_effect			;$B5DD41   |
CODE_B5DD45:					;	   |
	LDA global_frame_counter		;$B5DD45   |
	CMP #$01A0				;$B5DD47   |
	BNE CODE_B5DD53				;$B5DD4A   |
	LDA #$810F				;$B5DD4C   |
	JSL CODE_808C2E				;$B5DD4F   |
CODE_B5DD53:					;	   |
	LDY #$0003				;$B5DD53   |
	LDX #$147E				;$B5DD56   |
CODE_B5DD59:					;	   |
	LDA $06,x				;$B5DD59   |
	SEC					;$B5DD5B   |
	SBC #$0070				;$B5DD5C   |
	CMP #$0038				;$B5DD5F   |
	BCS CODE_B5DD99				;$B5DD62   |
	LDA #$0000				;$B5DD64   |
	STA $24,x				;$B5DD67   |
	LDA $20,x				;$B5DD69   |
	BEQ CODE_B5DD7D				;$B5DD6B   |
	BPL CODE_B5DD75				;$B5DD6D   |
	CLC					;$B5DD6F   |
	ADC #$0020				;$B5DD70   |
	BRA CODE_B5DD79				;$B5DD73  /

CODE_B5DD75:
	SEC					;$B5DD75  \
	SBC #$0020				;$B5DD76   |
CODE_B5DD79:					;	   |
	STA $20,x				;$B5DD79   |
	BRA CODE_B5DD99				;$B5DD7B  /

CODE_B5DD7D:
	TYA					;$B5DD7D  \
	ASL A					;$B5DD7E   |
	CLC					;$B5DD7F   |
	ADC global_frame_counter		;$B5DD80   |
	BIT #$0001				;$B5DD82   |
	BNE CODE_B5DD99				;$B5DD85   |
	LSR A					;$B5DD87   |
	AND #$0003				;$B5DD88   |
	CMP #$0003				;$B5DD8B   |
	BNE CODE_B5DD93				;$B5DD8E   |
	LDA #$0001				;$B5DD90   |
CODE_B5DD93:					;	   |
	DEC A					;$B5DD93   |
	CLC					;$B5DD94   |
	ADC $06,x				;$B5DD95   |
	STA $06,x				;$B5DD97   |
CODE_B5DD99:					;	   |
	TXA					;$B5DD99   |
	CLC					;$B5DD9A   |
	ADC #$005E				;$B5DD9B   |
	TAX					;$B5DD9E   |
	DEY					;$B5DD9F   |
	BNE CODE_B5DD59				;$B5DDA0   |
	LDX #$147E				;$B5DDA2   |
	STX current_sprite			;$B5DDA5   |
	JSL CODE_B8CF7F				;$B5DDA7   |
	LDX #$14DC				;$B5DDAB   |
	STX current_sprite			;$B5DDAE   |
	JSL CODE_B8CF7F				;$B5DDB0   |
	LDX #$153A				;$B5DDB4   |
	STX current_sprite			;$B5DDB7   |
	JSL CODE_B8CF7F				;$B5DDB9   |
	LDX #$13C2				;$B5DDBD   |
	LDA $44,x				;$B5DDC0   |
	BNE CODE_B5DDC7				;$B5DDC2   |
	JMP CODE_B5DCFF				;$B5DDC4  /

CODE_B5DDC7:
	LDX #$1364				;$B5DDC7  \
	LDA global_frame_counter		;$B5DDCA   |
	AND #$001C				;$B5DDCC   |
	BIT #$0010				;$B5DDCF   |
	BEQ CODE_B5DDD7				;$B5DDD2   |
	EOR #$001C				;$B5DDD4   |
CODE_B5DDD7:					;	   |
	CLC					;$B5DDD7   |
	ADC #$3144				;$B5DDD8   |
	STA $1A,x				;$B5DDDB   |
	LDA $08FE				;$B5DDDD   |
	BNE CODE_B5DDE5				;$B5DDE0   |
	JMP CODE_B5DE70				;$B5DDE2  /

CODE_B5DDE5:
	CMP #$0001				;$B5DDE5  \
	BEQ CODE_B5DE51				;$B5DDE8   |
	CMP #$0002				;$B5DDEA   |
	BEQ CODE_B5DE28				;$B5DDED   |
	CMP #$0003				;$B5DDEF   |
	BEQ CODE_B5DDF7				;$B5DDF2   |
	JMP CODE_B5DE9D				;$B5DDF4  /

CODE_B5DDF7:
	LDA global_frame_counter		;$B5DDF7  \
	BIT #$0003				;$B5DDF9   |
	BNE CODE_B5DE12				;$B5DDFC   |
	LDA $15B2				;$B5DDFE   |
	BEQ CODE_B5DE12				;$B5DE01   |
	CLC					;$B5DE03   |
	ADC #$0004				;$B5DE04   |
	CMP #$34CC				;$B5DE07   |
	BNE CODE_B5DE0F				;$B5DE0A   |
	LDA #$0000				;$B5DE0C   |
CODE_B5DE0F:					;	   |
	STA $15B2				;$B5DE0F   |
CODE_B5DE12:					;	   |
	LDA global_frame_counter		;$B5DE12   |
	ASL A					;$B5DE14   |
	AND #$001C				;$B5DE15   |
	BIT #$0010				;$B5DE18   |
	BEQ CODE_B5DE20				;$B5DE1B   |
	EOR #$001C				;$B5DE1D   |
CODE_B5DE20:					;	   |
	CLC					;$B5DE20   |
	ADC #$34CC				;$B5DE21   |
	STA $1A,x				;$B5DE24   |
	BRA CODE_B5DE9D				;$B5DE26  /

CODE_B5DE28:
	LDA $0A,x				;$B5DE28  \
	CMP #$01D0				;$B5DE2A   |
	BCC CODE_B5DE8D				;$B5DE2D   |
	PHX					;$B5DE2F   |
	LDA #$055B				;$B5DE30   |
	JSL queue_sound_effect			;$B5DE33   |
	LDA #$065C				;$B5DE37   |
	JSL queue_sound_effect			;$B5DE3A   |
	PLX					;$B5DE3E   |
	INC $08FE				;$B5DE3F   |
	LDA #$0000				;$B5DE42   |
	STA $24,x				;$B5DE45   |
	STA $20,x				;$B5DE47   |
	LDA #$34AC				;$B5DE49   |
	STA $15B2				;$B5DE4C   |
	BRA CODE_B5DE9D				;$B5DE4F  /

CODE_B5DE51:
	LDA $0A,x				;$B5DE51  \
	CMP #$0140				;$B5DE53   |
	BCC CODE_B5DE8D				;$B5DE56   |
	PHX					;$B5DE58   |
	LDA #$055A				;$B5DE59   |
	JSL play_high_priority_sound		;$B5DE5C   |
	PLX					;$B5DE60   |
	INC $08FE				;$B5DE61   |
	LDA #$FF00				;$B5DE64   |
	STA $24,x				;$B5DE67   |
	LDA #$0100				;$B5DE69   |
	STA $20,x				;$B5DE6C   |
	BRA CODE_B5DE8D				;$B5DE6E  /

CODE_B5DE70:
	LDA $0A,x				;$B5DE70  \
	CMP #$00C0				;$B5DE72   |
	BCC CODE_B5DE8D				;$B5DE75   |
	PHX					;$B5DE77   |
	LDA #$055A				;$B5DE78   |
	JSL play_high_priority_sound		;$B5DE7B   |
	PLX					;$B5DE7F   |
	INC $08FE				;$B5DE80   |
	LDA #$FF00				;$B5DE83   |
	STA $24,x				;$B5DE86   |
	LDA #$FF00				;$B5DE88   |
	STA $20,x				;$B5DE8B   |
CODE_B5DE8D:					;	   |
	STX current_sprite			;$B5DE8D   |
	LDA $12,x				;$B5DE8F   |
	CLC					;$B5DE91   |
	LDA $24,x				;$B5DE92   |
	ADC #$001C				;$B5DE94   |
	STA $24,x				;$B5DE97   |
	JSL CODE_B8CF7F				;$B5DE99   |
CODE_B5DE9D:					;	   |
	LDX #$13C2				;$B5DE9D   |
	LDA $44,x				;$B5DEA0   |
	BEQ CODE_B5DEBC				;$B5DEA2   |
	LDA global_frame_counter		;$B5DEA4   |
	LSR A					;$B5DEA6   |
	LSR A					;$B5DEA7   |
	LSR A					;$B5DEA8   |
	LSR A					;$B5DEA9   |
	LSR A					;$B5DEAA   |
	AND #$0003				;$B5DEAB   |
	CMP #$0003				;$B5DEAE   |
	BNE CODE_B5DEB6				;$B5DEB1   |
	LDA #$0001				;$B5DEB3   |
CODE_B5DEB6:					;	   |
	CLC					;$B5DEB6   |
	ADC #$0091				;$B5DEB7   |
	BRA CODE_B5DEF2				;$B5DEBA  /

CODE_B5DEBC:
	LDA $06,x				;$B5DEBC  \
	SEC					;$B5DEBE   |
	SBC #$0090				;$B5DEBF   |
	CMP #$0003				;$B5DEC2   |
	BCS CODE_B5DECC				;$B5DEC5   |
	LDA #$0001				;$B5DEC7   |
	STA $44,x				;$B5DECA   |
CODE_B5DECC:					;	   |
	CMP #$0040				;$B5DECC   |
	BCC CODE_B5DED4				;$B5DECF   |
	LDA #$0040				;$B5DED1   |
CODE_B5DED4:					;	   |
	STZ $32					;$B5DED4   |
	LSR A					;$B5DED6   |
	ROR $32					;$B5DED7   |
	LSR A					;$B5DED9   |
	ROR $32					;$B5DEDA   |
	LSR A					;$B5DEDC   |
	ROR $32					;$B5DEDD   |
	LSR A					;$B5DEDF   |
	ROR $32					;$B5DEE0   |
	LSR A					;$B5DEE2   |
	ROR $32					;$B5DEE3   |
	STA $34					;$B5DEE5   |
	LDA $04,x				;$B5DEE7   |
	SEC					;$B5DEE9   |
	SBC $32					;$B5DEEA   |
	STA $04,x				;$B5DEEC   |
	LDA $06,x				;$B5DEEE   |
	SBC $34					;$B5DEF0   |
CODE_B5DEF2:					;	   |
	STA $06,x				;$B5DEF2   |
	SEC					;$B5DEF4   |
	SBC #$0006				;$B5DEF5   |
	STA $64,x				;$B5DEF8   |
	CMP #$00B0				;$B5DEFA   |
	BCS CODE_B5DF22				;$B5DEFD   |
	LDA $78,x				;$B5DEFF   |
	BNE CODE_B5DF0A				;$B5DF01   |
	STZ $A0,x				;$B5DF03   |
	LDA #$312C				;$B5DF05   |
	BRA CODE_B5DF20				;$B5DF08  /

CODE_B5DF0A:
	CMP #$3140				;$B5DF0A  \
	BEQ CODE_B5DF22				;$B5DF0D   |
	INC $A0,x				;$B5DF0F   |
	LDA $A0,x				;$B5DF11   |
	CMP #$0005				;$B5DF13   |
	BNE CODE_B5DF22				;$B5DF16   |
	STZ $A0,x				;$B5DF18   |
	LDA $78,x				;$B5DF1A   |
	CLC					;$B5DF1C   |
	ADC #$0004				;$B5DF1D   |
CODE_B5DF20:					;	   |
	STA $78,x				;$B5DF20   |
CODE_B5DF22:					;	   |
	LDA #$002D				;$B5DF22   |
	SEC					;$B5DF25   |
	SBC $0A,x				;$B5DF26   |
	STZ $32					;$B5DF28   |
	LSR A					;$B5DF2A   |
	ROR $32					;$B5DF2B   |
	LSR A					;$B5DF2D   |
	ROR $32					;$B5DF2E   |
	LSR A					;$B5DF30   |
	ROR $32					;$B5DF31   |
	LSR A					;$B5DF33   |
	ROR $32					;$B5DF34   |
	LSR A					;$B5DF36   |
	ROR $32					;$B5DF37   |
	STA $34					;$B5DF39   |
	LDA $08,x				;$B5DF3B   |
	CLC					;$B5DF3D   |
	ADC $32					;$B5DF3E   |
	STA $08,x				;$B5DF40   |
	LDA $0A,x				;$B5DF42   |
	ADC $34					;$B5DF44   |
	STA $0A,x				;$B5DF46   |
	CLC					;$B5DF48   |
	ADC #$0012				;$B5DF49   |
	STA $68,x				;$B5DF4C   |
	RTS					;$B5DF4E  /

CODE_B5DF4F:
	LDA global_frame_counter		;$B5DF4F  \
	LSR A					;$B5DF51   |
	LSR A					;$B5DF52   |
	STA $7E8136				;$B5DF53   |
	LDA #$0000				;$B5DF57   |
	STA $7E8139				;$B5DF5A   |
	LDA #DATA_FD0C50			;$B5DF5E   |
	LDX $17C0				;$B5DF61   |
	CPX #$0080				;$B5DF64   |
	BCS CODE_B5DF6C				;$B5DF67   |
	LDA #DATA_FD0CB0			;$B5DF69   |
CODE_B5DF6C:					;	   |
	LDX #$0004				;$B5DF6C   |
	LDY #$00A0				;$B5DF6F   |
	JSL DMA_palette				;$B5DF72   |
	LDX #$0000				;$B5DF76   |
	LDA global_frame_counter		;$B5DF79   |
	BIT #$0080				;$B5DF7B   |
	BEQ CODE_B5DF8A				;$B5DF7E   |
	AND #$004A				;$B5DF80   |
	BEQ CODE_B5DF92				;$B5DF83   |
	LDX #$0380				;$B5DF85   |
	BRA CODE_B5DF92				;$B5DF88  /

CODE_B5DF8A:
	AND #$0052				;$B5DF8A  \
	BNE CODE_B5DF92				;$B5DF8D   |
	LDX #$0380				;$B5DF8F   |
CODE_B5DF92:					;	   |
	TXA					;$B5DF92   |
	SEP #$20				;$B5DF93   |
	LDA #$4C				;$B5DF95   |
	STA PPU.cgram_address			;$B5DF97   |
	TXA					;$B5DF9A   |
	STA PPU.cgram_write			;$B5DF9B   |
	XBA					;$B5DF9E   |
	STA PPU.cgram_write			;$B5DF9F   |
	REP #$20				;$B5DFA2   |
	LDA global_frame_counter		;$B5DFA4   |
	JSR CODE_B5E054				;$B5DFA6   |
	LDA global_frame_counter		;$B5DFA9   |
	CLC					;$B5DFAB   |
	ADC #$0015				;$B5DFAC   |
	JSR CODE_B5E054				;$B5DFAF   |
	LDA global_frame_counter		;$B5DFB2   |
	CLC					;$B5DFB4   |
	ADC #$002B				;$B5DFB5   |
	JSR CODE_B5E054				;$B5DFB8   |
	SEP #$20				;$B5DFBB   |
	LDA #$31				;$B5DFBD   |
	STA PPU.cgram_address			;$B5DFBF   |
	LDX #$0000				;$B5DFC2   |
CODE_B5DFC5:					;	   |
	LDA.l DATA_FD0B72,x			;$B5DFC5   |
	STA PPU.cgram_write			;$B5DFC9   |
	INX					;$B5DFCC   |
	CPX #$0010				;$B5DFCD   |
	BNE CODE_B5DFC5				;$B5DFD0   |
	LDA $17C0				;$B5DFD2   |
	STA PPU.layer_1_scroll_y		;$B5DFD5   |
	STZ PPU.layer_1_scroll_y		;$B5DFD8   |
	STA PPU.layer_3_scroll_y		;$B5DFDB   |
	STZ PPU.layer_3_scroll_y		;$B5DFDE   |
	LDA global_frame_counter		;$B5DFE1   |
	LSR A					;$B5DFE3   |
	LSR A					;$B5DFE4   |
	AND #$07				;$B5DFE5   |
	CLC					;$B5DFE7   |
	ADC #$40				;$B5DFE8   |
	STA $7E804E				;$B5DFEA   |
	REP #$20				;$B5DFEE   |
	LDA #$1413				;$B5DFF0   |
	STA $7E8016				;$B5DFF3   |
	LDA $17C0				;$B5DFF7   |
	EOR #$00FF				;$B5DFFA   |
	CLC					;$B5DFFD   |
	ADC #$0019				;$B5DFFE   |
	STA $32					;$B5E001   |
	CMP #$007F				;$B5E003   |
	BCC CODE_B5E01F				;$B5E006   |
	CMP #$00C0				;$B5E008   |
	BCC CODE_B5E014				;$B5E00B   |
	LDA #$0413				;$B5E00D   |
	STA $7E8016				;$B5E010   |
CODE_B5E014:					;	   |
	LDA.l $7E8136				;$B5E014   |
	STA $7E8139				;$B5E018   |
	LDA #$007F				;$B5E01C   |
CODE_B5E01F:					;	   |
	SEP #$20				;$B5E01F   |
	STA $7E8012				;$B5E021   |
	CMP #$7F				;$B5E025   |
	BNE CODE_B5E02B				;$B5E027   |
	LDA #$00				;$B5E029   |
CODE_B5E02B:					;	   |
	STA $7E801C				;$B5E02B   |
	REP #$20				;$B5E02F   |
	LDA $32					;$B5E031   |
	SEC					;$B5E033   |
	SBC #$0018				;$B5E034   |
	STA $32					;$B5E037   |
	LDA global_frame_counter		;$B5E039   |
	LSR A					;$B5E03B   |
	LSR A					;$B5E03C   |
	AND #$0007				;$B5E03D   |
	CLC					;$B5E040   |
	ADC $32					;$B5E041   |
	CMP #$007F				;$B5E043   |
	BCC CODE_B5E04B				;$B5E046   |
	LDA #$007F				;$B5E048   |
CODE_B5E04B:					;	   |
	SEP #$20				;$B5E04B   |
	STA $7E804E				;$B5E04D   |
	REP #$20				;$B5E051   |
	RTS					;$B5E053  /

CODE_B5E054:
	STA $32					;$B5E054  \
	JSR CODE_B5E085				;$B5E056   |
	STA $34					;$B5E059   |
	LDA $32					;$B5E05B   |
	CLC					;$B5E05D   |
	ADC #$0015				;$B5E05E   |
	JSR CODE_B5E085				;$B5E061   |
	ASL A					;$B5E064   |
	ASL A					;$B5E065   |
	ASL A					;$B5E066   |
	ASL A					;$B5E067   |
	ASL A					;$B5E068   |
	TSB $34					;$B5E069   |
	LDA $32					;$B5E06B   |
	CLC					;$B5E06D   |
	ADC #$002B				;$B5E06E   |
	JSR CODE_B5E085				;$B5E071   |
	ASL A					;$B5E074   |
	ASL A					;$B5E075   |
	XBA					;$B5E076   |
	ORA $34					;$B5E077   |
	SEP #$20				;$B5E079   |
	STA PPU.cgram_write			;$B5E07B   |
	XBA					;$B5E07E   |
	STA PPU.cgram_write			;$B5E07F   |
	REP #$20				;$B5E082   |
	RTS					;$B5E084  /

CODE_B5E085:
	AND #$003F				;$B5E085  \
	SEC					;$B5E088   |
	SBC #$0010				;$B5E089   |
	BPL CODE_B5E092				;$B5E08C   |
	LDA #$0000				;$B5E08E   |
	RTS					;$B5E091  /

CODE_B5E092:
	STA $36					;$B5E092  \
	LSR A					;$B5E094   |
	CLC					;$B5E095   |
	ADC $36					;$B5E096   |
	BIT #$0020				;$B5E098   |
	BEQ CODE_B5E0A0				;$B5E09B   |
	EOR #$003F				;$B5E09D   |
CODE_B5E0A0:					;	   |
	RTS					;$B5E0A0  /

CODE_B5E0A1:
	PLX					;$B5E0A1  \
	INX					;$B5E0A2   |
	PHK					;$B5E0A3   |
	PLB					;$B5E0A4   |
	JSL clear_VRAM_wrapper			;$B5E0A5   |
	LDA $0000,x				;$B5E0A9   |
	AND #$00FF				;$B5E0AC   |
	PHX					;$B5E0AF   |
	JSL handle_VRAM_payload_wrapper		;$B5E0B0   |
	PLX					;$B5E0B4   |
	INX					;$B5E0B5   |
	LDA $0000,x				;$B5E0B6   |
	AND #$00FF				;$B5E0B9   |
	PHX					;$B5E0BC   |
	JSL set_PPU_registers_wrapper		;$B5E0BD   |
	PLX					;$B5E0C1   |
	INX					;$B5E0C2   |
	LDA $0000,x				;$B5E0C3   |
	PHX					;$B5E0C6   |
	LDY #$0000				;$B5E0C7   |
	LDX #$0040				;$B5E0CA   |
	JSL DMA_palette				;$B5E0CD   |
	PLX					;$B5E0D1   |
	INX					;$B5E0D2   |
	INX					;$B5E0D3   |
	LDA $0000,x				;$B5E0D4   |
	SEP #$20				;$B5E0D7   |
	STA nmi_submode				;$B5E0D9   |
	XBA					;$B5E0DB   |
	STA gameloop_submode			;$B5E0DC   |
	REP #$20				;$B5E0DE   |
	RTS					;$B5E0E0  /

DATA_B5E0E1:
	db $00


CODE_B5E0E2:
	PHB					;$B5E0E2  \
	LDA #DATA_B5E0E1			;$B5E0E3   |
	STA DMA[0].source			;$B5E0E6   |
	LDA.w #DATA_B5E0E1>>16			;$B5E0E9   |
	STA DMA[0].source_bank			;$B5E0EC   |
	LDA #$0800				;$B5E0EF   |
	STA DMA[0].size				;$B5E0F2   |
	LDA #$8D28				;$B5E0F5   |
	STA WRAM.address			;$B5E0F8   |
	SEP #$20				;$B5E0FB   |
	LDA #$7E				;$B5E0FD   |
	STA WRAM.bank				;$B5E0FF   |
	LDA #$80				;$B5E102   |
	STA DMA[0].destination			;$B5E104   |
	LDA #$08				;$B5E107   |
	STA DMA[0].settings			;$B5E109   |
	LDA #$01				;$B5E10C   |
	STA CPU.enable_dma			;$B5E10E   |
	REP #$20				;$B5E111   |
	STZ $0AFC				;$B5E113   |
	STZ $0AFE				;$B5E116   |
	JSL CODE_8088A8				;$B5E119   |
	ASL A					;$B5E11D   |
	TAX					;$B5E11E   |
	LDA.l DATA_FD934F,x			;$B5E11F   |
	STA $36					;$B5E123   |
	LDA.l DATA_FD934D,x			;$B5E125   |
	TAX					;$B5E129   |
	LDA $0AB4				;$B5E12A   |
	AND #$000F				;$B5E12D   |
	ASL A					;$B5E130   |
	ASL A					;$B5E131   |
	ASL A					;$B5E132   |
	TAY					;$B5E133   |
	PHK					;$B5E134   |
	PLB					;$B5E135   |
	LDA DATA_B5E389,y			;$B5E136   |
	STA $7E8E28				;$B5E139   |
	LDA DATA_B5E38B,y			;$B5E13D   |
	STA $7E9028				;$B5E140   |
	LDA #$0100				;$B5E144   |
	STA $7E8D28				;$B5E147   |
	STA $7E8F28				;$B5E14B   |
	LDA DATA_B5E38D,y			;$B5E14F   |
	STA $32					;$B5E152   |
	LDA DATA_B5E38F,y			;$B5E154   |
	STA $34					;$B5E157   |
	PEA $FD93				;$B5E159   |
	PLB					;$B5E15C   |
	PLB					;$B5E15D   |
	TXA					;$B5E15E   |
	LDX #$0000				;$B5E15F   |
	CMP $36					;$B5E162   |
	BCC CODE_B5E179				;$B5E164   |
	LDA.l $7E8E28				;$B5E166   |
	STA $000AFC				;$B5E16A   |
	LDA.l $7E9028				;$B5E16E   |
	STA $000AFE				;$B5E172   |
	BRL CODE_B5E2E9				;$B5E176  /

CODE_B5E179:
	LDY $32					;$B5E179  \
	BEQ CODE_B5E180				;$B5E17B   |
	BRL CODE_B5E274				;$B5E17D  /

CODE_B5E180:
	LDY $34					;$B5E180  \
	BNE CODE_B5E1FF				;$B5E182   |
CODE_B5E184:					;	   |
	TAY					;$B5E184   |
	INX					;$B5E185   |
	INX					;$B5E186   |
	LDA.w DATA_FD934D,y			;$B5E187   |
	AND #$000F				;$B5E18A   |
	EOR.w DATA_FD934F,y			;$B5E18D   |
	AND #$FF3F				;$B5E190   |
	EOR.w DATA_FD934F,y			;$B5E193   |
	STA $7E9128,x				;$B5E196   |
	LDA.w DATA_FD934D,y			;$B5E19A   |
	AND #$1FF0				;$B5E19D   |
	LSR A					;$B5E1A0   |
	ADC #$0100				;$B5E1A1   |
	STA $7E8D28,x				;$B5E1A4   |
	LDA.w DATA_FD934E,y			;$B5E1A8   |
	LSR A					;$B5E1AB   |
	AND #$1FF0				;$B5E1AC   |
	LSR A					;$B5E1AF   |
	ADC #$0100				;$B5E1B0   |
	STA $7E8F28,x				;$B5E1B3   |
	LDA.w DATA_FD9350,y			;$B5E1B7   |
	AND #$00FF				;$B5E1BA   |
	ASL A					;$B5E1BD   |
	ADC #$0020				;$B5E1BE   |
	ASL A					;$B5E1C1   |
	ASL A					;$B5E1C2   |
	ADC $7E8D28,x				;$B5E1C3   |
	STA $7E8E28,x				;$B5E1C7   |
	CMP $000AFC				;$B5E1CB   |
	BCC CODE_B5E1D5				;$B5E1CF   |
	STA $000AFC				;$B5E1D1   |
CODE_B5E1D5:					;	   |
	LDA.w DATA_FD9351,y			;$B5E1D5   |
	AND #$00FF				;$B5E1D8   |
	ASL A					;$B5E1DB   |
	ADC #$001C				;$B5E1DC   |
	ASL A					;$B5E1DF   |
	ASL A					;$B5E1E0   |
	ADC $7E8F28,x				;$B5E1E1   |
	STA $7E9028,x				;$B5E1E5   |
	CMP $000AFE				;$B5E1E9   |
	BCC CODE_B5E1F3				;$B5E1ED   |
	STA $000AFE				;$B5E1EF   |
CODE_B5E1F3:					;	   |
	TYA					;$B5E1F3   |
	CLC					;$B5E1F4   |
	ADC #$0005				;$B5E1F5   |
	CMP $36					;$B5E1F8   |
	BCC CODE_B5E184				;$B5E1FA   |
	BRL CODE_B5E2E9				;$B5E1FC  /

CODE_B5E1FF:
	TAY					;$B5E1FF  \
	INX					;$B5E200   |
	INX					;$B5E201   |
	LDA.w DATA_FD934D,y			;$B5E202   |
	AND #$000F				;$B5E205   |
	EOR.w DATA_FD934F,y			;$B5E208   |
	AND #$FF3F				;$B5E20B   |
	EOR.w DATA_FD934F,y			;$B5E20E   |
	STA $7E9128,x				;$B5E211   |
	LDA.w DATA_FD934D,y			;$B5E215   |
	AND #$FFF0				;$B5E218   |
	LSR A					;$B5E21B   |
	ADC #$0100				;$B5E21C   |
	STA $7E8D28,x				;$B5E21F   |
	LDA.w DATA_FD934F,y			;$B5E223   |
	AND #$003F				;$B5E226   |
	ASL A					;$B5E229   |
	ASL A					;$B5E22A   |
	ASL A					;$B5E22B   |
	ADC #$0100				;$B5E22C   |
	STA $7E8F28,x				;$B5E22F   |
	LDA.w DATA_FD9350,y			;$B5E233   |
	AND #$03FF				;$B5E236   |
	ASL A					;$B5E239   |
	ADC #$0020				;$B5E23A   |
	ASL A					;$B5E23D   |
	ASL A					;$B5E23E   |
	ADC $7E8D28,x				;$B5E23F   |
	STA $7E8E28,x				;$B5E243   |
	CMP $000AFC				;$B5E247   |
	BCC CODE_B5E251				;$B5E24B   |
	STA $000AFC				;$B5E24D   |
CODE_B5E251:					;	   |
	LDA.w DATA_FD9351,y			;$B5E251   |
	AND #$00FC				;$B5E254   |
	ASL A					;$B5E257   |
	ADC #$0108				;$B5E258   |
	STA $7E9028,x				;$B5E25B   |
	CMP $000AFE				;$B5E25F   |
	BCC CODE_B5E269				;$B5E263   |
	STA $000AFE				;$B5E265   |
CODE_B5E269:					;	   |
	TYA					;$B5E269   |
	CLC					;$B5E26A   |
	ADC #$0005				;$B5E26B   |
	CMP $36					;$B5E26E   |
	BCC CODE_B5E1FF				;$B5E270   |
	BRA CODE_B5E2E9				;$B5E272  /

CODE_B5E274:
	TAY					;$B5E274  \
	INX					;$B5E275   |
	INX					;$B5E276   |
	LDA.w DATA_FD934D,y			;$B5E277   |
	AND #$000F				;$B5E27A   |
	EOR.w DATA_FD9351,y			;$B5E27D   |
	AND #$FF3F				;$B5E280   |
	EOR.w DATA_FD9351,y			;$B5E283   |
	STA $7E9128,x				;$B5E286   |
	LDA.w DATA_FD934D,y			;$B5E28A   |
	AND $32					;$B5E28D   |
	LSR A					;$B5E28F   |
	ADC #$0100				;$B5E290   |
	STA $7E8D28,x				;$B5E293   |
	LDA.w DATA_FD934F,y			;$B5E297   |
	LSR A					;$B5E29A   |
	AND $32					;$B5E29B   |
	LSR A					;$B5E29D   |
	ADC #$0108				;$B5E29E   |
	STA $7E8E28,x				;$B5E2A1   |
	CMP $000AFC				;$B5E2A5   |
	BCC CODE_B5E2AF				;$B5E2A9   |
	STA $000AFC				;$B5E2AB   |
CODE_B5E2AF:					;	   |
	LDA.w DATA_FD934E,y			;$B5E2AF   |
	AND #$1FFC				;$B5E2B2   |
	%return(CODE_B5E2BB)			;$B5E2B5   |
	JMP ($0034)				;$B5E2B8  /

CODE_B5E2BB:
	ADC #$0100				;$B5E2BB  \
	STA $7E8F28,x				;$B5E2BE   |
	LDA.w DATA_FD9350,y			;$B5E2C2   |
	LSR A					;$B5E2C5   |
	AND #$1FFC				;$B5E2C6   |
	%return(CODE_B5E2CF)			;$B5E2C9   |
	JMP ($0034)				;$B5E2CC  /

CODE_B5E2CF:
	ADC #$0108				;$B5E2CF  \
	STA $7E9028,x				;$B5E2D2   |
	CMP $000AFE				;$B5E2D6   |
	BCC CODE_B5E2E0				;$B5E2DA   |
	STA $000AFE				;$B5E2DC   |
CODE_B5E2E0:					;	   |
	TYA					;$B5E2E0   |
	CLC					;$B5E2E1   |
	ADC #$0005				;$B5E2E2   |
	CMP $36					;$B5E2E5   |
	BCC CODE_B5E274				;$B5E2E7   |
CODE_B5E2E9:					;	   |
	PEA $7E8D				;$B5E2E9   |
	PLB					;$B5E2EC   |
	PLB					;$B5E2ED   |
	STX $0ABA				;$B5E2EE   |
	LDX #$0000				;$B5E2F1   |
CODE_B5E2F4:					;	   |
	CPX $0ABA				;$B5E2F4   |
	BCS CODE_B5E354				;$B5E2F7   |
	INX					;$B5E2F9   |
	INX					;$B5E2FA   |
CODE_B5E2FB:					;	   |
	TXY					;$B5E2FB   |
	LDA $9128,x				;$B5E2FC   |
	AND #$000F				;$B5E2FF   |
	BEQ CODE_B5E2F4				;$B5E302   |
	AND #$000C				;$B5E304   |
	BEQ CODE_B5E32C				;$B5E307   |
	CMP #$0004				;$B5E309   |
	BEQ CODE_B5E327				;$B5E30C   |
	JSR CODE_B5E3DB				;$B5E30E   |
	LDA $922A,y				;$B5E311   |
	BNE CODE_B5E31D				;$B5E314   |
	TXA					;$B5E316   |
	LSR A					;$B5E317   |
	STA $922A,y				;$B5E318   |
	BRA CODE_B5E339				;$B5E31B  /

CODE_B5E31D:
	TXA					;$B5E31D  \
	LSR A					;$B5E31E   |
	ORA $922B,y				;$B5E31F   |
	STA $922B,y				;$B5E322   |
	BRA CODE_B5E339				;$B5E325  /

CODE_B5E327:
	JSR CODE_B5E3DB				;$B5E327  \
	BRA CODE_B5E339				;$B5E32A  /

CODE_B5E32C:
	LDA $8E28,x				;$B5E32C  \
	DEC A					;$B5E32F   |
CODE_B5E330:					;	   |
	INY					;$B5E330   |
	INY					;$B5E331   |
	CMP $8D28,y				;$B5E332   |
	BCS CODE_B5E330				;$B5E335   |
	BRA CODE_B5E339				;$B5E337  /

CODE_B5E339:
	LDA $9128,x				;$B5E339  \
	AND #$0003				;$B5E33C   |
	BEQ CODE_B5E34A				;$B5E33F   |
	DEC A					;$B5E341   |
	BEQ CODE_B5E347				;$B5E342   |
	JSR CODE_B5E411				;$B5E344   |
CODE_B5E347:					;	   |
	JSR CODE_B5E411				;$B5E347   |
CODE_B5E34A:					;	   |
	INX					;$B5E34A   |
	INX					;$B5E34B   |
	TXY					;$B5E34C   |
	CPX $0ABA				;$B5E34D   |
	BCC CODE_B5E2FB				;$B5E350   |
	BEQ CODE_B5E339				;$B5E352   |
CODE_B5E354:					;	   |
	STZ $0A90				;$B5E354   |
	STZ $0AB2				;$B5E357   |
	STZ $0ABC				;$B5E35A   |
	STZ $0AE8				;$B5E35D   |
	STZ $0AEE				;$B5E360   |
	STZ $0AF2				;$B5E363   |
	LDA $054D				;$B5E366   |
	STA $0AB6				;$B5E369   |
	LDA $0AFC				;$B5E36C   |
	SEC					;$B5E36F   |
	SBC #$0100				;$B5E370   |
	STA $0AFC				;$B5E373   |
	LDA $0AFE				;$B5E376   |
	SEC					;$B5E379   |
	SBC #$00E0				;$B5E37A   |
	STA $0AFE				;$B5E37D   |
	JSL CODE_B5E43E				;$B5E380   |
	JSR CODE_B5E4AA				;$B5E384   |
	PLB					;$B5E387   |
	RTL					;$B5E388  /

DATA_B5E389:
	%offset(DATA_B5E38B, 2)
	%offset(DATA_B5E38D, 4)
	%offset(DATA_B5E38F, 6)
	db $00, $41, $00, $03, $F0, $7F : dw CODE_B5E3D1
	db $00, $21, $00, $05, $F0, $3F : dw CODE_B5E3D2
	db $00, $11, $00, $09, $F0, $1F : dw CODE_B5E3D3
	db $00, $09, $00, $11, $F0, $0F : dw CODE_B5E3D4
	db $00, $05, $00, $21, $F0, $07 : dw CODE_B5E3D5
	db $00, $03, $00, $41, $F0, $03 : dw CODE_B5E3D6

DATA_B5E3B9:
	db $00, $0D, $00, $0B, $00, $00, $00, $00
	db $00, $0B, $00, $0D, $00, $00, $00, $00
	db $00, $80, $00, $03, $00, $00, $01, $00

CODE_B5E3D1:
	LSR A					;$B5E3D1  \
CODE_B5E3D2:					;	   |
	LSR A					;$B5E3D2   |
CODE_B5E3D3:					;	   |
	LSR A					;$B5E3D3   |
CODE_B5E3D4:					;	   |
	LSR A					;$B5E3D4   |
CODE_B5E3D5:					;	   |
	LSR A					;$B5E3D5   |
CODE_B5E3D6:					;	   |
	AND #$1FFC				;$B5E3D6   |
	ASL A					;$B5E3D9   |
	RTS					;$B5E3DA  /

CODE_B5E3DB:
	LDA $8E28,x				;$B5E3DB  \
CODE_B5E3DE:					;	   |
	INY					;$B5E3DE   |
	INY					;$B5E3DF   |
	CMP $8D28,y				;$B5E3E0   |
	BNE CODE_B5E3DE				;$B5E3E3   |
	LDA $8F28,x				;$B5E3E5   |
	CMP $9028,y				;$B5E3E8   |
	BCS CODE_B5E3DB				;$B5E3EB   |
	LDA $8F28,y				;$B5E3ED   |
	CMP $9028,x				;$B5E3F0   |
	BCS CODE_B5E3DB				;$B5E3F3   |
	TYA					;$B5E3F5   |
	LSR A					;$B5E3F6   |
	ORA $9129,x				;$B5E3F7   |
	STA $9129,x				;$B5E3FA   |
	LDA $9228,y				;$B5E3FD   |
	BNE CODE_B5E408				;$B5E400   |
	TXA					;$B5E402   |
	LSR A					;$B5E403   |
	STA $9228,y				;$B5E404   |
	RTS					;$B5E407  /

CODE_B5E408:
	TXA					;$B5E408  \
	LSR A					;$B5E409   |
	ORA $9229,y				;$B5E40A   |
	STA $9229,y				;$B5E40D   |
	RTS					;$B5E410  /

CODE_B5E411:
	LDA $9028,x				;$B5E411  \
CODE_B5E414:					;	   |
	DEY					;$B5E414   |
	DEY					;$B5E415   |
	CMP $8F28,y				;$B5E416   |
	BNE CODE_B5E414				;$B5E419   |
	LDA $9428,x				;$B5E41B   |
	BEQ CODE_B5E424				;$B5E41E   |
	XBA					;$B5E420   |
	STA $9428,x				;$B5E421   |
CODE_B5E424:					;	   |
	TYA					;$B5E424   |
	LSR A					;$B5E425   |
	ORA $9428,x				;$B5E426   |
	STA $9428,x				;$B5E429   |
	LDA $9328,y				;$B5E42C   |
	BEQ CODE_B5E435				;$B5E42F   |
	XBA					;$B5E431   |
	STA $9328,y				;$B5E432   |
CODE_B5E435:					;	   |
	TXA					;$B5E435   |
	LSR A					;$B5E436   |
	ORA $9328,y				;$B5E437   |
	STA $9328,y				;$B5E43A   |
	RTS					;$B5E43D  /

CODE_B5E43E:
	LDA current_player_mount		;$B5E43E  \
	ORA $6E					;$B5E440   |
	CMP #$0001				;$B5E442   |
	LDA $0AB6				;$B5E445   |
	BCC CODE_B5E44B				;$B5E448   |
	XBA					;$B5E44A   |
CODE_B5E44B:					;	   |
	AND #$00FF				;$B5E44B   |
	ASL A					;$B5E44E   |
	ASL A					;$B5E44F   |
	ASL A					;$B5E450   |
	TAX					;$B5E451   |
	LDA.l DATA_FD470D,x			;$B5E452   |
	AND #$FF00				;$B5E456   |
	STA $0AEA				;$B5E459   |
	LDA.l DATA_FD470E,x			;$B5E45C   |
	AND #$FF00				;$B5E460   |
	STA $0AEC				;$B5E463   |
	LDA.l DATA_FD470F,x			;$B5E466   |
	AND #$FF00				;$B5E46A   |
	STA $0AF0				;$B5E46D   |
	LDA.l DATA_FD4710,x			;$B5E470   |
	AND #$FF00				;$B5E474   |
	STA $0AF4				;$B5E477   |
	LDA.l DATA_FD4712,x			;$B5E47A   |
	AND #$0F0F				;$B5E47E   |
	STA $0AC8				;$B5E481   |
	EOR.l DATA_FD4712,x			;$B5E484   |
	LSR A					;$B5E488   |
	LSR A					;$B5E489   |
	LSR A					;$B5E48A   |
	LSR A					;$B5E48B   |
	STA $0ACC				;$B5E48C   |
	LDA.l DATA_FD4714,x			;$B5E48F   |
	AND #$00FF				;$B5E493   |
	ASL A					;$B5E496   |
	ASL A					;$B5E497   |
	ASL A					;$B5E498   |
	STA $0AC6				;$B5E499   |
	LDA.l DATA_FD4715,x			;$B5E49C   |
	AND #$00FF				;$B5E4A0   |
	ASL A					;$B5E4A3   |
	ASL A					;$B5E4A4   |
	ASL A					;$B5E4A5   |
	STA $0ACA				;$B5E4A6   |
	RTL					;$B5E4A9  /

CODE_B5E4AA:
	LDX $0593				;$B5E4AA  \
	LDY #$0000				;$B5E4AD   |
	LDA $0550				;$B5E4B0   |
	BIT #$0030				;$B5E4B3   |
	BEQ CODE_B5E4C3				;$B5E4B6   |
	LDY #$0080				;$B5E4B8   |
	BIT #$0010				;$B5E4BB   |
	BNE CODE_B5E4C3				;$B5E4BE   |
	LDY #$FF80				;$B5E4C0   |
CODE_B5E4C3:					;	   |
	LDA #$0000				;$B5E4C3   |
	STA $0D88				;$B5E4C6   |
	TYA					;$B5E4C9   |
	CLC					;$B5E4CA   |
	ADC $06,x				;$B5E4CB   |
	STA $0D8A				;$B5E4CD   |
	LDY #$0000				;$B5E4D0   |
	LDA $0550				;$B5E4D3   |
	BIT #$00C0				;$B5E4D6   |
	BEQ CODE_B5E4E6				;$B5E4D9   |
	LDY #$0080				;$B5E4DB   |
	BIT #$0040				;$B5E4DE   |
	BNE CODE_B5E4E6				;$B5E4E1   |
	LDY #$FF80				;$B5E4E3   |
CODE_B5E4E6:					;	   |
	LDA #$0000				;$B5E4E6   |
	STA $0D8C				;$B5E4E9   |
	TYA					;$B5E4EC   |
	CLC					;$B5E4ED   |
	ADC $0A,x				;$B5E4EE   |
	STA $0D8E				;$B5E4F0   |
	LDY #$0D84				;$B5E4F3   |
	JSR CODE_B5E560				;$B5E4F6   |
	PHD					;$B5E4F9   |
	LDA #$0A00				;$B5E4FA   |
	TCD					;$B5E4FD   |
	PHB					;$B5E4FE   |
	PEA $7E8D				;$B5E4FF   |
	PLB					;$B5E502   |
	PLB					;$B5E503   |
	JSR CODE_B5ED3A				;$B5E504   |
	PLB					;$B5E507   |
	PLD					;$B5E508   |
	STX $0ABC				;$B5E509   |
	RTS					;$B5E50C  /

CODE_B5E50D:					;	  \
if !version == 0				;	   |
	LDA $0ABE				;$B5E50D   |
	STA $0A9A				;$B5E510   |
	LDA $0AC0				;$B5E513   |
	STA $0A9C				;$B5E516   |
	LDA $0AC2				;$B5E519   |
	STA $0AC2				;$B5E51C   |
	LDA $0AC4				;$B5E51F   |
	STA $0AC4				;$B5E522   |
	LDA $0ADE				;$B5E525   |
	STA $0AA2				;$B5E528   |
	LDA $0AE0				;$B5E52B   |
	STA $0AA4				;$B5E52E   |
	LDA $0AE2				;$B5E531   |
	STA $0AA6				;$B5E534   |
	LDA $0AE4				;$B5E537   |
	STA $0AA8				;$B5E53A   |
else						;	   |
	LDA $0AC3				;$B5E50D   |
	STA $0A9E				;$B5E510   |
	LDA $0ADE				;$B5E513   |
	STA $0AA0				;$B5E516   |
	LDA $0AE0				;$B5E519   |
	STA $0AA2				;$B5E51C   |
	LDA $0AE2				;$B5E51F   |
	STA $0AA4				;$B5E522   |
	LDA $0AE4				;$B5E525   |
	STA $0AA6				;$B5E528   |
endif						;	   |
	LDY $0AE8				;$B5E52B   |
	BNE CODE_B5E533				;$B5E52E   |
	LDY $0593				;$B5E530   |
CODE_B5E533:					;	   |
	JSR CODE_B5E560				;$B5E533   |
	PHD					;$B5E536   |
	LDA #$0A00				;$B5E537   |
	TCD					;$B5E53A   |
	PHB					;$B5E53B   |
	PEA $7E8D				;$B5E53C   |
	PLB					;$B5E53F   |
	PLB					;$B5E540   |
	LDA $054F				;$B5E541   |
	AND #$000F				;$B5E544   |
	ASL A					;$B5E547   |
	TAX					;$B5E548   |
	JSR (DATA_B5E5AE,x)			;$B5E549   |
	LDA $054F				;$B5E54C   |
	AND #$000F				;$B5E54F   |
	ASL A					;$B5E552   |
	TAX					;$B5E553   |
	JSR (DATA_B5E5B4,x)			;$B5E554   |
	JSR CODE_B5E7C5				;$B5E557   |
	JSR CODE_B5ED70				;$B5E55A   |
	PLB					;$B5E55D   |
	PLD					;$B5E55E   |
	RTL					;$B5E55F  /

CODE_B5E560:
	STY $0A98				;$B5E560  \
	STZ $0ABE				;$B5E563   |
	STZ $0AC0				;$B5E566   |
	LDA.l $7E8D28				;$B5E569   |
	CMP $0006,y				;$B5E56D   |
	BCS CODE_B5E585				;$B5E570   |
	LDA.l $7E8E28				;$B5E572   |
	DEC A					;$B5E576   |
	CMP $0006,y				;$B5E577   |
	BCC CODE_B5E585				;$B5E57A   |
	LDA $0005,y				;$B5E57C   |
	STA $0ABE				;$B5E57F   |
	LDA $0006,y				;$B5E582   |
CODE_B5E585:					;	   |
	STA $0ABF				;$B5E585   |
	STZ $0AC2				;$B5E588   |
	STZ $0AC4				;$B5E58B   |
	LDA.l $7E8F28				;$B5E58E   |
	CMP $000A,y				;$B5E592   |
	BCS CODE_B5E5AA				;$B5E595   |
	LDA.l $7E9028				;$B5E597   |
	DEC A					;$B5E59B   |
	CMP $000A,y				;$B5E59C   |
	BCC CODE_B5E5AA				;$B5E59F   |
	LDA $0009,y				;$B5E5A1   |
	STA $0AC2				;$B5E5A4   |
	LDA $000A,y				;$B5E5A7   |
CODE_B5E5AA:					;	   |
	STA $0AC3				;$B5E5AA   |
	RTS					;$B5E5AD  /

DATA_B5E5AE:
	dw CODE_B5E5BA
	dw CODE_B5E5FA
	dw CODE_B5E5BA

DATA_B5E5B4:
	dw CODE_B5E660
	dw CODE_B5E749
	dw CODE_B5E7B9


CODE_B5E5BA:
	LDA $B8					;$B5E5BA  \
	BMI CODE_B5E5C1				;$B5E5BC   |
	LDA $0012,y				;$B5E5BE   |
CODE_B5E5C1:					;	   |
	ASL A					;$B5E5C1   |
	ASL A					;$B5E5C2   |
	LDA #$8000				;$B5E5C3   |
	TRB $B8					;$B5E5C6   |
	LDA $EC					;$B5E5C8   |
	BCC CODE_B5E5CE				;$B5E5CA   |
	LDA $EA					;$B5E5CC   |
CODE_B5E5CE:					;	   |
	STA $92					;$B5E5CE   |
	STZ $94					;$B5E5D0   |
	LDA $EE					;$B5E5D2   |
	ASL A					;$B5E5D4   |
	BCC CODE_B5E5DA				;$B5E5D5   |
	DEC $94					;$B5E5D7   |
	CLC					;$B5E5D9   |
CODE_B5E5DA:					;	   |
	ADC $92					;$B5E5DA   |
	STA $92					;$B5E5DC   |
	LDA #$0000				;$B5E5DE   |
	ADC $94					;$B5E5E1   |
	STA $94					;$B5E5E3   |
	LDA $BE					;$B5E5E5   |
	SEC					;$B5E5E7   |
	SBC $92					;$B5E5E8   |
	STA $DE					;$B5E5EA   |
	LDA $C0					;$B5E5EC   |
	SBC $94					;$B5E5EE   |
	BMI CODE_B5E5F5				;$B5E5F0   |
	STA $E0					;$B5E5F2   |
	RTS					;$B5E5F4  /

CODE_B5E5F5:
	STZ $DE					;$B5E5F5  \
	STZ $E0					;$B5E5F7   |
	RTS					;$B5E5F9  /

CODE_B5E5FA:
	LDA.l $00002A				;$B5E5FA  \
	LSR A					;$B5E5FE   |
	LSR A					;$B5E5FF   |
	AND #$003E				;$B5E600   |
	TAX					;$B5E603   |
	LDA $BE					;$B5E604   |
	PHA					;$B5E606   |
	SEC					;$B5E607   |
	SBC.l DATA_B5E620,x			;$B5E608   |
	STA $BE					;$B5E60C   |
	LDA $C0					;$B5E60E   |
	PHA					;$B5E610   |
	SBC #$0000				;$B5E611   |
	STA $C0					;$B5E614   |
	JSR CODE_B5E5BA				;$B5E616   |
	PLA					;$B5E619   |
	STA $C0					;$B5E61A   |
	PLA					;$B5E61C   |
	STA $BE					;$B5E61D   |
	RTS					;$B5E61F  /

DATA_B5E620:
	db $00, $00, $00, $01, $00, $02, $00, $03
	db $00, $04, $00, $05, $00, $06, $00, $07
	db $00, $08, $00, $09, $00, $0A, $00, $0B
	db $00, $0C, $00, $0D, $00, $0E, $00, $0F
	db $00, $0F, $00, $0E, $00, $0D, $00, $0C
	db $00, $0B, $00, $0A, $00, $09, $00, $08
	db $00, $07, $00, $06, $00, $05, $00, $04
	db $00, $03, $00, $02, $00, $01, $00, $00

CODE_B5E660:
	LDA $0D4E				;$B5E660  \
	BMI CODE_B5E66D				;$B5E663   |
	ADC #$0010				;$B5E665   |
	CMP $000A,y				;$B5E668   |
	BCC CODE_B5E689				;$B5E66B   |
CODE_B5E66D:					;	   |
	LDA.l $00006E				;$B5E66D   |
	CMP #$0198				;$B5E671   |
	BEQ CODE_B5E689				;$B5E674   |
	LDA $000E,y				;$B5E676   |
	BNE CODE_B5E682				;$B5E679   |
	LDA #$2000				;$B5E67B   |
	TRB $B8					;$B5E67E   |
	BRA CODE_B5E68C				;$B5E680  /

CODE_B5E682:
	LDA $B8					;$B5E682  \
	BIT #$2000				;$B5E684   |
	BEQ CODE_B5E68C				;$B5E687   |
CODE_B5E689:					;	   |
	JMP CODE_B5E7B9				;$B5E689  /

CODE_B5E68C:
	STZ $92					;$B5E68C  \
	STZ $94					;$B5E68E   |
	LDA $000E,y				;$B5E690   |
	BMI CODE_B5E69C				;$B5E693   |
	STA $93					;$B5E695   |
	JSR CODE_B5E72F				;$B5E697   |
	BRA CODE_B5E6F0				;$B5E69A  /

CODE_B5E69C:
	LDA #$0050				;$B5E69C  \
	STA $93					;$B5E69F   |
	JSR CODE_B5E72F				;$B5E6A1   |
	LDA $C2					;$B5E6A4   |
	SEC					;$B5E6A6   |
	SBC #$3800				;$B5E6A7   |
	STA $92					;$B5E6AA   |
	LDA $C4					;$B5E6AC   |
	SBC #$0000				;$B5E6AE   |
	BCC CODE_B5E6EB				;$B5E6B1   |
	STA $94					;$B5E6B3   |
	LDA $92					;$B5E6B5   |
	SEC					;$B5E6B7   |
	SBC $F4					;$B5E6B8   |
	STA $92					;$B5E6BA   |
	LDA $94					;$B5E6BC   |
	SBC #$0000				;$B5E6BE   |
	BCC CODE_B5E6EB				;$B5E6C1   |
	STA $94					;$B5E6C3   |
	LDA $93					;$B5E6C5   |
	CMP $E6					;$B5E6C7   |
	BCC CODE_B5E6E2				;$B5E6C9   |
	LDA $C2					;$B5E6CB   |
	SEC					;$B5E6CD   |
	SBC #$C800				;$B5E6CE   |
	STA $92					;$B5E6D1   |
	LDA $C4					;$B5E6D3   |
	SBC #$0000				;$B5E6D5   |
	BCC CODE_B5E6EB				;$B5E6D8   |
	STA $94					;$B5E6DA   |
	LDA $93					;$B5E6DC   |
	CMP $E6					;$B5E6DE   |
	BCC CODE_B5E6EF				;$B5E6E0   |
CODE_B5E6E2:					;	   |
	LDA $92					;$B5E6E2   |
	STA $E2					;$B5E6E4   |
	LDA $94					;$B5E6E6   |
	STA $E4					;$B5E6E8   |
	RTS					;$B5E6EA  /

CODE_B5E6EB:
	STZ $E2					;$B5E6EB  \
	STZ $E4					;$B5E6ED   |
CODE_B5E6EF:					;	   |
	RTS					;$B5E6EF  /

CODE_B5E6F0:
	LDA $C2					;$B5E6F0  \
	SEC					;$B5E6F2   |
	SBC $92					;$B5E6F3   |
	STA $E2					;$B5E6F5   |
	LDA $C4					;$B5E6F7   |
	SBC $94					;$B5E6F9   |
	STA $E4					;$B5E6FB   |
	JSR CODE_B5E705				;$B5E6FD   |
	LDA $E3					;$B5E700   |
	STA $E6					;$B5E702   |
	RTS					;$B5E704  /

CODE_B5E705:
	STZ $94					;$B5E705  \
	LDA $F2					;$B5E707   |
	ASL A					;$B5E709   |
	BCC CODE_B5E70F				;$B5E70A   |
	DEC $94					;$B5E70C   |
	CLC					;$B5E70E   |
CODE_B5E70F:					;	   |
	ADC $F0					;$B5E70F   |
	STA $92					;$B5E711   |
	LDA #$0000				;$B5E713   |
	ADC $94					;$B5E716   |
	STA $94					;$B5E718   |
	LDA $E2					;$B5E71A   |
	SEC					;$B5E71C   |
	SBC $92					;$B5E71D   |
	STA $E2					;$B5E71F   |
	LDA $E4					;$B5E721   |
	SBC $94					;$B5E723   |
	BMI CODE_B5E72A				;$B5E725   |
	STA $E4					;$B5E727   |
	RTS					;$B5E729  /

CODE_B5E72A:
	STZ $E2					;$B5E72A  \
	STZ $E4					;$B5E72C   |
	RTS					;$B5E72E  /

CODE_B5E72F:
	LDA $94					;$B5E72F  \
	EOR #$FFFF				;$B5E731   |
	STA $94					;$B5E734   |
	LDA $92					;$B5E736   |
	EOR #$FFFF				;$B5E738   |
	CLC					;$B5E73B   |
	ADC #$0001				;$B5E73C   |
	STA $92					;$B5E73F   |
	LDA #$0000				;$B5E741   |
	ADC $94					;$B5E744   |
	STA $94					;$B5E746   |
	RTS					;$B5E748  /

CODE_B5E749:
	LDA.l $00002A				;$B5E749  \
	LSR A					;$B5E74D   |
	CLC					;$B5E74E   |
	ADC $00002A				;$B5E74F   |
	CLC					;$B5E753   |
	ADC #$001F				;$B5E754   |
	LSR A					;$B5E757   |
	LSR A					;$B5E758   |
	AND #$003E				;$B5E759   |
	TAX					;$B5E75C   |
	LDA $C2					;$B5E75D   |
	PHA					;$B5E75F   |
	SEC					;$B5E760   |
	SBC.l DATA_B5E779,x			;$B5E761   |
	STA $C2					;$B5E765   |
	LDA $C4					;$B5E767   |
	PHA					;$B5E769   |
	SBC #$0000				;$B5E76A   |
	STA $C4					;$B5E76D   |
	JSR CODE_B5E660				;$B5E76F   |
	PLA					;$B5E772   |
	STA $C4					;$B5E773   |
	PLA					;$B5E775   |
	STA $C2					;$B5E776   |
	RTS					;$B5E778  /

DATA_B5E779:
	db $00, $00, $00, $01, $00, $02, $00, $03
	db $00, $04, $00, $05, $00, $06, $00, $07
	db $00, $08, $00, $09, $00, $0A, $00, $0B
	db $00, $0C, $00, $0D, $00, $0E, $00, $0F
	db $00, $0F, $00, $0E, $00, $0D, $00, $0C
	db $00, $0B, $00, $0A, $00, $09, $00, $08
	db $00, $07, $00, $06, $00, $05, $00, $04
	db $00, $03, $00, $02, $00, $01, $00, $00

CODE_B5E7B9:
	LDA $C2					;$B5E7B9  \
	STA $E2					;$B5E7BB   |
	LDA $C4					;$B5E7BD   |
	STA $E4					;$B5E7BF   |
	JSR CODE_B5E705				;$B5E7C1   |
	RTS					;$B5E7C4  /

CODE_B5E7C5:
	LDA.l $7E8D28				;$B5E7C5  \
	CMP $DF					;$B5E7C9   |
	BCS CODE_B5E7D3				;$B5E7CB   |
	LDA $FC					;$B5E7CD   |
	CMP $DF					;$B5E7CF   |
	BCS CODE_B5E7D7				;$B5E7D1   |
CODE_B5E7D3:					;	   |
	STZ $DE					;$B5E7D3   |
	STA $DF					;$B5E7D5   |
CODE_B5E7D7:					;	   |
	LDA.l $7E8F28				;$B5E7D7   |
	CMP $E3					;$B5E7DB   |
	BCS CODE_B5E7E5				;$B5E7DD   |
	LDA $FE					;$B5E7DF   |
	CMP $E3					;$B5E7E1   |
	BCS CODE_B5E7E9				;$B5E7E3   |
CODE_B5E7E5:					;	   |
	STZ $E2					;$B5E7E5   |
	STA $E3					;$B5E7E7   |
CODE_B5E7E9:					;	   |
	LDX $BC					;$B5E7E9   |
	BEQ CODE_B5E817				;$B5E7EB   |
	STZ $92					;$B5E7ED   |
	LDA $BF					;$B5E7EF   |
	CMP $8D28,x				;$B5E7F1   |
	ROL $92					;$B5E7F4   |
	CMP $8E28,x				;$B5E7F6   |
	ROL $92					;$B5E7F9   |
	LDA $C3					;$B5E7FB   |
	CMP $8F28,x				;$B5E7FD   |
	ROL $92					;$B5E800   |
	CMP $9028,x				;$B5E802   |
	ROL $92					;$B5E805   |
	LDA $92					;$B5E807   |
	CMP #$000A				;$B5E809   |
	BEQ CODE_B5E81E				;$B5E80C   |
	JSR CODE_B5EC63				;$B5E80E   |
	BCS CODE_B5E81E				;$B5E811   |
	LDX $BC					;$B5E813   |
	BRA CODE_B5E81E				;$B5E815  /

CODE_B5E817:
	LDA $BA					;$B5E817  \
	BEQ CODE_B5E81E				;$B5E819   |
	JSR CODE_B5ED3A				;$B5E81B   |
CODE_B5E81E:					;	   |
	STX $BC					;$B5E81E   |
	STX $92					;$B5E820   |
	TXY					;$B5E822   |
	BEQ CODE_B5E851				;$B5E823   |
	LDA $9228,x				;$B5E825   |
	JSR CODE_B5E922				;$B5E828   |
	BCS CODE_B5E835				;$B5E82B   |
	LDA $9229,x				;$B5E82D   |
	JSR CODE_B5E922				;$B5E830   |
	BCC CODE_B5E84F				;$B5E833   |
CODE_B5E835:					;	   |
	LDA $DF					;$B5E835   |
	CMP $8D28,y				;$B5E837   |
	BCS CODE_B5E851				;$B5E83A   |
	TYX					;$B5E83C   |
	STX $92					;$B5E83D   |
	LDA $9228,x				;$B5E83F   |
	JSR CODE_B5E922				;$B5E842   |
	BCS CODE_B5E851				;$B5E845   |
	LDA $9229,x				;$B5E847   |
	JSR CODE_B5E922				;$B5E84A   |
	BCS CODE_B5E851				;$B5E84D   |
CODE_B5E84F:					;	   |
	LDY $92					;$B5E84F   |
CODE_B5E851:					;	   |
	LDA $8D28,y				;$B5E851   |
if !version == 0				;	   |
	STA $AA					;$B5E854   |
else						;	   |
	STA $A8					;$B5E854   |
endif
	LDX $BC					;$B5E856   |
	STX $92					;$B5E858   |
	TXY					;$B5E85A   |
	BEQ CODE_B5E890				;$B5E85B   |
	LDA $9129,x				;$B5E85D   |
	JSR CODE_B5E954				;$B5E860   |
	BCS CODE_B5E86F				;$B5E863   |
	JSR CODE_B5ED1E				;$B5E865   |
	BNE CODE_B5E88E				;$B5E868   |
	JSR CODE_B5E95B				;$B5E86A   |
	BCC CODE_B5E88E				;$B5E86D   |
CODE_B5E86F:					;	   |
	LDA $8E28,y				;$B5E86F   |
	SBC #$0100				;$B5E872   |
	CMP $DF					;$B5E875   |
	BCS CODE_B5E890				;$B5E877   |
	TYX					;$B5E879   |
	STX $92					;$B5E87A   |
	LDA $9129,x				;$B5E87C   |
	JSR CODE_B5E954				;$B5E87F   |
	BCS CODE_B5E890				;$B5E882   |
	JSR CODE_B5ED1E				;$B5E884   |
	BNE CODE_B5E88E				;$B5E887   |
	JSR CODE_B5E95B				;$B5E889   |
	BCS CODE_B5E890				;$B5E88C   |
CODE_B5E88E:					;	   |
	LDY $92					;$B5E88E   |
CODE_B5E890:					;	   |
	LDA $8E28,y				;$B5E890   |
if !version == 0				;	   |
	STA $AC					;$B5E893   |
else						;	   |
	STA $AA					;$B5E893   |
endif						;	   |
	LDX $BC					;$B5E895   |
	STX $92					;$B5E897   |
	TXY					;$B5E899   |
	BEQ CODE_B5E8C8				;$B5E89A   |
	LDA $9328,x				;$B5E89C   |
	JSR CODE_B5E98C				;$B5E89F   |
	BCS CODE_B5E8AC				;$B5E8A2   |
	LDA $9329,x				;$B5E8A4   |
	JSR CODE_B5E98C				;$B5E8A7   |
	BCC CODE_B5E8C6				;$B5E8AA   |
CODE_B5E8AC:					;	   |
	LDA $E3					;$B5E8AC   |
	CMP $8F28,y				;$B5E8AE   |
	BCS CODE_B5E8C8				;$B5E8B1   |
	TYX					;$B5E8B3   |
	STX $92					;$B5E8B4   |
	LDA $9328,x				;$B5E8B6   |
	JSR CODE_B5E98C				;$B5E8B9   |
	BCS CODE_B5E8C8				;$B5E8BC   |
	LDA $9329,x				;$B5E8BE   |
	JSR CODE_B5E98C				;$B5E8C1   |
	BCS CODE_B5E8C8				;$B5E8C4   |
CODE_B5E8C6:					;	   |
	LDY $92					;$B5E8C6   |
CODE_B5E8C8:					;	   |
	LDA $8F28,y				;$B5E8C8   |
if !version == 0				;	   |
	STA $AE					;$B5E8CB   |
else						;	   |
	STA $AC					;$B5E8CB   |
endif						;	   |
	LDX $BC					;$B5E8CD   |
	STX $92					;$B5E8CF   |
	TXY					;$B5E8D1   |
	BEQ CODE_B5E903				;$B5E8D2   |
	LDA $9428,x				;$B5E8D4   |
	JSR CODE_B5E9BE				;$B5E8D7   |
	BCS CODE_B5E8E4				;$B5E8DA   |
	LDA $9429,x				;$B5E8DC   |
	JSR CODE_B5E9BE				;$B5E8DF   |
	BCC CODE_B5E901				;$B5E8E2   |
CODE_B5E8E4:					;	   |
	LDA $9028,y				;$B5E8E4   |
	SBC #$00E0				;$B5E8E7   |
	CMP $E3					;$B5E8EA   |
	BCS CODE_B5E903				;$B5E8EC   |
	TYX					;$B5E8EE   |
	STX $92					;$B5E8EF   |
	LDA $9428,x				;$B5E8F1   |
	JSR CODE_B5E9BE				;$B5E8F4   |
	BCS CODE_B5E903				;$B5E8F7   |
	LDA $9429,x				;$B5E8F9   |
	JSR CODE_B5E9BE				;$B5E8FC   |
	BCS CODE_B5E903				;$B5E8FF   |
CODE_B5E901:					;	   |
	LDY $92					;$B5E901   |
CODE_B5E903:					;	   |
	LDA $9028,y				;$B5E903   |
if !version == 0				;	   |
	STA $B0					;$B5E906   |
else						;	   |
	STA $AE					;$B5E906   |
endif						;	   |
	INC $90					;$B5E908   |
	BPL CODE_B5E90E				;$B5E90A   |
	DEC $90					;$B5E90C   |
CODE_B5E90E:					;	   |
	LDX $BC					;$B5E90E   |
	LDA $9128,x				;$B5E910   |
	LDX #$0000				;$B5E913   |
	AND #$0040				;$B5E916   |
	BEQ CODE_B5E91E				;$B5E919   |
	LDX #$0002				;$B5E91B   |
CODE_B5E91E:					;	   |
	JSR (DATA_B5E9F4,x)			;$B5E91E   |
	RTS					;$B5E921  /

CODE_B5E922:
	AND #$00FF				;$B5E922  \
	BEQ CODE_B5E98A				;$B5E925   |
	ASL A					;$B5E927   |
	TAY					;$B5E928   |
	LDA $9128,y				;$B5E929   |
	AND #$00A0				;$B5E92C   |
	BNE CODE_B5E98A				;$B5E92F   |
	LDA $8E28,y				;$B5E931   |
	CMP $DF					;$B5E934   |
	BCC CODE_B5E953				;$B5E936   |
	LDA $E3					;$B5E938   |
	CLC					;$B5E93A   |
	ADC #$00E0				;$B5E93B   |
	CMP $9028,y				;$B5E93E   |
	BCS CODE_B5E949				;$B5E941   |
	SEC					;$B5E943   |
	SBC $8F28,y				;$B5E944   |
	BRA CODE_B5E94E				;$B5E947  /

CODE_B5E949:
	LDA $9028,y				;$B5E949  \
	SBC $E3					;$B5E94C   |
CODE_B5E94E:					;	   |
	BCC CODE_B5E953				;$B5E94E   |
	CMP #$0038				;$B5E950   |
CODE_B5E953:					;	   |
	RTS					;$B5E953  /

CODE_B5E954:
	AND #$00FF				;$B5E954  \
	BEQ CODE_B5E98A				;$B5E957   |
	ASL A					;$B5E959   |
	TAY					;$B5E95A   |
CODE_B5E95B:					;	   |
	LDA $9128,y				;$B5E95B   |
	AND #$00A0				;$B5E95E   |
	BNE CODE_B5E98A				;$B5E961   |
	LDA $DF					;$B5E963   |
	CLC					;$B5E965   |
	ADC #$0100				;$B5E966   |
	CMP $8D28,y				;$B5E969   |
	BCC CODE_B5E989				;$B5E96C   |
	LDA $E3					;$B5E96E   |
	CLC					;$B5E970   |
	ADC #$00E0				;$B5E971   |
	CMP $9028,y				;$B5E974   |
	BCS CODE_B5E97F				;$B5E977   |
	SEC					;$B5E979   |
	SBC $8F28,y				;$B5E97A   |
	BRA CODE_B5E984				;$B5E97D  /

CODE_B5E97F:
	LDA $9028,y				;$B5E97F  \
	SBC $E3					;$B5E982   |
CODE_B5E984:					;	   |
	BCC CODE_B5E989				;$B5E984   |
	CMP #$0038				;$B5E986   |
CODE_B5E989:					;	   |
	RTS					;$B5E989  /

CODE_B5E98A:
	CLC					;$B5E98A  \
	RTS					;$B5E98B  /

CODE_B5E98C:
	AND #$00FF				;$B5E98C  \
	BEQ CODE_B5E98A				;$B5E98F   |
	ASL A					;$B5E991   |
	TAY					;$B5E992   |
	LDA $9128,y				;$B5E993   |
	AND #$00A0				;$B5E996   |
	BNE CODE_B5E9BD				;$B5E999   |
	LDA $9028,y				;$B5E99B   |
	CMP $E3					;$B5E99E   |
	BCC CODE_B5E9BD				;$B5E9A0   |
	LDA $DF					;$B5E9A2   |
	CLC					;$B5E9A4   |
	ADC #$0100				;$B5E9A5   |
	CMP $8E28,y				;$B5E9A8   |
	BCS CODE_B5E9B3				;$B5E9AB   |
	SEC					;$B5E9AD   |
	SBC $8D28,y				;$B5E9AE   |
	BRA CODE_B5E9B8				;$B5E9B1  /

CODE_B5E9B3:
	LDA $8E28,y				;$B5E9B3  \
	SBC $DF					;$B5E9B6   |
CODE_B5E9B8:					;	   |
	BCC CODE_B5E9BD				;$B5E9B8   |
	CMP #$0040				;$B5E9BA   |
CODE_B5E9BD:					;	   |
	RTS					;$B5E9BD  /

CODE_B5E9BE:
	AND #$00FF				;$B5E9BE  \
	BEQ CODE_B5E98A				;$B5E9C1   |
	ASL A					;$B5E9C3   |
	TAY					;$B5E9C4   |
	LDA $9128,y				;$B5E9C5   |
	AND #$00A0				;$B5E9C8   |
	BNE CODE_B5E9F3				;$B5E9CB   |
	LDA $E3					;$B5E9CD   |
	CLC					;$B5E9CF   |
	ADC #$00E0				;$B5E9D0   |
	CMP $8F28,y				;$B5E9D3   |
	BCC CODE_B5E9F3				;$B5E9D6   |
	LDA $DF					;$B5E9D8   |
	CLC					;$B5E9DA   |
	ADC #$0100				;$B5E9DB   |
	CMP $8E28,y				;$B5E9DE   |
	BCS CODE_B5E9E9				;$B5E9E1   |
	SEC					;$B5E9E3   |
	SBC $8D28,y				;$B5E9E4   |
	BRA CODE_B5E9EE				;$B5E9E7  /

CODE_B5E9E9:
	LDA $8E28,y				;$B5E9E9  \
	SBC $DF					;$B5E9EC   |
CODE_B5E9EE:					;	   |
	BCC CODE_B5E9F3				;$B5E9EE   |
	CMP #$0040				;$B5E9F0   |
CODE_B5E9F3:					;	   |
	RTS					;$B5E9F3  /

DATA_B5E9F4:
	dw CODE_B5E9F8
	dw CODE_B5EA3C

CODE_B5E9F8:
if !version == 0				;	  \
	LDA $AC					;$B5E9F8   |
else						;	   |
	LDA $AA					;$B5E9F8   |
endif						;	   |
	SEC					;$B5E9FA   |
	SBC #$0100				;$B5E9FB   |
	BCC CODE_B5EA15				;$B5E9FE   |
if !version == 0				;	   |
	CMP $AA					;$B5EA00   |
else						;	   |
	CMP $A8					;$B5EA00   |
endif						;	   |
	BCS CODE_B5EA09				;$B5EA02   |
if !version == 0				;	   |
	ADC $AA					;$B5EA04   |
else						;	   |
	ADC $A8					;$B5EA04   |
endif						;	   |
	LSR A					;$B5EA06   |
	BRA CODE_B5EA18				;$B5EA07  /

CODE_B5EA09:
	CMP $DF					;$B5EA09  \
	BCC CODE_B5EA18				;$B5EA0B   |
if !version == 0				;	   |
	LDA $AA					;$B5EA0D   |
else						;	   |
	LDA $A8					;$B5EA0D   |
endif						;	   |
	CMP $DF					;$B5EA0F   |
	BCS CODE_B5EA18				;$B5EA11   |
	BCC CODE_B5EA1A				;$B5EA13   |
CODE_B5EA15:					;	   |
	LDA #$0000				;$B5EA15   |
CODE_B5EA18:					;	   |
	STA $DF					;$B5EA18   |
CODE_B5EA1A:					;	   |
if !version == 0				;	   |
	LDA $B0					;$B5EA1A   |
else						;	   |
	LDA $AE					;$B5EA1A   |
endif						;	   |
	SEC					;$B5EA1C   |
	SBC #$00E0				;$B5EA1D   |
	BCC CODE_B5EA36				;$B5EA20   |
if !version == 0				;	   |
	CMP $AE					;$B5EA22   |
else						;	   |
	CMP $AC					;$B5EA22   |
endif						;	   |
	BCS CODE_B5EA2B				;$B5EA24   |
if !version == 0				;	   |
	ADC $AE					;$B5EA26   |
else						;	   |
	ADC $AC					;$B5EA26   |
endif						;	   |
	LSR A					;$B5EA28   |
	BRA CODE_B5EA39				;$B5EA29  /

CODE_B5EA2B:
	CMP $E3					;$B5EA2B  \
	BCC CODE_B5EA39				;$B5EA2D   |
if !version == 0				;	   |
	LDA $AE					;$B5EA2F   |
else						;	   |
	LDA $AC					;$B5EA2F   |
endif						;	   |
	CMP $E3					;$B5EA31   |
	BCS CODE_B5EA39				;$B5EA33   |
	RTS					;$B5EA35  /

CODE_B5EA36:
	LDA #$0000				;$B5EA36  \
CODE_B5EA39:					;	   |
	STA $E3					;$B5EA39   |
	RTS					;$B5EA3B  /

CODE_B5EA3C:
	LDY $0ABC				;$B5EA3C  \
	LDA $9228,y				;$B5EA3F   |
	BEQ CODE_B5EA53				;$B5EA42   |
	AND #$00FF				;$B5EA44   |
	ASL A					;$B5EA47   |
	TAX					;$B5EA48   |
	LDA $9028,x				;$B5EA49   |
	CMP $9028,y				;$B5EA4C   |
	BEQ CODE_B5EA66				;$B5EA4F   |
	BRA CODE_B5EAA5				;$B5EA51  /

CODE_B5EA53:
	LDA $9328,y				;$B5EA53  \
	AND #$00FF				;$B5EA56   |
	ASL A					;$B5EA59   |
	TAX					;$B5EA5A   |
	LDA $8E28,x				;$B5EA5B   |
	CMP $8E28,y				;$B5EA5E   |
	BEQ CODE_B5EADE				;$B5EA61   |
	BRL CODE_B5EB1D				;$B5EA63  /

CODE_B5EA66:
	LDA $9228,y				;$B5EA66  \
	AND #$00FF				;$B5EA69   |
	ASL A					;$B5EA6C   |
	TAX					;$B5EA6D   |
	LDA $9129,y				;$B5EA6E   |
	AND #$00FF				;$B5EA71   |
	ASL A					;$B5EA74   |
	TAY					;$B5EA75   |
	LDA $8F28,x				;$B5EA76   |
	SEC					;$B5EA79   |
	SBC $8F28,y				;$B5EA7A   |
	STA $0D26				;$B5EA7D   |
	JSR CODE_B5EBBB				;$B5EA80   |
	EOR #$FFFF				;$B5EA83   |
	SEC					;$B5EA86   |
	ADC $8F28,x				;$B5EA87   |
if !version == 0				;	   |
	STA $AE					;$B5EA8A   |
else						;	   |
	STA $AC					;$B5EA8A   |
endif						;	   |
	LDA $9028,x				;$B5EA8C   |
	SEC					;$B5EA8F   |
	SBC $9028,y				;$B5EA90   |
	STA $0D26				;$B5EA93   |
	JSR CODE_B5EBBB				;$B5EA96   |
	EOR #$FFFF				;$B5EA99   |
	SEC					;$B5EA9C   |
	ADC $9028,x				;$B5EA9D   |
if !version == 0				;	   |
	STA $B0					;$B5EAA0   |
else						;	   |
	STA $AE					;$B5EAA0   |
endif						;	   |
	JMP CODE_B5EB78				;$B5EAA2  /

CODE_B5EAA5:
	LDA $9228,y				;$B5EAA5  \
	AND #$00FF				;$B5EAA8   |
	ASL A					;$B5EAAB   |
	TAX					;$B5EAAC   |
	LDA $9129,y				;$B5EAAD   |
	AND #$00FF				;$B5EAB0   |
	ASL A					;$B5EAB3   |
	TAY					;$B5EAB4   |
	LDA $8F28,y				;$B5EAB5   |
	SEC					;$B5EAB8   |
	SBC $8F28,x				;$B5EAB9   |
	STA $0D26				;$B5EABC   |
	JSR CODE_B5EBBB				;$B5EABF   |
	CLC					;$B5EAC2   |
	ADC $8F28,x				;$B5EAC3   |
if !version == 0				;	   |
	STA $AE					;$B5EAC6   |
else						;	   |
	STA $AC					;$B5EAC6   |
endif						;	   |
	LDA $9028,y				;$B5EAC8   |
	SEC					;$B5EACB   |
	SBC $9028,x				;$B5EACC   |
	STA $0D26				;$B5EACF   |
	JSR CODE_B5EBBB				;$B5EAD2   |
	CLC					;$B5EAD5   |
	ADC $9028,x				;$B5EAD6   |
if !version == 0				;	   |
	STA $B0					;$B5EAD9   |
else						;	   |
	STA $AE					;$B5EAD9   |
endif						;	   |
	JMP CODE_B5EB78				;$B5EADB  /

CODE_B5EADE:
	LDA $9328,y				;$B5EADE  \
	AND #$00FF				;$B5EAE1   |
	ASL A					;$B5EAE4   |
	TAX					;$B5EAE5   |
	LDA $9428,y				;$B5EAE6   |
	AND #$00FF				;$B5EAE9   |
	ASL A					;$B5EAEC   |
	TAY					;$B5EAED   |
	LDA $8D28,x				;$B5EAEE   |
	SEC					;$B5EAF1   |
	SBC $8D28,y				;$B5EAF2   |
	STA $0D26				;$B5EAF5   |
	JSR CODE_B5EB9A				;$B5EAF8   |
	EOR #$FFFF				;$B5EAFB   |
	SEC					;$B5EAFE   |
	ADC $8D28,x				;$B5EAFF   |
if !version == 0				;	   |
	STA $AA					;$B5EB02   |
else						;	   |
	STA $A8					;$B5EB02   |
endif						;	   |
	LDA $8E28,x				;$B5EB04   |
	SEC					;$B5EB07   |
	SBC $8E28,y				;$B5EB08   |
	STA $0D26				;$B5EB0B   |
	JSR CODE_B5EB9A				;$B5EB0E   |
	EOR #$FFFF				;$B5EB11   |
	SEC					;$B5EB14   |
	ADC $8E28,x				;$B5EB15   |
if !version == 0				;	   |
	STA $AC					;$B5EB18   |
else						;	   |
	STA $AA					;$B5EB18   |
endif						;	   |
	JMP CODE_B5EB56				;$B5EB1A  /

CODE_B5EB1D:
	LDA $9328,y				;$B5EB1D  \
	AND #$00FF				;$B5EB20   |
	ASL A					;$B5EB23   |
	TAX					;$B5EB24   |
	LDA $9428,y				;$B5EB25   |
	AND #$00FF				;$B5EB28   |
	ASL A					;$B5EB2B   |
	TAY					;$B5EB2C   |
	LDA $8D28,y				;$B5EB2D   |
	SEC					;$B5EB30   |
	SBC $8D28,x				;$B5EB31   |
	STA $0D26				;$B5EB34   |
	JSR CODE_B5EB9A				;$B5EB37   |
	CLC					;$B5EB3A   |
	ADC $8D28,x				;$B5EB3B   |
if !version == 0				;	   |
	STA $AA					;$B5EB3E   |
else						;	   |
	STA $A8					;$B5EB3E   |
endif						;	   |
	LDA $8E28,y				;$B5EB40   |
	SEC					;$B5EB43   |
	SBC $8E28,x				;$B5EB44   |
	STA $0D26				;$B5EB47   |
	JSR CODE_B5EB9A				;$B5EB4A   |
	CLC					;$B5EB4D   |
	ADC $8E28,x				;$B5EB4E   |
if !version == 0				;	   |
	STA $AC					;$B5EB51   |
else						;	   |
	STA $AA					;$B5EB51   |
endif						;	   |
	JMP CODE_B5EB56				;$B5EB53  /

CODE_B5EB56:
if !version == 0				;	  \
	LDA $AC					;$B5EB56   |
else						;	   |
	LDA $AA					;$B5EB56   |
endif						;	   |
	SEC					;$B5EB58   |
	SBC #$0100				;$B5EB59   |
	BCC CODE_B5EB72				;$B5EB5C   |
if !version == 0				;	   |
	CMP $AA					;$B5EB5E   |
else						;	   |
	CMP $A8					;$B5EB5E   |
endif						;	   |
	BCS CODE_B5EB67				;$B5EB60   |
if !version == 0				;	   |
	ADC $AA					;$B5EB62   |
else						;	   |
	ADC $A8					;$B5EB62   |
endif						;	   |
	LSR A					;$B5EB64   |
	BRA CODE_B5EB75				;$B5EB65  /

CODE_B5EB67:
	CMP $DF					;$B5EB67  \
	BCC CODE_B5EB75				;$B5EB69   |
if !version == 0				;	   |
	LDA $AA					;$B5EB6B   |
else						;	   |
	LDA $A8					;$B5EB6B   |
endif						;	   |
	CMP $DF					;$B5EB6D   |
	BCS CODE_B5EB75				;$B5EB6F   |
	RTS					;$B5EB71  /

CODE_B5EB72:
	LDA #$0000				;$B5EB72  \
CODE_B5EB75:					;	   |
	STA $DF					;$B5EB75   |
	RTS					;$B5EB77  /

CODE_B5EB78:
if !version == 0				;	  \
	LDA $B0					;$B5EB78   |
else						;	   |
	LDA $AE					;$B5EB78   |
endif						;	   |
	SEC					;$B5EB7A   |
	SBC #$00E0				;$B5EB7B   |
	BCC CODE_B5EB94				;$B5EB7E   |
if !version == 0				;	   |
	CMP $AE					;$B5EB80   |
else						;	   |
	CMP $AC					;$B5EB80   |
endif						;	   |
	BCS CODE_B5EB89				;$B5EB82   |
if !version == 0				;	   |
	ADC $AE					;$B5EB84   |
else						;	   |
	ADC $AC					;$B5EB84   |
endif						;	   |
	LSR A					;$B5EB86   |
	BRA CODE_B5EB97				;$B5EB87  /

CODE_B5EB89:
	CMP $E3					;$B5EB89  \
	BCC CODE_B5EB97				;$B5EB8B   |
if !version == 0				;	   |
	LDA $AE					;$B5EB8D   |
else						;	   |
	LDA $AC					;$B5EB8D   |
endif						;	   |
	CMP $E3					;$B5EB8F   |
	BCS CODE_B5EB97				;$B5EB91   |
	RTS					;$B5EB93  /

CODE_B5EB94:
	LDA #$0000				;$B5EB94  \
CODE_B5EB97:					;	   |
	STA $E3					;$B5EB97   |
	RTS					;$B5EB99  /

CODE_B5EB9A:
	LDA $8F28,y				;$B5EB9A  \
	SEC					;$B5EB9D   |
	SBC $9028,x				;$B5EB9E   |
	SEC					;$B5EBA1   |
	SBC #$00E0				;$B5EBA2   |
	STA $0D2A				;$B5EBA5   |
	LDA $E3					;$B5EBA8   |
	SEC					;$B5EBAA   |
	SBC $9028,x				;$B5EBAB   |
	BCC CODE_B5EBDC				;$B5EBAE   |
	CMP $0D2A				;$B5EBB0   |
	BCS CODE_B5EBE0				;$B5EBB3   |
	STA $0D28				;$B5EBB5   |
	JMP CODE_B5EBE4				;$B5EBB8  /

CODE_B5EBBB:
	LDA $8D28,y				;$B5EBBB  \
	SEC					;$B5EBBE   |
	SBC $8E28,x				;$B5EBBF   |
	SEC					;$B5EBC2   |
	SBC #$0100				;$B5EBC3   |
	STA $0D2A				;$B5EBC6   |
	LDA $DF					;$B5EBC9   |
	SEC					;$B5EBCB   |
	SBC $8E28,x				;$B5EBCC   |
	BCC CODE_B5EBDC				;$B5EBCF   |
	CMP $0D2A				;$B5EBD1   |
	BCS CODE_B5EBE0				;$B5EBD4   |
	STA $0D28				;$B5EBD6   |
	JMP CODE_B5EBE4				;$B5EBD9  /

CODE_B5EBDC:
	LDA #$0000				;$B5EBDC  \
	RTS					;$B5EBDF  /

CODE_B5EBE0:
	LDA $0D26				;$B5EBE0  \
	RTS					;$B5EBE3  /

CODE_B5EBE4:
	PHY					;$B5EBE4  \
	LDY #$0000				;$B5EBE5   |
	LDA $0D26				;$B5EBE8   |
	BEQ CODE_B5EC61				;$B5EBEB   |
CODE_B5EBED:					;	   |
	CMP #$0100				;$B5EBED   |
	BCC CODE_B5EBF6				;$B5EBF0   |
	LSR A					;$B5EBF2   |
	INY					;$B5EBF3   |
	BRA CODE_B5EBED				;$B5EBF4  /

CODE_B5EBF6:
	SEP #$20				;$B5EBF6  \
	STA $004202				;$B5EBF8   |
	REP #$20				;$B5EBFC   |
	LDA $0D28				;$B5EBFE   |
	BEQ CODE_B5EC61				;$B5EC01   |
CODE_B5EC03:					;	   |
	CMP #$0100				;$B5EC03   |
	BCC CODE_B5EC0C				;$B5EC06   |
	LSR A					;$B5EC08   |
	INY					;$B5EC09   |
	BRA CODE_B5EC03				;$B5EC0A  /

CODE_B5EC0C:
	SEP #$20				;$B5EC0C  \
	STA $004203				;$B5EC0E   |
	REP #$20				;$B5EC12   |
	NOP					;$B5EC14   |
	NOP					;$B5EC15   |
	NOP					;$B5EC16   |
	LDA.l $004216				;$B5EC17   |
	BMI CODE_B5EC26				;$B5EC1B   |
CODE_B5EC1D:					;	   |
	DEY					;$B5EC1D   |
	BMI CODE_B5EC25				;$B5EC1E   |
	ASL A					;$B5EC20   |
	BPL CODE_B5EC1D				;$B5EC21   |
	BRA CODE_B5EC26				;$B5EC23  /

CODE_B5EC25:
	INY					;$B5EC25  \
CODE_B5EC26:					;	   |
	STA $004204				;$B5EC26   |
	LDA $0D2A				;$B5EC2A   |
	BEQ CODE_B5EC61				;$B5EC2D   |
CODE_B5EC2F:					;	   |
	CMP #$0100				;$B5EC2F   |
	BCC CODE_B5EC38				;$B5EC32   |
	LSR A					;$B5EC34   |
	DEY					;$B5EC35   |
	BRA CODE_B5EC2F				;$B5EC36  /

CODE_B5EC38:
	SEP #$20				;$B5EC38  \
	STA $004206				;$B5EC3A   |
	REP #$20				;$B5EC3E   |
	NOP					;$B5EC40   |
	NOP					;$B5EC41   |
	NOP					;$B5EC42   |
	NOP					;$B5EC43   |
	TYA					;$B5EC44   |
	BEQ CODE_B5EC53				;$B5EC45   |
	BPL CODE_B5EC59				;$B5EC47   |
	LDA.l $004214				;$B5EC49   |
CODE_B5EC4D:					;	   |
	LSR A					;$B5EC4D   |
	INY					;$B5EC4E   |
	BMI CODE_B5EC4D				;$B5EC4F   |
	PLY					;$B5EC51   |
	RTS					;$B5EC52  /

CODE_B5EC53:
	LDA.l $004214				;$B5EC53  \
	PLY					;$B5EC57   |
	RTS					;$B5EC58  /

CODE_B5EC59:
	LDA.l $004214				;$B5EC59  \
CODE_B5EC5D:					;	   |
	ASL A					;$B5EC5D   |
	DEY					;$B5EC5E   |
	BNE CODE_B5EC5D				;$B5EC5F   |
CODE_B5EC61:					;	   |
	PLY					;$B5EC61   |
	RTS					;$B5EC62  /

CODE_B5EC63:
	AND #$0003				;$B5EC63  \
	BEQ CODE_B5EC88				;$B5EC66   |
	CMP #$0003				;$B5EC68   |
	BNE CODE_B5ECA3				;$B5EC6B   |
	LDA $9428,x				;$B5EC6D   |
	JSR CODE_B5ECDE				;$B5EC70   |
	BCS CODE_B5EC84				;$B5EC73   |
	LDA $9429,x				;$B5EC75   |
	JSR CODE_B5ECDE				;$B5EC78   |
	BCS CODE_B5EC84				;$B5EC7B   |
	LDA $9028,x				;$B5EC7D   |
	STA $C3					;$B5EC80   |
	BRA CODE_B5ECA3				;$B5EC82  /

CODE_B5EC84:
	LDA #$0004				;$B5EC84  \
	RTS					;$B5EC87  /

CODE_B5EC88:
	LDA $9328,x				;$B5EC88  \
	JSR CODE_B5ECDE				;$B5EC8B   |
	BCS CODE_B5EC9F				;$B5EC8E   |
	LDA $9329,x				;$B5EC90   |
	JSR CODE_B5ECDE				;$B5EC93   |
	BCS CODE_B5EC9F				;$B5EC96   |
	LDA $8F28,x				;$B5EC98   |
	STA $C3					;$B5EC9B   |
	BRA CODE_B5ECA3				;$B5EC9D  /

CODE_B5EC9F:
	LDA #$0003				;$B5EC9F  \
	RTS					;$B5ECA2  /

CODE_B5ECA3:
	LDA $92					;$B5ECA3  \
	AND #$000C				;$B5ECA5   |
	BEQ CODE_B5ECB3				;$B5ECA8   |
	CMP #$000C				;$B5ECAA   |
	BEQ CODE_B5ECC7				;$B5ECAD   |
CODE_B5ECAF:					;	   |
	LDA #$0000				;$B5ECAF   |
	RTS					;$B5ECB2  /

CODE_B5ECB3:
	LDA $9228,x				;$B5ECB3  \
	JSR CODE_B5ECFD				;$B5ECB6   |
	BCS CODE_B5ECC3				;$B5ECB9   |
	LDA $9229,x				;$B5ECBB   |
	JSR CODE_B5ECFD				;$B5ECBE   |
	BCC CODE_B5ECAF				;$B5ECC1   |
CODE_B5ECC3:					;	   |
	LDA #$0001				;$B5ECC3   |
	RTS					;$B5ECC6  /

CODE_B5ECC7:
	LDA $9129,x				;$B5ECC7  \
	JSR CODE_B5ECFD				;$B5ECCA   |
	BCS CODE_B5ECDA				;$B5ECCD   |
	JSR CODE_B5ED1E				;$B5ECCF   |
	CLC					;$B5ECD2   |
	BNE CODE_B5ECAF				;$B5ECD3   |
	JSR CODE_B5ED04				;$B5ECD5   |
	BCC CODE_B5ECAF				;$B5ECD8   |
CODE_B5ECDA:					;	   |
	LDA #$0002				;$B5ECDA   |
	RTS					;$B5ECDD  /

CODE_B5ECDE:
	AND #$00FF				;$B5ECDE  \
	BEQ CODE_B5ED1C				;$B5ECE1   |
	ASL A					;$B5ECE3   |
	TAY					;$B5ECE4   |
	LDA $9128,y				;$B5ECE5   |
	AND #$0020				;$B5ECE8   |
	BNE CODE_B5ECFC				;$B5ECEB   |
	LDA $BF					;$B5ECED   |
	CMP $8D28,y				;$B5ECEF   |
	BCC CODE_B5ECFC				;$B5ECF2   |
	LDA $8E28,y				;$B5ECF4   |
	CMP $BF					;$B5ECF7   |
	BCC CODE_B5ECFC				;$B5ECF9   |
	TYX					;$B5ECFB   |
CODE_B5ECFC:					;	   |
	RTS					;$B5ECFC  /

CODE_B5ECFD:
	AND #$00FF				;$B5ECFD  \
	BEQ CODE_B5ED1C				;$B5ED00   |
	ASL A					;$B5ED02   |
	TAY					;$B5ED03   |
CODE_B5ED04:					;	   |
	LDA $9128,y				;$B5ED04   |
	AND #$0020				;$B5ED07   |
	BNE CODE_B5ED1C				;$B5ED0A   |
	LDA $C3					;$B5ED0C   |
	CMP $8F28,y				;$B5ED0E   |
	BCC CODE_B5ED1B				;$B5ED11   |
	LDA $9028,y				;$B5ED13   |
	CMP $C3					;$B5ED16   |
	BCC CODE_B5ED1B				;$B5ED18   |
	TYX					;$B5ED1A   |
CODE_B5ED1B:					;	   |
	RTS					;$B5ED1B  /

CODE_B5ED1C:
	CLC					;$B5ED1C  \
	RTS					;$B5ED1D  /

CODE_B5ED1E:
	LDA $9129,x				;$B5ED1E  \
	AND #$00FF				;$B5ED21   |
	BEQ CODE_B5ED38				;$B5ED24   |
	INC A					;$B5ED26   |
	ASL A					;$B5ED27   |
	TAY					;$B5ED28   |
	SEP #$20				;$B5ED29   |
	TXA					;$B5ED2B   |
	LSR A					;$B5ED2C   |
	CMP $9228,y				;$B5ED2D   |
	BEQ CODE_B5ED35				;$B5ED30   |
	CMP $9229,y				;$B5ED32   |
CODE_B5ED35:					;	   |
	REP #$20				;$B5ED35   |
	RTS					;$B5ED37  /

CODE_B5ED38:
	INC A					;$B5ED38  \
	RTS					;$B5ED39  /

CODE_B5ED3A:
	LDX $BA					;$B5ED3A  \
	LDA $BF					;$B5ED3C   |
	INX					;$B5ED3E   |
	INX					;$B5ED3F   |
CODE_B5ED40:					;	   |
	DEX					;$B5ED40   |
	DEX					;$B5ED41   |
	CMP $8D28,x				;$B5ED42   |
	BCC CODE_B5ED40				;$B5ED45   |
	CMP $8E28,x				;$B5ED47   |
	BCC CODE_B5ED53				;$B5ED4A   |
CODE_B5ED4C:					;	   |
	DEX					;$B5ED4C   |
	DEX					;$B5ED4D   |
	CMP $8E28,x				;$B5ED4E   |
	BCS CODE_B5ED4C				;$B5ED51   |
CODE_B5ED53:					;	   |
	LDA $C3					;$B5ED53   |
	CMP $8F28,x				;$B5ED55   |
	BCS CODE_B5ED61				;$B5ED58   |
CODE_B5ED5A:					;	   |
	DEX					;$B5ED5A   |
	DEX					;$B5ED5B   |
	CMP $8F28,x				;$B5ED5C   |
	BCC CODE_B5ED5A				;$B5ED5F   |
CODE_B5ED61:					;	   |
	CMP $9028,x				;$B5ED61   |
	BCS CODE_B5ED5A				;$B5ED64   |
	LDA $BF					;$B5ED66   |
	CMP $8E28,x				;$B5ED68   |
	LDA $C3					;$B5ED6B   |
	BCS CODE_B5ED5A				;$B5ED6D   |
	RTS					;$B5ED6F  /

CODE_B5ED70:
	LDX $90					;$B5ED70  \
	BMI CODE_B5ED95				;$B5ED72   |
	LDA #$0080				;$B5ED74   |
	STA $92					;$B5ED77   |
	LDY #$83C0				;$B5ED79   |
	LDA [$90],y				;$B5ED7C   |
	CLC					;$B5ED7E   |
	ADC $B2					;$B5ED7F   |
	STA $B2					;$B5ED81   |
	CPX #$021F				;$B5ED83   |
	BCC CODE_B5ED95				;$B5ED86   |
	ROR $90					;$B5ED88   |
	CLC					;$B5ED8A   |
	ADC #$2315				;$B5ED8B   |
	CMP #$9BEA				;$B5ED8E   |
	BEQ CODE_B5ED95				;$B5ED91   |
	DEC $FD					;$B5ED93   |
CODE_B5ED95:					;	   |
	STZ $92					;$B5ED95   |
	LDA $0A36				;$B5ED97   |
	BIT #$0080				;$B5ED9A   |
	BEQ CODE_B5EDA0				;$B5ED9D   |
	RTS					;$B5ED9F  /

CODE_B5EDA0:
	JSR CODE_B5EE79				;$B5EDA0  \
	LDA $0A36				;$B5EDA3   |
	BIT #$0002				;$B5EDA6   |
	BNE CODE_B5EE0A				;$B5EDA9   |
	JSR CODE_B5EF97				;$B5EDAB   |
if !version == 0				;	   |
	LDA $9E					;$B5EDAE   |
else						;	   |
	LDA $9C					;$B5EDAE   |
endif						;	   |
	CLC					;$B5EDB0   |
	ADC $D2					;$B5EDB1   |
	TAY					;$B5EDB3   |
	LDA #$0000				;$B5EDB4   |
if !version == 0				;	   |
	BIT $9E					;$B5EDB7   |
else						;	   |
	BIT $9C					;$B5EDB7   |
endif						;	   |
	BPL CODE_B5EDBC				;$B5EDB9   |
	DEC A					;$B5EDBB   |
CODE_B5EDBC:					;	   |
	ADC $D4					;$B5EDBC   |
	TAX					;$B5EDBE   |
	BMI CODE_B5EDD0				;$B5EDBF   |
	BNE CODE_B5EDC8				;$B5EDC1   |
	CPY #$0801				;$B5EDC3   |
	BCC CODE_B5EDDE				;$B5EDC6   |
CODE_B5EDC8:					;	   |
	LDX #$0000				;$B5EDC8   |
	LDY #$0800				;$B5EDCB   |
	BRA CODE_B5EDDE				;$B5EDCE  /

CODE_B5EDD0:
	INC A					;$B5EDD0  \
	BNE CODE_B5EDD8				;$B5EDD1   |
	CPY #$F800				;$B5EDD3   |
	BCS CODE_B5EDDE				;$B5EDD6   |
CODE_B5EDD8:					;	   |
	LDX #$FFFF				;$B5EDD8   |
	LDY #$F800				;$B5EDDB   |
CODE_B5EDDE:					;	   |
	TYA					;$B5EDDE   |
	CLC					;$B5EDDF   |
	ADC $DA					;$B5EDE0   |
	STA $DA					;$B5EDE2   |
	TXA					;$B5EDE4   |
	ADC $DC					;$B5EDE5   |
	STA $DC					;$B5EDE7   |
	LDA #$0100				;$B5EDE9   |
	CMP $DB					;$B5EDEC   |
	BCS CODE_B5EDF6				;$B5EDEE   |
	LDA $FE					;$B5EDF0   |
	CMP $DB					;$B5EDF2   |
	BCS CODE_B5EDF8				;$B5EDF4   |
CODE_B5EDF6:					;	   |
	STA $DB					;$B5EDF6   |
CODE_B5EDF8:					;	   |
	LDA $DB					;$B5EDF8   |
	SEC					;$B5EDFA   |
	SBC $17C0				;$B5EDFB   |
	STA $17D2				;$B5EDFE   |
	LDA $DB					;$B5EE01   |
	STA $17C0				;$B5EE03   |
	DEC A					;$B5EE06   |
	STA $17C2				;$B5EE07   |
CODE_B5EE0A:					;	   |
	LDA $0A36				;$B5EE0A   |
	BIT #$0001				;$B5EE0D   |
	BNE CODE_B5EE78				;$B5EE10   |
	JSR CODE_B5EEBF				;$B5EE12   |
	LDA $9A					;$B5EE15   |
	CLC					;$B5EE17   |
	ADC $CE					;$B5EE18   |
	TAY					;$B5EE1A   |
	LDA #$0000				;$B5EE1B   |
	BIT $9A					;$B5EE1E   |
	BPL CODE_B5EE23				;$B5EE20   |
	DEC A					;$B5EE22   |
CODE_B5EE23:					;	   |
	ADC $D0					;$B5EE23   |
	TAX					;$B5EE25   |
	BMI CODE_B5EE37				;$B5EE26   |
	BNE CODE_B5EE2F				;$B5EE28   |
	CPY #$0801				;$B5EE2A   |
	BCC CODE_B5EE45				;$B5EE2D   |
CODE_B5EE2F:					;	   |
	LDX #$0000				;$B5EE2F   |
	LDY #$0800				;$B5EE32   |
	BRA CODE_B5EE45				;$B5EE35  /

CODE_B5EE37:
	INC A					;$B5EE37  \
	BNE CODE_B5EE3F				;$B5EE38   |
	CPY #$F800				;$B5EE3A   |
	BCS CODE_B5EE45				;$B5EE3D   |
CODE_B5EE3F:					;	   |
	LDX #$FFFF				;$B5EE3F   |
	LDY #$F800				;$B5EE42   |
CODE_B5EE45:					;	   |
	TYA					;$B5EE45   |
	CLC					;$B5EE46   |
	ADC $D6					;$B5EE47   |
	STA $D6					;$B5EE49   |
	TXA					;$B5EE4B   |
	ADC $D8					;$B5EE4C   |
	STA $D8					;$B5EE4E   |
	BPL CODE_B5EE56				;$B5EE50   |
	STZ $D6					;$B5EE52   |
	STZ $D8					;$B5EE54   |
CODE_B5EE56:					;	   |
	LDA #$0100				;$B5EE56   |
	CMP $D7					;$B5EE59   |
	BCS CODE_B5EE63				;$B5EE5B   |
	LDA $FC					;$B5EE5D   |
	CMP $D7					;$B5EE5F   |
	BCS CODE_B5EE65				;$B5EE61   |
CODE_B5EE63:					;	   |
	STA $D7					;$B5EE63   |
CODE_B5EE65:					;	   |
	LDA $D7					;$B5EE65   |
	SEC					;$B5EE67   |
	SBC $17BA				;$B5EE68   |
	STA $17D6				;$B5EE6B   |
	LDA $D7					;$B5EE6E   |
	STA $17BA				;$B5EE70   |
	LDA $D6					;$B5EE73   |
	STA $17B9				;$B5EE75   |
CODE_B5EE78:					;	   |
	RTS					;$B5EE78  /

CODE_B5EE79:
	LDA.l $00002A				;$B5EE79  \
	AND #$0003				;$B5EE7D   |
	BNE CODE_B5EEBA				;$B5EE80   |
	LDA $F6					;$B5EE82   |
	LSR $F6					;$B5EE84   |
	CMP #$0040				;$B5EE86   |
	BCC CODE_B5EE95				;$B5EE89   |
	BIT $FA					;$B5EE8B   |
	BVC CODE_B5EE98				;$B5EE8D   |
	EOR #$FFFF				;$B5EE8F   |
	INC A					;$B5EE92   |
	BRA CODE_B5EE98				;$B5EE93  /

CODE_B5EE95:
	LDA #$0000				;$B5EE95  \
CODE_B5EE98:					;	   |
	STA $9A					;$B5EE98   |
	LDA $F8					;$B5EE9A   |
	LSR $F8					;$B5EE9C   |
	CMP #$0040				;$B5EE9E   |
	BCC CODE_B5EEAD				;$B5EEA1   |
	BIT $FA					;$B5EEA3   |
	BPL CODE_B5EEB0				;$B5EEA5   |
	EOR #$FFFF				;$B5EEA7   |
	INC A					;$B5EEAA   |
	BRA CODE_B5EEB0				;$B5EEAB  /

CODE_B5EEAD:
	LDA #$0000				;$B5EEAD  \
CODE_B5EEB0:					;	   |
if !version == 0				;	   |
	STA $9E					;$B5EEB0   |
else						;	   |
	STA $9C					;$B5EEB0   |
endif						;	   |
	LDA $FA					;$B5EEB2   |
	EOR #$C000				;$B5EEB4   |
	STA $FA					;$B5EEB7   |
	RTS					;$B5EEB9  /

CODE_B5EEBA:					;	  \
	STZ $9A					;$B5EEBA   |
if !version == 0				;	   |
	STZ $9E					;$B5EEBC   |
else						;	   |
	STZ $9C					;$B5EEBC   |
endif						;	   |
	RTS					;$B5EEBE  /

CODE_B5EEBF:
	SEP #$10				;$B5EEBF  \
	LDX $C8					;$B5EEC1   |
	LDY $C9					;$B5EEC3   |
if !version == 0				;	   |
	LDA $A2					;$B5EEC5   |
else						;	   |
	LDA $A0					;$B5EEC5   |
endif						;	   |
	SEC					;$B5EEC7   |
	SBC $D6					;$B5EEC8   |
if !version == 0				;	   |
	STA $AE					;$B5EECA   |
	LDA $A4					;$B5EECC   |
	SBC $D8					;$B5EECE   |
	STA $B0					;$B5EED0   |
	LDA $DE					;$B5EED2   |
	SEC					;$B5EED4   |
	SBC $A2					;$B5EED5   |
	STA $AA					;$B5EED7   |
	LDA $E0					;$B5EED9   |
	SBC $A4					;$B5EEDB   |
	STA $AC					;$B5EEDD   |
	LDA $AA					;$B5EEDF   |
	CLC					;$B5EEE1   |
	ADC $AE					;$B5EEE2   |
	STA $92					;$B5EEE4   |
	LDA $AC					;$B5EEE6   |
	ADC $B0					;$B5EEE8   |
else						;	   |
	STA $AC					;$B5EECA   |
	LDA $A2					;$B5EECC   |
	SBC $D8					;$B5EECE   |
	STA $AE					;$B5EED0   |
	LDA $DE					;$B5EED2   |
	SEC					;$B5EED4   |
	SBC $A0					;$B5EED5   |
	STA $A8					;$B5EED7   |
	LDA $E0					;$B5EED9   |
	SBC $A2					;$B5EEDB   |
	STA $AA					;$B5EEDD   |
	LDA $A8					;$B5EEDF   |
	CLC					;$B5EEE1   |
	ADC $AC					;$B5EEE2   |
	STA $92					;$B5EEE4   |
	LDA $AA					;$B5EEE6   |
	ADC $AE					;$B5EEE8   |
endif						;	   |
	DEX					;$B5EEEA   |
	BMI CODE_B5EEF6				;$B5EEEB   |
CODE_B5EEED:					;	   |
	CMP #$8000				;$B5EEED   |
	ROR A					;$B5EEF0   |
	ROR $92					;$B5EEF1   |
	DEX					;$B5EEF3   |
	BPL CODE_B5EEED				;$B5EEF4   |
CODE_B5EEF6:					;	   |
	STA $94					;$B5EEF6   |
	TAX					;$B5EEF8   |
	BPL CODE_B5EF09				;$B5EEF9   |
	LDA #$FFFF				;$B5EEFB   |
	STA $94					;$B5EEFE   |
	EOR $C6					;$B5EF00   |
	INC A					;$B5EF02   |
	CMP $92					;$B5EF03   |
	BCC CODE_B5EF13				;$B5EF05   |
	BCS CODE_B5EF11				;$B5EF07   |
CODE_B5EF09:					;	   |
	STZ $94					;$B5EF09   |
	LDA $C6					;$B5EF0B   |
	CMP $92					;$B5EF0D   |
	BCS CODE_B5EF13				;$B5EF0F   |
CODE_B5EF11:					;	   |
	STA $92					;$B5EF11   |
CODE_B5EF13:					;	   |
	DEY					;$B5EF13   |
	BMI CODE_B5EF47				;$B5EF14   |
if !version == 0				;	   |
	LDA $AE					;$B5EF16   |
	BIT $B0					;$B5EF18   |
else						;	   |
	LDA $AC					;$B5EF16   |
	BIT $AE					;$B5EF18   |
endif						;	   |
	BPL CODE_B5EF32				;$B5EF1A   |
	CMP #$FFE0				;$B5EF1C   |
	BCS CODE_B5EF45				;$B5EF1F   |
CODE_B5EF21:					;	   |
	SEC					;$B5EF21   |
if !version == 0				;	   |
	ROR $B0					;$B5EF22   |
else						;	   |
	ROR $AE					;$B5EF22   |
endif						;	   |
	ROR A					;$B5EF24   |
	DEY					;$B5EF25   |
	BPL CODE_B5EF21				;$B5EF26   |
	CMP #$FFF8				;$B5EF28   |
	BCC CODE_B5EF45				;$B5EF2B   |
	LDA #$FFF8				;$B5EF2D   |
	BRA CODE_B5EF45				;$B5EF30  /

CODE_B5EF32:
	CMP #$0020				;$B5EF32  \
	BCC CODE_B5EF45				;$B5EF35   |
CODE_B5EF37:					;	   |
if !version == 0				;	   |
	LSR $B0					;$B5EF37   |
else						;	   |
	LSR $AE					;$B5EF37   |
endif						;	   |
	ROR A					;$B5EF39   |
	DEY					;$B5EF3A   |
	BPL CODE_B5EF37				;$B5EF3B   |
	CMP #$0008				;$B5EF3D   |
	BCS CODE_B5EF45				;$B5EF40   |
	LDA #$0008				;$B5EF42   |
CODE_B5EF45:					;	   |
if !version == 0				;	   |
	STA $AE					;$B5EF45   |
CODE_B5EF47:					;	   |
	LDA $AA					;$B5EF47   |
	CLC					;$B5EF49   |
	ADC $AE					;$B5EF4A   |
	STA $AE					;$B5EF4C   |
	LDA $AC					;$B5EF4E   |
	ADC $B0					;$B5EF50   |
	STA $B0					;$B5EF52   |
	ORA $AE					;$B5EF54   |
else						;	   |
	STA $AC					;$B5EF45   |
CODE_B5EF47:					;	   |
	LDA $A8					;$B5EF47   |
	CLC					;$B5EF49   |
	ADC $AC					;$B5EF4A   |
	STA $AC					;$B5EF4C   |
	LDA $AA					;$B5EF4E   |
	ADC $AE					;$B5EF50   |
	STA $AE					;$B5EF52   |
	ORA $AC					;$B5EF54   |
endif						;	   |
	BEQ CODE_B5EF83				;$B5EF56   |
	LDA $CE					;$B5EF58   |
	CLC					;$B5EF5A   |
	ADC $92					;$B5EF5B   |
	STA $CE					;$B5EF5D   |
	LDA $D0					;$B5EF5F   |
	ADC $94					;$B5EF61   |
	STA $D0					;$B5EF63   |
if !version == 0				;	   |
	EOR $B0					;$B5EF65   |
	BMI CODE_B5EF8E				;$B5EF67   |
	LDA $B0					;$B5EF69   |
	BPL CODE_B5EF79				;$B5EF6B   |
	CMP $D0					;$B5EF6D   |
	BNE CODE_B5EF75				;$B5EF6F   |
	LDA $AE					;$B5EF71   |
else						;	   |
	EOR $AE					;$B5EF65   |
	BMI CODE_B5EF8E				;$B5EF67   |
	LDA $AE					;$B5EF69   |
	BPL CODE_B5EF79				;$B5EF6B   |
	CMP $D0					;$B5EF6D   |
	BNE CODE_B5EF75				;$B5EF6F   |
	LDA $AC					;$B5EF71   |
endif						;	   |
	CMP $CE					;$B5EF73   |
CODE_B5EF75:					;	   |
	BCS CODE_B5EF83				;$B5EF75   |
	BCC CODE_B5EF8B				;$B5EF77   |
CODE_B5EF79:					;	   |
	CMP $D0					;$B5EF79   |
	BNE CODE_B5EF81				;$B5EF7B   |
if !version == 0				;	   |
	LDA $AE					;$B5EF7D   |
else						;	   |
	LDA $AC					;$B5EF7D   |
endif						;	   |
	CMP $CE					;$B5EF7F   |
CODE_B5EF81:					;	   |
	BCS CODE_B5EF8B				;$B5EF81   |
CODE_B5EF83:					;	   |
if !version == 0				;	   |
	LDA $AE					;$B5EF83   |
	STA $CE					;$B5EF85   |
	LDA $B0					;$B5EF87   |
else						;	   |
	LDA $AC					;$B5EF83   |
	STA $CE					;$B5EF85   |
	LDA $AE					;$B5EF87   |
endif						;	   |
	STA $D0					;$B5EF89   |
CODE_B5EF8B:					;	   |
	REP #$10				;$B5EF8B   |
	RTS					;$B5EF8D  /

CODE_B5EF8E:
	LDA $D0					;$B5EF8E  \
	ASL A					;$B5EF90   |
	ROR $D0					;$B5EF91   |
	ROR $CE					;$B5EF93   |
	BRA CODE_B5EF8B				;$B5EF95  /

CODE_B5EF97:
	SEP #$10				;$B5EF97  \
	LDA $C3					;$B5EF99   |
	SEC					;$B5EF9B   |
if !version == 0				;	   |
	SBC $9F					;$B5EF9C   |
	XBA    					;$B5EF9E   |
	LDA $E3					;$B5EF9F   |
	CMP $A7					;$B5EFA1   |
else						;	   |
	SBC $9E					;$B5EF9C   |
	TAX					;$B5EF9E   |
	LDA $E3					;$B5EF9F   |
	CMP $A5					;$B5EFA1   |
	BCS CODE_B5EFC9				;$B5EFA3   |
	CMP $DB					;$B5EFA5   |
endif						;	   |
	BCS CODE_B5EFC9				;$B5EFA7   |
	LDA $C3					;$B5EFA9   |
	SEC					;$B5EFAB   |
	SBC #$0020				;$B5EFAC   |
	BPL CODE_B5EFB4				;$B5EFAF   |
	LDA #$0000				;$B5EFB1   |
CODE_B5EFB4:					;	   |
	CMP $DB					;$B5EFB4   |
	BCS CODE_B5EFF3				;$B5EFB6   |
if !version == 1
	CPX #$FD				;$B5EFB8   |
	BCS CODE_B5EFF3				;$B5EFBA   |
endif
	CPX #$FA				;$B5EFBC   |
	BCC CODE_B5EFEA				;$B5EFBE   |
CODE_B5EFC0:					;	   |
	LDX #$03				;$B5EFC0   |
	LDY #$03				;$B5EFC2   |
	LDA #$00C0				;$B5EFC4   |
	BRA CODE_B5EFF9				;$B5EFC7  /

CODE_B5EFC9:
	LDA $C3					;$B5EFC9  \
	SEC					;$B5EFCB   |
	SBC #$00C0				;$B5EFCC   |
	BPL CODE_B5EFD4				;$B5EFCF   |
	LDA #$0000				;$B5EFD1   |
CODE_B5EFD4:					;	   |
if !version == 0				;	   |
	CMP $DB					;$B5EFD4   |
	BCC CODE_B5EFF3				;$B5EFD6   |
	CPX #$06				;$B5EFD8   |
	BCS $E4					;$B5EFDA   |
CODE_B5EFEA:					;	   |
	LDX #$02				;$B5EFDC   |
	LDY #$02				;$B5EFEE   |
	LDA #$0100				;$B5EFE0   |
else						;	   |
	SEC					;$B5EFD4   |
	SBC $DB					;$B5EFD5   |
	BCC CODE_B5EFF3				;$B5EFD7   |
	CMP #$0018				;$B5EFD9   |
	BCS CODE_B5EFEA				;$B5EFDC   |
	CPX #$03				;$B5EFDE   |
	BCC CODE_B5EFF3				;$B5EFE0   |
	CPX #$08				;$B5EFE2   |
	BCC CODE_B5EFC0				;$B5EFE4   |
	CPX #$80				;$B5EFE6   |
	BCS CODE_B5EFF3				;$B5EFE8   |
CODE_B5EFEA:					;	   |
	LDX #$02				;$B5EFEA   |
	LDY #$02				;$B5EFEC   |
	LDA #$0240				;$B5EFEE   |
endif						;	   |
	BRA CODE_B5EFF9				;$B5EFF1  /

CODE_B5EFF3:
	LDX $CC					;$B5EFF3  \
	LDY $CD					;$B5EFF5   |
	LDA $CA					;$B5EFF7   |
CODE_B5EFF9:					;	   |
	STA $96					;$B5EFF9   |
if !version == 0				;	   |
	LDA $A6					;$B5EFFB   |
	SEC					;$B5EFFD   |
	SBC $DA					;$B5EFFE   |
	STA $AE					;$B5F000   |
	LDA $A8					;$B5F002   |
	SBC $DC					;$B5F004   |
	STA $B0					;$B5F006   |
	LDA $E2					;$B5F008   |
	SEC					;$B5F00A   |
	SBC $A6					;$B5F00B   |
	STA $AA					;$B5F00D   |
	LDA $E4					;$B5F00F   |
	SBC $A8					;$B5F011   |
	STA $AC					;$B5F013   |
	LDA $AA					;$B5F015   |
	CLC					;$B5F017   |
	ADC $AE					;$B5F018   |
	STA $92					;$B5F01A   |
	LDA $AC					;$B5F01C   |
	ADC $B0					;$B5F01E   |
else						;	   |
	LDA $A4					;$B5EFFB   |
	SEC					;$B5EFFD   |
	SBC $DA					;$B5EFFE   |
	STA $AC					;$B5F000   |
	LDA $A6					;$B5F002   |
	SBC $DC					;$B5F004   |
	STA $AE					;$B5F006   |
	LDA $E2					;$B5F008   |
	SEC					;$B5F00A   |
	SBC $A4					;$B5F00B   |
	STA $A8					;$B5F00D   |
	LDA $E4					;$B5F00F   |
	SBC $A6					;$B5F011   |
	STA $AA					;$B5F013   |
	LDA $A8					;$B5F015   |
	CLC					;$B5F017   |
	ADC $AC					;$B5F018   |
	STA $92					;$B5F01A   |
	LDA $AA					;$B5F01C   |
	ADC $AE					;$B5F01E   |
endif						;	   |
	DEX					;$B5F020   |
	BMI CODE_B5F02C				;$B5F021   |
CODE_B5F023:					;	   |
	CMP #$8000				;$B5F023   |
	ROR A					;$B5F026   |
	ROR $92					;$B5F027   |
	DEX					;$B5F029   |
	BPL CODE_B5F023				;$B5F02A   |
CODE_B5F02C:					;	   |
	STA $94					;$B5F02C   |
	TAX					;$B5F02E   |
	BPL CODE_B5F03F				;$B5F02F   |
	LDA #$FFFF				;$B5F031   |
	STA $94					;$B5F034   |
	EOR $96					;$B5F036   |
	INC A					;$B5F038   |
	CMP $92					;$B5F039   |
	BCC CODE_B5F049				;$B5F03B   |
	BCS CODE_B5F047				;$B5F03D   |
CODE_B5F03F:					;	   |
	STZ $94					;$B5F03F   |
	LDA $96					;$B5F041   |
	CMP $92					;$B5F043   |
	BCS CODE_B5F049				;$B5F045   |
CODE_B5F047:					;	   |
	STA $92					;$B5F047   |
CODE_B5F049:					;	   |
	DEY					;$B5F049   |
	BMI CODE_B5F07D				;$B5F04A   |
if !version == 0				;	   |
	LDA $AE					;$B5F04C   |
	BIT $B0					;$B5F04E   |
else						;	   |
	LDA $AC					;$B5F04C   |
	BIT $AE					;$B5F04E   |
endif						;	   |
	BPL CODE_B5F068				;$B5F050   |
	CMP #$FFE0				;$B5F052   |
	BCS CODE_B5F07B				;$B5F055   |
CODE_B5F057:					;	   |
	SEC					;$B5F057   |
if !version == 0				;	   |
	ROR $B0					;$B5F058   |
else						;	   |
	ROR $AE					;$B5F058   |
endif						;	   |
	ROR A					;$B5F05A   |
	DEY					;$B5F05B   |
	BPL CODE_B5F057				;$B5F05C   |
	CMP #$FFF8				;$B5F05E   |
	BCC CODE_B5F07B				;$B5F061   |
	LDA #$FFF8				;$B5F063   |
	BRA CODE_B5F07B				;$B5F066  /

CODE_B5F068:
	CMP #$0020				;$B5F068  \
	BCC CODE_B5F07B				;$B5F06B   |
CODE_B5F06D:					;	   |
if !version == 0				;	   |
	LSR $B0					;$B5F06D   |
else						;	   |
	LSR $AE					;$B5F06D   |
endif						;	   |
	ROR A					;$B5F06F   |
	DEY					;$B5F070   |
	BPL CODE_B5F06D				;$B5F071   |
	CMP #$0008				;$B5F073   |
	BCS CODE_B5F07B				;$B5F076   |
	LDA #$0008				;$B5F078   |
if !version == 0				;	   |
CODE_B5F07B:					;	   |
	STA $AE					;$B5F07B   |
CODE_B5F07D:					;	   |
	LDA $AA					;$B5F07D   |
	CLC					;$B5F07F   |
	ADC $AE					;$B5F080   |
	STA $AE					;$B5F082   |
	LDA $AC					;$B5F084   |
	ADC $B0					;$B5F086   |
	STA $B0					;$B5F088   |
	ORA $AE					;$B5F08A   |
else						;	   |
CODE_B5F07B:					;	   |
	STA $AC					;$B5F07B   |
CODE_B5F07D:					;	   |
	LDA $A8					;$B5F07D   |
	CLC					;$B5F07F   |
	ADC $AC					;$B5F080   |
	STA $AC					;$B5F082   |
	LDA $AA					;$B5F084   |
	ADC $AE					;$B5F086   |
	STA $AE					;$B5F088   |
	ORA $AC					;$B5F08A   |
endif						;	   |
	BEQ CODE_B5F0B9				;$B5F08C   |
	LDA $D2					;$B5F08E   |
	CLC					;$B5F090   |
	ADC $92					;$B5F091   |
	STA $D2					;$B5F093   |
	LDA $D4					;$B5F095   |
	ADC $94					;$B5F097   |
	STA $D4					;$B5F099   |
if !version == 0				;	   |
	EOR $B0					;$B5F09B   |
	BMI CODE_B5F0C4				;$B5F09D   |
	LDA $B0					;$B5F09F   |
else						;	   |
	EOR $AE					;$B5F09B   |
	BMI CODE_B5F0C4				;$B5F09D   |
	LDA $AE					;$B5F09F   |
endif						;	   |
	BPL CODE_B5F0AF				;$B5F0A1   |
	CMP $D4					;$B5F0A3   |
	BNE CODE_B5F0AB				;$B5F0A5   |
if !version == 0				;	   |
	LDA $AE					;$B5F0A7   |
else						;	   |
	LDA $AC					;$B5F0A7   |
endif						;	   |
	CMP $D2					;$B5F0A9   |
CODE_B5F0AB:					;	   |
	BCS CODE_B5F0B9				;$B5F0AB   |
	BCC CODE_B5F0C1				;$B5F0AD   |
CODE_B5F0AF:					;	   |
	CMP $D4					;$B5F0AF   |
	BNE CODE_B5F0B7				;$B5F0B1   |
if !version == 0				;	   |
	LDA $AE					;$B5F0B3   |
else						;	   |
	LDA $AC					;$B5F0B3   |
endif						;	   |
	CMP $D2					;$B5F0B5   |
CODE_B5F0B7:					;	   |
	BCS CODE_B5F0C1				;$B5F0B7   |
CODE_B5F0B9:					;	   |
if !version == 0				;	   |
	LDA $AE					;$B5F0B9   |
	STA $D2					;$B5F0BB   |
	LDA $B0					;$B5F0BD   |
else						;	   |
	LDA $AC					;$B5F0B9   |
	STA $D2					;$B5F0BB   |
	LDA $AE					;$B5F0BD   |
endif						;	   |
	STA $D4					;$B5F0BF   |
CODE_B5F0C1:					;	   |
	REP #$10				;$B5F0C1   |
	RTS					;$B5F0C3  /

CODE_B5F0C4:
	LDA $D4					;$B5F0C4  \
	ASL A					;$B5F0C6   |
	ROR $D4					;$B5F0C7   |
	ROR $D2					;$B5F0C9   |
	BRA CODE_B5F0C1				;$B5F0CB  /

CODE_B5F0CD:
	BPL CODE_B5F0D3				;$B5F0CD  \
	EOR #$FFFF				;$B5F0CF   |
	INC A					;$B5F0D2   |
CODE_B5F0D3:					;	   |
	STA $0AF6				;$B5F0D3   |
	LDA #$4000				;$B5F0D6   |
	TRB $0AFA				;$B5F0D9   |
	RTL					;$B5F0DC  /

	BPL CODE_B5F0E3				;$B5F0DD   |
	EOR #$FFFF				;$B5F0DF   |
	INC A					;$B5F0E2   |
CODE_B5F0E3:					;	   |
	STA $0AF6				;$B5F0E3   |
	LDA #$4000				;$B5F0E6   |
	TSB $0AFA				;$B5F0E9   |
	RTL					;$B5F0EC  /

CODE_B5F0ED:
	BPL CODE_B5F0F3				;$B5F0ED  \
	EOR #$FFFF				;$B5F0EF   |
	INC A					;$B5F0F2   |
CODE_B5F0F3:					;	   |
	STA $0AF8				;$B5F0F3   |
	LDA #$8000				;$B5F0F6   |
	TSB $0AFA				;$B5F0F9   |
	RTL					;$B5F0FC  /

CODE_B5F0FD:
	JSL CODE_B5F3E9				;$B5F0FD  \
	JSR CODE_B5F75D				;$B5F101   |
	JSL CODE_B5F4C4				;$B5F104   |
	RTL					;$B5F108  /

CODE_B5F109:
	PHB					;$B5F109  \
	PHK					;$B5F10A   |
	PLB					;$B5F10B   |
	LDA #$6682				;$B5F10C   |
	JSL CODE_BB8A65				;$B5F10F   |
	CLC					;$B5F113   |
	ADC #$01E0				;$B5F114   |
	ORA #$2000				;$B5F117   |
	STA $0D2C				;$B5F11A   |
	LDA #$0000				;$B5F11D   |
	STA $7FD734				;$B5F120   |
	LDA $08BC				;$B5F124   |
	CMP #$0109				;$B5F127   |
	BCC CODE_B5F12F				;$B5F12A   |
	LDA #$0109				;$B5F12C   |
CODE_B5F12F:					;	   |
	STA $096D				;$B5F12F   |
	CMP #$0099				;$B5F132   |
	BCC CODE_B5F13A				;$B5F135   |
	LDA #$0099				;$B5F137   |
CODE_B5F13A:					;	   |
	STA $096B				;$B5F13A   |
	LDA #$0001				;$B5F13D   |
	STA $0D30				;$B5F140   |
	STZ $0D2E				;$B5F143   |
	STZ $4E					;$B5F146   |
	STZ $50					;$B5F148   |
	LDA #$00FD				;$B5F14A   |
	STA $44					;$B5F14D   |
	LDA $0AB4				;$B5F14F   |
	ASL A					;$B5F152   |
	ADC $0AB4				;$B5F153   |
	ASL A					;$B5F156   |
	TAX					;$B5F157   |
	LDA DATA_B5F3AD,x			;$B5F158   |
	STA $3C					;$B5F15B   |
	LDA DATA_B5F3AF,x			;$B5F15D   |
	STA $3E					;$B5F160   |
	LDA DATA_B5F3B1,x			;$B5F162   |
	STA $36					;$B5F165   |
	LDA level_number			;$B5F167   |
	ASL A					;$B5F169   |
	TAX					;$B5F16A   |
	LDA.l DATA_FDAC4D,x			;$B5F16B   |
	SEC					;$B5F16F   |
	SBC.l DATA_FDAC4B,x			;$B5F170   |
	LSR A					;$B5F174   |
	LSR A					;$B5F175   |
	STA $34					;$B5F176   |
	LDA.l DATA_FDAC4B,x			;$B5F178   |
	TAX					;$B5F17C   |
	PEA $7FA6				;$B5F17D   |
	PLB					;$B5F180   |
	PLB					;$B5F181   |
	LDY #$0000				;$B5F182   |
	LDA #$B232				;$B5F185   |
	STA $39					;$B5F188   |
CODE_B5F18A:					;	   |
	DEC $34					;$B5F18A   |
	BPL CODE_B5F192				;$B5F18C   |
	TYX					;$B5F18E   |
	BRL CODE_B5F255				;$B5F18F  /

CODE_B5F192:
	PHY					;$B5F192  \
	PHX					;$B5F193   |
	LDA.l DATA_FDAC4B,x			;$B5F194   |
	AND #$000F				;$B5F198   |
	ASL A					;$B5F19B   |
	TAX					;$B5F19C   |
	LDA.l DATA_B5F38D,x			;$B5F19D   |
	PLX					;$B5F1A1   |
	PHX					;$B5F1A2   |
	STA $A63A,y				;$B5F1A3   |
	LDA.l DATA_FDAC4B,x			;$B5F1A6   |
	LSR A					;$B5F1AA   |
	AND $3C					;$B5F1AB   |
	CLC					;$B5F1AD   |
	ADC #$0100				;$B5F1AE   |
	STA $A632,y				;$B5F1B1   |
	LDA.l DATA_FDAC4C,x			;$B5F1B4   |
	%return(CODE_B5F1BE)			;$B5F1B8   |
	JMP ($0036)				;$B5F1BB  /

CODE_B5F1BE:
	AND $3E					;$B5F1BE  \
	CLC					;$B5F1C0   |
	ADC #$0100				;$B5F1C1   |
	STA $A634,y				;$B5F1C4   |
	LDA $39					;$B5F1C7   |
	STA $A63C,y				;$B5F1C9   |
	LDA.l DATA_FDAC4E,x			;$B5F1CC   |
	AND #$00FF				;$B5F1D0   |
	ASL A					;$B5F1D3   |
	ADC.l DATA_FDAC49			;$B5F1D4   |
	STA $42					;$B5F1D8   |
	LDA [$42]				;$B5F1DA   |
	CLC					;$B5F1DC   |
	ADC.l DATA_FDAC49			;$B5F1DD   |
	STA $42					;$B5F1E1   |
	LDA [$42]				;$B5F1E3   |
	AND #$00FF				;$B5F1E5   |
	STA $40					;$B5F1E8   |
	ASL A					;$B5F1EA   |
	STA $A636,y				;$B5F1EB   |
	ASL A					;$B5F1EE   |
	ASL A					;$B5F1EF   |
	STA $A638,y				;$B5F1F0   |
	LDA $A634,y				;$B5F1F3   |
	CLC					;$B5F1F6   |
	SBC $50					;$B5F1F7   |
	BPL CODE_B5F209				;$B5F1F9   |
	LDA $4E					;$B5F1FB   |
	STA $A63E,y				;$B5F1FD   |
	TYX					;$B5F200   |
	TAY					;$B5F201   |
	TXA					;$B5F202   |
	STA $A640,y				;$B5F203   |
	STA $4E					;$B5F206   |
	TAY					;$B5F208   |
CODE_B5F209:					;	   |
	LDA $A634,y				;$B5F209   |
	STA $50					;$B5F20C   |
	LDY #$0001				;$B5F20E   |
	LDA [$42],y				;$B5F211   |
	ASL A					;$B5F213   |
	AND #$007F				;$B5F214   |
	TAX					;$B5F217   |
	LDA.l DATA_B5F38B,x			;$B5F218   |
	STA $4C					;$B5F21C   |
	STA $4A					;$B5F21E   |
	LDX $39					;$B5F220   |
	INY					;$B5F222   |
CODE_B5F223:					;	   |
	LDA [$42],y				;$B5F223   |
	INY					;$B5F225   |
	INY					;$B5F226   |
	SEC					;$B5F227   |
CODE_B5F228:					;	   |
	ROR A					;$B5F228   |
	BEQ CODE_B5F223				;$B5F229   |
	ROR $4A					;$B5F22B   |
	BCC CODE_B5F228				;$B5F22D   |
	STA $32					;$B5F22F   |
	LDA $4A					;$B5F231   |
	STA $7F0000,x				;$B5F233   |
	LDA $4C					;$B5F237   |
	STA $4A					;$B5F239   |
	LDA $32					;$B5F23B   |
	INX					;$B5F23D   |
	INX					;$B5F23E   |
	DEC $40					;$B5F23F   |
	CLC					;$B5F241   |
	BNE CODE_B5F228				;$B5F242   |
	STX $39					;$B5F244   |
	PLA					;$B5F246   |
	CLC					;$B5F247   |
	ADC #$0004				;$B5F248   |
	TAX					;$B5F24B   |
	PLA					;$B5F24C   |
	CLC					;$B5F24D   |
	ADC #$0010				;$B5F24E   |
	TAY					;$B5F251   |
	BRL CODE_B5F18A				;$B5F252  /

CODE_B5F255:
	STX $44					;$B5F255  \
	LDA #$0000				;$B5F257   |
	STA $7FA634,x				;$B5F25A   |
	STA $7FA63C,x				;$B5F25E   |
	STA $7FA640,x				;$B5F262   |
	DEC A					;$B5F266   |
	STA $7FA632,x				;$B5F267   |
	LDA $4E					;$B5F26B   |
	STA $7FA63E,x				;$B5F26D   |
	TXA					;$B5F271   |
	LDX $4E					;$B5F272   |
	STA $7FA640,x				;$B5F274   |
	LDX $44					;$B5F278   |
	BNE CODE_B5F27F				;$B5F27A   |
	BRL CODE_B5F36F				;$B5F27C  /

CODE_B5F27F:
	LDX $44					;$B5F27F  \
	TXA					;$B5F281   |
	SEC					;$B5F282   |
	SBC #$0010				;$B5F283   |
	STA $42					;$B5F286   |
	LDA.l $7FA63E,x				;$B5F288   |
	BEQ CODE_B5F2EB				;$B5F28C   |
	STA $44					;$B5F28E   |
	CMP $42					;$B5F290   |
	BEQ CODE_B5F27F				;$B5F292   |
	TAX					;$B5F294   |
	SEC					;$B5F295   |
	SBC #$0010				;$B5F296   |
	STA $46					;$B5F299   |
	LDA.l $7FA63E,x				;$B5F29B   |
	STA $48					;$B5F29F   |
	LDX $46					;$B5F2A1   |
	LDA.l $7FA634,x				;$B5F2A3   |
	STA $36					;$B5F2A7   |
	LDX $42					;$B5F2A9   |
CODE_B5F2AB:					;	   |
	LDA.l $7FA634,x				;$B5F2AB   |
	CMP $36					;$B5F2AF   |
	BCC CODE_B5F2C4				;$B5F2B1   |
	LDA $46					;$B5F2B3   |
	STA $7FA63E,x				;$B5F2B5   |
	TXA					;$B5F2B9   |
	SBC #$0010				;$B5F2BA   |
	TAX					;$B5F2BD   |
	CMP $44					;$B5F2BE   |
	BNE CODE_B5F2AB				;$B5F2C0   |
	BRA CODE_B5F27F				;$B5F2C2  /

CODE_B5F2C4:
	LDA $46					;$B5F2C4  \
	CMP $48					;$B5F2C6   |
	BEQ CODE_B5F2DA				;$B5F2C8   |
	SBC #$0010				;$B5F2CA   |
	STA $46					;$B5F2CD   |
	TXY					;$B5F2CF   |
	TAX					;$B5F2D0   |
	LDA.l $7FA634,x				;$B5F2D1   |
	STA $36					;$B5F2D5   |
	TYX					;$B5F2D7   |
	BRA CODE_B5F2AB				;$B5F2D8  /

CODE_B5F2DA:
	LDA $46					;$B5F2DA  \
	STA $7FA63E,x				;$B5F2DC   |
	TXA					;$B5F2E0   |
	CMP $44					;$B5F2E1   |
	BEQ CODE_B5F27F				;$B5F2E3   |
	SBC #$0010				;$B5F2E5   |
	TAX					;$B5F2E8   |
	BRA CODE_B5F2DA				;$B5F2E9  /

CODE_B5F2EB:
	LDX $42					;$B5F2EB  \
CODE_B5F2ED:					;	   |
	LDA #$FFFF				;$B5F2ED   |
	STA $7FA63E,x				;$B5F2F0   |
	TXA					;$B5F2F4   |
	SBC #$0010				;$B5F2F5   |
	TAX					;$B5F2F8   |
	BCS CODE_B5F2ED				;$B5F2F9   |
	STZ $44					;$B5F2FB   |
CODE_B5F2FD:					;	   |
	LDX $44					;$B5F2FD   |
	TXA					;$B5F2FF   |
	CLC					;$B5F300   |
	ADC #$0010				;$B5F301   |
	STA $42					;$B5F304   |
	LDA.l $7FA640,x				;$B5F306   |
	BEQ CODE_B5F36F				;$B5F30A   |
	STA $44					;$B5F30C   |
	CMP $42					;$B5F30E   |
	BEQ CODE_B5F2FD				;$B5F310   |
	STA $46					;$B5F312   |
	TAX					;$B5F314   |
	LDA.l $7FA640,x				;$B5F315   |
	STA $48					;$B5F319   |
	LDA.l $7FA634,x				;$B5F31B   |
	CLC					;$B5F31F   |
	ADC #$0167				;$B5F320   |
	STA $36					;$B5F323   |
	LDX $42					;$B5F325   |
CODE_B5F327:					;	   |
	LDA.l $7FA624,x				;$B5F327   |
	CMP $36					;$B5F32B   |
	BCS CODE_B5F340				;$B5F32D   |
	LDA $46					;$B5F32F   |
	STA $7FA640,x				;$B5F331   |
	TXA					;$B5F335   |
	ADC #$0010				;$B5F336   |
	TAX					;$B5F339   |
	CMP $44					;$B5F33A   |
	BCC CODE_B5F327				;$B5F33C   |
	BCS CODE_B5F2FD				;$B5F33E   |
CODE_B5F340:					;	   |
	LDA $46					;$B5F340   |
	ADC #$000F				;$B5F342   |
	CMP $48					;$B5F345   |
	BCS CODE_B5F35C				;$B5F347   |
	STA $46					;$B5F349   |
	STX $42					;$B5F34B   |
	TAX					;$B5F34D   |
	LDA.l $7FA634,x				;$B5F34E   |
	CLC					;$B5F352   |
	ADC #$0167				;$B5F353   |
	STA $36					;$B5F356   |
	LDX $42					;$B5F358   |
	BRA CODE_B5F327				;$B5F35A  /

CODE_B5F35C:
	CLC					;$B5F35C  \
CODE_B5F35D:					;	   |
	LDA $46					;$B5F35D   |
	STA $7FA640,x				;$B5F35F   |
	TXA					;$B5F363   |
	ADC #$0010				;$B5F364   |
	TAX					;$B5F367   |
	CMP $44					;$B5F368   |
	BCC CODE_B5F35D				;$B5F36A   |
	BRL CODE_B5F2FD				;$B5F36C  /

CODE_B5F36F:
	LDA #$FFFE				;$B5F36F  \
	STA $7FD632				;$B5F372   |
	LDA #$0001				;$B5F376   |
	STA $000D36				;$B5F379   |
	LDA $0593				;$B5F37D   |
	STA $000D32				;$B5F380   |
	LDA #$0000				;$B5F384   |
	STA $000D38				;$B5F387   |
	PLB					;$B5F38B   |
	RTL					;$B5F38C  /


DATA_B5F38D:
	%offset(DATA_B5F38B, -2)
	db $01, $00, $02, $00, $04, $00, $08, $00
	db $10, $00, $20, $00, $40, $00, $80, $00
	db $00, $01, $00, $02, $00, $04, $00, $08
	db $00, $10, $00, $20, $00, $40, $00, $80

DATA_B5F3AD:
	%offset(DATA_B5F3AF, 2)
	%offset(DATA_B5F3B1, 4)
	db $F8, $3F, $F8, $03 : dw CODE_B5F3E4
	db $F8, $1F, $F8, $07 : dw CODE_B5F3E5
	db $F8, $0F, $F8, $0F : dw CODE_B5F3E6
	db $F8, $0F, $F8, $0F : dw CODE_B5F3E6
	db $F8, $07, $F8, $1F : dw CODE_B5F3E7
	db $F8, $03, $F8, $3F : dw CODE_B5F3E8
	db $F8, $0F, $F8, $0F : dw CODE_B5F3E6
	db $F8, $0F, $F8, $0F : dw CODE_B5F3E6
	db $F8, $7F, $F8, $01 : dw CODE_B5F3E3


CODE_B5F3E3:
	LSR A					;$B5F3E3  \
CODE_B5F3E4:					;	   |
	LSR A					;$B5F3E4   |
CODE_B5F3E5:					;	   |
	LSR A					;$B5F3E5   |
CODE_B5F3E6:					;	   |
	LSR A					;$B5F3E6   |
CODE_B5F3E7:					;	   |
	LSR A					;$B5F3E7   |
CODE_B5F3E8:					;	   |
	RTS					;$B5F3E8  /

CODE_B5F3E9:
	LDA $17BA				;$B5F3E9  \
	SEC					;$B5F3EC   |
	SBC #$0107				;$B5F3ED   |
	BPL CODE_B5F3F5				;$B5F3F0   |
	LDA #$0000				;$B5F3F2   |
CODE_B5F3F5:					;	   |
	STA $44					;$B5F3F5   |
	LDA $17C2				;$B5F3F7   |
	SEC					;$B5F3FA   |
	SBC #$008F				;$B5F3FB   |
	BPL CODE_B5F403				;$B5F3FE   |
	LDA #$0000				;$B5F400   |
CODE_B5F403:					;	   |
	STA $46					;$B5F403   |
	LDX $0D2E				;$B5F405   |
	LDA.l $7FA632,x				;$B5F408   |
	CMP $44					;$B5F40C   |
	BCS CODE_B5F463				;$B5F40E   |
	LDA.l $7FA634,x				;$B5F410   |
	CMP $46					;$B5F414   |
	BCS CODE_B5F43B				;$B5F416   |
	LDA.l $7FA640,x				;$B5F418   |
	TAX					;$B5F41C   |
	LDA.l $7FA632,x				;$B5F41D   |
	CMP $44					;$B5F421   |
	BCC CODE_B5F45F				;$B5F423   |
	LDA $0D2E				;$B5F425   |
	ADC #$000F				;$B5F428   |
	TAX					;$B5F42B   |
	LDA.l $7FA634,x				;$B5F42C   |
	CMP $7FA624,x				;$B5F430   |
	BCC CODE_B5F462				;$B5F434   |
	CMP $46					;$B5F436   |
	BCC CODE_B5F45F				;$B5F438   |
	RTL					;$B5F43A  /

CODE_B5F43B:
	LDA.l $7FA640,x				;$B5F43B  \
	TAX					;$B5F43F   |
	LDA.l $7FA632,x				;$B5F440   |
	CMP $44					;$B5F444   |
	BCC CODE_B5F45F				;$B5F446   |
	LDA $0D2E				;$B5F448   |
	SBC #$0010				;$B5F44B   |
	BMI CODE_B5F462				;$B5F44E   |
	TAX					;$B5F450   |
	LDA.l $7FA634,x				;$B5F451   |
	CMP $7FA644,x				;$B5F455   |
	BCS CODE_B5F462				;$B5F459   |
	CMP $46					;$B5F45B   |
	BCC CODE_B5F462				;$B5F45D   |
CODE_B5F45F:					;	   |
	STX $0D2E				;$B5F45F   |
CODE_B5F462:					;	   |
	RTL					;$B5F462  /

CODE_B5F463:
	INC A					;$B5F463  \
	BEQ CODE_B5F4C3				;$B5F464   |
	LDA.l $7FA634,x				;$B5F466   |
	CMP $46					;$B5F46A   |
	BCS CODE_B5F496				;$B5F46C   |
	LDA.l $7FA63E,x				;$B5F46E   |
	BMI CODE_B5F480				;$B5F472   |
	TAX					;$B5F474   |
	LDA.l $7FA632,x				;$B5F475   |
	CMP $44					;$B5F479   |
	BCS CODE_B5F4C0				;$B5F47B   |
	STX $0D2E				;$B5F47D   |
CODE_B5F480:					;	   |
	LDA $0D2E				;$B5F480   |
	ADC #$0010				;$B5F483   |
	TAX					;$B5F486   |
	LDA.l $7FA634,x				;$B5F487   |
	CMP $7FA624,x				;$B5F48B   |
	BCC CODE_B5F4C3				;$B5F48F   |
	CMP $46					;$B5F491   |
	BCC CODE_B5F4C0				;$B5F493   |
	RTL					;$B5F495  /

CODE_B5F496:
	LDA.l $7FA63E,x				;$B5F496  \
	BMI CODE_B5F4A9				;$B5F49A   |
	TAX					;$B5F49C   |
	LDA.l $7FA632,x				;$B5F49D   |
	CMP $44					;$B5F4A1   |
	BCS CODE_B5F4C0				;$B5F4A3   |
	STX $0D2E				;$B5F4A5   |
	SEC					;$B5F4A8   |
CODE_B5F4A9:					;	   |
	LDA $0D2E				;$B5F4A9   |
	SBC #$0010				;$B5F4AC   |
	BMI CODE_B5F4C3				;$B5F4AF   |
	TAX					;$B5F4B1   |
	LDA.l $7FA634,x				;$B5F4B2   |
	CMP $7FA644,x				;$B5F4B6   |
	BCS CODE_B5F4C3				;$B5F4BA   |
	CMP $46					;$B5F4BC   |
	BCC CODE_B5F4C3				;$B5F4BE   |
CODE_B5F4C0:					;	   |
	STX $0D2E				;$B5F4C0   |
CODE_B5F4C3:					;	   |
	RTL					;$B5F4C3  /

CODE_B5F4C4:
	PHB					;$B5F4C4  \
	PHK					;$B5F4C5   |
	PLB					;$B5F4C6   |
	LDA $70					;$B5F4C7   |
	CMP #$0400				;$B5F4C9   |
	BCS CODE_B5F536				;$B5F4CC   |
	STA WRAM.address			;$B5F4CE   |
	STZ WRAM.bank				;$B5F4D1   |
	SEC					;$B5F4D4   |
	SBC #$0200				;$B5F4D5   |
	LSR A					;$B5F4D8   |
	LSR A					;$B5F4D9   |
	SEP #$30				;$B5F4DA   |
	STA $32					;$B5F4DC   |
	AND #$03				;$B5F4DE   |
	TAY					;$B5F4E0   |
	EOR $32					;$B5F4E1   |
	LSR A					;$B5F4E3   |
	LSR A					;$B5F4E4   |
	ADC #$60				;$B5F4E5   |
	STA $38					;$B5F4E7   |
	TAX					;$B5F4E9   |
	LDA $03A0,x				;$B5F4EA   |
	AND DATA_B5F538,y			;$B5F4ED   |
	ORA DATA_B5F53C,y			;$B5F4F0   |
	SEC					;$B5F4F3   |
CODE_B5F4F4:					;	   |
	ROL A					;$B5F4F4   |
	ROL A					;$B5F4F5   |
	BCC CODE_B5F4F4				;$B5F4F6   |
	STA $4A					;$B5F4F8   |
	LDA #$7F				;$B5F4FA   |
	STA $3B					;$B5F4FC   |
	REP #$30				;$B5F4FE   |
	JSR CODE_B5F540				;$B5F500   |
	JSR CODE_B5F9F5				;$B5F503   |
	LDA $38					;$B5F506   |
	BIT #$0080				;$B5F508   |
	BNE CODE_B5F536				;$B5F50B   |
	SEC					;$B5F50D   |
	SBC #$0060				;$B5F50E   |
	AND #$001F				;$B5F511   |
	TAY					;$B5F514   |
	ASL A					;$B5F515   |
	ASL A					;$B5F516   |
	ASL A					;$B5F517   |
	ASL A					;$B5F518   |
	ADC #$0200				;$B5F519   |
	STA $70					;$B5F51C   |
	LDX #$0004				;$B5F51E   |
	SEP #$20				;$B5F521   |
	LDA $4A					;$B5F523   |
CODE_B5F525:					;	   |
	DEX					;$B5F525   |
	LSR A					;$B5F526   |
	LSR A					;$B5F527   |
	BCC CODE_B5F525				;$B5F528   |
	STA $0400,y				;$B5F52A   |
	REP #$20				;$B5F52D   |
	TXA					;$B5F52F   |
	ASL A					;$B5F530   |
	ASL A					;$B5F531   |
	ADC $70					;$B5F532   |
	STA $70					;$B5F534   |
CODE_B5F536:					;	   |
	PLB					;$B5F536   |
	RTL					;$B5F537  /

DATA_B5F538:
	db $00, $03, $0F, $3F

DATA_B5F53C:
	db $01, $04, $10, $40

CODE_B5F540:
	LDA $17BA				;$B5F540  \
	CLC					;$B5F543   |
	ADC #$0100				;$B5F544   |
	STA $44					;$B5F547   |
	LDA $17C0				;$B5F549   |
	CLC					;$B5F54C   |
	ADC #$00E0				;$B5F54D   |
	STA $46					;$B5F550   |
	SEC					;$B5F552   |
	SBC #$0167				;$B5F553   |
	BPL CODE_B5F55B				;$B5F556   |
	LDA #$0000				;$B5F558   |
CODE_B5F55B:					;	   |
	STA $48					;$B5F55B   |
	LDX $0D2E				;$B5F55D   |
CODE_B5F560:					;	   |
	SEC					;$B5F560   |
CODE_B5F561:					;	   |
	LDA.l $7FA632,x				;$B5F561   |
	SBC $44					;$B5F565   |
	BCS CODE_B5F5E0				;$B5F567   |
	ADC $7FA638,x				;$B5F569   |
	ADC #$010F				;$B5F56D   |
	BMI CODE_B5F59A				;$B5F570   |
	LDA.l $7FA634,x				;$B5F572   |
	CMP $46					;$B5F576   |
	BCS CODE_B5F5AF				;$B5F578   |
	CMP $48					;$B5F57A   |
	BCS CODE_B5F5B6				;$B5F57C   |
CODE_B5F57E:					;	   |
	TXA					;$B5F57E   |
	ADC #$0010				;$B5F57F   |
	TAX					;$B5F582   |
	LDA.l $7FA634,x				;$B5F583   |
	CMP $7FA624,x				;$B5F587   |
	BCC CODE_B5F593				;$B5F58B   |
	CMP $48					;$B5F58D   |
	BCC CODE_B5F57E				;$B5F58F   |
	BCS CODE_B5F561				;$B5F591   |
CODE_B5F593:					;	   |
	LDA.l $7FA630,x				;$B5F593   |
	TAX					;$B5F597   |
	BRA CODE_B5F560				;$B5F598  /

CODE_B5F59A:
	LDA.l $7FA634,x				;$B5F59A  \
	CMP $7FA644,x				;$B5F59E   |
	BCS CODE_B5F5AF				;$B5F5A2   |
	CMP $46					;$B5F5A4   |
	BCS CODE_B5F5AF				;$B5F5A6   |
	TXA					;$B5F5A8   |
	ADC #$0010				;$B5F5A9   |
	TAX					;$B5F5AC   |
	BRA CODE_B5F560				;$B5F5AD  /

CODE_B5F5AF:
	LDA.l $7FA640,x				;$B5F5AF  \
	TAX					;$B5F5B3   |
	BCS CODE_B5F561				;$B5F5B4   |
CODE_B5F5B6:					;	   |
	PHX					;$B5F5B6   |
	LDA.l $7FA63A,x				;$B5F5B7   |
	AND $0D30				;$B5F5BB   |
	BEQ CODE_B5F5C8				;$B5F5BE   |
	JSR CODE_B5F5E1				;$B5F5C0   |
	PLX					;$B5F5C3   |
	PHX					;$B5F5C4   |
	JSR CODE_B5F79A				;$B5F5C5   |
CODE_B5F5C8:					;	   |
	PLA					;$B5F5C8   |
	CLC					;$B5F5C9   |
	ADC #$0010				;$B5F5CA   |
	TAX					;$B5F5CD   |
	LDA.l $7FA634,x				;$B5F5CE   |
	CMP $7FA624,x				;$B5F5D2   |
	BCS CODE_B5F561				;$B5F5D6   |
	LDA.l $7FA630,x				;$B5F5D8   |
	TAX					;$B5F5DC   |
	BRL CODE_B5F560				;$B5F5DD  /

CODE_B5F5E0:
	RTS					;$B5F5E0  /

CODE_B5F5E1:
	LDA.l $7FA634,x				;$B5F5E1  \
	SEC					;$B5F5E5   |
	SBC $17C0				;$B5F5E6   |
	STA $3E					;$B5F5E9   |
	BCS CODE_B5F5FA				;$B5F5EB   |
	ADC #$008F				;$B5F5ED   |
	LSR A					;$B5F5F0   |
	LSR A					;$B5F5F1   |
	LSR A					;$B5F5F2   |
	ASL A					;$B5F5F3   |
	TAY					;$B5F5F4   |
	LDA DATA_B5FAA2,y			;$B5F5F5   |
	BRA CODE_B5F60A				;$B5F5F8  /

CODE_B5F5FA:
	LDY #$0000				;$B5F5FA  \
	SBC #$0060				;$B5F5FD   |
	BCC CODE_B5F607				;$B5F600   |
	LSR A					;$B5F602   |
	LSR A					;$B5F603   |
	LSR A					;$B5F604   |
	ASL A					;$B5F605   |
	TAY					;$B5F606   |
CODE_B5F607:					;	   |
	LDA DATA_B5FAC4,y			;$B5F607   |
CODE_B5F60A:					;	   |
	STA $40					;$B5F60A   |
	LDA.l $7FA632,x				;$B5F60C   |
	SEC					;$B5F610   |
	SBC $17BA				;$B5F611   |
	STA $3C					;$B5F614   |
	BCS CODE_B5F63F				;$B5F616   |
	ADC #$000F				;$B5F618   |
	BCS CODE_B5F63F				;$B5F61B   |
	ADC $7FA638,x				;$B5F61D   |
	LSR A					;$B5F621   |
	LSR A					;$B5F622   |
	LSR A					;$B5F623   |
	ASL A					;$B5F624   |
	STA $32					;$B5F625   |
	LDA.l $7FA636,x				;$B5F627   |
	SEC					;$B5F62B   |
	SBC $32					;$B5F62C   |
	TAY					;$B5F62E   |
	CLC					;$B5F62F   |
	ADC $7FA63C,x				;$B5F630   |
	STA $39					;$B5F634   |
	TYA					;$B5F636   |
	ASL A					;$B5F637   |
	ASL A					;$B5F638   |
	ADC $3C					;$B5F639   |
	STA $3C					;$B5F63B   |
	BRA CODE_B5F65B				;$B5F63D  /

CODE_B5F63F:
	LDA #$0107				;$B5F63F  \
	SEC					;$B5F642   |
	SBC $3C					;$B5F643   |
	LSR A					;$B5F645   |
	LSR A					;$B5F646   |
	LSR A					;$B5F647   |
	ASL A					;$B5F648   |
	CMP $7FA636,x				;$B5F649   |
	BCC CODE_B5F653				;$B5F64D   |
	LDA.l $7FA636,x				;$B5F64F   |
CODE_B5F653:					;	   |
	STA $32					;$B5F653   |
	LDA.l $7FA63C,x				;$B5F655   |
	STA $39					;$B5F659   |
CODE_B5F65B:					;	   |
	LDA global_frame_counter		;$B5F65B   |
	LSR A					;$B5F65D   |
	ASL A					;$B5F65E   |
	ASL A					;$B5F65F   |
	ADC $7FA632,x				;$B5F660   |
	CLC					;$B5F664   |
	ADC $7FA634,x				;$B5F665   |
	LSR A					;$B5F669   |
	LSR A					;$B5F66A   |
	CLC					;$B5F66B   |
	ADC $39					;$B5F66C   |
	SEC					;$B5F66E   |
	SBC.l $7FA63C,x				;$B5F66F   |
	AND #$000E				;$B5F673   |
	ORA $0D2C				;$B5F676   |
	STA $42					;$B5F679   |
	BRA CODE_B5F681				;$B5F67B  /

CODE_B5F67D:
	REP #$10				;$B5F67D  \
	SEC					;$B5F67F   |
	RTS					;$B5F680  /

CODE_B5F681:
	SEP #$10				;$B5F681  \
	LDY $32					;$B5F683   |
	DEC $3E					;$B5F685   |
CODE_B5F687:					;	   |
	DEY					;$B5F687   |
	DEY					;$B5F688   |
	BMI CODE_B5F67D				;$B5F689   |
	LDA [$39],y				;$B5F68B   |
	AND $40					;$B5F68D   |
	BEQ CODE_B5F687				;$B5F68F   |
	XBA					;$B5F691   |
	PHA					;$B5F692   |
	PLX					;$B5F693   |
	BEQ CODE_B5F6F6				;$B5F694   |
CODE_B5F696:					;	   |
	LDA $3C					;$B5F696   |
	CLC					;$B5F698   |
	ADC DATA_B5FB66,y			;$B5F699   |
	SEP #$21				;$B5F69C   |
	STA WRAM.data				;$B5F69E   |
	LDA $3E					;$B5F6A1   |
	ADC DATA_B5FCA8,x			;$B5F6A3   |
	STA WRAM.data				;$B5F6A6   |
	LDA DATA_B5FCA8,x			;$B5F6A9   |
	LSR A					;$B5F6AC   |
	LSR A					;$B5F6AD   |
	ADC DATA_B5FB26,y			;$B5F6AE   |
	AND #$0E				;$B5F6B1   |
	ADC $42					;$B5F6B3   |
	AND #$EE				;$B5F6B5   |
	STA WRAM.data				;$B5F6B7   |
	LDA $43					;$B5F6BA   |
	STA WRAM.data				;$B5F6BC   |
	XBA					;$B5F6BF   |
	ASL A					;$B5F6C0   |
	LDA $4A					;$B5F6C1   |
	ROR A					;$B5F6C3   |
	SEC					;$B5F6C4   |
	ROR A					;$B5F6C5   |
	BCS CODE_B5F6DE				;$B5F6C6   |
	STA $4A					;$B5F6C8   |
	REP #$20				;$B5F6CA   |
	LDA.l DATA_B5FBA8,x			;$B5F6CC   |
	TAX					;$B5F6D0   |
	BNE CODE_B5F696				;$B5F6D1   |
	BRA CODE_B5F6F6				;$B5F6D3  /

CODE_B5F6D5:
	REP #$30				;$B5F6D5  \
	PLA					;$B5F6D7   |
	LDA #$0400				;$B5F6D8   |
	STA $70					;$B5F6DB   |
	RTS					;$B5F6DD  /

CODE_B5F6DE:
	PHX					;$B5F6DE  \
	LDX $38					;$B5F6DF   |
	STA $03A0,x				;$B5F6E1   |
	INC $38					;$B5F6E4   |
	BMI CODE_B5F6D5				;$B5F6E6   |
	LDA #$8580				;$B5F6E8   |
	LSR A					;$B5F6EB   |
	PLX					;$B5F6EC   |
	REP #$20				;$B5F6ED   |
	LDA.l DATA_B5FBA8,x			;$B5F6EF   |
	TAX					;$B5F6F3   |
	BNE CODE_B5F696				;$B5F6F4   |
CODE_B5F6F6:					;	   |
	PLX					;$B5F6F6   |
	BEQ CODE_B5F687				;$B5F6F7   |
CODE_B5F6F9:					;	   |
	LDA $3C					;$B5F6F9   |
	CLC					;$B5F6FB   |
	ADC DATA_B5FB66,y			;$B5F6FC   |
	SEP #$21				;$B5F6FF   |
	STA WRAM.data				;$B5F701   |
	LDA $3E					;$B5F704   |
	ADC DATA_B5FDA8,x			;$B5F706   |
	STA WRAM.data				;$B5F709   |
	LDA DATA_B5FDA8,x			;$B5F70C   |
	LSR A					;$B5F70F   |
	LSR A					;$B5F710   |
	ADC DATA_B5FB26,y			;$B5F711   |
	AND #$0E				;$B5F714   |
	ADC $42					;$B5F716   |
	AND #$EE				;$B5F718   |
	STA WRAM.data				;$B5F71A   |
	LDA $43					;$B5F71D   |
	STA WRAM.data				;$B5F71F   |
	XBA					;$B5F722   |
	ASL A					;$B5F723   |
	LDA $4A					;$B5F724   |
	ROR A					;$B5F726   |
	SEC					;$B5F727   |
	ROR A					;$B5F728   |
	BCS CODE_B5F742				;$B5F729   |
	STA $4A					;$B5F72B   |
	REP #$20				;$B5F72D   |
	LDA.l DATA_B5FBA8,x			;$B5F72F   |
	TAX					;$B5F733   |
	BNE CODE_B5F6F9				;$B5F734   |
	BRL CODE_B5F687				;$B5F736  /

CODE_B5F739:
	PLX					;$B5F739  \
	REP #$30				;$B5F73A   |
	LDA #$0400				;$B5F73C   |
	STA $70					;$B5F73F   |
	RTS					;$B5F741  /

CODE_B5F742:
	PHX					;$B5F742  \
	LDX $38					;$B5F743   |
	STA $03A0,x				;$B5F745   |
	INC $38					;$B5F748   |
	BMI CODE_B5F739				;$B5F74A   |
	LDA #$8580				;$B5F74C   |
	LSR A					;$B5F74F   |
	PLX					;$B5F750   |
	REP #$20				;$B5F751   |
	LDA.l DATA_B5FBA8,x			;$B5F753   |
	TAX					;$B5F757   |
	BNE CODE_B5F6F9				;$B5F758   |
	BRL CODE_B5F687				;$B5F75A  /

CODE_B5F75D:
	STZ $0D42				;$B5F75D  \
	STZ $0D44				;$B5F760   |
	LDY #$0000				;$B5F763   |
	LDX #$09B3				;$B5F766   |
	JSR CODE_B5F77A				;$B5F769   |
	LDX #$09EB				;$B5F76C   |
	JSR CODE_B5F77A				;$B5F76F   |
	CPY #$0004				;$B5F772   |
	BCS CODE_B5F799				;$B5F775   |
	LDX #$09CB				;$B5F777   |
CODE_B5F77A:					;	   |
	LDA $04,x				;$B5F77A   |
	BEQ CODE_B5F799				;$B5F77C   |
	SEC					;$B5F77E   |
	SBC $00,x				;$B5F77F   |
	STA $0D42,y				;$B5F781   |
	LDA $00,x				;$B5F784   |
	STA $0D3A,y				;$B5F786   |
	LDA $02,x				;$B5F789   |
	STA $0D3E,y				;$B5F78B   |
	EOR #$FFFF				;$B5F78E   |
	SEC					;$B5F791   |
	ADC $06,x				;$B5F792   |
	STA $0D46,y				;$B5F794   |
	INY					;$B5F797   |
	INY					;$B5F798   |
CODE_B5F799:					;	   |
	RTS					;$B5F799  /

CODE_B5F79A:
	LDA.l $7FA634,x				;$B5F79A  \
	STA $3E					;$B5F79E   |
	LDA.l $7FA636,x				;$B5F7A0   |
	DEC A					;$B5F7A4   |
	DEC A					;$B5F7A5   |
	STA $32					;$B5F7A6   |
	LDY $0D44				;$B5F7A8   |
	BEQ CODE_B5F7B8				;$B5F7AB   |
	LDY #$0002				;$B5F7AD   |
	PHX					;$B5F7B0   |
	JSR CODE_B5F7BE				;$B5F7B1   |
	PLX					;$B5F7B4   |
	LDY #$0000				;$B5F7B5   |
CODE_B5F7B8:					;	   |
	LDA $0D42				;$B5F7B8   |
	BNE CODE_B5F7BE				;$B5F7BB   |
	RTS					;$B5F7BD  /

CODE_B5F7BE:
	LDA.l $7FA632,x				;$B5F7BE  \
	STA $3C					;$B5F7C2   |
	LDA $0D3A,y				;$B5F7C4   |
	SEC					;$B5F7C7   |
	SBC $3C					;$B5F7C8   |
	STA $34					;$B5F7CA   |
	BCC CODE_B5F7D5				;$B5F7CC   |
	SBC #$0008				;$B5F7CE   |
	BCS CODE_B5F7F1				;$B5F7D1   |
	LDA $34					;$B5F7D3   |
CODE_B5F7D5:					;	   |
	DEC A					;$B5F7D5   |
	ADC $0D42,y				;$B5F7D6   |
	BMI CODE_B5F7F0				;$B5F7D9   |
	LSR A					;$B5F7DB   |
	LSR A					;$B5F7DC   |
	LSR A					;$B5F7DD   |
	ASL A					;$B5F7DE   |
	CMP $32					;$B5F7DF   |
	BCC CODE_B5F7E7				;$B5F7E1   |
	BEQ CODE_B5F7E7				;$B5F7E3   |
	LDA $32					;$B5F7E5   |
CODE_B5F7E7:					;	   |
	PHA					;$B5F7E7   |
	LDA.l $7FA63C,x				;$B5F7E8   |
	STA $39					;$B5F7EC   |
	BRA CODE_B5F824				;$B5F7EE  /

CODE_B5F7F0:
	RTS					;$B5F7F0  /

CODE_B5F7F1:
	LSR A					;$B5F7F1  \
	LSR A					;$B5F7F2   |
	LSR A					;$B5F7F3   |
	ASL A					;$B5F7F4   |
	CMP $32					;$B5F7F5   |
	BCC CODE_B5F7FB				;$B5F7F7   |
	BNE CODE_B5F7F0				;$B5F7F9   |
CODE_B5F7FB:					;	   |
	STA $39					;$B5F7FB   |
	ASL A					;$B5F7FD   |
	ASL A					;$B5F7FE   |
	ADC $3C					;$B5F7FF   |
	STA $3C					;$B5F801   |
	DEC $34					;$B5F803   |
	LDA $34					;$B5F805   |
	CLC					;$B5F807   |
	ADC $0D42,y				;$B5F808   |
	LSR A					;$B5F80B   |
	LSR A					;$B5F80C   |
	LSR A					;$B5F80D   |
	ASL A					;$B5F80E   |
	CMP $32					;$B5F80F   |
	BCC CODE_B5F817				;$B5F811   |
	BEQ CODE_B5F817				;$B5F813   |
	LDA $32					;$B5F815   |
CODE_B5F817:					;	   |
	SEC					;$B5F817   |
	SBC $39					;$B5F818   |
	PHA					;$B5F81A   |
	LDA $39					;$B5F81B   |
	CLC					;$B5F81D   |
	ADC $7FA63C,x				;$B5F81E   |
	STA $39					;$B5F822   |
CODE_B5F824:					;	   |
	LDA $0D3E,y				;$B5F824   |
	SEC					;$B5F827   |
	SBC $3E					;$B5F828   |
	STA $36					;$B5F82A   |
	BMI CODE_B5F836				;$B5F82C   |
	SEC					;$B5F82E   |
	SBC #$0008				;$B5F82F   |
	BCS CODE_B5F84B				;$B5F832   |
	LDA $36					;$B5F834   |
CODE_B5F836:					;	   |
	DEC A					;$B5F836   |
	CLC					;$B5F837   |
	ADC $0D46,y				;$B5F838   |
	BMI CODE_B5F849				;$B5F83B   |
	LSR A					;$B5F83D   |
	LSR A					;$B5F83E   |
	LSR A					;$B5F83F   |
	ASL A					;$B5F840   |
	TAX					;$B5F841   |
	LDA DATA_B5FAE4,x			;$B5F842   |
	STA $40					;$B5F845   |
	BRA CODE_B5F86C				;$B5F847  /

CODE_B5F849:
	PLY					;$B5F849  \
	RTS					;$B5F84A  /

CODE_B5F84B:
	CMP #$0080				;$B5F84B  \
	BCS CODE_B5F849				;$B5F84E   |
	LSR A					;$B5F850   |
	LSR A					;$B5F851   |
	LSR A					;$B5F852   |
	ASL A					;$B5F853   |
	TAX					;$B5F854   |
	LDA DATA_B5FB04,x			;$B5F855   |
	STA $40					;$B5F858   |
	LDA $36					;$B5F85A   |
	DEC A					;$B5F85C   |
	ADC $0D46,y				;$B5F85D   |
	LSR A					;$B5F860   |
	LSR A					;$B5F861   |
	LSR A					;$B5F862   |
	ASL A					;$B5F863   |
	TAX					;$B5F864   |
	LDA DATA_B5FAE4,x			;$B5F865   |
	AND $40					;$B5F868   |
	STA $40					;$B5F86A   |
CODE_B5F86C:					;	   |
	PLY					;$B5F86C   |
CODE_B5F86D:					;	   |
	LDA [$39],y				;$B5F86D   |
	AND $40					;$B5F86F   |
	BNE CODE_B5F878				;$B5F871   |
	DEY					;$B5F873   |
	DEY					;$B5F874   |
	BPL CODE_B5F86D				;$B5F875   |
	RTS					;$B5F877  /

CODE_B5F878:
	PHA					;$B5F878  \
	EOR [$39],y				;$B5F879   |
	STA [$39],y				;$B5F87B   |
	SEP #$10				;$B5F87D   |
	PLX					;$B5F87F   |
	BEQ CODE_B5F88E				;$B5F880   |
CODE_B5F882:					;	   |
	LDA DATA_B5FDA8,x			;$B5F882   |
	JSR CODE_B5F8A4				;$B5F885   |
	LDA DATA_B5FBA8,x			;$B5F888   |
	TAX					;$B5F88B   |
	BNE CODE_B5F882				;$B5F88C   |
CODE_B5F88E:					;	   |
	PLX					;$B5F88E   |
	BEQ CODE_B5F89D				;$B5F88F   |
CODE_B5F891:					;	   |
	LDA DATA_B5FCA8,x			;$B5F891   |
	JSR CODE_B5F8A4				;$B5F894   |
	LDA DATA_B5FBA8,x			;$B5F897   |
	TAX					;$B5F89A   |
	BNE CODE_B5F891				;$B5F89B   |
CODE_B5F89D:					;	   |
	REP #$10				;$B5F89D   |
	DEY					;$B5F89F   |
	DEY					;$B5F8A0   |
	BPL CODE_B5F86D				;$B5F8A1   |
	RTS					;$B5F8A3  /

CODE_B5F8A4:
	PHX					;$B5F8A4  \
	PHA					;$B5F8A5   |
	REP #$10				;$B5F8A6   |
	LDA #$0608				;$B5F8A8   |
	JSL queue_sound_effect			;$B5F8AB   |
	LDA.l $7FD734				;$B5F8AF   |
	SEP #$09				;$B5F8B3   |
	ADC $08BC				;$B5F8B5   |
	BPL CODE_B5F8BD				;$B5F8B8   |
	LDA #$0000				;$B5F8BA   |
CODE_B5F8BD:					;	   |
	STA $08BC				;$B5F8BD   |
	CLD					;$B5F8C0   |
	SEP #$10				;$B5F8C1   |
	LDA #$003C				;$B5F8C3   |
	STA $096F				;$B5F8C6   |
	LDA.l $7FD632				;$B5F8C9   |
	INC A					;$B5F8CD   |
	INC A					;$B5F8CE   |
	CMP #$0040				;$B5F8CF   |
	BCS CODE_B5F937				;$B5F8D2   |
	STA $7FD632				;$B5F8D4   |
	TAX					;$B5F8D8   |
	PLA					;$B5F8D9   |
	AND #$00FF				;$B5F8DA   |
	ADC $3E					;$B5F8DD   |
	SEC					;$B5F8DF   |
	SBC $17C0				;$B5F8E0   |
	BCC CODE_B5F8EF				;$B5F8E3   |
	CMP #$00E0				;$B5F8E5   |
	BCC CODE_B5F8F2				;$B5F8E8   |
	LDA #$00E0				;$B5F8EA   |
	BRA CODE_B5F8F2				;$B5F8ED  /

CODE_B5F8EF:
	LDA #$0000				;$B5F8EF  \
CODE_B5F8F2:					;	   |
	XBA					;$B5F8F2   |
	STA $7FD6B4,x				;$B5F8F3   |
	LSR A					;$B5F8F7   |
	LSR A					;$B5F8F8   |
	LSR A					;$B5F8F9   |
	LSR A					;$B5F8FA   |
	LSR A					;$B5F8FB   |
	EOR #$FFFF				;$B5F8FC   |
	SEC					;$B5F8FF   |
	ADC #$0040				;$B5F900   |
	STA $7FD6F4,x				;$B5F903   |
	LDA DATA_B5FB66,y			;$B5F907   |
	CLC					;$B5F90A   |
	ADC $3C					;$B5F90B   |
	SEC					;$B5F90D   |
	SBC $17BA				;$B5F90E   |
	BCC CODE_B5F91D				;$B5F911   |
	CMP #$00F0				;$B5F913   |
	BCC CODE_B5F920				;$B5F916   |
	LDA #$00F0				;$B5F918   |
	BRA CODE_B5F920				;$B5F91B  /

CODE_B5F91D:
	LDA #$0000				;$B5F91D  \
CODE_B5F920:					;	   |
	XBA					;$B5F920   |
	STA $7FD634,x				;$B5F921   |
	LSR A					;$B5F925   |
	LSR A					;$B5F926   |
	LSR A					;$B5F927   |
	LSR A					;$B5F928   |
	LSR A					;$B5F929   |
	EOR #$FFFF				;$B5F92A   |
	SEC					;$B5F92D   |
	ADC #$0040				;$B5F92E   |
	STA $7FD674,x				;$B5F931   |
	PLX					;$B5F935   |
	RTS					;$B5F936  /

CODE_B5F937:
	LDA.l $7FD734				;$B5F937  \
	SEP #$09				;$B5F93B   |
	ADC $096D				;$B5F93D   |
	BPL CODE_B5F945				;$B5F940   |
	LDA #$0000				;$B5F942   |
CODE_B5F945:					;	   |
	STA $096D				;$B5F945   |
	CLD					;$B5F948   |
	PLA					;$B5F949   |
	PLX					;$B5F94A   |
	RTS					;$B5F94B  /

CODE_B5F94C:
	STX $32					;$B5F94C  \
	LDA #$0608				;$B5F94E   |
	JSL queue_sound_effect			;$B5F951   |
	LDA #$003C				;$B5F955   |
	STA $096F				;$B5F958   |
	LDA.l $7FD632				;$B5F95B   |
	INC A					;$B5F95F   |
	INC A					;$B5F960   |
	CMP #$0040				;$B5F961   |
	BCS CODE_B5F9E2				;$B5F964   |
	STA $7FD632				;$B5F966   |
	TAX					;$B5F96A   |
	LDY current_sprite			;$B5F96B   |
	LDA $32					;$B5F96D   |
	BPL CODE_B5F976				;$B5F96F   |
	ORA #$00FF				;$B5F971   |
	BRA CODE_B5F979				;$B5F974  /

CODE_B5F976:
	AND #$FF00				;$B5F976  \
CODE_B5F979:					;	   |
	XBA					;$B5F979   |
	CLC					;$B5F97A   |
	ADC $000A,y				;$B5F97B   |
	SEC					;$B5F97E   |
	SBC $17C0				;$B5F97F   |
	BCC CODE_B5F98E				;$B5F982   |
	CMP #$00E0				;$B5F984   |
	BCC CODE_B5F991				;$B5F987   |
	LDA #$00E0				;$B5F989   |
	BRA CODE_B5F991				;$B5F98C  /

CODE_B5F98E:
	LDA #$0000				;$B5F98E  \
CODE_B5F991:					;	   |
	XBA					;$B5F991   |
	STA $7FD6B4,x				;$B5F992   |
	LSR A					;$B5F996   |
	LSR A					;$B5F997   |
	LSR A					;$B5F998   |
	LSR A					;$B5F999   |
	LSR A					;$B5F99A   |
	EOR #$FFFF				;$B5F99B   |
	SEC					;$B5F99E   |
	ADC #$0040				;$B5F99F   |
	STA $7FD6F4,x				;$B5F9A2   |
	LDY current_sprite			;$B5F9A6   |
	LDA $31					;$B5F9A8   |
	BPL CODE_B5F9B1				;$B5F9AA   |
	ORA #$00FF				;$B5F9AC   |
	BRA CODE_B5F9B4				;$B5F9AF  /

CODE_B5F9B1:
	AND #$FF00				;$B5F9B1  \
CODE_B5F9B4:					;	   |
	XBA					;$B5F9B4   |
	CLC					;$B5F9B5   |
	ADC $0006,y				;$B5F9B6   |
	SEC					;$B5F9B9   |
	SBC $17BA				;$B5F9BA   |
	BCC CODE_B5F9C9				;$B5F9BD   |
	CMP #$00F0				;$B5F9BF   |
	BCC CODE_B5F9CC				;$B5F9C2   |
	LDA #$00F0				;$B5F9C4   |
	BRA CODE_B5F9CC				;$B5F9C7  /

CODE_B5F9C9:
	LDA #$0000				;$B5F9C9  \
CODE_B5F9CC:					;	   |
	XBA					;$B5F9CC   |
	STA $7FD634,x				;$B5F9CD   |
	LSR A					;$B5F9D1   |
	LSR A					;$B5F9D2   |
	LSR A					;$B5F9D3   |
	LSR A					;$B5F9D4   |
	LSR A					;$B5F9D5   |
	EOR #$FFFF				;$B5F9D6   |
	SEC					;$B5F9D9   |
	ADC #$0040				;$B5F9DA   |
	STA $7FD674,x				;$B5F9DD   |
	RTL					;$B5F9E1  /

CODE_B5F9E2:
	LDA.l $7FD734				;$B5F9E2  \
	SEP #$09				;$B5F9E6   |
	ADC $096D				;$B5F9E8   |
	BPL CODE_B5F9F0				;$B5F9EB   |
	LDA #$0000				;$B5F9ED   |
CODE_B5F9F0:					;	   |
	STA $096D				;$B5F9F0   |
	CLD					;$B5F9F3   |
	RTL					;$B5F9F4  /

CODE_B5F9F5:
	PHB					;$B5F9F5  \
	PEA $7FD6				;$B5F9F6   |
	PLB					;$B5F9F9   |
	PLB					;$B5F9FA   |
	LDX $D632				;$B5F9FB   |
	BMI CODE_B5FA6A				;$B5F9FE   |
CODE_B5FA00:					;	   |
	LDA $D634,x				;$B5FA00   |
	CLC					;$B5FA03   |
	ADC $D674,x				;$B5FA04   |
	STA $D634,x				;$B5FA07   |
	LDA $D6B4,x				;$B5FA0A   |
	CLC					;$B5FA0D   |
	ADC $D6F4,x				;$B5FA0E   |
	STA $D6B4,x				;$B5FA11   |
	CMP #$0800				;$B5FA14   |
	ROR A					;$B5FA17   |
	EOR $D6F4,x				;$B5FA18   |
	BMI CODE_B5FA6C				;$B5FA1B   |
	SEP #$30				;$B5FA1D   |
	LDA $D635,x				;$B5FA1F   |
	STA $002180				;$B5FA22   |
	LDA $D6B5,x				;$B5FA26   |
	STA $002180				;$B5FA29   |
	LDA global_frame_counter		;$B5FA2D   |
	AND #$0E				;$B5FA2F   |
	CLC					;$B5FA31   |
	ADC $000D2C				;$B5FA32   |
	STA $002180				;$B5FA36   |
	LDA.l $000D2D				;$B5FA3A   |
	ORA #$30				;$B5FA3E   |
	STA $002180				;$B5FA40   |
	LDA $4A					;$B5FA44   |
	LSR A					;$B5FA46   |
	SEC					;$B5FA47   |
	ROR A					;$B5FA48   |
	BCS CODE_B5FA55				;$B5FA49   |
CODE_B5FA4B:					;	   |
	STA $4A					;$B5FA4B   |
	REP #$30				;$B5FA4D   |
CODE_B5FA4F:					;	   |
	DEX					;$B5FA4F   |
	DEX					;$B5FA50   |
	BPL CODE_B5FA00				;$B5FA51   |
	BRA CODE_B5FA6A				;$B5FA53  /

CODE_B5FA55:
	PHX					;$B5FA55  \
	LDX $38					;$B5FA56   |
	STA $0003A0,x				;$B5FA58   |
	PLX					;$B5FA5C   |
	LDA #$E680				;$B5FA5D   |
	SEC					;$B5FA60   |
	BPL CODE_B5FA4B				;$B5FA61   |
	REP #$30				;$B5FA63   |
	LDA #$0400				;$B5FA65   |
	STA $70					;$B5FA68   |
CODE_B5FA6A:					;	   |
	PLB					;$B5FA6A   |
	RTS					;$B5FA6B  /

CODE_B5FA6C:
	LDA.l $7FD734				;$B5FA6C  \
	SEP #$09				;$B5FA70   |
	ADC $00096D				;$B5FA72   |
	BPL CODE_B5FA7B				;$B5FA76   |
	LDA #$0000				;$B5FA78   |
CODE_B5FA7B:					;	   |
	STA $00096D				;$B5FA7B   |
	CLD					;$B5FA7F   |
	LDY $D632				;$B5FA80   |
	LDA $D634,y				;$B5FA83   |
	STA $D634,x				;$B5FA86   |
	LDA $D674,y				;$B5FA89   |
	STA $D674,x				;$B5FA8C   |
	LDA $D6B4,y				;$B5FA8F   |
	STA $D6B4,x				;$B5FA92   |
	LDA $D6F4,y				;$B5FA95   |
	STA $D6F4,x				;$B5FA98   |
	DEY					;$B5FA9B   |
	DEY					;$B5FA9C   |
	STY $D632				;$B5FA9D   |
	BRA CODE_B5FA4F				;$B5FAA0  /

DATA_B5FAA2:
	db $00, $00, $01, $00, $03, $00, $07, $00
	db $0F, $00, $1F, $00, $3F, $00, $7F, $00
	db $FF, $00, $FF, $01, $FF, $03, $FF, $07
	db $FF, $0F, $FF, $1F, $FF, $3F, $FF, $7F
	db $FF, $FF

DATA_B5FAC4:
	db $FF, $FF, $FE, $FF, $FC, $FF, $F8, $FF
	db $F0, $FF, $E0, $FF, $C0, $FF, $80, $FF
	db $00, $FF, $00, $FE, $00, $FC, $00, $F8
	db $00, $F0, $00, $E0, $00, $C0, $00, $80

DATA_B5FAE4:
	db $00, $80, $00, $C0, $00, $E0, $00, $F0
	db $00, $F8, $00, $FC, $00, $FE, $00, $FF
	db $80, $FF, $C0, $FF, $E0, $FF, $F0, $FF
	db $F8, $FF, $FC, $FF, $FE, $FF, $FF, $FF

DATA_B5FB04:
	db $FF, $FF, $FF, $7F, $FF, $3F, $FF, $1F
	db $FF, $0F, $FF, $07, $FF, $03, $FF, $01
	db $FF, $00, $7F, $00, $3F, $00, $1F, $00
	db $0F, $00, $07, $00, $03, $00, $01, $00
	db $00, $00

DATA_B5FB26:
	db $00, $00, $02, $00, $04, $00, $06, $00
	db $08, $00, $0A, $00, $0C, $00, $0E, $00
	db $00, $00, $02, $00, $04, $00, $06, $00
	db $08, $00, $0A, $00, $0C, $00, $0E, $00
	db $00, $00, $02, $00, $04, $00, $06, $00
	db $08, $00, $0A, $00, $0C, $00, $0E, $00
	db $00, $00, $02, $00, $04, $00, $06, $00
	db $08, $00, $0A, $00, $0C, $00, $0E, $00

DATA_B5FB66:
	db $00, $00, $08, $00, $10, $00, $18, $00
	db $20, $00, $28, $00, $30, $00, $38, $00
	db $40, $00, $48, $00, $50, $00, $58, $00
	db $60, $00, $68, $00, $70, $00, $78, $00
	db $80, $00, $88, $00, $90, $00, $98, $00
	db $A0, $00, $A8, $00, $B0, $00, $B8, $00
	db $C0, $00, $C8, $00, $D0, $00, $D8, $00
	db $E0, $00, $E8, $00, $F0, $00, $F8, $00
	db $00, $01

DATA_B5FBA8:
	db $00, $00, $00, $01, $00, $01, $02, $03
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $18, $19, $1A, $1B, $1C, $1D, $1E, $1F
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $18, $19, $1A, $1B, $1C, $1D, $1E, $1F
	db $20, $21, $22, $32, $42, $25, $26, $27
	db $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
	db $30, $31, $32, $33, $34, $35, $36, $37
	db $38, $39, $3A, $3B, $3C, $3D, $3E, $3F
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $18, $19, $1A, $1B, $1C, $1D, $1E, $1F
	db $20, $21, $22, $23, $24, $25, $26, $27
	db $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
	db $30, $31, $32, $33, $34, $35, $36, $37
	db $38, $39, $3A, $3B, $3C, $3D, $3E, $3F
	db $40, $41, $42, $43, $44, $45, $46, $47
	db $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
	db $50, $51, $52, $53, $54, $55, $56, $57
	db $58, $59, $5A, $5B, $5C, $5D, $5E, $5F
	db $60, $61, $62, $63, $64, $65, $66, $67
	db $68, $69, $6A, $6B, $6C, $6D, $6E, $6F
	db $70, $71, $72, $73, $74, $75, $76, $77
	db $78, $79, $7A, $7B, $7C, $7D, $7E, $7F

DATA_B5FCA8:
	db $00, $38, $30, $30, $28, $28, $28, $28
	db $20, $20, $20, $20, $20, $20, $20, $20
	db $18, $18, $18, $18, $18, $18, $18, $18
	db $18, $18, $18, $18, $18, $18, $18, $18
	db $10, $10, $10, $10, $10, $10, $10, $10
	db $10, $10, $10, $10, $10, $10, $10, $10
	db $10, $10, $10, $10, $10, $10, $10, $10
	db $10, $10, $10, $10, $10, $10, $10, $10
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $08, $08, $08, $08, $08, $08, $08, $08
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00

DATA_B5FDA8:
	db $00, $78, $70, $70, $68, $68, $68, $68
	db $60, $60, $60, $60, $60, $60, $60, $60
	db $58, $58, $58, $58, $58, $58, $58, $58
	db $58, $58, $58, $58, $58, $58, $58, $58
	db $50, $50, $50, $50, $50, $50, $50, $50
	db $50, $50, $50, $50, $50, $50, $50, $50
	db $50, $50, $50, $50, $50, $50, $50, $50
	db $50, $50, $50, $50, $50, $50, $50, $50
	db $48, $48, $48, $48, $48, $48, $48, $48
	db $48, $48, $48, $48, $48, $48, $48, $48
	db $48, $48, $48, $48, $48, $48, $48, $48
	db $48, $48, $48, $48, $48, $48, $48, $48
	db $48, $48, $48, $48, $48, $48, $48, $48
	db $48, $48, $48, $48, $48, $48, $48, $48
	db $48, $48, $48, $48, $48, $48, $48, $48
	db $48, $48, $48, $48, $48, $48, $48, $48
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40, $40, $40
