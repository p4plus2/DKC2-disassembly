CODE_B9D000:
	TAX					;$B9D000  \
	LDA $66					;$B9D001   |
	PHA					;$B9D003   |
	LDA current_sprite			;$B9D004   |
	PHA					;$B9D006   |
	LDA $0599				;$B9D007   |
	STA $66					;$B9D00A   |
	LDA $0597				;$B9D00C   |
	STA current_sprite			;$B9D00F   |
	TXA					;$B9D011   |
	JSL CODE_B9D0B8				;$B9D012   |
	PLA					;$B9D016   |
	STA current_sprite			;$B9D017   |
	PLA					;$B9D019   |
	STA $66					;$B9D01A   |
	RTL					;$B9D01C  /

CODE_B9D01D:
	TAX					;$B9D01D  \
	LDA $66					;$B9D01E   |
	PHA					;$B9D020   |
	LDA current_sprite			;$B9D021   |
	PHA					;$B9D023   |
	LDA $0599				;$B9D024   |
	STA $66					;$B9D027   |
	LDA $0597				;$B9D029   |
	STA current_sprite			;$B9D02C   |
	TXA					;$B9D02E   |
	JSL set_sprite_animation		;$B9D02F   |
	PLA					;$B9D033   |
	STA current_sprite			;$B9D034   |
	PLA					;$B9D036   |
	STA $66					;$B9D037   |
	RTL					;$B9D039  /

CODE_B9D03A:
	STA $26					;$B9D03A  \
	LDX current_sprite			;$B9D03C   |
	LDA $00,x				;$B9D03E   |
	SEC					;$B9D040   |
	SBC #$01A4				;$B9D041   |
	LSR A					;$B9D044   |
	LSR A					;$B9D045   |
	CLC					;$B9D046   |
	ADC $26					;$B9D047   |
	BRA set_sprite_animation		;$B9D049  /

CODE_B9D04B:
	STA $32					;$B9D04B  \
	LDA $0595				;$B9D04D   |
	STA $66					;$B9D050   |
	TAX					;$B9D052   |
	LDA $00,x				;$B9D053   |
	PHX					;$B9D055   |
	PHA					;$B9D056   |
	LDA current_sprite			;$B9D057   |
	PHA					;$B9D059   |
	LDA current_player_mount		;$B9D05A   |
	BEQ .is_animal				;$B9D05C   |
	STA current_sprite			;$B9D05E   |
	LDX current_sprite			;$B9D060   |
	LDA $00,x				;$B9D062   |
	SEC					;$B9D064   |
	SBC #$0190				;$B9D065   |
	LSR A					;$B9D068   |
	LSR A					;$B9D069   |
	CLC					;$B9D06A   |
	ADC $32					;$B9D06B   |
	JSL CODE_B9D0B8				;$B9D06D   |
.is_animal					;	   |
	PLA					;$B9D071   |
	STA current_sprite			;$B9D072   |
	PLA					;$B9D074   |
	PLX					;$B9D075   |
	STA $00,x				;$B9D076   |
	LDX current_sprite			;$B9D078   |
	RTL					;$B9D07A  /

CODE_B9D07B:
	STA $32					;$B9D07B  \
	LDX current_sprite			;$B9D07D   |
	LDA $00,x				;$B9D07F   |
	SEC					;$B9D081   |
	SBC #$0190				;$B9D082   |
	LSR A					;$B9D085   |
	LSR A					;$B9D086   |
	CLC					;$B9D087   |
	ADC $32					;$B9D088   |
	BRA set_sprite_animation		;$B9D08A  /

CODE_B9D08C:
	STA $26					;$B9D08C  \
	LDA $6E					;$B9D08E   |
	SEC					;$B9D090   |
	SBC #$0190				;$B9D091   |
	LSR A					;$B9D094   |
	LSR A					;$B9D095   |
	CLC					;$B9D096   |
	ADC $26					;$B9D097   |
	BRA CODE_B9D0B8				;$B9D099  /

CODE_B9D09B:
	TAX					;$B9D09B  \
	LDA current_sprite			;$B9D09C   |
	PHA					;$B9D09E   |
	LDA alternate_sprite			;$B9D09F   |
	PHA					;$B9D0A1   |
	STA current_sprite			;$B9D0A2   |
	TXA					;$B9D0A4   |
	JSL set_sprite_animation		;$B9D0A5   |
	PLA					;$B9D0A9   |
	STA alternate_sprite			;$B9D0AA   |
	PLA					;$B9D0AC   |
	STA current_sprite			;$B9D0AD   |
	RTL					;$B9D0AF  /

CODE_B9D0B0:
	LDY $66					;$B9D0B0  \
	CMP $0000,y				;$B9D0B2   |
	BNE CODE_B9D0B8				;$B9D0B5   |
	RTL					;$B9D0B7  /

CODE_B9D0B8:
	LDY $66					;$B9D0B8  \
	STA $0000,y				;$B9D0BA   |
	CPY #main_sprite_table_end		;$B9D0BD   |
	BEQ set_sprite_animation		;$B9D0C0   |
	CLC					;$B9D0C2   |
	ADC #$00A3				;$B9D0C3   |
set_sprite_animation:				;	   |
	PHB					;$B9D0C6   |\
	%pea_shift_dbr(DATA_F90000)		;$B9D0C7   | | 
	PLB					;$B9D0CA   | |
	PLB					;$B9D0CB   |/
	LDX current_sprite			;$B9D0CC   |
	STA $36,x				;$B9D0CE   |\ set animation id then preserve it in Y
	TAY					;$B9D0D0   |/
	LDA #$0100				;$B9D0D1   |\
	STA $3A,x				;$B9D0D4   | | initialize animation speed
	STZ $38,x				;$B9D0D6   | | clear graphic display time
	STZ $3E,x				;$B9D0D8   | | clear animation routine call pointer
	TYA					;$B9D0DA   |/ retrieve animation id from Y
	ASL A					;$B9D0DB   |
	ASL A					;$B9D0DC   |
	TXY					;$B9D0DD   |
	TAX					;$B9D0DE   |
	LDA.l DATA_F90002,x			;$B9D0DF   |
	STA $26					;$B9D0E3   |
	LDA.l DATA_F90000,x			;$B9D0E5   |\
	TYX					;$B9D0E9   | | update animation script address
	STA $3C,x				;$B9D0EA   |/
	TAY					;$B9D0EC   |> preserve script address in Y
	LDA $26					;$B9D0ED   |
	STA $40,x				;$B9D0EF   |
	BRA process_anim_script			;$B9D0F1  /

CODE_B9D0F3:
	LDX current_sprite			;$B9D0F3  \
	LDA $2E,x				;$B9D0F5   |
	PHA					;$B9D0F7   |
	JSL CODE_B9D100				;$B9D0F8   |
	PLA					;$B9D0FC   |
	STA $2E,x				;$B9D0FD   |
	RTL					;$B9D0FF  /

CODE_B9D100:
	LDX current_sprite			;$B9D100  \
	LDA $38,x				;$B9D102   |
	SEC					;$B9D104   |
	SBC $3A,x				;$B9D105   |
	STA $38,x				;$B9D107   |
	BEQ .CODE_B9D10D			;$B9D109   |
	BPL CODE_B9D13E				;$B9D10B   |
.CODE_B9D10D					;	   |
	PHB					;$B9D10D   |
	%pea_shift_dbr(DATA_F90000)		;$B9D10E   |
	PLB					;$B9D111   |
	PLB					;$B9D112   |
	LDY $3C,x				;$B9D113   |
process_anim_script:				;	   |
	DEY					;$B9D115   |\
	LDA $0000,y				;$B9D116   | |
	BMI animation_command_handler		;$B9D119   |/ if a command was loaded handle the command
	AND #$FF00				;$B9D11B   |\
	CLC					;$B9D11E   | | otherwise a graphic draw duration was loaded
	ADC $38,x				;$B9D11F   | |
	STA $38,x				;$B9D121   | | update graphic
	BPL CODE_B9D131				;$B9D123   |/
	INY					;$B9D125   |
	INY					;$B9D126   |
	INY					;$B9D127   |
	INY					;$B9D128   |
	BRA process_anim_script			;$B9D129  /

CODE_B9D12B:
	LDX current_sprite			;$B9D12B  \
	STZ $38,x				;$B9D12D   |
	BRA CODE_B9D13D				;$B9D12F  /

CODE_B9D131:
	INY					;$B9D131  \
	INY					;$B9D132   |
	LDA $0000,y				;$B9D133   |
	STA $1A,x				;$B9D136   |
	INY					;$B9D138   |
	INY					;$B9D139   |
	TYA					;$B9D13A   |
	STA $3C,x				;$B9D13B   |
CODE_B9D13D:					;	   |
	PLB					;$B9D13D   |
CODE_B9D13E:					;	   |
	LDA $3E,x				;$B9D13E   |
	BNE CODE_B9D143				;$B9D140   |
	RTL					;$B9D142  /

CODE_B9D143:
	STA $26					;$B9D143  \
	PHB					;$B9D145   |
	PHK					;$B9D146   |
	PLB					;$B9D147   |
	PHX					;$B9D148   |
	%return(CODE_B9D14F)			;$B9D149   |
	JMP ($0026)				;$B9D14C  /

CODE_B9D14F:
	PLX					;$B9D14F  \
	PLB					;$B9D150   |
	RTL					;$B9D151  /

animation_command_handler:
	AND #$FF00				;$B9D152  \
	INY					;$B9D155   |
	XBA					;$B9D156   |
	SEC					;$B9D157   |
	SBC #$0080				;$B9D158   |
	ASL A					;$B9D15B   |
	TAX					;$B9D15C   |
	JMP (DATA_B9D4C5,x)			;$B9D15D  /

CODE_B9D160:
	LDX current_sprite			;$B9D160  \
	LDA $36,x				;$B9D162   |
	ASL A					;$B9D164   |
	ASL A					;$B9D165   |
	TXY					;$B9D166   |
	TAX					;$B9D167   |
	LDA.l DATA_F90000,x			;$B9D168   |
	TYX					;$B9D16C   |
	STA $3C,x				;$B9D16D   |
	TAY					;$B9D16F   |
	BRA process_anim_script			;$B9D170  /

CODE_B9D172:
	LDX current_sprite			;$B9D172  \
	INY					;$B9D174   |
	LDA $0000,y				;$B9D175   |
	STA $26					;$B9D178   |
	INY					;$B9D17A   |
	INY					;$B9D17B   |
	TYA					;$B9D17C   |
	PHA					;$B9D17D   |
	STA $3C,x				;$B9D17E   |
	PHB					;$B9D180   |
	PHK					;$B9D181   |
	PLB					;$B9D182   |
	%return(CODE_B9D189)			;$B9D183   |
	JMP ($0026)				;$B9D186  /

CODE_B9D189:
	PLB					;$B9D189  \
	PLA					;$B9D18A   |
	STA $52					;$B9D18B   |
	LDX current_sprite			;$B9D18D   |
	LDY $3C,x				;$B9D18F   |
	TYA					;$B9D191   |
	CMP $52					;$B9D192   |
	BNE CODE_B9D199				;$B9D194   |
	JMP process_anim_script			;$B9D196  /

CODE_B9D199:
	PLB					;$B9D199  \
	RTL					;$B9D19A  /

CODE_B9D19B:
	LDX current_sprite			;$B9D19B  \
	INY					;$B9D19D   |
	LDA $0000,y				;$B9D19E   |
	TAY					;$B9D1A1   |
	JMP process_anim_script			;$B9D1A2  /

CODE_B9D1A5:
	LDX current_sprite			;$B9D1A5  \
	TYA					;$B9D1A7   |
	STA $3C,x				;$B9D1A8   |
	INY					;$B9D1AA   |
	LDA $0000,y				;$B9D1AB   |
	STA $26					;$B9D1AE   |
	INY					;$B9D1B0   |
	INY					;$B9D1B1   |
	JMP ($0026)				;$B9D1B2  /

CODE_B9D1B5:
	LDX current_sprite			;$B9D1B5  \
	INY					;$B9D1B7   |
	LDA $0000,y				;$B9D1B8   |
	STA $3E,x				;$B9D1BB   |
	INY					;$B9D1BD   |
	INY					;$B9D1BE   |
	JMP process_anim_script			;$B9D1BF  /

CODE_B9D1C2:
	LDX current_sprite			;$B9D1C2  \
	INY					;$B9D1C4   |
	LDA $0000,y				;$B9D1C5   |
	PHY					;$B9D1C8   |
	JSL queue_sound_effect			;$B9D1C9   |
	PLY					;$B9D1CD   |
	INY					;$B9D1CE   |
	INY					;$B9D1CF   |
	LDX current_sprite			;$B9D1D0   |
	JMP process_anim_script			;$B9D1D2  /

CODE_B9D1D5:
	LDX current_sprite			;$B9D1D5  \
	INY					;$B9D1D7   |
	LDA $0000,y				;$B9D1D8   |
	%pea_mirror_dbr()			;$B9D1DB   |
	PLB					;$B9D1DE   |
	PHY					;$B9D1DF   |
	PHA					;$B9D1E0   |
	JSL CODE_BBBB69				;$B9D1E1   |
	PLA					;$B9D1E5   |
	BCS CODE_B9D1EC				;$B9D1E6   |
	JSL queue_sound_effect			;$B9D1E8   |
CODE_B9D1EC:					;	   |
	PLY					;$B9D1EC   |
	PLB					;$B9D1ED   |
	INY					;$B9D1EE   |
	INY					;$B9D1EF   |
	LDX current_sprite			;$B9D1F0   |
	JMP process_anim_script			;$B9D1F2  /

CODE_B9D1F5:
	LDX current_sprite			;$B9D1F5  \
	INY					;$B9D1F7   |
	LDA $0000,y				;$B9D1F8   |
	STA $26					;$B9D1FB   |
	INY					;$B9D1FD   |
	INY					;$B9D1FE   |
	TYA					;$B9D1FF   |
	STA $3C,x				;$B9D200   |
	PHB					;$B9D202   |
	PHK					;$B9D203   |
	PLB					;$B9D204   |
	%return(CODE_B9D20B)			;$B9D205   |
	JMP ($0026)				;$B9D208  /

CODE_B9D20B:
	PLB					;$B9D20B  \
	LDX current_sprite			;$B9D20C   |
	LDY $3C,x				;$B9D20E   |
	LDA $0000,y				;$B9D210   |
	BCS CODE_B9D21A				;$B9D213   |
	INY					;$B9D215   |
	INY					;$B9D216   |
	JMP process_anim_script			;$B9D217  /

CODE_B9D21A:
	TAY					;$B9D21A  \
	JMP process_anim_script			;$B9D21B  /

CODE_B9D21E:
	LDX current_sprite			;$B9D21E  \
	INY					;$B9D220   |
	LDA $0000,y				;$B9D221   |
	STA $26					;$B9D224   |
	INY					;$B9D226   |
	INY					;$B9D227   |
	TYA					;$B9D228   |
	STA $3C,x				;$B9D229   |
	PHB					;$B9D22B   |
	PHK					;$B9D22C   |
	PLB					;$B9D22D   |
	%return(CODE_B9D234)			;$B9D22E   |
	JMP ($0026)				;$B9D231  /

CODE_B9D234:
	PLB					;$B9D234  \
	LDX current_sprite			;$B9D235   |
	LDY $3C,x				;$B9D237   |
	LDA $0000,y				;$B9D239   |
	PLB					;$B9D23C   |
	JMP set_sprite_animation		;$B9D23D  /

CODE_B9D240:
	INY					;$B9D240  \
	LDA $0000,y				;$B9D241   |
	AND #$00FF				;$B9D244   |
	CLC					;$B9D247   |
	ADC current_sprite			;$B9D248   |
	TAX					;$B9D24A   |
	INY					;$B9D24B   |
	LDA $0000,y				;$B9D24C   |
	INY					;$B9D24F   |
	INY					;$B9D250   |
	STY $00,x				;$B9D251   |
	TAY					;$B9D253   |
	LDX current_sprite			;$B9D254   |
	JMP process_anim_script			;$B9D256  /

CODE_B9D259:
	INY					;$B9D259  \
	LDA $0000,y				;$B9D25A   |
	AND #$00FF				;$B9D25D   |
	CLC					;$B9D260   |
	ADC current_sprite			;$B9D261   |
	TAX					;$B9D263   |
	LDY $00,x				;$B9D264   |
	LDX current_sprite			;$B9D266   |
	JMP process_anim_script			;$B9D268  /

CODE_B9D26B:
	LDX current_sprite			;$B9D26B  \
	LDA $0000,y				;$B9D26D   |
	AND #$FF00				;$B9D270   |
	CLC					;$B9D273   |
	ADC $38,x				;$B9D274   |
	STA $38,x				;$B9D276   |
	BPL CODE_B9D283				;$B9D278   |
	INY					;$B9D27A   |
	INY					;$B9D27B   |
	INY					;$B9D27C   |
	INY					;$B9D27D   |
	INY					;$B9D27E   |
	INY					;$B9D27F   |
	JMP process_anim_script			;$B9D280  /

CODE_B9D283:
	LDA $0002,y				;$B9D283  \
	STA $1A,x				;$B9D286   |
	LDA.l $00006C				;$B9D288   |
	BEQ CODE_B9D29E				;$B9D28C   |
	TAX					;$B9D28E   |
	LDA.l $000593				;$B9D28F   |
	CMP current_sprite			;$B9D293   |
	BNE CODE_B9D29E				;$B9D295   |
	LDA $0004,y				;$B9D297   |
	STA $1A,x				;$B9D29A   |
	STZ $3A,x				;$B9D29C   |
CODE_B9D29E:					;	   |
	LDX current_sprite			;$B9D29E   |
	TYA					;$B9D2A0   |
	CLC					;$B9D2A1   |
	ADC #$0006				;$B9D2A2   |
	STA $3C,x				;$B9D2A5   |
	JMP CODE_B9D13D				;$B9D2A7  /

CODE_B9D2AA:
	LDX current_sprite			;$B9D2AA  \
	LDA $0000,y				;$B9D2AC   |
	AND #$FF00				;$B9D2AF   |
	CLC					;$B9D2B2   |
	ADC $38,x				;$B9D2B3   |
	STA $38,x				;$B9D2B5   |
	BPL CODE_B9D2C6				;$B9D2B7   |
	INY					;$B9D2B9   |
	INY					;$B9D2BA   |
	INY					;$B9D2BB   |
	INY					;$B9D2BC   |
	INY					;$B9D2BD   |
	INY					;$B9D2BE   |
	INY					;$B9D2BF   |
	INY					;$B9D2C0   |
	INY					;$B9D2C1   |
	INY					;$B9D2C2   |
	JMP process_anim_script			;$B9D2C3  /

CODE_B9D2C6:
	LDA $0002,y				;$B9D2C6  \
	STA $1A,x				;$B9D2C9   |
	LDA.l $00006C				;$B9D2CB   |
	BEQ CODE_B9D2F9				;$B9D2CF   |
	TAX					;$B9D2D1   |
	LDA.l $000593				;$B9D2D2   |
	CMP current_sprite			;$B9D2D6   |
	BNE CODE_B9D2F9				;$B9D2D8   |
	LDA $0006,y				;$B9D2DA   |
	CLC					;$B9D2DD   |
	ADC $000D72				;$B9D2DE   |
	STA $000D76				;$B9D2E2   |
	LDA $0008,y				;$B9D2E6   |
	CLC					;$B9D2E9   |
	ADC $000D74				;$B9D2EA   |
	STA $000D78				;$B9D2EE   |
	LDA $0004,y				;$B9D2F2   |
	STA $1A,x				;$B9D2F5   |
	STZ $3A,x				;$B9D2F7   |
CODE_B9D2F9:					;	   |
	LDX current_sprite			;$B9D2F9   |
	TYA					;$B9D2FB   |
	CLC					;$B9D2FC   |
	ADC #$000A				;$B9D2FD   |
	STA $3C,x				;$B9D300   |
	JMP CODE_B9D13D				;$B9D302  /

CODE_B9D305:
	LDX current_sprite			;$B9D305  \
	LDA $0000,y				;$B9D307   |
	AND #$FF00				;$B9D30A   |
	CLC					;$B9D30D   |
	ADC $38,x				;$B9D30E   |
	STA $38,x				;$B9D310   |
	BPL CODE_B9D31F				;$B9D312   |
	INY					;$B9D314   |
	INY					;$B9D315   |
	INY					;$B9D316   |
	INY					;$B9D317   |
	INY					;$B9D318   |
	INY					;$B9D319   |
	INY					;$B9D31A   |
	INY					;$B9D31B   |
	JMP process_anim_script			;$B9D31C  /

CODE_B9D31F:
	LDA $0002,y				;$B9D31F  \
	STA $1A,x				;$B9D322   |
	LDA.l $00006C				;$B9D324   |
	BEQ CODE_B9D34A				;$B9D328   |
	LDA.l $000593				;$B9D32A   |
	CMP current_sprite			;$B9D32E   |
	BNE CODE_B9D34A				;$B9D330   |
	LDA $0004,y				;$B9D332   |
	CLC					;$B9D335   |
	ADC $000D72				;$B9D336   |
	STA $000D76				;$B9D33A   |
	LDA $0006,y				;$B9D33E   |
	CLC					;$B9D341   |
	ADC $000D74				;$B9D342   |
	STA $000D78				;$B9D346   |
CODE_B9D34A:					;	   |
	LDX current_sprite			;$B9D34A   |
	TYA					;$B9D34C   |
	CLC					;$B9D34D   |
	ADC #$0008				;$B9D34E   |
	STA $3C,x				;$B9D351   |
	JMP CODE_B9D13D				;$B9D353  /

CODE_B9D356:
	LDA.l $00006C				;$B9D356  \
	BEQ CODE_B9D37C				;$B9D35A   |
	LDA.l $000593				;$B9D35C   |
	CMP current_sprite			;$B9D360   |
	BNE CODE_B9D37C				;$B9D362   |
	LDA $0001,y				;$B9D364   |
	CLC					;$B9D367   |
	ADC $000D72				;$B9D368   |
	STA $000D76				;$B9D36C   |
	LDA $0003,y				;$B9D370   |
	CLC					;$B9D373   |
	ADC $000D74				;$B9D374   |
	STA $000D78				;$B9D378   |
CODE_B9D37C:					;	   |
	LDX current_sprite			;$B9D37C   |
	TYA					;$B9D37E   |
	CLC					;$B9D37F   |
	ADC #$0005				;$B9D380   |
	TAY					;$B9D383   |
	JMP process_anim_script			;$B9D384  /

CODE_B9D387:
	LDX current_sprite			;$B9D387  \
	LDA $0000,y				;$B9D389   |
	AND #$FF00				;$B9D38C   |
	CLC					;$B9D38F   |
	ADC $38,x				;$B9D390   |
	STA $38,x				;$B9D392   |
	BPL CODE_B9D39F				;$B9D394   |
	INY					;$B9D396   |
	INY					;$B9D397   |
	INY					;$B9D398   |
	INY					;$B9D399   |
	INY					;$B9D39A   |
	INY					;$B9D39B   |
	JMP process_anim_script			;$B9D39C  /

CODE_B9D39F:
	LDA $0002,y				;$B9D39F  \
	STA $1A,x				;$B9D3A2   |
	LDA.l $000D7A				;$B9D3A4   |
	BEQ CODE_B9D3BE				;$B9D3A8   |
	LDA.l $000593				;$B9D3AA   |
	CMP current_sprite			;$B9D3AE   |
	BNE CODE_B9D3BE				;$B9D3B0   |
	LDA.l $000D7A				;$B9D3B2   |
	TAX					;$B9D3B6   |
	LDA $0004,y				;$B9D3B7   |
	STA $1A,x				;$B9D3BA   |
	STZ $3A,x				;$B9D3BC   |
CODE_B9D3BE:					;	   |
	LDX current_sprite			;$B9D3BE   |
	TYA					;$B9D3C0   |
	CLC					;$B9D3C1   |
	ADC #$0006				;$B9D3C2   |
	STA $3C,x				;$B9D3C5   |
	JMP CODE_B9D13D				;$B9D3C7  /

CODE_B9D3CA:
	LDX current_sprite			;$B9D3CA  \
	LDA $0000,y				;$B9D3CC   |
	AND #$FF00				;$B9D3CF   |
	CLC					;$B9D3D2   |
	ADC $38,x				;$B9D3D3   |
	STA $38,x				;$B9D3D5   |
	BPL CODE_B9D3DF				;$B9D3D7   |
if !version == 0				;	   |
	INY					;$B9D3D8   |
	INY					;$B9D3D9   |
	INY					;$B9D3DA   |
	INY					;$B9D3DB   |
	INY					;$B9D3DC   |
	INY					;$B9D3DD   |
	INY					;$B9D3DE   |
	INY					;$B9D3DF   |
	INY					;$B9D3E0   |
	INY					;$B9D3E1   |
else						;	   |
	JSR CODE_B9D3E7				;$B9D3D9   |
endif						;	   |
	JMP process_anim_script			;$B9D3DC  /

CODE_B9D3DF:					;	  \
if !version == 1				;	   |
	JSR CODE_B9D3E7				;$B9D3DF   |
	STA $3C,x				;$B9D3E2   |
	JMP CODE_B9D13D				;$B9D3E4   |
endif						;	  /

