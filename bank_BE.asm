CODE_BEB800:
	TAX					;$BEB800  \
	PHK					;$BEB801   |
	PLB					;$BEB802   |
	JMP (DATA_BEB806,x)			;$BEB803  /

DATA_BEB806:
	dw CODE_BECBA0				;0000
	dw CODE_BECDE2				;0002
	dw CODE_BECE8D				;0004
	dw CODE_BECF73				;0006
	dw CODE_BEE47F				;0008
	dw CODE_BEE07E				;000A
	dw CODE_BEE2D9				;000C
	dw CODE_BEB850				;000E
	dw CODE_BEBA99				;0010
	dw CODE_BEE6EB				;0012
	dw CODE_BEE8BD				;0014
	dw CODE_BEEA8D				;0016
	dw CODE_BEEB4E				;0018
	dw CODE_BEEC82				;001A
	dw CODE_BEEE38				;001C
	dw CODE_BEEF1F				;001E
	dw CODE_BEEF81				;0020
	dw CODE_BEEA7F				;0022


CODE_BEB82A:
	PHK					;$BEB82A  \
	PLB					;$BEB82B   |
	LDY current_sprite			;$BEB82C   |
	LDA $0054,y				;$BEB82E   |
	STA $8E					;$BEB831   |
	LDA $002E,y				;$BEB833   |
	AND #$007F				;$BEB836   |
	ASL A					;$BEB839   |
	SEC					;$BEB83A   |
	ADC $01,s				;$BEB83B   |
	TAX					;$BEB83D   |
	PLA					;$BEB83E   |
	LDA $002F,y				;$BEB83F   |
	AND #$00FF				;$BEB842   |
	ASL A					;$BEB845   |
	JMP ($0000,x)				;$BEB846  /

CODE_BEB849:
	JSL CODE_BBBB99				;$BEB849  \
	JML [$05A9]				;$BEB84D  /

CODE_BEB850:
	JSR CODE_BEB82A				;$BEB850  /

DATA_BEB853:
	dw CODE_BEB86B
	dw CODE_BEB8EF
	dw CODE_BEB94D
	dw CODE_BEB992
	dw CODE_BEB9E4
	dw CODE_BEB8EF
	dw CODE_BEBA2C
	dw CODE_BEBA39
	dw CODE_BEBA3C
	dw CODE_BEBA57
	dw CODE_BEBA5A
	dw CODE_BEBA7D


CODE_BEB86B:
	JSL CODE_B9D100				;$BEB86B  \
	JSL CODE_BCFB58				;$BEB86F   |
	JSL CODE_BEBE6D				;$BEB873   |
	BCS CODE_BEB87C				;$BEB877   |
	JMP CODE_BEB849				;$BEB879  /

CODE_BEB87C:
	LDA #$0064				;$BEB87C  \
	LDX current_sprite			;$BEB87F   |
	LDY $4C,x				;$BEB881   |
	CPY #$08CC				;$BEB883   |
	BCC CODE_BEB898				;$BEB886   |
	BNE CODE_BEB88F				;$BEB888   |
	LDA #$004C				;$BEB88A   |
	BRA CODE_BEB898				;$BEB88D  /

CODE_BEB88F:
	JSL CODE_BB8147				;$BEB88F  \
	LDX current_sprite			;$BEB893   |
	LDA #$0064				;$BEB895   |
CODE_BEB898:					;	   |
	STA $32					;$BEB898   | store the maximum coins the counter can hold
	LDA $0000,y				;$BEB89A   | get coin count (Y is the address of the current coin count, this is used for all coin types)
	STA CPU.dividen				;$BEB89D   |
	CLC					;$BEB8A0   |\ add coins to coin count (the amount is stored in sprite variable $42)
	ADC $42,x				;$BEB8A1   |/
	CMP $32					;$BEB8A3   |\ check if coin count exceeds maximum
	BCC CODE_BEB8B2				;$BEB8A5   |/ if not add the coins to the total
	LDA $32					;$BEB8A7   |\ get max coin count
	DEC A					;$BEB8A9   | | subtract away all the coins to give
	SBC $0000,y				;$BEB8AA   | | this ensures we end up with 0 in the sprite variable
	STA $42,x				;$BEB8AD   |/ set coins to give to 0
	LDA $32					;$BEB8AF   |\ get maximum coins
	DEC A					;$BEB8B1   | | - 1
CODE_BEB8B2:					;	   | |
	STA $0000,y				;$BEB8B2   |/ update coin count
	SEP #$20				;$BEB8B5   |
	LDA #$0A				;$BEB8B7   |
	STA CPU.divisor				;$BEB8B9   |
	REP #$20				;$BEB8BC   |
	LDA $4A,x				;$BEB8BE   |
	EOR $4F,x				;$BEB8C0   |
	AND #$00FF				;$BEB8C2   |
	EOR $4F,x				;$BEB8C5   |
	JSL CODE_BEC5BC				;$BEB8C7   |
	SEP #$20				;$BEB8CB   |
	LDA CPU.divide_result			;$BEB8CD   |
	XBA					;$BEB8D0   |
	LDA CPU.divide_remainder		;$BEB8D1   |
	REP #$20				;$BEB8D4   |
	LDX current_sprite			;$BEB8D6   |
	STA $46,x				;$BEB8D8   |
	LDA $48,x				;$BEB8DA   |
	AND #$00FF				;$BEB8DC   |
	ORA #$F000				;$BEB8DF   |
	STA $44,x				;$BEB8E2   |
	INC $2E,x				;$BEB8E4   |
	LDA $4E,x				;$BEB8E6   |\ get the collection sound (stored is sprite variable $4E)
	JSL queue_sound_effect			;$BEB8E8   |/ play the sound
	JML [$05A9]				;$BEB8EC  / return from sprite code

CODE_BEB8EF:
	JSL CODE_B9D100				;$BEB8EF  \
	LDX current_sprite			;$BEB8F3   |
	LDA $097D				;$BEB8F5   |
	BNE CODE_BEB8FD				;$BEB8F8   |
	STX $097D				;$BEB8FA   |
CODE_BEB8FD:					;	   |
	LDA $44,x				;$BEB8FD   |
	CLC					;$BEB8FF   |
	ADC #$0200				;$BEB900   |
	BMI CODE_BEB90B				;$BEB903   |
	CMP $48,x				;$BEB905   |
	BCC CODE_BEB90B				;$BEB907   |
	LDA $48,x				;$BEB909   |
CODE_BEB90B:					;	   |
	STA $44,x				;$BEB90B   |
	JSL CODE_BEC5FA				;$BEB90D   |
	BPL CODE_BEB94A				;$BEB911   |
	LDX current_sprite			;$BEB913   |
	STX $097D				;$BEB915   |
	LDA $48,x				;$BEB918   |
	CMP $44,x				;$BEB91A   |
	BNE CODE_BEB94A				;$BEB91C   |
	LDA global_frame_counter		;$BEB91E   |
	AND #$0007				;$BEB920   |
	BNE CODE_BEB94A				;$BEB923   |
	DEC $42,x				;$BEB925   |
	BMI CODE_BEB948				;$BEB927   |
	BEQ CODE_BEB933				;$BEB929   |
	LDA $4E,x				;$BEB92B   |
	JSL queue_sound_effect			;$BEB92D   |
	LDX current_sprite			;$BEB931   |
CODE_BEB933:					;	   |
	LDA $46,x				;$BEB933   |
	CMP #$0909				;$BEB935   |
	BEQ CODE_BEB948				;$BEB938   |
	SED					;$BEB93A   |
	CLC					;$BEB93B   |
	ADC #$0091				;$BEB93C   |
	AND #$0F0F				;$BEB93F   |
	CLD					;$BEB942   |
	STA $46,x				;$BEB943   |
	JML [$05A9]				;$BEB945  /

CODE_BEB948:
	INC $2E,x				;$BEB948  \
CODE_BEB94A:					;	   |
	JML [$05A9]				;$BEB94A  /

CODE_BEB94D:
	TYX					;$BEB94D  \
	DEC $5C,x				;$BEB94E   |
	BPL CODE_BEB984				;$BEB950   |
	DEC $0A,x				;$BEB952   |
	DEC $0A,x				;$BEB954   |
	SEP #$20				;$BEB956   |
	CLC					;$BEB958   |
	DEC $45,x				;$BEB959   |
	DEC $45,x				;$BEB95B   |
	BPL CODE_BEB967				;$BEB95D   |
	LDA #$F0				;$BEB95F   |
	CMP $45,x				;$BEB961   |
	BCC CODE_BEB967				;$BEB963   |
	STA $45,x				;$BEB965   |
CODE_BEB967:					;	   |
	REP #$20				;$BEB967   |
	BCC CODE_BEB984				;$BEB969   |
	SEP #$20				;$BEB96B   |
	LDA $51,x				;$BEB96D   |
	CMP $0A,x				;$BEB96F   |
	REP #$20				;$BEB971   |
	BNE CODE_BEB984				;$BEB973   |
	CPX $097D				;$BEB975   |
	BNE CODE_BEB97D				;$BEB978   |
	STZ $097D				;$BEB97A   |
CODE_BEB97D:					;	   |
	JSL CODE_BB82B8				;$BEB97D   |
	JML [$05A9]				;$BEB981  /

CODE_BEB984:
	LDX current_sprite			;$BEB984  \
	CPX $097D				;$BEB986   |
	BNE CODE_BEB97D				;$BEB989   |
	JSL CODE_B9D100				;$BEB98B   |
	JML [$05A9]				;$BEB98F  /

CODE_BEB992:
if !version == 1				;	  \
	LDA $052D				;$BEB992   |
	AND #$00FF				;$BEB995   |
	CMP #$0003				;$BEB998   |
	BNE CODE_BEB9B2				;$BEB99B   |
endif						;	   |
	LDA #$0621				;$BEB99D   |
	JSL queue_sound_effect			;$BEB9A0   |
	LDA #$0522				;$BEB9A4   |
	JSL queue_sound_effect			;$BEB9A7   |
	LDA #$0735				;$BEB9AB   |
	JSL queue_sound_effect			;$BEB9AE   |
CODE_BEB9B2:					;	   |
	JSL CODE_BB8114				;$BEB9B2   |
	BCC CODE_BEB9D6				;$BEB9B6   |
	LDX current_sprite			;$BEB9B8   |
	LDA $36,x				;$BEB9BA   |
	CMP #$01C3				;$BEB9BC   |
	BNE CODE_BEB9C6				;$BEB9BF   |
	LDA #$01C5				;$BEB9C1   |
	BRA CODE_BEB9C9				;$BEB9C4  /

CODE_BEB9C6:
	LDA #$01C4				;$BEB9C6  \
CODE_BEB9C9:					;	   |
	JSL set_sprite_animation		;$BEB9C9   |
	LDX current_sprite			;$BEB9CD   |
	LDA #$0003				;$BEB9CF   |
	JSL CODE_BB8C44				;$BEB9D2   |
CODE_BEB9D6:					;	   |
	LDY #$00CE				;$BEB9D6   |
	JSL CODE_BB842C				;$BEB9D9   |
	LDX current_sprite			;$BEB9DD   |
	INC $2E,x				;$BEB9DF   |
	JML [$05A9]				;$BEB9E1  /

CODE_BEB9E4:
	JSL CODE_B9D100				;$BEB9E4  \
	JSL CODE_BCFB58				;$BEB9E8   |
	JSL CODE_BEBE6D				;$BEB9EC   |
	BCS CODE_BEB9F5				;$BEB9F0   |
CODE_BEB9F2:					;	   |
	JML [$05A9]				;$BEB9F2  /

CODE_BEB9F5:
	LDX $6A					;$BEB9F5  \
	CPX $0597				;$BEB9F7   |
	BEQ CODE_BEB9F2				;$BEB9FA   |
	LDA #$0200				;$BEB9FC   |
	JSL CODE_BEBE4D				;$BEB9FF   |
	BCS CODE_BEB9F2				;$BEBA03   |
	JSL CODE_BB8125				;$BEBA05   |
	JSL CODE_BB819F				;$BEBA09   |
	LDA #$0002				;$BEBA0D   |
	TSB $08C4				;$BEBA10   |
	LDX current_sprite			;$BEBA13   |
	LDA $36,x				;$BEBA15   |
	CMP #$01C4				;$BEBA17   |
	BEQ CODE_BEBA24				;$BEBA1A   |
	CMP #$01C5				;$BEBA1C   |
	BEQ CODE_BEBA24				;$BEBA1F   |
	JMP CODE_BEB87C				;$BEBA21  /

CODE_BEBA24:
	LDA #$0007				;$BEBA24  \
	STA $2E,x				;$BEBA27   |
	JML [$05A9]				;$BEBA29  /

CODE_BEBA2C:
	LDA $5C,x				;$BEBA2C  \
	BPL CODE_BEBA36				;$BEBA2E   |
	LDA #$0002				;$BEBA30   |
	TSB $08C4				;$BEBA33   |
CODE_BEBA36:					;	   |
	JMP CODE_BEB94D				;$BEBA36  /

CODE_BEBA39:
	JML [$05A9]				;$BEBA39  /

CODE_BEBA3C:
	JSL CODE_BB8135				;$BEBA3C  \
	BCC CODE_BEBA50				;$BEBA40   |
	LDA #$01C5				;$BEBA42   |
	JSL set_sprite_animation		;$BEBA45   |
	LDX current_sprite			;$BEBA49   |
	INC $2E,x				;$BEBA4B   |
	JML [$05A9]				;$BEBA4D  /

CODE_BEBA50:
	LDX current_sprite			;$BEBA50  \
	STZ $2E,x				;$BEBA52   |
	JML [$05A9]				;$BEBA54  /

CODE_BEBA57:
	JMP CODE_BEB849				;$BEBA57  /

CODE_BEBA5A:
	LDA #$0621				;$BEBA5A  \
	JSL queue_sound_effect			;$BEBA5D   |
	LDA #$0522				;$BEBA61   |
	JSL queue_sound_effect			;$BEBA64   |
	LDA #$0735				;$BEBA68   |
	JSL queue_sound_effect			;$BEBA6B   |
	LDY #$00CE				;$BEBA6F   |
	JSL CODE_BB842C				;$BEBA72   |
	LDX current_sprite			;$BEBA76   |
	INC $2E,x				;$BEBA78   |
	JML [$05A9]				;$BEBA7A  /

CODE_BEBA7D:
	JSL CODE_B9D100				;$BEBA7D  \
	JSL CODE_BCFB58				;$BEBA81   |
	JSL CODE_BEBE6D				;$BEBA85   |
	BCC CODE_BEBA96				;$BEBA89   |
	LDA #$004B				;$BEBA8B   |
	STA $08B8				;$BEBA8E   |
	STZ $2E,x				;$BEBA91   |
	BRL CODE_BEB87C				;$BEBA93  /

CODE_BEBA96:
	JML [$05A9]				;$BEBA96  /

CODE_BEBA99:
	JSR CODE_BEB82A				;$BEBA99  /

DATA_BEBA9C:
	dw CODE_BEBAAA
	dw CODE_BEBB1F
	dw CODE_BEBB2A
	dw CODE_BEBB6E
	dw CODE_BEBBCA
	dw CODE_BEBC07
	dw CODE_BEBC9A

CODE_BEBAAA:
	LDA $004C,y				;$BEBAAA  \
	AND $0902				;$BEBAAD   |
	BEQ CODE_BEBAB9				;$BEBAB0   |
	JSL CODE_BB82B8				;$BEBAB2   |
	JML [$05A9]				;$BEBAB6  /

CODE_BEBAB9:
	JSL CODE_B9D100				;$BEBAB9  \
	JSL CODE_BCFB58				;$BEBABD   |
	JSL CODE_BEBE6D				;$BEBAC1   |
	BCS CODE_BEBACA				;$BEBAC5   |
	JMP CODE_BEB849				;$BEBAC7  /

CODE_BEBACA:
	LDA $12,x				;$BEBACA  \
	ORA #$3000				;$BEBACC   |
	STA $12,x				;$BEBACF   |
	TXA					;$BEBAD1   |
	CLC					;$BEBAD2   |
	ADC $4A,x				;$BEBAD3   |
	TAY					;$BEBAD5   |
	LDA $0000,y				;$BEBAD6   |
	EOR $4F,x				;$BEBAD9   |
	AND #$00FF				;$BEBADB   |
	EOR $4F,x				;$BEBADE   |
	JSL CODE_BEC5BC				;$BEBAE0   |
	INC $2E,x				;$BEBAE4   | set kong letter sprite as collected
	LDA $4C,x				;$BEBAE6   | get what kong letter the sprite is
	TSB $0902				;$BEBAE8   | set the corresponding kong letter bit
	LDA $0902				;$BEBAEB   | get collected kong letters
	INC A					;$BEBAEE   |
	AND #$000F				;$BEBAEF   |	
	STA $52,x				;$BEBAF2   |	
	BNE CODE_BEBAFD				;$BEBAF4   | if all the kong letters arent collected yet dont give an extra life
	LDA #$0001				;$BEBAF6   | number of lives to give
	JSL CODE_BEC64C				;$BEBAF9   | give extra lives
CODE_BEBAFD:					;	   |
	LDA $4E,x				;$BEBAFD   | get the sound the kong letter should make (this is stored in a sprite variable)
	JSL queue_sound_effect			;$BEBAFF   | play the sound
	LDX current_sprite			;$BEBB03   | get current sprite index
	LDA $0902				;$BEBB05   | get collected kong letters
	LSR A					;$BEBB08   |
	BCS CODE_BEBB0D				;$BEBB09   | if K was collected
	STZ $42,x				;$BEBB0B   |
CODE_BEBB0D:					;	   |
	LSR A					;$BEBB0D   |
	BCS CODE_BEBB12				;$BEBB0E   | if O was collected
	STZ $44,x				;$BEBB10   |
CODE_BEBB12:					;	   |
	LSR A					;$BEBB12   |
	BCS CODE_BEBB17				;$BEBB13   | if N was collected
	STZ $46,x				;$BEBB15   |
CODE_BEBB17:					;	   |
	LSR A					;$BEBB17   |
	BCS CODE_BEBB1C				;$BEBB18   | if G was collected
	STZ $48,x				;$BEBB1A   |
CODE_BEBB1C:					;	   |
	JML [$05A9]				;$BEBB1C  / return from sprite code

CODE_BEBB1F:
	JSL CODE_B9D100				;$BEBB1F  \
	JSL CODE_BEC5FA				;$BEBB23   |
	JML [$05A9]				;$BEBB27  /

CODE_BEBB2A:
	JSL CODE_BEC5FA				;$BEBB2A  \
	LDY current_sprite			;$BEBB2E   |
	LDA $0012,y				;$BEBB30   |
	AND #$01FF				;$BEBB33   |
	ASL A					;$BEBB36   |
	ASL A					;$BEBB37   |
	ASL A					;$BEBB38   |
	ASL A					;$BEBB39   |
	LDX.l #DATA_C02401>>16|$0800		;$BEBB3A   |	
	LDY #DATA_C02401			;$BEBB3D   | kong letters top tiledata
	PHA					;$BEBB40   |
	JSR CODE_BEBD5C				;$BEBB41   |
	PLA					;$BEBB44   |
	BCS CODE_BEBB5E				;$BEBB45   |
	ADC #$0100				;$BEBB47   |
	LDX.l #DATA_C02501>>16|$0800		;$BEBB4A   |
	LDY #DATA_C02501			;$BEBB4D   | kong letters bottom tiledata
	JSR CODE_BEBD5C				;$BEBB50   |
	BCC CODE_BEBB61				;$BEBB53   |
	LDA $1730				;$BEBB55   |
	SBC #$0008				;$BEBB58   |
	STA $1730				;$BEBB5B   |
CODE_BEBB5E:					;	   |
	JML [$05A9]				;$BEBB5E  /

CODE_BEBB61:
	LDX current_sprite			;$BEBB61  \
	STX $097B				;$BEBB63   |
	LDA #$C000				;$BEBB66   |
	STA $1C,x				;$BEBB69   |
	INC $2E,x				;$BEBB6B   |
	TXY					;$BEBB6D   |
CODE_BEBB6E:					;	   |
	TYX					;$BEBB6E   |
	LDY #$0003				;$BEBB6F   |
	STZ $5E					;$BEBB72   |
	LDA $50,x				;$BEBB74   |
	STA $60					;$BEBB76   |
	SEP #$20				;$BEBB78   |
CODE_BEBB7A:					;	   |
	LDA $42,x				;$BEBB7A   |
	BEQ CODE_BEBB8A				;$BEBB7C   |
	LDA $43,x				;$BEBB7E   |
	CMP $60					;$BEBB80   |
	BEQ CODE_BEBB8A				;$BEBB82   |
	INC $43,x				;$BEBB84   |
	INC $43,x				;$BEBB86   |
	INC $5E					;$BEBB88   |
CODE_BEBB8A:					;	   |
	INX					;$BEBB8A   |
	INX					;$BEBB8B   |
	DEY					;$BEBB8C   |
	BPL CODE_BEBB7A				;$BEBB8D   |
	REP #$20				;$BEBB8F   |
	JSL CODE_BEC5FA				;$BEBB91   |
	BMI CODE_BEBB99				;$BEBB95   |
	INC $5E					;$BEBB97   |
CODE_BEBB99:					;	   |
	TXA					;$BEBB99   |
	CLC					;$BEBB9A   |
	ADC $4A,x				;$BEBB9B   |
	TAY					;$BEBB9D   |
	SEP #$20				;$BEBB9E   |
	LDA $0A,x				;$BEBBA0   |
	XBA					;$BEBBA2   |
	LDA $06,x				;$BEBBA3   |
	REP #$20				;$BEBBA5   |
	STA $0000,y				;$BEBBA7   |
	LDA $5E					;$BEBBAA   |
	BNE CODE_BEBBC7				;$BEBBAC   |
	INC $2E,x				;$BEBBAE   |
	LDA $52,x				;$BEBBB0   |
	BNE CODE_BEBBC7				;$BEBBB2   |
	INC $2E,x				;$BEBBB4   |
	STZ $5C,x				;$BEBBB6   |
	LDA #$0003				;$BEBBB8   |
CODE_BEBBBB:					;	   |
	SEC					;$BEBBBB   |
	LDY #$20E8				;$BEBBBC   |
	PHA					;$BEBBBF   |
	JSR CODE_BEBCB2				;$BEBBC0   |
	PLA					;$BEBBC3   |
	DEC A					;$BEBBC4   |
	BPL CODE_BEBBBB				;$BEBBC5   |
CODE_BEBBC7:					;	   |
	JML [$05A9]				;$BEBBC7  /

CODE_BEBBCA:
	TYX					;$BEBBCA  \
	DEC $5C,x				;$BEBBCB   |
	BPL CODE_BEBC04				;$BEBBCD   |
	TYX					;$BEBBCF   |
	LDY #$0003				;$BEBBD0   |
	STZ $5E					;$BEBBD3   |
	LDA $51,x				;$BEBBD5   |
	STA $60					;$BEBBD7   |
	SEP #$20				;$BEBBD9   |
CODE_BEBBDB:					;	   |
	LDA $42,x				;$BEBBDB   |
	BEQ CODE_BEBBEB				;$BEBBDD   |
	LDA $43,x				;$BEBBDF   |
	CMP $60					;$BEBBE1   |
	BEQ CODE_BEBBEB				;$BEBBE3   |
	DEC $43,x				;$BEBBE5   |
	DEC $43,x				;$BEBBE7   |
	INC $5E					;$BEBBE9   |
CODE_BEBBEB:					;	   |
	INX					;$BEBBEB   |
	INX					;$BEBBEC   |
	DEY					;$BEBBED   |
	BPL CODE_BEBBDB				;$BEBBEE   |
	REP #$20				;$BEBBF0   |
	LDA $5E					;$BEBBF2   |
	BNE CODE_BEBC04				;$BEBBF4   |
	LDA current_sprite			;$BEBBF6   |
	CMP $097B				;$BEBBF8   |
	BNE CODE_BEBC00				;$BEBBFB   |
	STZ $097B				;$BEBBFD   |
CODE_BEBC00:					;	   |
	JSL CODE_BB82B8				;$BEBC00   |
CODE_BEBC04:					;	   |
	JML [$05A9]				;$BEBC04  /

CODE_BEBC07:
	LDA #$0078				;$BEBC07  \
	STA $0973				;$BEBC0A   |
	LDX current_sprite			;$BEBC0D   |
	INC $5C,x				;$BEBC0F   |
	LDA $5C,x				;$BEBC11   |
	CMP #$002F				;$BEBC13   |
	BCS CODE_BEBC31				;$BEBC16   |
	BIT #$0008				;$BEBC18   |
	BEQ CODE_BEBC27				;$BEBC1B   |
	LDA $12,x				;$BEBC1D   |
	AND #$7FFF				;$BEBC1F   |
	STA $12,x				;$BEBC22   |
	JML [$05A9]				;$BEBC24  /

CODE_BEBC27:
	LDA $12,x				;$BEBC27  \
	ORA #$8000				;$BEBC29   |
	STA $12,x				;$BEBC2C   |
	JML [$05A9]				;$BEBC2E  /

CODE_BEBC31:
	BEQ CODE_BEBC82				;$BEBC31  \
	CMP #$004B				;$BEBC33   |
	BCC CODE_BEBC89				;$BEBC36   |
	BEQ CODE_BEBC70				;$BEBC38   |
	CMP #$0067				;$BEBC3A   |
	BCC CODE_BEBC77				;$BEBC3D   |
	BEQ CODE_BEBC5E				;$BEBC3F   |
	CMP #$0083				;$BEBC41   |
	BCC CODE_BEBC65				;$BEBC44   |
	BNE CODE_BEBC4F				;$BEBC46   |
	LDA #$042A				;$BEBC48   |
	JSL queue_sound_effect			;$BEBC4B   |
CODE_BEBC4F:					;	   |
	LDA #$0003				;$BEBC4F   |
	CLC					;$BEBC52   |
	JSR CODE_BEBCB2				;$BEBC53   |
	BPL CODE_BEBC65				;$BEBC56   |
	LDX current_sprite			;$BEBC58   |
	INC $2E,x				;$BEBC5A   |
	BRA CODE_BEBC92				;$BEBC5C  /

CODE_BEBC5E:
	LDA #$0529				;$BEBC5E  \
	JSL queue_sound_effect			;$BEBC61   |
CODE_BEBC65:					;	   |
	LDA #$0002				;$BEBC65   |
	CLC					;$BEBC68   |
	JSR CODE_BEBCB2				;$BEBC69   |
	BPL CODE_BEBC77				;$BEBC6C   |
	BRA CODE_BEBC92				;$BEBC6E  /

CODE_BEBC70:
	LDA #$0628				;$BEBC70  \
	JSL queue_sound_effect			;$BEBC73   |
CODE_BEBC77:					;	   |
	LDA #$0001				;$BEBC77   |
	CLC					;$BEBC7A   |
	JSR CODE_BEBCB2				;$BEBC7B   |
	BPL CODE_BEBC89				;$BEBC7E   |
	BRA CODE_BEBC92				;$BEBC80  /

CODE_BEBC82:
	LDA #$0727				;$BEBC82  \
	JSL queue_sound_effect			;$BEBC85   |
CODE_BEBC89:					;	   |
	LDA #$0000				;$BEBC89   |
	CLC					;$BEBC8C   |
	JSR CODE_BEBCB2				;$BEBC8D   |
	BPL CODE_BEBC97				;$BEBC90   |
CODE_BEBC92:					;	   |
	LDA #$0000				;$BEBC92   |
	STA ($32)				;$BEBC95   |
CODE_BEBC97:					;	   |
	JML [$05A9]				;$BEBC97  /

CODE_BEBC9A:
	JSL CODE_BB82B8				;$BEBC9A  \
	LDA #$0001				;$BEBC9E   |
	JSL CODE_BEC63E				;$BEBCA1   |
	LDX current_sprite			;$BEBCA5   |
	CPX $097B				;$BEBCA7   |
	BNE CODE_BEBCAF				;$BEBCAA   |
	STZ $097B				;$BEBCAC   |
CODE_BEBCAF:					;	   |
	JML [$05A9]				;$BEBCAF  /

CODE_BEBCB2:
	BCC CODE_BEBCCE				;$BEBCB2  \
	PHY					;$BEBCB4   |
	JSR CODE_BEBD0F				;$BEBCB5   |
	LDA ($32)				;$BEBCB8   |
	AND #$00FF				;$BEBCBA   |
	XBA					;$BEBCBD   |
	STA ($34)				;$BEBCBE   |
	LDA ($32)				;$BEBCC0   |
	AND #$FF00				;$BEBCC2   |
	STA ($36)				;$BEBCC5   |
	PLA					;$BEBCC7   |
	STA ($38)				;$BEBCC8   |
	LDY #$0001				;$BEBCCA   |
	RTS					;$BEBCCD  /

CODE_BEBCCE:
	JSR CODE_BEBD0F				;$BEBCCE  \
	LDA ($32)				;$BEBCD1   |
	BEQ CODE_BEBD0E				;$BEBCD3   |
	LDA #$0200				;$BEBCD5   |
	STA $5E					;$BEBCD8   |
	LDA ($38)				;$BEBCDA   |
	XBA					;$BEBCDC   |
	AND #$FF00				;$BEBCDD   |
	SEC					;$BEBCE0   |
	SBC ($34)				;$BEBCE1   |
	JSR CODE_BEBD2A				;$BEBCE3   |
	CLC					;$BEBCE6   |
	ADC ($34)				;$BEBCE7   |
	STA ($34)				;$BEBCE9   |
	AND #$FF00				;$BEBCEB   |
	XBA					;$BEBCEE   |
	STA ($32)				;$BEBCEF   |
	LDA #$0040				;$BEBCF1   |
	STA $5E					;$BEBCF4   |
	LDA ($38)				;$BEBCF6   |
	AND #$FF00				;$BEBCF8   |
	SEC					;$BEBCFB   |
	SBC ($36)				;$BEBCFC   |
	JSR CODE_BEBD2A				;$BEBCFE   |
	CLC					;$BEBD01   |
	ADC ($36)				;$BEBD02   |
	STA ($36)				;$BEBD04   |
	AND #$FF00				;$BEBD06   |
	ORA ($32)				;$BEBD09   |
	STA ($32)				;$BEBD0B   |
	DEY					;$BEBD0D   |
CODE_BEBD0E:					;	   |
	RTS					;$BEBD0E  /

CODE_BEBD0F:
	ASL A					;$BEBD0F  \
	ASL A					;$BEBD10   |
	TAX					;$BEBD11   |
	LDY #$FFFA				;$BEBD12   |
CODE_BEBD15:					;	   |
	LDA.l DATA_BEBD4C,x			;$BEBD15   |
	AND #$00FF				;$BEBD19   |
	CLC					;$BEBD1C   |
	ADC current_sprite			;$BEBD1D   |
	STA $0038,y				;$BEBD1F   |
	INX					;$BEBD22   |
	INY					;$BEBD23   |
	INY					;$BEBD24   |
	BMI CODE_BEBD15				;$BEBD25   |
	BEQ CODE_BEBD15				;$BEBD27   |
	RTS					;$BEBD29  /

CODE_BEBD2A:
	BEQ CODE_BEBD3A				;$BEBD2A  \
	BCS CODE_BEBD3C				;$BEBD2C   |
	EOR #$FFFF				;$BEBD2E   |
	INC A					;$BEBD31   |
	JSR CODE_BEBD3C				;$BEBD32   |
	EOR #$FFFF				;$BEBD35   |
	INC A					;$BEBD38   |
	RTS					;$BEBD39  /

CODE_BEBD3A:
	DEY					;$BEBD3A  \
	RTS					;$BEBD3B  /

CODE_BEBD3C:
	CMP #$0100				;$BEBD3C  \
	BCC CODE_BEBD4B				;$BEBD3F   |
	LSR A					;$BEBD41   |
	LSR A					;$BEBD42   |
	LSR A					;$BEBD43   |
	LSR A					;$BEBD44   |
	CMP $5E					;$BEBD45   |
	BCS CODE_BEBD4B				;$BEBD47   |
	LDA $5E					;$BEBD49   |
CODE_BEBD4B:					;	   |
	RTS					;$BEBD4B  /

DATA_BEBD4C:
	db $42, $04, $06, $4A, $44, $08, $0A, $4C
	db $46, $20, $22, $50, $48, $26, $28, $52

CODE_BEBD5C:
	STX $32					;$BEBD5C  \
	LDX $1730				;$BEBD5E   |
	CPX $78					;$BEBD61   |
	BCS CODE_BEBD8D				;$BEBD63   |
	STA $1734,x				;$BEBD65   |
	TYA					;$BEBD68   |
	STA $1736,x				;$BEBD69   |
	LDA $32					;$BEBD6C   |
	AND #$00FF				;$BEBD6E   |
	ORA #$8000				;$BEBD71   |
	STA $1738,x				;$BEBD74   |
	LDA $32					;$BEBD77   |
	AND #$FF00				;$BEBD79   |
	LSR A					;$BEBD7C   |
	LSR A					;$BEBD7D   |
	LSR A					;$BEBD7E   |
	STA $1732,x				;$BEBD7F   |
	TXA					;$BEBD82   |
	CLC					;$BEBD83   |
	ADC #$0008				;$BEBD84   |
	STA $1730				;$BEBD87   |
	STZ $1740,x				;$BEBD8A   |
CODE_BEBD8D:					;	   |
	RTS					;$BEBD8D  /

CODE_BEBD8E:
	JSR CODE_BEBD92				;$BEBD8E  \
	RTL					;$BEBD91  /

CODE_BEBD92:
	STY $5E					;$BEBD92  \
	JSL CODE_BCFE0A				;$BEBD94   |
	LDX current_sprite			;$BEBD98   |
	BCC CODE_BEBDC0				;$BEBD9A   |
	JSR CODE_BEC5A4				;$BEBD9C   |
	LDY $6A					;$BEBD9F   |
	LDA $5E					;$BEBDA1   |
	ORA $0032,y				;$BEBDA3   |
	STA $0032,y				;$BEBDA6   |
	LDA $12,x				;$BEBDA9   |
	EOR $20,x				;$BEBDAB   |
	AND #$4000				;$BEBDAD   |
	EOR $20,x				;$BEBDB0   |
	AND #$C000				;$BEBDB2   |
	CLC					;$BEBDB5   |
	ADC current_sprite			;$BEBDB6   |
	SEC					;$BEBDB8   |
	SBC #aux_sprite_table			;$BEBDB9   |
	STA $0034,y				;$BEBDBC   |
	SEC					;$BEBDBF   |
CODE_BEBDC0:					;	   |
	RTS					;$BEBDC0  /

CODE_BEBDC1:
	LDX current_sprite			;$BEBDC1  \
	STY current_sprite			;$BEBDC3   |
	STY $6A					;$BEBDC5   |
	PHX					;$BEBDC7   |
	JSL CODE_BCFB58				;$BEBDC8   |
	JSL CODE_BCFEE0				;$BEBDCC   |
	PLX					;$BEBDD0   |
	STX current_sprite			;$BEBDD1   |
	JSL CODE_BCFB58				;$BEBDD3   |
	LDA $DD					;$BEBDD7   |
	CMP $09D3				;$BEBDD9   |
	BCC CODE_BEBE01				;$BEBDDC   |
	LDA $09D7				;$BEBDDE   |
	CMP $D9					;$BEBDE1   |
	BCC CODE_BEBE01				;$BEBDE3   |
	STA $E5					;$BEBDE5   |
	LDA $09D9				;$BEBDE7   |
	CMP $DB					;$BEBDEA   |
	BCC CODE_BEBE01				;$BEBDEC   |
	STA $E7					;$BEBDEE   |
	LDA $DF					;$BEBDF0   |
	CMP $09D5				;$BEBDF2   |
	BCC CODE_BEBE01				;$BEBDF5   |
	LDA $09D3				;$BEBDF7   |
	STA $E1					;$BEBDFA   |
	LDA $09D5				;$BEBDFC   |
	STA $E3					;$BEBDFF   |
CODE_BEBE01:					;	   |
	LDX current_sprite			;$BEBE01   |
	LDY $6A					;$BEBE03   |
	RTL					;$BEBE05  /

CODE_BEBE06:
	JSL CODE_B3A334				;$BEBE06  \
	LDY #$0034				;$BEBE0A   |
	JSL CODE_BB842C				;$BEBE0D   |
	LDX current_sprite			;$BEBE11   |
	RTS					;$BEBE13  /

CODE_BEBE14:
	JSR CODE_BEBE18				;$BEBE14  \
	RTL					;$BEBE17  /

CODE_BEBE18:
	STA $60					;$BEBE18  \
	LDX current_sprite			;$BEBE1A   |
	LDA $32,x				;$BEBE1C   |
	STA $5E					;$BEBE1E   |
	BEQ CODE_BEBE4B				;$BEBE20   |
	STZ $32,x				;$BEBE22   |
	LDA $34,x				;$BEBE24   |
	AND #$3FFF				;$BEBE26   |
	CLC					;$BEBE29   |
	ADC #aux_sprite_table			;$BEBE2A   |
	STA $6A					;$BEBE2D   |
	LDA $5E					;$BEBE2F   |
	BIT $60					;$BEBE31   |
	BEQ CODE_BEBE43				;$BEBE33   |
	JSL CODE_BBBD6B				;$BEBE35   |
	LDX current_sprite			;$BEBE39   |
	LDY #$0000				;$BEBE3B   |
	LDA #$0000				;$BEBE3E   |
	SEC					;$BEBE41   |
	RTS					;$BEBE42  /

CODE_BEBE43:
	LDY #$0000				;$BEBE43  \
	LDA #$0001				;$BEBE46   |
	SEC					;$BEBE49   |
	RTS					;$BEBE4A  /

CODE_BEBE4B:
	CLC					;$BEBE4B  \
	RTS					;$BEBE4C  /

CODE_BEBE4D:
	PHX					;$BEBE4D  \
	PHA					;$BEBE4E   |
	LDX $6A					;$BEBE4F   |
	CPX $0593				;$BEBE51   |
	BEQ CODE_BEBE5B				;$BEBE54   |
	CPX $0597				;$BEBE56   |
	BNE CODE_BEBE67				;$BEBE59   |
CODE_BEBE5B:					;	   |
	LDA $2E,x				;$BEBE5B   |
	ASL A					;$BEBE5D   |
	ASL A					;$BEBE5E   |
	TAX					;$BEBE5F   |
	PLA					;$BEBE60   |
	AND.l DATA_B896B7,x			;$BEBE61   |
	BNE CODE_BEBE6A				;$BEBE65   |
CODE_BEBE67:					;	   |
	CLC					;$BEBE67   |
	PLX					;$BEBE68   |
	RTL					;$BEBE69  /

CODE_BEBE6A:
	SEC					;$BEBE6A  \
	PLX					;$BEBE6B   |
	RTL					;$BEBE6C  /

CODE_BEBE6D:
	STA $5E					;$BEBE6D  \
	LDA #$0010				;$BEBE6F   |
	PHK					;$BEBE72   |
	%return(CODE_BEBE79)			;$BEBE73   |
	JML [$09F9]				;$BEBE76  /

CODE_BEBE79:
	BCS CODE_BEBE7F				;$BEBE79  \
	LDX current_sprite			;$BEBE7B   |
	TXY					;$BEBE7D   |
	RTL					;$BEBE7E  /

CODE_BEBE7F:
	JSL CODE_BBBD6B				;$BEBE7F  \
	LDX current_sprite			;$BEBE83   |
	LDY $6A					;$BEBE85   |
	LDA #$0000				;$BEBE87   |
	RTL					;$BEBE8A  /

CODE_BEBE8B:
	LDY #$0000				;$BEBE8B  \
CODE_BEBE8E:					;	   |
	STA $09F7				;$BEBE8E   |
	STY $60					;$BEBE91   |
	LDA #$0010				;$BEBE93   |
	PHK					;$BEBE96   |
	%return(CODE_BEBE9D)			;$BEBE97   |
	JML [$09F9]				;$BEBE9A  /

CODE_BEBE9D:
	BCS CODE_BEBEAD				;$BEBE9D  \
	LDX current_sprite			;$BEBE9F   |
	TXY					;$BEBEA1   |
	RTL					;$BEBEA2  /

CODE_BEBEA3:
	JSL CODE_BCFCC5				;$BEBEA3  \
	BCS CODE_BEBEAD				;$BEBEA7   |
	LDX current_sprite			;$BEBEA9   |
	TXY					;$BEBEAB   |
	RTL					;$BEBEAC  /

CODE_BEBEAD:
	LDA $09F7				;$BEBEAD  \
	STA $5E					;$BEBEB0   |
	LDA #$0020				;$BEBEB2   |
	JSL CODE_BEBE4D				;$BEBEB5   |
	BCS CODE_BEBF20				;$BEBEB9   |
	JSL CODE_BCFEC0				;$BEBEBB   |
	JSL CODE_BCFED8				;$BEBEBF   |
	LDA $09F5				;$BEBEC3   |
	LDX $0D5E				;$BEBEC6   |
	BEQ CODE_BEBED6				;$BEBEC9   |
	AND #$0001				;$BEBECB   |
	ASL A					;$BEBECE   |
	ASL A					;$BEBECF   |
	ORA $09F5				;$BEBED0   |
	STA $09F5				;$BEBED3   |
CODE_BEBED6:					;	   |
	XBA					;$BEBED6   |
	TSB $09F5				;$BEBED7   |
	LDX $6A					;$BEBEDA   |
	LDA $41,x				;$BEBEDC   |
	AND #$00E0				;$BEBEDE   |
	LSR A					;$BEBEE1   |
	LSR A					;$BEBEE2   |
	LSR A					;$BEBEE3   |
	LSR A					;$BEBEE4   |
	ADC $60					;$BEBEE5   |
	LDX $19CE				;$BEBEE7   |
	BNE CODE_BEBEF0				;$BEBEEA   |
	TAX					;$BEBEEC   |
CODE_BEBEED:					;	   |
	JMP (DATA_BEBF23,x)			;$BEBEED  /

CODE_BEBEF0:
	CMP #$0030				;$BEBEF0  \
	BCS CODE_BEBF00				;$BEBEF3   |
	AND #$000E				;$BEBEF5   |
	CMP #$0006				;$BEBEF8   |
	BCC CODE_BEBF00				;$BEBEFB   |
	JMP CODE_BEC410				;$BEBEFD  /

CODE_BEBF00:
	TAX					;$BEBF00  \
	LDY $6A					;$BEBF01   |
	LDA #$0005				;$BEBF03   |
	TSB $09F5				;$BEBF06   |
	LDA $0040,y				;$BEBF09   |
	PHA					;$BEBF0C   |
	ORA #$1800				;$BEBF0D   |
	STA $0040,y				;$BEBF10   |
	JSL CODE_BEBEED				;$BEBF13   |
	STA $5E					;$BEBF17   |
	PLA					;$BEBF19   |
	STA $0040,y				;$BEBF1A   |
	LDA $5E					;$BEBF1D   |
	RTL					;$BEBF1F  /

CODE_BEBF20:
	JMP CODE_BEBEA3				;$BEBF20  /

DATA_BEBF23:
	dw CODE_BEC02A
	dw CODE_BEC169
	dw CODE_BEC085
	dw CODE_BEC1D6
	dw CODE_BEC267
	dw CODE_BEC2C0
	dw CODE_BEC359
	dw CODE_BEC410
	dw CODE_BEC02A
	dw CODE_BEC01E
	dw CODE_BEC014
	dw CODE_BEC1D6
	dw CODE_BEC267
	dw CODE_BEC2C0
	dw CODE_BEC359
	dw CODE_BEC410
	dw CODE_BEC02A
	dw CODE_BEC169
	dw CODE_BEC085
	dw CODE_BEC1D6
	dw CODE_BEC21D
	dw CODE_BEC2C0
	dw CODE_BEC359
	dw CODE_BEC410
	dw CODE_BEBF63
	dw CODE_BEBF63
	dw CODE_BEBF63
	dw CODE_BEBF63
	dw CODE_BEBF63
	dw CODE_BEBF63
	dw CODE_BEBF63
	dw CODE_BEBF63

CODE_BEBF63:
	LDX $6A					;$BEBF63  \
	LDY current_sprite			;$BEBF65   |
	LDA $1E,x				;$BEBF67   |
	AND #$0101				;$BEBF69   |
	BNE CODE_BEBF83				;$BEBF6C   |
	LDA $DF					;$BEBF6E   |
	CLC					;$BEBF70   |
	ADC $DB					;$BEBF71   |
	LSR A					;$BEBF73   |
	CMP $E7					;$BEBF74   |
	BCC CODE_BEBF83				;$BEBF76   |
	LDA $24,x				;$BEBF78   |
	SEC					;$BEBF7A   |
	SBC #$0180				;$BEBF7B   |
	BMI CODE_BEBFD9				;$BEBF7E   |
	BRL CODE_BEC420				;$BEBF80  /

CODE_BEBF83:
	LDA $001E,y				;$BEBF83  \
	AND #$0101				;$BEBF86   |
	BNE CODE_BEBFC4				;$BEBF89   |
	LDA $0006,y				;$BEBF8B   |
	SEC					;$BEBF8E   |
	SBC $06,x				;$BEBF8F   |
	BCS CODE_BEBF97				;$BEBF91   |
	EOR #$FFFF				;$BEBF93   |
	INC A					;$BEBF96   |
CODE_BEBF97:					;	   |
	CMP #$0018				;$BEBF97   |
	BCS CODE_BEBFD9				;$BEBF9A   |
	LDA $DF					;$BEBF9C   |
	SEC					;$BEBF9E   |
	SBC $E3					;$BEBF9F   |
	XBA					;$BEBFA1   |
	STA $24,x				;$BEBFA2   |
	BIT $0E,x				;$BEBFA4   |
	BMI CODE_BEC011				;$BEBFA6   |
	XBA					;$BEBFA8   |
	CMP $0E,x				;$BEBFA9   |
	BCC CODE_BEC011				;$BEBFAB   |
	LDA $06,x				;$BEBFAD   |
	STA $0A3E				;$BEBFAF   |
	LDA $0C,x				;$BEBFB2   |
	STA $0A40				;$BEBFB4   |
	LDY #$0034				;$BEBFB7   |
	JSL CODE_BB842C				;$BEBFBA   |
	STZ $09E7				;$BEBFBE   |
	JMP CODE_BEC452				;$BEBFC1  /

CODE_BEBFC4:
	LDA $1E,x				;$BEBFC4  \
	AND #$0002				;$BEBFC6   |
	BEQ CODE_BEBFD9				;$BEBFC9   |
	LDA $06,x				;$BEBFCB   |
	CMP $0006,y				;$BEBFCD   |
	ROR A					;$BEBFD0   |
	EOR $0026,y				;$BEBFD1   |
	BPL CODE_BEBFD9				;$BEBFD4   |
	JMP CODE_BEC452				;$BEBFD6  /

CODE_BEBFD9:
	LDA $2E,x				;$BEBFD9  \
	CMP #$0056				;$BEBFDB   |
	BEQ CODE_BEC011				;$BEBFDE   |
	LDA $06,x				;$BEBFE0   |
	CMP $0006,y				;$BEBFE2   |
	BCS CODE_BEBFEE				;$BEBFE5   |
	LDA $D9					;$BEBFE7   |
	SEC					;$BEBFE9   |
	SBC $E5					;$BEBFEA   |
	BRA CODE_BEBFF3				;$BEBFEC  /

CODE_BEBFEE:
	LDA $DD					;$BEBFEE  \
	SEC					;$BEBFF0   |
	SBC $E1					;$BEBFF1   |
CODE_BEBFF3:					;	   |
	XBA					;$BEBFF3   |
	AND #$FF00				;$BEBFF4   |
	STA $2C,x				;$BEBFF7   |
	BPL CODE_BEC005				;$BEBFF9   |
	CMP #$FC00				;$BEBFFB   |
	BCS CODE_BEC00D				;$BEBFFE   |
	LDA #$FC00				;$BEC000   |
	BRA CODE_BEC00D				;$BEC003  /

CODE_BEC005:
	CMP #$0400				;$BEC005  \
	BCC CODE_BEC00D				;$BEC008   |
	LDA #$0400				;$BEC00A   |
CODE_BEC00D:					;	   |
	STA $20,x				;$BEC00D   |
	STZ $26,x				;$BEC00F   |
CODE_BEC011:					;	   |
	BRL CODE_BEBEA3				;$BEC011  /

CODE_BEC014:
	LDX $6A					;$BEC014  \
	JSR CODE_BEC141				;$BEC016   |
	BCC CODE_BEC01E				;$BEC019   |
	BRL CODE_BEC452				;$BEC01B  /

CODE_BEC01E:
	LDA $E7					;$BEC01E  \
	CMP $DF					;$BEC020   |
	BCS CODE_BEC027				;$BEC022   |
	BRL CODE_BEC442				;$BEC024  /

CODE_BEC027:
	BRL CODE_BEC452				;$BEC027  /

CODE_BEC02A:
	LDX $6A					;$BEC02A  \
	LDA #$FFF8				;$BEC02C   |
	TRB $5E					;$BEC02F   |
	LDA $09F5				;$BEC031   |
	BIT #$0005				;$BEC034   |
	BEQ CODE_BEC05D				;$BEC037   |
	LDA $5E					;$BEC039   |
	CMP #$0004				;$BEC03B   |
	BEQ CODE_BEC06C				;$BEC03E   |
	LDY $19CE				;$BEC040   |
	BNE CODE_BEC072				;$BEC043   |
	CMP #$0003				;$BEC045   |
	BEQ CODE_BEC075				;$BEC048   |
	CMP #$0001				;$BEC04A   |
	BEQ CODE_BEC072				;$BEC04D   |
	CMP #$0002				;$BEC04F   |
	BNE CODE_BEC05D				;$BEC052   |
	LDA $40,x				;$BEC054   |
	AND #$1800				;$BEC056   |
	BEQ CODE_BEC075				;$BEC059   |
	BRA CODE_BEC072				;$BEC05B  /

CODE_BEC05D:
	LDA $09F5				;$BEC05D  \
	BIT #$0006				;$BEC060   |
	BEQ CODE_BEC06C				;$BEC063   |
	LDA $5E					;$BEC065   |
	CMP #$0000				;$BEC067   |
	BEQ CODE_BEC06F				;$BEC06A   |
CODE_BEC06C:					;	   |
	BRL CODE_BEBEA3				;$BEC06C  /

CODE_BEC06F:
	BRL CODE_BEC452				;$BEC06F  /

CODE_BEC072:
	BRL CODE_BEC500				;$BEC072  /

CODE_BEC075:
	LDA #$001E				;$BEC075  \
	LDX $6A					;$BEC078   |
	CPX $0593				;$BEC07A   |
	BEQ CODE_BEC082				;$BEC07D   |
	LDA #$001D				;$BEC07F   |
CODE_BEC082:					;	   |
	BRL CODE_BEC52D				;$BEC082  /

CODE_BEC085:
	LDX $6A					;$BEC085  \
	JSR CODE_BEC141				;$BEC087   |
	BCC CODE_BEC104				;$BEC08A   |
	LDA $19CE				;$BEC08C   |
	BNE CODE_BEC0EC				;$BEC08F   |
	LDA #$FF1F				;$BEC091   |
	TRB $5E					;$BEC094   |
	LDA $09F5				;$BEC096   |
	BIT #$0005				;$BEC099   |
	BEQ CODE_BEC0C7				;$BEC09C   |
	LDA $5E					;$BEC09E   |
	CMP #$00C0				;$BEC0A0   |
	BEQ CODE_BEC101				;$BEC0A3   |
	CMP #$0080				;$BEC0A5   |
	BEQ CODE_BEC0DD				;$BEC0A8   |
	CMP #$00A0				;$BEC0AA   |
	BEQ CODE_BEC0D8				;$BEC0AD   |
	CMP #$0020				;$BEC0AF   |
	BEQ CODE_BEC0EC				;$BEC0B2   |
	CMP #$0060				;$BEC0B4   |
	BEQ CODE_BEC0F8				;$BEC0B7   |
	CMP #$0040				;$BEC0B9   |
	BNE CODE_BEC0C7				;$BEC0BC   |
	LDA $40,x				;$BEC0BE   |
	AND #$0800				;$BEC0C0   |
	BEQ CODE_BEC0F8				;$BEC0C3   |
	BRA CODE_BEC0EC				;$BEC0C5  /

CODE_BEC0C7:
	LDA $09F5				;$BEC0C7  \
	BIT #$0006				;$BEC0CA   |
	BEQ CODE_BEC101				;$BEC0CD   |
	LDA $5E					;$BEC0CF   |
	CMP #$0000				;$BEC0D1   |
	BEQ CODE_BEC0FE				;$BEC0D4   |
	BRA CODE_BEC101				;$BEC0D6  /

CODE_BEC0D8:
	LDA #$0000				;$BEC0D8  \
	BRA CODE_BEC0E0				;$BEC0DB  /

CODE_BEC0DD:
	LDA #$4000				;$BEC0DD  \
CODE_BEC0E0:					;	   |
	EOR $12,x				;$BEC0E0   |
	LDY current_sprite			;$BEC0E2   |
	EOR $0012,y				;$BEC0E4   |
	AND #$4000				;$BEC0E7   |
	BNE CODE_BEC0FE				;$BEC0EA   |
CODE_BEC0EC:					;	   |
	LDA #$001C				;$BEC0EC   |
	BRL CODE_BEC4F2				;$BEC0EF  /

CODE_BEC0F2:
	LDA #$001C				;$BEC0F2  \
	BRL CODE_BEC4F2				;$BEC0F5  /

CODE_BEC0F8:
	LDA #$001E				;$BEC0F8  \
	BRL CODE_BEC52D				;$BEC0FB  /

CODE_BEC0FE:
	BRL CODE_BEC452				;$BEC0FE  /

CODE_BEC101:
	BRL CODE_BEBEA3				;$BEC101  /

CODE_BEC104:
	LDA $19CE				;$BEC104  \
	BNE CODE_BEC0F2				;$BEC107   |
	LDA #$FFE7				;$BEC109   |
	TRB $5E					;$BEC10C   |
	LDA $09F5				;$BEC10E   |
	BIT #$0005				;$BEC111   |
	BEQ CODE_BEC130				;$BEC114   |
	LDA $5E					;$BEC116   |
	CMP #$0008				;$BEC118   |
	BEQ CODE_BEC0F2				;$BEC11B   |
	CMP #$0018				;$BEC11D   |
	BEQ CODE_BEC0F8				;$BEC120   |
	CMP #$0010				;$BEC122   |
	BNE CODE_BEC130				;$BEC125   |
	LDA $40,x				;$BEC127   |
	AND #$1000				;$BEC129   |
	BEQ CODE_BEC0F8				;$BEC12C   |
	BRA CODE_BEC0F2				;$BEC12E  /

CODE_BEC130:
	LDA $09F5				;$BEC130  \
	BIT #$0006				;$BEC133   |
	BEQ CODE_BEC101				;$BEC136   |
	LDA $5E					;$BEC138   |
	CMP #$0000				;$BEC13A   |
	BEQ CODE_BEC0FE				;$BEC13D   |
	BRA CODE_BEC101				;$BEC13F  /

CODE_BEC141:
	LDA $1E,x				;$BEC141  \
	AND #$0101				;$BEC143   |
	BNE CODE_BEC165				;$BEC146   |
	LDA $24,x				;$BEC148   |
	BMI CODE_BEC165				;$BEC14A   |
	LDA $DF					;$BEC14C   |
	CLC					;$BEC14E   |
	ADC $DB					;$BEC14F   |
	LSR A					;$BEC151   |
	CMP $E7					;$BEC152   |
	BCS CODE_BEC167				;$BEC154   |
	LDA $D9					;$BEC156   |
	SEC					;$BEC158   |
	SBC $E5					;$BEC159   |
	BCC CODE_BEC161				;$BEC15B   |
	LDA $E1					;$BEC15D   |
	SBC $DD					;$BEC15F   |
CODE_BEC161:					;	   |
	CMP #$FFF4				;$BEC161   |
	RTS					;$BEC164  /

CODE_BEC165:
	SEC					;$BEC165  \
	RTS					;$BEC166  /

CODE_BEC167:
	CLC					;$BEC167  \
	RTS					;$BEC168  /

CODE_BEC169:
	LDX $6A					;$BEC169  \
	LDA $E7					;$BEC16B   |
	SEC					;$BEC16D   |
	SBC $DB					;$BEC16E   |
	SEC					;$BEC170   |
	SBC #$0020				;$BEC171   |
	BPL CODE_BEC17E				;$BEC174   |
	LDA $24,x				;$BEC176   |
	CLC					;$BEC178   |
	ADC #$0140				;$BEC179   |
	BPL CODE_BEC181				;$BEC17C   |
CODE_BEC17E:					;	   |
	BRL CODE_BEC02A				;$BEC17E  /

CODE_BEC181:
	LDA $19CE				;$BEC181  \
	BNE CODE_BEC1C2				;$BEC184   |
	LDA #$FFE7				;$BEC186   |
	TRB $5E					;$BEC189   |
	LDA $09F5				;$BEC18B   |
	BIT #$0005				;$BEC18E   |
	BEQ CODE_BEC1AD				;$BEC191   |
	LDA $5E					;$BEC193   |
	CMP #$0008				;$BEC195   |
	BEQ CODE_BEC1C2				;$BEC198   |
	CMP #$0018				;$BEC19A   |
	BEQ CODE_BEC1CD				;$BEC19D   |
	CMP #$0010				;$BEC19F   |
	BNE CODE_BEC1AD				;$BEC1A2   |
	LDA $40,x				;$BEC1A4   |
	AND #$1000				;$BEC1A6   |
	BEQ CODE_BEC1CD				;$BEC1A9   |
	BRA CODE_BEC1C2				;$BEC1AB  /

CODE_BEC1AD:
	LDA $09F5				;$BEC1AD  \
	BIT #$0006				;$BEC1B0   |
	BEQ CODE_BEC1BC				;$BEC1B3   |
	LDA $5E					;$BEC1B5   |
	CMP #$0000				;$BEC1B7   |
	BEQ CODE_BEC1BF				;$BEC1BA   |
CODE_BEC1BC:					;	   |
	BRL CODE_BEBEA3				;$BEC1BC  /

CODE_BEC1BF:
	BRL CODE_BEC452				;$BEC1BF  /

CODE_BEC1C2:
	LDA $0D5E				;$BEC1C2  \
	BNE CODE_BEC1D3				;$BEC1C5   |
	LDA #$001B				;$BEC1C7   |
	BRL CODE_BEC4F2				;$BEC1CA  /

CODE_BEC1CD:
	LDA #$001E				;$BEC1CD  \
	BRL CODE_BEC52D				;$BEC1D0  /

CODE_BEC1D3:
	BRL CODE_BEC58D				;$BEC1D3  /

CODE_BEC1D6:
	LDX $6A					;$BEC1D6  \
	LDA #$FCFF				;$BEC1D8   |
	TRB $5E					;$BEC1DB   |
	LDA $09F5				;$BEC1DD   |
	BIT #$0005				;$BEC1E0   |
	BEQ CODE_BEC1FF				;$BEC1E3   |
	LDA $5E					;$BEC1E5   |
	CMP #$0100				;$BEC1E7   |
	BEQ CODE_BEC214				;$BEC1EA   |
	CMP #$0300				;$BEC1EC   |
	BEQ CODE_BEC217				;$BEC1EF   |
	CMP #$0200				;$BEC1F1   |
	BNE CODE_BEC1FF				;$BEC1F4   |
	LDA $40,x				;$BEC1F6   |
	AND #$1800				;$BEC1F8   |
	BEQ CODE_BEC217				;$BEC1FB   |
	BRA CODE_BEC214				;$BEC1FD  /

CODE_BEC1FF:
	LDA $09F5				;$BEC1FF  \
	BIT #$0006				;$BEC202   |
	BEQ CODE_BEC20E				;$BEC205   |
	LDA $5E					;$BEC207   |
	CMP #$0000				;$BEC209   |
	BEQ CODE_BEC211				;$BEC20C   |
CODE_BEC20E:					;	   |
	BRL CODE_BEBEA3				;$BEC20E  /

CODE_BEC211:
	BRL CODE_BEC452				;$BEC211  /

CODE_BEC214:
	BRL CODE_BEC500				;$BEC214  /

CODE_BEC217:
	LDA #$001E				;$BEC217  \
	BRL CODE_BEC52D				;$BEC21A  /

CODE_BEC21D:
	LDX $6A					;$BEC21D  \
	LDA #$F3FF				;$BEC21F   |
	TRB $5E					;$BEC222   |
	LDA $09F5				;$BEC224   |
	BIT #$0005				;$BEC227   |
	BEQ CODE_BEC246				;$BEC22A   |
	LDA $5E					;$BEC22C   |
	CMP #$0400				;$BEC22E   |
	BEQ CODE_BEC25B				;$BEC231   |
	CMP #$0C00				;$BEC233   |
	BEQ CODE_BEC261				;$BEC236   |
	CMP #$0800				;$BEC238   |
	BNE CODE_BEC246				;$BEC23B   |
	LDA $40,x				;$BEC23D   |
	AND #$1800				;$BEC23F   |
	BEQ CODE_BEC258				;$BEC242   |
	BRA CODE_BEC261				;$BEC244  /

CODE_BEC246:
	LDA $09F5				;$BEC246  \
	BIT #$0006				;$BEC249   |
	BEQ CODE_BEC255				;$BEC24C   |
	LDA $5E					;$BEC24E   |
	CMP #$0000				;$BEC250   |
	BEQ CODE_BEC258				;$BEC253   |
CODE_BEC255:					;	   |
	BRL CODE_BEBEA3				;$BEC255  /

CODE_BEC258:
	BRL CODE_BEC452				;$BEC258  /

CODE_BEC25B:
	LDA #$001D				;$BEC25B  \
	BRL CODE_BEC4F2				;$BEC25E  /

CODE_BEC261:
	LDA #$001D				;$BEC261  \
	BRL CODE_BEC52D				;$BEC264  /

CODE_BEC267:
	LDX $6A					;$BEC267  \
	LDA #$F3FF				;$BEC269   |
	TRB $5E					;$BEC26C   |
	LDA $09F5				;$BEC26E   |
	BIT #$0005				;$BEC271   |
	BEQ CODE_BEC290				;$BEC274   |
	LDA $5E					;$BEC276   |
	CMP #$0400				;$BEC278   |
	BEQ CODE_BEC2A5				;$BEC27B   |
	CMP #$0C00				;$BEC27D   |
	BEQ CODE_BEC2AB				;$BEC280   |
	CMP #$0800				;$BEC282   |
	BNE CODE_BEC290				;$BEC285   |
	LDA $40,x				;$BEC287   |
	AND #$1800				;$BEC289   |
	BEQ CODE_BEC2AB				;$BEC28C   |
	BRA CODE_BEC2A5				;$BEC28E  /

CODE_BEC290:
	LDA $09F5				;$BEC290  \
	BIT #$0006				;$BEC293   |
	BEQ CODE_BEC29F				;$BEC296   |
	LDA $5E					;$BEC298   |
	CMP #$0000				;$BEC29A   |
	BEQ CODE_BEC2A2				;$BEC29D   |
CODE_BEC29F:					;	   |
	BRL CODE_BEBEA3				;$BEC29F  /

CODE_BEC2A2:
	BRL CODE_BEC452				;$BEC2A2  /

CODE_BEC2A5:
	LDA #$001D				;$BEC2A5  \
	BRL CODE_BEC4F2				;$BEC2A8  /

CODE_BEC2AB:
	LDA #$001D				;$BEC2AB  \
	BRL CODE_BEC52D				;$BEC2AE  /

CODE_BEC2B1:
	LDY current_sprite			;$BEC2B1  \
	LDA $0006,y				;$BEC2B3   |
	CMP $06,x				;$BEC2B6   |
	ROR A					;$BEC2B8   |
	LSR A					;$BEC2B9   |
	EOR $12,x				;$BEC2BA   |
	AND #$4000				;$BEC2BC   |
	RTS					;$BEC2BF  /

CODE_BEC2C0:
	LDX $6A					;$BEC2C0  \
	LDA $6E					;$BEC2C2   |
	CMP #$01A0				;$BEC2C4   |
	BEQ CODE_BEC2D1				;$BEC2C7   |
	JSR CODE_BEC141				;$BEC2C9   |
	BCS CODE_BEC2D1				;$BEC2CC   |
	BRL CODE_BEC359				;$BEC2CE  /

CODE_BEC2D1:
	LDX $6A					;$BEC2D1  \
	LDA #$CFFF				;$BEC2D3   |
	TRB $5E					;$BEC2D6   |
	LDA $09F5				;$BEC2D8   |
	BIT #$0001				;$BEC2DB   |
	BEQ CODE_BEC2FF				;$BEC2DE   |
	LDA $5E					;$BEC2E0   |
	CMP #$1000				;$BEC2E2   |
	BEQ CODE_BEC345				;$BEC2E5   |
	CMP #$3000				;$BEC2E7   |
	BNE CODE_BEC2FF				;$BEC2EA   |
	LDA $40,x				;$BEC2EC   |
	AND #$0800				;$BEC2EE   |
	BNE CODE_BEC345				;$BEC2F1   |
	LDA $30,x				;$BEC2F3   |
	BIT #$0080				;$BEC2F5   |
	BNE CODE_BEC2FF				;$BEC2F8   |
	JSR CODE_BEC2B1				;$BEC2FA   |
	BNE CODE_BEC345				;$BEC2FD   |
CODE_BEC2FF:					;	   |
	LDA $09F5				;$BEC2FF   |
	BIT #$0004				;$BEC302   |
	BEQ CODE_BEC331				;$BEC305   |
	LDA $5E					;$BEC307   |
	CMP #$3000				;$BEC309   |
	BEQ CODE_BEC31C				;$BEC30C   |
	CMP #$2000				;$BEC30E   |
	BNE CODE_BEC331				;$BEC311   |
	LDA $40,x				;$BEC313   |
	AND #$0800				;$BEC315   |
	BEQ CODE_BEC33C				;$BEC318   |
	BRA CODE_BEC33F				;$BEC31A  /

CODE_BEC31C:
	LDA $40,x				;$BEC31C  \
	AND #$0800				;$BEC31E   |
	BNE CODE_BEC331				;$BEC321   |
	LDA $30,x				;$BEC323   |
	BIT #$0080				;$BEC325   |
	BNE CODE_BEC33F				;$BEC328   |
	JSR CODE_BEC2B1				;$BEC32A   |
	BNE CODE_BEC345				;$BEC32D   |
	BRA CODE_BEC33F				;$BEC32F  /

CODE_BEC331:
	LDA $09F5				;$BEC331  \
	BIT #$0006				;$BEC334   |
	BNE CODE_BEC33C				;$BEC337   |
	BRL CODE_BEBEA3				;$BEC339  /

CODE_BEC33C:
	BRL CODE_BEC452				;$BEC33C  /

CODE_BEC33F:
	LDA #$001E				;$BEC33F  \
	BRL CODE_BEC52D				;$BEC342  /

CODE_BEC345:
	LDA $6E					;$BEC345  \
	CMP #$01A0				;$BEC347   |
	BEQ CODE_BEC34F				;$BEC34A   |
	BRL CODE_BEC500				;$BEC34C  /

CODE_BEC34F:
	LDA #$0204				;$BEC34F  \
	JSL queue_sound_effect			;$BEC352   |
	BRL CODE_BEC500				;$BEC356  /

CODE_BEC359:
	LDX $6A					;$BEC359  \
	LDA $09F5				;$BEC35B   |
	BIT #$0001				;$BEC35E   |
	BEQ CODE_BEC37C				;$BEC361   |
	LDA $5E					;$BEC363   |
	AND #$C000				;$BEC365   |
	CMP #$4000				;$BEC368   |
	BEQ CODE_BEC3BC				;$BEC36B   |
	CMP #$8000				;$BEC36D   |
	BNE CODE_BEC3B2				;$BEC370   |
	LDA $40,x				;$BEC372   |
	AND #$1000				;$BEC374   |
	BNE CODE_BEC3BC				;$BEC377   |
	LDA $09F5				;$BEC379   |
CODE_BEC37C:					;	   |
	BIT #$0004				;$BEC37C   |
	BEQ CODE_BEC3B2				;$BEC37F   |
	LDA $24,x				;$BEC381   |
	CLC					;$BEC383   |
	ADC #$0140				;$BEC384   |
	BPL CODE_BEC3CE				;$BEC387   |
	LDY current_sprite			;$BEC389   |
	LDA $0006,y				;$BEC38B   |
	SEC					;$BEC38E   |
	SBC $06,x				;$BEC38F   |
	STA $76					;$BEC391   |
	EOR $20,x				;$BEC393   |
	BPL CODE_BEC3AF				;$BEC395   |
	LDA $12,x				;$BEC397   |
	ASL A					;$BEC399   |
	EOR $20,x				;$BEC39A   |
	BMI CODE_BEC3CB				;$BEC39C   |
	LDA #$000C				;$BEC39E   |
	BIT $20,x				;$BEC3A1   |
	BPL CODE_BEC3A8				;$BEC3A3   |
	LDA #$FFF4				;$BEC3A5   |
CODE_BEC3A8:					;	   |
	CLC					;$BEC3A8   |
	ADC $76					;$BEC3A9   |
	EOR $76					;$BEC3AB   |
	BPL CODE_BEC3CB				;$BEC3AD   |
CODE_BEC3AF:					;	   |
	BRL CODE_BEC02A				;$BEC3AF  /

CODE_BEC3B2:
	LDA $09F5				;$BEC3B2  \
	BIT #$0006				;$BEC3B5   |
	BNE CODE_BEC3C8				;$BEC3B8   |
	BRA CODE_BEC3CB				;$BEC3BA  /

CODE_BEC3BC:
	LDA #$001B				;$BEC3BC  \
	BRL CODE_BEC4F2				;$BEC3BF  /

CODE_BEC3C2:
	LDA #$001E				;$BEC3C2  \
	BRL CODE_BEC52D				;$BEC3C5  /

CODE_BEC3C8:
	BRL CODE_BEC452				;$BEC3C8  /

CODE_BEC3CB:
	BRL CODE_BEBEA3				;$BEC3CB  /

CODE_BEC3CE:
	XBA					;$BEC3CE  \
	AND #$00FF				;$BEC3CF   |
	SEC					;$BEC3D2   |
	SBC $E7					;$BEC3D3   |
	CLC					;$BEC3D5   |
	ADC $DB					;$BEC3D6   |
	CLC					;$BEC3D8   |
	ADC #$0020				;$BEC3D9   |
	BPL CODE_BEC3EA				;$BEC3DC   |
	LDA $40,x				;$BEC3DE   |
	AND #$0800				;$BEC3E0   |
	BEQ CODE_BEC3AF				;$BEC3E3   |
	JSR CODE_BEC2B1				;$BEC3E5   |
	BEQ CODE_BEC3AF				;$BEC3E8   |
CODE_BEC3EA:					;	   |
	LDA $5E					;$BEC3EA   |
	AND #$C000				;$BEC3EC   |
	CMP #$4000				;$BEC3EF   |
	BEQ CODE_BEC3BC				;$BEC3F2   |
	CMP #$C000				;$BEC3F4   |
	BEQ CODE_BEC407				;$BEC3F7   |
	CMP #$8000				;$BEC3F9   |
	BNE CODE_BEC3B2				;$BEC3FC   |
	LDA $40,x				;$BEC3FE   |
	AND #$1000				;$BEC400   |
	BEQ CODE_BEC3C2				;$BEC403   |
	BRA CODE_BEC3BC				;$BEC405  /

CODE_BEC407:
	LDA $40,x				;$BEC407  \
	AND #$0800				;$BEC409   |
	BNE CODE_BEC3C2				;$BEC40C   |
	BRA CODE_BEC3C8				;$BEC40E  /

CODE_BEC410:
	LDX $6A					;$BEC410  \
	LDA $09F5				;$BEC412   |
	BIT #$0005				;$BEC415   |
	BEQ CODE_BEC41D				;$BEC418   |
	BRL CODE_BEC500				;$BEC41A  /

CODE_BEC41D:
	BRL CODE_BEBEA3				;$BEC41D  /

CODE_BEC420:
	LDA #$000E				;$BEC420  \
	JSL CODE_B8D8BA				;$BEC423   |
	BCS CODE_BEC43F				;$BEC427   |
	LDA #$0560				;$BEC429   |
	JSL queue_sound_effect			;$BEC42C   |
	LDX current_sprite			;$BEC430   |
	LDY $6A					;$BEC432   |
	STZ $0A86				;$BEC434   |
	STX $0A88				;$BEC437   |
	LDA #$0003				;$BEC43A   |
	SEC					;$BEC43D   |
	RTL					;$BEC43E  /

CODE_BEC43F:
	BRL CODE_BEBEA3				;$BEC43F  /

CODE_BEC442:
	LDA #$0013				;$BEC442  \
	JSL CODE_B8D8BA				;$BEC445   |
	LDX current_sprite			;$BEC449   |
	LDY $6A					;$BEC44B   |
	LDA #$0003				;$BEC44D   |
	SEC					;$BEC450   |
	RTL					;$BEC451  /

CODE_BEC452:
	LDX $6A					;$BEC452  \
	LDA $30,x				;$BEC454   |
	BIT #$0080				;$BEC456   |
	BNE CODE_BEC4B7				;$BEC459   |
	LDY current_sprite			;$BEC45B   |
	LDA $0000,y				;$BEC45D   |
	CMP #$01AC				;$BEC460   |
	BNE CODE_BEC46D				;$BEC463   |
	LDA $09F7				;$BEC465   |
	CMP #$5004				;$BEC468   |
	BEQ CODE_BEC4B7				;$BEC46B   |
CODE_BEC46D:					;	   |
	LDY #$0020				;$BEC46D   |
	CPX $0597				;$BEC470   |
	BEQ CODE_BEC485				;$BEC473   |
	LDY #$0023				;$BEC475   |
	LDA $08C2				;$BEC478   |
	AND #$4000				;$BEC47B   |
	BNE CODE_BEC485				;$BEC47E   |
	JSR CODE_BEC4BA				;$BEC480   |
	BRA CODE_BEC48C				;$BEC483  /

CODE_BEC485:
	TYA					;$BEC485  \
	JSL CODE_B8D8BA				;$BEC486   |
	BCS CODE_BEC4B7				;$BEC48A   |
CODE_BEC48C:					;	   |
	JSR CODE_BEC5A4				;$BEC48C   |
	LDX current_sprite			;$BEC48F   |
	LDY $6A					;$BEC491   |
	LDA $12,x				;$BEC493   |
	EOR $20,x				;$BEC495   |
	AND #$4000				;$BEC497   |
	EOR $20,x				;$BEC49A   |
	AND #$C000				;$BEC49C   |
	CLC					;$BEC49F   |
	ADC current_sprite			;$BEC4A0   |
	SEC					;$BEC4A2   |
	SBC #aux_sprite_table			;$BEC4A3   |
	STA $0034,y				;$BEC4A6   |
	LDA $0030,y				;$BEC4A9   |
	AND #$FFFD				;$BEC4AC   |
	STA $0030,y				;$BEC4AF   |
	SEC					;$BEC4B2   |
	LDA #$0001				;$BEC4B3   |
	RTL					;$BEC4B6  /

CODE_BEC4B7:
	BRL CODE_BEBEA3				;$BEC4B7  /

CODE_BEC4BA:
	LDA $0515				;$BEC4BA  \
	CMP #$0001				;$BEC4BD   |
	BEQ CODE_BEC4C8				;$BEC4C0   |
	TYA					;$BEC4C2   |
	JSL CODE_B8D8BA				;$BEC4C3   |
	RTS					;$BEC4C7  /

CODE_BEC4C8:
	LDA #$0028				;$BEC4C8  \
	JSL CODE_B8D8BA				;$BEC4CB   |
	LDA #$0003				;$BEC4CF   |
	STA $0A36				;$BEC4D2   |
	RTS					;$BEC4D5  /

CODE_BEC4D6:
	TAY					;$BEC4D6  \
	LDX $6A					;$BEC4D7   |
	LDA $30,x				;$BEC4D9   |
	BIT #$0800				;$BEC4DB   |
	BEQ CODE_BEC4EF				;$BEC4DE   |
	LDA $09F5				;$BEC4E0   |
	BIT #$0001				;$BEC4E3   |
	BEQ CODE_BEC4EF				;$BEC4E6   |
	LDA #$0002				;$BEC4E8   |
	STA $32,x				;$BEC4EB   |
	SEC					;$BEC4ED   |
	RTS					;$BEC4EE  /

CODE_BEC4EF:
	TYA					;$BEC4EF  \
	CLC					;$BEC4F0   |
	RTS					;$BEC4F1  /

CODE_BEC4F2:
	JSR CODE_BEC4D6				;$BEC4F2  \
	BCC CODE_BEC4FA				;$BEC4F5   |
	BRL CODE_BEBEA3				;$BEC4F7  /

CODE_BEC4FA:
	JSL CODE_B8D8BA				;$BEC4FA  \
	BRA CODE_BEC508				;$BEC4FE  /

CODE_BEC500:
	JSR CODE_BEC4D6				;$BEC500  \
	BCC CODE_BEC508				;$BEC503   |
	BRL CODE_BEBEA3				;$BEC505  /

CODE_BEC508:
	JSR CODE_BEC5A4				;$BEC508  \
	JSL CODE_BBBD6B				;$BEC50B   |
	LDX current_sprite			;$BEC50F   |
	LDA #$01A0				;$BEC511   |\ Piracy check
	STA $32					;$BEC514   | | Lower byte (A0) goes into lowest byte of $32 ($????A0)
	SEC					;$BEC516   | | Set carry so when we ROR the highest bit will be set giving us our bank 80
	ROR A					;$BEC517   | | This halves #$01A0 giving us the high address byte (D0) also making a wild bank 80 appear...
	STA $33					;$BEC518   |/ ...In the upper part of A! ($80D0A0) Write rest of address and bank to $33
	LDY #$2F5C				;$BEC51A   |\ $80D0A0 + $2F5C = $80FFFC ($32 is now a pointer to the reset vector at $80FFFC)
	ADC [$32],y				;$BEC51D   | | A + reset vector value - $04C7 should == 0 (A = $80D0 here)
	SBC #$04C7				;$BEC51F   | |
	BEQ CODE_BEC526				;$BEC522   |/ If reset vector is correct continue as normal
	STZ $58,x				;$BEC524   | Else reset vector was tampered. Prevent animal crates from breaking
CODE_BEC526:					;	   |
	LDY $6A					;$BEC526   |
	SEC					;$BEC528   |
	LDA #$0000				;$BEC529   |
	RTL					;$BEC52C  /

CODE_BEC52D:
	JSL CODE_B8D8BA				;$BEC52D  \
	BCS CODE_BEC57A				;$BEC531   |
	LDX $6A					;$BEC533   |
	LDY current_sprite			;$BEC535   |
	LDA $06,x				;$BEC537   |
	SEC					;$BEC539   |
	SBC $0006,y				;$BEC53A   |
	STA $0A88				;$BEC53D   |
	LDA $20,x				;$BEC540   |
	BPL CODE_BEC548				;$BEC542   |
	EOR #$FFFF				;$BEC544   |
	INC A					;$BEC547   |
CODE_BEC548:					;	   |
	STA $0A86				;$BEC548   |
	LDA $0020,y				;$BEC54B   |
	BPL CODE_BEC554				;$BEC54E   |
	EOR #$FFFF				;$BEC550   |
	INC A					;$BEC553   |
CODE_BEC554:					;	   |
	CLC					;$BEC554   |
	ADC $0A86				;$BEC555   |
	CMP #$0180				;$BEC558   |
	BCS CODE_BEC560				;$BEC55B   |
	LDA #$0180				;$BEC55D   |
CODE_BEC560:					;	   |
	LSR A					;$BEC560   |
	BIT $0A88				;$BEC561   |
	BPL CODE_BEC56A				;$BEC564   |
	EOR #$FFFF				;$BEC566   |
	INC A					;$BEC569   |
CODE_BEC56A:					;	   |
	STA $0A86				;$BEC56A   |
	LSR A					;$BEC56D   |
	EOR $0012,y				;$BEC56E   |
	AND #$4000				;$BEC571   |
	EOR $0012,y				;$BEC574   |
	STA $0012,y				;$BEC577   |
CODE_BEC57A:					;	   |
	JSR CODE_BEC5A4				;$BEC57A   |
	LDA #$0502				;$BEC57D   |
	JSL queue_sound_effect			;$BEC580   |
	LDX current_sprite			;$BEC584   |
	LDY $6A					;$BEC586   |
	SEC					;$BEC588   |
	LDA #$0002				;$BEC589   |
	RTL					;$BEC58C  /

CODE_BEC58D:
	LDX $0D5E				;$BEC58D  \
	LDA #$FA00				;$BEC590   |
	STA $24,x				;$BEC593   |
	LDA $40,x				;$BEC595   |
	CMP #$000E				;$BEC597   |
	BCS CODE_BEC59F				;$BEC59A   |
	LDA #$000E				;$BEC59C   |
CODE_BEC59F:					;	   |
	STA $40,x				;$BEC59F   |
	BRL CODE_BEC508				;$BEC5A1  /

CODE_BEC5A4:
	JSL CODE_BCFED8				;$BEC5A4  \
	BCS CODE_BEC5B9				;$BEC5A8   |
	JSL CODE_BCFEC0				;$BEC5AA   |
	JSL CODE_B3A334				;$BEC5AE   |
	LDY #$0034				;$BEC5B2   |
	JSL CODE_BB842C				;$BEC5B5   |
CODE_BEC5B9:					;	   |
	LDX current_sprite			;$BEC5B9   |
	RTS					;$BEC5BB  /

CODE_BEC5BC:
	LDX current_sprite			;$BEC5BC  \
	STA $24,x				;$BEC5BE   |
	SEP #$20				;$BEC5C0   |
	STZ $24,x				;$BEC5C2   |
	STZ $20,x				;$BEC5C4   |
	STA $21,x				;$BEC5C6   |
	REP #$20				;$BEC5C8   |
	LDA #$8000				;$BEC5CA   |
	STA $1C,x				;$BEC5CD   |
	LDA $06,x				;$BEC5CF   |
	SEC					;$BEC5D1   |
	SBC $17BA				;$BEC5D2   |
	BCS CODE_BEC5DA				;$BEC5D5   |
	LDA #$0000				;$BEC5D7   |
CODE_BEC5DA:					;	   |
	CMP #$0100				;$BEC5DA   |
	BCC CODE_BEC5E2				;$BEC5DD   |
	LDA #$00FF				;$BEC5DF   |
CODE_BEC5E2:					;	   |
	STA $06,x				;$BEC5E2   |
	LDA $0A,x				;$BEC5E4   |
	SEC					;$BEC5E6   |
	SBC $17C0				;$BEC5E7   |
	BCS CODE_BEC5EF				;$BEC5EA   |
	LDA #$0000				;$BEC5EC   |
CODE_BEC5EF:					;	   |
	CMP #$0100				;$BEC5EF   |
	BCC CODE_BEC5F7				;$BEC5F2   |
	LDA #$00FF				;$BEC5F4   |
CODE_BEC5F7:					;	   |
	STA $0A,x				;$BEC5F7   |
	RTL					;$BEC5F9  /

CODE_BEC5FA:
	LDY #$0002				;$BEC5FA  \
	LDX current_sprite			;$BEC5FD   |
	LDA $20,x				;$BEC5FF   |
	SEC					;$BEC601   |
	SBC $05,x				;$BEC602   |
	JSR CODE_BEC61B				;$BEC604   |
	CLC					;$BEC607   |
	ADC $05,x				;$BEC608   |
	STA $05,x				;$BEC60A   |
	LDA $24,x				;$BEC60C   |
	SEC					;$BEC60E   |
	SBC $09,x				;$BEC60F   |
	JSR CODE_BEC61B				;$BEC611   |
	CLC					;$BEC614   |
	ADC $09,x				;$BEC615   |
	STA $09,x				;$BEC617   |
	DEY					;$BEC619   |
	RTL					;$BEC61A  /

CODE_BEC61B:
	BEQ CODE_BEC62B				;$BEC61B  \
	BCS CODE_BEC62D				;$BEC61D   |
	EOR #$FFFF				;$BEC61F   |
	INC A					;$BEC622   |
	JSR CODE_BEC62D				;$BEC623   |
	EOR #$FFFF				;$BEC626   |
	INC A					;$BEC629   |
	RTS					;$BEC62A  /

CODE_BEC62B:
	DEY					;$BEC62B  \
	RTS					;$BEC62C  /

CODE_BEC62D:
	CMP #$0100				;$BEC62D  \
	BCC CODE_BEC63D				;$BEC630   |
	LSR A					;$BEC632   |
	LSR A					;$BEC633   |
	LSR A					;$BEC634   |
	CMP #$0080				;$BEC635   |
	BCS CODE_BEC63D				;$BEC638   |
	LDA #$0080				;$BEC63A   |
CODE_BEC63D:					;	   |
	RTS					;$BEC63D  /

CODE_BEC63E:
	SEP #$20				;$BEC63E  \ 8 bit
	EOR #$FF				;$BEC640   | negate number of lives to add
	SEC					;$BEC642   |
	ADC $0971				;$BEC643   | add negative number of lives to add
	STA $0971				;$BEC646   | this basically sets it back to 0
	REP #$20				;$BEC649   | 16 bit
	RTL					;$BEC64B  /

CODE_BEC64C:
	SEP #$20				;$BEC64C  \ 8 bit
	PHA					;$BEC64E   | preserve number of lives to add
	CLC					;$BEC64F   |
	ADC $0971				;$BEC650   | add lives to add counter
	STA $0971				;$BEC653   | update life add counter
	PLA					;$BEC656   | retrieve number of lives to add
	REP #$20				;$BEC657   | 16 bit
CODE_BEC659:					;	   |
	CLC					;$BEC659   |
	ADC $08BE				;$BEC65A   | add lives to current life count
	STA $08BE				;$BEC65D   |
	LDA $0973				;$BEC660   | get the life display timer
	BNE CODE_BEC668				;$BEC663   | if the timer isnt 0
	STZ $0977				;$BEC665   |
CODE_BEC668:					;	   |
	LDA #$0078				;$BEC668   | set life display timer
	STA $0973				;$BEC66B   |
	RTL					;$BEC66E  /

CODE_BEC66F:
	LDA #$2000				;$BEC66F  \
	TSB $08C2				;$BEC672   |
	BEQ CODE_BEC678				;$BEC675   |
	RTL					;$BEC677  /

CODE_BEC678:
	DEC $08BE				;$BEC678  \
	LDA #$0078				;$BEC67B   |
	STA $0973				;$BEC67E   |
	SEP #$20				;$BEC681   |
	INC $0972				;$BEC683   |
	REP #$20				;$BEC686   |
	RTL					;$BEC688  /

CODE_BEC689:
	LDA #$0078				;$BEC689  \
	CMP $096F				;$BEC68C   |
	BCC CODE_BEC694				;$BEC68F   |
	STA $096F				;$BEC691   |
CODE_BEC694:					;	   |
	RTL					;$BEC694  /

CODE_BEC695:
	LDA #$6484				;$BEC695  \
	JSL CODE_BB8A65				;$BEC698   |
	DEC $0B74,x				;$BEC69C   |
	AND #$0E00				;$BEC69F   |
	ORA #$3000				;$BEC6A2   |
	STA $60					;$BEC6A5   |
	LDA $0D2C				;$BEC6A7   |
	AND #$0E00				;$BEC6AA   |
	ORA #$3000				;$BEC6AD   |
	STA $5E					;$BEC6B0   |
	JSR CODE_BEC719				;$BEC6B2   |
	JSR CODE_BEC84B				;$BEC6B5   |
	JSR CODE_BEC6D6				;$BEC6B8   |
	LDA global_frame_counter		;$BEC6BB   |
	AND #$0010				;$BEC6BD   |
	BNE CODE_BEC6CC				;$BEC6C0   |
	JSR CODE_BEC702				;$BEC6C2   |
	JSR CODE_BEC8F8				;$BEC6C5   |
	JSR CODE_BEC93A				;$BEC6C8   |
	RTL					;$BEC6CB  /

CODE_BEC6CC:
	JSR CODE_BEC93A				;$BEC6CC  \
	JSR CODE_BEC702				;$BEC6CF   |
	JSR CODE_BEC8F8				;$BEC6D2   |
	RTL					;$BEC6D5  /

CODE_BEC6D6:
	LDA $0D5C				;$BEC6D6  \
	BEQ CODE_BEC718				;$BEC6D9   |
	BMI CODE_BEC718				;$BEC6DB   |
	AND #$FF00				;$BEC6DD   |
	BEQ CODE_BEC718				;$BEC6E0   |
	LDX #$3000				;$BEC6E2   |
	STX $32					;$BEC6E5   |
	XBA					;$BEC6E7   |
	CMP #$000A				;$BEC6E8   |
	BCC CODE_BEC6FC				;$BEC6EB   |
	LDA #$0001				;$BEC6ED   |
	LDX #$0078				;$BEC6F0   |
	JSR CODE_BEC81F				;$BEC6F3   |
	LDA #$0000				;$BEC6F6   |
	JMP CODE_BEC81F				;$BEC6F9  /

CODE_BEC6FC:
	LDX #$007D				;$BEC6FC  \
	JMP CODE_BEC81F				;$BEC6FF  /

CODE_BEC702:
	LDY $097F				;$BEC702  \
	BEQ CODE_BEC718				;$BEC705   |
	JSR CODE_BEC70F				;$BEC707   |
	LDX $097F				;$BEC70A   |
	LDY $4A,x				;$BEC70D   |
CODE_BEC70F:					;	   |
	LDX $06,y				;$BEC70F   |
	LDA $000A,y				;$BEC711   |
	JSL CODE_B59CAE				;$BEC714   |
CODE_BEC718:					;	   |
	RTS					;$BEC718  / return

CODE_BEC719:
	LDA $0973				;$BEC719  \ get the life display timer
	BEQ CODE_BEC718				;$BEC71C   | if the timer is 0 return
	DEC A					;$BEC71E   | otherwise decrement timer by 1
	BNE CODE_BEC735				;$BEC71F   | if the timer isnt 0 now
	LDA $0979				;$BEC721   | load the y position of the life counter
	SEC					;$BEC724   |
	SBC #$0030				;$BEC725   | subtract #$30 from y position
	BCS CODE_BEC730				;$BEC728   | if the y position is >= 0
	LDA #$0000				;$BEC72A   | otherwise set the display timer to 0
	STA $0973				;$BEC72D   |
CODE_BEC730:					;	   |
	STA $0979				;$BEC730   | update the y position
	BRA CODE_BEC748				;$BEC733  /

CODE_BEC735:
	LDA $0979				;$BEC735  \ load the y position of the life counter
	CMP #$0200				;$BEC738   | final life counter y position
	BCS CODE_BEC745				;$BEC73B   | if the counter is > the final position
	ADC #$0030				;$BEC73D   | add #$30 to y position
	STA $0979				;$BEC740   | update the y position of the life counter
	BRA CODE_BEC748				;$BEC743  / since the life counter isnt in its final position dont decrement the timer

CODE_BEC745:
	DEC $0973				;$BEC745  \ decrement the timer
CODE_BEC748:					;	   |
	LDA #$20A8				;$BEC748   | load sprite image to display (/4 to get actual image number)
	STA $0975				;$BEC74B   |
	LDX #$1D40				;$BEC74E   |
	LDA $0979				;$BEC751   |
	CLC					;$BEC754   |
	ADC #$1000				;$BEC755   |
	TAY					;$BEC758   |
	LDA $60					;$BEC759   |
	JSR CODE_BEC7FB				;$BEC75B   |
	LDA global_frame_counter		;$BEC75E   |
	AND #$000F				;$BEC760   |
	BNE CODE_BEC7B9				;$BEC763   |
	LDA $0971				;$BEC765   |
	AND #$00FF				;$BEC768   |
	STA $32					;$BEC76B   |
	LDA $0972				;$BEC76D   |
	AND #$00FF				;$BEC770   |
	STA $34					;$BEC773   |
	SEC					;$BEC775   |
	SBC $32					;$BEC776   |
	CLC					;$BEC778   |
	ADC $08BE				;$BEC779   |
	CMP $08C0				;$BEC77C   |
	BCC CODE_BEC783				;$BEC77F   |
	BNE CODE_BEC7A9				;$BEC781   |
CODE_BEC783:					;	   |
	LDA $34					;$BEC783   |
	BEQ CODE_BEC7B9				;$BEC785   |
	JSR CODE_BEC7B9				;$BEC787   |
	LDA $0973				;$BEC78A   |
	CMP #$005A				;$BEC78D   |
	BCS CODE_BEC7A8				;$BEC790   |
	DEC $0972				;$BEC792   |
	DEC $08C0				;$BEC795   |
	LDA #$052B				;$BEC798   |
	JSL queue_sound_effect			;$BEC79B   |
	STZ $0979				;$BEC79F   |
	LDA #$005A				;$BEC7A2   |
	STA $0973				;$BEC7A5   |
CODE_BEC7A8:					;	   |
	RTS					;$BEC7A8  /

CODE_BEC7A9:
	INC $08C0				;$BEC7A9  \
	LDA #$003C				;$BEC7AC   |
	STA $0973				;$BEC7AF   |
	LDA #$0538				;$BEC7B2   |
	JSL queue_sound_effect			;$BEC7B5   |
CODE_BEC7B9:					;	   |
	LDA $08C0				;$BEC7B9   |
	BMI CODE_BEC7A8				;$BEC7BC   |
	CMP #$0063				;$BEC7BE   |
	BCC CODE_BEC7C6				;$BEC7C1   |
	LDA #$0063				;$BEC7C3   |
CODE_BEC7C6:					;	   |
	STA CPU.dividen				;$BEC7C6   |
	SEP #$20				;$BEC7C9   |
	LDA #$0A				;$BEC7CB   |
	STA CPU.divisor				;$BEC7CD   |
	REP #$20				;$BEC7D0   |
	LDA $0979				;$BEC7D2   |
	ASL A					;$BEC7D5   |
	ASL A					;$BEC7D6   |
	ASL A					;$BEC7D7   |
	ASL A					;$BEC7D8   |
	ADC #$F000				;$BEC7D9   |
	AND #$FF00				;$BEC7DC   |
	STA $32					;$BEC7DF   |
	LDA CPU.divide_result			;$BEC7E1   |
	BEQ CODE_BEC7F2				;$BEC7E4   |
	LDX #$00DF				;$BEC7E6   |
	JSR CODE_BEC81F				;$BEC7E9   |
	LDA CPU.divide_remainder		;$BEC7EC   |
	JMP CODE_BEC81F				;$BEC7EF  /

CODE_BEC7F2:
	LDA CPU.divide_remainder		;$BEC7F2  \
	LDX #$00E4				;$BEC7F5   |
	JMP CODE_BEC81F				;$BEC7F8  /

CODE_BEC7FB:
	ORA #$01C0				;$BEC7FB  \
	STA $0D96				;$BEC7FE   |
	LDA $0977				;$BEC801   |
	STA $0D9A				;$BEC804   |
	LDA $0975				;$BEC807   |
	STA $0D9E				;$BEC80A   |
	STZ $0DA0				;$BEC80D   |
	TYA					;$BEC810   |
	LDY #aux_sprite_table			;$BEC811   |
	JSL CODE_B59CAE				;$BEC814   |
	LDA $0D9C				;$BEC818   |
	STA $0977				;$BEC81B   |
	RTS					;$BEC81E  /

CODE_BEC81F:
	LDY $70					;$BEC81F  \
	CLC					;$BEC821   |
	ADC #$01CC				;$BEC822   |
	ORA $5E					;$BEC825   |
	STA $0002,y				;$BEC827   |
	ADC #$000A				;$BEC82A   |
	STA $0006,y				;$BEC82D   |
	TXA					;$BEC830   |
	ORA $32					;$BEC831   |
	STA $0000,y				;$BEC833   |
	CLC					;$BEC836   |
	ADC #$0800				;$BEC837   |
	STA $0004,y				;$BEC83A   |
	TYA					;$BEC83D   |
	CLC					;$BEC83E   |
	ADC #$0008				;$BEC83F   |
	STA $70					;$BEC842   |
	TXA					;$BEC844   |
	CLC					;$BEC845   |
	ADC #$0008				;$BEC846   |
	TAX					;$BEC849   |
	RTS					;$BEC84A  /

CODE_BEC84B:
	LDA $096D				;$BEC84B  \ get final banana count
	CMP $096B				;$BEC84E   | check if final banana count = current banana count
	BNE CODE_BEC87B				;$BEC851   | if counts are different
	LDA $096F				;$BEC853   | get the banana display timer
	BNE CODE_BEC8A7				;$BEC856   | if the timer isnt 0 decrement the timer
	RTS					;$BEC858  / return

CODE_BEC859:
	SED					;$BEC859  \ enable decimal because bananas are stored in BCD
	LDA $08BC				;$BEC85A   | get banana count (this one is used for the krem coin cheat)
	CLC					;$BEC85D   | reset the counter to 0
	SBC #$0099				;$BEC85E   |
	STA $08BC				;$BEC861   |
	LDA $096D				;$BEC864   | get final banana count (this one is the target count that the counter counts to)
	CLC					;$BEC867   | reset the counter to 0
	SBC #$0099				;$BEC868   |
	STA $096D				;$BEC86B   |
	CLD					;$BEC86E   | back to regular binary
	STZ $096B				;$BEC86F   | set the current banana counter to 0
	LDA #$0001				;$BEC872   | load number of extra lives to give
	JSL CODE_BEC659				;$BEC875   | give extra lives
	BRA CODE_BEC8A7				;$BEC879  /

CODE_BEC87B:
	BIT $096F				;$BEC87B  \
	BMI CODE_BEC886				;$BEC87E   |
	LDA #$003C				;$BEC880   |
	STA $096F				;$BEC883   |
CODE_BEC886:					;	   |
	BCS CODE_BEC894				;$BEC886   |
	LDA global_frame_counter		;$BEC888   |
	AND #$0003				;$BEC88A   |
	BNE CODE_BEC8A7				;$BEC88D   |
	LDA #$9999				;$BEC88F   |
	BRA CODE_BEC89F				;$BEC892  /

CODE_BEC894:
	LDA $096B				;$BEC894  \ get current banana count
	CMP #$0099				;$BEC897   | check if banana count is > 99
	BCS CODE_BEC859				;$BEC89A   | if so reset the counter and give a life
	LDA #$0001				;$BEC89C   | otherwise load number of bananas to give
CODE_BEC89F:					;	   |
	SED					;$BEC89F   | enable decimal because bananas are stored in BCD
	ADC $096B				;$BEC8A0   | add bananas to count
	STA $096B				;$BEC8A3   |
	CLD					;$BEC8A6   | back to regular binary
CODE_BEC8A7:					;	   |
	DEC $096F				;$BEC8A7   | decrement banana display timer
	LDY $70					;$BEC8AA   |
	LDA #$0808				;$BEC8AC   |
	STA $0000,y				;$BEC8AF   |
	LDA global_frame_counter		;$BEC8B2   |
	AND #$001C				;$BEC8B4   |
	LSR A					;$BEC8B7   |
	ADC $0D2C				;$BEC8B8   |
	ORA #$3000				;$BEC8BB   |
	STA $0002,y				;$BEC8BE   |
	JSR CODE_BEC96A				;$BEC8C1   |
	INY					;$BEC8C4   |
	INY					;$BEC8C5   |
	INY					;$BEC8C6   |
	INY					;$BEC8C7   |
	STY $70					;$BEC8C8   |
	LDX #$0018				;$BEC8CA   |
	LDA #$0800				;$BEC8CD   |
	STA $32					;$BEC8D0   |
	LDA $096C				;$BEC8D2   |
	AND #$000F				;$BEC8D5   |
	BEQ CODE_BEC8DD				;$BEC8D8   |
	JSR CODE_BEC81F				;$BEC8DA   |
CODE_BEC8DD:					;	   |
	LDA $096B				;$BEC8DD   |
	AND #$0FF0				;$BEC8E0   |
	BEQ CODE_BEC8EF				;$BEC8E3   |
	LSR A					;$BEC8E5   |
	LSR A					;$BEC8E6   |
	LSR A					;$BEC8E7   |
	LSR A					;$BEC8E8   |
	AND #$000F				;$BEC8E9   |
	JSR CODE_BEC81F				;$BEC8EC   |
CODE_BEC8EF:					;	   |
	LDA $096B				;$BEC8EF   |
	AND #$000F				;$BEC8F2   |
	JMP CODE_BEC81F				;$BEC8F5  /

CODE_BEC8F8:
	LDX $097B				;$BEC8F8  \
	BEQ CODE_BEC939				;$BEC8FB   |
	LDA $12,x				;$BEC8FD   |
	BMI CODE_BEC939				;$BEC8FF   |
	STA $32					;$BEC901   |
	JSR CODE_BEC90C				;$BEC903   |
	JSR CODE_BEC90C				;$BEC906   |
	JSR CODE_BEC90C				;$BEC909   |
CODE_BEC90C:					;	   |
	LDA $42,x				;$BEC90C   |
	BEQ CODE_BEC933				;$BEC90E   |
	LDY $70					;$BEC910   |
	SEP #$20				;$BEC912   |
	SEC					;$BEC914   |
	SBC #$08				;$BEC915   |
	STA $0000,y				;$BEC917   |
	XBA					;$BEC91A   |
	SEC					;$BEC91B   |
	SBC #$10				;$BEC91C   |
	STA $0001,y				;$BEC91E   |
	REP #$20				;$BEC921   |
	LDA $32					;$BEC923   |
	STA $0002,y				;$BEC925   |
	PHX					;$BEC928   |
	JSR CODE_BEC96A				;$BEC929   |
	PLX					;$BEC92C   |
	INY					;$BEC92D   |
	INY					;$BEC92E   |
	INY					;$BEC92F   |
	INY					;$BEC930   |
	STY $70					;$BEC931   |
CODE_BEC933:					;	   |
	INC $32					;$BEC933   |
	INC $32					;$BEC935   |
	INX					;$BEC937   |
	INX					;$BEC938   |
CODE_BEC939:					;	   |
	RTS					;$BEC939  /

CODE_BEC93A:
	LDY $097D				;$BEC93A  \
	BNE CODE_BEC940				;$BEC93D   |
	RTS					;$BEC93F  /

CODE_BEC940:
	LDA $0044,y				;$BEC940  \
	AND #$00FF				;$BEC943   |
	TAX					;$BEC946   |
	EOR $0044,y				;$BEC947   |
	STA $32					;$BEC94A   |
	LDA $0046,y				;$BEC94C   |
	CMP #$0100				;$BEC94F   |
	BCC CODE_BEC963				;$BEC952   |
	PHA					;$BEC954   |
	XBA					;$BEC955   |
	AND #$00FF				;$BEC956   |
	JSR CODE_BEC81F				;$BEC959   |
	PLA					;$BEC95C   |
	AND #$00FF				;$BEC95D   |
	JMP CODE_BEC81F				;$BEC960  /

CODE_BEC963:
	INX					;$BEC963  \
	INX					;$BEC964   |
	INX					;$BEC965   |
	INX					;$BEC966   |
	JMP CODE_BEC81F				;$BEC967  /

CODE_BEC96A:
	PHY					;$BEC96A  \
	TYA					;$BEC96B   |
	AND #$000C				;$BEC96C   |
	TAX					;$BEC96F   |
	TYA					;$BEC970   |
	LSR A					;$BEC971   |
	LSR A					;$BEC972   |
	LSR A					;$BEC973   |
	LSR A					;$BEC974   |
	AND #$001F				;$BEC975   |
	TAY					;$BEC978   |
	LDA.l DATA_BEC985,x			;$BEC979   |
	ORA oam_attribute.size,y		;$BEC97D   |
	STA oam_attribute.size,y		;$BEC980   |
	PLY					;$BEC983   |
	RTS					;$BEC984  /

DATA_BEC985:
	db $02, $00, $00, $00, $08, $00, $00, $00
	db $20, $00, $00, $00, $80, $00, $00, $00

CODE_BEC995:
	PHY					;$BEC995  \
	TYA					;$BEC996   |
	AND #$000C				;$BEC997   |
	TAX					;$BEC99A   |
	TYA					;$BEC99B   |
	LSR A					;$BEC99C   |
	LSR A					;$BEC99D   |
	LSR A					;$BEC99E   |
	LSR A					;$BEC99F   |
	AND #$001F				;$BEC9A0   |
	TAY					;$BEC9A3   |
	LDA.l DATA_BEC9B0,x			;$BEC9A4   |
	ORA oam_attribute.size,y		;$BEC9A8   |
	STA oam_attribute.size,y		;$BEC9AB   |
	PLY					;$BEC9AE   |
	RTS					;$BEC9AF  /

DATA_BEC9B0:
	db $01, $00, $00, $00, $04, $00, $00, $00
	db $10, $00, $00, $00, $40, $00, $00, $00

CODE_BEC9C0:
	LDA $0915				;$BEC9C0  \
	BEQ CODE_BEC9CD				;$BEC9C3   |
	LDA $0529				;$BEC9C5   |
	CMP #$0019				;$BEC9C8   |
	BEQ CODE_BEC9D0				;$BEC9CB   |
CODE_BEC9CD:					;	   |
	JSR CODE_BEC9D4				;$BEC9CD   |
CODE_BEC9D0:					;	   |
	JSR CODE_BECB48				;$BEC9D0   |
	RTL					;$BEC9D3  /

CODE_BEC9D4:
	PHK					;$BEC9D4  \
	PLB					;$BEC9D5   |
	JSR CODE_BECAB7				;$BEC9D6   |
	LDX #$0000				;$BEC9D9   |
CODE_BEC9DC:					;	   |
	JSR CODE_BEC9E7				;$BEC9DC   |
	INX					;$BEC9DF   |
	INX					;$BEC9E0   |
	CPX #$0010				;$BEC9E1   |
	BCC CODE_BEC9DC				;$BEC9E4   |
	RTS					;$BEC9E6  /

CODE_BEC9E7:
	LDA.l $7F9600,x				;$BEC9E7  \
	BEQ CODE_BECA15				;$BEC9EB   |
	LDA.l $7F9620,x				;$BEC9ED   |
	SEC					;$BEC9F1   |
	SBC $7F9640,x				;$BEC9F2   |
	STA $7F9620,x				;$BEC9F6   |
	LSR A					;$BEC9FA   |
	LSR A					;$BEC9FB   |
	CMP $0D4E				;$BEC9FC   |
	BCC CODE_BECA0E				;$BEC9FF   |
	SEC					;$BECA01   |
	SBC $17C0				;$BECA02   |
	CLC					;$BECA05   |
	ADC #$0010				;$BECA06   |
	CMP #$0100				;$BECA09   |
	BCC CODE_BECA16				;$BECA0C   |
CODE_BECA0E:					;	   |
	LDA #$0000				;$BECA0E   |
	STA $7F9600,x				;$BECA11   |
CODE_BECA15:					;	   |
	RTS					;$BECA15  /

CODE_BECA16:
	TAY					;$BECA16  \
	LDA.l $7F9610,x				;$BECA17   |
	LSR A					;$BECA1B   |
	LSR A					;$BECA1C   |
	SEC					;$BECA1D   |
	SBC $17BA				;$BECA1E   |
	BCS CODE_BECA28				;$BECA21   |
	ADC #$0020				;$BECA23   |
	BCC CODE_BECA0E				;$BECA26   |
CODE_BECA28:					;	   |
	SBC #$0120				;$BECA28   |
	BCS CODE_BECA0E				;$BECA2B   |
	LDA.l $7F9630,x				;$BECA2D   |
	BPL CODE_BECA5D				;$BECA31   |
	JSR CODE_BECAAA				;$BECA33   |
	BEQ CODE_BECA59				;$BECA36   |
	PHA					;$BECA38   |
	CLC					;$BECA39   |
	ADC $7F9610,x				;$BECA3A   |
	STA $7F9610,x				;$BECA3E   |
	PLA					;$BECA42   |
	BPL CODE_BECA4F				;$BECA43   |
	LDA.l $7F9630,x				;$BECA45   |
	INC A					;$BECA49   |
	STA $7F9630,x				;$BECA4A   |
	RTS					;$BECA4E  /

CODE_BECA4F:
	LDA.l $7F9630,x				;$BECA4F  \
	DEC A					;$BECA53   |
	STA $7F9630,x				;$BECA54   |
	RTS					;$BECA58  /

CODE_BECA59:
	STA $7F9630,x				;$BECA59  \
CODE_BECA5D:					;	   |
	LDA.l $7F9630,x				;$BECA5D   |
	BNE CODE_BECA71				;$BECA61   |
	TYA					;$BECA63   |
	AND #$0007				;$BECA64   |
	BNE CODE_BECA9E				;$BECA67   |
	LDA #$0100				;$BECA69   |
	STA $7F9630,x				;$BECA6C   |
	RTS					;$BECA70  /

CODE_BECA71:
	SEP #$30				;$BECA71  \
	DEC A					;$BECA73   |
	BPL CODE_BECA87				;$BECA74   |
	XBA					;$BECA76   |
	INC A					;$BECA77   |
	INC A					;$BECA78   |
	TAY					;$BECA79   |
	LDA DATA_BECAA0,y			;$BECA7A   |
	BNE CODE_BECA80				;$BECA7D   |
	TAY					;$BECA7F   |
CODE_BECA80:					;	   |
	XBA					;$BECA80   |
	TYA					;$BECA81   |
	STA $7F9631,x				;$BECA82   |
	XBA					;$BECA86   |
CODE_BECA87:					;	   |
	STA $7F9630,x				;$BECA87   |
	XBA					;$BECA8B   |
	TAY					;$BECA8C   |
	LDA DATA_BECA9F,y			;$BECA8D   |
	REP #$30				;$BECA90   |
	JSR CODE_BECAAA				;$BECA92   |
	CLC					;$BECA95   |
	ADC $7F9610,x				;$BECA96   |
	STA $7F9610,x				;$BECA9A   |
CODE_BECA9E:					;	   |
	RTS					;$BECA9E  /

DATA_BECA9F:
	db $00

DATA_BECAA0:
	db $00, $00, $02, $08, $FE, $10, $02, $08
	db $00, $00


CODE_BECAAA:
	BIT #$0080				;$BECAAA  \
	BEQ CODE_BECAB3				;$BECAAD   |
	ORA #$FF00				;$BECAAF   |
	RTS					;$BECAB2  /

CODE_BECAB3:
	AND #$00FF				;$BECAB3  \
	RTS					;$BECAB6  /

CODE_BECAB7:
	LDA global_frame_counter		;$BECAB7  \
	AND #$0003				;$BECAB9   |
	BNE CODE_BECB1E				;$BECABC   |
	LDX #$0000				;$BECABE   |
	LDA $0D4E				;$BECAC1   |
	SEC					;$BECAC4   |
	SBC $17C0				;$BECAC5   |
	BCC CODE_BECAD8				;$BECAC8   |
	CMP #$0100				;$BECACA   |
	BCS CODE_BECB1E				;$BECACD   |
	ASL A					;$BECACF   |
	ASL A					;$BECAD0   |
	ASL A					;$BECAD1   |
	XBA					;$BECAD2   |
	AND #$0007				;$BECAD3   |
	ASL A					;$BECAD6   |
	TAX					;$BECAD7   |
CODE_BECAD8:					;	   |
	JSR CODE_BECB3A				;$BECAD8   |
	BNE CODE_BECB1E				;$BECADB   |
	JSL CODE_808E4F				;$BECADD   |
	TAY					;$BECAE1   |
	AND #$01FF				;$BECAE2   |
	STA $32					;$BECAE5   |
	ASL A					;$BECAE7   |
	ADC $32					;$BECAE8   |
	LSR A					;$BECAEA   |
	LSR A					;$BECAEB   |
	SEC					;$BECAEC   |
	SBC #$0020				;$BECAED   |
	CLC					;$BECAF0   |
	ADC $17BA				;$BECAF1   |
	ASL A					;$BECAF4   |
	ASL A					;$BECAF5   |
	STA $7F9610,x				;$BECAF6   |
	LDA #$00F0				;$BECAFA   |
	CLC					;$BECAFD   |
	ADC $17C0				;$BECAFE   |
	ASL A					;$BECB01   |
	ASL A					;$BECB02   |
	STA $7F9620,x				;$BECB03   |
	TYA					;$BECB07   |
	XBA					;$BECB08   |
	AND #$0007				;$BECB09   |
	CMP #$0006				;$BECB0C   |
	BCC CODE_BECB18				;$BECB0F   |
	LDA global_frame_counter		;$BECB11   |
	AND #$000C				;$BECB13   |
	LSR A					;$BECB16   |
	LSR A					;$BECB17   |
CODE_BECB18:					;	   |
	LDY #$0000				;$BECB18   |
	JSR CODE_BECB1F				;$BECB1B   |
CODE_BECB1E:					;	   |
	RTS					;$BECB1E  /

CODE_BECB1F:
	PHA					;$BECB1F  \
	CLC					;$BECB20   |
	ADC $0921				;$BECB21   |
	ORA #$3000				;$BECB24   |
	STA $7F9600,x				;$BECB27   |
	PLA					;$BECB2B   |
	CLC					;$BECB2C   |
	ADC #$0006				;$BECB2D   |
	STA $7F9640,x				;$BECB30   |
	TYA					;$BECB34   |
	STA $7F9630,x				;$BECB35   |
	RTS					;$BECB39  /

CODE_BECB3A:
	LDA.l $7F9600,x				;$BECB3A  \
	BEQ CODE_BECB47				;$BECB3E   |
	INX					;$BECB40   |
	INX					;$BECB41   |
	CPX #$000E				;$BECB42   |
	BCC CODE_BECB3A				;$BECB45   |
CODE_BECB47:					;	   |
	RTS					;$BECB47  /

CODE_BECB48:
	PHK					;$BECB48  \
	PLB					;$BECB49   |
	LDX #$0000				;$BECB4A   |
	LDY $70					;$BECB4D   |
	CPY #$0400				;$BECB4F   |
	BCS CODE_BECB92				;$BECB52   |
CODE_BECB54:					;	   |
	LDA.l $7F9600,x				;$BECB54   |
	BEQ CODE_BECB86				;$BECB58   |
	LDA.l $7F9620,x				;$BECB5A   |
	LSR A					;$BECB5E   |
	LSR A					;$BECB5F   |
	SEC					;$BECB60   |
	SBC $17C0				;$BECB61   |
	STA $0001,y				;$BECB64   |
	LDA.l $7F9600,x				;$BECB67   |
	STA $0002,y				;$BECB6B   |
	LDA.l $7F9610,x				;$BECB6E   |
	LSR A					;$BECB72   |
	LSR A					;$BECB73   |
	SEC					;$BECB74   |
	SBC $17BA				;$BECB75   |
	SEP #$20				;$BECB78   |
	STA $0000,y				;$BECB7A   |
	XBA					;$BECB7D   |
	REP #$20				;$BECB7E   |
	BNE CODE_BECB95				;$BECB80   |
	INY					;$BECB82   |
	INY					;$BECB83   |
	INY					;$BECB84   |
	INY					;$BECB85   |
CODE_BECB86:					;	   |
	CPY #$0400				;$BECB86   |
	BCS CODE_BECB92				;$BECB89   |
	INX					;$BECB8B   |
	INX					;$BECB8C   |
	CPX #$0010				;$BECB8D   |
	BCC CODE_BECB54				;$BECB90   |
CODE_BECB92:					;	   |
	STY $70					;$BECB92   |
	RTS					;$BECB94  /

CODE_BECB95:
	PHX					;$BECB95  \
	JSR CODE_BEC995				;$BECB96   |
	PLX					;$BECB99   |
	INY					;$BECB9A   |
	INY					;$BECB9B   |
	INY					;$BECB9C   |
	INY					;$BECB9D   |
	BRA CODE_BECB86				;$BECB9E  /

CODE_BECBA0:
	LDA $0A36				;$BECBA0  \
	BIT #$0004				;$BECBA3   |
	BEQ CODE_BECBB5				;$BECBA6   |
	LDY current_sprite			;$BECBA8   |
	LDA $002E,y				;$BECBAA   |
	CMP #$0402				;$BECBAD   |
	BEQ CODE_BECBB5				;$BECBB0   |
	JML [$05A9]				;$BECBB2  /

CODE_BECBB5:
	JSR CODE_BEB82A				;$BECBB5  /

DATA_BECBB8:
	dw CODE_BECBBE
	dw CODE_BECCCB
	dw CODE_BECCF9

CODE_BECBBE:
	TAX					;$BECBBE  \
	JMP (DATA_BECBC2,x)			;$BECBBF  /

DATA_BECBC2:
	dw CODE_BECBD1
	dw CODE_BECBE2
	dw CODE_BECC54
	dw CODE_BECC6D
	dw CODE_BECC84
	dw CODE_BECCB1

CODE_BECBCE:
	JMP CODE_BEB849				;$BECBCE  \
CODE_BECBD1:					;	   |
	TYX					;$BECBD1   |
	LDY $44,x				;$BECBD2   |
	JSL CODE_BB8432				;$BECBD4   |
	BCS CODE_BECBCE				;$BECBD8   |
	LDX current_sprite			;$BECBDA   |
	LDA alternate_sprite			;$BECBDC   |
	STA $42,x				;$BECBDE   |
	INC $2F,x				;$BECBE0   |
CODE_BECBE2:					;	   |
	JSL CODE_BCFB58				;$BECBE2   |
	LDA #$1000				;$BECBE6   |
	LDY #$0010				;$BECBE9   |
	JSR CODE_BEBD92				;$BECBEC   |
	BCC CODE_BECC52				;$BECBEF   |
	INC $2F,x				;$BECBF1   |
	LDA $6A					;$BECBF3   |
	STA $44,x				;$BECBF5   |
	INC $46,x				;$BECBF7   |
	LDA $42,x				;$BECBF9   |
	TAX					;$BECBFB   |
	INC $46,x				;$BECBFC   |
	LDA #$076E				;$BECBFE   |
	JSL queue_sound_effect			;$BECC01   |
	LDY $0D5A				;$BECC05   |
	BEQ CODE_BECC1C				;$BECC08   |
	LDX current_sprite			;$BECC0A   |
	LDA $06,x				;$BECC0C   |
	CMP $0006,y				;$BECC0E   |
	BCC CODE_BECC1C				;$BECC11   |
	LDA $0032,y				;$BECC13   |
	ORA #$8000				;$BECC16   |
	STA $0032,y				;$BECC19   |
CODE_BECC1C:					;	   |
	LDY current_sprite			;$BECC1C   |
	LDX $6A					;$BECC1E   |
	LDA $06,x				;$BECC20   |
	CLC					;$BECC22   |
	ADC $D9					;$BECC23   |
	SEC					;$BECC25   |
	SBC $E5					;$BECC26   |
	STA $06,x				;$BECC28   |
	BIT $24,x				;$BECC2A   |
	BPL CODE_BECC30				;$BECC2C   |
	STZ $24,x				;$BECC2E   |
CODE_BECC30:					;	   |
	LDA $20,x				;$BECC30   |
	BMI CODE_BECC39				;$BECC32   |
	CMP #$0120				;$BECC34   |
	BCC CODE_BECC3C				;$BECC37   |
CODE_BECC39:					;	   |
	LDA #$0120				;$BECC39   |
CODE_BECC3C:					;	   |
	SEC					;$BECC3C   |
	SBC $22,x				;$BECC3D   |
	STA $2C,x				;$BECC3F   |
	LDA $22,x				;$BECC41   |
	STA $26,x				;$BECC43   |
	STA $2A,x				;$BECC45   |
	STZ $20,x				;$BECC47   |
	LDA $000A,y				;$BECC49   |
	CLC					;$BECC4C   |
	ADC #$0010				;$BECC4D   |
	STA $1C,x				;$BECC50   |
CODE_BECC52:					;	   |
	BRA CODE_BECCB1				;$BECC52  /

CODE_BECC54:
	LDX $44,y				;$BECC54  \
	LDA $06,x				;$BECC56   |
	SEC					;$BECC58   |
	SBC $0006,y				;$BECC59   |
	BCC CODE_BECC9B				;$BECC5C   |
	CMP #$0010				;$BECC5E   |
	BCC CODE_BECC9B				;$BECC61   |
	TYX					;$BECC63   |
	INC $46,x				;$BECC64   |
	LDA $42,x				;$BECC66   |
	TAX					;$BECC68   |
	INC $46,x				;$BECC69   |
	BRA CODE_BECC9B				;$BECC6B  /

CODE_BECC6D:
	LDX current_sprite			;$BECC6D  \
	INC $2F,x				;$BECC6F   |
	LDA $42,x				;$BECC71   |
	TAX					;$BECC73   |
	INC $2F,x				;$BECC74   |
	LDA #$076E				;$BECC76   |
	JSL queue_sound_effect			;$BECC79   |
	LDX current_sprite			;$BECC7D   |
	LDY $44,x				;$BECC7F   |
	JSR CODE_BECCDD				;$BECC81   |
CODE_BECC84:					;	   |
	LDX current_sprite			;$BECC84   |
	LDY $44,x				;$BECC86   |
	LDA $0020,y				;$BECC88   |
	SEC					;$BECC8B   |
	SBC $0026,y				;$BECC8C   |
	BCS CODE_BECC94				;$BECC8F   |
	ADC #$0100				;$BECC91   |
CODE_BECC94:					;	   |
	CMP #$0080				;$BECC94   |
	BCS CODE_BECC9B				;$BECC97   |
	INC $2F,x				;$BECC99   |
CODE_BECC9B:					;	   |
	LDX current_sprite			;$BECC9B   |
	LDY $44,x				;$BECC9D   |
	LDA $003E,y				;$BECC9F   |
	ORA #$2000				;$BECCA2   |
	STA $003E,y				;$BECCA5   |
	LDA $0A,x				;$BECCA8   |
	CLC					;$BECCAA   |
	ADC #$0010				;$BECCAB   |
	STA $001C,y				;$BECCAE   |
CODE_BECCB1:					;	   |
	JSL CODE_BBBB7B				;$BECCB1   |
	BCC CODE_BECCC4				;$BECCB5   |
	LDY current_sprite			;$BECCB7   |
	LDX $42,y				;$BECCB9   |
	STZ $42,x				;$BECCBB   |
	JSL CODE_BBBB44				;$BECCBD   |
	JML [$05A9]				;$BECCC1  /

CODE_BECCC4:
	JSL CODE_B9D100				;$BECCC4  \
	JML [$05A9]				;$BECCC8  /

CODE_BECCCB:
	LDX $42,y				;$BECCCB  \
	BNE CODE_BECCD6				;$BECCCD   |
	JSL CODE_BB82B8				;$BECCCF   |
	JML [$05A9]				;$BECCD3  /

CODE_BECCD6:
	JSL CODE_B9D100				;$BECCD6  \
	JML [$05A9]				;$BECCDA  /

CODE_BECCDD:
	LDA $4C,x				;$BECCDD  \
	STA $002A,y				;$BECCDF   |
	STA $0026,y				;$BECCE2   |
	ASL A					;$BECCE5   |
	STA $0020,y				;$BECCE6   |
	LDA #$0000				;$BECCE9   |
	STA $002C,y				;$BECCEC   |
	LDA $0A,x				;$BECCEF   |
	CLC					;$BECCF1   |
	ADC #$0010				;$BECCF2   |
	STA $001C,y				;$BECCF5   |
	RTS					;$BECCF8  /

CODE_BECCF9:
	TAX					;$BECCF9  \
	JMP (DATA_BECCFD,x)			;$BECCFA  /

DATA_BECCFD:
	dw CODE_BECD09
	dw CODE_BECD1B
	dw CODE_BECD39
	dw CODE_BECD58
	dw CODE_BECDBD
	dw CODE_BECDDF


CODE_BECD09:
	LDA $0042,y				;$BECD09  \
	CMP $0D58				;$BECD0C   |
	BNE CODE_BECD58				;$BECD0F   |
	TYX					;$BECD11   |
	INC $2F,x				;$BECD12   |
	DEC A					;$BECD14   |
	BEQ CODE_BECD1B				;$BECD15   |
	INC $2F,x				;$BECD17   |
	BRA CODE_BECD39				;$BECD19  /

CODE_BECD1B:
	LDA $000A,y				;$BECD1B  \
	SEC					;$BECD1E   |
	SBC #$0004				;$BECD1F   |
	STA $000A,y				;$BECD22   |
	LDA $0044,y				;$BECD25   |
	CLC					;$BECD28   |
	ADC #$0004				;$BECD29   |
	STA $0044,y				;$BECD2C   |
	CMP $0046,y				;$BECD2F   |
	BNE CODE_BECD58				;$BECD32   |
	TYX					;$BECD34   |
	INC $2F,x				;$BECD35   |
	BRA CODE_BECD50				;$BECD37  /

CODE_BECD39:
	LDA $000A,y				;$BECD39  \
	CLC					;$BECD3C   |
	ADC #$0004				;$BECD3D   |
	STA $000A,y				;$BECD40   |
	LDA $0044,y				;$BECD43   |
	SEC					;$BECD46   |
	SBC #$0004				;$BECD47   |
	STA $0044,y				;$BECD4A   |
	BNE CODE_BECD58				;$BECD4D   |
	TYX					;$BECD4F   |
CODE_BECD50:					;	   |
	INC $2F,x				;$BECD50   |
	LDA #$8000				;$BECD52   |
	TSB $0D58				;$BECD55   |
CODE_BECD58:					;	   |
	JSL CODE_BCFB58				;$BECD58   |
	LDA #$1000				;$BECD5C   |
	LDY #$0010				;$BECD5F   |
	JSR CODE_BEBD92				;$BECD62   |
	BCS CODE_BECD7A				;$BECD65   |
	LDA #$0010				;$BECD67   |
	PHK					;$BECD6A   |
	%return(CODE_BECD71)			;$BECD6B   |
	JML [$09F9]				;$BECD6E  /

CODE_BECD71:
	BCS CODE_BECDAD				;$BECD71  \
	JSL CODE_B9D100				;$BECD73   |
	JMP CODE_BEB849				;$BECD77  /

CODE_BECD7A:
	LDA #$041A				;$BECD7A  \
	JSL queue_sound_effect			;$BECD7D   |
	LDX $6A					;$BECD81   |
	LDA #$FE00				;$BECD83   |
	SEC					;$BECD86   |
	SBC $26,x				;$BECD87   |
	STA $2C,x				;$BECD89   |
	STZ $26,x				;$BECD8B   |
	STZ $20,x				;$BECD8D   |
	LDA #$0820				;$BECD8F   |
	STA $4E,x				;$BECD92   |
	LDA $3E,x				;$BECD94   |
	ORA #$8000				;$BECD96   |
	STA $3E,x				;$BECD99   |
	STZ $42,x				;$BECD9B   |
	LDA $06,x				;$BECD9D   |
	STA $38,x				;$BECD9F   |
	LDA #$0021				;$BECDA1   |
	JSL CODE_B8D8BA				;$BECDA4   |
	BCC CODE_BECDB3				;$BECDA8   |
	JMP CODE_BEB849				;$BECDAA  /

CODE_BECDAD:
	JSL CODE_BEC452				;$BECDAD  \
	BCC CODE_BECDBA				;$BECDB1   |
CODE_BECDB3:					;	   |
	LDX current_sprite			;$BECDB3   |
	LDA #$0402				;$BECDB5   |
	STA $2E,x				;$BECDB8   |
CODE_BECDBA:					;	   |
	JMP CODE_BEB849				;$BECDBA  /

CODE_BECDBD:
	LDA $0044,y				;$BECDBD  \
	CMP $0046,y				;$BECDC0   |
	BEQ CODE_BECDDC				;$BECDC3   |
	LDA $000A,y				;$BECDC5   |
	SEC					;$BECDC8   |
	SBC #$0004				;$BECDC9   |
	STA $000A,y				;$BECDCC   |
	LDA $0044,y				;$BECDCF   |
	CLC					;$BECDD2   |
	ADC #$0004				;$BECDD3   |
	STA $0044,y				;$BECDD6   |
	JMP CODE_BEB849				;$BECDD9  /

CODE_BECDDC:
	TYX					;$BECDDC  \
	INC $2F,x				;$BECDDD   |
CODE_BECDDF:					;	   |
	JMP CODE_BEB849				;$BECDDF  /

CODE_BECDE2:
	JSR CODE_BEB82A				;$BECDE2  \
DATA_BECDE5:
	dw CODE_BECDEB
	dw CODE_BECE07
	dw CODE_BECE4C

CODE_BECDEB:
	LDA $004E,y				;$BECDEB  \
	EOR #$8001				;$BECDEE   |
	STA $0D58				;$BECDF1   |
	TYX					;$BECDF4   |
	INC $2E,x				;$BECDF5   |
	LDX $42,y				;$BECDF7   |
	LDA $0044,y				;$BECDF9   |
	JSL CODE_B3A3B4				;$BECDFC   |
	JSL CODE_B9D100				;$BECE00   |
	JML [$05A9]				;$BECE04  /

CODE_BECE07:
	JSL CODE_BCFB58				;$BECE07  \
	LDA #$0000				;$BECE0B   |
	JSL CODE_BEBE6D				;$BECE0E   |
	BCS CODE_BECE1B				;$BECE12   |
	JSL CODE_B9D100				;$BECE14   |
	JMP CODE_BEB849				;$BECE18  /

CODE_BECE1B:
	INC $2E,x				;$BECE1B  \
	LDA #$0001				;$BECE1D   |
	STA $42,x				;$BECE20   |
	LDA $4E,x				;$BECE22   |
	STA $0D58				;$BECE24   |
	LDA $00,x				;$BECE27   |
	PHA					;$BECE29   |
	JSL CODE_BB82B8				;$BECE2A   |
	LDX current_sprite			;$BECE2E   |
	STZ $1A,x				;$BECE30   |
	STZ $18,x				;$BECE32   |
	STZ $16,x				;$BECE34   |
	PLA					;$BECE36   |
	STA $00,x				;$BECE37   |
	JSR CODE_BECE7E				;$BECE39   |
	LDX current_sprite			;$BECE3C   |
	LDA #$0461				;$BECE3E   |
	LDY $4E,x				;$BECE41   |
	BNE CODE_BECE48				;$BECE43   |
	LDA #$0462				;$BECE45   |
CODE_BECE48:					;	   |
	JSL queue_sound_effect			;$BECE48   |
CODE_BECE4C:					;	   |
	LDX current_sprite			;$BECE4C   |
	DEC $42,x				;$BECE4E   |
	LDA $42,x				;$BECE50   |
	BIT #$0003				;$BECE52   |
	BNE CODE_BECE7B				;$BECE55   |
	TXY					;$BECE57   |
	BIT $0D58				;$BECE58   |
	BPL CODE_BECE61				;$BECE5B   |
	STZ $00,x				;$BECE5D   |
	BRA CODE_BECE72				;$BECE5F  /

CODE_BECE61:
	AND #$0004				;$BECE61  \
	BNE CODE_BECE72				;$BECE64   |
	LDX $4A,y				;$BECE66   |
	LDA $004C,y				;$BECE68   |
	JSL CODE_B3A3B4				;$BECE6B   |
	JML [$05A9]				;$BECE6F  /

CODE_BECE72:
	LDX $46,y				;$BECE72  \
	LDA $0048,y				;$BECE74   |
	JSL CODE_B3A3B4				;$BECE77   |
CODE_BECE7B:					;	   |
	JML [$05A9]				;$BECE7B  /

CODE_BECE7E:
	LDY #$0068				;$BECE7E  \
	JSL CODE_BB8412				;$BECE81   |
	LDY #$006A				;$BECE85   |
	JSL CODE_BB8412				;$BECE88   |
	RTS					;$BECE8C  /

CODE_BECE8D:
	JSR CODE_BEB82A				;$BECE8D  /

DATA_BECE90:
	dw CODE_BECE94
	dw CODE_BECECD

CODE_BECE94:
	LDA $0046,y				;$BECE94  \
	BEQ CODE_BECEAB				;$BECE97   |
	LDX $42,y				;$BECE99   |
	LDA $36,x				;$BECE9B   |
	CMP $40,x				;$BECE9D   |
	BNE CODE_BECECD				;$BECE9F   |
	LDA $0E,x				;$BECEA1   |
	BNE CODE_BECECD				;$BECEA3   |
	LDA #$0000				;$BECEA5   |
	STA $0046,y				;$BECEA8   |
CODE_BECEAB:					;	   |
	JSR CODE_BEE010				;$BECEAB   |
	BCS CODE_BECECD				;$BECEAE   |
	LDX alternate_sprite			;$BECEB0   |
	LDY current_sprite			;$BECEB2   |
	LDA $002E,y				;$BECEB4   |
	INC A					;$BECEB7   |
	STA $002E,y				;$BECEB8   |
	STA $2E,x				;$BECEBB   |
	LDA $0042,y				;$BECEBD   |
	STA $42,x				;$BECEC0   |
	TAY					;$BECEC2   |
	STX $48,y				;$BECEC3   |
	LDA #$0013				;$BECEC5   |
	STA $44,x				;$BECEC8   |
	JSR CODE_BECEE5				;$BECECA   |
CODE_BECECD:					;	   |
	JSL CODE_B9D100				;$BECECD   |
	LDA $00,x				;$BECED1   |
	BEQ CODE_BECEDF				;$BECED3   |
	LDA $42,x				;$BECED5   |
	BNE CODE_BECEE2				;$BECED7   |
	JSL CODE_BBBB8D				;$BECED9   |
	BCC CODE_BECEE2				;$BECEDD   |
CODE_BECEDF:					;	   |
	INC $19AD				;$BECEDF   |
CODE_BECEE2:					;	   |
	JML [$05A9]				;$BECEE2  /

CODE_BECEE5:
	PHK					;$BECEE5  \
	PLB					;$BECEE6   |
	LDY $42,x				;$BECEE7   |
	LDA $0E,x				;$BECEE9   |
	BNE CODE_BECF19				;$BECEEB   |
	LDA $0036,y				;$BECEED   |
	AND #$00FF				;$BECEF0   |
	CLC					;$BECEF3   |
	ADC $44,x				;$BECEF4   |
	TAY					;$BECEF6   |
	LDA DATA_BECF27,y			;$BECEF7   |
	JSR CODE_BECF1A				;$BECEFA   |
	STA $32					;$BECEFD   |
	LDA DATA_BECF4D,y			;$BECEFF   |
	JSR CODE_BECF1A				;$BECF02   |
	STA $34					;$BECF05   |
	LDY $42,x				;$BECF07   |
	LDA $0006,y				;$BECF09   |
	CLC					;$BECF0C   |
	ADC $32					;$BECF0D   |
	STA $06,x				;$BECF0F   |
	LDA $000A,y				;$BECF11   |
	CLC					;$BECF14   |
	ADC $34					;$BECF15   |
	STA $0A,x				;$BECF17   |
CODE_BECF19:					;	   |
	RTS					;$BECF19  /

CODE_BECF1A:
	BIT #$0080				;$BECF1A  \
	BEQ CODE_BECF23				;$BECF1D   |
	ORA #$FF00				;$BECF1F   |
	RTS					;$BECF22  /

CODE_BECF23:
	AND #$00FF				;$BECF23  \
	RTS					;$BECF26  /


DATA_BECF27:
	db $00, $FE, $FC, $FB, $FA, $F9, $F9, $F8
	db $F8, $F6, $F5, $F4, $F3, $F3, $F2, $F4
	db $F5, $F6, $F7, $08, $09, $0A, $09, $09
	db $09, $09, $08, $08, $08, $06, $04, $03
	db $02, $01, $02, $02, $01, $00

DATA_BECF4D:
	db $F9, $F9, $FB, $FE, $FE, $00, $01, $01
	db $02, $03, $04, $07, $08, $0A, $0B, $0C
	db $0D, $0E, $0F, $06, $06, $05, $06, $05
	db $05, $04, $03, $03, $03, $02, $02, $02
	db $02, $02, $02, $01, $01, $01


CODE_BECF73:
	LDA $0A36				;$BECF73  \
	BIT #$0004				;$BECF76   |
	BEQ CODE_BECF94				;$BECF79   |
	LDX current_sprite			;$BECF7B   |
	LDA $3E,x				;$BECF7D   |
	AND #$8000				;$BECF7F   |
	BEQ CODE_BECF91				;$BECF82   |
	LDA $4E,x				;$BECF84   |
	AND #$FF00				;$BECF86   |
	BNE CODE_BECF94				;$BECF89   |
	LDA $06,x				;$BECF8B   |
	CMP $38,x				;$BECF8D   |
	BCC CODE_BECF94				;$BECF8F   |
CODE_BECF91:					;	   |
	JML [$05A9]				;$BECF91  /

CODE_BECF94:
	JSR CODE_BEB82A				;$BECF94  /

DATA_BECF97:
	dw CODE_BECFA3
	dw CODE_BED02E
	dw CODE_BED0F9
	dw CODE_BED1E6
	dw CODE_BED34D
	dw CODE_BED791

CODE_BECFA3:
	TAX					;$BECFA3  \
	JMP (DATA_BECFA7,x)			;$BECFA4  /

DATA_BECFA7:
	dw CODE_BECFB8
	dw CODE_BECFAF
	dw CODE_BECFCD
	dw CODE_BECFE2

CODE_BECFAF:
	LDX current_sprite			;$BECFAF  \
	LDA $08A6				;$BECFB1   |
	CMP $42,x				;$BECFB4   |
	BNE CODE_BECFC6				;$BECFB6   |
CODE_BECFB8:					;	   |
	LDX current_sprite			;$BECFB8   |
	STZ $42,x				;$BECFBA   |
	STZ $44,x				;$BECFBC   |
	LDA $46,x				;$BECFBE   |
	JSR CODE_BED7C7				;$BECFC0   |
	JMP CODE_BED794				;$BECFC3  /

CODE_BECFC6:
	JSL CODE_BB82B8				;$BECFC6  \
	JML [$05A9]				;$BECFCA  /

CODE_BECFCD:
	LDA #$0000				;$BECFCD  \
	STA $0D5C				;$BECFD0   |
	JSR CODE_BECFFD				;$BECFD3   |
	BCS CODE_BECFFA				;$BECFD6   |
	INC $19BA				;$BECFD8   |
	JSL CODE_BBBD6B				;$BECFDB   |
	JML [$05A9]				;$BECFDF  /

CODE_BECFE2:
	LDA $0D5C				;$BECFE2  \
	AND #$007F				;$BECFE5   |
	DEC A					;$BECFE8   |
	JSR CODE_BECFFD				;$BECFE9   |
	BCS CODE_BECFFA				;$BECFEC   |
	LDY alternate_sprite			;$BECFEE   |
	LDA $0D5C				;$BECFF0   |
	AND #$007F				;$BECFF3   |
	DEC A					;$BECFF6   |
	STA $004E,y				;$BECFF7   |
CODE_BECFFA:					;	   |
	JML [$05A9]				;$BECFFA  /

CODE_BECFFD:
	TAX					;$BECFFD  \
	LDA.l DATA_BED024,x			;$BECFFE   |
	AND #$00FF				;$BED002   |
	TAY					;$BED005   |
	JSL CODE_BB842C				;$BED006   |
	BCS CODE_BED023				;$BED00A   |
	LDX current_sprite			;$BED00C   |
	LDY alternate_sprite			;$BED00E   |
	STY $42,x				;$BED010   |
	STZ $44,x				;$BED012   |
	STX $42,y				;$BED014   |
	LDA #$0000				;$BED016   |
	STA $004E,y				;$BED019   |
	LDA $46,x				;$BED01C   |
	JSR CODE_BED7C7				;$BED01E   |
	STZ $30,x				;$BED021   |
CODE_BED023:					;	   |
	RTS					;$BED023  /

DATA_BED024:
	db $EA, $F0, $EE, $EA, $F0, $EC, $EE, $F6
	db $EC, $EA


CODE_BED02E:
	TAX					;$BED02E  \
	JMP (DATA_BED032,x)			;$BED02F  /

DATA_BED032:
	dw CODE_BED03C
	dw CODE_BED042
	dw CODE_BED05C
	dw CODE_BED08C
	dw CODE_BED0CE


CODE_BED03C:
	TYX					;$BED03C  \
	INC $2F,x				;$BED03D   |
	JSR CODE_BEDE09				;$BED03F   |
CODE_BED042:					;	   |
	JSR CODE_BEDB50				;$BED042   |
	JSR CODE_BED956				;$BED045   |
	JSR CODE_BED7F9				;$BED048   |
	BCC CODE_BED059				;$BED04B   |
	BNE CODE_BED059				;$BED04D   |
	LDX current_sprite			;$BED04F   |
	STX $0D5E				;$BED051   |
	INC $2F,x				;$BED054   |
	JSR CODE_BED9FD				;$BED056   |
CODE_BED059:					;	   |
	JMP CODE_BED794				;$BED059  /

CODE_BED05C:
	JSR CODE_BEDB50				;$BED05C  \
	JSR CODE_BED2CA				;$BED05F   |
	JSR CODE_BED914				;$BED062   |
	JSR CODE_BED8DA				;$BED065   |
	BCC CODE_BED071				;$BED068   |
	INC A					;$BED06A   |
	JSR CODE_BED94C				;$BED06B   |
	JMP CODE_BED794				;$BED06E  /

CODE_BED071:
	JSR CODE_BEDCA5				;$BED071  \
	JSR CODE_BEDE09				;$BED074   |
	JSR CODE_BED956				;$BED077   |
	JSR CODE_BED7F9				;$BED07A   |
	JSR CODE_BEE024				;$BED07D   |
	JSR CODE_BED9FD				;$BED080   |
	JSR CODE_BEDBE2				;$BED083   |
	JSR CODE_BEDF8A				;$BED086   |
	JMP CODE_BED794				;$BED089  /

CODE_BED08C:
	JSR CODE_BEDB50				;$BED08C  \
	JSR CODE_BED2CA				;$BED08F   |
	JSR CODE_BED914				;$BED092   |
	JSR CODE_BED8DA				;$BED095   |
	BCC CODE_BED0AB				;$BED098   |
	EOR #$FFFF				;$BED09A   |
	ADC #$0004				;$BED09D   |
	JSR CODE_BED94C				;$BED0A0   |
	CMP #$0004				;$BED0A3   |
	BEQ CODE_BED0D4				;$BED0A6   |
	JMP CODE_BED7A8				;$BED0A8  /

CODE_BED0AB:
	JSR CODE_BEDCA5				;$BED0AB  \
	JSR CODE_BEDE09				;$BED0AE   |
	JSR CODE_BED956				;$BED0B1   |
	JSR CODE_BED7F9				;$BED0B4   |
	BCC CODE_BED0C2				;$BED0B7   |
	BNE CODE_BED0CB				;$BED0B9   |
	LDX current_sprite			;$BED0BB   |
	STX $0D5E				;$BED0BD   |
	DEC $2F,x				;$BED0C0   |
CODE_BED0C2:					;	   |
	JSR CODE_BEE024				;$BED0C2   |
	JSR CODE_BED9FD				;$BED0C5   |
	JSR CODE_BEDF8A				;$BED0C8   |
CODE_BED0CB:					;	   |
	JMP CODE_BED7A8				;$BED0CB  /

CODE_BED0CE:
	JSR CODE_BEDB50				;$BED0CE  \
	JSR CODE_BED2CA				;$BED0D1   |
CODE_BED0D4:					;	   |
	LDA $08C2				;$BED0D4   |
	AND #$0100				;$BED0D7   |
	BNE CODE_BED0F6				;$BED0DA   |
	LDX current_sprite			;$BED0DC   |
	LDY $0593				;$BED0DE   |
	STX $42,y				;$BED0E1   |
	TYA					;$BED0E3   |
	ORA #$8000				;$BED0E4   |
	STA $42,x				;$BED0E7   |
	LDA #$0016				;$BED0E9   |
	JSL CODE_B8D8BA				;$BED0EC   |
	BCS CODE_BED0F6				;$BED0F0   |
	LDX current_sprite			;$BED0F2   |
	DEC $2F,x				;$BED0F4   |
CODE_BED0F6:					;	   |
	JML [$05A9]				;$BED0F6  /

CODE_BED0F9:
	TAX					;$BED0F9  \
	JMP (DATA_BED0FD,x)			;$BED0FA  /

DATA_BED0FD:
	dw CODE_BED109
	dw CODE_BED10F
	dw CODE_BED129
	dw CODE_BED172
	dw CODE_BED1B1
	dw CODE_BED1CE


CODE_BED109:
	TYX					;$BED109  \
	INC $2F,x				;$BED10A   |
	JSR CODE_BEDE09				;$BED10C   |
CODE_BED10F:					;	   |
	JSR CODE_BEDB50				;$BED10F   |
	JSR CODE_BED956				;$BED112   |
	JSR CODE_BED7F9				;$BED115   |
	BCC CODE_BED123				;$BED118   |
	BNE CODE_BED123				;$BED11A   |
	LDX current_sprite			;$BED11C   |
	STX $0D5E				;$BED11E   |
	INC $2F,x				;$BED121   |
CODE_BED123:					;	   |
	JSR CODE_BED9FD				;$BED123   |
	JMP CODE_BED794				;$BED126  /

CODE_BED129:
	BIT $0923				;$BED129  \
	BCS CODE_BED136				;$BED12C   |
	LDA $0006,y				;$BED12E   |
	CMP #$03F0				;$BED131   |
	BCS CODE_BED13F				;$BED134   |
CODE_BED136:					;	   |
	LDA $003E,y				;$BED136   |
	ORA #$0800				;$BED139   |
	STA $003E,y				;$BED13C   |
CODE_BED13F:					;	   |
	JSR CODE_BEDB50				;$BED13F   |
	JSR CODE_BED2CA				;$BED142   |
	JSR CODE_BED914				;$BED145   |
	JSR CODE_BED8DA				;$BED148   |
	BCC CODE_BED154				;$BED14B   |
	INC A					;$BED14D   |
	JSR CODE_BED94C				;$BED14E   |
	JMP CODE_BED794				;$BED151  /

CODE_BED154:
	JSR CODE_BEDC2B				;$BED154  \
	JSR CODE_BEDCA5				;$BED157   |
	JSR CODE_BEDE09				;$BED15A   |
	JSR CODE_BED956				;$BED15D   |
	JSR CODE_BED7F9				;$BED160   |
	JSR CODE_BEE024				;$BED163   |
	JSR CODE_BED9FD				;$BED166   |
	JSR CODE_BEDB9C				;$BED169   |
	JSR CODE_BEDF8A				;$BED16C   |
	JMP CODE_BED794				;$BED16F  /

CODE_BED172:
	JSR CODE_BEDB50				;$BED172  \
	JSR CODE_BED2CA				;$BED175   |
	JSR CODE_BED914				;$BED178   |
	JSR CODE_BED8DA				;$BED17B   |
	BCC CODE_BED189				;$BED17E   |
	LDA #$0004				;$BED180   |
	JSR CODE_BED94C				;$BED183   |
	JMP CODE_BED794				;$BED186  /

CODE_BED189:
	JSR CODE_BEDC64				;$BED189  \
	JSR CODE_BEDE09				;$BED18C   |
	BCC CODE_BED1A2				;$BED18F   |
	DEC $2F,x				;$BED191   |
	LDY $42,x				;$BED193   |
	LDA #$0000				;$BED195   |
	STA $0040,y				;$BED198   |
	LDA #$0664				;$BED19B   |
	JSL queue_sound_effect			;$BED19E   |
CODE_BED1A2:					;	   |
	JSR CODE_BED956				;$BED1A2   |
	JSR CODE_BEE024				;$BED1A5   |
	JSR CODE_BED9FD				;$BED1A8   |
	JSR CODE_BEDF8A				;$BED1AB   |
	JMP CODE_BED794				;$BED1AE  /

CODE_BED1B1:
	JSR CODE_BEDB50				;$BED1B1  \
	JSR CODE_BED956				;$BED1B4   |
	JSR CODE_BED7F9				;$BED1B7   |
	BCC CODE_BED1C8				;$BED1BA   |
	LSR A					;$BED1BC   |
	LDA #$0005				;$BED1BD   |
	BCC CODE_BED1C5				;$BED1C0   |
	LDA #$0003				;$BED1C2   |
CODE_BED1C5:					;	   |
	JSR CODE_BED94C				;$BED1C5   |
CODE_BED1C8:					;	   |
	JSR CODE_BED9FD				;$BED1C8   |
	JMP CODE_BED794				;$BED1CB  /

CODE_BED1CE:
	LDA $0024,y				;$BED1CE  \
	BPL CODE_BED1D8				;$BED1D1   |
	CMP #$FC00				;$BED1D3   |
	BCC CODE_BED1DE				;$BED1D6   |
CODE_BED1D8:					;	   |
	LDA #$FC00				;$BED1D8   |
	STA $0024,y				;$BED1DB   |
CODE_BED1DE:					;	   |
	LDA #$0003				;$BED1DE   |
	JSR CODE_BED94C				;$BED1E1   |
	BRA CODE_BED172				;$BED1E4  /

CODE_BED1E6:
	TAX					;$BED1E6  \
	JMP (DATA_BED1EA,x)			;$BED1E7  /

DATA_BED1EA:
	dw CODE_BED1F6
	dw CODE_BED1FC
	dw CODE_BED226
	dw CODE_BED256
	dw CODE_BED295
	dw CODE_BED2B2


CODE_BED1F6:
	TYX					;$BED1F6  \
	INC $2F,x				;$BED1F7   |
	JSR CODE_BEDE09				;$BED1F9   |
CODE_BED1FC:					;	   |
	JSR CODE_BEDB50				;$BED1FC   |
	JSR CODE_BED956				;$BED1FF   |
	JSR CODE_BED7F9				;$BED202   |
	BCC CODE_BED220				;$BED205   |
	LDX current_sprite			;$BED207   |
	LDA $08C2				;$BED209   |
	AND #$4000				;$BED20C   |
	BEQ CODE_BED21B				;$BED20F   |
	LDA $42,x				;$BED211   |
	DEC A					;$BED213   |
	BMI CODE_BED220				;$BED214   |
	LDA $44,x				;$BED216   |
	DEC A					;$BED218   |
	BMI CODE_BED220				;$BED219   |
CODE_BED21B:					;	   |
	STX $0D5E				;$BED21B   |
	INC $2F,x				;$BED21E   |
CODE_BED220:					;	   |
	JSR CODE_BED9FD				;$BED220   |
	JMP CODE_BED794				;$BED223  /

CODE_BED226:
	JSR CODE_BEDB50				;$BED226  \
	JSR CODE_BED2CA				;$BED229   |
	JSR CODE_BED914				;$BED22C   |
	JSR CODE_BED8DA				;$BED22F   |
	BCC CODE_BED23B				;$BED232   |
	INC A					;$BED234   |
	JSR CODE_BED94C				;$BED235   |
	JMP CODE_BED794				;$BED238  /

CODE_BED23B:
	JSR CODE_BEDCA5				;$BED23B  \
	JSR CODE_BEDE09				;$BED23E   |
	JSR CODE_BED956				;$BED241   |
	JSR CODE_BED7F9				;$BED244   |
	JSR CODE_BEE024				;$BED247   |
	JSR CODE_BED9FD				;$BED24A   |
	JSR CODE_BEDB9C				;$BED24D   |
	JSR CODE_BEDF8A				;$BED250   |
	JMP CODE_BED794				;$BED253  /

CODE_BED256:
	JSR CODE_BEDB50				;$BED256  \
	JSR CODE_BED2CA				;$BED259   |
	JSR CODE_BED914				;$BED25C   |
	JSR CODE_BED8DA				;$BED25F   |
	BCC CODE_BED26D				;$BED262   |
	LDA #$0004				;$BED264   |
	JSR CODE_BED94C				;$BED267   |
	JMP CODE_BED794				;$BED26A  /

CODE_BED26D:
	JSR CODE_BEDC64				;$BED26D  \
	JSR CODE_BEDE09				;$BED270   |
	BCC CODE_BED286				;$BED273   |
	DEC $2F,x				;$BED275   |
	LDY $42,x				;$BED277   |
	LDA #$0000				;$BED279   |
	STA $0040,y				;$BED27C   |
	LDA #$0664				;$BED27F   |
	JSL queue_sound_effect			;$BED282   |
CODE_BED286:					;	   |
	JSR CODE_BED956				;$BED286   |
	JSR CODE_BEE024				;$BED289   |
	JSR CODE_BED9FD				;$BED28C   |
	JSR CODE_BEDF8A				;$BED28F   |
	JMP CODE_BED794				;$BED292  /

CODE_BED295:
	JSR CODE_BEDB50				;$BED295  \
	JSR CODE_BED956				;$BED298   |
	JSR CODE_BED7F9				;$BED29B   |
	BCC CODE_BED2AC				;$BED29E   |
	LSR A					;$BED2A0   |
	LDA #$0005				;$BED2A1   |
	BCC CODE_BED2A9				;$BED2A4   |
	LDA #$0003				;$BED2A6   |
CODE_BED2A9:					;	   |
	JSR CODE_BED94C				;$BED2A9   |
CODE_BED2AC:					;	   |
	JSR CODE_BED9FD				;$BED2AC   |
	JMP CODE_BED794				;$BED2AF  /

CODE_BED2B2:
	LDA $0024,y				;$BED2B2  \
	BPL CODE_BED2BC				;$BED2B5   |
	CMP #$FC00				;$BED2B7   |
	BCC CODE_BED2C2				;$BED2BA   |
CODE_BED2BC:					;	   |
	LDA #$FC00				;$BED2BC   |
	STA $0024,y				;$BED2BF   |
CODE_BED2C2:					;	   |
	LDA #$0003				;$BED2C2   |
	JSR CODE_BED94C				;$BED2C5   |
	BRA CODE_BED256				;$BED2C8  /

CODE_BED2CA:
	BIT $0D5B				;$BED2CA  \
	BMI CODE_BED34C				;$BED2CD   |
	LDX current_sprite			;$BED2CF   |
	LDA $0E,x				;$BED2D1   |
	BEQ CODE_BED2D8				;$BED2D3   |
	LDA #$0001				;$BED2D5   |
CODE_BED2D8:					;	   |
	ORA #$8000				;$BED2D8   |
	TAY					;$BED2DB   |
	LDA $19B0				;$BED2DC   |
	BEQ CODE_BED307				;$BED2DF   |
	CPY $19B0				;$BED2E1   |
	STY $19B0				;$BED2E4   |
	BEQ CODE_BED31C				;$BED2E7   |
	TYA					;$BED2E9   |
	LSR A					;$BED2EA   |
	BCC CODE_BED2FA				;$BED2EB   |
	LDA #$0032				;$BED2ED   |
	JSL CODE_B58012				;$BED2F0   |
	LDA global_frame_counter		;$BED2F4   |
	STA $0636				;$BED2F6   |
	RTS					;$BED2F9  /

CODE_BED2FA:
	LDA #$00C8				;$BED2FA  \
	JSL CODE_B58012				;$BED2FD   |
	LDA global_frame_counter		;$BED301   |
	STA $0636				;$BED303   |
	RTS					;$BED306  /

CODE_BED307:
	LDA #$0560				;$BED307  \
	SEC					;$BED30A   |
	JSL CODE_B3814F				;$BED30B   |
	BCC CODE_BED34C				;$BED30F   |
	BNE CODE_BED34C				;$BED311   |
	STY $19B0				;$BED313   |
	LDA global_frame_counter		;$BED316   |
	STA $0636				;$BED318   |
	RTS					;$BED31B  /

CODE_BED31C:
	LDA global_frame_counter		;$BED31C  \
	AND #$0003				;$BED31E   |
	BNE CODE_BED34C				;$BED321   |
	LDX current_sprite			;$BED323   |
	LDA $20,x				;$BED325   |
	BPL CODE_BED32D				;$BED327   |
	EOR #$FFFF				;$BED329   |
	INC A					;$BED32C   |
CODE_BED32D:					;	   |
	CMP #$0780				;$BED32D   |
	BCC CODE_BED335				;$BED330   |
	LDA #$0780				;$BED332   |
CODE_BED335:					;	   |
	CMP #$02C0				;$BED335   |
	BCS CODE_BED33D				;$BED338   |
	LDA #$02C0				;$BED33A   |
CODE_BED33D:					;	   |
	LSR A					;$BED33D   |
	LSR A					;$BED33E   |
	LSR A					;$BED33F   |
	SBC #$0080				;$BED340   |
	JSL CODE_B5801B				;$BED343   |
	LDA global_frame_counter		;$BED347   |
	STA $0636				;$BED349   |
CODE_BED34C:					;	   |
	RTS					;$BED34C  /

CODE_BED34D:
	TAX					;$BED34D  \
	JMP (DATA_BED351,x)			;$BED34E  /

DATA_BED351:
	dw CODE_BED357
	dw CODE_BED377
	dw CODE_BED3A6


CODE_BED357:
	JSR CODE_BED6A9				;$BED357  \
	JSR CODE_BED44C				;$BED35A   |
	BCS CODE_BED374				;$BED35D   |
	JSR CODE_BED671				;$BED35F   |
	JSR CODE_BEDE09				;$BED362   |
	JSR CODE_BED3CB				;$BED365   |
	JSR CODE_BED956				;$BED368   |
	JSR CODE_BED9FD				;$BED36B   |
	JSR CODE_BED639				;$BED36E   |
	JSR CODE_BEDF8A				;$BED371   |
CODE_BED374:					;	   |
	JMP CODE_BED604				;$BED374  /

CODE_BED377:
	JSR CODE_BED6A9				;$BED377  \
	JSR CODE_BED44C				;$BED37A   |
	BCS CODE_BED3A3				;$BED37D   |
	JSR CODE_BED67F				;$BED37F   |
	JSR CODE_BEDE09				;$BED382   |
	BCC CODE_BED397				;$BED385   |
	DEC $2F,x				;$BED387   |
	LDA $3E,x				;$BED389   |
	AND #$FDFF				;$BED38B   |
	STA $3E,x				;$BED38E   |
	LDA #$0664				;$BED390   |
	JSL CODE_B3A3FC				;$BED393   |
CODE_BED397:					;	   |
	JSR CODE_BED3CB				;$BED397   |
	JSR CODE_BED956				;$BED39A   |
	JSR CODE_BED9FD				;$BED39D   |
	JSR CODE_BEDF8A				;$BED3A0   |
CODE_BED3A3:					;	   |
	JMP CODE_BED604				;$BED3A3  /

CODE_BED3A6:
	JSL CODE_BEF039				;$BED3A6  \
	LDA $24,x				;$BED3AA   |
	BMI CODE_BED3C4				;$BED3AC   |
	DEC $3A,x				;$BED3AE   |
	BPL CODE_BED3C4				;$BED3B0   |
	LDA #$0002				;$BED3B2   |
	STA $3A,x				;$BED3B5   |
	LDA $36,x				;$BED3B7   |
	BEQ CODE_BED3C4				;$BED3B9   |
	DEC $36,x				;$BED3BB   |
	ASL A					;$BED3BD   |
	ASL A					;$BED3BE   |
	ADC #$14A0				;$BED3BF   |
	STA $1A,x				;$BED3C2   |
CODE_BED3C4:					;	   |
	JSL CODE_BBBB8D				;$BED3C4   |
	JML [$05A9]				;$BED3C8  /

CODE_BED3CB:
	LDY $0D5E				;$BED3CB  \
	BEQ CODE_BED424				;$BED3CE   |
	LDA $000E,y				;$BED3D0   |
	BMI CODE_BED424				;$BED3D3   |
	LDX current_sprite			;$BED3D5   |
	LDY $42,x				;$BED3D7   |
	LDA $004E,y				;$BED3D9   |
	BEQ CODE_BED424				;$BED3DC   |
	LDA $0D5C				;$BED3DE   |
	AND #$007F				;$BED3E1   |
	CMP $004E,y				;$BED3E4   |
	BCC CODE_BED40F				;$BED3E7   |
	LDA #$0000				;$BED3E9   |
	BIT $0E,x				;$BED3EC   |
	BPL CODE_BED3FF				;$BED3EE   |
	LDA $004C,y				;$BED3F0   |
	INC A					;$BED3F3   |
	CMP #$001E				;$BED3F4   |
	BCC CODE_BED3FF				;$BED3F7   |
	JSR CODE_BED425				;$BED3F9   |
	LDA #$001E				;$BED3FC   |
CODE_BED3FF:					;	   |
	STA $004C,y				;$BED3FF   |
	LDY $0D5E				;$BED402   |
	LDA $06,x				;$BED405   |
	CMP $0006,y				;$BED407   |
	BCS CODE_BED424				;$BED40A   |
	JSR CODE_BED425				;$BED40C   |
CODE_BED40F:					;	   |
	LDA $0D5E				;$BED40F   |
	BEQ CODE_BED41C				;$BED412   |
	TAY					;$BED414   |
	LDA $0020,y				;$BED415   |
	SEC					;$BED418   |
	SBC #$0100				;$BED419   |
CODE_BED41C:					;	   |
	STA $22,x				;$BED41C   |
	STA $28,x				;$BED41E   |
	STA $2A,x				;$BED420   |
	STZ $2C,x				;$BED422   |
CODE_BED424:					;	   |
	RTS					;$BED424  /

CODE_BED425:
	PHX					;$BED425  \
	PHY					;$BED426   |
	BIT $0923				;$BED427   |
	BVS CODE_BED449				;$BED42A   |
	LDX current_sprite			;$BED42C   |
	LDY $42,x				;$BED42E   |
	LDA $0D5C				;$BED430   |
	AND #$007F				;$BED433   |
	CMP $004E,y				;$BED436   |
	BCC CODE_BED449				;$BED439   |
	BEQ CODE_BED449				;$BED43B   |
	STA $004E,y				;$BED43D   |
	DEC $0D5C				;$BED440   |
	LDA #$8003				;$BED443   |
	TSB $0923				;$BED446   |
CODE_BED449:					;	   |
	PLY					;$BED449   |
	PLX					;$BED44A   |
	RTS					;$BED44B  /

CODE_BED44C:
	LDY $0D5E				;$BED44C  \
	BEQ CODE_BED457				;$BED44F   |
	JSL CODE_BEBDC1				;$BED451   |
	BCS CODE_BED459				;$BED455   |
CODE_BED457:					;	   |
	CLC					;$BED457   |
	RTS					;$BED458  /

CODE_BED459:
	LDX $6A					;$BED459  \
	LDY current_sprite			;$BED45B   |
	LDA $24,x				;$BED45D   |
	BMI CODE_BED48F				;$BED45F   |
	LDA $1E,x				;$BED461   |
	BIT #$0001				;$BED463   |
	BNE CODE_BED48F				;$BED466   |
	LDA $0A,x				;$BED468   |
	SEC					;$BED46A   |
	SBC #$0010				;$BED46B   |
	CMP $000A,y				;$BED46E   |
	BCS CODE_BED48D				;$BED471   |
	LDA #$F900				;$BED473   |
	STA $24,x				;$BED476   |
	LDA $40,x				;$BED478   |
	CMP #$000E				;$BED47A   |
	BCS CODE_BED482				;$BED47D   |
	LDA #$000E				;$BED47F   |
CODE_BED482:					;	   |
	STA $40,x				;$BED482   |
	LDA #$0200				;$BED484   |
	STA $0020,y				;$BED487   |
	BRL CODE_BED511				;$BED48A  /

CODE_BED48D:
	CLC					;$BED48D  \
	RTS					;$BED48E  /

CODE_BED48F:
	BIT $0923				;$BED48F  \
	BVS CODE_BED4CB				;$BED492   |
	LDA $06,x				;$BED494   |
	CMP $0006,y				;$BED496   |
	BCS CODE_BED511				;$BED499   |
	LDA $0020,y				;$BED49B   |
	BMI CODE_BED4A5				;$BED49E   |
	CMP #$0100				;$BED4A0   |
	BCS CODE_BED4A8				;$BED4A3   |
CODE_BED4A5:					;	   |
	LDA #$0100				;$BED4A5   |
CODE_BED4A8:					;	   |
	CMP #$0800				;$BED4A8   |
	BCC CODE_BED4B0				;$BED4AB   |
	LDA #$0800				;$BED4AD   |
CODE_BED4B0:					;	   |
	EOR #$FFFF				;$BED4B0   |
	SEC					;$BED4B3   |
	ADC #$1800				;$BED4B4   |
	LSR A					;$BED4B7   |
	LSR A					;$BED4B8   |
	STA $5E					;$BED4B9   |
	LDA $20,x				;$BED4BB   |
	SEC					;$BED4BD   |
	SBC $0020,y				;$BED4BE   |
	BMI CODE_BED48D				;$BED4C1   |
	ASL A					;$BED4C3   |
	CMP $5E					;$BED4C4   |
	BCS CODE_BED4DF				;$BED4C6   |
	BRL CODE_BED569				;$BED4C8  /

CODE_BED4CB:
	LDA $20,x				;$BED4CB  \
	CLC					;$BED4CD   |
	ADC #$0100				;$BED4CE   |
	STA $0022,y				;$BED4D1   |
	STA $0028,y				;$BED4D4   |
	STA $002A,y				;$BED4D7   |
	STA $0020,y				;$BED4DA   |
	CLC					;$BED4DD   |
	RTS					;$BED4DE  /

CODE_BED4DF:
	JSR CODE_BEBE06				;$BED4DF  \
	LDX $6A					;$BED4E2   |
	LDY current_sprite			;$BED4E4   |
	LDA $20,x				;$BED4E6   |
	CLC					;$BED4E8   |
	ADC $0020,y				;$BED4E9   |
	LSR A					;$BED4EC   |
	STA $0020,y				;$BED4ED   |
	LDA $0A,x				;$BED4F0   |
	STA $1C,x				;$BED4F2   |
	LDA $20,x				;$BED4F4   |
	SEC					;$BED4F6   |
	SBC #$0100				;$BED4F7   |
	STA $2A,x				;$BED4FA   |
	STA $26,x				;$BED4FC   |
	STA $20,x				;$BED4FE   |
	LDA #$FE80				;$BED500   |
	STA $2C,x				;$BED503   |
	LDA #$0810				;$BED505   |
	STA $4E,x				;$BED508   |
	LDA $3E,x				;$BED50A   |
	ORA #$8000				;$BED50C   |
	STA $3E,x				;$BED50F   |
CODE_BED511:					;	   |
	LDY current_sprite			;$BED511   |
	LDX $42,y				;$BED513   |
	STZ $42,x				;$BED515   |
	INC $2E,x				;$BED517   |
	JSR CODE_BED425				;$BED519   |
	LDA $54,x				;$BED51C   |
	STA $0054,y				;$BED51E   |
	TYX					;$BED521   |
	STZ $42,x				;$BED522   |
	LDA #$0204				;$BED524   |
	STA $2E,x				;$BED527   |
	LDA #$0004				;$BED529   |
	STA $52,x				;$BED52C   |
	STA $3A,x				;$BED52E   |
	LDA $20,x				;$BED530   |
	CMP #$0500				;$BED532   |
	BCC CODE_BED53A				;$BED535   |
	LDA #$0500				;$BED537   |
CODE_BED53A:					;	   |
	STA $20,x				;$BED53A   |
	STA $26,x				;$BED53C   |
	STZ $2C,x				;$BED53E   |
	EOR #$FFFF				;$BED540   |
	SBC #$0300				;$BED543   |
	CMP #$FB00				;$BED546   |
	BCC CODE_BED54E				;$BED549   |
	LDA #$FB00				;$BED54B   |
CODE_BED54E:					;	   |
	STA $24,x				;$BED54E   |
	LDA $0D5C				;$BED550   |
	AND #$007F				;$BED553   |
	BEQ CODE_BED563				;$BED556   |
	TAX					;$BED558   |
	LDA.l DATA_FDD3AC,x			;$BED559   |
	AND #$00FF				;$BED55D   |
	JSR CODE_BEE691				;$BED560   |
CODE_BED563:					;	   |
	JSL CODE_BBBD6B				;$BED563   |
	SEC					;$BED567   |
	RTS					;$BED568  /

CODE_BED569:
	JSR CODE_BEBE06				;$BED569  \
	LDY $6A					;$BED56C   |
	LDX current_sprite			;$BED56E   |
	LDA $0020,y				;$BED570   |
	SEC					;$BED573   |
	SBC $20,x				;$BED574   |
	CMP #$0200				;$BED576   |
	BCS CODE_BED57E				;$BED579   |
	LDA #$0200				;$BED57B   |
CODE_BED57E:					;	   |
	STA $32					;$BED57E   |
	LSR A					;$BED580   |
	LSR A					;$BED581   |
	SEC					;$BED582   |
	SBC $32					;$BED583   |
	STA $32					;$BED585   |
	LDA $2F,x				;$BED587   |
	AND #$00FF				;$BED589   |
	BNE CODE_BED5A7				;$BED58C   |
	LDA $1E,x				;$BED58E   |
	AND #$0001				;$BED590   |
	BEQ CODE_BED5A7				;$BED593   |
	EOR $1E,x				;$BED595   |
	STA $1E,x				;$BED597   |
	LDA $32					;$BED599   |
	ASL A					;$BED59B   |
	STA $24,x				;$BED59C   |
	LDA $3E,x				;$BED59E   |
	ORA #$0200				;$BED5A0   |
	STA $3E,x				;$BED5A3   |
	INC $2F,x				;$BED5A5   |
CODE_BED5A7:					;	   |
	LDA $2C,x				;$BED5A7   |
	SEC					;$BED5A9   |
	SBC $32					;$BED5AA   |
	STA $2C,x				;$BED5AC   |
	LDA #$1E08				;$BED5AE   |
	STA $4E,x				;$BED5B1   |
	LDA $3E,x				;$BED5B3   |
	ORA #$8000				;$BED5B5   |
	STA $3E,x				;$BED5B8   |
	LDA $20,x				;$BED5BA   |
	STA $34					;$BED5BC   |
	LDA $0020,y				;$BED5BE   |
	STA $20,x				;$BED5C1   |
	LDA $002C,y				;$BED5C3   |
	CLC					;$BED5C6   |
	ADC $32					;$BED5C7   |
	STA $002C,y				;$BED5C9   |
	CLC					;$BED5CC   |
	ADC $002A,y				;$BED5CD   |
	STA $32					;$BED5D0   |
	SEC					;$BED5D2   |
	SBC $0022,y				;$BED5D3   |
	BPL CODE_BED5E1				;$BED5D6   |
	STA $002C,y				;$BED5D8   |
	LDA $0022,y				;$BED5DB   |
	STA $002A,y				;$BED5DE   |
CODE_BED5E1:					;	   |
	LDA #$1E08				;$BED5E1   |
	STA $004E,y				;$BED5E4   |
	LDA $003E,y				;$BED5E7   |
	ORA #$8000				;$BED5EA   |
	STA $003E,y				;$BED5ED   |
	LDA $34					;$BED5F0   |
	STA $0020,y				;$BED5F2   |
	LDA #$0702				;$BED5F5   |
	JSL queue_sound_effect			;$BED5F8   |
	LDA #$0019				;$BED5FC   |
	JSR CODE_BEE691				;$BED5FF   |
	SEC					;$BED602   |
	RTS					;$BED603  /

CODE_BED604:
	LDX current_sprite			;$BED604  \
	LDA $3E,x				;$BED606   |
	BIT #$1000				;$BED608   |
	BNE CODE_BED61C				;$BED60B   |
	LDA $0D5C				;$BED60D   |
	BEQ CODE_BED636				;$BED610   |
	AND #$007F				;$BED612   |
	LDY $42,x				;$BED615   |
	CMP $004E,y				;$BED617   |
	BCS CODE_BED636				;$BED61A   |
CODE_BED61C:					;	   |
	JSL CODE_BBBB7B				;$BED61C   |
	BCC CODE_BED636				;$BED620   |
	LDX current_sprite			;$BED622   |
	LDY $42,x				;$BED624   |
	LDA #$0000				;$BED626   |
	STA $0042,y				;$BED629   |
	JSL CODE_BBBB44				;$BED62C   |
	LDA #$0002				;$BED630   |
	TRB $0923				;$BED633   |
CODE_BED636:					;	   |
	JML [$05A9]				;$BED636  /

CODE_BED639:
	LDX current_sprite			;$BED639  \
	LDA $3E,x				;$BED63B   |
	BIT #$0400				;$BED63D   |
	BEQ CODE_BED670				;$BED640   |
	LDX current_sprite			;$BED642   |
	LDA $1E,x				;$BED644   |
	BIT #$0101				;$BED646   |
	BEQ CODE_BED670				;$BED649   |
	AND #$FFFE				;$BED64B   |
	STA $1E,x				;$BED64E   |
	INC $2F,x				;$BED650   |
	LDA [$8E]				;$BED652   |
	STA $24,x				;$BED654   |
	LDA $40,x				;$BED656   |
	CMP #$000E				;$BED658   |
	BCS CODE_BED660				;$BED65B   |
	LDA #$000E				;$BED65D   |
CODE_BED660:					;	   |
	STA $40,x				;$BED660   |
	LDA $3E,x				;$BED662   |
	AND #$FBFF				;$BED664   |
	STA $3E,x				;$BED667   |
	LDA #$066A				;$BED669   |
	JSL CODE_B3A3FC				;$BED66C   |
CODE_BED670:					;	   |
	RTS					;$BED670  /

CODE_BED671:
	LDX current_sprite			;$BED671  \
	LDA $50,x				;$BED673   |
	PHA					;$BED675   |
	JSR CODE_BEDCA5				;$BED676   |
	PLA					;$BED679   |
	LDX current_sprite			;$BED67A   |
	STA $50,x				;$BED67C   |
	RTS					;$BED67E  /

CODE_BED67F:
	LDX current_sprite			;$BED67F  \
	LDA $24,x				;$BED681   |
	BMI CODE_BED693				;$BED683   |
	LDA $50,x				;$BED685   |
	PHA					;$BED687   |
	LDY #$0005				;$BED688   |
	JSR CODE_BEDCD8				;$BED68B   |
	LDX current_sprite			;$BED68E   |
	PLA					;$BED690   |
	STA $50,x				;$BED691   |
CODE_BED693:					;	   |
	LDX current_sprite			;$BED693   |
	LDA $24,x				;$BED695   |
	BPL CODE_BED6A6				;$BED697   |
	LDA $3E,x				;$BED699   |
	BIT #$0220				;$BED69B   |
	BEQ CODE_BED6A6				;$BED69E   |
	LDY #$0002				;$BED6A0   |
	JMP CODE_BEDCC3				;$BED6A3  /

CODE_BED6A6:
	JMP CODE_BEDCC0				;$BED6A6  /

CODE_BED6A9:
	LDX current_sprite			;$BED6A9  \
	LDA $0D5B				;$BED6AB   |
	BPL CODE_BED6BE				;$BED6AE   |
	LDA global_frame_counter		;$BED6B0   |
	AND #$007F				;$BED6B2   |
	BNE CODE_BED6BE				;$BED6B5   |
	LDA $3E,x				;$BED6B7   |
	ORA #$0100				;$BED6B9   |
	STA $3E,x				;$BED6BC   |
CODE_BED6BE:					;	   |
	LDA $4A,x				;$BED6BE   |
	CMP $06,x				;$BED6C0   |
	BCC CODE_BED700				;$BED6C2   |
	LDA $5C,x				;$BED6C4   |
	STA $32					;$BED6C6   |
	LDA $90					;$BED6C8   |
	LDY level_number			;$BED6CA   |
	CPY #$000F				;$BED6CC   |
	BNE CODE_BED6D4				;$BED6CF   |
	LDA #$00FD				;$BED6D1   |
CODE_BED6D4:					;	   |
	STA $34					;$BED6D4   |
	LDA [$32]				;$BED6D6   |
	CMP $4A,x				;$BED6D8   |
	BCS CODE_BED700				;$BED6DA   |
	LDY #$0002				;$BED6DC   |
	LDA [$32],y				;$BED6DF   |
	BIT #$0800				;$BED6E1   |
	BNE CODE_BED701				;$BED6E4   |
	BIT #$0080				;$BED6E6   |
	BNE CODE_BED70E				;$BED6E9   |
	BIT #$0040				;$BED6EB   |
	BNE CODE_BED727				;$BED6EE   |
	BIT #$0020				;$BED6F0   |
	BNE CODE_BED747				;$BED6F3   |
	EOR $3E,x				;$BED6F5   |
	STA $3E,x				;$BED6F7   |
CODE_BED6F9:					;	   |
	INY					;$BED6F9   |
	TYA					;$BED6FA   |
	SEC					;$BED6FB   |
	ADC $5C,x				;$BED6FC   |
	STA $5C,x				;$BED6FE   |
CODE_BED700:					;	   |
	RTS					;$BED700  /

CODE_BED701:
	INY					;$BED701  \
	INY					;$BED702   |
	LDA [$32],y				;$BED703   |
	BEQ CODE_BED70A				;$BED705   |
	CLC					;$BED707   |
	ADC $50,x				;$BED708   |
CODE_BED70A:					;	   |
	STA $50,x				;$BED70A   |
	BRA CODE_BED6F9				;$BED70C  /

CODE_BED70E:
	EOR $3E,x				;$BED70E  \
	STA $3E,x				;$BED710   |
	INY					;$BED712   |
	INY					;$BED713   |
	LDA $42,x				;$BED714   |
	TAX					;$BED716   |
	LDA [$32],y				;$BED717   |
	STA $10,x				;$BED719   |
	LDA [$32]				;$BED71B   |
	CLC					;$BED71D   |
	ADC #$0200				;$BED71E   |
	STA $04,x				;$BED721   |
	LDX current_sprite			;$BED723   |
	BRA CODE_BED6F9				;$BED725  /

CODE_BED727:
	INY					;$BED727  \
	INY					;$BED728   |
	LDA [$32],y				;$BED729   |
	STA $2A,x				;$BED72B   |
	LDA $0A,x				;$BED72D   |
	STA $1C,x				;$BED72F   |
	LDA $20,x				;$BED731   |
	SEC					;$BED733   |
	SBC $2A,x				;$BED734   |
	STA $2C,x				;$BED736   |
	INY					;$BED738   |
	INY					;$BED739   |
	LDA [$32],y				;$BED73A   |
	STA $4E,x				;$BED73C   |
	LDA #$8000				;$BED73E   |
	ORA $3E,x				;$BED741   |
	STA $3E,x				;$BED743   |
	BRA CODE_BED6F9				;$BED745  /

CODE_BED747:
	INY					;$BED747  \
	INY					;$BED748   |
	LDA [$32],y				;$BED749   |
	STA $5C,x				;$BED74B   |
	RTS					;$BED74D  /

CODE_BED74E:
	LDA $5C,x				;$BED74E  \
	STA $32					;$BED750   |
	LDA #$00FD				;$BED752   |
	STA $34					;$BED755   |
	LDY #$0000				;$BED757   |
CODE_BED75A:					;	   |
	LDA [$32],y				;$BED75A   |
	CMP $06,x				;$BED75C   |
	BCS CODE_BED776				;$BED75E   |
	INY					;$BED760   |
	INY					;$BED761   |
	LDA [$32],y				;$BED762   |
	INY					;$BED764   |
	INY					;$BED765   |
	BIT #$08E0				;$BED766   |
	BEQ CODE_BED75A				;$BED769   |
	INY					;$BED76B   |
	INY					;$BED76C   |
	BIT #$0040				;$BED76D   |
	BEQ CODE_BED75A				;$BED770   |
	INY					;$BED772   |
	INY					;$BED773   |
	BRA CODE_BED75A				;$BED774  /

CODE_BED776:
	INY					;$BED776  \
	INY					;$BED777   |
	INY					;$BED778   |
	INY					;$BED779   |
	LDA [$32],y				;$BED77A   |
	STA $2A,x				;$BED77C   |
	LDA $0A,x				;$BED77E   |
	STA $1C,x				;$BED780   |
	STA $20,x				;$BED782   |
	STZ $2C,x				;$BED784   |
	TYA					;$BED786   |
	CLC					;$BED787   |
	ADC #$0004				;$BED788   |
	CLC					;$BED78B   |
	ADC $5C,x				;$BED78C   |
	STA $5C,x				;$BED78E   |
	RTS					;$BED790  /

CODE_BED791:
	JML [$05A9]				;$BED791  /

CODE_BED794:
	LDX current_sprite			;$BED794  \
	LDA $3E,x				;$BED796   |
	AND #$D7FF				;$BED798   |
	STA $3E,x				;$BED79B   |
	CPX $0D5E				;$BED79D   |
	BNE CODE_BED7A5				;$BED7A0   |
	JML [$05A9]				;$BED7A2  /

CODE_BED7A5:
	JMP CODE_BEB849				;$BED7A5  /

CODE_BED7A8:
	LDX current_sprite			;$BED7A8  \
	LDA $3E,x				;$BED7AA   |
	AND #$D7FF				;$BED7AC   |
	STA $3E,x				;$BED7AF   |
	LDA $42,x				;$BED7B1   |
	BEQ CODE_BED7C4				;$BED7B3   |
	BPL CODE_BED7C1				;$BED7B5   |
	AND #$7FFF				;$BED7B7   |
	TAY					;$BED7BA   |
	TXA					;$BED7BB   |
	CMP $0042,y				;$BED7BC   |
	BNE CODE_BED7C4				;$BED7BF   |
CODE_BED7C1:					;	   |
	JML [$05A9]				;$BED7C1  /

CODE_BED7C4:
	JMP CODE_BEB849				;$BED7C4  /

CODE_BED7C7:
	STA $2E,x				;$BED7C7  \
	STZ $46,x				;$BED7C9   |
	STZ $48,x				;$BED7CB   |
	LDA #$1000				;$BED7CD   |
	STA $30,x				;$BED7D0   |
	LDA $08C2				;$BED7D2   |
	AND #$4000				;$BED7D5   |
	ORA $3E,x				;$BED7D8   |
	STA $3E,x				;$BED7DA   |
	LDA #$8000				;$BED7DC   |
	STA $36,x				;$BED7DF   |
	LDA $0A,x				;$BED7E1   |
	STA $1C,x				;$BED7E3   |
	STZ $20,x				;$BED7E5   |
	STZ $26,x				;$BED7E7   |
	STZ $50,x				;$BED7E9   |
	LDA #$0100				;$BED7EB   |
	STA $24,x				;$BED7EE   |
	LDA $06,x				;$BED7F0   |
	STA $4A,x				;$BED7F2   |
	LDA $0A,x				;$BED7F4   |
	STA $4C,x				;$BED7F6   |
	RTS					;$BED7F8  /

CODE_BED7F9:
	LDA $0A36				;$BED7F9  \
	AND #$0004				;$BED7FC   |
	BNE CODE_BED80B				;$BED7FF   |
	LDX current_sprite			;$BED801   |
	LDA $42,x				;$BED803   |
	DEC A					;$BED805   |
	BMI CODE_BED80D				;$BED806   |
	BRL CODE_BED889				;$BED808  /

CODE_BED80B:
	CLC					;$BED80B  \
	RTS					;$BED80C  /

CODE_BED80D:
	JSL CODE_BCFB58				;$BED80D  \
	LDA #$0010				;$BED811   |
	PHK					;$BED814   |
	%return(CODE_BED81B)			;$BED815   |
	JML [$09F9]				;$BED818  /

CODE_BED81B:
	BCC CODE_BED887				;$BED81B  \
	LDY $6A					;$BED81D   |
	LDA $0024,y				;$BED81F   |
	BMI CODE_BED887				;$BED822   |
	LDX current_sprite			;$BED824   |
	LDA $0A,x				;$BED826   |
	CMP $000A,y				;$BED828   |
	BCC CODE_BED887				;$BED82B   |
	LDY $6A					;$BED82D   |
	CPY $0593				;$BED82F   |
	BEQ CODE_BED859				;$BED832   |
	LDA $002E,y				;$BED834   |
	CMP #$001F				;$BED837   |
	BEQ CODE_BED887				;$BED83A   |
	CMP #$0021				;$BED83C   |
	BEQ CODE_BED887				;$BED83F   |
	LDA #$0015				;$BED841   |
	JSL CODE_B8D8BA				;$BED844   |
	BCS CODE_BED887				;$BED848   |
	STX $0A86				;$BED84A   |
	LDA $6A					;$BED84D   |
	STA $0A88				;$BED84F   |
	STA $44,x				;$BED852   |
	LDA #$0001				;$BED854   |
	SEC					;$BED857   |
	RTS					;$BED858  /

CODE_BED859:
	LDA #$0015				;$BED859  \
	JSL CODE_B8D8BA				;$BED85C   |
	BCS CODE_BED887				;$BED860   |
	STX $0A86				;$BED862   |
	LDA $6A					;$BED865   |
	STA $0A88				;$BED867   |
	STA $42,x				;$BED86A   |
	LDY $0595				;$BED86C   |
	LDA global_frame_counter		;$BED86F   |
	SEC					;$BED871   |
	SBC #$0020				;$BED872   |
	STA $0022,y				;$BED875   |
	LDX current_sprite			;$BED878   |
	LDA $06,x				;$BED87A   |
	STA $38,x				;$BED87C   |
	LDA $0A,x				;$BED87E   |
	STA $3C,x				;$BED880   |
	LDA #$0000				;$BED882   |
	SEC					;$BED885   |
	RTS					;$BED886  /

CODE_BED887:
	CLC					;$BED887  \
	RTS					;$BED888  /

CODE_BED889:
	LDA $08C2				;$BED889  \
	AND #$4000				;$BED88C   |
	BEQ CODE_BED887				;$BED88F   |
	LDA $44,x				;$BED891   |
	DEC A					;$BED893   |
	BPL CODE_BED887				;$BED894   |
	LDA $44,x				;$BED896   |
	BMI CODE_BED8B5				;$BED898   |
	LDY $0597				;$BED89A   |
	LDA $06,x				;$BED89D   |
	SEC					;$BED89F   |
	SBC $38,x				;$BED8A0   |
	CLC					;$BED8A2   |
	ADC $0006,y				;$BED8A3   |
	STA $0006,y				;$BED8A6   |
	LDA $0A,x				;$BED8A9   |
	SEC					;$BED8AB   |
	SBC $3C,x				;$BED8AC   |
	CLC					;$BED8AE   |
	ADC $000A,y				;$BED8AF   |
	STA $000A,y				;$BED8B2   |
CODE_BED8B5:					;	   |
	LDY $0597				;$BED8B5   |
	JSL CODE_BEBDC1				;$BED8B8   |
	BCC CODE_BED887				;$BED8BC   |
	LDA #$0015				;$BED8BE   |
	JSL CODE_B8D8BA				;$BED8C1   |
	BCS CODE_BED887				;$BED8C5   |
	STX $0A86				;$BED8C7   |
	LDA $0597				;$BED8CA   |
	STA $0A88				;$BED8CD   |
	LDA $0597				;$BED8D0   |
	STA $44,x				;$BED8D3   |
	LDA #$0001				;$BED8D5   |
	SEC					;$BED8D8   |
	RTS					;$BED8D9  /

CODE_BED8DA:
	LDX current_sprite			;$BED8DA  \
	LDA $3E,x				;$BED8DC   |
	EOR $08C2				;$BED8DE   |
	AND #$4000				;$BED8E1   |
	BEQ CODE_BED912				;$BED8E4   |
	EOR $3E,x				;$BED8E6   |
	STA $3E,x				;$BED8E8   |
	AND #$4000				;$BED8EA   |
	BNE CODE_BED903				;$BED8ED   |
	STZ $42,x				;$BED8EF   |
	STZ $44,x				;$BED8F1   |
	LDA global_frame_counter		;$BED8F3   |
	SBC #$0020				;$BED8F5   |
	LDY $0595				;$BED8F8   |
	STA $0022,y				;$BED8FB   |
	LDA #$0000				;$BED8FE   |
	SEC					;$BED901   |
	RTS					;$BED902  /

CODE_BED903:
	LDX current_sprite			;$BED903  \
	LDA $06,x				;$BED905   |
	STA $38,x				;$BED907   |
	LDA $0A,x				;$BED909   |
	STA $3C,x				;$BED90B   |
	LDA #$0001				;$BED90D   |
	SEC					;$BED910   |
	RTS					;$BED911  /

CODE_BED912:
	CLC					;$BED912  \
	RTS					;$BED913  /

CODE_BED914:
	JSR CODE_BED92E				;$BED914  \
	BCS CODE_BED92D				;$BED917   |
	LDX current_sprite			;$BED919   |
	STZ $42,x				;$BED91B   |
	LDY $0595				;$BED91D   |
	LDA global_frame_counter		;$BED920   |
	SBC #$0020				;$BED922   |
	STA $0022,y				;$BED925   |
	STZ $30,x				;$BED928   |
	LDA #$0001				;$BED92A   |
CODE_BED92D:					;	   |
	RTS					;$BED92D  /

CODE_BED92E:
	LDA $08C2				;$BED92E  \
	AND #$4000				;$BED931   |
	BNE CODE_BED94A				;$BED934   |
	LDY $0593				;$BED936   |
	LDA $002E,y				;$BED939   |
	ASL A					;$BED93C   |
	ASL A					;$BED93D   |
	TAX					;$BED93E   |
	LDA.l DATA_B896B7,x			;$BED93F   |
	AND #$0001				;$BED943   |
	BEQ CODE_BED94A				;$BED946   |
	CLC					;$BED948   |
	RTS					;$BED949  /

CODE_BED94A:
	SEC					;$BED94A  \
	RTS					;$BED94B  /

CODE_BED94C:
	LDY current_sprite			;$BED94C  \
	SEP #$20				;$BED94E   |
	STA $002F,y				;$BED950   |
	REP #$20				;$BED953   |
	RTS					;$BED955  /

CODE_BED956:
	PHK					;$BED956  \
	PLB					;$BED957   |
	LDX current_sprite			;$BED958   |
	LDA $10,x				;$BED95A   |
	AND #$8007				;$BED95C   |
	CMP #$8000				;$BED95F   |
	ROL A					;$BED962   |
	TAY					;$BED963   |
	LDA DATA_BED9EF,y			;$BED964   |
	AND #$00FF				;$BED967   |
	BIT $36,x				;$BED96A   |
	BMI CODE_BED9CE				;$BED96C   |
	STA $32					;$BED96E   |
	LDA $0E,x				;$BED970   |
	BEQ CODE_BED992				;$BED972   |
	STZ $3A,x				;$BED974   |
	BIT $24,x				;$BED976   |
	BMI CODE_BED98D				;$BED978   |
	LDA $0E,x				;$BED97A   |
	CMP #$0020				;$BED97C   |
	BCS CODE_BED9E3				;$BED97F   |
	LDA $32					;$BED981   |
	STA $40,x				;$BED983   |
	SEC					;$BED985   |
	SBC $36,x				;$BED986   |
	CMP #$FFFC				;$BED988   |
	BCS CODE_BED9E3				;$BED98B   |
CODE_BED98D:					;	   |
	JSR CODE_BED9C2				;$BED98D   |
	BRA CODE_BED9C2				;$BED990  /

CODE_BED992:
	LDA $32					;$BED992  \
	STA $40,x				;$BED994   |
	SEC					;$BED996   |
	SBC $36,x				;$BED997   |
	CMP #$0003				;$BED999   |
	BCC CODE_BED9A3				;$BED99C   |
	CMP #$FFFD				;$BED99E   |
	BCC CODE_BED9A7				;$BED9A1   |
CODE_BED9A3:					;	   |
	DEC $3A,x				;$BED9A3   |
	BPL CODE_BED9E3				;$BED9A5   |
CODE_BED9A7:					;	   |
	LDA $36,x				;$BED9A7   |
	CMP #$0009				;$BED9A9   |
	BNE CODE_BED9C2				;$BED9AC   |
	LDA $52,x				;$BED9AE   |
	AND #$0007				;$BED9B0   |
	CMP #$0002				;$BED9B3   |
	BCS CODE_BED9C2				;$BED9B6   |
	LDA $10,x				;$BED9B8   |
	AND #$0007				;$BED9BA   |
	CMP #$0002				;$BED9BD   |
	BCC CODE_BED9E3				;$BED9C0   |
CODE_BED9C2:					;	   |
	LDA $36,x				;$BED9C2   |
	CMP $40,x				;$BED9C4   |
	BEQ CODE_BED9E3				;$BED9C6   |
	BCS CODE_BED9D2				;$BED9C8   |
	INC $36,x				;$BED9CA   |
	BRA CODE_BED9D4				;$BED9CC  /

CODE_BED9CE:
	STA $36,x				;$BED9CE  \
	BRA CODE_BED9D4				;$BED9D0  /

CODE_BED9D2:
	DEC $36,x				;$BED9D2  \
CODE_BED9D4:					;	   |
	LDA $0E,x				;$BED9D4   |
	CMP #$0030				;$BED9D6   |
	LDA #$0008				;$BED9D9   |
	BCS CODE_BED9E1				;$BED9DC   |
	LDA #$0003				;$BED9DE   |
CODE_BED9E1:					;	   |
	STA $3A,x				;$BED9E1   |
CODE_BED9E3:					;	   |
	LDX current_sprite			;$BED9E3   |
	LDA $36,x				;$BED9E5   |
	ASL A					;$BED9E7   |
	ASL A					;$BED9E8   |
	ADC #$14A0				;$BED9E9   |
	STA $1A,x				;$BED9EC   |
	RTS					;$BED9EE  /

DATA_BED9EF:
	db $09, $09, $0B, $07, $0D, $05, $0E, $04
	db $10, $02, $12, $00, $12, $00


CODE_BED9FD:
	LDX current_sprite			;$BED9FD  \
	LDY $42,x				;$BED9FF   |
	BEQ CODE_BEDA0B				;$BEDA01   |
	BMI CODE_BEDA0B				;$BEDA03   |
	JSR CODE_BEDA4E				;$BEDA05   |
	JSR CODE_BEDA90				;$BEDA08   |
CODE_BEDA0B:					;	   |
	LDY $44,x				;$BEDA0B   |
	BEQ CODE_BEDA3B				;$BEDA0D   |
	BMI CODE_BEDA3B				;$BEDA0F   |
	JSR CODE_BEDA4E				;$BEDA11   |
	LDA $0000,y				;$BEDA14   |
	SEC					;$BEDA17   |
	SBC #$00E4				;$BEDA18   |
	BEQ CODE_BEDA20				;$BEDA1B   |
	LDA #$0026				;$BEDA1D   |
CODE_BEDA20:					;	   |
	CLC					;$BEDA20   |
	ADC $36,x				;$BEDA21   |
	ASL A					;$BEDA23   |
	TAX					;$BEDA24   |
	LDA.l DATA_BEDAB8,x			;$BEDA25   |
	CLC					;$BEDA29   |
	ADC $0006,y				;$BEDA2A   |
	STA $0006,y				;$BEDA2D   |
	LDA.l DATA_BEDADE,x			;$BEDA30   |
	CLC					;$BEDA34   |
	ADC $000A,y				;$BEDA35   |
	STA $000A,y				;$BEDA38   |
CODE_BEDA3B:					;	   |
	LDY current_sprite			;$BEDA3B   |
	LDX $46,y				;$BEDA3D   |
	BEQ CODE_BEDA44				;$BEDA3F   |
	JSR CODE_BECEE5				;$BEDA41   |
CODE_BEDA44:					;	   |
	LDY current_sprite			;$BEDA44   |
	LDX $48,y				;$BEDA46   |
	BEQ CODE_BEDA4D				;$BEDA48   |
	JSR CODE_BECEE5				;$BEDA4A   |
CODE_BEDA4D:					;	   |
	RTS					;$BEDA4D  /

CODE_BEDA4E:
	LDA $06,x				;$BEDA4E  \
	STA $0006,y				;$BEDA50   |
	LDA $0A,x				;$BEDA53   |
	STA $000A,y				;$BEDA55   |
	LDA $12,x				;$BEDA58   |
	EOR $0012,y				;$BEDA5A   |
	AND #$4000				;$BEDA5D   |
	EOR $0012,y				;$BEDA60   |
	STA $0012,y				;$BEDA63   |
	LDA $0C,x				;$BEDA66   |
	STA $000C,y				;$BEDA68   |
	LDA $0E,x				;$BEDA6B   |
	STA $000E,y				;$BEDA6D   |
	LDA $1E,x				;$BEDA70   |
	LDA $001E,y				;$BEDA72   |
	LDA $10,x				;$BEDA75   |
	AND #$8007				;$BEDA77   |
	STA $0044,y				;$BEDA7A   |
	LDA $52,x				;$BEDA7D   |
	AND #$8007				;$BEDA7F   |
	STA $0046,y				;$BEDA82   |
	LDA $36,x				;$BEDA85   |
	STA $0048,y				;$BEDA87   |
	LDA $3E,x				;$BEDA8A   |
	STA $004A,y				;$BEDA8C   |
	RTS					;$BEDA8F  /

CODE_BEDA90:
	CPY $0593				;$BEDA90  \
	BNE CODE_BEDAB7				;$BEDA93   |
	LDA $0048,y				;$BEDA95   |
	CMP #$0009				;$BEDA98   |
	BNE CODE_BEDAB1				;$BEDA9B   |
	LDA $0009,y				;$BEDA9D   |
	SEC					;$BEDAA0   |
	SBC #$0200				;$BEDAA1   |
	AND #$0F00				;$BEDAA4   |
	SEC					;$BEDAA7   |
	SBC #$0B00				;$BEDAA8   |
	CMP #$8000				;$BEDAAB   |
	ROR A					;$BEDAAE   |
	BRA CODE_BEDAB4				;$BEDAAF  /

CODE_BEDAB1:
	LDA #$0000				;$BEDAB1  \
CODE_BEDAB4:					;	   |
	STA $0AF2				;$BEDAB4   |
CODE_BEDAB7:					;	   |
	RTS					;$BEDAB7  /

DATA_BEDAB8:
	db $F8, $FF, $F7, $FF, $F6, $FF, $F5, $FF
	db $F4, $FF, $F3, $FF, $F3, $FF, $F2, $FF
	db $F2, $FF, $F2, $FF, $F2, $FF, $F2, $FF
	db $F3, $FF, $F3, $FF, $F4, $FF, $F5, $FF
	db $F6, $FF, $F8, $FF, $FA, $FF

DATA_BEDADE:
	db $F4, $FF, $F5, $FF, $F6, $FF, $F7, $FF
	db $F8, $FF, $FA, $FF, $FB, $FF, $FD, $FF
	db $FE, $FF, $00, $00, $02, $00, $03, $00
	db $05, $00, $06, $00, $08, $00, $09, $00
	db $0A, $00, $0B, $00, $0D, $00, $FA, $FF
	db $F9, $FF, $F8, $FF, $F7, $FF, $F6, $FF
	db $F6, $FF, $F5, $FF, $F5, $FF, $F5, $FF
	db $F5, $FF, $F5, $FF, $F5, $FF, $F5, $FF
	db $F6, $FF, $F6, $FF, $F7, $FF, $F8, $FF
	db $F9, $FF, $FA, $FF, $F6, $FF, $F7, $FF
	db $F8, $FF, $F9, $FF, $FA, $FF, $FC, $FF
	db $FD, $FF, $FF, $FF, $FF, $FF, $00, $00
	db $01, $00, $01, $00, $03, $00, $04, $00
	db $06, $00, $07, $00, $08, $00, $09, $00
	db $0A, $00

CODE_BEDB50:
	LDA $0D5B				;$BEDB50  \
	BMI CODE_BEDB90				;$BEDB53   |
	LDX current_sprite			;$BEDB55   |
	LDA $0A,x				;$BEDB57   |
	SEC					;$BEDB59   |
	SBC #$0120				;$BEDB5A   |
	BCC CODE_BEDB78				;$BEDB5D   |
	CMP $17C0				;$BEDB5F   |
	BCC CODE_BEDB78				;$BEDB62   |
	LDA $42,x				;$BEDB64   |
	DEC A					;$BEDB66   |
	BMI CODE_BEDB78				;$BEDB67   |
	LDY #$0029				;$BEDB69   |
	JSR CODE_BEC4BA				;$BEDB6C   |
	LDX current_sprite			;$BEDB6F   |
	BCS CODE_BEDB78				;$BEDB71   |
	LDA #$0005				;$BEDB73   |
	STA $2E,x				;$BEDB76   |
CODE_BEDB78:					;	   |
	LDY $0595				;$BEDB78   |
	LDA $3E,x				;$BEDB7B   |
	AND #$0C00				;$BEDB7D   |
	BNE CODE_BEDB90				;$BEDB80   |
	LDA $0002,y				;$BEDB82   |
	AND #$8000				;$BEDB85   |
	BEQ CODE_BEDB8F				;$BEDB88   |
	LDA global_frame_counter		;$BEDB8A   |
	STA $0022,y				;$BEDB8C   |
CODE_BEDB8F:					;	   |
	RTS					;$BEDB8F  /

CODE_BEDB90:
	LDY $0595				;$BEDB90  \
	LDA global_frame_counter		;$BEDB93   |
	SBC #$0020				;$BEDB95   |
	STA $0022,y				;$BEDB98   |
	RTS					;$BEDB9B  /

CODE_BEDB9C:
	LDY $0595				;$BEDB9C  \
	LDA global_frame_counter		;$BEDB9F   |
	SEC					;$BEDBA1   |
	SBC $0022,y				;$BEDBA2   |
	CMP #$0010				;$BEDBA5   |
	BPL CODE_BEDBE1				;$BEDBA8   |
	LDX current_sprite			;$BEDBAA   |
	LDA $1E,x				;$BEDBAC   |
	BIT #$0101				;$BEDBAE   |
	BEQ CODE_BEDBE1				;$BEDBB1   |
	AND #$FFFE				;$BEDBB3   |
	STA $1E,x				;$BEDBB6   |
	INC $2F,x				;$BEDBB8   |
	LDA [$8E]				;$BEDBBA   |
	STA $24,x				;$BEDBBC   |
	LDA $40,x				;$BEDBBE   |
	CMP #$000E				;$BEDBC0   |
	BCS CODE_BEDBC8				;$BEDBC3   |
	LDA #$000E				;$BEDBC5   |
CODE_BEDBC8:					;	   |
	STA $40,x				;$BEDBC8   |
	LDY $42,x				;$BEDBCA   |
	LDA #$3000				;$BEDBCC   |
	STA $0040,y				;$BEDBCF   |
	LDA global_frame_counter		;$BEDBD2   |
	SBC #$0020				;$BEDBD4   |
	STA $0022,y				;$BEDBD7   |
	LDA #$066A				;$BEDBDA   |
	JSL queue_sound_effect			;$BEDBDD   |
CODE_BEDBE1:					;	   |
	RTS					;$BEDBE1  /

CODE_BEDBE2:
	LDY $0595				;$BEDBE2  \
	LDA global_frame_counter		;$BEDBE5   |
	SEC					;$BEDBE7   |
	SBC $0022,y				;$BEDBE8   |
	CMP #$0010				;$BEDBEB   |
	BPL CODE_BEDC2A				;$BEDBEE   |
	LDA #$0016				;$BEDBF0   |
	JSL CODE_B8D8BA				;$BEDBF3   |
	BCS CODE_BEDC2A				;$BEDBF7   |
	STZ $0D5E				;$BEDBF9   |
	LDX current_sprite			;$BEDBFC   |
	LDA $06,x				;$BEDBFE   |
	STA $38,x				;$BEDC00   |
	LDA $0A,x				;$BEDC02   |
	STA $3C,x				;$BEDC04   |
	LDY $42,x				;$BEDC06   |
	LDA $000A,y				;$BEDC08   |
	SEC					;$BEDC0B   |
	SBC #$0010				;$BEDC0C   |
	STA $000A,y				;$BEDC0F   |
	TYA					;$BEDC12   |
	ORA #$8000				;$BEDC13   |
	STA $42,x				;$BEDC16   |
	LDY $44,x				;$BEDC18   |
	BEQ CODE_BEDC28				;$BEDC1A   |
	LDA $000A,y				;$BEDC1C   |
	SEC					;$BEDC1F   |
	SBC #$0010				;$BEDC20   |
	STA $000A,y				;$BEDC23   |
	STZ $44,x				;$BEDC26   |
CODE_BEDC28:					;	   |
	INC $2F,x				;$BEDC28   |
CODE_BEDC2A:					;	   |
	RTS					;$BEDC2A  /

CODE_BEDC2B:
	LDA $0D5B				;$BEDC2B  \
	BPL CODE_BEDC31				;$BEDC2E   |
	RTS					;$BEDC30  /

CODE_BEDC31:
	LDY current_sprite			;$BEDC31  \
	LDX $0595				;$BEDC33   |
	LDA $04,x				;$BEDC36   |
	LDX #$0000				;$BEDC38   |
	BIT #$0300				;$BEDC3B   |
	BEQ CODE_BEDC52				;$BEDC3E   |
	LDX #$0002				;$BEDC40   |
	BIT #$4000				;$BEDC43   |
	BEQ CODE_BEDC4B				;$BEDC46   |
	LDX #$0006				;$BEDC48   |
CODE_BEDC4B:					;	   |
	BIT #$0200				;$BEDC4B   |
	BEQ CODE_BEDC52				;$BEDC4E   |
	INX					;$BEDC50   |
	INX					;$BEDC51   |
CODE_BEDC52:					;	   |
	LDA.l DATA_BEDC5A,x			;$BEDC52   |
	STA $0050,y				;$BEDC56   |
	RTS					;$BEDC59  /

DATA_BEDC5A:
	db $00, $00, $04, $00, $F8, $FF, $08, $00
	db $F0, $FF


CODE_BEDC64:
	LDX current_sprite			;$BEDC64  \
	LDA $3E,x				;$BEDC66   |
	AND #$2000				;$BEDC68   |
	BNE CODE_BEDC94				;$BEDC6B   |
	LDA $24,x				;$BEDC6D   |
	BMI CODE_BEDC77				;$BEDC6F   |
	LDY #$0005				;$BEDC71   |
	JSR CODE_BEDCD8				;$BEDC74   |
CODE_BEDC77:					;	   |
	LDX current_sprite			;$BEDC77   |
	LDA $3E,x				;$BEDC79   |
	AND #$0020				;$BEDC7B   |
	BNE CODE_BEDC9C				;$BEDC7E   |
	LDA $24,x				;$BEDC80   |
	BPL CODE_BEDCC0				;$BEDC82   |
	LDY $0595				;$BEDC84   |
	LDA $0004,y				;$BEDC87   |
	AND #$8000				;$BEDC8A   |
	BEQ CODE_BEDCC0				;$BEDC8D   |
	LDY #$0002				;$BEDC8F   |
	BRA CODE_BEDCC3				;$BEDC92  /

CODE_BEDC94:
	LDY #$0001				;$BEDC94  \
	JSR CODE_BEDCD8				;$BEDC97   |
	BRA CODE_BEDCC0				;$BEDC9A  /

CODE_BEDC9C:
	LDY #$0002				;$BEDC9C  \
	LDA $4E,x				;$BEDC9F   |
	BEQ CODE_BEDCC3				;$BEDCA1   |
	BRA CODE_BEDCC0				;$BEDCA3  /

CODE_BEDCA5:
	LDA $0D5B				;$BEDCA5  \
	BPL CODE_BEDCB0				;$BEDCA8   |
	LDX current_sprite			;$BEDCAA   |
	STZ $20,x				;$BEDCAC   |
	BRA CODE_BEDCC0				;$BEDCAE  /

CODE_BEDCB0:
	LDY #$0002				;$BEDCB0  \
	JSR CODE_BEDCD8				;$BEDCB3   |
	LDX current_sprite			;$BEDCB6   |
	LDA $1F,x				;$BEDCB8   |
	AND #$0001				;$BEDCBA   |
	BEQ CODE_BEDCC0				;$BEDCBD   |
	RTS					;$BEDCBF  /

CODE_BEDCC0:
	LDY #$0004				;$BEDCC0  \
CODE_BEDCC3:					;	   |
	LDX current_sprite			;$BEDCC3   |
	LDA $24,x				;$BEDCC5   |
	CLC					;$BEDCC7   |
	ADC [$8E],y				;$BEDCC8   |
	BMI CODE_BEDCD5				;$BEDCCA   |
	LDY #$0006				;$BEDCCC   |
	CMP [$8E],y				;$BEDCCF   |
	BCC CODE_BEDCD5				;$BEDCD1   |
	LDA [$8E],y				;$BEDCD3   |
CODE_BEDCD5:					;	   |
	STA $24,x				;$BEDCD5   |
	RTS					;$BEDCD7  /

CODE_BEDCD8:
	PHK					;$BEDCD8  \
	PLB					;$BEDCD9   |
	STY $36					;$BEDCDA   |
	LDX current_sprite			;$BEDCDC   |
	LDA $3E,x				;$BEDCDE   |
	AND #$8000				;$BEDCE0   |
	BEQ CODE_BEDD17				;$BEDCE3   |
	LDA $4E,x				;$BEDCE5   |
	SEC					;$BEDCE7   |
	SBC #$0100				;$BEDCE8   |
	BCC CODE_BEDCF3				;$BEDCEB   |
	STA $4E,x				;$BEDCED   |
	STZ $50,x				;$BEDCEF   |
	BRA CODE_BEDD17				;$BEDCF1  /

CODE_BEDCF3:
	AND #$00FF				;$BEDCF3  \
	STA $32					;$BEDCF6   |
	LDA $2C,x				;$BEDCF8   |
	BPL CODE_BEDD03				;$BEDCFA   |
	CLC					;$BEDCFC   |
	ADC $32					;$BEDCFD   |
	BCC CODE_BEDD15				;$BEDCFF   |
	BRA CODE_BEDD08				;$BEDD01  /

CODE_BEDD03:
	SEC					;$BEDD03  \
	SBC $32					;$BEDD04   |
	BCS CODE_BEDD15				;$BEDD06   |
CODE_BEDD08:					;	   |
	STZ $2C,x				;$BEDD08   |
	STZ $4E,x				;$BEDD0A   |
	LDA $3E,x				;$BEDD0C   |
	AND #$7FFF				;$BEDD0E   |
	STA $3E,x				;$BEDD11   |
	BRA CODE_BEDD17				;$BEDD13  /

CODE_BEDD15:
	STA $2C,x				;$BEDD15  \
CODE_BEDD17:					;	   |
	LDX current_sprite			;$BEDD17   |
	LDA $0A,x				;$BEDD19   |
	SEC					;$BEDD1B   |
	SBC $1C,x				;$BEDD1C   |
	STA $32					;$BEDD1E   |
	ASL A					;$BEDD20   |
	CLC					;$BEDD21   |
	ADC $32					;$BEDD22   |
	STA $32					;$BEDD24   |
	LDA $2C,x				;$BEDD26   |
	BEQ CODE_BEDD39				;$BEDD28   |
	EOR $50,x				;$BEDD2A   |
	BPL CODE_BEDD39				;$BEDD2C   |
	LDA $2C,x				;$BEDD2E   |
	CLC					;$BEDD30   |
	ADC $50,x				;$BEDD31   |
	STA $2C,x				;$BEDD33   |
	LDA $2A,x				;$BEDD35   |
	BRA CODE_BEDD40				;$BEDD37  /

CODE_BEDD39:
	LDA $2A,x				;$BEDD39  \
	CLC					;$BEDD3B   |
	ADC $50,x				;$BEDD3C   |
	STA $2A,x				;$BEDD3E   |
CODE_BEDD40:					;	   |
	CLC					;$BEDD40   |
	ADC $2C,x				;$BEDD41   |
	BPL CODE_BEDD4A				;$BEDD43   |
	SEC					;$BEDD45   |
	SBC $32					;$BEDD46   |
	BRA CODE_BEDD4D				;$BEDD48  /

CODE_BEDD4A:
	CLC					;$BEDD4A  \
	ADC $32					;$BEDD4B   |
CODE_BEDD4D:					;	   |
	STA $34					;$BEDD4D   |
	CMP #$0080				;$BEDD4F   |
	BCC CODE_BEDD59				;$BEDD52   |
	CMP #$FF80				;$BEDD54   |
	BCC CODE_BEDD76				;$BEDD57   |
CODE_BEDD59:					;	   |
	LDA $10,x				;$BEDD59   |
	AND #$8007				;$BEDD5B   |
	CMP #$8000				;$BEDD5E   |
	ROL A					;$BEDD61   |
	ASL A					;$BEDD62   |
	TAY					;$BEDD63   |
	LDA DATA_BEDDF1,y			;$BEDD64   |
	CLC					;$BEDD67   |
	ADC $26,x				;$BEDD68   |
	CLC					;$BEDD6A   |
	ADC $50,x				;$BEDD6B   |
	STA $34					;$BEDD6D   |
	LDA $3E,x				;$BEDD6F   |
	BIT #$8000				;$BEDD71   |
	BEQ CODE_BEDDC2				;$BEDD74   |
CODE_BEDD76:					;	   |
	LDA $34					;$BEDD76   |
	BMI CODE_BEDD92				;$BEDD78   |
	LDA $22,x				;$BEDD7A   |
	CLC					;$BEDD7C   |
	ADC $2C,x				;$BEDD7D   |
	BMI CODE_BEDD85				;$BEDD7F   |
	CMP $34					;$BEDD81   |
	BCS CODE_BEDDA8				;$BEDD83   |
CODE_BEDD85:					;	   |
	LDA $28,x				;$BEDD85   |
	CLC					;$BEDD87   |
	ADC $2C,x				;$BEDD88   |
	BMI CODE_BEDDA8				;$BEDD8A   |
	CMP $34					;$BEDD8C   |
	BCS CODE_BEDDAC				;$BEDD8E   |
	BRA CODE_BEDDA8				;$BEDD90  /

CODE_BEDD92:
	LDA $22,x				;$BEDD92  \
	CLC					;$BEDD94   |
	ADC $2C,x				;$BEDD95   |
	BPL CODE_BEDDA8				;$BEDD97   |
	CMP $34					;$BEDD99   |
	BCS CODE_BEDDA8				;$BEDD9B   |
	LDA $28,x				;$BEDD9D   |
	CLC					;$BEDD9F   |
	ADC $2C,x				;$BEDDA0   |
	BPL CODE_BEDDAC				;$BEDDA2   |
	CMP $34					;$BEDDA4   |
	BCS CODE_BEDDAC				;$BEDDA6   |
CODE_BEDDA8:					;	   |
	STA $34					;$BEDDA8   |
	BRA CODE_BEDDC2				;$BEDDAA  /

CODE_BEDDAC:
	LDA $34					;$BEDDAC  \
	EOR $26,x				;$BEDDAE   |
	BPL CODE_BEDDD1				;$BEDDB0   |
	ASL $32					;$BEDDB2   |
	LDA $34					;$BEDDB4   |
	BPL CODE_BEDDBD				;$BEDDB6   |
	CLC					;$BEDDB8   |
	ADC $32					;$BEDDB9   |
	BRA CODE_BEDDC0				;$BEDDBB  /

CODE_BEDDBD:
	SEC					;$BEDDBD  \
	SBC $32					;$BEDDBE   |
CODE_BEDDC0:					;	   |
	STA $34					;$BEDDC0   |
CODE_BEDDC2:					;	   |
	LDA $0E,x				;$BEDDC2   |
	BNE CODE_BEDDD1				;$BEDDC4   |
	LDA $34					;$BEDDC6   |
	SEC					;$BEDDC8   |
	SBC $2C,x				;$BEDDC9   |
	STA $2A,x				;$BEDDCB   |
	LDA $0A,x				;$BEDDCD   |
	STA $1C,x				;$BEDDCF   |
CODE_BEDDD1:					;	   |
	STZ $50,x				;$BEDDD1   |
	LDA $34					;$BEDDD3   |
	STA $26,x				;$BEDDD5   |
	LDY $36					;$BEDDD7   |
	BEQ CODE_BEDDEE				;$BEDDD9   |
	SEC					;$BEDDDB   |
	SBC $20,x				;$BEDDDC   |
CODE_BEDDDE:					;	   |
	CMP #$8000				;$BEDDDE   |
	ROR A					;$BEDDE1   |
	DEY					;$BEDDE2   |
	BNE CODE_BEDDDE				;$BEDDE3   |
	CLC					;$BEDDE5   |
	ADC $20,x				;$BEDDE6   |
	CMP $20,x				;$BEDDE8   |
	BNE CODE_BEDDEE				;$BEDDEA   |
	LDA $34					;$BEDDEC   |
CODE_BEDDEE:					;	   |
	STA $20,x				;$BEDDEE   |
	RTS					;$BEDDF0  /

DATA_BEDDF1:
	db $00, $00, $00, $00, $FF, $FF, $01, $00
	db $FE, $FF, $02, $00, $FD, $FF, $03, $00
	db $FC, $FF, $04, $00, $FB, $FF, $05, $00

CODE_BEDE09:
	LDX current_sprite			;$BEDE09  \
	LDA $4A,x				;$BEDE0B   |
	STA $06,x				;$BEDE0D   |
	LDA $4C,x				;$BEDE0F   |
	STA $0A,x				;$BEDE11   |
	SEP #$20				;$BEDE13   |
	LDA $1E,x				;$BEDE15   |
	STA $1F,x				;$BEDE17   |
	LSR A					;$BEDE19   |
	LSR A					;$BEDE1A   |
	LSR A					;$BEDE1B   |
	LSR A					;$BEDE1C   |
	STA $1E,x				;$BEDE1D   |
	REP #$20				;$BEDE1F   |
	BIT $24,x				;$BEDE21   |
	BMI CODE_BEDE3F				;$BEDE23   |
	JSR CODE_BEDEA8				;$BEDE25   |
	BCC CODE_BEDE3A				;$BEDE28   |
	BNE CODE_BEDE6B				;$BEDE2A   |
	JSR CODE_BEDF72				;$BEDE2C   |
	SEC					;$BEDE2F   |
	SBC $0C,x				;$BEDE30   |
	BCC CODE_BEDE4E				;$BEDE32   |
	BIT $0E,x				;$BEDE34   |
	BMI CODE_BEDE4E				;$BEDE36   |
	BRA CODE_BEDE6B				;$BEDE38  /

CODE_BEDE3A:
	JSR CODE_BEDF72				;$BEDE3A  \
	BRA CODE_BEDE5D				;$BEDE3D  /

CODE_BEDE3F:
	JSR CODE_BEDF72				;$BEDE3F  \
	JSR CODE_BEDEA8				;$BEDE42   |
	BCC CODE_BEDE5D				;$BEDE45   |
	BNE CODE_BEDE6B				;$BEDE47   |
	LDA $0A,x				;$BEDE49   |
	SEC					;$BEDE4B   |
	SBC $0C,x				;$BEDE4C   |
CODE_BEDE4E:					;	   |
	EOR #$FFFF				;$BEDE4E   |
	INC A					;$BEDE51   |
	STA $0E,x				;$BEDE52   |
	LDA $AC					;$BEDE54   |
	STA $10,x				;$BEDE56   |
	STZ $52,x				;$BEDE58   |
	CLC					;$BEDE5A   |
	BRA CODE_BEDE97				;$BEDE5B  /

CODE_BEDE5D:
	STZ $0C,x				;$BEDE5D  \
	LDA #$8090				;$BEDE5F   |
	STA $0E,x				;$BEDE62   |
	STZ $10,x				;$BEDE64   |
	STZ $52,x				;$BEDE66   |
	CLC					;$BEDE68   |
	BRA CODE_BEDE97				;$BEDE69  /

CODE_BEDE6B:
	LDA $74					;$BEDE6B  \
	STA $0A,x				;$BEDE6D   |
	STZ $0E,x				;$BEDE6F   |
	LDA $1E,x				;$BEDE71   |
	ORA #$0001				;$BEDE73   |
	STA $1E,x				;$BEDE76   |
	LDA #$0100				;$BEDE78   |
	STA $24,x				;$BEDE7B   |
	LDA $AC					;$BEDE7D   |
	STA $10,x				;$BEDE7F   |
	LDA #$0010				;$BEDE81   |
	BIT $2C,x				;$BEDE84   |
	BPL CODE_BEDE8B				;$BEDE86   |
	LDA #$FFF0				;$BEDE88   |
CODE_BEDE8B:					;	   |
	CLC					;$BEDE8B   |
	ADC $06,x				;$BEDE8C   |
	JSL CODE_B5C3D5				;$BEDE8E   |
	LDA $AC					;$BEDE92   |
	STA $52,x				;$BEDE94   |
	SEC					;$BEDE96   |
CODE_BEDE97:					;	   |
	LDA $4A,x				;$BEDE97   |
	LDY $06,x				;$BEDE99   |
	STA $06,x				;$BEDE9B   |
	STY $4A,x				;$BEDE9D   |
	LDA $4C,x				;$BEDE9F   |
	LDY $0A,x				;$BEDEA1   |
	STA $0A,x				;$BEDEA3   |
	STY $4C,x				;$BEDEA5   |
	RTS					;$BEDEA7  /

CODE_BEDEA8:
	STZ $60					;$BEDEA8  \
	LDA $20,x				;$BEDEAA   |
	BPL CODE_BEDEB9				;$BEDEAC   |
	EOR #$FFFF				;$BEDEAE   |
	INC A					;$BEDEB1   |
	CMP #$0010				;$BEDEB2   |
	BCC CODE_BEDEB9				;$BEDEB5   |
	DEC $60					;$BEDEB7   |
CODE_BEDEB9:					;	   |
	LSR A					;$BEDEB9   |
	LSR A					;$BEDEBA   |
	LSR A					;$BEDEBB   |
	LSR A					;$BEDEBC   |
	STA $5E					;$BEDEBD   |
	LDA $10,x				;$BEDEBF   |
	AND #$0007				;$BEDEC1   |
	BEQ CODE_BEDEF3				;$BEDEC4   |
	CMP #$0005				;$BEDEC6   |
	BNE CODE_BEDED4				;$BEDEC9   |
	BIT $24,x				;$BEDECB   |
	BPL CODE_BEDED4				;$BEDECD   |
	BIT $10,x				;$BEDECF   |
	BMI CODE_BEDED4				;$BEDED1   |
	INC A					;$BEDED3   |
CODE_BEDED4:					;	   |
	PHK					;$BEDED4   |
	PLB					;$BEDED5   |
	SEP #$20				;$BEDED6   |
	TAY					;$BEDED8   |
	LDA DATA_BEDF6B,y			;$BEDED9   |
	STA CPU.multiply_A			;$BEDEDC   |
	LDA $5E					;$BEDEDF   |
	STA CPU.multiply_B			;$BEDEE1   |
	LDA $60					;$BEDEE4   |
	ASL A					;$BEDEE6   |
	REP #$20				;$BEDEE7   |
	LDA CPU.multiply_result			;$BEDEE9   |
	BCC CODE_BEDEFC				;$BEDEEC   |
	EOR #$FFFF				;$BEDEEE   |
	BRA CODE_BEDEFC				;$BEDEF1  /

CODE_BEDEF3:
	STZ $60					;$BEDEF3  \
	LDA $20,x				;$BEDEF5   |
	CLC					;$BEDEF7   |
	BPL CODE_BEDEFC				;$BEDEF8   |
	DEC $60					;$BEDEFA   |
CODE_BEDEFC:					;	   |
	ADC $05,x				;$BEDEFC   |
	STA $05,x				;$BEDEFE   |
	SEP #$20				;$BEDF00   |
	LDA $60					;$BEDF02   |
	ADC $07,x				;$BEDF04   |
	STA $07,x				;$BEDF06   |
	REP #$20				;$BEDF08   |
	LDA #$0100				;$BEDF0A   |
	CMP $06,x				;$BEDF0D   |
	BCS CODE_BEDF1B				;$BEDF0F   |
	LDA $0AFC				;$BEDF11   |
	ADC #$00FF				;$BEDF14   |
	CMP $06,x				;$BEDF17   |
	BCS CODE_BEDF1F				;$BEDF19   |
CODE_BEDF1B:					;	   |
	STZ $04,x				;$BEDF1B   |
	STA $06,x				;$BEDF1D   |
CODE_BEDF1F:					;	   |
	JSL CODE_B5C3E1				;$BEDF1F   |
	EOR #$FFFF				;$BEDF23   |
	BMI CODE_BEDF37				;$BEDF26   |
	LDA $0A,x				;$BEDF28   |
	CLC					;$BEDF2A   |
	ADC #$0040				;$BEDF2B   |
	JSL CODE_B5C3E3				;$BEDF2E   |
	EOR #$FFFF				;$BEDF32   |
	BPL CODE_BEDF69				;$BEDF35   |
CODE_BEDF37:					;	   |
	SEC					;$BEDF37   |
	ADC #$6300				;$BEDF38   |
	STA $74					;$BEDF3B   |
	STA $0C,x				;$BEDF3D   |
	SEC					;$BEDF3F   |
	SBC $0A,x				;$BEDF40   |
	BEQ CODE_BEDF64				;$BEDF42   |
	BMI CODE_BEDF56				;$BEDF44   |
	STA $0E,x				;$BEDF46   |
	CMP #$0011				;$BEDF48   |
	BCS CODE_BEDF5F				;$BEDF4B   |
	LDA $1F,x				;$BEDF4D   |
	AND #$0001				;$BEDF4F   |
	BNE CODE_BEDF64				;$BEDF52   |
	BRA CODE_BEDF5F				;$BEDF54  /

CODE_BEDF56:
	LDY $0E,x				;$BEDF56  \
	CPY #$0011				;$BEDF58   |
	BCC CODE_BEDF64				;$BEDF5B   |
	STA $0E,x				;$BEDF5D   |
CODE_BEDF5F:					;	   |
	LDA #$0000				;$BEDF5F   |
	SEC					;$BEDF62   |
	RTS					;$BEDF63  /

CODE_BEDF64:
	LDA #$0001				;$BEDF64  \
	SEC					;$BEDF67   |
	RTS					;$BEDF68  /

CODE_BEDF69:
	CLC					;$BEDF69  \
	RTS					;$BEDF6A  /

DATA_BEDF6B:
	db $00, $10, $0E, $0D, $0B, $08, $06

CODE_BEDF72:
	LDA $24,x				;$BEDF72  \
	CLC					;$BEDF74   |
	ADC $09,x				;$BEDF75   |
	STA $09,x				;$BEDF77   |
	SEP #$20				;$BEDF79   |
	LDA #$00				;$BEDF7B   |
	BIT $25,x				;$BEDF7D   |
	BPL CODE_BEDF82				;$BEDF7F   |
	DEC A					;$BEDF81   |
CODE_BEDF82:					;	   |
	ADC $0B,x				;$BEDF82   |
	STA $0B,x				;$BEDF84   |
	REP #$20				;$BEDF86   |
	XBA					;$BEDF88   |
	RTS					;$BEDF89  /

CODE_BEDF8A:
	LDA $0A36				;$BEDF8A  \
	AND #$0004				;$BEDF8D   |
	BNE CODE_BEDFDC				;$BEDF90   |
	LDX current_sprite			;$BEDF92   |
	LDA $20,x				;$BEDF94   |
	BEQ CODE_BEDFDC				;$BEDF96   |
	LDA $1E,x				;$BEDF98   |
	AND #$0101				;$BEDF9A   |
	CMP #$0001				;$BEDF9D   |
	BEQ CODE_BEDFF5				;$BEDFA0   |
	CMP #$0101				;$BEDFA2   |
	BNE CODE_BEDFDC				;$BEDFA5   |
	LDA $10,x				;$BEDFA7   |
	AND #$0007				;$BEDFA9   |
	CMP #$0004				;$BEDFAC   |
	BCS CODE_BEDFDC				;$BEDFAF   |
	LDA $20,x				;$BEDFB1   |
	BMI CODE_BEDFDC				;$BEDFB3   |
	JSL CODE_808E4F				;$BEDFB5   |
	LSR A					;$BEDFB9   |
	CMP $20,x				;$BEDFBA   |
	BCS CODE_BEDFDC				;$BEDFBC   |
	LSR A					;$BEDFBE   |
	BCC CODE_BEDFDD				;$BEDFBF   |
	LDA $48,x				;$BEDFC1   |
	BNE CODE_BEDFDC				;$BEDFC3   |
	JSR CODE_BEE010				;$BEDFC5   |
	BCS CODE_BEDFDC				;$BEDFC8   |
	LDX alternate_sprite			;$BEDFCA   |
	LDY current_sprite			;$BEDFCC   |
	STY $42,x				;$BEDFCE   |
	STX $48,y				;$BEDFD0   |
	LDA #$0013				;$BEDFD2   |
	STA $44,x				;$BEDFD5   |
	INC $2E,x				;$BEDFD7   |
	JMP CODE_BECEE5				;$BEDFD9  /

CODE_BEDFDC:
	RTS					;$BEDFDC  /

CODE_BEDFDD:
	LDA $46,x				;$BEDFDD  \
	BNE CODE_BEDFDC				;$BEDFDF   |
	JSR CODE_BEE010				;$BEDFE1   |
	BCS CODE_BEDFDC				;$BEDFE4   |
	LDX alternate_sprite			;$BEDFE6   |
	LDY current_sprite			;$BEDFE8   |
	STY $42,x				;$BEDFEA   |
	STX $46,y				;$BEDFEC   |
	STZ $44,x				;$BEDFEE   |
	INC $2E,x				;$BEDFF0   |
	JMP CODE_BECEE5				;$BEDFF2  /

CODE_BEDFF5:
	LDA $46,x				;$BEDFF5  \
	BNE CODE_BEDFDC				;$BEDFF7   |
	JSR CODE_BEE010				;$BEDFF9   |
	BCS CODE_BEDFDC				;$BEDFFC   |
	LDX alternate_sprite			;$BEDFFE   |
	LDY current_sprite			;$BEE000   |
	STY $42,x				;$BEE002   |
	STX $46,y				;$BEE004   |
	STZ $44,x				;$BEE006   |
	LDA #$000A				;$BEE008   |
	STA $46,x				;$BEE00B   |
	JMP CODE_BECEE5				;$BEE00D  /

CODE_BEE010:
	LDA $19AC				;$BEE010  \
	DEC A					;$BEE013   |
	ASL A					;$BEE014   |
	BCS CODE_BEE023				;$BEE015   |
	LDY #$009A				;$BEE017   |
	JSL CODE_BB842C				;$BEE01A   |
	BCS CODE_BEE023				;$BEE01E   |
	DEC $19AD				;$BEE020   |
CODE_BEE023:					;	   |
	RTS					;$BEE023  /

CODE_BEE024:
	LDX current_sprite			;$BEE024  \
	LDA $4A,x				;$BEE026   |
	CMP $06,x				;$BEE028   |
	BCC CODE_BEE070				;$BEE02A   |
	LDA $5C,x				;$BEE02C   |
	STA $32					;$BEE02E   |
	LDA $90					;$BEE030   |
	STA $34					;$BEE032   |
	LDA [$32]				;$BEE034   |
	CMP $4A,x				;$BEE036   |
	BCS CODE_BEE070				;$BEE038   |
	CMP $06,x				;$BEE03A   |
	BCC CODE_BEE068				;$BEE03C   |
	LDY #$0002				;$BEE03E   |
	LDA [$32],y				;$BEE041   |
	BEQ CODE_BEE051				;$BEE043   |
	SEC					;$BEE045   |
	SBC $0C,x				;$BEE046   |
	CLC					;$BEE048   |
	ADC #$0008				;$BEE049   |
	CMP #$0010				;$BEE04C   |
	BCS CODE_BEE068				;$BEE04F   |
CODE_BEE051:					;	   |
	LDY #$0004				;$BEE051   |
	LDA [$32],y				;$BEE054   |
	BIT #$1000				;$BEE056   |
	BNE CODE_BEE071				;$BEE059   |
	BIT #$0020				;$BEE05B   |
	BEQ CODE_BEE064				;$BEE05E   |
	LDY $0E,x				;$BEE060   |
	STY $4E,x				;$BEE062   |
CODE_BEE064:					;	   |
	EOR $3E,x				;$BEE064   |
	STA $3E,x				;$BEE066   |
CODE_BEE068:					;	   |
	LDA $5C,x				;$BEE068   |
	CLC					;$BEE06A   |
	ADC #$0006				;$BEE06B   |
	STA $5C,x				;$BEE06E   |
CODE_BEE070:					;	   |
	RTS					;$BEE070  /

CODE_BEE071:
	LDY #$0006				;$BEE071  \
	LDA [$32],y				;$BEE074   |
	STA $22,x				;$BEE076   |
	INC $5C,x				;$BEE078   |
	INC $5C,x				;$BEE07A   |
	BRA CODE_BEE068				;$BEE07C  /

CODE_BEE07E:
	LDA $0A36				;$BEE07E  \
	BIT #$0004				;$BEE081   |
	BEQ CODE_BEE096				;$BEE084   |
	LDY current_sprite			;$BEE086   |
	LDA $002E,y				;$BEE088   |
	AND #$00FF				;$BEE08B   |
	CMP #$0006				;$BEE08E   |
	BEQ CODE_BEE096				;$BEE091   |
	JML [$05A9]				;$BEE093  /

CODE_BEE096:
	JSR CODE_BEB82A				;$BEE096  /

DATA_BEE099:
	dw CODE_BEE0A9
	dw CODE_BEE0CA
	dw CODE_BEE105
	dw CODE_BEE11D
	dw CODE_BEE13C
	dw CODE_BEE1A6
	dw CODE_BEE206
	dw CODE_BEE231


CODE_BEE0A9:
	STY $0D5A				;$BEE0A9  \
	TYX					;$BEE0AC   |
	INC $2E,x				;$BEE0AD   |
	STZ $1C,x				;$BEE0AF   |
	STZ $32,x				;$BEE0B1   |
	STZ $36,x				;$BEE0B3   |
if !version == 1				;	   |
	STZ $52,x				;$BEE0B5   |
endif						;	   |
	LDA $04,x				;$BEE0B7   |
	BEQ CODE_BEE0C7				;$BEE0B9   |
	CLC					;$BEE0BB   |
	ADC #$2EEE				;$BEE0BC   |
	TAX					;$BEE0BF   |
	LDA #$20FD				;$BEE0C0   |
	JSL CODE_B3A3B4				;$BEE0C3   |
CODE_BEE0C7:					;	   |
	JML [$05A9]				;$BEE0C7  /

CODE_BEE0CA:
	LDA $001C,y				;$BEE0CA  \
	BNE CODE_BEE0DD				;$BEE0CD   |
	JSR CODE_BEE2D8				;$BEE0CF   |
	JSL CODE_B3CB55				;$BEE0D2   |
	JSL CODE_BEF039				;$BEE0D6   |
	JML [$05A9]				;$BEE0DA  /

CODE_BEE0DD:
	LDY #$00E0				;$BEE0DD  \
	JSL CODE_BB842C				;$BEE0E0   |
	BCS CODE_BEE102				;$BEE0E4   |
	LDX current_sprite			;$BEE0E6   |
	LDY alternate_sprite			;$BEE0E8   |
	LDA $1C,x				;$BEE0EA   |
	STA $0046,y				;$BEE0EC   |
	AND #$FF00				;$BEE0EF   |
	STA $0048,y				;$BEE0F2   |
	STA $0047,y				;$BEE0F5   |
	LDA #$0000				;$BEE0F8   |
	STA $0044,y				;$BEE0FB   |
	STY $1C,x				;$BEE0FE   |
	INC $2E,x				;$BEE100   |
CODE_BEE102:					;	   |
	JML [$05A9]				;$BEE102  /

CODE_BEE105:
	JSR CODE_BEE24E				;$BEE105  \
	BMI CODE_BEE10C				;$BEE108   |
	BNE CODE_BEE16F				;$BEE10A   |
CODE_BEE10C:					;	   |
	JSR CODE_BEE284				;$BEE10C   |
	JSR CODE_BEE2D8				;$BEE10F   |
	JSL CODE_B3CB55				;$BEE112   |
	JSL CODE_BEF039				;$BEE116   |
	JML [$05A9]				;$BEE11A  /

CODE_BEE11D:
	JSR CODE_BEE24E				;$BEE11D  \
	BMI CODE_BEE131				;$BEE120   |
	CMP #$0001				;$BEE122   |
	BEQ CODE_BEE12B				;$BEE125   |
	BCC CODE_BEE167				;$BEE127   |
	BCS CODE_BEE177				;$BEE129   |
CODE_BEE12B:					;	   |
	JSR CODE_BEE284				;$BEE12B   |
	JSR CODE_BEE2D8				;$BEE12E   |
CODE_BEE131:					;	   |
	JSL CODE_B3CB55				;$BEE131   |
	JSL CODE_BEF039				;$BEE135   |
	JML [$05A9]				;$BEE139  /

CODE_BEE13C:
	JSR CODE_BEE24E				;$BEE13C  \
	BMI CODE_BEE15C				;$BEE13F   |
	CMP #$0002				;$BEE141   |
	BEQ CODE_BEE14A				;$BEE144   |
	BCC CODE_BEE16F				;$BEE146   |
	BCS CODE_BEE17F				;$BEE148   |
CODE_BEE14A:					;	   |
	LDA global_frame_counter		;$BEE14A   |
	LSR A					;$BEE14C   |
	BCC CODE_BEE156				;$BEE14D   |
	LDA $12,x				;$BEE14F   |
	EOR #$0200				;$BEE151   |
	STA $12,x				;$BEE154   |
CODE_BEE156:					;	   |
	JSR CODE_BEE284				;$BEE156   |
	JSR CODE_BEE2D8				;$BEE159   |
CODE_BEE15C:					;	   |
	JSL CODE_B3CB55				;$BEE15C   |
	JSL CODE_BEF039				;$BEE160   |
	JML [$05A9]				;$BEE164  /

CODE_BEE167:
	LDA #$0002				;$BEE167  \
	LDY #$1502				;$BEE16A   |
	BRA CODE_BEE18D				;$BEE16D  /

CODE_BEE16F:
	LDA #$0003				;$BEE16F  \
	LDY #$1502				;$BEE172   |
	BRA CODE_BEE18D				;$BEE175  /

CODE_BEE177:
	LDA #$0004				;$BEE177  \
	LDY #$0000				;$BEE17A   |
	BRA CODE_BEE18D				;$BEE17D  /

CODE_BEE17F:
	LDA #$0005				;$BEE17F  \
	LDY #$1702				;$BEE182   |
	BRA CODE_BEE18D				;$BEE185  /

CODE_BEE187:
	LDA #$0006				;$BEE187  \
	LDY #$1702				;$BEE18A   |
CODE_BEE18D:					;	   |
	SEP #$20				;$BEE18D   |
	STA $2E,x				;$BEE18F   |
	REP #$20				;$BEE191   |
	TYA					;$BEE193   |
	BEQ CODE_BEE198				;$BEE194   |
	STA $12,x				;$BEE196   |
CODE_BEE198:					;	   |
	JSR CODE_BEE2D8				;$BEE198   |
	JSL CODE_B3CB55				;$BEE19B   |
	JSL CODE_BEF039				;$BEE19F   |
	JML [$05A9]				;$BEE1A3  /

CODE_BEE1A6:
	JSR CODE_BEE284				;$BEE1A6  \
	JSL CODE_BCFB69				;$BEE1A9   |
	LDA #$000E				;$BEE1AD   |
	JSL CODE_BCFB7A				;$BEE1B0   |
	LDA #$0000				;$BEE1B4   |
	JSL CODE_BEBE8B				;$BEE1B7   |
	BCC CODE_BEE1F8				;$BEE1BB   |
	LDX current_sprite			;$BEE1BD   |
	LDA $08C2				;$BEE1BF   |
	AND #$4000				;$BEE1C2   |
	BNE CODE_BEE1D8				;$BEE1C5   |
	LDA #$0007				;$BEE1C7   |
	STA $52,x				;$BEE1CA   |
	LDA #$0404				;$BEE1CC   |
	STA $46,x				;$BEE1CF   |
	LDA #$0040				;$BEE1D1   |
	STA $26,x				;$BEE1D4   |
	BRA CODE_BEE187				;$BEE1D6  /

CODE_BEE1D8:
	LDY $1C,x				;$BEE1D8  \
	LDA $36,x				;$BEE1DA   |
	CMP #$0005				;$BEE1DC   |
	BCS CODE_BEE1E4				;$BEE1DF   |
	LDA #$0005				;$BEE1E1   |
CODE_BEE1E4:					;	   |
	STA $0046,y				;$BEE1E4   |
	LDA #$0006				;$BEE1E7   |
	STA $002E,y				;$BEE1EA   |
	LDA #$076D				;$BEE1ED   |
	JSL queue_sound_effect			;$BEE1F0   |
	LDX current_sprite			;$BEE1F4   |
	BRA CODE_BEE187				;$BEE1F6  /

CODE_BEE1F8:
	JSR CODE_BEE2D8				;$BEE1F8  \
	JSL CODE_B3CB55				;$BEE1FB   |
	JSL CODE_BEF039				;$BEE1FF   |
	JML [$05A9]				;$BEE203  /

CODE_BEE206:
	JSR CODE_BEE284				;$BEE206  \
	TYA					;$BEE209   |
	BNE CODE_BEE220				;$BEE20A   |
	LDA $08C2				;$BEE20C   |
	AND #$2000				;$BEE20F   |
	BEQ CODE_BEE21D				;$BEE212   |
	LDA #$076D				;$BEE214   |
	JSL queue_sound_effect			;$BEE217   |
	LDX current_sprite			;$BEE21B   |
CODE_BEE21D:					;	   |
	BRL CODE_BEE167				;$BEE21D  /

CODE_BEE220:
	JSR CODE_BEE2D8				;$BEE220  \
	JSR CODE_BEE24E				;$BEE223   |
	JSL CODE_B3CB55				;$BEE226   |
	JSL CODE_BEF039				;$BEE22A   |
	JML [$05A9]				;$BEE22E  /

CODE_BEE231:
	TYX					;$BEE231  \
	STZ $1C,x				;$BEE232   |
	JSR CODE_BEE284				;$BEE234   |
	JSR CODE_BEE2D8				;$BEE237   |
	JSL CODE_B3CB55				;$BEE23A   |
	JSL CODE_BEF039				;$BEE23E   |
	JSL CODE_BBBB99				;$BEE242   |
	BCC CODE_BEE24B				;$BEE246   |
	STZ $0D5A				;$BEE248   |
CODE_BEE24B:					;	   |
	JML [$05A9]				;$BEE24B  /

CODE_BEE24E:
	LDX current_sprite			;$BEE24E  \
	LDA $32,x				;$BEE250   |
	STZ $32,x				;$BEE252   |
	BPL CODE_BEE261				;$BEE254   |
	LDA #$0007				;$BEE256   |
	STA $2E,x				;$BEE259   |
	STZ $1C,x				;$BEE25B   |
	LDA #$FFFF				;$BEE25D   |
	RTS					;$BEE260  /

CODE_BEE261:
	LDY $1C,x				;$BEE261  \
	BEQ CODE_BEE280				;$BEE263   |
	LDA $0046,y				;$BEE265   |
	BMI CODE_BEE280				;$BEE268   |
	CMP #$0003				;$BEE26A   |
	BCC CODE_BEE27C				;$BEE26D   |
	CMP #$0006				;$BEE26F   |
	BCC CODE_BEE278				;$BEE272   |
	LDA #$0000				;$BEE274   |
	RTS					;$BEE277  /

CODE_BEE278:
	LDA #$0001				;$BEE278  \
	RTS					;$BEE27B  /

CODE_BEE27C:
	LDA #$0002				;$BEE27C  \
	RTS					;$BEE27F  /

CODE_BEE280:
	LDA #$0003				;$BEE280  \
	RTS					;$BEE283  /

CODE_BEE284:
	LDX current_sprite			;$BEE284  \
	LDY $1C,x				;$BEE286   |
	SEP #$20				;$BEE288   |
	LDA $0046,y				;$BEE28A   |
	CMP #$0A				;$BEE28D   |
	BCC CODE_BEE2A1				;$BEE28F   |
	ADC #$09				;$BEE291   |
	STA CPU.multiply_A			;$BEE293   |
	LDA $0048,y				;$BEE296   |
	STA CPU.multiply_B			;$BEE299   |
	LDA $0049,y				;$BEE29C   |
	BRA CODE_BEE2AF				;$BEE29F  /

CODE_BEE2A1:
	STA CPU.multiply_A			;$BEE2A1  \
	LDA $0048,y				;$BEE2A4   |
	ASL A					;$BEE2A7   |
	STA CPU.multiply_B			;$BEE2A8   |
	LDA $0049,y				;$BEE2AB   |
	ASL A					;$BEE2AE   |
CODE_BEE2AF:					;	   |
	REP #$20				;$BEE2AF   |
	AND #$00FF				;$BEE2B1   |
	CLC					;$BEE2B4   |
	ADC CPU.multiply_result			;$BEE2B5   |
	LSR A					;$BEE2B8   |
	LSR A					;$BEE2B9   |
	LSR A					;$BEE2BA   |
	LSR A					;$BEE2BB   |
	CLC					;$BEE2BC   |
	ADC #$000C				;$BEE2BD   |
	CMP #$0058				;$BEE2C0   |
	BCC CODE_BEE2C8				;$BEE2C3   |
	LDA #$0058				;$BEE2C5   |
CODE_BEE2C8:					;	   |
	CMP $5C,x				;$BEE2C8   |
	BEQ CODE_BEE2D4				;$BEE2CA   |
	BCC CODE_BEE2D1				;$BEE2CC   |
	INC $5C,x				;$BEE2CE   |
	RTS					;$BEE2D0  /

CODE_BEE2D1:
	DEC $5C,x				;$BEE2D1  \
	RTS					;$BEE2D3  /

CODE_BEE2D4:
	LDY #$0000				;$BEE2D4  \
	RTS					;$BEE2D7  /

CODE_BEE2D8:
	RTS					;$BEE2D8  /

if !version == 0				;	  \
CODE_BEE2DA:					;	   |
	LDA #$8000				;$BEE2D9   |
	TSB $0AB8				;$BEE2DC   |
	LDX current_sprite			;$BEE2DF   |
	LDY $0593				;$BEE2E1   |
	LDA $0006,Y				;$BEE2E4   |
	SEC					;$BEE2E7   |
	SBC $42,X				;$BEE2E8   |
	BMI CODE_BEE2E5				;$BEE2EA   |
	BEQ CODE_BEE2EF				;$BEE2EC   |
	EOR #$FFFF				;$BEE2EE   |
	INC A					;$BEE2F0   |
						;	   |
CODE_BEE2E5:					;	   |
	SEC					;$BEE2F1   |
	ROR A					;$BEE2F2   |
	CMP #$FFE0				;$BEE2F3   |
	BCS CODE_BEE2EF				;$BEE2F6   |
	LDA #$FFE0				;$BEE2F8   |
						;	   |
CODE_BEE2EF:					;	   |
	CLC					;$BEE2FB   |
	ADC #$0020				;$BEE2FC   |
	AND #$00FF				;$BEE2FF   |
	XBA					;$BEE302   |
	LSR A					;$BEE303   |
	STA $0AEE				;$BEE304   |
	RTS					;$BEE307   |
endif						;	  /

CODE_BEE2D9:					;	  \
	LDA $0A36				;$BEE2D9   |
	BIT #$0004				;$BEE2DC   |
	BEQ CODE_BEE2F1				;$BEE2DF   |
	LDY current_sprite			;$BEE2E1   |
	LDA $002E,y				;$BEE2E3   |
	AND #$00FF				;$BEE2E6   |
	CMP #$0006				;$BEE2E9   |
	BEQ CODE_BEE2F1				;$BEE2EC   |
	JML [$05A9]				;$BEE2EE  /

CODE_BEE2F1:
	LDY current_sprite			;$BEE2F1  \
	LDX $0D5A				;$BEE2F3   |
	BEQ CODE_BEE312				;$BEE2F6   |
	LDA $1C,x				;$BEE2F8   |
	BEQ CODE_BEE312				;$BEE2FA   |
	LDA $002E,y				;$BEE2FC   |
	ASL A					;$BEE2FF   |
	TAX					;$BEE300   |
	JMP (DATA_BEE304,x)			;$BEE301  /

DATA_BEE304:
	dw CODE_BEE328
	dw CODE_BEE359
	dw CODE_BEE370
	dw CODE_BEE373
	dw CODE_BEE376
	dw CODE_BEE39C
	dw CODE_BEE3CA


CODE_BEE312:
	PHY					;$BEE312  \
	LDX $4A,y				;$BEE313   |
	STX current_sprite			;$BEE315   |
	JSL CODE_BB82B8				;$BEE317   |
	PLY					;$BEE31B   |
	STY current_sprite			;$BEE31C   |
	JSL CODE_BB82B8				;$BEE31E   |
	STZ $097F				;$BEE322   |
	JML [$05A9]				;$BEE325  /

CODE_BEE328:
	LDY #$00CC				;$BEE328  \
	JSL CODE_BB842C				;$BEE32B   |
	BCS CODE_BEE356				;$BEE32F   |
	LDX current_sprite			;$BEE331   |
	LDY alternate_sprite			;$BEE333   |
	STY $4A,x				;$BEE335   |
	LDA $06,x				;$BEE337   |
	CLC					;$BEE339   |
	ADC #$0100				;$BEE33A   |
	STA $0006,y				;$BEE33D   |
	LDA $0A,x				;$BEE340   |
	STA $000A,y				;$BEE342   |
	INC $2E,x				;$BEE345   |
	LDA #$C000				;$BEE347   |
	STA $1C,x				;$BEE34A   |
	STX $097F				;$BEE34C   |
	STZ $42,x				;$BEE34F   |
	STZ $44,x				;$BEE351   |
	JSR CODE_BEE405				;$BEE353   |
CODE_BEE356:					;	   |
	JML [$05A9]				;$BEE356  /

CODE_BEE359:
	JSR CODE_BEE45B				;$BEE359  \
	JSR CODE_BEE3E8				;$BEE35C   |
	JSR CODE_BEE405				;$BEE35F   |
	LDX current_sprite			;$BEE362   |
	LDA $46,x				;$BEE364   |
	BPL CODE_BEE370				;$BEE366   |
	LDA #$0003				;$BEE368   |
	STA $2E,x				;$BEE36B   |
	JML [$05A9]				;$BEE36D  /

CODE_BEE370:
	JML [$05A9]				;$BEE370  /

CODE_BEE373:
	JML [$05A9]				;$BEE373  /

CODE_BEE376:
	TYX					;$BEE376  \
	SEP #$20				;$BEE377   |
	LDA $4C,x				;$BEE379   |
	DEC $4D,x				;$BEE37B   |
	BEQ CODE_BEE387				;$BEE37D   |
	REP #$20				;$BEE37F   |
	JSR CODE_BEE405				;$BEE381   |
	JML [$05A9]				;$BEE384  /

CODE_BEE387:
	STA $4D,x				;$BEE387  \
	REP #$20				;$BEE389   |
	INC $46,x				;$BEE38B   |
	DEC $42,x				;$BEE38D   |
	BNE CODE_BEE396				;$BEE38F   |
	LDA #$0001				;$BEE391   |
	STA $2E,x				;$BEE394   |
CODE_BEE396:					;	   |
	JSR CODE_BEE405				;$BEE396   |
	JML [$05A9]				;$BEE399  /

CODE_BEE39C:
	TYX					;$BEE39C  \
	SEP #$20				;$BEE39D   |
	LDA $4C,x				;$BEE39F   |
	DEC $4D,x				;$BEE3A1   |
	BEQ CODE_BEE3AD				;$BEE3A3   |
	REP #$20				;$BEE3A5   |
	JSR CODE_BEE405				;$BEE3A7   |
	JML [$05A9]				;$BEE3AA  /

CODE_BEE3AD:
	STA $4D,x				;$BEE3AD  \
	REP #$20				;$BEE3AF   |
	DEC $46,x				;$BEE3B1   |
	BPL CODE_BEE3BB				;$BEE3B3   |
	STZ $46,x				;$BEE3B5   |
	STZ $44,x				;$BEE3B7   |
	BRA CODE_BEE3BF				;$BEE3B9  /

CODE_BEE3BB:
	INC $44,x				;$BEE3BB  \
	BNE CODE_BEE3C4				;$BEE3BD   |
CODE_BEE3BF:					;	   |
	LDA #$0001				;$BEE3BF   |
	STA $2E,x				;$BEE3C2   |
CODE_BEE3C4:					;	   |
	JSR CODE_BEE405				;$BEE3C4   |
	JML [$05A9]				;$BEE3C7  /

CODE_BEE3CA:
	LDX current_sprite			;$BEE3CA  \
	LDA #$0001				;$BEE3CC   |
	JSR CODE_BEE41D				;$BEE3CF   |
	LDY $0D5A				;$BEE3D2   |
	LDA $002E,y				;$BEE3D5   |
	AND #$00FF				;$BEE3D8   |
	CMP #$0006				;$BEE3DB   |
	BEQ CODE_BEE3E5				;$BEE3DE   |
	LDA #$0001				;$BEE3E0   |
	STA $2E,x				;$BEE3E3   |
CODE_BEE3E5:					;	   |
	JML [$05A9]				;$BEE3E5  /

CODE_BEE3E8:
	LDX current_sprite			;$BEE3E8  \
	LDA $48,x				;$BEE3EA   |
	SEC					;$BEE3EC   |
	SBC #$0100				;$BEE3ED   |
	STA $48,x				;$BEE3F0   |
	BPL CODE_BEE404				;$BEE3F2   |
	XBA					;$BEE3F4   |
	EOR $48,x				;$BEE3F5   |
	AND #$FF00				;$BEE3F7   |
	EOR $48,x				;$BEE3FA   |
	STA $48,x				;$BEE3FC   |
	LDA $46,x				;$BEE3FE   |
	BMI CODE_BEE404				;$BEE400   |
	DEC $46,x				;$BEE402   |
CODE_BEE404:					;	   |
	RTS					;$BEE404  /

CODE_BEE405:
	LDX current_sprite			;$BEE405  \
	LDA $46,x				;$BEE407   |
	BMI CODE_BEE42B				;$BEE409   |
	BEQ CODE_BEE41D				;$BEE40B   |
	CMP #$0006				;$BEE40D   |
	BCS CODE_BEE42B				;$BEE410   |
	CMP #$0003				;$BEE412   |
	LDA #$0003				;$BEE415   |
	BCC CODE_BEE41D				;$BEE418   |
	LDA #$0007				;$BEE41A   |
CODE_BEE41D:					;	   |
	AND global_frame_counter		;$BEE41D   |
	BNE CODE_BEE42E				;$BEE41F   |
	LDA $097F				;$BEE421   |
	EOR current_sprite			;$BEE424   |
	STA $097F				;$BEE426   |
	BRA CODE_BEE42E				;$BEE429  /

CODE_BEE42B:
	STX $097F				;$BEE42B  \
CODE_BEE42E:					;	   |
	LDA $46,x				;$BEE42E   |
	BPL CODE_BEE435				;$BEE430   |
	LDA #$0000				;$BEE432   |
CODE_BEE435:					;	   |
	ASL A					;$BEE435   |
	TAX					;$BEE436   |
	LDA.l DATA_B3DE2C,x			;$BEE437   |
	STA $32					;$BEE43B   |
	LDX current_sprite			;$BEE43D   |
	AND #$00FF				;$BEE43F   |
	ASL A					;$BEE442   |
	ASL A					;$BEE443   |
	CLC					;$BEE444   |
	ADC #$2D40				;$BEE445   |
	STA $1A,x				;$BEE448   |
	LDY $4A,x				;$BEE44A   |
	LDA $33					;$BEE44C   |
	AND #$00FF				;$BEE44E   |
	ASL A					;$BEE451   |
	ASL A					;$BEE452   |
	CLC					;$BEE453   |
	ADC #$2D40				;$BEE454   |
	STA $001A,y				;$BEE457   |
	RTS					;$BEE45A  /

CODE_BEE45B:
	LDX current_sprite			;$BEE45B  \
	LDY #$0004				;$BEE45D   |
	LDA $42,x				;$BEE460   |
	BNE CODE_BEE469				;$BEE462   |
	LDA $44,x				;$BEE464   |
	BEQ CODE_BEE47D				;$BEE466   |
	INY					;$BEE468   |
CODE_BEE469:					;	   |
	STY $2E,x				;$BEE469   |
	LDA #$0404				;$BEE46B   |
	STA $4C,x				;$BEE46E   |
	SEP #$20				;$BEE470   |
	LDA $48,x				;$BEE472   |
	STA $49,x				;$BEE474   |
	REP #$20				;$BEE476   |
	STX $097F				;$BEE478   |
	SEC					;$BEE47B   |
	RTS					;$BEE47C  /

CODE_BEE47D:
	CLC					;$BEE47D  \
	RTS					;$BEE47E  /

CODE_BEE47F:
	LDY current_sprite			;$BEE47F  \
	LDA $0054,y				;$BEE481   |
	STA $8E					;$BEE484   |
	LDA $002E,y				;$BEE486   |
	AND #$00FF				;$BEE489   |
	ASL A					;$BEE48C   |
	TAX					;$BEE48D   |
	LDA $002F,y				;$BEE48E   |
	AND #$00FF				;$BEE491   |
	ASL A					;$BEE494   |
	JMP (DATA_BEE498,x)			;$BEE495  /

DATA_BEE498:
	dw CODE_BEE49E
	dw CODE_BEE4B8
	dw CODE_BEE5A1


CODE_BEE49E:
	TAX					;$BEE49E  \
	JMP (DATA_BEE4A2,x)			;$BEE49F  /

DATA_BEE4A2:
	dw CODE_BEE4AC
	dw CODE_BEE51A
	dw CODE_BEE54D
	dw CODE_BEE56E
	dw CODE_BEE584


CODE_BEE4AC:
	LDA $0042,y				;$BEE4AC  \
	BNE CODE_BEE4F4				;$BEE4AF   |
	JSL CODE_BB82B8				;$BEE4B1   |
	JML [$05A9]				;$BEE4B5  /

CODE_BEE4B8:
	TAX					;$BEE4B8  \
	JMP (DATA_BEE4BC,x)			;$BEE4B9  /

DATA_BEE4BC:
	dw CODE_BEE4C6
	dw CODE_BEE51A
	dw CODE_BEE54D
	dw CODE_BEE56E
	dw CODE_BEE584


CODE_BEE4C6:
	LDA #$0004				;$BEE4C6  \
	STA $0052,y				;$BEE4C9   |
	LDA #$0100				;$BEE4CC   |
	STA $0026,y				;$BEE4CF   |
	STA $0020,y				;$BEE4D2   |
	LDA #$F900				;$BEE4D5   |
	STA $0024,y				;$BEE4D8   |
	LDA $000A,y				;$BEE4DB   |
	SEC					;$BEE4DE   |
	SBC #$0018				;$BEE4DF   |
	STA $000A,y				;$BEE4E2   |
	LDA #$01B0				;$BEE4E5   |
	JSL CODE_B3A623				;$BEE4E8   |
	LDA #$0002				;$BEE4EC   |
	STA $2E,x				;$BEE4EF   |
CODE_BEE4F1:					;	   |
	JML [$05A9]				;$BEE4F1  /

CODE_BEE4F4:
	JSL CODE_B9D100				;$BEE4F4  \
	LDX current_sprite			;$BEE4F8   |
	LDA $2F,x				;$BEE4FA   |
	AND #$00FF				;$BEE4FC   |
	BNE CODE_BEE504				;$BEE4FF   |
	JML [$05A9]				;$BEE501  /

CODE_BEE504:
	LDY #$00E8				;$BEE504  \
	JSL CODE_BB842C				;$BEE507   |
	BCS CODE_BEE4F1				;$BEE50B   |
	LDX current_sprite			;$BEE50D   |
	LDY $42,x				;$BEE50F   |
	LDX alternate_sprite			;$BEE511   |
	LDA $0020,y				;$BEE513   |
	STA $20,x				;$BEE516   |
	STA $26,x				;$BEE518   |
CODE_BEE51A:					;	   |
	LDX current_sprite			;$BEE51A   |
	LDA $42,x				;$BEE51C   |
	BNE CODE_BEE529				;$BEE51E   |
	SEP #$20				;$BEE520   |
	STZ $2E,x				;$BEE522   |
	REP #$20				;$BEE524   |
	JML [$05A9]				;$BEE526  /

CODE_BEE529:
	LDX current_sprite			;$BEE529  \
	LDA $10,x				;$BEE52B   |
	STA $8E					;$BEE52D   |
	LDA [$8E]				;$BEE52F   |
	TAY					;$BEE531   |
	JSL CODE_BB8432				;$BEE532   |
	BCS CODE_BEE54A				;$BEE536   |
	JSR CODE_BEE5B8				;$BEE538   |
	LDX current_sprite			;$BEE53B   |
	LDA $54,x				;$BEE53D   |
	STA $8E					;$BEE53F   |
	INC $2F,x				;$BEE541   |
	JSR CODE_BEE61C				;$BEE543   |
	JSL CODE_BEE680				;$BEE546   |
CODE_BEE54A:					;	   |
	JML [$05A9]				;$BEE54A  /

CODE_BEE54D:
	LDA $0042,y				;$BEE54D  \
	BEQ CODE_BEE55C				;$BEE550   |
	JSL CODE_BEE680				;$BEE552   |
	JSR CODE_BEE61C				;$BEE556   |
	JML [$05A9]				;$BEE559  /

CODE_BEE55C:
	LDY current_sprite			;$BEE55C  \
	LDX $1E,y				;$BEE55E   |
	BEQ CODE_BEE56B				;$BEE560   |
	LDA $52,x				;$BEE562   |
	AND #$FF7F				;$BEE564   |
	STA $52,x				;$BEE567   |
	STZ $1E,x				;$BEE569   |
CODE_BEE56B:					;	   |
	BRL CODE_BEE4C6				;$BEE56B  /

CODE_BEE56E:
	TYX					;$BEE56E  \
	STZ $10,x				;$BEE56F   |
	INC $2F,x				;$BEE571   |
	LDX $1E,y				;$BEE573   |
	BEQ CODE_BEE584				;$BEE575   |
	LDA $52,x				;$BEE577   |
	AND #$FF7F				;$BEE579   |
	STA $52,x				;$BEE57C   |
	LDA $3F,x				;$BEE57E   |
	BMI CODE_BEE584				;$BEE580   |
	STZ $1E,x				;$BEE582   |
CODE_BEE584:					;	   |
	LDY current_sprite			;$BEE584   |
	LDX $1E,y				;$BEE586   |
	BEQ CODE_BEE591				;$BEE588   |
	JSL CODE_BEE680				;$BEE58A   |
	JML [$05A9]				;$BEE58E  /

CODE_BEE591:
	SEP #$20				;$BEE591  \
	LDA #$00				;$BEE593   |
	STA $002F,y				;$BEE595   |
	REP #$20				;$BEE598   |
	JSL CODE_B9D100				;$BEE59A   |
	JML [$05A9]				;$BEE59E  /

CODE_BEE5A1:
	JSL CODE_BEF039				;$BEE5A1  \
	JSL CODE_B9D100				;$BEE5A5   |
	JSL CODE_BBBB8D				;$BEE5A9   |
	BCC CODE_BEE5B5				;$BEE5AD   |
	LDA #$0002				;$BEE5AF   |
	TRB $0923				;$BEE5B2   |
CODE_BEE5B5:					;	   |
	JML [$05A9]				;$BEE5B5  /

CODE_BEE5B8:
	LDY current_sprite			;$BEE5B8  \
	LDX alternate_sprite			;$BEE5BA   |
	STX $1E,y				;$BEE5BC   |
	STY $56,x				;$BEE5BE   |
	LDA #$3C3C				;$BEE5C0   |
	STA $5A,x				;$BEE5C3   |
	STZ $32,x				;$BEE5C5   |
	LDA $0002,y				;$BEE5C7   |
	DEC A					;$BEE5CA   |
	STA $02,x				;$BEE5CB   |
	LDA $04,x				;$BEE5CD   |
	STA $000C,y				;$BEE5CF   |
	LDA $20,x				;$BEE5D2   |
	STA $000E,y				;$BEE5D4   |
	LDA $08,x				;$BEE5D7   |
	STA $0040,y				;$BEE5D9   |
	LDA $24,x				;$BEE5DC   |
	STA $005C,y				;$BEE5DE   |
	LDA $53,x				;$BEE5E1   |
	AND #$00FF				;$BEE5E3   |
	STA $001C,y				;$BEE5E6   |
	LDY #$0008				;$BEE5E9   |
	LDA $51,x				;$BEE5EC   |
	EOR [$8E],y				;$BEE5EE   |
	AND #$FF00				;$BEE5F0   |
	EOR [$8E],y				;$BEE5F3   |
	ORA #$0080				;$BEE5F5   |
	STA $52,x				;$BEE5F8   |
	LDA $2E,x				;$BEE5FA   |
	ORA #$0080				;$BEE5FC   |
	STA $2E,x				;$BEE5FF   |
	INY					;$BEE601   |
	LDA [$8E],y				;$BEE602   |
	AND #$00FF				;$BEE604   |
	STA $40,x				;$BEE607   |
	INY					;$BEE609   |
	LDA [$8E],y				;$BEE60A   |
	STA $1E,x				;$BEE60C   |
	LDY #$0002				;$BEE60E   |
	LDA [$8E],y				;$BEE611   |
	STA $20,x				;$BEE613   |
	INY					;$BEE615   |
	INY					;$BEE616   |
	LDA [$8E],y				;$BEE617   |
	STA $24,x				;$BEE619   |
	RTS					;$BEE61B  /

CODE_BEE61C:
	PHK					;$BEE61C  \
	PLB					;$BEE61D   |
	LDX current_sprite			;$BEE61E   |
	LDA $10,x				;$BEE620   |
	STA $8E					;$BEE622   |
	LDY #$0006				;$BEE624   |
	LDA [$8E],y				;$BEE627   |
	STA $34					;$BEE629   |
	LDA $1A,x				;$BEE62B   |
	SEC					;$BEE62D   |
	SBC #$2B68				;$BEE62E   |
	CMP #$007D				;$BEE631   |
	BCS CODE_BEE663				;$BEE634   |
	TAY					;$BEE636   |
	LDA $34					;$BEE637   |
	AND #$00FF				;$BEE639   |
	SEC					;$BEE63C   |
	SBC DATA_BEE664,y			;$BEE63D   |
	STA $32					;$BEE640   |
	LDA $35					;$BEE642   |
	AND #$00FF				;$BEE644   |
	SEC					;$BEE647   |
	SBC DATA_BEE666,y			;$BEE648   |
	LDY $1E,x				;$BEE64B   |
	CLC					;$BEE64D   |
	ADC $0A,x				;$BEE64E   |
	STA $000A,y				;$BEE650   |
	LDA $32					;$BEE653   |
	BIT $12,x				;$BEE655   |
	BVC CODE_BEE65D				;$BEE657   |
	EOR #$FFFF				;$BEE659   |
	INC A					;$BEE65C   |
CODE_BEE65D:					;	   |
	CLC					;$BEE65D   |
	ADC $06,x				;$BEE65E   |
	STA $0006,y				;$BEE660   |
CODE_BEE663:					;	   |
	RTS					;$BEE663  /

DATA_BEE664:
	db $6A, $00

DATA_BEE666:
	db $99, $00, $6A, $00, $99, $00, $6A, $00
	db $99, $00, $68, $00, $AC, $00, $75, $00
	db $B9, $00, $88, $00, $B9, $00, $88, $00
	db $B9, $00


CODE_BEE680:
	LDX current_sprite			;$BEE680  \
	LDA $40,x				;$BEE682   |
	PHA					;$BEE684   |
	JSL CODE_B9D100				;$BEE685   |
	PLA					;$BEE689   |
	STA $40,x				;$BEE68A   |
	RTL					;$BEE68C  /

	JSR CODE_BEE691				;$BEE68D   |
	RTL					;$BEE690  /

CODE_BEE691:
	CMP #$0011				;$BEE691  \
	BNE CODE_BEE6A2				;$BEE694   |
	JSL CODE_BB8135				;$BEE696   |
	LDA #$0011				;$BEE69A   |
	BCC CODE_BEE6A2				;$BEE69D   |
	LDA #$001A				;$BEE69F   |
CODE_BEE6A2:					;	   |
	JSL CODE_B39DB0				;$BEE6A2   |
	PHA					;$BEE6A6   |
	ASL A					;$BEE6A7   |
	TAX					;$BEE6A8   |
	LDA.l DATA_FF18CE,x			;$BEE6A9   |
	TAY					;$BEE6AD   |
	JSL CODE_BB8432				;$BEE6AE   |
	PLA					;$BEE6B2   |
	BCS CODE_BEE6EA				;$BEE6B3   |
	LDY alternate_sprite			;$BEE6B5   |
	STA $0042,y				;$BEE6B7   |
	LDA #$001C				;$BEE6BA   |
	STA $0052,y				;$BEE6BD   |
	LDA #$0003				;$BEE6C0   |
	STA $002E,y				;$BEE6C3   |
	LDX current_sprite			;$BEE6C6   |
	LDA $06,x				;$BEE6C8   |
	STA $0006,y				;$BEE6CA   |
	LDA $0A,x				;$BEE6CD   |
	STA $000A,y				;$BEE6CF   |
	LDA #$FA00				;$BEE6D2   |
	STA $0024,y				;$BEE6D5   |
	LDA #$0026				;$BEE6D8   |
	STA $0048,y				;$BEE6DB   |
	LDA #$0050				;$BEE6DE   |
	STA $004C,y				;$BEE6E1   |
	LDA #$2000				;$BEE6E4   |
	STA $004E,y				;$BEE6E7   |
CODE_BEE6EA:					;	   |
	RTS					;$BEE6EA  /

CODE_BEE6EB:
	LDY current_sprite			;$BEE6EB  \
	LDA $002E,y				;$BEE6ED   |
	ASL A					;$BEE6F0   |
	TAX					;$BEE6F1   |
	JMP (DATA_BEE6F5,x)			;$BEE6F2  /

DATA_BEE6F5:
	dw CODE_BEE6FF
	dw CODE_BEE714
	dw CODE_BEE735
	dw CODE_BEE749
	dw CODE_BEE7A0


CODE_BEE6FF:
	LDA $0044,y				;$BEE6FF  \
	ORA #$0080				;$BEE702   |
	STA $0D5C				;$BEE705   |
	JSR CODE_BEE827				;$BEE708   |
	BCS CODE_BEE711				;$BEE70B   |
	LDX current_sprite			;$BEE70D   |
	INC $2E,x				;$BEE70F   |
CODE_BEE711:					;	   |
	JML [$05A9]				;$BEE711  /

CODE_BEE714:
	LDA $0D5E				;$BEE714  \
	BEQ CODE_BEE732				;$BEE717   |
	LDY #$00F4				;$BEE719   |
	JSL CODE_BB842C				;$BEE71C   |
	BCS CODE_BEE732				;$BEE720   |
	LDY alternate_sprite			;$BEE722   |
	LDX current_sprite			;$BEE724   |
	STX $4E,y				;$BEE726   |
	STY $4E,x				;$BEE728   |
	INC $2E,x				;$BEE72A   |
	LDA #$8000				;$BEE72C   |
	TSB $0923				;$BEE72F   |
CODE_BEE732:					;	   |
	JML [$05A9]				;$BEE732  /

CODE_BEE735:
	LDA $004E,y				;$BEE735  \
	BNE CODE_BEE746				;$BEE738   |
	TYX					;$BEE73A   |
	INC $2E,x				;$BEE73B   |
	LDA #$0080				;$BEE73D   |
	TRB $0D5C				;$BEE740   |
	JSR CODE_BEE7ED				;$BEE743   |
CODE_BEE746:					;	   |
	JML [$05A9]				;$BEE746  /

CODE_BEE749:
	TYX					;$BEE749  \
	LDA $17BA				;$BEE74A   |
	CMP #$5C80				;$BEE74D   |
	BCC CODE_BEE76A				;$BEE750   |
	LDA #$8000				;$BEE752   |
	TSB $0923				;$BEE755   |
	JSR CODE_BEE7ED				;$BEE758   |
	LDX current_sprite			;$BEE75B   |
	BCS CODE_BEE76A				;$BEE75D   |
	INC $2E,x				;$BEE75F   |
	LDA #$4000				;$BEE761   |
	TSB $0923				;$BEE764   |
	JML [$05A9]				;$BEE767  /

CODE_BEE76A:
	INC $42,x				;$BEE76A  \
	JSR CODE_BEE7A3				;$BEE76C   |
	LDX current_sprite			;$BEE76F   |
	LDA $0D5C				;$BEE771   |
	AND #$007F				;$BEE774   |
	CMP $4C,x				;$BEE777   |
	BEQ CODE_BEE787				;$BEE779   |
	JSR CODE_BEE7ED				;$BEE77B   |
	BCS CODE_BEE787				;$BEE77E   |
	LDA #$0763				;$BEE780   |
	JSL queue_sound_effect			;$BEE783   |
CODE_BEE787:					;	   |
	LDA $0923				;$BEE787   |
	AND #$0003				;$BEE78A   |
	CMP #$0001				;$BEE78D   |
	BNE CODE_BEE79D				;$BEE790   |
	JSR CODE_BEE827				;$BEE792   |
	BCS CODE_BEE79D				;$BEE795   |
	LDA #$0001				;$BEE797   |
	TRB $0923				;$BEE79A   |
CODE_BEE79D:					;	   |
	JML [$05A9]				;$BEE79D  /

CODE_BEE7A0:
	JML [$05A9]				;$BEE7A0  /

CODE_BEE7A3:
	LDY $0D5E				;$BEE7A3  \
	LDA $0022,y				;$BEE7A6   |
	BMI CODE_BEE7B0				;$BEE7A9   |
	CMP #$0200				;$BEE7AB   |
	BCS CODE_BEE7D0				;$BEE7AE   |
CODE_BEE7B0:					;	   |
	LDA $0026,y				;$BEE7B0   |
	BMI CODE_BEE7D1				;$BEE7B3   |
	LDA $42,x				;$BEE7B5   |
	CMP #$012C				;$BEE7B7   |
	BCC CODE_BEE7D0				;$BEE7BA   |
	LDA $0022,y				;$BEE7BC   |
	CLC					;$BEE7BF   |
	ADC #$0004				;$BEE7C0   |
	BMI CODE_BEE7CD				;$BEE7C3   |
	CMP #$0200				;$BEE7C5   |
	BCC CODE_BEE7CD				;$BEE7C8   |
	LDA #$0200				;$BEE7CA   |
CODE_BEE7CD:					;	   |
	STA $0022,y				;$BEE7CD   |
CODE_BEE7D0:					;	   |
	RTS					;$BEE7D0  /

CODE_BEE7D1:
	LDA #$FC00				;$BEE7D1  \
	STA $0022,y				;$BEE7D4   |
	LDA #$FF00				;$BEE7D7   |
	STA $0028,y				;$BEE7DA   |
	LDA $003E,y				;$BEE7DD   |
	ORA #$8000				;$BEE7E0   |
	STA $003E,y				;$BEE7E3   |
	LDA #$0000				;$BEE7E6   |
	STA $004E,y				;$BEE7E9   |
	RTS					;$BEE7EC  /

CODE_BEE7ED:
	SEC					;$BEE7ED  \
	LDA $092E				;$BEE7EE   |
	AND #$00FF				;$BEE7F1   |
	BNE CODE_BEE826				;$BEE7F4   |
	LDY current_sprite			;$BEE7F6   |
	LDX $4E,y				;$BEE7F8   |
	BEQ CODE_BEE80D				;$BEE7FA   |
	SEP #$20				;$BEE7FC   |
	STZ $2F,x				;$BEE7FE   |
	REP #$20				;$BEE800   |
	LDA $0D5C				;$BEE802   |
	AND #$007F				;$BEE805   |
	STA $004C,y				;$BEE808   |
	CLC					;$BEE80B   |
	RTS					;$BEE80C  /

CODE_BEE80D:
	LDY #$00F2				;$BEE80D  \
	JSL CODE_BB842C				;$BEE810   |
	BCS CODE_BEE826				;$BEE814   |
	LDY alternate_sprite			;$BEE816   |
	LDX current_sprite			;$BEE818   |
	STX $4E,y				;$BEE81A   |
	STY $4E,x				;$BEE81C   |
	LDA $0D5C				;$BEE81E   |
	AND #$007F				;$BEE821   |
	STA $4C,x				;$BEE824   |
CODE_BEE826:					;	   |
	RTS					;$BEE826  /

CODE_BEE827:
	LDX current_sprite			;$BEE827  \
	LDA $0D5C				;$BEE829   |
	AND #$007F				;$BEE82C   |
	DEC A					;$BEE82F   |
	DEC A					;$BEE830   |
	BMI CODE_BEE869				;$BEE831   |
	ASL A					;$BEE833   |
	ASL A					;$BEE834   |
	ASL A					;$BEE835   |
	ADC #DATA_FDD364			;$BEE836   |
	STA $06,x				;$BEE839   |
	STA $32					;$BEE83B   |
	LDA #$00FD				;$BEE83D   |
	STA $34					;$BEE840   |
	LDA [$32]				;$BEE842   |
	STA $32					;$BEE844   |
	LDY #$0000				;$BEE846   |
	LDA $42,x				;$BEE849   |
	SEC					;$BEE84B   |
	BEQ CODE_BEE86B				;$BEE84C   |
CODE_BEE84E:					;	   |
	LDA [$32],y				;$BEE84E   |
	BMI CODE_BEE869				;$BEE850   |
	SEC					;$BEE852   |
	SBC $17BA				;$BEE853   |
	BCC CODE_BEE862				;$BEE856   |
	CMP #$0120				;$BEE858   |
	BCS CODE_BEE869				;$BEE85B   |
	CMP #$0100				;$BEE85D   |
	BCS CODE_BEE86B				;$BEE860   |
CODE_BEE862:					;	   |
	TYA					;$BEE862   |
	ADC #$0006				;$BEE863   |
	TAY					;$BEE866   |
	BRA CODE_BEE84E				;$BEE867  /

CODE_BEE869:
	SEC					;$BEE869  \
	RTS					;$BEE86A  /

CODE_BEE86B:
	INY					;$BEE86B  \
	INY					;$BEE86C   |
	INY					;$BEE86D   |
	INY					;$BEE86E   |
	LDA $42,x				;$BEE86F   |
	CMP [$32],y				;$BEE871   |
	BCC CODE_BEE879				;$BEE873   |
	INY					;$BEE875   |
	INY					;$BEE876   |
	BRA CODE_BEE84E				;$BEE877  /

CODE_BEE879:
	DEY					;$BEE879  \
	DEY					;$BEE87A   |
	DEY					;$BEE87B   |
	DEY					;$BEE87C   |
	PHY					;$BEE87D   |
	LDA $32					;$BEE87E   |
	PHA					;$BEE880   |
	LDY $36,x				;$BEE881   |
	JSL CODE_BB8432				;$BEE883   |
	PLA					;$BEE887   |
	STA $32					;$BEE888   |
	LDA #$00FD				;$BEE88A   |
	STA $34					;$BEE88D   |
	PLY					;$BEE88F   |
	BCS CODE_BEE869				;$BEE890   |
	LDX alternate_sprite			;$BEE892   |
	LDA [$32],y				;$BEE894   |
	STA $06,x				;$BEE896   |
	INY					;$BEE898   |
	INY					;$BEE899   |
	LDA [$32],y				;$BEE89A   |
	STA $0A,x				;$BEE89C   |
	LDY current_sprite			;$BEE89E   |
	LDA $0006,y				;$BEE8A0   |
	STA $32					;$BEE8A3   |
	LDY #$0006				;$BEE8A5   |
	LDA [$32],y				;$BEE8A8   |
	STA $28,x				;$BEE8AA   |
	DEY					;$BEE8AC   |
	DEY					;$BEE8AD   |
	LDA [$32],y				;$BEE8AE   |
	STA $22,x				;$BEE8B0   |
	DEY					;$BEE8B2   |
	DEY					;$BEE8B3   |
	LDA [$32],y				;$BEE8B4   |
	STA $5C,x				;$BEE8B6   |
	JSR CODE_BED74E				;$BEE8B8   |
	CLC					;$BEE8BB   |
	RTS					;$BEE8BC  /

CODE_BEE8BD:
	LDY current_sprite			;$BEE8BD  \
	LDA $002E,y				;$BEE8BF   |
	AND #$00FF				;$BEE8C2   |
	ASL A					;$BEE8C5   |
	TAX					;$BEE8C6   |
	LDA $002F,y				;$BEE8C7   |
	AND #$00FF				;$BEE8CA   |
	ASL A					;$BEE8CD   |
	JMP (DATA_BEE8D1,x)			;$BEE8CE  /

DATA_BEE8D1:
	dw CODE_BEE8D5
	dw CODE_BEE9A8


CODE_BEE8D5:
	TAX					;$BEE8D5  \
	JMP (DATA_BEE8D9,x)			;$BEE8D6  /

DATA_BEE8D9:
	dw CODE_BEE8F3
	dw CODE_BEE902
	dw CODE_BEE91A
	dw CODE_BEE970
	dw CODE_BEE990
	dw CODE_BEE8ED
	dw CODE_BEE902
	dw CODE_BEE91F
	dw CODE_BEE970
	dw CODE_BEE990


CODE_BEE8ED:
	LDA #$0003				;$BEE8ED  \
	TSB $0A36				;$BEE8F0   |
CODE_BEE8F3:					;	   |
	LDA $0044,y				;$BEE8F3   |
	ASL A					;$BEE8F6   |
	TAX					;$BEE8F7   |
	LDA.l DATA_FD5FEE,x			;$BEE8F8   |
	STA $0044,y				;$BEE8FC   |
	TYX					;$BEE8FF   |
	INC $2F,x				;$BEE900   |
CODE_BEE902:					;	   |
	TYX					;$BEE902   |
	LDA $0A,x				;$BEE903   |
	CLC					;$BEE905   |
	ADC #$0004				;$BEE906   |
	BMI CODE_BEE915				;$BEE909   |
	CMP #$0040				;$BEE90B   |
	BCC CODE_BEE915				;$BEE90E   |
	LDA #$0040				;$BEE910   |
	INC $2F,x				;$BEE913   |
CODE_BEE915:					;	   |
	STA $0A,x				;$BEE915   |
	JML [$05A9]				;$BEE917  /

CODE_BEE91A:
	LDA $0D5E				;$BEE91A  \
	BEQ CODE_BEE96D				;$BEE91D   |
CODE_BEE91F:					;	   |
	LDA $0042,y				;$BEE91F   |
	SEC					;$BEE922   |
	SBC #$0100				;$BEE923   |
	STA $0042,y				;$BEE926   |
	BPL CODE_BEE96D				;$BEE929   |
	SEP #$20				;$BEE92B   |
	STA $0043,y				;$BEE92D   |
	REP #$20				;$BEE930   |
	TYX					;$BEE932   |
	DEC $46,x				;$BEE933   |
	BPL CODE_BEE93B				;$BEE935   |
	INC $2F,x				;$BEE937   |
	BRA CODE_BEE96D				;$BEE939  /

CODE_BEE93B:
	LDA $44,x				;$BEE93B  \
	CLC					;$BEE93D   |
	ADC #$001E				;$BEE93E   |
	STA $44,x				;$BEE941   |
	JSL CODE_BB8C40				;$BEE943   |
	LDX current_sprite			;$BEE947   |
	LDA $46,x				;$BEE949   |
	BEQ CODE_BEE957				;$BEE94B   |
	LDA #$066B				;$BEE94D   |
	JSL queue_sound_effect			;$BEE950   |
	JML [$05A9]				;$BEE954  /

CODE_BEE957:
	LDY $4E,x				;$BEE957  \
	BEQ CODE_BEE95E				;$BEE959   |
	STA $004E,y				;$BEE95B   |
CODE_BEE95E:					;	   |
	LDA #$0003				;$BEE95E   |
	TRB $0A36				;$BEE961   |
	INC $2F,x				;$BEE964   |
	LDA #$066C				;$BEE966   |
	JSL queue_sound_effect			;$BEE969   |
CODE_BEE96D:					;	   |
	JML [$05A9]				;$BEE96D  /

CODE_BEE970:
	LDA $0042,y				;$BEE970  \
	SEC					;$BEE973   |
	SBC #$0100				;$BEE974   |
	STA $0042,y				;$BEE977   |
	BCS CODE_BEE98D				;$BEE97A   |
	TYX					;$BEE97C   |
	INC $2F,x				;$BEE97D   |
	LDA $2E,x				;$BEE97F   |
	CMP #$0400				;$BEE981   |
	BEQ CODE_BEE98D				;$BEE984   |
	LDA #$0005				;$BEE986   |
	JSL transition_song			;$BEE989   |
CODE_BEE98D:					;	   |
	JML [$05A9]				;$BEE98D  /

CODE_BEE990:
	LDA $000A,y				;$BEE990  \
	SEC					;$BEE993   |
	SBC #$0006				;$BEE994   |
	STA $000A,y				;$BEE997   |
	BPL CODE_BEE9A5				;$BEE99A   |
	CMP #$FFF8				;$BEE99C   |
	BCS CODE_BEE9A5				;$BEE99F   |
	JSL CODE_BB82B8				;$BEE9A1   |
CODE_BEE9A5:					;	   |
	JML [$05A9]				;$BEE9A5  /

CODE_BEE9A8:
	TAX					;$BEE9A8  \
	JMP (DATA_BEE9AC,x)			;$BEE9A9  /

DATA_BEE9AC:
	dw CODE_BEE9B6
	dw CODE_BEE9BD
	dw CODE_BEE9EF
	dw CODE_BEEA03
	dw CODE_BEEA36


CODE_BEE9B6:
	TYX					;$BEE9B6  \
	LDA $44,x				;$BEE9B7   |
	STA $42,x				;$BEE9B9   |
	INC $2F,x				;$BEE9BB   |
CODE_BEE9BD:					;	   |
	TYX					;$BEE9BD   |
	LDA #$C000				;$BEE9BE   |
	STA $001C,y				;$BEE9C1   |
	SEP #$20				;$BEE9C4   |
	STZ $0D5D				;$BEE9C6   |
	REP #$20				;$BEE9C9   |
	DEC $42,x				;$BEE9CB   |
	BMI CODE_BEE9DC				;$BEE9CD   |
	LDA $42,x				;$BEE9CF   |
	AND #$001F				;$BEE9D1   |
	CMP #$0014				;$BEE9D4   |
	BCC CODE_BEE9EF				;$BEE9D7   |
	JML [$05A9]				;$BEE9D9  /

CODE_BEE9DC:
	JSL CODE_BB82B8				;$BEE9DC  \
	LDA #$8000				;$BEE9E0   |
	TRB $0923				;$BEE9E3   |
	LDY current_sprite			;$BEE9E6   |
	LDX $4E,y				;$BEE9E8   |
	STZ $4E,x				;$BEE9EA   |
	JML [$05A9]				;$BEE9EC  /

CODE_BEE9EF:
	LDX current_sprite			;$BEE9EF  \
	LDA #$8000				;$BEE9F1   |
	STA $1C,x				;$BEE9F4   |
	SEP #$20				;$BEE9F6   |
	LDA $0D5C				;$BEE9F8   |
	STA $0D5D				;$BEE9FB   |
	REP #$20				;$BEE9FE   |
	JML [$05A9]				;$BEEA00  /

CODE_BEEA03:
	LDA #$6574				;$BEEA03  \
	JSL CODE_BB8A65				;$BEEA06   |
	DEC $0B74,x				;$BEEA0A   |
	LDX current_sprite			;$BEEA0D   |
	EOR $12,x				;$BEEA0F   |
	AND #$0E00				;$BEEA11   |
	EOR $12,x				;$BEEA14   |
	STA $12,x				;$BEEA16   |
	LDA $46,x				;$BEEA18   |
	ASL A					;$BEEA1A   |
	TAX					;$BEEA1B   |
	LDA.l DATA_FD5FEE,x			;$BEEA1C   |
	LDX current_sprite			;$BEEA20   |
	JSL CODE_BB8AE4				;$BEEA22   |
	LDX current_sprite			;$BEEA26   |
	LDA #$8000				;$BEEA28   |
	STA $1C,x				;$BEEA2B   |
	INC $2F,x				;$BEEA2D   |
	LDA $44,x				;$BEEA2F   |
	STA $42,x				;$BEEA31   |
	JML [$05A9]				;$BEEA33  /

CODE_BEEA36:
	TYX					;$BEEA36  \
	LDA #$C000				;$BEEA37   |
	STA $001C,y				;$BEEA3A   |
	SEP #$20				;$BEEA3D   |
	STZ $0D5D				;$BEEA3F   |
	REP #$20				;$BEEA42   |
	LDY $0593				;$BEEA44   |
	LDA $0A,x				;$BEEA47   |
	CMP #$01FF				;$BEEA49   |
	BCS CODE_BEEA55				;$BEEA4C   |
	LDA $0006,y				;$BEEA4E   |
	CMP $4E,x				;$BEEA51   |
	BCS CODE_BEEA66				;$BEEA53   |
CODE_BEEA55:					;	   |
	DEC $42,x				;$BEEA55   |
	BMI CODE_BEEA66				;$BEEA57   |
	LDA $42,x				;$BEEA59   |
	AND #$001F				;$BEEA5B   |
	CMP #$0014				;$BEEA5E   |
	BCC CODE_BEE9EF				;$BEEA61   |
	JML [$05A9]				;$BEEA63  /

CODE_BEEA66:
	LDA $13,x				;$BEEA66  \
	AND #$000E				;$BEEA68   |
	TAX					;$BEEA6B   |
	INC $0B74,x				;$BEEA6C   |
	LDA #$6574				;$BEEA6F   |
	LDX current_sprite			;$BEEA72   |
	JSL CODE_BB8AE4				;$BEEA74   |
	JSL CODE_BB82B8				;$BEEA78   |
	JML [$05A9]				;$BEEA7C  /

CODE_BEEA7F:
	INC $19AA				;$BEEA7F  \
	JSR CODE_BEB82A				;$BEEA82  /

DATA_BEEA85:
	dw CODE_BEEA9B
	dw CODE_BEEAAA
	dw CODE_BEEAE0
	dw CODE_BEEB34

CODE_BEEA8D:
	INC $19AA				;$BEEA8D  \
	JSR CODE_BEB82A				;$BEEA90  /

DATA_BEEA93:
	dw CODE_BEEA9B
	dw CODE_BEEAB0
	dw CODE_BEEAF7
	dw CODE_BEEB34

CODE_BEEA9B:
	TYX					;$BEEA9B  \
	LDA $12,x				;$BEEA9C   |
	STA $22,x				;$BEEA9E   |
	LDA #$0100				;$BEEAA0   |
	STA $28,x				;$BEEAA3   |
	INC $2E,x				;$BEEAA5   |
	JML [$05A9]				;$BEEAA7  /

CODE_BEEAAA:
	JSR CODE_BEEABF				;$BEEAAA  \
	JMP CODE_BEB849				;$BEEAAD  /

CODE_BEEAB0:
	JSR CODE_BEEABF				;$BEEAB0  \
	BCS CODE_BEEABC				;$BEEAB3   |
	LDA #$0005				;$BEEAB5   |
	JSL transition_song			;$BEEAB8   |
CODE_BEEABC:					;	   |
	JML [$05A9]				;$BEEABC  /

CODE_BEEABF:
	JSR CODE_BEEB42				;$BEEABF  \
	JSL CODE_B9D100				;$BEEAC2   |
	JSL CODE_BEF039				;$BEEAC6   |
	LDA $5C,x				;$BEEACA   |
	LDY $50,x				;$BEEACC   |
	JSL CODE_B3C6AB				;$BEEACE   |
	BCS CODE_BEEADF				;$BEEAD2   |
	LDA #$004E				;$BEEAD4   |
	JSR CODE_BEEC57				;$BEEAD7   |
	LDX current_sprite			;$BEEADA   |
	INC $2E,x				;$BEEADC   |
	CLC					;$BEEADE   |
CODE_BEEADF:					;	   |
	RTS					;$BEEADF  /

CODE_BEEAE0:
	JSR CODE_BEEB1C				;$BEEAE0  \
	LDX current_sprite			;$BEEAE3   |
	LDA $06,x				;$BEEAE5   |
	SEC					;$BEEAE7   |
	SBC $17BA				;$BEEAE8   |
	CLC					;$BEEAEB   |
	ADC #$0010				;$BEEAEC   |
	CMP #$0120				;$BEEAEF   |
	BCC CODE_BEEB19				;$BEEAF2   |
	JMP CODE_BEB849				;$BEEAF4  /

CODE_BEEAF7:
	JSR CODE_BEEB1C				;$BEEAF7  \
	LDY $0593				;$BEEAFA   |
	LDA $0006,y				;$BEEAFD   |
	CMP #$0970				;$BEEB00   |
	BCC CODE_BEEB19				;$BEEB03   |
	LDA $000A,y				;$BEEB05   |
	CMP #$0918				;$BEEB08   |
	BCS CODE_BEEB19				;$BEEB0B   |
	LDA $000A,y				;$BEEB0D   |
	CMP #$0840				;$BEEB10   |
	BCC CODE_BEEB19				;$BEEB13   |
	JSL CODE_BB82B8				;$BEEB15   |
CODE_BEEB19:					;	   |
	JML [$05A9]				;$BEEB19  /

CODE_BEEB1C:
	JSR CODE_BEEB42				;$BEEB1C  \
	JSL CODE_B9D100				;$BEEB1F   |
	JSL CODE_BEF039				;$BEEB23   |
	LDA $52,x				;$BEEB27   |
	BNE CODE_BEEB33				;$BEEB29   |
	INC $2E,x				;$BEEB2B   |
	LDA #$004E				;$BEEB2D   |
	JSR CODE_BEEC57				;$BEEB30   |
CODE_BEEB33:					;	   |
	RTS					;$BEEB33  /

CODE_BEEB34:
	JSR CODE_BEEB42				;$BEEB34  \
	JSL CODE_B9D100				;$BEEB37   |
	JSL CODE_BEF039				;$BEEB3B   |
	JMP CODE_BEB849				;$BEEB3F  /

CODE_BEEB42:
	JSL CODE_BCFB58				;$BEEB42  \
	LDA #$0000				;$BEEB46   |
	JSL CODE_BEBE8B				;$BEEB49   |
	RTS					;$BEEB4D  /

CODE_BEEB4E:
	JSR CODE_BEB82A				;$BEEB4E  /

DATA_BEEB50:
	dw CODE_BEEB63
	dw CODE_BEEB6F
	dw CODE_BEEB88
	dw CODE_BEEBA4
	dw CODE_BEEBC3
	dw CODE_BEEBE7
	dw CODE_BEEC05
	dw CODE_BEEC10
	dw CODE_BEEC2E


CODE_BEEB63:
	TYX					;$BEEB63  \
	LDA $12,x				;$BEEB64   |
	STA $22,x				;$BEEB66   |
	LDA #$0100				;$BEEB68   |
	STA $28,x				;$BEEB6B   |
	INC $2E,x				;$BEEB6D   |
CODE_BEEB6F:					;	   |
	JSL CODE_B9D100				;$BEEB6F   |
	JSL CODE_BEF039				;$BEEB73   |
	LDA $5C,x				;$BEEB77   |
	LDY $50,x				;$BEEB79   |
	JSL CODE_B3C6AB				;$BEEB7B   |
	BCS CODE_BEEB85				;$BEEB7F   |
	LDX current_sprite			;$BEEB81   |
	INC $2E,x				;$BEEB83   |
CODE_BEEB85:					;	   |
	JML [$05A9]				;$BEEB85  /

CODE_BEEB88:
	JSL CODE_B9D100				;$BEEB88  \
	JSL CODE_BEF039				;$BEEB8C   |
	LDY #$00F8				;$BEEB90   |
	JSL CODE_BB842C				;$BEEB93   |
	BCS CODE_BEEBA1				;$BEEB97   |
	LDX current_sprite			;$BEEB99   |
	LDY alternate_sprite			;$BEEB9B   |
	STY $5C,x				;$BEEB9D   |
	INC $2E,x				;$BEEB9F   |
CODE_BEEBA1:					;	   |
	JML [$05A9]				;$BEEBA1  /

CODE_BEEBA4:
	JSL CODE_B9D100				;$BEEBA4  \
	JSL CODE_BEF039				;$BEEBA8   |
	LDX current_sprite			;$BEEBAC   |
	LDY $5C,x				;$BEEBAE   |
	LDA $002E,y				;$BEEBB0   |
	CMP #$0800				;$BEEBB3   |
	BCC CODE_BEEBC0				;$BEEBB6   |
	INC $2E,x				;$BEEBB8   |
	LDA #$004E				;$BEEBBA   |
	JSR CODE_BEEC57				;$BEEBBD   |
CODE_BEEBC0:					;	   |
	JML [$05A9]				;$BEEBC0  /

CODE_BEEBC3:
	JSR CODE_BEEC45				;$BEEBC3  \
	LDX current_sprite			;$BEEBC6   |
	LDA #$0005				;$BEEBC8   |
	BCS CODE_BEEBDC				;$BEEBCB   |
	JSL CODE_B9D100				;$BEEBCD   |
	JSL CODE_BEF039				;$BEEBD1   |
	LDA $52,x				;$BEEBD5   |
	BNE CODE_BEEBE4				;$BEEBD7   |
	LDA #$0007				;$BEEBD9   |
CODE_BEEBDC:					;	   |
	STA $2E,x				;$BEEBDC   |
	LDA #$004E				;$BEEBDE   |
	JSR CODE_BEEC57				;$BEEBE1   |
CODE_BEEBE4:					;	   |
	JML [$05A9]				;$BEEBE4  /

CODE_BEEBE7:
	LDY #$00FA				;$BEEBE7  \
	JSL CODE_BB842C				;$BEEBEA   |
	BCS CODE_BEEBFA				;$BEEBEE   |
	LDX current_sprite			;$BEEBF0   |
	INC $2E,x				;$BEEBF2   |
	LDA #$0101				;$BEEBF4   |
	STA $0D5C				;$BEEBF7   |
CODE_BEEBFA:					;	   |
	JSL CODE_B9D100				;$BEEBFA   |
	JSL CODE_BEF039				;$BEEBFE   |
	JML [$05A9]				;$BEEC02  /

CODE_BEEC05:
	JSL CODE_B9D100				;$BEEC05  \
	JSL CODE_BEF039				;$BEEC09   |
	JMP CODE_BEB849				;$BEEC0D  /

CODE_BEEC10:
	LDY #$00FA				;$BEEC10  \
	JSL CODE_BB842C				;$BEEC13   |
	BCS CODE_BEEC23				;$BEEC17   |
	LDX current_sprite			;$BEEC19   |
	INC $2E,x				;$BEEC1B   |
	LDA #$0202				;$BEEC1D   |
	STA $0D5C				;$BEEC20   |
CODE_BEEC23:					;	   |
	JSL CODE_B9D100				;$BEEC23   |
	JSL CODE_BEF039				;$BEEC27   |
	JML [$05A9]				;$BEEC2B  /

CODE_BEEC2E:
	JSR CODE_BED92E				;$BEEC2E  \
	BCC CODE_BEEC3C				;$BEEC31   |
	LDA #$0022				;$BEEC33   |
	JSL CODE_B8D8BA				;$BEEC36   |
	BCS CODE_BEEC43				;$BEEC3A   |
CODE_BEEC3C:					;	   |
	LDX current_sprite			;$BEEC3C   |
	LDA #$0006				;$BEEC3E   |
	STA $2E,x				;$BEEC41   |
CODE_BEEC43:					;	   |
	BRA CODE_BEEC05				;$BEEC43  /

CODE_BEEC45:
	LDY $0593				;$BEEC45  \
	LDA $0006,y				;$BEEC48   |
	CMP #$0AD8				;$BEEC4B   |
	BCC CODE_BEEC56				;$BEEC4E   |
	LDA #$01FF				;$BEEC50   |
	CMP $000A,y				;$BEEC53   |
CODE_BEEC56:					;	   |
	RTS					;$BEEC56  /

CODE_BEEC57:
	CLC					;$BEEC57  \
	ADC current_sprite			;$BEEC58   |
	TAX					;$BEEC5A   |
	PHX					;$BEEC5B   |
	LDA $00,x				;$BEEC5C   |
	STA $5E					;$BEEC5E   |
	LDA $90					;$BEEC60   |
	STA $60					;$BEEC62   |
	LDY #$0000				;$BEEC64   |
CODE_BEEC67:					;	   |
	LDA [$5E],y				;$BEEC67   |
	BMI CODE_BEEC79				;$BEEC69   |
	CLC					;$BEEC6B   |
	ADC current_sprite			;$BEEC6C   |
	TAX					;$BEEC6E   |
	INY					;$BEEC6F   |
	INY					;$BEEC70   |
	LDA [$5E],y				;$BEEC71   |
	INY					;$BEEC73   |
	INY					;$BEEC74   |
	STA $00,x				;$BEEC75   |
	BRA CODE_BEEC67				;$BEEC77  /

CODE_BEEC79:
	PLX					;$BEEC79  \
	INY					;$BEEC7A   |
	SEC					;$BEEC7B   |
	TYA					;$BEEC7C   |
	ADC $5E					;$BEEC7D   |
	STA $00,x				;$BEEC7F   |
	RTS					;$BEEC81  /

CODE_BEEC82:
	LDY current_sprite			;$BEEC82  \
	LDA $002E,y				;$BEEC84   |
	AND #$00FF				;$BEEC87   |
	ASL A					;$BEEC8A   |
	TAX					;$BEEC8B   |
	LDA $002F,y				;$BEEC8C   |
	AND #$00FF				;$BEEC8F   |
	JMP (DATA_BEEC95,x)			;$BEEC92  /

DATA_BEEC95:
	dw CODE_BEEC9B
	dw CODE_BEECD6
	dw CODE_BEED3A

CODE_BEEC9B:
	LDA $19B4				;$BEEC9B  \
	ORA $19B6				;$BEEC9E   |
	BNE CODE_BEECBE				;$BEECA1   |
	TYX					;$BEECA3   |
	LDY #$0006				;$BEECA4   |
CODE_BEECA7:					;	   |
	LDA #$0002				;$BEECA7   |
	PHY					;$BEECAA   |
	JSL CODE_BB8341				;$BEECAB   |
	PLY					;$BEECAF   |
	BCS CODE_BEECCA				;$BEECB0   |
	LDA $12,x				;$BEECB2   |
	AND #$01E0				;$BEECB4   |
	STA $19B2,y				;$BEECB7   |
	DEY					;$BEECBA   |
	DEY					;$BEECBB   |
	BNE CODE_BEECA7				;$BEECBC   |
CODE_BEECBE:					;	   |
	LDX current_sprite			;$BEECBE   |
	LDA $2F,x				;$BEECC0   |
	AND #$00FF				;$BEECC2   |
	STA $2E,x				;$BEECC5   |
	JML [$05A9]				;$BEECC7  /

CODE_BEECCA:
	STZ $19B8				;$BEECCA  \
	STZ $19B6				;$BEECCD   |
	STZ $19B4				;$BEECD0   |
	JML [$05A9]				;$BEECD3  /

CODE_BEECD6:
	TYX					;$BEECD6  \
	ASL A					;$BEECD7   |
	BNE CODE_BEECE0				;$BEECD8   |
	LDA $42,x				;$BEECDA   |
	STA $50,x				;$BEECDC   |
	INC $2F,x				;$BEECDE   |
CODE_BEECE0:					;	   |
	LDY $0593				;$BEECE0   |
	LDA $0006,y				;$BEECE3   |
	SEC					;$BEECE6   |
	SBC $06,x				;$BEECE7   |
	CLC					;$BEECE9   |
	ADC $4A,x				;$BEECEA   |
	EOR $26,x				;$BEECEC   |
	BPL CODE_BEECF4				;$BEECEE   |
	LDA $46,x				;$BEECF0   |
	STA $44,x				;$BEECF2   |
CODE_BEECF4:					;	   |
	LDA $44,x				;$BEECF4   |
	DEC A					;$BEECF6   |
	BMI CODE_BEECFD				;$BEECF7   |
	STA $44,x				;$BEECF9   |
	BRA CODE_BEED2B				;$BEECFB  /

CODE_BEECFD:
	LDA $42,x				;$BEECFD  \
	BEQ CODE_BEED2B				;$BEECFF   |
	LDY $48,x				;$BEED01   |
	JSL CODE_BB83F5				;$BEED03   |
	BCS CODE_BEED2B				;$BEED07   |
	LDX current_sprite			;$BEED09   |
	DEC $42,x				;$BEED0B   |
	LDA $46,x				;$BEED0D   |
	STA $44,x				;$BEED0F   |
	LDY alternate_sprite			;$BEED11   |
	STX $50,y				;$BEED13   |
	LDA $20,x				;$BEED15   |
	STA $0020,y				;$BEED17   |
	LDA $26,x				;$BEED1A   |
	STA $0026,y				;$BEED1C   |
	LDA $24,x				;$BEED1F   |
	STA $0024,y				;$BEED21   |
	LDA #$0562				;$BEED24   |
	JSL queue_sound_effect			;$BEED27   |
CODE_BEED2B:					;	   |
	LDX current_sprite			;$BEED2B   |
	LDA $42,x				;$BEED2D   |
	CMP $44,x				;$BEED2F   |
	BNE CODE_BEED37				;$BEED31   |
	JSL CODE_BBBB99				;$BEED33   |
CODE_BEED37:					;	   |
	JML [$05A9]				;$BEED37  /

CODE_BEED3A:
	LDA $0054,y				;$BEED3A  \
	STA $8E					;$BEED3D   |
	JSR CODE_BEEDEE				;$BEED3F   |
	JSL CODE_BEF039				;$BEED42   |
	JSL CODE_BCFB58				;$BEED46   |
	LDY #$0030				;$BEED4A   |
	JSL CODE_BEBE8E				;$BEED4D   |
	JSR CODE_BEED5A				;$BEED51   |
	JSR CODE_BEED98				;$BEED54   |
	JML [$05A9]				;$BEED57  /

CODE_BEED5A:
	JSL CODE_B9D100				;$BEED5A  \
	LDX current_sprite			;$BEED5E   |
	LDA $1A,x				;$BEED60   |
	BEQ CODE_BEED97				;$BEED62   |
	CMP $18,x				;$BEED64   |
	BEQ CODE_BEED97				;$BEED66   |
	SEC					;$BEED68   |
	SBC #$2CAC				;$BEED69   |
	LSR A					;$BEED6C   |
	TAY					;$BEED6D   |
	LDA $19B4,y				;$BEED6E   |
	CMP #$8000				;$BEED71   |
	EOR $12,x				;$BEED74   |
	AND #$01E0				;$BEED76   |
	EOR $12,x				;$BEED79   |
	STA $12,x				;$BEED7B   |
	BCC CODE_BEED86				;$BEED7D   |
	LDY $1A,x				;$BEED7F   |
	STY $18,x				;$BEED81   |
	STY $16,x				;$BEED83   |
	RTS					;$BEED85  /

CODE_BEED86:
	PHY					;$BEED86  \
	JSL CODE_B59C00				;$BEED87   |
	PLY					;$BEED8B   |
	BCS CODE_BEED97				;$BEED8C   |
	LDA $19B4,y				;$BEED8E   |
	ORA #$8000				;$BEED91   |
	STA $19B4,y				;$BEED94   |
CODE_BEED97:					;	   |
	RTS					;$BEED97  /

CODE_BEED98:
	LDX current_sprite			;$BEED98  \
	LDA $0A,x				;$BEED9A   |
	SEC					;$BEED9C   |
	SBC #$0220				;$BEED9D   |
	BCC CODE_BEEDED				;$BEEDA0   |
	CMP $17C0				;$BEEDA2   |
	BCS CODE_BEEDBA				;$BEEDA5   |
	LDA $06,x				;$BEEDA7   |
	SEC					;$BEEDA9   |
	SBC $17BA				;$BEEDAA   |
	BIT $26,x				;$BEEDAD   |
	BPL CODE_BEEDB4				;$BEEDAF   |
	BCC CODE_BEEDBA				;$BEEDB1   |
	RTS					;$BEEDB3  /

CODE_BEEDB4:
	SEC					;$BEEDB4  \
	SBC #$0100				;$BEEDB5   |
	BMI CODE_BEEDED				;$BEEDB8   |
CODE_BEEDBA:					;	   |
	JSL CODE_BBBB69				;$BEEDBA   |
	BCC CODE_BEEDED				;$BEEDBE   |
	LDY current_sprite			;$BEEDC0   |
	LDX $50,y				;$BEEDC2   |
	BEQ CODE_BEEDCD				;$BEEDC4   |
	INC $42,x				;$BEEDC6   |
	TYX					;$BEEDC8   |
	STZ $00,x				;$BEEDC9   |
	BRA CODE_BEEDD3				;$BEEDCB  /

CODE_BEEDCD:
	JSL CODE_BBBB99				;$BEEDCD  \
	BCC CODE_BEEDED				;$BEEDD1   |
CODE_BEEDD3:					;	   |
	LDX current_sprite			;$BEEDD3   |
	LDA $12,x				;$BEEDD5   |
	JSL CODE_BB8C02				;$BEEDD7   |
	DEC $19B2				;$BEEDDB   |
	LDA $19B2				;$BEEDDE   |
	AND #$00FF				;$BEEDE1   |
	BNE CODE_BEEDED				;$BEEDE4   |
	LDA #CODE_BEEE09			;$BEEDE6   |
	JSL CODE_B3D46C				;$BEEDE9   |
CODE_BEEDED:					;	   |
	RTS					;$BEEDED  /

CODE_BEEDEE:
	INC $19B2				;$BEEDEE  \
	LDA $19B2				;$BEEDF1   |
	BMI CODE_BEEE08				;$BEEDF4   |
	CMP #$0100				;$BEEDF6   |
	BCC CODE_BEEE08				;$BEEDF9   |
	ORA #$8000				;$BEEDFB   |
	STA $19B2				;$BEEDFE   |
	LDA #$0463				;$BEEE01   |
	JSL CODE_B3814F				;$BEEE04   |
CODE_BEEE08:					;	   |
	RTS					;$BEEE08  /

CODE_BEEE09:
	LDA $19B2				;$BEEE09  \
	AND #$00FF				;$BEEE0C   |
	BNE CODE_BEEE37				;$BEEE0F   |
	LDY #$0006				;$BEEE11   |
CODE_BEEE14:					;	   |
	LDA $19B2,y				;$BEEE14   |
	AND #$01E0				;$BEEE17   |
	LSR A					;$BEEE1A   |
	LSR A					;$BEEE1B   |
	LSR A					;$BEEE1C   |
	LSR A					;$BEEE1D   |
	TAX					;$BEEE1E   |
	STZ $0B04,x				;$BEEE1F   |
	STZ $0B06,x				;$BEEE22   |
	LDA #$0000				;$BEEE25   |
	STA $19B2,y				;$BEEE28   |
	DEY					;$BEEE2B   |
	DEY					;$BEEE2C   |
	BNE CODE_BEEE14				;$BEEE2D   |
	CLC					;$BEEE2F   |
	LDA #$0463				;$BEEE30   |
	JSL CODE_B3814F				;$BEEE33   |
CODE_BEEE37:					;	   |
	RTL					;$BEEE37  /

CODE_BEEE38:
	LDX current_sprite			;$BEEE38  \
	LDA $2E,x				;$BEEE3A   |
	BNE CODE_BEEE9D				;$BEEE3C   |
	LDY $0593				;$BEEE3E   |
	LDA $45,x				;$BEEE41   |
	AND #$00FF				;$BEEE43   |
	EOR #$FFFF				;$BEEE46   |
	SEC					;$BEEE49   |
	ADC $06,x				;$BEEE4A   |
	CMP $0006,y				;$BEEE4C   |
	BCS CODE_BEEE8B				;$BEEE4F   |
	LDA $44,x				;$BEEE51   |
	AND #$00FF				;$BEEE53   |
	ADC $06,x				;$BEEE56   |
	CMP $0006,y				;$BEEE58   |
	BCC CODE_BEEE8B				;$BEEE5B   |
	LDA $47,x				;$BEEE5D   |
	AND #$00FF				;$BEEE5F   |
	EOR #$FFFF				;$BEEE62   |
	SEC					;$BEEE65   |
	ADC $0A,x				;$BEEE66   |
	CMP $000A,y				;$BEEE68   |
	BCS CODE_BEEE8B				;$BEEE6B   |
	LDA $46,x				;$BEEE6D   |
	AND #$00FF				;$BEEE6F   |
	ADC $0A,x				;$BEEE72   |
	CMP $000A,y				;$BEEE74   |
	BCC CODE_BEEE8B				;$BEEE77   |
	LDA $42,x				;$BEEE79   |
	ASL A					;$BEEE7B   |
	TAX					;$BEEE7C   |
	LDA.l $7E9128,x				;$BEEE7D   |
	AND #$FF7F				;$BEEE81   |
	STA $7E9128,x				;$BEEE84   |
	JML [$05A9]				;$BEEE88  /

CODE_BEEE8B:
	LDA $42,x				;$BEEE8B  \
	ASL A					;$BEEE8D   |
	TAX					;$BEEE8E   |
	LDA.l $7E9128,x				;$BEEE8F   |
	ORA #$0080				;$BEEE93   |
	STA $7E9128,x				;$BEEE96   |
	JMP CODE_BEB849				;$BEEE9A  /

CODE_BEEE9D:
	TXY					;$BEEE9D  \
	LDA $0042,y				;$BEEE9E   |
	ASL A					;$BEEEA1   |
	STA $32					;$BEEEA2   |
	LDA #$0500				;$BEEEA4   |
	JSR CODE_BEEF00				;$BEEEA7   |
	BEQ CODE_BEEEF9				;$BEEEAA   |
	LDA #$0600				;$BEEEAC   |
	JSR CODE_BEEF00				;$BEEEAF   |
	BEQ CODE_BEEEF9				;$BEEEB2   |
	LDA #$0700				;$BEEEB4   |
	JSR CODE_BEEF00				;$BEEEB7   |
	BNE CODE_BEEEC9				;$BEEEBA   |
	LDX $32					;$BEEEBC   |
	LDA.l $7E9128,x				;$BEEEBE   |
	DEC A					;$BEEEC2   |
	STA $7E9128,x				;$BEEEC3   |
	BRA CODE_BEEEF9				;$BEEEC7  /

CODE_BEEEC9:
	LDX $32					;$BEEEC9  \
	SEP #$20				;$BEEECB   |
	LDA.l $7E9128,x				;$BEEECD   |
	SEC					;$BEEED1   |
	SBC #$04				;$BEEED2   |
	STA $7E9128,x				;$BEEED4   |
	AND #$0C				;$BEEED8   |
	BNE CODE_BEEEE4				;$BEEEDA   |
	LDA #$00				;$BEEEDC   |
	STA $7E9129,x				;$BEEEDE   |
	BRA CODE_BEEEF7				;$BEEEE2  /

CODE_BEEEE4:
	LDA $0044,y				;$BEEEE4  \
	SEC					;$BEEEE7   |
	SBC $7E9129,x				;$BEEEE8   |
	BNE CODE_BEEEF7				;$BEEEEC   |
	LDA.l $7E9128,x				;$BEEEEE   |
	INC A					;$BEEEF2   |
	STA $7E9128,x				;$BEEEF3   |
CODE_BEEEF7:					;	   |
	REP #$20				;$BEEEF7   |
CODE_BEEEF9:					;	   |
	LDX current_sprite			;$BEEEF9   |
	STZ $00,x				;$BEEEFB   |
	JML [$05A9]				;$BEEEFD  /

CODE_BEEF00:
	CLC					;$BEEF00  \
	ADC $32					;$BEEF01   |
	TAX					;$BEEF03   |
	SEP #$20				;$BEEF04   |
	LDA $0044,y				;$BEEF06   |
	CMP $7E8D28,x				;$BEEF09   |
	BEQ CODE_BEEF16				;$BEEF0D   |
	INX					;$BEEF0F   |
	CMP $7E8D28,x				;$BEEF10   |
	BNE CODE_BEEF1C				;$BEEF14   |
CODE_BEEF16:					;	   |
	LDA #$00				;$BEEF16   |
	STA $7E8D28,x				;$BEEF18   |
CODE_BEEF1C:					;	   |
	REP #$20				;$BEEF1C   |
	RTS					;$BEEF1E  /

CODE_BEEF1F:
	LDX current_sprite			;$BEEF1F  \
	LDA $54,x				;$BEEF21   |
	STA $8E					;$BEEF23   |
	LDA $2E,x				;$BEEF25   |
	BNE CODE_BEEF47				;$BEEF27   |
	JSL CODE_808E4F				;$BEEF29   |
	STA CPU.dividen				;$BEEF2D   |
	LDX current_sprite			;$BEEF30   |
	SEP #$20				;$BEEF32   |
	LDA $44,x				;$BEEF34   |
	STA CPU.divisor				;$BEEF36   |
	REP #$20				;$BEEF39   |
	INC $2E,x				;$BEEF3B   |
	NOP					;$BEEF3D   |
	NOP					;$BEEF3E   |
	NOP					;$BEEF3F   |
	NOP					;$BEEF40   |
	LDA CPU.multiply_result			;$BEEF41   |
	INC A					;$BEEF44   |
	STA $4A,x				;$BEEF45   |
CODE_BEEF47:					;	   |
	LDY $42,x				;$BEEF47   |
	JSL CODE_BB8432				;$BEEF49   |
	BCS CODE_BEEF7E				;$BEEF4D   |
	LDX alternate_sprite			;$BEEF4F   |
	LDA [$8E]				;$BEEF51   |
	STA $06,x				;$BEEF53   |
	LDY #$0002				;$BEEF55   |
	LDA [$8E],y				;$BEEF58   |
	STA $0A,x				;$BEEF5A   |
	LDX current_sprite			;$BEEF5C   |
	LDY $46,x				;$BEEF5E   |
	LDA $44,x				;$BEEF60   |
	CMP $4A,x				;$BEEF62   |
	BNE CODE_BEEF68				;$BEEF64   |
	LDY $48,x				;$BEEF66   |
CODE_BEEF68:					;	   |
	TYA					;$BEEF68   |
	LDY alternate_sprite			;$BEEF69   |
	STA $0042,y				;$BEEF6B   |
	LDA $54,x				;$BEEF6E   |
	CLC					;$BEEF70   |
	ADC #$0004				;$BEEF71   |
	STA $54,x				;$BEEF74   |
	STA $8E					;$BEEF76   |
	DEC $44,x				;$BEEF78   |
	BNE CODE_BEEF47				;$BEEF7A   |
	STZ $00,x				;$BEEF7C   |
CODE_BEEF7E:					;	   |
	JML [$05A9]				;$BEEF7E  /

CODE_BEEF81:
	LDA $08B8				;$BEEF81  \ load number of cheated krem coins
	BNE CODE_BEEFAD				;$BEEF84   | if player already cheated skip the checks for cheat activation
	LDY current_sprite			;$BEEF86   | get sprite index
	LDA $002E,y				;$BEEF88   | get current cheat step
	ASL A					;$BEEF8B   |
	TAX					;$BEEF8C   |
	JMP (DATA_BEEF90,x)			;$BEEF8D  / execute the check

;table for all the krem coin cheat checks
DATA_BEEF90:					
	dw CODE_BEEF9E				;next cheat check
	dw CODE_BEEFB7				;wait for player to enter cabin and enable banana count check
	dw CODE_BEEFD1				;make sure player didnt grab extra life
	dw CODE_BEEFD9				;wait for banana bunch to be collected
	dw CODE_BEEFF8				;wait for player to enter cabin and wait for extra life to be collected
	dw CODE_BEEFD9				;wait for banana bunch to be collected
	dw CODE_BEF012				;check banana count then enable cheat flag


CODE_BEEF9E:
	LDA $08BB				;$BEEF9E  \ load current cheat step
	AND #$0007				;$BEEFA1   |
	INC A					;$BEEFA4   | add 1 to step counter
	STA $002E,y				;$BEEFA5   | update step counter on cheat sprite
	ASL A					;$BEEFA8   |
	TAX					;$BEEFA9   |
	JMP (DATA_BEEF90,x)			;$BEEFAA  / execute current step check

CODE_BEEFAD:
	LDX current_sprite			;$BEEFAD  \ get sprite index
	STZ $00,x				;$BEEFAF   | delete cheat sprite
	STZ $08BA				;$BEEFB1   | set bananas before cheat to 0
	JML [$05A9]				;$BEEFB4  / return from sprite code

CODE_BEEFB7:
	LDA level_number			;$BEEFB7  \ get the current level
	CMP #$001B				;$BEEFB9   | check if player is in the ship cabin
	BNE CODE_BEEFAD				;$BEEFBC   | if the player isnt in the ship cabin disable the cheat sprite
	LDA $08BC				;$BEEFBE   | get current banana count
	SEP #$20				;$BEEFC1   | turn on 8 bit
	STA $08BA				;$BEEFC3   | set bananas before cheat to current banana count
	REP #$20				;$BEEFC6   | back to 16 bit
	TYX					;$BEEFC8   |
	INC $2E,x				;$BEEFC9   | increment step counter
	INC $08BB				;$BEEFCB   |	
	INC $08BB				;$BEEFCE   |
CODE_BEEFD1:					;	   |
	LDA $0971				;$BEEFD1   | load number of lives to give player
	BNE CODE_BEEFAD				;$BEEFD4   | if the player collected any lives disable the cheat sprite
	JML [$05A9]				;$BEEFD6  / return from sprite code

CODE_BEEFD9:
	LDA level_number			;$BEEFD9  \ get the current level
	CMP #$0003				;$BEEFDB   | check if player is in pirate panic
	BNE CODE_BEEFAD				;$BEEFDE   | if the player isnt in pirate panic disable the cheat sprite
	LDA $08BA				;$BEEFE0   | get banana count before cheat
	AND #$00FF				;$BEEFE3   |
	SED					;$BEEFE6   | set decimal flag because banana counter is binary coded decimal
	SEC					;$BEEFE7   |
	SBC $08BC				;$BEEFE8   | banana count before cheat - current banana count
	CLD					;$BEEFEB   |
	BEQ CODE_BEF00F				;$BEEFEC   | if the banana counts are the same return from sprite code
	AND #$00FF				;$BEEFEE   |
	CMP #$0090				;$BEEFF1   | check if the player collected a banana bunch
	BEQ CODE_BEF025				;$BEEFF4   | if the player collected a banana bunch continue to next check
	BRA CODE_BEEFAD				;$BEEFF6  / otherwise disable the cheat sprite

CODE_BEEFF8:
	LDA level_number			;$BEEFF8  \ get the current level
	CMP #$001B				;$BEEFFA   | check if player is in the ship cabin
	BNE CODE_BEEFAD				;$BEEFFD   | if the player isnt in the ship cabin disable the cheat sprite
	LDA $08BA				;$BEEFFF   | get banana count before cheat
	AND #$00FF				;$BEF002   |
	CMP $08BC				;$BEF005   | check if the banana count now is the same as it was before the cheat
	BNE CODE_BEEFAD				;$BEF008   | if not disable the cheat sprite
	LDA $0971				;$BEF00A   | load number of lives to give player
	BNE CODE_BEF025				;$BEF00D   | if the player collected any lives continue to next check
CODE_BEF00F:					;	   |
	JML [$05A9]				;$BEF00F  / otherwise return from sprite code

CODE_BEF012:
	LDA $08BA				;$BEF012  \ get banana count before cheat
	AND #$00FF				;$BEF015   |
	CMP $08BC				;$BEF018   | check if the banana count now is the same as it was before the cheat
	BNE CODE_BEEFAD				;$BEF01B   | if not disable the cheat sprite
	LDA #$0001				;$BEF01D   | enable the cheat
	TSB $0923				;$BEF020   |
	BRA CODE_BEEFAD				;$BEF023  / then kill the cheat sprite

CODE_BEF025:
	LDA $08BC				;$BEF025  \ get current banana count
	SEP #$20				;$BEF028   | turn on 8 bit
	STA $08BA				;$BEF02A   | set bananas before cheat to current banana count
	REP #$20				;$BEF02D   | back to 16 bit
	INC $08BB				;$BEF02F   | increment step counter
	LDX current_sprite			;$BEF032   | get sprite index
	STZ $00,x				;$BEF034   | kill sprite
	JML [$05A9]				;$BEF036  / return from sprite code

CODE_BEF039:
	LDX current_sprite			;$BEF039  \
	LDA $52,x				;$BEF03B   |
CODE_BEF03D:					;	   |
	TAY					;$BEF03D   |
	AND #$00FF				;$BEF03E   |
	ASL A					;$BEF041   |
	TAX					;$BEF042   |
	TYA					;$BEF043   |
	XBA					;$BEF044   |
	AND #$00FF				;$BEF045   |
	ASL A					;$BEF048   |
	LDY current_sprite			;$BEF049   |
	JSR (DATA_BEF051,x)			;$BEF04B   |
	LDX current_sprite			;$BEF04E   |
	RTL					;$BEF050  /

;object movement routines
DATA_BEF051:
	dw CODE_BEF0A7				;00
	dw CODE_BEF0A8				;01
	dw CODE_BEF0AB				;02
	dw CODE_BEF0C7				;03
	dw CODE_BEF0E3				;04
	dw CODE_BEF0EC				;05
	dw CODE_BEF143				;06
	dw CODE_BEF19A				;07
	dw CODE_BEF1CC				;08
	dw CODE_BEF1D5				;09
	dw CODE_BEF3C3				;0A
	dw CODE_BEF3E6				;0B
	dw CODE_BEF4A5				;0C
	dw CODE_BEF4AE				;0D
	dw CODE_BEF4E8				;0E
	dw CODE_BEF52D				;0F
	dw CODE_BEF536				;10
	dw CODE_BEF567				;11
	dw CODE_BEF5A4				;12
	dw CODE_BEF5AD				;13
	dw CODE_BEF5B1				;14
	dw CODE_BEF5C3				;15
	dw CODE_BEF5E7				;16
	dw CODE_BEF603				;17
	dw CODE_BEF60D				;18
	dw CODE_BEF624				;19
	dw CODE_BEF449				;1A
	dw CODE_BEF65B				;1B
	dw CODE_BEF6C3				;1C
	dw CODE_BEF780				;1D
	dw CODE_BEF0A7				;1E
	dw CODE_BEF0A7				;1F
	dw CODE_BEF7AB				;20
	dw CODE_BEF7BC				;21
	dw CODE_BEF7EF				;22
	dw CODE_BEF808				;23
	dw CODE_BEF8EE				;24
	dw CODE_BEFA15				;25
	dw CODE_BEFA37				;26
	dw CODE_BEFA58				;27
	dw CODE_BEFA88				;28
	dw CODE_BEFAE6				;29
	dw CODE_BEFB22				;2A


CODE_BEF0A7:
	RTS					;$BEF0A7  \
CODE_BEF0A8:					;	   |
	JSR CODE_BEF0C7				;$BEF0A8   |
CODE_BEF0AB:					;	   |
	LDX #$0000				;$BEF0AB   |
	LDA $0020,y				;$BEF0AE   |
	BPL CODE_BEF0B4				;$BEF0B1   |
	DEX					;$BEF0B3   |
CODE_BEF0B4:					;	   |
	CLC					;$BEF0B4   |
	ADC $0005,y				;$BEF0B5   |
	STA $0005,y				;$BEF0B8   |
	SEP #$20				;$BEF0BB   |
	TXA					;$BEF0BD   |
	ADC $0007,y				;$BEF0BE   |
	STA $0007,y				;$BEF0C1   |
	REP #$20				;$BEF0C4   |
	RTS					;$BEF0C6  /

CODE_BEF0C7:
	LDX #$0000				;$BEF0C7  \
	LDA $0024,y				;$BEF0CA   |
	BPL CODE_BEF0D0				;$BEF0CD   |
	DEX					;$BEF0CF   |
CODE_BEF0D0:					;	   |
	CLC					;$BEF0D0   |
	ADC $0009,y				;$BEF0D1   |
	STA $0009,y				;$BEF0D4   |
	SEP #$20				;$BEF0D7   |
	TXA					;$BEF0D9   |
	ADC $000B,y				;$BEF0DA   |
	STA $000B,y				;$BEF0DD   |
	REP #$20				;$BEF0E0   |
	RTS					;$BEF0E2  /

CODE_BEF0E3:
	JSR CODE_BEF0A8				;$BEF0E3  \
	JSR CODE_BEFB45				;$BEF0E6   |
	JMP CODE_BEFB4F				;$BEF0E9  /

CODE_BEF0EC:
	LDA $0053,y				;$BEF0EC  \
	AND #$00FF				;$BEF0EF   |
	ASL A					;$BEF0F2   |
	TAX					;$BEF0F3   |
	JSR (DATA_BEF0FD,x)			;$BEF0F4   |
	JSR CODE_BEF0A8				;$BEF0F7   |
	JMP CODE_BEFB45				;$BEF0FA  /

DATA_BEF0FD:
	dw CODE_BEF101
	dw CODE_BEF10D


CODE_BEF101:
	TYX					;$BEF101  \
	LDA $06,x				;$BEF102   |
	STA $42,x				;$BEF104   |
	LDA $26,x				;$BEF106   |
	STA $48,x				;$BEF108   |
	INC $53,x				;$BEF10A   |
	RTS					;$BEF10C  /

CODE_BEF10D:
	LDA $0026,y				;$BEF10D  \
	BPL CODE_BEF133				;$BEF110   |
	LDA $0046,y				;$BEF112   |
	XBA					;$BEF115   |
	AND #$00FF				;$BEF116   |
	EOR #$FFFF				;$BEF119   |
	SEC					;$BEF11C   |
	ADC $0042,y				;$BEF11D   |
	CMP $0006,y				;$BEF120   |
	BCC CODE_BEF142				;$BEF123   |
CODE_BEF125:					;	   |
	LDA $0048,y				;$BEF125   |
	EOR #$FFFF				;$BEF128   |
	INC A					;$BEF12B   |
	STA $0048,y				;$BEF12C   |
	STA $0026,y				;$BEF12F   |
	RTS					;$BEF132  /

CODE_BEF133:
	LDA $0046,y				;$BEF133  \
	AND #$00FF				;$BEF136   |
	CLC					;$BEF139   |
	ADC $0042,y				;$BEF13A   |
	CMP $0006,y				;$BEF13D   |
	BCC CODE_BEF125				;$BEF140   |
CODE_BEF142:					;	   |
	RTS					;$BEF142  /

CODE_BEF143:
	LDA $0053,y				;$BEF143  \
	AND #$00FF				;$BEF146   |
	ASL A					;$BEF149   |
	TAX					;$BEF14A   |
	JSR (DATA_BEF154,x)			;$BEF14B   |
	JSR CODE_BEF0A8				;$BEF14E   |
	JMP CODE_BEFB3B				;$BEF151  /

DATA_BEF154:
	dw CODE_BEF158
	dw CODE_BEF164


CODE_BEF158:
	TYX					;$BEF158  \
	LDA $0A,x				;$BEF159   |
	STA $44,x				;$BEF15B   |
	LDA $2A,x				;$BEF15D   |
	STA $4C,x				;$BEF15F   |
	INC $53,x				;$BEF161   |
	RTS					;$BEF163  /

CODE_BEF164:
	LDA $002A,y				;$BEF164  \
	BPL CODE_BEF18A				;$BEF167   |
	LDA $004A,y				;$BEF169   |
	XBA					;$BEF16C   |
	AND #$00FF				;$BEF16D   |
	EOR #$FFFF				;$BEF170   |
	SEC					;$BEF173   |
	ADC $0044,y				;$BEF174   |
	CMP $000A,y				;$BEF177   |
	BCC CODE_BEF199				;$BEF17A   |
CODE_BEF17C:					;	   |
	LDA $004C,y				;$BEF17C   |
	EOR #$FFFF				;$BEF17F   |
	INC A					;$BEF182   |
	STA $004C,y				;$BEF183   |
	STA $002A,y				;$BEF186   |
	RTS					;$BEF189  /

CODE_BEF18A:
	LDA $004A,y				;$BEF18A  \
	AND #$00FF				;$BEF18D   |
	CLC					;$BEF190   |
	ADC $0044,y				;$BEF191   |
	CMP $000A,y				;$BEF194   |
	BCC CODE_BEF17C				;$BEF197   |
CODE_BEF199:					;	   |
	RTS					;$BEF199  /

CODE_BEF19A:
	LDA $0053,y				;$BEF19A  \
	AND #$00FF				;$BEF19D   |
	ASL A					;$BEF1A0   |
	TAX					;$BEF1A1   |
	JSR (DATA_BEF1AE,x)			;$BEF1A2   |
	JSR CODE_BEF0A8				;$BEF1A5   |
	JSR CODE_BEFB45				;$BEF1A8   |
	JMP CODE_BEFB3B				;$BEF1AB  /

DATA_BEF1AE:
	dw CODE_BEF1B2
	dw CODE_BEF1C6


CODE_BEF1B2:
	TYX					;$BEF1B2  \
	LDA $06,x				;$BEF1B3   |
	STA $42,x				;$BEF1B5   |
	LDA $0A,x				;$BEF1B7   |
	STA $44,x				;$BEF1B9   |
	LDA $26,x				;$BEF1BB   |
	STA $48,x				;$BEF1BD   |
	LDA $2A,x				;$BEF1BF   |
	STA $4C,x				;$BEF1C1   |
	INC $53,x				;$BEF1C3   |
	RTS					;$BEF1C5  /

CODE_BEF1C6:
	JSR CODE_BEF10D				;$BEF1C6  \
	JMP CODE_BEF164				;$BEF1C9  /

CODE_BEF1CC:
	JSR CODE_BEFB45				;$BEF1CC  \
	JSR CODE_BEF0AB				;$BEF1CF   |
	JMP CODE_BEF143				;$BEF1D2  /

CODE_BEF1D5:
	TAX					;$BEF1D5  \
	JSR (DATA_BEF1DC,x)			;$BEF1D6   |
	JMP CODE_BEF0A8				;$BEF1D9  /

DATA_BEF1DC:
	dw CODE_BEF1E0
	dw CODE_BEF1EE


CODE_BEF1E0:
	TYX					;$BEF1E0  \
	INC $53,x				;$BEF1E1   |
	LDA #$1919				;$BEF1E3   |
	STA $4A,x				;$BEF1E6   |
	STZ $4C,x				;$BEF1E8   |
	STZ $50,x				;$BEF1EA   |
	BRA CODE_BEF266				;$BEF1EC  /

CODE_BEF1EE:
	TYX					;$BEF1EE  \
	LDA $42,x				;$BEF1EF   |
	BEQ CODE_BEF20F				;$BEF1F1   |
	LDA $46,x				;$BEF1F3   |
	BEQ CODE_BEF202				;$BEF1F5   |
	CMP $06,x				;$BEF1F7   |
	BEQ CODE_BEF266				;$BEF1F9   |
	ROR A					;$BEF1FB   |
	EOR $26,x				;$BEF1FC   |
	BPL CODE_BEF266				;$BEF1FE   |
	BRA CODE_BEF20F				;$BEF200  /

CODE_BEF202:
	LDA $48,x				;$BEF202  \
	BEQ CODE_BEF20F				;$BEF204   |
	CMP $0A,x				;$BEF206   |
	BEQ CODE_BEF266				;$BEF208   |
	ROR A					;$BEF20A   |
	EOR $2A,x				;$BEF20B   |
	BPL CODE_BEF266				;$BEF20D   |
CODE_BEF20F:					;	   |
	LDX current_sprite			;$BEF20F   |
	LDA $4A,x				;$BEF211   |
	LDY $46,x				;$BEF213   |
	BEQ CODE_BEF218				;$BEF215   |
	XBA					;$BEF217   |
CODE_BEF218:					;	   |
	PHA					;$BEF218   |
	AND #$00FF				;$BEF219   |
	JSL CODE_B8D010				;$BEF21C   |
	PLA					;$BEF220   |
	XBA					;$BEF221   |
	AND #$00FF				;$BEF222   |
	JSL CODE_B8CFD4				;$BEF225   |
	LDX current_sprite			;$BEF229   |
	LDA $4C,x				;$BEF22B   |
	BEQ CODE_BEF258				;$BEF22D   |
	SEC					;$BEF22F   |
	SBC #$0100				;$BEF230   |
	STA $4C,x				;$BEF233   |
	BCS CODE_BEF245				;$BEF235   |
	SEP #$20				;$BEF237   |
	STA $4D,x				;$BEF239   |
	REP #$20				;$BEF23B   |
	LDA $50,x				;$BEF23D   |
	EOR #$FFFF				;$BEF23F   |
	INC A					;$BEF242   |
	STA $50,x				;$BEF243   |
CODE_BEF245:					;	   |
	LDA $46,x				;$BEF245   |
	BEQ CODE_BEF251				;$BEF247   |
	LDA $2A,x				;$BEF249   |
	CLC					;$BEF24B   |
	ADC $50,x				;$BEF24C   |
	STA $2A,x				;$BEF24E   |
	RTS					;$BEF250  /

CODE_BEF251:
	LDA $26,x				;$BEF251  \
	CLC					;$BEF253   |
	ADC $50,x				;$BEF254   |
	STA $26,x				;$BEF256   |
CODE_BEF258:					;	   |
	RTS					;$BEF258  /

CODE_BEF259:
	LDX current_sprite			;$BEF259  \
	SEP #$20				;$BEF25B   |
	LDA $4C,x				;$BEF25D   |
	LSR A					;$BEF25F   |
	STA $4D,x				;$BEF260   |
	REP #$20				;$BEF262   |
	BRA CODE_BEF20F				;$BEF264  /

CODE_BEF266:
	PHK					;$BEF266  \
	PLB					;$BEF267   |
	STZ $5E					;$BEF268   |
	LDA $90					;$BEF26A   |
	STA $60					;$BEF26C   |
CODE_BEF26E:					;	   |
	LDA $42,x				;$BEF26E   |
	TAY					;$BEF270   |
	CLC					;$BEF271   |
	ADC #$0004				;$BEF272   |
	STA $42,x				;$BEF275   |
	LDA [$5E],y				;$BEF277   |
	INY					;$BEF279   |
	INY					;$BEF27A   |
	CMP #$FFFA				;$BEF27B   |
	BCS CODE_BEF2E3				;$BEF27E   |
	BIT $44,x				;$BEF280   |
	BMI CODE_BEF296				;$BEF282   |
	STA $46,x				;$BEF284   |
	SEC					;$BEF286   |
	SBC $06,x				;$BEF287   |
	STA $32					;$BEF289   |
	LDA [$5E],y				;$BEF28B   |
	STA $48,x				;$BEF28D   |
	SEC					;$BEF28F   |
	SBC $0A,x				;$BEF290   |
	STA $34					;$BEF292   |
	BRA CODE_BEF2A6				;$BEF294  /

CODE_BEF296:
	STA $32					;$BEF296  \
	CLC					;$BEF298   |
	ADC $06,x				;$BEF299   |
	STA $46,x				;$BEF29B   |
	LDA [$5E],y				;$BEF29D   |
	STA $34					;$BEF29F   |
	CLC					;$BEF2A1   |
	ADC $0A,x				;$BEF2A2   |
	STA $48,x				;$BEF2A4   |
CODE_BEF2A6:					;	   |
	LDA $34					;$BEF2A6   |
	BPL CODE_BEF2AE				;$BEF2A8   |
	EOR #$FFFF				;$BEF2AA   |
	INC A					;$BEF2AD   |
CODE_BEF2AE:					;	   |
	STA $38					;$BEF2AE   |
	LDA $32					;$BEF2B0   |
	BPL CODE_BEF2B8				;$BEF2B2   |
	EOR #$FFFF				;$BEF2B4   |
	INC A					;$BEF2B7   |
CODE_BEF2B8:					;	   |
	STA $36					;$BEF2B8   |
	CMP $38					;$BEF2BA   |
	BCS CODE_BEF33C				;$BEF2BC   |
	STZ $46,x				;$BEF2BE   |
	LDA $44,x				;$BEF2C0   |
	AND #$7FFF				;$BEF2C2   |
	BIT $34					;$BEF2C5   |
	BPL CODE_BEF2CD				;$BEF2C7   |
	EOR #$FFFF				;$BEF2C9   |
	INC A					;$BEF2CC   |
CODE_BEF2CD:					;	   |
	STA $2A,x				;$BEF2CD   |
	LDA $36					;$BEF2CF   |
	LDY $38					;$BEF2D1   |
	JSR CODE_BEF361				;$BEF2D3   |
	BIT $32					;$BEF2D6   |
	BPL CODE_BEF2DE				;$BEF2D8   |
	EOR #$FFFF				;$BEF2DA   |
	INC A					;$BEF2DD   |
CODE_BEF2DE:					;	   |
	STA $26,x				;$BEF2DE   |
	BRL CODE_BEF259				;$BEF2E0  /

CODE_BEF2E3:
	ASL A					;$BEF2E3  \
	ADC #$000B				;$BEF2E4   |
	PHX					;$BEF2E7   |
	TAX					;$BEF2E8   |
	JMP (DATA_BEF2EC,x)			;$BEF2E9  /

DATA_BEF2EC:
	dw CODE_BEF2F8
	dw CODE_BEF30C
	dw CODE_BEF31E
	dw CODE_BEF326
	dw CODE_BEF32E
	dw CODE_BEF336



CODE_BEF2F8:
	PLA					;$BEF2F8  \
	CLC					;$BEF2F9   |
	ADC [$5E],y				;$BEF2FA   |
	TAX					;$BEF2FC   |
	INY					;$BEF2FD   |
	INY					;$BEF2FE   |
	LDA [$5E],y				;$BEF2FF   |
	STA $00,x				;$BEF301   |
	LDX current_sprite			;$BEF303   |
	INC $42,x				;$BEF305   |
	INC $42,x				;$BEF307   |
	BRL CODE_BEF26E				;$BEF309  /

CODE_BEF30C:
	PLX					;$BEF30C  \
	LDA [$5E],y				;$BEF30D   |
	STA $4C,x				;$BEF30F   |
	INY					;$BEF311   |
	INY					;$BEF312   |
	LDA [$5E],y				;$BEF313   |
	STA $50,x				;$BEF315   |
	INC $42,x				;$BEF317   |
	INC $42,x				;$BEF319   |
	BRL CODE_BEF26E				;$BEF31B  /

CODE_BEF31E:
	PLX					;$BEF31E  \
	LDA [$5E],y				;$BEF31F   |
	STA $4A,x				;$BEF321   |
	BRL CODE_BEF26E				;$BEF323  /

CODE_BEF326:
	PLX					;$BEF326  \
	LDA [$5E],y				;$BEF327   |
	STA $42,x				;$BEF329   |
	BRL CODE_BEF26E				;$BEF32B  /

CODE_BEF32E:
	PLX					;$BEF32E  \
	LDA [$5E],y				;$BEF32F   |
	STA $44,x				;$BEF331   |
	BRL CODE_BEF26E				;$BEF333  /

CODE_BEF336:
	PLX					;$BEF336  \
	STZ $52,x				;$BEF337   |
	BRL CODE_BEF20F				;$BEF339  /

CODE_BEF33C:
	STZ $48,x				;$BEF33C  \
	LDA $44,x				;$BEF33E   |
	AND #$7FFF				;$BEF340   |
	BIT $32					;$BEF343   |
	BPL CODE_BEF34B				;$BEF345   |
	EOR #$FFFF				;$BEF347   |
	INC A					;$BEF34A   |
CODE_BEF34B:					;	   |
	STA $26,x				;$BEF34B   |
	LDA $38					;$BEF34D   |
	LDY $36					;$BEF34F   |
	JSR CODE_BEF361				;$BEF351   |
	BIT $34					;$BEF354   |
	BPL CODE_BEF35C				;$BEF356   |
	EOR #$FFFF				;$BEF358   |
	INC A					;$BEF35B   |
CODE_BEF35C:					;	   |
	STA $2A,x				;$BEF35C   |
	BRL CODE_BEF259				;$BEF35E  /

CODE_BEF361:
	PHY					;$BEF361  \
	LDY #$0000				;$BEF362   |
CODE_BEF365:					;	   |
	CMP #$0100				;$BEF365   |
	BCC CODE_BEF36E				;$BEF368   |
	LSR A					;$BEF36A   |
	INY					;$BEF36B   |
	BRA CODE_BEF365				;$BEF36C  /

CODE_BEF36E:
	SEP #$20				;$BEF36E  \
	STA CPU.multiply_A			;$BEF370   |
	REP #$20				;$BEF373   |
	LDA $44,x				;$BEF375   |
	AND #$7FFF				;$BEF377   |
CODE_BEF37A:					;	   |
	CMP #$0100				;$BEF37A   |
	BCC CODE_BEF383				;$BEF37D   |
	LSR A					;$BEF37F   |
	INY					;$BEF380   |
	BRA CODE_BEF37A				;$BEF381  /

CODE_BEF383:
	SEP #$20				;$BEF383  \
	STA CPU.multiply_B			;$BEF385   |
	REP #$20				;$BEF388   |
	NOP					;$BEF38A   |
	NOP					;$BEF38B   |
	NOP					;$BEF38C   |
	LDA CPU.multiply_result			;$BEF38D   |
	STA CPU.dividen				;$BEF390   |
	PLA					;$BEF393   |
	BEQ CODE_BEF3C2				;$BEF394   |
CODE_BEF396:					;	   |
	CMP #$0100				;$BEF396   |
	BCC CODE_BEF39F				;$BEF399   |
	LSR A					;$BEF39B   |
	DEY					;$BEF39C   |
	BRA CODE_BEF396				;$BEF39D  /

CODE_BEF39F:
	SEP #$20				;$BEF39F  \
	STA CPU.divisor				;$BEF3A1   |
	REP #$20				;$BEF3A4   |
	NOP					;$BEF3A6   |
	NOP					;$BEF3A7   |
	NOP					;$BEF3A8   |
	NOP					;$BEF3A9   |
	TYA					;$BEF3AA   |
	BEQ CODE_BEF3B7				;$BEF3AB   |
	BPL CODE_BEF3BB				;$BEF3AD   |
	LDA CPU.divide_result			;$BEF3AF   |
CODE_BEF3B2:					;	   |
	LSR A					;$BEF3B2   |
	INY					;$BEF3B3   |
	BNE CODE_BEF3B2				;$BEF3B4   |
	RTS					;$BEF3B6  /

CODE_BEF3B7:
	LDA CPU.divide_result			;$BEF3B7  \
	RTS					;$BEF3BA  /

CODE_BEF3BB:
	LDA CPU.divide_result			;$BEF3BB  \
CODE_BEF3BE:					;	   |
	ASL A					;$BEF3BE   |
	DEY					;$BEF3BF   |
	BNE CODE_BEF3BE				;$BEF3C0   |
CODE_BEF3C2:					;	   |
	RTS					;$BEF3C2  /

CODE_BEF3C3:
	TAX					;$BEF3C3  \
	JMP (DATA_BEF3C7,x)			;$BEF3C4  /

DATA_BEF3C7:
	dw CODE_BEF3CB
	dw CODE_BEF3DA

CODE_BEF3CB:
	TYX					;$BEF3CB  \
	LDA $06,x				;$BEF3CC   |
	STA $42,x				;$BEF3CE   |
	LDA $0A,x				;$BEF3D0   |
	STA $44,x				;$BEF3D2   |
	LDA $26,x				;$BEF3D4   |
	STA $20,x				;$BEF3D6   |
	INC $53,x				;$BEF3D8   |
CODE_BEF3DA:					;	   |
	LDX current_sprite			;$BEF3DA   |
	LDA $46,x				;$BEF3DC   |
	CLC					;$BEF3DE   |
	ADC $20,x				;$BEF3DF   |
	STA $46,x				;$BEF3E1   |
	JMP CODE_BEF449				;$BEF3E3  /

CODE_BEF3E6:
	TAX					;$BEF3E6  \
	JMP (DATA_BEF3EA,x)			;$BEF3E7  /

DATA_BEF3EA:
	dw CODE_BEF3EE
	dw CODE_BEF404


CODE_BEF3EE:
	TYX					;$BEF3EE  \
	LDA $06,x				;$BEF3EF   |
	STA $42,x				;$BEF3F1   |
	LDA $0A,x				;$BEF3F3   |
	STA $44,x				;$BEF3F5   |
	LDA $26,x				;$BEF3F7   |
	STA $20,x				;$BEF3F9   |
	BPL CODE_BEF402				;$BEF3FB   |
	LDA $4A,x				;$BEF3FD   |
	XBA					;$BEF3FF   |
	STA $4A,x				;$BEF400   |
CODE_BEF402:					;	   |
	INC $53,x				;$BEF402   |
CODE_BEF404:					;	   |
	LDX current_sprite			;$BEF404   |
	LDA $4A,x				;$BEF406   |
	BIT $26,x				;$BEF408   |
	BMI CODE_BEF40D				;$BEF40A   |
	XBA					;$BEF40C   |
CODE_BEF40D:					;	   |
	AND #$FF00				;$BEF40D   |
	STA $5E					;$BEF410   |
	LDA $46,x				;$BEF412   |
	STA $60					;$BEF414   |
	CLC					;$BEF416   |
	ADC $20,x				;$BEF417   |
	STA $46,x				;$BEF419   |
	BIT $20,x				;$BEF41B   |
	BPL CODE_BEF42A				;$BEF41D   |
	LDA $5E					;$BEF41F   |
	SEC					;$BEF421   |
	SBC $60					;$BEF422   |
	CMP $20,x				;$BEF424   |
	BCC CODE_BEF43C				;$BEF426   |
	BRA CODE_BEF434				;$BEF428  /

CODE_BEF42A:
	LDA $5E					;$BEF42A  \
	CLC					;$BEF42C   |
	SBC $60					;$BEF42D   |
	CLC					;$BEF42F   |
	ADC $20,x				;$BEF430   |
	BCC CODE_BEF43C				;$BEF432   |
CODE_BEF434:					;	   |
	LDA $26,x				;$BEF434   |
	EOR #$FFFF				;$BEF436   |
	INC A					;$BEF439   |
	STA $26,x				;$BEF43A   |
CODE_BEF43C:					;	   |
	LDA #$000A				;$BEF43C   |
	JSL CODE_B8D010				;$BEF43F   |
	LDX current_sprite			;$BEF443   |
	JSR CODE_BEF449				;$BEF445   |
	RTS					;$BEF448  /

CODE_BEF449:
	PHK					;$BEF449  \
	PLB					;$BEF44A   |
	LDA $48,x				;$BEF44B   |
	AND #$FF00				;$BEF44D   |
	STA $5E					;$BEF450   |
	LDA $47,x				;$BEF452   |
	AND #$00FF				;$BEF454   |
	STA $60					;$BEF457   |
	JSL CODE_B3F4B8				;$BEF459   |
	JSR CODE_BEF47B				;$BEF45D   |
	LDX current_sprite			;$BEF460   |
	CLC					;$BEF462   |
	ADC $42,x				;$BEF463   |
	STA $06,x				;$BEF465   |
	LDA $60					;$BEF467   |
	JSL CODE_B3F4BC				;$BEF469   |
	JSR CODE_BEF47B				;$BEF46D   |
	LDX current_sprite			;$BEF470   |
	EOR #$FFFF				;$BEF472   |
	SEC					;$BEF475   |
	ADC $44,x				;$BEF476   |
	STA $0A,x				;$BEF478   |
	RTS					;$BEF47A  /

CODE_BEF47B:
	BPL CODE_BEF491				;$BEF47B  \
	EOR #$FFFF				;$BEF47D   |
	INC A					;$BEF480   |
	ORA $5E					;$BEF481   |
	STA CPU.multiply_A			;$BEF483   |
	LDA CPU.multiply_result			;$BEF486   |
	LDA CPU.multiply_result			;$BEF489   |
	XBA					;$BEF48C   |
	AND #$00FF				;$BEF48D   |
	RTS					;$BEF490  /

CODE_BEF491:
	ORA $5E					;$BEF491  \
	STA CPU.multiply_A			;$BEF493   |
	LDA CPU.multiply_result			;$BEF496   |
	LDA CPU.multiply_result			;$BEF499   |
	XBA					;$BEF49C   |
	AND #$00FF				;$BEF49D   |
	EOR #$FFFF				;$BEF4A0   |
	INC A					;$BEF4A3   |
	RTS					;$BEF4A4  /

CODE_BEF4A5:
	TYX					;$BEF4A5  \
	DEC $04,x				;$BEF4A6   |
	BPL CODE_BEF4AD				;$BEF4A8   |
	LSR A					;$BEF4AA   |
	STA $52,x				;$BEF4AB   |
CODE_BEF4AD:					;	   |
	RTS					;$BEF4AD  /

CODE_BEF4AE:
	LDY $0593				;$BEF4AE  \
	LDA $04,x				;$BEF4B1   |
	BEQ CODE_BEF4C8				;$BEF4B3   |
	CMP #$8000				;$BEF4B5   |
	ROR A					;$BEF4B8   |
	ROR $5E					;$BEF4B9   |
	CLC					;$BEF4BB   |
	ADC $06,x				;$BEF4BC   |
	CMP $0006,y				;$BEF4BE   |
	BEQ CODE_BEF4C8				;$BEF4C1   |
	ROR A					;$BEF4C3   |
	EOR $5E					;$BEF4C4   |
	BPL CODE_BEF4E7				;$BEF4C6   |
CODE_BEF4C8:					;	   |
	LDA $08,x				;$BEF4C8   |
	BEQ CODE_BEF4DF				;$BEF4CA   |
	CMP #$8000				;$BEF4CC   |
	ROR A					;$BEF4CF   |
	ROR $5E					;$BEF4D0   |
	CLC					;$BEF4D2   |
	ADC $0A,x				;$BEF4D3   |
	CMP $000A,y				;$BEF4D5   |
	BEQ CODE_BEF4DF				;$BEF4D8   |
	ROR A					;$BEF4DA   |
	EOR $5E					;$BEF4DB   |
	BPL CODE_BEF4E7				;$BEF4DD   |
CODE_BEF4DF:					;	   |
	LDA $53,x				;$BEF4DF   |
	AND #$00FF				;$BEF4E1   |
	STA $52,x				;$BEF4E4   |
	CLC					;$BEF4E6   |
CODE_BEF4E7:					;	   |
	RTS					;$BEF4E7  /

CODE_BEF4E8:
	TYX					;$BEF4E8  \
	LDY $0593				;$BEF4E9   |
	LDA $05,x				;$BEF4EC   |
	AND #$00FF				;$BEF4EE   |
	STA $5E					;$BEF4F1   |
	LDA $06,x				;$BEF4F3   |
	SEC					;$BEF4F5   |
	SBC $0006,y				;$BEF4F6   |
	BCS CODE_BEF501				;$BEF4F9   |
	ADC $5E					;$BEF4FB   |
	BCC CODE_BEF52C				;$BEF4FD   |
	BRA CODE_BEF505				;$BEF4FF  /

CODE_BEF501:
	CMP $5E					;$BEF501  \
	BCS CODE_BEF52C				;$BEF503   |
CODE_BEF505:					;	   |
	LDA $04,x				;$BEF505   |
	AND #$00FF				;$BEF507   |
	STA $5E					;$BEF50A   |
	LDA $0A,x				;$BEF50C   |
	SEC					;$BEF50E   |
	SBC $000A,y				;$BEF50F   |
	BCS CODE_BEF51A				;$BEF512   |
	ADC $5E					;$BEF514   |
	BCC CODE_BEF52C				;$BEF516   |
	BRA CODE_BEF51E				;$BEF518  /

CODE_BEF51A:
	CMP $5E					;$BEF51A  \
	BCS CODE_BEF52C				;$BEF51C   |
CODE_BEF51E:					;	   |
	LDA $53,x				;$BEF51E   |
	AND #$00FF				;$BEF520   |
	BEQ CODE_BEF52A				;$BEF523   |
	STA $04,x				;$BEF525   |
	LDA #$000C				;$BEF527   |
CODE_BEF52A:					;	   |
	STA $52,x				;$BEF52A   |
CODE_BEF52C:					;	   |
	RTS					;$BEF52C  /

CODE_BEF52D:
	JSR CODE_BEFB45				;$BEF52D  \
	JSR CODE_BEFB3B				;$BEF530   |
	JMP CODE_BEF0A8				;$BEF533  /

CODE_BEF536:
	TAX					;$BEF536  \
	JMP (DATA_BEF53A,x)			;$BEF537  /

DATA_BEF53A:
	dw CODE_BEF0A7
	dw CODE_BEF540
	dw CODE_BEF54F


CODE_BEF540:
	TYX					;$BEF540  \
	INC $53,x				;$BEF541   |
	LDA $0A,x				;$BEF543   |
	STA $0C,x				;$BEF545   |
	STZ $08,x				;$BEF547   |
	JSR CODE_BEF0C7				;$BEF549   |
	JMP CODE_BEFB4F				;$BEF54C  /

CODE_BEF54F:
	JSR CODE_BEF0C7				;$BEF54F  \
	JSR CODE_BEFB4F				;$BEF552   |
	LDX current_sprite			;$BEF555   |
	LDA $0C,x				;$BEF557   |
	CMP $0A,x				;$BEF559   |
	BCS CODE_BEF566				;$BEF55B   |
	STA $0A,x				;$BEF55D   |
	LDA #$0010				;$BEF55F   |
	STA $52,x				;$BEF562   |
	STZ $24,x				;$BEF564   |
CODE_BEF566:					;	   |
	RTS					;$BEF566  /

CODE_BEF567:
	TAX					;$BEF567  \
	JMP (DATA_BEF56B,x)			;$BEF568  /

DATA_BEF56B:
	dw CODE_BEF0A7
	dw CODE_BEF571
	dw CODE_BEF580

CODE_BEF571:
	TYX					;$BEF571  \
	INC $53,x				;$BEF572   |
	LDA $06,x				;$BEF574   |
	STA $0C,x				;$BEF576   |
	STZ $04,x				;$BEF578   |
	JSR CODE_BEFB45				;$BEF57A   |
	JMP CODE_BEF0AB				;$BEF57D  /

CODE_BEF580:
	JSR CODE_BEFB45				;$BEF580  \
	JSR CODE_BEF0AB				;$BEF583   |
	TYX					;$BEF586   |
	LDA $0C,x				;$BEF587   |
	CMP $06,x				;$BEF589   |
	BEQ CODE_BEF59A				;$BEF58B   |
	ROR $5E					;$BEF58D   |
	LDA $12,x				;$BEF58F   |
	ASL A					;$BEF591   |
	EOR $5E					;$BEF592   |
	ASL A					;$BEF594   |
	LDA $0C,x				;$BEF595   |
	BCC CODE_BEF59A				;$BEF597   |
	RTS					;$BEF599  /

CODE_BEF59A:
	STA $06,x				;$BEF59A  \
	LDA #$0011				;$BEF59C   |
	STA $52,x				;$BEF59F   |
	STZ $20,x				;$BEF5A1   |
	RTS					;$BEF5A3  /

CODE_BEF5A4:
	JSR CODE_BEFB3B				;$BEF5A4  \
	JSR CODE_BEF0C7				;$BEF5A7   |
	JMP CODE_BEF0EC				;$BEF5AA  /

CODE_BEF5AD:
	JSR CODE_BEFB4F				;$BEF5AD  \
	TXY					;$BEF5B0   |
CODE_BEF5B1:					;	   |
	JSR CODE_BEF0A8				;$BEF5B1   |
	TYX					;$BEF5B4   |
	DEC $1E,x				;$BEF5B5   |
	BPL CODE_BEF5C2				;$BEF5B7   |
	STZ $1E,x				;$BEF5B9   |
	LDA $53,x				;$BEF5BB   |
	AND #$00FF				;$BEF5BD   |
	STA $52,x				;$BEF5C0   |
CODE_BEF5C2:					;	   |
	RTS					;$BEF5C2  /

CODE_BEF5C3:
	TYX					;$BEF5C3  \
	DEC $1E,x				;$BEF5C4   |
	BMI CODE_BEF5CF				;$BEF5C6   |
	JSR CODE_BEFB4F				;$BEF5C8   |
	TXY					;$BEF5CB   |
	JMP CODE_BEF0A8				;$BEF5CC  /

CODE_BEF5CF:
	LDA $0A,x				;$BEF5CF  \
	STA $1E,x				;$BEF5D1   |
	LDA $20,x				;$BEF5D3   |
	CMP #$8000				;$BEF5D5   |
	ROR A					;$BEF5D8   |
	CMP #$8000				;$BEF5D9   |
	ROR A					;$BEF5DC   |
	STA $20,x				;$BEF5DD   |
	LDA #$FE80				;$BEF5DF   |
	STA $24,x				;$BEF5E2   |
	INC $52,x				;$BEF5E4   |
	RTS					;$BEF5E6  /

CODE_BEF5E7:
	JSR CODE_BEFB4F				;$BEF5E7  \
	TXY					;$BEF5EA   |
	JSR CODE_BEF0A8				;$BEF5EB   |
	TYX					;$BEF5EE   |
	LDA $1E,x				;$BEF5EF   |
	CMP $0A,x				;$BEF5F1   |
	BCS CODE_BEF602				;$BEF5F3   |
	BIT $24,x				;$BEF5F5   |
	BMI CODE_BEF602				;$BEF5F7   |
	STZ $1E,x				;$BEF5F9   |
	LDA $53,x				;$BEF5FB   |
	AND #$00FF				;$BEF5FD   |
	STA $52,x				;$BEF600   |
CODE_BEF602:					;	   |
	RTS					;$BEF602  /

CODE_BEF603:
	JSR CODE_BEFB4F				;$BEF603  \
	TXY					;$BEF606   |
	JSR CODE_BEF0C7				;$BEF607   |
	JMP CODE_BEF0EC				;$BEF60A  /

CODE_BEF60D:
	TYX					;$BEF60D  \
	LDA $04,x				;$BEF60E   |
	BIT $12,x				;$BEF610   |
	BVC CODE_BEF618				;$BEF612   |
	EOR #$FFFF				;$BEF614   |
	INC A					;$BEF617   |
CODE_BEF618:					;	   |
	CMP #$8000				;$BEF618   |
	ROR A					;$BEF61B   |
	STA $04,x				;$BEF61C   |
	JSR CODE_BEF632				;$BEF61E   |
	INC $52,x				;$BEF621   |
	RTS					;$BEF623  /

CODE_BEF624:
	TYX					;$BEF624  \
	JSR CODE_BEF632				;$BEF625   |
	BPL CODE_BEF631				;$BEF628   |
	LDA $53,x				;$BEF62A   |
	AND #$00FF				;$BEF62C   |
	STA $52,x				;$BEF62F   |
CODE_BEF631:					;	   |
	RTS					;$BEF631  /

CODE_BEF632:
	LDY $0593				;$BEF632  \
	ASL $04,x				;$BEF635   |
	BEQ CODE_BEF649				;$BEF637   |
	PHP					;$BEF639   |
	LDA $04,x				;$BEF63A   |
	CLC					;$BEF63C   |
	ADC $06,x				;$BEF63D   |
	CMP $0006,y				;$BEF63F   |
	ROR $04,x				;$BEF642   |
	PLP					;$BEF644   |
	ROR A					;$BEF645   |
	EOR $04,x				;$BEF646   |
	RTS					;$BEF648  /

CODE_BEF649:
	ASL $08,x				;$BEF649  \
	PHP					;$BEF64B   |
	LDA $08,x				;$BEF64C   |
	CLC					;$BEF64E   |
	ADC $0A,x				;$BEF64F   |
	CMP $000A,y				;$BEF651   |
	ROR $08,x				;$BEF654   |
	PLP					;$BEF656   |
	ROR A					;$BEF657   |
	EOR $04,x				;$BEF658   |
	RTS					;$BEF65A  /

CODE_BEF65B:
	LDA $0053,y				;$BEF65B  \
	AND #$00FF				;$BEF65E   |
	ASL A					;$BEF661   |
	TAX					;$BEF662   |
	JSR (DATA_BEF66F,x)			;$BEF663   |
	JSR CODE_BEF0A8				;$BEF666   |
	JSR CODE_BEFB45				;$BEF669   |
	JMP CODE_BEFB3B				;$BEF66C  /

DATA_BEF66F:
	dw CODE_BEF673
	dw CODE_BEF687


CODE_BEF673:
	TYX					;$BEF673  \
	LDA $06,x				;$BEF674   |
	STA $42,x				;$BEF676   |
	LDA $0A,x				;$BEF678   |
	STA $44,x				;$BEF67A   |
	LDA $26,x				;$BEF67C   |
	STA $48,x				;$BEF67E   |
	LDA $2A,x				;$BEF680   |
	STA $4C,x				;$BEF682   |
	INC $53,x				;$BEF684   |
	RTS					;$BEF686  /

CODE_BEF687:
	JSR CODE_BEF10D				;$BEF687  \
	LDA $002A,y				;$BEF68A   |
	BPL CODE_BEF6B2				;$BEF68D   |
	LDA $004A,y				;$BEF68F   |
	XBA					;$BEF692   |
	AND #$00FF				;$BEF693   |
	ASL A					;$BEF696   |
	ASL A					;$BEF697   |
	EOR #$FFFF				;$BEF698   |
	SEC					;$BEF69B   |
	ADC $0044,y				;$BEF69C   |
	CMP $000A,y				;$BEF69F   |
	BCC CODE_BEF6C2				;$BEF6A2   |
CODE_BEF6A4:					;	   |
	LDA $004C,y				;$BEF6A4   |
	EOR #$FFFF				;$BEF6A7   |
	INC A					;$BEF6AA   |
	STA $004C,y				;$BEF6AB   |
	STA $002A,y				;$BEF6AE   |
	RTS					;$BEF6B1  /

CODE_BEF6B2:
	LDA $004A,y				;$BEF6B2  \
	AND #$00FF				;$BEF6B5   |
	ASL A					;$BEF6B8   |
	ASL A					;$BEF6B9   |
	ADC $0044,y				;$BEF6BA   |
	CMP $000A,y				;$BEF6BD   |
	BCC CODE_BEF6A4				;$BEF6C0   |
CODE_BEF6C2:					;	   |
	RTS					;$BEF6C2  /

CODE_BEF6C3:
	TAX					;$BEF6C3  \
	BNE CODE_BEF734				;$BEF6C4   |
	STZ $32					;$BEF6C6   |
	LDX $0593				;$BEF6C8   |
	LDA $0A,x				;$BEF6CB   |
	SEC					;$BEF6CD   |
	SBC $000A,y				;$BEF6CE   |
	BPL CODE_BEF6D9				;$BEF6D1   |
	EOR #$FFFF				;$BEF6D3   |
	INC A					;$BEF6D6   |
	DEC $32					;$BEF6D7   |
CODE_BEF6D9:					;	   |
	XBA					;$BEF6D9   |
	STA CPU.dividen				;$BEF6DA   |
	SEP #$20				;$BEF6DD   |
	LDA $0048,y				;$BEF6DF   |
	STA CPU.divisor				;$BEF6E2   |
	REP #$20				;$BEF6E5   |
	LDA $0A,x				;$BEF6E7   |
	STA $004A,y				;$BEF6E9   |
	STZ $34					;$BEF6EC   |
	LDA CPU.divide_result			;$BEF6EE   |
	BIT $32					;$BEF6F1   |
	BPL CODE_BEF6F9				;$BEF6F3   |
	EOR #$FFFF				;$BEF6F5   |
	INC A					;$BEF6F8   |
CODE_BEF6F9:					;	   |
	CLC					;$BEF6F9   |
	ADC $0024,y				;$BEF6FA   |
	STA $0024,y				;$BEF6FD   |
	LDA $06,x				;$BEF700   |
	SEC					;$BEF702   |
	SBC $0006,y				;$BEF703   |
	BPL CODE_BEF70E				;$BEF706   |
	EOR #$FFFF				;$BEF708   |
	INC A					;$BEF70B   |
	DEC $34					;$BEF70C   |
CODE_BEF70E:					;	   |
	XBA					;$BEF70E   |
	STA CPU.dividen				;$BEF70F   |
	SEP #$20				;$BEF712   |
	LDA $0048,y				;$BEF714   |
	STA CPU.divisor				;$BEF717   |
	REP #$20				;$BEF71A   |
	LDA $06,x				;$BEF71C   |
	STA $0048,y				;$BEF71E   |
	TYX					;$BEF721   |
	INC $53,x				;$BEF722   |
	LDA CPU.divide_result			;$BEF724   |
	BIT $34					;$BEF727   |
	BPL CODE_BEF72F				;$BEF729   |
	EOR #$FFFF				;$BEF72B   |
	INC A					;$BEF72E   |
CODE_BEF72F:					;	   |
	STA $0020,y				;$BEF72F   |
	BRA CODE_BEF75B				;$BEF732  /

CODE_BEF734:
	LDX $0593				;$BEF734  \
	LDA $06,x				;$BEF737   |
	SEC					;$BEF739   |
	SBC $0048,y				;$BEF73A   |
	CLC					;$BEF73D   |
	ADC $0006,y				;$BEF73E   |
	STA $0006,y				;$BEF741   |
	LDA $06,x				;$BEF744   |
	STA $0048,y				;$BEF746   |
	LDA $0A,x				;$BEF749   |
	SEC					;$BEF74B   |
	SBC $004A,y				;$BEF74C   |
	CLC					;$BEF74F   |
	ADC $000A,y				;$BEF750   |
	STA $000A,y				;$BEF753   |
	LDA $0A,x				;$BEF756   |
	STA $004A,y				;$BEF758   |
CODE_BEF75B:					;	   |
	JSR CODE_BEF0A8				;$BEF75B   |
	LDX current_sprite			;$BEF75E   |
	LDA $4C,x				;$BEF760   |
	CLC					;$BEF762   |
	ADC $24,x				;$BEF763   |
	BMI CODE_BEF76F				;$BEF765   |
	CMP #$0800				;$BEF767   |
	BCC CODE_BEF76F				;$BEF76A   |
	LDA #$0800				;$BEF76C   |
CODE_BEF76F:					;	   |
	STA $24,x				;$BEF76F   |
	ASL A					;$BEF771   |
	BCS CODE_BEF77F				;$BEF772   |
	LDA $12,x				;$BEF774   |
	EOR $4E,x				;$BEF776   |
	AND #$3000				;$BEF778   |
	EOR $12,x				;$BEF77B   |
	STA $12,x				;$BEF77D   |
CODE_BEF77F:					;	   |
	RTS					;$BEF77F  /

CODE_BEF780:
	LDX current_sprite			;$BEF780  \
	LDA #$0108				;$BEF782   |
	CMP $06,x				;$BEF785   |
	BCS CODE_BEF794				;$BEF787   |
	LDA $0AFC				;$BEF789   |
	ADC #$00F8				;$BEF78C   |
	CMP $06,x				;$BEF78F   |
	BCC CODE_BEF794				;$BEF791   |
	RTS					;$BEF793  /

CODE_BEF794:
	BEQ CODE_BEF7AA				;$BEF794  \
	STA $06,x				;$BEF796   |
	LDA $26,x				;$BEF798   |
	EOR $20,x				;$BEF79A   |
	ASL A					;$BEF79C   |
	STZ $20,x				;$BEF79D   |
	BCS CODE_BEF7AA				;$BEF79F   |
	STZ $26,x				;$BEF7A1   |
	LDA #$0002				;$BEF7A3   |
	ORA $1E,x				;$BEF7A6   |
	STA $1E,x				;$BEF7A8   |
CODE_BEF7AA:					;	   |
	RTS					;$BEF7AA  /

CODE_BEF7AB:
	JSR CODE_BEF7BC				;$BEF7AB  \
	JSR CODE_BEF780				;$BEF7AE   |
	JSR CODE_BEFB45				;$BEF7B1   |
	JSR CODE_BEFB4F				;$BEF7B4   |
	JSL CODE_B8D246				;$BEF7B7   |
	RTS					;$BEF7BB  /

CODE_BEF7BC:
	LDA $0D4E				;$BEF7BC  \
	BPL CODE_BEF7C6				;$BEF7BF   |
CODE_BEF7C1:					;	   |
	JSL CODE_B8D5E0				;$BEF7C1   |
	RTS					;$BEF7C5  /

CODE_BEF7C6:
	LDX current_sprite			;$BEF7C6  \
	CLC					;$BEF7C8   |
	ADC #$0010				;$BEF7C9   |
	CMP $0A,x				;$BEF7CC   |
	BCS CODE_BEF7C1				;$BEF7CE   |
	LDA $20,x				;$BEF7D0   |
	ASL A					;$BEF7D2   |
	ROR $20,x				;$BEF7D3   |
	ASL A					;$BEF7D5   |
	ROR $20,x				;$BEF7D6   |
	LDA $24,x				;$BEF7D8   |
	ASL A					;$BEF7DA   |
	ROR $24,x				;$BEF7DB   |
	ASL A					;$BEF7DD   |
	ROR $24,x				;$BEF7DE   |
	JSL CODE_B8D5E0				;$BEF7E0   |
	LDX current_sprite			;$BEF7E4   |
	ASL $20,x				;$BEF7E6   |
	ASL $20,x				;$BEF7E8   |
	ASL $24,x				;$BEF7EA   |
	ASL $24,x				;$BEF7EC   |
	RTS					;$BEF7EE  /

CODE_BEF7EF:
	LDA $0026,y				;$BEF7EF  \
	PHA					;$BEF7F2   |
	JSR CODE_BEF7AB				;$BEF7F3   |
	PLY					;$BEF7F6   |
	LDX current_sprite			;$BEF7F7   |
	LDA #$0002				;$BEF7F9   |
	AND $1E,x				;$BEF7FC   |
	BEQ CODE_BEF807				;$BEF7FE   |
	TYA					;$BEF800   |
	EOR #$FFFF				;$BEF801   |
	INC A					;$BEF804   |
	STA $26,x				;$BEF805   |
CODE_BEF807:					;	   |
	RTS					;$BEF807  /

CODE_BEF808:
	TAX					;$BEF808  \
	JSR (DATA_BEF80F,x)			;$BEF809   |
	JMP CODE_BEF7AB				;$BEF80C  /

DATA_BEF80F:
	dw CODE_BEF815
	dw CODE_BEF825
	dw CODE_BEF8D0


CODE_BEF815:
	TYX					;$BEF815  \
	LDA $06,x				;$BEF816   |
	STA $42,x				;$BEF818   |
	LDA $0A,x				;$BEF81A   |
	STA $44,x				;$BEF81C   |
	LDA $26,x				;$BEF81E   |
	STA $48,x				;$BEF820   |
	INC $53,x				;$BEF822   |
	RTS					;$BEF824  /

CODE_BEF825:
	LDA $0010,y				;$BEF825  \
	AND #$0007				;$BEF828   |
	CMP #$0006				;$BEF82B   |
	BEQ CODE_BEF86E				;$BEF82E   |
	LDA $001E,y				;$BEF830   |
	AND #$0002				;$BEF833   |
	BNE CODE_BEF892				;$BEF836   |
	LDA $0026,y				;$BEF838   |
	BPL CODE_BEF85E				;$BEF83B   |
	LDA $0046,y				;$BEF83D   |
	XBA					;$BEF840   |
	AND #$00FF				;$BEF841   |
	EOR #$FFFF				;$BEF844   |
	SEC					;$BEF847   |
	ADC $0042,y				;$BEF848   |
	CMP $0006,y				;$BEF84B   |
	BCC CODE_BEF86D				;$BEF84E   |
CODE_BEF850:					;	   |
	LDA $0026,y				;$BEF850   |
	EOR #$FFFF				;$BEF853   |
	INC A					;$BEF856   |
	STA $0026,y				;$BEF857   |
	STA $0048,y				;$BEF85A   |
	RTS					;$BEF85D  /

CODE_BEF85E:
	LDA $0046,y				;$BEF85E  \
	AND #$00FF				;$BEF861   |
	CLC					;$BEF864   |
	ADC $0042,y				;$BEF865   |
	CMP $0006,y				;$BEF868   |
	BCC CODE_BEF850				;$BEF86B   |
CODE_BEF86D:					;	   |
	RTS					;$BEF86D  /

CODE_BEF86E:
	TYX					;$BEF86E  \
	INC $53,x				;$BEF86F   |
	RTS					;$BEF871  /

	JSR CODE_BEF7BC				;$BEF872   |
	JSR CODE_BEF780				;$BEF875   |
	JSR CODE_BEFB45				;$BEF878   |
	JSR CODE_BEFB4F				;$BEF87B   |
	JSL CODE_B8D246				;$BEF87E   |
	JSR CODE_BEF7BC				;$BEF882   |
	JSR CODE_BEF780				;$BEF885   |
	JSR CODE_BEFB45				;$BEF888   |
	JSR CODE_BEFB4F				;$BEF88B   |
	JSL CODE_B8D246				;$BEF88E   |
CODE_BEF892:					;	   |
	TYX					;$BEF892   |
	LDA $46,x				;$BEF893   |
	BIT $48,x				;$BEF895   |
	BPL CODE_BEF8B3				;$BEF897   |
	AND #$FF00				;$BEF899   |
	XBA					;$BEF89C   |
	CLC					;$BEF89D   |
	ADC $0006,y				;$BEF89E   |
	CMP #$0100				;$BEF8A1   |
	BCS CODE_BEF8A9				;$BEF8A4   |
	LDA #$0100				;$BEF8A6   |
CODE_BEF8A9:					;	   |
	STA $0042,y				;$BEF8A9   |
	LDA $0048,y				;$BEF8AC   |
	BPL CODE_BEF8C9				;$BEF8AF   |
	BRA CODE_BEF8C5				;$BEF8B1  /

CODE_BEF8B3:
	AND #$00FF				;$BEF8B3  \
	EOR #$FFFF				;$BEF8B6   |
	SEC					;$BEF8B9   |
	ADC $0006,y				;$BEF8BA   |
	STA $0042,y				;$BEF8BD   |
	LDA $0048,y				;$BEF8C0   |
	BMI CODE_BEF8C9				;$BEF8C3   |
CODE_BEF8C5:					;	   |
	EOR #$FFFF				;$BEF8C5   |
	INC A					;$BEF8C8   |
CODE_BEF8C9:					;	   |
	STA $0026,y				;$BEF8C9   |
	STA $0048,y				;$BEF8CC   |
	RTS					;$BEF8CF  /

CODE_BEF8D0:
	LDA $0010,y				;$BEF8D0  \
	AND #$0007				;$BEF8D3   |
	CMP #$0006				;$BEF8D6   |
	BEQ CODE_BEF8ED				;$BEF8D9   |
	TYX					;$BEF8DB   |
	LDA $48,x				;$BEF8DC   |
	EOR #$FFFF				;$BEF8DE   |
	INC A					;$BEF8E1   |
	STA $48,x				;$BEF8E2   |
	LDA $1E,x				;$BEF8E4   |
	ORA #$0002				;$BEF8E6   |
	STA $1E,x				;$BEF8E9   |
	DEC $53,x				;$BEF8EB   |
CODE_BEF8ED:					;	   |
	RTS					;$BEF8ED  /

CODE_BEF8EE:
	LDA $0053,y				;$BEF8EE  \
	AND #$00FF				;$BEF8F1   |
	ASL A					;$BEF8F4   |
	TAX					;$BEF8F5   |
	JSR (DATA_BEF907,x)			;$BEF8F6   |
	LDY current_sprite			;$BEF8F9   |
	JSR CODE_BEF0A8				;$BEF8FB   |
	LDA $0006,y				;$BEF8FE   |
	STA $0042,y				;$BEF901   |
	JMP CODE_BEFB3B				;$BEF904  /

DATA_BEF907:
	dw CODE_BEF90B
	dw CODE_BEF937


CODE_BEF90B:
	JSR CODE_BEF158				;$BEF90B  \
	LDA $0A,x				;$BEF90E   |
	STA $0C,x				;$BEF910   |
	LDY current_sprite			;$BEF912   |
	LDX $0593				;$BEF914   |
	LDA $42,x				;$BEF917   |
	STA $0002,y				;$BEF919   |
CODE_BEF91C:					;	   |
	LDY current_sprite			;$BEF91C   |
	LDX $02,y				;$BEF91E   |
	LDY current_sprite			;$BEF920   |
	LDA $0010,y				;$BEF922   |
	STA $32					;$BEF925   |
	CPX current_sprite			;$BEF927   |
	LDA $4A,x				;$BEF929   |
	BCC CODE_BEF92F				;$BEF92B   |
	LDA $06,x				;$BEF92D   |
CODE_BEF92F:					;	   |
	SEC					;$BEF92F   |
	SBC $005C,y				;$BEF930   |
	STA $0010,y				;$BEF933   |
	RTS					;$BEF936  /

CODE_BEF937:
	STZ $0A92				;$BEF937  \
	LDA #$0000				;$BEF93A   |
	LDX #$0000				;$BEF93D   |
	JSR CODE_BEF9F2				;$BEF940   |
	BNE CODE_BEF959				;$BEF943   |
	LDA #$FFC0				;$BEF945   |
	LDX #$0000				;$BEF948   |
	JSR CODE_BEF9F2				;$BEF94B   |
	BNE CODE_BEF959				;$BEF94E   |
	LDA #$0040				;$BEF950   |
	LDX #$0000				;$BEF953   |
	JSR CODE_BEF9F2				;$BEF956   |
CODE_BEF959:					;	   |
	STA $0A92				;$BEF959   |
	LDA $AC					;$BEF95C   |
	STA $0A94				;$BEF95E   |
	STZ $0A96				;$BEF961   |
	LDA #$0000				;$BEF964   |
	LDX #$0040				;$BEF967   |
	JSR CODE_BEF9F2				;$BEF96A   |
	BNE CODE_BEF983				;$BEF96D   |
	LDA #$FFC0				;$BEF96F   |
	LDX #$0040				;$BEF972   |
	JSR CODE_BEF9F2				;$BEF975   |
	BNE CODE_BEF983				;$BEF978   |
	LDA #$0040				;$BEF97A   |
	LDX #$0040				;$BEF97D   |
	JSR CODE_BEF9F2				;$BEF980   |
CODE_BEF983:					;	   |
	STA $0A96				;$BEF983   |
	LDY current_sprite			;$BEF986   |
	LDA $0A92				;$BEF988   |
	BNE CODE_BEF995				;$BEF98B   |
	LDA $0A96				;$BEF98D   |
	BNE CODE_BEF995				;$BEF990   |
	LDA $000C,y				;$BEF992   |
CODE_BEF995:					;	   |
	STA $000C,y				;$BEF995   |
	SEC					;$BEF998   |
	SBC $000E,y				;$BEF999   |
	STA $0044,y				;$BEF99C   |
	SEC					;$BEF99F   |
	SBC $000A,y				;$BEF9A0   |
	STA $32					;$BEF9A3   |
	EOR $002A,y				;$BEF9A5   |
	BMI CODE_BEF9D3				;$BEF9A8   |
	LDA $004A,y				;$BEF9AA   |
	BIT $32					;$BEF9AD   |
	BPL CODE_BEF9BC				;$BEF9AF   |
	XBA					;$BEF9B1   |
	AND #$00FF				;$BEF9B2   |
	CLC					;$BEF9B5   |
	ADC $32					;$BEF9B6   |
	BPL CODE_BEF9D3				;$BEF9B8   |
	BRA CODE_BEF9C7				;$BEF9BA  /

CODE_BEF9BC:
	AND #$00FF				;$BEF9BC  \
	EOR #$FFFF				;$BEF9BF   |
	SEC					;$BEF9C2   |
	ADC $32					;$BEF9C3   |
	BMI CODE_BEF9D3				;$BEF9C5   |
CODE_BEF9C7:					;	   |
	ASL A					;$BEF9C7   |
	ASL A					;$BEF9C8   |
	ASL A					;$BEF9C9   |
	ASL A					;$BEF9CA   |
	ASL A					;$BEF9CB   |
	CLC					;$BEF9CC   |
	ADC $004C,y				;$BEF9CD   |
	STA $002A,y				;$BEF9D0   |
CODE_BEF9D3:					;	   |
	JSR CODE_BEF164				;$BEF9D3   |
	JSR CODE_BEF91C				;$BEF9D6   |
	SEC					;$BEF9D9   |
	SBC $32					;$BEF9DA   |
	CLC					;$BEF9DC   |
	ADC $0006,y				;$BEF9DD   |
	STA $0006,y				;$BEF9E0   |
	SEC					;$BEF9E3   |
	SBC $0010,y				;$BEF9E4   |
	EOR #$FFFF				;$BEF9E7   |
	INC A					;$BEF9EA   |
	ASL A					;$BEF9EB   |
	ASL A					;$BEF9EC   |
	ASL A					;$BEF9ED   |
	STA $0020,y				;$BEF9EE   |
	RTS					;$BEF9F1  /

CODE_BEF9F2:
	LDY current_sprite			;$BEF9F2  \
	CLC					;$BEF9F4   |
	ADC $000C,y				;$BEF9F5   |
	STA $34					;$BEF9F8   |
	TXA					;$BEF9FA   |
	CLC					;$BEF9FB   |
	ADC $0006,y				;$BEF9FC   |
	CLC					;$BEF9FF   |
	ADC $005C,y				;$BEFA00   |
	JSL CODE_B5C3E7				;$BEFA03   |
	EOR #$FFFF				;$BEFA07   |
	BPL CODE_BEFA11				;$BEFA0A   |
	SEC					;$BEFA0C   |
	ADC #$6300				;$BEFA0D   |
	RTS					;$BEFA10  /

CODE_BEFA11:
	LDA #$0000				;$BEFA11  \
	RTS					;$BEFA14  /

CODE_BEFA15:
	JSR CODE_BEF7BC				;$BEFA15  \
	JSR CODE_BEF780				;$BEFA18   |
	LDX current_sprite			;$BEFA1B   |
	LDA $22,x				;$BEFA1D   |
	CLC					;$BEFA1F   |
	ADC $24,x				;$BEFA20   |
	BMI CODE_BEFA2D				;$BEFA22   |
	LDY #$0002				;$BEFA24   |
	CMP [$8E],y				;$BEFA27   |
	BCC CODE_BEFA2D				;$BEFA29   |
	LDA [$8E],y				;$BEFA2B   |
CODE_BEFA2D:					;	   |
	STA $24,x				;$BEFA2D   |
	JSR CODE_BEFB45				;$BEFA2F   |
	JSL CODE_B8D246				;$BEFA32   |
	RTS					;$BEFA36  /

CODE_BEFA37:
	JSR CODE_BEF7BC				;$BEFA37  \
	JSR CODE_BEF780				;$BEFA3A   |
	JSR CODE_BEFB4F				;$BEFA3D   |
	JSL CODE_B8D246				;$BEFA40   |
	LDX current_sprite			;$BEFA44   |
	LDA $1E,x				;$BEFA46   |
	AND #$0101				;$BEFA48   |
	CMP #$0101				;$BEFA4B   |
	BNE CODE_BEFA57				;$BEFA4E   |
	LDA $53,x				;$BEFA50   |
	AND #$00FF				;$BEFA52   |
	STA $52,x				;$BEFA55   |
CODE_BEFA57:					;	   |
	RTS					;$BEFA57  /

CODE_BEFA58:
	JSR CODE_BEF7BC				;$BEFA58  \
	JSR CODE_BEF780				;$BEFA5B   |
	JSR CODE_BEFB4F				;$BEFA5E   |
	JSL CODE_B8D246				;$BEFA61   |
	LDX current_sprite			;$BEFA65   |
	LDA $1E,x				;$BEFA67   |
	AND #$0101				;$BEFA69   |
	CMP #$0101				;$BEFA6C   |
	BNE CODE_BEFA87				;$BEFA6F   |
	LDA $24,x				;$BEFA71   |
	EOR #$FFFF				;$BEFA73   |
	INC A					;$BEFA76   |
	STA $24,x				;$BEFA77   |
	LDA $20,x				;$BEFA79   |
	CMP #$8000				;$BEFA7B   |
	ROR A					;$BEFA7E   |
	CMP #$8000				;$BEFA7F   |
	ROR A					;$BEFA82   |
	STA $20,x				;$BEFA83   |
	DEC $52,x				;$BEFA85   |
CODE_BEFA87:					;	   |
	RTS					;$BEFA87  /

CODE_BEFA88:
	LDA $0026,y				;$BEFA88  \
	PHA					;$BEFA8B   |
	JSR CODE_BEF7AB				;$BEFA8C   |
	LDX current_sprite			;$BEFA8F   |
	LDA #$0002				;$BEFA91   |
	AND $1E,x				;$BEFA94   |
	BNE CODE_BEFA9A				;$BEFA96   |
	PLA					;$BEFA98   |
	RTS					;$BEFA99  /

CODE_BEFA9A:
	LDA $0A,x				;$BEFA9A  \
	SEC					;$BEFA9C   |
	SBC $42,x				;$BEFA9D   |
	STA $34					;$BEFA9F   |
	LDY #$000F				;$BEFAA1   |
	LDA $01,s				;$BEFAA4   |
	BPL CODE_BEFAAB				;$BEFAA6   |
	LDY #$FFF1				;$BEFAA8   |
CODE_BEFAAB:					;	   |
	TYA					;$BEFAAB   |
	CLC					;$BEFAAC   |
	ADC $06,x				;$BEFAAD   |
	JSL CODE_B5C3E7				;$BEFAAF   |
	EOR #$FFFF				;$BEFAB3   |
	BPL CODE_BEFAD3				;$BEFAB6   |
	SEC					;$BEFAB8   |
	ADC #$6300				;$BEFAB9   |
	SEC					;$BEFABC   |
	SBC $0A,x				;$BEFABD   |
	BCS CODE_BEFAC5				;$BEFABF   |
	ADC $42,x				;$BEFAC1   |
	BCC CODE_BEFAD3				;$BEFAC3   |
CODE_BEFAC5:					;	   |
	PLA					;$BEFAC5   |
	STA $26,x				;$BEFAC6   |
	CMP #$8000				;$BEFAC8   |
	ROR A					;$BEFACB   |
	STA $20,x				;$BEFACC   |
	LDA $44,x				;$BEFACE   |
	STA $24,x				;$BEFAD0   |
	RTS					;$BEFAD2  /

CODE_BEFAD3:
	PLA					;$BEFAD3  \
	EOR #$FFFF				;$BEFAD4   |
	INC A					;$BEFAD7   |
	STA $26,x				;$BEFAD8   |
	STZ $20,x				;$BEFADA   |
	STZ $04,x				;$BEFADC   |
	LDA #$0561				;$BEFADE   |
	JSL CODE_B3A3FC				;$BEFAE1   |
	RTS					;$BEFAE5  /

CODE_BEFAE6:
	LDA $0026,y				;$BEFAE6  \
	STA $0DAA				;$BEFAE9   |
	LDA $002A,y				;$BEFAEC   |
	STA $0DAE				;$BEFAEF   |
	JSR CODE_BEFB45				;$BEFAF2   |
	JSR CODE_BEFB3B				;$BEFAF5   |
	JSL CODE_B8D5E0				;$BEFAF8   |
	LDX current_sprite			;$BEFAFC   |
	LDA $26,x				;$BEFAFE   |
	BNE CODE_BEFB08				;$BEFB00   |
	SEC					;$BEFB02   |
	SBC $0DAA				;$BEFB03   |
	STA $26,x				;$BEFB06   |
CODE_BEFB08:					;	   |
	LDA $2A,x				;$BEFB08   |
	BEQ CODE_BEFB16				;$BEFB0A   |
	LDA $1E,x				;$BEFB0C   |
	AND #$0101				;$BEFB0E   |
	CMP #$0001				;$BEFB11   |
	BNE CODE_BEFB21				;$BEFB14   |
CODE_BEFB16:					;	   |
	LDA $0DAE				;$BEFB16   |
	EOR #$FFFF				;$BEFB19   |
	INC A					;$BEFB1C   |
	STA $2A,x				;$BEFB1D   |
	STZ $24,x				;$BEFB1F   |
CODE_BEFB21:					;	   |
	RTS					;$BEFB21  /

CODE_BEFB22:
	TYX					;$BEFB22  \
	LDA $26,x				;$BEFB23   |
	PHA					;$BEFB25   |
	LDA $20,x				;$BEFB26   |
	PHA					;$BEFB28   |
	STZ $20,x				;$BEFB29   |
	JSR CODE_BEFB3B				;$BEFB2B   |
	JSL CODE_B8D5E0				;$BEFB2E   |
	LDX current_sprite			;$BEFB32   |
	PLA					;$BEFB34   |
	STA $20,x				;$BEFB35   |
	PLA					;$BEFB37   |
	STA $26,x				;$BEFB38   |
	RTS					;$BEFB3A  /

CODE_BEFB3B:
	LDY #$0004				;$BEFB3B  \
	LDA [$8E],y				;$BEFB3E   |
	JSL CODE_B8CFD4				;$BEFB40   |
	RTS					;$BEFB44  /

CODE_BEFB45:
	LDY #$0004				;$BEFB45  \
	LDA [$8E],y				;$BEFB48   |
	JSL CODE_B8D010				;$BEFB4A   |
	RTS					;$BEFB4E  /

CODE_BEFB4F:
	LDX current_sprite			;$BEFB4F  \
	LDY #$0000				;$BEFB51   |
	LDA [$8E],y				;$BEFB54   |
	LDY #$0002				;$BEFB56   |
	CLC					;$BEFB59   |
	ADC $24,x				;$BEFB5A   |
	BMI CODE_BEFB64				;$BEFB5C   |
	CMP [$8E],y				;$BEFB5E   |
	BCC CODE_BEFB64				;$BEFB60   |
	LDA [$8E],y				;$BEFB62   |
CODE_BEFB64:					;	   |
	STA $24,x				;$BEFB64   |
	RTS					;$BEFB66  /
