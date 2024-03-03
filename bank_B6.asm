CODE_B68000:					;	   |
	JSL CODE_BBBB99				;$B68000   |
	JML [$05A9]				;$B68004  /

	STA $32,x				;$B68007   |
	TXA					;$B68009   |
	STA $34,x				;$B6800A   |
	RTL					;$B6800C  /

CODE_B6800D:
	JSL CODE_BCFED8				;$B6800D  \
	BCS CODE_B68022				;$B68011   |
	JSL CODE_BCFEC0				;$B68013   |
	JSL CODE_B3A334				;$B68017   |
	LDY #$0034				;$B6801B   |
	JSL CODE_BB842C				;$B6801E   |
CODE_B68022:					;	   |
	LDX current_sprite			;$B68022   |
	RTS					;$B68024  /

CODE_B68025:
	TAX					;$B68025  \
	PHK					;$B68026   |
	PLB					;$B68027   |
	JMP (DATA_B6802B,x)			;$B68028  /

DATA_B6802B:
	dw CODE_B68053				;0000 kudgel_main
	dw CODE_B682DF				;0002 kudgels_club_main
	dw CODE_B69397				;0004 krool_gun_main
	dw CODE_B699EB				;0006 shot_donkey_kong_main
	dw CODE_B69A5A				;0008 krool_canball_main
	dw CODE_B69EEA				;000A spiked_canballs_main
	dw CODE_B6A3D6				;000C krool_gun_fire_main
	dw CODE_B6A3D6				;000E krool_gun_vacuum_effect_main
	dw CODE_B6A3D6				;0010 krools_blinking_eyes_main
	dw CODE_B6A3DD				;0012 krool_puddle_main
	dw CODE_B6A43B				;0014 unknown_sprite_0294_main
	dw CODE_B6A485				;0016 tied_up_donkey_kong_main
	dw CODE_B6A725				;0018 unknown_sprite_0290_main
	dw CODE_B6A82A				;001A donkey_kongs_rope_main
	dw CODE_B6A82A				;001C donkey_kongs_bindings_main
	dw CODE_B6A877				;001E lava_splash_main
	dw CODE_B6D02E				;0020 klubba_main
	dw CODE_B6D06E				;0022 klubbas_club_main
	dw CODE_B68D70				;0024 krool_main
	dw CODE_B6A877				;0026 unknown_sprite_004C_main

CODE_B68053:
	PHB					;$B68053  \
	PHK					;$B68054   |
	PLB					;$B68055   |
	LDX current_sprite			;$B68056   |
	LDA $42,x				;$B68058   |
	BNE CODE_B68094				;$B6805A   |
	JSL CODE_B4AEAF				;$B6805C   |
	STZ $073D				;$B68060   |
	STZ $32,x				;$B68063   |
	STZ $06A1				;$B68065   |
	STZ $06A3				;$B68068   |
	STZ $06A5				;$B6806B   |
	LDA #DATA_B684D4			;$B6806E   |
	STA $00065A				;$B68071   |
	LDA #$0006				;$B68075   | set kudgel hit counter
	STA $000652				;$B68078   |
	LDY #$015E				;$B6807C   |
	JSL CODE_BB8443				;$B6807F   |
	LDY alternate_sprite			;$B68083   |
	LDX current_sprite			;$B68085   |
	STX $0654				;$B68087   |
	STY $0656				;$B6808A   |
	STY $42,x				;$B6808D   |
	STZ $44,x				;$B6808F   |
	JSR CODE_B6D008				;$B68091   |
CODE_B68094:					;	   |
	LDX current_sprite			;$B68094   |
	LDA $2E,x				;$B68096   |
	BIT #$0001				;$B68098   |
	BNE CODE_B680A8				;$B6809B   |
	LDA $0A36				;$B6809D   |
	BIT #$0004				;$B680A0   |
	BEQ CODE_B680A8				;$B680A3   |
	BRL CODE_B68182				;$B680A5  /

CODE_B680A8:
	LDA $0AB8				;$B680A8  \
	AND #$BFFF				;$B680AB   |
	ORA #$8000				;$B680AE   |
	STA $0AB8				;$B680B1   |
	LDX current_sprite			;$B680B4   |
	LDY active_kong_sprite			;$B680B6   |
	LDA $0006,y				;$B680B9   |
	CMP $06,x				;$B680BC   |
	BCC CODE_B680C5				;$B680BE   |
	LDA #$C800				;$B680C0   |
	BRA CODE_B680C8				;$B680C3  /

CODE_B680C5:
	LDA #$3800				;$B680C5  \
CODE_B680C8:					;	   |
	STA $0AEC				;$B680C8   |
CODE_B680CB:					;	   |
	LDA.l $000652				;$B680CB   |
	BNE CODE_B680D4				;$B680CF   |
	BRL CODE_B684BA				;$B680D1  /

CODE_B680D4:
	LDX current_sprite			;$B680D4  \
	LDA $2E,x				;$B680D6   |
	BIT #$0100				;$B680D8   |
	BEQ CODE_B680ED				;$B680DB   |
	LDA $32,x				;$B680DD   |
	BIT #$0008				;$B680DF   |
	BEQ CODE_B680ED				;$B680E2   |
	JSR CODE_B689F8				;$B680E4   |
	LDA.l $000652				;$B680E7   |
	BEQ CODE_B680CB				;$B680EB   |
CODE_B680ED:					;	   |
	LDA.l $00073D				;$B680ED   |
	BEQ CODE_B680F9				;$B680F1   |
	DEC $073D				;$B680F3   |
	BRL CODE_B68147				;$B680F6  /

CODE_B680F9:
	LDX current_sprite			;$B680F9  \
	LDA $2E,x				;$B680FB   |
	BIT #$0200				;$B680FD   |
	BEQ CODE_B6812C				;$B68100   |
	JSL CODE_BCFB58				;$B68102   |
	LDA #$0C7B				;$B68106   |
	JSL CODE_B6CF65				;$B68109   |
	BCC CODE_B68147				;$B6810D   |
	LDA #$001E				;$B6810F   |
	LDY #$FE00				;$B68112   |
	JSL CODE_B3A600				;$B68115   |
	LDX $0654				;$B68119   |
	LDA $2E,x				;$B6811C   |
	ORA #$0200				;$B6811E   |
	STA $2E,x				;$B68121   |
	LDA #$0014				;$B68123   |
	STA $00073D				;$B68126   |
	BRA CODE_B68147				;$B6812A  /

CODE_B6812C:
	JSL CODE_BCFB58				;$B6812C  \
	LDA #$0000				;$B68130   |
	JSL CODE_B6CF65				;$B68133   |
	BCC CODE_B68147				;$B68137   |
	LDX current_sprite			;$B68139   |
	LDA #$0014				;$B6813B   |
	STA $00073D				;$B6813E   |
	LDX $0D7A				;$B68142   |
	BEQ CODE_B68147				;$B68145   |
CODE_B68147:					;	   |
	LDX current_sprite			;$B68147   |
	LDA $44,x				;$B68149   |
	BNE CODE_B68152				;$B6814B   |
	JSR CODE_B6D008				;$B6814D   |
	BRA CODE_B6815E				;$B68150  /

CODE_B68152:
	JSR ($0044,x)				;$B68152  \
	LDX current_sprite			;$B68155   |
	LDA $44,x				;$B68157   |
	BNE CODE_B6815E				;$B68159   |
	JSR CODE_B6D008				;$B6815B   |
CODE_B6815E:					;	   |
	JSR CODE_B68186				;$B6815E   |
	JSR CODE_B6819C				;$B68161   |
	JSL CODE_B9D100				;$B68164   |
	JSR CODE_B6820D				;$B68168   |
CODE_B6816B:					;	   |
	LDX current_sprite			;$B6816B   |
	LDA #$0120				;$B6816D   |
	CMP $06,x				;$B68170   |
	BCC CODE_B68176				;$B68172   |
	STA $06,x				;$B68174   |
CODE_B68176:					;	   |
	LDA #$0260				;$B68176   |
	CMP $06,x				;$B68179   |
	BCS CODE_B6817F				;$B6817B   |
	STA $06,x				;$B6817D   |
CODE_B6817F:					;	   |
	JSR CODE_B68D5D				;$B6817F   |
CODE_B68182:					;	   |
	PLB					;$B68182   |
	JML [$05A9]				;$B68183  /

CODE_B68186:
	LDY $074F				;$B68186  \
	BEQ CODE_B6819B				;$B68189   |
	LDA $0000,y				;$B6818B   |
	CMP #$01B8				;$B6818E   |
	BEQ CODE_B6819B				;$B68191   |
	CMP #$017C				;$B68193   |
	BEQ CODE_B6819B				;$B68196   |
	STZ $074F				;$B68198   |
CODE_B6819B:					;	   |
	RTS					;$B6819B  /

CODE_B6819C:
	LDA.l $00074D				;$B6819C  \
	BEQ CODE_B681FE				;$B681A0   |
	PHB					;$B681A2   |
	LDA #$00FF				;$B681A3   |
	SEP #$20				;$B681A6   |
	CLC					;$B681A8   |
	ROR A					;$B681A9   |
	INC A					;$B681AA   |
	PHA					;$B681AB   |
	PLB					;$B681AC   |
	REP #$20				;$B681AD   |
	CLC					;$B681AF   |
	ADC #$0004				;$B681B0   |
	XBA					;$B681B3   |
	TAX					;$B681B4   |
	LDY $0038,x				;$B681B5   |
	CPY #$00AF				;$B681B8   |
	BEQ CODE_B681C7				;$B681BB   |
	STZ $0656				;$B681BD   |
	LDX $0654				;$B681C0   |
	DEC $44,x				;$B681C3   |
	DEC $44,x				;$B681C5   |
CODE_B681C7:					;	   |
	PLB					;$B681C7   |
	DEC $074D				;$B681C8   |
	LDY active_kong_sprite			;$B681CB   |
	LDA $002E,y				;$B681CE   |
	CMP #$0063				;$B681D1   |
	BEQ CODE_B681FE				;$B681D4   |
	LDA $0030,y				;$B681D6   |
	BIT #$0080				;$B681D9   |
	BNE CODE_B681FE				;$B681DC   |
	LDA $001E,y				;$B681DE   |
	BIT #$0001				;$B681E1   |
	BEQ CODE_B681FE				;$B681E4   |
	STZ $074D				;$B681E6   |
	LDA #$000B				;$B681E9   |
	JSL CODE_B8D8BA				;$B681EC   |
	BCS CODE_B681FE				;$B681F0   |
	LDA.l $000652				;$B681F2   |
	ASL A					;$B681F6   |
	TAY					;$B681F7   |
	LDA DATA_B681FF,y			;$B681F8   |
	STA $0A86				;$B681FB   |
CODE_B681FE:					;	   |
	RTS					;$B681FE  /

;kudgel landing stun timers
;each phase stuns the player for a different amount of time
DATA_B681FF:
	dw $0000
	dw $0016
	dw $0015
	dw $0018
	dw $001A
	dw $001C
	dw $0020

CODE_B6820D:
	LDX current_sprite			;$B6820D  \
	LDA $2E,x				;$B6820F   |
	BIT #$2000				;$B68211   |
	BNE CODE_B68267				;$B68214   |
	BIT #$0100				;$B68216   |
	BEQ CODE_B68225				;$B68219   |
	LDA $44,x				;$B6821B   |
	CMP #CODE_B6BAD8			;$B6821D   |
	BEQ CODE_B68268				;$B68220   |
	BRL CODE_B68267				;$B68222  /

CODE_B68225:
	JSR CODE_B6828C				;$B68225  \
	LDA #$0200				;$B68228   |
	LDY #$0000				;$B6822B   |
	JSL CODE_BCFE0A				;$B6822E   |
	BCC CODE_B68267				;$B68232   |
	LDY $6A					;$B68234   |
	LDA $0000,y				;$B68236   |
	CMP #$01B8				;$B68239   |
	BNE CODE_B68267				;$B6823C   |
	LDA $0020,y				;$B6823E   |
	BNE CODE_B6824A				;$B68241   |
	LDA $6A					;$B68243   |
	CMP $0D7A				;$B68245   |
	BNE CODE_B68267				;$B68248   |
CODE_B6824A:					;	   |
	LDA #$0296				;$B6824A   |
	JSL set_sprite_animation		;$B6824D   |
	LDA.l $000656				;$B68251   |
	STA alternate_sprite			;$B68255   |
	LDA #$0297				;$B68257   |
	JSL CODE_B9D09B				;$B6825A   |
	LDX current_sprite			;$B6825E   |
	LDA $2E,x				;$B68260   |
	ORA #$2000				;$B68262   |
	STA $2E,x				;$B68265   |
CODE_B68267:					;	   |
	RTS					;$B68267  /

CODE_B68268:
	JSR CODE_B6828C				;$B68268  \
	LDA #$0200				;$B6826B   |
	JSL CODE_BCFE0A				;$B6826E   |
	BCC CODE_B68267				;$B68272   |
	LDY $6A					;$B68274   |
	LDA $0000,y				;$B68276   |
	CMP #$01B8				;$B68279   |
	BNE CODE_B68267				;$B6827C   |
	LDA $0020,y				;$B6827E   |
	BNE CODE_B68267				;$B68281   |
	LDA $6A					;$B68283   |
	CMP $0D7A				;$B68285   |
	BEQ CODE_B6824A				;$B68288   |
	BRA CODE_B68267				;$B6828A  /

CODE_B6828C:
	LDA $12,x				;$B6828C  \
	BIT #$4000				;$B6828E   |
	BEQ CODE_B682B3				;$B68291   |
	LDA #$FFFF				;$B68293   |
	CLC					;$B68296   |
	ADC $06,x				;$B68297   |
	STA $09D7				;$B68299   |
	STA $09E7				;$B6829C   |
	STA $000650				;$B6829F   |
	LDA #$FFAC				;$B682A3   |
	CLC					;$B682A6   |
	ADC $000650				;$B682A7   |
	STA $09D3				;$B682AB   |
	STA $09E3				;$B682AE   |
	BRA CODE_B682C9				;$B682B1  /

CODE_B682B3:
	LDA $06,x				;$B682B3  \
	CLC					;$B682B5   |
	ADC #$0001				;$B682B6   |
	STA $09D3				;$B682B9   |
	STA $09E3				;$B682BC   |
	CLC					;$B682BF   |
	ADC #$0054				;$B682C0   |
	STA $09D7				;$B682C3   |
	STA $09E7				;$B682C6   |
CODE_B682C9:					;	   |
	LDA $0A,x				;$B682C9   |
	CLC					;$B682CB   |
	ADC #$FFC3				;$B682CC   |
	STA $09D5				;$B682CF   |
	STA $09E5				;$B682D2   |
	ADC #$0039				;$B682D5   |
	STA $09D9				;$B682D8   |
	STA $09E9				;$B682DB   |
	RTS					;$B682DE  /

CODE_B682DF:
	LDX $0654				;$B682DF  \
	LDA $2E,x				;$B682E2   |
	BIT #$0001				;$B682E4   |
	BNE CODE_B682F4				;$B682E7   |
	LDA $0A36				;$B682E9   |
	BIT #$0004				;$B682EC   |
	BEQ CODE_B682F4				;$B682EF   |
	BRL CODE_B684B7				;$B682F1  /

CODE_B682F4:
	PHB					;$B682F4  \
	PHK					;$B682F5   |
	PLB					;$B682F6   |
	LDA.l $000652				;$B682F7   |
	BNE CODE_B68300				;$B682FB   |
	BRL CODE_B684B6				;$B682FD  /

CODE_B68300:
	JSL CODE_B9D100				;$B68300  \
	LDX $0654				;$B68304   |
	LDA $2E,x				;$B68307   |
	BIT #$0100				;$B68309   |
	BEQ CODE_B6831D				;$B6830C   |
	LDX current_sprite			;$B6830E   |
	LDA $32,x				;$B68310   |
	BIT #$0008				;$B68312   |
	BEQ CODE_B6831D				;$B68315   |
	JSR CODE_B689F8				;$B68317   |
	BRL CODE_B684B6				;$B6831A  /

CODE_B6831D:
	LDX $0654				;$B6831D  \
	LDA $2E,x				;$B68320   |
	BIT #$2000				;$B68322   |
	BNE CODE_B6832A				;$B68325   |
	BRL CODE_B683F7				;$B68327  /

CODE_B6832A:
	JSL CODE_BCFB58				;$B6832A  \
	LDA #$0200				;$B6832E   |
	LDY #$0000				;$B68331   |
	JSL CODE_BEBD8E				;$B68334   |
	BCC CODE_B6836B				;$B68338   |
	LDA $6A					;$B6833A   |
	STA current_sprite			;$B6833C   |
	JSL CODE_BB82B8				;$B6833E   |
	LDY #$004A				;$B68342   |
	JSL CODE_BB842C				;$B68345   |
	LDY #$0060				;$B68349   |
	JSL CODE_BB8412				;$B6834C   |
	LDY #$0062				;$B68350   |
	JSL CODE_BB8412				;$B68353   |
	LDX $0656				;$B68357   |
	STX current_sprite			;$B6835A   |
	LDA.l $00074F				;$B6835C   |
	STZ $074F				;$B68360   |
	CMP $0D7A				;$B68363   |
	BNE CODE_B6836B				;$B68366   |
	STZ $0D7A				;$B68368   |
CODE_B6836B:					;	   |
	LDX $0656				;$B6836B   |
	LDA $30,x				;$B6836E   |
	AND #$FFDF				;$B68370   |
	STA $30,x				;$B68373   |
	LDX $0654				;$B68375   |
	STA $30,x				;$B68378   |
	LDA.l $00073D				;$B6837A   |
	BEQ CODE_B68383				;$B6837E   |
	BRL CODE_B684B6				;$B68380  /

CODE_B68383:
	JSL CODE_BCFB58				;$B68383  \
	LDA #$0C7B				;$B68387   |
	JSL CODE_B6CF65				;$B6838A   |
	BCC CODE_B683F7				;$B6838E   |
	LDX $0654				;$B68390   |
	LDY active_kong_sprite			;$B68393   |
	LDA $06,x				;$B68396   |
	CMP $0006,y				;$B68398   |
	BCC CODE_B683A2				;$B6839B   |
	LDA #$FD00				;$B6839D   |
	BRA CODE_B683A5				;$B683A0  /

CODE_B683A2:
	LDA #$0300				;$B683A2  \
CODE_B683A5:					;	   |
	STA $000650				;$B683A5   |
	LDA $0012,y				;$B683A9   |
	BIT #$4000				;$B683AC   |
	BEQ CODE_B683BC				;$B683AF   |
	LDA.l $000650				;$B683B1   |
	EOR #$FFFF				;$B683B5   |
	STA $000650				;$B683B8   |
CODE_B683BC:					;	   |
	LDY $0650				;$B683BC   |
	LDA #$001E				;$B683BF   |
	JSL CODE_B3A600				;$B683C2   |
	LDX $0654				;$B683C6   |
	LDA #$0014				;$B683C9   |
	STA $00073D				;$B683CC   |
	LDA $0D7A				;$B683D0   |
	BEQ CODE_B683F4				;$B683D3   |
	CMP $00074F				;$B683D5   |
	BNE CODE_B683F4				;$B683D9   |
	LDA.l $00074F				;$B683DB   |
	STA current_sprite			;$B683DF   |
	JSL CODE_B3975C				;$B683E1   |
	JSL CODE_BB82B8				;$B683E5   |
	LDX $0656				;$B683E9   |
	STX current_sprite			;$B683EC   |
	STZ $0D7A				;$B683EE   |
	STZ $074F				;$B683F1   |
CODE_B683F4:					;	   |
	BRL CODE_B684B6				;$B683F4  /

CODE_B683F7:
	LDX $0654				;$B683F7  \
	LDA.l $00073D				;$B683FA   |
	BEQ CODE_B68403				;$B683FE   |
	BRL CODE_B684B6				;$B68400  /

CODE_B68403:
	LDA $2E,x				;$B68403  \
	BIT #$0001				;$B68405   |
	BEQ CODE_B6841D				;$B68408   |
	JSL CODE_BCFB58				;$B6840A   |
	LDA #$0010				;$B6840E   |
	PHK					;$B68411   |
	%return(CODE_B68418)			;$B68412   |
	JML [$09F9]				;$B68415  /

CODE_B68418:
	BCS CODE_B6843A				;$B68418  \
	BRL CODE_B684B6				;$B6841A  /

CODE_B6841D:
	LDX $0654				;$B6841D  \
	LDA $2E,x				;$B68420   |
	BIT #$2000				;$B68422   |
	BEQ CODE_B6842A				;$B68425   |
	BRL CODE_B684B6				;$B68427  /

CODE_B6842A:
	JSL CODE_BCFB58				;$B6842A  \
	LDA #$0000				;$B6842E   |
	JSL CODE_B6CF65				;$B68431   |
	BCS CODE_B6843A				;$B68435   |
	BRL CODE_B684B6				;$B68437  /

CODE_B6843A:
	LDA #$0014				;$B6843A  \
	STA $00073D				;$B6843D   |
	LDX $0D7A				;$B68441   |
	BEQ CODE_B68446				;$B68444   |
CODE_B68446:					;	   |
	LDX $0654				;$B68446   |
	LDA $2E,x				;$B68449   |
	BIT #$0001				;$B6844B   |
	BEQ CODE_B68488				;$B6844E   |
	LDY active_kong_sprite			;$B68450   |
	LDA $0030,y				;$B68453   |
	BIT #$0080				;$B68456   |
	BNE CODE_B68488				;$B68459   |
	JSR CODE_B6800D				;$B6845B   |
	LDA #$0026				;$B6845E   |
	JSL CODE_B8D8BA				;$B68461   |
	BCS CODE_B68488				;$B68465   |
	LDX $0654				;$B68467   |
	LDA $12,x				;$B6846A   |
	BIT #$4000				;$B6846C   |
	BNE CODE_B6847C				;$B6846F   |
	LDA #$0600				;$B68471   |
	STA $0A86				;$B68474   |
	LDA #$0700				;$B68477   |
	BRA CODE_B68485				;$B6847A  /

CODE_B6847C:
	LDA #$FA00				;$B6847C  \
	STA $0A86				;$B6847F   |
	LDA #$F900				;$B68482   |
CODE_B68485:					;	   |
	STA $0A88				;$B68485   |
CODE_B68488:					;	   |
	BRA CODE_B684B6				;$B68488  /

	LDX $0654				;$B6848A   |
	LDA.l $00073D				;$B6848D   |
	BNE CODE_B684B6				;$B68491   |
	LDX current_sprite			;$B68493   |
	JSL CODE_BCFB58				;$B68495   |
	LDA #$0C7B				;$B68499   |
	JSL CODE_B6CF65				;$B6849C   |
	BCC CODE_B684B6				;$B684A0   |
	LDA #$001E				;$B684A2   |
	LDY #$FE00				;$B684A5   |
	JSL CODE_B3A600				;$B684A8   |
	LDX $0654				;$B684AC   |
	LDA #$0014				;$B684AF   |
	STA $00073D				;$B684B2   |
CODE_B684B6:					;	   |
	PLB					;$B684B6   |
CODE_B684B7:					;	   |
	JML [$05A9]				;$B684B7  /

CODE_B684BA:
	LDX current_sprite			;$B684BA  \
	JSR ($0044,x)				;$B684BC   |
	JSL CODE_B9D100				;$B684BF   |
	BRL CODE_B6816B				;$B684C3  /

DATA_B684C6:
	dw !null_pointer
	dw DATA_B68924
	dw DATA_B6887E
	dw DATA_B687DC
	dw DATA_B68668
	dw DATA_B685AE
	dw DATA_B68502

DATA_B684D4:
	dw !boss_command_wait, $003C
	dw !boss_command_fall, $01D0, $0032, $0400, $0900, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_wait, $001E
	dw !boss_command_swing_club
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $001E

DATA_B68502:
	dw !boss_command_fall, $0000, $0032, $0400, $0680, $0006
	dw !boss_command_destroy_tnt
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0023
	dw !boss_command_fall, $0000, $0032, $0400, $0680, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0023
	dw !boss_command_fall, $0000, $0032, $0400, $0680, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $002D
	dw !boss_command_swing_club
	dw !boss_command_set_pattern, DATA_B6857A
	dw !boss_command_goto_or_reset, DATA_B689CA, DATA_B689CA

DATA_B6857A:
	dw !boss_command_wait, $0001
	dw !boss_command_fall, $01C0, $0095, $0400, $0680, $0006
	dw !boss_command_shake_screen, $0000, $0400
	dw !boss_command_42
	dw !boss_command_get_hit_or_timeout, $001E, $012C
	dw !boss_command_43
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0023
	dw !boss_command_goto_or_reset, DATA_B68502, DATA_B68502

DATA_B685AE:
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $000F

DATA_B685BC:
	dw !boss_command_fall, $0000, $0023, $0400, $0780, $0006
	dw !boss_command_destroy_tnt
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $000F
	dw !boss_command_fall, $0000, $0023, $0400, $0780, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $000F
	dw !boss_command_fall, $0000, $0023, $0400, $0780, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0019
	dw !boss_command_swing_club
	dw !boss_command_set_pattern, DATA_B68634
	dw !boss_command_goto_or_reset, DATA_B689CA, DATA_B689CA

DATA_B68634:
	dw !boss_command_wait, $0001
	dw !boss_command_fall, $01C0, $0059, $0400, $0780, $0006
	dw !boss_command_shake_screen, $0000, $0400
	dw !boss_command_42
	dw !boss_command_get_hit_or_timeout, $0014, $00B4
	dw !boss_command_43
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $000F
	dw !boss_command_goto_or_reset, DATA_B685BC, DATA_B685BC

DATA_B68668:
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0002

DATA_B68676:
	dw !boss_command_fall, $0000, $0014, $0400, $0880, $0006
	dw !boss_command_destroy_tnt
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0002
	dw !boss_command_fall, $0000, $0014, $0400, $0880, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0002
	dw !boss_command_fall, $0000, $0014, $0400, $0880, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $000A
	dw !boss_command_swing_club
	dw !boss_command_set_pattern, DATA_B686EE
	dw !boss_command_goto_or_reset, DATA_B689CA, DATA_B689CA

DATA_B686EE:
	dw !boss_command_wait, $0001
	dw !boss_command_fall, $01C0, $0031, $0400, $0880, $0006
	dw !boss_command_shake_screen, $0000, $0400
	dw !boss_command_42
	dw !boss_command_get_hit_or_timeout, $0014, $0078
	dw !boss_command_43
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0002
	dw !boss_command_goto_or_reset, DATA_B68676, DATA_B68676
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0002

DATA_B68730:
	dw !boss_command_fall, $0000, $0014, $0400, $0880, $0006
	dw !boss_command_destroy_tnt
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0002
	dw !boss_command_fall, $0000, $0014, $0400, $0880, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0002
	dw !boss_command_fall, $0000, $0014, $0400, $0880, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $0007
	dw !boss_command_wait, $000A
	dw !boss_command_swing_club
	dw !boss_command_set_pattern, DATA_B687A8
	dw !boss_command_goto_or_reset, DATA_B689CA, DATA_B689CA

DATA_B687A8:
	dw !boss_command_wait, $0001
	dw !boss_command_fall, $01C0, $002C, $0400, $0880, $0006
	dw !boss_command_shake_screen, $0000, $0400
	dw !boss_command_42
	dw !boss_command_get_hit_or_timeout, $0014, $0078
	dw !boss_command_43
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0002
	dw !boss_command_goto_or_reset, DATA_B68730, DATA_B68730

DATA_B687DC:
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0012

DATA_B687EA:
	dw !boss_command_fall, $0000, $0014, $0400, $0900, $0006
	dw !boss_command_wait, $0014
	dw !boss_command_jump, $0180, $F900, $0800, $0002
	dw !boss_command_destroy_tnt
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_wait, $0012
	dw !boss_command_jump, $0180, $F900, $0800, $0002
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_wait, $0012
	dw !boss_command_jump, $0180, $F900, $0800, $0002
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_set_pattern, DATA_B6884A
	dw !boss_command_goto_or_reset, DATA_B689CA, DATA_B689CA

DATA_B6884A:
	dw !boss_command_wait, $0001
	dw !boss_command_fall, $01C0, $003B, $0600, $0900, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_42
	dw !boss_command_get_hit_or_timeout, $0014, $0096
	dw !boss_command_43
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $0012
	dw !boss_command_goto_or_reset, DATA_B687EA, DATA_B687EA

DATA_B6887E:
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $000A

DATA_B6888C:
	dw !boss_command_fall, $0000, $0014, $0400, $0900, $0006
	dw !boss_command_wait, $0014
	dw !boss_command_jump, $01A0, $F780, $0C00, $0002
	dw !boss_command_destroy_tnt
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_wait, $000A
	dw !boss_command_jump, $01A0, $F780, $0C00, $0002
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_wait, $000A
	dw !boss_command_jump, $01A0, $F780, $0C00, $0002
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_wait, $000A
	dw !boss_command_set_pattern, DATA_B688F0
	dw !boss_command_goto_or_reset, DATA_B689CA, DATA_B689CA

DATA_B688F0:
	dw !boss_command_wait, $0001
	dw !boss_command_fall, $01C0, $002C, $0400, $0900, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_42
	dw !boss_command_get_hit_or_timeout, $0014, $0078
	dw !boss_command_43
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $000A
	dw !boss_command_goto_or_reset, DATA_B6888C, DATA_B6888C

DATA_B68924:
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $000A

DATA_B68932:
	dw !boss_command_fall, $0000, $0014, $0400, $0900, $0006
	dw !boss_command_wait, $0014
	dw !boss_command_jump, $01C0, $F600, $1100, $0002
	dw !boss_command_destroy_tnt
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_wait, $000A
	dw !boss_command_jump, $01C0, $F600, $1100, $0002
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_wait, $000A
	dw !boss_command_jump, $01C0, $F600, $1100, $0002
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_stun_player, $000F
	dw !boss_command_wait, $000A
	dw !boss_command_set_pattern, DATA_B68996
	dw !boss_command_goto_or_reset, DATA_B689CA, DATA_B689CA

DATA_B68996:
	dw !boss_command_wait, $0001
	dw !boss_command_fall, $01C0, $001D, $0400, $0900, $0006
	dw !boss_command_shake_screen, $0250, $1000
	dw !boss_command_42
	dw !boss_command_get_hit_or_timeout, $0014, $005A
	dw !boss_command_43
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_wait, $000A
	dw !boss_command_goto_or_reset, DATA_B68932, DATA_B68932
DATA_B689CA:
	dw !boss_command_hop, $F900, $0800, $0005
	dw !boss_command_shake_screen, $0000, $0400
	dw !boss_command_spawn_sprite, DATA_FF1D8E, $01C0, $0180, CODE_B68D37, $0000, $FFEA
	dw !boss_command_wait, $0014
	dw !boss_command_rise, $0150, $F800, $FC00, $0003
	dw !boss_command_goto_or_reset, !null_pointer

CODE_B689F8:
	LDA.l $000652				;$B689F8  \
	CMP #$0001				;$B689FC   |
	BEQ CODE_B68A61				;$B689FF   |
	LDX $0654				;$B68A01   |
	LDY active_kong_sprite			;$B68A04   |
	LDA $06,x				;$B68A07   |
	CMP $0006,y				;$B68A09   |
	BCC CODE_B68A13				;$B68A0C   |
	LDY #$0460				;$B68A0E   |
	BRA CODE_B68A16				;$B68A11  /

CODE_B68A13:
	LDY #$FBA0				;$B68A13  \
CODE_B68A16:					;	   |
	STY $20,x				;$B68A16   |
	LDA $2E,x				;$B68A18   |
	ORA #$0200				;$B68A1A   |
	AND #$FEFF				;$B68A1D   |
	STA $2E,x				;$B68A20   |
	LDA #$0014				;$B68A22   |
	STA $00073D				;$B68A25   |
	LDA #CODE_B68C82			;$B68A29   |
	STA $44,x				;$B68A2C   |
	LDA #$FC00				;$B68A2E   |
	STA $24,x				;$B68A31   |
	LDA #$0600				;$B68A33   |
	STA $2A,x				;$B68A36   |
	STZ $26,x				;$B68A38   |
	LDA $32,x				;$B68A3A   |
	LDX $0654				;$B68A3C   |
	STZ $32,x				;$B68A3F   |
	LDX $0656				;$B68A41   |
	STZ $32,x				;$B68A44   |
	LDA.l $000654				;$B68A46   |
	STA alternate_sprite			;$B68A4A   |
	LDA #$0298				;$B68A4C   |
	JSL CODE_B9D09B				;$B68A4F   |
	LDA.l $000656				;$B68A53   |
	STA alternate_sprite			;$B68A57   |
	LDA #$0299				;$B68A59   |
	JSL CODE_B9D09B				;$B68A5C   |
CODE_B68A60:					;	   |
	RTS					;$B68A60  /

CODE_B68A61:
	LDA #$0559				;$B68A61  \
	JSL queue_sound_effect			;$B68A64   |
	STZ $0652				;$B68A68   |
	LDX $0654				;$B68A6B   |
	LDA #$F780				;$B68A6E   |
	STA $24,x				;$B68A71   |
	LDA #$FC80				;$B68A73   |
	STA $2A,x				;$B68A76   |
	STZ $20,x				;$B68A78   |
	STZ $26,x				;$B68A7A   |
	LDA #CODE_B68BBB			;$B68A7C   |
	STA $44,x				;$B68A7F   |
	LDA #$0001				;$B68A81   |
	STA $000751				;$B68A84   |
	LDA #DATA_B68B07			;$B68A88   |
	STA $000753				;$B68A8B   |
	LDA.l $000654				;$B68A8F   |
	STA alternate_sprite			;$B68A93   |
	LDA #$0298				;$B68A95   |
	JSL CODE_B9D09B				;$B68A98   |
	LDA.l $000656				;$B68A9C   |
	STA alternate_sprite			;$B68AA0   |
	LDA #$0299				;$B68AA2   |
	JSL CODE_B9D09B				;$B68AA5   |
	BRA CODE_B68A60				;$B68AA9  /

CODE_B68AAB:
	DEC $0751				;$B68AAB  \
	BNE CODE_B68AFA				;$B68AAE   |
	LDX $0753				;$B68AB0   |
	LDY $000A,x				;$B68AB3   |
	JSL CODE_BB842C				;$B68AB6   |
	LDY alternate_sprite			;$B68ABA   |
	LDA level_number			;$B68ABC   |
	CMP #!level_krocodile_kore		;$B68ABE   |
	BNE CODE_B68ACF				;$B68AC1   |
	LDA $0012,y				;$B68AC3   |
	AND #$CFFF				;$B68AC6   |
	ORA #$2000				;$B68AC9   |
	STA $0012,y				;$B68ACC   |
CODE_B68ACF:					;	   |
	LDX $0753				;$B68ACF   |
	LDA $0000,x				;$B68AD2   |
	STA $0020,y				;$B68AD5   |
	LDA $0002,x				;$B68AD8   |
	STA $0026,y				;$B68ADB   |
	LDA $0004,x				;$B68ADE   |
	STA $0024,y				;$B68AE1   |
	LDA $0006,x				;$B68AE4   |
	STA $002A,y				;$B68AE7   |
	LDA $0008,x				;$B68AEA   |
	STA $000751				;$B68AED   |
	TXA					;$B68AF1   |
	CLC					;$B68AF2   |
	ADC #$000C				;$B68AF3   |
	STA $000753				;$B68AF6   |
CODE_B68AFA:					;	   |
	RTS					;$B68AFA  /

DATA_B68AFB:
	db $A0, $FF, $00, $00, $E0, $FF, $00, $FF
	db $05, $00, $74, $01

DATA_B68B07:
	db $00, $00, $00, $00, $00, $00, $00, $FF
	db $05, $00, $76, $01

DATA_B68B13:
	db $60, $00, $00, $00, $00, $00, $40, $FF
	db $04, $00, $72, $01

DATA_B68B1F:
	db $E0, $FF, $E0, $FF, $00, $00, $00, $FF
	db $20, $4E, $78, $01

DATA_B68B2B:
	db $40, $00, $00, $00, $C0, $FF, $80, $00
	db $03, $00, $70, $01

DATA_B68B37:
	db $C0, $FF, $00, $00, $00, $00, $80, $00
	db $04, $00, $70, $01

DATA_B68B43:
	db $E0, $FF, $00, $00, $00, $00, $80, $00
	db $02, $00, $70, $01

DATA_B68B4F:
	db $20, $00, $00, $00, $00, $00, $80, $00
	db $03, $00, $70, $01

DATA_B68B5B:
	db $00, $00, $00, $00, $80, $00, $80, $00
	db $02, $00, $70, $01

DATA_B68B67:
	db $C0, $FF, $E0, $FF, $80, $00, $80, $00
	db $03, $00, $70, $01

DATA_B68B73:
	db $C0, $FF, $00, $00, $C0, $FF, $80, $00
	db $03, $00, $70, $01

DATA_B68B7F:
	db $40, $00, $00, $00, $00, $00, $80, $00
	db $04, $00, $70, $01

DATA_B68B8B:
	db $20, $00, $00, $00, $00, $00, $80, $00
	db $03, $00, $70, $01

DATA_B68B97:
	db $E0, $FF, $00, $00, $00, $00, $80, $00
	db $04, $00, $70, $01

DATA_B68BA3:
	db $00, $00, $00, $00, $80, $00, $80, $00
	db $03, $00, $70, $01

DATA_B68BAF:
	db $40, $00, $20, $00, $80, $00, $80, $00
	db $10, $27, $70, $01

CODE_B68BBB:
	LDA #$0004				;$B68BBB  \
	JSL CODE_B8CFD4				;$B68BBE   |
	JSL CODE_B8CF7F				;$B68BC2   |
	JSR CODE_B68AAB				;$B68BC6   |
	LDX current_sprite			;$B68BC9   |
	LDA $0A,x				;$B68BCB   |
	CMP #$0030				;$B68BCD   |
	BCS CODE_B68C23				;$B68BD0   |
	LDX current_sprite			;$B68BD2   |
	LDA #$0021				;$B68BD4   |
	STA $000751				;$B68BD7   |
	LDA #DATA_B68B2B			;$B68BDB   |
	STA $000753				;$B68BDE   |
	LDA #$0120				;$B68BE2   |
	STA $0A,x				;$B68BE5   |
	LDA #CODE_B68C27			;$B68BE7   |
	STA $44,x				;$B68BEA   |
	LDA #$029C				;$B68BEC   |
	JSL set_sprite_animation		;$B68BEF   |
	LDA.l $000656				;$B68BF3   |
	STA alternate_sprite			;$B68BF7   |
	LDA #$029D				;$B68BF9   |
	JSL CODE_B9D09B				;$B68BFC   |
	LDA #$077A				;$B68C00   |
	JSL queue_sound_effect			;$B68C03   |
	LDX current_sprite			;$B68C07   |
	LDY $0656				;$B68C09   |
	LDA #$0380				;$B68C0C   |
	STA $24,x				;$B68C0F   |
	STA $2A,x				;$B68C11   |
	LDA $12,x				;$B68C13   |
	EOR #$3000				;$B68C15   |
	STA $12,x				;$B68C18   |
	LDA $0012,y				;$B68C1A   |
	EOR #$3000				;$B68C1D   |
	STA $0012,y				;$B68C20   |
CODE_B68C23:					;	   |
	JSR CODE_B68D5D				;$B68C23   |
	RTS					;$B68C26  /

CODE_B68C27:
	JSL CODE_B8CF7F				;$B68C27  \
	JSR CODE_B68AAB				;$B68C2B   |
	LDX current_sprite			;$B68C2E   |
	LDA $0A,x				;$B68C30   |
	CMP #$0270				;$B68C32   |
	BCC CODE_B68C67				;$B68C35   |
	LDA #CODE_B68C6B			;$B68C37   |
	STA $44,x				;$B68C3A   |
	LDA #$005A				;$B68C3C   |
	STA $000747				;$B68C3F   |
	LDY #$017A				;$B68C43   |
	JSL CODE_BB842C				;$B68C46   |
	LDA #$055B				;$B68C4A   |
	JSL queue_sound_effect			;$B68C4D   |
	LDA #$065C				;$B68C51   |
	JSL queue_sound_effect			;$B68C54   |
	LDX current_sprite			;$B68C58   |
	LDY alternate_sprite			;$B68C5A   |
	LDA $06,x				;$B68C5C   |
	STA $0006,y				;$B68C5E   |
	LDA #$01F3				;$B68C61   |
	STA $000A,y				;$B68C64   |
CODE_B68C67:					;	   |
	JSR CODE_B68D5D				;$B68C67   |
	RTS					;$B68C6A  /

CODE_B68C6B:
	LDA.l $000747				;$B68C6B  \
	BEQ CODE_B68C81				;$B68C6F   |
	DEC $0747				;$B68C71   |
	BNE CODE_B68C81				;$B68C74   |
	JSL CODE_BB8158				;$B68C76   |
	LDA #$0027				;$B68C7A   |
	JSL CODE_B8D8BA				;$B68C7D   |
CODE_B68C81:					;	   |
	RTS					;$B68C81  /

CODE_B68C82:
	LDA #$0006				;$B68C82  \
	JSL CODE_B8D010				;$B68C85   |
	LDA #$0004				;$B68C89   |
	JSL CODE_B8CFD4				;$B68C8C   |
	JSL CODE_B8D5E0				;$B68C90   |
	LDX current_sprite			;$B68C94   |
	LDA $2E,x				;$B68C96   |
	BIT #$4000				;$B68C98   |
	BEQ CODE_B68CB3				;$B68C9B   |
	AND #$BDFF				;$B68C9D   |
	STA $2E,x				;$B68CA0   |
	DEC $0652				;$B68CA2   |
	LDA.l $000652				;$B68CA5   |
	ASL A					;$B68CA9   |
	TAY					;$B68CAA   |
	LDA DATA_B684C6,y			;$B68CAB   |
	STA $46,x				;$B68CAE   |
	JSR CODE_B6D008				;$B68CB0   |
CODE_B68CB3:					;	   |
	JSR CODE_B68D5D				;$B68CB3   |
	RTS					;$B68CB6  /

CODE_B68CB7:
	LDX $0654				;$B68CB7  \
	LDA $2E,x				;$B68CBA   |
	ORA #$4000				;$B68CBC   |
	STA $2E,x				;$B68CBF   |
	RTL					;$B68CC1  /

CODE_B68CC2:
	PHB					;$B68CC2  \
	PHK					;$B68CC3   |
	PLB					;$B68CC4   |
	LDA #$01FB				;$B68CC5   |
	JSL set_sprite_animation		;$B68CC8   |
	LDA.l $000656				;$B68CCC   |
	STA alternate_sprite			;$B68CD0   |
	LDA #$028D				;$B68CD2   |
	JSL CODE_B9D09B				;$B68CD5   |
	LDX $0654				;$B68CD9   |
	JSR CODE_B6D008				;$B68CDC   |
	PLB					;$B68CDF   |
	RTL					;$B68CE0  /

CODE_B68CE1:
	PHB					;$B68CE1  \
	PHK					;$B68CE2   |
	PLB					;$B68CE3   |
	LDX $0656				;$B68CE4   |
	LDA $30,x				;$B68CE7   |
	ORA #$0020				;$B68CE9   |
	STA $30,x				;$B68CEC   |
	LDX $0654				;$B68CEE   |
	STA $30,x				;$B68CF1   |
	LDA $2E,x				;$B68CF3   |
	AND #$DFFF				;$B68CF5   |
	STA $2E,x				;$B68CF8   |
	LDA $44,x				;$B68CFA   |
	CMP #CODE_B6BC3E			;$B68CFC   |
	BEQ CODE_B68D0B				;$B68CFF   |
	CMP #CODE_B6BA3F			;$B68D01   |
	BEQ CODE_B68D0B				;$B68D04   |
	CMP #CODE_B6BCCF			;$B68D06   |
	BNE CODE_B68D21				;$B68D09   |
CODE_B68D0B:					;	   |
	LDA #$028E				;$B68D0B   |
	JSL set_sprite_animation		;$B68D0E   |
	LDA.l $000656				;$B68D12   |
	STA alternate_sprite			;$B68D16   |
	LDA #$028F				;$B68D18   |
	JSL CODE_B9D09B				;$B68D1B   |
	BRA CODE_B68D35				;$B68D1F  /

CODE_B68D21:
	LDA #$01FB				;$B68D21  \
	JSL set_sprite_animation		;$B68D24   |
	LDA.l $000656				;$B68D28   |
	STA alternate_sprite			;$B68D2C   |
	LDA #$028D				;$B68D2E   |
	JSL CODE_B9D09B				;$B68D31   |
CODE_B68D35:					;	   |
	PLB					;$B68D35   |
	RTL					;$B68D36  /

CODE_B68D37:
	LDY alternate_sprite			;$B68D37   |
	STY $074F				;$B68D39   |
	LDA #DATA_FF1D80			;$B68D3C   |
	STA $004E,y				;$B68D3F   |
	LDA #$3EAC				;$B68D42   |
	STA $004A,y				;$B68D45   |
	LDA #$02E5				;$B68D48   |
	JSL CODE_B9D09B				;$B68D4B   |
	LDX alternate_sprite			;$B68D4F   |
	LDA #$0002				;$B68D51   |
	JSL CODE_BB8C44				;$B68D54   |
	RTS					;$B68D58  /

CODE_B68D59:
	JSR CODE_B68D5D				;$B68D59  \
	RTL					;$B68D5C  /

CODE_B68D5D:
	LDX $0654				;$B68D5D  \
	LDY $0656				;$B68D60   |
	BEQ CODE_B68D6F				;$B68D63   |
CODE_B68D65:					;	   |
	LDA $06,x				;$B68D65   |
	STA $0006,y				;$B68D67   |
	LDA $0A,x				;$B68D6A   |
	STA $000A,y				;$B68D6C   |
CODE_B68D6F:					;	   |
	RTS					;$B68D6F  /

CODE_B68D70:
	PHB					;$B68D70  \
	PHK					;$B68D71   |
	PLB					;$B68D72   |
	LDX current_sprite			;$B68D73   |
	LDA $42,x				;$B68D75   |
	BEQ CODE_B68D7C				;$B68D77   |
	BRL CODE_B68E88				;$B68D79  /

CODE_B68D7C:
	JSL CODE_B4AEAF				;$B68D7C  \
	STZ $0763				;$B68D80   |
	LDX current_sprite			;$B68D83   |
	STZ $073D				;$B68D85   |
	STZ $32,x				;$B68D88   |
	STZ $06A1				;$B68D8A   |
	STZ $06A3				;$B68D8D   |
	STZ $06A5				;$B68D90   |
	LDY #$00C2				;$B68D93   |
	JSL CODE_BB842C				;$B68D96   |
	LDA alternate_sprite			;$B68D9A   |
	LDX current_sprite			;$B68D9C   |
	STX $0654				;$B68D9E   |
	STA $000656				;$B68DA1   |
	STA $42,x				;$B68DA5   |
	STZ $44,x				;$B68DA7   |
	LDA level_number			;$B68DA9   |
	CMP #!level_krocodile_kore		;$B68DAB   |
	BEQ CODE_B68DB3				;$B68DAE   |
	BRL CODE_B68E56				;$B68DB0  /

CODE_B68DB3:
	LDY active_kong_sprite			;$B68DB3  \
	JSR CODE_B68F37				;$B68DB6   |
	LDY inactive_kong_sprite		;$B68DB9   |
	JSR CODE_B68F37				;$B68DBC   |
	LDY $0654				;$B68DBF   |
	JSR CODE_B68F37				;$B68DC2   |
	LDY $0656				;$B68DC5   |
	JSR CODE_B68F37				;$B68DC8   |
	LDY $0656				;$B68DCB   |
	LDA #$02C8				;$B68DCE   |
	STA $06,x				;$B68DD1   |
	STA $0006,y				;$B68DD3   |
	LDA #$01C1				;$B68DD6   |
	STA $0A,x				;$B68DD9   |
	STA $000A,y				;$B68DDB   |
	LDA #$0257				;$B68DDE   |
	JSL set_sprite_animation		;$B68DE1   |
	LDA #$0258				;$B68DE5   |
	JSL CODE_B9D09B				;$B68DE8   |
	LDX current_sprite			;$B68DEC   |
	LDA #DATA_B69355			;$B68DEE   |
	STA $46,x				;$B68DF1   |
	LDA #$0001				;$B68DF3   |
	STA $000652				;$B68DF6   |
	LDA #$0001				;$B68DFA   |
	STA $00070B				;$B68DFD   |
	LDY #$0160				;$B68E01   |
	JSL CODE_BB842C				;$B68E04   |
	LDY alternate_sprite			;$B68E08   |
	LDX current_sprite			;$B68E0A   |
	JSR CODE_B68D65				;$B68E0C   |
	LDA.l DATA_B6906D			;$B68E0F   |
	STA $000650				;$B68E13   |
	LDA #DATA_B6906F			;$B68E17   |
CODE_B68E1A:					;	   |
	PHA					;$B68E1A   |
	LDY #$0162				;$B68E1B   |
	JSL CODE_BB8412				;$B68E1E   |
	LDY alternate_sprite			;$B68E22   |
	LDX current_sprite			;$B68E24   |
	JSR CODE_B68D65				;$B68E26   |
	PLX					;$B68E29   |
	LDA $0006,y				;$B68E2A   |
	CLC					;$B68E2D   |
	ADC $0000,x				;$B68E2E   |
	STA $0006,y				;$B68E31   |
	LDA $000A,y				;$B68E34   |
	CLC					;$B68E37   |
	ADC $0002,x				;$B68E38   |
	STA $000A,y				;$B68E3B   |
	LDA $0004,x				;$B68E3E   |
	STA $0042,y				;$B68E41   |
	PHX					;$B68E44   |
	JSL CODE_B9D09B				;$B68E45   |
	PLX					;$B68E49   |
	TXA					;$B68E4A   |
	CLC					;$B68E4B   |
	ADC #$0006				;$B68E4C   |
	DEC $0650				;$B68E4F   |
	BNE CODE_B68E1A				;$B68E52   |
	BRA CODE_B68E7E				;$B68E54  /

CODE_B68E56:
	LDA #$0004				;$B68E56  \
	BIT $08C4				;$B68E59   |
	BEQ CODE_B68E63				;$B68E5C   |
	LDY #DATA_B6908D			;$B68E5E   |
	BRA CODE_B68E6C				;$B68E61  /

CODE_B68E63:
	TSB $08C4				;$B68E63  \
	JSR CODE_B68F50				;$B68E66   |
	LDY #DATA_B69097			;$B68E69   |
CODE_B68E6C:					;	   |
	LDX current_sprite			;$B68E6C   |
	STY $46,x				;$B68E6E   |
	LDA #$0009				;$B68E70   |
	STA $000652				;$B68E73   |
	LDA #$0003				;$B68E77   |
	STA $00070B				;$B68E7A   |
CODE_B68E7E:					;	   |
	STZ $065A				;$B68E7E   |
	LDX current_sprite			;$B68E81   |
	LDX current_sprite			;$B68E83   |
	JSR CODE_B6D008				;$B68E85   |
CODE_B68E88:					;	   |
	LDX current_sprite			;$B68E88   |
	LDA $2E,x				;$B68E8A   |
	BIT #$0001				;$B68E8C   |
	BNE CODE_B68E9C				;$B68E8F   |
	LDA $0A36				;$B68E91   |
	BIT #$0004				;$B68E94   |
	BEQ CODE_B68E9C				;$B68E97   |
	BRL CODE_B68F33				;$B68E99  /

CODE_B68E9C:
	LDA.l $000654				;$B68E9C  \
	CMP $0AE8				;$B68EA0   |
	BEQ CODE_B68EA8				;$B68EA3   |
	JSR CODE_B6A701				;$B68EA5   |
CODE_B68EA8:					;	   |
	LDA.l $000652				;$B68EA8   |
	BNE CODE_B68EBB				;$B68EAC   |
	LDA level_number			;$B68EAE   |
	CMP #!level_krocodile_kore		;$B68EB0   |
	BNE CODE_B68EB8				;$B68EB3   |
	BRL CODE_B68F44				;$B68EB5  /

CODE_B68EB8:
	BRL CODE_B68F2B				;$B68EB8  /

CODE_B68EBB:
	LDX current_sprite			;$B68EBB  \
	LDA $2E,x				;$B68EBD   |
	AND #$FDFF				;$B68EBF   |
	STA $2E,x				;$B68EC2   |
	STZ $32,x				;$B68EC4   |
	LDX $0656				;$B68EC6   |
	BEQ CODE_B68ECD				;$B68EC9   |
	STZ $32,x				;$B68ECB   |
CODE_B68ECD:					;	   |
	LDX current_sprite			;$B68ECD   |
	LDA.l $00073D				;$B68ECF   |
	BEQ CODE_B68EDB				;$B68ED3   |
	DEC $073D				;$B68ED5   |
	BRL CODE_B68F0F				;$B68ED8  /

CODE_B68EDB:
	LDA $2E,x				;$B68EDB  \
	BIT #$2000				;$B68EDD   |
	BNE CODE_B68F0F				;$B68EE0   |
	JSL CODE_BCFB58				;$B68EE2   |
	LDA #$0000				;$B68EE6   |
	JSL CODE_B6CF65				;$B68EE9   |
	BCC CODE_B68F0F				;$B68EED   |
	LDX current_sprite			;$B68EEF   |
	LDA #$0014				;$B68EF1   |
	STA $00073D				;$B68EF4   |
	LDX $0D7A				;$B68EF8   |
	BEQ CODE_B68F0F				;$B68EFB   |
	JSR CODE_B6A3A1				;$B68EFD   |
	LDA #$000B				;$B68F00   |
	STA $44,x				;$B68F03   |
	LDA $2E,x				;$B68F05   |
	ORA #$0010				;$B68F07   |
	STA $2E,x				;$B68F0A   |
	JSR CODE_B6AD9B				;$B68F0C   |
CODE_B68F0F:					;	   |
	LDX current_sprite			;$B68F0F   |
	LDA $44,x				;$B68F11   |
	JSR ($0044,x)				;$B68F13   |
	LDX current_sprite			;$B68F16   |
	LDA $44,x				;$B68F18   |
	BNE CODE_B68F1F				;$B68F1A   |
	JSR CODE_B6D008				;$B68F1C   |
CODE_B68F1F:					;	   |
	JSR CODE_B68F76				;$B68F1F   |
	JSR CODE_B68FE9				;$B68F22   |
	JSR CODE_B68FD8				;$B68F25   |
	JSR CODE_B68F9B				;$B68F28   |
CODE_B68F2B:					;	   |
	JSL CODE_B9D100				;$B68F2B   |
	JSL CODE_B3E3E3				;$B68F2F   |
CODE_B68F33:					;	   |
	PLB					;$B68F33   |
	JML [$05A9]				;$B68F34  /

CODE_B68F37:
	LDA $0012,y				;$B68F37  \
	AND #$CFFF				;$B68F3A   |
	ORA #$3000				;$B68F3D   |
	STA $0012,y				;$B68F40   |
	RTS					;$B68F43  /

CODE_B68F44:
	LDX current_sprite			;$B68F44  \
	JSR ($0044,x)				;$B68F46   |
	JSL CODE_B9D100				;$B68F49   |
	BRL CODE_B68F2B				;$B68F4D  /

CODE_B68F50:
	LDY #$0140				;$B68F50  \
	JSL CODE_BB842C				;$B68F53   |
	LDA alternate_sprite			;$B68F57   |
	STA $00075F				;$B68F59   |
	LDY #$011C				;$B68F5D   |
	JSL CODE_BB842C				;$B68F60   |
	LDY alternate_sprite			;$B68F64   |
	STY $075B				;$B68F66   |
	LDY #$011E				;$B68F69   |
	JSL CODE_BB842C				;$B68F6C   |
	LDY alternate_sprite			;$B68F70   |
	STY $075D				;$B68F72   |
	RTS					;$B68F75  /

CODE_B68F76:
	LDA.l $00072D				;$B68F76  \
	BEQ CODE_B68F8F				;$B68F7A   |
	CMP #$0078				;$B68F7C   |
	BCS CODE_B68F8F				;$B68F7F   |
	BIT #$0004				;$B68F81   |
	BNE CODE_B68F8F				;$B68F84   |
	LDA.l $0006A3				;$B68F86   |
	AND #$FF7F				;$B68F8A   |
	BRA CODE_B68F96				;$B68F8D  /

CODE_B68F8F:
	LDA.l $0006A3				;$B68F8F  \
	ORA #$0080				;$B68F93   |
CODE_B68F96:					;	   |
	STA $0006A3				;$B68F96   |
	RTS					;$B68F9A  /

CODE_B68F9B:
	LDX current_sprite			;$B68F9B  \
	LDY active_kong_sprite			;$B68F9D   |
	LDA $002E,y				;$B68FA0   |
	CMP #$005D				;$B68FA3   |
	BEQ CODE_B68FD0				;$B68FA6   |
	LDA $2E,x				;$B68FA8   |
	BIT #$4000				;$B68FAA   |
	BEQ CODE_B68FD7				;$B68FAD   |
	AND #$BFFF				;$B68FAF   |
	STA $2E,x				;$B68FB2   |
	LDY.w #DATA_FF103A			;$B68FB4   |
	JSL CODE_BB8432				;$B68FB7   |
	LDY alternate_sprite			;$B68FBB   |
	LDX active_kong_sprite			;$B68FBD   |
	LDA $06,x				;$B68FC0   |
	STA $0006,y				;$B68FC2   |
	LDA $0A,x				;$B68FC5   |
	SEC					;$B68FC7   |
	SBC #$0010				;$B68FC8   |
	STA $000A,y				;$B68FCB   |
	BRA CODE_B68FD7				;$B68FCE  /

CODE_B68FD0:
	LDA $2E,x				;$B68FD0  \
	ORA #$4000				;$B68FD2   |
	STA $2E,x				;$B68FD5   |
CODE_B68FD7:					;	   |
	RTS					;$B68FD7  /

CODE_B68FD8:
	LDY $073B				;$B68FD8  \
	BEQ CODE_B68FE8				;$B68FDB   |
	LDA $0000,y				;$B68FDD   |
	CMP #$01A8				;$B68FE0   |
	BEQ CODE_B68FE8				;$B68FE3   |
	STZ $073B				;$B68FE5   |
CODE_B68FE8:					;	   |
	RTS					;$B68FE8  /

CODE_B68FE9:
	LDX current_sprite			;$B68FE9  \
	LDA $4C,x				;$B68FEB   |
	BEQ CODE_B69042				;$B68FED   |
	DEC $4C,x				;$B68FEF   |
	BNE CODE_B69042				;$B68FF1   |
	LDA $4E,x				;$B68FF3   |
	INC A					;$B68FF5   |
	AND #$0003				;$B68FF6   |
	STA $4E,x				;$B68FF9   |
	ASL A					;$B68FFB   |
	ASL A					;$B68FFC   |
	TAY					;$B68FFD   |
	LDA $12,x				;$B68FFE   |
	AND #$CFFF				;$B69000   |
	ORA DATA_B6905D,y			;$B69003   |
	STA $12,x				;$B69006   |
	LDX $0656				;$B69008   |
	LDA $12,x				;$B6900B   |
	AND #$CFFF				;$B6900D   |
	ORA DATA_B6905D,y			;$B69010   |
	STA $12,x				;$B69013   |
	LDX current_sprite			;$B69015   |
	LDA DATA_B6905F,y			;$B69017   |
	STA $4C,x				;$B6901A   |
	LDA DATA_B6905D,y			;$B6901C   |
	BNE CODE_B69034				;$B6901F   |
	LDA #$C000				;$B69021   |
	STA $1C,x				;$B69024   |
	LDX $0656				;$B69026   |
	STA $1C,x				;$B69029   |
	LDX $072B				;$B6902B   |
	BEQ CODE_B69042				;$B6902E   |
	STA $1C,x				;$B69030   |
	BRA CODE_B69042				;$B69032  /

CODE_B69034:
	STZ $1C,x				;$B69034  \
	LDX $0656				;$B69036   |
	STZ $1C,x				;$B69039   |
	LDX $072B				;$B6903B   |
	BEQ CODE_B69042				;$B6903E   |
	STZ $1C,x				;$B69040   |
CODE_B69042:					;	   |
	RTS					;$B69042  /

CODE_B69043:
	PHK					;$B69043  \
	PLB					;$B69044   |
	JSR CODE_B6D008				;$B69045   |
	LDA #$025E				;$B69048   |
	JSL set_sprite_animation		;$B6904B   |
	LDA.l $000656				;$B6904F   |
	STA alternate_sprite			;$B69053   |
	LDA #$025F				;$B69055   |
	JSL CODE_B9D09B				;$B69058   |
	RTL					;$B6905C  /

DATA_B6905D:
%offset(DATA_B6905F, 2)
	dw $2000, $003C
	dw $1000, $001E
	dw $0000, $001E
	dw $1000, $001E

;k.rool (krocodile kore) water drop animation data
;x offset, y offset, animation number
DATA_B6906D:
	dw $0005				;number of drop sprites
DATA_B6906F:
	dw $FFF5, $FFD5, $0225
	dw $FFE3, $FFF6, $0226
	dw $FFFB, $FFEB, $0227
	dw $0016, $FFEE, $0228
	dw $000A, $FFD3, $0227

DATA_B6908D:
	dw !boss_command_wait, $0064
	dw !boss_command_goto_or_reset, DATA_B690DB, DATA_B690DB

DATA_B69097:
	dw !boss_command_dk_intro, $0003, $0000, $0000, $0000, $0000, $0000
	dw !boss_command_wait, $003C
	dw !boss_command_melee_dk
	dw !boss_command_wait, $0028
	dw !boss_command_melee_dk
	dw !boss_command_wait, $0028
	dw !boss_command_melee_dk
	dw !boss_command_wait, $005F
	dw !boss_command_shoot_dk
	dw !boss_command_wait, $0014
	dw !boss_command_shoot_dk
	dw !boss_command_wait, $001E
	dw !boss_command_shoot_dk
	dw !boss_command_wait, $0082
	dw !boss_command_dk_intro, $0002, $0000, $0000, $0000, $0000, $0000

DATA_B690DB:
	dw !boss_command_shoot
	dw !boss_command_wait, $00F0
	dw !boss_command_dash, $0500, $0003
	dw !boss_command_wait, $0032
	dw !boss_command_vacuum

DATA_B690ED:
	dw !boss_command_wait, $0032
	dw !boss_command_shoot
	dw !boss_command_wait, $0050
	dw !boss_command_dash, $0500, $0004
	dw !boss_command_wait, $0032
	dw !boss_command_vacuum
	dw !boss_command_goto_or_reset, DATA_B690ED, DATA_B690ED

DATA_B69109:
	dw !boss_command_wait, $0032
	dw !boss_command_shoot
	dw !boss_command_wait, $0078
	dw !boss_command_dash, $0500, $0006
	dw !boss_command_wait, $000A
	dw !boss_command_dash, $0500, $0006
	dw !boss_command_retract_spikes
	dw !boss_command_wait, $0032
	dw !boss_command_vacuum
	dw !boss_command_goto_or_reset, !null_pointer

DATA_B6912F:
	dw !boss_command_wait, $003C
	dw !boss_command_shoot
	dw !boss_command_wait, $0050
	dw !boss_command_dash, $0540, $0006
	dw !boss_command_wait, $000A
	dw !boss_command_dash, $0540, $0006
	dw !boss_command_wait, $000A
	dw !boss_command_dash, $0540, $0006
	dw !boss_command_wait, $0028
	dw !boss_command_retract_spikes
	dw !boss_command_wait, $0050
	dw !boss_command_vacuum
	dw !boss_command_goto_or_reset, !null_pointer
	
DATA_B69163:
	dw !boss_command_spawn_sprite, DATA_FF2216, $01C8, $0170, CODE_B6AD02, $0000, $FFEA

DATA_B69171:
	dw !boss_command_wait, $0050
	dw !boss_command_shoot
	dw !boss_command_wait, $005A
	dw !boss_command_goto_if, DATA_B69171
	dw !boss_command_vacuum
	dw !boss_command_goto_or_reset, DATA_B69171, DATA_B69171

DATA_B69187:
	dw !boss_command_wait, $0050
	dw !boss_command_dash, $0580, $0006

DATA_B69191:
	dw !boss_command_wait, $0028
	dw !boss_command_shoot
	dw !boss_command_wait, $008C
	dw !boss_command_goto_if, DATA_B69191
	dw !boss_command_vacuum
	dw !boss_command_goto_or_reset, DATA_B69191, DATA_B69191

DATA_B691A7:
	dw !boss_command_wait, $0028
	dw !boss_command_dash, $05C0, $0006

DATA_B691B1:
	dw !boss_command_wait, $0028
	dw !boss_command_shoot
	dw !boss_command_wait, $00B4
	dw !boss_command_goto_if, DATA_B691B1
	dw !boss_command_vacuum
	dw !boss_command_goto_or_reset, DATA_B691B1, DATA_B691B1

DATA_B691C7:
	dw !boss_command_spawn_sprite, DATA_FF2216, $01C8, $0170, CODE_B6AD02, $0000, $FFEA
	dw !boss_command_wait, $0032
	dw !boss_command_dash, $0600, $0006

DATA_B691DF:
	dw !boss_command_wait, $0028
	dw !boss_command_shoot
	dw !boss_command_wait, $005A
	dw !boss_command_wait_if_gas_hit, $0078
	dw !boss_command_dash, $0180, $0006
	dw !boss_command_wait, $0022
	dw !boss_command_set_visibility, $1000
	dw !boss_command_dash, $0500, $0006
	dw !boss_command_wait, $0022
	dw !boss_command_fade, DATA_B6ADAA, DATA_B6ADB6, $0007
	dw !boss_command_set_visibility, $0000
	dw !boss_command_dash, $0500, $0006
	dw !boss_command_spawn_sprite, DATA_FF1F8A, $01C8, $01C1, CODE_B6ACF3, $0000, $FFF2
	dw !boss_command_set_visibility, $1000
	dw !boss_command_fade, DATA_B6ADB6, DATA_B6ADC6, $0007
	dw !boss_command_wait, $0028
	dw !boss_command_set_visibility, $2000
	dw !boss_command_vacuum
	dw !boss_command_goto_or_reset, DATA_B691DF, DATA_B691DF

DATA_B69241:
	dw !boss_command_wait, $0028
	dw !boss_command_dash, $0640, $0006
	dw !boss_command_wait, $0028
	dw !boss_command_shoot_gas
	dw !boss_command_wait, $0096
	dw !boss_command_wait_if_gas_hit, $0078
	dw !boss_command_shoot
	dw !boss_command_wait, $0064
	dw !boss_command_spawn_sprite, DATA_FF1F8A, $01C8, $01C1, CODE_B6ACF3, $0000, $FFF2
	dw !boss_command_clear_gas_effect
	dw !boss_command_wait, $0032
	dw !boss_command_vacuum
	dw !boss_command_goto_or_reset, !null_pointer

DATA_B69279:
	dw !boss_command_wait, $0028
	dw !boss_command_dash, $0680, $0006
	dw !boss_command_wait, $0028
	dw !boss_command_shoot
	dw !boss_command_wait, $0154
	dw !boss_command_wait_if_gas_hit, $0078
	dw !boss_command_set_visibility, $1000
	dw !boss_command_timed_vacuum, $0064
	dw !boss_command_fade, DATA_B6ADAA, DATA_B6ADB6, $0007
	dw !boss_command_disable_damage
	dw !boss_command_set_visibility, $0000
	dw !boss_command_wait, $003C
	dw !boss_command_teleport, $0060
	dw !boss_command_set_visibility, $1000
	dw !boss_command_fade, DATA_B6ADB6, DATA_B6ADC6, $0007
	dw !boss_command_enable_damage
	dw !boss_command_timed_vacuum, $0064
	dw !boss_command_fade, DATA_B6ADAA, DATA_B6ADB6, $0007
	dw !boss_command_disable_damage
	dw !boss_command_set_visibility, $0000
	dw !boss_command_wait, $0050
	dw !boss_command_teleport, $0060
	dw !boss_command_set_visibility, $1000
	dw !boss_command_fade, DATA_B6ADB6, DATA_B6ADC6, $0007
	dw !boss_command_enable_damage
	dw !boss_command_timed_vacuum, $0064
	dw !boss_command_fade, DATA_B6ADAA, DATA_B6ADB6, $0007
	dw !boss_command_disable_damage
	dw !boss_command_set_visibility, $0000
	dw !boss_command_wait, $0050
	dw !boss_command_teleport, $0060
	dw !boss_command_set_visibility, $1000
	dw !boss_command_fade, DATA_B6ADB6, DATA_B6ADC6, $0007
	dw !boss_command_enable_damage
	dw !boss_command_timed_vacuum, $0064
	dw !boss_command_spawn_sprite, DATA_FF1F8A, $01C8, $01C1, CODE_B6ACF3, $0000, $FFF2
	dw !boss_command_clear_gas_effect
	dw !boss_command_fade, DATA_B6ADAA, DATA_B6ADB6, $0007
	dw !boss_command_disable_damage
	dw !boss_command_set_visibility, $0000
	dw !boss_command_wait, $0078
	dw !boss_command_teleport, $0060
	dw !boss_command_set_visibility, $1000
	dw !boss_command_fade, DATA_B6ADB6, DATA_B6ADC6, $0007
	dw !boss_command_enable_damage
	dw !boss_command_wait, $0007
	dw !boss_command_set_visibility, $2000
	dw !boss_command_timed_vacuum, $0064
	dw !boss_command_goto_or_reset, !null_pointer

DATA_B69355:
	dw !boss_command_wait, $01F4
	dw !boss_command_wait, $001E
	dw !boss_command_shoot_fish
	dw !boss_command_wait, $0078

DATA_B69363:
	dw !boss_command_wait, $0078
	dw !boss_command_set_projectiles, $003A, DATA_BAC3AC
	dw !boss_command_wait, $0096
	dw !boss_command_goto_if, DATA_B69363
	dw !boss_command_wait, $004B
	dw !boss_command_timed_vacuum, $0168
	dw !boss_command_goto_or_reset, DATA_B69363, DATA_B69363

;k.rool backfire projectile x velocities
DATA_B69383:
	dw $0000
	dw $05B0
	dw $0560
	dw $0510
	dw $04C0
	dw $0470
	dw $0420
	dw $03D0
	dw $0380
	dw $0280

CODE_B69397:
	LDX $0654				;$B69397  \
	LDA $2E,x				;$B6939A   |
	BIT #$0001				;$B6939C   |
	BNE CODE_B693AC				;$B6939F   |
	LDA $0A36				;$B693A1   |
	BIT #$0004				;$B693A4   |
	BEQ CODE_B693AC				;$B693A7   |
	BRL CODE_B69490				;$B693A9  /

CODE_B693AC:
	PHB					;$B693AC  \
	PHK					;$B693AD   |
	PLB					;$B693AE   |
	LDA.l $000652				;$B693AF   |
	BNE CODE_B693B8				;$B693B3   |
	BRL CODE_B6948B				;$B693B5  /

CODE_B693B8:
	LDX $0654				;$B693B8  \
	LDA.l $00073D				;$B693BB   |
	BEQ CODE_B693C4				;$B693BF   |
	BRL CODE_B6948B				;$B693C1  /

CODE_B693C4:
	LDA $2E,x				;$B693C4  \
	BIT #$0001				;$B693C6   |
	BEQ CODE_B693DE				;$B693C9   |
	JSL CODE_BCFB58				;$B693CB   |
	LDA #$0010				;$B693CF   |
	PHK					;$B693D2   |
	%return(CODE_B693D9)			;$B693D3   |
	JML [$09F9]				;$B693D6  /

CODE_B693D9:
	BCS CODE_B693FB				;$B693D9  \
	BRL CODE_B6948B				;$B693DB  /

CODE_B693DE:
	LDX $0654				;$B693DE  \
	LDA $2E,x				;$B693E1   |
	BIT #$2000				;$B693E3   |
	BEQ CODE_B693EB				;$B693E6   |
	BRL CODE_B6948B				;$B693E8  /

CODE_B693EB:
	JSL CODE_BCFB58				;$B693EB  \
	LDA #$0000				;$B693EF   |
	JSL CODE_B6CF65				;$B693F2   |
	BCS CODE_B693FB				;$B693F6   |
	BRL CODE_B6948B				;$B693F8  /

CODE_B693FB:
	LDA #$0014				;$B693FB  \
	STA $00073D				;$B693FE   |
	LDX $0D7A				;$B69402   |
	BEQ CODE_B69419				;$B69405   |
	JSR CODE_B6A3A1				;$B69407   |
	LDA #$000B				;$B6940A   |
	STA $44,x				;$B6940D   |
	LDA $2E,x				;$B6940F   |
	ORA #$0010				;$B69411   |
	STA $2E,x				;$B69414   |
	JSR CODE_B6AD9B				;$B69416   |
CODE_B69419:					;	   |
	LDX $0654				;$B69419   |
	LDA $2E,x				;$B6941C   |
	BIT #$0001				;$B6941E   |
	BEQ CODE_B6945B				;$B69421   |
	LDY active_kong_sprite			;$B69423   |
	LDA $0030,y				;$B69426   |
	BIT #$0080				;$B69429   |
	BNE CODE_B6945B				;$B6942C   |
	JSR CODE_B6800D				;$B6942E   |
	LDA #$0026				;$B69431   |
	JSL CODE_B8D8BA				;$B69434   |
	BCS CODE_B6945B				;$B69438   |
	LDX $0654				;$B6943A   |
	LDA $12,x				;$B6943D   |
	BIT #$4000				;$B6943F   |
	BNE CODE_B6944F				;$B69442   |
	LDA #$0600				;$B69444   |
	STA $0A86				;$B69447   |
	LDA #$0700				;$B6944A   |
	BRA CODE_B69458				;$B6944D  /

CODE_B6944F:
	LDA #$FA00				;$B6944F  \
	STA $0A86				;$B69452   |
	LDA #$F900				;$B69455   |
CODE_B69458:					;	   |
	STA $0A88				;$B69458   |
CODE_B6945B:					;	   |
	BRA CODE_B6948B				;$B6945B  /

	LDX $0654				;$B6945D   |
	LDA.l $00073D				;$B69460   |
	BNE CODE_B6948B				;$B69464   |
	LDX current_sprite			;$B69466   |
	JSL CODE_BCFB58				;$B69468   |
	LDA #$0C7B				;$B6946C   |
	JSL CODE_B6CF65				;$B6946F   |
	BCC CODE_B6948B				;$B69473   |
	LDA #$001E				;$B69475   |
	LDY #$FE00				;$B69478   |
	JSL CODE_B3A600				;$B6947B   |
	LDX $0654				;$B6947F   |
	LDA #$0014				;$B69482   |
	STA $00073D				;$B69485   |
	BRA CODE_B6948B				;$B69489  /

CODE_B6948B:
	JSL CODE_B9D100				;$B6948B  \
	PLB					;$B6948F   |
CODE_B69490:					;	   |
	JML [$05A9]				;$B69490  /

CODE_B69493:
	LDA #$C000				;$B69493  \
	STA $1C,x				;$B69496   |
	RTL					;$B69498  /

CODE_B69499:
	STZ $1C,x				;$B69499  \
	RTL					;$B6949B  /

CODE_B6949C:
	LDA #$051A				;$B6949C  \
	JSL queue_sound_effect			;$B6949F   |
	LDY.w #DATA_FF1F8A			;$B694A3   |
	JSL CODE_BB8432				;$B694A6   |
	JSR CODE_B699C5				;$B694AA   |
	LDA $002E,y				;$B694AD   |
	ORA #$0090				;$B694B0   |
	STA $002E,y				;$B694B3   |
	LDA $12,x				;$B694B6   |
	BIT #$4000				;$B694B8   |
	BNE CODE_B694C8				;$B694BB   |
	LDA #$0300				;$B694BD   |
	STA $0020,y				;$B694C0   |
	LDA #$0000				;$B694C3   |
	BRA CODE_B694D1				;$B694C6  /

CODE_B694C8:
	LDA #$FD00				;$B694C8  \
	STA $0020,y				;$B694CB   |
	LDA #$0000				;$B694CE   |
CODE_B694D1:					;	   |
	STA $0026,y				;$B694D1   |
	LDA #$0005				;$B694D4   |
	STA $0042,y				;$B694D7   |
	LDA #$0003				;$B694DA   |
	STA $0044,y				;$B694DD   |
	LDA #$0000				;$B694E0   |
	STA $0024,y				;$B694E3   |
	LDA #$0200				;$B694E6   |
	STA $002A,y				;$B694E9   |
	LDA #$0001				;$B694EC   |
	STA $0046,y				;$B694EF   |
	RTS					;$B694F2  /

CODE_B694F3:
	LDA #$051A				;$B694F3  \
	JSL queue_sound_effect			;$B694F6   |
	LDY.w #DATA_FF1F8A			;$B694FA   |
	JSL CODE_BB8432				;$B694FD   |
	JSR CODE_B699C5				;$B69501   |
	LDA $002E,y				;$B69504   |
	ORA #$0200				;$B69507   |
	STA $002E,y				;$B6950A   |
	STY $0735				;$B6950D   |
	JSR CODE_B69557				;$B69510   |
	LDA $12,x				;$B69513   |
	BIT #$4000				;$B69515   |
	BNE CODE_B69525				;$B69518   |
	LDA #$0300				;$B6951A   |
	STA $0020,y				;$B6951D   |
	LDA #$0000				;$B69520   |
	BRA CODE_B6952E				;$B69523  /

CODE_B69525:
	LDA #$FD00				;$B69525  \
	STA $0020,y				;$B69528   |
	LDA #$0000				;$B6952B   |
CODE_B6952E:					;	   |
	STA $0026,y				;$B6952E   |
	LDA #$0005				;$B69531   |
	STA $0042,y				;$B69534   |
	LDA #$0003				;$B69537   |
	STA $0044,y				;$B6953A   |
	LDA #$0000				;$B6953D   |
	STA $0024,y				;$B69540   |
	LDA #$0200				;$B69543   |
	STA $002A,y				;$B69546   |
	LDA #$001A				;$B69549   |
	STA $0046,y				;$B6954C   |
	LDA #$0289				;$B6954F   |
	JSL CODE_B9D09B				;$B69552   |
	RTS					;$B69556  /

CODE_B69557:
	LDA $002E,y				;$B69557  \
	ORA #$0092				;$B6955A   |
	STA $002E,y				;$B6955D   |
	RTS					;$B69560  /

CODE_B69561:
	LDA #$0008				;$B69561  \
	STA $0046,y				;$B69564   |
	LDA.l $000735				;$B69567   |
	BNE CODE_B69570				;$B6956B   |
	STY $0735				;$B6956D   |
CODE_B69570:					;	   |
	BRA CODE_B695AC				;$B69570  /

CODE_B69572:
	LDA #$051A				;$B69572  \
	JSL queue_sound_effect			;$B69575   |
	LDY.w #DATA_FF1F8A			;$B69579   |
	JSL CODE_BB8432				;$B6957C   |
	JSR CODE_B699C5				;$B69580   |
	LDA $002E,y				;$B69583   |
	ORA #$0200				;$B69586   |
	STA $002E,y				;$B69589   |
	LDA.l $000727				;$B6958C   |
	CMP #$0001				;$B69590   |
	BEQ CODE_B69561				;$B69593   |
	LDA #$002E				;$B69595   |
	STA $0046,y				;$B69598   |
	LDA #$002D				;$B6959B   |
	STA $000729				;$B6959E   |
	LDA global_frame_counter		;$B695A2   |
	BIT #$0001				;$B695A4   |
	BEQ CODE_B695AC				;$B695A7   |
	STY $0735				;$B695A9   |
CODE_B695AC:					;	   |
	JSR CODE_B69557				;$B695AC   |
	LDA $12,x				;$B695AF   |
	BIT #$4000				;$B695B1   |
	BNE CODE_B695C1				;$B695B4   |
	LDA #$0300				;$B695B6   |
	STA $0020,y				;$B695B9   |
	LDA #$0000				;$B695BC   |
	BRA CODE_B695CA				;$B695BF  /

CODE_B695C1:
	LDA #$FD00				;$B695C1  \
	STA $0020,y				;$B695C4   |
	LDA #$0000				;$B695C7   |
CODE_B695CA:					;	   |
	STA $0026,y				;$B695CA   |
	LDA #$0005				;$B695CD   |
	STA $0042,y				;$B695D0   |
	LDA #$0003				;$B695D3   |
	STA $0044,y				;$B695D6   |
	LDA #$0000				;$B695D9   |
	STA $0024,y				;$B695DC   |
	LDA #$0200				;$B695DF   |
	STA $002A,y				;$B695E2   |
	LDA #$0289				;$B695E5   |
	JSL CODE_B9D09B				;$B695E8   |
	RTS					;$B695EC  /

CODE_B695ED:
	LDA.l $000727				;$B695ED  \
	CMP #$0001				;$B695F1   |
	BNE CODE_B695FB				;$B695F4   |
	JSR CODE_B69687				;$B695F6   |
	BCC CODE_B69610				;$B695F9   |
CODE_B695FB:					;	   |
	LDA #$051A				;$B695FB   |
	JSL queue_sound_effect			;$B695FE   |
	LDY #$0186				;$B69602   |
	JSL CODE_BB842C				;$B69605   |
	LDA #$0282				;$B69609   |
	JSL CODE_B9D09B				;$B6960C   |
CODE_B69610:					;	   |
	JSR CODE_B699C5				;$B69610   |
	LDA level_number			;$B69613   |
	CMP #!level_krocodile_kore		;$B69615   |
	BNE CODE_B6961D				;$B69618   |
	JSR CODE_B68F37				;$B6961A   |
CODE_B6961D:					;	   |
	LDA $002E,y				;$B6961D   |
	ORA #$0091				;$B69620   |
	STA $002E,y				;$B69623   |
	LDA $12,x				;$B69626   |
	JSR CODE_B6D923				;$B69628   |
	LDX $0737				;$B6962B   |
	BIT #$4000				;$B6962E   |
	BNE CODE_B6963E				;$B69631   |
	LDA $0000,x				;$B69633   |
	STA $0020,y				;$B69636   |
	LDA $0004,x				;$B69639   |
	BRA CODE_B6964F				;$B6963C  /

CODE_B6963E:
	LDA #$0000				;$B6963E  \
	SEC					;$B69641   |
	SBC $0000,x				;$B69642   |
	STA $0020,y				;$B69645   |
	LDA #$0000				;$B69648   |
	SEC					;$B6964B   |
	SBC $0004,x				;$B6964C   |
CODE_B6964F:					;	   |
	STA $0026,y				;$B6964F   |
	LDA $0008,x				;$B69652   |
	STA $0042,y				;$B69655   |
	LDA $000A,x				;$B69658   |
	STA $0044,y				;$B6965B   |
	LDA $0002,x				;$B6965E   |
	STA $0024,y				;$B69661   |
	LDA $0006,x				;$B69664   |
	STA $002A,y				;$B69667   |
	LDA $000C,x				;$B6966A   |
	STA $000729				;$B6966D   |
	LDA $000A,y				;$B69671   |
	CLC					;$B69674   |
	ADC $000E,x				;$B69675   |
	STA $000A,y				;$B69678   |
	TXA					;$B6967B   |
	CLC					;$B6967C   |
	ADC #$0010				;$B6967D   |
	STA $000737				;$B69680   |
	PHK					;$B69684   |
	PLB					;$B69685   |
	RTS					;$B69686  /

CODE_B69687:
	LDA.l $000735				;$B69687  \
	BNE CODE_B696B3				;$B6968B   |
	LDY #$0184				;$B6968D   |
	JSL CODE_BB842C				;$B69690   |
	LDA #$051A				;$B69694   |
	JSL queue_sound_effect			;$B69697   |
	LDY alternate_sprite			;$B6969B   |
	STY $0735				;$B6969D   |
	LDA $0020,y				;$B696A0   |
	BPL CODE_B696AA				;$B696A3   |
	LDA #$027D				;$B696A5   |
	BRA CODE_B696AD				;$B696A8  /

CODE_B696AA:
	LDA #$0281				;$B696AA  \
CODE_B696AD:					;	   |
	JSL CODE_B9D09B				;$B696AD   |
	CLC					;$B696B1   |
	RTS					;$B696B2  /

CODE_B696B3:
	SEC					;$B696B3  \
	RTS					;$B696B4  /

CODE_B696B5:
	LDA.l $000727				;$B696B5  \
	CMP #$0001				;$B696B9   |
	BNE CODE_B696C3				;$B696BC   |
	JSR CODE_B69687				;$B696BE   |
	BCC CODE_B696D8				;$B696C1   |
CODE_B696C3:					;	   |
	LDA #$051A				;$B696C3   |
	JSL queue_sound_effect			;$B696C6   |
	LDY #$0186				;$B696CA   |
	JSL CODE_BB842C				;$B696CD   |
	LDA #$0282				;$B696D1   |
	JSL CODE_B9D09B				;$B696D4   |
CODE_B696D8:					;	   |
	JSR CODE_B699C5				;$B696D8   |
	LDA $002E,y				;$B696DB   |
	ORA #$0092				;$B696DE   |
	STA $002E,y				;$B696E1   |
	JSR CODE_B6D923				;$B696E4   |
	LDA $12,x				;$B696E7   |
	LDX $0737				;$B696E9   |
	BIT #$4000				;$B696EC   |
	BNE CODE_B696FC				;$B696EF   |
	LDA $0000,x				;$B696F1   |
	STA $0020,y				;$B696F4   |
	LDA $0004,x				;$B696F7   |
	BRA CODE_B6970D				;$B696FA  /

CODE_B696FC:
	LDA #$0000				;$B696FC  \
	SEC					;$B696FF   |
	SBC $0000,x				;$B69700   |
	STA $0020,y				;$B69703   |
	LDA #$0000				;$B69706   |
	SEC					;$B69709   |
	SBC $0004,x				;$B6970A   |
CODE_B6970D:					;	   |
	STA $0026,y				;$B6970D   |
	LDA $0008,x				;$B69710   |
	STA $0042,y				;$B69713   |
	LDA $000A,x				;$B69716   |
	STA $0044,y				;$B69719   |
	LDA $0002,x				;$B6971C   |
	STA $0024,y				;$B6971F   |
	LDA $0006,x				;$B69722   |
	STA $002A,y				;$B69725   |
	LDA $0010,x				;$B69728   |
	STA $000729				;$B6972B   |
	LDA $000C,x				;$B6972F   |
	STA $0046,y				;$B69732   |
	LDA $000E,x				;$B69735   |
	STA $0048,y				;$B69738   |
	TXA					;$B6973B   |
	CLC					;$B6973C   |
	ADC #$0012				;$B6973D   |
	STA $000737				;$B69740   |
	PHK					;$B69744   |
	PLB					;$B69745   |
	RTS					;$B69746  /

CODE_B69747:
	LDA.l $000727				;$B69747  \
	CMP #$0001				;$B6974B   |
	BNE CODE_B69755				;$B6974E   |
	JSR CODE_B69687				;$B69750   |
	BCC CODE_B6976A				;$B69753   |
CODE_B69755:					;	   |
	LDA #$051A				;$B69755   |
	JSL queue_sound_effect			;$B69758   |
	LDY #$0186				;$B6975C   |
	JSL CODE_BB842C				;$B6975F   |
	LDA #$0282				;$B69763   |
	JSL CODE_B9D09B				;$B69766   |
CODE_B6976A:					;	   |
	JSR CODE_B699C5				;$B6976A   |
	LDA $002E,y				;$B6976D   |
	ORA #$0290				;$B69770   |
	STA $002E,y				;$B69773   |
	JSR CODE_B6D923				;$B69776   |
	LDA $12,x				;$B69779   |
	LDX $0737				;$B6977B   |
	BIT #$4000				;$B6977E   |
	BNE CODE_B69794				;$B69781   |
	LDA $000A,x				;$B69783   |
	STA $004C,y				;$B69786   |
	LDA $0000,x				;$B69789   |
	STA $0020,y				;$B6978C   |
	LDA $0004,x				;$B6978F   |
	BRA CODE_B697AF				;$B69792  /

CODE_B69794:
	LDA #$0000				;$B69794  \
	SEC					;$B69797   |
	SBC $000A,x				;$B69798   |
	STA $004C,y				;$B6979B   |
	LDA #$0000				;$B6979E   |
	SEC					;$B697A1   |
	SBC $0000,x				;$B697A2   |
	STA $0020,y				;$B697A5   |
	LDA #$0000				;$B697A8   |
	SEC					;$B697AB   |
	SBC $0004,x				;$B697AC   |
CODE_B697AF:					;	   |
	STA $0026,y				;$B697AF   |
	LDA $0008,x				;$B697B2   |
	STA $004A,y				;$B697B5   |
	LDA $000C,x				;$B697B8   |
	STA $0048,y				;$B697BB   |
	LDA #CODE_B68000			;$B697BE   |
	STA $0046,y				;$B697C1   |
	LDA $0002,x				;$B697C4   |
	STA $0024,y				;$B697C7   |
	LDA $0006,x				;$B697CA   |
	STA $002A,y				;$B697CD   |
	LDA $000A,y				;$B697D0   |
	CLC					;$B697D3   |
	ADC $0010,x				;$B697D4   |
	STA $000A,y				;$B697D7   |
	STA $0028,y				;$B697DA   |
	LDA $0006,y				;$B697DD   |
	STA $0022,y				;$B697E0   |
	LDA $000E,x				;$B697E3   |
	STA $000729				;$B697E6   |
	LDA #$000A				;$B697EA   |
	STA $0052,y				;$B697ED   |
	TXA					;$B697F0   |
	CLC					;$B697F1   |
	ADC #$0012				;$B697F2   |
	STA $000737				;$B697F5   |
	PHK					;$B697F9   |
	PLB					;$B697FA   |
	RTS					;$B697FB  /

CODE_B697FC:
	LDA #$051A				;$B697FC  \
	JSL queue_sound_effect			;$B697FF   |
	LDY #$0182				;$B69803   |
	JSL CODE_BB842C				;$B69806   |
	JSR CODE_B699C5				;$B6980A   |
	LDA $002E,y				;$B6980D   |
	ORA #$0490				;$B69810   |
	STA $002E,y				;$B69813   |
CODE_B69816:					;	   |
	JSR CODE_B6D923				;$B69816   |
	LDA $12,x				;$B69819   |
	LDX $0737				;$B6981B   |
	BIT #$4000				;$B6981E   |
	BNE CODE_B6982E				;$B69821   |
	LDA $0000,x				;$B69823   |
	STA $0020,y				;$B69826   |
	LDA $0004,x				;$B69829   |
	BRA CODE_B6983F				;$B6982C  /

CODE_B6982E:
	LDA #$0000				;$B6982E  \
	SEC					;$B69831   |
	SBC $0000,x				;$B69832   |
	STA $0020,y				;$B69835   |
	LDA #$0000				;$B69838   |
	SEC					;$B6983B   |
	SBC $0004,x				;$B6983C   |
CODE_B6983F:					;	   |
	STA $0026,y				;$B6983F   |
	LDA $0008,x				;$B69842   |
	STA $0042,y				;$B69845   |
	LDA $000A,x				;$B69848   |
	STA $0044,y				;$B6984B   |
	LDA $0002,x				;$B6984E   |
	STA $0024,y				;$B69851   |
	LDA $0006,x				;$B69854   |
	STA $002A,y				;$B69857   |
	LDA $000C,x				;$B6985A   |
	STA $000729				;$B6985D   |
	LDA $000A,y				;$B69861   |
	CLC					;$B69864   |
	ADC $000E,x				;$B69865   |
	STA $000A,y				;$B69868   |
	TXA					;$B6986B   |
	CLC					;$B6986C   |
	ADC #$0010				;$B6986D   |
	STA $000737				;$B69870   |
	PHK					;$B69874   |
	PLB					;$B69875   |
	RTS					;$B69876  /

CODE_B69877:
	LDA #$051A				;$B69877  \
	JSL queue_sound_effect			;$B6987A   |
	LDY #$017E				;$B6987E   |
	JSL CODE_BB842C				;$B69881   |
	JSR CODE_B699C5				;$B69885   |
	LDA $002E,y				;$B69888   |
	ORA #$1090				;$B6988B   |
	STA $002E,y				;$B6988E   |
	JSR CODE_B6D923				;$B69891   |
	LDA $12,x				;$B69894   |
	LDX $0737				;$B69896   |
	BIT #$4000				;$B69899   |
	BNE CODE_B698AF				;$B6989C   |
	LDA $000A,x				;$B6989E   |
	STA $004C,y				;$B698A1   |
	LDA $0000,x				;$B698A4   |
	STA $0020,y				;$B698A7   |
	LDA $0004,x				;$B698AA   |
	BRA CODE_B698CA				;$B698AD  /

CODE_B698AF:
	LDA #$0000				;$B698AF  \
	SEC					;$B698B2   |
	SBC $000A,x				;$B698B3   |
	STA $004C,y				;$B698B6   |
	LDA #$0000				;$B698B9   |
	SEC					;$B698BC   |
	SBC $0000,x				;$B698BD   |
	STA $0020,y				;$B698C0   |
	LDA #$0000				;$B698C3   |
	SEC					;$B698C6   |
	SBC $0004,x				;$B698C7   |
CODE_B698CA:					;	   |
	STA $0026,y				;$B698CA   |
	LDA $0008,x				;$B698CD   |
	STA $004A,y				;$B698D0   |
	LDA $000C,x				;$B698D3   |
	STA $0048,y				;$B698D6   |
	LDA #CODE_B68000			;$B698D9   |
	STA $0046,y				;$B698DC   |
	LDA $0002,x				;$B698DF   |
	STA $0024,y				;$B698E2   |
	LDA $0006,x				;$B698E5   |
	STA $002A,y				;$B698E8   |
	LDA $000A,y				;$B698EB   |
	CLC					;$B698EE   |
	ADC $0010,x				;$B698EF   |
	STA $000A,y				;$B698F2   |
	STA $0028,y				;$B698F5   |
	LDA $0006,y				;$B698F8   |
	STA $0022,y				;$B698FB   |
	LDA $000E,x				;$B698FE   |
	STA $000729				;$B69901   |
	LDA #$000A				;$B69905   |
	STA $0052,y				;$B69908   |
	TXA					;$B6990B   |
	CLC					;$B6990C   |
	ADC #$0012				;$B6990D   |
	STA $000737				;$B69910   |
	PHK					;$B69914   |
	PLB					;$B69915   |
	RTS					;$B69916  /

CODE_B69917:
	LDA #$051A				;$B69917  \
	JSL queue_sound_effect			;$B6991A   |
	LDY #$0186				;$B6991E   |
	JSL CODE_BB842C				;$B69921   |
	JSR CODE_B699C5				;$B69925   |
	LDA $002E,y				;$B69928   |
	ORA #$4090				;$B6992B   |
	STA $002E,y				;$B6992E   |
	JSR CODE_B6D923				;$B69931   |
	LDA $12,x				;$B69934   |
	LDX $0737				;$B69936   |
	BIT #$4000				;$B69939   |
	BNE CODE_B69949				;$B6993C   |
	LDA $0000,x				;$B6993E   |
	STA $0020,y				;$B69941   |
	LDA $0004,x				;$B69944   |
	BRA CODE_B6995A				;$B69947  /

CODE_B69949:
	LDA #$0000				;$B69949  \
	SEC					;$B6994C   |
	SBC $0000,x				;$B6994D   |
	STA $0020,y				;$B69950   |
	LDA #$0000				;$B69953   |
	SEC					;$B69956   |
	SBC $0004,x				;$B69957   |
CODE_B6995A:					;	   |
	STA $0026,y				;$B6995A   |
	LDA $0008,x				;$B6995D   |
	STA $0042,y				;$B69960   |
	LDA $000A,x				;$B69963   |
	STA $0044,y				;$B69966   |
	LDA $0002,x				;$B69969   |
	STA $0024,y				;$B6996C   |
	LDA $0006,x				;$B6996F   |
	STA $002A,y				;$B69972   |
	LDA $000C,x				;$B69975   |
	STA $000729				;$B69978   |
	LDA $000A,y				;$B6997C   |
	CLC					;$B6997F   |
	ADC $000E,x				;$B69980   |
	STA $000A,y				;$B69983   |
	LDA $0010,x				;$B69986   |
	STA $0046,y				;$B69989   |
	STA $0048,y				;$B6998C   |
	LDA #$0000				;$B6998F   |
	STA $004A,y				;$B69992   |
	TXA					;$B69995   |
	CLC					;$B69996   |
	ADC #$0012				;$B69997   |
	STA $000737				;$B6999A   |
	LDA #$0282				;$B6999E   |
	JSL CODE_B9D09B				;$B699A1   |
	PHK					;$B699A5   |
	PLB					;$B699A6   |
	RTS					;$B699A7  /

CODE_B699A8:
	LDA #$051A				;$B699A8   |
	JSL queue_sound_effect			;$B699AB   |
	LDY #$017E				;$B699AF   |
	JSL CODE_BB842C				;$B699B2   |
	JSR CODE_B699C5				;$B699B6   |
	LDA $002E,y				;$B699B9   |
	ORA #$0490				;$B699BC   |
	STA $002E,y				;$B699BF   |
	BRL CODE_B69816				;$B699C2  /

CODE_B699C5:
	LDX current_sprite			;$B699C5  \
	LDY alternate_sprite			;$B699C7   |
	LDA $0A,x				;$B699C9   |
	CLC					;$B699CB   |
	ADC #$FFF5				;$B699CC   |
	STA $000A,y				;$B699CF   |
	LDA $12,x				;$B699D2   |
	BIT #$4000				;$B699D4   |
	BNE CODE_B699E1				;$B699D7   |
	LDA $06,x				;$B699D9   |
	SEC					;$B699DB   |
	SBC #$FFD8				;$B699DC   |
	BRA CODE_B699E7				;$B699DF  /

CODE_B699E1:
	LDA $06,x				;$B699E1  \
	CLC					;$B699E3   |
	ADC #$FFD8				;$B699E4   |
CODE_B699E7:					;	   |
	STA $0006,y				;$B699E7   |
	RTS					;$B699EA  /

CODE_B699EB:
	LDX current_sprite			;$B699EB  \
	LDA $42,x				;$B699ED   |
	JSL CODE_B8D010				;$B699EF   |
	LDX current_sprite			;$B699F3   |
	LDA $44,x				;$B699F5   |
	JSL CODE_B8CFD4				;$B699F7   |
	JSL CODE_B8CF7F				;$B699FB   |
	LDX current_sprite			;$B699FF   |
	LDA $46,x				;$B69A01   |
	BNE CODE_B69A4F				;$B69A03   |
	JSL CODE_BCFB58				;$B69A05   |
	LDA #$0200				;$B69A09   |
	JSL CODE_BCFE0A				;$B69A0C   |
	BCC CODE_B69A4F				;$B69A10   |
	INC $0763				;$B69A12   |
	LDY $075F				;$B69A15   |
	STY alternate_sprite			;$B69A18   |
	LDA #$0001				;$B69A1A   |
	STA $002E,y				;$B69A1D   |
	LDA #$A609				;$B69A20   |
	STA $0042,y				;$B69A23   |
	LDA #$0252				;$B69A26   |
	JSL CODE_B9D09B				;$B69A29   |
	LDA.l $00075B				;$B69A2D   |
	STA alternate_sprite			;$B69A31   |
	LDA #$0253				;$B69A33   |
	JSL CODE_B9D09B				;$B69A36   |
	LDX current_sprite			;$B69A3A   |
	INC $46,x				;$B69A3C   |
	LDA #$0300				;$B69A3E   |
	STA $20,x				;$B69A41   |
	STZ $26,x				;$B69A43   |
	LDA #$F200				;$B69A45   |
	STA $24,x				;$B69A48   |
	LDA #$0A00				;$B69A4A   |
	STA $2A,x				;$B69A4D   |
CODE_B69A4F:					;	   |
	JSL CODE_B9D100				;$B69A4F   |
	JSL CODE_BBBB8D				;$B69A53   |
	JML [$05A9]				;$B69A57  /

CODE_B69A5A:
	PHB					;$B69A5A  \
	PHK					;$B69A5B   |
	PLB					;$B69A5C   |
	LDA.l $0006A3				;$B69A5D   |
	BIT #$0100				;$B69A61   |
	BEQ CODE_B69A76				;$B69A64   |
	JSR CODE_B6AD9B				;$B69A66   |
	STZ $0735				;$B69A69   |
	JSL CODE_BB82B8				;$B69A6C   |
	JSR CODE_B6AD29				;$B69A70   |
	BRL CODE_B69C37				;$B69A73  /

CODE_B69A76:
	LDX current_sprite			;$B69A76  \
	LDA $2E,x				;$B69A78   |
	BIT #$0020				;$B69A7A   |
	BEQ CODE_B69A82				;$B69A7D   |
	BRL CODE_B69C6A				;$B69A7F  /

CODE_B69A82:
	CPX $0D7A				;$B69A82  \
	BNE CODE_B69A8A				;$B69A85   |
	BRL CODE_B69C64				;$B69A87  /

CODE_B69A8A:
	LDA $2E,x				;$B69A8A  \
	BIT #$0200				;$B69A8C   |
	BNE CODE_B69A98				;$B69A8F   |
	LDA $2E,x				;$B69A91   |
	BIT #$0080				;$B69A93   |
	BEQ CODE_B69AA5				;$B69A96   |
CODE_B69A98:					;	   |
	JSL CODE_BCFB58				;$B69A98   |
	LDA #$0000				;$B69A9C   |
	JSL CODE_B6CF65				;$B69A9F   |
	LDX current_sprite			;$B69AA3   |
CODE_B69AA5:					;	   |
	CPX $0D7A				;$B69AA5   |
	BEQ CODE_B69AB4				;$B69AA8   |
	LDA $2E,x				;$B69AAA   |
	BIT #$0080				;$B69AAC   |
	BEQ CODE_B69AB4				;$B69AAF   |
	BRL CODE_B69B58				;$B69AB1  /

CODE_B69AB4:
	LDA $2E,x				;$B69AB4  \
	BIT #$0010				;$B69AB6   |
	BEQ CODE_B69ABE				;$B69AB9   |
	BRL CODE_B69B58				;$B69ABB  /

CODE_B69ABE:
	JSL CODE_BCFB58				;$B69ABE  \
	LDA #$0020				;$B69AC2   |
	JSL CODE_BCFE0A				;$B69AC5   |
	BCC CODE_B69B30				;$B69AC9   |
	LDY $6A					;$B69ACB   |
	LDA $0000,y				;$B69ACD   |
	CMP #$0268				;$B69AD0   |
	BNE CODE_B69AE8				;$B69AD3   |
	LDY $0654				;$B69AD5   |
	LDA $001C,y				;$B69AD8   |
	AND #$C000				;$B69ADB   |
	BNE CODE_B69AE3				;$B69ADE   |
	BRL CODE_B69CD4				;$B69AE0  /

CODE_B69AE3:
	LDY $6A					;$B69AE3  \
	LDA $0000,y				;$B69AE5   |
CODE_B69AE8:					;	   |
	CMP #$0264				;$B69AE8   |
	BNE CODE_B69B1B				;$B69AEB   |
if !version == 0				;	   |
	LDA #$056B				;$B69AED   |
	JSL queue_sound_effect			;$B69AF0   |
	JSR CODE_B6800D				;$B69AF4   |
	LDY $0654				;$B69AF7   |
	LDA $001C,y				;$B69AFA   |
	AND #$C000				;$B69AFC   |
	BNE CODE_B69B16				;$B69AFF   |
else						;	   |
	LDY $0654				;$B69AED   |
	LDA $001C,y				;$B69AF0   |
	AND #$C000				;$B69AF3   |
	BNE CODE_B69B16				;$B69AF6   |
	LDA #$056B				;$B69AF8   |
	JSL queue_sound_effect			;$B69AFB   |
	JSR CODE_B6800D				;$B69AFF   |
endif						;	   |
	LDX current_sprite			;$B69B02   |
	LDA $2E,x				;$B69B04   |
	BIT #$0010				;$B69B06   |
	BEQ CODE_B69B0E				;$B69B09   |
	BRL CODE_B69B30				;$B69B0B  /

CODE_B69B0E:
	LDX current_sprite			;$B69B0E  \
	JSR CODE_B69E7D				;$B69B10   |
	BRL CODE_B69BC5				;$B69B13  /

CODE_B69B16:
	LDY $6A					;$B69B16  \
	LDA $0000,y				;$B69B18   |
CODE_B69B1B:					;	   |
	CMP #$0270				;$B69B1B   |
	BNE CODE_B69B30				;$B69B1E   |
	LDA $002E,y				;$B69B20   |
	BIT #$0040				;$B69B23   |
	BNE CODE_B69B30				;$B69B26   |
	JSR CODE_B69EB0				;$B69B28   |
	LDX current_sprite			;$B69B2B   |
	BRL CODE_B69BC5				;$B69B2D  /

CODE_B69B30:
	CMP #$02A0				;$B69B30  \
	BNE CODE_B69B45				;$B69B33   |
	LDA $002E,y				;$B69B35   |
	BIT #$0040				;$B69B38   |
	BNE CODE_B69B45				;$B69B3B   |
	JSR CODE_B69EB0				;$B69B3D   |
	LDX current_sprite			;$B69B40   |
	BRL CODE_B69BC5				;$B69B42  /

CODE_B69B45:
	CPX $0D7A				;$B69B45  \
	BNE CODE_B69B4D				;$B69B48   |
	BRL CODE_B69C64				;$B69B4A  /

CODE_B69B4D:
	LDX current_sprite			;$B69B4D  \
	LDA $2E,x				;$B69B4F   |
	BIT #$0008				;$B69B51   |
	BNE CODE_B69B58				;$B69B54   |
	STZ $26,x				;$B69B56   |
CODE_B69B58:					;	   |
	LDA $1E,x				;$B69B58   |
	BIT #$0001				;$B69B5A   |
	BEQ CODE_B69B94				;$B69B5D   |
	LDA $2E,x				;$B69B5F   |
	BIT #$0008				;$B69B61   |
	BEQ CODE_B69B6C				;$B69B64   |
	STZ $24,x				;$B69B66   |
	STZ $2A,x				;$B69B68   |
	BRA CODE_B69B94				;$B69B6A  /

CODE_B69B6C:
	LDA $24,x				;$B69B6C  \
	CMP #$02FF				;$B69B6E   |
	BCC CODE_B69B9E				;$B69B71   |
	EOR #$FFFF				;$B69B73   |
	INC A					;$B69B76   |
	STA $24,x				;$B69B77   |
	LDX current_sprite			;$B69B79   |
	LDA #$0600				;$B69B7B   |
	STA $2A,x				;$B69B7E   |
	LDA #$0009				;$B69B80   |
	STA $42,x				;$B69B83   |
	LDA #$0009				;$B69B85   |
	STA $44,x				;$B69B88   |
	LDA $2E,x				;$B69B8A   |
	ORA #$0048				;$B69B8C   |
	AND #$FF7F				;$B69B8F   |
	STA $2E,x				;$B69B92   |
CODE_B69B94:					;	   |
	LDA $1E,x				;$B69B94   |
	AND #$0101				;$B69B96   |
	CMP #$0101				;$B69B99   |
	BNE CODE_B69BB7				;$B69B9C   |
CODE_B69B9E:					;	   |
	STZ $24,x				;$B69B9E   |
	STZ $2A,x				;$B69BA0   |
	STZ $26,x				;$B69BA2   |
	LDA $2E,x				;$B69BA4   |
	AND #$FFF7				;$B69BA6   |
	ORA #$0004				;$B69BA9   |
	STA $2E,x				;$B69BAC   |
	LDA #$000A				;$B69BAE   |
	STA $42,x				;$B69BB1   |
	LDX current_sprite			;$B69BB3   |
	BRA CODE_B69BC5				;$B69BB5  /

CODE_B69BB7:
	CMP #$0001				;$B69BB7  \
	BNE CODE_B69BC5				;$B69BBA   |
	LDA #$056B				;$B69BBC   |
	JSL queue_sound_effect			;$B69BBF   |
	LDX current_sprite			;$B69BC3   |
CODE_B69BC5:					;	   |
	LDA $2E,x				;$B69BC5   |
	BIT #$0080				;$B69BC7   |
	BEQ CODE_B69BD4				;$B69BCA   |
	LDA $46,x				;$B69BCC   |
	BEQ CODE_B69BD4				;$B69BCE   |
	DEC $46,x				;$B69BD0   |
	BRA CODE_B69BE2				;$B69BD2  /

CODE_B69BD4:
	LDA $42,x				;$B69BD4  \
	JSL CODE_B8D010				;$B69BD6   |
	LDX current_sprite			;$B69BDA   |
	LDA $44,x				;$B69BDC   |
	JSL CODE_B8CFD4				;$B69BDE   |
CODE_B69BE2:					;	   |
	LDX current_sprite			;$B69BE2   |
	LDA $2E,x				;$B69BE4   |
	BIT #$0100				;$B69BE6   |
	BEQ CODE_B69BF7				;$B69BE9   |
	JSL CODE_B8CF7F				;$B69BEB   |
	JSR CODE_B69C87				;$B69BEF   |
	BCC CODE_B69BFB				;$B69BF2   |
	BRL CODE_B69C37				;$B69BF4  /

CODE_B69BF7:
	JSL CODE_B8D5E0				;$B69BF7  \
CODE_B69BFB:					;	   |
	LDA $20,x				;$B69BFB   |
	BNE CODE_B69C20				;$B69BFD   |
	STZ $04,x				;$B69BFF   |
	LDX current_sprite			;$B69C01   |
	LDA $2E,x				;$B69C03   |
	BIT #$0001				;$B69C05   |
	BNE CODE_B69C20				;$B69C08   |
	BIT #$0002				;$B69C0A   |
	BEQ CODE_B69C3B				;$B69C0D   |
	LDA $2E,x				;$B69C0F   |
	ORA #$0001				;$B69C11   |
	AND #$FFFD				;$B69C14   |
	STA $2E,x				;$B69C17   |
	LDA #$0268				;$B69C19   |
	JSL set_sprite_animation		;$B69C1C   |
CODE_B69C20:					;	   |
	JSL CODE_B9D100				;$B69C20   |
CODE_B69C24:					;	   |
	LDX current_sprite			;$B69C24   |
	LDY #$0000				;$B69C26   |
	LDA.l $0006A3				;$B69C29   |
	BIT #$0080				;$B69C2D   |
	BNE CODE_B69C35				;$B69C30   |
	LDY #$C000				;$B69C32   |
CODE_B69C35:					;	   |
	STY $1C,x				;$B69C35   |
CODE_B69C37:					;	   |
	PLB					;$B69C37   |
	JML [$05A9]				;$B69C38  /

CODE_B69C3B:
	LDA $30,x				;$B69C3B  \
	ORA #$0001				;$B69C3D   |
	STA $30,x				;$B69C40   |
	LDA $0D7A				;$B69C42   |
	CMP current_sprite			;$B69C45   |
	BEQ CODE_B69C64				;$B69C47   |
	LDA $2E,x				;$B69C49   |
	ORA #$0010				;$B69C4B   |
	STA $2E,x				;$B69C4E   |
	LDA $32,x				;$B69C50   |
	BEQ CODE_B69C24				;$B69C52   |
	STZ $32,x				;$B69C54   |
	CMP #$0001				;$B69C56   |
	BNE CODE_B69C24				;$B69C59   |
	LDA #$FFFC				;$B69C5B   |
	AND $30,x				;$B69C5E   |
	STA $30,x				;$B69C60   |
	BRA CODE_B69C24				;$B69C62  /

CODE_B69C64:
	JSR CODE_B6A1C2				;$B69C64  \
	BRL CODE_B69C24				;$B69C67  /

CODE_B69C6A:
	JSR CODE_B69C70				;$B69C6A  \
	BRL CODE_B69C20				;$B69C6D  /

CODE_B69C70:
	LDA $42,x				;$B69C70  \
	JSL CODE_B8D010				;$B69C72   |
	LDX current_sprite			;$B69C76   |
	LDA $44,x				;$B69C78   |
	JSL CODE_B8CFD4				;$B69C7A   |
	JSL CODE_B8CF7F				;$B69C7E   |
	JSL CODE_BBBB8D				;$B69C82   |
	RTS					;$B69C86  /

CODE_B69C87:
	LDX current_sprite			;$B69C87  \
	LDA $06,x				;$B69C89   |
	CMP #$00E8				;$B69C8B   |
	BCC CODE_B69C95				;$B69C8E   |
	CMP #$0312				;$B69C90   |
	BCC CODE_B69C9D				;$B69C93   |
CODE_B69C95:					;	   |
	JSL CODE_BB82B8				;$B69C95   |
	LDX current_sprite			;$B69C99   |
	SEC					;$B69C9B   |
	RTS					;$B69C9C  /

CODE_B69C9D:
	CLC					;$B69C9D  \
	RTS					;$B69C9E  /

CODE_B69C9F:
	LDA $0D7A				;$B69C9F  \
	CMP current_sprite			;$B69CA2   |
	BEQ CODE_B69CAF				;$B69CA4   |
	LDA $20,x				;$B69CA6   |
	BPL CODE_B69CBA				;$B69CA8   |
CODE_B69CAA:					;	   |
	LDA #$0400				;$B69CAA   |
	BRA CODE_B69CBD				;$B69CAD  /

CODE_B69CAF:
	LDY active_kong_sprite			;$B69CAF  \
	LDA $0012,y				;$B69CB2   |
	BIT #$4000				;$B69CB5   |
	BNE CODE_B69CAA				;$B69CB8   |
CODE_B69CBA:					;	   |
	LDA #$FC00				;$B69CBA   |
CODE_B69CBD:					;	   |
	STA $20,x				;$B69CBD   |
	LDA #$F610				;$B69CBF   |
	STA $24,x				;$B69CC2   |
	STZ $26,x				;$B69CC4   |
	LDA #$1000				;$B69CC6   |
	STA $2A,x				;$B69CC9   |
	LDA $30,x				;$B69CCB   |
	AND #$FFFE				;$B69CCD   |
	STA $30,x				;$B69CD0   |
	SEC					;$B69CD2   |
	RTS					;$B69CD3  /

CODE_B69CD4:
	LDA.l $00072D				;$B69CD4  \
	BNE CODE_B69CEC				;$B69CD8   |
	LDA #$056B				;$B69CDA   |
	JSL queue_sound_effect			;$B69CDD   |
	JSR CODE_B6800D				;$B69CE1   |
	LDX current_sprite			;$B69CE4   |
	JSR CODE_B69E7D				;$B69CE6   |
	BRL CODE_B69BC5				;$B69CE9  /

CODE_B69CEC:
	JSR CODE_B69CF2				;$B69CEC  \
	BRL CODE_B69C24				;$B69CEF  /

CODE_B69CF2:
	LDA #$0768				;$B69CF2  \
	JSL queue_sound_effect			;$B69CF5   |
	LDY $073B				;$B69CF9   |
	BEQ CODE_B69D0E				;$B69CFC   |
	LDX current_sprite			;$B69CFE   |
	PHX					;$B69D00   |
	STY current_sprite			;$B69D01   |
	JSL CODE_BB82B8				;$B69D03   |
	JSL CODE_B3975C				;$B69D07   |
	PLX					;$B69D0B   |
	STX current_sprite			;$B69D0C   |
CODE_B69D0E:					;	   |
	LDA.l $0006A3				;$B69D0E   |
	ORA #$0100				;$B69D12   |
	STA $0006A3				;$B69D15   |
	JSR CODE_B6800D				;$B69D19   |
	STZ $072D				;$B69D1C   |
	LDA level_number			;$B69D1F   |
	CMP #!level_krocodile_kore		;$B69D21   |
	BNE CODE_B69D44				;$B69D24   |
	LDX $0654				;$B69D26   |
	STX alternate_sprite			;$B69D29   |
	LDA $2E,x				;$B69D2B   |
	ORA #$2000				;$B69D2D   |
	STA $2E,x				;$B69D30   |
	LDA #$025A				;$B69D32   |
	JSL CODE_B9D09B				;$B69D35   |
	LDA.l $000656				;$B69D39   |
	STA alternate_sprite			;$B69D3D   |
	LDA #$025B				;$B69D3F   |
	BRA CODE_B69D75				;$B69D42  /

CODE_B69D44:
	LDA.l $000654				;$B69D44  \
	STA alternate_sprite			;$B69D48   |
	LDA.l $000652				;$B69D4A   |
	CMP #$0001				;$B69D4E   |
	BEQ CODE_B69D65				;$B69D51   |
	LDA #$0270				;$B69D53   |
	JSL CODE_B9D09B				;$B69D56   |
	LDA.l $000656				;$B69D5A   |
	STA alternate_sprite			;$B69D5E   |
	LDA #$0271				;$B69D60   |
	BRA CODE_B69D75				;$B69D63  /

CODE_B69D65:
	LDA #$0283				;$B69D65  \
	JSL CODE_B9D09B				;$B69D68   |
	LDA.l $000656				;$B69D6C   |
	STA alternate_sprite			;$B69D70   |
	LDA #$0284				;$B69D72   |
CODE_B69D75:					;	   |
	JSL CODE_B9D09B				;$B69D75   |
	LDX current_sprite			;$B69D79   |
	PHX					;$B69D7B   |
	JSR CODE_B6C0FF				;$B69D7C   |
	PLX					;$B69D7F   |
	STX current_sprite			;$B69D80   |
	LDY $0654				;$B69D82   |
	LDA #boss_command_code_03		;$B69D85   |
	STA $0044,y				;$B69D88   |
	JSR CODE_B6AD9B				;$B69D8B   |
	STZ $0735				;$B69D8E   |
	JSL CODE_BB82B8				;$B69D91   |
	RTS					;$B69D95  /

CODE_B69D96:
	STZ $0652				;$B69D96  \
	LDA #$F780				;$B69D99   |
	STA $24,x				;$B69D9C   |
	LDA #$FC80				;$B69D9E   |
	STA $2A,x				;$B69DA1   |
	STZ $20,x				;$B69DA3   |
	STZ $26,x				;$B69DA5   |
	LDA #CODE_B69DC2			;$B69DA7   |
	STA $44,x				;$B69DAA   |
	LDA #$0001				;$B69DAC   |
	STA $000751				;$B69DAF   |
	LDA #DATA_B68AFB			;$B69DB3   |
	STA $000753				;$B69DB6   |
	LDA #$055A				;$B69DBA   |
	JSL queue_sound_effect			;$B69DBD   |
	RTL					;$B69DC1  /

CODE_B69DC2:
	LDA #$0004				;$B69DC2  \
	JSL CODE_B8CFD4				;$B69DC5   |
	JSL CODE_B8CF7F				;$B69DC9   |
	JSR CODE_B68AAB				;$B69DCD   |
	LDX current_sprite			;$B69DD0   |
	LDA $0A,x				;$B69DD2   |
	CMP #$0060				;$B69DD4   |
	BCS CODE_B69E2F				;$B69DD7   |
	LDA #$0200				;$B69DD9   |
	STA $06,x				;$B69DDC   |
	SEP #$20				;$B69DDE   |
	LDA #$02				;$B69DE0   |
	STA PPU.sub_screen			;$B69DE2   |
	REP #$20				;$B69DE5   |
	LDA #$0028				;$B69DE7   |
	STA $000751				;$B69DEA   |
	LDA #DATA_B68B2B			;$B69DEE   |
	STA $000753				;$B69DF1   |
	LDA #$00C6				;$B69DF5   |
	STA $0A,x				;$B69DF8   |
	LDA #CODE_B69E33			;$B69DFA   |
	STA $44,x				;$B69DFD   |
	LDA #$025C				;$B69DFF   |
	JSL set_sprite_animation		;$B69E02   |
	LDX $0656				;$B69E06   |
	STX alternate_sprite			;$B69E09   |
	LDA #$C000				;$B69E0B   |
	STA $1C,x				;$B69E0E   |
	LDA #$025C				;$B69E10   |
	JSL CODE_B9D09B				;$B69E13   |
	LDX current_sprite			;$B69E17   |
	LDY $0656				;$B69E19   |
	LDA #$0280				;$B69E1C   |
	STA $24,x				;$B69E1F   |
	LDA $12,x				;$B69E21   |
	EOR #$1000				;$B69E23   |
	STA $12,x				;$B69E26   |
	LDA #$077A				;$B69E28   |
	JSL queue_sound_effect			;$B69E2B   |
CODE_B69E2F:					;	   |
	JSR CODE_B68D5D				;$B69E2F   |
	RTS					;$B69E32  /

CODE_B69E33:
	JSL CODE_B8CF7F				;$B69E33  \
	JSR CODE_B68AAB				;$B69E37   |
	LDX current_sprite			;$B69E3A   |
	LDA $0A,x				;$B69E3C   |
	CMP #$0180				;$B69E3E   |
	BCC CODE_B69E79				;$B69E41   |
	LDA.l $0006A5				;$B69E43   |
	ORA #$0200				;$B69E47   |
	STA $0006A5				;$B69E4A   |
	LDY #DATA_FF281C			;$B69E4E   |
	JSL CODE_BB83F5				;$B69E51   |
	LDX alternate_sprite			;$B69E55   |
	LDA #$02BC				;$B69E57   |
	STA $44,x				;$B69E5A   |
	LDX current_sprite			;$B69E5C   |
	PHX					;$B69E5E   |
	LDX $0656				;$B69E5F   |
	STX current_sprite			;$B69E62   |
	JSL CODE_BB82B8				;$B69E64   |
	PLX					;$B69E68   |
	STX current_sprite			;$B69E69   |
	LDA #$9E75				;$B69E6B   |
	STA $44,x				;$B69E6E   |
	LDA #$C000				;$B69E70   |
	STA $1C,x				;$B69E73   |
	PLA					;$B69E75   |
	BRL CODE_B68F33				;$B69E76  /

CODE_B69E79:
	JSR CODE_B68D5D				;$B69E79  \
	RTS					;$B69E7C  /

CODE_B69E7D:
	LDA $2E,x				;$B69E7D  \
	ORA #$0010				;$B69E7F   |
	STA $2E,x				;$B69E82   |
	LDA $20,x				;$B69E84   |
	BPL CODE_B69E8D				;$B69E86   |
	LDA #$0400				;$B69E88   |
	BRA CODE_B69E90				;$B69E8B  /

CODE_B69E8D:
	LDA #$FC00				;$B69E8D  \
CODE_B69E90:					;	   |
	STA $20,x				;$B69E90   |
	LDA #$F610				;$B69E92   |
	STA $24,x				;$B69E95   |
	STZ $26,x				;$B69E97   |
	LDA #$1000				;$B69E99   |
	STA $2A,x				;$B69E9C   |
	LDA #$0007				;$B69E9E   |
	STA $42,x				;$B69EA1   |
	LDA #$0007				;$B69EA3   |
	STA $44,x				;$B69EA6   |
	LDA $30,x				;$B69EA8   |
	AND #$FFFE				;$B69EAA   |
	STA $30,x				;$B69EAD   |
	RTS					;$B69EAF  /

CODE_B69EB0:
	LDX current_sprite			;$B69EB0  \
	JSR CODE_B69E7D				;$B69EB2   |
	LDX $6A					;$B69EB5   |
	LDA $2E,x				;$B69EB7   |
	ORA #$0020				;$B69EB9   |
	STA $2E,x				;$B69EBC   |
	JSR CODE_B69E7D				;$B69EBE   |
	LDA $24,x				;$B69EC1   |
	SEC					;$B69EC3   |
	ROR A					;$B69EC4   |
	CLC					;$B69EC5   |
	ADC $24,x				;$B69EC6   |
	STA $24,x				;$B69EC8   |
	LDY current_sprite			;$B69ECA   |
	LDA $0006,y				;$B69ECC   |
	CMP $06,x				;$B69ECF   |
	BCS CODE_B69EDE				;$B69ED1   |
	LDA #$FC00				;$B69ED3   |
	STA $0020,y				;$B69ED6   |
	LDA #$0400				;$B69ED9   |
	BRA CODE_B69EE7				;$B69EDC  /

CODE_B69EDE:
	LDA #$0400				;$B69EDE  \
	STA $0020,y				;$B69EE1   |
	LDA #$FC00				;$B69EE4   |
CODE_B69EE7:					;	   |
	STA $20,x				;$B69EE7   |
	RTS					;$B69EE9  /

CODE_B69EEA:
	PHB					;$B69EEA  \
	PHK					;$B69EEB   |
	PLB					;$B69EEC   |
	LDA.l $0006A3				;$B69EED   |
	BIT #$0100				;$B69EF1   |
	BEQ CODE_B69F06				;$B69EF4   |
	JSR CODE_B6AD9B				;$B69EF6   |
	STZ $0735				;$B69EF9   |
	JSL CODE_BB82B8				;$B69EFC   |
	JSR CODE_B6AD29				;$B69F00   |
	BRL CODE_B6A18F				;$B69F03  /

CODE_B69F06:
	LDX current_sprite			;$B69F06  \
	LDA $2E,x				;$B69F08   |
	BIT #$0020				;$B69F0A   |
	BEQ CODE_B69F12				;$B69F0D   |
	BRL CODE_B6A27A				;$B69F0F  /

CODE_B69F12:
	CPX $0D7A				;$B69F12  \
	BNE CODE_B69F1A				;$B69F15   |
	BRL CODE_B6A1BC				;$B69F17  /

CODE_B69F1A:
	LDA $2E,x				;$B69F1A  \
	BIT #$1C00				;$B69F1C   |
	BNE CODE_B69F24				;$B69F1F   |
	BRL CODE_B69F96				;$B69F21  /

CODE_B69F24:
	JSL CODE_BCFB58				;$B69F24  \
	LDA #$0010				;$B69F28   |
	PHK					;$B69F2B   |
	%return(CODE_B69F32)			;$B69F2C   |
	JML [$09F9]				;$B69F2F  /

CODE_B69F32:
	BCC CODE_B69F6E				;$B69F32  \
	LDX current_sprite			;$B69F34   |
	LDA level_number			;$B69F36   |
	CMP #!level_krocodile_kore		;$B69F38   |
	BEQ CODE_B69F89				;$B69F3B   |
	LDA $2E,x				;$B69F3D   |
	BIT #$0400				;$B69F3F   |
	BEQ CODE_B69F71				;$B69F42   |
	LDA #$0024				;$B69F44   |
	JSL CODE_B8D8BA				;$B69F47   |
	BCS CODE_B69F6E				;$B69F4B   |
	LDA #$0013				;$B69F4D   |
	STA $0A86				;$B69F50   |
	LDA $0D7A				;$B69F53   |
	BEQ CODE_B69F67				;$B69F56   |
	JSR CODE_B6AD9B				;$B69F58   |
	BCC CODE_B69F67				;$B69F5B   |
	LDX current_sprite			;$B69F5D   |
	JSR CODE_B6A3A1				;$B69F5F   |
	LDA #$000B				;$B69F62   |
	STA $44,x				;$B69F65   |
CODE_B69F67:					;	   |
	JSL CODE_BB82B8				;$B69F67   |
	BRL CODE_B6A18F				;$B69F6B  /

CODE_B69F6E:
	BRL CODE_B69FFC				;$B69F6E  /

CODE_B69F71:
	BIT #$0800				;$B69F71  \
	BEQ CODE_B69F89				;$B69F74   |
	LDA $0919				;$B69F76   |
	BNE CODE_B69F67				;$B69F79   |
	EOR #$0002				;$B69F7B   |
	STA $0919				;$B69F7E   |
	LDA #$0100				;$B69F81   |
	STA $0925				;$B69F84   |
	BRA CODE_B69F67				;$B69F87  /

CODE_B69F89:
	LDA $0919				;$B69F89  \
	BNE CODE_B69F67				;$B69F8C   |
	EOR #$0001				;$B69F8E   |
	STA $0919				;$B69F91   |
	BRA CODE_B69F67				;$B69F94  /

CODE_B69F96:
	BIT #$0080				;$B69F96  \
	BNE CODE_B69F9E				;$B69F99   |
	BRL CODE_B69FFE				;$B69F9B  /

CODE_B69F9E:
	JSL CODE_BCFB58				;$B69F9E  \
	LDA.l $000735				;$B69FA2   |
	CMP current_sprite			;$B69FA6   |
	BNE CODE_B69FAF				;$B69FA8   |
	LDA #$0C18				;$B69FAA   |
	BRA CODE_B69FB2				;$B69FAD  /

CODE_B69FAF:
	LDA #$0000				;$B69FAF  \
CODE_B69FB2:					;	   |
	JSL CODE_B6CF65				;$B69FB2   |
	BCC CODE_B69FFC				;$B69FB6   |
	BEQ CODE_B69FBF				;$B69FB8   |
	CMP #$0002				;$B69FBA   |
	BNE CODE_B69FFC				;$B69FBD   |
CODE_B69FBF:					;	   |
	LDA #$001E				;$B69FBF   |
	LDY #$FF00				;$B69FC2   |
	JSL CODE_B3A600				;$B69FC5   |
	JSL CODE_B3975C				;$B69FC9   |
	LDA #$0280				;$B69FCD   |
	JSL set_sprite_animation		;$B69FD0   |
	LDX current_sprite			;$B69FD4   |
	LDA #$0009				;$B69FD6   |
	JSL CODE_BB8C44				;$B69FD9   |
	LDX current_sprite			;$B69FDD   |
	JSR CODE_B6A3A1				;$B69FDF   |
	STZ $42,x				;$B69FE2   |
	LDA #$000B				;$B69FE4   |
	STA $44,x				;$B69FE7   |
	LDA $2E,x				;$B69FE9   |
	AND #$E17C				;$B69FEB   |
	STA $2E,x				;$B69FEE   |
	LDA $06,x				;$B69FF0   |
	CMP #$028A				;$B69FF2   |
	BCC CODE_B69FFC				;$B69FF5   |
	LDA #$0289				;$B69FF7   |
	STA $06,x				;$B69FFA   |
CODE_B69FFC:					;	   |
	LDX current_sprite			;$B69FFC   |
CODE_B69FFE:					;	   |
	CPX $0D7A				;$B69FFE   |
	BEQ CODE_B6A045				;$B6A001   |
	LDA $2E,x				;$B6A003   |
	BIT #$0001				;$B6A005   |
	BEQ CODE_B6A00D				;$B6A008   |
	BRL CODE_B6A280				;$B6A00A  /

CODE_B6A00D:
	BIT #$0002				;$B6A00D  \
	BEQ CODE_B6A015				;$B6A010   |
	BRL CODE_B6A2A5				;$B6A012  /

CODE_B6A015:
	BIT #$0200				;$B6A015  \
	BEQ CODE_B6A01D				;$B6A018   |
	BRL CODE_B6A2E2				;$B6A01A  /

CODE_B6A01D:
	BIT #$0400				;$B6A01D  \
	BEQ CODE_B6A025				;$B6A020   |
	BRL CODE_B6A280				;$B6A022  /

CODE_B6A025:
	BIT #$0800				;$B6A025  \
	BEQ CODE_B6A02D				;$B6A028   |
	BRL CODE_B6A2A5				;$B6A02A  /

CODE_B6A02D:
	BIT #$1000				;$B6A02D  \
	BEQ CODE_B6A035				;$B6A030   |
	BRL CODE_B6A2E2				;$B6A032  /

CODE_B6A035:
	BIT #$4000				;$B6A035  \
	BEQ CODE_B6A03D				;$B6A038   |
if !version == 0				;	   |
	BRL CODE_B6A390				;$B6A03A   |
else						;	   |
	BRL CODE_B6A378				;$B6A03A   |
endif						;	  /

CODE_B6A03D:
	BIT #$0080				;$B6A03D  \
	BEQ CODE_B6A045				;$B6A040   |
	BRL CODE_B6A0C5				;$B6A042  /

CODE_B6A045:
	LDA $2E,x				;$B6A045  \
	BIT #$0010				;$B6A047   |
	BNE CODE_B6A0C5				;$B6A04A   |
	JSL CODE_BCFB58				;$B6A04C   |
	LDA #$0020				;$B6A050   |
	JSL CODE_BCFE0A				;$B6A053   |
	BCC CODE_B6A0B2				;$B6A057   |
	LDY $6A					;$B6A059   |
	LDA $0000,y				;$B6A05B   |
	CMP #$0268				;$B6A05E   |
	BNE CODE_B6A076				;$B6A061   |
	LDY $0654				;$B6A063   |
	LDA $001C,y				;$B6A066   |
	AND #$C000				;$B6A069   |
	BNE CODE_B6A071				;$B6A06C   |
	BRL CODE_B6A3B0				;$B6A06E  /

CODE_B6A071:
	LDY $6A					;$B6A071  \
	LDA $0000,y				;$B6A073   |
CODE_B6A076:					;	   |
	CMP #$0264				;$B6A076   |
	BNE CODE_B6A09D				;$B6A079   |
if !version == 0				;	   |
	LDA #$056B				;$B6A07B   |
	JSL queue_sound_effect			;$B6A07E   |
	JSR CODE_B6800D				;$B6A082   |
	LDY $0654				;$B6A085   |
	LDA $001C,y				;$B6A088   |
	AND #$C000				;$B6A08A   |
	BNE CODE_B6A098				;$B6A08D   |
else						;	   |
	LDY $0654				;$B6A07B   |
	LDA $001C,y				;$B6A07E   |
	AND #$C000				;$B6A081   |
	BNE CODE_B6A098				;$B6A084   |
	LDA #$056B				;$B6A086   |
	JSL queue_sound_effect			;$B6A089   |
	JSR CODE_B6800D				;$B6A08D   |
endif						;	   |
	LDX current_sprite			;$B6A090   |
	JSR CODE_B69E7D				;$B6A092   |
	BRL CODE_B6A130				;$B6A095  /

CODE_B6A098:
	LDY $6A					;$B6A098  \
	LDA $0000,y				;$B6A09A   |
CODE_B6A09D:					;	   |
	CMP #$02A0				;$B6A09D   |
	BNE CODE_B6A0B2				;$B6A0A0   |
	LDA $002E,y				;$B6A0A2   |
	BIT #$0040				;$B6A0A5   |
	BNE CODE_B6A0B2				;$B6A0A8   |
	JSR CODE_B69EB0				;$B6A0AA   |
	LDX current_sprite			;$B6A0AD   |
	BRL CODE_B6A130				;$B6A0AF  /

CODE_B6A0B2:
	CPX $0D7A				;$B6A0B2  \
	BNE CODE_B6A0BA				;$B6A0B5   |
	BRL CODE_B6A1BC				;$B6A0B7  /

CODE_B6A0BA:
	LDX current_sprite			;$B6A0BA  \
	LDA $2E,x				;$B6A0BC   |
	BIT #$0008				;$B6A0BE   |
	BNE CODE_B6A0C5				;$B6A0C1   |
	STZ $26,x				;$B6A0C3   |
CODE_B6A0C5:					;	   |
	LDA $1E,x				;$B6A0C5   |
	BIT #$0001				;$B6A0C7   |
	BEQ CODE_B6A0FF				;$B6A0CA   |
	LDA $2E,x				;$B6A0CC   |
	BIT #$0008				;$B6A0CE   |
	BEQ CODE_B6A0D9				;$B6A0D1   |
	STZ $24,x				;$B6A0D3   |
	STZ $2A,x				;$B6A0D5   |
	BRA CODE_B6A0FF				;$B6A0D7  /

CODE_B6A0D9:
	LDA $24,x				;$B6A0D9  \
	CMP #$02FF				;$B6A0DB   |
	BCC CODE_B6A109				;$B6A0DE   |
	EOR #$FFFF				;$B6A0E0   |
	INC A					;$B6A0E3   |
	STA $24,x				;$B6A0E4   |
	LDA #$0600				;$B6A0E6   |
	STA $2A,x				;$B6A0E9   |
	LDA #$0009				;$B6A0EB   |
	STA $42,x				;$B6A0EE   |
	LDA #$0009				;$B6A0F0   |
	STA $44,x				;$B6A0F3   |
	LDA $2E,x				;$B6A0F5   |
	ORA #$0048				;$B6A0F7   |
	AND #$FF7F				;$B6A0FA   |
	STA $2E,x				;$B6A0FD   |
CODE_B6A0FF:					;	   |
	LDA $1E,x				;$B6A0FF   |
	AND #$0101				;$B6A101   |
	CMP #$0101				;$B6A104   |
	BNE CODE_B6A122				;$B6A107   |
CODE_B6A109:					;	   |
	STZ $24,x				;$B6A109   |
	STZ $2A,x				;$B6A10B   |
	STZ $26,x				;$B6A10D   |
	LDA $2E,x				;$B6A10F   |
	AND #$FFF7				;$B6A111   |
	ORA #$0004				;$B6A114   |
	STA $2E,x				;$B6A117   |
	LDA #$000A				;$B6A119   |
	STA $42,x				;$B6A11C   |
	LDX current_sprite			;$B6A11E   |
	BRA CODE_B6A130				;$B6A120  /

CODE_B6A122:
	CMP #$0001				;$B6A122  \
	BNE CODE_B6A130				;$B6A125   |
	LDA #$056B				;$B6A127   |
	JSL queue_sound_effect			;$B6A12A   |
	LDX current_sprite			;$B6A12E   |
CODE_B6A130:					;	   |
	LDA $2E,x				;$B6A130   |
	BIT #$0080				;$B6A132   |
	BEQ CODE_B6A13F				;$B6A135   |
	LDA $46,x				;$B6A137   |
	BEQ CODE_B6A13F				;$B6A139   |
	DEC $46,x				;$B6A13B   |
	BRA CODE_B6A14D				;$B6A13D  /

CODE_B6A13F:
	LDA $42,x				;$B6A13F  \
	JSL CODE_B8D010				;$B6A141   |
	LDX current_sprite			;$B6A145   |
	LDA $44,x				;$B6A147   |
	JSL CODE_B8CFD4				;$B6A149   |
CODE_B6A14D:					;	   |
	LDX current_sprite			;$B6A14D   |
	LDA $2E,x				;$B6A14F   |
	BIT #$0100				;$B6A151   |
	BEQ CODE_B6A162				;$B6A154   |
	JSL CODE_B8CF7F				;$B6A156   |
	JSR CODE_B69C87				;$B6A15A   |
	BCC CODE_B6A166				;$B6A15D   |
	BRL CODE_B6A18F				;$B6A15F  /

CODE_B6A162:
	JSL CODE_B8D5E0				;$B6A162  \
CODE_B6A166:					;	   |
	LDA $20,x				;$B6A166   |
	BNE CODE_B6A178				;$B6A168   |
	STZ $04,x				;$B6A16A   |
	LDA $2E,x				;$B6A16C   |
	BIT #$0040				;$B6A16E   |
	BEQ CODE_B6A178				;$B6A171   |
	LDX current_sprite			;$B6A173   |
	BRL CODE_B6A193				;$B6A175  /

CODE_B6A178:
	JSL CODE_B9D100				;$B6A178  \
CODE_B6A17C:					;	   |
	LDX current_sprite			;$B6A17C   |
	LDY #$0000				;$B6A17E   |
	LDA.l $0006A3				;$B6A181   |
	BIT #$0080				;$B6A185   |
	BNE CODE_B6A18D				;$B6A188   |
	LDY #$C000				;$B6A18A   |
CODE_B6A18D:					;	   |
	STY $1C,x				;$B6A18D   |
CODE_B6A18F:					;	   |
	PLB					;$B6A18F   |
	JML [$05A9]				;$B6A190  /

CODE_B6A193:
	LDA $30,x				;$B6A193  \
	ORA #$0001				;$B6A195   |
	STA $30,x				;$B6A198   |
	LDA $0D7A				;$B6A19A   |
	CMP current_sprite			;$B6A19D   |
	BEQ CODE_B6A1BC				;$B6A19F   |
	LDA $2E,x				;$B6A1A1   |
	ORA #$0010				;$B6A1A3   |
	STA $2E,x				;$B6A1A6   |
	LDA $32,x				;$B6A1A8   |
	BEQ CODE_B6A17C				;$B6A1AA   |
	STZ $32,x				;$B6A1AC   |
	CMP #$0001				;$B6A1AE   |
	BNE CODE_B6A17C				;$B6A1B1   |
	LDA #$FFFC				;$B6A1B3   |
	AND $30,x				;$B6A1B6   |
	STA $30,x				;$B6A1B8   |
	BRA CODE_B6A17C				;$B6A1BA  /

CODE_B6A1BC:
	JSR CODE_B6A1C2				;$B6A1BC  \
	BRL CODE_B6A17C				;$B6A1BF  /

CODE_B6A1C2:					;	  \
if !version == 1				;	   |
	LDX current_sprite			;$B6A1C2   |
	LDA $2E,x				;$B6A1C4   |
	AND #$FFF7				;$B6A1C6   |
	STA $2E,x				;$B6A1C9   |
endif						;	   |
	JSL CODE_BCFB58				;$B6A1CB   |
	LDA #$0020				;$B6A1CF   |
	JSL CODE_BCFE0A				;$B6A1D2   |
	BCC CODE_B6A1F7				;$B6A1D6   |
	LDY $6A					;$B6A1D8   |
	LDA $0000,y				;$B6A1DA   |
	CMP #$0270				;$B6A1DD   |
	BNE CODE_B6A1F7				;$B6A1E0   |
	LDY $6A					;$B6A1E2   |
	LDA $002E,y				;$B6A1E4   |
	BIT #$0080				;$B6A1E7   |
	BEQ CODE_B6A1F7				;$B6A1EA   |
	STZ $0D7A				;$B6A1EC   |
	JSR CODE_B69EB0				;$B6A1EF   |
	LDX current_sprite			;$B6A1F2   |
	BRL CODE_B6A24E				;$B6A1F4  /

CODE_B6A1F7:
	CMP #$02A0				;$B6A1F7  \
	BNE CODE_B6A211				;$B6A1FA   |
	LDY $6A					;$B6A1FC   |
	LDA $002E,y				;$B6A1FE   |
	BIT #$0080				;$B6A201   |
	BEQ CODE_B6A211				;$B6A204   |
	STZ $0D7A				;$B6A206   |
	JSR CODE_B69EB0				;$B6A209   |
	LDX current_sprite			;$B6A20C   |
	BRL CODE_B6A24E				;$B6A20E  /

CODE_B6A211:
	LDX current_sprite			;$B6A211  \
	LDA $2E,x				;$B6A213   |
	AND #$FFBF				;$B6A215   |
	STA $2E,x				;$B6A218   |
	LDA $32,x				;$B6A21A   |
	BEQ CODE_B6A241				;$B6A21C   |
	STZ $32,x				;$B6A21E   |
	CMP #$0001				;$B6A220   |
	BEQ CODE_B6A24F				;$B6A223   |
	CMP #$0002				;$B6A225   |
	BEQ CODE_B6A258				;$B6A228   |
	CMP #$0004				;$B6A22A   |
	BEQ CODE_B6A258				;$B6A22D   |
	CMP #$0006				;$B6A22F   |
	BEQ CODE_B6A258				;$B6A232   |
	CMP #$0005				;$B6A234   |
	BEQ CODE_B6A258				;$B6A237   |
	STZ $0D7A				;$B6A239   |
	JSR CODE_B69C9F				;$B6A23C   |
	BCS CODE_B6A24E				;$B6A23F   |
CODE_B6A241:					;	   |
	JSL CODE_B3A003				;$B6A241   |
	LDX current_sprite			;$B6A245   |
	LDA $2E,x				;$B6A247   |
	AND #$FFEF				;$B6A249   |
	STA $2E,x				;$B6A24C   |
CODE_B6A24E:					;	   |
	RTS					;$B6A24E  /

CODE_B6A24F:
	LDA $30,x				;$B6A24F  \
	ORA #$0001				;$B6A251   |
	STA $30,x				;$B6A254   |
	BRA CODE_B6A24E				;$B6A256  /

CODE_B6A258:
	LDA $2E,x				;$B6A258  \
	ORA #$0004				;$B6A25A   |
	STA $2E,x				;$B6A25D   |
	LDA $30,x				;$B6A25F   |
	AND #$FFFE				;$B6A261   |
	STA $30,x				;$B6A264   |
	LDA #$0006				;$B6A266   |
	STA $44,x				;$B6A269   |
	LDA #$0009				;$B6A26B   |
	STA $42,x				;$B6A26E   |
	STZ $26,x				;$B6A270   |
	LDA #$0900				;$B6A272   |
	STA $2A,x				;$B6A275   |
	BRL CODE_B6A24E				;$B6A277  /

CODE_B6A27A:
	JSR CODE_B69C70				;$B6A27A  \
	BRL CODE_B6A178				;$B6A27D  /

CODE_B6A280:
	LDA $42,x				;$B6A280  \
	JSL CODE_B8D010				;$B6A282   |
	LDX current_sprite			;$B6A286   |
	LDA $44,x				;$B6A288   |
	JSL CODE_B8CFD4				;$B6A28A   |
	JSL CODE_B8CF7F				;$B6A28E   |
	JSR CODE_B69C87				;$B6A292   |
	BCC CODE_B6A2A2				;$B6A295   |
	LDA current_sprite			;$B6A297   |
	CMP $000735				;$B6A299   |
	BNE CODE_B6A2A2				;$B6A29D   |
	STZ $0735				;$B6A29F   |
CODE_B6A2A2:					;	   |
	BRL CODE_B6A178				;$B6A2A2  /

CODE_B6A2A5:
	LDA $0A,x				;$B6A2A5  \
	CMP #$01C1				;$B6A2A7   |
	BCC CODE_B6A2BD				;$B6A2AA   |
	LDA #$056B				;$B6A2AC   |
	JSL queue_sound_effect			;$B6A2AF   |
	LDX current_sprite			;$B6A2B3   |
	LDA $46,x				;$B6A2B5   |
	STA $24,x				;$B6A2B7   |
	LDA $48,x				;$B6A2B9   |
	STA $2A,x				;$B6A2BB   |
CODE_B6A2BD:					;	   |
	LDA $42,x				;$B6A2BD   |
	JSL CODE_B8D010				;$B6A2BF   |
	LDX current_sprite			;$B6A2C3   |
	LDA $44,x				;$B6A2C5   |
	JSL CODE_B8CFD4				;$B6A2C7   |
	JSL CODE_B8CF7F				;$B6A2CB   |
	JSR CODE_B69C87				;$B6A2CF   |
	BCC CODE_B6A2DF				;$B6A2D2   |
	LDA current_sprite			;$B6A2D4   |
	CMP $000735				;$B6A2D6   |
	BNE CODE_B6A2DF				;$B6A2DA   |
	STZ $0735				;$B6A2DC   |
CODE_B6A2DF:					;	   |
	BRL CODE_B6A178				;$B6A2DF  /

CODE_B6A2E2:
	LDA $22,x				;$B6A2E2  \
	STA $06,x				;$B6A2E4   |
	LDA $28,x				;$B6A2E6   |
	STA $0A,x				;$B6A2E8   |
	LDA $4A,x				;$B6A2EA   |
	AND #$00FF				;$B6A2EC   |
	JSL CODE_B8D010				;$B6A2EF   |
	LDX current_sprite			;$B6A2F3   |
	LDA $4A,x				;$B6A2F5   |
	XBA					;$B6A2F7   |
	AND #$00FF				;$B6A2F8   |
	JSL CODE_B8CFD4				;$B6A2FB   |
	JSL CODE_B8CF7F				;$B6A2FF   |
	LDX current_sprite			;$B6A303   |
	LDA $06,x				;$B6A305   |
	CMP #$02C0				;$B6A307   |
	BCC CODE_B6A312				;$B6A30A   |
	JSL CODE_BB82B8				;$B6A30C   |
	BRA CODE_B6A317				;$B6A310  /

CODE_B6A312:
	JSR CODE_B69C87				;$B6A312  \
	BCC CODE_B6A33E				;$B6A315   |
CODE_B6A317:					;	   |
	LDA.l $000735				;$B6A317   |
	CMP current_sprite			;$B6A31B   |
	BNE CODE_B6A329				;$B6A31D   |
	LDA #$0652				;$B6A31F   |
	CLC					;$B6A322   |
	JSL CODE_B3814F				;$B6A323   |
	BRA CODE_B6A331				;$B6A327  /

CODE_B6A329:
	LDA #$076A				;$B6A329  \
	CLC					;$B6A32C   |
	JSL CODE_B3814F				;$B6A32D   |
CODE_B6A331:					;	   |
	LDA current_sprite			;$B6A331   |
	CMP $000735				;$B6A333   |
	BNE CODE_B6A375				;$B6A337   |
	STZ $0735				;$B6A339   |
	BRA CODE_B6A375				;$B6A33C  /

CODE_B6A33E:
	LDA.l $000735				;$B6A33E  \
	CMP current_sprite			;$B6A342   |
	BNE CODE_B6A350				;$B6A344   |
	LDA #$0652				;$B6A346   |
	SEC					;$B6A349   |
	JSL CODE_B3814F				;$B6A34A   |
	BRA CODE_B6A358				;$B6A34E  /

CODE_B6A350:
	LDA #$076A				;$B6A350  \
	SEC					;$B6A353   |
	JSL CODE_B3814F				;$B6A354   |
CODE_B6A358:					;	   |
	LDX current_sprite			;$B6A358   |
	LDA $06,x				;$B6A35A   |
	STA $22,x				;$B6A35C   |
	STA $42,x				;$B6A35E   |
	LDA $0A,x				;$B6A360   |
	STA $28,x				;$B6A362   |
	STA $44,x				;$B6A364   |
	LDA $46,x				;$B6A366   |
	PHA					;$B6A368   |
	JSL CODE_BEF039				;$B6A369   |
	LDX current_sprite			;$B6A36D   |
	PLA					;$B6A36F   |
	CLC					;$B6A370   |
	ADC $4C,x				;$B6A371   |
	STA $46,x				;$B6A373   |
CODE_B6A375:					;	   |
	BRL CODE_B6A178				;$B6A375  /

if !version == 0				;	  \
	LDA $46,x				;$B6A378   |
	BEQ CODE_B6A3E5				;$B6A37A   |
	DEC $46,x				;$B6A37C   |
	BEQ CODE_B6A37A				;$B6A37E   |
	BRL CODE_B6A401				;$B6A380   |
						;	   |
CODE_B6A37A:					;$B6A383   |
	LDY active_kong_sprite			;$B6A386   |
	LDA $0006,y				;$B6A389   |
	CMP $06,x				;$B6A38C   |
	BCS CODE_B6A399				;$B6A38E   |
	LDA $06,x				;$B6A390   |
	SEC					;$B6A392   |
	SBC $0006,y				;$B6A393   |
	CMP #$0040				;$B6A396   |
	BCS CODE_B6A394				;$B6A399   |
	LDA #$0900				;$B6A39B   |
	BRA CODE_B6A3A4				;$B6A39E   |
						;	   |
CODE_B6A394:					;	   |
	LDA #$F700				;$B6A3A0   |
	BRA CODE_B6A3D2				;$B6A3A3   |
						;	   |
CODE_B6A399:					;	   |
	SEC					;$B6A3A5   |
	SBC $06,x				;$B6A3A6   |
	CMP #$0040				;$B6A3A8   |
	BCS CODE_B6A3CF				;$B6A3AB   |
	LDA #$0900				;$B6A3AD   |
						;	   |
CODE_B6A3A4:					;	   |
	STA $2A,x				;$B6A3B0   |
	STZ $24,x				;$B6A3B2   |
	LDA $2E,x				;$B6A3B4   |
	ORA #$2000				;$B6A3B6   |
	STA $2E,x				;$B6A3B9   |
	LDA #$000E				;$B6A3BB   |
	STA $42,x				;$B6A3BE   |
	LDA #$0009				;$B6A3C0   |
	STA $44,x				;$B6A3C3   |
						;	   |
CODE_B6A3B9:					;	   |
	LDY active_kong_sprite			;$B6A3C5   |
	LDA $0006,y				;$B6A3C8   |
	CMP $06,x				;$B6A3CB   |
	BCS CODE_B6A3C8_0			;$B6A3CD   |
	LDA #$FA00				;$B6A3D0   |
	BRA CODE_B6A3CB				;$B6A3D3   |
						;	   |
CODE_B6A3C8_0:					;	   |
	LDA #$0600				;$B6A3D5   |
						;	   |
CODE_B6A3CB:					;	   |
	STA $26,x				;$B6A3D8   |
	BRA CODE_B6A378				;$B6A3DA   |
						;	   |
CODE_B6A3CF:					;	   |
	LDA #$0900				;$B6A3DC   |
						;	   |
CODE_B6A3D2:					;	   |
	STA $26,x				;$B6A3DF   |
	LDA $2E,x				;$B6A3E1   |
	AND #$DFFF				;$B6A3E3   |
	STA $2E,x				;$B6A3E6   |
	LDA #$0009				;$B6A3E8   |
	STA $42,x				;$B6A3EB   |
	LDA #$000E				;$B6A3ED   |
	STA $44,x				;$B6A3F0   |
						;	   |
CODE_B6A3E5:					;	   |
	LDA $2E,x				;$B6A3F2   |
	BIT #$2000				;$B6A3F4   |
	BNE CODE_B6A3B9				;$B6A3F7   |
	LDY active_kong_sprite			;$B6A3F9   |
	LDA $000A,y				;$B6A3FC   |
	CMP $0A,x				;$B6A3FF   |
	BCS CODE_B6A3FB				;$B6A401   |
	LDA #$FA00				;$B6A403   |
	BRA CODE_B6A3FE				;$B6A406   |
						;	   |
CODE_B6A3FB:					;	   |
	LDA #$0600				;$B6A408   |
						;	   |
CODE_B6A3FE:					;	   |
	STA $2A,x				;$B6A40B   |
	BRA CODE_B6A378				;$B6A40D   |
						;	   |
CODE_B6A401:					;	   |
	LDA $20,x				;$B6A40F   |
	BMI CODE_B6A40D				;$B6A411   |
	CMP #$0200				;$B6A413   |
	BCC CODE_B6A412				;$B6A416   |
	BRA CODE_B6A378				;$B6A418   |
						;	   |
CODE_B6A40D:					;	   |
	CMP #$FE00				;$B6A41A   |
	BCC CODE_B6A378				;$B6A41D   |
						;	   |
CODE_B6A412:					;	   |
	LDA #$FF40				;$B6A41F   |
	STA $2A,x				;$B6A422   |
endif						;	  /

CODE_B6A378:
	LDA $42,x				;$B6A378  \
	JSL CODE_B8D010				;$B6A37A   |
	LDX current_sprite			;$B6A37E   |
	LDA $44,x				;$B6A380   |
	JSL CODE_B8CFD4				;$B6A382   |
	JSL CODE_B8CF7F				;$B6A386   |
	JSR CODE_B69C87				;$B6A38A   |
if !version == 0				;	   |
	BRL CODE_B6A178				;$B6A38D   |
CODE_B6A390:
	LDA $42,x				;$B6A390   |
	JSL CODE_B8D010				;$B6A392   |
	LDX current_sprite			;$B6A396   |
	LDA $44,x				;$B6A398   |
	JSL CODE_B8CFD4				;$B6A39A   |
	JSL CODE_B8CF7F				;$B6A39E   |
	JSR CODE_B69C87				;$B6A3A2   |
endif						;	   |
	BCC CODE_B6A39A				;$B6A38D   |
	LDA current_sprite			;$B6A38F   |
	CMP $000735				;$B6A391   |
	BNE CODE_B6A39A				;$B6A395   |
	STZ $0735				;$B6A397   |
CODE_B6A39A:					;	   |
	JSL CODE_B9D100				;$B6A39A   |
	BRL CODE_B6A18F				;$B6A39E  /

CODE_B6A3A1:
	STZ $20,x				;$B6A3A1  \
	STZ $26,x				;$B6A3A3   |
	LDA #$0900				;$B6A3A5   |
	STA $2A,x				;$B6A3A8   |
	LDA #$0100				;$B6A3AA   |
	STA $24,x				;$B6A3AD   |
	RTS					;$B6A3AF  /

CODE_B6A3B0:
	LDA.l $00072D				;$B6A3B0  \
	BNE CODE_B6A3C8				;$B6A3B4   |
	LDA #$056B				;$B6A3B6   |
	JSL queue_sound_effect			;$B6A3B9   |
	JSR CODE_B6800D				;$B6A3BD   |
	LDX current_sprite			;$B6A3C0   |
	JSR CODE_B69E7D				;$B6A3C2   |
	BRL CODE_B6A130				;$B6A3C5  /

CODE_B6A3C8:
	JSR CODE_B69CF2				;$B6A3C8  \
	BRL CODE_B6A17C				;$B6A3CB  /

CODE_B6A3CE:
	LDA $2E,x				;$B6A3CE  \
	AND #$FFFE				;$B6A3D0   |
	STA $2E,x				;$B6A3D3   |
	RTL					;$B6A3D5  /

CODE_B6A3D6:
	JSL CODE_B9D100				;$B6A3D6  \
	JML [$05A9]				;$B6A3DA  /

CODE_B6A3DD:
	LDA.l $0006A3				;$B6A3DD  \
	BIT #$4000				;$B6A3E1   |
	BEQ CODE_B6A3ED				;$B6A3E4   |
	JSL CODE_BB82B8				;$B6A3E6   |
	JML [$05A9]				;$B6A3EA  /

CODE_B6A3ED:
	JSL CODE_B9D100				;$B6A3ED  \
	JML [$05A9]				;$B6A3F1  /

CODE_B6A3F4:
	LDA.l $00075F				;$B6A3F4  \
	STA alternate_sprite			;$B6A3F8   |
	LDA #$0247				;$B6A3FA   |
	JSL CODE_B9D09B				;$B6A3FD   |
	LDA.l $00075B				;$B6A401   |
	STA alternate_sprite			;$B6A405   |
	LDA #$0248				;$B6A407   |
	JSL CODE_B9D09B				;$B6A40A   |
	RTL					;$B6A40E  /

CODE_B6A40F:
	JSR CODE_B68F50				;$B6A40F  \
	LDA #$0004				;$B6A412   |
CODE_B6A415:					;	   |
	LDY $075F				;$B6A415   |
	STA $002E,y				;$B6A418   |
	RTL					;$B6A41B  /

CODE_B6A41C:
	LDA #$0002				;$B6A41C  \
	BRA CODE_B6A415				;$B6A41F  /

CODE_B6A421:
	JSR CODE_B68F50				;$B6A421  \
	LDY $075F				;$B6A424   |
	LDA #$0006				;$B6A427   |
	STA $002E,y				;$B6A42A   |
	LDA #$001C				;$B6A42D   |
	JSR CODE_B6A5B0				;$B6A430   |
	RTL					;$B6A433  /

CODE_B6A434:
	JSL CODE_BB82B8				;$B6A434  \
	JML [$05A9]				;$B6A438  /

CODE_B6A43B:
	LDA $08FC				;$B6A43B  \
	BIT #$0003				;$B6A43E   |
	BNE CODE_B6A434				;$B6A441   |
	ORA #$0003				;$B6A443   |
	STA $08FC				;$B6A446   |
	JSL CODE_B4AFAD				;$B6A449   |
	LDX current_sprite			;$B6A44D   |
	LDA #$0288				;$B6A44F   |
	STA $00,x				;$B6A452   |
	LDA $4E,x				;$B6A454   |
	BNE CODE_B6A485				;$B6A456   |
	INC $4E,x				;$B6A458   |
	STX $075F				;$B6A45A   |
	LDY #$011C				;$B6A45D   |
	JSL CODE_BB842C				;$B6A460   |
	LDX alternate_sprite			;$B6A464   |
	STX $075B				;$B6A466   |
	LDA $12,x				;$B6A469   |
	ORA #$4000				;$B6A46B   |
	STA $12,x				;$B6A46E   |
	LDY #$011E				;$B6A470   |
	JSL CODE_BB842C				;$B6A473   |
	LDY alternate_sprite			;$B6A477   |
	STY $075D				;$B6A479   |
	LDA $0012,y				;$B6A47C   |
	ORA #$4000				;$B6A47F   |
	STA $0012,y				;$B6A482   |
CODE_B6A485:					;	   |
	LDX current_sprite			;$B6A485   |
	LDA $2E,x				;$B6A487   |
	BEQ CODE_B6A492				;$B6A489   |
	ASL A					;$B6A48B   |
	TAX					;$B6A48C   |
	PHK					;$B6A48D   |
	PLB					;$B6A48E   |
	JMP (DATA_B6A495,x)			;$B6A48F  /

CODE_B6A492:
	JML [$05A9]				;$B6A492  /

DATA_B6A495:
	dw !null_pointer
	dw CODE_B6A4A9
	dw CODE_B6A536
	dw CODE_B6A56F
	dw CODE_B6A572
	dw CODE_B6A57C
	dw CODE_B6A60D
	dw CODE_B6A66F
	dw CODE_B6A6CE
	dw CODE_B6A6F6

CODE_B6A4A9:
	LDX current_sprite			;$B6A4A9  \
	LDA $44,x				;$B6A4AB   |
	STA $06,x				;$B6A4AD   |
	LDA $46,x				;$B6A4AF   |
	STA $0A,x				;$B6A4B1   |
	LDY $42,x				;$B6A4B3   |
	BEQ CODE_B6A510				;$B6A4B5   |
	JSR CODE_B6D923				;$B6A4B7   |
	LDA $0000,y				;$B6A4BA   |
	AND #$00FF				;$B6A4BD   |
	BIT #$0080				;$B6A4C0   |
	BEQ CODE_B6A4C8				;$B6A4C3   |
	ORA #$FF00				;$B6A4C5   |
CODE_B6A4C8:					;	   |
	STA $000650				;$B6A4C8   |
	LDA $06,x				;$B6A4CC   |
	CLC					;$B6A4CE   |
	ADC $000650				;$B6A4CF   |
	STA $06,x				;$B6A4D3   |
	LDA $0001,y				;$B6A4D5   |
	AND #$00FF				;$B6A4D8   |
	BIT #$0080				;$B6A4DB   |
	BEQ CODE_B6A4E3				;$B6A4DE   |
	ORA #$FF00				;$B6A4E0   |
CODE_B6A4E3:					;	   |
	STA $000650				;$B6A4E3   |
	LDA $0A,x				;$B6A4E7   |
	CLC					;$B6A4E9   |
	ADC $000650				;$B6A4EA   |
	STA $0A,x				;$B6A4EE   |
	LDA $0002,y				;$B6A4F0   |
	AND #$00FF				;$B6A4F3   |
	CMP #$007F				;$B6A4F6   |
	BNE CODE_B6A4FF				;$B6A4F9   |
	STZ $42,x				;$B6A4FB   |
	BRA CODE_B6A510				;$B6A4FD  /

CODE_B6A4FF:
	CMP #$007E				;$B6A4FF  \
	BNE CODE_B6A509				;$B6A502   |
	LDA $0003,y				;$B6A504   |
	BRA CODE_B6A50E				;$B6A507  /

CODE_B6A509:
	TYA					;$B6A509  \
	CLC					;$B6A50A   |
	ADC #$0002				;$B6A50B   |
CODE_B6A50E:					;	   |
	STA $42,x				;$B6A50E   |
CODE_B6A510:					;	   |
	JSR CODE_B6A51B				;$B6A510   |
	JSL CODE_B9D100				;$B6A513   |
	JML [$05A9]				;$B6A517  /

	RTS					;$B6A51A  /

CODE_B6A51B:
	LDX $075F				;$B6A51B  \
	LDY $075B				;$B6A51E   |
	JSR CODE_B68D65				;$B6A521   |
	LDY $075D				;$B6A524   |
	LDA $06,x				;$B6A527   |
	STA $0006,y				;$B6A529   |
	LDA $0A,x				;$B6A52C   |
	SEC					;$B6A52E   |
	SBC #$0048				;$B6A52F   |
	STA $000A,y				;$B6A532   |
	RTS					;$B6A535  /

CODE_B6A536:
	LDX current_sprite			;$B6A536  \
	LDA $24,x				;$B6A538   |
	SEC					;$B6A53A   |
	SBC #$0020				;$B6A53B   |
	STA $24,x				;$B6A53E   |
	JSL CODE_B8CF7F				;$B6A540   |
	LDX current_sprite			;$B6A544   |
	LDA $0A,x				;$B6A546   |
	CMP #$0100				;$B6A548   |
	BCS CODE_B6A56C				;$B6A54B   |
	PHX					;$B6A54D   |
	JSL CODE_BB82B8				;$B6A54E   |
	LDA.l $00075B				;$B6A552   |
	STA current_sprite			;$B6A556   |
	JSL CODE_BB82B8				;$B6A558   |
	LDA.l $00075D				;$B6A55C   |
	STA current_sprite			;$B6A560   |
	JSL CODE_BB82B8				;$B6A562   |
	PLX					;$B6A566   |
	STX current_sprite			;$B6A567   |
	JML [$05A9]				;$B6A569  /

CODE_B6A56C:
	BRL CODE_B6A510				;$B6A56C  /

CODE_B6A56F:
	BRL CODE_B6A510				;$B6A56F  /

CODE_B6A572:
	LDA #$0050				;$B6A572  \
	JSR CODE_B6A5B0				;$B6A575   |
	LDX current_sprite			;$B6A578   |
	INC $2E,x				;$B6A57A   |
CODE_B6A57C:					;	   |
	LDA #$0003				;$B6A57C   |
	JSL CODE_B8CFD4				;$B6A57F   |
	JSL CODE_B8CF7F				;$B6A583   |
	LDX current_sprite			;$B6A587   |
	LDA $0A,x				;$B6A589   |
	CMP #$0195				;$B6A58B   |
	BCC CODE_B6A5A6				;$B6A58E   |
	LDA $24,x				;$B6A590   |
	EOR #$FFFF				;$B6A592   |
	INC A					;$B6A595   |
	STA $24,x				;$B6A596   |
	CMP #$FF00				;$B6A598   |
	BCC CODE_B6A5A6				;$B6A59B   |
	STZ $24,x				;$B6A59D   |
	STZ $2A,x				;$B6A59F   |
	LDA #$0003				;$B6A5A1   |
	STA $2E,x				;$B6A5A4   |
CODE_B6A5A6:					;	   |
	JSR CODE_B6A51B				;$B6A5A6   |
	JSL CODE_B9D100				;$B6A5A9   |
	JML [$05A9]				;$B6A5AD  /

CODE_B6A5B0:
	STA $000650				;$B6A5B0  \
	LDX $075F				;$B6A5B4   |
	LDA #$0400				;$B6A5B7   |
	STA $24,x				;$B6A5BA   |
	LDA #$0600				;$B6A5BC   |
	STA $2A,x				;$B6A5BF   |
	LDY $0654				;$B6A5C1   |
	LDA $0012,y				;$B6A5C4   |
	BIT #$4000				;$B6A5C7   |
	BNE CODE_B6A5F1				;$B6A5CA   |
	LDA $0006,y				;$B6A5CC   |
	CLC					;$B6A5CF   |
	ADC $000650				;$B6A5D0   |
	STA $06,x				;$B6A5D4   |
	LDA $12,x				;$B6A5D6   |
	ORA #$4000				;$B6A5D8   |
	STA $12,x				;$B6A5DB   |
	LDX $075D				;$B6A5DD   |
	LDA $12,x				;$B6A5E0   |
	ORA #$4000				;$B6A5E2   |
	STA $12,x				;$B6A5E5   |
	LDX $075B				;$B6A5E7   |
	LDA $12,x				;$B6A5EA   |
	ORA #$4000				;$B6A5EC   |
	BRA CODE_B6A60A				;$B6A5EF  /

CODE_B6A5F1:
	LDA $0006,y				;$B6A5F1  \
	SEC					;$B6A5F4   |
	SBC $000650				;$B6A5F5   |
	STA $06,x				;$B6A5F9   |
	LDA $12,x				;$B6A5FB   |
	AND #$BFFF				;$B6A5FD   |
	STA $12,x				;$B6A600   |
	LDX $075B				;$B6A602   |
	LDA $12,x				;$B6A605   |
	AND #$BFFF				;$B6A607   |
CODE_B6A60A:					;	   |
	STA $12,x				;$B6A60A   |
	RTS					;$B6A60C  /

CODE_B6A60D:
	LDA #$0003				;$B6A60D  \
	JSL CODE_B8CFD4				;$B6A610   |
	JSL CODE_B8CF7F				;$B6A614   |
	LDX current_sprite			;$B6A618   |
if !version == 1				;	   |
	LDA #$0145				;$B6A61A   |
	CMP $0A,x				;$B6A61D   |
	BCS CODE_B6A665				;$B6A61F   |
else						;	   |
	LDA $0A,x				;$B6A61A   |
	CMP #$0145				;$B6A61C   |
	BCC CODE_B6A665				;$B6A61F   |
endif						;	   |
if !version == 1				;	   |
	STA $0A,x				;$B6A621   |
endif						;	   |
	LDA $24,x				;$B6A623   |
	EOR #$FFFF				;$B6A625   |
	INC A					;$B6A628   |
	CLC					;$B6A629   |
	ADC #$00A0				;$B6A62A   |
	STA $24,x				;$B6A62D   |
	CMP #$FF00				;$B6A62F   |
	BCS CODE_B6A637				;$B6A632   |
	BRL CODE_B6A5A6				;$B6A634  /

CODE_B6A637:
	STZ $24,x				;$B6A637  \
	STZ $2A,x				;$B6A639   |
	INC $2E,x				;$B6A63B   |
	LDA #$0243				;$B6A63D   |
	JSL set_sprite_animation		;$B6A640   |
	LDA.l $00075B				;$B6A644   |
	STA alternate_sprite			;$B6A648   |
	LDA #$0244				;$B6A64A   |
	JSL CODE_B9D09B				;$B6A64D   |
	LDX current_sprite			;$B6A651   |
	LDA #$0140				;$B6A653   |
	STA $3A,x				;$B6A656   |
	LDY $075B				;$B6A658   |
	STA $003A,y				;$B6A65B   |
	LDA #$00AA				;$B6A65E   |
	STA $000747				;$B6A661   |
CODE_B6A665:					;	   |
	JSR CODE_B6A51B				;$B6A665   |
CODE_B6A668:					;	   |
	JSL CODE_B9D100				;$B6A668   |
	JML [$05A9]				;$B6A66C  /

CODE_B6A66F:
	DEC $0747				;$B6A66F  \
	BNE CODE_B6A6B5				;$B6A672   |
	LDX current_sprite			;$B6A674   |
	PHX					;$B6A676   |
	LDA.l $00075B				;$B6A677   |
	STA current_sprite			;$B6A67B   |
	JSL CODE_BB82B8				;$B6A67D   |
	PLX					;$B6A681   |
	STX current_sprite			;$B6A682   |
	STZ $0650				;$B6A684   |
	STZ $0658				;$B6A687   |
	JSR CODE_B6AB5F				;$B6A68A   |
	LDX $075F				;$B6A68D   |
	LDY alternate_sprite			;$B6A690   |
	JSR CODE_B68D65				;$B6A692   |
	LDY alternate_sprite			;$B6A695   |
	LDA $000A,y				;$B6A697   |
	CLC					;$B6A69A   |
	ADC #$FFE0				;$B6A69B   |
	STA $000A,y				;$B6A69E   |
	LDX current_sprite			;$B6A6A1   |
	INC $2E,x				;$B6A6A3   |
	STZ $24,x				;$B6A6A5   |
	LDA #$0800				;$B6A6A7   |
	STA $2A,x				;$B6A6AA   |
	LDA #$0249				;$B6A6AC   |
	JSL set_sprite_animation		;$B6A6AF   |
	BRA CODE_B6A668				;$B6A6B3  /

CODE_B6A6B5:
	LDA.l $000747				;$B6A6B5  \
	CMP #$003C				;$B6A6B9   |
	BNE CODE_B6A6CB				;$B6A6BC   |
	LDX current_sprite			;$B6A6BE   |
	LDA #$0280				;$B6A6C0   |
	STA $3A,x				;$B6A6C3   |
	LDY $075B				;$B6A6C5   |
	STA $003A,y				;$B6A6C8   |
CODE_B6A6CB:					;	   |
	BRL CODE_B6A665				;$B6A6CB  /

CODE_B6A6CE:
	LDA #$0004				;$B6A6CE  \
	JSL CODE_B8CFD4				;$B6A6D1   |
	JSL CODE_B8CF7F				;$B6A6D5   |
	LDX current_sprite			;$B6A6D9   |
	LDA $0A,x				;$B6A6DB   |
	CMP #$01BD				;$B6A6DD   |
	BCC CODE_B6A6EF				;$B6A6E0   |
	STZ $24,x				;$B6A6E2   |
	STZ $2A,x				;$B6A6E4   |
	INC $2E,x				;$B6A6E6   |
	LDA #$024A				;$B6A6E8   |
	JSL set_sprite_animation		;$B6A6EB   |
CODE_B6A6EF:					;	   |
	JSL CODE_B9D100				;$B6A6EF   |
	JML [$05A9]				;$B6A6F3  /

CODE_B6A6F6:
	JSL CODE_B9D100				;$B6A6F6  \
	JML [$05A9]				;$B6A6FA  /

	JSR CODE_B6A701				;$B6A6FD   |
	RTL					;$B6A700  /

CODE_B6A701:
	LDA $0AB8				;$B6A701  \
	AND #$BFFF				;$B6A704   |
	ORA #$8000				;$B6A707   |
	STA $0AB8				;$B6A70A   |
	LDX current_sprite			;$B6A70D   |
	LDY active_kong_sprite			;$B6A70F   |
	LDA $0006,y				;$B6A712   |
	CMP $06,x				;$B6A715   |
	BCC CODE_B6A71E				;$B6A717   |
	LDA #$C800				;$B6A719   |
	BRA CODE_B6A721				;$B6A71C  /

CODE_B6A71E:
	LDA #$3800				;$B6A71E  \
CODE_B6A721:					;	   |
	STA $0AEC				;$B6A721   |
	RTS					;$B6A724  /

CODE_B6A725:
	JSR CODE_B6A701				;$B6A725  \
	LDX current_sprite			;$B6A728   |
	LDA $42,x				;$B6A72A   |
	ASL A					;$B6A72C   |
	TAX					;$B6A72D   |
	PHK					;$B6A72E   |
	PLB					;$B6A72F   |
	JMP (DATA_B6A733,x)			;$B6A730  /

DATA_B6A733:
	dw CODE_B6A739
	dw CODE_B6A788
	dw CODE_B6A7CC


CODE_B6A739:
	JSL CODE_B8CF7F				;$B6A739  \
	LDX $0654				;$B6A73D   |
	LDA $0A,x				;$B6A740   |
	CMP #$0100				;$B6A742   |
	BCS CODE_B6A77E				;$B6A745   |
	PHX					;$B6A747   |
	LDA #$0615				;$B6A748   |
	JSL queue_sound_effect			;$B6A74B   |
	LDA #$0719				;$B6A74F   |
	JSL queue_sound_effect			;$B6A752   |
	LDA.l $000656				;$B6A756   |
	STA current_sprite			;$B6A75A   |
	JSL CODE_BB82B8				;$B6A75C   |
	STZ $0656				;$B6A760   |
	PLX					;$B6A763   |
	STX current_sprite			;$B6A764   |
	INC $42,x				;$B6A766   |
	LDA.l DATA_BAA3B0			;$B6A768   |
	STA $0006EF				;$B6A76C   |
	LDA #DATA_BAA3B2			;$B6A770   |
	STA $0006F1				;$B6A773   |
	LDA #$0009				;$B6A777   |
	STA $000747				;$B6A77A   |
CODE_B6A77E:					;	   |
	JSR CODE_B68D5D				;$B6A77E   |
	JSL CODE_B9D100				;$B6A781   |
	JML [$05A9]				;$B6A785  /

CODE_B6A788:
	JSR CODE_B6D929				;$B6A788  \
	LDX alternate_sprite			;$B6A78B   |
	LDA #$00AC				;$B6A78D   |
	JSL CODE_BB8C44				;$B6A790   |
	JSR CODE_B6D929				;$B6A794   |
	LDX alternate_sprite			;$B6A797   |
	LDA #$00AC				;$B6A799   |
	JSL CODE_BB8C44				;$B6A79C   |
	DEC $0747				;$B6A7A0   |
	BNE CODE_B6A7C9				;$B6A7A3   |
	LDA.l $0006A3				;$B6A7A5   |
	ORA #$0010				;$B6A7A9   |
	STA $0006A3				;$B6A7AC   |
	LDX current_sprite			;$B6A7B0   |
	INC $42,x				;$B6A7B2   |
	LDA #$0096				;$B6A7B4   |
	STA $000747				;$B6A7B7   |
	LDA #$1000				;$B6A7BB   |
	JSL CODE_B5F0CD				;$B6A7BE   |
	LDA #$0400				;$B6A7C2   |
	JSL CODE_B5F0ED				;$B6A7C5   |
CODE_B6A7C9:					;	   |
	JML [$05A9]				;$B6A7C9  /

CODE_B6A7CC:
	DEC $0747				;$B6A7CC  \
	BNE CODE_B6A7E5				;$B6A7CF   |
	LDA #$0040				;$B6A7D1   |
	TSB $06A5				;$B6A7D4   |
	LDA #$0012				;$B6A7D7   |
	TSB $08FC				;$B6A7DA   |
	JSL CODE_BB8158				;$B6A7DD   |
	JSL CODE_B8A691				;$B6A7E1   |
CODE_B6A7E5:					;	   |
	JML [$05A9]				;$B6A7E5  /

CODE_B6A7E8:
	LDY $0654				;$B6A7E8  \
	LDA #$0290				;$B6A7EB   |
	STA $0000,y				;$B6A7EE   |
	LDA #$F500				;$B6A7F1   |
	STA $0024,y				;$B6A7F4   |
	LDA #$0000				;$B6A7F7   |
	STA $0042,y				;$B6A7FA   |
	LDA $12,x				;$B6A7FD   |
	LDX #$FE00				;$B6A7FF   |
	BIT #$4000				;$B6A802   |
	BNE CODE_B6A80A				;$B6A805   |
	LDX #$0200				;$B6A807   |
CODE_B6A80A:					;	   |
	STX $20,y				;$B6A80A   |
	STY alternate_sprite			;$B6A80C   |
	LDA #$0254				;$B6A80E   |
	JSL CODE_B9D09B				;$B6A811   |
	LDA.l $000656				;$B6A815   |
	STA alternate_sprite			;$B6A819   |
	LDA #$0255				;$B6A81B   |
	JSL CODE_B9D09B				;$B6A81E   |
	LDY #$0194				;$B6A822   |
	JSL CODE_BB842C				;$B6A825   |
	RTL					;$B6A829  /

CODE_B6A82A:
	LDX $075F				;$B6A82A  \
	LDA $2E,x				;$B6A82D   |
	BEQ CODE_B6A835				;$B6A82F   |
	JSL CODE_B9D100				;$B6A831   |
CODE_B6A835:					;	   |
	JML [$05A9]				;$B6A835  /

CODE_B6A838:
	INC $0763				;$B6A838  \
	LDY $075F				;$B6A83B   |
	LDA #$0001				;$B6A83E   |
	STA $002E,y				;$B6A841   |
	LDX #$A512				;$B6A844   |
	LDA.l $000763				;$B6A847   |
	CMP #$0003				;$B6A84B   |
	BNE CODE_B6A853				;$B6A84E   |
	LDX #$A5EF				;$B6A850   |
CODE_B6A853:					;	   |
	STX $42,y				;$B6A853   |
	LDA #$0002				;$B6A855   |
	STA $000761				;$B6A858   |
	LDA.l $00075F				;$B6A85C   |
	STA alternate_sprite			;$B6A860   |
	LDA #$0245				;$B6A862   |
	JSL CODE_B9D09B				;$B6A865   |
	LDA.l $00075B				;$B6A869   |
	STA alternate_sprite			;$B6A86D   |
	LDA #$0246				;$B6A86F   |
	JSL CODE_B9D09B				;$B6A872   |
	RTL					;$B6A876  /

CODE_B6A877:
	LDX current_sprite			;$B6A877  \
	LDA $42,x				;$B6A879   |
	JSL CODE_B8D010				;$B6A87B   |
	LDX current_sprite			;$B6A87F   |
	LDA $44,x				;$B6A881   |
	JSL CODE_B8CFD4				;$B6A883   |
	JSL CODE_B8CF7F				;$B6A887   |
	JSL CODE_B9D100				;$B6A88B   |
	JML [$05A9]				;$B6A88F  /

CODE_B6A892:
	LDA #$0774				;$B6A892  \
	JSL queue_sound_effect			;$B6A895   |
	LDY #$016E				;$B6A899   |
	JSL CODE_BB842C				;$B6A89C   |
	LDY alternate_sprite			;$B6A8A0   |
	LDX $0654				;$B6A8A2   |
	LDA $12,x				;$B6A8A5   |
	BIT #$4000				;$B6A8A7   |
	BNE CODE_B6A8BD				;$B6A8AA   |
	LDA $0012,y				;$B6A8AC   |
	AND #$BFFF				;$B6A8AF   |
	STA $0012,y				;$B6A8B2   |
	LDA $06,x				;$B6A8B5   |
	CLC					;$B6A8B7   |
	ADC #$0000				;$B6A8B8   |
	BRA CODE_B6A8CC				;$B6A8BB  /

CODE_B6A8BD:
	LDA $0012,y				;$B6A8BD  \
	ORA #$4000				;$B6A8C0   |
	STA $0012,y				;$B6A8C3   |
	LDA $06,x				;$B6A8C6   |
	SEC					;$B6A8C8   |
	SBC #$0000				;$B6A8C9   |
CODE_B6A8CC:					;	   |
	STA $0006,y				;$B6A8CC   |
	LDA $0A,x				;$B6A8CF   |
	CLC					;$B6A8D1   |
	ADC #$FFE4				;$B6A8D2   |
	STA $000A,y				;$B6A8D5   |
	LDA #$0276				;$B6A8D8   |
	JSL CODE_B9D09B				;$B6A8DB   |
	RTL					;$B6A8DF  /

CODE_B6A8E0:
	PHB					;$B6A8E0  \
	PHK					;$B6A8E1   |
	PLB					;$B6A8E2   |
	LDX $0654				;$B6A8E3   |
	LDA $12,x				;$B6A8E6   |
	BIT #$4000				;$B6A8E8   |
	BEQ CODE_B6A8F0				;$B6A8EB   |
	BRL CODE_B6A968				;$B6A8ED  /

CODE_B6A8F0:
	JSR CODE_B6AA27				;$B6A8F0  \
	LDA #$7166				;$B6A8F3   |
	JSR CODE_B6AA78				;$B6A8F6   |
	LDA $000A,y				;$B6A8F9   |
	SEC					;$B6A8FC   |
	SBC #$000D				;$B6A8FD   |
	STA $000A,y				;$B6A900   |
	LDA #$FE80				;$B6A903   |
	STA $0020,y				;$B6A906   |
	LDA #$FE40				;$B6A909   |
	STA $0024,y				;$B6A90C   |
	LDA #$0003				;$B6A90F   |
	STA $0042,y				;$B6A912   |
	STA $0044,y				;$B6A915   |
	LDA $0012,y				;$B6A918   |
	ORA #$8000				;$B6A91B   |
	STA $0012,y				;$B6A91E   |
	JSR CODE_B6AA27				;$B6A921   |
	LDA #$7166				;$B6A924   |
	JSR CODE_B6AA78				;$B6A927   |
	LDA #$FE80				;$B6A92A   |
	STA $0020,y				;$B6A92D   |
	LDA #$0100				;$B6A930   |
	STA $0024,y				;$B6A933   |
	LDA #$0003				;$B6A936   |
	STA $0042,y				;$B6A939   |
	STA $0044,y				;$B6A93C   |
	JSR CODE_B6AA27				;$B6A93F   |
	LDA #$01BF				;$B6A942   |
	JSL CODE_B9D09B				;$B6A945   |
	LDA #$6682				;$B6A949   |
	JSR CODE_B6AA78				;$B6A94C   |
	LDA $000A,y				;$B6A94F   |
	SEC					;$B6A952   |
	SBC #$0007				;$B6A953   |
	STA $000A,y				;$B6A956   |
	LDA #$0000				;$B6A959   |
	STA $0020,y				;$B6A95C   |
	LDA #$0002				;$B6A95F   |
	STA $0042,y				;$B6A962   |
	BRL CODE_B6A9DD				;$B6A965  /

CODE_B6A968:
	JSR CODE_B6AA49				;$B6A968  \
	LDA #$7166				;$B6A96B   |
	JSR CODE_B6AA78				;$B6A96E   |
	LDA $000A,y				;$B6A971   |
	SEC					;$B6A974   |
	SBC #$000D				;$B6A975   |
	STA $000A,y				;$B6A978   |
	LDA #$0180				;$B6A97B   |
	STA $0020,y				;$B6A97E   |
	LDA #$FE40				;$B6A981   |
	STA $0024,y				;$B6A984   |
	LDA #$0003				;$B6A987   |
	STA $0042,y				;$B6A98A   |
	STA $0044,y				;$B6A98D   |
	LDA $0012,y				;$B6A990   |
	ORA #$8000				;$B6A993   |
	STA $0012,y				;$B6A996   |
	JSR CODE_B6AA49				;$B6A999   |
	LDA #$7166				;$B6A99C   |
	JSR CODE_B6AA78				;$B6A99F   |
	LDA #$0180				;$B6A9A2   |
	STA $0020,y				;$B6A9A5   |
	LDA #$0100				;$B6A9A8   |
	STA $0024,y				;$B6A9AB   |
	LDA #$0003				;$B6A9AE   |
	STA $0042,y				;$B6A9B1   |
	STA $0044,y				;$B6A9B4   |
	JSR CODE_B6AA49				;$B6A9B7   |
	LDA #$01BF				;$B6A9BA   |
	JSL CODE_B9D09B				;$B6A9BD   |
	LDA #$6682				;$B6A9C1   |
	JSR CODE_B6AA78				;$B6A9C4   |
	LDA $000A,y				;$B6A9C7   |
	SEC					;$B6A9CA   |
	SBC #$0007				;$B6A9CB   |
	STA $000A,y				;$B6A9CE   |
	LDA #$0000				;$B6A9D1   |
	STA $0020,y				;$B6A9D4   |
	LDA #$0002				;$B6A9D7   |
	STA $0042,y				;$B6A9DA   |
CODE_B6A9DD:					;	   |
	LDA.l $0006A3				;$B6A9DD   |
	AND #$FEFF				;$B6A9E1   |
	STA $0006A3				;$B6A9E4   |
	LDY.w #DATA_FF1F8A			;$B6A9E8   |
	JSL CODE_BB8432				;$B6A9EB   |
	JSR CODE_B699C5				;$B6A9EF   |
	LDA $002E,y				;$B6A9F2   |
	ORA #$0191				;$B6A9F5   |
	STA $002E,y				;$B6A9F8   |
	PHX					;$B6A9FB   |
	LDA.l $000652				;$B6A9FC   |
	ASL A					;$B6AA00   |
	TAX					;$B6AA01   |
	LDA DATA_B69383,x			;$B6AA02   |
	PLX					;$B6AA05   |
	PHA					;$B6AA06   |
	LDA $12,x				;$B6AA07   |
	BIT #$4000				;$B6AA09   |
	BNE CODE_B6AA14				;$B6AA0C   |
	PLA					;$B6AA0E   |
	STA $0020,y				;$B6AA0F   |
	BRA CODE_B6AA1C				;$B6AA12  /

CODE_B6AA14:
	PLA					;$B6AA14  \
	EOR #$FFFF				;$B6AA15   |
	INC A					;$B6AA18   |
	STA $0020,y				;$B6AA19   |
CODE_B6AA1C:					;	   |
	STA $0026,y				;$B6AA1C   |
	LDA #$270F				;$B6AA1F   |
	STA $0046,y				;$B6AA22   |
	PLB					;$B6AA25   |
	RTL					;$B6AA26  /

CODE_B6AA27:
	JSR CODE_B6AA6B				;$B6AA27  \
	LDA #$0272				;$B6AA2A   |
	JSL CODE_B9D09B				;$B6AA2D   |
	LDY alternate_sprite			;$B6AA31   |
	LDX $0654				;$B6AA33   |
	LDA $06,x				;$B6AA36   |
	CLC					;$B6AA38   |
	ADC #$0014				;$B6AA39   |
	STA $0006,y				;$B6AA3C   |
	LDA $0A,x				;$B6AA3F   |
	CLC					;$B6AA41   |
	ADC #$FFEC				;$B6AA42   |
	STA $000A,y				;$B6AA45   |
	RTS					;$B6AA48  /

CODE_B6AA49:
	JSR CODE_B6AA6B				;$B6AA49  \
	LDA #$0272				;$B6AA4C   |
	JSL CODE_B9D09B				;$B6AA4F   |
	LDY alternate_sprite			;$B6AA53   |
	LDX $0654				;$B6AA55   |
	LDA $06,x				;$B6AA58   |
	SEC					;$B6AA5A   |
	SBC #$0014				;$B6AA5B   |
	STA $0006,y				;$B6AA5E   |
	LDA $0A,x				;$B6AA61   |
	CLC					;$B6AA63   |
	ADC #$FFEC				;$B6AA64   |
	STA $000A,y				;$B6AA67   |
	RTS					;$B6AA6A  /

CODE_B6AA6B:
	LDY #$017C				;$B6AA6B  \
	JSL CODE_BB842C				;$B6AA6E   |
	LDY alternate_sprite			;$B6AA72   |
	LDX $0654				;$B6AA74   |
	RTS					;$B6AA77  /

CODE_B6AA78:
	JSL CODE_BB8A65				;$B6AA78  \
	LDY alternate_sprite			;$B6AA7C   |
	EOR $0012,y				;$B6AA7E   |
	AND #$0E00				;$B6AA81   |
	EOR $0012,y				;$B6AA84   |
	STA $0012,y				;$B6AA87   |
	RTS					;$B6AA8A  /

CODE_B6AA8B:
	LDA $2E,x				;$B6AA8B  \
	ORA #$0001				;$B6AA8D   |
	STA $2E,x				;$B6AA90   |
	RTL					;$B6AA92  /

CODE_B6AA93:
	LDA $2E,x				;$B6AA93  \
	AND #$FFFE				;$B6AA95   |
	STA $2E,x				;$B6AA98   |
	RTL					;$B6AA9A  /

CODE_B6AA9B:
	LDX $072B				;$B6AA9B  \
	LDA #$0002				;$B6AA9E   |
	STA $42,x				;$B6AAA1   |
	RTL					;$B6AAA3  /

CODE_B6AAA4:
	LDX $072B				;$B6AAA4  \
	STZ $42,x				;$B6AAA7   |
	RTL					;$B6AAA9  /

CODE_B6AAAA:
	LDA #$006B				;$B6AAAA  \
	JSL CODE_BB8C44				;$B6AAAD   |
	LDY #$0158				;$B6AAB1   |
	JSL CODE_BB842C				;$B6AAB4   |
	LDY alternate_sprite			;$B6AAB8   |
	STY $0733				;$B6AABA   |
	RTL					;$B6AABD  /

CODE_B6AABE:
	LDA #CODE_B6AB94			;$B6AABE  \
	STA $44,x				;$B6AAC1   |
	LDA #$0003				;$B6AAC3   |
	STA $000731				;$B6AAC6   |
	LDA #$000C				;$B6AACA   |
	STA $000650				;$B6AACD   |
	LDA #$FFF6				;$B6AAD1   |
	STA $000658				;$B6AAD4   |
	JSR CODE_B6AB5F				;$B6AAD8   |
	LDY alternate_sprite			;$B6AADB   |
	LDA #$FD80				;$B6AADD   |
	STA $002A,y				;$B6AAE0   |
	LDA #$0009				;$B6AAE3   |
	STA $0044,y				;$B6AAE6   |
	LDA #$FFF2				;$B6AAE9   |
	STA $000650				;$B6AAEC   |
	LDA #$FFF6				;$B6AAF0   |
	STA $000658				;$B6AAF3   |
	JSR CODE_B6AB5F				;$B6AAF7   |
	LDY alternate_sprite			;$B6AAFA   |
	LDA #$FE00				;$B6AAFC   |
	STA $002A,y				;$B6AAFF   |
	LDA #$0005				;$B6AB02   |
	STA $0044,y				;$B6AB05   |
	LDA #$000C				;$B6AB08   |
	STA $000650				;$B6AB0B   |
	LDA #$FFF6				;$B6AB0F   |
	STA $000658				;$B6AB12   |
	JSR CODE_B6AB5F				;$B6AB16   |
	LDY alternate_sprite			;$B6AB19   |
	LDA #$FF80				;$B6AB1B   |
	STA $002A,y				;$B6AB1E   |
	LDA #$0005				;$B6AB21   |
	STA $0044,y				;$B6AB24   |
	LDA $0012,y				;$B6AB27   |
	ORA #$8000				;$B6AB2A   |
	STA $0012,y				;$B6AB2D   |
	LDA #$FFEE				;$B6AB30   |
	STA $000650				;$B6AB33   |
	LDA #$FFF9				;$B6AB37   |
	STA $000658				;$B6AB3A   |
	JSR CODE_B6AB5F				;$B6AB3E   |
	LDY alternate_sprite			;$B6AB41   |
	LDA #$FFA0				;$B6AB43   |
	STA $002A,y				;$B6AB46   |
	LDA #$0002				;$B6AB49   |
	STA $0044,y				;$B6AB4C   |
	LDA.l $000733				;$B6AB4F   |
	BEQ CODE_B6AB5E				;$B6AB53   |
	STA alternate_sprite			;$B6AB55   |
	LDA #$0274				;$B6AB57   |
	JSL CODE_B9D09B				;$B6AB5A   |
CODE_B6AB5E:					;	   |
	RTL					;$B6AB5E  /

CODE_B6AB5F:
	JSR CODE_B6AA6B				;$B6AB5F  \
	LDA $12,x				;$B6AB62   |
	BIT #$4000				;$B6AB64   |
	BNE CODE_B6AB72				;$B6AB67   |
	LDA $06,x				;$B6AB69   |
	CLC					;$B6AB6B   |
	ADC $000650				;$B6AB6C   |
	BRA CODE_B6AB79				;$B6AB70  /

CODE_B6AB72:
	LDA $06,x				;$B6AB72  \
	SEC					;$B6AB74   |
	SBC $000650				;$B6AB75   |
CODE_B6AB79:					;	   |
	STA $0006,y				;$B6AB79   |
	LDA $0A,x				;$B6AB7C   |
	CLC					;$B6AB7E   |
	ADC $000658				;$B6AB7F   |
	STA $000A,y				;$B6AB83   |
	LDA #$6682				;$B6AB86   |
	JSR CODE_B6AA78				;$B6AB89   |
	LDA #$01BF				;$B6AB8C   |
	JSL CODE_B9D09B				;$B6AB8F   |
	RTS					;$B6AB93  /

CODE_B6AB94:
	DEC $0731				;$B6AB94  \
	BNE CODE_B6ABC7				;$B6AB97   |
	LDA #$0003				;$B6AB99   |
	STA $000731				;$B6AB9C   |
	LDX current_sprite			;$B6ABA0   |
	LDY $0733				;$B6ABA2   |
	BNE CODE_B6ABA8				;$B6ABA5   |
	TXY					;$B6ABA7   |
CODE_B6ABA8:					;	   |
	LDA $2E,x				;$B6ABA8   |
	EOR #$0004				;$B6ABAA   |
	STA $2E,x				;$B6ABAD   |
	AND #$0004				;$B6ABAF   |
	BEQ CODE_B6ABBC				;$B6ABB2   |
	LDA $06,x				;$B6ABB4   |
	SEC					;$B6ABB6   |
	SBC #$0004				;$B6ABB7   |
	BRA CODE_B6ABC2				;$B6ABBA  /

CODE_B6ABBC:
	LDA $06,x				;$B6ABBC  \
	CLC					;$B6ABBE   |
	ADC #$0004				;$B6ABBF   |
CODE_B6ABC2:					;	   |
	STA $06,x				;$B6ABC2   |
	STA $0006,y				;$B6ABC4   |
CODE_B6ABC7:					;	   |
	JSR CODE_B68D5D				;$B6ABC7   |
	RTS					;$B6ABCA  /

CODE_B6ABCB:
	PHB					;$B6ABCB  \
	PHK					;$B6ABCC   |
	PLB					;$B6ABCD   |
	LDA.l $000733				;$B6ABCE   |
	BEQ CODE_B6ABDD				;$B6ABD2   |
	STA current_sprite			;$B6ABD4   |
	JSL CODE_BB82B8				;$B6ABD6   |
	STZ $0733				;$B6ABDA   |
CODE_B6ABDD:					;	   |
	LDX $0654				;$B6ABDD   |
	STX current_sprite			;$B6ABE0   |
	LDA #$0069				;$B6ABE2   |
	JSL CODE_BB8C44				;$B6ABE5   |
	LDX current_sprite			;$B6ABE9   |
	DEC $0652				;$B6ABEB   |
	LDA.l $000652				;$B6ABEE   |
	ASL A					;$B6ABF2   |
	TAY					;$B6ABF3   |
	LDA DATA_B6D0D1,y			;$B6ABF4   |
	LDX level_number			;$B6ABF7   |
	CPX #!level_krocodile_kore		;$B6ABF9   |
	BNE CODE_B6AC01				;$B6ABFC   |
	LDA DATA_B6D135,y			;$B6ABFE   |
CODE_B6AC01:					;	   |
	TAY					;$B6AC01   |
	LDA $0006,y				;$B6AC02   |
	LDX current_sprite			;$B6AC05   |
	STA $46,x				;$B6AC07   |
	STA $00065A				;$B6AC09   |
	LDX $0654				;$B6AC0D   |
	DEC $070B				;$B6AC10   |
	BNE CODE_B6AC7F				;$B6AC13   |
	LDA #boss_command_code_03		;$B6AC15   |
	STA $44,x				;$B6AC18   |
	LDA level_number			;$B6AC1A   |
	CMP #!level_krocodile_kore		;$B6AC1C   |
	BNE CODE_B6AC34				;$B6AC1F   |
	LDA #$0287				;$B6AC21   |
	JSL set_sprite_animation		;$B6AC24   |
	LDX $0656				;$B6AC28   |
	STX alternate_sprite			;$B6AC2B   |
	STZ $1C,x				;$B6AC2D   |
	LDA #$0288				;$B6AC2F   |
	BRA CODE_B6AC79				;$B6AC32  /

CODE_B6AC34:
	LDA.l $000652				;$B6AC34  \
	CMP #$0006				;$B6AC38   |
	BEQ CODE_B6AC68				;$B6AC3B   |
	CMP #$0003				;$B6AC3D   |
	BEQ CODE_B6AC55				;$B6AC40   |
	LDA #$0287				;$B6AC42   |
	JSL set_sprite_animation		;$B6AC45   |
	LDX $0656				;$B6AC49   |
	STX alternate_sprite			;$B6AC4C   |
	STZ $1C,x				;$B6AC4E   |
	LDA #$0288				;$B6AC50   |
	BRA CODE_B6AC79				;$B6AC53  /

CODE_B6AC55:
	LDA #$0285				;$B6AC55  \
	JSL set_sprite_animation		;$B6AC58   |
	LDX $0656				;$B6AC5C   |
	STX alternate_sprite			;$B6AC5F   |
	STZ $1C,x				;$B6AC61   |
	LDA #$0286				;$B6AC63   |
	BRA CODE_B6AC79				;$B6AC66  /

CODE_B6AC68:
	LDA #$0278				;$B6AC68  \
	JSL set_sprite_animation		;$B6AC6B   |
	LDX $0656				;$B6AC6F   |
	STX alternate_sprite			;$B6AC72   |
	STZ $1C,x				;$B6AC74   |
	LDA #$0279				;$B6AC76   |
CODE_B6AC79:					;	   |
	JSL CODE_B9D09B				;$B6AC79   |
	BRA CODE_B6AC97				;$B6AC7D  /

CODE_B6AC7F:
	JSR CODE_B6D008				;$B6AC7F  \
	LDA #$025E				;$B6AC82   |
	JSL set_sprite_animation		;$B6AC85   |
	LDX $0656				;$B6AC89   |
	STX alternate_sprite			;$B6AC8C   |
	STZ $1C,x				;$B6AC8E   |
	LDA #$025F				;$B6AC90   |
	JSL CODE_B9D09B				;$B6AC93   |
CODE_B6AC97:					;	   |
	PLB					;$B6AC97   |
	RTL					;$B6AC98  /

CODE_B6AC99:
	LDA.l $000652				;$B6AC99  \
	BEQ CODE_B6ACD7				;$B6AC9D   |
	LDA #$0003				;$B6AC9F   |
	STA $00070B				;$B6ACA2   |
	LDA.l $000652				;$B6ACA6   |
	CMP #$0006				;$B6ACAA   |
	BEQ CODE_B6ACC1				;$B6ACAD   |
	LDA #$028A				;$B6ACAF   |
	JSL set_sprite_animation		;$B6ACB2   |
	LDA.l $000656				;$B6ACB6   |
	STA alternate_sprite			;$B6ACBA   |
	LDA #$028B				;$B6ACBC   |
	BRA CODE_B6ACD1				;$B6ACBF  /

CODE_B6ACC1:
	LDA #$027A				;$B6ACC1  \
	JSL set_sprite_animation		;$B6ACC4   |
	LDA.l $000656				;$B6ACC8   |
	STA alternate_sprite			;$B6ACCC   |
	LDA #$027B				;$B6ACCE   |
CODE_B6ACD1:					;	   |
	JSL CODE_B9D09B				;$B6ACD1   |
	BRA CODE_B6ACD7				;$B6ACD5  /

CODE_B6ACD7:
	RTL					;$B6ACD7  /

CODE_B6ACD8:
	PHB					;$B6ACD8  \
	PHK					;$B6ACD9   |
	PLB					;$B6ACDA   |
	JSR CODE_B6D008				;$B6ACDB   |
	LDA #$025E				;$B6ACDE   |
	JSL set_sprite_animation		;$B6ACE1   |
	LDX $0656				;$B6ACE5   |
	STX alternate_sprite			;$B6ACE8   |
	LDA #$027C				;$B6ACEA   |
	JSL CODE_B9D09B				;$B6ACED   |
	PLB					;$B6ACF1   |
	RTL					;$B6ACF2  /

CODE_B6ACF3:
	LDY alternate_sprite			;$B6ACF3   |
	LDA $002E,y				;$B6ACF5   |
	ORA #$0018				;$B6ACF8   |
	STA $002E,y				;$B6ACFB   |
	STY $0735				;$B6ACFE   |
	RTS					;$B6AD01  /

CODE_B6AD02:
	LDY $073B				;$B6AD02   |
	BNE CODE_B6AD0C				;$B6AD05   |
	LDY alternate_sprite			;$B6AD07   |
	STY $073B				;$B6AD09   |
CODE_B6AD0C:					;	   |
	RTS					;$B6AD0C  /

CODE_B6AD0D:
	PHB					;$B6AD0D  \
	PHK					;$B6AD0E   |
	PLB					;$B6AD0F   |
	JSR CODE_B6D008				;$B6AD10   |
	LDA #$025E				;$B6AD13   |
	JSL set_sprite_animation		;$B6AD16   |
	LDA.l $000656				;$B6AD1A   |
	STA alternate_sprite			;$B6AD1E   |
	LDA #$025F				;$B6AD20   |
	JSL CODE_B9D09B				;$B6AD23   |
	PLB					;$B6AD27   |
	RTL					;$B6AD28  /

CODE_B6AD29:
	LDA #$0774				;$B6AD29  \
	JSL queue_sound_effect			;$B6AD2C   |
	LDX #DATA_B6D14B			;$B6AD30   |
	LDA $0000,x				;$B6AD33   |
	STA $000650				;$B6AD36   |
CODE_B6AD3A:					;	   |
	LDY $0002,x				;$B6AD3A   |
	PHX					;$B6AD3D   |
	JSL CODE_BB8418				;$B6AD3E   |
	PLY					;$B6AD42   |
	LDX alternate_sprite			;$B6AD43   |
	LDA $01,s				;$B6AD45   |
	AND #$0100				;$B6AD47   |
	BNE CODE_B6AD58				;$B6AD4A   |
	LDA $0008,y				;$B6AD4C   |
	STA $26,x				;$B6AD4F   |
	LDA $000A,y				;$B6AD51   |
	STA $20,x				;$B6AD54   |
	BRA CODE_B6AD6A				;$B6AD56  /

CODE_B6AD58:
	LDA #$0000				;$B6AD58  \
	CLC					;$B6AD5B   |
	SBC $0008,y				;$B6AD5C   |
	STA $26,x				;$B6AD5F   |
	LDA #$0000				;$B6AD61   |
	CLC					;$B6AD64   |
	SBC $000A,y				;$B6AD65   |
	STA $20,x				;$B6AD68   |
CODE_B6AD6A:					;	   |
	LDA $000C,y				;$B6AD6A   |
	STA $24,x				;$B6AD6D   |
	LDA $0004,y				;$B6AD6F   |
	CLC					;$B6AD72   |
	ADC $06,x				;$B6AD73   |
	STA $06,x				;$B6AD75   |
	LDA $0006,y				;$B6AD77   |
	CLC					;$B6AD7A   |
	ADC $0A,x				;$B6AD7B   |
	STA $0A,x				;$B6AD7D   |
	TYA					;$B6AD7F   |
	CLC					;$B6AD80   |
	ADC #$000C				;$B6AD81   |
	TAX					;$B6AD84   |
	DEC $0650				;$B6AD85   |
	BNE CODE_B6AD3A				;$B6AD88   |
	RTS					;$B6AD8A  /

CODE_B6AD8B:
	LDA $2E,x				;$B6AD8B  \
	ORA #$0200				;$B6AD8D   |
	STA $2E,x				;$B6AD90   |
	RTL					;$B6AD92  /

CODE_B6AD93:
	LDA $2E,x				;$B6AD93  \
	AND #$FDFF				;$B6AD95   |
	STA $2E,x				;$B6AD98   |
	RTL					;$B6AD9A  /

CODE_B6AD9B:
	LDA $0D7A				;$B6AD9B  \
	CMP inactive_kong_sprite		;$B6AD9E   |
	BEQ CODE_B6ADA8				;$B6ADA1   |
	STZ $0D7A				;$B6ADA3   |
	SEC					;$B6ADA6   |
	RTS					;$B6ADA7  /

CODE_B6ADA8:
	CLC					;$B6ADA8  \
	RTS					;$B6ADA9  /


;k.rool color palette numbers (used for k.rool's transition to transparent)
DATA_B6ADAA:
	dw $0090, $0093
	dw $0091, $0094
	dw $0092, $0095

;k.rool color palette numbers (used for k.rool's transition from transparent)
DATA_B6ADB6:
	dw $0092, $0095
	dw $0091, $0094
	dw $0090, $0093
	dw $0069, $006A
DATA_B6ADC6:

CODE_B6ADC6:
	PHB					;$B6ADC6  \
	PHK					;$B6ADC7   |
	PLB					;$B6ADC8   |
	LDX current_sprite			;$B6ADC9   |
	LDA.l $00071F				;$B6ADCB   |
	BEQ CODE_B6ADD6				;$B6ADCF   |
	LDA #$00B0				;$B6ADD1   |
	BRA CODE_B6ADE8				;$B6ADD4  /

CODE_B6ADD6:
	LDA.l $000652				;$B6ADD6  \
	ASL A					;$B6ADDA   |
	TAY					;$B6ADDB   |
	JSR CODE_B6D923				;$B6ADDC   |
	LDA.w DATA_BAABA8,y			;$B6ADDF   |
	TAY					;$B6ADE2   |
	LDA $0004,y				;$B6ADE3   |
	PHK					;$B6ADE6   |
	PLB					;$B6ADE7   |
CODE_B6ADE8:					;	   |
	STA $28,x				;$B6ADE8   |
	LDA #$0005				;$B6ADEA   |
	STA $22,x				;$B6ADED   |
	PLB					;$B6ADEF   |
	RTL					;$B6ADF0  /

CODE_B6ADF1:
	PHB					;$B6ADF1  \
	PHK					;$B6ADF2   |
	PLB					;$B6ADF3   |
	LDX current_sprite			;$B6ADF4   |
	LDA #$0002				;$B6ADF6   |
	STA $00070B				;$B6ADF9   |
	LDA.l $000652				;$B6ADFD   |
	ASL A					;$B6AE01   |
	TAY					;$B6AE02   |
	JSR CODE_B6D923				;$B6AE03   |
	LDA.w DATA_BAABA8,y			;$B6AE06   |
	TAY					;$B6AE09   |
	LDA $0004,y				;$B6AE0A   |
	STA $28,x				;$B6AE0D   |
	LDA #$0005				;$B6AE0F   |
	STA $22,x				;$B6AE12   |
	LDA $2E,x				;$B6AE14   |
	AND #$FFFB				;$B6AE16   |
	STA $2E,x				;$B6AE19   |
	LDA #$0100				;$B6AE1B   |
	STA $0006E5				;$B6AE1E   |
	LDA #$0100				;$B6AE22   |
	STA $0006E7				;$B6AE25   |
	LDA #$001E				;$B6AE29   |
	STA $0006E1				;$B6AE2C   |
	LDA #$001B				;$B6AE30   |
	STA $0006E3				;$B6AE33   |
	LDA.l $000652				;$B6AE37   |
	CMP #$0004				;$B6AE3B   |
	BCC CODE_B6AE55				;$B6AE3E   |
	LDA $0006,y				;$B6AE40   |
	STA $0006E9				;$B6AE43   |
	LDA #$003C				;$B6AE47   |
	STA $00070D				;$B6AE4A   |
	LDA $0008,y				;$B6AE4E   |
	STA $00070F				;$B6AE51   |
CODE_B6AE55:					;	   |
	PHK					;$B6AE55   |
	PLB					;$B6AE56   |
	JSL CODE_BA92F2				;$B6AE57   |
	STZ $26,x				;$B6AE5B   |
	STZ $2A,x				;$B6AE5D   |
	STZ $20,x				;$B6AE5F   |
	STZ $24,x				;$B6AE61   |
	LDA #$0005				;$B6AE63   |
	JSL CODE_B8D010				;$B6AE66   |
	LDA #$0005				;$B6AE6A   |
	JSL CODE_B8CFD4				;$B6AE6D   |
	PLB					;$B6AE71   |
	RTL					;$B6AE72  /

DATA_B6AE73:
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0002
	dw $0002
	dw $0002
	dw $0002
	dw $0001
	dw $0001

DATA_B6AE87:
	dw !boss_command_26, $026E, $016D, DATA_B6AE73
	dw !boss_command_27, $4000
	dw !boss_command_26, $0204, $016D, DATA_B6AE73
	dw !boss_command_27, $0000
	dw !boss_command_26, $01D0, $01D8, DATA_B6AE73
	dw !boss_command_26, $02B6, $01D8, DATA_B6AE73
	dw !boss_command_27, $4000
	dw !boss_command_26, $02B6, $0240, DATA_B6AE73
	dw !boss_command_26, $01D0, $0240, DATA_B6AE73
	dw !boss_command_27, $0000
	dw !boss_command_26, $01D0, $02A8, DATA_B6AE73
	dw !boss_command_26, $02B6, $02A8, DATA_B6AE73
	dw !boss_command_27, $4000
	dw !boss_command_26, $0274, $02CD, DATA_B6AE73
	dw !boss_command_26, $0204, $02CD, DATA_B6AE73
	dw !boss_command_27, $0000
	dw !boss_command_26, $01D0, $02A8, DATA_B6AE73
	dw !boss_command_26, $02B6, $02A8, DATA_B6AE73
	dw !boss_command_27, $4000
	dw !boss_command_26, $02B6, $0240, DATA_B6AE73
	dw !boss_command_26, $01D0, $0240, DATA_B6AE73
	dw !boss_command_27, $0000
	dw !boss_command_26, $01D0, $01D8, DATA_B6AE73
	dw !boss_command_26, $02B6, $01D8, DATA_B6AE73
	dw !boss_command_27, $4000
	dw !boss_command_goto_or_reset, !null_pointer

CODE_B6AF2F:
	LDA $06,x				;$B6AF2F  \
	SEC					;$B6AF31   |
	SBC [$CE]				;$B6AF32   |
	CMP #$01D0				;$B6AF34   |
	BCS CODE_B6AF6A				;$B6AF37   |
	LDA #$01D0				;$B6AF39   |
	BRA CODE_B6AF6A				;$B6AF3C  /

CODE_B6AF3E:
	LDX current_sprite			;$B6AF3E  \
	LDA $20,x				;$B6AF40   |
	CMP $22,x				;$B6AF42   |
	BEQ CODE_B6AF85				;$B6AF44   |
	DEC $24,x				;$B6AF46   |
	BNE CODE_B6AF85				;$B6AF48   |
	LDA $26,x				;$B6AF4A   |
	STA $24,x				;$B6AF4C   |
	LDY $20,x				;$B6AF4E   |
	PHK					;$B6AF50   |
	PHK					;$B6AF51   |
	PLA					;$B6AF52   |
	STA $CF					;$B6AF53   |
	STY $CE					;$B6AF55   |
	LDY $42,x				;$B6AF57   |
	LDA $28,x				;$B6AF59   |
	BMI CODE_B6AF2F				;$B6AF5B   |
	LDA $06,x				;$B6AF5D   |
	CLC					;$B6AF5F   |
	ADC [$CE]				;$B6AF60   |
	CMP #$02B6				;$B6AF62   |
	BCC CODE_B6AF6A				;$B6AF65   |
	LDA #$02B6				;$B6AF67   |
CODE_B6AF6A:					;	   |
	STA $06,x				;$B6AF6A   |
	STA $0006,y				;$B6AF6C   |
	INC $CE					;$B6AF6F   |
	INC $CE					;$B6AF71   |
	LDA $0A,x				;$B6AF73   |
	CLC					;$B6AF75   |
	ADC [$CE]				;$B6AF76   |
	STA $0A,x				;$B6AF78   |
	STA $000A,y				;$B6AF7A   |
	LDA $20,x				;$B6AF7D   |
	CLC					;$B6AF7F   |
	ADC #$0004				;$B6AF80   |
	STA $20,x				;$B6AF83   |
CODE_B6AF85:					;	   |
	LDA $2E,x				;$B6AF85   |
	BIT #$1000				;$B6AF87   |
	BEQ CODE_B6AF8D				;$B6AF8A   |
CODE_B6AF8C:					;	   |
	RTS					;$B6AF8C  /

CODE_B6AF8D:
	LDA.l $000652				;$B6AF8D  \
	ASL A					;$B6AF91   |
	TAX					;$B6AF92   |
	JSR CODE_B6D923				;$B6AF93   |
	LDY.w DATA_BAABA8,x			;$B6AF96   |
	PHK					;$B6AF99   |
	PLB					;$B6AF9A   |
	LDX $0654				;$B6AF9B   |
	STX current_sprite			;$B6AF9E   |
	LDA.l $000652				;$B6AFA0   |
	CMP #$0003				;$B6AFA4   |
	BNE CODE_B6AFBC				;$B6AFA7   |
	LDX $0654				;$B6AFA9   |
	LDA $2E,x				;$B6AFAC   |
	ORA #$4005				;$B6AFAE   |
	STA $2E,x				;$B6AFB1   |
if !version == 0				;	   |
	LDA #$000F				;$B6AFB3   |
else						;	   |
	LDA #$000C				;$B6AFB3   |
endif						;	   |
	STA $00071D				;$B6AFB6   |
	BRA CODE_B6AFDA				;$B6AFBA  /

CODE_B6AFBC:
	LDA.l $00070B				;$B6AFBC  \
	BNE CODE_B6AFDA				;$B6AFC0   |
	LDA #$6BE6				;$B6AFC2   |
	JSL CODE_BB8C40				;$B6AFC5   |
	STZ $0709				;$B6AFC9   |
	LDA $2E,x				;$B6AFCC   |
	ORA #$0005				;$B6AFCE   |
	STA $2E,x				;$B6AFD1   |
	LDA $2E,x				;$B6AFD3   |
	AND #$FDFF				;$B6AFD5   |
	STA $2E,x				;$B6AFD8   |
CODE_B6AFDA:					;	   |
	LDA $46,x				;$B6AFDA   |
	SEC					;$B6AFDC   |
	SBC #$0008				;$B6AFDD   |
	STA $46,x				;$B6AFE0   |
	STZ $44,x				;$B6AFE2   |
	BRL CODE_B6AF8C				;$B6AFE4  /

DATA_B6AFE7:
	dw !boss_command_fly_to, $0224, $0BB6, $0002
	dw !boss_command_set_pattern, DATA_B6AFF9
	dw !boss_command_goto_or_reset, DATA_B6B631, DATA_B6B631

DATA_B6AFF9:
	dw !boss_command_1D, $0003, DATA_B6B66B
	dw !boss_command_13
	dw !boss_command_1F, $0A44
	dw !boss_command_goto_or_reset, DATA_B6B021, DATA_B6B00B

DATA_B6B00B:
	dw !boss_command_1E, $0107, $013F, $0002
	dw !boss_command_1E, $0108, $013F, $0002
	dw !boss_command_goto_or_reset, DATA_B6B031, DATA_B6B031

DATA_B6B021:
	dw !boss_command_1E, $0259, $013F, $0002
	dw !boss_command_1E, $0258, $013F, $0001

DATA_B6B031:
	dw !boss_command_animated_wait, $0258, $0200
	dw !boss_command_goto_or_reset, DATA_B6B03D, DATA_B6B115

DATA_B6B03D:
	dw !boss_command_1E, $0257, $017F, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0255, $01D2, $0002
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0250, $01D5, $0002
	dw !boss_command_1E, $0240, $01D6, $0002
	dw !boss_command_1E, $0230, $01D7, $0002
	dw !boss_command_1E, $0204, $01D8, $0002
	dw !boss_command_1E, $015C, $01D8, $0002
	dw !boss_command_1E, $0147, $01D3, $0002
	dw !boss_command_1E, $0129, $01B9, $0002
	dw !boss_command_1E, $0119, $018C, $0002
	dw !boss_command_1E, $0115, $0157, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0116, $017F, $0002
	dw !boss_command_1E, $0117, $01D2, $0002
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0118, $01D5, $0002
	dw !boss_command_1E, $0130, $01D6, $0002
	dw !boss_command_1E, $0140, $01D7, $0002
	dw !boss_command_1E, $0150, $01D8, $0002
	dw !boss_command_1E, $0214, $01D8, $0002
	dw !boss_command_1E, $0221, $01D3, $0002
	dw !boss_command_1E, $023F, $01B9, $0002
	dw !boss_command_1E, $024F, $018C, $0002
	dw !boss_command_1E, $0253, $0157, $0002
	dw !boss_command_1E, $0252, $0157, $0001
	dw !boss_command_23
	dw !boss_command_goto_or_reset, DATA_B6AFE7, DATA_B6AFE7

DATA_B6B115:
	dw !boss_command_1E, $0116, $017F, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0117, $01D2, $0002
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0118, $01D5, $0002
	dw !boss_command_1E, $0130, $01D6, $0002
	dw !boss_command_1E, $0140, $01D7, $0002
	dw !boss_command_1E, $0150, $01D8, $0002
	dw !boss_command_1E, $0214, $01D8, $0002
	dw !boss_command_1E, $0221, $01D3, $0002
	dw !boss_command_1E, $023F, $01B9, $0002
	dw !boss_command_1E, $024F, $018C, $0002
	dw !boss_command_1E, $0253, $0157, $0002
	dw !boss_command_1E, $0252, $0157, $0001
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0257, $017F, $0002
	dw !boss_command_1E, $0255, $01D2, $0002
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0250, $01D5, $0002
	dw !boss_command_1E, $0240, $01D6, $0002
	dw !boss_command_1E, $0230, $01D7, $0002
	dw !boss_command_1E, $0204, $01D8, $0002
	dw !boss_command_1E, $015C, $01D8, $0002
	dw !boss_command_1E, $0147, $01D3, $0002
	dw !boss_command_1E, $0129, $01B9, $0002
	dw !boss_command_1E, $0119, $018C, $0002
	dw !boss_command_1E, $0115, $0157, $0002
	dw !boss_command_23
	dw !boss_command_goto_or_reset, DATA_B6AFE7, DATA_B6AFE7

DATA_B6B1ED:
	dw !boss_command_krow_animation, $0200, $0204
	dw !boss_command_20, DATA_B6B64F
	dw !boss_command_fly_to, $01B0, $06C0, $0003
	dw !boss_command_21, $07BA
	dw !boss_command_24, $912E
	dw !boss_command_22
	dw !boss_command_1C

DATA_B6B20B:
	dw !boss_command_set_pattern, DATA_B6B215
	dw !boss_command_goto_or_reset, DATA_B6B631, DATA_B6B631

DATA_B6B215:
	dw !boss_command_1D, $0004, DATA_B6B677
	dw !boss_command_1F, $056A
	dw !boss_command_goto_or_reset, DATA_B6B23B, DATA_B6B225
DATA_B6B225:
	dw !boss_command_1E, $0107, $0157, $0002
	dw !boss_command_1E, $0108, $0157, $0001
	dw !boss_command_goto_or_reset, DATA_B6B24B, DATA_B6B24B

DATA_B6B23B:
	dw !boss_command_1E, $0259, $0157, $0002
	dw !boss_command_1E, $0258, $0157, $0001

DATA_B6B24B:
	dw !boss_command_animated_wait, $0276, $0200
	dw !boss_command_goto_or_reset, DATA_B6B257, DATA_B6B335

DATA_B6B257:
	dw !boss_command_13
	dw !boss_command_10
	dw !boss_command_1E, $0257, $017F, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0255, $01D2, $0003
	dw !boss_command_11
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0250, $01D5, $0003
	dw !boss_command_1E, $0240, $01D6, $0003
	dw !boss_command_1E, $0230, $01D7, $0003
	dw !boss_command_1E, $0204, $01D8, $0003
	dw !boss_command_1E, $015C, $01D8, $0003
	dw !boss_command_1E, $0147, $01D3, $0003
	dw !boss_command_1E, $0129, $01B9, $0003
	dw !boss_command_1E, $0119, $018C, $0003
	dw !boss_command_1E, $0115, $0157, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0116, $017F, $0002
	dw !boss_command_1E, $0117, $01D2, $0003
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0118, $01D5, $0003
	dw !boss_command_1E, $0130, $01D6, $0003
	dw !boss_command_1E, $0140, $01D7, $0003
	dw !boss_command_1E, $0150, $01D8, $0003
	dw !boss_command_1E, $0214, $01D8, $0003
	dw !boss_command_1E, $0221, $01D3, $0003
	dw !boss_command_1E, $023F, $01B9, $0003
	dw !boss_command_1E, $024F, $018C, $0003
	dw !boss_command_1E, $0253, $0157, $0002
	dw !boss_command_23
	dw !boss_command_fly_to, $01B0, $06C0, $0002
	dw !boss_command_goto_or_reset, DATA_B6B20B, DATA_B6B20B

DATA_B6B335:
	dw !boss_command_13
	dw !boss_command_1E, $0116, $017F, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0117, $01D2, $0003
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0118, $01D5, $0003
	dw !boss_command_1E, $0130, $01D6, $0003
	dw !boss_command_1E, $0140, $01D7, $0003
	dw !boss_command_1E, $0150, $01D8, $0003
	dw !boss_command_1E, $0214, $01D8, $0003
	dw !boss_command_1E, $0221, $01D3, $0003
	dw !boss_command_1E, $023F, $01B9, $0003
	dw !boss_command_1E, $024F, $018C, $0003
	dw !boss_command_1E, $0253, $0157, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_10
	dw !boss_command_1E, $0257, $017F, $0002
	dw !boss_command_1E, $0255, $01D2, $0003
	dw !boss_command_11
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0250, $01D5, $0003
	dw !boss_command_1E, $0240, $01D6, $0003
	dw !boss_command_1E, $0230, $01D7, $0003
	dw !boss_command_1E, $0204, $01D8, $0003
	dw !boss_command_1E, $015C, $01D8, $0003
	dw !boss_command_1E, $0147, $01D3, $0003
	dw !boss_command_1E, $0129, $01B9, $0003
	dw !boss_command_1E, $0119, $018C, $0003
	dw !boss_command_1E, $0115, $0157, $0002
	dw !boss_command_23
	dw !boss_command_fly_to, $01B0, $06C0, $0002
	dw !boss_command_goto_or_reset, DATA_B6B20B, DATA_B6B20B

DATA_B6B413:
	dw !boss_command_krow_animation, $0200, $0204
	dw !boss_command_20, DATA_B6B65D
	dw !boss_command_fly_to, $01B0, $0180, $0003
	dw !boss_command_21, $024A
	dw !boss_command_24, $912C
	dw !boss_command_22
	dw !boss_command_1C

DATA_B6B431:
	dw !boss_command_set_pattern, DATA_B6B43B
	dw !boss_command_goto_or_reset, DATA_B6B631, DATA_B6B631

DATA_B6B43B:
	dw !boss_command_1D, $0005, DATA_B6B683
	dw !boss_command_1F, $0015
	dw !boss_command_goto_or_reset, DATA_B6B461, DATA_B6B44B

DATA_B6B44B:
	dw !boss_command_1E, $0107, $015F, $0002
	dw !boss_command_1E, $0108, $015F, $0001
	dw !boss_command_goto_or_reset, DATA_B6B471, DATA_B6B471

DATA_B6B461:
	dw !boss_command_1E, $0259, $015F, $0002
	dw !boss_command_1E, $0258, $015F, $0001

DATA_B6B471:
	dw !boss_command_animated_wait, $02B2, $0200
	dw !boss_command_goto_or_reset, DATA_B6B47D, DATA_B6B557

DATA_B6B47D:
	dw !boss_command_13
	dw !boss_command_1E, $0257, $017F, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0256, $01D2, $0003
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0250, $01D5, $0004
	dw !boss_command_1E, $0240, $01D6, $0005
	dw !boss_command_1E, $0230, $01D7, $0005
	dw !boss_command_1E, $0204, $01D8, $0005
	dw !boss_command_1E, $015C, $01D8, $0005
	dw !boss_command_1E, $0147, $01D5, $0003
	dw !boss_command_1E, $0129, $01D0, $0003
	dw !boss_command_1E, $0119, $01C0, $0002
	dw !boss_command_1E, $0115, $017F, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0116, $017F, $0002
	dw !boss_command_1E, $0117, $01D2, $0003
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0118, $01D5, $0003
	dw !boss_command_1E, $0130, $01D6, $0004
	dw !boss_command_1E, $0140, $01D7, $0005
	dw !boss_command_1E, $0150, $01D8, $0005
	dw !boss_command_1E, $0214, $01D8, $0005
	dw !boss_command_1E, $0221, $01D5, $0003
	dw !boss_command_1E, $023F, $01D0, $0003
	dw !boss_command_1E, $024F, $01C0, $0002
	dw !boss_command_1E, $0253, $0157, $0002
	dw !boss_command_23
	dw !boss_command_fly_to, $01B0, $0180, $0003
	dw !boss_command_goto_or_reset, DATA_B6B431, DATA_B6B431

DATA_B6B557:
	dw !boss_command_13
	dw !boss_command_1E, $0116, $017F, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0117, $01D2, $0003
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0118, $01D5, $0003
	dw !boss_command_1E, $0130, $01D6, $0004
	dw !boss_command_1E, $0140, $01D7, $0005
	dw !boss_command_1E, $0150, $01D8, $0005
	dw !boss_command_1E, $0214, $01D8, $0005
	dw !boss_command_1E, $0221, $01D5, $0003
	dw !boss_command_1E, $023F, $01D0, $0003
	dw !boss_command_1E, $024F, $01C0, $0002
	dw !boss_command_1E, $0253, $0157, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_1E, $0257, $017F, $0002
	dw !boss_command_1E, $0256, $01D2, $0003
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_1E, $0250, $01D5, $0004
	dw !boss_command_1E, $0240, $01D6, $0005
	dw !boss_command_1E, $0230, $01D7, $0005
	dw !boss_command_1E, $0204, $01D8, $0005
	dw !boss_command_1E, $015C, $01D8, $0005
	dw !boss_command_1E, $0147, $01D5, $0003
	dw !boss_command_1E, $0129, $01D0, $0003
	dw !boss_command_1E, $0119, $01C0, $0002
	dw !boss_command_1E, $0115, $017F, $0002
	dw !boss_command_23
	dw !boss_command_fly_to, $01B0, $0180, $0003
	dw !boss_command_goto_or_reset, DATA_B6B431, DATA_B6B431

DATA_B6B631:
	dw !boss_command_25
	dw !boss_command_animated_wait, $0032, $0200
	dw !boss_command_krow_animation, $0201, $01FA
	dw !boss_command_animated_wait, $003C, $0201
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_goto_or_reset, !null_pointer

;kreepy krow hook spawning array
DATA_B6B64F:
	dw $0003				;how many hooks to spawn
	dw $0128, $0BB0				;positions of hooks
	dw $016C, $0B70
	dw $01B0, $0B30

;kreepy krow hook spawning array
DATA_B6B65D:
	dw $0003				;how many hooks to spawn
	dw $0248, $06B0				;positions of hooks
	dw $0204, $0668
	dw $01C0, $0620

;kreepy krow barrel spawn locations (phase 1)
DATA_B6B66B:
	dw $012E, $0C2D
	dw $01B0, $0C2D
	dw $0237, $0C2D

;kreepy krow barrel spawn locations (phase 2)
DATA_B6B677:
	dw $011D, $0729
	dw $01B0, $074D
	dw $0241, $0729

;kreepy krow barrel spawn locations (phase 3)
DATA_B6B683:
	dw $011D, $01E9
	dw $01B0, $0201
	dw $0241, $01E9

CODE_B6B68F:
	PHB					;$B6B68F  \
	PHK					;$B6B690   |
	PLB					;$B6B691   |
	JSR ($0044,x)				;$B6B692   |
	PLB					;$B6B695   |
	RTL					;$B6B696  /

CODE_B6B697:
	PHB					;$B6B697  \
	PHK					;$B6B698   |
	PLB					;$B6B699   |
	JSR ($0046,x)				;$B6B69A   |
	PLB					;$B6B69D   |
	RTL					;$B6B69E  /

;boss commands
DATA_B6B69F:
	%offset(DATA_B6B6A1, 2)
	dw boss_command_code_00, CODE_B6CC53
	dw boss_command_code_01, boss_command_code_03
	dw boss_command_code_02, boss_command_code_03
	dw boss_command_code_03, CODE_B6CAD7
	dw boss_command_code_04, boss_command_code_03
	dw boss_command_code_05, boss_command_code_03
	dw boss_command_code_06, boss_command_code_03
	dw boss_command_code_07, boss_command_code_03
	dw boss_command_code_08, CODE_B6CA27
	dw boss_command_code_09, boss_command_code_03
	dw boss_command_code_0A, boss_command_code_03
	dw boss_command_code_0B, boss_command_code_03
	dw boss_command_code_0C, CODE_B6CC53
	dw boss_command_code_0D, boss_command_code_03
	dw boss_command_code_0E, boss_command_code_03
	dw boss_command_code_0F, CODE_B6CA27
	dw boss_command_code_10, boss_command_code_03
	dw boss_command_code_11, boss_command_code_03
	dw boss_command_code_12, CODE_B6CC53
	dw boss_command_code_13, boss_command_code_03
	dw boss_command_code_14, boss_command_code_03
	dw boss_command_code_15, boss_command_code_03
	dw boss_command_code_16, boss_command_code_03
	dw boss_command_code_17, boss_command_code_03
	dw boss_command_code_18, boss_command_code_03
	dw boss_command_code_19, boss_command_code_03
	dw boss_command_code_1A, CODE_B6CA27
	dw boss_command_code_1B, boss_command_code_03
	dw boss_command_code_1C, boss_command_code_03
	dw boss_command_code_1D, boss_command_code_03
	dw boss_command_code_1E, CODE_B6CC53
	dw boss_command_code_1F, boss_command_code_03
	dw boss_command_code_20, boss_command_code_03
	dw boss_command_code_21, CODE_B6C50E
	dw boss_command_code_22, boss_command_code_03
	dw boss_command_code_23, boss_command_code_03
	dw boss_command_code_24, boss_command_code_03
	dw boss_command_code_25, boss_command_code_03
	dw boss_command_code_26, CODE_B6CC53
	dw boss_command_code_27, boss_command_code_03
	dw boss_command_code_28, CODE_B6C464
	dw boss_command_code_29, CODE_B6C36C
	dw boss_command_code_2A, CODE_B6C256
	dw boss_command_code_2B, CODE_B6C122
	dw boss_command_code_2C, boss_command_code_03
	dw boss_command_code_2D, boss_command_code_03
	dw boss_command_code_2E, boss_command_code_03
	dw boss_command_code_2F, CODE_B6BF11
	dw boss_command_code_30, boss_command_code_03
	dw boss_command_code_31, boss_command_code_03
	dw boss_command_code_32, boss_command_code_03
	dw boss_command_code_33, boss_command_code_03
	dw boss_command_code_34, boss_command_code_03
	dw boss_command_code_35, CODE_B6C122
	dw boss_command_code_36, CODE_B6C464
	dw boss_command_code_37, CODE_B6BDA4
	dw boss_command_code_38, boss_command_code_03
	dw boss_command_code_39, boss_command_code_03
	dw boss_command_code_3A, CODE_B6BCCF
	dw boss_command_code_3B, CODE_B6BC3E
	dw boss_command_code_3C, boss_command_code_03
	dw boss_command_code_3D, boss_command_code_03
	dw boss_command_code_3E, boss_command_code_03
	dw boss_command_code_3F, boss_command_code_03
	dw boss_command_code_40, CODE_B6BB2B
	dw boss_command_code_41, CODE_B6BAD8
	dw boss_command_code_42, boss_command_code_03
	dw boss_command_code_43, boss_command_code_03
	dw boss_command_code_44, CODE_B6BA3F
	dw boss_command_code_45, boss_command_code_03
	dw boss_command_code_46, boss_command_code_03
	dw boss_command_code_47, boss_command_code_03
	dw boss_command_code_48, CODE_B6B874
	dw boss_command_code_49, boss_command_code_03


boss_command_code_03:
	RTS					;$B6B7C7  /

boss_command_code_49:
	PHY					;$B6B7C8  \
	STZ $44,x				;$B6B7C9   |
	JSR CODE_B6C28F				;$B6B7CB   |
	LDA #$027F				;$B6B7CE   |
	JSL CODE_B9D09B				;$B6B7D1   |
	LDA #$0774				;$B6B7D5   |
	JSL queue_sound_effect			;$B6B7D8   |
	LDA #$0266				;$B6B7DC   |
	JSL set_sprite_animation		;$B6B7DF   |
	LDA.l $000656				;$B6B7E3   |
	STA alternate_sprite			;$B6B7E7   |
	LDA #$0267				;$B6B7E9   |
	JSL CODE_B9D09B				;$B6B7EC   |
	LDA.l DATA_BAC869			;$B6B7F0   |
	STA $000650				;$B6B7F4   |
	JSR CODE_B6D923				;$B6B7F8   |
	LDA #DATA_BAC86B			;$B6B7FB   |
CODE_B6B7FE:					;	   |
	PHA					;$B6B7FE   |
	LDY #$0164				;$B6B7FF   |
	JSL CODE_BB842C				;$B6B802   |
	JSR CODE_B699C5				;$B6B806   |
	PLY					;$B6B809   |
	LDX alternate_sprite			;$B6B80A   |
	LDA $0000,y				;$B6B80C   |
	STA $20,x				;$B6B80F   |
	LDA $0002,y				;$B6B811   |
	STA $26,x				;$B6B814   |
	LDA $0004,y				;$B6B816   |
	STA $42,x				;$B6B819   |
	LDA $0006,y				;$B6B81B   |
	STA $24,x				;$B6B81E   |
	LDA $0008,y				;$B6B820   |
	STA $2A,x				;$B6B823   |
	LDA $000A,y				;$B6B825   |
	STA $44,x				;$B6B828   |
	LDA $000C,y				;$B6B82A   |
	STA $3A,x				;$B6B82D   |
	LDA $12,x				;$B6B82F   |
	AND #$BFFF				;$B6B831   |
	ORA $000E,y				;$B6B834   |
	STA $12,x				;$B6B837   |
	LDA #$0078				;$B6B839   |
	STA $46,x				;$B6B83C   |
	TYA					;$B6B83E   |
	CLC					;$B6B83F   |
	ADC #$0010				;$B6B840   |
	DEC $0650				;$B6B843   |
	BNE CODE_B6B7FE				;$B6B846   |
	PLY					;$B6B848   |
	PHK					;$B6B849   |
	PLB					;$B6B84A   |
	RTS					;$B6B84B  /

boss_command_code_48:
	PHY					;$B6B84C  \
	LDA.l $0006A3				;$B6B84D   |
	AND #$FEFF				;$B6B851   |
	STA $0006A3				;$B6B854   |
	LDA $0000,y				;$B6B858   |
	STA $000727				;$B6B85B   |
	LDA #$0001				;$B6B85F   |
	STA $000729				;$B6B862   |
	LDA $0002,y				;$B6B866   |
	STA $000737				;$B6B869   |
	PLA					;$B6B86D   |
	CLC					;$B6B86E   |
	ADC #$0004				;$B6B86F   |
	TAY					;$B6B872   |
	RTS					;$B6B873  /

CODE_B6B874:
	DEC $0729				;$B6B874  \
	BEQ CODE_B6B87C				;$B6B877   |
	BRL CODE_B6B8BC				;$B6B879  /

CODE_B6B87C:
	JSR CODE_B6C28F				;$B6B87C  \
	LDA #$026F				;$B6B87F   |
	JSL CODE_B9D09B				;$B6B882   |
	LDA #$0264				;$B6B886   |
	JSL set_sprite_animation		;$B6B889   |
	LDA.l $000656				;$B6B88D   |
	STA alternate_sprite			;$B6B891   |
	LDA #$0265				;$B6B893   |
	JSL CODE_B9D09B				;$B6B896   |
	JSR CODE_B6D923				;$B6B89A   |
	LDX $0737				;$B6B89D   |
	LDA $0000,x				;$B6B8A0   |
	STA $000650				;$B6B8A3   |
	INC $0737				;$B6B8A7   |
	INC $0737				;$B6B8AA   |
	LDX #$0000				;$B6B8AD   |
	JSR ($0650,x)				;$B6B8B0   |
	DEC $0727				;$B6B8B3   |
	BNE CODE_B6B8BC				;$B6B8B6   |
	LDX current_sprite			;$B6B8B8   |
	STZ $44,x				;$B6B8BA   |
CODE_B6B8BC:					;	   |
	RTS					;$B6B8BC  /

boss_command_code_47:
	STZ $44,x				;$B6B8BD  \
	PHY					;$B6B8BF   |
	LDA #$0250				;$B6B8C0   |
	JSL set_sprite_animation		;$B6B8C3   |
	LDA #$051A				;$B6B8C7   |
	JSL queue_sound_effect			;$B6B8CA   |
	LDA.l $000656				;$B6B8CE   |
	STA alternate_sprite			;$B6B8D2   |
	LDA #$0251				;$B6B8D4   |
	JSL CODE_B9D09B				;$B6B8D7   |
	LDY #$0142				;$B6B8DB   |
	JSL CODE_BB842C				;$B6B8DE   |
	JSR CODE_B699C5				;$B6B8E2   |
	LDA #$FA00				;$B6B8E5   |
	STA $0020,y				;$B6B8E8   |
	STA $0026,y				;$B6B8EB   |
	LDA #$FF00				;$B6B8EE   |
	STA $0024,y				;$B6B8F1   |
	STA $002A,y				;$B6B8F4   |
	JSR CODE_B6C28F				;$B6B8F7   |
	LDA #$026F				;$B6B8FA   |
	JSL CODE_B9D09B				;$B6B8FD   |
	PLY					;$B6B901   |
	RTS					;$B6B902  /

boss_command_code_46:
	PHY					;$B6B903  \
	LDA.l $000763				;$B6B904   |
	CMP #$0002				;$B6B908   |
	BNE CODE_B6B923				;$B6B90B   |
	LDA #$024D				;$B6B90D   |
	JSL set_sprite_animation		;$B6B910   |
	LDA.l $000656				;$B6B914   |
	STA alternate_sprite			;$B6B918   |
	LDA #$024E				;$B6B91A   |
	JSL CODE_B9D09B				;$B6B91D   |
	BRA CODE_B6B937				;$B6B921  /

CODE_B6B923:
	LDA #$024B				;$B6B923  \
	JSL set_sprite_animation		;$B6B926   |
	LDA.l $000656				;$B6B92A   |
	STA alternate_sprite			;$B6B92E   |
	LDA #$024C				;$B6B930   |
	JSL CODE_B9D09B				;$B6B933   |
CODE_B6B937:					;	   |
	LDX current_sprite			;$B6B937   |
	STZ $44,x				;$B6B939   |
	PLY					;$B6B93B   |
	RTS					;$B6B93C  /

boss_command_code_45:
	LDA $0000,y				;$B6B93D  \
	LDX $075F				;$B6B940   |
	STX alternate_sprite			;$B6B943   |
	STA $2E,x				;$B6B945   |
	LDA $0002,y				;$B6B947   |
	BEQ CODE_B6B953				;$B6B94A   |
	STA $06,x				;$B6B94C   |
	LDA $0004,y				;$B6B94E   |
	STA $0A,x				;$B6B951   |
CODE_B6B953:					;	   |
	JSR CODE_B6B982				;$B6B953   |
	LDX $075B				;$B6B956   |
	JSR CODE_B6B982				;$B6B959   |
	LDA $0008,y				;$B6B95C   |
	BEQ CODE_B6B967				;$B6B95F   |
	PHY					;$B6B961   |
	JSL CODE_B9D09B				;$B6B962   |
	PLY					;$B6B966   |
CODE_B6B967:					;	   |
	LDX $075B				;$B6B967   |
	STX alternate_sprite			;$B6B96A   |
	LDA $000A,y				;$B6B96C   |
	BEQ CODE_B6B977				;$B6B96F   |
	PHY					;$B6B971   |
	JSL CODE_B9D09B				;$B6B972   |
	PLY					;$B6B976   |
CODE_B6B977:					;	   |
	LDX current_sprite			;$B6B977   |
	STZ $44,x				;$B6B979   |
	TYA					;$B6B97B   |
	CLC					;$B6B97C   |
	ADC #$000C				;$B6B97D   |
	TAY					;$B6B980   |
	RTS					;$B6B981  /

CODE_B6B982:
	LDA $12,x				;$B6B982  \
	AND #$BFFF				;$B6B984   |
	ORA $0006,y				;$B6B987   |
	STA $12,x				;$B6B98A   |
	RTS					;$B6B98C  /

DATA_B6B98D:
	db $00, $00, $1E, $00, $2D, $00, $3C, $00

boss_command_code_44:
	PHY					;$B6B995  \
	LDX $0656				;$B6B996   |
	LDA $30,x				;$B6B999   |
	ORA #$0020				;$B6B99B   |
	STA $30,x				;$B6B99E   |
	LDX $0654				;$B6B9A0   |
	STA $30,x				;$B6B9A3   |
	LDA $2E,x				;$B6B9A5   |
	AND #$DFFF				;$B6B9A7   |
	STA $2E,x				;$B6B9AA   |
	LDY active_kong_sprite			;$B6B9AC   |
	LDA $06,x				;$B6B9AF   |
	SEC					;$B6B9B1   |
	SBC $0006,y				;$B6B9B2   |
	BPL CODE_B6B9BB				;$B6B9B5   |
	EOR #$FFFF				;$B6B9B7   |
	INC A					;$B6B9BA   |
CODE_B6B9BB:					;	   |
	PHA					;$B6B9BB   |
	LDA.l $000652				;$B6B9BC   |
	ASL A					;$B6B9C0   |
	TAY					;$B6B9C1   |
	LDA DATA_B6B98D,y			;$B6B9C2   |
	TAY					;$B6B9C5   |
	PLA					;$B6B9C6   |
	JSL CODE_B4BD7C				;$B6B9C7   |
	LDA CPU.divide_result			;$B6B9CB   |
	XBA					;$B6B9CE   |
	AND #$FF00				;$B6B9CF   |
	STA $000650				;$B6B9D2   |
	LDA CPU.divide_remainder		;$B6B9D6   |
	AND #$00FF				;$B6B9D9   |
	ORA $000650				;$B6B9DC   |
	STA $000650				;$B6B9E0   |
	LDA $01,s				;$B6B9E4   |
	TAY					;$B6B9E6   |
	LDA.l $000650				;$B6B9E7   |
	CMP $0000,y				;$B6B9EB   |
	BCC CODE_B6B9F3				;$B6B9EE   |
	LDA $0000,y				;$B6B9F0   |
CODE_B6B9F3:					;	   |
	STA $20,x				;$B6B9F3   |
	LDA $0002,y				;$B6B9F5   |
	STA $24,x				;$B6B9F8   |
	LDA $0004,y				;$B6B9FA   |
	STA $2A,x				;$B6B9FD   |
	LDA $0006,y				;$B6B9FF   |
	STA $000749				;$B6BA02   |
	LDA #$0011				;$B6BA06   |
	STA $000747				;$B6BA09   |
	LDY active_kong_sprite			;$B6BA0D   |
	LDA $06,x				;$B6BA10   |
	CMP $0006,y				;$B6BA12   |
	BCC CODE_B6BA1F				;$B6BA15   |
	LDA $20,x				;$B6BA17   |
	EOR #$FFFF				;$B6BA19   |
	INC A					;$B6BA1C   |
	STA $20,x				;$B6BA1D   |
CODE_B6BA1F:					;	   |
	STZ $26,x				;$B6BA1F   |
	JSR CODE_B6BBAA				;$B6BA21   |
	LDA #$029A				;$B6BA24   |
	JSL set_sprite_animation		;$B6BA27   |
	LDA.l $000656				;$B6BA2B   |
	STA alternate_sprite			;$B6BA2F   |
	LDA #$029B				;$B6BA31   |
	JSL CODE_B9D09B				;$B6BA34   |
	PLA					;$B6BA38   |
	CLC					;$B6BA39   |
	ADC #$0008				;$B6BA3A   |
	TAY					;$B6BA3D   |
	RTS					;$B6BA3E  /

CODE_B6BA3F:
	LDA.l $000747				;$B6BA3F  \
	BEQ CODE_B6BA4A				;$B6BA43   |
	DEC $0747				;$B6BA45   |
	BNE CODE_B6BA93				;$B6BA48   |
CODE_B6BA4A:					;	   |
	LDA.l $000749				;$B6BA4A   |
	JSL CODE_B8CFD4				;$B6BA4E   |
	JSL CODE_B8D5E0				;$B6BA52   |
	LDX current_sprite			;$B6BA56   |
	LDA $0A,x				;$B6BA58   |
	CMP #$0225				;$B6BA5A   |
	BCC CODE_B6BA93				;$B6BA5D   |
	LDA #$056D				;$B6BA5F   |
	JSL queue_sound_effect			;$B6BA62   |
	LDX current_sprite			;$B6BA66   |
	STZ $44,x				;$B6BA68   |
	LDA $2E,x				;$B6BA6A   |
	BIT #$2000				;$B6BA6C   |
	BNE CODE_B6BA93				;$B6BA6F   |
	LDA #$0290				;$B6BA71   |
	JSL set_sprite_animation		;$B6BA74   |
	LDA.l $000656				;$B6BA78   |
	STA alternate_sprite			;$B6BA7C   |
	LDA #$0291				;$B6BA7E   |
	JSL CODE_B9D09B				;$B6BA81   |
	LDY #DATA_FF217A			;$B6BA85   |
	JSL CODE_BB8418				;$B6BA88   |
	LDY #DATA_FF21B4			;$B6BA8C   |
	JSL CODE_BB8418				;$B6BA8F   |
CODE_B6BA93:					;	   |
	JSR CODE_B68D5D				;$B6BA93   |
	RTS					;$B6BA96  /

boss_command_code_42:
	STZ $32,x				;$B6BA97  \
	LDX $0656				;$B6BA99   |
	STZ $32,x				;$B6BA9C   |
	LDX $0654				;$B6BA9E   |
	LDA $2E,x				;$B6BAA1   |
	BIT #$2000				;$B6BAA3   |
	BNE CODE_B6BAB0				;$B6BAA6   |
	ORA #$0100				;$B6BAA8   |
CODE_B6BAAB:					;	   |
	STA $2E,x				;$B6BAAB   |
CODE_B6BAAD:					;	   |
	STZ $44,x				;$B6BAAD   |
	RTS					;$B6BAAF  /

CODE_B6BAB0:
	DEY					;$B6BAB0  \
	DEY					;$B6BAB1   |
	STY $46,x				;$B6BAB2   |
	PLA					;$B6BAB4   |
	PLA					;$B6BAB5   |
	BRA CODE_B6BAAD				;$B6BAB6  /

boss_command_code_43:
	LDA $2E,x				;$B6BAB8  \
	AND #$FEFF				;$B6BABA   |
	BRA CODE_B6BAAB				;$B6BABD  /

boss_command_code_41:
	LDA.l $00074F				;$B6BABF  \
	BEQ CODE_B6BACA				;$B6BAC3   |
	LDA $0002,y				;$B6BAC5   |
	BRA CODE_B6BACD				;$B6BAC8  /

CODE_B6BACA:
	LDA $0000,y				;$B6BACA  \
CODE_B6BACD:					;	   |
	STA $000721				;$B6BACD   |
	TYA					;$B6BAD1   |
	CLC					;$B6BAD2   |
	ADC #$0004				;$B6BAD3   |
	TAY					;$B6BAD6   |
	RTS					;$B6BAD7  /

CODE_B6BAD8:
	LDA.l $000721				;$B6BAD8  \
	BEQ CODE_B6BAE5				;$B6BADC   |
	BMI CODE_B6BAE5				;$B6BADE   |
	DEC $0721				;$B6BAE0   |
	BNE CODE_B6BAEC				;$B6BAE3   |
CODE_B6BAE5:					;	   |
	STZ $0721				;$B6BAE5   |
	STZ $44,x				;$B6BAE8   |
	BRA CODE_B6BAF2				;$B6BAEA  /

CODE_B6BAEC:
	LDA.l $00074F				;$B6BAEC  \
	BEQ CODE_B6BAE5				;$B6BAF0   |
CODE_B6BAF2:					;	   |
	RTS					;$B6BAF2  /

boss_command_code_40:
	PHY					;$B6BAF3  \
	LDA $0000,y				;$B6BAF4   |
	STA $24,x				;$B6BAF7   |
	LDA $0002,y				;$B6BAF9   |
	STA $2A,x				;$B6BAFC   |
	LDA $0004,y				;$B6BAFE   |
	STA $000749				;$B6BB01   |
	STZ $20,x				;$B6BB05   |
	STZ $26,x				;$B6BB07   |
	LDA #$0014				;$B6BB09   |
	STA $000747				;$B6BB0C   |
	LDA #$0292				;$B6BB10   |
	JSL set_sprite_animation		;$B6BB13   |
	LDA.l $000656				;$B6BB17   |
	STA alternate_sprite			;$B6BB1B   |
	LDA #$0293				;$B6BB1D   |
	JSL CODE_B9D09B				;$B6BB20   |
	PLA					;$B6BB24   |
	CLC					;$B6BB25   |
	ADC #$0006				;$B6BB26   |
	TAY					;$B6BB29   |
	RTS					;$B6BB2A  /

CODE_B6BB2B:
	LDA.l $000747				;$B6BB2B  \
	BEQ CODE_B6BB36				;$B6BB2F   |
	DEC $0747				;$B6BB31   |
	BNE CODE_B6BB68				;$B6BB34   |
CODE_B6BB36:					;	   |
	LDA.l $000749				;$B6BB36   |
	JSL CODE_B8CFD4				;$B6BB3A   |
	JSL CODE_B8D5E0				;$B6BB3E   |
	LDX current_sprite			;$B6BB42   |
	LDA $0A,x				;$B6BB44   |
	CMP #$0225				;$B6BB46   |
	BCC CODE_B6BB68				;$B6BB49   |
	STZ $44,x				;$B6BB4B   |
	LDA #$0290				;$B6BB4D   |
	JSL set_sprite_animation		;$B6BB50   |
	LDA #$056D				;$B6BB54   |
	JSL queue_sound_effect			;$B6BB57   |
	LDA.l $000656				;$B6BB5B   |
	STA alternate_sprite			;$B6BB5F   |
	LDA #$0291				;$B6BB61   |
	JSL CODE_B9D09B				;$B6BB64   |
CODE_B6BB68:					;	   |
	JSR CODE_B68D5D				;$B6BB68   |
	RTS					;$B6BB6B  /

boss_command_code_3F:
	PHY					;$B6BB6C  \
	LDA.l $00074F				;$B6BB6D   |
	BEQ CODE_B6BB8E				;$B6BB71   |
	STA current_sprite			;$B6BB73   |
	JSL CODE_B3975C				;$B6BB75   |
	JSL CODE_BB82B8				;$B6BB79   |
	LDX $0654				;$B6BB7D   |
	STX current_sprite			;$B6BB80   |
	LDA.l $00074F				;$B6BB82   |
	CMP $0D7A				;$B6BB86   |
	BNE CODE_B6BB8E				;$B6BB89   |
	STZ $0D7A				;$B6BB8B   |
CODE_B6BB8E:					;	   |
	STZ $074F				;$B6BB8E   |
	LDX $0654				;$B6BB91   |
	STZ $44,x				;$B6BB94   |
	PLY					;$B6BB96   |
	RTS					;$B6BB97  /

boss_command_code_3E:
	LDA $0000,y				;$B6BB98  \
	STA $00074D				;$B6BB9B   |
	INY					;$B6BB9F   |
	INY					;$B6BBA0   |
	STZ $44,x				;$B6BBA1   |
	RTS					;$B6BBA3  /

boss_command_code_3D:
	JSR CODE_B6BBAA				;$B6BBA4  \
	STZ $44,x				;$B6BBA7   |
	RTS					;$B6BBA9  /

CODE_B6BBAA:
	LDY active_kong_sprite			;$B6BBAA  \
	LDA $06,x				;$B6BBAD   |
	CMP $0006,y				;$B6BBAF   |
	BCS CODE_B6BBC0				;$B6BBB2   |
	LDA $12,x				;$B6BBB4   |
	BIT #$4000				;$B6BBB6   |
	BEQ CODE_B6BBCA				;$B6BBB9   |
	JSR CODE_B6BE70				;$B6BBBB   |
	BRA CODE_B6BBCA				;$B6BBBE  /

CODE_B6BBC0:
	LDA $12,x				;$B6BBC0  \
	BIT #$4000				;$B6BBC2   |
	BNE CODE_B6BBCA				;$B6BBC5   |
	JSR CODE_B6BE70				;$B6BBC7   |
CODE_B6BBCA:					;	   |
	RTS					;$B6BBCA  /

boss_command_code_3C:
	PHY					;$B6BBCB  \
	LDA #$0294				;$B6BBCC   |
	JSL set_sprite_animation		;$B6BBCF   |
	LDA.l $000656				;$B6BBD3   |
	STA alternate_sprite			;$B6BBD7   |
	LDA #$0295				;$B6BBD9   |
	JSL CODE_B9D09B				;$B6BBDC   |
	PLY					;$B6BBE0   |
	RTS					;$B6BBE1  /

boss_command_code_3B:
	PHY					;$B6BBE2  \
	LDX $0656				;$B6BBE3   |
	LDA $30,x				;$B6BBE6   |
	ORA #$0020				;$B6BBE8   |
	STA $30,x				;$B6BBEB   |
	LDX $0654				;$B6BBED   |
	STA $30,x				;$B6BBF0   |
	LDA $2E,x				;$B6BBF2   |
	AND #$DFFF				;$B6BBF4   |
	STA $2E,x				;$B6BBF7   |
	LDA $0000,y				;$B6BBF9   |
	STA $00074B				;$B6BBFC   |
	LDA $0002,y				;$B6BC00   |
	STA $24,x				;$B6BC03   |
	LDA $0004,y				;$B6BC05   |
	STA $2A,x				;$B6BC08   |
	LDA $0006,y				;$B6BC0A   |
	STA $000749				;$B6BC0D   |
	LDA #$0014				;$B6BC11   |
	STA $000747				;$B6BC14   |
	STZ $20,x				;$B6BC18   |
	STZ $26,x				;$B6BC1A   |
	LDA $2E,x				;$B6BC1C   |
	BIT #$2000				;$B6BC1E   |
	BNE CODE_B6BC37				;$B6BC21   |
	LDA #$0292				;$B6BC23   |
	JSL set_sprite_animation		;$B6BC26   |
	LDA.l $000656				;$B6BC2A   |
	STA alternate_sprite			;$B6BC2E   |
	LDA #$0293				;$B6BC30   |
	JSL CODE_B9D09B				;$B6BC33   |
CODE_B6BC37:					;	   |
	PLA					;$B6BC37   |
	CLC					;$B6BC38   |
	ADC #$0008				;$B6BC39   |
	TAY					;$B6BC3C   |
	RTS					;$B6BC3D  /

CODE_B6BC3E:
	LDA.l $000747				;$B6BC3E  \
	BEQ CODE_B6BC49				;$B6BC42   |
	DEC $0747				;$B6BC44   |
	BNE CODE_B6BC77				;$B6BC47   |
CODE_B6BC49:					;	   |
	LDA.l $000749				;$B6BC49   |
	JSL CODE_B8CFD4				;$B6BC4D   |
	JSL CODE_B8CF7F				;$B6BC51   |
	LDX current_sprite			;$B6BC55   |
	LDA $0A,x				;$B6BC57   |
	CMP $00074B				;$B6BC59   |
	BCS CODE_B6BC69				;$B6BC5D   |
CODE_B6BC5F:					;	   |
	STZ $44,x				;$B6BC5F   |
	LDA.l $00074B				;$B6BC61   |
	STA $0A,x				;$B6BC65   |
	BRA CODE_B6BC77				;$B6BC67  /

CODE_B6BC69:
	LDA $24,x				;$B6BC69  \
	AND #$FF00				;$B6BC6B   |
	BNE CODE_B6BC77				;$B6BC6E   |
	LDA $24,x				;$B6BC70   |
	CMP #$0080				;$B6BC72   |
	BCC CODE_B6BC5F				;$B6BC75   |
CODE_B6BC77:					;	   |
	JSR CODE_B68D5D				;$B6BC77   |
	RTS					;$B6BC7A  /

boss_command_code_3A:
	PHY					;$B6BC7B  \
	LDA $0000,y				;$B6BC7C   |
	BNE CODE_B6BC8A				;$B6BC7F   |
	LDX active_kong_sprite			;$B6BC81   |
	LDA $06,x				;$B6BC84   |
	LDX current_sprite			;$B6BC86   |
	BRA CODE_B6BC8F				;$B6BC88  /

CODE_B6BC8A:
	CMP #$0001				;$B6BC8A  \
	BEQ CODE_B6BC91				;$B6BC8D   |
CODE_B6BC8F:					;	   |
	STA $06,x				;$B6BC8F   |
CODE_B6BC91:					;	   |
	LDA $0002,y				;$B6BC91   |
	STA $000747				;$B6BC94   |
	LDA $0004,y				;$B6BC98   |
	STA $24,x				;$B6BC9B   |
	LDA $0006,y				;$B6BC9D   |
	STA $2A,x				;$B6BCA0   |
	LDA $0008,y				;$B6BCA2   |
	STA $000749				;$B6BCA5   |
	STZ $20,x				;$B6BCA9   |
	STZ $26,x				;$B6BCAB   |
	LDA $2E,x				;$B6BCAD   |
	BIT #$2000				;$B6BCAF   |
	BNE CODE_B6BCC8				;$B6BCB2   |
	LDA #$028E				;$B6BCB4   |
	JSL set_sprite_animation		;$B6BCB7   |
	LDA.l $000656				;$B6BCBB   |
	STA alternate_sprite			;$B6BCBF   |
	LDA #$028F				;$B6BCC1   |
	JSL CODE_B9D09B				;$B6BCC4   |
CODE_B6BCC8:					;	   |
	PLA					;$B6BCC8   |
	CLC					;$B6BCC9   |
	ADC #$000A				;$B6BCCA   |
	TAY					;$B6BCCD   |
	RTS					;$B6BCCE  /

CODE_B6BCCF:
	LDA.l $000747				;$B6BCCF  \
	BEQ CODE_B6BCE9				;$B6BCD3   |
	DEC $0747				;$B6BCD5   |
	BEQ CODE_B6BCDD				;$B6BCD8   |
	BRL CODE_B6BD6F				;$B6BCDA  /

CODE_B6BCDD:
	LDX current_sprite			;$B6BCDD  \
	JSR CODE_B6BBAA				;$B6BCDF   |
	LDA #$0565				;$B6BCE2   |
	JSL queue_sound_effect			;$B6BCE5   |
CODE_B6BCE9:					;	   |
	LDA.l $000749				;$B6BCE9   |
	JSL CODE_B8CFD4				;$B6BCED   |
	JSL CODE_B8D5E0				;$B6BCF1   |
	LDX current_sprite			;$B6BCF5   |
	LDA $0A,x				;$B6BCF7   |
	CMP #$0225				;$B6BCF9   |
	BCC CODE_B6BD32				;$B6BCFC   |
	STZ $44,x				;$B6BCFE   |
	LDA #$056D				;$B6BD00   |
	JSL queue_sound_effect			;$B6BD03   |
	LDX current_sprite			;$B6BD07   |
	LDA $2E,x				;$B6BD09   |
	BIT #$2000				;$B6BD0B   |
	BNE CODE_B6BD32				;$B6BD0E   |
	LDA #$0290				;$B6BD10   |
	JSL set_sprite_animation		;$B6BD13   |
	LDA.l $000656				;$B6BD17   |
	STA alternate_sprite			;$B6BD1B   |
	LDA #$0291				;$B6BD1D   |
	JSL CODE_B9D09B				;$B6BD20   |
	LDY #DATA_FF217A			;$B6BD24   |
	JSL CODE_BB8418				;$B6BD27   |
	LDY #DATA_FF21B4			;$B6BD2B   |
	JSL CODE_BB8418				;$B6BD2E   |
CODE_B6BD32:					;	   |
	JSL CODE_BCFB58				;$B6BD32   |
	LDA #$0200				;$B6BD36   |
	LDY #$0200				;$B6BD39   |
	JSL CODE_BEBD8E				;$B6BD3C   |
	BCC CODE_B6BD6F				;$B6BD40   |
	LDY $6A					;$B6BD42   |
	LDA $0000,y				;$B6BD44   |
	CMP #$01B8				;$B6BD47   |
	BNE CODE_B6BD6F				;$B6BD4A   |
	LDA $0020,y				;$B6BD4C   |
	BNE CODE_B6BD6F				;$B6BD4F   |
	STY current_sprite			;$B6BD51   |
	JSL CODE_B3975C				;$B6BD53   |
	JSL CODE_BB82B8				;$B6BD57   |
	LDX $0654				;$B6BD5B   |
	STX current_sprite			;$B6BD5E   |
	LDA.l $00074F				;$B6BD60   |
	STZ $074F				;$B6BD64   |
	CMP $0D7A				;$B6BD67   |
	BNE CODE_B6BD6F				;$B6BD6A   |
	STZ $0D7A				;$B6BD6C   |
CODE_B6BD6F:					;	   |
	JSR CODE_B68D5D				;$B6BD6F   |
	RTS					;$B6BD72  /

boss_command_code_38:
	LDA $2E,x				;$B6BD73  \
	ORA #$2000				;$B6BD75   |
CODE_B6BD78:					;	   |
	STA $2E,x				;$B6BD78   |
	STZ $44,x				;$B6BD7A   |
	RTS					;$B6BD7C  /

boss_command_code_39:
	LDA $2E,x				;$B6BD7D  \
	AND #$DFFF				;$B6BD7F   |
	BRA CODE_B6BD78				;$B6BD82  /

boss_command_code_37:
	LDA $0000,y				;$B6BD84  \
	STA $00073F				;$B6BD87   |
	LDA $0002,y				;$B6BD8B   |
	STA $000741				;$B6BD8E   |
	LDA $0004,y				;$B6BD92   |
	STA $000745				;$B6BD95   |
	STA $000743				;$B6BD99   |
	TYA					;$B6BD9D   |
	CLC					;$B6BD9E   |
	ADC #$0006				;$B6BD9F   |
	TAY					;$B6BDA2   |
	RTS					;$B6BDA3  /

CODE_B6BDA4:
	DEC $0743				;$B6BDA4  \
	BNE CODE_B6BDE1				;$B6BDA7   |
	LDA.l $000745				;$B6BDA9   |
	STA $000743				;$B6BDAD   |
	LDY $073F				;$B6BDB1   |
	CPY $0741				;$B6BDB4   |
	BNE CODE_B6BDBF				;$B6BDB7   |
	LDX current_sprite			;$B6BDB9   |
	STZ $44,x				;$B6BDBB   |
	BRA CODE_B6BDE1				;$B6BDBD  /

CODE_B6BDBF:
	LDA $0000,y				;$B6BDBF  \
	LDX current_sprite			;$B6BDC2   |
	JSL CODE_BB8C44				;$B6BDC4   |
	LDX $0656				;$B6BDC8   |
	LDY $073F				;$B6BDCB   |
	LDA $0002,y				;$B6BDCE   |
	JSL CODE_BB8C44				;$B6BDD1   |
	LDA.l $00073F				;$B6BDD5   |
	CLC					;$B6BDD9   |
	ADC #$0004				;$B6BDDA   |
	STA $00073F				;$B6BDDD   |
CODE_B6BDE1:					;	   |
	RTS					;$B6BDE1  /

boss_command_code_36:
	LDA $0919				;$B6BDE2  \
	AND #$0003				;$B6BDE5   |
	BNE CODE_B6BDF6				;$B6BDE8   |
	LDA $091B				;$B6BDEA   |
	CMP #$0100				;$B6BDED   |
	BEQ CODE_B6BDF6				;$B6BDF0   |
	STZ $44,x				;$B6BDF2   |
	BRA CODE_B6BDFD				;$B6BDF4  /

CODE_B6BDF6:
	LDA $0000,y				;$B6BDF6  \
	STA $000721				;$B6BDF9   |
CODE_B6BDFD:					;	   |
	INY					;$B6BDFD   |
	INY					;$B6BDFE   |
	RTS					;$B6BDFF  /

boss_command_code_35:
	LDA $0000,y				;$B6BE00  \
	INY					;$B6BE03   |
	INY					;$B6BE04   |
	PHY					;$B6BE05   |
	STA $00072D				;$B6BE06   |
	BRL CODE_B6C0BC				;$B6BE0A  /

boss_command_code_34:
	PHY					;$B6BE0D  \
	LDY #$7FFF				;$B6BE0E   |
	JSL CODE_808E4F				;$B6BE11   |
	LDX current_sprite			;$B6BE15   |
	BIT #$0001				;$B6BE17   |
	BEQ CODE_B6BE2D				;$B6BE1A   |
CODE_B6BE1C:					;	   |
	LDA $01,s				;$B6BE1C   |
	TAY					;$B6BE1E   |
	LDX active_kong_sprite			;$B6BE1F   |
	LDA $06,x				;$B6BE22   |
	CLC					;$B6BE24   |
	ADC $0000,y				;$B6BE25   |
	CMP #$0278				;$B6BE28   |
	BCC CODE_B6BE3E				;$B6BE2B   |
CODE_B6BE2D:					;	   |
	LDA $01,s				;$B6BE2D   |
	TAY					;$B6BE2F   |
	LDX active_kong_sprite			;$B6BE30   |
	LDA $06,x				;$B6BE33   |
	SEC					;$B6BE35   |
	SBC $0000,y				;$B6BE36   |
	CMP #$012C				;$B6BE39   |
	BCC CODE_B6BE1C				;$B6BE3C   |
CODE_B6BE3E:					;	   |
	LDX current_sprite			;$B6BE3E   |
	STA $06,x				;$B6BE40   |
	LDY $0656				;$B6BE42   |
	STA $0006,y				;$B6BE45   |
	LDY active_kong_sprite			;$B6BE48   |
	LDA $06,x				;$B6BE4B   |
	CMP $0006,y				;$B6BE4D   |
	BCS CODE_B6BE5E				;$B6BE50   |
	LDA $12,x				;$B6BE52   |
	BIT #$4000				;$B6BE54   |
	BEQ CODE_B6BE68				;$B6BE57   |
	JSR CODE_B6BE70				;$B6BE59   |
	BRA CODE_B6BE68				;$B6BE5C  /

CODE_B6BE5E:
	LDA $12,x				;$B6BE5E  \
	BIT #$4000				;$B6BE60   |
	BNE CODE_B6BE68				;$B6BE63   |
	JSR CODE_B6BE70				;$B6BE65   |
CODE_B6BE68:					;	   |
	PLY					;$B6BE68   |
	INY					;$B6BE69   |
	INY					;$B6BE6A   |
	LDX current_sprite			;$B6BE6B   |
	STZ $44,x				;$B6BE6D   |
	RTS					;$B6BE6F  /

CODE_B6BE70:
	LDX $0654				;$B6BE70  \
	JSR CODE_B6BE7D				;$B6BE73   |
	LDX $0656				;$B6BE76   |
	JSR CODE_B6BE7D				;$B6BE79   |
	RTS					;$B6BE7C  /

CODE_B6BE7D:
	LDA $12,x				;$B6BE7D  \
	EOR #$4000				;$B6BE7F   |
	STA $12,x				;$B6BE82   |
	RTS					;$B6BE84  /

boss_command_code_33:
	LDX current_sprite			;$B6BE85  \
	STZ $44,x				;$B6BE87   |
	LDA $0000,y				;$B6BE89   |
	BEQ CODE_B6BEB2				;$B6BE8C   |
	STA $000650				;$B6BE8E   |
	LDA $12,x				;$B6BE92   |
	AND #$CFFF				;$B6BE94   |
	ORA $000650				;$B6BE97   |
	STA $12,x				;$B6BE9B   |
	STZ $1C,x				;$B6BE9D   |
	LDX $0656				;$B6BE9F   |
	LDA $12,x				;$B6BEA2   |
	AND #$CFFF				;$B6BEA4   |
	ORA $000650				;$B6BEA7   |
	STA $12,x				;$B6BEAB   |
	STZ $1C,x				;$B6BEAD   |
CODE_B6BEAF:					;	   |
	INY					;$B6BEAF   |
	INY					;$B6BEB0   |
	RTS					;$B6BEB1  /

CODE_B6BEB2:
	LDA #$C000				;$B6BEB2  \
	STA $1C,x				;$B6BEB5   |
	LDX $0656				;$B6BEB7   |
	STA $1C,x				;$B6BEBA   |
	LDX $072B				;$B6BEBC   |
	BEQ CODE_B6BEAF				;$B6BEBF   |
	STA $1C,x				;$B6BEC1   |
	BRA CODE_B6BEAF				;$B6BEC3  /

boss_command_code_31:
	STZ $4E,x				;$B6BEC5  \
	LDA DATA_B6905F				;$B6BEC7   |
	STA $4C,x				;$B6BECA   |
	STZ $44,x				;$B6BECC   |
	RTS					;$B6BECE  /

CODE_B6BECF:
	LDA $12,x				;$B6BECF  \
	AND #$CFFF				;$B6BED1   |
	ORA #$2000				;$B6BED4   |
	STA $12,x				;$B6BED7   |
	RTS					;$B6BED9  /

boss_command_code_32:
	JSR CODE_B6BECF				;$B6BEDA  \
	STZ $4C,x				;$B6BEDD   |
	STZ $44,x				;$B6BEDF   |
	LDX $0656				;$B6BEE1   |
	JSR CODE_B6BECF				;$B6BEE4   |
	RTS					;$B6BEE7  /

boss_command_code_30:
	STZ $0919				;$B6BEE8  \
	STZ $44,x				;$B6BEEB   |
	RTS					;$B6BEED  /

boss_command_code_2F:
	PHY					;$B6BEEE  \
	LDA.l $0006A3				;$B6BEEF   |
	AND #$FEFF				;$B6BEF3   |
	STA $0006A3				;$B6BEF6   |
	LDA #$0003				;$B6BEFA   |
	STA $000727				;$B6BEFD   |
	LDA #$0001				;$B6BF01   |
	STA $000729				;$B6BF04   |
	LDA #$AA1C				;$B6BF08   |
	STA $000737				;$B6BF0B   |
	PLY					;$B6BF0F   |
	RTS					;$B6BF10  /

CODE_B6BF11:
	DEC $0729				;$B6BF11  \
	BEQ CODE_B6BF19				;$B6BF14   |
	BRL CODE_B6C009				;$B6BF16  /

CODE_B6BF19:
	PHY					;$B6BF19  \
	LDA.l $0006A3				;$B6BF1A   |
	AND #$FEFF				;$B6BF1E   |
	STA $0006A3				;$B6BF21   |
	LDY #$017C				;$B6BF25   |
	JSL CODE_BB842C				;$B6BF28   |
	LDY alternate_sprite			;$B6BF2C   |
	LDX current_sprite			;$B6BF2E   |
	LDA $12,x				;$B6BF30   |
	BIT #$4000				;$B6BF32   |
	BNE CODE_B6BF45				;$B6BF35   |
	LDA #$0100				;$B6BF37   |
	STA $0020,y				;$B6BF3A   |
	LDA $06,x				;$B6BF3D   |
	CLC					;$B6BF3F   |
	ADC #$0028				;$B6BF40   |
	BRA CODE_B6BF51				;$B6BF43  /

CODE_B6BF45:
	LDA #$FF00				;$B6BF45  \
	STA $0020,y				;$B6BF48   |
	LDA $06,x				;$B6BF4B   |
	SEC					;$B6BF4D   |
	SBC #$0028				;$B6BF4E   |
CODE_B6BF51:					;	   |
	STA $0006,y				;$B6BF51   |
	LDA $0A,x				;$B6BF54   |
	CLC					;$B6BF56   |
	ADC #$FFE4				;$B6BF57   |
	STA $000A,y				;$B6BF5A   |
	LDA #$FD80				;$B6BF5D   |
	STA $002A,y				;$B6BF60   |
	LDA #$0004				;$B6BF63   |
	STA $0042,y				;$B6BF66   |
	LDA #$0006				;$B6BF69   |
	STA $0044,y				;$B6BF6C   |
	LDA #$0242				;$B6BF6F   |
	JSL CODE_B9D09B				;$B6BF72   |
	LDA #$0264				;$B6BF76   |
	JSL set_sprite_animation		;$B6BF79   |
	LDA.l $000656				;$B6BF7D   |
	STA alternate_sprite			;$B6BF81   |
	LDA #$0265				;$B6BF83   |
	JSL CODE_B9D09B				;$B6BF86   |
	LDY #$0180				;$B6BF8A   |
	JSL CODE_BB842C				;$B6BF8D   |
	JSR CODE_B699C5				;$B6BF91   |
	LDA $002E,y				;$B6BF94   |
	ORA #$0890				;$B6BF97   |
	STA $002E,y				;$B6BF9A   |
	JSR CODE_B6D923				;$B6BF9D   |
	LDA $12,x				;$B6BFA0   |
	LDX $0737				;$B6BFA2   |
	BIT #$4000				;$B6BFA5   |
	BNE CODE_B6BFB5				;$B6BFA8   |
	LDA $0000,x				;$B6BFAA   |
	STA $0020,y				;$B6BFAD   |
	LDA $0004,x				;$B6BFB0   |
	BRA CODE_B6BFC6				;$B6BFB3  /

CODE_B6BFB5:
	LDA #$0000				;$B6BFB5  \
	SEC					;$B6BFB8   |
	SBC $0000,x				;$B6BFB9   |
	STA $0020,y				;$B6BFBC   |
	LDA #$0000				;$B6BFBF   |
	SEC					;$B6BFC2   |
	SBC $0004,x				;$B6BFC3   |
CODE_B6BFC6:					;	   |
	STA $0026,y				;$B6BFC6   |
	LDA $0008,x				;$B6BFC9   |
	STA $0042,y				;$B6BFCC   |
	LDA $000A,x				;$B6BFCF   |
	STA $0044,y				;$B6BFD2   |
	LDA $0002,x				;$B6BFD5   |
	STA $0024,y				;$B6BFD8   |
	LDA $0006,x				;$B6BFDB   |
	STA $002A,y				;$B6BFDE   |
	LDA $0010,x				;$B6BFE1   |
	STA $000729				;$B6BFE4   |
	LDA $000C,x				;$B6BFE8   |
	STA $0046,y				;$B6BFEB   |
	LDA $000E,x				;$B6BFEE   |
	STA $0048,y				;$B6BFF1   |
	TXA					;$B6BFF4   |
	CLC					;$B6BFF5   |
	ADC #$0012				;$B6BFF6   |
	STA $000737				;$B6BFF9   |
	PLY					;$B6BFFD   |
	PHK					;$B6BFFE   |
	PLB					;$B6BFFF   |
	DEC $0727				;$B6C000   |
	BNE CODE_B6C009				;$B6C003   |
	LDX current_sprite			;$B6C005   |
	STZ $44,x				;$B6C007   |
CODE_B6C009:					;	   |
	RTS					;$B6C009  /

boss_command_code_2E:
	PHY					;$B6C00A  \
	LDA $0000,y				;$B6C00B   |
	CMP #DATA_FF2216			;$B6C00E   |
	BNE CODE_B6C018				;$B6C011   |
	LDY $073B				;$B6C013   |
	BNE CODE_B6C068				;$B6C016   |
CODE_B6C018:					;	   |
	LDA.l $0006A3				;$B6C018   |
	AND #$FEFF				;$B6C01C   |
	STA $0006A3				;$B6C01F   |
	LDY #$017C				;$B6C023   |
	JSL CODE_BB842C				;$B6C026   |
	LDX alternate_sprite			;$B6C02A   |
	LDA $01,s				;$B6C02C   |
	TAY					;$B6C02E   |
	LDA $0002,y				;$B6C02F   |
	CLC					;$B6C032   |
	ADC $0008,y				;$B6C033   |
	STA $06,x				;$B6C036   |
	LDA $0004,y				;$B6C038   |
	CLC					;$B6C03B   |
	ADC $000A,y				;$B6C03C   |
	STA $0A,x				;$B6C03F   |
	LDA #$026F				;$B6C041   |
	JSL CODE_B9D09B				;$B6C044   |
	LDA $01,s				;$B6C048   |
	TAY					;$B6C04A   |
	LDA $0000,y				;$B6C04B   |
	TAY					;$B6C04E   |
	JSL CODE_BB8432				;$B6C04F   |
	LDX alternate_sprite			;$B6C053   |
	LDA $01,s				;$B6C055   |
	TAY					;$B6C057   |
	LDA $0002,y				;$B6C058   |
	STA $06,x				;$B6C05B   |
	LDA $0004,y				;$B6C05D   |
	STA $0A,x				;$B6C060   |
	TYX					;$B6C062   |
	JSR ($0006,x)				;$B6C063   |
	LDX current_sprite			;$B6C066   |
CODE_B6C068:					;	   |
	STZ $44,x				;$B6C068   |
	PLA					;$B6C06A   |
	CLC					;$B6C06B   |
	ADC #$000C				;$B6C06C   |
	TAY					;$B6C06F   |
	RTS					;$B6C070  /

boss_command_code_2D:
	LDA.l $000735				;$B6C071  \
	BNE CODE_B6C07D				;$B6C075   |
	LDA $0000,y				;$B6C077   |
	TAY					;$B6C07A   |
	BRA CODE_B6C07F				;$B6C07B  /

CODE_B6C07D:
	INY					;$B6C07D  \
	INY					;$B6C07E   |
CODE_B6C07F:					;	   |
	STZ $44,x				;$B6C07F   |
	RTS					;$B6C081  /

boss_command_code_2C:
	PHY					;$B6C082  \
	STZ $44,x				;$B6C083   |
	LDX $0735				;$B6C085   |
	BNE CODE_B6C095				;$B6C088   |
	LDA #$0008				;$B6C08A   |
	SEP #$20				;$B6C08D   |
	STA PPU.screen				;$B6C08F   |
	REP #$20				;$B6C092   |
	STP					;$B6C094   |
CODE_B6C095:					;	   |
	STX alternate_sprite			;$B6C095   |
	LDA #$0277				;$B6C097   |
	JSL CODE_B9D09B				;$B6C09A   |
	PLY					;$B6C09E   |
	RTS					;$B6C09F  /

boss_command_code_2B:
	PHY					;$B6C0A0  \
	LDA.l $000652				;$B6C0A1   |
	ASL A					;$B6C0A5   |
	TAY					;$B6C0A6   |
	LDA DATA_B6D0D1,y			;$B6C0A7   |
	LDX level_number			;$B6C0AA   |
	CPX #!level_krocodile_kore		;$B6C0AC   |
	BNE CODE_B6C0B4				;$B6C0AF   |
	LDA DATA_B6D135,y			;$B6C0B1   |
CODE_B6C0B4:					;	   |
	TAY					;$B6C0B4   |
	LDA $0000,y				;$B6C0B5   |
	STA $00072D				;$B6C0B8   |
CODE_B6C0BC:					;	   |
	LDA #$026A				;$B6C0BC   |
	JSL set_sprite_animation		;$B6C0BF   |
	LDA.l $000656				;$B6C0C3   |
	STA alternate_sprite			;$B6C0C7   |
	LDA #$026B				;$B6C0C9   |
	JSL CODE_B9D09B				;$B6C0CC   |
	LDY #$00C8				;$B6C0D0   |
	JSL CODE_BB842C				;$B6C0D3   |
	LDX current_sprite			;$B6C0D7   |
	LDY alternate_sprite			;$B6C0D9   |
	STY $0739				;$B6C0DB   |
	LDA $12,x				;$B6C0DE   |
	AND #$4000				;$B6C0E0   |
	BNE CODE_B6C0ED				;$B6C0E3   |
	LDA $0012,y				;$B6C0E5   |
	AND #$BFFF				;$B6C0E8   |
	BRA CODE_B6C0F3				;$B6C0EB  /

CODE_B6C0ED:
	LDA $0012,y				;$B6C0ED  \
	ORA #$4000				;$B6C0F0   |
CODE_B6C0F3:					;	   |
	STA $0012,y				;$B6C0F3   |
	STA $000650				;$B6C0F6   |
	JSR CODE_B6C44F				;$B6C0FA   |
	PLY					;$B6C0FD   |
	RTS					;$B6C0FE  /

CODE_B6C0FF:
	LDA.l $000739				;$B6C0FF  \
	STA current_sprite			;$B6C103   |
	JSL CODE_BB82B8				;$B6C105   |
	LDA #$0770				;$B6C109   |
	CLC					;$B6C10C   |
	JSL CODE_B3814F				;$B6C10D   |
	LDA #$0476				;$B6C111   |
	CLC					;$B6C114   |
	JSL CODE_B3814F				;$B6C115   |
	LDX $0654				;$B6C119   |
	STX current_sprite			;$B6C11C   |
	STZ $0739				;$B6C11E   |
	RTS					;$B6C121  /

CODE_B6C122:
	DEC $072D				;$B6C122  \
	BEQ CODE_B6C12A				;$B6C125   |
	BRL CODE_B6C1A4				;$B6C127  /

CODE_B6C12A:
	LDA.l $0006A3				;$B6C12A  \
	ORA #$0100				;$B6C12E   |
	STA $0006A3				;$B6C131   |
	LDX current_sprite			;$B6C135   |
	STZ $44,x				;$B6C137   |
	LDA #$025E				;$B6C139   |
	JSL set_sprite_animation		;$B6C13C   |
	LDA.l $000656				;$B6C140   |
	STA alternate_sprite			;$B6C144   |
	LDA #$025F				;$B6C146   |
	JSL CODE_B9D09B				;$B6C149   |
	JSR CODE_B6C0FF				;$B6C14D   |
	BRL CODE_B6C20A				;$B6C150  /

CODE_B6C153:
	LDA.l $0006A3				;$B6C153  \
	ORA #$0100				;$B6C157   |
	STA $0006A3				;$B6C15A   |
	STZ $072D				;$B6C15E   |
	JSR CODE_B6C0FF				;$B6C161   |
	LDY active_kong_sprite			;$B6C164   |
	LDA $0030,y				;$B6C167   |
	BIT #$0080				;$B6C16A   |
	BNE CODE_B6C186				;$B6C16D   |
	LDA #$001F				;$B6C16F   |
	JSL CODE_B8D8BA				;$B6C172   |
	BCS CODE_B6C186				;$B6C176   |
	LDX $0654				;$B6C178   |
	LDA $12,x				;$B6C17B   |
	AND #$4000				;$B6C17D   |
	EOR #$4000				;$B6C180   |
	STA $0A86				;$B6C183   |
CODE_B6C186:					;	   |
	LDA #$026D				;$B6C186   |
	JSL set_sprite_animation		;$B6C189   |
	LDA.l $000656				;$B6C18D   |
	STA alternate_sprite			;$B6C191   |
	LDA #$026E				;$B6C193   |
	JSL CODE_B9D09B				;$B6C196   |
	LDX current_sprite			;$B6C19A   |
	LDA #CODE_B6C20B			;$B6C19C   |
	STA $44,x				;$B6C19F   |
	BRL CODE_B6C20A				;$B6C1A1  /

CODE_B6C1A4:
	LDA #$0770				;$B6C1A4  \
	SEC					;$B6C1A7   |
	JSL CODE_B3814F				;$B6C1A8   |
	LDA #$0476				;$B6C1AC   |
	SEC					;$B6C1AF   |
	JSL CODE_B3814F				;$B6C1B0   |
	LDX current_sprite			;$B6C1B4   |
	LDY active_kong_sprite			;$B6C1B6   |
	LDA $12,x				;$B6C1B9   |
	BIT #$4000				;$B6C1BB   |
	BNE CODE_B6C1CD				;$B6C1BE   |
	LDA $06,x				;$B6C1C0   |
	CLC					;$B6C1C2   |
	ADC #$002A				;$B6C1C3   |
	CMP $0006,y				;$B6C1C6   |
	BCS CODE_B6C153				;$B6C1C9   |
	BRA CODE_B6C1DB				;$B6C1CB  /

CODE_B6C1CD:
	LDA $06,x				;$B6C1CD  \
	SEC					;$B6C1CF   |
	SBC #$002A				;$B6C1D0   |
	CMP $0006,y				;$B6C1D3   |
	BCS CODE_B6C1DB				;$B6C1D6   |
	BRL CODE_B6C153				;$B6C1D8  /

CODE_B6C1DB:
	LDA.l $000652				;$B6C1DB  \
	ASL A					;$B6C1DF   |
	TAY					;$B6C1E0   |
	LDA DATA_B6D0D1,y			;$B6C1E1   |
	LDX level_number			;$B6C1E4   |
	CPX #!level_krocodile_kore		;$B6C1E6   |
	BNE CODE_B6C1EE				;$B6C1E9   |
	LDA DATA_B6D135,y			;$B6C1EB   |
CODE_B6C1EE:					;	   |
	TAY					;$B6C1EE   |
	LDA $0004,y				;$B6C1EF   |
	PHY					;$B6C1F2   |
	TAY					;$B6C1F3   |
	JSL CODE_808E4F				;$B6C1F4   |
	BPL CODE_B6C200				;$B6C1F8   |
	TYA					;$B6C1FA   |
	EOR #$FFFF				;$B6C1FB   |
	INC A					;$B6C1FE   |
	TAY					;$B6C1FF   |
CODE_B6C200:					;	   |
	TYA					;$B6C200   |
	PLY					;$B6C201   |
	CLC					;$B6C202   |
	ADC $0002,y				;$B6C203   |
	JSL CODE_B3E3AF				;$B6C206   |
CODE_B6C20A:					;	   |
	RTS					;$B6C20A  /

CODE_B6C20B:
	RTS					;$B6C20B  /

boss_command_code_2A:
	PHY					;$B6C20C  \
	LDA.l $0006A3				;$B6C20D   |
	AND #$FEFF				;$B6C211   |
	STA $0006A3				;$B6C214   |
	LDA.l $000652				;$B6C218   |
	TAY					;$B6C21C   |
	JSR CODE_B6D923				;$B6C21D   |
	LDA.w DATA_BAAD14,y			;$B6C220   |
	AND #$00FF				;$B6C223   |
	STA $000727				;$B6C226   |
	LDA #$0001				;$B6C22A   |
	STA $000729				;$B6C22D   |
	LDA.l $000652				;$B6C231   |
	ASL A					;$B6C235   |
	TAY					;$B6C236   |
	LDA.w DATA_BAAD1E,y			;$B6C237   |
	STA $000737				;$B6C23A   |
	PHK					;$B6C23E   |
	PLB					;$B6C23F   |
	PLY					;$B6C240   |
	RTS					;$B6C241  /

;k rool projectile type to use for each phase (these are pointers to code)
DATA_B6C242:
	dw !null_pointer
	dw CODE_B69877
	dw CODE_B69917
	dw CODE_B697FC
	dw CODE_B69747
	dw CODE_B696B5
	dw CODE_B695ED
	dw CODE_B69572
	dw CODE_B694F3
	dw CODE_B6949C

CODE_B6C256:
	DEC $0729				;$B6C256  \
	BEQ CODE_B6C25E				;$B6C259   |
	BRL CODE_B6C28E				;$B6C25B   |
CODE_B6C25E:					;	   |
	JSR CODE_B6C28F				;$B6C25E   |
	LDA #$027F				;$B6C261   |
	JSL CODE_B9D09B				;$B6C264   |
	LDA #$0264				;$B6C268   |
	JSL set_sprite_animation		;$B6C26B   |
	LDA.l $000656				;$B6C26F   |
	STA alternate_sprite			;$B6C273   |
	LDA #$0265				;$B6C275   |
	JSL CODE_B9D09B				;$B6C278   |
	LDA.l $000652				;$B6C27C   |
	ASL A					;$B6C280   |
	TAX					;$B6C281   |
	JSR (DATA_B6C242,x)			;$B6C282   |
	DEC $0727				;$B6C285   |
	BNE CODE_B6C28E				;$B6C288   |
	LDX current_sprite			;$B6C28A   |
	STZ $44,x				;$B6C28C   |
CODE_B6C28E:					;	   |
	RTS					;$B6C28E  /

CODE_B6C28F:
	LDY #$017C				;$B6C28F  \
	JSL CODE_BB842C				;$B6C292   |
	LDY alternate_sprite			;$B6C296   |
	LDX current_sprite			;$B6C298   |
	LDA $12,x				;$B6C29A   |
	BIT #$4000				;$B6C29C   |
	BNE CODE_B6C2AF				;$B6C29F   |
	LDA #$0100				;$B6C2A1   |
	STA $0020,y				;$B6C2A4   |
	LDA $06,x				;$B6C2A7   |
	CLC					;$B6C2A9   |
	ADC #$0028				;$B6C2AA   |
	BRA CODE_B6C2BB				;$B6C2AD  /

CODE_B6C2AF:
	LDA #$FF00				;$B6C2AF  \
	STA $0020,y				;$B6C2B2   |
	LDA $06,x				;$B6C2B5   |
	SEC					;$B6C2B7   |
	SBC #$0028				;$B6C2B8   |
CODE_B6C2BB:					;	   |
	STA $0006,y				;$B6C2BB   |
	LDA $0A,x				;$B6C2BE   |
	CLC					;$B6C2C0   |
	ADC #$FFE4				;$B6C2C1   |
	STA $000A,y				;$B6C2C4   |
	LDA #$FE80				;$B6C2C7   |
	STA $002A,y				;$B6C2CA   |
	LDA #$0004				;$B6C2CD   |
	STA $0042,y				;$B6C2D0   |
	LDA #$0006				;$B6C2D3   |
	STA $0044,y				;$B6C2D6   |
	RTS					;$B6C2D9  /

boss_command_code_29:
	PHY					;$B6C2DA  \
	STZ $24,x				;$B6C2DB   |
	STZ $2A,x				;$B6C2DD   |
	LDA $0002,y				;$B6C2DF   |
	STA $000723				;$B6C2E2   |
	LDA $12,x				;$B6C2E6   |
	BIT #$4000				;$B6C2E8   |
	BNE CODE_B6C2FE				;$B6C2EB   |
	LDA #$0240				;$B6C2ED   |
	STA $000725				;$B6C2F0   |
	LDA #$0081				;$B6C2F4   |
	STA $20,x				;$B6C2F7   |
	LDA $0000,y				;$B6C2F9   |
	BRA CODE_B6C311				;$B6C2FC  /

CODE_B6C2FE:
	LDA #$015A				;$B6C2FE  \
	STA $000725				;$B6C301   |
	LDA #$FF7F				;$B6C305   |
	STA $20,x				;$B6C308   |
	LDA #$0000				;$B6C30A   |
	SEC					;$B6C30D   |
	SBC $0000,y				;$B6C30E   |
CODE_B6C311:					;	   |
	STA $26,x				;$B6C311   |
	LDA #$0012				;$B6C313   |
	STA $000721				;$B6C316   |
	LDA #$0260				;$B6C31A   |
	JSL set_sprite_animation		;$B6C31D   |
	LDA.l $000656				;$B6C321   |
	STA alternate_sprite			;$B6C325   |
	LDA #$0261				;$B6C327   |
	JSL CODE_B9D09B				;$B6C32A   |
	LDY #$00C6				;$B6C32E   |
	JSL CODE_BB842C				;$B6C331   |
	LDX current_sprite			;$B6C335   |
	LDY alternate_sprite			;$B6C337   |
	STY $072B				;$B6C339   |
	LDA #$0000				;$B6C33C   |
	STA $0042,y				;$B6C33F   |
	LDA $12,x				;$B6C342   |
	AND #$4000				;$B6C344   |
	BEQ CODE_B6C351				;$B6C347   |
	LDA $0012,y				;$B6C349   |
	AND #$BFFF				;$B6C34C   |
	BRA CODE_B6C357				;$B6C34F  /

CODE_B6C351:
	LDA $0012,y				;$B6C351  \
	ORA #$4000				;$B6C354   |
CODE_B6C357:					;	   |
	STA $0012,y				;$B6C357   |
	STA $000650				;$B6C35A   |
	LDA #$000A				;$B6C35E   |
	STA $00072F				;$B6C361   |
	PLA					;$B6C365   |
	CLC					;$B6C366   |
	ADC #$0004				;$B6C367   |
	TAY					;$B6C36A   |
	RTS					;$B6C36B  /

CODE_B6C36C:
	LDX current_sprite			;$B6C36C  \
	LDA.l $000721				;$B6C36E   |
	BEQ CODE_B6C389				;$B6C372   |
	DEC $0721				;$B6C374   |
	BNE CODE_B6C386				;$B6C377   |
	LDY $0654				;$B6C379   |
	LDX $072B				;$B6C37C   |
	LDA $001C,y				;$B6C37F   |
	STA $1C,x				;$B6C382   |
	BRA CODE_B6C389				;$B6C384  /

CODE_B6C386:
	BRL CODE_B6C435				;$B6C386  /

CODE_B6C389:
	LDA.l $000723				;$B6C389  \
	JSL CODE_B8D010				;$B6C38D   |
	JSL CODE_B8CF7F				;$B6C391   |
	LDX current_sprite			;$B6C395   |
	LDY $06,x				;$B6C397   |
	LDA $20,x				;$B6C399   |
	BMI CODE_B6C3A9				;$B6C39B   |
	CMP #$0080				;$B6C39D   |
	BCC CODE_B6C3BE				;$B6C3A0   |
	CPY $0725				;$B6C3A2   |
	BCC CODE_B6C3FC				;$B6C3A5   |
	BRA CODE_B6C3B3				;$B6C3A7  /

CODE_B6C3A9:
	CMP #$FF80				;$B6C3A9  \
	BCS CODE_B6C3BE				;$B6C3AC   |
	CPY $0725				;$B6C3AE   |
	BCS CODE_B6C3FC				;$B6C3B1   |
CODE_B6C3B3:					;	   |
	STZ $26,x				;$B6C3B3   |
	LDA #$000A				;$B6C3B5   |
	STA $000723				;$B6C3B8   |
	BRA CODE_B6C435				;$B6C3BC  /

CODE_B6C3BE:
	STZ $20,x				;$B6C3BE  \
	STZ $04,x				;$B6C3C0   |
	STZ $44,x				;$B6C3C2   |
	LDX $072B				;$B6C3C4   |
	STX current_sprite			;$B6C3C7   |
	JSL CODE_BB82B8				;$B6C3C9   |
	LDA.l $000654				;$B6C3CD   |
	STA current_sprite			;$B6C3D1   |
	STZ $072B				;$B6C3D3   |
	LDA.l $000654				;$B6C3D6   |
	STA alternate_sprite			;$B6C3DA   |
	LDA #$0262				;$B6C3DC   |
	JSL CODE_B9D09B				;$B6C3DF   |
	LDA.l $000656				;$B6C3E3   |
	STA alternate_sprite			;$B6C3E7   |
	LDA #$0263				;$B6C3E9   |
	JSL CODE_B9D09B				;$B6C3EC   |
	LDA #$076C				;$B6C3F0   |
	CLC					;$B6C3F3   |
	JSL CODE_B3814F				;$B6C3F4   |
	LDX current_sprite			;$B6C3F8   |
	BRA CODE_B6C435				;$B6C3FA  /

CODE_B6C3FC:
	LDA #$076C				;$B6C3FC  \
	SEC					;$B6C3FF   |
	JSL CODE_B3814F				;$B6C400   |
	LDX current_sprite			;$B6C404   |
	DEC $072F				;$B6C406   |
	BNE CODE_B6C435				;$B6C409   |
	LDA #$000F				;$B6C40B   |
	STA $00072F				;$B6C40E   |
	LDA $12,x				;$B6C412   |
	BIT #$4000				;$B6C414   |
	BNE CODE_B6C41E				;$B6C417   |
	LDY #DATA_FF214A			;$B6C419   |
	BRA CODE_B6C421				;$B6C41C  /

CODE_B6C41E:
	LDY #DATA_FF2162			;$B6C41E  \
CODE_B6C421:					;	   |
	JSL CODE_BB8418				;$B6C421   |
	LDY alternate_sprite			;$B6C425   |
	LDX current_sprite			;$B6C427   |
	LDA $20,x				;$B6C429   |
	BPL CODE_B6C431				;$B6C42B   |
	SEC					;$B6C42D   |
	ROR A					;$B6C42E   |
	BRA CODE_B6C432				;$B6C42F  /

CODE_B6C431:
	LSR A					;$B6C431  \
CODE_B6C432:					;	   |
	STA $0020,y				;$B6C432   |
CODE_B6C435:					;	   |
	LDY $0656				;$B6C435   |
	JSR CODE_B6C44F				;$B6C438   |
	LDY $072B				;$B6C43B   |
	BEQ CODE_B6C44E				;$B6C43E   |
	LDA $06,x				;$B6C440   |
	STA $0006,y				;$B6C442   |
	LDA $0A,x				;$B6C445   |
	CLC					;$B6C447   |
	ADC $0042,y				;$B6C448   |
	STA $000A,y				;$B6C44B   |
CODE_B6C44E:					;	   |
	RTS					;$B6C44E  /

CODE_B6C44F:
	LDA $06,x				;$B6C44F  \
	STA $0006,y				;$B6C451   |
	LDA $0A,x				;$B6C454   |
	STA $000A,y				;$B6C456   |
	RTS					;$B6C459  /

boss_command_code_28:
	LDA $0000,y				;$B6C45A  \
	STA $000721				;$B6C45D   |
	INY					;$B6C461   |
	INY					;$B6C462   |
	RTS					;$B6C463  /

CODE_B6C464:
	LDA.l $000721				;$B6C464  \
	BEQ CODE_B6C471				;$B6C468   |
	BMI CODE_B6C471				;$B6C46A   |
	DEC $0721				;$B6C46C   |
	BNE CODE_B6C473				;$B6C46F   |
CODE_B6C471:					;	   |
	STZ $44,x				;$B6C471   |
CODE_B6C473:					;	   |
	RTS					;$B6C473  /

boss_command_code_26:
	PHY					;$B6C474  \
	JSR CODE_B6C59D				;$B6C475   |
	STA $4A,x				;$B6C478   |
	LDA.l $000652				;$B6C47A   |
	ASL A					;$B6C47E   |
	CLC					;$B6C47F   |
	ADC $0004,y				;$B6C480   |
	TAY					;$B6C483   |
	LDA $0000,y				;$B6C484   |
	BRL CODE_B6CB9D				;$B6C487  /

boss_command_code_27:
	PHY					;$B6C48A  \
	LDA $0000,y				;$B6C48B   |
	BNE CODE_B6C49D				;$B6C48E   |
	LDA $12,x				;$B6C490   |
	BIT #$4000				;$B6C492   |
	BEQ CODE_B6C4A8				;$B6C495   |
	JSL CODE_BA9480				;$B6C497   |
	BRA CODE_B6C4A8				;$B6C49B  /

CODE_B6C49D:
	LDA $12,x				;$B6C49D  \
	BIT #$4000				;$B6C49F   |
	BNE CODE_B6C4A8				;$B6C4A2   |
	JSL CODE_BA9480				;$B6C4A4   |
CODE_B6C4A8:					;	   |
	STZ $44,x				;$B6C4A8   |
	PLY					;$B6C4AA   |
	INY					;$B6C4AB   |
	INY					;$B6C4AC   |
	RTS					;$B6C4AD  /

boss_command_code_25:
	PHY					;$B6C4AE  \
	LDY active_kong_sprite			;$B6C4AF   |
	LDA $06,x				;$B6C4B2   |
	CMP $0006,y				;$B6C4B4   |
	BCS CODE_B6C4C5				;$B6C4B7   |
	LDA $12,x				;$B6C4B9   |
	BIT #$4000				;$B6C4BB   |
	BEQ CODE_B6C4CF				;$B6C4BE   |
	JSR CODE_B6CB2E				;$B6C4C0   |
	BRA CODE_B6C4CF				;$B6C4C3  /

CODE_B6C4C5:
	LDA $12,x				;$B6C4C5  \
	BIT #$4000				;$B6C4C7   |
	BNE CODE_B6C4CF				;$B6C4CA   |
	JSR CODE_B6CB2E				;$B6C4CC   |
CODE_B6C4CF:					;	   |
	STZ $44,x				;$B6C4CF   |
	PLY					;$B6C4D1   |
	RTS					;$B6C4D2  /

boss_command_code_24:
	PHB					;$B6C4D3  \
	LDX $0000,y				;$B6C4D4   |
	PHK					;$B6C4D7   |
	LDA #$7E00				;$B6C4D8   |
	PHA					;$B6C4DB   |
	PLB					;$B6C4DC   |
	PLB					;$B6C4DD   |
	LDA $0000,x				;$B6C4DE   |
	ORA #$0020				;$B6C4E1   |
	STA $0000,x				;$B6C4E4   |
	PLB					;$B6C4E7   |
	LDX $0654				;$B6C4E8   |
	STZ $44,x				;$B6C4EB   |
	INY					;$B6C4ED   |
	INY					;$B6C4EE   |
	PLB					;$B6C4EF   |
	RTS					;$B6C4F0  /

boss_command_code_23:
	PHY					;$B6C4F1  \
	LDY $0707				;$B6C4F2   |
	BEQ CODE_B6C500				;$B6C4F5   |
	LDA #$0200				;$B6C4F7   |
	STA $0032,y				;$B6C4FA   |
	STZ $0707				;$B6C4FD   |
CODE_B6C500:					;	   |
	STZ $44,x				;$B6C500   |
	PLY					;$B6C502   |
	RTS					;$B6C503  /

boss_command_code_21:
	LDA $0000,y				;$B6C504  \
	STA $000705				;$B6C507   |
	INY					;$B6C50B   |
	INY					;$B6C50C   |
	RTS					;$B6C50D  /

CODE_B6C50E:
	LDY active_kong_sprite			;$B6C50E  \
	LDA.l $000705				;$B6C511   |
	CMP $000A,y				;$B6C515   |
	BCC CODE_B6C51E				;$B6C518   |
	LDX current_sprite			;$B6C51A   |
	STZ $44,x				;$B6C51C   |
CODE_B6C51E:					;	   |
	RTS					;$B6C51E  /

boss_command_code_22:
	LDX current_sprite			;$B6C51F  \
	LDA $2E,x				;$B6C521   |
	ORA #$2000				;$B6C523   |
	STA $2E,x				;$B6C526   |
	STZ $44,x				;$B6C528   |
	RTS					;$B6C52A  /

boss_command_code_20:
	LDA.l $000652				;$B6C52B  \
	CMP #$0001				;$B6C52F   |
	BCS CODE_B6C537				;$B6C532   |
	BRL CODE_B6C58C				;$B6C534  /

CODE_B6C537:
	PHY					;$B6C537  \
	LDA $0000,y				;$B6C538   |
	TAY					;$B6C53B   |
	LDA $0000,y				;$B6C53C   |
	STA $000650				;$B6C53F   |
CODE_B6C543:					;	   |
	PHY					;$B6C543   |
	LDY #DATA_FF1DC8			;$B6C544   |
	JSL CODE_BB8418				;$B6C547   |
	PLY					;$B6C54B   |
	LDX alternate_sprite			;$B6C54C   |
	STZ $4E,x				;$B6C54E   |
	LDA $0002,y				;$B6C550   |
	STA $06,x				;$B6C553   |
	LDA $17C0				;$B6C555   |
	SEC					;$B6C558   |
	SBC #$0040				;$B6C559   |
	STA $0A,x				;$B6C55C   |
	LDA $0004,y				;$B6C55E   |
	STA $46,x				;$B6C561   |
	LDA $12,x				;$B6C563   |
	AND #$CFFF				;$B6C565   |
	ORA #$3000				;$B6C568   |
	STA $12,x				;$B6C56B   |
	INY					;$B6C56D   |
	INY					;$B6C56E   |
	INY					;$B6C56F   |
	INY					;$B6C570   |
	STZ $44,x				;$B6C571   |
	DEC $0650				;$B6C573   |
	BNE CODE_B6C543				;$B6C576   |
	LDX $0654				;$B6C578   |
	LDA $2E,x				;$B6C57B   |
	AND #$DFFF				;$B6C57D   |
	STA $2E,x				;$B6C580   |
	LDA #$0566				;$B6C582   |
	JSL queue_sound_effect			;$B6C585   |
	LDX current_sprite			;$B6C589   |
	PLY					;$B6C58B   |
CODE_B6C58C:					;	   |
	STZ $44,x				;$B6C58C   |
	INY					;$B6C58E   |
	INY					;$B6C58F   |
	RTS					;$B6C590  /

boss_command_code_1F:
	LDA $0000,y				;$B6C591  \
	STA $0006FF				;$B6C594   |
	STZ $44,x				;$B6C598   |
	INY					;$B6C59A   |
	INY					;$B6C59B   |
	RTS					;$B6C59C  /

CODE_B6C59D:
	LDX current_sprite			;$B6C59D  \
	LDA $2E,x				;$B6C59F   |
	ORA #$0040				;$B6C5A1   |
	STA $2E,x				;$B6C5A4   |
	LDA $0000,y				;$B6C5A6   |
	STA $48,x				;$B6C5A9   |
	LDA $0002,y				;$B6C5AB   |
	RTS					;$B6C5AE  /

boss_command_code_1E:
	PHY					;$B6C5AF  \
	JSR CODE_B6C59D				;$B6C5B0   |
	CLC					;$B6C5B3   |
	ADC $0006FF				;$B6C5B4   |
	BRL CODE_B6CB89				;$B6C5B8  /

boss_command_code_1D:
	LDX current_sprite			;$B6C5BB  \
	LDA $2E,x				;$B6C5BD   |
	ORA #$0001				;$B6C5BF   |
	STA $2E,x				;$B6C5C2   |
	PHX					;$B6C5C4   |
	LDA.l $000652				;$B6C5C5   |
	DEC A					;$B6C5C9   |
	ASL A					;$B6C5CA   |
	ASL A					;$B6C5CB   |
	TAX					;$B6C5CC   |
	PHB					;$B6C5CD   |
	%pea_mask_dbr(DATA_BAA0E0)		;$B6C5CE   |
	PLB					;$B6C5D1   |
	PLB					;$B6C5D2   |
	LDA.w DATA_BAA0E0,x			;$B6C5D3   |
	STA $0006F3				;$B6C5D6   |
	LDA.w DATA_BAA0E2,x			;$B6C5DA   |
	STA $0006F7				;$B6C5DD   |
	PLB					;$B6C5E1   |
	PLX					;$B6C5E2   |
	STZ $06FB				;$B6C5E3   |
	LDA $0000,y				;$B6C5E6   |
	STA $0006F9				;$B6C5E9   |
	LDA $0002,y				;$B6C5ED   |
	STA $0006FD				;$B6C5F0   |
	STZ $06F5				;$B6C5F4   |
	STZ $0658				;$B6C5F7   |
	STZ $44,x				;$B6C5FA   |
	TYA					;$B6C5FC   |
	CLC					;$B6C5FD   |
	ADC #$0004				;$B6C5FE   |
	TAY					;$B6C601   |
	RTS					;$B6C602  /

boss_command_code_19:
	PHY					;$B6C603  \
	LDX current_sprite			;$B6C604   |
	LDA $2E,x				;$B6C606   |
	ORA #$0020				;$B6C608   |
	STA $2E,x				;$B6C60B   |
	LDA $0000,y				;$B6C60D   |
	STA $10,x				;$B6C610   |
	STA $52,x				;$B6C612   |
	LDA $0002,y				;$B6C614   |
	STA $54,x				;$B6C617   |
	STZ $44,x				;$B6C619   |
	LDA $06,x				;$B6C61B   |
	STA $000660				;$B6C61D   |
	LDA $0A,x				;$B6C621   |
	STA $000662				;$B6C623   |
	LDA #$0004				;$B6C627   |
	STA $0006CF				;$B6C62A   |
	PLA					;$B6C62E   |
	CLC					;$B6C62F   |
	ADC #$0004				;$B6C630   |
	TAY					;$B6C633   |
	RTS					;$B6C634  /

boss_command_code_18:
	LDA.l $0006A1				;$B6C635  \
	AND #$7FFF				;$B6C639   |
	STA $0006A1				;$B6C63C   |
	STZ $44,x				;$B6C640   |
	RTS					;$B6C642  /

boss_command_code_1C:
	LDA $2E,x				;$B6C643  \
	AND #$FDFF				;$B6C645   |
	STA $2E,x				;$B6C648   |
	STZ $04,x				;$B6C64A   |
	STZ $44,x				;$B6C64C   |
	RTS					;$B6C64E  /

boss_command_code_17:
	PHY					;$B6C64F  \
	JSR CODE_B6F8F3				;$B6C650   |
	STZ $44,x				;$B6C653   |
	PLY					;$B6C655   |
	RTS					;$B6C656  /

boss_command_code_16:
	PHY					;$B6C657  \
	PHX					;$B6C658   |
	LDA #$0402				;$B6C659   |
	JSL queue_sound_effect			;$B6C65C   |
	LDY #$0016				;$B6C660   |
	JSL CODE_BB842C				;$B6C663   |
	PLX					;$B6C667   |
	LDY alternate_sprite			;$B6C668   |
	STY $0E,x				;$B6C66A   |
	LDA #$0000				;$B6C66C   |
	STA $0042,y				;$B6C66F   |
	LDA $06,x				;$B6C672   |
	CLC					;$B6C674   |
	ADC #$0014				;$B6C675   |
	STA $0006,y				;$B6C678   |
	LDA $0A,x				;$B6C67B   |
	CLC					;$B6C67D   |
	ADC #$FFB3				;$B6C67E   |
	STA $000A,y				;$B6C681   |
	STZ $44,x				;$B6C684   |
	TYX					;$B6C686   |
	INC $02,x				;$B6C687   |
	PLY					;$B6C689   |
	RTS					;$B6C68A  /

boss_command_code_15:
	STY $CE					;$B6C68B  \
	PHY					;$B6C68D   |
	SEP #$20				;$B6C68E   |
	PHK					;$B6C690   |
	PLA					;$B6C691   |
	STA $D0					;$B6C692   |
	REP #$20				;$B6C694   |
	PHX					;$B6C696   |
	LDY.w #DATA_FF103A			;$B6C697   |
	JSL CODE_BB8432				;$B6C69A   |
	LDY alternate_sprite			;$B6C69E   |
	PLX					;$B6C6A0   |
	LDA $06,x				;$B6C6A1   |
	CLC					;$B6C6A3   |
	ADC [$CE]				;$B6C6A4   |
	STA $0006,y				;$B6C6A6   |
	INC $CE					;$B6C6A9   |
	INC $CE					;$B6C6AB   |
	LDA $0A,x				;$B6C6AD   |
	CLC					;$B6C6AF   |
	ADC [$CE]				;$B6C6B0   |
	STA $000A,y				;$B6C6B2   |
	STZ $44,x				;$B6C6B5   |
	PLA					;$B6C6B7   |
	CLC					;$B6C6B8   |
	ADC #$0004				;$B6C6B9   |
	TAY					;$B6C6BC   |
	RTS					;$B6C6BD  /

boss_command_code_13:
	LDA $2E,x				;$B6C6BE  \
	EOR #$0010				;$B6C6C0   |
	STA $2E,x				;$B6C6C3   |
	STZ $44,x				;$B6C6C5   |
	RTS					;$B6C6C7  /

boss_command_code_10:
	LDA $2E,x				;$B6C6C8  \
	ORA #$0008				;$B6C6CA   |
	STA $2E,x				;$B6C6CD   |
	STZ $44,x				;$B6C6CF   |
	RTS					;$B6C6D1  /

boss_command_code_11:
	LDA $2E,x				;$B6C6D2  \
	AND #$FFF7				;$B6C6D4   |
	STA $2E,x				;$B6C6D7   |
	STZ $44,x				;$B6C6D9   |
	RTS					;$B6C6DB  /

boss_command_code_0E:
	PHY					;$B6C6DC  \
	LDA $2E,x				;$B6C6DD   |
	ORA #$0001				;$B6C6DF   |
	STA $2E,x				;$B6C6E2   |
	LDA #$0001				;$B6C6E4   |
	STA $000658				;$B6C6E7   |
	STZ $44,x				;$B6C6EB   |
	PLY					;$B6C6ED   |
	RTS					;$B6C6EE  /

boss_command_code_0C:
	LDX current_sprite			;$B6C6EF  \
	PHY					;$B6C6F1   |
	LDA $0000,y				;$B6C6F2   |
	BNE CODE_B6C704				;$B6C6F5   |
	LDA.l $000652				;$B6C6F7   |
	ASL A					;$B6C6FB   |
	TAY					;$B6C6FC   |
	LDA DATA_B6FE24,y			;$B6C6FD   |
	TAY					;$B6C700   |
	LDA $0006,y				;$B6C701   |
CODE_B6C704:					;	   |
	STA $2C,x				;$B6C704   |
	LDA $2E,x				;$B6C706   |
	BIT #$0010				;$B6C708   |
	BEQ CODE_B6C718				;$B6C70B   |
	LDA $17BA				;$B6C70D   |
	CLC					;$B6C710   |
	ADC #$00EA				;$B6C711   |
	STA $48,x				;$B6C714   |
	BRA CODE_B6C721				;$B6C716  /

CODE_B6C718:
	LDA $17BA				;$B6C718  \
	CLC					;$B6C71B   |
	ADC #$001A				;$B6C71C   |
	STA $48,x				;$B6C71F   |
CODE_B6C721:					;	   |
	LDA #$0158				;$B6C721   |
	STA $4A,x				;$B6C724   |
	LDA $48,x				;$B6C726   |
	SEC					;$B6C728   |
	SBC $06,x				;$B6C729   |
	BPL CODE_B6C750				;$B6C72B   |
	EOR #$FFFF				;$B6C72D   |
	INC A					;$B6C730   |
	STA $24,x				;$B6C731   |
	LDA #$FFFF				;$B6C733   |
	STA $20,x				;$B6C736   |
	LDA $2E,x				;$B6C738   |
	BIT #$0008				;$B6C73A   |
	BNE CODE_B6C76D				;$B6C73D   |
	BIT #$0002				;$B6C73F   |
	BNE CODE_B6C76D				;$B6C742   |
	LDA $12,x				;$B6C744   |
	BIT #$4000				;$B6C746   |
	BNE CODE_B6C76D				;$B6C749   |
	JSR CODE_B6CB2E				;$B6C74B   |
	BRA CODE_B6C76D				;$B6C74E  /

CODE_B6C750:
	STA $24,x				;$B6C750  \
	LDA #$0001				;$B6C752   |
	STA $20,x				;$B6C755   |
	LDA $2E,x				;$B6C757   |
	BIT #$0008				;$B6C759   |
	BNE CODE_B6C76D				;$B6C75C   |
	BIT #$0002				;$B6C75E   |
	BNE CODE_B6C76D				;$B6C761   |
	LDA $12,x				;$B6C763   |
	BIT #$4000				;$B6C765   |
	BEQ CODE_B6C76D				;$B6C768   |
	JSR CODE_B6CB2E				;$B6C76A   |
CODE_B6C76D:					;	   |
	LDA $4A,x				;$B6C76D   |
	SEC					;$B6C76F   |
	SBC $0A,x				;$B6C770   |
	BPL CODE_B6C781				;$B6C772   |
	EOR #$FFFF				;$B6C774   |
	INC A					;$B6C777   |
	STA $26,x				;$B6C778   |
	LDA #$FFFF				;$B6C77A   |
	STA $22,x				;$B6C77D   |
	BRA CODE_B6C788				;$B6C77F  /

CODE_B6C781:
	STA $26,x				;$B6C781  \
	LDA #$0001				;$B6C783   |
	STA $22,x				;$B6C786   |
CODE_B6C788:					;	   |
	LDA $24,x				;$B6C788   |
	CMP $26,x				;$B6C78A   |
	BEQ CODE_B6C7A6				;$B6C78C   |
	BCC CODE_B6C79B				;$B6C78E   |
	LDA $24,x				;$B6C790   |
	LSR A					;$B6C792   |
	STA $28,x				;$B6C793   |
	LDA $26,x				;$B6C795   |
	STA $2A,x				;$B6C797   |
	BRA CODE_B6C7AD				;$B6C799  /

CODE_B6C79B:
	LDA $26,x				;$B6C79B  \
	LSR A					;$B6C79D   |
	STA $28,x				;$B6C79E   |
	LDA $24,x				;$B6C7A0   |
	STA $2A,x				;$B6C7A2   |
	BRA CODE_B6C7AD				;$B6C7A4  /

CODE_B6C7A6:
	LDA #$0001				;$B6C7A6  \
	STA $28,x				;$B6C7A9   |
	STZ $2A,x				;$B6C7AB   |
CODE_B6C7AD:					;	   |
	PLA					;$B6C7AD   |
	CLC					;$B6C7AE   |
	ADC #$0002				;$B6C7AF   |
	TAY					;$B6C7B2   |
	RTS					;$B6C7B3  /

boss_command_code_0D:
	LDA $0000,y				;$B6C7B4  \
	STA $00065A				;$B6C7B7   |
	STZ $44,x				;$B6C7BB   |
	TYA					;$B6C7BD   |
	CLC					;$B6C7BE   |
	ADC #$0002				;$B6C7BF   |
	TAY					;$B6C7C2   |
	RTS					;$B6C7C3  /

boss_command_code_14:
	LDA $2E,x				;$B6C7C4  \
	BIT #$0010				;$B6C7C6   |
	BNE CODE_B6C7D0				;$B6C7C9   |
	LDA $0000,y				;$B6C7CB   |
	BRA CODE_B6C7D3				;$B6C7CE  /

CODE_B6C7D0:
	LDA $0002,y				;$B6C7D0  \
CODE_B6C7D3:					;	   |
	STA $00065A				;$B6C7D3   |
	STZ $44,x				;$B6C7D7   |
	TYA					;$B6C7D9   |
	CLC					;$B6C7DA   |
	ADC #$0004				;$B6C7DB   |
	TAY					;$B6C7DE   |
	RTS					;$B6C7DF  /

boss_command_code_09:
	PHY					;$B6C7E0  \
	LDA #$0001				;$B6C7E1   |
	LDY #$0000				;$B6C7E4   |
	JSL CODE_B8D1E4				;$B6C7E7   |
	STZ $44,x				;$B6C7EB   |
	PLY					;$B6C7ED   |
	RTS					;$B6C7EE  /

boss_command_code_0A:
	PHY					;$B6C7EF  \
	LDA.l $0006A1				;$B6C7F0   |
	ORA #$4000				;$B6C7F4   |
	STA $0006A1				;$B6C7F7   |
	STZ $44,x				;$B6C7FB   |
	PLY					;$B6C7FD   |
	RTS					;$B6C7FE  /

boss_command_code_0B:
	LDA $0000,y				;$B6C7FF  \
	JSL CODE_B5F0CD				;$B6C802   |
	LDA $0002,y				;$B6C806   |
	JSL CODE_B5F0ED				;$B6C809   |
	INY					;$B6C80D   |
	INY					;$B6C80E   |
	INY					;$B6C80F   |
	INY					;$B6C810   |
	LDX current_sprite			;$B6C811   |
	STZ $44,x				;$B6C813   |
	RTS					;$B6C815  /

boss_command_code_06:
	PHY					;$B6C816  \
	LDA #$0564				;$B6C817   |
	JSL queue_sound_effect			;$B6C81A   |
	LDY #$00A2				;$B6C81E   |
	JSL CODE_BB842C				;$B6C821   |
	LDY alternate_sprite			;$B6C825   |
	LDX current_sprite			;$B6C827   |
	STY $4C,x				;$B6C829   |
	LDA $06,x				;$B6C82B   |
	CLC					;$B6C82D   |
	ADC $0006D1				;$B6C82E   |
	STA $0006,y				;$B6C832   |
	LDA $0A,x				;$B6C835   |
	CLC					;$B6C837   |
	ADC #$001B				;$B6C838   |
	STA $000A,y				;$B6C83B   |
	LDA #$0000				;$B6C83E   |
	STA $000C,y				;$B6C841   |
	STZ $44,x				;$B6C844   |
	PLY					;$B6C846   |
	RTS					;$B6C847  /

boss_command_code_07:
	PHY					;$B6C848  \
	LDA #$0565				;$B6C849   |
	JSL queue_sound_effect			;$B6C84C   |
	SEP #$20				;$B6C850   |
	PHK					;$B6C852   |
	PLA					;$B6C853   |
	STA $D0					;$B6C854   |
	REP #$20				;$B6C856   |
	LDA.l $000652				;$B6C858   |
	ASL A					;$B6C85C   |
	TAX					;$B6C85D   |
	LDA DATA_B6FE24,x			;$B6C85E   |
	CLC					;$B6C861   |
	ADC #$0004				;$B6C862   |
	STA $CE					;$B6C865   |
	LDX current_sprite			;$B6C867   |
	LDA $0000,y				;$B6C869   |
	CMP #$0000				;$B6C86C   |
	BEQ CODE_B6C885				;$B6C86F   |
	LDA #$0100				;$B6C871   |
	SEC					;$B6C874   |
	SBC [$CE]				;$B6C875   |
	STA $000650				;$B6C877   |
	LDA $17BA				;$B6C87B   |
	CLC					;$B6C87E   |
	ADC $000650				;$B6C87F   |
	BRA CODE_B6C88B				;$B6C883  /

CODE_B6C885:
	LDA $17BA				;$B6C885  \
	CLC					;$B6C888   |
	ADC [$CE]				;$B6C889   |
CODE_B6C88B:					;	   |
	INC $CE					;$B6C88B   |
	INC $CE					;$B6C88D   |
	INC $CE					;$B6C88F   |
	INC $CE					;$B6C891   |
	LDY $4C,x				;$B6C893   |
	SEC					;$B6C895   |
	SBC $0006,y				;$B6C896   |
	BPL CODE_B6C8B3				;$B6C899   |
	EOR #$FFFF				;$B6C89B   |
	INC A					;$B6C89E   |
	STA $0010,y				;$B6C89F   |
	LDA #$FFFF				;$B6C8A2   |
	STA $0020,y				;$B6C8A5   |
	LDA [$CE]				;$B6C8A8   |
	EOR #$FFFF				;$B6C8AA   |
	INC A					;$B6C8AD   |
	STA $0022,y				;$B6C8AE   |
	BRA CODE_B6C8C1				;$B6C8B1  /

CODE_B6C8B3:
	STA $0010,y				;$B6C8B3  \
	LDA #$0001				;$B6C8B6   |
	STA $0020,y				;$B6C8B9   |
	LDA [$CE]				;$B6C8BC   |
	STA $0022,y				;$B6C8BE   |
CODE_B6C8C1:					;	   |
	LDA $0010,y				;$B6C8C1   |
	STA CPU.dividen				;$B6C8C4   |
	LDA [$CE]				;$B6C8C7   |
	INC A					;$B6C8C9   |
	ASL A					;$B6C8CA   |
	ASL A					;$B6C8CB   |
	ASL A					;$B6C8CC   |
	ASL A					;$B6C8CD   |
	SEP #$20				;$B6C8CE   |
	STA CPU.divisor				;$B6C8D0   |
	REP #$20				;$B6C8D3   |
	LDA #$0008				;$B6C8D5   |
CODE_B6C8D8:					;	   |
	DEC A					;$B6C8D8   |
	BNE CODE_B6C8D8				;$B6C8D9   |
	LDA CPU.divide_result			;$B6C8DB   |
	SEP #$20				;$B6C8DE   |
	STA $0024,y				;$B6C8E0   |
	STA $0026,y				;$B6C8E3   |
	REP #$20				;$B6C8E6   |
	LDA #$0010				;$B6C8E8   |
	STA $0028,y				;$B6C8EB   |
	INC $CE					;$B6C8EE   |
	INC $CE					;$B6C8F0   |
	LDA [$CE]				;$B6C8F2   |
	SEP #$20				;$B6C8F4   |
	STA $002A,y				;$B6C8F6   |
	REP #$20				;$B6C8F9   |
	INC $CE					;$B6C8FB   |
	INC $CE					;$B6C8FD   |
	LDA [$CE]				;$B6C8FF   |
	SEP #$20				;$B6C901   |
	STA $000E,y				;$B6C903   |
	REP #$20				;$B6C906   |
	INC $CE					;$B6C908   |
	INC $CE					;$B6C90A   |
	LDA [$CE]				;$B6C90C   |
	SEP #$20				;$B6C90E   |
	STA $000F,y				;$B6C910   |
	REP #$20				;$B6C913   |
	INC $CE					;$B6C915   |
	INC $CE					;$B6C917   |
	LDA [$CE]				;$B6C919   |
	STA $004E,y				;$B6C91B   |
	INC $CE					;$B6C91E   |
	INC $CE					;$B6C920   |
	LDA [$CE]				;$B6C922   |
	STA $0054,y				;$B6C924   |
	LDA #$0001				;$B6C927   |
	STA $0052,y				;$B6C92A   |
	LDA $0054,y				;$B6C92D   |
	DEC A					;$B6C930   |
	DEC A					;$B6C931   |
	SEP #$20				;$B6C932   |
	STA $002B,y				;$B6C934   |
	REP #$20				;$B6C937   |
	DEC A					;$B6C939   |
	STA $000767				;$B6C93A   |
	LDA $0012,y				;$B6C93E   |
	AND #$CFFF				;$B6C941   |
	ORA #$3000				;$B6C944   |
	STA $0012,y				;$B6C947   |
	STZ $44,x				;$B6C94A   |
	LDA $0020,y				;$B6C94C   |
	BPL CODE_B6C956				;$B6C94F   |
	LDA #$0302				;$B6C951   |
	BRA CODE_B6C959				;$B6C954  /

CODE_B6C956:
	LDA #$02FE				;$B6C956  \
CODE_B6C959:					;	   |
	STA $000C,y				;$B6C959   |
	STZ $4C,x				;$B6C95C   |
	LDA $002E,y				;$B6C95E   |
	ORA #$000B				;$B6C961   |
	STA $002E,y				;$B6C964   |
	LDA $0030,y				;$B6C967   |
	ORA #$0020				;$B6C96A   |
	STA $0030,y				;$B6C96D   |
	PLA					;$B6C970   |
	CLC					;$B6C971   |
	ADC #$0002				;$B6C972   |
	TAY					;$B6C975   |
	RTS					;$B6C976  /

boss_command_code_02:
	STZ $44,x				;$B6C977  \
	LDA $0000,y				;$B6C979   |
	BEQ CODE_B6C990				;$B6C97C   |
	LDA $2E,x				;$B6C97E   |
	BIT #$0010				;$B6C980   |
	BNE CODE_B6C98A				;$B6C983   |
	LDA $0000,y				;$B6C985   |
	BRA CODE_B6C98D				;$B6C988  /

CODE_B6C98A:
	LDA $0002,y				;$B6C98A  \
CODE_B6C98D:					;	   |
	TAY					;$B6C98D   |
	BRA CODE_B6C993				;$B6C98E  /

CODE_B6C990:
	LDY $065A				;$B6C990  \
CODE_B6C993:					;	   |
	RTS					;$B6C993  /

boss_command_code_01:
	PHY					;$B6C994  \
	LDA $0000,y				;$B6C995   |
	STA $00065C				;$B6C998   |
	LDA $0002,y				;$B6C99C   |
	STA $00065E				;$B6C99F   |
	LDX current_sprite			;$B6C9A3   |
	LDA $2E,x				;$B6C9A5   |
	ORA #$0002				;$B6C9A7   |
	STA $2E,x				;$B6C9AA   |
	LDA #$0203				;$B6C9AC   |
	STA $1E,x				;$B6C9AF   |
	STZ $44,x				;$B6C9B1   |
	LDY $42,x				;$B6C9B3   |
	LDA #$0206				;$B6C9B5   |
	STA $001E,y				;$B6C9B8   |
	STZ $44,x				;$B6C9BB   |
	PLA					;$B6C9BD   |
	CLC					;$B6C9BE   |
	ADC #$0004				;$B6C9BF   |
	TAY					;$B6C9C2   |
	RTS					;$B6C9C3  /

boss_command_code_08:
	TYA					;$B6C9C4  \
	CLC					;$B6C9C5   |
	ADC #$0002				;$B6C9C6   |
	PHA					;$B6C9C9   |
	LDA $2E,x				;$B6C9CA   |
	ORA #$0100				;$B6C9CC   |
	STA $2E,x				;$B6C9CF   |
	LDA $0000,y				;$B6C9D1   |
	STA $1E,x				;$B6C9D4   |
	LDA.l $000652				;$B6C9D6   |
	ASL A					;$B6C9DA   |
	TAX					;$B6C9DB   |
	LDA DATA_B6FE24,x			;$B6C9DC   |
	TAX					;$B6C9DF   |
	LDA $0000,x				;$B6C9E0   |
	BRA CODE_B6CA0E				;$B6C9E3  /

boss_command_code_0F:
	LDA $0000,y				;$B6C9E5  \
	STA $1E,x				;$B6C9E8   |
	TYA					;$B6C9EA   |
	CLC					;$B6C9EB   |
	ADC #$0002				;$B6C9EC   |
	PHA					;$B6C9EF   |
	LDA.l $000652				;$B6C9F0   |
	ASL A					;$B6C9F4   |
	TAX					;$B6C9F5   |
	LDA DATA_B6FE24,x			;$B6C9F6   |
	TAX					;$B6C9F9   |
	LDA $0014,x				;$B6C9FA   |
	BRA CODE_B6CA0E				;$B6C9FD  /

boss_command_code_1A:
	LDA $0002,y				;$B6C9FF  \
	STA $1E,x				;$B6CA02   |
	LDX $0000,y				;$B6CA04   |
	TYA					;$B6CA07   |
	CLC					;$B6CA08   |
	ADC #$0004				;$B6CA09   |
	PHA					;$B6CA0C   |
	TXA					;$B6CA0D   |
CODE_B6CA0E:					;	   |
	LDX current_sprite			;$B6CA0E   |
	STA $0C,x				;$B6CA10   |
	LDA #DATA_B6D079			;$B6CA12   |
	STA $20,x				;$B6CA15   |
	STA $26,x				;$B6CA17   |
	LDA #DATA_B6D0B9			;$B6CA19   |
	STA $28,x				;$B6CA1C   |
	LDA #$0004				;$B6CA1E   |
	STA $22,x				;$B6CA21   |
	STA $24,x				;$B6CA23   |
	PLY					;$B6CA25   |
	RTS					;$B6CA26  /

CODE_B6CA27:
	LDX current_sprite			;$B6CA27  \
	DEC $0C,x				;$B6CA29   |
	BNE CODE_B6CA39				;$B6CA2B   |
	LDA $2E,x				;$B6CA2D   |
	AND #$FEFF				;$B6CA2F   |
	STA $2E,x				;$B6CA32   |
	STZ $44,x				;$B6CA34   |
	BRL CODE_B6CA92				;$B6CA36  /

CODE_B6CA39:
	DEC $22,x				;$B6CA39  \
	BNE CODE_B6CA92				;$B6CA3B   |
	LDA $24,x				;$B6CA3D   |
	STA $22,x				;$B6CA3F   |
	LDY $20,x				;$B6CA41   |
	SEP #$20				;$B6CA43   |
	PHK					;$B6CA45   |
	PLA					;$B6CA46   |
	STA $D0					;$B6CA47   |
	REP #$20				;$B6CA49   |
	STY $CE					;$B6CA4B   |
	LDY $42,x				;$B6CA4D   |
	LDA $06,x				;$B6CA4F   |
	CLC					;$B6CA51   |
	ADC [$CE]				;$B6CA52   |
	STA $06,x				;$B6CA54   |
	STA $0006,y				;$B6CA56   |
	INC $CE					;$B6CA59   |
	INC $CE					;$B6CA5B   |
	LDY $42,x				;$B6CA5D   |
	LDA $0A,x				;$B6CA5F   |
	CLC					;$B6CA61   |
	ADC [$CE]				;$B6CA62   |
	STA $0A,x				;$B6CA64   |
	STA $000A,y				;$B6CA66   |
	LDY $0E,x				;$B6CA69   |
	LDA $12,x				;$B6CA6B   |
	BIT #$4000				;$B6CA6D   |
	BNE CODE_B6CA93				;$B6CA70   |
	LDA $06,x				;$B6CA72   |
	CLC					;$B6CA74   |
	ADC #$0014				;$B6CA75   |
	STA $0006,y				;$B6CA78   |
CODE_B6CA7B:					;	   |
	LDA $0A,x				;$B6CA7B   |
	CLC					;$B6CA7D   |
	ADC #$FFB3				;$B6CA7E   |
	STA $000A,y				;$B6CA81   |
	LDA $20,x				;$B6CA84   |
	CLC					;$B6CA86   |
	ADC #$0004				;$B6CA87   |
	CMP $28,x				;$B6CA8A   |
	BNE CODE_B6CA90				;$B6CA8C   |
	LDA $26,x				;$B6CA8E   |
CODE_B6CA90:					;	   |
	STA $20,x				;$B6CA90   |
CODE_B6CA92:					;	   |
	RTS					;$B6CA92  /

CODE_B6CA93:
	LDA $06,x				;$B6CA93  \
	SEC					;$B6CA95   |
	SBC #$0014				;$B6CA96   |
	STA $0006,y				;$B6CA99   |
	BRA CODE_B6CA7B				;$B6CA9C  /

CODE_B6CA9E:
	LDX $0654				;$B6CA9E  \
	LDA $2E,x				;$B6CAA1   |
	AND #$EFFF				;$B6CAA3   |
	STA $2E,x				;$B6CAA6   |
	RTL					;$B6CAA8  /

boss_command_code_05:
	LDX current_sprite			;$B6CAA9  \
	JSR CODE_B6CAB7				;$B6CAAB   |
	TYA					;$B6CAAE   |
	CLC					;$B6CAAF   |
	ADC #$0004				;$B6CAB0   |
	TAY					;$B6CAB3   |
	STZ $44,x				;$B6CAB4   |
	RTS					;$B6CAB6  /

CODE_B6CAB7:
	LDA $0000,y				;$B6CAB7  \
	BEQ CODE_B6CABE				;$B6CABA   |
	STA $1E,x				;$B6CABC   |
CODE_B6CABE:					;	   |
	PHX					;$B6CABE   |
	LDA $42,x				;$B6CABF   |
	TAX					;$B6CAC1   |
	LDA $0002,y				;$B6CAC2   |
	BEQ CODE_B6CAD5				;$B6CAC5   |
	PHY					;$B6CAC7   |
	LDY current_sprite			;$B6CAC8   |
	PHY					;$B6CACA   |
	STX current_sprite			;$B6CACB   |
	JSL set_sprite_animation		;$B6CACD   |
	PLY					;$B6CAD1   |
	STY current_sprite			;$B6CAD2   |
	PLY					;$B6CAD4   |
CODE_B6CAD5:					;	   |
	PLX					;$B6CAD5   |
	RTS					;$B6CAD6  /

CODE_B6CAD7:
	LDX current_sprite			;$B6CAD7  \
	LDA $2E,x				;$B6CAD9   |
	BIT #$0002				;$B6CADB   |
	BNE CODE_B6CAE2				;$B6CADE   |
	STZ $44,x				;$B6CAE0   |
CODE_B6CAE2:					;	   |
	RTS					;$B6CAE2  /

boss_command_code_04:
	LDX current_sprite			;$B6CAE3  \
	LDA $0000,y				;$B6CAE5   |
	STA $000650				;$B6CAE8   |
	LDA $12,x				;$B6CAEC   |
	AND #$CFFF				;$B6CAEE   |
	ORA $000650				;$B6CAF1   |
	STA $12,x				;$B6CAF5   |
	PHY					;$B6CAF7   |
	LDY $42,x				;$B6CAF8   |
	LDA $0012,y				;$B6CAFA   |
	AND #$CFFF				;$B6CAFD   |
	ORA $000650				;$B6CB00   |
	STA $0012,y				;$B6CB04   |
	PLY					;$B6CB07   |
	STZ $44,x				;$B6CB08   |
	INY					;$B6CB0A   |
	INY					;$B6CB0B   |
	RTS					;$B6CB0C  /

boss_command_code_1B:
	PHY					;$B6CB0D  \
	LDX current_sprite			;$B6CB0E   |
	LDA $0000,y				;$B6CB10   |
	STA $000650				;$B6CB13   |
	LDY $4C,x				;$B6CB17   |
	BEQ CODE_B6CB28				;$B6CB19   |
	LDA $0012,y				;$B6CB1B   |
	AND #$CFFF				;$B6CB1E   |
	ORA $000650				;$B6CB21   |
	STA $0012,y				;$B6CB25   |
CODE_B6CB28:					;	   |
	PLY					;$B6CB28   |
	STZ $44,x				;$B6CB29   |
	INY					;$B6CB2B   |
	INY					;$B6CB2C   |
	RTS					;$B6CB2D  /

CODE_B6CB2E:
	LDA level_number			;$B6CB2E  \
	CMP #!level_king_zing_sting		;$B6CB30   |
	BNE CODE_B6CB36				;$B6CB33   |
	RTS					;$B6CB35  /

CODE_B6CB36:
	PHY					;$B6CB36  \
	LDA $36,x				;$B6CB37   |
	STA $00065C				;$B6CB39   |
	LDY $42,x				;$B6CB3D   |
	LDA $0036,y				;$B6CB3F   |
	STA $00065E				;$B6CB42   |
	LDA $2E,x				;$B6CB46   |
	ORA #$0002				;$B6CB48   |
	STA $2E,x				;$B6CB4B   |
	LDA #$0203				;$B6CB4D   |
	JSL set_sprite_animation		;$B6CB50   |
	LDA $42,x				;$B6CB54   |
	PHX					;$B6CB56   |
	STA current_sprite			;$B6CB57   |
	LDA #$0206				;$B6CB59   |
	JSL set_sprite_animation		;$B6CB5C   |
	PLX					;$B6CB60   |
	STX current_sprite			;$B6CB61   |
	PLY					;$B6CB63   |
	RTS					;$B6CB64  /

boss_command_code_12:
	PHY					;$B6CB65  \
	LDX current_sprite			;$B6CB66   |
	LDA $0000,y				;$B6CB68   |
	CLC					;$B6CB6B   |
	ADC $06,x				;$B6CB6C   |
	STA $48,x				;$B6CB6E   |
	LDA $0002,y				;$B6CB70   |
	ADC $0A,x				;$B6CB73   |
	BRA CODE_B6CB89				;$B6CB75  /

boss_command_code_00:
	PHY					;$B6CB77  \
	LDX current_sprite			;$B6CB78   |
	LDA $2E,x				;$B6CB7A   |
	ORA #$0040				;$B6CB7C   |
	STA $2E,x				;$B6CB7F   |
	LDA $0000,y				;$B6CB81   |
	STA $48,x				;$B6CB84   |
	LDA $0002,y				;$B6CB86   |
CODE_B6CB89:					;	   |
	STA $4A,x				;$B6CB89   |
	LDA $0004,y				;$B6CB8B   |
	BNE CODE_B6CB9D				;$B6CB8E   |
	LDA.l $000652				;$B6CB90   |
	ASL A					;$B6CB94   |
	TAY					;$B6CB95   |
	LDA DATA_B6FE24,y			;$B6CB96   |
	TAY					;$B6CB99   |
	LDA $0006,y				;$B6CB9A   |
CODE_B6CB9D:					;	   |
	STA $2C,x				;$B6CB9D   |
	LDA $2E,x				;$B6CB9F   |
	BIT #$0020				;$B6CBA1   |
	BEQ CODE_B6CBB8				;$B6CBA4   |
	LDA $06,x				;$B6CBA6   |
	PHA					;$B6CBA8   |
	LDA $0A,x				;$B6CBA9   |
	PHA					;$B6CBAB   |
	LDA.l $000660				;$B6CBAC   |
	STA $06,x				;$B6CBB0   |
	LDA.l $000662				;$B6CBB2   |
	STA $0A,x				;$B6CBB6   |
CODE_B6CBB8:					;	   |
	LDA $48,x				;$B6CBB8   |
	SEC					;$B6CBBA   |
	SBC $06,x				;$B6CBBB   |
	BPL CODE_B6CBE2				;$B6CBBD   |
	EOR #$FFFF				;$B6CBBF   |
	INC A					;$B6CBC2   |
	STA $24,x				;$B6CBC3   |
	LDA #$FFFF				;$B6CBC5   |
	STA $20,x				;$B6CBC8   |
	LDA $2E,x				;$B6CBCA   |
	BIT #$0008				;$B6CBCC   |
	BNE CODE_B6CBFF				;$B6CBCF   |
	BIT #$0002				;$B6CBD1   |
	BNE CODE_B6CBFF				;$B6CBD4   |
	LDA $12,x				;$B6CBD6   |
	BIT #$4000				;$B6CBD8   |
	BNE CODE_B6CBFF				;$B6CBDB   |
	JSR CODE_B6CB2E				;$B6CBDD   |
	BRA CODE_B6CBFF				;$B6CBE0  /

CODE_B6CBE2:
	STA $24,x				;$B6CBE2  \
	LDA #$0001				;$B6CBE4   |
	STA $20,x				;$B6CBE7   |
	LDA $2E,x				;$B6CBE9   |
	BIT #$0008				;$B6CBEB   |
	BNE CODE_B6CBFF				;$B6CBEE   |
	BIT #$0002				;$B6CBF0   |
	BNE CODE_B6CBFF				;$B6CBF3   |
	LDA $12,x				;$B6CBF5   |
	BIT #$4000				;$B6CBF7   |
	BEQ CODE_B6CBFF				;$B6CBFA   |
	JSR CODE_B6CB2E				;$B6CBFC   |
CODE_B6CBFF:					;	   |
	LDA $4A,x				;$B6CBFF   |
	SEC					;$B6CC01   |
	SBC $0A,x				;$B6CC02   |
	BPL CODE_B6CC13				;$B6CC04   |
	EOR #$FFFF				;$B6CC06   |
	INC A					;$B6CC09   |
	STA $26,x				;$B6CC0A   |
	LDA #$FFFF				;$B6CC0C   |
	STA $22,x				;$B6CC0F   |
	BRA CODE_B6CC1A				;$B6CC11  /

CODE_B6CC13:
	STA $26,x				;$B6CC13  \
	LDA #$0001				;$B6CC15   |
	STA $22,x				;$B6CC18   |
CODE_B6CC1A:					;	   |
	LDA $24,x				;$B6CC1A   |
	CMP $26,x				;$B6CC1C   |
	BEQ CODE_B6CC38				;$B6CC1E   |
	BCC CODE_B6CC2D				;$B6CC20   |
	LDA $24,x				;$B6CC22   |
	LSR A					;$B6CC24   |
	STA $28,x				;$B6CC25   |
	LDA $26,x				;$B6CC27   |
	STA $2A,x				;$B6CC29   |
	BRA CODE_B6CC3F				;$B6CC2B  /

CODE_B6CC2D:
	LDA $26,x				;$B6CC2D  \
	LSR A					;$B6CC2F   |
	STA $28,x				;$B6CC30   |
	LDA $24,x				;$B6CC32   |
	STA $2A,x				;$B6CC34   |
	BRA CODE_B6CC3F				;$B6CC36  /

CODE_B6CC38:
	LDA #$0001				;$B6CC38  \
	STA $28,x				;$B6CC3B   |
	STZ $2A,x				;$B6CC3D   |
CODE_B6CC3F:					;	   |
	LDA $2E,x				;$B6CC3F   |
	BIT #$0020				;$B6CC41   |
	BEQ CODE_B6CC4C				;$B6CC44   |
	PLA					;$B6CC46   |
	STA $0A,x				;$B6CC47   |
	PLA					;$B6CC49   |
	STA $06,x				;$B6CC4A   |
CODE_B6CC4C:					;	   |
	PLA					;$B6CC4C   |
	CLC					;$B6CC4D   |
	ADC #$0006				;$B6CC4E   |
	TAY					;$B6CC51   |
	RTS					;$B6CC52  /

CODE_B6CC53:
	LDX current_sprite			;$B6CC53  \
	LDA $2E,x				;$B6CC55   |
	BIT #$0020				;$B6CC57   |
	BEQ CODE_B6CC68				;$B6CC5A   |
	LDA.l $000660				;$B6CC5C   |
	STA $06,x				;$B6CC60   |
	LDA.l $000662				;$B6CC62   |
	STA $0A,x				;$B6CC66   |
CODE_B6CC68:					;	   |
	LDA $2C,x				;$B6CC68   |
	STA $000650				;$B6CC6A   |
if !version == 1				;	   |
	LDA.l $000769				;$B6CC6E   |
	BNE CODE_B6CC77				;$B6CC72   |
	INC $0650				;$B6CC74   |
endif						;	   |
CODE_B6CC77:					;	   |
	LDA level_number			;$B6CC77   |
	CMP #!level_king_zing_sting		;$B6CC79   |
	BNE CODE_B6CC9B				;$B6CC7C   |
	LDA.l $000652				;$B6CC7E   |
	CMP #$0003				;$B6CC82   |
	BCC CODE_B6CC9B				;$B6CC85   |
	BIT #$0001				;$B6CC87   |
	BNE CODE_B6CC9B				;$B6CC8A   |
	LDA $2E,x				;$B6CC8C   |
	EOR #$0100				;$B6CC8E   |
	STA $2E,x				;$B6CC91   |
	AND #$0100				;$B6CC93   |
	BEQ CODE_B6CC9B				;$B6CC96   |
	INC $0650				;$B6CC98   |
CODE_B6CC9B:					;	   |
	LDA $24,x				;$B6CC9B   |
	CMP $26,x				;$B6CC9D   |
	BNE CODE_B6CCA4				;$B6CC9F   |
	BRL CODE_B6CD6D				;$B6CCA1  /

CODE_B6CCA4:
	BCS CODE_B6CCA9				;$B6CCA4  \
	BRL CODE_B6CD0C				;$B6CCA6  /

CODE_B6CCA9:
	LDA $28,x				;$B6CCA9  \
	SEC					;$B6CCAB   |
	SBC $2A,x				;$B6CCAC   |
	BPL CODE_B6CCC4				;$B6CCAE   |
	CLC					;$B6CCB0   |
	ADC $24,x				;$B6CCB1   |
	STA $28,x				;$B6CCB3   |
	LDA $0A,x				;$B6CCB5   |
	CLC					;$B6CCB7   |
	ADC $22,x				;$B6CCB8   |
	STA $0A,x				;$B6CCBA   |
	LDY $0656				;$B6CCBC   |
	STA $000A,y				;$B6CCBF   |
	BRA CODE_B6CCC6				;$B6CCC2  /

CODE_B6CCC4:
	STA $28,x				;$B6CCC4  \
CODE_B6CCC6:					;	   |
	JSR CODE_B6CF78				;$B6CCC6   |
	BCC CODE_B6CCCE				;$B6CCC9   |
	BRL CODE_B6CDBF				;$B6CCCB  /

CODE_B6CCCE:
	LDA $06,x				;$B6CCCE  \
	CLC					;$B6CCD0   |
	ADC $20,x				;$B6CCD1   |
	STA $06,x				;$B6CCD3   |
	LDY $0656				;$B6CCD5   |
	STA $0006,y				;$B6CCD8   |
	LDY $0E,x				;$B6CCDB   |
	BEQ CODE_B6CCFE				;$B6CCDD   |
	LDA $2E,x				;$B6CCDF   |
	BIT #$0002				;$B6CCE1   |
	BNE CODE_B6CCFE				;$B6CCE4   |
	LDA $12,x				;$B6CCE6   |
	BIT #$4000				;$B6CCE8   |
	BNE CODE_B6CCF5				;$B6CCEB   |
	LDA $06,x				;$B6CCED   |
	CLC					;$B6CCEF   |
	ADC #$0014				;$B6CCF0   |
	BRA CODE_B6CCFB				;$B6CCF3  /

CODE_B6CCF5:
	LDA $06,x				;$B6CCF5  \
	SEC					;$B6CCF7   |
	SBC #$0014				;$B6CCF8   |
CODE_B6CCFB:					;	   |
	STA $0006,y				;$B6CCFB   |
CODE_B6CCFE:					;	   |
	JSR CODE_B6CF78				;$B6CCFE   |
	DEC $0650				;$B6CD01   |
	BEQ CODE_B6CD09				;$B6CD04   |
	BRL CODE_B6CCA9				;$B6CD06  /

CODE_B6CD09:
	BRL CODE_B6CDBF				;$B6CD09  /

CODE_B6CD0C:
	LDA $28,x				;$B6CD0C  \
	SEC					;$B6CD0E   |
	SBC $2A,x				;$B6CD0F   |
	BPL CODE_B6CD49				;$B6CD11   |
	CLC					;$B6CD13   |
	ADC $26,x				;$B6CD14   |
	STA $28,x				;$B6CD16   |
	LDA $06,x				;$B6CD18   |
	CLC					;$B6CD1A   |
	ADC $20,x				;$B6CD1B   |
	STA $06,x				;$B6CD1D   |
	LDY $42,x				;$B6CD1F   |
	STA $0006,y				;$B6CD21   |
	LDY $0E,x				;$B6CD24   |
	BEQ CODE_B6CD4B				;$B6CD26   |
	LDA $2E,x				;$B6CD28   |
	BIT #$0002				;$B6CD2A   |
	BNE CODE_B6CD4B				;$B6CD2D   |
	LDA $12,x				;$B6CD2F   |
	BIT #$4000				;$B6CD31   |
	BNE CODE_B6CD3E				;$B6CD34   |
	LDA $06,x				;$B6CD36   |
	CLC					;$B6CD38   |
	ADC #$0014				;$B6CD39   |
	BRA CODE_B6CD44				;$B6CD3C  /

CODE_B6CD3E:
	LDA $06,x				;$B6CD3E  \
	SEC					;$B6CD40   |
	SBC #$0014				;$B6CD41   |
CODE_B6CD44:					;	   |
	STA $0006,y				;$B6CD44   |
	BRA CODE_B6CD4B				;$B6CD47  /

CODE_B6CD49:
	STA $28,x				;$B6CD49  \
CODE_B6CD4B:					;	   |
	JSR CODE_B6CF78				;$B6CD4B   |
	BCC CODE_B6CD53				;$B6CD4E   |
	BRL CODE_B6CDBF				;$B6CD50  /

CODE_B6CD53:
	LDA $0A,x				;$B6CD53  \
	CLC					;$B6CD55   |
	ADC $22,x				;$B6CD56   |
	STA $0A,x				;$B6CD58   |
	LDY $42,x				;$B6CD5A   |
	STA $000A,y				;$B6CD5C   |
	JSR CODE_B6CF78				;$B6CD5F   |
	DEC $0650				;$B6CD62   |
	BEQ CODE_B6CD6A				;$B6CD65   |
	BRL CODE_B6CD0C				;$B6CD67  /

CODE_B6CD6A:
	BRL CODE_B6CDBF				;$B6CD6A  /

CODE_B6CD6D:
	LDA $06,x				;$B6CD6D  \
	CLC					;$B6CD6F   |
	ADC $20,x				;$B6CD70   |
	STA $06,x				;$B6CD72   |
	LDY $42,x				;$B6CD74   |
	STA $0006,y				;$B6CD76   |
	LDY $0E,x				;$B6CD79   |
	BEQ CODE_B6CDA0				;$B6CD7B   |
	LDA $2E,x				;$B6CD7D   |
	BIT #$0002				;$B6CD7F   |
	BNE CODE_B6CDA0				;$B6CD82   |
	LDA $12,x				;$B6CD84   |
	BIT #$4000				;$B6CD86   |
	BNE CODE_B6CD97				;$B6CD89   |
	LDA $06,x				;$B6CD8B   |
	CLC					;$B6CD8D   |
	ADC #$0014				;$B6CD8E   |
	STA $0006,y				;$B6CD91   |
	BRL CODE_B6CD9D				;$B6CD94  /

CODE_B6CD97:
	LDA $06,x				;$B6CD97  \
	SEC					;$B6CD99   |
	SBC #$0014				;$B6CD9A   |
CODE_B6CD9D:					;	   |
	STA $0006,y				;$B6CD9D   |
CODE_B6CDA0:					;	   |
	JSR CODE_B6CF78				;$B6CDA0   |
	BCC CODE_B6CDA8				;$B6CDA3   |
	BRL CODE_B6CDBF				;$B6CDA5  /

CODE_B6CDA8:
	LDA $0A,x				;$B6CDA8  \
	CLC					;$B6CDAA   |
	ADC $22,x				;$B6CDAB   |
	STA $0A,x				;$B6CDAD   |
	LDY $42,x				;$B6CDAF   |
	STA $000A,y				;$B6CDB1   |
	JSR CODE_B6CF78				;$B6CDB4   |
	DEC $0650				;$B6CDB7   |
	BEQ CODE_B6CDBF				;$B6CDBA   |
	BRL CODE_B6CD6D				;$B6CDBC  /

CODE_B6CDBF:
	LDX current_sprite			;$B6CDBF  \
	LDA $06,x				;$B6CDC1   |
	STA $000660				;$B6CDC3   |
	LDA $0A,x				;$B6CDC7   |
	STA $000662				;$B6CDC9   |
	LDA $2E,x				;$B6CDCD   |
	BIT #$0020				;$B6CDCF   |
	BEQ CODE_B6CE0F				;$B6CDD2   |
	LDY $10,x				;$B6CDD4   |
	PHB					;$B6CDD6   |
	JSR CODE_B6D923				;$B6CDD7   |
	LDA $06,x				;$B6CDDA   |
	CLC					;$B6CDDC   |
	ADC $0000,y				;$B6CDDD   |
	STA $06,x				;$B6CDE0   |
	LDA $0A,x				;$B6CDE2   |
	CLC					;$B6CDE4   |
	ADC $0002,y				;$B6CDE5   |
	STA $0A,x				;$B6CDE8   |
	PLB					;$B6CDEA   |
	LDY $42,x				;$B6CDEB   |
	STA $000A,y				;$B6CDED   |
	LDA $06,x				;$B6CDF0   |
	STA $0006,y				;$B6CDF2   |
	DEC $06CF				;$B6CDF5   |
	BNE CODE_B6CE0F				;$B6CDF8   |
	LDA #$0004				;$B6CDFA   |
	STA $0006CF				;$B6CDFD   |
	LDA $10,x				;$B6CE01   |
	CLC					;$B6CE03   |
	ADC #$0004				;$B6CE04   |
	CMP $54,x				;$B6CE07   |
	BNE CODE_B6CE0D				;$B6CE09   |
	LDA $52,x				;$B6CE0B   |
CODE_B6CE0D:					;	   |
	STA $10,x				;$B6CE0D   |
CODE_B6CE0F:					;	   |
	LDY $0E,x				;$B6CE0F   |
	BEQ CODE_B6CE1C				;$B6CE11   |
	LDA $0A,x				;$B6CE13   |
	CLC					;$B6CE15   |
	ADC #$FFB3				;$B6CE16   |
	STA $000A,y				;$B6CE19   |
CODE_B6CE1C:					;	   |
	LDA level_number			;$B6CE1C   |
	CMP #!level_king_zing_sting		;$B6CE1E   |
	BEQ CODE_B6CE3A				;$B6CE21   |
	LDY $4C,x				;$B6CE23   |
	BEQ CODE_B6CE3A				;$B6CE25   |
	LDA $06,x				;$B6CE27   |
	CLC					;$B6CE29   |
	ADC $0006D1				;$B6CE2A   |
	STA $0006,y				;$B6CE2E   |
	LDA $0A,x				;$B6CE31   |
	CLC					;$B6CE33   |
	ADC #$001B				;$B6CE34   |
	STA $000A,y				;$B6CE37   |
CODE_B6CE3A:					;	   |
	RTS					;$B6CE3A  /

DATA_B6CE3B:
	dw $0004, $FFFA
	dw $0004, $FFFB
	dw $0003, $FFFC
	dw $0003, $FFFD
	dw $0003, $FFFD
	dw $0003, $FFFE
	dw $0002, $FFFE
	dw $0003, $FFFF
	dw $0002, $FFFF
	dw $0003, $FFFF
	dw $0002, $FFFF
	dw $0002, $0000
	dw $0002, $0000
	dw $0001, $0000
	dw $0002, $0000
	dw $0001, $0000
	dw $0002, $0001
	dw $0001, $0001
	dw $0001, $0001
	dw $0001, $0002
	dw $0001, $0002
	dw $0000, $0002
	dw $0001, $0002
	dw $0000, $0001
	dw $0001, $0002
	dw $0000, $0001
	dw $0001, $0001
DATA_B6CEA7:

CODE_B6CEA7:
	PHB					;$B6CEA7  \
	PHK					;$B6CEA8   |
	PLB					;$B6CEA9   |
	JSR CODE_B6CEBE				;$B6CEAA   |
	PLB					;$B6CEAD   |
	RTL					;$B6CEAE  /

CODE_B6CEAF:
	LDA $06,x				;$B6CEAF  \
	SEC					;$B6CEB1   |
	SBC [$CE]				;$B6CEB2   |
	CMP #$0120				;$B6CEB4   |
	BCS CODE_B6CEED				;$B6CEB7   |
	LDA #$0120				;$B6CEB9   |
	BRA CODE_B6CEED				;$B6CEBC  /

CODE_B6CEBE:
	LDX current_sprite			;$B6CEBE  \
	LDA $20,x				;$B6CEC0   |
	CMP $22,x				;$B6CEC2   |
	BEQ CODE_B6CF25				;$B6CEC4   |
	DEC $24,x				;$B6CEC6   |
	BNE CODE_B6CF25				;$B6CEC8   |
	LDA $26,x				;$B6CECA   |
	STA $24,x				;$B6CECC   |
	LDY $20,x				;$B6CECE   |
	SEP #$20				;$B6CED0   |
	PHK					;$B6CED2   |
	PLA					;$B6CED3   |
	STA $D0					;$B6CED4   |
	REP #$20				;$B6CED6   |
	STY $CE					;$B6CED8   |
	LDY $42,x				;$B6CEDA   |
	LDA $28,x				;$B6CEDC   |
	BMI CODE_B6CEAF				;$B6CEDE   |
	LDA $06,x				;$B6CEE0   |
	CLC					;$B6CEE2   |
	ADC [$CE]				;$B6CEE3   |
	CMP #$0260				;$B6CEE5   |
	BCC CODE_B6CEED				;$B6CEE8   |
	LDA #$0260				;$B6CEEA   |
CODE_B6CEED:					;	   |
	STA $06,x				;$B6CEED   |
	STA $0006,y				;$B6CEEF   |
	INC $CE					;$B6CEF2   |
	INC $CE					;$B6CEF4   |
	LDA $0A,x				;$B6CEF6   |
	CLC					;$B6CEF8   |
	ADC [$CE]				;$B6CEF9   |
	STA $0A,x				;$B6CEFB   |
	STA $000A,y				;$B6CEFD   |
	LDY $0E,x				;$B6CF00   |
	BEQ CODE_B6CF1D				;$B6CF02   |
	LDA $12,x				;$B6CF04   |
	BIT #$4000				;$B6CF06   |
	BNE CODE_B6CF2D				;$B6CF09   |
	LDA $06,x				;$B6CF0B   |
	CLC					;$B6CF0D   |
	ADC #$0014				;$B6CF0E   |
	STA $0006,y				;$B6CF11   |
CODE_B6CF14:					;	   |
	LDA $0A,x				;$B6CF14   |
	CLC					;$B6CF16   |
	ADC #$FFB3				;$B6CF17   |
	STA $000A,y				;$B6CF1A   |
CODE_B6CF1D:					;	   |
	LDA $20,x				;$B6CF1D   |
	CLC					;$B6CF1F   |
	ADC #$0004				;$B6CF20   |
	STA $20,x				;$B6CF23   |
CODE_B6CF25:					;	   |
	LDA $2E,x				;$B6CF25   |
	BIT #$1000				;$B6CF27   |
	BEQ CODE_B6CF38				;$B6CF2A   |
CODE_B6CF2C:					;	   |
	RTS					;$B6CF2C  /

CODE_B6CF2D:
	LDA $06,x				;$B6CF2D  \
	SEC					;$B6CF2F   |
	SBC #$0014				;$B6CF30   |
	STA $0006,y				;$B6CF33   |
	BRA CODE_B6CF14				;$B6CF36  /

CODE_B6CF38:
	LDA.l $000652				;$B6CF38  \
	ASL A					;$B6CF3C   |
	TAX					;$B6CF3D   |
	LDY DATA_B6FE24,x			;$B6CF3E   |
	LDX $0654				;$B6CF41   |
	STX current_sprite			;$B6CF44   |
	LDA $0002,y				;$B6CF46   |
	STA $0C,x				;$B6CF49   |
	LDA $0018,y				;$B6CF4B   |
	STA $22,x				;$B6CF4E   |
	STA $24,x				;$B6CF50   |
	LDA #DATA_B6D0B9			;$B6CF52   |
	STA $20,x				;$B6CF55   |
	STA $26,x				;$B6CF57   |
	LDA #DATA_B6D0D1			;$B6CF59   |
	STA $28,x				;$B6CF5C   |
	LDA #CODE_B6CA27			;$B6CF5E   |
	STA $44,x				;$B6CF61   |
	BRA CODE_B6CF2C				;$B6CF63  /

CODE_B6CF65:
	PHX					;$B6CF65  \
	PHY					;$B6CF66   |
	LDY current_sprite			;$B6CF67   |
	LDX $12,y				;$B6CF69   |
	PHX					;$B6CF6B   |
	JSL CODE_BEBE8B				;$B6CF6C   |
	LDY current_sprite			;$B6CF70   |
	PLX					;$B6CF72   |
	STX $12,y				;$B6CF73   |
	PLY					;$B6CF75   |
	PLX					;$B6CF76   |
	RTL					;$B6CF77  /

CODE_B6CF78:
	LDA $06,x				;$B6CF78  \
	CMP $48,x				;$B6CF7A   |
	BNE CODE_B6CF8F				;$B6CF7C   |
	LDA $0A,x				;$B6CF7E   |
	CMP $4A,x				;$B6CF80   |
	BNE CODE_B6CF8F				;$B6CF82   |
	STZ $44,x				;$B6CF84   |
	LDA #$0001				;$B6CF86   |
	STA $000650				;$B6CF89   |
	SEC					;$B6CF8D   |
	RTS					;$B6CF8E  /

CODE_B6CF8F:
	CLC					;$B6CF8F  \
	RTS					;$B6CF90  /

CODE_B6CF91:
	LDA #$0003				;$B6CF91  \
	BRA CODE_B6CFAD				;$B6CF94  /

CODE_B6CF96:
	LDA #$0001				;$B6CF96  \
	BRA CODE_B6CFAD				;$B6CF99  /

CODE_B6CF9B:
	LDA #$FFFF				;$B6CF9B  \
	BRA CODE_B6CFAD				;$B6CF9E  /

CODE_B6CFA0:
	LDA #$0000				;$B6CFA0  \
	BRA CODE_B6CFAD				;$B6CFA3  /

CODE_B6CFA5:
	LDA #$0002				;$B6CFA5  \
	BRA CODE_B6CFAD				;$B6CFA8  /

CODE_B6CFAA:
	LDA #$FFFE				;$B6CFAA  \
CODE_B6CFAD:					;	   |
	STA $0006D1				;$B6CFAD   |
	PHX					;$B6CFB1   |
	LDX $0654				;$B6CFB2   |
	LDA $12,x				;$B6CFB5   |
	BIT #$4000				;$B6CFB7   |
	BEQ CODE_B6CFC8				;$B6CFBA   |
	LDA.l $0006D1				;$B6CFBC   |
	EOR #$FFFF				;$B6CFC0   |
	INC A					;$B6CFC3   |
	STA $0006D1				;$B6CFC4   |
CODE_B6CFC8:					;	   |
	PLX					;$B6CFC8   |
	RTL					;$B6CFC9  /

CODE_B6CFCA:
	LDA #$000A				;$B6CFCA  \
	JSR CODE_B6CFDF				;$B6CFCD   |
	RTL					;$B6CFD0  /

CODE_B6CFD1:
	LDA #$0000				;$B6CFD1  \
	JSR CODE_B6CFDF				;$B6CFD4   |
	RTL					;$B6CFD7  /

CODE_B6CFD8:
	LDA #$FFF6				;$B6CFD8  \
	JSR CODE_B6CFDF				;$B6CFDB   |
	RTL					;$B6CFDE  /

CODE_B6CFDF:
	STA $000650				;$B6CFDF  \
	LDX $0654				;$B6CFE3   |
	LDY $0E,x				;$B6CFE6   |
	BEQ CODE_B6D007				;$B6CFE8   |
	LDA $12,x				;$B6CFEA   |
	BIT #$4000				;$B6CFEC   |
	BNE CODE_B6CFFD				;$B6CFEF   |
	LDA $06,x				;$B6CFF1   |
	CLC					;$B6CFF3   |
	ADC $000650				;$B6CFF4   |
	STA $0006,y				;$B6CFF8   |
	BRA CODE_B6D007				;$B6CFFB  /

CODE_B6CFFD:
	LDA $06,x				;$B6CFFD  \
	SEC					;$B6CFFF   |
	SBC $000650				;$B6D000   |
	STA $0006,y				;$B6D004   |
CODE_B6D007:					;	   |
	RTS					;$B6D007  /

CODE_B6D008:
	JSR CODE_B6D010				;$B6D008  \
	LDA $44,x				;$B6D00B   |
	BEQ CODE_B6D008				;$B6D00D   |
	RTS					;$B6D00F  /

CODE_B6D010:
	LDY $46,x				;$B6D010  \
	LDA $0000,y				;$B6D012   |
	ASL A					;$B6D015   |
	ASL A					;$B6D016   |
	PHY					;$B6D017   |
	TAY					;$B6D018   |
	LDA DATA_B6B69F,y			;$B6D019   |
	STA $46,x				;$B6D01C   |
	LDA DATA_B6B6A1,y			;$B6D01E   |
	STA $44,x				;$B6D021   |
	PLY					;$B6D023   |
	INY					;$B6D024   |
	INY					;$B6D025   |
	JSR ($0046,x)				;$B6D026   |
	LDX current_sprite			;$B6D029   |
	STY $46,x				;$B6D02B   |
	RTS					;$B6D02D  /

;klubba
CODE_B6D02E:
	PHB					;$B6D02E  \
	PHK					;$B6D02F   |
	PLB					;$B6D030   |
	LDX current_sprite			;$B6D031   | get klubba sprite
	LDA $42,x				;$B6D033   | check if club sprite exists
	BNE CODE_B6D044				;$B6D035   | if not
	LDY #$010C				;$B6D037   | spawn the club sprite
	JSL CODE_BB842C				;$B6D03A   |
	LDA alternate_sprite			;$B6D03E   |
	LDX current_sprite			;$B6D040   |
	STA $42,x				;$B6D042   | tell klubba what slot club is in
CODE_B6D044:					;	   |
	LDA.l $0006A3				;$B6D044   |
	BIT #$0200				;$B6D048   | check for "fight him" pressed
	BEQ CODE_B6D066				;$B6D04B   | if "fight him" was selected
	AND #$FDFF				;$B6D04D   | reset fight him flag
	STA $0006A3				;$B6D050   |
	LDA #$01E7				;$B6D054   |
	JSL set_sprite_animation		;$B6D057   | play klubba attack animation
	LDA $42,x				;$B6D05B   |
	STA alternate_sprite			;$B6D05D   |
	LDA #$01E8				;$B6D05F   | play klubba club attack animation
	JSL CODE_B9D09B				;$B6D062   |
CODE_B6D066:					;	   |
	JSL CODE_B9D100				;$B6D066   |
	PLB					;$B6D06A   |
	JML [$05A9]				;$B6D06B  /

;klubba club
CODE_B6D06E:
	PHB					;$B6D06E  \
	PHK					;$B6D06F   |
	PLB					;$B6D070   |
	JSL CODE_B9D100				;$B6D071   | process animation
	PLB					;$B6D075   |
	JML [$05A9]				;$B6D076  /

;krow/kreepy krow shake offsets (used to make krow shake slightly when in air during egg drop/necky swoop)
;each offset applied after 4 frames
DATA_B6D079:
	dw $0001, $0001
	dw $0000, $0001
	dw $FFFF, $0001
	dw $0000, $0001
	dw $FFFF, $FFFF
	dw $0000, $FFFF
	dw $0001, $FFFF
	dw $0000, $FFFF
	dw $0001, $FFFF
	dw $0000, $FFFF
	dw $FFFF, $FFFF
	dw $0000, $FFFF
	dw $FFFF, $0001
	dw $0000, $0001
	dw $0001, $0001
	dw $0000, $0001

;krow/kreepy krow shake offsets (used to make krow shake slightly when hit)
;each offset applied after 2 frames
DATA_B6D0B9:
	dw $0002, $0000
	dw $0002, $0000
	dw $0002, $0000
	dw $FFFE, $0000
	dw $FFFE, $0000
	dw $FFFE, $0000

;k rool vacuum attack table
DATA_B6D0D1:
	dw DATA_B6D0E5
	dw DATA_B6D0ED
	dw DATA_B6D0F5
	dw DATA_B6D0FD
	dw DATA_B6D105
	dw DATA_B6D10D
	dw DATA_B6D115
	dw DATA_B6D11D
	dw DATA_B6D125
	dw DATA_B6D12D

;k rool vacuum attack data
DATA_B6D0E5:
	dw $0000, $0000, $0000, !null_pointer

DATA_B6D0ED:
	dw $00B4, $0390, $0100, DATA_B69279

DATA_B6D0F5:
	dw $00F0, $0340, $0100, DATA_B69241

DATA_B6D0FD:
	dw $00F0, $0300, $0100, DATA_B691C7

DATA_B6D105:
	dw $00F0, $02C0, $0100, DATA_B691A7

DATA_B6D10D:
	dw $00F0, $0280, $0100, DATA_B69187

DATA_B6D115:
	dw $00F0, $0240, $0100, DATA_B69163

DATA_B6D11D:
	dw $00F0, $0200, $0100, DATA_B6912F

DATA_B6D125:
	dw $00F0, $01C0, $0100, DATA_B69109

DATA_B6D12D:
	dw $0168, $0100, $0100, DATA_B69097

;k rool vacuum attack table (krocodile kore)
DATA_B6D135:
	dw DATA_B6D13B
	dw DATA_B6D143
	dw DATA_B6D143

;k rool vacuum attack data (krocodile kore)
DATA_B6D13B:
	dw $0000, $0000, $0000, !null_pointer

DATA_B6D143:
	dw $0000, $0390, $0100, DATA_B69355

DATA_B6D14B:
	db $03, $00 : dw DATA_FF2238
	db $F6, $FF, $F6, $FF, $00, $00, $00, $00

DATA_B6D157:
	db $80, $F9 : dw DATA_FF226A
	db $00, $00, $F6, $FF, $00, $01, $00, $01

DATA_B6D173:
	db $B0, $FA : dw DATA_FF226A
	db $0A, $00, $00, $00, $00, $FE, $80, $FF
	db $80, $FA

CODE_B6D171:
	TAX					;$B6D171  \
	PHK					;$B6D172   |
	PLB					;$B6D173   |
	JMP (DATA_B6D177,x)			;$B6D174  /

DATA_B6D177:
	dw CODE_B6D1A1				;0000 kleever_main
	dw CODE_B6DE34				;0002 kleever_fireballs_main
	dw CODE_B6E0F3				;0004 dropping_hooks_main
	dw CODE_B6E49E				;0006 kleever_canball_main
	dw CODE_B6E79E				;0008 kleevers_hand_bubbles_main
	dw CODE_B6E7A5				;000A kleever_hand_main
	dw CODE_B6E97C				;000C kleever_falling_canball_main
	dw CODE_B6E9DD				;000E kleever_attack_effect_main
	dw CODE_B6E9E4				;0010 broken_kleever_hilt_main
	dw CODE_B6EAA4				;0012 broken_kleever_fire_main
	dw CODE_B6EAB8				;0014 kleever_bone_pieces_main
	dw CODE_B6EAB8				;0016 unknown_sprite_0030_main
	dw CODE_B6EAB8				;0018 kleever_pieces1_main
	dw CODE_B6EAB8				;001A kleever_pieces2_main
	dw CODE_B6EAB8				;001C kleever_pieces3_main
	dw CODE_B6EAB8				;001E unknown_sprite_0040_main
	dw CODE_B6EAB8				;0020 kleever_pieces4_main
	dw CODE_B6EAB8				;0022 kleever_pieces5_main
	dw CODE_B6ECF3				;0024 krows_egg_main
	dw CODE_B6F571				;0026 krows_body_main
	dw CODE_B6F7C3				;0028 krows_head_main


CODE_B6D1A1:
	PHB					;$B6D1A1  \
	PHK					;$B6D1A2   |
	PLB					;$B6D1A3   |
if !version == 1				;	   |
	JSL CODE_BAC949				;$B6D1A4   |
endif						;	   |
	LDX current_sprite			;$B6D1A8   |
	LDA $2E,x				;$B6D1AA   |
	BIT #$1000				;$B6D1AC   |
	BEQ CODE_B6D1B4				;$B6D1AF   |
	BRL CODE_B6D2C0				;$B6D1B1  /

CODE_B6D1B4:
	ORA #$1000				;$B6D1B4  \
	STA $2E,x				;$B6D1B7   |
	STZ $32,x				;$B6D1B9   |
	JSL CODE_B4AEAF				;$B6D1BB   |
	LDY #$0188				;$B6D1BF   |
	JSL CODE_BB842C				;$B6D1C2   |
	LDX current_sprite			;$B6D1C6   |
	LDY alternate_sprite			;$B6D1C8   |
	STY $0759				;$B6D1CA   |
	LDA $06,x				;$B6D1CD   |
	CLC					;$B6D1CF   |
	ADC #$0000				;$B6D1D0   |
	STA $0006,y				;$B6D1D3   |
	LDA #$02C0				;$B6D1D6   |
	STA $000A,y				;$B6D1D9   |
	LDX current_sprite			;$B6D1DC   |
	LDA #$0006				;$B6D1DE   |
	STA $000652				;$B6D1E1   |
	ASL A					;$B6D1E5   |
	TAY					;$B6D1E6   |
	LDA DATA_B6EC1A,y			;$B6D1E7   |
	TAY					;$B6D1EA   |
	LDA $0006,y				;$B6D1EB   |
	STA $28,x				;$B6D1EE   |
	LDA #$0005				;$B6D1F0   |
	STA $22,x				;$B6D1F3   |
	LDY #$AB44				;$B6D1F5   |
	STY $4C,x				;$B6D1F8   |
	JSR CODE_B6DB52				;$B6D1FA   |
	STZ $44,x				;$B6D1FD   |
	LDA $2E,x				;$B6D1FF   |
	ORA #$00A0				;$B6D201   |
	STA $2E,x				;$B6D204   |
	LDA #$0208				;$B6D206   |
	STA $00065A				;$B6D209   |
	LDA #$0100				;$B6D20D   |
	STA $0006E5				;$B6D210   |
	LDA #$0100				;$B6D214   |
	STA $0006E7				;$B6D217   |
	LDA #$001E				;$B6D21B   |
	STA $0006E1				;$B6D21E   |
	LDA #$001B				;$B6D222   |
	STA $0006E3				;$B6D225   |
	STZ $06E9				;$B6D229   |
	STZ $26,x				;$B6D22C   |
	STZ $2A,x				;$B6D22E   |
	STZ $20,x				;$B6D230   |
	STZ $24,x				;$B6D232   |
	STZ $0658				;$B6D234   |
	LDA #$006E				;$B6D237   |
	STA $4E,x				;$B6D23A   |
	LDA #$0005				;$B6D23C   |
	JSL CODE_B8D010				;$B6D23F   |
	LDA #$0005				;$B6D243   |
	JSL CODE_B8CFD4				;$B6D246   |
	LDX current_sprite			;$B6D24A   |
	STZ $06A1				;$B6D24C   |
	STZ $06A3				;$B6D24F   |
	STZ $06A5				;$B6D252   |
	STX $0654				;$B6D255   |
	JSR CODE_B6DC9B				;$B6D258   |
	LDY #$00A8				;$B6D25B   |
	JSL CODE_BB8443				;$B6D25E   |
	LDX current_sprite			;$B6D262   |
	LDY alternate_sprite			;$B6D264   |
	STY $42,x				;$B6D266   |
	LDA $06,x				;$B6D268   |
	STA $0006,y				;$B6D26A   |
	LDA $0A,x				;$B6D26D   |
	STA $000A,y				;$B6D26F   |
	LDA #$C000				;$B6D272   |
	STA $001C,y				;$B6D275   |
	STZ $54,x				;$B6D278   |
	LDY #$00A6				;$B6D27A   |
	JSL CODE_BB842C				;$B6D27D   |
	LDX current_sprite			;$B6D281   |
	LDY alternate_sprite			;$B6D283   |
	STY $0656				;$B6D285   |
	LDA $06,x				;$B6D288   |
	STA $0006,y				;$B6D28A   |
	LDA $0A,x				;$B6D28D   |
	STA $000A,y				;$B6D28F   |
	LDA #$0003				;$B6D292   |
	STA $0042,y				;$B6D295   |
	LDA #DATA_BAA6BC			;$B6D298   |
	STA $0044,y				;$B6D29B   |
	STA $0046,y				;$B6D29E   |
	LDA #$A6D0				;$B6D2A1   |
	STA $0048,y				;$B6D2A4   |
	TXY					;$B6D2A7   |
	LDX $42,y				;$B6D2A8   |
	INC $02,x				;$B6D2AA   |
	LDX $0656				;$B6D2AC   |
	DEC $02,x				;$B6D2AF   |
	LDX current_sprite			;$B6D2B1   |
	LDA #CODE_B6D9DD			;$B6D2B3   |
	STA $52,x				;$B6D2B6   |
	LDA #$0064				;$B6D2B8   |
	STA $46,x				;$B6D2BB   |
	JSR CODE_B6E068				;$B6D2BD   |
CODE_B6D2C0:					;	   |
	LDA $2E,x				;$B6D2C0   |
	BIT #$2000				;$B6D2C2   |
	BNE CODE_B6D2FC				;$B6D2C5   |
	BIT #$4000				;$B6D2C7   |
	BNE CODE_B6D302				;$B6D2CA   |
	LDY active_kong_sprite			;$B6D2CC   |
	LDA $002E,y				;$B6D2CF   |
	CMP #$0005				;$B6D2D2   |
	BEQ CODE_B6D302				;$B6D2D5   |
	CMP #$003B				;$B6D2D7   |
	BEQ CODE_B6D302				;$B6D2DA   |
	JSR CODE_B6D869				;$B6D2DC   |
	JSR CODE_B6D358				;$B6D2DF   |
	JSR CODE_B6D471				;$B6D2E2   |
	JSR CODE_B6DAAF				;$B6D2E5   |
	JSR CODE_B6DF9F				;$B6D2E8   |
	LDX current_sprite			;$B6D2EB   |
	LDA $2E,x				;$B6D2ED   |
	AND #$FDFF				;$B6D2EF   |
	STA $2E,x				;$B6D2F2   |
CODE_B6D2F4:					;	   |
	JSL CODE_B9D100				;$B6D2F4   |
CODE_B6D2F8:					;	   |
	PLB					;$B6D2F8   |
	JML [$05A9]				;$B6D2F9  /

CODE_B6D2FC:
	JSL CODE_BB82B8				;$B6D2FC  \
	BRA CODE_B6D2F8				;$B6D300  /

CODE_B6D302:
	LDA.l $000656				;$B6D302  \
	BNE CODE_B6D329				;$B6D306   |
	JSR CODE_B6D7F4				;$B6D308   |
	LDA.l $0006E5				;$B6D30B   |
	STA $26,x				;$B6D30F   |
	LDA.l $0006E7				;$B6D311   |
	STA $2A,x				;$B6D315   |
	LDA $22,x				;$B6D317   |
	JSL CODE_B8D010				;$B6D319   |
	LDX current_sprite			;$B6D31D   |
	LDA $22,x				;$B6D31F   |
	JSL CODE_B8CFD4				;$B6D321   |
	JSL CODE_B8CF7F				;$B6D325   |
CODE_B6D329:					;	   |
	LDA $2E,x				;$B6D329   |
	ORA #$4000				;$B6D32B   |
	STA $2E,x				;$B6D32E   |
	LDA.l $0006E9				;$B6D330   |
	BEQ CODE_B6D2F4				;$B6D334   |
	JSR CODE_B6E068				;$B6D336   |
	LDA #$0210				;$B6D339   |
	JSL set_sprite_animation		;$B6D33C   |
	LDA.l $000656				;$B6D340   |
	BEQ CODE_B6D2F4				;$B6D344   |
	STA current_sprite			;$B6D346   |
	LDA #$0211				;$B6D348   |
	JSL set_sprite_animation		;$B6D34B   |
	LDA.l $000654				;$B6D34F   |
	STA current_sprite			;$B6D353   |
	BRL CODE_B6D2F4				;$B6D355  /

CODE_B6D358:
	LDX current_sprite			;$B6D358  \
	LDA.l $000652				;$B6D35A   |
	BEQ CODE_B6D3C0				;$B6D35E   |
	LDY $44,x				;$B6D360   |
	LDA $0000,y				;$B6D362   |
	CMP #$0144				;$B6D365   |
	BEQ CODE_B6D390				;$B6D368   |
	CMP #$017C				;$B6D36A   |
	BEQ CODE_B6D390				;$B6D36D   |
	LDA $2E,x				;$B6D36F   |
	BIT #$0080				;$B6D371   |
	BNE CODE_B6D37B				;$B6D374   |
	JSR CODE_B6D3C1				;$B6D376   |
	BRA CODE_B6D3C0				;$B6D379  /

CODE_B6D37B:
	LDA.l $00065A				;$B6D37B  \
	DEC $065A				;$B6D37F   |
	BNE CODE_B6D3C0				;$B6D382   |
	LDA $2E,x				;$B6D384   |
	AND #$FF7F				;$B6D386   |
	STA $2E,x				;$B6D389   |
	JSR CODE_B6D3EB				;$B6D38B   |
	BRA CODE_B6D3C0				;$B6D38E  /

CODE_B6D390:
	LDA $002E,y				;$B6D390  \
	BNE CODE_B6D3C0				;$B6D393   |
	LDA $2E,x				;$B6D395   |
	BIT #$0040				;$B6D397   |
	BEQ CODE_B6D3AF				;$B6D39A   |
	LDA $0006,y				;$B6D39C   |
	CMP #$050E				;$B6D39F   |
	BCS CODE_B6D3C0				;$B6D3A2   |
	LDA #$0005				;$B6D3A4   |
	STA $002E,y				;$B6D3A7   |
	JSR CODE_B6D3C1				;$B6D3AA   |
	BRA CODE_B6D3C0				;$B6D3AD  /

CODE_B6D3AF:
	LDA $0006,y				;$B6D3AF  \
	CMP #$050E				;$B6D3B2   |
	BCC CODE_B6D3C0				;$B6D3B5   |
	LDA #$0005				;$B6D3B7   |
	STA $002E,y				;$B6D3BA   |
	JSR CODE_B6D3C1				;$B6D3BD   |
CODE_B6D3C0:					;	   |
	RTS					;$B6D3C0  /

CODE_B6D3C1:
	LDX current_sprite			;$B6D3C1  \
	LDA $2E,x				;$B6D3C3   |
	ORA #$0080				;$B6D3C5   |
	STA $2E,x				;$B6D3C8   |
	LDY $0654				;$B6D3CA   |
	LDA $002E,y				;$B6D3CD   |
	BIT #$0001				;$B6D3D0   |
	BEQ CODE_B6D3E1				;$B6D3D3   |
	LDA.l $0006E9				;$B6D3D5   |
	BEQ CODE_B6D3E1				;$B6D3D9   |
	CLC					;$B6D3DB   |
	ADC #$0014				;$B6D3DC   |
	BRA CODE_B6D3E4				;$B6D3DF  /

CODE_B6D3E1:
	LDA #$0050				;$B6D3E1  \
CODE_B6D3E4:					;	   |
	STA $00065A				;$B6D3E4   |
	STZ $44,x				;$B6D3E8   |
	RTS					;$B6D3EA  /

CODE_B6D3EB:
	LDY #$00B0				;$B6D3EB  \
	JSL CODE_BB842C				;$B6D3EE   |
	LDX $0654				;$B6D3F2   |
	LDA $2E,x				;$B6D3F5   |
	BIT #$0040				;$B6D3F7   |
	BNE CODE_B6D407				;$B6D3FA   |
	LDY #DATA_B6D451			;$B6D3FC   |
	JSR CODE_B6D424				;$B6D3FF   |
	LDA DATA_B6D453,y			;$B6D402   |
	BRA CODE_B6D410				;$B6D405  /

CODE_B6D407:
	LDY #DATA_B6D451			;$B6D407  \
	JSR CODE_B6D424				;$B6D40A   |
	LDA DATA_B6D463,y			;$B6D40D   |
CODE_B6D410:					;	   |
	LDY alternate_sprite			;$B6D410   |
	STA $0006,y				;$B6D412   |
	LDA #$0340				;$B6D415   |
	STA $0024,y				;$B6D418   |
	LDA #$0120				;$B6D41B   |
	STA $000A,y				;$B6D41E   |
	STY $44,x				;$B6D421   |
	RTS					;$B6D423  /

CODE_B6D424:
	JSL CODE_B4C175				;$B6D424  \
	STA $000650				;$B6D428   |
	STA CPU.dividen				;$B6D42C   |
	LDA $0000,y				;$B6D42F   |
	CMP $000650				;$B6D432   |
	BCS CODE_B6D44A				;$B6D436   |
	SEP #$20				;$B6D438   |
	STA CPU.divisor				;$B6D43A   |
	REP #$20				;$B6D43D   |
	LDA #$0008				;$B6D43F   |
CODE_B6D442:					;	   |
	DEC A					;$B6D442   |
	BNE CODE_B6D442				;$B6D443   |
	LDA CPU.multiply_result			;$B6D445   |
	BRA CODE_B6D44E				;$B6D448  /

CODE_B6D44A:
	LDA.l $000650				;$B6D44A  \
CODE_B6D44E:					;	   |
	ASL A					;$B6D44E   |
	TAY					;$B6D44F   |
	RTS					;$B6D450  /

DATA_B6D451:
	dw $0007

;kleever cannonball x pos spawn locations (left side)
DATA_B6D453:
	dw $0390
	dw $03A0
	dw $03B0
	dw $03C0
	dw $03D0
	dw $03E0
	dw $03F0

	dw $0007

;kleever cannonball x pos spawn locations (right side)
DATA_B6D463:
	dw $0640
	dw $0650
	dw $0660
	dw $0670
	dw $0680
	dw $0690
	dw $06A0


CODE_B6D471:
	LDA $000652				;$B6D471  \
	BNE CODE_B6D477				;$B6D475   |
CODE_B6D477:					;	   |
	LDX current_sprite			;$B6D477   |
	LDA $2E,x				;$B6D479   |
	BIT #$0001				;$B6D47B   |
	BEQ CODE_B6D4D2				;$B6D47E   |
	LDA $54,x				;$B6D480   |
	BEQ CODE_B6D489				;$B6D482   |
	DEC $54,x				;$B6D484   |
	BRL CODE_B6D53C				;$B6D486  /

CODE_B6D489:
	LDA.l $0006E9				;$B6D489  \
	BNE CODE_B6D4DB				;$B6D48D   |
	LDA $2E,x				;$B6D48F   |
	BIT #$0008				;$B6D491   |
	BEQ CODE_B6D4B3				;$B6D494   |
	JSL CODE_BCFB58				;$B6D496   |
	LDA #$0C7B				;$B6D49A   |
	STZ $065E				;$B6D49D   |
	JSL CODE_B6CF65				;$B6D4A0   |
	BCC CODE_B6D4B6				;$B6D4A4   |
	LDA.l $00065E				;$B6D4A6   |
	ORA #$0002				;$B6D4AA   |
	STA $00065E				;$B6D4AD   |
	BRA CODE_B6D4B6				;$B6D4B1  /

CODE_B6D4B3:
	JSR CODE_B6E69F				;$B6D4B3  \
CODE_B6D4B6:					;	   |
	LDA.l $00065E				;$B6D4B6   |
	BIT #$0002				;$B6D4BA   |
	BEQ CODE_B6D53C				;$B6D4BD   |
	LDA #$001E				;$B6D4BF   |
	LDY #$FE00				;$B6D4C2   |
	JSL CODE_B3A600				;$B6D4C5   |
	LDX current_sprite			;$B6D4C9   |
	LDA #$0014				;$B6D4CB   |
	STA $54,x				;$B6D4CE   |
	BRA CODE_B6D53C				;$B6D4D0  /

CODE_B6D4D2:
	LDA $32,x				;$B6D4D2  \
	BEQ CODE_B6D4DB				;$B6D4D4   |
CODE_B6D4D6:					;	   |
	JSR CODE_B6E275				;$B6D4D6   |
	BRA CODE_B6D53C				;$B6D4D9  /

CODE_B6D4DB:
	LDA $2E,x				;$B6D4DB  \
	BIT #$0008				;$B6D4DD   |
	BEQ CODE_B6D52A				;$B6D4E0   |
	STZ $065E				;$B6D4E2   |
	LDX current_sprite			;$B6D4E5   |
	LDY $44,x				;$B6D4E7   |
	BEQ CODE_B6D4F5				;$B6D4E9   |
	LDA $002E,y				;$B6D4EB   |
	BEQ CODE_B6D510				;$B6D4EE   |
	CMP #$0006				;$B6D4F0   |
	BEQ CODE_B6D510				;$B6D4F3   |
CODE_B6D4F5:					;	   |
	JSL CODE_BCFB58				;$B6D4F5   |
	LDA #$0200				;$B6D4F9   |
	LDY #$0200				;$B6D4FC   |
	JSL CODE_BEBD8E				;$B6D4FF   |
	BCC CODE_B6D510				;$B6D503   |
	LDA.l $00065E				;$B6D505   |
	ORA #$0001				;$B6D509   |
	STA $00065E				;$B6D50C   |
CODE_B6D510:					;	   |
	JSL CODE_BCFB58				;$B6D510   |
	LDA #$0000				;$B6D514   |
	JSL CODE_B6CF65				;$B6D517   |
	BCC CODE_B6D52D				;$B6D51B   |
	LDA.l $00065E				;$B6D51D   |
	ORA #$0002				;$B6D521   |
	STA $00065E				;$B6D524   |
	BRA CODE_B6D52D				;$B6D528  /

CODE_B6D52A:
	JSR CODE_B6E69F				;$B6D52A  \
CODE_B6D52D:					;	   |
	LDA.l $0006E9				;$B6D52D   |
	BNE CODE_B6D53C				;$B6D531   |
	LDA.l $00065E				;$B6D533   |
	BIT #$0001				;$B6D537   |
	BNE CODE_B6D4D6				;$B6D53A   |
CODE_B6D53C:					;	   |
	LDX current_sprite			;$B6D53C   |
	LDY $4C,x				;$B6D53E   |
	BEQ CODE_B6D545				;$B6D540   |
	JSR CODE_B6DB86				;$B6D542   |
CODE_B6D545:					;	   |
	LDA $52,x				;$B6D545   |
	BEQ CODE_B6D54C				;$B6D547   |
	JMP ($0052,x)				;$B6D549  /

CODE_B6D54C:
	LDA $2E,x				;$B6D54C  \
	BIT #$0004				;$B6D54E   |
	BNE CODE_B6D556				;$B6D551   |
	BRL CODE_B6D642				;$B6D553  /

CODE_B6D556:
	LDX current_sprite			;$B6D556  \
	LDA.l $0006E9				;$B6D558   |
	BEQ CODE_B6D580				;$B6D55C   |
	DEC $06E9				;$B6D55E   |
	BEQ CODE_B6D566				;$B6D561   |
	BRL CODE_B6D642				;$B6D563  /

CODE_B6D566:
	LDX current_sprite			;$B6D566  \
	LDA $2E,x				;$B6D568   |
	AND #$FFFE				;$B6D56A   |
	STA $2E,x				;$B6D56D   |
	BIT #$0008				;$B6D56F   |
	BNE CODE_B6D57D				;$B6D572   |
	LDA #$0210				;$B6D574   |
	JSL set_sprite_animation		;$B6D577   |
	LDX current_sprite			;$B6D57B   |
CODE_B6D57D:					;	   |
	JSR CODE_B6E068				;$B6D57D   |
CODE_B6D580:					;	   |
	LDY active_kong_sprite			;$B6D580   |
	LDA $0006,y				;$B6D583   |
	STA $48,x				;$B6D586   |
	LDA $000A,y				;$B6D588   |
	STA $4A,x				;$B6D58B   |
	LDA $06,x				;$B6D58D   |
	SEC					;$B6D58F   |
	SBC $0006,y				;$B6D590   |
	BPL CODE_B6D599				;$B6D593   |
	EOR #$FFFF				;$B6D595   |
	INC A					;$B6D598   |
CODE_B6D599:					;	   |
	CMP #$003C				;$B6D599   |
	BCC CODE_B6D5A1				;$B6D59C   |
	BRL CODE_B6D649				;$B6D59E  /

CODE_B6D5A1:
	LDA $0A,x				;$B6D5A1  \
	CLC					;$B6D5A3   |
	ADC #$FFCE				;$B6D5A4   |
	SEC					;$B6D5A7   |
	SBC $000A,y				;$B6D5A8   |
	BPL CODE_B6D5B5				;$B6D5AB   |
	CMP #$FFAD				;$B6D5AD   |
	BCS CODE_B6D5BD				;$B6D5B0   |
	BRL CODE_B6D649				;$B6D5B2  /

CODE_B6D5B5:
	CMP #$FFD0				;$B6D5B5  \
	BCS CODE_B6D5BD				;$B6D5B8   |
	BRL CODE_B6D649				;$B6D5BA  /

CODE_B6D5BD:
	LDA $06,x				;$B6D5BD  \
	CMP $48,x				;$B6D5BF   |
	BCS CODE_B6D5F4				;$B6D5C1   |
	LDA $2E,x				;$B6D5C3   |
	BIT #$0008				;$B6D5C5   |
	BNE CODE_B6D5D4				;$B6D5C8   |
	LDA $12,x				;$B6D5CA   |
	BIT #$4000				;$B6D5CC   |
	BNE CODE_B6D607				;$B6D5CF   |
	JSR CODE_B6DBFC				;$B6D5D1   |
CODE_B6D5D4:					;	   |
	STZ $26,x				;$B6D5D4   |
	STZ $2A,x				;$B6D5D6   |
	LDA #$0007				;$B6D5D8   |
	STA $22,x				;$B6D5DB   |
	LDA $22,x				;$B6D5DD   |
	JSL CODE_B8D010				;$B6D5DF   |
	LDX current_sprite			;$B6D5E3   |
	LDA $22,x				;$B6D5E5   |
	JSL CODE_B8CFD4				;$B6D5E7   |
	JSL CODE_B8CF7F				;$B6D5EB   |
	LDX current_sprite			;$B6D5EF   |
	BRL CODE_B6D7D2				;$B6D5F1  /

CODE_B6D5F4:
	LDA $2E,x				;$B6D5F4  \
	BIT #$0008				;$B6D5F6   |
	BNE CODE_B6D5D4				;$B6D5F9   |
	LDA $12,x				;$B6D5FB   |
	BIT #$4000				;$B6D5FD   |
	BEQ CODE_B6D607				;$B6D600   |
	JSR CODE_B6DBFC				;$B6D602   |
	BRA CODE_B6D5D4				;$B6D605  /

CODE_B6D607:
	LDA #$0219				;$B6D607  \
	JSL set_sprite_animation		;$B6D60A   |
	LDX current_sprite			;$B6D60E   |
	LDA #CODE_B6DA16			;$B6D610   |
	STA $52,x				;$B6D613   |
	STZ $20,x				;$B6D615   |
	STZ $24,x				;$B6D617   |
	BIT $12,x				;$B6D619   |
	BVC CODE_B6D63D				;$B6D61B   |
	LDA #$FC80				;$B6D61D   |
CODE_B6D620:					;	   |
	STA $20,x				;$B6D620   |
	STZ $26,x				;$B6D622   |
	STZ $2A,x				;$B6D624   |
	LDA.l $000652				;$B6D626   |
	ASL A					;$B6D62A   |
	TAY					;$B6D62B   |
	LDA DATA_B6EC1A,y			;$B6D62C   |
	TAY					;$B6D62F   |
	LDA $0004,y				;$B6D630   |
	STA $46,x				;$B6D633   |
	LDA #$0007				;$B6D635   |
	STA $22,x				;$B6D638   |
	BRL CODE_B6DA16				;$B6D63A  /

CODE_B6D63D:
	LDA #$0380				;$B6D63D  \
	BRA CODE_B6D620				;$B6D640  /

CODE_B6D642:
	LDA $2E,x				;$B6D642  \
	AND #$FFFE				;$B6D644   |
	STA $2E,x				;$B6D647   |
CODE_B6D649:					;	   |
	LDA $2E,x				;$B6D649   |
	BIT #$0002				;$B6D64B   |
	BNE CODE_B6D653				;$B6D64E   |
	BRL CODE_B6D7EF				;$B6D650  /

CODE_B6D653:
	LDY active_kong_sprite			;$B6D653  \
	LDA $06,x				;$B6D656   |
	CLC					;$B6D658   |
	ADC #$0000				;$B6D659   |
	CMP $0006,y				;$B6D65C   |
	BCC CODE_B6D69C				;$B6D65F   |
	LDA $2E,x				;$B6D661   |
	BIT #$0018				;$B6D663   |
	BNE CODE_B6D672				;$B6D666   |
	LDA $12,x				;$B6D668   |
	BIT #$4000				;$B6D66A   |
	BEQ CODE_B6D672				;$B6D66D   |
	JSR CODE_B6DBFC				;$B6D66F   |
CODE_B6D672:					;	   |
	LDY active_kong_sprite			;$B6D672   |
	LDA $06,x				;$B6D675   |
	CLC					;$B6D677   |
	ADC #$FFE0				;$B6D678   |
	CMP $0006,y				;$B6D67B   |
	BCS CODE_B6D689				;$B6D67E   |
	STZ $26,x				;$B6D680   |
	BRA CODE_B6D69A				;$B6D682  /

CODE_B6D684:
	LDA #$FC80				;$B6D684  \
	BRA CODE_B6D698				;$B6D687  /

CODE_B6D689:
	SEC					;$B6D689  \
	SBC $0006,y				;$B6D68A   |
	CMP #$0064				;$B6D68D   |
	BCS CODE_B6D684				;$B6D690   |
	LDA #$0000				;$B6D692   |
	CLC					;$B6D695   |
	SBC $28,x				;$B6D696   |
CODE_B6D698:					;	   |
	STA $26,x				;$B6D698   |
CODE_B6D69A:					;	   |
	BRA CODE_B6D6D1				;$B6D69A  /

CODE_B6D69C:
	LDA $2E,x				;$B6D69C  \
	BIT #$0018				;$B6D69E   |
	BNE CODE_B6D6AD				;$B6D6A1   |
	LDA $12,x				;$B6D6A3   |
	BIT #$4000				;$B6D6A5   |
	BNE CODE_B6D6AD				;$B6D6A8   |
	JSR CODE_B6DBFC				;$B6D6AA   |
CODE_B6D6AD:					;	   |
	LDY active_kong_sprite			;$B6D6AD   |
	LDA $06,x				;$B6D6B0   |
	CLC					;$B6D6B2   |
	ADC #$0020				;$B6D6B3   |
	CMP $0006,y				;$B6D6B6   |
	BCC CODE_B6D6C4				;$B6D6B9   |
	STZ $26,x				;$B6D6BB   |
	BRA CODE_B6D6D1				;$B6D6BD  /

CODE_B6D6BF:
	LDA #$0380				;$B6D6BF  \
	BRA CODE_B6D6CF				;$B6D6C2  /

CODE_B6D6C4:
	SEC					;$B6D6C4  \
	SBC $0006,y				;$B6D6C5   |
	CMP #$FF9C				;$B6D6C8   |
	BCC CODE_B6D6BF				;$B6D6CB   |
	LDA $28,x				;$B6D6CD   |
CODE_B6D6CF:					;	   |
	STA $26,x				;$B6D6CF   |
CODE_B6D6D1:					;	   |
	LDX current_sprite			;$B6D6D1   |
	LDY $0759				;$B6D6D3   |
	BEQ CODE_B6D6E1				;$B6D6D6   |
	LDA $06,x				;$B6D6D8   |
	CLC					;$B6D6DA   |
	ADC #$0000				;$B6D6DB   |
	STA $0006,y				;$B6D6DE   |
CODE_B6D6E1:					;	   |
	LDA $2E,x				;$B6D6E1   |
	BIT #$0004				;$B6D6E3   |
	BNE CODE_B6D6EB				;$B6D6E6   |
	BRL CODE_B6D750				;$B6D6E8  /

CODE_B6D6EB:
	LDY active_kong_sprite			;$B6D6EB  \
	LDA $0A,x				;$B6D6EE   |
	CLC					;$B6D6F0   |
	ADC #$FFCE				;$B6D6F1   |
	CMP $000A,y				;$B6D6F4   |
	BCC CODE_B6D715				;$B6D6F7   |
	LDY active_kong_sprite			;$B6D6F9   |
	LDA $0A,x				;$B6D6FC   |
	CLC					;$B6D6FE   |
	ADC #$000D				;$B6D6FF   |
	CMP $000A,y				;$B6D702   |
	BCS CODE_B6D70B				;$B6D705   |
	STZ $2A,x				;$B6D707   |
	BRA CODE_B6D713				;$B6D709  /

CODE_B6D70B:
	LDA #$0000				;$B6D70B  \
	CLC					;$B6D70E   |
	SBC $28,x				;$B6D70F   |
	STA $2A,x				;$B6D711   |
CODE_B6D713:					;	   |
	BRA CODE_B6D72B				;$B6D713  /

CODE_B6D715:
	LDY active_kong_sprite			;$B6D715  \
	LDA $0A,x				;$B6D718   |
	CLC					;$B6D71A   |
	ADC #$0020				;$B6D71B   |
	CMP $000A,y				;$B6D71E   |
	BCC CODE_B6D727				;$B6D721   |
	STZ $2A,x				;$B6D723   |
	BRA CODE_B6D72B				;$B6D725  /

CODE_B6D727:
	LDA $28,x				;$B6D727  \
	STA $2A,x				;$B6D729   |
CODE_B6D72B:					;	   |
	JSR CODE_B6D7F4				;$B6D72B   |
	LDA $26,x				;$B6D72E   |
	CLC					;$B6D730   |
	ADC $0006E5				;$B6D731   |
	STA $26,x				;$B6D735   |
	LDA $2A,x				;$B6D737   |
	CLC					;$B6D739   |
	ADC $0006E7				;$B6D73A   |
	STA $2A,x				;$B6D73E   |
	LDA $22,x				;$B6D740   |
	JSL CODE_B8D010				;$B6D742   |
	LDX current_sprite			;$B6D746   |
	LDA $22,x				;$B6D748   |
	JSL CODE_B8CFD4				;$B6D74A   |
	BRA CODE_B6D79B				;$B6D74E  /

CODE_B6D750:
	LDA $22,x				;$B6D750  \
	JSL CODE_B8D010				;$B6D752   |
	LDX current_sprite			;$B6D756   |
	STZ $2A,x				;$B6D758   |
	STZ $24,x				;$B6D75A   |
	LDX $0656				;$B6D75C   |
	DEC $42,x				;$B6D75F   |
	BNE CODE_B6D79B				;$B6D761   |
	LDA #$0003				;$B6D763   |
	STA $42,x				;$B6D766   |
	PHX					;$B6D768   |
	JSR CODE_B6D923				;$B6D769   |
	LDY $44,x				;$B6D76C   |
	LDX current_sprite			;$B6D76E   |
	LDA $0000,y				;$B6D770   |
	AND #$00FF				;$B6D773   |
	BIT #$0080				;$B6D776   |
	BEQ CODE_B6D77E				;$B6D779   |
	ORA #$FF00				;$B6D77B   |
CODE_B6D77E:					;	   |
	STA $000650				;$B6D77E   |
	LDA $0A,x				;$B6D782   |
	CLC					;$B6D784   |
	ADC $000650				;$B6D785   |
	STA $0A,x				;$B6D789   |
	TYA					;$B6D78B   |
	INC A					;$B6D78C   |
	PLY					;$B6D78D   |
	PHK					;$B6D78E   |
	PLB					;$B6D78F   |
	CMP $0048,y				;$B6D790   |
	BNE CODE_B6D798				;$B6D793   |
	LDA $0046,y				;$B6D795   |
CODE_B6D798:					;	   |
	STA $0044,y				;$B6D798   |
CODE_B6D79B:					;	   |
	JSL CODE_B8CF7F				;$B6D79B   |
	LDX current_sprite			;$B6D79F   |
	LDA $2E,x				;$B6D7A1   |
	BIT #$0004				;$B6D7A3   |
	BNE CODE_B6D7D2				;$B6D7A6   |
	LDY active_kong_sprite			;$B6D7A8   |
	LDA $06,x				;$B6D7AB   |
	CLC					;$B6D7AD   |
	ADC #$0000				;$B6D7AE   |
	CMP $0006,y				;$B6D7B1   |
	BCC CODE_B6D7C5				;$B6D7B4   |
	LDA #$042D				;$B6D7B6   |
	CMP $06,x				;$B6D7B9   |
	BCC CODE_B6D7D2				;$B6D7BB   |
	STA $06,x				;$B6D7BD   |
	STZ $20,x				;$B6D7BF   |
	STZ $26,x				;$B6D7C1   |
	BRA CODE_B6D7D2				;$B6D7C3  /

CODE_B6D7C5:
	LDA #$05F5				;$B6D7C5  \
	CMP $06,x				;$B6D7C8   |
	BCS CODE_B6D7D2				;$B6D7CA   |
	STA $06,x				;$B6D7CC   |
	STZ $20,x				;$B6D7CE   |
	STZ $26,x				;$B6D7D0   |
CODE_B6D7D2:					;	   |
	LDY $0656				;$B6D7D2   |
	BEQ CODE_B6D7E1				;$B6D7D5   |
	LDA $06,x				;$B6D7D7   |
	STA $0006,y				;$B6D7D9   |
	LDA $0A,x				;$B6D7DC   |
	STA $000A,y				;$B6D7DE   |
CODE_B6D7E1:					;	   |
	LDY $42,x				;$B6D7E1   |
	BEQ CODE_B6D7EF				;$B6D7E3   |
	LDA $06,x				;$B6D7E5   |
	STA $0006,y				;$B6D7E7   |
	LDA $0A,x				;$B6D7EA   |
	STA $000A,y				;$B6D7EC   |
CODE_B6D7EF:					;	   |
	RTS					;$B6D7EF  /

CODE_B6D7F0:
	JSR CODE_B6D7F4				;$B6D7F0  \
	RTL					;$B6D7F3  /

CODE_B6D7F4:
	LDX current_sprite			;$B6D7F4  \
	DEC $06E1				;$B6D7F6   |
	BNE CODE_B6D80E				;$B6D7F9   |
	LDA #$001E				;$B6D7FB   |
	STA $0006E1				;$B6D7FE   |
	LDA.l $0006E5				;$B6D802   |
	EOR #$FFFF				;$B6D806   |
	INC A					;$B6D809   |
	STA $0006E5				;$B6D80A   |
CODE_B6D80E:					;	   |
	DEC $06E3				;$B6D80E   |
	BNE CODE_B6D826				;$B6D811   |
	LDA #$001B				;$B6D813   |
	STA $0006E3				;$B6D816   |
	LDA.l $0006E7				;$B6D81A   |
	EOR #$FFFF				;$B6D81E   |
	INC A					;$B6D821   |
	STA $0006E7				;$B6D822   |
CODE_B6D826:					;	   |
	RTS					;$B6D826  /

	JSR CODE_B6D82F				;$B6D827   |
	RTL					;$B6D82A  /

CODE_B6D82B:
	JSR CODE_B6D835				;$B6D82B  \
	RTL					;$B6D82E  /

CODE_B6D82F:
	LDA.l $0006E9				;$B6D82F  \
	BEQ CODE_B6D862				;$B6D833   |
CODE_B6D835:					;	   |
	DEC $06ED				;$B6D835   |
	BNE CODE_B6D862				;$B6D838   |
	LDA.l $000715				;$B6D83A   |
	STA $0006ED				;$B6D83E   |
	LDY $06EB				;$B6D842   |
	LDA $0000,y				;$B6D845   |
	LDX current_sprite			;$B6D848   |
	JSL CODE_BB8C40				;$B6D84A   |
	LDA.l $0006EB				;$B6D84E   |
	INC A					;$B6D852   |
	INC A					;$B6D853   |
	CMP $000711				;$B6D854   |
	BNE CODE_B6D85E				;$B6D858   |
	LDA.l $000713				;$B6D85A   |
CODE_B6D85E:					;	   |
	STA $0006EB				;$B6D85E   |
CODE_B6D862:					;	   |
	RTS					;$B6D862  /

	LDA.l $0006E9				;$B6D863   |
	BEQ CODE_B6D896				;$B6D867   |
CODE_B6D869:					;	   |
	DEC $06ED				;$B6D869   |
	BNE CODE_B6D896				;$B6D86C   |
	LDA.l $000715				;$B6D86E   |
	STA $0006ED				;$B6D872   |
	LDY $06EB				;$B6D876   |
	LDA $0000,y				;$B6D879   |
	LDX current_sprite			;$B6D87C   |
	JSL CODE_BB8C44				;$B6D87E   |
	LDA.l $0006EB				;$B6D882   |
	INC A					;$B6D886   |
	INC A					;$B6D887   |
	CMP $000711				;$B6D888   |
	BNE CODE_B6D892				;$B6D88C   |
	LDA.l $000713				;$B6D88E   |
CODE_B6D892:					;	   |
	STA $0006EB				;$B6D892   |
CODE_B6D896:					;	   |
	RTS					;$B6D896  /

;kleever rise from lava position offsets
;these offsets are applied to kleever's current position every frame to make him rise from the lava
;used at the beginning of the fight to reveal kleever
DATA_B6D897:
	dw $0000, $FFFF
	dw $0000, $FFFE
	dw $0000, $FFFE
	dw $0000, $FFFD
	dw $0000, $FFFE
	dw $0000, $FFFD
	dw $0000, $FFFD
	dw $0000, $FFFD
	dw $0000, $FFFC
	dw $0000, $FFFD
	dw $0000, $FFFC
	dw $0000, $FFFC
	dw $0000, $FFFC
	dw $0000, $FFFC
	dw $0000, $FFFB
	dw $0000, $FFFC
	dw $0000, $FFFB
	dw $0000, $FFFC
	dw $0000, $FFFB
	dw $0000, $FFFB
	dw $0000, $FFFB
	dw $0000, $FFFB
	dw $0000, $FFFB
	dw $0000, $FFFB
	dw $0000, $FFFC
	dw $0000, $FFFC
	dw $0000, $FFFD
	dw $0000, $FFFD
	dw $0000, $FFFE
	dw $0000, $FFFE
	dw $0000, $FFFE
	dw $0000, $FFFF
	dw $0000, $FFFF
	dw $0000, $FFFF
	dw $0000, $FFFF
DATA_B6D923:

CODE_B6D923:
	%pea_mask_dbr(DATA_BAABA8)		;$B6D923  \
	PLB					;$B6D926   |
	PLB					;$B6D927   |
	RTS					;$B6D928  /

CODE_B6D929:
	PHB					;$B6D929  \
	LDA.l $0006EF				;$B6D92A   |
	BEQ CODE_B6D9A9				;$B6D92E   |
	JSR CODE_B6D923				;$B6D930   |
	PHX					;$B6D933   |
	LDX $06F1				;$B6D934   |
	LDY $0000,x				;$B6D937   |
	PHX					;$B6D93A   |
	JSL CODE_BB8418				;$B6D93B   |
	PLY					;$B6D93F   |
	BCS CODE_B6D9AB				;$B6D940   |
	LDX alternate_sprite			;$B6D942   |
	BEQ CODE_B6D9AB				;$B6D944   |
	LDA #$C000				;$B6D946   |
	STA $1C,x				;$B6D949   |
	LDA $0006,y				;$B6D94B   |
	STA $26,x				;$B6D94E   |
	LDA $0008,y				;$B6D950   |
	STA $20,x				;$B6D953   |
	LDA $000A,y				;$B6D955   |
	STA $24,x				;$B6D958   |
	LDA $000C,y				;$B6D95A   |
	STA $2A,x				;$B6D95D   |
	LDA $000E,y				;$B6D95F   |
	STA $42,x				;$B6D962   |
	LDA $0010,y				;$B6D964   |
	STA $44,x				;$B6D967   |
	STZ $46,x				;$B6D969   |
	STZ $48,x				;$B6D96B   |
	LDA $12,x				;$B6D96D   |
	AND #$3FFF				;$B6D96F   |
	ORA $0012,y				;$B6D972   |
	STA $12,x				;$B6D975   |
	PHY					;$B6D977   |
	LDY current_sprite			;$B6D978   |
	LDA $0006,y				;$B6D97A   |
	STA $06,x				;$B6D97D   |
	LDA $000A,y				;$B6D97F   |
	STA $0A,x				;$B6D982   |
	PLY					;$B6D984   |
	LDA $0002,y				;$B6D985   |
	CLC					;$B6D988   |
	ADC $06,x				;$B6D989   |
	STA $06,x				;$B6D98B   |
	LDA $0004,y				;$B6D98D   |
	CLC					;$B6D990   |
	ADC $0A,x				;$B6D991   |
	STA $0A,x				;$B6D993   |
	TYA					;$B6D995   |
	CLC					;$B6D996   |
	ADC #$0016				;$B6D997   |
	STA $0006F1				;$B6D99A   |
	DEC $06EF				;$B6D99E   |
	LDA $0014,y				;$B6D9A1   |
	JSL CODE_B9D09B				;$B6D9A4   |
CODE_B6D9A8:					;	   |
	PLX					;$B6D9A8   |
CODE_B6D9A9:					;	   |
	PLB					;$B6D9A9   |
	RTS					;$B6D9AA  /

CODE_B6D9AB:
	STZ $06EF				;$B6D9AB  \
	BRA CODE_B6D9A8				;$B6D9AE  /

CODE_B6D9B0:
	LDX $0759				;$B6D9B0  \
	STZ $1C,x				;$B6D9B3   |
	LDX current_sprite			;$B6D9B5   |
	DEC $06DF				;$B6D9B7   |
	BNE CODE_B6D9C8				;$B6D9BA   |
	LDX current_sprite			;$B6D9BC   |
	JSR CODE_B6DC9B				;$B6D9BE   |
	JSR CODE_B6DD13				;$B6D9C1   |
	STZ $52,x				;$B6D9C4   |
	BRA CODE_B6D9DC				;$B6D9C6  /

CODE_B6D9C8:
	JSR CODE_B6E41C				;$B6D9C8  \
	LDA.l $0006D5				;$B6D9CB   |
	CMP $0006D7				;$B6D9CF   |
	BNE CODE_B6D9DC				;$B6D9D3   |
	LDA #$0001				;$B6D9D5   |
	STA $0006DF				;$B6D9D8   |
CODE_B6D9DC:					;	   |
	RTS					;$B6D9DC  /

CODE_B6D9DD:
	DEC $46,x				;$B6D9DD  \
	BNE CODE_B6DA11				;$B6D9DF   |
	LDA #CODE_B6D9B0			;$B6D9E1   |
	STA $52,x				;$B6D9E4   |
	LDA #$00C8				;$B6D9E6   |
	STA $0006DF				;$B6D9E9   |
	LDA #DATA_B6D897			;$B6D9ED   |
	STA $0006D5				;$B6D9F0   |
	STA $0006D7				;$B6D9F4   |
	LDA #DATA_B6D923			;$B6D9F8   |
	STA $0006D9				;$B6D9FB   |
	LDA #$0001				;$B6D9FF   |
	STA $0006DB				;$B6DA02   |
	STA $0006DD				;$B6DA06   |
	LDA #$0769				;$B6DA0A   |
	JSL queue_sound_effect			;$B6DA0D   |
CODE_B6DA11:					;	   |
	RTS					;$B6DA11  /

DATA_B6DA12:
	db $F6, $FF, $CE, $FF

CODE_B6DA16:
	DEC $46,x				;$B6DA16  \
	BNE CODE_B6DA4C				;$B6DA18   |
	LDX current_sprite			;$B6DA1A   |
	LDA $2E,x				;$B6DA1C   |
	BIT #$0008				;$B6DA1E   |
	BEQ CODE_B6DA27				;$B6DA21   |
	INC $46,x				;$B6DA23   |
	BRA CODE_B6DA4C				;$B6DA25  /

CODE_B6DA27:
	LDA #$0217				;$B6DA27  \
	JSL set_sprite_animation		;$B6DA2A   |
	LDX current_sprite			;$B6DA2E   |
	LDA #$001E				;$B6DA30   |
	STA $46,x				;$B6DA33   |
	BIT $12,x				;$B6DA35   |
	BVC CODE_B6DA47				;$B6DA37   |
	LDA #$0440				;$B6DA39   |
CODE_B6DA3C:					;	   |
	STA $26,x				;$B6DA3C   |
	STZ $2A,x				;$B6DA3E   |
	LDA #CODE_B6DA5F			;$B6DA40   |
	STA $52,x				;$B6DA43   |
	BRA CODE_B6DA5E				;$B6DA45  /

CODE_B6DA47:
	LDA #$FBC0				;$B6DA47  \
	BRA CODE_B6DA3C				;$B6DA4A  /

CODE_B6DA4C:
	LDA $22,x				;$B6DA4C  \
	JSL CODE_B8D010				;$B6DA4E   |
	LDX current_sprite			;$B6DA52   |
	LDA $22,x				;$B6DA54   |
	JSL CODE_B8CFD4				;$B6DA56   |
	JSL CODE_B8CF7F				;$B6DA5A   |
CODE_B6DA5E:					;	   |
	RTS					;$B6DA5E  /

CODE_B6DA5F:
	DEC $46,x				;$B6DA5F  \
	BNE CODE_B6DA7F				;$B6DA61   |
	LDA #$005A				;$B6DA63   |
	STA $46,x				;$B6DA66   |
	STZ $26,x				;$B6DA68   |
	STZ $2A,x				;$B6DA6A   |
	LDA #$0007				;$B6DA6C   |
	STA $22,x				;$B6DA6F   |
	LDA #CODE_B6DA93			;$B6DA71   |
	STA $52,x				;$B6DA74   |
	LDA $2E,x				;$B6DA76   |
	ORA #$0100				;$B6DA78   |
	STA $2E,x				;$B6DA7B   |
	BRA CODE_B6DA92				;$B6DA7D  /

CODE_B6DA7F:
	LDA #$000B				;$B6DA7F  \
	JSL CODE_B8D010				;$B6DA82   |
	LDX current_sprite			;$B6DA86   |
	LDA $22,x				;$B6DA88   |
	JSL CODE_B8CFD4				;$B6DA8A   |
	JSL CODE_B8CF7F				;$B6DA8E   |
CODE_B6DA92:					;	   |
	RTS					;$B6DA92  /

CODE_B6DA93:
	DEC $46,x				;$B6DA93  \
	BNE CODE_B6DA9C				;$B6DA95   |
	JSR CODE_B6DC9B				;$B6DA97   |
	STZ $52,x				;$B6DA9A   |
CODE_B6DA9C:					;	   |
	LDA $22,x				;$B6DA9C   |
	JSL CODE_B8D010				;$B6DA9E   |
	LDX current_sprite			;$B6DAA2   |
	LDA $22,x				;$B6DAA4   |
	JSL CODE_B8CFD4				;$B6DAA6   |
	JSL CODE_B8CF7F				;$B6DAAA   |
	RTS					;$B6DAAE  /

CODE_B6DAAF:
	LDX current_sprite			;$B6DAAF  \
	LDA $52,x				;$B6DAB1   |
	BEQ CODE_B6DAB7				;$B6DAB3   |
	BRA CODE_B6DB2E				;$B6DAB5  /

CODE_B6DAB7:
	LDA.l $000652				;$B6DAB7  \
	CMP #$0004				;$B6DABB   |
	BCC CODE_B6DB2E				;$B6DABE   |
	LDA $4E,x				;$B6DAC0   |
	BEQ CODE_B6DAC8				;$B6DAC2   |
	DEC $4E,x				;$B6DAC4   |
	BRA CODE_B6DB2E				;$B6DAC6  /

CODE_B6DAC8:
	LDA $2E,x				;$B6DAC8  \
	BIT #$0008				;$B6DACA   |
	BEQ CODE_B6DAD6				;$B6DACD   |
	LDA #$0001				;$B6DACF   |
	STA $4E,x				;$B6DAD2   |
	BRA CODE_B6DB2E				;$B6DAD4  /

CODE_B6DAD6:
	LDA $2E,x				;$B6DAD6  \
	ORA #$0010				;$B6DAD8   |
	STA $2E,x				;$B6DADB   |
	LDA #$AB48				;$B6DADD   |
	STA $4C,x				;$B6DAE0   |
	LDY $42,x				;$B6DAE2   |
	PHX					;$B6DAE4   |
	STY current_sprite			;$B6DAE5   |
	LDX $0656				;$B6DAE7   |
	STX current_sprite			;$B6DAEA   |
	LDA #$0213				;$B6DAEC   |
	JSL set_sprite_animation		;$B6DAEF   |
	PLX					;$B6DAF3   |
	STX current_sprite			;$B6DAF4   |
	LDA #$0212				;$B6DAF6   |
	JSL set_sprite_animation		;$B6DAF9   |
	LDX current_sprite			;$B6DAFD   |
	LDA.l $000652				;$B6DAFF   |
	LDY $06E9				;$B6DB03   |
	BEQ CODE_B6DB09				;$B6DB06   |
	INC A					;$B6DB08   |
CODE_B6DB09:					;	   |
	ASL A					;$B6DB09   |
	TAY					;$B6DB0A   |
	LDA DATA_B6EC1A,y			;$B6DB0B   |
	TAY					;$B6DB0E   |
	INC $0658				;$B6DB0F   |
	LDA.l $000658				;$B6DB12   |
	CMP #$0003				;$B6DB16   |
	BCC CODE_B6DB29				;$B6DB19   |
	LDA.l $0006E9				;$B6DB1B   |
	BNE CODE_B6DB29				;$B6DB1F   |
	LDA $0008,y				;$B6DB21   |
	STZ $0658				;$B6DB24   |
	BRA CODE_B6DB2C				;$B6DB27  /

CODE_B6DB29:
	LDA $000A,y				;$B6DB29  \
CODE_B6DB2C:					;	   |
	STA $4E,x				;$B6DB2C   |
CODE_B6DB2E:					;	   |
	LDY $4C,x				;$B6DB2E   |
	BEQ CODE_B6DB35				;$B6DB30   |
	JSR CODE_B6DB52				;$B6DB32   |
CODE_B6DB35:					;	   |
	RTS					;$B6DB35  /

CODE_B6DB36:
	PHB					;$B6DB36  \
	PHK					;$B6DB37   |
	PLB					;$B6DB38   |
	LDA $2E,x				;$B6DB39   |
	AND #$FFEF				;$B6DB3B   |
	STA $2E,x				;$B6DB3E   |
	JSR CODE_B6DC9B				;$B6DB40   |
	LDY $4C,x				;$B6DB43   |
	JSR CODE_B6DB86				;$B6DB45   |
	LDY #$AB44				;$B6DB48   |
	STY $4C,x				;$B6DB4B   |
	JSR CODE_B6DB52				;$B6DB4D   |
	PLB					;$B6DB50   |
	RTL					;$B6DB51  /

CODE_B6DB52:
	JSR CODE_B6D923				;$B6DB52  \
	LDA $2E,x				;$B6DB55   |
	BIT #$0008				;$B6DB57   |
	BEQ CODE_B6DB62				;$B6DB5A   |
	TYA					;$B6DB5C   |
	CLC					;$B6DB5D   |
	ADC #$0050				;$B6DB5E   |
	TAY					;$B6DB61   |
CODE_B6DB62:					;	   |
	LDA $12,x				;$B6DB62   |
	BIT #$4000				;$B6DB64   |
	BNE CODE_B6DB73				;$B6DB67   |
	LDA $06,x				;$B6DB69   |
	CLC					;$B6DB6B   |
	ADC $0000,y				;$B6DB6C   |
	STA $06,x				;$B6DB6F   |
	BRA CODE_B6DB7B				;$B6DB71  /

CODE_B6DB73:
	LDA $06,x				;$B6DB73  \
	SEC					;$B6DB75   |
	SBC $0000,y				;$B6DB76   |
	STA $06,x				;$B6DB79   |
CODE_B6DB7B:					;	   |
	LDA $0A,x				;$B6DB7B   |
	CLC					;$B6DB7D   |
	ADC $0002,y				;$B6DB7E   |
	STA $0A,x				;$B6DB81   |
	PHK					;$B6DB83   |
	PLB					;$B6DB84   |
	RTS					;$B6DB85  /

CODE_B6DB86:
	JSR CODE_B6D923				;$B6DB86  \
	LDA $2E,x				;$B6DB89   |
	BIT #$0008				;$B6DB8B   |
	BEQ CODE_B6DB96				;$B6DB8E   |
	TYA					;$B6DB90   |
	CLC					;$B6DB91   |
	ADC #$0050				;$B6DB92   |
	TAY					;$B6DB95   |
CODE_B6DB96:					;	   |
	LDA $12,x				;$B6DB96   |
	BIT #$4000				;$B6DB98   |
	BNE CODE_B6DBA7				;$B6DB9B   |
	LDA $06,x				;$B6DB9D   |
	SEC					;$B6DB9F   |
	SBC $0000,y				;$B6DBA0   |
	STA $06,x				;$B6DBA3   |
	BRA CODE_B6DBAF				;$B6DBA5  /

CODE_B6DBA7:
	LDA $06,x				;$B6DBA7  \
	CLC					;$B6DBA9   |
	ADC $0000,y				;$B6DBAA   |
	STA $06,x				;$B6DBAD   |
CODE_B6DBAF:					;	   |
	LDA $0A,x				;$B6DBAF   |
	SEC					;$B6DBB1   |
	SBC $0002,y				;$B6DBB2   |
	STA $0A,x				;$B6DBB5   |
	PHK					;$B6DBB7   |
	PLB					;$B6DBB8   |
	RTS					;$B6DBB9  /

CODE_B6DBBA:
	LDY $4C,x				;$B6DBBA  \
	BEQ CODE_B6DBD1				;$B6DBBC   |
	PHB					;$B6DBBE   |
	PHK					;$B6DBBF   |
	PLB					;$B6DBC0   |
	JSR CODE_B6DB86				;$B6DBC1   |
	LDA $4C,x				;$B6DBC4   |
	CLC					;$B6DBC6   |
	ADC #$0004				;$B6DBC7   |
	STA $4C,x				;$B6DBCA   |
	TAY					;$B6DBCC   |
	JSR CODE_B6DB52				;$B6DBCD   |
	PLB					;$B6DBD0   |
CODE_B6DBD1:					;	   |
	RTL					;$B6DBD1  /

CODE_B6DBD2:
	LDY $0654				;$B6DBD2  \
	LDA $0006,y				;$B6DBD5   |
	STA $06,x				;$B6DBD8   |
	LDA $000A,y				;$B6DBDA   |
	STA $0A,x				;$B6DBDD   |
	RTL					;$B6DBDF  /

CODE_B6DBE0:
	LDY $42,x				;$B6DBE0  \
	LDA #$0000				;$B6DBE2   |
	STA $001C,y				;$B6DBE5   |
	PHX					;$B6DBE8   |
	STY current_sprite			;$B6DBE9   |
	LDA #$020F				;$B6DBEB   |
	JSL set_sprite_animation		;$B6DBEE   |
	PLX					;$B6DBF2   |
	STX current_sprite			;$B6DBF3   |
	RTL					;$B6DBF5  /

CODE_B6DBF6:
	LDA #$C000				;$B6DBF6  \
	STA $1C,x				;$B6DBF9   |
	RTL					;$B6DBFB  /

CODE_B6DBFC:
	LDY $0656				;$B6DBFC  \
	BEQ CODE_B6DC0E				;$B6DBFF   |
	PHX					;$B6DC01   |
	STY current_sprite			;$B6DC02   |
	LDA #$0216				;$B6DC04   |
	JSL set_sprite_animation		;$B6DC07   |
	PLX					;$B6DC0B   |
	STX current_sprite			;$B6DC0C   |
CODE_B6DC0E:					;	   |
	LDA #$0215				;$B6DC0E   |
	JSL set_sprite_animation		;$B6DC11   |
	LDX current_sprite			;$B6DC15   |
	LDA $2E,x				;$B6DC17   |
	ORA #$0008				;$B6DC19   |
	STA $2E,x				;$B6DC1C   |
	RTS					;$B6DC1E  /

CODE_B6DC1F:
	JSR CODE_B6DC23				;$B6DC1F  \
	RTL					;$B6DC22  /

CODE_B6DC23:
	LDA $12,x				;$B6DC23  \
	EOR #$4000				;$B6DC25   |
	STA $12,x				;$B6DC28   |
	RTS					;$B6DC2A  /

CODE_B6DC2B:
	JSR CODE_B6DC23				;$B6DC2B  \
	LDY $42,x				;$B6DC2E   |
	BEQ CODE_B6DC36				;$B6DC30   |
	TYX					;$B6DC32   |
	JSR CODE_B6DC23				;$B6DC33   |
CODE_B6DC36:					;	   |
	LDX $0656				;$B6DC36   |
	BEQ CODE_B6DC3E				;$B6DC39   |
	JSR CODE_B6DC23				;$B6DC3B   |
CODE_B6DC3E:					;	   |
	RTL					;$B6DC3E  /

CODE_B6DC3F:
	PHB					;$B6DC3F  \
	PHK					;$B6DC40   |
	PLB					;$B6DC41   |
	LDY $4C,x				;$B6DC42   |
	BEQ CODE_B6DC92				;$B6DC44   |
	JSR CODE_B6DB86				;$B6DC46   |
	LDA $2E,x				;$B6DC49   |
	AND #$FFF7				;$B6DC4B   |
	STA $2E,x				;$B6DC4E   |
	LDY #$AB44				;$B6DC50   |
	STY $4C,x				;$B6DC53   |
	JSR CODE_B6DB52				;$B6DC55   |
CODE_B6DC58:					;	   |
	LDA.l $0006E9				;$B6DC58   |
	BEQ CODE_B6DC67				;$B6DC5C   |
	LDA #$021A				;$B6DC5E   |
	JSL set_sprite_animation		;$B6DC61   |
	BRA CODE_B6DC6E				;$B6DC65  /

CODE_B6DC67:
	LDA #$0210				;$B6DC67  \
	JSL set_sprite_animation		;$B6DC6A   |
CODE_B6DC6E:					;	   |
	PHB					;$B6DC6E   |
	LDA #$4000				;$B6DC6F   |
	ASL A					;$B6DC72   |
	PHA					;$B6DC73   |
	PLB					;$B6DC74   |
	PLB					;$B6DC75   |
	XBA					;$B6DC76   |
	INC A					;$B6DC77   |
	INC A					;$B6DC78   |
	INC A					;$B6DC79   |
	INC A					;$B6DC7A   |
	XBA					;$B6DC7B   |
	TAX					;$B6DC7C   |
	LDY $0013,x				;$B6DC7D   |
	CPY #$AB82				;$B6DC80   |
	BEQ CODE_B6DC8F				;$B6DC83   |
	LDX $0654				;$B6DC85   |
	LDA $2E,x				;$B6DC88   |
	EOR #$FFFF				;$B6DC8A   |
	STA $2E,x				;$B6DC8D   |
CODE_B6DC8F:					;	   |
	PLB					;$B6DC8F   |
	PLB					;$B6DC90   |
	RTL					;$B6DC91  /

CODE_B6DC92:
	LDA $2E,x				;$B6DC92  \
	AND #$FFF7				;$B6DC94   |
	STA $2E,x				;$B6DC97   |
	BRA CODE_B6DC58				;$B6DC99  /

CODE_B6DC9B:
	PHX					;$B6DC9B  \
	LDX $0654				;$B6DC9C   |
	LDA.l $000652				;$B6DC9F   |
	CMP #$0004				;$B6DCA3   |
	BCS CODE_B6DCAF				;$B6DCA6   |
	LDA $2E,x				;$B6DCA8   |
	ORA #$0006				;$B6DCAA   |
	BRA CODE_B6DCB4				;$B6DCAD  /

CODE_B6DCAF:
	LDA $2E,x				;$B6DCAF  \
	ORA #$0002				;$B6DCB1   |
CODE_B6DCB4:					;	   |
	STA $2E,x				;$B6DCB4   |
	PLX					;$B6DCB6   |
	RTS					;$B6DCB7  /

CODE_B6DCB8:
	LDY $4C,x				;$B6DCB8  \
	BEQ CODE_B6DCBF				;$B6DCBA   |
	JSR CODE_B6DB52				;$B6DCBC   |
CODE_B6DCBF:					;	   |
	LDA #$0768				;$B6DCBF   |
	JSL queue_sound_effect			;$B6DCC2   |
	LDA.l $0006A3				;$B6DCC6   |
	ORA #$0010				;$B6DCCA   |
	STA $0006A3				;$B6DCCD   |
	LDX current_sprite			;$B6DCD1   |
	LDA $2E,x				;$B6DCD3   |
	ORA #$2000				;$B6DCD5   |
	STA $2E,x				;$B6DCD8   |
	LDA #$C000				;$B6DCDA   |
	STA $1C,x				;$B6DCDD   |
	LDY #$015C				;$B6DCDF   |
	JSL CODE_BB842C				;$B6DCE2   |
	LDX alternate_sprite			;$B6DCE6   |
	LDA #$C000				;$B6DCE8   |
	STA $1C,x				;$B6DCEB   |
	LDY #$AAE8				;$B6DCED   |
	STY $42,x				;$B6DCF0   |
	JSR CODE_B6D923				;$B6DCF2   |
	JSR CODE_B6EA83				;$B6DCF5   |
	PHK					;$B6DCF8   |
	PLB					;$B6DCF9   |
	STZ $24,x				;$B6DCFA   |
	STZ $20,x				;$B6DCFC   |
	LDY #$015A				;$B6DCFE   |
	JSL CODE_BB842C				;$B6DD01   |
	LDX alternate_sprite			;$B6DD05   |
	STX $0656				;$B6DD07   |
	LDA #$C000				;$B6DD0A   |
	STA $1C,x				;$B6DD0D   |
	LDX current_sprite			;$B6DD0F   |
	BRA CODE_B6DD55				;$B6DD11  /

CODE_B6DD13:
	LDX current_sprite			;$B6DD13  \
	STZ $52,x				;$B6DD15   |
	LDA.l $000652				;$B6DD17   |
	BEQ CODE_B6DCB8				;$B6DD1B   |
	CMP #$0003				;$B6DD1D   |
	BNE CODE_B6DD56				;$B6DD20   |
	LDA.l $000656				;$B6DD22   |
	BEQ CODE_B6DD4E				;$B6DD26   |
	LDA $2E,x				;$B6DD28   |
	ORA #$0001				;$B6DD2A   |
	STA $2E,x				;$B6DD2D   |
	LDA #CODE_B6E80D			;$B6DD2F   |
	STA $52,x				;$B6DD32   |
	LDY $0656				;$B6DD34   |
	LDA #$0002				;$B6DD37   |
	STA $0042,y				;$B6DD3A   |
	LDA #$AABE				;$B6DD3D   |
	STA $0044,y				;$B6DD40   |
	STA $0046,y				;$B6DD43   |
	LDA #$AAE8				;$B6DD46   |
	STA $0048,y				;$B6DD49   |
	BRA CODE_B6DD55				;$B6DD4C  /

CODE_B6DD4E:
	LDA $2E,x				;$B6DD4E  \
	AND #$FFFE				;$B6DD50   |
	STA $2E,x				;$B6DD53   |
CODE_B6DD55:					;	   |
	RTS					;$B6DD55  /

CODE_B6DD56:
	BCS CODE_B6DD4E				;$B6DD56  \
	LDA #$021A				;$B6DD58   |
	JSL set_sprite_animation		;$B6DD5B   |
	LDX current_sprite			;$B6DD5F   |
	BRA CODE_B6DD55				;$B6DD61  /

CODE_B6DD63:
	LDA $1C,x				;$B6DD63  \
	BIT #$C000				;$B6DD65   |
	BEQ CODE_B6DD6D				;$B6DD68   |
	BRL CODE_B6DD80				;$B6DD6A  /

CODE_B6DD6D:
	PHB					;$B6DD6D  \
	PHK					;$B6DD6E   |
	PLB					;$B6DD6F   |
	STX $0650				;$B6DD70   |
	LDY #$00AA				;$B6DD73   |
	JSL CODE_BB842C				;$B6DD76   |
	LDY alternate_sprite			;$B6DD7A   |
	JSR CODE_B6DD81				;$B6DD7C   |
	PLB					;$B6DD7F   |
CODE_B6DD80:					;	   |
	RTL					;$B6DD80  /

CODE_B6DD81:
	LDX $0654				;$B6DD81  \
	LDA $12,x				;$B6DD84   |
	BIT #$4000				;$B6DD86   |
	BEQ CODE_B6DD96				;$B6DD89   |
	LDX $0650				;$B6DD8B   |
	LDA $06,x				;$B6DD8E   |
	SEC					;$B6DD90   |
	SBC #$FFD7				;$B6DD91   |
	BRA CODE_B6DD9F				;$B6DD94  /

CODE_B6DD96:
	LDX $0650				;$B6DD96  \
	LDA $06,x				;$B6DD99   |
	CLC					;$B6DD9B   |
	ADC #$FFD7				;$B6DD9C   |
CODE_B6DD9F:					;	   |
	STA $0006,y				;$B6DD9F   |
	LDA $0A,x				;$B6DDA2   |
	CLC					;$B6DDA4   |
	ADC #$FFA6				;$B6DDA5   |
	STA $000A,y				;$B6DDA8   |
	TYX					;$B6DDAB   |
	LDY active_kong_sprite			;$B6DDAC   |
	LDA $0006,y				;$B6DDAF   |
	STA $48,x				;$B6DDB2   |
	LDA $000A,y				;$B6DDB4   |
	ADC #$FFEF				;$B6DDB7   |
	STA $4A,x				;$B6DDBA   |
	LDA.l $000652				;$B6DDBC   |
	LDY $06E9				;$B6DDC0   |
	BEQ CODE_B6DDC6				;$B6DDC3   |
	INC A					;$B6DDC5   |
CODE_B6DDC6:					;	   |
	ASL A					;$B6DDC6   |
	TAY					;$B6DDC7   |
	LDA DATA_B6EC1A,y			;$B6DDC8   |
	TAY					;$B6DDCB   |
	LDA $0000,y				;$B6DDCC   |
	STA $2C,x				;$B6DDCF   |
	LDA $48,x				;$B6DDD1   |
	SEC					;$B6DDD3   |
	SBC $06,x				;$B6DDD4   |
	BPL CODE_B6DDE5				;$B6DDD6   |
	EOR #$FFFF				;$B6DDD8   |
	INC A					;$B6DDDB   |
	STA $24,x				;$B6DDDC   |
	LDA #$FFFF				;$B6DDDE   |
	STA $20,x				;$B6DDE1   |
	BRA CODE_B6DDF3				;$B6DDE3  /

CODE_B6DDE5:
	STA $24,x				;$B6DDE5  \
	LDA #$0001				;$B6DDE7   |
	STA $20,x				;$B6DDEA   |
	LDA $12,x				;$B6DDEC   |
	EOR #$4000				;$B6DDEE   |
	STA $12,x				;$B6DDF1   |
CODE_B6DDF3:					;	   |
	LDA $4A,x				;$B6DDF3   |
	SEC					;$B6DDF5   |
	SBC $0A,x				;$B6DDF6   |
	BPL CODE_B6DE07				;$B6DDF8   |
	EOR #$FFFF				;$B6DDFA   |
	INC A					;$B6DDFD   |
	STA $26,x				;$B6DDFE   |
	LDA #$FFFF				;$B6DE00   |
	STA $22,x				;$B6DE03   |
	BRA CODE_B6DE0E				;$B6DE05  /

CODE_B6DE07:
	STA $26,x				;$B6DE07  \
	LDA #$0001				;$B6DE09   |
	STA $22,x				;$B6DE0C   |
CODE_B6DE0E:					;	   |
	LDA $24,x				;$B6DE0E   |
	CMP $26,x				;$B6DE10   |
	BEQ CODE_B6DE2C				;$B6DE12   |
	BCC CODE_B6DE21				;$B6DE14   |
	LDA $24,x				;$B6DE16   |
	LSR A					;$B6DE18   |
	STA $28,x				;$B6DE19   |
	LDA $26,x				;$B6DE1B   |
	STA $2A,x				;$B6DE1D   |
	BRA CODE_B6DE33				;$B6DE1F  /

CODE_B6DE21:
	LDA $26,x				;$B6DE21  \
	LSR A					;$B6DE23   |
	STA $28,x				;$B6DE24   |
	LDA $24,x				;$B6DE26   |
	STA $2A,x				;$B6DE28   |
	BRA CODE_B6DE33				;$B6DE2A  /

CODE_B6DE2C:
	LDA #$0001				;$B6DE2C  \
	STA $28,x				;$B6DE2F   |
	STZ $2A,x				;$B6DE31   |
CODE_B6DE33:					;	   |
	RTS					;$B6DE33  /

CODE_B6DE34:
	JSL CODE_BBBB8D				;$B6DE34  \
	BCC CODE_B6DE4C				;$B6DE38   |
	LDA #$066C				;$B6DE3A   |
	CLC					;$B6DE3D   |
	JSL CODE_B3814F				;$B6DE3E   |
	LDA #$0679				;$B6DE42   |
	JSL queue_sound_effect			;$B6DE45   |
	BRL CODE_B6DF9C				;$B6DE49  /

CODE_B6DE4C:
	LDX current_sprite			;$B6DE4C  \
	LDA $32,x				;$B6DE4E   |
	BNE CODE_B6DE61				;$B6DE50   |
	JSL CODE_BCFB58				;$B6DE52   |
	LDA #$0000				;$B6DE56   |
	JSL CODE_B6CF65				;$B6DE59   |
	BCC CODE_B6DE66				;$B6DE5D   |
	LDX current_sprite			;$B6DE5F   |
CODE_B6DE61:					;	   |
	STZ $32,x				;$B6DE61   |
	BRL CODE_B6DF5C				;$B6DE63  /

CODE_B6DE66:
	JSL CODE_BCFB58				;$B6DE66  \
	LDA #$0010				;$B6DE6A   |
	JSL CODE_BCFE0A				;$B6DE6D   |
	BCC CODE_B6DE8E				;$B6DE71   |
	LDX $6A					;$B6DE73   |
	LDA $00,x				;$B6DE75   |
	CMP #$0144				;$B6DE77   |
	BNE CODE_B6DE8E				;$B6DE7A   |
	LDA $2E,x				;$B6DE7C   |
	BEQ CODE_B6DE8E				;$B6DE7E   |
	CMP #$0003				;$B6DE80   |
	BCS CODE_B6DE88				;$B6DE83   |
	STZ $0D7A				;$B6DE85   |
CODE_B6DE88:					;	   |
	JSR CODE_B6E55F				;$B6DE88   |
	BRL CODE_B6DF5C				;$B6DE8B  /

CODE_B6DE8E:
	LDX current_sprite			;$B6DE8E  \
	LDA $2C,x				;$B6DE90   |
	STA $000650				;$B6DE92   |
if !version == 1				;	   |
	LDA.l $000769				;$B6DE96   |
	BNE CODE_B6DE9F				;$B6DE9A   |
	INC $0650				;$B6DE9C   |
endif						;	   |
CODE_B6DE9F:					;	   |
	LDA $24,x				;$B6DE9F   |
	CMP $26,x				;$B6DEA1   |
	BNE CODE_B6DEA8				;$B6DEA3   |
	BRL CODE_B6DF1D				;$B6DEA5  /

CODE_B6DEA8:
	BCS CODE_B6DEAD				;$B6DEA8  \
	BRL CODE_B6DEE5				;$B6DEAA  /

CODE_B6DEAD:
	LDA $28,x				;$B6DEAD  \
	SEC					;$B6DEAF   |
	SBC $2A,x				;$B6DEB0   |
	BPL CODE_B6DEC2				;$B6DEB2   |
	CLC					;$B6DEB4   |
	ADC $24,x				;$B6DEB5   |
	STA $28,x				;$B6DEB7   |
	LDA $0A,x				;$B6DEB9   |
	CLC					;$B6DEBB   |
	ADC $22,x				;$B6DEBC   |
	STA $0A,x				;$B6DEBE   |
	BRA CODE_B6DEC4				;$B6DEC0  /

CODE_B6DEC2:
	STA $28,x				;$B6DEC2  \
CODE_B6DEC4:					;	   |
	LDA $06,x				;$B6DEC4   |
	CLC					;$B6DEC6   |
	ADC $20,x				;$B6DEC7   |
	STA $06,x				;$B6DEC9   |
	DEC $0650				;$B6DECB   |
	BEQ CODE_B6DED3				;$B6DECE   |
	BRL CODE_B6DEAD				;$B6DED0  /

CODE_B6DED3:
	LDA $2E,x				;$B6DED3  \
	EOR #$0001				;$B6DED5   |
	STA $2E,x				;$B6DED8   |
	BEQ CODE_B6DEE0				;$B6DEDA   |
	INC $0A,x				;$B6DEDC   |
	BRA CODE_B6DEE2				;$B6DEDE  /

CODE_B6DEE0:
	DEC $0A,x				;$B6DEE0  \
CODE_B6DEE2:					;	   |
	BRL CODE_B6DF42				;$B6DEE2  /

CODE_B6DEE5:
	LDA $28,x				;$B6DEE5  \
	SEC					;$B6DEE7   |
	SBC $2A,x				;$B6DEE8   |
	BPL CODE_B6DEFA				;$B6DEEA   |
	CLC					;$B6DEEC   |
	ADC $26,x				;$B6DEED   |
	STA $28,x				;$B6DEEF   |
	LDA $06,x				;$B6DEF1   |
	CLC					;$B6DEF3   |
	ADC $20,x				;$B6DEF4   |
	STA $06,x				;$B6DEF6   |
	BRA CODE_B6DEFC				;$B6DEF8  /

CODE_B6DEFA:
	STA $28,x				;$B6DEFA  \
CODE_B6DEFC:					;	   |
	LDA $0A,x				;$B6DEFC   |
	CLC					;$B6DEFE   |
	ADC $22,x				;$B6DEFF   |
	STA $0A,x				;$B6DF01   |
	DEC $0650				;$B6DF03   |
	BEQ CODE_B6DF0B				;$B6DF06   |
	BRL CODE_B6DEE5				;$B6DF08  /

CODE_B6DF0B:
	LDA $2E,x				;$B6DF0B  \
	EOR #$0001				;$B6DF0D   |
	STA $2E,x				;$B6DF10   |
	BEQ CODE_B6DF18				;$B6DF12   |
	INC $06,x				;$B6DF14   |
	BRA CODE_B6DF1A				;$B6DF16  /

CODE_B6DF18:
	DEC $06,x				;$B6DF18  \
CODE_B6DF1A:					;	   |
	BRL CODE_B6DF42				;$B6DF1A  /

CODE_B6DF1D:
	LDA $06,x				;$B6DF1D  \
	CLC					;$B6DF1F   |
	ADC $20,x				;$B6DF20   |
	STA $06,x				;$B6DF22   |
	LDA $0A,x				;$B6DF24   |
	CLC					;$B6DF26   |
	ADC $22,x				;$B6DF27   |
	STA $0A,x				;$B6DF29   |
	DEC $0650				;$B6DF2B   |
	BEQ CODE_B6DF33				;$B6DF2E   |
	BRL CODE_B6DF1D				;$B6DF30  /

CODE_B6DF33:
	LDA $2E,x				;$B6DF33  \
	EOR #$0001				;$B6DF35   |
	STA $2E,x				;$B6DF38   |
	BEQ CODE_B6DF40				;$B6DF3A   |
	INC $06,x				;$B6DF3C   |
	BRA CODE_B6DF42				;$B6DF3E  /

CODE_B6DF40:
	DEC $06,x				;$B6DF40  \
CODE_B6DF42:					;	   |
	LDX current_sprite			;$B6DF42   |
	LDA $06,x				;$B6DF44   |
	CMP #$0357				;$B6DF46   |
	BCC CODE_B6DF5C				;$B6DF49   |
	CMP #$06C0				;$B6DF4B   |
	BCS CODE_B6DF5C				;$B6DF4E   |
	LDA $0A,x				;$B6DF50   |
	CMP #$0160				;$B6DF52   |
	BCC CODE_B6DF5C				;$B6DF55   |
	CMP #$02BA				;$B6DF57   |
	BCC CODE_B6DF90				;$B6DF5A   |
CODE_B6DF5C:					;	   |
	LDA #$066C				;$B6DF5C   |
	CLC					;$B6DF5F   |
	JSL CODE_B3814F				;$B6DF60   |
	LDA #$0679				;$B6DF64   |
	JSL queue_sound_effect			;$B6DF67   |
	LDY.w #DATA_FF1528			;$B6DF6B   |
	JSL CODE_BB8432				;$B6DF6E   |
	LDX current_sprite			;$B6DF72   |
	LDY alternate_sprite			;$B6DF74   |
	LSR $2C,x				;$B6DF76   |
	BIT $20,x				;$B6DF78   |
	BMI CODE_B6DF80				;$B6DF7A   |
	LDA $2C,x				;$B6DF7C   |
	BRA CODE_B6DF86				;$B6DF7E  /

CODE_B6DF80:
	LDA #$0000				;$B6DF80  \
	SEC					;$B6DF83   |
	SBC $2C,x				;$B6DF84   |
CODE_B6DF86:					;	   |
	XBA					;$B6DF86   |
	STA $0020,y				;$B6DF87   |
	JSL CODE_BB82B8				;$B6DF8A   |
	BRA CODE_B6DF9C				;$B6DF8E  /

CODE_B6DF90:
	LDA #$066C				;$B6DF90  \
	SEC					;$B6DF93   |
	JSL CODE_B3814F				;$B6DF94   |
	JSL CODE_B9D100				;$B6DF98   |
CODE_B6DF9C:					;	   |
	JML [$05A9]				;$B6DF9C  /

CODE_B6DF9F:
	LDX current_sprite			;$B6DF9F  \
	LDA.l $000652				;$B6DFA1   |
	BEQ CODE_B6DFCA				;$B6DFA5   |
	LDA $2E,x				;$B6DFA7   |
	BIT #$0100				;$B6DFA9   |
	BNE CODE_B6DFEF				;$B6DFAC   |
	BIT #$0800				;$B6DFAE   |
	BNE CODE_B6DFEC				;$B6DFB1   |
	LDY active_kong_sprite			;$B6DFB3   |
	LDA $2E,x				;$B6DFB6   |
	BIT #$0040				;$B6DFB8   |
	BEQ CODE_B6DFE2				;$B6DFBB   |
	LDA $0006,y				;$B6DFBD   |
	CMP #$050E				;$B6DFC0   |
	BCC CODE_B6DFEC				;$B6DFC3   |
CODE_B6DFC5:					;	   |
	LDA $002E,y				;$B6DFC5   |
	BNE CODE_B6DFEC				;$B6DFC8   |
CODE_B6DFCA:					;	   |
	LDA $2E,x				;$B6DFCA   |
	ORA #$0400				;$B6DFCC   |
	STA $2E,x				;$B6DFCF   |
	LDA.l $000652				;$B6DFD1   |
	CMP #$0004				;$B6DFD5   |
	BCC CODE_B6DFE0				;$B6DFD8   |
	STZ $06E9				;$B6DFDA   |
	JSR CODE_B6E068				;$B6DFDD   |
CODE_B6DFE0:					;	   |
	BRA CODE_B6DFEC				;$B6DFE0  /

CODE_B6DFE2:
	LDA $0006,y				;$B6DFE2  \
	CMP #$050E				;$B6DFE5   |
	BCS CODE_B6DFEC				;$B6DFE8   |
	BRA CODE_B6DFC5				;$B6DFEA  /

CODE_B6DFEC:
	BRL CODE_B6E067				;$B6DFEC  /

CODE_B6DFEF:
	BIT #$0800				;$B6DFEF  \
	BNE CODE_B6DFEC				;$B6DFF2   |
	BIT #$0200				;$B6DFF4   |
	BEQ CODE_B6E001				;$B6DFF7   |
	ORA #$0400				;$B6DFF9   |
	STA $2E,x				;$B6DFFC   |
	BRL CODE_B6E067				;$B6DFFE  /

CODE_B6E001:
	AND #$FAFF				;$B6E001  \
	STA $2E,x				;$B6E004   |
	LDA.l $000652				;$B6E006   |
	BEQ CODE_B6E067				;$B6E00A   |
	CMP #$0003				;$B6E00C   |
	BNE CODE_B6E024				;$B6E00F   |
	LDA #$0001				;$B6E011   |
	STA $0923				;$B6E014   |
	LDA.l $0006A3				;$B6E017   |
	ORA #$0004				;$B6E01B   |
	STA $0006A3				;$B6E01E   |
	BRA CODE_B6E055				;$B6E022  /

CODE_B6E024:
	DEC A					;$B6E024  \
	ASL A					;$B6E025   |
	TAX					;$B6E026   |
	LDY DATA_B6E0B3,x			;$B6E027   |
	BEQ CODE_B6E067				;$B6E02A   |
	LDA $0000,y				;$B6E02C   |
	STA $000650				;$B6E02F   |
CODE_B6E033:					;	   |
	PHY					;$B6E033   |
	LDY #DATA_FF1DC8			;$B6E034   |
	JSL CODE_BB8418				;$B6E037   |
	PLY					;$B6E03B   |
	LDX alternate_sprite			;$B6E03C   |
	LDA $0002,y				;$B6E03E   |
	STA $06,x				;$B6E041   |
	LDA $0004,y				;$B6E043   |
	STA $46,x				;$B6E046   |
	INY					;$B6E048   |
	INY					;$B6E049   |
	INY					;$B6E04A   |
	INY					;$B6E04B   |
	STZ $44,x				;$B6E04C   |
	DEC $0650				;$B6E04E   |
	BNE CODE_B6E033				;$B6E051   |
	INC $44,x				;$B6E053   |
CODE_B6E055:					;	   |
	LDX current_sprite			;$B6E055   |
	LDA.l $000652				;$B6E057   |
	CMP #$0003				;$B6E05B   |
	BNE CODE_B6E067				;$B6E05E   |
	LDA $2E,x				;$B6E060   |
	ORA #$0800				;$B6E062   |
	STA $2E,x				;$B6E065   |
CODE_B6E067:					;	   |
	RTS					;$B6E067  /

CODE_B6E068:
	LDA #DATA_B6E0A3			;$B6E068  \
	CMP $000713				;$B6E06B   |
	BEQ CODE_B6E08E				;$B6E06F   |
	LDA #$0006				;$B6E071   |
	STA $0006ED				;$B6E074   |
	STA $000715				;$B6E078   |
	LDA #DATA_B6E0A3			;$B6E07C   |
	STA $0006EB				;$B6E07F   |
	STA $000713				;$B6E083   |
	LDA #DATA_B6E0B3			;$B6E087   |
	STA $000711				;$B6E08A   |
CODE_B6E08E:					;	   |
	RTS					;$B6E08E  /


;kleever color palette numbers (used for kleever's red glowing animation)
DATA_B6E08F:
	dw $0062
	dw $0063
	dw $0057
	dw $0057
	dw $0063
	dw $0062
	dw $0051
	dw $0051
	dw $0051
	dw $0051

;kleever color palette numbers (used for kleever's eyes/handle glow animation)
DATA_B6E0A3:
	dw $009F
	dw $0051
	dw $00A1
	dw $00A2
	dw $00A0
	dw $00A2
	dw $00A1
	dw $0051


DATA_B6E0B3:
	dw !null_pointer
	dw !null_pointer
	dw !null_pointer
	dw DATA_B6E0BF
	dw DATA_B6E0D9
	dw !null_pointer

;kleever hook spawning arrays (right to left)
;only used for first 2 phases
DATA_B6E0BF:
	dw $0006				;how many hooks to spawn	
	dw $0630, $0220				;positions of hooks
	dw $05D0, $0208
	dw $0560, $0248
	dw $0510, $0208
	dw $04A0, $0248
	dw $0450, $0208

;kleever hook spawning arrays (left to right)
;only used for first 2 phases
DATA_B6E0D9:
	dw $0006				;how many hooks to spawn
	dw $03F0, $0218				;positions of hooks
	dw $0450, $01F8
	dw $04B0, $0208
	dw $0510, $0218
	dw $0570, $0228
	dw $05D0, $0238


CODE_B6E0F3:
	LDX current_sprite			;$B6E0F3  \
	LDY $0654				;$B6E0F5   |
	LDA level_number			;$B6E0F8   |
	CMP #!level_kreepy_krow			;$B6E0FA   |
	BNE CODE_B6E10A				;$B6E0FD   |
	LDA $002E,y				;$B6E0FF   |
	BIT #$2000				;$B6E102   |
	BEQ CODE_B6E10A				;$B6E105   |
	BRL CODE_B6E216				;$B6E107  /

CODE_B6E10A:
	LDA $46,x				;$B6E10A  \
	BPL CODE_B6E12A				;$B6E10C   |
	JSL CODE_BB8BE9				;$B6E10E   |
	LDX current_sprite			;$B6E112   |
	LDA $74					;$B6E114   |
	STA $46,x				;$B6E116   |
	LDA.l $0006A3				;$B6E118   |
	BIT #$0008				;$B6E11C   |
	BEQ CODE_B6E12A				;$B6E11F   |
	LDA $74					;$B6E121   |
	STA $0A,x				;$B6E123   |
	STZ $2E,x				;$B6E125   |
	BRL CODE_B6E1C7				;$B6E127  /

CODE_B6E12A:
	LDX $0654				;$B6E12A  \
	LDA $2E,x				;$B6E12D   |
	ORA #$0200				;$B6E12F   |
	STA $2E,x				;$B6E132   |
	LDX current_sprite			;$B6E134   |
	LDA $2E,x				;$B6E136   |
	ASL A					;$B6E138   |
	TAX					;$B6E139   |
	JMP (DATA_B6E13D,x)			;$B6E13A  /

DATA_B6E13D:
	dw CODE_B6E1C7
	dw CODE_B6E21D
	dw CODE_B6E25B
	dw CODE_B6E149
	dw CODE_B6E198
	dw CODE_B6E1F2


CODE_B6E149:
	LDX current_sprite			;$B6E149  \
	LDA $0A,x				;$B6E14B   |
	CMP $46,x				;$B6E14D   |
	BCC CODE_B6E178				;$B6E14F   |
	LDA #$0566				;$B6E151   |
	JSL queue_sound_effect			;$B6E154   |
	LDX current_sprite			;$B6E158   |
	LDA $46,x				;$B6E15A   |
	STA $0A,x				;$B6E15C   |
	LDA #$FD00				;$B6E15E   |
	STA $24,x				;$B6E161   |
	LDA #$0004				;$B6E163   |
	STA $2E,x				;$B6E166   |
	LDA.l $0006A3				;$B6E168   |
	BIT #$0004				;$B6E16C   |
	BEQ CODE_B6E178				;$B6E16F   |
	ORA #$0008				;$B6E171   |
	STA $0006A3				;$B6E174   |
CODE_B6E178:					;	   |
	LDA #$0003				;$B6E178   |
	JSL CODE_B8CFD4				;$B6E17B   |
	JSL CODE_B8CF7F				;$B6E17F   |
	LDA.l $0006A3				;$B6E183   |
	BIT #$0004				;$B6E187   |
	BEQ CODE_B6E195				;$B6E18A   |
	BIT #$0008				;$B6E18C   |
	BEQ CODE_B6E195				;$B6E18F   |
	JSL CODE_BBBB99				;$B6E191   |
CODE_B6E195:					;	   |
	JML [$05A9]				;$B6E195  /

CODE_B6E198:
	LDX current_sprite			;$B6E198  \
	LDA $0A,x				;$B6E19A   |
	CMP $46,x				;$B6E19C   |
	BCC CODE_B6E1AC				;$B6E19E   |
	STZ $24,x				;$B6E1A0   |
	STZ $2A,x				;$B6E1A2   |
	LDA $46,x				;$B6E1A4   |
	STA $0A,x				;$B6E1A6   |
	STZ $2E,x				;$B6E1A8   |
	BRA CODE_B6E1B7				;$B6E1AA  /

CODE_B6E1AC:
	LDA #$0005				;$B6E1AC  \
	JSL CODE_B8CFD4				;$B6E1AF   |
	JSL CODE_B8CF7F				;$B6E1B3   |
CODE_B6E1B7:					;	   |
	LDA.l $0006A3				;$B6E1B7   |
	BIT #$0004				;$B6E1BB   |
	BEQ CODE_B6E1C4				;$B6E1BE   |
	JSL CODE_BBBB99				;$B6E1C0   |
CODE_B6E1C4:					;	   |
	JML [$05A9]				;$B6E1C4  /

CODE_B6E1C7:
	LDX current_sprite			;$B6E1C7  \
	LDY $0654				;$B6E1C9   |
	LDA $002E,y				;$B6E1CC   |
	BIT #$0400				;$B6E1CF   |
	BNE CODE_B6E1E8				;$B6E1D2   |
	JSL CODE_B39982				;$B6E1D4   |
	LDA.l $0006A3				;$B6E1D8   |
	BIT #$0004				;$B6E1DC   |
	BEQ CODE_B6E1E5				;$B6E1DF   |
	JSL CODE_BBBB99				;$B6E1E1   |
CODE_B6E1E5:					;	   |
	JML [$05A9]				;$B6E1E5  /

CODE_B6E1E8:
	LDA #$0005				;$B6E1E8  \
	STA $2E,x				;$B6E1EB   |
	LDA #$0A00				;$B6E1ED   |
	STA $2A,x				;$B6E1F0   |
CODE_B6E1F2:					;	   |
	LDX current_sprite			;$B6E1F2   |
	LDA $0A,x				;$B6E1F4   |
	CMP #$02E5				;$B6E1F6   |
	BCS CODE_B6E216				;$B6E1F9   |
	LDA #$0003				;$B6E1FB   |
	JSL CODE_B8CFD4				;$B6E1FE   |
	JSL CODE_B8CF7F				;$B6E202   |
	LDA.l $0006A3				;$B6E206   |
	BIT #$0004				;$B6E20A   |
	BEQ CODE_B6E213				;$B6E20D   |
	JSL CODE_BBBB99				;$B6E20F   |
CODE_B6E213:					;	   |
	JML [$05A9]				;$B6E213  /

CODE_B6E216:
	JSL CODE_BB82B8				;$B6E216  \
	JML [$05A9]				;$B6E21A  /

CODE_B6E21D:
	LDX current_sprite			;$B6E21D  \
	LDA $0D82				;$B6E21F   |
	CMP current_sprite			;$B6E222   |
	BNE CODE_B6E23E				;$B6E224   |
	LDA $4E,x				;$B6E226   |
	BEQ CODE_B6E22E				;$B6E228   |
	JSL CODE_B398A7				;$B6E22A   |
CODE_B6E22E:					;	   |
	LDA.l $0006A3				;$B6E22E   |
	BIT #$0004				;$B6E232   |
	BEQ CODE_B6E23B				;$B6E235   |
	JSL CODE_BBBB99				;$B6E237   |
CODE_B6E23B:					;	   |
	JML [$05A9]				;$B6E23B  /

CODE_B6E23E:
	STZ $0AEE				;$B6E23E  \
	STZ $0AF2				;$B6E241   |
	LDA #$001E				;$B6E244   |
	STA $42,x				;$B6E247   |
	INC $2E,x				;$B6E249   |
	LDA.l $0006A3				;$B6E24B   |
	BIT #$0004				;$B6E24F   |
	BEQ CODE_B6E258				;$B6E252   |
	JSL CODE_BBBB99				;$B6E254   |
CODE_B6E258:					;	   |
	JML [$05A9]				;$B6E258  /

CODE_B6E25B:
	LDX current_sprite			;$B6E25B  \
	DEC $42,x				;$B6E25D   |
	BEQ CODE_B6E271				;$B6E25F   |
CODE_B6E261:					;	   |
	LDA.l $0006A3				;$B6E261   |
	BIT #$0004				;$B6E265   |
	BEQ CODE_B6E26E				;$B6E268   |
	JSL CODE_BBBB99				;$B6E26A   |
CODE_B6E26E:					;	   |
	JML [$05A9]				;$B6E26E  /

CODE_B6E271:
	STZ $2E,x				;$B6E271  \
	BRA CODE_B6E261				;$B6E273  /

CODE_B6E275:
	PHX					;$B6E275  \
	LDX $0654				;$B6E276   |
	LDA $2E,x				;$B6E279   |
	AND #$FFF7				;$B6E27B   |
	STA $2E,x				;$B6E27E   |
	LDX $0656				;$B6E280   |
	BEQ CODE_B6E28E				;$B6E283   |
	STX current_sprite			;$B6E285   |
	LDA #$0211				;$B6E287   |
	JSL set_sprite_animation		;$B6E28A   |
CODE_B6E28E:					;	   |
	LDA #$066B				;$B6E28E   |
	JSL queue_sound_effect			;$B6E291   |
	PLX					;$B6E295   |
	STX current_sprite			;$B6E296   |
	LDA #$0210				;$B6E298   |
	JSL set_sprite_animation		;$B6E29B   |
	DEC $0652				;$B6E29F   |
	BNE CODE_B6E2CF				;$B6E2A2   |
	LDA current_sprite			;$B6E2A4   |
	PHA					;$B6E2A6   |
	LDA #$000C				;$B6E2A7   |
	JSL CODE_BBC16B				;$B6E2AA   |
	PLA					;$B6E2AE   |
	STA current_sprite			;$B6E2AF   |
	PHK					;$B6E2B1   |
	PLB					;$B6E2B2   |
	LDX $0654				;$B6E2B3   |
	LDA $2E,x				;$B6E2B6   |
	AND #$F7FF				;$B6E2B8   |
	ORA #$0400				;$B6E2BB   |
	STA $2E,x				;$B6E2BE   |
	LDA.l DATA_BAA222			;$B6E2C0   |
	STA $0006EF				;$B6E2C4   |
	LDA #DATA_BAA224			;$B6E2C8   |
	STA $0006F1				;$B6E2CB   |
CODE_B6E2CF:					;	   |
	LDA.l $000652				;$B6E2CF   |
	CMP #$0003				;$B6E2D3   |
	BEQ CODE_B6E306				;$B6E2D6   |
	CMP #$0004				;$B6E2D8   |
	BCC CODE_B6E2E2				;$B6E2DB   |
	LDA #$FFFF				;$B6E2DD   |
	BRA CODE_B6E2E5				;$B6E2E0  /

CODE_B6E2E2:
	LDA #$0163				;$B6E2E2  \
CODE_B6E2E5:					;	   |
	STA $0006E9				;$B6E2E5   |
	LDA #$0005				;$B6E2E9   |
	STA $0006ED				;$B6E2EC   |
	STA $000715				;$B6E2F0   |
	LDA #DATA_B6E08F			;$B6E2F4   |
	STA $0006EB				;$B6E2F7   |
	STA $000713				;$B6E2FB   |
	LDA #DATA_B6E0A3			;$B6E2FF   |
	STA $000711				;$B6E302   |
CODE_B6E306:					;	   |
	LDX $0654				;$B6E306   |
	LDA.l $000652				;$B6E309   |
	ASL A					;$B6E30D   |
	TAY					;$B6E30E   |
	LDA DATA_B6EC1A,y			;$B6E30F   |
	TAY					;$B6E312   |
	LDA $0006,y				;$B6E313   |
	STA $28,x				;$B6E316   |
	LDY $4C,x				;$B6E318   |
	BEQ CODE_B6E327				;$B6E31A   |
	JSR CODE_B6DB86				;$B6E31C   |
	LDY #$AB48				;$B6E31F   |
	STY $4C,x				;$B6E322   |
	JSR CODE_B6DB52				;$B6E324   |
CODE_B6E327:					;	   |
	LDA $2E,x				;$B6E327   |
	AND #$FFEF				;$B6E329   |
	STA $2E,x				;$B6E32C   |
	LDY $42,x				;$B6E32E   |
	LDA #$C000				;$B6E330   |
	STA $001C,y				;$B6E333   |
	STZ $0658				;$B6E336   |
	LDA #$0001				;$B6E339   |
	STA $4E,x				;$B6E33C   |
	LDX $0654				;$B6E33E   |
	STZ $32,x				;$B6E341   |
	LDA $2E,x				;$B6E343   |
	ORA #$0001				;$B6E345   |
	LDY $0652				;$B6E348   |
	CPY #$0004				;$B6E34B   |
	BCC CODE_B6E353				;$B6E34E   |
	ORA #$0100				;$B6E350   |
CODE_B6E353:					;	   |
	EOR #$0040				;$B6E353   |
	STA $2E,x				;$B6E356   |
	LDA #CODE_B6E3EA			;$B6E358   |
	STA $52,x				;$B6E35B   |
	LDA $2E,x				;$B6E35D   |
	AND #$FFF9				;$B6E35F   |
	STA $2E,x				;$B6E362   |
	LDA.l $000652				;$B6E364   |
	CMP #$0003				;$B6E368   |
	BNE CODE_B6E37F				;$B6E36B   |
	LDA $42,x				;$B6E36D   |
	STZ $42,x				;$B6E36F   |
	PHX					;$B6E371   |
	STA current_sprite			;$B6E372   |
	JSL CODE_BB82B8				;$B6E374   |
	PLX					;$B6E378   |
	STX current_sprite			;$B6E379   |
	LDA.l $000652				;$B6E37B   |
CODE_B6E37F:					;	   |
	ASL A					;$B6E37F   |
	TAX					;$B6E380   |
	LDA DATA_B6EC1A,x			;$B6E381   |
	TAX					;$B6E384   |
	LDA $0002,x				;$B6E385   |
	STA $0006DF				;$B6E388   |
	LDA $000C,x				;$B6E38C   |
	STA $0006D5				;$B6E38F   |
	STA $0006D7				;$B6E393   |
	LDA $000E,x				;$B6E397   |
	STA $0006D9				;$B6E39A   |
	LDA #$0001				;$B6E39E   |
	STA $0006DB				;$B6E3A1   |
	STA $0006DD				;$B6E3A5   |
	RTS					;$B6E3A9  /


;kleever shake offsets (used to make kleever shake slightly when hit)
;first 2 phases (in lava)
;each offset applied after 1 frame
DATA_B6E3AA:
	dw $0002, $0000
	dw $0002, $0000
	dw $0002, $0000
	dw $FFFE, $0000
	dw $FFFE, $0000
	dw $FFFE, $0000

;kleever shake offsets (used to make kleever shake slightly when hit)
;second 2 phases (in air)
;each offset applied after 1 frame
DATA_B6E3C2:
	dw $0002, $FFFF
	dw $0002, $FFFF
	dw $0002, $FFFF
	dw $FFFE, $FFFF
	dw $FFFE, $FFFF
	dw $FFFE, $FFFF

;kleever shake offsets (used to make kleever shake slightly when defeated)
;when defeated before exploding
;each offset applied after 1 frame
DATA_B6E3DA:
	dw $FFFB, $0000
	dw $0005, $0000
	dw $0005, $0000
	dw $FFFB, $0000
DATA_B6E3EA:

CODE_B6E3EA:
	LDX current_sprite			;$B6E3EA  \
	DEC $06DF				;$B6E3EC   |
	BNE CODE_B6E404				;$B6E3EF   |
	STZ $32,x				;$B6E3F1   |
	LDA #$0210				;$B6E3F3   |
	JSL set_sprite_animation		;$B6E3F6   |
	LDX current_sprite			;$B6E3FA   |
	JSR CODE_B6DC9B				;$B6E3FC   |
	JSR CODE_B6DD13				;$B6E3FF   |
	BRA CODE_B6E41B				;$B6E402  /

CODE_B6E404:
	JSR CODE_B6E41C				;$B6E404  \
	LDA.l $000652				;$B6E407   |
	BNE CODE_B6E41B				;$B6E40B   |
	LDX current_sprite			;$B6E40D   |
	LDA $2E,x				;$B6E40F   |
	BIT #$0200				;$B6E411   |
	BNE CODE_B6E41B				;$B6E414   |
	JSR CODE_B6D929				;$B6E416   |
	LDX current_sprite			;$B6E419   |
CODE_B6E41B:					;	   |
	RTS					;$B6E41B  /

CODE_B6E41C:
	DEC $06DB				;$B6E41C  \
	BNE CODE_B6E46D				;$B6E41F   |
	LDA.l $0006DD				;$B6E421   |
	STA $0006DB				;$B6E425   |
	LDY $06D5				;$B6E429   |
	SEP #$20				;$B6E42C   |
	PHK					;$B6E42E   |
	PLA					;$B6E42F   |
	STA $D0					;$B6E430   |
	REP #$20				;$B6E432   |
	STY $CE					;$B6E434   |
	LDA $06,x				;$B6E436   |
	CLC					;$B6E438   |
	ADC [$CE]				;$B6E439   |
	STA $06,x				;$B6E43B   |
	INC $CE					;$B6E43D   |
	INC $CE					;$B6E43F   |
	LDA $0A,x				;$B6E441   |
	CLC					;$B6E443   |
	ADC [$CE]				;$B6E444   |
	STA $0A,x				;$B6E446   |
	LDA.l $0006D5				;$B6E448   |
	CLC					;$B6E44C   |
	ADC #$0004				;$B6E44D   |
	CMP $0006D9				;$B6E450   |
	BNE CODE_B6E45A				;$B6E454   |
	LDA.l $0006D7				;$B6E456   |
CODE_B6E45A:					;	   |
	STA $0006D5				;$B6E45A   |
	LDY $0656				;$B6E45E   |
	BEQ CODE_B6E46D				;$B6E461   |
	LDA $06,x				;$B6E463   |
	STA $0006,y				;$B6E465   |
	LDA $0A,x				;$B6E468   |
	STA $000A,y				;$B6E46A   |
CODE_B6E46D:					;	   |
	RTS					;$B6E46D  /

CODE_B6E46E:
	LDY $0656				;$B6E46E  \
	LDX current_sprite			;$B6E471   |
	DEC $06DF				;$B6E473   |
	BNE CODE_B6E489				;$B6E476   |
	JSR CODE_B6DC9B				;$B6E478   |
	JSR CODE_B6DD13				;$B6E47B   |
	STZ $52,x				;$B6E47E   |
	LDA $2E,x				;$B6E480   |
	AND #$FFFE				;$B6E482   |
	STA $2E,x				;$B6E485   |
	BRA CODE_B6E49D				;$B6E487  /

CODE_B6E489:
	JSR CODE_B6E41C				;$B6E489  \
	LDA.l $0006D5				;$B6E48C   |
	CMP $0006D7				;$B6E490   |
	BNE CODE_B6E49D				;$B6E494   |
	LDA #$0001				;$B6E496   |
	STA $0006DF				;$B6E499   |
CODE_B6E49D:					;	   |
	RTS					;$B6E49D  /

CODE_B6E49E:
	PHB					;$B6E49E  \
	PHK					;$B6E49F   |
	PLB					;$B6E4A0   |
	LDX current_sprite			;$B6E4A1   |
	LDA $54,x				;$B6E4A3   |
	STA $8E					;$B6E4A5   |
	LDA $2E,x				;$B6E4A7   |
	ASL A					;$B6E4A9   |
	TAX					;$B6E4AA   |
	JMP (DATA_B6E4AE,x)			;$B6E4AB  /

DATA_B6E4AE:
	dw CODE_B6E523
	dw CODE_B6E53C
	dw CODE_B6E53C
	dw CODE_B6E604
	dw CODE_B6E4BC
	dw CODE_B6E4BC
	dw CODE_B6E4C4


CODE_B6E4BC:
	JSL CODE_BB82B8				;$B6E4BC  \
	PLB					;$B6E4C0   |
	JML [$05A9]				;$B6E4C1  /

CODE_B6E4C4:
	JSL CODE_BBBB8D				;$B6E4C4  \
	BCC CODE_B6E4CF				;$B6E4C8   |
	JSR CODE_B6D3C1				;$B6E4CA   |
	BRA CODE_B6E500				;$B6E4CD  /

CODE_B6E4CF:
	LDA #$0002				;$B6E4CF  \
	JSL CODE_B8D010				;$B6E4D2   |
	LDA #$0004				;$B6E4D6   |
	JSL CODE_B8CFD4				;$B6E4D9   |
	JSL CODE_B8CF7F				;$B6E4DD   |
	JSL CODE_B9D100				;$B6E4E1   |
	LDX current_sprite			;$B6E4E5   |
	LDA $0A,x				;$B6E4E7   |
	CMP #$02C7				;$B6E4E9   |
	BCC CODE_B6E500				;$B6E4EC   |
	JSL CODE_BB82B8				;$B6E4EE   |
	LDY #$0152				;$B6E4F2   |
	JSL CODE_BB842C				;$B6E4F5   |
	LDA #$077E				;$B6E4F9   |
	JSL queue_sound_effect			;$B6E4FC   |
CODE_B6E500:					;	   |
	PLB					;$B6E500   |
	JML [$05A9]				;$B6E501  /

CODE_B6E504:
	LDX current_sprite			;$B6E504  \
	LDA $32,x				;$B6E506   |
	BNE CODE_B6E50C				;$B6E508   |
CODE_B6E50A:					;	   |
	CLC					;$B6E50A   |
	RTS					;$B6E50B  /

CODE_B6E50C:
	STZ $32,x				;$B6E50C  \
	CMP #$0001				;$B6E50E   |
	BEQ CODE_B6E515				;$B6E511   |
	BRA CODE_B6E50A				;$B6E513  /

CODE_B6E515:
	LDA #$0001				;$B6E515  \
	STA $2E,x				;$B6E518   |
	LDA #$FFFC				;$B6E51A   |
	AND $30,x				;$B6E51D   |
	STA $30,x				;$B6E51F   |
	SEC					;$B6E521   |
	RTS					;$B6E522  /

CODE_B6E523:
	JSR CODE_B6E504				;$B6E523  \
	BCS CODE_B6E559				;$B6E526   |
	JSL CODE_B39EC8				;$B6E528   |
	JSL CODE_B39EBA				;$B6E52C   |
	JSL CODE_B8D5E0				;$B6E530   |
	JSL CODE_B9D100				;$B6E534   |
	PLB					;$B6E538   |
	JML [$05A9]				;$B6E539  /

CODE_B6E53C:
	LDA $0D7A				;$B6E53C  \
	BNE CODE_B6E54C				;$B6E53F   |
	LDX current_sprite			;$B6E541   |
	LDA $32,x				;$B6E543   |
	BNE CODE_B6E54C				;$B6E545   |
	LDA #$0005				;$B6E547   |
	STA $32,x				;$B6E54A   |
CODE_B6E54C:					;	   |
	JSR CODE_B6E591				;$B6E54C   |
	BCS CODE_B6E559				;$B6E54F   |
	JSL CODE_B3A003				;$B6E551   |
	JSL CODE_B9D100				;$B6E555   |
CODE_B6E559:					;	   |
	PLB					;$B6E559   |
	JML [$05A9]				;$B6E55A  /

CODE_B6E55D:
	LDX current_sprite			;$B6E55D  \
CODE_B6E55F:					;	   |
	LDA $2E,x				;$B6E55F   |
	CMP #$0003				;$B6E561   |
	BCC CODE_B6E56F				;$B6E564   |
	LDA $20,x				;$B6E566   |
	BPL CODE_B6E57A				;$B6E568   |
CODE_B6E56A:					;	   |
	LDA #$0400				;$B6E56A   |
	BRA CODE_B6E57D				;$B6E56D  /

CODE_B6E56F:
	LDY active_kong_sprite			;$B6E56F  \
	LDA $0012,y				;$B6E572   |
	BIT #$4000				;$B6E575   |
	BNE CODE_B6E56A				;$B6E578   |
CODE_B6E57A:					;	   |
	LDA #$FC00				;$B6E57A   |
CODE_B6E57D:					;	   |
	STA $20,x				;$B6E57D   |
	LDA #$F610				;$B6E57F   |
	STA $24,x				;$B6E582   |
	STZ $26,x				;$B6E584   |
	LDA #$1000				;$B6E586   |
	STA $2A,x				;$B6E589   |
	LDA #$0006				;$B6E58B   |
	STA $2E,x				;$B6E58E   |
	RTS					;$B6E590  /

CODE_B6E591:
	LDX current_sprite			;$B6E591  \
	LDA $32,x				;$B6E593   |
	BNE CODE_B6E599				;$B6E595   |
CODE_B6E597:					;	   |
	CLC					;$B6E597   |
	RTS					;$B6E598  /

CODE_B6E599:
	STZ $32,x				;$B6E599  \
	CMP #$0001				;$B6E59B   |
	BEQ CODE_B6E5F4				;$B6E59E   |
	CMP #$0002				;$B6E5A0   |
	BEQ CODE_B6E5C1				;$B6E5A3   |
	CMP #$0004				;$B6E5A5   |
	BEQ CODE_B6E5C8				;$B6E5A8   |
	CMP #$0006				;$B6E5AA   |
	BEQ CODE_B6E5C8				;$B6E5AD   |
	CMP #$0005				;$B6E5AF   |
	BEQ CODE_B6E5B9				;$B6E5B2   |
	CMP #$0200				;$B6E5B4   |
	BNE CODE_B6E597				;$B6E5B7   |
CODE_B6E5B9:					;	   |
	STZ $0D7A				;$B6E5B9   |
	JSR CODE_B6E55D				;$B6E5BC   |
	SEC					;$B6E5BF   |
	RTS					;$B6E5C0  /

CODE_B6E5C1:
	LDA #$0002				;$B6E5C1  \
	STA $2E,x				;$B6E5C4   |
	SEC					;$B6E5C6   |
	RTS					;$B6E5C7  /

CODE_B6E5C8:
	LDA #$0003				;$B6E5C8  \
	STA $2E,x				;$B6E5CB   |
	LDA #$00C8				;$B6E5CD   |
	STA $02,x				;$B6E5D0   |
	LDY #$0006				;$B6E5D2   |
	LDA [$8E],y				;$B6E5D5   |
	BIT $20,x				;$B6E5D7   |
	BPL CODE_B6E5DF				;$B6E5D9   |
	EOR #$FFFF				;$B6E5DB   |
	INC A					;$B6E5DE   |
CODE_B6E5DF:					;	   |
	STA $26,x				;$B6E5DF   |
	LSR A					;$B6E5E1   |
	EOR $12,x				;$B6E5E2   |
	AND #$4000				;$B6E5E4   |
	EOR $12,x				;$B6E5E7   |
	STA $12,x				;$B6E5E9   |
	LDA #$02FD				;$B6E5EB   |
	JSL set_sprite_animation		;$B6E5EE   |
	SEC					;$B6E5F2   |
	RTS					;$B6E5F3  /

CODE_B6E5F4:
	STZ $2E,x				;$B6E5F4  \
	LDA #$0003				;$B6E5F6   |
	ORA $30,x				;$B6E5F9   |
	STA $30,x				;$B6E5FB   |
	LDA #$00C8				;$B6E5FD   |
	STA $02,x				;$B6E600   |
	SEC					;$B6E602   |
	RTS					;$B6E603  /

CODE_B6E604:
	LDX current_sprite			;$B6E604  \
	STZ $26,x				;$B6E606   |
	JSL CODE_B39EC8				;$B6E608   |
	JSL CODE_B39EBA				;$B6E60C   |
	JSL CODE_B8D5E0				;$B6E610   |
	LDX current_sprite			;$B6E614   |
	LDA $0A,x				;$B6E616   |
	CMP #$02C7				;$B6E618   |
	BCC CODE_B6E62A				;$B6E61B   |
	JSL CODE_BB82B8				;$B6E61D   |
	LDY #$0152				;$B6E621   |
	JSL CODE_BB842C				;$B6E624   |
	BRA CODE_B6E630				;$B6E628  /

CODE_B6E62A:
	JSL CODE_BBBB8D				;$B6E62A  \
	BCC CODE_B6E635				;$B6E62E   |
CODE_B6E630:					;	   |
	JSR CODE_B6D3C1				;$B6E630   |
	BRA CODE_B6E69B				;$B6E633  /

CODE_B6E635:
	LDX current_sprite			;$B6E635  \
	LDA $1E,x				;$B6E637   |
	BIT #$0001				;$B6E639   |
	BEQ CODE_B6E665				;$B6E63C   |
	BIT #$0002				;$B6E63E   |
	BNE CODE_B6E671				;$B6E641   |
	LDA $06,x				;$B6E643   |
	CMP #$06C9				;$B6E645   |
	BCS CODE_B6E671				;$B6E648   |
	LDA $20,x				;$B6E64A   |
	CMP #$0020				;$B6E64C   |
	BCS CODE_B6E665				;$B6E64F   |
	STZ $26,x				;$B6E651   |
	STZ $20,x				;$B6E653   |
	STZ $2E,x				;$B6E655   |
	LDA #$0211				;$B6E657   |
	STA $30,x				;$B6E65A   |
	LDA #$02E3				;$B6E65C   |
	JSL set_sprite_animation		;$B6E65F   |
	BRA CODE_B6E697				;$B6E663  /

CODE_B6E665:
	LDA $1E,x				;$B6E665  \
	AND #$0202				;$B6E667   |
	BEQ CODE_B6E688				;$B6E66A   |
	CMP #$0202				;$B6E66C   |
	BNE CODE_B6E677				;$B6E66F   |
CODE_B6E671:					;	   |
	JSR CODE_B6E55D				;$B6E671   |
	BRL CODE_B6E559				;$B6E674  /

CODE_B6E677:
	LDY #$0006				;$B6E677  \
	LDA [$8E],y				;$B6E67A   |
	BIT $12,x				;$B6E67C   |
	BVC CODE_B6E684				;$B6E67E   |
	EOR #$FFFF				;$B6E680   |
	INC A					;$B6E683   |
CODE_B6E684:					;	   |
	STA $20,x				;$B6E684   |
	STA $26,x				;$B6E686   |
CODE_B6E688:					;	   |
	LDA #$0200				;$B6E688   |
	JSL CODE_BEBE14				;$B6E68B   |
	BCC CODE_B6E697				;$B6E68F   |
	JSR CODE_B6E55D				;$B6E691   |
	BRL CODE_B6E559				;$B6E694  /

CODE_B6E697:
	JSL CODE_B9D100				;$B6E697  \
CODE_B6E69B:					;	   |
	PLB					;$B6E69B   |
	JML [$05A9]				;$B6E69C  /

CODE_B6E69F:
	STZ $065E				;$B6E69F  \
	LDA.l $000652				;$B6E6A2   |
	BNE CODE_B6E6AB				;$B6E6A6   |
	BRL CODE_B6E733				;$B6E6A8  /

CODE_B6E6AB:
	JSL CODE_BCFB58				;$B6E6AB  \
	LDX $0654				;$B6E6AF   |
	LDA $12,x				;$B6E6B2   |
	STA $32					;$B6E6B4   |
	LDA $1A,x				;$B6E6B6   |
	SEC					;$B6E6B8   |
	SBC #$1F3C				;$B6E6B9   |
	LSR A					;$B6E6BC   |
	TAY					;$B6E6BD   |
	JSR CODE_B6D923				;$B6E6BE   |
	LDA.w DATA_BAA6D0,y			;$B6E6C1   |
	TAY					;$B6E6C4   |
	LDA $0000,y				;$B6E6C5   |
	STA $00065C				;$B6E6C8   |
CODE_B6E6CC:					;	   |
	JSR CODE_B6E73A				;$B6E6CC   |
	LDX $0654				;$B6E6CF   |
	LDA $2E,x				;$B6E6D2   |
	BIT #$0001				;$B6E6D4   |
	BNE CODE_B6E6DE				;$B6E6D7   |
	LDA #$0000				;$B6E6D9   |
	BRA CODE_B6E6E1				;$B6E6DC  /

CODE_B6E6DE:
	LDA #$0C7B				;$B6E6DE  \
CODE_B6E6E1:					;	   |
	PHY					;$B6E6E1   |
	JSL CODE_B6CF65				;$B6E6E2   |
	BCC CODE_B6E6F8				;$B6E6E6   |
	LDA #$0014				;$B6E6E8   |
	STA $54,x				;$B6E6EB   |
	LDA.l $00065E				;$B6E6ED   |
	ORA #$0002				;$B6E6F1   |
	STA $00065E				;$B6E6F4   |
CODE_B6E6F8:					;	   |
	LDX $0654				;$B6E6F8   |
	LDY $44,x				;$B6E6FB   |
	BEQ CODE_B6E70A				;$B6E6FD   |
	CLC					;$B6E6FF   |
	LDA $002E,y				;$B6E700   |
	BEQ CODE_B6E72A				;$B6E703   |
	CMP #$0006				;$B6E705   |
	BEQ CODE_B6E72A				;$B6E708   |
CODE_B6E70A:					;	   |
	LDA.l $00065E				;$B6E70A   |
	BIT #$0001				;$B6E70E   |
	BNE CODE_B6E72A				;$B6E711   |
	LDA #$0200				;$B6E713   |
	LDY #$0200				;$B6E716   |
	JSL CODE_BEBD8E				;$B6E719   |
	BCC CODE_B6E72A				;$B6E71D   |
	LDA.l $00065E				;$B6E71F   |
	ORA #$0001				;$B6E723   |
	STA $00065E				;$B6E726   |
CODE_B6E72A:					;	   |
	PLY					;$B6E72A   |
	LDX $0654				;$B6E72B   |
	DEC $065C				;$B6E72E   |
	BNE CODE_B6E6CC				;$B6E731   |
CODE_B6E733:					;	   |
	PHK					;$B6E733   |
	PLB					;$B6E734   |
	RTS					;$B6E735  /

CODE_B6E736:
	JSR CODE_B6E743				;$B6E736  \
	RTL					;$B6E739  /

CODE_B6E73A:
	JSR CODE_B6E743				;$B6E73A  \
	TYA					;$B6E73D   |
	ADC #$0008				;$B6E73E   |
	TAY					;$B6E741   |
	RTS					;$B6E742  /

CODE_B6E743:
	LDA $12,x				;$B6E743  \
	BIT #$4000				;$B6E745   |
	BNE CODE_B6E762				;$B6E748   |
	LDA $06,x				;$B6E74A   |
	CLC					;$B6E74C   |
	ADC $0002,y				;$B6E74D   |
	STA $09D3				;$B6E750   |
	STA $09E3				;$B6E753   |
	CLC					;$B6E756   |
	ADC $0006,y				;$B6E757   |
	STA $09D7				;$B6E75A   |
	STA $09E7				;$B6E75D   |
	BRA CODE_B6E788				;$B6E760  /

CODE_B6E762:
	LDA $0002,y				;$B6E762  \
	EOR #$FFFF				;$B6E765   |
	INC A					;$B6E768   |
	CLC					;$B6E769   |
	ADC $06,x				;$B6E76A   |
	STA $09D7				;$B6E76C   |
	STA $09E7				;$B6E76F   |
	STA $000650				;$B6E772   |
	LDA $0006,y				;$B6E776   |
	EOR #$FFFF				;$B6E779   |
	INC A					;$B6E77C   |
	CLC					;$B6E77D   |
	ADC $000650				;$B6E77E   |
	STA $09D3				;$B6E782   |
	STA $09E3				;$B6E785   |
CODE_B6E788:					;	   |
	LDA $0A,x				;$B6E788   |
	CLC					;$B6E78A   |
	ADC $0004,y				;$B6E78B   |
	STA $09D5				;$B6E78E   |
	STA $09E5				;$B6E791   |
	ADC $0008,y				;$B6E794   |
	STA $09D9				;$B6E797   |
	STA $09E9				;$B6E79A   |
	RTS					;$B6E79D  /

CODE_B6E79E:
	JSL CODE_B9D100				;$B6E79E  \
	JML [$05A9]				;$B6E7A2  /

CODE_B6E7A5:
	PHB					;$B6E7A5  \
	PHK					;$B6E7A6   |
	PLB					;$B6E7A7   |
	JSL CODE_B9D100				;$B6E7A8   |
	LDY active_kong_sprite			;$B6E7AC   |
	LDA $002E,y				;$B6E7AF   |
	CMP #$0005				;$B6E7B2   |
	BEQ CODE_B6E809				;$B6E7B5   |
	LDA.l $000652				;$B6E7B7   |
	BNE CODE_B6E7C0				;$B6E7BB   |
	BRL CODE_B6E809				;$B6E7BD  /

CODE_B6E7C0:
	LDA $2E,x				;$B6E7C0  \
	BIT #$0001				;$B6E7C2   |
	BEQ CODE_B6E7EE				;$B6E7C5   |
	LDA $54,x				;$B6E7C7   |
	BEQ CODE_B6E7CE				;$B6E7C9   |
	BRL CODE_B6E809				;$B6E7CB  /

CODE_B6E7CE:
	JSL CODE_BCFB58				;$B6E7CE  \
	LDA #$0C7B				;$B6E7D2   |
	JSL CODE_B6CF65				;$B6E7D5   |
	BCC CODE_B6E809				;$B6E7D9   |
	LDA #$001E				;$B6E7DB   |
	LDY #$FE00				;$B6E7DE   |
	JSL CODE_B3A600				;$B6E7E1   |
	LDX current_sprite			;$B6E7E5   |
	LDA #$0014				;$B6E7E7   |
	STA $54,x				;$B6E7EA   |
	BRA CODE_B6E809				;$B6E7EC  /

CODE_B6E7EE:
	LDA $32,x				;$B6E7EE  \
	BEQ CODE_B6E7F7				;$B6E7F0   |
	JSR CODE_B6E275				;$B6E7F2   |
	BRA CODE_B6E809				;$B6E7F5  /

CODE_B6E7F7:
	JSL CODE_BCFB58				;$B6E7F7  \
	LDA #$000B				;$B6E7FB   |
	JSL CODE_BCFB8B				;$B6E7FE   |
	LDA #$0000				;$B6E802   |
	JSL CODE_B6CF65				;$B6E805   |
CODE_B6E809:					;	   |
	PLB					;$B6E809   |
	JML [$05A9]				;$B6E80A  /

CODE_B6E80D:
	LDA #$0769				;$B6E80D  \
	SEC					;$B6E810   |
	JSL CODE_B3814F				;$B6E811   |
	LDX $0656				;$B6E815   |
	LDA $42,x				;$B6E818   |
	BNE CODE_B6E83F				;$B6E81A   |
	LDA #$0002				;$B6E81C   |
	STA $42,x				;$B6E81F   |
	LDY $44,x				;$B6E821   |
	JSR CODE_B6D923				;$B6E823   |
	JSR CODE_B6E8C5				;$B6E826   |
	LDX $0654				;$B6E829   |
	JSR CODE_B6E8C5				;$B6E82C   |
	PHK					;$B6E82F   |
	PLB					;$B6E830   |
	LDX $0656				;$B6E831   |
	INY					;$B6E834   |
	INY					;$B6E835   |
	TYA					;$B6E836   |
	CMP $48,x				;$B6E837   |
	BNE CODE_B6E83D				;$B6E839   |
	LDY $46,x				;$B6E83B   |
CODE_B6E83D:					;	   |
	STY $44,x				;$B6E83D   |
CODE_B6E83F:					;	   |
	DEC $42,x				;$B6E83F   |
	LDA $0A,x				;$B6E841   |
	CMP #$0350				;$B6E843   |
	BCC CODE_B6E85D				;$B6E846   |
	LDA.l $000759				;$B6E848   |
	BEQ CODE_B6E85D				;$B6E84C   |
	STA current_sprite			;$B6E84E   |
	JSL CODE_BB82B8				;$B6E850   |
	STZ $0759				;$B6E854   |
	LDA.l $000654				;$B6E857   |
	STA current_sprite			;$B6E85B   |
CODE_B6E85D:					;	   |
	LDX $0656				;$B6E85D   |
	LDA $0A,x				;$B6E860   |
	CMP #$0365				;$B6E862   |
	BCC CODE_B6E8C4				;$B6E865   |
	STX current_sprite			;$B6E867   |
	JSL CODE_BB82B8				;$B6E869   |
	STZ $0656				;$B6E86D   |
	LDX $0654				;$B6E870   |
	STX current_sprite			;$B6E873   |
	LDA #CODE_B6E46E			;$B6E875   |
	STA $52,x				;$B6E878   |
	LDA #$0300				;$B6E87A   |
	STA $0A,x				;$B6E87D   |
	LDA #$012C				;$B6E87F   |
	STA $0006DF				;$B6E882   |
	LDA #DATA_B6E8FC			;$B6E886   |
	STA $0006D5				;$B6E889   |
	STA $0006D7				;$B6E88D   |
	LDA #DATA_B6E97C			;$B6E891   |
	STA $0006D9				;$B6E894   |
	LDA #$0001				;$B6E898   |
	STA $0006DB				;$B6E89B   |
	STA $0006DD				;$B6E89F   |
	LDX $0654				;$B6E8A3   |
	STZ $4C,x				;$B6E8A6   |
	LDY #$0152				;$B6E8A8   |
	JSL CODE_BB842C				;$B6E8AB   |
	LDY #$0154				;$B6E8AF   |
	JSL CODE_BB842C				;$B6E8B2   |
	LDY #$0156				;$B6E8B6   |
	JSL CODE_BB842C				;$B6E8B9   |
	LDA #$051E				;$B6E8BD   |
	JSL queue_sound_effect			;$B6E8C0   |
CODE_B6E8C4:					;	   |
	RTS					;$B6E8C4  /

CODE_B6E8C5:
	LDA $0000,y				;$B6E8C5  \
	AND #$00FF				;$B6E8C8   |
	BIT #$0080				;$B6E8CB   |
	BEQ CODE_B6E8D3				;$B6E8CE   |
	ORA #$FF00				;$B6E8D0   |
CODE_B6E8D3:					;	   |
	STA $000650				;$B6E8D3   |
	LDA $06,x				;$B6E8D7   |
	CLC					;$B6E8D9   |
	ADC $000650				;$B6E8DA   |
	STA $06,x				;$B6E8DE   |
	LDA $0001,y				;$B6E8E0   |
	AND #$00FF				;$B6E8E3   |
	BIT #$0080				;$B6E8E6   |
	BEQ CODE_B6E8EE				;$B6E8E9   |
	ORA #$FF00				;$B6E8EB   |
CODE_B6E8EE:					;	   |
	STA $000650				;$B6E8EE   |
	LDA $0A,x				;$B6E8F2   |
	CLC					;$B6E8F4   |
	ADC $000650				;$B6E8F5   |
	STA $0A,x				;$B6E8F9   |
	RTS					;$B6E8FB  /

DATA_B6E8FC:
	dw $0000, $FFD0
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF8
	dw $0000, $FFF9
	dw $0000, $FFF9
	dw $0000, $FFF9
	dw $0000, $FFF9
	dw $0000, $FFFA
	dw $0000, $FFFA
	dw $0000, $FFFA
	dw $0000, $FFFB
	dw $0000, $FFFB
	dw $0000, $FFFB
	dw $0000, $FFFC
	dw $0000, $FFFC
	dw $0000, $FFFD
	dw $0000, $FFFD
	dw $0000, $FFFE
	dw $0000, $FFFE
	dw $0000, $FFFE
	dw $0000, $FFFF
	dw $0000, $FFFF
	dw $0000, $FFFF
	dw $0000, $FFFF
DATA_B6E97C:

CODE_B6E97C:
	LDY current_sprite			;$B6E97C  \
	LDA $0054,y				;$B6E97E   |
	STA $8E					;$B6E981   |
	LDA $002E,y				;$B6E983   |
	AND #$00FF				;$B6E986   |
	ASL A					;$B6E989   |
	TAX					;$B6E98A   |
	JMP (DATA_B6E98E,x)			;$B6E98B  /

DATA_B6E98E:
	dw CODE_B6E994
	dw CODE_B6E9B6
	dw CODE_B6E9D3


CODE_B6E994:
	JSL CODE_BEF039				;$B6E994  \
	LDX current_sprite			;$B6E998   |
	LDA $1E,x				;$B6E99A   |
	BIT #$0001				;$B6E99C   |
	BEQ CODE_B6E9AF				;$B6E99F   |
	LDA #$FE00				;$B6E9A1   |
	STA $24,x				;$B6E9A4   |
	INC $2E,x				;$B6E9A6   |
	LDA #$064C				;$B6E9A8   |
	JSL queue_sound_effect			;$B6E9AB   |
CODE_B6E9AF:					;	   |
	JSL CODE_B9D100				;$B6E9AF   |
	JML [$05A9]				;$B6E9B3  /

CODE_B6E9B6:
	JSL CODE_BEF039				;$B6E9B6  \
	LDX current_sprite			;$B6E9BA   |
	LDA $1E,x				;$B6E9BC   |
	BIT #$0001				;$B6E9BE   |
	BEQ CODE_B6E9CC				;$B6E9C1   |
	INC $2E,x				;$B6E9C3   |
	LDA #$064C				;$B6E9C5   |
	JSL queue_sound_effect			;$B6E9C8   |
CODE_B6E9CC:					;	   |
	JSL CODE_B9D100				;$B6E9CC   |
	JML [$05A9]				;$B6E9D0  /

CODE_B6E9D3:
	TYX					;$B6E9D3  \
	LDY $4E,x				;$B6E9D4   |
	JSL CODE_BB845D				;$B6E9D6   |
	JML [$05A9]				;$B6E9DA  /

CODE_B6E9DD:
	JSL CODE_B9D100				;$B6E9DD  \
	JML [$05A9]				;$B6E9E1  /

CODE_B6E9E4:
	LDA.l $0006A3				;$B6E9E4  \
	BIT #$0010				;$B6E9E8   |
	BNE CODE_B6E9F0				;$B6E9EB   |
	BRL CODE_B6EA72				;$B6E9ED  /

CODE_B6E9F0:
	PHB					;$B6E9F0  \
	PHK					;$B6E9F1   |
	PLB					;$B6E9F2   |
	LDX current_sprite			;$B6E9F3   |
	STZ $1C,x				;$B6E9F5   |
	JSL CODE_B9D100				;$B6E9F7   |
	LDX current_sprite			;$B6E9FB   |
	DEC $44,x				;$B6E9FD   |
	BNE CODE_B6EA11				;$B6E9FF   |
	JSR CODE_B6D923				;$B6EA01   |
	LDY $42,x				;$B6EA04   |
	LDA $0000,y				;$B6EA06   |
	CMP #$0063				;$B6EA09   |
	BEQ CODE_B6EA75				;$B6EA0C   |
	JSR CODE_B6EA83				;$B6EA0E   |
CODE_B6EA11:					;	   |
	PHK					;$B6EA11   |
	PLB					;$B6EA12   |
	LDA $46,x				;$B6EA13   |
	JSL CODE_B8D010				;$B6EA15   |
	LDX current_sprite			;$B6EA19   |
	LDA $48,x				;$B6EA1B   |
	JSL CODE_B8CFD4				;$B6EA1D   |
	JSL CODE_B8CF7F				;$B6EA21   |
	LDX current_sprite			;$B6EA25   |
	LDY $0656				;$B6EA27   |
	LDA $06,x				;$B6EA2A   |
	STA $0006,y				;$B6EA2C   |
	LDA $0A,x				;$B6EA2F   |
	STA $000A,y				;$B6EA31   |
	LDA $0A,x				;$B6EA34   |
	CMP #$02F0				;$B6EA36   |
	BCC CODE_B6EA71				;$B6EA39   |
	PHX					;$B6EA3B   |
	JSL CODE_BB82B8				;$B6EA3C   |
	LDY $0656				;$B6EA40   |
	STY current_sprite			;$B6EA43   |
	JSL CODE_BB82B8				;$B6EA45   |
	PLX					;$B6EA49   |
	STX current_sprite			;$B6EA4A   |
	LDY #$0152				;$B6EA4C   |
	JSL CODE_BB842C				;$B6EA4F   |
	LDY #$0154				;$B6EA53   |
	JSL CODE_BB842C				;$B6EA56   |
	LDY #$0156				;$B6EA5A   |
	JSL CODE_BB842C				;$B6EA5D   |
	LDA #$076A				;$B6EA61   |
	JSL queue_sound_effect			;$B6EA64   |
	LDX current_sprite			;$B6EA68   |
	STZ $0A,x				;$B6EA6A   |
	LDA #$000F				;$B6EA6C   |
	STA $44,x				;$B6EA6F   |
CODE_B6EA71:					;	   |
	PLB					;$B6EA71   |
CODE_B6EA72:					;	   |
	JML [$05A9]				;$B6EA72  /

CODE_B6EA75:
	JSL CODE_BB8158				;$B6EA75  \
	JSL CODE_BB82B8				;$B6EA79   |
	BRA CODE_B6EA71				;$B6EA7D  /

	JSR CODE_B6EA83				;$B6EA7F   |
	RTL					;$B6EA82  /

CODE_B6EA83:
	LDA $0000,y				;$B6EA83  \
	STA $44,x				;$B6EA86   |
	LDA $0002,y				;$B6EA88   |
	STA $26,x				;$B6EA8B   |
	LDA $0004,y				;$B6EA8D   |
	STA $2A,x				;$B6EA90   |
	LDA $0006,y				;$B6EA92   |
	STA $46,x				;$B6EA95   |
	LDA $0008,y				;$B6EA97   |
	STA $48,x				;$B6EA9A   |
	TYA					;$B6EA9C   |
	CLC					;$B6EA9D   |
	ADC #$000A				;$B6EA9E   |
	STA $42,x				;$B6EAA1   |
	RTS					;$B6EAA3  /

CODE_B6EAA4:
	LDA.l $0006A3				;$B6EAA4  \
	BIT #$0010				;$B6EAA8   |
	BEQ CODE_B6EAB5				;$B6EAAB   |
	LDX current_sprite			;$B6EAAD   |
	STZ $1C,x				;$B6EAAF   |
	JSL CODE_B9D100				;$B6EAB1   |
CODE_B6EAB5:					;	   |
	JML [$05A9]				;$B6EAB5  /

CODE_B6EAB8:
	LDA.l $0006A3				;$B6EAB8  \
	BIT #$0010				;$B6EABC   |
	BNE CODE_B6EAC4				;$B6EABF   |
	BRL CODE_B6EBAC				;$B6EAC1  /

CODE_B6EAC4:
	LDX current_sprite			;$B6EAC4  \
	LDA $48,x				;$B6EAC6   |
	BEQ CODE_B6EACD				;$B6EAC8   |
	BRL CODE_B6EBAC				;$B6EACA  /

CODE_B6EACD:
	STZ $1C,x				;$B6EACD  \
	LDA level_number			;$B6EACF   |
	CMP #!level_k_rool_duel			;$B6EAD1   |
	BNE CODE_B6EAE2				;$B6EAD4   |
	LDA.l $0006A3				;$B6EAD6   |
	BIT #$0010				;$B6EADA   |
	BEQ CODE_B6EAE2				;$B6EADD   |
	BRL CODE_B6EBAF				;$B6EADF  /

CODE_B6EAE2:
	LDA $0A,x				;$B6EAE2  \
	CMP #$0287				;$B6EAE4   |
	BCC CODE_B6EB27				;$B6EAE7   |
	CMP #$0296				;$B6EAE9   |
	BCS CODE_B6EB27				;$B6EAEC   |
	LDA $06,x				;$B6EAEE   |
	CMP #$060F				;$B6EAF0   |
	BCC CODE_B6EB27				;$B6EAF3   |
	LDA #$0001				;$B6EAF5   |
	STA $46,x				;$B6EAF8   |
	LDA $24,x				;$B6EAFA   |
	BMI CODE_B6EB09				;$B6EAFC   |
	BEQ CODE_B6EB09				;$B6EAFE   |
	EOR #$FFFF				;$B6EB00   |
	INC A					;$B6EB03   |
	CMP #$FF00				;$B6EB04   |
	BCC CODE_B6EB17				;$B6EB07   |
CODE_B6EB09:					;	   |
	INC $48,x				;$B6EB09   |
	LDA #$0567				;$B6EB0B   |
	JSL queue_sound_effect			;$B6EB0E   |
	LDX current_sprite			;$B6EB12   |
	BRL CODE_B6EBAC				;$B6EB14  /

CODE_B6EB17:
	STA $24,x				;$B6EB17  \
	LDA #$0567				;$B6EB19   |
	JSL queue_sound_effect			;$B6EB1C   |
	LDX current_sprite			;$B6EB20   |
	LDA #$0287				;$B6EB22   |
	STA $0A,x				;$B6EB25   |
CODE_B6EB27:					;	   |
	LDA $06,x				;$B6EB27   |
	CMP #$06CC				;$B6EB29   |
	BCC CODE_B6EB65				;$B6EB2C   |
	LDA $0A,x				;$B6EB2E   |
	CMP #$0296				;$B6EB30   |
	BCS CODE_B6EB65				;$B6EB33   |
	CMP #$0250				;$B6EB35   |
	BCC CODE_B6EB65				;$B6EB38   |
	LDX current_sprite			;$B6EB3A   |
	LDA #$06CC				;$B6EB3C   |
	STA $06,x				;$B6EB3F   |
	LDA #$0001				;$B6EB41   |
	STA $46,x				;$B6EB44   |
	LDA $20,x				;$B6EB46   |
	EOR #$FFFF				;$B6EB48   |
	INC A					;$B6EB4B   |
	CMP #$FFC0				;$B6EB4C   |
	BCC CODE_B6EB5C				;$B6EB4F   |
	INC $48,x				;$B6EB51   |
	LDA #$0567				;$B6EB53   |
	JSL queue_sound_effect			;$B6EB56   |
	BRA CODE_B6EBAC				;$B6EB5A  /

CODE_B6EB5C:
	STA $20,x				;$B6EB5C  \
	STZ $26,x				;$B6EB5E   |
	LDA #$0001				;$B6EB60   |
	STA $42,x				;$B6EB63   |
CODE_B6EB65:					;	   |
	LDA $46,x				;$B6EB65   |
	BEQ CODE_B6EB73				;$B6EB67   |
	LDA $3A,x				;$B6EB69   |
	BEQ CODE_B6EB73				;$B6EB6B   |
	DEC A					;$B6EB6D   |
	DEC A					;$B6EB6E   |
	BMI CODE_B6EB73				;$B6EB6F   |
	STA $3A,x				;$B6EB71   |
CODE_B6EB73:					;	   |
	LDA $0A,x				;$B6EB73   |
	CMP #$0297				;$B6EB75   |
	BCC CODE_B6EB7F				;$B6EB78   |
	LDA #$0500				;$B6EB7A   |
	STA $2A,x				;$B6EB7D   |
CODE_B6EB7F:					;	   |
	LDA $42,x				;$B6EB7F   |
	JSL CODE_B8D010				;$B6EB81   |
	LDX current_sprite			;$B6EB85   |
	LDA $44,x				;$B6EB87   |
	JSL CODE_B8CFD4				;$B6EB89   |
	JSL CODE_B8CF7F				;$B6EB8D   |
	JSL CODE_B9D100				;$B6EB91   |
	LDX current_sprite			;$B6EB95   |
	LDA $24,x				;$B6EB97   |
	BMI CODE_B6EBAC				;$B6EB99   |
	LDA $0A,x				;$B6EB9B   |
	SEC					;$B6EB9D   |
	SBC $17C2				;$B6EB9E   |
	BMI CODE_B6EBAC				;$B6EBA1   |
	CMP #$00E0				;$B6EBA3   |
	BMI CODE_B6EBAC				;$B6EBA6   |
	JSL CODE_BB82B8				;$B6EBA8   |
CODE_B6EBAC:					;	   |
	JML [$05A9]				;$B6EBAC  /

CODE_B6EBAF:
	LDA #$01C1				;$B6EBAF  \
	CMP $0A,x				;$B6EBB2   |
	BCS CODE_B6EBE6				;$B6EBB4   |
	STA $0A,x				;$B6EBB6   |
	LDX current_sprite			;$B6EBB8   |
	LDA #$0001				;$B6EBBA   |
	STA $46,x				;$B6EBBD   |
	LDA $24,x				;$B6EBBF   |
	BMI CODE_B6EBCE				;$B6EBC1   |
	BEQ CODE_B6EBCE				;$B6EBC3   |
	EOR #$FFFF				;$B6EBC5   |
	INC A					;$B6EBC8   |
	CMP #$FEC0				;$B6EBC9   |
	BCC CODE_B6EBDB				;$B6EBCC   |
CODE_B6EBCE:					;	   |
	INC $48,x				;$B6EBCE   |
	LDA #$0567				;$B6EBD0   |
	JSL queue_sound_effect			;$B6EBD3   |
	LDX current_sprite			;$B6EBD7   |
	BRA CODE_B6EC07				;$B6EBD9  /

CODE_B6EBDB:
	STA $24,x				;$B6EBDB  \
	LDA #$0567				;$B6EBDD   |
	JSL queue_sound_effect			;$B6EBE0   |
	LDX current_sprite			;$B6EBE4   |
CODE_B6EBE6:					;	   |
	LDA $06,x				;$B6EBE6   |
	CMP #$0100				;$B6EBE8   |
	BCS CODE_B6EBF2				;$B6EBEB   |
	JSR CODE_B6EC0A				;$B6EBED   |
	LDA $06,x				;$B6EBF0   |
CODE_B6EBF2:					;	   |
	CMP #$029F				;$B6EBF2   |
	BCC CODE_B6EBFA				;$B6EBF5   |
	JSR CODE_B6EC0A				;$B6EBF7   |
CODE_B6EBFA:					;	   |
	LDA $46,x				;$B6EBFA   |
	BEQ CODE_B6EC07				;$B6EBFC   |
	LDA $3A,x				;$B6EBFE   |
	BEQ CODE_B6EC07				;$B6EC00   |
	DEC A					;$B6EC02   |
	BMI CODE_B6EC07				;$B6EC03   |
	STA $3A,x				;$B6EC05   |
CODE_B6EC07:					;	   |
	BRL CODE_B6EB7F				;$B6EC07  /

CODE_B6EC0A:
	LDA $20,x				;$B6EC0A  \
	EOR #$FFFF				;$B6EC0C   |
	INC A					;$B6EC0F   |
	STA $20,x				;$B6EC10   |
	STZ $26,x				;$B6EC12   |
	LDA #$0003				;$B6EC14   |
	STA $42,x				;$B6EC17   |
	RTS					;$B6EC19  /

;kleever attack patterns
DATA_B6EC1A:
	dw DATA_B6EC28
	dw DATA_B6EC3C
	dw DATA_B6EC50
	dw DATA_B6EC64
	dw DATA_B6EC78
	dw DATA_B6EC8C
	dw DATA_B6ECA0

;defeated
DATA_B6EC28:
	dw $0000				;fireball speed
	dw $0096				;stun timer
	dw $0000				;charged melee attack delay
	dw $0000				;flying chase speed
	dw $0000				;delay before next fireball sequence
	dw $0000				;delay between each fireball shot
	dw DATA_B6E3DA, DATA_B6E3EA		;stun shake offset sequence to use (start/end)
	dw $0000
	dw $0000

;phase 6
DATA_B6EC3C:
	dw $0000				;fireball speed
	dw $005A				;stun timer
	dw $0028				;charged melee attack delay
	dw $0160				;flying chase speed
	dw $0000				;delay before next fireball sequence
	dw $0000				;delay between each fireball shot
	dw DATA_B6E3C2, DATA_B6E3DA		;stun shake offset sequence to use (start/end)
	dw $0000
	dw $0000

;phase 5
DATA_B6EC50:
	dw $0000				;fireball speed
	dw $0064				;stun timer
	dw $003A				;charged melee attack delay
	dw $0148				;flying chase speed
	dw $0000				;delay before next fireball sequence
	dw $0000				;delay between each fireball shot
	dw DATA_B6E3C2, DATA_B6E3DA		;stun shake offset sequence to use (start/end)
	dw $0000
	dw $0000

;phase 4
DATA_B6EC64:
	dw $0000				;fireball speed
	dw $006E				;stun timer
	dw $0046				;charged melee attack delay
	dw $0130				;flying chase speed
	dw $0000				;delay before next fireball sequence
	dw $0000				;delay between each fireball shot
	dw DATA_B6E3AA, DATA_B6E3C2		;stun shake offset sequence to use (start/end)
	dw $0000
	dw $0000

;phase 3
DATA_B6EC78:
	dw $0002				;fireball speed
	dw $00C8				;stun timer
	dw $0000				;charged melee attack delay
	dw $01A0				;flying chase speed
	dw $00B4				;delay before next fireball sequence
	dw $0041				;delay between each fireball shot
	dw DATA_B6E3AA, DATA_B6E3C2		;stun shake offset sequence to use (start/end)
	dw $0003
	dw $0005

;phase 2
DATA_B6EC8C:
	dw $0002				;fireball speed
	dw $00C8				;stun timer
	dw $0000				;charged melee attack delay
	dw $01A0				;flying chase speed
	dw $00C8				;delay before next fireball sequence
	dw $0055				;delay between each fireball shot
	dw DATA_B6E3AA, DATA_B6E3C2		;stun shake offset sequence to use (start/end)
	dw $0003
	dw $0006

;phase 1
DATA_B6ECA0:
	dw $0002				;fireball speed
	dw $00C8				;stun timer
	dw $0000				;charged melee attack delay
	dw $01A0				;flying chase speed
	dw $012C				;delay before next fireball sequence
	dw $0069				;delay between each fireball shot
	dw !null_pointer, !null_pointer		;stun shake offset sequence to use (start/end)
	dw $0004
	dw $0008


CODE_B6ECB4:
	JSL CODE_BB82B8				;$B6ECB4  \
	LDX current_sprite			;$B6ECB8   |
	LDA $22,x				;$B6ECBA   |
	BPL CODE_B6ECCD				;$B6ECBC   |
	CMP #$FFFF				;$B6ECBE   |
	BCS CODE_B6ECC8				;$B6ECC1   |
	LDA #$010A				;$B6ECC3   |
	BRA CODE_B6ECD7				;$B6ECC6  /

CODE_B6ECC8:
	LDA #$0008				;$B6ECC8  \
	BRA CODE_B6ECD7				;$B6ECCB  /

CODE_B6ECCD:
	CMP #$0001				;$B6ECCD  \
	BCS CODE_B6ECD4				;$B6ECD0   |
	BRA CODE_B6ECC8				;$B6ECD2  /

CODE_B6ECD4:
	LDA #$000A				;$B6ECD4  \
CODE_B6ECD7:					;	   |
	JSR CODE_B6F266				;$B6ECD7   |
	LDA $2E,x				;$B6ECDA   |
	BIT #$0080				;$B6ECDC   |
	BEQ CODE_B6ECE4				;$B6ECDF   |
	BRL CODE_B6F055				;$B6ECE1  /

CODE_B6ECE4:
	LDY $0654				;$B6ECE4  \
	LDA $002E,y				;$B6ECE7   |
	AND #$FFFB				;$B6ECEA   |
	STA $002E,y				;$B6ECED   |
	BRL CODE_B6F055				;$B6ECF0  /

CODE_B6ECF3:
	PHB					;$B6ECF3  \
	PHK					;$B6ECF4   |
	PLB					;$B6ECF5   |
	LDX current_sprite			;$B6ECF6   |
	LDA.l $0006A1				;$B6ECF8   |
	BIT #$8000				;$B6ECFC   |
	BNE CODE_B6ECB4				;$B6ECFF   |
	LDA $2E,x				;$B6ED01   |
	BIT #$0001				;$B6ED03   |
	BNE CODE_B6ED0B				;$B6ED06   |
	BRL CODE_B6F031				;$B6ED08  /

CODE_B6ED0B:
	BIT #$0020				;$B6ED0B  \
	BNE CODE_B6ED54				;$B6ED0E   |
	LDA $2E,x				;$B6ED10   |
	BIT #$0200				;$B6ED12   |
	BEQ CODE_B6ED21				;$B6ED15   |
	LDA $30,x				;$B6ED17   |
	AND #$FFFE				;$B6ED19   |
	STA $30,x				;$B6ED1C   |
	BRL CODE_B6F031				;$B6ED1E  /

CODE_B6ED21:
	LDA $2E,x				;$B6ED21  \
	BIT #$0400				;$B6ED23   |
	BEQ CODE_B6ED51				;$B6ED26   |
	PHX					;$B6ED28   |
	JSR CODE_B6F063				;$B6ED29   |
	LDA #$0000				;$B6ED2C   |
	JSR CODE_B6F266				;$B6ED2F   |
	LDY.w #DATA_FF103A			;$B6ED32   |
	JSL CODE_BB8432				;$B6ED35   |
	LDY alternate_sprite			;$B6ED39   |
	PLX					;$B6ED3B   |
	LDA $06,x				;$B6ED3C   |
	SEC					;$B6ED3E   |
	SBC #$0002				;$B6ED3F   |
	STA $0006,y				;$B6ED42   |
	LDA $0A,x				;$B6ED45   |
	SEC					;$B6ED47   |
	SBC #$000F				;$B6ED48   |
	STA $000A,y				;$B6ED4B   |
	BRL CODE_B6F038				;$B6ED4E  /

CODE_B6ED51:
	BRL CODE_B6EDCC				;$B6ED51  /

CODE_B6ED54:
	JSL CODE_BCFB58				;$B6ED54  \
	LDA #$0020				;$B6ED58   |
	JSL CODE_BCFE0A				;$B6ED5B   |
	BCC CODE_B6EDAD				;$B6ED5F   |
	LDY $6A					;$B6ED61   |
	LDA $0000,y				;$B6ED63   |
	CMP #$0224				;$B6ED66   |
	BEQ CODE_B6EDB0				;$B6ED69   |
	CMP #$0228				;$B6ED6B   |
	BEQ CODE_B6EDB0				;$B6ED6E   |
	LDA current_sprite			;$B6ED70   |
	PHA					;$B6ED72   |
	LDA $6A					;$B6ED73   |
	STA current_sprite			;$B6ED75   |
	JSL CODE_BB82B8				;$B6ED77   |
	PLX					;$B6ED7B   |
	STX current_sprite			;$B6ED7C   |
	LDA #$0006				;$B6ED7E   |
	JSR CODE_B6F266				;$B6ED81   |
	LDA #$041A				;$B6ED84   |
	JSL queue_sound_effect			;$B6ED87   |
CODE_B6ED8B:					;	   |
	JSL CODE_BB82B8				;$B6ED8B   |
	JSR CODE_B6FEA2				;$B6ED8F   |
	LDX current_sprite			;$B6ED92   |
	LDA $2E,x				;$B6ED94   |
	BIT #$0080				;$B6ED96   |
	BEQ CODE_B6ED9E				;$B6ED99   |
	BRL CODE_B6F055				;$B6ED9B  /

CODE_B6ED9E:
	LDY $0654				;$B6ED9E  \
	LDA $002E,y				;$B6EDA1   |
	AND #$FFFB				;$B6EDA4   |
	STA $002E,y				;$B6EDA7   |
	BRL CODE_B6F055				;$B6EDAA  /

CODE_B6EDAD:
	BRL CODE_B6F07C				;$B6EDAD  /

CODE_B6EDB0:
	LDX current_sprite			;$B6EDB0  \
	LDA $22,x				;$B6EDB2   |
	BPL CODE_B6EDBB				;$B6EDB4   |
	LDA #$0004				;$B6EDB6   |
	BRA CODE_B6EDBE				;$B6EDB9  /

CODE_B6EDBB:
	LDA #$0104				;$B6EDBB  \
CODE_B6EDBE:					;	   |
	JSR CODE_B6F266				;$B6EDBE   |
	PHX					;$B6EDC1   |
	TXY					;$B6EDC2   |
	JSR CODE_B6F82D				;$B6EDC3   |
	PLX					;$B6EDC6   |
	STX current_sprite			;$B6EDC7   |
	BRL CODE_B6ED8B				;$B6EDC9  /

CODE_B6EDCC:
	BIT #$000A				;$B6EDCC  \
	BNE CODE_B6EE06				;$B6EDCF   |
	LDA.l $0006A1				;$B6EDD1   |
	BIT #$4000				;$B6EDD5   |
	BEQ CODE_B6EDEC				;$B6EDD8   |
	AND #$BFFF				;$B6EDDA   |
	STA $0006A1				;$B6EDDD   |
	JSL CODE_B8D1F0				;$B6EDE1   |
	LDA $2E,x				;$B6EDE5   |
	AND #$F7FF				;$B6EDE7   |
	STA $2E,x				;$B6EDEA   |
CODE_B6EDEC:					;	   |
	LDA $2E,x				;$B6EDEC   |
	BIT #$0040				;$B6EDEE   |
	BNE CODE_B6EE03				;$B6EDF1   |
	LDA $20,x				;$B6EDF3   |
	BPL CODE_B6EDFE				;$B6EDF5   |
	LDA #$02E8				;$B6EDF7   |
	STA $0C,x				;$B6EDFA   |
	BRA CODE_B6EE03				;$B6EDFC  /

CODE_B6EDFE:
	LDA #$02E9				;$B6EDFE  \
	STA $0C,x				;$B6EE01   |
CODE_B6EE03:					;	   |
	BRL CODE_B6F015				;$B6EE03  /

CODE_B6EE06:
	LDA $2E,x				;$B6EE06  \
	BIT #$0800				;$B6EE08   |
	BNE CODE_B6EE63				;$B6EE0B   |
	JSL CODE_BCFB58				;$B6EE0D   |
	LDA #$0018				;$B6EE11   |
	PHX					;$B6EE14   |
	PHY					;$B6EE15   |
	LDY current_sprite			;$B6EE16   |
	LDX $12,y				;$B6EE18   |
	PHX					;$B6EE1A   |
	LDY #$0020				;$B6EE1B   |
	JSL CODE_BEBE8E				;$B6EE1E   |
	LDY current_sprite			;$B6EE22   |
	PLX					;$B6EE24   |
	STX $12,y				;$B6EE25   |
	PLY					;$B6EE27   |
	PLX					;$B6EE28   |
	BCC CODE_B6EE63				;$B6EE29   |
	BEQ CODE_B6EE32				;$B6EE2B   |
	CMP #$0002				;$B6EE2D   |
	BNE CODE_B6EE63				;$B6EE30   |
CODE_B6EE32:					;	   |
	LDA #$001E				;$B6EE32   |
	LDY #$FF00				;$B6EE35   |
	JSL CODE_B3A600				;$B6EE38   |
	LDY $0654				;$B6EE3C   |
	LDA $002E,y				;$B6EE3F   |
	BIT #$0100				;$B6EE42   |
	BEQ CODE_B6EE4D				;$B6EE45   |
	LDA #$0001				;$B6EE47   |
	STA $000C,y				;$B6EE4A   |
CODE_B6EE4D:					;	   |
	LDA #$0004				;$B6EE4D   |
	STA $52,x				;$B6EE50   |
	STZ $22,x				;$B6EE52   |
	LDA $2E,x				;$B6EE54   |
	AND #$FFFD				;$B6EE56   |
	ORA #$0800				;$B6EE59   |
	STA $2E,x				;$B6EE5C   |
	LDA #$0064				;$B6EE5E   |
	STA $0E,x				;$B6EE61   |
CODE_B6EE63:					;	   |
	LDX current_sprite			;$B6EE63   |
	LDA $2E,x				;$B6EE65   |
	BIT #$0002				;$B6EE67   |
	BNE CODE_B6EE6F				;$B6EE6A   |
	BRL CODE_B6EF23				;$B6EE6C  /

CODE_B6EE6F:
	LDX current_sprite			;$B6EE6F  \
	LDA $2E,x				;$B6EE71   |
	BIT #$0100				;$B6EE73   |
	BNE CODE_B6EE7B				;$B6EE76   |
	BRL CODE_B6EF23				;$B6EE78  /

CODE_B6EE7B:
	LDA $22,x				;$B6EE7B  \
	LDA $06,x				;$B6EE7D   |
	CLC					;$B6EE7F   |
	ADC $22,x				;$B6EE80   |
	STA $06,x				;$B6EE82   |
	LDA $22,x				;$B6EE84   |
	BPL CODE_B6EE8F				;$B6EE86   |
	LDA $10,x				;$B6EE88   |
	CLC					;$B6EE8A   |
	ADC $22,x				;$B6EE8B   |
	BRA CODE_B6EE94				;$B6EE8D  /

CODE_B6EE8F:
	LDA $10,x				;$B6EE8F  \
	SEC					;$B6EE91   |
	SBC $22,x				;$B6EE92   |
CODE_B6EE94:					;	   |
	STA $10,x				;$B6EE94   |
	LDA $2A,x				;$B6EE96   |
	AND #$00FF				;$B6EE98   |
	STA $000650				;$B6EE9B   |
	LDA $28,x				;$B6EE9F   |
	SEC					;$B6EEA1   |
	SBC $000650				;$B6EEA2   |
	STA $28,x				;$B6EEA6   |
	BPL CODE_B6EEB9				;$B6EEA8   |
	CLC					;$B6EEAA   |
	ADC #$0010				;$B6EEAB   |
	STA $28,x				;$B6EEAE   |
	LDA $06,x				;$B6EEB0   |
	CLC					;$B6EEB2   |
	ADC $20,x				;$B6EEB3   |
	STA $06,x				;$B6EEB5   |
	DEC $10,x				;$B6EEB7   |
CODE_B6EEB9:					;	   |
	LDA $2E,x				;$B6EEB9   |
	BIT #$0004				;$B6EEBB   |
	BEQ CODE_B6EED7				;$B6EEBE   |
	SEP #$20				;$B6EEC0   |
	DEC $24,x				;$B6EEC2   |
	REP #$20				;$B6EEC4   |
	BNE CODE_B6EF23				;$B6EEC6   |
	LDA $26,x				;$B6EEC8   |
	SEP #$20				;$B6EECA   |
	STA $24,x				;$B6EECC   |
	LDA $2A,x				;$B6EECE   |
	DEC A					;$B6EED0   |
	REP #$20				;$B6EED1   |
	BNE CODE_B6EF1D				;$B6EED3   |
	BRA CODE_B6EF09				;$B6EED5  /

CODE_B6EED7:
	LDA $10,x				;$B6EED7  \
	BPL CODE_B6EF23				;$B6EED9   |
	LDA $2E,x				;$B6EEDB   |
	ORA #$0004				;$B6EEDD   |
	STA $2E,x				;$B6EEE0   |
	LDA #$FF80				;$B6EEE2   |
	STA $2C,x				;$B6EEE5   |
	LDA.l $000652				;$B6EEE7   |
	ASL A					;$B6EEEB   |
	TAY					;$B6EEEC   |
	LDA DATA_B6FE24,y			;$B6EEED   |
	TAY					;$B6EEF0   |
	LDA $001A,y				;$B6EEF1   |
	SEP #$20				;$B6EEF4   |
	ADC $0E,x				;$B6EEF6   |
	STA $0E,x				;$B6EEF8   |
	REP #$20				;$B6EEFA   |
	LDA #$000A				;$B6EEFC   |
	STA $26,x				;$B6EEFF   |
	SEP #$20				;$B6EF01   |
	STA $24,x				;$B6EF03   |
	REP #$20				;$B6EF05   |
	BRA CODE_B6EF23				;$B6EF07  /

CODE_B6EF09:
	LDA $22,x				;$B6EF09  \
	BNE CODE_B6EF10				;$B6EF0B   |
	BRL CODE_B6F059				;$B6EF0D  /

CODE_B6EF10:
	SEC					;$B6EF10  \
	SBC $20,x				;$B6EF11   |
	STA $22,x				;$B6EF13   |
	BNE CODE_B6EF1A				;$B6EF15   |
	BRL CODE_B6F059				;$B6EF17  /

CODE_B6EF1A:
	LDA #$0010				;$B6EF1A  \
CODE_B6EF1D:					;	   |
	SEP #$20				;$B6EF1D   |
	STA $2A,x				;$B6EF1F   |
	REP #$20				;$B6EF21   |
CODE_B6EF23:					;	   |
	LDA $2E,x				;$B6EF23   |
	BIT #$0008				;$B6EF25   |
	BNE CODE_B6EF2D				;$B6EF28   |
	BRL CODE_B6F031				;$B6EF2A  /

CODE_B6EF2D:
	LDA $0A,x				;$B6EF2D  \
	CLC					;$B6EF2F   |
	ADC $52,x				;$B6EF30   |
	STA $0A,x				;$B6EF32   |
	LDA $2E,x				;$B6EF34   |
	BIT #$0080				;$B6EF36   |
	BEQ CODE_B6EF3E				;$B6EF39   |
	BRL CODE_B6EFCB				;$B6EF3B  /

CODE_B6EF3E:
	LDA $0A,x				;$B6EF3E  \
	CMP #$01EB				;$B6EF40   |
	BCS CODE_B6EF48				;$B6EF43   |
	BRL CODE_B6EFCB				;$B6EF45  /

CODE_B6EF48:
	PHX					;$B6EF48  \
	PHY					;$B6EF49   |
	LDA #$0502				;$B6EF4A   |
	JSL queue_sound_effect			;$B6EF4D   |
	PLY					;$B6EF51   |
	PLX					;$B6EF52   |
	LDA $2E,x				;$B6EF53   |
	ORA #$0100				;$B6EF55   |
	STA $2E,x				;$B6EF58   |
	LDA #$01EB				;$B6EF5A   |
	STA $0A,x				;$B6EF5D   |
	LDA $54,x				;$B6EF5F   |
	DEC A					;$B6EF61   |
	DEC A					;$B6EF62   |
	SEP #$20				;$B6EF63   |
	STA $2B,x				;$B6EF65   |
	REP #$20				;$B6EF67   |
	DEC A					;$B6EF69   |
	STA $000767				;$B6EF6A   |
	LDA $52,x				;$B6EF6E   |
	EOR #$FFFF				;$B6EF70   |
	PHA					;$B6EF73   |
	LDA $0E,x				;$B6EF74   |
	AND #$00FF				;$B6EF76   |
	STA $000650				;$B6EF79   |
	PLA					;$B6EF7D   |
	CLC					;$B6EF7E   |
	ADC $000650				;$B6EF7F   |
	PHA					;$B6EF83   |
	LDA $0F,x				;$B6EF84   |
	AND #$00FF				;$B6EF86   |
	STA $000650				;$B6EF89   |
	PLA					;$B6EF8D   |
	CLC					;$B6EF8E   |
	ADC $000650				;$B6EF8F   |
	SEP #$20				;$B6EF93   |
	STZ $0F,x				;$B6EF95   |
	REP #$20				;$B6EF97   |
	STA $52,x				;$B6EF99   |
	BPL CODE_B6EFA4				;$B6EF9B   |
	CMP #$FFFD				;$B6EF9D   |
	BCS CODE_B6EFA9				;$B6EFA0   |
	BRA CODE_B6EFCB				;$B6EFA2  /

CODE_B6EFA4:
	CMP #$0001				;$B6EFA4  \
	BMI CODE_B6EFCB				;$B6EFA7   |
CODE_B6EFA9:					;	   |
	SEP #$20				;$B6EFA9   |
	STZ $2B,x				;$B6EFAB   |
	REP #$20				;$B6EFAD   |
	STZ $52,x				;$B6EFAF   |
	LDA #$FFFF				;$B6EFB1   |
	STA $000767				;$B6EFB4   |
	LDA $2E,x				;$B6EFB8   |
	AND #$FFF7				;$B6EFBA   |
	STA $2E,x				;$B6EFBD   |
	STZ $22,x				;$B6EFBF   |
	LDA $2E,x				;$B6EFC1   |
	AND #$FFFD				;$B6EFC3   |
	STA $2E,x				;$B6EFC6   |
	BRL CODE_B6F031				;$B6EFC8  /

CODE_B6EFCB:
	SEP #$20				;$B6EFCB  \
	INC $2B,x				;$B6EFCD   |
	REP #$20				;$B6EFCF   |
	LDA $2B,x				;$B6EFD1   |
	AND #$00FF				;$B6EFD3   |
	CMP $54,x				;$B6EFD6   |
	BNE CODE_B6EFEE				;$B6EFD8   |
	SEP #$20				;$B6EFDA   |
	STZ $2B,x				;$B6EFDC   |
	REP #$20				;$B6EFDE   |
	INC $52,x				;$B6EFE0   |
	BNE CODE_B6EFEE				;$B6EFE2   |
	LDA $12,x				;$B6EFE4   |
	AND #$CFFF				;$B6EFE6   |
	ORA #$3000				;$B6EFE9   |
	STA $12,x				;$B6EFEC   |
CODE_B6EFEE:					;	   |
	LDA $2B,x				;$B6EFEE   |
	AND #$00FF				;$B6EFF0   |
	STA $000650				;$B6EFF3   |
	LDA.l $000767				;$B6EFF7   |
	SEC					;$B6EFFB   |
	SBC $000650				;$B6EFFC   |
	BPL CODE_B6F00E				;$B6F000   |
	CLC					;$B6F002   |
	ADC $54,x				;$B6F003   |
	STA $000767				;$B6F005   |
	INC $0A,x				;$B6F009   |
	BRL CODE_B6F031				;$B6F00B  /

CODE_B6F00E:
	STA $000767				;$B6F00E  \
	BRL CODE_B6F031				;$B6F012  /

CODE_B6F015:
	JSR CODE_B6F102				;$B6F015  \
	LDA $2E,x				;$B6F018   |
	BIT #$0010				;$B6F01A   |
	BNE CODE_B6F031				;$B6F01D   |
	DEC $4E,x				;$B6F01F   |
	BNE CODE_B6F031				;$B6F021   |
	LDA #$02A3				;$B6F023   |
	JSL set_sprite_animation		;$B6F026   |
	LDA $2E,x				;$B6F02A   |
	ORA #$0200				;$B6F02C   |
	STA $2E,x				;$B6F02F   |
CODE_B6F031:					;	   |
	LDA $0A,x				;$B6F031   |
	CMP #$023A				;$B6F033   |
	BCC CODE_B6F051				;$B6F036   |
CODE_B6F038:					;	   |
	JSL CODE_BB82B8				;$B6F038   |
	LDA $2E,x				;$B6F03C   |
	BIT #$0080				;$B6F03E   |
	BNE CODE_B6F055				;$B6F041   |
	LDY $0654				;$B6F043   |
	LDA $002E,y				;$B6F046   |
	AND #$FFFB				;$B6F049   |
	STA $002E,y				;$B6F04C   |
	BRA CODE_B6F055				;$B6F04F  /

CODE_B6F051:
	JSL CODE_B9D100				;$B6F051  \
CODE_B6F055:					;	   |
	PLB					;$B6F055   |
	JML [$05A9]				;$B6F056  /

CODE_B6F059:
	LDA $2E,x				;$B6F059  \
	AND #$FFFD				;$B6F05B   |
	STA $2E,x				;$B6F05E   |
	BRL CODE_B6EF23				;$B6F060  /

CODE_B6F063:
	LDA.l $000652				;$B6F063  \
	CMP #$0003				;$B6F067   |
	BCS CODE_B6F07B				;$B6F06A   |
	INC $06D3				;$B6F06C   |
	LDA.l $0006D3				;$B6F06F   |
	CMP #$0002				;$B6F073   |
	BCC CODE_B6F07B				;$B6F076   |
	JSR CODE_B6F2CE				;$B6F078   |
CODE_B6F07B:					;	   |
	RTS					;$B6F07B  /

CODE_B6F07C:
	LDX current_sprite			;$B6F07C  \
	LDA $06,x				;$B6F07E   |
	CLC					;$B6F080   |
	ADC $22,x				;$B6F081   |
	STA $06,x				;$B6F083   |
	LDA $0A,x				;$B6F085   |
	CLC					;$B6F087   |
	ADC $52,x				;$B6F088   |
	STA $0A,x				;$B6F08A   |
	CMP #$01EB				;$B6F08C   |
	BCC CODE_B6F0C4				;$B6F08F   |
	LDA $22,x				;$B6F091   |
	BPL CODE_B6F09A				;$B6F093   |
	LDA #$0102				;$B6F095   |
	BRA CODE_B6F09D				;$B6F098  /

CODE_B6F09A:
	LDA #$0002				;$B6F09A  \
CODE_B6F09D:					;	   |
	JSR CODE_B6F266				;$B6F09D   |
	LDA #$041A				;$B6F0A0   |
	JSL queue_sound_effect			;$B6F0A3   |
	JSL CODE_BB82B8				;$B6F0A7   |
	LDA $2E,x				;$B6F0AB   |
	BIT #$0080				;$B6F0AD   |
	BNE CODE_B6F055				;$B6F0B0   |
	LDY $0654				;$B6F0B2   |
	LDA $002E,y				;$B6F0B5   |
	AND #$FFFB				;$B6F0B8   |
	STA $002E,y				;$B6F0BB   |
	JSR CODE_B6F063				;$B6F0BE   |
	BRL CODE_B6F055				;$B6F0C1  /

CODE_B6F0C4:
	SEP #$20				;$B6F0C4  \
	INC $2B,x				;$B6F0C6   |
	REP #$20				;$B6F0C8   |
	LDA $2B,x				;$B6F0CA   |
	AND #$00FF				;$B6F0CC   |
	CMP $54,x				;$B6F0CF   |
	BNE CODE_B6F0DB				;$B6F0D1   |
	SEP #$20				;$B6F0D3   |
	STZ $2B,x				;$B6F0D5   |
	REP #$20				;$B6F0D7   |
	INC $52,x				;$B6F0D9   |
CODE_B6F0DB:					;	   |
	LDA $2B,x				;$B6F0DB   |
	AND #$00FF				;$B6F0DD   |
	STA $000650				;$B6F0E0   |
	LDA.l $000767				;$B6F0E4   |
	SEC					;$B6F0E8   |
	SBC $000650				;$B6F0E9   |
	BPL CODE_B6F0FB				;$B6F0ED   |
	CLC					;$B6F0EF   |
	ADC $54,x				;$B6F0F0   |
	STA $000767				;$B6F0F2   |
	INC $0A,x				;$B6F0F6   |
	BRL CODE_B6F031				;$B6F0F8  /

CODE_B6F0FB:
	STA $000767				;$B6F0FB  \
	BRL CODE_B6F031				;$B6F0FF  /

CODE_B6F102:
	LDX current_sprite			;$B6F102  \
	LDA $2E,x				;$B6F104   |
	BIT #$0010				;$B6F106   |
	BNE CODE_B6F11B				;$B6F109   |
	LDA $30,x				;$B6F10B   |
	ORA #$0001				;$B6F10D   |
	STA $30,x				;$B6F110   |
	LDA $32,x				;$B6F112   |
	BEQ CODE_B6F119				;$B6F114   |
	BRL CODE_B6F1FB				;$B6F116  /

CODE_B6F119:
	CLC					;$B6F119  \
	RTS					;$B6F11A  /

CODE_B6F11B:
	LDY $0654				;$B6F11B  \
	LDA $002E,y				;$B6F11E   |
	BIT #$0100				;$B6F121   |
	BEQ CODE_B6F12C				;$B6F124   |
	LDA #$0001				;$B6F126   |
	STA $000C,y				;$B6F129   |
CODE_B6F12C:					;	   |
	JSL CODE_BCFB58				;$B6F12C   |
	LDA #$0020				;$B6F130   |
	JSL CODE_BCFE0A				;$B6F133   |
	LDX current_sprite			;$B6F137   |
	BCC CODE_B6F19C				;$B6F139   |
	LDY $6A					;$B6F13B   |
	LDA $0000,y				;$B6F13D   |
	CMP #$0224				;$B6F140   |
	BEQ CODE_B6F1C2				;$B6F143   |
	CMP #$0228				;$B6F145   |
	BEQ CODE_B6F1C2				;$B6F148   |
	JSR CODE_B6F063				;$B6F14A   |
	LDA $002E,y				;$B6F14D   |
	BIT #$000A				;$B6F150   |
	BEQ CODE_B6F19C				;$B6F153   |
	STZ $0D7A				;$B6F155   |
	LDA #$FFEF				;$B6F158   |
	AND $2E,x				;$B6F15B   |
	STA $2E,x				;$B6F15D   |
	LDA current_sprite			;$B6F15F   |
	PHA					;$B6F161   |
	LDA $6A					;$B6F162   |
	STA current_sprite			;$B6F164   |
	JSL CODE_BB82B8				;$B6F166   |
	PLX					;$B6F16A   |
	STX current_sprite			;$B6F16B   |
	LDA #$0006				;$B6F16D   |
	JSR CODE_B6F266				;$B6F170   |
	LDA #$041A				;$B6F173   |
	JSL queue_sound_effect			;$B6F176   |
	JSL CODE_BB82B8				;$B6F17A   |
	JSR CODE_B6FEA2				;$B6F17E   |
	LDX current_sprite			;$B6F181   |
	LDA $2E,x				;$B6F183   |
	BIT #$0080				;$B6F185   |
	BEQ CODE_B6F18D				;$B6F188   |
	BRL CODE_B6F1BF				;$B6F18A  /

CODE_B6F18D:
	LDY $0654				;$B6F18D  \
	LDA $002E,y				;$B6F190   |
	AND #$FFFB				;$B6F193   |
	STA $002E,y				;$B6F196   |
	BRL CODE_B6F1BF				;$B6F199  /

CODE_B6F19C:
	JSL CODE_B3A003				;$B6F19C  \
	LDX current_sprite			;$B6F1A0   |
	LDA $32,x				;$B6F1A2   |
	BNE CODE_B6F1A9				;$B6F1A4   |
	BRL CODE_B6F119				;$B6F1A6  /

CODE_B6F1A9:
	STZ $32,x				;$B6F1A9  \
	CMP #$0001				;$B6F1AB   |
	BEQ CODE_B6F1EE				;$B6F1AE   |
	CMP #$0004				;$B6F1B0   |
	BEQ CODE_B6F205				;$B6F1B3   |
	CMP #$0006				;$B6F1B5   |
	BEQ CODE_B6F205				;$B6F1B8   |
	CMP #$0005				;$B6F1BA   |
	BEQ CODE_B6F205				;$B6F1BD   |
CODE_B6F1BF:					;	   |
	BRL CODE_B6F119				;$B6F1BF  /

CODE_B6F1C2:
	STZ $0D7A				;$B6F1C2  \
	LDA #$FFEF				;$B6F1C5   |
	AND $2E,x				;$B6F1C8   |
	STA $2E,x				;$B6F1CA   |
	LDY $0654				;$B6F1CC   |
	LDA $002E,y				;$B6F1CF   |
	AND #$FFFB				;$B6F1D2   |
	STA $002E,y				;$B6F1D5   |
	LDA #$0000				;$B6F1D8   |
	JSR CODE_B6F266				;$B6F1DB   |
	PHX					;$B6F1DE   |
	TXY					;$B6F1DF   |
	JSR CODE_B6F82D				;$B6F1E0   |
	PLX					;$B6F1E3   |
	STX current_sprite			;$B6F1E4   |
	JSL CODE_BB82B8				;$B6F1E6   |
	JSR CODE_B6FEA2				;$B6F1EA   |
	RTS					;$B6F1ED  /

CODE_B6F1EE:
	LDA #$FFEF				;$B6F1EE  \
	AND $2E,x				;$B6F1F1   |
	STA $2E,x				;$B6F1F3   |
	LDA #$1001				;$B6F1F5   |
	STA $1E,x				;$B6F1F8   |
	RTS					;$B6F1FA  /

CODE_B6F1FB:
	STZ $32,x				;$B6F1FB  \
	CMP #$0001				;$B6F1FD   |
	BEQ CODE_B6F257				;$B6F200   |
	BRL CODE_B6F119				;$B6F202  /

CODE_B6F205:
	LDA #$FFEF				;$B6F205  \
	AND $2E,x				;$B6F208   |
	ORA #$0020				;$B6F20A   |
	STA $2E,x				;$B6F20D   |
	LDY active_kong_sprite			;$B6F20F   |
	LDA $0012,y				;$B6F212   |
	BIT #$4000				;$B6F215   |
	BEQ CODE_B6F229				;$B6F218   |
	LDA #$FFFF				;$B6F21A   |
	STA $20,x				;$B6F21D   |
	LDA #$FFF9				;$B6F21F   |
	STA $22,x				;$B6F222   |
	LDA #$0304				;$B6F224   |
	BRA CODE_B6F236				;$B6F227  /

CODE_B6F229:
	LDA #$0001				;$B6F229  \
	STA $20,x				;$B6F22C   |
	LDA #$0007				;$B6F22E   |
	STA $22,x				;$B6F231   |
	LDA #$0303				;$B6F233   |
CODE_B6F236:					;	   |
	JSL set_sprite_animation		;$B6F236   |
	LDA #$0001				;$B6F23A   |
	SEP #$20				;$B6F23D   |
	STA $2B,x				;$B6F23F   |
	REP #$20				;$B6F241   |
	LDA #$000A				;$B6F243   |
	STA $54,x				;$B6F246   |
	LSR A					;$B6F248   |
	STA $000767				;$B6F249   |
	STZ $52,x				;$B6F24D   |
	LDA $06,x				;$B6F24F   |
	CLC					;$B6F251   |
	ADC $22,x				;$B6F252   |
	STA $06,x				;$B6F254   |
	RTS					;$B6F256  /

CODE_B6F257:
	LDA #$0010				;$B6F257  \
	ORA $2E,x				;$B6F25A   |
	STA $2E,x				;$B6F25C   |
	LDA #$FFFC				;$B6F25E   |
	AND $30,x				;$B6F261   |
	STA $30,x				;$B6F263   |
	RTS					;$B6F265  /

CODE_B6F266:
	PHX					;$B6F266  \
	PHA					;$B6F267   |
	PHB					;$B6F268   |
	AND #$00FF				;$B6F269   |
	TAY					;$B6F26C   |
	JSR CODE_B6D923				;$B6F26D   |
	LDX.w DATA_BAAF10,y			;$B6F270   |
	LDA $0000,x				;$B6F273   |
	STA $000650				;$B6F276   |
CODE_B6F27A:					;	   |
	LDY $0002,x				;$B6F27A   |
	PHX					;$B6F27D   |
	JSL CODE_BB8418				;$B6F27E   |
	PLY					;$B6F282   |
	LDX alternate_sprite			;$B6F283   |
if !version == 0				;	   |
	LDA $01,s				;$B6F285   |
	AND #$0100				;$B6F287   |
else						;	   |
	LDA $02,s				;$B6F285   |
	BIT #$0100				;$B6F287   |
endif						;	   |
	BNE CODE_B6F298				;$B6F28A   |
	LDA $0008,y				;$B6F28C   |
	STA $26,x				;$B6F28F   |
	LDA $000A,y				;$B6F291   |
	STA $20,x				;$B6F294   |
	BRA CODE_B6F2AA				;$B6F296  /

CODE_B6F298:
	LDA #$0000				;$B6F298  \
	CLC					;$B6F29B   |
	SBC $0008,y				;$B6F29C   |
	STA $26,x				;$B6F29F   |
	LDA #$0000				;$B6F2A1   |
	CLC					;$B6F2A4   |
	SBC $000A,y				;$B6F2A5   |
	STA $20,x				;$B6F2A8   |
CODE_B6F2AA:					;	   |
	LDA $000C,y				;$B6F2AA   |
	STA $24,x				;$B6F2AD   |
	LDA $0004,y				;$B6F2AF   |
	CLC					;$B6F2B2   |
	ADC $06,x				;$B6F2B3   |
	STA $06,x				;$B6F2B5   |
	LDA $0006,y				;$B6F2B7   |
	CLC					;$B6F2BA   |
	ADC $0A,x				;$B6F2BB   |
	STA $0A,x				;$B6F2BD   |
	TYA					;$B6F2BF   |
	CLC					;$B6F2C0   |
	ADC #$000C				;$B6F2C1   |
	TAX					;$B6F2C4   |
	DEC $0650				;$B6F2C5   |
	BNE CODE_B6F27A				;$B6F2C8   |
	PLB					;$B6F2CA   |
	PLA					;$B6F2CB   |
	PLX					;$B6F2CC   |
	RTS					;$B6F2CD  /

CODE_B6F2CE:
	PHX					;$B6F2CE  \
	PHY					;$B6F2CF   |
	STZ $06D3				;$B6F2D0   |
	LDX $0654				;$B6F2D3   |
	STX current_sprite			;$B6F2D6   |
	JSR CODE_B6F8F3				;$B6F2D8   |
	LDA #$0205				;$B6F2DB   |
	STA $00065E				;$B6F2DE   |
	LDA $2E,x				;$B6F2E2   |
	BIT #$0020				;$B6F2E4   |
	BEQ CODE_B6F2F5				;$B6F2E7   |
	LDA.l $000660				;$B6F2E9   |
	STA $06,x				;$B6F2ED   |
	LDA.l $000662				;$B6F2EF   |
	STA $0A,x				;$B6F2F3   |
CODE_B6F2F5:					;	   |
	LDA $2E,x				;$B6F2F5   |
	AND #$FFDA				;$B6F2F7   |
	STA $2E,x				;$B6F2FA   |
	LDA #DATA_B6FDDE			;$B6F2FC   |
	STA $46,x				;$B6F2FF   |
	LDA $2E,x				;$B6F301   |
	AND #$FFFD				;$B6F303   |
	STA $2E,x				;$B6F306   |
	STZ $1E,x				;$B6F308   |
	LDA #$0200				;$B6F30A   |
	JSL set_sprite_animation		;$B6F30D   |
	LDX $0656				;$B6F311   |
	STX current_sprite			;$B6F314   |
	STZ $1E,x				;$B6F316   |
	LDA #$0204				;$B6F318   |
	JSL set_sprite_animation		;$B6F31B   |
	PLY					;$B6F31F   |
	PLX					;$B6F320   |
	STX current_sprite			;$B6F321   |
	STZ $44,x				;$B6F323   |
	RTS					;$B6F325  /

CODE_B6F326:
	LDA $0AF6				;$B6F326  \
	CMP #$0100				;$B6F329   |
	BCS CODE_B6F335				;$B6F32C   |
	LDA #$0200				;$B6F32E   |
	JSL CODE_B5F0CD				;$B6F331   |
CODE_B6F335:					;	   |
	LDA $0AF8				;$B6F335   |
	CMP #$0100				;$B6F338   |
	BCS CODE_B6F344				;$B6F33B   |
	LDA #$0200				;$B6F33D   |
	JSL CODE_B5F0ED				;$B6F340   |
CODE_B6F344:					;	   |
	DEC $0658				;$B6F344   |
	BEQ CODE_B6F34A				;$B6F347   |
	RTS					;$B6F349  /

CODE_B6F34A:
	PHX					;$B6F34A  \
	LDA.l $000652				;$B6F34B   |
	ASL A					;$B6F34F   |
	TAX					;$B6F350   |
	LDY DATA_B6FE24,x			;$B6F351   |
	LDA $0016,y				;$B6F354   |
	STA $000658				;$B6F357   |
	LDA #$8000				;$B6F35B   |
	TRB $06A1				;$B6F35E   |
	LDY #$00A2				;$B6F361   |
	JSL CODE_BB842C				;$B6F364   |
	LDA #$0565				;$B6F368   |
	JSL queue_sound_effect			;$B6F36B   |
	JSL CODE_B4C175				;$B6F36F   |
	STA $000650				;$B6F373   |
	STA CPU.dividen				;$B6F377   |
	LDA.l DATA_BAAD2E			;$B6F37A   |
	CMP $000650				;$B6F37E   |
	BCS CODE_B6F396				;$B6F382   |
	SEP #$20				;$B6F384   |
	STA CPU.divisor				;$B6F386   |
	REP #$20				;$B6F389   |
	LDA #$0008				;$B6F38B   |
CODE_B6F38E:					;	   |
	DEC A					;$B6F38E   |
	BNE CODE_B6F38E				;$B6F38F   |
	LDA CPU.multiply_result			;$B6F391   |
	BRA CODE_B6F39A				;$B6F394  /

CODE_B6F396:
	LDA.l $000650				;$B6F396  \
CODE_B6F39A:					;	   |
	ASL A					;$B6F39A   |
	TAX					;$B6F39B   |
	LDA #$BA00				;$B6F39C   |
	STA $CF					;$B6F39F   |
	LDA.l DATA_BAAD30,x			;$B6F3A1   |
	STA $CE					;$B6F3A5   |
	LDY alternate_sprite			;$B6F3A7   |
	LDA $0030,y				;$B6F3A9   |
	ORA #$0020				;$B6F3AC   |
	STA $0030,y				;$B6F3AF   |
	LDA #$01B0				;$B6F3B2   |
	STA $0006,y				;$B6F3B5   |
	LDA #$0168				;$B6F3B8   |
	STA $000A,y				;$B6F3BB   |
	LDX $0654				;$B6F3BE   |
	LDA $2E,x				;$B6F3C1   |
	BIT #$0004				;$B6F3C3   |
	BNE CODE_B6F3E0				;$B6F3C6   |
	JSL CODE_B4C175				;$B6F3C8   |
	CMP #$8000				;$B6F3CC   |
	BCS CODE_B6F3E0				;$B6F3CF   |
	LDA $2E,x				;$B6F3D1   |
	ORA #$0004				;$B6F3D3   |
	STA $2E,x				;$B6F3D6   |
	LDA $002E,y				;$B6F3D8   |
	ORA #$010B				;$B6F3DB   |
	BRA CODE_B6F3E6				;$B6F3DE  /

CODE_B6F3E0:
	LDA $002E,y				;$B6F3E0  \
	ORA #$018B				;$B6F3E3   |
CODE_B6F3E6:					;	   |
	STA $002E,y				;$B6F3E6   |
	LDA [$CE]				;$B6F3E9   |
	INC $CE					;$B6F3EB   |
	INC $CE					;$B6F3ED   |
	SEC					;$B6F3EF   |
	SBC $0006,y				;$B6F3F0   |
	BPL CODE_B6F40D				;$B6F3F3   |
	EOR #$FFFF				;$B6F3F5   |
	INC A					;$B6F3F8   |
	STA $0010,y				;$B6F3F9   |
	LDA #$FFFF				;$B6F3FC   |
	STA $0020,y				;$B6F3FF   |
	LDA [$CE]				;$B6F402   |
	EOR #$FFFF				;$B6F404   |
	INC A					;$B6F407   |
	STA $0022,y				;$B6F408   |
	BRA CODE_B6F41B				;$B6F40B  /

CODE_B6F40D:
	STA $0010,y				;$B6F40D  \
	LDA #$0001				;$B6F410   |
	STA $0020,y				;$B6F413   |
	LDA [$CE]				;$B6F416   |
	STA $0022,y				;$B6F418   |
CODE_B6F41B:					;	   |
	LDA $0010,y				;$B6F41B   |
	STA CPU.dividen				;$B6F41E   |
	LDA [$CE]				;$B6F421   |
	INC A					;$B6F423   |
	ASL A					;$B6F424   |
	ASL A					;$B6F425   |
	ASL A					;$B6F426   |
	ASL A					;$B6F427   |
	SEP #$20				;$B6F428   |
	STA CPU.divisor				;$B6F42A   |
	REP #$20				;$B6F42D   |
	LDA #$0008				;$B6F42F   |
CODE_B6F432:					;	   |
	DEC A					;$B6F432   |
	BNE CODE_B6F432				;$B6F433   |
	LDA CPU.divide_result			;$B6F435   |
	BNE CODE_B6F43B				;$B6F438   |
	INC A					;$B6F43A   |
CODE_B6F43B:					;	   |
	SEP #$20				;$B6F43B   |
	STA $0024,y				;$B6F43D   |
	STA $0026,y				;$B6F440   |
	REP #$20				;$B6F443   |
	LDA #$0010				;$B6F445   |
	STA $0028,y				;$B6F448   |
	INC $CE					;$B6F44B   |
	INC $CE					;$B6F44D   |
	LDA [$CE]				;$B6F44F   |
	SEP #$20				;$B6F451   |
	STA $002A,y				;$B6F453   |
	REP #$20				;$B6F456   |
	INC $CE					;$B6F458   |
	INC $CE					;$B6F45A   |
	LDA [$CE]				;$B6F45C   |
	SEP #$20				;$B6F45E   |
	STA $000E,y				;$B6F460   |
	REP #$20				;$B6F463   |
	INC $CE					;$B6F465   |
	INC $CE					;$B6F467   |
	LDA [$CE]				;$B6F469   |
	SEP #$20				;$B6F46B   |
	STA $000F,y				;$B6F46D   |
	REP #$20				;$B6F470   |
	INC $CE					;$B6F472   |
	INC $CE					;$B6F474   |
	LDA [$CE]				;$B6F476   |
	STA $004E,y				;$B6F478   |
	INC $CE					;$B6F47B   |
	INC $CE					;$B6F47D   |
	LDA [$CE]				;$B6F47F   |
	STA $0054,y				;$B6F481   |
	LDA $0054,y				;$B6F484   |
	DEC A					;$B6F487   |
	DEC A					;$B6F488   |
	SEP #$20				;$B6F489   |
	STA $002B,y				;$B6F48B   |
	REP #$20				;$B6F48E   |
	DEC A					;$B6F490   |
	STA $000767				;$B6F491   |
	INC $CE					;$B6F495   |
	INC $CE					;$B6F497   |
	LDA [$CE]				;$B6F499   |
	STA $0052,y				;$B6F49B   |
	STY current_sprite			;$B6F49E   |
	LDA $0020,y				;$B6F4A0   |
	BPL CODE_B6F4AA				;$B6F4A3   |
	LDA #$0302				;$B6F4A5   |
	BRA CODE_B6F4AD				;$B6F4A8  /

CODE_B6F4AA:
	LDA #$02FE				;$B6F4AA  \
CODE_B6F4AD:					;	   |
	STA $000C,y				;$B6F4AD   |
	LDA $002E,y				;$B6F4B0   |
	BIT #$0080				;$B6F4B3   |
	BNE CODE_B6F4BB				;$B6F4B6   |
	BRL CODE_B6F56D				;$B6F4B8  /

CODE_B6F4BB:
	LDA #$270F				;$B6F4BB  \
	STA $0010,y				;$B6F4BE   |
	SEP #$20				;$B6F4C1   |
	LDA #$00				;$B6F4C3   |
	STA $0024,y				;$B6F4C5   |
	STA $0026,y				;$B6F4C8   |
	REP #$20				;$B6F4CB   |
	LDX active_kong_sprite			;$B6F4CD   |
	LDA $06,x				;$B6F4D0   |
	CLC					;$B6F4D2   |
	SBC #$01B0				;$B6F4D3   |
	BPL CODE_B6F4DC				;$B6F4D6   |
	EOR #$FFFF				;$B6F4D8   |
	INC A					;$B6F4DB   |
CODE_B6F4DC:					;	   |
	STA CPU.dividen				;$B6F4DC   |
	LDA #$0083				;$B6F4DF   |
	SEP #$20				;$B6F4E2   |
	STA CPU.divisor				;$B6F4E4   |
	REP #$20				;$B6F4E7   |
	LDA #$0008				;$B6F4E9   |
CODE_B6F4EC:					;	   |
	DEC A					;$B6F4EC   |
	BNE CODE_B6F4EC				;$B6F4ED   |
	LDA CPU.divide_result			;$B6F4EF   |
	STA $0022,y				;$B6F4F2   |
	LDA #$0010				;$B6F4F5   |
	STA CPU.dividen				;$B6F4F8   |
	LDA $06,x				;$B6F4FB   |
	CMP #$018B				;$B6F4FD   |
	BCC CODE_B6F50C				;$B6F500   |
	CMP #$01D5				;$B6F502   |
	BCS CODE_B6F50C				;$B6F505   |
	LDA #$0008				;$B6F507   |
	BRA CODE_B6F51C				;$B6F50A  /

CODE_B6F50C:
	SEP #$20				;$B6F50C  \
	STA CPU.divisor				;$B6F50E   |
	REP #$20				;$B6F511   |
	LDA #$0008				;$B6F513   |
CODE_B6F516:					;	   |
	DEC A					;$B6F516   |
	BNE CODE_B6F516				;$B6F517   |
	LDA CPU.divide_remainder		;$B6F519   |
CODE_B6F51C:					;	   |
	STA $002A,y				;$B6F51C   |
	LDA #$01B0				;$B6F51F   |
	CMP $06,x				;$B6F522   |
	BCC CODE_B6F53B				;$B6F524   |
	LDA $0022,y				;$B6F526   |
	EOR #$FFFF				;$B6F529   |
	INC A					;$B6F52C   |
	STA $0022,y				;$B6F52D   |
	LDA #$FFFF				;$B6F530   |
	STA $0020,y				;$B6F533   |
	LDA #$0306				;$B6F536   |
	BRA CODE_B6F544				;$B6F539  /

CODE_B6F53B:
	LDA #$0001				;$B6F53B  \
	STA $0020,y				;$B6F53E   |
	LDA #$0305				;$B6F541   |
CODE_B6F544:					;	   |
	STA $000C,y				;$B6F544   |
	JSL CODE_B4C175				;$B6F547   |
	STA CPU.dividen				;$B6F54B   |
	LDA #$000E				;$B6F54E   |
	SEP #$20				;$B6F551   |
	STA CPU.divisor				;$B6F553   |
	REP #$20				;$B6F556   |
	LDA #$0008				;$B6F558   |
CODE_B6F55B:					;	   |
	DEC A					;$B6F55B   |
	BNE CODE_B6F55B				;$B6F55C   |
	LDA CPU.divide_remainder		;$B6F55E   |
	INC A					;$B6F561   |
	CMP #$0003				;$B6F562   |
	BCS CODE_B6F56A				;$B6F565   |
	ADC #$0003				;$B6F567   |
CODE_B6F56A:					;	   |
	STA $0054,y				;$B6F56A   |
CODE_B6F56D:					;	   |
	PLX					;$B6F56D   |
	STX current_sprite			;$B6F56E   |
	RTS					;$B6F570  /

CODE_B6F571:
	PHB					;$B6F571  \
	PHK					;$B6F572   |
	PLB					;$B6F573   |
if !version == 1				;	   |
	JSL CODE_BAC949				;$B6F574   |
endif						;	   |
	LDX current_sprite			;$B6F578   |
	JSL CODE_B9D100				;$B6F57A   |
	LDX current_sprite			;$B6F57E   |
	LDA $42,x				;$B6F580   |
	BNE CODE_B6F5D7				;$B6F582   |
	JSL CODE_B4AEAF				;$B6F584   |
	STZ $04,x				;$B6F588   |
	STZ $32,x				;$B6F58A   |
	STZ $06A1				;$B6F58C   |
	STZ $06A3				;$B6F58F   |
	STZ $06A5				;$B6F592   |
	LDA #DATA_B6F932			;$B6F595   |
	STA $00065A				;$B6F598   |
	LDA #$0004				;$B6F59C   |
	STA $000652				;$B6F59F   |
	LDA #$0001				;$B6F5A3   |
	STA $0006D5				;$B6F5A6   |
	STZ $06D7				;$B6F5AA   |
	STZ $06D9				;$B6F5AD   |
	STZ $06DB				;$B6F5B0   |
	STZ $06DD				;$B6F5B3   |
	STZ $06DF				;$B6F5B6   |
	LDY #$009C				;$B6F5B9   |
	JSL CODE_BB842C				;$B6F5BC   |
	LDA alternate_sprite			;$B6F5C0   |
	LDX current_sprite			;$B6F5C2   |
	STX $0654				;$B6F5C4   |
	STA $000656				;$B6F5C7   |
	STA $42,x				;$B6F5CB   |
	STZ $44,x				;$B6F5CD   |
	STZ $0E,x				;$B6F5CF   |
	STZ $06D3				;$B6F5D1   |
	JSR CODE_B6D008				;$B6F5D4   |
CODE_B6F5D7:					;	   |
	LDA.l $000652				;$B6F5D7   |
	BNE CODE_B6F5E0				;$B6F5DB   |
	BRL CODE_B6F692				;$B6F5DD  /

CODE_B6F5E0:
	LDX current_sprite			;$B6F5E0  \
	LDA $2E,x				;$B6F5E2   |
	BIT #$0200				;$B6F5E4   |
	BEQ CODE_B6F61A				;$B6F5E7   |
	LDA $04,x				;$B6F5E9   |
	BEQ CODE_B6F5F2				;$B6F5EB   |
	DEC $04,x				;$B6F5ED   |
	BRL CODE_B6F672				;$B6F5EF  /

CODE_B6F5F2:
	JSL CODE_BCFB58				;$B6F5F2  \
	LDA #$007B				;$B6F5F6   |
	JSL CODE_B6CF65				;$B6F5F9   |
	BCC CODE_B6F672				;$B6F5FD   |
	LDA #$001E				;$B6F5FF   |
	LDY #$FE00				;$B6F602   |
	JSL CODE_B3A600				;$B6F605   |
	LDX $0654				;$B6F609   |
	LDA $2E,x				;$B6F60C   |
	ORA #$0200				;$B6F60E   |
	STA $2E,x				;$B6F611   |
	LDA #$0014				;$B6F613   |
	STA $04,x				;$B6F616   |
	BRA CODE_B6F672				;$B6F618  /

CODE_B6F61A:
	JSL CODE_BCFB58				;$B6F61A  \
	LDA #$0000				;$B6F61E   |
	PHX					;$B6F621   |
	PHY					;$B6F622   |
	LDY current_sprite			;$B6F623   |
	LDX $12,y				;$B6F625   |
	PHX					;$B6F627   |
	LDY #$0020				;$B6F628   |
	JSL CODE_BEBE8E				;$B6F62B   |
	LDY current_sprite			;$B6F62F   |
	PLX					;$B6F631   |
	STX $12,y				;$B6F632   |
	PLY					;$B6F634   |
	PLX					;$B6F635   |
	BCC CODE_B6F672				;$B6F636   |
	BEQ CODE_B6F650				;$B6F638   |
	CMP #$0002				;$B6F63A   |
	BEQ CODE_B6F650				;$B6F63D   |
	LDA.l $000652				;$B6F63F   |
	CMP #$0003				;$B6F643   |
	BCS CODE_B6F672				;$B6F646   |
	LDA #$8000				;$B6F648   |
	TSB $06A1				;$B6F64B   |
	BRA CODE_B6F672				;$B6F64E  /

CODE_B6F650:
	LDX $0654				;$B6F650  \
	LDA $2E,x				;$B6F653   |
	ORA #$0200				;$B6F655   |
	STA $2E,x				;$B6F658   |
	LDA #$0014				;$B6F65A   |
	STA $04,x				;$B6F65D   |
	LDA #$001E				;$B6F65F   |
	LDY #$FE00				;$B6F662   |
	JSL CODE_B3A600				;$B6F665   |
	LDY inactive_kong_sprite		;$B6F669   |
	JSR CODE_B6F82D				;$B6F66C   |
	LDX $0654				;$B6F66F   |
CODE_B6F672:					;	   |
	LDA $2E,x				;$B6F672   |
	BIT #$0001				;$B6F674   |
	BEQ CODE_B6F680				;$B6F677   |
	JSR CODE_B6F326				;$B6F679   |
	LDA $44,x				;$B6F67C   |
	BEQ CODE_B6F68B				;$B6F67E   |
CODE_B6F680:					;	   |
	LDA $44,x				;$B6F680   |
	JSR ($0044,x)				;$B6F682   |
	LDX current_sprite			;$B6F685   |
	LDA $44,x				;$B6F687   |
	BNE CODE_B6F68E				;$B6F689   |
CODE_B6F68B:					;	   |
	JSR CODE_B6D008				;$B6F68B   |
CODE_B6F68E:					;	   |
	PLB					;$B6F68E   |
	JML [$05A9]				;$B6F68F  /

CODE_B6F692:
	LDA $2E,x				;$B6F692  \
	BIT #$0400				;$B6F694   |
	BNE CODE_B6F69C				;$B6F697   |
	BRL CODE_B6F68E				;$B6F699  /

CODE_B6F69C:
	LDA $2E,x				;$B6F69C  \
	BIT #$0800				;$B6F69E   |
	BEQ CODE_B6F6A6				;$B6F6A1   |
	BRL CODE_B6F70A				;$B6F6A3  /

CODE_B6F6A6:
	LDA $0A,x				;$B6F6A6  \
	CLC					;$B6F6A8   |
	ADC $0C,x				;$B6F6A9   |
	STA $0A,x				;$B6F6AB   |
	CMP #$01EB				;$B6F6AD   |
	BCC CODE_B6F6EA				;$B6F6B0   |
	LDA #$01EB				;$B6F6B2   |
	STA $0A,x				;$B6F6B5   |
	LDA #$0002				;$B6F6B7   |
	DEC A					;$B6F6BA   |
	DEC A					;$B6F6BB   |
	STA $0E,x				;$B6F6BC   |
	DEC A					;$B6F6BE   |
	STA $10,x				;$B6F6BF   |
	LDA $0C,x				;$B6F6C1   |
	CMP #$0004				;$B6F6C3   |
	BCC CODE_B6F6D8				;$B6F6C6   |
	LDA #$FFFC				;$B6F6C8   |
	STA $0C,x				;$B6F6CB   |
	PHX					;$B6F6CD   |
	LDA #$0402				;$B6F6CE   |
	JSL queue_sound_effect			;$B6F6D1   |
	PLX					;$B6F6D5   |
	BRA CODE_B6F6EA				;$B6F6D6  /

CODE_B6F6D8:
	LDA $2E,x				;$B6F6D8  \
	ORA #$0800				;$B6F6DA   |
	STA $2E,x				;$B6F6DD   |
	PHX					;$B6F6DF   |
	LDA #$0402				;$B6F6E0   |
	JSL queue_sound_effect			;$B6F6E3   |
	PLX					;$B6F6E7   |
	BRA CODE_B6F70A				;$B6F6E8  /

CODE_B6F6EA:
	INC $0E,x				;$B6F6EA  \
	LDA $0E,x				;$B6F6EC   |
	CMP #$0002				;$B6F6EE   |
	BNE CODE_B6F6F7				;$B6F6F1   |
	STZ $0E,x				;$B6F6F3   |
	INC $0C,x				;$B6F6F5   |
CODE_B6F6F7:					;	   |
	LDA $10,x				;$B6F6F7   |
	SEC					;$B6F6F9   |
	SBC $0E,x				;$B6F6FA   |
	BPL CODE_B6F708				;$B6F6FC   |
	CLC					;$B6F6FE   |
	ADC #$0002				;$B6F6FF   |
	STA $10,x				;$B6F702   |
	INC $0A,x				;$B6F704   |
	BRA CODE_B6F70A				;$B6F706  /

CODE_B6F708:
	STA $10,x				;$B6F708  \
CODE_B6F70A:					;	   |
	LDY $0656				;$B6F70A   |
	LDA $0A,x				;$B6F70D   |
	STA $000A,y				;$B6F70F   |
	LDA $06,x				;$B6F712   |
	STA $0006,y				;$B6F714   |
	BRL CODE_B6F68E				;$B6F717  /

CODE_B6F71A:
	LDX current_sprite			;$B6F71A  \
	LDA $0C,x				;$B6F71C   |
	BEQ CODE_B6F724				;$B6F71E   |
	JSL set_sprite_animation		;$B6F720   |
CODE_B6F724:					;	   |
	RTL					;$B6F724  /

CODE_B6F725:
	LDX current_sprite			;$B6F725  \
	LDA $2E,x				;$B6F727   |
	ORA #$0040				;$B6F729   |
	STA $2E,x				;$B6F72C   |
	RTL					;$B6F72E  /

CODE_B6F72F:
	LDX current_sprite			;$B6F72F  \
	LDA $2E,x				;$B6F731   |
	BIT #$0002				;$B6F733   |
	BNE CODE_B6F745				;$B6F736   |
	LDA $3A,x				;$B6F738   |
	CLC					;$B6F73A   |
	ADC #$0020				;$B6F73B   |
	CMP #$0200				;$B6F73E   |
	BCS CODE_B6F745				;$B6F741   |
	STA $3A,x				;$B6F743   |
CODE_B6F745:					;	   |
	RTL					;$B6F745  /

CODE_B6F746:
	LDX current_sprite			;$B6F746  \
	LDA $2E,x				;$B6F748   |
	ORA #$0400				;$B6F74A   |
	AND #$FDFF				;$B6F74D   |
	STA $2E,x				;$B6F750   |
	RTL					;$B6F752  /

CODE_B6F753:
	LDX current_sprite			;$B6F753  \
	LDA $1E,x				;$B6F755   |
	LDY $42,x				;$B6F757   |
	ORA $001E,y				;$B6F759   |
	BEQ CODE_B6F780				;$B6F75C   |
	LDA $1E,x				;$B6F75E   |
	BEQ CODE_B6F768				;$B6F760   |
	STA $00065C				;$B6F762   |
	STZ $1E,x				;$B6F766   |
CODE_B6F768:					;	   |
	LDY $42,x				;$B6F768   |
	LDA $001E,y				;$B6F76A   |
	BEQ CODE_B6F779				;$B6F76D   |
	STA $00065E				;$B6F76F   |
	LDA #$0000				;$B6F773   |
	STA $001E,y				;$B6F776   |
CODE_B6F779:					;	   |
	LDA $2E,x				;$B6F779   |
	BIT #$0002				;$B6F77B   |
	BEQ CODE_B6F79E				;$B6F77E   |
CODE_B6F780:					;	   |
	LDA $2E,x				;$B6F780   |
	BIT #$0002				;$B6F782   |
	BEQ CODE_B6F7C2				;$B6F785   |
	AND #$FFFD				;$B6F787   |
	STA $2E,x				;$B6F78A   |
	LDA $12,x				;$B6F78C   |
	EOR #$4000				;$B6F78E   |
	STA $12,x				;$B6F791   |
	LDY $42,x				;$B6F793   |
	LDA $0012,y				;$B6F795   |
	EOR #$4000				;$B6F798   |
	STA $0012,y				;$B6F79B   |
CODE_B6F79E:					;	   |
	LDA.l $00065C				;$B6F79E   |
	BEQ CODE_B6F7AB				;$B6F7A2   |
	JSL set_sprite_animation		;$B6F7A4   |
	STZ $065C				;$B6F7A8   |
CODE_B6F7AB:					;	   |
	LDA.l $00065E				;$B6F7AB   |
	BEQ CODE_B6F7C2				;$B6F7AF   |
	LDX current_sprite			;$B6F7B1   |
	PHX					;$B6F7B3   |
	LDY $42,x				;$B6F7B4   |
	STY current_sprite			;$B6F7B6   |
	JSL set_sprite_animation		;$B6F7B8   |
	STZ $065E				;$B6F7BC   |
	PLX					;$B6F7BF   |
	STX current_sprite			;$B6F7C0   |
CODE_B6F7C2:					;	   |
	RTL					;$B6F7C2  /

CODE_B6F7C3:
	LDA.l $000652				;$B6F7C3  \
	BNE CODE_B6F7CC				;$B6F7C7   |
	BRL CODE_B6F824				;$B6F7C9  /

CODE_B6F7CC:
	LDX $0654				;$B6F7CC  \
	LDA $2E,x				;$B6F7CF   |
	BIT #$0200				;$B6F7D1   |
	BNE CODE_B6F7FC				;$B6F7D4   |
	JSL CODE_BCFB58				;$B6F7D6   |
	LDA #$0000				;$B6F7DA   |
	PHX					;$B6F7DD   |
	PHY					;$B6F7DE   |
	LDY current_sprite			;$B6F7DF   |
	LDX $12,y				;$B6F7E1   |
	PHX					;$B6F7E3   |
	LDY #$0020				;$B6F7E4   |
	JSL CODE_BEBE8E				;$B6F7E7   |
	LDY current_sprite			;$B6F7EB   |
	PLX					;$B6F7ED   |
	STX $12,y				;$B6F7EE   |
	PLY					;$B6F7F0   |
	PLX					;$B6F7F1   |
	BCC CODE_B6F824				;$B6F7F2   |
	LDA #$8000				;$B6F7F4   |
	TSB $06A1				;$B6F7F7   |
	BRA CODE_B6F824				;$B6F7FA  /

CODE_B6F7FC:
	LDX $0654				;$B6F7FC  \
	LDA $04,x				;$B6F7FF   |
	BNE CODE_B6F824				;$B6F801   |
	LDX current_sprite			;$B6F803   |
	JSL CODE_BCFB58				;$B6F805   |
	LDA #$007B				;$B6F809   |
	JSL CODE_B6CF65				;$B6F80C   |
	BCC CODE_B6F824				;$B6F810   |
	LDA #$001E				;$B6F812   |
	LDY #$FE00				;$B6F815   |
	JSL CODE_B3A600				;$B6F818   |
	LDX $0654				;$B6F81C   |
	LDA #$0014				;$B6F81F   |
	STA $04,x				;$B6F822   |
CODE_B6F824:					;	   |
	LDX current_sprite			;$B6F824   |
	JSL CODE_B9D100				;$B6F826   |
	JML [$05A9]				;$B6F82A  /

CODE_B6F82D:
	PHY					;$B6F82D  \
	LDX $0654				;$B6F82E   |
	STX current_sprite			;$B6F831   |
	STZ $4C,x				;$B6F833   |
	LDA $2E,x				;$B6F835   |
	AND #$FFEF				;$B6F837   |
	STA $2E,x				;$B6F83A   |
	JSL CODE_B8D1F0				;$B6F83C   |
	LDA.l $000652				;$B6F840   |
	CMP #$0003				;$B6F844   |
	BCS CODE_B6F84C				;$B6F847   |
	STZ $06D3				;$B6F849   |
CODE_B6F84C:					;	   |
	DEC $0652				;$B6F84C   |
	LDA.l $0006A1				;$B6F84F   |
	ORA #$8000				;$B6F853   |
	STA $0006A1				;$B6F856   |
	JSR CODE_B6F8F3				;$B6F85A   |
	LDA $2E,x				;$B6F85D   |
	ORA #$1200				;$B6F85F   |
	AND #$FFFD				;$B6F862   |
	STA $2E,x				;$B6F865   |
	LDA $2E,x				;$B6F867   |
	BIT #$0020				;$B6F869   |
	BEQ CODE_B6F87A				;$B6F86C   |
	LDA.l $000660				;$B6F86E   |
	STA $06,x				;$B6F872   |
	LDA.l $000662				;$B6F874   |
	STA $0A,x				;$B6F878   |
CODE_B6F87A:					;	   |
	LDA $2E,x				;$B6F87A   |
	AND #$FFDA				;$B6F87C   |
	STA $2E,x				;$B6F87F   |
	LDA.l $000652				;$B6F881   |
	BEQ CODE_B6F891				;$B6F885   |
	CMP #$0003				;$B6F887   |
	BCS CODE_B6F8A1				;$B6F88A   |
	LDA #DATA_B6FDFA			;$B6F88C   |
	BRA CODE_B6F8A4				;$B6F88F  /

CODE_B6F891:
	LDA #$0202				;$B6F891  \
	STA $1E,x				;$B6F894   |
	LDY $0656				;$B6F896   |
	LDA #$020A				;$B6F899   |
	STA $001E,y				;$B6F89C   |
	BRA CODE_B6F8EC				;$B6F89F  /

CODE_B6F8A1:
	LDA #DATA_B6FDEA			;$B6F8A1  \
CODE_B6F8A4:					;	   |
	STA $46,x				;$B6F8A4   |
	STZ $1E,x				;$B6F8A6   |
	LDA #$0207				;$B6F8A8   |
	JSL set_sprite_animation		;$B6F8AB   |
	LDX $0656				;$B6F8AF   |
	STX current_sprite			;$B6F8B2   |
	STZ $1E,x				;$B6F8B4   |
	LDA #$0208				;$B6F8B6   |
	JSL set_sprite_animation		;$B6F8B9   |
	LDX $0654				;$B6F8BD   |
	STX current_sprite			;$B6F8C0   |
	LDA #DATA_B6CE3B			;$B6F8C2   |
	STA $20,x				;$B6F8C5   |
	LDA #CODE_B6CEA7			;$B6F8C7   |
	STA $22,x				;$B6F8CA   |
	LDA #$0001				;$B6F8CC   |
	STA $24,x				;$B6F8CF   |
	STA $26,x				;$B6F8D1   |
	LDA $01,s				;$B6F8D3   |
	TAY					;$B6F8D5   |
	LDA $06,x				;$B6F8D6   |
	CMP $0006,y				;$B6F8D8   |
	BCS CODE_B6F8E2				;$B6F8DB   |
	LDA #$FFFF				;$B6F8DD   |
	BRA CODE_B6F8E5				;$B6F8E0  /

CODE_B6F8E2:
	LDA #$0001				;$B6F8E2  \
CODE_B6F8E5:					;	   |
	STA $28,x				;$B6F8E5   |
	LDA #CODE_B6F8EE			;$B6F8E7   |
	STA $44,x				;$B6F8EA   |
CODE_B6F8EC:					;	   |
	PLY					;$B6F8EC   |
	RTS					;$B6F8ED  /

CODE_B6F8EE:
	JSL CODE_B6CEA7				;$B6F8EE  \
	RTS					;$B6F8F2  /

CODE_B6F8F3:
	LDA $0E,x				;$B6F8F3  \
	BEQ CODE_B6F903				;$B6F8F5   |
	PHX					;$B6F8F7   |
	STA current_sprite			;$B6F8F8   |
	JSL CODE_BB82B8				;$B6F8FA   |
	PLX					;$B6F8FE   |
	STX current_sprite			;$B6F8FF   |
	STZ $0E,x				;$B6F901   |
CODE_B6F903:					;	   |
	RTS					;$B6F903  /

CODE_B6F904:
	PHX					;$B6F904  \
	LDX $0654				;$B6F905   |
	LDA $2E,x				;$B6F908   |
	ORA #$0400				;$B6F90A   |
	STA $2E,x				;$B6F90D   |
	LDA #$0001				;$B6F90F   |
	STA $0C,x				;$B6F912   |
	LDA #$0002				;$B6F914   |
	DEC A					;$B6F917   |
	DEC A					;$B6F918   |
	STA $0E,x				;$B6F919   |
	DEC A					;$B6F91B   |
	STA $10,x				;$B6F91C   |
	STX current_sprite			;$B6F91E   |
	LDA #$020B				;$B6F920   |
	JSL set_sprite_animation		;$B6F923   |
	PLX					;$B6F927   |
	STX current_sprite			;$B6F928   |
	LDA #$020C				;$B6F92A   |
	JSL set_sprite_animation		;$B6F92D   |
	RTL					;$B6F931  /

DATA_B6F932:
	dw !boss_command_animated_wait, $003C, $0200
	dw !boss_command_krow_animation, $0201, $025D
	dw !boss_command_animated_wait, $003C, $0201
	dw !boss_command_krow_animation, $0200, $0000

DATA_B6F94A:
	dw !boss_command_set_pattern, DATA_B6FA2C
	dw !boss_command_13
	dw !boss_command_fly_to, $01B0, $0130, $0003
	dw !boss_command_layer_priority, $2000
	dw !boss_command_fly_to, $01B0, $0158, $0002
	dw !boss_command_18
	dw !boss_command_grab_egg
	dw !boss_command_fly_to, $01B0, $0115, $0002
	dw !boss_command_1C
	dw !boss_command_layer_priority, $3000
	dw !boss_command_egg_layer_priority, $3000
	dw !boss_command_lock_camera
	dw !boss_command_fly_to_egg_drop, $0000
	dw !boss_command_0A
	dw !boss_command_face, $FFFF, $0001, $0001
	dw !boss_command_animated_wait, $0014, $0200
	dw !boss_command_drop_egg, $0000
	dw !boss_command_animated_wait_for_egg, $0200

DATA_B6F998:
	dw !boss_command_animated_wait, $0032, $0200
	dw !boss_command_fly_to, $025D, $017F, $0002
	dw !boss_command_fly_to, $025E, $018D, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_fly_to, $025E, $0199, $0002
	dw !boss_command_fly_to, $025E, $01B4, $0003
	dw !boss_command_fly_to, $025E, $01CD, $0003
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_fly_to, $0250, $01D2, $0003
	dw !boss_command_fly_to, $0240, $01D5, $0003
	dw !boss_command_fly_to, $0230, $01D7, $0003
	dw !boss_command_fly_to, $0204, $01D8, $0003
	dw !boss_command_fly_to, $015C, $01D8, $0003
	dw !boss_command_fly_to, $0147, $01D3, $0003
	dw !boss_command_fly_to, $0129, $01B9, $0002
	dw !boss_command_fly_to, $0119, $018C, $0002
	dw !boss_command_fly_to, $0115, $0157, $0002
	dw !boss_command_fly_to, $012B, $014B, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_goto_or_reset, !null_pointer

DATA_B6FA2C:
	dw !boss_command_set_pattern, DATA_B6F94A
	dw !boss_command_13
	dw !boss_command_fly_to, $01B0, $0130, $0003
	dw !boss_command_1C
	dw !boss_command_layer_priority, $2000
	dw !boss_command_fly_to, $01B0, $0158, $0002
	dw !boss_command_18
	dw !boss_command_grab_egg
	dw !boss_command_fly_to, $01B0, $0115, $0002
	dw !boss_command_layer_priority, $3000
	dw !boss_command_egg_layer_priority, $3000
	dw !boss_command_lock_camera
	dw !boss_command_fly_to_egg_drop, $0000
	dw !boss_command_0A
	dw !boss_command_face, $0001, $0001, $0001
	dw !boss_command_animated_wait, $0014, $0200
	dw !boss_command_drop_egg, $0001
	dw !boss_command_animated_wait_for_egg, $0200

DATA_B6FA7A:
	dw !boss_command_animated_wait, $0032, $0200
	dw !boss_command_fly_to, $0123, $017F, $0002
	dw !boss_command_fly_to, $0122, $018D, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_fly_to, $0122, $0199, $0002
	dw !boss_command_fly_to, $0122, $01B4, $0003
	dw !boss_command_fly_to, $0122, $01CD, $0003
	dw !boss_command_krow_animation, $0201, $0000
	dw !boss_command_fly_to, $0130, $01D2, $0003
	dw !boss_command_fly_to, $0140, $01D5, $0003
	dw !boss_command_fly_to, $0150, $01D7, $0003
	dw !boss_command_fly_to, $017C, $01D8, $0003
	dw !boss_command_fly_to, $0224, $01D8, $0003
	dw !boss_command_fly_to, $0239, $01D3, $0003
	dw !boss_command_fly_to, $0257, $01B9, $0002
	dw !boss_command_fly_to, $0267, $018C, $0002
	dw !boss_command_fly_to, $026B, $0157, $0002
	dw !boss_command_fly_to, $0255, $014B, $0002
	dw !boss_command_krow_animation, $0200, $0000
	dw !boss_command_goto_or_reset, !null_pointer

DATA_B6FB0E:
	dw !boss_command_13
	dw !boss_command_fly_to, $01B0, $0162, $0002
	dw !boss_command_1C
	dw !boss_command_fly_to, $0200, $0162, $0001
	dw !boss_command_fly_to, $0206, $0164, $0001
	dw !boss_command_fly_to, $0210, $0167, $0002
	dw !boss_command_fly_to, $0225, $0176, $0002
	dw !boss_command_fly_to, $022A, $017C, $0002
	dw !boss_command_fly_to, $022D, $0181, $0002
	dw !boss_command_fly_to, $022A, $0184, $0002
	dw !boss_command_fly_to, $0225, $018B, $0002
	dw !boss_command_fly_to, $0210, $0199, $0003
	dw !boss_command_fly_to, $0206, $019D, $0003
	dw !boss_command_fly_to, $0200, $019F, $0003
	dw !boss_command_fly_to, $01D3, $019F, $0004
	dw !boss_command_set_pattern, DATA_B6FBB2
	dw !boss_command_shake_screen, $1000, $0400
	dw !boss_command_15, $FFEC, $FFEC
	dw !boss_command_16
	dw !boss_command_krow_animation, $0200, $0209
	dw !boss_command_rain_eggs
	dw !boss_command_10
	dw !boss_command_fly_to, $01F0, $019F, $0002
	dw !boss_command_fly_to, $0200, $019F, $0001
	dw !boss_command_11
	dw !boss_command_0F, $0200
if !version == 0
	dw !boss_command_19, $AF04, $AF34
else
	dw !boss_command_19, $AEE0, $AF10
endif

DATA_B6FBB2:
	dw !boss_command_fly_to, $01B0, $019F, $0002
	dw !boss_command_fly_to, $0160, $019F, $0002
	dw !boss_command_fly_to, $0157, $019D, $0002
	dw !boss_command_fly_to, $014D, $0199, $0002
	dw !boss_command_fly_to, $0138, $018B, $0002
	dw !boss_command_fly_to, $0133, $0184, $0002
	dw !boss_command_fly_to, $0130, $0181, $0002
	dw !boss_command_fly_to, $0133, $017C, $0002
	dw !boss_command_fly_to, $0138, $0176, $0002
	dw !boss_command_fly_to, $014D, $0167, $0002
	dw !boss_command_fly_to, $0157, $0164, $0002
	dw !boss_command_fly_to, $0160, $0162, $0002
	dw !boss_command_fly_to, $01B0, $0162, $0002
	dw !boss_command_fly_to, $0200, $0162, $0002
	dw !boss_command_fly_to, $0206, $0164, $0002
	dw !boss_command_fly_to, $0210, $0167, $0002
	dw !boss_command_fly_to, $0225, $0176, $0002
	dw !boss_command_fly_to, $022A, $017C, $0002
	dw !boss_command_fly_to, $022D, $0181, $0002
	dw !boss_command_fly_to, $022A, $0184, $0002
	dw !boss_command_fly_to, $0225, $018B, $0002
	dw !boss_command_fly_to, $0210, $0199, $0002
	dw !boss_command_fly_to, $0206, $019D, $0002
	dw !boss_command_fly_to, $0200, $019F, $0002
	dw !boss_command_goto_or_reset, !null_pointer

DATA_B6FC76:
	dw !boss_command_13
	dw !boss_command_fly_to, $01B0, $0162, $0002
	dw !boss_command_1C
	dw !boss_command_fly_to, $0160, $0162, $0001
	dw !boss_command_fly_to, $0157, $0164, $0001
	dw !boss_command_fly_to, $014D, $0167, $0002
	dw !boss_command_fly_to, $0138, $0176, $0002
	dw !boss_command_fly_to, $0133, $017C, $0002
	dw !boss_command_fly_to, $0130, $0181, $0002
	dw !boss_command_fly_to, $0133, $0184, $0002
	dw !boss_command_fly_to, $0138, $018B, $0002
	dw !boss_command_fly_to, $014D, $0199, $0003
	dw !boss_command_fly_to, $0157, $019D, $0003
	dw !boss_command_fly_to, $0160, $019F, $0003
	dw !boss_command_fly_to, $018D, $019F, $0004
	dw !boss_command_set_pattern, DATA_B6FD1A
	dw !boss_command_shake_screen, $1000, $0400
	dw !boss_command_15, $0014, $FFEC
	dw !boss_command_16
	dw !boss_command_krow_animation, $0200, $0209
	dw !boss_command_rain_eggs
	dw !boss_command_10
	dw !boss_command_fly_to, $0170, $019F, $0002
	dw !boss_command_fly_to, $0160, $019F, $0001
	dw !boss_command_11
	dw !boss_command_0F, $0200
if !version == 0
	dw !boss_command_19, $AF04, $AF34
else
	dw !boss_command_19, $AEE0, $AF10
endif

DATA_B6FD1A:
	dw !boss_command_fly_to, $0200, $019F, $0002
	dw !boss_command_fly_to, $0206, $019D, $0002
	dw !boss_command_fly_to, $0210, $0199, $0002
	dw !boss_command_fly_to, $0225, $018B, $0002
	dw !boss_command_fly_to, $022A, $0184, $0002
	dw !boss_command_fly_to, $022D, $0181, $0002
	dw !boss_command_fly_to, $022A, $017C, $0002
	dw !boss_command_fly_to, $0225, $0176, $0002
	dw !boss_command_fly_to, $0210, $0167, $0002
	dw !boss_command_fly_to, $0206, $0164, $0002
	dw !boss_command_fly_to, $0200, $0162, $0002
	dw !boss_command_fly_to, $01B0, $0162, $0002
	dw !boss_command_fly_to, $0160, $0162, $0002
	dw !boss_command_fly_to, $0157, $0164, $0002
	dw !boss_command_fly_to, $014D, $0167, $0002
	dw !boss_command_fly_to, $0138, $0176, $0002
	dw !boss_command_fly_to, $0133, $017C, $0002
	dw !boss_command_fly_to, $0130, $0181, $0002
	dw !boss_command_fly_to, $0133, $0184, $0002
	dw !boss_command_fly_to, $0138, $018B, $0002
	dw !boss_command_fly_to, $014D, $0199, $0002
	dw !boss_command_fly_to, $0157, $019D, $0002
	dw !boss_command_fly_to, $0160, $019F, $0002
	dw !boss_command_fly_to, $01B0, $019F, $0002
	dw !boss_command_goto_or_reset, !null_pointer

DATA_B6FDDE:
	dw !boss_command_select_goto, DATA_B6FB0E, DATA_B6FC76
	dw !boss_command_goto_or_reset, DATA_B6F998, DATA_B6FA7A

DATA_B6FDEA:
	dw !boss_command_krow_animation, $0200, $0204
	dw !boss_command_select_goto, DATA_B6F94A, DATA_B6FA2C
	dw !boss_command_goto_or_reset, !null_pointer

DATA_B6FDFA:
	dw !boss_command_krow_animation, $0200, $0204
	dw !boss_command_select_goto, DATA_B6FB0E, DATA_B6FC76
	dw !boss_command_18
	dw !boss_command_goto_or_reset, !null_pointer

	db $02, $00, $00, $00, $02, $00, $00, $00
	db $02, $00, $00, $00, $FE, $FF, $00, $00
	db $FE, $FF, $00, $00, $FE, $FF, $00, $00

DATA_B6FE24:
	dw !null_pointer
	dw DATA_B6FE2E
	dw DATA_B6FE4A
	dw DATA_B6FE66
	dw DATA_B6FE82

DATA_B6FE2E:
	dw $000A
	dw $0064
	dw $0000
	dw $0002
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0050
	dw $0078				;egg fall delay
	dw $0001
	dw $0000

DATA_B6FE4A:
	dw $000A
	dw $0064
	dw $0000
	dw $0002
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0078
	dw $00B4				;egg fall delay
	dw $0001
	dw $0000

DATA_B6FE66:
	dw $012C				;time before swoop after egg drop
	dw $0050
	dw $0050
	dw $0002				;fly speed to drop location
	dw $0000
	dw $000E
	dw $0000
	dw $0000
	dw $00C8				;time before egg crack
	dw $0008
	dw $0000
	dw $0000				;egg fall delay
	dw $0002
	dw $0002

DATA_B6FE82:
	dw $0168				;time before swoop after egg drop
	dw $0050
	dw $0050
	dw $0001				;fly speed to drop location
	dw $0000
	dw $000C
	dw $0000
	dw $0000
	dw $00C8				;time before egg crack
	dw $000A
	dw $0000
	dw $0000				;egg fall delay
	dw $0002
	dw $0002

CODE_B6FE9E:
	JSR CODE_B6FEA2				;$B6FE9E  \
	RTL					;$B6FE9F  /

CODE_B6FEA2:
	JSL CODE_BCFED8				;$B6FEA2  \
	JSL CODE_BCFEC0				;$B6FEA6   |
	JSL CODE_B3A334				;$B6FEAA   |
	LDY.w #DATA_FF103A			;$B6FEAE   |
	JSL CODE_BB8432				;$B6FEB1   |
	LDX current_sprite			;$B6FEB5   |
	RTS					;$B6FEB7  /