CODE_B9D3E7:					;	  \
	LDA $0002,y				;$B9D3E7   |
	STA $1A,x				;$B9D3EA   |
	LDA.l $000D7A				;$B9D3EC   |
	BEQ CODE_B9D414				;$B9D3F0   |
	LDA.l $000593				;$B9D3F2   |
	CMP current_sprite			;$B9D3F6   |
	BNE CODE_B9D414				;$B9D3F8   |
	LDA.l $000D7A				;$B9D3FA   |
	TAX					;$B9D3FE   |
	LDA $0004,y				;$B9D3FF   |
	STA $1A,x				;$B9D402   |
	STZ $3A,x				;$B9D404   |
	LDA $0006,y				;$B9D406   |
	STA $000D7C				;$B9D409   |
	LDA $0008,y				;$B9D40D   |
	STA $000D7E				;$B9D410   |
CODE_B9D414:					;	   |
	LDX current_sprite			;$B9D414   |
	TYA					;$B9D416   |
	CLC					;$B9D417   |
	ADC #$000A				;$B9D418   |
if !version == 0				;	   |
	STA $3C,x				;$B9D41B   |
	JMP CODE_B9D13D				;$B9D41D   |
else						;	   |
	TAY					;$B9D41B   |
	RTS					;$B9D41C  /
endif

CODE_B9D41D:
	LDX current_sprite			;$B9D41D  \
	LDA $0000,y				;$B9D41F   |
	AND #$FF00				;$B9D422   |
	CLC					;$B9D425   |
	ADC $38,x				;$B9D426   |
	STA $38,x				;$B9D428   |
	BPL CODE_B9D437				;$B9D42A   |
	INY					;$B9D42C   |
	INY					;$B9D42D   |
	INY					;$B9D42E   |
	INY					;$B9D42F   |
	INY					;$B9D430   |
	INY					;$B9D431   |
	INY					;$B9D432   |
	INY					;$B9D433   |
	JMP process_anim_script			;$B9D434  /

CODE_B9D437:
	LDA $0002,y				;$B9D437  \
	STA $1A,x				;$B9D43A   |
	LDA.l $000D7A				;$B9D43C   |
	BEQ CODE_B9D458				;$B9D440   |
	LDA.l $000593				;$B9D442   |
	CMP current_sprite			;$B9D446   |
	BNE CODE_B9D458				;$B9D448   |
	LDA $0004,y				;$B9D44A   |
	STA $000D7C				;$B9D44D   |
	LDA $0006,y				;$B9D451   |
	STA $000D7E				;$B9D454   |
CODE_B9D458:					;	   |
	LDX current_sprite			;$B9D458   |
	TYA					;$B9D45A   |
	CLC					;$B9D45B   |
	ADC #$0008				;$B9D45C   |
	STA $3C,x				;$B9D45F   |
	JMP CODE_B9D13D				;$B9D461  /

CODE_B9D464:
	LDA.l $000D7A				;$B9D464  \
	BEQ CODE_B9D480				;$B9D468   |
	LDA.l $000593				;$B9D46A   |
	CMP current_sprite			;$B9D46E   |
	BNE CODE_B9D480				;$B9D470   |
	LDA $0001,y				;$B9D472   |
	STA $000D7C				;$B9D475   |
	LDA $0003,y				;$B9D479   |
	STA $000D7E				;$B9D47C   |
CODE_B9D480:					;	   |
	LDX current_sprite			;$B9D480   |
	TYA					;$B9D482   |
	CLC					;$B9D483   |
	ADC #$0005				;$B9D484   |
	TAY					;$B9D487   |
	JMP process_anim_script			;$B9D488  /

CODE_B9D48B:
	LDX current_sprite			;$B9D48B  \
	LDA $0000,y				;$B9D48D   |
	AND #$FF00				;$B9D490   |
	CLC					;$B9D493   |
	ADC $38,x				;$B9D494   |
	STA $38,x				;$B9D496   |
	BPL CODE_B9D4A5				;$B9D498   |
	INY					;$B9D49A   |
	INY					;$B9D49B   |
	INY					;$B9D49C   |
	INY					;$B9D49D   |
	INY					;$B9D49E   |
	INY					;$B9D49F   |
	INY					;$B9D4A0   |
	INY					;$B9D4A1   |
	JMP process_anim_script			;$B9D4A2  /

CODE_B9D4A5:
	LDA $0002,y				;$B9D4A5  \
	STA $1A,x				;$B9D4A8   |
	LDA $42,x				;$B9D4AA   |
	BEQ CODE_B9D4BB				;$B9D4AC   |
	TAX					;$B9D4AE   |
	LDA $0004,y				;$B9D4AF   |
	STA $1A,x				;$B9D4B2   |
	LDA $0006,y				;$B9D4B4   |
	STA $44,x				;$B9D4B7   |
	LDX current_sprite			;$B9D4B9   |
CODE_B9D4BB:					;	   |
	TYA					;$B9D4BB   |
	CLC					;$B9D4BC   |
	ADC #$0008				;$B9D4BD   |
	STA $3C,x				;$B9D4C0   |
	JMP CODE_B9D13D				;$B9D4C2  /

DATA_B9D4C5:
	dw CODE_B9D160
	dw CODE_B9D172
	dw CODE_B9D19B
	dw CODE_B9D1A5
	dw CODE_B9D1B5
	dw CODE_B9D26B
	dw CODE_B9D2AA
	dw CODE_B9D305
	dw CODE_B9D356
	dw CODE_B9D387
	dw CODE_B9D3CA
	dw CODE_B9D41D
	dw CODE_B9D464
	dw CODE_B9D48B
	dw CODE_B9D1C2
	dw CODE_B9D1F5
	dw CODE_B9D21E
	dw CODE_B9D240
	dw CODE_B9D259
	dw CODE_B9D1D5
	dw CODE_B9D160

CODE_B9D4EF:
	LDA.l $000515				;$B9D4EF   |
	CMP #$0003				;$B9D4F3   |
	BNE CODE_B9D4FB				;$B9D4F6   |
	JMP CODE_B9D12B				;$B9D4F8  /

CODE_B9D4FB:
	JMP process_anim_script			;$B9D4FB  /

CODE_B9D4FE:
	LDA $4E,x				;$B9D4FE  \
	AND #$0003				;$B9D500   |
	CMP #$0003				;$B9D503   |
	BEQ CODE_B9D50B				;$B9D506   |
	JMP CODE_B9D12B				;$B9D508  /

CODE_B9D50B:
	JMP process_anim_script			;$B9D50B  /

CODE_B9D50E:
	LDA.l $000593				;$B9D50E  \
	TAX					;$B9D512   |
	LDA $24,x				;$B9D513   |
	BPL CODE_B9D51C				;$B9D515   |
	LDX current_sprite			;$B9D517   |
	JMP CODE_B9D12B				;$B9D519  /

CODE_B9D51C:
	LDX current_sprite			;$B9D51C  \
	JMP process_anim_script			;$B9D51E  /

CODE_B9D521:
	LDA $2E,x				;$B9D521  \
	CMP #$002C				;$B9D523   |
	BNE CODE_B9D52B				;$B9D526   |
	JMP CODE_B9D12B				;$B9D528  /

CODE_B9D52B:
	JMP process_anim_script			;$B9D52B  /

CODE_B9D52E:
	LDA.l $000593				;$B9D52E  \
	TAX					;$B9D532   |
	LDA $24,x				;$B9D533   |
	BMI CODE_B9D53C				;$B9D535   |
	LDX current_sprite			;$B9D537   |
	JMP CODE_B9D12B				;$B9D539  /

CODE_B9D53C:
	LDX current_sprite			;$B9D53C  \
	JMP process_anim_script			;$B9D53E  /

CODE_B9D541:
	LDA $1E,x				;$B9D541  \
	AND #$0101				;$B9D543   |
	BNE CODE_B9D557				;$B9D546   |
	LDA $0A,x				;$B9D548   |
	SEC					;$B9D54A   |
	SBC $0017C0				;$B9D54B   |
	CMP #$00F0				;$B9D54F   |
	BPL CODE_B9D557				;$B9D552   |
	JMP CODE_B9D12B				;$B9D554  /

CODE_B9D557:
	JMP process_anim_script			;$B9D557  /

CODE_B9D55A:
	LDA $24,x				;$B9D55A  \
	BPL CODE_B9D561				;$B9D55C   |
	JMP CODE_B9D12B				;$B9D55E  /

CODE_B9D561:
	JMP process_anim_script			;$B9D561  /

CODE_B9D564:
	LDA $24,x				;$B9D564  \
	BMI CODE_B9D56B				;$B9D566   |
	JMP CODE_B9D12B				;$B9D568  /

CODE_B9D56B:
	JMP process_anim_script			;$B9D56B  /

CODE_B9D56E:
	LDA $1E,x				;$B9D56E  \
	AND #$1000				;$B9D570   |
	BNE CODE_B9D586				;$B9D573   |
	LDA $0C,x				;$B9D575   |
	BMI CODE_B9D583				;$B9D577   |
	SEC					;$B9D579   |
	SBC $0A,x				;$B9D57A   |
	BMI CODE_B9D586				;$B9D57C   |
	CMP #$0048				;$B9D57E   |
	BMI CODE_B9D586				;$B9D581   |
CODE_B9D583:					;	   |
	JMP CODE_B9D12B				;$B9D583  /

CODE_B9D586:
	JMP process_anim_script			;$B9D586  /

CODE_B9D589:
	LDA $1E,x				;$B9D589  \
	AND #$1000				;$B9D58B   |
	BNE CODE_B9D5A1				;$B9D58E   |
	LDA $0C,x				;$B9D590   |
	BMI CODE_B9D59E				;$B9D592   |
	SEC					;$B9D594   |
	SBC $0A,x				;$B9D595   |
	BMI CODE_B9D5A1				;$B9D597   |
	CMP #$0010				;$B9D599   |
	BMI CODE_B9D5A1				;$B9D59C   |
CODE_B9D59E:					;	   |
	JMP CODE_B9D12B				;$B9D59E  /

CODE_B9D5A1:
	JMP process_anim_script			;$B9D5A1  /

CODE_B9D5A4:
	LDA $1E,x				;$B9D5A4  \
	AND #$0001				;$B9D5A6   |
	BNE CODE_B9D5AE				;$B9D5A9   |
	JMP CODE_B9D12B				;$B9D5AB  /

CODE_B9D5AE:
	JMP process_anim_script			;$B9D5AE  /

CODE_B9D5B1:
	LDA $1E,x				;$B9D5B1  \
	AND #$0001				;$B9D5B3   |
	BEQ CODE_B9D5C3				;$B9D5B6   |
	LDA $10,x				;$B9D5B8   |
	AND #$0007				;$B9D5BA   |
	CMP $000088				;$B9D5BD   |
	BNE CODE_B9D5C6				;$B9D5C1   |
CODE_B9D5C3:					;	   |
	JMP CODE_B9D12B				;$B9D5C3  /

CODE_B9D5C6:
	JMP process_anim_script			;$B9D5C6  /

CODE_B9D5C9:
	LDA $20,x				;$B9D5C9  \
	BEQ CODE_B9D5D0				;$B9D5CB   |
	JMP CODE_B9D12B				;$B9D5CD  /

CODE_B9D5D0:
	JMP process_anim_script			;$B9D5D0  /

CODE_B9D5D3:
	LDA.l $000593				;$B9D5D3  \
	TAX					;$B9D5D7   |
	LDA $26,x				;$B9D5D8   |
	BNE CODE_B9D5E1				;$B9D5DA   |
CODE_B9D5DC:					;	   |
	LDX current_sprite			;$B9D5DC   |
	JMP CODE_B9D12B				;$B9D5DE  /

CODE_B9D5E1:
	LDA $20,x				;$B9D5E1  \
	BPL CODE_B9D5E9				;$B9D5E3   |
	EOR #$FFFF				;$B9D5E5   |
	INC A					;$B9D5E8   |
CODE_B9D5E9:					;	   |
	CMP #$0180				;$B9D5E9   |
	BMI CODE_B9D5DC				;$B9D5EC   |
	LDX current_sprite			;$B9D5EE   |
	JMP process_anim_script			;$B9D5F0  /

CODE_B9D5F3:
	LDA.l $000515				;$B9D5F3  \
	CMP #$0003				;$B9D5F7   |
	BNE CODE_B9D5FE				;$B9D5FA   |
	CLC					;$B9D5FC   |
	RTS					;$B9D5FD  /

CODE_B9D5FE:
	SEC					;$B9D5FE  \
	RTS					;$B9D5FF  /

CODE_B9D600:
	LDA.l $000515				;$B9D600  \
	CMP #$0002				;$B9D604   |
	BEQ CODE_B9D614				;$B9D607   |
	CMP #$0001				;$B9D609   |
	BNE CODE_B9D616				;$B9D60C   |
	LDA.l $00052D				;$B9D60E   |
	BEQ CODE_B9D616				;$B9D612   |
CODE_B9D614:					;	   |
	CLC					;$B9D614   |
	RTS					;$B9D615  /

CODE_B9D616:
	SEC					;$B9D616  \
	RTS					;$B9D617  /

CODE_B9D618:
	LDA.l $000B02				;$B9D618  \
	AND #$0040				;$B9D61C   |
	BEQ CODE_B9D623				;$B9D61F   |
	CLC					;$B9D621   |
	RTS					;$B9D622  /

CODE_B9D623:
	SEC					;$B9D623  \
	RTS					;$B9D624  /

CODE_B9D625:
	LDA.l $00006C				;$B9D625  \
	BNE CODE_B9D62D				;$B9D629   |
	SEC					;$B9D62B   |
	RTS					;$B9D62C  /

CODE_B9D62D:
	CLC					;$B9D62D  \
	RTS					;$B9D62E  /

CODE_B9D62F:
	LDA.l $0008A4				;$B9D62F  \
	BNE CODE_B9D637				;$B9D633   |
	SEC					;$B9D635   |
	RTS					;$B9D636  /

CODE_B9D637:
	CLC					;$B9D637  \
	RTS					;$B9D638  /

CODE_B9D639:
	LDA.l $000593				;$B9D639  \
	TAX					;$B9D63D   |
	LDA $26,x				;$B9D63E   |
	BNE CODE_B9D644				;$B9D640   |
	SEC					;$B9D642   |
	RTS					;$B9D643  /

CODE_B9D644:
	CLC					;$B9D644  \
	RTS					;$B9D645  /

CODE_B9D646:
	LDA $0C,x				;$B9D646  \
	BMI CODE_B9D656				;$B9D648   |
	SEC					;$B9D64A   |
	SBC $0A,x				;$B9D64B   |
	BMI CODE_B9D654				;$B9D64D   |
	CMP #$0030				;$B9D64F   |
	BPL CODE_B9D656				;$B9D652   |
CODE_B9D654:					;	   |
	CLC					;$B9D654   |
	RTS					;$B9D655  /

CODE_B9D656:
	SEC					;$B9D656  \
	RTS					;$B9D657  /

CODE_B9D658:
	PHY					;$B9D658  \
	LDY $66					;$B9D659   |
	LDA $0004,y				;$B9D65B   |
	AND #$4000				;$B9D65E   |
	BEQ CODE_B9D671				;$B9D661   |
	LDA global_frame_counter		;$B9D663   |
	SEC					;$B9D665   |
	SBC $001A,y				;$B9D666   |
	CMP #$0015				;$B9D669   |
	BMI CODE_B9D671				;$B9D66C   |
	PLY					;$B9D66E   |
	SEC					;$B9D66F   |
	RTS					;$B9D670  /

CODE_B9D671:
	PLY					;$B9D671  \
	CLC					;$B9D672   |
	RTS					;$B9D673  /

CODE_B9D674:
	LDA $1E,x				;$B9D674  \
	AND #$1001				;$B9D676   |
	BNE CODE_B9D67D				;$B9D679   |
	CLC					;$B9D67B   |
	RTS					;$B9D67C  /

CODE_B9D67D:
	SEC					;$B9D67D  \
	RTS					;$B9D67E  /

CODE_B9D67F:
	LDA.l $0019C4				;$B9D67F  \
	TAX					;$B9D683   |
	LDA $46,x				;$B9D684   |
	BEQ CODE_B9D68A				;$B9D686   |
	CLC					;$B9D688   |
	RTS					;$B9D689  /

CODE_B9D68A:
	SEC					;$B9D68A  \
	RTS					;$B9D68B  /

CODE_B9D68C:
	LDA $1E,x				;$B9D68C  \
	AND #$1000				;$B9D68E   |
	BNE CODE_B9D6A3				;$B9D691   |
	LDA $0C,x				;$B9D693   |
	BMI CODE_B9D6A1				;$B9D695   |
	SEC					;$B9D697   |
	SBC $0A,x				;$B9D698   |
	BMI CODE_B9D6A3				;$B9D69A   |
	CMP #$0048				;$B9D69C   |
	BMI CODE_B9D6A3				;$B9D69F   |
CODE_B9D6A1:					;	   |
	CLC					;$B9D6A1   |
	RTS					;$B9D6A2  /

CODE_B9D6A3:
	SEC					;$B9D6A3  \
	RTS					;$B9D6A4  /

CODE_B9D6A5:
	LDA $1E,x				;$B9D6A5  \
	AND #$1001				;$B9D6A7   |
	BNE CODE_B9D6AE				;$B9D6AA   |
	SEC					;$B9D6AC   |
	RTS					;$B9D6AD  /

CODE_B9D6AE:
	CLC					;$B9D6AE  \
	RTS					;$B9D6AF  /

CODE_B9D6B0:
	LDX current_sprite			;$B9D6B0  \
	LDA $24,x				;$B9D6B2   |
	BMI CODE_B9D6B8				;$B9D6B4   |
	SEC					;$B9D6B6   |
	RTS					;$B9D6B7  /

CODE_B9D6B8:
	CLC					;$B9D6B8  \
	RTS					;$B9D6B9  /

CODE_B9D6BA:
	LDX current_sprite			;$B9D6BA  \
	LDA $26,x				;$B9D6BC   |
	BEQ CODE_B9D6C2				;$B9D6BE   |
CODE_B9D6C0:					;	   |
	SEC					;$B9D6C0   |
	RTS					;$B9D6C1  /

CODE_B9D6C2:
	LDA $20,x				;$B9D6C2  \
	BPL CODE_B9D6CA				;$B9D6C4   |
	EOR #$FFFF				;$B9D6C6   |
	INC A					;$B9D6C9   |
CODE_B9D6CA:					;	   |
	AND #$FFC0				;$B9D6CA   |
	BNE CODE_B9D6C0				;$B9D6CD   |
	CLC					;$B9D6CF   |
	RTS					;$B9D6D0  /

CODE_B9D6D1:
	LDY $66					;$B9D6D1  \
	LDA $000C,y				;$B9D6D3   |
	AND #$0001				;$B9D6D6   |
	BNE CODE_B9D6DD				;$B9D6D9   |
	SEC					;$B9D6DB   |
	RTS					;$B9D6DC  /

CODE_B9D6DD:
	CLC					;$B9D6DD  \
	RTS					;$B9D6DE  /

CODE_B9D6DF:
	LDX current_sprite			;$B9D6DF  \
	LDA $20,x				;$B9D6E1   |
	BPL CODE_B9D6E9				;$B9D6E3   |
	EOR #$FFFF				;$B9D6E5   |
	INC A					;$B9D6E8   |
CODE_B9D6E9:					;	   |
	CMP #$0201				;$B9D6E9   |
	BPL CODE_B9D6F0				;$B9D6EC   |
	CLC					;$B9D6EE   |
	RTS					;$B9D6EF  /

CODE_B9D6F0:
	SEC					;$B9D6F0  \
	RTS					;$B9D6F1  /

CODE_B9D6F2:
	LDX current_sprite			;$B9D6F2  \
	LDA $20,x				;$B9D6F4   |
	BPL CODE_B9D6FC				;$B9D6F6   |
	EOR #$FFFF				;$B9D6F8   |
	INC A					;$B9D6FB   |
CODE_B9D6FC:					;	   |
	CMP #$00C0				;$B9D6FC   |
	BPL CODE_B9D703				;$B9D6FF   |
	CLC					;$B9D701   |
	RTS					;$B9D702  /

CODE_B9D703:
	SEC					;$B9D703  \
	RTS					;$B9D704  /

CODE_B9D705:
	LDX current_sprite			;$B9D705  \
	CPX $0597				;$B9D707   |
	BEQ CODE_B9D724				;$B9D70A   |
	LDA $0D7A				;$B9D70C   |
	BNE CODE_B9D74E				;$B9D70F   |
	LDA $6E					;$B9D711   |
	BNE CODE_B9D72D				;$B9D713   |
	LDA $08C2				;$B9D715   |
	BMI CODE_B9D726				;$B9D718   |
	STZ $2E,x				;$B9D71A   |
CODE_B9D71C:					;	   |
	LDA #$0001				;$B9D71C   |
	JSL CODE_B9D0B8				;$B9D71F   |
	RTS					;$B9D723  /

CODE_B9D724:
	BRA CODE_B9D71C				;$B9D724  /

CODE_B9D726:
	LDA #$001D				;$B9D726  \
	STA $2E,x				;$B9D729   |
	BRA CODE_B9D71C				;$B9D72B  /

CODE_B9D72D:
	CMP #$0198				;$B9D72D  \
	BEQ CODE_B9D744				;$B9D730   |
	CMP #$01A0				;$B9D732   |
	BEQ CODE_B9D749				;$B9D735   |
	LDA #$0009				;$B9D737   |
CODE_B9D73A:					;	   |
	STA $2E,x				;$B9D73A   |
	LDA #$005E				;$B9D73C   |
	JSL CODE_B9D08C				;$B9D73F   |
	RTS					;$B9D743  /

CODE_B9D744:
	LDA #$0010				;$B9D744  \
	BRA CODE_B9D73A				;$B9D747  /

CODE_B9D749:
	LDA #$0050				;$B9D749  \
	BRA CODE_B9D73A				;$B9D74C  /

CODE_B9D74E:
	CMP $0597				;$B9D74E  \
	BEQ CODE_B9D760				;$B9D751   |
	LDA #$000C				;$B9D753   |
	STA $2E,x				;$B9D756   |
	LDA #$0010				;$B9D758   |
	JSL CODE_B9D0B8				;$B9D75B   |
	RTS					;$B9D75F  /

CODE_B9D760:
	LDA #$0017				;$B9D760  \
	STA $2E,x				;$B9D763   |
	LDA #$001D				;$B9D765   |
	JSL CODE_B9D0B8				;$B9D768   |
	RTS					;$B9D76C  /

CODE_B9D76D:
	LDX current_sprite			;$B9D76D  \
	CPX $0597				;$B9D76F   |
	BEQ CODE_B9D78C				;$B9D772   |
	LDA $0D7A				;$B9D774   |
	BNE CODE_B9D7C7				;$B9D777   |
	LDA $6E					;$B9D779   |
	BNE CODE_B9D7A6				;$B9D77B   |
	LDA $08C2				;$B9D77D   |
	BMI CODE_B9D79F				;$B9D780   |
	STZ $2E,x				;$B9D782   |
CODE_B9D784:					;	   |
	LDA #$0003				;$B9D784   |
	JSL CODE_B9D0B8				;$B9D787   |
	RTS					;$B9D78B  /

CODE_B9D78C:
	LDA $08C2				;$B9D78C  \
	BMI CODE_B9D798				;$B9D78F   |
	LDA #$0022				;$B9D791   |
	STA $2E,x				;$B9D794   |
	BRA CODE_B9D784				;$B9D796  /

CODE_B9D798:
	LDA #$001E				;$B9D798  \
	STA $2E,x				;$B9D79B   |
	BRA CODE_B9D784				;$B9D79D  /

CODE_B9D79F:
	LDA #$001D				;$B9D79F  \
	STA $2E,x				;$B9D7A2   |
	BRA CODE_B9D784				;$B9D7A4  /

CODE_B9D7A6:
	CMP #$0198				;$B9D7A6  \
	BEQ CODE_B9D7BD				;$B9D7A9   |
	CMP #$01A0				;$B9D7AB   |
	BEQ CODE_B9D7C2				;$B9D7AE   |
	LDA #$0009				;$B9D7B0   |
CODE_B9D7B3:					;	   |
	STA $2E,x				;$B9D7B3   |
	LDA #$0068				;$B9D7B5   |
	JSL CODE_B9D08C				;$B9D7B8   |
	RTS					;$B9D7BC  /

CODE_B9D7BD:
	LDA #$0010				;$B9D7BD  \
	BRA CODE_B9D7B3				;$B9D7C0  /

CODE_B9D7C2:
	LDA #$0050				;$B9D7C2  \
	BRA CODE_B9D7B3				;$B9D7C5  /

CODE_B9D7C7:
	CMP $0597				;$B9D7C7  \
	BEQ CODE_B9D7D9				;$B9D7CA   |
	LDA #$000C				;$B9D7CC   |
	STA $2E,x				;$B9D7CF   |
	LDA #$0011				;$B9D7D1   |
	JSL CODE_B9D0B8				;$B9D7D4   |
	RTS					;$B9D7D8  /

CODE_B9D7D9:
	LDA #$0017				;$B9D7D9  \
	STA $2E,x				;$B9D7DC   |
	LDA #$001F				;$B9D7DE   |
	JSL CODE_B9D0B8				;$B9D7E1   |
	RTS					;$B9D7E5  /

CODE_B9D7E6:
	LDX current_sprite			;$B9D7E6  \
	CPX $0597				;$B9D7E8   |
	BEQ CODE_B9D80C				;$B9D7EB   |
	LDA $0D7A				;$B9D7ED   |
	BNE CODE_B9D834				;$B9D7F0   |
	LDA $6E					;$B9D7F2   |
	BNE CODE_B9D813				;$B9D7F4   |
	LDA $08C2				;$B9D7F6   |
	BMI CODE_B9D805				;$B9D7F9   |
	STZ $2E,x				;$B9D7FB   |
