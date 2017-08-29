;Command set 1 jump table
copy_or_return_1_entry:
	NOP				;$BB8000	\ Decompression command entry
	JMP copy_or_return_1            ;$BB8001	/
                                        
stream_byte_1_entry:                    
	NOP                             ;$BB8004	\ Decompression command entry
	JMP stream_byte_1               ;$BB8005	/
                                        
stream_word_1_entry:                    
	NOP                             ;$BB8008	\ Decompression command entry
	JMP stream_word_1               ;$BB8009	/
                                        
stream_byte_fill_1_entry:               
	NOP                             ;$BB800C	\ Decompression command entry
	JMP stream_byte_fill_1          ;$BB800D	/
                                        
direct_byte_1_fill_1_entry:             
	NOP                             ;$BB8010	\ Decompression command entry
	JMP direct_byte_1_fill_1        ;$BB8011	/
                                        
direct_byte_2_fill_1_entry:             
	NOP                             ;$BB8014	\ Decompression command entry
	JMP direct_byte_2_fill_1        ;$BB8015	/
                                        
direct_word_put_1_entry:                
	NOP                             ;$BB8018	\ Decompression command entry
	JMP direct_word_put_1           ;$BB8019	/
                                        
direct_byte_1_put_1_entry:              
	NOP                             ;$BB801C	\ Decompression command entry
	JMP direct_byte_1_put_1         ;$BB801D	/
                                        
direct_byte_2_put_1_entry:              
	NOP                             ;$BB8020	\ Decompression command entry
	JMP direct_byte_2_put_1         ;$BB8021	/
                                        
back_copy_word_1_entry:                 
	NOP                             ;$BB8024	\ Decompression command entry
	JMP back_copy_word_1            ;$BB8025	/
                                        
back_copy_1_entry:                      
	NOP                             ;$BB8028	\ Decompression command entry
	JMP back_copy_1                 ;$BB8029	/
                                        
back_copy_far_1_entry:                  
	NOP                             ;$BB802C	\ Decompression command entry
	JMP back_copy_far_1             ;$BB802D	/
                                        
back_copy_arbitrary_1_entry:            
	NOP                             ;$BB8030	\ Decompression command entry
	JMP back_copy_arbitrary_1       ;$BB8031	/
                                        
duplicate_byte_1_entry:                 
	NOP                             ;$BB8034	\ Decompression command entry
	JMP duplicate_byte_1            ;$BB8035	/
                                        
duplicate_word_1_entry:                 
	NOP                             ;$BB8038	\ Decompression command entry
	JMP duplicate_word_1            ;$BB8039	/
                                        
copy_future_word_1_entry:               
	NOP                             ;$BB803C	\ Decompression command entry
	JMP copy_future_word_1          ;$BB803D	/

;Command set 2 jump table
copy_or_return_2_entry:
	JMP copy_or_return_2		;$BB8040	> Decompression command entry
                                        
stream_byte_2_entry:                    
	NOP                             ;$BB8043	\ Decompression command entry
	JMP stream_byte_2               ;$BB8044	/
                                        
stream_word_2_entry:                    
	NOP                             ;$BB8047	\ Decompression command entry
	JMP stream_word_2               ;$BB8048	/
                                        
stream_byte_fill_2_entry:               
	NOP                             ;$BB804B	\ Decompression command entry
	JMP stream_byte_fill_2          ;$BB804C	/
                                        
direct_byte_1_fill_2_entry:             
	NOP                             ;$BB804F	\ Decompression command entry
	JMP direct_byte_1_fill_2        ;$BB8050	/
                                        
direct_byte_2_fill_2_entry:             
	NOP                             ;$BB8053	\ Decompression command entry
	JMP direct_byte_2_fill_2        ;$BB8054	/
                                        
direct_word_put_2_entry:                
	NOP                             ;$BB8057	\ Decompression command entry
	JMP direct_word_put_2           ;$BB8058	/
                                        
direct_byte_1_put_2_entry:              
	NOP                             ;$BB805B	\ Decompression command entry
	JMP direct_byte_1_put_2         ;$BB805C	/
                                        
direct_byte_2_put_2_entry:              
	NOP                             ;$BB805F	\ Decompression command entry
	JMP direct_byte_2_put_2         ;$BB8060	/
                                        
back_copy_word_2_entry:                 
	NOP                             ;$BB8063	\ Decompression command entry
	JMP back_copy_word_2            ;$BB8064	/
                                        
back_copy_2_entry:                      
	NOP                             ;$BB8067	\ Decompression command entry
	JMP back_copy_2                 ;$BB8068	/
                                        
back_copy_far_2_entry:                  
	NOP                             ;$BB806B	\ Decompression command entry
	JMP back_copy_far_2             ;$BB806C	/
                                        
back_copy_arbitrary_2_entry:            
	NOP                             ;$BB806F	\ Decompression command entry
	JMP back_copy_arbitrary_2       ;$BB8070	/
                                        
duplicate_byte_2_entry:                 
	NOP                             ;$BB8073	\ Decompression command entry
	JMP duplicate_byte_2            ;$BB8074	/
                                        
duplicate_word_2_entry:                 
	NOP                             ;$BB8077	\ Decompression command entry
	JMP duplicate_word_2            ;$BB8078	/
                                        
copy_future_word_2_entry:               
	NOP                             ;$BB807B	\ Decompression command entry
	JMP copy_future_word_2          ;$BB807C	/


