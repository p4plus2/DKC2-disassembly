;Command set 1 jump table
copy_or_return_1_entry:
	NOP					;$BB8000  \ Decompression command entry
	JMP copy_or_return_1            	;$BB8001  /

stream_byte_1_entry:
	NOP                             	;$BB8004  \ Decompression command entry
	JMP stream_byte_1               	;$BB8005  /

stream_word_1_entry:
	NOP                             	;$BB8008  \ Decompression command entry
	JMP stream_word_1               	;$BB8009  /

stream_byte_fill_1_entry:
	NOP                             	;$BB800C  \ Decompression command entry
	JMP stream_byte_fill_1          	;$BB800D  /

direct_byte_1_fill_1_entry:
	NOP                             	;$BB8010  \ Decompression command entry
	JMP direct_byte_1_fill_1        	;$BB8011  /

direct_byte_2_fill_1_entry:
	NOP                             	;$BB8014  \ Decompression command entry
	JMP direct_byte_2_fill_1        	;$BB8015  /

direct_word_put_1_entry:
	NOP                             	;$BB8018  \ Decompression command entry
	JMP direct_word_put_1           	;$BB8019  /

direct_byte_1_put_1_entry:
	NOP                             	;$BB801C  \ Decompression command entry
	JMP direct_byte_1_put_1         	;$BB801D  /

direct_byte_2_put_1_entry:
	NOP                             	;$BB8020  \ Decompression command entry
	JMP direct_byte_2_put_1         	;$BB8021  /

back_copy_word_1_entry:
	NOP                             	;$BB8024  \ Decompression command entry
	JMP back_copy_word_1            	;$BB8025  /

back_copy_1_entry:
	NOP                             	;$BB8028  \ Decompression command entry
	JMP back_copy_1                 	;$BB8029  /

back_copy_far_1_entry:
	NOP                             	;$BB802C  \ Decompression command entry
	JMP back_copy_far_1             	;$BB802D  /

back_copy_arbitrary_1_entry:
	NOP                             	;$BB8030  \ Decompression command entry
	JMP back_copy_arbitrary_1       	;$BB8031  /

duplicate_byte_1_entry:
	NOP                             	;$BB8034  \ Decompression command entry
	JMP duplicate_byte_1            	;$BB8035  /

duplicate_word_1_entry:
	NOP                             	;$BB8038  \ Decompression command entry
	JMP duplicate_word_1            	;$BB8039  /

copy_future_word_1_entry:
	NOP                             	;$BB803C  \ Decompression command entry
	JMP copy_future_word_1          	;$BB803D  /

;Command set 2 jump table
copy_or_return_2_entry:
	JMP copy_or_return_2			;$BB8040  > Decompression command entry

stream_byte_2_entry:
	NOP                             	;$BB8043  \ Decompression command entry
	JMP stream_byte_2               	;$BB8044  /

stream_word_2_entry:
	NOP                             	;$BB8047  \ Decompression command entry
	JMP stream_word_2               	;$BB8048  /

stream_byte_fill_2_entry:
	NOP                             	;$BB804B  \ Decompression command entry
	JMP stream_byte_fill_2          	;$BB804C  /

direct_byte_1_fill_2_entry:
	NOP                             	;$BB804F  \ Decompression command entry
	JMP direct_byte_1_fill_2        	;$BB8050  /

direct_byte_2_fill_2_entry:
	NOP                             	;$BB8053  \ Decompression command entry
	JMP direct_byte_2_fill_2        	;$BB8054  /

direct_word_put_2_entry:
	NOP                             	;$BB8057  \ Decompression command entry
	JMP direct_word_put_2           	;$BB8058  /

direct_byte_1_put_2_entry:
	NOP                             	;$BB805B  \ Decompression command entry
	JMP direct_byte_1_put_2         	;$BB805C  /

direct_byte_2_put_2_entry:
	NOP                             	;$BB805F  \ Decompression command entry
	JMP direct_byte_2_put_2         	;$BB8060  /

back_copy_word_2_entry:
	NOP                             	;$BB8063  \ Decompression command entry
	JMP back_copy_word_2            	;$BB8064  /

back_copy_2_entry:
	NOP                             	;$BB8067  \ Decompression command entry
	JMP back_copy_2                 	;$BB8068  /

back_copy_far_2_entry:
	NOP                             	;$BB806B  \ Decompression command entry
	JMP back_copy_far_2             	;$BB806C  /

back_copy_arbitrary_2_entry:
	NOP                             	;$BB806F  \ Decompression command entry
	JMP back_copy_arbitrary_2       	;$BB8070  /

duplicate_byte_2_entry:
	NOP                             	;$BB8073  \ Decompression command entry
	JMP duplicate_byte_2            	;$BB8074  /

duplicate_word_2_entry:
	NOP                             	;$BB8077  \ Decompression command entry
	JMP duplicate_word_2            	;$BB8078  /

copy_future_word_2_entry:
	NOP                             	;$BB807B  \ Decompression command entry
	JMP copy_future_word_2          	;$BB807C  /

DMA_global_palette:
	STX $32					;$BB807F  \ Store palette id in scratch RAM
	ASL A					;$BB8081   |\ Double palette id and transfer to index register
	TAX					;$BB8082   |/
	LDA.l DATA_FD5FEE,x			;$BB8083   | Load DMA source
	LDX $32					;$BB8087   | Reload palette id
DMA_palette:					;	   |
	STA DMA[0].source			;$BB8089   | Set DMA source word
	TXA					;$BB808C   |\ Set DMA size to 8 times the input
	ASL A					;$BB808D   | | Double for number of bytes
	ASL A					;$BB808E   | | Quadruple further for four times the number of colors
	ASL A					;$BB808F   | |
	STA DMA[0].size				;$BB8090   |/
	LDA #$2200				;$BB8093   |\ DMA to CGRAM, write once to one register
	STA DMA[0].settings			;$BB8096   |/
	SEP #$20				;$BB8099   |
	LDA #$FD				;$BB809B   |\ Set DMA source bank to FD
	STA DMA[0].source_bank			;$BB809D   |/
	TYA					;$BB80A0   |\ Set CGRAM destination
	STA PPU.cgram_address			;$BB80A1   |/
	LDA #$01				;$BB80A4   |\ Do the DMA! (https://www.youtube.com/watch?v=j9Zj4chxeCM)
	STA CPU.enable_dma			;$BB80A6   |/
	REP #$20				;$BB80A9   |
	RTL					;$BB80AB  /

set_PPU_registers_global:
	JSR set_PPU_registers			;$BB80AC  \ Trampoline to the main PPU register routine
	RTL					;$BB80AF  /

VRAM_payload_handler_global:
	JSR VRAM_payload_handler		;$BB80B0  \ Trampoline to the main VRAM upload
	RTL					;$BB80B3  /

CODE_BB80B4:
	CMP #$009A				;$BB80B4  \
	BNE CODE_BB80BA				;$BB80B7   |
	INC A					;$BB80B9   |
CODE_BB80BA:					;	   |
	STZ $B0					;$BB80BA   |
	STZ $B2					;$BB80BC   |
	LDX #$0515				;$BB80BE   |
	JSL CODE_BBAF0F				;$BB80C1   |
	LDA $0515				;$BB80C5   |
	CMP #$0000				;$BB80C8   |
	BEQ CODE_BB80D4				;$BB80CB   |
	CMP #$0006				;$BB80CD   |
	BEQ CODE_BB80D4				;$BB80D0   |
	BRA CODE_BB8110				;$BB80D2  /

CODE_BB80D4:
	LDX #$000E				;$BB80D4  \
CODE_BB80D7:					;	   |
	PHX					;$BB80D7   |
	LDA $053D,x				;$BB80D8   |
	BEQ CODE_BB8103				;$BB80DB   |
	LDX #$0553				;$BB80DD   |
	JSL CODE_BBAF0F				;$BB80E0   |
	LDA $0553				;$BB80E4   |
	CMP #$0001				;$BB80E7   |
	BNE CODE_BB8103				;$BB80EA   |
	LDA $056B				;$BB80EC   |
	AND #$00FF				;$BB80EF   |
	BEQ CODE_BB8103				;$BB80F2   |
	INC $B2					;$BB80F4   |
	PLX					;$BB80F6   |
	LDA $053D,x				;$BB80F7   |
	PHX					;$BB80FA   |
	JSL CODE_BB8116				;$BB80FB   |
	BCS CODE_BB8103				;$BB80FF   |
	INC $B0					;$BB8101   |
CODE_BB8103:					;	   |
	PLX					;$BB8103   |
	DEX					;$BB8104   |
	DEX					;$BB8105   |
	BPL CODE_BB80D7				;$BB8106   |
	LDA $B2					;$BB8108   |
	XBA					;$BB810A   |
	ORA $B0					;$BB810B   |
	STA $B0					;$BB810D   |
	RTL					;$BB810F  /

CODE_BB8110:
	LDA #$0000				;$BB8110  \
	RTL					;$BB8113  /

CODE_BB8114:
	LDA level_number			;$BB8114  \
CODE_BB8116:					;	   |
	JSR CODE_BB8169				;$BB8116   |
	LDA.l $7E59B2,x				;$BB8119   |
	AND $60					;$BB811D   |
	BNE CODE_BB8123				;$BB811F   |
	CLC					;$BB8121   |
	RTL					;$BB8122  /

CODE_BB8123:
	SEC					;$BB8123  \
	RTL					;$BB8124  /

CODE_BB8125:
	LDA level_number			;$BB8125  \
	JSR CODE_BB8169				;$BB8127   |
	LDA.l $7E59B2,x				;$BB812A   |
	ORA $60					;$BB812E   |
	STA $7E59B2,x				;$BB8130   |
	RTL					;$BB8134  /

CODE_BB8135:
	LDA $08A8				;$BB8135  \
CODE_BB8138:					;	   |
	JSR CODE_BB8169				;$BB8138   |
	LDA.l $7E59D2,x				;$BB813B   |
	AND $60					;$BB813F   |
	BNE CODE_BB8145				;$BB8141   |
	CLC					;$BB8143   |
	RTL					;$BB8144  /

CODE_BB8145:
	SEC					;$BB8145  \
	RTL					;$BB8146  /

CODE_BB8147:
	LDA $08A8				;$BB8147  \
	JSR CODE_BB8169				;$BB814A   |
	LDA.l $7E59D2,x				;$BB814D   |
	ORA $60					;$BB8151   |
	STA $7E59D2,x				;$BB8153   |
	RTL					;$BB8157  /

CODE_BB8158:
	LDA $08A8				;$BB8158  \
	JSR CODE_BB8169				;$BB815B   |
	LDA.l $7E59F2,x				;$BB815E   |
	ORA $60					;$BB8162   |
	STA $7E59F2,x				;$BB8164   |
	RTL					;$BB8168  /

CODE_BB8169:
	STA $5E					;$BB8169  \
	AND #$000F				;$BB816B   |
	ASL A					;$BB816E   |
	TAX					;$BB816F   |
	LDA.l DATA_BB817F,x			;$BB8170   |
	STA $60					;$BB8174   |
	LDA $5E					;$BB8176   |
	LSR A					;$BB8178   |
	LSR A					;$BB8179   |
	LSR A					;$BB817A   |
	LSR A					;$BB817B   |
	ASL A					;$BB817C   |
	TAX					;$BB817D   |
	RTS					;$BB817E  /


DATA_BB817F:
	db $01, $00, $02, $00, $04, $00, $08, $00
	db $10, $00, $20, $00, $40, $00, $80, $00
	db $00, $01, $00, $02, $00, $04, $00, $08
	db $00, $10, $00, $20, $00, $40, $00, $80

CODE_BB819F:
	STZ $0904				;$BB819F  \
	LDA #$0001				;$BB81A2   |
	STA $72					;$BB81A5   |
CODE_BB81A7:					;	   |
	LDA $72					;$BB81A7   |
	CMP #$009B				;$BB81A9   |
	BEQ CODE_BB81BC				;$BB81AC   |
	JSL CODE_BB80B4				;$BB81AE   |
	BEQ CODE_BB81BC				;$BB81B2   |
	AND #$00FF				;$BB81B4   |
	BNE CODE_BB81BC				;$BB81B7   |
	INC $0904				;$BB81B9   |
CODE_BB81BC:					;	   |
	INC $72					;$BB81BC   |
	LDA $72					;$BB81BE   |
	ASL A					;$BB81C0   |
	TAX					;$BB81C1   |
	LDA.l DATA_FD0000,x			;$BB81C2   |
	BNE CODE_BB81A7				;$BB81C6   |
	LDA #$59F2				;$BB81C8   |
	STA $26					;$BB81CB   |
	LDA #$007E				;$BB81CD   |
	STA $28					;$BB81D0   |
	LDY #$0000				;$BB81D2   |
	LDA #$0010				;$BB81D5   |
	STA $5E					;$BB81D8   |
CODE_BB81DA:					;	   |
	LDA [$26]				;$BB81DA   |
	LDX #$0010				;$BB81DC   |
CODE_BB81DF:					;	   |
	LSR A					;$BB81DF   |
	BCC CODE_BB81E3				;$BB81E0   |
	INY					;$BB81E2   |
CODE_BB81E3:					;	   |
	DEX					;$BB81E3   |
	BNE CODE_BB81DF				;$BB81E4   |
	INC $26					;$BB81E6   |
	INC $26					;$BB81E8   |
	DEC $5E					;$BB81EA   |
	BNE CODE_BB81DA				;$BB81EC   |
	TYA					;$BB81EE   |
	CLC					;$BB81EF   |
	ADC $0904				;$BB81F0   |
	STA $0904				;$BB81F3   |
	LDA #$0009				;$BB81F6   |
	LDY #$0001				;$BB81F9   |
	JSR CODE_BB824B				;$BB81FC   |
	LDA #$0021				;$BB81FF   |
	LDY #$0001				;$BB8202   |
	JSR CODE_BB824B				;$BB8205   |
	LDA #$000D				;$BB8208   |
	LDY #$0001				;$BB820B   |
	JSR CODE_BB824B				;$BB820E   |
	LDA #$0060				;$BB8211   |
	LDY #$0001				;$BB8214   |
	JSR CODE_BB824B				;$BB8217   |
	LDA #$0063				;$BB821A   |
	LDY #$0001				;$BB821D   |
	JSR CODE_BB824B				;$BB8220   |
	LDA #$0061				;$BB8223   |
	LDY #$0004				;$BB8226   |
	JSR CODE_BB824B				;$BB8229   |
	LDA #$006B				;$BB822C   |
	LDY #$0004				;$BB822F   |
	JSR CODE_BB824B				;$BB8232   |
	LDA $08FB				;$BB8235   |
	LDX #$0004				;$BB8238   |
CODE_BB823B:					;	   |
	LSR A					;$BB823B   |
	BCC CODE_BB8241				;$BB823C   |
	INC $0904				;$BB823E   |
CODE_BB8241:					;	   |
	DEX					;$BB8241   |
	BNE CODE_BB823B				;$BB8242   |
	LDA level_number			;$BB8244   |
	JSL CODE_BBAF0C				;$BB8246   |
	RTL					;$BB824A  /

CODE_BB824B:
	JSL CODE_BB825C				;$BB824B  \
	BCC CODE_BB8259				;$BB824F   |
	TYA					;$BB8251   |
	CLC					;$BB8252   |
	ADC $0904				;$BB8253   |
	STA $0904				;$BB8256   |
CODE_BB8259:					;	   |
	RTS					;$BB8259  /

	LDA level_number			;$BB825A   |
CODE_BB825C:					;	   |
	JSR CODE_BB8169				;$BB825C   |
	LDA.l $7E59F2,x				;$BB825F   |
	AND $60					;$BB8263   |
	BNE CODE_BB8269				;$BB8265   |
	CLC					;$BB8267   |
	RTL					;$BB8268  /

CODE_BB8269:
	SEC					;$BB8269  \
	RTL					;$BB826A  /

	JSR CODE_BB826F				;$BB826B   |
	RTL					;$BB826E  /

CODE_BB826F:
	JSR CODE_BB8297				;$BB826F  \
	BCS CODE_BB8281				;$BB8272   |
	PHY					;$BB8274   |
	JSR CODE_BB8318				;$BB8275   |
	PLY					;$BB8278   |
	BCS CODE_BB8281				;$BB8279   |
	STZ $16,x				;$BB827B   |
	STZ $1C,x				;$BB827D   |
	STZ $10,x				;$BB827F   |
CODE_BB8281:					;	   |
	RTS					;$BB8281  /

CODE_BB8282:
	PHA					;$BB8282  \
	JSR CODE_BB8297				;$BB8283   |
	PLA					;$BB8286   |
	BCS CODE_BB8296				;$BB8287   |
	PHY					;$BB8289   |
	JSR CODE_BB8345				;$BB828A   |
	PLY					;$BB828D   |
	BCS CODE_BB8296				;$BB828E   |
	STZ $16,x				;$BB8290   |
	STZ $1C,x				;$BB8292   |
	STZ $10,x				;$BB8294   |
CODE_BB8296:					;	   |
	RTS					;$BB8296  /

CODE_BB8297:
	LDX #main_sprite_table			;$BB8297  \
CODE_BB829A:					;	   |
	LDA $00,x				;$BB829A   |
	BEQ CODE_BB82B4				;$BB829C   |
	TXA					;$BB829E   |
	CLC					;$BB829F   |
	ADC #sizeof(sprite)			;$BB82A0   |
	TAX					;$BB82A3   |
	CPX #main_sprite_table_end		;$BB82A4   |
	BNE CODE_BB829A				;$BB82A7   |
	STZ alternate_sprite			;$BB82A9   |
	LDA #$0007				;$BB82AB   |
	JSL throw_exception			;$BB82AE   |
	SEC					;$BB82B2   |
	RTS					;$BB82B3  /

CODE_BB82B4:
	STX alternate_sprite			;$BB82B4  \
	CLC					;$BB82B6   |
	RTS					;$BB82B7  /

CODE_BB82B8:
	LDX current_sprite			;$BB82B8  \
	LDA $00,x				;$BB82BA   |
	BEQ CODE_BB82D1				;$BB82BC   |
	CMP #$00E4				;$BB82BE   |
	BCC CODE_BB82D7				;$BB82C1   |
CODE_BB82C3:					;	   |
	LDA $12,x				;$BB82C3   |
	JSR CODE_BB8C06				;$BB82C5   |
	LDX current_sprite			;$BB82C8   |
	JSR CODE_BB83B4				;$BB82CA   |
CODE_BB82CD:					;	   |
	LDX current_sprite			;$BB82CD   |
	STZ $00,x				;$BB82CF   |
CODE_BB82D1:					;	   |
	RTL					;$BB82D1  /

CODE_BB82D2:
	LDX current_sprite			;$BB82D2  \
	STZ $00,x				;$BB82D4   |
	RTL					;$BB82D6  /

CODE_BB82D7:
	CMP #$0084				;$BB82D7  \
	BCS CODE_BB82D2				;$BB82DA   |
	CMP #$006C				;$BB82DC   |
	BCC CODE_BB82ED				;$BB82DF   |
	LDA $12,x				;$BB82E1   |
	JSR CODE_BB8C06				;$BB82E3   |
	LDX current_sprite			;$BB82E6   |
	JSR CODE_BB83C5				;$BB82E8   |
	BRA CODE_BB82CD				;$BB82EB  /

CODE_BB82ED:
	STA $32					;$BB82ED  \
	LDX #$0E9E				;$BB82EF   |
CODE_BB82F2:					;	   |
	LDA $32					;$BB82F2   |
	CMP $00,x				;$BB82F4   |
	BEQ CODE_BB8307				;$BB82F6   |
CODE_BB82F8:					;	   |
	TXA					;$BB82F8   |
	CLC					;$BB82F9   |
	ADC #sizeof(sprite)			;$BB82FA   |
	TAX					;$BB82FD   |
	CPX #main_sprite_table_end		;$BB82FE   |
	BNE CODE_BB82F2				;$BB8301   |
	LDX current_sprite			;$BB8303   |
	BRA CODE_BB82C3				;$BB8305  /

CODE_BB8307:
	CPX current_sprite			;$BB8307  \
	BEQ CODE_BB82F8				;$BB8309   |
	LDX current_sprite			;$BB830B   |
	LDA $12,x				;$BB830D   |
	JSR CODE_BB8C06				;$BB830F   |
	BRA CODE_BB82CD				;$BB8312  /

	JSR CODE_BB8318				;$BB8314   |
	RTL					;$BB8317  /

CODE_BB8318:
	LDY #$001A				;$BB8318  \
CODE_BB831B:					;	   |
	LDA $0B04,y				;$BB831B   |
	BEQ CODE_BB832D				;$BB831E   |
	DEY					;$BB8320   |
	DEY					;$BB8321   |
	BPL CODE_BB831B				;$BB8322   |
	LDA #$0006				;$BB8324   |
	JSL throw_exception			;$BB8327   |
	SEC					;$BB832B   |
	RTS					;$BB832C  /

CODE_BB832D:
	TXA					;$BB832D  \
	STA $0B04,y				;$BB832E   |
	TYA					;$BB8331   |
	ASL A					;$BB8332   |
	ASL A					;$BB8333   |
	ASL A					;$BB8334   |
	ASL A					;$BB8335   |
	EOR $12,x				;$BB8336   |
	AND #$01FF				;$BB8338   |
	EOR $12,x				;$BB833B   |
	STA $12,x				;$BB833D   |
	CLC					;$BB833F   |
	RTS					;$BB8340  /

CODE_BB8341:
	JSR CODE_BB8345				;$BB8341  \
	RTL					;$BB8344  /

CODE_BB8345:
	STA $32					;$BB8345  \
	STA $34					;$BB8347   |
	ASL A					;$BB8349   |
	CLC					;$BB834A   |
	ADC #$FFFE				;$BB834B   |
	STA $36					;$BB834E   |
	LDY #$0018				;$BB8350   |
CODE_BB8353:					;	   |
	LDA $0B04,y				;$BB8353   |
	BEQ CODE_BB8372				;$BB8356   |
CODE_BB8358:					;	   |
	DEY					;$BB8358   |
	DEY					;$BB8359   |
	CPY $36					;$BB835A   |
	BPL CODE_BB8353				;$BB835C   |
	LDA #$0003				;$BB835E   |
	JSL throw_exception			;$BB8361   |
	SEC					;$BB8365   |
	RTS					;$BB8366  /

CODE_BB8367:
	LDA $34					;$BB8367  \
	STA $32					;$BB8369   |
	BRA CODE_BB8358				;$BB836B  /

CODE_BB836D:
	LDA $0B04,y				;$BB836D  \
	BNE CODE_BB8367				;$BB8370   |
CODE_BB8372:					;	   |
	DEC $32					;$BB8372   |
	BEQ CODE_BB837A				;$BB8374   |
	DEY					;$BB8376   |
	DEY					;$BB8377   |
	BRA CODE_BB836D				;$BB8378  /

CODE_BB837A:
	TYA					;$BB837A  \
	ASL A					;$BB837B   |
	ASL A					;$BB837C   |
	ASL A					;$BB837D   |
	ASL A					;$BB837E   |
	EOR $12,x				;$BB837F   |
	AND #$01FF				;$BB8381   |
	EOR $12,x				;$BB8384   |
	STA $12,x				;$BB8386   |
	BRA CODE_BB838C				;$BB8388  /

CODE_BB838A:
	INY					;$BB838A  \
	INY					;$BB838B   |
CODE_BB838C:					;	   |
	TXA					;$BB838C   |
	STA $0B04,y				;$BB838D   |
	DEC $34					;$BB8390   |
	BNE CODE_BB838A				;$BB8392   |
	CLC					;$BB8394   |
	RTS					;$BB8395  /

	LDY #$001C				;$BB8396   |
	LDX #$0000				;$BB8399   |
CODE_BB839C:					;	   |
	LDA $0B04,y				;$BB839C   |
	BNE CODE_BB83A2				;$BB839F   |
	INX					;$BB83A1   |
CODE_BB83A2:					;	   |
	DEY					;$BB83A2   |
	DEY					;$BB83A3   |
	CPY #$0008				;$BB83A4   |
	BPL CODE_BB839C				;$BB83A7   |
	TXA					;$BB83A9   |
	BEQ CODE_BB83AE				;$BB83AA   |
	CLC					;$BB83AC   |
	RTL					;$BB83AD  /

CODE_BB83AE:
	SEC					;$BB83AE  \
	RTL					;$BB83AF  /

	JSR CODE_BB83B4				;$BB83B0   |
	RTL					;$BB83B3  /

CODE_BB83B4:
	LDA $12,x				;$BB83B4  \
	AND #$01E0				;$BB83B6   |
	LSR A					;$BB83B9   |
	LSR A					;$BB83BA   |
	LSR A					;$BB83BB   |
	LSR A					;$BB83BC   |
	TAY					;$BB83BD   |
	LDA #$0000				;$BB83BE   |
	STA $0B04,y				;$BB83C1   |
	RTS					;$BB83C4  /

CODE_BB83C5:
	LDA $12,x				;$BB83C5  \
	AND #$01E0				;$BB83C7   |
	LSR A					;$BB83CA   |
	LSR A					;$BB83CB   |
	LSR A					;$BB83CC   |
	LSR A					;$BB83CD   |
	TAY					;$BB83CE   |
	LDA $0B04,y				;$BB83CF   |
	CMP $0B06,y				;$BB83D2   |
	BNE CODE_BB83E1				;$BB83D5   |
	LDA #$0000				;$BB83D7   |
	STA $0B04,y				;$BB83DA   |
	STA $0B06,y				;$BB83DD   |
	RTS					;$BB83E0  /

CODE_BB83E1:
	LDA #$0000				;$BB83E1  \
	STA $0B04,y				;$BB83E4   |
	LDA #$0004				;$BB83E7   |
	JSL throw_exception			;$BB83EA   |
	RTS					;$BB83EE  /

CODE_BB83EF:
	TYX					;$BB83EF  \
	LDA.l DATA_FF047E,x			;$BB83F0   |
	TAY					;$BB83F4   |
CODE_BB83F5:					;	   |
	PHY					;$BB83F5   |
	JSR CODE_BB8297				;$BB83F6   |
	PLY					;$BB83F9   |
	BCS CODE_BB8411				;$BB83FA   |
	STZ $56,x				;$BB83FC   |
	LDA #$000F				;$BB83FE   |
	STA $58,x				;$BB8401   |
	LDA #$C000				;$BB8403   |
	STA $1C,x				;$BB8406   |
	STZ $1A,x				;$BB8408   |
	STZ $16,x				;$BB840A   |
	STZ $40,x				;$BB840C   |
	BRL CODE_BB8468				;$BB840E  /

CODE_BB8411:
	RTL					;$BB8411  /

CODE_BB8412:
	TYX					;$BB8412  \
	LDA.l DATA_FF047E,x			;$BB8413   |
	TAY					;$BB8417   |
CODE_BB8418:					;	   |
	PHY					;$BB8418   |
	JSR CODE_BB8297				;$BB8419   |
	PLY					;$BB841C   |
	BCS CODE_BB842B				;$BB841D   |
	STZ $56,x				;$BB841F   |
	LDA #$000F				;$BB8421   |
	STA $58,x				;$BB8424   |
	STZ $1C,x				;$BB8426   |
	BRL CODE_BB8468				;$BB8428  /

CODE_BB842B:
	RTL					;$BB842B  /

CODE_BB842C:
	TYX					;$BB842C  \
	LDA.l DATA_FF047E,x			;$BB842D   |
	TAY					;$BB8431   |
CODE_BB8432:					;	   |
	PHY					;$BB8432   |
	JSR CODE_BB826F				;$BB8433   |
	PLY					;$BB8436   |
	BCS CODE_BB8442				;$BB8437   |
	STZ $56,x				;$BB8439   |
	LDA #$000F				;$BB843B   |
	STA $58,x				;$BB843E   |
	BRA CODE_BB8468				;$BB8440  /

CODE_BB8442:
	RTL					;$BB8442  /

CODE_BB8443:
	TYX					;$BB8443  \
	LDA.l DATA_FF047E,x			;$BB8444   |
	TAY					;$BB8448   |
	LDA #$0002				;$BB8449   |
	PHY					;$BB844C   |
	JSR CODE_BB8282				;$BB844D   |
	PLY					;$BB8450   |
	BCS CODE_BB845C				;$BB8451   |
	STZ $56,x				;$BB8453   |
	LDA #$000F				;$BB8455   |
	STA $58,x				;$BB8458   |
	BRA CODE_BB8468				;$BB845A  /

CODE_BB845C:
	RTL					;$BB845C  /

CODE_BB845D:
	JSL CODE_BB8474				;$BB845D  \
	RTL					;$BB8461  /

CODE_BB8462:
	TYX					;$BB8462  \
	LDA.l DATA_FF047E,x			;$BB8463   |
	TAY					;$BB8467   |
CODE_BB8468:					;	   |
	LDX alternate_sprite			;$BB8468   |
	STZ $1E,x				;$BB846A   |
	STZ $30,x				;$BB846C   |
	STZ $2C,x				;$BB846E   |
	STZ $56,x				;$BB8470   |
	STZ $32,x				;$BB8472   |
CODE_BB8474:					;	   |
	PHB					;$BB8474   |
	%pea_shift_dbr(DATA_FF0000)		;$BB8475   |
	PLB					;$BB8478   |
	PLB					;$BB8479   |
	BRA parse_initscript_entry		;$BB847A  /

parse_initscript:
	PHB					;$BB847C  \
	BRA parse_initscript_entry		;$BB847D  /

set_sprite_config:
	TCD					;$BB847F  \
	LDA.w DATA_FF0002,y			;$BB8480   |
	STA $00,x				;$BB8483   |
initscript_next:				;	   |
	INY					;$BB8485   |
	INY					;$BB8486   |
initscript_next_no_operand:			;	   |
	INY					;$BB8487   |
	INY					;$BB8488   |
parse_initscript_entry:				;	   |
	LDA.w DATA_FF0000,y			;$BB8489   |
	BPL set_sprite_config			;$BB848C   |
	AND #$FF00				;$BB848E   |
	XBA					;$BB8491   |
	SEC					;$BB8492   |
	SBC #$0080				;$BB8493   |
	ASL A					;$BB8496   |
	TAX					;$BB8497   |
	JMP (initscript_commands,x)		;$BB8498  /

initscript_commands:
	dw init_command_success
	dw initcommand_set_animation
	dw init_command_skip_operand
	dw init_command_load_subconfig
	dw init_command_set_palette
	dw init_command_set_oam_properties
	dw init_command_spawn_relative
	dw init_command_set_directional
	dw init_command_set_position
	dw CODE_BB86D5
	dw init_command_bulk_set
	dw init_command_set_oam_special
	dw init_command_set_palette_copy
	dw init_command_set_alt_palette
	dw CODE_BB879E


CODE_BB84B9:
	PLB					;$BB84B9  \
	SEC					;$BB84BA   |
	LDA #$0000				;$BB84BB   |
	TCD					;$BB84BE   |
	RTL					;$BB84BF  /

init_command_success:
	PLB					;$BB84C0  \
	CLC					;$BB84C1   |
	LDA #$0000				;$BB84C2   |
	TCD					;$BB84C5   |
	RTL					;$BB84C6  /

initcommand_set_animation:
	LDA #$0000				;$BB84C7  \
	TCD					;$BB84CA   |
	LDA.w DATA_FF0002,y			;$BB84CB   |
	PHY					;$BB84CE   |
	JSL CODE_B9D09B				;$BB84CF   |
	PLY					;$BB84D3   |
	LDX alternate_sprite			;$BB84D4   |
	BRA initscript_next			;$BB84D6  /

init_command_skip_operand:
	BRA initscript_next			;$BB84D8  /

init_command_load_subconfig:
	LDA #$0000				;$BB84DA  \
	TCD					;$BB84DD   |
	PHY					;$BB84DE   |
	LDA.w DATA_FF0002,y			;$BB84DF   |
	TAY					;$BB84E2   |
	LDX alternate_sprite			;$BB84E3   |
	JSL parse_initscript			;$BB84E5   |
	PLY					;$BB84E9   |
	LDX alternate_sprite			;$BB84EA   |
	BRA initscript_next			;$BB84EC  /

init_command_set_palette:
	LDA #$0000				;$BB84EE  \
	TCD					;$BB84F1   |
	LDA.w DATA_FF0002,y			;$BB84F2   |
	PHB					;$BB84F5   |
	PHK					;$BB84F6   |
	PLB					;$BB84F7   |
	PHY					;$BB84F8   |
	JSR CODE_BB8A6F				;$BB84F9   |
	PLY					;$BB84FC   |
	LDX alternate_sprite			;$BB84FD   |
	EOR $12,x				;$BB84FF   |
	AND #$0E00				;$BB8501   |
	EOR $12,x				;$BB8504   |
	STA $12,x				;$BB8506   |
	PLB					;$BB8508   |
	JMP initscript_next			;$BB8509  /

init_command_set_oam_properties:
	LDA #$0000				;$BB850C  \
	TCD					;$BB850F   |
	LDX alternate_sprite			;$BB8510   |
	LDA.w DATA_FF0002,y			;$BB8512   |
	EOR $12,x				;$BB8515   |
	AND #$F000				;$BB8517   |
	EOR $12,x				;$BB851A   |
	STA $12,x				;$BB851C   |
	JMP initscript_next			;$BB851E  /

init_command_spawn_relative:
	LDA #$0000				;$BB8521  \
	TCD					;$BB8524   |
	LDA.w DATA_FF0002,y			;$BB8525   |
	LDX current_sprite			;$BB8528   |
	BIT $12,x				;$BB852A   |
	BVC CODE_BB8532				;$BB852C   |
	EOR #$FFFF				;$BB852E   |
	INC A					;$BB8531   |
CODE_BB8532:					;	   |
	CLC					;$BB8532   |
	ADC $06,x				;$BB8533   |
	LDX alternate_sprite			;$BB8535   |
	STA $06,x				;$BB8537   |
	LDA.w DATA_FF0004,y			;$BB8539   |
	LDX current_sprite			;$BB853C   |
	BIT $12,x				;$BB853E   |
	BPL CODE_BB8546				;$BB8540   |
	EOR #$FFFF				;$BB8542   |
	INC A					;$BB8545   |
CODE_BB8546:					;	   |
	CLC					;$BB8546   |
	ADC $0A,x				;$BB8547   |
	LDX alternate_sprite			;$BB8549   |
	STA $0A,x				;$BB854B   |
	PHB					;$BB854D   |
	PHK					;$BB854E   |
	PLB					;$BB854F   |
	PHY					;$BB8550   |
	LDY current_sprite			;$BB8551   |
	LDX alternate_sprite			;$BB8553   |
	LDA $0002,y				;$BB8555   |
	INC A					;$BB8558   |
	STA $02,x				;$BB8559   |
	LDA $001C,y				;$BB855B   |
	CMP #$C000				;$BB855E   |
	BNE CODE_BB8565				;$BB8561   |
	STA $1C,x				;$BB8563   |
CODE_BB8565:					;	   |
	LDA $0004,y				;$BB8565   |
	STA $04,x				;$BB8568   |
	LDA $0008,y				;$BB856A   |
	STA $08,x				;$BB856D   |
	LDA $0012,y				;$BB856F   |
	EOR $12,x				;$BB8572   |
	AND #$F000				;$BB8574   |
	EOR $12,x				;$BB8577   |
	STA $12,x				;$BB8579   |
	PLY					;$BB857B   |
	PLB					;$BB857C   |
	INY					;$BB857D   |
	INY					;$BB857E   |
	JMP initscript_next			;$BB857F  /

init_command_set_directional:
	LDA #$0000				;$BB8582  \
	TCD					;$BB8585   |
	LDA.w DATA_FF0004,y			;$BB8586   |
	LDX current_sprite			;$BB8589   |
	BIT $12,x				;$BB858B   |
	BVC CODE_BB8593				;$BB858D   |
	EOR #$FFFF				;$BB858F   |
	INC A					;$BB8592   |
CODE_BB8593:					;	   |
	LDX alternate_sprite			;$BB8593   |
	PHA					;$BB8595   |
	LDA.w DATA_FF0002,y			;$BB8596   |
	TCD					;$BB8599   |
	PLA					;$BB859A   |
	STA $00,x				;$BB859B   |
	INY					;$BB859D   |
	INY					;$BB859E   |
	JMP initscript_next			;$BB859F  /

init_command_set_position:
	LDA #$0000				;$BB85A2  \
	TCD					;$BB85A5   |
	LDX alternate_sprite			;$BB85A6   |
	LDA.l $000A3E				;$BB85A8   |
	STA $06,x				;$BB85AC   |
	LDA.l $000A40				;$BB85AE   |
	STA $0A,x				;$BB85B2   |
	LDA #$00F8				;$BB85B4   |
	STA $02,x				;$BB85B7   |
	JMP initscript_next_no_operand		;$BB85B9  /

init_command_bulk_set:
	LDA #$0000				;$BB85BC  \
	TCD					;$BB85BF   |
	LDX alternate_sprite			;$BB85C0   |
	STZ $5C,x				;$BB85C2   |
	LDA.w DATA_FF0002,y			;$BB85C4   |
	STA $46,x				;$BB85C7   |
	LDA.w DATA_FF0004,y			;$BB85C9   |
	STA $42,x				;$BB85CC   |
	LDA.w DATA_FF0006,y			;$BB85CE   |
	STA $4C,x				;$BB85D1   |
	LDA.w DATA_FF0008,y			;$BB85D3   |
	STA $4E,x				;$BB85D6   |
	LDA.w DATA_FF000A,y			;$BB85D8   |
	STA $52,x				;$BB85DB   |
	LDA.w DATA_FF000C,y			;$BB85DD   |
	STA $28,x				;$BB85E0   |
	LDA.w DATA_FF000E,y			;$BB85E2   |
	STA $22,x				;$BB85E5   |
	LDA.w DATA_FF0010,y			;$BB85E7   |
	STA $2C,x				;$BB85EA   |
	LDA.w DATA_FF0012,y			;$BB85EC   |
	STA $20,x				;$BB85EF   |
	LDA.w DATA_FF0014,y			;$BB85F1   |
	STA $24,x				;$BB85F4   |
	LDA.w DATA_FF0016,y			;$BB85F6   |
	STA $26,x				;$BB85F9   |
	LDA.w DATA_FF0018,y			;$BB85FB   |
	STA $3A,x				;$BB85FE   |
	LDA.w DATA_FF001A,y			;$BB8600   |
	STA $36,x				;$BB8603   |
	TYA					;$BB8605   |
	CLC					;$BB8606   |
	ADC #$001C				;$BB8607   |
	TAY					;$BB860A   |
	JMP parse_initscript_entry		;$BB860B  /

init_command_set_oam_special:
	LDA #$0000				;$BB860E  \
	TCD					;$BB8611   |
	LDX alternate_sprite			;$BB8612   |
	LDA.w DATA_FF0002,y			;$BB8614   |
	EOR $12,x				;$BB8617   |
	AND #$F000				;$BB8619   |
	EOR $12,x				;$BB861C   |
	STA $12,x				;$BB861E   |
	LDA.l $00052B				;$BB8620   |
	AND #$0002				;$BB8624   |
	BEQ CODE_BB8633				;$BB8627   |
	LDA $12,x				;$BB8629   |
	AND #$3000				;$BB862B   |
	CMP #$3000				;$BB862E   |
	BNE CODE_BB8636				;$BB8631   |
CODE_BB8633:					;	   |
	JMP initscript_next			;$BB8633  /

CODE_BB8636:
	CLC					;$BB8636  \
	ADC #$1000				;$BB8637   |
	EOR $12,x				;$BB863A   |
	AND #$3000				;$BB863C   |
	EOR $12,x				;$BB863F   |
	STA $12,x				;$BB8641   |
	JMP initscript_next			;$BB8643  /

init_command_set_palette_copy:
	JML init_command_set_palette		;$BB8646  /

	LDA #$0000				;$BB864A   |
	TCD					;$BB864D   |
	LDX #$0000				;$BB864E   |
	LDA.l $000597				;$BB8651   |
	CMP alternate_sprite			;$BB8655   |
	BNE CODE_BB865C				;$BB8657   |
	LDX #$001E				;$BB8659   |
CODE_BB865C:					;	   |
	TXA					;$BB865C   |
	CLC					;$BB865D   |
	ADC.w DATA_FF0002,y			;$BB865E   |
	PHB					;$BB8661   |
	PHK					;$BB8662   |
	PLB					;$BB8663   |
	PHY					;$BB8664   |
	JSR CODE_BB8A6F				;$BB8665   |
	PLY					;$BB8668   |
	LDX alternate_sprite			;$BB8669   |
	EOR $12,x				;$BB866B   |
	AND #$0E00				;$BB866D   |
	EOR $12,x				;$BB8670   |
	STA $12,x				;$BB8672   |
	PLB					;$BB8674   |
	JMP initscript_next			;$BB8675  /

init_command_set_alt_palette:
	LDA #$0000				;$BB8678  \
	TCD					;$BB867B   |
	LDA.w DATA_FF0002,y			;$BB867C   |
	PHB					;$BB867F   |
	PHK					;$BB8680   |
	PLB					;$BB8681   |
	PHY					;$BB8682   |
	JSR CODE_BB8A69				;$BB8683   |
	PLY					;$BB8686   |
	LDX alternate_sprite			;$BB8687   |
	EOR $12,x				;$BB8689   |
	AND #$0E00				;$BB868B   |
	EOR $12,x				;$BB868E   |
	STA $12,x				;$BB8690   |
	PLB					;$BB8692   |
	JMP initscript_next			;$BB8693  /

	LDA $D9					;$BB8696   |
	CMP $E1					;$BB8698   |
	BPL CODE_BB869E				;$BB869A   |
	LDA $E1					;$BB869C   |
CODE_BB869E:					;	   |
	STA $5E					;$BB869E   |
	LDA $DD					;$BB86A0   |
	CMP $E5					;$BB86A2   |
	BMI CODE_BB86A8				;$BB86A4   |
	LDA $E5					;$BB86A6   |
CODE_BB86A8:					;	   |
	SEC					;$BB86A8   |
	SBC $5E					;$BB86A9   |
	CMP #$8000				;$BB86AB   |
	ROR A					;$BB86AE   |
	CLC					;$BB86AF   |
	ADC $5E					;$BB86B0   |
	STA $0A3E				;$BB86B2   |
	LDA $DF					;$BB86B5   |
	CMP $E7					;$BB86B7   |
	BPL CODE_BB86BD				;$BB86B9   |
	LDA $E7					;$BB86BB   |
CODE_BB86BD:					;	   |
	STA $5E					;$BB86BD   |
	LDA $DB					;$BB86BF   |
	CMP $E3					;$BB86C1   |
	BMI CODE_BB86C7				;$BB86C3   |
	LDA $E3					;$BB86C5   |
CODE_BB86C7:					;	   |
	SEC					;$BB86C7   |
	SBC $5E					;$BB86C8   |
	CMP #$8000				;$BB86CA   |
	ROR A					;$BB86CD   |
	CLC					;$BB86CE   |
	ADC $5E					;$BB86CF   |
	STA $0A40				;$BB86D1   |
	RTL					;$BB86D4  /

CODE_BB86D5:
	LDA #$0000				;$BB86D5  \
	TCD					;$BB86D8   |
	LDA.w DATA_FF0002,y			;$BB86D9   |
	STA $32					;$BB86DC   |
	LDA.w DATA_FF0004,y			;$BB86DE   |
	STA $34					;$BB86E1   |
	LDA.w DATA_FF0006,y			;$BB86E3   |
	STA $36					;$BB86E6   |
	LDA.w DATA_FF0008,y			;$BB86E8   |
	STA $38					;$BB86EB   |
	PHB					;$BB86ED   |
	PHB					;$BB86EE   |
	PLA					;$BB86EF   |
	STA $3A					;$BB86F0   |
	PHK					;$BB86F2   |
	PLB					;$BB86F3   |
	LDA $34					;$BB86F4   |
	PHY					;$BB86F6   |
	JSR CODE_BB8A6F				;$BB86F7   |
	PLY					;$BB86FA   |
	BCS CODE_BB876C				;$BB86FB   |
	LDX alternate_sprite			;$BB86FD   |
	EOR $12,x				;$BB86FF   |
	AND #$0E00				;$BB8701   |
	EOR $12,x				;$BB8704   |
	STA $12,x				;$BB8706   |
	LDX #$0E9E				;$BB8708   |
CODE_BB870B:					;	   |
	LDA $32					;$BB870B   |
	CMP $00,x				;$BB870D   |
	BEQ CODE_BB8783				;$BB870F   |
	TXA					;$BB8711   |
	CLC					;$BB8712   |
	ADC #sizeof(sprite)			;$BB8713   |
	TAX					;$BB8716   |
	CPX #main_sprite_table_end		;$BB8717   |
	BNE CODE_BB870B				;$BB871A   |
	LDA $1730				;$BB871C   |
	CMP #$0018				;$BB871F   |
	BPL CODE_BB876F				;$BB8722   |
	LDX alternate_sprite			;$BB8724   |
	PHY					;$BB8726   |
	JSR CODE_BB8318				;$BB8727   |
	PLY					;$BB872A   |
	BCS CODE_BB876F				;$BB872B   |
	LDX $1730				;$BB872D   |
	LDA $36					;$BB8730   |
	STA $1736,x				;$BB8732   |
	LDA $38					;$BB8735   |
	AND #$00FF				;$BB8737   |
	ORA #$8000				;$BB873A   |
	STA $1738,x				;$BB873D   |
	LDA $38					;$BB8740   |
	AND #$FF00				;$BB8742   |
	LSR A					;$BB8745   |
	LSR A					;$BB8746   |
	LSR A					;$BB8747   |
	STA $1732,x				;$BB8748   |
	PHY					;$BB874B   |
	LDY alternate_sprite			;$BB874C   |
	LDA $0012,y				;$BB874E   |
	AND #$01FF				;$BB8751   |
	ASL A					;$BB8754   |
	ASL A					;$BB8755   |
	ASL A					;$BB8756   |
	ASL A					;$BB8757   |
	STA $1734,x				;$BB8758   |
	PLY					;$BB875B   |
	TXA					;$BB875C   |
	CLC					;$BB875D   |
	ADC #$0008				;$BB875E   |
	STA $1730				;$BB8761   |
	LDX alternate_sprite			;$BB8764   |
	LDA $32					;$BB8766   |
	STA $00,x				;$BB8768   |
	BRA CODE_BB8790				;$BB876A  /

CODE_BB876C:
	JMP CODE_BB84B9				;$BB876C  /

CODE_BB876F:
	LDX alternate_sprite			;$BB876F  \
	LDA $12,x				;$BB8771   |
	JSR CODE_BB8C06				;$BB8773   |
	BCS CODE_BB8780				;$BB8776   |
	LDA $F1					;$BB8778   |
	DEC A					;$BB877A   |
	AND #$000F				;$BB877B   |
	STA $F1					;$BB877E   |
CODE_BB8780:					;	   |
	JMP CODE_BB84B9				;$BB8780  /

CODE_BB8783:
	LDA $12,x				;$BB8783  \
	LDX alternate_sprite			;$BB8785   |
	AND #$FFE0				;$BB8787   |
	STA $12,x				;$BB878A   |
	LDA $32					;$BB878C   |
	STA $00,x				;$BB878E   |
CODE_BB8790:					;	   |
	LDA $3A					;$BB8790   |
	PHA					;$BB8792   |
	PLB					;$BB8793   |
	PLB					;$BB8794   |
	INY					;$BB8795   |
	INY					;$BB8796   |
	INY					;$BB8797   |
	INY					;$BB8798   |
	INY					;$BB8799   |
	INY					;$BB879A   |
	JMP initscript_next			;$BB879B  /

CODE_BB879E:
	LDA #$0000				;$BB879E  \
	TCD					;$BB87A1   |
	LDA.w DATA_FF0002,y			;$BB87A2   |
	STA $32					;$BB87A5   |
	LDA.w DATA_FF0004,y			;$BB87A7   |
	STA $34					;$BB87AA   |
	LDA.w DATA_FF0006,y			;$BB87AC   |
	STA $36					;$BB87AF   |
	LDA.w DATA_FF0008,y			;$BB87B1   |
	STA $38					;$BB87B4   |
	PHB					;$BB87B6   |
	PHB					;$BB87B7   |
	PLA					;$BB87B8   |
	STA $3A					;$BB87B9   |
	PHK					;$BB87BB   |
	PLB					;$BB87BC   |
	LDA $34					;$BB87BD   |
	PHY					;$BB87BF   |
	JSR CODE_BB8A69				;$BB87C0   |
	PLY					;$BB87C3   |
	BCS CODE_BB8835				;$BB87C4   |
	LDX alternate_sprite			;$BB87C6   |
	EOR $12,x				;$BB87C8   |
	AND #$0E00				;$BB87CA   |
	EOR $12,x				;$BB87CD   |
	STA $12,x				;$BB87CF   |
	LDX #$0E9E				;$BB87D1   |
CODE_BB87D4:					;	   |
	LDA $32					;$BB87D4   |
	CMP $00,x				;$BB87D6   |
	BEQ CODE_BB884C				;$BB87D8   |
	TXA					;$BB87DA   |
	CLC					;$BB87DB   |
	ADC #sizeof(sprite)			;$BB87DC   |
	TAX					;$BB87DF   |
	CPX #main_sprite_table_end		;$BB87E0   |
	BNE CODE_BB87D4				;$BB87E3   |
	LDA $1730				;$BB87E5   |
	CMP #$0018				;$BB87E8   |
	BPL CODE_BB8838				;$BB87EB   |
	LDX alternate_sprite			;$BB87ED   |
	PHY					;$BB87EF   |
	JSR CODE_BB8318				;$BB87F0   |
	PLY					;$BB87F3   |
	BCS CODE_BB8838				;$BB87F4   |
	LDX $1730				;$BB87F6   |
	LDA $36					;$BB87F9   |
	STA $1736,x				;$BB87FB   |
	LDA $38					;$BB87FE   |
	AND #$00FF				;$BB8800   |
	ORA #$8000				;$BB8803   |
	STA $1738,x				;$BB8806   |
	LDA $38					;$BB8809   |
	AND #$FF00				;$BB880B   |
	LSR A					;$BB880E   |
	LSR A					;$BB880F   |
	LSR A					;$BB8810   |
	STA $1732,x				;$BB8811   |
	PHY					;$BB8814   |
	LDY alternate_sprite			;$BB8815   |
	LDA $0012,y				;$BB8817   |
	AND #$01FF				;$BB881A   |
	ASL A					;$BB881D   |
	ASL A					;$BB881E   |
	ASL A					;$BB881F   |
	ASL A					;$BB8820   |
	STA $1734,x				;$BB8821   |
	PLY					;$BB8824   |
	TXA					;$BB8825   |
	CLC					;$BB8826   |
	ADC #$0008				;$BB8827   |
	STA $1730				;$BB882A   |
	LDX alternate_sprite			;$BB882D   |
	LDA $32					;$BB882F   |
	STA $00,x				;$BB8831   |
	BRA CODE_BB885F				;$BB8833  /

CODE_BB8835:
	JMP CODE_BB84B9				;$BB8835  /

CODE_BB8838:
	LDX alternate_sprite			;$BB8838  \
	LDA $12,x				;$BB883A   |
	JSR CODE_BB8C06				;$BB883C   |
	BCS CODE_BB8849				;$BB883F   |
	LDA $F1					;$BB8841   |
	DEC A					;$BB8843   |
	AND #$000F				;$BB8844   |
	STA $F1					;$BB8847   |
CODE_BB8849:					;	   |
	JMP CODE_BB84B9				;$BB8849  /

CODE_BB884C:
	LDA $12,x				;$BB884C  \
	LDX alternate_sprite			;$BB884E   |
	AND #$FFE0				;$BB8850   |
	STA $12,x				;$BB8853   |
	LDA $32					;$BB8855   |
	STA $00,x				;$BB8857   |
	STZ $16,x				;$BB8859   |
	STZ $1C,x				;$BB885B   |
	STZ $10,x				;$BB885D   |
CODE_BB885F:					;	   |
	LDA $3A					;$BB885F   |
	PHA					;$BB8861   |
	PLB					;$BB8862   |
	PLB					;$BB8863   |
	INY					;$BB8864   |
	INY					;$BB8865   |
	INY					;$BB8866   |
	INY					;$BB8867   |
	INY					;$BB8868   |
	INY					;$BB8869   |
	JMP initscript_next			;$BB886A  /

CODE_BB886D:
	LDX #$0000				;$BB886D  \
	JSR CODE_BB895A				;$BB8870   |
	JSR CODE_BB896A				;$BB8873   |
	LDX #$0000				;$BB8876   |
CODE_BB8879:					;	   |
	LDA.l $7F9650,x				;$BB8879   |
	EOR #$FFFF				;$BB887D   |
	STA $7F9650,x				;$BB8880   |
	INX					;$BB8884   |
	INX					;$BB8885   |
	CPX #$0EA8				;$BB8886   |
	BNE CODE_BB8879				;$BB8889   |
	RTS					;$BB888B  /

	LDX #$0000				;$BB888C   |
CODE_BB888F:					;	   |
	LDA.l DATA_FD62DC,x			;$BB888F   |
	AND #$001F				;$BB8893   |
	STA $32					;$BB8896   |
	LSR A					;$BB8898   |
	CLC					;$BB8899   |
	ADC $32					;$BB889A   |
	LSR A					;$BB889C   |
	STA $34					;$BB889D   |
	LDA.l DATA_FD62DC,x			;$BB889F   |
	AND #$03E0				;$BB88A3   |
	STA $32					;$BB88A6   |
	LSR A					;$BB88A8   |
	LSR A					;$BB88A9   |
	CLC					;$BB88AA   |
	ADC $32					;$BB88AB   |
	LSR A					;$BB88AD   |
	AND #$03E0				;$BB88AE   |
	TSB $34					;$BB88B1   |
	LDA.l DATA_FD62DC,x			;$BB88B3   |
	AND #$7C00				;$BB88B7   |
	STA $32					;$BB88BA   |
	LSR A					;$BB88BC   |
	LSR A					;$BB88BD   |
	CLC					;$BB88BE   |
	ADC $32					;$BB88BF   |
	CMP #$7C00				;$BB88C1   |
	BCC CODE_BB88C9				;$BB88C4   |
	LDA #$7C00				;$BB88C6   |
CODE_BB88C9:					;	   |
	AND #$7C00				;$BB88C9   |
	ORA $34					;$BB88CC   |
	STA $7F9650,x				;$BB88CE   |
	INX					;$BB88D2   |
	INX					;$BB88D3   |
	CPX #$0E8A				;$BB88D4   |
	BNE CODE_BB888F				;$BB88D7   |
	JSR CODE_BB895A				;$BB88D9   |
	JSR CODE_BB896A				;$BB88DC   |
	RTS					;$BB88DF  /

	LDX #$0000				;$BB88E0   |
CODE_BB88E3:					;	   |
	LDA.l DATA_FD62DC,x			;$BB88E3   |
	AND #$001F				;$BB88E7   |
	XBA					;$BB88EA   |
	LSR A					;$BB88EB   |
	LSR A					;$BB88EC   |
	STA $34					;$BB88ED   |
	LSR A					;$BB88EF   |
	LSR A					;$BB88F0   |
	CLC					;$BB88F1   |
	ADC $34					;$BB88F2   |
	XBA					;$BB88F4   |
	AND #$001F				;$BB88F5   |
	STA $32					;$BB88F8   |
	LDA.l DATA_FD62DC,x			;$BB88FA   |
	AND #$03E0				;$BB88FE   |
	LSR A					;$BB8901   |
	STA $34					;$BB8902   |
	LSR A					;$BB8904   |
	LSR A					;$BB8905   |
	CLC					;$BB8906   |
	ADC $34					;$BB8907   |
	AND #$01E0				;$BB8909   |
	TSB $32					;$BB890C   |
	ASL A					;$BB890E   |
	ASL A					;$BB890F   |
	ASL A					;$BB8910   |
	ASL A					;$BB8911   |
	ASL A					;$BB8912   |
	ORA $32					;$BB8913   |
	STA $7F9650,x				;$BB8915   |
	INX					;$BB8919   |
	INX					;$BB891A   |
	CPX #$014A				;$BB891B   |
	BNE CODE_BB88E3				;$BB891E   |
CODE_BB8920:					;	   |
	LDA.l DATA_FD62DC,x			;$BB8920   |
	AND #$001F				;$BB8924   |
	LSR A					;$BB8927   |
	STA $32					;$BB8928   |
	LDA.l DATA_FD62DC,x			;$BB892A   |
	LSR A					;$BB892E   |
	AND #$01E0				;$BB892F   |
	TSB $32					;$BB8932   |
	ASL A					;$BB8934   |
	ASL A					;$BB8935   |
	ASL A					;$BB8936   |
	ASL A					;$BB8937   |
	ASL A					;$BB8938   |
	STA $34					;$BB8939   |
	LDA.l DATA_FD62DC,x			;$BB893B   |
	LSR A					;$BB893F   |
	AND #$3C00				;$BB8940   |
	CLC					;$BB8943   |
	ADC $34					;$BB8944   |
	ORA $32					;$BB8946   |
	STA $7F9650,x				;$BB8948   |
	INX					;$BB894C   |
	INX					;$BB894D   |
	CPX #$0E8A				;$BB894E   |
	BNE CODE_BB8920				;$BB8951   |
	JSR CODE_BB895A				;$BB8953   |
	JSR CODE_BB896A				;$BB8956   |
	RTS					;$BB8959  /

CODE_BB895A:
	LDA.l DATA_FD62DC,x			;$BB895A  \
	STA $7F9650,x				;$BB895E   |
	INX					;$BB8962   |
	INX					;$BB8963   |
	CPX #$0EA8				;$BB8964   |
	BNE CODE_BB895A				;$BB8967   |
	RTS					;$BB8969  /

CODE_BB896A:
	LDA #$6318				;$BB896A  \
	STA $7F9814				;$BB896D   |
	STA $7F9904				;$BB8971   |
	RTS					;$BB8975  /

	LDX #$0000				;$BB8976   |
CODE_BB8979:					;	   |
	LDA.l DATA_FD62DC,x			;$BB8979   |
	AND #$001F				;$BB897D   |
	LSR A					;$BB8980   |
	LSR A					;$BB8981   |
	STA $32					;$BB8982   |
	LDA.l DATA_FD62DC,x			;$BB8984   |
	LSR A					;$BB8988   |
	AND #$01E0				;$BB8989   |
	TSB $32					;$BB898C   |
	ASL A					;$BB898E   |
	ASL A					;$BB898F   |
	ASL A					;$BB8990   |
	ASL A					;$BB8991   |
	ASL A					;$BB8992   |
	ORA $32					;$BB8993   |
	STA $7F9650,x				;$BB8995   |
	INX					;$BB8999   |
	INX					;$BB899A   |
	CPX #$014A				;$BB899B   |
	BNE CODE_BB8979				;$BB899E   |
CODE_BB89A0:					;	   |
	LDA.l DATA_FD62DC,x			;$BB89A0   |
	AND #$001F				;$BB89A4   |
	LSR A					;$BB89A7   |
	STA $32					;$BB89A8   |
	LDA.l DATA_FD62DC,x			;$BB89AA   |
	AND #$03E0				;$BB89AE   |
	LSR A					;$BB89B1   |
	STA $34					;$BB89B2   |
	LSR A					;$BB89B4   |
	CLC					;$BB89B5   |
	ADC $34					;$BB89B6   |
	LSR A					;$BB89B8   |
	AND #$03E0				;$BB89B9   |
	TSB $32					;$BB89BC   |
	LDA.l DATA_FD62DC,x			;$BB89BE   |
	LSR A					;$BB89C2   |
	STA $34					;$BB89C3   |
	LSR A					;$BB89C5   |
	CLC					;$BB89C6   |
	ADC $34					;$BB89C7   |
	LSR A					;$BB89C9   |
	AND #$1C00				;$BB89CA   |
	ORA $32					;$BB89CD   |
	STA $7F9650,x				;$BB89CF   |
	INX					;$BB89D3   |
	INX					;$BB89D4   |
	CPX #$0E8A				;$BB89D5   |
	BNE CODE_BB89A0				;$BB89D8   |
	JSR CODE_BB895A				;$BB89DA   |
	JSR CODE_BB896A				;$BB89DD   |
	RTS					;$BB89E0  /

	LDX #$0000				;$BB89E1   |
CODE_BB89E4:					;	   |
	LDA.l DATA_FD62DC,x			;$BB89E4   |
	AND #$001F				;$BB89E8   |
	LSR A					;$BB89EB   |
	LSR A					;$BB89EC   |
	STA $32					;$BB89ED   |
	LDA.l DATA_FD62DC,x			;$BB89EF   |
	LSR A					;$BB89F3   |
	AND #$01E0				;$BB89F4   |
	TSB $32					;$BB89F7   |
	ASL A					;$BB89F9   |
	ASL A					;$BB89FA   |
	ASL A					;$BB89FB   |
	ASL A					;$BB89FC   |
	ASL A					;$BB89FD   |
	ORA $32					;$BB89FE   |
	STA $7F9650,x				;$BB8A00   |
	INX					;$BB8A04   |
	INX					;$BB8A05   |
	CPX #$014A				;$BB8A06   |
	BNE CODE_BB89E4				;$BB8A09   |
CODE_BB8A0B:					;	   |
	LDA.l DATA_FD62DC,x			;$BB8A0B   |
	AND #$001F				;$BB8A0F   |
	LSR A					;$BB8A12   |
	STA $32					;$BB8A13   |
	LSR A					;$BB8A15   |
	LSR A					;$BB8A16   |
	CLC					;$BB8A17   |
	ADC $32					;$BB8A18   |
	ADC #$0004				;$BB8A1A   |
	STA $32					;$BB8A1D   |
	LDA.l DATA_FD62DC,x			;$BB8A1F   |
	AND #$03E0				;$BB8A23   |
	LSR A					;$BB8A26   |
	STA $34					;$BB8A27   |
	LSR A					;$BB8A29   |
	LSR A					;$BB8A2A   |
	CLC					;$BB8A2B   |
	ADC $34					;$BB8A2C   |
	CLC					;$BB8A2E   |
	ADC #$0060				;$BB8A2F   |
	AND #$03E0				;$BB8A32   |
	TSB $32					;$BB8A35   |
	LDA.l DATA_FD62DC,x			;$BB8A37   |
	AND #$7C00				;$BB8A3B   |
	LSR A					;$BB8A3E   |
	STA $34					;$BB8A3F   |
	LSR A					;$BB8A41   |
	LSR A					;$BB8A42   |
	CLC					;$BB8A43   |
	ADC $34					;$BB8A44   |
	CLC					;$BB8A46   |
	ADC #$0C00				;$BB8A47   |
	AND #$7C00				;$BB8A4A   |
	ORA $32					;$BB8A4D   |
	STA $7F9650,x				;$BB8A4F   |
	INX					;$BB8A53   |
	INX					;$BB8A54   |
	CPX #$0E8A				;$BB8A55   |
	BNE CODE_BB8A0B				;$BB8A58   |
	JSR CODE_BB895A				;$BB8A5A   |
	JSR CODE_BB896A				;$BB8A5D   |
	RTS					;$BB8A60  /

CODE_BB8A61:
	JSR CODE_BB8A69				;$BB8A61  \
	RTL					;$BB8A64  /

CODE_BB8A65:
	JSR CODE_BB8A6F				;$BB8A65  \
	RTL					;$BB8A68  /

CODE_BB8A69:
	ASL A					;$BB8A69  \
	TAX					;$BB8A6A   |
	LDA.l DATA_FD5FEE,x			;$BB8A6B   |
CODE_BB8A6F:					;	   |
	STA $05A7				;$BB8A6F   |
	LDX #$0000				;$BB8A72   |
CODE_BB8A75:					;	   |
	LDA $0B64,x				;$BB8A75   |
	BEQ CODE_BB8AA8				;$BB8A78   |
	CMP $05A7				;$BB8A7A   |
	BEQ CODE_BB8AA1				;$BB8A7D   |
CODE_BB8A7F:					;	   |
	INX					;$BB8A7F   |
	INX					;$BB8A80   |
	CPX #$0010				;$BB8A81   |
	BNE CODE_BB8A75				;$BB8A84   |
	LDA #$0002				;$BB8A86   |
	JSL throw_exception			;$BB8A89   |
	LDA $05A7				;$BB8A8D   |
	STA $05F7				;$BB8A90   |
	LDX #$0000				;$BB8A93   |
	INC $0B74,x				;$BB8A96   |
	TXA					;$BB8A99   |
	XBA					;$BB8A9A   |
	CLC					;$BB8A9B   |
	LDA #$0000				;$BB8A9C   |
	SEC					;$BB8A9F   |
	RTS					;$BB8AA0  /

CODE_BB8AA1:
	LDA $0B74,x				;$BB8AA1  \
	BMI CODE_BB8A7F				;$BB8AA4   |
	BRA CODE_BB8AC2				;$BB8AA6  /

CODE_BB8AA8:
	STX $5E					;$BB8AA8  \
	BRA CODE_BB8AB4				;$BB8AAA  /

CODE_BB8AAC:
	LDA $0B64,x				;$BB8AAC  \
	CMP $05A7				;$BB8AAF   |
	BEQ CODE_BB8ABD				;$BB8AB2   |
CODE_BB8AB4:					;	   |
	INX					;$BB8AB4   |
	INX					;$BB8AB5   |
	CPX #$0010				;$BB8AB6   |
	BNE CODE_BB8AAC				;$BB8AB9   |
	BRA CODE_BB8AF6				;$BB8ABB  /

CODE_BB8ABD:
	LDA $0B74,x				;$BB8ABD  \
	BMI CODE_BB8AB4				;$BB8AC0   |
CODE_BB8AC2:					;	   |
	INC $0B74,x				;$BB8AC2   |
	TXA					;$BB8AC5   |
	XBA					;$BB8AC6   |
	CLC					;$BB8AC7   |
	RTS					;$BB8AC8  /

	STA $05A7				;$BB8AC9   |
	LDA $12,x				;$BB8ACC   |
	XBA					;$BB8ACE   |
	AND #$000E				;$BB8ACF   |
	STA $5E					;$BB8AD2   |
	TAX					;$BB8AD4   |
	LDA $0B64,x				;$BB8AD5   |
	CMP $05A7				;$BB8AD8   |
	BEQ CODE_BB8AE3				;$BB8ADB   |
	JSR CODE_BB8AF6				;$BB8ADD   |
	DEC $0B74,x				;$BB8AE0   |
CODE_BB8AE3:					;	   |
	RTL					;$BB8AE3  /

CODE_BB8AE4:
	STA $05A7				;$BB8AE4  \
	LDA $12,x				;$BB8AE7   |
	XBA					;$BB8AE9   |
	AND #$000E				;$BB8AEA   |
	STA $5E					;$BB8AED   |
	JSR CODE_BB8AF6				;$BB8AEF   |
	DEC $0B74,x				;$BB8AF2   |
	RTL					;$BB8AF5  /

CODE_BB8AF6:
	LDA $052B				;$BB8AF6  \
	AND #$0010				;$BB8AF9   |
	BNE CODE_BB8B30				;$BB8AFC   |
	LDA $F1					;$BB8AFE   |
	ASL A					;$BB8B00   |
	ASL A					;$BB8B01   |
	TAX					;$BB8B02   |
	JSR CODE_BB8B66				;$BB8B03   |
	STA $0B24,x				;$BB8B06   |
	LDA $5E					;$BB8B09   |
	ASL A					;$BB8B0B   |
	ASL A					;$BB8B0C   |
	ASL A					;$BB8B0D   |
	CLC					;$BB8B0E   |
	ADC #$0081				;$BB8B0F   |
	XBA					;$BB8B12   |
	ORA #$00FD				;$BB8B13   |
	STA $0B26,x				;$BB8B16   |
	LDA $F1					;$BB8B19   |
	INC A					;$BB8B1B   |
	AND #$000F				;$BB8B1C   |
	STA $F1					;$BB8B1F   |
	LDX $5E					;$BB8B21   |
	INC $0B74,x				;$BB8B23   |
	LDA $05A7				;$BB8B26   |
	STA $0B64,x				;$BB8B29   |
	TXA					;$BB8B2C   |
	XBA					;$BB8B2D   |
	CLC					;$BB8B2E   |
	RTS					;$BB8B2F  /

CODE_BB8B30:
	LDA $F1					;$BB8B30  \
	ASL A					;$BB8B32   |
	ASL A					;$BB8B33   |
	TAX					;$BB8B34   |
	JSR CODE_BB8B66				;$BB8B35   |
	CLC					;$BB8B38   |
	ADC #$3374				;$BB8B39   |
	STA $0B24,x				;$BB8B3C   |
	LDA $5E					;$BB8B3F   |
	ASL A					;$BB8B41   |
	ASL A					;$BB8B42   |
	ASL A					;$BB8B43   |
	CLC					;$BB8B44   |
	ADC #$0081				;$BB8B45   |
	XBA					;$BB8B48   |
	ORA #$007F				;$BB8B49   |
	STA $0B26,x				;$BB8B4C   |
	LDA $F1					;$BB8B4F   |
	INC A					;$BB8B51   |
	AND #$000F				;$BB8B52   |
	STA $F1					;$BB8B55   |
	LDX $5E					;$BB8B57   |
	INC $0B74,x				;$BB8B59   |
	LDA $05A7				;$BB8B5C   |
	STA $0B64,x				;$BB8B5F   |
	TXA					;$BB8B62   |
	XBA					;$BB8B63   |
	CLC					;$BB8B64   |
	RTS					;$BB8B65  /

CODE_BB8B66:
	STZ $60					;$BB8B66  \
	LDA $060D				;$BB8B68   |
	CMP #$0002				;$BB8B6B   |
	BNE CODE_BB8B7C				;$BB8B6E   |
	SEC					;$BB8B70   |
	SBC $060F				;$BB8B71   |
	DEC A					;$BB8B74   |
	BNE CODE_BB8B7C				;$BB8B75   |
	LDA #$003C				;$BB8B77   |
	STA $60					;$BB8B7A   |
CODE_BB8B7C:					;	   |
	LDA $05A7				;$BB8B7C   |
	CMP #$6484				;$BB8B7F   |
	BEQ CODE_BB8B8A				;$BB8B82   |
	CMP #$6574				;$BB8B84   |
	BEQ CODE_BB8BAA				;$BB8B87   |
	RTS					;$BB8B89  /

CODE_BB8B8A:
	LDA $08A4				;$BB8B8A  \
	BEQ CODE_BB8BAF				;$BB8B8D   |
CODE_BB8B8F:					;	   |
	LDA $091C				;$BB8B8F   |
	AND #$0003				;$BB8B92   |
	BEQ CODE_BB8B9F				;$BB8B95   |
	DEC A					;$BB8B97   |
	BEQ CODE_BB8BD1				;$BB8B98   |
	DEC A					;$BB8B9A   |
	BEQ CODE_BB8BD9				;$BB8B9B   |
	BRA CODE_BB8BC2				;$BB8B9D  /

CODE_BB8B9F:
	LDA #$001E				;$BB8B9F  \
	CLC					;$BB8BA2   |
	ADC $05A7				;$BB8BA3   |
	CLC					;$BB8BA6   |
	ADC $60					;$BB8BA7   |
	RTS					;$BB8BA9  /

CODE_BB8BAA:
	LDA $08A4				;$BB8BAA  \
	BEQ CODE_BB8B8F				;$BB8BAD   |
CODE_BB8BAF:					;	   |
	LDA $091A				;$BB8BAF   |
	BMI CODE_BB8BE1				;$BB8BB2   |
	LDA $091C				;$BB8BB4   |
	AND #$0003				;$BB8BB7   |
	BEQ CODE_BB8BCA				;$BB8BBA   |
	DEC A					;$BB8BBC   |
	BEQ CODE_BB8BD1				;$BB8BBD   |
	DEC A					;$BB8BBF   |
	BEQ CODE_BB8BD9				;$BB8BC0   |
CODE_BB8BC2:					;	   |
	LDA #$00B4				;$BB8BC2   |
	CLC					;$BB8BC5   |
	ADC $05A7				;$BB8BC6   |
	RTS					;$BB8BC9  /

CODE_BB8BCA:
	LDA $05A7				;$BB8BCA  \
	CLC					;$BB8BCD   |
	ADC $60					;$BB8BCE   |
	RTS					;$BB8BD0  /

CODE_BB8BD1:
	LDA #$0078				;$BB8BD1  \
	CLC					;$BB8BD4   |
	ADC $05A7				;$BB8BD5   |
	RTS					;$BB8BD8  /

CODE_BB8BD9:
	LDA #$0096				;$BB8BD9  \
	CLC					;$BB8BDC   |
	ADC $05A7				;$BB8BDD   |
	RTS					;$BB8BE0  /

CODE_BB8BE1:
	LDA #$00D2				;$BB8BE1  \
	CLC					;$BB8BE4   |
	ADC $05A7				;$BB8BE5   |
	RTS					;$BB8BE8  /

CODE_BB8BE9:
	LDX current_sprite			;$BB8BE9  \
	LDA $56,x				;$BB8BEB   |
	DEC A					;$BB8BED   |
	ASL A					;$BB8BEE   |
	ASL A					;$BB8BEF   |
	ASL A					;$BB8BF0   |
	TAY					;$BB8BF1   |
	PHB					;$BB8BF2   |
	%pea_shift_dbr(DATA_FE0000)		;$BB8BF3   |
	PLB					;$BB8BF6   |
	PLB					;$BB8BF7   |
	LDA ($F5),y				;$BB8BF8   |
	STA $72					;$BB8BFA   |
	LDA ($F7),y				;$BB8BFC   |
	STA $74					;$BB8BFE   |
	PLB					;$BB8C00   |
	RTL					;$BB8C01  /

CODE_BB8C02:
	JSR CODE_BB8C06				;$BB8C02  \
	RTL					;$BB8C05  /

CODE_BB8C06:
	XBA					;$BB8C06  \
	AND #$000E				;$BB8C07   |
	TAX					;$BB8C0A   |
	DEC $0B74,x				;$BB8C0B   |
	BMI CODE_BB8C14				;$BB8C0E   |
	BEQ CODE_BB8C14				;$BB8C10   |
	SEC					;$BB8C12   |
	RTS					;$BB8C13  /

CODE_BB8C14:
	STZ $0B64,x				;$BB8C14  \
	CLC					;$BB8C17   |
	RTS					;$BB8C18  /

CODE_BB8C19:
	LDX $0597				;$BB8C19  \
	LDA $12,x				;$BB8C1C   |
	XBA					;$BB8C1E   |
	AND #$000E				;$BB8C1F   |
	TAX					;$BB8C22   |
	LDA $0B64,x				;$BB8C23   |
	LDX $0597				;$BB8C26   |
	JSR CODE_BB8C50				;$BB8C29   |
CODE_BB8C2C:					;	   |
	LDX $0593				;$BB8C2C   |
	LDA $12,x				;$BB8C2F   |
	XBA					;$BB8C31   |
	AND #$000E				;$BB8C32   |
	TAX					;$BB8C35   |
	LDA $0B64,x				;$BB8C36   |
	LDX $0593				;$BB8C39   |
	JSR CODE_BB8C50				;$BB8C3C   |
	RTL					;$BB8C3F  /

CODE_BB8C40:
	JSR CODE_BB8C50				;$BB8C40  \
	RTL					;$BB8C43  /

CODE_BB8C44:
	JSR CODE_BB8C48				;$BB8C44  \
	RTL					;$BB8C47  /

CODE_BB8C48:
	TXY					;$BB8C48  \
	ASL A					;$BB8C49   |
	TAX					;$BB8C4A   |
	LDA.l DATA_FD5FEE,x			;$BB8C4B   |
	TYX					;$BB8C4F   |
CODE_BB8C50:					;	   |
	TXY					;$BB8C50   |
	STA $05A7				;$BB8C51   |
	LDA $12,x				;$BB8C54   |
	XBA					;$BB8C56   |
	AND #$000E				;$BB8C57   |
	TAX					;$BB8C5A   |
	LDA $0B64,x				;$BB8C5B   |
	CMP #$6682				;$BB8C5E   |
	BNE CODE_BB8C68				;$BB8C61   |
	DEC $0B74,x				;$BB8C63   |
	BRA CODE_BB8C6E				;$BB8C66  /

CODE_BB8C68:
	LDA $0012,y				;$BB8C68  \
	JSR CODE_BB8C06				;$BB8C6B   |
CODE_BB8C6E:					;	   |
	LDA $05A7				;$BB8C6E   |
	JSR CODE_BB8A6F				;$BB8C71   |
	TYX					;$BB8C74   |
	EOR $12,x				;$BB8C75   |
	AND #$0E00				;$BB8C77   |
	EOR $12,x				;$BB8C7A   |
	STA $12,x				;$BB8C7C   |
	RTS					;$BB8C7E  /

set_PPU_registers:
	PHB					;$BB8C7F  \ Preserve current data bank
	%pea_shift_dbr(DATA_FD79E2)		;$BB8C80   |\ Change data bank to FD
	PLB					;$BB8C83   | |
	PLB					;$BB8C84   |/
	SEP #$20				;$BB8C85   |
	STA $000D70				;$BB8C87   | Store index to current VRAM setting id
	ASL A					;$BB8C8B   |\ Double the VRAM setting id for use as an index
	TAY					;$BB8C8C   |/
	LDX.w DATA_FD79E2,y			;$BB8C8D   |\ Load relative offset to register config index
	TXY					;$BB8C90   |/
.next_register					;	   |
	LDX.w DATA_FD79E2,y			;$BB8C91   |\ A value of zero terminates the table
	BEQ .return				;$BB8C94   |/
	INY					;$BB8C96   |\ Move the settings index forward two byets
	INY					;$BB8C97   |/
	STX $76					;$BB8C98   | Store the register to set
	ASL $77					;$BB8C9A   |\ Clear and test for high bit
	BCC .single_register			;$BB8C9C   |/ If the high bit is clear, then the destination is one byte
	LSR $77					;$BB8C9E   | Undo the bit test shift
	LDX $76					;$BB8CA0   | Reload masked register to set
	LDA.w DATA_FD79E2,y			;$BB8CA2   |\ Load the byte for the register and set it
	STA $00,x				;$BB8CA5   |/
	INX					;$BB8CA7   | Move to the next register
	INY					;$BB8CA8   | Increment the settings index
.single_register				;	   |
	LDA.w DATA_FD79E2,y			;$BB8CA9   |\ Load the byte for the register and set it
	STA $00,x				;$BB8CAC   |/
	INY					;$BB8CAE   | Increment the settings index
	BRA .next_register			;$BB8CAF  /

.return
	REP #$20				;$BB8CB1  \ Return to full 16 bit
	PLB					;$BB8CB3   | Restore the data bank
	RTS					;$BB8CB4  / Finished setting registers

VRAM_payload_handler:
	PHB					;$BB8CB5  \ Preserve current data bank
	%pea_shift_dbr(DATA_FD819A)		;$BB8CB6   |\ Change data bank to FD
	PLB					;$BB8CB9   | |
	PLB					;$BB8CBA   |/
	ASL A					;$BB8CBB   |\ Double the VRAM payload id an index to the relative pointer
	TAY					;$BB8CBC   |/
	LDX.w DATA_FD819A,y			;$BB8CBD   | Load relative offset to VRAM payload
.next_payload					;	   |
	SEP #$20				;$BB8CC0   |
	LDA.w DATA_FD819A,x			;$BB8CC2   |\ If the payload data is zero, we are done uploadingh
	BEQ .return				;$BB8CC5   |/
	LDA.w DATA_FD819E,x			;$BB8CC7   |\ If the payload data is negative handle compressed data
	BMI .compressed_payload			;$BB8CCA   |/
	REP #$20				;$BB8CCC   |
	BRL .static_payload			;$BB8CCE  / Otherwise handle static data

.raw_pointer_payload
	SEP #$20				;$BB8CD1   |\ Dead code as far as I can tell, but here is what it could do
	LDA.w DATA_FD819A,x			;$BB8CD3   | |\ Set the DMA source bank
	STA.l DMA[0].source_bank		;$BB8CD6   | |/
	REP #$20				;$BB8CDA   | |
	LDA.w DATA_FD819B,x			;$BB8CDC   | |\ Set the DMA source word
	STA.l DMA[0].source			;$BB8CDF   | |/
	LDA.w DATA_FD819D,x			;$BB8CE3   | |\ Set the VRAM address
	STA.l PPU.vram_address			;$BB8CE6   | |/
	SEP #$20				;$BB8CEA   |/ Basically this code would set up a raw DMA source payload
.DMA_payload					;	   |
	LDA.w DATA_FD819F,x			;$BB8CEC   |\ Load and set DMA size
	STA.l DMA[0].size_low			;$BB8CEF   | |
	LDA.w DATA_FD81A0,x			;$BB8CF3   | |
	STA.l DMA[0].size_high			;$BB8CF6   |/
	LDA #$18				;$BB8CFA   |\ Set the DMA destination to $2118
	STA.l DMA[0].destination		;$BB8CFC   |/
	LDA #$01				;$BB8D00   |\ Set DMA transfer mode 01 (two registers, write once)
	STA.l DMA[0].control			;$BB8D02   |/
	STA.l CPU.enable_dma			;$BB8D06   | Enable channel 1 DMA
	REP #$20				;$BB8D0A   |
	TXA					;$BB8D0C   |\ Add 7 bytes to the payload index to bypass DMA/VRAM settings
	CLC					;$BB8D0D   | |
	ADC #$0007				;$BB8D0E   | |
	TAX					;$BB8D11   |/
	BRA .next_payload			;$BB8D12  / Go to the next payload chunk

.return
	REP #$20				;$BB8D14  \
	PLB					;$BB8D16   | Restore the data bank
	RTS					;$BB8D17  / Done uploading VRAM data

.compressed_payload
	REP #$20				;$BB8D18  \
	LDY.w DATA_FD819B,x			;$BB8D1A   |\ Load pointer to data to decompress
	LDA.w DATA_FD819A,x			;$BB8D1D   |/
	AND #$00FF				;$BB8D20   |
	PHX					;$BB8D23   | Preserve the payload index
	TYX					;$BB8D24   | Move pointer word to X
	TAY					;$BB8D25   | Move pointer bank to Y
	PHB					;$BB8D26   |\ Push current data bank and change data bank to BB
	PHK					;$BB8D27   | |
	PLB					;$BB8D28   |/
	JSL decompress_data_default		;$BB8D29   | Decompress the data
	PLB					;$BB8D2D   | Restore the data bank
	PLX					;$BB8D2E   | Restore the payload index
	SEP #$20				;$BB8D2F   |
	LDA.w DATA_FD819D,x			;$BB8D31   |\ Load and set the VRAM address (masks off top bit)
	STA.l PPU.vram_address			;$BB8D34   | |
	LDA.w DATA_FD819E,x			;$BB8D38   | |
	AND #$7F				;$BB8D3B   | |
	STA.l PPU.vram_address_high		;$BB8D3D   |/
	LDA #$7F				;$BB8D41   |\ Set DMA source to $7F0000
	STA.l DMA[0].source_bank		;$BB8D43   | |
	REP #$20				;$BB8D47   | |
	LDA #$0000				;$BB8D49   | |
	STA.l DMA[0].source			;$BB8D4C   |/
	SEP #$20				;$BB8D50   |
	BRA .DMA_payload			;$BB8D52  / Launch the DMA to VRAM

.static_payload
	SEP #$20				;$BB8D54  \
	LDA.w DATA_FD819A,x			;$BB8D56   |\ Get and set the bank of the source pointer
	STA $28					;$BB8D59   |/
	LDA #$7F				;$BB8D5B   |\ Set DMA source bank to 7F
	STA.l DMA[0].source_bank		;$BB8D5D   |/
	REP #$20				;$BB8D61   |
	LDA #$0000				;$BB8D63   |\ Set DMA source word to 0000
	STA.l DMA[0].source			;$BB8D66   |/ (Full source becomes $7F0000)
	LDA.w DATA_FD819B,x			;$BB8D6A   |\ Get and set the word portion of the source pointer
	STA $26					;$BB8D6D   |/
	LDA.w DATA_FD819D,x			;$BB8D6F   |\ Get and set the VRAM destination address
	STA.l PPU.vram_address			;$BB8D72   |/
	PHX					;$BB8D76   | Preserve the payload index
	LDA.w DATA_FD819F,x			;$BB8D77   | Load the number of bytes to copy
	INC A					;$BB8D7A   |\ Ensure an even number of bytes to copy
	AND #$FFFE				;$BB8D7B   |/
	TAY					;$BB8D7E   |\ X and Y mirror for using different addressing mods
	TAX					;$BB8D7F   |/
.next_byte					;	   |
	LDA [$26],y				;$BB8D80   |\ Copy two bytes from source to destination
	STA $7F0000,x				;$BB8D82   |/
	DEY					;$BB8D86   |\ Count down two bytes
	DEY					;$BB8D87   | |
	TYX					;$BB8D88   |/
	BPL .next_byte				;$BB8D89   | Continue until there are no remaining bytes
	PLX					;$BB8D8B   | Restore the payload index
	SEP #$20				;$BB8D8C   |
	BRL .DMA_payload			;$BB8D8E  / Launch the DMA to VRAM

;$38  -- destination
;$34 -- source
;$32 -- run dma after upload (always #$FFFF so never)
;The follow two tables map to the opposite intended nibbles.
;$42 -- index >> 4  (look up table pointer, set low byte and read for value)
	;  This table allow direct indexing of low nibbles
;$46 -- (index & 0x0F) << 4 (look up table pointer, set low byte and read for value)
	;  This table allow direct indexing of high nibbles
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
	STA $38					;$BB8D91  \ Set decompression parameters
	LDA #$007F				;$BB8D93   |
	STA $3A					;$BB8D96   | Bank 7F + address from A
	STX $34					;$BB8D98   | Source from X
	STY $36					;$BB8D9A   |
	BRA start_decompression			;$BB8D9C  /
					;
decompress_data_default:			;	  \
	TXA					;$BB8D9E   |\ Set decompression parameters
	TYX					;$BB8D9F   | |
	STA $34					;$BB8DA0   | |
	STX $36					;$BB8DA2   | |
	LDA #$0000				;$BB8DA4   | | Default destination $7F0000
	STA $38					;$BB8DA7   | |
	LDA #$007F				;$BB8DA9   | |
	STA $3A					;$BB8DAC   |/
start_decompression:				;	   |
	LDA #$FFFF				;$BB8DAE   |\ Disble auto DMA of data
	STA $32					;$BB8DB1   |/
	PHB					;$BB8DB3   |\ Preserve call bank/Y
	PHY					;$BB8DB4   |/
	LDA #$2100				;$BB8DB5   |\ Setup pointers to nibble look up tables
	STA $46					;$BB8DB8   | |
	LDA #$007E				;$BB8DBA   | |
	STA $48					;$BB8DBD   | |
	STA $44					;$BB8DBF   | |
	LDA #$2000				;$BB8DC1   | |
	STA $42					;$BB8DC4   |/
	JSL build_decompression_lookup		;$BB8DC6   | Generate nibble offset table at RAM $7E2000
	LDX $38					;$BB8DCA   | Load the decompression index
	LDY #$0001				;$BB8DCC   | Load the compression index
	LDA #$8001				;$BB8DCF   |\ Load default decompression function A 8001
	STA $4E					;$BB8DD2   |/ The high byte will never change.
	LDA #$8040				;$BB8DD4   |\ Load default decompression function B 8040
	STA $4A					;$BB8DD7   |/
	SEP #$20				;$BB8DD9   |
	LDA $3A					;$BB8DDB   |\ Set the data bank to the destination bank
	PHA					;$BB8DDD   | |
	PLB					;$BB8DDE   |/
	LDA [$34],y				;$BB8DDF   |\ Read fill byte 1
	STA $52					;$BB8DE1   | |
	INY					;$BB8DE3   |/
	LDA [$34],y				;$BB8DE4   |\ Read fill byte 2
	STA $53					;$BB8DE6   | |
	INY					;$BB8DE8   |/
	LDA [$34],y				;$BB8DE9   |\ Read direct byte 1
	STA $56					;$BB8DEB   | |
	INY					;$BB8DED   |/
	LDA [$34],y				;$BB8DEE   |\ Read direct byte 2
	STA $57					;$BB8DF0   | |
	INY					;$BB8DF2   |/
	REP #$20				;$BB8DF3   |\ Read direct word
	LDA [$34],y				;$BB8DF5   | |
	STA $54					;$BB8DF7   |/
	LDY #$0027				;$BB8DF9   | Skip to compressed byte #$27
	STZ $3C					;$BB8DFC   |\ Clear generic operand 1
	STZ $3E					;$BB8DFE   |/ Clean generic operand 2
	SEP #$20				;$BB8E00   | Return to 8 bit
execute_command_set_1:				;	   |
	LDA [$34],y				;$BB8E02   |\ Read the first command byte
	INY					;$BB8E04   | |
	STA $46					;$BB8E05   |/
	AND #$F0				;$BB8E07   |\ Command = (byte & 0xF0) >> 2
	LSR A					;$BB8E09   | | Range $00-$3C
	LSR A					;$BB8E0A   | |
	STA $4E					;$BB8E0B   |/
	PEI ($4E)				;$BB8E0D   | Push command address onto the stack
	RTS					;$BB8E0F  / Return to execute command
					;
execute_command_set_2_wide:		;
	LDA $46					;$BB8E10  \ Read next command byte
	AND #$0F				;$BB8E12   |\ Command = (byte & 0xF0) >> 2
	ASL A					;$BB8E14   | | Range $3F-$7B
	ASL A					;$BB8E15   | |
	ADC #$3F				;$BB8E16   |/
	STA $4A					;$BB8E18   |
	PEI ($4A)				;$BB8E1A   | Push command address onto the stack
	RTS					;$BB8E1C  / Return to execute command
					;
execute_command_set_2:			;
	LDA $42					;$BB8E1D  \ Read next command byte
	AND #$0F				;$BB8E1F   |\ Command = (byte & 0xF0) >> 2
	ASL A					;$BB8E21   | | Range $3F-$7B
	ASL A					;$BB8E22   | |
	ADC #$3F				;$BB8E23   | |
	STA $4A					;$BB8E25   |/
	PEI ($4A)				;$BB8E27   | Push command address onto the stack
	RTS					;$BB8E29  / Return to execute command
					;
copy_or_return_1:				;	  \
	LDA $46					;$BB8E2A   |\ Read number of bytes to copy
	AND #$0F				;$BB8E2C   | |
	BEQ finalize_decompression		;$BB8E2E   |/ If zero bytes, conclude decompression
	STA $3C					;$BB8E30   | Store number of bytes to copy
.copy_byte					;	   |
	LDA [$34],y				;$BB8E32   |\ Direct copy of up to 16 bytes
	INY					;$BB8E34   | |
	STA $0000,x				;$BB8E35   | |
	INX					;$BB8E38   | |
	DEC $3C					;$BB8E39   | |
	BNE .copy_byte				;$BB8E3B   |/
	JMP execute_command_set_1		;$BB8E3D  / Read new command
						;
finalize_decompression:				;	  \
	REP #$20				;$BB8E40   |\ Restore 16 bit A, data bank and Y
	PLY					;$BB8E42   | |
	PLB					;$BB8E43   |/
	TXA					;$BB8E44   |\ Calculate the number of decompressed bytes (stored in X)
	SEC					;$BB8E45   | | X = X - destination (Where X as an operand is the destination offset)
	SBC $38					;$BB8E46   | |
	TAX					;$BB8E48   |/
	LDA $32					;$BB8E49   |\ Check if DMA should run
	BMI .skip_DMA				;$BB8E4B   |/
	LDA $58					;$BB8E4D   |\ This would be a be a DMA to VRAM
	STA PPU.vram_address			;$BB8E4F   | | However $32 is a constant and will always be skipped (0xFFFF)
	LDA $38					;$BB8E52   | |
	STA DMA[0].source			;$BB8E54   | |
	LDA $3A					;$BB8E57   | |
	STA DMA[0].source_bank			;$BB8E59   | |
	STX DMA[0].size				;$BB8E5C   | |
	LDA #$1801				;$BB8E5F   | |
	STA DMA[0].settings			;$BB8E62   | |
	SEP #$20				;$BB8E65   | |
	LDA #$01				;$BB8E67   | |
	STA CPU.enable_dma			;$BB8E69   | |
	REP #$20				;$BB8E6C   |/
.skip_DMA					;	   |
	RTL					;$BB8E6E  / Done with decompression
						;
copy_or_return_2:				;	  \
	LDA [$34],y				;$BB8E6F   |\ Load next operand
	INY					;$BB8E71   |/
	STA $42					;$BB8E72   |\ Store in nibble lookup tables
	STA $46					;$BB8E74   |/
	LDA [$42]				;$BB8E76   |\ Load number of bytes to write
	BEQ finalize_decompression		;$BB8E78   | | If zero bytes, conclude decompression
	STA $3C					;$BB8E7A   |/ Store number of bytes to write
.copy_byte					;	   |
	LDA [$46]				;$BB8E7C   |\ operand2 = high byte
	STA $3E					;$BB8E7E   |/
	LDA [$34],y				;$BB8E80   |\ Load next operand
	INY					;$BB8E82   |/
	STA $42					;$BB8E83   |\ Store in nibble lookup tables
	STA $46					;$BB8E85   |/
	LDA $3E					;$BB8E87   | Load operand2
	ORA [$42]				;$BB8E89   |\ write operand2 | low nibble
	STA $0000,x				;$BB8E8B   |/
	INX					;$BB8E8E   |\ Continue until no there are no more bytes
	DEC $3C					;$BB8E8F   | |
	BNE .copy_byte				;$BB8E91   |/
	JMP execute_command_set_2_wide		;$BB8E93  / Run next command
						;
stream_byte_1:					;	  \
	LDA [$46]				;$BB8E96   |\ Load operand high nibble
	STA $3E					;$BB8E98   |/
	LDA [$34],y				;$BB8E9A   |\ Load next operand
	INY					;$BB8E9C   | |
	STA $42					;$BB8E9D   |/
	LDA $3E					;$BB8E9F   | Load operand high nibble
	ORA [$42]				;$BB8EA1   |\ write high nibble | low nibble
	STA $0000,x				;$BB8EA3   | |
	INX					;$BB8EA6   |/
	JMP execute_command_set_2		;$BB8EA7  / Run next command
						;
stream_byte_2:					;	  \
	LDA [$34],y				;$BB8EAA   |\ Copy one byte from the compression stream
	INY					;$BB8EAC   | |
	STA $0000,x				;$BB8EAD   | |
	INX					;$BB8EB0   |/
	JMP execute_command_set_1		;$BB8EB1  / Run next command
						;
stream_word_1:					;	  \
	LDA [$46]				;$BB8EB4   |\ Load operand high nibble into operand2
	STA $3E					;$BB8EB6   |/
	LDA [$34],y				;$BB8EB8   |\ Load next operand
	INY					;$BB8EBA   |/
	STA $42					;$BB8EBB   |\ Store in nibble lookup tables
	STA $46					;$BB8EBD   |/
	LDA $3E					;$BB8EBF   | Load operand2
	ORA [$42]				;$BB8EC1   |\  write operand2 | low nibble
	STA $0000,x				;$BB8EC3   | |
	INX					;$BB8EC6   |/
	LDA [$46]				;$BB8EC7   |\ Load operand high nibble into operand2
	STA $3E					;$BB8EC9   |/
	LDA [$34],y				;$BB8ECB   |\ Load next operand
	INY					;$BB8ECD   |/
	STA $42					;$BB8ECE   | Store in low nibble lookup table
	LDA $3E					;$BB8ED0   | Load operand2
	ORA [$42]				;$BB8ED2   |\  write operand2 | low nibble
	STA $0000,x				;$BB8ED4   | |
	INX					;$BB8ED7   |/
	JMP execute_command_set_2		;$BB8ED8  / Run next command
						;
stream_word_2:					;	  \
	REP #$20				;$BB8EDB   |\ Copy one word from the compression stream
	LDA [$34],y				;$BB8EDD   | |
	STA $0000,x				;$BB8EDF   | |
	INY					;$BB8EE2   | |
	INY					;$BB8EE3   | |
	INX					;$BB8EE4   | |
	INX					;$BB8EE5   | |
	SEP #$20				;$BB8EE6   |/
	JMP execute_command_set_1		;$BB8EE8  / Run next command
						;
stream_byte_fill_1:				;	  \
	LDA $46					;$BB8EEB   |\ Load operand
	AND #$0F				;$BB8EED   | | Count = operand & 0x0F + 3
	ADC #$03				;$BB8EEF   | |
	STA $3C					;$BB8EF1   |/
	LDA [$34],y				;$BB8EF3   |\  Load fill byte
	INY					;$BB8EF5   |/
.fill_byte					;	   |
	STA $0000,x				;$BB8EF6   |\ Store and repeat with fill byte.
	INX					;$BB8EF9   | |
	DEC $3C					;$BB8EFA   | |
	BNE .fill_byte				;$BB8EFC   |/
	JMP execute_command_set_1		;$BB8EFE  / Run next command
						;
stream_byte_fill_2:				;	  \
	LDA [$34],y				;$BB8F01   |\ Load next operand
	INY					;$BB8F03   |/
	STA $42					;$BB8F04   |\ Store in nibble lookup tables
	STA $46					;$BB8F06   |/
	LDA [$42]				;$BB8F08   |\ Count = low nibble + 3
	ADC #$03				;$BB8F0A   | |
	STA $3C					;$BB8F0C   |/
	LDA [$46]				;$BB8F0E   |\ Operand2 = high nibble
	STA $3E					;$BB8F10   |/
	LDA [$34],y				;$BB8F12   |\ Load next operand
	INY					;$BB8F14   | |
	STA $42					;$BB8F15   |/ Store low nibble look up
	LDA $3E					;$BB8F17   |\ Load operand2
	ORA [$42]				;$BB8F19   |/ fill byte =  operand2 | low nibble
.fill_byte					;	   |
	STA $0000,x				;$BB8F1B   |\ Store and repeat with fill byte.
	INX					;$BB8F1E   | |
	DEC $3C					;$BB8F1F   | |
	BNE .fill_byte				;$BB8F21   |/
	JMP execute_command_set_2		;$BB8F23  / Run next command
						;
direct_byte_1_fill_1:				;	  \
	LDA $46					;$BB8F26   |\ Load operand
	AND #$0F				;$BB8F28   | | Count = operand & 0x0F + 3
	ADC #$03				;$BB8F2A   | |
	STA $3C					;$BB8F2C   |/
	LDA $52					;$BB8F2E   | Load fill byte 1
.fill_byte					;	   |
	STA $0000,x				;$BB8F30   |\ Store and repeat with fill byte.
	INX					;$BB8F33   | |
	DEC $3C					;$BB8F34   | |
	BNE .fill_byte				;$BB8F36   |/
	JMP execute_command_set_1		;$BB8F38  / Run next command
						;
direct_byte_1_fill_2:				;	  \
	LDA [$34],y				;$BB8F3B   |\ Load next operand
	INY					;$BB8F3D   | |
	STA $42					;$BB8F3E   |/ Store in low nibble lookup
	LDA [$42]				;$BB8F40   |\ Count = low nibble + 3
	ADC #$03				;$BB8F42   | |
	STA $3C					;$BB8F44   |/
	LDA $52					;$BB8F46   | Load fill byte 1
.fill_byte					;	   |
	STA $0000,x				;$BB8F48   |\ Store and repeat with fill byte.
	INX					;$BB8F4B   | |
	DEC $3C					;$BB8F4C   | |
	BNE .fill_byte				;$BB8F4E   |/
	JMP execute_command_set_2		;$BB8F50  / Run next command
						;
direct_byte_2_fill_1:				;	  \
	LDA $46					;$BB8F53   |\  Load operand
	AND #$0F				;$BB8F55   | | Count = (operand & 0x0F) + 3
	ADC #$03				;$BB8F57   | |
	STA $3C					;$BB8F59   |/
	LDA $53					;$BB8F5B   | Load fill byte 2
.fill_byte					;	   |
	STA $0000,x				;$BB8F5D   |\ Store and repeat with fill byte.
	INX					;$BB8F60   | |
	DEC $3C					;$BB8F61   | |
	BNE .fill_byte				;$BB8F63   |/
	JMP execute_command_set_1		;$BB8F65  / Run next command
						;
direct_byte_2_fill_2:				;	  \
	LDA [$34],y				;$BB8F68   |\ Load next operand
	INY					;$BB8F6A   | |
	STA $42					;$BB8F6B   |/ Store in low nibble lookup
	LDA [$42]				;$BB8F6D   |\ Count = low nibble + 3
	ADC #$03				;$BB8F6F   | |
	STA $3C					;$BB8F71   |/
	LDA $53					;$BB8F73   | Load fill byte 2
.fill_byte					;	   |
	STA $0000,x				;$BB8F75   |\ Store and repeat with fill byte.
	INX					;$BB8F78   | |
	DEC $3C					;$BB8F79   | |
	BNE .fill_byte				;$BB8F7B   |/
	JMP execute_command_set_2		;$BB8F7D  / Run next command
						;
direct_word_put_1:				;	  \
	REP #$20				;$BB8F80   |\ Store direct word
	LDA $54					;$BB8F82   | |
	STA $0000,x				;$BB8F84   | |
	INX					;$BB8F87   | |
	INX					;$BB8F88   | |
	SEP #$20				;$BB8F89   |/
	JMP execute_command_set_2_wide		;$BB8F8B  / Run next command
						;
direct_word_put_2:				;	  \
	REP #$20				;$BB8F8E   |\ Store direct word
	LDA $54					;$BB8F90   | |
	STA $0000,x				;$BB8F92   | |
	INX					;$BB8F95   | |
	INX					;$BB8F96   | |
	SEP #$20				;$BB8F97   |/
	JMP execute_command_set_1		;$BB8F99  / Run next command
						;
direct_byte_1_put_1:				;	  \
	LDA $56					;$BB8F9C   |\ Store direct byte 1
	STA $0000,x				;$BB8F9E   | |
	INX					;$BB8FA1   |/
	JMP execute_command_set_2_wide		;$BB8FA2  / Run next command
						;
direct_byte_1_put_2:				;	  \
	LDA $56					;$BB8FA5   |\ Store direct byte 1
	STA $0000,x				;$BB8FA7   | |
	INX					;$BB8FAA   |/
	JMP execute_command_set_1		;$BB8FAB  / Run next command
						;
direct_byte_2_put_1:				;	  \
	LDA $57					;$BB8FAE   |\ Store direct byte 2
	STA $0000,x				;$BB8FB0   | |
	INX					;$BB8FB3   |/
	JMP execute_command_set_2_wide		;$BB8FB4  / Run next command
						;
direct_byte_2_put_2:				;	  \
	LDA $57					;$BB8FB7   |\ Store direct byte 2
	STA $0000,x				;$BB8FB9   | |
	INX					;$BB8FBC   |/
	JMP execute_command_set_1		;$BB8FBD  / Run next command
						;
back_copy_word_1:				;
	PHY					;$BB8FC0  \ Preserve compression index
	LDA $46					;$BB8FC1   | Load operand
	AND #$0F				;$BB8FC3   |\  Offset = (operand & 0x0F) + 2
	ADC #$02				;$BB8FC5   | |
	STA $3E					;$BB8FC7   |/
	REP #$20				;$BB8FC9   |\ Prepare to copy (1 word) from a previous point in decompressed data
	TXA					;$BB8FCB   | | The new offset is stored in Y
	SEC					;$BB8FCC   | | Y = X - offset
	SBC $3E					;$BB8FCD   | |
	TAY					;$BB8FCF   |/
	LDA $0000,y				;$BB8FD0   |\ Copy from previous data
	STA $0000,x				;$BB8FD3   | |
	INX					;$BB8FD6   | |
	INX					;$BB8FD7   |/
	SEP #$20				;$BB8FD8   | Return to 8 bit A
	PLY					;$BB8FDA   | Restore compression index
	JMP execute_command_set_1		;$BB8FDB  / Run next command
						;
back_copy_word_2:				;	  \
	LDA [$34],y				;$BB8FDE   |\ Load next operand
	INY					;$BB8FE0   | |
	STA $42					;$BB8FE1   |/
	LDA [$42]				;$BB8FE3   |\  Offset = low nibble + 2
	ADC #$02				;$BB8FE5   | |
	STA $3E					;$BB8FE7   |/
	PHY					;$BB8FE9   | Preserve compression index
	REP #$20				;$BB8FEA   |\ Prepare to copy (1 word) from a previous point in decompressed data
	TXA					;$BB8FEC   | | The new offset is stored in Y
	SEC					;$BB8FED   | | Y = X - offset
	SBC $3E					;$BB8FEE   | |
	TAY					;$BB8FF0   |/
	LDA $0000,y				;$BB8FF1   |\ Copy from previous data
	STA $0000,x				;$BB8FF4   | |
	INX					;$BB8FF7   | |
	INX					;$BB8FF8   |/
	SEP #$20				;$BB8FF9   | Return to 8 bit A
	PLY					;$BB8FFB   | Restore compression index
	JMP execute_command_set_2		;$BB8FFC  / Run next command
						;
back_copy_1:					;
	LDA $46					;$BB8FFF  \ Load next operand
	AND #$0F				;$BB9001   |\  Count = (operand & 0x0F) + 3
	ADC #$03				;$BB9003   | |
	STA $3C					;$BB9005   |/
	LDA [$34],y				;$BB9007   |\ Load next operand
	STA $3E					;$BB9009   | |
	INY					;$BB900B   |/
	PHY					;$BB900C   | Preserve compression index
	REP #$20				;$BB900D   |\ Prepare to copy from a previous point in decompressed data
	TXA					;$BB900F   | | The new offset is stored in Y
	SEC					;$BB9010   | | Y = X - count - offset
	SBC $3C					;$BB9011   | |
	SEC					;$BB9013   | |
	SBC $3E					;$BB9014   | |
	TAY					;$BB9016   |/
	SEP #$20				;$BB9017   | Back to 8 bit A
.byte_copy					;	   |
	LDA $0000,y				;$BB9019   |\ Copy from previous data
	INY					;$BB901C   | |
	STA $0000,x				;$BB901D   | |
	INX					;$BB9020   |/
	DEC $3C					;$BB9021   |\ Copy count number of bytes
	BNE .byte_copy				;$BB9023   |/
	PLY					;$BB9025   | Restore compression index
	JMP execute_command_set_1		;$BB9026  / Run next command
						;
back_copy_2:					;	  \
	LDA [$34],y				;$BB9029   |\ Load next operand
	INY					;$BB902B   |/
	STA $42					;$BB902C   |\ Store in nibble look up tables
	STA $46					;$BB902E   |/
	LDA [$42]				;$BB9030   |\ Count = low nibble + 3
	ADC #$03				;$BB9032   | |
	STA $3C					;$BB9034   |/
	LDA [$46]				;$BB9036   |\ Store high nibble in offset
	STA $3E					;$BB9038   |/
	LDA [$34],y				;$BB903A   |\ Load next operand and store in the low nibble lookup
	INY					;$BB903C   | |
	STA $42					;$BB903D   |/
	LDA [$42]				;$BB903F   |\ offset = low nibble | offset
	ORA $3E					;$BB9041   | |
	STA $3E					;$BB9043   |/
	PHY					;$BB9045   | Preserve compression index
	REP #$20				;$BB9046   |\ Prepare to copy from a previous point in decompressed data
	TXA					;$BB9048   | | The new offset is stored in Y
	SEC					;$BB9049   | | Y = X - count - offset
	SBC $3C					;$BB904A   | |
	SEC					;$BB904C   | |
	SBC $3E					;$BB904D   | |
	TAY					;$BB904F   |/
	SEP #$20				;$BB9050   | Back to 8 bit A
.byte_copy					;	   |
	LDA $0000,y				;$BB9052   |\ Copy from previous data
	INY					;$BB9055   | |
	STA $0000,x				;$BB9056   | |
	INX					;$BB9059   |/
	DEC $3C					;$BB905A   |\ Copy count number of bytes
	BNE .byte_copy				;$BB905C   |/
	PLY					;$BB905E   | Restore compression index
	JMP execute_command_set_2		;$BB905F  / Run next command
						;
back_copy_far_1:				;
	LDA $46					;$BB9062  \ Load next operand
	AND #$0F				;$BB9064   |\  Count = (operand & 0x0F) + 3
	ADC #$03				;$BB9066   | |
	STA $3C					;$BB9068   |/
	LDA [$34],y				;$BB906A   |\ Load next operand
	INY					;$BB906C   | |
	XBA					;$BB906D   |/ Store as high byte for the full operand
	LDA [$34],y				;$BB906E   |\ Load next operand store in high byte look up
	INY					;$BB9070   | |
	STA $46					;$BB9071   |/
	REP #$20				;$BB9073   | Switch to 16 bit A
	LSR A					;$BB9075   |\ Offset = (operand >> 4) + 0x0103
	LSR A					;$BB9076   | |
	LSR A					;$BB9077   | |
	LSR A					;$BB9078   | |
	CLC					;$BB9079   | |
	ADC #$0103				;$BB907A   | |
	STA $40					;$BB907D   |/
	PHY					;$BB907F   | Preserve compression index
	TXA					;$BB9080   |\ Prepare to copy from a previous point in decompressed data
	SEC					;$BB9081   | | Y = X - offset
	SBC $40					;$BB9082   | |
	TAY					;$BB9084   |/
	SEP #$20				;$BB9085   | Back to 8 bit A
.byte_copy					;	   |
	LDA $0000,y				;$BB9087   |\ Copy from previous data
	INY					;$BB908A   | |
	STA $0000,x				;$BB908B   | |
	INX					;$BB908E   |/
	DEC $3C					;$BB908F   |\ Copy count number of bytes
	BNE .byte_copy				;$BB9091   |/
	PLY					;$BB9093   | Restore compression index
	JMP execute_command_set_2_wide		;$BB9094  / Run next command
						;
back_copy_far_2:				;	  \
	LDA [$34],y				;$BB9097   |\ Load next operand
	INY					;$BB9099   | |
	STA $42					;$BB909A   |/ Store in low nibble look up table
	LDA [$42]				;$BB909C   |\ Count = low nibble + 3
	ADC #$03				;$BB909E   | |
	STA $3C					;$BB90A0   |/
	LDA $42					;$BB90A2   |\ Copy the low nibble to the operand high byte
	AND #$0F				;$BB90A4   | |
	XBA					;$BB90A6   |/
	LDA [$34],y				;$BB90A7   |\ Load the operand low byte
	INY					;$BB90A9   |/
	REP #$20				;$BB90AA   |\ Offset = operand + 0x0103
	ADC #$0103				;$BB90AC   | |
	STA $40					;$BB90AF   |/
	PHY					;$BB90B1   | Preserve compression index
	TXA					;$BB90B2   |\ Prepare to copy from a previous point in decompressed data
	SEC					;$BB90B3   | | Y = X - offset
	SBC $40					;$BB90B4   | |
	TAY					;$BB90B6   |/
	SEP #$20				;$BB90B7   | Back to 8 bit A
.byte_copy					;	   |
	LDA $0000,y				;$BB90B9   |\ Copy from previous data
	INY					;$BB90BC   | |
	STA $0000,x				;$BB90BD   | |
	INX					;$BB90C0   |/
	DEC $3C					;$BB90C1   |\ Copy count number of bytes
	BNE .byte_copy				;$BB90C3   |/
	PLY					;$BB90C5   | Restore compression index
	JMP execute_command_set_1		;$BB90C6  / Run next command
						;
back_copy_arbitrary_1:				;
	LDA $46					;$BB90C9  \ Load next operand
	AND #$0F				;$BB90CB   |\  Count = (operand & 0x0F) + 3
	ADC #$03				;$BB90CD   | |
	STA $3C					;$BB90CF   |/
	REP #$20				;$BB90D1   |\ Read a big endian word for the offset
	LDA [$34],y				;$BB90D3   | |
	XBA					;$BB90D5   | |
	STA $40					;$BB90D6   |/
	INY					;$BB90D8   |\ Increment the compression index
	INY					;$BB90D9   |/
	PHY					;$BB90DA   | Preserve compression index
	TXA					;$BB90DB   |\ Prepare to copy from a previous point in decompressed data
	SEC					;$BB90DC   | | Y = X - offset
	SBC $40					;$BB90DD   | |
	TAY					;$BB90DF   |/
	SEP #$20				;$BB90E0   | Back to 8 bit A
.byte_copy					;	   |
	LDA $0000,y				;$BB90E2   |\ Copy from previous data
	INY					;$BB90E5   | |
	STA $0000,x				;$BB90E6   | |
	INX					;$BB90E9   |/
	DEC $3C					;$BB90EA   |\ Copy count number of bytes
	BNE .byte_copy				;$BB90EC   |/
	PLY					;$BB90EE   | Restore compression index
	JMP execute_command_set_1		;$BB90EF  / Run next command
						;
back_copy_arbitrary_2:				;	  \
	LDA [$34],y				;$BB90F2   |\ Load next operand
	INY					;$BB90F4   | |
	STA $42					;$BB90F5   |/ Store in low nibble look up table
	LDA [$42]				;$BB90F7   |\ Count = low nibble + 3
	ADC #$03				;$BB90F9   | |
	STA $3C					;$BB90FB   |/
	LDA $42					;$BB90FD   |\ Copy as the operand high byte
	XBA					;$BB90FF   |/
	LDA [$34],y				;$BB9100   |\ Load the operand low byte
	INY					;$BB9102   |/
	REP #$20				;$BB9103   | Set A to 16 bit
	ASL A					;$BB9105   |\ Offset = (operand << 4)
	ASL A					;$BB9106   | |
	ASL A					;$BB9107   | |
	ASL A					;$BB9108   | |
	STA $40					;$BB9109   |/
	AND #$00FF				;$BB910B   | Clear the high byte of the offset
	SEP #$20				;$BB910E   | Resume 8 bit A
	LDA [$34],y				;$BB9110   |\ Load next operand
	INY					;$BB9112   |/
	PHY					;$BB9113   | Preserve compression index
	STA $42					;$BB9114   | Store the operand in the low nibble look up table
	LDA [$42]				;$BB9116   |\ Load low nibble
	REP #$20				;$BB9118   | |
	AND #$000F				;$BB911A   |/
	ORA $40					;$BB911D   |\ offset = offset | low nibble
	STA $40					;$BB911F   |/
	TXA					;$BB9121   |\ Prepare to copy from a previous point in decompressed data
	SEC					;$BB9122   | | Y = X - offset
	SBC $40					;$BB9123   | |
	TAY					;$BB9125   |/
	SEP #$20				;$BB9126   | Back to 8 bit A
.copy_byte					;	   |
	LDA $0000,y				;$BB9128   |\ Copy from previous data
	INY					;$BB912B   | |
	STA $0000,x				;$BB912C   | |
	INX					;$BB912F   |/
	DEC $3C					;$BB9130   |\ Copy count number of bytes
	BNE .copy_byte				;$BB9132   |/
	PLY					;$BB9134   | Restore compression index
	JMP execute_command_set_2		;$BB9135  / Run next command Run next command
						;
duplicate_byte_1:				;	  \
	DEX					;$BB9138   |\ Copy previous byte to the decompression stream
	LDA $0000,x				;$BB9139   | |
	STA $0001,x				;$BB913C   | |
	INX					;$BB913F   | |
	INX					;$BB9140   |/
	JMP execute_command_set_2_wide		;$BB9141  / Run next command
						;
duplicate_byte_2:				;	  \
	DEX					;$BB9144   |\ Copy previous byte to the decompression stream
	LDA $0000,x				;$BB9145   | |
	STA $0001,x				;$BB9148   | |
	INX					;$BB914B   | |
	INX					;$BB914C   |/
	JMP execute_command_set_1		;$BB914D  / Run next command
						;
duplicate_word_1:				;	  \
	REP #$20				;$BB9150   |\ Copy the previous word to the decompression stream
	DEX					;$BB9152   | |
	DEX					;$BB9153   | | First go back two bytes
	LDA $0000,x				;$BB9154   | |
	STA $0002,x				;$BB9157   | |
	SEP #$20				;$BB915A   | |
	INX					;$BB915C   | | Then jump ahead four bytes
	INX					;$BB915D   | |
	INX					;$BB915E   | |
	INX					;$BB915F   |/
	JMP execute_command_set_2_wide		;$BB9160  / Run next command
						;
duplicate_word_2:				;	  \
	REP #$20				;$BB9163   |\ Copy the previous word to the decompression stream
	DEX					;$BB9165   | |
	DEX					;$BB9166   | | First go back two bytes
	LDA $0000,x				;$BB9167   | |
	STA $0002,x				;$BB916A   | |
	SEP #$20				;$BB916D   | |
	INX					;$BB916F   | | Then jump ahead four bytes
	INX					;$BB9170   | |
	INX					;$BB9171   | |
	INX					;$BB9172   |/
	JMP execute_command_set_1		;$BB9173  / Run next command
						;
copy_future_word_1:				;
	PHY					;$BB9176  \ Preserve compression index
	LDA $46					;$BB9177   | Load next operand
	REP #$20				;$BB9179   | Set A to 16 bit
	AND #$000F				;$BB917B   |\ Y = (operand << 1) + 7
	ASL A					;$BB917E   | |
	ADC #$0007				;$BB917F   | |
	TAY					;$BB9182   |/
	LDA [$34],y				;$BB9183   |\ Copy word from compression stream to the decompression stream
	STA $0000,x				;$BB9185   |/
	SEP #$20				;$BB9188   |\ Return to 8 bit A and increment the decompression index
	INX					;$BB918A   | |
	INX					;$BB918B   |/
	PLY					;$BB918C   | Restore compression index
	JMP execute_command_set_1		;$BB918D  / Run next command
						;
copy_future_word_2:				;	  \
	LDA [$34],y				;$BB9190   |\ Load next operand
	INY					;$BB9192   | |
	STA $46					;$BB9193   |/ Store to high nibble look up table
	REP #$20				;$BB9195   | Set A to 16 bit
	AND #$00F0				;$BB9197   |\ Operand = operand >> 3
	LSR A					;$BB919A   | |
	LSR A					;$BB919B   | |
	LSR A					;$BB919C   |/
	PHY					;$BB919D   | Preserve compression index
	ADC #$0007				;$BB919E   |\ Y = operand + 7
	TAY					;$BB91A1   |/
	LDA [$34],y				;$BB91A2   |\ Copy word from compression stream to the decompression stream
	STA $0000,x				;$BB91A4   |/
	SEP #$20				;$BB91A7   |\ Return to 8 bit A and increment the decompression index
	INX					;$BB91A9   | |
	INX					;$BB91AA   |/
	PLY					;$BB91AB   | Restore compression index
	JMP execute_command_set_2_wide		;$BB91AC  / Run next command
						;
build_decompression_lookup:			;
	LDY #$0100				;$BB91AF  \ Prepare to generate the high nibble table
	TDC					;$BB91B2   |\ Zero A and X and set 8 bit A
	TAX					;$BB91B3   | |
	SEP #$20				;$BB91B4   |/
.build_high_nibble				;	   |
	STA $7E2100,x				;$BB91B6   |\ Store look up value (index & 0x0F) << 4
	CLC					;$BB91BA   | |
	ADC #$10				;$BB91BB   | |
	AND #$F0				;$BB91BD   |/
	INX					;$BB91BF   |\ Loop through all 256 values
	DEY					;$BB91C0   | |
	BNE .build_high_nibble			;$BB91C1   |/
	LDY #$0100				;$BB91C3   | Prepare to generate the low nibble table
	LDX #$0000				;$BB91C6   |
.build_low_nibble				;	   |
	TXA					;$BB91C9   |\ Store look up value (index >> 4)
	LSR A					;$BB91CA   | |
	LSR A					;$BB91CB   | |
	LSR A					;$BB91CC   | |
	LSR A					;$BB91CD   | |
	STA $7E2000,x				;$BB91CE   |/
	INX					;$BB91D2   |\ Loop through all 256 values
	DEY					;$BB91D3   | |
	BNE .build_low_nibble			;$BB91D4   |/
	REP #$20				;$BB91D6   | Return to 16 bit A
	RTL					;$BB91D8  / Done

disable_screen:
	SEP #$20				;$BB91D9  \
	LDA #$00				;$BB91DB   |\ Disable HDMA
	STA.l CPU.enable_hdma			;$BB91DD   |/
	LDA #$01				;$BB91E1   |\ Turn on autojoy, turn on NMI
	STA.l CPU.enable_interrupts		;$BB91E3   |/
	LDA #$8F				;$BB91E7   |\ Enable f-blank
	STA.l PPU.screen			;$BB91E9   |/
	REP #$20				;$BB91ED   |
	LDA #$0000				;$BB91EF   |\ Disable OAM DMA
	STA $00059B				;$BB91F2   |/
	RTL					;$BB91F6  /

init_sprite_render_order_global:
	JSR init_sprite_render_order		;$BB91F7  \ Local trampoline
	RTL					;$BB91FA  /

init_sprite_render_order:			;	  \
	LDX #$0000				;$BB91FB   | Initial slot index
	LDA #aux_sprite_table			;$BB91FE   | Initial sprite slot to render
.next_slot					;	   |
	STA sprite_render_table,x		;$BB9201   |\ Write sprite slot to render, increment to the next slot
	CLC					;$BB9204   | |
	ADC #sizeof(sprite)			;$BB9205   |/
	INX					;$BB9208   |\ Check if all render slots have been filled
	INX					;$BB9209   | |
	CPX #$0032				;$BB920A   | |
	BNE .next_slot				;$BB920D   |/ If not, fill the next slot
	RTS					;$BB920F  / The slots are filled, run away

CODE_BB9210:
	JSL CODE_BB819F				;$BB9210  \
	JSL clear_noncritical_wram		;$BB9214   |
if !version == 0				;	   |
	LDA #$0104				;$BB9218   |
else						;	   |
	LDA #$0144				;$BB9218   |
endif						;	   |
	TRB $08C2				;$BB921B   |
if !version == 0				;	   |
	LDA #$0002				;$BB921E   |
else						;	   |
	LDA #$0012				;$BB921E   |
endif						;	   |
	TRB $08C4				;$BB9221   |
	LDA $08A4				;$BB9224   |
	JSL CODE_808837				;$BB9227   |
	LDA global_frame_counter		;$BB922B   |
	EOR $2F					;$BB922D   |
	STA $2F					;$BB922F   |
	JSR CODE_BB938B				;$BB9231   |
	LDA #$8000				;$BB9234   |
	STA $0D4E				;$BB9237   |
	STA $0D54				;$BB923A   |
	LDA #$0078				;$BB923D   |
	STA $0973				;$BB9240   |
	STA $096F				;$BB9243   |
	LDA $08BE				;$BB9246   |
	STA $08C0				;$BB9249   |
	LDA #$0000				;$BB924C   |
	LDX #$03FE				;$BB924F   |
CODE_BB9252:					;	   |
	STA $7E7A12,x				;$BB9252   |
	DEX					;$BB9256   |
	DEX					;$BB9257   |
	BPL CODE_BB9252				;$BB9258   |
	LDA #$0080				;$BB925A   |
	TRB $08C2				;$BB925D   |
	BEQ CODE_BB9265				;$BB9260   |
	JSR CODE_BBBDA1				;$BB9262   |
CODE_BB9265:					;	   |
	LDA #$A002				;$BB9265   |
	TRB $08C2				;$BB9268   |
	STZ $17C8				;$BB926B   |
	JSL init_registers_global		;$BB926E   |
	JSL clear_wram_tables			;$BB9272   |
	JSR init_sprite_render_order		;$BB9276   |
	JSL clear_VRAM_global			;$BB9279   |
	LDA $08A6				;$BB927D   |
	XBA					;$BB9280   |
	ORA level_number			;$BB9281   |
	JSL CODE_BBAF0C				;$BB9283   |
	LDA $060B				;$BB9287   |
	AND #$0001				;$BB928A   |
	BEQ CODE_BB929D				;$BB928D   |
	LDA $0515				;$BB928F   |
	CMP #$0000				;$BB9292   |
	BNE CODE_BB929D				;$BB9295   |
	LDA #$4000				;$BB9297   |
	TSB $08C2				;$BB929A   |
CODE_BB929D:					;	   |
	LDA $0523				;$BB929D   |
	JSL CODE_B5BCA8				;$BB92A0   |
	JSR CODE_BB886D				;$BB92A4   |
	LDA $0517				;$BB92A7   |
	ASL A					;$BB92AA   |
	TAX					;$BB92AB   |
	JSR (DATA_BB9592,x)			;$BB92AC   |
	LDA $0515				;$BB92AF   |
	CMP #$0001				;$BB92B2   |
	BNE CODE_BB92C9				;$BB92B5   |
	LDA $052D				;$BB92B7   |
	AND #$00FF				;$BB92BA   |
	CMP #$0002				;$BB92BD   |
	BNE CODE_BB92C9				;$BB92C0   |
	LDA #$0016				;$BB92C2   |
	JSL VRAM_payload_handler_global		;$BB92C5   |
CODE_BB92C9:					;	   |
	LDX #$000A				;$BB92C9   |
	JSR ($0515,x)				;$BB92CC   |
	JSR CODE_BBB34D				;$BB92CF   |
	LDA $052B				;$BB92D2   |
	AND #$0004				;$BB92D5   |
	BNE CODE_BB9310				;$BB92D8   |
	LDA $0B86				;$BB92DA   |
	AND #$0400				;$BB92DD   |
	BEQ CODE_BB92FF				;$BB92E0   |
	LDA $98					;$BB92E2   |
	TAX					;$BB92E4   |
	LDA $9A					;$BB92E5   |
	AND #$00FF				;$BB92E7   |
	TAY					;$BB92EA   |
	LDA #$1000				;$BB92EB   |
	JSL decompress_data			;$BB92EE   |
	LDA #$1000				;$BB92F2   |
	STA $98					;$BB92F5   |
	SEP #$20				;$BB92F7   |
	LDA #$7F				;$BB92F9   |
	STA $9A					;$BB92FB   |
	REP #$20				;$BB92FD   |
CODE_BB92FF:					;	   |
	JSR CODE_BB9493				;$BB92FF   |
	JSR CODE_BBB0FB				;$BB9302   |
	JSR CODE_BBB1E3				;$BB9305   |
	JSR CODE_BB94A4				;$BB9308   |
	JSR CODE_BB948D				;$BB930B   |
	BRA CODE_BB9313				;$BB930E  /

CODE_BB9310:
	STZ $0AB4				;$BB9310  \
CODE_BB9313:					;	   |
	LDX #$0008				;$BB9313   |
	JSR ($0515,x)				;$BB9316   |
	JSL CODE_B5B9ED				;$BB9319   |
	JSR CODE_BB93C0				;$BB931D   |
	JSL CODE_B5F109				;$BB9320   |
	LDA $0515				;$BB9324   |
	CMP #$0001				;$BB9327   |
	BNE CODE_BB933E				;$BB932A   |
	LDA $052D				;$BB932C   |
	AND #$00FF				;$BB932F   |
	CMP #$0002				;$BB9332   |
	BNE CODE_BB933E				;$BB9335   |
	LDA #$9998				;$BB9337   |
	STA $7FD734				;$BB933A   |
CODE_BB933E:					;	   |
	LDA level_number			;$BB933E   |
	CMP #$002D				;$BB9340   |
	BNE CODE_BB934B				;$BB9343   |
	LDA #CODE_B5C60B			;$BB9345   |
	STA $17B2				;$BB9348   |
CODE_BB934B:					;	   |
if !version == 1				;	   |
	LDA level_number			;$BB934B   |
	CMP #$000D				;$BB934D   |
	BNE CODE_BB9358				;$BB9350   |
	LDA #CODE_B5C3F4			;$BB9352   |
	STA $17B2				;$BB9355   |
CODE_BB9358:					;	   |
endif						;	   |
	LDA $0519				;$BB9358   |
	ASL A					;$BB935B   |
	TAX					;$BB935C   |
	JSR (DATA_BB95BC,x)			;$BB935D   |
	LDA #$002C				;$BB9360   |
	STA $0B00				;$BB9363   |
	STZ $1730				;$BB9366   |
	JSR CODE_BB93E7				;$BB9369   |
	LDA $0515				;$BB936C   |
	CMP #$0001				;$BB936F   |
	BEQ CODE_BB9379				;$BB9372   |
	CMP #$0006				;$BB9374   |
	BEQ CODE_BB9379				;$BB9377   |
CODE_BB9379:					;	   |
	RTL					;$BB9379  /

	JSL clear_VRAM_global			;$BB937A   |
	SEP #$20				;$BB937E   |
	LDA #$03				;$BB9380   |
	STA PPU.main_screen			;$BB9382   |
	STA PPU.sub_screen			;$BB9385   |
	REP #$20				;$BB9388   |
	RTL					;$BB938A  /

CODE_BB938B:
	LDA level_number			;$BB938B  \
	CMP #$009A				;$BB938D   |
	BNE CODE_BB939B				;$BB9390   |
	LDA #$009B				;$BB9392   |
	CMP $08AC				;$BB9395   |
	BEQ CODE_BB93A2				;$BB9398   |
CODE_BB939A:					;	   |
	RTS					;$BB939A  /

CODE_BB939B:
	LDA level_number			;$BB939B  \
	CMP $08AC				;$BB939D   |
	BNE CODE_BB939A				;$BB93A0   |
CODE_BB93A2:					;	   |
	LDA $08A6				;$BB93A2   |
	BNE CODE_BB939A				;$BB93A5   |
	LDA $08AC				;$BB93A7   |
	STA level_number			;$BB93AA   |
	LDA $08AA				;$BB93AC   |
	STA $08A6				;$BB93AF   |
	LDA $08AE				;$BB93B2   |
	STA $6E					;$BB93B5   |
	STZ current_player_mount		;$BB93B7   |
	LDA $08B2				;$BB93B9   |
	STA $0902				;$BB93BC   |
	RTS					;$BB93BF  /

CODE_BB93C0:
	LDA #$0200				;$BB93C0  \
	STA $19CA				;$BB93C3   |
	LDX $0ABA				;$BB93C6   |
CODE_BB93C9:					;	   |
	LDA.l $7E8F28,x				;$BB93C9   |
	CMP $19CA				;$BB93CD   |
	BCS CODE_BB93D5				;$BB93D0   |
	STA $19CA				;$BB93D2   |
CODE_BB93D5:					;	   |
	DEX					;$BB93D5   |
	DEX					;$BB93D6   |
	BNE CODE_BB93C9				;$BB93D7   |
	LDA $19CA				;$BB93D9   |
	EOR #$FFFF				;$BB93DC   |
	SEC					;$BB93DF   |
	ADC #$003F				;$BB93E0   |
	STA $19CA				;$BB93E3   |
	RTS					;$BB93E6  /

CODE_BB93E7:
	LDA level_number			;$BB93E7  \
	CMP #$00B9				;$BB93E9   |
	BNE CODE_BB93FE				;$BB93EC   |
	LDA $08FC				;$BB93EE   |
	AND #$0003				;$BB93F1   |
	BEQ CODE_BB93FE				;$BB93F4   |
	LDA #$0016				;$BB93F6   |
	JSL play_song				;$BB93F9   |
	RTS					;$BB93FD  /

CODE_BB93FE:
	LDA $0515				;$BB93FE  \
	CMP #$0001				;$BB9401   |
	BNE CODE_BB940C				;$BB9404   |
	LDA $052D				;$BB9406   |
	BNE CODE_BB940C				;$BB9409   |
	RTS					;$BB940B  /

CODE_BB940C:
	LDX level_number			;$BB940C  \
	LDA.l DATA_BB94C4,x			;$BB940E   |
	AND #$00FF				;$BB9412   |
	BEQ CODE_BB9424				;$BB9415   |
	LDX $0515				;$BB9417   |
	CPX #$0001				;$BB941A   |
	BNE CODE_BB943E				;$BB941D   |
	ORA #$0300				;$BB941F   |
	BRA CODE_BB9441				;$BB9422  /

CODE_BB9424:
	LDA $0515				;$BB9424  \
	CMP #$0001				;$BB9427   |
	BEQ CODE_BB9446				;$BB942A   |
	CMP #$0003				;$BB942C   |
	BEQ CODE_BB9457				;$BB942F   |
	CMP #$0002				;$BB9431   |
	BEQ CODE_BB9445				;$BB9434   |
	LDA $08C6				;$BB9436   |
	BMI CODE_BB9473				;$BB9439   |
CODE_BB943B:					;	   |
	LDA $051B				;$BB943B   |
CODE_BB943E:					;	   |
	AND #$00FF				;$BB943E   |
CODE_BB9441:					;	   |
	JSL play_song_with_transition		;$BB9441   |
CODE_BB9445:					;	   |
	RTS					;$BB9445  /

CODE_BB9446:
	LDA $052D				;$BB9446  \
	AND #$00FF				;$BB9449   |
	BNE CODE_BB944F				;$BB944C   |
	RTS					;$BB944E  /

CODE_BB944F:
	LDA #$0003				;$BB944F  \
	JSL transition_song			;$BB9452   |
	RTS					;$BB9456  /

CODE_BB9457:
	LDA level_number			;$BB9457  \
	CMP #$0061				;$BB9459   |
	BEQ CODE_BB946B				;$BB945C   |
	CMP #$006B				;$BB945E   |
	BEQ CODE_BB946B				;$BB9461   |
	LDA #$0015				;$BB9463   |
	JSL play_song_with_transition		;$BB9466   |
	RTS					;$BB946A  /

CODE_BB946B:
	LDA #$001F				;$BB946B  \
	JSL play_song_with_transition		;$BB946E   |
	RTS					;$BB9472  /

CODE_BB9473:
	LDA $051B				;$BB9473  \
	AND #$00FF				;$BB9476   |
	CMP current_song			;$BB9479   |
	BEQ CODE_BB9445				;$BB947B   |
	BRA CODE_BB943B				;$BB947D  /

	LDA $051B				;$BB947F   |
	AND #$00FF				;$BB9482   |
	ORA #$0500				;$BB9485   |
	JSL play_song_with_transition		;$BB9488   |
	RTS					;$BB948C  /

CODE_BB948D:
	LDA.l $0000DF				;$BB948D  \
	BRA CODE_BB9497				;$BB9491  /

CODE_BB9493:
	LDA.l $0000DD				;$BB9493  \
CODE_BB9497:					;	   |
	BEQ CODE_BB94A3				;$BB9497   |
	PHK					;$BB9499   |
	PLB					;$BB949A   |
	STA $26					;$BB949B   |
	LDX #$0000				;$BB949D   |
	JSR ($0026,x)				;$BB94A0   |
CODE_BB94A3:					;	   |
	RTS					;$BB94A3  /

CODE_BB94A4:
	LDA #$0000				;$BB94A4  \
	STA $98					;$BB94A7   |
	LDA #$007F				;$BB94A9   |
	EOR $9A					;$BB94AC   |
	AND #$00FF				;$BB94AE   |
	EOR $9A					;$BB94B1   |
	STA $9A					;$BB94B3   |
	RTS					;$BB94B5  /

CODE_BB94B6:
	LDY #$0000				;$BB94B6  \
	LDA $0A8E				;$BB94B9   |
	LDX #$0020				;$BB94BC   |
	JSL DMA_palette				;$BB94BF   |
	RTS					;$BB94C3  /

DATA_BB94C4:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $0F, $00, $22, $25, $00, $00
	db $00, $21, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $21, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $25
	db $25, $25, $25, $25, $22, $22, $22, $22
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $23, $23, $23, $23, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $23, $23, $23, $23, $23, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $13, $00, $00, $00, $20, $00, $00
	db $20, $20, $20, $20, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00

DATA_BB9592:
	dw CODE_BB9788
	dw CODE_BB966F
	dw CODE_BB9650
	dw CODE_BB9631
	dw CODE_BB96F8
	dw CODE_BB971B
	dw CODE_BB9761
	dw CODE_BB960B
	dw CODE_BB9874
	dw CODE_BB99DB
	dw CODE_BB9828
	dw CODE_BB9993
	dw CODE_BB97B4
	dw CODE_BB973E
	dw CODE_BB97F9
	dw CODE_BB96BC
	dw CODE_BB96D5
	dw CODE_BB95F2
	dw CODE_BB98B4
	dw CODE_BB9885
	dw CODE_BB97DA

DATA_BB95BC:
	dw CODE_BB9E6A
	dw CODE_BBA20B
	dw CODE_BBA1FF
	dw CODE_BB9ACA
	dw CODE_BBA5DA
	dw CODE_BBA5A9
	dw CODE_BBA416
	dw CODE_BB9E59
	dw CODE_BB9A93
	dw CODE_BB9B79
	dw CODE_BB9D1D
	dw CODE_BB9E74
	dw CODE_BBA5C9
	dw CODE_BBA00D
	dw CODE_BB9E80
	dw CODE_BBA031
	dw CODE_BBA031
	dw CODE_BBA726
	dw CODE_BBA9D2
	dw CODE_BBA9E0
	dw CODE_BB9B18
	dw CODE_BBA2E2
	dw CODE_BBA24F
	dw CODE_BBA5D0
	dw CODE_BB9E0F
	dw CODE_BBA8E3
	dw CODE_BBA8F3


CODE_BB95F2:
	LDA #$0001				;$BB95F2  \
	JSL VRAM_payload_handler_global		;$BB95F5   |
	LDA $0539				;$BB95F9   |
	JSL VRAM_payload_handler_global		;$BB95FC   |
	JSR CODE_BB94B6				;$BB9600   |
	LDA $0537				;$BB9603   |
	JSL set_PPU_registers_global		;$BB9606   |
	RTS					;$BB960A  /

CODE_BB960B:
	LDA #$0001				;$BB960B  \
	JSL VRAM_payload_handler_global		;$BB960E   |
	LDA $0539				;$BB9612   |
	JSL VRAM_payload_handler_global		;$BB9615   |
	JSR CODE_BB94B6				;$BB9619   |
	LDY #$0070				;$BB961C   |
	LDA #DATA_FD15F0			;$BB961F   |
	LDX #$0004				;$BB9622   |
	JSL DMA_palette				;$BB9625   |
	LDA $0537				;$BB9629   |
	JSL set_PPU_registers_global		;$BB962C   |
	RTS					;$BB9630  /

CODE_BB9631:
	LDA #$0001				;$BB9631  \
	JSL VRAM_payload_handler_global		;$BB9634   |
	LDA $0539				;$BB9638   |
	JSL VRAM_payload_handler_global		;$BB963B   |
	LDA #screechs_sprint_level_palette	;$BB963F   |
	STA $0A8E				;$BB9642   |
	JSR CODE_BB94B6				;$BB9645   |
	LDA $0537				;$BB9648   |
	JSL set_PPU_registers_global		;$BB964B   |
	RTS					;$BB964F  /

CODE_BB9650:
	LDA #$0001				;$BB9650  \
	JSL VRAM_payload_handler_global		;$BB9653   |
	LDA $0539				;$BB9657   |
	JSL VRAM_payload_handler_global		;$BB965A   |
	LDA #bramble_scramble_level_palette	;$BB965E   |
	STA $0A8E				;$BB9661   |
	JSR CODE_BB94B6				;$BB9664   |
	LDA $0537				;$BB9667   |
	JSL set_PPU_registers_global		;$BB966A   |
	RTS					;$BB966E  /

CODE_BB966F:
	LDA #$0001				;$BB966F  \
	JSL VRAM_payload_handler_global		;$BB9672   |
	LDA $0539				;$BB9676   |
	JSL VRAM_payload_handler_global		;$BB9679   |
	JSR CODE_BB94B6				;$BB967D   |
	LDY #$0010				;$BB9680   |
	LDA #DATA_FD268E			;$BB9683   |
	LDX #$0004				;$BB9686   |
	JSL DMA_palette				;$BB9689   |
	LDA $0537				;$BB968D   |
	JSL set_PPU_registers_global		;$BB9690   |
	LDX #DATA_E98B07			;$BB9694   |
	LDY.w #DATA_E98B07>>16			;$BB9697   |
	LDA #$F800				;$BB969A   |
	JSL decompress_data			;$BB969D   |
	LDA #$6000				;$BB96A1   |
	STA PPU.vram_address			;$BB96A4   |
	LDX #$0000				;$BB96A7   |
CODE_BB96AA:					;	   |
	LDA.l $7FF800,x				;$BB96AA   |
	AND #$E7FF				;$BB96AE   |
	STA PPU.vram_write			;$BB96B1   |
	INX					;$BB96B4   |
	INX					;$BB96B5   |
	CPX #$0800				;$BB96B6   |
	BNE CODE_BB96AA				;$BB96B9   |
	RTS					;$BB96BB  /

CODE_BB96BC:
	LDA #$0001				;$BB96BC  \
	JSL VRAM_payload_handler_global		;$BB96BF   |
	LDA $0539				;$BB96C3   |
	JSL VRAM_payload_handler_global		;$BB96C6   |
	JSR CODE_BB94B6				;$BB96CA   |
	LDA $0537				;$BB96CD   |
	JSL set_PPU_registers_global		;$BB96D0   |
	RTS					;$BB96D4  /

CODE_BB96D5:
	LDA #$0001				;$BB96D5  \
	JSL VRAM_payload_handler_global		;$BB96D8   |
	LDA $0539				;$BB96DC   |
	JSL VRAM_payload_handler_global		;$BB96DF   |
	LDA $0537				;$BB96E3   |
	JSL set_PPU_registers_global		;$BB96E6   |
	LDY #$0000				;$BB96EA   |
	LDA #web_woods_level_palette		;$BB96ED   |
	LDX #$0020				;$BB96F0   |
	JSL DMA_palette				;$BB96F3   |
	RTS					;$BB96F7  /

CODE_BB96F8:
	LDA #$0001				;$BB96F8  \
	JSL VRAM_payload_handler_global		;$BB96FB   |
	LDA $0539				;$BB96FF   |
	JSL VRAM_payload_handler_global		;$BB9702   |
	LDA $0537				;$BB9706   |
	JSL set_PPU_registers_global		;$BB9709   |
	LDY #$0000				;$BB970D   |
	LDA #rattle_battle_level_palette	;$BB9710   |
	LDX #$0020				;$BB9713   |
	JSL DMA_palette				;$BB9716   |
	RTS					;$BB971A  /

CODE_BB971B:
	LDA #$0001				;$BB971B  \
	JSL VRAM_payload_handler_global		;$BB971E   |
	LDA $0539				;$BB9722   |
	JSL VRAM_payload_handler_global		;$BB9725   |
	LDA $0537				;$BB9729   |
	JSL set_PPU_registers_global		;$BB972C   |
	LDY #$0000				;$BB9730   |
	LDA #slime_climb_level_palette		;$BB9733   |
	LDX #$0020				;$BB9736   |
	JSL DMA_palette				;$BB9739   |
	RTS					;$BB973D  /

CODE_BB973E:
	LDA #$0001				;$BB973E  \
	JSL VRAM_payload_handler_global		;$BB9741   |
	LDA $0539				;$BB9745   |
	JSL VRAM_payload_handler_global		;$BB9748   |
	LDA $0537				;$BB974C   |
	JSL set_PPU_registers_global		;$BB974F   |
	LDY #$0000				;$BB9753   |
	LDA #lava_lagoon_level_palette		;$BB9756   |
	LDX #$0020				;$BB9759   |
	JSL DMA_palette				;$BB975C   |
	RTS					;$BB9760  /

CODE_BB9761:
	LDA #$0001				;$BB9761  \
	JSL VRAM_payload_handler_global		;$BB9764   |
	LDA $0539				;$BB9768   |
	JSL VRAM_payload_handler_global		;$BB976B   |
	JSR CODE_BB94B6				;$BB976F   |
	LDA $0537				;$BB9772   |
	JSL set_PPU_registers_global		;$BB9775   |
	LDY #$0000				;$BB9779   |
	LDA #haunted_hall_level_palette		;$BB977C   |
	LDX #$0020				;$BB977F   |
	JSL DMA_palette				;$BB9782   |
	BRA CODE_BB9798				;$BB9786  /

CODE_BB9788:
	JSR CODE_BB95F2				;$BB9788  \
	LDY #$0000				;$BB978B   |
	LDA #carnival_level_palette		;$BB978E   |
	LDX #$0020				;$BB9791   |
	JSL DMA_palette				;$BB9794   |
CODE_BB9798:					;	   |
	SEP #$20				;$BB9798   |
	LDA #$03				;$BB979A   |
	LDX #$0002				;$BB979C   |
	LDY level_number			;$BB979F   |
	CPY #$00C3				;$BB97A1   |
	BNE CODE_BB97AB				;$BB97A4   |
	LDA #$01				;$BB97A6   |
	LDX #$0001				;$BB97A8   |
CODE_BB97AB:					;	   |
	STA $19AD				;$BB97AB   |
	REP #$20				;$BB97AE   |
	STX $092D				;$BB97B0   |
	RTS					;$BB97B3  /

CODE_BB97B4:
	LDA #$0001				;$BB97B4  \
	JSL VRAM_payload_handler_global		;$BB97B7   |
	LDA $0539				;$BB97BB   |
	JSL VRAM_payload_handler_global		;$BB97BE   |
	JSR CODE_BB94B6				;$BB97C2   |
	LDA $0537				;$BB97C5   |
	JSL set_PPU_registers_global		;$BB97C8   |
	LDY #$0000				;$BB97CC   |
	LDA #glimmers_galleon_level_palette	;$BB97CF   |
	LDX #$0020				;$BB97D2   |
	JSL DMA_palette				;$BB97D5   |
	RTS					;$BB97D9  /

CODE_BB97DA:
	LDA #$0001				;$BB97DA  \
	JSL VRAM_payload_handler_global		;$BB97DD   |
	LDA $0539				;$BB97E1   |
	JSL VRAM_payload_handler_global		;$BB97E4   |
	LDA #mainbrace_mayhem_level_palette	;$BB97E8   |
	STA $0A8E				;$BB97EB   |
	JSR CODE_BB94B6				;$BB97EE   |
	LDA $0537				;$BB97F1   |
	JSL set_PPU_registers_global		;$BB97F4   |
	RTS					;$BB97F8  /

CODE_BB97F9:
	LDA #$0001				;$BB97F9  \
	JSL VRAM_payload_handler_global		;$BB97FC   |
	LDA $0539				;$BB9800   |
	JSL VRAM_payload_handler_global		;$BB9803   |
	JSR CODE_BB94B6				;$BB9807   |
	LDY #$0070				;$BB980A   |
	LDA #DATA_FD268E			;$BB980D   |
	LDX #$0004				;$BB9810   |
	JSL DMA_palette				;$BB9813   |
	LDA $0537				;$BB9817   |
	JSL set_PPU_registers_global		;$BB981A   |
	LDA #$0300				;$BB981E   |
	STA $19BE				;$BB9821   |
	STZ $19C2				;$BB9824   |
	RTS					;$BB9827  /

CODE_BB9828:
	JSR CODE_BB95F2				;$BB9828  \
	PHB					;$BB982B   |
	JSL CODE_B4AC65				;$BB982C   |
	PLB					;$BB9830   |
	LDA #$7400				;$BB9831   |
	STA PPU.vram_address			;$BB9834   |
	SEP #$20				;$BB9837   |
	LDA #$01				;$BB9839   |
	STA DMA[0].settings			;$BB983B   |
	LDA #$18				;$BB983E   |
	STA DMA[0].destination			;$BB9840   |
	LDX #$3E00				;$BB9843   |
	STX DMA[0].source			;$BB9846   |
	LDA #$7E				;$BB9849   |
	STA DMA[0].source_bank			;$BB984B   |
	LDX #$0600				;$BB984E   |
	STX DMA[0].size				;$BB9851   |
	STZ DMA[0].unused_1			;$BB9854   |
	LDA #$01				;$BB9857   |
	STA CPU.enable_dma			;$BB9859   |
	REP #$20				;$BB985C   |
	LDA level_number			;$BB985E   |
	CMP #$0022				;$BB9860   |
	BEQ CODE_BB9866				;$BB9863   |
	RTS					;$BB9865  /

CODE_BB9866:
	LDY #$0010				;$BB9866  \
	LDA #DATA_FD326E			;$BB9869   |
	LDX #$0004				;$BB986C   |
	JSL DMA_palette				;$BB986F   |
	RTS					;$BB9873  /

CODE_BB9874:
	JSR CODE_BB99DB				;$BB9874  \
	LDY #$0000				;$BB9877   |
	LDA #DATA_FD0DD0			;$BB987A   |
	LDX #$0004				;$BB987D   |
	JSL DMA_palette				;$BB9880   |
	RTS					;$BB9884  /

CODE_BB9885:
	JSR CODE_BB95F2				;$BB9885  \
	LDA #$6700				;$BB9888   |
	STA PPU.vram_address			;$BB988B   |
	LDX #$0000				;$BB988E   |
CODE_BB9891:					;	   |
	LDA.l DATA_E9A805,x			;$BB9891   |
	ORA #$2000				;$BB9895   |
	STA PPU.vram_write			;$BB9898   |
	INX					;$BB989B   |
	INX					;$BB989C   |
	CPX #$0100				;$BB989D   |
	BNE CODE_BB9891				;$BB98A0   |
	LDA #CODE_BB98E2			;$BB98A2   |
	STA $0000DD				;$BB98A5   |
	LDA #CODE_BB98E8			;$BB98A9   |
	STA $0000DF				;$BB98AC   |
	JSR CODE_BBABE2				;$BB98B0   |
	RTS					;$BB98B3  /

CODE_BB98B4:
	LDA #$6000				;$BB98B4  \
	STA $17B6				;$BB98B7   |
	JSR CODE_BB95F2				;$BB98BA   |
	LDY #$0000				;$BB98BD   |
	LDA #DATA_FD2DCE			;$BB98C0   |
	LDX #$0004				;$BB98C3   |
	JSL DMA_palette				;$BB98C6   |
	LDA #$2700				;$BB98CA   |
	STA $0D4E				;$BB98CD   |
	JSR CODE_BBABE2				;$BB98D0   |
	LDA #CODE_BB98E2			;$BB98D3   |
	STA $0000DD				;$BB98D6   |
	LDA #CODE_BB98E8			;$BB98DA   |
	STA $0000DF				;$BB98DD   |
	RTS					;$BB98E1  /

CODE_BB98E2:
	LDX #$0001				;$BB98E2  \
	JMP CODE_BB9A88				;$BB98E5  /

CODE_BB98E8:
	LDA $98					;$BB98E8  \
	PHA					;$BB98EA   |
	LDA $9A					;$BB98EB   |
	PHA					;$BB98ED   |
	LDA $17B6				;$BB98EE   |
	PHA					;$BB98F1   |
	LDA #$0100				;$BB98F2   |
	STA $17C0				;$BB98F5   |
	LDA #$7800				;$BB98F8   |
	STA $17B6				;$BB98FB   |
	JSR CODE_BB9A23				;$BB98FE   |
	LDA #$0100				;$BB9901   |
	STA $17C0				;$BB9904   |
	LDA #$7000				;$BB9907   |
	STA $17B6				;$BB990A   |
	JSR CODE_BB9A23				;$BB990D   |
	LDX #DATA_C2FAC9			;$BB9910   |
	LDY.w #DATA_C2FAC9>>16			;$BB9913   |
	LDA #$F800				;$BB9916   |
	JSL decompress_data			;$BB9919   |
	LDA #$7000				;$BB991D   |
	STA PPU.vram_address			;$BB9920   |
	LDY #$02FE				;$BB9923   |
CODE_BB9926:					;	   |
	TYA					;$BB9926   |
	EOR #$003E				;$BB9927   |
	TAX					;$BB992A   |
	LDA.l $7FFB00,x				;$BB992B   |
	EOR #$8000				;$BB992F   |
	STA PPU.vram_write			;$BB9932   |
	DEY					;$BB9935   |
	DEY					;$BB9936   |
	BPL CODE_BB9926				;$BB9937   |
	LDA #$7180				;$BB9939   |
	STA PPU.vram_address			;$BB993C   |
	LDA #$FB00				;$BB993F   |
	LDX #$007F				;$BB9942   |
	LDY #$0300				;$BB9945   |
	JSL DMA_to_VRAM				;$BB9948   |
	LDX #DATA_C6FC11			;$BB994C   |
	LDY.w #DATA_C6FC11>>16			;$BB994F   |
	LDA #$F800				;$BB9952   |
	JSL decompress_data			;$BB9955   |
	LDA #$7400				;$BB9959   |
	STA PPU.vram_address			;$BB995C   |
	LDY #$02FE				;$BB995F   |
CODE_BB9962:					;	   |
	TYA					;$BB9962   |
	EOR #$003E				;$BB9963   |
	TAX					;$BB9966   |
	LDA.l $7FFB00,x				;$BB9967   |
	EOR #$8000				;$BB996B   |
	STA PPU.vram_write			;$BB996E   |
	DEY					;$BB9971   |
	DEY					;$BB9972   |
	BPL CODE_BB9962				;$BB9973   |
	LDA #$7580				;$BB9975   |
	STA PPU.vram_address			;$BB9978   |
	LDA #$FB00				;$BB997B   |
	LDX #$007F				;$BB997E   |
	LDY #$0300				;$BB9981   |
	JSL DMA_to_VRAM				;$BB9984   |
	PLA					;$BB9988   |
	STA $17B6				;$BB9989   |
	PLA					;$BB998C   |
	STA $9A					;$BB998D   |
	PLA					;$BB998F   |
	STA $98					;$BB9990   |
	RTS					;$BB9992  /

CODE_BB9993:
	JSR CODE_BB95F2				;$BB9993  \
	LDA #CODE_BB99A5			;$BB9996   |
	STA $0000DD				;$BB9999   |
	LDA #CODE_BB99AB			;$BB999D   |
	STA $0000DF				;$BB99A0   |
	RTS					;$BB99A4  /

CODE_BB99A5:
	LDX #$0001				;$BB99A5  \
	JMP CODE_BB9A88				;$BB99A8  /

CODE_BB99AB:
	LDA $98					;$BB99AB  \
	PHA					;$BB99AD   |
	LDA $9A					;$BB99AE   |
	PHA					;$BB99B0   |
	LDA $17B6				;$BB99B1   |
	PHA					;$BB99B4   |
	LDA #$0100				;$BB99B5   |
	STA $17C0				;$BB99B8   |
	LDA #$7000				;$BB99BB   |
	STA $17B6				;$BB99BE   |
	JSR CODE_BB9A23				;$BB99C1   |
	STZ $17C0				;$BB99C4   |
	LDA #$7800				;$BB99C7   |
	STA $17B6				;$BB99CA   |
	JSR CODE_BB9A23				;$BB99CD   |
	PLA					;$BB99D0   |
	STA $17B6				;$BB99D1   |
	PLA					;$BB99D4   |
	STA $9A					;$BB99D5   |
	PLA					;$BB99D7   |
	STA $98					;$BB99D8   |
	RTS					;$BB99DA  /

CODE_BB99DB:
	JSR CODE_BB95F2				;$BB99DB  \
	LDA #CODE_BB99ED			;$BB99DE   |
	STA $0000DD				;$BB99E1   |
	LDA #CODE_BB99F3			;$BB99E5   |
	STA $0000DF				;$BB99E8   |
	RTS					;$BB99EC  /

CODE_BB99ED:
	LDX #$0004				;$BB99ED  \
	JMP CODE_BB9A88				;$BB99F0  /

CODE_BB99F3:
	LDA $98					;$BB99F3  \
	PHA					;$BB99F5   |
	LDA $9A					;$BB99F6   |
	PHA					;$BB99F8   |
	LDA $17B6				;$BB99F9   |
	PHA					;$BB99FC   |
	LDA #$0100				;$BB99FD   |
	STA $17C0				;$BB9A00   |
	LDA #$6C00				;$BB9A03   |
	STA $17B6				;$BB9A06   |
	JSR CODE_BB9A23				;$BB9A09   |
	STZ $17C0				;$BB9A0C   |
	LDA #$6400				;$BB9A0F   |
	STA $17B6				;$BB9A12   |
	JSR CODE_BB9A23				;$BB9A15   |
	PLA					;$BB9A18   |
	STA $17B6				;$BB9A19   |
	PLA					;$BB9A1C   |
	STA $9A					;$BB9A1D   |
	PLA					;$BB9A1F   |
	STA $98					;$BB9A20   |
	RTS					;$BB9A22  /

CODE_BB9A23:
	LDA #$F800				;$BB9A23  \
	STA $98					;$BB9A26   |
	LDA #$007F				;$BB9A28   |
	STA $9A					;$BB9A2B   |
	STZ $17C8				;$BB9A2D   |
	SEP #$20				;$BB9A30   |
	LDA #$80				;$BB9A32   |
	STA $9B					;$BB9A34   |
	REP #$20				;$BB9A36   |
	STZ $17D2				;$BB9A38   |
	STZ $17D6				;$BB9A3B   |
	STZ $17B8				;$BB9A3E   |
	STZ $17BA				;$BB9A41   |
	LDA #$00F8				;$BB9A44   |
	STA $17CA				;$BB9A47   |
	STZ $17C2				;$BB9A4A   |
	STZ $17CE				;$BB9A4D   |
	LDA #$0008				;$BB9A50   |
	STA $17D6				;$BB9A53   |
	LDA #$0040				;$BB9A56   |
CODE_BB9A59:					;	   |
	PHA					;$BB9A59   |
	JSR CODE_BB9A73				;$BB9A5A   |
	JSL CODE_B5ADD8				;$BB9A5D   |
	LDA #$0008				;$BB9A61   |
	STA $17D6				;$BB9A64   |
	CLC					;$BB9A67   |
	ADC $17BA				;$BB9A68   |
	STA $17BA				;$BB9A6B   |
	PLA					;$BB9A6E   |
	DEC A					;$BB9A6F   |
	BNE CODE_BB9A59				;$BB9A70   |
	RTS					;$BB9A72  /

CODE_BB9A73:
	LDA $0AB4				;$BB9A73  \
	AND #$000F				;$BB9A76   |
	CMP #$0005				;$BB9A79   |
	BEQ CODE_BB9A83				;$BB9A7C   |
	JSL CODE_B5AC9C				;$BB9A7E   |
	RTS					;$BB9A82  /

CODE_BB9A83:
	JSL CODE_B5B0FC				;$BB9A83  \
	RTS					;$BB9A87  /

CODE_BB9A88:
	TXA					;$BB9A88  \
	LDX #$F800				;$BB9A89   |
	LDY #$007F				;$BB9A8C   |
	JSR CODE_BBB104				;$BB9A8F   |
	RTS					;$BB9A92  /

CODE_BB9A93:
	LDA #$0024				;$BB9A93  \
	STA $78					;$BB9A96   |
	LDA #$0060				;$BB9A98   |
	STA $7E8012				;$BB9A9B   |
	LDA #$0001				;$BB9A9F   |
	STA $7E8014				;$BB9AA2   |
	DEC A					;$BB9AA6   |
	STA $7E8016				;$BB9AA7   |
	SEP #$20				;$BB9AAB   |
	LDX #$2600				;$BB9AAD   |
	STX HDMA[2].settings			;$BB9AB0   |
	LDX #$8012				;$BB9AB3   |
	STX HDMA[2].source			;$BB9AB6   |
	LDA #$7E				;$BB9AB9   |
	STA HDMA[2].source_bank			;$BB9ABB   |
	STZ HDMA[2].indirect_source_bank	;$BB9ABE   |
	REP #$20				;$BB9AC1   |
	LDA #$0401				;$BB9AC3   |
	STA pending_dma_hdma_channels		;$BB9AC6   |
	RTS					;$BB9AC9  /

CODE_BB9ACA:
	JSR CODE_BBA8DD				;$BB9ACA  \
	LDA level_number			;$BB9ACD   |
	CMP #$0063				;$BB9ACF   |
	BNE CODE_BB9AD9				;$BB9AD2   |
	LDA #$001C				;$BB9AD4   |
	STA $78					;$BB9AD7   |
CODE_BB9AD9:					;	   |
	LDA #$0040				;$BB9AD9   |
	STA $7E8012				;$BB9ADC   |
	LDA #$0060				;$BB9AE0   |
	STA $7E8015				;$BB9AE3   |
	STA $7E8016				;$BB9AE7   |
	LDA #$0001				;$BB9AEB   |
	STA $7E8018				;$BB9AEE   |
	LDA #$0000				;$BB9AF2   |
	STA $7E801B				;$BB9AF5   |
	SEP #$20				;$BB9AF9   |
	LDX #$0E02				;$BB9AFB   |
	STX HDMA[1].settings			;$BB9AFE   |
	LDX #$8012				;$BB9B01   |
	STX HDMA[1].source			;$BB9B04   |
	LDA #$7E				;$BB9B07   |
	STA HDMA[1].source_bank			;$BB9B09   |
	STZ HDMA[1].indirect_source_bank	;$BB9B0C   |
	REP #$20				;$BB9B0F   |
	LDA #$0201				;$BB9B11   |
	STA pending_dma_hdma_channels		;$BB9B14   |
	RTS					;$BB9B17  /

CODE_BB9B18:
	JSR CODE_BBA8DD				;$BB9B18  \
	LDX #$0000				;$BB9B1B   |
CODE_BB9B1E:					;	   |
	LDA #$0010				;$BB9B1E   |
	STA $7E8012,x				;$BB9B21   |
	LDA #$0000				;$BB9B25   |
	STA $7E8013,x				;$BB9B28   |
	INX					;$BB9B2C   |
	INX					;$BB9B2D   |
	INX					;$BB9B2E   |
	CPX #$0066				;$BB9B2F   |
	BNE CODE_BB9B1E				;$BB9B32   |
	SEP #$20				;$BB9B34   |
	LDX #$0D02				;$BB9B36   |
	STX HDMA[1].settings			;$BB9B39   |
	LDX #$8012				;$BB9B3C   |
	STX HDMA[1].source			;$BB9B3F   |
	LDA #$7E				;$BB9B42   |
	STA HDMA[1].source_bank			;$BB9B44   |
	STZ HDMA[1].indirect_source_bank	;$BB9B47   |
	REP #$20				;$BB9B4A   |
	LDA #$0201				;$BB9B4C   |
	STA pending_dma_hdma_channels		;$BB9B4F   |
	LDA $0515				;$BB9B52   |
	CMP #$0001				;$BB9B55   |
	BEQ CODE_BB9B62				;$BB9B58   |
	LDY #$00D0				;$BB9B5A   |
	JSL CODE_BB83EF				;$BB9B5D   |
	RTS					;$BB9B61  /

CODE_BB9B62:
	LDA level_number			;$BB9B62  \
	CMP #$0087				;$BB9B64   |
	BEQ CODE_BB9B71				;$BB9B67   |
	LDY #$007A				;$BB9B69   |
	JSL CODE_BB83EF				;$BB9B6C   |
	RTS					;$BB9B70  /

CODE_BB9B71:
	LDY #$0136				;$BB9B71  \
	JSL CODE_BB83EF				;$BB9B74   |
	RTS					;$BB9B78  /

CODE_BB9B79:
	LDA #$0002				;$BB9B79  \
	LDY level_number			;$BB9B7C   |
	CPY #$0008				;$BB9B7E   |
	BEQ CODE_BB9B86				;$BB9B81   |
	LDA #$0044				;$BB9B83   |
CODE_BB9B86:					;	   |
	STA $0959				;$BB9B86   |
	LDA #$001C				;$BB9B89   |
	STA $78					;$BB9B8C   |
	LDA #$0040				;$BB9B8E   |
	STA $7E8012				;$BB9B91   |
	STA $7E8022				;$BB9B95   |
	STA $7E8032				;$BB9B99   |
	LDA #$0001				;$BB9B9D   |
	STA $7E8017				;$BB9BA0   |
	STA $7E801C				;$BB9BA4   |
	STA $7E8027				;$BB9BA8   |
	STA $7E802C				;$BB9BAC   |
	STA $7E8035				;$BB9BB0   |
	STA $7E8038				;$BB9BB4   |
	LDA #$6779				;$BB9BB8   |
	STA $7E8033				;$BB9BBB   |
	STA $7E8036				;$BB9BBF   |
	LDA #$7967				;$BB9BC3   |
	STA $7E8039				;$BB9BC6   |
	LDA #$0000				;$BB9BCA   |
	STA $7E8013				;$BB9BCD   |
	STA $7E8015				;$BB9BD1   |
	STA $7E8018				;$BB9BD5   |
	STA $7E801A				;$BB9BD9   |
	STA $7E801D				;$BB9BDD   |
	STA $7E801F				;$BB9BE1   |
	STA $7E8021				;$BB9BE5   |
	STA $7E8023				;$BB9BE9   |
	STA $7E8025				;$BB9BED   |
	STA $7E8028				;$BB9BF1   |
	STA $7E802A				;$BB9BF5   |
	STA $7E802D				;$BB9BF9   |
	STA $7E802F				;$BB9BFD   |
	STA $7E8031				;$BB9C01   |
	STA $7E803B				;$BB9C05   |
	LDA #$4301				;$BB9C09   |
	STA $7E803C				;$BB9C0C   |
	STA $7E803E				;$BB9C10   |
	LDA #$4201				;$BB9C14   |
	STA $7E8040				;$BB9C17   |
	LDA #$0000				;$BB9C1B   |
	STA $7E8042				;$BB9C1E   |
	LDA #$0040				;$BB9C22   |
	STA $7E8043				;$BB9C25   |
	LDA #$0401				;$BB9C29   |
	STA $7E8045				;$BB9C2C   |
	LDA #$0000				;$BB9C30   |
	STA $7E8047				;$BB9C33   |
	SEP #$20				;$BB9C37   |
	LDX #$0D03				;$BB9C39   |
	STX HDMA[1].settings			;$BB9C3C   |
	LDX #$8012				;$BB9C3F   |
	STX HDMA[1].source			;$BB9C42   |
	LDA #$7E				;$BB9C45   |
	STA HDMA[1].source_bank			;$BB9C47   |
	STZ HDMA[1].indirect_source_bank	;$BB9C4A   |
	LDX #$0F03				;$BB9C4D   |
	STX HDMA[2].settings			;$BB9C50   |
	LDX #$8022				;$BB9C53   |
	STX HDMA[2].source			;$BB9C56   |
	LDA #$7E				;$BB9C59   |
	STA HDMA[2].source_bank			;$BB9C5B   |
	STZ HDMA[2].indirect_source_bank	;$BB9C5E   |
	LDX #$0701				;$BB9C61   |
	STX HDMA[3].settings			;$BB9C64   |
	LDX #$8032				;$BB9C67   |
	STX HDMA[3].source			;$BB9C6A   |
	LDA #$7E				;$BB9C6D   |
	STA HDMA[3].source_bank			;$BB9C6F   |
	STZ HDMA[3].indirect_source_bank	;$BB9C72   |
	LDX #$3100				;$BB9C75   |
	STX HDMA[4].settings			;$BB9C78   |
	LDX #$803C				;$BB9C7B   |
	STX HDMA[4].source			;$BB9C7E   |
	LDA #$7E				;$BB9C81   |
	STA HDMA[4].source_bank			;$BB9C83   |
	STZ HDMA[4].indirect_source_bank	;$BB9C86   |
	LDX #$2D00				;$BB9C89   |
	STX HDMA[5].settings			;$BB9C8C   |
	LDX #$8043				;$BB9C8F   |
	STX HDMA[5].source			;$BB9C92   |
	LDA #$7E				;$BB9C95   |
	STA HDMA[5].source_bank			;$BB9C97   |
	STZ HDMA[5].indirect_source_bank	;$BB9C9A   |
	LDX #$1142				;$BB9C9D   |
	STX HDMA[6].settings			;$BB9CA0   |
	LDX #DATA_BB9CBC			;$BB9CA3   |
	STX HDMA[6].source			;$BB9CA6   |
	LDA #DATA_BB9CBC>>16			;$BB9CA9   |
	STA HDMA[6].source_bank			;$BB9CAB   |
	LDA #$7E				;$BB9CAE   |
	STA HDMA[6].indirect_source_bank	;$BB9CB0   |
	REP #$20				;$BB9CB3   |
	LDA #$7E01				;$BB9CB5   |
	STA pending_dma_hdma_channels		;$BB9CB8   |
	RTS					;$BB9CBB  /

DATA_BB9CBC:
	db $08, $56, $80, $08, $54, $80, $08, $52
	db $80, $08, $50, $80, $08, $4E, $80, $08
	db $4C, $80, $08, $4A, $80, $08, $48, $80
	db $08, $56, $80, $08, $54, $80, $08, $52
	db $80, $08, $50, $80, $08, $4E, $80, $08
	db $4C, $80, $08, $4A, $80, $08, $48, $80
	db $08, $56, $80, $08, $54, $80, $08, $52
	db $80, $08, $50, $80, $08, $4E, $80, $08
	db $4C, $80, $08, $4A, $80, $08, $48, $80
	db $08, $56, $80, $08, $54, $80, $08, $52
	db $80, $08, $50, $80, $08, $4E, $80, $08
	db $4C, $80, $08, $4A, $80, $08, $48, $80
	db $00


CODE_BB9D1D:
	JSR CODE_BBA8DD				;$BB9D1D  \
	LDA #$0040				;$BB9D20   |
	STA $7E8012				;$BB9D23   |
	STA $7E8022				;$BB9D27   |
	STA $7E8032				;$BB9D2B   |
	LDA #$0001				;$BB9D2F   |
	STA $7E8017				;$BB9D32   |
	STA $7E801C				;$BB9D36   |
	STA $7E8027				;$BB9D3A   |
	STA $7E802C				;$BB9D3E   |
	STA $7E8035				;$BB9D42   |
	STA $7E8038				;$BB9D46   |
	LDA #$6779				;$BB9D4A   |
	STA $7E8033				;$BB9D4D   |
	STA $7E8036				;$BB9D51   |
	LDA #$7967				;$BB9D55   |
	STA $7E8039				;$BB9D58   |
	LDA #$0000				;$BB9D5C   |
	STA $7E8013				;$BB9D5F   |
	STA $7E8015				;$BB9D63   |
	STA $7E8018				;$BB9D67   |
	STA $7E801A				;$BB9D6B   |
	STA $7E801D				;$BB9D6F   |
	STA $7E801F				;$BB9D73   |
	STA $7E8021				;$BB9D77   |
	STA $7E8023				;$BB9D7B   |
	STA $7E8025				;$BB9D7F   |
	STA $7E8028				;$BB9D83   |
	STA $7E802A				;$BB9D87   |
	STA $7E802D				;$BB9D8B   |
	STA $7E802F				;$BB9D8F   |
	STA $7E8031				;$BB9D93   |
	STA $7E803B				;$BB9D97   |
	LDA #$8701				;$BB9D9B   |
	STA $7E803C				;$BB9D9E   |
	STA $7E803E				;$BB9DA2   |
	LDA #$8601				;$BB9DA6   |
	STA $7E8040				;$BB9DA9   |
	LDA #$0000				;$BB9DAD   |
	STA $7E8042				;$BB9DB0   |
	SEP #$20				;$BB9DB4   |
	LDX #$0D03				;$BB9DB6   |
	STX HDMA[1].settings			;$BB9DB9   |
	LDX #$8012				;$BB9DBC   |
	STX HDMA[1].source			;$BB9DBF   |
	LDA #$7E				;$BB9DC2   |
	STA HDMA[1].source_bank			;$BB9DC4   |
	STZ HDMA[1].indirect_source_bank	;$BB9DC7   |
	LDX #$0F03				;$BB9DCA   |
	STX HDMA[2].settings			;$BB9DCD   |
	LDX #$8022				;$BB9DD0   |
	STX HDMA[2].source			;$BB9DD3   |
	LDA #$7E				;$BB9DD6   |
	STA HDMA[2].source_bank			;$BB9DD8   |
	STZ HDMA[2].indirect_source_bank	;$BB9DDB   |
	LDX #$0701				;$BB9DDE   |
	STX HDMA[3].settings			;$BB9DE1   |
	LDX #$8032				;$BB9DE4   |
	STX HDMA[3].source			;$BB9DE7   |
	LDA #$7E				;$BB9DEA   |
	STA HDMA[3].source_bank			;$BB9DEC   |
	STZ HDMA[3].indirect_source_bank	;$BB9DEF   |
	LDX #$3100				;$BB9DF2   |
	STX HDMA[4].settings			;$BB9DF5   |
	LDX #$803C				;$BB9DF8   |
	STX HDMA[4].source			;$BB9DFB   |
	LDA #$7E				;$BB9DFE   |
	STA HDMA[4].source_bank			;$BB9E00   |
	STZ HDMA[4].indirect_source_bank	;$BB9E03   |
	REP #$20				;$BB9E06   |
	LDA #$1E01				;$BB9E08   |
	STA pending_dma_hdma_channels		;$BB9E0B   |
	RTS					;$BB9E0E  /

CODE_BB9E0F:
	JSR CODE_BBA8DD				;$BB9E0F  \
	LDX #$0000				;$BB9E12   |
	LDA #$0010				;$BB9E15   |
CODE_BB9E18:					;	   |
	STA $7E8012,x				;$BB9E18   |
	INX					;$BB9E1C   |
	INX					;$BB9E1D   |
	INX					;$BB9E1E   |
	CPX #$002D				;$BB9E1F   |
	BNE CODE_BB9E18				;$BB9E22   |
	SEP #$20				;$BB9E24   |
	LDX #$1102				;$BB9E26   |
	STX HDMA[1].settings			;$BB9E29   |
	LDX #$8012				;$BB9E2C   |
	STX HDMA[1].source			;$BB9E2F   |
	LDA #$7E				;$BB9E32   |
	STA HDMA[1].source_bank			;$BB9E34   |
	STZ HDMA[1].indirect_source_bank	;$BB9E37   |
	REP #$20				;$BB9E3A   |
	LDA #$0201				;$BB9E3C   |
	STA pending_dma_hdma_channels		;$BB9E3F   |
	LDA level_number			;$BB9E42   |
	CMP #$00BB				;$BB9E44   |
	BEQ CODE_BB9E51				;$BB9E47   |
	LDY #$00DA				;$BB9E49   |
	JSL CODE_BB83EF				;$BB9E4C   |
	RTS					;$BB9E50  /

CODE_BB9E51:
	LDY #$0120				;$BB9E51  \
	JSL CODE_BB83EF				;$BB9E54   |
	RTS					;$BB9E58  /

CODE_BB9E59:
	JSR CODE_BBA8DD				;$BB9E59  \
	LDA #$0000				;$BB9E5C   |
	STA $7E8012				;$BB9E5F   |
	LDA #$0001				;$BB9E63   |
	STA pending_dma_hdma_channels		;$BB9E66   |
	RTS					;$BB9E69  /

CODE_BB9E6A:
	JSR CODE_BBA8DD				;$BB9E6A  \
	LDA #$0001				;$BB9E6D   |
	STA pending_dma_hdma_channels		;$BB9E70   |
	RTS					;$BB9E73  /

CODE_BB9E74:
	LDA #$0004				;$BB9E74  \
	STA $78					;$BB9E77   |
	LDA #$0001				;$BB9E79   |
	STA pending_dma_hdma_channels		;$BB9E7C   |
	RTS					;$BB9E7F  /

CODE_BB9E80:
	JSR CODE_BBA8DD				;$BB9E80  \
	LDA #$007F				;$BB9E83   |
	STA $7E80E2				;$BB9E86   |
	LDA #$0007				;$BB9E8A   |
	STA $7E80E3				;$BB9E8D   |
	LDA #$0008				;$BB9E91   |
	STA $7E80E4				;$BB9E94   |
	LDA #$0007				;$BB9E98   |
	STA $7E80E5				;$BB9E9B   |
	LDA #$0030				;$BB9E9F   |
	STA $7E80E6				;$BB9EA2   |
	LDA #$0005				;$BB9EA6   |
	STA $7E80E7				;$BB9EA9   |
	LDA #$0001				;$BB9EAD   |
	STA $7E80E8				;$BB9EB0   |
	LDA #$0004				;$BB9EB4   |
	STA $7E80E9				;$BB9EB7   |
	LDA #$0000				;$BB9EBB   |
	STA $7E80EA				;$BB9EBE   |
	LDA #$0040				;$BB9EC2   |
	STA $7E886C				;$BB9EC5   |
	LDA #$00B6				;$BB9EC9   |
	STA $7E886D				;$BB9ECC   |
	LDA #$0040				;$BB9ED0   |
	STA $7E886F				;$BB9ED3   |
	LDA #$00B6				;$BB9ED7   |
	STA $7E8870				;$BB9EDA   |
	LDX #$0000				;$BB9EDE   |
CODE_BB9EE1:					;	   |
	LDA #$0004				;$BB9EE1   |
	STA $7E8872,x				;$BB9EE4   |
	LDA #$00B6				;$BB9EE8   |
	STA $7E8873,x				;$BB9EEB   |
	LDA #$0004				;$BB9EEF   |
	STA $7E8875,x				;$BB9EF2   |
	LDA #$00BA				;$BB9EF6   |
	STA $7E8876,x				;$BB9EF9   |
	LDA #$0004				;$BB9EFD   |
	STA $7E8878,x				;$BB9F00   |
	LDA #$00BE				;$BB9F04   |
	STA $7E8879,x				;$BB9F07   |
	LDA #$0004				;$BB9F0B   |
	STA $7E887B,x				;$BB9F0E   |
	LDA #$00C2				;$BB9F12   |
	STA $7E887C,x				;$BB9F15   |
	TXA					;$BB9F19   |
	CLC					;$BB9F1A   |
	ADC #$000C				;$BB9F1B   |
	TAX					;$BB9F1E   |
	CMP #$00A8				;$BB9F1F   |
	BNE CODE_BB9EE1				;$BB9F22   |
	LDA #$0000				;$BB9F24   |
	STA $7E8872,x				;$BB9F27   |
	LDA #$0040				;$BB9F2B   |
	STA $7E8012				;$BB9F2E   |
	LDA #$80D2				;$BB9F32   |
	STA $7E8013				;$BB9F35   |
	LDA #$0040				;$BB9F39   |
	STA $7E8015				;$BB9F3C   |
	LDA #$80D2				;$BB9F40   |
	STA $7E8016				;$BB9F43   |
	LDX #$0000				;$BB9F47   |
CODE_BB9F4A:					;	   |
	LDA #$0008				;$BB9F4A   |
	STA $7E8018,x				;$BB9F4D   |
	LDA #$80D2				;$BB9F51   |
	STA $7E8019,x				;$BB9F54   |
	LDA #$0008				;$BB9F58   |
	STA $7E801B,x				;$BB9F5B   |
	LDA #$80D6				;$BB9F5F   |
	STA $7E801C,x				;$BB9F62   |
	LDA #$0008				;$BB9F66   |
	STA $7E801E,x				;$BB9F69   |
	LDA #$80DA				;$BB9F6D   |
	STA $7E801F,x				;$BB9F70   |
	LDA #$0008				;$BB9F74   |
	STA $7E8021,x				;$BB9F77   |
	LDA #$80DE				;$BB9F7B   |
	STA $7E8022,x				;$BB9F7E   |
	TXA					;$BB9F82   |
	CLC					;$BB9F83   |
	ADC #$000C				;$BB9F84   |
	TAX					;$BB9F87   |
	CMP #$00A8				;$BB9F88   |
	BNE CODE_BB9F4A				;$BB9F8B   |
	LDA #$0000				;$BB9F8D   |
	STA $7E8018,x				;$BB9F90   |
	SEP #$20				;$BB9F94   |
	LDX #$2C00				;$BB9F96   |
	STX HDMA[6].settings			;$BB9F99   |
	LDX #$80E2				;$BB9F9C   |
	STX HDMA[6].source			;$BB9F9F   |
	LDA #$7E				;$BB9FA2   |
	STA HDMA[6].source_bank			;$BB9FA4   |
	STA HDMA[6].indirect_source_bank	;$BB9FA7   |
	LDX #$0D43				;$BB9FAA   |
	STX HDMA[2].settings			;$BB9FAD   |
	LDX #$886C				;$BB9FB0   |
	STX HDMA[2].source			;$BB9FB3   |
	LDA #$7E				;$BB9FB6   |
	STA HDMA[2].source_bank			;$BB9FB8   |
	STA HDMA[2].indirect_source_bank	;$BB9FBB   |
	LDX #$0F43				;$BB9FBE   |
	STX HDMA[3].settings			;$BB9FC1   |
	LDX #$8012				;$BB9FC4   |
	STX HDMA[3].source			;$BB9FC7   |
	LDA #$7E				;$BB9FCA   |
	STA HDMA[3].source_bank			;$BB9FCC   |
	STA HDMA[3].indirect_source_bank	;$BB9FCF   |
	LDX #$1142				;$BB9FD2   |
	STX HDMA[4].settings			;$BB9FD5   |
	LDX #$884B				;$BB9FD8   |
	STX HDMA[4].source			;$BB9FDB   |
	LDA #$7E				;$BB9FDE   |
	STA HDMA[4].source_bank			;$BB9FE0   |
	STA HDMA[4].indirect_source_bank	;$BB9FE3   |
	LDX #$1202				;$BB9FE6   |
	STX HDMA[7].settings			;$BB9FE9   |
	LDX #$8832				;$BB9FEC   |
	STX HDMA[7].source			;$BB9FEF   |
	LDA #$7E				;$BB9FF2   |
	STA HDMA[7].source_bank			;$BB9FF4   |
	STZ HDMA[7].indirect_source_bank	;$BB9FF7   |
	REP #$20				;$BB9FFA   |
	LDY #DATA_FF0FD2			;$BB9FFC   |
	JSL CODE_BB8418				;$BB9FFF   |
	JSR CODE_BBABE2				;$BBA003   |
	LDA #$DC01				;$BBA006   |
	STA pending_dma_hdma_channels		;$BBA009   |
	RTS					;$BBA00C  /

CODE_BBA00D:
	JSR CODE_BBA8DD				;$BBA00D  \
	SEP #$20				;$BBA010   |
	LDX #$1142				;$BBA012   |
	STX HDMA[1].settings			;$BBA015   |
	LDX #DATA_BBA07E			;$BBA018   |
	STX HDMA[1].source			;$BBA01B   |
	LDA #DATA_BBA07E>>16			;$BBA01E   |
	STA HDMA[1].source_bank			;$BBA020   |
	LDA #$7E				;$BBA023   |
	STA HDMA[1].indirect_source_bank	;$BBA025   |
	REP #$20				;$BBA028   |
	LDA #$0201				;$BBA02A   |
	STA pending_dma_hdma_channels		;$BBA02D   |
	RTS					;$BBA030  /

CODE_BBA031:
	JSR CODE_BBA8DD				;$BBA031  \
	LDA #$0024				;$BBA034   |
	STA $78					;$BBA037   |
	LDY #$0000				;$BBA039   |
	TYX					;$BBA03C   |
CODE_BBA03D:					;	   |
	LDA #$0002				;$BBA03D   |
	STA $7E80F2,x				;$BBA040   |
	TYA					;$BBA044   |
	CLC					;$BBA045   |
	ADC #$0002				;$BBA046   |
	AND #$001E				;$BBA049   |
	TAY					;$BBA04C   |
	CLC					;$BBA04D   |
	ADC #$80D2				;$BBA04E   |
	STA $7E80F3,x				;$BBA051   |
	INX					;$BBA055   |
	INX					;$BBA056   |
	INX					;$BBA057   |
	CPX #$0150				;$BBA058   |
	BNE CODE_BBA03D				;$BBA05B   |
	SEP #$20				;$BBA05D   |
	LDX #$0E42				;$BBA05F   |
	STX HDMA[1].settings			;$BBA062   |
	LDX #$80F2				;$BBA065   |
	STX HDMA[1].source			;$BBA068   |
	LDA #$7E				;$BBA06B   |
	STA HDMA[1].source_bank			;$BBA06D   |
	LDA #$7E				;$BBA070   |
	STA HDMA[1].indirect_source_bank	;$BBA072   |
	REP #$20				;$BBA075   |
	LDA #$0201				;$BBA077   |
	STA pending_dma_hdma_channels		;$BBA07A   |
	RTS					;$BBA07D  /

DATA_BBA07E:
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $02, $20, $80, $02, $1C, $80, $02, $1E
	db $80, $02, $1A, $80, $02, $18, $80, $02
	db $14, $80, $02, $16, $80, $02, $12, $80
	db $00


CODE_BBA1FF:
	LDA #$0024				;$BBA1FF  \
	STA $78					;$BBA202   |
	LDA #$0001				;$BBA204   |
	STA pending_dma_hdma_channels		;$BBA207   |
	RTS					;$BBA20A  /

CODE_BBA20B:
	LDA #$0024				;$BBA20B  \
	STA $78					;$BBA20E   |
	LDX #$0000				;$BBA210   |
CODE_BBA213:					;	   |
	LDA #$0010				;$BBA213   |
	STA $7E8012,x				;$BBA216   |
	LDA #$0000				;$BBA21A   |
	STA $7E8013,x				;$BBA21D   |
	INX					;$BBA221   |
	INX					;$BBA222   |
	INX					;$BBA223   |
	CPX #$0066				;$BBA224   |
	BNE CODE_BBA213				;$BBA227   |
	SEP #$20				;$BBA229   |
	LDX #$0F02				;$BBA22B   |
	STX HDMA[1].settings			;$BBA22E   |
	LDX #$8012				;$BBA231   |
	STX HDMA[1].source			;$BBA234   |
	LDA #$7E				;$BBA237   |
	STA HDMA[1].source_bank			;$BBA239   |
	STZ HDMA[1].indirect_source_bank	;$BBA23C   |
	REP #$20				;$BBA23F   |
	LDA #$0201				;$BBA241   |
	STA pending_dma_hdma_channels		;$BBA244   |
	LDY #$00DC				;$BBA247   |
	JSL CODE_BB83EF				;$BBA24A   |
	RTS					;$BBA24E  /

CODE_BBA24F:
	JSR CODE_BBA8DD				;$BBA24F  \
	LDX #$0000				;$BBA252   |
	TXY					;$BBA255   |
CODE_BBA256:					;	   |
	LDA #$0004				;$BBA256   |
	STA $7E8012,x				;$BBA259   |
	STA $7E85D2,x				;$BBA25D   |
	TYA					;$BBA261   |
	CLC					;$BBA262   |
	ADC #$80D2				;$BBA263   |
	STA $7E8013,x				;$BBA266   |
	CLC					;$BBA26A   |
	ADC #$0740				;$BBA26B   |
	STA $7E85D3,x				;$BBA26E   |
	TYA					;$BBA272   |
	CLC					;$BBA273   |
	ADC #$0002				;$BBA274   |
	AND #$001E				;$BBA277   |
	TAY					;$BBA27A   |
	TXA					;$BBA27B   |
	CLC					;$BBA27C   |
	ADC #$0003				;$BBA27D   |
	TAX					;$BBA280   |
	CPX #$00C0				;$BBA281   |
	BNE CODE_BBA256				;$BBA284   |
	LDX #$0000				;$BBA286   |
CODE_BBA289:					;	   |
	LDA #$009F				;$BBA289   |
	STA $7E80F2,x				;$BBA28C   |
	STA $7E810A,x				;$BBA290   |
	LDA #$8552				;$BBA294   |
	STA $7E80F3,x				;$BBA297   |
	CLC					;$BBA29B   |
	ADC #$0040				;$BBA29C   |
	STA $7E810B,x				;$BBA29F   |
	INX					;$BBA2A3   |
	INX					;$BBA2A4   |
	INX					;$BBA2A5   |
	CPX #$0018				;$BBA2A6   |
	BNE CODE_BBA289				;$BBA2A9   |
	SEP #$20				;$BBA2AB   |
	LDX #$0E42				;$BBA2AD   |
	STX HDMA[1].settings			;$BBA2B0   |
	LDX #$80F2				;$BBA2B3   |
	STX HDMA[1].source			;$BBA2B6   |
	LDA #$7E				;$BBA2B9   |
	STA HDMA[1].source_bank			;$BBA2BB   |
	STA HDMA[1].indirect_source_bank	;$BBA2BE   |
	REP #$20				;$BBA2C1   |
	SEP #$20				;$BBA2C3   |
	LDX #$0D42				;$BBA2C5   |
	STX HDMA[2].settings			;$BBA2C8   |
	LDX #$8012				;$BBA2CB   |
	STX HDMA[2].source			;$BBA2CE   |
	LDA #$7E				;$BBA2D1   |
	STA HDMA[2].source_bank			;$BBA2D3   |
	STA HDMA[2].indirect_source_bank	;$BBA2D6   |
	REP #$20				;$BBA2D9   |
	LDA #$0601				;$BBA2DB   |
	STA pending_dma_hdma_channels		;$BBA2DE   |
	RTS					;$BBA2E1  /

CODE_BBA2E2:
	JSR CODE_BBA8DD				;$BBA2E2  \
	LDA #$0001				;$BBA2E5   |
	STA $7E8332				;$BBA2E8   |
	LDA #$FF00				;$BBA2EC   |
	STA $7E8333				;$BBA2EF   |
	LDA #$0001				;$BBA2F3   |
	STA $7E8335				;$BBA2F6   |
	LDA #$FF00				;$BBA2FA   |
	STA $7E8336				;$BBA2FD   |
	LDA #$0001				;$BBA301   |
	STA $7E8338				;$BBA304   |
	LDA #$00FF				;$BBA308   |
	STA $7E8339				;$BBA30B   |
	LDA #$0000				;$BBA30F   |
	STA $7E833B				;$BBA312   |
	SEP #$20				;$BBA316   |
	LDX #$0E42				;$BBA318   |
	STX HDMA[1].settings			;$BBA31B   |
	LDX #DATA_BBA35F			;$BBA31E   |
	STX HDMA[1].source			;$BBA321   |
	LDA #DATA_BBA35F>>16			;$BBA324   |
	STA HDMA[1].source_bank			;$BBA326   |
	STZ HDMA[1].indirect_source_bank	;$BBA329   |
	LDX #$0D42				;$BBA32C   |
	STX HDMA[2].settings			;$BBA32F   |
	LDX #DATA_BBA408			;$BBA332   |
	STX HDMA[2].source			;$BBA335   |
	LDA #DATA_BBA408>>16			;$BBA338   |
	STA HDMA[2].source_bank			;$BBA33A   |
	LDA #$7E				;$BBA33D   |
	STA HDMA[2].indirect_source_bank	;$BBA33F   |
	LDX #$2601				;$BBA342   |
	STX HDMA[3].settings			;$BBA345   |
	LDX #$8332				;$BBA348   |
	STX HDMA[3].source			;$BBA34B   |
	LDA #$7E				;$BBA34E   |
	STA HDMA[3].source_bank			;$BBA350   |
	STZ HDMA[3].indirect_source_bank	;$BBA353   |
	REP #$20				;$BBA356   |
	LDA #$0E01				;$BBA358   |
	STA pending_dma_hdma_channels		;$BBA35B   |
	RTS					;$BBA35E  /

DATA_BBA35F:
	db $01, $C4, $17, $01, $C4, $17, $01, $C4
	db $17, $01, $C4, $17, $01, $C6, $17, $01
	db $C6, $17, $01, $C6, $17, $01, $C6, $17
	db $04, $C4, $17, $04, $C6, $17, $04, $C4
	db $17, $04, $C6, $17, $04, $C4, $17, $04
	db $C6, $17, $04, $C4, $17, $04, $C6, $17
	db $04, $C4, $17, $04, $C6, $17, $04, $C4
	db $17, $04, $C6, $17, $04, $C4, $17, $04
	db $C6, $17, $04, $C4, $17, $04, $C6, $17
	db $04, $C4, $17, $04, $C6, $17, $04, $C4
	db $17, $04, $C6, $17, $04, $C4, $17, $04
	db $C6, $17, $04, $C4, $17, $04, $C6, $17
	db $04, $C4, $17, $04, $C6, $17, $04, $C4
	db $17, $04, $C6, $17, $04, $C4, $17, $04
	db $C6, $17, $04, $C4, $17, $04, $C6, $17
	db $04, $C4, $17, $04, $C6, $17, $04, $C4
	db $17, $04, $C6, $17, $04, $C4, $17, $04
	db $C6, $17, $04, $C4, $17, $04, $C6, $17
	db $04, $C4, $17, $04, $C6, $17, $04, $C4
	db $17, $04, $C6, $17, $04, $C4, $17, $04
	db $C6, $17, $04, $C4, $17, $04, $C6, $17
	db $00

DATA_BBA408:
	db $FF, $13, $80, $C9, $11, $81, $00

DATA_BBA40F:
	db $FF, $A3, $81, $C9, $A1, $82, $00

CODE_BBA416:
	JSR CODE_BBA8DD				;$BBA416  \
	LDA #$007F				;$BBA419   |
	STA $7E80E2				;$BBA41C   |
	LDA #$0007				;$BBA420   |
	STA $7E80E3				;$BBA423   |
	LDA #$0008				;$BBA427   |
	STA $7E80E4				;$BBA42A   |
	LDA #$0007				;$BBA42E   |
	STA $7E80E5				;$BBA431   |
	LDA #$0030				;$BBA435   |
	STA $7E80E6				;$BBA438   |
	LDA #$0005				;$BBA43C   |
	STA $7E80E7				;$BBA43F   |
	LDA #$0001				;$BBA443   |
	STA $7E80E8				;$BBA446   |
	LDA #$0004				;$BBA44A   |
	STA $7E80E9				;$BBA44D   |
	LDA #$0000				;$BBA451   |
	STA $7E80EA				;$BBA454   |
	LDA #$0040				;$BBA458   |
	STA $7E886C				;$BBA45B   |
	LDA #$00B6				;$BBA45F   |
	STA $7E886D				;$BBA462   |
	LDA #$0040				;$BBA466   |
	STA $7E886F				;$BBA469   |
	LDA #$00B6				;$BBA46D   |
	STA $7E8870				;$BBA470   |
	LDX #$0000				;$BBA474   |
CODE_BBA477:					;	   |
	LDA #$0004				;$BBA477   |
	STA $7E8872,x				;$BBA47A   |
	LDA #$00B6				;$BBA47E   |
	STA $7E8873,x				;$BBA481   |
	LDA #$0004				;$BBA485   |
	STA $7E8875,x				;$BBA488   |
	LDA #$00BA				;$BBA48C   |
	STA $7E8876,x				;$BBA48F   |
	LDA #$0004				;$BBA493   |
	STA $7E8878,x				;$BBA496   |
	LDA #$00BE				;$BBA49A   |
	STA $7E8879,x				;$BBA49D   |
	LDA #$0004				;$BBA4A1   |
	STA $7E887B,x				;$BBA4A4   |
	LDA #$00C2				;$BBA4A8   |
	STA $7E887C,x				;$BBA4AB   |
	TXA					;$BBA4AF   |
	CLC					;$BBA4B0   |
	ADC #$000C				;$BBA4B1   |
	TAX					;$BBA4B4   |
	CMP #$00A8				;$BBA4B5   |
	BNE CODE_BBA477				;$BBA4B8   |
	LDA #$0000				;$BBA4BA   |
	STA $7E8872,x				;$BBA4BD   |
	LDA #$0040				;$BBA4C1   |
	STA $7E8012				;$BBA4C4   |
	LDA #$80D2				;$BBA4C8   |
	STA $7E8013				;$BBA4CB   |
	LDA #$0040				;$BBA4CF   |
	STA $7E8015				;$BBA4D2   |
	LDA #$80D2				;$BBA4D6   |
	STA $7E8016				;$BBA4D9   |
	LDX #$0000				;$BBA4DD   |
CODE_BBA4E0:					;	   |
	LDA #$0008				;$BBA4E0   |
	STA $7E8018,x				;$BBA4E3   |
	LDA #$80D2				;$BBA4E7   |
	STA $7E8019,x				;$BBA4EA   |
	LDA #$0008				;$BBA4EE   |
	STA $7E801B,x				;$BBA4F1   |
	LDA #$80D6				;$BBA4F5   |
	STA $7E801C,x				;$BBA4F8   |
	LDA #$0008				;$BBA4FC   |
	STA $7E801E,x				;$BBA4FF   |
	LDA #$80DA				;$BBA503   |
	STA $7E801F,x				;$BBA506   |
	LDA #$0008				;$BBA50A   |
	STA $7E8021,x				;$BBA50D   |
	LDA #$80DE				;$BBA511   |
	STA $7E8022,x				;$BBA514   |
	TXA					;$BBA518   |
	CLC					;$BBA519   |
	ADC #$000C				;$BBA51A   |
	TAX					;$BBA51D   |
	CMP #$00A8				;$BBA51E   |
	BNE CODE_BBA4E0				;$BBA521   |
	LDA #$0000				;$BBA523   |
	STA $7E8018,x				;$BBA526   |
	SEP #$20				;$BBA52A   |
	LDX #$2C00				;$BBA52C   |
	STX HDMA[6].settings			;$BBA52F   |
	LDX #$80E2				;$BBA532   |
	STX HDMA[6].source			;$BBA535   |
	LDA #$7E				;$BBA538   |
	STA HDMA[6].source_bank			;$BBA53A   |
	STA HDMA[6].indirect_source_bank	;$BBA53D   |
	LDX #$0D43				;$BBA540   |
	STX HDMA[2].settings			;$BBA543   |
	LDX #$886C				;$BBA546   |
	STX HDMA[2].source			;$BBA549   |
	LDA #$7E				;$BBA54C   |
	STA HDMA[2].source_bank			;$BBA54E   |
	STA HDMA[2].indirect_source_bank	;$BBA551   |
	LDX #$0F43				;$BBA554   |
	STX HDMA[3].settings			;$BBA557   |
	LDX #$8012				;$BBA55A   |
	STX HDMA[3].source			;$BBA55D   |
	LDA #$7E				;$BBA560   |
	STA HDMA[3].source_bank			;$BBA562   |
	STA HDMA[3].indirect_source_bank	;$BBA565   |
	LDX #$1142				;$BBA568   |
	STX HDMA[4].settings			;$BBA56B   |
	LDX #$884B				;$BBA56E   |
	STX HDMA[4].source			;$BBA571   |
	LDA #$7E				;$BBA574   |
	STA HDMA[4].source_bank			;$BBA576   |
	STA HDMA[4].indirect_source_bank	;$BBA579   |
	LDX #$1202				;$BBA57C   |
	STX HDMA[7].settings			;$BBA57F   |
	LDX #$8832				;$BBA582   |
	STX HDMA[7].source			;$BBA585   |
	LDA #$7E				;$BBA588   |
	STA HDMA[7].source_bank			;$BBA58A   |
	STZ HDMA[7].indirect_source_bank	;$BBA58D   |
	REP #$20				;$BBA590   |
	LDA #$1680				;$BBA592   |
	STA $0D4E				;$BBA595   |
	JSR CODE_BBABE2				;$BBA598   |
	LDY #DATA_FF0FD2			;$BBA59B   |
	JSL CODE_BB8418				;$BBA59E   |
	LDA #$DC01				;$BBA5A2   |
	STA pending_dma_hdma_channels		;$BBA5A5   |
	RTS					;$BBA5A8  /

CODE_BBA5A9:
	LDA $0515				;$BBA5A9  \
	CMP #$0003				;$BBA5AC   |
	BEQ CODE_BBA5BD				;$BBA5AF   |
	LDA #$001C				;$BBA5B1   |
	STA $78					;$BBA5B4   |
	LDA #$0001				;$BBA5B6   |
	STA pending_dma_hdma_channels		;$BBA5B9   |
	RTS					;$BBA5BC  /

CODE_BBA5BD:
	LDA #$0024				;$BBA5BD  \
	STA $78					;$BBA5C0   |
	LDA #$0001				;$BBA5C2   |
	STA pending_dma_hdma_channels		;$BBA5C5   |
	RTS					;$BBA5C8  /

CODE_BBA5C9:
	JSR CODE_BBA8DD				;$BBA5C9  \
	JSR CODE_BBA662				;$BBA5CC   |
	RTS					;$BBA5CF  /

CODE_BBA5D0:
	LDY #$0002				;$BBA5D0  \
	JSL CODE_BB842C				;$BBA5D3   |
	JSR CODE_BBA5E1				;$BBA5D7   |
CODE_BBA5DA:					;	   |
	JSR CODE_BBA8DD				;$BBA5DA   |
	JSR CODE_BBA662				;$BBA5DD   |
	RTS					;$BBA5E0  /

CODE_BBA5E1:
	LDA level_number			;$BBA5E1  \
	CMP #$0071				;$BBA5E3   |
	BNE CODE_BBA605				;$BBA5E6   |
	LDA $17BA				;$BBA5E8   |
	PHA					;$BBA5EB   |
	LDA $0911				;$BBA5EC   |
	PHA					;$BBA5EF   |
	STZ $0911				;$BBA5F0   |
	LDA #$1C31				;$BBA5F3   |
	STA $17BA				;$BBA5F6   |
	JSR CODE_BBA605				;$BBA5F9   |
	PLA					;$BBA5FC   |
	STA $0911				;$BBA5FD   |
	PLA					;$BBA600   |
	STA $17BA				;$BBA601   |
	RTS					;$BBA604  /

CODE_BBA605:
	LDA #$0100				;$BBA605  \
	STA $0911				;$BBA608   |
	LDX #$02FE				;$BBA60B   |
CODE_BBA60E:					;	   |
	LDA.l DATA_FD334E,x			;$BBA60E   |
	STA working_palette,x			;$BBA612   |
	DEX					;$BBA616   |
	DEX					;$BBA617   |
	BPL CODE_BBA60E				;$BBA618   |
	%pea_use_dbr(working_palette)		;$BBA61A   |
	PLB					;$BBA61D   |
	LDX #$0000				;$BBA61E   |
	TXY					;$BBA621   |
CODE_BBA622:					;	   |
	LDA working_palette,x			;$BBA622   |
	XBA					;$BBA626   |
	AND #$001F				;$BBA627   |
	STA $34					;$BBA62A   |
	LDA.l $7E892A,x				;$BBA62C   |
	AND #$03E0				;$BBA630   |
	TSB $34					;$BBA633   |
	LDA.l $7E892C,x				;$BBA635   |
	AND #$7C00				;$BBA639   |
	ORA $34					;$BBA63C   |
	STA.w primary_palette,y			;$BBA63E   |
	INY					;$BBA641   |
	INY					;$BBA642   |
	TXA					;$BBA643   |
	CLC					;$BBA644   |
	ADC #$0006				;$BBA645   |
	TAX					;$BBA648   |
	CPY #$0100				;$BBA649   |
	BNE CODE_BBA622				;$BBA64C   |
	PLB					;$BBA64E   |
CODE_BBA64F:					;	   |
	STZ $0913				;$BBA64F   |
	JSL CODE_80DD63				;$BBA652   |
	LDA $0913				;$BBA656   |
	BNE CODE_BBA64F				;$BBA659   |
	LDA #$0001				;$BBA65B   |
	STA $0913				;$BBA65E   |
	RTS					;$BBA661  /

CODE_BBA662:
	LDX #$0000				;$BBA662  \
	LDA #$0018				;$BBA665   |
	STA $7E8012				;$BBA668   |
	LDA #$0000				;$BBA66C   |
	STA $7E8013				;$BBA66F   |
	LDA #$0018				;$BBA673   |
	STA $7E8015				;$BBA676   |
	LDA #$0000				;$BBA67A   |
	STA $7E8016				;$BBA67D   |
	LDA #$0038				;$BBA681   |
	STA $7E8018				;$BBA684   |
	LDA #$0000				;$BBA688   |
	STA $7E8019				;$BBA68B   |
	LDX #$0009				;$BBA68F   |
	LDA #$00FF				;$BBA692   |
	STA $7E8012,x				;$BBA695   |
	LDA #$0001				;$BBA699   |
	STA $7E8013,x				;$BBA69C   |
	SEP #$20				;$BBA6A0   |
	LDX #$0F02				;$BBA6A2   |
	STX HDMA[1].settings			;$BBA6A5   |
	LDX #$8012				;$BBA6A8   |
	STX HDMA[1].source			;$BBA6AB   |
	LDA #$7E				;$BBA6AE   |
	STA HDMA[1].source_bank			;$BBA6B0   |
	STZ HDMA[1].indirect_source_bank	;$BBA6B3   |
	LDX #$3200				;$BBA6B6   |
	STX HDMA[2].settings			;$BBA6B9   |
	LDX #DATA_BBA6D3			;$BBA6BC   |
	STX HDMA[2].source			;$BBA6BF   |
	LDA #DATA_BBA6D3>>16			;$BBA6C2   |
	STA HDMA[2].source_bank			;$BBA6C4   |
	STZ HDMA[2].indirect_source_bank	;$BBA6C7   |
	REP #$20				;$BBA6CA   |
	LDA #$0601				;$BBA6CC   |
	STA pending_dma_hdma_channels		;$BBA6CF   |
	RTS					;$BBA6D2  /

DATA_BBA6D3:
	db $70, $E0, $07, $4C, $07, $4D, $07, $4E
	db $07, $4F, $07, $50, $07, $51, $07, $52
	db $07, $53, $07, $54, $07, $55, $07, $56
	db $07, $57, $07, $58, $07, $59, $07, $5A
	db $07, $5B, $07, $5C, $07, $5D, $07, $5E
	db $07, $5F, $07, $60, $07, $61, $07, $62
	db $07, $63, $07, $64, $07, $65, $07, $66
	db $07, $67, $07, $68, $07, $69, $07, $6A
	db $07, $6B, $07, $6C, $07, $6D, $07, $6E
	db $07, $6F, $07, $70, $07, $71, $07, $72
	db $07, $73, $00


CODE_BBA726:
	JSR CODE_BBA8DD				;$BBA726  \
	LDA #$0078				;$BBA729   |
	STA $7E80D2				;$BBA72C   |
	LDA #$0000				;$BBA730   |
	STA $7E80D3				;$BBA733   |
	LDA #$20C4				;$BBA737   |
	STA $7E80D5				;$BBA73A   |
	LDA #$0001				;$BBA73E   |
	STA $7E80D7				;$BBA741   |
	LDA #$0000				;$BBA745   |
	STA $7E80D8				;$BBA748   |
	LDA #$20C4				;$BBA74C   |
	STA $7E80DA				;$BBA74F   |
	LDA #$0001				;$BBA753   |
	STA $7E80DC				;$BBA756   |
	LDA #$0000				;$BBA75A   |
	STA $7E80DD				;$BBA75D   |
	LDA #$14A0				;$BBA761   |
	STA $7E80DF				;$BBA764   |
	LDA #$0000				;$BBA768   |
	STA $7E80E1				;$BBA76B   |
	LDA #$0040				;$BBA76F   |
	STA $7E886C				;$BBA772   |
	LDA #$00B6				;$BBA776   |
	STA $7E886D				;$BBA779   |
	LDA #$0040				;$BBA77D   |
	STA $7E886F				;$BBA780   |
	LDA #$00B6				;$BBA784   |
	STA $7E8870				;$BBA787   |
	LDX #$0000				;$BBA78B   |
CODE_BBA78E:					;	   |
	LDA #$0004				;$BBA78E   |
	STA $7E8872,x				;$BBA791   |
	LDA #$00B6				;$BBA795   |
	STA $7E8873,x				;$BBA798   |
	LDA #$0004				;$BBA79C   |
	STA $7E8875,x				;$BBA79F   |
	LDA #$00BA				;$BBA7A3   |
	STA $7E8876,x				;$BBA7A6   |
	LDA #$0004				;$BBA7AA   |
	STA $7E8878,x				;$BBA7AD   |
	LDA #$00BE				;$BBA7B1   |
	STA $7E8879,x				;$BBA7B4   |
	LDA #$0004				;$BBA7B8   |
	STA $7E887B,x				;$BBA7BB   |
	LDA #$00C2				;$BBA7BF   |
	STA $7E887C,x				;$BBA7C2   |
	TXA					;$BBA7C6   |
	CLC					;$BBA7C7   |
	ADC #$000C				;$BBA7C8   |
	TAX					;$BBA7CB   |
	CMP #$00A8				;$BBA7CC   |
	BNE CODE_BBA78E				;$BBA7CF   |
	LDA #$0000				;$BBA7D1   |
	STA $7E8872,x				;$BBA7D4   |
	LDA #$00F0				;$BBA7D8   |
	STA $7E80F2				;$BBA7DB   |
	LDA #$80F9				;$BBA7DF   |
	STA $7E80F3				;$BBA7E2   |
	LDA #$00F0				;$BBA7E6   |
	STA $7E80F5				;$BBA7E9   |
	LDA #$8169				;$BBA7ED   |
	STA $7E80F6				;$BBA7F0   |
	LDA #$0000				;$BBA7F4   |
	STA $7E80F8				;$BBA7F7   |
	LDX #$0000				;$BBA7FB   |
CODE_BBA7FE:					;	   |
	TXA					;$BBA7FE   |
	ASL A					;$BBA7FF   |
	BIT #$0100				;$BBA800   |
	BNE CODE_BBA808				;$BBA803   |
	EOR #$00FF				;$BBA805   |
CODE_BBA808:					;	   |
	AND #$00FF				;$BBA808   |
	CLC					;$BBA80B   |
	ADC #$0030				;$BBA80C   |
	CMP #$00FF				;$BBA80F   |
	BCC CODE_BBA817				;$BBA812   |
	LDA #$00FF				;$BBA814   |
CODE_BBA817:					;	   |
	STA $7E80F9,x				;$BBA817   |
	INX					;$BBA81B   |
	CPX #$00E2				;$BBA81C   |
	BNE CODE_BBA7FE				;$BBA81F   |
	LDA #$006F				;$BBA821   |
	STA $7E8832				;$BBA824   |
	LDA #$0000				;$BBA828   |
	STA $7E8833				;$BBA82B   |
	LDA.l glimmers_galleon_level_palette	;$BBA82F   |
	STA $7E8835				;$BBA833   |
	LDA #$006F				;$BBA837   |
	STA $7E8837				;$BBA83A   |
	LDA #$0000				;$BBA83E   |
	STA $7E8838				;$BBA841   |
	LDA.l glimmers_galleon_level_palette	;$BBA845   |
	STA $7E883A				;$BBA849   |
	LDA #$0001				;$BBA84D   |
	STA $7E883C				;$BBA850   |
	LDA #$0000				;$BBA854   |
	STA $7E883D				;$BBA857   |
	LDA #$0000				;$BBA85B   |
	STA $7E883F				;$BBA85E   |
	SEP #$20				;$BBA862   |
	LDX #$0D43				;$BBA864   |
	STX HDMA[1].settings			;$BBA867   |
	LDX #$886C				;$BBA86A   |
	STX HDMA[1].source			;$BBA86D   |
	LDA #$7E				;$BBA870   |
	STA HDMA[1].source_bank			;$BBA872   |
	STZ HDMA[1].indirect_source_bank	;$BBA875   |
	LDX #$2640				;$BBA878   |
	STX HDMA[2].settings			;$BBA87B   |
	LDX #$80F2				;$BBA87E   |
	STX HDMA[2].source			;$BBA881   |
	LDA #$7E				;$BBA884   |
	STA HDMA[2].source_bank			;$BBA886   |
	LDA #$80				;$BBA889   |
	STA HDMA[2].indirect_source_bank	;$BBA88B   |
	LDX #$2103				;$BBA88E   |
	STX HDMA[3].settings			;$BBA891   |
	LDX #$8832				;$BBA894   |
	STX HDMA[3].source			;$BBA897   |
	LDA #$7E				;$BBA89A   |
	STA HDMA[3].source_bank			;$BBA89C   |
	STA HDMA[3].indirect_source_bank	;$BBA89F   |
	LDX #$0F03				;$BBA8A2   |
	STX HDMA[5].settings			;$BBA8A5   |
	LDX #$8552				;$BBA8A8   |
	STX HDMA[5].source			;$BBA8AB   |
	LDA #$7E				;$BBA8AE   |
	STA HDMA[5].source_bank			;$BBA8B0   |
	STZ HDMA[5].indirect_source_bank	;$BBA8B3   |
	LDX #$0800				;$BBA8B6   |
	STX HDMA[6].settings			;$BBA8B9   |
	LDX #$8812				;$BBA8BC   |
	STX HDMA[6].source			;$BBA8BF   |
	LDA #$7E				;$BBA8C2   |
	STA HDMA[6].source_bank			;$BBA8C4   |
	STZ HDMA[6].indirect_source_bank	;$BBA8C7   |
	REP #$20				;$BBA8CA   |
	JSR CODE_BBABE2				;$BBA8CC   |
	LDY #DATA_FF0FD2			;$BBA8CF   |
	JSL CODE_BB8418				;$BBA8D2   |
	LDA #$6E01				;$BBA8D6   |
	STA pending_dma_hdma_channels		;$BBA8D9   |
	RTS					;$BBA8DC  /

CODE_BBA8DD:
	LDA #$002C				;$BBA8DD  \
	STA $78					;$BBA8E0   |
	RTS					;$BBA8E2  /

CODE_BBA8E3:
	JSR CODE_BBA9E0				;$BBA8E3  \
	LDA #$0000				;$BBA8E6   |
	STA $0911				;$BBA8E9   |
	LDA #$03E0				;$BBA8EC   |
	STA $0913				;$BBA8EF   |
	RTS					;$BBA8F2  /

CODE_BBA8F3:
	JSR CODE_BBA8DD				;$BBA8F3  \
	JSR CODE_BBA9F7				;$BBA8F6   |
	LDA #$7FFF				;$BBA8F9   |
	STA $0D4E				;$BBA8FC   |
	LDA #$7E01				;$BBA8FF   |
	STA pending_dma_hdma_channels		;$BBA902   |
	LDA #$007C				;$BBA905   |
	STA $7E80E2				;$BBA908   |
	LDA #$0211				;$BBA90C   |
	STA $7E80E3				;$BBA90F   |
	LDA #$0050				;$BBA913   |
	STA $7E80E5				;$BBA916   |
	LDA #$0215				;$BBA91A   |
	STA $7E80E6				;$BBA91D   |
	LDA #$0001				;$BBA921   |
	STA $7E80E8				;$BBA924   |
	LDA #$0314				;$BBA928   |
	STA $7E80E9				;$BBA92B   |
	LDA #$0000				;$BBA92F   |
	STA $7E80EB				;$BBA932   |
	LDA #$006C				;$BBA936   |
	STA $7E8832				;$BBA939   |
	LDA #$0020				;$BBA93D   |
	STA $7E8833				;$BBA940   |
	LDA #$0050				;$BBA944   |
	STA $7E8834				;$BBA947   |
	LDA #$0020				;$BBA94B   |
	STA $7E8835				;$BBA94E   |
	LDA #$0010				;$BBA952   |
	STA $7E8836				;$BBA955   |
	LDA #$0060				;$BBA959   |
	STA $7E8837				;$BBA95C   |
	LDA #$0001				;$BBA960   |
	STA $7E8838				;$BBA963   |
	LDA #$0020				;$BBA967   |
	STA $7E8839				;$BBA96A   |
	LDA #$0000				;$BBA96E   |
	STA $7E883A				;$BBA971   |
	LDA #$007C				;$BBA975   |
	STA $7E884B				;$BBA978   |
	LDA #$0050				;$BBA97C   |
	STA $7E884E				;$BBA97F   |
	LDA #$0001				;$BBA983   |
	STA $7E8851				;$BBA986   |
	LDA #$0000				;$BBA98A   |
	STA $7E8854				;$BBA98D   |
	SEP #$20				;$BBA991   |
	LDX #$3100				;$BBA993   |
	STX HDMA[2].settings			;$BBA996   |
	LDX #$8832				;$BBA999   |
	STX HDMA[2].source			;$BBA99C   |
	LDA #$7E				;$BBA99F   |
	STA HDMA[2].source_bank			;$BBA9A1   |
	STZ HDMA[2].indirect_source_bank	;$BBA9A4   |
	LDX #$2C01				;$BBA9A7   |
	STX HDMA[3].settings			;$BBA9AA   |
	LDX #$80E2				;$BBA9AD   |
	STX HDMA[3].source			;$BBA9B0   |
	LDA #$7E				;$BBA9B3   |
	STA HDMA[3].source_bank			;$BBA9B5   |
	STZ HDMA[3].indirect_source_bank	;$BBA9B8   |
	LDX #$1102				;$BBA9BB   |
	STX HDMA[4].settings			;$BBA9BE   |
	LDX #$884B				;$BBA9C1   |
	STX HDMA[4].source			;$BBA9C4   |
	LDA #$7E				;$BBA9C7   |
	STA HDMA[4].source_bank			;$BBA9C9   |
	STZ HDMA[4].indirect_source_bank	;$BBA9CC   |
	REP #$20				;$BBA9CF   |
	RTS					;$BBA9D1  /

CODE_BBA9D2:
	JSR CODE_BBA9E0				;$BBA9D2  \
	LDA #$81E0				;$BBA9D5   |
	STA $7E8865				;$BBA9D8   |
	JSR CODE_BBABE2				;$BBA9DC   |
	RTS					;$BBA9DF  /

CODE_BBA9E0:
	JSR CODE_BBA8DD				;$BBA9E0  \
	JSR CODE_BBA9F7				;$BBA9E3   |
	JSR CODE_BBABE2				;$BBA9E6   |
	LDY #DATA_FF0FD2			;$BBA9E9   |
	JSL CODE_BB8418				;$BBA9EC   |
	LDA #$FE01				;$BBA9F0   |
	STA pending_dma_hdma_channels		;$BBA9F3   |
	RTS					;$BBA9F6  /

CODE_BBA9F7:
	LDA #$0078				;$BBA9F7  \
	STA $7E80D2				;$BBA9FA   |
	LDA #$0000				;$BBA9FE   |
	STA $7E80D3				;$BBAA01   |
	LDA #$20C4				;$BBAA05   |
	STA $7E80D5				;$BBAA08   |
	LDA #$0001				;$BBAA0C   |
	STA $7E80D7				;$BBAA0F   |
	LDA #$0000				;$BBAA13   |
	STA $7E80D8				;$BBAA16   |
	LDA #$20C4				;$BBAA1A   |
	STA $7E80DA				;$BBAA1D   |
	LDA #$0001				;$BBAA21   |
	STA $7E80DC				;$BBAA24   |
	LDA #$0000				;$BBAA28   |
	STA $7E80DD				;$BBAA2B   |
	LDA #$14A0				;$BBAA2F   |
	STA $7E80DF				;$BBAA32   |
	LDA #$0000				;$BBAA36   |
	STA $7E80E1				;$BBAA39   |
	LDA #$007F				;$BBAA3D   |
	STA $7E80E2				;$BBAA40   |
	LDA #$0007				;$BBAA44   |
	STA $7E80E3				;$BBAA47   |
	LDA #$0008				;$BBAA4B   |
	STA $7E80E4				;$BBAA4E   |
	LDA #$0007				;$BBAA52   |
	STA $7E80E5				;$BBAA55   |
	LDA #$0030				;$BBAA59   |
	STA $7E80E6				;$BBAA5C   |
	LDA #$0005				;$BBAA60   |
	STA $7E80E7				;$BBAA63   |
	LDA #$0001				;$BBAA67   |
	STA $7E80E8				;$BBAA6A   |
	LDA #$0004				;$BBAA6E   |
	STA $7E80E9				;$BBAA71   |
	LDA #$0000				;$BBAA75   |
	STA $7E80EA				;$BBAA78   |
	LDA #$002C				;$BBAA7C   |
	STA $7E80F2				;$BBAA7F   |
	LDA #$0000				;$BBAA83   |
	STA $7E80F3				;$BBAA86   |
	LDA #$001E				;$BBAA8A   |
	STA $7E80F5				;$BBAA8D   |
	LDA #$0000				;$BBAA91   |
	STA $7E80F6				;$BBAA94   |
	LDA #$0026				;$BBAA98   |
	STA $7E80F8				;$BBAA9B   |
	LDA #$0000				;$BBAA9F   |
	STA $7E80F9				;$BBAAA2   |
	LDX #$0009				;$BBAAA6   |
	LDA #$00FF				;$BBAAA9   |
	STA $7E80F2,x				;$BBAAAC   |
	LDA #$0001				;$BBAAB0   |
	STA $7E80F3,x				;$BBAAB3   |
	LDA #$00F8				;$BBAAB7   |
	STA $7E8864				;$BBAABA   |
	LDA #$8000				;$BBAABE   |
	STA $7E8865				;$BBAAC1   |
	LDA #$0001				;$BBAAC5   |
	STA $7E8867				;$BBAAC8   |
	LDA #$0911				;$BBAACC   |
	STA $7E8868				;$BBAACF   |
	LDA #$0000				;$BBAAD3   |
	STA $7E886A				;$BBAAD6   |
	LDA #$0000				;$BBAADA   |
	STA $0911				;$BBAADD   |
	LDA #$1440				;$BBAAE0   |
	STA $0913				;$BBAAE3   |
	LDA #$0040				;$BBAAE6   |
	STA $7E886C				;$BBAAE9   |
	LDA #$00B6				;$BBAAED   |
	STA $7E886D				;$BBAAF0   |
	LDA #$0040				;$BBAAF4   |
	STA $7E886F				;$BBAAF7   |
	LDA #$00B6				;$BBAAFB   |
	STA $7E8870				;$BBAAFE   |
	LDX #$0000				;$BBAB02   |
CODE_BBAB05:					;	   |
	LDA #$0004				;$BBAB05   |
	STA $7E8872,x				;$BBAB08   |
	LDA #$00B6				;$BBAB0C   |
	STA $7E8873,x				;$BBAB0F   |
	LDA #$0004				;$BBAB13   |
	STA $7E8875,x				;$BBAB16   |
	LDA #$00BA				;$BBAB1A   |
	STA $7E8876,x				;$BBAB1D   |
	LDA #$0004				;$BBAB21   |
	STA $7E8878,x				;$BBAB24   |
	LDA #$00BE				;$BBAB28   |
	STA $7E8879,x				;$BBAB2B   |
	LDA #$0004				;$BBAB2F   |
	STA $7E887B,x				;$BBAB32   |
	LDA #$00C2				;$BBAB36   |
	STA $7E887C,x				;$BBAB39   |
	TXA					;$BBAB3D   |
	CLC					;$BBAB3E   |
	ADC #$000C				;$BBAB3F   |
	TAX					;$BBAB42   |
	CMP #$00A8				;$BBAB43   |
	BNE CODE_BBAB05				;$BBAB46   |
	LDA #$0000				;$BBAB48   |
	STA $7E8872,x				;$BBAB4B   |
	SEP #$20				;$BBAB4F   |
	LDX #$0D43				;$BBAB51   |
	STX HDMA[1].settings			;$BBAB54   |
	LDX #$886C				;$BBAB57   |
	STX HDMA[1].source			;$BBAB5A   |
	LDA #$7E				;$BBAB5D   |
	STA HDMA[1].source_bank			;$BBAB5F   |
	STA HDMA[1].indirect_source_bank	;$BBAB62   |
	LDX #$2143				;$BBAB65   |
	STX HDMA[2].settings			;$BBAB68   |
	LDX #$8864				;$BBAB6B   |
	STX HDMA[2].source			;$BBAB6E   |
	LDA #$7E				;$BBAB71   |
	STA HDMA[2].source_bank			;$BBAB73   |
	LDA #$80				;$BBAB76   |
	STA HDMA[2].indirect_source_bank	;$BBAB78   |
	LDX #$2C00				;$BBAB7B   |
	STX HDMA[3].settings			;$BBAB7E   |
	LDX #$80E2				;$BBAB81   |
	STX HDMA[3].source			;$BBAB84   |
	LDA #$7E				;$BBAB87   |
	STA HDMA[3].source_bank			;$BBAB89   |
	STZ HDMA[3].indirect_source_bank	;$BBAB8C   |
	LDX #$1142				;$BBAB8F   |
	STX HDMA[4].settings			;$BBAB92   |
	LDX #$884B				;$BBAB95   |
	STX HDMA[4].source			;$BBAB98   |
	LDA #$7E				;$BBAB9B   |
	STA HDMA[4].source_bank			;$BBAB9D   |
	STA HDMA[4].indirect_source_bank	;$BBABA0   |
	LDX #$0F03				;$BBABA3   |
	STX HDMA[5].settings			;$BBABA6   |
	LDX #$8552				;$BBABA9   |
	STX HDMA[5].source			;$BBABAC   |
	LDA #$7E				;$BBABAF   |
	STA HDMA[5].source_bank			;$BBABB1   |
	STZ HDMA[5].indirect_source_bank	;$BBABB4   |
	LDX #$0800				;$BBABB7   |
	STX HDMA[6].settings			;$BBABBA   |
	LDX #$8812				;$BBABBD   |
	STX HDMA[6].source			;$BBABC0   |
	LDA #$7E				;$BBABC3   |
	STA HDMA[6].source_bank			;$BBABC5   |
	STZ HDMA[6].indirect_source_bank	;$BBABC8   |
	LDX #$1202				;$BBABCB   |
	STX HDMA[7].settings			;$BBABCE   |
	LDX #$8832				;$BBABD1   |
	STX HDMA[7].source			;$BBABD4   |
	LDA #$7E				;$BBABD7   |
	STA HDMA[7].source_bank			;$BBABD9   |
	STZ HDMA[7].indirect_source_bank	;$BBABDC   |
	REP #$20				;$BBABDF   |
	RTS					;$BBABE1  /

CODE_BBABE2:
	LDA $17C0				;$BBABE2  \
	CLC					;$BBABE5   |
	ADC #$0020				;$BBABE6   |
	STA $0D4E				;$BBABE9   |
	LDX #$FFFE				;$BBABEC   |
	SEP #$20				;$BBABEF   |
	LDA level_number			;$BBABF1   |
	DEC A					;$BBABF3   |
CODE_BBABF4:					;	   |
	INX					;$BBABF4   |
	INX					;$BBABF5   |
	CMP.l DATA_BBAC4A,x			;$BBABF6   |
	BCS CODE_BBABF4				;$BBABFA   |
	EOR #$FF				;$BBABFC   |
	ADC.l DATA_BBAC4A,x			;$BBABFE   |
	REP #$20				;$BBAC02   |
	BNE CODE_BBAC40				;$BBAC04   |
	LDA.l DATA_BBAC4B,x			;$BBAC06   |
	AND #$00FF				;$BBAC0A   |
	CLC					;$BBAC0D   |
	ADC $08A6				;$BBAC0E   |
	ASL A					;$BBAC11   |
	TAX					;$BBAC12   |
	LDA.l DATA_BBAC76,x			;$BBAC13   |
	BMI CODE_BBAC23				;$BBAC17   |
	STA $0D52				;$BBAC19   |
	LDA #$8000				;$BBAC1C   |
	STA $0D4A				;$BBAC1F   |
	RTS					;$BBAC22  /

CODE_BBAC23:
	EOR #$FFFF				;$BBAC23  \
	INC A					;$BBAC26   |
	STA $0D54				;$BBAC27   |
	LDA #$FF40				;$BBAC2A   |
	STA $0D4A				;$BBAC2D   |
	STA $0D50				;$BBAC30   |
	LDA #$012B				;$BBAC33   |
	STA $0D52				;$BBAC36   |
	LDA $08C2				;$BBAC39   |
	STA $0D56				;$BBAC3C   |
	RTS					;$BBAC3F  /

CODE_BBAC40:
	LDA #$F000				;$BBAC40  \
	STA $0D54				;$BBAC43   |
	STZ $0D4A				;$BBAC46   |
	RTS					;$BBAC49  /

DATA_BBAC4A:
	db $01

DATA_BBAC4B:
	db $00, $0A, $05, $14, $0A, $15, $0E, $62
	db $13, $68, $1A, $69, $1B, $6C, $1C, $6E
	db $21, $7A, $25, $7E, $26, $7F, $27, $81
	db $28, $82, $29, $83, $2A, $84, $2B, $8F
	db $2C, $90, $31, $92, $32, $93, $33, $B7
	db $34, $B8, $35

DATA_BBAC76:
	db $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $17, $E0, $0E, $E0, $0E
	db $80, $02, $80, $02, $B8, $07, $50, $05
	db $30, $02, $F8, $01, $10, $07, $70, $04
	db $60, $05, $10, $03, $10, $03, $0B, $D0
	db $AB, $E5, $C0, $DF, $80, $EC, $20, $F1
	db $30, $F7, $D5, $FE, $58, $02, $F0, $02
	db $B0, $05, $B0, $02, $30, $06, $70, $03
	db $48, $04, $B0, $27, $F0, $14, $68, $02
	db $68, $02, $00, $10, $00, $10, $00, $10
	db $00, $01, $00, $01, $00, $01, $00, $01
	db $80, $08, $70, $03, $50, $08, $80, $03
	db $D0, $01, $D0, $03, $30, $02, $60, $01
	db $00, $FD, $B0, $F4

CODE_BBACE2:
	LDA #$0006				;$BBACE2   |
	STA $88					;$BBACE5   |
	LDA #$FFFC				;$BBACE7   |
	STA $0BA4				;$BBACEA   |
	RTS					;$BBACED  /

CODE_BBACEE:
	LDA #$0005				;$BBACEE   |
	STA $88					;$BBACF1   |
	LDA #$FFFC				;$BBACF3   |
	STA $0BA4				;$BBACF6   |
	RTS					;$BBACF9  /

CODE_BBACFA:
	LDA #$0005				;$BBACFA   |
	STA $88					;$BBACFD   |
	LDA #$FFFC				;$BBACFF   |
	STA $0BA4				;$BBAD02   |
	RTS					;$BBAD05  /

CODE_BBAD06:
	JSR CODE_BBAD34				;$BBAD06   |
	LDA $08FC				;$BBAD09   |
	AND #$0003				;$BBAD0C   |
	BNE CODE_BBAD18				;$BBAD0F   |
	LDA #$0001				;$BBAD11   |
	JSL CODE_BBC16B				;$BBAD14   |
CODE_BBAD18:					;	   |
	RTS					;$BBAD18  /

CODE_BBAD19:
	JSR CODE_BBAD34				;$BBAD19   |
	LDA #$0004				;$BBAD1C   |
	BIT $08C4				;$BBAD1F   |
	BNE CODE_BBAD2C				;$BBAD22   |
	LDA #$0002				;$BBAD24   |
	JSL CODE_BBC16B				;$BBAD27   |
	RTS					;$BBAD2B  /

CODE_BBAD2C:
	LDA #$0009				;$BBAD2C  \
	JSL CODE_BBC16B				;$BBAD2F   |
	RTS					;$BBAD33  /

CODE_BBAD34:
	LDA #$6682				;$BBAD34  \
	JSL CODE_BB8A65				;$BBAD37   |
	LDA #main_sprite_table_end		;$BBAD3B   |
	STA $66					;$BBAD3E   |
	LDY #$000E				;$BBAD40   |
	JSL CODE_BB842C				;$BBAD43   |
	LDX alternate_sprite			;$BBAD47   |
	STX current_sprite			;$BBAD49   |
	JSR CODE_BBAEB0				;$BBAD4B   |
	LDA #$0004				;$BBAD4E   |
	JSL CODE_B9D0B8				;$BBAD51   |
	JSR CODE_BBAEBD				;$BBAD55   |
	LDA.l DATA_FF0040			;$BBAD58   |
	STA $16BA				;$BBAD5C   |
	LDA.l DATA_FF0042			;$BBAD5F   |
	STA $16BC				;$BBAD63   |
	LDA #$16D8				;$BBAD66   |
	STA $66					;$BBAD69   |
	LDY #$0010				;$BBAD6B   |
	JSL CODE_BB842C				;$BBAD6E   |
	LDX alternate_sprite			;$BBAD72   |
	STX current_sprite			;$BBAD74   |
	JSR CODE_BBAEB0				;$BBAD76   |
	LDA #$0004				;$BBAD79   |
	JSL CODE_B9D0B8				;$BBAD7C   |
	JSR CODE_BBAEBD				;$BBAD80   |
	LDA.l DATA_FF012A			;$BBAD83   |
	STA $16E0				;$BBAD87   |
	LDA.l DATA_FF012C			;$BBAD8A   |
	STA $16E2				;$BBAD8E   |
	JSR CODE_BBADDC				;$BBAD91   |
	JSR CODE_BBAD98				;$BBAD94   |
	RTS					;$BBAD97  /

CODE_BBAD98:
	LDA level_number			;$BBAD98  \
	CMP #$0009				;$BBAD9A   |
	BEQ CODE_BBADB4				;$BBAD9D   |
	CMP #$000D				;$BBAD9F   |
	BEQ CODE_BBADBC				;$BBADA2   |
	CMP #$0021				;$BBADA4   |
	BEQ CODE_BBADC4				;$BBADA7   |
	CMP #$0063				;$BBADA9   |
	BEQ CODE_BBADCC				;$BBADAC   |
	CMP #$006B				;$BBADAE   |
	BEQ CODE_BBADD4				;$BBADB1   |
	RTS					;$BBADB3  /

CODE_BBADB4:
	LDA #$0005				;$BBADB4  \
	JSL CODE_BBC16B				;$BBADB7   |
	RTS					;$BBADBB  /

CODE_BBADBC:
	LDA #$0006				;$BBADBC  \
	JSL CODE_BBC16B				;$BBADBF   |
	RTS					;$BBADC3  /

CODE_BBADC4:
	LDA #$0007				;$BBADC4  \
	JSL CODE_BBC16B				;$BBADC7   |
	RTS					;$BBADCB  /

CODE_BBADCC:
	LDA #$0008				;$BBADCC  \
	JSL CODE_BBC16B				;$BBADCF   |
	RTS					;$BBADD3  /

CODE_BBADD4:
	LDA #$000A				;$BBADD4  \
	JSL CODE_BBC16B				;$BBADD7   |
	RTS					;$BBADDB  /

CODE_BBADDC:
	JSR CODE_BBAE92				;$BBADDC  \
	LDX $0597				;$BBADDF   |
	LDA #$0000				;$BBADE2   |
	STA $30,x				;$BBADE5   |
	LDA #$00D8				;$BBADE7   |
	STA $02,x				;$BBADEA   |
	LDX $0593				;$BBADEC   |
	LDA #$001E				;$BBADEF   |
	STA $30,x				;$BBADF2   |
	LDA #$00E4				;$BBADF4   |
	STA $02,x				;$BBADF7   |
	LDA $6E					;$BBADF9   |
	BNE CODE_BBAE28				;$BBADFB   |
CODE_BBADFD:					;	   |
	LDX $0597				;$BBADFD   |
	LDA $08C2				;$BBAE00   |
	AND #$4000				;$BBAE03   |
	BEQ CODE_BBAE23				;$BBAE06   |
	LDA $06,x				;$BBAE08   |
	SEC					;$BBAE0A   |
	SBC #$0020				;$BBAE0B   |
	STA $06,x				;$BBAE0E   |
	LDA #$0022				;$BBAE10   |
	STA $2E,x				;$BBAE13   |
	LDA #$001F				;$BBAE15   |
	LDX #$0003				;$BBAE18   |
	LDY #$0000				;$BBAE1B   |
	JSL CODE_B8D8D1				;$BBAE1E   |
	RTS					;$BBAE22  /

CODE_BBAE23:
	JSL CODE_B8B83F				;$BBAE23  \
	RTS					;$BBAE27  /

CODE_BBAE28:
	LDA current_player_mount		;$BBAE28  \
	BEQ CODE_BBAE62				;$BBAE2A   |
	LDA $6E					;$BBAE2C   |
	SEC					;$BBAE2E   |
	SBC #$0190				;$BBAE2F   |
	LSR A					;$BBAE32   |
	AND #$000E				;$BBAE33   |
	TAX					;$BBAE36   |
	LDA.l DATA_FF0D64,x			;$BBAE37   |
	TAY					;$BBAE3B   |
	JSL CODE_BB8432				;$BBAE3C   |
	BCC CODE_BBAE4A				;$BBAE40   |
	LDA #$0010				;$BBAE42   |
	JSL throw_exception			;$BBAE45   |
	RTS					;$BBAE49  /

CODE_BBAE4A:
	LDX alternate_sprite			;$BBAE4A  \
	STX current_player_mount		;$BBAE4C   |
	STX current_sprite			;$BBAE4E   |
	LDA #$0001				;$BBAE50   |
	STA $2E,x				;$BBAE53   |
	LDA #$004F				;$BBAE55   |
	JSL CODE_B9D04B				;$BBAE58   |
	JSL CODE_B893DB				;$BBAE5C   |
	BRA CODE_BBADFD				;$BBAE60  /

CODE_BBAE62:
	JSL CODE_B8808E				;$BBAE62  \
	LDA $6E					;$BBAE66   |
	CMP #$01A0				;$BBAE68   |
	BEQ CODE_BBAE73				;$BBAE6B   |
	JSL CODE_B8B9B8				;$BBAE6D   |
	BRA CODE_BBAE77				;$BBAE71  /

CODE_BBAE73:
	JSL CODE_B8B6DC				;$BBAE73  \
CODE_BBAE77:					;	   |
	LDX $0597				;$BBAE77   |
	JSL CODE_B8B83F				;$BBAE7A   |
	LDA $08C2				;$BBAE7E   |
	AND #$4000				;$BBAE81   |
	BEQ CODE_BBAE91				;$BBAE84   |
	JSL CODE_B39118				;$BBAE86   |
	LDX alternate_sprite			;$BBAE8A   |
	LDA #$0005				;$BBAE8C   |
	STA $2E,x				;$BBAE8F   |
CODE_BBAE91:					;	   |
	RTS					;$BBAE91  /

CODE_BBAE92:
	LDA $0550				;$BBAE92  \
	AND #$0002				;$BBAE95   |
	BNE CODE_BBAE9B				;$BBAE98   |
	RTS					;$BBAE9A  /

CODE_BBAE9B:
	LDX $0593				;$BBAE9B  \
	JSR CODE_BBAEA8				;$BBAE9E   |
	LDX $0597				;$BBAEA1   |
	JSR CODE_BBAEA8				;$BBAEA4   |
	RTS					;$BBAEA7  /

CODE_BBAEA8:
	LDA $12,x				;$BBAEA8  \
	ORA #$4000				;$BBAEAA   |
	STA $12,x				;$BBAEAD   |
	RTS					;$BBAEAF  /

CODE_BBAEB0:
	LDX current_sprite			;$BBAEB0  \
	LDA $0533				;$BBAEB2   |
	STA $06,x				;$BBAEB5   |
	LDA $0535				;$BBAEB7   |
	STA $0A,x				;$BBAEBA   |
	RTS					;$BBAEBC  /

CODE_BBAEBD:
	LDA current_sprite			;$BBAEBD  \
	CMP $0593				;$BBAEBF   |
	BNE CODE_BBAEC8				;$BBAEC2   |
	LDA $6E					;$BBAEC4   |
	BNE CODE_BBAEEB				;$BBAEC6   |
CODE_BBAEC8:					;	   |
	LDX current_sprite			;$BBAEC8   |
	LDA $00,x				;$BBAECA   |
	CMP #$00E4				;$BBAECC   |
	BNE CODE_BBAEE3				;$BBAECF   |
	LDA #$0001				;$BBAED1   |
	JSR CODE_BB8A69				;$BBAED4   |
CODE_BBAED7:					;	   |
	LDX current_sprite			;$BBAED7   |
	EOR $12,x				;$BBAED9   |
	AND #$0E00				;$BBAEDB   |
	EOR $12,x				;$BBAEDE   |
	STA $12,x				;$BBAEE0   |
	RTS					;$BBAEE2  /

CODE_BBAEE3:
	LDA #$0004				;$BBAEE3  \
	JSR CODE_BB8A69				;$BBAEE6   |
	BRA CODE_BBAED7				;$BBAEE9  /

CODE_BBAEEB:
	STA $32					;$BBAEEB  \
	LDA current_player_mount		;$BBAEED   |
	BNE CODE_BBAEC8				;$BBAEEF   |
	LDA $32					;$BBAEF1   |
	SEC					;$BBAEF3   |
	SBC #$0190				;$BBAEF4   |
	LSR A					;$BBAEF7   |
	TAX					;$BBAEF8   |
	LDA.l DATA_BBAF02,x			;$BBAEF9   |
	JSR CODE_BB8A69				;$BBAEFD   |
	BRA CODE_BBAED7				;$BBAF00  /

DATA_BBAF02:
	db $05, $00, $0D, $00, $0F, $00, $43, $00
	db $60, $00


CODE_BBAF0C:
	LDX #$0515				;$BBAF0C  \
CODE_BBAF0F:					;	   |
	STA $34					;$BBAF0F   |
	XBA					;$BBAF11   |
	AND #$00FF				;$BBAF12   |
	STA $32					;$BBAF15   |
	LDA $34					;$BBAF17   |
	AND #$00FF				;$BBAF19   |
	ASL A					;$BBAF1C   |
	TAY					;$BBAF1D   |
	PHB					;$BBAF1E   |
	%pea_shift_dbr(DATA_FD0000)		;$BBAF1F   |
	PLB					;$BBAF22   |
	PLB					;$BBAF23   |
	LDA.w DATA_FD0000,y			;$BBAF24   |
	TAY					;$BBAF27   |
	LDA.w DATA_FD0000,y			;$BBAF28   |
	INY					;$BBAF2B   |
	INY					;$BBAF2C   |
	STA $00,x				;$BBAF2D   |
	CMP #$0000				;$BBAF2F   |
	BEQ CODE_BBAF65				;$BBAF32   |
	CMP #$0001				;$BBAF34   |
	BEQ CODE_BBAF58				;$BBAF37   |
	CMP #$0002				;$BBAF39   |
	BEQ CODE_BBAF65				;$BBAF3C   |
	CMP #$0003				;$BBAF3E   |
	BEQ CODE_BBAF65				;$BBAF41   |
	CMP #$0004				;$BBAF43   |
	BEQ CODE_BBAF55				;$BBAF46   |
	CMP #$0005				;$BBAF48   |
	BEQ CODE_BBAF55				;$BBAF4B   |
	CMP #$0006				;$BBAF4D   |
	BEQ CODE_BBAF65				;$BBAF50   |
CODE_BBAF52:					;	   |
	PLB					;$BBAF52   |
	CLC					;$BBAF53   |
	RTL					;$BBAF54  /

CODE_BBAF55:
	PLB					;$BBAF55  \
	SEC					;$BBAF56   |
	RTL					;$BBAF57  /

CODE_BBAF58:
	LDA.w DATA_FD0000,y			;$BBAF58  \
	INY					;$BBAF5B   |
	AND #$00FF				;$BBAF5C   |
	SEP #$20				;$BBAF5F   |
	STA $18,x				;$BBAF61   |
	REP #$20				;$BBAF63   |
CODE_BBAF65:					;	   |
	JSR CODE_BBAFE1				;$BBAF65   |
	JSR CODE_BBB05C				;$BBAF68   |
	JSR CODE_BBB066				;$BBAF6B   |
	TYA					;$BBAF6E   |
	STA $1C,x				;$BBAF6F   |
	STZ $26,x				;$BBAF71   |
	LDA $32					;$BBAF73   |
	BRA CODE_BBAF7F				;$BBAF75  /

CODE_BBAF77:
	INC $26,x				;$BBAF77  \
	TYA					;$BBAF79   |
	CLC					;$BBAF7A   |
	ADC #$0005				;$BBAF7B   |
	TAY					;$BBAF7E   |
CODE_BBAF7F:					;	   |
	LDA.w DATA_FD0005,y			;$BBAF7F   |
	AND #$00FF				;$BBAF82   |
	CMP #$00FF				;$BBAF85   |
	BEQ CODE_BBAF8E				;$BBAF88   |
	DEC $32					;$BBAF8A   |
	BPL CODE_BBAF77				;$BBAF8C   |
CODE_BBAF8E:					;	   |
	LDA.w DATA_FD0000,y			;$BBAF8E   |
	SEP #$20				;$BBAF91   |
	STA $3B,x				;$BBAF93   |
	REP #$20				;$BBAF95   |
	LDA $38					;$BBAF97   |
	AND #$00FF				;$BBAF99   |
	STA $10,x				;$BBAF9C   |
	LDA $36					;$BBAF9E   |
	PHY					;$BBAFA0   |
	TAY					;$BBAFA1   |
	JSR CODE_BBB015				;$BBAFA2   |
	JSR CODE_BBB034				;$BBAFA5   |
	JSR CODE_BBB002				;$BBAFA8   |
	JSR CODE_BBB043				;$BBAFAB   |
	JSR CODE_BBB052				;$BBAFAE   |
	JSR CODE_BBB077				;$BBAFB1   |
	PLY					;$BBAFB4   |
	LDA.w DATA_FD0001,y			;$BBAFB5   |
	STA $1E,x				;$BBAFB8   |
	LDA.w DATA_FD0003,y			;$BBAFBA   |
	STA $20,x				;$BBAFBD   |
	BRA CODE_BBAFC3				;$BBAFBF  /

CODE_BBAFC1:
	INC $26,x				;$BBAFC1  \
CODE_BBAFC3:					;	   |
	TYA					;$BBAFC3   |
	CLC					;$BBAFC4   |
	ADC #$0005				;$BBAFC5   |
	TAY					;$BBAFC8   |
	LDA.w DATA_FD0000,y			;$BBAFC9   |
	AND #$00FF				;$BBAFCC   |
	CMP #$00FF				;$BBAFCF   |
	BNE CODE_BBAFC1				;$BBAFD2   |
	INY					;$BBAFD4   |
	JSR CODE_BBB095				;$BBAFD5   |
	JSR CODE_BBB07F				;$BBAFD8   |
	JSR CODE_BBB08F				;$BBAFDB   |
	BRL CODE_BBAF52				;$BBAFDE  /

CODE_BBAFE1:
	LDA.w DATA_FD0000,y			;$BBAFE1  \
	INY					;$BBAFE4   |
	INY					;$BBAFE5   |
	STA $36					;$BBAFE6   |
	LDA.w DATA_FD0000,y			;$BBAFE8   |
	INY					;$BBAFEB   |
	STA $38					;$BBAFEC   |
CODE_BBAFEE:					;	   |
	LDA.w DATA_FD0000,y			;$BBAFEE   |
	BEQ CODE_BBAFFF				;$BBAFF1   |
	INY					;$BBAFF3   |
	INY					;$BBAFF4   |
	STA $39					;$BBAFF5   |
	LDA.w DATA_FD0000,y			;$BBAFF7   |
	INY					;$BBAFFA   |
	STA $3B					;$BBAFFB   |
	BRA CODE_BBAFEE				;$BBAFFD  /

CODE_BBAFFF:
	INY					;$BBAFFF  \
	INY					;$BBB000   |
	RTS					;$BBB001  /

CODE_BBB002:
	LDA.w DATA_FD0000,y			;$BBB002  \
	INY					;$BBB005   |
	INY					;$BBB006   |
	PHA					;$BBB007   |
	AND #$00FF				;$BBB008   |
	STA $22,x				;$BBB00B   |
	PLA					;$BBB00D   |
	XBA					;$BBB00E   |
	AND #$00FF				;$BBB00F   |
	STA $24,x				;$BBB012   |
	RTS					;$BBB014  /

CODE_BBB015:
	LDA.w DATA_FD0000,y			;$BBB015  \
	INY					;$BBB018   |
	INY					;$BBB019   |
	STA $02,x				;$BBB01A   |
	LDA.w DATA_FD0000,y			;$BBB01C   |
	INY					;$BBB01F   |
	INY					;$BBB020   |
	STA $04,x				;$BBB021   |
	LDA.w DATA_FD0000,y			;$BBB023   |
	INY					;$BBB026   |
	INY					;$BBB027   |
	STA $06,x				;$BBB028   |
	LDA.w DATA_FD0000,y			;$BBB02A   |
	INY					;$BBB02D   |
	INY					;$BBB02E   |
	STA $000A8E				;$BBB02F   |
	RTS					;$BBB033  /

CODE_BBB034:
	LDA.w DATA_FD0000,y			;$BBB034  \
	INY					;$BBB037   |
	INY					;$BBB038   |
	STA $0A,x				;$BBB039   |
	LDA.w DATA_FD0000,y			;$BBB03B   |
	INY					;$BBB03E   |
	INY					;$BBB03F   |
	STA $08,x				;$BBB040   |
	RTS					;$BBB042  /

CODE_BBB043:
	LDA.w DATA_FD0000,y			;$BBB043  \
	INY					;$BBB046   |
	INY					;$BBB047   |
	STA $12,x				;$BBB048   |
	LDA.w DATA_FD0000,y			;$BBB04A   |
	INY					;$BBB04D   |
	INY					;$BBB04E   |
	STA $14,x				;$BBB04F   |
	RTS					;$BBB051  /

CODE_BBB052:
	LDA.w DATA_FD0000,y			;$BBB052  \
	INY					;$BBB055   |
	AND #$00FF				;$BBB056   |
	STA $0E,x				;$BBB059   |
	RTS					;$BBB05B  /

CODE_BBB05C:
	LDA.w DATA_FD0000,y			;$BBB05C  \
	INY					;$BBB05F   |
	AND #$00FF				;$BBB060   |
	STA $0C,x				;$BBB063   |
	RTS					;$BBB065  /

CODE_BBB066:
	LDA.w DATA_FD0000,y			;$BBB066  \
	INY					;$BBB069   |
	INY					;$BBB06A   |
	STA $38,x				;$BBB06B   |
	LDA.w DATA_FD0000,y			;$BBB06D   |
	INY					;$BBB070   |
	AND #$00FF				;$BBB071   |
	STA $3A,x				;$BBB074   |
	RTS					;$BBB076  /

CODE_BBB077:
	LDA.w DATA_FD0000,y			;$BBB077  \
	INY					;$BBB07A   |
	INY					;$BBB07B   |
	STA $16,x				;$BBB07C   |
	RTS					;$BBB07E  /

CODE_BBB07F:
	LDA.w DATA_FD0000,y			;$BBB07F  \
	INY					;$BBB082   |
	INY					;$BBB083   |
	STA $1A,x				;$BBB084   |
	RTS					;$BBB086  /

	LDA.w DATA_FD0000,y			;$BBB087   |
	INY					;$BBB08A   |
	INY					;$BBB08B   |
	STA $18,x				;$BBB08C   |
	RTS					;$BBB08E  /

CODE_BBB08F:
	TYA					;$BBB08F  \
	INY					;$BBB090   |
	INY					;$BBB091   |
	STA $3C,x				;$BBB092   |
	RTS					;$BBB094  /

CODE_BBB095:
	STZ $28,x				;$BBB095  \
	STZ $2A,x				;$BBB097   |
	STZ $2C,x				;$BBB099   |
	STZ $2E,x				;$BBB09B   |
	STZ $30,x				;$BBB09D   |
	STZ $32,x				;$BBB09F   |
	STZ $34,x				;$BBB0A1   |
	STZ $36,x				;$BBB0A3   |
	PHX					;$BBB0A5   |
	BRA CODE_BBB0AE				;$BBB0A6  /

CODE_BBB0A8:
	INY					;$BBB0A8  \
	INY					;$BBB0A9   |
	STA $28,x				;$BBB0AA   |
	INX					;$BBB0AC   |
	INX					;$BBB0AD   |
CODE_BBB0AE:					;	   |
	LDA.w DATA_FD0000,y			;$BBB0AE   |
	BPL CODE_BBB0A8				;$BBB0B1   |
	INY					;$BBB0B3   |
	INY					;$BBB0B4   |
	PLX					;$BBB0B5   |
	RTS					;$BBB0B6  /

	REP #$20				;$BBB0B7   |
CODE_BBB0B9:					;	   |
	LDA $98					;$BBB0B9   |
	STA $38					;$BBB0BB   |
	LDA $9A					;$BBB0BD   |
	AND #$00FF				;$BBB0BF   |
	STA $3A					;$BBB0C2   |
	LDA $0B84				;$BBB0C4   |
	TAX					;$BBB0C7   |
	INX					;$BBB0C8   |
	INX					;$BBB0C9   |
	INX					;$BBB0CA   |
	INX					;$BBB0CB   |
	LDA $0525				;$BBB0CC   |
	ASL A					;$BBB0CF   |
	STA $32					;$BBB0D0   |
	ASL A					;$BBB0D2   |
	ASL A					;$BBB0D3   |
	CLC					;$BBB0D4   |
	ADC $32					;$BBB0D5   |
	STX $34					;$BBB0D7   |
	CLC					;$BBB0D9   |
	ADC $34					;$BBB0DA   |
	TAX					;$BBB0DC   |
	LDA.l $B50008,x				;$BBB0DD   |
	ASL A					;$BBB0E1   |
	ASL A					;$BBB0E2   |
	TAX					;$BBB0E3   |
	LDA.l DATA_BBB241,x			;$BBB0E4   |
	LSR A					;$BBB0E8   |
	LSR A					;$BBB0E9   |
	LSR A					;$BBB0EA   |
	STA $000B88				;$BBB0EB   |
	LDA.l DATA_BBB243,x			;$BBB0EF   |
	LSR A					;$BBB0F3   |
	LSR A					;$BBB0F4   |
	LSR A					;$BBB0F5   |
	STA $000B8A				;$BBB0F6   |
	RTS					;$BBB0FA  /

CODE_BBB0FB:
	LDA $0525				;$BBB0FB  \
	LDX #$0000				;$BBB0FE   |
	LDY #$007F				;$BBB101   |
CODE_BBB104:					;	   |
	PHA					;$BBB104   |
	TXA					;$BBB105   |
	STA $D9					;$BBB106   |
	TYA					;$BBB108   |
	XBA					;$BBB109   |
	STA $DB					;$BBB10A   |
	LDA $98					;$BBB10C   |
	STA $38					;$BBB10E   |
	LDA $9A					;$BBB110   |
	AND #$00FF				;$BBB112   |
	STA $3A					;$BBB115   |
	LDA $0B84				;$BBB117   |
	TAX					;$BBB11A   |
	LDA.l $B50000,x				;$BBB11B   |
	JSR CODE_BBB1DD				;$BBB11F   |
	STA $46					;$BBB122   |
	INX					;$BBB124   |
	INX					;$BBB125   |
	LDA.l $B50000,x				;$BBB126   |
	JSR CODE_BBB1DD				;$BBB12A   |
	STA $48					;$BBB12D   |
	INX					;$BBB12F   |
	INX					;$BBB130   |
	PLA					;$BBB131   |
	ASL A					;$BBB132   |
	STA $32					;$BBB133   |
	ASL A					;$BBB135   |
	ASL A					;$BBB136   |
	CLC					;$BBB137   |
	ADC $32					;$BBB138   |
	STX $34					;$BBB13A   |
	CLC					;$BBB13C   |
	ADC $34					;$BBB13D   |
	TAX					;$BBB13F   |
	LDA.l $B50000,x				;$BBB140   |
	JSR CODE_BBB1DD				;$BBB144   |
	STA $52					;$BBB147   |
	LDA.l $B50004,x				;$BBB149   |
	JSR CODE_BBB1DD				;$BBB14D   |
	STA $54					;$BBB150   |
	LDA.l $B50002,x				;$BBB152   |
	SEC					;$BBB156   |
	SBC $B50000,x				;$BBB157   |
	JSR CODE_BBB1DD				;$BBB15B   |
	STA $4E					;$BBB15E   |
	LDA.l $B50006,x				;$BBB160   |
	SEC					;$BBB164   |
	SBC $B50004,x				;$BBB165   |
	JSR CODE_BBB1DD				;$BBB169   |
	STA $50					;$BBB16C   |
	LDA.l $B50008,x				;$BBB16E   |
	STA $0AB4				;$BBB172   |
	ASL A					;$BBB175   |
	TAY					;$BBB176   |
	ASL A					;$BBB177   |
	TAX					;$BBB178   |
	LDA.l DATA_BBB241,x			;$BBB179   |
	STA $4A					;$BBB17D   |
	LDA.l DATA_BBB243,x			;$BBB17F   |
	STA $4C					;$BBB183   |
	TYX					;$BBB185   |
	JSR (DATA_BBB265,x)			;$BBB186   |
	LDA $32					;$BBB189   |
	CLC					;$BBB18B   |
	ADC $38					;$BBB18C   |
	STA $38					;$BBB18E   |
	LDA $34					;$BBB190   |
	ADC $3A					;$BBB192   |
	STA $3A					;$BBB194   |
	PHB					;$BBB196   |
	LDA $DB					;$BBB197   |
	PHA					;$BBB199   |
	PLB					;$BBB19A   |
	PLB					;$BBB19B   |
	LDA $D9					;$BBB19C   |
	STA $3C					;$BBB19E   |
	TAX					;$BBB1A0   |
	LDY #$0000				;$BBB1A1   |
CODE_BBB1A4:					;	   |
	JSR CODE_BBB1B3				;$BBB1A4   |
	JSR CODE_BBB1C6				;$BBB1A7   |
	JSR CODE_BBB1D5				;$BBB1AA   |
	DEC $44					;$BBB1AD   |
	BNE CODE_BBB1A4				;$BBB1AF   |
	PLB					;$BBB1B1   |
	RTS					;$BBB1B2  /

CODE_BBB1B3:
	LDY #$0000				;$BBB1B3  \
	LDX $3C					;$BBB1B6   |
CODE_BBB1B8:					;	   |
	LDA [$38],y				;$BBB1B8   |
	STA $0000,x				;$BBB1BA   |
	INX					;$BBB1BD   |
	INX					;$BBB1BE   |
	INY					;$BBB1BF   |
	INY					;$BBB1C0   |
	CPY $42					;$BBB1C1   |
	BNE CODE_BBB1B8				;$BBB1C3   |
	RTS					;$BBB1C5  /

CODE_BBB1C6:
	LDA $3E					;$BBB1C6  \
	CLC					;$BBB1C8   |
	ADC $38					;$BBB1C9   |
	STA $38					;$BBB1CB   |
	LDA #$0000				;$BBB1CD   |
	ADC $3A					;$BBB1D0   |
	STA $3A					;$BBB1D2   |
	RTS					;$BBB1D4  /

CODE_BBB1D5:
	LDA $40					;$BBB1D5  \
	CLC					;$BBB1D7   |
	ADC $3C					;$BBB1D8   |
	STA $3C					;$BBB1DA   |
	RTS					;$BBB1DC  /

CODE_BBB1DD:
	LSR A					;$BBB1DD  \
	LSR A					;$BBB1DE   |
	LSR A					;$BBB1DF   |
	LSR A					;$BBB1E0   |
	LSR A					;$BBB1E1   |
	RTS					;$BBB1E2  /

CODE_BBB1E3:
	PHB					;$BBB1E3  \
	%pea_mask_dbr(wram_base_high)		;$BBB1E4   |
	PLB					;$BBB1E7   |
	PLB					;$BBB1E8   |
	LDA.l $0017B4				;$BBB1E9   |
	STA $38					;$BBB1ED   |
	LDA.l $00009B				;$BBB1EF   |
	AND #$00FF				;$BBB1F3   |
	STA $3A					;$BBB1F6   |
	SEP #$20				;$BBB1F8   |
	LDA #$80				;$BBB1FA   |
	STA $00009B				;$BBB1FC   |
	REP #$20				;$BBB200   |
	LDA.l $00003C				;$BBB202   |
	TAX					;$BBB206   |
	STA $0017B4				;$BBB207   |
	LDA.l $000B86				;$BBB20B   |
	AND #$0020				;$BBB20F   |
	BNE CODE_BBB227				;$BBB212   |
	LDY #$0000				;$BBB214   |
CODE_BBB217:					;	   |
	LDA [$38],y				;$BBB217   |
	INY					;$BBB219   |
	INY					;$BBB21A   |
	STA $0000,x				;$BBB21B   |
	INX					;$BBB21E   |
	INX					;$BBB21F   |
	CPX #$9600				;$BBB220   |
	BNE CODE_BBB217				;$BBB223   |
CODE_BBB225:					;	   |
	PLB					;$BBB225   |
	RTS					;$BBB226  /

CODE_BBB227:
	PHK					;$BBB227  \
	PLB					;$BBB228   |
	LDA.l $000038				;$BBB229   |
	TAX					;$BBB22D   |
	LDA.l $00003A				;$BBB22E   |
	TAY					;$BBB232   |
	LDA.l $0017B4				;$BBB233   |
	SEC					;$BBB237   |
	SBC #$0000				;$BBB238   |
	JSL decompress_data			;$BBB23B   |
	BRA CODE_BBB225				;$BBB23F  /

DATA_BBB241:
	db $00, $02

DATA_BBB243:
	db $10, $00, $00, $01, $20, $00, $80, $00
	db $40, $00, $40, $00, $80, $00, $20, $00
	db $00, $01, $10, $00, $00, $02, $60, $00
	db $50, $00, $50, $00, $60, $00, $00, $03
	db $10, $00

DATA_BBB265:
	dw CODE_BBB277
	dw CODE_BBB277
	dw CODE_BBB277
	dw CODE_BBB277
	dw CODE_BBB2A4
	dw CODE_BBB2A4
	dw CODE_BBB2A4
	dw CODE_BBB2A4
	dw CODE_BBB277


CODE_BBB277:
	LDA $52					;$BBB277  \
	LDX $48					;$BBB279   |
	JSR CODE_BBB2D5				;$BBB27B   |
	LDA $54					;$BBB27E   |
	CLC					;$BBB280   |
	ADC $32					;$BBB281   |
	STA $32					;$BBB283   |
	LDA #$0000				;$BBB285   |
	ADC $34					;$BBB288   |
	STA $34					;$BBB28A   |
	ASL $32					;$BBB28C   |
	ROL $34					;$BBB28E   |
	LDA $50					;$BBB290   |
	ASL A					;$BBB292   |
	STA $42					;$BBB293   |
	LDA $4E					;$BBB295   |
	STA $44					;$BBB297   |
	LDA $48					;$BBB299   |
	ASL A					;$BBB29B   |
	STA $3E					;$BBB29C   |
	LDA $4C					;$BBB29E   |
	ASL A					;$BBB2A0   |
	STA $40					;$BBB2A1   |
	RTS					;$BBB2A3  /

CODE_BBB2A4:
	LDA $54					;$BBB2A4  \
	LDX $46					;$BBB2A6   |
	JSR CODE_BBB2D5				;$BBB2A8   |
	LDA $52					;$BBB2AB   |
	CLC					;$BBB2AD   |
	ADC $32					;$BBB2AE   |
	STA $32					;$BBB2B0   |
	LDA #$0000				;$BBB2B2   |
	ADC $34					;$BBB2B5   |
	STA $34					;$BBB2B7   |
	ASL $32					;$BBB2B9   |
	ROL $34					;$BBB2BB   |
	LDA $4E					;$BBB2BD   |
	ASL A					;$BBB2BF   |
	STA $42					;$BBB2C0   |
	LDA $50					;$BBB2C2   |
	STA $44					;$BBB2C4   |
	LDA $46					;$BBB2C6   |
	ASL A					;$BBB2C8   |
	STA $3E					;$BBB2C9   |
	LDA $4A					;$BBB2CB   |
	ASL A					;$BBB2CD   |
	STA $40					;$BBB2CE   |
	RTS					;$BBB2D0  /

CODE_BBB2D1:
	JSR CODE_BBB2D5				;$BBB2D1  \
	RTL					;$BBB2D4  /

CODE_BBB2D5:
	STX $5E					;$BBB2D5  \
	STA $60					;$BBB2D7   |
	SEP #$20				;$BBB2D9   |
	LDA $5E					;$BBB2DB   |
	STA CPU.multiply_A			;$BBB2DD   |
	LDA $60					;$BBB2E0   |
	STA CPU.multiply_B			;$BBB2E2   |
	REP #$20				;$BBB2E5   |
	LDA CPU.multiply_result			;$BBB2E7   |
	LDA CPU.multiply_result			;$BBB2EA   |
	STA $32					;$BBB2ED   |
	STZ $34					;$BBB2EF   |
	SEP #$20				;$BBB2F1   |
	LDA $5F					;$BBB2F3   |
	STA CPU.multiply_A			;$BBB2F5   |
	LDA $60					;$BBB2F8   |
	STA CPU.multiply_B			;$BBB2FA   |
	REP #$20				;$BBB2FD   |
	LDA CPU.multiply_result			;$BBB2FF   |
	LDA CPU.multiply_result			;$BBB302   |
	CLC					;$BBB305   |
	ADC $33					;$BBB306   |
	STA $33					;$BBB308   |
	LDA #$0000				;$BBB30A   |
	ADC #$0000				;$BBB30D   |
	STA $35					;$BBB310   |
	SEP #$20				;$BBB312   |
	LDA $5E					;$BBB314   |
	STA CPU.multiply_A			;$BBB316   |
	LDA $61					;$BBB319   |
	STA CPU.multiply_B			;$BBB31B   |
	REP #$20				;$BBB31E   |
	LDA CPU.multiply_result			;$BBB320   |
	LDA CPU.multiply_result			;$BBB323   |
	CLC					;$BBB326   |
	ADC $33					;$BBB327   |
	STA $33					;$BBB329   |
	LDA #$0000				;$BBB32B   |
	ADC #$0000				;$BBB32E   |
	STA $35					;$BBB331   |
	SEP #$20				;$BBB333   |
	LDA $5F					;$BBB335   |
	STA CPU.multiply_A			;$BBB337   |
	LDA $61					;$BBB33A   |
	STA CPU.multiply_B			;$BBB33C   |
	REP #$20				;$BBB33F   |
	LDA CPU.multiply_result			;$BBB341   |
	LDA CPU.multiply_result			;$BBB344   |
	CLC					;$BBB347   |
	ADC $34					;$BBB348   |
	STA $34					;$BBB34A   |
	RTS					;$BBB34C  /

CODE_BBB34D:
	JSR CODE_BBB0B9				;$BBB34D  \
	LDX #$95FE				;$BBB350   |
	LDA #$0000				;$BBB353   |
CODE_BBB356:					;	   |
	STA $7F0000,x				;$BBB356   |
	DEX					;$BBB35A   |
	DEX					;$BBB35B   |
	BNE CODE_BBB356				;$BBB35C   |
	STA $7F0000,x				;$BBB35E   |
	LDX #$017E				;$BBB362   |
	LDA #$0000				;$BBB365   |
CODE_BBB368:					;	   |
	STA $0BA6,x				;$BBB368   |
	DEX					;$BBB36B   |
	DEX					;$BBB36C   |
	BPL CODE_BBB368				;$BBB36D   |
	LDX #$01FE				;$BBB36F   |
	LDA #$0000				;$BBB372   |
CODE_BBB375:					;	   |
	STA $7E7E12,x				;$BBB375   |
	DEX					;$BBB379   |
	DEX					;$BBB37A   |
	BPL CODE_BBB375				;$BBB37B   |
	LDA #$0004				;$BBB37D   |
	STA $7F0000				;$BBB380   |
	LDA #$0001				;$BBB384   |
	STA $000B98				;$BBB387   |
	PHB					;$BBB38B   |
	%pea_shift_dbr(DATA_FE0000)		;$BBB38C   |
	PLB					;$BBB38F   |
	PLB					;$BBB390   |
	LDA level_number			;$BBB391   |
	ASL A					;$BBB393   |
	TAY					;$BBB394   |
	LDA.w DATA_FE0000,y			;$BBB395   |
	BEQ CODE_BBB3ED				;$BBB398   |
	TAY					;$BBB39A   |
	BRA CODE_BBB3DD				;$BBB39B  /

CODE_BBB39D:
	AND #$00F0				;$BBB39D  \
	STA $32					;$BBB3A0   |
	LDA.w DATA_FE0002,y			;$BBB3A2   |
	SEC					;$BBB3A5   |
	SBC #$0100				;$BBB3A6   |
	STA $000B8C				;$BBB3A9   |
	LDA.w DATA_FE0004,y			;$BBB3AD   |
	SEC					;$BBB3B0   |
	SBC #$0100				;$BBB3B1   |
	STA $000B92				;$BBB3B4   |
	PHB					;$BBB3B8   |
	PHY					;$BBB3B9   |
	JSR CODE_BBB3F7				;$BBB3BA   |
	PLY					;$BBB3BD   |
	PLB					;$BBB3BE   |
	LDA.w DATA_FE0000,y			;$BBB3BF   |
	AND #$1F00				;$BBB3C2   |
	BEQ CODE_BBB3CE				;$BBB3C5   |
	PHB					;$BBB3C7   |
	PHY					;$BBB3C8   |
	JSR CODE_BBB4FE				;$BBB3C9   |
	PLY					;$BBB3CC   |
	PLB					;$BBB3CD   |
CODE_BBB3CE:					;	   |
	LDA.l $000B98				;$BBB3CE   |
	INC A					;$BBB3D2   |
	STA $000B98				;$BBB3D3   |
	TYA					;$BBB3D7   |
	CLC					;$BBB3D8   |
	ADC #$0008				;$BBB3D9   |
	TAY					;$BBB3DC   |
CODE_BBB3DD:					;	   |
	LDA.w DATA_FE0000,y			;$BBB3DD   |
	AND #$00FF				;$BBB3E0   |
	BNE CODE_BBB39D				;$BBB3E3   |
	JSR CODE_BBB581				;$BBB3E5   |
	JSR CODE_BBB518				;$BBB3E8   |
	PLB					;$BBB3EB   |
	RTS					;$BBB3EC  /

CODE_BBB3ED:
	LDA #$0001				;$BBB3ED  \
	JSL throw_exception			;$BBB3F0   |
	PLB					;$BBB3F4   |
	RTS					;$BBB3F5  /

CODE_BBB3F6:
	RTS					;$BBB3F6  /

CODE_BBB3F7:
	%pea_shift_dbr(DATA_BBB93C)		;$BBB3F7  \
	PLB					;$BBB3FA   |
	PLB					;$BBB3FB   |
	LDX $32					;$BBB3FC   |
	STZ $0B8E				;$BBB3FE   |
	LDA $0B8C				;$BBB401   |
	SEC					;$BBB404   |
	SBC #$0100				;$BBB405   |
	SEC					;$BBB408   |
	SBC.l DATA_BBB93C,x			;$BBB409   |
	BPL CODE_BBB412				;$BBB40D   |
	LDA #$0000				;$BBB40F   |
CODE_BBB412:					;	   |
	STA $36					;$BBB412   |
	AND #$FF00				;$BBB414   |
	XBA					;$BBB417   |
	CMP $0B88				;$BBB418   |
	BCS CODE_BBB3F6				;$BBB41B   |
	STA $0B8E				;$BBB41D   |
	LDA $36					;$BBB420   |
	CLC					;$BBB422   |
	ADC.l DATA_BBB93E,x			;$BBB423   |
	AND #$FF00				;$BBB427   |
	XBA					;$BBB42A   |
	CMP $0B88				;$BBB42B   |
	BCC CODE_BBB434				;$BBB42E   |
	LDA $0B88				;$BBB430   |
	DEC A					;$BBB433   |
CODE_BBB434:					;	   |
	STA $0B90				;$BBB434   |
	STZ $0B94				;$BBB437   |
	LDA $0B92				;$BBB43A   |
	SEC					;$BBB43D   |
	SBC #$00E0				;$BBB43E   |
	SEC					;$BBB441   |
	SBC.l DATA_BBB940,x			;$BBB442   |
	BPL CODE_BBB44B				;$BBB446   |
	LDA #$0000				;$BBB448   |
CODE_BBB44B:					;	   |
	STA $36					;$BBB44B   |
	AND #$FF00				;$BBB44D   |
	XBA					;$BBB450   |
	CMP $0B8A				;$BBB451   |
	BCS CODE_BBB3F6				;$BBB454   |
	STA $0B94				;$BBB456   |
	LDA $36					;$BBB459   |
	CLC					;$BBB45B   |
	ADC.l DATA_BBB942			;$BBB45C   |
	AND #$FF00				;$BBB460   |
	XBA					;$BBB463   |
	CMP $0B8A				;$BBB464   |
	BCC CODE_BBB46D				;$BBB467   |
	LDA $0B8A				;$BBB469   |
	DEC A					;$BBB46C   |
CODE_BBB46D:					;	   |
	STA $0B96				;$BBB46D   |
	LDA $0B8E				;$BBB470   |
	STA $0B8C				;$BBB473   |
	LDA $0B94				;$BBB476   |
	STA $0B92				;$BBB479   |
	BRA CODE_BBB48C				;$BBB47C  /

CODE_BBB47E:
	INC $0B92				;$BBB47E  \
	LDA $0B8E				;$BBB481   |
	STA $0B8C				;$BBB484   |
	BRA CODE_BBB48C				;$BBB487  /

CODE_BBB489:
	INC $0B8C				;$BBB489  \
CODE_BBB48C:					;	   |
	JSR CODE_BBB4A0				;$BBB48C   |
	LDA $0B8C				;$BBB48F   |
	CMP $0B90				;$BBB492   |
	BNE CODE_BBB489				;$BBB495   |
	LDA $0B92				;$BBB497   |
	CMP $0B96				;$BBB49A   |
	BNE CODE_BBB47E				;$BBB49D   |
	RTS					;$BBB49F  /

CODE_BBB4A0:
	LDA $0B92				;$BBB4A0  \
	XBA					;$BBB4A3   |
	ORA $0B88				;$BBB4A4   |
	STA CPU.multiply_A			;$BBB4A7   |
	LDA CPU.multiply_result			;$BBB4AA   |
	LDA CPU.multiply_result			;$BBB4AD   |
	LDA CPU.multiply_result			;$BBB4B0   |
	CLC					;$BBB4B3   |
	ADC $0B8C				;$BBB4B4   |
	ASL A					;$BBB4B7   |
	TAX					;$BBB4B8   |
	LDA $0BA6,x				;$BBB4B9   |
	BEQ CODE_BBB4DD				;$BBB4BC   |
CODE_BBB4BE:					;	   |
	TAX					;$BBB4BE   |
	LDA.l $7F0000,x				;$BBB4BF   |
	BNE CODE_BBB4BE				;$BBB4C3   |
	LDA.l $7F0000				;$BBB4C5   |
	STA $7F0000,x				;$BBB4C9   |
	CLC					;$BBB4CD   |
	ADC #$0004				;$BBB4CE   |
	STA $7F0000				;$BBB4D1   |
	LDA $0B98				;$BBB4D5   |
	STA $7F0002,x				;$BBB4D8   |
	RTS					;$BBB4DC  /

CODE_BBB4DD:
	LDA.l $7F0000				;$BBB4DD  \
	STA $0BA6,x				;$BBB4E1   |
	TAX					;$BBB4E4   |
	LDA $0B98				;$BBB4E5   |
	STA $7F0002,x				;$BBB4E8   |
	TXA					;$BBB4EC   |
	CLC					;$BBB4ED   |
	ADC #$0004				;$BBB4EE   |
	STA $7F0000,x				;$BBB4F1   |
	CLC					;$BBB4F5   |
	ADC #$0004				;$BBB4F6   |
	STA $7F0000				;$BBB4F9   |
	RTS					;$BBB4FD  /

CODE_BBB4FE:
	XBA					;$BBB4FE  \
	DEC A					;$BBB4FF   |
	ASL A					;$BBB500   |
	ASL A					;$BBB501   |
	ASL A					;$BBB502   |
	ASL A					;$BBB503   |
	TAX					;$BBB504   |
	BRA CODE_BBB509				;$BBB505  /

CODE_BBB507:
	INX					;$BBB507  \
	INX					;$BBB508   |
CODE_BBB509:					;	   |
	LDA.l $7E7E12,x				;$BBB509   |
	BNE CODE_BBB507				;$BBB50D   |
	LDA.l $000B98				;$BBB50F   |
	STA $7E7E12,x				;$BBB513   |
	RTS					;$BBB517  /

CODE_BBB518:
	PHB					;$BBB518  \
	%pea_shift_dbr($7E5A12)			;$BBB519   |
	PLB					;$BBB51C   |
	PLB					;$BBB51D   |
	LDA.l $7E5A12				;$BBB51E   |
	CLC					;$BBB522   |
	ADC #$5A12				;$BBB523   |
	STA $000B9A				;$BBB526   |
	STA $32					;$BBB52A   |
	CLC					;$BBB52C   |
	ADC #$0040				;$BBB52D   |
	STA $34					;$BBB530   |
	LDX #$0000				;$BBB532   |
CODE_BBB535:					;	   |
	PHX					;$BBB535   |
	TXA					;$BBB536   |
	ASL A					;$BBB537   |
	ASL A					;$BBB538   |
	ASL A					;$BBB539   |
	ASL A					;$BBB53A   |
	TAX					;$BBB53B   |
	LDA.l $7E7E12,x				;$BBB53C   |
	BNE CODE_BBB55E				;$BBB540   |
	LDA #$0000				;$BBB542   |
	STA ($32)				;$BBB545   |
CODE_BBB547:					;	   |
	INC $32					;$BBB547   |
	INC $32					;$BBB549   |
	PLX					;$BBB54B   |
	INX					;$BBB54C   |
	CPX #$0020				;$BBB54D   |
	BNE CODE_BBB535				;$BBB550   |
	LDA $34					;$BBB552   |
	SEC					;$BBB554   |
	SBC #$5A12				;$BBB555   |
	STA $7E5A12				;$BBB558   |
	PLB					;$BBB55C   |
	RTS					;$BBB55D  /

CODE_BBB55E:
	LDA $34					;$BBB55E  \
	STA ($32)				;$BBB560   |
	LDY #$0008				;$BBB562   |
CODE_BBB565:					;	   |
	LDA.l $7E7E12,x				;$BBB565   |
	BEQ CODE_BBB576				;$BBB569   |
	STA ($34)				;$BBB56B   |
	INC $34					;$BBB56D   |
	INC $34					;$BBB56F   |
	INX					;$BBB571   |
	INX					;$BBB572   |
	DEY					;$BBB573   |
	BNE CODE_BBB565				;$BBB574   |
CODE_BBB576:					;	   |
	LDA #$0000				;$BBB576   |
	STA ($34)				;$BBB579   |
	INC $34					;$BBB57B   |
	INC $34					;$BBB57D   |
	BRA CODE_BBB547				;$BBB57F  /

CODE_BBB581:
	PHB					;$BBB581  \
	%pea_shift_dbr($7E5A12)			;$BBB582   |
	PLB					;$BBB585   |
	PLB					;$BBB586   |
	LDX #$1FFE				;$BBB587   |
	LDA #$0000				;$BBB58A   |
CODE_BBB58D:					;	   |
	STA $5A12,x				;$BBB58D   |
	DEX					;$BBB590   |
	DEX					;$BBB591   |
	BPL CODE_BBB58D				;$BBB592   |
	LDY #$0002				;$BBB594   |
	LDX #$017E				;$BBB597   |
CODE_BBB59A:					;	   |
	LDA.l $000BA6,x				;$BBB59A   |
	BEQ CODE_BBB5B9				;$BBB59E   |
	PHX					;$BBB5A0   |
	PHA					;$BBB5A1   |
	TYA					;$BBB5A2   |
	STA $000BA6,x				;$BBB5A3   |
	PLA					;$BBB5A7   |
CODE_BBB5A8:					;	   |
	TAX					;$BBB5A8   |
	LDA.l $7F0002,x				;$BBB5A9   |
	STA $5A12,y				;$BBB5AD   |
	INY					;$BBB5B0   |
	INY					;$BBB5B1   |
	LDA.l $7F0000,x				;$BBB5B2   |
	BNE CODE_BBB5A8				;$BBB5B6   |
	PLX					;$BBB5B8   |
CODE_BBB5B9:					;	   |
	DEX					;$BBB5B9   |
	DEX					;$BBB5BA   |
	BPL CODE_BBB59A				;$BBB5BB   |
	TYA					;$BBB5BD   |
	STA $7E5A12				;$BBB5BE   |
	PLB					;$BBB5C2   |
	RTS					;$BBB5C3  /

sprite_loader:
	PHB					;$BBB5C4  \
	LDA level_number			;$BBB5C5   |
	ASL A					;$BBB5C7   |
	TAX					;$BBB5C8   |
	LDA.l DATA_FE0000,x			;$BBB5C9   |
	BEQ CODE_BBB61E				;$BBB5CD   |
	STA $0000F3				;$BBB5CF   |
	INC A					;$BBB5D3   |
	INC A					;$BBB5D4   |
	STA $0000F5				;$BBB5D5   |
	INC A					;$BBB5D9   |
	INC A					;$BBB5DA   |
	STA $0000F7				;$BBB5DB   |
	INC A					;$BBB5DF   |
	INC A					;$BBB5E0   |
	STA $0000F9				;$BBB5E1   |
	LDA $17BA				;$BBB5E5   |
	XBA					;$BBB5E8   |
	AND #$00FF				;$BBB5E9   |
	DEC A					;$BBB5EC   |
	BPL CODE_BBB5F0				;$BBB5ED   |
	INC A					;$BBB5EF   |
CODE_BBB5F0:					;	   |
	STA $32					;$BBB5F0   |
	LDA $17C0				;$BBB5F2   |
	AND #$FF00				;$BBB5F5   |
	SEC					;$BBB5F8   |
	SBC #$0100				;$BBB5F9   |
	BPL CODE_BBB602				;$BBB5FC   |
	CLC					;$BBB5FE   |
	ADC #$0100				;$BBB5FF   |
CODE_BBB602:					;	   |
	ORA $0B88				;$BBB602   |
	STA CPU.multiply_A			;$BBB605   |
	LDA CPU.multiply_result			;$BBB608   |
	LDA CPU.multiply_result			;$BBB60B   |
	CLC					;$BBB60E   |
	ADC $32					;$BBB60F   |
	ASL A					;$BBB611   |
	TAX					;$BBB612   |
	LDA $0BA6,x				;$BBB613   |
	%pea_shift_dbr(DATA_FE0000)		;$BBB616   |
	PLB					;$BBB619   |
	PLB					;$BBB61A   |
	TAX					;$BBB61B   |
	BNE CODE_BBB627				;$BBB61C   |
CODE_BBB61E:					;	   |
	PLB					;$BBB61E   |
	RTL					;$BBB61F  /

CODE_BBB620:
	PHX					;$BBB620  \
	JSR CODE_BBB62F				;$BBB621   |
	PLX					;$BBB624   |
	INX					;$BBB625   |
	INX					;$BBB626   |
CODE_BBB627:					;	   |
	LDA.l $7E5A12,x				;$BBB627   |
	BNE CODE_BBB620				;$BBB62B   |
	BRA CODE_BBB61E				;$BBB62D  /

CODE_BBB62F:
	STA $0000FB				;$BBB62F  \
	DEC A					;$BBB633   |
	ASL A					;$BBB634   |
	TAX					;$BBB635   |
	ASL A					;$BBB636   |
	ASL A					;$BBB637   |
	TAY					;$BBB638   |
	LDA ($F3),y				;$BBB639   |
	AND #$1F00				;$BBB63B   |
	BEQ CODE_BBB648				;$BBB63E   |
	STA $32					;$BBB640   |
	LDA.l $7E7A12,x				;$BBB642   |
	BPL CODE_BBB668				;$BBB646   |
CODE_BBB648:					;	   |
	LDA.l $7E7A12,x				;$BBB648   |
	STA $000B9C				;$BBB64C   |
	AND #$3FFF				;$BBB650   |
	BEQ CODE_BBB656				;$BBB653   |
	RTS					;$BBB655  /

CODE_BBB656:
	LDA ($F3),y				;$BBB656  \
	AND #$000F				;$BBB658   |
	ASL A					;$BBB65B   |
	TAX					;$BBB65C   |
	PHX					;$BBB65D   |
	JSR (DATA_BBB9AC,x)			;$BBB65E   |
	PLX					;$BBB661   |
	BCS CODE_BBB665				;$BBB662   |
	RTS					;$BBB664  /

CODE_BBB665:
	JMP (DATA_BBBA0C,x)			;$BBB665  /

CODE_BBB668:
	LDA.l $7E7A12,x				;$BBB668  \
	STA $000B9C				;$BBB66C   |
	LDA $32					;$BBB670   |
	XBA					;$BBB672   |
	DEC A					;$BBB673   |
	ASL A					;$BBB674   |
	TAX					;$BBB675   |
	LDA.l $000A42,x				;$BBB676   |
	BEQ CODE_BBB67D				;$BBB67A   |
	RTS					;$BBB67C  /

CODE_BBB67D:
	LDA ($F3),y				;$BBB67D  \
	AND #$000F				;$BBB67F   |
	ASL A					;$BBB682   |
	TAX					;$BBB683   |
	JSR (DATA_BBB9AC,x)			;$BBB684   |
	BCS CODE_BBB68A				;$BBB687   |
	RTS					;$BBB689  /

CODE_BBB68A:
	TYA					;$BBB68A  \
	STA $000B9E				;$BBB68B   |
	JSR CODE_BB8297				;$BBB68F   |
	BCC CODE_BBB695				;$BBB692   |
	RTS					;$BBB694  /

CODE_BBB695:
	LDY #$0022				;$BBB695  \
	JSL CODE_BB8462				;$BBB698   |
	LDA.l $0005BB				;$BBB69C   |
	AND #$0040				;$BBB6A0   |
	BEQ CODE_BBB6AC				;$BBB6A3   |
	LDX alternate_sprite			;$BBB6A5   |
	LDA #$00F8				;$BBB6A7   |
	STA $00,x				;$BBB6AA   |
CODE_BBB6AC:					;	   |
	LDX alternate_sprite			;$BBB6AC   |
	LDA.l $000B9E				;$BBB6AE   |
	TAY					;$BBB6B2   |
	LDA ($F3),y				;$BBB6B3   |
	STA $58,x				;$BBB6B5   |
	AND #$1F00				;$BBB6B7   |
	XBA					;$BBB6BA   |
	STA $42,x				;$BBB6BB   |
	DEC A					;$BBB6BD   |
	ASL A					;$BBB6BE   |
	TAX					;$BBB6BF   |
	LDA alternate_sprite			;$BBB6C0   |
	STA $000A42,x				;$BBB6C2   |
	TXA					;$BBB6C6   |
	CLC					;$BBB6C7   |
	ADC $000B9A				;$BBB6C8   |
	TAX					;$BBB6CC   |
	LDA.l $7E0000,x				;$BBB6CD   |
	TAX					;$BBB6D1   |
	BRA CODE_BBB6FB				;$BBB6D2  /

CODE_BBB6D4:
	PHX					;$BBB6D4  \
	PHB					;$BBB6D5   |
	STA $0000FB				;$BBB6D6   |
	DEC A					;$BBB6DA   |
	ASL A					;$BBB6DB   |
	TAX					;$BBB6DC   |
	ASL A					;$BBB6DD   |
	ASL A					;$BBB6DE   |
	TAY					;$BBB6DF   |
	LDA.l $7E7A12,x				;$BBB6E0   |
	STA $000B9C				;$BBB6E4   |
	AND #$3FFF				;$BBB6E8   |
	BNE CODE_BBB6F7				;$BBB6EB   |
	LDA ($F3),y				;$BBB6ED   |
	AND #$000F				;$BBB6EF   |
	ASL A					;$BBB6F2   |
	TAX					;$BBB6F3   |
	JSR (DATA_BBBA0C,x)			;$BBB6F4   |
CODE_BBB6F7:					;	   |
	PLB					;$BBB6F7   |
	PLX					;$BBB6F8   |
	INX					;$BBB6F9   |
	INX					;$BBB6FA   |
CODE_BBB6FB:					;	   |
	LDA.l $7E0000,x				;$BBB6FB   |
	BNE CODE_BBB6D4				;$BBB6FF   |
	RTS					;$BBB701  /

	LDA #$000D				;$BBB702   |
	JSL throw_exception			;$BBB705   |
	RTS					;$BBB709  /

CODE_BBB70A:
	SEC					;$BBB70A  \
	RTS					;$BBB70B  /

CODE_BBB70C:
	PHY					;$BBB70C  \
	PHB					;$BBB70D   |
	%pea_engine_dbr()			;$BBB70E   |
	PLB					;$BBB711   |
	PLB					;$BBB712   |
	JSR CODE_BB8297				;$BBB713   |
	PLB					;$BBB716   |
	PLY					;$BBB717   |
	BCS CODE_BBB70A				;$BBB718   |
	PHB					;$BBB71A   |
	PHB					;$BBB71B   |
	PLA					;$BBB71C   |
	STA $3A					;$BBB71D   |
	LDA ($F9),y				;$BBB71F   |
	TAX					;$BBB721   |
	LDA.l DATA_FBE800,x			;$BBB722   |
	TAX					;$BBB726   |
	LDA.l DATA_FF0000,x			;$BBB727   |
	%pea_shift_dbr(DATA_FF0000)		;$BBB72B   |
	PLB					;$BBB72E   |
	PLB					;$BBB72F   |
	LDA.w DATA_FF0002,x			;$BBB730   |
	STA $32					;$BBB733   |
	LDA.w DATA_FF0004,x			;$BBB735   |
	STA $34					;$BBB738   |
	LDA.w DATA_FF0006,x			;$BBB73A   |
	STA $36					;$BBB73D   |
	LDA.w DATA_FF0008,x			;$BBB73F   |
	STA $38					;$BBB742   |
	PHK					;$BBB744   |
	PLB					;$BBB745   |
	LDA $34					;$BBB746   |
	PHY					;$BBB748   |
	JSR CODE_BB8A69				;$BBB749   |
	PLY					;$BBB74C   |
	BCS CODE_BBB790				;$BBB74D   |
	LDX alternate_sprite			;$BBB74F   |
	EOR $12,x				;$BBB751   |
	AND #$0E00				;$BBB753   |
	EOR $12,x				;$BBB756   |
	STA $12,x				;$BBB758   |
	LDX #$0E9E				;$BBB75A   |
CODE_BBB75D:					;	   |
	LDA $32					;$BBB75D   |
	CMP $00,x				;$BBB75F   |
	BEQ CODE_BBB797				;$BBB761   |
	TXA					;$BBB763   |
	CLC					;$BBB764   |
	ADC #sizeof(sprite)			;$BBB765   |
	TAX					;$BBB768   |
	CPX #main_sprite_table_end		;$BBB769   |
	BNE CODE_BBB75D				;$BBB76C   |
	LDA $1730				;$BBB76E   |
	CMP #$0018				;$BBB771   |
	BPL CODE_BBB77F				;$BBB774   |
	LDX alternate_sprite			;$BBB776   |
	PHY					;$BBB778   |
	JSR CODE_BB8318				;$BBB779   |
	PLY					;$BBB77C   |
	BCC CODE_BBB7A6				;$BBB77D   |
CODE_BBB77F:					;	   |
	LDX alternate_sprite			;$BBB77F   |
	LDA $12,x				;$BBB781   |
	JSR CODE_BB8C06				;$BBB783   |
	BCS CODE_BBB790				;$BBB786   |
	LDA $F1					;$BBB788   |
	DEC A					;$BBB78A   |
	AND #$000F				;$BBB78B   |
	STA $F1					;$BBB78E   |
CODE_BBB790:					;	   |
	LDA $3A					;$BBB790   |
	PHA					;$BBB792   |
	PLB					;$BBB793   |
	PLB					;$BBB794   |
	SEC					;$BBB795   |
	RTS					;$BBB796  /

CODE_BBB797:
	LDA $12,x				;$BBB797  \
	LDX alternate_sprite			;$BBB799   |
	AND #$FFE0				;$BBB79B   |
	STA $12,x				;$BBB79E   |
	LDA $32					;$BBB7A0   |
	STA $00,x				;$BBB7A2   |
	BRA CODE_BBB7DD				;$BBB7A4  /

CODE_BBB7A6:
	LDX $1730				;$BBB7A6  \
	LDA $36					;$BBB7A9   |
	STA $1736,x				;$BBB7AB   |
	LDA $38					;$BBB7AE   |
	AND #$00FF				;$BBB7B0   |
	ORA #$8000				;$BBB7B3   |
	STA $1738,x				;$BBB7B6   |
	LDA $38					;$BBB7B9   |
	AND #$FF00				;$BBB7BB   |
	LSR A					;$BBB7BE   |
	LSR A					;$BBB7BF   |
	LSR A					;$BBB7C0   |
	STA $1732,x				;$BBB7C1   |
	PHY					;$BBB7C4   |
	LDY alternate_sprite			;$BBB7C5   |
	LDA $0012,y				;$BBB7C7   |
	AND #$01FF				;$BBB7CA   |
	ASL A					;$BBB7CD   |
	ASL A					;$BBB7CE   |
	ASL A					;$BBB7CF   |
	ASL A					;$BBB7D0   |
	STA $1734,x				;$BBB7D1   |
	PLY					;$BBB7D4   |
	TXA					;$BBB7D5   |
	CLC					;$BBB7D6   |
	ADC #$0008				;$BBB7D7   |
	STA $1730				;$BBB7DA   |
CODE_BBB7DD:					;	   |
	LDA $3A					;$BBB7DD   |
	PHA					;$BBB7DF   |
	PLB					;$BBB7E0   |
	PLB					;$BBB7E1   |
	LDX alternate_sprite			;$BBB7E2   |
	LDA $32					;$BBB7E4   |
	STA $00,x				;$BBB7E6   |
	LDA ($F5),y				;$BBB7E8   |
	STA $06,x				;$BBB7EA   |
	LDA ($F7),y				;$BBB7EC   |
	STA $0A,x				;$BBB7EE   |
	LDA #$00EC				;$BBB7F0   |
	STA $02,x				;$BBB7F3   |
	LDA #$8000				;$BBB7F5   |
	STA $04,x				;$BBB7F8   |
	STA $08,x				;$BBB7FA   |
	STZ $2C,x				;$BBB7FC   |
	STZ $32,x				;$BBB7FE   |
	STZ $30,x				;$BBB800   |
	STZ $1E,x				;$BBB802   |
	STZ $5A,x				;$BBB804   |
	LDA ($F3),y				;$BBB806   |
	STA $58,x				;$BBB808   |
	STZ $16,x				;$BBB80A   |
	STZ $1C,x				;$BBB80C   |
	STZ $10,x				;$BBB80E   |
	LDA ($F9),y				;$BBB810   |
	TAX					;$BBB812   |
	LDA.l DATA_FBE800,x			;$BBB813   |
	CLC					;$BBB817   |
	ADC #$000A				;$BBB818   |
	TAY					;$BBB81B   |
	LDX alternate_sprite			;$BBB81C   |
	JSL CODE_BB8474				;$BBB81E   |
	LDX alternate_sprite			;$BBB822   |
	LDA.l $0000FB				;$BBB824   |
	STA $56,x				;$BBB828   |
	DEC A					;$BBB82A   |
	ASL A					;$BBB82B   |
	STA $32					;$BBB82C   |
	TXA					;$BBB82E   |
	LDX $32					;$BBB82F   |
	EOR $7E7A12,x				;$BBB831   |
	AND #$1FFF				;$BBB835   |
	EOR $7E7A12,x				;$BBB838   |
	STA $7E7A12,x				;$BBB83C   |
	LDA $3A					;$BBB840   |
	PHA					;$BBB842   |
	PLB					;$BBB843   |
	PLB					;$BBB844   |
	CLC					;$BBB845   |
	RTS					;$BBB846  /

CODE_BBB847:
	PHY					;$BBB847  \
	PHB					;$BBB848   |
	%pea_engine_dbr()			;$BBB849   |
	PLB					;$BBB84C   |
	PLB					;$BBB84D   |
	JSR CODE_BB8297				;$BBB84E   |
	PLB					;$BBB851   |
	PLY					;$BBB852   |
	BCS CODE_BBB8BB				;$BBB853   |
	LDA ($F5),y				;$BBB855   |
	STA $06,x				;$BBB857   |
	LDA ($F7),y				;$BBB859   |
	STA $0A,x				;$BBB85B   |
	LDA #$00EC				;$BBB85D   |
	STA $02,x				;$BBB860   |
	LDA #$8000				;$BBB862   |
	STA $04,x				;$BBB865   |
	STA $08,x				;$BBB867   |
	STZ $1A,x				;$BBB869   |
	STZ $16,x				;$BBB86B   |
	STZ $2C,x				;$BBB86D   |
	STZ $32,x				;$BBB86F   |
	STZ $30,x				;$BBB871   |
	STZ $1E,x				;$BBB873   |
	STZ $5A,x				;$BBB875   |
	STZ $1C,x				;$BBB877   |
	LDA ($F3),y				;$BBB879   |
	STA $58,x				;$BBB87B   |
	LDA ($F9),y				;$BBB87D   |
	TAX					;$BBB87F   |
	LDA.l DATA_FBE800,x			;$BBB880   |
	TAY					;$BBB884   |
	LDX alternate_sprite			;$BBB885   |
	JSL CODE_BB8474				;$BBB887   |
	LDX alternate_sprite			;$BBB88B   |
	LDA.l $0000FB				;$BBB88D   |
	STA $56,x				;$BBB891   |
	DEC A					;$BBB893   |
	ASL A					;$BBB894   |
	STA $32					;$BBB895   |
	TXA					;$BBB897   |
	LDX $32					;$BBB898   |
	EOR $7E7A12,x				;$BBB89A   |
	AND #$1FFF				;$BBB89E   |
	EOR $7E7A12,x				;$BBB8A1   |
	STA $7E7A12,x				;$BBB8A5   |
	LDA.l $0005BB				;$BBB8A9   |
	AND #$0040				;$BBB8AD   |
	BEQ CODE_BBB8B9				;$BBB8B0   |
	LDX alternate_sprite			;$BBB8B2   |
	LDA #$0090				;$BBB8B4   |
	STA $00,x				;$BBB8B7   |
CODE_BBB8B9:					;	   |
	CLC					;$BBB8B9   |
	RTS					;$BBB8BA  /

CODE_BBB8BB:
	SEC					;$BBB8BB  \
	RTS					;$BBB8BC  /

CODE_BBB8BD:
	LDA #$0002				;$BBB8BD  \
	PHY					;$BBB8C0   |
	PHB					;$BBB8C1   |
	%pea_engine_dbr()			;$BBB8C2   |
	PLB					;$BBB8C5   |
	PLB					;$BBB8C6   |
	JSR CODE_BB8282				;$BBB8C7   |
	BRA CODE_BBB8D6				;$BBB8CA  /

CODE_BBB8CC:
	PHY					;$BBB8CC  \
	PHB					;$BBB8CD   |
	%pea_engine_dbr()			;$BBB8CE   |
	PLB					;$BBB8D1   |
	PLB					;$BBB8D2   |
	JSR CODE_BB826F				;$BBB8D3   |
CODE_BBB8D6:					;	   |
	PLB					;$BBB8D6   |
	PLY					;$BBB8D7   |
	BCS CODE_BBB93A				;$BBB8D8   |
	LDA ($F5),y				;$BBB8DA   |
	STA $06,x				;$BBB8DC   |
	LDA ($F7),y				;$BBB8DE   |
	STA $0A,x				;$BBB8E0   |
	LDA #$00EC				;$BBB8E2   |
	STA $02,x				;$BBB8E5   |
	LDA #$8000				;$BBB8E7   |
	STA $04,x				;$BBB8EA   |
	STA $08,x				;$BBB8EC   |
	STZ $2C,x				;$BBB8EE   |
	STZ $32,x				;$BBB8F0   |
	STZ $30,x				;$BBB8F2   |
	STZ $1E,x				;$BBB8F4   |
	STZ $5A,x				;$BBB8F6   |
	LDA ($F3),y				;$BBB8F8   |
	STA $58,x				;$BBB8FA   |
	LDA ($F9),y				;$BBB8FC   |
	TAX					;$BBB8FE   |
	LDA.l DATA_FBE800,x			;$BBB8FF   |
	TAY					;$BBB903   |
	LDX alternate_sprite			;$BBB904   |
	JSL CODE_BB8474				;$BBB906   |
	LDX alternate_sprite			;$BBB90A   |
	LDA.l $0000FB				;$BBB90C   |
	STA $56,x				;$BBB910   |
	DEC A					;$BBB912   |
	ASL A					;$BBB913   |
	STA $32					;$BBB914   |
	TXA					;$BBB916   |
	LDX $32					;$BBB917   |
	EOR $7E7A12,x				;$BBB919   |
	AND #$1FFF				;$BBB91D   |
	EOR $7E7A12,x				;$BBB920   |
	STA $7E7A12,x				;$BBB924   |
	LDA.l $0005BB				;$BBB928   |
	AND #$0040				;$BBB92C   |
	BEQ CODE_BBB938				;$BBB92F   |
	LDX alternate_sprite			;$BBB931   |
	LDA #$00F4				;$BBB933   |
	STA $00,x				;$BBB936   |
CODE_BBB938:					;	   |
	CLC					;$BBB938   |
	RTS					;$BBB939  /

CODE_BBB93A:
	SEC					;$BBB93A  \
	RTS					;$BBB93B  /

DATA_BBB93C:
	db $20, $00

DATA_BBB93E:
	db $40, $01

DATA_BBB940:
	db $20, $00

DATA_BBB942:
	db $40, $01, $28, $00, $50, $01, $28, $00
	db $50, $01, $10, $00, $20, $01, $10, $00
	db $00, $01, $18, $00, $30, $01, $18, $00
	db $10, $01, $60, $00, $C0, $01, $40, $00
	db $80, $01, $68, $00, $D0, $01, $48, $00
	db $90, $01, $20, $00, $40, $01, $40, $00
	db $80, $01, $28, $00, $50, $01, $48, $00
	db $90, $01, $20, $00, $40, $01, $F8, $00
	db $D0, $02, $28, $00, $50, $01, $00, $01
	db $E0, $02, $F8, $00, $F0, $02, $F8, $00
	db $D0, $02, $00, $01, $00, $03, $00, $01
	db $E0, $02, $F8, $00, $F0, $02, $20, $00
	db $40, $01, $00, $01, $00, $03, $28, $00
	db $50, $01

DATA_BBB9AC:
	dw CODE_BBBA2C
	dw CODE_BBBA7F
	dw CODE_BBBA7F
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA7F
	dw CODE_BBBA90
	dw CODE_BBBA7F
	dw CODE_BBBA5E
	dw CODE_BBBA69
	dw CODE_BBBA74
	dw CODE_BBBA53
	dw CODE_BBBA2E
	dw CODE_BBBA7F

DATA_BBB9CC:
	dw CODE_BBBA2C
	dw CODE_BBBAB8
	dw CODE_BBBA92
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBAB8
	dw CODE_BBBA90
	dw CODE_BBBAB8
	dw CODE_BBBAB8
	dw CODE_BBBAB8
	dw CODE_BBBAB8
	dw CODE_BBBAB8
	dw CODE_BBBAB8
	dw CODE_BBBAA2

DATA_BBB9EC:
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBAF3
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA90
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBAF3

DATA_BBBA0C:
	dw CODE_BBBA2C
	dw CODE_BBB8CC
	dw CODE_BBB8CC
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBBA2C
	dw CODE_BBB8BD
	dw CODE_BBBA2C
	dw CODE_BBB847
	dw CODE_BBB8CC
	dw CODE_BBB8CC
	dw CODE_BBB8CC
	dw CODE_BBB70C
	dw CODE_BBB847
	dw CODE_BBB8CC

CODE_BBBA2C:
	CLC					;$BBBA2C  \
	RTS					;$BBBA2D  /

CODE_BBBA2E:
	JSR CODE_BBBA7F				;$BBBA2E  \
	BCC CODE_BBBA52				;$BBBA31   |
	PHB					;$BBBA33   |
	%pea_engine_dbr()			;$BBBA34   |
	PLB					;$BBBA37   |
	PLB					;$BBBA38   |
	PHY					;$BBBA39   |
	LDY #$0009				;$BBBA3A   |
	LDA #$081A				;$BBBA3D   |
	ROR A					;$BBBA40   |
	TAX					;$BBBA41   |
	LDA $00,x				;$BBBA42   |
CODE_BBBA44:					;	   |
	EOR $01,x				;$BBBA44   |
	INC A					;$BBBA46   |
	DEY					;$BBBA47   |
	BPL CODE_BBBA44				;$BBBA48   |
	EOR #$9684				;$BBBA4A   |
	CMP #$FFFF				;$BBBA4D   |
	PLY					;$BBBA50   |
	PLB					;$BBBA51   |
CODE_BBBA52:					;	   |
	RTS					;$BBBA52  /

CODE_BBBA53:
	LDA.l $000923				;$BBBA53  \
	AND #$0001				;$BBBA57   |
	BNE CODE_BBBA7F				;$BBBA5A   |
	BRA CODE_BBBA90				;$BBBA5C  /

CODE_BBBA5E:
	LDA.l $000923				;$BBBA5E  \
	AND #$0001				;$BBBA62   |
	BNE CODE_BBBA7F				;$BBBA65   |
	BRA CODE_BBBA90				;$BBBA67  /

CODE_BBBA69:
	LDA.l $000923				;$BBBA69  \
	AND #$0002				;$BBBA6D   |
	BNE CODE_BBBA7F				;$BBBA70   |
	BRA CODE_BBBA90				;$BBBA72  /

CODE_BBBA74:
	LDA.l $000923				;$BBBA74  \
	AND #$0004				;$BBBA78   |
	BNE CODE_BBBA7F				;$BBBA7B   |
	BRA CODE_BBBA90				;$BBBA7D  /

CODE_BBBA7F:
	LDA ($F5),y				;$BBBA7F  \
	STA $72					;$BBBA81   |
	LDA ($F7),y				;$BBBA83   |
	STA $74					;$BBBA85   |
	LDA ($F3),y				;$BBBA87   |
	AND #$00F0				;$BBBA89   |
	TAX					;$BBBA8C   |
	JMP CODE_BBBB14				;$BBBA8D  /

CODE_BBBA90:
	CLC					;$BBBA90  \
	RTS					;$BBBA91  /

CODE_BBBA92:
	TYX					;$BBBA92  \
	LDA $06,x				;$BBBA93   |
	STA $72					;$BBBA95   |
	LDA $0A,x				;$BBBA97   |
	STA $74					;$BBBA99   |
	LDA #$0050				;$BBBA9B   |
	TAX					;$BBBA9E   |
	JMP CODE_BBBB14				;$BBBA9F  /

CODE_BBBAA2:
	TYX					;$BBBAA2  \
	LDA $06,x				;$BBBAA3   |
	STA $72					;$BBBAA5   |
	LDA $0A,x				;$BBBAA7   |
	STA $74					;$BBBAA9   |
	LDA $58,x				;$BBBAAB   |
	AND #$00F0				;$BBBAAD   |
	CLC					;$BBBAB0   |
	ADC #$0008				;$BBBAB1   |
	TAX					;$BBBAB4   |
	JMP CODE_BBBB14				;$BBBAB5  /

CODE_BBBAB8:
	TYX					;$BBBAB8  \
	LDA $06,x				;$BBBAB9   |
	STA $72					;$BBBABB   |
	LDA $0A,x				;$BBBABD   |
	STA $74					;$BBBABF   |
	LDA $58,x				;$BBBAC1   |
	AND #$00F0				;$BBBAC3   |
	CLC					;$BBBAC6   |
	ADC #$0008				;$BBBAC7   |
	TAX					;$BBBACA   |
	JSR CODE_BBBB14				;$BBBACB   |
	BCC CODE_BBBAD1				;$BBBACE   |
	RTS					;$BBBAD0  /

CODE_BBBAD1:
	TYX					;$BBBAD1  \
	LDA $56,x				;$BBBAD2   |
	DEC A					;$BBBAD4   |
	ASL A					;$BBBAD5   |
	ASL A					;$BBBAD6   |
	ASL A					;$BBBAD7   |
	TAY					;$BBBAD8   |
	PHB					;$BBBAD9   |
	%pea_shift_dbr(DATA_FE0000)		;$BBBADA   |
	PLB					;$BBBADD   |
	PLB					;$BBBADE   |
	LDA ($F5),y				;$BBBADF   |
	STA $72					;$BBBAE1   |
	LDA ($F7),y				;$BBBAE3   |
	STA $74					;$BBBAE5   |
	PLB					;$BBBAE7   |
	TXY					;$BBBAE8   |
	LDA $58,x				;$BBBAE9   |
	AND #$00F0				;$BBBAEB   |
	TAX					;$BBBAEE   |
	JMP CODE_BBBB14				;$BBBAEF  /

	RTS					;$BBBAF2  /

CODE_BBBAF3:
	TYX					;$BBBAF3  \
	LDA $56,x				;$BBBAF4   |
	DEC A					;$BBBAF6   |
	ASL A					;$BBBAF7   |
	ASL A					;$BBBAF8   |
	ASL A					;$BBBAF9   |
	TAY					;$BBBAFA   |
	PHB					;$BBBAFB   |
	%pea_shift_dbr(DATA_FE0000)		;$BBBAFC   |
	PLB					;$BBBAFF   |
	PLB					;$BBBB00   |
	LDA ($F5),y				;$BBBB01   |
	STA $72					;$BBBB03   |
	LDA ($F7),y				;$BBBB05   |
	STA $74					;$BBBB07   |
	PLB					;$BBBB09   |
	TXY					;$BBBB0A   |
	LDA $58,x				;$BBBB0B   |
	AND #$00F0				;$BBBB0D   |
	TAX					;$BBBB10   |
	JMP CODE_BBBB14				;$BBBB11  /

CODE_BBBB14:
	LDA.l $0017BA				;$BBBB14  \
	SEC					;$BBBB18   |
	SBC.l DATA_BBB93C,x			;$BBBB19   |
	CMP $72					;$BBBB1D   |
	BCS CODE_BBBB42				;$BBBB1F   |
	CLC					;$BBBB21   |
	ADC.l DATA_BBB93E,x			;$BBBB22   |
	CMP $72					;$BBBB26   |
	BCC CODE_BBBB42				;$BBBB28   |
	LDA.l $0017C0				;$BBBB2A   |
	SEC					;$BBBB2E   |
	SBC.l DATA_BBB940,x			;$BBBB2F   |
	CMP $74					;$BBBB33   |
	BCS CODE_BBBB42				;$BBBB35   |
	CLC					;$BBBB37   |
	ADC.l DATA_BBB942,x			;$BBBB38   |
	CMP $74					;$BBBB3C   |
	BCC CODE_BBBB42				;$BBBB3E   |
	SEC					;$BBBB40   |
	RTS					;$BBBB41  /

CODE_BBBB42:
	CLC					;$BBBB42  \
	RTS					;$BBBB43  /

CODE_BBBB44:
	LDX current_sprite			;$BBBB44  \
	LDA $56,x				;$BBBB46   |
	BEQ CODE_BBBB63				;$BBBB48   |
	LDA $58,x				;$BBBB4A   |
	AND #$1F00				;$BBBB4C   |
	BEQ CODE_BBBB53				;$BBBB4F   |
	CLC					;$BBBB51   |
	RTL					;$BBBB52  /

CODE_BBBB53:
	LDA $56,x				;$BBBB53  \
	DEC A					;$BBBB55   |
	ASL A					;$BBBB56   |
	TAX					;$BBBB57   |
	LDA.l $7E7A12,x				;$BBBB58   |
	AND #$E000				;$BBBB5C   |
	STA $7E7A12,x				;$BBBB5F   |
CODE_BBBB63:					;	   |
	JSL CODE_BB82B8				;$BBBB63   |
	SEC					;$BBBB67   |
	RTL					;$BBBB68  /

CODE_BBBB69:
	JSR CODE_BBBB6D				;$BBBB69  \
	RTL					;$BBBB6C  /

CODE_BBBB6D:
	LDY current_sprite			;$BBBB6D  \
	LDX #$001E				;$BBBB6F   |
	JSR (DATA_BBB9CC,x)			;$BBBB72   |
	BCC CODE_BBBB79				;$BBBB75   |
	CLC					;$BBBB77   |
	RTS					;$BBBB78  /

CODE_BBBB79:
	SEC					;$BBBB79  \
	RTS					;$BBBB7A  /

CODE_BBBB7B:
	JSR CODE_BBBB7F				;$BBBB7B  \
	RTL					;$BBBB7E  /

CODE_BBBB7F:
	LDY current_sprite			;$BBBB7F  \
	LDX #$0002				;$BBBB81   |
	JSR (DATA_BBB9CC,x)			;$BBBB84   |
	BCC CODE_BBBB8B				;$BBBB87   |
	CLC					;$BBBB89   |
	RTS					;$BBBB8A  /

CODE_BBBB8B:
	SEC					;$BBBB8B  \
	RTS					;$BBBB8C  /

CODE_BBBB8D:
	JSR CODE_BBBB6D				;$BBBB8D  \
	BCS CODE_BBBB93				;$BBBB90   |
	RTL					;$BBBB92  /

CODE_BBBB93:
	JSL CODE_BB82B8				;$BBBB93  \
	SEC					;$BBBB97   |
	RTL					;$BBBB98  /

CODE_BBBB99:
	LDX current_sprite			;$BBBB99  \
	LDA $56,x				;$BBBB9B   |
	BNE CODE_BBBBC6				;$BBBB9D   |
	TXY					;$BBBB9F   |
	LDA $58,x				;$BBBBA0   |
	AND #$000F				;$BBBBA2   |
	ASL A					;$BBBBA5   |
	TAX					;$BBBBA6   |
	JSR (DATA_BBB9CC,x)			;$BBBBA7   |
	BCC CODE_BBBBB3				;$BBBBAA   |
	TYX					;$BBBBAC   |
	LDA $5A,x				;$BBBBAD   |
	BNE CODE_BBBC0A				;$BBBBAF   |
	CLC					;$BBBBB1   |
	RTL					;$BBBBB2  /

CODE_BBBBB3:
	TYX					;$BBBBB3  \
	LDA $5A,x				;$BBBBB4   |
	SEC					;$BBBBB6   |
	SBC #$0100				;$BBBBB7   |
	BCC CODE_BBBBC0				;$BBBBBA   |
	STA $5A,x				;$BBBBBC   |
	CLC					;$BBBBBE   |
	RTL					;$BBBBBF  /

CODE_BBBBC0:
	JSL CODE_BB82B8				;$BBBBC0  \
	SEC					;$BBBBC4   |
	RTL					;$BBBBC5  /

CODE_BBBBC6:
	TXY					;$BBBBC6  \
	LDA $58,x				;$BBBBC7   |
	AND #$1F00				;$BBBBC9   |
	BNE CODE_BBBBFA				;$BBBBCC   |
CODE_BBBBCE:					;	   |
	LDA $05BB				;$BBBBCE   |
	BIT #$0040				;$BBBBD1   |
	BNE CODE_BBBBEC				;$BBBBD4   |
CODE_BBBBD6:					;	   |
	LDA $58,x				;$BBBBD6   |
	AND #$000F				;$BBBBD8   |
	ASL A					;$BBBBDB   |
	TAX					;$BBBBDC   |
	JSR (DATA_BBB9CC,x)			;$BBBBDD   |
	BCC CODE_BBBC12				;$BBBBE0   |
	TYX					;$BBBBE2   |
	LDA $5A,x				;$BBBBE3   |
	BNE CODE_BBBC0A				;$BBBBE5   |
	CLC					;$BBBBE7   |
	RTL					;$BBBBE8  /

CODE_BBBBE9:
	TYX					;$BBBBE9  \
	CLC					;$BBBBEA   |
	RTL					;$BBBBEB  /

CODE_BBBBEC:
	LDA $00,x				;$BBBBEC  \
	CMP #$0090				;$BBBBEE   |
	BEQ CODE_BBBBD6				;$BBBBF1   |
	CMP #$00F4				;$BBBBF3   |
	BNE CODE_BBBC2B				;$BBBBF6   |
	BRA CODE_BBBBD6				;$BBBBF8  /

CODE_BBBBFA:
	LDA $56,x				;$BBBBFA  \
	BMI CODE_BBBBE9				;$BBBBFC   |
	DEC A					;$BBBBFE   |
	ASL A					;$BBBBFF   |
	TAX					;$BBBC00   |
	LDA.l $7E7A12,x				;$BBBC01   |
	BPL CODE_BBBBE9				;$BBBC05   |
	TYX					;$BBBC07   |
	BRA CODE_BBBBCE				;$BBBC08  /

CODE_BBBC0A:
	SEP #$20				;$BBBC0A  \
	STA $5B,x				;$BBBC0C   |
	REP #$20				;$BBBC0E   |
	CLC					;$BBBC10   |
	RTL					;$BBBC11  /

CODE_BBBC12:
	TYX					;$BBBC12  \
	LDA $5A,x				;$BBBC13   |
	SEC					;$BBBC15   |
	SBC #$0100				;$BBBC16   |
	BCC CODE_BBBC1F				;$BBBC19   |
	STA $5A,x				;$BBBC1B   |
	CLC					;$BBBC1D   |
	RTL					;$BBBC1E  /

CODE_BBBC1F:
	LDA $58,x				;$BBBC1F  \
	AND #$000F				;$BBBC21   |
	ASL A					;$BBBC24   |
	TAX					;$BBBC25   |
	JSR (DATA_BBB9EC,x)			;$BBBC26   |
	BCS CODE_BBBC42				;$BBBC29   |
CODE_BBBC2B:					;	   |
	TYX					;$BBBC2B   |
	LDA $56,x				;$BBBC2C   |
	DEC A					;$BBBC2E   |
	ASL A					;$BBBC2F   |
	TAX					;$BBBC30   |
	LDA.l $7E7A12,x				;$BBBC31   |
	AND #$E000				;$BBBC35   |
	STA $7E7A12,x				;$BBBC38   |
	JSL CODE_BB82B8				;$BBBC3C   |
	SEC					;$BBBC40   |
	RTL					;$BBBC41  /

CODE_BBBC42:
	JSL CODE_BB82B8				;$BBBC42  \
	LDX current_sprite			;$BBBC46   |
	LDA #$00F0				;$BBBC48   |
	STA $00,x				;$BBBC4B   |
	STZ $1A,x				;$BBBC4D   |
	STZ $16,x				;$BBBC4F   |
	STZ $06,x				;$BBBC51   |
	STZ $0A,x				;$BBBC53   |
	STZ $2E,x				;$BBBC55   |
	SEC					;$BBBC57   |
	RTL					;$BBBC58  /

CODE_BBBC59:
	LDY current_sprite			;$BBBC59  \
	LDA $002E,y				;$BBBC5B   |
	BEQ CODE_BBBC67				;$BBBC5E   |
	TYX					;$BBBC60   |
	DEC $42,x				;$BBBC61   |
	BNE CODE_BBBC8A				;$BBBC63   |
	STZ $2E,x				;$BBBC65   |
CODE_BBBC67:					;	   |
	LDA $0058,y				;$BBBC67   |
	AND #$000F				;$BBBC6A   |
	ASL A					;$BBBC6D   |
	TAX					;$BBBC6E   |
	JSR (DATA_BBB9EC,x)			;$BBBC6F   |
	BCS CODE_BBBC8A				;$BBBC72   |
	LDX current_sprite			;$BBBC74   |
	LDA $56,x				;$BBBC76   |
	DEC A					;$BBBC78   |
	ASL A					;$BBBC79   |
	TAX					;$BBBC7A   |
	LDA.l $7E7A12,x				;$BBBC7B   |
	AND #$E000				;$BBBC7F   |
	STA $7E7A12,x				;$BBBC82   |
	JSL CODE_BB82D2				;$BBBC86   |
CODE_BBBC8A:					;	   |
	JML [$05A9]				;$BBBC8A  /

CODE_BBBC8D:
	LDX current_sprite			;$BBBC8D  \
	LDA $42,x				;$BBBC8F   |
	DEC A					;$BBBC91   |
	ASL A					;$BBBC92   |
	CLC					;$BBBC93   |
	ADC $000B9A				;$BBBC94   |
	TAX					;$BBBC98   |
	LDA.l $7E0000,x				;$BBBC99   |
	TAX					;$BBBC9D   |
	STA $0B9C				;$BBBC9E   |
	BRA CODE_BBBD21				;$BBBCA1  /

CODE_BBBCA3:
	LDX current_sprite			;$BBBCA3  \
	LDA $42,x				;$BBBCA5   |
	DEC A					;$BBBCA7   |
	ASL A					;$BBBCA8   |
	CLC					;$BBBCA9   |
	ADC $000B9A				;$BBBCAA   |
	TAX					;$BBBCAE   |
	LDA.l $7E0000,x				;$BBBCAF   |
	TAX					;$BBBCB3   |
	STA $0B9C				;$BBBCB4   |
	LDA $05BB				;$BBBCB7   |
	AND #$0040				;$BBBCBA   |
	BNE CODE_BBBCC1				;$BBBCBD   |
CODE_BBBCBF:					;	   |
	BRA CODE_BBBCEE				;$BBBCBF  /

CODE_BBBCC1:
	LDY current_sprite			;$BBBCC1  \
	LDA $0000,y				;$BBBCC3   |
	CMP #$00F8				;$BBBCC6   |
	BNE CODE_BBBD21				;$BBBCC9   |
	BRA CODE_BBBCBF				;$BBBCCB  /

CODE_BBBCCD:
	PHX					;$BBBCCD  \
	DEC A					;$BBBCCE   |
	ASL A					;$BBBCCF   |
	TAX					;$BBBCD0   |
	ASL A					;$BBBCD1   |
	ASL A					;$BBBCD2   |
	TAY					;$BBBCD3   |
	LDA.l $7E7A12,x				;$BBBCD4   |
	BMI CODE_BBBCEB				;$BBBCD8   |
	AND #$1FFF				;$BBBCDA   |
	TAY					;$BBBCDD   |
	LDA $0058,y				;$BBBCDE   |
	AND #$000F				;$BBBCE1   |
	ASL A					;$BBBCE4   |
	TAX					;$BBBCE5   |
	JSR (DATA_BBB9CC,x)			;$BBBCE6   |
	BCS CODE_BBBD69				;$BBBCE9   |
CODE_BBBCEB:					;	   |
	PLX					;$BBBCEB   |
	INX					;$BBBCEC   |
	INX					;$BBBCED   |
CODE_BBBCEE:					;	   |
	LDA.l $7E0000,x				;$BBBCEE   |
	BNE CODE_BBBCCD				;$BBBCF2   |
	LDA $0B9C				;$BBBCF4   |
	TAX					;$BBBCF7   |
	BRA CODE_BBBD1B				;$BBBCF8  /

CODE_BBBCFA:
	PHX					;$BBBCFA  \
	DEC A					;$BBBCFB   |
	ASL A					;$BBBCFC   |
	TAX					;$BBBCFD   |
	ASL A					;$BBBCFE   |
	ASL A					;$BBBCFF   |
	TAY					;$BBBD00   |
	LDA.l $7E7A12,x				;$BBBD01   |
	BMI CODE_BBBD18				;$BBBD05   |
	AND #$1FFF				;$BBBD07   |
	TAY					;$BBBD0A   |
	LDA $0058,y				;$BBBD0B   |
	AND #$000F				;$BBBD0E   |
	ASL A					;$BBBD11   |
	TAX					;$BBBD12   |
	JSR (DATA_BBB9EC,x)			;$BBBD13   |
	BCS CODE_BBBD69				;$BBBD16   |
CODE_BBBD18:					;	   |
	PLX					;$BBBD18   |
	INX					;$BBBD19   |
	INX					;$BBBD1A   |
CODE_BBBD1B:					;	   |
	LDA.l $7E0000,x				;$BBBD1B   |
	BNE CODE_BBBCFA				;$BBBD1F   |
CODE_BBBD21:					;	   |
	LDA $0B9C				;$BBBD21   |
	TAX					;$BBBD24   |
	LDA current_sprite			;$BBBD25   |
	PHA					;$BBBD27   |
	BRA CODE_BBBD50				;$BBBD28  /

CODE_BBBD2A:
	PHX					;$BBBD2A  \
	DEC A					;$BBBD2B   |
	ASL A					;$BBBD2C   |
	TAX					;$BBBD2D   |
	ASL A					;$BBBD2E   |
	ASL A					;$BBBD2F   |
	TAY					;$BBBD30   |
	LDA.l $7E7A12,x				;$BBBD31   |
	BMI CODE_BBBD4D				;$BBBD35   |
	AND #$1FFF				;$BBBD37   |
	STA current_sprite			;$BBBD3A   |
	BEQ CODE_BBBD4D				;$BBBD3C   |
	LDA.l $7E7A12,x				;$BBBD3E   |
	AND #$E000				;$BBBD42   |
	STA $7E7A12,x				;$BBBD45   |
	JSL CODE_BB82B8				;$BBBD49   |
CODE_BBBD4D:					;	   |
	PLX					;$BBBD4D   |
	INX					;$BBBD4E   |
	INX					;$BBBD4F   |
CODE_BBBD50:					;	   |
	LDA.l $7E0000,x				;$BBBD50   |
	BNE CODE_BBBD2A				;$BBBD54   |
	PLX					;$BBBD56   |
	STX current_sprite			;$BBBD57   |
	LDA $42,x				;$BBBD59   |
	DEC A					;$BBBD5B   |
	ASL A					;$BBBD5C   |
	TAX					;$BBBD5D   |
	LDA #$0000				;$BBBD5E   |
	STA $000A42,x				;$BBBD61   |
	JML CODE_BB82D2				;$BBBD65  /

CODE_BBBD69:
	PLX					;$BBBD69  \
	RTL					;$BBBD6A  /

CODE_BBBD6B:
	DEC $19BA				;$BBBD6B  \
	LDX current_sprite			;$BBBD6E   |
	LDA $58,x				;$BBBD70   |
	AND #$1F00				;$BBBD72   |
	BEQ CODE_BBBD8D				;$BBBD75   |
	EOR $58,x				;$BBBD77   |
	STA $58,x				;$BBBD79   |
	LDA $56,x				;$BBBD7B   |
	BEQ CODE_BBBD8D				;$BBBD7D   |
	DEC A					;$BBBD7F   |
	ASL A					;$BBBD80   |
	TAX					;$BBBD81   |
	LDA.l $7E7A12,x				;$BBBD82   |
	ORA #$8000				;$BBBD86   |
	STA $7E7A12,x				;$BBBD89   |
CODE_BBBD8D:					;	   |
	RTL					;$BBBD8D  /

CODE_BBBD8E:
	LDX #$03FE				;$BBBD8E  \
CODE_BBBD91:					;	   |
	LDA.l $7E7A12,x				;$BBBD91   |
	AND #$E000				;$BBBD95   |
	STA $7E4C00,x				;$BBBD98   |
	DEX					;$BBBD9C   |
	DEX					;$BBBD9D   |
	BPL CODE_BBBD91				;$BBBD9E   |
	RTS					;$BBBDA0  /

CODE_BBBDA1:
	LDX #$03FE				;$BBBDA1  \
CODE_BBBDA4:					;	   |
	LDA.l $7E4C00,x				;$BBBDA4   |
	STA $7E7A12,x				;$BBBDA8   |
	DEX					;$BBBDAC   |
	DEX					;$BBBDAD   |
	BPL CODE_BBBDA4				;$BBBDAE   |
	RTS					;$BBBDB0  /

	LDX current_sprite			;$BBBDB1   |
	LDA $56,x				;$BBBDB3   |
	DEC A					;$BBBDB5   |
	ASL A					;$BBBDB6   |
	TAX					;$BBBDB7   |
	LDA.l $7E7A12,x				;$BBBDB8   |
	ORA #$2000				;$BBBDBC   |
	STA $7E7A12,x				;$BBBDBF   |
	RTL					;$BBBDC3  /

CODE_BBBDC4:
	PHB					;$BBBDC4  \
	PHK					;$BBBDC5   |
	PLB					;$BBBDC6   |
	JSR CODE_BBC0A4				;$BBBDC7   |
if !version == 1				;	   |
	JSR CODE_BBC007				;$BBBDCA   |
endif
	LDA #$0003				;$BBBDCD   |
	STA $0006CF				;$BBBDD0   |
	LDA #$000A				;$BBBDD4   |
	STA $0006D1				;$BBBDD7   |
	LDA #$0040				;$BBBDDB   |
	TSB $06A3				;$BBBDDE   |
	STZ $06AD				;$BBBDE1   |
	STZ $06AF				;$BBBDE4   |
	STZ $6E					;$BBBDE7   |
	STZ current_player_mount		;$BBBDE9   |
	LDA $08A8				;$BBBDEB   |
	STA $08C8				;$BBBDEE   |
	STA level_number			;$BBBDF1   |
	STZ $0902				;$BBBDF3   |
	STZ $08A6				;$BBBDF6   |
	LDA.l $0006B1				;$BBBDF9   |
	JML CODE_B5CDFD				;$BBBDFD  /

CODE_BBBE01:
	LDA #$00CB				;$BBBE01  \
	SEC					;$BBBE04   |
	SBC #$000B				;$BBBE05   |
	STA $28					;$BBBE08   |
	LDA #$2139				;$BBBE0A   |
	STA $26					;$BBBE0D   |
	LDY #$DEC3				;$BBBE0F   |
	LDA [$26],y				;$BBBE12   |
	SEC					;$BBBE14   |
	SBC #$1248				;$BBBE15   |
	CMP #$71AF				;$BBBE18   |
	BEQ CODE_BBBE24				;$BBBE1B   |
	LDA.l DATA_BBBE43			;$BBBE1D   |
	STA $059D				;$BBBE21   |
CODE_BBBE24:					;	   |
	JSR CODE_BBBE28				;$BBBE24   |
	RTL					;$BBBE27  /

CODE_BBBE28:
	PHB					;$BBBE28  \
	PHK					;$BBBE29   |
	PLB					;$BBBE2A   |
	JSR CODE_BBC0A4				;$BBBE2B   |
	LDA $08A6				;$BBBE2E   |
	XBA					;$BBBE31   |
	ORA level_number			;$BBBE32   |
	JSL CODE_BBAF0C				;$BBBE34   |
	LDA #$0001				;$BBBE38   |
	STA $0006CF				;$BBBE3B   |
	LDA $059D				;$BBBE3F   |
	%offset(DATA_BBBE43, 1)         ;Todo: represent better maybe
	CMP #$FFFF				;$BBBE42   |
	BEQ CODE_BBBE54				;$BBBE45   |
	LDA $0515				;$BBBE47   |
	AND #$0007				;$BBBE4A   |
	ASL A					;$BBBE4D   |
	TAX					;$BBBE4E   |
	JSR (DATA_BBBE92,x)			;$BBBE4F   |
	PLB					;$BBBE52   |
	RTS					;$BBBE53  /

CODE_BBBE54:
	LDA #$8000				;$BBBE54  \
	TSB $08C6				;$BBBE57   |
	STZ $08A6				;$BBBE5A   |
	STZ $6E					;$BBBE5D   |
	STZ current_player_mount		;$BBBE5F   |
	STZ $0902				;$BBBE61   |
	LDA $08A8				;$BBBE64   |
	STA $08C8				;$BBBE67   |
	STA level_number			;$BBBE6A   |
	LDA #$0003				;$BBBE6C   |
	TRB $06D1				;$BBBE6F   |
	LDA $08BE				;$BBBE72   |
	BPL CODE_BBBE7E				;$BBBE75   |
	LDA #CODE_80FA7C			;$BBBE77   |
	JSL CODE_808C9E				;$BBBE7A   |
CODE_BBBE7E:					;	   |
	LDA #$0002				;$BBBE7E   |
	TSB $06D1				;$BBBE81   |
	STZ $059D				;$BBBE84   |
	JSR CODE_BBBED7				;$BBBE87   |
	LDA.l $0006B1				;$BBBE8A   |
	JML CODE_B5CDFD				;$BBBE8E  /

DATA_BBBE92:
	dw CODE_BBBEF8
	dw CODE_BBBFDD
if !version == 0
	dw CODE_BBBFE6
else
	dw CODE_BBBFE3
endif
	dw CODE_BBC019
	dw CODE_BBC053
	dw CODE_BBC056
	dw CODE_BBBEF8

CODE_BBBEA0:
	LDA $060D				;$BBBEA0  \
	CMP #$0002				;$BBBEA3   |
	BNE CODE_BBBED3				;$BBBEA6   |
	JSL CODE_BBC85B				;$BBBEA8   |
	LDA $08BE				;$BBBEAC   |
	BMI CODE_BBBED3				;$BBBEAF   |
	JSL CODE_BBC85B				;$BBBEB1   |
	JSL CODE_BBC736				;$BBBEB5   |
	LDA #$0002				;$BBBEB9   |
	TSB $06D1				;$BBBEBC   |
	LDA #$0005				;$BBBEBF   |
	TRB $06D1				;$BBBEC2   |
	STZ $059D				;$BBBEC5   |
	JSR CODE_BBBED7				;$BBBEC8   |
	LDA.l $0006B1				;$BBBECB   |
	JML CODE_B5CDFD				;$BBBECF  /

CODE_BBBED3:
	JML restart_rareware_logo		;$BBBED3  |

CODE_BBBED7:
	LDA $060D				;$BBBED7  \
	CMP #$0002				;$BBBEDA   |
	BNE CODE_BBBEEE				;$BBBEDD   |
	LDA $08C2				;$BBBEDF   |
	AND #$1000				;$BBBEE2   |
	BNE CODE_BBBEEE				;$BBBEE5   |
	LDA #$0004				;$BBBEE7   |
	TSB $06D1				;$BBBEEA   |
CODE_BBBEED:					;	   |
	RTS					;$BBBEED  /

CODE_BBBEEE:
	CMP #$0001				;$BBBEEE  \
	BNE CODE_BBBEED				;$BBBEF1   |
	JSL CODE_80889C				;$BBBEF3   |
	RTS					;$BBBEF7  /

CODE_BBBEF8:
	JSR CODE_BBC116				;$BBBEF8  \
	LDA $059D				;$BBBEFB   |
	ASL A					;$BBBEFE   |
	TAX					;$BBBEFF   |
	LDA $053D,x				;$BBBF00   |
	AND #$01FF				;$BBBF03   |
	STA $08C8				;$BBBF06   |
	LDA $059F				;$BBBF09   |
	XBA					;$BBBF0C   |
	ORA $08C8				;$BBBF0D   |
	LDX #$0553				;$BBBF10   |
	JSL CODE_BBAF0F				;$BBBF13   |
	LDA $0553				;$BBBF17   |
	AND #$0007				;$BBBF1A   |
	ASL A					;$BBBF1D   |
	TAX					;$BBBF1E   |
	JMP (DATA_BBBF22,x)			;$BBBF1F  /

DATA_BBBF22:
	dw CODE_BBBF30
	dw CODE_BBBF81
	dw CODE_BBBF81
	dw CODE_BBBF30
	dw CODE_BBBF30
	dw CODE_BBBF30
	dw CODE_BBBFC8


CODE_BBBF30:
	STZ $0902				;$BBBF30  \
	STZ $08A6				;$BBBF33   |
	STZ $6E					;$BBBF36   |
	STZ current_player_mount		;$BBBF38   |
	STZ $08AA				;$BBBF3A   |
	STZ $08AC				;$BBBF3D   |
	STZ $08AE				;$BBBF40   |
	STZ $08B2				;$BBBF43   |
	LDA $08A8				;$BBBF46   |
	CMP $08C8				;$BBBF49   |
	BEQ CODE_BBBF65				;$BBBF4C   |
	LDA $08A4				;$BBBF4E   |
	CLC					;$BBBF51   |
	ADC #$0002				;$BBBF52   |
	STA $0006CF				;$BBBF55   |
	LDY $08A8				;$BBBF59   |
	LDA $08C8				;$BBBF5C   |
	JSR CODE_BBC0DD				;$BBBF5F   |
	JSR CODE_BBC07E				;$BBBF62   |
CODE_BBBF65:					;	   |
	LDA $08C8				;$BBBF65   |
	STA level_number			;$BBBF68   |
	STA $08A8				;$BBBF6A   |
	STZ $08A6				;$BBBF6D   |
	LDA #$8000				;$BBBF70   |
	TRB $08C6				;$BBBF73   |
	JSR CODE_BBBED7				;$BBBF76   |
	LDA.l $0006B1				;$BBBF79   |
	JML CODE_B5CDFD				;$BBBF7D  /

CODE_BBBF81:
	JSR CODE_BBBD8E				;$BBBF81  \
	LDA level_number			;$BBBF84   |
	STA $05A3				;$BBBF86   |
	LDA $059F				;$BBBF89   |
	STA $05A5				;$BBBF8C   |
	LDA $08C8				;$BBBF8F   |
	STA level_number			;$BBBF92   |
	STZ $08A6				;$BBBF94   |
	LDA $0553				;$BBBF97   |
	CMP #$0001				;$BBBF9A   |
	BNE CODE_BBBFC1				;$BBBF9D   |
	LDA $056B				;$BBBF9F   |
	AND #$00FF				;$BBBFA2   |
	BEQ CODE_BBBFC1				;$BBBFA5   |
	LDA #CODE_BAB1B9			;$BBBFA7   |
	STA $00067D				;$BBBFAA   |
	LDA $056B				;$BBBFAE   |
	AND #$0003				;$BBBFB1   |
	DEC A					;$BBBFB4   |
	STA $000650				;$BBBFB5   |
	LDA #CODE_808CC9			;$BBBFB9   |
	STA NMI_pointer				;$BBBFBC   |
CODE_BBBFBE:					;	   |
	WAI					;$BBBFBE   |
	BRA CODE_BBBFBE				;$BBBFBF  /

CODE_BBBFC1:
	LDA #CODE_8087E1			;$BBBFC1  \
	JML CODE_808C9E				;$BBBFC4  /

CODE_BBBFC8:
	LDA $08C8				;$BBBFC8  \
	STA level_number			;$BBBFCB   |
	STZ $08A6				;$BBBFCD   |
	LDA #$8000				;$BBBFD0   |
	TRB $08C6				;$BBBFD3   |
	LDA #CODE_8087E1			;$BBBFD6   |
	JML CODE_808C9E				;$BBBFD9  /

CODE_BBBFDD:					;	  \
if !version == 1				;	   |
	JSR CODE_BBC007				;$BBBFDD   |
	JSR CODE_BBC059				;$BBBFE0   |
CODE_BBBFE3:					;	   |
	LDA #$8000				;$BBBFE3   |
	TSB $08C6				;$BBBFE6   |
	LDA $05A3				;$BBBFE9   |
	STA $08C8				;$BBBFEC   |
	LDA $05A5				;$BBBFEF   |
	STA $08A6				;$BBBFF2   |
	LDA $08C8				;$BBBFF5   |
	STA level_number			;$BBBFF8   |
	LDA #$0080				;$BBBFFA   |
	TSB $08C2				;$BBBFFD   |
	LDA #CODE_8087E1			;$BBC000   |
	JML CODE_808C9E				;$BBC003   |
endif						;	  /

CODE_BBC007:
	LDA #$8000				;$BBC007  \
	TRB $19D8				;$BBC00A   |
	BEQ CODE_BBC018				;$BBC00D   |
	LDA $19D8				;$BBC00F   |
	STA $08BC				;$BBC012   |
	STA $096B				;$BBC015   |
CODE_BBC018:					;	   |
if !version == 1				;	   |
	RTS					;$BBC018  /
endif

if !version == 0
CODE_BBBFE3:					;	  \
	JSR CODE_BBC059				;$BBC019   |
CODE_BBBFE6:					;	   |
	LDA #$8000				;$BBC019   |
	TSB $08C6				;$BBC01C   |
	LDA $05A3				;$BBC01F   |
	STA $08C8				;$BBC023   |
	LDA $05A5				;$BBC026   |
	STA $08A6				;$BBC029   |
	LDA $08C8				;$BBC02C   |
	STA level_number			;$BBC02F   |
	LDA #$0080				;$BBC031   |
	TSB $08C2				;$BBC034   |
	LDA #CODE_8087E1			;$BBC037   |
	JML CODE_808C9E				;$BBC03A   |
endif						;	  /

CODE_BBC019:
	LDA $08A4				;$BBC019  \
	CLC					;$BBC01C   |
	ADC #$0002				;$BBC01D   |
	STA $0006CF				;$BBC020   |
	LDA #$0001				;$BBC024   |
	STA $0006D1				;$BBC027   |
	STZ $6E					;$BBC02B   |
	STZ current_player_mount		;$BBC02D   |
	JSR CODE_BBC07E				;$BBC02F   |
	LDA.l $0006D9				;$BBC032   |
	STA $0515				;$BBC036   |
	LDA.l $0006DB				;$BBC039   |
	STA $08C8				;$BBC03D   |
	STZ $08A6				;$BBC040   |
	LDA #$8000				;$BBC043   |
	TRB $08C6				;$BBC046   |
	JSR CODE_BBBED7				;$BBC049   |
	LDA #$0000				;$BBC04C   |
	JML CODE_B5CDFD				;$BBC04F  /

CODE_BBC053:
	JMP CODE_BBBEF8				;$BBC053  /

CODE_BBC056:
	JMP CODE_BBBEF8				;$BBC056  /

CODE_BBC059:
	LDA $0521				;$BBC059  \
	AND #$0007				;$BBC05C   |
	BNE CODE_BBC062				;$BBC05F   |
CODE_BBC061:					;	   |
	RTS					;$BBC061  /

CODE_BBC062:
	DEC A					;$BBC062  \
	ASL A					;$BBC063   |
	TAX					;$BBC064   |
	LDA.l DATA_BBC070,x			;$BBC065   |
	STA $6E					;$BBC069   |
	BNE CODE_BBC061				;$BBC06B   |
	STZ current_player_mount		;$BBC06D   |
	RTS					;$BBC06F  /

DATA_BBC070:
	db $00, $00, $90, $01, $94, $01, $98, $01
	db $9C, $01, $A0, $01, $00, $00


CODE_BBC07E:
	LDA $0551				;$BBC07E  \
	STA $26					;$BBC081   |
	LDA #$00FD				;$BBC083   |
	STA $28					;$BBC086   |
	BRA CODE_BBC098				;$BBC088  /

CODE_BBC08A:
	TAY					;$BBC08A  \
	INC $26					;$BBC08B   |
	INC $26					;$BBC08D   |
	LDA [$26]				;$BBC08F   |
	INC $26					;$BBC091   |
	INC $26					;$BBC093   |
	JSR CODE_BBC0DD				;$BBC095   |
CODE_BBC098:					;	   |
	LDA [$26]				;$BBC098   |
	CMP #$FFFF				;$BBC09A   |
	BNE CODE_BBC08A				;$BBC09D   |
	RTS					;$BBC09F  /

	JSR CODE_BBC0A4				;$BBC0A0   |
	RTL					;$BBC0A3  /

CODE_BBC0A4:
	LDX #$0048				;$BBC0A4  \
	LDA #$0000				;$BBC0A7   |
CODE_BBC0AA:					;	   |
	STA $0006CF,x				;$BBC0AA   |
	DEX					;$BBC0AE   |
	DEX					;$BBC0AF   |
	BNE CODE_BBC0AA				;$BBC0B0   |
	RTS					;$BBC0B2  /

	LDX #$0018				;$BBC0B3   |
CODE_BBC0B6:					;	   |
	LDA.l DATA_BBC0C3,x			;$BBC0B6   |
	STA $0006D7,x				;$BBC0BA   |
	DEX					;$BBC0BE   |
	DEX					;$BBC0BF   |
	BNE CODE_BBC0B6				;$BBC0C0   |
	RTL					;$BBC0C2  /

DATA_BBC0C3:
	db $05, $00, $97, $00, $6B, $00, $86, $00
	db $6B, $00, $80, $00, $6B, $00, $9A, $00
	db $6B, $00, $16, $00, $6B, $00, $00, $00
	db $00, $00


CODE_BBC0DD:
	STY $5E					;$BBC0DD  \
	CMP $5E					;$BBC0DF   |
	BEQ CODE_BBC0E8				;$BBC0E1   |
	STA $60					;$BBC0E3   |
	JSR CODE_BBC0E9				;$BBC0E5   |
CODE_BBC0E8:					;	   |
	RTS					;$BBC0E8  /

CODE_BBC0E9:
	LDX #$0000				;$BBC0E9  \
CODE_BBC0EC:					;	   |
	LDA.l $0006D9,x				;$BBC0EC   |
	BEQ CODE_BBC103				;$BBC0F0   |
	INX					;$BBC0F2   |
	INX					;$BBC0F3   |
	INX					;$BBC0F4   |
	INX					;$BBC0F5   |
	CPX #$0030				;$BBC0F6   |
	BNE CODE_BBC0EC				;$BBC0F9   |
	LDA #$000B				;$BBC0FB   |
	JSL throw_exception			;$BBC0FE   |
	RTS					;$BBC102  /

CODE_BBC103:
	LDA $5E					;$BBC103  \
	STA $0006D9,x				;$BBC105   |
	LDA $60					;$BBC109   |
	STA $0006DB,x				;$BBC10B   |
	STZ $06DD,x				;$BBC10F   |
	INC $06D7				;$BBC112   |
	RTS					;$BBC115  /

CODE_BBC116:
	LDA $059D				;$BBC116  \
	CMP #$0008				;$BBC119   |
	BMI CODE_BBC128				;$BBC11C   |
	LDA #$0009				;$BBC11E   |
	JSL throw_exception			;$BBC121   |
	STZ $059D				;$BBC125   |
CODE_BBC128:					;	   |
	LDA $059D				;$BBC128   |
	ASL A					;$BBC12B   |
	TAX					;$BBC12C   |
	LDA $053D,x				;$BBC12D   |
	AND #$01FF				;$BBC130   |
	BNE CODE_BBC13F				;$BBC133   |
	LDA #$000A				;$BBC135   |
	JSL throw_exception			;$BBC138   |
	STZ $059D				;$BBC13C   |
CODE_BBC13F:					;	   |
	RTS					;$BBC13F  /

CODE_BBC140:
	LDX current_sprite			;$BBC140  \
	CPX $0597				;$BBC142   |
	BEQ CODE_BBC14F				;$BBC145   |
	LDA $19D4				;$BBC147   |
	BEQ CODE_BBC174				;$BBC14A   |
	DEC $19D4				;$BBC14C   |
CODE_BBC14F:					;	   |
	RTL					;$BBC14F  /

CODE_BBC150:
	INC $19D2				;$BBC150  \
	INC $19D2				;$BBC153   |
	INC $19D2				;$BBC156   |
	INC $19D2				;$BBC159   |
	RTL					;$BBC15C  /

CODE_BBC15D:
	INC $19D2				;$BBC15D  \
	INC $19D2				;$BBC160   |
	INC $19D2				;$BBC163   |
	INC $19D2				;$BBC166   |
	BRA CODE_BBC174				;$BBC169  /

CODE_BBC16B:
	STA $19D0				;$BBC16B  \
	STZ $19D2				;$BBC16E   |
	STZ $19D4				;$BBC171   |
CODE_BBC174:					;	   |
	PHK					;$BBC174   |
	PLB					;$BBC175   |
	LDA $19D0				;$BBC176   |
	ASL A					;$BBC179   |
	TAX					;$BBC17A   |
	LDA.l DATA_BBC18D,x			;$BBC17B   |
	CLC					;$BBC17F   |
	ADC $19D2				;$BBC180   |
	TAX					;$BBC183   |
	LDA $0000,x				;$BBC184   |
	STA $19D4				;$BBC187   |
	JMP ($0002,x)				;$BBC18A  /

DATA_BBC18D:
	dw DATA_BBC1A7
	dw DATA_BBC1A7
	dw DATA_BBC1E7
	dw DATA_BBC217
	dw DATA_BBC22B
	dw DATA_BBC24F
	dw DATA_BBC26B
	dw DATA_BBC287
	dw DATA_BBC2AB
	dw DATA_BBC1FF
	dw DATA_BBC2CF
	dw DATA_BBC2EB
	dw DATA_BBC2FB

DATA_BBC1A7:
	db $00, $00 : dw CODE_BBC389
	db $00, $00 : dw CODE_BBC394
	db $40, $00 : dw CODE_BBC3E5
	db $28, $00 : dw CODE_BBC457
	db $40, $00 : dw CODE_BBC3E5
	db $50, $00 : dw CODE_BBC457
	db $08, $00 : dw CODE_BBC3E5
	db $01, $00 : dw CODE_BBC316
	db $A0, $00 : dw CODE_BBC3AE
	db $30, $00 : dw CODE_BBC368
	db $01, $00 : dw CODE_BBC35E
	db $48, $00 : dw CODE_BBC4C6
	db $08, $00 : dw CODE_BBC42F
	db $40, $00 : dw CODE_BBC48A
	db $40, $00 : dw CODE_BBC34A
	db $01, $00 : dw CODE_BBC513

DATA_BBC1E7:
	db $00, $00 : dw CODE_BBC394
	db $40, $00 : dw CODE_BBC42F
	db $2C, $00 : dw CODE_BBC48A
	db $40, $01 : dw CODE_BBC4C6
	db $04, $00 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC1FF:
	db $00, $00 : dw CODE_BBC394
	db $20, $00 : dw CODE_BBC42F
	db $2C, $00 : dw CODE_BBC48A
	db $40, $00 : dw CODE_BBC4C6
	db $04, $00 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC217:
	db $18, $00 : dw CODE_BBC406
	db $04, $00 : dw CODE_BBC42F
	db $C0, $00 : dw CODE_BBC33A
	db $18, $00 : dw CODE_BBC344
	db $01, $00 : dw CODE_BBC513

DATA_BBC22B:
	db $28, $00 : dw CODE_BBC406
	db $01, $00 : dw CODE_BBC316
	db $01, $00 : dw CODE_BBC42F
	db $60, $00 : dw CODE_BBC3AE
	db $01, $00 : dw CODE_BBC321
	db $40, $00 : dw CODE_BBC4C6
	db $40, $00 : dw CODE_BBC33A
	db $88, $03 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC24F:
	db $00, $00 : dw CODE_BBC389
	db $00, $00 : dw CODE_BBC394
	db $02, $00 : dw CODE_BBC3E5
	db $10, $00 : dw CODE_BBC48A
	db $50, $00 : dw CODE_BBC4C6
	db $08, $00 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC26B:
	db $00, $00 : dw CODE_BBC373
	db $00, $00 : dw CODE_BBC394
	db $02, $00 : dw CODE_BBC3E5
	db $10, $00 : dw CODE_BBC48A
	db $50, $00 : dw CODE_BBC4C6
	db $08, $00 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC287:
	db $00, $00 : dw CODE_BBC37E
	db $00, $00 : dw CODE_BBC394
	db $01, $00 : dw CODE_BBC3E5
	db $20, $00 : dw CODE_BBC457
	db $30, $00 : dw CODE_BBC42F
	db $28, $00 : dw CODE_BBC457
	db $50, $00 : dw CODE_BBC4C6
	db $08, $00 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC2AB:
	db $00, $00 : dw CODE_BBC389
	db $00, $00 : dw CODE_BBC394
	db $01, $00 : dw CODE_BBC3E5
	db $10, $00 : dw CODE_BBC457
	db $50, $00 : dw CODE_BBC42F
	db $13, $00 : dw CODE_BBC457
	db $78, $00 : dw CODE_BBC4C6
	db $08, $00 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC2CF:
	db $00, $00 : dw CODE_BBC389
	db $00, $00 : dw CODE_BBC394
	db $01, $00 : dw CODE_BBC3E5
	db $4C, $00 : dw CODE_BBC48A
	db $80, $00 : dw CODE_BBC4C6
	db $08, $00 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC2EB:
	db $30, $00 : dw CODE_BBC406
	db $01, $00 : dw CODE_BBC316
	db $00, $0C : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC513

DATA_BBC2FB:
	db $48, $00 : dw CODE_BBC406
	db $00, $02 : dw CODE_BBC42F
	db $01, $00 : dw CODE_BBC30B
	db $00, $02 : dw CODE_BBC513

CODE_BBC30B:
	JSL CODE_BB8158				;$BBC30B  \
	JSL CODE_B88262				;$BBC30F   |
	JMP CODE_BBC15D				;$BBC313  /

CODE_BBC316:
	JSL CODE_B8808E				;$BBC316  \
	JSL CODE_B8B3EC				;$BBC31A   |
	JMP CODE_BBC150				;$BBC31E  /

CODE_BBC321:
	LDY #$0E9E				;$BBC321  \
	LDX $0593				;$BBC324   |
	LDA $0006,y				;$BBC327   |
	SEC					;$BBC32A   |
	SBC $06,x				;$BBC32B   |
	LSR A					;$BBC32D   |
	EOR $12,x				;$BBC32E   |
	AND #$4000				;$BBC330   |
	EOR $12,x				;$BBC333   |
	STA $12,x				;$BBC335   |
	JMP CODE_BBC15D				;$BBC337  /

CODE_BBC33A:
	LDA.l $000654				;$BBC33A  \
	STA $0AE8				;$BBC33E   |
	JMP CODE_BBC150				;$BBC341  /

CODE_BBC344:
	STZ $0AE8				;$BBC344  \
	JMP CODE_BBC150				;$BBC347  /

CODE_BBC34A:
	LDA $08FC				;$BBC34A  \
	ORA #$0003				;$BBC34D   |
	STA $08FC				;$BBC350   |
	JSL CODE_B8A691				;$BBC353   |
	JSL CODE_B4AFAD				;$BBC357   |
	JMP CODE_BBC150				;$BBC35B  /

CODE_BBC35E:
	LDA #$0001				;$BBC35E  \
	JSL transition_song			;$BBC361   |
	JMP CODE_BBC150				;$BBC365  /

CODE_BBC368:
	LDX $075F				;$BBC368  \
	LDA #$0002				;$BBC36B   |
	STA $2E,x				;$BBC36E   |
	JMP CODE_BBC150				;$BBC370  /

CODE_BBC373:
	LDX $0593				;$BBC373  \
	LDA #$0180				;$BBC376   |
	STA $06,x				;$BBC379   |
	JMP CODE_BBC15D				;$BBC37B  /

CODE_BBC37E:
	LDX $0593				;$BBC37E  \
	LDA #$0350				;$BBC381   |
	STA $06,x				;$BBC384   |
	JMP CODE_BBC15D				;$BBC386  /

CODE_BBC389:
	LDX $0593				;$BBC389  \
	LDA #$0100				;$BBC38C   |
	STA $06,x				;$BBC38F   |
	JMP CODE_BBC15D				;$BBC391  /

CODE_BBC394:
	LDA $08C2				;$BBC394  \
	AND #$4000				;$BBC397   |
	BEQ CODE_BBC3AB				;$BBC39A   |
	LDY $0597				;$BBC39C   |
	LDX $0593				;$BBC39F   |
	LDA $06,x				;$BBC3A2   |
	SEC					;$BBC3A4   |
	SBC #$001C				;$BBC3A5   |
	STA $0006,y				;$BBC3A8   |
CODE_BBC3AB:					;	   |
	JMP CODE_BBC15D				;$BBC3AB  /

CODE_BBC3AE:
	JSL CODE_B8808E				;$BBC3AE  \
	LDA $0A,x				;$BBC3B2   |
	STA $0C,x				;$BBC3B4   |
	STZ $0E,x				;$BBC3B6   |
	STZ $26,x				;$BBC3B8   |
	STZ $20,x				;$BBC3BA   |
	LDA #$0074				;$BBC3BC   |
	STA $2E,x				;$BBC3BF   |
	LDA #$0045				;$BBC3C1   |
	JSL CODE_B9D0B0				;$BBC3C4   |
	LDA $08C2				;$BBC3C8   |
	AND #$4000				;$BBC3CB   |
	BEQ CODE_BBC42C				;$BBC3CE   |
	JSL CODE_B880A2				;$BBC3D0   |
	LDA #$0074				;$BBC3D4   |
	STZ $26,x				;$BBC3D7   |
	STA $2E,x				;$BBC3D9   |
	LDA #$0001				;$BBC3DB   |
	JSL CODE_B9D0B0				;$BBC3DE   |
	JMP CODE_BBC150				;$BBC3E2  /

CODE_BBC3E5:
	JSL CODE_B8808E				;$BBC3E5  \
	JSR CODE_BBC3FE				;$BBC3E9   |
	LDA $08C2				;$BBC3EC   |
	AND #$4000				;$BBC3EF   |
	BEQ CODE_BBC42C				;$BBC3F2   |
	JSL CODE_B880A2				;$BBC3F4   |
	JSR CODE_BBC3FE				;$BBC3F8   |
	JMP CODE_BBC150				;$BBC3FB  /

CODE_BBC3FE:
	LDA #$0075				;$BBC3FE  \
	STA $2E,x				;$BBC401   |
	STZ $26,x				;$BBC403   |
	RTS					;$BBC405  /

CODE_BBC406:
	JSL CODE_B8808E				;$BBC406  \
	JSL CODE_B88EB8				;$BBC40A   |
	LDX current_sprite			;$BBC40E   |
	LDA #$007C				;$BBC410   |
	STA $2E,x				;$BBC413   |
	STZ $26,x				;$BBC415   |
	STZ $24,x				;$BBC417   |
	STZ $1C,x				;$BBC419   |
	LDA $08C2				;$BBC41B   |
	AND #$4000				;$BBC41E   |
	BEQ CODE_BBC42C				;$BBC421   |
	JSL CODE_B880A2				;$BBC423   |
	LDA #$0022				;$BBC427   |
	STA $2E,x				;$BBC42A   |
CODE_BBC42C:					;	   |
	JMP CODE_BBC150				;$BBC42C  /

CODE_BBC42F:
	JSL CODE_B8808E				;$BBC42F  \
	JSR CODE_BBC448				;$BBC433   |
	LDA $08C2				;$BBC436   |
	AND #$4000				;$BBC439   |
	BEQ CODE_BBC42C				;$BBC43C   |
	JSL CODE_B880A2				;$BBC43E   |
	JSR CODE_BBC448				;$BBC442   |
	JMP CODE_BBC150				;$BBC445  /

CODE_BBC448:
	LDA #$0074				;$BBC448  \
	STZ $26,x				;$BBC44B   |
	STA $2E,x				;$BBC44D   |
	LDA #$0001				;$BBC44F   |
	JSL CODE_B9D0B0				;$BBC452   |
	RTS					;$BBC456  /

CODE_BBC457:
	JSL CODE_B8808E				;$BBC457  \
	JSR CODE_BBC470				;$BBC45B   |
	LDA $08C2				;$BBC45E   |
	AND #$4000				;$BBC461   |
	BEQ CODE_BBC4A0				;$BBC464   |
	JSL CODE_B880A2				;$BBC466   |
	JSR CODE_BBC470				;$BBC46A   |
	JMP CODE_BBC150				;$BBC46D  /

CODE_BBC470:
	LDA $0A,x				;$BBC470  \
	STA $0C,x				;$BBC472   |
	STZ $0E,x				;$BBC474   |
	LDA #$0200				;$BBC476   |
	STA $26,x				;$BBC479   |
	STA $20,x				;$BBC47B   |
	LDA #$0075				;$BBC47D   |
	STA $2E,x				;$BBC480   |
	LDA #$0003				;$BBC482   |
	JSL CODE_B9D0B0				;$BBC485   |
	RTS					;$BBC489  /

CODE_BBC48A:
	JSL CODE_B8808E				;$BBC48A  \
	JSR CODE_BBC4A3				;$BBC48E   |
	LDA $08C2				;$BBC491   |
	AND #$4000				;$BBC494   |
	BEQ CODE_BBC4A0				;$BBC497   |
	JSL CODE_B880A2				;$BBC499   |
	JSR CODE_BBC4A3				;$BBC49D   |
CODE_BBC4A0:					;	   |
	JMP CODE_BBC150				;$BBC4A0  /

CODE_BBC4A3:
	LDA $0A,x				;$BBC4A3  \
	STA $0C,x				;$BBC4A5   |
	STZ $0E,x				;$BBC4A7   |
	LDA #$0400				;$BBC4A9   |
	STA $26,x				;$BBC4AC   |
	STA $20,x				;$BBC4AE   |
	LDA #$0075				;$BBC4B0   |
	STA $2E,x				;$BBC4B3   |
	LDA $0006,y				;$BBC4B5   |
	ORA #$0004				;$BBC4B8   |
	STA $0006,y				;$BBC4BB   |
	LDA #$0004				;$BBC4BE   |
	JSL CODE_B9D0B0				;$BBC4C1   |
	RTS					;$BBC4C5  /

CODE_BBC4C6:
	STZ $0D7A				;$BBC4C6  \
	JSL CODE_B8808E				;$BBC4C9   |
	JSR CODE_BBC4E2				;$BBC4CD   |
	LDA $08C2				;$BBC4D0   |
	AND #$4000				;$BBC4D3   |
	BEQ CODE_BBC4A0				;$BBC4D6   |
	JSL CODE_B880A2				;$BBC4D8   |
	JSR CODE_BBC4E2				;$BBC4DC   |
	JMP CODE_BBC150				;$BBC4DF  /

CODE_BBC4E2:
	LDA level_number			;$BBC4E2  \
	CMP #$0061				;$BBC4E4   |
	BNE CODE_BBC4FC				;$BBC4E7   |
	LDY $0654				;$BBC4E9   |
	LDA $0006,y				;$BBC4EC   |
	SEC					;$BBC4EF   |
	SBC $06,x				;$BBC4F0   |
	LSR A					;$BBC4F2   |
	EOR $12,x				;$BBC4F3   |
	AND #$4000				;$BBC4F5   |
	EOR $12,x				;$BBC4F8   |
	STA $12,x				;$BBC4FA   |
CODE_BBC4FC:					;	   |
	LDA $0A,x				;$BBC4FC   |
	STA $0C,x				;$BBC4FE   |
	STZ $0E,x				;$BBC500   |
	STZ $26,x				;$BBC502   |
	STZ $20,x				;$BBC504   |
	LDA #$0074				;$BBC506   |
	STA $2E,x				;$BBC509   |
	LDA #$009F				;$BBC50B   |
	JSL CODE_B9D0B0				;$BBC50E   |
	RTS					;$BBC512  /

CODE_BBC513:
	JSL CODE_B8808E				;$BBC513  \
	STZ $2E,x				;$BBC517   |
	LDA $08C2				;$BBC519   |
	AND #$4000				;$BBC51C   |
	BEQ CODE_BBC537				;$BBC51F   |
	JSL CODE_B880A2				;$BBC521   |
	LDA #$0022				;$BBC525   |
	STA $2E,x				;$BBC528   |
	LDA #$001F				;$BBC52A   |
	LDX #$0003				;$BBC52D   |
	LDY #$0000				;$BBC530   |
	JSL CODE_B8D8D1				;$BBC533   |
CODE_BBC537:					;	   |
	JMP CODE_BBC150				;$BBC537  /

validate_save_file:				;	  \
%local(.sram_pointer, temp_26)			;	   |
%local(.sram_pointer_bank, temp_28)		;	   |
%local(.additive_checksum, temp_5E)		;	   |
%local(.xor_checksum, temp_60)			;	   |
	ASL A					;$BBC53A   |\ Calculate the index to the save file offset table
	ASL A					;$BBC53B   | |
	TAX					;$BBC53C   |/
	LDA.l .sram_file_offsets_low,x		;$BBC53D   |\ Setup a pointer to the save file
	STA .sram_pointer			;$BBC541   | |
	LDA.l .sram_file_offsets_high,x		;$BBC543   | |
	STA .sram_pointer_bank			;$BBC547   |/
	LDY.w #save_file.file_signature		;$BBC549   |\ Load the file signature
	LDA [.sram_pointer],y			;$BBC54C   | |
	AND #$FFFE				;$BBC54E   |/ Mask off which player is active
	CMP #$0052				;$BBC551   |\ Check for single player game type
	BEQ .valid_file_signature		;$BBC554   |/ If so, verify the checksum
	CMP #$0152				;$BBC556   |\ Check for cooperative player game type
	BEQ .valid_file_signature		;$BBC559   |/ If so, verify the checksum
	CMP #$0252				;$BBC55B   |\ Check for competitive player game type
	BNE .invalid_file			;$BBC55E   |/ If not, the file cannot be valid, return such
.valid_file_signature				;	   |
	JSR calculate_checksum			;$BBC560   | Calculate the checksums of the save file payload
	LDY.w #save_file.additive_checksum	;$BBC563   |\ Verify the additive checksum matches the one in the file
	LDA [.sram_pointer],y			;$BBC566   | |
	CMP .additive_checksum			;$BBC568   | |
	BNE .invalid_file			;$BBC56A   |/ if not, the file is invalid
	LDY.w #save_file.xor_checksum		;$BBC56C   |\ Verify the xor checksum matches the one in the file
	LDA [.sram_pointer],y			;$BBC56F   | |
	CMP .xor_checksum			;$BBC571   | |
	BNE .invalid_file			;$BBC573   |/ if not, the file is invalid
	SEC					;$BBC575   | Carry set means the file was valid
	RTL					;$BBC576  / Return the good news

.invalid_file
	CLC					;$BBC577  \ Mark carry clear to indicate invalid file
	RTL					;$BBC578  / Return with a sad story

.sram_file_offsets_low
%offset(.sram_file_offsets_high, 2)
	dd save_file1
	dd save_file2
	dd save_file3

calculate_checksum:				;	  \
%local(.sram_pointer, temp_26)			;	   |
%local(.sram_pointer_bank, temp_28)		;	   |
%local(.additive_checksum, temp_5E)		;	   |
%local(.xor_checksum, temp_60)			;	   |
	STZ .additive_checksum			;$BBC585   |\ Nullify both checksums initially
	STZ .xor_checksum			;$BBC587   |/
	LDY.w #save_file.contents		;$BBC589   | Load the an offset past the sram header
.calculate_additive				;	   |
	LDA [.sram_pointer],y			;$BBC58C   |\ Calculate a cumulative sum of the main save file payload
	CLC					;$BBC58E   | |
	ADC .additive_checksum			;$BBC58F   | |
	STA .additive_checksum			;$BBC591   | |
	INY					;$BBC593   | | DKC2 subtracts the header size from the loop, but this
	INY					;$BBC594   | | is not actually correct.  However, the last 6 bytes are
	CPY #sizeof(save_file)-6		;$BBC595   | | unused, so this doesn't cause issue.
	BNE .calculate_additive			;$BBC598   |/
	LDY.w #save_file.contents		;$BBC59A   | Load the an offset past the sram header
.calculate_xor					;	   |
	LDA [.sram_pointer],y			;$BBC59D   |\ Calculate a xor sum of the main save file payload
	EOR .xor_checksum			;$BBC59F   | |
	STA .xor_checksum			;$BBC5A1   | |
	INY					;$BBC5A3   | |
	INY					;$BBC5A4   | |
	CPY #sizeof(save_file)-6		;$BBC5A5   | | The same header skip bug is present here
	BNE .calculate_xor			;$BBC5A8   |/
	RTS					;$BBC5AA  /

CODE_BBC5AB:
	PHB					;$BBC5AB  \
	LDA $060D				;$BBC5AC   |
	CMP #$0002				;$BBC5AF   |
	BNE CODE_BBC5C3				;$BBC5B2   |
	JSL CODE_BBC85B				;$BBC5B4   |
	JSL CODE_BBC5F4				;$BBC5B8   |
	JSR CODE_BBC5CC				;$BBC5BC   |
	JSL CODE_BBC85B				;$BBC5BF   |
CODE_BBC5C3:					;	   |
	JSL CODE_BBC5F4				;$BBC5C3   |
	JSR CODE_BBC5CC				;$BBC5C7   |
	PLB					;$BBC5CA   |
	RTL					;$BBC5CB  /

CODE_BBC5CC:
	LDA file_select_selection		;$BBC5CC  \
	ASL A					;$BBC5CF   |
	TAX					;$BBC5D0   |
	LDA.l DATA_BBC5EE,x			;$BBC5D1   |
	STA $32					;$BBC5D5   |
	LDA #<:sram_base			;$BBC5D7   |
	STA $34					;$BBC5DA   |
	%pea_use_dbr(sram_file_buffer)		;$BBC5DC   |
	PLB					;$BBC5DF   |
	LDY #$02A6				;$BBC5E0   |
CODE_BBC5E3:					;	   |
	LDA.w sram_file_buffer,y		;$BBC5E3   |
	STA [$32],y				;$BBC5E6   |
	DEY					;$BBC5E8   |
	DEY					;$BBC5E9   |
	BPL CODE_BBC5E3				;$BBC5EA   |
	PLB					;$BBC5EC   |
	RTS					;$BBC5ED  /


DATA_BBC5EE:
	dw save_file1
	dw save_file2
	dw save_file3

CODE_BBC5F4:
	JSL CODE_BB819F				;$BBC5F4  \
	LDA #sram_file_buffer			;$BBC5F8   |
	STA $26					;$BBC5FB   |
	LDA #<:sram_file_buffer			;$BBC5FD   |
	STA $28					;$BBC600   |
	SEP #$20				;$BBC602   |
	LDA $060D				;$BBC604   |
	LDY #$0005				;$BBC607   |
	STA [$26],y				;$BBC60A   |
	REP #$20				;$BBC60C   |
	SEP #$20				;$BBC60E   |
	LDA $060F				;$BBC610   |
	AND #$01				;$BBC613   |
	ORA #$52				;$BBC615   |
	LDY #$0004				;$BBC617   |
	STA [$26],y				;$BBC61A   |
	REP #$20				;$BBC61C   |
	LDA $060D				;$BBC61E   |
	CMP #$0002				;$BBC621   |
	BNE CODE_BBC633				;$BBC624   |
	LDA $060F				;$BBC626   |
	AND #$0001				;$BBC629   |
	BEQ CODE_BBC633				;$BBC62C   |
	LDA #$0154				;$BBC62E   |
	BRA CODE_BBC636				;$BBC631  /

CODE_BBC633:
	LDA #$0006				;$BBC633  \
CODE_BBC636:					;	   |
	CLC					;$BBC636   |
	ADC $26					;$BBC637   |
	STA $D9					;$BBC639   |
	LDA #$0000				;$BBC63B   |
	ADC $28					;$BBC63E   |
	STA $DB					;$BBC640   |
	LDA $D5					;$BBC642   |
	LDY #$0000				;$BBC644   |
	STA [$D9],y				;$BBC647   |
	LDA $D7					;$BBC649   |
	INY					;$BBC64B   |
	INY					;$BBC64C   |
	STA [$D9],y				;$BBC64D   |
	SEP #$20				;$BBC64F   |
	LDA $0904				;$BBC651   |
	LDY #$0004				;$BBC654   |
	STA [$D9],y				;$BBC657   |
	LDA $08CC				;$BBC659   |
	LDY #$0005				;$BBC65C   |
	STA [$D9],y				;$BBC65F   |
	LDA $08CE				;$BBC661   |
	LDY #$0006				;$BBC664   |
	STA [$D9],y				;$BBC667   |
	LDA $08D0				;$BBC669   |
	LDY #$0007				;$BBC66C   |
	STA [$D9],y				;$BBC66F   |
	LDA level_number			;$BBC671   |
	LDY #$0008				;$BBC673   |
	STA [$D9],y				;$BBC676   |
	LDA $08A4				;$BBC678   |
	LDY #$00B3				;$BBC67B   |
	STA [$D9],y				;$BBC67E   |
	LDY #$00E3				;$BBC680   |
	LDX #$002F				;$BBC683   |
CODE_BBC686:					;	   |
	LDA $08D2,x				;$BBC686   |
	STA [$D9],y				;$BBC689   |
	DEY					;$BBC68B   |
	DEX					;$BBC68C   |
	BPL CODE_BBC686				;$BBC68D   |
	REP #$20				;$BBC68F   |
	LDA.l $0006B1				;$BBC691   |
	LDY #$00AD				;$BBC695   |
	STA [$D9],y				;$BBC698   |
	LDA.l $0006AB				;$BBC69A   |
	LDY #$00AF				;$BBC69E   |
	STA [$D9],y				;$BBC6A1   |
	LDA.l $0006A9				;$BBC6A3   |
	LDY #$00B1				;$BBC6A7   |
	STA [$D9],y				;$BBC6AA   |
	LDA $060B				;$BBC6AC   |
	LDY #$00E4				;$BBC6AF   |
	STA [$D9],y				;$BBC6B2   |
	LDA $08C2				;$BBC6B4   |
	ORA #$0200				;$BBC6B7   |
	STA $08C2				;$BBC6BA   |
	LDY #$0009				;$BBC6BD   |
	STA [$D9],y				;$BBC6C0   |
	LDA $08C4				;$BBC6C2   |
	LDY #$000B				;$BBC6C5   |
	STA [$D9],y				;$BBC6C8   |
	LDY #$002B				;$BBC6CA   |
	LDX #$001E				;$BBC6CD   |
CODE_BBC6D0:					;	   |
	LDA.l $7E5972,x				;$BBC6D0   |
	STA [$D9],y				;$BBC6D4   |
	DEY					;$BBC6D6   |
	DEY					;$BBC6D7   |
	DEX					;$BBC6D8   |
	DEX					;$BBC6D9   |
	BPL CODE_BBC6D0				;$BBC6DA   |
	LDY #$004B				;$BBC6DC   |
	LDX #$001E				;$BBC6DF   |
CODE_BBC6E2:					;	   |
	LDA.l $7E5992,x				;$BBC6E2   |
	STA [$D9],y				;$BBC6E6   |
	DEY					;$BBC6E8   |
	DEY					;$BBC6E9   |
	DEX					;$BBC6EA   |
	DEX					;$BBC6EB   |
	BPL CODE_BBC6E2				;$BBC6EC   |
	LDY #$006B				;$BBC6EE   |
	LDX #$001E				;$BBC6F1   |
CODE_BBC6F4:					;	   |
	LDA.l $7E59B2,x				;$BBC6F4   |
	STA [$D9],y				;$BBC6F8   |
	DEY					;$BBC6FA   |
	DEY					;$BBC6FB   |
	DEX					;$BBC6FC   |
	DEX					;$BBC6FD   |
	BPL CODE_BBC6F4				;$BBC6FE   |
	LDY #$008B				;$BBC700   |
	LDX #$001E				;$BBC703   |
CODE_BBC706:					;	   |
	LDA.l $7E59D2,x				;$BBC706   |
	STA [$D9],y				;$BBC70A   |
	DEY					;$BBC70C   |
	DEY					;$BBC70D   |
	DEX					;$BBC70E   |
	DEX					;$BBC70F   |
	BPL CODE_BBC706				;$BBC710   |
	LDY #$00AB				;$BBC712   |
	LDX #$001E				;$BBC715   |
CODE_BBC718:					;	   |
	LDA.l $7E59F2,x				;$BBC718   |
	STA [$D9],y				;$BBC71C   |
	DEY					;$BBC71E   |
	DEY					;$BBC71F   |
	DEX					;$BBC720   |
	DEX					;$BBC721   |
	BPL CODE_BBC718				;$BBC722   |
	JSR calculate_checksum			;$BBC724   |
	LDY #$0000				;$BBC727   |
	LDA $5E					;$BBC72A   |
	STA [$26],y				;$BBC72C   |
	LDY #$0002				;$BBC72E   |
	LDA $60					;$BBC731   |
	STA [$26],y				;$BBC733   |
	RTL					;$BBC735  /

CODE_BBC736:
	JSL CODE_808F68				;$BBC736  \
	LDA #sram_file_buffer			;$BBC73A   |
	STA $26					;$BBC73D   |
	LDA #$007E				;$BBC73F   |
	STA $28					;$BBC742   |
	LDA $060D				;$BBC744   |
	CMP #$0002				;$BBC747   |
	BNE CODE_BBC759				;$BBC74A   |
	LDA $060F				;$BBC74C   |
	AND #$0001				;$BBC74F   |
	BEQ CODE_BBC759				;$BBC752   |
	LDA #$0154				;$BBC754   |
	BRA CODE_BBC75C				;$BBC757  /

CODE_BBC759:
	LDA #$0006				;$BBC759  \
CODE_BBC75C:					;	   |
	CLC					;$BBC75C   |
	ADC $26					;$BBC75D   |
	STA $D9					;$BBC75F   |
	LDA #$0000				;$BBC761   |
	ADC $28					;$BBC764   |
	STA $DB					;$BBC766   |
	LDY #$0009				;$BBC768   |
	LDA [$D9],y				;$BBC76B   |
	STA $08C2				;$BBC76D   |
	AND #$0200				;$BBC770   |
	BNE CODE_BBC776				;$BBC773   |
	RTL					;$BBC775  /

CODE_BBC776:
	LDY #$000B				;$BBC776  \
	LDA [$D9],y				;$BBC779   |
	STA $08C4				;$BBC77B   |
	LDY #$0000				;$BBC77E   |
	LDA [$D9],y				;$BBC781   |
	STA $D5					;$BBC783   |
	INY					;$BBC785   |
	INY					;$BBC786   |
	LDA [$D9],y				;$BBC787   |
	STA $D7					;$BBC789   |
	SEP #$20				;$BBC78B   |
	LDY #$0004				;$BBC78D   |
	LDA [$D9],y				;$BBC790   |
	STA $0904				;$BBC792   |
	LDY #$0005				;$BBC795   |
	LDA [$D9],y				;$BBC798   |
	STA $08CC				;$BBC79A   |
	LDY #$0006				;$BBC79D   |
	LDA [$D9],y				;$BBC7A0   |
	STA $08CE				;$BBC7A2   |
	LDY #$0007				;$BBC7A5   |
	LDA [$D9],y				;$BBC7A8   |
	STA $08D0				;$BBC7AA   |
	LDY #$0008				;$BBC7AD   |
	LDA [$D9],y				;$BBC7B0   |
	STA level_number			;$BBC7B2   |
	LDY #$00B3				;$BBC7B4   |
	LDA [$D9],y				;$BBC7B7   |
	STA $08A4				;$BBC7B9   |
	LDY #$00E3				;$BBC7BC   |
	LDX #$002F				;$BBC7BF   |
CODE_BBC7C2:					;	   |
	LDA [$D9],y				;$BBC7C2   |
	STA $08D2,x				;$BBC7C4   |
	DEY					;$BBC7C7   |
	DEX					;$BBC7C8   |
	BPL CODE_BBC7C2				;$BBC7C9   |
	REP #$20				;$BBC7CB   |
	LDY #$00AD				;$BBC7CD   |
	LDA [$D9],y				;$BBC7D0   |
	STA $0006B1				;$BBC7D2   |
	LDY #$00AF				;$BBC7D6   |
	LDA [$D9],y				;$BBC7D9   |
	STA $0006AB				;$BBC7DB   |
	LDY #$00B1				;$BBC7DF   |
	LDA [$D9],y				;$BBC7E2   |
	STA $0006A9				;$BBC7E4   |
	LDY #$00E4				;$BBC7E8   |
	LDA [$D9],y				;$BBC7EB   |
	AND #$FFFD				;$BBC7ED   |
	STA $060B				;$BBC7F0   |
	LDY #$002B				;$BBC7F3   |
	LDX #$001E				;$BBC7F6   |
CODE_BBC7F9:					;	   |
	LDA [$D9],y				;$BBC7F9   |
	STA $7E5972,x				;$BBC7FB   |
	DEY					;$BBC7FF   |
	DEY					;$BBC800   |
	DEX					;$BBC801   |
	DEX					;$BBC802   |
	BPL CODE_BBC7F9				;$BBC803   |
	LDY #$004B				;$BBC805   |
	LDX #$001E				;$BBC808   |
CODE_BBC80B:					;	   |
	LDA [$D9],y				;$BBC80B   |
	STA $7E5992,x				;$BBC80D   |
	DEY					;$BBC811   |
	DEY					;$BBC812   |
	DEX					;$BBC813   |
	DEX					;$BBC814   |
	BPL CODE_BBC80B				;$BBC815   |
	LDY #$006B				;$BBC817   |
	LDX #$001E				;$BBC81A   |
CODE_BBC81D:					;	   |
	LDA [$D9],y				;$BBC81D   |
	STA $7E59B2,x				;$BBC81F   |
	DEY					;$BBC823   |
	DEY					;$BBC824   |
	DEX					;$BBC825   |
	DEX					;$BBC826   |
	BPL CODE_BBC81D				;$BBC827   |
	LDY #$008B				;$BBC829   |
	LDX #$001E				;$BBC82C   |
CODE_BBC82F:					;	   |
	LDA [$D9],y				;$BBC82F   |
	STA $7E59D2,x				;$BBC831   |
	DEY					;$BBC835   |
	DEY					;$BBC836   |
	DEX					;$BBC837   |
	DEX					;$BBC838   |
	BPL CODE_BBC82F				;$BBC839   |
	LDY #$00AB				;$BBC83B   |
	LDX #$001E				;$BBC83E   |
CODE_BBC841:					;	   |
	LDA [$D9],y				;$BBC841   |
	STA $7E59F2,x				;$BBC843   |
	DEY					;$BBC847   |
	DEY					;$BBC848   |
	DEX					;$BBC849   |
	DEX					;$BBC84A   |
	BPL CODE_BBC841				;$BBC84B   |
	LDA #$0040				;$BBC84D   |
	TSB $06A3				;$BBC850   |
	LDA $08A4				;$BBC853   |
	JSL CODE_808837				;$BBC856   |
	RTL					;$BBC85A  /

CODE_BBC85B:
	JSR CODE_BBC86F				;$BBC85B  \
	LDA $060F				;$BBC85E   |
	EOR #$0001				;$BBC861   |
	STA $060F				;$BBC864   |
	JSR CODE_BBC8B7				;$BBC867   |
	STZ $6E					;$BBC86A   |
	STZ current_player_mount		;$BBC86C   |
	RTL					;$BBC86E  /

CODE_BBC86F:
	LDA #$007E				;$BBC86F  \
	STA $28					;$BBC872   |
	LDA #$5000				;$BBC874   |
	LDX $060F				;$BBC877   |
	BEQ CODE_BBC880				;$BBC87A   |
	CLC					;$BBC87C   |
	ADC #$0365				;$BBC87D   |
CODE_BBC880:					;	   |
	STA $26					;$BBC880   |
	SEP #$20				;$BBC882   |
	LDX #$0000				;$BBC884   |
	LDY #$0000				;$BBC887   |
CODE_BBC88A:					;	   |
	LDA $D1,x				;$BBC88A   |
	STA [$26],y				;$BBC88C   |
	INY					;$BBC88E   |
	INX					;$BBC88F   |
	CPX #$0008				;$BBC890   |
	BNE CODE_BBC88A				;$BBC893   |
	LDX #$0000				;$BBC895   |
CODE_BBC898:					;	   |
	LDA $064A,x				;$BBC898   |
	STA [$26],y				;$BBC89B   |
	INY					;$BBC89D   |
	INX					;$BBC89E   |
	CPX #$02BD				;$BBC89F   |
	BNE CODE_BBC898				;$BBC8A2   |
	LDX #$0000				;$BBC8A4   |
CODE_BBC8A7:					;	   |
	LDA.l $7E5972,x				;$BBC8A7   |
	STA [$26],y				;$BBC8AB   |
	INY					;$BBC8AD   |
	INX					;$BBC8AE   |
	CPX #$00A0				;$BBC8AF   |
	BNE CODE_BBC8A7				;$BBC8B2   |
	REP #$20				;$BBC8B4   |
	RTS					;$BBC8B6  /

CODE_BBC8B7:
	LDA #$007E				;$BBC8B7  \
	STA $28					;$BBC8BA   |
	LDA #$5000				;$BBC8BC   |
	LDX $060F				;$BBC8BF   |
	BEQ CODE_BBC8C8				;$BBC8C2   |
	CLC					;$BBC8C4   |
	ADC #$0365				;$BBC8C5   |
CODE_BBC8C8:					;	   |
	STA $26					;$BBC8C8   |
	SEP #$20				;$BBC8CA   |
	LDX #$0000				;$BBC8CC   |
	LDY #$0000				;$BBC8CF   |
CODE_BBC8D2:					;	   |
	LDA [$26],y				;$BBC8D2   |
	STA $D1,x				;$BBC8D4   |
	INY					;$BBC8D6   |
	INX					;$BBC8D7   |
	CPX #$0008				;$BBC8D8   |
	BNE CODE_BBC8D2				;$BBC8DB   |
	LDX #$0000				;$BBC8DD   |
CODE_BBC8E0:					;	   |
	LDA [$26],y				;$BBC8E0   |
	STA $064A,x				;$BBC8E2   |
	INY					;$BBC8E5   |
	INX					;$BBC8E6   |
	CPX #$02BD				;$BBC8E7   |
	BNE CODE_BBC8E0				;$BBC8EA   |
	LDX #$0000				;$BBC8EC   |
CODE_BBC8EF:					;	   |
	LDA [$26],y				;$BBC8EF   |
	STA $7E5972,x				;$BBC8F1   |
	INY					;$BBC8F5   |
	INX					;$BBC8F6   |
	CPX #$00A0				;$BBC8F7   |
	BNE CODE_BBC8EF				;$BBC8FA   |
	REP #$20				;$BBC8FC   |
	RTS					;$BBC8FE  /

DATA_BBC8FF:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00

if !version == 0
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00
endif


%mirror(DATA_FBE800)
	dw DATA_FF2A08
	dw DATA_FF2A38
	dw DATA_FF2A66
	dw DATA_FF2A94
	dw DATA_FF2ADA
	dw DATA_FF2B2E
	dw DATA_FF2B3C
	dw DATA_FF2B4A
	dw DATA_FF2B5C
	dw DATA_FF2B6E
	dw DATA_FF2B7C
	dw DATA_FF2B8A
	dw DATA_FF2B9C
	dw DATA_FF2BAE
	dw DATA_FF2BBC
	dw DATA_FF2BCA
	dw DATA_FF2BD8
	dw DATA_FF2BEA
	dw DATA_FF2BF8
	dw DATA_FF2C0A
	dw DATA_FF2C1C
	dw DATA_FF2C2A
	dw DATA_FF2C3C
	dw DATA_FF2C4A
	dw DATA_FF2C58
	dw DATA_FF2C66
	dw DATA_FF2C74
	dw DATA_FF2C86
	dw DATA_FF2C98
	dw DATA_FF2CAA
	dw DATA_FF2CBC
	dw DATA_FF2CCE
	dw DATA_FF2CE0
	dw DATA_FF2CF2
	dw DATA_FF2D04
	dw DATA_FF2D16
	dw DATA_FF2D24
	dw DATA_FF2D36
	dw DATA_FF2D44
	dw DATA_FF2D52
	dw DATA_FF2D60
	dw DATA_FF2DEA
	dw DATA_FF2DF8
	dw DATA_FF2E02
	dw DATA_FF2E10
	dw DATA_FF2E1A
	dw DATA_FF2E28
	dw DATA_FF2E36
	dw DATA_FF2E44
	dw DATA_FF2E52
	dw DATA_FF2E60
	dw DATA_FF2E72
	dw DATA_FF2E84
	dw DATA_FF2E92
	dw DATA_FF2EA0
	dw DATA_FF2EAE
	dw DATA_FF2EC0
	dw DATA_FF2ED2
	dw DATA_FF2EE0
	dw DATA_FF2EEE
	dw DATA_FF2EFC
	dw DATA_FF2F0E
	dw DATA_FF2F20
	dw DATA_FF2F32
	dw DATA_FF2F44
	dw DATA_FF2F52
	dw DATA_FF2F60
	dw DATA_FF2F72
	dw DATA_FF2F84
	dw DATA_FF2F96
	dw DATA_FF2FA4
	dw DATA_FF2FB6
	dw DATA_FF2FC4
	dw DATA_FF2FD2
	dw DATA_FF2FE4
	dw DATA_FF2FF2
	dw DATA_FF3004
	dw DATA_FF3016
	dw DATA_FF3028
	dw DATA_FF303A
	dw DATA_FF304C
	dw DATA_FF305E
	dw DATA_FF3070
	dw DATA_FF3082
	dw DATA_FF3094
	dw DATA_FF30A2
	dw DATA_FF30B0
	dw DATA_FF30BE
	dw DATA_FF30C8
	dw DATA_FF30DA
	dw DATA_FF311E
	dw DATA_FF312C
	dw DATA_FF3136
	dw DATA_FF3144
	dw DATA_FF314E
	dw DATA_FF3158
	dw DATA_FF316A
	dw DATA_FF3178
	dw DATA_FF318E
	dw DATA_FF31A4
	dw DATA_FF31BA
	dw DATA_FF31D0
	dw DATA_FF31E2
	dw DATA_FF3290
	dw DATA_FF329A
	dw DATA_FF32A4
	dw DATA_FF32AE
	dw DATA_FF32B8
	dw DATA_FF32C2
	dw DATA_FF32C8
	dw DATA_FF32D2
	dw DATA_FF32E0
	dw DATA_FF32EA
	dw DATA_FF32F4
	dw DATA_FF32FA
	dw DATA_FF3304
	dw DATA_FF3312
	dw DATA_FF331C
	dw DATA_FF3326
	dw DATA_FF3334
	dw DATA_FF3342
	dw DATA_FF3354
	dw DATA_FF3362
	dw DATA_FF3370
	dw DATA_FF3382
	dw DATA_FF3390
	dw DATA_FF339A
	dw DATA_FF33A8
	dw DATA_FF33B6
	dw DATA_FF33C8
	dw DATA_FF33DA
	dw DATA_FF33E4
	dw DATA_FF33F2
	dw DATA_FF3400
	dw DATA_FF340E
	dw DATA_FF3420
	dw DATA_FF342E
	dw DATA_FF343C
	dw DATA_FF347C
	dw DATA_FF34CE
	dw DATA_FF34D4
	dw DATA_FF34DE
	dw DATA_FF34E8
	dw DATA_FF34F2
	dw DATA_FF34FC
	dw DATA_FF3506
	dw DATA_FF3510
	dw DATA_FF351A
	dw DATA_FF3524
	dw DATA_FF352E
	dw DATA_FF352E
	dw DATA_FF3538
	dw DATA_FF3542
	dw DATA_FF354C
	dw DATA_FF355A
	dw DATA_FF3568
	dw DATA_FF358A
	dw DATA_FF35AC
	dw DATA_FF35CE
	dw DATA_FF3648
	dw DATA_FF366A
	dw DATA_FF368C
	dw DATA_FF36AE
	dw DATA_FF36D0
	dw DATA_FF36F2
	dw DATA_FF3718
	dw DATA_FF373E
	dw DATA_FF3760
	dw DATA_FF3782
	dw DATA_FF37A4
	dw DATA_FF37C6
	dw DATA_FF37E8
	dw DATA_FF380A
	dw DATA_FF382C
	dw DATA_FF384E
	dw DATA_FF3870
	dw DATA_FF3892
	dw DATA_FF38B4
	dw DATA_FF38D6
	dw DATA_FF38F8
	dw DATA_FF391A
	dw DATA_FF393C
	dw DATA_FF395E
	dw DATA_FF3980
	dw DATA_FF39A2
	dw DATA_FF39C4
	dw DATA_FF39E6
	dw DATA_FF3A08
	dw DATA_FF3A2A
	dw DATA_FF3A4C
	dw DATA_FF3A6E
	dw DATA_FF3A90
	dw DATA_FF3AB2
	dw DATA_FF3AD4
	dw DATA_FF3AF6
	dw DATA_FF3B18
	dw DATA_FF3B3A
	dw DATA_FF3B5C
	dw DATA_FF3B7E
	dw DATA_FF3BA0
	dw DATA_FF3BC2
	dw DATA_FF3BE4
	dw DATA_FF3C06
	dw DATA_FF3C2C
	dw DATA_FF3C52
	dw DATA_FF3C78
	dw DATA_FF3C9E
	dw DATA_FF3CC4
	dw DATA_FF3CEA
	dw DATA_FF3D10
	dw DATA_FF3D36
	dw DATA_FF3D5C
	dw DATA_FF3D82
	dw DATA_FF3DA8
	dw DATA_FF3DCE
	dw DATA_FF3DF8
	dw DATA_FF3E1E
	dw DATA_FF3E44
	dw DATA_FF3E6A
	dw DATA_FF3E8C
	dw DATA_FF3EAE
	dw DATA_FF3ED0
	dw DATA_FF3EF2
	dw DATA_FF3F14
	dw DATA_FF3F36
	dw DATA_FF3F58
	dw DATA_FF3F7A
	dw DATA_FF3F9C
	dw DATA_FF3FBE
	dw DATA_FF3FE0
	dw DATA_FF4002
	dw DATA_FF4024
	dw DATA_FF4046
	dw DATA_FF4068
	dw DATA_FF408A
	dw DATA_FF40AC
	dw DATA_FF40CE
	dw DATA_FF40F0
	dw DATA_FF4112
	dw DATA_FF4134
if !version == 0
	dw DATA_FF4154
else
	dw DATA_FF4156
endif
	dw DATA_FF4156
	dw DATA_FF4178
	dw DATA_FF419A
	dw DATA_FF41BC
	dw DATA_FF41DE
	dw DATA_FF41DE
	dw DATA_FF4200
	dw DATA_FF4222
	dw DATA_FF4244
	dw DATA_FF4266
	dw DATA_FF4266
	dw DATA_FF4266
	dw DATA_FF4288
	dw DATA_FF42AA
	dw DATA_FF42CC
	dw DATA_FF42EE
	dw DATA_FF4310
	dw DATA_FF4332
	dw DATA_FF4354
	dw DATA_FF4376
	dw DATA_FF4398
	dw DATA_FF43BA
	dw DATA_FF43DC
	dw DATA_FF43FE
	dw DATA_FF4420
	dw DATA_FF4442
	dw DATA_FF4464
	dw DATA_FF4486
	dw DATA_FF44A8
	dw DATA_FF44CA
	dw DATA_FF44EC
	dw DATA_FF450E
	dw DATA_FF4530
	dw DATA_FF4552
	dw DATA_FF4574
	dw DATA_FF4596
	dw DATA_FF45B8
	dw DATA_FF45DA
	dw DATA_FF45FC
	dw DATA_FF461E
	dw DATA_FF4640
	dw DATA_FF4662
	dw DATA_FF4684
	dw DATA_FF46A6
	dw DATA_FF46C8
	dw DATA_FF46EA
	dw DATA_FF470C
	dw DATA_FF472E
	dw DATA_FF4750
	dw DATA_FF4772
	dw DATA_FF4794
	dw DATA_FF47B6
	dw DATA_FF47D8
	dw DATA_FF47FA
	dw DATA_FF481C
	dw DATA_FF483E
	dw DATA_FF4860
	dw DATA_FF4882
	dw DATA_FF48A4
	dw DATA_FF48C6
	dw DATA_FF48E8
	dw DATA_FF490A
	dw DATA_FF492C
	dw DATA_FF494E
	dw DATA_FF4970
	dw DATA_FF4992
	dw DATA_FF49B4
	dw DATA_FF49D6
	dw DATA_FF49F8
	dw DATA_FF4A1A
	dw DATA_FF4A3C
	dw DATA_FF4A5E
	dw DATA_FF4A80
	dw DATA_FF4AA2
	dw DATA_FF4AC4
	dw DATA_FF4AE6
	dw DATA_FF4B08
	dw DATA_FF4B2A
	dw DATA_FF4B4C
	dw DATA_FF4B6E
	dw DATA_FF4B90
	dw DATA_FF4BB2
	dw DATA_FF4BD4
	dw DATA_FF4BF6
	dw DATA_FF4C18
	dw DATA_FF4C3A
	dw DATA_FF4C5C
	dw DATA_FF4C7E
	dw DATA_FF4CA0
	dw DATA_FF4CC2
	dw DATA_FF4CE4
	dw DATA_FF4D06
	dw DATA_FF4D28
	dw DATA_FF4D4A
	dw DATA_FF4D6C
	dw DATA_FF4D8E
	dw DATA_FF4DB0
	dw DATA_FF4DD2
	dw DATA_FF4DF4
	dw DATA_FF4E16
	dw DATA_FF4E16
	dw DATA_FF4E38
	dw DATA_FF4E5A
	dw DATA_FF4E7C
	dw DATA_FF4E9E
	dw DATA_FF4EC0
	dw DATA_FF4EE2
	dw DATA_FF4F04
	dw DATA_FF4F26
	dw DATA_FF4F48
	dw DATA_FF4F6A
	dw DATA_FF4F8C
	dw DATA_FF4FAE
	dw DATA_FF4FD0
	dw DATA_FF4FF2
	dw DATA_FF5014
	dw DATA_FF5036
	dw DATA_FF5058
	dw DATA_FF507A
	dw DATA_FF509C
	dw DATA_FF50BE
	dw DATA_FF50E0
	dw DATA_FF5102
	dw DATA_FF5124
	dw DATA_FF5146
	dw DATA_FF5168
	dw DATA_FF518A
	dw DATA_FF51AC
	dw DATA_FF51CE
	dw DATA_FF51F0
	dw DATA_FF5212
	dw DATA_FF5234
	dw DATA_FF5256
	dw DATA_FF5278
	dw DATA_FF529A
	dw DATA_FF52BC
	dw DATA_FF52DE
	dw DATA_FF5300
	dw DATA_FF5322
	dw DATA_FF5344
	dw DATA_FF5366
	dw DATA_FF5388
	dw DATA_FF53AA
	dw DATA_FF53CC
	dw DATA_FF53EE
	dw DATA_FF5410
	dw DATA_FF5432
	dw DATA_FF5454
	dw DATA_FF5476
	dw DATA_FF5498
	dw DATA_FF54BA
	dw DATA_FF54DC
	dw DATA_FF54FE
	dw DATA_FF5520
	dw DATA_FF5542
	dw DATA_FF5564
	dw DATA_FF5586
	dw DATA_FF55A8
	dw DATA_FF55CA
	dw DATA_FF55EC
	dw DATA_FF560E
	dw DATA_FF5630
	dw DATA_FF5652
	dw DATA_FF5674
	dw DATA_FF5696
	dw DATA_FF56B8
	dw DATA_FF56DA
	dw DATA_FF5700
	dw DATA_FF5722
	dw DATA_FF5744
	dw DATA_FF5766
	dw DATA_FF5788
	dw DATA_FF57AA
	dw DATA_FF57CC
	dw DATA_FF57EE
	dw DATA_FF5810
	dw DATA_FF5832
	dw DATA_FF5854
	dw DATA_FF5876
	dw DATA_FF5898
	dw DATA_FF58BA
	dw DATA_FF58DC
	dw DATA_FF58FE
	dw DATA_FF5920
	dw DATA_FF5942
	dw DATA_FF5964
	dw DATA_FF5986
	dw DATA_FF59A8
	dw DATA_FF59CA
	dw DATA_FF59EC
	dw DATA_FF5A0E
	dw DATA_FF5A30
	dw DATA_FF5A52
	dw DATA_FF5A74
	dw DATA_FF5A96
	dw DATA_FF5AB8
	dw DATA_FF5ADA
	dw DATA_FF5AFC
	dw DATA_FF5B1E
	dw DATA_FF5B40
	dw DATA_FF5B62
	dw DATA_FF5B84
	dw DATA_FF5BA6
	dw DATA_FF5BC8
	dw DATA_FF5BEA
	dw DATA_FF5C0C
	dw DATA_FF5C2E
	dw DATA_FF5C50
	dw DATA_FF5C72
	dw DATA_FF5C94
	dw DATA_FF5CB6
	dw DATA_FF5CD8
	dw DATA_FF5CFA
	dw DATA_FF5D1C
	dw DATA_FF5D3E
	dw DATA_FF5D60
	dw DATA_FF5D82
	dw DATA_FF5DA4
	dw DATA_FF5DC6
	dw DATA_FF5DE8
	dw DATA_FF5E0A
	dw DATA_FF5E2C
	dw DATA_FF5E4E
	dw DATA_FF5E70
	dw DATA_FF5E92
	dw DATA_FF5EB4
	dw DATA_FF5ED6
	dw DATA_FF5EF8
	dw DATA_FF5F1A
	dw DATA_FF5F3C
	dw DATA_FF5F5E
	dw DATA_FF5F80
	dw DATA_FF5FA2
	dw DATA_FF5FC4
	dw DATA_FF5FE6
	dw DATA_FF6008
	dw DATA_FF602A
	dw DATA_FF604C
	dw DATA_FF606E
	dw DATA_FF6090
	dw DATA_FF60B2
	dw DATA_FF60D4
	dw DATA_FF60F6
	dw DATA_FF6118
	dw DATA_FF613A
	dw DATA_FF615C
	dw DATA_FF617E
	dw DATA_FF61A0
	dw DATA_FF61C2
	dw DATA_FF61E4
	dw DATA_FF6206
	dw DATA_FF6228
	dw DATA_FF624A
	dw DATA_FF626C
	dw DATA_FF628E
	dw DATA_FF62B0
	dw DATA_FF62D2
	dw DATA_FF62F4
	dw DATA_FF6316
	dw DATA_FF6338
	dw DATA_FF635A
	dw DATA_FF637C
	dw DATA_FF639E
	dw DATA_FF63C0
	dw DATA_FF63E2
	dw DATA_FF6436
	dw DATA_FF6440
	dw DATA_FF644A
	dw DATA_FF6454
	dw DATA_FF645E
	dw DATA_FF6468
	dw DATA_FF6472
	dw DATA_FF647C
	dw DATA_FF6486
	dw DATA_FF6490
	dw DATA_FF649A
	dw DATA_FF64A4
	dw DATA_FF64AE
	dw DATA_FF64B8
	dw DATA_FF64C2
	dw DATA_FF64CC
	dw DATA_FF64D6
	dw DATA_FF64E0
	dw DATA_FF64EA
	dw DATA_FF64F4
	dw DATA_FF64FE
	dw DATA_FF6508
	dw DATA_FF6512
	dw DATA_FF651C
	dw DATA_FF6526
	dw DATA_FF6530
	dw DATA_FF653A
	dw DATA_FF6544
	dw DATA_FF654E
	dw DATA_FF6558
	dw DATA_FF6562
	dw DATA_FF656C
	dw DATA_FF6576
	dw DATA_FF6580
	dw DATA_FF658A
	dw DATA_FF6594
	dw DATA_FF659E
	dw DATA_FF65A8
	dw DATA_FF65B2
	dw DATA_FF65C0
	dw DATA_FF65CE
	dw DATA_FF65DC
	dw DATA_FF65EA
	dw DATA_FF65EA
	dw DATA_FF664E
	dw DATA_FF664E
	dw DATA_FF6664
	dw DATA_FF667E
	dw DATA_FF6694
	dw DATA_FF66AE
	dw DATA_FF66C8
	dw DATA_FF66E2
	dw DATA_FF66FC
	dw DATA_FF6716
	dw DATA_FF672C
	dw DATA_FF6742
	dw DATA_FF6760
	dw DATA_FF6776
	dw DATA_FF6794
	dw DATA_FF67B2
	dw DATA_FF67D0
	dw DATA_FF67E6
	dw DATA_FF6804
	dw DATA_FF681E
	dw DATA_FF6838
	dw DATA_FF6856
	dw DATA_FF6870
	dw DATA_FF6886
	dw DATA_FF689C
	dw DATA_FF68B6
	dw DATA_FF68D4
	dw DATA_FF68EE
	dw DATA_FF6908
	dw DATA_FF691E
	dw DATA_FF6934
	dw DATA_FF694E
	dw DATA_FF696C
	dw DATA_FF6986
	dw DATA_FF69A0
	dw DATA_FF69BA
	dw DATA_FF69D4
	dw DATA_FF69EA
	dw DATA_FF6A04
	dw DATA_FF6A1A
	dw DATA_FF6A30
	dw DATA_FF6A4A
	dw DATA_FF6A60
	dw DATA_FF6A7A
	dw DATA_FF6C8E
	dw DATA_FF6CE6
	dw DATA_FF6CF0
	dw DATA_FF6D24
	dw DATA_FF6D2E
	dw DATA_FF6D62
	dw DATA_FF6D6C
	dw DATA_FF6DB8
	dw DATA_FF6DBE
	dw DATA_FF6DC8
	dw DATA_FF6DD6
	dw DATA_FF6DE4
	dw DATA_FF6DF6
	dw DATA_FF6E08
	dw DATA_FF6E1A
	dw DATA_FF6E2C
	dw DATA_FF6E3A
	dw DATA_FF6E48
	dw DATA_FF6E56
	dw DATA_FF6E9E
	dw DATA_FF6EA8
	dw DATA_FF6EB2
	dw DATA_FF6EBC
	dw DATA_FF6EC6
	dw DATA_FF6ED8
	dw DATA_FF6EE6
	dw DATA_FF6EF8
	dw DATA_FF6F06
	dw DATA_FF6F18
	dw DATA_FF6F2A
	dw DATA_FF6F38
	dw DATA_FF6F46
	dw DATA_FF6F54
	dw DATA_FF6F66
	dw DATA_FF6F7C
	dw DATA_FF6F8A
	dw DATA_FF6F98
	dw DATA_FF6FA6
	dw DATA_FF6FB4
	dw DATA_FF6FC2
	dw DATA_FF6FD0
	dw DATA_FF6FDE
	dw DATA_FF7022
	dw DATA_FF7030
	dw DATA_FF703E
	dw DATA_FF704C
	dw DATA_FF705A
	dw DATA_FF7068
	dw DATA_FF70D2
	dw DATA_FF70E8
	dw DATA_FF70FE
	dw DATA_FF7118
	dw DATA_FF7132
	dw DATA_FF714C
	dw DATA_FF7162
	dw DATA_FF7178
	dw DATA_FF7192
	dw DATA_FF71AC
	dw DATA_FF71C6
	dw DATA_FF71E0
	dw DATA_FF71FA
	dw DATA_FF7210
	dw DATA_FF7226
	dw DATA_FF7250
	dw DATA_FF727A
	dw DATA_FF72A0
	dw DATA_FF72C6
	dw DATA_FF72EC
	dw DATA_FF7316
	dw DATA_FF733C
	dw DATA_FF7356
	dw DATA_FF7374
	dw DATA_FF7396
	dw DATA_FF73AC
	dw DATA_FF73C6
	dw DATA_FF73E0
	dw DATA_FF73FA
	dw DATA_FF7414
	dw DATA_FF742E
	dw DATA_FF7440
	dw DATA_FF7452
	dw DATA_FF7464
	dw DATA_FF747E
	dw DATA_FF7498
	dw DATA_FF74B6
	dw DATA_FF7546
	dw DATA_FF7550
	dw DATA_FF755A
	dw DATA_FF7564
	dw DATA_FF756E
	dw DATA_FF7588
	dw DATA_FF7592
	dw DATA_FF759C
	dw DATA_FF75A6
	dw DATA_FF75C0
	dw DATA_FF75CA
	dw DATA_FF75E4
	dw DATA_FF75F6
	dw DATA_FF7600
	dw DATA_FF760E
	dw DATA_FF7620
	dw DATA_FF762E
	dw DATA_FF763C
	dw DATA_FF764A
	dw DATA_FF7664
	dw DATA_FF767E
	dw DATA_FF7698
	dw DATA_FF76B2
	dw DATA_FF76CC
	dw DATA_FF76D6
	dw DATA_FF776A
	dw DATA_FF777C
	dw DATA_FF778E
	dw DATA_FF77A0
	dw DATA_FF7922
	dw DATA_FF7B7A
	dw DATA_FF7CAA
	dw DATA_FF7CB0
	dw DATA_FF7CBA
	dw DATA_FF7CD0
	dw DATA_FF7CE6
	dw DATA_FF7D00
	dw DATA_FF7D38
	dw DATA_FF7D42
	dw DATA_FF7D4C
	dw DATA_FF7D5A
	dw DATA_FF7D7E
	dw DATA_FF7D8C
	dw DATA_FF7D9A
	dw DATA_FF7DAC
	dw DATA_FF7DBE
	dw DATA_FF7DD0
	dw DATA_FF7DDE
	dw DATA_FF7DEC
	dw DATA_FF7DFE
	dw DATA_FF7E0C
	dw DATA_FF7E1E
	dw DATA_FF7E2C
	dw DATA_FF7E3E
	dw DATA_FF7E50
	dw DATA_FF7E5E
	dw DATA_FF7E70
	dw DATA_FF7E86
	dw DATA_FF7E98
	dw DATA_FF7EAE
	dw DATA_FF7EC4
	dw DATA_FF7ED2
	dw DATA_FF7EE0
	dw DATA_FF7EFA
	dw DATA_FF7F08
	dw DATA_FF7F1E
	dw DATA_FF7F34
	dw DATA_FF7F42
	dw DATA_FF7F50
	dw DATA_FF7F5E
	dw DATA_FF7F6C
	dw DATA_FF7F7E
	dw DATA_FF7F90
	dw DATA_FF7F9E
	dw DATA_FF7FAC
	dw DATA_FF7FBE
	dw DATA_FF7FCC
	dw DATA_FF7FE2
	dw DATA_FF7FF0
	dw DATA_FF8002
	dw DATA_FF8014
	dw DATA_FF8022
	dw DATA_FF8034
	dw DATA_FF8042
	dw DATA_FF8050
	dw DATA_FF8066
	dw DATA_FF807C
	dw DATA_FF808A
	dw DATA_FF8098
	dw DATA_FF80AE
	dw DATA_FF80BC
	dw DATA_FF80CA
	dw DATA_FF80D8
	dw DATA_FF80E6
	dw DATA_FF80F4
	dw DATA_FF8106
	dw DATA_FF8118
	dw DATA_FF812E
	dw DATA_FF815A
	dw DATA_FF8168
	dw DATA_FF8176
	dw DATA_FF8184
	dw DATA_FF819A
	dw DATA_FF81A8
	dw DATA_FF81BA
	dw DATA_FF81CC
	dw DATA_FF81DA
	dw DATA_FF81EC
	dw DATA_FF81FA
	dw DATA_FF8208
	dw DATA_FF8216
	dw DATA_FF8228
	dw DATA_FF823A
	dw DATA_FF8248
	dw DATA_FF8256
	dw DATA_FF8264
	dw DATA_FF8276
	dw DATA_FF8284
	dw DATA_FF8296
	dw DATA_FF82A8
	dw DATA_FF82BA
	dw DATA_FF82C8
	dw DATA_FF82D6
	dw DATA_FF82EC
	dw DATA_FF8302
	dw DATA_FF8310
	dw DATA_FF8322
	dw DATA_FF8322
	dw DATA_FF8330
	dw DATA_FF8330
	dw DATA_FF833E
	dw DATA_FF834C
	dw DATA_FF835A
	dw DATA_FF8368
	dw DATA_FF8376
	dw DATA_FF8388
	dw DATA_FF8396
	dw DATA_FF83A4
	dw DATA_FF83B2
	dw DATA_FF83C4
	dw DATA_FF83D2
	dw DATA_FF83E4
	dw DATA_FF83F2
	dw DATA_FF8400
	dw DATA_FF8412
	dw DATA_FF8424
	dw DATA_FF8436
	dw DATA_FF8448
	dw DATA_FF845A
	dw DATA_FF846C
	dw DATA_FF847E
	dw DATA_FF848C
	dw DATA_FF849E
	dw DATA_FF84AC
	dw DATA_FF84BA
	dw DATA_FF84C8
	dw DATA_FF84D6
	dw DATA_FF84E4
	dw DATA_FF84F2
	dw DATA_FF8500
	dw DATA_FF8512
	dw DATA_FF8536
	dw DATA_FF8548
	dw DATA_FF855A
	dw DATA_FF856C
	dw DATA_FF857E
	dw DATA_FF8590
	dw DATA_FF85A2
	dw DATA_FF85B4
	dw DATA_FF85C6
	dw DATA_FF85D8
	dw DATA_FF85EE
	dw DATA_FF8604
	dw DATA_FF8616
	dw DATA_FF8628
	dw DATA_FF863A
	dw DATA_FF864C
	dw DATA_FF865E
	dw DATA_FF8670
	dw DATA_FF8670
	dw DATA_FF8670
	dw DATA_FF8686
	dw DATA_FF869C
	dw DATA_FF86B2
	dw DATA_FF86C8
	dw DATA_FF86DE
	dw DATA_FF86F4
	dw DATA_FF870A
	dw DATA_FF8720
	dw DATA_FF8736
	dw DATA_FF874C
	dw DATA_FF874C
	dw DATA_FF875E
	dw DATA_FF8774
	dw DATA_FF878A
	dw DATA_FF87A0
	dw DATA_FF87B6
	dw DATA_FF87CC
	dw DATA_FF87E2
	dw DATA_FF87F8
	dw DATA_FF880E
	dw DATA_FF8824
	dw DATA_FF883A
	dw DATA_FF8850
	dw DATA_FF8862
	dw DATA_FF8878
	dw DATA_FF888E
	dw DATA_FF88A4
	dw DATA_FF88B6
	dw DATA_FF88C8
	dw DATA_FF88DE
	dw DATA_FF88F4
	dw DATA_FF8906
	dw DATA_FF892E
	dw DATA_FF8944
	dw DATA_FF895E
	dw DATA_FF8978
	dw DATA_FF8992
	dw DATA_FF89B0
	dw DATA_FF89C6
	dw DATA_FF89DC
	dw DATA_FF89F2
	dw DATA_FF8A28
	dw DATA_FF8A42
	dw DATA_FF8A60
	dw DATA_FF8A7A
	dw DATA_FF8A98
	dw DATA_FF8AD0
	dw DATA_FF8ADA
	dw DATA_FF8AFE
	dw DATA_FF8B0C
	dw DATA_FF8B1A
	dw DATA_FF8B30
	dw DATA_FF8B3E
	dw DATA_FF8B4C
	dw DATA_FF8B62
	dw DATA_FF8B7C
	dw DATA_FF8B96
	dw DATA_FF8BA8
	dw DATA_FF8BBA
	dw DATA_FF8BCC
	dw DATA_FF8BDE
	dw DATA_FF8BF0
	dw DATA_FF8C02
	dw DATA_FF8C14
	dw DATA_FF8C22
	dw DATA_FF8C3C
	dw DATA_FF8C5A
	dw DATA_FF8C78
	dw DATA_FF8C96
	dw DATA_FF8CB4
	dw DATA_FF8CCE
	dw DATA_FF8CE8
	dw DATA_FF8D02
	dw DATA_FF8D1C
	dw DATA_FF8D36
	dw DATA_FF8D50
	dw DATA_FF8D6A
	dw DATA_FF8D96
	dw DATA_FF8DA8
	dw DATA_FF8DBA
	dw DATA_FF8DCC
	dw DATA_FF8DDE
	dw DATA_FF8DF0
	dw DATA_FF8E02
	dw DATA_FF8E14
	dw DATA_FF8E26
	dw DATA_FF8E38
	dw DATA_FF8E4A
	dw DATA_FF8E5C
	dw DATA_FF8E72
	dw DATA_FF8E88
	dw DATA_FF8E9E
	dw DATA_FF8EB4
	dw DATA_FF8EC6
	dw DATA_FF8ED8
	dw DATA_FF8EEA
	dw DATA_FF8EFC
	dw DATA_FF8F0E
	dw DATA_FF8F20
	dw DATA_FF8F36
	dw DATA_FF8F4C
	dw DATA_FF8F62
	dw DATA_FF8F78
	dw DATA_FF8F8E
	dw DATA_FF8FA4
	dw DATA_FF8FBA
	dw DATA_FF8FCC
	dw DATA_FF8FDE
	dw DATA_FF903E
	dw DATA_FF9048
	dw DATA_FF9056
	dw DATA_FF9064
	dw DATA_FF9072
	dw DATA_FF9080
	dw DATA_FF9092
	dw DATA_FF90A4
	dw DATA_FF90B2
	dw DATA_FF90C4
	dw DATA_FF90D2
	dw DATA_FF90E0
	dw DATA_FF90F2
	dw DATA_FF9100
	dw DATA_FF9112
	dw DATA_FF9124
	dw DATA_FF9136
	dw DATA_FF9148
	dw DATA_FF915A
	dw DATA_FF9168
	dw DATA_FF917A
	dw DATA_FF9188
	dw DATA_FF919A
	dw DATA_FF91AC
	dw DATA_FF91BE
	dw DATA_FF91CC
	dw DATA_FF91DE
	dw DATA_FF91EC
	dw DATA_FF91FE
	dw DATA_FF9210
	dw DATA_FF9222
	dw DATA_FF9234
	dw DATA_FF9246
	dw DATA_FF9258
	dw DATA_FF9266
	dw DATA_FF9274
	dw DATA_FF9282
	dw DATA_FF9294
	dw DATA_FF92A6
	dw DATA_FF92B8
	dw DATA_FF92C6
	dw DATA_FF92D4
	dw DATA_FF9328
	dw DATA_FF9332
	dw DATA_FF933C
	dw DATA_FF934A
	dw DATA_FF9358
	dw DATA_FF9366
	dw DATA_FF9374
	dw DATA_FF9386
	dw DATA_FF9390
	dw DATA_FF939E
	dw DATA_FF93A8
	dw DATA_FF93D4
	dw DATA_FF93DE
	dw DATA_FF93EC
	dw DATA_FF943C
	dw DATA_FF9452
	dw DATA_FF9468
	dw DATA_FF947E
	dw DATA_FF9494
	dw DATA_FF94AA
	dw DATA_FF94C0
	dw DATA_FF94D6
	dw DATA_FF94EC
	dw DATA_FF9502
	dw DATA_FF9518
	dw DATA_FF952E
	dw DATA_FF9544
	dw DATA_FF955A
	dw DATA_FF9570
	dw DATA_FF9586
	dw DATA_FF959C
	dw DATA_FF95B2
	dw DATA_FF95C8
	dw DATA_FF95DE
	dw DATA_FF95F4
	dw DATA_FF960A
	dw DATA_FF9620
	dw DATA_FF9636
	dw DATA_FF964C
	dw DATA_FF9662
	dw DATA_FF9678
	dw DATA_FF96C4
	dw DATA_FF96CA
	dw DATA_FF96D4
	dw DATA_FF970A
	dw DATA_FF9740
	dw DATA_FF97A8
	dw DATA_FF97EA
	dw DATA_FF9816
	dw DATA_FF981C
	dw DATA_FF983C
	dw DATA_FF9842
	dw DATA_FF9862
	dw DATA_FF9868
	dw DATA_FF9872
	dw DATA_FF9892
	dw DATA_FF98A0
	dw DATA_FF98AA
	dw DATA_FF98B8
	dw DATA_FF98C6
	dw DATA_FF98D4
	dw DATA_FF98E2
	dw DATA_FF98EC
	dw DATA_FF98FA
	dw DATA_FF990C
	dw DATA_FF991A
	dw DATA_FF9928
	dw DATA_FF9936
	dw DATA_FF9944
	dw DATA_FF994E
	dw DATA_FF995C
	dw DATA_FF996A
	dw DATA_FF997C
	dw DATA_FF998A
	dw DATA_FF9998
	dw DATA_FF99A2
	dw DATA_FF99AC
	dw DATA_FF99BA
	dw DATA_FF99C8
	dw DATA_FF99DA
	dw DATA_FF99EC
	dw DATA_FF99FE
	dw DATA_FF9A0C
	dw DATA_FF9A1A
	dw DATA_FF9A60
	dw DATA_FF9A76
	dw DATA_FF9A76
	dw DATA_FF9A76
	dw DATA_FF9A88
	dw DATA_FF9A88
	dw DATA_FF9A88
	dw DATA_FF9A88
	dw DATA_FF9A9A
	dw DATA_FF9A9A
	dw DATA_FF9A9A
	dw DATA_FF9A9A
	dw DATA_FF9A9A
	dw DATA_FF9AAC
	dw DATA_FF9ABE
	dw DATA_FF9ABE
	dw DATA_FF9ABE
	dw DATA_FF9AD0
	dw DATA_FF9AD0
	dw DATA_FF9AD0
	dw DATA_FF9AD0
	dw DATA_FF9AE2
	dw DATA_FF9AE2
	dw DATA_FF9AE2
	dw DATA_FF9AE2
	dw DATA_FF9AE2
	dw DATA_FF9AF4
	dw DATA_FF9B06
	dw DATA_FF9B18
	dw DATA_FF9B76
	dw DATA_FF9B80
	dw DATA_FF9B8E
	dw DATA_FF9B98
	dw DATA_FF9BA2
	dw DATA_FF9BB8
	dw DATA_FF9BC2
	dw DATA_FF9BCC
	dw DATA_FF9BE2
	dw DATA_FF9BF8
	dw DATA_FF9C06
	dw DATA_FF9C14
	dw DATA_FF9C22
	dw DATA_FF9C30
	dw DATA_FF9C3E
	dw DATA_FF9C50
	dw DATA_FF9C5E
	dw DATA_FF9C6C
	dw DATA_FF9C7E
	dw DATA_FF9C94
	dw DATA_FF9CA6
	dw DATA_FF9CB8
	dw DATA_FF9CC6
	dw DATA_FF9CD4
	dw DATA_FF9CE6
	dw DATA_FF9CF4
	dw DATA_FF9D06
	dw DATA_FF9D14
	dw DATA_FF9D26
	dw DATA_FF9DA2
	dw DATA_FF9DAC
	dw DATA_FF9DD0
	dw DATA_FF9DDE
	dw DATA_FF9DE8
	dw DATA_FF9DF6
	dw DATA_FF9E04
	dw DATA_FF9E12
	dw DATA_FF9E20
	dw DATA_FF9E44
	dw DATA_FF9E52
	dw DATA_FF9E60
	dw DATA_FF9E72
	dw DATA_FF9E84
	dw DATA_FF9E92
	dw DATA_FF9EA0
	dw DATA_FF9EC8
	dw DATA_FF9ED6
	dw DATA_FF9EE4
	dw DATA_FF9EF2
	dw DATA_FF9F00
	dw DATA_FF9F0E
	dw DATA_FF9F1C
	dw DATA_FF9F2A
	dw DATA_FF9F38
	dw DATA_FF9F58
	dw DATA_FF9F6A
	dw DATA_FF9F7C
	dw DATA_FF9F8E
	dw DATA_FF9FAC
	dw DATA_FFA004
	dw DATA_FFA00A
	dw DATA_FFA018
	dw DATA_FFA022
	dw DATA_FFA030
	dw DATA_FFA03A
	dw DATA_FFA048
	dw DATA_FFA056
	dw DATA_FFA068
	dw DATA_FFA07A
	dw DATA_FFA08C
	dw DATA_FFA09A
	dw DATA_FFA0AC
	dw DATA_FFA0BE
	dw DATA_FFA0D0
	dw DATA_FFA0E2
	dw DATA_FFA0F0
	dw DATA_FFA0FE
	dw DATA_FFA10C
	dw DATA_FFA11A
	dw DATA_FFA128
	dw DATA_FFA136
	dw DATA_FFA144
	dw DATA_FFA152
	dw DATA_FFA160
	dw DATA_FFA16E
	dw DATA_FFA17C
	dw DATA_FFA18A
	dw DATA_FFA19C
	dw DATA_FFA1AA
	dw DATA_FFA1B8
	dw DATA_FFA1C6
	dw DATA_FFA1D4
	dw DATA_FFA1E2
	dw DATA_FFA1F0
	dw DATA_FFA202
	dw DATA_FFA214
	dw DATA_FFA226
	dw DATA_FFA238
	dw DATA_FFA246
	dw DATA_FFA254
	dw DATA_FFA266
	dw DATA_FFA274
	dw DATA_FFA286
	dw DATA_FFA298
	dw DATA_FFA2D8
	dw DATA_FFA2EA
	dw DATA_FFA2FC
	dw DATA_FFA312
	dw DATA_FFA328
	dw DATA_FFA33E
	dw DATA_FFA354
	dw DATA_FFA36A
	dw DATA_FFA384
	dw DATA_FFA396
	dw DATA_FFA3A8
	dw DATA_FFA3BE
	dw DATA_FFA3D4
	dw DATA_FFA3E6
	dw DATA_FFA3F8
	dw DATA_FFA40A
	dw DATA_FFA424
	dw DATA_FFA43A
	dw DATA_FFA454
	dw DATA_FFA466
	dw DATA_FFA478
	dw DATA_FFA48A
	dw DATA_FFA4DC
	dw DATA_FFA4EA
	dw DATA_FFA4F4
	dw DATA_FFA502
	dw DATA_FFA50C
	dw DATA_FFA51A
	dw DATA_FFA524
	dw DATA_FFA532
	dw DATA_FFA54A
	dw DATA_FFA560
	dw DATA_FFA57A
	dw DATA_FFA590
	dw DATA_FFA5A6
	dw DATA_FFA5C0
	dw DATA_FFA5DA
	dw DATA_FFA5F4
	dw DATA_FFA60E
	dw DATA_FFA62C
	dw DATA_FFA646
	dw DATA_FFA65C
	dw DATA_FFA676
	dw DATA_FFA690
	dw DATA_FFA6AA
	dw DATA_FFA6C4
	dw DATA_FFA6DA
	dw DATA_FFA6F4
	dw DATA_FFA70E
	dw DATA_FFA728
	dw DATA_FFA764
	dw DATA_FFA772
	dw DATA_FFA780
	dw DATA_FFA792
	dw DATA_FFA7A4
	dw DATA_FFA7B2
	dw DATA_FFA7C4
	dw DATA_FFA7D2
	dw DATA_FFA7E4
	dw DATA_FFA7F2
	dw DATA_FFA804
	dw DATA_FFA812
	dw DATA_FFA824
	dw DATA_FFA836
	dw DATA_FFA856
	dw DATA_FFA864
	dw DATA_FFA876
	dw DATA_FFA884
	dw DATA_FFA896
	dw DATA_FFA8A8
	dw DATA_FFA98C
	dw DATA_FFA996
	dw DATA_FFA9A0
	dw DATA_FFA9AA
	dw DATA_FFA9B8
	dw DATA_FFA9C6
	dw DATA_FFA9D8
	dw DATA_FFA9EA
	dw DATA_FFAA00
	dw DATA_FFAA16
	dw DATA_FFAA2C
	dw DATA_FFAA42
	dw DATA_FFAA58
	dw DATA_FFAA6A
	dw DATA_FFAA7C
	dw DATA_FFAA8E
	dw DATA_FFAAA0
	dw DATA_FFAAB6
	dw DATA_FFAAC4
	dw DATA_FFAAD2
	dw DATA_FFAAE8
	dw DATA_FFAB16
	dw DATA_FFAB30
	dw DATA_FFAB80
	dw DATA_FFAB86
	dw DATA_FFAB90
	dw DATA_FFAB9A
	dw DATA_FFABA8
	dw DATA_FFABBA
	dw DATA_FFAC30
	dw DATA_FFAC46
	dw DATA_FFAC5C
	dw DATA_FFAC6E
	dw DATA_FFAC80
	dw DATA_FFAC92
	dw DATA_FFACA8
	dw DATA_FFACBA
	dw DATA_FFACCC
	dw DATA_FFACDE
	dw DATA_FFACEC
	dw DATA_FFACFE
	dw DATA_FFAD10
	dw DATA_FFAD1E
	dw DATA_FFAD30
	dw DATA_FFAD42
	dw DATA_FFAD54
	dw DATA_FFAD66
	dw DATA_FFAD78
	dw DATA_FFAD8A
	dw DATA_FFAD9C
	dw DATA_FFADAA
	dw DATA_FFADB8
	dw DATA_FFADC6
	dw DATA_FFADD4
	dw DATA_FFADE2
	dw DATA_FFADF0
	dw DATA_FFADFE
	dw DATA_FFAE0C
if !version == 0
	dw DATA_FFAE1E
else
	dw DATA_FFAE1E
endif
	dw DATA_FFAE30
	dw DATA_FFAE42
	dw DATA_FFAE54
	dw DATA_FFAE66
	dw DATA_FFAE7C
	dw DATA_FFAE8E
	dw DATA_FFAEA0
	dw DATA_FFAEB2
	dw DATA_FFAEC4
	dw DATA_FFAEDA
	dw DATA_FFAEEC
	dw DATA_FFAEEC
	dw DATA_FFAF02
	dw DATA_FFAF14
	dw DATA_FFAF26
	dw DATA_FFAF38
	dw DATA_FFAF4E
	dw DATA_FFAF60
	dw DATA_FFAF76
	dw DATA_FFAF8C
	dw DATA_FFAFA2
	dw DATA_FFAFB8
	dw DATA_FFAFCE
	dw DATA_FFAFE4
	dw DATA_FFAFFA
	dw DATA_FFB010
	dw DATA_FFB026
	dw DATA_FFB03C
	dw DATA_FFB052
	dw DATA_FFB068
	dw DATA_FFB07E
	dw DATA_FFB094
	dw DATA_FFB0AA
	dw DATA_FFB0C0
	dw DATA_FFB0D6
	dw DATA_FFB0EC
	dw DATA_FFB102
	dw DATA_FFB118
	dw DATA_FFB126
	dw DATA_FFB134
	dw DATA_FFB142
	dw DATA_FFB150
	dw DATA_FFB15E
	dw DATA_FFB170
	dw DATA_FFB182
	dw DATA_FFB194
	dw DATA_FFB1A6
	dw DATA_FFB1B8
	dw DATA_FFB1B8
	dw DATA_FFB1C6
	dw DATA_FFB1D8
	dw DATA_FFB1E6
	dw DATA_FFB1F8
	dw DATA_FFB20A
	dw DATA_FFB21C
	dw DATA_FFB22A
	dw DATA_FFB238
	dw DATA_FFB246
	dw DATA_FFB254
	dw DATA_FFB262
	dw DATA_FFB274
	dw DATA_FFB2DC
	dw DATA_FFB2E6
	dw DATA_FFB2F4
	dw DATA_FFB2FE
	dw DATA_FFB308
	dw DATA_FFB312
	dw DATA_FFB324
	dw DATA_FFB32E
	dw DATA_FFB338
	dw DATA_FFB342
	dw DATA_FFB354
	dw DATA_FFB35E
	dw DATA_FFB36C
	dw DATA_FFB376
	dw DATA_FFB388
	dw DATA_FFB39A
	dw DATA_FFB3F4
	dw DATA_FFB406
	dw DATA_FFB418
	dw DATA_FFB422
	dw DATA_FFB430
	dw DATA_FFB43E
	dw DATA_FFB454
	dw DATA_FFB46A
	dw DATA_FFB47C
	dw DATA_FFB48E
	dw DATA_FFB49C
	dw DATA_FFB4B2
	dw DATA_FFB4BC
	dw DATA_FFB4CA
	dw DATA_FFB4D4
	dw DATA_FFB4E2
	dw DATA_FFB4F0
	dw DATA_FFB4FA
	dw DATA_FFB508
	dw DATA_FFB516
	dw DATA_FFB520
	dw DATA_FFB52A
	dw DATA_FFB534
	dw DATA_FFB53E
	dw DATA_FFB54C
	dw DATA_FFB55A
	dw DATA_FFB564
	dw DATA_FFB572
	dw DATA_FFB57C
	dw DATA_FFB586
	dw DATA_FFB590
	dw DATA_FFB5A6
	dw DATA_FFB5B8
	dw DATA_FFB5CE
	dw DATA_FFB5E0
	dw DATA_FFB5F2
	dw DATA_FFB994
	dw DATA_FFB99E
	dw DATA_FFB9A8
	dw DATA_FFB9B2
	dw DATA_FFB9BC
	dw DATA_FFB9C6
	dw DATA_FFB9D0
	dw DATA_FFB9DA
	dw DATA_FFB9E4
	dw DATA_FFB9EE
	dw DATA_FFB9F8
	dw DATA_FFBA02
	dw DATA_FFBA0C
	dw DATA_FFBA16
	dw DATA_FFBA20
	dw DATA_FFBA2A
	dw DATA_FFBA34
	dw DATA_FFBA3E
	dw DATA_FFBA48
	dw DATA_FFBA52
	dw DATA_FFBA5C
	dw DATA_FFBA66
	dw DATA_FFBA70
	dw DATA_FFBA7A
	dw DATA_FFBA84
	dw DATA_FFBA8E
	dw DATA_FFBA98
	dw DATA_FFBAA6
	dw DATA_FFBAE6
	dw DATA_FFBAF0
	dw DATA_FFBAFA
	dw DATA_FFBB04
	dw DATA_FFBB0E
	dw DATA_FFBB62
	dw DATA_FFBB80
	dw DATA_FFBB9E
	dw DATA_FFBBBC
	dw DATA_FFBBDA
	dw DATA_FFBBF8
	dw DATA_FFBC16
	dw DATA_FFBC34
	dw DATA_FFBC52
	dw DATA_FFBC70
	dw DATA_FFBC8E
	dw DATA_FFBCAC
	dw DATA_FFBCCA
	dw DATA_FFBCE8
	dw DATA_FFBD12
	dw DATA_FFBD30
	dw DATA_FFBD4E
	dw DATA_FFBD6C
	dw DATA_FFBD8A
	dw DATA_FFBDA8
	dw DATA_FFBDC6
	dw DATA_FFBDE4
	dw DATA_FFBE02
	dw DATA_FFBE24
	dw DATA_FFBE46
	dw DATA_FFBE68
	dw DATA_FFBE8A
	dw DATA_FFBEAC
	dw DATA_FFBECE
	dw DATA_FFBEF0
	dw DATA_FFBF12
	dw DATA_FFBF34
	dw DATA_FFBF56
	dw DATA_FFBF78
	dw DATA_FFBF9A
	dw DATA_FFBFBC
	dw DATA_FFBFDE
	dw DATA_FFC004
	dw DATA_FFC02E
	dw DATA_FFC054
	dw DATA_FFC07A
	dw DATA_FFC0A4
	dw DATA_FFC0CA
	dw DATA_FFC0F0
	dw DATA_FFC17E
	dw DATA_FFC188
	dw DATA_FFC196
	dw DATA_FFC1A4
	dw DATA_FFC1B6
	dw DATA_FFC1D0
	dw DATA_FFC1EA
	dw DATA_FFC200
	dw DATA_FFC21A
	dw DATA_FFC22C
	dw DATA_FFC23A
	dw DATA_FFC250
	dw DATA_FFC26A
	dw DATA_FFC284
	dw DATA_FFC292
	dw DATA_FFC2A8
	dw DATA_FFC2BE
	dw DATA_FFC2D8
	dw DATA_FFC2F2
	dw DATA_FFC308
	dw DATA_FFC322
	dw DATA_FFC340
	dw DATA_FFC35A
	dw DATA_FFC374
	dw DATA_FFC386
	dw DATA_FFC3B6
	dw DATA_FFC3C0
	dw DATA_FFC3CA
	dw DATA_FFC3D4
	dw DATA_FFC3DE
	dw DATA_FFC3E8
	dw DATA_FFC3F2
	dw DATA_FFC3FC
	dw DATA_FFC406
	dw DATA_FFC410
	dw DATA_FFC41A
	dw DATA_FFC424
	dw DATA_FFC42E
	dw DATA_FFC438
	dw DATA_FFC442
	dw DATA_FFC44C
	dw DATA_FFC456
	dw DATA_FFC460
	dw DATA_FFC46A
	dw DATA_FFC474
	dw DATA_FFC47E
	dw DATA_FFC488
	dw DATA_FFC492
	dw DATA_FFC584
	dw DATA_FFC58A
	dw DATA_FFC5CE
	dw DATA_FFC5D8
	dw DATA_FFC5E2
	dw DATA_FFC5EC
	dw DATA_FFC5F6
	dw DATA_FFC600
	dw DATA_FFC60E
	dw DATA_FFC618
	dw DATA_FFC622
	dw DATA_FFC62C
	dw DATA_FFC636
	dw DATA_FFC644
	dw DATA_FFC64E
	dw DATA_FFC658
	dw DATA_FFC662
	dw DATA_FFC66C
	dw DATA_FFC676
	dw DATA_FFC680
	dw DATA_FFC68A
	dw DATA_FFCB4C
	dw DATA_FFCBC0
	dw DATA_FFCBE2
	dw DATA_FFCC04
	dw DATA_FFCC26
	dw DATA_FFCC48
	dw DATA_FFCC6A
	dw DATA_FFCC8C
	dw DATA_FFCCAE
	dw DATA_FFCCF0
	dw DATA_FFCD34
	dw DATA_FFCD66
	dw DATA_FFCD94
	dw DATA_FFCDF0
	dw DATA_FFCDFA
	dw DATA_FFCE32
	dw DATA_FFCE3C
	dw DATA_FFCE4A
	dw DATA_FFCE58
	dw DATA_FFCE66
	dw DATA_FFCE74
	dw DATA_FFCEF0
	dw DATA_FFCEFA
	dw DATA_FFCF04
	dw DATA_FFCF0E
	dw DATA_FFCF18
	dw DATA_FFCF34
	dw DATA_FFCF3E
	dw DATA_FFCF48
	dw DATA_FFCF52
	dw DATA_FFCF5C
	dw DATA_FFCF66
	dw DATA_FFCF70
	dw DATA_FFCF7A
	dw DATA_FFCF84
	dw DATA_FFCF8E
	dw DATA_FFCF98
	dw DATA_FFCFA2
	dw DATA_FFCFAC
	dw DATA_FFCFB6
	dw DATA_FFCFC0
	dw DATA_FFCFCA
	dw DATA_FFCFD4
	dw DATA_FFCFDE
	dw DATA_FFCFE8
	dw DATA_FFCFF2
	dw DATA_FFCFFC
	dw DATA_FFD00E
	dw DATA_FFD020
	dw DATA_FFD032
	dw DATA_FFD044
	dw DATA_FFD056
	dw DATA_FFD068
	dw DATA_FFD07A
	dw DATA_FFD08C
	dw DATA_FFD09E
	dw DATA_FFD0B0
	dw DATA_FFD0C2
	dw DATA_FFD0CC
	dw DATA_FFD0DA
	dw DATA_FFD0F4
	dw DATA_FFD0FE
	dw DATA_FFD110
	dw DATA_FFD122
	dw DATA_FFD134
	dw DATA_FFD18A
	dw DATA_FFD1A8
	dw DATA_FFD1CA
	dw DATA_FFD1EC
	dw DATA_FFD20E
	dw DATA_FFD230
	dw DATA_FFD24E
	dw DATA_FFD26C
	dw DATA_FFD28A
	dw DATA_FFD2A8
	dw DATA_FFD2CA
	dw DATA_FFD2EC
	dw DATA_FFD316
	dw DATA_FFD338
	dw DATA_FFD388
	dw DATA_FFD39A
	dw DATA_FFD3AC
	dw DATA_FFD3BE
	dw DATA_FFD3D0
	dw DATA_FFD3E2
	dw DATA_FFD3F4
	dw DATA_FFD406
	dw DATA_FFD418
	dw DATA_FFD42A
	dw DATA_FFD43C
	dw DATA_FFD44E
	dw DATA_FFD740
	dw DATA_FFD78E
	dw DATA_FFD79C
	dw DATA_FFD7AA
	dw DATA_FFD7BC
	dw DATA_FFD7CE
	dw DATA_FFD7DC
	dw DATA_FFD7EA
	dw DATA_FFD7F8
	dw DATA_FFD806
	dw DATA_FFD818
	dw DATA_FFD82A
	dw DATA_FFD83C
	dw DATA_FFD84A
	dw DATA_FFD85C
	dw DATA_FFD86A
	dw DATA_FFD87C
	dw DATA_FFD88E
	dw DATA_FFD8A0
	dw DATA_FFD8B2
	dw DATA_FFD8C4
	dw DATA_FFD8E0
	dw DATA_FFD8F2
	dw DATA_FFD904
	dw DATA_FFD916
	dw DATA_FFD928
	dw DATA_FFD93A
	dw DATA_FFD94C
	dw DATA_FFD95E
	dw DATA_FFD970
	dw DATA_FFD982
	dw DATA_FFD994
	dw DATA_FFD9A6
	dw DATA_FFD9B8
	dw DATA_FFD9CA
	dw DATA_FFD9DC
	dw DATA_FFD9EE
	dw DATA_FFDA00
	dw DATA_FFDA12
	dw DATA_FFDA24
	dw DATA_FFDA36
	dw DATA_FFDA48
	dw DATA_FFDA5A
	dw DATA_FFDA6C
	dw DATA_FFDA7E
	dw DATA_FFDA90
	dw DATA_FFDAA2
	dw DATA_FFDAB4
if !version == 1
	dw DATA_FFDAC6
endif
	dw DATA_FFDAD8
	dw DATA_FFDADE
	dw DATA_FFDAE8
	dw DATA_FFDB34
	dw DATA_FFDB56
	dw DATA_FFDB78
	dw DATA_FFDB9A
	dw DATA_FFDBB0
	dw DATA_FFDBC2
	dw DATA_FFDBD4
	dw DATA_FFDBE6
	dw DATA_FFDC00
	dw DATA_FFDC1A
	dw DATA_FFDC34
	dw DATA_FFDC4A
	dw DATA_FFDC67
	dw DATA_FFDC71
	dw DATA_FFDC7F
	dw DATA_FFDC91
	dw DATA_FFDCA3
	dw DATA_FFDCB5
	dw DATA_FFDCC7
	dw DATA_FFDCD9
	dw DATA_FFDCEB
	dw DATA_FFDCFD
	dw DATA_FFDD0F
	dw DATA_FFDD21
	dw DATA_FFDD33
	dw DATA_FFDD45
	dw DATA_FFDD57
	dw DATA_FFDD69
	dw DATA_FFDD7B
	dw DATA_FFDD8D
	dw DATA_FFDD9F
	dw DATA_FFDDB1
	dw DATA_FFDDC3
	dw DATA_FFDDD5
	dw DATA_FFDDE7
	dw DATA_FFDDF9
	dw DATA_FFDE0B
	dw DATA_FFDE1D
	dw DATA_FFDE2F
	dw DATA_FFDE41
	dw DATA_FFDE53
	dw DATA_FFDE65
	dw DATA_FFDE77
	dw DATA_FFDE89
	dw DATA_FFDE9B
	dw DATA_FFDEAD
	dw DATA_FFDEBF
	dw DATA_FFDED1
	dw DATA_FFDEE3
	dw DATA_FFDEF5
	dw DATA_FFDF07
	dw DATA_FFDF19
	dw DATA_FFDF2B
	dw DATA_FFDF3D
	dw DATA_FFDF4F
	dw DATA_FFDF61
	dw DATA_FFDF73
	dw DATA_FFDF85
	dw DATA_FFDF8F
	dw DATA_FFDFA5
	dw DATA_FFDFB7
	dw DATA_FFDFC9
	dw DATA_FFDFDB
	dw DATA_FFE00B
	dw DATA_FFE015
	dw DATA_FFE01F
	dw DATA_FFE029
	dw DATA_FFE03F
	dw DATA_FFE051
	dw DATA_FFE067
	dw DATA_FFE075
	dw DATA_FFE087
	dw DATA_FFE099
	dw DATA_FFE0A7
	dw DATA_FFE0B5
	dw DATA_FFE0CB
	dw DATA_FFE0D9
	dw DATA_FFE0E7
	dw DATA_FFE0F9
	dw DATA_FFE107
	dw DATA_FFE115
	dw DATA_FFE123
	dw DATA_FFE131
	dw DATA_FFE143
	dw DATA_FFE155
	dw DATA_FFE163
	dw DATA_FFE171
	dw DATA_FFE17F
	dw DATA_FFE19D
	dw DATA_FFE1AF
	dw DATA_FFE1C1
	dw DATA_FFE1D3
	dw DATA_FFE1E5
	dw DATA_FFE1F7
	dw DATA_FFE20D
	dw DATA_FFE223
	dw DATA_FFE23D
	dw DATA_FFE257
	dw DATA_FFE271
	dw DATA_FFE28F
	dw DATA_FFE2A1
	dw DATA_FFE2B3
	dw DATA_FFE2B3
	dw DATA_FFE2C5
	dw DATA_FFE2D3
	dw DATA_FFE2E1
	dw DATA_FFE2EF
	dw DATA_FFE30D
	dw DATA_FFE32B
	dw DATA_FFE349
	dw DATA_FFE357
	dw DATA_FFE369
	dw DATA_FFE37B
	dw DATA_FFE38D
	dw DATA_FFE39F
	dw DATA_FFE3AD
	dw DATA_FFE3BF
	dw DATA_FFE3CD
	dw DATA_FFE3DB
	dw DATA_FFE3F1
	dw DATA_FFE407
	dw DATA_FFE429
	dw DATA_FFE44B
	dw DATA_FFE46D
	dw DATA_FFE48F
	dw DATA_FFE4B1
	dw DATA_FFE4D3
	dw DATA_FFE4F5
	dw DATA_FFE517
	dw DATA_FFE539
	dw DATA_FFE55B
	dw DATA_FFE57D
	dw DATA_FFE59F
	dw DATA_FFE5C1
	dw DATA_FFE5E3
	dw DATA_FFE605
	dw DATA_FFE627
	dw DATA_FFE649
	dw DATA_FFE66B
	dw DATA_FFE68D
	dw DATA_FFE6AF
	dw DATA_FFE6D1
	dw DATA_FFE6F3
	dw DATA_FFE715
	dw DATA_FFE737
	dw DATA_FFE759
	dw DATA_FFE77B
	dw DATA_FFE79D
	dw DATA_FFE7BF
	dw DATA_FFE7E1
	dw DATA_FFE803
	dw DATA_FFE825
	dw DATA_FFE847
	dw DATA_FFE869
	dw DATA_FFE88B
	dw DATA_FFE8AD
	dw DATA_FFE8CF
	dw DATA_FFE8F1
	dw DATA_FFE913
	dw DATA_FFE935
	dw DATA_FFE957
	dw DATA_FFE979
	dw DATA_FFE99B
	dw DATA_FFE9BD
	dw DATA_FFE9DF
	dw DATA_FFEA01
	dw DATA_FFEA23
	dw DATA_FFEA45
	dw DATA_FFEA67
	dw DATA_FFEA89
	dw DATA_FFEAAB
	dw DATA_FFEACD
	dw DATA_FFEAEF
	dw DATA_FFEB11
	dw DATA_FFEB33
	dw DATA_FFEB55
	dw DATA_FFEB77
	dw DATA_FFEB99
	dw DATA_FFEBBB
	dw DATA_FFEBDD
	dw DATA_FFEBFF
	dw DATA_FFEC21
	dw DATA_FFEC43
	dw DATA_FFEC65
	dw DATA_FFEC87
	dw DATA_FFECA9
	dw DATA_FFECCB
	dw DATA_FFECED
	dw DATA_FFED0F
	dw DATA_FFED31
	dw DATA_FFED53
	dw DATA_FFED75
	dw DATA_FFED97
	dw DATA_FFEDB9
	dw DATA_FFEDDB
	dw DATA_FFEDFD
	dw DATA_FFEE1F
	dw DATA_FFEE41
	dw DATA_FFEE63
	dw DATA_FFEE85
	dw DATA_FFEEA7
	dw DATA_FFEEC9
	dw DATA_FFEEEB
	dw DATA_FFEF0D
	dw DATA_FFEF2F
	dw DATA_FFEF51
	dw DATA_FFEF73
	dw DATA_FFEF95
	dw DATA_FFEFB7
	dw DATA_FFEFD9
	dw DATA_FFEFFB
	dw DATA_FFF01D
	dw DATA_FFF03F
	dw DATA_FFF061
	dw DATA_FFF083
	dw DATA_FFF0A5
	dw DATA_FFF0C7
	dw DATA_FFF0E9
	dw DATA_FFF10B
	dw DATA_FFF12D
	dw DATA_FFF14F
	dw DATA_FFF171
	dw DATA_FFF193
	dw DATA_FFF1B5
	dw DATA_FFF1D7
	dw DATA_FFF1F9
	dw DATA_FFF21B
	dw DATA_FFF23D
	dw DATA_FFF25F
	dw DATA_FFF281
	dw DATA_FFF28F
	dw DATA_FFF2A1
	dw DATA_FFF2C5
	dw DATA_FFF2E3
	dw DATA_FFF305
	dw DATA_FFF323
	dw DATA_FFF323
	dw DATA_FFF341
	dw DATA_FFF341
	dw DATA_FFF35F
	dw DATA_FFF37D
	dw DATA_FFF39F
	dw DATA_FFF3C1
	dw DATA_FFF405
	dw DATA_FFF413
	dw DATA_FFF421
	dw DATA_FFF42F
	dw DATA_FFF445
	dw DATA_FFF45B
	dw DATA_FFF469
	dw DATA_FFF477
	dw DATA_FFF481
	dw DATA_FFF48F
	dw DATA_FFF4B1
	dw DATA_FFF50B
	dw DATA_FFF51D
	dw DATA_FFF533
	dw DATA_FFF555
	dw DATA_FFF56F
	dw DATA_FFF589
	dw DATA_FFF5A3
	dw DATA_FFF5BD
	dw DATA_FFF5D7
	dw DATA_FFF6D1
	dw DATA_FFF727
	dw DATA_FFF735
	dw DATA_FFF74B
	dw DATA_FFF75D
	dw DATA_FFF76B
	dw DATA_FFF779
	dw DATA_FFF787
	dw DATA_FFF795
	dw DATA_FFF7A3
	dw DATA_FFF7B1
	dw DATA_FFF7BF
	dw DATA_FFF7CD
	dw DATA_FFF7DB
	dw DATA_FFF7F5
	dw DATA_FFF807
	dw DATA_FFF819
	dw DATA_FFF827
	dw DATA_FFF835
	dw DATA_FFF937
	dw DATA_FFF959
	dw DATA_FFF97B
	dw DATA_FFFA01
	dw DATA_FFFB23
	dw DATA_FFFB2D
	dw DATA_FFFB37
	dw DATA_FFFB41
	dw DATA_FFFB4B
	dw DATA_FFFB55
	dw DATA_FFFB5F
	dw DATA_FFFB69
	dw DATA_FFFB73
	dw DATA_FFFB9D
	dw DATA_FFFBAB
	dw DATA_FFFBB9
	dw DATA_FFFBEF
	dw DATA_FFFC1F
	dw DATA_FFFC31
	dw DATA_FFFC43
	dw DATA_FFFC55
	dw DATA_FFFC67
	dw DATA_FFFC79
	dw DATA_FFFC8B
	dw DATA_FFFCA1
	dw DATA_FFFCCD
	dw DATA_FFFCDB
	dw DATA_FFFCE9
	dw DATA_FFFCF7
	dw DATA_FFFE20
	dw DATA_FFFE32
	dw DATA_FFFE5E
	dw DATA_FFFE78
	dw DATA_FFFE92
	dw DATA_FFFEAC
	dw DATA_FFFECA
	dw DATA_FFFEE8
	dw DATA_FFFF06
	dw DATA_FFFF20
if !version == 0
	dw DATA_FFFF2A
	dw DATA_FFFF4C
	dw DATA_FFFF4C
	dw DATA_FFFF6A
else
	dw !null_pointer
	dw !null_pointer
	dw !null_pointer
	dw !null_pointer
endif

DATA_BBF840:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
if !version == 0
	db $00, $00, $00, $AA, $AC, $3C
else
	db $3C, $AC, $AA, $00
endif