CODE_B9D7FD:					;	   |
	LDA #$0004				;$B9D7FD   |
	JSL CODE_B9D0B8				;$B9D800   |
	RTS					;$B9D804  /

CODE_B9D805:
	LDA #$001D				;$B9D805  \
	STA $2E,x				;$B9D808   |
	BRA CODE_B9D7FD				;$B9D80A  /

CODE_B9D80C:
	LDA #$0022				;$B9D80C  \
	STA $2E,x				;$B9D80F   |
	BRA CODE_B9D7FD				;$B9D811  /

CODE_B9D813:
	CMP #$0198				;$B9D813  \
	BEQ CODE_B9D82A				;$B9D816   |
	CMP #$01A0				;$B9D818   |
	BEQ CODE_B9D82F				;$B9D81B   |
	LDA #$0009				;$B9D81D   |
CODE_B9D820:					;	   |
	STA $2E,x				;$B9D820   |
	LDA #$0068				;$B9D822   |
	JSL CODE_B9D08C				;$B9D825   |
	RTS					;$B9D829  /

CODE_B9D82A:
	LDA #$0010				;$B9D82A  \
	BRA CODE_B9D820				;$B9D82D  /

CODE_B9D82F:
	LDA #$0050				;$B9D82F  \
	BRA CODE_B9D820				;$B9D832  /

CODE_B9D834:
	CMP $0597				;$B9D834  \
	BEQ CODE_B9D846				;$B9D837   |
	LDA #$000C				;$B9D839   |
	STA $2E,x				;$B9D83C   |
	LDA #$0011				;$B9D83E   |
	JSL CODE_B9D0B8				;$B9D841   |
	RTS					;$B9D845  /

CODE_B9D846:
	LDA #$0017				;$B9D846  \
	STA $2E,x				;$B9D849   |
	LDA #$001F				;$B9D84B   |
	JSL CODE_B9D0B8				;$B9D84E   |
	RTS					;$B9D852  /

CODE_B9D853:
	CPX $0597				;$B9D853  \
	BEQ CODE_B9D85C				;$B9D856   |
	JSL CODE_B8B9B8				;$B9D858   |
CODE_B9D85C:					;	   |
	RTS					;$B9D85C  /

CODE_B9D85D:
	LDA $0515				;$B9D85D  \
	CMP #$0003				;$B9D860   |
	BNE CODE_B9D86A				;$B9D863   |
	JSL CODE_B8A695				;$B9D865   |
	RTS					;$B9D869  /

CODE_B9D86A:
	RTS					;$B9D86A  /

CODE_B9D86B:
	LDA $0D7A				;$B9D86B  \
	BEQ CODE_B9D871				;$B9D86E   |
	RTS					;$B9D870  /

CODE_B9D871:
	LDY #$0004				;$B9D871  \
	JSL CODE_BB842C				;$B9D874   |
	BCS CODE_B9D87F				;$B9D878   |
	LDA alternate_sprite			;$B9D87A   |
	STA $0D7A				;$B9D87C   |
CODE_B9D87F:					;	   |
	RTS					;$B9D87F  /

CODE_B9D880:
	LDY #$001E				;$B9D880  \
	JSL CODE_BB842C				;$B9D883   |
	RTS					;$B9D887  /

CODE_B9D888:
	LDA #$0001				;$B9D888  \
	STA $42,x				;$B9D88B   |
	RTS					;$B9D88D  /

CODE_B9D88E:
	STZ $42,x				;$B9D88E  \
	RTS					;$B9D890  /

CODE_B9D891:
	STZ $20,x				;$B9D891  \
	STZ $26,x				;$B9D893   |
	RTS					;$B9D895  /

CODE_B9D896:
	LDY $0D7A				;$B9D896  \
	BEQ CODE_B9D8A1				;$B9D899   |
	LDA #$0001				;$B9D89B   |
	STA $0032,y				;$B9D89E   |
CODE_B9D8A1:					;	   |
	TYX					;$B9D8A1   |
	JSL CODE_B8D4AE				;$B9D8A2   |
	STZ $0D7A				;$B9D8A6   |
	RTS					;$B9D8A9  /

CODE_B9D8AA:
	LDX $0D7A				;$B9D8AA  \
	BEQ CODE_B9D8BB				;$B9D8AD   |
	LDA #$0002				;$B9D8AF   |
	STA $32,x				;$B9D8B2   |
	LDX current_sprite			;$B9D8B4   |
	LDA #$000F				;$B9D8B6   |
	STA $2E,x				;$B9D8B9   |
CODE_B9D8BB:					;	   |
	RTS					;$B9D8BB  /

CODE_B9D8BC:
	LDY $0D7A				;$B9D8BC  \
	BEQ CODE_B9D91B				;$B9D8BF   |
	LDX $66					;$B9D8C1   |
	LDA $04,x				;$B9D8C3   |
	AND #$0800				;$B9D8C5   |
	BEQ CODE_B9D91C				;$B9D8C8   |
	LDX current_sprite			;$B9D8CA   |
	LDA #$002C				;$B9D8CC   |
	STA $2E,x				;$B9D8CF   |
	LDA #$0010				;$B9D8D1   |
	ORA $0030,y				;$B9D8D4   |
	STA $0030,y				;$B9D8D7   |
	LDA #$002B				;$B9D8DA   |
	STA $002E,y				;$B9D8DD   |
	LDA #$0008				;$B9D8E0   |
	ORA $0030,y				;$B9D8E3   |
	STA $0030,y				;$B9D8E6   |
	LDY #$0040				;$B9D8E9   |
	LDA [$8E],y				;$B9D8EC   |
	LDY $0D7A				;$B9D8EE   |
	BIT $12,x				;$B9D8F1   |
	BVC CODE_B9D8F9				;$B9D8F3   |
	EOR #$FFFF				;$B9D8F5   |
	INC A					;$B9D8F8   |
CODE_B9D8F9:					;	   |
	STA $0020,y				;$B9D8F9   |
	LDA #$0000				;$B9D8FC   |
	STA $0026,y				;$B9D8FF   |
	LDY #$0042				;$B9D902   |
	LDA [$8E],y				;$B9D905   |
	LDY $0D7A				;$B9D907   |
	STA $0024,y				;$B9D90A   |
	LDA #$0000				;$B9D90D   |
	STA $001E,y				;$B9D910   |
	TYX					;$B9D913   |
	JSL CODE_B8D4AE				;$B9D914   |
	STZ $0D7A				;$B9D918   |
CODE_B9D91B:					;	   |
	RTS					;$B9D91B  /

CODE_B9D91C:
	LDX current_sprite			;$B9D91C  \
	LDA #$0020				;$B9D91E   |
	STA $2E,x				;$B9D921   |
	LDA #$001F				;$B9D923   |
	STA $002E,y				;$B9D926   |
	LDA #$0010				;$B9D929   |
	ORA $0030,y				;$B9D92C   |
	STA $0030,y				;$B9D92F   |
	LDY #$003C				;$B9D932   |
	LDA [$8E],y				;$B9D935   |
	LDY $0D7A				;$B9D937   |
	BIT $12,x				;$B9D93A   |
	BVC CODE_B9D942				;$B9D93C   |
	EOR #$FFFF				;$B9D93E   |
	INC A					;$B9D941   |
CODE_B9D942:					;	   |
	STA $0020,y				;$B9D942   |
	LDA #$0000				;$B9D945   |
	STA $0026,y				;$B9D948   |
	LDY #$003E				;$B9D94B   |
	LDA [$8E],y				;$B9D94E   |
	LDY $0D7A				;$B9D950   |
	STA $0024,y				;$B9D953   |
	LDA #$0000				;$B9D956   |
	STA $001E,y				;$B9D959   |
	TYX					;$B9D95C   |
	JSL CODE_B8D4AE				;$B9D95D   |
	STZ $0D7A				;$B9D961   |
	RTS					;$B9D964  /

CODE_B9D965:
	LDA #$003F				;$B9D965  \
	STA $2E,x				;$B9D968   |
	LDY $0D7A				;$B9D96A   |
	BEQ CODE_B9D9AE				;$B9D96D   |
	LDX $66					;$B9D96F   |
	LDA $04,x				;$B9D971   |
	AND #$0800				;$B9D973   |
	BEQ CODE_B9D9AF				;$B9D976   |
	LDX current_sprite			;$B9D978   |
	LDA #$0006				;$B9D97A   |
	STA $0032,y				;$B9D97D   |
	LDY #$0038				;$B9D980   |
	LDA [$8E],y				;$B9D983   |
	LDY $0D7A				;$B9D985   |
	BIT $12,x				;$B9D988   |
	BVC CODE_B9D990				;$B9D98A   |
	EOR #$FFFF				;$B9D98C   |
	INC A					;$B9D98F   |
CODE_B9D990:					;	   |
	STA $0020,y				;$B9D990   |
	STA $0026,y				;$B9D993   |
	PHY					;$B9D996   |
	LDY #$003A				;$B9D997   |
	LDA [$8E],y				;$B9D99A   |
	PLY					;$B9D99C   |
	STA $0024,y				;$B9D99D   |
	LDA #$0000				;$B9D9A0   |
	STA $001E,y				;$B9D9A3   |
	TYX					;$B9D9A6   |
	JSL CODE_B8D4AE				;$B9D9A7   |
	STZ $0D7A				;$B9D9AB   |
CODE_B9D9AE:					;	   |
	RTS					;$B9D9AE  /

CODE_B9D9AF:
	LDX current_sprite			;$B9D9AF  \
	LDA #$0004				;$B9D9B1   |
	STA $0032,y				;$B9D9B4   |
	LDY #$0034				;$B9D9B7   |
	LDA [$8E],y				;$B9D9BA   |
	LDY $0D7A				;$B9D9BC   |
	BIT $12,x				;$B9D9BF   |
	BVC CODE_B9D9C7				;$B9D9C1   |
	EOR #$FFFF				;$B9D9C3   |
	INC A					;$B9D9C6   |
CODE_B9D9C7:					;	   |
	STA $0020,y				;$B9D9C7   |
	STA $0026,y				;$B9D9CA   |
	PHY					;$B9D9CD   |
	LDY #$0036				;$B9D9CE   |
	LDA [$8E],y				;$B9D9D1   |
	PLY					;$B9D9D3   |
	STA $0024,y				;$B9D9D4   |
	LDA #$0000				;$B9D9D7   |
	STA $001E,y				;$B9D9DA   |
	TYX					;$B9D9DD   |
	JSL CODE_B8D4AE				;$B9D9DE   |
	STZ $0D7A				;$B9D9E2   |
	RTS					;$B9D9E5  /

CODE_B9D9E6:
	STZ $26,x				;$B9D9E6  \
	STZ $20,x				;$B9D9E8   |
	STZ $4E,x				;$B9D9EA   |
	RTS					;$B9D9EC  /

CODE_B9D9ED:
	LDA #$0400				;$B9D9ED  \
	BIT $12,x				;$B9D9F0   |
	BVC CODE_B9D9F8				;$B9D9F2   |
	EOR #$FFFF				;$B9D9F4   |
	INC A					;$B9D9F7   |
CODE_B9D9F8:					;	   |
	STA $26,x				;$B9D9F8   |
	STA $4E,x				;$B9D9FA   |
	RTS					;$B9D9FC  /

CODE_B9D9FD:
	NOP					;$B9D9FD  \
	NOP					;$B9D9FE   |
CODE_B9D9FF:					;	   |
	LDA $0515				;$B9D9FF   |
	CMP #$0002				;$B9DA02   |
	BEQ CODE_B9DA18				;$B9DA05   |
	CMP #$0001				;$B9DA07   |
	BNE CODE_B9DA11				;$B9DA0A   |
	LDA $052D				;$B9DA0C   |
	BEQ CODE_B9DA18				;$B9DA0F   |
CODE_B9DA11:					;	   |
	LDA #$0001				;$B9DA11   |
	JSL transition_song			;$B9DA14   |
CODE_B9DA18:					;	   |
	RTS					;$B9DA18  /

CODE_B9DA19:
	STZ $20,x				;$B9DA19  \
	STZ $26,x				;$B9DA1B   |
	STZ $24,x				;$B9DA1D   |
	LDA $06,x				;$B9DA1F   |
	STA $44,x				;$B9DA21   |
	LDA #$0025				;$B9DA23   |
	STA $2E,x				;$B9DA26   |
	LDA #$003D				;$B9DA28   |
	JSL CODE_B9D0B8				;$B9DA2B   |
	RTS					;$B9DA2F  /

CODE_B9DA30:
	JSR CODE_B9E06F				;$B9DA30  \
	LDX current_sprite			;$B9DA33   |
	LDA $20,x				;$B9DA35   |
	BPL CODE_B9DA3D				;$B9DA37   |
	EOR #$FFFF				;$B9DA39   |
	INC A					;$B9DA3C   |
CODE_B9DA3D:					;	   |
	LSR A					;$B9DA3D   |
	LSR A					;$B9DA3E   |
	STA $5E					;$B9DA3F   |
	LSR A					;$B9DA41   |
	CLC					;$B9DA42   |
	ADC $5E					;$B9DA43   |
	CMP #$0100				;$B9DA45   |
	BCS CODE_B9DA4D				;$B9DA48   |
	LDA #$0100				;$B9DA4A   |
CODE_B9DA4D:					;	   |
	STA $3A,x				;$B9DA4D   |
	RTS					;$B9DA4F  /

CODE_B9DA50:
	LDA #$F900				;$B9DA50  \
	STA $24,x				;$B9DA53   |
	LDA #$0400				;$B9DA55   |
	STA $26,x				;$B9DA58   |
	RTS					;$B9DA5A  /

CODE_B9DA5B:
	RTS					;$B9DA5B  |

CODE_B9DA5C:
	JSL CODE_B883D5				;$B9DA5C  \
	RTS					;$B9DA60  /

CODE_B9DA61:
	LDA #$810F				;$B9DA61  \
	JSL set_fade_global			;$B9DA64   |
	LDA #$0002				;$B9DA68   |
	TSB $08C2				;$B9DA6B   |
	LDA #$FFFF				;$B9DA6E   |
	STA $059D				;$B9DA71   |
	RTS					;$B9DA74  /

CODE_B9DA75:
	LDA #$0003				;$B9DA75  \
if !version == 0				;	   |
	LDY #$0280				;$B9DA78   |
else						;	   |
	LDY #$0100				;$B9DA78   |
endif						;	   |
	JSL CODE_B8D1E4				;$B9DA7B   |
	RTS					;$B9DA7F  /

CODE_B9DA80:
	RTS					;$B9DA80  |

CODE_B9DA81:
	LDA level_number			;$B9DA81  \
	STA $059D				;$B9DA83   |
	LDA $08A6				;$B9DA86   |
	STA $059F				;$B9DA89   |
	LDA #$002D				;$B9DA8C   |
	JSL CODE_B8D8BA				;$B9DA8F   |
	RTS					;$B9DA93  /

CODE_B9DA94:
	LDA #$050A				;$B9DA94  \
	JSL queue_sound_effect			;$B9DA97   |
	LDY #$0016				;$B9DA9B   |
	JSL CODE_BB842C				;$B9DA9E   |
	RTS					;$B9DAA2  /

CODE_B9DAA3:
	LDX current_player_mount		;$B9DAA3  \
	BEQ CODE_B9DAAE				;$B9DAA5   |
	LDA #$0054				;$B9DAA7   |
	JSL CODE_B9D04B				;$B9DAAA   |
CODE_B9DAAE:					;	   |
	RTS					;$B9DAAE  /

CODE_B9DAAF:
	LDA #$002C				;$B9DAAF  \
	JSL CODE_B9D0B8				;$B9DAB2   |
	RTS					;$B9DAB6  /

CODE_B9DAB7:
	CPX $0597				;$B9DAB7  \
	BEQ CODE_B9DADF				;$B9DABA   |
	LDA $24,x				;$B9DABC   |
	BPL CODE_B9DACD				;$B9DABE   |
	EOR #$FFFF				;$B9DAC0   |
	INC A					;$B9DAC3   |
	LSR A					;$B9DAC4   |
	STA $32					;$B9DAC5   |
	LSR A					;$B9DAC7   |
	CLC					;$B9DAC8   |
	ADC $32					;$B9DAC9   |
	BRA CODE_B9DAD5				;$B9DACB  /

CODE_B9DACD:
	LSR A					;$B9DACD  \
	LSR A					;$B9DACE   |
	STA $32					;$B9DACF   |
	LSR A					;$B9DAD1   |
	CLC					;$B9DAD2   |
	ADC $32					;$B9DAD3   |
CODE_B9DAD5:					;	   |
	CMP #$0070				;$B9DAD5   |
	BPL CODE_B9DADD				;$B9DAD8   |
	LDA #$0070				;$B9DADA   |
CODE_B9DADD:					;	   |
	STA $3A,x				;$B9DADD   |
CODE_B9DADF:					;	   |
	RTS					;$B9DADF  /

CODE_B9DAE0:
	CPX $0597				;$B9DAE0  \
	BEQ CODE_B9DB00				;$B9DAE3   |
	LDA $26,x				;$B9DAE5   |
	BEQ CODE_B9DAF3				;$B9DAE7   |
	LDA $12,x				;$B9DAE9   |
	ASL A					;$B9DAEB   |
	EOR #$FFFF				;$B9DAEC   |
	EOR $26,x				;$B9DAEF   |
	BMI CODE_B9DB09				;$B9DAF1   |
CODE_B9DAF3:					;	   |
	LDA $2A,x				;$B9DAF3   |
	BEQ CODE_B9DB00				;$B9DAF5   |
	BMI CODE_B9DB01				;$B9DAF7   |
	LDA #$0031				;$B9DAF9   |
	JSL CODE_B9D0B8				;$B9DAFC   |
CODE_B9DB00:					;	   |
	RTS					;$B9DB00  /

CODE_B9DB01:
	LDA #$0030				;$B9DB01  \
	JSL CODE_B9D0B8				;$B9DB04   |
	RTS					;$B9DB08  /

CODE_B9DB09:
	LDA #$0032				;$B9DB09  \
	JSL CODE_B9D0B8				;$B9DB0C   |
	RTS					;$B9DB10  /

CODE_B9DB11:
	LDA #$002F				;$B9DB11  \
	JSL CODE_B9D0B8				;$B9DB14   |
	RTS					;$B9DB18  /

CODE_B9DB19:
	CPX $0597				;$B9DB19  \
	BEQ CODE_B9DB35				;$B9DB1C   |
	LDA $2A,x				;$B9DB1E   |
	BNE CODE_B9DB25				;$B9DB20   |
	JMP CODE_B9DB11				;$B9DB22  /

CODE_B9DB25:
	BMI CODE_B9DB36				;$B9DB25  \
	LDY $66					;$B9DB27   |
	LDA #$0031				;$B9DB29   |
	CMP $0000,y				;$B9DB2C   |
	BEQ CODE_B9DB35				;$B9DB2F   |
	JSL CODE_B9D0B8				;$B9DB31   |
CODE_B9DB35:					;	   |
	RTS					;$B9DB35  /

CODE_B9DB36:
	LDY $66					;$B9DB36  \
	LDA #$0030				;$B9DB38   |
	CMP $0000,y				;$B9DB3B   |
	BEQ CODE_B9DB35				;$B9DB3E   |
	JSL CODE_B9D0B8				;$B9DB40   |
	RTS					;$B9DB44  /

CODE_B9DB45:
	CPX $0597				;$B9DB45  \
	BEQ CODE_B9DB5B				;$B9DB48   |
	JSR CODE_B9DAB7				;$B9DB4A   |
	LDA $26,x				;$B9DB4D   |
	BEQ CODE_B9DB5B				;$B9DB4F   |
	LDA $12,x				;$B9DB51   |
	ASL A					;$B9DB53   |
	EOR #$FFFF				;$B9DB54   |
	EOR $26,x				;$B9DB57   |
	BMI CODE_B9DB5C				;$B9DB59   |
CODE_B9DB5B:					;	   |
	RTS					;$B9DB5B  /

CODE_B9DB5C:
	LDA #$0032				;$B9DB5C  \
	JSL CODE_B9D0B8				;$B9DB5F   |
	RTS					;$B9DB63  /

CODE_B9DB64:
	LDA #$0043				;$B9DB64  \
	JSL CODE_B9D0B8				;$B9DB67   |
	RTS					;$B9DB6B  /

CODE_B9DB6C:
	CPX $0597				;$B9DB6C  \
	BEQ CODE_B9DB87				;$B9DB6F   |
	JSR CODE_B9DB88				;$B9DB71   |
	LDA $26,x				;$B9DB74   |
	BEQ CODE_B9DB87				;$B9DB76   |
	LSR A					;$B9DB78   |
	EOR $12,x				;$B9DB79   |
	AND #$4000				;$B9DB7B   |
	BEQ CODE_B9DB87				;$B9DB7E   |
	LDA #$0044				;$B9DB80   |
	JSL CODE_B9D0B8				;$B9DB83   |
CODE_B9DB87:					;	   |
	RTS					;$B9DB87  /

CODE_B9DB88:
	LDX current_sprite			;$B9DB88  \
	LDA $3A,x				;$B9DB8A   |
	SEC					;$B9DB8C   |
	SBC #$0010				;$B9DB8D   |
	CMP #$0100				;$B9DB90   |
	BPL CODE_B9DB98				;$B9DB93   |
	LDA #$0100				;$B9DB95   |
CODE_B9DB98:					;	   |
	STA $3A,x				;$B9DB98   |
	RTS					;$B9DB9A  /

CODE_B9DB9B:
	LDA $20,x				;$B9DB9B  \
	BPL CODE_B9DBA3				;$B9DB9D   |
	EOR #$FFFF				;$B9DB9F   |
	INC A					;$B9DBA2   |
CODE_B9DBA3:					;	   |
	CMP #$0140				;$B9DBA3   |
	BCS CODE_B9DBAB				;$B9DBA6   |
	LDA #$0140				;$B9DBA8   |
CODE_B9DBAB:					;	   |
	STA $3A,x				;$B9DBAB   |
	JMP CODE_B9E06C				;$B9DBAD  /

CODE_B9DBB0:
	LDA $0C,x				;$B9DBB0  \
	BMI CODE_B9DBBE				;$B9DBB2   |
	SEC					;$B9DBB4   |
	SBC $0A,x				;$B9DBB5   |
	BMI CODE_B9DBBE				;$B9DBB7   |
	CMP #$0010				;$B9DBB9   |
	BMI CODE_B9DBBF				;$B9DBBC   |
CODE_B9DBBE:					;	   |
	RTS					;$B9DBBE  /

CODE_B9DBBF:
	LDA #$0200				;$B9DBBF  \
	STA $3A,x				;$B9DBC2   |
	RTS					;$B9DBC4  /

CODE_B9DBC5:
	STZ $20,x				;$B9DBC5  \
	RTS					;$B9DBC7  /

CODE_B9DBC8:
	LDY $66					;$B9DBC8  \
	LDA $0006,y				;$B9DBCA   |
	AND #$0004				;$B9DBCD   |
	BNE CODE_B9DBE3				;$B9DBD0   |
	LDX current_sprite			;$B9DBD2   |
	LDA #$FB80				;$B9DBD4   |
	STA $24,x				;$B9DBD7   |
	LDY #$009C				;$B9DBD9   |
	LDA [$8E],y				;$B9DBDC   |
	LDX $66					;$B9DBDE   |
	STA $08,x				;$B9DBE0   |
	RTS					;$B9DBE2  /

CODE_B9DBE3:
	LDX current_sprite			;$B9DBE3  \
	LDA #$FB00				;$B9DBE5   |
	STA $24,x				;$B9DBE8   |
	LDY #$009C				;$B9DBEA   |
	LDA [$8E],y				;$B9DBED   |
	LDX $66					;$B9DBEF   |
	STA $08,x				;$B9DBF1   |
	RTS					;$B9DBF3  /

CODE_B9DBF4:
	LDA #$FEC0				;$B9DBF4  \
	STA $24,x				;$B9DBF7   |
CODE_B9DBF9:					;	   |
	LDA #$005E				;$B9DBF9   |
	JSL CODE_B9D08C				;$B9DBFC   |
	RTS					;$B9DC00  /

CODE_B9DC01:
	LDA $26,x				;$B9DC01  \
	BEQ CODE_B9DC0F				;$B9DC03   |
	LSR A					;$B9DC05   |
	EOR $12,x				;$B9DC06   |
	AND #$4000				;$B9DC08   |
	EOR $12,x				;$B9DC0B   |
	STA $12,x				;$B9DC0D   |
CODE_B9DC0F:					;	   |
	RTS					;$B9DC0F  /

CODE_B9DC10:
	LDA #$0001				;$B9DC10  \
	TRB $0B02				;$B9DC13   |
	RTS					;$B9DC16  /

CODE_B9DC17:
	LDA $26,x				;$B9DC17  \
	BEQ CODE_B9DC25				;$B9DC19   |
	LSR A					;$B9DC1B   |
	EOR $12,x				;$B9DC1C   |
	AND #$4000				;$B9DC1E   |
	EOR $12,x				;$B9DC21   |
	STA $12,x				;$B9DC23   |
CODE_B9DC25:					;	   |
	LDA #$0001				;$B9DC25   |
	TRB $0B02				;$B9DC28   |
	BNE CODE_B9DC2E				;$B9DC2B   |
	RTS					;$B9DC2D  /

CODE_B9DC2E:
	LDA #$008B				;$B9DC2E  \
	JSL CODE_B9D08C				;$B9DC31   |
	RTS					;$B9DC35  /