;$38  -- destination
;$34 -- source
;$32 -- run dma after upload (always #$FFFF so never)
;The follow two tables map to the opposite intended nibbles.
;$42 -- index >> 4  (look up table pointer, set low byte and read for value)
;	This table allow direct indexing of low nibbles
;$46 -- (index & 0x0F) << 4 (look up table pointer, set low byte and read for value)
;	This table allow direct indexing of high nibbles
;$4A -- command set starting at $BB8040
;$4E -- command set starting at $BB8000
;These are the 6 header bytes of compressed data
;$52 -- fill byte 1
;$53 -- fill byte 2
;$56 -- direct byte 1
;$57 -- direct byte 2
;$54 -- direct word
;Misc addresses
;$3C -- operand 1 (usually count)
;$3E -- operand 2 (usually offset)

;Extra notes
;All commands are return addresses - 1 so RTS can be used

decompress_data:			;
	STA $38				;$BB8D91	\ Set decompression parameters
	LDA #$007F			;$BB8D93	 |
	STA $3A				;$BB8D96	 | Bank 7F + address from A
	STX $34				;$BB8D98	 | Source from X
	STY $36				;$BB8D9A	 |
	BRA start_decompression		;$BB8D9C	/
					;
decompress_data_default:		;		\
	TXA				;$BB8D9E	 |\ Set decompression parameters
	TYX				;$BB8D9F	 | |
	STA $34				;$BB8DA0	 | |
	STX $36				;$BB8DA2	 | |
	LDA #$0000			;$BB8DA4	 | | Default destination $7F0000
	STA $38				;$BB8DA7	 | |
	LDA #$007F			;$BB8DA9	 | |
	STA $3A				;$BB8DAC	 |/
start_decompression:			;		 |
	LDA #$FFFF			;$BB8DAE	 |\ Disble auto DMA of data
	STA $32				;$BB8DB1	 |/
	PHB				;$BB8DB3	 |\ Preserve call bank/Y
	PHY				;$BB8DB4	 |/
	LDA #$2100			;$BB8DB5	 |\ Setup pointers to nibble look up tables
	STA $46				;$BB8DB8	 | |
	LDA #$007E			;$BB8DBA	 | |
	STA $48				;$BB8DBD	 | |
	STA $44				;$BB8DBF	 | |
	LDA #$2000			;$BB8DC1	 | |
	STA $42				;$BB8DC4	 |/
	JSL build_decompression_lookup	;$BB8DC6	 | Generate nibble offset table at RAM $7E2000
	LDX $38				;$BB8DCA	 | Load the decompression index
	LDY #$0001			;$BB8DCC	 | Load the compression index
	LDA #$8001			;$BB8DCF	 |\ Load default decompression function A 8001
	STA $4E				;$BB8DD2	 |/ The high byte will never change.
	LDA #$8040			;$BB8DD4	 |\ Load default decompression function B 8040
	STA $4A				;$BB8DD7	 |/
	SEP #$20			;$BB8DD9	 |
	LDA $3A				;$BB8DDB	 |\ Set the data bank to the destination bank
	PHA				;$BB8DDD	 | |
	PLB				;$BB8DDE	 |/
	LDA [$34],y			;$BB8DDF	 |\ Read fill byte 1
	STA $52				;$BB8DE1	 | |
	INY				;$BB8DE3	 |/
	LDA [$34],y			;$BB8DE4	 |\ Read fill byte 2
	STA $53				;$BB8DE6	 | |
	INY				;$BB8DE8	 |/
	LDA [$34],y			;$BB8DE9	 |\ Read direct byte 1
	STA $56				;$BB8DEB	 | |
	INY				;$BB8DED	 |/
	LDA [$34],y			;$BB8DEE	 |\ Read direct byte 2
	STA $57				;$BB8DF0	 | |
	INY				;$BB8DF2	 |/
	REP #$20			;$BB8DF3	 |\ Read direct word
	LDA [$34],y			;$BB8DF5	 | |
	STA $54				;$BB8DF7	 |/
	LDY #$0027			;$BB8DF9	 | Skip to compressed byte #$27
	STZ $3C				;$BB8DFC	 |\ Clear generic operand 1
	STZ $3E				;$BB8DFE	 |/ Clean generic operand 2
	SEP #$20			;$BB8E00	 | Return to 8 bit
execute_command_set_1:			;		 |
	LDA [$34],y			;$BB8E02	 |\ Read the first command byte
	INY				;$BB8E04	 | |
	STA $46				;$BB8E05	 |/
	AND #$F0			;$BB8E07	 |\ Command = (byte & 0xF0) >> 2
	LSR A				;$BB8E09	 | | Range $00-$3C
	LSR A				;$BB8E0A	 | |
	STA $4E				;$BB8E0B	 |/
	PEI ($4E)			;$BB8E0D	 | Push command address onto the stack
	RTS				;$BB8E0F	/ Return to execute command
					;
execute_command_set_2_wide:		;
	LDA $46				;$BB8E10	\ Read next command byte
	AND #$0F			;$BB8E12	 |\ Command = (byte & 0xF0) >> 2
	ASL A				;$BB8E14	 | | Range $3F-$7B
	ASL A				;$BB8E15	 | |
	ADC #$3F			;$BB8E16	 |/
	STA $4A				;$BB8E18	 |
	PEI ($4A)			;$BB8E1A	 | Push command address onto the stack
	RTS				;$BB8E1C	/ Return to execute command
					;
execute_command_set_2:			;
	LDA $42				;$BB8E1D	\ Read next command byte
	AND #$0F			;$BB8E1F	 |\ Command = (byte & 0xF0) >> 2
	ASL A				;$BB8E21	 | | Range $3F-$7B
	ASL A				;$BB8E22	 | |
	ADC #$3F			;$BB8E23	 | |
	STA $4A				;$BB8E25	 |/
	PEI ($4A)			;$BB8E27	 | Push command address onto the stack
	RTS				;$BB8E29	/ Return to execute command
					;
copy_or_return_1:			;		\
	LDA $46				;$BB8E2A	 |\ Read number of bytes to copy
	AND #$0F			;$BB8E2C	 | |
	BEQ finalize_decompression	;$BB8E2E	 |/ If zero bytes, conclude decompression
	STA $3C				;$BB8E30	 | Store number of bytes to copy
.copy_byte				;		 |
	LDA [$34],y			;$BB8E32	 |\ Direct copy of up to 16 bytes
	INY				;$BB8E34	 | |
	STA $0000,x			;$BB8E35	 | |
	INX				;$BB8E38	 | |
	DEC $3C				;$BB8E39	 | |
	BNE .copy_byte			;$BB8E3B	 |/
	JMP execute_command_set_1	;$BB8E3D	/ Read new command
					;
finalize_decompression:			;		\
	REP #$20			;$BB8E40	 |\ Restore 16 bit A, data bank and Y
	PLY				;$BB8E42	 | |
	PLB				;$BB8E43	 |/
	TXA				;$BB8E44	 |\ Calculate the number of decompressed bytes (stored in X)
	SEC				;$BB8E45	 | | X = X - destination (Where X as an operand is the destination offset)
	SBC $38				;$BB8E46	 | |
	TAX				;$BB8E48	 |/
	LDA $32				;$BB8E49	 |\ Check if DMA should run
	BMI .skip_DMA			;$BB8E4B	 |/
	LDA $58				;$BB8E4D	 |\ This would be a be a DMA to VRAM
	STA $2116			;$BB8E4F	 | | However $32 is a constant and will always be skipped (0xFFFF)
	LDA $38				;$BB8E52	 | |
	STA $4302			;$BB8E54	 | |
	LDA $3A				;$BB8E57	 | |
	STA $4304			;$BB8E59	 | |
	STX $4305			;$BB8E5C	 | |
	LDA #$1801			;$BB8E5F	 | |
	STA $4300			;$BB8E62	 | |
	SEP #$20			;$BB8E65	 | |
	LDA #$01			;$BB8E67	 | |
	STA $420B			;$BB8E69	 | |
	REP #$20			;$BB8E6C	 |/
.skip_DMA				;		 |
	RTL				;$BB8E6E	/ Done with decompression
					;
copy_or_return_2:			;		\
	LDA [$34],y			;$BB8E6F	 |\ Load next operand
	INY				;$BB8E71	 |/
	STA $42				;$BB8E72	 |\ Store in nibble lookup tables
	STA $46				;$BB8E74	 |/
	LDA [$42]			;$BB8E76	 |\ Load number of bytes to write
	BEQ finalize_decompression	;$BB8E78	 | | If zero bytes, conclude decompression
	STA $3C				;$BB8E7A	 |/ Store number of bytes to write
.copy_byte				;		 |
	LDA [$46]			;$BB8E7C	 |\ operand2 = high byte
	STA $3E				;$BB8E7E	 |/
	LDA [$34],y			;$BB8E80	 |\ Load next operand
	INY				;$BB8E82	 |/
	STA $42				;$BB8E83	 |\ Store in nibble lookup tables
	STA $46				;$BB8E85	 |/
	LDA $3E				;$BB8E87	 | Load operand2
	ORA [$42]			;$BB8E89	 |\ write operand2 | low nibble
	STA $0000,x			;$BB8E8B	 |/
	INX				;$BB8E8E	 |\ Continue until no there are no more bytes
	DEC $3C				;$BB8E8F	 | |
	BNE .copy_byte			;$BB8E91	 |/
	JMP execute_command_set_2_wide	;$BB8E93	/ Run next command
					;
stream_byte_1:				;		\
	LDA [$46]			;$BB8E96	 |\ Load operand high nibble
	STA $3E				;$BB8E98	 |/
	LDA [$34],y			;$BB8E9A	 |\ Load next operand
	INY				;$BB8E9C	 | |
	STA $42				;$BB8E9D	 |/
	LDA $3E				;$BB8E9F	 | Load operand high nibble
	ORA [$42]			;$BB8EA1	 |\ write high nibble | low nibble
	STA $0000,x			;$BB8EA3	 | |
	INX				;$BB8EA6	 |/
	JMP execute_command_set_2	;$BB8EA7	/ Run next command
					;
stream_byte_2:				;		\
	LDA [$34],y			;$BB8EAA	 |\ Copy one byte from the compression stream
	INY				;$BB8EAC	 | |
	STA $0000,x			;$BB8EAD	 | |
	INX				;$BB8EB0	 |/
	JMP execute_command_set_1	;$BB8EB1	/ Run next command
					;
stream_word_1:				;		\
	LDA [$46]			;$BB8EB4	 |\ Load operand high nibble into operand2
	STA $3E				;$BB8EB6	 |/
	LDA [$34],y			;$BB8EB8	 |\ Load next operand
	INY				;$BB8EBA	 |/
	STA $42				;$BB8EBB	 |\ Store in nibble lookup tables
	STA $46				;$BB8EBD	 |/
	LDA $3E				;$BB8EBF	 | Load operand2
	ORA [$42]			;$BB8EC1	 |\  write operand2 | low nibble
	STA $0000,x			;$BB8EC3	 | |
	INX				;$BB8EC6	 |/
	LDA [$46]			;$BB8EC7	 |\ Load operand high nibble into operand2
	STA $3E				;$BB8EC9	 |/
	LDA [$34],y			;$BB8ECB	 |\ Load next operand
	INY				;$BB8ECD	 |/
	STA $42				;$BB8ECE	 | Store in low nibble lookup table
	LDA $3E				;$BB8ED0	 | Load operand2
	ORA [$42]			;$BB8ED2	 |\  write operand2 | low nibble
	STA $0000,x			;$BB8ED4	 | |
	INX				;$BB8ED7	 |/
	JMP execute_command_set_2	;$BB8ED8	/ Run next command
					;
stream_word_2:				;		\
	REP #$20			;$BB8EDB	 |\ Copy one word from the compression stream
	LDA [$34],y			;$BB8EDD	 | |
	STA $0000,x			;$BB8EDF	 | |
	INY				;$BB8EE2	 | |
	INY				;$BB8EE3	 | |
	INX				;$BB8EE4	 | |
	INX				;$BB8EE5	 | |
	SEP #$20			;$BB8EE6	 |/
	JMP execute_command_set_1	;$BB8EE8	/ Run next command
					;
stream_byte_fill_1:			;		\
	LDA $46				;$BB8EEB	 |\ Load operand
	AND #$0F			;$BB8EED	 | | Count = operand & 0x0F + 3
	ADC #$03			;$BB8EEF	 | |
	STA $3C				;$BB8EF1	 |/
	LDA [$34],y			;$BB8EF3	 |\  Load fill byte
	INY				;$BB8EF5	 |/
.fill_byte				;		 |
	STA $0000,x			;$BB8EF6	 |\ Store and repeat with fill byte.
	INX				;$BB8EF9	 | |
	DEC $3C				;$BB8EFA	 | |
	BNE .fill_byte			;$BB8EFC	 |/
	JMP execute_command_set_1	;$BB8EFE	/ Run next command
					;
stream_byte_fill_2:			;		\
	LDA [$34],y			;$BB8F01	 |\ Load next operand
	INY				;$BB8F03	 |/
	STA $42				;$BB8F04	 |\ Store in nibble lookup tables
	STA $46				;$BB8F06	 |/
	LDA [$42]			;$BB8F08	 |\ Count = low nibble + 3
	ADC #$03			;$BB8F0A	 | |
	STA $3C				;$BB8F0C	 |/
	LDA [$46]			;$BB8F0E	 |\ Operand2 = high nibble
	STA $3E				;$BB8F10	 |/
	LDA [$34],y			;$BB8F12	 |\ Load next operand
	INY				;$BB8F14	 | |
	STA $42				;$BB8F15	 |/ Store low nibble look up
	LDA $3E				;$BB8F17	 |\ Load operand2
	ORA [$42]			;$BB8F19	 |/ fill byte =  operand2 | low nibble
.fill_byte				;		 |
	STA $0000,x			;$BB8F1B	 |\ Store and repeat with fill byte.
	INX				;$BB8F1E	 | |
	DEC $3C				;$BB8F1F	 | |
	BNE .fill_byte			;$BB8F21	 |/
	JMP execute_command_set_2	;$BB8F23	/ Run next command
					;
direct_byte_1_fill_1:			;		\
	LDA $46				;$BB8F26	 |\ Load operand
	AND #$0F			;$BB8F28	 | | Count = operand & 0x0F + 3
	ADC #$03			;$BB8F2A	 | |
	STA $3C				;$BB8F2C	 |/
	LDA $52				;$BB8F2E	 | Load fill byte 1
.fill_byte				;		 |
	STA $0000,x			;$BB8F30	 |\ Store and repeat with fill byte.
	INX				;$BB8F33	 | |
	DEC $3C				;$BB8F34	 | |
	BNE .fill_byte			;$BB8F36	 |/
	JMP execute_command_set_1	;$BB8F38	/ Run next command
					;
direct_byte_1_fill_2:			;		\
	LDA [$34],y			;$BB8F3B	 |\ Load next operand
	INY				;$BB8F3D	 | |
	STA $42				;$BB8F3E	 |/ Store in low nibble lookup
	LDA [$42]			;$BB8F40	 |\ Count = low nibble + 3
	ADC #$03			;$BB8F42	 | |
	STA $3C				;$BB8F44	 |/
	LDA $52				;$BB8F46	 | Load fill byte 1
.fill_byte				;		 |
	STA $0000,x			;$BB8F48	 |\ Store and repeat with fill byte.
	INX				;$BB8F4B	 | |
	DEC $3C				;$BB8F4C	 | |
	BNE .fill_byte			;$BB8F4E	 |/
	JMP execute_command_set_2	;$BB8F50	/ Run next command
					;
direct_byte_2_fill_1:			;		\
	LDA $46				;$BB8F53	 |\  Load operand
	AND #$0F			;$BB8F55	 | | Count = (operand & 0x0F) + 3
	ADC #$03			;$BB8F57	 | |
	STA $3C				;$BB8F59	 |/
	LDA $53				;$BB8F5B	 | Load fill byte 2
.fill_byte				;		 |
	STA $0000,x			;$BB8F5D	 |\ Store and repeat with fill byte.
	INX				;$BB8F60	 | |
	DEC $3C				;$BB8F61	 | |
	BNE .fill_byte			;$BB8F63	 |/
	JMP execute_command_set_1	;$BB8F65	/ Run next command
					;
direct_byte_2_fill_2:			;		\
	LDA [$34],y			;$BB8F68	 |\ Load next operand
	INY				;$BB8F6A	 | |
	STA $42				;$BB8F6B	 |/ Store in low nibble lookup
	LDA [$42]			;$BB8F6D	 |\ Count = low nibble + 3
	ADC #$03			;$BB8F6F	 | |
	STA $3C				;$BB8F71	 |/
	LDA $53				;$BB8F73	 | Load fill byte 2
.fill_byte				;		 |
	STA $0000,x			;$BB8F75	 |\ Store and repeat with fill byte.
	INX				;$BB8F78	 | |
	DEC $3C				;$BB8F79	 | |
	BNE .fill_byte			;$BB8F7B	 |/
	JMP execute_command_set_2	;$BB8F7D	/ Run next command
					;
direct_word_put_1:			;		\
	REP #$20			;$BB8F80	 |\ Store direct word
	LDA $54				;$BB8F82	 | |
	STA $0000,x			;$BB8F84	 | |
	INX				;$BB8F87	 | |
	INX				;$BB8F88	 | |
	SEP #$20			;$BB8F89	 |/
	JMP execute_command_set_2_wide	;$BB8F8B	/ Run next command
					;
direct_word_put_2:			;		\
	REP #$20			;$BB8F8E	 |\ Store direct word
	LDA $54				;$BB8F90	 | |
	STA $0000,x			;$BB8F92	 | |
	INX				;$BB8F95	 | |
	INX				;$BB8F96	 | |
	SEP #$20			;$BB8F97	 |/
	JMP execute_command_set_1	;$BB8F99	/ Run next command
					;
direct_byte_1_put_1:			;		\
	LDA $56				;$BB8F9C	 |\ Store direct byte 1
	STA $0000,x			;$BB8F9E	 | |
	INX				;$BB8FA1	 |/
	JMP execute_command_set_2_wide	;$BB8FA2	/ Run next command
					;
direct_byte_1_put_2:			;		\
	LDA $56				;$BB8FA5	 |\ Store direct byte 1
	STA $0000,x			;$BB8FA7	 | |
	INX				;$BB8FAA	 |/
	JMP execute_command_set_1	;$BB8FAB	/ Run next command
					;
direct_byte_2_put_1:			;		\
	LDA $57				;$BB8FAE	 |\ Store direct byte 2
	STA $0000,x			;$BB8FB0	 | |
	INX				;$BB8FB3	 |/
	JMP execute_command_set_2_wide	;$BB8FB4	/ Run next command
					;
direct_byte_2_put_2:			;		\
	LDA $57				;$BB8FB7	 |\ Store direct byte 2
	STA $0000,x			;$BB8FB9	 | |
	INX				;$BB8FBC	 |/
	JMP execute_command_set_1	;$BB8FBD	/ Run next command
					;
back_copy_word_1:			;
	PHY				;$BB8FC0	\ Preserve compression index
	LDA $46				;$BB8FC1	 | Load operand
	AND #$0F			;$BB8FC3	 |\  Offset = (operand & 0x0F) + 2
	ADC #$02			;$BB8FC5	 | |
	STA $3E				;$BB8FC7	 |/
	REP #$20			;$BB8FC9	 |\ Prepare to copy (1 word) from a previous point in decompressed data
	TXA				;$BB8FCB	 | | The new offset is stored in Y
	SEC				;$BB8FCC	 | | Y = X - offset
	SBC $3E				;$BB8FCD	 | |
	TAY				;$BB8FCF	 |/
	LDA $0000,y			;$BB8FD0	 |\ Copy from previous data
	STA $0000,x			;$BB8FD3	 | |
	INX				;$BB8FD6	 | |
	INX				;$BB8FD7	 |/
	SEP #$20			;$BB8FD8	 | Return to 8 bit A
	PLY				;$BB8FDA	 | Restore compression index
	JMP execute_command_set_1	;$BB8FDB	/ Run next command
					;
back_copy_word_2:			;		\
	LDA [$34],y			;$BB8FDE	 |\ Load next operand
	INY				;$BB8FE0	 | |
	STA $42				;$BB8FE1	 |/
	LDA [$42]			;$BB8FE3	 |\  Offset = low nibble + 2
	ADC #$02			;$BB8FE5	 | |
	STA $3E				;$BB8FE7	 |/
	PHY				;$BB8FE9	 | Preserve compression index
	REP #$20			;$BB8FEA	 |\ Prepare to copy (1 word) from a previous point in decompressed data
	TXA				;$BB8FEC	 | | The new offset is stored in Y
	SEC				;$BB8FED	 | | Y = X - offset
	SBC $3E				;$BB8FEE	 | |
	TAY				;$BB8FF0	 |/
	LDA $0000,y			;$BB8FF1	 |\ Copy from previous data
	STA $0000,x			;$BB8FF4	 | |
	INX				;$BB8FF7	 | |
	INX				;$BB8FF8	 |/
	SEP #$20			;$BB8FF9	 | Return to 8 bit A
	PLY				;$BB8FFB	 | Restore compression index
	JMP execute_command_set_2	;$BB8FFC	/ Run next command
					;
back_copy_1:				;
	LDA $46				;$BB8FFF	\ Load next operand
	AND #$0F			;$BB9001	 |\  Count = (operand & 0x0F) + 3
	ADC #$03			;$BB9003	 | |
	STA $3C				;$BB9005	 |/
	LDA [$34],y			;$BB9007	 |\ Load next operand
	STA $3E				;$BB9009	 | |
	INY				;$BB900B	 |/
	PHY				;$BB900C	 | Preserve compression index
	REP #$20			;$BB900D	 |\ Prepare to copy from a previous point in decompressed data
	TXA				;$BB900F	 | | The new offset is stored in Y
	SEC				;$BB9010	 | | Y = X - count - offset
	SBC $3C				;$BB9011	 | |
	SEC				;$BB9013	 | |
	SBC $3E				;$BB9014	 | |
	TAY				;$BB9016	 |/
	SEP #$20			;$BB9017	 | Back to 8 bit A
.byte_copy				;		 |
	LDA $0000,y			;$BB9019	 |\ Copy from previous data
	INY				;$BB901C	 | |
	STA $0000,x			;$BB901D	 | |
	INX				;$BB9020	 |/
	DEC $3C				;$BB9021	 |\ Copy count number of bytes
	BNE .byte_copy			;$BB9023	 |/
	PLY				;$BB9025	 | Restore compression index
	JMP execute_command_set_1	;$BB9026	/ Run next command
					;
back_copy_2:				;		\
	LDA [$34],y			;$BB9029	 |\ Load next operand
	INY				;$BB902B	 |/
	STA $42				;$BB902C	 |\ Store in nibble look up tables
	STA $46				;$BB902E	 |/
	LDA [$42]			;$BB9030	 |\ Count = low nibble + 3
	ADC #$03			;$BB9032	 | |
	STA $3C				;$BB9034	 |/
	LDA [$46]			;$BB9036	 |\ Store high nibble in offset
	STA $3E				;$BB9038	 |/
	LDA [$34],y			;$BB903A	 |\ Load next operand and store in the low nibble lookup
	INY				;$BB903C	 | |
	STA $42				;$BB903D	 |/
	LDA [$42]			;$BB903F	 |\ offset = low nibble | offset
	ORA $3E				;$BB9041	 | |
	STA $3E				;$BB9043	 |/
	PHY				;$BB9045	 | Preserve compression index
	REP #$20			;$BB9046	 |\ Prepare to copy from a previous point in decompressed data
	TXA				;$BB9048	 | | The new offset is stored in Y
	SEC				;$BB9049	 | | Y = X - count - offset
	SBC $3C				;$BB904A	 | |
	SEC				;$BB904C	 | |
	SBC $3E				;$BB904D	 | |
	TAY				;$BB904F	 |/
	SEP #$20			;$BB9050	 | Back to 8 bit A
.byte_copy				;		 |
	LDA $0000,y			;$BB9052	 |\ Copy from previous data
	INY				;$BB9055	 | |
	STA $0000,x			;$BB9056	 | |
	INX				;$BB9059	 |/
	DEC $3C				;$BB905A	 |\ Copy count number of bytes
	BNE .byte_copy			;$BB905C	 |/
	PLY				;$BB905E	 | Restore compression index
	JMP execute_command_set_2	;$BB905F	/ Run next command
					;
back_copy_far_1:			;
	LDA $46				;$BB9062	\ Load next operand
	AND #$0F			;$BB9064	 |\  Count = (operand & 0x0F) + 3
	ADC #$03			;$BB9066	 | |
	STA $3C				;$BB9068	 |/
	LDA [$34],y			;$BB906A	 |\ Load next operand
	INY				;$BB906C	 | |
	XBA				;$BB906D	 |/ Store as high byte for the full operand
	LDA [$34],y			;$BB906E	 |\ Load next operand store in high byte look up
	INY				;$BB9070	 | |
	STA $46				;$BB9071	 |/
	REP #$20			;$BB9073	 | Switch to 16 bit A
	LSR A				;$BB9075	 |\ Offset = (operand >> 4) + 0x0103
	LSR A				;$BB9076	 | |
	LSR A				;$BB9077	 | |
	LSR A				;$BB9078	 | |
	CLC				;$BB9079	 | |
	ADC #$0103			;$BB907A	 | |
	STA $40				;$BB907D	 |/
	PHY				;$BB907F	 | Preserve compression index
	TXA				;$BB9080	 |\ Prepare to copy from a previous point in decompressed data
	SEC				;$BB9081	 | | Y = X - offset
	SBC $40				;$BB9082	 | |
	TAY				;$BB9084	 |/
	SEP #$20			;$BB9085	 | Back to 8 bit A
.byte_copy				;		 |
	LDA $0000,y			;$BB9087	 |\ Copy from previous data
	INY				;$BB908A	 | |
	STA $0000,x			;$BB908B	 | |
	INX				;$BB908E	 |/
	DEC $3C				;$BB908F	 |\ Copy count number of bytes
	BNE .byte_copy			;$BB9091	 |/
	PLY				;$BB9093	 | Restore compression index
	JMP execute_command_set_2_wide	;$BB9094	/ Run next command
					;
back_copy_far_2:			;		\
	LDA [$34],y			;$BB9097	 |\ Load next operand
	INY				;$BB9099	 | |
	STA $42				;$BB909A	 |/ Store in low nibble look up table
	LDA [$42]			;$BB909C	 |\ Count = low nibble + 3
	ADC #$03			;$BB909E	 | |
	STA $3C				;$BB90A0	 |/
	LDA $42				;$BB90A2	 |\ Copy the low nibble to the operand high byte
	AND #$0F			;$BB90A4	 | |
	XBA				;$BB90A6	 |/
	LDA [$34],y			;$BB90A7	 |\ Load the operand low byte
	INY				;$BB90A9	 |/
	REP #$20			;$BB90AA	 |\ Offset = operand + 0x0103
	ADC #$0103			;$BB90AC	 | |
	STA $40				;$BB90AF	 |/
	PHY				;$BB90B1	 | Preserve compression index
	TXA				;$BB90B2	 |\ Prepare to copy from a previous point in decompressed data
	SEC				;$BB90B3	 | | Y = X - offset
	SBC $40				;$BB90B4	 | |
	TAY				;$BB90B6	 |/
	SEP #$20			;$BB90B7	 | Back to 8 bit A
.byte_copy				;		 |
	LDA $0000,y			;$BB90B9	 |\ Copy from previous data
	INY				;$BB90BC	 | |
	STA $0000,x			;$BB90BD	 | |
	INX				;$BB90C0	 |/
	DEC $3C				;$BB90C1	 |\ Copy count number of bytes
	BNE .byte_copy			;$BB90C3	 |/
	PLY				;$BB90C5	 | Restore compression index
	JMP execute_command_set_1	;$BB90C6	/ Run next command
					;
back_copy_arbitrary_1:			;
	LDA $46				;$BB90C9	\ Load next operand
	AND #$0F			;$BB90CB	 |\  Count = (operand & 0x0F) + 3
	ADC #$03			;$BB90CD	 | |
	STA $3C				;$BB90CF	 |/
	REP #$20			;$BB90D1	 |\ Read a big endian word for the offset
	LDA [$34],y			;$BB90D3	 | |
	XBA				;$BB90D5	 | |
	STA $40				;$BB90D6	 |/
	INY				;$BB90D8	 |\ Increment the compression index
	INY				;$BB90D9	 |/
	PHY				;$BB90DA	 | Preserve compression index
	TXA				;$BB90DB	 |\ Prepare to copy from a previous point in decompressed data
	SEC				;$BB90DC	 | | Y = X - offset
	SBC $40				;$BB90DD	 | |
	TAY				;$BB90DF	 |/
	SEP #$20			;$BB90E0	 | Back to 8 bit A
.byte_copy				;		 |
	LDA $0000,y			;$BB90E2	 |\ Copy from previous data
	INY				;$BB90E5	 | |
	STA $0000,x			;$BB90E6	 | |
	INX				;$BB90E9	 |/
	DEC $3C				;$BB90EA	 |\ Copy count number of bytes
	BNE .byte_copy			;$BB90EC	 |/
	PLY				;$BB90EE	 | Restore compression index
	JMP execute_command_set_1	;$BB90EF	/ Run next command
					;
back_copy_arbitrary_2:			;		\
	LDA [$34],y			;$BB90F2	 |\ Load next operand
	INY				;$BB90F4	 | |
	STA $42				;$BB90F5	 |/ Store in low nibble look up table
	LDA [$42]			;$BB90F7	 |\ Count = low nibble + 3
	ADC #$03			;$BB90F9	 | |
	STA $3C				;$BB90FB	 |/
	LDA $42				;$BB90FD	 |\ Copy as the operand high byte
	XBA				;$BB90FF	 |/
	LDA [$34],y			;$BB9100	 |\ Load the operand low byte
	INY				;$BB9102	 |/
	REP #$20			;$BB9103	 | Set A to 16 bit
	ASL A				;$BB9105	 |\ Offset = (operand << 4)
	ASL A				;$BB9106	 | |
	ASL A				;$BB9107	 | |
	ASL A				;$BB9108	 | |
	STA $40				;$BB9109	 |/
	AND #$00FF			;$BB910B	 | Clear the high byte of the offset
	SEP #$20			;$BB910E	 | Resume 8 bit A
	LDA [$34],y			;$BB9110	 |\ Load next operand
	INY				;$BB9112	 |/
	PHY				;$BB9113	 | Preserve compression index
	STA $42				;$BB9114	 | Store the operand in the low nibble look up table
	LDA [$42]			;$BB9116	 |\ Load low nibble
	REP #$20			;$BB9118	 | |
	AND #$000F			;$BB911A	 |/
	ORA $40				;$BB911D	 |\ offset = offset | low nibble
	STA $40				;$BB911F	 |/
	TXA				;$BB9121	 |\ Prepare to copy from a previous point in decompressed data
	SEC				;$BB9122	 | | Y = X - offset
	SBC $40				;$BB9123	 | |
	TAY				;$BB9125	 |/
	SEP #$20			;$BB9126	 | Back to 8 bit A
.copy_byte				;		 |
	LDA $0000,y			;$BB9128	 |\ Copy from previous data
	INY				;$BB912B	 | |
	STA $0000,x			;$BB912C	 | |
	INX				;$BB912F	 |/
	DEC $3C				;$BB9130	 |\ Copy count number of bytes
	BNE .copy_byte			;$BB9132	 |/
	PLY				;$BB9134	 | Restore compression index
	JMP execute_command_set_2	;$BB9135	/ Run next command Run next command
					;
duplicate_byte_1:			;		\
	DEX				;$BB9138	 |\ Copy previous byte to the decompression stream
	LDA $0000,x			;$BB9139	 | |
	STA $0001,x			;$BB913C	 | |
	INX				;$BB913F	 | |
	INX				;$BB9140	 |/
	JMP execute_command_set_2_wide	;$BB9141	/ Run next command
					;
duplicate_byte_2:			;		\
	DEX				;$BB9144	 |\ Copy previous byte to the decompression stream
	LDA $0000,x			;$BB9145	 | |
	STA $0001,x			;$BB9148	 | |
	INX				;$BB914B	 | |
	INX				;$BB914C	 |/
	JMP execute_command_set_1	;$BB914D	/ Run next command
					;
duplicate_word_1:			;		\
	REP #$20			;$BB9150	 |\ Copy the previous word to the decompression stream
	DEX				;$BB9152	 | |
	DEX				;$BB9153	 | | First go back two bytes
	LDA $0000,x			;$BB9154	 | |
	STA $0002,x			;$BB9157	 | |
	SEP #$20			;$BB915A	 | |
	INX				;$BB915C	 | | Then jump ahead four bytes
	INX				;$BB915D	 | |
	INX				;$BB915E	 | |
	INX				;$BB915F	 |/
	JMP execute_command_set_2_wide	;$BB9160	/ Run next command
					;
duplicate_word_2:			;		\
	REP #$20			;$BB9163	 |\ Copy the previous word to the decompression stream
	DEX				;$BB9165	 | |
	DEX				;$BB9166	 | | First go back two bytes
	LDA $0000,x			;$BB9167	 | |
	STA $0002,x			;$BB916A	 | |
	SEP #$20			;$BB916D	 | |
	INX				;$BB916F	 | | Then jump ahead four bytes
	INX				;$BB9170	 | |
	INX				;$BB9171	 | |
	INX				;$BB9172	 |/
	JMP execute_command_set_1	;$BB9173	/ Run next command
					;
copy_future_word_1:			;
	PHY				;$BB9176	\ Preserve compression index
	LDA $46				;$BB9177	 | Load next operand
	REP #$20			;$BB9179	 | Set A to 16 bit
	AND #$000F			;$BB917B	 |\ Y = (operand << 1) + 7
	ASL A				;$BB917E	 | |
	ADC #$0007			;$BB917F	 | |
	TAY				;$BB9182	 |/
	LDA [$34],y			;$BB9183	 |\ Copy word from compression stream to the decompression stream
	STA $0000,x			;$BB9185	 |/
	SEP #$20			;$BB9188	 |\ Return to 8 bit A and increment the decompression index
	INX				;$BB918A	 | |
	INX				;$BB918B	 |/
	PLY				;$BB918C	 | Restore compression index
	JMP execute_command_set_1	;$BB918D	/ Run next command
					;
copy_future_word_2:			;		\
	LDA [$34],y			;$BB9190	 |\ Load next operand
	INY				;$BB9192	 | |
	STA $46				;$BB9193	 |/ Store to high nibble look up table
	REP #$20			;$BB9195	 | Set A to 16 bit
	AND #$00F0			;$BB9197	 |\ Operand = operand >> 3
	LSR A				;$BB919A	 | |
	LSR A				;$BB919B	 | |
	LSR A				;$BB919C	 |/
	PHY				;$BB919D	 | Preserve compression index
	ADC #$0007			;$BB919E	 |\ Y = operand + 7
	TAY				;$BB91A1	 |/
	LDA [$34],y			;$BB91A2	 |\ Copy word from compression stream to the decompression stream
	STA $0000,x			;$BB91A4	 |/
	SEP #$20			;$BB91A7	 |\ Return to 8 bit A and increment the decompression index
	INX				;$BB91A9	 | |
	INX				;$BB91AA	 |/
	PLY				;$BB91AB	 | Restore compression index
	JMP execute_command_set_2_wide	;$BB91AC	/ Run next command
					;
build_decompression_lookup:		;
	LDY #$0100			;$BB91AF	\ Prepare to generate the high nibble table
	TDC				;$BB91B2	 |\ Zero A and X and set 8 bit A
	TAX				;$BB91B3	 | |
	SEP #$20			;$BB91B4	 |/
.build_high_nibble			;		 |
	STA $7E2100,x			;$BB91B6	 |\ Store look up value (index & 0x0F) << 4
	CLC				;$BB91BA	 | |
	ADC #$10			;$BB91BB	 | |
	AND #$F0			;$BB91BD	 |/
	INX				;$BB91BF	 |\ Loop through all 256 values
	DEY				;$BB91C0	 | |
	BNE .build_high_nibble		;$BB91C1	 |/
	LDY #$0100			;$BB91C3	 | Prepare to generate the low nibble table
	LDX #$0000			;$BB91C6	 |
.build_low_nibble			;		 |
	TXA				;$BB91C9	 |\ Store look up value (index >> 4)
	LSR A				;$BB91CA	 | |
	LSR A				;$BB91CB	 | |
	LSR A				;$BB91CC	 | |
	LSR A				;$BB91CD	 | |
	STA $7E2000,x			;$BB91CE	 |/
	INX				;$BB91D2	 |\ Loop through all 256 values
	DEY				;$BB91D3	 | |
	BNE .build_low_nibble		;$BB91D4	 |/
	REP #$20			;$BB91D6	 | Return to 16 bit A
	RTL				;$BB91D8	/ Done
