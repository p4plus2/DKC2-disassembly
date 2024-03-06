;Jump table for various Kong-to-object interaction routines (RAM address $0A82)
player_interaction_table:
	dw CODE_B89197				;0001: Swapping in water
	dw CODE_B89220				;0002: Swapping on land
	dw CODE_B8852B				;0003: Rejoining team-up after throwing partner upwards
	dw CODE_B8842B				;0004: Initiating team-up
	dw CODE_B8848E				;0005: Teamed up
	dw CODE_B884EC				;0006: Canceling team-up
	dw CODE_B88623				;0007: Getting stuck to honey on ground
	dw CODE_B885B8				;0008: Getting stuck to honey on wall
	dw CODE_B8871B				;0009: 14
	dw CODE_B8865B				;000A: 16
	dw CODE_B8811E				;000B: Stunned by enemy on ground (Kudgel)
	dw CODE_B880D2				;000C: 1A
	dw CODE_B89385				;000D: 1C
	dw CODE_B88755				;000E: Bouncing off of tire
	dw CODE_B89385				;000F: 20
	dw CODE_B89385				;0010: Entering barrel/cannon
	dw CODE_B886F3				;0011: Grabbing horizontal rope
	dw CODE_B8869E				;0012: Grabbing vertical rope
	dw CODE_B89319				;0013: 28
	dw CODE_B8934A				;0014: 2A
	dw CODE_B881E9				;0015: Mounting skull cart
	dw CODE_B88228				;0016: Jumping off skull cart
	dw CODE_B893AA				;0017: Mounting Animal Buddy
	dw CODE_B894C2				;0018: Dismounting Animal Buddy
	dw CODE_B88B15				;0019: Transforming Animal Buddy into item (crossing No-Animal sign)
	dw CODE_B8874D				;001A: 36
	dw CODE_B887D2				;001B: Defeating enemy by stomping
	dw CODE_B8857E				;001C: Defeating enemy by rolling
	dw CODE_B88911				;001D: Defeating enemy by team throw
	dw CODE_B88929				;001E: Knocked back by enemy
	dw CODE_B885D5				;001F: Stunned by K. Rool before being hit by his blunderbuss
	dw CODE_B88A4C				;0020: 42
	dw CODE_B88A92				;0021: 44
	dw CODE_B88C9D				;0022: 46
	dw CODE_B88CA3				;0023: Hurt by enemy/obstacle
	dw CODE_B8815F				;0024: Frozen by K. Rool's blue gas cloud
	dw CODE_B885F5				;0025: Slowed down by K. Rool's red gas cloud/reversed by K. Rool's purple gas cloud
	dw CODE_B8899C				;0026: Hurt by being hit by K. Rool's blunderbuss
	dw CODE_B88269				;0027: Collecting Kremkoin
	dw CODE_B88340				;0028: 52
	dw CODE_B88379				;0029: Falling into pit
	dw CODE_B88864				;002A: Hitting goal target
	dw CODE_B89385				;002B: Walking through an entrance/running off screen after hitting target
	dw CODE_B88421				;002C: 5A
	dw CODE_B8841C				;002D: Leaving level

CODE_B8805E:
	LDA $08C2				;$B8805E  \
	AND #$0002				;$B88061   |
	BNE CODE_B8806A				;$B88064   |
CODE_B88066:					;	   |
	JSR CODE_B8807D				;$B88066   |
	RTL					;$B88069  /

CODE_B8806A:
	LDA screen_brightness			;$B8806A  \
	BNE CODE_B88066				;$B8806D   |
	LDA #$0002				;$B8806F   |
	TRB $08C2				;$B88072   |
	LDA #$002D				;$B88075   |
	JSR set_player_interaction		;$B88078   |
	BRA CODE_B88066				;$B8807B  /

CODE_B8807D:
	PHK					;$B8807D  \
	PLB					;$B8807E   |
	LDA $0A82				;$B8807F   |
	BNE .process_interaction		;$B88082   |
	RTS					;$B88084   |
.process_interaction				;	   |
	STZ $0A82				;$B88085   |
	DEC A					;$B88088   |
	ASL A					;$B88089   |
	TAX					;$B8808A   |
	JMP (player_interaction_table,x)	;$B8808B  /

CODE_B8808E:
	JSR work_on_active_kong			;$B8808E  \
	RTL					;$B88091  /

work_on_active_kong:
	LDA $0595				;$B88092  \
	STA $66					;$B88095   |
	TAY					;$B88097   |
	LDX active_kong_sprite			;$B88098   |
	STX current_sprite			;$B8809B   |
	LDA $54,x				;$B8809D   |
	STA $8E					;$B8809F   |
	RTS					;$B880A1  /

CODE_B880A2:
	JSR work_on_inactive_kong		;$B880A2  \
	RTL					;$B880A5  /

work_on_kong_in_x:
	CPX active_kong_sprite			;$B880A6  \
	BEQ work_on_active_kong			;$B880A9   |
work_on_inactive_kong:				;	   |
	LDA $0599				;$B880AB   |
	STA $66					;$B880AE   |
	TAY					;$B880B0   |
	LDX inactive_kong_sprite		;$B880B1   |
	STX current_sprite			;$B880B4   |
	LDA $54,x				;$B880B6   |
	STA $8E					;$B880B8   |
	RTS					;$B880BA  /

	RTS					;$B880BB  /

CODE_B880BC:
	LDX active_kong_sprite			;$B880BC  \
	LDY inactive_kong_sprite		;$B880BF   |
	LDA $2E,x				;$B880C2   |
	CMP #$0011				;$B880C4   |
	BNE CODE_B880D1				;$B880C7   |
	LDA #$0000				;$B880C9   |
	STA $1C,x				;$B880CC   |
	STA $001C,y				;$B880CE   |
CODE_B880D1:					;	   |
	RTS					;$B880D1  /

CODE_B880D2:
	JSR work_on_active_kong			;$B880D2  \
	JSR CODE_B88EBC				;$B880D5   |
	LDX active_kong_sprite			;$B880D8   |
	LDA $2E,x				;$B880DB   |
	ASL A					;$B880DD   |
	ASL A					;$B880DE   |
	TAX					;$B880DF   |
	LDA.l DATA_B896B7,x			;$B880E0   |
if !version == 0				;	   |
	AND #$0001				;$B880E4   |
else						;	   |
	AND #$0005				;$B880E4   |
endif						;	   |
	BNE CODE_B8811D				;$B880E7   |
	LDX active_kong_sprite			;$B880E9   |
	LDA $6E					;$B880EC   |
	BNE CODE_B8811D				;$B880EE   |
	LDA #$0069				;$B880F0   |
	STA $2E,x				;$B880F3   |
	LDX current_sprite			;$B880F5   |
	LDA $24,x				;$B880F7   |
	BMI CODE_B88103				;$B880F9   |
	CMP #$0200				;$B880FB   |
	BMI CODE_B88103				;$B880FE   |
	LDA #$0200				;$B88100   |
CODE_B88103:					;	   |
	STA $24,x				;$B88103   |
	STZ $2A,x				;$B88105   |
	STZ $0AEE				;$B88107   |
	STZ $0AF2				;$B8810A   |
	JSR set_player_terminal_velocity	;$B8810D   |
	JSR set_player_normal_gravity		;$B88110   |
	LDA #$00A2				;$B88113   |
	JSL CODE_B9D0B8				;$B88116   |
	JSR CODE_B881BB				;$B8811A   |
CODE_B8811D:					;	   |
	RTS					;$B8811D  /

CODE_B8811E:
	JSR work_on_active_kong			;$B8811E  \
	LDA $1E,x				;$B88121   |
	LSR A					;$B88123   |
	BCS CODE_B88127				;$B88124   |
CODE_B88126:					;	   |
	RTS					;$B88126  /

CODE_B88127:
if !version == 1				;	  \
	LDA $2E,x				;$B88127   |
	ASL A					;$B88129   |
	ASL A					;$B8812A   |
	TAX					;$B8812B   |
	LDA.l DATA_B896B7,x			;$B8812C   |
	AND #$0005				;$B88130   |
	BNE CODE_B88126				;$B88133   |
endif						;	   |
	JSR set_player_terminal_velocity	;$B88135   |
	JSR set_player_normal_gravity		;$B88138   |
	LDX current_sprite			;$B8813B   |
	LDA #$0063				;$B8813D   |
	STA $2E,x				;$B88140   |
	STZ $24,x				;$B88142   |
	STZ $20,x				;$B88144   |
	STZ $26,x				;$B88146   |
	LDA #$00A0				;$B88148   |
	JSL CODE_B9D0B8				;$B8814B   |
	LDA $0A86				;$B8814F   |
	STA $091F				;$B88152   |
	LDA #$0008				;$B88155   |
	TRB $0B02				;$B88158   |
	JSR CODE_B881BB				;$B8815B   |
	RTS					;$B8815E  /

CODE_B8815F:
	JSR work_on_active_kong			;$B8815F  \
	JSR set_player_terminal_velocity	;$B88162   |
	JSR set_player_normal_gravity		;$B88165   |
	LDX current_sprite			;$B88168   |
	LDA #$005D				;$B8816A   |
	STA $2E,x				;$B8816D   |
	LDA #$0020				;$B8816F   |
	STA $42,x				;$B88172   |
	LDY #$0000				;$B88174   |
	LDA $0E,x				;$B88177   |
	AND #$7FFF				;$B88179   |
	CMP #$0010				;$B8817C   |
	BMI CODE_B88184				;$B8817F   |
	LDY #$0500				;$B88181   |
CODE_B88184:					;	   |
	TYA					;$B88184   |
	STA $44,x				;$B88185   |
	STZ $24,x				;$B88187   |
	STZ $20,x				;$B88189   |
	STZ $26,x				;$B8818B   |
	LDA #$00A0				;$B8818D   |
	JSL CODE_B9D0B8				;$B88190   |
	LDA $0A86				;$B88194   |
	STA $091F				;$B88197   |
	LDA #$0008				;$B8819A   |
	TRB $0B02				;$B8819D   |
	LDA $091B				;$B881A0   |
	AND #$FCFF				;$B881A3   |
	ORA #$0100				;$B881A6   |
	STA $091B				;$B881A9   |
	JSL CODE_BB8C2C				;$B881AC   |
	JSR CODE_B881BB				;$B881B0   |
	RTS					;$B881B3  /

CODE_B881B4:
	JSR CODE_B881BB				;$B881B4  \
	JSR CODE_B88EBC				;$B881B7   |
	RTL					;$B881BA  /

CODE_B881BB:
	LDA $0D7A				;$B881BB  \
	CMP inactive_kong_sprite		;$B881BE   |
	BEQ CODE_B881C4				;$B881C1   |
	RTS					;$B881C3  /

CODE_B881C4:
	STZ $0D7A				;$B881C4  \
	LDX inactive_kong_sprite		;$B881C7   |
	LDA #$0022				;$B881CA   |
	STA $2E,x				;$B881CD   |
	LDA #$00D8				;$B881CF   |
	STA $02,x				;$B881D2   |
	LDA #$001F				;$B881D4   |
	LDX #$001C				;$B881D7   |
	LDY #$0000				;$B881DA   |
	JSR CODE_B8D8D5				;$B881DD   |
	LDX active_kong_sprite			;$B881E0   |
	LDA #$00E4				;$B881E3   |
	STA $02,x				;$B881E6   |
	RTS					;$B881E8  /

CODE_B881E9:
	JSR CODE_B881BB				;$B881E9  \
	LDX $0A88				;$B881EC   |
	JSR work_on_kong_in_x			;$B881EF   |
	JSR CODE_B88EBC				;$B881F2   |
	STZ $0AEE				;$B881F5   |
	STZ $0AF2				;$B881F8   |
	LDA #$004E				;$B881FB   |
	JSL CODE_B9D0B8				;$B881FE   |
	LDX current_sprite			;$B88202   |
	LDA $0A86				;$B88204   |
	STA $42,x				;$B88207   |
	CPX active_kong_sprite			;$B88209   |
	BEQ CODE_B88222				;$B8820C   |
	LDY $2E,x				;$B8820E   |
	LDA #$005C				;$B88210   |
	STA $2E,x				;$B88213   |
	CPY #$002B				;$B88215   |
	BNE CODE_B88221				;$B88218   |
	JSR work_on_active_kong			;$B8821A   |
	JSL CODE_B8A57C				;$B8821D   |
CODE_B88221:					;	   |
	RTS					;$B88221  /

CODE_B88222:
	LDA #$005B				;$B88222  \
	STA $2E,x				;$B88225   |
	RTS					;$B88227  /

CODE_B88228:
	JSR work_on_active_kong			;$B88228  \
	JSL CODE_B8CEB6				;$B8822B   |
	JSL CODE_B9DFB2				;$B8822F   |
	JSR set_player_jumping_gravity		;$B88233   |
	LDA #$0006				;$B88236   |
	JSL CODE_B9D0B8				;$B88239   |
	LDX current_sprite			;$B8823D   |
	LDA #$0067				;$B8823F   |
	STA $2E,x				;$B88242   |
	LDA $08C2				;$B88244   |
	AND #$4000				;$B88247   |
	BNE CODE_B8824D				;$B8824A   |
	RTS					;$B8824C  /

CODE_B8824D:
	JSR work_on_inactive_kong		;$B8824D  \
	LDA #$0022				;$B88250   |
	STA $2E,x				;$B88253   |
	LDA #$0001				;$B88255   |
	LDX #$0006				;$B88258   |
	LDY #$0000				;$B8825B   |
	JSR CODE_B8D8D5				;$B8825E   |
	RTS					;$B88261  /

CODE_B88262:
	LDA #$0027				;$B88262  \
	JML CODE_B8D8BA				;$B88265  /

CODE_B88269:
if !version == 1				;	  \
	LDA #$0010				;$B88269   |
	TRB $08C4				;$B8826C   |
endif						;	   |
	JSR CODE_B880BC				;$B8826F   |
	JSL CODE_B881B4				;$B88272   |
	LDA $0515				;$B88276   |
	CMP #$0003				;$B88279   |
	BEQ CODE_B882D6				;$B8827C   |
	JSR work_on_active_kong			;$B8827E   |
	LDA $0A86				;$B88281   |
	EOR $12,x				;$B88284   |
	AND #$4000				;$B88286   |
	EOR $12,x				;$B88289   |
	STA $12,x				;$B8828B   |
	LDA $1E,x				;$B8828D   |
	AND #$0001				;$B8828F   |
	BNE CODE_B882D2				;$B88292   |
	LDA $6E					;$B88294   |
	BNE CODE_B882D2				;$B88296   |
	LDA $2E,x				;$B88298   |
	ASL A					;$B8829A   |
	ASL A					;$B8829B   |
	TAX					;$B8829C   |
	LDA.l DATA_B896B7,x			;$B8829D   |
	AND #$0002				;$B882A1   |
	BNE CODE_B882C3				;$B882A4   |
	JSL CODE_B8CEB6				;$B882A6   |
	JSL CODE_B8CE95				;$B882AA   |
	JSL CODE_B9DFCF				;$B882AE   |
	LDA #$003F				;$B882B2   |
	JSL CODE_B9D0B8				;$B882B5   |
	LDX current_sprite			;$B882B9   |
	LDA #$0064				;$B882BB   |
	STA $2E,x				;$B882BE   |
	STZ $26,x				;$B882C0   |
	RTS					;$B882C2  /

CODE_B882C3:
	LDX current_sprite			;$B882C3  \
	LDA #$0070				;$B882C5   |
	STA $2E,x				;$B882C8   |
	LDA #$0001				;$B882CA   |
	JSL transition_song			;$B882CD   |
	RTS					;$B882D1  /

CODE_B882D2:
	JSR CODE_B8830E				;$B882D2  \
	RTS					;$B882D5  /

CODE_B882D6:
	LDA #$FFFF				;$B882D6  \
	STA $0A86				;$B882D9   |
	JSR CODE_B88B15				;$B882DC   |
	JSR work_on_active_kong			;$B882DF   |
	LDA #$007B				;$B882E2   |
	STA $2E,x				;$B882E5   |
	LDA #$001E				;$B882E7   |
	STA $30,x				;$B882EA   |
	LDA $08C2				;$B882EC   |
	AND #$4000				;$B882EF   |
	BEQ .return				;$B882F2   |
	JSR work_on_inactive_kong		;$B882F4   |
	LDA #$0022				;$B882F7   |
	STA $2E,x				;$B882FA   |
	LDA #$00D8				;$B882FC   |
	STA $02,x				;$B882FF   |
	LDA #$001F				;$B88301   |
	LDX #$001C				;$B88304   |
	LDY #$0000				;$B88307   |
	JSR CODE_B8D8D5				;$B8830A   |
.return						;	   |
	RTS					;$B8830D  /

CODE_B8830E:
	JSL CODE_B3E287				;$B8830E  \
	JSR work_on_active_kong			;$B88312   |
	LDX current_sprite			;$B88315   |
	LDA #$0065				;$B88317   |
	STA $2E,x				;$B8831A   |
	LDA $6E					;$B8831C   |
	BNE .exit_as_animal			;$B8831E   |
	JSR check_sprite_underwater		;$B88320   |
	CMP #$0002				;$B88323   |
	BEQ .exit_underwater			;$B88326   |
	LDA #$00A1				;$B88328   |
	JSL CODE_B9D0B8				;$B8832B   |
	RTS					;$B8832F   |
.exit_underwater				;	   |
	LDA #$00A3				;$B88330   |
	JSL CODE_B9D0B8				;$B88333   |
	RTS					;$B88337   |
.exit_as_animal					;	   |
	LDA #$009A				;$B88338   |
	JSL CODE_B9D08C				;$B8833B   |
	RTS					;$B8833F  /

CODE_B88340:
if !version == 0				;	  \
	JSR CODE_B880BC				;$B88340   |
	JSR work_on_active_kong			;$B88343   |
	LDA #$001F				;$B88346   |
	LDY #$0280				;$B88349   |
else						;	   |
	LDX active_kong_sprite			;$B88340   |
	LDY inactive_kong_sprite		;$B88343   |
	LDA #$0000				;$B88346   |
	STA $1C,x				;$B88349   |
	STA $001C,y				;$B8834B   |
	JSR work_on_active_kong			;$B8834E   |
	LDA #$00F4				;$B88351   |
	STA $02,x				;$B88354   |
	LDA $2E,x				;$B88356   |
	CMP #$0011				;$B88358   |
	BNE CODE_B88364				;$B8835B   |
	LDA #$0047				;$B8835D   |
	JSL CODE_B9D0B8				;$B88360   |
CODE_B88364:					;	   |
	LDA #$001F				;$B88364   |
	LDY #$0100				;$B88367   |
endif						;	   |
	JSL CODE_B8D1E4				;$B8836A   |
	LDA #$0002				;$B8836E   |
	JSL transition_song			;$B88371   |
	JSR CODE_B8A699				;$B88375   |
	RTS					;$B88378  /

CODE_B88379:
	JSR CODE_B880BC				;$B88379  \
	JSR work_on_active_kong			;$B8837C   |
	LDA current_song			;$B8837F   |
	CMP #!music_lava			;$B88381   |
	BNE CODE_B8838D				;$B88384   |
	LDA #$077E				;$B88386   |
	JSL queue_sound_effect			;$B88389   |
CODE_B8838D:					;	   |
	LDA current_song			;$B8838D   |
	CMP #!music_swamp			;$B8838F   |
	BNE CODE_B883AA				;$B88392   |
	LDY #$0018				;$B88394   |
	JSL CODE_BB842C				;$B88397   |
	LDY alternate_sprite			;$B8839B   |
	LDA #$02C0				;$B8839D   |
	STA $000A,y				;$B883A0   |
	LDA #$0766				;$B883A3   |
	JSL queue_sound_effect			;$B883A6   |
CODE_B883AA:					;	   |
	LDA current_player_mount		;$B883AA   |
	BEQ CODE_B883B8				;$B883AC   |
	LDX current_player_mount		;$B883AE   |
	STZ $1A,x				;$B883B0   |
	STZ $16,x				;$B883B2   |
	STZ current_player_mount		;$B883B4   |
	STZ $6E					;$B883B6   |
CODE_B883B8:					;	   |
	LDX current_sprite			;$B883B8   |
	STZ $1A,x				;$B883BA   |
	STZ $16,x				;$B883BC   |
	LDA #$003B				;$B883BE   |
	STA $2E,x				;$B883C1   |
	LDA #$00A0				;$B883C3   |
	STA $42,x				;$B883C6   |
	STZ $30,x				;$B883C8   |
	LDA #$0003				;$B883CA   |
	STA $0A36				;$B883CD   |
	JSL CODE_B883D5				;$B883D0   |
	RTS					;$B883D4  /

CODE_B883D5:
	LDA $08C2				;$B883D5  \
	AND #$2000				;$B883D8   |
	BNE CODE_B8841B				;$B883DB   |
	JSL CODE_BEC66F				;$B883DD   |
	LDA current_song			;$B883E1   |
	CMP #!music_k_rool			;$B883E3   |
	BEQ CODE_B8841B				;$B883E6   |
	BRA CODE_B88414				;$B883E8  /

	CMP #$0012				;$B883EA   |
	BEQ CODE_B88414				;$B883ED   |
	CMP #$001D				;$B883EF   |
	BEQ CODE_B88414				;$B883F2   |
	CMP #$0006				;$B883F4   |
	BEQ CODE_B88414				;$B883F7   |
	CMP #$0010				;$B883F9   |
	BEQ CODE_B88414				;$B883FC   |
	CMP #$000D				;$B883FE   |
	BEQ CODE_B88414				;$B88401   |
	CMP #$0003				;$B88403   |
	BEQ CODE_B88414				;$B88406   |
	CMP #$0005				;$B88408   |
	BEQ CODE_B88414				;$B8840B   |
	CMP #$0007				;$B8840D   |
	BEQ CODE_B88414				;$B88410   |
	BRA CODE_B8841B				;$B88412  /

CODE_B88414:
	LDA #$0001				;$B88414  \
	JSL transition_song			;$B88417   |
CODE_B8841B:					;	   |
	RTL					;$B8841B  /

CODE_B8841C:
	JSL CODE_BBBE01				;$B8841C  \
	RTS					;$B88420  /

CODE_B88421:
	LDA #$FFFF				;$B88421  \
	STA $059D				;$B88424   |
	JML CODE_BBBE01				;$B88427  /

CODE_B8842B:
	JSR check_if_player_has_both_kongs	;$B8842B  \
	BCS CODE_B8848D				;$B8842E   |
	LDX #$0540				;$B88430   |
	LDY #$0540				;$B88433   |
	JSR CODE_B89186				;$B88436   |
	LDA inactive_kong_sprite		;$B88439   |
	STA $0D7A				;$B8843C   |
	STZ $0D7C				;$B8843F   |
	STZ $0D7E				;$B88442   |
	LDA #$0001				;$B88445   |
	STA $0D80				;$B88448   |
	LDA #$0007				;$B8844B   |
if !version == 0				;	   |
	LDY #$0280				;$B8844E   |
else						;	   |
	LDY #$0100				;$B8844E   |
endif						;	   |
	JSL CODE_B8D1E4				;$B88451   |
	JSR work_on_active_kong			;$B88455   |
	LDA #$0013				;$B88458   |
	STA $2E,x				;$B8845B   |
	LDA $0006,y				;$B8845D   |
	AND #$FFFB				;$B88460   |
	STA $0006,y				;$B88463   |
	LDA #$001F				;$B88466   |
	JSL CODE_B9D0B8				;$B88469   |
	JSR work_on_inactive_kong		;$B8846D   |
	LDX current_sprite			;$B88470   |
	LDA #$0040				;$B88472   |
	STA $2E,x				;$B88475   |
	LDA #$FFE4				;$B88477   |
	STA $00004A				;$B8847A   |
	LDA #$001F				;$B8847E   |
	LDX #$001C				;$B88481   |
	LDY #$0000				;$B88484   |
	JSR CODE_B8D8D7				;$B88487   |
	JMP CODE_B8A14E				;$B8848A  /

CODE_B8848D:
	RTS					;$B8848D  /

CODE_B8848E:
	JSR CODE_B8851B				;$B8848E  \
	BNE CODE_B884D6				;$B88491   |
	JSR CODE_B880BC				;$B88493   |
	LDA current_player_mount		;$B88496   |
	BNE CODE_B884D7				;$B88498   |
	LDA inactive_kong_sprite		;$B8849A   |
	STA $0D7A				;$B8849D   |
	STZ $0D7C				;$B884A0   |
	STZ $0D7E				;$B884A3   |
	LDA #$0001				;$B884A6   |
	STA $0D80				;$B884A9   |
	JSR disable_bullet_time			;$B884AC   |
	JSR work_on_active_kong			;$B884AF   |
	LDA #$0017				;$B884B2   |
	STA $2E,x				;$B884B5   |
	LDA $0006,y				;$B884B7   |
	AND #$FFFB				;$B884BA   |
	STA $0006,y				;$B884BD   |
	LDA #$001F				;$B884C0   |
	JSL CODE_B9D0B8				;$B884C3   |
	JSR work_on_inactive_kong		;$B884C7   |
	LDA #$0018				;$B884CA   |
	STA $2E,x				;$B884CD   |
	LDA #$0020				;$B884CF   |
	JSL CODE_B9D0B8				;$B884D2   |
CODE_B884D6:					;	   |
	RTS					;$B884D6  /

CODE_B884D7:
	JSR work_on_inactive_kong		;$B884D7  \
	LDA #$0022				;$B884DA   |
	STA $2E,x				;$B884DD   |
	LDA #$0004				;$B884DF   |
	LDX #$0003				;$B884E2   |
	LDY #$0000				;$B884E5   |
	JSR CODE_B8D8D5				;$B884E8   |
	RTS					;$B884EB  /

CODE_B884EC:
if !version == 1				;	  \
	JSR CODE_B8851B				;$B884EC   |
	BNE CODE_B8851A				;$B884EF   |
	LDA #$0002				;$B884F1   |
	BIT $08C4				;$B884F4   |
	BNE CODE_B8851A				;$B884F7   |
endif						;	   |
	STZ $0D7A				;$B884F9   |
	JSR work_on_active_kong			;$B884FC   |
	LDA #$007E				;$B884FF   |
	STA $2E,x				;$B88502   |
	JSR work_on_inactive_kong		;$B88504   |
	LDA #$0076				;$B88507   |
	STA $2E,x				;$B8850A   |
	LDA #$0040				;$B8850C   |
	JSL CODE_B9D0B8				;$B8850F   |
	STZ $20,x				;$B88513   |
	LDA #$FA00				;$B88515   |
	STA $24,x				;$B88518   |
CODE_B8851A:					;	   |
	RTS					;$B8851A  /

CODE_B8851B:
	LDX active_kong_sprite			;$B8851B  \
	LDA $2E,x				;$B8851E   |
	ASL A					;$B88520   |
	ASL A					;$B88521   |
	TAX					;$B88522   |
	LDA.l DATA_B896B7,x			;$B88523   |
	AND #$0020				;$B88527   |
	RTS					;$B8852A  /

CODE_B8852B:
	JSR CODE_B880BC				;$B8852B  \
	LDX active_kong_sprite			;$B8852E   |
	LDA $2E,x				;$B88531   |
	CMP #$002C				;$B88533   |
	BEQ CODE_B8853D				;$B88536   |
	JSR CODE_B8851B				;$B88538   |
	BNE CODE_B8857D				;$B8853B   |
CODE_B8853D:					;	   |
	LDA inactive_kong_sprite		;$B8853D   |
	STA $0D7A				;$B88540   |
	STZ $0D7C				;$B88543   |
	STZ $0D7E				;$B88546   |
	LDA #$0001				;$B88549   |
	STA $0D80				;$B8854C   |
	JSR work_on_active_kong			;$B8854F   |
if !version == 0				;	   |
	LDA #$0017				;$B88552   |
else						;	   |
	LDA #$001A				;$B88552   |
endif						;	   |
	STA $2E,x				;$B88555   |
	LDA $0006,y				;$B88557   |
	AND #$FFFB				;$B8855A   |
	STA $0006,y				;$B8855D   |
if !version == 0				;	   |
	LDA #$001F				;$B88560   |
else						;	   |
	LDA #$0023				;$B88560   |
endif						;	   |
	JSL CODE_B9D0B8				;$B88563   |
	JSR work_on_inactive_kong		;$B88567   |
	LDA #$0018				;$B8856A   |
	STA $2E,x				;$B8856D   |
	LDA $30,x				;$B8856F   |
	AND #$FFF7				;$B88571   |
	STA $30,x				;$B88574   |
	LDA #$0020				;$B88576   |
	JSL CODE_B9D0B8				;$B88579   |
CODE_B8857D:					;	   |
	RTS					;$B8857D  /

CODE_B8857E:
	LDA #$0080				;$B8857E  \
	LDY #$0002				;$B88581   |
	JSR enable_bullet_time			;$B88584   |
	JSR work_on_active_kong			;$B88587   |
	LDY $66					;$B8858A   |
	LDA $0004,y				;$B8858C   |
	AND #$4000				;$B8858F   |
	BEQ CODE_B885B7				;$B88592   |
	LDA $000E,y				;$B88594   |
	CLC					;$B88597   |
	ADC #$0100				;$B88598   |
	CMP #$0800				;$B8859B   |
	BMI CODE_B885A3				;$B8859E   |
	LDA #$0800				;$B885A0   |
CODE_B885A3:					;	   |
	STA $000E,y				;$B885A3   |
	LDY #$0032				;$B885A6   |
	LDA [$8E],y				;$B885A9   |
	STA $24,x				;$B885AB   |
	JSR apply_roll_animation		;$B885AD   |
	LDX current_sprite			;$B885B0   |
	LDA #$0019				;$B885B2   |
	STA $2E,x				;$B885B5   |
CODE_B885B7:					;	   |
	RTS					;$B885B7  /

CODE_B885B8:
	JSR work_on_active_kong			;$B885B8  \
	JSR CODE_B88EBC				;$B885BB   |
	LDX current_sprite			;$B885BE   |
	LDA #$0041				;$B885C0   |
	STA $2E,x				;$B885C3   |
	STZ $0E,x				;$B885C5   |
	STZ $26,x				;$B885C7   |
	STZ $20,x				;$B885C9   |
	STZ $24,x				;$B885CB   |
	LDA #$002B				;$B885CD   |
	JSL CODE_B9D0B8				;$B885D0   |
	RTS					;$B885D4  /

CODE_B885D5:
	JSR work_on_active_kong			;$B885D5  \
	LDA #$005A				;$B885D8   |
	STA $2E,x				;$B885DB   |
	STZ $20,x				;$B885DD   |
	STZ $26,x				;$B885DF   |
	LDA $0A86				;$B885E1   |
	EOR $12,x				;$B885E4   |
	AND #$4000				;$B885E6   |
	EOR $12,x				;$B885E9   |
	STA $12,x				;$B885EB   |
	LDA #$009F				;$B885ED   |
	JSL CODE_B9D0B8				;$B885F0   |
	RTS					;$B885F4  /

CODE_B885F5:
	JSR work_on_active_kong			;$B885F5  \
	JSR set_player_terminal_velocity	;$B885F8   |
	JSR set_player_normal_gravity		;$B885FB   |
	LDA #$005A				;$B885FE   |
	STA $2E,x				;$B88601   |
	LDA $0A86				;$B88603   |
	EOR $12,x				;$B88606   |
	AND #$4000				;$B88608   |
	EOR $12,x				;$B8860B   |
	STA $12,x				;$B8860D   |
	LDA #$FC00				;$B8860F   |
	STA $24,x				;$B88612   |
	STZ $20,x				;$B88614   |
	STZ $26,x				;$B88616   |
	LDA #$0048				;$B88618   |
	JSL CODE_B9D0B8				;$B8861B   |
	JSR CODE_B881BB				;$B8861F   |
	RTS					;$B88622  /

CODE_B88623:
	JSR work_on_active_kong			;$B88623  \
	LDX current_sprite			;$B88626   |
	LDA #$0043				;$B88628   |
	LDY $0D7A				;$B8862B   |
	BEQ CODE_B88633				;$B8862E   |
	LDA #$007A				;$B88630   |
CODE_B88633:					;	   |
	STA $2E,x				;$B88633   |
	STZ $26,x				;$B88635   |
	STZ $20,x				;$B88637   |
	STZ $24,x				;$B88639   |
	JSR set_stuck_on_honey_floor_animation	;$B8863B   |
	LDA #$0668				;$B8863E   |
	JSL queue_sound_effect			;$B88641   |
	RTS					;$B88645  /

set_stuck_on_honey_floor_animation:
	LDA $0D7A				;$B88646  \
	BNE .carrying_sprite			;$B88649   |
	LDA #$002D				;$B8864B   |
	JSL CODE_B9D0B8				;$B8864E   |
	RTS					;$B88652  /

.carrying_sprite
	LDA #$002E				;$B88653  \
	JSL CODE_B9D0B8				;$B88656   |
	RTS					;$B8865A  /

CODE_B8865B:
	LDX $0A86				;$B8865B  \
	CPX $0BA2				;$B8865E   |
	BEQ CODE_B88664				;$B88661   |
CODE_B88663:					;	   |
	RTS					;$B88663  /

CODE_B88664:
	LDA $00,x				;$B88664  \
	CMP #$02D8				;$B88666   |
	BEQ CODE_B88670				;$B88669   |
	CMP #$0254				;$B8866B   |
	BNE CODE_B88663				;$B8866E   |
CODE_B88670:					;	   |
	JSR work_on_active_kong			;$B88670   |
	JSR CODE_B88EBC				;$B88673   |
	LDA $0BA2				;$B88676   |
	STA $0BA0				;$B88679   |
	STZ $0BA2				;$B8867C   |
	LDX current_sprite			;$B8867F   |
	LDA #$0045				;$B88681   |
	STA $2E,x				;$B88684   |
	STZ $26,x				;$B88686   |
	STZ $20,x				;$B88688   |
	STZ $24,x				;$B8868A   |
	STZ $2A,x				;$B8868C   |
	LDY $0BA0				;$B8868E   |
	LDA $0006,y				;$B88691   |
	STA $06,x				;$B88694   |
	LDA #$002F				;$B88696   |
	JSL CODE_B9D0B8				;$B88699   |
	RTS					;$B8869D  /

CODE_B8869E:
	JSR work_on_active_kong			;$B8869E  \
	JSR CODE_B8B793				;$B886A1   |
	BCS CODE_B886CC				;$B886A4   |
	JSR CODE_B886E0				;$B886A6   |
	LDA #$0035				;$B886A9   |
	STA $2E,x				;$B886AC   |
	LDA $0A86				;$B886AE   |
	BEQ CODE_B886B5				;$B886B1   |
	STA $0A,x				;$B886B3   |
CODE_B886B5:					;	   |
	JSR CODE_B886CD				;$B886B5   |
	LDA $06,x				;$B886B8   |
	AND #$FFF0				;$B886BA   |
	ORA $32					;$B886BD   |
	STA $06,x				;$B886BF   |
	STZ $24,x				;$B886C1   |
	STZ $2A,x				;$B886C3   |
	LDA #$002F				;$B886C5   |
	JSL CODE_B9D0B8				;$B886C8   |
CODE_B886CC:					;	   |
	RTS					;$B886CC  /

CODE_B886CD:
	LDX current_sprite			;$B886CD  \
	LDA $0A88				;$B886CF   |
	BMI CODE_B886DA				;$B886D2   |
	LDA #$0003				;$B886D4   |
	STA $32					;$B886D7   |
	RTS					;$B886D9  /

CODE_B886DA:
	LDA #$001F				;$B886DA  \
	STA $32					;$B886DD   |
	RTS					;$B886DF  /

CODE_B886E0:
	LDA #$8000				;$B886E0  \
	STA $0AEA				;$B886E3   |
	LDA #$8000				;$B886E6   |
	STA $0AEC				;$B886E9   |
	STZ $0AEE				;$B886EC   |
	STZ $0AF2				;$B886EF   |
	RTS					;$B886F2  /

CODE_B886F3:
	JSR work_on_active_kong			;$B886F3  \
	JSR CODE_B8B793				;$B886F6   |
	BCS CODE_B8871A				;$B886F9   |
	LDA #$0038				;$B886FB   |
	STA $2E,x				;$B886FE   |
	LDA $0A86				;$B88700   |
	CLC					;$B88703   |
	ADC #$0028				;$B88704   |
	STA $0A,x				;$B88707   |
	STZ $24,x				;$B88709   |
	STZ $2A,x				;$B8870B   |
	LDA #$0039				;$B8870D   |
	JSL CODE_B9D0B8				;$B88710   |
	STZ $0AEE				;$B88714   |
	STZ $0AF2				;$B88717   |
CODE_B8871A:					;	   |
	RTS					;$B8871A  /

CODE_B8871B:
	JSR work_on_active_kong			;$B8871B  \
	LDA #$0055				;$B8871E   |
	STA $2E,x				;$B88721   |
	LDA $6E					;$B88723   |
	BNE CODE_B8873C				;$B88725   |
	LDA $0D7A				;$B88727   |
	BNE CODE_B88734				;$B8872A   |
	LDA #$004C				;$B8872C   |
	JSL CODE_B9D0B8				;$B8872F   |
	RTS					;$B88733  /

CODE_B88734:
	LDA #$004D				;$B88734  \
	JSL CODE_B9D0B8				;$B88737   |
	RTS					;$B8873B  /

CODE_B8873C:
	LDA #$005E				;$B8873C  \
	JSL CODE_B9D08C				;$B8873F   |
	LDX current_sprite			;$B88743   |
	STZ $3E					;$B88745   |
	LDA #$0055				;$B88747   |
	STA $2E,x				;$B8874A   |
	RTS					;$B8874C  /

CODE_B8874D:
	JSR CODE_B880BC				;$B8874D  \
	NOP					;$B88750   |
	NOP					;$B88751   |
	NOP					;$B88752   |
	NOP					;$B88753   |
	RTS					;$B88754  /

CODE_B88755:
	JSR CODE_B880BC				;$B88755  \
	JSR work_on_active_kong			;$B88758   |
	LDX current_sprite			;$B8875B   |
	LDA $0A86				;$B8875D   |
	BNE CODE_B88787				;$B88760   |
	LDY $0A88				;$B88762   |
	LDA $0048,y				;$B88765   |
	BIT $12,x				;$B88768   |
	BVC CODE_B88770				;$B8876A   |
	EOR #$FFFF				;$B8876C   |
	INC A					;$B8876F   |
CODE_B88770:					;	   |
	STA $20,x				;$B88770   |
	LDA $004A,y				;$B88772   |
	STA $24,x				;$B88775   |
	LDX $66					;$B88777   |
	LDA $004C,y				;$B88779   |
	STA $08,x				;$B8877C   |
	LDA $004E,y				;$B8877E   |
	STA $0A,x				;$B88781   |
	LDX current_sprite			;$B88783   |
	BRA CODE_B88796				;$B88785  /

CODE_B88787:
	STA $24,x				;$B88787  \
	LDA $0A88				;$B88789   |
	STA $20,x				;$B8878C   |
	JSL CODE_B8CEB6				;$B8878E   |
	JSL CODE_B8CE95				;$B88792   |
CODE_B88796:					;	   |
	STZ $1E,x				;$B88796   |
	LDA $0D7A				;$B88798   |
	CMP inactive_kong_sprite		;$B8879B   |
	BEQ CODE_B887BC				;$B8879E   |
	LDX current_sprite			;$B887A0   |
	LDA #$0056				;$B887A2   |
	STA $2E,x				;$B887A5   |
	JMP CODE_B88823				;$B887A7  /

CODE_B887AA:
	LDA #$0004				;$B887AA  \
	JSR disable_enemy_damage		;$B887AD   |
	LDA #$0080				;$B887B0   |
	LDY #$0003				;$B887B3   |
	JSR enable_bullet_time			;$B887B6   |
	JSR set_player_jumping_gravity		;$B887B9   |
CODE_B887BC:					;	   |
	LDX current_sprite			;$B887BC   |
	LDY #$0008				;$B887BE   |
	LDA [$8E],y				;$B887C1   |
	STA $24,x				;$B887C3   |
	LDA #$001C				;$B887C5   |
	STA $2E,x				;$B887C8   |
	LDA #$0025				;$B887CA   |
	JSL CODE_B9D0B8				;$B887CD   |
	RTS					;$B887D1  /

CODE_B887D2:
	JSR work_on_active_kong			;$B887D2  \
	LDA $2E,x				;$B887D5   |
	CMP #$0011				;$B887D7   |
	BNE CODE_B887DD				;$B887DA   |
	RTS					;$B887DC  /

CODE_B887DD:
	JSL CODE_B8CEB6				;$B887DD  \
	STZ $0AEE				;$B887E1   |
	STZ $0AF2				;$B887E4   |
	LDA $0D7A				;$B887E7   |
	CMP inactive_kong_sprite		;$B887EA   |
	BEQ CODE_B887AA				;$B887ED   |
	JSL CODE_B9DFB2				;$B887EF   |
	LDA #$0004				;$B887F3   |
	JSR disable_enemy_damage		;$B887F6   |
	LDA #$0080				;$B887F9   |
	LDY #$0002				;$B887FC   |
	JSR enable_bullet_time			;$B887FF   |
	JSR CODE_B88EBC				;$B88802   |
	JSR set_player_jumping_gravity		;$B88805   |
	LDX current_sprite			;$B88808   |
	LDA #$0016				;$B8880A   |
	LDY $2E,x				;$B8880D   |
	CPY #$004F				;$B8880F   |
	BEQ CODE_B88823				;$B88812   |
	CPY #$0067				;$B88814   |
	BCC CODE_B88821				;$B88817   |
	CPY #$0069				;$B88819   |
	BCS CODE_B88821				;$B8881C   |
	LDA #$0068				;$B8881E   |
CODE_B88821:					;	   |
	STA $2E,x				;$B88821   |
CODE_B88823:					;	   |
	LDA $6E					;$B88823   |
	BNE CODE_B88854				;$B88825   |
	LDA $0D7A				;$B88827   |
	BNE CODE_B8885C				;$B8882A   |
	LDA #$001C				;$B8882C   |
	JSL CODE_B9D0B8				;$B8882F   |
	JSR work_on_inactive_kong		;$B88833   |
	LDA $2E,x				;$B88836   |
	CMP #$002F				;$B88838   |
	BNE CODE_B88853				;$B8883B   |
	LDA #$0022				;$B8883D   |
	STA $2E,x				;$B88840   |
	LDA #$00D8				;$B88842   |
	STA $02,x				;$B88845   |
	LDA #$001F				;$B88847   |
	LDX #$001C				;$B8884A   |
	LDY #$0000				;$B8884D   |
	JSR CODE_B8D8D5				;$B88850   |
CODE_B88853:					;	   |
	RTS					;$B88853  /

CODE_B88854:
	LDA #$0072				;$B88854  \
	JSL CODE_B9D08C				;$B88857   |
	RTS					;$B8885B  /

CODE_B8885C:
	LDA #$0016				;$B8885C  \
	JSL CODE_B9D0B8				;$B8885F   |
	RTS					;$B88863  /

CODE_B88864:
	JSR CODE_B880BC				;$B88864  \
	JSR CODE_B8939C				;$B88867   |
	JSR CODE_B881BB				;$B8886A   |
	JSR CODE_B88EBC				;$B8886D   |
	JSL CODE_B3E287				;$B88870   |
	JSL CODE_BB8158				;$B88874   |
	LDA $051B				;$B88878   |
	CMP #$001F				;$B8887B   |
	BEQ CODE_B8889A				;$B8887E   |
	LDA $0B02				;$B88880   |
	AND #$0004				;$B88883   |
	BEQ CODE_B88893				;$B88886   |
	LDX #$0002				;$B88888   |
	LDY #$0003				;$B8888B   |
	JSR CODE_B89171				;$B8888E   |
	BRA CODE_B8889A				;$B88891  /

CODE_B88893:
	LDA #$0004				;$B88893  \
	JSL transition_song			;$B88896   |
CODE_B8889A:					;	   |
	LDA #$A000				;$B8889A   |
	STA $0AF0				;$B8889D   |
	LDA #$8000				;$B888A0   |
	STA $0AEA				;$B888A3   |
	STA $0AEC				;$B888A6   |
	LDA #$C000				;$B888A9   |
	ORA $0AB8				;$B888AC   |
	STA $0AB8				;$B888AF   |
	JSR work_on_active_kong			;$B888B2   |
	LDA #$009E				;$B888B5   |
	ORA $30,x				;$B888B8   |
	STA $30,x				;$B888BA   |
	LDA $0006,y				;$B888BC   |
	AND #$FFFB				;$B888BF   |
	STA $0006,y				;$B888C2   |
	JSR set_player_normal_gravity		;$B888C5   |
	JSR set_player_terminal_velocity	;$B888C8   |
	LDX current_sprite			;$B888CB   |
	LDA $0A86				;$B888CD   |
	STA $42,x				;$B888D0   |
	LDA $0A88				;$B888D2   |
	STA $44,x				;$B888D5   |
	LDA $12,x				;$B888D7   |
	AND #$BFFF				;$B888D9   |
	STA $12,x				;$B888DC   |
	LDA #$0046				;$B888DE   |
	STA $2E,x				;$B888E1   |
	LDA #$FA00				;$B888E3   |
	STA $24,x				;$B888E6   |
	LDA $42,x				;$B888E8   |
	SEC					;$B888EA   |
	SBC $06,x				;$B888EB   |
	STA $34					;$B888ED   |
	STZ $32					;$B888EF   |
	LSR $34					;$B888F1   |
	ROR $32					;$B888F3   |
	LSR $34					;$B888F5   |
	ROR $32					;$B888F7   |
	LSR $34					;$B888F9   |
	ROR $32					;$B888FB   |
	LSR $34					;$B888FD   |
	ROR $32					;$B888FF   |
	LSR $34					;$B88901   |
	ROR $32					;$B88903   |
	LDA $33					;$B88905   |
	STA $20,x				;$B88907   |
	LDA #$0006				;$B88909   |
	JSL CODE_B9D0B8				;$B8890C   |
	RTS					;$B88910  /

CODE_B88911:
	JSR CODE_B880BC				;$B88911  \
	JSR work_on_inactive_kong		;$B88914   |
	LDA $2E,x				;$B88917   |
	CMP #$0021				;$B88919   |
	BNE CODE_B88921				;$B8891C   |
	BRL CODE_B88A4C				;$B8891E  /

CODE_B88921:
	JSL CODE_B8CEB6				;$B88921  \
	JSR CODE_B8A131				;$B88925   |
	RTS					;$B88928  /

CODE_B88929:
if !version == 1
	LDX active_kong_sprite			;$B88929   |
	LDA $2E,x				;$B8892C   |
	CMP #$0023				;$B8892E   |
	BNE CODE_B88936				;$B88931   |
	JSR CODE_B881BB				;$B88933   |
endif						;	   |
CODE_B88936:					;	   |
	JSR CODE_B880BC				;$B88936   |
	JSR work_on_active_kong			;$B88939   |
	JSR set_player_terminal_velocity	;$B8893C   |
	JSR set_player_normal_gravity		;$B8893F   |
	STZ $0AEE				;$B88942   |
	STZ $0AF2				;$B88945   |
	LDX current_sprite			;$B88948   |
	LDA $6E					;$B8894A   |
	CMP #$0198				;$B8894C   |
	BNE CODE_B88956				;$B8894F   |
	LDA #$FD00				;$B88951   |
	BRA CODE_B88959				;$B88954  /

CODE_B88956:
	LDA #$F900				;$B88956  \
CODE_B88959:					;	   |
	STA $24,x				;$B88959   |
	LDA $0A86				;$B8895B   |
	STA $20,x				;$B8895E   |
	STZ $26,x				;$B88960   |
	LDA #$0080				;$B88962   |
	LDY #$0002				;$B88965   |
	JSR enable_bullet_time			;$B88968   |
	LDA #$0008				;$B8896B   |
	JSR disable_enemy_damage		;$B8896E   |
	LDX current_sprite			;$B88971   |
	LDA #$0015				;$B88973   |
	STA $2E,x				;$B88976   |
	LDA $6E					;$B88978   |
	BNE CODE_B8898C				;$B8897A   |
	LDA $0D7A				;$B8897C   |
	CMP inactive_kong_sprite		;$B8897F   |
	BEQ CODE_B88994				;$B88982   |
	LDA #$001B				;$B88984   |
	JSL CODE_B9D0B8				;$B88987   |
	RTS					;$B8898B  /

CODE_B8898C:
	LDA #$0072				;$B8898C  \
	JSL CODE_B9D08C				;$B8898F   |
	RTS					;$B88993  /

CODE_B88994:
	LDA #$0023				;$B88994  \
	JSL CODE_B9D0B8				;$B88997   |
	RTS					;$B8899B  /

CODE_B8899C:
	LDA $08C2				;$B8899C  \
	BMI CODE_B88A00				;$B8899F   |
	LDA #$0003				;$B889A1   |
	TRB $0919				;$B889A4   |
	JSR work_on_active_kong			;$B889A7   |
	LDA #$0080				;$B889AA   |
	STA $30,x				;$B889AD   |
	LDA #$0059				;$B889AF   |
	STA $2E,x				;$B889B2   |
	LDA #$00A0				;$B889B4   |
	JSL CODE_B9D0B8				;$B889B7   |
	LDA $0A86				;$B889BB   |
	STA $20,x				;$B889BE   |
	STA $26,x				;$B889C0   |
	LSR A					;$B889C2   |
	EOR $12,x				;$B889C3   |
	EOR #$FFFF				;$B889C5   |
	AND #$4000				;$B889C8   |
	EOR $12,x				;$B889CB   |
	STA $12,x				;$B889CD   |
	LDA $0A88				;$B889CF   |
	STA $24,x				;$B889D2   |
	JSR CODE_B88DF7				;$B889D4   |
	LDA $06,x				;$B889D7   |
	STA $0D66				;$B889D9   |
	LDA $0A,x				;$B889DC   |
	STA $0D6A				;$B889DE   |
	LDA $08C2				;$B889E1   |
	AND #$4000				;$B889E4   |
	BNE CODE_B889EA				;$B889E7   |
	RTS					;$B889E9  /

CODE_B889EA:
	JSR work_on_inactive_kong		;$B889EA  \
	LDA #$0026				;$B889ED   |
	STA $2E,x				;$B889F0   |
	STZ $42,x				;$B889F2   |
	STZ $30,x				;$B889F4   |
	LDA #$0007				;$B889F6   |
if !version == 0				;	   |
	LDY #$0280				;$B889F9   |
else						;	   |
	LDY #$0100				;$B889F9   |
endif						;	   |
	JSR enable_bullet_time			;$B889FC   |
	RTS					;$B889FF  /

CODE_B88A00:
	JSR work_on_active_kong			;$B88A00  \
	LDX active_kong_sprite			;$B88A03   |
	LDA #$F800				;$B88A06   |
	LDY #$FA00				;$B88A09   |
	JSR CODE_B88A27				;$B88A0C   |
	LDA $08C2				;$B88A0F   |
	AND #$4000				;$B88A12   |
	BEQ CODE_B88A26				;$B88A15   |
	JSR work_on_inactive_kong		;$B88A17   |
	LDX inactive_kong_sprite		;$B88A1A   |
	LDA #$FA00				;$B88A1D   |
	LDY #$FB00				;$B88A20   |
	JSR CODE_B88A27				;$B88A23   |
CODE_B88A26:					;	   |
	RTS					;$B88A26  /

CODE_B88A27:
	STX current_sprite			;$B88A27  \
	STA $24,x				;$B88A29   |
	TYA					;$B88A2B   |
	STA $20,x				;$B88A2C   |
	CMP #$8000				;$B88A2E   |
	ROR A					;$B88A31   |
	CMP #$8000				;$B88A32   |
	ROR A					;$B88A35   |
	STA $26,x				;$B88A36   |
	LDA #$0072				;$B88A38   |
	STA $2E,x				;$B88A3B   |
	LDY #$0036				;$B88A3D   |
	JSL CODE_BB842C				;$B88A40   |
	LDA #$00A0				;$B88A44   |
	JSL CODE_B9D0B8				;$B88A47   |
	RTS					;$B88A4B  /

CODE_B88A4C:
	JSR CODE_B880BC				;$B88A4C  \
	JSR work_on_active_kong			;$B88A4F   |
	LDA $2E,x				;$B88A52   |
	CMP #$002C				;$B88A54   |
	BNE CODE_B88A5B				;$B88A57   |
	STZ $2E,x				;$B88A59   |
CODE_B88A5B:					;	   |
	JSR work_on_inactive_kong		;$B88A5B   |
	LDA $08C2				;$B88A5E   |
	AND #$BFFF				;$B88A61   |
	STA $08C2				;$B88A64   |
	LDA #$0024				;$B88A67   |
	STA $2E,x				;$B88A6A   |
	STZ $20,x				;$B88A6C   |
	STZ $26,x				;$B88A6E   |
	STZ $30,x				;$B88A70   |
	STZ $42,x				;$B88A72   |
	JSR set_player_normal_gravity		;$B88A74   |
	JSR set_player_terminal_velocity	;$B88A77   |
	LDY #$002A				;$B88A7A   |
	LDA [$8E],y				;$B88A7D   |
	STA $24,x				;$B88A7F   |
	LDA $12,x				;$B88A81   |
	AND #$BFFF				;$B88A83   |
	STA $12,x				;$B88A86   |
	STZ $30,x				;$B88A88   |
	LDA #$0029				;$B88A8A   |
	JSL CODE_B9D0B8				;$B88A8D   |
	RTS					;$B88A91  /

CODE_B88A92:
	JSR work_on_active_kong			;$B88A92  \
	LDA #$0080				;$B88A95   |
	STA $30,x				;$B88A98   |
	LDA #$001B				;$B88A9A   |
	JSL CODE_B9D0B8				;$B88A9D   |
	LDA #$4000				;$B88AA1   |
	TRB $08C2				;$B88AA4   |
	BNE CODE_B88AB8				;$B88AA7   |
	LDX current_sprite			;$B88AA9   |
	LDA #$006B				;$B88AAB   |
	STA $2E,x				;$B88AAE   |
if !version == 0				;	   |
	LDA #$0040				;$B88AB0   |
endif						;	   |
	STZ $20,x				;$B88AB0   |
	LDA #$FB00				;$B88AB2   |
	STA $24,x				;$B88AB5   |
	RTS					;$B88AB7  /

CODE_B88AB8:
	LDX current_sprite			;$B88AB8  \
	LDA #$006A				;$B88ABA   |
	STA $2E,x				;$B88ABD   |
	JSL CODE_80889C				;$B88ABF   |
	JSR work_on_active_kong			;$B88AC3   |
	LDA $2E,x				;$B88AC6   |
	CMP #$005C				;$B88AC8   |
	BEQ CODE_B88AEC				;$B88ACB   |
	LDA $060D				;$B88ACD   |
	CMP #$0001				;$B88AD0   |
	BEQ CODE_B88AE4				;$B88AD3   |
	JSR start_player_falling		;$B88AD5   |
	LDX current_sprite			;$B88AD8   |
	LDA #$0067				;$B88ADA   |
	STA $2E,x				;$B88ADD   |
	JSL CODE_BCFA78				;$B88ADF   |
	RTS					;$B88AE3  /

CODE_B88AE4:
	LDA #$007F				;$B88AE4  \
	LDY #$0000				;$B88AE7   |
	BRA CODE_B88B02				;$B88AEA  /

CODE_B88AEC:
	LDA $060D				;$B88AEC  \
	CMP #$0001				;$B88AEF   |
	BNE CODE_B88AFC				;$B88AF2   |
	LDA #$007D				;$B88AF4   |
	LDY #$0000				;$B88AF7   |
	BRA CODE_B88B02				;$B88AFA  /

CODE_B88AFC:
	LDA #$005B				;$B88AFC  \
	LDY #$000A				;$B88AFF   |
CODE_B88B02:					;	   |
	STA $2E,x				;$B88B02   |
	LDA #$0007				;$B88B04   |
	JSR enable_bullet_time			;$B88B07   |
	JSR work_on_inactive_kong		;$B88B0A   |
if !version == 0				;	   |
	LDA #$0040				;$B88B0D   |
	STZ $20,x				;$B88B10   |
	LDA #$FB00				;$B88B12   |
	STA $24,x				;$B88B15   |
	RTS					;$B88B17   |
						;	   |
CODE_B88B15:					;	   |
	LDA current_player_mount		;$B88B18   |
	BNE CODE_B88B80				;$B88B19   |
	LDA $6E					;$B88B1B   |
	BNE CODE_B88B20				;$B88B1D   |
	RTS					;$B88B1F   |
						;	   |
CODE_B88B20:					;	   |
	JSR CODE_B88C33				;$B88B20   |
	JSR work_on_active_kong			;$B88B23   |
	LDA $6E					;$B88B26   |
	CMP #$01A0				;$B88B28   |
	BEQ CODE_B88B74				;$B88B2B   |
else						;	   |
	STZ $20,x				;$B88B1D   |
	LDA #$FB00				;$B88B1F   |
	STA $24,x				;$B88B12   |
	RTS					;$B88B14  /

CODE_B88B15:
	LDA current_player_mount		;$B88B15  \
	BNE CODE_B88B80				;$B88B17   |
	LDA $6E					;$B88B19   |
	BNE CODE_B88B1E				;$B88B1B   |
	RTS					;$B88B1D  /

CODE_B88B1E:
	JSR CODE_B88C33				;$B88B1E  \
	JSR work_on_active_kong			;$B88B21   |
	LDA $6E					;$B88B24   |
	CMP #$01A0				;$B88B26   |
	BEQ CODE_B88B74				;$B88B29   |
	JSR CODE_B88C65				;$B88B2B   |
endif						;	   |
	LDX current_sprite			;$B88B2E   |
	LDA #$00E4				;$B88B30   |
	STA $02,x				;$B88B33   |
	LDA #$0006				;$B88B35   |
	STA $2E,x				;$B88B38   |
	LDA #$0006				;$B88B3A   |
	JSL CODE_B9D0B8				;$B88B3D   |
	STZ $6E					;$B88B41   |
	STZ current_player_mount		;$B88B43   |
	JSR set_player_normal_gravity		;$B88B45   |
	JSR set_player_terminal_velocity	;$B88B48   |
CODE_B88B4B:					;	   |
	LDA #$0001				;$B88B4B   |
	LDY $08A4				;$B88B4E   |
	BEQ CODE_B88B56				;$B88B51   |
	LDA #$0004				;$B88B53   |
CODE_B88B56:					;	   |
	LDX active_kong_sprite			;$B88B56   |
	JSL CODE_BB8C44				;$B88B59   |
	JSR work_on_active_kong			;$B88B5D   |
	LDA $08C2				;$B88B60   |
	AND #$4000				;$B88B63   |
	BEQ CODE_B88B72				;$B88B66   |
	EOR $08C2				;$B88B68   |
	STA $08C2				;$B88B6B   |
	JSL CODE_B8A98A				;$B88B6E   |
CODE_B88B72:					;	   |
	BRA CODE_B88BD9				;$B88B72  /

CODE_B88B74:
	LDA #$00E4				;$B88B74  \
	STA $02,x				;$B88B77   |
	STZ $6E					;$B88B79   |
	JSR CODE_B8B6E0				;$B88B7B   |
	BRA CODE_B88B4B				;$B88B7E  /

CODE_B88B80:
	JSR CODE_B88C33				;$B88B80  \
	JSR work_on_active_kong			;$B88B83   |
	LDA $6E					;$B88B86   |
	CMP #$01A0				;$B88B88   |
	BEQ CODE_B88BCA				;$B88B8B   |
	LDX current_sprite			;$B88B8D   |
	LDA #$00E4				;$B88B8F   |
	STA $02,x				;$B88B92   |
	LDA #$0006				;$B88B94   |
	STA $2E,x				;$B88B97   |
	LDA #$0006				;$B88B99   |
	JSL CODE_B9D0B8				;$B88B9C   |
	LDA $6E					;$B88BA0   |
	PHA					;$B88BA2   |
	STZ $6E					;$B88BA3   |
	JSR set_player_normal_gravity		;$B88BA5   |
	JSR set_player_terminal_velocity	;$B88BA8   |
	PLA					;$B88BAB   |
	STA $6E					;$B88BAC   |
CODE_B88BAE:					;	   |
	JSR CODE_B895E5				;$B88BAE   |
	LDX current_player_mount		;$B88BB1   |
	STX current_sprite			;$B88BB3   |
	JSR CODE_B8957C				;$B88BB5   |
	JSR CODE_B8958F				;$B88BB8   |
	BCS CODE_B88BC0				;$B88BBB   |
	JSR CODE_B89609				;$B88BBD   |
CODE_B88BC0:					;	   |
	JSL CODE_BB82B8				;$B88BC0   |
	STZ $6E					;$B88BC4   |
	STZ current_player_mount		;$B88BC6   |
	BRA CODE_B88BD9				;$B88BC8  /

CODE_B88BCA:
	LDA #$00E4				;$B88BCA  \
	STA $02,x				;$B88BCD   |
	STZ $6E					;$B88BCF   |
	JSR CODE_B8B6E0				;$B88BD1   |
	JSR work_on_active_kong			;$B88BD4   |
	BRA CODE_B88BAE				;$B88BD7  /

CODE_B88BD9:
	LDA #$001C				;$B88BD9  \
	LDY #$0014				;$B88BDC   |
	JSR enable_bullet_time			;$B88BDF   |
	JSL CODE_B5E43E				;$B88BE2   |
	JSR work_on_active_kong			;$B88BE6   |
	LDA $0A86				;$B88BE9   |
	BMI CODE_B88C23				;$B88BEC   |
	JSL CODE_B39DB0				;$B88BEE   |
	STA $0A86				;$B88BF2   |
	ASL A					;$B88BF5   |
	TAX					;$B88BF6   |
	LDA.l DATA_FF18CE,x			;$B88BF7   |
	TAY					;$B88BFB   |
	JSL CODE_BB8432				;$B88BFC   |
	LDX alternate_sprite			;$B88C00   |
	LDA $0A86				;$B88C02   |
	STA $42,x				;$B88C05   |
	LDY active_kong_sprite			;$B88C07   |
	LDA $0A88				;$B88C0A   |
	CMP #$8000				;$B88C0D   |
	AND #$7FFF				;$B88C10   |
	STA $4E,x				;$B88C13   |
	BCC CODE_B88C1C				;$B88C15   |
	LDA #$FC80				;$B88C17   |
	BRA CODE_B88C1F				;$B88C1A  /

CODE_B88C1C:
	LDA #$0380				;$B88C1C  \
CODE_B88C1F:					;	   |
	STA $20,x				;$B88C1F   |
	STA $26,x				;$B88C21   |
CODE_B88C23:					;	   |
	LDY #$0124				;$B88C23   |
	JSL CODE_BB842C				;$B88C26   |
	LDY #$0126				;$B88C2A   |
	JSL CODE_BB842C				;$B88C2D   |
	SEC					;$B88C31   |
	RTS					;$B88C32  /

CODE_B88C33:
	LDA #$0441				;$B88C33  \
	JSL queue_sound_effect			;$B88C36   |
	LDA #$0542				;$B88C3A   |
	JSL queue_sound_effect			;$B88C3D   |
	LDA #$0643				;$B88C41   |
	JSL queue_sound_effect			;$B88C44   |
	LDA #$0744				;$B88C48   |
	JSL queue_sound_effect			;$B88C4B   |
	RTS					;$B88C4F  /

CODE_B88C50:
	LDX active_kong_sprite			;$B88C50  \
	LDA $2E,x				;$B88C53   |
	ASL A					;$B88C55   |
	ASL A					;$B88C56   |
	TAX					;$B88C57   |
	LDA.l DATA_B896B7,x			;$B88C58   |
	AND #$0100				;$B88C5C   |
	BNE CODE_B88C63				;$B88C5F   |
	CLC					;$B88C61   |
	RTS					;$B88C62  /

CODE_B88C63:
	SEC					;$B88C63  \
	RTS					;$B88C64  /
CODE_B88C65:
if !version == 1
	LDX #main_sprite_table			;$B88C65  \
CODE_B88C68:					;	   |
	LDA $00,x				;$B88C68   |
	CMP #$0134				;$B88C6A   |
	BNE CODE_B88C7D				;$B88C6D   |
	LDA current_sprite			;$B88C6F   |
	PHA					;$B88C71   |
	STX current_sprite			;$B88C72   |
	JSL CODE_BB82B8				;$B88C74   |
	PLA					;$B88C78   |
	STA current_sprite			;$B88C79   |
	BRA CODE_B88C88				;$B88C7B  /

CODE_B88C7D:
	TXA					;$B88C7D  \
	CLC					;$B88C7E   |
	ADC #sizeof(sprite)			;$B88C7F   |
	TAX					;$B88C82   |
	CPX #main_sprite_table_end		;$B88C83   |
	BNE CODE_B88C68				;$B88C86   |
CODE_B88C88:					;	   |
	RTS					;$B88C88  /

CODE_B88C89:
	LDA #$0080				;$B88C89  \
	LDY #$0100				;$B88C8C   |
else						;	   |
CODE_B88C89:					;	   |
	LDA #$0080				;$B88C65   |
	LDY #$0280				;$B88C68   |
endif						;	   |
	JSR enable_bullet_time			;$B88C8F   |
	LDA #$0002				;$B88C92   |
	JSL transition_song			;$B88C95   |
	JSR CODE_B8A6A9				;$B88C99   |
CODE_B88C9C:					;	   |
	RTS					;$B88C9C  /

CODE_B88C9D:
	LDA #$4000				;$B88C9D  \
	TRB $08C2				;$B88CA0   |
CODE_B88CA3:					;	   |
	JSR CODE_B880BC				;$B88CA3   |
	JSR CODE_B88C50				;$B88CA6   |
	BCS CODE_B88C9C				;$B88CA9   |
	JSR work_on_active_kong			;$B88CAB   |
if !version == 1				;	   |
	BIT $0D54				;$B88CAE   |
	BMI CODE_B88CB6				;$B88CB1   |
	JSR CODE_B8A186				;$B88CB3   |
CODE_B88CB6:					;	   |
	LDX active_kong_sprite			;$B88CB6   |
endif						;	   |
	LDA $10,x				;$B88CB9   |
	AND #$0100				;$B88CBB   |
	BEQ CODE_B88CCB				;$B88CBE   |
	LDA $0D54				;$B88CC0   |
	BMI CODE_B88CCB				;$B88CC3   |
	CLC					;$B88CC5   |
	ADC #$00C0				;$B88CC6   |
	STA $0A,x				;$B88CC9   |
CODE_B88CCB:					;	   |
	LDA $0515				;$B88CCB   |
	CMP #$0001				;$B88CCE   |
	BEQ CODE_B88C89				;$B88CD1   |
	STZ $0AEE				;$B88CD3   |
	STZ $0AF2				;$B88CD6   |
	LDA #$0003				;$B88CD9   |
	TRB $0919				;$B88CDC   |
	LDA $091B				;$B88CDF   |
	AND #$0300				;$B88CE2   |
	CMP #$0100				;$B88CE5   |
	BNE CODE_B88CF4				;$B88CE8   |
	EOR $091B				;$B88CEA   |
	STA $091B				;$B88CED   |
	JSL CODE_BB8C19				;$B88CF0   |
CODE_B88CF4:					;	   |
	STZ $1C,x				;$B88CF4   |
	STZ $50,x				;$B88CF6   |
	JSL CODE_B5E43E				;$B88CF8   |
	JSR CODE_B88F39				;$B88CFC   |
	BCC CODE_B88D02				;$B88CFF   |
	RTS					;$B88D01  /

CODE_B88D02:
	LDA $6E					;$B88D02  \
	BEQ CODE_B88D09				;$B88D04   |
	BRL CODE_B88E15				;$B88D06  /

CODE_B88D09:
	LDA $0D7A				;$B88D09  \
	CMP inactive_kong_sprite		;$B88D0C   |
	BNE CODE_B88D1E				;$B88D0F   |
	JSR work_on_inactive_kong		;$B88D11   |
	LDA #$0029				;$B88D14   |
	JSL CODE_B9D0B8				;$B88D17   |
	JSR work_on_active_kong			;$B88D1B   |
CODE_B88D1E:					;	   |
	STZ $0D82				;$B88D1E   |
	JSR CODE_B88EBC				;$B88D21   |
	LDX current_sprite			;$B88D24   |
	LDA $34,x				;$B88D26   |
	EOR #$FFFF				;$B88D28   |
	EOR $12,x				;$B88D2B   |
	AND #$4000				;$B88D2D   |
	EOR $12,x				;$B88D30   |
	STA $12,x				;$B88D32   |
	LDA $0515				;$B88D34   |
	CMP #$0001				;$B88D37   |
	LDA $08C2				;$B88D3A   |
	AND #$4000				;$B88D3D   |
	BNE CODE_B88D45				;$B88D40   |
	BRL CODE_B88DCA				;$B88D42  /

CODE_B88D45:
	LDA $10,x				;$B88D45  \
	AND #$0100				;$B88D47   |
	BEQ CODE_B88D52				;$B88D4A   |
	LDA #$0001				;$B88D4C   |
	TSB $0D56				;$B88D4F   |
CODE_B88D52:					;	   |
	LDA $20,x				;$B88D52   |
	STA $0D60				;$B88D54   |
	LDA $24,x				;$B88D57   |
	STA $0D62				;$B88D59   |
	LDA $2E,x				;$B88D5C   |
	STA $0D64				;$B88D5E   |
	LDA $04,x				;$B88D61   |
	STA $0D66				;$B88D63   |
	LDA $06,x				;$B88D66   |
	STA $0D68				;$B88D68   |
	LDA $08,x				;$B88D6B   |
	STA $0D6A				;$B88D6D   |
	LDA $0A,x				;$B88D70   |
	STA $0D6C				;$B88D72   |
	LDA #$0024				;$B88D75   |
	STA $2E,x				;$B88D78   |
	STZ $20,x				;$B88D7A   |
	STZ $26,x				;$B88D7C   |
	STZ $30,x				;$B88D7E   |
	STZ $42,x				;$B88D80   |
	JSR set_player_normal_gravity		;$B88D82   |
	JSR set_player_terminal_velocity	;$B88D85   |
	LDX current_sprite			;$B88D88   |
	LDY #$002A				;$B88D8A   |
	LDA [$8E],y				;$B88D8D   |
	STA $24,x				;$B88D8F   |
	LDA $12,x				;$B88D91   |
	AND #$BFFF				;$B88D93   |
	STA $12,x				;$B88D96   |
	LDA #$0007				;$B88D98   |
if !version == 0				;	   |
	LDY #$0280				;$B88D9B   |
else						;	   |
	LDY #$0100				;$B88D9B   |
endif						;	   |
	JSR enable_bullet_time			;$B88D9E   |
	LDA #$0029				;$B88DA1   |
	JSL CODE_B9D0B8				;$B88DA4   |
	JSR work_on_inactive_kong		;$B88DA8   |
	LDA #$0026				;$B88DAB   |
	STA $2E,x				;$B88DAE   |
	LDA #$0024				;$B88DB0   |
	STA $42,x				;$B88DB3   |
	LDA #$0080				;$B88DB5   |
	STA $30,x				;$B88DB8   |
	JSR work_on_active_kong			;$B88DBA   |
	LDA $06,x				;$B88DBD   |
	STA $0D66				;$B88DBF   |
	LDA $0A,x				;$B88DC2   |
	STA $0D6A				;$B88DC4   |
	RTS					;$B88DC7  /

	RTS					;$B88DC8  /

	RTS					;$B88DC9  /

CODE_B88DCA:
	JSR work_on_active_kong			;$B88DCA  \
	JSR CODE_B88DF7				;$B88DCD   |
	LDX current_sprite			;$B88DD0   |
	LDA #$0100				;$B88DD2   |
	BIT $12,x				;$B88DD5   |
	BVS CODE_B88DDD				;$B88DD7   |
	EOR #$FFFF				;$B88DD9   |
	INC A					;$B88DDC   |
CODE_B88DDD:					;	   |
	STA $20,x				;$B88DDD   |
	STA $26,x				;$B88DDF   |
	LDA #$0080				;$B88DE1   |
	STA $30,x				;$B88DE4   |
	LDA #$0005				;$B88DE6   |
	STA $2E,x				;$B88DE9   |
	JSL CODE_B8CEB6				;$B88DEB   |
	LDA #$000A				;$B88DEF   |
	JSL CODE_B9D0B8				;$B88DF2   |
	RTS					;$B88DF6  /

CODE_B88DF7:
	LDY #$0024				;$B88DF7  \
	LDA [$8E],y				;$B88DFA   |
	LDY $66					;$B88DFC   |
	STA $0008,y				;$B88DFE   |
	LDY #$0026				;$B88E01   |
	LDA [$8E],y				;$B88E04   |
	LDX current_sprite			;$B88E06   |
	STA $24,x				;$B88E08   |
	RTS					;$B88E0A  /

DATA_B88E0B:
	db $45, $05, $45, $05, $4F, $05, $18, $05
	db $66, $05

CODE_B88E15:
	LDA $6E					;$B88E15  \
	SEC					;$B88E17   |
	SBC #$0190				;$B88E18   |
	LSR A					;$B88E1B   |
	TAX					;$B88E1C   |
	LDA.l DATA_B88E0B,x			;$B88E1D   |
	JSL queue_sound_effect			;$B88E21   |
	LDA #$4000				;$B88E25   |
	TRB $08C2				;$B88E28   |
	BEQ CODE_B88E47				;$B88E2B   |
	JSR work_on_active_kong			;$B88E2D   |
	JSR CODE_B890BC				;$B88E30   |
	LDA #$0095				;$B88E33   |
	JSL CODE_B9D08C				;$B88E36   |
	LDA #$001F				;$B88E3A   |
	LDY #$0014				;$B88E3D   |
	JSR enable_bullet_time			;$B88E40   |
	JSR start_damaged_invincibility		;$B88E43   |
	RTS					;$B88E46  /

CODE_B88E47:
	JSR work_on_active_kong			;$B88E47  \
	LDX current_sprite			;$B88E4A   |
	STZ $1E,x				;$B88E4C   |
	LDA #$0095				;$B88E4E   |
	JSL CODE_B9D08C				;$B88E51   |
	LDX current_sprite			;$B88E55   |
	STZ $3A,x				;$B88E57   |
	LDA #$0006				;$B88E59   |
if !version == 0				;	   |
	LDY #$0280				;$B88E5C   |
else						;	   |
	LDY #$0100				;$B88E5C   |
endif						;	   |
	JSR enable_bullet_time			;$B88E5F   |
	LDY $0595				;$B88E62   |
	LDY #$0024				;$B88E65   |
	LDA [$8E],y				;$B88E68   |
	LDY $66					;$B88E6A   |
	STA $0008,y				;$B88E6C   |
	LDY #$0026				;$B88E6F   |
	LDA [$8E],y				;$B88E72   |
	LDX current_sprite			;$B88E74   |
	STA $24,x				;$B88E76   |
	LDY #$0002				;$B88E78   |
	LDA [$8E],y				;$B88E7B   |
	LDY $66					;$B88E7D   |
	STA $000A,y				;$B88E7F   |
	LDA #$0100				;$B88E82   |
	BIT $12,x				;$B88E85   |
	BVS CODE_B88E8D				;$B88E87   |
	EOR #$FFFF				;$B88E89   |
	INC A					;$B88E8C   |
CODE_B88E8D:					;	   |
	STA $20,x				;$B88E8D   |
	STA $26,x				;$B88E8F   |
	STZ $30,x				;$B88E91   |
	LDA #$003A				;$B88E93   |
	STA $2E,x				;$B88E96   |
	LDA $12,x				;$B88E98   |
	ORA #$3000				;$B88E9A   |
	STA $12,x				;$B88E9D   |
	RTS					;$B88E9F  /

	LDA current_sprite			;$B88EA0   |
	PHA					;$B88EA2   |
	LDA $66					;$B88EA3   |
	PHA					;$B88EA5   |
	LDA $6A					;$B88EA6   |
	STA current_sprite			;$B88EA8   |
	DEC A					;$B88EAA   |
	DEC A					;$B88EAB   |
	STA $66					;$B88EAC   |
	JSR CODE_B88EBC				;$B88EAE   |
	PLA					;$B88EB1   |
	STA $66					;$B88EB2   |
	PLA					;$B88EB4   |
	STA current_sprite			;$B88EB5   |
	RTL					;$B88EB7  /

CODE_B88EB8:
	JSR CODE_B88EBC				;$B88EB8  \
	RTL					;$B88EBB  /

CODE_B88EBC:
	LDA $0D7A				;$B88EBC  \
	BNE .holding_sprite			;$B88EBF   |
	CLC					;$B88EC1   |
	RTS					;$B88EC2  /

.holding_sprite
	CMP inactive_kong_sprite		;$B88EC3  \
	BEQ .holding_kong			;$B88EC6   |
	TAX					;$B88EC8   |
if !version == 0				;	   |
	STZ $0D7A				;$B88EC9   |
endif						;	   |
	LDA #$0005				;$B88EC9   |
	STA $32,x				;$B88ECC   |
	LDA #$0100				;$B88ECE   |
	BIT $12,x				;$B88ED1   |
	BVC .CODE_B88ED9			;$B88ED3   |
	EOR #$FFFF				;$B88ED5   |
	INC A					;$B88ED8   |
.CODE_B88ED9					;	   |
	STA $20,x				;$B88ED9   |
	STA $26,x				;$B88EDB   |
	LDA #$0400				;$B88EDD   |
	STA $24,x				;$B88EE0   |
if !version == 1				;	   |
	LDX $0D7A				;$B88EE2   |
	JSL CODE_B8D4AE				;$B88EE5   |
	STZ $0D7A				;$B88EE9   |
endif						;	   |
	CLC					;$B88EEC   |
	RTS					;$B88EED  /

.holding_kong
	STZ $0D7A				;$B88EEE  \
	LDX inactive_kong_sprite		;$B88EF1   |
	LDA #$0022				;$B88EF4   |
	STA $2E,x				;$B88EF7   |
	LDA #$00D8				;$B88EF9   |
	STA $02,x				;$B88EFC   |
	LDA #$001F				;$B88EFE   |
	LDX #$001C				;$B88F01   |
	LDY #$0000				;$B88F04   |
	JSR CODE_B8D8D5				;$B88F07   |
	LDX active_kong_sprite			;$B88F0A   |
	LDA #$00E4				;$B88F0D   |
	STA $02,x				;$B88F10   |
	CLC					;$B88F12   |
	RTS					;$B88F13  /

CODE_B88F14:
	LDY #DATA_B88F2F			;$B88F14  \
	STY $32					;$B88F17   |
	LDA $6E					;$B88F19   |
	SEC					;$B88F1B   |
	SBC #$0190				;$B88F1C   |
	LSR A					;$B88F1F   |
	AND #$00FE				;$B88F20   |
	CLC					;$B88F23   |
	ADC $32					;$B88F24   |
	TAY					;$B88F26   |
	LDA $0000,y				;$B88F27   |
	JSL queue_sound_effect			;$B88F2A   |
	RTL					;$B88F2E  /

DATA_B88F2F:
	db $45, $05, $45, $05, $4F, $05, $18, $05
	db $66, $05

CODE_B88F39:
	LDA current_player_mount		;$B88F39  \
	BNE CODE_B88F3F				;$B88F3B   |
	CLC					;$B88F3D   |
	RTS					;$B88F3E  /

CODE_B88F3F:
	JSL CODE_B88F14				;$B88F3F  \
	LDA $6E					;$B88F43   |
	CMP #$01A0				;$B88F45   |
	BEQ CODE_B88F82				;$B88F48   |
	CMP #$0198				;$B88F4A   |
	BNE CODE_B88F51				;$B88F4D   |
	BRA CODE_B88FC3				;$B88F4F  /

CODE_B88F51:
	JSR work_on_active_kong			;$B88F51  \
	JSR start_damaged_invincibility		;$B88F54   |
	LDX current_sprite			;$B88F57   |
	LDA #$00E4				;$B88F59   |
	STA $02,x				;$B88F5C   |
	LDA #$F800				;$B88F5E   |
	STA $24,x				;$B88F61   |
	LDA #$0006				;$B88F63   |
	STA $2E,x				;$B88F66   |
	LDA #$0006				;$B88F68   |
	JSL CODE_B9D0B8				;$B88F6B   |
	LDA $6E					;$B88F6F   |
	PHA					;$B88F71   |
	STZ $6E					;$B88F72   |
	JSR set_player_normal_gravity		;$B88F74   |
	JSR set_player_terminal_velocity	;$B88F77   |
	PLA					;$B88F7A   |
	STA $6E					;$B88F7B   |
	JSR CODE_B890E1				;$B88F7D   |
	SEC					;$B88F80   |
	RTS					;$B88F81  /

CODE_B88F82:
	JSR work_on_active_kong			;$B88F82  \
	JSR start_damaged_invincibility		;$B88F85   |
	LDX current_sprite			;$B88F88   |
	LDA #$00E4				;$B88F8A   |
	STA $02,x				;$B88F8D   |
	LDA #$FE00				;$B88F8F   |
	STA $24,x				;$B88F92   |
	STZ $6E					;$B88F94   |
	JSR CODE_B8B6E0				;$B88F96   |
	LDX current_player_mount		;$B88F99   |
	STX current_sprite			;$B88F9B   |
	LDA #$00D0				;$B88F9D   |
	STA $02,x				;$B88FA0   |
	LDA #$0006				;$B88FA2   |
	STA $2E,x				;$B88FA5   |
	LDA #$003C				;$B88FA7   |
	STA $42,x				;$B88FAA   |
	LDX current_sprite			;$B88FAC   |
	LDA #$0400				;$B88FAE   |
	STA $20,x				;$B88FB1   |
	STA $26,x				;$B88FB3   |
	LDA $12,x				;$B88FB5   |
	AND #$BFFF				;$B88FB7   |
	STA $12,x				;$B88FBA   |
	STZ $24,x				;$B88FBC   |
	STZ $2A,x				;$B88FBE   |
	BRL CODE_B89126				;$B88FC0  /

CODE_B88FC3:
	JSR CODE_B890BC				;$B88FC3  \
	LDA #$4000				;$B88FC6   |
	TRB $08C2				;$B88FC9   |
	BNE CODE_B89035				;$B88FCC   |
	JSR work_on_active_kong			;$B88FCE   |
	LDA $6E					;$B88FD1   |
	PHA					;$B88FD3   |
	STZ $6E					;$B88FD4   |
	JSR set_player_normal_gravity		;$B88FD6   |
	JSR set_player_terminal_velocity	;$B88FD9   |
	PLA					;$B88FDC   |
	STA $6E					;$B88FDD   |
	LDA #$0080				;$B88FDF   |
	STA $30,x				;$B88FE2   |
	LDA #$0059				;$B88FE4   |
	STA $2E,x				;$B88FE7   |
	STZ $1E,x				;$B88FE9   |
	LDA #$00A0				;$B88FEB   |
	JSL CODE_B9D0B8				;$B88FEE   |
	LDA #$0000				;$B88FF2   |
	STA $20,x				;$B88FF5   |
	STA $26,x				;$B88FF7   |
	LSR A					;$B88FF9   |
	EOR $12,x				;$B88FFA   |
	EOR #$FFFF				;$B88FFC   |
	AND #$4000				;$B88FFF   |
	EOR $12,x				;$B89002   |
	STA $12,x				;$B89004   |
	LDA #$FB00				;$B89006   |
	STA $24,x				;$B89009   |
	JSR CODE_B88DF7				;$B8900B   |
	LDX current_player_mount		;$B8900E   |
	STX current_sprite			;$B89010   |
	LDA #$00D0				;$B89012   |
	STA $02,x				;$B89015   |
	STZ $2E,x				;$B89017   |
	LDA #$0147				;$B89019   |
	JSL CODE_B9D07B				;$B8901C   |
	JSR CODE_B895E5				;$B89020   |
	JSR CODE_B89609				;$B89023   |
	STZ current_player_mount		;$B89026   |
	STZ $6E					;$B89028   |
	LDA #$0003				;$B8902A   |
if !version == 0				;	   |
	LDY #$0280				;$B8902D   |
else						;	   |
	LDY #$0100				;$B8902D   |
endif						;	   |
	JSR enable_bullet_time			;$B89030   |
	SEC					;$B89033   |
	RTS					;$B89034  /

CODE_B89035:
	JSR work_on_active_kong			;$B89035  \
	LDA $6E					;$B89038   |
	PHA					;$B8903A   |
	STZ $6E					;$B8903B   |
	JSR set_player_normal_gravity		;$B8903D   |
	JSR set_player_terminal_velocity	;$B89040   |
	PLA					;$B89043   |
	STA $6E					;$B89044   |
	LDA #$0080				;$B89046   |
	STA $30,x				;$B89049   |
	LDA #$0059				;$B8904B   |
	STA $2E,x				;$B8904E   |
	STZ $1E,x				;$B89050   |
	LDA #$00A0				;$B89052   |
	JSL CODE_B9D0B8				;$B89055   |
	LDA #$0000				;$B89059   |
	STA $20,x				;$B8905C   |
	STA $26,x				;$B8905E   |
	LSR A					;$B89060   |
	EOR $12,x				;$B89061   |
	EOR #$FFFF				;$B89063   |
	AND #$4000				;$B89066   |
	EOR $12,x				;$B89069   |
	STA $12,x				;$B8906B   |
	LDA #$FB00				;$B8906D   |
	STA $24,x				;$B89070   |
	JSR CODE_B88DF7				;$B89072   |
	JSR CODE_B895E5				;$B89075   |
	JSR CODE_B89609				;$B89078   |
	JSL CODE_80889C				;$B8907B   |
	JSL CODE_BB8C19				;$B8907F   |
	LDX active_kong_sprite			;$B89083   |
	LDA #$0000				;$B89086   |
	STA $20,x				;$B89089   |
	STA $26,x				;$B8908B   |
	JSR CODE_B893DF				;$B8908D   |
	JSR work_on_active_kong			;$B89090   |
	LDA #$004F				;$B89093   |
	JSL CODE_B9D04B				;$B89096   |
	JSR start_damaged_invincibility		;$B8909A   |
	LDA $060D				;$B8909D   |
	CMP #$0001				;$B890A0   |
	BEQ CODE_B890A7				;$B890A3   |
	SEC					;$B890A5   |
	RTS					;$B890A6  /

CODE_B890A7:
	LDX active_kong_sprite			;$B890A7  \
	LDA #$006F				;$B890AA   |
	STA $2E,x				;$B890AD   |
	STZ $4A,x				;$B890AF   |
	LDA #$0007				;$B890B1   |
	LDY #$0000				;$B890B4   |
	JSR enable_bullet_time			;$B890B7   |
	SEC					;$B890BA   |
	RTS					;$B890BB  /

CODE_B890BC:
	LDX active_kong_sprite			;$B890BC  \
	LDA $10,x				;$B890BF   |
	AND #$0100				;$B890C1   |
	BEQ CODE_B890E0				;$B890C4   |
	LDA #$0001				;$B890C6   |
	TSB $0D56				;$B890C9   |
	LDA $0D54				;$B890CC   |
	CLC					;$B890CF   |
	ADC #$0008				;$B890D0   |
	STA $0D54				;$B890D3   |
	LDA $0A,x				;$B890D6   |
	CLC					;$B890D8   |
	ADC #$0008				;$B890D9   |
	STA $0A,x				;$B890DC   |
	STZ $24,x				;$B890DE   |
CODE_B890E0:					;	   |
	RTS					;$B890E0  /

CODE_B890E1:
	PHK					;$B890E1  \
	PLB					;$B890E2   |
	LDX current_player_mount		;$B890E3   |
	STX current_sprite			;$B890E5   |
	LDA $12,x				;$B890E7   |
	AND #$CFFF				;$B890E9   |
	ORA #$2000				;$B890EC   |
	STA $12,x				;$B890EF   |
	LDY active_kong_sprite			;$B890F1   |
	LDA $0010,y				;$B890F4   |
	AND #$0100				;$B890F7   |
	BEQ CODE_B89107				;$B890FA   |
	LDA #$0001				;$B890FC   |
	TSB $0D56				;$B890FF   |
	LDA #$0009				;$B89102   |
	BRA CODE_B8910A				;$B89105  /

CODE_B89107:
	LDA #$0002				;$B89107  \
CODE_B8910A:					;	   |
	STA $2E,x				;$B8910A   |
	LDA #$00D0				;$B8910C   |
	STA $02,x				;$B8910F   |
	LDA #$003C				;$B89111   |
	STA $42,x				;$B89114   |
	LDA $6E					;$B89116   |
	SEC					;$B89118   |
	SBC #$0190				;$B89119   |
	LSR A					;$B8911C   |
	AND #$00FE				;$B8911D   |
	TAY					;$B89120   |
	LDA DATA_B8914E,y			;$B89121   |
	STA $44,x				;$B89124   |
CODE_B89126:					;	   |
	LDA #$014C				;$B89126   |
	JSL CODE_B9D07B				;$B89129   |
	JSR CODE_B895E5				;$B8912D   |
	JSR CODE_B8957C				;$B89130   |
	JSR CODE_B8958F				;$B89133   |
	BCS CODE_B8913B				;$B89136   |
	JSR CODE_B89609				;$B89138   |
CODE_B8913B:					;	   |
	STZ $6E					;$B8913B   |
	STZ current_player_mount		;$B8913D   |
	LDA #$0080				;$B8913F   |
	LDY #$000E				;$B89142   |
	JSR enable_bullet_time			;$B89145   |
	JSL CODE_B5E43E				;$B89148   |
	SEC					;$B8914C   |
	RTS					;$B8914D  /

DATA_B8914E:
	db $A0, $02, $00, $04, $00, $04, $00, $04
	db $00, $04

	TAX					;$B89158   |
	LDA current_sprite			;$B89159   |
	PHA					;$B8915B   |
	LDA $66					;$B8915C   |
	PHA					;$B8915E   |
	STY current_sprite			;$B8915F   |
	DEY					;$B89161   |
	DEY					;$B89162   |
	STY $66					;$B89163   |
	TXA					;$B89165   |
	JSL CODE_B9D0B8				;$B89166   |
	PLA					;$B8916A   |
	STA $66					;$B8916B   |
	PLA					;$B8916D   |
	STA current_sprite			;$B8916E   |
	RTS					;$B89170  /

CODE_B89171:
	LDA $08A4				;$B89171  \
	BEQ CODE_B8917C				;$B89174   |
	TYA					;$B89176   |
	JSL transition_song			;$B89177   |
	RTS					;$B8917B  /

CODE_B8917C:
	TXA					;$B8917C  \
	JSL transition_song			;$B8917D   |
	RTS					;$B89181  /

CODE_B89182:
	JSR CODE_B89186				;$B89182  \
	RTL					;$B89185  /

CODE_B89186:
	LDA $08A4				;$B89186  \
	BEQ CODE_B89191				;$B89189   |
	TYA					;$B8918B   |
	JSL queue_sound_effect			;$B8918C   |
	RTS					;$B89190  /

CODE_B89191:
	TXA					;$B89191  \
	JSL queue_sound_effect			;$B89192   |
	RTS					;$B89196  /

CODE_B89197:
	LDA #$0002				;$B89197  \
	BIT $08C4				;$B8919A   |
	BEQ CODE_B891A0				;$B8919D   |
	RTS					;$B8919F  /

CODE_B891A0:
	LDA #$0020				;$B891A0  \
	STA $0D64				;$B891A3   |
	JSR CODE_B89201				;$B891A6   |
	JSR work_on_active_kong			;$B891A9   |
	LDA $04,x				;$B891AC   |
	STA $0D66				;$B891AE   |
	LDA $06,x				;$B891B1   |
	STA $0D68				;$B891B3   |
	LDA $08,x				;$B891B6   |
	STA $0D6A				;$B891B8   |
	LDA $0A,x				;$B891BB   |
	STA $0D6C				;$B891BD   |
	LDA $0D60				;$B891C0   |
	EOR #$FFFF				;$B891C3   |
	INC A					;$B891C6   |
	STA $20,x				;$B891C7   |
	LDA $0D62				;$B891C9   |
	EOR #$FFFF				;$B891CC   |
	INC A					;$B891CF   |
	STA $24,x				;$B891D0   |
	LDA #$0077				;$B891D2   |
	STA $2E,x				;$B891D5   |
	LDA #$0043				;$B891D7   |
	JSL CODE_B9D0B8				;$B891DA   |
	JSR work_on_inactive_kong		;$B891DE   |
	LDA $0D60				;$B891E1   |
	STA $20,x				;$B891E4   |
	LDA $0D62				;$B891E6   |
	STA $24,x				;$B891E9   |
	LDA #$0078				;$B891EB   |
	STA $2E,x				;$B891EE   |
	LDA #$0043				;$B891F0   |
	JSL CODE_B9D0B8				;$B891F3   |
	LDX #$0505				;$B891F7   |
	LDY #$0505				;$B891FA   |
	JSR CODE_B89186				;$B891FD   |
	RTS					;$B89200  /

CODE_B89201:
	LDX active_kong_sprite			;$B89201  \
	LDY inactive_kong_sprite		;$B89204   |
	LDA $06,x				;$B89207   |
	SEC					;$B89209   |
	SBC $0006,y				;$B8920A   |
	ASL A					;$B8920D   |
	ASL A					;$B8920E   |
	ASL A					;$B8920F   |
	STA $0D60				;$B89210   |
	LDA $0A,x				;$B89213   |
	SEC					;$B89215   |
	SBC $000A,y				;$B89216   |
	ASL A					;$B89219   |
	ASL A					;$B8921A   |
	ASL A					;$B8921B   |
	STA $0D62				;$B8921C   |
	RTS					;$B8921F  /

CODE_B89220:
	LDA #$0002				;$B89220  \
	BIT $08C4				;$B89223   |
	BEQ CODE_B89229				;$B89226   |
	RTS					;$B89228  /

CODE_B89229:
	LDX active_kong_sprite			;$B89229  \
	LDA $06,x				;$B8922C   |
	STA $72					;$B8922E   |
	LDA $0A,x				;$B89230   |
	STA $74					;$B89232   |
	LDY inactive_kong_sprite		;$B89234   |
	LDA $0006,y				;$B89237   |
	CMP $06,x				;$B8923A   |
	BPL CODE_B89243				;$B8923C   |
	LDA #$FFE4				;$B8923E   |
	BRA CODE_B89246				;$B89241  /

CODE_B89243:
	LDA #$001C				;$B89243  \
CODE_B89246:					;	   |
	STA $7C					;$B89246   |
	JSR CODE_B8CD97				;$B89248   |
	BCC CODE_B8924E				;$B8924B   |
CODE_B8924D:					;	   |
	RTS					;$B8924D  /

CODE_B8924E:
	LDX active_kong_sprite			;$B8924E  \
	LDA $0A,x				;$B89251   |
	SEC					;$B89253   |
	SBC $74					;$B89254   |
	BPL CODE_B8925C				;$B89256   |
	EOR #$FFFF				;$B89258   |
	INC A					;$B8925B   |
CODE_B8925C:					;	   |
	CMP #$0010				;$B8925C   |
	BPL CODE_B8924D				;$B8925F   |
if !version == 1				;	   |
	STZ $1C,x				;$B89261   |
	LDX $0595				;$B89263   |
	LDA #$0000				;$B89266   |
	STA $14,x				;$B89269   |
endif						;	   |
	LDX inactive_kong_sprite		;$B8926B   |
if !version == 1				;	   |
	STZ $1C,x				;$B8926E   |
endif						;	   |
	LDA $72					;$B89270   |
	STA $0D68				;$B89272   |
	STA $06,x				;$B89275   |
	LDA $74					;$B89277   |
	STA $0D6C				;$B89279   |
	STA $0A,x				;$B8927C   |
	JSR work_on_active_kong			;$B8927E   |
	LDA $06,x				;$B89281   |
	STA $0D66				;$B89283   |
	LDA $0A,x				;$B89286   |
	STA $0D6A				;$B89288   |
	LDA $0016,y				;$B8928B   |
	PHA					;$B8928E   |
	JSL CODE_80889C				;$B8928F   |
	LDY $0595				;$B89293   |
	PLA					;$B89296   |
	STA $0016,y				;$B89297   |
	LDX active_kong_sprite			;$B8929A   |
	LDY inactive_kong_sprite		;$B8929D   |
	LDA $0006,y				;$B892A0   |
	SEC					;$B892A3   |
	SBC $06,x				;$B892A4   |
	LSR A					;$B892A6   |
	EOR $12,x				;$B892A7   |
	AND #$4000				;$B892A9   |
	EOR $12,x				;$B892AC   |
	STA $12,x				;$B892AE   |
	LDA $0D66				;$B892B0   |
	SEC					;$B892B3   |
	SBC $0D68				;$B892B4   |
	BIT $12,x				;$B892B7   |
	BVC CODE_B892BF				;$B892B9   |
	EOR #$FFFF				;$B892BB   |
	INC A					;$B892BE   |
CODE_B892BF:					;	   |
	STA $0D7C				;$B892BF   |
	LDA $0D6A				;$B892C2   |
	SEC					;$B892C5   |
	SBC $0D6C				;$B892C6   |
	STA $0D7E				;$B892C9   |
	LDA #$FFFF				;$B892CC   |
	STA $0D80				;$B892CF   |
	LDA inactive_kong_sprite		;$B892D2   |
	STA $0D7A				;$B892D5   |
	JSR work_on_inactive_kong		;$B892D8   |
	LDA #$004A				;$B892DB   |
	STA $2E,x				;$B892DE   |
if !version == 1				;	   |
	STZ $20,x				;$B892E0   |
	STZ $26,x				;$B892E2   |
	STZ $24,x				;$B892E4   |
endif						;	   |
	LDA #$0001				;$B892E6   |
	JSL CODE_B9D0B8				;$B892E9   |
	JSR work_on_active_kong			;$B892ED   |
	LDA #$0049				;$B892F0   |
	STA $2E,x				;$B892F3   |
if !version == 1				;	   |
	STZ $20,x				;$B892F5   |
	STZ $26,x				;$B892F7   |
	STZ $24,x				;$B892F9   |
endif						;	   |
	LDA #$0049				;$B892FB   |
	JSL CODE_B9D0B8				;$B892FE   |
	LDA #$0007				;$B89302   |
if !version == 0				;	   |
	LDY #$0280				;$B89305   |
else						;	   |
	LDY #$0100				;$B89305   |
endif						;	   |
	JSR enable_bullet_time			;$B89308   |
	JSL CODE_BB8C19				;$B8930B   |
	LDX #$0505				;$B8930F   |
	LDY #$0505				;$B89312   |
	JSR CODE_B89186				;$B89315   |
	RTS					;$B89318  /

CODE_B89319:
	JSR CODE_B880BC				;$B89319  \
	JSR work_on_active_kong			;$B8931C   |
	LDA #$0048				;$B8931F   |
	STA $2E,x				;$B89322   |
	LDA $30,x				;$B89324   |
	ORA #$0080				;$B89326   |
	STA $30,x				;$B89329   |
	LDA $08C2				;$B8932B   |
	AND #$4000				;$B8932E   |
	BEQ CODE_B89342				;$B89331   |
	JSR work_on_inactive_kong		;$B89333   |
	LDA #$002F				;$B89336   |
	STA $2E,x				;$B89339   |
	LDA $30,x				;$B8933B   |
	ORA #$0080				;$B8933D   |
	STA $30,x				;$B89340   |
CODE_B89342:					;	   |
	LDA #$0047				;$B89342   |
	JSL CODE_B9D0B8				;$B89345   |
	RTS					;$B89349  /

CODE_B8934A:
	JSR work_on_active_kong			;$B8934A  \
	LDA $0A86				;$B8934D   |
	STA $42,x				;$B89350   |
	LDA $0A88				;$B89352   |
	STA $44,x				;$B89355   |
	LDA $0A8A				;$B89357   |
	STA $20,x				;$B8935A   |
	LDA $0A8C				;$B8935C   |
	STA $24,x				;$B8935F   |
	STZ $1E,x				;$B89361   |
	STZ $48,x				;$B89363   |
	STZ $4E,x				;$B89365   |
	LDA $30,x				;$B89367   |
	AND #$FF7F				;$B89369   |
	STA $30,x				;$B8936C   |
	LDA $08C2				;$B8936E   |
	AND #$4000				;$B89371   |
	BEQ CODE_B89380				;$B89374   |
	LDX inactive_kong_sprite		;$B89376   |
	LDA $30,x				;$B89379   |
	AND #$FF7F				;$B8937B   |
	STA $30,x				;$B8937E   |
CODE_B89380:					;	   |
	JSL CODE_B3F1EF				;$B89380   |
	RTS					;$B89384  /

CODE_B89385:
	JSL CODE_B8938A				;$B89385  \
	RTS					;$B89389  /

CODE_B8938A:
	LDX $0A84				;$B8938A  \
	STX current_sprite			;$B8938D   |
	LDA $0A8A				;$B8938F   |
	STA $32					;$B89392   |
	LDA $0A8C				;$B89394   |
	STA $34					;$B89397   |
	JML [$0032]				;$B89399  /

CODE_B8939C:
	LDA $091B				;$B8939C  \
	AND #$FF7F				;$B8939F   |
	STA $091B				;$B893A2   |
	JSL CODE_BB8C2C				;$B893A5   |
	RTS					;$B893A9  /

CODE_B893AA:
	JSR CODE_B8851B				;$B893AA  \
	BEQ CODE_B893B0				;$B893AD   |
	RTS					;$B893AF  /

CODE_B893B0:
	JSR CODE_B8939C				;$B893B0  \
	LDX #$0540				;$B893B3   |
	LDY #$0540				;$B893B6   |
	JSR CODE_B89186				;$B893B9   |
	STZ $0AEE				;$B893BC   |
	STZ $0AF2				;$B893BF   |
	LDX $0A84				;$B893C2   |
	STX current_player_mount		;$B893C5   |
	STX current_sprite			;$B893C7   |
	LDA $00,x				;$B893C9   |
	STA $6E					;$B893CB   |
	LDA #$0001				;$B893CD   |
	STA $2E,x				;$B893D0   |
	LDA #$004F				;$B893D2   |
	JSL CODE_B9D04B				;$B893D5   |
	BRA CODE_B893DF				;$B893D9  /

CODE_B893DB:
	JSR CODE_B893DF				;$B893DB  \
	RTL					;$B893DE  /

CODE_B893DF:
	LDX current_player_mount		;$B893DF  \
	LDA #$00E6				;$B893E1   |
	STA $02,x				;$B893E4   |
	JSR work_on_active_kong			;$B893E6   |
	LDA $6E					;$B893E9   |
	SEC					;$B893EB   |
	SBC #$0190				;$B893EC   |
	AND #$001C				;$B893EF   |
	TAY					;$B893F2   |
	TAX					;$B893F3   |
	LDA $08A4				;$B893F4   |
	BEQ CODE_B89409				;$B893F7   |
	LDA.l DATA_B89472,x			;$B893F9   |
	STA $0D72				;$B893FD   |
	LDA.l DATA_B89474,x			;$B89400   |
	STA $0D74				;$B89404   |
	BRA CODE_B89417				;$B89407  /

CODE_B89409:
	LDA.l DATA_B89486,x			;$B89409  \
	STA $0D72				;$B8940D   |
	LDA.l DATA_B89488,x			;$B89410   |
	STA $0D74				;$B89414   |
CODE_B89417:					;	   |
	TYA					;$B89417   |
	LSR A					;$B89418   |
	TAX					;$B89419   |
	JMP (DATA_B89462,x)			;$B8941A  /

CODE_B8941D:
	LDX current_sprite			;$B8941D  \
	LDA #$0009				;$B8941F   |
	STA $2E,x				;$B89422   |
CODE_B89424:					;	   |
	LDA #$0081				;$B89424   |
	JSL CODE_B9D08C				;$B89427   |
	JSR CODE_B895E5				;$B8942B   |
	JSR CODE_B89609				;$B8942E   |
	JSL CODE_B5E43E				;$B89431   |
	RTS					;$B89435  /

CODE_B89436:
	LDX current_sprite			;$B89436  \
	STZ $24,x				;$B89438   |
	LDA #$0050				;$B8943A   |
	STA $2E,x				;$B8943D   |
	BRA CODE_B89424				;$B8943F  /

CODE_B89441:
	JSR CODE_B8949A				;$B89441  \
	LDA #$0081				;$B89444   |
	JSL CODE_B9D08C				;$B89447   |
	JSR CODE_B895E5				;$B8944B   |
	JSR CODE_B89609				;$B8944E   |
	LDA #$0004				;$B89451   |
	LDX #$0060				;$B89454   |
	LDY #$0000				;$B89457   |
	JSR CODE_B8D8D5				;$B8945A   |
	JSL CODE_B5E43E				;$B8945D   |
	RTS					;$B89461  /

DATA_B89462:
	dw CODE_B8941D
	dw CODE_B8941D
	dw CODE_B89441
	dw CODE_B8941D
	dw CODE_B89436
	dw CODE_B8941D
	dw CODE_B8941D
	dw CODE_B8941D

;dixie animal position offsets
DATA_B89472:
%offset(DATA_B89474, 2)
	dw $FFFB, $FFFF				;Squitter
	dw $FFFC, $FFDD				;Rattly
	dw $FFFD, $0018				;Squawks
	dw $0001, $FFF2				;Rambi
	dw $0000, $0000				;Enguarde

;diddy animal position offsets
DATA_B89486:
%offset(DATA_B89488, 2)
	dw $FFF6, $000E				;Squitter
	dw $FFFC, $FFE8				;Rattly
	dw $FFFD, $0012				;Squawks
	dw $0000, $0000				;Rambi
	dw $FFFC, $000E				;Enguarde

CODE_B8949A:
	LDX current_sprite			;$B8949A  \
	LDA #$0010				;$B8949C   |
	STA $2E,x				;$B8949F   |
	LDA #$0100				;$B894A1   |
	STA $24,x				;$B894A4   |
	LDX current_player_mount		;$B894A6   |
	LDA $4A,x				;$B894A8   |
	AND #$0001				;$B894AA   |
	BNE CODE_B894B6				;$B894AD   |
	JSR set_player_normal_gravity		;$B894AF   |
	JSR set_player_terminal_velocity	;$B894B2   |
	RTS					;$B894B5  /

CODE_B894B6:
	JSR set_player_normal_gravity		;$B894B6  \
	LDA #$0100				;$B894B9   |
	LDY $66					;$B894BC   |
	STA $000A,y				;$B894BE   |
	RTS					;$B894C1  /

CODE_B894C2:
	LDY current_player_mount		;$B894C2  \
	BNE CODE_B894C7				;$B894C4   |
	RTS					;$B894C6  /

CODE_B894C7:
	LDX #$0502				;$B894C7  \
	LDY #$0502				;$B894CA   |
	JSR CODE_B89186				;$B894CD   |
	JSR work_on_active_kong			;$B894D0   |
	LDA $2E,x				;$B894D3   |
	STA $08B6				;$B894D5   |
	LDA #$00E4				;$B894D8   |
	STA $02,x				;$B894DB   |
	LDA #$F800				;$B894DD   |
	STA $32					;$B894E0   |
	LDA $6E					;$B894E2   |
	CMP #$01A0				;$B894E4   |
	BNE CODE_B894F0				;$B894E7   |
	LDA #$FE00				;$B894E9   |
	STA $32					;$B894EC   |
	BRA CODE_B894FA				;$B894EE  /

CODE_B894F0:
	CMP #$0198				;$B894F0  \
	BNE CODE_B894FA				;$B894F3   |
	LDA #$FA00				;$B894F5   |
	STA $32					;$B894F8   |
CODE_B894FA:					;	   |
	LDA $32					;$B894FA   |
	STA $24,x				;$B894FC   |
	LDA #$0006				;$B894FE   |
	STA $2E,x				;$B89501   |
	LDA #$0006				;$B89503   |
	JSL CODE_B9D0B8				;$B89506   |
	LDA $6E					;$B8950A   |
	PHA					;$B8950C   |
	STZ $6E					;$B8950D   |
	JSR set_player_normal_gravity		;$B8950F   |
	JSR set_player_terminal_velocity	;$B89512   |
	PLA					;$B89515   |
	STA $6E					;$B89516   |
	LDX current_player_mount		;$B89518   |
	STX current_sprite			;$B8951A   |
	STZ $1C,x				;$B8951C   |
	LDA #$00D0				;$B8951E   |
	STA $02,x				;$B89521   |
	LDA $08B6				;$B89523   |
	CMP #$0044				;$B89526   |
	BNE CODE_B89532				;$B89529   |
	LDA #$000A				;$B8952B   |
	STA $2E,x				;$B8952E   |
	BRA CODE_B89542				;$B89530  /

CODE_B89532:
	LDA $6E					;$B89532  \
	CMP #$01A0				;$B89534   |
	BNE CODE_B89540				;$B89537   |
	LDA #$0004				;$B89539   |
	STA $2E,x				;$B8953C   |
	BRA CODE_B89542				;$B8953E  /

CODE_B89540:
	STZ $2E,x				;$B89540  \
CODE_B89542:					;	   |
	LDA #$003C				;$B89542   |
	STA $42,x				;$B89545   |
	STZ $20,x				;$B89547   |
	STZ $26,x				;$B89549   |
	LDA #$0147				;$B8954B   |
	JSL CODE_B9D07B				;$B8954E   |
	JSR CODE_B895E5				;$B89552   |
	JSR CODE_B8957C				;$B89555   |
	JSR CODE_B8958F				;$B89558   |
	BCS CODE_B89560				;$B8955B   |
	JSR CODE_B89609				;$B8955D   |
CODE_B89560:					;	   |
	LDA $6E					;$B89560   |
	CMP #$0198				;$B89562   |
	BNE CODE_B89573				;$B89565   |
	LDA #$0004				;$B89567   |
	LDX #$0006				;$B8956A   |
	LDY #$0000				;$B8956D   |
	JSR CODE_B8D8D5				;$B89570   |
CODE_B89573:					;	   |
	STZ $6E					;$B89573   |
	STZ current_player_mount		;$B89575   |
	JSL CODE_B5E43E				;$B89577   |
	RTS					;$B8957B  /

CODE_B8957C:
	RTS					;$B8957C  /

	LDX current_player_mount		;$B8957D   |
	LDA $6E					;$B8957F   |
	CMP #$0190				;$B89581   |
	BNE CODE_B8958E				;$B89584   |
	LDA $0A,x				;$B89586   |
	SEC					;$B89588   |
	SBC #$0020				;$B89589   |
	STA $0A,x				;$B8958C   |
CODE_B8958E:					;	   |
	RTS					;$B8958E  /

CODE_B8958F:
	LDA $6E					;$B8958F  \
	CMP #$0190				;$B89591   |
	BEQ CODE_B895BF				;$B89594   |
	CMP #$0198				;$B89596   |
	BEQ CODE_B895BF				;$B89599   |
	LDX current_player_mount		;$B8959B   |
	STX current_sprite			;$B8959D   |
	LDA $0A,x				;$B8959F   |
	JSL CODE_B5C3E3				;$B895A1   |
	CMP #$0000				;$B895A5   |
	BMI CODE_B895BD				;$B895A8   |
	EOR #$FFFF				;$B895AA   |
	CLC					;$B895AD   |
	ADC #$6301				;$B895AE   |
	SEC					;$B895B1   |
	SBC $0A,x				;$B895B2   |
	BMI CODE_B895BF				;$B895B4   |
	CMP #$0004				;$B895B6   |
	BMI CODE_B895BD				;$B895B9   |
	SEC					;$B895BB   |
	RTS					;$B895BC  /

CODE_B895BD:
	CLC					;$B895BD  \
	RTS					;$B895BE  /

CODE_B895BF:
	LDX current_player_mount		;$B895BF  \
	LDY active_kong_sprite			;$B895C1   |
	LDA $000A,y				;$B895C4   |
	STA $0A,x				;$B895C7   |
	LDA $0006,y				;$B895C9   |
	STA $06,x				;$B895CC   |
	LDA $0008,y				;$B895CE   |
	STA $08,x				;$B895D1   |
	LDA $0004,y				;$B895D3   |
	STA $04,x				;$B895D6   |
	LDA $001E,y				;$B895D8   |
	AND #$EFEF				;$B895DB   |
	STA $001E,y				;$B895DE   |
	STA $1E,x				;$B895E1   |
	SEC					;$B895E3   |
	RTS					;$B895E4  /

CODE_B895E5:
	LDX active_kong_sprite			;$B895E5  \
	LDY current_player_mount		;$B895E8   |
	LDA $0012,y				;$B895EA   |
	STA $32					;$B895ED   |
	LDA $12,x				;$B895EF   |
	EOR $0012,y				;$B895F1   |
	AND #$0E00				;$B895F4   |
	EOR $0012,y				;$B895F7   |
	STA $0012,y				;$B895FA   |
	LDA $32					;$B895FD   |
	EOR $12,x				;$B895FF   |
	AND #$0E00				;$B89601   |
	EOR $12,x				;$B89604   |
	STA $12,x				;$B89606   |
	RTS					;$B89608  /

CODE_B89609:
	LDX active_kong_sprite			;$B89609  \
	LDY current_player_mount		;$B8960C   |
	LDA $0006,y				;$B8960E   |
	STA $32					;$B89611   |
	LDA $06,x				;$B89613   |
	STA $0006,y				;$B89615   |
	LDA $32					;$B89618   |
	STA $06,x				;$B8961A   |
	LDA $001E,y				;$B8961C   |
	STA $32					;$B8961F   |
	LDA $1E,x				;$B89621   |
	STA $001E,y				;$B89623   |
	LDA $32					;$B89626   |
	AND #$CFCF				;$B89628   |
	STA $1E,x				;$B8962B   |
	LDA $0C,x				;$B8962D   |
	STA $000C,y				;$B8962F   |
	LDA $0E,x				;$B89632   |
	STA $000E,y				;$B89634   |
	LDA $0004,y				;$B89637   |
	STA $32					;$B8963A   |
	LDA $04,x				;$B8963C   |
	STA $0004,y				;$B8963E   |
	LDA $32					;$B89641   |
	STA $04,x				;$B89643   |
	LDA $000A,y				;$B89645   |
	STA $32					;$B89648   |
	LDA $0A,x				;$B8964A   |
	STA $000A,y				;$B8964C   |
	LDA $32					;$B8964F   |
	STA $0A,x				;$B89651   |
	LDA $0008,y				;$B89653   |
	STA $32					;$B89656   |
	LDA $08,x				;$B89658   |
	STA $0008,y				;$B8965A   |
	LDA $32					;$B8965D   |
	STA $08,x				;$B8965F   |
	LDA $001E,y				;$B89661   |
	AND #$1000				;$B89664   |
	BEQ CODE_B8966C				;$B89667   |
	LDA #$0400				;$B89669   |
CODE_B8966C:					;	   |
	STA $0024,y				;$B8966C   |
	RTS					;$B8966F  /

CODE_B89670:
	LDA #$16D8				;$B89670  \
	STA $66					;$B89673   |
	LDA #main_sprite_table_end		;$B89675   |
	STA $0591				;$B89678   |
	BRA CODE_B89688				;$B8967B  /

CODE_B8967D:
	LDA #main_sprite_table_end		;$B8967D  \
	STA $66					;$B89680   |
	LDA #$16D8				;$B89682   |
	STA $0591				;$B89685   |
CODE_B89688:					;	   |
	LDX current_sprite			;$B89688   |\ 
	CPX active_kong_sprite			;$B8968A   | |
	BNE kong_behavior_handler		;$B8968D   |/
	LDA #$0002				;$B8968F   |
	TRB $0B02				;$B89692   |
	BEQ kong_behavior_handler		;$B89695   |
	LDA #$0020				;$B89697   |\
	JSR process_player_action		;$B8969A   |/ player riding skull cart
	BRL CODE_B8996E				;$B8969D  /

kong_behavior_handler:
	LDA $30,x				;$B896A0  \
	AND #$F7FF				;$B896A2   |
	STA $30,x				;$B896A5   |
	LDA $54,x				;$B896A7   |\ 
	STA $8E					;$B896A9   |/
	PHK					;$B896AB   |
	PLB					;$B896AC   |
	LDA $2E,x				;$B896AD   |
	ASL A					;$B896AF   |
	ASL A					;$B896B0   |
	TAX					;$B896B1   |
	JMP (kong_behavior_table,x)		;$B896B2  /


kong_behavior_table:
	%offset(DATA_B896B7, 2)
	dw kong_behavior_00 : db $00, $00	;00
	dw kong_behavior_01 : db $00, $00	;01
	dw kong_behavior_02 : db $00, $00	;02
	dw kong_behavior_03 : db $00, $00	;03
	dw kong_behavior_04 : db $00, $00	;04
	dw kong_behavior_05 : db $01, $00	;05
	dw kong_behavior_06 : db $00, $00	;06
	dw kong_behavior_07 : db $00, $00	;07
	dw kong_behavior_08 : db $04, $00	;08
	dw kong_behavior_09 : db $00, $00	;09
	dw kong_behavior_0A : db $00, $00	;0A
	dw kong_behavior_0B : db $00, $00	;0B
	dw kong_behavior_0C : db $00, $00	;0C
	dw kong_behavior_0D : db $00, $00	;0D
	dw kong_behavior_0E : db $00, $00	;0E
	dw kong_behavior_0F : db $00, $00	;0F
	dw kong_behavior_10 : db $00, $00	;10
	dw kong_behavior_11 : db $48, $00	;11
	dw kong_behavior_12 : db $40, $00	;12
	dw kong_behavior_13 : db $04, $02	;13
	dw kong_behavior_14 : db $00, $00	;14
	dw kong_behavior_15 : db $00, $00	;15
	dw kong_behavior_16 : db $00, $00	;16
	dw kong_behavior_17 : db $00, $00	;17
	dw kong_behavior_18 : db $00, $00	;18
	dw kong_behavior_19 : db $00, $00	;19
	dw kong_behavior_1A : db $00, $00	;1A
	dw kong_behavior_1B : db $00, $00	;1B
	dw kong_behavior_1C : db $00, $00	;1C
	dw kong_behavior_1D : db $00, $00	;1D
	dw kong_behavior_1E : db $00, $00	;1E
	dw kong_behavior_1F : db $00, $00	;1F
	dw kong_behavior_20 : db $04, $02	;20
	dw kong_behavior_21 : db $00, $00	;21
	dw kong_behavior_22 : db $10, $00	;22
	dw kong_behavior_23 : db $08, $00	;23
	dw kong_behavior_24 : db $01, $02	;24
	dw kong_behavior_25 : db $04, $02	;25
	dw kong_behavior_26 : db $04, $02	;26
	dw kong_behavior_27 : db $04, $02	;27
	dw kong_behavior_28 : db $04, $02	;28
	dw kong_behavior_29 : db $00, $00	;29
	dw kong_behavior_2A : db $10, $00	;2A
	dw kong_behavior_2B : db $00, $00	;2B
	dw kong_behavior_2C : db $88, $02	;2C
	dw kong_behavior_2D : db $00, $00	;2D
if !version == 0
	dw kong_behavior_2E : db $00, $02	;2E
else
	dw kong_behavior_2E : db $04, $02	;2E
endif
	dw kong_behavior_2F : db $00, $00	;2F
	dw kong_behavior_30 : db $6C, $00	;30
	dw kong_behavior_31 : db $00, $02	;31
	dw kong_behavior_32 : db $00, $02	;32
	dw kong_behavior_33 : db $20, $00	;33
	dw kong_behavior_34 : db $20, $00	;34
	dw kong_behavior_35 : db $00, $00	;35
	dw kong_behavior_36 : db $00, $00	;36
	dw kong_behavior_37 : db $00, $00	;37
	dw kong_behavior_38 : db $00, $00	;38
	dw kong_behavior_39 : db $00, $00	;39
	dw kong_behavior_3A : db $00, $00	;3A
	dw kong_behavior_3B : db $04, $00	;3B
	dw kong_behavior_3C : db $04, $00	;3C
	dw kong_behavior_3D : db $00, $00	;3D
	dw kong_behavior_3E : db $00, $00	;3E
	dw kong_behavior_3F : db $00, $00	;3F
	dw kong_behavior_40 : db $00, $00	;40
	dw kong_behavior_41 : db $00, $00	;41
	dw kong_behavior_42 : db $00, $00	;42
	dw kong_behavior_43 : db $00, $00	;43
	dw kong_behavior_44 : db $00, $00	;44
	dw kong_behavior_45 : db $00, $00	;45
	dw kong_behavior_46 : db $20, $00	;46
	dw kong_behavior_47 : db $24, $00	;47
	dw kong_behavior_48 : db $00, $00	;48
	dw kong_behavior_49 : db $0C, $02	;49
	dw kong_behavior_4A : db $0C, $02	;4A
	dw kong_behavior_4B : db $0C, $02	;4B
	dw kong_behavior_4C : db $08, $02	;4C
	dw kong_behavior_4D : db $00, $00	;4D
	dw kong_behavior_4E : db $00, $00	;4E
	dw kong_behavior_4F : db $00, $00	;4F
	dw kong_behavior_50 : db $00, $00	;50
	dw kong_behavior_51 : db $00, $00	;51
	dw kong_behavior_52 : db $00, $00	;52
	dw kong_behavior_53 : db $00, $00	;53
	dw kong_behavior_50 : db $00, $00	;54
	dw kong_behavior_55 : db $00, $00	;55
	dw kong_behavior_56 : db $00, $00	;56
	dw kong_behavior_57 : db $00, $00	;57
	dw kong_behavior_58 : db $00, $00	;58
	dw kong_behavior_59 : db $00, $00	;59
	dw kong_behavior_5A : db $00, $00	;5A
	dw kong_behavior_5B : db $02, $00	;5B
	dw kong_behavior_5B : db $02, $00	;5C
	dw kong_behavior_5D : db $00, $00	;5D
	dw kong_behavior_5E : db $00, $00	;5E
	dw kong_behavior_5F : db $00, $00	;5F
	dw kong_behavior_60 : db $00, $00	;60
	dw kong_behavior_61 : db $00, $00	;61
	dw kong_behavior_62 : db $00, $00	;62
	dw kong_behavior_63 : db $00, $00	;63
	dw kong_behavior_64 : db $20, $00	;64
	dw kong_behavior_65 : db $20, $00	;65
	dw kong_behavior_66 : db $20, $00	;66
	dw kong_behavior_67 : db $02, $00	;67
	dw kong_behavior_68 : db $00, $00	;68
	dw kong_behavior_69 : db $04, $00	;69
	dw kong_behavior_6A : db $00, $00	;6A
	dw kong_behavior_6B : db $00, $00	;6B
	dw kong_behavior_6C : db $00, $00	;6C
	dw kong_behavior_6D : db $00, $00	;6D
	dw kong_behavior_6E : db $00, $00	;6E
	dw kong_behavior_6F : db $04, $02	;6F
	dw kong_behavior_70 : db $00, $00	;70
	dw kong_behavior_71 : db $00, $00	;71
	dw kong_behavior_72 : db $00, $00	;72
	dw kong_behavior_73 : db $00, $01	;73
	dw kong_behavior_74 : db $00, $01	;74
	dw kong_behavior_75 : db $00, $01	;75
	dw kong_behavior_76 : db $00, $00	;76
	dw kong_behavior_77 : db $0C, $02	;77
	dw kong_behavior_78 : db $0C, $02	;78
	dw kong_behavior_79 : db $08, $00	;79
	dw kong_behavior_7A : db $08, $00	;7A
	dw kong_behavior_7B : db $08, $00	;7B
	dw kong_behavior_7C : db $00, $01	;7C
	dw kong_behavior_7D : db $06, $02	;7D
	dw kong_behavior_7E : db $04, $02	;7E
	dw kong_behavior_7F : db $06, $02	;7F


CODE_B898B5:
	JSR apply_player_gravity		;$B898B5  \
	LDA #$0003				;$B898B8   |
	JSR interpolate_x_velocity		;$B898BB   |
	LDX current_sprite			;$B898BE   |
	STZ $2C,x				;$B898C0   |
CODE_B898C2:					;	   |
	JSR check_sprite_underwater		;$B898C2   |
	BEQ CODE_B89903				;$B898C5   |
	CMP #$0002				;$B898C7   |
	BEQ CODE_B89903				;$B898CA   |
	LDA $1E,x				;$B898CC   |
	AND #$0101				;$B898CE   |
	BEQ CODE_B898F3				;$B898D1   |
	JSR set_player_terminal_velocity	;$B898D3   |
	JSR set_player_normal_gravity		;$B898D6   |
	JSL CODE_B5E43E				;$B898D9   |
	LDA $6E					;$B898DD   |
	CMP #$01A0				;$B898DF   |
	BEQ CODE_B898E9				;$B898E2   |
	JSL CODE_B9DFCF				;$B898E4   |
CODE_B898E8:					;	   |
	RTS					;$B898E8  /

CODE_B898E9:
	LDX current_sprite			;$B898E9  \
	LDA #$006C				;$B898EB   |
	STA $2E,x				;$B898EE   |
	STZ $26,x				;$B898F0   |
	RTS					;$B898F2  /

CODE_B898F3:
	LDA $24,x				;$B898F3  \
	BPL CODE_B898F9				;$B898F5   |
	STZ $24,x				;$B898F7   |
CODE_B898F9:					;	   |
	LDA $0D4A				;$B898F9   |
	DEC A					;$B898FC   |
	BMI CODE_B89908				;$B898FD   |
	STA $24,x				;$B898FF   |
	BRA CODE_B89908				;$B89901  /

CODE_B89903:
	JSR CODE_B8B615				;$B89903  \
	BCS CODE_B898E8				;$B89906   |
CODE_B89908:					;	   |
	LDX current_sprite			;$B89908   |
	LDA $24,x				;$B8990A   |
	PHA					;$B8990C   |
	PHX					;$B8990D   |
	JSR CODE_B8D5E6				;$B8990E   |
	PLX					;$B89911   |
	PLY					;$B89912   |
	LDA $1E,x				;$B89913   |
	AND #$0001				;$B89915   |
	BEQ CODE_B8991D				;$B89918   |
	TYA					;$B8991A   |
	STZ $24,x				;$B8991B   |
CODE_B8991D:					;	   |
	JSR CODE_B8D225				;$B8991D   |
	JSR update_damaged_invincibility	;$B89920   |
	JSL CODE_B9D100				;$B89923   |
	RTS					;$B89927  /

CODE_B89928:
	JSR CODE_B8CF83				;$B89928  \
	JSR update_damaged_invincibility	;$B8992B   |
	JSL CODE_B9D0F3				;$B8992E   |
	RTS					;$B89932  /

CODE_B89933:
	JSR apply_player_gravity		;$B89933  \
	JSR get_x_acceleration			;$B89936   |
	LDA [$8E],y				;$B89939   |
	JSR interpolate_x_velocity		;$B8993B   |
	JSR CODE_B8D24A				;$B8993E   |
	JSR CODE_B8D5E6				;$B89941   |
	JSR update_damaged_invincibility	;$B89944   |
	JSL CODE_B9D100				;$B89947   |
	RTS					;$B8994B  /

CODE_B8994C:
	JSR apply_player_gravity		;$B8994C  \
CODE_B8994F:					;	   |
	JSR get_x_acceleration			;$B8994F   |
	LDA [$8E],y				;$B89952   |
	JSR interpolate_x_velocity		;$B89954   |
CODE_B89957:					;	   |
	JSR CODE_B8D24A				;$B89957   |
	JSR CODE_B8D5E6				;$B8995A   |
	JSR CODE_B8B516				;$B8995D   |
CODE_B89960:					;	   |
	JSR CODE_B8D225				;$B89960   |
CODE_B89963:					;	   |
	JSR CODE_B8B53A				;$B89963   |
CODE_B89966:					;	   |
	JSR update_damaged_invincibility	;$B89966   |
	JSL CODE_B9D100				;$B89969   |
	RTS					;$B8996D  /

CODE_B8996E:
	STZ $0BA2				;$B8996E  \
	LDX current_sprite			;$B89971   |
	STZ $32,x				;$B89973   |
CODE_B89975:					;	   |
	JSL CODE_BCFAEA				;$B89975   |
CODE_B89979:					;	   |
	PHK					;$B89979   |
	PLB					;$B8997A   |
	JML [$05A9]				;$B8997B  /

CODE_B8997E:
	LDX current_sprite			;$B8997E  \
	CPX active_kong_sprite			;$B89980   |
	BEQ CODE_B8996E				;$B89983   |
	BRA CODE_B89979				;$B89985  /

get_x_acceleration:
	LDA $6E					;$B89987  \ \ check if player has animal
	BNE .has_animal				;$B89989   |/
	LDA $052B				;$B8998B   |\ check if level is slippery
	AND #$3000				;$B8998E   |/
	BNE .slippery_level			;$B89991   |
.jumped_from_ground				;	   |
	LDY #$0010				;$B89993   |
	RTS					;$B89996  /

.has_animal
	CMP #$0198				;$B89997  \
	BEQ .squawks				;$B8999A   |
	TAY					;$B8999C   |
	LDA $052B				;$B8999D   |
	AND #$3000				;$B899A0   |
	BNE .slippery_level			;$B899A3   |
	TYA					;$B899A5   |
.riding_animal					;	   |
	SEC					;$B899A6   |
	SBC #$FFD0				;$B899A7   |
	LSR A					;$B899AA   |
	TAY					;$B899AB   |
	RTS					;$B899AC  /

.squawks
	LDY current_player_mount		;$B899AD  \
	BNE .riding_animal			;$B899AF   |
	LDY #$0086				;$B899B1   |
	RTS					;$B899B4  /

.slippery_level
	TAY					;$B899B5  \
	LDX current_sprite			;$B899B6   |
	LDA $1E,x				;$B899B8   |
	AND #$1001				;$B899BA   |
	BEQ .jumped_from_ground			;$B899BD   |
	TYA					;$B899BF   |
	AND #$2000				;$B899C0   |
	BNE .slippery_terrain			;$B899C3   |
	LDY #$0012				;$B899C5   |
	BRA CODE_B899DC				;$B899C8  /
.slippery_terrain
	LDY #$0016				;$B899CA  \
	LDA $0A,x				;$B899CD   |
	SEC					;$B899CF   |
	SBC $0D4E				;$B899D0   |
	BNE CODE_B899DC				;$B899D3   |
	LDA $26,x				;$B899D5   |
	BNE CODE_B899DC				;$B899D7   |
	LDY #$001A				;$B899D9   |
CODE_B899DC:					;	   |
	LDX $66					;$B899DC   |
	LDA $06,x				;$B899DE   |
	AND #$0004				;$B899E0   |
	BNE CODE_B899E6				;$B899E3   |
	RTS					;$B899E5  /

CODE_B899E6:
	TYA					;$B899E6  \
	CLC					;$B899E7   |
	ADC #$0002				;$B899E8   |
	TAY					;$B899EB   |
	RTS					;$B899EC  /

kong_behavior_00:
	LDA #$0000				;$B899ED  \
	JSR process_player_action		;$B899F0   |
	JSR CODE_B8B8DA				;$B899F3   |
	JSR CODE_B8994C				;$B899F6   |
	JSR CODE_B8B5C3				;$B899F9   |
	JMP CODE_B8996E				;$B899FC  /

kong_behavior_01:
	LDA #$0001				;$B899FF  \
	JSR process_player_action		;$B89A02   |
	JSR face_moving_direction		;$B89A05   |
	JSR set_normal_gravity_if_falling	;$B89A08   |
	JSR CODE_B8994C				;$B89A0B   |
	JSR CODE_B8B714				;$B89A0E   |
	JSR CODE_B8B5C3				;$B89A11   |
	JMP CODE_B8996E				;$B89A14  /

kong_behavior_02:
	LDA #$0003				;$B89A17  \
	JSR process_player_action		;$B89A1A   |
	JSR face_moving_direction		;$B89A1D   |
	LDX $66					;$B89A20   |
	LDA global_frame_counter		;$B89A22   |
	SEC					;$B89A24   |
	SBC $10,x				;$B89A25   |
	CMP $24,x				;$B89A27   |
	BCC .CODE_B89A3A			;$B89A29   |
	JSR CODE_B8B8AB				;$B89A2B   |
	JSR CODE_B8994C				;$B89A2E   |
	JSR CODE_B89A4A				;$B89A31   |
	JSR CODE_B8B5C3				;$B89A34   |
	JMP CODE_B8996E				;$B89A37  /

.CODE_B89A3A
	LDX current_sprite			;$B89A3A  \
	STZ $24,x				;$B89A3C   |
	JSR CODE_B8994F				;$B89A3E   |
	JSR CODE_B89A4A				;$B89A41   |
	JSR CODE_B8B5C3				;$B89A44   |
	JMP CODE_B8996E				;$B89A47  /

CODE_B89A4A:
	LDX current_sprite			;$B89A4A  \
	LDA $10,x				;$B89A4C   |
	AND #$0007				;$B89A4E   |
	CMP #$0006				;$B89A51   |
	BEQ .CODE_B89A57			;$B89A54   |
.CODE_B89A56					;	   |
	RTS					;$B89A56  /

.CODE_B89A57
	LDA $1E,x				;$B89A57  \
	LSR A					;$B89A59   |
	BCC .CODE_B89A56			;$B89A5A   |
	LDA #$0100				;$B89A5C   |
	STA $24,x				;$B89A5F   |
	RTS					;$B89A61  /

kong_behavior_03:
	BRA kong_behavior_02			;$B89A62  /

kong_behavior_04:
	LDA #$0002				;$B89A64  \
	JSR process_player_action		;$B89A67   |
	JSR CODE_B8994C				;$B89A6A   |
	JSR CODE_B8B5C3				;$B89A6D   |
	JMP CODE_B8996E				;$B89A70  /

kong_behavior_05:
	LDA #$0004				;$B89A73  \
	JSR process_player_action		;$B89A76   |
	LDX current_sprite			;$B89A79   |
	STZ $2C,x				;$B89A7B   |
	JSR CODE_B8994C				;$B89A7D   |
	JMP CODE_B8996E				;$B89A80  /

kong_behavior_06:
	JMP kong_behavior_01			;$B89A83  /

kong_behavior_07:
	LDA #$0005				;$B89A86  \
	JSR process_player_action		;$B89A89   |
	JSR CODE_B8994C				;$B89A8C   |
	JMP CODE_B8996E				;$B89A8F  /

kong_behavior_08:
	LDA #$0006				;$B89A92  \
	JSR process_player_action		;$B89A95   |
	JSR CODE_B8D5E6				;$B89A98   |
	JSL CODE_B9D100				;$B89A9B   |
	JMP CODE_B8996E				;$B89A9F  /

kong_behavior_09:
	LDA $6E					;$B89AA2  \
	CMP #$0194				;$B89AA4   |
	BEQ .has_rattly				;$B89AA7   |
	LDX current_sprite			;$B89AA9   |
	LDA $32,x				;$B89AAB   |
	CMP #$0002				;$B89AAD   |
	BEQ .CODE_B89ADA			;$B89AB0   |
	LDA #$0007				;$B89AB2   |
	JSR process_player_action		;$B89AB5   |
	JSR CODE_B8B8DA				;$B89AB8   |
	JSR CODE_B8994C				;$B89ABB   |
	JSR CODE_B89AE0				;$B89ABE   |
	JMP CODE_B8996E				;$B89AC1  /

.has_rattly
	LDA #$0007				;$B89AC4  \
	JSR process_player_action		;$B89AC7   |
	LDA #$000C				;$B89ACA   |
	JSL CODE_BCFA9A				;$B89ACD   |
	JSR CODE_B8994C				;$B89AD1   |
	JSR CODE_B8B5DA				;$B89AD4   |
	JMP CODE_B8996E				;$B89AD7  /

.CODE_B89ADA
	JSR start_rambi_attack			;$B89ADA  \
	JMP CODE_B8996E				;$B89ADD  /

CODE_B89AE0:
	LDA $6E					;$B89AE0  \
	CMP #$019C				;$B89AE2   |
	BNE .return				;$B89AE5   |
	LDY $66					;$B89AE7   |
	LDA $0000,y				;$B89AE9   |
	CMP #$008E				;$B89AEC   |
	BEQ .return				;$B89AEF   |
	LDA #$0008				;$B89AF1   |
	JSL CODE_BCFA9A				;$B89AF4   |
	LDX current_sprite			;$B89AF8   |
	LDA $30,x				;$B89AFA   |
	ORA #$0800				;$B89AFC   |
	STA $30,x				;$B89AFF   |
.return						;	   |
	RTS					;$B89B01  /

kong_behavior_0A:
	LDX current_sprite			;$B89B02  \
	LDA #$0008				;$B89B04   |
	JSR process_player_action		;$B89B07   |
	JSR face_moving_direction		;$B89B0A   |
	JSR set_normal_gravity_if_falling	;$B89B0D   |
	JSR CODE_B8994C				;$B89B10   |
	JSR CODE_B8B5DA				;$B89B13   |
	LDA $6E					;$B89B16   |
	CMP #$019C				;$B89B18   |
	BNE .CODE_B89B24			;$B89B1B   |
	LDA #$0008				;$B89B1D   |
	JSL CODE_BCFA9A				;$B89B20   |
.CODE_B89B24					;	   |
	JMP CODE_B8996E				;$B89B24  /

kong_behavior_0B:
	JSR CODE_B89B49				;$B89B27  \
	JSR CODE_B89B30				;$B89B2A   |
	JMP kong_behavior_0A			;$B89B2D  /

CODE_B89B30:
	LDA level_number			;$B89B30  \
	CMP #!level_rambi_rumble_bonus_2	;$B89B32   |
	BNE .return				;$B89B35   |
	LDX current_sprite			;$B89B37   |
	LDA #$0110				;$B89B39   |
	CMP $0A,x				;$B89B3C   |
	BMI .return				;$B89B3E   |
	STA $0A,x				;$B89B40   |
	LDA $24,x				;$B89B42   |
	BPL .return				;$B89B44   |
	STZ $24,x				;$B89B46   |
.return:					;	   |
	RTS					;$B89B48  /

CODE_B89B49:
	LDA level_number			;$B89B49  \
	CMP #!level_web_woods_squitter_room	;$B89B4B   |
	BEQ .CODE_B89B8B			;$B89B4E   |
	CMP #$006E				;$B89B50   |
	BEQ .CODE_B89B8B			;$B89B53   |
	LDX current_sprite			;$B89B55   |
	LDA $24,x				;$B89B57   |
	BPL .CODE_B89B9B			;$B89B59   |
	LDA $6E					;$B89B5B   |
	SEC					;$B89B5D   |
	SBC #$0190				;$B89B5E   |
	LSR A					;$B89B61   |
	TAX					;$B89B62   |
	LDA.l .DATA_B89B81,x			;$B89B63   |
	STA $32					;$B89B67   |
	LDA level_number			;$B89B69   |
	CMP #!level_animal_antics_squitter_area	;$B89B6B   |
	BNE .CODE_B89B75			;$B89B6E   |
	LDA #$00F8				;$B89B70   |
	STA $32					;$B89B73   |
.CODE_B89B75					;	   |
	LDX current_sprite			;$B89B75   |
	LDA $0A,x				;$B89B77   |
	CMP $32					;$B89B79   |
	BPL .CODE_B89B9B			;$B89B7B   |
	STZ $24,x				;$B89B7D   |
	BRA .CODE_B89B9B			;$B89B7F  /

.DATA_B89B81
	db $08, $01, $00, $01, $20, $01, $00, $01
	db $00, $01


.CODE_B89B8B
	LDX current_sprite			;$B89B8B  \
	LDA $24,x				;$B89B8D   |
	BPL .CODE_B89B9B			;$B89B8F   |
	LDA $0A,x				;$B89B91   |
	SEC					;$B89B93   |
	SBC $17C0				;$B89B94   |
	BPL .CODE_B89B9B			;$B89B97   |
	STZ $24,x				;$B89B99   |
.CODE_B89B9B					;	   |
	RTS					;$B89B9B  /

kong_behavior_0C:
	LDA #$0009				;$B89B9C  \
	JSR process_player_action		;$B89B9F   |
	JSR CODE_B8B8DA				;$B89BA2   |
	JSR CODE_B8994C				;$B89BA5   |
	LDX current_sprite			;$B89BA8   |
	LDA $2E,x				;$B89BAA   |
	CMP #$000C				;$B89BAC   |
	BEQ CODE_B89BB4				;$B89BAF   |
	JMP CODE_B8996E				;$B89BB1  /

CODE_B89BB4:
	LDA $0D7A				;$B89BB4  \
	BEQ CODE_B89BCD				;$B89BB7   |
	JSR CODE_B8B65A				;$B89BB9   |
	BCC CODE_B89BC7				;$B89BBC   |
	LDA #$0007				;$B89BBE   |
	JSR set_player_interaction		;$B89BC1   |
	JMP CODE_B8996E				;$B89BC4  /

CODE_B89BC7:
	JSR CODE_B8B5DA				;$B89BC7  \
	JMP CODE_B8996E				;$B89BCA  /

CODE_B89BCD:
	JSR start_player_falling		;$B89BCD  \
	JMP CODE_B8996E				;$B89BD0  /

kong_behavior_0D:
	LDA #$000A				;$B89BD3  \
	JSR process_player_action		;$B89BD6   |
	JSR face_moving_direction		;$B89BD9   |
	JSR set_normal_gravity_if_falling	;$B89BDC   |
	JSR CODE_B8994C				;$B89BDF   |
	BRA CODE_B89BB4				;$B89BE2  /

kong_behavior_0E:
	JMP kong_behavior_0D			;$B89BE4  /

kong_behavior_0F:
	LDA #$0012				;$B89BE7  \
	JSR process_player_action		;$B89BEA   |
	JSR CODE_B8A186				;$B89BED   |
	JSR CODE_B89960				;$B89BF0   |
	JMP CODE_B8996E				;$B89BF3  /

kong_behavior_10:
	LDX current_player_mount		;$B89BF6  \
	BEQ .CODE_B89C01			;$B89BF8   |
	LDA $4A,x				;$B89BFA   |
	AND #$0001				;$B89BFC   |
	BNE .CODE_B89C10			;$B89BFF   |
.CODE_B89C01					;	   |
	LDA #$000B				;$B89C01   |
	JSR process_player_action		;$B89C04   |
	JSR CODE_B89C3C				;$B89C07   |
	JSR CODE_B8B5DA				;$B89C0A   |
	JMP CODE_B8996E				;$B89C0D  /

.CODE_B89C10
	TXY					;$B89C10  \
	LDX current_sprite			;$B89C11   |
	LDA $004C,y				;$B89C13   |
	CMP $0A,x				;$B89C16   |
	BMI .CODE_B89C26			;$B89C18   |
	LDA #$001A				;$B89C1A   |
	JSR process_player_action		;$B89C1D   |
	JSR CODE_B89C3C				;$B89C20   |
	JMP CODE_B8996E				;$B89C23  /

.CODE_B89C26:
	LDX current_sprite			;$B89C26  \
	LDA #$0044				;$B89C28   |
	STA $2E,x				;$B89C2B   |
	LDA #$005A				;$B89C2D   |
	STA $42,x				;$B89C30   |
	LDA #$052F				;$B89C32   |
	JSL queue_sound_effect			;$B89C35   |
	JMP kong_behavior_44			;$B89C39  /

CODE_B89C3C:
	JSR CODE_B89CED				;$B89C3C  \
	JSR CODE_B89C61				;$B89C3F   |
	JSR CODE_B89C4C				;$B89C42   |
	JSR CODE_B89C70				;$B89C45   |
	JSR CODE_B89960				;$B89C48   |
	RTS					;$B89C4B  /

CODE_B89C4C:
	JSR apply_player_gravity		;$B89C4C  \
	JSR get_x_acceleration			;$B89C4F   |
	LDA [$8E],y				;$B89C52   |
	JSR interpolate_x_velocity		;$B89C54   |
	JSR CODE_B8D24A				;$B89C57   |
	JSR CODE_B8D5E6				;$B89C5A   |
	JSR CODE_B8B516				;$B89C5D   |
	RTS					;$B89C60  /

CODE_B89C61:
	LDX current_sprite			;$B89C61  \
	LDA $0A,x				;$B89C63   |
	CMP #$0120				;$B89C65   |
	BPL .CODE_B89C6F			;$B89C68   |
	LDA #$0010				;$B89C6A   |
	STA $24,x				;$B89C6D   |
.CODE_B89C6F					;	   |
	RTS					;$B89C6F  /

CODE_B89C70:
	LDX current_sprite			;$B89C70  \
	LDA $0A,x				;$B89C72   |
	CMP #$0120				;$B89C74   |
	BPL .CODE_B89C7E			;$B89C77   |
	LDA #$0010				;$B89C79   |
	STA $24,x				;$B89C7C   |
.CODE_B89C7E:					;	   |
	LDA $24,x				;$B89C7E   |
	BMI .CODE_B89CA8			;$B89C80   |
	LDA $AC					;$B89C82   |
	AND #$1800				;$B89C84   |
	BNE .CODE_B89CA7			;$B89C87   |
	LDA #$0028				;$B89C89   |
	LDY current_player_mount		;$B89C8C   |
	BNE .CODE_B89C93			;$B89C8E   |
	LDA #$0008				;$B89C90   |
.CODE_B89C93					;	   |
	STA $32					;$B89C93   |
	LDA $0E,x				;$B89C95   |
	BMI .CODE_B89CA7			;$B89C97   |
	CMP $32					;$B89C99   |
	BPL .CODE_B89CA7			;$B89C9B   |
	JSR CODE_B89CCD				;$B89C9D   |
	BCS .CODE_B89CA7			;$B89CA0   |
	LDA #$FF00				;$B89CA2   |
	STA $24,x				;$B89CA5   |
.CODE_B89CA7					;	   |
	RTS					;$B89CA7  /

.CODE_B89CA8
	LDA $0E,x				;$B89CA8  \
	BPL .CODE_B89CA7			;$B89CAA   |
	JSR CODE_B89CCD				;$B89CAC   |
	BCS .CODE_B89CA7			;$B89CAF   |
	LDA $AC					;$B89CB1   |
	AND #$4000				;$B89CB3   |
	BEQ .CODE_B89CA7			;$B89CB6   |
	LDA $24,x				;$B89CB8   |
	EOR #$FFFF				;$B89CBA   |
	INC A					;$B89CBD   |
	CLC					;$B89CBE   |
	ADC #$0020				;$B89CBF   |
	CMP #$0800				;$B89CC2   |
	BMI .CODE_B89CCA			;$B89CC5   |
	LDA #$0800				;$B89CC7   |
.CODE_B89CCA					;	   |
	STA $24,x				;$B89CCA   |
	RTS					;$B89CCC  /

CODE_B89CCD:
	LDA $AE					;$B89CCD  \
	AND #$0100				;$B89CCF   |
	BEQ .CODE_B89CEB			;$B89CD2   |
	LDA $30,x				;$B89CD4   |
	AND #$0080				;$B89CD6   |
	BNE .CODE_B89CEB			;$B89CD9   |
	LDY #$0036				;$B89CDB   |
	JSL CODE_BB842C				;$B89CDE   |
	LDA #$0023				;$B89CE2   |
	JSL CODE_B8D8BA				;$B89CE5   |
	SEC					;$B89CE9   |
	RTS					;$B89CEA  /

.CODE_B89CEB
	CLC					;$B89CEB  \
	RTS					;$B89CEC  /

CODE_B89CED:
	LDX current_sprite			;$B89CED  \
	LDA $40,x				;$B89CEF   |
	AND #$0008				;$B89CF1   |
	BNE .CODE_B89D06			;$B89CF4   |
	LDA $3A,x				;$B89CF6   |
	SEC					;$B89CF8   |
	SBC #$000C				;$B89CF9   |
	CMP #$0140				;$B89CFC   |
	BPL .CODE_B89D04			;$B89CFF   |
	LDA #$0140				;$B89D01   |
.CODE_B89D04					;	   |
	STA $3A,x				;$B89D04   |
.CODE_B89D06					;	   |
	RTS					;$B89D06  /

CODE_B89D07:
	LDX current_sprite			;$B89D07  \
	LDA $3A,x				;$B89D09   |
	SEC					;$B89D0B   |
	ADC #$0018				;$B89D0C   |
	CMP #$0500				;$B89D0F   |
	BMI .CODE_B89D17			;$B89D12   |
	LDA #$0500				;$B89D14   |
.CODE_B89D17					;	   |
	STA $3A,x				;$B89D17   |
	RTS					;$B89D19  /

kong_behavior_11:
	LDA $0933				;$B89D1A  \
	ORA #$0001				;$B89D1D   |
	STA $0933				;$B89D20   |
	LDA #$0001				;$B89D23   |
	TSB $08C2				;$B89D26   |
	JSL CODE_B3F0B8				;$B89D29   |
	LDX current_sprite			;$B89D2D   |
	STZ $1E,x				;$B89D2F   |
	LDA #$0001				;$B89D31   |
	STA $0E,x				;$B89D34   |
	STZ $2C,x				;$B89D36   |
	LDA #$000E				;$B89D38   |
	JSR process_player_action		;$B89D3B   |
	LDY #$0050				;$B89D3E   |
	LDA [$8E],y				;$B89D41   |
	PHA					;$B89D43   |
	JSR interpolate_x_velocity		;$B89D44   |
	PLA					;$B89D47   |
	JSR interpolate_y_velocity		;$B89D48   |
	JSR .CODE_B89D54			;$B89D4B   |
	JSR update_invincibility		;$B89D4E   |
	JMP CODE_B8996E				;$B89D51  /

.CODE_B89D54
	LDX current_sprite			;$B89D54  \
	LDA $0A,x				;$B89D56   |
	SEC					;$B89D58   |
	SBC $17C2				;$B89D59   |
	CMP #$0010				;$B89D5C   |
	BMI .CODE_B89D62			;$B89D5F   |
.CODE_B89D61					;	   |
	RTS					;$B89D61  /

.CODE_B89D62
	LDA $24,x				;$B89D62  \
	BPL .CODE_B89D61			;$B89D64   |
	STZ $24,x				;$B89D66   |
	RTS					;$B89D68  /

kong_behavior_12:
if !version == 1				;	  \
	LDX #main_sprite_table			;$B89D69   |
	LDA $54,x				;$B89D6C   |
	STA $8E					;$B89D6E   |
endif						;	   |
	LDA #$C000				;$B89D70   |
	ORA $0AB8				;$B89D73   |
	STA $0AB8				;$B89D76   |
	LDA $6E					;$B89D79   |
	CMP #$019C				;$B89D7B   |
	BNE CODE_B89D87				;$B89D7E   |
	LDA #$0008				;$B89D80   |
	JSL CODE_BCFA9A				;$B89D83   |
CODE_B89D87:					;	   |
	LDX current_sprite			;$B89D87   |
	LDY $66					;$B89D89   |
	LDA $0006,y				;$B89D8B   |
	ORA #$0004				;$B89D8E   |
	STA $0006,y				;$B89D91   |
	LDA $46,x				;$B89D94   |
	STA $26,x				;$B89D96   |
	DEC $44,x				;$B89D98   |
	BPL CODE_B89DA4				;$B89D9A   |
	INC $44,x				;$B89D9C   |
	LDA #$000D				;$B89D9E   |
	JSR process_player_action		;$B89DA1   |
CODE_B89DA4:					;	   |
	LDX current_sprite			;$B89DA4   |
	DEC $42,x				;$B89DA6   |
	BPL CODE_B89DEB				;$B89DA8   |
	INC $42,x				;$B89DAA   |
	LDA $48,x				;$B89DAC   |
	BNE CODE_B89E28				;$B89DAE   |
	STZ $46,x				;$B89DB0   |
	LDY #$004A				;$B89DB2   |
	LDA [$8E],y				;$B89DB5   |
	LDY $66					;$B89DB7   |
	STA $0008,y				;$B89DB9   |
	JSR apply_player_gravity		;$B89DBC   |
	LDX current_sprite			;$B89DBF   |
	LDA $44,x				;$B89DC1   |
	BEQ CODE_B89DCA				;$B89DC3   |
CODE_B89DC5:					;	   |
	LDA #$0002				;$B89DC5   |
	BRA CODE_B89DDD				;$B89DC8  /

CODE_B89DCA:
	LDA $6E					;$B89DCA  \
	CMP #$0198				;$B89DCC   |
	BEQ CODE_B89E01				;$B89DCF   |
	CMP #$01A0				;$B89DD1   |
	BEQ CODE_B89E0D				;$B89DD4   |
	LDA $26,x				;$B89DD6   |
	BEQ CODE_B89DC5				;$B89DD8   |
	JSR CODE_B89E44				;$B89DDA   |
CODE_B89DDD:					;	   |
	JSR interpolate_x_velocity		;$B89DDD   |
if !version == 0				;	   |
	JSR CODE_B89957				;$B89DE0   |
else						;	   |
	JSR CODE_B89E57				;$B89DE0   |
endif						;	   |
	JSR CODE_B89E38				;$B89DE3   |
	JSR CODE_B8B714				;$B89DE6   |
	BRA CODE_B89DF7				;$B89DE9  /

CODE_B89DEB:
	JSR CODE_B89E44				;$B89DEB  \
	JSR interpolate_x_velocity		;$B89DEE   |
if !version == 0				;	   |
	JSR CODE_B89957				;$B89DF1   |
else						;	   |
	JSR CODE_B89E57				;$B89DF1   |
endif						;	   |
	JSR CODE_B89E38				;$B89DF4   |
CODE_B89DF7:					;	   |
	LDA $1E,x				;$B89DF7   |
	AND #$0303				;$B89DF9   |
	BNE CODE_B89E12				;$B89DFC   |
	JMP CODE_B8996E				;$B89DFE  /

CODE_B89E01:
	JSR start_player_falling		;$B89E01  \
	LDX current_sprite			;$B89E04   |
	LDA #$0010				;$B89E06   |
	STA $2E,x				;$B89E09   |
	BRA CODE_B89E16				;$B89E0B  /

CODE_B89E0D:
	JSR CODE_B8B6E0				;$B89E0D  \
	BRA CODE_B89E16				;$B89E10  /

CODE_B89E12:
	JSL CODE_B9DFCF				;$B89E12  \
CODE_B89E16:					;	   |
	STZ $0AEE				;$B89E16   |
	STZ $0AF2				;$B89E19   |
	LDA #$3FFF				;$B89E1C   |
	AND $0AB8				;$B89E1F   |
	STA $0AB8				;$B89E22   |
	JMP CODE_B8996E				;$B89E25  /

CODE_B89E28:
	LDA $4A,x				;$B89E28  \
	STA $059D				;$B89E2A   |
	LDA $4C,x				;$B89E2D   |
	STA $059F				;$B89E2F   |
	JSR CODE_B8A699				;$B89E32   |
	JMP CODE_B8996E				;$B89E35  /

CODE_B89E38:
	LDA $0D7A				;$B89E38  \
	CMP inactive_kong_sprite		;$B89E3B   |
	BNE CODE_B89E43				;$B89E3E   |
	JSR CODE_B8B7F4				;$B89E40   |
CODE_B89E43:					;	   |
	RTS					;$B89E43  /

CODE_B89E44:
	LDX current_sprite			;$B89E44  \
	LDA $4E,x				;$B89E46   |
	AND #$0001				;$B89E48   |
	BEQ CODE_B89E51				;$B89E4B   |
	LDA #$000D				;$B89E4D   |
	RTS					;$B89E50  /

CODE_B89E51:
	LDY #$004C				;$B89E51  \
	LDA [$8E],y				;$B89E54   |
	RTS					;$B89E56  /

CODE_B89E57:
if !version == 1				;	  \
	JSR CODE_B8D24A				;$B89E57   |
	JSR CODE_B8D5E6				;$B89E5A   |
	JSR CODE_B8B516				;$B89E5D   |
	JSR CODE_B89960				;$B89E60   |
	RTS					;$B89E63  /
endif

kong_behavior_13:
	JSL CODE_B381CA				;$B89E64  \
	JMP CODE_B89975				;$B89E68  /

kong_behavior_14:
	LDA #$0001				;$B89E6B  \
	JSR process_player_action		;$B89E6E   |
	JSR set_normal_gravity_if_falling	;$B89E71   |
	JSR CODE_B8994C				;$B89E74   |
	JMP CODE_B8996E				;$B89E77  /

kong_behavior_15:
	LDA #$000C				;$B89E7A  \
	JSR process_player_action		;$B89E7D   |
	JSR apply_player_gravity		;$B89E80   |
	JSR get_x_acceleration			;$B89E83   |
	LDA #$0003				;$B89E86   |
	JSR interpolate_x_velocity		;$B89E89   |
	JSR CODE_B89957				;$B89E8C   |
	JSR CODE_B8B714				;$B89E8F   |
	JSR CODE_B8B5C3				;$B89E92   |
	JMP CODE_B8996E				;$B89E95  /

kong_behavior_16:
	LDX current_sprite			;$B89E98  \
	LDA $6E					;$B89E9A   |
	BNE CODE_B89EB6				;$B89E9C   |
	LDA $1E,x				;$B89E9E   |
	AND #$0303				;$B89EA0   |
	BNE CODE_B89EAF				;$B89EA3   |
	LDA #$0009				;$B89EA5   |
	JSL CODE_BCFA9A				;$B89EA8   |
	JMP kong_behavior_01			;$B89EAC  /

CODE_B89EAF:
	JSL CODE_B9DFCF				;$B89EAF  \
	JMP CODE_B8996E				;$B89EB3  /

CODE_B89EB6:
	JMP kong_behavior_0A			;$B89EB6  /

kong_behavior_17:
	LDA #$000F				;$B89EB9  \
	JSR process_player_action		;$B89EBC   |
	JSR CODE_B8B8DA				;$B89EBF   |
	JSR CODE_B8994C				;$B89EC2   |
	JSR CODE_B8B7F4				;$B89EC5   |
	JSR CODE_B8B5DA				;$B89EC8   |
	JMP CODE_B8996E				;$B89ECB  /

kong_behavior_18:
	JSL CODE_B9D100				;$B89ECE  \
	JSR CODE_B8B7F4				;$B89ED2   |
	JMP CODE_B89979				;$B89ED5  /

kong_behavior_19:
	JMP kong_behavior_02			;$B89ED8  /

kong_behavior_1A:
	LDA #$0010				;$B89EDB  \
	JSR process_player_action		;$B89EDE   |
	JSR face_moving_direction		;$B89EE1   |
	JSR set_normal_gravity_if_falling	;$B89EE4   |
	JSR CODE_B8994C				;$B89EE7   |
	JSR CODE_B8B7F4				;$B89EEA   |
	JSR CODE_B8B5DA				;$B89EED   |
	JMP CODE_B8996E				;$B89EF0  /

kong_behavior_1B:
	JMP kong_behavior_1A			;$B89EF3  /

kong_behavior_1C:
	LDX current_sprite			;$B89EF6  \
	LDA $1E,x				;$B89EF8   |
	AND #$0303				;$B89EFA   |
	BNE CODE_B89F02				;$B89EFD   |
	JMP kong_behavior_1A			;$B89EFF  /

CODE_B89F02:
	JSL CODE_B9DFCF				;$B89F02  \
	JMP CODE_B8996E				;$B89F06  /

kong_behavior_1D:
	LDX current_sprite			;$B89F09  \
	LDA $42,x				;$B89F0B   |
	ASL A					;$B89F0D   |
	TAX					;$B89F0E   |
	JMP (DATA_B89F12,x)			;$B89F0F  /

DATA_B89F12:
	dw CODE_B89F1E
	dw CODE_B89F21
	dw CODE_B89F46
	dw CODE_B89F62
	dw CODE_B89F8E
	dw CODE_B89FCA


CODE_B89F1E:
	BRL CODE_B89FB9				;$B89F1E  /

CODE_B89F21:
	JSR CODE_B89F30				;$B89F21  \
	INC $42,x				;$B89F24   |
	LDA #$0003				;$B89F26   |
	JSL CODE_B9D0B0				;$B89F29   |
	BRL CODE_B89FB9				;$B89F2D  /

CODE_B89F30:
	LDX current_sprite			;$B89F30  \
	STZ $24,x				;$B89F32   |
	LDY $46,x				;$B89F34   |
	LDA $44,x				;$B89F36   |
	SEC					;$B89F38   |
	SBC $06,x				;$B89F39   |
	BPL CODE_B89F43				;$B89F3B   |
	TYA					;$B89F3D   |
	EOR #$FFFF				;$B89F3E   |
	INC A					;$B89F41   |
	TAY					;$B89F42   |
CODE_B89F43:					;	   |
	STY $26,x				;$B89F43   |
	RTS					;$B89F45  /

CODE_B89F46:
	JSR CODE_B89F4F				;$B89F46  \
	BCC CODE_B89F4D				;$B89F49   |
	STZ $42,x				;$B89F4B   |
CODE_B89F4D:					;	   |
	BRA CODE_B89FB9				;$B89F4D  /

CODE_B89F4F:
	LDX current_sprite			;$B89F4F  \
	LDA $44,x				;$B89F51   |
	SEC					;$B89F53   |
	SBC $06,x				;$B89F54   |
	EOR $26,x				;$B89F56   |
	BPL CODE_B89F60				;$B89F58   |
	STZ $26,x				;$B89F5A   |
	STZ $20,x				;$B89F5C   |
	SEC					;$B89F5E   |
	RTS					;$B89F5F  /

CODE_B89F60:
	CLC					;$B89F60  \
	RTS					;$B89F61  /

CODE_B89F62:
	JSR CODE_B89F30				;$B89F62  \
	LDX current_sprite			;$B89F65   |
	LDA $26,x				;$B89F67   |
	LSR A					;$B89F69   |
	EOR $12,x				;$B89F6A   |
	AND #$4000				;$B89F6C   |
	EOR $12,x				;$B89F6F   |
	STA $12,x				;$B89F71   |
	LDA $48,x				;$B89F73   |
	STA $24,x				;$B89F75   |
	STZ $1E,x				;$B89F77   |
	LDA #$80F0				;$B89F79   |
	STA $0E,x				;$B89F7C   |
	LDA #$7F00				;$B89F7E   |
	STA $0C,x				;$B89F81   |
	INC $42,x				;$B89F83   |
	LDA #$0006				;$B89F85   |
	JSL CODE_B9D0B8				;$B89F88   |
	BRA CODE_B89FB9				;$B89F8C  /

CODE_B89F8E:
	JSR CODE_B89F4F				;$B89F8E  \
	LDX current_sprite			;$B89F91   |
	LDA $24,x				;$B89F93   |
	BMI CODE_B89FA5				;$B89F95   |
	LDA $0A,x				;$B89F97   |
	SEC					;$B89F99   |
	SBC $4A,x				;$B89F9A   |
	BMI CODE_B89FA5				;$B89F9C   |
	LDA #$0005				;$B89F9E   |
	STA $42,x				;$B89FA1   |
	BRA CODE_B89FC6				;$B89FA3  /

CODE_B89FA5:
	LDX current_sprite			;$B89FA5  \
	LDA #$0070				;$B89FA7   |
	CLC					;$B89FAA   |
	ADC $24,x				;$B89FAB   |
	BMI CODE_B89FB7				;$B89FAD   |
	CMP #$0800				;$B89FAF   |
	BCC CODE_B89FB7				;$B89FB2   |
	LDA #$0800				;$B89FB4   |
CODE_B89FB7:					;	   |
	STA $24,x				;$B89FB7   |
CODE_B89FB9:					;	   |
	LDA #$000B				;$B89FB9   |
	JSR interpolate_x_velocity		;$B89FBC   |
	JSR CODE_B8CF83				;$B89FBF   |
	JSL CODE_B9D100				;$B89FC2   |
CODE_B89FC6:					;	   |
	JML CODE_B8997E				;$B89FC6  /

CODE_B89FCA:
	LDX current_sprite			;$B89FCA  \
	STZ $1A,x				;$B89FCC   |
	STZ $16,x				;$B89FCE   |
	STZ $30,x				;$B89FD0   |
	BRA CODE_B89FC6				;$B89FD2  /

kong_behavior_1E:
	BRL kong_behavior_1D			;$B89FD4  /

	LDX inactive_kong_sprite		;$B89FD7   |
	LDA $2E,x				;$B89FDA   |
	CMP #$001F				;$B89FDC   |
	BEQ CODE_B89FE8				;$B89FDF   |
	CMP #$002B				;$B89FE1   |
	BEQ CODE_B89FE8				;$B89FE4   |
	CLC					;$B89FE6   |
	RTL					;$B89FE7  /

CODE_B89FE8:
	SEC					;$B89FE8  \
	RTL					;$B89FE9  /

kong_behavior_1F:
	LDY #$0000				;$B89FEA  \
	LDA [$8E],y				;$B89FED   |
	LDY $66					;$B89FEF   |
	STA $0008,y				;$B89FF1   |
	LDY #$0002				;$B89FF4   |
	LDA [$8E],y				;$B89FF7   |
	LDY $66					;$B89FF9   |
	STA $000A,y				;$B89FFB   |
	JSR apply_player_gravity		;$B89FFE   |
	LDA #$0007				;$B8A001   |
	JSR interpolate_x_velocity		;$B8A004   |
	JSR CODE_B8D5E6				;$B8A007   |
	JSL CODE_B9D100				;$B8A00A   |
	LDA #$000A				;$B8A00E   |
	JSL CODE_BCFA9A				;$B8A011   |
	JSL CODE_BCFB2C				;$B8A015   |
	LDX current_sprite			;$B8A019   |
	LDA $1E,x				;$B8A01B   |
	AND #$0101				;$B8A01D   |
	BNE CODE_B8A033				;$B8A020   |
	JSR CODE_B8A049				;$B8A022   |
	JSR CODE_B8A06B				;$B8A025   |
	BCS CODE_B8A02D				;$B8A028   |
	JMP CODE_B89979				;$B8A02A  /

CODE_B8A02D:
	JSR CODE_B8A101				;$B8A02D  \
	JMP CODE_B89979				;$B8A030  /

CODE_B8A033:
	STZ $20,x				;$B8A033  \
	LDA #$0021				;$B8A035   |
	STA $2E,x				;$B8A038   |
	LDA #$0040				;$B8A03A   |
	STA $42,x				;$B8A03D   |
	LDA #$0028				;$B8A03F   |
	JSL CODE_B9D0B8				;$B8A042   |
	JMP CODE_B89979				;$B8A046  /

CODE_B8A049:
	LDX current_sprite			;$B8A049  \
	LDA $06,x				;$B8A04B   |
	SEC					;$B8A04D   |
	SBC $17BA				;$B8A04E   |
	SEC					;$B8A051   |
	SBC #$0010				;$B8A052   |
	BMI CODE_B8A05D				;$B8A055   |
	SBC #$00E0				;$B8A057   |
	BPL CODE_B8A05D				;$B8A05A   |
	RTS					;$B8A05C  /

CODE_B8A05D:
	EOR #$FFFF				;$B8A05D  \
	INC A					;$B8A060   |
	CLC					;$B8A061   |
	ADC $06,x				;$B8A062   |
	STA $06,x				;$B8A064   |
	STZ $20,x				;$B8A066   |
	STZ $26,x				;$B8A068   |
	RTS					;$B8A06A  /

CODE_B8A06B:
	LDX current_sprite			;$B8A06B  \
	LDA $0A,x				;$B8A06D   |
	SEC					;$B8A06F   |
	SBC $17C0				;$B8A070   |
	CMP #$0100				;$B8A073   |
	BPL CODE_B8A07A				;$B8A076   |
	CLC					;$B8A078   |
	RTS					;$B8A079  /

CODE_B8A07A:
	SEC					;$B8A07A  \
	RTS					;$B8A07B  /

kong_behavior_20:
	JSR CODE_B8A186				;$B8A07C  \
	JSR CODE_B89960				;$B8A07F   |
	JMP CODE_B8996E				;$B8A082  /

kong_behavior_21:
	JSR apply_player_gravity		;$B8A085  \
	LDA #$0007				;$B8A088   |
	JSR interpolate_x_velocity		;$B8A08B   |
	JSR CODE_B8D5E6				;$B8A08E   |
	JSL CODE_B9D100				;$B8A091   |
if !version == 1				;	   |
	LDX current_sprite			;$B8A095   |
	LDA $1E,x				;$B8A097   |
	AND #$0080				;$B8A099   |
	BNE CODE_B8A0B9				;$B8A09C   |
	LDA $10,x				;$B8A09E   |
	AND #$0100				;$B8A0A0   |
	BEQ CODE_B8A0B9				;$B8A0A3   |
	LDA $1E,x				;$B8A0A5   |
	AND #$1001				;$B8A0A7   |
	CMP #$0001				;$B8A0AA   |
	BNE CODE_B8A0B9				;$B8A0AD   |
	LDA #$0020				;$B8A0AF   |
	JSL CODE_B8D8BA				;$B8A0B2   |
	JMP CODE_B89979				;$B8A0B6  /
endif

CODE_B8A0B9:
	JSL CODE_BCFB2C				;$B8A0B9  \
	JSR CODE_B8A0D5				;$B8A0BD   |
	BCS CODE_B8A0CF				;$B8A0C0   |
	LDX active_kong_sprite			;$B8A0C2   |
	LDA $2E,x				;$B8A0C5   |
	CMP #$005B				;$B8A0C7   |
	BEQ CODE_B8A0CF				;$B8A0CA   |
	JMP CODE_B89979				;$B8A0CC  /

CODE_B8A0CF:
	JSR CODE_B8A101				;$B8A0CF  \
	JMP CODE_B89979				;$B8A0D2  /

CODE_B8A0D5:
	LDX inactive_kong_sprite		;$B8A0D5  \
	LDY active_kong_sprite			;$B8A0D8   |
	LDA $0006,y				;$B8A0DB   |
	SEC					;$B8A0DE   |
	SBC $06,x				;$B8A0DF   |
	BPL CODE_B8A0E7				;$B8A0E1   |
	EOR #$FFFF				;$B8A0E3   |
	INC A					;$B8A0E6   |
CODE_B8A0E7:					;	   |
	CMP #$0010				;$B8A0E7   |
	BPL CODE_B8A0FF				;$B8A0EA   |
	LDA $000A,y				;$B8A0EC   |
	SEC					;$B8A0EF   |
	SBC $0A,x				;$B8A0F0   |
	BPL CODE_B8A0F8				;$B8A0F2   |
	EOR #$FFFF				;$B8A0F4   |
	INC A					;$B8A0F7   |
CODE_B8A0F8:					;	   |
	CMP #$0020				;$B8A0F8   |
	BPL CODE_B8A0FF				;$B8A0FB   |
	SEC					;$B8A0FD   |
	RTS					;$B8A0FE  /

CODE_B8A0FF:
	CLC					;$B8A0FF  \
	RTS					;$B8A100  /

CODE_B8A101:
	LDX current_sprite			;$B8A101  \
	LDA #$0029				;$B8A103   |
	STA $2E,x				;$B8A106   |
	LDA $17BA				;$B8A108   |
	SEC					;$B8A10B   |
	SBC #$0010				;$B8A10C   |
	CMP $06,x				;$B8A10F   |
	BMI CODE_B8A115				;$B8A111   |
	STA $06,x				;$B8A113   |
CODE_B8A115:					;	   |
	LDA $17BA				;$B8A115   |
	CLC					;$B8A118   |
	ADC #$0110				;$B8A119   |
	CMP $06,x				;$B8A11C   |
	BPL CODE_B8A122				;$B8A11E   |
	STA $06,x				;$B8A120   |
CODE_B8A122:					;	   |
	LDA #$001F				;$B8A122   |
	LDX #$001C				;$B8A125   |
	LDY #$0000				;$B8A128   |
	JSR CODE_B8D8D5				;$B8A12B   |
	JMP CODE_B8A14E				;$B8A12E  /

CODE_B8A131:
	LDX current_sprite			;$B8A131  \
	LDA #$0040				;$B8A133   |
	STA $2E,x				;$B8A136   |
	LDA #$FFE4				;$B8A138   |
	STA $00004A				;$B8A13B   |
	LDA #$001F				;$B8A13F   |
	LDX #$001C				;$B8A142   |
	LDY #$0000				;$B8A145   |
	JSR CODE_B8D8D7				;$B8A148   |
	JMP CODE_B8A14E				;$B8A14B  /

CODE_B8A14E:
	LDX current_sprite			;$B8A14E  \
	LDA $30,x				;$B8A150   |
	AND #$FFE7				;$B8A152   |
	STA $30,x				;$B8A155   |
	LDA #$00D8				;$B8A157   |
	STA $02,x				;$B8A15A   |
	LDA #$0040				;$B8A15C   |
	JSL CODE_B9D0B8				;$B8A15F   |
	RTS					;$B8A163  /

kong_behavior_22:
	JSR CODE_B8D99E				;$B8A164  \
	JSR CODE_B8DA84				;$B8A167   |
	JSR CODE_B8DDB1				;$B8A16A   |
	JSL CODE_B9D100				;$B8A16D   |
	JMP CODE_B89979				;$B8A171  /

kong_behavior_23:
	LDA #$0011				;$B8A174  \
	JSR process_player_action		;$B8A177   |
	JSR CODE_B8A186				;$B8A17A   |
	JSR CODE_B89960				;$B8A17D   |
	JSR CODE_B8B7F4				;$B8A180   |
	JMP CODE_B8996E				;$B8A183  /

CODE_B8A186:
	LDX current_sprite			;$B8A186  \
	LDA $20,x				;$B8A188   |
	PHA					;$B8A18A   |
	LDA $24,x				;$B8A18B   |
	PHA					;$B8A18D   |
	STZ $20,x				;$B8A18E   |
	STZ $24,x				;$B8A190   |
	JSR CODE_B8D5E6				;$B8A192   |
	LDX current_sprite			;$B8A195   |
	PLA					;$B8A197   |
	STA $24,x				;$B8A198   |
	PLA					;$B8A19A   |
	STA $20,x				;$B8A19B   |
	RTS					;$B8A19D  /

kong_behavior_24:
	LDA #$0001				;$B8A19E  \
	TSB $08C2				;$B8A1A1   |
	LDA #$000C				;$B8A1A4   |
	JSR process_player_action		;$B8A1A7   |
	JSR CODE_B89933				;$B8A1AA   |
	JMP CODE_B8996E				;$B8A1AD  /

kong_behavior_25:
	LDA #$0001				;$B8A1B0  \
	TSB $08C2				;$B8A1B3   |
	JSL CODE_BBBB69				;$B8A1B6   |
	BCS CODE_B8A1E8				;$B8A1BA   |
	LDX current_sprite			;$B8A1BC   |
	STZ $30,x				;$B8A1BE   |
	LDA $1E,x				;$B8A1C0   |
	AND #$0203				;$B8A1C2   |
	CMP #$0003				;$B8A1C5   |
	BNE CODE_B8A1CF				;$B8A1C8   |
	LDA #$F800				;$B8A1CA   |
	STA $24,x				;$B8A1CD   |
CODE_B8A1CF:					;	   |
	LDY #$002C				;$B8A1CF   |
	LDA [$8E],y				;$B8A1D2   |
	STA $20,x				;$B8A1D4   |
	STA $26,x				;$B8A1D6   |
	JSR CODE_B89933				;$B8A1D8   |
	JSR CODE_B8A203				;$B8A1DB   |
	LDA $42,x				;$B8A1DE   |
	CMP #$0008				;$B8A1E0   |
	BPL CODE_B8A1EE				;$B8A1E3   |
	JMP CODE_B89979				;$B8A1E5  /

CODE_B8A1E8:
	JSR CODE_B8B831				;$B8A1E8  \
	JMP CODE_B89979				;$B8A1EB  /

CODE_B8A1EE:
	STZ $24,x				;$B8A1EE  \
	STZ $20,x				;$B8A1F0   |
	STZ $26,x				;$B8A1F2   |
	LDA #$0028				;$B8A1F4   |
	STA $2E,x				;$B8A1F7   |
	LDA #$002A				;$B8A1F9   |
	JSL CODE_B9D0B8				;$B8A1FC   |
	JMP CODE_B89979				;$B8A200  /

CODE_B8A203:
	LDX current_sprite			;$B8A203  \
	LDA $44,x				;$B8A205   |
	SEC					;$B8A207   |
	SBC $06,x				;$B8A208   |
	BPL CODE_B8A210				;$B8A20A   |
	EOR #$FFFF				;$B8A20C   |
	INC A					;$B8A20F   |
CODE_B8A210:					;	   |
	CMP #$0004				;$B8A210   |
	BMI CODE_B8A21C				;$B8A213   |
	STZ $42,x				;$B8A215   |
	LDA $06,x				;$B8A217   |
	STA $44,x				;$B8A219   |
	RTS					;$B8A21B  /

CODE_B8A21C:
	INC $42,x				;$B8A21C  \
	RTS					;$B8A21E  /

kong_behavior_26:
	LDX current_sprite			;$B8A21F  \
	DEC $42,x				;$B8A221   |
	BMI CODE_B8A228				;$B8A223   |
	JMP CODE_B89979				;$B8A225  /

CODE_B8A228:
	JSR start_damaged_invincibility		;$B8A228  \
	LDX current_sprite			;$B8A22B   |
	LDA #$0027				;$B8A22D   |
	STA $2E,x				;$B8A230   |
	STZ $30,x				;$B8A232   |
	LDA #$003D				;$B8A234   |
	JSL CODE_B9D0B8				;$B8A237   |
	JMP CODE_B89979				;$B8A23B  /

kong_behavior_27:
	JSR CODE_B8B843				;$B8A23E  \
	JSR CODE_B8D7FE				;$B8A241   |
	JSR CODE_B8D817				;$B8A244   |
	LDY $0595				;$B8A247   |
	LDA $0000,y				;$B8A24A   |
	CMP #$0029				;$B8A24D   |
	BNE CODE_B8A254				;$B8A250   |
	BEQ CODE_B8A26F				;$B8A252   |
CODE_B8A254:					;	   |
	LDX current_sprite			;$B8A254   |
	LDA $24,x				;$B8A256   |
	BPL CODE_B8A25E				;$B8A258   |
	EOR #$FFFF				;$B8A25A   |
	INC A					;$B8A25D   |
CODE_B8A25E:					;	   |
	STA $32					;$B8A25E   |
	LDA $20,x				;$B8A260   |
	BPL CODE_B8A268				;$B8A262   |
	EOR #$FFFF				;$B8A264   |
	INC A					;$B8A267   |
CODE_B8A268:					;	   |
	ORA $32					;$B8A268   |
	AND #$FFE0				;$B8A26A   |
	BEQ CODE_B8A27A				;$B8A26D   |
CODE_B8A26F:					;	   |
	JSL CODE_B9D100				;$B8A26F   |
	LDX current_sprite			;$B8A273   |
	STZ $30,x				;$B8A275   |
	JMP CODE_B89979				;$B8A277  /

CODE_B8A27A:
	LDX current_sprite			;$B8A27A  \
	LDA #$0042				;$B8A27C   |
	STA $30,x				;$B8A27F   |
	LDY $66					;$B8A281   |
	LDA $0D66				;$B8A283   |
	STA $06,x				;$B8A286   |
	LDA #$8000				;$B8A288   |
	STA $04,x				;$B8A28B   |
	LDA $0D6A				;$B8A28D   |
	STA $0A,x				;$B8A290   |
	LDA #$8000				;$B8A292   |
	STA $08,x				;$B8A295   |
	LDA #$0006				;$B8A297   |
	JSL CODE_B9D0B8				;$B8A29A   |
	LDA #$BFFF				;$B8A29E   |
	AND $08C2				;$B8A2A1   |
	STA $08C2				;$B8A2A4   |
	LDX current_sprite			;$B8A2A7   |
	LDA #$0006				;$B8A2A9   |
	STA $2E,x				;$B8A2AC   |
	LDA $02,x				;$B8A2AE   |
	STA $5E					;$B8A2B0   |
	LDX active_kong_sprite			;$B8A2B2   |
	LDA $02,x				;$B8A2B5   |
	LDX current_sprite			;$B8A2B7   |
	STA $02,x				;$B8A2B9   |
	LDX active_kong_sprite			;$B8A2BB   |
	LDA $5E					;$B8A2BE   |
	STA $02,x				;$B8A2C0   |
	LDX current_sprite			;$B8A2C2   |
	JSL CODE_80889C				;$B8A2C4   |
	JSL CODE_BB8C19				;$B8A2C8   |
	JSL CODE_BCFA78				;$B8A2CC   |
	JSR start_damaged_invincibility		;$B8A2D0   |
	JSR disable_bullet_time			;$B8A2D3   |
	LDX active_kong_sprite			;$B8A2D6   |
	LDA $0D60				;$B8A2D9   |
	STA $20,x				;$B8A2DC   |
	LDA #$F600				;$B8A2DE   |
	STA $24,x				;$B8A2E1   |
	JSR check_sprite_underwater		;$B8A2E3   |
	CMP #$0002				;$B8A2E6   |
	BNE CODE_B8A2F2				;$B8A2E9   |
	LDX current_sprite			;$B8A2EB   |
	LDA #$FE00				;$B8A2ED   |
	STA $24,x				;$B8A2F0   |
CODE_B8A2F2:					;	   |
	LDA $060D				;$B8A2F2   |
	CMP #$0001				;$B8A2F5   |
	BEQ CODE_B8A2FD				;$B8A2F8   |
	JMP CODE_B89979				;$B8A2FA  /

CODE_B8A2FD:
	LDX current_sprite			;$B8A2FD  \
	LDA #$006F				;$B8A2FF   |
	STA $2E,x				;$B8A302   |
	STZ $4A,x				;$B8A304   |
	LDA #$0007				;$B8A306   |
	LDY #$0000				;$B8A309   |
	JSR enable_bullet_time			;$B8A30C   |
	JMP CODE_B89979				;$B8A30F  /

kong_behavior_28:
	LDX current_sprite			;$B8A312  \
	JSL CODE_BBBB69				;$B8A314   |
	BCS CODE_B8A327				;$B8A318   |
	JSR CODE_B8CF83				;$B8A31A   |
	JSR update_damaged_invincibility	;$B8A31D   |
	JSL CODE_B9D100				;$B8A320   |
	JML [$05A9]				;$B8A324  /

CODE_B8A327:
	JSR CODE_B8B831				;$B8A327  \
	JML [$05A9]				;$B8A32A  /

kong_behavior_29:
	LDA #$0002				;$B8A32D  \
	TSB $0933				;$B8A330   |
	JSR CODE_B8D99E				;$B8A333   |
	JSL CODE_B9D100				;$B8A336   |
	LDA $099F				;$B8A33A   |
	INC A					;$B8A33D   |
	INC A					;$B8A33E   |
	AND #$003F				;$B8A33F   |
	CMP $099D				;$B8A342   |
	BEQ CODE_B8A34A				;$B8A345   |
	JMP CODE_B89979				;$B8A347  /

CODE_B8A34A:
	LDA #$0022				;$B8A34A  \
	STA $2E,x				;$B8A34D   |
	JMP CODE_B89979				;$B8A34F  /

kong_behavior_2A:
	LDY #$0000				;$B8A352  \
	LDA [$8E],y				;$B8A355   |
	LDY $66					;$B8A357   |
	STA $0008,y				;$B8A359   |
	LDY #$0002				;$B8A35C   |
	LDA [$8E],y				;$B8A35F   |
	LDY $66					;$B8A361   |
	STA $000A,y				;$B8A363   |
	JSR apply_player_gravity		;$B8A366   |
	JSR CODE_B8B7C9				;$B8A369   |
	LDA $34					;$B8A36C   |
	LSR A					;$B8A36E   |
	LSR A					;$B8A36F   |
	LSR A					;$B8A370   |
	BNE CODE_B8A376				;$B8A371   |
	JSR CODE_B8DA65				;$B8A373   |
CODE_B8A376:					;	   |
	JSR CODE_B8DA94				;$B8A376   |
	JSR CODE_B8D5E6				;$B8A379   |
	JSL CODE_B9D100				;$B8A37C   |
	LDA $0D6E				;$B8A380   |
	CMP $099D				;$B8A383   |
	BNE CODE_B8A394				;$B8A386   |
	LDX current_sprite			;$B8A388   |
	LDA $0D66				;$B8A38A   |
	SEC					;$B8A38D   |
	SBC $06,x				;$B8A38E   |
	BEQ CODE_B8A3AA				;$B8A390   |
	BRA CODE_B8A3A7				;$B8A392  /

CODE_B8A394:
	LDX current_sprite			;$B8A394  \
	LDA #$0022				;$B8A396   |
	STA $2E,x				;$B8A399   |
	LDA #$001F				;$B8A39B   |
	LDX #$0003				;$B8A39E   |
	LDY #$0000				;$B8A3A1   |
	JSR CODE_B8D8D5				;$B8A3A4   |
CODE_B8A3A7:					;	   |
	JMP CODE_B89979				;$B8A3A7  /

CODE_B8A3AA:
	LDA #$0001				;$B8A3AA  \
	JSL CODE_B9D0B0				;$B8A3AD   |
	BRA CODE_B8A3A7				;$B8A3B1  /

kong_behavior_2B:
	LDY #$0044				;$B8A3B3  \
	LDA [$8E],y				;$B8A3B6   |
	LDY $66					;$B8A3B8   |
	STA $0008,y				;$B8A3BA   |
	LDY #$0002				;$B8A3BD   |
	LDA [$8E],y				;$B8A3C0   |
	LDY $66					;$B8A3C2   |
	STA $000A,y				;$B8A3C4   |
	JSR apply_player_gravity		;$B8A3C7   |
	LDX current_sprite			;$B8A3CA   |
	LDY $0595				;$B8A3CC   |
	LDA $0004,y				;$B8A3CF   |
	STA $0981				;$B8A3D2   |
	AND #$0300				;$B8A3D5   |
	BEQ CODE_B8A3F0				;$B8A3D8   |
	LDY #$0046				;$B8A3DA   |
	AND #$0200				;$B8A3DD   |
	BEQ CODE_B8A3EA				;$B8A3E0   |
	LDA [$8E],y				;$B8A3E2   |
	EOR #$FFFF				;$B8A3E4   |
	INC A					;$B8A3E7   |
	BRA CODE_B8A3EC				;$B8A3E8  /

CODE_B8A3EA:
	LDA [$8E],y				;$B8A3EA  \
CODE_B8A3EC:					;	   |
	STA $26,x				;$B8A3EC   |
	BRA CODE_B8A3F4				;$B8A3EE  /

CODE_B8A3F0:
	LDX current_sprite			;$B8A3F0  \
	STZ $26,x				;$B8A3F2   |
CODE_B8A3F4:					;	   |
	LDY #$0048				;$B8A3F4   |
	LDA [$8E],y				;$B8A3F7   |
	JSR interpolate_x_velocity		;$B8A3F9   |
	JSR CODE_B8A049				;$B8A3FC   |
	LDA $08A8				;$B8A3FF   |
	CMP #$0002				;$B8A402   |
	BEQ CODE_B8A413				;$B8A405   |
	CMP #$0011				;$B8A407   |
	BEQ CODE_B8A413				;$B8A40A   |
	LDA level_number			;$B8A40C   |
	CMP #!level_stronghold_showdown		;$B8A40E   |
	BNE CODE_B8A424				;$B8A411   |
CODE_B8A413:					;	   |
	LDX current_sprite			;$B8A413   |
	LDA $24,x				;$B8A415   |
	BPL CODE_B8A424				;$B8A417   |
	LDA #$0108				;$B8A419   |
	CMP $0A,x				;$B8A41C   |
	BMI CODE_B8A424				;$B8A41E   |
	STA $0A,x				;$B8A420   |
	STZ $24,x				;$B8A422   |
CODE_B8A424:					;	   |
	JSR CODE_B8D5E6				;$B8A424   |
	JSL CODE_B9D100				;$B8A427   |
	LDA #$000A				;$B8A42B   |
	JSL CODE_BCFA9A				;$B8A42E   |
	JSL CODE_BCFB2C				;$B8A432   |
	LDX current_sprite			;$B8A436   |
	LDA $24,x				;$B8A438   |
	BMI CODE_B8A469				;$B8A43A   |
	JSR CODE_B8A4B1				;$B8A43C   |
	BCS CODE_B8A46C				;$B8A43F   |
	LDX current_sprite			;$B8A441   |
	LDA $1E,x				;$B8A443   |
	AND #$0101				;$B8A445   |
	CMP #$0101				;$B8A448   |
	BEQ CODE_B8A475				;$B8A44B   |
	JSR CODE_B8A06B				;$B8A44D   |
	BCC CODE_B8A469				;$B8A450   |
	LDY active_kong_sprite			;$B8A452   |
	LDA $002E,y				;$B8A455   |
	CMP #$002C				;$B8A458   |
	BNE CODE_B8A463				;$B8A45B   |
	LDA #$0001				;$B8A45D   |
	STA $002E,y				;$B8A460   |
CODE_B8A463:					;	   |
	JSR CODE_B8A101				;$B8A463   |
	JMP CODE_B89979				;$B8A466  /

CODE_B8A469:
	JMP CODE_B89979				;$B8A469  /

CODE_B8A46C:
	LDA #$0003				;$B8A46C  \
	JSR set_player_interaction		;$B8A46F   |
	JMP CODE_B89979				;$B8A472  /

CODE_B8A475:
	STZ $20,x				;$B8A475  \
	STZ $26,x				;$B8A477   |
	LDA $30,x				;$B8A479   |
	AND #$FFF7				;$B8A47B   |
	STA $30,x				;$B8A47E   |
	LDA #$002D				;$B8A480   |
	STA $2E,x				;$B8A483   |
	LDA #$0001				;$B8A485   |
	JSL CODE_B9D0B8				;$B8A488   |
	LDA #$001F				;$B8A48C   |
	LDX #$001C				;$B8A48F   |
	LDY #$0000				;$B8A492   |
	JSR CODE_B8D8D5				;$B8A495   |
	JSR work_on_active_kong			;$B8A498   |
	LDX current_sprite			;$B8A49B   |
	LDA #$002E				;$B8A49D   |
	STA $2E,x				;$B8A4A0   |
	STZ $30,x				;$B8A4A2   |
	LDA #$001C				;$B8A4A4   |
	JSL CODE_B9D0B8				;$B8A4A7   |
	JSR work_on_inactive_kong		;$B8A4AB   |
	JMP CODE_B89979				;$B8A4AE  /

CODE_B8A4B1:
	LDX current_sprite			;$B8A4B1  \
	LDY active_kong_sprite			;$B8A4B3   |
	LDA $0006,y				;$B8A4B6   |
	SEC					;$B8A4B9   |
	SBC $06,x				;$B8A4BA   |
	BPL CODE_B8A4C2				;$B8A4BC   |
	EOR #$FFFF				;$B8A4BE   |
	INC A					;$B8A4C1   |
CODE_B8A4C2:					;	   |
	CMP #$0020				;$B8A4C2   |
	BPL CODE_B8A4DA				;$B8A4C5   |
	LDA $000A,y				;$B8A4C7   |
	SEC					;$B8A4CA   |
	SBC $0A,x				;$B8A4CB   |
	BPL CODE_B8A4D3				;$B8A4CD   |
	EOR #$FFFF				;$B8A4CF   |
	INC A					;$B8A4D2   |
CODE_B8A4D3:					;	   |
	CMP #$0020				;$B8A4D3   |
	BPL CODE_B8A4DA				;$B8A4D6   |
	SEC					;$B8A4D8   |
	RTS					;$B8A4D9  /

CODE_B8A4DA:
	CLC					;$B8A4DA  \
	RTS					;$B8A4DB  /

kong_behavior_2C:
	LDA #$0001				;$B8A4DC  \
	TSB $08C2				;$B8A4DF   |
	LDA #$000C				;$B8A4E2   |
	JSR process_player_action		;$B8A4E5   |
if !version == 0				;	   |
	JSR CODE_B8A186				;$B8A4E8   |
	JSR CODE_B89960				;$B8A4EB   |
else						;	   |
	JSR CODE_B89960				;$B8A4E8   |
	JSR CODE_B8A186				;$B8A4EB   |
endif						;	   |
	JMP CODE_B8996E				;$B8A4EE  /

kong_behavior_2D:
	JMP CODE_B89979				;$B8A4F1  /

kong_behavior_2E:
	JSL CODE_B9D100				;$B8A4F4  \
	LDA #$0001				;$B8A4F8   |
	TSB $08C2				;$B8A4FB   |
	LDA $099D				;$B8A4FE   |
	DEC A					;$B8A501   |
	DEC A					;$B8A502   |
	AND #$003F				;$B8A503   |
	CMP $099F				;$B8A506   |
	BEQ CODE_B8A522				;$B8A509   |
	STA $099D				;$B8A50B   |
	TAX					;$B8A50E   |
	LDY current_sprite			;$B8A50F   |
	LDA.l $7FA532,x				;$B8A511   |
	STA $0006,y				;$B8A515   |
	LDA.l $7FA572,x				;$B8A518   |
	STA $000A,y				;$B8A51C   |
	JMP CODE_B8996E				;$B8A51F  /

CODE_B8A522:
	LDX current_sprite			;$B8A522  \
	STZ $2E,x				;$B8A524   |
	STZ $20,x				;$B8A526   |
	STZ $26,x				;$B8A528   |
	LDA #$001E				;$B8A52A   |
	STA $30,x				;$B8A52D   |
	LDY inactive_kong_sprite		;$B8A52F   |
	LDA #$00D8				;$B8A532   |
	STA $0002,y				;$B8A535   |
	LDA $0006,y				;$B8A538   |
	STA $06,x				;$B8A53B   |
	LDA $000A,y				;$B8A53D   |
	STA $0A,x				;$B8A540   |
	LDA #$0022				;$B8A542   |
	STA $002E,y				;$B8A545   |
	LDA #$001F				;$B8A548   |
	LDX #$0003				;$B8A54B   |
	LDY #$0000				;$B8A54E   |
	JSR CODE_B8D8D5				;$B8A551   |
	JSL CODE_B9DFCF				;$B8A554   |
	JMP CODE_B8996E				;$B8A558  /

kong_behavior_2F:
	LDX current_sprite			;$B8A55B  \
	LDY $42,x				;$B8A55D   |
	LDA $0006,y				;$B8A55F   |
	STA $06,x				;$B8A562   |
	LDA $000A,y				;$B8A564   |
	STA $0A,x				;$B8A567   |
	JMP CODE_B89979				;$B8A569  /

kong_behavior_30:
	LDA #$0001				;$B8A56C  \
	TSB $08C2				;$B8A56F   |
	JSR CODE_B8A592				;$B8A572   |
	JSL CODE_B9D100				;$B8A575   |
	JMP CODE_B8996E				;$B8A579  /

CODE_B8A57C:
	LDX current_sprite			;$B8A57C  \
	LDA #$0100				;$B8A57E   |
	STA $20,x				;$B8A581   |
	STA $24,x				;$B8A583   |
	LDA #$0030				;$B8A585   |
	STA $2E,x				;$B8A588   |
	LDA #$0040				;$B8A58A   |
	JSL CODE_B9D0B8				;$B8A58D   |
	RTL					;$B8A591  /

CODE_B8A592:
	LDX current_sprite			;$B8A592  \
	LDA $20,x				;$B8A594   |
	JSR CODE_B8A5F0				;$B8A596   |
	STA $20,x				;$B8A599   |
	LDA $24,x				;$B8A59B   |
	JSR CODE_B8A5F0				;$B8A59D   |
	STA $24,x				;$B8A5A0   |
	LDY inactive_kong_sprite		;$B8A5A2   |
	LDA $0004,y				;$B8A5A5   |
	STA $32					;$B8A5A8   |
	LDA $0006,y				;$B8A5AA   |
	STA $34					;$B8A5AD   |
	LDA $04,x				;$B8A5AF   |
	STA $36					;$B8A5B1   |
	LDA $06,x				;$B8A5B3   |
	STA $38					;$B8A5B5   |
	STZ $3A					;$B8A5B7   |
	STZ $3C					;$B8A5B9   |
	LDA $20,x				;$B8A5BB   |
	STA $3B					;$B8A5BD   |
	JSR CODE_B8A5FE				;$B8A5BF   |
	LDA $36					;$B8A5C2   |
	STA $04,x				;$B8A5C4   |
	LDA $38					;$B8A5C6   |
	STA $06,x				;$B8A5C8   |
	LDA $0008,y				;$B8A5CA   |
	STA $32					;$B8A5CD   |
	LDA $000A,y				;$B8A5CF   |
	STA $34					;$B8A5D2   |
	LDA $08,x				;$B8A5D4   |
	STA $36					;$B8A5D6   |
	LDA $0A,x				;$B8A5D8   |
	STA $38					;$B8A5DA   |
	STZ $3A					;$B8A5DC   |
	STZ $3C					;$B8A5DE   |
	LDA $24,x				;$B8A5E0   |
	STA $3B					;$B8A5E2   |
	JSR CODE_B8A5FE				;$B8A5E4   |
	LDA $36					;$B8A5E7   |
	STA $08,x				;$B8A5E9   |
	LDA $38					;$B8A5EB   |
	STA $0A,x				;$B8A5ED   |
	RTS					;$B8A5EF  /

CODE_B8A5F0:
	CLC					;$B8A5F0  \
	ADC #$0060				;$B8A5F1   |
	CMP #$0A00				;$B8A5F4   |
	BPL CODE_B8A5FA				;$B8A5F7   |
	RTS					;$B8A5F9  /

CODE_B8A5FA:
	LDA #$0A00				;$B8A5FA  \
	RTS					;$B8A5FD  /

CODE_B8A5FE:
	LDA $38					;$B8A5FE  \
	CMP $34					;$B8A600   |
	BCC CODE_B8A616				;$B8A602   |
	LDA $36					;$B8A604   |
	SEC					;$B8A606   |
	SBC $3A					;$B8A607   |
	STA $36					;$B8A609   |
	LDA $38					;$B8A60B   |
	SBC $3C					;$B8A60D   |
	STA $38					;$B8A60F   |
	CMP $34					;$B8A611   |
	BCC CODE_B8A628				;$B8A613   |
	RTS					;$B8A615  /

CODE_B8A616:
	LDA $36					;$B8A616  \
	CLC					;$B8A618   |
	ADC $3A					;$B8A619   |
	STA $36					;$B8A61B   |
	LDA $38					;$B8A61D   |
	ADC $3C					;$B8A61F   |
	STA $38					;$B8A621   |
	CMP $34					;$B8A623   |
	BCS CODE_B8A628				;$B8A625   |
	RTS					;$B8A627  /

CODE_B8A628:
	LDA $34					;$B8A628  \
	STA $38					;$B8A62A   |
	RTS					;$B8A62C  /

kong_behavior_31:
	LDX current_sprite			;$B8A62D  \
	LDY active_kong_sprite			;$B8A62F   |
	LDA $0006,y				;$B8A632   |
	STA $06,x				;$B8A635   |
	LDA $000A,y				;$B8A637   |
	STA $0A,x				;$B8A63A   |
	JMP CODE_B89979				;$B8A63C  /

kong_behavior_32:
	JSR CODE_B8D99E				;$B8A63F  \
	JSR CODE_B8DA84				;$B8A642   |
	JSL CODE_B9D100				;$B8A645   |
	LDA $099F				;$B8A649   |
	INC A					;$B8A64C   |
	INC A					;$B8A64D   |
	AND #$003F				;$B8A64E   |
	CMP $099D				;$B8A651   |
	BNE CODE_B8A66B				;$B8A654   |
	LDX active_kong_sprite			;$B8A656   |
	LDA $2E,x				;$B8A659   |
	CMP #$0011				;$B8A65B   |
	BNE CODE_B8A66B				;$B8A65E   |
	LDX current_sprite			;$B8A660   |
	STZ $1A,x				;$B8A662   |
	STZ $16,x				;$B8A664   |
	LDA #$0031				;$B8A666   |
	STA $2E,x				;$B8A669   |
CODE_B8A66B:					;	   |
	JMP CODE_B89979				;$B8A66B  /

kong_behavior_33:
	JSR CODE_B89928				;$B8A66E  \
	LDX current_sprite			;$B8A671   |
	LDA $06,x				;$B8A673   |
	BIT $12,x				;$B8A675   |
	BVC CODE_B8A680				;$B8A677   |
	CMP $05A1				;$B8A679   |
	BMI CODE_B8A68B				;$B8A67C   |
	BRA CODE_B8A685				;$B8A67E  /

CODE_B8A680:
	CMP $05A1				;$B8A680  \
	BPL CODE_B8A68B				;$B8A683   |
CODE_B8A685:					;	   |
	JSR CODE_B8B530				;$B8A685   |
	JMP CODE_B8996E				;$B8A688  /

CODE_B8A68B:
	JSR CODE_B8A699				;$B8A68B  \
	JMP CODE_B8996E				;$B8A68E  /

CODE_B8A691:
	JSR CODE_B8A699				;$B8A691  \
	RTL					;$B8A694  /

CODE_B8A695:
	JSR CODE_B8A6A9				;$B8A695  \
	RTL					;$B8A698  /

CODE_B8A699:
	LDX inactive_kong_sprite		;$B8A699  \
	LDA #$0013				;$B8A69C   |
	STA $2E,x				;$B8A69F   |
	LDX active_kong_sprite			;$B8A6A1   |
	LDA #$0034				;$B8A6A4   |
	STA $2E,x				;$B8A6A7   |
CODE_B8A6A9:					;	   |
	LDA #$830F				;$B8A6A9   |
	JSL set_fade_global			;$B8A6AC   |
	LDA #$0002				;$B8A6B0   |
	TSB $08C2				;$B8A6B3   |
	RTS					;$B8A6B6  /

kong_behavior_34:
	JSR CODE_B8B530				;$B8A6B7  \
	JMP CODE_B8996E				;$B8A6BA  /

kong_behavior_35:
	LDA #$0008				;$B8A6BD  \
	TSB $08C2				;$B8A6C0   |
	LDA #$0013				;$B8A6C3   |
	JSR process_player_action		;$B8A6C6   |
	JSR CODE_B8A719				;$B8A6C9   |
	LDX current_sprite			;$B8A6CC   |
	STZ $0E,x				;$B8A6CE   |
	LDA #$000B				;$B8A6D0   |
	JSR interpolate_y_velocity		;$B8A6D3   |
	LDX current_sprite			;$B8A6D6   |
	LDA $08,x				;$B8A6D8   |
	STA $0D6A				;$B8A6DA   |
	LDA $0A,x				;$B8A6DD   |
	STA $0D6C				;$B8A6DF   |
	JSR CODE_B8D817				;$B8A6E2   |
	JSR CODE_B8D362				;$B8A6E5   |
	BCS CODE_B8A701				;$B8A6E8   |
	LDX current_sprite			;$B8A6EA   |
	LDA $24,x				;$B8A6EC   |
	BPL CODE_B8A710				;$B8A6EE   |
	LDA $10,x				;$B8A6F0   |
	AND #$0400				;$B8A6F2   |
	BNE CODE_B8A70B				;$B8A6F5   |
CODE_B8A6F7:					;	   |
	LDA $0D6A				;$B8A6F7   |
	STA $08,x				;$B8A6FA   |
	LDA $0D6C				;$B8A6FC   |
	STA $0A,x				;$B8A6FF   |
CODE_B8A701:					;	   |
	JSR update_damaged_invincibility	;$B8A701   |
	JSL CODE_B9D100				;$B8A704   |
CODE_B8A708:					;	   |
	JMP CODE_B8996E				;$B8A708  /

CODE_B8A70B:
	JSR CODE_B8A7C3				;$B8A70B  \
	BRA CODE_B8A708				;$B8A70E  /

CODE_B8A710:
	LDA $2A,x				;$B8A710  \
	BEQ CODE_B8A6F7				;$B8A712   |
	JSR CODE_B8A7E1				;$B8A714   |
	BRA CODE_B8A708				;$B8A717  /

CODE_B8A719:
	LDA #$8000				;$B8A719  \
	TSB $0AB8				;$B8A71C   |
	LDX current_sprite			;$B8A71F   |
	LDA $26,x				;$B8A721   |
	BEQ CODE_B8A732				;$B8A723   |
	LSR A					;$B8A725   |
	EOR $0AB8				;$B8A726   |
	AND #$4000				;$B8A729   |
	EOR $0AB8				;$B8A72C   |
	STA $0AB8				;$B8A72F   |
CODE_B8A732:					;	   |
	RTS					;$B8A732  /

kong_behavior_36:
	LDA #$0008				;$B8A733  \
	TSB $08C2				;$B8A736   |
	JSR CODE_B8A719				;$B8A739   |
	JSR update_damaged_invincibility	;$B8A73C   |
	JSL CODE_B9D100				;$B8A73F   |
	JMP CODE_B8996E				;$B8A743  /

kong_behavior_37:
	LDA #$0014				;$B8A746  \
	JSR process_player_action		;$B8A749   |
	JSR CODE_B8A719				;$B8A74C   |
	LDX current_sprite			;$B8A74F   |
	STZ $0E,x				;$B8A751   |
	LDA #$000B				;$B8A753   |
	JSR interpolate_y_velocity		;$B8A756   |
	LDX current_sprite			;$B8A759   |
	LDA $08,x				;$B8A75B   |
	STA $0D6A				;$B8A75D   |
	LDA $0A,x				;$B8A760   |
	STA $0D6C				;$B8A762   |
	JSR CODE_B8D817				;$B8A765   |
	JSR CODE_B8D378				;$B8A768   |
	CMP #$0003				;$B8A76B   |
	BCS CODE_B8A78C				;$B8A76E   |
	AND #$0003				;$B8A770   |
	BNE CODE_B8A7AA				;$B8A773   |
	LDX current_sprite			;$B8A775   |
	LDA $24,x				;$B8A777   |
	BPL CODE_B8A79E				;$B8A779   |
	LDA $10,x				;$B8A77B   |
	AND #$0400				;$B8A77D   |
	BNE CODE_B8A796				;$B8A780   |
CODE_B8A782:					;	   |
	LDA $0D6A				;$B8A782   |
	STA $08,x				;$B8A785   |
	LDA $0D6C				;$B8A787   |
	STA $0A,x				;$B8A78A   |
CODE_B8A78C:					;	   |
	JSR update_damaged_invincibility	;$B8A78C   |
	JSL CODE_B9D100				;$B8A78F   |
CODE_B8A793:					;	   |
	JMP CODE_B8996E				;$B8A793  /

CODE_B8A796:
	JSR CODE_B8A7F4				;$B8A796  \
	JSR CODE_B8A7C3				;$B8A799   |
	BRA CODE_B8A793				;$B8A79C  /

CODE_B8A79E:
	LDA $2A,x				;$B8A79E  \
	BEQ CODE_B8A782				;$B8A7A0   |
	JSR CODE_B8A7F4				;$B8A7A2   |
	JSR CODE_B8A7E1				;$B8A7A5   |
	BRA CODE_B8A793				;$B8A7A8  /

CODE_B8A7AA:
	LDX current_sprite			;$B8A7AA  \
	BIT $12,x				;$B8A7AC   |
	BVC CODE_B8A7B3				;$B8A7AE   |
	EOR #$0003				;$B8A7B0   |
CODE_B8A7B3:					;	   |
	CMP #$0001				;$B8A7B3   |
	BEQ CODE_B8A7BD				;$B8A7B6   |
	JSR CODE_B8C305				;$B8A7B8   |
	BRA CODE_B8A7C0				;$B8A7BB  /

CODE_B8A7BD:
	JSR double_rope_climb_right_action	;$B8A7BD  \
CODE_B8A7C0:					;	   |
	JMP CODE_B8996E				;$B8A7C0  /

CODE_B8A7C3:
	LDA #$F900				;$B8A7C3  \
	STA $24,x				;$B8A7C6   |
	STZ $20,x				;$B8A7C8   |
	LDA #$0039				;$B8A7CA   |
	STA $2E,x				;$B8A7CD   |
	LDA #$0006				;$B8A7CF   |
	JSL CODE_B9D0B8				;$B8A7D2   |
	JSR set_player_terminal_velocity	;$B8A7D6   |
	JSR set_player_normal_gravity		;$B8A7D9   |
	JSL CODE_B5E43E				;$B8A7DC   |
	RTS					;$B8A7E0  /

CODE_B8A7E1:
	LDX current_sprite			;$B8A7E1  \
	STZ $20,x				;$B8A7E3   |
	JSR set_player_terminal_velocity	;$B8A7E5   |
	JSR set_player_normal_gravity		;$B8A7E8   |
	JSL CODE_B5E43E				;$B8A7EB   |
	JSL CODE_B9DFCF				;$B8A7EF   |
	RTS					;$B8A7F3  /

CODE_B8A7F4:
	LDA $06,x				;$B8A7F4  \
	BIT $12,x				;$B8A7F6   |
	BVS CODE_B8A800				;$B8A7F8   |
	SEC					;$B8A7FA   |
	SBC #$0010				;$B8A7FB   |
	BRA CODE_B8A804				;$B8A7FE  /

CODE_B8A800:
	CLC					;$B8A800  \
	ADC #$0010				;$B8A801   |
CODE_B8A804:					;	   |
	STA $06,x				;$B8A804   |
	RTS					;$B8A806  /

kong_behavior_38:
	LDA #$0015				;$B8A807  \
	JSR process_player_action		;$B8A80A   |
	BCS CODE_B8A837				;$B8A80D   |
	LDX current_sprite			;$B8A80F   |
	STZ $0E,x				;$B8A811   |
	LDA #$000B				;$B8A813   |
	JSR interpolate_x_velocity		;$B8A816   |
	LDX current_sprite			;$B8A819   |
	LDA $04,x				;$B8A81B   |
	STA $0D66				;$B8A81D   |
	LDA $06,x				;$B8A820   |
	STA $0D68				;$B8A822   |
	JSR CODE_B8D7FE				;$B8A825   |
	JSR CODE_B8D36D				;$B8A828   |
	BCC CODE_B8A83A				;$B8A82B   |
CODE_B8A82D:					;	   |
	JSR CODE_B8D225				;$B8A82D   |
	JSR update_damaged_invincibility	;$B8A830   |
	JSL CODE_B9D100				;$B8A833   |
CODE_B8A837:					;	   |
	JMP CODE_B8996E				;$B8A837  /

CODE_B8A83A:
	LDA $AE					;$B8A83A  \
	AND #$6000				;$B8A83C   |
	BNE CODE_B8A84F				;$B8A83F   |
	LDX current_sprite			;$B8A841   |
	LDA $0D66				;$B8A843   |
	STA $04,x				;$B8A846   |
	LDA $0D68				;$B8A848   |
	STA $06,x				;$B8A84B   |
	BRA CODE_B8A82D				;$B8A84D  /

CODE_B8A84F:
	JSR set_player_terminal_velocity	;$B8A84F  \
	JSR set_player_normal_gravity		;$B8A852   |
	JSR start_player_falling		;$B8A855   |
	LDX current_sprite			;$B8A858   |
	STZ $24,x				;$B8A85A   |
	STZ $20,x				;$B8A85C   |
	BRA CODE_B8A837				;$B8A85E  /

kong_behavior_39:
	JSR face_moving_direction		;$B8A860  \
	JSR set_normal_gravity_if_falling	;$B8A863   |
	JSR CODE_B8994C				;$B8A866   |
	JMP CODE_B8996E				;$B8A869  /

kong_behavior_3A:
	JSR face_moving_direction		;$B8A86C  \
	JSR set_normal_gravity_if_falling	;$B8A86F   |
	JSR apply_player_gravity		;$B8A872   |
	JSR get_x_acceleration			;$B8A875   |
	LDA [$8E],y				;$B8A878   |
	JSR interpolate_x_velocity		;$B8A87A   |
	JSR CODE_B8D24A				;$B8A87D   |
	JSR CODE_B8CF83				;$B8A880   |
	JSR CODE_B89960				;$B8A883   |
	JSR CODE_B8B714				;$B8A886   |
	JMP CODE_B8996E				;$B8A889  /

kong_behavior_3B:
	LDX current_sprite			;$B8A88C  \
	DEC $42,x				;$B8A88E   |
	BEQ CODE_B8A89C				;$B8A890   |
	LDA $06,x				;$B8A892   |
	EOR #$0001				;$B8A894   |
	STA $06,x				;$B8A897   |
	JMP CODE_B8996E				;$B8A899  /

CODE_B8A89C:
	JSR CODE_B8A699				;$B8A89C  \
	LDA #$FFFF				;$B8A89F   |
	STA $059D				;$B8A8A2   |
	JMP CODE_B8996E				;$B8A8A5  /

kong_behavior_3C:
	LDX current_sprite			;$B8A8A8  \
	LDA $12,x				;$B8A8AA   |
	AND #$BFFF				;$B8A8AC   |
	STA $12,x				;$B8A8AF   |
	LDA #$E000				;$B8A8B1   |
	ORA $0AB8				;$B8A8B4   |
	STA $0AB8				;$B8A8B7   |
	LDA #$0016				;$B8A8BA   |
	JSR process_player_action		;$B8A8BD   |
	BCS CODE_B8A8C9				;$B8A8C0   |
	JSR update_damaged_invincibility	;$B8A8C2   |
	JSL CODE_B9D100				;$B8A8C5   |
CODE_B8A8C9:					;	   |
	JMP CODE_B8996E				;$B8A8C9  /

kong_behavior_3D:
	LDA #$0017				;$B8A8CC  \
	JSR process_player_action		;$B8A8CF   |
	BCS CODE_B8A8D7				;$B8A8D2   |
	JSR CODE_B898B5				;$B8A8D4   |
CODE_B8A8D7:					;	   |
	JMP CODE_B8996E				;$B8A8D7  /

kong_behavior_3E:
	LDX current_sprite			;$B8A8DA  \
	DEC $42,x				;$B8A8DC   |
	BPL CODE_B8A8E3				;$B8A8DE   |
	JMP CODE_B8A939				;$B8A8E0  /

CODE_B8A8E3:
	LDY $66					;$B8A8E3  \
	LDA $20,x				;$B8A8E5   |
	CLC					;$B8A8E7   |
	ADC $26,x				;$B8A8E8   |
	STA $20,x				;$B8A8EA   |
	JSR CODE_B8A96F				;$B8A8EC   |
	CLC					;$B8A8EF   |
	ADC $0D66				;$B8A8F0   |
	STA $06,x				;$B8A8F3   |
	LDA $24,x				;$B8A8F5   |
	CLC					;$B8A8F7   |
	ADC $2A,x				;$B8A8F8   |
	STA $24,x				;$B8A8FA   |
	JSR CODE_B8A96F				;$B8A8FC   |
	CLC					;$B8A8FF   |
	ADC $0D6A				;$B8A900   |
	STA $0A,x				;$B8A903   |
	LDA #$0060				;$B8A905   |
	CLC					;$B8A908   |
	ADC $46,x				;$B8A909   |
	BMI CODE_B8A915				;$B8A90B   |
	CMP #$0600				;$B8A90D   |
	BCC CODE_B8A915				;$B8A910   |
	LDA #$0600				;$B8A912   |
CODE_B8A915:					;	   |
	STA $46,x				;$B8A915   |
	CLC					;$B8A917   |
	ADC $44,x				;$B8A918   |
	STA $44,x				;$B8A91A   |
	LDY #$0000				;$B8A91C   |
	LDA $44,x				;$B8A91F   |
	BPL CODE_B8A924				;$B8A921   |
	DEY					;$B8A923   |
CODE_B8A924:					;	   |
	CLC					;$B8A924   |
	ADC $09,x				;$B8A925   |
	STA $09,x				;$B8A927   |
	TYA					;$B8A929   |
	ADC $0B,x				;$B8A92A   |
	SEP #$20				;$B8A92C   |
	STA $0B,x				;$B8A92E   |
	REP #$20				;$B8A930   |
	JSL CODE_B9D100				;$B8A932   |
	JMP CODE_B8996E				;$B8A936  /

CODE_B8A939:
	LDY $66					;$B8A939  \
	LDX current_sprite			;$B8A93B   |
	LDA $48,x				;$B8A93D   |
	STA $06,x				;$B8A93F   |
	LDA $4A,x				;$B8A941   |
	STA $0A,x				;$B8A943   |
	LDA #$0000				;$B8A945   |
	STA $30,x				;$B8A948   |
	JSR CODE_B8A984				;$B8A94A   |
	LDA #$001F				;$B8A94D   |
	LDX #$0003				;$B8A950   |
	LDY #$0000				;$B8A953   |
	JSR CODE_B8D8D5				;$B8A956   |
	JSR disable_bullet_time			;$B8A959   |
	LDX current_sprite			;$B8A95C   |
	STZ $24,x				;$B8A95E   |
	LDA #$0022				;$B8A960   |
	STA $2E,x				;$B8A963   |
	LDA #$0006				;$B8A965   |
	JSL CODE_B9D0B8				;$B8A968   |
	JMP CODE_B8996E				;$B8A96C  /

CODE_B8A96F:
	CMP #$8000				;$B8A96F  \
	ROR A					;$B8A972   |
	CMP #$8000				;$B8A973   |
	ROR A					;$B8A976   |
	CMP #$8000				;$B8A977   |
	ROR A					;$B8A97A   |
	CMP #$8000				;$B8A97B   |
	ROR A					;$B8A97E   |
	CMP #$8000				;$B8A97F   |
	ROR A					;$B8A982   |
	RTS					;$B8A983  /

CODE_B8A984:
	LDA #$0002				;$B8A984  \
	STA $2E,x				;$B8A987   |
	RTS					;$B8A989  /

CODE_B8A98A:
	JSR CODE_B8A98E				;$B8A98A  \
	RTL					;$B8A98D  /

CODE_B8A98E:
	LDA $08C2				;$B8A98E  \
	AND #$4000				;$B8A991   |
	BEQ CODE_B8A997				;$B8A994   |
CODE_B8A996:					;	   |
	RTS					;$B8A996  /

CODE_B8A997:
	LDX active_kong_sprite			;$B8A997  \
	LDA $2E,x				;$B8A99A   |
	ASL A					;$B8A99C   |
	ASL A					;$B8A99D   |
	TAX					;$B8A99E   |
	LDA.l DATA_B896B7,x			;$B8A99F   |
	AND #$0001				;$B8A9A3   |
	BNE CODE_B8A996				;$B8A9A6   |
	LDA $6E					;$B8A9A8   |
	BEQ CODE_B8A9BB				;$B8A9AA   |
	LDA current_player_mount		;$B8A9AC   |
	BNE CODE_B8A9BB				;$B8A9AE   |
	LDA #$4000				;$B8A9B0   |
	TSB $08C2				;$B8A9B3   |
	JSL CODE_B39118				;$B8A9B6   |
	RTS					;$B8A9BA  /

CODE_B8A9BB:
	LDX current_sprite			;$B8A9BB  \
	LDY inactive_kong_sprite		;$B8A9BD   |
	LDA $06,x				;$B8A9C0   |
	STA $0006,y				;$B8A9C2   |
	LDA $0A,x				;$B8A9C5   |
	STA $000A,y				;$B8A9C7   |
	LDA #$0000				;$B8A9CA   |
	STA $0030,y				;$B8A9CD   |
	LDA #$003E				;$B8A9D0   |
	STA $002E,y				;$B8A9D3   |
	LDA #$0000				;$B8A9D6   |
	STA $001E,y				;$B8A9D9   |
	LDA #$4000				;$B8A9DC   |
	TSB $08C2				;$B8A9DF   |
	LDA current_sprite			;$B8A9E2   |
	PHA					;$B8A9E4   |
	JSL CODE_B880A2				;$B8A9E5   |
	LDA #$0006				;$B8A9E9   |
	JSL CODE_B9D0B8				;$B8A9EC   |
	JSR CODE_B8AA00				;$B8A9F0   |
	PLA					;$B8A9F3   |
	STA current_sprite			;$B8A9F4   |
	LDA #$000F				;$B8A9F6   |
if !version == 0				;	   |
	LDY #$0258				;$B8A9F9   |
else						;	   |
	LDY #$00F0				;$B8A9F9   |
endif						;	   |
	JSR enable_bullet_time			;$B8A9FC   |
	RTS					;$B8A9FF  /

CODE_B8AA00:
	LDY $0599				;$B8AA00  \
	LDX inactive_kong_sprite		;$B8AA03   |
	LDA $06,x				;$B8AA06   |
	STA $0D66				;$B8AA08   |
	LDA $0A,x				;$B8AA0B   |
	STA $0D6A				;$B8AA0D   |
	STZ $20,x				;$B8AA10   |
	STZ $24,x				;$B8AA12   |
	LDA #$0020				;$B8AA14   |
	STA $42,x				;$B8AA17   |
	LDY active_kong_sprite			;$B8AA19   |
	LDA $0006,y				;$B8AA1C   |
	SEC					;$B8AA1F   |
	SBC $06,x				;$B8AA20   |
	STA $26,x				;$B8AA22   |
	LDA $000A,y				;$B8AA24   |
	SEC					;$B8AA27   |
	SBC $0A,x				;$B8AA28   |
	STA $2A,x				;$B8AA2A   |
	LDA #$FA00				;$B8AA2C   |
	STA $46,x				;$B8AA2F   |
	STA $44,x				;$B8AA31   |
	LDA $0006,y				;$B8AA33   |
	STA $48,x				;$B8AA36   |
	LDA $000A,y				;$B8AA38   |
	STA $4A,x				;$B8AA3B   |
	RTS					;$B8AA3D  /

kong_behavior_3F:
	LDA #$000A				;$B8AA3E  \
	JSR process_player_action		;$B8AA41   |
	JSR face_moving_direction		;$B8AA44   |
	JSR set_normal_gravity_if_falling	;$B8AA47   |
	JSR CODE_B8994C				;$B8AA4A   |
	JMP CODE_B8996E				;$B8AA4D  /

kong_behavior_40:
	LDA #$0002				;$B8AA50  \
	TSB $0933				;$B8AA53   |
	JSR CODE_B8D99E				;$B8AA56   |
	JSL CODE_B9D100				;$B8AA59   |
	LDA $099F				;$B8AA5D   |
	INC A					;$B8AA60   |
	INC A					;$B8AA61   |
	AND #$003F				;$B8AA62   |
	CMP $099D				;$B8AA65   |
	BEQ CODE_B8AA6D				;$B8AA68   |
	JMP CODE_B89979				;$B8AA6A  /

CODE_B8AA6D:
	LDA #$0005				;$B8AA6D  \
	JSL CODE_B8D8BA				;$B8AA70   |
	JMP CODE_B89979				;$B8AA74  /

kong_behavior_41:
	LDA #$0018				;$B8AA77  \
	JSR process_player_action		;$B8AA7A   |
	BCS CODE_B8AA89				;$B8AA7D   |
	JSR CODE_B8AA8C				;$B8AA7F   |
	JSR update_damaged_invincibility	;$B8AA82   |
	JSL CODE_B9D100				;$B8AA85   |
CODE_B8AA89:					;	   |
	JMP CODE_B8996E				;$B8AA89  /

CODE_B8AA8C:
	LDA #$9000				;$B8AA8C  \
	STA $0AF0				;$B8AA8F   |
	LDA #$8000				;$B8AA92   |
	STA $0AEA				;$B8AA95   |
	STA $0AEC				;$B8AA98   |
	LDA #$2000				;$B8AA9B   |
	TSB $0AB8				;$B8AA9E   |
	RTS					;$B8AAA1  /

kong_behavior_42:
	LDY $66					;$B8AAA2  \
	LDA $0006,y				;$B8AAA4   |
	ORA #$0004				;$B8AAA7   |
	STA $0006,y				;$B8AAAA   |
	JSR CODE_B8AA8C				;$B8AAAD   |
	LDA #$0001				;$B8AAB0   |
	JSR process_player_action		;$B8AAB3   |
	JSR face_moving_direction		;$B8AAB6   |
	JSR set_normal_gravity_if_falling	;$B8AAB9   |
	JSR CODE_B8994C				;$B8AABC   |
	JSR CODE_B8B714				;$B8AABF   |
	JSR CODE_B8B5C3				;$B8AAC2   |
	LDX current_sprite			;$B8AAC5   |
	LDA $1E,x				;$B8AAC7   |
	AND #$0001				;$B8AAC9   |
	BEQ CODE_B8AAD2				;$B8AACC   |
	JSL CODE_B5E43E				;$B8AACE   |
CODE_B8AAD2:					;	   |
	JMP CODE_B8996E				;$B8AAD2  /

kong_behavior_43:
	LDA #$0019				;$B8AAD5  \
	JSR process_player_action		;$B8AAD8   |
	JSR update_damaged_invincibility	;$B8AADB   |
	JSL CODE_B9D100				;$B8AADE   |
	JMP CODE_B8996E				;$B8AAE2  /

kong_behavior_44:
	LDX current_sprite			;$B8AAE5  \
	DEC $42,x				;$B8AAE7   |
	BMI CODE_B8AB08				;$B8AAE9   |
	LDA $42,x				;$B8AAEB   |
	CMP #$001E				;$B8AAED   |
	BPL CODE_B8AAF4				;$B8AAF0   |
	STZ $24,x				;$B8AAF2   |
CODE_B8AAF4:					;	   |
	LDA #$001A				;$B8AAF4   |
	JSR process_player_action		;$B8AAF7   |
	JSR CODE_B89D07				;$B8AAFA   |
	JSR CODE_B8994C				;$B8AAFD   |
	STZ $AC					;$B8AB00   |
	JSR CODE_B89C70				;$B8AB02   |
	JMP CODE_B8996E				;$B8AB05  /

CODE_B8AB08:
	LDA #$0018				;$B8AB08  \
	JSR set_player_interaction		;$B8AB0B   |
	JMP CODE_B8996E				;$B8AB0E  /

kong_behavior_45:
	LDA $0BA0				;$B8AB11  \
	BEQ CODE_B8AB5D				;$B8AB14   |
	LDA #$0008				;$B8AB16   |
	TSB $08C2				;$B8AB19   |
	LDA #$0013				;$B8AB1C   |
	JSR process_player_action		;$B8AB1F   |
	JSR CODE_B8A719				;$B8AB22   |
	LDX current_sprite			;$B8AB25   |
	STZ $0E,x				;$B8AB27   |
	LDA #$000B				;$B8AB29   |
	JSR interpolate_y_velocity		;$B8AB2C   |
	JSR CODE_B8D817				;$B8AB2F   |
	JSR CODE_B8B4CF				;$B8AB32   |
	LDA $00,x				;$B8AB35   |
	CMP #$02D8				;$B8AB37   |
	BEQ CODE_B8AB62				;$B8AB3A   |
	JSR CODE_B8B4F7				;$B8AB3C   |
	BCC CODE_B8AB53				;$B8AB3F   |
	STA $5E					;$B8AB41   |
	LDX current_sprite			;$B8AB43   |
	LDA $24,x				;$B8AB45   |
	DEC A					;$B8AB47   |
	BMI CODE_B8AB4F				;$B8AB48   |
	LDA $2A,x				;$B8AB4A   |
	DEC A					;$B8AB4C   |
	BPL CODE_B8AB5D				;$B8AB4D   |
CODE_B8AB4F:					;	   |
	LDA $5E					;$B8AB4F   |
	STA $0A,x				;$B8AB51   |
CODE_B8AB53:					;	   |
	JSR update_damaged_invincibility	;$B8AB53   |
	JSL CODE_B9D100				;$B8AB56   |
CODE_B8AB5A:					;	   |
	JMP CODE_B8996E				;$B8AB5A  /

CODE_B8AB5D:
	JSR CODE_B8A7E1				;$B8AB5D  \
	BRA CODE_B8AB5A				;$B8AB60  /

CODE_B8AB62:
	LDA $4A,x				;$B8AB62  \
	SEC					;$B8AB64   |
	SBC $0A,x				;$B8AB65   |
	STA $38					;$B8AB67   |
	CLC					;$B8AB69   |
	ADC #$0014				;$B8AB6A   |
	STA $34					;$B8AB6D   |
	JSR CODE_B8B4F7				;$B8AB6F   |
	BCC CODE_B8AB53				;$B8AB72   |
	STA $0A,x				;$B8AB74   |
	BRA CODE_B8AB53				;$B8AB76  /

kong_behavior_46:
	JSR apply_player_gravity		;$B8AB78  \
	JSR get_x_acceleration			;$B8AB7B   |
	JSR CODE_B8CF83				;$B8AB7E   |
	LDY #$0002				;$B8AB81   |
	LDX current_sprite			;$B8AB84   |
	LDA $42,x				;$B8AB86   |
	CMP $06,x				;$B8AB88   |
	BPL CODE_B8AB8F				;$B8AB8A   |
	STA $06,x				;$B8AB8C   |
	DEY					;$B8AB8E   |
CODE_B8AB8F:					;	   |
	LDA $44,x				;$B8AB8F   |
	CMP $0A,x				;$B8AB91   |
	BPL CODE_B8AB98				;$B8AB93   |
	STA $0A,x				;$B8AB95   |
	DEY					;$B8AB97   |
CODE_B8AB98:					;	   |
	TYA					;$B8AB98   |
	BEQ CODE_B8ABA8				;$B8AB99   |
	JSR update_damaged_invincibility	;$B8AB9B   |
	JSL CODE_B9D100				;$B8AB9E   |
	JSR CODE_B8B530				;$B8ABA2   |
	JMP CODE_B8996E				;$B8ABA5  /

CODE_B8ABA8:
	STZ $20,x				;$B8ABA8  \
	LDA #$0047				;$B8ABAA   |
	STA $2E,x				;$B8ABAD   |
	LDA $0B02				;$B8ABAF   |
	AND #$0004				;$B8ABB2   |
	BEQ CODE_B8ABC0				;$B8ABB5   |
	LDA #$0045				;$B8ABB7   |
	JSL CODE_B9D0B8				;$B8ABBA   |
	BRA CODE_B8ABC7				;$B8ABBE  /

CODE_B8ABC0:
	LDA #$0046				;$B8ABC0  \
	JSL CODE_B9D0B8				;$B8ABC3   |
CODE_B8ABC7:					;	   |
	LDA $08C2				;$B8ABC7   |
	AND #$4000				;$B8ABCA   |
	BEQ CODE_B8ABE0				;$B8ABCD   |
	LDX inactive_kong_sprite		;$B8ABCF   |
	LDA #$005E				;$B8ABD2   |
	STA $2E,x				;$B8ABD5   |
	STZ $30,x				;$B8ABD7   |
	LDA $12,x				;$B8ABD9   |
	AND #$BFFF				;$B8ABDB   |
	STA $12,x				;$B8ABDE   |
CODE_B8ABE0:					;	   |
	JSR CODE_B8B530				;$B8ABE0   |
	JMP CODE_B8996E				;$B8ABE3  /

kong_behavior_47:
	LDA #$0008				;$B8ABE6  \
	TSB $08C2				;$B8ABE9   |
	JSR update_damaged_invincibility	;$B8ABEC   |
	JSL CODE_B9D100				;$B8ABEF   |
	JMP CODE_B8996E				;$B8ABF3  /

kong_behavior_48:
	LDA #$001D				;$B8ABF6  \
	JSR process_player_action		;$B8ABF9   |
	JSR update_damaged_invincibility	;$B8ABFC   |
	JSL CODE_B9D100				;$B8ABFF   |
	JMP CODE_B8996E				;$B8AC03  /

kong_behavior_49:
	LDA #$000C				;$B8AC06  \
	JSR process_player_action		;$B8AC09   |
	JSR update_damaged_invincibility	;$B8AC0C   |
	JSL CODE_B9D100				;$B8AC0F   |
	JSR CODE_B8B7F4				;$B8AC13   |
	JMP CODE_B8996E				;$B8AC16  /

kong_behavior_4A:
	LDA #$000C				;$B8AC19  \
	JSR process_player_action		;$B8AC1C   |
	JSR update_damaged_invincibility	;$B8AC1F   |
	JSR CODE_B8B7F4				;$B8AC22   |
	JMP CODE_B89979				;$B8AC25  /

kong_behavior_4B:
	LDA #$000C				;$B8AC28  \
	JSR process_player_action		;$B8AC2B   |
	JSR update_damaged_invincibility	;$B8AC2E   |
	JSR CODE_B8CF83				;$B8AC31   |
	LDX current_sprite			;$B8AC34   |
	LDA $20,x				;$B8AC36   |
	BPL CODE_B8AC43				;$B8AC38   |
	LDA $0D66				;$B8AC3A   |
	CMP $06,x				;$B8AC3D   |
	BPL CODE_B8AC51				;$B8AC3F   |
	BRA CODE_B8AC4A				;$B8AC41  /

CODE_B8AC43:
	LDA $0D66				;$B8AC43  \
	CMP $06,x				;$B8AC46   |
	BMI CODE_B8AC51				;$B8AC48   |
CODE_B8AC4A:					;	   |
	JSL CODE_B9D100				;$B8AC4A   |
	JMP CODE_B8996E				;$B8AC4E  /

CODE_B8AC51:
	STA $06,x				;$B8AC51  \
	LDA $0D6A				;$B8AC53   |
	STA $0A,x				;$B8AC56   |
	INC $2E,x				;$B8AC58   |
	LDA #$0001				;$B8AC5A   |
	STA $1E,x				;$B8AC5D   |
	LDA #$004A				;$B8AC5F   |
	JSL CODE_B9D0B8				;$B8AC62   |
	JMP CODE_B8996E				;$B8AC66  /

kong_behavior_4C:
	LDA #$000C				;$B8AC69  \
	JSR process_player_action		;$B8AC6C   |
	LDX inactive_kong_sprite		;$B8AC6F   |
	LDA $2E,x				;$B8AC72   |
	CMP #$004E				;$B8AC74   |
	BEQ CODE_B8AC80				;$B8AC77   |
	JSL CODE_B9D100				;$B8AC79   |
	JMP CODE_B8996E				;$B8AC7D  /

CODE_B8AC80:
	LDX current_sprite			;$B8AC80  \
	LDA #$00E4				;$B8AC82   |
	STA $02,x				;$B8AC85   |
	STZ $2E,x				;$B8AC87   |
	STZ $20,x				;$B8AC89   |
	STZ $26,x				;$B8AC8B   |
	STZ $0C,x				;$B8AC8D   |
	LDA #$8000				;$B8AC8F   |
	STA $04,x				;$B8AC92   |
	STA $08,x				;$B8AC94   |
	LDA #$0600				;$B8AC96   |
	STA $24,x				;$B8AC99   |
	LDA #$0001				;$B8AC9B   |
	JSL CODE_B9D0B8				;$B8AC9E   |
	LDX inactive_kong_sprite		;$B8ACA2   |
	LDA #$00D8				;$B8ACA5   |
	STA $02,x				;$B8ACA8   |
	LDA #$0022				;$B8ACAA   |
	STA $2E,x				;$B8ACAD   |
	LDA #$001F				;$B8ACAF   |
	LDX #$0003				;$B8ACB2   |
	LDY #$0000				;$B8ACB5   |
	JSR CODE_B8D8D5				;$B8ACB8   |
	JSR disable_bullet_time			;$B8ACBB   |
	JMP CODE_B8996E				;$B8ACBE  /

kong_behavior_4D:
	LDA #$000C				;$B8ACC1  \
	JSR process_player_action		;$B8ACC4   |
	LDX current_sprite			;$B8ACC7   |
	LDA #$0050				;$B8ACC9   |\
	CLC					;$B8ACCC   | | add y velocity to kong
	ADC $24,x				;$B8ACCD   |/
	BMI CODE_B8ACD9				;$B8ACCF   |> if kong is falling
	CMP #$0800				;$B8ACD1   |\
	BCC CODE_B8ACD9				;$B8ACD4   |/ if kong hasn't reached terminal velocity
	LDA #$0800				;$B8ACD6   |> otherwise clamp y velocity
CODE_B8ACD9:					;	   |
	STA $24,x				;$B8ACD9   |
	JSR CODE_B8CF83				;$B8ACDB   |
	LDA $0D6C				;$B8ACDE   |
	CMP $0A,x				;$B8ACE1   |
	BMI .CODE_B8ACEF			;$B8ACE3   |
	JSR update_damaged_invincibility	;$B8ACE5   |
	JSL CODE_B9D100				;$B8ACE8   |
	JMP CODE_B89979				;$B8ACEC  /

.CODE_B8ACEF
	STA $0A,x				;$B8ACEF  \
	LDA $0D68				;$B8ACF1   |
	STA $06,x				;$B8ACF4   |
	INC $2E,x				;$B8ACF6   |
	LDA #$004A				;$B8ACF8   |
	JSL CODE_B9D0B8				;$B8ACFB   |
	JMP CODE_B89979				;$B8ACFF  /

kong_behavior_4E:
	LDA #$000C				;$B8AD02  \
	JSR process_player_action		;$B8AD05   |
	JSL CODE_B9D100				;$B8AD08   |
	JMP CODE_B8996E				;$B8AD0C  /

kong_behavior_4F:
	LDA #$0025				;$B8AD0F  \
	JSR process_player_action		;$B8AD12   |
	LDX current_sprite			;$B8AD15   |
	LDA $42,x				;$B8AD17   |
	STA $20,x				;$B8AD19   |
	STA $26,x				;$B8AD1B   |
	JSR CODE_B8994C				;$B8AD1D   |
	LDA #$0008				;$B8AD20   |
	JSL CODE_BCFA9A				;$B8AD23   |
	JMP CODE_B8996E				;$B8AD27  /

kong_behavior_50:
	LDY $66					;$B8AD2A  \
	LDA $0000,y				;$B8AD2C   |
	CMP #$008F				;$B8AD2F   |
	BEQ CODE_B8AD44				;$B8AD32   |
	LDA #$0007				;$B8AD34   |
	JSL CODE_BCFB69				;$B8AD37   |
	LDA #$0020				;$B8AD3B   |
	JSL CODE_BCFE0A				;$B8AD3E   |
	BCS CODE_B8AD88				;$B8AD42   |
CODE_B8AD44:					;	   |
	LDX current_sprite			;$B8AD44   |
	LDA $2E,x				;$B8AD46   |
	CMP #$0054				;$B8AD48   |
	BNE CODE_B8AD5B				;$B8AD4B   |
	LDA #$000C				;$B8AD4D   |
	JSR process_player_action		;$B8AD50   |
	BCS CODE_B8AD85				;$B8AD53   |
	LDX current_sprite			;$B8AD55   |
	STZ $2A,x				;$B8AD57   |
	BRA CODE_B8AD63				;$B8AD59  /

CODE_B8AD5B:
	LDA #$001E				;$B8AD5B  \
	JSR process_player_action		;$B8AD5E   |
	BCS CODE_B8AD85				;$B8AD61   |
CODE_B8AD63:					;	   |
	JSR check_sprite_underwater		;$B8AD63   |
	CMP #$0001				;$B8AD66   |
	BNE CODE_B8AD76				;$B8AD69   |
	LDA #$0400				;$B8AD6B   |
	LDY $0D4A				;$B8AD6E   |
	BEQ CODE_B8AD74				;$B8AD71   |
	TYA					;$B8AD73   |
CODE_B8AD74:					;	   |
	STA $2A,x				;$B8AD74   |
CODE_B8AD76:					;	   |
	LDA #$0003				;$B8AD76   |
	JSR interpolate_x_velocity		;$B8AD79   |
	LDA #$0003				;$B8AD7C   |
	JSR interpolate_y_velocity		;$B8AD7F   |
	JSR CODE_B898C2				;$B8AD82   |
CODE_B8AD85:					;	   |
	JMP CODE_B8996E				;$B8AD85  /

CODE_B8AD88:
	LDX current_sprite			;$B8AD88  \
	STZ $20,x				;$B8AD8A   |
	JSR start_enguarde_attack		;$B8AD8C   |
	JMP CODE_B8996E				;$B8AD8F  /

kong_behavior_51:
	LDA #$001E				;$B8AD92  \
	JSR process_player_action		;$B8AD95   |
	BCS CODE_B8ADAC				;$B8AD98   |
	LDA #$0003				;$B8AD9A   |
	JSR interpolate_x_velocity		;$B8AD9D   |
	LDA #$0003				;$B8ADA0   |
	JSR interpolate_y_velocity		;$B8ADA3   |
	JSR CODE_B898C2				;$B8ADA6   |
	JSR CODE_B8ADE8				;$B8ADA9   |
CODE_B8ADAC:					;	   |
	JMP CODE_B8996E				;$B8ADAC  /

kong_behavior_52:
	LDA #$0026				;$B8ADAF  \
	JSR process_player_action		;$B8ADB2   |
	BCS CODE_B8ADDD				;$B8ADB5   |
	LDX current_sprite			;$B8ADB7   |
	LDA $42,x				;$B8ADB9   |
	STA $20,x				;$B8ADBB   |
	STA $26,x				;$B8ADBD   |
	LDA #$0003				;$B8ADBF   |
	JSR interpolate_x_velocity		;$B8ADC2   |
	LDA #$0003				;$B8ADC5   |
	JSR interpolate_y_velocity		;$B8ADC8   |
	JSR CODE_B898C2				;$B8ADCB   |
	JSR CODE_B8ADE8				;$B8ADCE   |
	LDX current_sprite			;$B8ADD1   |
	LDA $1E,x				;$B8ADD3   |
	AND #$0202				;$B8ADD5   |
	CMP #$0202				;$B8ADD8   |
	BEQ CODE_B8ADE0				;$B8ADDB   |
CODE_B8ADDD:					;	   |
	JMP CODE_B8996E				;$B8ADDD  /

CODE_B8ADE0:
	LDA #$0050				;$B8ADE0  \
	STA $2E,x				;$B8ADE3   |
	JMP CODE_B8996E				;$B8ADE5  /

CODE_B8ADE8:
	LDA #$0006				;$B8ADE8  \
	JSL CODE_BCFA9A				;$B8ADEB   |
	RTS					;$B8ADEF  /

kong_behavior_53:
	LDA #$000C				;$B8ADF0  \
	JSR process_player_action		;$B8ADF3   |
	LDX current_sprite			;$B8ADF6   |
	LDA $32,x				;$B8ADF8   |
	CMP #$0002				;$B8ADFA   |
	BEQ CODE_B8AE0B				;$B8ADFD   |
	JSR CODE_B8B8DA				;$B8ADFF   |
	JSR CODE_B8994C				;$B8AE02   |
	JSR CODE_B89AE0				;$B8AE05   |
	JMP CODE_B8996E				;$B8AE08  /

CODE_B8AE0B:
	JSR start_rambi_attack			;$B8AE0B  \
	JMP CODE_B8996E				;$B8AE0E  /

kong_behavior_55:
	JSL CODE_B9D100				;$B8AE11  \
	JMP CODE_B8996E				;$B8AE15  /

kong_behavior_56:
	LDX current_sprite			;$B8AE18  \
	LDA $1E,x				;$B8AE1A   |
	AND #$0303				;$B8AE1C   |
	BNE CODE_B8AE4A				;$B8AE1F   |
	LDA #$0009				;$B8AE21   |
	JSL CODE_BCFA9A				;$B8AE24   |
	LDA #$0001				;$B8AE28   |
	JSR process_player_action		;$B8AE2B   |
	JSR face_moving_direction		;$B8AE2E   |
	JSR set_normal_gravity_if_falling	;$B8AE31   |
	LDX $0595				;$B8AE34   |
	LDA $06,x				;$B8AE37   |
	ORA #$0004				;$B8AE39   |
	STA $06,x				;$B8AE3C   |
	JSR CODE_B8994C				;$B8AE3E   |
	JSR CODE_B8B714				;$B8AE41   |
	JSR CODE_B8B5C3				;$B8AE44   |
	JMP CODE_B8996E				;$B8AE47  /

CODE_B8AE4A:
	JSL CODE_B9DFCF				;$B8AE4A  \
	JMP CODE_B8996E				;$B8AE4E  /

kong_behavior_57:
	JSR CODE_B89B30				;$B8AE51  \
	LDA #$0007				;$B8AE54   |
	JSR process_player_action		;$B8AE57   |
	JSR CODE_B8B8DA				;$B8AE5A   |
	JSR CODE_B8994C				;$B8AE5D   |
	JMP CODE_B8996E				;$B8AE60  /

kong_behavior_58:
	LDA #$000C				;$B8AE63  \
	JSR process_player_action		;$B8AE66   |
	JSR apply_player_gravity		;$B8AE69   |
	JSR get_x_acceleration			;$B8AE6C   |
	LDA [$8E],y				;$B8AE6F   |
	JSR interpolate_x_velocity		;$B8AE71   |
	JSR CODE_B8D24A				;$B8AE74   |
	JSR CODE_B8CF83				;$B8AE77   |
	JSR CODE_B8B516				;$B8AE7A   |
	JSR CODE_B89960				;$B8AE7D   |
	JMP CODE_B8996E				;$B8AE80  /

kong_behavior_59:
	LDA #$0020				;$B8AE83  \
	JSR process_player_action		;$B8AE86   |
	JSR apply_player_gravity		;$B8AE89   |
	JSR get_x_acceleration			;$B8AE8C   |
	LDA [$8E],y				;$B8AE8F   |
	JSR interpolate_x_velocity		;$B8AE91   |
	JSR CODE_B8D24A				;$B8AE94   |
	JSR CODE_B8CF83				;$B8AE97   |
	LDX current_sprite			;$B8AE9A   |
	STZ $1E,x				;$B8AE9C   |
	JSR CODE_B89963				;$B8AE9E   |
	JMP CODE_B8996E				;$B8AEA1  /

kong_behavior_5A:
	LDA #$000C				;$B8AEA4  \
	JSR process_player_action		;$B8AEA7   |
	JSR CODE_B8994C				;$B8AEAA   |
	JMP CODE_B8996E				;$B8AEAD  /

kong_behavior_5B:
	LDA #$0020				;$B8AEB0  \
	JSR process_player_action		;$B8AEB3   |
CODE_B8AEB6:					;	   |
	JSR update_damaged_invincibility	;$B8AEB6   |
	JSL CODE_B9D100				;$B8AEB9   |
	JMP CODE_B8996E				;$B8AEBD  /

kong_behavior_70:
	LDX current_sprite			;$B8AEC0  \
	LDA $4E,x				;$B8AEC2   |
	STA $26,x				;$B8AEC4   |
	LDA $06,x				;$B8AEC6   |
	SEC					;$B8AEC8   |
	SBC $17BA				;$B8AEC9   |
	BMI CODE_B8AED5				;$B8AECC   |
	CMP #$0100				;$B8AECE   |
	BPL CODE_B8AED5				;$B8AED1   |
	BRA CODE_B8AEB6				;$B8AED3  /

CODE_B8AED5:
	LDA $4E,x				;$B8AED5  \
	STA $26,x				;$B8AED7   |
	STA $20,x				;$B8AED9   |
	LDA #$0066				;$B8AEDB   |
	STA $2E,x				;$B8AEDE   |
	STZ $24,x				;$B8AEE0   |
	JSR CODE_B8A6A9				;$B8AEE2   |
	JML CODE_B8996E				;$B8AEE5  /

kong_behavior_5D:
	LDA #$001F				;$B8AEE9  \
	JSR process_player_action		;$B8AEEC   |
	LDX current_sprite			;$B8AEEF   |
	LDA $42,x				;$B8AEF1   |
	BPL CODE_B8AF13				;$B8AEF3   |
	JSR apply_player_gravity		;$B8AEF5   |
	LDX current_sprite			;$B8AEF8   |
	LDA $24,x				;$B8AEFA   |
	JSR CODE_B8D5E6				;$B8AEFC   |
	LDA $1E,x				;$B8AEFF   |
	LSR A					;$B8AF01   |
	BCC CODE_B8AF11				;$B8AF02   |
	LDA $44,x				;$B8AF04   |
	EOR #$FFFF				;$B8AF06   |
	INC A					;$B8AF09   |
	STA $24,x				;$B8AF0A   |
	LDA $44,x				;$B8AF0C   |
	LSR A					;$B8AF0E   |
	STA $44,x				;$B8AF0F   |
CODE_B8AF11:					;	   |
	BRA CODE_B8AF15				;$B8AF11  /

CODE_B8AF13:
	DEC $42,x				;$B8AF13  \
CODE_B8AF15:					;	   |
	JSR update_damaged_invincibility	;$B8AF15   |
	LDX current_sprite			;$B8AF18   |
	LDA $50,x				;$B8AF1A   |
	BEQ CODE_B8AF30				;$B8AF1C   |
	XBA					;$B8AF1E   |
	TAY					;$B8AF1F   |
	BMI CODE_B8AF2E				;$B8AF20   |
	EOR #$FFFF				;$B8AF22   |
	INC A					;$B8AF25   |
	AND #$FF00				;$B8AF26   |
	XBA					;$B8AF29   |
	STA $50,x				;$B8AF2A   |
	BRA CODE_B8AF30				;$B8AF2C  /

CODE_B8AF2E:
	STZ $50,x				;$B8AF2E  \
CODE_B8AF30:					;	   |
	JSR CODE_B8AF85				;$B8AF30   |
	BCC CODE_B8AF41				;$B8AF33   |
	LDX current_sprite			;$B8AF35   |
	JSR CODE_B8AF63				;$B8AF37   |
	STA $50,x				;$B8AF3A   |
	LDA #$8001				;$B8AF3C   |
	STA $1C,x				;$B8AF3F   |
CODE_B8AF41:					;	   |
	LDA $091F				;$B8AF41   |
	BMI CODE_B8AF49				;$B8AF44   |
	JMP CODE_B8996E				;$B8AF46  /

CODE_B8AF49:
	LDX current_sprite			;$B8AF49  \
	STZ $1C,x				;$B8AF4B   |
	STZ $50,x				;$B8AF4D   |
	LDA $091B				;$B8AF4F   |
	AND #$FCFF				;$B8AF52   |
	STA $091B				;$B8AF55   |
	JSL CODE_BB8C2C				;$B8AF58   |
	JSL CODE_B9DFCF				;$B8AF5C   |
	JMP CODE_B8996E				;$B8AF60  /

CODE_B8AF63:
	LDA $091F				;$B8AF63  \
	CMP #$0008				;$B8AF66   |
	BMI CODE_B8AF81				;$B8AF69   |
	CMP #$0010				;$B8AF6B   |
	BMI CODE_B8AF7D				;$B8AF6E   |
	CMP #$0018				;$B8AF70   |
	BMI CODE_B8AF79				;$B8AF73   |
	LDA #$0001				;$B8AF75   |
	RTS					;$B8AF78  /

CODE_B8AF79:
	LDA #$0002				;$B8AF79  \
	RTS					;$B8AF7C  /

CODE_B8AF7D:
	LDA #$0003				;$B8AF7D  \
	RTS					;$B8AF80  /

CODE_B8AF81:
	LDA #$0004				;$B8AF81  \
	RTS					;$B8AF84  /

CODE_B8AF85:
	LDX $0595				;$B8AF85  \
	LDA $02,x				;$B8AF88   |
	AND #$C0C0				;$B8AF8A   |
	BEQ CODE_B8AF95				;$B8AF8D   |
	LDA #$0008				;$B8AF8F   |
	TSB $0B02				;$B8AF92   |
CODE_B8AF95:					;	   |
	LDA global_frame_counter		;$B8AF95   |
	AND #$0003				;$B8AF97   |
	BNE CODE_B8AFA9				;$B8AF9A   |
	LDA #$0008				;$B8AF9C   |
	TRB $0B02				;$B8AF9F   |
	BEQ CODE_B8AFA9				;$B8AFA2   |
	DEC $091F				;$B8AFA4   |
	SEC					;$B8AFA7   |
	RTS					;$B8AFA8  /

CODE_B8AFA9:
	CLC					;$B8AFA9  \
	RTS					;$B8AFAA  /

DATA_B8AFAB:
	db $06, $06, $05, $05, $05, $04, $04, $04
	db $04, $03, $03, $03, $03, $02, $02, $02
	db $02


kong_behavior_5E:
	LDX current_sprite			;$B8AFBC  \
	LDY #$002C				;$B8AFBE   |
	LDA [$8E],y				;$B8AFC1   |
	STA $20,x				;$B8AFC3   |
	STA $26,x				;$B8AFC5   |
	JSR CODE_B89933				;$B8AFC7   |
	LDX current_sprite			;$B8AFCA   |
	LDA $1E,x				;$B8AFCC   |
	LSR A					;$B8AFCE   |
	BCS CODE_B8AFD4				;$B8AFCF   |
	JMP CODE_B89979				;$B8AFD1  /

CODE_B8AFD4:
	INC $2E,x				;$B8AFD4  \
	STZ $24,x				;$B8AFD6   |
	LDA #$003D				;$B8AFD8   |
	JSL CODE_B9D000				;$B8AFDB   |
	JMP CODE_B89979				;$B8AFDF  /

kong_behavior_5F:
	JSL CODE_BBBB69				;$B8AFE2  \
	BCS CODE_B8B002				;$B8AFE6   |
	LDX current_sprite			;$B8AFE8   |
	STZ $30,x				;$B8AFEA   |
	LDY #$002C				;$B8AFEC   |
	LDA [$8E],y				;$B8AFEF   |
	STA $20,x				;$B8AFF1   |
	STA $26,x				;$B8AFF3   |
	JSR CODE_B8CF83				;$B8AFF5   |
	JSR update_damaged_invincibility	;$B8AFF8   |
	JSL CODE_B9D100				;$B8AFFB   |
	JMP CODE_B89979				;$B8AFFF  /

CODE_B8B002:
	JSR CODE_B8B831				;$B8B002  \
	JMP CODE_B89979				;$B8B005  /

kong_behavior_60:
	LDX current_sprite			;$B8B008  \
	DEC $42,x				;$B8B00A   |
	BEQ CODE_B8B01A				;$B8B00C   |
	LDA #$0008				;$B8B00E   |
	JSR process_player_action		;$B8B011   |
	JSR CODE_B89966				;$B8B014   |
	JMP CODE_B8996E				;$B8B017  /

CODE_B8B01A:
	LDA #$000B				;$B8B01A  \
	STA $2E,x				;$B8B01D   |
	JMP kong_behavior_0B			;$B8B01F  /

kong_behavior_61:
	LDA #$0007				;$B8B022  \
	JSR process_player_action		;$B8B025   |
	JSR CODE_B8994C				;$B8B028   |
	JSR CODE_B8B5DA				;$B8B02B   |
	JMP CODE_B8996E				;$B8B02E  /

kong_behavior_62:
	LDA #$0008				;$B8B031  \
	JSR process_player_action		;$B8B034   |
	JSR set_player_jumping_gravity		;$B8B037   |
	LDY $66					;$B8B03A   |
	LDA $0006,y				;$B8B03C   |
	ORA #$0004				;$B8B03F   |
	STA $0006,y				;$B8B042   |
	JSR face_moving_direction		;$B8B045   |
	JSR set_normal_gravity_if_falling	;$B8B048   |
	JSR CODE_B8994C				;$B8B04B   |
	JMP CODE_B8996E				;$B8B04E  /

kong_behavior_63:
	LDA #$001F				;$B8B051  \
	JSR process_player_action		;$B8B054   |
	JSR update_damaged_invincibility	;$B8B057   |
	JSR CODE_B8AF85				;$B8B05A   |
	LDA global_frame_counter		;$B8B05D   |
	AND #$0003				;$B8B05F   |
	BNE CODE_B8B072				;$B8B062   |
	LDX current_sprite			;$B8B064   |
	LDA #$8001				;$B8B066   |
	STA $1C,x				;$B8B069   |
	LDA $50,x				;$B8B06B   |
	EOR #$0400				;$B8B06D   |
	STA $50,x				;$B8B070   |
CODE_B8B072:					;	   |
	LDA global_frame_counter		;$B8B072   |
	AND #$0003				;$B8B074   |
	BNE CODE_B8B07C				;$B8B077   |
	DEC $091F				;$B8B079   |
CODE_B8B07C:					;	   |
	LDA $091F				;$B8B07C   |
	BMI CODE_B8B084				;$B8B07F   |
	JMP CODE_B8996E				;$B8B081  /

CODE_B8B084:
	LDX current_sprite			;$B8B084  \
	STZ $50,x				;$B8B086   |
	JSL CODE_B9DFCF				;$B8B088   |
	JMP CODE_B8996E				;$B8B08C  /

kong_behavior_64:
	LDX current_sprite			;$B8B08F  \
	LDA $1E,x				;$B8B091   |
	AND #$0001				;$B8B093   |
	BNE CODE_B8B0AC				;$B8B096   |
	LDA $0A,x				;$B8B098   |
	SEC					;$B8B09A   |
	SBC $17C0				;$B8B09B   |
	CMP #$0120				;$B8B09E   |
	BPL CODE_B8B0AC				;$B8B0A1   |
CODE_B8B0A3:					;	   |
	JSR CODE_B89933				;$B8B0A3   |
	JSR CODE_B8D225				;$B8B0A6   |
	JMP CODE_B8996E				;$B8B0A9  /

CODE_B8B0AC:
	JSR CODE_B8830E				;$B8B0AC  \
	BRA CODE_B8B0A3				;$B8B0AF  /

kong_behavior_65:
	LDX current_sprite			;$B8B0B1  \
	LDA $4E,x				;$B8B0B3   |
	STA $26,x				;$B8B0B5   |
	LDA $06,x				;$B8B0B7   |
	SEC					;$B8B0B9   |
	SBC $17BA				;$B8B0BA   |
	BMI CODE_B8B0D6				;$B8B0BD   |
	CMP #$0100				;$B8B0BF   |
	BPL CODE_B8B0D6				;$B8B0C2   |
	JSR CODE_B89933				;$B8B0C4   |
	LDX current_sprite			;$B8B0C7   |
	LDA $1E,x				;$B8B0C9   |
	AND #$0002				;$B8B0CB   |
	CMP #$0002				;$B8B0CE   |
	BEQ CODE_B8B0D6				;$B8B0D1   |
	JMP CODE_B8996E				;$B8B0D3  /

CODE_B8B0D6:
	LDA $4E,x				;$B8B0D6  \
	STA $26,x				;$B8B0D8   |
	STA $20,x				;$B8B0DA   |
	INC $2E,x				;$B8B0DC   |
	STZ $24,x				;$B8B0DE   |
	JSR CODE_B8A6A9				;$B8B0E0   |
	JMP CODE_B8996E				;$B8B0E3  /

kong_behavior_66:
	JSR CODE_B89928				;$B8B0E6  \
	JMP CODE_B8996E				;$B8B0E9  /

kong_behavior_67:
	LDA #$0001				;$B8B0EC  \
	JSR process_player_action		;$B8B0EF   |
	JSR set_normal_gravity_if_falling	;$B8B0F2   |
	JSR CODE_B8994C				;$B8B0F5   |
	JSR CODE_B8B5C3				;$B8B0F8   |
	JSR CODE_B8B107				;$B8B0FB   |
	JMP CODE_B8996E				;$B8B0FE  /

kong_behavior_68:
	JSR CODE_B8B107				;$B8B101  \
	JMP kong_behavior_16			;$B8B104  /

CODE_B8B107:
	LDX current_sprite			;$B8B107  \
	LDY $42,x				;$B8B109   |
	BEQ CODE_B8B136				;$B8B10B   |
	LDA $000E,y				;$B8B10D   |
	BMI CODE_B8B12E				;$B8B110   |
	LDA $0006,y				;$B8B112   |
	CMP #$3340				;$B8B115   |
	BCC CODE_B8B11F				;$B8B118   |
	CMP #$3370				;$B8B11A   |
	BCC CODE_B8B12E				;$B8B11D   |
CODE_B8B11F:					;	   |
	LDA $004A,y				;$B8B11F   |
	STA $06,x				;$B8B122   |
	SEC					;$B8B124   |
	SBC $0006,y				;$B8B125   |
	LDX $0595				;$B8B128   |
	STA $0E,x				;$B8B12B   |
	RTS					;$B8B12D  /

CODE_B8B12E:
	LDA #$0000				;$B8B12E  \
	STA $0042,y				;$B8B131   |
	STA $42,x				;$B8B134   |
CODE_B8B136:					;	   |
	RTS					;$B8B136  /

kong_behavior_69:
	LDA #$0021				;$B8B137  \
	JSR process_player_action		;$B8B13A   |
	JSR face_moving_direction		;$B8B13D   |
	LDA #$2000				;$B8B140   |
	TSB $0AB8				;$B8B143   |
	LDX current_sprite			;$B8B146   |
	LDA $24,x				;$B8B148   |
	SEC					;$B8B14A   |
	SBC #$007C				;$B8B14B   |
	STA $24,x				;$B8B14E   |
	JSR apply_player_gravity		;$B8B150   |
	LDY #$006E				;$B8B153   |
	LDA [$8E],y				;$B8B156   |
	JSR interpolate_x_velocity		;$B8B158   |
	JSR CODE_B89957				;$B8B15B   |
	LDY $19C4				;$B8B15E   |
	LDA $004A,y				;$B8B161   |
	CLC					;$B8B164   |
	ADC $2A,x				;$B8B165   |
	STA $32					;$B8B167   |
	LDA $24,x				;$B8B169   |
	BPL CODE_B8B175				;$B8B16B   |
	CMP $32					;$B8B16D   |
	BPL CODE_B8B175				;$B8B16F   |
	LDA $32					;$B8B171   |
	STA $24,x				;$B8B173   |
CODE_B8B175:					;	   |
	JMP CODE_B8996E				;$B8B175  /

kong_behavior_6A:
	LDA #$000C				;$B8B178  \
	JSR process_player_action		;$B8B17B   |
	JSR apply_player_gravity		;$B8B17E   |
	JSR CODE_B89928				;$B8B181   |
	JMP CODE_B89979				;$B8B184  /

kong_behavior_6B:
	LDA #$000C				;$B8B187  \
	JSR process_player_action		;$B8B18A   |
	JSR apply_player_gravity		;$B8B18D   |
	JSR CODE_B89928				;$B8B190   |
	JSR CODE_B8B53A				;$B8B193   |
	JMP CODE_B89979				;$B8B196  /

kong_behavior_6C:
	LDY $66					;$B8B199  \
	LDA $0000,y				;$B8B19B   |
	CMP #$008F				;$B8B19E   |
	BEQ CODE_B8B1B3				;$B8B1A1   |
	LDA #$0007				;$B8B1A3   |
	JSL CODE_BCFB69				;$B8B1A6   |
	LDA #$0020				;$B8B1AA   |
	JSL CODE_BCFE0A				;$B8B1AD   |
	BCS CODE_B8B1C4				;$B8B1B1   |
CODE_B8B1B3:					;	   |
	LDA #$0022				;$B8B1B3   |
	JSR process_player_action		;$B8B1B6   |
	BCS CODE_B8B1C1				;$B8B1B9   |
	JSR CODE_B8994C				;$B8B1BB   |
	JSR CODE_B8B5DA				;$B8B1BE   |
CODE_B8B1C1:					;	   |
	JMP CODE_B8996E				;$B8B1C1  /

CODE_B8B1C4:
	LDX current_sprite			;$B8B1C4  \
	STZ $20,x				;$B8B1C6   |
	JSR start_enguarde_attack		;$B8B1C8   |
	JMP CODE_B8996E				;$B8B1CB  /

kong_behavior_6D:
	LDX current_sprite			;$B8B1CE  \
	DEC $42,x				;$B8B1D0   |
	BPL CODE_B8B1D9				;$B8B1D2   |
	LDA #$0001				;$B8B1D4   |
	STA $2E,x				;$B8B1D7   |
CODE_B8B1D9:					;	   |
	JSR face_moving_direction		;$B8B1D9   |
	JSR set_normal_gravity_if_falling	;$B8B1DC   |
	JSR CODE_B8994C				;$B8B1DF   |
	JMP CODE_B8996E				;$B8B1E2  /

kong_behavior_6E:
	LDX current_sprite			;$B8B1E5  \
	LDA $24,x				;$B8B1E7   |
	SEC					;$B8B1E9   |
	SBC #$0080				;$B8B1EA   |
	BMI CODE_B8B1F4				;$B8B1ED   |
	LDA #$0006				;$B8B1EF   |
	STA $2E,x				;$B8B1F2   |
CODE_B8B1F4:					;	   |
	LDA #$0001				;$B8B1F4   |
	JSR process_player_action		;$B8B1F7   |
	JSR face_moving_direction		;$B8B1FA   |
	JSR set_normal_gravity_if_falling	;$B8B1FD   |
	JSR CODE_B8994C				;$B8B200   |
	JSR CODE_B89CCD				;$B8B203   |
	BCS CODE_B8B20E				;$B8B206   |
	JSR CODE_B8B714				;$B8B208   |
	JSR CODE_B8B5C3				;$B8B20B   |
CODE_B8B20E:					;	   |
	JMP CODE_B8996E				;$B8B20E  /

kong_behavior_6F:
	LDA #$0023				;$B8B211  \
	JSR process_player_action		;$B8B214   |
	BCS CODE_B8B252				;$B8B217   |
CODE_B8B219:					;	   |
	LDA #$0100				;$B8B219   |
	TSB $08C2				;$B8B21C   |
	DEC global_frame_counter		;$B8B21F   |
	LDX current_sprite			;$B8B221   |
	LDA $4A,x				;$B8B223   |
	STA $32					;$B8B225   |
	INC A					;$B8B227   |
	AND #$0FFF				;$B8B228   |
	STA $4A,x				;$B8B22B   |
	EOR $32					;$B8B22D   |
	AND #$0010				;$B8B22F   |
	BNE CODE_B8B237				;$B8B232   |
CODE_B8B234:					;	   |
	JML [$05A9]				;$B8B234  /

CODE_B8B237:
	LDA $32					;$B8B237  \
	AND #$0010				;$B8B239   |
	BNE CODE_B8B245				;$B8B23C   |
	LDA #$C000				;$B8B23E   |
	STA $1C,x				;$B8B241   |
	BRA CODE_B8B234				;$B8B243  /

CODE_B8B245:
	LDA #$075E				;$B8B245  \
	JSL play_high_priority_sound		;$B8B248   |
CODE_B8B24C:					;	   |
	LDX current_sprite			;$B8B24C   |
	STZ $1C,x				;$B8B24E   |
	BRA CODE_B8B234				;$B8B250  /

CODE_B8B252:
	LDA #$0700				;$B8B252  \
	JSL play_high_priority_sound		;$B8B255   |
	BRA CODE_B8B24C				;$B8B259  /

kong_behavior_71:
	JSL CODE_B9D100				;$B8B25B  \
	JMP CODE_B89979				;$B8B25F  /

kong_behavior_72:
	LDA #$0020				;$B8B262  \
	JSR process_player_action		;$B8B265   |
	JSR apply_player_gravity		;$B8B268   |
	LDA #$0007				;$B8B26B   |
	JSR interpolate_x_velocity		;$B8B26E   |
	JSR CODE_B8CF83				;$B8B271   |
	JSL CODE_B9D100				;$B8B274   |
	JMP CODE_B89979				;$B8B278  /

kong_behavior_73:
	JSL CODE_BBC140				;$B8B27B  \
	JMP CODE_B8997E				;$B8B27F  /

kong_behavior_74:
	JSL CODE_B9D0F3				;$B8B282  \
	JSL CODE_BBC140				;$B8B286   |
	JMP CODE_B8997E				;$B8B28A  /

kong_behavior_75:
	LDA #$000B				;$B8B28D  \
	JSR interpolate_x_velocity		;$B8B290   |
	JSR CODE_B8CF83				;$B8B293   |
	JSL CODE_B9D0F3				;$B8B296   |
	JSL CODE_BBC140				;$B8B29A   |
	JMP CODE_B8997E				;$B8B29E  /

kong_behavior_76:
	LDX current_sprite			;$B8B2A1  \
	LDY $66					;$B8B2A3   |
	LDA #$0060				;$B8B2A5   |
	CLC					;$B8B2A8   |
	ADC $24,x				;$B8B2A9   |
	BMI .CODE_B8B2B5			;$B8B2AB   |
	CMP #$0600				;$B8B2AD   |
	BCC .CODE_B8B2B5			;$B8B2B0   |
	LDA #$0600				;$B8B2B2   |
.CODE_B8B2B5					;	   |
	STA $24,x				;$B8B2B5   |
	JSR CODE_B8CF83				;$B8B2B7   |
	LDX current_sprite			;$B8B2BA   |
	LDA $24,x				;$B8B2BC   |
	BMI .CODE_B8B2CA			;$B8B2BE   |
	LDY active_kong_sprite			;$B8B2C0   |
	LDA $0A,x				;$B8B2C3   |
	CMP $000A,y				;$B8B2C5   |
	BPL .CODE_B8B2D4			;$B8B2C8   |
.CODE_B8B2CA					;	   |
	JSR update_damaged_invincibility	;$B8B2CA   |
	JSL CODE_B9D0F3				;$B8B2CD   |
	JMP CODE_B89979				;$B8B2D1  /

.CODE_B8B2D4
	LDA #$0022				;$B8B2D4  \
	STA $2E,x				;$B8B2D7   |
	LDA #$00D8				;$B8B2D9   |
	STA $02,x				;$B8B2DC   |
	LDA #$001F				;$B8B2DE   |
	LDX #$0003				;$B8B2E1   |
	LDY #$0000				;$B8B2E4   |
	JSR CODE_B8D8D5				;$B8B2E7   |
	LDX active_kong_sprite			;$B8B2EA   |
	LDA #$00E4				;$B8B2ED   |
	STA $02,x				;$B8B2F0   |
	JSR work_on_active_kong			;$B8B2F2   |
	JSR start_player_falling		;$B8B2F5   |
	JSR work_on_inactive_kong		;$B8B2F8   |
	JMP CODE_B89979				;$B8B2FB  /

kong_behavior_77:
	JSR CODE_B8CF83				;$B8B2FE  \
	JSR CODE_B8B310				;$B8B301   |
	JMP CODE_B8996E				;$B8B304  /

kong_behavior_78:
	JSR CODE_B8CF83				;$B8B307  \
	JSR CODE_B8B310				;$B8B30A   |
	JMP CODE_B89979				;$B8B30D  /

CODE_B8B310:
	LDX current_sprite			;$B8B310  \
	LDA $00,x				;$B8B312   |
	CMP #$00E8				;$B8B314   |
	BNE CODE_B8B377				;$B8B317   |
	DEC $0D64				;$B8B319   |
	BNE CODE_B8B377				;$B8B31C   |
if !version == 1				;	   |
	LDY $0595				;$B8B31E   |
	LDA #$0000				;$B8B321   |
	STA $0014,y				;$B8B324   |
	LDA $0016,y				;$B8B327   |
	PHA					;$B8B32A   |
	JSL CODE_80889C				;$B8B32B   |
	LDY $0595				;$B8B32F   |
	PLA					;$B8B332   |
	STA $0016,y				;$B8B333   |
	LDA #$0000				;$B8B336   |
	STA $0014,y				;$B8B339   |
else						;	   |
	JSL CODE_80889C				;$B8B31E   |
endif						;	   |
	JSR work_on_active_kong			;$B8B33C   |
	LDA #$003D				;$B8B33F   |
	STA $2E,x				;$B8B342   |
if !version == 1				;	   |
	STZ $1C,x				;$B8B344   |
endif						;	   |
	LDA $0D66				;$B8B346   |
	STA $04,x				;$B8B349   |
	LDA $0D6C				;$B8B34B   |
	STA $0A,x				;$B8B34E   |
	LDA #$00E4				;$B8B350   |
	STA $02,x				;$B8B353   |
	JSR CODE_B8B6C7				;$B8B355   |
	JSR work_on_inactive_kong		;$B8B358   |
	LDA #$0022				;$B8B35B   |
	STA $2E,x				;$B8B35E   |
if !version == 1				;	   |
	STZ $1C,x				;$B8B360   |
endif						;	   |
	LDA #$00D8				;$B8B362   |
	STA $02,x				;$B8B365   |
	LDA #$001F				;$B8B367   |
	LDX #$0043				;$B8B36A   |
	LDY #$0000				;$B8B36D   |
	JSR CODE_B8D8D5				;$B8B370   |
	JSL CODE_BB8C19				;$B8B373   |
CODE_B8B377:					;	   |
	RTS					;$B8B377  /

kong_behavior_79:
	LDA #$0019				;$B8B378  \
	JSR process_player_action		;$B8B37B   |
	JSR update_damaged_invincibility	;$B8B37E   |
	JSL CODE_B9D100				;$B8B381   |
	JMP CODE_B8996E				;$B8B385  /

kong_behavior_7A:
	LDA #$0024				;$B8B388  \
	JSR process_player_action		;$B8B38B   |
	JSR update_damaged_invincibility	;$B8B38E   |
	JSL CODE_B9D100				;$B8B391   |
	JMP CODE_B8996E				;$B8B395  /

kong_behavior_7B:
	LDA #$0020				;$B8B398  \
	JSR process_player_action		;$B8B39B   |
	JSR apply_player_gravity		;$B8B39E   |
	JSR get_x_acceleration			;$B8B3A1   |
	LDA [$8E],y				;$B8B3A4   |
	JSR interpolate_x_velocity		;$B8B3A6   |
	JSR CODE_B8D24A				;$B8B3A9   |
	JSR CODE_B8D5E6				;$B8B3AC   |
	JSR CODE_B8B516				;$B8B3AF   |
	JSR CODE_B8D225				;$B8B3B2   |
	JSR CODE_B8B53A				;$B8B3B5   |
	JSR update_damaged_invincibility	;$B8B3B8   |
	JSL CODE_B9D0F3				;$B8B3BB   |
	LDX current_sprite			;$B8B3BF   |
	LDA $1E,x				;$B8B3C1   |
	AND #$0001				;$B8B3C3   |
	BNE CODE_B8B3CB				;$B8B3C6   |
CODE_B8B3C8:					;	   |
	JMP CODE_B8997E				;$B8B3C8  /

CODE_B8B3CB:
	CPX inactive_kong_sprite		;$B8B3CB  \
	BEQ CODE_B8B3C8				;$B8B3CE   |
	JSR work_on_active_kong			;$B8B3D0   |
	LDA #$0047				;$B8B3D3   |
	STA $2E,x				;$B8B3D6   |
	LDA #$0045				;$B8B3D8   |
	JSL CODE_B9D0B8				;$B8B3DB   |
	LDA $08C2				;$B8B3DF   |
	AND #$4000				;$B8B3E2   |
	BEQ CODE_B8B3E7				;$B8B3E5   |
CODE_B8B3E7:					;	   |
	JSR CODE_B8B3F0				;$B8B3E7   |
	BRA CODE_B8B3C8				;$B8B3EA  /

CODE_B8B3EC:
	JSR CODE_B8B3F0				;$B8B3EC  \
	RTL					;$B8B3EF  /

CODE_B8B3F0:
	LDA level_number			;$B8B3F0  \
	CMP #!level_k_rool_duel			;$B8B3F2   |
	BEQ CODE_B8B40A				;$B8B3F5   |
	CMP #$00B9				;$B8B3F7   |
	BEQ CODE_B8B40A				;$B8B3FA   |
	CMP #$006B				;$B8B3FC   |
	BEQ CODE_B8B435				;$B8B3FF   |
	LDX #$0002				;$B8B401   |
	LDY #$0003				;$B8B404   |
	JSR CODE_B89171				;$B8B407   |
CODE_B8B40A:					;	   |
	JSL CODE_BB8114				;$B8B40A   |
	BCS CODE_B8B434				;$B8B40E   |
	LDA.l DATA_FF1904			;$B8B410   |
	TAY					;$B8B414   |
	JSL CODE_BB8432				;$B8B415   |
	BCS CODE_B8B434				;$B8B419   |
	LDX alternate_sprite			;$B8B41B   |
	LDA #$001B				;$B8B41D   |
	STA $42,x				;$B8B420   |
	STZ $20,x				;$B8B422   |
	STZ $24,x				;$B8B424   |
	LDY active_kong_sprite			;$B8B426   |
	LDA $0006,y				;$B8B429   |
	STA $06,x				;$B8B42C   |
	LDA $17C0				;$B8B42E   |
	STA $0A,x				;$B8B431   |
	CLC					;$B8B433   |
CODE_B8B434:					;	   |
	RTS					;$B8B434  /

CODE_B8B435:
	JSL CODE_BB8135				;$B8B435  \
	BCS CODE_B8B434				;$B8B439   |
	LDA.l DATA_FF18F0			;$B8B43B   |
	TAY					;$B8B43F   |
	JSL CODE_BB8432				;$B8B440   |
	BCS CODE_B8B434				;$B8B444   |
	LDX alternate_sprite			;$B8B446   |
	LDA $12,x				;$B8B448   |
	ORA #$3000				;$B8B44A   |
	STA $12,x				;$B8B44D   |
	LDA #$0011				;$B8B44F   |
	STA $42,x				;$B8B452   |
	STZ $20,x				;$B8B454   |
	STZ $24,x				;$B8B456   |
	LDY active_kong_sprite			;$B8B458   |
	LDA $0006,y				;$B8B45B   |
	STA $06,x				;$B8B45E   |
	LDA $17C0				;$B8B460   |
	STA $0A,x				;$B8B463   |
	CLC					;$B8B465   |
	RTS					;$B8B466  /

kong_behavior_7C:
	LDX current_sprite			;$B8B467  \
	STZ $2C,x				;$B8B469   |
	JSR apply_player_gravity		;$B8B46B   |
	LDA #$000B				;$B8B46E   |
	JSR interpolate_x_velocity		;$B8B471   |
	JSR CODE_B8D5E6				;$B8B474   |
	JSR CODE_B8D225				;$B8B477   |
	JSR update_damaged_invincibility	;$B8B47A   |
	JSL CODE_B9D0F3				;$B8B47D   |
	JSL CODE_BBC140				;$B8B481   |
	JMP CODE_B8997E				;$B8B485  /

kong_behavior_7D:
	LDA #$0023				;$B8B488  \
	JSR process_player_action		;$B8B48B   |
	LDX current_sprite			;$B8B48E   |
	LDA $2E,x				;$B8B490   |
	CMP #$007D				;$B8B492   |
	BNE CODE_B8B49A				;$B8B495   |
	JMP CODE_B8B219				;$B8B497  /

CODE_B8B49A:
	LDA #$005B				;$B8B49A  \
	STA $2E,x				;$B8B49D   |
	STZ $1C,x				;$B8B49F   |
	JMP CODE_B8996E				;$B8B4A1  /

kong_behavior_7E:
	JSL CODE_B381CA				;$B8B4A4  \
	JSR CODE_B8A186				;$B8B4A8   |
	JMP CODE_B89975				;$B8B4AB  /

kong_behavior_7F:
	LDA #$0023				;$B8B4AE  \
	JSR process_player_action		;$B8B4B1   |
	LDX current_sprite			;$B8B4B4   |
	LDA $2E,x				;$B8B4B6   |
	CMP #$007F				;$B8B4B8   |
	BNE CODE_B8B4C0				;$B8B4BB   |
	JMP CODE_B8B219				;$B8B4BD  /

CODE_B8B4C0:
	JSR start_player_falling		;$B8B4C0  \
	LDX current_sprite			;$B8B4C3   |
	LDA #$0067				;$B8B4C5   |
	STA $2E,x				;$B8B4C8   |
	STZ $1C,x				;$B8B4CA   |
	JMP CODE_B8996E				;$B8B4CC  /

CODE_B8B4CF:
	LDX $0BA0				;$B8B4CF  \
	LDA $54,x				;$B8B4D2   |
	STA $5E					;$B8B4D4   |
	LDA $90					;$B8B4D6   |
	STA $60					;$B8B4D8   |
	LDY #$0000				;$B8B4DA   |
	LDA [$5E],y				;$B8B4DD   |
	STA $32					;$B8B4DF   |
	LDY #$0002				;$B8B4E1   |
	LDA [$5E],y				;$B8B4E4   |
	STA $34					;$B8B4E6   |
	LDY #$0004				;$B8B4E8   |
	LDA [$5E],y				;$B8B4EB   |
	STA $36					;$B8B4ED   |
	LDY #$0006				;$B8B4EF   |
	LDA [$5E],y				;$B8B4F2   |
	STA $38					;$B8B4F4   |
	RTS					;$B8B4F6  /

CODE_B8B4F7:
	TXY					;$B8B4F7  \
	LDX active_kong_sprite			;$B8B4F8   |
	LDA $000A,y				;$B8B4FB   |
	CLC					;$B8B4FE   |
	ADC $36					;$B8B4FF   |
	CMP $0A,x				;$B8B501   |
	BPL CODE_B8B511				;$B8B503   |
	LDA $000A,y				;$B8B505   |
	CLC					;$B8B508   |
	ADC $38					;$B8B509   |
	CMP $0A,x				;$B8B50B   |
	BMI CODE_B8B514				;$B8B50D   |
	CLC					;$B8B50F   |
	RTS					;$B8B510  /

CODE_B8B511:
	INC A					;$B8B511  \
	SEC					;$B8B512   |
	RTS					;$B8B513  /

CODE_B8B514:
	SEC					;$B8B514  \
	RTS					;$B8B515  /

CODE_B8B516:
	LDX current_sprite			;$B8B516  \
	LDA $1E,x				;$B8B518   |
	AND #$0001				;$B8B51A   |
	BNE CODE_B8B52A				;$B8B51D   |
	LDA $0A,x				;$B8B51F   |
	CMP $0935				;$B8B521   |
	BPL CODE_B8B529				;$B8B524   |
	STA $0935				;$B8B526   |
CODE_B8B529:					;	   |
	RTS					;$B8B529  /

CODE_B8B52A:
	LDA $0A,x				;$B8B52A  \
	STA $0935				;$B8B52C   |
	RTS					;$B8B52F  /

CODE_B8B530:
	LDX current_sprite			;$B8B530  \
	LDA $40,x				;$B8B532   |
	ORA #$E000				;$B8B534   |
	STA $40,x				;$B8B537   |
	RTS					;$B8B539  /

CODE_B8B53A:
	LDX current_sprite			;$B8B53A  \
	LDA $0A,x				;$B8B53C   |
	SEC					;$B8B53E   |
	SBC $17C0				;$B8B53F   |
	CMP #$0120				;$B8B542   |
	BPL CODE_B8B586				;$B8B545   |
	LDA $1E,x				;$B8B547   |
	AND #$0080				;$B8B549   |
	BNE CODE_B8B56E				;$B8B54C   |
	LDA $10,x				;$B8B54E   |
	AND #$0100				;$B8B550   |
	BEQ CODE_B8B5A6				;$B8B553   |
	LDA $1E,x				;$B8B555   |
	AND #$1001				;$B8B557   |
	CMP #$0001				;$B8B55A   |
	BNE CODE_B8B584				;$B8B55D   |
	BIT $0D54				;$B8B55F   |
	BMI CODE_B8B56E				;$B8B562   |
	LDA $0D4A				;$B8B564   |
	BPL CODE_B8B56E				;$B8B567   |
	CMP #$9000				;$B8B569   |
	BCC CODE_B8B5A6				;$B8B56C   |
CODE_B8B56E:					;	   |
	LDA $30,x				;$B8B56E   |
	AND #$0080				;$B8B570   |
	BNE CODE_B8B5A6				;$B8B573   |
	LDY #$0036				;$B8B575   |
	JSL CODE_BB842C				;$B8B578   |
	LDA #$0023				;$B8B57C   |
	JSL CODE_B8D8BA				;$B8B57F   |
	RTS					;$B8B583  /

CODE_B8B584:
	BRA CODE_B8B5A6				;$B8B584  /

CODE_B8B586:
	CPX inactive_kong_sprite		;$B8B586  \
	BEQ CODE_B8B5B7				;$B8B589   |
	LDA $2E,x				;$B8B58B   |
	CMP #$0012				;$B8B58D   |
	BNE CODE_B8B597				;$B8B590   |
	LDA $48,x				;$B8B592   |
	LSR A					;$B8B594   |
	BCS CODE_B8B5A6				;$B8B595   |
CODE_B8B597:					;	   |
	LDA $0515				;$B8B597   |
	CMP #$0001				;$B8B59A   |
	BEQ CODE_B8B5A7				;$B8B59D   |
	LDA #$0029				;$B8B59F   |
	JSL CODE_B8D8BA				;$B8B5A2   |
CODE_B8B5A6:					;	   |
	RTS					;$B8B5A6  /

CODE_B8B5A7:
	LDA #$0028				;$B8B5A7  \
	JSL CODE_B8D8BA				;$B8B5AA   |
	LDX current_sprite			;$B8B5AE   |
	LDA #$0003				;$B8B5B0   |
	STA $0A36				;$B8B5B3   |
	RTS					;$B8B5B6  /

CODE_B8B5B7:
	LDA #$0013				;$B8B5B7  \
	STA $2E,x				;$B8B5BA   |
	STZ $1A,x				;$B8B5BC   |
	STZ $16,x				;$B8B5BE   |
	STZ $3A,x				;$B8B5C0   |
	RTS					;$B8B5C2  /

CODE_B8B5C3:
	JSR CODE_B8B644				;$B8B5C3  \
	BCS CODE_B8B5E3				;$B8B5C6   |
	LDA $052B				;$B8B5C8   |\
	AND #$0800				;$B8B5CB   | | check if sticky honey is enabled
	BEQ CODE_B8B5DA				;$B8B5CE   |/
	JSR CODE_B8B671				;$B8B5D0   |
	BCS CODE_B8B609				;$B8B5D3   |
	JSR CODE_B8B65A				;$B8B5D5   |
	BCS CODE_B8B60F				;$B8B5D8   |
CODE_B8B5DA:					;	   |
	JSR check_sprite_underwater		;$B8B5DA   |
	CMP #$0002				;$B8B5DD   |
	BEQ CODE_B8B5F2				;$B8B5E0   |
	RTS					;$B8B5E2  /

CODE_B8B5E3:
	LDA #$000A				;$B8B5E3  \
	JSR set_player_interaction		;$B8B5E6   |
	BCS CODE_B8B5F1				;$B8B5E9   |
	LDA $0BA2				;$B8B5EB   |
	STA $0A86				;$B8B5EE   |
CODE_B8B5F1:					;	   |
	RTS					;$B8B5F1  /

CODE_B8B5F2:
	JSR CODE_B8B615				;$B8B5F2  \
	BCS CODE_B8B5F1				;$B8B5F5   |
	LDA $6E					;$B8B5F7   |
	BEQ CODE_B8B600				;$B8B5F9   |
	CMP #$01A0				;$B8B5FB   |
	BNE CODE_B8B5F1				;$B8B5FE   |
CODE_B8B600:					;	   |
	JSR CODE_B881BB				;$B8B600   |
	JSR CODE_B88EBC				;$B8B603   |
	JMP CODE_B8B6E0				;$B8B606  /

CODE_B8B609:
	LDA #$0008				;$B8B609  \
	JMP set_player_interaction		;$B8B60C  /

CODE_B8B60F:
	LDA #$0007				;$B8B60F  \
	JMP set_player_interaction		;$B8B612  /

CODE_B8B615:
	LDA $052B				;$B8B615  \
	AND #$0020				;$B8B618   |
	BEQ CODE_B8B62B				;$B8B61B   |
	LDX current_sprite			;$B8B61D   |
	LDA $30,x				;$B8B61F   |
	AND #$0080				;$B8B621   |
	BNE CODE_B8B62B				;$B8B624   |
	LDA $0915				;$B8B626   |
	BEQ CODE_B8B62D				;$B8B629   |
CODE_B8B62B:					;	   |
	CLC					;$B8B62B   |
	RTS					;$B8B62C  /

CODE_B8B62D:
	LDY #$0036				;$B8B62D  \
	JSL CODE_BB842C				;$B8B630   |
	LDA #$0023				;$B8B634   |
	JSL CODE_B8D8BA				;$B8B637   |
	LDA #$066D				;$B8B63B   |
	JSL queue_sound_effect			;$B8B63E   |
	SEC					;$B8B642   |
	RTS					;$B8B643  /

CODE_B8B644:
	LDA $0BA2				;$B8B644  \
	BNE CODE_B8B64E				;$B8B647   |
	STZ $0BA0				;$B8B649   |
CODE_B8B64C:					;	   |
	CLC					;$B8B64C   |
	RTS					;$B8B64D  /

CODE_B8B64E:
	EOR $0BA0				;$B8B64E  \
	BNE CODE_B8B658				;$B8B651   |
	STZ $0BA2				;$B8B653   |
	BRA CODE_B8B64C				;$B8B656  /

CODE_B8B658:
	SEC					;$B8B658  \
	RTS					;$B8B659  /

CODE_B8B65A:
	LDX current_sprite			;$B8B65A  \
	LDA $1E,x				;$B8B65C   |
	AND #$0101				;$B8B65E   |
	CMP #$0101				;$B8B661   |
	BEQ CODE_B8B668				;$B8B664   |
CODE_B8B666:					;	   |
	CLC					;$B8B666   |
	RTS					;$B8B667  /

CODE_B8B668:
	LDA $10,x				;$B8B668  \
	AND #$0200				;$B8B66A   |
	BEQ CODE_B8B666				;$B8B66D   |
	SEC					;$B8B66F   |
	RTS					;$B8B670  /

CODE_B8B671:
	LDX current_sprite			;$B8B671  \
	LDA $1E,x				;$B8B673   |
	AND #$0002				;$B8B675   |
	BEQ CODE_B8B6A1				;$B8B678   |
	LDA $12,x				;$B8B67A   |
	AND #$4000				;$B8B67C   |
	BEQ CODE_B8B686				;$B8B67F   |
	LDA #$FFFF				;$B8B681   |
	BRA CODE_B8B689				;$B8B684  /

CODE_B8B686:
	LDA #$0001				;$B8B686  \
CODE_B8B689:					;	   |
	CLC					;$B8B689   |
	ADC $06,x				;$B8B68A   |
	JSL CODE_B5C3D5				;$B8B68C   |
	JSR CODE_B8D484				;$B8B690   |
	SEC					;$B8B693   |
	SBC $0A,x				;$B8B694   |
	BPL CODE_B8B6A1				;$B8B696   |
	LDA $AC					;$B8B698   |
	AND #$0200				;$B8B69A   |
	BEQ CODE_B8B6A1				;$B8B69D   |
	SEC					;$B8B69F   |
	RTS					;$B8B6A0  /

CODE_B8B6A1:
	CLC					;$B8B6A1  \
	RTS					;$B8B6A2  /

CODE_B8B6A3:
	JSR check_sprite_underwater		;$B8B6A3  \
	RTL					;$B8B6A6  /

check_sprite_underwater:
	LDX current_sprite			;$B8B6A7  \
	LDA $0D4E				;$B8B6A9   \\
	BMI .no_water				;$B8B6AC   |/ check if level has water
	SEC					;$B8B6AE   |\
	SBC $0A,x				;$B8B6AF   | | check if sprite is underwater
	CMP #$FFEC				;$B8B6B1   | |
	BMI .in_water				;$B8B6B4   |/
	CMP #$FFF8				;$B8B6B6   |
	BPL .not_in_water			;$B8B6B9   |
.no_water					;	   |
	LDA #$0000				;$B8B6BB   |
	RTS					;$B8B6BE  /

.not_in_water
	LDA #$0001				;$B8B6BF  \
	RTS					;$B8B6C2  /

.in_water
	LDA #$0002				;$B8B6C3  \
	RTS					;$B8B6C6  /

CODE_B8B6C7:
	LDY #$0076				;$B8B6C7  \
	LDA [$8E],y				;$B8B6CA   |
	LDY $66					;$B8B6CC   |
	STA $0008,y				;$B8B6CE   |
	LDY #$0078				;$B8B6D1   |
	LDA [$8E],y				;$B8B6D4   |
	LDY $66					;$B8B6D6   |
	STA $000A,y				;$B8B6D8   |
	RTS					;$B8B6DB  /

CODE_B8B6DC:
	JSR CODE_B8B6E0				;$B8B6DC  \
	RTL					;$B8B6DF  /

CODE_B8B6E0:
	JSR CODE_B8B6C7				;$B8B6E0  \
	LDX current_sprite			;$B8B6E3   |
	LDA $6E					;$B8B6E5   |
	CMP #$01A0				;$B8B6E7   |
	BEQ CODE_B8B6F9				;$B8B6EA   |
	LDA #$003D				;$B8B6EC   |
	STA $2E,x				;$B8B6EF   |
	LDA #$0043				;$B8B6F1   |
	JSL CODE_B9D0B8				;$B8B6F4   |
	RTS					;$B8B6F8  /

CODE_B8B6F9:
	LDA $24,x				;$B8B6F9  \
	CMP #$8000				;$B8B6FB   |
	ROR A					;$B8B6FE   |
	CMP #$8000				;$B8B6FF   |
	ROR A					;$B8B702   |
	STA $24,x				;$B8B703   |
	STZ $2A,x				;$B8B705   |
	LDA #$0050				;$B8B707   |
	STA $2E,x				;$B8B70A   |
	LDA #$005E				;$B8B70C   |
	JSL CODE_B9D08C				;$B8B70F   |
	RTS					;$B8B713  /

CODE_B8B714:
	LDA $052B				;$B8B714  \
	AND #$00C0				;$B8B717   |
	BEQ CODE_B8B729				;$B8B71A   |
	JSR CODE_B8B793				;$B8B71C   |
	BCS CODE_B8B729				;$B8B71F   |
	LDA $09A1				;$B8B721   |
	BEQ CODE_B8B72A				;$B8B724   |
	DEC $09A1				;$B8B726   |
CODE_B8B729:					;	   |
	RTS					;$B8B729  /

CODE_B8B72A:
	LDX current_sprite			;$B8B72A  \
	LDA $10,x				;$B8B72C   |
	STA $76					;$B8B72E   |
	JSR CODE_B8D3E2				;$B8B730   |
	BCC CODE_B8B750				;$B8B733   |
	BNE CODE_B8B77B				;$B8B735   |
	LDA #$0012				;$B8B737   |
	JSL CODE_B8D8BA				;$B8B73A   |
	BCS CODE_B8B729				;$B8B73E   |
	STZ $0A86				;$B8B740   |
	LDA $AE					;$B8B743   |
	STA $0A88				;$B8B745   |
	RTS					;$B8B748  /

CODE_B8B749:
	LDX current_sprite			;$B8B749  \
	LDA $76					;$B8B74B   |
	STA $10,x				;$B8B74D   |
	RTS					;$B8B74F  /

CODE_B8B750:
	BEQ CODE_B8B749				;$B8B750  \
	LDA $24,x				;$B8B752   |
	BPL CODE_B8B749				;$B8B754   |
	JSR CODE_B8B7A0				;$B8B756   |
	LDX current_sprite			;$B8B759   |
	LDA $0A,x				;$B8B75B   |
	SEC					;$B8B75D   |
	SBC $5E					;$B8B75E   |
	BMI CODE_B8B729				;$B8B760   |
	CMP #$0014				;$B8B762   |
	BPL CODE_B8B729				;$B8B765   |
	LDA #$0012				;$B8B767   |
	JSL CODE_B8D8BA				;$B8B76A   |
	BCS CODE_B8B729				;$B8B76E   |
	LDA $5E					;$B8B770   |
	STA $0A86				;$B8B772   |
	LDA $52					;$B8B775   |
	STA $0A88				;$B8B777   |
	RTS					;$B8B77A  /

CODE_B8B77B:
	LDX current_sprite			;$B8B77B  \
	LDA $2E,x				;$B8B77D   |
	CMP #$006E				;$B8B77F   |
	BEQ CODE_B8B792				;$B8B782   |
	LDA #$0011				;$B8B784   |
	JSL CODE_B8D8BA				;$B8B787   |
	BCS CODE_B8B792				;$B8B78B   |
	LDA $5E					;$B8B78D   |
	STA $0A86				;$B8B78F   |
CODE_B8B792:					;	   |
	RTS					;$B8B792  /

CODE_B8B793:
	LDA $6E					;$B8B793  \
	BNE CODE_B8B79E				;$B8B795   |
	LDA $0D7A				;$B8B797   |
	BNE CODE_B8B79E				;$B8B79A   |
	CLC					;$B8B79C   |
	RTS					;$B8B79D  /

CODE_B8B79E:
	SEC					;$B8B79E  \
	RTS					;$B8B79F  /

CODE_B8B7A0:
	STZ $52					;$B8B7A0  \
	LDA #$0028				;$B8B7A2   |
	STA $60					;$B8B7A5   |
	LDX current_sprite			;$B8B7A7   |
	LDA $0A,x				;$B8B7A9   |
	SEC					;$B8B7AB   |
	SBC #$0028				;$B8B7AC   |
	STA $5E					;$B8B7AF   |
CODE_B8B7B1:					;	   |
	INC $5E					;$B8B7B1   |
	LDA $5E					;$B8B7B3   |
	JSL CODE_B5C3E3				;$B8B7B5   |
	LDA $AE					;$B8B7B9   |
	AND #$1000				;$B8B7BB   |
	BEQ CODE_B8B7C8				;$B8B7BE   |
	LDA $AE					;$B8B7C0   |
	STA $52					;$B8B7C2   |
	DEC $60					;$B8B7C4   |
	BNE CODE_B8B7B1				;$B8B7C6   |
CODE_B8B7C8:					;	   |
	RTS					;$B8B7C8  /

CODE_B8B7C9:
	LDX current_sprite			;$B8B7C9  \
	LDA $0D66				;$B8B7CB   |
	SEC					;$B8B7CE   |
	SBC $06,x				;$B8B7CF   |
	STA $32					;$B8B7D1   |
	BEQ CODE_B8B7ED				;$B8B7D3   |
	BPL CODE_B8B7E7				;$B8B7D5   |
	EOR #$FFFF				;$B8B7D7   |
	INC A					;$B8B7DA   |
	STA $34					;$B8B7DB   |
	ASL A					;$B8B7DD   |
	ASL A					;$B8B7DE   |
	ASL A					;$B8B7DF   |
	ASL A					;$B8B7E0   |
	EOR #$FFFF				;$B8B7E1   |
	INC A					;$B8B7E4   |
	BRA CODE_B8B7ED				;$B8B7E5  /

CODE_B8B7E7:
	STA $34					;$B8B7E7  \
	ASL A					;$B8B7E9   |
	ASL A					;$B8B7EA   |
	ASL A					;$B8B7EB   |
	ASL A					;$B8B7EC   |
CODE_B8B7ED:					;	   |
	STA $20,x				;$B8B7ED   |
	RTS					;$B8B7EF  /

CODE_B8B7F0:
	JSR CODE_B8B7F4				;$B8B7F0  \
	RTL					;$B8B7F3  /

CODE_B8B7F4:
	LDA $0D7A				;$B8B7F4  \
	BEQ CODE_B8B830				;$B8B7F7   |
	LDY inactive_kong_sprite		;$B8B7F9   |
	LDX active_kong_sprite			;$B8B7FC   |
	LDA $0D7C				;$B8B7FF   |
	BIT $12,x				;$B8B802   |
	BVC CODE_B8B80A				;$B8B804   |
	EOR #$FFFF				;$B8B806   |
	INC A					;$B8B809   |
CODE_B8B80A:					;	   |
	CLC					;$B8B80A   |
	ADC $06,x				;$B8B80B   |
	STA $0006,y				;$B8B80D   |
	LDA $0A,x				;$B8B810   |
	CLC					;$B8B812   |
	ADC $0D7E				;$B8B813   |
	STA $000A,y				;$B8B816   |
	LDA $02,x				;$B8B819   |
	CLC					;$B8B81B   |
	ADC $0D80				;$B8B81C   |
	STA $0002,y				;$B8B81F   |
	LDA $12,x				;$B8B822   |
	EOR $0012,y				;$B8B824   |
	AND #$4000				;$B8B827   |
	EOR $0012,y				;$B8B82A   |
	STA $0012,y				;$B8B82D   |
CODE_B8B830:					;	   |
	RTS					;$B8B830  /

CODE_B8B831:
	LDX current_sprite			;$B8B831  \
CODE_B8B833:					;	   |
	LDA #$0013				;$B8B833   |
	STA $2E,x				;$B8B836   |
	STZ $1A,x				;$B8B838   |
	STZ $16,x				;$B8B83A   |
	STZ $30,x				;$B8B83C   |
	RTS					;$B8B83E  /

CODE_B8B83F:
	JSR CODE_B8B833				;$B8B83F  \
	RTL					;$B8B842  /

CODE_B8B843:
	LDX current_sprite			;$B8B843  \
	LDY $66					;$B8B845   |
	LDA $0D66				;$B8B847   |
	SEC					;$B8B84A   |
	SBC $06,x				;$B8B84B   |
	JSR CODE_B8B863				;$B8B84D   |
	STA $20,x				;$B8B850   |
	LDA $0D6A				;$B8B852   |
	SEC					;$B8B855   |
	SBC $0A,x				;$B8B856   |
	JSR CODE_B8B863				;$B8B858   |
	STA $24,x				;$B8B85B   |
	RTS					;$B8B85D  /

CODE_B8B85E:
	LDA #$4000				;$B8B85E  \
	BRA CODE_B8B881				;$B8B861  /

CODE_B8B863:
	BEQ CODE_B8B8AA				;$B8B863  \
	BPL CODE_B8B893				;$B8B865   |
	EOR #$FFFF				;$B8B867   |
	INC A					;$B8B86A   |
	CMP #$0080				;$B8B86B   |
	BPL CODE_B8B85E				;$B8B86E   |
	CMP #$0004				;$B8B870   |
	BMI CODE_B8B886				;$B8B873   |
	ASL A					;$B8B875   |
	ASL A					;$B8B876   |
	ASL A					;$B8B877   |
	ASL A					;$B8B878   |
	CMP #$0300				;$B8B879   |
	BPL CODE_B8B881				;$B8B87C   |
	LDA #$0300				;$B8B87E   |
CODE_B8B881:					;	   |
	EOR #$FFFF				;$B8B881   |
	INC A					;$B8B884   |
	RTS					;$B8B885  /

CODE_B8B886:
	XBA					;$B8B886  \
	EOR #$FFFF				;$B8B887   |
	INC A					;$B8B88A   |
	RTS					;$B8B88B  /

CODE_B8B88C:
	XBA					;$B8B88C  \
	RTS					;$B8B88D  /

CODE_B8B88E:
	LDA #$4000				;$B8B88E  \
	BRA CODE_B8B8A9				;$B8B891  /

CODE_B8B893:
	CMP #$0080				;$B8B893  \
	BPL CODE_B8B88E				;$B8B896   |
	CMP #$0004				;$B8B898   |
	BMI CODE_B8B88C				;$B8B89B   |
	ASL A					;$B8B89D   |
	ASL A					;$B8B89E   |
	ASL A					;$B8B89F   |
	ASL A					;$B8B8A0   |
	CMP #$0300				;$B8B8A1   |
	BPL CODE_B8B8A9				;$B8B8A4   |
	LDA #$0300				;$B8B8A6   |
CODE_B8B8A9:					;	   |
	RTS					;$B8B8A9  /

CODE_B8B8AA:
	RTS					;$B8B8AA  /

CODE_B8B8AB:
	LDX current_sprite			;$B8B8AB  \
	LDA $10,x				;$B8B8AD   |
	AND #$0007				;$B8B8AF   |
	CMP #$0006				;$B8B8B2   |
	BEQ .CODE_B8B8CF			;$B8B8B5   |
	LDA $0C,x				;$B8B8B7   |
	BMI .CODE_B8B8C4			;$B8B8B9   |
	SEC					;$B8B8BB   |
	SBC $0A,x				;$B8B8BC   |
	CMP #$0004				;$B8B8BE   |
	BPL .CODE_B8B8C4			;$B8B8C1   |
	RTS					;$B8B8C3  /

.CODE_B8B8C4
	LDA $1E,x				;$B8B8C4  \
	AND #$0101				;$B8B8C6   |
	CMP #$0100				;$B8B8C9   |
	BEQ .CODE_B8B8CF			;$B8B8CC   |
	RTS					;$B8B8CE  /

.CODE_B8B8CF
	LDY #$0032				;$B8B8CF  \
	LDA [$8E],y				;$B8B8D2   |
	LDY $66					;$B8B8D4   |
	STA $0024,y				;$B8B8D6   |
	RTS					;$B8B8D9  /

CODE_B8B8DA:
	LDX current_sprite			;$B8B8DA  \
	LDA $40,x				;$B8B8DC   |
	AND #$0001				;$B8B8DE   |
	BEQ .CODE_B8B8E4			;$B8B8E1   |
	RTS					;$B8B8E3  /

.CODE_B8B8E4
	LDA $0C,x				;$B8B8E4  \
	BMI start_player_faster_falling		;$B8B8E6   |
	SEC					;$B8B8E8   |
	SBC $0A,x				;$B8B8E9   |
	CMP #$0004				;$B8B8EB   |
	BPL start_player_faster_falling		;$B8B8EE   |
	LDA $1E,x				;$B8B8F0   |
	AND #$0011				;$B8B8F2   |
	CMP #$0001				;$B8B8F5   |
	BEQ .CODE_B8B8FB			;$B8B8F8   |
	RTS					;$B8B8FA  /

.CODE_B8B8FB
	LDA $10,x				;$B8B8FB  \
	AND #$0007				;$B8B8FD   |
	CMP $88					;$B8B900   |
	BEQ .CODE_B8B905			;$B8B902   |
	RTS					;$B8B904  /

.CODE_B8B905
	LDA $10,x				;$B8B905  \
	EOR #$FFFF				;$B8B907   |
	LSR A					;$B8B90A   |
	EOR $12,x				;$B8B90B   |
	AND #$4000				;$B8B90D   |
	EOR $12,x				;$B8B910   |
	STA $12,x				;$B8B912   |
	LDA #$0800				;$B8B914   |
	STA $24,x				;$B8B917   |
	LDA $0D7A				;$B8B919   |
	BNE .CODE_B8B93C			;$B8B91C   |
	LDA $6E					;$B8B91E   |
	BNE .CODE_B8B92F			;$B8B920   |
	LDA #$0014				;$B8B922   |
	STA $2E,x				;$B8B925   |
	LDA #$001A				;$B8B927   |
	JSL CODE_B9D0B8				;$B8B92A   |
	RTS					;$B8B92E  /

.CODE_B8B92F
	LDA #$000A				;$B8B92F  \
	STA $2E,x				;$B8B932   |
	LDA #$0077				;$B8B934   |
	JSL CODE_B9D08C				;$B8B937   |
	RTS					;$B8B93B  /

.CODE_B8B93C
	CMP inactive_kong_sprite		;$B8B93C  \
	BEQ .is_follower_kong			;$B8B93F   |
	LDA #$000D				;$B8B941   |
	STA $2E,x				;$B8B944   |
	LDA #$0017				;$B8B946   |
	JSL CODE_B9D0B8				;$B8B949   |
	RTS					;$B8B94D  /

.is_follower_kong
	LDA #$001A				;$B8B94E  \
	STA $2E,x				;$B8B951   |
	LDA #$0023				;$B8B953   |
	JSL CODE_B9D0B8				;$B8B956   |
	RTS					;$B8B95A  /

start_player_faster_falling:
	LDA #$0100				;$B8B95B  \
	STA $24,x				;$B8B95E   |
start_player_falling:				;	   |
	LDA $0D7A				;$B8B960   |
	BNE .holding_sprite			;$B8B963   |
	LDA $6E					;$B8B965   |
	BNE .has_animal				;$B8B967   |
	LDA #$0001				;$B8B969   |
	STA $2E,x				;$B8B96C   |
	LDA #$0007				;$B8B96E   |
	JSL CODE_B9D0B8				;$B8B971   |
	RTS					;$B8B975  /

.has_animal
	CMP #$0198				;$B8B976  \
	BEQ .squawks				;$B8B979   |
	LDA #$000A				;$B8B97B   |
	STA $2E,x				;$B8B97E   |
	LDA #$0077				;$B8B980   |
	JSL CODE_B9D08C				;$B8B983   |
	RTS					;$B8B987  /

.squawks
	LDA #$0010				;$B8B988  \
	STA $2E,x				;$B8B98B   |
	LDA #$0077				;$B8B98D   |
	JSL CODE_B9D08C				;$B8B990   |
	RTS					;$B8B994  /

.holding_sprite
	CMP inactive_kong_sprite		;$B8B995  \
	BEQ .holding_kong			;$B8B998   |
	LDA #$000D				;$B8B99A   |
	STA $2E,x				;$B8B99D   |
	LDA #$0017				;$B8B99F   |
	JSL CODE_B9D0B8				;$B8B9A2   |
	RTS					;$B8B9A6  /

.holding_kong
	LDA #$001A				;$B8B9A7  \
	STA $2E,x				;$B8B9AA   |
	LDA #$0023				;$B8B9AC   |
	JSL CODE_B9D0B8				;$B8B9AF   |
	RTS					;$B8B9B3  /

CODE_B8B9B4:
	JSR start_player_faster_falling		;$B8B9B4  \
	RTL					;$B8B9B7  /

CODE_B8B9B8:
	JSR start_player_falling		;$B8B9B8  \
	RTL					;$B8B9BB  /

	JSL CODE_B5C3E1				;$B8B9BC   |
	RTL					;$B8B9C0  /

	LDX current_sprite			;$B8B9C1   |
	RTS					;$B8B9C3  /

	LDX current_sprite			;$B8B9C4   |
	RTS					;$B8B9C6  /

process_player_action:
	STA $92					;$B8B9C7  \ set player action
	LDA #$0001				;$B8B9C9   |
	TRB $08C4				;$B8B9CC   |
	LDA screen_fade_speed			;$B8B9CF   |\
	AND #$00FF				;$B8B9D2   | | if screen transition is happening
	BNE .dont_process			;$B8B9D5   |/ dont process player actions
	LDX current_sprite			;$B8B9D7   |\
	CPX active_kong_sprite			;$B8B9D9   | | if current sprite is active kong
	BEQ .active_kong			;$B8B9DC   |/ continue to process player actions
.dont_process					;	   |\
	CLC					;$B8B9DE   | | dont process actions and return
	RTS					;$B8B9DF  / /

.active_kong
	LDY #$0000				;$B8B9E0  \
	LDA player_active_pressed		;$B8B9E3   |\
	STA $0983				;$B8B9E6   | | copy current players inputs into action inputs
	LDA player_active_held			;$B8B9E9   | |
	STA $0981				;$B8B9EC   |/
	LDY $66					;$B8B9EF   |\
	LDA $0981				;$B8B9F1   | | copy action inputs to kong control variables
	STA $0004,y				;$B8B9F4   | |
	LDA $0983				;$B8B9F7   | |
	STA $0002,y				;$B8B9FA   |/
	JSR CODE_B8BAA8				;$B8B9FD   |
	LDA $0981				;$B8BA00   |
	AND #$0200				;$B8BA03   |
	BEQ .no_left_press			;$B8BA06   |
	JSR handle_left_actions			;$B8BA08   |
	BRA .left_or_right_press		;$B8BA0B  /

.no_left_press
	LDA $0981				;$B8BA0D  \
	AND #$0100				;$B8BA10   |
	BEQ .no_right_press			;$B8BA13   |
	JSR handle_right_actions		;$B8BA15   |
	BRA .left_or_right_press		;$B8BA18  /

.no_right_press
	JSR handle_no_left_right_actions	;$B8BA1A  \
.left_or_right_press				;	   |
	LDA $0981				;$B8BA1D   |
	AND #$0800				;$B8BA20   |
	BEQ .no_up_press			;$B8BA23   |
	JSR handle_up_actions			;$B8BA25   |
	BRA .up_or_down_press			;$B8BA28  /

.no_up_press
	LDA $0981				;$B8BA2A  \
	AND #$0400				;$B8BA2D   |
	BEQ .no_down_press			;$B8BA30   |
	JSR handle_down_actions			;$B8BA32   |
	BRA .up_or_down_press			;$B8BA35  /

.no_down_press
	JSR handle_no_up_down_actions		;$B8BA37  \
.up_or_down_press				;	   |
	LDA $0981				;$B8BA3A   |
	AND #$8000				;$B8BA3D   |
	BEQ .no_b_press				;$B8BA40   |
	JSR handle_b_actions			;$B8BA42   |
	BRA .b_check_done			;$B8BA45  /

.no_b_press
	JSR handle_no_b_actions			;$B8BA47  \
.b_check_done					;	   |
	LDA $0981				;$B8BA4A   |
	AND #$4000				;$B8BA4D   |
	BEQ .no_y_press				;$B8BA50   |
	JSR handle_y_actions			;$B8BA52   |
	BRA .y_check_done			;$B8BA55  /

.no_y_press
	JSR handle_no_y_actions			;$B8BA57  \
.y_check_done					;	   |
	LDA $0981				;$B8BA5A   |
	AND #$0080				;$B8BA5D   |
	BEQ .no_a_press				;$B8BA60   |
	JSR handle_a_actions			;$B8BA62   |
.no_a_press					;	   |
	LDA $0981				;$B8BA65   |
	AND #$0040				;$B8BA68   |
	BEQ .no_x_press				;$B8BA6B   |
	JSR handle_x_actions			;$B8BA6D   |
.no_x_press					;	   |
	LDA $0981				;$B8BA70   |
	AND #$0020				;$B8BA73   |
	BEQ .no_l_press				;$B8BA76   |
	JSR handle_l_actions			;$B8BA78   |
.no_l_press					;	   |
	LDA $0981				;$B8BA7B   |
	AND #$0010				;$B8BA7E   |
	BEQ .no_r_press				;$B8BA81   |
	JSR handle_r_actions			;$B8BA83   |
.no_r_press					;	   |
	LDA $0981				;$B8BA86   |
	AND #$2000				;$B8BA89   |
	BEQ .no_select_press			;$B8BA8C   |
	JSR handle_select_actions		;$B8BA8E   |
.no_select_press				;	   |
	LDA $0981				;$B8BA91   |
	AND #$1000				;$B8BA94   |
	BEQ .no_start_press			;$B8BA97   |
	JSR handle_start_actions		;$B8BA99   |
.no_start_press					;	   |
	LDA $08C4				;$B8BA9C   |
	AND #$0001				;$B8BA9F   |
	BNE CODE_B8BAA6				;$B8BAA2   |
	CLC					;$B8BAA4   |
	RTS					;$B8BAA5  /

CODE_B8BAA6:
	SEC					;$B8BAA6  \
	RTS					;$B8BAA7  /

CODE_B8BAA8:
	LDX $66					;$B8BAA8  \
	LDA $18,x				;$B8BAAA   |
	EOR $04,x				;$B8BAAC   |
	AND #$4000				;$B8BAAE   |
	BNE CODE_B8BAB4				;$B8BAB1   |
	RTS					;$B8BAB3  /

CODE_B8BAB4:
	LDA $04,x				;$B8BAB4  \
	STA $18,x				;$B8BAB6   |
	AND #$4000				;$B8BAB8   |
	BEQ CODE_B8BAC6				;$B8BABB   |
	LDA $1A,x				;$B8BABD   |
	STA $1C,x				;$B8BABF   |
	LDA global_frame_counter		;$B8BAC1   |
	STA $1A,x				;$B8BAC3   |
	RTS					;$B8BAC5  /

CODE_B8BAC6:
	LDA $1E,x				;$B8BAC6  \
	STA $20,x				;$B8BAC8   |
	LDA global_frame_counter		;$B8BACA   |
	STA $1E,x				;$B8BACC   |
	RTS					;$B8BACE  /

handle_up_actions:
	LDA $92					;$B8BACF  \ load current player action
	ASL A					;$B8BAD1   |
	TAX					;$B8BAD2   |
	JMP (up_action_table,x)			;$B8BAD3  /

handle_down_actions:
	LDA $92					;$B8BAD6  \ load current player action
	ASL A					;$B8BAD8   |
	TAX					;$B8BAD9   |
	JMP (down_action_table,x)		;$B8BADA  /

handle_left_actions:
	LDA $92					;$B8BADD  \ load current player action
	ASL A					;$B8BADF   |
	TAX					;$B8BAE0   |
	JMP (left_action_table,x)		;$B8BAE1  /

handle_right_actions:
	LDA $92					;$B8BAE4  \ load current player action
	ASL A					;$B8BAE6   |
	TAX					;$B8BAE7   |
	JMP (right_action_table,x)		;$B8BAE8  /

handle_a_actions:
	LDA $92					;$B8BAEB  \ load current player action
	ASL A					;$B8BAED   |
	TAX					;$B8BAEE   |
	JMP (a_action_table,x)			;$B8BAEF  /

handle_b_actions:
	LDA $92					;$B8BAF2  \ load current player action
	ASL A					;$B8BAF4   |
	TAX					;$B8BAF5   |
	JMP (b_action_table,x)			;$B8BAF6  /

handle_x_actions:
	LDA $92					;$B8BAF9  \ load current player action
	ASL A					;$B8BAFB   |
	TAX					;$B8BAFC   |
	JMP (x_action_table,x)			;$B8BAFD  /

handle_y_actions:
	LDA $92					;$B8BB00  \ load current player action
	ASL A					;$B8BB02   |
	TAX					;$B8BB03   |
	JMP (y_action_table,x)			;$B8BB04  /

handle_l_actions:
	LDA $92					;$B8BB07  \ load current player action
	ASL A					;$B8BB09   |
	TAX					;$B8BB0A   |
	JMP (l_action_table,x)			;$B8BB0B  /

handle_r_actions:
	LDA $92					;$B8BB0E  \ load current player action
	ASL A					;$B8BB10   |
	TAX					;$B8BB11   |
	JMP (r_action_table,x)			;$B8BB12  /

handle_start_actions:
	LDA $92					;$B8BB15  \ load current player action
	ASL A					;$B8BB17   |
	TAX					;$B8BB18   |
	JMP (start_action_table,x)		;$B8BB19  /

handle_select_actions:
	LDA $92					;$B8BB1C  \ load current player action
	ASL A					;$B8BB1E   |
	TAX					;$B8BB1F   |
	JMP (select_action_table,x)		;$B8BB20  /

handle_no_left_right_actions:
	LDA $92					;$B8BB23  \ load current player action
	ASL A					;$B8BB25   |
	TAX					;$B8BB26   |
	JMP (no_left_right_action_table,x)	;$B8BB27  /

handle_no_up_down_actions:
	LDA $92					;$B8BB2A  \ load current player action
	ASL A					;$B8BB2C   |
	TAX					;$B8BB2D   |
	JMP (no_up_down_action_table,x)		;$B8BB2E  /

handle_no_b_actions:
	LDA $92					;$B8BB31  \ load current player action
	ASL A					;$B8BB33   |
	TAX					;$B8BB34   |
	JMP (no_b_action_table,x)		;$B8BB35  /

handle_no_y_actions:
	LDA $92					;$B8BB38  \ load current player action
	ASL A					;$B8BB3A   |
	TAX					;$B8BB3B   |
	JMP (no_y_action_table,x)		;$B8BB3C  /

up_action_table:
	dw return_sprite_up_action		;00
	dw return_sprite_up_action		;01
	dw return_sprite_up_action		;02
	dw return_sprite_up_action		;03
	dw no_action				;04
	dw no_action				;05
	dw debug_fly_up_action			;06
	dw return_sprite_up_action		;07
	dw return_sprite_up_action		;08
	dw no_up_action				;09
	dw no_up_action				;0A
	dw squawks_hold_up_action		;0B
	dw no_action				;0C
	dw no_action				;0D
	dw move_barrel_cannon_up_action		;0E
	dw return_sprite_up_action		;0F
	dw return_sprite_up_action		;10
	dw return_sprite_up_action		;11
	dw no_up_action				;12
	dw climb_up_single_rope_action		;13
	dw climb_up_double_rope_action		;14
	dw horizontal_rope_up_action		;15
	dw no_action				;16
	dw no_action				;17
	dw no_action				;18
	dw no_action				;19
	dw quawks_slow_descent_action		;1A
	dw no_action				;1B
	dw unknown_up_1C_action			;1C
	dw no_action				;1D
	dw move_enguarde_up_action		;1E
	dw no_action				;1F
	dw no_action				;20
	dw wind_float_up_fast_action		;21
	dw no_action				;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

down_action_table:
	dw crouch_action			;00
	dw no_action				;01
	dw no_action				;02
	dw no_action				;03
	dw no_action				;04
	dw crouch_check_for_rope_below_action	;05
	dw debug_fly_down_action		;06
	dw no_action				;07
	dw no_action				;08
	dw no_action				;09
	dw no_action				;0A
	dw squawks_holding_down_action		;0B
	dw no_action				;0C
	dw no_action				;0D
	dw move_barrel_cannon_down_action	;0E
	dw no_action				;0F
	dw no_action				;10
	dw no_action				;11
	dw no_action				;12
	dw climb_down_single_rope_action	;13
	dw climb_down_double_rope_action	;14
	dw horizontal_rope_down_action		;15
	dw no_action				;16
	dw swim_sink_fast_action		;17
	dw no_action				;18
	dw no_action				;19
	dw quawks_fast_descent_action		;1A
	dw no_action				;1B
	dw unknown_down_1C_action		;1C
	dw no_action				;1D
	dw move_enguarde_down_action		;1E
	dw no_action				;1F
	dw no_action				;20
	dw wind_float_up_slow_action		;21
	dw no_action				;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

left_action_table:
	dw walk_left_action			;00
	dw walk_left_action			;01
	dw CODE_B8C220				;02
	dw roll_left_action			;03
	dw no_action				;04
	dw no_action				;05
	dw debug_fly_left_action		;06
	dw walk_left_action			;07
	dw walk_left_action			;08
	dw walk_left_action			;09
	dw walk_left_action			;0A
	dw walk_left_action			;0B
	dw no_action				;0C
	dw shot_from_cannon_move_left_action	;0D
	dw move_barrel_cannon_left_action	;0E
	dw walk_left_action			;0F
	dw walk_left_action			;10
	dw walk_left_action			;11
	dw walk_left_action			;12
	dw single_rope_climb_left_action	;13
	dw double_rope_climb_left_action	;14
	dw horizontal_rope_climb_left_action	;15
	dw walk_left_action			;16
	dw swim_left_action			;17
	dw no_action				;18
	dw stuck_on_honey_floor_left_action	;19
	dw walk_left_action			;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw move_enguarde_left_action		;1E
	dw no_action				;1F
	dw no_action				;20
	dw wind_float_move_left_action		;21
	dw enguarde_on_land_move_left_action	;22
	dw no_action				;23
	dw stuck_on_honey_floor_left_action	;24
	dw rambi_charge_move_left_action	;25
	dw enguarde_charge_move_left_action	;26

right_action_table:
	dw walk_right_action			;00
	dw walk_right_action			;01
	dw CODE_B8C3C1				;02
	dw roll_right_action			;03
	dw no_action				;04
	dw no_action				;05
	dw debug_fly_right_action		;06
	dw walk_right_action			;07
	dw walk_right_action			;08
	dw walk_right_action			;09
	dw walk_right_action			;0A
	dw walk_right_action			;0B
	dw no_action				;0C
	dw shot_from_cannon_move_right_action	;0D
	dw move_barrel_cannon_right_action	;0E
	dw walk_right_action			;0F
	dw walk_right_action			;10
	dw walk_right_action			;11
	dw walk_right_action			;12
	dw single_rope_climb_right_action	;13
	dw double_rope_climb_right_action	;14
	dw horizontal_rope_climb_right_action	;15
	dw walk_right_action			;16
	dw swim_right_action			;17
	dw no_action				;18
	dw stuck_on_honey_floor_right_action	;19
	dw walk_right_action			;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw move_enguarde_right_action		;1E
	dw no_action				;1F
	dw no_action				;20
	dw wind_float_move_right_action		;21
	dw enguarde_on_land_move_right_action	;22
	dw no_action				;23
	dw stuck_on_honey_floor_right_action	;24
	dw rambi_charge_move_right_action	;25
	dw enguarde_charge_move_right_action	;26

a_action_table:
	dw team_up_action			;00
	dw no_action				;01
	dw team_up_action			;02
	dw team_up_action			;03
	dw no_action				;04
	dw no_action				;05
	dw no_action				;06
	dw animal_special_action		;07
	dw animal_special_action		;08
	dw no_action				;09
	dw no_action				;0A
	dw no_action				;0B
	dw no_action				;0C
	dw no_action				;0D
	dw no_action				;0E
	dw team_up_action			;0F
	dw team_up_action			;10
	dw team_up_action			;11
	dw no_action				;12
	dw no_action				;13
	dw no_action				;14
	dw no_action				;15
	dw no_action				;16
	dw no_action				;17
	dw no_action				;18
	dw no_action				;19
	dw no_action				;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw animal_special_action		;1E
	dw no_action				;1F
	dw no_action				;20
	dw no_action				;21
	dw animal_special_action		;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

b_action_table:
	dw jump_action				;00
	dw update_b_press_event_action		;01
	dw jump_action				;02
	dw jump_action				;03
	dw no_action				;04
	dw jump_action				;05
	dw no_action				;06
	dw jump_action				;07
	dw update_b_press_event_action		;08
	dw jump_action				;09
	dw update_b_press_event_action		;0A
	dw squawks_fly_up_action		;0B
	dw no_action				;0C
	dw no_action				;0D
	dw no_action				;0E
	dw jump_action				;0F
	dw update_b_press_event_action		;10
	dw update_b_press_event_action		;11
	dw no_action				;12
	dw jump_off_vertical_rope_action	;13
	dw vertical_double_rope_b_action	;14
	dw jump_off_horizontal_rope_action	;15
	dw jump_off_hook_action			;16
	dw swim_up_action			;17
	dw jump_off_honey_wall_action		;18
	dw jump_action				;19
	dw no_action				;1A
	dw no_action				;1B
	dw jump_off_vertical_rope_action	;1C
	dw no_action				;1D
	dw no_action				;1E
	dw no_action				;1F
	dw no_action				;20
	dw no_action				;21
	dw no_action				;22
	dw no_action				;23
	dw jump_action				;24
	dw jump_action				;25
	dw no_action				;26

x_action_table:
	dw dismount_animal_action		;00
	dw dismount_animal_action		;01
	dw no_action				;02
	dw no_action				;03
	dw no_action				;04
	dw no_action				;05
	dw no_action				;06
	dw dismount_animal_action		;07
	dw dismount_animal_action		;08
	dw no_action				;09
	dw no_action				;0A
	dw dismount_animal_action		;0B
	dw no_action				;0C
	dw no_action				;0D
	dw no_action				;0E
	dw dismount_animal_action		;0F
	dw dismount_animal_action		;10
	dw no_action				;11
	dw no_action				;12
	dw no_action				;13
	dw no_action				;14
	dw no_action				;15
	dw no_action				;16
	dw no_action				;17
	dw no_action				;18
	dw no_action				;19
	dw dismount_animal_action		;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw dismount_animal_action		;1E
	dw no_action				;1F
	dw no_action				;20
	dw dismount_animal_action		;21
	dw dismount_animal_action		;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

y_action_table:
	dw roll_or_pickup_object_action		;00
	dw glide_action				;01
	dw roll_or_pickup_object_action		;02
	dw update_roll_action			;03
	dw no_action				;04
	dw roll_or_pickup_object_action		;05
	dw no_action				;06
	dw land_animal_attack_action		;07
	dw land_animal_attack_action		;08
	dw set_fast_move_if_left_right_y_action	;09
	dw set_fast_move_if_left_right_y_action	;0A
	dw squawks_shoot_action			;0B
	dw no_action				;0C
	dw shot_from_cannon_move_faster_action	;0D
	dw no_action				;0E
	dw team_throw_action			;0F
	dw team_throw_action			;10
	dw no_action				;11
	dw no_action				;12
	dw enable_fast_move_from_y_action	;13
	dw enable_fast_move_from_y_action	;14
	dw enable_fast_move_from_y_action	;15
	dw no_action				;16
	dw set_fast_move_if_left_right_y_action	;17
	dw no_action				;18
	dw no_action				;19
	dw land_animal_attack_action		;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw enguarde_attack_action		;1E
	dw no_action				;1F
	dw no_action				;20
	dw roll_or_pickup_object_action		;21
	dw enguarde_attack_action		;22
	dw coop_take_control_y_action		;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

l_action_table:
	dw shoot_web_platform_l_action		;00
	dw shoot_web_platform_l_action		;01
	dw shoot_web_platform_l_action		;02
	dw shoot_web_platform_l_action		;03
	dw no_action				;04
	dw no_action				;05
	dw no_action				;06
	dw shoot_web_platform_l_action		;07
	dw shoot_web_platform_l_action		;08
	dw shoot_web_platform_l_action		;09
	dw shoot_web_platform_l_action		;0A
	dw shoot_web_platform_l_action		;0B
	dw no_action				;0C
	dw no_action				;0D
	dw no_action				;0E
	dw shoot_web_platform_l_action		;0F
	dw shoot_web_platform_l_action		;10
	dw shoot_web_platform_l_action		;11
	dw shoot_web_platform_l_action		;12
	dw shoot_web_platform_l_action		;13
	dw shoot_web_platform_l_action		;14
	dw shoot_web_platform_l_action		;15
	dw no_action				;16
	dw no_action				;17
	dw no_action				;18
	dw no_action				;19
	dw no_action				;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw no_action				;1E
	dw no_action				;1F
	dw no_action				;20
	dw shoot_web_platform_l_action		;21
	dw no_action				;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

r_action_table:
	dw shoot_web_platform_r_action		;00
	dw shoot_web_platform_r_action		;01
	dw shoot_web_platform_r_action		;02
	dw shoot_web_platform_r_action		;03
	dw no_action				;04
	dw no_action				;05
	dw no_action				;06
	dw shoot_web_platform_r_action		;07
	dw shoot_web_platform_r_action		;08
	dw shoot_web_platform_r_action		;09
	dw shoot_web_platform_r_action		;0A
	dw shoot_web_platform_r_action		;0B
	dw no_action				;0C
	dw no_action				;0D
	dw no_action				;0E
	dw shoot_web_platform_r_action		;0F
	dw shoot_web_platform_r_action		;10
	dw shoot_web_platform_r_action		;11
	dw shoot_web_platform_r_action		;12
	dw shoot_web_platform_r_action		;13
	dw shoot_web_platform_r_action		;14
	dw shoot_web_platform_r_action		;15
	dw no_action				;16
	dw no_action				;17
	dw no_action				;18
	dw no_action				;19
	dw no_action				;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw no_action				;1E
	dw no_action				;1F
	dw no_action				;20
	dw shoot_web_platform_r_action		;21
	dw no_action				;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

start_action_table:
	dw pause_game_action			;00
	dw pause_game_action			;01
	dw pause_game_action			;02
	dw pause_game_action			;03
	dw pause_game_action			;04
	dw pause_game_action			;05
	dw stop_debug_fly_action		;06
	dw pause_game_action			;07
	dw pause_game_action			;08
	dw pause_game_action			;09
	dw pause_game_action			;0A
	dw pause_game_action			;0B
	dw no_action				;0C
	dw pause_game_action			;0D
	dw pause_game_action			;0E
	dw pause_game_action			;0F
	dw pause_game_action			;10
	dw pause_game_action			;11
	dw pause_game_action			;12
	dw pause_game_action			;13
	dw pause_game_action			;14
	dw pause_game_action			;15
	dw pause_game_action			;16
	dw pause_game_action			;17
	dw pause_game_action			;18
	dw pause_game_action			;19
	dw pause_game_action			;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw pause_game_action			;1E
	dw pause_game_action			;1F
	dw pause_game_action			;20
	dw pause_game_action			;21
	dw pause_game_action			;22
	dw coop_take_control_start_action	;23
	dw pause_game_action			;24
	dw pause_game_action			;25
	dw pause_game_action			;26

select_action_table:
	dw swap_to_other_kong_action		;00
	dw no_action				;01
	dw no_action				;02
	dw no_action				;03
	dw no_action				;04
	dw no_action				;05
	dw no_action				;06
	dw no_action				;07
	dw no_action				;08
	dw no_action				;09
	dw no_action				;0A
	dw no_action				;0B
	dw no_action				;0C
	dw no_action				;0D
	dw no_action				;0E
	dw no_action				;0F
	dw no_action				;10
	dw no_action				;11
	dw no_action				;12
	dw no_action				;13
	dw no_action				;14
	dw no_action				;15
	dw no_action				;16
	dw swap_to_other_kong_swimming_action	;17
	dw no_action				;18
	dw swap_to_other_kong_action		;19
	dw no_action				;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw no_action				;1E
	dw no_action				;1F
	dw no_action				;20
	dw no_action				;21
	dw no_action				;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

no_left_right_action_table:
	dw stop_walk_action			;00
	dw stop_walk_action			;01
	dw stop_walk_action			;02
	dw roll_no_left_right_action		;03
	dw no_action				;04
	dw stop_walk_action			;05
	dw stop_debug_x_move_action		;06
	dw stop_walk_action			;07
	dw stop_walk_action			;08
	dw stop_walk_action			;09
	dw stop_walk_action			;0A
	dw stop_walk_action			;0B
	dw no_action				;0C
	dw no_action				;0D
	dw stop_barrel_cannon_x_move_action	;0E
	dw stop_walk_action			;0F
	dw stop_walk_action			;10
	dw stop_walk_action			;11
	dw stop_walk_action			;12
	dw stop_walk_action			;13
	dw stop_walk_action			;14
	dw stop_walk_action			;15
	dw no_action				;16
	dw stop_walk_action			;17
	dw no_action				;18
	dw no_action				;19
	dw stop_walk_action			;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw stop_walk_action			;1E
	dw no_action				;1F
	dw no_action				;20
	dw stop_walk_action			;21
	dw stop_walk_action			;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

no_up_down_action_table:
	dw return_sprite_no_up_down_no_action	;00
	dw return_sprite_no_up_down_no_action	;01
	dw return_sprite_no_up_down_no_action	;02
	dw return_sprite_no_up_down_no_action	;03
	dw no_action				;04
	dw stop_crouch_action			;05
	dw stop_debug_y_move_action		;06
	dw return_sprite_no_up_down_no_action	;07
	dw return_sprite_no_up_down_no_action	;08
	dw return_sprite_no_up_down_no_action	;09
	dw return_sprite_no_up_down_no_action	;0A
	dw CODE_B8CE39				;0B
	dw no_action				;0C
	dw no_action				;0D
	dw stop_barrel_cannon_y_move_action	;0E
	dw return_sprite_no_up_down_no_action	;0F
	dw return_sprite_no_up_down_no_action	;10
	dw return_sprite_no_up_down_no_action	;11
	dw return_sprite_no_up_down_no_action	;12
	dw stop_vertical_rope_climb_action	;13
	dw stop_vertical_rope_climb_action	;14
	dw stop_vertical_rope_climb_action	;15
	dw no_action				;16
	dw CODE_B8CE4C				;17
	dw no_action				;18
	dw no_action				;19
	dw quawks_normal_descent_action		;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw clear_target_y_velocity_action	;1E
	dw no_action				;1F
	dw no_action				;20
	dw clear_target_y_velocity_action	;21
	dw clear_target_y_velocity_action	;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

no_b_action_table:
	dw stop_holding_jump_action		;00
	dw stop_holding_jump_action		;01
	dw stop_holding_jump_action		;02
	dw no_b_action				;03
	dw no_b_action				;04
	dw no_action				;05
	dw no_action				;06
	dw stop_holding_jump_action		;07
	dw stop_holding_jump_action		;08
	dw stop_holding_jump_action		;09
	dw stop_holding_jump_action		;0A
	dw CODE_B8CE73				;0B
	dw no_action				;0C
	dw no_action				;0D
	dw no_action				;0E
	dw stop_holding_jump_action		;0F
	dw stop_holding_jump_action		;10
	dw stop_holding_jump_action		;11
	dw stop_holding_jump_action		;12
	dw stop_holding_jump_action		;13
	dw stop_holding_jump_action		;14
	dw stop_holding_jump_action		;15
	dw no_action				;16
	dw no_action				;17
	dw no_action				;18
	dw no_action				;19
	dw no_action				;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw no_action				;1E
	dw no_action				;1F
	dw no_action				;20
	dw stop_holding_jump_action		;21
	dw no_action				;22
	dw no_action				;23
	dw no_action				;24
	dw no_action				;25
	dw no_action				;26

no_y_action_table:
	dw clear_fast_move_y_action		;00
	dw clear_fast_move_y_action		;01
	dw clear_fast_move_y_action		;02
	dw clear_fast_move_y_action		;03
	dw no_action				;04
	dw clear_fast_move_y_action		;05
	dw no_action				;06
	dw clear_fast_move_y_action		;07
	dw clear_fast_move_y_action		;08
	dw stop_carrying_sprite_action		;09
	dw stop_carrying_sprite_action		;0A
	dw clear_fast_move_y_action		;0B
	dw no_action				;0C
	dw no_action				;0D
	dw no_action				;0E
	dw clear_fast_move_y_action		;0F
	dw clear_fast_move_y_action		;10
	dw clear_fast_move_y_action		;11
	dw no_action				;12
	dw clear_fast_move_y_action		;13
	dw clear_fast_move_y_action		;14
	dw clear_fast_move_y_action		;15
	dw no_action				;16
	dw clear_fast_move_y_action		;17
	dw no_action				;18
	dw no_action				;19
	dw clear_fast_move_y_action		;1A
	dw no_action				;1B
	dw no_action				;1C
	dw no_action				;1D
	dw no_action				;1E
	dw no_action				;1F
	dw no_action				;20
	dw clear_fast_move_y_action		;21
	dw no_action				;22
	dw no_action				;23
	dw stop_carrying_sprite_action		;24
	dw no_action				;25
	dw no_action				;26

no_action:
	RTS					;$B8C01F  /

return_sprite_up_action:
	LDX current_sprite			;$B8C020  \
	RTS					;$B8C022  /

debug_fly_up_action:
	LDX current_sprite			;$B8C023  \
	JSR get_debug_fly_velocity		;$B8C025   |
	EOR #$FFFF				;$B8C028   |
	INC A					;$B8C02B   |
	STA $24,x				;$B8C02C   |
	RTS					;$B8C02E  /

get_debug_fly_velocity:
	LDA $0981				;$B8C02F  \
	AND #$4080				;$B8C032   |
	BEQ .slow				;$B8C035   |
	AND #$4000				;$B8C037   |
	BNE .fast				;$B8C03A   |
	LDA #$0800				;$B8C03C   |
	RTS					;$B8C03F  /

.fast
	LDA #$0400				;$B8C040  \
	RTS					;$B8C043  /

.slow
	LDA #$0100				;$B8C044  \
	RTS					;$B8C047  /

no_up_action:
	RTS					;$B8C048  /

squawks_hold_up_action:
	LDX current_sprite			;$B8C049  \
	JSR set_player_terminal_velocity	;$B8C04B   |
	JSR set_player_normal_gravity		;$B8C04E   |
	RTS					;$B8C051  /

move_barrel_cannon_up_action:
	LDX current_sprite			;$B8C052  \
	LDY #$004E				;$B8C054   |
	LDA [$8E],y				;$B8C057   |
	EOR #$FFFF				;$B8C059   |
	INC A					;$B8C05C   |
	STA $2A,x				;$B8C05D   |
	RTS					;$B8C05F  /

climb_up_single_rope_action:
	LDX current_sprite			;$B8C060  \
	LDY $66					;$B8C062   |
	LDA $0006,y				;$B8C064   |
	AND #$0004				;$B8C067   |
	BNE .fast_climb				;$B8C06A   |
	LDY #$0054				;$B8C06C   |
	LDA [$8E],y				;$B8C06F   |
	BRA .update_y_velocity			;$B8C071  /

.fast_climb
	LDY #$0058				;$B8C073  \
	LDA [$8E],y				;$B8C076   |
.update_y_velocity				;	   |
	EOR #$FFFF				;$B8C078   |
	INC A					;$B8C07B   |
	STA $2A,x				;$B8C07C   |
	RTS					;$B8C07E  /

climb_up_double_rope_action:
	LDX current_sprite			;$B8C07F  \
	LDY $66					;$B8C081   |
	LDA $0006,y				;$B8C083   |
	AND #$0004				;$B8C086   |
	BNE .fast_climb				;$B8C089   |
	LDY #$005C				;$B8C08B   |
	LDA [$8E],y				;$B8C08E   |
	BRA .update_y_velocity			;$B8C090  /

.fast_climb
	LDY #$0060				;$B8C092  \
	LDA [$8E],y				;$B8C095   |
.update_y_velocity				;	   |
	EOR #$FFFF				;$B8C097   |
	INC A					;$B8C09A   |
	STA $2A,x				;$B8C09B   |
	RTS					;$B8C09D  /

horizontal_rope_up_action:
	RTS					;$B8C09E  /

quawks_slow_descent_action:
	LDX current_sprite			;$B8C09F  \
	LDA #$020C				;$B8C0A1   |
	STA $3A,x				;$B8C0A4   |
	JSR set_player_normal_gravity		;$B8C0A6   |
	LDA #$0080				;$B8C0A9   |
	LDY $66					;$B8C0AC   |
	STA $000A,y				;$B8C0AE   |
	RTS					;$B8C0B1  /

unknown_up_1C_action:
	JMP climb_up_single_rope_action		;$B8C0B2  /

move_enguarde_up_action:
	LDX current_sprite			;$B8C0B5  \
	LDA #$FD00				;$B8C0B7   |
	STA $2A,x				;$B8C0BA   |
	RTS					;$B8C0BC  /

wind_float_up_fast_action:
	LDX current_sprite			;$B8C0BD  \
	LDY #$0068				;$B8C0BF   |
	LDA [$8E],y				;$B8C0C2   |
	STA $2A,x				;$B8C0C4   |
	RTS					;$B8C0C6  /

crouch_action:
	LDX current_sprite			;$B8C0C7  \
	LDA $1E,x				;$B8C0C9   |
	AND #$1001				;$B8C0CB   |
	BNE .touching_ground			;$B8C0CE   |
	RTS					;$B8C0D0  /

.touching_ground
	JSR check_for_rope_hanging_from_floor	;$B8C0D1  \ \
	BCS jump_down_to_rope			;$B8C0D4   |/ if a vertical rope is below, jump down to it
	LDA #$0007				;$B8C0D6   |\
	STA $2E,x				;$B8C0D9   |/ otherwise set kong behavior to crouching
	STZ $26,x				;$B8C0DB   |> clear target x velocity of player
	LDA #$000C				;$B8C0DD   |\
	JSL CODE_B9D0B8				;$B8C0E0   |/ set crouch start animation
	LDA $0981				;$B8C0E4   |\
	AND #$8000				;$B8C0E7   | | clear all other held inputs besides b
	STA $0981				;$B8C0EA   |/
	RTS					;$B8C0ED  /

jump_down_to_rope:
	LDA $5E					;$B8C0EE  \
	AND #$FFF0				;$B8C0F0   |
	ORA #$0003				;$B8C0F3   |
	STA $06,x				;$B8C0F6   |
	LDA #$FD00				;$B8C0F8   |
	STA $24,x				;$B8C0FB   |
	STZ $20,x				;$B8C0FD   |
	STZ $26,x				;$B8C0FF   |
	LDA #$003A				;$B8C101   |
	STA $2E,x				;$B8C104   |
	LDA #$0006				;$B8C106   |
	JSL CODE_B9D0B8				;$B8C109   |
	RTS					;$B8C10D  /

check_for_rope_hanging_from_floor:
	LDX current_sprite			;$B8C10E  \
	LDA $06,x				;$B8C110   |
	STA $5E					;$B8C112   |
	LDA $10,x				;$B8C114   |
	AND #$1000				;$B8C116   |
	BNE .rope_below				;$B8C119   |
	LDY #$0004				;$B8C11B   |
	LDA global_frame_counter		;$B8C11E   |
	LSR A					;$B8C120   |
	BCS .CODE_B8C129			;$B8C121   |
	TYA					;$B8C123   |
	EOR #$FFFF				;$B8C124   |
	INC A					;$B8C127   |
	TAY					;$B8C128   |
.CODE_B8C129					;	   |
	TYA					;$B8C129   |
	CLC					;$B8C12A   |
	ADC $5E					;$B8C12B   |
	STA $5E					;$B8C12D   |
	JSL CODE_B5C3D5				;$B8C12F   |
	LDA $AE					;$B8C133   |
	AND #$1000				;$B8C135   |
	BNE .rope_below				;$B8C138   |
	CLC					;$B8C13A   |
	RTS					;$B8C13B  /

.rope_below
	SEC					;$B8C13C  \
	RTS					;$B8C13D  /

crouch_check_for_rope_below_action:
	JSR check_for_rope_hanging_from_floor	;$B8C13E  \
	BCS jump_down_to_rope			;$B8C141   |
	RTS					;$B8C143  /

debug_fly_down_action:
	LDX current_sprite			;$B8C144  \
	JSR get_debug_fly_velocity		;$B8C146   |
	STA $24,x				;$B8C149   |
	RTS					;$B8C14B  /

squawks_holding_down_action:
	JSR set_player_terminal_velocity_down	;$B8C14C  \
	JSR set_player_jumping_gravity		;$B8C14F   |
	RTS					;$B8C152  /

move_barrel_cannon_down_action:
	LDX current_sprite			;$B8C153  \
	LDY #$004E				;$B8C155   |
	LDA [$8E],y				;$B8C158   |
	STA $2A,x				;$B8C15A   |
	RTS					;$B8C15C  /

climb_down_single_rope_action:
	LDX current_sprite			;$B8C15D  \
	LDY $66					;$B8C15F   |\
	LDA $0006,y				;$B8C161   | |
	AND #$0004				;$B8C164   | | if fast move flag is enabled climb down rope faster
	BNE .fast_climb				;$B8C167   |/
	LDY #$0056				;$B8C169   |\
	LDA [$8E],y				;$B8C16C   | | otherwise use normal climb velocity
	BRA .update_y_velocity			;$B8C16E  / /

.fast_climb
	LDY #$005A				;$B8C170  \ \
	LDA [$8E],y				;$B8C173   |/ use fast climb velocity
.update_y_velocity				;	   |
	STA $2A,x				;$B8C175   |
	RTS					;$B8C177  /

climb_down_double_rope_action:
	LDX current_sprite			;$B8C178  \
	LDY $66					;$B8C17A   |
	LDA $0006,y				;$B8C17C   |
	AND #$0004				;$B8C17F   |
	BNE .fast_climb				;$B8C182   |
	LDY #$005E				;$B8C184   |
	LDA [$8E],y				;$B8C187   |
	BRA .update_y_velocity			;$B8C189  /

.fast_climb
	LDY #$0062				;$B8C18B  \
	LDA [$8E],y				;$B8C18E   |
.update_y_velocity				;	   |
	STA $2A,x				;$B8C190   |
	RTS					;$B8C192  /

horizontal_rope_down_action:
	RTS					;$B8C193  /

swim_sink_fast_action:
	LDY #$007A				;$B8C194  \
	LDA [$8E],y				;$B8C197   |
	LDY $66					;$B8C199   |
	STA $000A,y				;$B8C19B   |
	RTS					;$B8C19E  /

quawks_fast_descent_action:
	LDX current_sprite			;$B8C19F  \
	LDA #$0074				;$B8C1A1   |
	STA $3A,x				;$B8C1A4   |
	JSR set_player_normal_gravity		;$B8C1A6   |
	LDA #$0200				;$B8C1A9   |
	LDY $66					;$B8C1AC   |
	STA $000A,y				;$B8C1AE   |
	RTS					;$B8C1B1  /

unknown_down_1C_action:
	JMP climb_down_single_rope_action	;$B8C1B2  /

move_enguarde_down_action:
	LDX current_sprite			;$B8C1B5  \
	LDA #$0300				;$B8C1B7   |
	STA $2A,x				;$B8C1BA   |
	RTS					;$B8C1BC  /

wind_float_up_slow_action:
	LDX current_sprite			;$B8C1BD  \
	LDY #$006A				;$B8C1BF   |
	LDA [$8E],y				;$B8C1C2   |
	STA $2A,x				;$B8C1C4   |
	RTS					;$B8C1C6  /

walk_left_action:
	LDX current_sprite			;$B8C1C7  \
	JSR get_player_x_move_speed		;$B8C1C9   |
	JSR slow_rattly_if_on_ground		;$B8C1CC   |
	EOR #$FFFF				;$B8C1CF   |
	INC A					;$B8C1D2   |
	STA $26,x				;$B8C1D3   |
	RTS					;$B8C1D5  /

slow_rattly_if_on_ground:
	LDX current_sprite			;$B8C1D6  \
	LDY $6E					;$B8C1D8   |
	CPY #$0194				;$B8C1DA   |
	BEQ .rattly				;$B8C1DD   |
	RTS					;$B8C1DF  /

.not_on_ground
	LDA $32					;$B8C1E0  \
	RTS					;$B8C1E2  /

.rattly
	STA $32					;$B8C1E3  \
	LDA $1E,x				;$B8C1E5   |
	AND #$1001				;$B8C1E7   |
	BEQ .not_on_ground			;$B8C1EA   |
	LDA #$0001				;$B8C1EC   |
	RTS					;$B8C1EF  /

get_player_x_move_speed:
	LDY $66					;$B8C1F0  \
	LDA $0006,y				;$B8C1F2   |
	AND #$0004				;$B8C1F5   |
	BNE .running				;$B8C1F8   |
	LDA $6E					;$B8C1FA   |
	BNE .has_animal_walking			;$B8C1FC   |
	LDY #$000C				;$B8C1FE   |
	LDA [$8E],y				;$B8C201   |
	RTS					;$B8C203  /

.has_animal_walking
	SEC					;$B8C204  \
	SBC #$FFF8				;$B8C205   |
	LSR A					;$B8C208   |
	TAY					;$B8C209   |
	LDA [$8E],y				;$B8C20A   |
	RTS					;$B8C20C  /

.running
	LDA $6E					;$B8C20D  \
	BNE .has_animal_running			;$B8C20F   |
	LDY #$000E				;$B8C211   |
	LDA [$8E],y				;$B8C214   |
	RTS					;$B8C216  /

.has_animal_running
	SEC					;$B8C217  \
	SBC #$FFE4				;$B8C218   |
	LSR A					;$B8C21B   |
	TAY					;$B8C21C   |
	LDA [$8E],y				;$B8C21D   |
	RTS					;$B8C21F  /

CODE_B8C220:
	RTS					;$B8C220  /

roll_left_action:
	LDX current_sprite			;$B8C221  \
	LDA $10,x				;$B8C223   |
	AND #$0007				;$B8C225   |
	CMP $88					;$B8C228   |
	BMI CODE_B8C234				;$B8C22A   |
	LDA $1E,x				;$B8C22C   |
	AND #$0001				;$B8C22E   |
	BEQ CODE_B8C234				;$B8C231   |
	RTS					;$B8C233  /

CODE_B8C234:
	LDA $12,x				;$B8C234  \
	ORA #$4000				;$B8C236   |
	STA $12,x				;$B8C239   |
	LDA $26,x				;$B8C23B   |
	BMI .return				;$B8C23D   |
	EOR #$FFFF				;$B8C23F   |
	INC A					;$B8C242   |
	STA $26,x				;$B8C243   |
.return						;	   |
	RTS					;$B8C245  /

debug_fly_left_action:
	LDX current_sprite			;$B8C246  \
	JSR get_debug_fly_velocity		;$B8C248   |
	EOR #$FFFF				;$B8C24B   |
	INC A					;$B8C24E   |
	STA $20,x				;$B8C24F   |
	LDA $12,x				;$B8C251   |
	ORA #$4000				;$B8C253   |
	STA $12,x				;$B8C256   |
	RTS					;$B8C258  /

shot_from_cannon_move_left_action:
	LDX current_sprite			;$B8C259  \
	JSR get_player_x_move_speed		;$B8C25B   |
	EOR #$FFFF				;$B8C25E   |
	INC A					;$B8C261   |
	CLC					;$B8C262   |
	ADC $26,x				;$B8C263   |
	STA $26,x				;$B8C265   |
	RTS					;$B8C267  /

move_barrel_cannon_left_action:
	LDX current_sprite			;$B8C268  \
	LDY #$004E				;$B8C26A   |
	LDA [$8E],y				;$B8C26D   |
	EOR #$FFFF				;$B8C26F   |
	INC A					;$B8C272   |
	STA $26,x				;$B8C273   |
	LDY #$0052				;$B8C275   |
	LDA [$8E],y				;$B8C278   |
	EOR #$FFFF				;$B8C27A   |
	INC A					;$B8C27D   |
	STA $28,x				;$B8C27E   |
	RTS					;$B8C280  /

single_rope_climb_left_action:
	LDX current_sprite			;$B8C281  \
	LDA $12,x				;$B8C283   |\
	AND #$4000				;$B8C285   | | if player is facing left
	BNE .facing_left			;$B8C288   |/ apply x velocity and return
	LDA $0A,x				;$B8C28A   |\
	SEC					;$B8C28C   | |
	SBC #$0008				;$B8C28D   | |
	STA $34					;$B8C290   | |
	LDA $06,x				;$B8C292   | |
	SEC					;$B8C294   | |
	SBC #$0020				;$B8C295   | |
	JSL CODE_B5C3E7				;$B8C298   |/
	JSR CODE_B8D484				;$B8C29C   |
	STA $5E					;$B8C29F   |
	LDA $AE					;$B8C2A1   |
	AND #$1000				;$B8C2A3   |
	BEQ .CODE_B8C2B2			;$B8C2A6   |
	LDA $5E					;$B8C2A8   |
	CLC					;$B8C2AA   |
	ADC #$0027				;$B8C2AB   |
	CMP $0A,x				;$B8C2AE   |
	BMI .transition_to_double_rope		;$B8C2B0   |
.CODE_B8C2B2					;	   |
	LDA $0A,x				;$B8C2B2   |
	SEC					;$B8C2B4   |
	SBC #$0028				;$B8C2B5   |
	STA $34					;$B8C2B8   |
	LDA $06,x				;$B8C2BA   |
	SEC					;$B8C2BC   |
	SBC #$0004				;$B8C2BD   |
	JSL CODE_B5C3E7				;$B8C2C0   |
	JSR CODE_B8D484				;$B8C2C4   |
	STA $5E					;$B8C2C7   |
	LDA $AE					;$B8C2C9   |
	AND #$0800				;$B8C2CB   |
	BNE CODE_B8C2ED				;$B8C2CE   |
.facing_left					;	   |
	LDA #$FD00				;$B8C2D0   |
	STA $26,x				;$B8C2D3   |
.return						;	   |
	RTS					;$B8C2D5  /

.transition_to_double_rope
	LDY $66					;$B8C2D6  \
	LDA $0000,y				;$B8C2D8   |
	CMP #$0032				;$B8C2DB   |
	BEQ .return				;$B8C2DE   |
	LDA #$0036				;$B8C2E0   |
	STA $2E,x				;$B8C2E3   |
	LDA #$0034				;$B8C2E5   |
	JSL CODE_B9D0B8				;$B8C2E8   |
	RTS					;$B8C2EC  /

CODE_B8C2ED:
	LDX current_sprite			;$B8C2ED  \
	LDA $06,x				;$B8C2EF   |
	SEC					;$B8C2F1   |
	SBC #$0004				;$B8C2F2   |
	STA $06,x				;$B8C2F5   |
	LDA #$FF00				;$B8C2F7   |
	STA $20,x				;$B8C2FA   |
	STA $26,x				;$B8C2FC   |
	JMP CODE_B8B77B				;$B8C2FE  /

double_rope_climb_left_action:
	JSR CODE_B8C305				;$B8C301  \
	RTS					;$B8C304  /

CODE_B8C305:
	LDX current_sprite			;$B8C305  \
	LDA #$0036				;$B8C307   |
	STA $2E,x				;$B8C30A   |
	LDA $12,x				;$B8C30C   |
	AND #$4000				;$B8C30E   |
	BNE CODE_B8C322				;$B8C311   |
	LDA $12,x				;$B8C313   |
	EOR #$4000				;$B8C315   |
	STA $12,x				;$B8C318   |
	LDA $06,x				;$B8C31A   |
	SEC					;$B8C31C   |
	SBC #$0020				;$B8C31D   |
	STA $06,x				;$B8C320   |
CODE_B8C322:					;	   |
	LDA #$0035				;$B8C322   |
	JSL CODE_B9D0B8				;$B8C325   |
	RTS					;$B8C329  /

horizontal_rope_climb_left_action:
	LDX current_sprite			;$B8C32A  \
	LDY $66					;$B8C32C   |
	LDA $0006,y				;$B8C32E   |
	AND #$0004				;$B8C331   |
	BNE CODE_B8C33D				;$B8C334   |
	LDY #$0064				;$B8C336   |
	LDA [$8E],y				;$B8C339   |
	BRA CODE_B8C342				;$B8C33B  /

CODE_B8C33D:
	LDY #$0066				;$B8C33D  \
	LDA [$8E],y				;$B8C340   |
CODE_B8C342:					;	   |
	EOR #$FFFF				;$B8C342   |
	INC A					;$B8C345   |
	STA $26,x				;$B8C346   |
	RTS					;$B8C348  /

swim_left_action:
	LDX current_sprite			;$B8C349  \
	LDY $66					;$B8C34B   |
	LDA $0006,y				;$B8C34D   |
	AND #$0004				;$B8C350   |
	BNE .fast_swim				;$B8C353   |
	LDY #$007C				;$B8C355   |
	LDA [$8E],y				;$B8C358   |
	BRA .update_x_velocity			;$B8C35A  /

.fast_swim
	LDY #$007E				;$B8C35C  \
	LDA [$8E],y				;$B8C35F   |
.update_x_velocity				;	   |
	EOR #$FFFF				;$B8C361   |
	INC A					;$B8C364   |
	STA $26,x				;$B8C365   |
	RTS					;$B8C367  /

stuck_on_honey_floor_left_action:
	LDX current_sprite			;$B8C368  \
	LDA $0983				;$B8C36A   |
	AND #$0200				;$B8C36D   |
	BNE .left_pressed_this_frame		;$B8C370   |
	RTS					;$B8C372  /

.left_pressed_this_frame
	JSR set_stuck_on_honey_floor_animation	;$B8C373  \
	LDX current_sprite			;$B8C376   |
	LDA #$0080				;$B8C378   |
	STA $3A,x				;$B8C37B   |
	RTS					;$B8C37D  /

move_enguarde_left_action:
	LDX current_sprite			;$B8C37E  \
	LDA #$FE00				;$B8C380   |
	STA $26,x				;$B8C383   |
	RTS					;$B8C385  /

wind_float_move_left_action:
	LDX current_sprite			;$B8C386  \
	LDY #$006C				;$B8C388   |
	LDA [$8E],y				;$B8C38B   |
	EOR #$FFFF				;$B8C38D   |
	INC A					;$B8C390   |
	STA $26,x				;$B8C391   |
	RTS					;$B8C393  /

enguarde_on_land_move_left_action:
	LDX current_sprite			;$B8C394  \
	LDA $12,x				;$B8C396   |
	ORA #$4000				;$B8C398   |
	STA $12,x				;$B8C39B   |
	RTS					;$B8C39D  /

rambi_charge_move_left_action:
	LDX current_sprite			;$B8C39E  \
	LDA $20,x				;$B8C3A0   |
	BMI CODE_B8C3A9				;$B8C3A2   |
	LDA #$0009				;$B8C3A4   |
	STA $2E,x				;$B8C3A7   |
CODE_B8C3A9:					;	   |
	RTS					;$B8C3A9  /

enguarde_charge_move_left_action:
	LDX current_sprite			;$B8C3AA  \
	LDA $20,x				;$B8C3AC   |
	BMI CODE_B8C3B5				;$B8C3AE   |
	LDA #$0050				;$B8C3B0   |
	STA $2E,x				;$B8C3B3   |
CODE_B8C3B5:					;	   |
	RTS					;$B8C3B5  /

walk_right_action:
	LDX current_sprite			;$B8C3B6  \
	JSR get_player_x_move_speed		;$B8C3B8   |
	JSR slow_rattly_if_on_ground		;$B8C3BB   |
	STA $26,x				;$B8C3BE   |
	RTS					;$B8C3C0  /

CODE_B8C3C1:
	RTS					;$B8C3C1  /

roll_right_action:
	LDX current_sprite			;$B8C3C2  \
	LDA $10,x				;$B8C3C4   |
	AND #$0007				;$B8C3C6   |
	CMP $88					;$B8C3C9   |
	BMI CODE_B8C3D5				;$B8C3CB   |
	LDA $1E,x				;$B8C3CD   |
	AND #$0001				;$B8C3CF   |
	BEQ CODE_B8C3D5				;$B8C3D2   |
	RTS					;$B8C3D4  /

CODE_B8C3D5:
	LDA $12,x				;$B8C3D5  \
	AND #$BFFF				;$B8C3D7   |
	STA $12,x				;$B8C3DA   |
	LDA $26,x				;$B8C3DC   |
	BPL CODE_B8C3E6				;$B8C3DE   |
	EOR #$FFFF				;$B8C3E0   |
	INC A					;$B8C3E3   |
	STA $26,x				;$B8C3E4   |
CODE_B8C3E6:					;	   |
	RTS					;$B8C3E6  /

debug_fly_right_action:
	LDX current_sprite			;$B8C3E7  \
	JSR get_debug_fly_velocity		;$B8C3E9   |
	STA $20,x				;$B8C3EC   |
	LDA $12,x				;$B8C3EE   |
	AND #$BFFF				;$B8C3F0   |
	STA $12,x				;$B8C3F3   |
	RTS					;$B8C3F5  /

shot_from_cannon_move_right_action:
	LDX current_sprite			;$B8C3F6  \
	JSR get_player_x_move_speed		;$B8C3F8   |
	CLC					;$B8C3FB   |
	ADC $26,x				;$B8C3FC   |
	STA $26,x				;$B8C3FE   |
	RTS					;$B8C400  /

move_barrel_cannon_right_action:
	LDX current_sprite			;$B8C401  \
	LDY #$004E				;$B8C403   |
	LDA [$8E],y				;$B8C406   |
	STA $26,x				;$B8C408   |
	LDY #$0052				;$B8C40A   |
	LDA [$8E],y				;$B8C40D   |
	STA $28,x				;$B8C40F   |
	RTS					;$B8C411  /

single_rope_climb_right_action:
	LDX current_sprite			;$B8C412  \
	LDA $12,x				;$B8C414   |
	AND #$4000				;$B8C416   |
	BEQ CODE_B8C45E				;$B8C419   |
	LDA $0A,x				;$B8C41B   |
	SEC					;$B8C41D   |
	SBC #$0008				;$B8C41E   |
	STA $34					;$B8C421   |
	LDA $06,x				;$B8C423   |
	CLC					;$B8C425   |
	ADC #$0020				;$B8C426   |
	JSL CODE_B5C3E7				;$B8C429   |
	JSR CODE_B8D484				;$B8C42D   |
	STA $5E					;$B8C430   |
	LDA $AE					;$B8C432   |
	AND #$1000				;$B8C434   |
	BEQ CODE_B8C443				;$B8C437   |
	LDA $5E					;$B8C439   |
	CLC					;$B8C43B   |
	ADC #$0027				;$B8C43C   |
	CMP $0A,x				;$B8C43F   |
	BMI CODE_B8C464				;$B8C441   |
CODE_B8C443:					;	   |
	LDA $0A,x				;$B8C443   |
	SEC					;$B8C445   |
	SBC #$0028				;$B8C446   |
	STA $34					;$B8C449   |
	LDA $06,x				;$B8C44B   |
	INC A					;$B8C44D   |
	JSL CODE_B5C3E7				;$B8C44E   |
	JSR CODE_B8D484				;$B8C452   |
	STA $5E					;$B8C455   |
	LDA $AE					;$B8C457   |
	AND #$0800				;$B8C459   |
	BNE CODE_B8C47D				;$B8C45C   |
CODE_B8C45E:					;	   |
	LDA #$0300				;$B8C45E   |
	STA $26,x				;$B8C461   |
CODE_B8C463:					;	   |
	RTS					;$B8C463  /

CODE_B8C464:
	LDY $66					;$B8C464  \
	LDA $0000,y				;$B8C466   |
	CMP #$0032				;$B8C469   |
	BEQ CODE_B8C463				;$B8C46C   |
	LDX current_sprite			;$B8C46E   |
	LDA #$0036				;$B8C470   |
	STA $2E,x				;$B8C473   |
	LDA #$0034				;$B8C475   |
	JSL CODE_B9D0B8				;$B8C478   |
	RTS					;$B8C47C  /

CODE_B8C47D:
	LDX current_sprite			;$B8C47D  \
	LDA $06,x				;$B8C47F   |
	CLC					;$B8C481   |
	ADC #$0001				;$B8C482   |
	STA $06,x				;$B8C485   |
	LDA #$0100				;$B8C487   |
	STA $20,x				;$B8C48A   |
	STA $26,x				;$B8C48C   |
	JMP CODE_B8B77B				;$B8C48E  /

double_rope_climb_right_action:
	LDX current_sprite			;$B8C491  \
	LDA #$0036				;$B8C493   |
	STA $2E,x				;$B8C496   |
	LDA $12,x				;$B8C498   |
	AND #$4000				;$B8C49A   |
	BEQ CODE_B8C4AE				;$B8C49D   |
	LDA $12,x				;$B8C49F   |
	EOR #$4000				;$B8C4A1   |
	STA $12,x				;$B8C4A4   |
	LDA $06,x				;$B8C4A6   |
	CLC					;$B8C4A8   |
	ADC #$0020				;$B8C4A9   |
	STA $06,x				;$B8C4AC   |
CODE_B8C4AE:					;	   |
	LDA #$0035				;$B8C4AE   |
	JSL CODE_B9D0B8				;$B8C4B1   |
	RTS					;$B8C4B5  /

horizontal_rope_climb_right_action:
	LDX current_sprite			;$B8C4B6  \
	LDY $66					;$B8C4B8   |
	LDA $0006,y				;$B8C4BA   |
	AND #$0004				;$B8C4BD   |
	BNE CODE_B8C4C9				;$B8C4C0   |
	LDY #$0064				;$B8C4C2   |
	LDA [$8E],y				;$B8C4C5   |
	BRA CODE_B8C4CE				;$B8C4C7  /

CODE_B8C4C9:
	LDY #$0066				;$B8C4C9  \
	LDA [$8E],y				;$B8C4CC   |
CODE_B8C4CE:					;	   |
	STA $26,x				;$B8C4CE   |
	RTS					;$B8C4D0  /

swim_right_action:
	LDX current_sprite			;$B8C4D1  \
	LDY $66					;$B8C4D3   |
	LDA $0006,y				;$B8C4D5   |
	AND #$0004				;$B8C4D8   |
	BNE CODE_B8C4E4				;$B8C4DB   |
	LDY #$007C				;$B8C4DD   |
	LDA [$8E],y				;$B8C4E0   |
	BRA CODE_B8C4E9				;$B8C4E2  /

CODE_B8C4E4:
	LDY #$007E				;$B8C4E4  \
	LDA [$8E],y				;$B8C4E7   |
CODE_B8C4E9:					;	   |
	STA $26,x				;$B8C4E9   |
	RTS					;$B8C4EB  /

stuck_on_honey_floor_right_action:
	LDX current_sprite			;$B8C4EC  \
	LDA $0983				;$B8C4EE   |
	AND #$0100				;$B8C4F1   |
	BNE .right_pressed_this_frame		;$B8C4F4   |
	RTS					;$B8C4F6  /

.right_pressed_this_frame
	JSR set_stuck_on_honey_floor_animation	;$B8C4F7  \
	LDX current_sprite			;$B8C4FA   |
	LDA #$0080				;$B8C4FC   |
	STA $3A,x				;$B8C4FF   |
	RTS					;$B8C501  /

move_enguarde_right_action:
	LDX current_sprite			;$B8C502  \
	LDA #$0200				;$B8C504   |
	STA $26,x				;$B8C507   |
	RTS					;$B8C509  /

wind_float_move_right_action:
	LDX current_sprite			;$B8C50A  \
	LDY #$006C				;$B8C50C   |
	LDA [$8E],y				;$B8C50F   |
	STA $26,x				;$B8C511   |
	RTS					;$B8C513  /

enguarde_on_land_move_right_action:
	LDX current_sprite			;$B8C514  \
	LDA $12,x				;$B8C516   |
	AND #$BFFF				;$B8C518   |
	STA $12,x				;$B8C51B   |
	RTS					;$B8C51D  /

rambi_charge_move_right_action:
	LDX current_sprite			;$B8C51E  \
	LDA $20,x				;$B8C520   |
	DEC A					;$B8C522   |
	BPL CODE_B8C52A				;$B8C523   |
	LDA #$0009				;$B8C525   |
	STA $2E,x				;$B8C528   |
CODE_B8C52A:					;	   |
	RTS					;$B8C52A  /

enguarde_charge_move_right_action:
	LDX current_sprite			;$B8C52B  \
	LDA $20,x				;$B8C52D   |
	BPL .moving_right			;$B8C52F   |
	LDA #$0050				;$B8C531   |
	STA $2E,x				;$B8C534   |
.moving_right					;	   |
	RTS					;$B8C536  /

dismount_animal_action:
	LDA $0983				;$B8C537  \
	AND #$0040				;$B8C53A   |
	BNE .x_pressed_this_frame		;$B8C53D   |
	RTS					;$B8C53F  /

.x_pressed_this_frame
	LDA $6E					;$B8C540  \
	BNE .has_animal				;$B8C542   |
.no_dismount					;	   |
	RTS					;$B8C544  /

.has_animal
	LDX current_player_mount		;$B8C545  \
	BEQ .no_dismount			;$B8C547   |
	CMP #$0198				;$B8C549   |
	BNE .not_squawks			;$B8C54C   |
	LDA $4A,x				;$B8C54E   |
	LSR A					;$B8C550   |
	BCC .no_dismount			;$B8C551   |
.not_squawks					;	   |
	LDA #$0018				;$B8C553   |
	JMP set_player_interaction		;$B8C556  /

CODE_B8C559:
	LDA #$0002				;$B8C559  \
	JMP set_player_interaction		;$B8C55C  /

jump_action:
	LDX current_sprite			;$B8C55F  \
	LDA $0983				;$B8C561   |
	AND #$8000				;$B8C564   |
	BEQ .b_pressed_this_frame		;$B8C567   |
	LDY $66					;$B8C569   |
	LDA global_frame_counter		;$B8C56B   |
	STA $0022,y				;$B8C56D   |
	BRA .jump				;$B8C570  /

.b_pressed_this_frame
	LDY $66					;$B8C572  \
	LDA global_frame_counter		;$B8C574   |
	SEC					;$B8C576   |
	SBC $0022,y				;$B8C577   |
	CMP #$0010				;$B8C57A   |
	BPL .return				;$B8C57D   |
.jump						;	   |
	LDA $40,x				;$B8C57F   |
	AND #$0001				;$B8C581   |
	BNE .return				;$B8C584   |
	LDA $1E,x				;$B8C586   |
	AND #$1010				;$B8C588   |
	BNE start_player_jumping		;$B8C58B   |
	LDA $10,x				;$B8C58D   |\
	AND #$0007				;$B8C58F   | | if slope is too steep dont jump
	CMP $88					;$B8C592   | |
	BPL .too_steep_to_jump			;$B8C594   |/
	BRA start_player_jumping		;$B8C596  /

.too_steep_to_jump
	NOP					;$B8C598  \
	NOP					;$B8C599   |
.return						;	   |
	RTS					;$B8C59A  /

start_player_jumping:
	JSR set_player_jumping_gravity		;$B8C59B  \
	LDY $66					;$B8C59E   |\
	LDA global_frame_counter		;$B8C5A0   | | record the current time
	STA $0012,y				;$B8C5A2   |/ save the time as the last time player jumped
	LDA $0D7A				;$B8C5A5   |
	BNE .holding_sprite			;$B8C5A8   |
	LDA $6E					;$B8C5AA   |
	BNE .has_animal				;$B8C5AC   |
	LDA #$0005				;$B8C5AE   |
	JSL CODE_B9D0B8				;$B8C5B1   |
	RTS					;$B8C5B5  /

.has_animal
	LDX current_sprite			;$B8C5B6  \
	LDA $2E,x				;$B8C5B8   |
	CMP #$004F				;$B8C5BA   |
	BEQ .rambi_charge			;$B8C5BD   |
	LDA #$006D				;$B8C5BF   |
	JSL CODE_B9D08C				;$B8C5C2   |
	RTS					;$B8C5C6  /

.rambi_charge
	LDA $1E,x				;$B8C5C7  \
	LSR A					;$B8C5C9   |
	BCC .not_touching_top_of_tile		;$B8C5CA   |
	JSL CODE_B9DFB2				;$B8C5CC   |
	LDA #$0072				;$B8C5D0   |
	JSL CODE_B9D08C				;$B8C5D3   |
.not_touching_top_of_tile			;	   |
	RTS					;$B8C5D7  /

.holding_sprite
	CMP inactive_kong_sprite		;$B8C5D8  \
	BEQ .holding_kong			;$B8C5DB   |
	LDA #$0015				;$B8C5DD   |
	JSL CODE_B9D0B8				;$B8C5E0   |
	RTS					;$B8C5E4  /

.holding_kong
	LDA #$0021				;$B8C5E5  \
	JSL CODE_B9D0B8				;$B8C5E8   |
	JSR work_on_inactive_kong		;$B8C5EC   |
	LDA #$0020				;$B8C5EF   |
	JSL CODE_B9D0B8				;$B8C5F2   |
	JSR work_on_active_kong			;$B8C5F6   |
	RTS					;$B8C5F9  /

update_b_press_event_action:
	LDA $0983				;$B8C5FA  \ \
	AND #$8000				;$B8C5FD   | | if b wasnt pressed do nothing and return
	BEQ .no_b_press				;$B8C600   |/
	LDY $66					;$B8C602   |\
	LDA global_frame_counter		;$B8C604   | | if b was pressed this frame record the current time
	STA $0022,y				;$B8C606   |/ save the time as the last time b was pressed
.no_b_press					;	   |
	RTS					;$B8C609  /

squawks_fly_up_action:
	LDX current_sprite			;$B8C60A  \
	LDA $0983				;$B8C60C   |\
	AND #$8000				;$B8C60F   | | if b wasnt pressed this frame return
	BEQ .return				;$B8C612   |/
	STZ $32					;$B8C614   |
	LDA $0981				;$B8C616   |\
	AND #$0800				;$B8C619   | |
	BEQ .no_up_press			;$B8C61C   | | if up is held boost ascent velocity by 0x100
	LDA #$0100				;$B8C61E   | |
	STA $32					;$B8C621   |/ store ascent boost to scratch
.no_up_press					;	   |
	JSR .get_squawks_ascend_speed		;$B8C623   |\ get ascend velocity
	SEC					;$B8C626   | |
	SBC $32					;$B8C627   | | add boost to velocity
	STA $24,x				;$B8C629   |/ update y velocity of squawks
	LDA $40,x				;$B8C62B   |
	AND #$0008				;$B8C62D   |
	BNE .return				;$B8C630   |
	LDA $32					;$B8C632   |\ get ascent boost
	CLC					;$B8C634   | |
	ADC #$0340				;$B8C635   | | add animation speed boost
	STA $3A,x				;$B8C638   |/ increase animation speed
	LDA #$0530				;$B8C63A   |\
	JSL queue_sound_effect			;$B8C63D   |/ queue squawks flap sound effect
.return						;	   |
	RTS					;$B8C641  /

.get_squawks_ascend_speed
	LDA current_player_mount		;$B8C642  \
	BEQ .is_animal				;$B8C644   |
.slower_ascent					;	   |
	LDY #$00C6				;$B8C646   |\
	LDA [$8E],y				;$B8C649   | | return slower ascent velocity
	RTS					;$B8C64B  / /

.is_animal
	LDA $08A8				;$B8C64C  \ \
	CMP #$0062				;$B8C64F   | | if level is castle crush
	BEQ .slower_ascent			;$B8C652   |/ use slower upward velocity when flying up
	LDY #$0084				;$B8C654   |\
	LDA [$8E],y				;$B8C657   | | return faster ascent velocity
	RTS					;$B8C659  / /

jump_off_vertical_rope_action:
	LDA $0981				;$B8C65A  \ \
	AND #$0300				;$B8C65D   | | if no direction is held start climbing rope
	BEQ .no_left_right_held			;$B8C660   |/
	LDA $0983				;$B8C662   |\
	AND #$8000				;$B8C665   | | otherwise if b was pressed this frame
	BNE .jump_from_rope			;$B8C668   |/ start jumping off rope
.return						;	   |
	RTS					;$B8C66A  /

.no_left_right_held
	LDA $0981				;$B8C66B  \ \
	AND #$0C00				;$B8C66E   | | if up or down is held dont climb using b
	BNE .return				;$B8C671   |/
	JMP climb_up_single_rope_action		;$B8C673  / > otherwise climb up from pressing b

.jump_from_rope
	JSR set_player_terminal_velocity	;$B8C676  \
	JSL CODE_B5E43E				;$B8C679   |
	JSR start_player_jumping		;$B8C67D   |
	LDA #$0002				;$B8C680   |
	STA $09A1				;$B8C683   |
	LDX current_sprite			;$B8C686   |
	LDA $26,x				;$B8C688   |
	STA $20,x				;$B8C68A   |
	LDA $0981				;$B8C68C   |\
	AND #$0100				;$B8C68F   | | if right is being pressed jump
	BNE .jump_right				;$B8C692   |/ face player to the right
	LDA #$4000				;$B8C694   |\
	ORA $12,x				;$B8C697   | | otherwise face player to the left
	STA $12,x				;$B8C699   |/
	RTS					;$B8C69B  /

.jump_right
	LDA #$BFFF				;$B8C69C  \ \
	AND $12,x				;$B8C69F   | | face player to the right
	STA $12,x				;$B8C6A1   |/
	RTS					;$B8C6A3  /

vertical_double_rope_b_action:
	RTS					;$B8C6A4  /

jump_off_horizontal_rope_action:
	LDA $0983				;$B8C6A5  \
	AND #$8000				;$B8C6A8   |
	BNE .b_pressed_this_frame		;$B8C6AB   |
	RTS					;$B8C6AD  /

.b_pressed_this_frame
	LDX current_sprite			;$B8C6AE  \
	STZ $20,x				;$B8C6B0   |
	LDA $0981				;$B8C6B2   |
	AND #$0400				;$B8C6B5   |
	BNE .down_pressed			;$B8C6B8   |
	LDY #$0008				;$B8C6BA   |\
	LDA [$8E],y				;$B8C6BD   | | update jump velocity
	STA $24,x				;$B8C6BF   |/
	LDA #$006E				;$B8C6C1   |\
	STA $2E,x				;$B8C6C4   |/ set kong behavior to jumping up from horizontal rope
	LDA #$0006				;$B8C6C6   |\
	JSL CODE_B9D0B8				;$B8C6C9   |/ set kong animation
	JSR set_player_terminal_velocity	;$B8C6CD   |
	JSR set_player_jumping_gravity		;$B8C6D0   |
	JSL CODE_B5E43E				;$B8C6D3   |
	LDA #$0001				;$B8C6D7   |
	TSB $08C4				;$B8C6DA   |
	RTS					;$B8C6DD  /

.down_pressed
	LDA #$FD00				;$B8C6DE  \ \
	STA $24,x				;$B8C6E1   |/ set y velocity for kong
	LDA #$006D				;$B8C6E3   |\
	STA $2E,x				;$B8C6E6   |/ set kong behavior to jumping down from horizontal rope
	LDA #$0010				;$B8C6E8   |
	STA $42,x				;$B8C6EB   |
	LDA #$0006				;$B8C6ED   |\
	JSL CODE_B9D0B8				;$B8C6F0   |/ set kong animation
	JSR set_player_terminal_velocity	;$B8C6F4   |
	JSR set_player_normal_gravity		;$B8C6F7   |
	JSL CODE_B5E43E				;$B8C6FA   |
	LDA #$0001				;$B8C6FE   |
	TSB $08C4				;$B8C701   |
	RTS					;$B8C704  /

jump_off_hook_action:
	LDA $0983				;$B8C705  \
	AND #$8000				;$B8C708   |
	BNE .b_pressed_this_frame		;$B8C70B   |
	RTS					;$B8C70D  /

.b_pressed_this_frame
	STZ $0D82				;$B8C70E  \
	LDX current_sprite			;$B8C711   |
	LDA $0A,x				;$B8C713   |
	CLC					;$B8C715   |
	ADC #$0020				;$B8C716   |
	STA $0A,x				;$B8C719   |
	STZ $20,x				;$B8C71B   |
	LDA $0981				;$B8C71D   |
	AND #$0400				;$B8C720   |
	BNE .down_pressed			;$B8C723   |
	LDX current_sprite			;$B8C725   |
	LDY #$0008				;$B8C727   |
	LDA [$8E],y				;$B8C72A   |
	STA $24,x				;$B8C72C   |
	LDA #$0006				;$B8C72E   |
	STA $2E,x				;$B8C731   |
	LDA #$0006				;$B8C733   |
	JSL CODE_B9D0B8				;$B8C736   |
	JSR set_player_terminal_velocity	;$B8C73A   |
	JSR set_player_jumping_gravity		;$B8C73D   |
	JSL CODE_B5E43E				;$B8C740   |
	LDA #$0001				;$B8C744   |
	TSB $08C4				;$B8C747   |
	RTS					;$B8C74A  /

.down_pressed
	LDX current_sprite			;$B8C74B  \
	LDA #$FD00				;$B8C74D   |
	STA $24,x				;$B8C750   |
	LDA #$0039				;$B8C752   |
	STA $2E,x				;$B8C755   |
	LDA #$0006				;$B8C757   |
	JSL CODE_B9D0B8				;$B8C75A   |
	JSR set_player_terminal_velocity	;$B8C75E   |
	JSR set_player_normal_gravity		;$B8C761   |
	JSL CODE_B5E43E				;$B8C764   |
	LDA #$0001				;$B8C768   |
	TSB $08C4				;$B8C76B   |
	RTS					;$B8C76E  /

swim_up_action:
	LDA $0983				;$B8C76F  \
	AND #$8000				;$B8C772   |
	BNE .b_pressed_this_frame		;$B8C775   |
	RTS					;$B8C777  /

.b_pressed_this_frame
	JSR check_sprite_underwater		;$B8C778  \
	CMP #$0002				;$B8C77B   |
	BMI .jump_out_of_water			;$B8C77E   |
	LDA #$056B				;$B8C780   |\
	JSL queue_sound_effect			;$B8C783   |/ queue swim sound effect
	LDX current_sprite			;$B8C787   |
	JSR .get_swim_constant_offset		;$B8C789   |
	LDA [$8E],y				;$B8C78C   |\ set player y velocity
	STA $24,x				;$B8C78E   |/
	LDA current_player_mount		;$B8C790   |
	BNE .return				;$B8C792   |
	LDA #$0300				;$B8C794   |
	STA $3A,x				;$B8C797   |
.return						;	   |
	RTS					;$B8C799  /

.jump_out_of_water
	LDX current_sprite			;$B8C79A  \
	LDY #$0008				;$B8C79C   |
	LDA [$8E],y				;$B8C79F   |
	STA $24,x				;$B8C7A1   |
	LDA #$0006				;$B8C7A3   |
	STA $2E,x				;$B8C7A6   |
	LDA #$0006				;$B8C7A8   |
	JSL CODE_B9D0B8				;$B8C7AB   |
	JSR set_player_terminal_velocity	;$B8C7AF   |
	JSR set_player_jumping_gravity		;$B8C7B2   |
	JSL CODE_B5E43E				;$B8C7B5   |
	LDA #$0001				;$B8C7B9   |
	TSB $08C4				;$B8C7BC   |
	RTS					;$B8C7BF  /

.get_swim_constant_offset
	LDA $0981				;$B8C7C0  \
	AND #$0C00				;$B8C7C3   |
	BNE .up_or_down_pressed			;$B8C7C6   |
	LDY #$0070				;$B8C7C8   |
	RTS					;$B8C7CB  /

.up_or_down_pressed
	AND #$0800				;$B8C7CC  \
	BNE .up_pressed				;$B8C7CF   |
	LDY #$0074				;$B8C7D1   |
	RTS					;$B8C7D4  /

.up_pressed
	LDY #$0072				;$B8C7D5  \
	RTS					;$B8C7D8  /

jump_off_honey_wall_action:
	LDA $0983				;$B8C7D9  \
	AND #$8000				;$B8C7DC   |
	BNE .b_pressed_this_frame		;$B8C7DF   |
.return						;	   |
	RTS					;$B8C7E1  /

.b_pressed_this_frame
	JSR get_honey_wall_jump_direction	;$B8C7E2  \
	BEQ .return				;$B8C7E5   |
	JSR .get_honey_wall_x_velocity		;$B8C7E7   |
	STA $26,x				;$B8C7EA   |
	STA $20,x				;$B8C7EC   |
	LDX current_sprite			;$B8C7EE   |
	LDY #$0008				;$B8C7F0   |
	LDA [$8E],y				;$B8C7F3   |
	STA $24,x				;$B8C7F5   |
	LDA #$0042				;$B8C7F7   |
	STA $2E,x				;$B8C7FA   |
	LDA $12,x				;$B8C7FC   |
	EOR #$4000				;$B8C7FE   |
	STA $12,x				;$B8C801   |
	LDA #$0006				;$B8C803   |
	JSL CODE_B9D0B8				;$B8C806   |
	JSR set_player_terminal_velocity	;$B8C80A   |
	JSR set_player_jumping_gravity		;$B8C80D   |
	JSL CODE_B5E43E				;$B8C810   |
	LDA #$0001				;$B8C814   |
	TSB $08C4				;$B8C817   |
	RTS					;$B8C81A  /

.get_honey_wall_x_velocity
	LDY #$000E				;$B8C81B  \
	LDA [$8E],y				;$B8C81E   |
	LDX current_sprite			;$B8C820   |
	BIT $12,x				;$B8C822   |
	BVC .invert_x_velocity			;$B8C824   |
	RTS					;$B8C826  /

.invert_x_velocity
	EOR #$FFFF				;$B8C827  \
	INC A					;$B8C82A   |
	RTS					;$B8C82B  /

get_honey_wall_jump_direction:
	LDA $0981				;$B8C82C  \
	LDX current_sprite			;$B8C82F   |
	BIT $12,x				;$B8C831   |
	BVS .jump_right				;$B8C833   |
	AND #$0200				;$B8C835   |
	RTS					;$B8C838  /

.jump_right
	AND #$0100				;$B8C839  \
	RTS					;$B8C83C  /

team_up_action:
	LDX current_sprite			;$B8C83D  \
	LDA $0983				;$B8C83F   |
	AND #$0080				;$B8C842   |
	BEQ .return				;$B8C845   |
	LDA $0D7A				;$B8C847   |
	BEQ .not_teamed_yet			;$B8C84A   |
	CMP inactive_kong_sprite		;$B8C84C   |
	BEQ .is_holding_kong			;$B8C84F   |
.return						;	   |
	RTS					;$B8C851  /

.is_holding_kong
	LDX current_sprite			;$B8C852  \
	LDA $2E,x				;$B8C854   |
	CMP #$0017				;$B8C856   |
	BNE .return				;$B8C859   |
	LDA #$0006				;$B8C85B   |
	JMP set_player_interaction		;$B8C85E  /

.not_teamed_yet
	LDY inactive_kong_sprite		;$B8C861  \
	LDA $002E,y				;$B8C864   |
	CMP #$002A				;$B8C867   |
	BEQ .follower_kong_following		;$B8C86A   |
	CMP #$0022				;$B8C86C   |
	BNE .return				;$B8C86F   |
.follower_kong_following			;	   |
	JSR check_if_player_has_both_kongs	;$B8C871   |
	BCS .return				;$B8C874   |
	LDA #$0004				;$B8C876   |
	JMP set_player_interaction		;$B8C879  /

check_if_player_has_both_kongs:
	LDA $08C2				;$B8C87C  \
	AND #$4000				;$B8C87F   |
	BEQ CODE_B8C88E				;$B8C882   |
if !version == 1				;	   |
	LDA #$0002				;$B8C884   |
	BIT $08C4				;$B8C887   |
	BNE CODE_B8C88E				;$B8C88A   |
endif						;	   |
	CLC					;$B8C88C   |
	RTS					;$B8C88D  /

CODE_B8C88E:
	SEC					;$B8C88E  \
	RTS					;$B8C88F  /

animal_special_action:
	LDA $6E					;$B8C890  \ \
	CMP #$0194				;$B8C892   | | if animal is rattly start rattly super jump charge
	BEQ .rattly				;$B8C895   |/
	LDA $0983				;$B8C897   |\
	AND #$0080				;$B8C89A   | | if a was pressed this frame initialize special ability
	BNE .a_pressed_this_frame		;$B8C89D   |/
	LDA $6E					;$B8C89F   |
	CMP #$0190				;$B8C8A1   |
	BEQ .squitter_dont_shoot_platform	;$B8C8A4   |
	RTS					;$B8C8A6  /

.squitter_dont_shoot_platform
	RTS					;$B8C8A7  /

.rattly
	LDX current_sprite			;$B8C8A8  \
	LDA $1E,x				;$B8C8AA   |
	AND #$0001				;$B8C8AC   |
	BEQ .return				;$B8C8AF   |
	LDA $2E,x				;$B8C8B1   |
	CMP #$0061				;$B8C8B3   |
	BEQ .return				;$B8C8B6   |
	STZ $26,x				;$B8C8B8   |
	STZ $20,x				;$B8C8BA   |
	LDA #$0061				;$B8C8BC   |
	STA $2E,x				;$B8C8BF   |
	LDA #$0086				;$B8C8C1   |
	JSL CODE_B9D08C				;$B8C8C4   |
	RTS					;$B8C8C8  /

.a_pressed_this_frame
	LDX current_sprite			;$B8C8C9  \
	LDA $6E					;$B8C8CB   |
	CMP #$019C				;$B8C8CD   |
	BEQ .rambi				;$B8C8D0   |
	CMP #$01A0				;$B8C8D2   |
	BEQ .enguarde				;$B8C8D5   |
	CMP #$0190				;$B8C8D7   |
	BEQ .squitter				;$B8C8DA   |
.return						;	   |
	RTS					;$B8C8DC  /

.squitter
	JMP shoot_web_platform			;$B8C8DD  /

.rambi
	STZ $26,x				;$B8C8E0  \ \ cancel players horizontal velocity
	STZ $20,x				;$B8C8E2   |/
	LDA $1E,x				;$B8C8E4   |\
	AND #$0001				;$B8C8E6   | | if player isn't standing on ground return
	BEQ .return				;$B8C8E9   |/
	LDA #$0053				;$B8C8EB   |\
	STA $2E,x				;$B8C8EE   |/ set kong behavior to rambi charge start
	LDA #$0086				;$B8C8F0   |\
	JSL CODE_B9D08C				;$B8C8F3   |/ set animation to rambi charging start
	RTS					;$B8C8F7  /

.enguarde
	STZ $26,x				;$B8C8F8  \ \
	STZ $20,x				;$B8C8FA   | | stop player moving
	STZ $2A,x				;$B8C8FC   | |
	STZ $24,x				;$B8C8FE   |/
	LDA #$0054				;$B8C900   |\
	STA $2E,x				;$B8C903   |/ set kong behavior to enguarde charge start
	LDA #$0086				;$B8C905   |\
	JSL CODE_B9D08C				;$B8C908   |/ set animation to enguarde charging start
	RTS					;$B8C90C  /

shoot_web_platform:
	STZ $26,x				;$B8C90D  \ \ cancel players horizontal velocity
	STZ $20,x				;$B8C90F   |/
	LDY $66					;$B8C911   |> get control variables of player
	LDA #$0040				;$B8C913   |\
	TRB $0B02				;$B8C916   | | check if a web platform is already being shot
	BEQ .shoot_new_platform			;$B8C919   |/ if not shoot a new platform
	RTS					;$B8C91B  /

.shoot_new_platform
	LDA $0B02				;$B8C91C  \
	AND #$0080				;$B8C91F   |
	BNE .return				;$B8C922   |
	LDY $66					;$B8C924   |
	LDA global_frame_counter		;$B8C926   |\
	SEC					;$B8C928   | | check how long since last platform shot
	SBC $19A4				;$B8C929   |/
	STA $32					;$B8C92C   |\
	LDA #$000C				;$B8C92E   | | check if enough time has passed since last shot
	CMP $32					;$B8C931   | |
	BCS .return				;$B8C933   |/
	LDA global_frame_counter		;$B8C935   |\ if enough time has passed
	STA $19A4				;$B8C937   | | update the last shot time to the current time
	JSR scan_for_web_platforms		;$B8C93A   |/ scan for existing web platforms
	CMP #$0002				;$B8C93D   |\ if we have less than 3 web platforms
	BMI .less_than_max_platforms		;$B8C940   |/ we're ok to spawn more platforms
	LDX $36					;$B8C942   |\ get oldest web platform
	LDA #$0001				;$B8C944   | | otherwise flag the oldest platform to despawn
	STA $44,x				;$B8C947   |/ before we spawn a new one
.less_than_max_platforms			;	   |
	LDY #$0098				;$B8C949   |\ spawn new platform sprite
	JSL CODE_BB842C				;$B8C94C   |/
	BCS .spawn_done				;$B8C950   |
	LDA #$0040				;$B8C952   |\ flag platform state as being shot
	TSB $0B02				;$B8C955   |/
	LDA #$02D6				;$B8C958   |\ play platform spawning animation
	JSL CODE_B9D09B				;$B8C95B   |/
	LDA #$0547				;$B8C95F   |\ queue platform shoot sound
	JSL queue_sound_effect			;$B8C962   |/
	JSR .set_platform_velocity		;$B8C966   |
.return						;	   |
	RTS					;$B8C969  /

.set_platform_velocity
	LDY #$0092				;$B8C96A  \ \
	LDA [$8E],y				;$B8C96D   |/ load web platform x velocity constant
	LDX current_sprite			;$B8C96F   |\
	BIT $12,x				;$B8C971   | | check if player is facing right
	BVC .no_flip				;$B8C973   |/
	EOR #$FFFF				;$B8C975   |\ if not invert x velocity of the platform
	INC A					;$B8C978   |/
.no_flip						;	   |
	LDX alternate_sprite			;$B8C979   |\
	STA $20,x				;$B8C97B   | | store platform x velocity
	LDA $0981				;$B8C97D   |/
	AND #$0C00				;$B8C980   |\ if no vertical direction is pressed
	BEQ .return				;$B8C983   |/ shoot platform with no y velocity
	AND #$0800				;$B8C985   |\ if up is pressed
	BEQ .shot_upwards			;$B8C988   |/ make web platform move up
	LDY #$0094				;$B8C98A   |\
	LDA [$8E],y				;$B8C98D   | | otherwise make platform move down
	STA $48,x				;$B8C98F   |/
	RTS					;$B8C991  /

.shot_upwards
	LDY #$0096				;$B8C992  \
	LDA [$8E],y				;$B8C995   |
	STA $48,x				;$B8C997   |
.spawn_done					;	   |
	RTS					;$B8C999  /


;scratch ram usage:
;$32	number of web platforms in sprite table
;$34	oldest platform lifetime
;$36	oldest platform sprite

scan_for_web_platforms:
	LDX #main_sprite_table			;$B8C99A  \
	STZ $32					;$B8C99D   |\
	STZ $34					;$B8C99F   | | clear part of scratch we're going to use
	STZ $36					;$B8C9A1   |/
.scan_for_platform				;	   |
	LDA $00,x				;$B8C9A3   |\
	CMP #$0118				;$B8C9A5   | | check if sprite is web platform
	BNE .next_slot				;$B8C9A8   |/ if not skip to next sprite slot
	INC $32					;$B8C9AA   |> increment web platform count
	LDA $44,x				;$B8C9AC   |\ if platform is despawning dont store lifetime counter
	BNE .next_slot				;$B8C9AE   |/
	LDA $42,x				;$B8C9B0   |\
	CMP $34					;$B8C9B2   | | if this platform is newer than our previous lifetime
	BMI .next_slot				;$B8C9B4   |/ dont save its life time and skip to next sprite slot
	STA $34					;$B8C9B6   |\ otherwise save the lifetime of the oldest platform
	STX $36					;$B8C9B8   |/ save slot of oldest platform
.next_slot					;	   |
	TXA					;$B8C9BA   |\
	CLC					;$B8C9BB   | | move to next sprite slot
	ADC #sizeof(sprite)			;$B8C9BC   |/
	TAX					;$B8C9BF   |\
	CPX #main_sprite_table_end		;$B8C9C0   | | check if we reached the end of the sprite table
	BNE .scan_for_platform			;$B8C9C3   |/
	LDA $32					;$B8C9C5   |\ if we reached the end of the sprite table
	RTS					;$B8C9C7  / / return the number of web platforms found

roll_or_pickup_object_action:
	JSR set_fast_move_if_left_right		;$B8C9C8  \
	JSR update_object_pickup		;$B8C9CB   |\
	BCS .return				;$B8C9CE   |/ if an object was picked up dont roll
	LDX current_sprite			;$B8C9D0   |\
	LDA $0A,x				;$B8C9D2   | |
	SEC					;$B8C9D4   | | if the player is too far from the ground dont roll
	SBC $0C,x				;$B8C9D5   | |
	BMI .return				;$B8C9D7   |/
	LDA $40,x				;$B8C9D9   |
	AND #$0002				;$B8C9DB   |
	BNE .return				;$B8C9DE   |
	LDA $0983				;$B8C9E0   |\
	AND #$4000				;$B8C9E3   | | if y was pressed this frame start roll
	BNE .start_roll				;$B8C9E6   |/
	LDY $66					;$B8C9E8   |\
	LDA global_frame_counter		;$B8C9EA   | |
	SEC					;$B8C9EC   | | check if enough has has elapsed since last roll
	SBC $001A,y				;$B8C9ED   | |
	CMP #$000C				;$B8C9F0   | |
	BPL .return				;$B8C9F3   |/ if not dont roll
	BRA .start_roll				;$B8C9F5  /> otherwise start roll

.return
	RTS					;$B8C9F7  /

.start_roll
	JSR start_player_roll			;$B8C9F8  \
	LDY $66					;$B8C9FB   |\
	LDA $001A,y				;$B8C9FD   | | update last Y press time to now
	STA $0010,y				;$B8CA00   |/  update last roll time to now
	JSR apply_roll_animation		;$B8CA03   |
	RTS					;$B8CA06  /

apply_roll_animation:
	LDX current_sprite			;$B8CA07  \
	LDA #$0001				;$B8CA09   |
	STA $24,x				;$B8CA0C   |
	LDA #$0009				;$B8CA0E   |
	JSL CODE_B9D0B8				;$B8CA11   |
	RTS					;$B8CA15  /

glide_action:
	JSR set_fast_move_if_left_right		;$B8CA16  \
	LDX current_sprite			;$B8CA19   |\
	LDA $36,x				;$B8CA1B   | |
	CMP #$00AE				;$B8CA1D   | | check if player animation is dixie glide
	BNE .not_already_gliding		;$B8CA20   |/
	RTS					;$B8CA22  / > already playing glide animation dont glide

.not_already_gliding
	LDA $24,x				;$B8CA23  \ \
	BPL .moving_down			;$B8CA25   |/ check if player has positive y velocity
	RTS					;$B8CA27  / > not moving down dont glide

.moving_down
	LDA $2E,x				;$B8CA28  \ \
	CMP #$0006				;$B8CA2A   | | check for kong jumping behavior
	BEQ .is_jumping				;$B8CA2D   |/
	RTS					;$B8CA2F  / > not jumping dont glide

.is_jumping
	LDA $0C,x				;$B8CA30  \ \
	SEC					;$B8CA32   | |
	SBC $0A,x				;$B8CA33   | |
	BMI .can_glide				;$B8CA35   | | check if player is far enough from ground to glide
	CMP #$0018				;$B8CA37   | |
	BPL .can_glide				;$B8CA3A   |/
	RTS					;$B8CA3C  / > too close to ground dont glide

.can_glide
	LDX $66					;$B8CA3D  \
	CPX #$16D8				;$B8CA3F   |
	BEQ .is_dixie				;$B8CA42   |
	RTS					;$B8CA44  / > not dixie dont glide

.is_dixie
	LDA global_frame_counter		;$B8CA45  \ \
	SEC					;$B8CA47   | |
	SBC $1A,x				;$B8CA48   | | check if enough has has elapsed since last glide
	CMP #$0010				;$B8CA4A   | |
	BCC .start_glide			;$B8CA4D   |/
	RTS					;$B8CA4F  / > still on cooldown dont glide

.start_glide
	LDY #$002E				;$B8CA50  \
	LDA [$8E],y				;$B8CA53   |
	STA $0A,x				;$B8CA55   |
	LDX current_sprite			;$B8CA57   |
	LDY #$0030				;$B8CA59   |
	LDA [$8E],y				;$B8CA5C   |
	STA $24,x				;$B8CA5E   |
	LDA #$000B				;$B8CA60   |
	JSL CODE_B9D0B8				;$B8CA63   |
	RTS					;$B8CA67  /

update_roll_action:
	JSR update_object_pickup		;$B8CA68  \ \
	BCS .return				;$B8CA6B   |/ if an object was picked up return
	LDA $0983				;$B8CA6D   |\
	AND #$4000				;$B8CA70   | | if y wasnt pressed this frame update fast move and return
	BEQ .update_fast_move			;$B8CA73   |/
	LDX current_sprite			;$B8CA75   |\
	LDA $2E,x				;$B8CA77   | |
	CMP #$0019				;$B8CA79   | | if player is rolling through an enemy update fast move and return
	BEQ .update_fast_move			;$B8CA7C   |/
	LDA #$0003				;$B8CA7E   |\
	STA $2E,x				;$B8CA81   |/ otherwise set kong behavior to fast roll
.update_fast_move				;	   |
	JSR set_fast_move_if_left_right		;$B8CA83   |
.return						;	   |
	RTS					;$B8CA86  /

land_animal_attack_action:
	JSR set_fast_move_if_left_right		;$B8CA87  \
	LDA $0983				;$B8CA8A   |
	AND #$4000				;$B8CA8D   |
	BNE .y_pressed_this_frame		;$B8CA90   |
.return						;	   |
	RTS					;$B8CA92  /

.y_pressed_this_frame
	LDA $6E					;$B8CA93  \ \
	CMP #$019C				;$B8CA95   | |
	BEQ start_rambi_attack			;$B8CA98   |/
	CMP #$0190				;$B8CA9A   |\
	BNE .return				;$B8CA9D   |/
	LDY $66					;$B8CA9F   |> get kong control variables address
	LDA global_frame_counter		;$B8CAA1   |\
	SEC					;$B8CAA3   | |
	SBC $19A2				;$B8CAA4   | | get time since last web shot
	STA $32					;$B8CAA7   |/
	LDY #$0088				;$B8CAA9   |\
	LDA [$8E],y				;$B8CAAC   |/ get web shot cooldown time
	CMP $32					;$B8CAAE   |\
	BCS .return				;$B8CAB0   |/ if not enough time has past since last shot dont shoot
	LDA global_frame_counter		;$B8CAB2   |\
	STA $19A2				;$B8CAB4   |/ update last shot time to now
	LDY #$008A				;$B8CAB7   |\
	LDA [$8E],y				;$B8CABA   | |
	DEC A					;$B8CABC   | |
	CMP $19A6				;$B8CABD   | | if too many web shots already exist dont shoot a new one
	BMI .return				;$B8CAC0   |/
	LDY.w #DATA_FF1B06			;$B8CAC2   |\ spawn new web shot sprite
	JSL CODE_BB8432				;$B8CAC5   |/
	BCS .return				;$B8CAC9   |> if spawn failed return
	INC $19A6				;$B8CACB   |> increase number of shots that exist by 1
	LDA #$0546				;$B8CACE   |\
	JSL queue_sound_effect			;$B8CAD1   |/ queue web shot sound effect
	LDY #$008C				;$B8CAD5   |\
	LDA [$8E],y				;$B8CAD8   |/ get x velocity constant of web shot
	LDX current_sprite			;$B8CADA   |\ check if we need to invert the x velocity
	BIT $12,x				;$B8CADC   | | depending on the players facing direction
	BVC .facing_right			;$B8CADE   |/
	EOR #$FFFF				;$B8CAE0   |\ invert velocity
	INC A					;$B8CAE3   |/
.facing_right					;	   |
	LDX alternate_sprite			;$B8CAE4   |\ get web shot sprite
	STA $20,x				;$B8CAE6   |/ and set its x velocity
	LDA $0981				;$B8CAE8   |\
	AND #$0C00				;$B8CAEB   | | check if up or down is held
	BEQ .return				;$B8CAEE   |/ if not we're done initializing the web
	AND #$0800				;$B8CAF0   |\
	BEQ .up_pressed				;$B8CAF3   |/ if up is pressed apply upward velocity to web
	LDY #$008E				;$B8CAF5   |\
	LDA [$8E],y				;$B8CAF8   | | apply downward y velocity to web
	STA $48,x				;$B8CAFA   |/
	RTS					;$B8CAFC  /

.up_pressed
	LDY #$0090				;$B8CAFD  \ \
	LDA [$8E],y				;$B8CB00   | | apply upward y velocity to web
	STA $48,x				;$B8CB02   |/
	RTS					;$B8CB04  /

start_rambi_attack:
	LDY $66					;$B8CB05  \ \
	LDA $0000,y				;$B8CB07   | |
	CMP #$008E				;$B8CB0A   | | if rambi isnt already attacking start a new attack
	BNE .not_already_attacking		;$B8CB0D   |/
	LDA #$0001				;$B8CB0F   |
	TSB $0B02				;$B8CB12   |
	RTS					;$B8CB15  /

.not_already_attacking
	LDX current_sprite			;$B8CB16  \
	LDA #$0057				;$B8CB18   |\
	STA $2E,x				;$B8CB1B   |/ set kong behavior to animal attack
	LDA #$008B				;$B8CB1D   |\
	JSL CODE_B9D08C				;$B8CB20   |/ set attack animation
	LDX current_sprite			;$B8CB24   |\
	LDA $26,x				;$B8CB26   | | if the player has no target x velocity we're done
	BEQ .no_target_x_velocity		;$B8CB28   |/
	LSR A					;$B8CB2A   |\
	EOR $12,x				;$B8CB2B   | |
	AND #$4000				;$B8CB2D   | | otherwise make the player face their target x direction
	EOR $12,x				;$B8CB30   | |
	STA $12,x				;$B8CB32   |/
.no_target_x_velocity				;	   |
	RTS					;$B8CB34  /

squawks_shoot_action:
	JSR set_fast_move_if_left_right		;$B8CB35  \
	LDA $0983				;$B8CB38   |
	AND #$4000				;$B8CB3B   |
	BNE .y_pressed_this_frame		;$B8CB3E   |
	RTS					;$B8CB40  /

.y_pressed_this_frame
	LDX current_sprite			;$B8CB41  \
	LDY $66					;$B8CB43   |
	LDA $0000,y				;$B8CB45   |\
	CMP #$0088				;$B8CB48   | |
	BEQ .squawks_already_shooting		;$B8CB4B   | | if squawks is already shooting return
	CMP #$008D				;$B8CB4D   | |
	BEQ .squawks_already_shooting		;$B8CB50   |/
	LDA #$0086				;$B8CB52   |\
	JSL CODE_B9D08C				;$B8CB55   |/ otherwise set squawks shooting animation
	RTS					;$B8CB59  /

.squawks_already_shooting
	LDA $0B02				;$B8CB5A  \
	ORA #$0001				;$B8CB5D   |
	STA $0B02				;$B8CB60   |
	RTS					;$B8CB63  /

shot_from_cannon_move_faster_action:
	JSR set_fast_move_if_left_right		;$B8CB64  \
	RTS					;$B8CB67  /

team_throw_action:
	LDA $0983				;$B8CB68  \
	AND #$4000				;$B8CB6B   |
	BNE .y_pressed_this_frame		;$B8CB6E   |
	RTS					;$B8CB70  /

.y_pressed_this_frame
	LDX current_sprite			;$B8CB71  \ \
	LDA #$0023				;$B8CB73   | | set kong behavior to team throwing
	STA $2E,x				;$B8CB76   |/
	LDA #$0026				;$B8CB78   |\ set team throw animation
	JSL CODE_B9D0B8				;$B8CB7B   |/
	RTS					;$B8CB7F  /

enable_fast_move_from_y_action:
	LDY $66					;$B8CB80  \ \
	LDA $0006,y				;$B8CB82   | |
	ORA #$0004				;$B8CB85   | | enable fast move flag for player kong
	STA $0006,y				;$B8CB88   |/
	RTS					;$B8CB8B  /

update_object_pickup:
	LDX current_sprite			;$B8CB8C  \
	LDA $1E,x				;$B8CB8E   |
	AND #$0001				;$B8CB90   |
	BNE .touching_ground			;$B8CB93   |
.return:					;	   |
	CLC					;$B8CB95   |\ indicate that no object pickup has occurred
	RTS					;$B8CB96  / /

.touching_ground
	LDY inactive_kong_sprite		;$B8CB97  \ \
	LDA $002E,y				;$B8CB9A   | |
	CMP #$001F				;$B8CB9D   | |
	BEQ .return				;$B8CBA0   | | if team throw is happening stop checking for object to pick up
	CMP #$0040				;$B8CBA2   | |
	BEQ .return				;$B8CBA5   |/  if team up is happening stop checking for object to pick up
	LDA #$0000				;$B8CBA7   |\
	JSL CODE_BCFB69				;$B8CBAA   | |
	LDA #$0001				;$B8CBAE   | | check if carryable object is near player using custom hitbox
	JSL CODE_BCFE0A				;$B8CBB1   | |
	BCC .return				;$B8CBB5   |/
	LDX $6A					;$B8CBB7   |\
	LDA $1E,x				;$B8CBB9   | |
	AND #$1001				;$B8CBBB   | | if the object isnt on the ground return
	BEQ .return				;$B8CBBE   |/
	STX $0D7A				;$B8CBC0   |> update object near player to object player is holding
	LDA $30,x				;$B8CBC3   |
	AND #$FFFE				;$B8CBC5   |
	STA $30,x				;$B8CBC8   |
	LDA #$0001				;$B8CBCA   |
	STA $32,x				;$B8CBCD   |
	STZ $1E,x				;$B8CBCF   |
	LDY current_sprite			;$B8CBD1   |\ 
	LDA $0012,y				;$B8CBD3   | |
	AND #$4000				;$B8CBD6   | | handle object distance calculation
	BNE .facing_left			;$B8CBD9   |/ if player is facing left
	LDA $06,x				;$B8CBDB   |\
	SEC					;$B8CBDD   | | get x distance between player and newly held object
	SBC $0006,y				;$B8CBDE   |/
	BRA .continue_distance_check		;$B8CBE1  /

.facing_left
	LDA $0006,y				;$B8CBE3  \ \
	SEC					;$B8CBE6   | | get x distance between player and newly held object
	SBC $06,x				;$B8CBE7   |/
.continue_distance_check			;	   |
	STA $0D7C				;$B8CBE9   |> store x distance from held object
	LDA $0A,x				;$B8CBEC   |\
	SEC					;$B8CBEE   | | get y distance between player and newly held object
	SBC $000A,y				;$B8CBEF   | |
	STA $0D7E				;$B8CBF2   |/
	LDA #$FFFF				;$B8CBF5   |
	STA $0D80				;$B8CBF8   |
	LDX current_sprite			;$B8CBFB   |\
	LDA #$000C				;$B8CBFD   | | set kong behavior to carrying object on ground
	STA $2E,x				;$B8CC00   |/
	LDA #$000F				;$B8CC02   |\
	JSL CODE_B9D0B8				;$B8CC05   |/ set animation to picking up object
	LDA $0981				;$B8CC09   |\
	AND #$1300				;$B8CC0C   | | clear all held inputs besides left, right, and start
	STA $0981				;$B8CC0F   |/
	SEC					;$B8CC12   |\ indicate that object pickup has occurred
	RTS					;$B8CC13  / /

set_fast_move_if_left_right:
	LDY $66					;$B8CC14  \
	LDA $0004,y				;$B8CC16   |
	AND #$0300				;$B8CC19   |
	BEQ .no_left_or_right_press		;$B8CC1C   |
	LDA $0006,y				;$B8CC1E   |
	ORA #$0004				;$B8CC21   |
	STA $0006,y				;$B8CC24   |
	RTS					;$B8CC27  /

.no_left_or_right_press
	LDA $0006,y				;$B8CC28  \
	AND #$FFFB				;$B8CC2B   |
	STA $0006,y				;$B8CC2E   |
	RTS					;$B8CC31  /

start_player_roll:
	LDY current_sprite			;$B8CC32  \
	LDA #$0002				;$B8CC34   |\ set kong behavior to roll start
	STA $002E,y				;$B8CC37   |/
	LDX $66					;$B8CC3A   |\
	LDY #$001E				;$B8CC3C   |/ prepare standing roll velocity constant in case no direction is held
	LDA $0981				;$B8CC3F   |\
	AND #$0300				;$B8CC42   | | if no direction is held apply standing roll velocity
	BEQ .apply_roll_velocity		;$B8CC45   |/
	LDY #$0020				;$B8CC47   |> prepare walking roll velocity constant
	LDA global_frame_counter		;$B8CC4A   |\
	SEC					;$B8CC4C   | |
	SBC $1E,x				;$B8CC4D   | |
	BMI .apply_roll_velocity		;$B8CC4F   | |
	CMP #$0014				;$B8CC51   | | if too long has elapsed since last y release apply walking roll velocity
	BPL .apply_roll_velocity		;$B8CC54   |/
	LDA $1E,x				;$B8CC56   |\
	SEC					;$B8CC58   | |
	SBC $1C,x				;$B8CC59   | |
	CMP #$0020				;$B8CC5B   | |
	BCC .apply_roll_velocity		;$B8CC5E   |/
	LDY current_sprite			;$B8CC60   |\
	LDA #$0003				;$B8CC62   | | set kong behavior to fast roll
	STA $002E,y				;$B8CC65   |/
	LDY #$0022				;$B8CC68   |> prepare running roll velocity constant
.apply_roll_velocity:				;	   |
	LDA [$8E],y				;$B8CC6B   |\
	STA $0E,x				;$B8CC6D   | | apply roll velocity from constant
	RTS					;$B8CC6F  / /

set_fast_move_if_left_right_y_action:
	JSR set_fast_move_if_left_right		;$B8CC70  \
	RTS					;$B8CC73  /

enguarde_attack_action:
	LDA $0983				;$B8CC74  \
	AND #$C000				;$B8CC77   |
	BNE .clear_b_y_press_this_frame		;$B8CC7A   |
	RTS					;$B8CC7C  /

.clear_b_y_press_this_frame
	EOR $0983				;$B8CC7D  \
	STA $0983				;$B8CC80   |
	JSR start_enguarde_attack		;$B8CC83   |
	RTS					;$B8CC86  /

coop_take_control_y_action:
	LDA $0983				;$B8CC87  \
	AND #$4000				;$B8CC8A   |
	BEQ .no_y_press_this_frame		;$B8CC8D   |
	BRL transfer_control_of_player		;$B8CC8F  /

.no_y_press_this_frame
	RTS					;$B8CC92  /

start_enguarde_attack:
	LDY $66					;$B8CC93  \
	LDA $0000,y				;$B8CC95   |
	CMP #$008F				;$B8CC98   |
	BNE .not_already_attacking		;$B8CC9B   |
	LDA #$0001				;$B8CC9D   |
	TSB $0B02				;$B8CCA0   |
	RTS					;$B8CCA3  /

.not_already_attacking
	LDA #$008B				;$B8CCA4  \ \
	JSL CODE_B9D08C				;$B8CCA7   |/ set attack animation
	LDX current_sprite			;$B8CCAB   |
	STZ $24,x				;$B8CCAD   |> clear current y velocity
	LDA $26,x				;$B8CCAF   |\
	BEQ .return				;$B8CCB1   |/ if the player has no target x velocity we're done
	LSR A					;$B8CCB3   |\
	EOR $12,x				;$B8CCB4   | |
	AND #$4000				;$B8CCB6   | | otherwise make the player face their target x direction
	EOR $12,x				;$B8CCB9   | |
	STA $12,x				;$B8CCBB   |/
.return						;	   |
	RTS					;$B8CCBD  /

shoot_web_platform_l_action:
	LDA $0983				;$B8CCBE  \
	AND #$0020				;$B8CCC1   | if r was pressed this frame
	BNE shoot_web_platform_lr		;$B8CCC4   | continue to is squitter check
	RTS					;$B8CCC6  / > otherwise return

shoot_web_platform_r_action:
	LDA $0983				;$B8CCC7  \ \
	AND #$0010				;$B8CCCA   | | if r was pressed this frame
	BNE shoot_web_platform_lr		;$B8CCCD   |/ continue to is squitter check
	RTS					;$B8CCCF  / > otherwise return

shoot_web_platform_lr:
	LDX current_sprite			;$B8CCD0  \ \
	LDA $6E					;$B8CCD2   | |
	CMP #$0190				;$B8CCD4   | | if animal is squitter shoot web platform
	BEQ .shoot_platform			;$B8CCD7   |/
	RTS					;$B8CCD9  / > otherwise return

.shoot_platform
	JMP shoot_web_platform			;$B8CCDA  /

pause_game_action:
	LDA $0983				;$B8CCDD  \ \
	AND #$1000				;$B8CCE0   | | if start was pressed this frame
	BNE .start_pressed_this_frame		;$B8CCE3   |/ pause the game
	RTS					;$B8CCE5  /

.start_pressed_this_frame
	BRA .toggle_paused			;$B8CCE6  /

.return
	RTS					;$B8CCE8  /

.toggle_paused
	LDA screen_brightness			;$B8CCE9  \
	BEQ .return				;$B8CCEC   |
	LDA #$2000				;$B8CCEE   |
	BIT $08C2				;$B8CCF1   |
	BNE .return				;$B8CCF4   |
	LDX active_kong_sprite			;$B8CCF6   |
	LDA $2E,x				;$B8CCF9   |
	CMP #$0005				;$B8CCFB   |
	BEQ .return				;$B8CCFE   |
if !version == 0				;	   |
	LDA #$0040				;$B8CD00   |
	TSB $08C2				;$B8CD03   |
	LDA #$075E                      	;$B8CD06   |
	JSL $B58021				;$B8CD09   |
	LDA #$065E				;$B8CD0D   |
	JSL $B58021				;$B8CD10   |
	LDA #$055E				;$B8CD14   |
	JSL $B58021				;$B8CD17   |
	LDA #$045E				;$B8CD1B   |
	JSL $B58021				;$B8CD1E   |
	LDA global_frame_counter		;$B8CD22   |
	STA $0636				;$B8CD24   |
else						;	   |
	LDA #$0010				;$B8CD00   |
	TSB $08C4				;$B8CD03   |
endif 						;	   |
	RTS					;$B8CD06  /

stop_debug_fly_action:
	LDA $0983				;$B8CD07  \
	AND #$1000				;$B8CD0A   |
	BNE .start_pressed_this_frame		;$B8CD0D   |
	RTS					;$B8CD0F  /

.start_pressed_this_frame
	LDX current_sprite			;$B8CD10  \ \
	LDA #$0000				;$B8CD12   | | reset kong state
	STA $2E,x				;$B8CD15   |/
	LDA #$FFFE				;$B8CD17   |\ reset bit 0 of $5BB
	AND $05BB				;$B8CD1A   | | this could be interesting
	STA $05BB				;$B8CD1D   |/ might be a left over flag for when debug flying is enabled
	RTS					;$B8CD20  /

coop_take_control_start_action:
	LDA $0983				;$B8CD21  \ \
	AND #$1000				;$B8CD24   | | if other player pressed start this frame
	BNE transfer_control_of_player		;$B8CD27   |/ transfer control to them
	RTS					;$B8CD29  /

transfer_control_of_player:
	LDX current_sprite			;$B8CD2A  \
	LDA $4A,x				;$B8CD2C   |
	CMP #$0020				;$B8CD2E   |
	BPL CODE_B8CD34				;$B8CD31   |
	RTS					;$B8CD33  /

CODE_B8CD34:
	LDA #$0001				;$B8CD34  \
	TSB $08C4				;$B8CD37   |
	LDA #$0100				;$B8CD3A   |
	TRB $08C2				;$B8CD3D   |
	JSR disable_bullet_time			;$B8CD40   |
	JSR check_sprite_underwater		;$B8CD43   |
	CMP #$0002				;$B8CD46   |
	BEQ CODE_B8CD57				;$B8CD49   |
	LDA $6E					;$B8CD4B   |
	BNE CODE_B8CD60				;$B8CD4D   |
	LDX current_sprite			;$B8CD4F   |
	LDA #$0001				;$B8CD51   |
	STA $2E,x				;$B8CD54   |
	RTS					;$B8CD56  /

CODE_B8CD57:
	LDX current_sprite			;$B8CD57  \
	STZ $24,x				;$B8CD59   |
	STZ $2A,x				;$B8CD5B   |
	JMP CODE_B8B6E0				;$B8CD5D  /

CODE_B8CD60:
	CMP #$0198				;$B8CD60  \
	BEQ .squawks				;$B8CD63   |
	JSR start_player_faster_falling		;$B8CD65   |
	RTS					;$B8CD68   |
.squawks					;	   |
	LDA #$0010				;$B8CD69   |
	STA $2E,x				;$B8CD6C   |
	RTS					;$B8CD6E  /

swap_to_other_kong_action:
	LDX current_sprite			;$B8CD6F  \
	LDA $0983				;$B8CD71   |
	AND #$2000				;$B8CD74   |
	BNE .select_pressed_this_frame		;$B8CD77   |
.no_swap					;	   |
	RTS					;$B8CD79  /

.select_pressed_this_frame
	LDY inactive_kong_sprite		;$B8CD7A  \
	LDA $002E,y				;$B8CD7D   |
	ASL A					;$B8CD80   |
	ASL A					;$B8CD81   |
	TAX					;$B8CD82   |
	LDA.l DATA_B896B7,x			;$B8CD83   |
	AND #$0010				;$B8CD87   |
	BEQ .no_swap				;$B8CD8A   |
	LDA $08C2				;$B8CD8C   |
	AND #$4000				;$B8CD8F   |
	BEQ .no_swap				;$B8CD92   |
	JMP CODE_B8C559				;$B8CD94  /

CODE_B8CD97:
	LDA $7C					;$B8CD97  \
	BPL CODE_B8CDA8				;$B8CD99   |
	EOR #$FFFF				;$B8CD9B   |
	INC A					;$B8CD9E   |
	STA $7C					;$B8CD9F   |
	LDA #$FFFF				;$B8CDA1   |
	STA $7E					;$B8CDA4   |
	BRA CODE_B8CDAD				;$B8CDA6  /

CODE_B8CDA8:
	LDA #$0001				;$B8CDA8  \
	STA $7E					;$B8CDAB   |
CODE_B8CDAD:					;	   |
	LDA $74					;$B8CDAD   |
	STA $34					;$B8CDAF   |
	LDA $72					;$B8CDB1   |
	JSL CODE_B5C3E7				;$B8CDB3   |
	CMP #$0000				;$B8CDB7   |
	BMI CODE_B8CDE6				;$B8CDBA   |
	EOR #$FFFF				;$B8CDBC   |
	CLC					;$B8CDBF   |
	ADC #$6301				;$B8CDC0   |
if !version == 1				;	   |
	STA $34					;$B8CDC3   |
	SEC					;$B8CDC5   |
	SBC $74					;$B8CDC6   |
	BPL CODE_B8CDCE				;$B8CDC8   |
	EOR #$FFFF				;$B8CDCA   |
	INC A					;$B8CDCD   |
CODE_B8CDCE:					;	   |
	CMP #$0008				;$B8CDCE   |
	BPL CODE_B8CDE6				;$B8CDD1   |
	LDA $34					;$B8CDD3   |
	STA $74					;$B8CDD5   |
	DEC $7C					;$B8CDD7   |
	BEQ CODE_B8CDE4				;$B8CDD9   |
	LDA $72					;$B8CDDB   |
	CLC					;$B8CDDD   |
	ADC $7E					;$B8CDDE   |
	STA $72					;$B8CDE0   |
	BRA CODE_B8CDAD				;$B8CDE2   |
else						;	   |
	STA $74					;$B8CDC3   |
	LDA $72					;$B8CDC5   |
	CLC					;$B8CDC7   |
	ADC $7E					;$B8CDC8   |
	STA $72					;$B8CDCA   |
	DEC $7C					;$B8CDCC   |
	BNE CODE_B8CDAD				;$B8CDCE   |
endif						;	   |

CODE_B8CDE4:
	CLC					;$B8CDE4  \
	RTS					;$B8CDE5  /

CODE_B8CDE6:
	SEC					;$B8CDE6  \
	RTS					;$B8CDE7  /

swap_to_other_kong_swimming_action:
	LDA $08C2				;$B8CDE8  \
	AND #$4000				;$B8CDEB   |
	BEQ CODE_B8CE08				;$B8CDEE   |
	LDY inactive_kong_sprite		;$B8CDF0   |
	LDA $002E,y				;$B8CDF3   |
	ASL A					;$B8CDF6   |
	ASL A					;$B8CDF7   |
	TAX					;$B8CDF8   |
	LDA.l DATA_B896B7,x			;$B8CDF9   |
	AND #$0010				;$B8CDFD   |
	BEQ CODE_B8CE08				;$B8CE00   |
	LDA #$0001				;$B8CE02   |
	JSR set_player_interaction		;$B8CE05   |
CODE_B8CE08:					;	   |
	RTS					;$B8CE08  /

stop_walk_action:
	LDX current_sprite			;$B8CE09  \ \
	STZ $26,x				;$B8CE0B   | | clear target x velocity and return
	RTS					;$B8CE0D  / /

roll_no_left_right_action:
	RTS					;$B8CE0E  /

stop_debug_x_move_action:
	LDX current_sprite			;$B8CE0F  \
	STZ $20,x				;$B8CE11   |
	RTS					;$B8CE13  /

stop_barrel_cannon_x_move_action:
	LDX current_sprite			;$B8CE14  \
	STZ $26,x				;$B8CE16   |
	RTS					;$B8CE18  /

return_sprite_no_up_down_no_action:
	LDX current_sprite			;$B8CE19  \
	RTS					;$B8CE1B  /

stop_crouch_action:
	LDX current_sprite			;$B8CE1C  \
	LDA $0981				;$B8CE1E   |
	AND #$0400				;$B8CE21   |
	BEQ .stop_crouch			;$B8CE24   |
	RTS					;$B8CE26  /

.stop_crouch
	LDA #$0000				;$B8CE27  \
	STA $2E,x				;$B8CE2A   |
	LDA #$000E				;$B8CE2C   |
	JSL CODE_B9D0B8				;$B8CE2F   |
	RTS					;$B8CE33  /

stop_debug_y_move_action:
	LDX current_sprite			;$B8CE34  \
	STZ $24,x				;$B8CE36   |
	RTS					;$B8CE38  /

CODE_B8CE39:
	LDX current_sprite			;$B8CE39  \
	JSR set_player_terminal_velocity	;$B8CE3B   |
	JSR set_player_normal_gravity		;$B8CE3E   |
	RTS					;$B8CE41  /

stop_barrel_cannon_y_move_action:
	LDX current_sprite			;$B8CE42  \
	STZ $2A,x				;$B8CE44   |
	RTS					;$B8CE46  /

stop_vertical_rope_climb_action:
	LDX current_sprite			;$B8CE47  \
	STZ $2A,x				;$B8CE49   |
	RTS					;$B8CE4B  /

CODE_B8CE4C:
	LDY #$0078				;$B8CE4C  \
	LDA [$8E],y				;$B8CE4F   |
	LDY $66					;$B8CE51   |
	STA $000A,y				;$B8CE53   |
	RTS					;$B8CE56  /

quawks_normal_descent_action:
	LDX current_sprite			;$B8CE57  \
	JSR set_player_normal_gravity		;$B8CE59   |
	JSR set_player_terminal_velocity	;$B8CE5C   |
	LDA #$0100				;$B8CE5F   |
	LDY $66					;$B8CE62   |
	STA $000A,y				;$B8CE64   |
	RTS					;$B8CE67  /

clear_target_y_velocity_action:
	LDX current_sprite			;$B8CE68  \
	STZ $2A,x				;$B8CE6A   |
	RTS					;$B8CE6C  /

stop_holding_jump_action:
	LDX current_sprite			;$B8CE6D  \
	JSR set_player_normal_gravity		;$B8CE6F   |
	RTS					;$B8CE72  /

CODE_B8CE73:
	RTS					;$B8CE73  /

	JSR set_player_jumping_gravity		;$B8CE74   |
	RTL					;$B8CE77  /

set_player_jumping_gravity:
	LDA $6E					;$B8CE78  \
	BNE .has_animal				;$B8CE7A   |
	LDY #$0004				;$B8CE7C   |
	LDA [$8E],y				;$B8CE7F   |
	LDY $66					;$B8CE81   |
	STA $0008,y				;$B8CE83   |
	RTS					;$B8CE86  /

.has_animal
	SEC					;$B8CE87  \
	SBC #$0034				;$B8CE88   |
	LSR A					;$B8CE8B   |
	TAY					;$B8CE8C   |
	LDA [$8E],y				;$B8CE8D   |
	LDY $66					;$B8CE8F   |
	STA $0008,y				;$B8CE91   |
	RTS					;$B8CE94  /

CODE_B8CE95:
	JSR set_player_normal_gravity		;$B8CE95  \
	RTL					;$B8CE98  /

set_player_normal_gravity:
	LDA $6E					;$B8CE99  \ \ check if player has an animal
	BNE .has_animal				;$B8CE9B   |/
	LDY #$0000				;$B8CE9D   |\
	LDA [$8E],y				;$B8CEA0   | | update gravity for kong player
	LDY $66					;$B8CEA2   | |
	STA $0008,y				;$B8CEA4   |/
	RTS					;$B8CEA7  /

.has_animal
	SEC					;$B8CEA8  \
	SBC #$005C				;$B8CEA9   |
	LSR A					;$B8CEAC   |
	TAY					;$B8CEAD   |\
	LDA [$8E],y				;$B8CEAE   | | update gravity for animal player
	LDY $66					;$B8CEB0   | |
	STA $0008,y				;$B8CEB2   |/
	RTS					;$B8CEB5  /

CODE_B8CEB6:
	JSR set_player_terminal_velocity	;$B8CEB6  \
	RTL					;$B8CEB9  /

set_player_terminal_velocity:
	LDA $6E					;$B8CEBA  \ \ check if player has an animal
	BNE .has_animal				;$B8CEBC   |/
	LDY #$0002				;$B8CEBE   |\
	LDA [$8E],y				;$B8CEC1   | | update terminal velocity for kong player
	LDY $66					;$B8CEC3   | |
	STA $000A,y				;$B8CEC5   | |
	RTS					;$B8CEC8  / /

.has_animal
	CMP #$0198				;$B8CEC9  \
	BEQ .is_squawks				;$B8CECC   |
.riding_animal					;	   |
	SEC					;$B8CECE   |
	SBC #$0048				;$B8CECF   |
	LSR A					;$B8CED2   |
	TAY					;$B8CED3   |
	LDA [$8E],y				;$B8CED4   |
.store_terminal_velocity			;	   |\
	LDY $66					;$B8CED6   | | update terminal velocity for animal player
	STA $000A,y				;$B8CED8   | |
	RTS					;$B8CEDB  / /

.is_squawks
	LDY current_player_mount		;$B8CEDC  \ \
	BNE .riding_animal			;$B8CEDE   | |
	LDY #$0080				;$B8CEE0   | | use alternate terminal velocity for squawks
	LDA [$8E],y				;$B8CEE3   | |
	BRA .store_terminal_velocity		;$B8CEE5  / /

set_player_terminal_velocity_down:
	LDA $6E					;$B8CEE7  \
	BNE .has_animal				;$B8CEE9   |
	LDY #$0006				;$B8CEEB   |
	LDA [$8E],y				;$B8CEEE   |
	LDY $66					;$B8CEF0   |
	STA $000A,y				;$B8CEF2   |
	RTS					;$B8CEF5  /

.has_animal
	CMP #$0198				;$B8CEF6  \
	BEQ .squawks				;$B8CEF9   |
.riding_animal					;	   |
	SEC					;$B8CEFB   |
	SBC #$0020				;$B8CEFC   |
	LSR A					;$B8CEFF   |
	TAY					;$B8CF00   |
	LDA [$8E],y				;$B8CF01   |
.apply_terminal_velocity			;	   |
	LDY $66					;$B8CF03   |
	STA $000A,y				;$B8CF05   |
	RTS					;$B8CF08  /

.squawks
	LDY current_player_mount		;$B8CF09  \
	BNE .riding_animal			;$B8CF0B   |
	LDY #$0082				;$B8CF0D   |
	LDA [$8E],y				;$B8CF10   |
	BRA .apply_terminal_velocity		;$B8CF12  /

no_b_action:
	RTS					;$B8CF14  /

clear_fast_move_y_action:
	LDX current_sprite			;$B8CF15  \
	LDY $66					;$B8CF17   |
	LDA $0006,y				;$B8CF19   |
	AND #$FFFB				;$B8CF1C   |
	STA $0006,y				;$B8CF1F   |
	RTS					;$B8CF22  /

stop_carrying_sprite_action:
	LDX current_sprite			;$B8CF23  \
	LDA $40,x				;$B8CF25   |
	AND #$0004				;$B8CF27   |
	BNE .return				;$B8CF2A   |
	LDA $0981				;$B8CF2C   |
	AND #$0400				;$B8CF2F   |
	BEQ .throw				;$B8CF32   |
	LDA $1E,x				;$B8CF34   |
	AND #$0001				;$B8CF36   |
	BEQ .throw				;$B8CF39   |
	LDA #$0013				;$B8CF3B   |
	JSL CODE_B9D0B8				;$B8CF3E   |
.return						;	   |
	RTS					;$B8CF42  /

.throw
	LDA #$0014				;$B8CF43  \
	JSL CODE_B9D0B8				;$B8CF46   |
	RTS					;$B8CF4A  /

face_moving_direction:
	LDX current_sprite			;$B8CF4B  \
	LDA $26,x				;$B8CF4D   |
	BEQ .return				;$B8CF4F   |
	LSR A					;$B8CF51   |
	EOR $12,x				;$B8CF52   |
	AND #$4000				;$B8CF54   |
	BEQ .return				;$B8CF57   |
	EOR $12,x				;$B8CF59   |
	STA $12,x				;$B8CF5B   |
.return						;	   |
	RTS					;$B8CF5D  /

set_normal_gravity_if_falling:
	LDX current_sprite			;$B8CF5E  \
	LDA $24,x				;$B8CF60   |
	BMI .moving_upward			;$B8CF62   |
	JSR set_player_normal_gravity		;$B8CF64   |
.moving_upward					;	   |
	RTS					;$B8CF67  /

apply_player_gravity:
	LDX current_sprite			;$B8CF68  \
	LDY $66					;$B8CF6A   |
	LDA $0008,y				;$B8CF6C   |
	CLC					;$B8CF6F   |
	ADC $24,x				;$B8CF70   |
	BMI .apply_velocity			;$B8CF72   |
	CMP $000A,y				;$B8CF74   |
	BCC .apply_velocity			;$B8CF77   |
	LDA $000A,y				;$B8CF79   |
.apply_velocity					;	   |
	STA $24,x				;$B8CF7C   |
	RTS					;$B8CF7E  /

CODE_B8CF7F:
	JSR CODE_B8CF83				;$B8CF7F  \
	RTL					;$B8CF82  /

CODE_B8CF83:
	LDX current_sprite			;$B8CF83  \
	LDY #$0000				;$B8CF85   |
	LDA $24,x				;$B8CF88   |
	BPL .positive_y_velocity		;$B8CF8A   |
	DEY					;$B8CF8C   |
.positive_y_velocity				;	   |
	CLC					;$B8CF8D   |
	ADC $09,x				;$B8CF8E   |
	STA $09,x				;$B8CF90   |
	TYA					;$B8CF92   |
	ADC $0B,x				;$B8CF93   |
	SEP #$20				;$B8CF95   |
	STA $0B,x				;$B8CF97   |
	REP #$20				;$B8CF99   |
	LDY #$0000				;$B8CF9B   |
	LDA $20,x				;$B8CF9E   |
	BPL .positive_x_velocity		;$B8CFA0   |
	DEY					;$B8CFA2   |
.positive_x_velocity				;	   |
	CLC					;$B8CFA3   |
	ADC $05,x				;$B8CFA4   |
	STA $05,x				;$B8CFA6   |
	TYA					;$B8CFA8   |
	ADC $07,x				;$B8CFA9   |
	SEP #$20				;$B8CFAB   |
	STA $07,x				;$B8CFAD   |
	REP #$20				;$B8CFAF   |
	RTS					;$B8CFB1  /

	LDA #$0252				;$B8CFB2   |
	STA $32					;$B8CFB5   |
	LDA $06,x				;$B8CFB7   |
	CMP #$00B0				;$B8CFB9   |
	LDA $24,x				;$B8CFBC   |
	BMI CODE_B8CFCF				;$B8CFBE   |
	LDA $0A,x				;$B8CFC0   |
	CMP $32					;$B8CFC2   |
	BCC CODE_B8CFCF				;$B8CFC4   |
	LDA $32					;$B8CFC6   |
	STA $0A,x				;$B8CFC8   |
	LDA #$0100				;$B8CFCA   |
	STA $24,x				;$B8CFCD   |
CODE_B8CFCF:					;	   |
	LDA $32					;$B8CFCF   |
	STA $0C,x				;$B8CFD1   |
	RTS					;$B8CFD3  /

CODE_B8CFD4:
	JSR interpolate_y_velocity		;$B8CFD4  \
	RTL					;$B8CFD7  /

interpolate_y_velocity:
	LDX current_sprite			;$B8CFD8  \
	TXY					;$B8CFDA   |
	ASL A					;$B8CFDB   |
	STA $26					;$B8CFDC   |
	LDA $2A,x				;$B8CFDE   |
	SEC					;$B8CFE0   |
	SBC $24,x				;$B8CFE1   |
	BPL CODE_B8CFFB				;$B8CFE3   |
	EOR #$FFFF				;$B8CFE5   |
	INC A					;$B8CFE8   |
	LDX $26					;$B8CFE9   |
	JSR (DATA_B8D059,x)			;$B8CFEB   |
	BEQ CODE_B8D009				;$B8CFEE   |
	EOR #$FFFF				;$B8CFF0   |
	INC A					;$B8CFF3   |
	TYX					;$B8CFF4   |
	CLC					;$B8CFF5   |
	ADC $24,x				;$B8CFF6   |
	STA $24,x				;$B8CFF8   |
	RTS					;$B8CFFA  /

CODE_B8CFFB:
	LDX $26					;$B8CFFB  \
	JSR (DATA_B8D059,x)			;$B8CFFD   |
	BEQ CODE_B8D009				;$B8D000   |
	TYX					;$B8D002   |
	CLC					;$B8D003   |
	ADC $24,x				;$B8D004   |
	STA $24,x				;$B8D006   |
	RTS					;$B8D008  /

CODE_B8D009:
	LDA $002A,y				;$B8D009  \
	STA $0024,y				;$B8D00C   |
	RTS					;$B8D00F  /

CODE_B8D010:
	JSR interpolate_x_velocity		;$B8D010  \
	RTL					;$B8D013  /

interpolate_x_velocity:
	LDX current_sprite			;$B8D014  \
	TXY					;$B8D016   |
	ASL A					;$B8D017   |
	STA $26					;$B8D018   |
	LDA $26,x				;$B8D01A   |
	CLC					;$B8D01C   |
	ADC $2C,x				;$B8D01D   |
	SEC					;$B8D01F   |
	SBC $20,x				;$B8D020   |
	BPL CODE_B8D03A				;$B8D022   |
	EOR #$FFFF				;$B8D024   |
	INC A					;$B8D027   |
	LDX $26					;$B8D028   |
	JSR (DATA_B8D059,x)			;$B8D02A   |
	BEQ CODE_B8D048				;$B8D02D   |
	EOR #$FFFF				;$B8D02F   |
	INC A					;$B8D032   |
	TYX					;$B8D033   |
	CLC					;$B8D034   |
	ADC $20,x				;$B8D035   |
	STA $20,x				;$B8D037   |
	RTS					;$B8D039  /

CODE_B8D03A:
	LDX $26					;$B8D03A  \
	JSR (DATA_B8D059,x)			;$B8D03C   |
	BEQ CODE_B8D048				;$B8D03F   |
	TYX					;$B8D041   |
	CLC					;$B8D042   |
	ADC $20,x				;$B8D043   |
	STA $20,x				;$B8D045   |
	RTS					;$B8D047  /

CODE_B8D048:
	LDA $0026,y				;$B8D048  \
	CLC					;$B8D04B   |
	ADC $002C,y				;$B8D04C   |
	STA $0020,y				;$B8D04F   |
	RTS					;$B8D052  /

	ASL A					;$B8D053   |
	TAX					;$B8D054   |
	TYA					;$B8D055   |
	JMP (DATA_B8D08D,x)			;$B8D056  /

DATA_B8D059:
	dw CODE_B8D106
	dw CODE_B8D107
	dw CODE_B8D108
	dw CODE_B8D109
	dw CODE_B8D0AF
	dw CODE_B8D0BC
	dw CODE_B8D0C8
	dw CODE_B8D10A
	dw CODE_B8D0DA
	dw CODE_B8D0E6
	dw CODE_B8D0F1
	dw CODE_B8D10F
	dw CODE_B8D113
	dw CODE_B8D11D
	dw CODE_B8D120
	dw CODE_B8D12A
	dw CODE_B8D133
	dw CODE_B8D142
	dw CODE_B8D144
	dw CODE_B8D14E
	dw CODE_B8D157
	dw CODE_B8D166
	dw CODE_B8D16E
	dw CODE_B8D17D
	dw CODE_B8D18B
	dw CODE_B8D198

DATA_B8D08D:
	dw CODE_B8D102
	dw CODE_B8D10A
	dw CODE_B8D10F
	dw CODE_B8D113
	dw CODE_B8D11D
	dw CODE_B8D120
	dw CODE_B8D12A
	dw CODE_B8D133
	dw CODE_B8D142
	dw CODE_B8D144
	dw CODE_B8D14E
	dw CODE_B8D157
	dw CODE_B8D166
	dw CODE_B8D16E
	dw CODE_B8D17D
	dw CODE_B8D18B
	dw CODE_B8D198



CODE_B8D0AF:
	LSR A					;$B8D0AF  \
	LSR A					;$B8D0B0   |
	LSR A					;$B8D0B1   |
	LSR A					;$B8D0B2   |
	LSR A					;$B8D0B3   |
	STA $26					;$B8D0B4   |
	LSR A					;$B8D0B6   |
	LSR A					;$B8D0B7   |
	CLC					;$B8D0B8   |
	ADC $26					;$B8D0B9   |
	RTS					;$B8D0BB  /

CODE_B8D0BC:
	LSR A					;$B8D0BC  \
	LSR A					;$B8D0BD   |
	LSR A					;$B8D0BE   |
	LSR A					;$B8D0BF   |
	LSR A					;$B8D0C0   |
	STA $26					;$B8D0C1   |
	LSR A					;$B8D0C3   |
	CLC					;$B8D0C4   |
	ADC $26					;$B8D0C5   |
	RTS					;$B8D0C7  /

CODE_B8D0C8:
	LSR A					;$B8D0C8  \
	LSR A					;$B8D0C9   |
	LSR A					;$B8D0CA   |
	LSR A					;$B8D0CB   |
	LSR A					;$B8D0CC   |
	STA $26					;$B8D0CD   |
	LSR A					;$B8D0CF   |
	STA $28					;$B8D0D0   |
	LSR A					;$B8D0D2   |
	CLC					;$B8D0D3   |
	ADC $26					;$B8D0D4   |
	CLC					;$B8D0D6   |
	ADC $28					;$B8D0D7   |
	RTS					;$B8D0D9  /

CODE_B8D0DA:
	LSR A					;$B8D0DA  \
	LSR A					;$B8D0DB   |
	LSR A					;$B8D0DC   |
	LSR A					;$B8D0DD   |
	STA $26					;$B8D0DE   |
	LSR A					;$B8D0E0   |
	LSR A					;$B8D0E1   |
	CLC					;$B8D0E2   |
	ADC $26					;$B8D0E3   |
	RTS					;$B8D0E5  /

CODE_B8D0E6:
	LSR A					;$B8D0E6  \
	LSR A					;$B8D0E7   |
	LSR A					;$B8D0E8   |
	LSR A					;$B8D0E9   |
	STA $26					;$B8D0EA   |
	LSR A					;$B8D0EC   |
	CLC					;$B8D0ED   |
	ADC $26					;$B8D0EE   |
	RTS					;$B8D0F0  /

CODE_B8D0F1:
	LSR A					;$B8D0F1  \
	LSR A					;$B8D0F2   |
	LSR A					;$B8D0F3   |
	LSR A					;$B8D0F4   |
	STA $26					;$B8D0F5   |
	LSR A					;$B8D0F7   |
	STA $28					;$B8D0F8   |
	LSR A					;$B8D0FA   |
	CLC					;$B8D0FB   |
	ADC $26					;$B8D0FC   |
	CLC					;$B8D0FE   |
	ADC $28					;$B8D0FF   |
	RTS					;$B8D101  /

CODE_B8D102:
	LDA #$0000				;$B8D102  \
	RTS					;$B8D105  /

CODE_B8D106:
	LSR A					;$B8D106  \
CODE_B8D107:					;	   |
	LSR A					;$B8D107   |
CODE_B8D108:					;	   |
	LSR A					;$B8D108   |
CODE_B8D109:					;	   |
	LSR A					;$B8D109   |
CODE_B8D10A:					;	   |
	LSR A					;$B8D10A   |
	LSR A					;$B8D10B   |
	LSR A					;$B8D10C   |
	LSR A					;$B8D10D   |
	RTS					;$B8D10E  /

CODE_B8D10F:
	LSR A					;$B8D10F  \
	LSR A					;$B8D110   |
	LSR A					;$B8D111   |
	RTS					;$B8D112  /

CODE_B8D113:
	LSR A					;$B8D113  \
	LSR A					;$B8D114   |
	LSR A					;$B8D115   |
	STA $26					;$B8D116   |
	LSR A					;$B8D118   |
	CLC					;$B8D119   |
	ADC $26					;$B8D11A   |
	RTS					;$B8D11C  /

CODE_B8D11D:
	LSR A					;$B8D11D  \
	LSR A					;$B8D11E   |
	RTS					;$B8D11F  /

CODE_B8D120:
	LSR A					;$B8D120  \
	LSR A					;$B8D121   |
	STA $26					;$B8D122   |
	LSR A					;$B8D124   |
	LSR A					;$B8D125   |
	CLC					;$B8D126   |
	ADC $26					;$B8D127   |
	RTS					;$B8D129  /

CODE_B8D12A:
	LSR A					;$B8D12A  \
	LSR A					;$B8D12B   |
	STA $26					;$B8D12C   |
	LSR A					;$B8D12E   |
	CLC					;$B8D12F   |
	ADC $26					;$B8D130   |
	RTS					;$B8D132  /

CODE_B8D133:
	LSR A					;$B8D133  \
	LSR A					;$B8D134   |
	STA $26					;$B8D135   |
	LSR A					;$B8D137   |
	STA $28					;$B8D138   |
	LSR A					;$B8D13A   |
	CLC					;$B8D13B   |
	ADC $28					;$B8D13C   |
	CLC					;$B8D13E   |
	ADC $26					;$B8D13F   |
	RTS					;$B8D141  /

CODE_B8D142:
	LSR A					;$B8D142  \
	RTS					;$B8D143  /

CODE_B8D144:
	LSR A					;$B8D144  \
	STA $26					;$B8D145   |
	LSR A					;$B8D147   |
	LSR A					;$B8D148   |
	LSR A					;$B8D149   |
	CLC					;$B8D14A   |
	ADC $26					;$B8D14B   |
	RTS					;$B8D14D  /

CODE_B8D14E:
	LSR A					;$B8D14E  \
	STA $26					;$B8D14F   |
	LSR A					;$B8D151   |
	LSR A					;$B8D152   |
	CLC					;$B8D153   |
	ADC $26					;$B8D154   |
	RTS					;$B8D156  /

CODE_B8D157:
	LSR A					;$B8D157  \
	STA $26					;$B8D158   |
	LSR A					;$B8D15A   |
	LSR A					;$B8D15B   |
	STA $28					;$B8D15C   |
	LSR A					;$B8D15E   |
	CLC					;$B8D15F   |
	ADC $26					;$B8D160   |
	CLC					;$B8D162   |
	ADC $28					;$B8D163   |
	RTS					;$B8D165  /

CODE_B8D166:
	LSR A					;$B8D166  \
	STA $26					;$B8D167   |
	LSR A					;$B8D169   |
	CLC					;$B8D16A   |
	ADC $26					;$B8D16B   |
	RTS					;$B8D16D  /

CODE_B8D16E:
	LSR A					;$B8D16E  \
	STA $26					;$B8D16F   |
	LSR A					;$B8D171   |
	STA $28					;$B8D172   |
	LSR A					;$B8D174   |
	LSR A					;$B8D175   |
	CLC					;$B8D176   |
	ADC $28					;$B8D177   |
	CLC					;$B8D179   |
	ADC $26					;$B8D17A   |
	RTS					;$B8D17C  /

CODE_B8D17D:
	LSR A					;$B8D17D  \
	STA $26					;$B8D17E   |
	LSR A					;$B8D180   |
	STA $28					;$B8D181   |
	LSR A					;$B8D183   |
	CLC					;$B8D184   |
	ADC $28					;$B8D185   |
	CLC					;$B8D187   |
	ADC $26					;$B8D188   |
	RTS					;$B8D18A  /

CODE_B8D18B:
	STA $26					;$B8D18B  \
	LSR A					;$B8D18D   |
	LSR A					;$B8D18E   |
	LSR A					;$B8D18F   |
	LSR A					;$B8D190   |
	EOR #$FFFF				;$B8D191   |
	INC A					;$B8D194   |
	CLC					;$B8D195   |
	ADC $26					;$B8D196   |
CODE_B8D198:					;	   |
	RTS					;$B8D198  /

update_invincibility:
	LDX current_sprite			;$B8D199  \
	LDY $66					;$B8D19B   |
	LDA $0016,y				;$B8D19D   |
	BEQ .return				;$B8D1A0   |
	DEC A					;$B8D1A2   |
	STA $0016,y				;$B8D1A3   |
	BEQ .invincibility_time_up		;$B8D1A6   |
	LDA #$009E				;$B8D1A8   |
	STA $30,x				;$B8D1AB   |
	BRA .return				;$B8D1AD  /

.invincibility_time_up
	LDA #$001E				;$B8D1AF  \
	STA $30,x				;$B8D1B2   |
.return						;	   |
	RTS					;$B8D1B4  /

update_damaged_invincibility:
	JSR update_invincibility		;$B8D1B5  \
	LDA $0014,y				;$B8D1B8   |
	BEQ .return				;$B8D1BB   |
	DEC A					;$B8D1BD   |
	STA $0014,y				;$B8D1BE   |
	BEQ .reset_sprite_visibility		;$B8D1C1   |
	LDA global_frame_counter		;$B8D1C3   |
	AND #$0002				;$B8D1C5   |
	BNE .show_sprite			;$B8D1C8   |
	LDA $1C,x				;$B8D1CA   |
	ORA #$C000				;$B8D1CC   |
	STA $1C,x				;$B8D1CF   |
	BRA .return				;$B8D1D1  /

.show_sprite
	LDA $1C,x				;$B8D1D3  \
	AND #$3FFF				;$B8D1D5   |
	STA $1C,x				;$B8D1D8   |
	BRA .return				;$B8D1DA  /

.reset_sprite_visibility
	LDA $1C,x				;$B8D1DC  \
	AND #$3FFF				;$B8D1DE   |
	STA $1C,x				;$B8D1E1   |
.return						;	   |
	RTS					;$B8D1E3  /

CODE_B8D1E4:
	JSR enable_bullet_time			;$B8D1E4  \
	RTL					;$B8D1E7  /

enable_bullet_time:
	STA $0A36				;$B8D1E8  \
	TYA					;$B8D1EB   |
	STA $0A38				;$B8D1EC   |
	RTS					;$B8D1EF  /

CODE_B8D1F0:
	JSR disable_bullet_time			;$B8D1F0  \
	RTL					;$B8D1F3  /

disable_bullet_time:
	STZ $0A36				;$B8D1F4  \
	STZ $0A38				;$B8D1F7   |
	RTS					;$B8D1FA  /

CODE_B8D1FB:
	JSR disable_enemy_damage		;$B8D1FB  \
	RTL					;$B8D1FE  /

disable_enemy_damage:
	LDY $66					;$B8D1FF  \
	CMP $0016,y				;$B8D201   |
	BMI .return				;$B8D204   |
	STA $0016,y				;$B8D206   |
	LDA #$009E				;$B8D209   |
	STA $30,x				;$B8D20C   |
.return						;	   |
	RTS					;$B8D20E  /

start_damaged_invincibility:
	LDX current_sprite			;$B8D20F  \
	LDY $66					;$B8D211   |
	LDA #$009E				;$B8D213   |
	STA $30,x				;$B8D216   |
	LDA #$0060				;$B8D218   |
	STA $0014,y				;$B8D21B   |
	LDA #$0070				;$B8D21E   |
	STA $0016,y				;$B8D221   |
	RTS					;$B8D224  /

CODE_B8D225:
	PHK					;$B8D225  \
	PLB					;$B8D226   |
	LDX current_sprite			;$B8D227   |
	LDA $06,x				;$B8D229   |
	SEC					;$B8D22B   |
	SBC #$0010				;$B8D22C   |
	SEC					;$B8D22F   |
	SBC $17BA				;$B8D230   |
	BPL CODE_B8D23F				;$B8D233   |
CODE_B8D235:					;	   |
	EOR #$FFFF				;$B8D235   |
	INC A					;$B8D238   |
	CLC					;$B8D239   |
	ADC $06,x				;$B8D23A   |
	STA $06,x				;$B8D23C   |
	RTS					;$B8D23E  /

CODE_B8D23F:
	SEC					;$B8D23F  \
	SBC #$00E0				;$B8D240   |
	BPL CODE_B8D235				;$B8D243   |
	RTS					;$B8D245  /

CODE_B8D246:
	JSR CODE_B8D25A				;$B8D246  \
	RTL					;$B8D249  /

CODE_B8D24A:
	LDA $052B				;$B8D24A  \
	AND #$3000				;$B8D24D   |
	CMP #$3000				;$B8D250   |
	BNE CODE_B8D25A				;$B8D253   |
	LDA #DATA_B8D332			;$B8D255   |
	BRA CODE_B8D269				;$B8D258  /

CODE_B8D25A:
	LDA $88					;$B8D25A  \
	CMP #$0006				;$B8D25C   |
	BEQ CODE_B8D266				;$B8D25F   |
	LDA #DATA_B8D302			;$B8D261   |
	BRA CODE_B8D269				;$B8D264  /

CODE_B8D266:
	LDA #DATA_B8D2D2			;$B8D266  \
CODE_B8D269:					;	   |
	STA $34					;$B8D269   |
	LDX current_sprite			;$B8D26B   |\
	LDA $1E,x				;$B8D26D   | |
	AND #$0011				;$B8D26F   | | check if sprite is standing on actual terrain
	CMP #$0001				;$B8D272   | | and not standing on another sprite
	BNE .standing_on_sprite			;$B8D275   |/ if standing on another sprite clear slip velocity and return
	LDA $10,x				;$B8D277   |\ get slope steepness
	AND #$0007				;$B8D279   |/
	TXY					;$B8D27C   |> preserve current sprite in Y
	ASL A					;$B8D27D   |\
	STA $32					;$B8D27E   | | multiply slope steepness by 6 because each slip velocity entry is 6 bytes
	ASL A					;$B8D280   | | to generate a slip index for the slip velocity table
	CLC					;$B8D281   | |
	ADC $32					;$B8D282   | |
	CLC					;$B8D284   |/
	ADC $34					;$B8D285   |\ add slip velocity table base address to slip index
	TAX					;$B8D287   |/
	LDA.l $B80002,x				;$B8D288   |
	STA $32					;$B8D28C   |
	LDA.l $B80004,x				;$B8D28E   |
	STA $34					;$B8D292   |
	LDA.l $B80000,x				;$B8D294   |
	TYX					;$B8D298   |> retrieve current sprite from Y
	BIT $10,x				;$B8D299   |\
	BMI .slope_right			;$B8D29B   |/
	EOR #$FFFF				;$B8D29D   |
	INC A					;$B8D2A0   |
	STA $2C,x				;$B8D2A1   |
	LDA $20,x				;$B8D2A3   |
	EOR #$FFFF				;$B8D2A5   |
	INC A					;$B8D2A8   |
	JSR CODE_B8D2C1				;$B8D2A9   |
	EOR #$FFFF				;$B8D2AC   |
	INC A					;$B8D2AF   |
	STA $20,x				;$B8D2B0   |
	CLC					;$B8D2B2   |
	RTS					;$B8D2B3  /

.standing_on_sprite
	STZ $2C,x				;$B8D2B4  \> clear slip velocity
	RTS					;$B8D2B6  /

.slope_right
	STA $2C,x				;$B8D2B7  \
	LDA $20,x				;$B8D2B9   |
	JSR CODE_B8D2C1				;$B8D2BB   |
	STA $20,x				;$B8D2BE   |
	RTS					;$B8D2C0  /

CODE_B8D2C1:
	BIT $32					;$B8D2C1  \
	BEQ CODE_B8D2D1				;$B8D2C3   |
	CMP $32					;$B8D2C5   |
	BPL CODE_B8D2CB				;$B8D2C7   |
	LDA $32					;$B8D2C9   |
CODE_B8D2CB:					;	   |
	CMP $34					;$B8D2CB   |
	BMI CODE_B8D2D1				;$B8D2CD   |
	LDA $34					;$B8D2CF   |
CODE_B8D2D1:					;	   |
	RTS					;$B8D2D1  /

DATA_B8D2D2:
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0100, $00C0, $0200
	dw $0000, $0000, $0000

DATA_B8D302:
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0180, $0100, $0300
	dw $0100, $00C0, $0200
	dw $0000, $0000, $0000

DATA_B8D332:
	dw $0000, $0000, $0000
	dw $0000, $0000, $0000
	dw $0100, $0000, $0800
	dw $0180, $0000, $0800
	dw $01F0, $0000, $0800
	dw $0280, $0000, $0400
	dw $0400, $00A0, $0200
	dw $0000, $0000, $0000

CODE_B8D362:
	JSR CODE_B8D3E2				;$B8D362  \
	BCS CODE_B8D369				;$B8D365   |
	CLC					;$B8D367   |
CODE_B8D368:					;	   |
	RTS					;$B8D368  /

CODE_B8D369:
	BEQ CODE_B8D368				;$B8D369  \
	CLC					;$B8D36B   |
	RTS					;$B8D36C  /

CODE_B8D36D:
	JSR CODE_B8D3E2				;$B8D36D  \
	BCS CODE_B8D374				;$B8D370   |
	CLC					;$B8D372   |
CODE_B8D373:					;	   |
	RTS					;$B8D373  /

CODE_B8D374:
	BNE CODE_B8D373				;$B8D374  \
	CLC					;$B8D376   |
	RTS					;$B8D377  /

CODE_B8D378:
	STZ $60					;$B8D378  \
	LDX current_sprite			;$B8D37A   |
	LDA $0A,x				;$B8D37C   |
	SEC					;$B8D37E   |
	SBC #$0008				;$B8D37F   |
	JSL CODE_B5C3E3				;$B8D382   |
	JSR CODE_B8D484				;$B8D386   |
	CLC					;$B8D389   |
	ADC #$0027				;$B8D38A   |
	CMP $0A,x				;$B8D38D   |
	BPL CODE_B8D39F				;$B8D38F   |
	LDA $AE					;$B8D391   |
	AND #$1000				;$B8D393   |
	BEQ CODE_B8D39F				;$B8D396   |
	LDA $60					;$B8D398   |
	ORA #$0001				;$B8D39A   |
	STA $60					;$B8D39D   |
CODE_B8D39F:					;	   |
	LDA $0A,x				;$B8D39F   |
	SEC					;$B8D3A1   |
	SBC #$0008				;$B8D3A2   |
	STA $34					;$B8D3A5   |
	LDA $06,x				;$B8D3A7   |
	BIT $12,x				;$B8D3A9   |
	BVC CODE_B8D3B3				;$B8D3AB   |
	CLC					;$B8D3AD   |
	ADC #$0020				;$B8D3AE   |
	BRA CODE_B8D3B7				;$B8D3B1  /

CODE_B8D3B3:
	SEC					;$B8D3B3  \
	SBC #$0020				;$B8D3B4   |
CODE_B8D3B7:					;	   |
	JSL CODE_B5C3E7				;$B8D3B7   |
	JSR CODE_B8D484				;$B8D3BB   |
	CLC					;$B8D3BE   |
	ADC #$0027				;$B8D3BF   |
	CMP $0A,x				;$B8D3C2   |
	BPL CODE_B8D3D4				;$B8D3C4   |
	LDA $AE					;$B8D3C6   |
	AND #$1000				;$B8D3C8   |
	BEQ CODE_B8D3D4				;$B8D3CB   |
	LDA $60					;$B8D3CD   |
	ORA #$0002				;$B8D3CF   |
	STA $60					;$B8D3D2   |
CODE_B8D3D4:					;	   |
	LDA $AE					;$B8D3D4   |
	EOR $AC					;$B8D3D6   |
	AND #$1E00				;$B8D3D8   |
	EOR $AC					;$B8D3DB   |
	STA $10,x				;$B8D3DD   |
	LDA $60					;$B8D3DF   |
	RTS					;$B8D3E1  /

CODE_B8D3E2:
	LDX current_sprite			;$B8D3E2  \
	LDA $0A,x				;$B8D3E4   |
	SEC					;$B8D3E6   |
	SBC #$0028				;$B8D3E7   |
	JSL CODE_B5C3E3				;$B8D3EA   |
	JSR CODE_B8D484				;$B8D3EE   |
	STA $5E					;$B8D3F1   |
	LDA $AE					;$B8D3F3   |
	STA $10,x				;$B8D3F5   |
	AND #$1800				;$B8D3F7   |
	BEQ CODE_B8D455				;$B8D3FA   |
	AND #$1000				;$B8D3FC   |
	BEQ CODE_B8D432				;$B8D3FF   |
	LDA $5E					;$B8D401   |
	CLC					;$B8D403   |
	ADC #$0027				;$B8D404   |
	CMP $0A,x				;$B8D407   |
	BPL CODE_B8D450				;$B8D409   |
	LDX current_sprite			;$B8D40B   |
	LDA $0A,x				;$B8D40D   |
	SEC					;$B8D40F   |
	SBC #$0008				;$B8D410   |
	JSL CODE_B5C3E3				;$B8D413   |
	JSR CODE_B8D484				;$B8D417   |
	STA $5E					;$B8D41A   |
	LDA $AE					;$B8D41C   |
	AND #$1000				;$B8D41E   |
	BEQ CODE_B8D44B				;$B8D421   |
	LDA $5E					;$B8D423   |
	CLC					;$B8D425   |
	ADC #$0027				;$B8D426   |
	CMP $0A,x				;$B8D429   |
	BPL CODE_B8D44B				;$B8D42B   |
	LDA #$0000				;$B8D42D   |
	SEC					;$B8D430   |
	RTS					;$B8D431  /

CODE_B8D432:
	LDA $0A,x				;$B8D432  \
	SEC					;$B8D434   |
	SBC #$0028				;$B8D435   |
	SEC					;$B8D438   |
	SBC $5E					;$B8D439   |
	BPL CODE_B8D441				;$B8D43B   |
	EOR #$FFFF				;$B8D43D   |
	INC A					;$B8D440   |
CODE_B8D441:					;	   |
	CMP #$0005				;$B8D441   |
	BPL CODE_B8D450				;$B8D444   |
	LDA #$0001				;$B8D446   |
	SEC					;$B8D449   |
	RTS					;$B8D44A  /

CODE_B8D44B:
	LDA #$0001				;$B8D44B  \
	CLC					;$B8D44E   |
	RTS					;$B8D44F  /

CODE_B8D450:
	LDA #$0000				;$B8D450  \
	CLC					;$B8D453   |
	RTS					;$B8D454  /

CODE_B8D455:
	LDX current_sprite			;$B8D455  \
	LDA $0A,x				;$B8D457   |
	SEC					;$B8D459   |
	SBC #$0008				;$B8D45A   |
	JSL CODE_B5C3E3				;$B8D45D   |
	JSR CODE_B8D484				;$B8D461   |
	STA $5E					;$B8D464   |
	LDA $AE					;$B8D466   |
	AND #$1000				;$B8D468   |
	BEQ CODE_B8D450				;$B8D46B   |
	LDA $5E					;$B8D46D   |
	CLC					;$B8D46F   |
	ADC #$0027				;$B8D470   |
	CMP $0A,x				;$B8D473   |
	BPL CODE_B8D450				;$B8D475   |
	LDA #$0000				;$B8D477   |
	SEC					;$B8D47A   |
	RTS					;$B8D47B  /

CODE_B8D47C:
	JSR CODE_B8D480				;$B8D47C  \
	RTL					;$B8D47F  /

CODE_B8D480:
	JSL CODE_B5C3E1				;$B8D480  \
CODE_B8D484:					;	   |
	CMP #$0000				;$B8D484   |
	BMI CODE_B8D492				;$B8D487   |
	EOR #$FFFF				;$B8D489   |
	CLC					;$B8D48C   |
	ADC #$6301				;$B8D48D   |
	CLC					;$B8D490   |
	RTS					;$B8D491  /

CODE_B8D492:
	LDA #$7F00				;$B8D492  \
	SEC					;$B8D495   |
	RTS					;$B8D496  /

CODE_B8D497:
	JSL CODE_B5C3D5				;$B8D497  \
	CMP #$0000				;$B8D49B   |
	BMI CODE_B8D4A9				;$B8D49E   |
	EOR #$FFFF				;$B8D4A0   |
	CLC					;$B8D4A3   |
	ADC #$6301				;$B8D4A4   |
	CLC					;$B8D4A7   |
	RTS					;$B8D4A8  /

CODE_B8D4A9:
	LDA #$7F00				;$B8D4A9  \
	SEC					;$B8D4AC   |
	RTS					;$B8D4AD  /

CODE_B8D4AE:
	STX $E9					;$B8D4AE  \
	LDY active_kong_sprite			;$B8D4B0   |
	LDA #$0100				;$B8D4B3   |
	CMP $06,x				;$B8D4B6   |
	BCS CODE_B8D4C3				;$B8D4B8   |
	ADC $0AFC				;$B8D4BA   |
	CMP $06,x				;$B8D4BD   |
	BCC CODE_B8D4C3				;$B8D4BF   |
	LDA $06,x				;$B8D4C1   |
CODE_B8D4C3:					;	   |
	STA $19C6				;$B8D4C3   |
	LDA $0D54				;$B8D4C6   |
	BMI CODE_B8D4D3				;$B8D4C9   |
	CLC					;$B8D4CB   |
	ADC #$00C0				;$B8D4CC   |
	CMP $0A,x				;$B8D4CF   |
	BCC CODE_B8D4D5				;$B8D4D1   |
CODE_B8D4D3:					;	   |
	LDA $0A,x				;$B8D4D3   |
CODE_B8D4D5:					;	   |
	CMP $000A,y				;$B8D4D5   |
	BCC CODE_B8D4DD				;$B8D4D8   |
	LDA $000A,y				;$B8D4DA   |
CODE_B8D4DD:					;	   |
	STA $19C8				;$B8D4DD   |
	LDA $19C6				;$B8D4E0   |
	LDY $19C8				;$B8D4E3   |
	JSR CODE_B8D5AF				;$B8D4E6   |
	BCC CODE_B8D508				;$B8D4E9   |
	LDY active_kong_sprite			;$B8D4EB   |
	SBC $000A,y				;$B8D4EE   |
	BPL CODE_B8D508				;$B8D4F1   |
	CMP #$FFE8				;$B8D4F3   |
	BCS CODE_B8D508				;$B8D4F6   |
	LDY active_kong_sprite			;$B8D4F8   |
	LDX $E9					;$B8D4FB   |
	LDA $000A,y				;$B8D4FD   |
	STA $0A,x				;$B8D500   |
	LDA $0006,y				;$B8D502   |
	STA $06,x				;$B8D505   |
	RTL					;$B8D507  /

CODE_B8D508:
	LDY active_kong_sprite			;$B8D508  \
	LDA $0006,y				;$B8D50B   |
	STA $D9					;$B8D50E   |
	CMP $19C6				;$B8D510   |
	LDA #$FFF8				;$B8D513   |
	BCS CODE_B8D51B				;$B8D516   |
	LDA #$0008				;$B8D518   |
CODE_B8D51B:					;	   |
	STA $DD					;$B8D51B   |
	STZ $DB					;$B8D51D   |
CODE_B8D51F:					;	   |
	LDA $DD					;$B8D51F   |
	BEQ CODE_B8D550				;$B8D521   |
	CLC					;$B8D523   |
	ADC $D9					;$B8D524   |
	STA $D9					;$B8D526   |
	CMP $19C6				;$B8D528   |
	ROR A					;$B8D52B   |
	EOR $DD					;$B8D52C   |
	BPL CODE_B8D537				;$B8D52E   |
	LDA $19C6				;$B8D530   |
	STA $D9					;$B8D533   |
	STZ $DD					;$B8D535   |
CODE_B8D537:					;	   |
	LDA $D9					;$B8D537   |
	LDY $19C8				;$B8D539   |
	JSR CODE_B8D5AF				;$B8D53C   |
	BCC CODE_B8D51F				;$B8D53F   |
	SBC $19C8				;$B8D541   |
	TAY					;$B8D544   |
	BPL CODE_B8D51F				;$B8D545   |
	INC $DB					;$B8D547   |
	CPY #$FFF8				;$B8D549   |
	BCS CODE_B8D51F				;$B8D54C   |
	BRA CODE_B8D555				;$B8D54E  /

CODE_B8D550:
	LDA $DB					;$B8D550  \
	BNE CODE_B8D555				;$B8D552   |
	RTL					;$B8D554  /

CODE_B8D555:
	LDY active_kong_sprite			;$B8D555  \
	LDA $0006,y				;$B8D558   |
	STA $19C6				;$B8D55B   |
	CMP $D9					;$B8D55E   |
	LDA #$0002				;$B8D560   |
	BCS CODE_B8D568				;$B8D563   |
	LDA #$FFFE				;$B8D565   |
CODE_B8D568:					;	   |
	STA $DD					;$B8D568   |
CODE_B8D56A:					;	   |
	LDA $DD					;$B8D56A   |
	BEQ CODE_B8D5A5				;$B8D56C   |
	CLC					;$B8D56E   |
	ADC $D9					;$B8D56F   |
	STA $D9					;$B8D571   |
	CMP $19C6				;$B8D573   |
	ROR A					;$B8D576   |
	EOR $DD					;$B8D577   |
	BPL CODE_B8D582				;$B8D579   |
	LDA $19C6				;$B8D57B   |
	STA $D9					;$B8D57E   |
	STZ $DD					;$B8D580   |
CODE_B8D582:					;	   |
	LDA $D9					;$B8D582   |
	LDY $19C8				;$B8D584   |
	JSR CODE_B8D5AF				;$B8D587   |
	BCC CODE_B8D5A5				;$B8D58A   |
	SBC $19C8				;$B8D58C   |
	TAY					;$B8D58F   |
	CPY #$FFF8				;$B8D590   |
	BCC CODE_B8D56A				;$B8D593   |
	LDX $E9					;$B8D595   |
	TYA					;$B8D597   |
	CMP #$0008				;$B8D598   |
	BCC CODE_B8D5A5				;$B8D59B   |
	CMP #$FFF8				;$B8D59D   |
	BCS CODE_B8D5A5				;$B8D5A0   |
	LDA #$0000				;$B8D5A2   |
CODE_B8D5A5:					;	   |
	ADC $19C8				;$B8D5A5   |
	STA $0A,x				;$B8D5A8   |
	LDA $D9					;$B8D5AA   |
	STA $06,x				;$B8D5AC   |
	RTL					;$B8D5AE  /

CODE_B8D5AF:
	STY $34					;$B8D5AF  \
	JSL CODE_B5C3E7				;$B8D5B1   |
	EOR #$FFFF				;$B8D5B5   |
	BPL CODE_B8D5C0				;$B8D5B8   |
	CLC					;$B8D5BA   |
	ADC #$6301				;$B8D5BB   |
	SEC					;$B8D5BE   |
	RTS					;$B8D5BF  /

CODE_B8D5C0:
	CLC					;$B8D5C0  \
	RTS					;$B8D5C1  /

CODE_B8D5C2:
	LDA $B0					;$B8D5C2  \
	STA $06,x				;$B8D5C4   |
	LDA $B2					;$B8D5C6   |
	STZ $04,x				;$B8D5C8   |
	LDA $1E,x				;$B8D5CA   |
	AND #$1000				;$B8D5CC   |
	BEQ CODE_B8D5DF				;$B8D5CF   |
	JSR CODE_B8D480				;$B8D5D1   |
	STA $74					;$B8D5D4   |
	SEC					;$B8D5D6   |
	SBC $0A,x				;$B8D5D7   |
	BPL CODE_B8D5DF				;$B8D5D9   |
	LDA $FD					;$B8D5DB   |
	STA $0A,x				;$B8D5DD   |
CODE_B8D5DF:					;	   |
	RTS					;$B8D5DF  /

CODE_B8D5E0:
	PHB					;$B8D5E0  \
	JSR CODE_B8D5E6				;$B8D5E1   |
	PLB					;$B8D5E4   |
	RTL					;$B8D5E5  /

CODE_B8D5E6:
	LDX current_sprite			;$B8D5E6  \
	LDA $1E,x				;$B8D5E8   |
	TAY					;$B8D5EA   |
	AND #$00FF				;$B8D5EB   |
	XBA					;$B8D5EE   |
	STA $5E					;$B8D5EF   |
	TYA					;$B8D5F1   |
	LSR A					;$B8D5F2   |
	LSR A					;$B8D5F3   |
	LSR A					;$B8D5F4   |
	LSR A					;$B8D5F5   |
	AND #$000F				;$B8D5F6   |
	ORA $5E					;$B8D5F9   |
	STA $1E,x				;$B8D5FB   |
	LDX current_sprite			;$B8D5FD   |
	LDA $06,x				;$B8D5FF   |
	STA $B0					;$B8D601   |
	LDA $04,x				;$B8D603   |
	STA $B2					;$B8D605   |
	STZ $E5					;$B8D607   |
	LDA $1E,x				;$B8D609   |
	AND #$0400				;$B8D60B   |
	BNE CODE_B8D675				;$B8D60E   |
	JSR CODE_B8D830				;$B8D610   |
	JSR CODE_B8D480				;$B8D613   |
	STA $74					;$B8D616   |
	SEC					;$B8D618   |
	SBC $0A,x				;$B8D619   |
	BPL CODE_B8D673				;$B8D61B   |
	CMP $0BA4				;$B8D61D   |
	BPL CODE_B8D691				;$B8D620   |
	LDA $AE					;$B8D622   |
	AND #$0400				;$B8D624   |
	BNE CODE_B8D630				;$B8D627   |
	LDA $AC					;$B8D629   |
	AND #$3800				;$B8D62B   |
	BNE CODE_B8D68E				;$B8D62E   |
CODE_B8D630:					;	   |
	LDA $20,x				;$B8D630   |
	AND #$8000				;$B8D632   |
	EOR $AE					;$B8D635   |
	BMI CODE_B8D642				;$B8D637   |
	DEC A					;$B8D639   |
	AND #$80FE				;$B8D63A   |
	CMP #$003C				;$B8D63D   |
	BEQ CODE_B8D68E				;$B8D640   |
CODE_B8D642:					;	   |
	LDA $0A,x				;$B8D642   |
	DEC A					;$B8D644   |
	JSL CODE_B5C3E3				;$B8D645   |
	LDA $20,x				;$B8D649   |
	AND #$8000				;$B8D64B   |
	EOR $AE					;$B8D64E   |
	BMI CODE_B8D65B				;$B8D650   |
	DEC A					;$B8D652   |
	AND #$00FE				;$B8D653   |
	CMP #$003C				;$B8D656   |
	BEQ CODE_B8D68E				;$B8D659   |
CODE_B8D65B:					;	   |
	STZ $26,x				;$B8D65B   |
	STZ $20,x				;$B8D65D   |
	JSR CODE_B8D5C2				;$B8D65F   |
	BIT $AE					;$B8D662   |
	BVS CODE_B8D66C				;$B8D664   |
	LDA $AE					;$B8D666   |
	XBA					;$B8D668   |
	LSR A					;$B8D669   |
	BCS CODE_B8D6A7				;$B8D66A   |
CODE_B8D66C:					;	   |
	LDA #$0002				;$B8D66C   |
	ORA $1E,x				;$B8D66F   |
	STA $1E,x				;$B8D671   |
CODE_B8D673:					;	   |
	BRA CODE_B8D6C4				;$B8D673  /

CODE_B8D675:
	JSR CODE_B8D830				;$B8D675  \
	JSR CODE_B8D480				;$B8D678   |
	STA $74					;$B8D67B   |
	SEC					;$B8D67D   |
	SBC $0A,x				;$B8D67E   |
	BPL CODE_B8D6C4				;$B8D680   |
	CMP #$FFFD				;$B8D682   |
	BPL CODE_B8D6C0				;$B8D685   |
	LDA $AE					;$B8D687   |
	AND #$4000				;$B8D689   |
	BEQ CODE_B8D6B0				;$B8D68C   |
CODE_B8D68E:					;	   |
	BRL CODE_B8D73C				;$B8D68E  /

CODE_B8D691:
	LDA $AC					;$B8D691  \
	AND #$0007				;$B8D693   |
	CMP $88					;$B8D696   |
	BPL CODE_B8D630				;$B8D698   |
	LDA $AE					;$B8D69A   |
	AND #$1800				;$B8D69C   |
	BNE CODE_B8D6C4				;$B8D69F   |
	LDA $74					;$B8D6A1   |
	STA $0A,x				;$B8D6A3   |
	BRA CODE_B8D6C4				;$B8D6A5  /

CODE_B8D6A7:
	LDA #$0082				;$B8D6A7  \
	ORA $1E,x				;$B8D6AA   |
	STA $1E,x				;$B8D6AC   |
	BRA CODE_B8D6C4				;$B8D6AE  /

CODE_B8D6B0:
	JSR CODE_B8D5C2				;$B8D6B0  \
	STZ $26,x				;$B8D6B3   |
	STZ $20,x				;$B8D6B5   |
	LDA #$0002				;$B8D6B7   |
	ORA $1E,x				;$B8D6BA   |
	STA $1E,x				;$B8D6BC   |
	BRA CODE_B8D73C				;$B8D6BE  /

CODE_B8D6C0:
	LDA $74					;$B8D6C0  \
	STA $0A,x				;$B8D6C2   |
CODE_B8D6C4:					;	   |
	INC $E5					;$B8D6C4   |
	LDA $24,x				;$B8D6C6   |
	BPL CODE_B8D6CD				;$B8D6C8   |
	BRL CODE_B8D7A1				;$B8D6CA  /

CODE_B8D6CD:
	JSR CODE_B8D817				;$B8D6CD  \
	JSR CODE_B8D480				;$B8D6D0   |
	TAY					;$B8D6D3   |
	BCS CODE_B8D70B				;$B8D6D4   |
	SEC					;$B8D6D6   |
	SBC $0A,x				;$B8D6D7   |
	BPL CODE_B8D712				;$B8D6D9   |
CODE_B8D6DB:					;	   |
	LDA $AE					;$B8D6DB   |
	AND #$0400				;$B8D6DD   |
	BNE CODE_B8D6E9				;$B8D6E0   |
	LDA $AE					;$B8D6E2   |
	AND #$1800				;$B8D6E4   |
	BNE CODE_B8D70B				;$B8D6E7   |
CODE_B8D6E9:					;	   |
	TYA					;$B8D6E9   |
	STA $0A,x				;$B8D6EA   |
	STA $0C,x				;$B8D6EC   |
	LDA $AC					;$B8D6EE   |
	TXY					;$B8D6F0   |
	AND #$0007				;$B8D6F1   |
	ASL A					;$B8D6F4   |
	TAX					;$B8D6F5   |
	LDA.l DATA_B8D7EE,x			;$B8D6F6   |
	TYX					;$B8D6FA   |
	STA $24,x				;$B8D6FB   |
	STZ $08,x				;$B8D6FD   |
	STZ $0E,x				;$B8D6FF   |
	LDA #$0001				;$B8D701   |
	ORA $1E,x				;$B8D704   |
	STA $1E,x				;$B8D706   |
	BRL CODE_B8D795				;$B8D708  /

CODE_B8D70B:
	LDA #$8050				;$B8D70B  \
	STA $0E,x				;$B8D70E   |
	BRA CODE_B8D729				;$B8D710  /

CODE_B8D712:
	STA $5E					;$B8D712  \
	LDA $AC					;$B8D714   |
	AND #$0007				;$B8D716   |
	BEQ CODE_B8D71E				;$B8D719   |
	LDA #$0003				;$B8D71B   |
CODE_B8D71E:					;	   |
	INC A					;$B8D71E   |
	STA $60					;$B8D71F   |
	LDA $5E					;$B8D721   |
	CMP $60					;$B8D723   |
	BMI CODE_B8D6DB				;$B8D725   |
	STA $0E,x				;$B8D727   |
CODE_B8D729:					;	   |
	TYA					;$B8D729   |
	STA $0C,x				;$B8D72A   |
	LDA $1E,x				;$B8D72C   |
	AND #$0101				;$B8D72E   |
	CMP #$0100				;$B8D731   |
	BNE CODE_B8D73A				;$B8D734   |
	STZ $24,x				;$B8D736   |
	INC $24,x				;$B8D738   |
CODE_B8D73A:					;	   |
	BRA CODE_B8D795				;$B8D73A  /

CODE_B8D73C:
	LDA $0A,x				;$B8D73C  \
	STA $B0					;$B8D73E   |
	INC $E5					;$B8D740   |
	JSR CODE_B8D817				;$B8D742   |
	JSR CODE_B8D480				;$B8D745   |
	STA $0C,x				;$B8D748   |
	SEC					;$B8D74A   |
	SBC $0A,x				;$B8D74B   |
	STA $0E,x				;$B8D74D   |
	BPL CODE_B8D795				;$B8D74F   |
	LDA $AE					;$B8D751   |
	AND #$4000				;$B8D753   |
	BNE CODE_B8D78E				;$B8D756   |
	LDA $24,x				;$B8D758   |
	BMI CODE_B8D777				;$B8D75A   |
	LDA #$0200				;$B8D75C   |
	STA $24,x				;$B8D75F   |
	STZ $08,x				;$B8D761   |
	LDA $0A,x				;$B8D763   |
	AND #$FFE0				;$B8D765   |
	STA $0A,x				;$B8D768   |
	STA $0C,x				;$B8D76A   |
	STZ $0E,x				;$B8D76C   |
	LDA #$0001				;$B8D76E   |
	ORA $1E,x				;$B8D771   |
	STA $1E,x				;$B8D773   |
	BRA CODE_B8D78E				;$B8D775  /

CODE_B8D777:
	LDA $0A,x				;$B8D777  \
	CLC					;$B8D779   |
	ADC #$001F				;$B8D77A   |
	AND #$FFE0				;$B8D77D   |
	STA $0A,x				;$B8D780   |
	STA $0C,x				;$B8D782   |
	STZ $0E,x				;$B8D784   |
	LDA $B0					;$B8D786   |
	STA $0A,x				;$B8D788   |
	STZ $24,x				;$B8D78A   |
	STZ $2A,x				;$B8D78C   |
CODE_B8D78E:					;	   |
	LDA #$0004				;$B8D78E   |
	ORA $1E,x				;$B8D791   |
	STA $1E,x				;$B8D793   |
CODE_B8D795:					;	   |
	LDA $AE					;$B8D795   |
	EOR $AC					;$B8D797   |
	AND #$1E00				;$B8D799   |
	EOR $AC					;$B8D79C   |
	STA $10,x				;$B8D79E   |
	RTS					;$B8D7A0  /

CODE_B8D7A1:
	LDA $0A,x				;$B8D7A1  \
	STA $B0					;$B8D7A3   |
	INC $E5					;$B8D7A5   |
	JSR CODE_B8D817				;$B8D7A7   |
	JSR CODE_B8D480				;$B8D7AA   |
	TAY					;$B8D7AD   |
	BCS CODE_B8D7E4				;$B8D7AE   |
	SEC					;$B8D7B0   |
	SBC $0A,x				;$B8D7B1   |
	BPL CODE_B8D7E7				;$B8D7B3   |
	BIT $AC					;$B8D7B5   |
	BVS CODE_B8D7D6				;$B8D7B7   |
	LDA $B0					;$B8D7B9   |
	STA $0A,x				;$B8D7BB   |
	STZ $24,x				;$B8D7BD   |
	STZ $2A,x				;$B8D7BF   |
	JSR CODE_B8D480				;$B8D7C1   |
	STA $0C,x				;$B8D7C4   |
	BCS CODE_B8D7CF				;$B8D7C6   |
	SEC					;$B8D7C8   |
	SBC $0A,x				;$B8D7C9   |
	STA $0E,x				;$B8D7CB   |
	BRA CODE_B8D795				;$B8D7CD  /

CODE_B8D7CF:
	LDA #$8050				;$B8D7CF  \
	STA $0E,x				;$B8D7D2   |
	BRA CODE_B8D795				;$B8D7D4  /

CODE_B8D7D6:
	STA $0E,x				;$B8D7D6  \
	TYA					;$B8D7D8   |
	STA $0C,x				;$B8D7D9   |
	LDA #$0004				;$B8D7DB   |
	ORA $1E,x				;$B8D7DE   |
	STA $1E,x				;$B8D7E0   |
	BRA CODE_B8D795				;$B8D7E2  /

CODE_B8D7E4:
	LDA #$8050				;$B8D7E4  \
CODE_B8D7E7:					;	   |
	STA $0E,x				;$B8D7E7   |
	TYA					;$B8D7E9   |
	STA $0C,x				;$B8D7EA   |
	BRA CODE_B8D795				;$B8D7EC  /

DATA_B8D7EE:
	db $00, $03, $00, $03, $00, $03, $00, $04
	db $00, $05, $00, $06, $00, $08, $00, $08

CODE_B8D7FE:
	LDX current_sprite			;$B8D7FE  \
	LDY #$0000				;$B8D800   |
	LDA $20,x				;$B8D803   |
	BPL CODE_B8D808				;$B8D805   |
	DEY					;$B8D807   |
CODE_B8D808:					;	   |
	CLC					;$B8D808   |
	ADC $05,x				;$B8D809   |
	STA $05,x				;$B8D80B   |
	TYA					;$B8D80D   |
	ADC $07,x				;$B8D80E   |
	SEP #$20				;$B8D810   |
	STA $07,x				;$B8D812   |
	REP #$20				;$B8D814   |
	RTS					;$B8D816  /

CODE_B8D817:
	LDX current_sprite			;$B8D817  \
	LDY #$0000				;$B8D819   |
	LDA $24,x				;$B8D81C   |
	BPL CODE_B8D821				;$B8D81E   |
	DEY					;$B8D820   |
CODE_B8D821:					;	   |
	CLC					;$B8D821   |
	ADC $09,x				;$B8D822   |
	STA $09,x				;$B8D824   |
	TYA					;$B8D826   |
	ADC $0B,x				;$B8D827   |
	SEP #$20				;$B8D829   |
	STA $0B,x				;$B8D82B   |
	REP #$20				;$B8D82D   |
	RTS					;$B8D82F  /

CODE_B8D830:
	LDX current_sprite			;$B8D830  \
	LDA $1E,x				;$B8D832   |
	AND #$1000				;$B8D834   |
	BNE CODE_B8D850				;$B8D837   |
CODE_B8D839:					;	   |
	LDY #$0000				;$B8D839   |
	LDA $20,x				;$B8D83C   |
	BPL CODE_B8D841				;$B8D83E   |
	DEY					;$B8D840   |
CODE_B8D841:					;	   |
	CLC					;$B8D841   |
	ADC $05,x				;$B8D842   |
	STA $05,x				;$B8D844   |
	TYA					;$B8D846   |
	ADC $07,x				;$B8D847   |
	SEP #$20				;$B8D849   |
	STA $07,x				;$B8D84B   |
	REP #$20				;$B8D84D   |
	RTS					;$B8D84F  /

CODE_B8D850:
	LDA $24,x				;$B8D850  \
	BMI CODE_B8D839				;$B8D852   |
	LDA $0A,x				;$B8D854   |
	STA $FD					;$B8D856   |
	LDA $0C,x				;$B8D858   |
	STA $0A,x				;$B8D85A   |
	LDA #$FFFF				;$B8D85C   |
	STA $08,x				;$B8D85F   |
	LDA $5C,x				;$B8D861   |
	CLC					;$B8D863   |
	ADC $06,x				;$B8D864   |
	STA $06,x				;$B8D866   |
	STZ $5C,x				;$B8D868   |
	LDY #$0000				;$B8D86A   |
	LDA $20,x				;$B8D86D   |
	BPL CODE_B8D872				;$B8D86F   |
	DEY					;$B8D871   |
CODE_B8D872:					;	   |
	CLC					;$B8D872   |
	ADC $05,x				;$B8D873   |
	STA $05,x				;$B8D875   |
	TYA					;$B8D877   |
	ADC $07,x				;$B8D878   |
	SEP #$20				;$B8D87A   |
	STA $07,x				;$B8D87C   |
	REP #$20				;$B8D87E   |
	CPX inactive_kong_sprite		;$B8D880   |
	BEQ CODE_B8D88A				;$B8D883   |
	CPX active_kong_sprite			;$B8D885   |
	BNE CODE_B8D8B9				;$B8D888   |
CODE_B8D88A:					;	   |
	LDA $052B				;$B8D88A   |
	AND #$0100				;$B8D88D   |
	BEQ CODE_B8D8B9				;$B8D890   |
	LDA $0A28				;$B8D892   |
	DEC A					;$B8D895   |
	CMP $06,x				;$B8D896   |
	BPL CODE_B8D8A6				;$B8D898   |
	STA $06,x				;$B8D89A   |
	LDA #$FFFF				;$B8D89C   |
	STA $04,x				;$B8D89F   |
	STZ $26,x				;$B8D8A1   |
	STZ $20,x				;$B8D8A3   |
	RTS					;$B8D8A5  /

CODE_B8D8A6:
	LDA $0A26				;$B8D8A6  \
	CMP $06,x				;$B8D8A9   |
	BMI CODE_B8D8B9				;$B8D8AB   |
	INC A					;$B8D8AD   |
	STA $06,x				;$B8D8AE   |
	LDA #$0000				;$B8D8B0   |
	STA $04,x				;$B8D8B3   |
	STZ $26,x				;$B8D8B5   |
	STZ $20,x				;$B8D8B7   |
CODE_B8D8B9:					;	   |
	RTS					;$B8D8B9  /

CODE_B8D8BA:
	JSR set_player_interaction		;$B8D8BA  \
	RTL					;$B8D8BD  /

set_player_interaction:
	CMP $0A82				;$B8D8BE  \
	BEQ CODE_B8D8CF				;$B8D8C1   |
	BMI CODE_B8D8CF				;$B8D8C3   |
	STA $0A82				;$B8D8C5   |
	LDA current_sprite			;$B8D8C8   |
	STA $0A84				;$B8D8CA   |
	CLC					;$B8D8CD   |
	RTS					;$B8D8CE  /

CODE_B8D8CF:
	SEC					;$B8D8CF  \
	RTS					;$B8D8D0  /

CODE_B8D8D1:
	JSR CODE_B8D8D5				;$B8D8D1  \
	RTL					;$B8D8D4  /



;$32	0000
;$34	follower x
;$36	0000
;$38	follower y
;$3A	A (distance divisor)
;$3C	X
;$3E	Y
;$40	divided x distance sub
;$42	divided x distance
;$44	divided y distance sub
;$46	divided y distance
;$48	
;$4A	

CODE_B8D8D5:
	STZ $4A					;$B8D8D5  \
CODE_B8D8D7:					;	   |
	STA $3A					;$B8D8D7   |\
	STX $3C					;$B8D8D9   | | store registers in scratch
	STY $3E					;$B8D8DB   |/
	LDX inactive_kong_sprite		;$B8D8DD   |\
	LDA #$0000				;$B8D8E0   | |
	STA $32					;$B8D8E3   | |
	LDA $06,x				;$B8D8E5   | |
	STA $34					;$B8D8E7   | | store x position of follower kong
	LDA #$0000				;$B8D8E9   | |
	STA $36					;$B8D8EC   | |
	LDA $0A,x				;$B8D8EE   | | store y position of follower kong
	STA $38					;$B8D8F0   |/
	STZ $40					;$B8D8F2   |\
	STZ $42					;$B8D8F4   | | clear scratch ram
	STZ $44					;$B8D8F6   | |
	STZ $46					;$B8D8F8   |/
	LDX active_kong_sprite			;$B8D8FA   |\
	LDA $06,x				;$B8D8FD   | | calculate x distance between both kongs
	SEC					;$B8D8FF   | |
	SBC $34					;$B8D900   |/
	JSR .divide_distance			;$B8D902   |\
	STA $41					;$B8D905   |/
	BPL .positive_x_distance		;$B8D907   |
	SEP #$20				;$B8D909   |\
	DEC $43					;$B8D90B   | | if distance was negative invert division result
	REP #$20				;$B8D90D   |/
.positive_x_distance				;	   |
	LDA $0A,x				;$B8D90F   |\
	CLC					;$B8D911   | |
	ADC $4A					;$B8D912   | | calculate y distance between both kongs
	SEC					;$B8D914   | |
	SBC $38					;$B8D915   |/
	JSR .divide_distance			;$B8D917   |\
	STA $45					;$B8D91A   |/
	BPL .positive_y_distance		;$B8D91C   |
	SEP #$20				;$B8D91E   |
	DEC $47					;$B8D920   |
	REP #$20				;$B8D922   |
.positive_y_distance				;	   |
	LDX #$0000				;$B8D924   |
.next_waypoint					;	   |
	LDA $34					;$B8D927   |\
	STA $7FA532,x				;$B8D929   | |
	LDA $38					;$B8D92D   | |
	STA $7FA572,x				;$B8D92F   | | save waypoint to buffer
	LDA $3C					;$B8D933   | |
	STA $7FA5F2,x				;$B8D935   | |
	LDA $3E					;$B8D939   | |
	STA $7FA5B2,x				;$B8D93B   |/
	LDA $32					;$B8D93F   |\
	CLC					;$B8D941   | |
	ADC $40					;$B8D942   | |
	STA $32					;$B8D944   | |
	LDA $34					;$B8D946   | |
	ADC $42					;$B8D948   | |
	STA $34					;$B8D94A   |/
	LDA $36					;$B8D94C   |\
	CLC					;$B8D94E   | |
	ADC $44					;$B8D94F   | |
	STA $36					;$B8D951   | |
	LDA $38					;$B8D953   | |
	ADC $46					;$B8D955   | |
	STA $38					;$B8D957   |/
	TXA					;$B8D959   |
	INC A					;$B8D95A   |
	INC A					;$B8D95B   |
	AND #$003F				;$B8D95C   |
	TAX					;$B8D95F   |
	DEC $3A					;$B8D960   |
	BNE .next_waypoint			;$B8D962   |
	STA $099D				;$B8D964   |
	STZ $099F				;$B8D967   |
	RTS					;$B8D96A  /

.divide_distance
	BPL .divide				;$B8D96B  \ \
	EOR #$FFFF				;$B8D96D   | | ensure distance value is positive for division
	INC A					;$B8D970   |/
	JSR .divide				;$B8D971   |
	EOR #$FFFF				;$B8D974   |\
	INC A					;$B8D977   | | restore negation of distance
	RTS					;$B8D978  / /

.divide
	CMP #$0100				;$B8D979  \
	BMI .within_range			;$B8D97C   |
	LDA #$00FF				;$B8D97E   |> kongs more than 0x100 pixels apart, clamp distance to 0x100
.within_range					;	   |
	AND #$00FF				;$B8D981   |\
	XBA					;$B8D984   | |
	STA CPU.dividen				;$B8D985   | |
	SEP #$20				;$B8D988   | |
	LDA $3A					;$B8D98A   | |
	STA CPU.divisor				;$B8D98C   | | return = kong distance / distance divisor
	REP #$20				;$B8D98F   | |
	LDA CPU.divide_result			;$B8D991   | |
	LDA CPU.divide_result			;$B8D994   | |
	LDA CPU.divide_result			;$B8D997   | |
	LDA CPU.divide_result			;$B8D99A   | |
	RTS					;$B8D99D  / /

CODE_B8D99E:
	LDA $099F				;$B8D99E  \
	AND #$003F				;$B8D9A1   |
	TAX					;$B8D9A4   |
	LDY current_sprite			;$B8D9A5   |
	LDA.l $7FA532,x				;$B8D9A7   |
	STA $0006,y				;$B8D9AB   |
	LDA.l $7FA572,x				;$B8D9AE   |
	STA $000A,y				;$B8D9B2   |
	LDA.l $7FA5F2,x				;$B8D9B5   |
	STA $092F				;$B8D9B9   |
	LDA.l $7FA5B2,x				;$B8D9BC   |
	STA $0931				;$B8D9C0   |
	LDA $099D				;$B8D9C3   |
	DEC A					;$B8D9C6   |
	DEC A					;$B8D9C7   |
	AND #$003F				;$B8D9C8   |
	TAX					;$B8D9CB   |
	LDA.l $7FA532,x				;$B8D9CC   |
	SEC					;$B8D9D0   |
	SBC $0006,y				;$B8D9D1   |
	STA $5E					;$B8D9D4   |
	BNE CODE_B8D9DA				;$B8D9D6   |
	BRA CODE_B8D9DD				;$B8D9D8  /

CODE_B8D9DA:
	JSR CODE_B8DA65				;$B8D9DA  \
CODE_B8D9DD:					;	   |
	LDA $0933				;$B8D9DD   |
	AND #$0003				;$B8D9E0   |
	BNE CODE_B8DA23				;$B8D9E3   |
	LDX current_sprite			;$B8D9E5   |
	JSR CODE_B8D480				;$B8D9E7   |
	BCS CODE_B8DA54				;$B8D9EA   |
	LDX current_sprite			;$B8D9EC   |
	SEC					;$B8D9EE   |
	SBC $0A,x				;$B8D9EF   |
	STA $0E,x				;$B8D9F1   |
	BNE CODE_B8DA54				;$B8D9F3   |
	LDA $AC					;$B8D9F5   |
	AND #$0007				;$B8D9F7   |
	CMP #$0006				;$B8D9FA   |
	BEQ CODE_B8DA54				;$B8D9FD   |
	LDA $5E					;$B8D9FF   |
	BPL CODE_B8DA07				;$B8DA01   |
	EOR #$FFFF				;$B8DA03   |
	INC A					;$B8DA06   |
CODE_B8DA07:					;	   |
	TAY					;$B8DA07   |
	TYA					;$B8DA08   |
	CMP #$001C				;$B8DA09   |
	BPL CODE_B8DA32				;$B8DA0C   |
	LDY active_kong_sprite			;$B8DA0E   |
	LDA $0026,y				;$B8DA11   |
	BNE CODE_B8DA64				;$B8DA14   |
	LDA $0020,y				;$B8DA16   |
	BNE CODE_B8DA64				;$B8DA19   |
	LDA #$0008				;$B8DA1B   |
	TSB $0933				;$B8DA1E   |
	BRA CODE_B8DA64				;$B8DA21  /

CODE_B8DA23:
	PHA					;$B8DA23  \
	EOR $0933				;$B8DA24   |
	STA $0933				;$B8DA27   |
	PLA					;$B8DA2A   |
	AND #$0002				;$B8DA2B   |
	BEQ CODE_B8DA54				;$B8DA2E   |
	BRA CODE_B8DA44				;$B8DA30  /

CODE_B8DA32:
	LDA $099F				;$B8DA32  \
	INC A					;$B8DA35   |
	INC A					;$B8DA36   |
	AND #$003F				;$B8DA37   |
	CMP $099D				;$B8DA3A   |
	BEQ CODE_B8DA64				;$B8DA3D   |
	STA $099F				;$B8DA3F   |
	BRA CODE_B8DA64				;$B8DA42  /

CODE_B8DA44:
	LDA $099F				;$B8DA44  \
	INC A					;$B8DA47   |
	INC A					;$B8DA48   |
	AND #$003F				;$B8DA49   |
	CMP $099D				;$B8DA4C   |
	BEQ CODE_B8DA64				;$B8DA4F   |
	STA $099F				;$B8DA51   |
CODE_B8DA54:					;	   |
	LDA $099F				;$B8DA54   |
	INC A					;$B8DA57   |
	INC A					;$B8DA58   |
	AND #$003F				;$B8DA59   |
	CMP $099D				;$B8DA5C   |
	BEQ CODE_B8DA64				;$B8DA5F   |
	STA $099F				;$B8DA61   |
CODE_B8DA64:					;	   |
	RTS					;$B8DA64  /

CODE_B8DA65:
	LDX inactive_kong_sprite		;$B8DA65  \
	LDY active_kong_sprite			;$B8DA68   |
	LDA $0006,y				;$B8DA6B   |
	SEC					;$B8DA6E   |
	SBC $06,x				;$B8DA6F   |
	LSR A					;$B8DA71   |
	EOR $12,x				;$B8DA72   |
	AND #$4000				;$B8DA74   |
	BNE CODE_B8DA7A				;$B8DA77   |
	RTS					;$B8DA79  /

CODE_B8DA7A:
	LDA $0933				;$B8DA7A  \
	ORA #$0004				;$B8DA7D   |
	STA $0933				;$B8DA80   |
	RTS					;$B8DA83  /

CODE_B8DA84:
	LDA $092F				;$B8DA84  \
	JSR CODE_B8DB58				;$B8DA87   |
	ASL A					;$B8DA8A   |
	TAX					;$B8DA8B   |
	JMP (DATA_B8DB36,x)			;$B8DA8C  /

CODE_B8DA8F:
	JSL CODE_B9D0B0				;$B8DA8F  \
	RTS					;$B8DA93  /

CODE_B8DA94:
	LDA $0933				;$B8DA94  \
	AND #$0004				;$B8DA97   |
	BNE CODE_B8DAB4				;$B8DA9A   |
	LDA $0933				;$B8DA9C   |
	AND #$0008				;$B8DA9F   |
	BNE CODE_B8DAA6				;$B8DAA2   |
	CLC					;$B8DAA4   |
	RTS					;$B8DAA5  /

CODE_B8DAA6:
	EOR $0933				;$B8DAA6  \
	STA $0933				;$B8DAA9   |
	LDA #$0001				;$B8DAAC   |
	JSR CODE_B8DA8F				;$B8DAAF   |
	SEC					;$B8DAB2   |
	RTS					;$B8DAB3  /

CODE_B8DAB4:
	EOR $0933				;$B8DAB4  \
	STA $0933				;$B8DAB7   |
	LDA #$0041				;$B8DABA   |
	JSR CODE_B8DA8F				;$B8DABD   |
	SEC					;$B8DAC0   |
	RTS					;$B8DAC1  /

CODE_B8DAC2:
	JSR CODE_B8DA94				;$B8DAC2  \
	BCS CODE_B8DACD				;$B8DAC5   |
	LDA #$003B				;$B8DAC7   |
	JMP CODE_B8DA8F				;$B8DACA  /

CODE_B8DACD:
	RTS					;$B8DACD  /

CODE_B8DACE:
	JSR CODE_B8DA94				;$B8DACE  \
	BCS CODE_B8DACD				;$B8DAD1   |
	LDA #$003D				;$B8DAD3   |
	JMP CODE_B8DA8F				;$B8DAD6  /

CODE_B8DAD9:
	LDX current_sprite			;$B8DAD9  \
	LDA $0E,x				;$B8DADB   |
	BEQ CODE_B8DAC2				;$B8DADD   |
	JSR CODE_B8DB27				;$B8DADF   |
	LDA #$003E				;$B8DAE2   |
	JMP CODE_B8DA8F				;$B8DAE5  /

CODE_B8DAE8:
	LDA #$003F				;$B8DAE8  \
	JMP CODE_B8DA8F				;$B8DAEB  /

CODE_B8DAEE:
	LDA #$0001				;$B8DAEE  \
	JMP CODE_B8DA8F				;$B8DAF1  /

CODE_B8DAF4:
	LDA #$0040				;$B8DAF4  \
	JMP CODE_B8DA8F				;$B8DAF7  /

CODE_B8DAFA:
	JSR CODE_B8DB27				;$B8DAFA  \
	LDA $092F				;$B8DAFD   |
	JMP CODE_B8DA8F				;$B8DB00  /

CODE_B8DB03:
	JSR CODE_B8DB27				;$B8DB03  \
	LDA #$0043				;$B8DB06   |
	JMP CODE_B8DA8F				;$B8DB09  /

CODE_B8DB0C:
	JSR CODE_B8DB27				;$B8DB0C  \
	LDA #$0051				;$B8DB0F   |
	JMP CODE_B8DA8F				;$B8DB12  /

CODE_B8DB15:
	JSR CODE_B8DB27				;$B8DB15  \
	LDA $092F				;$B8DB18   |
	JMP CODE_B8DA8F				;$B8DB1B  /

CODE_B8DB1E:
	JSR CODE_B8DB27				;$B8DB1E  \
	LDA $092F				;$B8DB21   |
	JMP CODE_B8DA8F				;$B8DB24  /

CODE_B8DB27:
	LDX current_sprite			;$B8DB27  \
	LDA $0931				;$B8DB29   |
	EOR $12,x				;$B8DB2C   |
	AND #$4000				;$B8DB2E   |
	EOR $12,x				;$B8DB31   |
	STA $12,x				;$B8DB33   |
	RTS					;$B8DB35  /

DATA_B8DB36:
	dw CODE_B8DAC2
	dw CODE_B8DACE
	dw CODE_B8DAD9
	dw CODE_B8DAE8
	dw CODE_B8DAF4
	dw CODE_B8DAFA
	dw CODE_B8DB03
	dw CODE_B8DB0C
	dw CODE_B8DB15
	dw CODE_B8DB1E
	dw CODE_B8DAFA
	dw CODE_B8DAEE
	dw CODE_B8DAC2
	dw CODE_B8DAC2
	dw CODE_B8DAC2
	dw CODE_B8DAC2
	dw CODE_B8DAC2



CODE_B8DB58:
	CMP #$0001				;$B8DB58  \
	BNE CODE_B8DB60				;$B8DB5B   |
	BRL CODE_B8DD80				;$B8DB5D  /

CODE_B8DB60:
	CMP #$0002				;$B8DB60  \
	BNE CODE_B8DB68				;$B8DB63   |
	BRL CODE_B8DD80				;$B8DB65  /

CODE_B8DB68:
	CMP #$0003				;$B8DB68  \
	BNE CODE_B8DB70				;$B8DB6B   |
	BRL CODE_B8DD80				;$B8DB6D  /

CODE_B8DB70:
	CMP #$0004				;$B8DB70  \
	BNE CODE_B8DB78				;$B8DB73   |
	BRL CODE_B8DD84				;$B8DB75  /

CODE_B8DB78:
	CMP #$0005				;$B8DB78  \
	BNE CODE_B8DB80				;$B8DB7B   |
	BRL CODE_B8DD88				;$B8DB7D  /

CODE_B8DB80:
	CMP #$0006				;$B8DB80  \
	BNE CODE_B8DB88				;$B8DB83   |
	BRL CODE_B8DD88				;$B8DB85  /

CODE_B8DB88:
	CMP #$0007				;$B8DB88  \
	BNE CODE_B8DB90				;$B8DB8B   |
	BRL CODE_B8DD8C				;$B8DB8D  /

CODE_B8DB90:
	CMP #$0008				;$B8DB90  \
	BNE CODE_B8DB98				;$B8DB93   |
	BRL CODE_B8DD80				;$B8DB95  /

CODE_B8DB98:
	CMP #$0009				;$B8DB98  \
	BNE CODE_B8DBA0				;$B8DB9B   |
	BRL CODE_B8DD80				;$B8DB9D  /

CODE_B8DBA0:
	CMP #$000A				;$B8DBA0  \
	BNE CODE_B8DBA8				;$B8DBA3   |
	BRL CODE_B8DD80				;$B8DBA5  /

CODE_B8DBA8:
	CMP #$000B				;$B8DBA8  \
	BNE CODE_B8DBB0				;$B8DBAB   |
	BRL CODE_B8DD8C				;$B8DBAD  /

CODE_B8DBB0:
	CMP #$000C				;$B8DBB0  \
	BNE CODE_B8DBB8				;$B8DBB3   |
	BRL CODE_B8DD80				;$B8DBB5  /

CODE_B8DBB8:
	CMP #$000D				;$B8DBB8  \
	BNE CODE_B8DBC0				;$B8DBBB   |
	BRL CODE_B8DD80				;$B8DBBD  /

CODE_B8DBC0:
	CMP #$000E				;$B8DBC0  \
	BNE CODE_B8DBC8				;$B8DBC3   |
	BRL CODE_B8DD80				;$B8DBC5  /

CODE_B8DBC8:
	CMP #$000F				;$B8DBC8  \
	BNE CODE_B8DBD0				;$B8DBCB   |
	BRL CODE_B8DD80				;$B8DBCD  /

CODE_B8DBD0:
	CMP #$0010				;$B8DBD0  \
	BNE CODE_B8DBD8				;$B8DBD3   |
	BRL CODE_B8DD80				;$B8DBD5  /

CODE_B8DBD8:
	CMP #$0011				;$B8DBD8  \
	BNE CODE_B8DBE0				;$B8DBDB   |
	BRL CODE_B8DD80				;$B8DBDD  /

CODE_B8DBE0:
	CMP #$0012				;$B8DBE0  \
	BNE CODE_B8DBE8				;$B8DBE3   |
	BRL CODE_B8DD80				;$B8DBE5  /

CODE_B8DBE8:
	CMP #$0013				;$B8DBE8  \
	BNE CODE_B8DBF0				;$B8DBEB   |
	BRL CODE_B8DD80				;$B8DBED  /

CODE_B8DBF0:
	CMP #$0014				;$B8DBF0  \
	BNE CODE_B8DBF8				;$B8DBF3   |
	BRL CODE_B8DD80				;$B8DBF5  /

CODE_B8DBF8:
	CMP #$0015				;$B8DBF8  \
	BNE CODE_B8DC00				;$B8DBFB   |
	BRL CODE_B8DD88				;$B8DBFD  /

CODE_B8DC00:
	CMP #$0016				;$B8DC00  \
	BNE CODE_B8DC08				;$B8DC03   |
	BRL CODE_B8DD88				;$B8DC05  /

CODE_B8DC08:
	CMP #$0017				;$B8DC08  \
	BNE CODE_B8DC10				;$B8DC0B   |
	BRL CODE_B8DD8C				;$B8DC0D  /

CODE_B8DC10:
	CMP #$0018				;$B8DC10  \
	BNE CODE_B8DC18				;$B8DC13   |
	BRL CODE_B8DD80				;$B8DC15  /

CODE_B8DC18:
	CMP #$0019				;$B8DC18  \
	BNE CODE_B8DC20				;$B8DC1B   |
	BRL CODE_B8DD90				;$B8DC1D  /

CODE_B8DC20:
	CMP #$001A				;$B8DC20  \
	BNE CODE_B8DC28				;$B8DC23   |
	BRL CODE_B8DD8C				;$B8DC25  /

CODE_B8DC28:
	CMP #$001B				;$B8DC28  \
	BNE CODE_B8DC30				;$B8DC2B   |
	BRL CODE_B8DD8C				;$B8DC2D  /

CODE_B8DC30:
	CMP #$001C				;$B8DC30  \
	BNE CODE_B8DC38				;$B8DC33   |
	BRL CODE_B8DD90				;$B8DC35  /

CODE_B8DC38:
	CMP #$001D				;$B8DC38  \
	BNE CODE_B8DC40				;$B8DC3B   |
	BRL CODE_B8DD80				;$B8DC3D  /

CODE_B8DC40:
	CMP #$001E				;$B8DC40  \
	BNE CODE_B8DC48				;$B8DC43   |
	BRL CODE_B8DD80				;$B8DC45  /

CODE_B8DC48:
	CMP #$001F				;$B8DC48  \
	BNE CODE_B8DC50				;$B8DC4B   |
	BRL CODE_B8DD80				;$B8DC4D  /

CODE_B8DC50:
	CMP #$0020				;$B8DC50  \
	BNE CODE_B8DC58				;$B8DC53   |
	BRL CODE_B8DD80				;$B8DC55  /

CODE_B8DC58:
	CMP #$0021				;$B8DC58  \
	BNE CODE_B8DC60				;$B8DC5B   |
	BRL CODE_B8DD88				;$B8DC5D  /

CODE_B8DC60:
	CMP #$0022				;$B8DC60  \
	BNE CODE_B8DC68				;$B8DC63   |
	BRL CODE_B8DD88				;$B8DC65  /

CODE_B8DC68:
	CMP #$0023				;$B8DC68  \
	BNE CODE_B8DC70				;$B8DC6B   |
	BRL CODE_B8DD8C				;$B8DC6D  /

CODE_B8DC70:
	CMP #$0024				;$B8DC70  \
	BNE CODE_B8DC78				;$B8DC73   |
	BRL CODE_B8DD80				;$B8DC75  /

CODE_B8DC78:
	CMP #$0025				;$B8DC78  \
	BNE CODE_B8DC80				;$B8DC7B   |
	BRL CODE_B8DD90				;$B8DC7D  /

CODE_B8DC80:
	CMP #$0026				;$B8DC80  \
	BNE CODE_B8DC88				;$B8DC83   |
	BRL CODE_B8DD80				;$B8DC85  /

CODE_B8DC88:
	CMP #$0027				;$B8DC88  \
	BNE CODE_B8DC90				;$B8DC8B   |
	BRL CODE_B8DD90				;$B8DC8D  /

CODE_B8DC90:
	CMP #$0028				;$B8DC90  \
	BNE CODE_B8DC98				;$B8DC93   |
	BRL CODE_B8DD80				;$B8DC95  /

CODE_B8DC98:
	CMP #$002B				;$B8DC98  \
	BNE CODE_B8DCA0				;$B8DC9B   |
	BRL CODE_B8DDA8				;$B8DC9D  /

CODE_B8DCA0:
	CMP #$002F				;$B8DCA0  \
	BNE CODE_B8DCA8				;$B8DCA3   |
	BRL CODE_B8DD94				;$B8DCA5  /

CODE_B8DCA8:
	CMP #$0030				;$B8DCA8  \
	BNE CODE_B8DCB0				;$B8DCAB   |
	BRL CODE_B8DD94				;$B8DCAD  /

CODE_B8DCB0:
	CMP #$0031				;$B8DCB0  \
	BNE CODE_B8DCB8				;$B8DCB3   |
	BRL CODE_B8DD94				;$B8DCB5  /

CODE_B8DCB8:
	CMP #$0032				;$B8DCB8  \
	BNE CODE_B8DCC0				;$B8DCBB   |
	BRL CODE_B8DD94				;$B8DCBD  /

CODE_B8DCC0:
	CMP #$0033				;$B8DCC0  \
	BNE CODE_B8DCC8				;$B8DCC3   |
	BRL CODE_B8DD94				;$B8DCC5  /

CODE_B8DCC8:
	CMP #$0034				;$B8DCC8  \
	BNE CODE_B8DCD0				;$B8DCCB   |
	BRL CODE_B8DD94				;$B8DCCD  /

CODE_B8DCD0:
	CMP #$0035				;$B8DCD0  \
	BNE CODE_B8DCD8				;$B8DCD3   |
	BRL CODE_B8DD94				;$B8DCD5  /

CODE_B8DCD8:
	CMP #$0036				;$B8DCD8  \
	BNE CODE_B8DCE0				;$B8DCDB   |
	BRL CODE_B8DD94				;$B8DCDD  /

CODE_B8DCE0:
	CMP #$0037				;$B8DCE0  \
	BNE CODE_B8DCE8				;$B8DCE3   |
	BRL CODE_B8DD94				;$B8DCE5  /

CODE_B8DCE8:
	CMP #$0038				;$B8DCE8  \
	BNE CODE_B8DCF0				;$B8DCEB   |
	BRL CODE_B8DD94				;$B8DCED  /

CODE_B8DCF0:
	CMP #$0039				;$B8DCF0  \
	BNE CODE_B8DCF8				;$B8DCF3   |
	BRL CODE_B8DD94				;$B8DCF5  /

CODE_B8DCF8:
	CMP #$003A				;$B8DCF8  \
	BNE CODE_B8DD00				;$B8DCFB   |
	BRL CODE_B8DD94				;$B8DCFD  /

CODE_B8DD00:
	CMP #$0043				;$B8DD00  \
	BNE CODE_B8DD08				;$B8DD03   |
	BRL CODE_B8DD98				;$B8DD05  /

CODE_B8DD08:
	CMP #$0062				;$B8DD08  \
	BNE CODE_B8DD10				;$B8DD0B   |
	BRL CODE_B8DD98				;$B8DD0D  /

CODE_B8DD10:
	CMP #$006C				;$B8DD10  \
	BNE CODE_B8DD18				;$B8DD13   |
	BRL CODE_B8DD98				;$B8DD15  /

CODE_B8DD18:
	CMP #$008F				;$B8DD18  \
	BNE CODE_B8DD20				;$B8DD1B   |
	BRL CODE_B8DD98				;$B8DD1D  /

CODE_B8DD20:
	CMP #$0085				;$B8DD20  \
	BNE CODE_B8DD28				;$B8DD23   |
	BRL CODE_B8DD98				;$B8DD25  /

CODE_B8DD28:
	CMP #$0128				;$B8DD28  \
	BNE CODE_B8DD30				;$B8DD2B   |
	BRL CODE_B8DD98				;$B8DD2D  /

CODE_B8DD30:
	CMP #$0060				;$B8DD30  \
	BNE CODE_B8DD38				;$B8DD33   |
	BRL CODE_B8DD9C				;$B8DD35  /

CODE_B8DD38:
	CMP #$0083				;$B8DD38  \
	BNE CODE_B8DD40				;$B8DD3B   |
	BRL CODE_B8DD9C				;$B8DD3D  /

CODE_B8DD40:
	CMP #$0088				;$B8DD40  \
	BNE CODE_B8DD48				;$B8DD43   |
	BRL CODE_B8DD9C				;$B8DD45  /

CODE_B8DD48:
	CMP #$008D				;$B8DD48  \
	BNE CODE_B8DD50				;$B8DD4B   |
	BRL CODE_B8DD9C				;$B8DD4D  /

CODE_B8DD50:
	CMP #$0065				;$B8DD50  \
	BNE CODE_B8DD58				;$B8DD53   |
	BRL CODE_B8DD9C				;$B8DD55  /

CODE_B8DD58:
	CMP #$0083				;$B8DD58  \
	BNE CODE_B8DD60				;$B8DD5B   |
	BRL CODE_B8DD9C				;$B8DD5D  /

CODE_B8DD60:
	CMP #$00A2				;$B8DD60  \
	BNE CODE_B8DD68				;$B8DD63   |
	BRL CODE_B8DDA4				;$B8DD65  /

CODE_B8DD68:
	CMP #$0042				;$B8DD68  \
	BNE CODE_B8DD70				;$B8DD6B   |
	BRL CODE_B8DDA0				;$B8DD6D  /

CODE_B8DD70:
	CMP #$00A1				;$B8DD70  \
	BNE CODE_B8DD78				;$B8DD73   |
	BRL CODE_B8DD84				;$B8DD75  /

CODE_B8DD78:
	CMP #$0045				;$B8DD78  \
	BNE CODE_B8DD80				;$B8DD7B   |
	BRL CODE_B8DDAC				;$B8DD7D  /

CODE_B8DD80:
	LDA #$0000				;$B8DD80  \
	RTS					;$B8DD83  /

CODE_B8DD84:
	LDA #$0001				;$B8DD84  \
	RTS					;$B8DD87  /

CODE_B8DD88:
	LDA #$0002				;$B8DD88  \
	RTS					;$B8DD8B  /

CODE_B8DD8C:
	LDA #$0003				;$B8DD8C  \
	RTS					;$B8DD8F  /

CODE_B8DD90:
	LDA #$0004				;$B8DD90  \
	RTS					;$B8DD93  /

CODE_B8DD94:
	LDA #$0005				;$B8DD94  \
	RTS					;$B8DD97  /

CODE_B8DD98:
	LDA #$0006				;$B8DD98  \
	RTS					;$B8DD9B  /

CODE_B8DD9C:
	LDA #$0007				;$B8DD9C  \
	RTS					;$B8DD9F  /

CODE_B8DDA0:
	LDA #$0008				;$B8DDA0  \
	RTS					;$B8DDA3  /

CODE_B8DDA4:
	LDA #$0009				;$B8DDA4  \
	RTS					;$B8DDA7  /

CODE_B8DDA8:
	LDA #$000A				;$B8DDA8  \
	RTS					;$B8DDAB  /

CODE_B8DDAC:
	LDA #$000B				;$B8DDAC  \
	RTS					;$B8DDAF  /

CODE_B8DDB0:
	RTS					;$B8DDB0  /

CODE_B8DDB1:
	LDX current_sprite			;$B8DDB1  \
	LDA $0E,x				;$B8DDB3   |
	DEC A					;$B8DDB5   |
	BPL CODE_B8DDB0				;$B8DDB6   |
	LDY active_kong_sprite			;$B8DDB8   |
	LDA $000A,y				;$B8DDBB   |
	SEC					;$B8DDBE   |
	SBC $0A,x				;$B8DDBF   |
	BPL CODE_B8DDC7				;$B8DDC1   |
	EOR #$FFFF				;$B8DDC3   |
	INC A					;$B8DDC6   |
CODE_B8DDC7:					;	   |
	CMP #$0008				;$B8DDC7   |
	BPL CODE_B8DDB0				;$B8DDCA   |
	LDA $0006,y				;$B8DDCC   |
	SEC					;$B8DDCF   |
	SBC $06,x				;$B8DDD0   |
	STA $5E					;$B8DDD2   |
	BPL CODE_B8DDDA				;$B8DDD4   |
	EOR #$FFFF				;$B8DDD6   |
	INC A					;$B8DDD9   |
CODE_B8DDDA:					;	   |
	STA $60					;$B8DDDA   |
	SEC					;$B8DDDC   |
	SBC #$001C				;$B8DDDD   |
	BPL CODE_B8DDE6				;$B8DDE0   |
	EOR #$FFFF				;$B8DDE2   |
	INC A					;$B8DDE5   |
CODE_B8DDE6:					;	   |
	CMP #$0002				;$B8DDE6   |
	BMI CODE_B8DDB0				;$B8DDE9   |
	LDA $0026,y				;$B8DDEB   |
	BNE CODE_B8DDB0				;$B8DDEE   |
	LDA $0020,y				;$B8DDF0   |
	BNE CODE_B8DDB0				;$B8DDF3   |
	LDA $000E,y				;$B8DDF5   |
	BNE CODE_B8DDB0				;$B8DDF8   |
	LDA $0012,y				;$B8DDFA   |
	ROL A					;$B8DDFD   |
	BRA CODE_B8DE02				;$B8DDFE  /

	LDA $5E					;$B8DE00   |
CODE_B8DE02:					;	   |
	ROL A					;$B8DE02   |
	LDA #$001C				;$B8DE03   |
	BCS CODE_B8DE0C				;$B8DE06   |
	EOR #$FFFF				;$B8DE08   |
	INC A					;$B8DE0B   |
CODE_B8DE0C:					;	   |
	STA $5E					;$B8DE0C   |
	CLC					;$B8DE0E   |
	ADC $0006,y				;$B8DE0F   |
	STA $60					;$B8DE12   |
	PHY					;$B8DE14   |
	JSR CODE_B8D497				;$B8DE15   |
	PLY					;$B8DE18   |
	BCS CODE_B8DE32				;$B8DE19   |
	SEC					;$B8DE1B   |
	SBC $0A,x				;$B8DE1C   |
	BMI CODE_B8DE27				;$B8DE1E   |
	CMP #$001C				;$B8DE20   |
	BPL CODE_B8DE32				;$B8DE23   |
	BRA CODE_B8DE56				;$B8DE25  /

CODE_B8DE27:
	EOR #$FFFF				;$B8DE27  \
	INC A					;$B8DE2A   |
	CMP #$001C				;$B8DE2B   |
	BPL CODE_B8DE32				;$B8DE2E   |
	BRA CODE_B8DE56				;$B8DE30  /

CODE_B8DE32:
	LDA $0006,y				;$B8DE32  \
	SEC					;$B8DE35   |
	SBC $5E					;$B8DE36   |
	STA $60					;$B8DE38   |
	PHY					;$B8DE3A   |
	JSR CODE_B8D497				;$B8DE3B   |
	PLY					;$B8DE3E   |
	BCS CODE_B8DE74				;$B8DE3F   |
	SEC					;$B8DE41   |
	SBC $0A,x				;$B8DE42   |
	BMI CODE_B8DE4D				;$B8DE44   |
	CMP #$001C				;$B8DE46   |
	BPL CODE_B8DE74				;$B8DE49   |
	BRA CODE_B8DE56				;$B8DE4B  /

CODE_B8DE4D:
	EOR #$FFFF				;$B8DE4D  \
	INC A					;$B8DE50   |
	CMP #$001C				;$B8DE51   |
	BPL CODE_B8DE74				;$B8DE54   |
CODE_B8DE56:					;	   |
	LDA $60					;$B8DE56   |
	LDY $66					;$B8DE58   |
	STA $0D66				;$B8DE5A   |
	STZ $26,x				;$B8DE5D   |
	STZ $20,x				;$B8DE5F   |
	STZ $24,x				;$B8DE61   |
	LDA #$002A				;$B8DE63   |
	STA $2E,x				;$B8DE66   |
	LDA $099D				;$B8DE68   |
	STA $0D6E				;$B8DE6B   |
	LDA #$003B				;$B8DE6E   |
	JSR CODE_B8DA8F				;$B8DE71   |
CODE_B8DE74:					;	   |
	RTS					;$B8DE74  /