CODE_B9DC36:
	LDY #$002A				;$B9DC36  \
	JSL CODE_BB8412				;$B9DC39   |
	BCC CODE_B9DC54				;$B9DC3D   |
	RTS					;$B9DC3F  /

CODE_B9DC40:
	LDY #$0028				;$B9DC40  \
	JSL CODE_BB8412				;$B9DC43   |
	BCC CODE_B9DC54				;$B9DC47   |
	RTS					;$B9DC49  /

CODE_B9DC4A:
	LDY #$002C				;$B9DC4A  \
	JSL CODE_BB8412				;$B9DC4D   |
	BCC CODE_B9DC54				;$B9DC51   |
	RTS					;$B9DC53  /

CODE_B9DC54:
	LDX alternate_sprite			;$B9DC54  \
	LDY current_sprite			;$B9DC56   |
	LDA $0020,y				;$B9DC58   |
	CLC					;$B9DC5B   |
	ADC $20,x				;$B9DC5C   |
	STA $20,x				;$B9DC5E   |
	LDA #$052F				;$B9DC60   |
	JSL queue_sound_effect			;$B9DC63   |
	RTS					;$B9DC67  /

CODE_B9DC68:
	LDA $20,x				;$B9DC68  \
	BPL CODE_B9DC70				;$B9DC6A   |
	EOR #$FFFF				;$B9DC6C   |
	INC A					;$B9DC6F   |
CODE_B9DC70:					;	   |
	CMP #$0600				;$B9DC70   |
	BMI CODE_B9DC7C				;$B9DC73   |
	LDY #$0054				;$B9DC75   |
	JSL CODE_BB8412				;$B9DC78   |
CODE_B9DC7C:					;	   |
	RTS					;$B9DC7C  /

CODE_B9DC7D:
	LDA $20,x				;$B9DC7D  \
	BPL CODE_B9DC85				;$B9DC7F   |
	EOR #$FFFF				;$B9DC81   |
	INC A					;$B9DC84   |
CODE_B9DC85:					;	   |
	CMP #$0140				;$B9DC85   |
	BCS CODE_B9DC8D				;$B9DC88   |
	LDA #$0140				;$B9DC8A   |
CODE_B9DC8D:					;	   |
	STA $3A,x				;$B9DC8D   |
	JMP CODE_B9E06C				;$B9DC8F  /

CODE_B9DC92:
	RTS					;$B9DC92  |

CODE_B9DC93:
	RTS					;$B9DC93  \

CODE_B9DC94:
	STZ $0D7A				;$B9DC94  \
	RTS					;$B9DC97  /

CODE_B9DC98:
	LDA $0D7A				;$B9DC98  \
	BEQ CODE_B9DC9E				;$B9DC9B   |
	RTS					;$B9DC9D  /

CODE_B9DC9E:
	LDY #$0006				;$B9DC9E  \
	JSL CODE_BB842C				;$B9DCA1   |
	BCS CODE_B9DCAC				;$B9DCA5   |
	LDA alternate_sprite			;$B9DCA7   |
	STA $0D7A				;$B9DCA9   |
CODE_B9DCAC:					;	   |
	RTS					;$B9DCAC  /

CODE_B9DCAD:
	LDY #$0020				;$B9DCAD  \
	JSL CODE_BB842C				;$B9DCB0   |
	RTS					;$B9DCB4  /

CODE_B9DCB5:
	LDA $20,x				;$B9DCB5  \
	BPL CODE_B9DCBD				;$B9DCB7   |
	EOR #$FFFF				;$B9DCB9   |
	INC A					;$B9DCBC   |
CODE_B9DCBD:					;	   |
	CMP #$00E0				;$B9DCBD   |
	BCS CODE_B9DCC5				;$B9DCC0   |
	LDA #$00E0				;$B9DCC2   |
CODE_B9DCC5:					;	   |
	STA $3A,x				;$B9DCC5   |
	JMP CODE_B9E101				;$B9DCC7  /

CODE_B9DCCA:
	JSR CODE_B9E06F				;$B9DCCA  \
	LDX current_sprite			;$B9DCCD   |
	LDA $20,x				;$B9DCCF   |
	BPL CODE_B9DCD7				;$B9DCD1   |
	EOR #$FFFF				;$B9DCD3   |
	INC A					;$B9DCD6   |
CODE_B9DCD7:					;	   |
	CMP #$0140				;$B9DCD7   |
	BCS CODE_B9DCDF				;$B9DCDA   |
	LDA #$0140				;$B9DCDC   |
CODE_B9DCDF:					;	   |
	STA $3A,x				;$B9DCDF   |
	RTS					;$B9DCE1  /

CODE_B9DCE2:
	LDA #$0100				;$B9DCE2  \
	STA $3A,x				;$B9DCE5   |
	RTS					;$B9DCE7  /

CODE_B9DCE8:
	LDA #$0027				;$B9DCE8  \
	JSL CODE_B9D000				;$B9DCEB   |
	RTS					;$B9DCEF  /

CODE_B9DCF0:
	LDA #$0001				;$B9DCF0  \
	STA $0D80				;$B9DCF3   |
	RTS					;$B9DCF6  /

CODE_B9DCF7:
	LDA #$FFFF				;$B9DCF7  \
	STA $0D80				;$B9DCFA   |
	RTS					;$B9DCFD  /

CODE_B9DCFE:
	LDA $20,x				;$B9DCFE  \
	BPL CODE_B9DD06				;$B9DD00   |
	EOR #$FFFF				;$B9DD02   |
	INC A					;$B9DD05   |
CODE_B9DD06:					;	   |
	STA $32					;$B9DD06   |
	LSR A					;$B9DD08   |
	CLC					;$B9DD09   |
	ADC $32					;$B9DD0A   |
	CMP #$0140				;$B9DD0C   |
	BPL CODE_B9DD14				;$B9DD0F   |
	LDA #$0140				;$B9DD11   |
CODE_B9DD14:					;	   |
	STA $3A,x				;$B9DD14   |
	JMP CODE_B9E021				;$B9DD16  /

CODE_B9DD19:
	RTS					;$B9DD19  |

CODE_B9DD1A:
	LDA #$0001				;$B9DD1A  \
	STA $0D80				;$B9DD1D   |
	RTS					;$B9DD20  /

CODE_B9DD21:
	LDY #$0028				;$B9DD21  \
	LDA [$8E],y				;$B9DD24   |
	STA $24,x				;$B9DD26   |
	STZ $26,x				;$B9DD28   |
	RTS					;$B9DD2A  /

CODE_B9DD2B:
	LDA #$0520				;$B9DD2B  \
	JSL queue_sound_effect			;$B9DD2E   |
	LDY #$0014				;$B9DD32   |
	JSL CODE_BB842C				;$B9DD35   |
	RTS					;$B9DD39  /

CODE_B9DD3A:
	LDA $1E,x				;$B9DD3A  \
	AND #$1001				;$B9DD3C   |
	BNE CODE_B9DD5D				;$B9DD3F   |
	LDY $66					;$B9DD41   |
	LDA $0004,y				;$B9DD43   |
	AND #$4000				;$B9DD46   |
	BEQ CODE_B9DD4C				;$B9DD49   |
	RTS					;$B9DD4B  /

CODE_B9DD4C:
	LDA #$0001				;$B9DD4C  \
	STA $2E,x				;$B9DD4F   |
	JSL CODE_B8CEB6				;$B9DD51   |
	LDA #$0007				;$B9DD55   |
	JSL CODE_B9D0B8				;$B9DD58   |
	RTS					;$B9DD5C  /

CODE_B9DD5D:
	JSR CODE_B9DFE1				;$B9DD5D  \
	RTS					;$B9DD60  /

CODE_B9DD61:
	CPX $0597				;$B9DD61  \
	BEQ CODE_B9DD75				;$B9DD64   |
	LDY $66					;$B9DD66   |
	LDA $0006,y				;$B9DD68   |
	AND #$0004				;$B9DD6B   |
	BNE CODE_B9DD76				;$B9DD6E   |
	LDA #$0100				;$B9DD70   |
	STA $3A,x				;$B9DD73   |
CODE_B9DD75:					;	   |
	RTS					;$B9DD75  /

CODE_B9DD76:
	LDA #$0200				;$B9DD76  \
	STA $3A,x				;$B9DD79   |
	RTS					;$B9DD7B  /

CODE_B9DD7C:
	CPX $0597				;$B9DD7C  \
	BEQ CODE_B9DD8D				;$B9DD7F   |
	LDA #$0037				;$B9DD81   |
	STA $2E,x				;$B9DD84   |
	LDA #$0036				;$B9DD86   |
	JSL CODE_B9D0B8				;$B9DD89   |
CODE_B9DD8D:					;	   |
	RTS					;$B9DD8D  /

CODE_B9DD8E:
	CPX $0597				;$B9DD8E  \
	BEQ CODE_B9DD9B				;$B9DD91   |
	LDA #$0035				;$B9DD93   |
	STA $2E,x				;$B9DD96   |
	JMP CODE_B9DB11				;$B9DD98  /

CODE_B9DD9B:
	RTS					;$B9DD9B  /

CODE_B9DD9C:
	CPX $0597				;$B9DD9C  \
	BEQ CODE_B9DDAE				;$B9DD9F   |
	LDA $2A,x				;$B9DDA1   |
	BEQ CODE_B9DDAE				;$B9DDA3   |
	BPL CODE_B9DDAF				;$B9DDA5   |
	LDA #$0037				;$B9DDA7   |
	JSL CODE_B9D0B8				;$B9DDAA   |
CODE_B9DDAE:					;	   |
	RTS					;$B9DDAE  /

CODE_B9DDAF:
	LDA #$0038				;$B9DDAF  \
	JSL CODE_B9D0B8				;$B9DDB2   |
	RTS					;$B9DDB6  /

CODE_B9DDB7:
	CPX $0597				;$B9DDB7  \
	BEQ CODE_B9DDC0				;$B9DDBA   |
	LDA $26,x				;$B9DDBC   |
	BNE CODE_B9DDC1				;$B9DDBE   |
CODE_B9DDC0:					;	   |
	RTS					;$B9DDC0  /

CODE_B9DDC1:
	LDA #$003A				;$B9DDC1  \
	JSL CODE_B9D0B8				;$B9DDC4   |
	RTS					;$B9DDC8  /

CODE_B9DDC9:
	CPX $0597				;$B9DDC9  \
	BEQ CODE_B9DDD2				;$B9DDCC   |
	LDA $26,x				;$B9DDCE   |
	BEQ CODE_B9DDD3				;$B9DDD0   |
CODE_B9DDD2:					;	   |
	RTS					;$B9DDD2  /

CODE_B9DDD3:
	LDA $20,x				;$B9DDD3  \
	BPL CODE_B9DDDB				;$B9DDD5   |
	EOR #$FFFF				;$B9DDD7   |
	INC A					;$B9DDDA   |
CODE_B9DDDB:					;	   |
	CMP #$0080				;$B9DDDB   |
	BPL CODE_B9DDD2				;$B9DDDE   |
	LDA #$0039				;$B9DDE0   |
	JSL CODE_B9D0B8				;$B9DDE3   |
	RTS					;$B9DDE7  /

CODE_B9DDE8:
	CPX $0597				;$B9DDE8  \
	BEQ CODE_B9DE0E				;$B9DDEB   |
	LDA $26,x				;$B9DDED   |
	BEQ CODE_B9DDFB				;$B9DDEF   |
	LSR A					;$B9DDF1   |
	EOR $12,x				;$B9DDF2   |
	AND #$4000				;$B9DDF4   |
	EOR $12,x				;$B9DDF7   |
	STA $12,x				;$B9DDF9   |
CODE_B9DDFB:					;	   |
	LDA $20,x				;$B9DDFB   |
	BPL CODE_B9DE03				;$B9DDFD   |
	EOR #$FFFF				;$B9DDFF   |
	INC A					;$B9DE02   |
CODE_B9DE03:					;	   |
	LSR A					;$B9DE03   |
	CMP #$0070				;$B9DE04   |
	BPL CODE_B9DE0C				;$B9DE07   |
	LDA #$0070				;$B9DE09   |
CODE_B9DE0C:					;	   |
	STA $3A,x				;$B9DE0C   |
CODE_B9DE0E:					;	   |
	RTS					;$B9DE0E  /

CODE_B9DE0F:
	LDA #$0036				;$B9DE0F  \
	JSL CODE_B9D0B8				;$B9DE12   |
	RTS					;$B9DE16  /

CODE_B9DE17:
	CPX $0597				;$B9DE17  \
	BEQ CODE_B9DE33				;$B9DE1A   |
	LDA $2A,x				;$B9DE1C   |
	BNE CODE_B9DE23				;$B9DE1E   |
	JMP CODE_B9DE0F				;$B9DE20  /

CODE_B9DE23:
	BPL CODE_B9DE34				;$B9DE23  \
	LDY $66					;$B9DE25   |
	LDA #$0037				;$B9DE27   |
	CMP $0000,y				;$B9DE2A   |
	BEQ CODE_B9DE33				;$B9DE2D   |
	JSL CODE_B9D0B8				;$B9DE2F   |
CODE_B9DE33:					;	   |
	RTS					;$B9DE33  /

CODE_B9DE34:
	LDY $66					;$B9DE34  \
	LDA #$0038				;$B9DE36   |
	CMP $0000,y				;$B9DE39   |
	BEQ CODE_B9DE33				;$B9DE3C   |
	JSL CODE_B9D0B8				;$B9DE3E   |
	RTS					;$B9DE42  /

CODE_B9DE43:
	LDA $2E,x				;$B9DE43  \
	CMP #$0019				;$B9DE45   |
	BEQ CODE_B9DE78				;$B9DE48   |
	CMP #$0002				;$B9DE4A   |
	BNE CODE_B9DE67				;$B9DE4D   |
	LDY $66					;$B9DE4F   |
	LDA $0004,y				;$B9DE51   |
	AND #$4000				;$B9DE54   |
	BEQ CODE_B9DE67				;$B9DE57   |
	LDA $0010,y				;$B9DE59   |
	CMP $001A,y				;$B9DE5C   |
	BNE CODE_B9DE67				;$B9DE5F   |
	LDX current_sprite			;$B9DE61   |
	LDA $26,x				;$B9DE63   |
	BNE CODE_B9DE78				;$B9DE65   |
CODE_B9DE67:					;	   |
	STZ $20,x				;$B9DE67   |
	STZ $26,x				;$B9DE69   |
	LDA #$0004				;$B9DE6B   |
	STA $2E,x				;$B9DE6E   |
	LDA $40,x				;$B9DE70   |
	AND #$B7FF				;$B9DE72   |
	STA $40,x				;$B9DE75   |
	RTS					;$B9DE77  /

CODE_B9DE78:
	JSR CODE_B9DFE5				;$B9DE78  \
	RTS					;$B9DE7B  /

CODE_B9DE7C:
	LDA $2E,x				;$B9DE7C  \
	CMP #$0019				;$B9DE7E   |
	BEQ CODE_B9DEAA				;$B9DE81   |
	CMP #$0002				;$B9DE83   |
	BNE CODE_B9DEA0				;$B9DE86   |
	LDY $66					;$B9DE88   |
	LDA $0004,y				;$B9DE8A   |
	AND #$4000				;$B9DE8D   |
	BEQ CODE_B9DEA0				;$B9DE90   |
	LDA $0010,y				;$B9DE92   |
	CMP $001A,y				;$B9DE95   |
	BNE CODE_B9DEA0				;$B9DE98   |
	LDX current_sprite			;$B9DE9A   |
	LDA $26,x				;$B9DE9C   |
	BNE CODE_B9DEAA				;$B9DE9E   |
CODE_B9DEA0:					;	   |
	STZ $20,x				;$B9DEA0   |
	STZ $26,x				;$B9DEA2   |
	LDA #$0004				;$B9DEA4   |
	STA $2E,x				;$B9DEA7   |
	RTS					;$B9DEA9  /

CODE_B9DEAA:
	JSR CODE_B9DFE5				;$B9DEAA  \
	RTS					;$B9DEAD  /

CODE_B9DEAE:
	LDY $66					;$B9DEAE  \
	LDA $000E,y				;$B9DEB0   |
	BIT $12,x				;$B9DEB3   |
	BVC CODE_B9DEBB				;$B9DEB5   |
	EOR #$FFFF				;$B9DEB7   |
	INC A					;$B9DEBA   |
CODE_B9DEBB:					;	   |
	STA $26,x				;$B9DEBB   |
	RTS					;$B9DEBD  /

CODE_B9DEBE:
	STZ $20,x				;$B9DEBE  \
	RTS					;$B9DEC0  /

CODE_B9DEC1:
	LDA $24,x				;$B9DEC1  \
	BPL CODE_B9DEC6				;$B9DEC3   |
	RTS					;$B9DEC5  /

CODE_B9DEC6:
	LDA #$0200				;$B9DEC6  \
	STA $3A,x				;$B9DEC9   |
	RTS					;$B9DECB  /

CODE_B9DECC:
	LDA $0C,x				;$B9DECC  \
	BMI CODE_B9DEDA				;$B9DECE   |
	SEC					;$B9DED0   |
	SBC $0A,x				;$B9DED1   |
	BMI CODE_B9DEE1				;$B9DED3   |
	CMP #$0010				;$B9DED5   |
	BMI CODE_B9DEDB				;$B9DED8   |
CODE_B9DEDA:					;	   |
	RTS					;$B9DEDA  /

CODE_B9DEDB:
	LDA #$0200				;$B9DEDB  \
	STA $3A,x				;$B9DEDE   |
	RTS					;$B9DEE0  /

CODE_B9DEE1:
	LDA #$0300				;$B9DEE1  \
	STA $3A,x				;$B9DEE4   |
	RTS					;$B9DEE6  /

CODE_B9DEE7:
	LDA #$000D				;$B9DEE7  \
	JSL CODE_B9D0B8				;$B9DEEA   |
	RTS					;$B9DEEE  /

CODE_B9DEEF:
	LDA $0D7A				;$B9DEEF  \
	BNE CODE_B9DF32				;$B9DEF2   |
	LDA $6E					;$B9DEF4   |
	BNE CODE_B9DF13				;$B9DEF6   |
	STZ $2E,x				;$B9DEF8   |
	LDA #$0008				;$B9DEFA   |
	JSL CODE_B9D0B8				;$B9DEFD   |
	LDY $66					;$B9DF01   |
	LDA $0006,y				;$B9DF03   |
	AND #$0004				;$B9DF06   |
	BEQ CODE_B9DF12				;$B9DF09   |
	LDX current_sprite			;$B9DF0B   |
	LDA #$0200				;$B9DF0D   |
	STA $3A,x				;$B9DF10   |
CODE_B9DF12:					;	   |
	RTS					;$B9DF12  /

CODE_B9DF13:
	LDA $2E,x				;$B9DF13  \
	CMP #$004F				;$B9DF15   |
	BEQ CODE_B9DF27				;$B9DF18   |
	LDA #$0009				;$B9DF1A   |
	STA $2E,x				;$B9DF1D   |
	LDA #$007C				;$B9DF1F   |
	JSL CODE_B9D08C				;$B9DF22   |
	RTS					;$B9DF26  /

CODE_B9DF27:
	LDA #$0068				;$B9DF27  \
	JSL CODE_B9D08C				;$B9DF2A   |
	JSR CODE_B9DAA3				;$B9DF2E   |
	RTS					;$B9DF31  /

CODE_B9DF32:
	CMP $0597				;$B9DF32  \
	BEQ CODE_B9DF44				;$B9DF35   |
	LDA #$000C				;$B9DF37   |
	STA $2E,x				;$B9DF3A   |
	LDA #$0018				;$B9DF3C   |
	JSL CODE_B9D0B8				;$B9DF3F   |
	RTS					;$B9DF43  /

CODE_B9DF44:
	LDA #$0017				;$B9DF44  \
	STA $2E,x				;$B9DF47   |
	LDA #$0024				;$B9DF49   |
	JSL CODE_B9D0B8				;$B9DF4C   |
	RTS					;$B9DF50  /

CODE_B9DF51:
	LDA $0D7A				;$B9DF51  \
	BNE CODE_B9DF7A				;$B9DF54   |
	LDA $6E					;$B9DF56   |
	BNE CODE_B9DF6A				;$B9DF58   |
	JSR CODE_B9DFB6				;$B9DF5A   |
	LDA #$0006				;$B9DF5D   |
	STA $2E,x				;$B9DF60   |
	LDA #$0006				;$B9DF62   |
	JSL CODE_B9D0B8				;$B9DF65   |
	RTS					;$B9DF69  /

CODE_B9DF6A:
	JSR CODE_B9DFB6				;$B9DF6A  \
	LDA #$000B				;$B9DF6D   |
	STA $2E,x				;$B9DF70   |
	LDA #$0072				;$B9DF72   |
	JSL CODE_B9D08C				;$B9DF75   |
	RTS					;$B9DF79  /

CODE_B9DF7A:
	CMP $0597				;$B9DF7A  \
	BEQ CODE_B9DF9E				;$B9DF7D   |
	LDA $08A4				;$B9DF7F   |
	BEQ CODE_B9DF8A				;$B9DF82   |
	LDA #$0001				;$B9DF84   |
	STA $0D80				;$B9DF87   |
CODE_B9DF8A:					;	   |
	LDY #$0008				;$B9DF8A   |
	LDA [$8E],y				;$B9DF8D   |
	STA $24,x				;$B9DF8F   |
	LDA #$000E				;$B9DF91   |
	STA $2E,x				;$B9DF94   |
	LDA #$0016				;$B9DF96   |
	JSL CODE_B9D0B8				;$B9DF99   |
	RTS					;$B9DF9D  /

CODE_B9DF9E:
	LDY #$0008				;$B9DF9E  \
	LDA [$8E],y				;$B9DFA1   |
	STA $24,x				;$B9DFA3   |
	LDA #$001B				;$B9DFA5   |
	STA $2E,x				;$B9DFA8   |
	LDA #$0022				;$B9DFAA   |
	JSL CODE_B9D0B8				;$B9DFAD   |
	RTS					;$B9DFB1  /

CODE_B9DFB2:
	JSR CODE_B9DFB6				;$B9DFB2  \
	RTL					;$B9DFB5  /

CODE_B9DFB6:
	LDX current_sprite			;$B9DFB6  \
	LDA $6E					;$B9DFB8   |
	BNE CODE_B9DFC4				;$B9DFBA   |
	LDY #$0008				;$B9DFBC   |
	LDA [$8E],y				;$B9DFBF   |
	STA $24,x				;$B9DFC1   |
	RTS					;$B9DFC3  /

CODE_B9DFC4:
	SEC					;$B9DFC4  \
	SBC #$000C				;$B9DFC5   |
	LSR A					;$B9DFC8   |
	TAY					;$B9DFC9   |
	LDA [$8E],y				;$B9DFCA   |
	STA $24,x				;$B9DFCC   |
	RTS					;$B9DFCE  /

CODE_B9DFCF:
	JSR CODE_B9DFD3				;$B9DFCF  \
	RTL					;$B9DFD2  /

CODE_B9DFD3:
	LDX current_sprite			;$B9DFD3  \
	LDA $1E,x				;$B9DFD5   |
	AND #$0001				;$B9DFD7   |
	BNE CODE_B9DFE5				;$B9DFDA   |
	JSL CODE_B8B9B4				;$B9DFDC   |
	RTS					;$B9DFE0  /

CODE_B9DFE1:
	JSL CODE_B8CEB6				;$B9DFE1  \
CODE_B9DFE5:					;	   |
	LDX current_sprite			;$B9DFE5   |
	CPX $0597				;$B9DFE7   |
	BEQ CODE_B9E000				;$B9DFEA   |
	JSR CODE_B9E128				;$B9DFEC   |
	TXY					;$B9DFEF   |
	TAX					;$B9DFF0   |
	JMP (DATA_B9DFF4,x)			;$B9DFF1  /

DATA_B9DFF4:
	dw CODE_B9E000
	dw CODE_B9E003
	dw CODE_B9E003
	dw CODE_B9E003
	dw CODE_B9E003
	dw CODE_B9E003


CODE_B9E000:
	JMP CODE_B9D705				;$B9E000  /

CODE_B9E003:
	LDY $66					;$B9E003  \
	LDA $0006,y				;$B9E005   |
	AND #$0004				;$B9E008   |
	BNE CODE_B9E010				;$B9E00B   |
	JMP CODE_B9D76D				;$B9E00D  /

CODE_B9E010:
	JMP CODE_B9D7E6				;$B9E010  /

CODE_B9E013:
	CPX $0597				;$B9E013  \
	BNE CODE_B9E019				;$B9E016   |
	RTS					;$B9E018  /

CODE_B9E019:
	LDA $12,x				;$B9E019  \
	EOR #$4000				;$B9E01B   |
	STA $12,x				;$B9E01E   |
	RTS					;$B9E020  /

CODE_B9E021:
	LDX current_sprite			;$B9E021  \
	LDA $26,x				;$B9E023   |
	BEQ CODE_B9E06A				;$B9E025   |
	LSR A					;$B9E027   |
	EOR $12,x				;$B9E028   |
	AND #$4000				;$B9E02A   |
	BEQ CODE_B9E06A				;$B9E02D   |
	LDA $0D7A				;$B9E02F   |
	BNE CODE_B9E041				;$B9E032   |
	LDA $6E					;$B9E034   |
	BNE CODE_B9E058				;$B9E036   |
	LDA #$0002				;$B9E038   |
	JSL CODE_B9D0B8				;$B9E03B   |
	SEC					;$B9E03F   |
	RTS					;$B9E040  /

