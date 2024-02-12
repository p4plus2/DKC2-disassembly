CODE_B48000:					;	   |
	PHB					;$B48000   |
	PHK					;$B48001   |
	PLB					;$B48002   |
	SEP #$20				;$B48003   |
	LDA #$7E				;$B48005   |
	STA $CA					;$B48007   |
	REP #$20				;$B48009   |
	STZ $08CC				;$B4800B   |
	STZ $08CA				;$B4800E   |
	STZ $08CE				;$B48011   |
	LDA.l DATA_B4BEE7			;$B48014   |
	STA $08D0				;$B48018   |
	SEP #$20				;$B4801B   |
	STZ $08F9				;$B4801D   |
	STZ $08FC				;$B48020   |
	STZ $08FA				;$B48023   |
	STZ $08FB				;$B48026   |
	REP #$20				;$B48029   |
	STZ $06B1				;$B4802B   |
	STZ $06AB				;$B4802E   |
	STZ $06A9				;$B48031   |
	LDA #$0000				;$B48034   |
	STA $064A				;$B48037   |
	STZ $064B				;$B4803A   |
	REP #$20				;$B4803D   |
	STZ $067F				;$B4803F   |
	STZ $07B0				;$B48042   |
	LDA #$0027				;$B48045   |
	LDX #$0000				;$B48048   |
	SEP #$20				;$B4804B   |
CODE_B4804D:					;	   |
	STZ $08D2,x				;$B4804D   |
	INX					;$B48050   |
	DEC A					;$B48051   |
	BNE CODE_B4804D				;$B48052   |
	REP #$20				;$B48054   |
	STZ $0683				;$B48056   |
	STZ $069D				;$B48059   |
	LDA #$0070				;$B4805C   |
	STA $064C				;$B4805F   |
	STZ $069D				;$B48062   |
	STZ $06AF				;$B48065   |
	REP #$20				;$B48068   |
	STZ $06A1				;$B4806A   |
	STZ $06A3				;$B4806D   |
	STZ $06A5				;$B48070   |
	JSR CODE_B4AED3				;$B48073   |
	LDY #$5972				;$B48076   |
	LDA #$0010				;$B48079   |
	JSR CODE_B480B2				;$B4807C   |
	LDY #$5992				;$B4807F   |
	LDA #$0008				;$B48082   |
	JSR CODE_B480B2				;$B48085   |
	JSR CODE_B4B3CD				;$B48088   |
	LDA #$006C				;$B4808B   |
	JSR CODE_B4B18F				;$B4808E   |
	LDA #$0078				;$B48091   |
	JSR CODE_B4B4D3				;$B48094   |
	LDX #$0000				;$B48097   |
	LDA #$0008				;$B4809A   |
	STA $0650				;$B4809D   |
CODE_B480A0:					;	   |
	LDA DATA_B4C460,x			;$B480A0   |
	JSR CODE_B4B3B8				;$B480A3   |
	INX					;$B480A6   |
	INX					;$B480A7   |
	DEC $0650				;$B480A8   |
	BNE CODE_B480A0				;$B480AB   |
	JSR CODE_B4B0CF				;$B480AD   |
	PLB					;$B480B0   |
	RTL					;$B480B1  /

CODE_B480B2:
	STY $CE					;$B480B2  \
	STA $0650				;$B480B4   |
	SEP #$20				;$B480B7   |
	LDA #$7E				;$B480B9   |
	STA $D0					;$B480BB   |
	REP #$20				;$B480BD   |
	LDA #$0000				;$B480BF   |
	TAY					;$B480C2   |
CODE_B480C3:					;	   |
	STA [$CE],y				;$B480C3   |
	INY					;$B480C5   |
	INY					;$B480C6   |
	DEC $0650				;$B480C7   |
	BNE CODE_B480C3				;$B480CA   |
	RTS					;$B480CC  /

CODE_B480CD:
	PHB					;$B480CD  \
	PHK					;$B480CE   |
	PLB					;$B480CF   |
	SEP #$20				;$B480D0   |
	LDA #$7E				;$B480D2   |
	STA $CA					;$B480D4   |
	PHK					;$B480D6   |
	PLA					;$B480D7   |
	STA $CD					;$B480D8   |
	REP #$20				;$B480DA   |
	LDA #$006C				;$B480DC   |
	JSR CODE_B4B18F				;$B480DF   |
	LDA #$0078				;$B480E2   |
	JSR CODE_B4B4D3				;$B480E5   |
	JSR CODE_B4B208				;$B480E8   |
	JSL CODE_BB819F				;$B480EB   |
	LDA $08F9				;$B480EF   |
	AND #$00FF				;$B480F2   |
	CMP #$0005				;$B480F5   |
	BNE CODE_B48147				;$B480F8   |
	LDA $08FC				;$B480FA   |
	BIT #$000C				;$B480FD   |
	BNE CODE_B48147				;$B48100   |
	LDA #$001E				;$B48102   |
	STA $07B0				;$B48105   |
	LDA #$0061				;$B48108   |
	JSR CODE_B4B3B8				;$B4810B   |
	LDA #$0065				;$B4810E   |
	JSR CODE_B4B3B8				;$B48111   |
	LDA #$0069				;$B48114   |
	JSR CODE_B4B3B8				;$B48117   |
	LDA #$006D				;$B4811A   |
	JSR CODE_B4B3B8				;$B4811D   |
	LDA #$0071				;$B48120   |
	JSR CODE_B4B3B8				;$B48123   |
	LDA #$2B64				;$B48126   |
	JSR CODE_B48360				;$B48129   |
	LDA #$2B70				;$B4812C   |
	JSR CODE_B48360				;$B4812F   |
	LDA #$2B7C				;$B48132   |
	JSR CODE_B48360				;$B48135   |
	LDA #$2B88				;$B48138   |
	JSR CODE_B48360				;$B4813B   |
	LDA #$2B94				;$B4813E   |
	JSR CODE_B48360				;$B48141   |
	JSR CODE_B4B3AB				;$B48144   |
CODE_B48147:					;	   |
	JSR CODE_B4AED3				;$B48147   |
	JSR CODE_B4B0CF				;$B4814A   |
	LDA $08CE				;$B4814D   |
	BEQ CODE_B48169				;$B48150   |
	DEC A					;$B48152   |
	CMP $08D0				;$B48153   |
	BCC CODE_B48169				;$B48156   |
if !version == 0				;	   |
	LDA $08D0				;$B48158   |
	CMP $B4BE8F				;$B4815B   |
	BNE CODE_B48166				;$B4815F   |
	LDA #$0063				;$B48161   |
	BRA CODE_B48176				;$B48164   |
						;	   |
CODE_B48166:					;	   |
	CMP $B4BE97				;$B48166   |
	BNE CODE_B48172				;$B4816A   |
	LDA $B4BE8F				;$B4816C   |
	BRA CODE_B48176				;$B48170   |
						;	   |
CODE_B48172:					;	   |
	LDA $B4BE97				;$B48172   |
						;	   |
CODE_B48176:					;	   |
	STA $08D0				;$B48176   |
else						;	   |
	JSR CODE_B4AE58				;$B48158   |
endif						;	   |
	LDA $08FB				;$B4815B   |
	BIT #$0040				;$B4815E   |
	BEQ CODE_B48169				;$B48161   |
	JSR CODE_B4BE96				;$B48163   |
	BRL CODE_B4835E				;$B48166  /

CODE_B48169:
	LDA $06B1				;$B48169  \
	BNE CODE_B48171				;$B4816C   |
	JSR CODE_B4BB03				;$B4816E   |
CODE_B48171:					;	   |
	LDA $06B1				;$B48171   |
	CMP #$000A				;$B48174   |
	BCC CODE_B481C3				;$B48177   |
	STZ $08FE				;$B48179   |
	LDA #$0040				;$B4817C   |
	STA $7E8012				;$B4817F   |
	LDA #$0112				;$B48183   |
	STA $7E8013				;$B48186   |
	LDA #$0001				;$B4818A   |
	STA $7E8015				;$B4818D   |
	LDA #$0000				;$B48191   |
	STA $7E8018				;$B48194   |
	LDX #$0012				;$B48198   |
	LDA $08FC				;$B4819B   |
	BIT #$0008				;$B4819E   |
	BEQ CODE_B481A6				;$B481A1   |
	LDX #$0013				;$B481A3   |
CODE_B481A6:					;	   |
	TXA					;$B481A6   |
	STA $7E8016				;$B481A7   |
	SEP #$20				;$B481AB   |
	LDX #$2C01				;$B481AD   |
	STX HDMA[2].settings			;$B481B0   |
	LDX #$8012				;$B481B3   |
	STX HDMA[2].source			;$B481B6   |
	LDA #$7E				;$B481B9   |
	STA HDMA[2].source_bank			;$B481BB   |
	STZ HDMA[2].indirect_source_bank	;$B481BE   |
	REP #$20				;$B481C1   |
CODE_B481C3:					;	   |
	SEP #$20				;$B481C3   |
	LDA $064B				;$B481C5   |
	REP #$20				;$B481C8   |
	BEQ CODE_B481D6				;$B481CA   |
	SEP #$20				;$B481CC   |
	STZ $064A				;$B481CE   |
	STZ $064B				;$B481D1   |
	REP #$20				;$B481D4   |
CODE_B481D6:					;	   |
	LDA #$4000				;$B481D6   |
	BIT $06A5				;$B481D9   |
	BEQ CODE_B481E3				;$B481DC   |
	TRB $06A5				;$B481DE   |
	STZ current_song			;$B481E1   |
CODE_B481E3:					;	   |
	LDA $06A3				;$B481E3   |
	BIT #$1000				;$B481E6   |
	BNE CODE_B48210				;$B481E9   |
	LDA #$0013				;$B481EB   |
	CMP current_song			;$B481EE   |
	BEQ CODE_B4821B				;$B481F0   |
	LDA $06B1				;$B481F2   |
	CMP #$000A				;$B481F5   |
	BCC CODE_B48203				;$B481F8   |
	LDA #$001C				;$B481FA   |
	CMP current_song			;$B481FD   |
	BEQ CODE_B4821B				;$B481FF   |
	BRA CODE_B4820A				;$B48201  /

CODE_B48203:
	LDA #$0001				;$B48203  \
	CMP current_song			;$B48206   |
	BEQ CODE_B4821B				;$B48208   |
CODE_B4820A:					;	   |
	JSL play_song				;$B4820A   |
	BRA CODE_B4821B				;$B4820E  /

CODE_B48210:
	LDA #$0008				;$B48210  \
	CMP current_song			;$B48213   |
	BEQ CODE_B4821B				;$B48215   |
	JSL play_song				;$B48217   |
CODE_B4821B:					;	   |
	PHB					;$B4821B   |
	PHK					;$B4821C   |
	PLB					;$B4821D   |
	STZ $065E				;$B4821E   |
	LDA #$0200				;$B48221   |
	STA PPU.vram_address			;$B48224   |
	SEP #$20				;$B48227   |
	LDA #$01				;$B48229   |
	STA DMA[0].settings			;$B4822B   |
	LDA #$18				;$B4822E   |
	STA DMA[0].destination			;$B48230   |
	LDX #DATA_FC14A0			;$B48233   |
	STX DMA[0].source			;$B48236   |
	LDA #DATA_FC14A0>>16			;$B48239   |
	STA DMA[0].source_bank			;$B4823B   |
	LDX #$0040				;$B4823E   |
	STX DMA[0].size				;$B48241   |
	STZ DMA[0].unused_1			;$B48244   |
	LDA #$01				;$B48247   |
	STA CPU.enable_dma			;$B48249   |
	REP #$20				;$B4824C   |
	STZ $0681				;$B4824E   |
	LDA #$0001				;$B48251   |
	STA $0697				;$B48254   |
	LDA $060F				;$B48257   |
	BEQ CODE_B48261				;$B4825A   |
	LDX #$0080				;$B4825C   |
	BRA CODE_B48264				;$B4825F  /

CODE_B48261:
	LDX #$00AA				;$B48261  \
CODE_B48264:					;	   |
	LDA $06A3				;$B48264   |
	BIT #$1000				;$B48267   |
	BEQ CODE_B4826F				;$B4826A   |
	LDX #$0034				;$B4826C   |
CODE_B4826F:					;	   |
	TXA					;$B4826F   |
	LDY #$00F0				;$B48270   |
	LDX #$0004				;$B48273   |
	JSL DMA_global_palette			;$B48276   |
	LDA #$00AB				;$B4827A   |
	LDY #$00D0				;$B4827D   |
	LDX #$0004				;$B48280   |
	JSL DMA_global_palette			;$B48283   |
	LDA $060F				;$B48287   |
	BEQ CODE_B48291				;$B4828A   |
	LDA #$0080				;$B4828C   |
	BRA CODE_B48294				;$B4828F  /

CODE_B48291:
	LDA #$00AA				;$B48291  \
CODE_B48294:					;	   |
	LDY #$00E0				;$B48294   |
	LDX #$0004				;$B48297   |
	JSL DMA_global_palette			;$B4829A   |
	LDA $06B1				;$B4829E   |
	BEQ CODE_B482D7				;$B482A1   |
	LDA #$00AD				;$B482A3   |
	LDY #$0080				;$B482A6   |
	LDX #$0004				;$B482A9   |
	JSL DMA_global_palette			;$B482AC   |
	LDA #$00AE				;$B482B0   |
	LDY #$0090				;$B482B3   |
	LDX #$0004				;$B482B6   |
	JSL DMA_global_palette			;$B482B9   |
	LDA #$00A5				;$B482BD   |
	LDY #$00A0				;$B482C0   |
	LDX #$0004				;$B482C3   |
	JSL DMA_global_palette			;$B482C6   |
	LDA #$00A6				;$B482CA   |
	LDY #$00B0				;$B482CD   |
	LDX #$0004				;$B482D0   |
	JSL DMA_global_palette			;$B482D3   |
CODE_B482D7:					;	   |
	LDA #$000A				;$B482D7   |
	STA $069F				;$B482DA   |
	LDA #$006C				;$B482DD   |
	JSR CODE_B4B18F				;$B482E0   |
	LDA #$0078				;$B482E3   |
	JSR CODE_B4B4D3				;$B482E6   |
	JSL CODE_B489ED				;$B482E9   |
	LDA $06B1				;$B482ED   |
	CMP #$000A				;$B482F0   |
	BCC CODE_B4832F				;$B482F3   |
	LDA $08F9				;$B482F5   |
	AND #$00FF				;$B482F8   |
	BEQ CODE_B4832F				;$B482FB   |
	CMP #$0006				;$B482FD   |
	BCC CODE_B48305				;$B48300   |
	LDA #$0005				;$B48302   |
CODE_B48305:					;	   |
	STA $0666				;$B48305   |
	LDX #$0000				;$B48308   |
CODE_B4830B:					;	   |
	LDY DATA_B4CE1F,x			;$B4830B   |
	PHX					;$B4830E   |
	JSL CODE_BB8412				;$B4830F   |
	PLX					;$B48313   |
	LDY alternate_sprite			;$B48314   |
	LDA #$0080				;$B48316   |
	STA $0006,y				;$B48319   |
	STA $000A,y				;$B4831C   |
	TXA					;$B4831F   |
	ASL A					;$B48320   |
	CLC					;$B48321   |
	ADC $001A,y				;$B48322   |
	STA $001A,y				;$B48325   |
	INX					;$B48328   |
	INX					;$B48329   |
	DEC $0666				;$B4832A   |
	BNE CODE_B4830B				;$B4832D   |
CODE_B4832F:					;	   |
	PLB					;$B4832F   |
	JSL CODE_B4AEAF				;$B48330   |
	LDA #$0733				;$B48334   |
	STA $07A1				;$B48337   |
if !version == 0				;	   |
	LDA #$075F				;$B4833A   |
else						;	   |
	LDA #$075B				;$B4833A   |
endif						;	   |
	STA $07A3				;$B4833D   |
	LDA $06A1				;$B48340   |
	AND #$022C				;$B48343   |
	STA $06A1				;$B48346   |
	LDA $06A3				;$B48349   |
	AND #$1060				;$B4834C   |
	STA $06A3				;$B4834F   |
	LDA $06A1				;$B48352   |
	ORA #$0080				;$B48355   |
	STA $06A1				;$B48358   |
	JSR CODE_B4B8C6				;$B4835B   |
CODE_B4835E:					;	   |
	PLB					;$B4835E   |
	RTL					;$B4835F  /

CODE_B48360:
	STA $C8					;$B48360  \
	LDA #$0001				;$B48362   |
	STA [$C8]				;$B48365   |
	RTS					;$B48367  /

CODE_B48368:
	PHB					;$B48368  \
	PHB					;$B48369   |
	PHK					;$B4836A   |
	PLB					;$B4836B   |
	LDA $06B1				;$B4836C   |
	CMP #$000A				;$B4836F   |
	BCC CODE_B48374				;$B48372   |
CODE_B48374:					;	   |
	LDA $06B1				;$B48374   |
	CMP #$0004				;$B48377   |
	BNE CODE_B483BB				;$B4837A   |
	LDA screen_brightness			;$B4837C   |
	BIT #$8000				;$B4837F   |
	BNE CODE_B483BB				;$B48382   |
	LDA global_frame_counter		;$B48384   |
	BIT #$0007				;$B48386   |
	BNE CODE_B483BB				;$B48389   |
	LDA #$0000				;$B4838B   |
	SEP #$20				;$B4838E   |
	INC $84					;$B48390   |
	LDA $84					;$B48392   |
	CMP #$03				;$B48394   |
	BCC CODE_B4839C				;$B48396   |
	LDA #$00				;$B48398   |
	STA $84					;$B4839A   |
CODE_B4839C:					;	   |
	ASL A					;$B4839C   |
	TAX					;$B4839D   |
	LDA #$5D				;$B4839E   |
	STA PPU.cgram_address			;$B483A0   |
	LDY #$0006				;$B483A3   |
CODE_B483A6:					;	   |
	LDA.l DATA_FD1C2A,x			;$B483A6   |
	STA PPU.cgram_write			;$B483AA   |
	INX					;$B483AD   |
	CPX #$0006				;$B483AE   |
	BNE CODE_B483B6				;$B483B1   |
	LDX #$0000				;$B483B3   |
CODE_B483B6:					;	   |
	DEY					;$B483B6   |
	BNE CODE_B483A6				;$B483B7   |
	REP #$20				;$B483B9   |
CODE_B483BB:					;	   |
	LDA $06B1				;$B483BB   |
	CMP #$0009				;$B483BE   |
	BNE CODE_B48418				;$B483C1   |
	LDA screen_brightness			;$B483C3   |
	BIT #$8000				;$B483C6   |
	BNE CODE_B48418				;$B483C9   |
	SEP #$20				;$B483CB   |
	LDA global_frame_counter		;$B483CD   |
	LSR A					;$B483CF   |
	LSR A					;$B483D0   |
	STA $32					;$B483D1   |
	AND #$02				;$B483D3   |
	TAX					;$B483D5   |
	LDA #$78				;$B483D6   |
	STA PPU.cgram_address			;$B483D8   |
	LDY #$0004				;$B483DB   |
CODE_B483DE:					;	   |
	LDA.l DATA_FD2160,x			;$B483DE   |
	STA PPU.cgram_write			;$B483E2   |
	TXA					;$B483E5   |
	INC A					;$B483E6   |
	AND #$03				;$B483E7   |
	TAX					;$B483E9   |
	DEY					;$B483EA   |
	BNE CODE_B483DE				;$B483EB   |
	LDY #$0004				;$B483ED   |
CODE_B483F0:					;	   |
	LDA.l DATA_FD2164,x			;$B483F0   |
	STA PPU.cgram_write			;$B483F4   |
	TXA					;$B483F7   |
	INC A					;$B483F8   |
	AND #$03				;$B483F9   |
	TAX					;$B483FB   |
	DEY					;$B483FC   |
	BNE CODE_B483F0				;$B483FD   |
	LDA $32					;$B483FF   |
	AND #$06				;$B48401   |
	TAX					;$B48403   |
	LDY #$0008				;$B48404   |
CODE_B48407:					;	   |
	LDA.l DATA_FD2168,x			;$B48407   |
	STA PPU.cgram_write			;$B4840B   |
	TXA					;$B4840E   |
	INC A					;$B4840F   |
	AND #$07				;$B48410   |
	TAX					;$B48412   |
	DEY					;$B48413   |
	BNE CODE_B48407				;$B48414   |
	REP #$20				;$B48416   |
CODE_B48418:					;	   |
	LDA $06A1				;$B48418   |
	BIT #$0010				;$B4841B   |
	BNE CODE_B48423				;$B4841E   |
	BRL CODE_B484BC				;$B48420  /

CODE_B48423:
	STZ PPU.vram_address			;$B48423  \
	LDA $0699				;$B48426   |
	CLC					;$B48429   |
	ADC #$0400				;$B4842A   |
	CMP #DATA_FC54E0			;$B4842D   |
	BNE CODE_B48435				;$B48430   |
	LDA #DATA_FC14E0			;$B48432   |
CODE_B48435:					;	   |
	TAX					;$B48435   |
	STA $0699				;$B48436   |
	SEP #$20				;$B48439   |
	LDA #$01				;$B4843B   |
	STA DMA[0].settings			;$B4843D   |
	LDA #$18				;$B48440   |
	STA DMA[0].destination			;$B48442   |
	STX DMA[0].source			;$B48445   |
	LDA #DATA_FC14E0>>16			;$B48448   |
	STA DMA[0].source_bank			;$B4844A   |
	LDX #$0400				;$B4844D   |
	STX DMA[0].size				;$B48450   |
	STZ DMA[0].unused_1			;$B48453   |
	LDA #$01				;$B48456   |
	STA CPU.enable_dma			;$B48458   |
	REP #$20				;$B4845B   |
	LDA $06B1				;$B4845D   |
	BEQ CODE_B484BC				;$B48460   |
	LDA #$0800				;$B48462   |
	STA PPU.vram_address			;$B48465   |
	LDA $0699				;$B48468   |
	SEC					;$B4846B   |
	SBC #DATA_FC14E0			;$B4846C   |
	LSR A					;$B4846F   |
	LSR A					;$B48470   |
	LSR A					;$B48471   |
	CLC					;$B48472   |
	ADC #DATA_FA443E			;$B48473   | boss map icon tiledata offset
	STA DMA[0].source			;$B48476   |
	SEP #$20				;$B48479   |
	LDA #$01				;$B4847B   |
	STA DMA[0].settings			;$B4847D   |
	LDA #$18				;$B48480   |
	STA DMA[0].destination			;$B48482   |
	LDA #DATA_FA443E>>16			;$B48485   |
	STA DMA[0].source_bank			;$B48487   |
	LDX #$0040				;$B4848A   |
	STX DMA[0].size				;$B4848D   |
	STZ DMA[0].unused_1			;$B48490   |
	LDA #$01				;$B48493   |
	STA CPU.enable_dma			;$B48495   |
	REP #$20				;$B48498   |
	LDA #$0900				;$B4849A   |
	STA PPU.vram_address			;$B4849D   |
	SEP #$20				;$B484A0   |
	LDA #$01				;$B484A2   |
	STA DMA[0].settings			;$B484A4   |
	LDA #$18				;$B484A7   |
	STA DMA[0].destination			;$B484A9   |
	LDX #$0040				;$B484AC   |
	STX DMA[0].size				;$B484AF   |
	STZ DMA[0].unused_1			;$B484B2   |
	LDA #$01				;$B484B5   |
	STA CPU.enable_dma			;$B484B7   |
	REP #$20				;$B484BA   |
CODE_B484BC:					;	   |
	LDA $0681				;$B484BC   |
	AND #$00FF				;$B484BF   |
	BEQ CODE_B484FB				;$B484C2   |
	LDA $0682				;$B484C4   |
	AND #$00FF				;$B484C7   |
	XBA					;$B484CA   |
	LSR A					;$B484CB   |
	LSR A					;$B484CC   |
	LSR A					;$B484CD   |
	STA DMA[0].size				;$B484CE   |
	LDA #$02B0				;$B484D1   |
	STA PPU.vram_address			;$B484D4   |
	SEP #$20				;$B484D7   |
	LDA #$01				;$B484D9   |
	STA DMA[0].settings			;$B484DB   |
	LDA #$18				;$B484DE   |
	STA DMA[0].destination			;$B484E0   |
	LDX #$3E00				;$B484E3   |
	STX DMA[0].source			;$B484E6   |
	LDA #$7E				;$B484E9   |
	STA DMA[0].source_bank			;$B484EB   |
	STZ DMA[0].unused_1			;$B484EE   |
	LDA #$01				;$B484F1   |
	STA CPU.enable_dma			;$B484F3   |
	STZ $0681				;$B484F6   |
	REP #$20				;$B484F9   |
CODE_B484FB:					;	   |
	LDA $17BA				;$B484FB   |
	SEP #$20				;$B484FE   |
	STA PPU.layer_1_scroll_x		;$B48500   |
	XBA					;$B48503   |
	STA PPU.layer_1_scroll_x		;$B48504   |
	REP #$20				;$B48507   |
	LDA $069B				;$B48509   |
	STA $17BA				;$B4850C   |
	LDA $17C0				;$B4850F   |
	SEP #$20				;$B48512   |
	STA PPU.layer_1_scroll_y		;$B48514   |
	XBA					;$B48517   |
	STA PPU.layer_1_scroll_y		;$B48518   |
	REP #$20				;$B4851B   |
	LDA $069D				;$B4851D   |
	STA $17C0				;$B48520   |
	REP #$20				;$B48523   |
	LDA $06A1				;$B48525   |
	AND #$FFEF				;$B48528   |
	STA $06A1				;$B4852B   |
	SEP #$20				;$B4852E   |
	LDA screen_brightness			;$B48530   |
	STA PPU.screen				;$B48533   |
	REP #$20				;$B48536   |
	LDA $06A3				;$B48538   |
	BIT #$0020				;$B4853B   |
	BEQ CODE_B48543				;$B4853E   |
	BRL CODE_B48985				;$B48540  /

CODE_B48543:
	JSL CODE_BAC7C0				;$B48543  \
	DEC $069F				;$B48547   |
	BNE CODE_B4855B				;$B4854A   |
	LDA #$000A				;$B4854C   |
	STA $069F				;$B4854F   |
	LDA $06A1				;$B48552   |
	EOR #$0020				;$B48555   |
	STA $06A1				;$B48558   |
CODE_B4855B:					;	   |
	LDA $0683				;$B4855B   |
	BNE CODE_B4856B				;$B4855E   |
	LDA player_active_held			;$B48560   |
	AND #$2020				;$B48563   |
	CMP #$2020				;$B48566   |
	BEQ CODE_B4856E				;$B48569   |
CODE_B4856B:					;	   |
	BRL CODE_B48611				;$B4856B  /

CODE_B4856E:
	LDA player_active_held			;$B4856E  \
	AND #$DFDF				;$B48571   |
	BNE CODE_B48579				;$B48574   |
	BRL CODE_B48620				;$B48576  /

CODE_B48579:
	CLC					;$B48579  \
CODE_B4857A:					;	   |
	ROR A					;$B4857A   |
	BCC CODE_B4857A				;$B4857B   |
	CMP #$0000				;$B4857D   |
	BEQ CODE_B48585				;$B48580   |
	BRL CODE_B48620				;$B48582  /

CODE_B48585:
	LDA player_active_pressed		;$B48585  \
	AND #$DFDF				;$B48588   |
	BNE CODE_B48590				;$B4858B   |
	BRL CODE_B48620				;$B4858D  /

CODE_B48590:
	LDX $065E				;$B48590  \
	STA $06CF,x				;$B48593   |
	CPX #$0028				;$B48596   |
	BCS CODE_B48611				;$B48599   |
	INC $065E				;$B4859B   |
	INC $065E				;$B4859E   |
	LDA $065E				;$B485A1   |
	LSR A					;$B485A4   |
	STA $065C				;$B485A5   |
	LDA #DATA_B4CF21			;$B485A8   |
	STA $CB					;$B485AB   |
CODE_B485AD:					;	   |
	LDA [$CB]				;$B485AD   |
	BEQ CODE_B48611				;$B485AF   |
	TAY					;$B485B1   |
	LDX #$0000				;$B485B2   |
CODE_B485B5:					;	   |
	LDA $0002,y				;$B485B5   |
	BEQ CODE_B485DE				;$B485B8   |
	CMP $06CF,x				;$B485BA   |
	BNE CODE_B485D8				;$B485BD   |
	INX					;$B485BF   |
	INX					;$B485C0   |
	INY					;$B485C1   |
	INY					;$B485C2   |
	DEC $065C				;$B485C3   |
	BNE CODE_B485B5				;$B485C6   |
	LDA $06A1				;$B485C8   |
	ORA #$0008				;$B485CB   |
	STA $06A1				;$B485CE   |
	LDA $0002,y				;$B485D1   |
	BEQ CODE_B485DE				;$B485D4   |
	BRA CODE_B48620				;$B485D6  /

CODE_B485D8:
	INC $CB					;$B485D8  \
	INC $CB					;$B485DA   |
	BRA CODE_B485AD				;$B485DC  /

CODE_B485DE:
	TXA					;$B485DE  \
	CMP $065E				;$B485DF   |
	BEQ CODE_B485E6				;$B485E2   |
	BRA CODE_B48620				;$B485E4  /

CODE_B485E6:
	SEP #$20				;$B485E6  \
	LDA #$01				;$B485E8   |
	STA $064B				;$B485EA   |
	REP #$20				;$B485ED   |
	LDA [$CB]				;$B485EF   |
	TAX					;$B485F1   |
	LDA $0000,x				;$B485F2   |
	STA $065A				;$B485F5   |
	LDX #$065A				;$B485F8   |
	JSR ($0000,x)				;$B485FB   |
	JSL disable_screen			;$B485FE   |
	LDA #CODE_8087D9			;$B48602   |
	JML CODE_808C9E				;$B48605  /

	LDA $06A1				;$B48609   |
	BIT #$0008				;$B4860C   |
	BNE CODE_B48620				;$B4860F   |
CODE_B48611:					;	   |
	STZ $065E				;$B48611   |
	JSR CODE_B4AED3				;$B48614   |
	LDA $06A1				;$B48617   |
	AND #$FFF7				;$B4861A   |
	STA $06A1				;$B4861D   |
CODE_B48620:					;	   |
	LDA #$03FC				;$B48620   |
	STA $C8					;$B48623   |
	STA $0678				;$B48625   |
	LDA #$007F				;$B48628   |
	STA $06A7				;$B4862B   |
	LDA #$041E				;$B4862E   |
	STA $0685				;$B48631   |
	LDA #$8000				;$B48634   |
	STA $0687				;$B48637   |
	LDA $06B1				;$B4863A   |
	ASL A					;$B4863D   |
	TAX					;$B4863E   |
	PHK					;$B4863F   |
	PLB					;$B48640   |
	LDA DATA_B4C25E,x			;$B48641   |
	CLC					;$B48644   |
	ADC #$0008				;$B48645   |
	TAX					;$B48648   |
	LDY $0000,x				;$B48649   |
	STY $065C				;$B4864C   |
	LDY $0002,x				;$B4864F   |
	STY $065A				;$B48652   |
	ADC #$0006				;$B48655   |
	STA $CB					;$B48658   |
	LDY #$2A00				;$B4865A   |
	%pea_mask_dbr($7E2A00)			;$B4865D   |
	PLB					;$B48660   |
	PLB					;$B48661   |
	LDA $C8					;$B48662   |
	STA $0678				;$B48664   |
	LDA $064A				;$B48667   |
	AND #$00FF				;$B4866A   |
	BNE CODE_B486D5				;$B4866D   |
if !version == 1				;	   |
	LDA $07B0				;$B4866F   |
	BNE CODE_B486D5				;$B48672   |
	LDA $08FC				;$B48674   |
	BIT #$0005				;$B48677   |
	BNE CODE_B486D5				;$B4867A   |
endif						;	   |
	LDA $06A5				;$B4867C   |
	BIT #$2000				;$B4867F   |
	BNE CODE_B486D5				;$B48682   |
CODE_B48684:					;	   |
	LDA [$CB]				;$B48684   |
	ASL A					;$B48686   |
	ASL A					;$B48687   |
	TAY					;$B48688   |
	LDA $3200,y				;$B48689   |
	AND #$00FF				;$B4868C   |
	BEQ CODE_B4869D				;$B4868F   |
	LDA $3201,y				;$B48691   |
	AND #$00FF				;$B48694   |
	LDX $3202,y				;$B48697   |
	JSR CODE_B4B64F				;$B4869A   |
CODE_B4869D:					;	   |
	INY					;$B4869D   |
	INY					;$B4869E   |
	INY					;$B4869F   |
	INY					;$B486A0   |
	INC $CB					;$B486A1   |
	INC $CB					;$B486A3   |
	DEC $065A				;$B486A5   |
	BNE CODE_B48684				;$B486A8   |
	LDA $06A1				;$B486AA   |
	BIT #$0020				;$B486AD   |
	BEQ CODE_B486D5				;$B486B0   |
	LDA $06AB				;$B486B2   |
	CMP #$0044				;$B486B5   |
	BEQ CODE_B486D5				;$B486B8   |
	CMP #$004F				;$B486BA   |
	BEQ CODE_B486D5				;$B486BD   |
	CMP #$004E				;$B486BF   |
	BEQ CODE_B486D5				;$B486C2   |
	ASL A					;$B486C4   |
	ASL A					;$B486C5   |
	TAY					;$B486C6   |
	LDA $3200,y				;$B486C7   |
	AND #$00FF				;$B486CA   |
	BEQ CODE_B486D5				;$B486CD   |
	LDX $3202,y				;$B486CF   |
	JSR CODE_B4B6F9				;$B486D2   |
CODE_B486D5:					;	   |
	LDX $0593				;$B486D5   |
	LDY $07A3				;$B486D8   |
	LDA $06B5				;$B486DB   |
	CLC					;$B486DE   |
	ADC #$0009				;$B486DF   |
	STA $06,x				;$B486E2   |
	STA $0000,y				;$B486E4   |
	LDA $06B7				;$B486E7   |
	CLC					;$B486EA   |
	ADC #$0009				;$B486EB   |
	STA $0A,x				;$B486EE   |
	STA $0002,y				;$B486F0   |
	TYA					;$B486F3   |
	CLC					;$B486F4   |
	ADC #$0004				;$B486F5   |
if !version == 0				;	   |
	CMP #$0763				;$B486F8   |
else						;	   |
	CMP #$075F				;$B486F8   |
endif						;	   |
	BCC CODE_B48700				;$B486FB   |
	LDA #$0733				;$B486FD   |
CODE_B48700:					;	   |
	STA $07A3				;$B48700   |
	LDX $0597				;$B48703   |
	BEQ CODE_B48725				;$B48706   |
	LDY $07A1				;$B48708   |
	LDA $0000,y				;$B4870B   |
	STA $06,x				;$B4870E   |
	LDA $0002,y				;$B48710   |
	STA $0A,x				;$B48713   |
	TYA					;$B48715   |
	CLC					;$B48716   |
	ADC #$0004				;$B48717   |
if !version == 0				;	   |
	CMP #$0763				;$B4871A   |
else						;	   |
	CMP #$075F				;$B4871A   |
endif						;	   |
	BCC CODE_B48722				;$B4871D   |
	LDA #$0733				;$B4871F   |
CODE_B48722:					;	   |
	STA $07A1				;$B48722   |
CODE_B48725:					;	   |
	LDA $06B9				;$B48725   |
	BMI CODE_B48740				;$B48728   |
	LDX $0597				;$B4872A   |
	BEQ CODE_B48736				;$B4872D   |
	LDA $12,x				;$B4872F   |
	AND #$BFFF				;$B48731   |
	STA $12,x				;$B48734   |
CODE_B48736:					;	   |
	LDX $0593				;$B48736   |
	LDA $12,x				;$B48739   |
	AND #$BFFF				;$B4873B   |
	BRA CODE_B48754				;$B4873E  /

CODE_B48740:
	LDX $0597				;$B48740  \
	BEQ CODE_B4874C				;$B48743   |
	LDA $12,x				;$B48745   |
	ORA #$4000				;$B48747   |
	STA $12,x				;$B4874A   |
CODE_B4874C:					;	   |
	LDX $0593				;$B4874C   |
	LDA $12,x				;$B4874F   |
	ORA #$4000				;$B48751   |
CODE_B48754:					;	   |
	STA $12,x				;$B48754   |
	LDA $06A3				;$B48756   |
	BIT #$0003				;$B48759   |
	BEQ CODE_B48761				;$B4875C   |
	BRL CODE_B48927				;$B4875E  /

CODE_B48761:
	LDA $06AF				;$B48761  \
	BEQ CODE_B48769				;$B48764   |
	BRL CODE_B48888				;$B48766  /

CODE_B48769:					;	  \
	LDA $064A				;$B48769   |
	AND #$00FF				;$B4876C   |
	BEQ CODE_B48779				;$B4876F   |
if !version == 1				;	   |
	LDA $07B0				;$B48771   |
	BEQ CODE_B48779				;$B48774   |
endif						;	   |
	BRL CODE_B48927				;$B48776  /

CODE_B48779:
	LDA screen_brightness			;$B48779  \
	AND #$000F				;$B4877C   |
	CMP #$000F				;$B4877F   |
	BEQ CODE_B48787				;$B48782   |
	BRL CODE_B48927				;$B48784  /

CODE_B48787:
	LDA $0683				;$B48787  \
	BEQ CODE_B4878F				;$B4878A   |
	BRL CODE_B48927				;$B4878C  /

CODE_B4878F:
	LDA $08FB				;$B4878F  \
	BIT #$0040				;$B48792   |
	BEQ CODE_B487A2				;$B48795   |
	LDA player_active_held			;$B48797   |
	CMP #$0030				;$B4879A   |
	BNE CODE_B487A2				;$B4879D   |
	BRL CODE_B4BE63				;$B4879F  /

CODE_B487A2:
if !version == 1				;	  \
	LDA $07B0				;$B487A2   |
	BNE CODE_B487B4				;$B487A5   |
	LDA $08FC				;$B487A7   |
	BIT #$0005				;$B487AA   |
	BNE CODE_B487B4				;$B487AD   |
	LDA $064A				;$B487AF   |
	BEQ CODE_B487B7				;$B487B2   |
CODE_B487B4:					;	   |
	BRL CODE_B48927				;$B487B4   |
endif						;	  /

CODE_B487B7:
	LDA player_active_pressed		;$B487B7  \
	BIT #$D0C0				;$B487BA   |
	BEQ CODE_B487C2				;$B487BD   |
	BRL CODE_B48A46				;$B487BF  /

CODE_B487C2:
	LDA $06AB				;$B487C2  \
	ASL A					;$B487C5   |
	ASL A					;$B487C6   |
	TAY					;$B487C7   |
	LDX $3202,y				;$B487C8   |
	PHK					;$B487CB   |
	PLB					;$B487CC   |
	LDA #$0004				;$B487CD   |
	STA $065C				;$B487D0   |
	LDA player_active_held			;$B487D3   |
	XBA					;$B487D6   |
	STA $065A				;$B487D7   |
	LDA $0005,x				;$B487DA   |
	SEP #$20				;$B487DD   |
	XBA					;$B487DF   |
	STA $0650				;$B487E0   |
	XBA					;$B487E3   |
CODE_B487E4:					;	   |
	LSR A					;$B487E4   |
	BCC CODE_B487F2				;$B487E5   |
	LSR $065A				;$B487E7   |
	BCS CODE_B48800				;$B487EA   |
	INX					;$B487EC   |
	INX					;$B487ED   |
	INX					;$B487EE   |
	INX					;$B487EF   |
	BRA CODE_B487F5				;$B487F0  /

CODE_B487F2:
	LSR $065A				;$B487F2  \
CODE_B487F5:					;	   |
	LSR $0650				;$B487F5   |
	DEC $065C				;$B487F8   |
	BNE CODE_B487E4				;$B487FB   |
	BRL CODE_B48927				;$B487FD  /

CODE_B48800:
	REP #$20				;$B48800  \
	LSR $0650				;$B48802   |
	BCS CODE_B4880F				;$B48805   |
	LDA $06A1				;$B48807   |
	AND #$FFFB				;$B4880A   |
	BRA CODE_B48815				;$B4880D  /

CODE_B4880F:
	LDA $06A1				;$B4880F  \
	ORA #$0004				;$B48812   |
CODE_B48815:					;	   |
	STA $06A1				;$B48815   |
	LDA $000D,x				;$B48818   |
	ASL A					;$B4881B   |
	ASL A					;$B4881C   |
	ADC #$2A00				;$B4881D   |
	TAY					;$B48820   |
	%pea_mask_dbr($7E2A00)			;$B48821   |
	PLB					;$B48824   |
	PLB					;$B48825   |
	LDA $0000,y				;$B48826   |
	BNE CODE_B4882E				;$B48829   |
	BRL CODE_B48927				;$B4882B  /

CODE_B4882E:
	LDA $0002,y				;$B4882E  \
	PHK					;$B48831   |
	PLB					;$B48832   |
	LDY $000B,x				;$B48833   |
	STY $06AB				;$B48836   |
	TAX					;$B48839   |
	STX $06AF				;$B4883A   |
	LDA $0000,x				;$B4883D   |
	AND #$00FF				;$B48840   |
	INC A					;$B48843   |
	STA $06C5				;$B48844   |
	LDY $0593				;$B48847   |
	LDA #$CFFF				;$B4884A   |
	AND $0012,y				;$B4884D   |
	ORA $0003,x				;$B48850   |
	STA $0012,y				;$B48853   |
	STA $0790				;$B48856   |
	LDY $0597				;$B48859   |
	BEQ CODE_B4886A				;$B4885C   |
	LDA #$CFFF				;$B4885E   |
	AND $0012,y				;$B48861   |
	ORA $0003,x				;$B48864   |
	STA $0012,y				;$B48867   |
CODE_B4886A:					;	   |
	LDA $06A1				;$B4886A   |
	ORA #$0100				;$B4886D   |
	STA $06A1				;$B48870   |
	BIT #$0004				;$B48873   |
	BEQ CODE_B48885				;$B48876   |
	LDA $06C5				;$B48878   |
	DEC A					;$B4887B   |
	ASL A					;$B4887C   |
	ASL A					;$B4887D   |
	CLC					;$B4887E   |
	ADC $06AF				;$B4887F   |
	STA $06AF				;$B48882   |
CODE_B48885:					;	   |
	JSR CODE_B4B029				;$B48885   |
CODE_B48888:					;	   |
	PHK					;$B48888   |
	PLB					;$B48889   |
	LDA $06A1				;$B4888A   |
	BIT #$0002				;$B4888D   |
	BEQ CODE_B48895				;$B48890   |
	BRL CODE_B48885				;$B48892  /

CODE_B48895:
	LDA $06B3				;$B48895  \
	STA $0650				;$B48898   |
	LDA $06C1				;$B4889B   |
	CMP $06C3				;$B4889E   |
	BEQ CODE_B4890B				;$B488A1   |
	BCC CODE_B488D8				;$B488A3   |
CODE_B488A5:					;	   |
	LDA $06BD				;$B488A5   |
	SEC					;$B488A8   |
	SBC $06BF				;$B488A9   |
	BPL CODE_B488C1				;$B488AC   |
	CLC					;$B488AE   |
	ADC $06C1				;$B488AF   |
	STA $06BD				;$B488B2   |
	LDA $06B7				;$B488B5   |
	CLC					;$B488B8   |
	ADC $06BB				;$B488B9   |
	STA $06B7				;$B488BC   |
	BRA CODE_B488C4				;$B488BF  /

CODE_B488C1:
	STA $06BD				;$B488C1  \
CODE_B488C4:					;	   |
	LDA $06B5				;$B488C4   |
	CLC					;$B488C7   |
	ADC $06B9				;$B488C8   |
	STA $06B5				;$B488CB   |
	JSR CODE_B4AEE3				;$B488CE   |
	DEC $0650				;$B488D1   |
	BNE CODE_B488A5				;$B488D4   |
	BRA CODE_B48927				;$B488D6  /

CODE_B488D8:
	LDA $06BD				;$B488D8  \
	SEC					;$B488DB   |
	SBC $06BF				;$B488DC   |
	BPL CODE_B488F4				;$B488DF   |
	CLC					;$B488E1   |
	ADC $06C3				;$B488E2   |
	STA $06BD				;$B488E5   |
	LDA $06B5				;$B488E8   |
	CLC					;$B488EB   |
	ADC $06B9				;$B488EC   |
	STA $06B5				;$B488EF   |
	BRA CODE_B488F7				;$B488F2  /

CODE_B488F4:
	STA $06BD				;$B488F4  \
CODE_B488F7:					;	   |
	LDA $06B7				;$B488F7   |
	CLC					;$B488FA   |
	ADC $06BB				;$B488FB   |
	STA $06B7				;$B488FE   |
	JSR CODE_B4AEE3				;$B48901   |
	DEC $0650				;$B48904   |
	BNE CODE_B488D8				;$B48907   |
	BRA CODE_B48927				;$B48909  /

CODE_B4890B:
	LDA $06B5				;$B4890B  \
	CLC					;$B4890E   |
	ADC $06B9				;$B4890F   |
	STA $06B5				;$B48912   |
	LDA $06B7				;$B48915   |
	CLC					;$B48918   |
	ADC $06BB				;$B48919   |
	STA $06B7				;$B4891C   |
	JSR CODE_B4AEE3				;$B4891F   |
	DEC $0650				;$B48922   |
	BNE CODE_B4890B				;$B48925   |
CODE_B48927:					;	   |
	JSR CODE_B4AFC3				;$B48927   |
	REP #$20				;$B4892A   |
	LDA $06AF				;$B4892C   |
	BNE CODE_B4896A				;$B4892F   |
	LDA $06A3				;$B48931   |
	BIT #$0020				;$B48934   |
	BNE CODE_B48985				;$B48937   |
	LDA $064A				;$B48939   |
	AND #$00FF				;$B4893C   |
	BNE CODE_B4896A				;$B4893F   |
if !version == 1
	LDA $07B0				;$B48941   |
	BNE CODE_B4896A				;$B48944   |
endif
	LDA $08FC				;$B48946   |
	BIT #$0005				;$B48949   |
	BNE CODE_B4896A				;$B4894C   |
	LDA $06A5				;$B4894E   |
	BIT #$2000				;$B48951   |
	BNE CODE_B4896A				;$B48954   |
	LDY #$0200				;$B48956   |
	LDX #$3A00				;$B48959   |
	LDA $0682				;$B4895C   |
	AND #$00FF				;$B4895F   |
	ASL A					;$B48962   |
	ASL A					;$B48963   |
	DEC A					;$B48964   |
	PHB					;$B48965   |
	MVN $00, $7E				;$B48966   |
	PLB					;$B48969   |
CODE_B4896A:					;	   |
	LDA $06A3				;$B4896A   |
	BIT #$0002				;$B4896D   |
	BEQ CODE_B48989				;$B48970   |
	LDA screen_brightness			;$B48972   |
	BNE CODE_B48985				;$B48975   |
	LDA #CODE_808D02			;$B48977   |
	STA NMI_pointer				;$B4897A   |
	LDA $06A3				;$B4897C   |
	AND #$FFFD				;$B4897F   |
	STA $06A3				;$B48982   |
CODE_B48985:					;	   |
	JSL fade_screen_global			;$B48985   |
CODE_B48989:					;	   |
	LDA $06A1				;$B48989   |
	BIT #$0040				;$B4898C   |
	BNE CODE_B48996				;$B4898F   |
	BIT #$0100				;$B48991   |
	BEQ CODE_B489A2				;$B48994   |
CODE_B48996:					;	   |
	JSR CODE_B4B8C6				;$B48996   |
	LDA $06A1				;$B48999   |
	AND #$FEFF				;$B4899C   |
	STA $06A1				;$B4899F   |
CODE_B489A2:					;	   |
	PLB					;$B489A2   |
	DEC $0697				;$B489A3   |
	BNE CODE_B489B7				;$B489A6   |
	LDA $06A1				;$B489A8   |
	ORA #$0010				;$B489AB   |
	STA $06A1				;$B489AE   |
	LDA #$0004				;$B489B1   |
	STA $0697				;$B489B4   |
CODE_B489B7:					;	   |
	LDA $08FC				;$B489B7   |
	BIT #$0005				;$B489BA   |
	BNE CODE_B489DB				;$B489BD   |
	LDA $0683				;$B489BF   |
	BEQ CODE_B489DB				;$B489C2   |
	DEC $0683				;$B489C4   |
	BNE CODE_B489DB				;$B489C7   |
	LDA $06B1				;$B489C9   |
	BNE CODE_B489D4				;$B489CC   |
	LDA $06AB				;$B489CE   |
	STA $06A9				;$B489D1   |
CODE_B489D4:					;	   |
	LDA #$810F				;$B489D4   |
	JSL set_fade_global			;$B489D7   |
CODE_B489DB:					;	   |
	LDA $07B0				;$B489DB   |
	BEQ CODE_B489EB				;$B489DE   |
	DEC $07B0				;$B489E0   |
	BNE CODE_B489EB				;$B489E3   |
	LDA #$000C				;$B489E5   |
	TSB $08FC				;$B489E8   |
CODE_B489EB:					;	   |
	PLB					;$B489EB   |
	RTL					;$B489EC  /

CODE_B489ED:
	PHP					;$B489ED  \
	PHB					;$B489EE   |
	REP #$20				;$B489EF   |
	LDA #DATA_FC14E0			;$B489F1   |
	STA $0699				;$B489F4   |
	LDA $06A1				;$B489F7   |
	AND #$022C				;$B489FA   |
	STA $06A1				;$B489FD   |
	LDA $06B1				;$B48A00   |
	ASL A					;$B48A03   |
	TAX					;$B48A04   |
	PHK					;$B48A05   |
	PLB					;$B48A06   |
	CMP #$0000				;$B48A07   |
	BNE CODE_B48A14				;$B48A0A   |
	LDA $06A9				;$B48A0C   |
	STA $06AB				;$B48A0F   |
	BRA CODE_B48A14				;$B48A12  /

CODE_B48A14:
	LDY DATA_B4C25E,x			;$B48A14  \
	LDA $0000,y				;$B48A17   |
	STA $06C7				;$B48A1A   |
	LDA $0002,y				;$B48A1D   |
	STA $06C9				;$B48A20   |
	LDA $0004,y				;$B48A23   |
	STA $06CB				;$B48A26   |
	LDA $0006,y				;$B48A29   |
	STA $06CD				;$B48A2C   |
	JSR CODE_B4AFC3				;$B48A2F   |
	LDX #$0005				;$B48A32   |
	LDA $06A3				;$B48A35   |
	BIT #$1000				;$B48A38   |
	BNE CODE_B48A40				;$B48A3B   |
	LDX #$0003				;$B48A3D   |
CODE_B48A40:					;	   |
	STX $06B3				;$B48A40   |
	PLB					;$B48A43   |
	PLP					;$B48A44   |
	RTL					;$B48A45  /

CODE_B48A46:
	SEP #$20				;$B48A46  \
	LDA #$01				;$B48A48   |
	STA $064B				;$B48A4A   |
	REP #$20				;$B48A4D   |
	LDA $06B1				;$B48A4F   |
	BNE CODE_B48A67				;$B48A52   |
	LDA $06A3				;$B48A54   |
	ORA #$0001				;$B48A57   |
	STA $06A3				;$B48A5A   |
	LDA #$810F				;$B48A5D   |
	JSL set_fade_global			;$B48A60   |
	BRL CODE_B48927				;$B48A64  /

CODE_B48A67:
	CMP #$000A				;$B48A67  \
	BCC CODE_B48ABB				;$B48A6A   |
	LDA $06AB				;$B48A6C   |
	CMP #$005E				;$B48A6F   |
	BNE CODE_B48A79				;$B48A72   |
	LDA #$0072				;$B48A74   |
	BRA CODE_B48A9F				;$B48A77  /

CODE_B48A79:
	CMP #$0062				;$B48A79  \
	BNE CODE_B48A83				;$B48A7C   |
	LDA #$0073				;$B48A7E   |
	BRA CODE_B48A9F				;$B48A81  /

CODE_B48A83:
	CMP #$0066				;$B48A83  \
	BNE CODE_B48A8D				;$B48A86   |
	LDA #$0074				;$B48A88   |
	BRA CODE_B48A9F				;$B48A8B  /

CODE_B48A8D:
	CMP #$006A				;$B48A8D  \
	BNE CODE_B48A97				;$B48A90   |
	LDA #$0075				;$B48A92   |
	BRA CODE_B48A9F				;$B48A95  /

CODE_B48A97:
	CMP #$006E				;$B48A97  \
	BNE CODE_B48ABB				;$B48A9A   |
	LDA #$0076				;$B48A9C   |
CODE_B48A9F:					;	   |
	STA $06AB				;$B48A9F   |
	LDA $0900				;$B48AA2   |
	STA $06B1				;$B48AA5   |
	LDA $06A3				;$B48AA8   |
	ORA #$0020				;$B48AAB   |
	STA $06A3				;$B48AAE   |
	LDA #$810F				;$B48AB1   |
	JSL set_fade_global			;$B48AB4   |
	BRL CODE_B48927				;$B48AB8  /

CODE_B48ABB:
	%pea_mask_dbr($7E3201)			;$B48ABB  \
	PLB					;$B48ABE   |
	PLB					;$B48ABF   |
	LDA $06AB				;$B48AC0   |
	ASL A					;$B48AC3   |
	ASL A					;$B48AC4   |
	TAX					;$B48AC5   |
	LDA $3201,x				;$B48AC6   |
	AND #$00FF				;$B48AC9   |
	SEC					;$B48ACC   |
	SBC #$0004				;$B48ACD   |
	BMI CODE_B48AEF				;$B48AD0   |
	CMP #$000A				;$B48AD2   |
	BPL CODE_B48AEF				;$B48AD5   |
	STA $0689				;$B48AD7   |
	LDA #$810F				;$B48ADA   |
	JSL set_fade_global			;$B48ADD   |
	LDA $06A3				;$B48AE1   |
	ORA #$0002				;$B48AE4   |
	STA $06A3				;$B48AE7   |
	PHK					;$B48AEA   |
	PLB					;$B48AEB   |
	BRL CODE_B48927				;$B48AEC  /

CODE_B48AEF:
	LDA $06AB				;$B48AEF  \
	ASL A					;$B48AF2   |
	ASL A					;$B48AF3   |
	TAY					;$B48AF4   |
	LDX $3202,y				;$B48AF5   |
	PHK					;$B48AF8   |
	PLB					;$B48AF9   |
	LDA $0009,x				;$B48AFA   |
	STA level_number			;$B48AFD   |
	LDA $06A3				;$B48AFF   |
	ORA #$0001				;$B48B02   |
	AND #$EFFF				;$B48B05   |
	STA $06A3				;$B48B08   |
	LDA #$810F				;$B48B0B   |
	JSL set_fade_global			;$B48B0E   |
	BRL CODE_B48927				;$B48B12  /

CODE_B48B15:
	LDA #$3E00				;$B48B15  \
	STA $0D2C				;$B48B18   |
	SEP #$20				;$B48B1B   |
	STZ CPU.enable_interrupts		;$B48B1D   |
	REP #$20				;$B48B20   |
	JSL init_sprite_render_order_global	;$B48B22   |
	LDA $06A3				;$B48B26   |
	AND #$EFFF				;$B48B29   |
	STA $06A3				;$B48B2C   |
	JSR CODE_B48C9D				;$B48B2F   |
	SEP #$20				;$B48B32   |
	PHK					;$B48B34   |
	PLA					;$B48B35   |
	STA $067C				;$B48B36   |
	REP #$20				;$B48B39   |
	LDA file_select_action			;$B48B3B   |
	BIT #$0001				;$B48B3E   |
	BEQ CODE_B48B46				;$B48B41   |
	BRL CODE_B48C07				;$B48B43  /

CODE_B48B46:
	LDA $0689				;$B48B46  \
	TAX					;$B48B49   |
	LDA DATA_B4C53D,x			;$B48B4A   |
	LDY language_select			;$B48B4D   |
	BEQ CODE_B48B55				;$B48B50   |
	LDA DATA_B4C853,x			;$B48B52   |
CODE_B48B55:					;	   |
	STA $065C				;$B48B55   |
	LDA #$0004				;$B48B58   |
	STA $0658				;$B48B5B   |
	JSR CODE_B49266				;$B48B5E   |
	LDY $0689				;$B48B61   |
	BNE CODE_B48B78				;$B48B64   |
	LDA $06B1				;$B48B66   |
	CMP #$000A				;$B48B69   |
	BCC CODE_B48B73				;$B48B6C   |
	LDX #$0004				;$B48B6E   |
	BRA CODE_B48B7B				;$B48B71  /

CODE_B48B73:
	LDX #$0005				;$B48B73  \
	BRA CODE_B48B7B				;$B48B76  /

CODE_B48B78:
	LDX #$0001				;$B48B78  \
CODE_B48B7B:					;	   |
	STX $0658				;$B48B7B   |
	JSR CODE_B4A1D4				;$B48B7E   |
	LDX #$07A5				;$B48B81   |
	JSR CODE_B4BD57				;$B48B84   |
	LDX $0689				;$B48B87   |
	JSR CODE_B48D69				;$B48B8A   |
	LDX $0689				;$B48B8D   |
	JSR CODE_B48D8E				;$B48B90   |
	JSR CODE_B48DB5				;$B48B93   |
	LDX $0689				;$B48B96   |
	CPX #$0002				;$B48B99   |
	BNE CODE_B48BDF				;$B48B9C   |
	LDY #DATA_FF12F4			;$B48B9E   |
	JSL CODE_BB83F5				;$B48BA1   |
	LDX alternate_sprite			;$B48BA5   |
	STX $0798				;$B48BA7   |
	LDA #$FFE5				;$B48BAA   |
	STA $20,x				;$B48BAD   |
	LDA #$FFE0				;$B48BAF   |
	STA $24,x				;$B48BB2   |
	LDA #$C000				;$B48BB4   |
	STA $1C,x				;$B48BB7   |
	LDA #$FF7F				;$B48BB9   |
	STA $079A				;$B48BBC   |
	LDA #$FF7F				;$B48BBF   |
	STA $06,x				;$B48BC2   |
	LDA #$000A				;$B48BC4   |
	STA $0A,x				;$B48BC7   |
	LDA #$0050				;$B48BC9   |
	STA $26,x				;$B48BCC   |
	LDA #$FFE0				;$B48BCE   |
	STA $2A,x				;$B48BD1   |
	LDA #$001E				;$B48BD3   |
	STA $0794				;$B48BD6   |
	LDA #$0032				;$B48BD9   |
	STA $0796				;$B48BDC   |
CODE_B48BDF:					;	   |
	LDX $0689				;$B48BDF   |
	CPX #$0008				;$B48BE2   |
	BNE CODE_B48BEE				;$B48BE5   |
	LDY #DATA_FF286A			;$B48BE7   |
	JSL CODE_BB83F5				;$B48BEA   |
CODE_B48BEE:					;	   |
	JSR CODE_B48C76				;$B48BEE   |
	LDA #CODE_808CF5			;$B48BF1   |
	STA NMI_pointer				;$B48BF4   |
	LDA #$0100				;$B48BF6   |
	JSL set_fade_global			;$B48BF9   |
	LDA #$0005				;$B48BFD   |
	STA $0676				;$B48C00   |
	JML CODE_808C84				;$B48C03  /

CODE_B48C07:
	JSR CODE_B4A1D4				;$B48C07  \
	LDX #$07A5				;$B48C0A   |
	JSR CODE_B4BD57				;$B48C0D   |
	LDX $0689				;$B48C10   |
	JSR CODE_B48D69				;$B48C13   |
	JSR CODE_B48DB5				;$B48C16   |
	LDX $0593				;$B48C19   |
	JSR CODE_B48C6B				;$B48C1C   |
	LDX $0597				;$B48C1F   |
	JSR CODE_B48C6B				;$B48C22   |
	LDX $0689				;$B48C25   |
	JSR CODE_B48D8E				;$B48C28   |
	JSR CODE_B48C76				;$B48C2B   |
	LDA #$0001				;$B48C2E   |
	STA $0654				;$B48C31   |
	LDA $06A1				;$B48C34   |
	ORA #$0400				;$B48C37   |
	STA $06A1				;$B48C3A   |
	LDA #$0001				;$B48C3D   |
	STA $0654				;$B48C40   |
	JSR CODE_B4974F				;$B48C43   |
	LDA $06A1				;$B48C46   |
	ORA #$0400				;$B48C49   |
	STA $06A1				;$B48C4C   |
	JSR CODE_B49B47				;$B48C4F   |
	STZ $065C				;$B48C52   |
	LDA #CODE_B4A2A4			;$B48C55   |
	STA $079C				;$B48C58   |
	LDA #CODE_808D4E			;$B48C5B   |
	STA NMI_pointer				;$B48C5E   |
	LDA #$0100				;$B48C60   |
	JSL set_fade_global			;$B48C63   |
	JML CODE_808C84				;$B48C67  /

CODE_B48C6B:
	LDA $44,x				;$B48C6B  \
	STA $06,x				;$B48C6D   |
	STZ $42,x				;$B48C6F   |
	STZ $20,x				;$B48C71   |
	STZ $26,x				;$B48C73   |
	RTS					;$B48C75  /

CODE_B48C76:
	LDX $0689				;$B48C76  \
	LDY DATA_B4CD47,x			;$B48C79   |
	JSL CODE_BB8432				;$B48C7C   |
	LDX alternate_sprite			;$B48C80   |
	LDA #$0014				;$B48C82   |
	STA $06,x				;$B48C85   |
	LDA #$0023				;$B48C87   |
	STA $0A,x				;$B48C8A   |
	LDA $0689				;$B48C8C   |
	CMP #$0008				;$B48C8F   |
	BNE CODE_B48C9C				;$B48C92   |
	LDA $0A,x				;$B48C94   |
	CLC					;$B48C96   |
	ADC #$000A				;$B48C97   |
	STA $0A,x				;$B48C9A   |
CODE_B48C9C:					;	   |
	RTS					;$B48C9C  /

CODE_B48C9D:
	PHK					;$B48C9D  \
	PLB					;$B48C9E   |
	LDA #$7E00				;$B48C9F   |
	STA $C9					;$B48CA2   |
	LDA $06A1				;$B48CA4   |
	AND #$DDFF				;$B48CA7   |
	STA $06A1				;$B48CAA   |
	JSL disable_screen			;$B48CAD   |
	JSL clear_VRAM_global			;$B48CB1   |
	JSL CODE_BAC7C0				;$B48CB5   |
	LDA #$0200				;$B48CB9   |
	STA DMA[0].source			;$B48CBC   |
	STA DMA[0].unused_2			;$B48CBF   |
	LDA #$0220				;$B48CC2   |
	STA DMA[0].size				;$B48CC5   |
	LDA #$0400				;$B48CC8   |
	STA DMA[0].settings			;$B48CCB   |
	SEP #$20				;$B48CCE   |
	STZ DMA[0].source_bank			;$B48CD0   |
	LDA #$01				;$B48CD3   |
	STA CPU.enable_dma			;$B48CD5   |
	REP #$20				;$B48CD8   |
	JSR CODE_B4BDD6				;$B48CDA   |
	JSL CODE_B4BE2F				;$B48CDD   |
	LDY $0689				;$B48CE1   |
	LDA DATA_B4CD5B,y			;$B48CE4   |
	JSL play_song				;$B48CE7   |
	LDY $0689				;$B48CEB   |
	LDX DATA_B4CD51,y			;$B48CEE   |
	LDA $0010,x				;$B48CF1   |
	STA $0662				;$B48CF4   |
	LDA $0012,x				;$B48CF7   |
	STA $0664				;$B48CFA   |
	LDA $0000,x				;$B48CFD   |
	AND #$00FF				;$B48D00   |
	PHX					;$B48D03   |
	JSL VRAM_payload_handler_global		;$B48D04   |
	PLX					;$B48D08   |
	LDA $0001,x				;$B48D09   |
	AND #$00FF				;$B48D0C   |
	PHX					;$B48D0F   |
	JSL set_PPU_registers_global		;$B48D10   |
	PLX					;$B48D14   |
	LDA $0002,x				;$B48D15   |
	LDY #$0000				;$B48D18   |
	LDX #$0020				;$B48D1B   |
	JSL DMA_palette				;$B48D1E   |
	LDA #$00AA				;$B48D22   |
	LDY #$00E0				;$B48D25   |
	LDX #$0004				;$B48D28   |
	JSL DMA_global_palette			;$B48D2B   |
	LDA #global_sprite_palette		;$B48D2F   |
	LDY #$00F0				;$B48D32   |
	LDX #$0004				;$B48D35   |
	JSL DMA_palette				;$B48D38   |
	JSL clear_wram_tables			;$B48D3C   |
	JSL CODE_808D8A				;$B48D40   |
	STZ $067A				;$B48D44   |
	STZ $065E				;$B48D47   |
	SEP #$20				;$B48D4A   |
	LDX #$1202				;$B48D4C   |
	STX HDMA[1].settings			;$B48D4F   |
	LDX #$06CF				;$B48D52   |
	STX HDMA[1].source			;$B48D55   |
	LDA #$00				;$B48D58   |
	STA HDMA[1].source_bank			;$B48D5A   |
	STZ HDMA[1].indirect_source_bank	;$B48D5D   |
	REP #$20				;$B48D60   |
	LDA #$001E				;$B48D62   |
	STA $064E				;$B48D65   |
	RTS					;$B48D68  /

CODE_B48D69:
	LDY DATA_B4CD51,x			;$B48D69  \
	LDX $0593				;$B48D6C   |
	LDA $0016,y				;$B48D6F   |
	STA $44,x				;$B48D72   |
	LDA $001A,y				;$B48D74   |
	STA $46,x				;$B48D77   |
	LDA #$0001				;$B48D79   |
	STA $42,x				;$B48D7C   |
	LDX $0597				;$B48D7E   |
	STA $42,x				;$B48D81   |
	LDA $0018,y				;$B48D83   |
	STA $44,x				;$B48D86   |
	LDA $001A,y				;$B48D88   |
	STA $46,x				;$B48D8B   |
	RTS					;$B48D8D  /

CODE_B48D8E:
	LDY DATA_B4CD51,x			;$B48D8E  \
	LDX $0014,y				;$B48D91   |
CODE_B48D94:					;	   |
	LDY $0000,x				;$B48D94   |
	BEQ CODE_B48DB4				;$B48D97   |
	PHX					;$B48D99   |
	LDA $0002,x				;$B48D9A   |
	AND #$00FF				;$B48D9D   |
	BEQ CODE_B48DA8				;$B48DA0   |
	JSL CODE_BB8443				;$B48DA2   |
	BRA CODE_B48DAC				;$B48DA6  /

CODE_B48DA8:
	JSL CODE_BB842C				;$B48DA8  \
CODE_B48DAC:					;	   |
	PLA					;$B48DAC   |
	CLC					;$B48DAD   |
	ADC #$0003				;$B48DAE   |
	TAX					;$B48DB1   |
	BRA CODE_B48D94				;$B48DB2  /

CODE_B48DB4:
	RTS					;$B48DB4  /

CODE_B48DB5:
	LDY $0689				;$B48DB5  \
	LDX DATA_B4CD51,y			;$B48DB8   |
	LDY $0593				;$B48DBB   |
	LDA $0004,x				;$B48DBE   |
	STA $0006,y				;$B48DC1   |
	LDA $0006,x				;$B48DC4   |
	STA $000A,y				;$B48DC7   |
	LDY $0597				;$B48DCA   |
	LDA $0008,x				;$B48DCD   |
	STA $0006,y				;$B48DD0   |
	LDA $000A,x				;$B48DD3   |
	STA $000A,y				;$B48DD6   |
	LDA $000C,x				;$B48DD9   |
	BIT #$0001				;$B48DDC   |
	BEQ CODE_B48DF9				;$B48DDF   |
	LDY $0593				;$B48DE1   |
	LDA $0012,y				;$B48DE4   |
	EOR #$4000				;$B48DE7   |
	STA $0012,y				;$B48DEA   |
	LDY $0597				;$B48DED   |
	LDA $0012,y				;$B48DF0   |
	EOR #$4000				;$B48DF3   |
	STA $0012,y				;$B48DF6   |
CODE_B48DF9:					;	   |
	RTS					;$B48DF9  /

CODE_B48DFA:
	JSL disable_screen			;$B48DFA  \
	LDA #$0040				;$B48DFE   |
	TSB $08FB				;$B48E01   |
	LDA #$0040				;$B48E04   |
	TRB $06A5				;$B48E07   |
	LDA $08A4				;$B48E0A   |
	STA $0660				;$B48E0D   |
	LDA $08C2				;$B48E10   |
	STA $0676				;$B48E13   |
	LDA #$4000				;$B48E16   |
	TSB $08C2				;$B48E19   |
	LDA #$0000				;$B48E1C   |
	JSL CODE_808837				;$B48E1F   |
	STZ $0689				;$B48E23   |
	JSR CODE_B48C9D				;$B48E26   |
	LDX #$0000				;$B48E29   |
	JSR CODE_B48D69				;$B48E2C   |
	LDX #$0000				;$B48E2F   |
	JSR CODE_B48D8E				;$B48E32   |
	JSR CODE_B48DB5				;$B48E35   |
	LDX #$0006				;$B48E38   |
	STX $0658				;$B48E3B   |
	LDA #DATA_F700B6			;$B48E3E   |
	LDY language_select			;$B48E41   |
	BEQ CODE_B48E49				;$B48E44   |
	LDA #DATA_F7FCCA			;$B48E46   |
CODE_B48E49:					;	   |
	STA $065C				;$B48E49   |
	JSR CODE_B49080				;$B48E4C   |
	LDA #CODE_B48E6C			;$B48E4F   |
	STA $067D				;$B48E52   |
	LDA #CODE_B49043			;$B48E55   |
	STA $067F				;$B48E58   |
	LDA #$0100				;$B48E5B   |
	JSL set_fade_global			;$B48E5E   |
	LDA #$0001				;$B48E62   |
	STA $064E				;$B48E65   |
	JML CODE_808C84				;$B48E68  /

CODE_B48E6C:
	PHK					;$B48E6C  \
	PLB					;$B48E6D   |
	JSL CODE_B5A919				;$B48E6E   |
	JSL CODE_80F320				;$B48E72   |
	DEC $064E				;$B48E76   |
	BEQ CODE_B48E7E				;$B48E79   |
	BRL CODE_B48F07				;$B48E7B  /

CODE_B48E7E:
	LDA $06A1				;$B48E7E  \
	BIT #$0200				;$B48E81   |
	BEQ CODE_B48EC2				;$B48E84   |
	LDA $06A1				;$B48E86   |
	BIT #$1000				;$B48E89   |
	BNE CODE_B48EAE				;$B48E8C   |
	JSR CODE_B4BDE7				;$B48E8E   |
	INC $064E				;$B48E91   |
	LDA $06A1				;$B48E94   |
	BIT #$0001				;$B48E97   |
	BEQ CODE_B48EBF				;$B48E9A   |
	ORA #$1000				;$B48E9C   |
	AND #$FFFE				;$B48E9F   |
	STA $06A1				;$B48EA2   |
	LDA #$0258				;$B48EA5   |
	STA $064E				;$B48EA8   |
	BRL CODE_B48F07				;$B48EAB  /

CODE_B48EAE:
	JSR CODE_B4BE0B				;$B48EAE  \
	INC $064E				;$B48EB1   |
	LDA $06A1				;$B48EB4   |
	BIT #$0001				;$B48EB7   |
	BEQ CODE_B48EBF				;$B48EBA   |
	BRL CODE_B48FE9				;$B48EBC  /

CODE_B48EBF:
	BRL CODE_B48F07				;$B48EBF  /

CODE_B48EC2:
	LDA $0662				;$B48EC2  \
	STA PPU.vram_address			;$B48EC5   |
	SEP #$20				;$B48EC8   |
	LDA #$01				;$B48ECA   |
	STA DMA[0].settings			;$B48ECC   |
	LDA #$18				;$B48ECF   |
	STA DMA[0].destination			;$B48ED1   |
	LDX #$3E00				;$B48ED4   |
	STX DMA[0].source			;$B48ED7   |
	LDA #$7E				;$B48EDA   |
	STA DMA[0].source_bank			;$B48EDC   |
	LDX #$0180				;$B48EDF   |
	STX DMA[0].size				;$B48EE2   |
	STZ DMA[0].unused_1			;$B48EE5   |
	LDA #$01				;$B48EE8   |
	STA CPU.enable_dma			;$B48EEA   |
	REP #$20				;$B48EED   |
	LDA $06A1				;$B48EEF   |
	ORA #$0200				;$B48EF2   |
	AND #$EFFF				;$B48EF5   |
	STA $06A1				;$B48EF8   |
	LDA #$0001				;$B48EFB   |
	STA $064E				;$B48EFE   |
	LDA #$0001				;$B48F01   |
	JSR CODE_B4BD8D				;$B48F04   |
CODE_B48F07:					;	   |
	LDA $06A5				;$B48F07   |
	BIT #$0020				;$B48F0A   |
	BEQ CODE_B48F28				;$B48F0D   |
	LDA $067F				;$B48F0F   |
	CMP #CODE_B4C14E			;$B48F12   |
	BNE CODE_B48F28				;$B48F15   |
	LDA player_active_pressed		;$B48F17   |
	BIT #$D0C0				;$B48F1A   |
	BEQ CODE_B48F28				;$B48F1D   |
	LDA #$0001				;$B48F1F   |
	STA $0658				;$B48F22   |
	JSR CODE_B48FF4				;$B48F25   |
CODE_B48F28:					;	   |
	JSL fade_screen_global			;$B48F28   |
	JSR CODE_B49EF1				;$B48F2C   |
	LDA $06A5				;$B48F2F   |
	BIT #$0800				;$B48F32   |
	BEQ CODE_B48F68				;$B48F35   |
	DEC $0652				;$B48F37   |
	BNE CODE_B48F68				;$B48F3A   |
	LDA #$0003				;$B48F3C   |
	STA $0652				;$B48F3F   |
	LDA $06A5				;$B48F42   |
	EOR #$0008				;$B48F45   |
	STA $06A5				;$B48F48   |
	BIT #$0008				;$B48F4B   |
	BNE CODE_B48F5C				;$B48F4E   |
	SEP #$20				;$B48F50   |
	STZ PPU.layer_1_scroll_y		;$B48F52   |
	STZ PPU.layer_1_scroll_y		;$B48F55   |
	REP #$20				;$B48F58   |
	BRA CODE_B48F68				;$B48F5A  /

CODE_B48F5C:
	SEP #$20				;$B48F5C  \
	LDA #$03				;$B48F5E   |
	STA PPU.layer_1_scroll_y		;$B48F60   |
	STZ PPU.layer_1_scroll_y		;$B48F63   |
	REP #$20				;$B48F66   |
CODE_B48F68:					;	   |
	LDA screen_brightness			;$B48F68   |
	BNE CODE_B48F79				;$B48F6B   |
	LDA $06A5				;$B48F6D   |
	AND #$F7DF				;$B48F70   |
	STA $06A5				;$B48F73   |
	JMP ($067F)				;$B48F76  /

CODE_B48F79:
	JSL CODE_BAC7C0				;$B48F79  \
	LDA #$03FC				;$B48F7D   |
	STA $C8					;$B48F80   |
	LDA $06A5				;$B48F82   |
	BIT #$0020				;$B48F85   |
	BEQ CODE_B48FDD				;$B48F88   |
	LDA.l DATA_B4BED7			;$B48F8A   |
	LDX #$07A5				;$B48F8E   |
	JSR CODE_B4BD57				;$B48F91   |
	LDX #$07A5				;$B48F94   |
	LDY $07A8				;$B48F97   |
	JSR CODE_B4BC51				;$B48F9A   |
	LDA.l DATA_B4BEDF			;$B48F9D   |
	LDX #$07A5				;$B48FA1   |
	JSR CODE_B4BD57				;$B48FA4   |
	LDX #$07A5				;$B48FA7   |
	LDY $07AA				;$B48FAA   |
	JSR CODE_B4BC51				;$B48FAD   |
	LDA $0670				;$B48FB0   |
	CMP #$0004				;$B48FB3   |
	BNE CODE_B48FCB				;$B48FB6   |
	LDA.l DATA_B4BEE7			;$B48FB8   |
	LDX #$07A5				;$B48FBC   |
	JSR CODE_B4BD57				;$B48FBF   |
	LDX #$07A5				;$B48FC2   |
	LDY $07AC				;$B48FC5   |
	JSR CODE_B4BC51				;$B48FC8   |
CODE_B48FCB:					;	   |
	LDA $08CE				;$B48FCB   |
	LDX #$07A5				;$B48FCE   |
	JSR CODE_B4BD57				;$B48FD1   |
	LDX #$07A5				;$B48FD4   |
	LDY $07AE				;$B48FD7   |
	JSR CODE_B4BC51				;$B48FDA   |
CODE_B48FDD:					;	   |
	JSL sprite_handler			;$B48FDD   |
	JSL CODE_B5A8DA				;$B48FE1   |
	JSR CODE_B4AE85				;$B48FE5   |
	RTL					;$B48FE8  /

CODE_B48FE9:
	PHK					;$B48FE9  \
	PLB					;$B48FEA   |
	JSR CODE_B49EF1				;$B48FEB   |
	JSR CODE_B48FF4				;$B48FEE   |
	BRL CODE_B48F79				;$B48FF1  /

CODE_B48FF4:
	LDA $06A1				;$B48FF4  \
	AND #$FDFF				;$B48FF7   |
	STA $06A1				;$B48FFA   |
	DEC $0658				;$B48FFD   |
	BEQ CODE_B4901B				;$B49000   |
	LDA #$0001				;$B49002   |
	STA $064E				;$B49005   |
	LDA $06A1				;$B49008   |
	AND #$EFFE				;$B4900B   |
	STA $06A1				;$B4900E   |
	INC $065C				;$B49011   |
	INC $065C				;$B49014   |
	JSR CODE_B49080				;$B49017   |
	RTS					;$B4901A  /

CODE_B4901B:
	LDA $067F				;$B4901B  \
	CMP #CODE_B4C14E			;$B4901E   |
	BNE CODE_B49033				;$B49021   |
	LDA player_active_pressed		;$B49023   |
	BIT #$D0C0				;$B49026   |
	BNE CODE_B49033				;$B49029   |
	LDA #$0011				;$B4902B   |
	STA PPU.screens				;$B4902E   |
	BRA CODE_B49042				;$B49031  /

CODE_B49033:
	LDA screen_brightness			;$B49033  \
	CMP #$000F				;$B49036   |
	BNE CODE_B49042				;$B49039   |
	LDA #$810F				;$B4903B   |
	JSL set_fade_global			;$B4903E   |
CODE_B49042:					;	   |
	RTS					;$B49042  /

CODE_B49043:
	LDA $0676				;$B49043  \
	STA $08C2				;$B49046   |
	LDA $0660				;$B49049   |
	STA $08A4				;$B4904C   |
	LDA #CODE_808CD9			;$B4904F   |
	STA NMI_pointer				;$B49052   |
	LDA #CODE_B4BEEF			;$B49054   |
	STA $067D				;$B49057   |
	LDA #CODE_B4C139			;$B4905A   |
	STA $067F				;$B4905D   |
	LDA $06A5				;$B49060   |
	ORA #$0001				;$B49063   |
	STA $06A5				;$B49066   |
	LDA #$0004				;$B49069   |
	STA $0658				;$B4906C   |
if !version == 0				;	   |
	LDA #DATA_F7844C			;$B4906F   |
else						;	   |
	LDA #DATA_F7844E			;$B4906F   |
endif						;	   |
	LDY language_select			;$B49072   |
	BEQ CODE_B4907A				;$B49075   |
	LDA #DATA_F7FCD6			;$B49077   |
CODE_B4907A:					;	   |
	STA $0672				;$B4907A   |
	BRL CODE_B48F79				;$B4907D  /

CODE_B49080:
	LDA $0658				;$B49080  \
	CMP #$0003				;$B49083   |
	BEQ CODE_B49098				;$B49086   |
	LDA $067F				;$B49088   |
	CMP #CODE_B4C139			;$B4908B   |
	BEQ CODE_B490C4				;$B4908E   |
	LDA $0658				;$B49090   |
	CMP #$0001				;$B49093   |
	BNE CODE_B490C4				;$B49096   |
CODE_B49098:					;	   |
	LDA $06A5				;$B49098   |
	BIT #$0001				;$B4909B   |
	BEQ CODE_B490C4				;$B4909E   |
	LDA $0670				;$B490A0   |
	DEC A					;$B490A3   |
	ASL A					;$B490A4   |
	CLC					;$B490A5   |
	ADC $065C				;$B490A6   |
	TAY					;$B490A9   |
	LDA $067F				;$B490AA   |
	CMP #CODE_B4C139			;$B490AD   |
	BNE CODE_B490C7				;$B490B0   |
	LDA #DATA_F78456			;$B490B2   |
	PHY					;$B490B5   |
	LDY language_select			;$B490B6   |
	BEQ CODE_B490BE				;$B490B9   |
	LDA #DATA_F7FCDE			;$B490BB   |
CODE_B490BE:					;	   |
	STA $065C				;$B490BE   |
	PLY					;$B490C1   |
	BRA CODE_B490C7				;$B490C2  /

CODE_B490C4:
	LDY $065C				;$B490C4  \
CODE_B490C7:					;	   |
	JSR CODE_B4ADDF				;$B490C7   |
	LDX $0000,y				;$B490CA   |
	PHK					;$B490CD   |
	PLB					;$B490CE   |
	LDA #$0006				;$B490CF   |
	LDY #$0000				;$B490D2   |
	JSR CODE_B4ADEB				;$B490D5   |
	RTS					;$B490D8  /

CODE_B490D9:
	STZ $0689				;$B490D9   |
	JSR CODE_B48C9D				;$B490DC   |
	LDX #$0000				;$B490DF   |
	JSR CODE_B48D69				;$B490E2   |
	LDX #$0000				;$B490E5   |
	JSR CODE_B48D8E				;$B490E8   |
	JSR CODE_B48DB5				;$B490EB   |
	LDX #$0004				;$B490EE   |
	STX $0658				;$B490F1   |
	LDA #DATA_F700C2			;$B490F4   |
	LDY language_select			;$B490F7   |
	BEQ CODE_B490FF				;$B490FA   |
	LDA #DATA_F7FCF0			;$B490FC   |
CODE_B490FF:					;	   |
	STA $065C				;$B490FF   |
	JSR CODE_B49080				;$B49102   |
	LDA #CODE_B48E6C			;$B49105   |
	STA $067D				;$B49108   |
	LDA #CODE_B49122			;$B4910B   |
	STA $067F				;$B4910E   |
	LDA #$0100				;$B49111   |
	JSL set_fade_global			;$B49114   |
	LDA #$0001				;$B49118   |
	STA $064E				;$B4911B   |
	JML CODE_808C84				;$B4911E  /

CODE_B49122:
	JML restart_rareware_logo		;$B49122  |

CODE_B49126:
	LDA #$4000				;$B49126  \
	TSB $08C2				;$B49129   |
	LDA #$0000				;$B4912C   |
	JSL CODE_808837				;$B4912F   |
	STZ $0689				;$B49133   |
	JSR CODE_B48C9D				;$B49136   |
	LDX #$0000				;$B49139   |
	JSR CODE_B48D69				;$B4913C   |
	LDX #$0000				;$B4913F   |
	JSR CODE_B48D8E				;$B49142   |
	JSR CODE_B48DB5				;$B49145   |
	LDX #$0002				;$B49148   |
	STX $0658				;$B4914B   |
	LDA #DATA_F700CA			;$B4914E   |
	LDY language_select			;$B49151   |
	BEQ CODE_B49159				;$B49154   |
	LDA #DATA_F7FCF8			;$B49156   |
CODE_B49159:					;	   |
	STA $065C				;$B49159   |
	JSR CODE_B49080				;$B4915C   |
	LDA #CODE_B48E6C			;$B4915F   |
	STA $067D				;$B49162   |
	LDA #CODE_B49188			;$B49165   |
	STA $067F				;$B49168   |
	LDA #$0100				;$B4916B   |
	JSL set_fade_global			;$B4916E   |
	LDA #$0001				;$B49172   |
	STA $064E				;$B49175   |
	STA $0652				;$B49178   |
	LDA $06A5				;$B4917B   |
	ORA #$0800				;$B4917E   |
	STA $06A5				;$B49181   |
	JML CODE_808C84				;$B49184  /

CODE_B49188:
	LDA $0676				;$B49188  \
	STA $08C2				;$B4918B   |
	LDA $0660				;$B4918E   |
	STA $08A4				;$B49191   |
	LDA #CODE_808CD9			;$B49194   |
	STA NMI_pointer				;$B49197   |
	LDA #CODE_B4BEEF			;$B49199   |
	STA $067D				;$B4919C   |
	LDA #CODE_B491C5			;$B4919F   |
	STA $067F				;$B491A2   |
	LDA $06A5				;$B491A5   |
	ORA #$0021				;$B491A8   |
	STA $06A5				;$B491AB   |
	LDA #$0002				;$B491AE   |
	STA $0658				;$B491B1   |
	LDA #DATA_F7845C			;$B491B4   |
	LDY language_select			;$B491B7   |
	BEQ CODE_B491BF				;$B491BA   |
	LDA #DATA_F7FCE4			;$B491BC   |
CODE_B491BF:					;	   |
	STA $0672				;$B491BF   |
	BRL CODE_B48F79				;$B491C2  /

CODE_B491C5:
if !version == 0				;	  \
	LDA #$0063				;$B491C5   |
	STA $08D0				;$B491C8   |
else						;	   |
	JSR CODE_B4AE58				;$B491C5   |
endif						;	   |
	STZ $08FE				;$B491C8   |
	JSL disable_screen			;$B491CB   |
	JSL CODE_BBC5AB				;$B491CF   |
	JML CODE_809F85				;$B491D3  /

CODE_B491D7:
	PHK					;$B491D7  \
	PLB					;$B491D8   |
	JSR CODE_B4A11F				;$B491D9   |
	JSL CODE_B5A919				;$B491DC   |
	JSL CODE_80F320				;$B491E0   |
	JSR CODE_B4996E				;$B491E4   |
	LDA screen_brightness			;$B491E7   |
	CMP #$000F				;$B491EA   |
	BEQ CODE_B491FF				;$B491ED   |
	LDA $0676				;$B491EF   |
	BNE CODE_B491FA				;$B491F2   |
	JSL fade_screen_global			;$B491F4   |
	BRA CODE_B49224				;$B491F8  /

CODE_B491FA:
	DEC $0676				;$B491FA  \
	BRA CODE_B49224				;$B491FD  /

CODE_B491FF:
	LDA $0689				;$B491FF  \
	CMP #$0008				;$B49202   |
	BNE CODE_B4921F				;$B49205   |
	JSR CODE_B49FFD				;$B49207   |
	LDA $08FA				;$B4920A   |
	BIT $0666				;$B4920D   |
	BEQ CODE_B4921F				;$B49210   |
	LDA #CODE_808D3D			;$B49212   |
	STA NMI_pointer				;$B49215   |
	LDA #$0001				;$B49217   |
	STA $0654				;$B4921A   |
	BRA CODE_B49224				;$B4921D  /

CODE_B4921F:
	LDA #CODE_808D0E			;$B4921F  \
	STA NMI_pointer				;$B49222   |
CODE_B49224:					;	   |
	LDA #$0200				;$B49224   |
	STA DMA[0].source			;$B49227   |
	STA DMA[0].unused_2			;$B4922A   |
	LDA #$0220				;$B4922D   |
	STA DMA[0].size				;$B49230   |
	LDA #$0400				;$B49233   |
	STA DMA[0].settings			;$B49236   |
	SEP #$20				;$B49239   |
	STZ DMA[0].source_bank			;$B4923B   |
	LDA #$01				;$B4923E   |
	STA CPU.enable_dma			;$B49240   |
	REP #$20				;$B49243   |
	SEP #$20				;$B49245   |
	LDA screen_brightness			;$B49247   |
	STA PPU.screen				;$B4924A   |
	REP #$20				;$B4924D   |
	JSL CODE_BAC7C0				;$B4924F   |
	LDA #$03FC				;$B49253   |
	STA $C8					;$B49256   |
	LDX #$07A5				;$B49258   |
	JSR CODE_B4BB62				;$B4925B   |
	JSL sprite_handler			;$B4925E   |
	JSR CODE_B4AE85				;$B49262   |
	RTL					;$B49265  /

CODE_B49266:
	PHK					;$B49266  \
	PLB					;$B49267   |
	LDA $0689				;$B49268   |
	BNE CODE_B492B5				;$B4926B   |
	LDA $06B1				;$B4926D   |
	CMP #$000A				;$B49270   |
	BCC CODE_B492B5				;$B49273   |
	LDA $08FB				;$B49275   |
	BIT #$0020				;$B49278   |
	BNE CODE_B492B5				;$B4927B   |
	LDA #$0004				;$B4927D   |
	SEC					;$B49280   |
	SBC $0658				;$B49281   |
	ASL A					;$B49284   |
	TAY					;$B49285   |
	LDA language_select			;$B49286   |
	BNE CODE_B49293				;$B49289   |
	JSR CODE_B4ADDF				;$B4928B   |
	LDX $00AE,y				;$B4928E   |
	BRA CODE_B49299				;$B49291  /

CODE_B49293:
	JSR CODE_B4ADDF				;$B49293  \
	LDX.w DATA_F7FCC2,y			;$B49296   |
CODE_B49299:					;	   |
	PHK					;$B49299   |
	PLB					;$B4929A   |
	LDA #$0006				;$B4929B   |
	LDY #$0000				;$B4929E   |
	JSR CODE_B4ADEB				;$B492A1   |
	LDA $0658				;$B492A4   |
	CMP #$0001				;$B492A7   |
	BNE CODE_B492B2				;$B492AA   |
	LDA #$0020				;$B492AC   |
	TSB $08FB				;$B492AF   |
CODE_B492B2:					;	   |
	BRL CODE_B4935D				;$B492B2  /

CODE_B492B5:
	LDA $0689				;$B492B5  \
	LSR A					;$B492B8   |
	STA $0654				;$B492B9   |
	INC $0654				;$B492BC   |
	LDA #$0000				;$B492BF   |
	SEC					;$B492C2   |
CODE_B492C3:					;	   |
	ROL A					;$B492C3   |
	DEC $0654				;$B492C4   |
	BNE CODE_B492C3				;$B492C7   |
	STA $0654				;$B492C9   |
	LDA $08FB				;$B492CC   |
	AND #$00FF				;$B492CF   |
	BIT $0654				;$B492D2   |
	BNE CODE_B49315				;$B492D5   |
	ORA $0654				;$B492D7   |
	SEP #$20				;$B492DA   |
	STA $08FB				;$B492DC   |
	REP #$20				;$B492DF   |
	LDY $0689				;$B492E1   |
	LDX DATA_B4C533,y			;$B492E4   |
	LDA language_select			;$B492E7   |
	BEQ CODE_B492EF				;$B492EA   |
	LDX DATA_B4C849,y			;$B492EC   |
CODE_B492EF:					;	   |
	PHX					;$B492EF   |
	INX					;$B492F0   |
	LDA #$0006				;$B492F1   |
	LDY #$0000				;$B492F4   |
	JSR CODE_B4ADEB				;$B492F7   |
	PLY					;$B492FA   |
	JSR CODE_B4ADDF				;$B492FB   |
	LDA $0000,y				;$B492FE   |
	PHK					;$B49301   |
	PLB					;$B49302   |
	AND #$00FF				;$B49303   |
	CMP #$0002				;$B49306   |
	BCC CODE_B49310				;$B49309   |
	STX $0660				;$B4930B   |
	BRA CODE_B4935D				;$B4930E  /

CODE_B49310:
	STZ $0660				;$B49310  \
	BRA CODE_B4935D				;$B49313  /

CODE_B49315:
	STZ $0660				;$B49315  \
	JSL CODE_B4C175				;$B49318   |
	STA $0654				;$B4931C   |
	STA CPU.dividen				;$B4931F   |
	LDX $065C				;$B49322   |
	JSR CODE_B4ADDF				;$B49325   |
	LDA $0000,x				;$B49328   |
	PHK					;$B4932B   |
	PLB					;$B4932C   |
	CMP $0654				;$B4932D   |
	BCS CODE_B49343				;$B49330   |
	SEP #$20				;$B49332   |
	STA CPU.divisor				;$B49334   |
	LDA #$08				;$B49337   |
CODE_B49339:					;	   |
	DEC A					;$B49339   |
	BNE CODE_B49339				;$B4933A   |
	REP #$20				;$B4933C   |
	LDA CPU.multiply_result			;$B4933E   |
	BRA CODE_B49346				;$B49341  /

CODE_B49343:
	LDA $0654				;$B49343  \
CODE_B49346:					;	   |
	ASL A					;$B49346   |
	CLC					;$B49347   |
	ADC $065C				;$B49348   |
	TAY					;$B4934B   |
	JSR CODE_B4ADDF				;$B4934C   |
	LDX $0002,y				;$B4934F   |
	PHK					;$B49352   |
	PLB					;$B49353   |
	LDA #$0006				;$B49354   |
	LDY #$0000				;$B49357   |
	JSR CODE_B4ADEB				;$B4935A   |
CODE_B4935D:					;	   |
	RTS					;$B4935D  /

CODE_B4935E:
	PHK					;$B4935E  \
	PLB					;$B4935F   |
	JSL CODE_B5A919				;$B49360   |
	JSL CODE_80F320				;$B49364   |
	JSR CODE_B4996E				;$B49368   |
	DEC $064E				;$B4936B   |
	BEQ CODE_B49373				;$B4936E   |
	BRL CODE_B493FC				;$B49370  /

CODE_B49373:
	LDA $06A1				;$B49373  \
	BIT #$0200				;$B49376   |
	BEQ CODE_B493B7				;$B49379   |
	LDA $06A1				;$B4937B   |
	BIT #$1000				;$B4937E   |
	BNE CODE_B493A3				;$B49381   |
	JSR CODE_B4BDE7				;$B49383   |
	INC $064E				;$B49386   |
	LDA $06A1				;$B49389   |
	BIT #$0001				;$B4938C   |
	BEQ CODE_B493B4				;$B4938F   |
	ORA #$1000				;$B49391   |
	AND #$FFFE				;$B49394   |
	STA $06A1				;$B49397   |
	LDA #$0258				;$B4939A   |
	STA $064E				;$B4939D   |
	BRL CODE_B493FC				;$B493A0  /

CODE_B493A3:
	JSR CODE_B4BE0B				;$B493A3  \
	INC $064E				;$B493A6   |
	LDA $06A1				;$B493A9   |
	BIT #$0001				;$B493AC   |
	BEQ CODE_B493B4				;$B493AF   |
	BRL CODE_B4945F				;$B493B1  /

CODE_B493B4:
	BRL CODE_B493FC				;$B493B4  /

CODE_B493B7:
	LDA $0662				;$B493B7  \
	STA PPU.vram_address			;$B493BA   |
	SEP #$20				;$B493BD   |
	LDA #$01				;$B493BF   |
	STA DMA[0].settings			;$B493C1   |
	LDA #$18				;$B493C4   |
	STA DMA[0].destination			;$B493C6   |
	LDX #$3E00				;$B493C9   |
	STX DMA[0].source			;$B493CC   |
	LDA #$7E				;$B493CF   |
	STA DMA[0].source_bank			;$B493D1   |
	LDX #$0180				;$B493D4   |
	STX DMA[0].size				;$B493D7   |
	STZ DMA[0].unused_1			;$B493DA   |
	LDA #$01				;$B493DD   |
	STA CPU.enable_dma			;$B493DF   |
	REP #$20				;$B493E2   |
	LDA $06A1				;$B493E4   |
	ORA #$0200				;$B493E7   |
	AND #$EFFF				;$B493EA   |
	STA $06A1				;$B493ED   |
	LDA #$0001				;$B493F0   |
	STA $064E				;$B493F3   |
	LDA #$0001				;$B493F6   |
	JSR CODE_B4BD8D				;$B493F9   |
CODE_B493FC:					;	   |
	LDA player_active_pressed		;$B493FC   |
	BIT #$D0C0				;$B493FF   |
	BEQ CODE_B49425				;$B49402   |
	LDA $0689				;$B49404   |
	BNE CODE_B49419				;$B49407   |
	LDA $06B1				;$B49409   |
	CMP #$000A				;$B4940C   |
	BCC CODE_B49419				;$B4940F   |
	LDA $08FB				;$B49411   |
	BIT #$0020				;$B49414   |
	BEQ CODE_B49425				;$B49417   |
CODE_B49419:					;	   |
	LDA #$0001				;$B49419   |
	STA $064E				;$B4941C   |
	LDA #$0001				;$B4941F   |
	STA $0658				;$B49422   |
CODE_B49425:					;	   |
	LDA player_active_pressed		;$B49425   |
	BIT #$0300				;$B49428   |
	BEQ CODE_B49441				;$B4942B   |
	LDA screen_brightness			;$B4942D   |
	CMP #$000F				;$B49430   |
	BNE CODE_B49441				;$B49433   |
	LDA #CODE_808D7D			;$B49435   |
	STA NMI_pointer				;$B49438   |
	LDA #$810F				;$B4943A   |
	JSL set_fade_global			;$B4943D   |
CODE_B49441:					;	   |
	JSR CODE_B49EF1				;$B49441   |
CODE_B49444:					;	   |
	JSL CODE_BAC7C0				;$B49444   |
	LDA #$03FC				;$B49448   |
	STA $C8					;$B4944B   |
	LDX #$07A5				;$B4944D   |
	JSR CODE_B4BB62				;$B49450   |
	JSL sprite_handler			;$B49453   |
	JSL CODE_B5A8DA				;$B49457   |
	JSR CODE_B4AE85				;$B4945B   |
	RTL					;$B4945E  /

CODE_B4945F:
	PHK					;$B4945F  \
	PLB					;$B49460   |
	LDA $06A1				;$B49461   |
	AND #$FDFF				;$B49464   |
	STA $06A1				;$B49467   |
	LDA $0660				;$B4946A   |
	BEQ CODE_B494AC				;$B4946D   |
	JSR CODE_B49EF1				;$B4946F   |
	JSL CODE_BAC7C0				;$B49472   |
	LDA #$03FC				;$B49476   |
	STA $C8					;$B49479   |
	LDX #$07A5				;$B4947B   |
	JSR CODE_B4BB62				;$B4947E   |
	PHK					;$B49481   |
	JSL sprite_handler			;$B49482   |
	PLB					;$B49486   |
	JSR CODE_B4AE85				;$B49487   |
	STZ $0699				;$B4948A   |
	LDX $0660				;$B4948D   |
	LDA #$0006				;$B49490   |
	LDY #$0000				;$B49493   |
	JSR CODE_B4ADEB				;$B49496   |
	LDA $06A1				;$B49499   |
	AND #$EDFE				;$B4949C   |
	STA $06A1				;$B4949F   |
	STZ $0660				;$B494A2   |
	LDA #$0001				;$B494A5   |
	STA $064E				;$B494A8   |
	RTL					;$B494AB  /

CODE_B494AC:
	JSR CODE_B49EF1				;$B494AC  \
	DEC $0658				;$B494AF   |
	BEQ CODE_B494DB				;$B494B2   |
	LDA #$0001				;$B494B4   |
	STA $064E				;$B494B7   |
	LDA $06A1				;$B494BA   |
	AND #$EFFE				;$B494BD   |
	STA $06A1				;$B494C0   |
	LDA $0689				;$B494C3   |
	TAX					;$B494C6   |
	LDA DATA_B4C53D,x			;$B494C7   |
	LDY language_select			;$B494CA   |
	BEQ CODE_B494D2				;$B494CD   |
	LDA DATA_B4C853,x			;$B494CF   |
CODE_B494D2:					;	   |
	STA $065C				;$B494D2   |
	JSR CODE_B49266				;$B494D5   |
	BRL CODE_B49444				;$B494D8  /

CODE_B494DB:
	LDA $0689				;$B494DB  \
	BNE CODE_B4951B				;$B494DE   |
	LDA $06A1				;$B494E0   |
	BIT #$2000				;$B494E3   |
	BNE CODE_B4951B				;$B494E6   |
	ORA #$2000				;$B494E8   |
	STA $06A1				;$B494EB   |
	LDA #$0001				;$B494EE   |
	STA $064E				;$B494F1   |
	STA $0658				;$B494F4   |
	LDA $06A1				;$B494F7   |
	AND #$EFFE				;$B494FA   |
	STA $06A1				;$B494FD   |
	LDA $0689				;$B49500   |
	TAX					;$B49503   |
	LDA #DATA_F70056			;$B49504   |
	LDY language_select			;$B49507   |
	BEQ CODE_B4950F				;$B4950A   |
	LDA #DATA_F7FC84			;$B4950C   |
CODE_B4950F:					;	   |
	STA $065C				;$B4950F   |
	LDY #$0000				;$B49512   |
	JSR CODE_B49BE0				;$B49515   |
	BRL CODE_B49444				;$B49518  /

CODE_B4951B:
	LDA #$0001				;$B4951B  \
	STA $0654				;$B4951E   |
	JSR CODE_B4974F				;$B49521   |
	LDA #CODE_808D30			;$B49524   |
	STA NMI_pointer				;$B49527   |
	LDA #CODE_808D1F			;$B49529   |
	STA $065E				;$B4952C   |
	LDA $06A1				;$B4952F   |
	ORA #$0400				;$B49532   |
	STA $06A1				;$B49535   |
	JSR CODE_B49B47				;$B49538   |
	STZ $065C				;$B4953B   |
	BRL CODE_B49444				;$B4953E  /

CODE_B49541:
	LDX $06B1				;$B49541  \
	DEX					;$B49544   |
	STX $0666				;$B49545   |
	LDA $08F0,x				;$B49548   |
	BIT #$0001				;$B4954B   |
	BEQ CODE_B49556				;$B4954E   |
	LDY #$3E00				;$B49550   |
	JSR CODE_B49704				;$B49553   |
CODE_B49556:					;	   |
	LDX $0666				;$B49556   |
	LDA $08F0,x				;$B49559   |
	BIT #$0002				;$B4955C   |
	BEQ CODE_B49567				;$B4955F   |
	LDY #$3E80				;$B49561   |
	JSR CODE_B49704				;$B49564   |
CODE_B49567:					;	   |
	LDX $0666				;$B49567   |
	LDA $08F0,x				;$B4956A   |
	BIT #$0004				;$B4956D   |
	BEQ CODE_B49578				;$B49570   |
	LDY #$3F00				;$B49572   |
	JSR CODE_B49704				;$B49575   |
CODE_B49578:					;	   |
	RTS					;$B49578  /

CODE_B49579:
	LDY #DATA_B4C4F7			;$B49579  \
	LDA language_select			;$B4957C   |
	BEQ CODE_B49584				;$B4957F   |
	LDY #DATA_B4C80D			;$B49581   |
CODE_B49584:					;	   |
	JSR CODE_B49875				;$B49584   |
	TAX					;$B49587   |
	JSR CODE_B4ADE5				;$B49588   |
	LDA $0000,x				;$B4958B   |
	PHK					;$B4958E   |
	PLB					;$B4958F   |
	LSR A					;$B49590   |
	STA $0666				;$B49591   |
	LDY #$3E14				;$B49594   |
	LDX $06B1				;$B49597   |
	DEX					;$B4959A   |
	LDA $08D2,x				;$B4959B   |
	STA $0672				;$B4959E   |
	LDA #$0001				;$B495A1   |
	JSR CODE_B49620				;$B495A4   |
	RTS					;$B495A7  /

CODE_B495A8:
	LDX #DATA_BAD5AA			;$B495A8  \
	LDA language_select			;$B495AB   |
	BEQ CODE_B495B3				;$B495AE   |
	LDX #DATA_BAEF04			;$B495B0   |
CODE_B495B3:					;	   |
	JSR CODE_B4ADE5				;$B495B3   |
	LDA $0000,x				;$B495B6   |
	PHK					;$B495B9   |
	PLB					;$B495BA   |
	LSR A					;$B495BB   |
	STA $0666				;$B495BC   |
	LDY #$3E14				;$B495BF   |
	LDX $06B1				;$B495C2   |
	DEX					;$B495C5   |
	LDA $08E7,x				;$B495C6   |
	STA $0672				;$B495C9   |
	LDA #$0001				;$B495CC   |
	JSR CODE_B49620				;$B495CF   |
	RTS					;$B495D2  /

CODE_B495D3:
	LDA $06B1				;$B495D3  \
	DEC A					;$B495D6   |
	ASL A					;$B495D7   |
	STA $0666				;$B495D8   |
	LDX $06B1				;$B495DB   |
	DEX					;$B495DE   |
	LDA $08E0,x				;$B495DF   |
	BIT #$0001				;$B495E2   |
	BEQ CODE_B495F0				;$B495E5   |
	LDY #$3E00				;$B495E7   |
	LDX $0666				;$B495EA   |
	JSR CODE_B496BB				;$B495ED   |
CODE_B495F0:					;	   |
	LDY #DATA_B4C513			;$B495F0   |
	LDA language_select			;$B495F3   |
	BEQ CODE_B495FB				;$B495F6   |
	LDY #DATA_B4C829			;$B495F8   |
CODE_B495FB:					;	   |
	JSR CODE_B49875				;$B495FB   |
	TAX					;$B495FE   |
	JSR CODE_B4ADE5				;$B495FF   |
	LDA $0000,x				;$B49602   |
	LSR A					;$B49605   |
	PHK					;$B49606   |
	PLB					;$B49607   |
	DEC A					;$B49608   |
	STA $0666				;$B49609   |
	LDY #$3E90				;$B4960C   |
	LDX $06B1				;$B4960F   |
	DEX					;$B49612   |
	LDA $08E0,x				;$B49613   |
	STA $0672				;$B49616   |
	LDA #$0002				;$B49619   |
	JSR CODE_B49620				;$B4961C   |
	RTS					;$B4961F  /

CODE_B49620:
	STA $0660				;$B49620  \
	DEC $0666				;$B49623   |
	LDX #DATA_B49647			;$B49626   |
CODE_B49629:					;	   |
	LDA $0660				;$B49629   |
	BIT $0672				;$B4962C   |
	BEQ CODE_B49638				;$B4962F   |
	PHY					;$B49631   |
	PHX					;$B49632   |
	JSR CODE_B496C8				;$B49633   |
	PLX					;$B49636   |
	PLY					;$B49637   |
CODE_B49638:					;	   |
	ASL $0660				;$B49638   |
	TYA					;$B4963B   |
	CLC					;$B4963C   |
	ADC #$0080				;$B4963D   |
	TAY					;$B49640   |
	DEC $0666				;$B49641   |
	BNE CODE_B49629				;$B49644   |
	RTS					;$B49646  /

DATA_B49647:
	db $07 : dw DATA_B4964F : db $00, $00, $0D : dw DATA_B49657

DATA_B4964F:
	db $26, $20, $32, $20, $25, $20, $25, $20

DATA_B49657:
	db $27, $20, $32, $20, $21, $20, $34, $20
	db $35, $20, $29, $20, $34, $20

DATA_B49665:
	dw DATA_B4967B
	dw DATA_B4967B
	dw DATA_B4967B
	dw DATA_B4967B
	dw DATA_B4967B
	dw DATA_B4967B
	dw DATA_B4967B

DATA_B49673:
	db $0B : dw DATA_B49683 : db $01, $00, $0D : dw DATA_B4968F

DATA_B4967B:
	db $0D : dw DATA_B4969D : db $02, $00, $0F : dw DATA_B496AB

DATA_B49683:
	db $11, $20, $00, $20, $23, $20, $2F, $20
	db $29, $20, $2E, $20

DATA_B4968F:
	db $11, $20, $00, $20, $30, $20, $29, $20
	db $25, $20, $23, $20, $25, $20

DATA_B4969D:
	db $12, $20, $00, $20, $23, $20, $2F, $20
	db $29, $20, $2E, $20, $33, $20

DATA_B496AB:
	db $12, $20, $00, $20, $30, $20, $29, $20
	db $25, $20, $23, $20, $25, $20, $33, $20


CODE_B496BB:
	TXA					;$B496BB  \
	CLC					;$B496BC   |
	ADC #DATA_B49665			;$B496BD   |
	TAX					;$B496C0   |
	LDA $0000,x				;$B496C1   |
	TAX					;$B496C4   |
	LDY #$3E00				;$B496C5   |
CODE_B496C8:					;	   |
	LDA #$7E00				;$B496C8   |
	PHA					;$B496CB   |
	PLB					;$B496CC   |
	PLB					;$B496CD   |
CODE_B496CE:					;	   |
	LDA $0000,y				;$B496CE   |
	CMP #$200D				;$B496D1   |
	BEQ CODE_B496DA				;$B496D4   |
	INY					;$B496D6   |
	INY					;$B496D7   |
	BRA CODE_B496CE				;$B496D8  /

CODE_B496DA:
	PHK					;$B496DA  \
	PLB					;$B496DB   |
	INY					;$B496DC   |
	INY					;$B496DD   |
	INY					;$B496DE   |
	INY					;$B496DF   |
	LDA language_select			;$B496E0   |
	BEQ CODE_B496F2				;$B496E3   |
	LDA $0005,x				;$B496E5   |
	AND #$00FF				;$B496E8   |
	PHA					;$B496EB   |
	LDA $0006,x				;$B496EC   |
	TAX					;$B496EF   |
	BRA CODE_B496FD				;$B496F0  /

CODE_B496F2:
	LDA $0000,x				;$B496F2  \
	AND #$00FF				;$B496F5   |
	PHA					;$B496F8   |
	LDA $0001,x				;$B496F9   |
	TAX					;$B496FC   |
CODE_B496FD:					;	   |
	PLA					;$B496FD   |
	JSR CODE_B49726				;$B496FE   |
	PHK					;$B49701   |
	PLB					;$B49702   |
	RTS					;$B49703  /

CODE_B49704:
	LDX #DATA_B497F5			;$B49704  \
	LDA language_select			;$B49707   |
	BEQ CODE_B4970F				;$B4970A   |
	LDX #DATA_B49835			;$B4970C   |
CODE_B4970F:					;	   |
	LDA #$003F				;$B4970F   |
	PHB					;$B49712   |
	MVN $7E, $B4				;$B49713   |
	LDX #$0020				;$B49716   |
	LDA #$2000				;$B49719   |
CODE_B4971C:					;	   |
	STA $0000,y				;$B4971C   |
	INY					;$B4971F   |
	INY					;$B49720   |
	DEX					;$B49721   |
	BNE CODE_B4971C				;$B49722   |
	PLB					;$B49724   |
	RTS					;$B49725  /

CODE_B49726:
	PHB					;$B49726  \
	MVN $7E, $B4				;$B49727   |
	PLB					;$B4972A   |
	TYA					;$B4972B   |
	AND #$003F				;$B4972C   |
	SEC					;$B4972F   |
	SBC #$0040				;$B49730   |
	EOR #$FFFF				;$B49733   |
	INC A					;$B49736   |
	LSR A					;$B49737   |
	STA $0650				;$B49738   |
	LDA #$7E00				;$B4973B   |
	PHA					;$B4973E   |
	PLB					;$B4973F   |
	PLB					;$B49740   |
	LDA #$0000				;$B49741   |
CODE_B49744:					;	   |
	STA $0000,y				;$B49744   |
	INY					;$B49747   |
	INY					;$B49748   |
	DEC $0650				;$B49749   |
	BNE CODE_B49744				;$B4974C   |
	RTS					;$B4974E  /

CODE_B4974F:
	LDA $0689				;$B4974F  \
	BNE CODE_B49764				;$B49752   |
	LDY #DATA_B4C4F7			;$B49754   |
	LDX language_select			;$B49757   |
	BEQ CODE_B4975F				;$B4975A   |
	LDY #DATA_B4C80D			;$B4975C   |
CODE_B4975F:					;	   |
	JSR CODE_B49875				;$B4975F   |
	BRA CODE_B4979C				;$B49762  /

CODE_B49764:
	CMP #$0006				;$B49764  \
	BNE CODE_B49779				;$B49767   |
	LDY #DATA_B4C513			;$B49769   |
	LDX language_select			;$B4976C   |
	BEQ CODE_B4975F				;$B4976F   |
	LDY #DATA_B4C829			;$B49771   |
	JSR CODE_B49875				;$B49774   |
	BRA CODE_B4979C				;$B49777  /

CODE_B49779:
	CMP #$0004				;$B49779  \
	BNE CODE_B4978E				;$B4977C   |
	LDY #DATA_B4C521			;$B4977E   |
	LDX language_select			;$B49781   |
	BEQ CODE_B49789				;$B49784   |
	LDY #DATA_B4C837			;$B49786   |
CODE_B49789:					;	   |
	JSR CODE_B49875				;$B49789   |
	BRA CODE_B4979C				;$B4978C  /

CODE_B4978E:
	TAX					;$B4978E  \
	LDA language_select			;$B4978F   |
	BEQ CODE_B49799				;$B49792   |
	LDA DATA_B4C803,x			;$B49794   |
	BRA CODE_B4979C				;$B49797  /

CODE_B49799:
	LDA DATA_B4C4ED,x			;$B49799  \
CODE_B4979C:					;	   |
	TAX					;$B4979C   |
	JSR CODE_B4ADE5				;$B4979D   |
	LDA $0000,x				;$B497A0   |
	LSR A					;$B497A3   |
	PHK					;$B497A4   |
	PLB					;$B497A5   |
	STA $0652				;$B497A6   |
	DEC A					;$B497A9   |
	DEC A					;$B497AA   |
	STA $065A				;$B497AB   |
	JSR CODE_B4ADE5				;$B497AE   |
	LDA $0000,x				;$B497B1   |
	PHK					;$B497B4   |
	PLB					;$B497B5   |
	CMP #$0006				;$B497B6   |
	BCS CODE_B497BE				;$B497B9   |
	LDA #$0006				;$B497BB   |
CODE_B497BE:					;	   |
	TAY					;$B497BE   |
	XBA					;$B497BF   |
	LSR A					;$B497C0   |
	LSR A					;$B497C1   |
	STA $0658				;$B497C2   |
	TYA					;$B497C5   |
	INX					;$B497C6   |
	INX					;$B497C7   |
	LDY #$0000				;$B497C8   |
	JSR CODE_B4ADF6				;$B497CB   |
	LDA $0689				;$B497CE   |
	BNE CODE_B497D8				;$B497D1   |
	JSR CODE_B49579				;$B497D3   |
	BRA CODE_B497F4				;$B497D6  /

CODE_B497D8:
	CMP #$0002				;$B497D8  \
	BNE CODE_B497E2				;$B497DB   |
	JSR CODE_B495A8				;$B497DD   |
	BRA CODE_B497F4				;$B497E0  /

CODE_B497E2:
	CMP #$0004				;$B497E2  \
	BNE CODE_B497EC				;$B497E5   |
	JSR CODE_B49541				;$B497E7   |
	BRA CODE_B497F4				;$B497EA  /

CODE_B497EC:
	CMP #$0006				;$B497EC  \
	BNE CODE_B497F4				;$B497EF   |
	JSR CODE_B495D3				;$B497F1   |
CODE_B497F4:					;	   |
	RTS					;$B497F4  /

pushtable
%get_swanky_table()

DATA_B497F5:

	dw "     ** Game Complete **        "

DATA_B49835:
if !version == 0
	dw "     ** Vous avez gagne **      "
else
	dw "     ** Vous avez gagn^ **      "
endif

pulltable

CODE_B49875:
	LDA $06B1				;$B49875  \
	DEC A					;$B49878   |
	ASL A					;$B49879   |
	STY $0666				;$B4987A   |
	CLC					;$B4987D   |
	ADC $0666				;$B4987E   |
	TAY					;$B49881   |
	LDA $0000,y				;$B49882   |
	RTS					;$B49885  /

CODE_B49886:
	PHB					;$B49886  \
	PHK					;$B49887   |
	PLB					;$B49888   |
	JSL CODE_B5A919				;$B49889   |
	JSL CODE_80F320				;$B4988D   |
	JSR CODE_B4996E				;$B49891   |
	LDA $06A1				;$B49894   |
	BIT #$0400				;$B49897   |
	BNE CODE_B4989F				;$B4989A   |
	BRL CODE_B498DB				;$B4989C  /

CODE_B4989F:
	LDA $0662				;$B4989F  \
	STA PPU.vram_address			;$B498A2   |
	SEP #$20				;$B498A5   |
	LDA #$01				;$B498A7   |
	STA DMA[0].settings			;$B498A9   |
	LDA #$18				;$B498AC   |
	STA DMA[0].destination			;$B498AE   |
	LDX #$3E00				;$B498B1   |
	STX DMA[0].source			;$B498B4   |
	LDA #$7E				;$B498B7   |
	STA DMA[0].source_bank			;$B498B9   |
	LDX $0658				;$B498BC   |
	STX DMA[0].size				;$B498BF   |
	STZ DMA[0].unused_1			;$B498C2   |
	LDA #$01				;$B498C5   |
	STA CPU.enable_dma			;$B498C7   |
	REP #$20				;$B498CA   |
	LDA $06A1				;$B498CC   |
	AND #$FBFF				;$B498CF   |
	STA $06A1				;$B498D2   |
	LDA #$0001				;$B498D5   |
	JSR CODE_B4BD8D				;$B498D8   |
CODE_B498DB:					;	   |
	JSR CODE_B4BDE7				;$B498DB   |
	LDA $06A1				;$B498DE   |
	BIT #$0001				;$B498E1   |
	BEQ CODE_B498F4				;$B498E4   |
	LDA $06A1				;$B498E6   |
	AND #$EFFF				;$B498E9   |
	STA $06A1				;$B498EC   |
	LDA $065E				;$B498EF   |
	STA NMI_pointer				;$B498F2   |
CODE_B498F4:					;	   |
	JSR CODE_B49EF1				;$B498F4   |
	JSL CODE_BAC7C0				;$B498F7   |
	LDA #$03FC				;$B498FB   |
	STA $C8					;$B498FE   |
	LDX #$07A5				;$B49900   |
	JSR CODE_B4BB62				;$B49903   |
	JSL sprite_handler			;$B49906   |
	JSR CODE_B4AE85				;$B4990A   |
	PLB					;$B4990D   |
	RTL					;$B4990E  /

CODE_B4990F:
	PHB					;$B4990F  \
	PHK					;$B49910   |
	PLB					;$B49911   |
	JSL CODE_B5A919				;$B49912   |
	JSL CODE_80F320				;$B49916   |
	JSR CODE_B4996E				;$B4991A   |
	LDA $06A1				;$B4991D   |
	BIT #$1000				;$B49920   |
	BNE CODE_B49934				;$B49923   |
	LDA #$003D				;$B49925   |
	JSR CODE_B4BD8D				;$B49928   |
	LDA $06A1				;$B4992B   |
	ORA #$1000				;$B4992E   |
	STA $06A1				;$B49931   |
CODE_B49934:					;	   |
	JSR CODE_B4BE0B				;$B49934   |
	LDA $06A1				;$B49937   |
	BIT #$0001				;$B4993A   |
	BEQ CODE_B49953				;$B4993D   |
	LDA $06A1				;$B4993F   |
	AND #$EFFF				;$B49942   |
	STA $06A1				;$B49945   |
	LDA #$0001				;$B49948   |
	STA $064E				;$B4994B   |
	LDA $065E				;$B4994E   |
	STA NMI_pointer				;$B49951   |
CODE_B49953:					;	   |
	JSR CODE_B49EF1				;$B49953   |
	JSL CODE_BAC7C0				;$B49956   |
	LDA #$03FC				;$B4995A   |
	STA $C8					;$B4995D   |
	LDX #$07A5				;$B4995F   |
	JSR CODE_B4BB62				;$B49962   |
	JSL sprite_handler			;$B49965   |
	JSR CODE_B4AE85				;$B49969   |
	PLB					;$B4996C   |
	RTL					;$B4996D  /

CODE_B4996E:
	LDY $0689				;$B4996E  \
	LDX DATA_B4CD51,y			;$B49971   |
	JSR ($000E,x)				;$B49974   |
	RTS					;$B49977  /

CODE_B49978:
	PHK					;$B49978  \
	PLB					;$B49979   |
	JSL CODE_B5A919				;$B4997A   |
	JSL CODE_80F320				;$B4997E   |
	JSR CODE_B4996E				;$B49982   |
	LDA $067A				;$B49985   |
	BEQ CODE_B4998D				;$B49988   |
	JMP ($067A)				;$B4998A  /

CODE_B4998D:
	LDA $06A3				;$B4998D  \
	BIT #$0400				;$B49990   |
	BNE CODE_B499C8				;$B49993   |
	ORA #$0400				;$B49995   |
	STA $06A3				;$B49998   |
	LDA #$0000				;$B4999B   |
	STA PPU.vram_address			;$B4999E   |
	SEP #$20				;$B499A1   |
	LDA #$01				;$B499A3   |
	STA DMA[0].settings			;$B499A5   |
	LDA #$18				;$B499A8   |
	STA DMA[0].destination			;$B499AA   |
	LDX #DATA_FC14E0			;$B499AD   |
	STX DMA[0].source			;$B499B0   |
	LDA #DATA_FC14E0>>16			;$B499B3   |
	STA DMA[0].source_bank			;$B499B5   |
	LDY #$0400				;$B499B8   |
	STY DMA[0].size				;$B499BB   |
	STZ DMA[0].unused_1			;$B499BE   |
	LDA #$01				;$B499C1   |
	STA CPU.enable_dma			;$B499C3   |
	REP #$20				;$B499C6   |
CODE_B499C8:					;	   |
	LDA #$0200				;$B499C8   |
	STA DMA[0].source			;$B499CB   |
	STA DMA[0].unused_2			;$B499CE   |
	LDA #$0220				;$B499D1   |
	STA DMA[0].size				;$B499D4   |
	LDA #$0400				;$B499D7   |
	STA DMA[0].settings			;$B499DA   |
	SEP #$20				;$B499DD   |
	STZ DMA[0].source_bank			;$B499DF   |
	LDA #$01				;$B499E2   |
	STA CPU.enable_dma			;$B499E4   |
	REP #$20				;$B499E7   |
	SEP #$20				;$B499E9   |
	LDA #$0F				;$B499EB   |
	STA PPU.screen				;$B499ED   |
	REP #$20				;$B499F0   |
	LDA $06A1				;$B499F2   |
	BIT #$0800				;$B499F5   |
	BEQ CODE_B49A76				;$B499F8   |
CODE_B499FA:					;	   |
	STZ $065C				;$B499FA   |
	LDA $06BB				;$B499FD   |
	BMI CODE_B49A3D				;$B49A00   |
	LDA $0654				;$B49A02   |
	CMP $065A				;$B49A05   |
	BCC CODE_B49A48				;$B49A08   |
CODE_B49A0A:					;	   |
	SEP #$20				;$B49A0A   |
	LDA $06B6				;$B49A0C   |
	CLC					;$B49A0F   |
	ADC $06BB				;$B49A10   |
	STA $06B6				;$B49A13   |
	REP #$20				;$B49A16   |
	DEC $0650				;$B49A18   |
	BEQ CODE_B49A20				;$B49A1B   |
	BRL CODE_B49ADD				;$B49A1D  /

CODE_B49A20:
	LDA $06A1				;$B49A20  \
	AND #$F7FF				;$B49A23   |
	STA $06A1				;$B49A26   |
	LDA #$0633				;$B49A29   |
	JSL queue_sound_effect			;$B49A2C   |
	LDA $0654				;$B49A30   |
	CLC					;$B49A33   |
	ADC $06BB				;$B49A34   |
	STA $0654				;$B49A37   |
	BRL CODE_B49ADD				;$B49A3A  /

CODE_B49A3D:
	LDA $0654				;$B49A3D  \
	DEC A					;$B49A40   |
	CMP $065A				;$B49A41   |
	BCC CODE_B49A48				;$B49A44   |
	BRA CODE_B49A0A				;$B49A46  /

CODE_B49A48:
	LDA $06D6				;$B49A48  \
	CLC					;$B49A4B   |
	ADC $06BB				;$B49A4C   |
	STA $06D6				;$B49A4F   |
	DEC $0650				;$B49A52   |
	BEQ CODE_B49A5A				;$B49A55   |
	BRL CODE_B49ADD				;$B49A57  /

CODE_B49A5A:
	LDA $06A1				;$B49A5A  \
	AND #$F7FF				;$B49A5D   |
	STA $06A1				;$B49A60   |
	LDA #$0633				;$B49A63   |
	JSL queue_sound_effect			;$B49A66   |
	LDA $0654				;$B49A6A   |
	CLC					;$B49A6D   |
	ADC $06BB				;$B49A6E   |
	STA $0654				;$B49A71   |
	BRA CODE_B49ADD				;$B49A74  /

CODE_B49A76:
	LDA player_active_held			;$B49A76  \
	BIT #$0800				;$B49A79   |
	BEQ CODE_B49A9E				;$B49A7C   |
	LDA $0654				;$B49A7E   |
	CMP #$0001				;$B49A81   |
	BEQ CODE_B49ADD				;$B49A84   |
	LDA $06A1				;$B49A86   |
	ORA #$0800				;$B49A89   |
	STA $06A1				;$B49A8C   |
	LDA #$FFFF				;$B49A8F   |
	STA $06BB				;$B49A92   |
	LDA #$0010				;$B49A95   |
	STA $0650				;$B49A98   |
	BRL CODE_B499FA				;$B49A9B  /

CODE_B49A9E:
	BIT #$0400				;$B49A9E  \
	BEQ CODE_B49AC3				;$B49AA1   |
	LDA $0654				;$B49AA3   |
	CMP $0652				;$B49AA6   |
	BEQ CODE_B49ADD				;$B49AA9   |
	LDA $06A1				;$B49AAB   |
	ORA #$0800				;$B49AAE   |
	STA $06A1				;$B49AB1   |
	LDA #$0001				;$B49AB4   |
	STA $06BB				;$B49AB7   |
	LDA #$0010				;$B49ABA   |
	STA $0650				;$B49ABD   |
	BRL CODE_B499FA				;$B49AC0  /

CODE_B49AC3:
	LDA player_active_pressed		;$B49AC3  \
	BIT #$D0C0				;$B49AC6   |
	BEQ CODE_B49ADD				;$B49AC9   |
	LDA $06B5				;$B49ACB   |
	STA $0670				;$B49ACE   |
	LDA $06A3				;$B49AD1   |
	AND #$FBFF				;$B49AD4   |
	STA $06A3				;$B49AD7   |
	BRL CODE_B49C71				;$B49ADA  /

CODE_B49ADD:
	JSL CODE_BAC7C0				;$B49ADD  \
	LDA #$03FC				;$B49AE1   |
	STA $C8					;$B49AE4   |
	LDA $067A				;$B49AE6   |
	BNE CODE_B49AEE				;$B49AE9   |
	JSR CODE_B49C4D				;$B49AEB   |
CODE_B49AEE:					;	   |
	LDX #$07A5				;$B49AEE   |
	JSR CODE_B4BB62				;$B49AF1   |
	JSL sprite_handler			;$B49AF4   |
	JSR CODE_B4AE85				;$B49AF8   |
	RTL					;$B49AFB  /

CODE_B49AFC:
	PHK					;$B49AFC  \
	PLB					;$B49AFD   |
	JSL CODE_B4C175				;$B49AFE   |
	STA $0656				;$B49B02   |
	STA CPU.dividen				;$B49B05   |
	LDX $065C				;$B49B08   |
	JSR CODE_B4ADDF				;$B49B0B   |
	LDA $0000,x				;$B49B0E   |
	PHK					;$B49B11   |
	PLB					;$B49B12   |
	CMP $0656				;$B49B13   |
	BCS CODE_B49B29				;$B49B16   |
	SEP #$20				;$B49B18   |
	STA CPU.divisor				;$B49B1A   |
	LDA #$08				;$B49B1D   |
CODE_B49B1F:					;	   |
	DEC A					;$B49B1F   |
	BNE CODE_B49B1F				;$B49B20   |
	REP #$20				;$B49B22   |
	LDA CPU.multiply_result			;$B49B24   |
	BRA CODE_B49B2C				;$B49B27  /

CODE_B49B29:
	LDA $0656				;$B49B29  \
CODE_B49B2C:					;	   |
	ASL A					;$B49B2C   |
	CLC					;$B49B2D   |
	ADC $065C				;$B49B2E   |
	TAX					;$B49B31   |
	JSR CODE_B4ADDF				;$B49B32   |
	LDA $0002,x				;$B49B35   |
	PHK					;$B49B38   |
	PLB					;$B49B39   |
	TAX					;$B49B3A   |
	LDA #$0006				;$B49B3B   |
	LDY #$0800				;$B49B3E   |
	JSR CODE_B4ADEB				;$B49B41   |
	PHK					;$B49B44   |
	PLB					;$B49B45   |
	RTS					;$B49B46  /

CODE_B49B47:
	LDA #$03FC				;$B49B47  \
	STA $C8					;$B49B4A   |
	LDA #$A314				;$B49B4C   |
	STA $06B5				;$B49B4F   |
	BRL CODE_B49C4D				;$B49B52  /

CODE_B49B55:
	LDA #$03FC				;$B49B55  \
	STA $C8					;$B49B58   |
	LDA #$A314				;$B49B5A   |
	STA $06B5				;$B49B5D   |
	BRL CODE_B49C4D				;$B49B60  /

CODE_B49B63:
	PHK					;$B49B63  \
	PLB					;$B49B64   |
	JSL CODE_B5A919				;$B49B65   |
	JSL CODE_80F320				;$B49B69   |
	JSR CODE_B4996E				;$B49B6D   |
	LDA screen_brightness			;$B49B70   |
	BEQ CODE_B49BBB				;$B49B73   |
	JSL fade_screen_global			;$B49B75   |
	LDA #$0200				;$B49B79   |
	STA DMA[0].source			;$B49B7C   |
	STA DMA[0].unused_2			;$B49B7F   |
	LDA #$0220				;$B49B82   |
	STA DMA[0].size				;$B49B85   |
	LDA #$0400				;$B49B88   |
	STA DMA[0].settings			;$B49B8B   |
	SEP #$20				;$B49B8E   |
	STZ DMA[0].source_bank			;$B49B90   |
	LDA #$01				;$B49B93   |
	STA CPU.enable_dma			;$B49B95   |
	REP #$20				;$B49B98   |
	SEP #$20				;$B49B9A   |
	LDA screen_brightness			;$B49B9C   |
	STA PPU.screen				;$B49B9F   |
	REP #$20				;$B49BA2   |
	JSL CODE_BAC7C0				;$B49BA4   |
	LDA #$03FC				;$B49BA8   |
	STA $C8					;$B49BAB   |
	LDX #$07A5				;$B49BAD   |
	JSR CODE_B4BB62				;$B49BB0   |
	JSL sprite_handler			;$B49BB3   |
	JSR CODE_B4AE85				;$B49BB7   |
	RTL					;$B49BBA  /

CODE_B49BBB:
	JSR CODE_B4AED3				;$B49BBB  \
	LDA #$0040				;$B49BBE   |
	TSB $06A3				;$B49BC1   |
	STZ $06AF				;$B49BC4   |
	STZ $06AD				;$B49BC7   |
	LDA #$0001				;$B49BCA   |
	TRB file_select_action			;$B49BCD   |
	LDA #CODE_8087D9			;$B49BD0   |
	STA gamemode_pointer			;$B49BD3   |
	LDA #simple_gamemode_nmi		;$B49BD5   |
	JML set_nmi_pointer			;$B49BD8  /

CODE_B49BDC:
	JSR CODE_B4AED3				;$B49BDC  \
	RTL					;$B49BDF  /

CODE_B49BE0:
	PHK					;$B49BE0  \
	PLB					;$B49BE1   |
	PHY					;$B49BE2   |
	JSL CODE_B4C175				;$B49BE3   |
	STA $0666				;$B49BE7   |
	STA CPU.dividen				;$B49BEA   |
	LDX $065C				;$B49BED   |
	JSR CODE_B4ADDF				;$B49BF0   |
	LDA $0000,x				;$B49BF3   |
	PHK					;$B49BF6   |
	PLB					;$B49BF7   |
	CMP $0666				;$B49BF8   |
	BCS CODE_B49C0E				;$B49BFB   |
	SEP #$20				;$B49BFD   |
	STA CPU.divisor				;$B49BFF   |
	LDA #$08				;$B49C02   |
CODE_B49C04:					;	   |
	DEC A					;$B49C04   |
	BNE CODE_B49C04				;$B49C05   |
	REP #$20				;$B49C07   |
	LDA CPU.multiply_result			;$B49C09   |
	BRA CODE_B49C11				;$B49C0C  /

CODE_B49C0E:
	LDA $0666				;$B49C0E  \
CODE_B49C11:					;	   |
	ASL A					;$B49C11   |
	CLC					;$B49C12   |
	ADC $065C				;$B49C13   |
	TAX					;$B49C16   |
	JSR CODE_B4ADDF				;$B49C17   |
	LDA $0002,x				;$B49C1A   |
	PHK					;$B49C1D   |
	PLB					;$B49C1E   |
	TAX					;$B49C1F   |
	LDA #$0006				;$B49C20   |
	PLY					;$B49C23   |
	JSR CODE_B4ADEB				;$B49C24   |
	PHK					;$B49C27   |
	PLB					;$B49C28   |
	RTS					;$B49C29  /

CODE_B49C2A:
	PHB					;$B49C2A  \
	%pea_mask_dbr($7E3202)			;$B49C2B   |
	PLB					;$B49C2E   |
	PLB					;$B49C2F   |
	LDA $06AB				;$B49C30   |
	ASL A					;$B49C33   |
	ASL A					;$B49C34   |
	TAX					;$B49C35   |
	LDY $3202,x				;$B49C36   |
	LDA #$B400				;$B49C39   |
	PHA					;$B49C3C   |
	PLB					;$B49C3D   |
	PLB					;$B49C3E   |
	LDA $0000,y				;$B49C3F   |
	STA $06B5				;$B49C42   |
	LDA $0002,y				;$B49C45   |
	STA $06B7				;$B49C48   |
	PLB					;$B49C4B   |
	RTL					;$B49C4C  /

CODE_B49C4D:
	LDA $06B5				;$B49C4D  \
	STA [$C8]				;$B49C50   |
	INC $C8					;$B49C52   |
	INC $C8					;$B49C54   |
	LDA $08A4				;$B49C56   |
	ASL A					;$B49C59   |
	ORA #$3C00				;$B49C5A   |
	STA [$C8]				;$B49C5D   |
	LDA $C8					;$B49C5F   |
	SEC					;$B49C61   |
	SBC #$0006				;$B49C62   |
	STA $C8					;$B49C65   |
	LDA oam_attribute[$1E].size		;$B49C67   |
	ORA #$8000				;$B49C6A   |
	STA oam_attribute[$1E].size		;$B49C6D   |
	RTS					;$B49C70  /

CODE_B49C71:
	LDX $0689				;$B49C71  \
	CPX #$0004				;$B49C74   |
	BEQ CODE_B49CAC				;$B49C77   |
	CPX #$0006				;$B49C79   |
	BEQ CODE_B49C89				;$B49C7C   |
CODE_B49C7E:					;	   |
	JSR (DATA_B49DE0,x)			;$B49C7E   |
	BCC CODE_B49CB4				;$B49C81   |
	JSR CODE_B4A1D4				;$B49C83   |
	BRL CODE_B49D4F				;$B49C86  /

CODE_B49C89:
	LDA $0654				;$B49C89  \
	DEC A					;$B49C8C   |
	BNE CODE_B49C7E				;$B49C8D   |
	JSR (DATA_B49DE0,x)			;$B49C8F   |
	BCC CODE_B49CB4				;$B49C92   |
	LDA $06B1				;$B49C94   |
	DEC A					;$B49C97   |
	ASL A					;$B49C98   |
	TAY					;$B49C99   |
	LDX DATA_B49665,y			;$B49C9A   |
	JSR CODE_B4A1D4				;$B49C9D   |
	SEC					;$B49CA0   |
	SBC $0003,x				;$B49CA1   |
	BMI CODE_B49CA9				;$B49CA4   |
	BRL CODE_B49D4F				;$B49CA6  /

CODE_B49CA9:
	BRL CODE_B49CF7				;$B49CA9  /

CODE_B49CAC:
	JSR (DATA_B49DE0,x)			;$B49CAC  \
	BCC CODE_B49CB4				;$B49CAF   |
	BRL CODE_B49D40				;$B49CB1  /

CODE_B49CB4:
	LDA $0689				;$B49CB4  \
	BNE CODE_B49CC1				;$B49CB7   |
	LDY #DATA_B4CB23			;$B49CB9   |
	JSR CODE_B49875				;$B49CBC   |
	BRA CODE_B49CE1				;$B49CBF  /

CODE_B49CC1:
	CMP #$0006				;$B49CC1  \
	BNE CODE_B49CCE				;$B49CC4   |
	LDY #DATA_B4CBE5			;$B49CC6   |
	JSR CODE_B49875				;$B49CC9   |
	BRA CODE_B49CE1				;$B49CCC  /

CODE_B49CCE:
	CMP #$0004				;$B49CCE  \
	BNE CODE_B49CDB				;$B49CD1   |
	LDY #DATA_B4CBA3			;$B49CD3   |
	JSR CODE_B49875				;$B49CD6   |
	BRA CODE_B49CE1				;$B49CD9  /

CODE_B49CDB:
	LDX $0689				;$B49CDB  \
	LDA DATA_B4CB19,x			;$B49CDE   |
CODE_B49CE1:					;	   |
	STA $0666				;$B49CE1   |
	LDA $0654				;$B49CE4   |
	DEC A					;$B49CE7   |
	ASL A					;$B49CE8   |
	CLC					;$B49CE9   |
	ADC $0666				;$B49CEA   |
	TAX					;$B49CED   |
	JSR CODE_B4A1D4				;$B49CEE   |
	SEC					;$B49CF1   |
	SBC $0000,x				;$B49CF2   |
	BPL CODE_B49D4F				;$B49CF5   |
CODE_B49CF7:					;	   |
	LDA $065C				;$B49CF7   |
if !version == 1				;	   |
	AND #$00FF				;$B49CFA   |
endif						;	   |
	CMP #$0000				;$B49CFD   |
	BNE CODE_B49D3D				;$B49D00   |
	LDA #CODE_808D70			;$B49D02   |
	STA NMI_pointer				;$B49D05   |
	LDA #CODE_808D5F			;$B49D07   |
	STA $065E				;$B49D0A   |
	LDA $0689				;$B49D0D   |
	TAX					;$B49D10   |
	LDA DATA_B4C547,x			;$B49D11   |
	LDY language_select			;$B49D14   |
	BEQ CODE_B49D1C				;$B49D17   |
	LDA DATA_B4C85D,x			;$B49D19   |
CODE_B49D1C:					;	   |
	STA $065C				;$B49D1C   |
	JSR CODE_B49AFC				;$B49D1F   |
	LDA #$065F				;$B49D22   |
	JSL queue_sound_effect			;$B49D25   |
	LDA $06A1				;$B49D29   |
	AND #$FDFF				;$B49D2C   |
	STA $06A1				;$B49D2F   |
	LDA #$0001				;$B49D32   |
	STA $064E				;$B49D35   |
	STZ $065C				;$B49D38   |
	BRA CODE_B49D40				;$B49D3B  /

CODE_B49D3D:
	INC $065C				;$B49D3D  \
CODE_B49D40:					;	   |
	JSL CODE_BAC7C0				;$B49D40   |
	LDA #$03FC				;$B49D44   |
	STA $C8					;$B49D47   |
	JSR CODE_B49C4D				;$B49D49   |
	BRL CODE_B49AEE				;$B49D4C  /

CODE_B49D4F:
	PHA					;$B49D4F  \
	LDA #$0634				;$B49D50   |
	JSL queue_sound_effect			;$B49D53   |
	PLA					;$B49D57   |
	TAY					;$B49D58   |
	SEP #$10				;$B49D59   |
	LDA $0689				;$B49D5B   |
	CMP #$0008				;$B49D5E   |
	BNE CODE_B49D68				;$B49D61   |
	STY $08CC				;$B49D63   |
	BRA CODE_B49D6B				;$B49D66  /

CODE_B49D68:
	STY $08CA				;$B49D68  \
CODE_B49D6B:					;	   |
	REP #$10				;$B49D6B   |
	LDA #CODE_B49E48			;$B49D6D   |
	STA $067A				;$B49D70   |
	LDA #DATA_FC14E0			;$B49D73   |
	STA $0699				;$B49D76   |
	LDA #$0001				;$B49D79   |
	STA $0650				;$B49D7C   |
	LDA #$065F				;$B49D7F   |
	LDA $0689				;$B49D82   |
	BNE CODE_B49D8C				;$B49D85   |
	LDX #$08D2				;$B49D87   |
	BRA CODE_B49D9E				;$B49D8A  /

CODE_B49D8C:
	CMP #$0002				;$B49D8C  \
	BNE CODE_B49D96				;$B49D8F   |
	LDX #$08E7				;$B49D91   |
	BRA CODE_B49D9E				;$B49D94  /

CODE_B49D96:
	CMP #$0006				;$B49D96  \
	BNE CODE_B49DDD				;$B49D99   |
	LDX #$08E0				;$B49D9B   |
CODE_B49D9E:					;	   |
	STX $0666				;$B49D9E   |
	LDA $06B1				;$B49DA1   |
	DEC A					;$B49DA4   |
	CLC					;$B49DA5   |
	ADC $0666				;$B49DA6   |
	TAX					;$B49DA9   |
	JSR CODE_B49E3A				;$B49DAA   |
	SEP #$20				;$B49DAD   |
	LDA $00,x				;$B49DAF   |
	ORA $0666				;$B49DB1   |
	STA $00,x				;$B49DB4   |
	REP #$20				;$B49DB6   |
	LDA $0689				;$B49DB8   |
	BNE CODE_B49DDD				;$B49DBB   |
	LDA $06B1				;$B49DBD   |
	CMP #$000A				;$B49DC0   |
	BCC CODE_B49DDD				;$B49DC3   |
	SEP #$20				;$B49DC5   |
	LDA $00,x				;$B49DC7   |
	ORA $0666				;$B49DC9   |
	STA $08DB				;$B49DCC   |
	STA $08DC				;$B49DCF   |
	STA $08DD				;$B49DD2   |
	STA $08DE				;$B49DD5   |
	STA $08DF				;$B49DD8   |
	REP #$20				;$B49DDB   |
CODE_B49DDD:					;	   |
	BRL CODE_B49D40				;$B49DDD  /

DATA_B49DE0:
	dw CODE_B49DEA
	dw CODE_B49E14
	dw CODE_B49DFE
	dw CODE_B49E26
	dw CODE_B49E12

CODE_B49DEA:
	JSR CODE_B49E3A				;$B49DEA  \
	LDA $06B1				;$B49DED   |
	DEC A					;$B49DF0   |
	TAX					;$B49DF1   |
	LDA $08D2,x				;$B49DF2   |
	BIT $0666				;$B49DF5   |
	BEQ CODE_B49DFC				;$B49DF8   |
	SEC					;$B49DFA   |
	RTS					;$B49DFB  /

CODE_B49DFC:
	CLC					;$B49DFC  \
	RTS					;$B49DFD  /

CODE_B49DFE:
	JSR CODE_B49E3A				;$B49DFE  \
	LDA $06B1				;$B49E01   |
	DEC A					;$B49E04   |
	TAX					;$B49E05   |
	LDA $08F0,x				;$B49E06   |
	BIT $0666				;$B49E09   |
	BEQ CODE_B49E10				;$B49E0C   |
	SEC					;$B49E0E   |
	RTS					;$B49E0F  /

CODE_B49E10:
	CLC					;$B49E10  \
	RTS					;$B49E11  /

CODE_B49E12:
	CLC					;$B49E12  \
	RTS					;$B49E13  /

CODE_B49E14:
	JSR CODE_B49E3A				;$B49E14  \
	LDA $06B1				;$B49E17   |
	DEC A					;$B49E1A   |
	TAX					;$B49E1B   |
	LDA $08E7,x				;$B49E1C   |
	BIT $0666				;$B49E1F   |
	BEQ CODE_B49E12				;$B49E22   |
	SEC					;$B49E24   |
	RTS					;$B49E25  /

CODE_B49E26:
	JSR CODE_B49E3A				;$B49E26  \
	LDA $06B1				;$B49E29   |
	DEC A					;$B49E2C   |
	TAX					;$B49E2D   |
	LDA $08E0,x				;$B49E2E   |
	BIT $0666				;$B49E31   |
	BEQ CODE_B49E38				;$B49E34   |
	SEC					;$B49E36   |
	RTS					;$B49E37  /

CODE_B49E38:
	CLC					;$B49E38  \
	RTS					;$B49E39  /

CODE_B49E3A:
	STZ $0666				;$B49E3A  \
	LDA $0654				;$B49E3D   |
	SEC					;$B49E40   |
CODE_B49E41:					;	   |
	ROL $0666				;$B49E41   |
	DEC A					;$B49E44   |
	BNE CODE_B49E41				;$B49E45   |
	RTS					;$B49E47  /

CODE_B49E48:
	DEC $0650				;$B49E48  \
	BNE CODE_B49E9E				;$B49E4B   |
	LDA #$0002				;$B49E4D   |
	STA $0650				;$B49E50   |
	LDA #$0000				;$B49E53   |
	STA PPU.vram_address			;$B49E56   |
	SEP #$20				;$B49E59   |
	LDA #$01				;$B49E5B   |
	STA DMA[0].settings			;$B49E5D   |
	LDA #$18				;$B49E60   |
	STA DMA[0].destination			;$B49E62   |
	LDX $0699				;$B49E65   |
	STX DMA[0].source			;$B49E68   |
	LDA #$FC				;$B49E6B   |
	STA DMA[0].source_bank			;$B49E6D   |
	LDY #$0400				;$B49E70   |
	STY DMA[0].size				;$B49E73   |
	STZ DMA[0].unused_1			;$B49E76   |
	LDA #$01				;$B49E79   |
	STA CPU.enable_dma			;$B49E7B   |
	REP #$20				;$B49E7E   |
	TXA					;$B49E80   |
	CLC					;$B49E81   |
	ADC #$0400				;$B49E82   |
	CMP #DATA_FC54E0			;$B49E85   |
	BNE CODE_B49E9B				;$B49E88   |
	STZ $0699				;$B49E8A   |
	LDA #CODE_808D70			;$B49E8D   |
	STA NMI_pointer				;$B49E90   |
	LDA #CODE_808D3D			;$B49E92   |
	STA $065E				;$B49E95   |
	BRL CODE_B49EBF				;$B49E98  /

CODE_B49E9B:
	STA $0699				;$B49E9B  \
CODE_B49E9E:					;	   |
	LDA #$0200				;$B49E9E   |
	STA DMA[0].source			;$B49EA1   |
	STA DMA[0].unused_2			;$B49EA4   |
	LDA #$0220				;$B49EA7   |
	STA DMA[0].size				;$B49EAA   |
	LDA #$0400				;$B49EAD   |
	STA DMA[0].settings			;$B49EB0   |
	SEP #$20				;$B49EB3   |
	STZ DMA[0].source_bank			;$B49EB5   |
	LDA #$01				;$B49EB8   |
	STA CPU.enable_dma			;$B49EBA   |
	REP #$20				;$B49EBD   |
CODE_B49EBF:					;	   |
	SEP #$20				;$B49EBF   |
	LDA #$0F				;$B49EC1   |
	STA PPU.screen				;$B49EC3   |
	REP #$20				;$B49EC6   |
	JSL CODE_BAC7C0				;$B49EC8   |
	LDA #$03FC				;$B49ECC   |
	STA $C8					;$B49ECF   |
	JSR CODE_B49C4D				;$B49ED1   |
	BRL CODE_B49AEE				;$B49ED4  /

CODE_B49ED7:
	PHK					;$B49ED7  \
	PLB					;$B49ED8   |
	JSL CODE_B5A919				;$B49ED9   |
	JSL CODE_80F320				;$B49EDD   |
	JSR CODE_B4996E				;$B49EE1   |
	JSR CODE_B49EF1				;$B49EE4   |
	LDX #$079C				;$B49EE7   |
	JSR ($0000,x)				;$B49EEA   |
	JSR CODE_B4A815				;$B49EED   |
	RTL					;$B49EF0  /

CODE_B49EF1:
	LDA #$0200				;$B49EF1  \
	STA DMA[0].source			;$B49EF4   |
	STA DMA[0].unused_2			;$B49EF7   |
	LDA #$0220				;$B49EFA   |
	STA DMA[0].size				;$B49EFD   |
	LDA #$0400				;$B49F00   |
	STA DMA[0].settings			;$B49F03   |
	SEP #$20				;$B49F06   |
	STZ DMA[0].source_bank			;$B49F08   |
	LDA #$01				;$B49F0B   |
	STA CPU.enable_dma			;$B49F0D   |
	REP #$20				;$B49F10   |
	SEP #$20				;$B49F12   |
	LDA screen_brightness			;$B49F14   |
	STA PPU.screen				;$B49F17   |
	REP #$20				;$B49F1A   |
	RTS					;$B49F1C  /

CODE_B49F1D:
	PHK					;$B49F1D  \
	PLB					;$B49F1E   |
	JSL CODE_B5A919				;$B49F1F   |
	JSL CODE_80F320				;$B49F23   |
	JSR CODE_B4996E				;$B49F27   |
	JSR CODE_B49EF1				;$B49F2A   |
	LDA $0689				;$B49F2D   |
	BNE CODE_B49F3A				;$B49F30   |
	LDY #DATA_B4CC57			;$B49F32   |
	JSR CODE_B49875				;$B49F35   |
	BRA CODE_B49F4D				;$B49F38  /

CODE_B49F3A:
	CMP #$0006				;$B49F3A  \
	BNE CODE_B49F47				;$B49F3D   |
	LDY #DATA_B4CCDF			;$B49F3F   |
	JSR CODE_B49875				;$B49F42   |
	BRA CODE_B49F4D				;$B49F45  /

CODE_B49F47:
	LDX $0689				;$B49F47  \
	LDA DATA_B4CC4D,x			;$B49F4A   |
CODE_B49F4D:					;	   |
	STA $0666				;$B49F4D   |
	LDA $0654				;$B49F50   |
	DEC A					;$B49F53   |
	ASL A					;$B49F54   |
	CLC					;$B49F55   |
	ADC $0666				;$B49F56   |
	TAX					;$B49F59   |
	JSR ($0000,x)				;$B49F5A   |
	JSR CODE_B4A815				;$B49F5D   |
	RTL					;$B49F60  /

CODE_B49F61:
	LDX $0593				;$B49F61  \
	JSR CODE_B4A830				;$B49F64   |
	LDX $0597				;$B49F67   |
	JSR CODE_B4A830				;$B49F6A   |
	LDA #CODE_B4A00D			;$B49F6D   |
	STA $079C				;$B49F70   |
	LDA #CODE_808D4E			;$B49F73   |
	STA NMI_pointer				;$B49F76   |
	JSR CODE_B49FFD				;$B49F78   |
	LDA $08FA				;$B49F7B   |
	ORA $0666				;$B49F7E   |
	STA $08FA				;$B49F81   |
	LDA $06B1				;$B49F84   |
	STA $0900				;$B49F87   |
	LDA $06AB				;$B49F8A   |
	CMP #$0012				;$B49F8D   |
	BNE CODE_B49F9D				;$B49F90   |
	LDA #$000A				;$B49F92   |
	STA $06B1				;$B49F95   |
	LDA #$005E				;$B49F98   |
	BRA CODE_B49FD6				;$B49F9B  /

CODE_B49F9D:
	CMP #$001F				;$B49F9D  \
	BNE CODE_B49FAD				;$B49FA0   |
	LDA #$000B				;$B49FA2   |
	STA $06B1				;$B49FA5   |
	LDA #$0062				;$B49FA8   |
	BRA CODE_B49FD6				;$B49FAB  /

CODE_B49FAD:
	CMP #$0047				;$B49FAD  \
	BNE CODE_B49FBD				;$B49FB0   |
	LDA #$000C				;$B49FB2   |
	STA $06B1				;$B49FB5   |
	LDA #$0066				;$B49FB8   |
	BRA CODE_B49FD6				;$B49FBB  /

CODE_B49FBD:
	CMP #$002F				;$B49FBD  \
	BNE CODE_B49FCD				;$B49FC0   |
	LDA #$000D				;$B49FC2   |
	STA $06B1				;$B49FC5   |
	LDA #$006A				;$B49FC8   |
	BRA CODE_B49FD6				;$B49FCB  /

CODE_B49FCD:
	LDA #$000E				;$B49FCD  \
	STA $06B1				;$B49FD0   |
	LDA #$006E				;$B49FD3   |
CODE_B49FD6:					;	   |
	STA $06AB				;$B49FD6   |
	LDA $06A1				;$B49FD9   |
	AND #$FDFF				;$B49FDC   |
	STA $06A1				;$B49FDF   |
	LDA #$0001				;$B49FE2   |
	STA $064E				;$B49FE5   |
	LDX #$01D4				;$B49FE8   |
	LDA language_select			;$B49FEB   |
	BEQ CODE_B49FF3				;$B49FEE   |
	LDX #DATA_F7FDC2			;$B49FF0   |
CODE_B49FF3:					;	   |
	STX $065C				;$B49FF3   |
	LDY #$0C00				;$B49FF6   |
	JSR CODE_B49BE0				;$B49FF9   |
	RTS					;$B49FFC  /

CODE_B49FFD:
	LDA #$0001				;$B49FFD  \
	STA $0666				;$B4A000   |
	LDA $06B1				;$B4A003   |
CODE_B4A006:					;	   |
	ASL $0666				;$B4A006   |
	DEC A					;$B4A009   |
	BNE CODE_B4A006				;$B4A00A   |
	RTS					;$B4A00C  /

CODE_B4A00D:
	JSR CODE_B4A1E6				;$B4A00D  \
	JSR CODE_B4A0FD				;$B4A010   |
	JSR CODE_B4A051				;$B4A013   |
	LDX $0597				;$B4A016   |
	LDA $42,x				;$B4A019   |
	BNE CODE_B4A02C				;$B4A01B   |
	JSR CODE_B4A06E				;$B4A01D   |
	LDX $0593				;$B4A020   |
	JSR CODE_B4A06E				;$B4A023   |
	LDA #CODE_B4A02D			;$B4A026   |
	STA $079C				;$B4A029   |
CODE_B4A02C:					;	   |
	RTS					;$B4A02C  /

CODE_B4A02D:
	JSR CODE_B4A0FD				;$B4A02D  \
	JSR CODE_B4A051				;$B4A030   |
	LDX $0597				;$B4A033   |
	LDA $42,x				;$B4A036   |
	CMP #$0005				;$B4A038   |
	BNE CODE_B4A050				;$B4A03B   |
	LDA #CODE_B4A088			;$B4A03D   |
	STA $079C				;$B4A040   |
	LDY #$018E				;$B4A043   |
	JSL CODE_BB842C				;$B4A046   |
	LDA #$003C				;$B4A04A   |
	STA $064E				;$B4A04D   |
CODE_B4A050:					;	   |
	RTS					;$B4A050  /

CODE_B4A051:
	LDA player_active_pressed		;$B4A051  \
	BIT #$F0C0				;$B4A054   |
	BEQ CODE_B4A06D				;$B4A057   |
	LDA screen_brightness			;$B4A059   |
	CMP #$000F				;$B4A05C   |
	BNE CODE_B4A06D				;$B4A05F   |
	LDA #CODE_808D7D			;$B4A061   |
	STA NMI_pointer				;$B4A064   |
	LDA #$810F				;$B4A066   |
	JSL set_fade_global			;$B4A069   |
CODE_B4A06D:					;	   |
	RTS					;$B4A06D  /

CODE_B4A06E:
	LDA #$0003				;$B4A06E  \
	STA $42,x				;$B4A071   |
	LDA #$00C8				;$B4A073   |
	STA $44,x				;$B4A076   |
	LDA #$0180				;$B4A078   |
	STA $46,x				;$B4A07B   |
	LDA #$F600				;$B4A07D   |
	STA $48,x				;$B4A080   |
	LDA #$0058				;$B4A082   |
	STA $4A,x				;$B4A085   |
	RTS					;$B4A087  /

CODE_B4A088:
	JSR CODE_B4A0FD				;$B4A088  \
	JSR CODE_B4A051				;$B4A08B   |
	DEC $064E				;$B4A08E   |
	BNE CODE_B4A0A7				;$B4A091   |
	LDA screen_brightness			;$B4A093   |
	CMP #$000F				;$B4A096   |
	BNE CODE_B4A0A7				;$B4A099   |
	LDA #$810F				;$B4A09B   |
	JSL set_fade_global			;$B4A09E   |
	LDA #CODE_808D7D			;$B4A0A2   |
	STA NMI_pointer				;$B4A0A5   |
CODE_B4A0A7:					;	   |
	RTS					;$B4A0A7  /

CODE_B4A0A8:
	LDA #DATA_B4C795			;$B4A0A8  \
	LDY language_select			;$B4A0AB   |
	BEQ CODE_B4A0C0				;$B4A0AE   |
	LDA #DATA_B4CAAB			;$B4A0B0   |
	BRA CODE_B4A0C0				;$B4A0B3  /

CODE_B4A0B5:
	LDA #DATA_B4C741			;$B4A0B5  \
	LDY language_select			;$B4A0B8   |
	BEQ CODE_B4A0C0				;$B4A0BB   |
	LDA #DATA_B4CA57			;$B4A0BD   |
CODE_B4A0C0:					;	   |
	STA $0666				;$B4A0C0   |
	LDA $06B1				;$B4A0C3   |
	DEC A					;$B4A0C6   |
	ASL A					;$B4A0C7   |
	ADC $0666				;$B4A0C8   |
	TAX					;$B4A0CB   |
	LDY $0000,x				;$B4A0CC   |
	STY $0666				;$B4A0CF   |
	LDA $0654				;$B4A0D2   |
	DEC A					;$B4A0D5   |
	ASL A					;$B4A0D6   |
	CLC					;$B4A0D7   |
	ADC $0666				;$B4A0D8   |
	TAY					;$B4A0DB   |
	LDX $0000,y				;$B4A0DC   |
	LDA #$0006				;$B4A0DF   |
	LDY #$0800				;$B4A0E2   |
	JSR CODE_B4ADEB				;$B4A0E5   |
	LDA #CODE_B4A135			;$B4A0E8   |
	STA $079C				;$B4A0EB   |
	LDA #CODE_808D4E			;$B4A0EE   |
	STA NMI_pointer				;$B4A0F1   |
	LDA #$0001				;$B4A0F3   |
	STA $064E				;$B4A0F6   |
	JSR CODE_B4974F				;$B4A0F9   |
	RTS					;$B4A0FC  /

CODE_B4A0FD:
	PHX					;$B4A0FD  \
	SEP #$20				;$B4A0FE   |
	LDA #$00				;$B4A100   |
	LDX $0689				;$B4A102   |
	CPX #$0002				;$B4A105   |
	BNE CODE_B4A10C				;$B4A108   |
	LDA #$00				;$B4A10A   |
CODE_B4A10C:					;	   |
	STA CPU.enable_hdma			;$B4A10C   |
	REP #$20				;$B4A10F   |
	PLX					;$B4A111   |
	SEP #$20				;$B4A112   |
	LDA #$FF				;$B4A114   |
	STA PPU.layer_3_scroll_y		;$B4A116   |
	STA PPU.layer_3_scroll_y		;$B4A119   |
	REP #$20				;$B4A11C   |
	RTS					;$B4A11E  /

CODE_B4A11F:
	PHX					;$B4A11F  \
	SEP #$20				;$B4A120   |
	LDA #$02				;$B4A122   |
	LDX $0689				;$B4A124   |
	CPX #$0002				;$B4A127   |
	BNE CODE_B4A12E				;$B4A12A   |
	LDA #$02				;$B4A12C   |
CODE_B4A12E:					;	   |
	STA CPU.enable_hdma			;$B4A12E   |
	REP #$20				;$B4A131   |
	PLX					;$B4A133   |
	RTS					;$B4A134  /

CODE_B4A135:
	JSR CODE_B4A0FD				;$B4A135  \
	DEC $064E				;$B4A138   |
	BEQ CODE_B4A140				;$B4A13B   |
	BRL CODE_B4A1D0				;$B4A13D  /

CODE_B4A140:
	LDA $06A1				;$B4A140  \
	BIT #$0200				;$B4A143   |
	BEQ CODE_B4A1A7				;$B4A146   |
	LDA $06A1				;$B4A148   |
	BIT #$1000				;$B4A14B   |
	BNE CODE_B4A170				;$B4A14E   |
	JSR CODE_B4BDE7				;$B4A150   |
	INC $064E				;$B4A153   |
	LDA $06A1				;$B4A156   |
	BIT #$0001				;$B4A159   |
	BEQ CODE_B4A1A4				;$B4A15C   |
	ORA #$1000				;$B4A15E   |
	AND #$FFFE				;$B4A161   |
	STA $06A1				;$B4A164   |
	LDA #$FFFF				;$B4A167   |
	STA $064E				;$B4A16A   |
	BRL CODE_B4A1D0				;$B4A16D  /

CODE_B4A170:
	JSR CODE_B4BE0B				;$B4A170  \
	INC $064E				;$B4A173   |
	LDA $06A1				;$B4A176   |
	BIT #$0001				;$B4A179   |
	BEQ CODE_B4A1A4				;$B4A17C   |
	LDA $06A1				;$B4A17E   |
	AND #$FDFF				;$B4A181   |
	STA $06A1				;$B4A184   |
	JSR CODE_B4A11F				;$B4A187   |
	LDA #CODE_808D30			;$B4A18A   |
	STA NMI_pointer				;$B4A18D   |
	LDA #CODE_808D1F			;$B4A18F   |
	STA $065E				;$B4A192   |
	STZ $067A				;$B4A195   |
	LDA $06A1				;$B4A198   |
	ORA #$0400				;$B4A19B   |
	STA $06A1				;$B4A19E   |
	BRL CODE_B4A1D3				;$B4A1A1  /

CODE_B4A1A4:
	BRL CODE_B4A1D0				;$B4A1A4  /

CODE_B4A1A7:
	JSR CODE_B4A7E7				;$B4A1A7  \
	JSR CODE_B4A0FD				;$B4A1AA   |
	PHK					;$B4A1AD   |
	PLB					;$B4A1AE   |
	JSR CODE_B4A1D4				;$B4A1AF   |
	LDX #$07A5				;$B4A1B2   |
	JSR CODE_B4BD57				;$B4A1B5   |
	LDA $06A1				;$B4A1B8   |
	ORA #$0200				;$B4A1BB   |
	AND #$EFFF				;$B4A1BE   |
	STA $06A1				;$B4A1C1   |
	LDA #$0001				;$B4A1C4   |
	STA $064E				;$B4A1C7   |
	LDA #$0001				;$B4A1CA   |
	JSR CODE_B4BD95				;$B4A1CD   |
CODE_B4A1D0:					;	   |
	JSR CODE_B4A7D8				;$B4A1D0   |
CODE_B4A1D3:					;	   |
	RTS					;$B4A1D3  /

CODE_B4A1D4:
	LDY $0689				;$B4A1D4  \
	LDA $08CA				;$B4A1D7   |
	CPY #$0008				;$B4A1DA   |
	BNE CODE_B4A1E2				;$B4A1DD   |
	LDA $08CC				;$B4A1DF   |
CODE_B4A1E2:					;	   |
	AND #$00FF				;$B4A1E2   |
	RTS					;$B4A1E5  /

CODE_B4A1E6:
	LDA $064E				;$B4A1E6  \
	BEQ CODE_B4A1F0				;$B4A1E9   |
	DEC $064E				;$B4A1EB   |
	BEQ CODE_B4A1F3				;$B4A1EE   |
CODE_B4A1F0:					;	   |
	BRL CODE_B4A26E				;$B4A1F0  /

CODE_B4A1F3:
	LDA $06A1				;$B4A1F3  \
	BIT #$0200				;$B4A1F6   |
	BEQ CODE_B4A21B				;$B4A1F9   |
	JSR CODE_B4BDE7				;$B4A1FB   |
	INC $064E				;$B4A1FE   |
	LDA $06A1				;$B4A201   |
	BIT #$0001				;$B4A204   |
	BEQ CODE_B4A256				;$B4A207   |
	ORA #$1000				;$B4A209   |
	AND #$FFFE				;$B4A20C   |
	STA $06A1				;$B4A20F   |
	LDA #$012C				;$B4A212   |
	STA $064E				;$B4A215   |
	BRL CODE_B4A26E				;$B4A218  /

CODE_B4A21B:
	LDA $0664				;$B4A21B  \
	STA PPU.vram_address			;$B4A21E   |
	SEP #$20				;$B4A221   |
	LDA #$01				;$B4A223   |
	STA DMA[0].settings			;$B4A225   |
	LDA #$18				;$B4A228   |
	STA DMA[0].destination			;$B4A22A   |
	LDX #$4A00				;$B4A22D   |
	STX DMA[0].source			;$B4A230   |
	LDA #$7E				;$B4A233   |
	STA DMA[0].source_bank			;$B4A235   |
	LDX #$0180				;$B4A238   |
	STX DMA[0].size				;$B4A23B   |
	STZ DMA[0].unused_1			;$B4A23E   |
	LDA #$01				;$B4A241   |
	STA CPU.enable_dma			;$B4A243   |
	REP #$20				;$B4A246   |
	JSR CODE_B4A0FD				;$B4A248   |
	PHK					;$B4A24B   |
	PLB					;$B4A24C   |
	JSR CODE_B4A1D4				;$B4A24D   |
	LDX #$07A5				;$B4A250   |
	JSR CODE_B4BD57				;$B4A253   |
CODE_B4A256:					;	   |
	LDA $06A1				;$B4A256   |
	ORA #$0200				;$B4A259   |
	AND #$EFFF				;$B4A25C   |
	STA $06A1				;$B4A25F   |
	LDA #$0001				;$B4A262   |
	STA $064E				;$B4A265   |
	LDA #$0001				;$B4A268   |
	JSR CODE_B4BD95				;$B4A26B   |
CODE_B4A26E:					;	   |
	RTS					;$B4A26E  /

CODE_B4A26F:
	LDA #$0001				;$B4A26F  \
	STA file_select_action			;$B4A272   |
	LDA #CODE_B4A288			;$B4A275   |
	STA $079C				;$B4A278   |
	LDA #CODE_808D4E			;$B4A27B   |
	STA NMI_pointer				;$B4A27E   |
	LDA #$810F				;$B4A280   |
	JSL set_fade_global			;$B4A283   |
	RTS					;$B4A287  /

CODE_B4A288:
	JSL fade_screen_global			;$B4A288  \
	LDA screen_brightness			;$B4A28C   |
	BEQ CODE_B4A292				;$B4A28F   |
	RTS					;$B4A291  /

CODE_B4A292:
	JSL disable_screen			;$B4A292  \
	JSL CODE_BBC5F4				;$B4A296   |
	LDA #$0001				;$B4A29A   |
	STA file_select_action			;$B4A29D   |
	JML init_file_select			;$B4A2A0  /

CODE_B4A2A4:
	JSL fade_screen_global			;$B4A2A4  \
	LDA screen_brightness			;$B4A2A8   |
	CMP #$000F				;$B4A2AB   |
	BNE CODE_B4A2BB				;$B4A2AE   |
	LDA #CODE_808D30			;$B4A2B0   |
	STA NMI_pointer				;$B4A2B3   |
	LDA #CODE_808D1F			;$B4A2B5   |
	STA $065E				;$B4A2B8   |
CODE_B4A2BB:					;	   |
	RTS					;$B4A2BB  /

CODE_B4A2BC:
	LDX $0593				;$B4A2BC  \
	JSR CODE_B4A303				;$B4A2BF   |
	LDX $0597				;$B4A2C2   |
	JSR CODE_B4A303				;$B4A2C5   |
	LDA #CODE_808D4E			;$B4A2C8   |
	STA NMI_pointer				;$B4A2CB   |
	LDA #CODE_B4A313			;$B4A2CD   |
	STA $079C				;$B4A2D0   |
	LDA $06A3				;$B4A2D3   |
	ORA #$1000				;$B4A2D6   |
	STA $06A3				;$B4A2D9   |
	STZ $06B1				;$B4A2DC   |
	LDA #$0001				;$B4A2DF   |
	STA $064E				;$B4A2E2   |
	LDA $06A1				;$B4A2E5   |
	AND #$FDFF				;$B4A2E8   |
	STA $06A1				;$B4A2EB   |
	LDA #DATA_F70168			;$B4A2EE   |
	LDY language_select			;$B4A2F1   |
	BEQ CODE_B4A2F9				;$B4A2F4   |
	LDA #DATA_F7FD6E			;$B4A2F6   |
CODE_B4A2F9:					;	   |
	STA $065C				;$B4A2F9   |
	LDY #$0C00				;$B4A2FC   |
	JSR CODE_B49BE0				;$B4A2FF   |
	RTS					;$B4A302  /

CODE_B4A303:
	LDA #$0001				;$B4A303  \
	STA $42,x				;$B4A306   |
	LDA #$0050				;$B4A308   |
	STA $44,x				;$B4A30B   |
	LDA #$0180				;$B4A30D   |
	STA $46,x				;$B4A310   |
	RTS					;$B4A312  /

CODE_B4A313:
	JSR CODE_B4A1E6				;$B4A313  \
	JSR CODE_B4A0FD				;$B4A316   |
	JSR CODE_B4A051				;$B4A319   |
	LDX $0597				;$B4A31C   |
	LDA $42,x				;$B4A31F   |
	BNE CODE_B4A332				;$B4A321   |
	JSR CODE_B4A357				;$B4A323   |
	LDX $0593				;$B4A326   |
	JSR CODE_B4A357				;$B4A329   |
	LDA #CODE_B4A333			;$B4A32C   |
	STA $079C				;$B4A32F   |
CODE_B4A332:					;	   |
	RTS					;$B4A332  /

CODE_B4A333:
	JSR CODE_B4A0FD				;$B4A333  \
	JSR CODE_B4A051				;$B4A336   |
	LDX $0597				;$B4A339   |
	LDA $42,x				;$B4A33C   |
	CMP #$0005				;$B4A33E   |
	BNE CODE_B4A390				;$B4A341   |
	LDA #CODE_B4A371			;$B4A343   |
	STA $079C				;$B4A346   |
	LDY #$018E				;$B4A349   |
	JSL CODE_BB842C				;$B4A34C   |
	LDA #$003C				;$B4A350   |
	STA $064E				;$B4A353   |
	RTS					;$B4A356  /

CODE_B4A357:
	LDA #$0003				;$B4A357  \
	STA $42,x				;$B4A35A   |
	LDA #$0028				;$B4A35C   |
	STA $44,x				;$B4A35F   |
	LDA #$0110				;$B4A361   |
	STA $46,x				;$B4A364   |
	LDA #$F500				;$B4A366   |
	STA $48,x				;$B4A369   |
	LDA #$0068				;$B4A36B   |
	STA $4A,x				;$B4A36E   |
	RTS					;$B4A370  /

CODE_B4A371:
	JSR CODE_B4A0FD				;$B4A371  \
	JSR CODE_B4A051				;$B4A374   |
	DEC $064E				;$B4A377   |
	BNE CODE_B4A390				;$B4A37A   |
	LDA screen_brightness			;$B4A37C   |
	CMP #$000F				;$B4A37F   |
	BNE CODE_B4A390				;$B4A382   |
	LDA #$810F				;$B4A384   |
	JSL set_fade_global			;$B4A387   |
	LDA #CODE_808D7D			;$B4A38B   |
	STA NMI_pointer				;$B4A38E   |
CODE_B4A390:					;	   |
	RTS					;$B4A390  /

CODE_B4A391:
	LDA #CODE_808D4E			;$B4A391  \
	STA NMI_pointer				;$B4A394   |
	LDA #CODE_B4A3EE			;$B4A396   |
	STA $079C				;$B4A399   |
	LDA $06A1				;$B4A39C   |
	AND #$FDFF				;$B4A39F   |
	STA $06A1				;$B4A3A2   |
	LDA $06B1				;$B4A3A5   |
	DEC A					;$B4A3A8   |
	ASL A					;$B4A3A9   |
	TAX					;$B4A3AA   |
	LDY DATA_B4C55B,x			;$B4A3AB   |
	LDA language_select			;$B4A3AE   |
	BEQ CODE_B4A3B6				;$B4A3B1   |
	LDY DATA_B4C871,x			;$B4A3B3   |
CODE_B4A3B6:					;	   |
	LDA $0654				;$B4A3B6   |
	DEC A					;$B4A3B9   |
	ASL A					;$B4A3BA   |
	STY $0666				;$B4A3BB   |
	CLC					;$B4A3BE   |
	ADC $0666				;$B4A3BF   |
	TAX					;$B4A3C2   |
	LDY $0000,x				;$B4A3C3   |
	STY $079F				;$B4A3C6   |
	SEP #$20				;$B4A3C9   |
	LDA #$03				;$B4A3CB   |
	STA $079E				;$B4A3CD   |
	REP #$20				;$B4A3D0   |
	LDX $0000,y				;$B4A3D2   |
	LDA #$0006				;$B4A3D5   |
	LDY #$0800				;$B4A3D8   |
	JSR CODE_B4ADEB				;$B4A3DB   |
	LDA #$0001				;$B4A3DE   |
	STA $064E				;$B4A3E1   |
	JSR CODE_B4A1D4				;$B4A3E4   |
	LDX #$07A5				;$B4A3E7   |
	JSR CODE_B4BD57				;$B4A3EA   |
	RTS					;$B4A3ED  /

CODE_B4A3EE:
	JSR CODE_B4A0FD				;$B4A3EE  \
	DEC $064E				;$B4A3F1   |
	BEQ CODE_B4A3F9				;$B4A3F4   |
	BRL CODE_B4A47F				;$B4A3F6  /

CODE_B4A3F9:
	LDA $06A1				;$B4A3F9  \
	BIT #$0200				;$B4A3FC   |
	BEQ CODE_B4A461				;$B4A3FF   |
	LDA $06A1				;$B4A401   |
	BIT #$1000				;$B4A404   |
	BNE CODE_B4A429				;$B4A407   |
	JSR CODE_B4BDE7				;$B4A409   |
	INC $064E				;$B4A40C   |
	LDA $06A1				;$B4A40F   |
	BIT #$0001				;$B4A412   |
	BEQ CODE_B4A45E				;$B4A415   |
	ORA #$1000				;$B4A417   |
	AND #$FFFE				;$B4A41A   |
	STA $06A1				;$B4A41D   |
	LDA #$0001				;$B4A420   |
	STA $064E				;$B4A423   |
	BRL CODE_B4A47F				;$B4A426  /

CODE_B4A429:
	JSR CODE_B4BE0B				;$B4A429  \
	INC $064E				;$B4A42C   |
	LDA $06A1				;$B4A42F   |
	BIT #$0001				;$B4A432   |
	BEQ CODE_B4A45E				;$B4A435   |
	LDA $06A1				;$B4A437   |
	AND #$FDFF				;$B4A43A   |
	STA $06A1				;$B4A43D   |
	LDY $079F				;$B4A440   |
	LDX $0004,y				;$B4A443   |
	LDA #$0006				;$B4A446   |
	LDY #$0800				;$B4A449   |
	JSR CODE_B4ADEB				;$B4A44C   |
	LDA #CODE_B4A483			;$B4A44F   |
	STA $079C				;$B4A452   |
	LDA #$0001				;$B4A455   |
	STA $064E				;$B4A458   |
	BRL CODE_B4A482				;$B4A45B  /

CODE_B4A45E:
	BRL CODE_B4A47F				;$B4A45E  /

CODE_B4A461:
	JSR CODE_B4A7E7				;$B4A461  \
	LDA $06A1				;$B4A464   |
	ORA #$0200				;$B4A467   |
	AND #$EFFF				;$B4A46A   |
	STA $06A1				;$B4A46D   |
	LDY $079F				;$B4A470   |
	LDA $0002,y				;$B4A473   |
	STA $064E				;$B4A476   |
	LDA #$0001				;$B4A479   |
	JSR CODE_B4BD95				;$B4A47C   |
CODE_B4A47F:					;	   |
	JSR CODE_B4A7D8				;$B4A47F   |
CODE_B4A482:					;	   |
	RTS					;$B4A482  /

CODE_B4A483:
	JSR CODE_B4A0FD				;$B4A483  \
	LDA $06A1				;$B4A486   |
	BIT #$0200				;$B4A489   |
	BEQ CODE_B4A4B4				;$B4A48C   |
	JSR CODE_B4BDE7				;$B4A48E   |
	INC $064E				;$B4A491   |
	LDA $06A1				;$B4A494   |
	BIT #$0001				;$B4A497   |
	BEQ CODE_B4A4B1				;$B4A49A   |
	ORA #$1000				;$B4A49C   |
	AND #$FFFE				;$B4A49F   |
	STA $06A1				;$B4A4A2   |
	LDA #CODE_B4A4D9			;$B4A4A5   |
	STA $079C				;$B4A4A8   |
	JSR CODE_B49B55				;$B4A4AB   |
	BRL CODE_B4A4D5				;$B4A4AE  /

CODE_B4A4B1:
	BRL CODE_B4A4D5				;$B4A4B1  /

CODE_B4A4B4:
	JSR CODE_B4A7E7				;$B4A4B4  \
	JSR CODE_B4A0FD				;$B4A4B7   |
	LDA $06A1				;$B4A4BA   |
	ORA #$0200				;$B4A4BD   |
	AND #$EFFF				;$B4A4C0   |
	STA $06A1				;$B4A4C3   |
	LDY $079F				;$B4A4C6   |
	LDA $0002,y				;$B4A4C9   |
	STA $064E				;$B4A4CC   |
	LDA #$0001				;$B4A4CF   |
	JSR CODE_B4BD95				;$B4A4D2   |
CODE_B4A4D5:					;	   |
	JSR CODE_B4A7D8				;$B4A4D5   |
	RTS					;$B4A4D8  /

CODE_B4A4D9:
	JSR CODE_B4A0FD				;$B4A4D9  \
	LDA $06A3				;$B4A4DC   |
	BIT #$0400				;$B4A4DF   |
	BNE CODE_B4A526				;$B4A4E2   |
	ORA #$0400				;$B4A4E4   |
	STA $06A3				;$B4A4E7   |
	LDA #$0000				;$B4A4EA   |
	STA PPU.vram_address			;$B4A4ED   |
	SEP #$20				;$B4A4F0   |
	LDA #$01				;$B4A4F2   |
	STA DMA[0].settings			;$B4A4F4   |
	LDA #$18				;$B4A4F7   |
	STA DMA[0].destination			;$B4A4F9   |
	LDX #DATA_FC14E0			;$B4A4FC   |
	STX DMA[0].source			;$B4A4FF   |
	LDA #DATA_FC14E0>>16			;$B4A502   |
	STA DMA[0].source_bank			;$B4A504   |
	LDY #$0400				;$B4A507   |
	STY DMA[0].size				;$B4A50A   |
	STZ DMA[0].unused_1			;$B4A50D   |
	LDA #$01				;$B4A510   |
	STA CPU.enable_dma			;$B4A512   |
	REP #$20				;$B4A515   |
	LDA #$0003				;$B4A517   |
	STA $066A				;$B4A51A   |
	LDA #$0001				;$B4A51D   |
	STA $066C				;$B4A520   |
	STA $066E				;$B4A523   |
CODE_B4A526:					;	   |
	LDA $06A1				;$B4A526   |
	BIT #$0800				;$B4A529   |
	BEQ CODE_B4A568				;$B4A52C   |
CODE_B4A52E:					;	   |
	LDA $06BB				;$B4A52E   |
	BMI CODE_B4A566				;$B4A531   |
CODE_B4A533:					;	   |
	SEP #$20				;$B4A533   |
	LDA $06B6				;$B4A535   |
	CLC					;$B4A538   |
	ADC $06BB				;$B4A539   |
	STA $06B6				;$B4A53C   |
	REP #$20				;$B4A53F   |
	DEC $0668				;$B4A541   |
	BEQ CODE_B4A549				;$B4A544   |
	BRL CODE_B4A5CC				;$B4A546  /

CODE_B4A549:
	LDA #$0633				;$B4A549  \
	JSL queue_sound_effect			;$B4A54C   |
	LDA $06A1				;$B4A550   |
	AND #$F7FF				;$B4A553   |
	STA $06A1				;$B4A556   |
	LDA $066C				;$B4A559   |
	CLC					;$B4A55C   |
	ADC $06BB				;$B4A55D   |
	STA $066C				;$B4A560   |
	BRL CODE_B4A5CC				;$B4A563  /

CODE_B4A566:
	BRA CODE_B4A533				;$B4A566  /

CODE_B4A568:
	LDA player_active_held			;$B4A568  \
	BIT #$0800				;$B4A56B   |
	BEQ CODE_B4A590				;$B4A56E   |
	LDA $066C				;$B4A570   |
	CMP #$0001				;$B4A573   |
	BEQ CODE_B4A5CC				;$B4A576   |
	LDA $06A1				;$B4A578   |
	ORA #$0800				;$B4A57B   |
	STA $06A1				;$B4A57E   |
	LDA #$FFFF				;$B4A581   |
	STA $06BB				;$B4A584   |
	LDA #$0010				;$B4A587   |
	STA $0668				;$B4A58A   |
	BRL CODE_B4A52E				;$B4A58D  /

CODE_B4A590:
	BIT #$0400				;$B4A590  \
	BEQ CODE_B4A5B5				;$B4A593   |
	LDA $066C				;$B4A595   |
	CMP $066A				;$B4A598   |
	BEQ CODE_B4A5CC				;$B4A59B   |
	LDA $06A1				;$B4A59D   |
	ORA #$0800				;$B4A5A0   |
	STA $06A1				;$B4A5A3   |
	LDA #$0001				;$B4A5A6   |
	STA $06BB				;$B4A5A9   |
	LDA #$0010				;$B4A5AC   |
	STA $0668				;$B4A5AF   |
	BRL CODE_B4A52E				;$B4A5B2  /

CODE_B4A5B5:
	LDA player_active_pressed		;$B4A5B5  \
	BIT #$D0C0				;$B4A5B8   |
	BEQ CODE_B4A5CC				;$B4A5BB   |
	LDA $06A3				;$B4A5BD   |
	AND #$FBFF				;$B4A5C0   |
	STA $06A3				;$B4A5C3   |
	LDA #CODE_B4A5E7			;$B4A5C6   |
	STA $079C				;$B4A5C9   |
CODE_B4A5CC:					;	   |
	JSL CODE_BAC7C0				;$B4A5CC   |
	LDA #$03FC				;$B4A5D0   |
	STA $C8					;$B4A5D3   |
	JSR CODE_B49C4D				;$B4A5D5   |
	LDX #$07A5				;$B4A5D8   |
	JSR CODE_B4BB62				;$B4A5DB   |
	JSL sprite_handler			;$B4A5DE   |
	JSR CODE_B4AE85				;$B4A5E2   |
	PLA					;$B4A5E5   |
	RTL					;$B4A5E6  /

CODE_B4A5E7:
	JSR CODE_B4A0FD				;$B4A5E7  \
	JSR CODE_B4BE0B				;$B4A5EA   |
	LDA $06A1				;$B4A5ED   |
	BIT #$0001				;$B4A5F0   |
	BEQ CODE_B4A66C				;$B4A5F3   |
	LDA $06A1				;$B4A5F5   |
	AND #$FDFF				;$B4A5F8   |
	STA $06A1				;$B4A5FB   |
	LDY $079F				;$B4A5FE   |
	LDA $0006,y				;$B4A601   |
	CMP $066C				;$B4A604   |
	BNE CODE_B4A639				;$B4A607   |
	LDA #$0634				;$B4A609   |
	JSL queue_sound_effect			;$B4A60C   |
	LDA $079E				;$B4A610   |
	AND #$00FF				;$B4A613   |
	DEC A					;$B4A616   |
	BNE CODE_B4A62C				;$B4A617   |
	LDX #$0112				;$B4A619   |
	LDA language_select			;$B4A61C   |
	BEQ CODE_B4A624				;$B4A61F   |
	LDX #$FD2C				;$B4A621   |
CODE_B4A624:					;	   |
	LDA $06A3				;$B4A624   |
	ORA #$0800				;$B4A627   |
	BRA CODE_B4A651				;$B4A62A  /

CODE_B4A62C:
	LDX #$0124				;$B4A62C  \
	LDA language_select			;$B4A62F   |
	BEQ CODE_B4A637				;$B4A632   |
	LDX #$FD38				;$B4A634   |
CODE_B4A637:					;	   |
	BRA CODE_B4A624				;$B4A637  /

CODE_B4A639:
	LDA #$065F				;$B4A639  \
	JSL queue_sound_effect			;$B4A63C   |
	LDX #$0100				;$B4A640   |
	LDA language_select			;$B4A643   |
	BEQ CODE_B4A64B				;$B4A646   |
	LDX #DATA_F7FD20			;$B4A648   |
CODE_B4A64B:					;	   |
	LDA $06A3				;$B4A64B   |
	AND #$F7FF				;$B4A64E   |
CODE_B4A651:					;	   |
	STA $06A3				;$B4A651   |
	STX $065C				;$B4A654   |
	LDY #$0800				;$B4A657   |
	JSR CODE_B49BE0				;$B4A65A   |
	LDA #CODE_B4A673			;$B4A65D   |
	STA $079C				;$B4A660   |
	LDA #$0001				;$B4A663   |
	STA $064E				;$B4A666   |
	BRL CODE_B4A672				;$B4A669  /

CODE_B4A66C:
	BRL CODE_B4A66F				;$B4A66C  /

CODE_B4A66F:
	JSR CODE_B4A7D8				;$B4A66F  \
CODE_B4A672:					;	   |
	RTS					;$B4A672  /

CODE_B4A673:
	JSR CODE_B4A0FD				;$B4A673  \
	DEC $064E				;$B4A676   |
	BEQ CODE_B4A67E				;$B4A679   |
	BRL CODE_B4A78F				;$B4A67B  /

CODE_B4A67E:
	LDA $06A1				;$B4A67E  \
	BIT #$0200				;$B4A681   |
	BNE CODE_B4A689				;$B4A684   |
	BRL CODE_B4A741				;$B4A686  /

CODE_B4A689:
	JSR CODE_B4BDE7				;$B4A689  \
	INC $064E				;$B4A68C   |
	LDA $06A1				;$B4A68F   |
	BIT #$0001				;$B4A692   |
	BNE CODE_B4A69A				;$B4A695   |
	BRL CODE_B4A73E				;$B4A697  /

CODE_B4A69A:
	ORA #$1000				;$B4A69A  \
	AND #$FFFE				;$B4A69D   |
	STA $06A1				;$B4A6A0   |
	LDA $06A3				;$B4A6A3   |
	BIT #$0800				;$B4A6A6   |
	BNE CODE_B4A6CE				;$B4A6A9   |
	JSR CODE_B4A11F				;$B4A6AB   |
	LDA #CODE_808D30			;$B4A6AE   |
	STA NMI_pointer				;$B4A6B1   |
	LDA #CODE_808D1F			;$B4A6B3   |
	STA $065E				;$B4A6B6   |
	STZ $067A				;$B4A6B9   |
	LDA $06A1				;$B4A6BC   |
	ORA #$0400				;$B4A6BF   |
	STA $06A1				;$B4A6C2   |
	LDA $0670				;$B4A6C5   |
	STA $06B5				;$B4A6C8   |
	BRL CODE_B4A792				;$B4A6CB  /

CODE_B4A6CE:
	SEP #$20				;$B4A6CE  \
	DEC $079E				;$B4A6D0   |
	BNE CODE_B4A70D				;$B4A6D3   |
	REP #$20				;$B4A6D5   |
	JSR CODE_B49E3A				;$B4A6D7   |
	LDX $06B1				;$B4A6DA   |
	DEX					;$B4A6DD   |
	LDA $08F0,x				;$B4A6DE   |
	ORA $0666				;$B4A6E1   |
	STA $08F0,x				;$B4A6E4   |
	JSR CODE_B4A11F				;$B4A6E7   |
	LDA $0670				;$B4A6EA   |
	STA $06B5				;$B4A6ED   |
	LDA #CODE_808D30			;$B4A6F0   |
	STA NMI_pointer				;$B4A6F3   |
	LDA #CODE_808D1F			;$B4A6F5   |
	STA $065E				;$B4A6F8   |
	STZ $067A				;$B4A6FB   |
	LDA $06A1				;$B4A6FE   |
	ORA #$0400				;$B4A701   |
	STA $06A1				;$B4A704   |
	JSR CODE_B4974F				;$B4A707   |
	BRL CODE_B4A792				;$B4A70A  /

CODE_B4A70D:
	REP #$20				;$B4A70D  \
	LDA $079F				;$B4A70F   |
	CLC					;$B4A712   |
	ADC #$0008				;$B4A713   |
	STA $079F				;$B4A716   |
	TAY					;$B4A719   |
	LDX $0000,y				;$B4A71A   |
	LDA #$0006				;$B4A71D   |
	LDY #$0800				;$B4A720   |
	JSR CODE_B4ADEB				;$B4A723   |
	LDA #CODE_B4A3EE			;$B4A726   |
	STA $079C				;$B4A729   |
	LDA #$0001				;$B4A72C   |
	STA $064E				;$B4A72F   |
	LDA $06A1				;$B4A732   |
	AND #$FDFF				;$B4A735   |
	STA $06A1				;$B4A738   |
	BRL CODE_B4A792				;$B4A73B  /

CODE_B4A73E:
	BRL CODE_B4A78F				;$B4A73E  /

CODE_B4A741:
	JSR CODE_B4A7E7				;$B4A741  \
	JSR CODE_B4A0FD				;$B4A744   |
	LDA $06A1				;$B4A747   |
	ORA #$0200				;$B4A74A   |
	AND #$EFFF				;$B4A74D   |
	STA $06A1				;$B4A750   |
	LDA #$01F4				;$B4A753   |
	STA $064E				;$B4A756   |
	LDA #$0001				;$B4A759   |
	JSR CODE_B4BD95				;$B4A75C   |
	LDA $06A3				;$B4A75F   |
	BIT #$0800				;$B4A762   |
	BEQ CODE_B4A78F				;$B4A765   |
	LDA $079E				;$B4A767   |
	AND #$00FF				;$B4A76A   |
	CMP #$0001				;$B4A76D   |
	BNE CODE_B4A78F				;$B4A770   |
	LDA $0654				;$B4A772   |
	CLC					;$B4A775   |
	ADC #$0007				;$B4A776   |
	JSR CODE_B4A79F				;$B4A779   |
	LDX alternate_sprite			;$B4A77C   |
	LDA $0654				;$B4A77E   |
	DEC A					;$B4A781   |
	ASL A					;$B4A782   |
	ASL A					;$B4A783   |
	TAY					;$B4A784   |
	LDA DATA_B4A793,y			;$B4A785   |
	STA $06,x				;$B4A788   |
	LDA DATA_B4A795,y			;$B4A78A   |
	STA $0A,x				;$B4A78D   |
CODE_B4A78F:					;	   |
	JSR CODE_B4A7D8				;$B4A78F   |
CODE_B4A792:					;	   |
	RTS					;$B4A792  /

DATA_B4A793:
	db $14, $00
DATA_B4A795:
	db $64, $00, $80, $00, $5A, $00, $D2, $00
	db $64, $00


CODE_B4A79F:
	PHA					;$B4A79F  \
	ASL A					;$B4A7A0   |
	TAX					;$B4A7A1   |
	LDA.l DATA_FF18CE,x			;$B4A7A2   |
	TAY					;$B4A7A6   |
	JSL CODE_BB8432				;$B4A7A7   |
	PLA					;$B4A7AB   |
	BCS CODE_B4A7D7				;$B4A7AC   |
	LDY alternate_sprite			;$B4A7AE   |
	STA $0042,y				;$B4A7B0   |
	LDA #$001C				;$B4A7B3   |
	STA $0052,y				;$B4A7B6   |
	LDA #$0003				;$B4A7B9   |
	STA $002E,y				;$B4A7BC   |
	LDA #$F900				;$B4A7BF   |
	STA $0024,y				;$B4A7C2   |
	LDA #$002A				;$B4A7C5   |
	STA $0048,y				;$B4A7C8   |
	LDA #$0050				;$B4A7CB   |
	STA $004C,y				;$B4A7CE   |
	LDA #$3000				;$B4A7D1   |
	STA $004E,y				;$B4A7D4   |
CODE_B4A7D7:					;	   |
	RTS					;$B4A7D7  /

CODE_B4A7D8:
	LDA player_active_pressed		;$B4A7D8  \
	BIT #$D0C0				;$B4A7DB   |
	BEQ CODE_B4A7E6				;$B4A7DE   |
	LDA #$0001				;$B4A7E0   |
	STA $064E				;$B4A7E3   |
CODE_B4A7E6:					;	   |
	RTS					;$B4A7E6  /

CODE_B4A7E7:
	LDA $0664				;$B4A7E7  \
	STA PPU.vram_address			;$B4A7EA   |
	SEP #$20				;$B4A7ED   |
	LDA #$01				;$B4A7EF   |
	STA DMA[0].settings			;$B4A7F1   |
	LDA #$18				;$B4A7F4   |
	STA DMA[0].destination			;$B4A7F6   |
	LDX #$4600				;$B4A7F9   |
	STX DMA[0].source			;$B4A7FC   |
	LDA #$7E				;$B4A7FF   |
	STA DMA[0].source_bank			;$B4A801   |
	LDX #$0180				;$B4A804   |
	STX DMA[0].size				;$B4A807   |
	STZ DMA[0].unused_1			;$B4A80A   |
	LDA #$01				;$B4A80D   |
	STA CPU.enable_dma			;$B4A80F   |
	REP #$20				;$B4A812   |
	RTS					;$B4A814  /

CODE_B4A815:
	JSL CODE_BAC7C0				;$B4A815  \
	LDA #$03FC				;$B4A819   |
	STA $C8					;$B4A81C   |
	LDX #$07A5				;$B4A81E   |
	JSR CODE_B4BB62				;$B4A821   |
	JSL sprite_handler			;$B4A824   |
	JSL CODE_B5A8DA				;$B4A828   |
	JSR CODE_B4AE85				;$B4A82C   |
	RTS					;$B4A82F  /

CODE_B4A830:
	LDA #$0001				;$B4A830  \
	STA $42,x				;$B4A833   |
	LDA #$0098				;$B4A835   |
	STA $44,x				;$B4A838   |
	LDA #$0120				;$B4A83A   |
	STA $46,x				;$B4A83D   |
	RTS					;$B4A83F  /

	LDX $0593				;$B4A840   |
	JSR CODE_B4A97C				;$B4A843   |
	LDX $0597				;$B4A846   |
	JSR CODE_B4A97C				;$B4A849   |
	LDA #CODE_B4A87F			;$B4A84C   |
	STA $079C				;$B4A84F   |
	LDA #CODE_808D4E			;$B4A852   |
	STA NMI_pointer				;$B4A855   |
	LDA #$0001				;$B4A857   |
	STA $064E				;$B4A85A   |
	LDA $06A1				;$B4A85D   |
	AND #$FDFF				;$B4A860   |
	STA $06A1				;$B4A863   |
	LDA $0689				;$B4A866   |
	TAX					;$B4A869   |
	LDA DATA_B4C551,x			;$B4A86A   |
	LDY language_select			;$B4A86D   |
	BEQ CODE_B4A875				;$B4A870   |
	LDA DATA_B4C867,x			;$B4A872   |
CODE_B4A875:					;	   |
	STA $065C				;$B4A875   |
	LDY #$0000				;$B4A878   |
	JSR CODE_B49BE0				;$B4A87B   |
	RTS					;$B4A87E  /

CODE_B4A87F:
	LDX $0597				;$B4A87F  \
	LDA $42,x				;$B4A882   |
	BNE CODE_B4A89B				;$B4A884   |
	LDA #CODE_808D7D			;$B4A886   |
	STA NMI_pointer				;$B4A889   |
	LDA screen_brightness			;$B4A88B   |
	CMP #$000F				;$B4A88E   |
	BNE CODE_B4A89B				;$B4A891   |
	LDA #$810F				;$B4A893   |
	JSL set_fade_global			;$B4A896   |
	RTS					;$B4A89A  /

CODE_B4A89B:
	DEC $064E				;$B4A89B  \
	BEQ CODE_B4A8A3				;$B4A89E   |
	BRL CODE_B4A959				;$B4A8A0  /

CODE_B4A8A3:
	LDA $06A1				;$B4A8A3  \
	BIT #$0200				;$B4A8A6   |
	BNE CODE_B4A8AE				;$B4A8A9   |
	BRL CODE_B4A90E				;$B4A8AB  /

CODE_B4A8AE:
	LDA $06A1				;$B4A8AE  \
	BIT #$1000				;$B4A8B1   |
	BNE CODE_B4A8D6				;$B4A8B4   |
	JSR CODE_B4BDE7				;$B4A8B6   |
	INC $064E				;$B4A8B9   |
	LDA $06A1				;$B4A8BC   |
	BIT #$0001				;$B4A8BF   |
	BEQ CODE_B4A90B				;$B4A8C2   |
	ORA #$1000				;$B4A8C4   |
	AND #$FFFE				;$B4A8C7   |
	STA $06A1				;$B4A8CA   |
	LDA #$FFFF				;$B4A8CD   |
	STA $064E				;$B4A8D0   |
	BRL CODE_B4A959				;$B4A8D3  /

CODE_B4A8D6:
	JSR CODE_B4BE0B				;$B4A8D6  \
	INC $064E				;$B4A8D9   |
	LDA $06A1				;$B4A8DC   |
	BIT #$0001				;$B4A8DF   |
	BEQ CODE_B4A90B				;$B4A8E2   |
	LDA $06A1				;$B4A8E4   |
	AND #$FDFF				;$B4A8E7   |
	STA $06A1				;$B4A8EA   |
	LDA NMI_pointer				;$B4A8ED   |
	CMP #CODE_808D7D			;$B4A8EF   |
	BEQ CODE_B4A908				;$B4A8F2   |
	LDA #CODE_808D7D			;$B4A8F4   |
	STA NMI_pointer				;$B4A8F7   |
	LDA screen_brightness			;$B4A8F9   |
	CMP #$000F				;$B4A8FC   |
	BNE CODE_B4A908				;$B4A8FF   |
	LDA #$810F				;$B4A901   |
	JSL set_fade_global			;$B4A904   |
CODE_B4A908:					;	   |
	BRL CODE_B4A97B				;$B4A908  /

CODE_B4A90B:
	BRL CODE_B4A959				;$B4A90B  /

CODE_B4A90E:
	LDA $0662				;$B4A90E  \
	STA PPU.vram_address			;$B4A911   |
	SEP #$20				;$B4A914   |
	LDA #$01				;$B4A916   |
	STA DMA[0].settings			;$B4A918   |
	LDA #$18				;$B4A91B   |
	STA DMA[0].destination			;$B4A91D   |
	LDX #$3E00				;$B4A920   |
	STX DMA[0].source			;$B4A923   |
	LDA #$7E				;$B4A926   |
	STA DMA[0].source_bank			;$B4A928   |
	LDX #$0180				;$B4A92B   |
	STX DMA[0].size				;$B4A92E   |
	STZ DMA[0].unused_1			;$B4A931   |
	LDA #$01				;$B4A934   |
	STA CPU.enable_dma			;$B4A936   |
	REP #$20				;$B4A939   |
	LDA #$0041				;$B4A93B   |
	STA $06D6				;$B4A93E   |
	LDA $06A1				;$B4A941   |
	ORA #$0200				;$B4A944   |
	AND #$EFFF				;$B4A947   |
	STA $06A1				;$B4A94A   |
	LDA #$0001				;$B4A94D   |
	STA $064E				;$B4A950   |
	LDA #$0001				;$B4A953   |
	JSR CODE_B4BD8D				;$B4A956   |
CODE_B4A959:					;	   |
	LDA player_active_pressed		;$B4A959   |
	BIT #$D0C0				;$B4A95C   |
	BEQ CODE_B4A97B				;$B4A95F   |
	LDA screen_brightness			;$B4A961   |
	CMP #$000F				;$B4A964   |
	BNE CODE_B4A97B				;$B4A967   |
	LDA #$0001				;$B4A969   |
	STA $064E				;$B4A96C   |
	LDA #CODE_808D7D			;$B4A96F   |
	STA NMI_pointer				;$B4A972   |
	LDA #$810F				;$B4A974   |
	JSL set_fade_global			;$B4A977   |
CODE_B4A97B:					;	   |
	RTS					;$B4A97B  /

CODE_B4A97C:
	LDA #$0001				;$B4A97C  \
	STA $42,x				;$B4A97F   |
	LDA #$FFD8				;$B4A981   |
	STA $44,x				;$B4A984   |
	LDA #$0100				;$B4A986   |
	STA $46,x				;$B4A989   |
	RTS					;$B4A98B  /

CODE_B4A98C:
	LDX $0593				;$B4A98C  \
	JSR CODE_B4A9CB				;$B4A98F   |
	LDX $0597				;$B4A992   |
	JSR CODE_B4A9CB				;$B4A995   |
	LDA #CODE_B4A87F			;$B4A998   |
	STA $079C				;$B4A99B   |
	LDA #CODE_808D4E			;$B4A99E   |
	STA NMI_pointer				;$B4A9A1   |
	LDA #$0001				;$B4A9A3   |
	STA $064E				;$B4A9A6   |
	LDA $06A1				;$B4A9A9   |
	AND #$FDFF				;$B4A9AC   |
	STA $06A1				;$B4A9AF   |
	LDA $0689				;$B4A9B2   |
	TAX					;$B4A9B5   |
	LDA DATA_B4C551,x			;$B4A9B6   |
	LDY language_select			;$B4A9B9   |
	BEQ CODE_B4A9C1				;$B4A9BC   |
	LDA DATA_B4C867,x			;$B4A9BE   |
CODE_B4A9C1:					;	   |
	STA $065C				;$B4A9C1   |
	LDY #$0000				;$B4A9C4   |
	JSR CODE_B49BE0				;$B4A9C7   |
	RTS					;$B4A9CA  /

CODE_B4A9CB:
	LDA #$0001				;$B4A9CB  \
	STA $42,x				;$B4A9CE   |
	LDA #$01C0				;$B4A9D0   |
	STA $44,x				;$B4A9D3   |
	LDA #$0100				;$B4A9D5   |
	STA $46,x				;$B4A9D8   |
	RTS					;$B4A9DA  /

CODE_B4A9DB:
	LDX $0593				;$B4A9DB  \
	JSR CODE_B4AA1A				;$B4A9DE   |
	LDX $0597				;$B4A9E1   |
	JSR CODE_B4AA1A				;$B4A9E4   |
	LDA #CODE_B4A87F			;$B4A9E7   |
	STA $079C				;$B4A9EA   |
	LDA #CODE_808D4E			;$B4A9ED   |
	STA NMI_pointer				;$B4A9F0   |
	LDA #$0001				;$B4A9F2   |
	STA $064E				;$B4A9F5   |
	LDA $06A1				;$B4A9F8   |
	AND #$FDFF				;$B4A9FB   |
	STA $06A1				;$B4A9FE   |
	LDA $0689				;$B4AA01   |
	TAX					;$B4AA04   |
	LDA DATA_B4C551,x			;$B4AA05   |
	LDY language_select			;$B4AA08   |
	BEQ CODE_B4AA10				;$B4AA0B   |
	LDA DATA_B4C867,x			;$B4AA0D   |
CODE_B4AA10:					;	   |
	STA $065C				;$B4AA10   |
	LDY #$0000				;$B4AA13   |
	JSR CODE_B49BE0				;$B4AA16   |
	RTS					;$B4AA19  /

CODE_B4AA1A:
	LDA #$0001				;$B4AA1A  \
	STA $42,x				;$B4AA1D   |
	LDA #$FF40				;$B4AA1F   |
	STA $44,x				;$B4AA22   |
	LDA #$0100				;$B4AA24   |
	STA $46,x				;$B4AA27   |
	RTS					;$B4AA29  /

CODE_B4AA2A:
	LDX $0593				;$B4AA2A  \
	JSR CODE_B4AA69				;$B4AA2D   |
	LDX $0597				;$B4AA30   |
	JSR CODE_B4AA69				;$B4AA33   |
	LDA #CODE_B4AA79			;$B4AA36   |
	STA $079C				;$B4AA39   |
	LDA #CODE_808D4E			;$B4AA3C   |
	STA NMI_pointer				;$B4AA3F   |
	LDA #$0001				;$B4AA41   |
	STA $064E				;$B4AA44   |
	LDA $0689				;$B4AA47   |
	TAX					;$B4AA4A   |
	LDA DATA_B4C547,x			;$B4AA4B   |
	LDY language_select			;$B4AA4E   |
	BEQ CODE_B4AA56				;$B4AA51   |
	LDA DATA_B4C85D,x			;$B4AA53   |
CODE_B4AA56:					;	   |
	STA $065C				;$B4AA56   |
	LDY #$0000				;$B4AA59   |
	JSR CODE_B49BE0				;$B4AA5C   |
	LDA $06A3				;$B4AA5F   |
	ORA #$0200				;$B4AA62   |
	STA $06A3				;$B4AA65   |
	RTS					;$B4AA68  /

CODE_B4AA69:
	LDA #$0001				;$B4AA69  \
	STA $42,x				;$B4AA6C   |
	LDA #$0070				;$B4AA6E   |
	STA $44,x				;$B4AA71   |
	LDA #$0050				;$B4AA73   |
	STA $46,x				;$B4AA76   |
	RTS					;$B4AA78  /

CODE_B4AA79:
	LDX $0597				;$B4AA79  \
	LDA $42,x				;$B4AA7C   |
	BNE CODE_B4AA95				;$B4AA7E   |
	LDA #CODE_808D7D			;$B4AA80   |
	STA NMI_pointer				;$B4AA83   |
	LDA screen_brightness			;$B4AA85   |
	CMP #$000F				;$B4AA88   |
	BNE CODE_B4AA95				;$B4AA8B   |
	LDA #$810F				;$B4AA8D   |
	JSL set_fade_global			;$B4AA90   |
	RTS					;$B4AA94  /

CODE_B4AA95:
	DEC $064E				;$B4AA95  \
	BEQ CODE_B4AA9D				;$B4AA98   |
	BRL CODE_B4AB4B				;$B4AA9A  /

CODE_B4AA9D:
	LDA $06A1				;$B4AA9D  \
	BIT #$0200				;$B4AAA0   |
	BNE CODE_B4AAA8				;$B4AAA3   |
	BRL CODE_B4AB00				;$B4AAA5  /

CODE_B4AAA8:
	LDA $06A1				;$B4AAA8  \
	BIT #$1000				;$B4AAAB   |
	BNE CODE_B4AAD0				;$B4AAAE   |
	JSR CODE_B4BDE7				;$B4AAB0   |
	INC $064E				;$B4AAB3   |
	LDA $06A1				;$B4AAB6   |
	BIT #$0001				;$B4AAB9   |
	BEQ CODE_B4AAFD				;$B4AABC   |
	ORA #$1000				;$B4AABE   |
	AND #$FFFE				;$B4AAC1   |
	STA $06A1				;$B4AAC4   |
	LDA #$012C				;$B4AAC7   |
	STA $064E				;$B4AACA   |
	BRL CODE_B4AB4B				;$B4AACD  /

CODE_B4AAD0:
	JSR CODE_B4BE0B				;$B4AAD0  \
	INC $064E				;$B4AAD3   |
	LDA $06A1				;$B4AAD6   |
	BIT #$0001				;$B4AAD9   |
	BEQ CODE_B4AAFD				;$B4AADC   |
	LDA $06A1				;$B4AADE   |
	AND #$FDFF				;$B4AAE1   |
	STA $06A1				;$B4AAE4   |
	LDA NMI_pointer				;$B4AAE7   |
	CMP #CODE_808D7D			;$B4AAE9   |
	BEQ CODE_B4AAFA				;$B4AAEC   |
	LDA #CODE_808D7D			;$B4AAEE   |
	STA NMI_pointer				;$B4AAF1   |
	LDA #$810F				;$B4AAF3   |
	JSL set_fade_global			;$B4AAF6   |
CODE_B4AAFA:					;	   |
	BRL CODE_B4AB6D				;$B4AAFA  /

CODE_B4AAFD:
	BRL CODE_B4AB4B				;$B4AAFD  /

CODE_B4AB00:
	LDA $0662				;$B4AB00  \
	STA PPU.vram_address			;$B4AB03   |
	SEP #$20				;$B4AB06   |
	LDA #$01				;$B4AB08   |
	STA DMA[0].settings			;$B4AB0A   |
	LDA #$18				;$B4AB0D   |
	STA DMA[0].destination			;$B4AB0F   |
	LDX #$3E00				;$B4AB12   |
	STX DMA[0].source			;$B4AB15   |
	LDA #$7E				;$B4AB18   |
	STA DMA[0].source_bank			;$B4AB1A   |
	LDX #$0180				;$B4AB1D   |
	STX DMA[0].size				;$B4AB20   |
	STZ DMA[0].unused_1			;$B4AB23   |
	LDA #$01				;$B4AB26   |
	STA CPU.enable_dma			;$B4AB28   |
	REP #$20				;$B4AB2B   |
	LDA #$0041				;$B4AB2D   |
	STA $06D6				;$B4AB30   |
	LDA $06A1				;$B4AB33   |
	ORA #$0200				;$B4AB36   |
	AND #$EFFF				;$B4AB39   |
	STA $06A1				;$B4AB3C   |
	LDA #$0001				;$B4AB3F   |
	STA $064E				;$B4AB42   |
	LDA #$0001				;$B4AB45   |
	JSR CODE_B4BD8D				;$B4AB48   |
CODE_B4AB4B:					;	   |
	LDA player_active_pressed		;$B4AB4B   |
	BIT #$D0C0				;$B4AB4E   |
	BEQ CODE_B4AB6D				;$B4AB51   |
	LDA screen_brightness			;$B4AB53   |
	CMP #$000F				;$B4AB56   |
	BNE CODE_B4AB6D				;$B4AB59   |
	LDA #$0001				;$B4AB5B   |
	STA $064E				;$B4AB5E   |
	LDA #CODE_808D7D			;$B4AB61   |
	STA NMI_pointer				;$B4AB64   |
	LDA #$810F				;$B4AB66   |
	JSL set_fade_global			;$B4AB69   |
CODE_B4AB6D:					;	   |
	RTS					;$B4AB6D  /

CODE_B4AB6E:
	PHK					;$B4AB6E  \
	PLB					;$B4AB6F   |
	JSL CODE_B5A919				;$B4AB70   |
	JSL CODE_80F320				;$B4AB74   |
	JSR CODE_B4996E				;$B4AB78   |
	DEC $064E				;$B4AB7B   |
	BEQ CODE_B4AB83				;$B4AB7E   |
	BRL CODE_B4AC3A				;$B4AB80  /

CODE_B4AB83:
	LDA $06A1				;$B4AB83  \
	BIT #$0200				;$B4AB86   |
	BEQ CODE_B4ABEA				;$B4AB89   |
	LDA $06A1				;$B4AB8B   |
	BIT #$1000				;$B4AB8E   |
	BNE CODE_B4ABB3				;$B4AB91   |
	JSR CODE_B4BDE7				;$B4AB93   |
	INC $064E				;$B4AB96   |
	LDA $06A1				;$B4AB99   |
	BIT #$0001				;$B4AB9C   |
	BEQ CODE_B4ABE7				;$B4AB9F   |
	ORA #$1000				;$B4ABA1   |
	AND #$FFFE				;$B4ABA4   |
	STA $06A1				;$B4ABA7   |
	LDA #$0208				;$B4ABAA   |
	STA $064E				;$B4ABAD   |
	BRL CODE_B4AC3A				;$B4ABB0  /

CODE_B4ABB3:
	JSR CODE_B4BE0B				;$B4ABB3  \
	INC $064E				;$B4ABB6   |
	LDA $06A1				;$B4ABB9   |
	BIT #$0001				;$B4ABBC   |
	BEQ CODE_B4ABE7				;$B4ABBF   |
	LDA $06A1				;$B4ABC1   |
	AND #$FDFF				;$B4ABC4   |
	STA $06A1				;$B4ABC7   |
	JSR CODE_B4A11F				;$B4ABCA   |
	LDA #CODE_808D30			;$B4ABCD   |
	STA NMI_pointer				;$B4ABD0   |
	LDA #CODE_808D1F			;$B4ABD2   |
	STA $065E				;$B4ABD5   |
	STZ $067A				;$B4ABD8   |
	LDA $06A1				;$B4ABDB   |
	ORA #$0400				;$B4ABDE   |
	STA $06A1				;$B4ABE1   |
	BRL CODE_B4AC48				;$B4ABE4  /

CODE_B4ABE7:
	BRL CODE_B4AC3A				;$B4ABE7  /

CODE_B4ABEA:
	LDA $0664				;$B4ABEA  \
	STA PPU.vram_address			;$B4ABED   |
	SEP #$20				;$B4ABF0   |
	LDA #$01				;$B4ABF2   |
	STA DMA[0].settings			;$B4ABF4   |
	LDA #$18				;$B4ABF7   |
	STA DMA[0].destination			;$B4ABF9   |
	LDX #$4600				;$B4ABFC   |
	STX DMA[0].source			;$B4ABFF   |
	LDA #$7E				;$B4AC02   |
	STA DMA[0].source_bank			;$B4AC04   |
	LDX #$0180				;$B4AC07   |
	STX DMA[0].size				;$B4AC0A   |
	STZ DMA[0].unused_1			;$B4AC0D   |
	LDA #$01				;$B4AC10   |
	STA CPU.enable_dma			;$B4AC12   |
	REP #$20				;$B4AC15   |
	PHK					;$B4AC17   |
	PLB					;$B4AC18   |
	JSR CODE_B4A1D4				;$B4AC19   |
	LDX #$07A5				;$B4AC1C   |
	JSR CODE_B4BD57				;$B4AC1F   |
	LDA $06A1				;$B4AC22   |
	ORA #$0200				;$B4AC25   |
	AND #$EFFF				;$B4AC28   |
	STA $06A1				;$B4AC2B   |
	LDA #$0001				;$B4AC2E   |
	STA $064E				;$B4AC31   |
	LDA #$0001				;$B4AC34   |
	JSR CODE_B4BD8D				;$B4AC37   |
CODE_B4AC3A:					;	   |
	LDA player_active_pressed		;$B4AC3A   |
	BIT #$D0C0				;$B4AC3D   |
	BEQ CODE_B4AC48				;$B4AC40   |
	LDA #$0001				;$B4AC42   |
	STA $064E				;$B4AC45   |
CODE_B4AC48:					;	   |
	JSR CODE_B4A0FD				;$B4AC48   |
	JSR CODE_B49EF1				;$B4AC4B   |
	JSL CODE_BAC7C0				;$B4AC4E   |
	LDA #$03FC				;$B4AC52   |
	STA $C8					;$B4AC55   |
	LDX #$07A5				;$B4AC57   |
	JSR CODE_B4BB62				;$B4AC5A   |
	JSL sprite_handler			;$B4AC5D   |
	JSR CODE_B4AE85				;$B4AC61   |
	RTL					;$B4AC64  /

CODE_B4AC65:
	PHK					;$B4AC65  \
	PLB					;$B4AC66   |
	SEP #$20				;$B4AC67   |
	LDA #$7E				;$B4AC69   |
	STA $CA					;$B4AC6B   |
	REP #$20				;$B4AC6D   |
	LDX #DATA_B4AC84			;$B4AC6F   |
	LDA language_select			;$B4AC72   |
	BEQ CODE_B4AC7A				;$B4AC75   |
	LDX #DATA_B4AD3B			;$B4AC77   |
CODE_B4AC7A:					;	   |
	LDA #$0018				;$B4AC7A   |
	LDY #$0000				;$B4AC7D   |
	JSR CODE_B4AE01				;$B4AC80   |
	RTL					;$B4AC83  /

DATA_B4AC84:
	db $00, $00, $00, $00, $00
	db " I've kidnapped that lumbering ", $00
	db " fool Donkey Kong and you will ", $00
	db "     never see him again.      ", $00
	db "       Har-har-har-har!        ", $00
	db $00
	db "                Kaptain K.Rool ", $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00

DATA_B4AD3B:
	db $00, $00, $00, $00, $00
	db " J'ai kidnapp~ ce gros lourdaud", $00
	db "  de Donkey Kong et vous ne le", $00
	db "        reverrez jamais.", $00
	db "           Ha ha ha!", $00
	db $00
	db "                 Kaptain K.Rool", $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00

CODE_B4ADDF:
	%pea_mask_dbr(DATA_F7FCC2)		;$B4ADDF  \
	PLB					;$B4ADE2   |
	PLB					;$B4ADE3   |
	RTS					;$B4ADE4  /

CODE_B4ADE5:
	%pea_mask_dbr(DATA_BAEF04)		;$B4ADE5  \
	PLB					;$B4ADE8   |
	PLB					;$B4ADE9   |
	RTS					;$B4ADEA  /

CODE_B4ADEB:
	PHA					;$B4ADEB  \
	LDA #$F700				;$B4ADEC   |
	STA $CF					;$B4ADEF   |
	PLA					;$B4ADF1   |
	JSR CODE_B4AE08				;$B4ADF2   |
	RTS					;$B4ADF5  /

CODE_B4ADF6:
	PHA					;$B4ADF6  \
	LDA #$BA00				;$B4ADF7   |
	STA $CF					;$B4ADFA   |
	PLA					;$B4ADFC   |
	JSR CODE_B4AE08				;$B4ADFD   |
	RTS					;$B4AE00  /

CODE_B4AE01:
	PHA					;$B4AE01  \
	PHK					;$B4AE02   |
	PHK					;$B4AE03   |
	PLA					;$B4AE04   |
	STA $CF					;$B4AE05   |
	PLA					;$B4AE07   |
CODE_B4AE08:					;	   |
	PHK					;$B4AE08   |
	PLB					;$B4AE09   |
	STA $0681				;$B4AE0A   |
	LDA #$7E00				;$B4AE0D   |
	STA $C9					;$B4AE10   |
	LDA #$3E00				;$B4AE12   |
	STA $C8					;$B4AE15   |
	STX $CE					;$B4AE17   |
CODE_B4AE19:					;	   |
	LDA #$0020				;$B4AE19   |
	STA $0685				;$B4AE1C   |
	LDA #$0020				;$B4AE1F   |
	XBA					;$B4AE22   |
CODE_B4AE23:					;	   |
	SEP #$20				;$B4AE23   |
	LDA [$CE]				;$B4AE25   |
	BEQ CODE_B4AE39				;$B4AE27   |
	SEC					;$B4AE29   |
	SBC #$20				;$B4AE2A   |
	REP #$20				;$B4AE2C   |
	STA [$C8],y				;$B4AE2E   |
	INY					;$B4AE30   |
	INY					;$B4AE31   |
	INC $CE					;$B4AE32   |
	DEC $0685				;$B4AE34   |
	BRA CODE_B4AE23				;$B4AE37  /

CODE_B4AE39:
	REP #$20				;$B4AE39  \
	INC $CE					;$B4AE3B   |
	LDA $0685				;$B4AE3D   |
	BEQ CODE_B4AE4E				;$B4AE40   |
	AND #$FF00				;$B4AE42   |
CODE_B4AE45:					;	   |
	STA [$C8],y				;$B4AE45   |
	INY					;$B4AE47   |
	INY					;$B4AE48   |
	DEC $0685				;$B4AE49   |
	BNE CODE_B4AE45				;$B4AE4C   |
CODE_B4AE4E:					;	   |
	REP #$20				;$B4AE4E   |
	DEC $0681				;$B4AE50   |
	BNE CODE_B4AE19				;$B4AE53   |
	LDX $CE					;$B4AE55   |
	RTS					;$B4AE57  /

if !version == 1
CODE_B4AE58:
	LDA $08CE				;$B4AE58  \
	BEQ CODE_B4AE84				;$B4AE5B   |
	DEC A					;$B4AE5D   |
	CMP $08D0				;$B4AE5E   |
	BCC CODE_B4AE84				;$B4AE61   |
	LDA $08D0				;$B4AE63   |
	CMP.l DATA_B4BED7			;$B4AE66   |
	BNE CODE_B4AE71				;$B4AE6A   |
	LDA #$0063				;$B4AE6C   |
	BRA CODE_B4AE81				;$B4AE6F  /

CODE_B4AE71:
	CMP.l DATA_B4BEDF			;$B4AE71  \
	BNE CODE_B4AE7D				;$B4AE75   |
	LDA.l DATA_B4BED7			;$B4AE77   |
	BRA CODE_B4AE81				;$B4AE7B  /

CODE_B4AE7D:
	LDA.l DATA_B4BEDF			;$B4AE7D  \
CODE_B4AE81:					;	   |
	STA $08D0				;$B4AE81   |
CODE_B4AE84:					;	   |
	RTS					;$B4AE84  /
endif

CODE_B4AE85:
	PHB					;$B4AE85  \
	PHK					;$B4AE86   |
	PLB					;$B4AE87   |
	LDA #$0200				;$B4AE88   |
	STA $70					;$B4AE8B   |
	LDA #$0400				;$B4AE8D   |
	STA $56					;$B4AE90   |
	LDA #$003C				;$B4AE92   |
	STA $78					;$B4AE95   |
	LDA $0689				;$B4AE97   |
	CMP #$0004				;$B4AE9A   |
	BNE CODE_B4AEA6				;$B4AE9D   |
	STZ $096F				;$B4AE9F   |
	JSL CODE_BEC695				;$B4AEA2   |
CODE_B4AEA6:					;	   |
	JSL CODE_B59F40				;$B4AEA6   |
	STZ $1730				;$B4AEAA   |
	PLB					;$B4AEAD   |
	RTS					;$B4AEAE  /

CODE_B4AEAF:
	PHX					;$B4AEAF  \
	JSR CODE_B4AEC3				;$B4AEB0   |
	LDX #$064E				;$B4AEB3   |
	LDA #$0012				;$B4AEB6   |
CODE_B4AEB9:					;	   |
	STZ $0000,x				;$B4AEB9   |
	INX					;$B4AEBC   |
	INX					;$B4AEBD   |
	DEC A					;$B4AEBE   |
	BNE CODE_B4AEB9				;$B4AEBF   |
	PLX					;$B4AEC1   |
	RTL					;$B4AEC2  /

CODE_B4AEC3:
	PHX					;$B4AEC3  \
	LDX #$06CF				;$B4AEC4   |
	LDA #$00C0				;$B4AEC7   |
CODE_B4AECA:					;	   |
	STZ $0000,x				;$B4AECA   |
	INX					;$B4AECD   |
	DEC A					;$B4AECE   |
	BNE CODE_B4AECA				;$B4AECF   |
	PLX					;$B4AED1   |
	RTS					;$B4AED2  /

CODE_B4AED3:
	PHX					;$B4AED3  \
	LDX #$06CF				;$B4AED4   |
	LDA #$0062				;$B4AED7   |
CODE_B4AEDA:					;	   |
	STZ $0000,x				;$B4AEDA   |
	INX					;$B4AEDD   |
	DEC A					;$B4AEDE   |
	BNE CODE_B4AEDA				;$B4AEDF   |
	PLX					;$B4AEE1   |
	RTS					;$B4AEE2  /

CODE_B4AEE3:
	PHP					;$B4AEE3  \
	LDX $06AF				;$B4AEE4   |
	REP #$20				;$B4AEE7   |
	LDA $06A1				;$B4AEE9   |
	BIT #$0004				;$B4AEEC   |
	BEQ CODE_B4AF14				;$B4AEEF   |
	LDA $06B5				;$B4AEF1   |
	CMP $0005,x				;$B4AEF4   |
	BNE CODE_B4AF75				;$B4AEF7   |
	LDA $06B7				;$B4AEF9   |
	CMP $0007,x				;$B4AEFC   |
	BNE CODE_B4AF75				;$B4AEFF   |
	DEC $06C5				;$B4AF01   |
	BEQ CODE_B4AF40				;$B4AF04   |
	DEC $06AF				;$B4AF06   |
	DEC $06AF				;$B4AF09   |
	DEC $06AF				;$B4AF0C   |
	DEC $06AF				;$B4AF0F   |
	BRA CODE_B4AF35				;$B4AF12  /

CODE_B4AF14:
	LDA $06B5				;$B4AF14  \
	CMP $0009,x				;$B4AF17   |
	BNE CODE_B4AF75				;$B4AF1A   |
	LDA $06B7				;$B4AF1C   |
	CMP $000B,x				;$B4AF1F   |
	BNE CODE_B4AF75				;$B4AF22   |
	DEC $06C5				;$B4AF24   |
	BEQ CODE_B4AF40				;$B4AF27   |
	INC $06AF				;$B4AF29   |
	INC $06AF				;$B4AF2C   |
	INC $06AF				;$B4AF2F   |
	INC $06AF				;$B4AF32   |
CODE_B4AF35:					;	   |
	LDA $06A1				;$B4AF35   |
	ORA #$0002				;$B4AF38   |
	STA $06A1				;$B4AF3B   |
	BRA CODE_B4AF6F				;$B4AF3E  /

CODE_B4AF40:
	STZ $06AF				;$B4AF40  \
	STZ $06AD				;$B4AF43   |
	LDA $06A1				;$B4AF46   |
	AND #$FFFB				;$B4AF49   |
	STA $06A1				;$B4AF4C   |
	LDA $06AB				;$B4AF4F   |
	CMP #$0052				;$B4AF52   |
	BEQ CODE_B4AF8F				;$B4AF55   |
	CMP #$0044				;$B4AF57   |
	BEQ CODE_B4AF8A				;$B4AF5A   |
	CMP #$004F				;$B4AF5C   |
	BEQ CODE_B4AF7C				;$B4AF5F   |
	CMP #$004E				;$B4AF61   |
	BEQ CODE_B4AF77				;$B4AF64   |
	LDA $06A3				;$B4AF66   |
	AND #$FFDF				;$B4AF69   |
	STA $06A3				;$B4AF6C   |
CODE_B4AF6F:					;	   |
	LDA #$0001				;$B4AF6F   |
	STA $0650				;$B4AF72   |
CODE_B4AF75:					;	   |
	PLP					;$B4AF75   |
	RTS					;$B4AF76  /

CODE_B4AF77:
	LDA #$0044				;$B4AF77  \
	BRA CODE_B4AF7F				;$B4AF7A  /

CODE_B4AF7C:
	LDA #$0052				;$B4AF7C  \
CODE_B4AF7F:					;	   |
	STA $06AB				;$B4AF7F   |
	LDA #$0004				;$B4AF82   |
	STA $06B1				;$B4AF85   |
	BRA CODE_B4AF9B				;$B4AF88  /

CODE_B4AF8A:
	LDA #$004E				;$B4AF8A  \
	BRA CODE_B4AF92				;$B4AF8D  /

CODE_B4AF8F:
	LDA #$004F				;$B4AF8F  \
CODE_B4AF92:					;	   |
	STA $06AB				;$B4AF92   |
	LDA #$0009				;$B4AF95   |
	STA $06B1				;$B4AF98   |
CODE_B4AF9B:					;	   |
	LDA $06A3				;$B4AF9B   |
	ORA #$0020				;$B4AF9E   |
	STA $06A3				;$B4AFA1   |
	LDA #$810F				;$B4AFA4   |
	JSL set_fade_global			;$B4AFA7   |
	BRA CODE_B4AF6F				;$B4AFAB  /

CODE_B4AFAD:
	STZ $069D				;$B4AFAD  \
	SEP #$20				;$B4AFB0   |
	LDA #$01				;$B4AFB2   |
	STA $064A				;$B4AFB4   |
	STZ $064B				;$B4AFB7   |
	REP #$20				;$B4AFBA   |
	LDA #$0172				;$B4AFBC   |
	STA $064C				;$B4AFBF   |
	RTL					;$B4AFC2  /

CODE_B4AFC3:
	SEP #$20				;$B4AFC3  \
	LDA $064A				;$B4AFC5   |
	REP #$20				;$B4AFC8   |
	BEQ CODE_B4AFEC				;$B4AFCA   |
	LDA $064C				;$B4AFCC   |
	BEQ CODE_B4AFD6				;$B4AFCF   |
	DEC $064C				;$B4AFD1   |
	BRA CODE_B4B024				;$B4AFD4  /

CODE_B4AFD6:
	INC $069D				;$B4AFD6  \
	LDA $069D				;$B4AFD9   |
	CLC					;$B4AFDC   |
	ADC #$0070				;$B4AFDD   |
	CMP $06B7				;$B4AFE0   |
	BNE CODE_B4B024				;$B4AFE3   |
	SEP #$20				;$B4AFE5   |
	STZ $064A				;$B4AFE7   |
	REP #$20				;$B4AFEA   |
CODE_B4AFEC:					;	   |
	LDA $06B5				;$B4AFEC   |
	CMP $06C7				;$B4AFEF   |
	BCS CODE_B4AFF9				;$B4AFF2   |
	LDA $06C7				;$B4AFF4   |
	BRA CODE_B4B001				;$B4AFF7  /

CODE_B4AFF9:
	CMP $06C9				;$B4AFF9  \
	BCC CODE_B4B001				;$B4AFFC   |
	LDA $06C9				;$B4AFFE   |
CODE_B4B001:					;	   |
	SEC					;$B4B001   |
	SBC #$0080				;$B4B002   |
	STA $069B				;$B4B005   |
	LDA $06B7				;$B4B008   |
	CMP $06CB				;$B4B00B   |
	BCS CODE_B4B015				;$B4B00E   |
	LDA $06CB				;$B4B010   |
	BRA CODE_B4B01D				;$B4B013  /

CODE_B4B015:
	CMP $06CD				;$B4B015  \
	BCC CODE_B4B01D				;$B4B018   |
	LDA $06CD				;$B4B01A   |
CODE_B4B01D:					;	   |
	SEC					;$B4B01D   |
	SBC #$0070				;$B4B01E   |
	STA $069D				;$B4B021   |
CODE_B4B024:					;	   |
	RTS					;$B4B024  /

CODE_B4B025:
	JSR CODE_B4B029				;$B4B025  \
	RTL					;$B4B028  /

CODE_B4B029:
	LDX $06AF				;$B4B029  \
	LDA $06A1				;$B4B02C   |
	AND #$FFFD				;$B4B02F   |
	STA $06A1				;$B4B032   |
	BIT #$0004				;$B4B035   |
	BEQ CODE_B4B045				;$B4B038   |
	LDA $0005,x				;$B4B03A   |
	SEC					;$B4B03D   |
	SBC $0009,x				;$B4B03E   |
	BPL CODE_B4B060				;$B4B041   |
	BRA CODE_B4B04E				;$B4B043  /

CODE_B4B045:
	LDA $0009,x				;$B4B045  \
	SEC					;$B4B048   |
	SBC $0005,x				;$B4B049   |
	BPL CODE_B4B060				;$B4B04C   |
CODE_B4B04E:					;	   |
	EOR #$FFFF				;$B4B04E   |
	CLC					;$B4B051   |
	ADC #$0001				;$B4B052   |
	STA $06C1				;$B4B055   |
	LDA #$FFFF				;$B4B058   |
	STA $06B9				;$B4B05B   |
	BRA CODE_B4B069				;$B4B05E  /

CODE_B4B060:
	STA $06C1				;$B4B060  \
	LDA #$0001				;$B4B063   |
	STA $06B9				;$B4B066   |
CODE_B4B069:					;	   |
	LDA $06A1				;$B4B069   |
	BIT #$0004				;$B4B06C   |
	BEQ CODE_B4B07C				;$B4B06F   |
	LDA $0007,x				;$B4B071   |
	SEC					;$B4B074   |
	SBC $000B,x				;$B4B075   |
	BPL CODE_B4B094				;$B4B078   |
	BRA CODE_B4B085				;$B4B07A  /

CODE_B4B07C:
	LDA $000B,x				;$B4B07C  \
	SEC					;$B4B07F   |
	SBC $0007,x				;$B4B080   |
	BPL CODE_B4B094				;$B4B083   |
CODE_B4B085:					;	   |
	EOR #$FFFF				;$B4B085   |
	INC A					;$B4B088   |
	STA $06C3				;$B4B089   |
	LDA #$FFFF				;$B4B08C   |
	STA $06BB				;$B4B08F   |
	BRA CODE_B4B09D				;$B4B092  /

CODE_B4B094:
	STA $06C3				;$B4B094  \
	LDA #$0001				;$B4B097   |
	STA $06BB				;$B4B09A   |
CODE_B4B09D:					;	   |
	LDA $06C1				;$B4B09D   |
	CMP $06C3				;$B4B0A0   |
	BEQ CODE_B4B0C5				;$B4B0A3   |
	BCC CODE_B4B0B6				;$B4B0A5   |
	LDA $06C1				;$B4B0A7   |
	LSR A					;$B4B0AA   |
	STA $06BD				;$B4B0AB   |
	LDA $06C3				;$B4B0AE   |
	STA $06BF				;$B4B0B1   |
	BRA CODE_B4B0CE				;$B4B0B4  /

CODE_B4B0B6:
	LDA $06C3				;$B4B0B6  \
	LSR A					;$B4B0B9   |
	STA $06BD				;$B4B0BA   |
	LDA $06C1				;$B4B0BD   |
	STA $06BF				;$B4B0C0   |
	BRA CODE_B4B0CE				;$B4B0C3  /

CODE_B4B0C5:
	LDA #$0001				;$B4B0C5  \
	STA $06BD				;$B4B0C8   |
	STZ $06BF				;$B4B0CB   |
CODE_B4B0CE:					;	   |
	RTS					;$B4B0CE  /

CODE_B4B0CF:
	PHB					;$B4B0CF  \
	PHP					;$B4B0D0   |
	%pea_mask_dbr($7E2A00)			;$B4B0D1   |
	PLB					;$B4B0D4   |
	PLB					;$B4B0D5   |
	STZ $0652				;$B4B0D6   |
	LDA #$006C				;$B4B0D9   |
	STA $0656				;$B4B0DC   |
	LDA #$0010				;$B4B0DF   |
	STA $0650				;$B4B0E2   |
	LDX #$2A00				;$B4B0E5   |
	SEP #$20				;$B4B0E8   |
	LDA #$7E				;$B4B0EA   |
	STA $D0					;$B4B0EC   |
	REP #$20				;$B4B0EE   |
	LDA #$5992				;$B4B0F0   |
	STA $CE					;$B4B0F3   |
	LDY #$0000				;$B4B0F5   |
CODE_B4B0F8:					;	   |
	LDA $0000,x				;$B4B0F8   |
	ROR A					;$B4B0FB   |
	ROR $0652				;$B4B0FC   |
	DEC $0650				;$B4B0FF   |
	BNE CODE_B4B111				;$B4B102   |
	LDA #$0010				;$B4B104   |
	STA $0650				;$B4B107   |
	LDA $0652				;$B4B10A   |
	STA [$CE],y				;$B4B10D   |
	INY					;$B4B10F   |
	INY					;$B4B110   |
CODE_B4B111:					;	   |
	INX					;$B4B111   |
	INX					;$B4B112   |
	INX					;$B4B113   |
	INX					;$B4B114   |
	DEC $0656				;$B4B115   |
	BNE CODE_B4B0F8				;$B4B118   |
	LDA $0650				;$B4B11A   |
	AND #$000F				;$B4B11D   |
	BEQ CODE_B4B131				;$B4B120   |
CODE_B4B122:					;	   |
	ROR $0652				;$B4B122   |
	DEC $0650				;$B4B125   |
	BNE CODE_B4B122				;$B4B128   |
	LDA $0652				;$B4B12A   |
	STA [$CE],y				;$B4B12D   |
	INY					;$B4B12F   |
	INY					;$B4B130   |
CODE_B4B131:					;	   |
	STZ $0652				;$B4B131   |
	LDA #$0078				;$B4B134   |
	STA $0656				;$B4B137   |
	LDA #$0008				;$B4B13A   |
	STA $0650				;$B4B13D   |
	LDX #$0000				;$B4B140   |
	LDY #$0000				;$B4B143   |
	LDA #$5972				;$B4B146   |
	STA $CE					;$B4B149   |
	LDY #$0000				;$B4B14B   |
CODE_B4B14E:					;	   |
	LDA $3200,x				;$B4B14E   |
	ROR A					;$B4B151   |
	ROR $0652				;$B4B152   |
	ROR A					;$B4B155   |
	ROR $0652				;$B4B156   |
	DEC $0650				;$B4B159   |
	BNE CODE_B4B16B				;$B4B15C   |
	LDA #$0008				;$B4B15E   |
	STA $0650				;$B4B161   |
	LDA $0652				;$B4B164   |
	STA [$CE],y				;$B4B167   |
	INY					;$B4B169   |
	INY					;$B4B16A   |
CODE_B4B16B:					;	   |
	INX					;$B4B16B   |
	INX					;$B4B16C   |
	INX					;$B4B16D   |
	INX					;$B4B16E   |
	DEC $0656				;$B4B16F   |
	BNE CODE_B4B14E				;$B4B172   |
	LDA $0650				;$B4B174   |
	AND #$0007				;$B4B177   |
	BEQ CODE_B4B18C				;$B4B17A   |
CODE_B4B17C:					;	   |
	ROR $0652				;$B4B17C   |
	ROR $0652				;$B4B17F   |
	DEC $0650				;$B4B182   |
	BNE CODE_B4B17C				;$B4B185   |
	LDA $0652				;$B4B187   |
	STA [$CE],y				;$B4B18A   |
CODE_B4B18C:					;	   |
	PLP					;$B4B18C   |
	PLB					;$B4B18D   |
	RTS					;$B4B18E  /

CODE_B4B18F:
	PHB					;$B4B18F  \
	STA $0650				;$B4B190   |
	SEP #$20				;$B4B193   |
	LDA #$7E				;$B4B195   |
	STA $D0					;$B4B197   |
	REP #$20				;$B4B199   |
	LDA #$5992				;$B4B19B   |
	STA $CE					;$B4B19E   |
	LDY #$0000				;$B4B1A0   |
	LDA [$CE],y				;$B4B1A3   |
	STA $0652				;$B4B1A5   |
	STY $064E				;$B4B1A8   |
	LDY #DATA_B4E6D8			;$B4B1AB   |
	STZ $0656				;$B4B1AE   |
	SEP #$20				;$B4B1B1   |
	LDA #<:wram_base			;$B4B1B3   |
	PHA					;$B4B1B5   |
	PLB					;$B4B1B6   |
	XBA					;$B4B1B7   |
	LDA #$B4				;$B4B1B8   |
	REP #$20				;$B4B1BA   |
	STA $0658				;$B4B1BC   |
	LDX #$2A00				;$B4B1BF   |
	BRA CODE_B4B1E1				;$B4B1C2  /

CODE_B4B1C4:
	LDA $0656				;$B4B1C4  \
	AND #$000F				;$B4B1C7   |
	BNE CODE_B4B1DE				;$B4B1CA   |
	STZ $0656				;$B4B1CC   |
	PHY					;$B4B1CF   |
	LDY $064E				;$B4B1D0   |
	INY					;$B4B1D3   |
	INY					;$B4B1D4   |
	STY $064E				;$B4B1D5   |
	LDA [$CE],y				;$B4B1D8   |
	STA $0652				;$B4B1DA   |
	PLY					;$B4B1DD   |
CODE_B4B1DE:					;	   |
	LDA $0658				;$B4B1DE   |
CODE_B4B1E1:					;	   |
	STZ $0000,x				;$B4B1E1   |
	LSR $0652				;$B4B1E4   |
	BCC CODE_B4B1EC				;$B4B1E7   |
	INC $0000,x				;$B4B1E9   |
CODE_B4B1EC:					;	   |
	INX					;$B4B1EC   |
	INX					;$B4B1ED   |
	PHA					;$B4B1EE   |
	PLB					;$B4B1EF   |
	LDA $0000,y				;$B4B1F0   |
	PLB					;$B4B1F3   |
	STA $0000,x				;$B4B1F4   |
	LDA $0658				;$B4B1F7   |
	INX					;$B4B1FA   |
	INX					;$B4B1FB   |
	INY					;$B4B1FC   |
	INY					;$B4B1FD   |
	INC $0656				;$B4B1FE   |
	DEC $0650				;$B4B201   |
	BNE CODE_B4B1C4				;$B4B204   |
	PLB					;$B4B206   |
	RTS					;$B4B207  /

CODE_B4B208:
	PHB					;$B4B208  \
	PHK					;$B4B209   |
	PLB					;$B4B20A   |
	LDX #$06CF				;$B4B20B   |
	LDA $0002,x				;$B4B20E   |
	BIT #$0008				;$B4B211   |
	BEQ CODE_B4B21C				;$B4B214   |
	JSR CODE_B4B3AB				;$B4B216   |
	BRL CODE_B4B3A9				;$B4B219  /

CODE_B4B21C:
	LDA $0000,x				;$B4B21C  \
	BEQ CODE_B4B226				;$B4B21F   |
	CMP #$0001				;$B4B221   |
	BNE CODE_B4B229				;$B4B224   |
CODE_B4B226:					;	   |
	BRL CODE_B4B362				;$B4B226  /

CODE_B4B229:
	LDA $06AB				;$B4B229  \
	ASL A					;$B4B22C   |
	ASL A					;$B4B22D   |
	CLC					;$B4B22E   |
	ADC #$3200				;$B4B22F   |
	STA $C8					;$B4B232   |
	LDA #$0E01				;$B4B234   |
	CMP [$C8]				;$B4B237   |
	BEQ CODE_B4B242				;$B4B239   |
	LDA #$1001				;$B4B23B   |
	CMP [$C8]				;$B4B23E   |
	BNE CODE_B4B293				;$B4B240   |
CODE_B4B242:					;	   |
	SEP #$20				;$B4B242   |
	LDA $0000,x				;$B4B244   |
	BEQ CODE_B4B2C3				;$B4B247   |
	STA [$C8]				;$B4B249   |
	CMP #$02				;$B4B24B   |
	BCC CODE_B4B2C3				;$B4B24D   |
	REP #$20				;$B4B24F   |
	LDA level_number			;$B4B251   |
	CMP #$006B				;$B4B253   |
	BNE CODE_B4B29C				;$B4B256   |
CODE_B4B258:					;	   |
	TXY					;$B4B258   |
	LDX #$0000				;$B4B259   |
	LDA #$0005				;$B4B25C   |
	STA $0650				;$B4B25F   |
CODE_B4B262:					;	   |
	LDA.l DATA_B4C48C,x			;$B4B262   |
	AND #$00FF				;$B4B266   |
	ASL A					;$B4B269   |
	ASL A					;$B4B26A   |
	CLC					;$B4B26B   |
	ADC #$3200				;$B4B26C   |
	STA $C8					;$B4B26F   |
	LDA #$1001				;$B4B271   |
	CMP [$C8]				;$B4B274   |
	BNE CODE_B4B27D				;$B4B276   |
	LDA $0000,y				;$B4B278   |
	STA [$C8]				;$B4B27B   |
CODE_B4B27D:					;	   |
	INX					;$B4B27D   |
	DEC $0650				;$B4B27E   |
	BNE CODE_B4B262				;$B4B281   |
	JSR CODE_B4B0CF				;$B4B283   |
	LDA #CODE_B49126			;$B4B286   |
	STA $067D				;$B4B289   |
	LDA #CODE_808CD9			;$B4B28C   |
	JML set_nmi_pointer			;$B4B28F  /

CODE_B4B293:
	LDA level_number			;$B4B293  \
	CMP #$006B				;$B4B295   |
	BNE CODE_B4B2C3				;$B4B298   |
	BRA CODE_B4B258				;$B4B29A  /

CODE_B4B29C:
	CMP #$00C4				;$B4B29C  \
	BCC CODE_B4B2A9				;$B4B29F   |
	CMP #$00C9				;$B4B2A1   |
	BCS CODE_B4B2A9				;$B4B2A4   |
	INC $08F9				;$B4B2A6   |
CODE_B4B2A9:					;	   |
	LDA $06D1				;$B4B2A9   |
	BIT #$0001				;$B4B2AC   |
	BEQ CODE_B4B2C3				;$B4B2AF   |
	LDA $06A9				;$B4B2B1   |
	ASL A					;$B4B2B4   |
	ASL A					;$B4B2B5   |
	CLC					;$B4B2B6   |
	ADC #$3200				;$B4B2B7   |
	STA $C8					;$B4B2BA   |
	LDA $0000,x				;$B4B2BC   |
	SEP #$20				;$B4B2BF   |
	STA [$C8]				;$B4B2C1   |
CODE_B4B2C3:					;	   |
	REP #$20				;$B4B2C3   |
	LDY #$06D7				;$B4B2C5   |
	LDA $0000,y				;$B4B2C8   |
	BNE CODE_B4B2D6				;$B4B2CB   |
	STZ $0792				;$B4B2CD   |
	STZ $06AD				;$B4B2D0   |
	BRL CODE_B4B362				;$B4B2D3  /

CODE_B4B2D6:
	STA $0656				;$B4B2D6  \
	CMP #$0001				;$B4B2D9   |
	BEQ CODE_B4B2E1				;$B4B2DC   |
	JSR CODE_B4B3AB				;$B4B2DE   |
CODE_B4B2E1:					;	   |
	LDA $0004,y				;$B4B2E1   |
	TAX					;$B4B2E4   |
	LDA DATA_B4C18B,x			;$B4B2E5   |
	AND #$00FF				;$B4B2E8   |
	STA $0652				;$B4B2EB   |
	JSR CODE_B4B3B8				;$B4B2EE   |
	LDA $0002,y				;$B4B2F1   |
	TAX					;$B4B2F4   |
	LDA DATA_B4C18B,x			;$B4B2F5   |
	AND #$00FF				;$B4B2F8   |
	STA $0650				;$B4B2FB   |
	JSR CODE_B4B3B8				;$B4B2FE   |
	PHY					;$B4B301   |
	INC $C8					;$B4B302   |
	INC $C8					;$B4B304   |
	LDA [$C8]				;$B4B306   |
	TAX					;$B4B308   |
	LDA #$0004				;$B4B309   |
	STA $0658				;$B4B30C   |
	LDA $0005,x				;$B4B30F   |
CODE_B4B312:					;	   |
	LSR A					;$B4B312   |
	BCS CODE_B4B31B				;$B4B313   |
CODE_B4B315:					;	   |
	DEC $0658				;$B4B315   |
	BNE CODE_B4B312				;$B4B318   |
	STP					;$B4B31A   |
CODE_B4B31B:					;	   |
	LDY $000B,x				;$B4B31B   |
	CPY $0652				;$B4B31E   |
	BEQ CODE_B4B329				;$B4B321   |
	INX					;$B4B323   |
	INX					;$B4B324   |
	INX					;$B4B325   |
	INX					;$B4B326   |
	BRA CODE_B4B315				;$B4B327  /

CODE_B4B329:
	BIT #$0080				;$B4B329  \
	BEQ CODE_B4B336				;$B4B32C   |
	LDA $06A1				;$B4B32E   |
	ORA #$0004				;$B4B331   |
	BRA CODE_B4B33C				;$B4B334  /

CODE_B4B336:
	LDA $06A1				;$B4B336  \
	AND #$FFFB				;$B4B339   |
CODE_B4B33C:					;	   |
	STA $06A1				;$B4B33C   |
	STY $06AD				;$B4B33F   |
	LDA $000D,x				;$B4B342   |
	STA $0792				;$B4B345   |
	ASL A					;$B4B348   |
	ASL A					;$B4B349   |
	CLC					;$B4B34A   |
	ADC #$2A00				;$B4B34B   |
	STA $C8					;$B4B34E   |
	LDA #$0001				;$B4B350   |
	STA [$C8]				;$B4B353   |
	PLY					;$B4B355   |
	INY					;$B4B356   |
	INY					;$B4B357   |
	INY					;$B4B358   |
	INY					;$B4B359   |
	DEC $0656				;$B4B35A   |
	BEQ CODE_B4B36B				;$B4B35D   |
	BRL CODE_B4B2E1				;$B4B35F  /

CODE_B4B362:
	LDA $06A1				;$B4B362  \
	AND #$FFFB				;$B4B365   |
	STA $06A1				;$B4B368   |
CODE_B4B36B:					;	   |
	LDA $06D1				;$B4B36B   |
	BIT #$0001				;$B4B36E   |
	BEQ CODE_B4B376				;$B4B371   |
	STZ $06B1				;$B4B373   |
CODE_B4B376:					;	   |
	LDA $06D1				;$B4B376   |
	BIT #$0002				;$B4B379   |
	BNE CODE_B4B386				;$B4B37C   |
	LDA $08FC				;$B4B37E   |
	BIT #$0001				;$B4B381   |
	BEQ CODE_B4B392				;$B4B384   |
CODE_B4B386:					;	   |
	LDA #$0040				;$B4B386   |
	TSB $06A3				;$B4B389   |
	STZ $06AF				;$B4B38C   |
	STZ $06AD				;$B4B38F   |
CODE_B4B392:					;	   |
	LDA $06D1				;$B4B392   |
	BIT #$0004				;$B4B395   |
	BEQ CODE_B4B3A9				;$B4B398   |
	LDA $06A5				;$B4B39A   |
	ORA #$0010				;$B4B39D   |
	STA $06A5				;$B4B3A0   |
	LDA #$00C8				;$B4B3A3   |
	STA $0683				;$B4B3A6   |
CODE_B4B3A9:					;	   |
	PLB					;$B4B3A9   |
	RTS					;$B4B3AA  /

CODE_B4B3AB:
	LDA #$0040				;$B4B3AB  \
	TSB $06A3				;$B4B3AE   |
	STZ $06AF				;$B4B3B1   |
	STZ $06AD				;$B4B3B4   |
	RTS					;$B4B3B7  /

CODE_B4B3B8:
	ASL A					;$B4B3B8  \
	ASL A					;$B4B3B9   |
	CLC					;$B4B3BA   |
	ADC #$3200				;$B4B3BB   |
	STA $C8					;$B4B3BE   |
	SEP #$20				;$B4B3C0   |
	LDA [$C8]				;$B4B3C2   |
	BNE CODE_B4B3CA				;$B4B3C4   |
	LDA #$01				;$B4B3C6   |
	STA [$C8]				;$B4B3C8   |
CODE_B4B3CA:					;	   |
	REP #$20				;$B4B3CA   |
	RTS					;$B4B3CC  /

CODE_B4B3CD:
	SEP #$20				;$B4B3CD  \
	LDA #$7E				;$B4B3CF   |
	STA $D0					;$B4B3D1   |
	REP #$20				;$B4B3D3   |
	LDA #$5972				;$B4B3D5   |
	STA $CE					;$B4B3D8   |
	LDA #$0010				;$B4B3DA   |
	STA $0650				;$B4B3DD   |
	STA $0652				;$B4B3E0   |
	LDA #$0000				;$B4B3E3   |
	LDY #$0000				;$B4B3E6   |
CODE_B4B3E9:					;	   |
	STA [$CE],y				;$B4B3E9   |
	INY					;$B4B3EB   |
	INY					;$B4B3EC   |
	DEC $0650				;$B4B3ED   |
	BNE CODE_B4B3E9				;$B4B3F0   |
	LDA #$5992				;$B4B3F2   |
	STA $CE					;$B4B3F5   |
	LDA #$0000				;$B4B3F7   |
	LDY #$0000				;$B4B3FA   |
CODE_B4B3FD:					;	   |
	STA [$CE],y				;$B4B3FD   |
	INY					;$B4B3FF   |
	INY					;$B4B400   |
	DEC $0652				;$B4B401   |
	BNE CODE_B4B3FD				;$B4B404   |
	LDA #$5972				;$B4B406   |
	STA $CE					;$B4B409   |
	LDA #$0000				;$B4B40B   |
	STA [$CE]				;$B4B40E   |
	LDA #$5992				;$B4B410   |
	STA $CE					;$B4B413   |
	LDA #$0000				;$B4B415   |
	STA [$CE]				;$B4B418   |
	JSR CODE_B4AED3				;$B4B41A   |
	LDA #$0000				;$B4B41D   |
	STA $06B1				;$B4B420   |
	LDA #$0000				;$B4B423   |
	STA $06AB				;$B4B426   |
	JSR CODE_B4B42D				;$B4B429   |
	RTS					;$B4B42C  /

CODE_B4B42D:
	STZ $06AF				;$B4B42D  \
	STZ $0792				;$B4B430   |
	LDA $06A3				;$B4B433   |
	AND #$1060				;$B4B436   |
	STA $06A3				;$B4B439   |
	RTS					;$B4B43C  /

CODE_B4B43D:
	SEP #$20				;$B4B43D   |
	LDA #$7E				;$B4B43F   |
	STA $D0					;$B4B441   |
	REP #$20				;$B4B443   |
	LDA #$5972				;$B4B445   |
	STA $CE					;$B4B448   |
	LDA #$0010				;$B4B44A   |
	STA $0650				;$B4B44D   |
	STA $0652				;$B4B450   |
	LDA #$5555				;$B4B453   |
	LDY #$0000				;$B4B456   |
CODE_B4B459:					;	   |
	STA [$CE],y				;$B4B459   |
	INY					;$B4B45B   |
	INY					;$B4B45C   |
	DEC $0650				;$B4B45D   |
	BNE CODE_B4B459				;$B4B460   |
	LDA #$5992				;$B4B462   |
	STA $CE					;$B4B465   |
	LDA #$FFFF				;$B4B467   |
	LDY #$0000				;$B4B46A   |
CODE_B4B46D:					;	   |
	STA [$CE],y				;$B4B46D   |
	INY					;$B4B46F   |
	INY					;$B4B470   |
	DEC $0652				;$B4B471   |
	BNE CODE_B4B46D				;$B4B474   |
	JSR CODE_B4B42D				;$B4B476   |
	JSL CODE_80897C				;$B4B479   |
	JSL CODE_B4AEAF				;$B4B47D   |
	LDA #CODE_8087D9			;$B4B481   |
	STA gamemode_pointer			;$B4B484   |
	LDA #simple_gamemode_nmi		;$B4B486   |
	JML set_nmi_pointer			;$B4B489  /

CODE_B4B48D:
	JSR CODE_B4AED3				;$B4B48D   |
	LDA #$0032				;$B4B490   |
	STA $08BE				;$B4B493   |
	LDA #$0063				;$B4B496   |
	STA $08CA				;$B4B499   |
	LDA #CODE_8087D9			;$B4B49C   |
	STA gamemode_pointer			;$B4B49F   |
	JSR CODE_B4B42D				;$B4B4A1   |
	JSL CODE_80897C				;$B4B4A4   |
	JSL CODE_B4AEAF				;$B4B4A8   |
	LDA #simple_gamemode_nmi		;$B4B4AC   |
	JML set_nmi_pointer			;$B4B4AF  /

CODE_B4B4B3:					;	  \
	STZ $06B1				;$B4B4B3   |
	STZ $06A9				;$B4B4B6   |
	STZ $06AB				;$B4B4B9   |
	JSL CODE_80897C				;$B4B4BC   |
	JSR CODE_B4B42D				;$B4B4C0   |
	JSL CODE_B4AEAF				;$B4B4C3   |
	LDA #CODE_8087D9			;$B4B4C7   |
	STA gamemode_pointer			;$B4B4CA   |
	LDA #simple_gamemode_nmi		;$B4B4CC   |
	JML set_nmi_pointer			;$B4B4CF  /

CODE_B4B4D3:
	PHB					;$B4B4D3  \
	STA $0650				;$B4B4D4   |
	SEP #$20				;$B4B4D7   |
	LDA #$7E				;$B4B4D9   |
	STA $D0					;$B4B4DB   |
	REP #$20				;$B4B4DD   |
	LDA #$5972				;$B4B4DF   |
	STA $CE					;$B4B4E2   |
	STZ $0656				;$B4B4E4   |
	LDY #$0000				;$B4B4E7   |
	LDA [$CE],y				;$B4B4EA   |
	STA $0652				;$B4B4EC   |
	STY $064E				;$B4B4EF   |
	LDY #DATA_B4CF4B			;$B4B4F2   |
	SEP #$20				;$B4B4F5   |
	LDX #$3200				;$B4B4F7   |
	LDA #$7E				;$B4B4FA   |
	PHA					;$B4B4FC   |
	PLB					;$B4B4FD   |
	XBA					;$B4B4FE   |
	PHK					;$B4B4FF   |
	PLA					;$B4B500   |
	REP #$20				;$B4B501   |
	STA $0658				;$B4B503   |
	BRA CODE_B4B522				;$B4B506  /

CODE_B4B508:
	LDA $0656				;$B4B508  \
	AND #$0007				;$B4B50B   |
	BNE CODE_B4B522				;$B4B50E   |
	STZ $0656				;$B4B510   |
	PHY					;$B4B513   |
	LDY $064E				;$B4B514   |
	INY					;$B4B517   |
	INY					;$B4B518   |
	STY $064E				;$B4B519   |
	LDA [$CE],y				;$B4B51C   |
	STA $0652				;$B4B51E   |
	PLY					;$B4B521   |
CODE_B4B522:					;	   |
	LDA $0652				;$B4B522   |
	SEP #$20				;$B4B525   |
	AND #$03				;$B4B527   |
	CMP #$02				;$B4B529   |
	BCC CODE_B4B53D				;$B4B52B   |
	CMP #$02				;$B4B52D   |
	BEQ CODE_B4B537				;$B4B52F   |
	XBA					;$B4B531   |
	LDA #$02				;$B4B532   |
	XBA					;$B4B534   |
	BRA CODE_B4B546				;$B4B535  /

CODE_B4B537:
	XBA					;$B4B537  \
	LDA #$00				;$B4B538   |
	XBA					;$B4B53A   |
	BRA CODE_B4B546				;$B4B53B  /

CODE_B4B53D:
	XBA					;$B4B53D  \
	PHB					;$B4B53E   |
	PHK					;$B4B53F   |
	PLB					;$B4B540   |
	LDA $0000,y				;$B4B541   |
	PLB					;$B4B544   |
	XBA					;$B4B545   |
CODE_B4B546:					;	   |
	INY					;$B4B546   |
	REP #$20				;$B4B547   |
	STA $0000,x				;$B4B549   |
	LSR $0652				;$B4B54C   |
	LSR $0652				;$B4B54F   |
	INX					;$B4B552   |
	INX					;$B4B553   |
	LDA $0658				;$B4B554   |
	PHA					;$B4B557   |
	PLB					;$B4B558   |
	LDA $0000,y				;$B4B559   |
	PLB					;$B4B55C   |
	STA $0000,x				;$B4B55D   |
	LDA $0658				;$B4B560   |
	INX					;$B4B563   |
	INX					;$B4B564   |
	INY					;$B4B565   |
	INY					;$B4B566   |
	INC $0656				;$B4B567   |
	DEC $0650				;$B4B56A   |
	BNE CODE_B4B508				;$B4B56D   |
	PLB					;$B4B56F   |
	RTS					;$B4B570  /

DATA_B4B571:
	db $01, $00, $04, $00, $10, $00, $40, $00
DATA_B4B579:
	db $00, $01, $00, $04, $00, $10, $00, $40
DATA_B4B581:
	db $FE, $FF, $FB, $FF, $EF, $FF, $BF, $FF
DATA_B4B589:
	db $FF, $FE, $FF, $FB, $FF, $EF, $FF, $BF

	PHP					;$B4B591   |
	REP #$20				;$B4B592   |
	PHY					;$B4B594   |
	PHB					;$B4B595   |
	PHK					;$B4B596   |
	PLB					;$B4B597   |
	LDA $0000,x				;$B4B598   |
	AND #$00FF				;$B4B59B   |
	STA $0656				;$B4B59E   |
	LDY $0001,x				;$B4B5A1   |
	STY $064E				;$B4B5A4   |
CODE_B4B5A7:					;	   |
	LDA $000B,x				;$B4B5A7   |
	SEC					;$B4B5AA   |
	SBC $069D				;$B4B5AB   |
	CMP #$00E0				;$B4B5AE   |
	BCC CODE_B4B5B8				;$B4B5B1   |
	CMP #$FFF9				;$B4B5B3   |
	BCC CODE_B4B61D				;$B4B5B6   |
CODE_B4B5B8:					;	   |
	STA $0652				;$B4B5B8   |
	LDA $0009,x				;$B4B5BB   |
	SEC					;$B4B5BE   |
	SBC $069B				;$B4B5BF   |
	CMP #$0100				;$B4B5C2   |
	BCC CODE_B4B5CC				;$B4B5C5   |
	CMP #$FFF9				;$B4B5C7   |
	BCC CODE_B4B61D				;$B4B5CA   |
CODE_B4B5CC:					;	   |
	STA $0650				;$B4B5CC   |
	CMP #$0000				;$B4B5CF   |
	BPL CODE_B4B5EA				;$B4B5D2   |
	JSR CODE_B4B62D				;$B4B5D4   |
	PHY					;$B4B5D7   |
	TAY					;$B4B5D8   |
	LDA DATA_B4B571,y			;$B4B5D9   |
	ORA $0654				;$B4B5DC   |
	PLY					;$B4B5DF   |
	PHB					;$B4B5E0   |
	%pea_mask_dbr(wram_base)		;$B4B5E1   |
	PLB					;$B4B5E4   |
	PLB					;$B4B5E5   |
	STA oam_attribute.size,y		;$B4B5E6   |
	PLB					;$B4B5E9   |
CODE_B4B5EA:					;	   |
	SEP #$20				;$B4B5EA   |
	LDA $0652				;$B4B5EC   |
	XBA					;$B4B5EF   |
	LDA $0650				;$B4B5F0   |
	REP #$20				;$B4B5F3   |
	STA [$C8]				;$B4B5F5   |
	INC $C8					;$B4B5F7   |
	INC $C8					;$B4B5F9   |
	LDA $064E				;$B4B5FB   |
	STA [$C8]				;$B4B5FE   |
	DEC $06A7				;$B4B600   |
	LDA $C8					;$B4B603   |
	SEC					;$B4B605   |
	SBC #$0006				;$B4B606   |
	STA $C8					;$B4B609   |
	CLC					;$B4B60B   |
	ROR $0687				;$B4B60C   |
	ROR $0687				;$B4B60F   |
	BNE CODE_B4B61D				;$B4B612   |
	ROR $0687				;$B4B614   |
	DEC $0685				;$B4B617   |
	DEC $0685				;$B4B61A   |
CODE_B4B61D:					;	   |
	INX					;$B4B61D   |
	INX					;$B4B61E   |
	INX					;$B4B61F   |
	INX					;$B4B620   |
	DEC $0656				;$B4B621   |
	BEQ CODE_B4B629				;$B4B624   |
	BRL CODE_B4B5A7				;$B4B626  /

CODE_B4B629:
	PLB					;$B4B629  \
	PLY					;$B4B62A   |
	PLP					;$B4B62B   |
	RTS					;$B4B62C  /

CODE_B4B62D:
	LDA $C8					;$B4B62D  \
	SEC					;$B4B62F   |
	SBC #$0200				;$B4B630   |
	LSR A					;$B4B633   |
	LSR A					;$B4B634   |
	PHA					;$B4B635   |
	LSR A					;$B4B636   |
	LSR A					;$B4B637   |
	AND #$00FE				;$B4B638   |
	TAY					;$B4B63B   |
	PHB					;$B4B63C   |
	%pea_mask_dbr(wram_base)		;$B4B63D   |
	PLB					;$B4B640   |
	PLB					;$B4B641   |
	LDA oam_attribute.size,y		;$B4B642   |
	PLB					;$B4B645   |
	STA $0654				;$B4B646   |
	PLA					;$B4B649   |
	AND #$0007				;$B4B64A   |
	ASL A					;$B4B64D   |
	RTS					;$B4B64E  /

CODE_B4B64F:
	PHP					;$B4B64F  \
	PHB					;$B4B650   |
	PHY					;$B4B651   |
	PHK					;$B4B652   |
	PLB					;$B4B653   |
	REP #$20				;$B4B654   |
	STA $064E				;$B4B656   |
	LDA $0002,x				;$B4B659   |
	SEC					;$B4B65C   |
	SBC $069D				;$B4B65D   |
	CMP #$00E0				;$B4B660   |
	BCC CODE_B4B66D				;$B4B663   |
	CMP #$FFF1				;$B4B665   |
	BCS CODE_B4B66D				;$B4B668   |
	BRL CODE_B4B6F5				;$B4B66A  /

CODE_B4B66D:
	STA $0652				;$B4B66D  \
	LDA $0000,x				;$B4B670   |
	SEC					;$B4B673   |
	SBC $069B				;$B4B674   |
	CMP #$0100				;$B4B677   |
	BCC CODE_B4B681				;$B4B67A   |
	CMP #$FFF1				;$B4B67C   |
	BCC CODE_B4B6F5				;$B4B67F   |
CODE_B4B681:					;	   |
	STA $0650				;$B4B681   |
	CMP #$0000				;$B4B684   |
	BPL CODE_B4B69F				;$B4B687   |
	JSR CODE_B4B62D				;$B4B689   |
	PHY					;$B4B68C   |
	TAY					;$B4B68D   |
	LDA DATA_B4B571,y			;$B4B68E   |
	ORA $0654				;$B4B691   |
	PLY					;$B4B694   |
	PHB					;$B4B695   |
	%pea_mask_dbr(wram_base)		;$B4B696   |
	PLB					;$B4B699   |
	PLB					;$B4B69A   |
	STA oam_attribute.size,y		;$B4B69B   |
	PLB					;$B4B69E   |
CODE_B4B69F:					;	   |
	SEP #$20				;$B4B69F   |
	LDA $0652				;$B4B6A1   |
	XBA					;$B4B6A4   |
	LDA $0650				;$B4B6A5   |
	REP #$20				;$B4B6A8   |
	STA [$C8]				;$B4B6AA   |
	INC $C8					;$B4B6AC   |
	INC $C8					;$B4B6AE   |
	LDA $0003,x				;$B4B6B0   |
	AND #$3000				;$B4B6B3   |
	STA $0650				;$B4B6B6   |
	LDX $064E				;$B4B6B9   |
	LDA DATA_B4C491,x			;$B4B6BC   |
	AND #$CFFF				;$B4B6BF   |
	ORA $0650				;$B4B6C2   |
	STA [$C8]				;$B4B6C5   |
	LDA $C8					;$B4B6C7   |
	SEC					;$B4B6C9   |
	SBC #$0006				;$B4B6CA   |
	STA $C8					;$B4B6CD   |
	DEC $06A7				;$B4B6CF   |
	%pea_mask_dbr($7E041E)			;$B4B6D2   |
	PLB					;$B4B6D5   |
	PLB					;$B4B6D6   |
	LDY $0685				;$B4B6D7   |
	LDA $0687				;$B4B6DA   |
	ORA $0000,y				;$B4B6DD   |
	STA $0000,y				;$B4B6E0   |
	CLC					;$B4B6E3   |
	ROR $0687				;$B4B6E4   |
	ROR $0687				;$B4B6E7   |
	BNE CODE_B4B6F5				;$B4B6EA   |
	ROR $0687				;$B4B6EC   |
	DEC $0685				;$B4B6EF   |
	DEC $0685				;$B4B6F2   |
CODE_B4B6F5:					;	   |
	PLY					;$B4B6F5   |
	PLB					;$B4B6F6   |
	PLP					;$B4B6F7   |
	RTS					;$B4B6F8  /

CODE_B4B6F9:
	PHY					;$B4B6F9  \
	PHB					;$B4B6FA   |
	PHK					;$B4B6FB   |
	PLB					;$B4B6FC   |
	LDA $C8					;$B4B6FD   |
	PHA					;$B4B6FF   |
	LDA #$02EC				;$B4B700   |
	STA $C8					;$B4B703   |
	LDA $0002,x				;$B4B705   |
	SEC					;$B4B708   |
	SBC $069D				;$B4B709   |
	CMP #$00E0				;$B4B70C   |
	BCC CODE_B4B716				;$B4B70F   |
	CMP #$FFF1				;$B4B711   |
	BCC CODE_B4B764				;$B4B714   |
CODE_B4B716:					;	   |
	STA $0656				;$B4B716   |
	LDA $0000,x				;$B4B719   |
	SEC					;$B4B71C   |
	SBC $069B				;$B4B71D   |
	CMP #$0100				;$B4B720   |
	BCC CODE_B4B72A				;$B4B723   |
	CMP #$FFF1				;$B4B725   |
	BCC CODE_B4B764				;$B4B728   |
CODE_B4B72A:					;	   |
	STA $0650				;$B4B72A   |
	CMP #$0000				;$B4B72D   |
	BPL CODE_B4B748				;$B4B730   |
	JSR CODE_B4B62D				;$B4B732   |
	PHY					;$B4B735   |
	TAY					;$B4B736   |
	LDA DATA_B4B571,y			;$B4B737   |
	ORA $0654				;$B4B73A   |
	PLY					;$B4B73D   |
	PHB					;$B4B73E   |
	%pea_mask_dbr(wram_base)		;$B4B73F   |
	PLB					;$B4B742   |
	PLB					;$B4B743   |
	STA oam_attribute.size,y		;$B4B744   |
	PLB					;$B4B747   |
CODE_B4B748:					;	   |
	LDA #$0004				;$B4B748   |
	STA $0652				;$B4B74B   |
	LDA $0005,x				;$B4B74E   |
	STA $064E				;$B4B751   |
CODE_B4B754:					;	   |
	LSR $064E				;$B4B754   |
	BCS CODE_B4B76E				;$B4B757   |
	BRA CODE_B4B75F				;$B4B759  /

CODE_B4B75B:
	INX					;$B4B75B  \
	INX					;$B4B75C   |
	INX					;$B4B75D   |
	INX					;$B4B75E   |
CODE_B4B75F:					;	   |
	DEC $0652				;$B4B75F   |
	BNE CODE_B4B754				;$B4B762   |
CODE_B4B764:					;	   |
	PLA					;$B4B764   |
	STA $C8					;$B4B765   |
	PLB					;$B4B767   |
	PLY					;$B4B768   |
	RTS					;$B4B769  /

CODE_B4B76A:
	PHK					;$B4B76A  \
	PLB					;$B4B76B   |
	BRA CODE_B4B75B				;$B4B76C  /

CODE_B4B76E:
	LDA $000D,x				;$B4B76E  \
	ASL A					;$B4B771   |
	ASL A					;$B4B772   |
	TAY					;$B4B773   |
	%pea_mask_dbr($7E2A00)			;$B4B774   |
	PLB					;$B4B777   |
	PLB					;$B4B778   |
	LDA $2A00,y				;$B4B779   |
	BEQ CODE_B4B76A				;$B4B77C   |
	LDA $0652				;$B4B77E   |
	DEC A					;$B4B781   |
	ASL A					;$B4B782   |
	ASL A					;$B4B783   |
	PHK					;$B4B784   |
	PLB					;$B4B785   |
	TAY					;$B4B786   |
	SEP #$20				;$B4B787   |
	LDA DATA_B4C4A3,y			;$B4B789   |
	CLC					;$B4B78C   |
	ADC $0650				;$B4B78D   |
	STA $0654				;$B4B790   |
	LDA DATA_B4C4A4,y			;$B4B793   |
	CLC					;$B4B796   |
	ADC $0656				;$B4B797   |
	XBA					;$B4B79A   |
	LDA $0654				;$B4B79B   |
	REP #$20				;$B4B79E   |
	STA [$C8]				;$B4B7A0   |
	INC $C8					;$B4B7A2   |
	INC $C8					;$B4B7A4   |
	LDA DATA_B4C4A5,y			;$B4B7A6   |
	STA [$C8]				;$B4B7A9   |
	LDA $C8					;$B4B7AB   |
	SEC					;$B4B7AD   |
	SBC #$0006				;$B4B7AE   |
	STA $C8					;$B4B7B1   |
	CLC					;$B4B7B3   |
	ROR $0687				;$B4B7B4   |
	ROR $0687				;$B4B7B7   |
	BNE CODE_B4B7C5				;$B4B7BA   |
	ROR $0687				;$B4B7BC   |
	DEC $0685				;$B4B7BF   |
	DEC $0685				;$B4B7C2   |
CODE_B4B7C5:					;	   |
	DEC $06A7				;$B4B7C5   |
	BRA CODE_B4B75B				;$B4B7C8  /

CODE_B4B7CA:
	LDA global_frame_counter		;$B4B7CA  \
	BIT #$0007				;$B4B7CC   |
	BNE CODE_B4B815				;$B4B7CF   |
	LDA $091D				;$B4B7D1   |
	INC A					;$B4B7D4   |
	CMP #$0003				;$B4B7D5   |
	BCC CODE_B4B7DD				;$B4B7D8   |
	LDA #$0000				;$B4B7DA   |
CODE_B4B7DD:					;	   |
	STA $091D				;$B4B7DD   |
	ASL A					;$B4B7E0   |
	TAX					;$B4B7E1   |
	SEP #$20				;$B4B7E2   |
	LDA #$46				;$B4B7E4   |
	STA PPU.cgram_address			;$B4B7E6   |
	LDY #$0006				;$B4B7E9   |
CODE_B4B7EC:					;	   |
	LDA.l DATA_B4B816,x			;$B4B7EC   |
	STA PPU.cgram_write			;$B4B7F0   |
	INX					;$B4B7F3   |
	DEY					;$B4B7F4   |
	BNE CODE_B4B7EC				;$B4B7F5   |
	REP #$20				;$B4B7F7   |
	LDA $091D				;$B4B7F9   |
	ASL A					;$B4B7FC   |
	TAX					;$B4B7FD   |
	SEP #$20				;$B4B7FE   |
	LDA #$11				;$B4B800   |
	STA PPU.cgram_address			;$B4B802   |
	LDY #$0006				;$B4B805   |
CODE_B4B808:					;	   |
	LDA.l DATA_B4B820,x			;$B4B808   |
	STA PPU.cgram_write			;$B4B80C   |
	INX					;$B4B80F   |
	DEY					;$B4B810   |
	BNE CODE_B4B808				;$B4B811   |
	REP #$20				;$B4B813   |
CODE_B4B815:					;	   |
	RTS					;$B4B815  /

DATA_B4B816:
	db $C1, $00, $01, $18, $06, $00, $C1, $00
	db $01, $18

DATA_B4B820:
	db $E3, $03, $03, $7C, $1F, $00, $E3, $03
	db $03, $7C


CODE_B4B82A:
	RTS					;$B4B82A  /

CODE_B4B82B:
	LDA global_frame_counter		;$B4B82B  \
	SEP #$20				;$B4B82D   |
	STA PPU.layer_2_scroll_x		;$B4B82F   |
	STZ PPU.layer_2_scroll_x		;$B4B832   |
	REP #$20				;$B4B835   |
	LDA current_sprite			;$B4B837   |
	PHA					;$B4B839   |
	LDX $0798				;$B4B83A   |
	STX current_sprite			;$B4B83D   |
	LDA $06,x				;$B4B83F   |
	PHA					;$B4B841   |
	LDA $0A,x				;$B4B842   |
	PHA					;$B4B844   |
	DEC $0794				;$B4B845   |
	BNE CODE_B4B85F				;$B4B848   |
	LDA #$001E				;$B4B84A   |
	STA $0794				;$B4B84D   |
	LDA $26,x				;$B4B850   |
	EOR #$FFFF				;$B4B852   |
	INC A					;$B4B855   |
	STA $26,x				;$B4B856   |
	BPL CODE_B4B85F				;$B4B858   |
	LDA #$FF7F				;$B4B85A   |
	STA $06,x				;$B4B85D   |
CODE_B4B85F:					;	   |
	DEC $0796				;$B4B85F   |
	BNE CODE_B4B879				;$B4B862   |
	LDA #$0032				;$B4B864   |
	STA $0796				;$B4B867   |
	LDA $2A,x				;$B4B86A   |
	EOR #$FFFF				;$B4B86C   |
	INC A					;$B4B86F   |
	STA $2A,x				;$B4B870   |
	BPL CODE_B4B879				;$B4B872   |
	LDA #$0004				;$B4B874   |
	STA $0A,x				;$B4B877   |
CODE_B4B879:					;	   |
	LDA #$0004				;$B4B879   |
	JSL CODE_B8CFD4				;$B4B87C   |
	JSL CODE_B8CF7F				;$B4B880   |
	LDX $0798				;$B4B884   |
	LDY $0597				;$B4B887   |
	PLA					;$B4B88A   |
	SEC					;$B4B88B   |
	SBC $0A,x				;$B4B88C   |
	STA $0666				;$B4B88E   |
	LDA $000A,y				;$B4B891   |
	CLC					;$B4B894   |
	ADC $0666				;$B4B895   |
	STA $000A,y				;$B4B898   |
	LDY $0593				;$B4B89B   |
	LDA $000A,y				;$B4B89E   |
	CLC					;$B4B8A1   |
	ADC $0666				;$B4B8A2   |
	STA $000A,y				;$B4B8A5   |
	PLA					;$B4B8A8   |
	SEC					;$B4B8A9   |
	SBC $06,x				;$B4B8AA   |
	STA $0666				;$B4B8AC   |
	LDA $06,x				;$B4B8AF   |
	CLC					;$B4B8B1   |
	ADC $079A				;$B4B8B2   |
	LDA $0A,x				;$B4B8B5   |
	SEP #$20				;$B4B8B7   |
	STA PPU.layer_1_scroll_y		;$B4B8B9   |
	XBA					;$B4B8BC   |
	STA PPU.layer_1_scroll_y		;$B4B8BD   |
	REP #$20				;$B4B8C0   |
	PLA					;$B4B8C2   |
	STA current_sprite			;$B4B8C3   |
	RTS					;$B4B8C5  /

CODE_B4B8C6:
	%pea_mask_dbr($7E3202)			;$B4B8C6  \
	PLB					;$B4B8C9   |
	PLB					;$B4B8CA   |
	LDA $06AB				;$B4B8CB   |
	ASL A					;$B4B8CE   |
	ASL A					;$B4B8CF   |
	TAX					;$B4B8D0   |
	LDY $3202,x				;$B4B8D1   |
	PHK					;$B4B8D4   |
	PLB					;$B4B8D5   |
	LDX $0007,y				;$B4B8D6   |
	LDA $0009,y				;$B4B8D9   |
	JSR CODE_B4B8E0				;$B4B8DC   |
	RTS					;$B4B8DF  /

CODE_B4B8E0:
	PHB					;$B4B8E0  \
	PHK					;$B4B8E1   |
	PLB					;$B4B8E2   |
	STA $066E				;$B4B8E3   |
	LDA $06A1				;$B4B8E6   |
	BIT #$0040				;$B4B8E9   |
	BEQ CODE_B4B910				;$B4B8EC   |
	LDA $068B				;$B4B8EE   |
	STA $CB					;$B4B8F1   |
	LDA $068D				;$B4B8F3   |
	STA $0650				;$B4B8F6   |
	LDA $068F				;$B4B8F9   |
	STA $CE					;$B4B8FC   |
	LDA $0691				;$B4B8FE   |
	STA $0654				;$B4B901   |
	LDA $0693				;$B4B904   |
	STA $0652				;$B4B907   |
	LDY $0695				;$B4B90A   |
	BRL CODE_B4B9E0				;$B4B90D  /

CODE_B4B910:
	LDA $06A1				;$B4B910  \
	ORA #$0040				;$B4B913   |
	STA $06A1				;$B4B916   |
	LDA #$002B				;$B4B919   |
	STA $0654				;$B4B91C   |
	LDA $06B1				;$B4B91F   |
	ASL A					;$B4B922   |
	TAY					;$B4B923   |
	LDA DATA_B4C25E,y			;$B4B924   |
	TAY					;$B4B927   |
	LDA $000C,y				;$B4B928   |
	XBA					;$B4B92B   |
	LDY language_select			;$B4B92C   |
	BEQ CODE_B4B944				;$B4B92F   |
	PHA					;$B4B931   |
	LDA $0000,x				;$B4B932   |
	AND #$00FF				;$B4B935   |
	STA $066C				;$B4B938   |
	TXA					;$B4B93B   |
	CLC					;$B4B93C   |
	ADC $066C				;$B4B93D   |
	TAX					;$B4B940   |
	INX					;$B4B941   |
	INX					;$B4B942   |
	PLA					;$B4B943   |
CODE_B4B944:					;	   |
	PHX					;$B4B944   |
	PHA					;$B4B945   |
	SEP #$20				;$B4B946   |
	LDA $0000,x				;$B4B948   |
	STA $0650				;$B4B94B   |
	STA $0682				;$B4B94E   |
	STA $0652				;$B4B951   |
	REP #$20				;$B4B954   |
	LDA $06B1				;$B4B956   |
	BNE CODE_B4B965				;$B4B959   |
	LDA $06AB				;$B4B95B   |
	ASL A					;$B4B95E   |
	TAX					;$B4B95F   |
	LDA $07B2,x				;$B4B960   |
	BRA CODE_B4B96C				;$B4B963  /

CODE_B4B965:
	LDA $066E				;$B4B965  \
	JSL CODE_BB80B4				;$B4B968   |
CODE_B4B96C:					;	   |
	CMP #$0000				;$B4B96C   |
	BEQ CODE_B4B985				;$B4B96F   |
	SEP #$20				;$B4B971   |
	CMP #$00				;$B4B973   |
	BNE CODE_B4B985				;$B4B975   |
	INC $0652				;$B4B977   |
	INC $0682				;$B4B97A   |
	LDA $06A5				;$B4B97D   |
	ORA #$80				;$B4B980   |
	STA $06A5				;$B4B982   |
CODE_B4B985:					;	   |
	REP #$20				;$B4B985   |
	LDA $06B1				;$B4B987   |
	BNE CODE_B4B991				;$B4B98A   |
	JSR CODE_B4BB40				;$B4B98C   |
	BRA CODE_B4B998				;$B4B98F  /

CODE_B4B991:
	LDA $066E				;$B4B991  \
	JSL CODE_BB8138				;$B4B994   |
CODE_B4B998:					;	   |
	BEQ CODE_B4B9B6				;$B4B998   |
	SEP #$20				;$B4B99A   |
	INC $0652				;$B4B99C   |
	INC $0652				;$B4B99F   |
	INC $0652				;$B4B9A2   |
	INC $0682				;$B4B9A5   |
	INC $0682				;$B4B9A8   |
	REP #$20				;$B4B9AB   |
	LDA $06A5				;$B4B9AD   |
	ORA #$0500				;$B4B9B0   |
	STA $06A5				;$B4B9B3   |
CODE_B4B9B6:					;	   |
	REP #$20				;$B4B9B6   |
	PLA					;$B4B9B8   |
	PLX					;$B4B9B9   |
	SEP #$20				;$B4B9BA   |
	ASL $0682				;$B4B9BC   |
	ASL $0652				;$B4B9BF   |
	ASL $0652				;$B4B9C2   |
	ASL $0652				;$B4B9C5   |
	LDA #$FF				;$B4B9C8   |
	SEC					;$B4B9CA   |
	SBC $0652				;$B4B9CB   |
	LSR A					;$B4B9CE   |
	REP #$20				;$B4B9CF   |
	STA $0652				;$B4B9D1   |
	INX					;$B4B9D4   |
	INX					;$B4B9D5   |
	STX $CB					;$B4B9D6   |
	LDA #$3A00				;$B4B9D8   |
	STA $CE					;$B4B9DB   |
	LDY #$3E00				;$B4B9DD   |
CODE_B4B9E0:					;	   |
	LDA $06A1				;$B4B9E0   |
	BIT #$0080				;$B4B9E3   |
	BEQ CODE_B4B9F6				;$B4B9E6   |
	LDA $06A1				;$B4B9E8   |
	AND #$FF7F				;$B4B9EB   |
	STA $06A1				;$B4B9EE   |
	LDA #$03E7				;$B4B9F1   |
	BRA CODE_B4B9F9				;$B4B9F4  /

CODE_B4B9F6:
	LDA #$0005				;$B4B9F6  \
CODE_B4B9F9:					;	   |
	STA $0656				;$B4B9F9   |
	SEP #$20				;$B4B9FC   |
	LDA #$7E				;$B4B9FE   |
	STA $D0					;$B4BA00   |
	REP #$20				;$B4BA02   |
CODE_B4BA04:					;	   |
	LDA [$CB]				;$B4BA04   |
CODE_B4BA06:					;	   |
	AND #$00FF				;$B4BA06   |
	SEC					;$B4BA09   |
	SBC #$0021				;$B4BA0A   |
	BPL CODE_B4BA25				;$B4BA0D   |
	SEP #$20				;$B4BA0F   |
	DEC $0682				;$B4BA11   |
	DEC $0682				;$B4BA14   |
	REP #$20				;$B4BA17   |
	LDA $0652				;$B4BA19   |
	CLC					;$B4BA1C   |
	ADC #$0008				;$B4BA1D   |
	STA $0652				;$B4BA20   |
	BRA CODE_B4BA7C				;$B4BA23  /

CODE_B4BA25:
	TAX					;$B4BA25  \
	LDA DATA_B4C4B3,x			;$B4BA26   |
	AND #$00FF				;$B4BA29   |
	XBA					;$B4BA2C   |
	LSR A					;$B4BA2D   |
	LSR A					;$B4BA2E   |
	CLC					;$B4BA2F   |
	ADC #$0660				;$B4BA30   |
	TAX					;$B4BA33   |
	LDA #$003F				;$B4BA34   |
	PHB					;$B4BA37   |
	MVN $7E, $FC				;$B4BA38   |
	PLB					;$B4BA3B   |
	LDA $0652				;$B4BA3C   |
	STA [$CE]				;$B4BA3F   |
	INC $CE					;$B4BA41   |
	INC $CE					;$B4BA43   |
	LDA #$003C				;$B4BA45   |
	XBA					;$B4BA48   |
	ORA $0654				;$B4BA49   |
	STA [$CE]				;$B4BA4C   |
	INC $CE					;$B4BA4E   |
	INC $CE					;$B4BA50   |
	INC $0654				;$B4BA52   |
	LDA $0652				;$B4BA55   |
	CLC					;$B4BA58   |
	ADC #$0800				;$B4BA59   |
	STA [$CE]				;$B4BA5C   |
	INC $CE					;$B4BA5E   |
	INC $CE					;$B4BA60   |
	LDA #$003C				;$B4BA62   |
	XBA					;$B4BA65   |
	ORA $0654				;$B4BA66   |
	STA [$CE]				;$B4BA69   |
	INC $CE					;$B4BA6B   |
	INC $CE					;$B4BA6D   |
	INC $0654				;$B4BA6F   |
	LDA $0652				;$B4BA72   |
	CLC					;$B4BA75   |
	ADC #$0008				;$B4BA76   |
	STA $0652				;$B4BA79   |
CODE_B4BA7C:					;	   |
	INC $CB					;$B4BA7C   |
	DEC $0650				;$B4BA7E   |
	BEQ CODE_B4BAAC				;$B4BA81   |
	DEC $0656				;$B4BA83   |
	BEQ CODE_B4BA8B				;$B4BA86   |
	BRL CODE_B4BA04				;$B4BA88  /

CODE_B4BA8B:
	LDA $CB					;$B4BA8B  \
	STA $068B				;$B4BA8D   |
	LDA $0650				;$B4BA90   |
	STA $068D				;$B4BA93   |
	LDA $CE					;$B4BA96   |
	STA $068F				;$B4BA98   |
	LDA $0654				;$B4BA9B   |
	STA $0691				;$B4BA9E   |
	LDA $0652				;$B4BAA1   |
	STA $0693				;$B4BAA4   |
	STY $0695				;$B4BAA7   |
	BRA CODE_B4BB01				;$B4BAAA  /

CODE_B4BAAC:
	LDA $06A5				;$B4BAAC  \
	BIT #$0080				;$B4BAAF   |
	BEQ CODE_B4BAC3				;$B4BAB2   |
	AND #$FF7F				;$B4BAB4   |
	STA $06A5				;$B4BAB7   |
	INC $0650				;$B4BABA   |
	LDA #$0021				;$B4BABD   |
	BRL CODE_B4BA06				;$B4BAC0  /

CODE_B4BAC3:
	BIT #$0100				;$B4BAC3  \
	BEQ CODE_B4BAE1				;$B4BAC6   |
	AND #$FEFF				;$B4BAC8   |
	STA $06A5				;$B4BACB   |
	LDA $0652				;$B4BACE   |
	CLC					;$B4BAD1   |
	ADC #$0008				;$B4BAD2   |
	STA $0652				;$B4BAD5   |
	INC $0650				;$B4BAD8   |
	LDA #$0022				;$B4BADB   |
	BRL CODE_B4BA06				;$B4BADE  /

CODE_B4BAE1:
	BIT #$0400				;$B4BAE1  \
	BEQ CODE_B4BAF5				;$B4BAE4   |
	AND #$FBFF				;$B4BAE6   |
	STA $06A5				;$B4BAE9   |
	INC $0650				;$B4BAEC   |
	LDA #$0040				;$B4BAEF   |
	BRL CODE_B4BA06				;$B4BAF2  /

CODE_B4BAF5:
	INC $0681				;$B4BAF5  \
	LDA $06A1				;$B4BAF8   |
	AND #$FFBF				;$B4BAFB   |
	STA $06A1				;$B4BAFE   |
CODE_B4BB01:					;	   |
	PLB					;$B4BB01   |
	RTS					;$B4BB02  /

CODE_B4BB03:
	LDA #$0007				;$B4BB03  \
	STA $0650				;$B4BB06   |
	LDY #$0000				;$B4BB09   |
CODE_B4BB0C:					;	   |
	LDA #$0007				;$B4BB0C   |
	SEC					;$B4BB0F   |
	SBC $0650				;$B4BB10   |
	ASL A					;$B4BB13   |
	TAX					;$B4BB14   |
	LDA DATA_B4CE29,x			;$B4BB15   |
	TAX					;$B4BB18   |
	STZ $0674				;$B4BB19   |
	PHY					;$B4BB1C   |
CODE_B4BB1D:					;	   |
	LDA $0000,x				;$B4BB1D   |
	AND #$00FF				;$B4BB20   |
	BEQ CODE_B4BB31				;$B4BB23   |
	PHX					;$B4BB25   |
	JSL CODE_BB80B4				;$B4BB26   |
	PLX					;$B4BB2A   |
	TSB $0674				;$B4BB2B   |
	INX					;$B4BB2E   |
	BRA CODE_B4BB1D				;$B4BB2F  /

CODE_B4BB31:
	PLY					;$B4BB31  \
	LDA $0674				;$B4BB32   |
	STA $07B2,y				;$B4BB35   |
	INY					;$B4BB38   |
	INY					;$B4BB39   |
	DEC $0650				;$B4BB3A   |
	BNE CODE_B4BB0C				;$B4BB3D   |
	RTS					;$B4BB3F  /

CODE_B4BB40:
	LDA $06AB				;$B4BB40  \
	ASL A					;$B4BB43   |
	TAY					;$B4BB44   |
	LDX DATA_B4CE29,y			;$B4BB45   |
CODE_B4BB48:					;	   |
	LDA $0000,x				;$B4BB48   |
	AND #$00FF				;$B4BB4B   |
	BEQ CODE_B4BB5E				;$B4BB4E   |
	PHX					;$B4BB50   |
	JSL CODE_BB8138				;$B4BB51   |
	PLX					;$B4BB55   |
	CMP #$0000				;$B4BB56   |
	BEQ CODE_B4BB61				;$B4BB59   |
	INX					;$B4BB5B   |
	BRA CODE_B4BB48				;$B4BB5C  /

CODE_B4BB5E:
	LDA #$0001				;$B4BB5E  \
CODE_B4BB61:					;	   |
	RTS					;$B4BB61  /

CODE_B4BB62:
	REP #$20				;$B4BB62  \
	LDA $0689				;$B4BB64   |
	CMP #$0008				;$B4BB67   |
	BNE CODE_B4BB71				;$B4BB6A   |
	LDY #$1128				;$B4BB6C   |
	BRA CODE_B4BB74				;$B4BB6F  /

CODE_B4BB71:
	LDY #$0F28				;$B4BB71  \
CODE_B4BB74:					;	   |
	LDA $0002,x				;$B4BB74   |
	AND #$00FF				;$B4BB77   |
	BEQ CODE_B4BBC2				;$B4BB7A   |
	TYA					;$B4BB7C   |
	STA [$C8]				;$B4BB7D   |
	INC $C8					;$B4BB7F   |
	INC $C8					;$B4BB81   |
	LDA #$3E00				;$B4BB83   |
	SEP #$20				;$B4BB86   |
	LDA $0002,x				;$B4BB88   |
	CLC					;$B4BB8B   |
	ADC #$20				;$B4BB8C   |
	REP #$20				;$B4BB8E   |
	STA [$C8]				;$B4BB90   |
	LDA $C8					;$B4BB92   |
	SEC					;$B4BB94   |
	SBC #$0006				;$B4BB95   |
	STA $C8					;$B4BB98   |
	TYA					;$B4BB9A   |
	CLC					;$B4BB9B   |
	ADC #$0800				;$B4BB9C   |
	STA [$C8]				;$B4BB9F   |
	INC $C8					;$B4BBA1   |
	INC $C8					;$B4BBA3   |
	LDA #$3E00				;$B4BBA5   |
	SEP #$20				;$B4BBA8   |
	LDA $0002,x				;$B4BBAA   |
	CLC					;$B4BBAD   |
	ADC #$2A				;$B4BBAE   |
	REP #$20				;$B4BBB0   |
	STA [$C8]				;$B4BBB2   |
	LDA $C8					;$B4BBB4   |
	SEC					;$B4BBB6   |
	SBC #$0006				;$B4BBB7   |
	STA $C8					;$B4BBBA   |
	TYA					;$B4BBBC   |
	CLC					;$B4BBBD   |
	ADC #$0008				;$B4BBBE   |
	TAY					;$B4BBC1   |
CODE_B4BBC2:					;	   |
	LDA $0001,x				;$B4BBC2   |
	BEQ CODE_B4BC10				;$B4BBC5   |
	AND #$00FF				;$B4BBC7   |
	TYA					;$B4BBCA   |
	STA [$C8]				;$B4BBCB   |
	INC $C8					;$B4BBCD   |
	INC $C8					;$B4BBCF   |
	LDA #$3E00				;$B4BBD1   |
	SEP #$20				;$B4BBD4   |
	LDA $0001,x				;$B4BBD6   |
	CLC					;$B4BBD9   |
	ADC #$20				;$B4BBDA   |
	REP #$20				;$B4BBDC   |
	STA [$C8]				;$B4BBDE   |
	LDA $C8					;$B4BBE0   |
	SEC					;$B4BBE2   |
	SBC #$0006				;$B4BBE3   |
	STA $C8					;$B4BBE6   |
	TYA					;$B4BBE8   |
	CLC					;$B4BBE9   |
	ADC #$0800				;$B4BBEA   |
	STA [$C8]				;$B4BBED   |
	INC $C8					;$B4BBEF   |
	INC $C8					;$B4BBF1   |
	LDA #$3E00				;$B4BBF3   |
	SEP #$20				;$B4BBF6   |
	LDA $0001,x				;$B4BBF8   |
	CLC					;$B4BBFB   |
	ADC #$2A				;$B4BBFC   |
	REP #$20				;$B4BBFE   |
	STA [$C8]				;$B4BC00   |
	LDA $C8					;$B4BC02   |
	SEC					;$B4BC04   |
	SBC #$0006				;$B4BC05   |
	STA $C8					;$B4BC08   |
	TYA					;$B4BC0A   |
	CLC					;$B4BC0B   |
	ADC #$0008				;$B4BC0C   |
	TAY					;$B4BC0F   |
CODE_B4BC10:					;	   |
	TYA					;$B4BC10   |
	STA [$C8]				;$B4BC11   |
	INC $C8					;$B4BC13   |
	INC $C8					;$B4BC15   |
	LDA #$3E00				;$B4BC17   |
	SEP #$20				;$B4BC1A   |
	LDA $0000,x				;$B4BC1C   |
	CLC					;$B4BC1F   |
	ADC #$20				;$B4BC20   |
	REP #$20				;$B4BC22   |
	STA [$C8]				;$B4BC24   |
	LDA $C8					;$B4BC26   |
	SEC					;$B4BC28   |
	SBC #$0006				;$B4BC29   |
	STA $C8					;$B4BC2C   |
	TYA					;$B4BC2E   |
	CLC					;$B4BC2F   |
	ADC #$0800				;$B4BC30   |
	STA [$C8]				;$B4BC33   |
	INC $C8					;$B4BC35   |
	INC $C8					;$B4BC37   |
	LDA #$3E00				;$B4BC39   |
	SEP #$20				;$B4BC3C   |
	LDA $0000,x				;$B4BC3E   |
	CLC					;$B4BC41   |
	ADC #$2A				;$B4BC42   |
	REP #$20				;$B4BC44   |
	STA [$C8]				;$B4BC46   |
	LDA $C8					;$B4BC48   |
	SEC					;$B4BC4A   |
	SBC #$0006				;$B4BC4B   |
	STA $C8					;$B4BC4E   |
	RTS					;$B4BC50  /

CODE_B4BC51:
	TYA					;$B4BC51  \
	SEC					;$B4BC52   |
	SBC #$000C				;$B4BC53   |
	TAY					;$B4BC56   |
	LDA $0001,x				;$B4BC57   |
	AND #$00FF				;$B4BC5A   |
	BEQ CODE_B4BC65				;$B4BC5D   |
	TYA					;$B4BC5F   |
	SEC					;$B4BC60   |
	SBC #$0008				;$B4BC61   |
	TAY					;$B4BC64   |
CODE_B4BC65:					;	   |
	TYA					;$B4BC65   |
	STA [$C8]				;$B4BC66   |
	INC $C8					;$B4BC68   |
	INC $C8					;$B4BC6A   |
	LDA #$3C00				;$B4BC6C   |
	STA [$C8]				;$B4BC6F   |
	LDA $C8					;$B4BC71   |
	SEC					;$B4BC73   |
	SBC #$0006				;$B4BC74   |
	STA $C8					;$B4BC77   |
	TYA					;$B4BC79   |
	CLC					;$B4BC7A   |
	ADC #$0800				;$B4BC7B   |
	STA [$C8]				;$B4BC7E   |
	INC $C8					;$B4BC80   |
	INC $C8					;$B4BC82   |
	LDA #$3C01				;$B4BC84   |
	STA [$C8]				;$B4BC87   |
	LDA $C8					;$B4BC89   |
	SEC					;$B4BC8B   |
	SBC #$0006				;$B4BC8C   |
	STA $C8					;$B4BC8F   |
	TYA					;$B4BC91   |
	CLC					;$B4BC92   |
	ADC #$0008				;$B4BC93   |
	TAY					;$B4BC96   |
	STA [$C8]				;$B4BC97   |
	INC $C8					;$B4BC99   |
	INC $C8					;$B4BC9B   |
	LDA #$3C02				;$B4BC9D   |
	STA [$C8]				;$B4BCA0   |
	LDA $C8					;$B4BCA2   |
	SEC					;$B4BCA4   |
	SBC #$0006				;$B4BCA5   |
	STA $C8					;$B4BCA8   |
	TYA					;$B4BCAA   |
	CLC					;$B4BCAB   |
	ADC #$0800				;$B4BCAC   |
	STA [$C8]				;$B4BCAF   |
	INC $C8					;$B4BCB1   |
	INC $C8					;$B4BCB3   |
	LDA #$3C03				;$B4BCB5   |
	STA [$C8]				;$B4BCB8   |
	LDA $C8					;$B4BCBA   |
	SEC					;$B4BCBC   |
	SBC #$0006				;$B4BCBD   |
	STA $C8					;$B4BCC0   |
	TYA					;$B4BCC2   |
	CLC					;$B4BCC3   |
	ADC #$0008				;$B4BCC4   |
	TAY					;$B4BCC7   |
	LDA $0001,x				;$B4BCC8   |
	AND #$00FF				;$B4BCCB   |
	BEQ CODE_B4BD16				;$B4BCCE   |
	TYA					;$B4BCD0   |
	STA [$C8]				;$B4BCD1   |
	INC $C8					;$B4BCD3   |
	INC $C8					;$B4BCD5   |
	LDA #$3E00				;$B4BCD7   |
	SEP #$20				;$B4BCDA   |
	LDA $0001,x				;$B4BCDC   |
	CLC					;$B4BCDF   |
	ADC #$20				;$B4BCE0   |
	REP #$20				;$B4BCE2   |
	STA [$C8]				;$B4BCE4   |
	LDA $C8					;$B4BCE6   |
	SEC					;$B4BCE8   |
	SBC #$0006				;$B4BCE9   |
	STA $C8					;$B4BCEC   |
	TYA					;$B4BCEE   |
	CLC					;$B4BCEF   |
	ADC #$0800				;$B4BCF0   |
	STA [$C8]				;$B4BCF3   |
	INC $C8					;$B4BCF5   |
	INC $C8					;$B4BCF7   |
	LDA #$3E00				;$B4BCF9   |
	SEP #$20				;$B4BCFC   |
	LDA $0001,x				;$B4BCFE   |
	CLC					;$B4BD01   |
	ADC #$2A				;$B4BD02   |
	REP #$20				;$B4BD04   |
	STA [$C8]				;$B4BD06   |
	LDA $C8					;$B4BD08   |
	SEC					;$B4BD0A   |
	SBC #$0006				;$B4BD0B   |
	STA $C8					;$B4BD0E   |
	TYA					;$B4BD10   |
	CLC					;$B4BD11   |
	ADC #$0008				;$B4BD12   |
	TAY					;$B4BD15   |
CODE_B4BD16:					;	   |
	TYA					;$B4BD16   |
	STA [$C8]				;$B4BD17   |
	INC $C8					;$B4BD19   |
	INC $C8					;$B4BD1B   |
	LDA #$3E00				;$B4BD1D   |
	SEP #$20				;$B4BD20   |
	LDA $0000,x				;$B4BD22   |
	CLC					;$B4BD25   |
	ADC #$20				;$B4BD26   |
	REP #$20				;$B4BD28   |
	STA [$C8]				;$B4BD2A   |
	LDA $C8					;$B4BD2C   |
	SEC					;$B4BD2E   |
	SBC #$0006				;$B4BD2F   |
	STA $C8					;$B4BD32   |
	TYA					;$B4BD34   |
	CLC					;$B4BD35   |
	ADC #$0800				;$B4BD36   |
	STA [$C8]				;$B4BD39   |
	INC $C8					;$B4BD3B   |
	INC $C8					;$B4BD3D   |
	LDA #$3E00				;$B4BD3F   |
	SEP #$20				;$B4BD42   |
	LDA $0000,x				;$B4BD44   |
	CLC					;$B4BD47   |
	ADC #$2A				;$B4BD48   |
	REP #$20				;$B4BD4A   |
	STA [$C8]				;$B4BD4C   |
	LDA $C8					;$B4BD4E   |
	SEC					;$B4BD50   |
	SBC #$0006				;$B4BD51   |
	STA $C8					;$B4BD54   |
	RTS					;$B4BD56  /

CODE_B4BD57:
	LDY #$000A				;$B4BD57  \
	JSL CODE_B4BD7C				;$B4BD5A   |
	LDA CPU.divide_remainder		;$B4BD5E   |
	STA $0000,x				;$B4BD61   |
	LDA CPU.divide_result			;$B4BD64   |
	JSL CODE_B4BD7C				;$B4BD67   |
	SEP #$20				;$B4BD6B   |
	LDA CPU.divide_remainder		;$B4BD6D   |
	STA $0001,x				;$B4BD70   |
	LDA CPU.divide_result			;$B4BD73   |
	STA $0002,x				;$B4BD76   |
	REP #$20				;$B4BD79   |
	RTS					;$B4BD7B  /

CODE_B4BD7C:
	STA CPU.dividen				;$B4BD7C  \
	STY CPU.divisor				;$B4BD7F   |
	NOP					;$B4BD82   |
	NOP					;$B4BD83   |
	NOP					;$B4BD84   |
	NOP					;$B4BD85   |
	NOP					;$B4BD86   |
	NOP					;$B4BD87   |
	NOP					;$B4BD88   |
	NOP					;$B4BD89   |
	NOP					;$B4BD8A   |
	NOP					;$B4BD8B   |
	RTL					;$B4BD8C  /

CODE_B4BD8D:
	JSR CODE_B4BDA5				;$B4BD8D  \
	JSR CODE_B4A11F				;$B4BD90   |
	BRA CODE_B4BD9B				;$B4BD93  /

CODE_B4BD95:
	JSR CODE_B4BDA5				;$B4BD95  \
	JSR CODE_B4A0FD				;$B4BD98   |
CODE_B4BD9B:					;	   |
	LDA $06A1				;$B4BD9B   |
	AND #$FFFE				;$B4BD9E   |
	STA $06A1				;$B4BDA1   |
	RTS					;$B4BDA4  /

CODE_B4BDA5:
	SEP #$20				;$B4BDA5  \
	STA $000787				;$B4BDA7   |
	LDX #$2C00				;$B4BDAB   |
	STX HDMA[3].settings			;$B4BDAE   |
	LDX #$0787				;$B4BDB1   |
	STX HDMA[3].source			;$B4BDB4   |
	STZ HDMA[3].source_bank			;$B4BDB7   |
	STZ HDMA[3].indirect_source_bank	;$B4BDBA   |
	STA $0006DC				;$B4BDBD   |
	LDX #$2103				;$B4BDC1   |
	STX HDMA[4].settings			;$B4BDC4   |
	LDX #$06DC				;$B4BDC7   |
	STX HDMA[4].source			;$B4BDCA   |
	STZ HDMA[4].source_bank			;$B4BDCD   |
	STZ HDMA[4].indirect_source_bank	;$B4BDD0   |
	REP #$20				;$B4BDD3   |
	RTS					;$B4BDD5  /

CODE_B4BDD6:
	REP #$20				;$B4BDD6  \
	LDY #$06CF				;$B4BDD8   |
	LDX #DATA_B4CE60			;$B4BDDB   |
	LDA #$00C0				;$B4BDDE   |
	PHB					;$B4BDE1   |
	MVN $00, $B4				;$B4BDE2   |
	PLB					;$B4BDE5   |
	RTS					;$B4BDE6  /

CODE_B4BDE7:
	BRA CODE_B4BDFF				;$B4BDE7  /

	SEP #$20				;$B4BDE9   |
	LDA.l $0006DC				;$B4BDEB   |
	CMP #$3D				;$B4BDEF   |
	BEQ CODE_B4BDFF				;$B4BDF1   |
	INC A					;$B4BDF3   |
	STA $0006DC				;$B4BDF4   |
	STA $000787				;$B4BDF8   |
	REP #$20				;$B4BDFC   |
	RTS					;$B4BDFE  /

CODE_B4BDFF:
	REP #$20				;$B4BDFF  \
	LDA $06A1				;$B4BE01   |
	ORA #$0001				;$B4BE04   |
	STA $06A1				;$B4BE07   |
	RTS					;$B4BE0A  /

CODE_B4BE0B:
	BRA CODE_B4BE23				;$B4BE0B  /

	SEP #$20				;$B4BE0D   |
	LDA.l $0006DC				;$B4BE0F   |
	CMP #$7D				;$B4BE13   |
	BEQ CODE_B4BE23				;$B4BE15   |
	INC A					;$B4BE17   |
	STA $0006DC				;$B4BE18   |
	STA $000787				;$B4BE1C   |
	REP #$20				;$B4BE20   |
	RTS					;$B4BE22  /

CODE_B4BE23:
	REP #$20				;$B4BE23  \
	LDA $06A1				;$B4BE25   |
	ORA #$0001				;$B4BE28   |
	STA $06A1				;$B4BE2B   |
	RTS					;$B4BE2E  /

CODE_B4BE2F:
	SEP #$20				;$B4BE2F  \
	STZ PPU.layer_3_scroll_x		;$B4BE31   |
	STZ PPU.layer_3_scroll_x		;$B4BE34   |
	LDA #$FF				;$B4BE37   |
	STA PPU.layer_3_scroll_y		;$B4BE39   |
	STA PPU.layer_3_scroll_y		;$B4BE3C   |
	STZ PPU.layer_2_scroll_x		;$B4BE3F   |
	STZ PPU.layer_2_scroll_x		;$B4BE42   |
	STA PPU.layer_2_scroll_y		;$B4BE45   |
	STA PPU.layer_2_scroll_y		;$B4BE48   |
	STZ PPU.layer_1_scroll_x		;$B4BE4B   |
	STZ PPU.layer_1_scroll_x		;$B4BE4E   |
	STA PPU.layer_1_scroll_y		;$B4BE51   |
	STA PPU.layer_1_scroll_y		;$B4BE54   |
	REP #$20				;$B4BE57   |
	STZ $17BA				;$B4BE59   |
	STZ $17C0				;$B4BE5C   |
	RTL					;$B4BE5F  /

CODE_B4BE60:
	JMP ($067D)				;$B4BE60  /

CODE_B4BE63:
	JSR CODE_B4BEB4				;$B4BE63  \
	LDA $06A5				;$B4BE66   |
	AND #$FFFE				;$B4BE69   |
	ORA #$0020				;$B4BE6C   |
	STA $06A5				;$B4BE6F   |
	LDA #$0001				;$B4BE72   |
	STA $0658				;$B4BE75   |
if !version == 0				;	   |
	LDA #DATA_F7844A			;	   |
else						;	   |
	LDY #DATA_F7844A			;$B4BE78   |
	LDA $08CE				;$B4BE7B   |
	CMP.l DATA_B4BED7			;$B4BE7E   |
	BCC CODE_B4BE87				;$B4BE82   |
	LDY #DATA_F7844C			;$B4BE84   |
CODE_B4BE87:					;	   |
	TYA					;$B4BE87   |
endif						;	   |
	LDY language_select			;$B4BE88   |
	BEQ CODE_B4BE90				;$B4BE8B   |
	LDA #DATA_F7FCEE			;$B4BE8D   |
CODE_B4BE90:					;	   |
	STA $0672				;$B4BE90   |
	BRL CODE_B48927				;$B4BE93  /

CODE_B4BE96:
	JSR CODE_B4BEB4				;$B4BE96  \
	LDA #$0021				;$B4BE99   |
	TSB $06A5				;$B4BE9C   |
	LDA #$0002				;$B4BE9F   |
	STA $0658				;$B4BEA2   |
	LDA #DATA_F7845C			;$B4BEA5   |
	LDY language_select			;$B4BEA8   |
	BEQ CODE_B4BEB0				;$B4BEAB   |
	LDA #DATA_F7FCE4			;$B4BEAD   |
CODE_B4BEB0:					;	   |
	STA $0672				;$B4BEB0   |
	RTS					;$B4BEB3  /

CODE_B4BEB4:
	LDA #$810F				;$B4BEB4  \
	JSL set_fade_global			;$B4BEB7   |
	LDA $06A3				;$B4BEBB   |
	ORA #$8000				;$B4BEBE   |
	STA $06A3				;$B4BEC1   |
	LDA #CODE_B4BEEF			;$B4BEC4   |
	STA $067D				;$B4BEC7   |
	LDA #CODE_B4C14E			;$B4BECA   |
	STA $067F				;$B4BECD   |
	RTS					;$B4BED0  /

DATA_B4BED1:
	db $84, $00, $81, $00, $BE, $00

DATA_B4BED7:
	db $27, $00, $46, $00, $8A, $00, $96, $00

DATA_B4BEDF:
	db $1D, $00, $BB, $00, $8E, $00, $6E, $00

DATA_B4BEE7:
	db $13, $00, $5A, $00, $C3, $00, $46, $00


CODE_B4BEEF:
	SEP #$20				;$B4BEEF  \
	STZ CPU.enable_interrupts		;$B4BEF1   |
	REP #$20				;$B4BEF4   |
	JSL init_sprite_render_order_global	;$B4BEF6   |
	LDA #$8000				;$B4BEFA   |
	TRB $06A3				;$B4BEFD   |
	LDA #$0020				;$B4BF00   |
	TSB $06A5				;$B4BF03   |
	LDA #global_sprite_palette		;$B4BF06   |
	LDY #$00F0				;$B4BF09   |
	LDX #$0004				;$B4BF0C   |
	JSL DMA_palette				;$B4BF0F   |
	LDA #$00AA				;$B4BF13   |
	LDY #$00E0				;$B4BF16   |
	LDX #$0004				;$B4BF19   |
	JSL DMA_global_palette			;$B4BF1C   |
	LDA $0672				;$B4BF20   |
	STA $065C				;$B4BF23   |
	LDA $067F				;$B4BF26   |
	CMP #CODE_B4C139			;$B4BF29   |
	BEQ CODE_B4BF3A				;$B4BF2C   |
	CMP #CODE_B491C5			;$B4BF2E   |
	BEQ CODE_B4BF3A				;$B4BF31   |
	LDA #$0019				;$B4BF33   |
	JSL play_song				;$B4BF36   |
CODE_B4BF3A:					;	   |
	JSL disable_screen			;$B4BF3A   |
	JSL clear_VRAM_global			;$B4BF3E   |
	JSL CODE_BAC7C0				;$B4BF42   |
	JSL clear_wram_tables			;$B4BF46   |
	PHK					;$B4BF4A   |
	PLB					;$B4BF4B   |
	JSL CODE_B4BE2F				;$B4BF4C   |
	JSR CODE_B4BDD6				;$B4BF50   |
	SEP #$20				;$B4BF53   |
	LDX #$1202				;$B4BF55   |
	STX HDMA[1].settings			;$B4BF58   |
	LDX #$06CF				;$B4BF5B   |
	STX HDMA[1].source			;$B4BF5E   |
	LDA #$00				;$B4BF61   |
	STA HDMA[1].source_bank			;$B4BF63   |
	STZ HDMA[1].indirect_source_bank	;$B4BF66   |
	REP #$20				;$B4BF69   |
	LDY #$0000				;$B4BF6B   |
	LDX DATA_B4CD51,y			;$B4BF6E   |
	LDA $0010,x				;$B4BF71   |
	STA $0662				;$B4BF74   |
	LDA $0012,x				;$B4BF77   |
	STA $0664				;$B4BF7A   |
	STZ PPU.oam_address			;$B4BF7D   |
	LDA #$0080				;$B4BF80   |
	STA PPU.screen				;$B4BF83   |
	PHK					;$B4BF86   |
	PHK					;$B4BF87   |
	PLA					;$B4BF88   |
	STA $CC					;$B4BF89   |
	LDA #$0039				;$B4BF8B   |
	JSL VRAM_payload_handler_global		;$B4BF8E   |
	LDA #$0038				;$B4BF92   |
	JSL set_PPU_registers_global		;$B4BF95   |
	LDA #video_game_hero_screen_palette	;$B4BF99   |
	LDY #$0000				;$B4BF9C   |
	LDX #$0020				;$B4BF9F   |
	JSL DMA_palette				;$B4BFA2   |
	LDA #$0100				;$B4BFA6   |
	JSL set_fade_global			;$B4BFA9   |
	LDA $08A4				;$B4BFAD   |
	STA $0660				;$B4BFB0   |
	STZ $08A4				;$B4BFB3   |
	JSL CODE_808D8A				;$B4BFB6   |
	LDX $0597				;$B4BFBA   |
	LDA #$C000				;$B4BFBD   |
	STA $1C,x				;$B4BFC0   |
	LDX #$0000				;$B4BFC2   |
	JSR CODE_B48D8E				;$B4BFC5   |
	LDX alternate_sprite			;$B4BFC8   |
	LDA $12,x				;$B4BFCA   |
	AND #$BFFF				;$B4BFCC   |
	STA $12,x				;$B4BFCF   |
	LDA #$001C				;$B4BFD1   |
	STA $06,x				;$B4BFD4   |
	LDA #$00C3				;$B4BFD6   |
	STA $0A,x				;$B4BFD9   |
	LDY #$0168				;$B4BFDB   |
	JSL CODE_BB842C				;$B4BFDE   |
	LDX alternate_sprite			;$B4BFE2   |
	STX $0668				;$B4BFE4   |
	LDY #$0166				;$B4BFE7   |
	JSL CODE_BB842C				;$B4BFEA   |
	LDX alternate_sprite			;$B4BFEE   |
	STX $066A				;$B4BFF0   |
	LDY #$016C				;$B4BFF3   |
	JSL CODE_BB842C				;$B4BFF6   |
	LDX alternate_sprite			;$B4BFFA   |
	STX $066C				;$B4BFFC   |
	LDX #DATA_B4BED1			;$B4BFFF   |
	LDA $08CE				;$B4C002   |
	BEQ CODE_B4C008				;$B4C005   |
	DEC A					;$B4C007   |
CODE_B4C008:					;	   |
	CMP $0006,x				;$B4C008   |
	BCC CODE_B4C010				;$B4C00B   |
	BRL CODE_B4C09B				;$B4C00D  /

CODE_B4C010:
	PHA					;$B4C010  \
	LDY $066A				;$B4C011   |
	JSR CODE_B4C0E9				;$B4C014   |
	LDA $0004,x				;$B4C017   |
	STA $0042,y				;$B4C01A   |
	JSR CODE_B4C0FD				;$B4C01D   |
	STA $07A8				;$B4C020   |
	JSR CODE_B4C0F6				;$B4C023   |
	PLA					;$B4C026   |
	CMP $0006,x				;$B4C027   |
	BCC CODE_B4C02F				;$B4C02A   |
	BRL CODE_B4C0B2				;$B4C02C  /

CODE_B4C02F:
	PHA					;$B4C02F  \
	LDY $0668				;$B4C030   |
	JSR CODE_B4C0E9				;$B4C033   |
	LDA $0004,x				;$B4C036   |
	STA $0042,y				;$B4C039   |
	JSR CODE_B4C0FD				;$B4C03C   |
	STA $07AA				;$B4C03F   |
	JSR CODE_B4C0F6				;$B4C042   |
	PLA					;$B4C045   |
	CMP $0006,x				;$B4C046   |
	BCC CODE_B4C04E				;$B4C049   |
	BRL CODE_B4C0C9				;$B4C04B  /

CODE_B4C04E:
	LDY $066C				;$B4C04E  \
	JSR CODE_B4C0E9				;$B4C051   |
	LDA $0004,x				;$B4C054   |
	STA $0042,y				;$B4C057   |
	JSR CODE_B4C0FD				;$B4C05A   |
	STA $07AC				;$B4C05D   |
	JSR CODE_B4C0F6				;$B4C060   |
	LDY $0593				;$B4C063   |
	JSR CODE_B4C0E9				;$B4C066   |
	LDA $0004,x				;$B4C069   |
	STA $066E				;$B4C06C   |
	JSR CODE_B4C0FD				;$B4C06F   |
	STA $07AE				;$B4C072   |
	LDA #$0004				;$B4C075   |
	STA $0670				;$B4C078   |
CODE_B4C07B:					;	   |
	LDA #$0200				;$B4C07B   |
	TRB $06A1				;$B4C07E   |
	JSR CODE_B49080				;$B4C081   |
	LDA #$0064				;$B4C084   |
	STA $064E				;$B4C087   |
	LDA #CODE_B48E6C			;$B4C08A   |
	STA $067D				;$B4C08D   |
	LDA $0660				;$B4C090   |
	JSL CODE_808837				;$B4C093   |
	JML CODE_808C84				;$B4C097  /

CODE_B4C09B:
	LDY $0593				;$B4C09B  \
	JSR CODE_B4C0E9				;$B4C09E   |
	JSR CODE_B4C0FD				;$B4C0A1   |
	STA $07AE				;$B4C0A4   |
	JSR CODE_B4C0F6				;$B4C0A7   |
	LDA #$0001				;$B4C0AA   |
	STA $0670				;$B4C0AD   |
	BRA CODE_B4C10D				;$B4C0B0  /

CODE_B4C0B2:
	LDY $0593				;$B4C0B2  \
	JSR CODE_B4C0E9				;$B4C0B5   |
	JSR CODE_B4C0FD				;$B4C0B8   |
	STA $07AE				;$B4C0BB   |
	JSR CODE_B4C0F6				;$B4C0BE   |
	LDA #$0002				;$B4C0C1   |
	STA $0670				;$B4C0C4   |
	BRA CODE_B4C122				;$B4C0C7  /

CODE_B4C0C9:
	LDY $0593				;$B4C0C9  \
	JSR CODE_B4C0E9				;$B4C0CC   |
	JSR CODE_B4C0FD				;$B4C0CF   |
	STA $07AE				;$B4C0D2   |
	JSR CODE_B4C0F6				;$B4C0D5   |
	LDA #$0003				;$B4C0D8   |
	STA $0670				;$B4C0DB   |
CODE_B4C0DE:					;	   |
	LDY $066C				;$B4C0DE   |
	LDA #$C000				;$B4C0E1   |
	STA $001C,y				;$B4C0E4   |
	BRA CODE_B4C07B				;$B4C0E7  /

CODE_B4C0E9:
	LDA $0000,x				;$B4C0E9  \
	STA $0006,y				;$B4C0EC   |
	LDA $0002,x				;$B4C0EF   |
	STA $000A,y				;$B4C0F2   |
	RTS					;$B4C0F5  /

CODE_B4C0F6:
	TXA					;$B4C0F6  \
	CLC					;$B4C0F7   |
	ADC #$0008				;$B4C0F8   |
	TAX					;$B4C0FB   |
	RTS					;$B4C0FC  /

CODE_B4C0FD:
	LDA $000A,y				;$B4C0FD  \
	CLC					;$B4C100   |
	ADC #$0009				;$B4C101   |
	XBA					;$B4C104   |
	SEP #$20				;$B4C105   |
	LDA $0006,y				;$B4C107   |
	REP #$20				;$B4C10A   |
	RTS					;$B4C10C  /

CODE_B4C10D:
	LDY $066A				;$B4C10D  \
	JSR CODE_B4C0E9				;$B4C110   |
	LDA $0004,y				;$B4C113   |
	STA $0042,y				;$B4C116   |
	JSR CODE_B4C0FD				;$B4C119   |
	STA $07A8				;$B4C11C   |
	JSR CODE_B4C0F6				;$B4C11F   |
CODE_B4C122:					;	   |
	LDY $0668				;$B4C122   |
	JSR CODE_B4C0E9				;$B4C125   |
	LDA $0004,y				;$B4C128   |
	STA $0042,y				;$B4C12B   |
	JSR CODE_B4C0FD				;$B4C12E   |
	STA $07AA				;$B4C131   |
	JSR CODE_B4C0F6				;$B4C134   |
	BRA CODE_B4C0DE				;$B4C137  /

CODE_B4C139:
	JSL disable_screen			;$B4C139  \
	LDA #$0010				;$B4C13D   |
	TRB $08FC				;$B4C140   |
	STZ $08FE				;$B4C143   |
	JSL CODE_BBC5AB				;$B4C146   |
	JML CODE_8087B9				;$B4C14A  /

CODE_B4C14E:
	LDA #$0040				;$B4C14E  \
	TSB $06A3				;$B4C151   |
	STZ $06AF				;$B4C154   |
	STZ $06AD				;$B4C157   |
	LDA $06B1				;$B4C15A   |
	BNE CODE_B4C165				;$B4C15D   |
	LDA $06AB				;$B4C15F   |
	STA $06A9				;$B4C162   |
CODE_B4C165:					;	   |
	JSL CODE_B4AEAF				;$B4C165   |
	LDA #CODE_8087D9			;$B4C169   |
	STA gamemode_pointer			;$B4C16C   |
	LDA #simple_gamemode_nmi		;$B4C16E   |
	JML set_nmi_pointer			;$B4C171  /

CODE_B4C175:
	LDA rng_result				;$B4C175  \
	PHA					;$B4C177   |
	LDA rng_seed_2				;$B4C178   |
	ROL A					;$B4C17A   |
	PHA					;$B4C17B   |
	LDA rng_seed_1				;$B4C17C   |
	EOR $01,s				;$B4C17E   |
	STA rng_result				;$B4C180   |
	PLA					;$B4C182   |
	PLA					;$B4C183   |
	STA rng_seed_2				;$B4C184   |
	LDA rng_result				;$B4C186   |
	INC rng_result				;$B4C188   |
	RTL					;$B4C18A  /

;map area number from level number
DATA_B4C18B:
	db $00					;00
	db $1C					;01
	db $46					;02
	db $41					;03
	db $09					;04
	db $1E					;05
	db $00					;06
	db $10					;07
	db $17					;08
	db $0E					;09
	db $20					;0A
	db $0C					;0B
	db $42					;0C
	db $33					;0D
	db $49					;0E
	db $4B					;0F
	db $2A					;10
	db $50					;11
	db $00					;12
	db $2E					;13
	db $15					;14
	db $0B					;15
	db $6C					;16
	db $32					;17
	db $2C					;18
	db $28					;19
	db $00					;1A
	db $00					;1B
	db $00					;1C
	db $00					;1D
	db $00					;1E
	db $00					;1F
	db $00					;20
	db $1A					;21
	db $00					;22
	db $36					;23
	db $19					;24
	db $13					;25
	db $00					;26
	db $00					;27
	db $1B					;28
	db $1D					;29
	db $00					;2A
	db $00					;2B
	db $45					;2C
	db $21					;2D
	db $4A					;2E
	db $5B					;2F
	db $00					;30
	db $01					;31
	db $02					;32
	db $03					;33
	db $04					;34
	db $05					;35
	db $06					;36
	db $07					;37
	db $43					;38
	db $18					;39
	db $25					;3A
	db $4C					;3B
	db $29					;3C
	db $35					;3D
	db $00					;3E
	db $00					;3F
	db $0A					;40
	db $11					;41
	db $26					;42
	db $4D					;43
	db $2D					;44
	db $37					;45
	db $00					;46
	db $00					;47
	db $0F					;48
	db $16					;49
	db $23					;4A
	db $51					;4B
	db $2B					;4C
	db $3D					;4D
	db $5C					;4E
	db $00					;4F
	db $0D					;50
	db $14					;51
	db $24					;52
	db $53					;53
	db $31					;54
	db $3C					;55
	db $77					;56
	db $00					;57
	db $00					;58
	db $12					;59
	db $1F					;5A
	db $47					;5B
	db $2F					;5C
	db $38					;5D
	db $00					;5E
	db $00					;5F
	db $48					;60
	db $5D					;61
	db $39					;62
	db $22					;63
	db $52					;64
	db $4F					;65
	db $4E					;66
	db $44					;67
	db $30					;68
	db $00					;69
	db $00					;6A
	db $00					;6B
	db $34					;6C
	db $3B					;6D
	db $3F					;6E
	db $00					;6F
	db $00					;70
	db $00					;71
	db $00					;72
	db $00					;73
	db $00					;74
	db $00					;75
	db $00					;76
	db $00					;77
	db $00					;78
	db $00					;79
	db $00					;7A
	db $00					;7B
	db $00					;7C
	db $00					;7D
	db $00					;7E
	db $00					;7F
	db $68					;80
	db $00					;81
	db $00					;82
	db $00					;83
	db $00					;84
	db $00					;85
	db $00					;86
	db $00					;87
	db $00					;88
	db $00					;89
	db $00					;8A
	db $00					;8B
	db $00					;8C
	db $00					;8D
	db $00					;8E
	db $3A					;8F
	db $00					;90
	db $00					;91
	db $00					;92
	db $00					;93
	db $00					;94
	db $00					;95
	db $64					;96
	db $00					;97
	db $00					;98
	db $60					;99
	db $70					;9A
	db $00					;9B
	db $00					;9C
	db $00					;9D
	db $00					;9E
	db $00					;9F
	db $00					;A0
	db $00					;A1
	db $00					;A2
	db $00					;A3
	db $00					;A4
	db $00					;A5
	db $00					;A6
	db $00					;A7
	db $00					;A8
	db $00					;A9
	db $00					;AA
	db $00					;AB
	db $00					;AC
	db $00					;AD
	db $00					;AE
	db $00					;AF
	db $00					;B0
	db $00					;B1
	db $00					;B2
	db $00					;B3
	db $00					;B4
	db $00					;B5
	db $00					;B6
	db $00					;B7
	db $00					;B8
	db $40					;B9
	db $00					;BA
	db $00					;BB
	db $00					;BC
	db $00					;BD
	db $00					;BE
	db $00					;BF
	db $00					;C0
	db $00					;C1
	db $00					;C2
	db $00					;C3
	db $5E					;C4
	db $62					;C5
	db $66					;C6
	db $6A					;C7
	db $6E					;C8
	db $5F					;C9
	db $63					;CA
	db $67					;CB
	db $6B					;CC
	db $6F					;CD
	db $61					;CE
	db $65					;CF
	db $69
	db $6D
	db $71

DATA_B4C25E:
	dw DATA_B4C27C
	dw DATA_B4C298
	dw DATA_B4C2BC
	dw DATA_B4C2E2
	dw DATA_B4C30A
	dw DATA_B4C32A
	dw DATA_B4C350
	dw DATA_B4C378
	dw DATA_B4C390
	dw DATA_B4C3B6
	dw DATA_B4C3D4
	dw DATA_B4C3EC
	dw DATA_B4C404
	dw DATA_B4C41C
	dw DATA_B4C434

DATA_B4C27C:
	db $80, $00, $80, $00, $70, $00, $6F, $01
	db $05, $00, $07, $00, $0B, $00, $00, $00
	db $01, $00, $02, $00, $03, $00, $04, $00
	db $05, $00, $06, $00

DATA_B4C298:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $08, $00, $0B, $00, $C8, $00, $41, $00
	db $42, $00, $43, $00, $09, $00, $0A, $00
	db $0B, $00, $0C, $00, $0D, $00, $0E, $00
	db $0F, $00, $58, $00

DATA_B4C2BC:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $0B, $00, $0C, $00, $C8, $00, $10, $00
	db $11, $00, $12, $00, $13, $00, $14, $00
	db $15, $00, $16, $00, $17, $00, $18, $00
	db $19, $00, $1A, $00, $27, $00

DATA_B4C2E2:
	db $80, $00, $80, $01, $6F, $00, $6F, $00
	db $0D, $00, $0D, $00, $0B, $00, $1B, $00
	db $1C, $00, $1D, $00, $1E, $00, $1F, $00
	db $20, $00, $21, $00, $22, $00, $23, $00
	db $24, $00, $25, $00, $26, $00, $54, $00

DATA_B4C30A:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $09, $00, $09, $00, $C8, $00, $44, $00
	db $45, $00, $46, $00, $47, $00, $48, $00
	db $50, $00, $51, $00, $52, $00, $55, $00

DATA_B4C32A:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $0A, $00, $0C, $00, $C8, $00, $28, $00
	db $29, $00, $2A, $00, $2B, $00, $2C, $00
	db $2D, $00, $2E, $00, $2F, $00, $31, $00
	db $32, $00, $33, $00, $56, $00

DATA_B4C350:
	db $80, $00, $80, $00, $70, $00, $4F, $01
	db $0B, $00, $0D, $00, $C8, $00, $34, $00
	db $35, $00, $36, $00, $37, $00, $38, $00
	db $39, $00, $3A, $00, $3B, $00, $3C, $00
	db $3D, $00, $3F, $00, $40, $00, $57, $00

DATA_B4C378:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $05, $00, $05, $00, $0B, $00, $59, $00
	db $5B, $00, $5C, $00, $5D, $00, $77, $00

DATA_B4C390:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $0B, $00, $0C, $00, $C8, $00, $10, $00
	db $11, $00, $12, $00, $13, $00, $14, $00
	db $15, $00, $16, $00, $17, $00, $18, $00
	db $19, $00, $1A, $00, $27, $00

DATA_B4C3B6:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $07, $00, $08, $00, $C8, $00, $49, $00
	db $4A, $00, $4B, $00, $4C, $00, $4D, $00
	db $4E, $00, $4F, $00, $53, $00

DATA_B4C3D4:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $00, $00, $05, $00, $0B, $00, $5E, $00
	db $5F, $00, $60, $00, $61, $00, $72, $00

DATA_B4C3EC:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $00, $00, $05, $00, $0B, $00, $62, $00
	db $63, $00, $64, $00, $65, $00, $73, $00

DATA_B4C404:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $00, $00, $05, $00, $0B, $00, $66, $00
	db $67, $00, $68, $00, $69, $00, $74, $00

DATA_B4C41C:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $00, $00, $05, $00, $0B, $00, $6A, $00
	db $6B, $00, $6C, $00, $6D, $00, $75, $00

DATA_B4C434:
	db $80, $00, $80, $00, $6F, $00, $6F, $00
	db $00, $00, $05, $00, $0B, $00, $6E, $00
	db $6F, $00, $70, $00, $71, $00, $76, $00


DATA_B4C44C:
	db $00, $00, $58, $00, $27, $00, $54, $00
	db $55, $00, $56, $00, $57, $00, $59, $00
	db $00, $00, $4F, $00

DATA_B4C460:
	db $00, $00, $41, $00, $10, $00, $1B, $00
	db $50, $00, $28, $00, $34, $00, $5B, $00
	db $49, $00, $05, $00, $99, $00, $CE, $00
	db $96, $00, $CF, $00, $80, $00, $D0, $00
	db $16, $00, $D1, $00, $9A, $00, $D2, $00
	db $00, $00, $00, $00

DATA_B4C48C:
	db $61, $65, $69, $6D, $71

DATA_B4C491:
	db $00, $3C, $02, $3C, $04, $30, $0A, $32
	db $08, $32, $06, $30, $0C, $3A, $0E, $3A
	db $80, $34

DATA_B4C4A3:
	db $04

DATA_B4C4A4:
	db $F6

DATA_B4C4A5:
	db $20, $3C, $04, $12, $20, $BC, $F6, $04
	db $21, $7C, $12, $04, $21, $3C

DATA_B4C4B3:
	%font_tile_offset(DATA_FC0FE0)
	%font_tile_offset(DATA_FC1060)
	%font_tile_offset(DATA_FC10E0)
	%font_tile_offset(DATA_FC1120)
	%font_tile_offset(DATA_FC1160)
	%font_tile_offset(DATA_FC11A0)
	%font_tile_offset(DATA_FC0CE0)
	%font_tile_offset(DATA_FC1220)
	%font_tile_offset(DATA_FC1260)
	%font_tile_offset(DATA_FC12A0)
	%font_tile_offset(DATA_FC12E0)
	%font_tile_offset(DATA_FC0FE0)
	%font_tile_offset(DATA_FC0EE0)
	%font_tile_offset(DATA_FC0DE0)
	%font_tile_offset(DATA_FC10A0)
	%font_tile_offset(DATA_FC0720)
	%font_tile_offset(DATA_FC0820)
	%font_tile_offset(DATA_FC0920)
	%font_tile_offset(DATA_FC0A20)
	%font_tile_offset(DATA_FC0B20)
	%font_tile_offset(DATA_FC0C20)
	%font_tile_offset(DATA_FC0D20)
	%font_tile_offset(DATA_FC0E20)
	%font_tile_offset(DATA_FC0F20)
	%font_tile_offset(DATA_FC1020)
	%font_tile_offset(DATA_FC1320)
	%font_tile_offset(DATA_FC1360)
	%font_tile_offset(DATA_FC13A0)
	%font_tile_offset(DATA_FC13E0)
	%font_tile_offset(DATA_FC1420)
	%font_tile_offset(DATA_FC11E0)
	%font_tile_offset(DATA_FC1460)
	%font_tile_offset(DATA_FC0660)
	%font_tile_offset(DATA_FC0760)
	%font_tile_offset(DATA_FC0860)
	%font_tile_offset(DATA_FC0960)
	%font_tile_offset(DATA_FC0A60)
	%font_tile_offset(DATA_FC0B60)
	%font_tile_offset(DATA_FC0C60)
	%font_tile_offset(DATA_FC0D60)
	%font_tile_offset(DATA_FC0E60)
	%font_tile_offset(DATA_FC0F60)
	%font_tile_offset(DATA_FC06A0)
	%font_tile_offset(DATA_FC07A0)
	%font_tile_offset(DATA_FC08A0)
	%font_tile_offset(DATA_FC09A0)
	%font_tile_offset(DATA_FC0AA0)
	%font_tile_offset(DATA_FC0BA0)
	%font_tile_offset(DATA_FC0CA0)
	%font_tile_offset(DATA_FC0DA0)
	%font_tile_offset(DATA_FC0EA0)
	%font_tile_offset(DATA_FC0FA0)
	%font_tile_offset(DATA_FC06E0)
	%font_tile_offset(DATA_FC07E0)
	%font_tile_offset(DATA_FC08E0)
	%font_tile_offset(DATA_FC09E0)
	%font_tile_offset(DATA_FC0AE0)
	%font_tile_offset(DATA_FC0BE0)


DATA_B4C4ED:
	dw !null_pointer
	dw DATA_BAD5AA
	dw !null_pointer
	dw !null_pointer
	dw DATA_BADDE1

DATA_B4C4F7:
	dw DATA_BAD000
	dw DATA_BAD0D1
	dw DATA_BAD19C
	dw !null_pointer
	dw DATA_BAD339
	dw DATA_BAD40E
	dw !null_pointer
	dw !null_pointer
	dw DATA_BAD268
	dw DATA_BAD4ED
	dw DATA_BAD4ED
	dw DATA_BAD4ED
	dw DATA_BAD4ED
	dw DATA_BAD4ED

DATA_B4C513:
	dw DATA_BAD5DD
	dw DATA_BAD6EC
	dw DATA_BAD7E9
	dw DATA_BAD91F
	dw DATA_BAD9A6
	dw DATA_BADA35
	dw DATA_BADAB3

DATA_B4C521:
	dw DATA_BADB23
	dw DATA_BADB94
	dw DATA_BADC0B
	dw !null_pointer
	dw DATA_BADCF6
	dw DATA_BADD6A
	dw !null_pointer
	dw !null_pointer
	dw DATA_BADC7F

DATA_B4C533:
	db $00, $02, $86, $5F, $FD, $38, $9E, $65
	db $0F, $7A

DATA_B4C53D:
	db $00, $00, $36, $01, $CE, $00, $6C, $01
	db $9E, $01

DATA_B4C547:
	db $72, $00, $48, $01, $E0, $00, $7E, $01
	db $B0, $01

DATA_B4C551:
	db $8E, $00, $56, $01, $EE, $00, $8C, $01
	db $C2, $01

DATA_B4C55B:
	dw DATA_B4C56D
	dw DATA_B4C573
	dw DATA_B4C579
	dw !null_pointer
	dw DATA_B4C585
	dw DATA_B4C58B
	dw !null_pointer
	dw !null_pointer
	dw DATA_B4C57F

DATA_B4C56D:
	dw DATA_B4C591
	dw DATA_B4C5A9
	dw DATA_B4C5C1

DATA_B4C573:
	dw DATA_B4C5D9
	dw DATA_B4C5F1
	dw DATA_B4C609

DATA_B4C579:
	dw DATA_B4C621
	dw DATA_B4C639
	dw DATA_B4C651

DATA_B4C57F:
	dw DATA_B4C669
	dw DATA_B4C681
	dw DATA_B4C699

DATA_B4C585:
	dw DATA_B4C6B1
	dw DATA_B4C6C9
	dw DATA_B4C6E1

DATA_B4C58B:
	dw DATA_B4C6F9
	dw DATA_B4C711
	dw DATA_B4C729

DATA_B4C591:
	dw DATA_F744CC : db $58, $02
	dw DATA_F744EA : db $01, $00
	dw DATA_F74519 : db $58, $02
	dw DATA_F74557 : db $01, $00
	dw DATA_F745A2 : db $58, $02
	dw DATA_F745DD : db $03, $00

DATA_B4C5A9:
	dw DATA_F7462B : db $58, $02
	dw DATA_F74662 : db $02, $00
	dw DATA_F746A2 : db $58, $02
	dw DATA_F746DE : db $02, $00
	dw DATA_F74724 : db $58, $02
	dw DATA_F7477B : db $03, $00

DATA_B4C5C1:
	dw DATA_F747C7 : db $58, $02
	dw DATA_F74822 : db $02, $00
	dw DATA_F74843 : db $58, $02
	dw DATA_F7487E : db $01, $00
	dw DATA_F748C5 : db $58, $02
	dw DATA_F74935 : db $03, $00

DATA_B4C5D9:
	dw DATA_F74964 : db $58, $02
	dw DATA_F749BB : db $02, $00
	dw DATA_F74A01 : db $58, $02
	dw DATA_F74A3B : db $01, $00
	dw DATA_F74A88 : db $58, $02
	dw DATA_F74AE1 : db $01, $00

DATA_B4C5F1:
	dw DATA_F74B03 : db $58, $02
	dw DATA_F74B5D : db $03, $00
	dw DATA_F74BA4 : db $58, $02
	dw DATA_F74BE3 : db $02, $00
	dw DATA_F74C15 : db $58, $02
	dw DATA_F74C87 : db $01, $00

DATA_B4C609:
	dw DATA_F74CA8 : db $58, $02
	dw DATA_F74CFF : db $02, $00
	dw DATA_F74D22 : db $58, $02
	dw DATA_F74D7A : db $03, $00
	dw DATA_F74DAD : db $58, $02
	dw DATA_F74DEB : db $03, $00

DATA_B4C621:
	dw DATA_F74E1C : db $58, $02
	dw DATA_F74E58 : db $01, $00
	dw DATA_F74E9D : db $58, $02
	dw DATA_F74EFF : db $02, $00
	dw DATA_F74F48 : db $58, $02
	dw DATA_F74FA2 : db $03, $00

DATA_B4C639:
	dw DATA_F74FD2 : db $58, $02
	dw DATA_F7500B : db $02, $00
	dw DATA_F7502D : db $58, $02
	dw DATA_F75063 : db $03, $00
	dw DATA_F7509F : db $58, $02
	dw DATA_F750D5 : db $02, $00

DATA_B4C651:
	dw DATA_F74A01 : db $58, $02
	dw DATA_F75104 : db $02, $00
	dw DATA_F75141 : db $58, $02
	dw DATA_F75176 : db $01, $00
	dw DATA_F751A9 : db $58, $02
	dw DATA_F751E8 : db $03, $00

DATA_B4C669:
	dw DATA_F74A01 : db $58, $02
	dw DATA_F75209 : db $03, $00
	dw DATA_F75252 : db $58, $02
	dw DATA_F75289 : db $01, $00
	dw DATA_F752E7 : db $58, $02
	dw DATA_F75347 : db $03, $00

DATA_B4C681:
	dw DATA_F7539F : db $58, $02
	dw DATA_F753F8 : db $02, $00
	dw DATA_F7543E : db $58, $02
	dw DATA_F7548F : db $02, $00
	dw DATA_F754C1 : db $58, $02
	dw DATA_F75504 : db $01, $00

DATA_B4C699:
	dw DATA_F75566 : db $58, $02
	dw DATA_F7559C : db $03, $00
	dw DATA_F755CE : db $58, $02
	dw DATA_F75625 : db $02, $00
	dw DATA_F75651 : db $58, $02
	dw DATA_F756AB : db $03, $00

DATA_B4C6B1:
	dw DATA_F74A01 : db $58, $02
	dw DATA_F756FB : db $01, $00
	dw DATA_F75742 : db $58, $02
	dw DATA_F75798 : db $02, $00
	dw DATA_F757B9 : db $58, $02
	dw DATA_F75815 : db $03, $00

DATA_B4C6C9:
	dw DATA_F75844 : db $58, $02
	dw DATA_F75899 : db $03, $00
	dw DATA_F758DA : db $58, $02
	dw DATA_F75935 : db $02, $00
	dw DATA_F75956 : db $58, $02
	dw DATA_F759A6 : db $02, $00

DATA_B4C6E1:
	dw DATA_F759F1 : db $58, $02
	dw DATA_F75A4A : db $03, $00
	dw DATA_F75A98 : db $58, $02
	dw DATA_F75ACF : db $01, $00
	dw DATA_F75B02 : db $58, $02
	dw DATA_F75B58 : db $01, $00

DATA_B4C6F9:
	dw DATA_F74A01 : db $58, $02
	dw DATA_F75B79 : db $02, $00
	dw DATA_F75BC2 : db $58, $02
	dw DATA_F75C15 : db $03, $00
	dw DATA_F75C45 : db $58, $02
	dw DATA_F75C97 : db $02, $00

DATA_B4C711:
	dw DATA_F75CE4 : db $58, $02
	dw DATA_F75D27 : db $01, $00
	dw DATA_F75D6C : db $58, $02
	dw DATA_F75DA9 : db $03, $00
	dw DATA_F75DCA : db $58, $02
	dw DATA_F75E25 : db $02, $00

DATA_B4C729:
	dw DATA_F75E5B : db $58, $02
	dw DATA_F75E90 : db $02, $00
	dw DATA_F75EC7 : db $58, $02
	dw DATA_F75F00 : db $01, $00
	dw DATA_F75F21 : db $58, $02
	dw DATA_F75F62 : db $02, $00


DATA_B4C741:
	dw DATA_B4C74F
	dw DATA_B4C75D
	dw DATA_B4C76B
	dw DATA_B4C779
	dw DATA_B4C781
	dw DATA_B4C789
	dw DATA_B4C78F

DATA_B4C74F:
	dw !null_pointer
	dw DATA_F76CE3
	dw DATA_F76D79
	dw DATA_F76E29
	dw DATA_F76EE0
	dw DATA_F76F79
	dw DATA_F76EA3

DATA_B4C75D:
	dw !null_pointer
	dw DATA_F77031
	dw DATA_F770A6
	dw DATA_F77121
	dw DATA_F771BF
	dw DATA_F7727A
	dw DATA_F77164

DATA_B4C76B:
	dw !null_pointer
	dw DATA_F77305
	dw DATA_F77360
	dw DATA_F773D9
	dw DATA_F774AB
	dw DATA_F7753D
	dw DATA_F77452

DATA_B4C779:
	dw !null_pointer
	dw DATA_F775D9
	dw DATA_F776C5
	dw DATA_F77667

DATA_B4C781:
	dw !null_pointer
	dw DATA_F77742
	dw DATA_F77831
	dw DATA_F777BB

DATA_B4C789:
	dw !null_pointer
	dw DATA_F778A3
	dw DATA_F7791E

DATA_B4C78F:
	dw !null_pointer
	dw DATA_F7799B
	dw DATA_F779D9

DATA_B4C795:
	dw DATA_B4C7B1
	dw DATA_B4C7BD
	dw DATA_B4C7C9
	dw !null_pointer
	dw DATA_B4C7E1
	dw DATA_B4C7ED
	dw !null_pointer
	dw !null_pointer
	dw DATA_B4C7D5
	dw DATA_B4C7F9
	dw DATA_B4C7F9
	dw DATA_B4C7F9
	dw DATA_B4C7F9
	dw DATA_B4C7F9

DATA_B4C7B1:
	dw DATA_F71EDB
	dw DATA_F71F14
	dw DATA_F71F6A
	dw DATA_F71FAB
	dw DATA_F72000
	dw DATA_F7207B

DATA_B4C7BD:
	dw DATA_F720DA
	dw DATA_F72134
	dw DATA_F72175
	dw DATA_F721CE
	dw DATA_F72222
	dw DATA_F72259

DATA_B4C7C9:
	dw DATA_F722CC
	dw DATA_F72327
	dw DATA_F72378
	dw DATA_F723CB
	dw DATA_F72422
	dw DATA_F72446

DATA_B4C7D5:
	dw DATA_F72498
	dw DATA_F724EB
	dw DATA_F72540
	dw DATA_F7259A
	dw DATA_F7260E
	dw DATA_F72666

DATA_B4C7E1:
	dw DATA_F726A8
	dw DATA_F726E4
	dw DATA_F72741
	dw DATA_F7279B
	dw DATA_F727D2
	dw DATA_F72811

DATA_B4C7ED:
	dw DATA_F7286E
	dw DATA_F728DF
	dw DATA_F72936
	dw DATA_F729A8
	dw DATA_F72A03
	dw DATA_F72A75


DATA_B4C7F9:
	dw DATA_F72AE5
	dw DATA_F72B39
	dw DATA_F72B98
	dw DATA_F72BD2
	dw DATA_F72BF5

DATA_B4C803:
	dw !null_pointer
	dw DATA_BAEF04
	dw !null_pointer
	dw !null_pointer
	dw DATA_BAEF41

DATA_B4C80D:
	dw DATA_BAE1BB
	dw DATA_BAE2CF
	dw DATA_BAE3EF
	dw !null_pointer
	dw DATA_BAE61A
	dw DATA_BAE708
	dw !null_pointer
	dw !null_pointer
	dw DATA_BAE4ED
	dw DATA_BAE81F
	dw DATA_BAE81F
	dw DATA_BAE81F
	dw DATA_BAE81F
	dw DATA_BAE81F

DATA_B4C829:
	dw DATA_BAE929
	dw DATA_BAEA3B
	dw DATA_BAEB5F
	dw DATA_BAEC9C
	dw DATA_BAED42
	dw DATA_BAEDF2
	dw DATA_BAEE8A

DATA_B4C837:
	dw DATA_BADE1F
	dw DATA_BADEC0
	dw DATA_BADF53
	dw !null_pointer
	dw DATA_BAE085
	dw DATA_BAE117
	dw !null_pointer
	dw !null_pointer
	dw DATA_BADFF1


DATA_B4C849:
	dw DATA_F7A830
	dw DATA_F7EE95
	dw DATA_F78466
	dw DATA_F7DA34
	dw DATA_F7F3C8

DATA_B4C853:
	dw DATA_F7FC4E
	dw DATA_F7FD44
	dw DATA_F7FCFC
	dw DATA_F7FD72
	dw DATA_F7FD9A

DATA_B4C85D:
	dw DATA_F7FC98
	dw DATA_F7FD52
	dw DATA_F7FD08
	dw DATA_F7FD80
	dw DATA_F7FDA8

DATA_B4C867:
	dw DATA_F7FCAE
	dw DATA_F7FD60
	dw DATA_F7FD12
	dw DATA_F7FD8C
	dw DATA_F7FDB6

DATA_B4C871:
	dw DATA_B4C883
	dw DATA_B4C889
	dw DATA_B4C88F
	dw !null_pointer
	dw DATA_B4C89B
	dw DATA_B4C8A1
	dw !null_pointer
	dw !null_pointer
	dw DATA_B4C895

DATA_B4C883:
	dw DATA_B4C8A7
	dw DATA_B4C8BF
	dw DATA_B4C8D7

DATA_B4C889:
	dw DATA_B4C8EF
	dw DATA_B4C907
	dw DATA_B4C91F

DATA_B4C88F:
	dw DATA_B4C937
	dw DATA_B4C94F
	dw DATA_B4C967

DATA_B4C895:
	dw DATA_B4C97F
	dw DATA_B4C997
	dw DATA_B4C9AF

DATA_B4C89B:
	dw DATA_B4C9C7
	dw DATA_B4C9DF
	dw DATA_B4C9F7

DATA_B4C8A1:
	dw DATA_B4CA0F
	dw DATA_B4CA27
	dw DATA_B4CA3F

DATA_B4C8A7:
	dw DATA_F78CA8 : db $58, $02
	dw DATA_F78CC6 : db $01, $00
	dw DATA_F78CF5 : db $58, $02
	dw DATA_F78D33 : db $01, $00
	dw DATA_F78D72 : db $58, $02
	dw DATA_F78DAC : db $03, $00

DATA_B4C8BF:
	dw DATA_F78E00 : db $58, $02
	dw DATA_F78E3C : db $02, $00
	dw DATA_F78E75 : db $58, $02
	dw DATA_F78EAF : db $02, $00
	dw DATA_F78EFB : db $58, $02
	dw DATA_F78F39 : db $03, $00

DATA_B4C8D7:
	dw DATA_F78F85 : db $58, $02
	dw DATA_F78FF5 : db $02, $00
	dw DATA_F79016 : db $58, $02
	dw DATA_F79053 : db $01, $00
	dw DATA_F790A9 : db $58, $02
	dw DATA_F79104 : db $03, $00

DATA_B4C8EF:
	dw DATA_F7913B : db $58, $02
	dw DATA_F79190 : db $02, $00
	dw DATA_F791F0 : db $58, $02
	dw DATA_F79226 : db $01, $00
	dw DATA_F7927E : db $58, $02
	dw DATA_F792D6 : db $01, $00

DATA_B4C907:
	dw DATA_F79307 : db $58, $02
	dw DATA_F79363 : db $03, $00
	dw DATA_F793A6 : db $58, $02
	dw DATA_F793DD : db $02, $00
	dw DATA_F7940C : db $58, $02
	dw DATA_F79471 : db $01, $00

DATA_B4C91F:
	dw DATA_F79492 : db $58, $02
	dw DATA_F794EF : db $02, $00
	dw DATA_F79512 : db $58, $02
	dw DATA_F7956B : db $03, $00
	dw DATA_F795A1 : db $58, $02
	dw DATA_F795F4 : db $03, $00

DATA_B4C937:
	dw DATA_F79625 : db $58, $02
	dw DATA_F79676 : db $01, $00
	dw DATA_F796CB : db $58, $02
	dw DATA_F79726 : db $02, $00
	dw DATA_F79777 : db $58, $02
	dw DATA_F797CF : db $03, $00

DATA_B4C94F:
	dw DATA_F797FF : db $58, $02
	dw DATA_F79838 : db $02, $00
	dw DATA_F7985A : db $58, $02
	dw DATA_F79898 : db $03, $00
	dw DATA_F798D4 : db $58, $02
	dw DATA_F7990D : db $02, $00

DATA_B4C967:
	dw DATA_F791F0 : db $58, $02
	dw DATA_F7993C : db $02, $00
	dw DATA_F79981 : db $58, $02
	dw DATA_F799BB : db $01, $00
	dw DATA_F799EE : db $58, $02
	dw DATA_F79A3D : db $03, $00

DATA_B4C97F:
	dw DATA_F791F0 : db $58, $02
	dw DATA_F79A5E : db $03, $00
	dw DATA_F79AAC : db $58, $02
	dw DATA_F79AE8 : db $01, $00
	dw DATA_F79B43 : db $58, $02
	dw DATA_F79B9F : db $03, $00

DATA_B4C997:
	dw DATA_F79BF9 : db $58, $02
	dw DATA_F79C4C : db $02, $00
	dw DATA_F79C9F : db $58, $02
	dw DATA_F79CEF : db $02, $00
	dw DATA_F79D21 : db $58, $02
	dw DATA_F79D74 : db $01, $00

DATA_B4C9AF:
	dw DATA_F79DC9 : db $58, $02
	dw DATA_F79E03 : db $03, $00
	dw DATA_F79E35 : db $58, $02
	dw DATA_F79E89 : db $02, $00
	dw DATA_F79EB5 : db $58, $02
	dw DATA_F79F09 : db $03, $00

DATA_B4C9C7:
	dw DATA_F791F0 : db $58, $02
	dw DATA_F79F58 : db $01, $00
	dw DATA_F79FA1 : db $58, $02
	dw DATA_F79FF8 : db $02, $00
	dw DATA_F7A019 : db $58, $02
	dw DATA_F7A069 : db $03, $00

DATA_B4C9DF:
	dw DATA_F7A098 : db $58, $02
	dw DATA_F7A0E5 : db $03, $00
	dw DATA_F7A134 : db $58, $02
	dw DATA_F7A18D : db $02, $00
	dw DATA_F7A1AE : db $58, $02
	dw DATA_F7A206 : db $02, $00

DATA_B4C9F7:
	dw DATA_F7A25D : db $58, $02
	dw DATA_F7A2B3 : db $03, $00
	dw DATA_F7A307 : db $58, $02
	dw DATA_F7A340 : db $01, $00
	dw DATA_F7A374 : db $58, $02
	dw DATA_F7A3C8 : db $01, $00

DATA_B4CA0F:
	dw DATA_F791F0 : db $58, $02
	dw DATA_F7A3E9 : db $02, $00
	dw DATA_F7A43D : db $58, $02
	dw DATA_F7A48C : db $03, $00
	dw DATA_F7A4BC : db $58, $02
	dw DATA_F7A50D : db $02, $00

DATA_B4CA27:
	dw DATA_F7A559 : db $58, $02
	dw DATA_F7A5A9 : db $01, $00
	dw DATA_F7A5F9 : db $58, $02
	dw DATA_F7A64C : db $03, $00
	dw DATA_F7A66D : db $58, $02
	dw DATA_F7A6BD : db $02, $00

DATA_B4CA3F:
	dw DATA_F7A6F2 : db $58, $02
	dw DATA_F7A72A : db $02, $00
	dw DATA_F7A75F : db $58, $02
	dw DATA_F7A799 : db $01, $00
	dw DATA_F7A7BA : db $58, $02
	dw DATA_F7A80C : db $02, $00


DATA_B4CA57:
	dw DATA_B4CA65
	dw DATA_B4CA73
	dw DATA_B4CA81
	dw DATA_B4CA8F
	dw DATA_B4CA97
	dw DATA_B4CA9F
	dw DATA_B4CAA5

DATA_B4CA65:
	dw !null_pointer
	dw DATA_F7E064
	dw DATA_F7E103
	dw DATA_F7E177
	dw DATA_F7E26D
	dw DATA_F7E2F6
	dw DATA_F7E217

DATA_B4CA73:
	dw !null_pointer
	dw DATA_F7E39F
	dw DATA_F7E437
	dw DATA_F7E4AD
	dw DATA_F7E594
	dw DATA_F7E63C
	dw DATA_F7E521

DATA_B4CA81:
	dw !null_pointer
	dw DATA_F7E6CE
	dw DATA_F7E72B
	dw DATA_F7E7B3
	dw DATA_F7E885
	dw DATA_F7E918
	dw DATA_F7E82A

DATA_B4CA8F:
	dw !null_pointer
	dw DATA_F7E9AC
	dw DATA_F7EAB4
	dw DATA_F7EA40

DATA_B4CA97:
	dw !null_pointer
	dw DATA_F7EB47
	dw DATA_F7EC67
	dw DATA_F7EBD2

DATA_B4CA9F:
	dw !null_pointer
	dw DATA_F7ECDE
	dw DATA_F7ED6E

DATA_B4CAA5:
	dw !null_pointer
	dw DATA_F7EE04
	dw DATA_F7EE59


DATA_B4CAAB:
	dw DATA_B4CAC7
	dw DATA_B4CAD3
	dw DATA_B4CADF
	dw !null_pointer
	dw DATA_B4CAF7
	dw DATA_B4CB03
	dw !null_pointer
	dw !null_pointer
	dw DATA_B4CAEB
	dw DATA_B4CB0F
	dw DATA_B4CB0F
	dw DATA_B4CB0F
	dw DATA_B4CB0F
	dw DATA_B4CB0F

DATA_B4CAC7:
	dw DATA_F7C909
	dw DATA_F7C948
	dw DATA_F7C99F
	dw DATA_F7C9F9
	dw DATA_F7CA3A
	dw DATA_F7CABF

DATA_B4CAD3:
	dw DATA_F7CB1F
	dw DATA_F7CB94
	dw DATA_F7CBEB
	dw DATA_F7CC4A
	dw DATA_F7CCBA
	dw DATA_F7CCF7

DATA_B4CADF:
	dw DATA_F7CD6D
	dw DATA_F7CDE1
	dw DATA_F7CE3A
	dw DATA_F7CE8B
	dw DATA_F7CF01
	dw DATA_F7CF37

DATA_B4CAEB:
	dw DATA_F7CF8F
	dw DATA_F7CFE4
	dw DATA_F7D038
	dw DATA_F7D0A3
	dw DATA_F7D132
	dw DATA_F7D18D

DATA_B4CAF7:
	dw DATA_F7D1E3
	dw DATA_F7D21A
	dw DATA_F7D26D
	dw DATA_F7D2C5
	dw DATA_F7D304
	dw DATA_F7D358

DATA_B4CB03:
	dw DATA_F7D3D2
	dw DATA_F7D449
	dw DATA_F7D4A5
	dw DATA_F7D4FB
	dw DATA_F7D556
	dw DATA_F7D5CE

DATA_B4CB0F:
	dw DATA_F7D647
	dw DATA_F7D699
	dw DATA_F7D710
	dw DATA_F7D74E
	dw DATA_F7D772

DATA_B4CB19:
	dw !null_pointer
	dw DATA_B4CB9F
	dw !null_pointer
	dw !null_pointer
	dw DATA_B4CC47

DATA_B4CB23:
	dw DATA_B4CB3F
	dw DATA_B4CB4D
	dw DATA_B4CB5B
	dw !null_pointer
	dw DATA_B4CB77
	dw DATA_B4CB85
	dw !null_pointer
	dw !null_pointer
	dw DATA_B4CB69
	dw DATA_B4CB93
	dw DATA_B4CB93
	dw DATA_B4CB93
	dw DATA_B4CB93
	dw DATA_B4CB93

DATA_B4CB3F:
	db $00, $00, $00, $00, $00, $00, $01, $00
	db $02, $00, $03, $00, $00, $00

DATA_B4CB4D:
	db $00, $00, $00, $00, $00, $00, $01, $00
	db $02, $00, $03, $00, $00, $00

DATA_B4CB5B:
	db $00, $00, $00, $00, $00, $00, $01, $00
	db $02, $00, $03, $00, $00, $00

DATA_B4CB69:
	db $00, $00, $00, $00, $00, $00, $01, $00
	db $02, $00, $03, $00, $00, $00

DATA_B4CB77:
	db $00, $00, $00, $00, $00, $00, $01, $00
	db $02, $00, $03, $00, $00, $00

DATA_B4CB85:
	db $00, $00, $00, $00, $00, $00, $01, $00
	db $02, $00, $03, $00, $00, $00

DATA_B4CB93:
	db $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $00, $00

DATA_B4CB9F:
	db $02, $00, $00, $00

DATA_B4CBA3:
	dw DATA_B4CBB5
	dw DATA_B4CBBD
	dw DATA_B4CBC5
	dw !null_pointer
	dw DATA_B4CBD5
	dw DATA_B4CBDD
	dw !null_pointer
	dw !null_pointer
	dw DATA_B4CBCD

DATA_B4CBB5:
	db $00, $00, $01, $00, $02, $00, $00, $00

DATA_B4CBBD:
	db $01, $00, $02, $00, $03, $00, $00, $00

DATA_B4CBC5:
	db $01, $00, $02, $00, $03, $00, $00, $00

DATA_B4CBCD:
	db $01, $00, $02, $00, $03, $00, $00, $00

DATA_B4CBD5:
	db $01, $00, $02, $00, $03, $00, $00, $00

DATA_B4CBDD:
	db $01, $00, $02, $00, $03, $00, $00, $00

DATA_B4CBE5:
	dw DATA_B4CBF3
	dw DATA_B4CC03
	dw DATA_B4CC13
	dw DATA_B4CC23
	dw DATA_B4CC2D
	dw DATA_B4CC37
	dw DATA_B4CC3F

DATA_B4CBF3:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $01, $00, $01, $00, $02, $00, $00, $00

DATA_B4CC03:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $01, $00, $01, $00, $02, $00, $00, $00

DATA_B4CC13:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $01, $00, $01, $00, $02, $00, $00, $00

DATA_B4CC23:
	db $00, $00, $00, $00, $01, $00, $02, $00
	db $00, $00

DATA_B4CC2D:
	db $00, $00, $00, $00, $01, $00, $02, $00
	db $00, $00

DATA_B4CC37:
	db $00, $00, $00, $00, $01, $00, $00, $00

DATA_B4CC3F:
	db $01, $00, $00, $00, $03, $00, $00, $00

DATA_B4CC47:
	db $0F, $00, $00, $00, $00, $00


DATA_B4CC4D:
	dw !null_pointer
	dw DATA_B4CCD3
	dw DATA_B4CCD7
	dw !null_pointer
	dw DATA_B4CD41

DATA_B4CC57:
	dw DATA_B4CC73
	dw DATA_B4CC81
	dw DATA_B4CC8F
	dw !null_pointer
	dw DATA_B4CCAB
	dw DATA_B4CCB9
	dw !null_pointer
	dw !null_pointer
	dw DATA_B4CC9D
	dw DATA_B4CCC7
	dw DATA_B4CCC7
	dw DATA_B4CCC7
	dw DATA_B4CCC7
	dw DATA_B4CCC7

DATA_B4CC73:
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A9DB

DATA_B4CC81:
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A9DB

DATA_B4CC8F:
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A9DB

DATA_B4CC9D:
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A9DB

DATA_B4CCAB:
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A9DB

DATA_B4CCB9:
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A9DB

DATA_B4CCC7:
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A0A8
	dw CODE_B4A9DB

DATA_B4CCD3:
	dw CODE_B4A2BC
	dw CODE_B4A98C

DATA_B4CCD7:
	dw CODE_B4A391
	dw CODE_B4A391
	dw CODE_B4A391
	dw CODE_B4A98C

DATA_B4CCDF:
	dw DATA_B4CCED
	dw DATA_B4CCFD
	dw DATA_B4CD0D
	dw DATA_B4CD1D
	dw DATA_B4CD27
	dw DATA_B4CD31
	dw DATA_B4CD39


DATA_B4CCED:
	dw CODE_B4A26F
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A98C

DATA_B4CCFD:
	dw CODE_B4A26F
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A98C

DATA_B4CD0D:
	dw CODE_B4A26F
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A98C

DATA_B4CD1D:
	dw CODE_B4A26F
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A98C

DATA_B4CD27:
	dw CODE_B4A26F
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A98C

DATA_B4CD31:
	dw CODE_B4A26F
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A98C

DATA_B4CD39:
	dw CODE_B4A26F
	dw CODE_B4A0B5
	dw CODE_B4A0B5
	dw CODE_B4A98C

DATA_B4CD41:
	dw CODE_B49F61
	dw CODE_B4AA2A
	dw CODE_B4A9DB


DATA_B4CD47:
	dw DATA_FF12F4
	dw DATA_FF12F4
	dw DATA_FF12F4
	dw DATA_FF12F4
	dw DATA_FF1312

DATA_B4CD51:
	dw DATA_B4CD65
	dw DATA_B4CD81
	dw DATA_B4CD9D
	dw DATA_B4CDB9
	dw DATA_B4CDD5

;block 1?
DATA_B4CD5B:
	db $19, $00, $08, $00, $04, $00, $0C, $00
	db $0A, $00

DATA_B4CD65:
	db $08, $07 : dw monkey_museum_palette : db $E0, $FF, $AB, $00
	db $C0, $FF, $AB, $00, $00, $00

DATA_B4CD73:
	dw CODE_B4B82A

;block 2?
DATA_B4CD75:
	db $A0, $7B, $A0, $7A : dw DATA_B4CDF1 : db $60, $00
	db $40, $00, $00, $01

DATA_B4CD81:
	db $09, $08 : dw funkys_flights_palette : db $10, $01, $C0, $00
	db $30, $01, $C0, $00, $01, $00

DATA_B4CD8F:
	dw CODE_B4B82B

;block 3?
DATA_B4CD91:
	db $A0, $4B, $A0, $4A : dw DATA_B4CDF6 : db $A0, $00
	db $C0, $00, $00, $01

DATA_B4CD9D:
	db $0B, $07 : dw swankys_bonus_bonanza_palette : db $10, $01, $B8, $00
	db $30, $01, $B8, $00, $00, $00

DATA_B4CDAB:
	dw CODE_B4B7CA

;block 4?
DATA_B4CDAD:
	db $A0, $7B, $A0, $7A : dw DATA_B4CE07 : db $A8, $00
	db $C8, $00, $00, $01

DATA_B4CDB9:
	db $0A, $07 : dw kong_kollege_palette : db $10, $01, $B0, $00
	db $30, $01, $B0, $00, $01, $00

DATA_B4CDC7:
	dw CODE_B4B82A

;block 5?
DATA_B4CDC9:
	db $A0, $7B, $A0, $7A : dw DATA_B4CE0F : db  $A0, $00
	db $C0, $00, $00, $01

DATA_B4CDD5:
	db $0C, $07 : dw klubbas_kiosk_palette : db $E0, $FF, $A4, $00
	db $C0, $FF, $A4, $00, $00, $00

DATA_B4CDE3:
	dw CODE_B4B82A

DATA_B4CDE5:
	db $A0, $7B, $A0, $7A : dw DATA_B4CE17 : db $50, $00
	db $30, $00, $00, $01

DATA_B4CDF1:
	db $00, $01, $00, $00, $00

DATA_B4CDF6:
	db $04, $01, $00, $02, $01, $01, $8C, $01
	db $00, $16, $01, $00, $18, $01, $00, $00
	db $00

DATA_B4CE07:
	db $14, $01, $00, $06, $01, $00, $00, $00

DATA_B4CE0F:
	db $08, $01, $00, $0A, $01, $00, $00, $00

DATA_B4CE17:
	db $0E, $01, $01, $10, $01, $00, $00, $00

DATA_B4CE1F:
	db $48, $01, $4A, $01, $4C, $01, $4E, $01
	db $50, $01

DATA_B4CE29:
	dw DATA_B4CE37
	dw DATA_B4CE3D
	dw DATA_B4CE43
	dw DATA_B4CE4A
	dw DATA_B4CE51
	dw DATA_B4CE57
	dw DATA_B4CE5E

DATA_B4CE37:
	db $03, $0C, $04, $15, $0B, $00

DATA_B4CE3D:
	db $07, $25, $14, $08, $24, $00

DATA_B4CE43:
	db $28, $01, $29, $05, $0A, $2D, $00

DATA_B4CE4A:
	db $11, $2C, $02, $0E, $2E, $0F, $00

DATA_B4CE51:
	db $19, $10, $18, $13, $17, $00

DATA_B4CE57:
	db $6C, $23, $62, $8F, $6D, $6E, $00

DATA_B4CE5E:
	db $2F, $00

DATA_B4CE60:
	db $7F, $FF, $FF, $27, $FF, $FF, $30, $41
	db $00, $01, $80, $FF, $00, $6F, $01, $01
	db $00, $00, $59, $01, $01, $00, $00, $01
	db $01, $01, $40, $00, $01, $01, $01, $80
	db $00, $01, $01, $01, $C0, $00, $01, $01
	db $01, $00, $01, $01, $01, $01, $40, $01
	db $01, $01, $01, $80, $01, $01, $01, $01
	db $C0, $01, $01, $01, $01, $00, $02, $01
	db $01, $01, $44, $12, $01, $01, $01, $88
	db $22, $01, $01, $01, $CC, $32, $01, $01
	db $01, $10, $43, $01, $01, $01, $54, $53
	db $01, $01, $01, $98, $63, $01, $01, $01
	db $DC, $73, $30, $01, $01, $FF, $7F, $01
	db $01, $01, $DC, $73, $01, $01, $01, $98
	db $63, $01, $01, $01, $54, $53, $01, $01
	db $01, $10, $43, $01, $01, $01, $CC, $32
	db $01, $01, $01, $88, $22, $01, $01, $01
	db $44, $12, $01, $01, $01, $00, $02, $01
	db $01, $01, $C0, $01, $01, $01, $01, $80
	db $01, $01, $01, $01, $40, $01, $01, $01
	db $01, $00, $01, $01, $01, $01, $C0, $00
	db $01, $01, $01, $80, $00, $01, $01, $01
	db $40, $00, $01, $01, $01, $00, $00, $00
	db $6F, $11, $69, $11, $30, $15, $01, $11
	db $00

DATA_B4CF21:
	dw DATA_B4CF37 : db $00, $00
	dw CODE_B4B43D : db $00, $02, $00, $00
	dw CODE_B4B48D : db $00, $01, $00, $01
	db $00, $08, $00, $04, $00, $00

DATA_B4CF37:
	dw CODE_B4B4B3 : db $00, $01, $00, $02, $00, $08
	db $00, $04, $00, $01, $00, $02, $00, $08
	db $00, $04, $00, $00

DATA_B4CF4B:
	db $0E : dw DATA_B4D0B3
	db $0E : dw DATA_B4D0EA
	db $0E : dw DATA_B4D128
	db $0E : dw DATA_B4D151
	db $0E : dw DATA_B4D184
	db $0E : dw DATA_B4D1B1
	db $0E : dw DATA_B4D1E6
	db $0E : dw DATA_B4D218
	db $0E : dw DATA_B4D23C
	db $0E : dw DATA_B4D24D
	db $0A : dw DATA_B4D28B
	db $0E : dw DATA_B4D2BA
	db $0E : dw DATA_B4D2F2
	db $06 : dw DATA_B4D32D
	db $10 : dw DATA_B4D363
	db $08 : dw DATA_B4D38C
	db $0E : dw DATA_B4D3CF
	db $08 : dw DATA_B4D40C
	db $0C : dw DATA_B4D44F
	db $0E : dw DATA_B4D481
	db $06 : dw DATA_B4D4BE
	db $0E : dw DATA_B4D4F0
	db $0A : dw DATA_B4D523
	db $0E : dw DATA_B4D54E
	db $04 : dw DATA_B4D587
	db $0E : dw DATA_B4D5B5
	db $10 : dw DATA_B4D5ED
	db $0E : dw DATA_B4D620
	db $0E : dw DATA_B4D64D
	db $0E : dw DATA_B4D68A
	db $0E : dw DATA_B4D6CD
	db $0C : dw DATA_B4D706
	db $0E : dw DATA_B4D738
	db $0E : dw DATA_B4D771
	db $10 : dw DATA_B4D7A3
	db $0A : dw DATA_B4D7D6
	db $06 : dw DATA_B4D805
	db $04 : dw DATA_B4D83B
	db $08 : dw DATA_B4D86D
	db $0E : dw DATA_B4D8AC
	db $0E : dw DATA_B4D8C1
	db $04 : dw DATA_B4D8EF
	db $0E : dw DATA_B4D921
	db $0A : dw DATA_B4D94F
	db $0E : dw DATA_B4D97A
	db $08 : dw DATA_B4D9AD
	db $0E : dw DATA_B4D9EC
	db $0C : dw DATA_B4DA2E
	db $00 : dw !null_pointer
	db $06 : dw DATA_B4DA60
	db $0E : dw DATA_B4DA96
	db $10 : dw DATA_B4DAC4
	db $0E : dw DATA_B4DAF2
	db $04 : dw DATA_B4DB2A
	db $0E : dw DATA_B4DB58
	db $0A : dw DATA_B4DB88
	db $0C : dw DATA_B4DBB7
	db $0E : dw DATA_B4DBE9
	db $0E : dw DATA_B4DC1B
	db $0E : dw DATA_B4DC54
	db $06 : dw DATA_B4DC91
	db $08 : dw DATA_B4DCC3
	db $00 : dw !null_pointer
	db $0E : dw DATA_B4DD06
	db $10 : dw DATA_B4DD34
	db $0E : dw DATA_B4DD6F
	db $0E : dw DATA_B4DD9C
	db $04 : dw DATA_B4DDDE
	db $0E : dw DATA_B4DE0C
	db $0E : dw DATA_B4DE21
	db $0E : dw DATA_B4DE57
	db $0C : dw DATA_B4DE89
	db $10 : dw DATA_B4DEBB
	db $0E : dw DATA_B4DEEB
	db $0E : dw DATA_B4DF21
	db $0E : dw DATA_B4DF5F
	db $04 : dw DATA_B4DF93
	db $08 : dw DATA_B4DFC9
	db $0E : dw DATA_B4E008
	db $0E : dw DATA_B4E01D
	db $0E : dw DATA_B4E032
	db $0A : dw DATA_B4E067
	db $0E : dw DATA_B4E096
	db $06 : dw DATA_B4E0AB
	db $0E : dw DATA_B4E0DD
	db $0E : dw DATA_B4E0F2
	db $0E : dw DATA_B4E107
	db $0E : dw DATA_B4E11C
	db $0E : dw DATA_B4E131
	db $0E : dw DATA_B4E146
	db $00 : dw !null_pointer
	db $0E : dw DATA_B4E15B
	db $0A : dw DATA_B4E197
	db $10 : dw DATA_B4E1C2
	db $0C : dw DATA_B4E1F0
	db $04 : dw DATA_B4E23E
	db $0E : dw DATA_B4E26C
	db $10 : dw DATA_B4E29F
	db $0C : dw DATA_B4E2CF
	db $04 : dw DATA_B4E30C
	db $0E : dw DATA_B4E33A
	db $10 : dw DATA_B4E37B
	db $0C : dw DATA_B4E3AB
	db $04 : dw DATA_B4E3F1
	db $0E : dw DATA_B4E41F
	db $10 : dw DATA_B4E45A
	db $0C : dw DATA_B4E48A
	db $04 : dw DATA_B4E4CB
	db $0E : dw DATA_B4E4F9
	db $10 : dw DATA_B4E52F
	db $0C : dw DATA_B4E55F
	db $04 : dw DATA_B4E5A7
	db $0E : dw DATA_B4E5D5
	db $10 : dw DATA_B4E60D
	db $0E : dw DATA_B4E63D
	db $0E : dw DATA_B4E652
	db $0E : dw DATA_B4E667
	db $0E : dw DATA_B4E67C
	db $0E : dw DATA_B4E691
	db $06 : dw DATA_B4E6A6

DATA_B4D0B3:
	db $14, $00, $68, $01, $32, $04, $00 : dw DATA_B4D0C2
	db $00, $00, $01, $00, $00, $00
DATA_B4D0C2:
	db $11, ">GANGPLANK GALLEON"
	db $13, ">GALION DE LA GAL&RE"

DATA_B4D0EA:
	db $3A, $00, $A7, $01, $32, $03, $02 : dw DATA_B4D0FD
	db $00, $00, $02, $00, $01, $00, $00, $00, $00, $00
DATA_B4D0FD:
	db $12, ">CROCODILE CAULDRON"
	db $15, ">CHAUDRON DU CROCODILE"

DATA_B4D128:
	db $B4, $00, $AB, $01, $32, $0A, $02 : dw DATA_B4D13B
	db $00, $00, $01, $00, $01, $00, $03, $00, $02, $00
DATA_B4D13B:
	db $09, ">KREM QUAY"
	db $09, ">QUAI KREM"

DATA_B4D151:
	db $96, $00, $3D, $01, $32, $03, $01 : dw DATA_B4D164
	db $00, $00, $02, $00, $02, $00, $04, $00, $03, $00
DATA_B4D164:
	db $0E, ">KRAZY KREMLAND"
	db $0E, ">KREMLAND DINGO"

DATA_B4D184:
	db $81, $00, $FA, $00, $32, $0A, $02 : dw DATA_B4D197
	db $00, $00, $03, $00, $03, $00, $05, $00, $04, $00
DATA_B4D197:
	db $0C, ">GLOOMY GULCH"
	db $0A, ">RAVIN RAVI"

DATA_B4D1B1:
	db $81, $00, $92, $00, $32, $0C, $04 : dw DATA_B4D1C4
	db $00, $00, $04, $00, $04, $00, $06, $00, $3C, $00
DATA_B4D1C4:
	db $0E, ">K. ROOL'S KEEP"
	db $10, ">CASTEL DE K.ROOL"

DATA_B4D1E6:
	db $8C, $00, $1E, $00, $32, $04, $04 : dw DATA_B4D1F5
	db $00, $00, $05, $00, $3C, $00
DATA_B4D1F5:
	db $10, ">THE FLYING KROCK"
	db $0F, ">LE CROCO VOLANT"

DATA_B4D218:
	db $64, $00, $2D, $00, $32, $00, $00 : dw DATA_B4D223
	db $0C, $00
DATA_B4D223:
	db $0A, ">LOST WORLD"
	db $0B, ">MONDE PERDU"

DATA_B4D23C:
	db $64, $00, $0A, $00, $32, $00, $00 : dw DATA_B4D247
	db $00, $00
DATA_B4D247:
	db $01, ">A"
	db $01, ">A"

DATA_B4D24D:
	db $5A, $00, $84, $00, $32, $0A, $08 : dw DATA_B4D260
	db $04, $00, $0A, $00, $08, $00, $42, $00, $07, $00
DATA_B4D260:
	db $10, ">GANGPLANK GALLEY"
	db $17, ">PASSERELLE DE LA GAL&RE"

DATA_B4D28B:
	db $0F, $00, $BE, $00, $32, $09, $08 : dw DATA_B4D29E
	db $00, $00, $0B, $00, $09, $00, $09, $00, $08, $00
DATA_B4D29E:
	db $0C, ">KONG KOLLEGE"
	db $0C, ">KOLL&GE KONG"

DATA_B4D2BA:
	db $8F, $00, $B7, $00, $32, $0A, $02 : dw DATA_B4D2CD
	db $15, $00, $0A, $00, $09, $00, $0F, $00, $0A, $00
DATA_B4D2CD:
	db $10, ">LOCKJAW'S LOCKER"
	db $11, ">CASIER DE LOCKJAW"

DATA_B4D2F2:
	db $AF, $00, $5C, $00, $32, $0C, $04 : dw DATA_B4D305
	db $0B, $00, $0F, $00, $0B, $00, $0D, $00, $0C, $00
DATA_B4D305:
	db $0F, ">TOPSAIL TROUBLE"
	db $15, ">MICMAC DANS LA M$TURE"

DATA_B4D32D:
	db $D9, $00, $3C, $00, $32, $0C, $04 : dw DATA_B4D340
	db $00, $00, $0C, $00, $0C, $00, $0E, $00, $0D, $00
DATA_B4D340:
	db $12, ">FUNKY'S FLIGHTS II"
	db $0D, ">VOLS FUNKY II"

DATA_B4D363:
	db $AF, $00, $14, $00, $32, $04, $04 : dw DATA_B4D372
	db $09, $00, $0D, $00, $0D, $00
DATA_B4D372:
	db $0B, ">KROW'S NEST"
	db $0B, ">NID DE KROW"

DATA_B4D38C:
	db $90, $00, $82, $00, $32, $0C, $04 : dw DATA_B4D39F
	db $00, $00, $0B, $00, $0A, $00, $0C, $00, $0B, $00
DATA_B4D39F:
	db $16, ">SWANKY'S BONUS BONANZA"
	db $16, ">BONUS % GOGO DE SWANKY"

DATA_B4D3CF:
	db $73, $00, $B6, $00, $32, $09, $00 : dw DATA_B4D3E2
	db $07, $00, $11, $00, $0E, $00, $12, $00, $0F, $00
DATA_B4D3E2:
	db $0C, ">HOT-HEAD HOP"
	db $1A, ">PARCOURS DES T(TES BR;L?ES"

DATA_B4D40C:
	db $C4, $00, $BC, $00, $32, $03, $02 : dw DATA_B4D41F
	db $00, $00, $13, $00, $10, $00, $10, $00, $0E, $00
DATA_B4D41F:
	db $16, ">SWANKY'S BONUS BONANZA"
	db $16, ">BONUS % GOGO DE SWANKY"

DATA_B4D44F:
	db $64, $00, $87, $00, $32, $04, $04 : dw DATA_B4D45E
	db $00, $00, $10, $00, $0F, $00
DATA_B4D45E:
	db $0E, ">KLUBBA'S KIOSK"
	db $11, ">KIOSQUE DE KLUBBA"

DATA_B4D481:
	db $C8, $00, $6B, $00, $32, $0B, $01 : dw DATA_B4D498
	db $25, $00, $11, $00, $10, $00, $15, $00, $11, $00, $14, $00, $12, $00
DATA_B4D498:
	db $0E, ">KANNON'S KLAIM"
	db $14, ">COMPLAINTE DE KANNON"

DATA_B4D4BE:
	db $EB, $00, $41, $00, $32, $04, $04 : dw DATA_B4D4CD
	db $00, $00, $13, $00, $12, $00
DATA_B4D4CD:
	db $12, ">FUNKY'S FLIGHTS II"
	db $0D, ">VOLS FUNKY II"

DATA_B4D4F0:
	db $78, $00, $64, $00, $32, $0B, $01 : dw DATA_B4D507
	db $14, $00, $13, $00, $11, $00, $17, $00, $13, $00, $16, $00, $17, $00
DATA_B4D507:
	db $0B, ">LAVA LAGOON"
	db $0D, ">LAGON DE LAVE"

DATA_B4D523:
	db $96, $00, $3F, $00, $32, $04, $04 : dw DATA_B4D532
	db $00, $00, $15, $00, $17, $00
DATA_B4D532:
	db $0C, ">KONG KOLLEGE"
	db $0C, ">KOLL&GE KONG"

DATA_B4D54E:
	db $28, $00, $64, $00, $32, $0B, $01 : dw DATA_B4D565
	db $08, $00, $15, $00, $13, $00, $18, $00, $14, $00, $19, $00, $15, $00
DATA_B4D565:
	db $0C, ">RED-HOT RIDE"
	db $12, ">TRAVERS?E EMBRAS?E"

DATA_B4D587:
	db $04, $00, $73, $00, $32, $01, $01 : dw DATA_B4D596
	db $00, $00, $17, $00, $14, $00
DATA_B4D596:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4D5B5:
	db $67, $00, $2A, $00, $32, $0C, $04 : dw DATA_B4D5C8
	db $24, $00, $17, $00, $15, $00, $1A, $00, $16, $00
DATA_B4D5C8:
	db $0F, ">SQUAWKS'S SHAFT"
	db $12, ">PERCHOIR DE SQUAWK"

DATA_B4D5ED:
	db $7B, $00, $08, $00, $32, $04, $04 : dw DATA_B4D5FC
	db $21, $00, $19, $00, $16, $00
DATA_B4D5FC:
	db $0E, ">KLEEVER'S KILN"
	db $12, ">FOURNIL DE KLEEVER"

DATA_B4D620:
	db $2E, $00, $B7, $00, $32, $01, $00 : dw DATA_B4D62F
	db $28, $00, $1C, $00, $18, $00
DATA_B4D62F:
	db $0C, ">BARREL BAYOU"
	db $0E, ">BAYOU DU BARIL"

DATA_B4D64D:
	db $9C, $00, $AA, $00, $32, $0B, $02 : dw DATA_B4D664
	db $01, $00, $1D, $00, $1C, $00, $1B, $00, $18, $00, $23, $00, $19, $00
DATA_B4D664:
	db $11, ">GLIMMER'S GALLEON"
	db $11, ">GALION DE GLIMMER"

DATA_B4D68A:
	db $0E, $01, $B4, $00, $32, $0B, $0A : dw DATA_B4D6A1
	db $29, $00, $1E, $00, $1E, $00, $1C, $00, $1C, $00, $25, $00, $1D, $00
DATA_B4D6A1:
	db $11, ">KROCKHEAD KLAMBER"
	db $17, ">CRAPAHUTE DES CROQUEURS"

DATA_B4D6CD:
	db $60, $01, $9B, $00, $32, $0E, $02 : dw DATA_B4D6E4
	db $05, $00, $1D, $00, $1E, $00, $1F, $00, $22, $00, $20, $00, $1F, $00
DATA_B4D6E4:
	db $0D, ">RATTLE BATTLE"
	db $11, ">BATAILLE CANAILLE"

DATA_B4D706:
	db $B8, $01, $C6, $00, $32, $02, $02 : dw DATA_B4D715
	db $00, $00, $1E, $00, $22, $00
DATA_B4D715:
	db $0E, ">KLUBBA'S KIOSK"
	db $11, ">KIOSQUE DE KLUBBA"

DATA_B4D738:
	db $6F, $01, $5A, $00, $32, $0E, $04 : dw DATA_B4D74F
	db $0A, $00, $26, $00, $23, $00, $1E, $00, $1F, $00, $21, $00, $20, $00
DATA_B4D74F:
	db $0B, ">SLIME CLIMB"
	db $13, ">ASCENSION VISQUEUSE"

DATA_B4D771:
	db $90, $01, $21, $00, $32, $06, $02 : dw DATA_B4D784
	db $2D, $00, $20, $00, $20, $00, $22, $00, $21, $00
DATA_B4D784:
	db $0D, ">BRAMBLE BLAST"
	db $0E, ">CHARDON ARDENT"

DATA_B4D7A3:
	db $C2, $01, $70, $00, $32, $02, $02 : dw DATA_B4D7B2
	db $63, $00, $21, $00, $21, $00
DATA_B4D7B2:
	db $10, ">KUDGEL'S KONTEST"
	db $10, ">KOMBAT DE KUDGEL"

DATA_B4D7D6:
	db $6E, $00, $58, $00, $32, $0C, $04 : dw DATA_B4D7E9
	db $00, $00, $1C, $00, $19, $00, $24, $00, $1A, $00
DATA_B4D7E9:
	db $0C, ">KONG KOLLEGE"
	db $0C, ">KOLL&GE KONG"

DATA_B4D805:
	db $A5, $00, $28, $00, $32, $06, $02 : dw DATA_B4D818
	db $00, $00, $23, $00, $1A, $00, $25, $00, $1B, $00
DATA_B4D818:
	db $12, ">FUNKY'S FLIGHTS II"
	db $0D, ">VOLS FUNKY II"

DATA_B4D83B:
	db $0F, $01, $8A, $00, $32, $06, $02 : dw DATA_B4D84E
	db $00, $00, $24, $00, $1B, $00, $1D, $00, $1D, $00
DATA_B4D84E:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4D86D:
	db $4A, $01, $50, $00, $32, $01, $01 : dw DATA_B4D87C
	db $00, $00, $20, $00, $23, $00
DATA_B4D87C:
	db $16, ">SWANKY'S BONUS BONANZA"
	db $16, ">BONUS % GOGO DE SWANKY"

DATA_B4D8AC:
	db $07, $00, $B1, $00, $02, $00, $00 : dw DATA_B4D8BB
	db $05, $00, $10, $00, $24, $00
DATA_B4D8BB:
	db $01, ">A"
	db $01, ">A"

DATA_B4D8C1:
	db $1C, $00, $84, $00, $32, $01, $00 : dw DATA_B4D8D0
	db $19, $00, $29, $00, $25, $00
DATA_B4D8D0:
	db $0D, ">GHOSTLY GROVE"
	db $0E, ">FUNESTE FUTAIE"

DATA_B4D8EF:
	db $41, $00, $BE, $00, $32, $0A, $02 : dw DATA_B4D902
	db $3C, $00, $28, $00, $25, $00, $2A, $00, $26, $00
DATA_B4D902:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4D921:
	db $64, $00, $9B, $00, $32, $05, $04 : dw DATA_B4D934
	db $10, $00, $2C, $00, $27, $00, $29, $00, $26, $00
DATA_B4D934:
	db $0C, ">HAUNTED HALL"
	db $0B, ">ANTRE HANT?"

DATA_B4D94F:
	db $EB, $00, $A6, $00, $32, $02, $02 : dw DATA_B4D95E
	db $4C, $00, $2C, $00, $28, $00
DATA_B4D95E:
	db $0C, ">KONG KOLLEGE"
	db $0C, ">KOLL&GE KONG"

DATA_B4D97A:
	db $B9, $00, $B2, $00, $32, $0B, $02 : dw DATA_B4D991
	db $18, $00, $2B, $00, $28, $00, $2A, $00, $27, $00, $2E, $00, $29, $00
DATA_B4D991:
	db $0B, ">GUSTY GLADE"
	db $0D, ">FATALE RAFALE"

DATA_B4D9AD:
	db $E9, $00, $73, $00, $32, $02, $02 : dw DATA_B4D9BC
	db $44, $00, $2E, $00, $2A, $00
DATA_B4D9BC:
	db $16, ">SWANKY'S BONUS BONANZA"
	db $16, ">BONUS % GOGO DE SWANKY"

DATA_B4D9EC:
	db $C7, $00, $59, $00, $32, $0F, $04 : dw DATA_B4DA07
	db $13, $00, $2D, $00, $2A, $00, $2F, $00, $2B, $00, $2C, $00, $29, $00, $31, $00, $2C, $00
DATA_B4DA07:
	db $12, ">PARROT CHUTE PANIC"
	db $11, ">PERROQUET PANIQU?"

DATA_B4DA2E:
	db $9E, $00, $64, $00, $32, $01, $01 : dw DATA_B4DA3D
	db $5C, $00, $2E, $00, $2B, $00
DATA_B4DA3D:
	db $0E, ">KLUBBA'S KIOSK"
	db $11, ">KIOSQUE DE KLUBBA"

DATA_B4DA60:
	db $7F, $00, $0C, $00, $32, $05, $01 : dw DATA_B4DA73
	db $54, $00, $2E, $00, $2C, $00, $32, $00, $2E, $00
DATA_B4DA73:
	db $12, ">FUNKY'S FLIGHTS II"
	db $0D, ">VOLS FUNKY II"

DATA_B4DA96:
	db $6E, $00, $44, $00, $32, $0A, $08 : dw DATA_B4DAA9
	db $17, $00, $33, $00, $2F, $00, $31, $00, $2E, $00
DATA_B4DAA9:
	db $09, ">WEB WOODS"
	db $0E, ">TOILE DES BOIS"

DATA_B4DAC4:
	db $2B, $00, $26, $00, $32, $01, $01 : dw DATA_B4DAD3
	db $0D, $00, $32, $00, $2F, $00
DATA_B4DAD3:
	db $0B, ">KREEPY KROW"
	db $10, ">KROW L'INKI?TANT"

DATA_B4DAF2:
	db $9E, $00, $81, $01, $32, $0D, $00 : dw DATA_B4DB09
	db $6C, $00, $35, $00, $31, $00, $38, $00, $34, $00, $36, $00, $30, $00
DATA_B4DB09:
	db $0C, ">ARCTIC ABYSS"
	db $11, ">ABYSSES ARCTIQUES"

DATA_B4DB2A:
	db $E1, $00, $8A, $01, $32, $02, $02 : dw DATA_B4DB39
	db $3D, $00, $34, $00, $31, $00
DATA_B4DB39:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4DB58:
	db $9E, $00, $47, $01, $32, $06, $04 : dw DATA_B4DB6B
	db $23, $00, $37, $00, $32, $00, $34, $00, $30, $00
DATA_B4DB6B:
	db $0A, ">WINDY WELL"
	db $0F, ">GOUFFRE GLACIAL"

DATA_B4DB88:
	db $5A, $00, $56, $01, $32, $09, $01 : dw DATA_B4DB9B
	db $45, $00, $36, $00, $32, $00, $39, $00, $33, $00
DATA_B4DB9B:
	db $0C, ">KONG KOLLEGE"
	db $0C, ">KOLL&GE KONG"

DATA_B4DBB7:
	db $16, $00, $45, $01, $32, $04, $04 : dw DATA_B4DBC6
	db $5D, $00, $34, $00, $34, $00
DATA_B4DBC6:
	db $0E, ">KLUBBA'S KIOSK"
	db $11, ">KIOSQUE DE KLUBBA"

DATA_B4DBE9:
	db $A2, $00, $09, $01, $32, $0C, $04 : dw DATA_B4DBFC
	db $62, $00, $37, $00, $33, $00, $3A, $00, $35, $00
DATA_B4DBFC:
	db $0C, ">CASTLE CRUSH"
	db $0F, ">BASTION BROYEUR"

DATA_B4DC1B:
	db $9B, $00, $C3, $00, $32, $0C, $04 : dw DATA_B4DC2E
	db $8F, $00, $39, $00, $35, $00, $3B, $00, $36, $00
DATA_B4DC2E:
	db $10, ">CLAPPER'S CAVERN"
	db $12, ">CAVERNE DE CLAPPER"

DATA_B4DC54:
	db $97, $00, $86, $00, $32, $0D, $04 : dw DATA_B4DC6B
	db $6D, $00, $3C, $00, $37, $00, $3A, $00, $36, $00, $3D, $00, $38, $00
DATA_B4DC6B:
	db $12, ">CHAIN LINK CHAMBER"
	db $10, ">SALON DU MAILLON"

DATA_B4DC91:
	db $DC, $00, $8C, $00, $32, $02, $02 : dw DATA_B4DCA0
	db $55, $00, $3B, $00, $37, $00
DATA_B4DCA0:
	db $12, ">FUNKY'S FLIGHTS II"
	db $0D, ">VOLS FUNKY II"

DATA_B4DCC3:
	db $56, $00, $52, $00, $32, $09, $01 : dw DATA_B4DCD6
	db $00, $00, $3B, $00, $38, $00, $3F, $00, $3A, $00
DATA_B4DCD6:
	db $16, ">SWANKY'S BONUS BONANZA"
	db $16, ">BONUS % GOGO DE SWANKY"

DATA_B4DD06:
	db $97, $00, $37, $00, $32, $0A, $02 : dw DATA_B4DD19
	db $6E, $00, $3D, $00, $3A, $00, $40, $00, $3B, $00
DATA_B4DD19:
	db $0B, ">TOXIC TOWER"
	db $0C, ">TOUR TOXIQUE"

DATA_B4DD34:
	db $97, $00, $16, $00, $32, $04, $04 : dw DATA_B4DD43
	db $B9, $00, $3F, $00, $3B, $00
DATA_B4DD43:
	db $13, ">STRONGHOLD SHOWDOWN"
	db $15, ">CONFRONTATION AU FORT"

if !override_pirate_panic == 1
DATA_B4DD6F:
	db $1D, $00, $44, $00, $32, $01, $00 : dw DATA_B4DD7E
	db !pirate_panic_replacement, $00, $42, $00, $05, $00
DATA_B4DD7E:
	db $0C, ">PIRATE PANIC"
	db $0E, ">PANIQUE % BORD"
else
DATA_B4DD6F:
	db $1D, $00, $44, $00, $32, $01, $00 : dw DATA_B4DD7E
	db $03, $00, $42, $00, $05, $00
DATA_B4DD7E:
	db $0C, ">PIRATE PANIC"
	db $0E, ">PANIQUE % BORD"
endif

DATA_B4DD9C:
	db $64, $00, $2D, $00, $32, $0E, $02 : dw DATA_B4DDB3
	db $0C, $00, $41, $00, $05, $00, $09, $00, $07, $00, $43, $00, $06, $00
DATA_B4DDB3:
	db $10, ">MAINBRACE MAYHEM"
	db $17, ">M?LI-M?LO DANS LES M$TS"

DATA_B4DDDE:
	db $64, $00, $0A, $00, $32, $04, $04 : dw DATA_B4DDED
	db $00, $00, $42, $00, $06, $00
DATA_B4DDED:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4DE0C:
	db $64, $00, $4B, $00, $02, $04, $00 : dw DATA_B4DE1B
	db $00, $00, $45, $00, $3F, $00
DATA_B4DE1B:
	db $01, ">A"
	db $01, ">A"

DATA_B4DE21:
	db $6E, $00, $9A, $00, $32, $0B, $02 : dw DATA_B4DE38
	db $2C, $00, $47, $00, $48, $00, $44, $00, $3F, $00, $46, $00, $40, $00
DATA_B4DE38:
	db $0D, ">MUDHOLE MARSH"
	db $0E, ">MARAIS MARRANT"

DATA_B4DE57:
	db $8F, $00, $71, $00, $32, $05, $04 : dw DATA_B4DE6A
	db $02, $00, $48, $00, $41, $00, $45, $00, $40, $00
DATA_B4DE6A:
	db $0C, ">RAMBI RUMBLE"
	db $0F, ">RAMBI CHAMBARDE"

DATA_B4DE89:
	db $9D, $00, $A0, $00, $32, $02, $02 : dw DATA_B4DE98
	db $5B, $00, $45, $00, $48, $00
DATA_B4DE98:
	db $0E, ">KLUBBA'S KIOSK"
	db $11, ">KIOSQUE DE KLUBBA"

DATA_B4DEBB:
	db $C3, $00, $90, $00, $32, $02, $02 : dw DATA_B4DECA
	db $60, $00, $46, $00, $41, $00
DATA_B4DECA:
	db $0F, ">KING ZING STING"
	db $0E, ">ROI ZING STING"

DATA_B4DEEB:
	db $22, $00, $7A, $00, $32, $0C, $04 : dw DATA_B4DEFE
	db $0E, $00, $4F, $00, $42, $00, $4A, $00, $43, $00
DATA_B4DEFE:
	db $0D, ">TARGET TERROR"
	db $12, ">OBJECTIF EPOUVANTE"

DATA_B4DF21:
	db $3A, $00, $20, $00, $32, $07, $04 : dw DATA_B4DF38
	db $2E, $00, $4B, $00, $44, $00, $53, $00, $49, $00, $49, $00, $43, $00
DATA_B4DF38:
	db $10, ">BRAMBLE SCRAMBLE"
	db $13, ">EMBROUILLAMINI JOLI"

DATA_B4DF5F:
	db $96, $00, $14, $00, $32, $06, $02 : dw DATA_B4DF72
	db $0F, $00, $4A, $00, $44, $00, $4C, $00, $45, $00
DATA_B4DF72:
	db $0C, ">RICKETY RACE"
	db $11, ">A BOUT DE SOUFFLE"

DATA_B4DF93:
	db $98, $00, $BC, $00, $32, $0B, $08 : dw DATA_B4DFAA
	db $00, $00, $4E, $00, $46, $00, $4D, $00, $47, $00, $4B, $00, $45, $00
DATA_B4DFAA:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4DFC9:
	db $59, $00, $AF, $00, $32, $01, $01 : dw DATA_B4DFD8
	db $00, $00, $4C, $00, $47, $00
DATA_B4DFD8:
	db $16, ">SWANKY'S BONUS BONANZA"
	db $16, ">BONUS % GOGO DE SWANKY"

DATA_B4E008:
	db $EB, $00, $C8, $00, $02, $00, $00 : dw DATA_B4E017
	db $00, $00, $4C, $00, $56, $00
DATA_B4E017:
	db $01, ">A"
	db $01, ">A"

DATA_B4E01D:
	db $05, $00, $B4, $00, $02, $08, $00 : dw DATA_B4E02C
	db $00, $00, $49, $00, $42, $00
DATA_B4E02C:
	db $01, ">A"
	db $01, ">A"

DATA_B4E032:
	db $11, $00, $7F, $00, $32, $09, $00 : dw DATA_B4E045
	db $11, $00, $51, $00, $3D, $00, $52, $00, $3E, $00
DATA_B4E045:
	db $0B, ">HORNET HOLE"
	db $13, ">FRELONS FR?MISSANTS"

DATA_B4E067:
	db $44, $00, $A6, $00, $32, $0A, $02 : dw DATA_B4E07A
	db $4B, $00, $50, $00, $3D, $00, $52, $00, $4A, $00
DATA_B4E07A:
	db $0C, ">KONG KOLLEGE"
	db $0C, ">KOLL&GE KONG"

DATA_B4E096:
	db $47, $00, $42, $00, $02, $00, $00 : dw DATA_B4E0A5
	db $00, $00, $50, $00, $54, $00
DATA_B4E0A5:
	db $01, ">A"
	db $01, ">A"

DATA_B4E0AB:
	db $14, $00, $14, $00, $32, $01, $01 : dw DATA_B4E0BA
	db $00, $00, $4A, $00, $49, $00
DATA_B4E0BA:
	db $12, ">FUNKY'S FLIGHTS II"
	db $0D, ">VOLS FUNKY II"

DATA_B4E0DD:
	db $03, $00, $89, $00, $02, $00, $00 : dw DATA_B4E0EC
	db $00, $00, $1B, $00, $4B, $00
DATA_B4E0EC:
	db $01, ">A"
	db $01, ">A"

DATA_B4E0F2:
	db $01, $00, $84, $00, $02, $00, $00 : dw DATA_B4E101
	db $00, $00, $50, $00, $4C, $00
DATA_B4E101:
	db $01, ">A"
	db $01, ">A"

DATA_B4E107:
	db $03, $00, $7D, $00, $02, $00, $00 : dw DATA_B4E116
	db $00, $00, $28, $00, $4D, $00
DATA_B4E116:
	db $01, ">A"
	db $01, ">A"

DATA_B4E11C:
	db $AF, $00, $AE, $01, $02, $00, $00 : dw DATA_B4E12B
	db $00, $00, $34, $00, $4E, $00
DATA_B4E12B:
	db $01, ">A"
	db $01, ">A"

DATA_B4E131:
	db $1C, $00, $44, $00, $32, $00, $00 : dw DATA_B4E140
	db $00, $00, $41, $00, $4F, $00
DATA_B4E140:
	db $01, ">A"
	db $01, ">A"

DATA_B4E146:
	db $2C, $00, $82, $00, $02, $00, $00 : dw DATA_B4E155
	db $00, $00, $5B, $00, $50, $00
DATA_B4E155:
	db $01, ">A"
	db $01, ">A"

DATA_B4E15B:
	db $96, $00, $C3, $00, $32, $0B, $00 : dw DATA_B4E172
	db $2F, $00, $5C, $00, $52, $00, $77, $00, $6B, $00, $5D, $00, $53, $00
DATA_B4E172:
	db $10, ">SCREECH'S SPRINT"
	db $11, ">SPRINT DE SCREECH"

DATA_B4E197:
	db $D2, $00, $C3, $00, $32, $02, $02 : dw DATA_B4E1A6
	db $00, $00, $5B, $00, $52, $00
DATA_B4E1A6:
	db $0C, ">KONG KOLLEGE"
	db $0C, ">KOLL&GE KONG"

DATA_B4E1C2:
	db $B4, $00, $70, $00, $32, $04, $04 : dw DATA_B4E1D1
	db $61, $00, $5B, $00, $53, $00
DATA_B4E1D1:
	db $0B, ">K.ROOL DUEL"
	db $10, ">DUEL AVEC K.ROOL"

DATA_B4E1F0:
	db $50, $00, $B1, $00, $32, $03, $00 : dw DATA_B4E203
	db $00, $00, $5F, $00, $57, $00, $60, $00, $58, $00
DATA_B4E203:
	db $1C, ">RETURN TO CROCODILE CAULDRON"
	db $1B, ">RETOUR AU CHAUDRON DU CROCO"

DATA_B4E23E:
	db $74, $00, $CB, $00, $32, $02, $02 : dw DATA_B4E24D
	db $00, $00, $5E, $00, $57, $00
DATA_B4E24D:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4E26C:
	db $11, $00, $82, $00, $32, $09, $01 : dw DATA_B4E27F
	db $99, $00, $5E, $00, $58, $00, $61, $00, $59, $00
DATA_B4E27F:
	db $0B, ">JUNGLE JINX"
	db $11, ">JUNGLE ENSORCEL?E"

DATA_B4E29F:
	db $8E, $00, $62, $00, $32, $04, $04 : dw DATA_B4E2AE
	db $6B, $00, $60, $00, $59, $00
DATA_B4E2AE:
	db $0E, ">KROCODILE KORE"
	db $0F, ">KANINE DU KROCO"

DATA_B4E2CF:
	db $50, $00, $B1, $00, $32, $09, $00 : dw DATA_B4E2E2
	db $00, $00, $63, $00, $5A, $00, $64, $00, $5B, $00
DATA_B4E2E2:
	db $13, ">RETURN TO KREM QUAY"
	db $13, ">RETOUR AU QUAI KREM"

DATA_B4E30C:
	db $74, $00, $CB, $00, $32, $02, $02 : dw DATA_B4E31B
	db $00, $00, $62, $00, $5A, $00
DATA_B4E31B:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4E33A:
	db $2C, $00, $82, $00, $32, $0C, $04 : dw DATA_B4E34D
	db $96, $00, $62, $00, $5B, $00, $65, $00, $5C, $00
DATA_B4E34D:
	db $10, ">BLACK ICE BATTLE"
	db $1A, ">BATAILLE DE LA GLACE NOIRE"

DATA_B4E37B:
	db $8E, $00, $62, $00, $32, $04, $04 : dw DATA_B4E38A
	db $6B, $00, $64, $00, $5C, $00
DATA_B4E38A:
	db $0E, ">KROCODILE KORE"
	db $0F, ">KANINE DU KROCO"

DATA_B4E3AB:
	db $50, $00, $B1, $00, $32, $09, $00 : dw DATA_B4E3BE
	db $00, $00, $67, $00, $5D, $00, $68, $00, $5E, $00
DATA_B4E3BE:
	db $18, ">RETURN TO KRAZY KREMLAND"
	db $17, ">RETOUR % KREMLAND DINGO"

DATA_B4E3F1:
	db $74, $00, $CB, $00, $32, $02, $02 : dw DATA_B4E400
	db $00, $00, $66, $00, $5D, $00
DATA_B4E400:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4E41F:
	db $5E, $00, $96, $00, $32, $0C, $04 : dw DATA_B4E432
	db $80, $00, $66, $00, $5E, $00, $69, $00, $5F, $00
DATA_B4E432:
	db $0F, ">KLOBBER KARNAGE"
	db $15, ">CH$TAIGNES ET MARRONS"

DATA_B4E45A:
	db $8E, $00, $62, $00, $32, $04, $04 : dw DATA_B4E469
	db $6B, $00, $68, $00, $5F, $00
DATA_B4E469:
	db $0E, ">KROCODILE KORE"
	db $0F, ">KANINE DU KROCO"

DATA_B4E48A:
	db $50, $00, $B1, $00, $32, $09, $00 : dw DATA_B4E49D
	db $00, $00, $6B, $00, $60, $00, $6C, $00, $61, $00
DATA_B4E49D:
	db $16, ">RETURN TO GLOOMY GULCH"
	db $14, ">RETOUR AU RAVIN RAVI"

DATA_B4E4CB:
	db $74, $00, $CB, $00, $32, $02, $02 : dw DATA_B4E4DA
	db $00, $00, $6A, $00, $60, $00
DATA_B4E4DA:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4E4F9:
	db $96, $00, $8A, $00, $32, $0A, $02 : dw DATA_B4E50C
	db $16, $00, $6A, $00, $61, $00, $6D, $00, $62, $00
DATA_B4E50C:
	db $0D, ">FIERY FURNACE"
	db $12, ">FOURNAISE FURIEUSE"

DATA_B4E52F:
	db $8E, $00, $62, $00, $32, $04, $04 : dw DATA_B4E53E
	db $6B, $00, $6C, $00, $62, $00
DATA_B4E53E:
	db $0E, ">KROCODILE KORE"
	db $0F, ">KANINE DU KROCO"

DATA_B4E55F:
	db $50, $00, $B1, $00, $32, $05, $00 : dw DATA_B4E572
	db $00, $00, $70, $00, $64, $00, $6F, $00, $63, $00
DATA_B4E572:
	db $17, ">RETURN TO K.ROOL'S KEEP"
	db $1A, ">RETOUR AU CASTEL DE K.ROOL"

DATA_B4E5A7:
	db $74, $00, $CB, $00, $32, $02, $02 : dw DATA_B4E5B6
	db $00, $00, $6E, $00, $63, $00
DATA_B4E5B6:
	db $0D, ">MONKEY MUSEUM"
	db $0E, ">MUS?E DU SINGE"

DATA_B4E5D5:
	db $D4, $00, $A2, $00, $32, $0A, $02 : dw DATA_B4E5E8
	db $9A, $00, $6E, $00, $64, $00, $71, $00, $65, $00
DATA_B4E5E8:
	db $0D, ">ANIMAL ANTICS"
	db $14, ">FAC?TIES ANIMALI&RES"

DATA_B4E60D:
	db $8E, $00, $62, $00, $32, $04, $04 : dw DATA_B4E61C
	db $6B, $00, $70, $00, $65, $00
DATA_B4E61C:
	db $0E, ">KROCODILE KORE"
	db $0F, ">KANINE DU KROCO"

DATA_B4E63D:
	db $64, $00, $88, $00, $02, $00, $00 : dw DATA_B4E64C
	db $00, $00, $12, $00, $66, $00
DATA_B4E64C:
	db $01, ">A"
	db $01, ">A"

DATA_B4E652:
	db $B8, $01, $C7, $00, $02, $00, $00 : dw DATA_B4E661
	db $00, $00, $1F, $00, $67, $00
DATA_B4E661:
	db $01, ">A"
	db $01, ">A"

DATA_B4E667:
	db $9D, $00, $A1, $00, $02, $00, $00 : dw DATA_B4E676
	db $00, $00, $47, $00, $68, $00
DATA_B4E676:
	db $01, ">A"
	db $01, ">A"

DATA_B4E67C:
	db $9E, $00, $65, $00, $02, $00, $00 : dw DATA_B4E68B
	db $00, $00, $2F, $00, $69, $00
DATA_B4E68B:
	db $01, ">A"
	db $01, ">A"

DATA_B4E691:
	db $16, $00, $46, $01, $02, $00, $00 : dw DATA_B4E6A0
	db $00, $00, $38, $00, $6A, $00
DATA_B4E6A0:
	db $01, ">A"
	db $01, ">A"

DATA_B4E6A6:
	db $64, $00, $A0, $00, $32, $01, $01 : dw DATA_B4E6B5
	db $00, $00, $5B, $00, $6B, $00
DATA_B4E6B5:
	db $12, ">FUNKY'S FLIGHTS II"
	db $0D, ">VOLS FUNKY II"

DATA_B4E6D8:
	dw DATA_B4E7B0
	dw DATA_B4E7CD
	dw DATA_B4E7E2
	dw DATA_B4E80B
	dw DATA_B4E844
	dw DATA_B4E851
	dw DATA_B4E866
	dw DATA_B4E873
	dw DATA_B4E884
	dw DATA_B4E8A1
	dw DATA_B4E8B2
	dw DATA_B4E8C3
	dw DATA_B4E8D4
	dw DATA_B4E8E5
	dw DATA_B4E8F6
	dw DATA_B4E913
	dw DATA_B4E924
	dw DATA_B4E93D
	dw DATA_B4E956
	dw DATA_B4E96F
	dw DATA_B4E984
	dw DATA_B4E999
	dw DATA_B4E9BE
	dw DATA_B4E9CF
	dw DATA_B4E9E4
	dw DATA_B4EA01
	dw DATA_B4EA1A
	dw DATA_B4EA3F
	dw DATA_B4EA68
	dw DATA_B4EA89
	dw DATA_B4EA9A
	dw DATA_B4EABB
	dw DATA_B4EAD0
	dw DATA_B4EAF9
	dw DATA_B4EB2A
	dw DATA_B4EB47
	dw DATA_B4EB58
	dw DATA_B4EB79
	dw DATA_B4EB96
	dw DATA_B4EBAB
	dw DATA_B4EBD0
	dw DATA_B4EBE1
	dw DATA_B4EBFA
	dw DATA_B4EC0B
	dw DATA_B4EC1C
	dw !null_pointer
	dw DATA_B4EC35
	dw DATA_B4EC46
	dw DATA_B4EC5B
	dw DATA_B4EC70
	dw DATA_B4EC85
	dw DATA_B4EC9A
	dw DATA_B4ECB7
	dw DATA_B4ECE4
	dw DATA_B4ECF5
	dw DATA_B4ED12
	dw DATA_B4ED23
	dw !null_pointer
	dw DATA_B4ED38
	dw DATA_B4ED55
	dw DATA_B4ED66
	dw DATA_B4ED77
	dw DATA_B4ED88
	dw DATA_B4EDA9
	dw DATA_B4EDCA
	dw DATA_B4EDE3
	dw DATA_B4EE00
	dw DATA_B4EE11
	dw DATA_B4EE26
	dw DATA_B4EE3B
	dw DATA_B4EE64
	dw DATA_B4EE75
	dw DATA_B4EE8A
	dw DATA_B4EE9B
	dw DATA_B4EEA8
	dw DATA_B4EEC9
	dw DATA_B4EEDE
	dw DATA_B4EEEB
	dw DATA_B4EEF8
	dw DATA_B4EF05
	dw DATA_B4EF12
	dw !null_pointer
	dw DATA_B4EF2F
	dw DATA_B4EF50
	dw DATA_B4EF65
	dw DATA_B4EF86
	dw DATA_B4EFA7
	dw DATA_B4EFB8
	dw DATA_B4EFCD
	dw DATA_B4EFE2
	dw DATA_B4EFB8
	dw DATA_B4F007
	dw DATA_B4F01C
	dw DATA_B4EFB8
	dw DATA_B4F041
	dw DATA_B4F04E
	dw DATA_B4EFB8
	dw DATA_B4F05B
	dw DATA_B4F074
	dw DATA_B4EFB8
	dw DATA_B4F091
	dw DATA_B4F0A2
	dw DATA_B4F0C3
	dw DATA_B4F0D0
	dw DATA_B4F0DD
	dw DATA_B4F0EA
	dw DATA_B4F0F7
	dw DATA_B4F104

DATA_B4E7B0:
	db $04, $20, $3E, $00, $20
	dw $0014, $0168
	dw $0000, $0181
	dw $0000, $01BA
	dw $001B, $01C4
	dw $003A, $01BE
	dw $003A, $01A7

DATA_B4E7CD:
	db $02, $20, $3E, $00, $30
	dw $003A, $01A7
	dw $005A, $01CE
	dw $00B4, $01CE
	dw $00B4, $01AB

DATA_B4E7E2:
	db $07, $20, $3E, $00, $30
	dw $00B4, $01AB
	dw $00B9, $0190
	dw $00D2, $018D
	dw $00E1, $016D
	dw $00E6, $014A
	dw $00DC, $0144
	dw $00CD, $0145
	dw $00A7, $0145
	dw $0096, $013D

DATA_B4E80B:
	db $0B, $20, $3E, $00, $30
	dw $0096, $013D
	dw $008C, $0145
	dw $0064, $0145
	dw $005A, $0140
	dw $0053, $013B
	dw $0050, $0135
	dw $004C, $012A
	dw $004D, $0123
	dw $0050, $011A
	dw $0058, $010B
	dw $005F, $0100
	dw $0069, $00FA
	dw $0081, $00FA

DATA_B4E844:
	db $00, $20, $3E, $00, $30
	dw $0081, $00FA
	dw $0081, $0092

DATA_B4E851:
	db $02, $20, $3E, $00, $30
	dw $001D, $0044
	dw $0028, $0061
	dw $0053, $0032
	dw $0064, $002D

DATA_B4E866:
	db $00, $20, $3E, $00, $30
	dw $0064, $002D
	dw $0064, $000A

DATA_B4E873:
	db $01, $20, $3E, $00, $30
	dw $0064, $002D
	dw $0064, $007D
	dw $005A, $0084

DATA_B4E884:
	db $04, $20, $3E, $00, $30
	dw $005A, $0084
	dw $0052, $0080
	dw $004A, $0080
	dw $0046, $0087
	dw $0041, $00AF
	dw $000F, $00BE

DATA_B4E8A1:
	db $01, $20, $3E, $00, $30
	dw $000F, $00BE
	dw $008C, $00B7
	dw $008F, $00B7

DATA_B4E8B2:
	db $01, $20, $3E, $00, $30
	dw $008F, $00B7
	dw $008F, $008C
	dw $0090, $0082

DATA_B4E8C3:
	db $01, $20, $3E, $00, $30
	dw $0090, $0082
	dw $009B, $0066
	dw $00AF, $005C

DATA_B4E8D4:
	db $01, $20, $3E, $00, $30
	dw $00AF, $005C
	dw $00D4, $004A
	dw $00D9, $003C

DATA_B4E8E5:
	db $01, $20, $3E, $00, $30
	dw $00D9, $003C
	dw $00AF, $0020
	dw $00AF, $0014

DATA_B4E8F6:
	db $04, $20, $3E, $00, $30
	dw $0073, $00B6
	dw $007A, $00C5
	dw $007D, $00C8
	dw $008C, $00C8
	dw $00AA, $00BE
	dw $00C4, $00BC

DATA_B4E913:
	db $01, $20, $3E, $00, $30
	dw $0073, $00B6
	dw $005C, $00A0
	dw $0064, $0087

DATA_B4E924:
	db $03, $20, $3E, $00, $20
	dw $00C4, $00BC
	dw $00D8, $00B7
	dw $00F2, $00B7
	dw $00F2, $006B
	dw $00C8, $006B

DATA_B4E93D:
	db $03, $20, $3E, $00, $30
	dw $00C8, $006B
	dw $00AB, $006B
	dw $00A0, $0064
	dw $0087, $0064
	dw $0078, $0064

DATA_B4E956:
	db $03, $20, $3E, $00, $30
	dw $00C8, $006B
	dw $00B9, $006B
	dw $00B9, $0058
	dw $00C3, $0051
	dw $00EB, $0041

DATA_B4E96F:
	db $02, $20, $3E, $00, $30
	dw $0078, $0064
	dw $0069, $006A
	dw $0037, $006A
	dw $0028, $0064

DATA_B4E984:
	db $02, $20, $3E, $00, $30
	dw $0028, $0064
	dw $001E, $0056
	dw $0004, $0064
	dw $0004, $0073

DATA_B4E999:
	db $06, $20, $3E, $00, $30
	dw $0028, $0064
	dw $0037, $006A
	dw $0046, $0068
	dw $0051, $0062
	dw $0057, $0053
	dw $005E, $0046
	dw $0062, $0043
	dw $0067, $002A

DATA_B4E9BE:
	db $01, $20, $3E, $00, $30
	dw $0067, $002A
	dw $006D, $0014
	dw $007B, $0008

DATA_B4E9CF:
	db $02, $20, $3E, $00, $30
	dw $0078, $0064
	dw $0080, $005F
	dw $0099, $0064
	dw $0096, $003F

DATA_B4E9E4:
	db $04, $20, $3E, $00, $30
	dw $002E, $00B7
	dw $0037, $00B9
	dw $0046, $00BF
	dw $005A, $00B9
	dw $0072, $00B9
	dw $009C, $00AA

DATA_B4EA01:
	db $03, $20, $3E, $00, $30
	dw $009C, $00AA
	dw $009A, $0083
	dw $006B, $008F
	dw $0058, $0062
	dw $006E, $0058

DATA_B4EA1A:
	db $06, $20, $3E, $00, $30
	dw $006E, $0058
	dw $006E, $003B
	dw $0092, $002F
	dw $0095, $0027
	dw $009A, $0023
	dw $009E, $0021
	dw $00A2, $0023
	dw $00A5, $0028

DATA_B4EA3F:
	db $07, $20, $3E, $00, $30
	dw $00A5, $0028
	dw $00AA, $0065
	dw $00C5, $0075
	dw $00C5, $007E
	dw $00CD, $008C
	dw $00D0, $0090
	dw $00DF, $0097
	dw $0100, $0096
	dw $010F, $008A

DATA_B4EA68:
	db $05, $20, $3E, $00, $30
	dw $009C, $00AA
	dw $00A6, $00B2
	dw $00B0, $00B7
	dw $00C1, $00BA
	dw $00D2, $00BA
	dw $00E6, $00B4
	dw $010E, $00B4

DATA_B4EA89:
	db $01, $20, $3E, $00, $30
	dw $010F, $008A
	dw $010E, $00AA
	dw $010E, $00B4

DATA_B4EA9A:
	db $05, $20, $3E, $00, $30
	dw $010E, $00B4
	dw $0122, $00AE
	dw $012C, $00AC
	dw $013F, $00A1
	dw $014C, $00A7
	dw $0154, $00A2
	dw $0160, $009B

DATA_B4EABB:
	db $02, $20, $3E, $00, $30
	dw $0160, $009B
	dw $016E, $0099
	dw $016B, $0068
	dw $016F, $005A

DATA_B4EAD0:
	db $07, $20, $3E, $00, $30
	dw $016F, $005A
	dw $0167, $0054
	dw $0165, $0028
	dw $016B, $001E
	dw $016F, $0018
	dw $0177, $0014
	dw $0180, $0018
	dw $0186, $0021
	dw $0190, $0021

DATA_B4EAF9:
	db $09, $20, $3E, $00, $30
	dw $0190, $0021
	dw $01A4, $0021
	dw $01A7, $0035
	dw $0186, $0064
	dw $019C, $006E
	dw $01A0, $0066
	dw $01AA, $0062
	dw $01AE, $0062
	dw $01B3, $0066
	dw $01B6, $0070
	dw $01C2, $0070

DATA_B4EB2A:
	db $04, $20, $3E, $00, $30
	dw $0160, $009B
	dw $016D, $00AC
	dw $0181, $00B4
	dw $0190, $00B7
	dw $01AC, $00B9
	dw $01B8, $00C6

DATA_B4EB47:
	db $01, $20, $3E, $00, $30
	dw $016F, $005A
	dw $0162, $005A
	dw $014A, $0050

DATA_B4EB58:
	db $05, $20, $3E, $00, $20
	dw $0007, $00B1
	dw $0038, $00BB
	dw $003C, $00CA
	dw $0040, $00CF
	dw $006F, $00CC
	dw $0072, $00C8
	dw $0073, $00B6

DATA_B4EB79:
	db $04, $20, $3E, $00, $30
	dw $001C, $0084
	dw $0023, $0090
	dw $002B, $009A
	dw $002C, $00A0
	dw $0032, $00A5
	dw $0041, $00BE

DATA_B4EB96:
	db $02, $20, $3E, $00, $30
	dw $0041, $00BE
	dw $0050, $00B4
	dw $005A, $00AA
	dw $0064, $009B

DATA_B4EBAB:
	db $06, $20, $3E, $00, $30
	dw $0064, $009B
	dw $005A, $00AA
	dw $0050, $00B4
	dw $0064, $00BD
	dw $0082, $00BC
	dw $009B, $00B2
	dw $00B3, $00B5
	dw $00B9, $00B2

DATA_B4EBD0:
	db $01, $20, $3E, $00, $30
	dw $00B9, $00B2
	dw $00C3, $00AA
	dw $00EB, $00A6

DATA_B4EBE1:
	db $03, $20, $3E, $00, $30
	dw $00B9, $00B2
	dw $00C8, $00AA
	dw $00CF, $008C
	dw $00C5, $005E
	dw $00C7, $0059

DATA_B4EBFA:
	db $01, $20, $3E, $00, $30
	dw $00C7, $0059
	dw $00D7, $0064
	dw $00E9, $0073

DATA_B4EC0B:
	db $01, $20, $3E, $00, $30
	dw $00C7, $0059
	dw $00B4, $005C
	dw $009E, $0064

DATA_B4EC1C:
	db $03, $20, $3E, $00, $30
	dw $00C7, $0059
	dw $00D2, $002E
	dw $009B, $001F
	dw $008E, $0014
	dw $007F, $000C

DATA_B4EC35:
	db $01, $20, $3E, $00, $30
	dw $007F, $000C
	dw $0073, $0028
	dw $006E, $0044

DATA_B4EC46:
	db $02, $20, $3E, $00, $30
	dw $006E, $0044
	dw $004D, $003D
	dw $003B, $0028
	dw $002B, $0026

DATA_B4EC5B:
	db $02, $20, $3E, $00, $30
	dw $009E, $0181
	dw $00A5, $0179
	dw $00A5, $0151
	dw $009E, $0147

DATA_B4EC70:
	db $02, $20, $3E, $00, $30
	dw $009E, $0181
	dw $00B1, $0185
	dw $00C5, $0168
	dw $00E1, $018A

DATA_B4EC85:
	db $02, $20, $3E, $00, $30
	dw $009E, $0147
	dw $007D, $0145
	dw $0064, $0156
	dw $005A, $0156

DATA_B4EC9A:
	db $04, $20, $3E, $00, $30
	dw $005A, $0156
	dw $005A, $013B
	dw $0069, $0131
	dw $006D, $011C
	dw $00A2, $011C
	dw $00A2, $0109

DATA_B4ECB7:
	db $08, $20, $3E, $00, $30
	dw $009E, $0181
	dw $0094, $0190
	dw $0094, $01C6
	dw $000F, $01C6
	dw $000F, $01A4
	dw $0008, $0190
	dw $0011, $017C
	dw $000B, $0168
	dw $000B, $014F
	dw $0016, $0145

DATA_B4ECE4:
	db $01, $20, $3E, $00, $30
	dw $00A2, $0109
	dw $00A0, $00E6
	dw $009B, $00C3

DATA_B4ECF5:
	db $04, $20, $3E, $00, $30
	dw $009B, $00C3
	dw $008E, $00B9
	dw $0087, $00A2
	dw $0087, $0094
	dw $0096, $0094
	dw $0097, $0086

DATA_B4ED12:
	db $01, $20, $3E, $00, $30
	dw $0097, $0086
	dw $009D, $008C
	dw $00DC, $008C

DATA_B4ED23:
	db $02, $20, $3E, $00, $30
	dw $0097, $0086
	dw $0097, $0062
	dw $0064, $0062
	dw $0056, $0052

DATA_B4ED38:
	db $04, $20, $3E, $00, $30
	dw $0056, $0052
	dw $006B, $0032
	dw $007A, $0052
	dw $0080, $0051
	dw $0082, $0049
	dw $0097, $0037

DATA_B4ED55:
	db $01, $20, $3E, $00, $30
	dw $0097, $0037
	dw $0097, $0017
	dw $0097, $0016

DATA_B4ED66:
	db $01, $20, $3E, $00, $30
	dw $0081, $0092
	dw $0081, $0032
	dw $008C, $001E

DATA_B4ED77:
	db $01, $20, $3E, $00, $20
	dw $0011, $007F
	dw $003C, $0089
	dw $0044, $00A6

DATA_B4ED88:
	db $05, $20, $3E, $00, $20
	dw $0011, $007F
	dw $003C, $008C
	dw $0041, $0089
	dw $004F, $007C
	dw $004E, $0064
	dw $0048, $005C
	dw $0047, $0042

DATA_B4EDA9:
	db $05, $20, $3E, $00, $20
	dw $0064, $004B
	dw $0063, $005F
	dw $005A, $0069
	dw $005F, $007F
	dw $0059, $0084
	dw $005F, $008C
	dw $006E, $009A

DATA_B4EDCA:
	db $03, $20, $3E, $00, $30
	dw $006E, $009A
	dw $008F, $0091
	dw $0096, $0080
	dw $008F, $0078
	dw $008F, $0071
	
DATA_B4EDE3:
	db $04, $20, $3E, $00, $20
	dw $008F, $0071
	dw $00BE, $0071
	dw $00BE, $007C
	dw $00B2, $0085
	dw $00B7, $0090
	dw $00C3, $0090

DATA_B4EE00:
	db $01, $20, $3E, $00, $30
	dw $0005, $00B4
	dw $0017, $00AC
	dw $0022, $007A

DATA_B4EE11:
	db $02, $20, $3E, $00, $30
	dw $0022, $007A
	dw $002E, $0074
	dw $002F, $0032
	dw $003A, $0020

DATA_B4EE26:
	db $02, $20, $3E, $00, $30
	dw $003A, $0020
	dw $0046, $0018
	dw $005A, $001A
	dw $0096, $0014

DATA_B4EE3B:
	db $07, $20, $3E, $00, $30
	dw $0096, $0014
	dw $009C, $0014
	dw $00F0, $0044
	dw $00F0, $007D
	dw $00DC, $007D
	dw $00DC, $00B4
	dw $00C8, $00D0
	dw $00A0, $00D0
	dw $0098, $00BC

DATA_B4EE64:
	db $01, $20, $3E, $00, $30
	dw $0098, $00BC
	dw $00A5, $00CC
	dw $00EB, $00C8

DATA_B4EE75:
	db $02, $20, $3E, $00, $30
	dw $0098, $00BC
	dw $008C, $00C8
	dw $0064, $00C0
	dw $0059, $00AF

DATA_B4EE8A:
	db $01, $20, $3E, $00, $30
	dw $006E, $009A
	dw $009C, $00A0
	dw $009D, $00A0

DATA_B4EE9B:
	db $00, $20, $3E, $00, $30
	dw $003A, $0020
	dw $0014, $0014

DATA_B4EEA8:
	db $05, $20, $3E, $00, $20
	dw $0044, $00A6
	dw $003C, $008C
	dw $0041, $0089
	dw $004F, $007C
	dw $004E, $0064
	dw $0048, $005C
	dw $0047, $0042

DATA_B4EEC9:
	db $02, $20, $3E, $00, $30
	dw $0003, $0089
	dw $0017, $008E
	dw $001B, $00A4
	dw $002E, $00B7

DATA_B4EEDE:
	db $00, $20, $3E, $00, $30
	dw $0001, $0084
	dw $0011, $007F

DATA_B4EEEB:
	db $00, $20, $3E, $00, $30
	dw $0003, $007D
	dw $001C, $0084

DATA_B4EEF8:
	db $00, $20, $3E, $00, $30
	dw $00AF, $01AE
	dw $009E, $0181

DATA_B4EF05:
	db $00, $20, $3E, $00, $30
	dw $001C, $0044
	dw $001D, $0044

DATA_B4EF12:
	db $04, $20, $3E, $00, $30
	dw $002C, $0082
	dw $004E, $00A2
	dw $0063, $00B0
	dw $0073, $00B6
	dw $0087, $00BE
	dw $0096, $00C3

DATA_B4EF2F:
	db $05, $20, $3E, $00, $30
	dw $0096, $00C3
	dw $00A0, $00C3
	dw $00AA, $00CA
	dw $00B9, $00CA
	dw $00BE, $00C6
	dw $00C8, $00CC
	dw $00D2, $00C3

DATA_B4EF50:
	db $02, $20, $3E, $00, $30
	dw $0096, $00C3
	dw $00A3, $00B4
	dw $00B1, $00A5
	dw $00B4, $0070

DATA_B4EF65:
	db $05, $20, $3E, $00, $20
	dw $0047, $0042
	dw $0048, $005C
	dw $004E, $0064
	dw $004F, $007C
	dw $0041, $0089
	dw $003C, $008C
	dw $0011, $007F

DATA_B4EF86:
	db $05, $20, $3E, $00, $20
	dw $0064, $004B
	dw $0063, $005F
	dw $005A, $0069
	dw $005F, $007F
	dw $0059, $0084
	dw $005F, $008C
	dw $006E, $009A

DATA_B4EFA7:
	db $01, $20, $3E, $00, $30
	dw $00EB, $00C8
	dw $00A5, $00CC
	dw $0098, $00BC

DATA_B4EFB8:
	db $02, $20, $3E, $00, $30
	dw $0050, $00B1
	dw $0055, $00B9
	dw $005F, $00C3
	dw $0074, $00CB

DATA_B4EFCD:
	db $02, $20, $3E, $00, $30
	dw $0050, $00B1
	dw $0046, $00A7
	dw $001E, $0091
	dw $0011, $0082

DATA_B4EFE2:
	db $06, $20, $3E, $00, $30
	dw $0011, $0082
	dw $001B, $0094
	dw $0045, $00A7
	dw $0057, $00A3
	dw $0059, $0091
	dw $0064, $008A
	dw $006E, $0080
	dw $008E, $0062

DATA_B4F007:
	db $02, $20, $3E, $00, $30
	dw $0050, $00B1
	dw $0046, $00A7
	dw $002F, $008F
	dw $002C, $0082

DATA_B4F01C:
	db $06, $20, $3E, $00, $30
	dw $002C, $0082
	dw $002F, $008F
	dw $0045, $00A7
	dw $0057, $00A3
	dw $0059, $0091
	dw $0064, $008A
	dw $006E, $0080
	dw $008E, $0062

DATA_B4F041:
	db $00, $20, $3E, $00, $30
	dw $0050, $00B1
	dw $005E, $0096

DATA_B4F04E:
	db $00, $20, $3E, $00, $30
	dw $005E, $0096
	dw $008E, $0062

DATA_B4F05B:
	db $03, $20, $3E, $00, $30
	dw $0050, $00B1
	dw $005A, $00A3
	dw $006E, $00A3
	dw $0082, $008A
	dw $0096, $008A

DATA_B4F074:
	db $04, $20, $3E, $00, $30
	dw $0096, $008A
	dw $0082, $008A
	dw $006E, $00A3
	dw $0064, $008A
	dw $006E, $0080
	dw $008E, $0062

DATA_B4F091:
	db $01, $20, $3E, $00, $30
	dw $0050, $00B1
	dw $00B4, $00B1
	dw $00D4, $00A2

DATA_B4F0A2:
	db $05, $20, $3E, $00, $30
	dw $00D4, $00A2
	dw $00B4, $00B1
	dw $007D, $00B1
	dw $0069, $0091
	dw $0065, $0089
	dw $006E, $0080
	dw $008E, $0062

DATA_B4F0C3:
	db $00, $20, $3E, $00, $30
	dw $0064, $0088
	dw $0064, $0087

DATA_B4F0D0:
	db $00, $20, $3E, $00, $30
	dw $01B8, $00C7
	dw $01B8, $00C6

DATA_B4F0DD:
	db $00, $20, $3E, $00, $30
	dw $009D, $00A1
	dw $009D, $00A0

DATA_B4F0EA:
	db $00, $20, $3E, $00, $30
	dw $009E, $0065
	dw $009E, $0064

DATA_B4F0F7:
	db $00, $20, $3E, $00, $30
	dw $0016, $0146
	dw $0016, $0145

DATA_B4F104:
	db $01, $20, $3E, $00, $30
	dw $0096, $00C3
	dw $0078, $00B4
	dw $0064, $00A0