CODE_B9E041:
	CMP $0597				;$B9E041  \
	BEQ CODE_B9E04F				;$B9E044   |
	LDA #$0012				;$B9E046   |
	JSL CODE_B9D0B8				;$B9E049   |
	SEC					;$B9E04D   |
	RTS					;$B9E04E  /

CODE_B9E04F:
	LDA #$001E				;$B9E04F  \
	JSL CODE_B9D0B8				;$B9E052   |
	SEC					;$B9E056   |
	RTS					;$B9E057  /

CODE_B9E058:
	CMP #$0194				;$B9E058  \
	BEQ CODE_B9E066				;$B9E05B   |
	LDA #$0063				;$B9E05D   |
	JSL CODE_B9D08C				;$B9E060   |
	SEC					;$B9E064   |
	RTS					;$B9E065  /

CODE_B9E066:
	JSR CODE_B9E019				;$B9E066  \
	RTS					;$B9E069  /

CODE_B9E06A:
	CLC					;$B9E06A  \
	RTS					;$B9E06B  /

CODE_B9E06C:
	JMP CODE_B9E021				;$B9E06C  /

CODE_B9E06F:
	JSR CODE_B9E021				;$B9E06F  \
	BCC CODE_B9E079				;$B9E072   |
	LDA #$0180				;$B9E074   |
	STA $3A,x				;$B9E077   |
CODE_B9E079:					;	   |
	RTS					;$B9E079  /

CODE_B9E07A:
	LDY $66					;$B9E07A  \
	LDA $0006,y				;$B9E07C   |
	AND #$0004				;$B9E07F   |
	STA $5E					;$B9E082   |
	JSR CODE_B9E128				;$B9E084   |
	TXY					;$B9E087   |
	TAX					;$B9E088   |
	JMP (DATA_B9E08C,x)			;$B9E089  /

DATA_B9E08C:
	dw CODE_B9E098
	dw CODE_B9E09B
	dw CODE_B9E0A1
	dw CODE_B9E0A1
	dw CODE_B9E0A1
	dw CODE_B9E0A1


CODE_B9E098:
	JMP CODE_B9D705				;$B9E098  /

CODE_B9E09B:
	JSR CODE_B9E0F3				;$B9E09B  \
	BEQ CODE_B9E098				;$B9E09E   |
CODE_B9E0A0:					;	   |
	RTS					;$B9E0A0  /

CODE_B9E0A1:
	LDA $5E					;$B9E0A1  \
	BNE CODE_B9E0A0				;$B9E0A3   |
	JMP CODE_B9D76D				;$B9E0A5  /

CODE_B9E0A8:
	LDX current_sprite			;$B9E0A8  \
	CPX $0597				;$B9E0AA   |
	BEQ CODE_B9E0C4				;$B9E0AD   |
CODE_B9E0AF:					;	   |
	JSR CODE_B9E128				;$B9E0AF   |
	TXY					;$B9E0B2   |
	TAX					;$B9E0B3   |
	JMP (DATA_B9E0B7,x)			;$B9E0B4  /

DATA_B9E0B7:
	dw CODE_B9E0C3
	dw CODE_B9E0C3
	dw CODE_B9E0D0
	dw CODE_B9E0D0
	dw CODE_B9E0D0
	dw CODE_B9E0D0


CODE_B9E0C3:
	RTS					;$B9E0C3  /

CODE_B9E0C4:
	LDA $08C2				;$B9E0C4  \
	LDA #$C000				;$B9E0C7   |
	CMP #$C000				;$B9E0CA   |
	BEQ CODE_B9E0AF				;$B9E0CD   |
	RTS					;$B9E0CF  /

CODE_B9E0D0:
	LDY $66					;$B9E0D0  \
	LDA $0006,y				;$B9E0D2   |
	AND #$0004				;$B9E0D5   |
	BNE CODE_B9E0DD				;$B9E0D8   |
	JMP CODE_B9D76D				;$B9E0DA  /

CODE_B9E0DD:
	JMP CODE_B9D7E6				;$B9E0DD  /

CODE_B9E0E0:
	JSR CODE_B9E128				;$B9E0E0  \
	BEQ CODE_B9E0F0				;$B9E0E3   |
	CMP #$0002				;$B9E0E5   |
	BEQ CODE_B9E0EB				;$B9E0E8   |
CODE_B9E0EA:					;	   |
	RTS					;$B9E0EA  /

CODE_B9E0EB:
	JSR CODE_B9E0F3				;$B9E0EB  \
	BNE CODE_B9E0EA				;$B9E0EE   |
CODE_B9E0F0:					;	   |
	JMP CODE_B9D705				;$B9E0F0  /

CODE_B9E0F3:
	LDX current_sprite			;$B9E0F3  \
	LDA $20,x				;$B9E0F5   |
	BPL CODE_B9E0FD				;$B9E0F7   |
	EOR #$FFFF				;$B9E0F9   |
	INC A					;$B9E0FC   |
CODE_B9E0FD:					;	   |
	AND #$FFE0				;$B9E0FD   |
	RTS					;$B9E100  /

CODE_B9E101:
	JSR CODE_B9E021				;$B9E101  \
	BCS CODE_B9E127				;$B9E104   |
	JSR CODE_B9E128				;$B9E106   |
	TXY					;$B9E109   |
	TAX					;$B9E10A   |
	JMP (DATA_B9E10E,x)			;$B9E10B  /

DATA_B9E10E:
	dw CODE_B9E127
	dw CODE_B9E127
	dw CODE_B9E11A
	dw CODE_B9E11A
	dw CODE_B9E11A
	dw CODE_B9E11A


CODE_B9E11A:
	LDY $66					;$B9E11A  \
	LDA $0006,y				;$B9E11D   |
	AND #$0004				;$B9E11F   |
	BEQ CODE_B9E127				;$B9E122   |
	JMP CODE_B9D7E6				;$B9E124  /

CODE_B9E127:
	RTS					;$B9E127  /

CODE_B9E128:
	LDA $26,x				;$B9E128  \
	BNE CODE_B9E138				;$B9E12A   |
	LDA $20,x				;$B9E12C   |
	BNE CODE_B9E134				;$B9E12E   |
	LDA #$0000				;$B9E130   |
	RTS					;$B9E133  /

CODE_B9E134:
	LDA #$0002				;$B9E134  \
	RTS					;$B9E137  /

CODE_B9E138:
	LDA $20,x				;$B9E138  \
	BNE CODE_B9E140				;$B9E13A   |
	LDA #$0004				;$B9E13C   |
	RTS					;$B9E13F  /

CODE_B9E140:
	BPL CODE_B9E146				;$B9E140  \
	EOR #$FFFF				;$B9E142   |
	INC A					;$B9E145   |
CODE_B9E146:					;	   |
	STA $32					;$B9E146   |
	LDA $26,x				;$B9E148   |
	BPL CODE_B9E150				;$B9E14A   |
	EOR #$FFFF				;$B9E14C   |
	INC A					;$B9E14F   |
CODE_B9E150:					;	   |
	CMP $32					;$B9E150   |
	BEQ CODE_B9E15E				;$B9E152   |
	BCS CODE_B9E15A				;$B9E154   |
	LDA #$0006				;$B9E156   |
	RTS					;$B9E159  /

CODE_B9E15A:
	LDA #$0008				;$B9E15A  \
	RTS					;$B9E15D  /

CODE_B9E15E:
	LDA #$000A				;$B9E15E  \
	RTS					;$B9E161  /

CODE_B9E162:
	STZ $0D7A				;$B9E162  \
	LDX $0597				;$B9E165   |
	LDY $0593				;$B9E168   |
	LDA $000A,y				;$B9E16B   |
	SEC					;$B9E16E   |
	SBC #$0038				;$B9E16F   |
	STA $0A,x				;$B9E172   |
	LDA $0006,y				;$B9E174   |
	STA $06,x				;$B9E177   |
	LDA #$FD40				;$B9E179   |
	STA $24,x				;$B9E17C   |
	LDA #$FFF0				;$B9E17E   |
	BIT $12,x				;$B9E181   |
	BVC CODE_B9E189				;$B9E183   |
	EOR #$FFFF				;$B9E185   |
	INC A					;$B9E188   |
CODE_B9E189:					;	   |
	STA $20,x				;$B9E189   |
	LDA #$004D				;$B9E18B   |
	STA $2E,x				;$B9E18E   |
	LDA #$004B				;$B9E190   |
	JSL CODE_B9D000				;$B9E193   |
	RTS					;$B9E197  /

CODE_B9E198:
	LDA $0D66				;$B9E198  \
	SEC					;$B9E19B   |
	SBC $06,x				;$B9E19C   |
	JSR CODE_B9E1B4				;$B9E19E   |
	STA $20,x				;$B9E1A1   |
	LDA $0D6A				;$B9E1A3   |
	SEC					;$B9E1A6   |
	SBC $0A,x				;$B9E1A7   |
	JSR CODE_B9E1B4				;$B9E1A9   |
	STA $24,x				;$B9E1AC   |
	LDA #$004B				;$B9E1AE   |
	STA $2E,x				;$B9E1B1   |
	RTS					;$B9E1B3  /

CODE_B9E1B4:
	BPL CODE_B9E1C2				;$B9E1B4  \
	EOR #$FFFF				;$B9E1B6   |
	INC A					;$B9E1B9   |
	JSR CODE_B9E1C2				;$B9E1BA   |
	EOR #$FFFF				;$B9E1BD   |
	INC A					;$B9E1C0   |
	RTS					;$B9E1C1  /

CODE_B9E1C2:
	ASL A					;$B9E1C2  \
	ASL A					;$B9E1C3   |
	ASL A					;$B9E1C4   |
	ASL A					;$B9E1C5   |
	CMP #$0004				;$B9E1C6   |
	BPL CODE_B9E1CE				;$B9E1C9   |
	LDA #$0004				;$B9E1CB   |
CODE_B9E1CE:					;	   |
	RTS					;$B9E1CE  /

CODE_B9E1CF:
	LDA #$0010				;$B9E1CF  \
	BIT $12,x				;$B9E1D2   |
	BVC CODE_B9E1DA				;$B9E1D4   |
	EOR #$FFFF				;$B9E1D6   |
	INC A					;$B9E1D9   |
CODE_B9E1DA:					;	   |
	CLC					;$B9E1DA   |
	ADC $06,x				;$B9E1DB   |
	STA $06,x				;$B9E1DD   |
	JMP CODE_B9E198				;$B9E1DF  /

CODE_B9E1E2:
	STZ $0D7A				;$B9E1E2  \
	LDX $0597				;$B9E1E5   |
	LDA $0A,x				;$B9E1E8   |
	SEC					;$B9E1EA   |
	SBC #$001D				;$B9E1EB   |
	STA $0A,x				;$B9E1EE   |
	LDA #$FB00				;$B9E1F0   |
	STA $24,x				;$B9E1F3   |
	LDA #$FF40				;$B9E1F5   |
	BIT $12,x				;$B9E1F8   |
	BVC CODE_B9E200				;$B9E1FA   |
	EOR #$FFFF				;$B9E1FC   |
	INC A					;$B9E1FF   |
CODE_B9E200:					;	   |
	STA $20,x				;$B9E200   |
	LDA #$004D				;$B9E202   |
	STA $2E,x				;$B9E205   |
	LDA #$0019				;$B9E207   |
	JSL CODE_B9D000				;$B9E20A   |
	RTS					;$B9E20E  /

CODE_B9E20F:
	LDX current_sprite			;$B9E20F  \
	LDA #$000C				;$B9E211   |
	JSL CODE_B8D1FB				;$B9E214   |
	RTS					;$B9E218  /

CODE_B9E219:
	LDA #$0008				;$B9E219  \
	JSL CODE_BCFA9A				;$B9E21C   |
	RTS					;$B9E220  /

CODE_B9E221:
	LDA $1E,x				;$B9E221  \
	AND #$1001				;$B9E223   |
	CMP #$0001				;$B9E226   |
	BEQ CODE_B9E22C				;$B9E229   |
	RTS					;$B9E22B  /

CODE_B9E22C:
	LDA #$FC00				;$B9E22C  \
	STA $24,x				;$B9E22F   |
	LDA #$000A				;$B9E231   |
	STA $2E,x				;$B9E234   |
	RTS					;$B9E236  /

CODE_B9E237:
	LDY #$0054				;$B9E237  \
	JSL CODE_BB8412				;$B9E23A   |
	RTS					;$B9E23E  /

CODE_B9E23F:
	LDA $26,x				;$B9E23F  \
	BNE CODE_B9E24F				;$B9E241   |
	LDY $0595				;$B9E243   |
	LDA $0004,y				;$B9E246   |
	AND #$0080				;$B9E249   |
	BEQ CODE_B9E24F				;$B9E24C   |
	RTS					;$B9E24E  /

CODE_B9E24F:
	JMP CODE_B9D705				;$B9E24F  /

CODE_B9E252:
	LDA $26,x				;$B9E252  \
	BNE CODE_B9E262				;$B9E254   |
	LDY $0595				;$B9E256   |
	LDA $0004,y				;$B9E259   |
	AND #$0080				;$B9E25C   |
	BEQ CODE_B9E26A				;$B9E25F   |
	RTS					;$B9E261  /

CODE_B9E262:
	LDA #$005E				;$B9E262  \
	JSL CODE_B9D08C				;$B9E265   |
	RTS					;$B9E269  /

CODE_B9E26A:
	LDA $6E					;$B9E26A  \
	CMP #$01A0				;$B9E26C   |
	BEQ CODE_B9E28F				;$B9E26F   |
	LDA #$0700				;$B9E271   |
	BIT $12,x				;$B9E274   |
	BVC CODE_B9E27C				;$B9E276   |
	EOR #$FFFF				;$B9E278   |
	INC A					;$B9E27B   |
CODE_B9E27C:					;	   |
	STA $42,x				;$B9E27C   |
	STA $20,x				;$B9E27E   |
	STA $26,x				;$B9E280   |
	LDA #$004F				;$B9E282   |
	STA $2E,x				;$B9E285   |
	LDA #$0068				;$B9E287   |
	JSL CODE_B9D08C				;$B9E28A   |
	RTS					;$B9E28E  /

CODE_B9E28F:
	LDA #$0700				;$B9E28F  \
	BIT $12,x				;$B9E292   |
	BVC CODE_B9E29A				;$B9E294   |
	EOR #$FFFF				;$B9E296   |
	INC A					;$B9E299   |
CODE_B9E29A:					;	   |
	STA $42,x				;$B9E29A   |
	STA $20,x				;$B9E29C   |
	STA $26,x				;$B9E29E   |
	LDA #$0052				;$B9E2A0   |
	STA $2E,x				;$B9E2A3   |
	LDA #$0068				;$B9E2A5   |
	JSL CODE_B9D08C				;$B9E2A8   |
	LDX current_sprite			;$B9E2AC   |
	LDA #$A000				;$B9E2AE   |
	ORA $40,x				;$B9E2B1   |
	STA $40,x				;$B9E2B3   |
	RTS					;$B9E2B5  /

CODE_B9E2B6:
	JSR CODE_B9E2D0				;$B9E2B6  \
	LDX current_sprite			;$B9E2B9   |
	LDA $26,x				;$B9E2BB   |
	BEQ CODE_B9E2CF				;$B9E2BD   |
	LSR A					;$B9E2BF   |
	EOR $12,x				;$B9E2C0   |
	AND #$4000				;$B9E2C2   |
	BNE CODE_B9E2C8				;$B9E2C5   |
	RTS					;$B9E2C7  /

CODE_B9E2C8:
	LDA #$0063				;$B9E2C8  \
	JSL CODE_B9D08C				;$B9E2CB   |
CODE_B9E2CF:					;	   |
	RTS					;$B9E2CF  /

CODE_B9E2D0:
	LDX current_sprite			;$B9E2D0  \
	LDA $24,x				;$B9E2D2   |
	BPL CODE_B9E2DA				;$B9E2D4   |
	EOR #$FFFF				;$B9E2D6   |
	INC A					;$B9E2D9   |
CODE_B9E2DA:					;	   |
	STA $34					;$B9E2DA   |
	LDA $20,x				;$B9E2DC   |
	BPL CODE_B9E2E4				;$B9E2DE   |
	EOR #$FFFF				;$B9E2E0   |
	INC A					;$B9E2E3   |
CODE_B9E2E4:					;	   |
	CMP $34					;$B9E2E4   |
	BPL CODE_B9E2EA				;$B9E2E6   |
	LDA $34					;$B9E2E8   |
CODE_B9E2EA:					;	   |
	CMP #$00C0				;$B9E2EA   |
	BPL CODE_B9E2F2				;$B9E2ED   |
	LDA #$00C0				;$B9E2EF   |
CODE_B9E2F2:					;	   |
	STA $3A,x				;$B9E2F2   |
	RTS					;$B9E2F4  /

CODE_B9E2F5:
	LDA #$005E				;$B9E2F5  \
	JSL CODE_B9D08C				;$B9E2F8   |
	RTS					;$B9E2FC  /

CODE_B9E2FD:
	LDA #$0051				;$B9E2FD  \
	STA $2E,x				;$B9E300   |
	LDA #$A000				;$B9E302   |
	ORA $40,x				;$B9E305   |
	STA $40,x				;$B9E307   |
	RTS					;$B9E309  /

CODE_B9E30A:
	LDA $0B02				;$B9E30A  \
	AND #$0001				;$B9E30D   |
	BNE CODE_B9E313				;$B9E310   |
	RTS					;$B9E312  /

CODE_B9E313:
	EOR $0B02				;$B9E313  \
	STA $0B02				;$B9E316   |
	LDX current_sprite			;$B9E319   |
	LDA $26,x				;$B9E31B   |
	BEQ CODE_B9E329				;$B9E31D   |
	LSR A					;$B9E31F   |
	EOR $12,x				;$B9E320   |
	AND #$4000				;$B9E322   |
	EOR $12,x				;$B9E325   |
	STA $12,x				;$B9E327   |
CODE_B9E329:					;	   |
	LDA #$008B				;$B9E329   |
	JSL CODE_B9D08C				;$B9E32C   |
	RTS					;$B9E330  /

CODE_B9E331:
	LDA $08A4				;$B9E331  \
	BNE CODE_B9E33D				;$B9E334   |
	LDA #$0059				;$B9E336   |
	JSL CODE_B9D04B				;$B9E339   |
CODE_B9E33D:					;	   |
	RTS					;$B9E33D  /

CODE_B9E33E:
	LDY $66					;$B9E33E  \
	LDA $0004,y				;$B9E340   |
	AND #$4000				;$B9E343   |
	BEQ CODE_B9E354				;$B9E346   |
	LDA global_frame_counter		;$B9E348   |
	SEC					;$B9E34A   |
	SBC $001A,y				;$B9E34B   |
	CMP #$0014				;$B9E34E   |
	BMI CODE_B9E354				;$B9E351   |
	RTS					;$B9E353  /

CODE_B9E354:
	JMP CODE_B9D705				;$B9E354  /

CODE_B9E357:
	LDA #$0011				;$B9E357  \
	JSL CODE_B8D1FB				;$B9E35A   |
	RTS					;$B9E35E  /

CODE_B9E35F:
	LDA #$0565				;$B9E35F  \
	JSL queue_sound_effect			;$B9E362   |
	LDX current_sprite			;$B9E366   |
	LDY #$0400				;$B9E368   |
	LDA $2E,x				;$B9E36B   |
	CMP #$006C				;$B9E36D   |
	BNE CODE_B9E375				;$B9E370   |
	LDY #$0180				;$B9E372   |
CODE_B9E375:					;	   |
	BIT $12,x				;$B9E375   |
	BVC CODE_B9E37F				;$B9E377   |
	TYA					;$B9E379   |
	EOR #$FFFF				;$B9E37A   |
	INC A					;$B9E37D   |
	TAY					;$B9E37E   |
CODE_B9E37F:					;	   |
	TYA					;$B9E37F   |
	STA $20,x				;$B9E380   |
	STA $26,x				;$B9E382   |
	RTS					;$B9E384  /

CODE_B9E385:
	LDY #$0000				;$B9E385  \
	LDA $3A,x				;$B9E388   |
	CLC					;$B9E38A   |
	ADC #$000C				;$B9E38B   |
	CMP #$0480				;$B9E38E   |
	BMI CODE_B9E397				;$B9E391   |
	INY					;$B9E393   |
	LDA #$0480				;$B9E394   |
CODE_B9E397:					;	   |
	STA $3A,x				;$B9E397   |
	STY $32					;$B9E399   |
	LDY $0595				;$B9E39B   |
	LDA $0004,y				;$B9E39E   |
	AND #$0080				;$B9E3A1   |
	BEQ CODE_B9E3A7				;$B9E3A4   |
	RTS					;$B9E3A6  /

CODE_B9E3A7:
	LDA $32					;$B9E3A7  \
	BNE CODE_B9E3AF				;$B9E3A9   |
	JMP CODE_B9D705				;$B9E3AB  /

CODE_B9E3AE:
	RTS					;$B9E3AE  \

CODE_B9E3AF:
	LDX current_sprite			;$B9E3AF  \
	LDY #$0098				;$B9E3B1   |
	LDA [$8E],y				;$B9E3B4   |
	STA $24,x				;$B9E3B6   |
	LDA #$0062				;$B9E3B8   |
	STA $2E,x				;$B9E3BB   |
	LDY $66					;$B9E3BD   |
	LDA global_frame_counter		;$B9E3BF   |
	STA $0012,y				;$B9E3C1   |
	LDA #$0072				;$B9E3C4   |
	JSL CODE_B9D08C				;$B9E3C7   |
	LDA #$0549				;$B9E3CB   |
	JSL queue_sound_effect			;$B9E3CE   |
	RTS					;$B9E3D2  /

CODE_B9E3D3:
	LDA #$14EC				;$B9E3D3  \
	BRL CODE_B9E486				;$B9E3D6  /

CODE_B9E3D9:
	LDA #$01C0				;$B9E3D9  \
	BRA CODE_B9E3E1				;$B9E3DC  /

CODE_B9E3DE:
	LDA #$02C0				;$B9E3DE  \
CODE_B9E3E1:					;	   |
	BIT $4A,x				;$B9E3E1   |
	BNE CODE_B9E3EC				;$B9E3E3   |
CODE_B9E3E5:					;	   |
	LDA $48,x				;$B9E3E5   |
	CMP #$0009				;$B9E3E7   |
	BEQ CODE_B9E401				;$B9E3EA   |
CODE_B9E3EC:					;	   |
	LDA #DATA_F94C82			;$B9E3EC   |
	STA $3C,x				;$B9E3EF   |
	STZ $3E,x				;$B9E3F1   |
	STZ $38,x				;$B9E3F3   |
	LDA $48,x				;$B9E3F5   |
	AND #$00FF				;$B9E3F7   |
	ASL A					;$B9E3FA   |
	ASL A					;$B9E3FB   |
	ADC #$14EC				;$B9E3FC   |
	STA $1A,x				;$B9E3FF   |
CODE_B9E401:					;	   |
	RTS					;$B9E401  /

CODE_B9E402:
	LDA $46,x				;$B9E402  \
	CMP #$8005				;$B9E404   |
	BNE CODE_B9E3EC				;$B9E407   |
	RTS					;$B9E409  /

CODE_B9E40A:
	LDA #$1454				;$B9E40A  \
	BRL CODE_B9E486				;$B9E40D  /

CODE_B9E410:
	LDA #$01C0				;$B9E410  \
	BRA CODE_B9E418				;$B9E413  /

CODE_B9E415:
	LDA #$02C0				;$B9E415  \
CODE_B9E418:					;	   |
	BIT $4A,x				;$B9E418   |
	BNE CODE_B9E423				;$B9E41A   |
CODE_B9E41C:					;	   |
	LDA $48,x				;$B9E41C   |
	CMP #$0009				;$B9E41E   |
	BEQ CODE_B9E438				;$B9E421   |
CODE_B9E423:					;	   |
	LDA #DATA_F94D19			;$B9E423   |
	STA $3C,x				;$B9E426   |
	STZ $3E,x				;$B9E428   |
	STZ $38,x				;$B9E42A   |
	LDA $48,x				;$B9E42C   |
	AND #$00FF				;$B9E42E   |
	ASL A					;$B9E431   |
	ASL A					;$B9E432   |
	ADC #$1454				;$B9E433   |
	STA $1A,x				;$B9E436   |
CODE_B9E438:					;	   |
	RTS					;$B9E438  /

CODE_B9E439:
	LDA $0E,x				;$B9E439  \
	BNE CODE_B9E423				;$B9E43B   |
	RTS					;$B9E43D  /

CODE_B9E43E:
	LDA $46,x				;$B9E43E  \
	CMP #$8005				;$B9E440   |
	BNE CODE_B9E480				;$B9E443   |
	LDA #$0040				;$B9E445   |
	BIT $4A,x				;$B9E448   |
	BNE CODE_B9E483				;$B9E44A   |
	BRL process_anim_script			;$B9E44C  /

CODE_B9E44F:
	LDA $4A,x				;$B9E44F  \
	BIT #$0008				;$B9E451   |
	BNE CODE_B9E45D				;$B9E454   |
	AND #$0200				;$B9E456   |
	BEQ CODE_B9E45D				;$B9E459   |
	CLC					;$B9E45B   |
	RTS					;$B9E45C  /

CODE_B9E45D:
	STZ $3E,x				;$B9E45D  \
	STZ $38,x				;$B9E45F   |
	SEC					;$B9E461   |
	RTS					;$B9E462  /

CODE_B9E463:
	CLC					;$B9E463  \
	LDA #$0080				;$B9E464   |
	BRA CODE_B9E46D				;$B9E467  /

CODE_B9E469:
	SEC					;$B9E469  \
	LDA #$0100				;$B9E46A   |
CODE_B9E46D:					;	   |
	BIT $4A,x				;$B9E46D   |
	BNE CODE_B9E483				;$B9E46F   |
	LDA #$0008				;$B9E471   |
	BIT $4A,x				;$B9E474   |
	BEQ CODE_B9E480				;$B9E476   |
	ROL A					;$B9E478   |
	EOR $000D58				;$B9E479   |
	LSR A					;$B9E47D   |
	BCC CODE_B9E483				;$B9E47E   |
CODE_B9E480:					;	   |
	BRL process_anim_script			;$B9E480  /

CODE_B9E483:
	BRL CODE_B9D12B				;$B9E483  /

CODE_B9E486:
	STZ $3E,x				;$B9E486  \
	STA $32					;$B9E488   |
	LDA $4A,x				;$B9E48A   |
	BIT #$0040				;$B9E48C   |
	BNE CODE_B9E4D0				;$B9E48F   |
	BIT #$0008				;$B9E491   |
	BNE CODE_B9E508				;$B9E494   |
	BIT #$0100				;$B9E496   |
	BNE CODE_B9E4F5				;$B9E499   |
	BIT #$0080				;$B9E49B   |
	BNE CODE_B9E4EC				;$B9E49E   |
	BIT #$0200				;$B9E4A0   |
	BNE CODE_B9E4FE				;$B9E4A3   |
CODE_B9E4A5:					;	   |
	LDA $4A,x				;$B9E4A5   |
	BIT #$0010				;$B9E4A7   |
	BNE CODE_B9E4BA				;$B9E4AA   |
CODE_B9E4AC:					;	   |
	LDA $48,x				;$B9E4AC   |
	AND #$00FF				;$B9E4AE   |
	ASL A					;$B9E4B1   |
	ASL A					;$B9E4B2   |
	ADC $32					;$B9E4B3   |
	STA $1A,x				;$B9E4B5   |
	BRL CODE_B9D12B				;$B9E4B7  /

CODE_B9E4BA:
	LDA global_frame_counter		;$B9E4BA  \
	AND #$000F				;$B9E4BC   |
	BNE CODE_B9E4AC				;$B9E4BF   |
	JSL CODE_B4C175				;$B9E4C1   |
	AND #$000F				;$B9E4C5   |
	CMP #$0005				;$B9E4C8   |
	BCS CODE_B9E4AC				;$B9E4CB   |
	BRL process_anim_script			;$B9E4CD  /

CODE_B9E4D0:
	LDA #$8005				;$B9E4D0  \
	CMP $44,x				;$B9E4D3   |
	BNE CODE_B9E4AC				;$B9E4D5   |
	CMP $46,x				;$B9E4D7   |
	BNE CODE_B9E4AC				;$B9E4D9   |
	LDA $0E,x				;$B9E4DB   |
	BNE CODE_B9E4AC				;$B9E4DD   |
	LDA $24,x				;$B9E4DF   |
	BMI CODE_B9E4AC				;$B9E4E1   |
	TYA					;$B9E4E3   |
	CLC					;$B9E4E4   |
	ADC #$0009				;$B9E4E5   |
	TAY					;$B9E4E8   |
	BRL process_anim_script			;$B9E4E9  /

CODE_B9E4EC:
	TYA					;$B9E4EC  \
	CLC					;$B9E4ED   |
	ADC #$0006				;$B9E4EE   |
	TAY					;$B9E4F1   |
	BRL process_anim_script			;$B9E4F2  /

CODE_B9E4F5:
	TYA					;$B9E4F5  \
	CLC					;$B9E4F6   |
	ADC #$0003				;$B9E4F7   |
	TAY					;$B9E4FA   |
	BRL process_anim_script			;$B9E4FB  /

CODE_B9E4FE:
	TXA					;$B9E4FE  \
	CMP $000593				;$B9E4FF   |
	BNE CODE_B9E4A5				;$B9E503   |
	BRL process_anim_script			;$B9E505  /

CODE_B9E508:
	LDA.l $000D58				;$B9E508  \
	LSR A					;$B9E50C   |
	BCS CODE_B9E4F5				;$B9E50D   |
	BRA CODE_B9E4EC				;$B9E50F  /

CODE_B9E511:
	JSL CODE_BB82B8				;$B9E511  \
	RTS					;$B9E515  /

CODE_B9E516:
	SEP #$20				;$B9E516  \
	INC $19AF				;$B9E518   |
	REP #$20				;$B9E51B   |
	RTS					;$B9E51D  /

CODE_B9E51E:
	LDA $0A36				;$B9E51E  \
	BIT #$0004				;$B9E521   |
	BNE CODE_B9E534				;$B9E524   |
	JSL CODE_BCFB58				;$B9E526   |
	LDA #$0100				;$B9E52A   |
	LDY #$0100				;$B9E52D   |
	JSL CODE_BEBD8E				;$B9E530   |
CODE_B9E534:					;	   |
	RTS					;$B9E534  /

CODE_B9E535:
	LDA $2E,x				;$B9E535  \
	AND #$00FF				;$B9E537   |
	INC A					;$B9E53A   |
	STA $2E,x				;$B9E53B   |
	RTS					;$B9E53D  /

CODE_B9E53E:
	INC $2F,x				;$B9E53E  \
	RTS					;$B9E540  /

CODE_B9E541:
	DEC $2F,x				;$B9E541  \
	RTS					;$B9E543  /

CODE_B9E544:
	INC $2E,x				;$B9E544  \
	RTS					;$B9E546  /

CODE_B9E547:
	LDA $24,x				;$B9E547  \
	BMI CODE_B9E54E				;$B9E549   |
CODE_B9E54B:					;	   |
	JMP process_anim_script			;$B9E54B  /

CODE_B9E54E:
	JMP CODE_B9D12B				;$B9E54E  /

CODE_B9E551:
	LDA $24,x				;$B9E551  \
	BPL CODE_B9E54B				;$B9E553   |
	CMP #$FE00				;$B9E555   |
	BCC CODE_B9E54E				;$B9E558   |
	JMP process_anim_script			;$B9E55A  /

CODE_B9E55D:
	LDA $0E,x				;$B9E55D  \
	BNE CODE_B9E54E				;$B9E55F   |
	JMP process_anim_script			;$B9E561  /

turn_sprite_if_needed:
	LDA $26,x				;$B9E564  \
	BEQ CODE_B9E575				;$B9E566   |
	LSR A					;$B9E568   |
	EOR $12,x				;$B9E569   |
	AND #$4000				;$B9E56B   |
	BEQ CODE_B9E575				;$B9E56E   |
	TYA					;$B9E570   |
	JSL set_sprite_animation		;$B9E571   |
CODE_B9E575:					;	   |
	RTS					;$B9E575  /

CODE_B9E576:
	LDA $08C2				;$B9E576  \
	AND #$4000				;$B9E579   |
	BNE CODE_B9E592				;$B9E57C   |
	LDY $0593				;$B9E57E   |
	LDA $002E,y				;$B9E581   |
	ASL A					;$B9E584   |
	ASL A					;$B9E585   |
	TAX					;$B9E586   |
	LDA.l DATA_B896B7,x			;$B9E587   |
	AND #$0001				;$B9E58B   |
	BEQ CODE_B9E592				;$B9E58E   |
	CLC					;$B9E590   |
	RTS					;$B9E591  /

CODE_B9E592:
	SEC					;$B9E592  \
	RTS					;$B9E593  /

CODE_B9E594:
	LDA $46,x				;$B9E594  \
	LSR A					;$B9E596   |
	LDA #$0560				;$B9E597   |
	BCC CODE_B9E59F				;$B9E59A   |
	LDA #$0561				;$B9E59C   |
CODE_B9E59F:					;	   |
	JSL queue_sound_effect			;$B9E59F   |
	LDX current_sprite			;$B9E5A3   |
	LDA #$FFFF				;$B9E5A5   |
	STA $46,x				;$B9E5A8   |
	RTS					;$B9E5AA  /

CODE_B9E5AB:
	LDA global_frame_counter		;$B9E5AB  \
	AND #$003F				;$B9E5AD   |
	BNE turn_neek_if_needed			;$B9E5B0   |
	LDA #$0524				;$B9E5B2   |
	JSL CODE_B3A3FC				;$B9E5B5   |
turn_neek_if_needed:				;	   |
	LDY #$0170				;$B9E5B9   |
	JMP turn_sprite_if_needed		;$B9E5BC  /

turn_click_clack_if_needed:
	LDY #$0165				;$B9E5BF  \
	JMP turn_sprite_if_needed		;$B9E5C2  /

CODE_B9E5C5:
	LDA #$FB00				;$B9E5C5  \
	STA $24,x				;$B9E5C8   |
	LDA $06,x				;$B9E5CA   |
	STA $0A3E				;$B9E5CC   |
	LDA $0A,x				;$B9E5CF   |
	SBC #$0008				;$B9E5D1   |
	STA $0A40				;$B9E5D4   |
	LDY #$0034				;$B9E5D7   |
	JSL CODE_BB842C				;$B9E5DA   |
	RTS					;$B9E5DE  /

CODE_B9E5DF:
	LDA $1E,x				;$B9E5DF  \
	AND #$0001				;$B9E5E1   |
	BEQ CODE_B9E5ED				;$B9E5E4   |
	LDA #$060F				;$B9E5E6   |
	JSL CODE_B3A3FC				;$B9E5E9   |
CODE_B9E5ED:					;	   |
	RTS					;$B9E5ED  /

CODE_B9E5EE:
	LDA #$0000				;$B9E5EE  \
	CMP $4E,x				;$B9E5F1   |
	RTS					;$B9E5F3  /

CODE_B9E5F4:
	JSR CODE_B9E601				;$B9E5F4  \
	BCS CODE_B9E613				;$B9E5F7   |
	LDX current_sprite			;$B9E5F9   |
	LDY #$01F6				;$B9E5FB   |
	JMP turn_sprite_if_needed		;$B9E5FE  /

CODE_B9E601:
	LDA $2E,x				;$B9E601  \
	AND #$00FF				;$B9E603   |
	CMP #$0003				;$B9E606   |
	BCC CODE_B9E613				;$B9E609   |
	LDA #$01F7				;$B9E60B   |
	JSL set_sprite_animation		;$B9E60E   |
	SEC					;$B9E612   |
CODE_B9E613:					;	   |
	RTS					;$B9E613  /

CODE_B9E614:
	LDY #$0006				;$B9E614  \
	LDA [$8E],y				;$B9E617   |
	BIT $12,x				;$B9E619   |
	BVC CODE_B9E621				;$B9E61B   |
	EOR #$FFFF				;$B9E61D   |
	INC A					;$B9E620   |
CODE_B9E621:					;	   |
	STA $26,x				;$B9E621   |
	LDA #$0200				;$B9E623   |
	STA $4A,x				;$B9E626   |
	LDA #$0001				;$B9E628   |
	STA $50,x				;$B9E62B   |
	RTS					;$B9E62D  /

CODE_B9E62E:
	LDA #$FC80				;$B9E62E  \
	STA $24,x				;$B9E631   |
	RTS					;$B9E633  /

CODE_B9E634:
	LDA $3A,x				;$B9E634  \
	CMP #$0101				;$B9E636   |
	BCC CODE_B9E613				;$B9E639   |
	LDA $1E,x				;$B9E63B   |
	AND #$0101				;$B9E63D   |
	BEQ CODE_B9E613				;$B9E640   |
	LDA $26,x				;$B9E642   |
	EOR $20,x				;$B9E644   |
	BMI CODE_B9E655				;$B9E646   |
	LDA $20,x				;$B9E648   |
	BPL CODE_B9E650				;$B9E64A   |
	EOR #$FFFF				;$B9E64C   |
	INC A					;$B9E64F   |
CODE_B9E650:					;	   |
	CMP #$0200				;$B9E650   |
	BCS CODE_B9E613				;$B9E653   |
CODE_B9E655:					;	   |
	JSL CODE_BBBB69				;$B9E655   |
	BCS CODE_B9E613				;$B9E659   |
	LDX current_sprite			;$B9E65B   |
	LDY #$004E				;$B9E65D   |
	BIT $12,x				;$B9E660   |
	BVC CODE_B9E667				;$B9E662   |
	LDY #$0050				;$B9E664   |
CODE_B9E667:					;	   |
	JSL CODE_BB8412				;$B9E667   |
	LDX current_sprite			;$B9E66B   |
	DEC $50,x				;$B9E66D   |
	BNE CODE_B9E613				;$B9E66F   |
	LDA #$0711				;$B9E671   |
	JSL queue_sound_effect			;$B9E674   |
	RTS					;$B9E678  /

CODE_B9E679:
	LDA $20,x				;$B9E679  \
	CMP #$8000				;$B9E67B   |
	ROR $20,x				;$B9E67E   |
	CMP #$8000				;$B9E680   |
	ROR $20,x				;$B9E683   |
	RTS					;$B9E685  /

CODE_B9E686:
	LDA $20,x				;$B9E686  \
	CMP #$8000				;$B9E688   |
	ROR A					;$B9E68B   |
	CLC					;$B9E68C   |
	ADC $20,x				;$B9E68D   |
	STA $20,x				;$B9E68F   |
	RTS					;$B9E691  /

turn_klomp_if_needed:
	LDY #$0161				;$B9E692  \
	JMP turn_sprite_if_needed		;$B9E695  /

turn_kruncha_if_needed:
	LDY #$0173				;$B9E698  \
	JMP turn_sprite_if_needed		;$B9E69B  /

CODE_B9E69E:
	LDA $24,x				;$B9E69E  \
	BMI CODE_B9E6AE				;$B9E6A0   |
	CMP #$0040				;$B9E6A2   |
	BCC CODE_B9E6AE				;$B9E6A5   |
CODE_B9E6A7:					;	   |
	BRL CODE_B9D12B				;$B9E6A7  /

CODE_B9E6AA:
	BIT $2A,x				;$B9E6AA  \
	BPL CODE_B9E6A7				;$B9E6AC   |
CODE_B9E6AE:					;	   |
	BRL process_anim_script			;$B9E6AE  /

CODE_B9E6B1:
	LDY $0593				;$B9E6B1  \
	LDA $0006,y				;$B9E6B4   |
	CMP $06,x				;$B9E6B7   |
	ROR A					;$B9E6B9   |
	ROR A					;$B9E6BA   |
	EOR $12,x				;$B9E6BB   |
	ASL A					;$B9E6BD   |
	ASL A					;$B9E6BE   |
	RTS					;$B9E6BF  /

turn_klampon_if_needed:
	LDY #$01A0				;$B9E6C0  \
	JMP turn_sprite_if_needed		;$B9E6C3  /

CODE_B9E6C6:
	LDA.l $000A36				;$B9E6C6  \
	AND #$0004				;$B9E6CA   |
	SEC					;$B9E6CD   |
	SBC #$0004				;$B9E6CE   |
	RTS					;$B9E6D1  /

turn_spiny_if_needed:
	LDY #$01A4				;$B9E6D2  \
	JMP turn_sprite_if_needed		;$B9E6D5  /

CODE_B9E6D8:
	LDA $06,x				;$B9E6D8  \
	CMP #$0160				;$B9E6DA   |
	BCC CODE_B9E6E6				;$B9E6DD   |
	STZ $3E,x				;$B9E6DF   |
	LDA #DATA_F956E6			;$B9E6E1   |
	STA $3C,x				;$B9E6E4   |
CODE_B9E6E6:					;	   |
	RTS					;$B9E6E6  /

turn_lockjaw_if_needed:
	LDY #$0178				;$B9E6E7  \
	JMP turn_sprite_if_needed		;$B9E6EA  /

CODE_B9E6ED:
	LDA $12,x				;$B9E6ED  \
	ASL A					;$B9E6EF   |
	EOR $26,x				;$B9E6F0   |
	ASL A					;$B9E6F2   |
	RTS					;$B9E6F3  /

CODE_B9E6F4:
	LDA $26,x				;$B9E6F4  \
	BNE CODE_B9E704				;$B9E6F6   |
	LDA #DATA_F95798			;$B9E6F8   |
	STA $3C,x				;$B9E6FB   |
	LDA #CODE_B9E705			;$B9E6FD   |
	STA $3E,x				;$B9E700   |
	STZ $38,x				;$B9E702   |
CODE_B9E704:					;	   |
	RTS					;$B9E704  /

CODE_B9E705:
	LDA $26,x				;$B9E705  \
	BEQ CODE_B9E704				;$B9E707   |
	STZ $3E,x				;$B9E709   |
	STZ $38,x				;$B9E70B   |
	LDA #DATA_F957AA			;$B9E70D   |
	STA $3C,x				;$B9E710   |
	RTS					;$B9E712  /

CODE_B9E713:
	LDA $2E,x				;$B9E713  \
	CMP #$0402				;$B9E715   |
	BNE CODE_B9E71D				;$B9E718   |
	BRL process_anim_script			;$B9E71A  /

CODE_B9E71D:
	BRL CODE_B9D12B				;$B9E71D  /

CODE_B9E720:
	LDA #$0080				;$B9E720  \
	BIT $12,x				;$B9E723   |
	BVS CODE_B9E72A				;$B9E725   |
	LDA #$FF80				;$B9E727   |
CODE_B9E72A:					;	   |
	STA $26,x				;$B9E72A   |
	STZ $2A,x				;$B9E72C   |
	RTS					;$B9E72E  /

CODE_B9E72F:
	LDA $12,x				;$B9E72F  \
	ASL A					;$B9E731   |
	EOR $26,x				;$B9E732   |
	EOR #$8000				;$B9E734   |
	ASL A					;$B9E737   |
	STZ $26,x				;$B9E738   |
	RTS					;$B9E73A  /

CODE_B9E73B:
	LDA $1C,x				;$B9E73B  \
	LSR A					;$B9E73D   |
	RTS					;$B9E73E  /

CODE_B9E73F:
	LDA $1C,x				;$B9E73F  \
	ORA #$0002				;$B9E741   |
	STA $1C,x				;$B9E744   |
	LSR A					;$B9E746   |
	BNE CODE_B9E75F				;$B9E747   |
	LDA.l $000915				;$B9E749   |
	BNE CODE_B9E75F				;$B9E74D   |
	JSR CODE_B9E576				;$B9E74F   |
	BCC CODE_B9E75F				;$B9E752   |
	LDX $0593				;$B9E754   |
	LDA $0A,x				;$B9E757   |
	CMP $0D4E				;$B9E759   |
	BCC CODE_B9E75F				;$B9E75C   |
	RTS					;$B9E75E  /

CODE_B9E75F:
	TYX					;$B9E75F  \
	LDY #$0010				;$B9E760   |
	LDA [$8E],y				;$B9E763   |
	TXY					;$B9E765   |
	LDX current_sprite			;$B9E766   |
	STA $4E,x				;$B9E768   |
	LDA #$FD00				;$B9E76A   |
	CMP $26,x				;$B9E76D   |
	BCC CODE_B9E77F				;$B9E76F   |
	LDA $26,x				;$B9E771   |
	BMI CODE_B9E77D				;$B9E773   |
	CMP #$0300				;$B9E775   |
	BCC CODE_B9E77F				;$B9E778   |
	LDA #$0300				;$B9E77A   |
CODE_B9E77D:					;	   |
	STA $26,x				;$B9E77D   |
CODE_B9E77F:					;	   |
	CLC					;$B9E77F   |
	RTS					;$B9E780  /

CODE_B9E781:
	LDX $0593				;$B9E781  \
	LDA $06,x				;$B9E784   |
	SEC					;$B9E786   |
	LDX current_sprite			;$B9E787   |
	SBC $06,x				;$B9E789   |
	LSR A					;$B9E78B   |
	EOR $12,x				;$B9E78C   |
	EOR #$4000				;$B9E78E   |
	ASL A					;$B9E791   |
	ASL A					;$B9E792   |
	RTS					;$B9E793  /

CODE_B9E794:
	LDA.l $000915				;$B9E794  \
	BNE CODE_B9E7B0				;$B9E798   |
	LDA.l $000593				;$B9E79A   |
	TAX					;$B9E79E   |
	LDA $06,x				;$B9E79F   |
	LDX current_sprite			;$B9E7A1   |
	SBC $06,x				;$B9E7A3   |
	BPL CODE_B9E7B3				;$B9E7A5   |
	BIT $12,x				;$B9E7A7   |
	BVC CODE_B9E7D1				;$B9E7A9   |
	CMP #$FFF0				;$B9E7AB   |
	BCC CODE_B9E7BC				;$B9E7AE   |
CODE_B9E7B0:					;	   |
	JMP process_anim_script			;$B9E7B0  /

CODE_B9E7B3:
	BIT $12,x				;$B9E7B3  \
	BVS CODE_B9E7D1				;$B9E7B5   |
	CMP #$0010				;$B9E7B7   |
	BCC CODE_B9E7B0				;$B9E7BA   |
CODE_B9E7BC:					;	   |
	LDA $1C,x				;$B9E7BC   |
	LSR A					;$B9E7BE   |
	BCS CODE_B9E7B0				;$B9E7BF   |
	LDA.l $000593				;$B9E7C1   |
	TAX					;$B9E7C5   |
	LDA $0A,x				;$B9E7C6   |
	CMP $000D4E				;$B9E7C8   |
	BCC CODE_B9E7B0				;$B9E7CC   |
	JMP CODE_B9D12B				;$B9E7CE  /

CODE_B9E7D1:
	LDA #CODE_B9E7D9			;$B9E7D1  \
	STA $3E,x				;$B9E7D4   |
	JMP process_anim_script			;$B9E7D6  /

CODE_B9E7D9:
	STZ $26,x				;$B9E7D9  \
	STZ $2A,x				;$B9E7DB   |
	RTS					;$B9E7DD  /

turn_flotsam_if_needed:
	LDY #$01AA				;$B9E7DE  \
	JMP turn_sprite_if_needed		;$B9E7E1  /

CODE_B9E7E4:
	STZ $3E,x				;$B9E7E4  \
	LDA $26,x				;$B9E7E6   |
	CMP #$8000				;$B9E7E8   |
	ROR A					;$B9E7EB   |
	CLC					;$B9E7EC   |
	ADC $26,x				;$B9E7ED   |
	STA $20,x				;$B9E7EF   |
	RTS					;$B9E7F1  /

CODE_B9E7F2:
	LDA $12,x				;$B9E7F2  \
	EOR #$4000				;$B9E7F4   |
	STA $12,x				;$B9E7F7   |
	AND #$4000				;$B9E7F9   |
	CMP #$4000				;$B9E7FC   |
	LDA #$0008				;$B9E7FF   |
	BCC CODE_B9E807				;$B9E802   |
	LDA #$FFF9				;$B9E804   |
CODE_B9E807:					;	   |
	ADC $06,x				;$B9E807   |
	STA $06,x				;$B9E809   |
	RTS					;$B9E80B  /

CODE_B9E80C:
	LDA $3A,x				;$B9E80C  \
	CMP #$0100				;$B9E80E   |
	BEQ CODE_B9E815				;$B9E811   |
	DEC $3A,x				;$B9E813   |
CODE_B9E815:					;	   |
	RTS					;$B9E815  /

CODE_B9E816:
	LDA $52,x				;$B9E816  \
	AND #$FF00				;$B9E818   |
	BNE CODE_B9E824				;$B9E81B   |
	LDA #DATA_F9596D			;$B9E81D   |
	STA $3C,x				;$B9E820   |
	STZ $3E,x				;$B9E822   |
CODE_B9E824:					;	   |
	RTS					;$B9E824  /

CODE_B9E825:
	LDA #$0502				;$B9E825  \
	JSL queue_sound_effect			;$B9E828   |
	LDX current_sprite			;$B9E82C   |
	LDA $2A,x				;$B9E82E   |
	EOR #$FFFF				;$B9E830   |
	INC A					;$B9E833   |
	ASL A					;$B9E834   |
	STA CPU.dividen				;$B9E835   |
	LDA $22,x				;$B9E838   |
	SEP #$20				;$B9E83A   |
	STA CPU.divisor				;$B9E83C   |
	REP #$20				;$B9E83F   |
	LDA $50,x				;$B9E841   |
	STA $26,x				;$B9E843   |
	LDA #$3C00				;$B9E845   |
	STA CPU.dividen				;$B9E848   |
	LDA CPU.divide_result			;$B9E84B   |
	STA CPU.divisor				;$B9E84E   |
	LDA $2A,x				;$B9E851   |
	STA $24,x				;$B9E853   |
	NOP					;$B9E855   |
	NOP					;$B9E856   |
	NOP					;$B9E857   |
	LDA CPU.divide_result			;$B9E858   |
	STA $3A,x				;$B9E85B   |
	INC $2F,x				;$B9E85D   |
	RTS					;$B9E85F  /

CODE_B9E860:
	LDA #$0502				;$B9E860  \
	JSL queue_sound_effect			;$B9E863   |
	LDX current_sprite			;$B9E867   |
	LDA #$0100				;$B9E869   |
	STA $3A,x				;$B9E86C   |
	LDA $50,x				;$B9E86E   |
	BEQ CODE_B9E87C				;$B9E870   |
	LSR A					;$B9E872   |
	EOR $12,x				;$B9E873   |
	AND #$4000				;$B9E875   |
	BEQ CODE_B9E87C				;$B9E878   |
	SEC					;$B9E87A   |
	RTS					;$B9E87B  /

CODE_B9E87C:
	CLC					;$B9E87C  \
	RTS					;$B9E87D  /

CODE_B9E87E:
	LDY #$0198				;$B9E87E  \
	LDA #$0007				;$B9E881   |
	JMP CODE_B9E898				;$B9E884  /

CODE_B9E887:
	LDA $22,x				;$B9E887  \
	EOR $12,x				;$B9E889   |
	AND #$4000				;$B9E88B   |
	BEQ CODE_B9E897				;$B9E88E   |
	LDA #$02DC				;$B9E890   |
	JSL set_sprite_animation		;$B9E893   |
CODE_B9E897:					;	   |
	RTS					;$B9E897  /

CODE_B9E898:
	STA CPU.multiply_A			;$B9E898  \
	LDA $52,x				;$B9E89B   |
	AND #$00FF				;$B9E89D   |
	CMP #$000A				;$B9E8A0   |
	BCC CODE_B9E8E0				;$B9E8A3   |
	CMP #$000C				;$B9E8A5   |
	BCS CODE_B9E8E0				;$B9E8A8   |
	LDA $26,x				;$B9E8AA   |
	BPL CODE_B9E8B2				;$B9E8AC   |
	EOR #$FFFF				;$B9E8AE   |
	INC A					;$B9E8B1   |
CODE_B9E8B2:					;	   |
	ASL A					;$B9E8B2   |
	ASL A					;$B9E8B3   |
	XBA					;$B9E8B4   |
	STA CPU.multiply_B			;$B9E8B5   |
	LDA $46,x				;$B9E8B8   |
	CLC					;$B9E8BA   |
	ADC #$4000				;$B9E8BB   |
	STA $5E					;$B9E8BE   |
	LDA CPU.multiply_result			;$B9E8C0   |
	XBA					;$B9E8C3   |
	LSR A					;$B9E8C4   |
	LSR A					;$B9E8C5   |
	BIT $26,x				;$B9E8C6   |
	BPL CODE_B9E8CE				;$B9E8C8   |
	EOR #$FFFF				;$B9E8CA   |
	SEC					;$B9E8CD   |
CODE_B9E8CE:					;	   |
	ADC $5E					;$B9E8CE   |
	EOR $26,x				;$B9E8D0   |
	LSR A					;$B9E8D2   |
	EOR $12,x				;$B9E8D3   |
	AND #$4000				;$B9E8D5   |
	BEQ CODE_B9E8DF				;$B9E8D8   |
	TYA					;$B9E8DA   |
	JSL set_sprite_animation		;$B9E8DB   |
CODE_B9E8DF:					;	   |
	RTS					;$B9E8DF  /

CODE_B9E8E0:
	JMP turn_sprite_if_needed		;$B9E8E0  /

CODE_B9E8E3:
	LDY #$019C				;$B9E8E3  \
	LDA #$0008				;$B9E8E6   |
	JMP CODE_B9E898				;$B9E8E9  /

CODE_B9E8EC:
	BIT $24,x				;$B9E8EC  \
	BPL CODE_B9E8F1				;$B9E8EE   |
	RTS					;$B9E8F0  /

CODE_B9E8F1:
	STZ $24,x				;$B9E8F1  \
	RTS					;$B9E8F3  /

CODE_B9E8F4:
	LDA $24,x				;$B9E8F4  \
	ASL A					;$B9E8F6   |
	CLC					;$B9E8F7   |
	ADC $24,x				;$B9E8F8   |
	STA $24,x				;$B9E8FA   |
	RTS					;$B9E8FC  /

CODE_B9E8FD:
	ASL $24,x				;$B9E8FD  \
	ASL $24,x				;$B9E8FF   |
	RTS					;$B9E901  /

CODE_B9E902:
	LDA $2A,x				;$B9E902  \
	EOR #$8000				;$B9E904   |
	ASL A					;$B9E907   |
	RTS					;$B9E908  /

CODE_B9E909:
	LDA $2A,x				;$B9E909  \
	ASL A					;$B9E90B   |
	BCC CODE_B9E912				;$B9E90C   |
	LDA $4E,x				;$B9E90E   |
	STA $3A,x				;$B9E910   |
CODE_B9E912:					;	   |
	RTS					;$B9E912  /

CODE_B9E913:
	LDA $2A,x				;$B9E913  \
	BMI CODE_B9E91E				;$B9E915   |
	ASL A					;$B9E917   |
	ASL A					;$B9E918   |
	STA $24,x				;$B9E919   |
	STZ $08,x				;$B9E91B   |
	RTS					;$B9E91D  /

CODE_B9E91E:
	BIT $24,x				;$B9E91E  \
	BPL CODE_B9E928				;$B9E920   |
	LDA #$FFFF				;$B9E922   |
	STA $24,x				;$B9E925   |
	RTS					;$B9E927  /

CODE_B9E928:
	LDA global_frame_counter		;$B9E928  \
	AND #$0007				;$B9E92A   |
	BNE CODE_B9E936				;$B9E92D   |
	LDY #$0052				;$B9E92F   |
	JSL CODE_BB8412				;$B9E932   |
CODE_B9E936:					;	   |
	RTS					;$B9E936  /

CODE_B9E937:
	LDA #$FD80				;$B9E937  \
	BIT $12,x				;$B9E93A   |
	BVC CODE_B9E941				;$B9E93C   |
	LDA #$0280				;$B9E93E   |
CODE_B9E941:					;	   |
	STA $20,x				;$B9E941   |
	EOR #$FFFF				;$B9E943   |
	INC A					;$B9E946   |
	CMP #$8000				;$B9E947   |
	ROR A					;$B9E94A   |
	STA $26,x				;$B9E94B   |
	INC $53,x				;$B9E94D   |
	RTS					;$B9E94F  /

CODE_B9E950:
	LDA #$FC80				;$B9E950  \
	STA $24,x				;$B9E953   |
	INC $53,x				;$B9E955   |
	RTS					;$B9E957  /

CODE_B9E958:
	DEC $50,x				;$B9E958  \
	BPL CODE_B9E96B				;$B9E95A   |
	LDA $2F,x				;$B9E95C   |
	AND #$00FF				;$B9E95E   |
	CMP #$0001				;$B9E961   |
	BNE CODE_B9E96B				;$B9E964   |
	INC $2F,x				;$B9E966   |
	BRL process_anim_script			;$B9E968  /

CODE_B9E96B:
	BRL CODE_B9D12B				;$B9E96B  /

CODE_B9E96E:
	INC $19BC				;$B9E96E  \
	RTS					;$B9E971  /

turn_kutlass_if_needed:
	LDY #$016A				;$B9E972  \
	JMP turn_sprite_if_needed		;$B9E975  /

CODE_B9E978:
	LDA $48,x				;$B9E978  \
	DEC $5C,x				;$B9E97A   |
	BMI CODE_B9E987				;$B9E97C   |
	CMP #$8000				;$B9E97E   |
	ROR A					;$B9E981   |
	CLC					;$B9E982   |
	ADC $48,x				;$B9E983   |
	BRA CODE_B9E988				;$B9E985  /

CODE_B9E987:
	ASL A					;$B9E987  \
CODE_B9E988:					;	   |
	BPL CODE_B9E98E				;$B9E988   |
	EOR #$FFFF				;$B9E98A   |
	INC A					;$B9E98D   |
CODE_B9E98E:					;	   |
	BIT $12,x				;$B9E98E   |
	BVC CODE_B9E996				;$B9E990   |
	EOR #$FFFF				;$B9E992   |
	INC A					;$B9E995   |
CODE_B9E996:					;	   |
	STA $26,x				;$B9E996   |
	STA $20,x				;$B9E998   |
	LDA $1A,x				;$B9E99A   |
	SEC					;$B9E99C   |
	SBC #$0F54				;$B9E99D   |
	CMP #$0020				;$B9E9A0   |
	BCS CODE_B9E9AF				;$B9E9A3   |
	LSR A					;$B9E9A5   |
	STA $32					;$B9E9A6   |
	LSR A					;$B9E9A8   |
	ADC $32					;$B9E9A9   |
	ADC $3C,x				;$B9E9AB   |
	STA $3C,x				;$B9E9AD   |
CODE_B9E9AF:					;	   |
	RTS					;$B9E9AF  /

CODE_B9E9B0:
	LDA $4B,x				;$B9E9B0  \
	AND #$00FF				;$B9E9B2   |
	CMP #$0001				;$B9E9B5   |
	BCC CODE_B9E9BC				;$B9E9B8   |
	DEC $4B,x				;$B9E9BA   |
CODE_B9E9BC:					;	   |
	RTS					;$B9E9BC  /

CODE_B9E9BD:
	LDA $1D,x				;$B9E9BD  \
	AND #$00FF				;$B9E9BF   |
	DEC A					;$B9E9C2   |
	CMP #$8000				;$B9E9C3   |
	BCS CODE_B9E9CA				;$B9E9C6   |
	DEC $1D,x				;$B9E9C8   |
CODE_B9E9CA:					;	   |
	RTS					;$B9E9CA  /

turn_krook_if_needed:
	LDY #$01EF				;$B9E9CB  \
	JMP turn_sprite_if_needed		;$B9E9CE  /

CODE_B9E9D1:
	LDY #$000A				;$B9E9D1  \
	JSL CODE_BB842C				;$B9E9D4   |
	LDY alternate_sprite			;$B9E9D8   |
	LDX current_sprite			;$B9E9DA   |
	STY $50,x				;$B9E9DC   |
	STX $50,y				;$B9E9DE   |
	RTS					;$B9E9E0  /

CODE_B9E9E1:
	LDA $50,x				;$B9E9E1  \
	BNE CODE_B9E9EE				;$B9E9E3   |
	LDA #DATA_F95EF2			;$B9E9E5   |
	STA $3C,x				;$B9E9E8   |
	STZ $38,x				;$B9E9EA   |
	STZ $3E,x				;$B9E9EC   |
CODE_B9E9EE:					;	   |
	RTS					;$B9E9EE  /

CODE_B9E9EF:
	LDA $10,x				;$B9E9EF  \
	AND #$00FF				;$B9E9F1   |
	BEQ CODE_B9EA05				;$B9E9F4   |
	DEC $10,x				;$B9E9F6   |
	SEC					;$B9E9F8   |
	RTS					;$B9E9F9  /

CODE_B9E9FA:
	LDA $11,x				;$B9E9FA  \
	AND #$00FF				;$B9E9FC   |
	BEQ CODE_B9EA05				;$B9E9FF   |
	DEC $11,x				;$B9EA01   |
	SEC					;$B9EA03   |
	RTS					;$B9EA04  /

CODE_B9EA05:
	CLC					;$B9EA05  \
	RTS					;$B9EA06  /

CODE_B9EA07:
	LDA $3A,x				;$B9EA07  \
	CMP #$0280				;$B9EA09   |
	BCC CODE_B9EA14				;$B9EA0C   |
	LDA #CODE_B9EA1A			;$B9EA0E   |
	STA $3E,x				;$B9EA11   |
	RTS					;$B9EA13  /

CODE_B9EA14:
	ADC #$0004				;$B9EA14  \
	STA $3A,x				;$B9EA17   |
	RTS					;$B9EA19  /

CODE_B9EA1A:
	LDA $3A,x				;$B9EA1A  \
	CMP #$0140				;$B9EA1C   |
	BCS CODE_B9EA24				;$B9EA1F   |
	STZ $3E,x				;$B9EA21   |
	RTS					;$B9EA23  /

CODE_B9EA24:
	SBC #$0004				;$B9EA24  \
	STA $3A,x				;$B9EA27   |
CODE_B9EA29:					;	   |
	LDA $3E,x				;$B9EA29   |
	CMP #$0001				;$B9EA2B   |
	RTS					;$B9EA2E  /

CODE_B9EA2F:
	STZ $52,x				;$B9EA2F  \
	RTS					;$B9EA31  /

CODE_B9EA32:
	LDA #$018C				;$B9EA32  \
	STA $52,x				;$B9EA35   |
	RTS					;$B9EA37  /

CODE_B9EA38:
	LDA #$018D				;$B9EA38  \
	STA $52,x				;$B9EA3B   |
	RTS					;$B9EA3D  /

CODE_B9EA3E:
	LDY #$0094				;$B9EA3E  \
	JSL CODE_BB842C				;$B9EA41   |
	LDX current_sprite			;$B9EA45   |
	BCS CODE_B9EA4D				;$B9EA47   |
	LDA alternate_sprite			;$B9EA49   |
	STA $4E,x				;$B9EA4B   |
CODE_B9EA4D:					;	   |
	RTS					;$B9EA4D  /

CODE_B9EA4E:
	LDY $4E,x				;$B9EA4E  \
	LDA #$0001				;$B9EA50   |
	STA $0042,y				;$B9EA53   |
	STZ $4E,x				;$B9EA56   |
	RTS					;$B9EA58  /

DATA_F9EA59:
	db $06, $14, $25, $06, $18, $25, $06, $1C
	db $25, $06, $20, $25, $03, $1C, $25, $03
	db $18, $25, $92, $50

DATA_F9EA6D:
	db $06, $14, $25, $06, $24, $25, $06, $28
	db $25, $08, $2C, $25, $08, $30, $25, $08
	db $34, $25, $92, $50

DATA_F9EA81:
	db $8E, $26, $05, $03, $C4, $24, $03, $C8
	db $24, $03, $CC, $24, $03, $D0, $24, $03
	db $D4, $24, $03, $D8, $24, $03, $DC, $24
	db $03, $E0, $24, $92, $50

CODE_B9EA9E:
	INC $3A,X				;$B9EA9E   |
	LDA $3A,x				;$B9EAA0   |
	CMP #$00C0				;$B9EAA2   |
	BCC CODE_B9EAAE				;$B9EAA5   |
	INC $2E,x				;$B9EAA7   |
	LDA #CODE_B9EAAF			;$B9EAA9   |
	STA $3E,x				;$B9EAAC   |
CODE_B9EAAE:					;	   |
	RTS					;$B9EAAE  /

CODE_B9EAAF:
	DEC $3A,x				;$B9EAAF  \
	LDA $3A,x				;$B9EAB1   |
	CMP #$0055				;$B9EAB3   |
	BCS CODE_B9EAAE				;$B9EAB6   |
	LDA #$0004				;$B9EAB8   |
	STA $2E,x				;$B9EABB   |
	RTS					;$B9EABD  /

CODE_B9EABE:
	LDA $10,x				;$B9EABE  \
	BEQ turn_kloak_if_needed		;$B9EAC0   |
	LDA #$02D2				;$B9EAC2   |
	JSL set_sprite_animation		;$B9EAC5   |
	RTS					;$B9EAC9  /
turn_kloak_if_needed:
	LDY #$02D1				;$B9EACA  \
	JMP turn_sprite_if_needed		;$B9EACD  /

CODE_B9EAD0:
	LDA $4E,x				;$B9EAD0  \
	LSR A					;$B9EAD2   |
	BCC CODE_B9EAFB				;$B9EAD3   |
	LDA #DATA_F96266			;$B9EAD5   |
	STA $3C,x				;$B9EAD8   |
	STZ $3E,x				;$B9EADA   |
	RTS					;$B9EADC  /

CODE_B9EADD:
	LDA $4E,x				;$B9EADD  \
	LSR A					;$B9EADF   |
	BCS CODE_B9EAFB				;$B9EAE0   |
	LDA #DATA_F962EC			;$B9EAE2   |
	STA $3C,x				;$B9EAE5   |
	STZ $3E,x				;$B9EAE7   |
	RTS					;$B9EAE9  /

CODE_B9EAEA:
	BIT $24,x				;$B9EAEA  \
	CLC					;$B9EAEC   |
	BMI CODE_B9EAFB				;$B9EAED   |
	LDA $52,x				;$B9EAEF   |
	AND #$00FF				;$B9EAF1   |
	SEC					;$B9EAF4   |
	SBC #$0004				;$B9EAF5   |
	CMP #$0001				;$B9EAF8   |
CODE_B9EAFB:					;	   |
	RTS					;$B9EAFB  /

CODE_B9EAFC:
	LDA $44,x				;$B9EAFC  \
	BEQ CODE_B9EB23				;$B9EAFE   |
	STZ $3E,x				;$B9EB00   |
	LDA #DATA_F96320			;$B9EB02   |
	STA $3C,x				;$B9EB05   |
	RTS					;$B9EB07  /

CODE_B9EB08:
	CPX $0D58				;$B9EB08  \
	BEQ CODE_B9EB23				;$B9EB0B   |
	CLC					;$B9EB0D   |
	RTS					;$B9EB0E  /

CODE_B9EB0F:
	LDY $4E,x				;$B9EB0F  \
	JSL CODE_BB8432				;$B9EB11   |
	BCS CODE_B9EB23				;$B9EB15   |
	LDY alternate_sprite			;$B9EB17   |
	LDA #$0854				;$B9EB19   |
	STA $001A,y				;$B9EB1C   |
	LDX current_sprite			;$B9EB1F   |
	STY $48,x				;$B9EB21   |
CODE_B9EB23:					;	   |
	RTS					;$B9EB23  /

CODE_B9EB24:
	LDA #$0009				;$B9EB24  \
	JSL CODE_B8D8BA				;$B9EB27   |
	RTS					;$B9EB2B  /

CODE_B9EB2C:
	LDA $4E,x				;$B9EB2C  \
	AND #$0003				;$B9EB2E   |
	CMP #$0003				;$B9EB31   |
	BNE CODE_B9EB93				;$B9EB34   |
	BRL CODE_B9EB90				;$B9EB36  /

CODE_B9EB39:
	LDA.l $000593				;$B9EB39  \
	TAX					;$B9EB3D   |
	LDA $2E,x				;$B9EB3E   |
	LDX current_sprite			;$B9EB40   |
	CMP #$0055				;$B9EB42   |
	BNE CODE_B9EB90				;$B9EB45   |
	PHB					;$B9EB47   |
	PHK					;$B9EB48   |
	PLB					;$B9EB49   |
	LDA #$000E				;$B9EB4A   |
	JSL CODE_B8D8BA				;$B9EB4D   |
	PLB					;$B9EB51   |
	BCS CODE_B9EB93				;$B9EB52   |
	LDA #$056F				;$B9EB54   |
	JSL queue_sound_effect			;$B9EB57   |
	LDX current_sprite			;$B9EB5B   |
	LDA $46,x				;$B9EB5D   |
	STA $000A86				;$B9EB5F   |
	LDA $48,x				;$B9EB63   |
	STA $000A88				;$B9EB65   |
	BRL process_anim_script			;$B9EB69  /

CODE_B9EB6C:
	LDA $4A,x				;$B9EB6C  \
	INC $4A,x				;$B9EB6E   |
	INC $4A,x				;$B9EB70   |
	STA $8E					;$B9EB72   |
	LDA [$8E]				;$B9EB74   |
	BMI CODE_B9EB7F				;$B9EB76   |
	STA $42,x				;$B9EB78   |
	LDA $54,x				;$B9EB7A   |
	STA $8E					;$B9EB7C   |
	RTS					;$B9EB7E  /

CODE_B9EB7F:
	LDY #$0002				;$B9EB7F  \
	LDA [$8E],y				;$B9EB82   |
	STA $4A,x				;$B9EB84   |
	BRA CODE_B9EB6C				;$B9EB86  /

CODE_B9EB88:
	LDA $42,x				;$B9EB88  \
	BEQ CODE_B9EB93				;$B9EB8A   |
	DEC $42,x				;$B9EB8C   |
	BNE CODE_B9EB93				;$B9EB8E   |
CODE_B9EB90:					;	   |
	BRL process_anim_script			;$B9EB90  /

CODE_B9EB93:
	BRL CODE_B9D12B				;$B9EB93  /

CODE_B9EB96:
	LDA $42,x				;$B9EB96  \
	BEQ CODE_B9EB93				;$B9EB98   |
	BRL process_anim_script			;$B9EB9A  /

CODE_B9EB9D:
	LDA $42,x				;$B9EB9D  \
	BNE CODE_B9EB93				;$B9EB9F   |
	BRL process_anim_script			;$B9EBA1  /

CODE_B9EBA4:
	LDA $4E,x				;$B9EBA4  \
	AND #$0003				;$B9EBA6   |
	CMP #$0003				;$B9EBA9   |
	BNE CODE_B9EBD6				;$B9EBAC   |
	LDA #$066E				;$B9EBAE   |
	JSL queue_sound_effect			;$B9EBB1   |
	LDX current_sprite			;$B9EBB5   |
	LDA $3C,x				;$B9EBB7   |
	STA $2C,x				;$B9EBB9   |
	LDA $1A,x				;$B9EBBB   |
	SEC					;$B9EBBD   |
	SBC #$22D0				;$B9EBBE   |
	BCC CODE_B9EBD6				;$B9EBC1   |
	CMP #$000C				;$B9EBC3   |
	BCC CODE_B9EBCB				;$B9EBC6   |
	LDA #$000C				;$B9EBC8   |
CODE_B9EBCB:					;	   |
	LSR A					;$B9EBCB   |
	TAY					;$B9EBCC   |
	LDA DATA_B9EBD7,y			;$B9EBCD   |
	STA $3C,x				;$B9EBD0   |
	STZ $3E,x				;$B9EBD2   |
	STZ $38,x				;$B9EBD4   |
CODE_B9EBD6:					;	   |
	RTS					;$B9EBD6  /

DATA_B9EBD7:
	dw DATA_B9EBDF
	dw DATA_B9EBF0
	dw DATA_B9EC01
	dw DATA_B9EC12

DATA_B9EBDF:
	db $03, $CC, $22, $03, $C8, $22, $03, $CC
	db $22, $03, $D0, $22, $84 : dw CODE_B9EBA4 : db $92, $2C

DATA_B9EBF0:
	db $03, $D0, $22, $03, $CC, $22, $03, $D0
	db $22, $03, $D4, $22, $84 : dw CODE_B9EBA4 : db $92, $2C

DATA_B9EC01:
	db $03, $D4, $22, $03, $D0, $22, $03, $D4
	db $22, $03, $D8, $22, $84 : dw CODE_B9EBA4 : db $92, $2C

DATA_B9EC12:
	db $03, $D8, $22, $03, $D4, $22, $03, $D8
	db $22, $03, $DC, $22, $84 : dw CODE_B9EBA4 : db $92, $2C

CODE_B9EC23:
	LDA $46,x				;$B9EC23   |
	LSR A					;$B9EC25   |
	BCC CODE_B9EC2D				;$B9EC26   |
	INC $46,x				;$B9EC28   |
	BRL process_anim_script			;$B9EC2A  /

CODE_B9EC2D:
	BRL CODE_B9D12B				;$B9EC2D  /

CODE_B9EC30:
	LDA $4E,x				;$B9EC30  \
	CMP #$0001				;$B9EC32   |
	RTS					;$B9EC35  /

CODE_B9EC36:
	LDA $4A,x				;$B9EC36  \
	BIT #$0080				;$B9EC38   |
	BEQ CODE_B9EC4A				;$B9EC3B   |
	LDA #DATA_F9654C			;$B9EC3D   |
	STA $3C,x				;$B9EC40   |
	STZ $38,x				;$B9EC42   |
	LDA #CODE_B9EC4A			;$B9EC44   |
	STA $3E,x				;$B9EC47   |
	RTS					;$B9EC49  /

CODE_B9EC4A:
	LDA $48,x				;$B9EC4A  \
	CMP #$0009				;$B9EC4C   |
	BEQ CODE_B9EC66				;$B9EC4F   |
	LDA #DATA_F96504			;$B9EC51   |
	STA $3C,x				;$B9EC54   |
	STZ $3E,x				;$B9EC56   |
	STZ $38,x				;$B9EC58   |
	LDA $48,x				;$B9EC5A   |
	AND #$00FF				;$B9EC5C   |
	ASL A					;$B9EC5F   |
	ASL A					;$B9EC60   |
	ADC #$2B08				;$B9EC61   |
	STA $1A,x				;$B9EC64   |
CODE_B9EC66:					;	   |
	RTS					;$B9EC66  /

CODE_B9EC67:
	STZ $3E,x				;$B9EC67  \
	LDA $48,x				;$B9EC69   |
	CMP #$0009				;$B9EC6B   |
	BNE CODE_B9EC88				;$B9EC6E   |
	PHX					;$B9EC70   |
	LDA $42,x				;$B9EC71   |
	TAX					;$B9EC73   |
	LDA $0E,x				;$B9EC74   |
	PLX					;$B9EC76   |
	CMP #$0000				;$B9EC77   |
	BNE CODE_B9EC88				;$B9EC7A   |
	LDA $4A,x				;$B9EC7C   |
	BIT #$0100				;$B9EC7E   |
	BNE CODE_B9ECDC				;$B9EC81   |
	BIT #$0080				;$B9EC83   |
	BNE CODE_B9EC9C				;$B9EC86   |
CODE_B9EC88:					;	   |
	LDA $48,x				;$B9EC88   |
	AND #$00FF				;$B9EC8A   |
	ASL A					;$B9EC8D   |
	ASL A					;$B9EC8E   |
	ADC #$2B08				;$B9EC8F   |
	STA $1A,x				;$B9EC92   |
	LDA #$0100				;$B9EC94   |
	STA $38,x				;$B9EC97   |
	BRL CODE_B9D12B				;$B9EC99  /

CODE_B9EC9C:
	LDA $06,x				;$B9EC9C  \
	CMP $04,x				;$B9EC9E   |
	BCS CODE_B9ECCE				;$B9ECA0   |
	LDA.l $000593				;$B9ECA2   |
	TAX					;$B9ECA6   |
	LDA $06,x				;$B9ECA7   |
	SEC					;$B9ECA9   |
	LDX current_sprite			;$B9ECAA   |
	SBC $06,x				;$B9ECAC   |
	CLC					;$B9ECAE   |
	ADC #$0040				;$B9ECAF   |
	CMP #$FF00				;$B9ECB2   |
	BCC CODE_B9EC88				;$B9ECB5   |
	LDA $42,x				;$B9ECB7   |
	TAX					;$B9ECB9   |
	LDA $3E,x				;$B9ECBA   |
	AND #$FF7F				;$B9ECBC   |
	STA $3E,x				;$B9ECBF   |
	LDX current_sprite			;$B9ECC1   |
	TYA					;$B9ECC3   |
	CLC					;$B9ECC4   |
	ADC #$0003				;$B9ECC5   |
	TAY					;$B9ECC8   |
	STZ $38,x				;$B9ECC9   |
	BRL process_anim_script			;$B9ECCB  /

CODE_B9ECCE:
	LDA $42,x				;$B9ECCE  \
	TAX					;$B9ECD0   |
	LDA $3E,x				;$B9ECD1   |
	AND #$FF7F				;$B9ECD3   |
	STA $3E,x				;$B9ECD6   |
	LDX current_sprite			;$B9ECD8   |
	BRA CODE_B9EC88				;$B9ECDA  /

CODE_B9ECDC:
	PHX					;$B9ECDC  \
	LDA $42,x				;$B9ECDD   |
	TAX					;$B9ECDF   |
	LDA $3E,x				;$B9ECE0   |
	AND #$FEFF				;$B9ECE2   |
	STA $3E,x				;$B9ECE5   |
	PLX					;$B9ECE7   |
	STZ $38,x				;$B9ECE8   |
	BRL process_anim_script			;$B9ECEA  /

CODE_B9ECED:
	LDY $42,x				;$B9ECED  \
	LDA $000E,y				;$B9ECEF   |
	BNE CODE_B9ECF5				;$B9ECF2   |
	RTS					;$B9ECF4  /

CODE_B9ECF5:
	STZ $3E,x				;$B9ECF5  \
	LDY $42,x				;$B9ECF7   |
	STZ $42,x				;$B9ECF9   |
	LDA $44,x				;$B9ECFB   |
	BEQ CODE_B9ED06				;$B9ECFD   |
	LDA #$0000				;$B9ECFF   |
	STA $0048,y				;$B9ED02   |
	RTS					;$B9ED05  /

CODE_B9ED06:
	STA $0046,y				;$B9ED06  \
	RTS					;$B9ED09  /

CODE_B9ED0A:
	LDA $22,x				;$B9ED0A  \
	EOR $12,x				;$B9ED0C   |
	AND #$4000				;$B9ED0E   |
	BEQ CODE_B9ED1B				;$B9ED11   |
	LDA #$02DE				;$B9ED13   |
	JSL set_sprite_animation		;$B9ED16   |
	RTS					;$B9ED1A  /

CODE_B9ED1B:
	LDA $28,x				;$B9ED1B  \
	STA $3A,x				;$B9ED1D   |
	RTS					;$B9ED1F  /

CODE_B9ED20:
	LDA $20,x				;$B9ED20  \
	CLC					;$B9ED22   |
	ADC $26,x				;$B9ED23   |
	BPL CODE_B9ED2B				;$B9ED25   |
	EOR #$FFFF				;$B9ED27   |
	INC A					;$B9ED2A   |
CODE_B9ED2B:					;	   |
	LSR A					;$B9ED2B   |
	CMP #$0018				;$B9ED2C   |
	BCS CODE_B9ED34				;$B9ED2F   |
	LDA #$0018				;$B9ED31   |
CODE_B9ED34:					;	   |
	STA $3A,x				;$B9ED34   |
	LDA $3C,x				;$B9ED36   |
	CMP #DATA_F96600			;$B9ED38   |
	ROR A					;$B9ED3B   |
	EOR $26,x				;$B9ED3C   |
	BPL CODE_B9ED6E				;$B9ED3E   |
	BIT $26,x				;$B9ED40   |
	BPL CODE_B9ED5B				;$B9ED42   |
	LDA $1A,x				;$B9ED44   |
	SEC					;$B9ED46   |
	SBC #$2CAC				;$B9ED47   |
	LSR A					;$B9ED4A   |
	STA $5E					;$B9ED4B   |
	LSR A					;$B9ED4D   |
	CLC					;$B9ED4E   |
	ADC $5E					;$B9ED4F   |
	EOR #$FFFF				;$B9ED51   |
	SEC					;$B9ED54   |
	ADC #DATA_F96609			;$B9ED55   |
	STA $3C,x				;$B9ED58   |
	RTS					;$B9ED5A  /

CODE_B9ED5B:
	LDA $1A,x				;$B9ED5B  \
	SEC					;$B9ED5D   |
	SBC #$2CAC				;$B9ED5E   |
	LSR A					;$B9ED61   |
	STA $5E					;$B9ED62   |
	LSR A					;$B9ED64   |
	CLC					;$B9ED65   |
	ADC $5E					;$B9ED66   |
	CLC					;$B9ED68   |
	ADC #DATA_F965F4			;$B9ED69   |
	STA $3C,x				;$B9ED6C   |
CODE_B9ED6E:					;	   |
	RTS					;$B9ED6E  /

CODE_B9ED6F:
	LDA $2E,x				;$B9ED6F  \
	CMP #$0001				;$B9ED71   |
	BEQ CODE_B9ED77				;$B9ED74   |
	CLC					;$B9ED76   |
CODE_B9ED77:					;	   |
	RTS					;$B9ED77  /

CODE_B9ED78:
	LDA #$00D0				;$B9ED78  \
	STA $02,x				;$B9ED7B   |
	LDA $44,x				;$B9ED7D   |
	BIT $12,x				;$B9ED7F   |
	BVC CODE_B9ED87				;$B9ED81   |
	EOR #$FFFF				;$B9ED83   |
	INC A					;$B9ED86   |
CODE_B9ED87:					;	   |
	STA $26,x				;$B9ED87   |
	ASL A					;$B9ED89   |
	STA $20,x				;$B9ED8A   |
	RTS					;$B9ED8C  /

CODE_B9ED8D:
	LDA #$0147				;$B9ED8D  \
	JSL CODE_B9D07B				;$B9ED90   |
	RTS					;$B9ED94  /

CODE_B9ED95:
	LDA $1E,x				;$B9ED95  \
	AND #$1001				;$B9ED97   |
	BEQ CODE_B9EDA1				;$B9ED9A   |
	LDA #$FD00				;$B9ED9C   |
	STA $24,x				;$B9ED9F   |
CODE_B9EDA1:					;	   |
	RTS					;$B9EDA1  /

CODE_B9EDA2:
	LDA #$00D0				;$B9EDA2  \
	STA $02,x				;$B9EDA5   |
	LDA $44,x				;$B9EDA7   |
	LSR A					;$B9EDA9   |
	LSR A					;$B9EDAA   |
	BIT $12,x				;$B9EDAB   |
	BVC CODE_B9EDB3				;$B9EDAD   |
	EOR #$FFFF				;$B9EDAF   |
	INC A					;$B9EDB2   |
CODE_B9EDB3:					;	   |
	STA $26,x				;$B9EDB3   |
	ASL A					;$B9EDB5   |
	STA $20,x				;$B9EDB6   |
	RTS					;$B9EDB8  /

CODE_B9EDB9:
	LDA #$00D0				;$B9EDB9  \
	STA $02,x				;$B9EDBC   |
	LDA $44,x				;$B9EDBE   |
	BIT $12,x				;$B9EDC0   |
	BVC CODE_B9EDC8				;$B9EDC2   |
	EOR #$FFFF				;$B9EDC4   |
	INC A					;$B9EDC7   |
CODE_B9EDC8:					;	   |
	STA $26,x				;$B9EDC8   |
	ASL A					;$B9EDCA   |
	STA $20,x				;$B9EDCB   |
	RTS					;$B9EDCD  /

CODE_B9EDCE:
	LDA #$00F0				;$B9EDCE  \
	STA $02,x				;$B9EDD1   |
	RTS					;$B9EDD3  /

CODE_B9EDD4:
	LDA #$0001				;$B9EDD4  \
	TSB $0500				;$B9EDD7   |
	RTS					;$B9EDDA  /

CODE_B9EDDB:
	DEC $092E				;$B9EDDB  \
	LDA $092E				;$B9EDDE   |
	AND #$00FF				;$B9EDE1   |
	BNE CODE_B9EDE9				;$B9EDE4   |
	STA $0929				;$B9EDE6   |
CODE_B9EDE9:					;	   |
	JMP CODE_B9E511				;$B9EDE9  /

CODE_B9EDEC:
	DEC $44,x				;$B9EDEC  \
	BMI CODE_B9EDF1				;$B9EDEE   |
	RTS					;$B9EDF0  /

CODE_B9EDF1:
	LDA #$02A8				;$B9EDF1  \
	JSL set_sprite_animation		;$B9EDF4   |
	RTS					;$B9EDF8  /

CODE_B9EDF9:
	LDA #$0002				;$B9EDF9  \
	STA $2E,x				;$B9EDFC   |
	RTS					;$B9EDFE  /

CODE_B9EDFF:
	LDA $46,x				;$B9EDFF  \
	STA $44,x				;$B9EE01   |
	LDA #$02A6				;$B9EE03   |
	JSL set_sprite_animation		;$B9EE06   |
	RTS					;$B9EE0A  /

CODE_B9EE0B:
	DEC $44,x				;$B9EE0B  \
	BMI CODE_B9EE10				;$B9EE0D   |
	RTS					;$B9EE0F  /

CODE_B9EE10:
	LDA #$02A9				;$B9EE10  \
	JSL set_sprite_animation		;$B9EE13   |
	RTS					;$B9EE17  /

CODE_B9EE18:
	LDA #$0003				;$B9EE18  \
	STA $2E,x				;$B9EE1B   |
	RTS					;$B9EE1D  /

CODE_B9EE1E:
	LDA $48,x				;$B9EE1E  \
	STA $44,x				;$B9EE20   |
	LDA #$02A7				;$B9EE22   |
	JSL set_sprite_animation		;$B9EE25   |
	RTS					;$B9EE29  /

CODE_B9EE2A:
	LDY $0593				;$B9EE2A  \
	LDA $0012,y				;$B9EE2D   |
	EOR $12,x				;$B9EE30   |
	AND #$4000				;$B9EE32   |
	BNE CODE_B9EE38				;$B9EE35   |
	RTS					;$B9EE37  /

CODE_B9EE38:
	LDA #$02CF				;$B9EE38  \
	JSL set_sprite_animation		;$B9EE3B   |
	RTS					;$B9EE3F  /

CODE_B9EE40:
	JSR CODE_B9E019				;$B9EE40  \
	LDA #$02CE				;$B9EE43   |
	JSL set_sprite_animation		;$B9EE46   |
	RTS					;$B9EE4A  /

CODE_B9EE4B:
	LDA $08C2				;$B9EE4B  \
	AND #$4000				;$B9EE4E   |
	BEQ CODE_B9EE54				;$B9EE51   |
	RTS					;$B9EE53  /

CODE_B9EE54:
	LDX #$051B				;$B9EE54  \
	LDY #$051B				;$B9EE57   |
	JSL CODE_B89182				;$B9EE5A   |
	RTS					;$B9EE5E  /

CODE_B9EE5F:
	LDA $1C,x				;$B9EE5F  \
	CMP #$C000				;$B9EE61   |
	BEQ CODE_B9EE98				;$B9EE64   |
	LDA $48,x				;$B9EE66   |
	TAY					;$B9EE68   |
	LDA $0000,y				;$B9EE69   |
	CMP #$011C				;$B9EE6C   |
	BNE CODE_B9EE72				;$B9EE6F   |
	RTS					;$B9EE71  /

CODE_B9EE72:
	LDY.w #DATA_FF164E			;$B9EE72  \
	JSL CODE_BB8432				;$B9EE75   |
	BCS CODE_B9EE98				;$B9EE79   |
	LDY alternate_sprite			;$B9EE7B   |
	LDA current_sprite			;$B9EE7D   |
	STA $0042,y				;$B9EE7F   |
	TYA					;$B9EE82   |
	LDX current_sprite			;$B9EE83   |
	STA $48,x				;$B9EE85   |
	TXA					;$B9EE87   |
	CMP alternate_sprite			;$B9EE88   |
	BMI CODE_B9EE98				;$B9EE8A   |
	LDY alternate_sprite			;$B9EE8C   |
	LDA $0038,y				;$B9EE8E   |
	SEC					;$B9EE91   |
	SBC #$0100				;$B9EE92   |
	STA $0038,y				;$B9EE95   |
CODE_B9EE98:					;	   |
	RTS					;$B9EE98  /

CODE_B9EE99:
	LDA #$0002				;$B9EE99  \
	STA $2E,x				;$B9EE9C   |
	RTS					;$B9EE9E  /

CODE_B9EE9F:
	LDY #$0048				;$B9EE9F  \
	JSL CODE_BB842C				;$B9EEA2   |
	RTS					;$B9EEA6  /

CODE_B9EEA7:
	JSL CODE_BB82B8				;$B9EEA7  \
	LDA $6E					;$B9EEAB   |
	BNE CODE_B9EEC9				;$B9EEAD   |
	LDX current_sprite			;$B9EEAF   |
	LDA $2E,x				;$B9EEB1   |
	CMP #$0004				;$B9EEB3   |
	BEQ CODE_B9EEC9				;$B9EEB6   |
	LDA $42,x				;$B9EEB8   |
	SEC					;$B9EEBA   |
	SBC #$02AC				;$B9EEBB   |
	ASL A					;$B9EEBE   |
	TAX					;$B9EEBF   |
	LDA.l DATA_FF0D64,x			;$B9EEC0   |
	TAY					;$B9EEC4   |
	JSL CODE_BB8432				;$B9EEC5   |
CODE_B9EEC9:					;	   |
	RTS					;$B9EEC9  /

CODE_B9EECA:
	RTL					;$B9EECA  |

CODE_B9EECB:
	LDA #$0080				;$B9EECB  \
	TSB $0B02				;$B9EECE   |
	STZ $20,x				;$B9EED1   |
	STZ $26,x				;$B9EED3   |
	LDA #$0001				;$B9EED5   |
	STA $2E,x				;$B9EED8   |
	RTS					;$B9EEDA  /

CODE_B9EEDB:
	LDA #$0080				;$B9EEDB  \
	TRB $0B02				;$B9EEDE   |
	RTS					;$B9EEE1  /

CODE_B9EEE2:
	LDA #$0003				;$B9EEE2  \
	STA $2E,x				;$B9EEE5   |
	RTS					;$B9EEE7  /

CODE_B9EEE8:
	JMP CODE_B9E511				;$B9EEE8  |

CODE_B9EEEB:
	LDY #$001C				;$B9EEEB  \
	JSL CODE_BB842C				;$B9EEEE   |
	RTS					;$B9EEF2  /

CODE_B9EEF3:
	JSL CODE_BB82B8				;$B9EEF3  \
	RTS					;$B9EEF7  /

CODE_B9EEF8:
	LDA #$014B				;$B9EEF8  \
	JSL set_sprite_animation		;$B9EEFB   |
	RTS					;$B9EEFF  /

CODE_B9EF00:
	LDA $44,x				;$B9EF00  \
if !version == 1				;	   |
	CMP $0915				;$B9EF02   |
	BCC CODE_B9EF0A				;$B9EF05   |
endif						;	   |
	STA $0915				;$B9EF07   |
CODE_B9EF0A:					;	   |
	LDA #$066E				;$B9EF0A   |
	JSL queue_sound_effect			;$B9EF0D   |
	RTS					;$B9EF11  /

CODE_B9EF12:
	LDY #$00DE				;$B9EF12  \
	JSL CODE_BB8412				;$B9EF15   |
	RTS					;$B9EF19  /

CODE_B9EF1A:
	LDA #$01B7				;$B9EF1A  \
	JSL set_sprite_animation		;$B9EF1D   |
	RTS					;$B9EF21  /

CODE_B9EF22:
	STZ $20,x				;$B9EF22  \
	RTS					;$B9EF24  /

CODE_B9EF25:
	LDA #$0026				;$B9EF25  \
	JSL CODE_B8D8BA				;$B9EF28   |
	RTS					;$B9EF2C  /

CODE_B9EF2D:
	JSL CODE_B68CC2				;$B9EF2D  \
	RTS					;$B9EF31  /

CODE_B9EF32:
	JSL CODE_B68CE1				;$B9EF32  \
	RTS					;$B9EF36  /

CODE_B9EF37:
	JSL CODE_B68CB7				;$B9EF37  \
	RTS					;$B9EF3B  /

CODE_B9EF3C:
	JSL CODE_B69D96				;$B9EF3C  \
	RTS					;$B9EF40  /

CODE_B9EF41:
	INC $2E,x				;$B9EF41  \
	RTS					;$B9EF43  /

CODE_B9EF44:
	LDA.l $0006A3				;$B9EF44  \
	ORA #$4000				;$B9EF48   |
	STA $0006A3				;$B9EF4B   |
	RTS					;$B9EF4F  /

CODE_B9EF50:
	JSL CODE_B69043				;$B9EF50  \
	RTS					;$B9EF54  /

CODE_B9EF55:
	JSL CODE_B6A838				;$B9EF55  \
	RTS					;$B9EF59  /

CODE_B9EF5A:
	LDX $0593				;$B9EF5A  \
	LDA $2E,x				;$B9EF5D   |
	CMP #$0005				;$B9EF5F   |
	BEQ CODE_B9EF76				;$B9EF62   |
	LDY #$0004				;$B9EF64   |
	LDA level_number			;$B9EF67   |
	CMP #$006B				;$B9EF69   |
	BNE CODE_B9EF71				;$B9EF6C   |
	LDY #$000B				;$B9EF6E   |
CODE_B9EF71:					;	   |
	TYA					;$B9EF71   |
	JSL CODE_BBC16B				;$B9EF72   |
CODE_B9EF76:					;	   |
	RTS					;$B9EF76  /

CODE_B9EF77:
	JSL CODE_B6A3F4				;$B9EF77  \
	RTS					;$B9EF7B  /

CODE_B9EF7C:
	JSL CODE_B6A40F				;$B9EF7C  \
	RTS					;$B9EF80  /

CODE_B9EF81:
	JSL CODE_B6A41C				;$B9EF81  \
	RTS					;$B9EF85  /

CODE_B9EF86:
	JSL CODE_B6A421				;$B9EF86  \
	RTS					;$B9EF8A  /

CODE_B9EF8B:
	JSL CODE_B6A7E8				;$B9EF8B  \
	RTS					;$B9EF8F  /

CODE_B9EF90:
	JSL CODE_B6AD8B				;$B9EF90  \
	RTS					;$B9EF94  /

CODE_B9EF95:
	JSL CODE_B6AD93				;$B9EF95  \
	RTS					;$B9EF99  /

CODE_B9EF9A:
	INC $0A,x				;$B9EF9A  \
	RTS					;$B9EF9C  /

CODE_B9EF9D:
	JSL CODE_B6ACD8				;$B9EF9D  \
	RTS					;$B9EFA1  /

CODE_B9EFA2:
	JSL CODE_B6A3CE				;$B9EFA2  \
	RTS					;$B9EFA6  /

CODE_B9EFA7:
	JSL CODE_B6A8E0				;$B9EFA7  \
	RTS					;$B9EFAB  /

CODE_B9EFAC:
	JSL CODE_B6ABCB				;$B9EFAC  \
	RTS					;$B9EFB0  /

CODE_B9EFB1:
	JSL CODE_B69493				;$B9EFB1  \
	RTS					;$B9EFB5  /

CODE_B9EFB6:
	JSL CODE_B69499				;$B9EFB6  \
	RTS					;$B9EFBA  /

CODE_B9EFBB:
	JSL CODE_B6A892				;$B9EFBB  \
	RTS					;$B9EFBF  /

CODE_B9EFC0:
	JSL CODE_B6AD0D				;$B9EFC0  \
	RTS					;$B9EFC4  /

CODE_B9EFC5:
	JSL CODE_B6AA9B				;$B9EFC5  \
	RTS					;$B9EFC9  /

CODE_B9EFCA:
	JSL CODE_B6AAA4				;$B9EFCA  \
	RTS					;$B9EFCE  /

CODE_B9EFCF:
	JSL CODE_B6AA8B				;$B9EFCF  \
	RTS					;$B9EFD3  /

CODE_B9EFD4:
	JSL CODE_B6AA93				;$B9EFD4  \
	RTS					;$B9EFD8  /

CODE_B9EFD9:
	JSL CODE_B6AABE				;$B9EFD9  \
	RTS					;$B9EFDD  /

CODE_B9EFDE:
	JSL CODE_B6AAAA				;$B9EFDE  \
	RTS					;$B9EFE2  /

CODE_B9EFE3:
	JSL CODE_B6AC99				;$B9EFE3  \
	RTS					;$B9EFE7  /

CODE_B9EFE8:
	JSL CODE_BA9751				;$B9EFE8  \
	RTS					;$B9EFEC  /

CODE_B9EFED:
	JSL CODE_BA943A				;$B9EFED  \
	RTS					;$B9EFF1  /

CODE_B9EFF2:
	JSL CODE_BA9450				;$B9EFF2  \
	RTS					;$B9EFF6  /

CODE_B9EFF7:
	JSL CODE_B6DD63				;$B9EFF7  \
	RTS					;$B9EFFB  /

CODE_B9EFFC:
	JSL CODE_B6DBF6				;$B9EFFC  \
	RTS					;$B9F000  /

CODE_B9F001:
	JSL CODE_B6DBBA				;$B9F001  \
	RTS					;$B9F005  /

CODE_B9F006:
	JSL CODE_B6DBD2				;$B9F006  \
	RTS					;$B9F00A  /

CODE_B9F00B:
	JSL CODE_B6DB36				;$B9F00B  \
	RTS					;$B9F00F  /

CODE_B9F010:
	JSL CODE_B6DBE0				;$B9F010  \
	RTS					;$B9F014  /

CODE_B9F015:
	JSL CODE_B6DC2B				;$B9F015  \
	RTS					;$B9F019  /

CODE_B9F01A:
	JSL CODE_B6DC3F				;$B9F01A  \
	RTS					;$B9F01E  /

CODE_B9F01F:
	JSL CODE_B6CA9E				;$B9F01F  \
	RTS					;$B9F023  /

CODE_B9F024:
	JSL CODE_B6CF91				;$B9F024  \
	RTS					;$B9F028  /

CODE_B9F029:
	JSL CODE_B6CF96				;$B9F029  \
	RTS					;$B9F02D  /

CODE_B9F02E:
	JSL CODE_B6CF9B				;$B9F02E  \
	RTS					;$B9F032  /

CODE_B9F033:
	JSL CODE_B6CFA0				;$B9F033  \
	RTS					;$B9F037  /

CODE_B9F038:
	JSL CODE_B6CFA5				;$B9F038  \
	RTS					;$B9F03C  /

CODE_B9F03D:
	JSL CODE_B6CFAA				;$B9F03D  \
	RTS					;$B9F041  /

CODE_B9F042:
	JSL CODE_B6CFCA				;$B9F042  \
	RTS					;$B9F046  /

CODE_B9F047:
	JSL CODE_B6CFD1				;$B9F047  \
	RTS					;$B9F04B  /

CODE_B9F04C:
	JSL CODE_B6CFD8				;$B9F04C  \
	RTS					;$B9F050  /

CODE_B9F051:
	JSL CODE_B6F753				;$B9F051  \
	RTS					;$B9F055  /

CODE_B9F056:
	JSL CODE_B6F71A				;$B9F056  \
	RTS					;$B9F05A  /

CODE_B9F05B:
	JSL CODE_B6F725				;$B9F05B  \
	RTS					;$B9F05F  /

CODE_B9F060:
	JSL CODE_B6F72F				;$B9F060  \
	RTS					;$B9F064  /

CODE_B9F065:
	JSL CODE_B6F746				;$B9F065  \
	RTS					;$B9F069  /

CODE_B9F06A:
	JSL CODE_B6F904				;$B9F06A  \
	RTS					;$B9F06E  /

CODE_B9F06F:
	JSL CODE_BB8158				;$B9F06F  \
	LDA #$0027				;$B9F073   |
	JSL CODE_B8D8BA				;$B9F076   |
	RTS					;$B9F07A  /

CODE_B9F07B:
	JSL CODE_B8A691				;$B9F07B  \
	RTS					;$B9F07F  /

CODE_B9F080:
	JSL CODE_BAC256				;$B9F080  \
	RTS					;$B9F084  /

DATA_B9F085:
	db $CC, $08, $D0, $08, $D4, $08, $D8, $08
	db $DC, $08, $E0, $08, $E4, $08, $E8, $08
	db $AC, $08, $B0, $08, $B4, $08, $B8, $08
	db $BC, $08, $C0, $08, $C4, $08, $C8, $08

DATA_B9F0A5:
	db $18, $03, $1C, $03, $20, $03, $24, $03
	db $28, $03, $2C, $03, $30, $03, $34, $03
	db $F8, $02, $FC, $02, $00, $03, $04, $03
	db $08, $03, $0C, $03, $10, $03, $14, $03

DATA_B9F0C5:
	db $44, $19, $B0, $23, $D0, $23, $F0, $23
	db $10, $24, $8C, $08, $68, $08, $60, $09
	db $E4, $10, $E4, $10, $E4, $10, $E4, $10
	db $80, $31, $80, $31, $80, $31, $80, $31
	db $CC, $0F, $28, $11, $84, $09, $5C, $09
	db $44, $19, $44, $19, $44, $19, $44, $19
	db $44, $19, $08, $33, $CC, $0F, $CC, $0F
