CODE_B38000:					;	   |
	JSL CODE_BBBB99				;$B38000   |
	JML [$05A9]				;$B38004  /

sprite_handler:
	SEP #$20				;$B38007  \
	LDA $19B2				;$B38009   |
	STA $19B3				;$B3800C   |
	STZ $19B2				;$B3800F   |
	STZ $19AA				;$B38012   |
	STZ $19AB				;$B38015   |
	STZ $19AE				;$B38018   |
	STZ $19AC				;$B3801B   |
	STZ $19AF				;$B3801E   |
	REP #$20				;$B38021   |
	LDA #$00B3				;$B38023   |
	STA $05AB				;$B38026   |
	LDA #$00FF				;$B38029   |
	STA $90					;$B3802C   |
	JSL CODE_BCFA78				;$B3802E   |
	LDA $0A36				;$B38032   |
	AND #$0080				;$B38035   |
	BNE CODE_B3806D				;$B38038   |
	LDA $0A36				;$B3803A   |
	BNE CODE_B38087				;$B3803D   |
	LDA #.sprite_return			;$B3803F   |\ Set sprite return pointer
	STA $05A9				;$B38042   |/
	LDX #main_sprite_table			;$B38045   | Load sprite base pointer
.next_slot					;	   |
	LDA $00,x				;$B38048   |\ If the sprite doesn't exist
	BEQ .get_next_slot			;$B3804A   |/ Get the next sprite
	STX current_sprite			;$B3804C   |\ If the sprite was found, preserve the index
	TAX					;$B3804E   | |
	JMP (DATA_B38348,x)			;$B3804F  /_/ Then jump to the sprite code

.sprite_return
	LDX current_sprite			;$B38052  \ Reload current sprite pointer
.get_next_slot					;	   |
	TXA					;$B38054   |\ Load next sprite slot
	CLC					;$B38055   | |
	ADC #sizeof(sprite)			;$B38056   | |
	TAX					;$B38059   |/
	CPX #main_sprite_table_end		;$B3805A   |\ If not at the last sprite
	BNE .next_slot				;$B3805D   |/ then test if the sprite exists
	JSL CODE_B8805E				;$B3805F   |
	JSR CODE_B38342				;$B38063   |
	JSR CODE_B38280				;$B38066   |
	JSR CODE_B380F0				;$B38069   |
	RTL					;$B3806C  /

CODE_B3806D:
	JSL CODE_B8805E				;$B3806D  \
CODE_B38071:					;	   |
	JSR CODE_B38342				;$B38071   |
	JSR CODE_B380F0				;$B38074   |
	DEC $0A38				;$B38077   |
	BEQ CODE_B38083				;$B3807A   |
	BMI CODE_B3807F				;$B3807C   |
	RTL					;$B3807E  /

CODE_B3807F:
	STZ $0A38				;$B3807F  \
	RTL					;$B38082  /

CODE_B38083:
	STZ $0A36				;$B38083  \
	RTL					;$B38086  /

CODE_B38087:
	LDA #CODE_B380D5			;$B38087  \
	STA $05A9				;$B3808A   |
	LDX #main_sprite_table			;$B3808D   |
CODE_B38090:					;	   |
	LDA $00,x				;$B38090   |
	BEQ CODE_B380D7				;$B38092   |
	STX current_sprite			;$B38094   |
	TAX					;$B38096   |
	LDA $0A36				;$B38097   |
	AND #$001C				;$B3809A   |
	BNE CODE_B380A1				;$B3809D   |
	BRA CODE_B380D2				;$B3809F  /

CODE_B380A1:
	LDA current_sprite			;$B380A1  \
	CMP #$0E9E				;$B380A3   |
	BPL CODE_B380C1				;$B380A6   |
	CMP $0597				;$B380A8   |
	BEQ CODE_B380B7				;$B380AB   |
	LDA $0A36				;$B380AD   |
	AND #$0008				;$B380B0   |
	BEQ CODE_B380D2				;$B380B3   |
	BRA CODE_B380D5				;$B380B5  /

CODE_B380B7:
	LDA $0A36				;$B380B7  \
	AND #$0010				;$B380BA   |
	BEQ CODE_B380D2				;$B380BD   |
	BRA CODE_B380D5				;$B380BF  /

CODE_B380C1:
	LDA $0A36				;$B380C1  \
	AND #$0004				;$B380C4   |
	BEQ CODE_B380D2				;$B380C7   |
	LDA.l DATA_B3834A,x			;$B380C9   |
	AND #$0001				;$B380CD   |
	BEQ CODE_B380D5				;$B380D0   |
CODE_B380D2:					;	   |
	JMP (DATA_B38348,x)			;$B380D2  /

CODE_B380D5:
	LDX current_sprite			;$B380D5  \
CODE_B380D7:					;	   |
	TXA					;$B380D7   |
	CLC					;$B380D8   |
	ADC #sizeof(sprite)			;$B380D9   |
	TAX					;$B380DC   |
	CPX #main_sprite_table_end		;$B380DD   |
	BNE CODE_B38090				;$B380E0   |
	JSL CODE_B8805E				;$B380E2   |
	JSR CODE_B38280				;$B380E6   |
	BRL CODE_B38071				;$B380E9  /

CODE_B380EC:
	JSR CODE_B380F0				;$B380EC  \
	RTL					;$B380EF  /

CODE_B380F0:
	LDA $19AD				;$B380F0  \
	CMP #$0100				;$B380F3   |
	LDA #$0450				;$B380F6   |
	JSR CODE_B38158				;$B380F9   |
	BCS CODE_B3814A				;$B380FC   |
	LDA $19A9				;$B380FE   |
	CMP #$0100				;$B38101   |
	LDA #$073D				;$B38104   |
	JSR CODE_B38158				;$B38107   |
	BCS CODE_B3814A				;$B3810A   |
	LDA $19AA				;$B3810C   |
	CMP #$0100				;$B3810F   |
	LDA #$073F				;$B38112   |
	JSR CODE_B38158				;$B38115   |
	BCS CODE_B3814A				;$B38118   |
	LDA $19AE				;$B3811A   |
	CMP #$0100				;$B3811D   |
	LDA #$0452				;$B38120   |
	JSR CODE_B38158				;$B38123   |
	BCS CODE_B3814A				;$B38126   |
	LDA $052B				;$B38128   |
	AND #$8000				;$B3812B   |
	BEQ CODE_B3813E				;$B3812E   |
	LDA $19AB				;$B38130   |
	CMP #$0100				;$B38133   |
	LDA #$0765				;$B38136   |
	JSR CODE_B38158				;$B38139   |
	BRA CODE_B3814A				;$B3813C  /

CODE_B3813E:
	LDA $19AB				;$B3813E  \
	CMP #$0100				;$B38141   |
	LDA #$0668				;$B38144   |
	JSR CODE_B38158				;$B38147   |
CODE_B3814A:					;	   |
	JSL play_queued_sound_effect		;$B3814A   |
	RTS					;$B3814E  /

CODE_B3814F:
	PHY					;$B3814F  \
	JSR CODE_B38158				;$B38150   |
	PLY					;$B38153   |
	AND #$FFFF				;$B38154   |
	RTL					;$B38157  /

CODE_B38158:
	SEP #$30				;$B38158  \
	XBA					;$B3815A   |
	TAX					;$B3815B   |
	XBA					;$B3815C   |
	EOR $0619,x				;$B3815D   |
	BEQ CODE_B3816D				;$B38160   |
	EOR $0619,x				;$B38162   |
	BCS CODE_B3816F				;$B38165   |
CODE_B38167:					;	   |
	REP #$30				;$B38167   |
	LDA #$0001				;$B38169   |
	RTS					;$B3816C  /

CODE_B3816D:
	BCS CODE_B38167				;$B3816D  \
CODE_B3816F:					;	   |
	REP #$30				;$B3816F   |
	TAY					;$B38171   |
	LDA $0634				;$B38172   |
	INC A					;$B38175   |
	INC A					;$B38176   |
	AND #$000E				;$B38177   |
	TAX					;$B3817A   |
	LDA $0622,x				;$B3817B   |
	BNE CODE_B38199				;$B3817E   |
	TYA					;$B38180   |
	ORA #$8000				;$B38181   |
	STA $0622,x				;$B38184   |
	STX $0634				;$B38187   |
	SEP #$30				;$B3818A   |
	XBA					;$B3818C   |
	AND #$0F				;$B3818D   |
	TAX					;$B3818F   |
	XBA					;$B38190   |
	STA $0619,x				;$B38191   |
	REP #$30				;$B38194   |
	LDA #$0000				;$B38196   |
CODE_B38199:					;	   |
	SEC					;$B38199   |
	RTS					;$B3819A  /

null_sprite_main:
unknown_sprite_0004_main:
unknown_sprite_0090_main:
	LDA $05BB				;$B3819B  \
	AND #$0060				;$B3819E   |
	BEQ CODE_B381AA				;$B381A1   |
	JSL CODE_BBBB99				;$B381A3   |
	JML [$05A9]				;$B381A7  /

CODE_B381AA:
	JSL CODE_BBBB44				;$B381AA  \
	JML [$05A9]				;$B381AE  /

unknown_sprite_00F4_main:
	LDA $05BB				;$B381B1  \
	AND #$0060				;$B381B4   |
	BEQ CODE_B381C3				;$B381B7   |
	JSR CODE_B381CE				;$B381B9   |
	JSL CODE_BBBB99				;$B381BC   |
	JML [$05A9]				;$B381C0  /

CODE_B381C3:
	JSL CODE_BBBB44				;$B381C3  \
	JML [$05A9]				;$B381C7  /

CODE_B381CA:
	JSR CODE_B381CE				;$B381CA  \
	RTL					;$B381CD  /

CODE_B381CE:
	RTS					;$B381CE  /

	CPX $05C3				;$B381CF   |
	BNE CODE_B381E3				;$B381D2   |
	LDA global_frame_counter		;$B381D4   |
	AND #$0003				;$B381D6   |
	BNE CODE_B381E3				;$B381D9   |
	LDA $1C,x				;$B381DB   |
	ORA #$C000				;$B381DD   |
	STA $1C,x				;$B381E0   |
	RTS					;$B381E2  /

CODE_B381E3:
	LDA $1C,x				;$B381E3  \
	AND #$3FFF				;$B381E5   |
	STA $1C,x				;$B381E8   |
	RTS					;$B381EA  /

burst_effect_main:
map_player_main:
	JSL CODE_B9D100				;$B381EB  \
	JML [$05A9]				;$B381EF  /

unknown_sprite_00F8_main:
	LDA $05BB				;$B381F2  \
	AND #$0060				;$B381F5   |
	BNE unknown_sprite_008C_main		;$B381F8   |
	JSL CODE_BBBC8D				;$B381FA   |
	JML [$05A9]				;$B381FE  /

unknown_sprite_008C_main:
	JSL CODE_BBBCA3				;$B38201  \
	JML [$05A9]				;$B38205  /

unknown_sprite_00FC_main:
unknown_sprite_010C_main:
	JSL CODE_B9D100				;$B38208  \
	JML [$05A9]				;$B3820C  /

unknown_sprite_00E0_main:
	LDA current_sprite			;$B3820F  \
	STA $19CE				;$B38211   |
	INC $19AE				;$B38214   |
	LDY $0595				;$B38217   |
	LDA $0016,y				;$B3821A   |
	CMP #$0010				;$B3821D   |
	BMI CODE_B38251				;$B38220   |
	LDA global_frame_counter		;$B38222   |
	AND #$0001				;$B38224   |
	BEQ CODE_B3822C				;$B38227   |
CODE_B38229:					;	   |
	JML [$05A9]				;$B38229  /

CODE_B3822C:
	LDA global_frame_counter		;$B3822C  \
	AND #$0002				;$B3822E   |
	BEQ CODE_B38242				;$B38231   |
	LDA $091B				;$B38233   |
	ORA #$0080				;$B38236   |
	STA $091B				;$B38239   |
	JSL CODE_BB8C2C				;$B3823C   |
	BRA CODE_B38229				;$B38240  /

CODE_B38242:
	LDA $091B				;$B38242  \
	AND #$FF7F				;$B38245   |
	STA $091B				;$B38248   |
	JSL CODE_BB8C2C				;$B3824B   |
	BRA CODE_B38229				;$B3824F  /

CODE_B38251:
	LDA $091B				;$B38251  \
	AND #$FF7F				;$B38254   |
	STA $091B				;$B38257   |
	JSL CODE_BB8C2C				;$B3825A   |
	JSL CODE_BB82D2				;$B3825E   |
	STZ $19CE				;$B38262   |
	JML [$05A9]				;$B38265  /

unknown_sprite_0100_main:
	JSL CODE_B9D100				;$B38268  \
	LDX current_sprite			;$B3826C   |
	LDA $42,x				;$B3826E   |
	BEQ CODE_B38276				;$B38270   |
	DEC $42,x				;$B38272   |
	BEQ CODE_B38279				;$B38274   |
CODE_B38276:					;	   |
	JML [$05A9]				;$B38276  /

CODE_B38279:
	JSL CODE_BB82B8				;$B38279  \
	JML [$05A9]				;$B3827D  /

CODE_B38280:
	LDA $08C2				;$B38280  \
	AND #$0001				;$B38283   |
	BNE CODE_B382C6				;$B38286   |
	LDY $0595				;$B38288   |
	STY $66					;$B3828B   |
	LDA $0000,y				;$B3828D   |
	STA $0A2E				;$B38290   |
	LDX $0593				;$B38293   |
	STX current_sprite			;$B38296   |
	LDA $36,x				;$B38298   |
	LDA $20,x				;$B3829A   |
	STA $0A30				;$B3829C   |
	LDA $26,x				;$B3829F   |
	STA $0A32				;$B382A1   |
	LDA $0E,x				;$B382A4   |
	STA $0A34				;$B382A6   |
	LDA $0A2A				;$B382A9   |
	CMP $06,x				;$B382AC   |
	BNE CODE_B382CD				;$B382AE   |
	LDA $0A2C				;$B382B0   |
	CMP $0A,x				;$B382B3   |
	BNE CODE_B382CD				;$B382B5   |
	LDA $1E,x				;$B382B7   |
	AND #$1010				;$B382B9   |
	BNE CODE_B382CD				;$B382BC   |
	LDA $08C2				;$B382BE   |
	AND #$0008				;$B382C1   |
	BNE CODE_B382CD				;$B382C4   |
CODE_B382C6:					;	   |
	LDA #$0009				;$B382C6   |
	TRB $08C2				;$B382C9   |
	RTS					;$B382CC  /

CODE_B382CD:
	TXY					;$B382CD  \
	LDX $099D				;$B382CE   |
	LDA $0006,y				;$B382D1   |
	STA $0A2A				;$B382D4   |
	STA $7FA532,x				;$B382D7   |
	LDA $000A,y				;$B382DB   |
	STA $0A2C				;$B382DE   |
	STA $7FA572,x				;$B382E1   |
	LDA $0012,y				;$B382E5   |
	AND #$4000				;$B382E8   |
	STA $7FA5B2,x				;$B382EB   |
	LDA $001E,y				;$B382EF   |
	XBA					;$B382F2   |
	AND #$FF00				;$B382F3   |
	STA $32					;$B382F6   |
	LDY $66					;$B382F8   |
	LDA $0000,y				;$B382FA   |
	STA $7FA5F2,x				;$B382FD   |
	AND #$00FF				;$B38301   |
	ORA $32					;$B38304   |
	INX					;$B38306   |
	INX					;$B38307   |
	TXA					;$B38308   |
	AND #$003F				;$B38309   |
	STA $099D				;$B3830C   |
	CMP $099F				;$B3830F   |
	BNE CODE_B3831F				;$B38312   |
	LDA $099F				;$B38314   |
	INC A					;$B38317   |
	INC A					;$B38318   |
	AND #$003F				;$B38319   |
	STA $099F				;$B3831C   |
CODE_B3831F:					;	   |
	LDA $099D				;$B3831F   |
	BRA CODE_B382C6				;$B38322  /

CODE_B38324:
	SEC					;$B38324  \
	SBC #$0005				;$B38325   |
	STA $09FC				;$B38328   |
	TAY					;$B3832B   |
	LDA $09FE,y				;$B3832C   |
	STA $32					;$B3832F   |
	LDA $0A00,y				;$B38331   |
	STA $34					;$B38334   |
	LDX $0A01,y				;$B38336   |
	STX current_sprite			;$B38339   |
	PHK					;$B3833B   |
	%return(CODE_B38342)			;$B3833C   |
	JML [$0032]				;$B3833F  /

CODE_B38342:
	LDA $09FC				;$B38342  \
	BNE CODE_B38324				;$B38345   |
	RTS					;$B38347  /

DATA_B38348:
	%offset(DATA_B3834A, 2)
	dw null_sprite_main,$0000			;0000
	dw unknown_sprite_0004_main,$0000		;0004
	dw map_player_main,$0000			;0008
	dw unknown_sprite_000C_main,$0000		;000C
	dw squawks_egg_main,$0000			;0010
	dw unknown_sprite_0014_main,$0001		;0014
	dw canball_pieces1_main,$0000			;0018
	dw canball_pieces2_main,$0000			;001C
	dw egg_shell_pieces_main,$0000			;0020
	dw dropping_hooks_main,$0000			;0024
	dw air_bubble_generator_main,$0000		;0028
	dw kleever_bone_pieces_main,$0000		;002C
	dw unknown_sprite_0030_main,$0000		;0030
	dw kleever_pieces1_main,$0000			;0034
	dw kleever_pieces2_main,$0000			;0038
	dw kleever_pieces3_main,$0000			;003C
	dw unknown_sprite_0040_main,$0000		;0040
	dw kleever_pieces4_main,$0000			;0044
	dw kleever_pieces5_main,$0000			;0048
	dw unknown_sprite_004C_main,$0000		;004C
	dw unknown_sprite_0050_main,$0000		;0050
	dw unknown_sprite_0054_main,$0000		;0054
	dw puftup_spikes_main,$0000			;0058
	dw krool_water_drips_main,$0000			;005C
	dw barrel_pieces_main,$0000			;0060
	dw unknown_sprite_0064_main,$0000		;0064
	dw king_zing_spikes_main,$0000			;0068
	dw kannon_main,$0000				;006C
	dw unknown_sprite_0070_main,$0000		;0070
	dw klubba_main,$0000				;0074
	dw kudgel_main,$0001				;0078
	dw chasing_king_zing_main,$0000			;007C
	dw king_zing_main,$0000				;0080
	dw unknown_sprite_0084_main,$0000		;0084
	dw chest_spawner_main,$0000			;0088
	dw unknown_sprite_008C_main,$0000		;008C
	dw unknown_sprite_0090_main,$0000		;0090
	dw exit_door_main,$0001				;0094
	dw unknown_sprite_0098_main,$0000		;0098
	dw sparkle_spawner_main,$0000			;009C
	dw sparkle_main,$0000				;00A0
	dw unknown_sprite_00A4_main,$0000		;00A4
	dw unknown_sprite_00A8_main,$0000		;00A8
	dw water_level_changer_main,$0000		;00AC
	dw unknown_sprite_00B0_main,$0000		;00B0
	dw explosion_main,$0000				;00B4
	dw unknown_sprite_00B8_main,$0001		;00B8
	dw kackle_main,$0001				;00BC
	dw horizontal_wind_changer_main,$0001		;00C0
	dw vertical_wind_changer_main,$0001		;00C4
	dw unknown_sprite_00C8_main,$0000		;00C8
	dw unknown_sprite_00CC_main,$0000		;00CC
	dw giant_tire_main,$0000			;00D0
	dw unknown_sprite_00D4_main,$0000		;00D4
	dw unknown_sprite_00D8_main,$0000		;00D8
	dw traffic_light_main,$0000			;00DC
	dw unknown_sprite_00E0_main,$0001		;00E0
	dw diddy_kong_main,$0001			;00E4
	dw dixie_kong_main,$0001			;00E8
	dw unknown_sprite_00EC_main,$0000		;00EC
	dw unknown_sprite_00F0_main,$0000		;00F0
	dw unknown_sprite_00F4_main,$0000		;00F4
	dw unknown_sprite_00F8_main,$0000		;00F8
	dw unknown_sprite_00FC_main,$0001		;00FC
	dw unknown_sprite_0100_main,$0001		;0100
	dw unknown_sprite_0104_main,$0001		;0104
	dw web_shot_main,$0000				;0108
	dw unknown_sprite_010C_main,$0000		;010C
	dw rain_cloud_main,$0000			;0110
	dw unknown_sprite_0114_main,$0000		;0114
	dw web_platform_main,$0000			;0118
	dw dkbarrel_letters_main,$0000			;011C
	dw barrel_icons_main,$0000			;0120
	dw breakable_wall_main,$0000			;0124
	dw rideable_balloon_main,$0000			;0128
	dw sun_main,$0001				;012C
	dw ship_water_splash_main,$0001			;0130
	dw animal_icon_main,$0001			;0134
	dw timer_main,$0001				;0138
	dw cannon_main,$0000				;013C
	dw barrel_cannon_main,$0000			;0140
	dw kleever_canball_main,$0000			;0144
	dw animal_box_main,$0000			;0148
	dw hook_main,$0000				;014C
	dw invincibility_barrel_main,$0000		;0150
	dw checkpoint_barrel_main,$0000			;0154
	dw skull_cart_main,$0001			;0158
	dw coins_main,$0000				;015C
	dw level_goal_main,$0001			;0160
	dw unknown_sprite_0164_main,$0001		;0164
	dw unknown_sprite_0168_main,$0001		;0168
	dw unknown_sprite_016C_main,$0001		;016C
	dw bananas_main,$0000				;0170
	dw kong_letter_main,$0000			;0174
	dw extra_life_balloon_main,$0001		;0178
	dw kleever_falling_canball_main,$0000		;017C
	dw krochead_switch_barrel_main,$0000		;0180
	dw scroll_and_float_barrel_main,$0000		;0184
	dw npc_hud_coin_main,$0000			;0188
	dw kong_npc_main,$0000				;018C
	dw squitter_main,$0000				;0190
	dw rattly_main,$0000				;0194
	dw squawks_main,$0000				;0198
	dw rambi_main,$0001				;019C
	dw enguarde_main,$0000				;01A0
	dw barrel_main,$0000				;01A4
	dw dkbarrel_main,$0000				;01A8
	dw klobber_main,$0000				;01AC
	dw canball_main,$0000				;01B0
	dw krows_egg_main,$0000				;01B4
	dw tntbarrel_main,$0000				;01B8
	dw wooden_box_main,$0000			;01BC
	dw chest_main,$0000				;01C0
	dw kreepy_krows_eggs_main,$0000			;01C4
	dw unknown_sprite_01C8_main,$0000		;01C8
	dw unknown_sprite_01CC_main,$0001		;01CC
	dw shot_canball_or_barrel_main,$0000		;01D0
	dw large_smoke_puff_main,$0000			;01D4
	dw kruncha_main,$0001				;01D8
	dw click_clack_main,$0000			;01DC
	dw kutlass_main,$0000				;01E0
	dw neek_main,$0000				;01E4
	dw unknown_sprite_01E8_main,$0000		;01E8
	dw klomp_main,$0000				;01EC
	dw klampon_main,$0001				;01F0
	dw unknown_sprite_01F4_main,$0000		;01F4
	dw flotsam_main,$0000				;01F8
	dw spiny_main,$0000				;01FC
	dw klinger_main,$0000				;0200
	dw cat_o9tails_main,$0000			;0204
	dw puftup_main,$0000				;0208
	dw lockjaw_main,$0000				;020C
	dw snapjaw_main,$0001				;0210
	dw mini_necky_main,$0000			;0214
	dw zinger_main,$0000				;0218
	dw kaboing_main,$0000				;021C
	dw flitter_main,$0000				;0220
	dw krows_body_main,$0000			;0224
	dw krows_head_main,$0000			;0228
	dw kreepy_krows_body_main,$0000			;022C
	dw kreepy_krows_head_main,$0000			;0230
	dw shuri_main,$0000				;0234
	dw burst_effect_main,$0001			;0238
	dw unknown_sprite_023C_main,$0000		;023C
	dw unknown_sprite_0240_main,$0000		;0240
	dw unknown_sprite_0244_main,$0001		;0244
	dw unknown_sprite_0248_main,$0001		;0248
	dw explosion_cloud_main,$0000			;024C
	dw fireworks_main,$0000				;0250
	dw ghost_rope_main,$0000			;0254
	dw no_animal_buddy_sign_main,$0000		;0258
	dw krook_main,$0000				;025C
	dw krooks_hook_main,$0000			;0260
	dw krool_main,$0001				;0264
	dw krool_gun_main,$0001				;0268
	dw krool_gun_vacuum_effect_main,$0000		;026C
	dw krool_canball_main,$0000			;0270
	dw krool_gun_fire_main,$0000			;0274
	dw klubbas_club_main,$0000			;0278
	dw kudgels_club_main,$0001			;027C
	dw donkey_kongs_rope_main,$0000			;0280
	dw donkey_kongs_bindings_main,$0000		;0284
	dw tied_up_donkey_kong_main,$0000		;0288
	dw shot_donkey_kong_main,$0000			;028C
	dw unknown_sprite_0290_main,$0000		;0290
	dw unknown_sprite_0294_main,$0000		;0294
	dw lava_splash_main,$0000			;0298
	dw krools_blinking_eyes_main,$0000		;029C
	dw spiked_canballs_main,$0000			;02A0
	dw kleever_main,$0000				;02A4
	dw krool_puddle_main,$0000			;02A8
	dw krool_fish_main,$0000			;02AC
	dw broken_kleever_hilt_main,$0000		;02B0
	dw broken_kleever_fire_main,$0000		;02B4
	dw king_zing_stinger_main,$0000			;02B8
	dw unknown_sprite_02BC_main,$0000		;02BC
	dw king_zing_ring_zinger_main,$0000		;02C0
	dw kleever_attack_effect_main,$0000		;02C4
	dw kleever_hand_main,$0000			;02C8
	dw kleever_fireballs_main,$0000			;02CC
	dw kleevers_hand_bubbles_main,$0000		;02D0
	dw krochead_main,$0000				;02D4
	dw horsetail_main,$0000				;02D8
	dw unknown_sprite_02DC_main,$0000		;02DC
	dw glimmer_main,$0000				;02E0
	dw kloak_main,$0000				;02E4
	dw unknown_sprite_02E8_main,$0000		;02E8
	dw haunted_hall_door_main,$0001			;02EC
	dw klank_main,$0000				;02F0
	dw skull_cart_sparks_main,$0001			;02F4
	dw plus_and_minus_barrel_main,$0000		;02F8
	dw gate_barrel_main,$0000			;02FC
	dw unknown_sprite_0300_main,$0001		;0300
	dw clapper_main,$0000				;0304
	dw unknown_sprite_0308_main,$0001		;0308
	dw screech_main,$0000				;030C
	dw racing_flag_main,$0000			;0310
	dw npc_kong_credits_main,$0000			;0314
	dw hero_kong_credits_main,$0000			;0318
	dw double_zingers_main,$0000			;031C


kudgel_main:
	LDA #$0000				;$B38668  \
	JML CODE_B68025				;$B3866B  /

kudgels_club_main:
	LDA #$0002				;$B3866F  \
	JML CODE_B68025				;$B38672  /

krool_gun_main:
	LDA #$0004				;$B38676  \
	JML CODE_B68025				;$B38679  /

shot_donkey_kong_main:
	LDA #$0006				;$B3867D  \
	JML CODE_B68025				;$B38680  /

krool_canball_main:
	LDA #$0008				;$B38684  \
	JML CODE_B68025				;$B38687  /

spiked_canballs_main:
	LDA #$000A				;$B3868B  \
	JML CODE_B68025				;$B3868E  /

krool_gun_fire_main:
	LDA #$000C				;$B38692  \
	JML CODE_B68025				;$B38695  /

krool_gun_vacuum_effect_main:
	LDA #$000E				;$B38699  \
	JML CODE_B68025				;$B3869C  /

krools_blinking_eyes_main:
	LDA #$0010				;$B386A0  \
	JML CODE_B68025				;$B386A3  /

krool_puddle_main:
	LDA #$0012				;$B386A7  \
	JML CODE_B68025				;$B386AA  /

unknown_sprite_0294_main:
	LDA #$0014				;$B386AE  \
	JML CODE_B68025				;$B386B1  /

tied_up_donkey_kong_main:
	LDA #$0016				;$B386B5  \
	JML CODE_B68025				;$B386B8  /

unknown_sprite_0290_main:
	LDA #$0018				;$B386BC  \
	JML CODE_B68025				;$B386BF  /

donkey_kongs_rope_main:
	LDA #$001A				;$B386C3  \
	JML CODE_B68025				;$B386C6  /

donkey_kongs_bindings_main:
	LDA #$001C				;$B386CA  \
	JML CODE_B68025				;$B386CD  /

lava_splash_main:
	LDA #$001E				;$B386D1  \
	JML CODE_B68025				;$B386D4  /

klubba_main:
	LDA #$0020				;$B386D8  \
	JML CODE_B68025				;$B386DB  /

klubbas_club_main:
	LDA #$0022				;$B386DF  \
	JML CODE_B68025				;$B386E2  /

krool_main:
	LDA #$0024				;$B386E6  \
	JML CODE_B68025				;$B386E9  /

unknown_sprite_004C_main:
	LDA #$0026				;$B386ED  \
	JML CODE_B68025				;$B386F0  /

kleever_main:
	LDA #$0000				;$B386F4  \
	JML CODE_B6D171				;$B386F7  /

kleever_fireballs_main:
	LDA #$0002				;$B386FB  \
	JML CODE_B6D171				;$B386FE  /

dropping_hooks_main:
	LDA #$0004				;$B38702  \
	JML CODE_B6D171				;$B38705  /

kleever_canball_main:
	LDA #$0006				;$B38709  \
	JML CODE_B6D171				;$B3870C  /

kleevers_hand_bubbles_main:
	LDA #$0008				;$B38710  \
	JML CODE_B6D171				;$B38713  /

kleever_hand_main:
	LDA #$000A				;$B38717  \
	JML CODE_B6D171				;$B3871A  /

kleever_falling_canball_main:
	LDA #$000C				;$B3871E  \
	JML CODE_B6D171				;$B38721  /

kleever_attack_effect_main:
	LDA #$000E				;$B38725  \
	JML CODE_B6D171				;$B38728  /

broken_kleever_hilt_main:
	LDA #$0010				;$B3872C  \
	JML CODE_B6D171				;$B3872F  /

broken_kleever_fire_main:
	LDA #$0012				;$B38733  \
	JML CODE_B6D171				;$B38736  /

kleever_bone_pieces_main:
	LDA #$0014				;$B3873A  \
	JML CODE_B6D171				;$B3873D  /

unknown_sprite_0030_main:
	LDA #$0016				;$B38741  \
	JML CODE_B6D171				;$B38744  /

kleever_pieces1_main:
	LDA #$0018				;$B38748  \
	JML CODE_B6D171				;$B3874B  /

kleever_pieces2_main:
	LDA #$001A				;$B3874F  \
	JML CODE_B6D171				;$B38752  /

kleever_pieces3_main:
	LDA #$001C				;$B38756  \
	JML CODE_B6D171				;$B38759  /

unknown_sprite_0040_main:
	LDA #$001E				;$B3875D  \
	JML CODE_B6D171				;$B38760  /

kleever_pieces4_main:
	LDA #$0020				;$B38764  \
	JML CODE_B6D171				;$B38767  /

kleever_pieces5_main:
	LDA #$0022				;$B3876B  \
	JML CODE_B6D171				;$B3876E  /

krows_egg_main:
	LDA #$0024				;$B38772  \
	JML CODE_B6D171				;$B38775  /

krows_body_main:
	LDA #$0026				;$B38779  \
	JML CODE_B6D171				;$B3877C  /

krows_head_main:
	LDA #$0028				;$B38780  \
	JML CODE_B6D171				;$B38783  /

king_zing_main:
	LDA #$0000				;$B38787  \
	JML CODE_BA9000				;$B3878A  /

king_zing_ring_zinger_main:
	LDA #$0002				;$B3878E  \
	JML CODE_BA9000				;$B38791  /

unknown_sprite_02BC_main:
	LDA #$0004				;$B38795  \
	JML CODE_BA9000				;$B38798  /

king_zing_stinger_main:
	LDA #$0006				;$B3879C  \
	JML CODE_BA9000				;$B3879F  /

king_zing_spikes_main:
	LDA #$0008				;$B387A3  \
	JML CODE_BA9000				;$B387A6  /

kreepy_krows_body_main:
	LDA #$000A				;$B387AA  \
	JML CODE_BA9000				;$B387AD  /

kreepy_krows_eggs_main:
	LDA #$000C				;$B387B1  \
	JML CODE_BA9000				;$B387B4  /

kreepy_krows_head_main:
	LDA #$000E				;$B387B8  \
	JML CODE_BA9000				;$B387BB  /

unknown_sprite_0054_main:
	LDA #$0000				;$B387BF  \
	JML CODE_BAB078				;$B387C2  /

krool_fish_main:
	LDA #$0002				;$B387C6  \
	JML CODE_BAB078				;$B387C9  /

unknown_sprite_0098_main:
	LDA #$0004				;$B387CD  \
	JML CODE_BAB078				;$B387D0  /

scroll_and_float_barrel_main:
	LDA #$0006				;$B387D4  \
	JML CODE_BAB078				;$B387D7  /

kong_npc_main:
	LDA #$0008				;$B387DB  \
	JML CODE_BAB078				;$B387DE  /

sparkle_spawner_main:
	LDA #$000A				;$B387E2  \
	JML CODE_BAB078				;$B387E5  /

sparkle_main:
	LDA #$000C				;$B387E9  \
	JML CODE_BAB078				;$B387EC  /

unknown_sprite_0050_main:
	LDA #$000E				;$B387F0  \
	JML CODE_BAB078				;$B387F3  /

clapper_main:
	LDA #$0000				;$B387F7  \
	JML CODE_B3D91D				;$B387FA  /

vertical_wind_changer_main:
	LDA #$0002				;$B387FE  \
	JML CODE_B3D91D				;$B38801  /

horizontal_wind_changer_main:
	LDA #$0004				;$B38805  \
	JML CODE_B3D91D				;$B38808  /

timer_main:
	LDA #$0006				;$B3880C  \
	JML CODE_B3D91D				;$B3880F  /

breakable_wall_main:
	LDA #$0008				;$B38813  \
	JML CODE_B3D91D				;$B38816  /

exit_door_main:
	LDA #$000A				;$B3881A  \
	JML CODE_B3D91D				;$B3881D  /

unknown_sprite_0070_main:
	LDA #$000C				;$B38821  \
	JML CODE_B3D91D				;$B38824  /

checkpoint_barrel_main:
	LDA #$000E				;$B38828  \
	JML CODE_B3D91D				;$B3882B  /

cannon_main:
	LDA #$0010				;$B3882F  \
	JML CODE_B3D91D				;$B38832  /

barrel_icons_main:
	LDA #$0012				;$B38836  \
	JML CODE_B3D91D				;$B38839  /

barrel_cannon_main:
	LDA #$0014				;$B3883D  \
	JML CODE_B3D91D				;$B38840  /

haunted_hall_door_main:
	LDA #$0000				;$B38844  \
	JML CODE_BEB800				;$B38847  /

gate_barrel_main:
	LDA #$0002				;$B3884B  \
	JML CODE_BEB800				;$B3884E  /

skull_cart_sparks_main:
	LDA #$0004				;$B38852  \
	JML CODE_BEB800				;$B38855  /

skull_cart_main:
	LDA #$0006				;$B38859  \
	JML CODE_BEB800				;$B3885C  /

klank_main:
	LDA #$0008				;$B38860  \
	JML CODE_BEB800				;$B38863  /

kackle_main:
	LDA #$000A				;$B38867  \
	JML CODE_BEB800				;$B3886A  /

unknown_sprite_0300_main:
	LDA #$000C				;$B3886E  \
	JML CODE_BEB800				;$B38871  /

coins_main:
	LDA #$000E				;$B38875  \
	JML CODE_BEB800				;$B38878  /

kong_letter_main:
	LDA #$0010				;$B3887C  \
	JML CODE_BEB800				;$B3887F  /

traffic_light_main:
	LDA #$0012				;$B38883  \
	JML CODE_BEB800				;$B38886  /

racing_flag_main:
	LDA #$0014				;$B3888A  \
	JML CODE_BEB800				;$B3888D  /

chasing_king_zing_main:
	LDA #$0016				;$B38891  \
	JML CODE_BEB800				;$B38894  /

screech_main:
	LDA #$0018				;$B38898  \
	JML CODE_BEB800				;$B3889B  /

giant_tire_main:
	LDA #$001A				;$B3889F  \
	JML CODE_BEB800				;$B388A2  /

unknown_sprite_00D4_main:
	LDA #$001C				;$B388A6  \
	JML CODE_BEB800				;$B388A9  /

chest_spawner_main:
	LDA #$001E				;$B388AD  \
	JML CODE_BEB800				;$B388B0  /

unknown_sprite_0084_main:
	LDA #$0020				;$B388B4  \
	JML CODE_BEB800				;$B388B7  /

double_zingers_main:
	LDA #$0022				;$B388BB  \
	JML CODE_BEB800				;$B388BE  /

unknown_sprite_00F0_main:
	JML CODE_BBBC59				;$B388C2  /

dixie_kong_main:
	JML CODE_B89670				;$B388C6  /

diddy_kong_main:
	JML CODE_B8967D				;$B388CA  /

unknown_sprite_00EC_main:
	JML [$05A9]				;$B388CE  /

unknown_sprite_00D8_main:
	LDX current_sprite			;$B388D1  \
	LDY $0593				;$B388D3   |
	JSR CODE_B388EA				;$B388D6   |
	LDY $0597				;$B388D9   |
	JSR CODE_B388EA				;$B388DC   |
	LDY current_player_mount		;$B388DF   |
	BEQ CODE_B388E6				;$B388E1   |
	JSR CODE_B388EA				;$B388E3   |
CODE_B388E6:					;	   |
	JML CODE_B38000				;$B388E6  /

CODE_B388EA:
	LDA $0A,x				;$B388EA  \
	CMP $000A,y				;$B388EC   |
	BMI CODE_B388F6				;$B388EF   |
	LDA #$3000				;$B388F1   |
	BRA CODE_B388F9				;$B388F4  /

CODE_B388F6:
	LDA #$2000				;$B388F6  \
CODE_B388F9:					;	   |
	EOR $0012,y				;$B388F9   |
	AND #$3000				;$B388FC   |
	EOR $0012,y				;$B388FF   |
	STA $0012,y				;$B38902   |
	RTS					;$B38905  /

npc_kong_credits_main:
	JML CODE_80FA11				;$B38906  /

hero_kong_credits_main:
	JML CODE_80FA40				;$B3890A  /

rain_cloud_main:
	LDY $0593				;$B3890E  \
	LDX current_sprite			;$B38911   |
	LDA $0020,y				;$B38913   |
	STA $20,x				;$B38916   |
	STZ $24,x				;$B38918   |
	JSL CODE_B8CF7F				;$B3891A   |
	JSL CODE_B9D100				;$B3891E   |
	JML [$05A9]				;$B38922  /

web_shot_main:
	JSL CODE_BCFB58				;$B38925  \
	LDA #$0020				;$B38929   |
	LDY #$0008				;$B3892C   |
	JSL CODE_BEBD8E				;$B3892F   |
	BCS CODE_B3894F				;$B38933   |
	JSR CODE_B38A0A				;$B38935   |
	JSL CODE_B8CF7F				;$B38938   |
	JSL CODE_B9D100				;$B3893C   |
	JSL CODE_BBBB8D				;$B38940   |
	BCS CODE_B38949				;$B38944   |
	JML [$05A9]				;$B38946  /

CODE_B38949:
	DEC $19A6				;$B38949  \
	JML [$05A9]				;$B3894C  /

CODE_B3894F:
	DEC $19A6				;$B3894F  \
	JSL CODE_BB82B8				;$B38952   |
	JML [$05A9]				;$B38956  /

web_platform_main:
	LDX current_sprite			;$B38959  \
	LDA $2E,x				;$B3895B   |
	ASL A					;$B3895D   |
	TAX					;$B3895E   |
	JMP (DATA_B38962,x)			;$B3895F  /

DATA_B38962:
	dw CODE_B3896A
	dw CODE_B38986
	dw CODE_B389A6
	dw CODE_B389FD

CODE_B3896A:
	JSR CODE_B38A0A				;$B3896A  \
	JSL CODE_B8CF7F				;$B3896D   |
	JSL CODE_BBBB8D				;$B38971   |
	BCS CODE_B3897D				;$B38975   |
	JSL CODE_B9D100				;$B38977   |
	BRA CODE_B389A1				;$B3897B  /

CODE_B3897D:
	LDA #$00C0				;$B3897D  \
	TRB $0B02				;$B38980   |
	JML [$05A9]				;$B38983  /

CODE_B38986:
	LDX current_sprite			;$B38986  \
	LDX current_sprite			;$B38988   |
	LDA $06,x				;$B3898A   |
	STA $22,x				;$B3898C   |
	LDA $0A,x				;$B3898E   |
	STA $28,x				;$B38990   |
	STZ $30,x				;$B38992   |
	STZ $4E,x				;$B38994   |
	LDA #$00C4				;$B38996   |
	STA $02,x				;$B38999   |
	LDA global_frame_counter		;$B3899B   |
	STA $46,x				;$B3899D   |
	INC $2E,x				;$B3899F   |
CODE_B389A1:					;	   |
	JML [$05A9]				;$B389A1  /

CODE_B389A4:
	BRA CODE_B3897D				;$B389A4  /

CODE_B389A6:
	LDX current_sprite			;$B389A6  \
	LDA $44,x				;$B389A8   |
	BNE CODE_B389B8				;$B389AA   |
	LDA global_frame_counter		;$B389AC   |
	SEC					;$B389AE   |
	SBC $46,x				;$B389AF   |
	CMP #$01A4				;$B389B1   |
	BMI CODE_B389B8				;$B389B4   |
	INC $44,x				;$B389B6   |
CODE_B389B8:					;	   |
	LDA $44,x				;$B389B8   |
	DEC A					;$B389BA   |
	BNE CODE_B389CC				;$B389BB   |
	LDA #$0080				;$B389BD   |
	TRB $0B02				;$B389C0   |
	INC $44,x				;$B389C3   |
	LDA #$02D7				;$B389C5   |
	JSL CODE_B9D0C6				;$B389C8   |
CODE_B389CC:					;	   |
	JSL CODE_B9D100				;$B389CC   |
	LDA #CODE_B389D9			;$B389D0   |
	JSL CODE_B3D46C				;$B389D3   |
	BRA CODE_B389A1				;$B389D7  /

CODE_B389D9:
	LDX current_sprite			;$B389D9  \
	LDA $54,x				;$B389DB   |
	STA $8E					;$B389DD   |
	STZ $52,x				;$B389DF   |
	JSL CODE_B3D485				;$B389E1   |
	JSL CODE_B3D4AE				;$B389E5   |
	PHP					;$B389E9   |
	LDX current_sprite			;$B389EA   |
	ROL A					;$B389EC   |
	STA $4E,x				;$B389ED   |
	PLP					;$B389EF   |
	BCC CODE_B389F4				;$B389F0   |
	STZ $42,x				;$B389F2   |
CODE_B389F4:					;	   |
	LDA $42,x				;$B389F4   |
	INC A					;$B389F6   |
	BPL CODE_B389FA				;$B389F7   |
	DEC A					;$B389F9   |
CODE_B389FA:					;	   |
	STA $42,x				;$B389FA   |
	RTL					;$B389FC  /

CODE_B389FD:
	JSL CODE_BBBB8D				;$B389FD  \
	BCS CODE_B389A4				;$B38A01   |
	JSL CODE_B9D100				;$B38A03   |
	BRL CODE_B389A1				;$B38A07  /

CODE_B38A0A:
	LDX current_sprite			;$B38A0A  \
	LDA $48,x				;$B38A0C   |
	BPL CODE_B38A1E				;$B38A0E   |
	CLC					;$B38A10   |
	ADC $24,x				;$B38A11   |
	CMP #$FA00				;$B38A13   |
	BPL CODE_B38A1B				;$B38A16   |
	LDA #$FA00				;$B38A18   |
CODE_B38A1B:					;	   |
	STA $24,x				;$B38A1B   |
	RTS					;$B38A1D  /

CODE_B38A1E:
	CLC					;$B38A1E  \
	ADC $24,x				;$B38A1F   |
	CMP #$0600				;$B38A21   |
	BMI CODE_B38A29				;$B38A24   |
	LDA #$0600				;$B38A26   |
CODE_B38A29:					;	   |
	STA $24,x				;$B38A29   |
	RTS					;$B38A2B  /

unknown_sprite_01CC_main:
	LDA $0D7A				;$B38A2C  \
	BNE CODE_B38A35				;$B38A2F   |
	JSL CODE_BB82B8				;$B38A31   |
CODE_B38A35:					;	   |
	JML [$05A9]				;$B38A35  /

rambi_main:
squitter_main:
	LDX current_sprite			;$B38A38  \
	LDA $54,x				;$B38A3A   |
	STA $8E					;$B38A3C   |
	TXY					;$B38A3E   |
	LDA $2E,x				;$B38A3F   |
	ASL A					;$B38A41   |
	TAX					;$B38A42   |
	JMP (DATA_B38A46,x)			;$B38A43  /

DATA_B38A46:
	dw CODE_B38A6F
	dw CODE_B38A8E
	dw CODE_B38A97
	dw CODE_B38AE2
	dw CODE_B38AE4
	dw CODE_B38AE4
	dw CODE_B38AE4
	dw CODE_B38A6C

	INC $5A8A				;$B38A57   |
	TXA					;$B38A59   |
	JSR CODE_B38CF8				;$B38A5A   |
	JSL CODE_B8CF7F				;$B38A5D   |
	LDA #$0007				;$B38A61   |
	JSL CODE_B8D010				;$B38A64   |
	JML CODE_B38000				;$B38A68  /

CODE_B38A6C:
	JML [$05A9]				;$B38A6C  /

CODE_B38A6F:
	JSR CODE_B38BB4				;$B38A6F  \
	BCS CODE_B38A6C				;$B38A72   |
	JSR CODE_B38BEA				;$B38A74   |
	BCS CODE_B38A6C				;$B38A77   |
	JSR CODE_B38D1D				;$B38A79   |
	JSR CODE_B38CF8				;$B38A7C   |
	JSL CODE_B8D5E0				;$B38A7F   |
	JSL CODE_B9D100				;$B38A83   |
	JSL CODE_BBBB99				;$B38A87   |
	JML [$05A9]				;$B38A8B  /

CODE_B38A8E:
	JSR CODE_B38CC5				;$B38A8E  \
	JSL CODE_B9D100				;$B38A91   |
	BRA CODE_B38A6C				;$B38A95  /

CODE_B38A97:
	JSR CODE_B38BB4				;$B38A97  \
	BCS CODE_B38A6C				;$B38A9A   |
	JSR CODE_B38BEA				;$B38A9C   |
	BCS CODE_B38A6C				;$B38A9F   |
	JSR CODE_B38D1D				;$B38AA1   |
	BCS CODE_B38A6C				;$B38AA4   |
	JSR CODE_B38CF8				;$B38AA6   |
	LDA #$0007				;$B38AA9   |
	JSL CODE_B8D010				;$B38AAC   |
	JSL CODE_B8D5E0				;$B38AB0   |
	JSR CODE_B38AC2				;$B38AB4   |
	JSL CODE_B9D100				;$B38AB7   |
	JSL CODE_BBBB99				;$B38ABB   |
	JML [$05A9]				;$B38ABF  /

CODE_B38AC2:
	LDX current_sprite			;$B38AC2  \
	LDA $1E,x				;$B38AC4   |
	AND #$0002				;$B38AC6   |
	BNE CODE_B38ACC				;$B38AC9   |
	RTS					;$B38ACB  /

CODE_B38ACC:
	LDA $12,x				;$B38ACC  \
	EOR #$4000				;$B38ACE   |
	STA $12,x				;$B38AD1   |
	LDA $44,x				;$B38AD3   |
	BIT $12,x				;$B38AD5   |
	BVC CODE_B38ADD				;$B38AD7   |
	EOR #$FFFF				;$B38AD9   |
	INC A					;$B38ADC   |
CODE_B38ADD:					;	   |
	STA $20,x				;$B38ADD   |
	STA $26,x				;$B38ADF   |
	RTS					;$B38AE1  /

CODE_B38AE2:
	BRA CODE_B38A6C				;$B38AE2  /

CODE_B38AE4:
	JSR CODE_B38CC5				;$B38AE4  \
	JSL CODE_B9D100				;$B38AE7   |
	BRL CODE_B38A6C				;$B38AEB  /

	LDA $0515				;$B38AEE   |
	CMP #$0001				;$B38AF1   |
	BEQ CODE_B38AFD				;$B38AF4   |
CODE_B38AF6:					;	   |
	LDX current_sprite			;$B38AF6   |
	STZ $2E,x				;$B38AF8   |
	BRL CODE_B38A6C				;$B38AFA  /

CODE_B38AFD:
	LDA $6E					;$B38AFD  \
	BEQ CODE_B38AF6				;$B38AFF   |
	JSL CODE_BB82B8				;$B38B01   |
	JML [$05A9]				;$B38B05  /

rattly_main:
	LDX current_sprite			;$B38B08  \
	LDA $54,x				;$B38B0A   |
	STA $8E					;$B38B0C   |
	TXY					;$B38B0E   |
	LDA $2E,x				;$B38B0F   |
	ASL A					;$B38B11   |
	TAX					;$B38B12   |
	JMP (DATA_B38B16,x)			;$B38B13  /

DATA_B38B16:
	dw CODE_B38B2D
	dw CODE_B38B47
	dw CODE_B38B4C
	dw CODE_B38B92
	dw CODE_B38B94
	dw CODE_B38B94
	dw CODE_B38B94
	dw CODE_B38B99
	dw CODE_B38B9B
	dw CODE_B38B2A


CODE_B38B2A:
	JML [$05A9]				;$B38B2A  /

CODE_B38B2D:
	JSR CODE_B38BB4				;$B38B2D  \
	BCS CODE_B38B2A				;$B38B30   |
	JSR CODE_B38D1D				;$B38B32   |
	JSR CODE_B38CF8				;$B38B35   |
	JSL CODE_B8D5E0				;$B38B38   |
	JSL CODE_B9D100				;$B38B3C   |
	JSL CODE_BBBB99				;$B38B40   |
	JML [$05A9]				;$B38B44  /

CODE_B38B47:
	JSR CODE_B38CC5				;$B38B47  \
	BRA CODE_B38B2A				;$B38B4A  /

CODE_B38B4C:
	JSR CODE_B38BB4				;$B38B4C  \
	BCS CODE_B38B2A				;$B38B4F   |
	JSR CODE_B38D1D				;$B38B51   |
	BCS CODE_B38B2A				;$B38B54   |
	JSR CODE_B38CF8				;$B38B56   |
	LDA #$0007				;$B38B59   |
	JSL CODE_B8D010				;$B38B5C   |
	JSL CODE_B8D5E0				;$B38B60   |
	JSR CODE_B38B72				;$B38B64   |
	JSL CODE_B9D100				;$B38B67   |
	JSL CODE_BBBB99				;$B38B6B   |
	JML [$05A9]				;$B38B6F  /

CODE_B38B72:
	LDX current_sprite			;$B38B72  \
	LDA $1E,x				;$B38B74   |
	AND #$0002				;$B38B76   |
	BNE CODE_B38B7C				;$B38B79   |
	RTS					;$B38B7B  /

CODE_B38B7C:
	LDA $12,x				;$B38B7C  \
	EOR #$4000				;$B38B7E   |
	STA $12,x				;$B38B81   |
	LDA $44,x				;$B38B83   |
	BIT $12,x				;$B38B85   |
	BVC CODE_B38B8D				;$B38B87   |
	EOR #$FFFF				;$B38B89   |
	INC A					;$B38B8C   |
CODE_B38B8D:					;	   |
	STA $20,x				;$B38B8D   |
	STA $26,x				;$B38B8F   |
	RTS					;$B38B91  /

CODE_B38B92:
	BRA CODE_B38B2A				;$B38B92  /

CODE_B38B94:
	JSR CODE_B38CC5				;$B38B94  \
	BRA CODE_B38B2A				;$B38B97  /

CODE_B38B99:
	BRA CODE_B38B2A				;$B38B99  /

CODE_B38B9B:
	LDA $0515				;$B38B9B  \
	CMP #$0001				;$B38B9E   |
	BEQ CODE_B38BA9				;$B38BA1   |
CODE_B38BA3:					;	   |
	LDX current_sprite			;$B38BA3   |
	STZ $2E,x				;$B38BA5   |
	BRA CODE_B38B2A				;$B38BA7  /

CODE_B38BA9:
	LDA $6E					;$B38BA9  \
	BEQ CODE_B38BA3				;$B38BAB   |
	JSL CODE_BB82B8				;$B38BAD   |
	JML [$05A9]				;$B38BB1  /

CODE_B38BB4:
	LDX current_sprite			;$B38BB4  \
	LDA $32,x				;$B38BB6   |
	CMP #$0002				;$B38BB8   |
	BEQ CODE_B38BBF				;$B38BBB   |
	CLC					;$B38BBD   |
	RTS					;$B38BBE  /

CODE_B38BBF:
	JSL CODE_BB82B8				;$B38BBF  \
	LDX current_sprite			;$B38BC3   |
	LDA $0A,x				;$B38BC5   |
	SEC					;$B38BC7   |
	SBC #$0018				;$B38BC8   |
	STA $0A,x				;$B38BCB   |
	INC $00,x				;$B38BCD   |
	LDY #$0122				;$B38BCF   |
	JSL CODE_BB842C				;$B38BD2   |
	LDY #$0124				;$B38BD6   |
	JSL CODE_BB842C				;$B38BD9   |
	LDY #$0126				;$B38BDD   |
	JSL CODE_BB842C				;$B38BE0   |
	LDX current_sprite			;$B38BE4   |
	STZ $00,x				;$B38BE6   |
	SEC					;$B38BE8   |
	RTS					;$B38BE9  /

CODE_B38BEA:
	LDA $10,x				;$B38BEA  \
	AND #$0100				;$B38BEC   |
	BEQ CODE_B38C04				;$B38BEF   |
	LDA #$0009				;$B38BF1   |
	STA $2E,x				;$B38BF4   |
	LDA #$FB00				;$B38BF6   |
	STA $24,x				;$B38BF9   |
	LDA #$014C				;$B38BFB   |
	JSL CODE_B9D07B				;$B38BFE   |
	SEC					;$B38C02   |
	RTS					;$B38C03  /

CODE_B38C04:
	CLC					;$B38C04  \
	RTS					;$B38C05  /

squawks_main:
	LDX current_sprite			;$B38C06  \
	LDA $54,x				;$B38C08   |
	STA $8E					;$B38C0A   |
	TXY					;$B38C0C   |
	LDA $2E,x				;$B38C0D   |
	ASL A					;$B38C0F   |
	TAX					;$B38C10   |
	JMP (DATA_B38C14,x)			;$B38C11  /

DATA_B38C14:
	dw CODE_B38C54
	dw CODE_B38C77
	dw CODE_B38C83
	dw CODE_B38C8E
	dw CODE_B38C90
	dw CODE_B38C90
	dw CODE_B38C90
	dw CODE_B38C51
	dw CODE_B38C92
	dw CODE_B38C3F
	dw CODE_B38C2A



CODE_B38C2A:
	LDX current_sprite			;$B38C2A  \
	LDA #$FE70				;$B38C2C   |
	STA $24,x				;$B38C2F   |
	STZ $20,x				;$B38C31   |
	JSL CODE_B8CF7F				;$B38C33   |
	JSL CODE_B9D100				;$B38C37   |
	JML CODE_B38000				;$B38C3B  /

CODE_B38C3F:
	JSR CODE_B38CF8				;$B38C3F  \
	JSL CODE_B8CF7F				;$B38C42   |
	LDA #$0007				;$B38C46   |
	JSL CODE_B8D010				;$B38C49   |
	JML CODE_B38000				;$B38C4D  /

CODE_B38C51:
	JML [$05A9]				;$B38C51  /

CODE_B38C54:
	JSR CODE_B38BB4				;$B38C54  \
	BCS CODE_B38C51				;$B38C57   |
	JSR CODE_B38BEA				;$B38C59   |
	BCS CODE_B38C51				;$B38C5C   |
	JSR CODE_B38D1D				;$B38C5E   |
	JSL CODE_B8D5E0				;$B38C61   |
	JSL CODE_B9D100				;$B38C65   |
	LDA level_number			;$B38C69   |
	CMP #$0024				;$B38C6B   |
	BEQ CODE_B38C51				;$B38C6E   |
	JSL CODE_BBBB99				;$B38C70   |
	JML [$05A9]				;$B38C74  /

CODE_B38C77:
	JSR CODE_B38CC5				;$B38C77  \
	JSR CODE_B38CAB				;$B38C7A   |
	JSL CODE_B9D100				;$B38C7D   |
	BRA CODE_B38C51				;$B38C81  /

CODE_B38C83:
	JSR CODE_B38BB4				;$B38C83  \
	BCS CODE_B38C51				;$B38C86   |
	LDX current_sprite			;$B38C88   |
	STZ $2E,x				;$B38C8A   |
	BRA CODE_B38C51				;$B38C8C  /

CODE_B38C8E:
	BRA CODE_B38C51				;$B38C8E  /

CODE_B38C90:
	BRA CODE_B38C51				;$B38C90  /

CODE_B38C92:
	LDA $0515				;$B38C92  \
	CMP #$0001				;$B38C95   |
	BEQ CODE_B38CA0				;$B38C98   |
CODE_B38C9A:					;	   |
	LDX current_sprite			;$B38C9A   |
	STZ $2E,x				;$B38C9C   |
	BRA CODE_B38C51				;$B38C9E  /

CODE_B38CA0:
	LDA $6E					;$B38CA0  \
	BEQ CODE_B38C9A				;$B38CA2   |
	JSL CODE_BB82B8				;$B38CA4   |
	JML [$05A9]				;$B38CA8  /

CODE_B38CAB:
	LDA $08C2				;$B38CAB  \
	AND #$4000				;$B38CAE   |
	BEQ CODE_B38CC4				;$B38CB1   |
	LDY $0597				;$B38CB3   |
	LDX current_player_mount		;$B38CB6   |
	BEQ CODE_B38CC4				;$B38CB8   |
	LDA $06,x				;$B38CBA   |
	STA $0006,y				;$B38CBC   |
	LDA $0A,x				;$B38CBF   |
	STA $000A,y				;$B38CC1   |
CODE_B38CC4:					;	   |
	RTS					;$B38CC4  /

CODE_B38CC5:
	LDX current_sprite			;$B38CC5  \
	LDY $0593				;$B38CC7   |
	BIT $12,x				;$B38CCA   |
	BVS CODE_B38CD9				;$B38CCC   |
	LDA $0006,y				;$B38CCE   |
	CLC					;$B38CD1   |
	ADC $0D76				;$B38CD2   |
	STA $06,x				;$B38CD5   |
	BRA CODE_B38CE2				;$B38CD7  /

CODE_B38CD9:
	LDA $0006,y				;$B38CD9  \
	SEC					;$B38CDC   |
	SBC $0D76				;$B38CDD   |
	STA $06,x				;$B38CE0   |
CODE_B38CE2:					;	   |
	LDA $000A,y				;$B38CE2   |
	CLC					;$B38CE5   |
	ADC $0D78				;$B38CE6   |
	STA $0A,x				;$B38CE9   |
	LDA $0012,y				;$B38CEB   |
	EOR $12,x				;$B38CEE   |
	AND #$C000				;$B38CF0   |
	EOR $12,x				;$B38CF3   |
	STA $12,x				;$B38CF5   |
	RTS					;$B38CF7  /

CODE_B38CF8:
	LDX current_sprite			;$B38CF8  \
	LDY #$0000				;$B38CFA   |
	LDA [$8E],y				;$B38CFD   |
	LDY #$0002				;$B38CFF   |
	CLC					;$B38D02   |
	ADC $24,x				;$B38D03   |
	BMI CODE_B38D0D				;$B38D05   |
	CMP [$8E],y				;$B38D07   |
	BCC CODE_B38D0D				;$B38D09   |
	LDA [$8E],y				;$B38D0B   |
CODE_B38D0D:					;	   |
	STA $24,x				;$B38D0D   |
	RTS					;$B38D0F  /

CODE_B38D10:
	LDX $0593				;$B38D10  \
	LDA $2E,x				;$B38D13   |
	ASL A					;$B38D15   |
	ASL A					;$B38D16   |
	TAX					;$B38D17   |
	LDA.l DATA_B896B7,x			;$B38D18   |
	RTS					;$B38D1C  /

CODE_B38D1D:
	LDX current_sprite			;$B38D1D  \
	LDA $42,x				;$B38D1F   |
	BEQ CODE_B38D27				;$B38D21   |
	DEC $42,x				;$B38D23   |
	BRA CODE_B38D4F				;$B38D25  /

CODE_B38D27:
	LDA $0A,x				;$B38D27  \
	SEC					;$B38D29   |
	SBC $17C0				;$B38D2A   |
	CMP #$0110				;$B38D2D   |
	BPL CODE_B38D4F				;$B38D30   |
	JSL CODE_BCFB58				;$B38D32   |
	LDA $00,x				;$B38D36   |
	SEC					;$B38D38   |
	SBC #$0190				;$B38D39   |
	LSR A					;$B38D3C   |
	LSR A					;$B38D3D   |
	CLC					;$B38D3E   |
	ADC #$0001				;$B38D3F   |
	JSL CODE_BCFB7A				;$B38D42   |
	LDA #$0004				;$B38D46   |
	JSL CODE_BCFCB5				;$B38D49   |
	BCS CODE_B38D51				;$B38D4D   |
CODE_B38D4F:					;	   |
	CLC					;$B38D4F   |
	RTS					;$B38D50  /

CODE_B38D51:
	LDA $6E					;$B38D51  \
	BNE CODE_B38D4F				;$B38D53   |
	LDA $0D7A				;$B38D55   |
	BNE CODE_B38D4F				;$B38D58   |
	LDY $6A					;$B38D5A   |
	CPY $0593				;$B38D5C   |
	BNE CODE_B38D4F				;$B38D5F   |
	JSR CODE_B38D10				;$B38D61   |
	AND #$0009				;$B38D64   |
	BNE CODE_B38D4F				;$B38D67   |
	LDX current_sprite			;$B38D69   |
	LDA $00,x				;$B38D6B   |
	CMP #$0198				;$B38D6D   |
	BEQ CODE_B38D95				;$B38D70   |
	CMP #$01A0				;$B38D72   |
	BEQ CODE_B38D7C				;$B38D75   |
	LDA $0024,y				;$B38D77   |
	BMI CODE_B38D4F				;$B38D7A   |
CODE_B38D7C:					;	   |
	LDA $0A,x				;$B38D7C   |
	SEC					;$B38D7E   |
	SBC $000A,y				;$B38D7F   |
	BMI CODE_B38D4F				;$B38D82   |
	LDA $001E,y				;$B38D84   |
	AND #$0100				;$B38D87   |
	BNE CODE_B38D4F				;$B38D8A   |
	LDA #$0017				;$B38D8C   |
	JSL CODE_B8D8BA				;$B38D8F   |
	SEC					;$B38D93   |
	RTS					;$B38D94  /

CODE_B38D95:
	LDA $001E,y				;$B38D95  \
	AND #$1001				;$B38D98   |
	BNE CODE_B38D4F				;$B38D9B   |
	LDA #$0017				;$B38D9D   |
	JSL CODE_B8D8BA				;$B38DA0   |
	SEC					;$B38DA4   |
	RTS					;$B38DA5  /

enguarde_main:
	LDX current_sprite			;$B38DA6  \
	LDA $54,x				;$B38DA8   |
	STA $8E					;$B38DAA   |
	LDA $2E,x				;$B38DAC   |
	ASL A					;$B38DAE   |
	TAX					;$B38DAF   |
	JMP (DATA_B38DB3,x)			;$B38DB0  /

DATA_B38DB3:
	dw CODE_B38DC7
	dw CODE_B38DE1
	dw CODE_B38DEA
	dw CODE_B38DEF
	dw CODE_B38DF1
	dw CODE_B38E19
	dw CODE_B38E1B
	dw CODE_B38E61
	dw CODE_B38E64
	dw CODE_B38DC7

CODE_B38DC7:
	JSR CODE_B38BB4				;$B38DC7  \
	BCS CODE_B38DEC				;$B38DCA   |
	JSR CODE_B38D1D				;$B38DCC   |
	JSR CODE_B38CF8				;$B38DCF   |
	JSL CODE_B8D5E0				;$B38DD2   |
	JSL CODE_B9D100				;$B38DD6   |
	JSL CODE_BBBB99				;$B38DDA   |
	JML [$05A9]				;$B38DDE  /

CODE_B38DE1:
	JSR CODE_B38CC5				;$B38DE1  \
	JSL CODE_B9D100				;$B38DE4   |
	BRA CODE_B38DEC				;$B38DE8  /

CODE_B38DEA:
	BRA CODE_B38DEC				;$B38DEA  /

CODE_B38DEC:
	JML [$05A9]				;$B38DEC  /

CODE_B38DEF:
	BRA CODE_B38DEC				;$B38DEF  /

CODE_B38DF1:
	JSR CODE_B38D1D				;$B38DF1  \
	JSR CODE_B38E9A				;$B38DF4   |
	JSL CODE_B8D5E0				;$B38DF7   |
	JSL CODE_B9D100				;$B38DFB   |
if !version == 0				;	   |
	BRA CODE_B38DEC				;$B38DFF   |
else						;	   |
	LDA level_number			;$B38DFF   |
	CMP #$008F				;$B38E01   |
	BNE CODE_B38E12				;$B38E04   |
	LDA $0915				;$B38E06   |
	BEQ CODE_B38E12				;$B38E09   |
	JSL CODE_BB82B8				;$B38E0B   |
	JML [$05A9]				;$B38E0F  /

CODE_B38E12:
	JSL CODE_BBBB99				;$B38E12  \
	JML [$05A9]				;$B38E16   |
endif						;	   |
CODE_B38E19:					;	   |
	BRA CODE_B38DEC				;$B38E19   |
CODE_B38E1B:					;	   |
	JSR CODE_B38BB4				;$B38E18   |
	BCS CODE_B38DEC				;$B38E1E   |
	JSR CODE_B38D1D				;$B38E20   |
	BCC CODE_B38E27				;$B38E23   |
	BRA CODE_B38DEC				;$B38E25   |
						;	   |
CODE_B38E27:					;	   |
	JSR CODE_B38E81				;$B38E27   |
	BCC CODE_B38E33				;$B38E2A   |
	JSL CODE_BB82B8				;$B38E2C   |
	JML [$05A9]				;$B38E30  /

CODE_B38E33:
	LDX current_sprite			;$B38E33  \
	LDA $1E,x				;$B38E35   |
	AND #$0002				;$B38E37   |
	BNE CODE_B38E3E				;$B38E3A   |
	BRA CODE_B38E54				;$B38E3C  /

CODE_B38E3E:
	LDA $12,x				;$B38E3E  \
	EOR #$4000				;$B38E40   |
	STA $12,x				;$B38E43   |
	LDA #$0200				;$B38E45   |
	BIT $12,x				;$B38E48   |
	BVC CODE_B38E50				;$B38E4A   |
	EOR #$FFFF				;$B38E4C   |
	INC A					;$B38E4F   |
CODE_B38E50:					;	   |
	STA $20,x				;$B38E50   |
	STA $26,x				;$B38E52   |
CODE_B38E54:					;	   |
	JSR CODE_B38E9A				;$B38E54   |
	JSL CODE_B8D5E0				;$B38E57   |
	JSL CODE_B9D100				;$B38E5B   |
	BRA CODE_B38DEC				;$B38E5F  /

CODE_B38E61:
if !version == 0				;	  \
	BRA CODE_B38DEC				;$B38E61   |
else						;	   |
	JML [$05A9]				;$B38E61  /
endif

CODE_B38E64:
	LDA $0515				;$B38E64  \
	CMP #$0001				;$B38E67   |
	BEQ CODE_B38E76				;$B38E6A   |
CODE_B38E6C:					;	   |
	LDX current_sprite			;$B38E6C   |
	LDA #$0004				;$B38E6E   |
	STA $2E,x				;$B38E71   |
if !version == 0				;	   |
	BRA CODE_B38DEC				;$B38E73   |
else						;	   |
	JML [$05A9]				;$B38E73  /
endif

CODE_B38E76:
	LDA $6E					;$B38E76  \
	BEQ CODE_B38E6C				;$B38E78   |
	JSL CODE_BB82B8				;$B38E7A   |
	JML [$05A9]				;$B38E7E  /

CODE_B38E81:
	JSL CODE_BBBB69				;$B38E81  \
	BCC CODE_B38E91				;$B38E85   |
	LDX current_sprite			;$B38E87   |
	DEC $4A,x				;$B38E89   |
	BMI CODE_B38E8F				;$B38E8B   |
	CLC					;$B38E8D   |
	RTS					;$B38E8E  /

CODE_B38E8F:
	SEC					;$B38E8F  \
	RTS					;$B38E90  /

CODE_B38E91:
	LDX current_sprite			;$B38E91  \
	LDA #$012C				;$B38E93   |
	STA $4A,x				;$B38E96   |
	CLC					;$B38E98   |
	RTS					;$B38E99  /

CODE_B38E9A:
	LDX current_sprite			;$B38E9A  \
	STZ $24,x				;$B38E9C   |
	JSL CODE_B8B6A3				;$B38E9E   |
	CMP #$0001				;$B38EA2   |
	BNE CODE_B38EAC				;$B38EA5   |
	LDA #$0400				;$B38EA7   |
	STA $24,x				;$B38EAA   |
CODE_B38EAC:					;	   |
	RTS					;$B38EAC  /

glimmer_main:
	LDX current_sprite			;$B38EAD  \
	LDA $2E,x				;$B38EAF   |
	ASL A					;$B38EB1   |
	TAX					;$B38EB2   |
	JMP (DATA_B38EB6,x)			;$B38EB3  /

DATA_B38EB6:
	dw CODE_B38EBE
	dw CODE_B38EF1
	dw CODE_B38EF4
	dw CODE_B38F04

CODE_B38EBE:
	LDA current_sprite			;$B38EBE  \
	STA $0989				;$B38EC0   |
	JSR CODE_B38F40				;$B38EC3   |
	LDA #$0007				;$B38EC6   |
	JSL CODE_B8D010				;$B38EC9   |
	LDA #$0007				;$B38ECD   |
	JSL CODE_B8CFD4				;$B38ED0   |
	JSL CODE_B8CF7F				;$B38ED4   |
	LDX current_sprite			;$B38ED8   |
	LDA $17BA				;$B38EDA   |
	CLC					;$B38EDD   |
	ADC #$0014				;$B38EDE   |
	CMP $06,x				;$B38EE1   |
	BMI CODE_B38EE7				;$B38EE3   |
	STA $06,x				;$B38EE5   |
CODE_B38EE7:					;	   |
	JSR CODE_B38F16				;$B38EE7   |
	JSL CODE_B9D100				;$B38EEA   |
	JML [$05A9]				;$B38EEE  /

CODE_B38EF1:
	JML [$05A9]				;$B38EF1  /

CODE_B38EF4:
	LDX current_sprite			;$B38EF4  \
	LDA $17BA				;$B38EF6   |
	CLC					;$B38EF9   |
	ADC #$0080				;$B38EFA   |
	STA $06,x				;$B38EFD   |
	STZ $2E,x				;$B38EFF   |
	JML [$05A9]				;$B38F01  /

CODE_B38F04:
	LDA $0989				;$B38F04  \
	BNE CODE_B38F0F				;$B38F07   |
	LDX current_sprite			;$B38F09   |
	STZ $2E,x				;$B38F0B   |
	BRA CODE_B38EBE				;$B38F0D  /

CODE_B38F0F:
	JSL CODE_BB82B8				;$B38F0F  \
	JML [$05A9]				;$B38F13  /

CODE_B38F16:
	LDA $20,x				;$B38F16  \
	BPL CODE_B38F1E				;$B38F18   |
	EOR #$FFFF				;$B38F1A   |
	INC A					;$B38F1D   |
CODE_B38F1E:					;	   |
	STA $32					;$B38F1E   |
	LDA $24,x				;$B38F20   |
	BPL CODE_B38F28				;$B38F22   |
	EOR #$FFFF				;$B38F24   |
	INC A					;$B38F27   |
CODE_B38F28:					;	   |
	CMP $32					;$B38F28   |
	BPL CODE_B38F2E				;$B38F2A   |
	LDA $32					;$B38F2C   |
CODE_B38F2E:					;	   |
	LSR A					;$B38F2E   |
	STA $5E					;$B38F2F   |
	LSR A					;$B38F31   |
	CLC					;$B38F32   |
	ADC $5E					;$B38F33   |
	CMP #$0160				;$B38F35   |
	BPL CODE_B38F3D				;$B38F38   |
	LDA #$0160				;$B38F3A   |
CODE_B38F3D:					;	   |
	STA $3A,x				;$B38F3D   |
	RTS					;$B38F3F  /

CODE_B38F40:
	LDX $0593				;$B38F40  \
	LDA #$FFC0				;$B38F43   |
	BIT $12,x				;$B38F46   |
	BVC CODE_B38F4E				;$B38F48   |
	EOR #$FFFF				;$B38F4A   |
	INC A					;$B38F4D   |
CODE_B38F4E:					;	   |
	CLC					;$B38F4E   |
	ADC $06,x				;$B38F4F   |
	STA $5E					;$B38F51   |
	LDA $0A,x				;$B38F53   |
	CLC					;$B38F55   |
	ADC #$FFF0				;$B38F56   |
	STA $60					;$B38F59   |
	JSR CODE_B38F62				;$B38F5B   |
	JSR CODE_B38F91				;$B38F5E   |
	RTS					;$B38F61  /

CODE_B38F62:
	LDX current_sprite			;$B38F62  \
	LDA $5E					;$B38F64   |
	SEC					;$B38F66   |
	SBC $06,x				;$B38F67   |
	BMI CODE_B38F7A				;$B38F69   |
	ASL A					;$B38F6B   |
	ASL A					;$B38F6C   |
	ASL A					;$B38F6D   |
	ASL A					;$B38F6E   |
	CMP #$0800				;$B38F6F   |
	BMI CODE_B38F77				;$B38F72   |
	LDA #$0800				;$B38F74   |
CODE_B38F77:					;	   |
	STA $26,x				;$B38F77   |
	RTS					;$B38F79  /

CODE_B38F7A:
	EOR #$FFFF				;$B38F7A  \
	INC A					;$B38F7D   |
	ASL A					;$B38F7E   |
	ASL A					;$B38F7F   |
	ASL A					;$B38F80   |
	ASL A					;$B38F81   |
	EOR #$FFFF				;$B38F82   |
	INC A					;$B38F85   |
	CMP #$F800				;$B38F86   |
	BPL CODE_B38F8E				;$B38F89   |
	LDA #$F800				;$B38F8B   |
CODE_B38F8E:					;	   |
	STA $26,x				;$B38F8E   |
	RTS					;$B38F90  /

CODE_B38F91:
	LDX current_sprite			;$B38F91  \
	LDA $60					;$B38F93   |
	SEC					;$B38F95   |
	SBC $0A,x				;$B38F96   |
	BMI CODE_B38FA9				;$B38F98   |
	ASL A					;$B38F9A   |
	ASL A					;$B38F9B   |
	ASL A					;$B38F9C   |
	ASL A					;$B38F9D   |
	CMP #$0800				;$B38F9E   |
	BMI CODE_B38FA6				;$B38FA1   |
	LDA #$0800				;$B38FA3   |
CODE_B38FA6:					;	   |
	STA $2A,x				;$B38FA6   |
	RTS					;$B38FA8  /

CODE_B38FA9:
	EOR #$FFFF				;$B38FA9  \
	INC A					;$B38FAC   |
	ASL A					;$B38FAD   |
	ASL A					;$B38FAE   |
	ASL A					;$B38FAF   |
	ASL A					;$B38FB0   |
	EOR #$FFFF				;$B38FB1   |
	INC A					;$B38FB4   |
	CMP #$F800				;$B38FB5   |
	BPL CODE_B38FBD				;$B38FB8   |
	LDA #$F800				;$B38FBA   |
CODE_B38FBD:					;	   |
	STA $2A,x				;$B38FBD   |
	RTS					;$B38FBF  /

animal_icon_main:
	LDX current_sprite			;$B38FC0  \
	LDA $2E,x				;$B38FC2   |
	ASL A					;$B38FC4   |
	TAX					;$B38FC5   |
	JMP (DATA_B38FC9,x)			;$B38FC6  /

DATA_B38FC9:
	dw CODE_B38FD5
	dw CODE_B38FE8
	dw CODE_B3903C
	dw CODE_B3905B
	dw CODE_B39090
	dw CODE_B3909E


CODE_B38FD5:
	LDX current_sprite			;$B38FD5  \
	LDA #$0004				;$B38FD7   |
	STA $2E,x				;$B38FDA   |
	LDA $6E					;$B38FDC   |
	STA $46,x				;$B38FDE   |
	LDA #$0004				;$B38FE0   |
	STA $48,x				;$B38FE3   |
	JML [$05A9]				;$B38FE5  /

CODE_B38FE8:
	LDX current_sprite			;$B38FE8  \
	LDA $04,x				;$B38FEA   |
	STA $32					;$B38FEC   |
	LDA $06,x				;$B38FEE   |
	STA $34					;$B38FF0   |
	LDA #$8000				;$B38FF2   |
	STA $36					;$B38FF5   |
	LDA $42,x				;$B38FF7   |
	STA $38					;$B38FF9   |
	JSR CODE_B390B4				;$B38FFB   |
	STA $5E					;$B38FFE   |
	LDA $32					;$B39000   |
	STA $04,x				;$B39002   |
	LDA $34					;$B39004   |
	STA $06,x				;$B39006   |
	LDA $08,x				;$B39008   |
	STA $32					;$B3900A   |
	LDA $0A,x				;$B3900C   |
	STA $34					;$B3900E   |
	LDA #$8000				;$B39010   |
	STA $36					;$B39013   |
	LDA $44,x				;$B39015   |
	STA $38					;$B39017   |
	JSR CODE_B390B4				;$B39019   |
	STA $60					;$B3901C   |
	LDA $32					;$B3901E   |
	STA $08,x				;$B39020   |
	LDA $34					;$B39022   |
	STA $0A,x				;$B39024   |
	LDA $5E					;$B39026   |
	ORA $60					;$B39028   |
	BEQ CODE_B3902F				;$B3902A   |
	JML [$05A9]				;$B3902C  /

CODE_B3902F:
	LDA $42,x				;$B3902F  \
	STA $06,x				;$B39031   |
	LDA $44,x				;$B39033   |
	STA $0A,x				;$B39035   |
	INC $2E,x				;$B39037   |
	JML [$05A9]				;$B39039  /

CODE_B3903C:
	LDA $08C2				;$B3903C  \
	AND #$4000				;$B3903F   |
	BEQ CODE_B3904F				;$B39042   |
	LDX current_sprite			;$B39044   |
	LDA $46,x				;$B39046   |
	CMP $6E					;$B39048   |
	BNE CODE_B39089				;$B3904A   |
	JML [$05A9]				;$B3904C  /

CODE_B3904F:
	LDX current_sprite			;$B3904F  \
	INC $2E,x				;$B39051   |
	LDA #$0040				;$B39053   |
	STA $42,x				;$B39056   |
	JML [$05A9]				;$B39058  /

CODE_B3905B:
	LDX current_sprite			;$B3905B  \
	DEC $42,x				;$B3905D   |
	BMI CODE_B39089				;$B3905F   |
	LDA $42,x				;$B39061   |
	CMP #$000A				;$B39063   |
	BMI CODE_B3907F				;$B39066   |
	CMP #$0020				;$B39068   |
	BMI CODE_B39076				;$B3906B   |
	LDA global_frame_counter		;$B3906D   |
	AND #$0003				;$B3906F   |
	BEQ CODE_B3907F				;$B39072   |
	BRA CODE_B39086				;$B39074  /

CODE_B39076:
	LDA global_frame_counter		;$B39076  \
	AND #$0001				;$B39078   |
	BEQ CODE_B3907F				;$B3907B   |
	BRA CODE_B39086				;$B3907D  /

CODE_B3907F:
	LDA $1C,x				;$B3907F  \
	EOR #$4000				;$B39081   |
	STA $1C,x				;$B39084   |
CODE_B39086:					;	   |
	JML [$05A9]				;$B39086  /

CODE_B39089:
	JSL CODE_BB82B8				;$B39089  \
	JML [$05A9]				;$B3908D  /

CODE_B39090:
	LDX current_sprite			;$B39090  \
	DEC $48,x				;$B39092   |
	BPL CODE_B3909B				;$B39094   |
	LDA #$0001				;$B39096   |
	STA $2E,x				;$B39099   |
CODE_B3909B:					;	   |
	JML [$05A9]				;$B3909B  /

CODE_B3909E:
	LDX current_sprite			;$B3909E  \
	LDA $42,x				;$B390A0   |
	STA $06,x				;$B390A2   |
	LDA $44,x				;$B390A4   |
	STA $0A,x				;$B390A6   |
	LDA $6E					;$B390A8   |
	STA $46,x				;$B390AA   |
	LDA #$0002				;$B390AC   |
	STA $2E,x				;$B390AF   |
	JML [$05A9]				;$B390B1  /

CODE_B390B4:
	LDA $36					;$B390B4  \
	SEC					;$B390B6   |
	SBC $32					;$B390B7   |
	STA $3A					;$B390B9   |
	LDA $38					;$B390BB   |
	SBC $34					;$B390BD   |
	STA $3C					;$B390BF   |
	JSR CODE_B390D7				;$B390C1   |
	LDA $3A					;$B390C4   |
	CLC					;$B390C6   |
	ADC $32					;$B390C7   |
	STA $32					;$B390C9   |
	LDA $3C					;$B390CB   |
	ADC $34					;$B390CD   |
	STA $34					;$B390CF   |
	LDA $3F					;$B390D1   |
	AND #$FFF0				;$B390D3   |
	RTS					;$B390D6  /

CODE_B390D7:
	LDA $3C					;$B390D7  \
	BPL CODE_B390E5				;$B390D9   |
	JSR CODE_B390FE				;$B390DB   |
	JSR CODE_B390E5				;$B390DE   |
	JSR CODE_B390FE				;$B390E1   |
	RTS					;$B390E4  /

CODE_B390E5:
	LSR $3C					;$B390E5  \
	ROR $3A					;$B390E7   |
	LSR $3C					;$B390E9   |
	ROR $3A					;$B390EB   |
	LSR $3C					;$B390ED   |
	ROR $3A					;$B390EF   |
	LSR $3C					;$B390F1   |
	ROR $3A					;$B390F3   |
	LDA $3A					;$B390F5   |
	STA $3E					;$B390F7   |
	LDA $3C					;$B390F9   |
	STA $40					;$B390FB   |
	RTS					;$B390FD  /

CODE_B390FE:
	LDA $3C					;$B390FE  \
	EOR #$FFFF				;$B39100   |
	STA $3C					;$B39103   |
	LDA $3A					;$B39105   |
	EOR #$FFFF				;$B39107   |
	CLC					;$B3910A   |
	ADC #$0001				;$B3910B   |
	STA $3A					;$B3910E   |
	LDA #$0000				;$B39110   |
	ADC $3C					;$B39113   |
	STA $3C					;$B39115   |
	RTS					;$B39117  /

CODE_B39118:
	LDA $6E					;$B39118  \
	BEQ CODE_B39163				;$B3911A   |
	SEC					;$B3911C   |
	SBC #$0190				;$B3911D   |
	LSR A					;$B39120   |
	TAX					;$B39121   |
	LDA.l DATA_FF0D00,x			;$B39122   |
	TAY					;$B39126   |
	JSL CODE_BB8432				;$B39127   |
	BCS CODE_B39163				;$B3912B   |
	LDX current_sprite			;$B3912D   |
	LDY alternate_sprite			;$B3912F   |
	LDA $08A8				;$B39131   |
	CMP #$0062				;$B39134   |
	BNE CODE_B3913F				;$B39137   |
	LDA #$00B6				;$B39139   |
	STA $0044,y				;$B3913C   |
CODE_B3913F:					;	   |
	LDA $06,x				;$B3913F   |
	SEC					;$B39141   |
	SBC $17BA				;$B39142   |
	STA $0006,y				;$B39145   |
	LDA $0A,x				;$B39148   |
	SEC					;$B3914A   |
	SBC $17C0				;$B3914B   |
	STA $000A,y				;$B3914E   |
	LDA #$8000				;$B39151   |
	STA $0004,y				;$B39154   |
	STA $0008,y				;$B39157   |
	LDA $6E					;$B3915A   |
	CLC					;$B3915C   |
	ADC #$1908				;$B3915D   |
	STA $001A,y				;$B39160   |
CODE_B39163:					;	   |
	RTL					;$B39163  /

unknown_sprite_0114_main:
	LDX $0593				;$B39164  \
	LDA $12,x				;$B39167   |
	EOR $0012,y				;$B39169   |
	AND #$4000				;$B3916C   |
	EOR $0012,y				;$B3916F   |
	STA $0012,y				;$B39172   |
	LDA $0044,y				;$B39175   |
	BIT $12,x				;$B39178   |
	BVC CODE_B39180				;$B3917A   |
	EOR #$FFFF				;$B3917C   |
	INC A					;$B3917F   |
CODE_B39180:					;	   |
	CLC					;$B39180   |
	ADC $06,x				;$B39181   |
	STA $0006,y				;$B39183   |
	LDA $0046,y				;$B39186   |
	CLC					;$B39189   |
	ADC $0A,x				;$B3918A   |
	STA $000A,y				;$B3918C   |
	JSL CODE_B9D100				;$B3918F   |
	JML [$05A9]				;$B39193  /

	JSL CODE_BB82B8				;$B39196   |
	JML [$05A9]				;$B3919A  /

canball_pieces1_main:
canball_pieces2_main:
egg_shell_pieces_main:
	LDX current_sprite			;$B3919D  \
	LDA $54,x				;$B3919F   |
	STA $8E					;$B391A1   |
	JSR CODE_B39EEE				;$B391A3   |
	JSR CODE_B39EF8				;$B391A6   |
	JSL CODE_B8CF7F				;$B391A9   |
	JSL CODE_B9D100				;$B391AD   |
	LDX current_sprite			;$B391B1   |
	LDA $24,x				;$B391B3   |
	BPL CODE_B391BA				;$B391B5   |
CODE_B391B7:					;	   |
	JML [$05A9]				;$B391B7  /

CODE_B391BA:
	LDA $0A,x				;$B391BA  \
	SEC					;$B391BC   |
	SBC $17C2				;$B391BD   |
	BMI CODE_B391B7				;$B391C0   |
	CMP #$00E0				;$B391C2   |
	BMI CODE_B391B7				;$B391C5   |
	JSL CODE_BB82B8				;$B391C7   |
	JML [$05A9]				;$B391CB  /

fireworks_main:
	LDX current_sprite			;$B391CE  \
	LDA $24,x				;$B391D0   |
	BPL CODE_B391DA				;$B391D2   |
	LDA $0A,x				;$B391D4   |
	CMP $44,x				;$B391D6   |
	BPL CODE_B391E2				;$B391D8   |
CODE_B391DA:					;	   |
	LDA $24,x				;$B391DA   |
	CLC					;$B391DC   |
	ADC #$000C				;$B391DD   |
	BRA CODE_B391E8				;$B391E0  /

CODE_B391E2:
	LDA $24,x				;$B391E2  \
	SEC					;$B391E4   |
	SBC #$000C				;$B391E5   |
CODE_B391E8:					;	   |
	STA $24,x				;$B391E8   |
	JSL CODE_B8CF7F				;$B391EA   |
	JSL CODE_B9D100				;$B391EE   |
	JML [$05A9]				;$B391F2  /

explosion_cloud_main:
unknown_sprite_023C_main:
unknown_sprite_0248_main:
	JSL CODE_B8CF7F				;$B391F5  \
	JSL CODE_B9D100				;$B391F9   |
	JML [$05A9]				;$B391FD  /

explosion_main:
unknown_sprite_00B8_main:
	JSL CODE_B8CF7F				;$B39200  \
	PHK					;$B39204   |
	PLB					;$B39205   |
	LDX current_sprite			;$B39206   |
	DEC $48,x				;$B39208   |
	BPL CODE_B39213				;$B3920A   |
	LDA $46,x				;$B3920C   |
	BEQ CODE_B39213				;$B3920E   |
	JSR CODE_B392A9				;$B39210   |
CODE_B39213:					;	   |
	LDX current_sprite			;$B39213   |
	DEC $42,x				;$B39215   |
	BMI CODE_B39223				;$B39217   |
CODE_B39219:					;	   |
	JML [$05A9]				;$B39219  /

CODE_B3921C:
	JSL CODE_BB82D2				;$B3921C  \
	JML [$05A9]				;$B39220  /

CODE_B39223:
	DEC $46,x				;$B39223  \
	BMI CODE_B3921C				;$B39225   |
	LDA $4A,x				;$B39227   |
	STA $42,x				;$B39229   |
	LDY $2E,x				;$B3922B   |
	JSL CODE_BB8432				;$B3922D   |
	BCS CODE_B39219				;$B39231   |
	PHK					;$B39233   |
	PLB					;$B39234   |
	LDX current_sprite			;$B39235   |
	LDA $44,x				;$B39237   |
	INC A					;$B39239   |
	AND #$0007				;$B3923A   |
	STA $44,x				;$B3923D   |
	ASL A					;$B3923F   |
	ASL A					;$B39240   |
	TAY					;$B39241   |
	LDA DATA_B39289,y			;$B39242   |
	LDX alternate_sprite			;$B39245   |
	CLC					;$B39247   |
	ADC $06,x				;$B39248   |
	STA $06,x				;$B3924A   |
	LDA DATA_B39289,y			;$B3924C   |
	LSR A					;$B3924F   |
	EOR $12,x				;$B39250   |
	AND #$4000				;$B39252   |
	EOR $12,x				;$B39255   |
	STA $12,x				;$B39257   |
	LDA DATA_B3928B,y			;$B39259   |
	CLC					;$B3925C   |
	ADC $0A,x				;$B3925D   |
	STA $0A,x				;$B3925F   |
	LDA DATA_B3928B,y			;$B39261   |
	EOR $12,x				;$B39264   |
	AND #$8000				;$B39266   |
	EOR $12,x				;$B39269   |
	STA $12,x				;$B3926B   |
	LDY current_sprite			;$B3926D   |
	LDA $0046,y				;$B3926F   |
	LSR A					;$B39272   |
	BCC CODE_B3927D				;$B39273   |
	LDA $24,x				;$B39275   |
	CMP #$8000				;$B39277   |
	ROR A					;$B3927A   |
	STA $24,x				;$B3927B   |
CODE_B3927D:					;	   |
	LDA $0020,y				;$B3927D   |
	CMP #$8000				;$B39280   |
	ROR A					;$B39283   |
	STA $20,x				;$B39284   |
	JML [$05A9]				;$B39286  /

DATA_B39289:
	db $00, $00

DATA_B3928B:
	db $04, $00, $00, $00, $FC, $FF, $F8, $FF
	db $04, $00, $08, $00, $F4, $FF, $08, $00
	db $04, $00, $F8, $FF, $F4, $FF, $08, $00
	db $FC, $FF, $F8, $FF, $FC, $FF

CODE_B392A9:
	RTS					;$B392A9  /

sun_main:
	LDX current_sprite			;$B392AA  \
	LDA $0911				;$B392AC   |
	LSR A					;$B392AF   |
	LSR A					;$B392B0   |
	LSR A					;$B392B1   |
	LSR A					;$B392B2   |
	LSR A					;$B392B3   |
	LSR A					;$B392B4   |
	LSR A					;$B392B5   |
	STA $32					;$B392B6   |
	LSR A					;$B392B8   |
	LSR A					;$B392B9   |
	CLC					;$B392BA   |
	ADC $32					;$B392BB   |
	CLC					;$B392BD   |
	ADC #$0010				;$B392BE   |
	STA $0A,x				;$B392C1   |
	LDA global_frame_counter		;$B392C3   |
	AND #$0001				;$B392C5   |
	STA $32					;$B392C8   |
	LDA $0911				;$B392CA   |
	XBA					;$B392CD   |
	AND #$00FF				;$B392CE   |
	LSR A					;$B392D1   |
	CLC					;$B392D2   |
	ADC #$0070				;$B392D3   |
	CLC					;$B392D6   |
	ADC $32					;$B392D7   |
	STA $06,x				;$B392D9   |
	JML [$05A9]				;$B392DB  /

unknown_sprite_000C_main:
	JSL CODE_B9D100				;$B392DE  \
	JML [$05A9]				;$B392E2  /

squawks_egg_main:
	LDX current_sprite			;$B392E5  \
	LDA $54,x				;$B392E7   |
	STA $8E					;$B392E9   |
	LDA $2E,x				;$B392EB   |
	CMP #$0002				;$B392ED   |
	BPL CODE_B392FB				;$B392F0   |
	ASL A					;$B392F2   |
	TAX					;$B392F3   |
	JMP (DATA_B392F7,x)			;$B392F4  /

DATA_B392F7:
	dw CODE_B39314
	dw CODE_B3935F

CODE_B392FB:
	NOP					;$B392FB  \
	NOP					;$B392FC   |
	NOP					;$B392FD   |
	NOP					;$B392FE  /

	JML [$05A9]				;$B392FF  /

CODE_B39302:
	JSR CODE_B39EEE				;$B39302  \
CODE_B39305:					;	   |
	JSR CODE_B39EF8				;$B39305   |
	JSL CODE_B8CF7F				;$B39308   |
	JSL CODE_B9D100				;$B3930C   |
	JML CODE_B38000				;$B39310  /

CODE_B39314:
	LDA level_number			;$B39314  \
	CMP #$0060				;$B39316   |
	BNE CODE_B39324				;$B39319   |
	LDX current_sprite			;$B3931B   |
	LDA $30,x				;$B3931D   |
	ORA #$0200				;$B3931F   |
	STA $30,x				;$B39322   |
CODE_B39324:					;	   |
	JSL CODE_BCFB58				;$B39324   |
	LDA #$0020				;$B39328   |
	LDY #$0008				;$B3932B   |
	JSL CODE_BEBD8E				;$B3932E   |
	BCS CODE_B39336				;$B39332   |
	BRA CODE_B39302				;$B39334  /

CODE_B39336:
	LDA level_number			;$B39336  \
	CMP #$0060				;$B39338   |
	BNE CODE_B39344				;$B3933B   |
	LDA #$067D				;$B3933D   |
	JSL queue_sound_effect			;$B39340   |
CODE_B39344:					;	   |
	LDX current_sprite			;$B39344   |
	INC $2E,x				;$B39346   |
	LDA #$FC00				;$B39348   |
	STA $24,x				;$B3934B   |
	LDA $DB					;$B3934D   |
	CMP $E3					;$B3934F   |
	BMI CODE_B3935B				;$B39351   |
	LDA $20,x				;$B39353   |
	EOR #$FFFF				;$B39355   |
	INC A					;$B39358   |
	STA $20,x				;$B39359   |
CODE_B3935B:					;	   |
	STZ $26,x				;$B3935B   |
	BRA CODE_B39302				;$B3935D  /

CODE_B3935F:
	LDA #$0005				;$B3935F  \
	JSL CODE_B8D010				;$B39362   |
	BRA CODE_B39305				;$B39366  /

npc_hud_coin_main:
	JSL CODE_B9D100				;$B39368  \
	JML [$05A9]				;$B3936C  /

unknown_sprite_0104_main:
	JSL CODE_B9D100				;$B3936F  \
	JML [$05A9]				;$B39373  /

dkbarrel_main:
	LDX current_sprite			;$B39376  \
	LDA $54,x				;$B39378   |
	STA $8E					;$B3937A   |
	LDA $2E,x				;$B3937C   |
	ASL A					;$B3937E   |
	TAX					;$B3937F   |
	JMP (DATA_B39383,x)			;$B39380  /

DATA_B39383:
	dw CODE_B39396
	dw CODE_B393D9
	dw CODE_B393ED
	dw CODE_B39401
	dw CODE_B3944D
	dw CODE_B39471
	dw CODE_B39473
	dw CODE_B3948B

CODE_B39393:
	JML [$05A9]				;$B39393  \
CODE_B39396:					;	   |
	LDA $060B				;$B39396   |
	AND #$0001				;$B39399   |
	BEQ CODE_B393A1				;$B3939C   |
	BRL CODE_B39484				;$B3939E  /

CODE_B393A1:
	LDA level_number			;$B393A1  \
	CMP #$0062				;$B393A3   |
	BNE CODE_B393B1				;$B393A6   |
	LDX current_sprite			;$B393A8   |
	LDA $10,x				;$B393AA   |
	AND #$0100				;$B393AC   |
	BNE CODE_B393C7				;$B393AF   |
CODE_B393B1:					;	   |
	JSR CODE_B39F10				;$B393B1   |
	BCS CODE_B39393				;$B393B4   |
	JSR CODE_B39ECC				;$B393B6   |
	JSR CODE_B39EBE				;$B393B9   |
	JSL CODE_B8D5E0				;$B393BC   |
	JSL CODE_B9D100				;$B393C0   |
	JMP CODE_B38000				;$B393C4  /

CODE_B393C7:
	LDA #$051A				;$B393C7  \
	JSL queue_sound_effect			;$B393CA   |
	JSL CODE_B3975C				;$B393CE   |
	JSL CODE_BB82B8				;$B393D2   |
	JML [$05A9]				;$B393D6  /

CODE_B393D9:
	JSR CODE_B39F56				;$B393D9  \
	BCS CODE_B39393				;$B393DC   |
	JSR CODE_B3A007				;$B393DE   |
	JSL CODE_B9D100				;$B393E1   |
	JSR CODE_B39E8D				;$B393E5   |
	BCS CODE_B39434				;$B393E8   |
	JML [$05A9]				;$B393EA  /

CODE_B393ED:
	JSR CODE_B39F56				;$B393ED  \
	BCS CODE_B39393				;$B393F0   |
	JSR CODE_B3A007				;$B393F2   |
	JSL CODE_B9D100				;$B393F5   |
	JSR CODE_B39E9C				;$B393F9   |
	BCS CODE_B39434				;$B393FC   |
	JML [$05A9]				;$B393FE  /

CODE_B39401:
	JSR CODE_B39ECC				;$B39401  \
	JSR CODE_B39EBE				;$B39404   |
	JSL CODE_B8D5E0				;$B39407   |
	LDX current_sprite			;$B3940B   |
	LDA $1E,x				;$B3940D   |
	AND #$0101				;$B3940F   |
	CMP #$0101				;$B39412   |
	BEQ CODE_B39437				;$B39415   |
	JSL CODE_BCFB58				;$B39417   |
	LDA #$0020				;$B3941B   |
	LDY #$0008				;$B3941E   |
	JSL CODE_BEBD8E				;$B39421   |
	BCS CODE_B39437				;$B39425   |
	JSL CODE_B9D100				;$B39427   |
	JSL CODE_BBBB69				;$B3942B   |
	BCS CODE_B39437				;$B3942F   |
	JML [$05A9]				;$B39431  /

CODE_B39434:
	STZ $0D7A				;$B39434  \
CODE_B39437:					;	   |
	LDA #$051A				;$B39437   |
	JSL queue_sound_effect			;$B3943A   |
	JSL CODE_B3975C				;$B3943E   |
	JSL CODE_B8A98A				;$B39442   |
	JSL CODE_BB82B8				;$B39446   |
	JML [$05A9]				;$B3944A  /

CODE_B3944D:
	LDA $060B				;$B3944D  \
	AND #$0001				;$B39450   |
	BNE CODE_B39484				;$B39453   |
	LDA $08C2				;$B39455   |
	AND #$4000				;$B39458   |
	BNE CODE_B3946A				;$B3945B   |
	JSL CODE_BCFB58				;$B3945D   |
	LDA #$0010				;$B39461   |
	JSL CODE_BCFCB5				;$B39464   |
	BCS CODE_B39437				;$B39468   |
CODE_B3946A:					;	   |
	JSL CODE_B9D100				;$B3946A   |
	JMP CODE_B38000				;$B3946E  /

CODE_B39471:
	BRA CODE_B39437				;$B39471  /

CODE_B39473:
	LDA $08C2				;$B39473  \
	BIT #$4000				;$B39476   |
	BNE CODE_B39484				;$B39479   |
	LDX current_sprite			;$B3947B   |
	LDA #$0004				;$B3947D   |
	STA $2E,x				;$B39480   |
	BRA CODE_B3944D				;$B39482  /

CODE_B39484:
	JSL CODE_BB82B8				;$B39484  \
	JML [$05A9]				;$B39488  /

CODE_B3948B:
	JSR CODE_B39ECC				;$B3948B  \
	JSR CODE_B39EBE				;$B3948E   |
	JSL CODE_B8CF7F				;$B39491   |
	JSL CODE_B9D100				;$B39495   |
	JSL CODE_BBBB8D				;$B39499   |
	JML [$05A9]				;$B3949D  /

dkbarrel_letters_main:
	LDX current_sprite			;$B394A0  \
	LDA $42,x				;$B394A2   |
	TAY					;$B394A4   |
	LDA $0000,y				;$B394A5   |
	CMP #$01A8				;$B394A8   |
	BNE CODE_B394C3				;$B394AB   |
	LDA $0048,y				;$B394AD   |
	BMI CODE_B394C3				;$B394B0   |
	LDA $0006,y				;$B394B2   |
	STA $06,x				;$B394B5   |
	LDA $000A,y				;$B394B7   |
	STA $0A,x				;$B394BA   |
	JSL CODE_B9D100				;$B394BC   |
	JMP CODE_B38000				;$B394C0  /

CODE_B394C3:
	JSL CODE_BB82B8				;$B394C3  \
	JML [$05A9]				;$B394C7  /

tntbarrel_main:
	LDX current_sprite			;$B394CA  \
	LDA $54,x				;$B394CC   |
	STA $8E					;$B394CE   |
	LDA $2E,x				;$B394D0   |
	ASL A					;$B394D2   |
	TAX					;$B394D3   |
	JMP (DATA_B394D7,x)			;$B394D4  /

DATA_B394D7:
	dw CODE_B394E6
	dw CODE_B39505
	dw CODE_B39519
	dw CODE_B3951B
	dw CODE_B3957E
	dw CODE_B3957E


CODE_B394E3:
	JML [$05A9]				;$B394E3  \
CODE_B394E6:					;	   |
	JSR CODE_B39F10				;$B394E6   |
	BCS CODE_B394E3				;$B394E9   |
	JSR CODE_B39ECC				;$B394EB   |
	JSR CODE_B39EBE				;$B394EE   |
	JSL CODE_B8D5E0				;$B394F1   |
	JSL CODE_B9D100				;$B394F5   |
	LDX current_sprite			;$B394F9   |
	LDA $4A,x				;$B394FB   |
	CMP #$3EAC				;$B394FD   |
	BEQ CODE_B394E3				;$B39500   |
	JMP CODE_B38000				;$B39502  /

CODE_B39505:
	JSR CODE_B39F56				;$B39505  \
	BCS CODE_B394E3				;$B39508   |
	JSR CODE_B3A007				;$B3950A   |
	JSL CODE_B9D100				;$B3950D   |
	JSR CODE_B39EAB				;$B39511   |
	BCS CODE_B3953A				;$B39514   |
	JML [$05A9]				;$B39516  /

CODE_B39519:
	BRA CODE_B39505				;$B39519  /

CODE_B3951B:
	JSR CODE_B39ECC				;$B3951B  \
	JSR CODE_B39EBE				;$B3951E   |
	JSL CODE_B8D5E0				;$B39521   |
	LDX current_sprite			;$B39525   |
	LDA $1E,x				;$B39527   |
	AND #$0003				;$B39529   |
	BNE CODE_B3953D				;$B3952C   |
	JSR CODE_B39EAB				;$B3952E   |
	BCS CODE_B3953D				;$B39531   |
	JSL CODE_B9D100				;$B39533   |
	JMP CODE_B38000				;$B39537  /

CODE_B3953A:
	STZ $0D7A				;$B3953A  \
CODE_B3953D:					;	   |
	LDA #$0414				;$B3953D   |
	JSL queue_sound_effect			;$B39540   |
	LDA #$0615				;$B39544   |
	JSL queue_sound_effect			;$B39547   |
	LDX current_sprite			;$B3954B   |
	LDA $4A,x				;$B3954D   |
	CMP #$3EAC				;$B3954F   |
	BEQ CODE_B39569				;$B39552   |
	LDY #$00D4				;$B39554   |
	JSL CODE_BB83EF				;$B39557   |
	LDY #$00D2				;$B3955B   |
	JSL CODE_BB83EF				;$B3955E   |
	JSL CODE_BB82B8				;$B39562   |
	JML [$05A9]				;$B39566  /

CODE_B39569:
	LDY #$00D8				;$B39569  \
	JSL CODE_BB83EF				;$B3956C   |
	LDY #$00D6				;$B39570   |
	JSL CODE_BB83EF				;$B39573   |
	JSL CODE_BB82B8				;$B39577   |
	JML [$05A9]				;$B3957B  /

CODE_B3957E:
	BRA CODE_B3953D				;$B3957E  /

wooden_box_main:
	LDX current_sprite			;$B39580  \
	LDA $54,x				;$B39582   |
	STA $8E					;$B39584   |
	LDA $2E,x				;$B39586   |
	ASL A					;$B39588   |
	TAX					;$B39589   |
	JMP (DATA_B3958D,x)			;$B3958A  /

DATA_B3958D:
	dw CODE_B39598
	dw CODE_B395AE
	dw CODE_B395C2
	dw CODE_B395C4

CODE_B39595:
	JML [$05A9]				;$B39595  /

CODE_B39598:
	JSR CODE_B39F10				;$B39598  \
	BCS CODE_B39595				;$B3959B   |
	JSR CODE_B39ECC				;$B3959D   |
	JSR CODE_B39EBE				;$B395A0   |
	JSL CODE_B8D5E0				;$B395A3   |
	JSL CODE_B9D100				;$B395A7   |
	JMP CODE_B38000				;$B395AB  /

CODE_B395AE:
	JSR CODE_B39F56				;$B395AE  \
	BCS CODE_B39595				;$B395B1   |
	JSR CODE_B3A007				;$B395B3   |
	JSL CODE_B9D100				;$B395B6   |
	JSR CODE_B39E9C				;$B395BA   |
	BCS CODE_B395E3				;$B395BD   |
	JML [$05A9]				;$B395BF  /

CODE_B395C2:
	BRA CODE_B395AE				;$B395C2  /

CODE_B395C4:
	JSR CODE_B39ECC				;$B395C4  \
	JSR CODE_B39EBE				;$B395C7   |
	JSL CODE_B8D5E0				;$B395CA   |
	LDX current_sprite			;$B395CE   |
	LDA $1E,x				;$B395D0   |
	AND #$0003				;$B395D2   |
	BNE CODE_B395E6				;$B395D5   |
	JSR CODE_B39E9C				;$B395D7   |
	BCS CODE_B395E6				;$B395DA   |
	JSL CODE_B9D100				;$B395DC   |
	JMP CODE_B38000				;$B395E0  /

CODE_B395E3:
	STZ $0D7A				;$B395E3  \
CODE_B395E6:					;	   |
	LDA #$051A				;$B395E6   |
	JSL queue_sound_effect			;$B395E9   |
	JSL CODE_B3975C				;$B395ED   |
	JSL CODE_BB82B8				;$B395F1   |
	JML [$05A9]				;$B395F5  /

krool_water_drips_main:
	LDX current_sprite			;$B395F8  \
	LDY $42,x				;$B395FA   |
	LDA $0000,y				;$B395FC   |
	CMP #$02D8				;$B395FF   |
	BNE CODE_B3960E				;$B39602   |
	LDA $004C,y				;$B39604   |
	CMP current_sprite			;$B39607   |
	BNE CODE_B3960E				;$B39609   |
	JML [$05A9]				;$B3960B  /

CODE_B3960E:
	JSL CODE_BB82B8				;$B3960E  \
	JML [$05A9]				;$B39612  /

ghost_rope_main:
horsetail_main:
	LDX current_sprite			;$B39615  \
	LDA $2E,x				;$B39617   |
	ASL A					;$B39619   |
	TAX					;$B3961A   |
	JMP (DATA_B3961E,x)			;$B3961B  /

DATA_B3961E:
	dw CODE_B3962C
	dw CODE_B3963D
	dw CODE_B3964E
	dw CODE_B3965F
	dw CODE_B39669
	dw CODE_B39689
	dw CODE_B396B2


CODE_B3962C:
	LDX current_sprite			;$B3962C  \
	LDA #$0002				;$B3962E   |
	STA $2E,x				;$B39631   |
	LDA #$02A6				;$B39633   |
	JSL CODE_B9D0C6				;$B39636   |
	JML [$05A9]				;$B3963A  /

CODE_B3963D:
	LDX current_sprite			;$B3963D  \
	LDA #$0003				;$B3963F   |
	STA $2E,x				;$B39642   |
	LDA #$02A7				;$B39644   |
	JSL CODE_B9D0C6				;$B39647   |
	JML [$05A9]				;$B3964B  /

CODE_B3964E:
	LDA current_sprite			;$B3964E  \
	CMP $0BA0				;$B39650   |
	BNE CODE_B39658				;$B39653   |
	STZ $0BA0				;$B39655   |
CODE_B39658:					;	   |
	JSL CODE_B9D100				;$B39658   |
	JMP CODE_B38000				;$B3965C  /

CODE_B3965F:
	JSR CODE_B396CE				;$B3965F  \
	JSL CODE_B9D100				;$B39662   |
	JMP CODE_B38000				;$B39666  /

CODE_B39669:
	LDX current_sprite			;$B39669  \
	INC $2E,x				;$B3966B   |
	LDY #$0084				;$B3966D   |
	JSL CODE_BB8412				;$B39670   |
	BCS CODE_B39686				;$B39674   |
	LDX current_sprite			;$B39676   |
	LDY alternate_sprite			;$B39678   |
	LDA $4A,x				;$B3967A   |
	STA $000A,y				;$B3967C   |
	TXA					;$B3967F   |
	STA $0042,y				;$B39680   |
	TYA					;$B39683   |
	STA $4C,x				;$B39684   |
CODE_B39686:					;	   |
	JMP CODE_B38000				;$B39686  /

CODE_B39689:
	LDX current_sprite			;$B39689  \
	LDA $44,x				;$B3968B   |
	BEQ CODE_B39693				;$B3968D   |
	DEC $44,x				;$B3968F   |
	BRA CODE_B396A1				;$B39691  /

CODE_B39693:
	LDA current_sprite			;$B39693  \
	CMP $0BA0				;$B39695   |
	BEQ CODE_B396A4				;$B39698   |
	JSR CODE_B396CE				;$B3969A   |
	JSL CODE_B9D100				;$B3969D   |
CODE_B396A1:					;	   |
	JMP CODE_B38000				;$B396A1  /

CODE_B396A4:
	LDX current_sprite			;$B396A4  \
	INC $2E,x				;$B396A6   |
	LDA #$02C5				;$B396A8   |
	JSL CODE_B9D0C6				;$B396AB   |
	JML [$05A9]				;$B396AF  /

CODE_B396B2:
	LDA current_sprite			;$B396B2  \
	CMP $0BA0				;$B396B4   |
	BNE CODE_B396BC				;$B396B7   |
	JML [$05A9]				;$B396B9  /

CODE_B396BC:
	TAX					;$B396BC  \
	DEC $2E,x				;$B396BD   |
	LDA #$000C				;$B396BF   |
	STA $44,x				;$B396C2   |
	LDA #$02C4				;$B396C4   |
	JSL CODE_B9D0C6				;$B396C7   |
	JML [$05A9]				;$B396CB  /

CODE_B396CE:
	LDX current_sprite			;$B396CE  \
	LDA $54,x				;$B396D0   |
	STA $5E					;$B396D2   |
	LDA $90					;$B396D4   |
	STA $60					;$B396D6   |
	LDY #$0000				;$B396D8   |
	LDA [$5E],y				;$B396DB   |
	STA $32					;$B396DD   |
	LDY #$0002				;$B396DF   |
	LDA [$5E],y				;$B396E2   |
	STA $34					;$B396E4   |
	LDY #$0004				;$B396E6   |
	LDA [$5E],y				;$B396E9   |
	STA $36					;$B396EB   |
	LDY #$0006				;$B396ED   |
	LDA [$5E],y				;$B396F0   |
	STA $38					;$B396F2   |
	TXY					;$B396F4   |
	LDX $0593				;$B396F5   |
	LDA #$0004				;$B396F8   |
	STA $5E					;$B396FB   |
	LDA $20,x				;$B396FD   |
	BPL CODE_B39705				;$B396FF   |
	EOR #$FFFF				;$B39701   |
	INC A					;$B39704   |
CODE_B39705:					;	   |
	CMP #$0040				;$B39705   |
	BPL CODE_B3970F				;$B39708   |
	LDA #$000C				;$B3970A   |
	STA $5E					;$B3970D   |
CODE_B3970F:					;	   |
	LDA $06,x				;$B3970F   |
	SEC					;$B39711   |
	SBC $0006,y				;$B39712   |
	BPL CODE_B3971B				;$B39715   |
	EOR #$FFFF				;$B39717   |
	INC A					;$B3971A   |
CODE_B3971B:					;	   |
	CMP $5E					;$B3971B   |
	BPL CODE_B39737				;$B3971D   |
	LDA $000A,y				;$B3971F   |
	CLC					;$B39722   |
	ADC $32					;$B39723   |
	CMP $0A,x				;$B39725   |
	BPL CODE_B39737				;$B39727   |
	LDA $000A,y				;$B39729   |
	CLC					;$B3972C   |
	ADC $34					;$B3972D   |
	CMP $0A,x				;$B3972F   |
	BMI CODE_B39737				;$B39731   |
	STY $0BA2				;$B39733   |
	RTS					;$B39736  /

CODE_B39737:
	RTS					;$B39737  /

	RTS					;$B39738  /

barrel_pieces_main:
unknown_sprite_0064_main:
unknown_sprite_0240_main:
unknown_sprite_0244_main:
	LDX current_sprite			;$B39739  \
	LDA #$0040				;$B3973B   |
	CLC					;$B3973E   |
	ADC $24,x				;$B3973F   |
	BMI CODE_B3974B				;$B39741   |
	CMP #$0800				;$B39743   |
	BMI CODE_B3974B				;$B39746   |
	LDA #$0800				;$B39748   |
CODE_B3974B:					;	   |
	STA $24,x				;$B3974B   |
	JSL CODE_B8CF7F				;$B3974D   |
	JSL CODE_B9D100				;$B39751   |
	JSL CODE_BBBB8D				;$B39755   |
	JML [$05A9]				;$B39759  /

CODE_B3975C:
	JSR CODE_B39764				;$B3975C  \
	RTL					;$B3975F  /

CODE_B39760:
	JSR CODE_B3976B				;$B39760  \
	RTL					;$B39763  /

CODE_B39764:
	LDY #$004A				;$B39764  \
	JSL CODE_BB842C				;$B39767   |
CODE_B3976B:					;	   |
	LDY #$0060				;$B3976B   |
	JSL CODE_BB8412				;$B3976E   |
	LDY #$0062				;$B39772   |
	JSL CODE_BB8412				;$B39775   |
CODE_B39779:					;	   |
	LDY #$0064				;$B39779   |
	JSL CODE_BB8412				;$B3977C   |
	LDY #$0066				;$B39780   |
	JSL CODE_BB8412				;$B39783   |
	RTS					;$B39787  /

animal_box_main:
	LDX current_sprite			;$B39788  \
	LDA $2E,x				;$B3978A   |
	ASL A					;$B3978C   |
	TAX					;$B3978D   |
	JMP (DATA_B39791,x)			;$B3978E  /

DATA_B39791:
	dw CODE_B397F9
	dw CODE_B39803
	dw CODE_B3980A
	dw CODE_B39815
	dw CODE_B39803


CODE_B3979B:
	LDX current_sprite			;$B3979B  \
	LDA $10,x				;$B3979D   |
	AND #$0100				;$B3979F   |
	BNE CODE_B397BB				;$B397A2   |
	LDA #$0118				;$B397A4   |
	JSR CODE_B3A364				;$B397A7   |
	BCS CODE_B397C0				;$B397AA   |
	JSL CODE_BCFB58				;$B397AC   |
	LDA #$15CC				;$B397B0   |
	JSL CODE_BEBE8B				;$B397B3   |
	BCS CODE_B397C0				;$B397B7   |
	CLC					;$B397B9   |
	RTS					;$B397BA  /

CODE_B397BB:
	LDA #$0004				;$B397BB  \
	BRA CODE_B397C3				;$B397BE  /

CODE_B397C0:
	LDA #$0001				;$B397C0  \
CODE_B397C3:					;	   |
	STA $2E,x				;$B397C3   |
	STZ $30,x				;$B397C5   |
	STZ $32,x				;$B397C7   |
	LDA $36,x				;$B397C9   |
	STA $42,x				;$B397CB   |
	LDA #$02B1				;$B397CD   |
	JSL CODE_B9D0C6				;$B397D0   |
	LDA #$0439				;$B397D4   |
	JSL queue_sound_effect			;$B397D7   |
	LDA #$053B				;$B397DB   |
	JSL queue_sound_effect			;$B397DE   |
	LDA #$063C				;$B397E2   |
	JSL queue_sound_effect			;$B397E5   |
	LDA #$073A				;$B397E9   |
	JSL queue_sound_effect			;$B397EC   |
	LDX current_sprite			;$B397F0   |
	LDA $5C,x				;$B397F2   |
	JSR CODE_B39845				;$B397F4   |
	CLC					;$B397F7   |
	RTS					;$B397F8  /

CODE_B397F9:
	JSR CODE_B3979B				;$B397F9  \
	JSL CODE_B8D5E0				;$B397FC   |
	JMP CODE_B38000				;$B39800  /

CODE_B39803:
	JSL CODE_B9D100				;$B39803  \
	JML [$05A9]				;$B39807  /

CODE_B3980A:
	JSL CODE_B9D100				;$B3980A  \
	JSL CODE_BBBB8D				;$B3980E   |
	JML [$05A9]				;$B39812  /

CODE_B39815:
	JSL CODE_BCFB58				;$B39815  \
	LDA #$0008				;$B39819   |
	PHK					;$B3981C   |
	%return(CODE_B39823)			;$B3981D   |
	JML [$09F9]				;$B39820  /

CODE_B39823:
	BCS CODE_B3982C				;$B39823  \
	JSL CODE_B8D5E0				;$B39825   |
	JMP CODE_B38000				;$B39829  /

CODE_B3982C:
	LDX current_sprite			;$B3982C  \
	STZ $30,x				;$B3982E   |
	STZ $32,x				;$B39830   |
	LDA #$0001				;$B39832   |
	STA $2E,x				;$B39835   |
	LDA $36,x				;$B39837   |
	STA $42,x				;$B39839   |
	LDA #$02B1				;$B3983B   |
	JSL CODE_B9D0C6				;$B3983E   |
	JML [$05A9]				;$B39842  /

CODE_B39845:
	BEQ CODE_B39854				;$B39845  \
	ASL A					;$B39847   |
	TAX					;$B39848   |
	LDA.l $7E9128,x				;$B39849   |
	ORA #$0080				;$B3984D   |
	STA $7E9128,x				;$B39850   |
CODE_B39854:					;	   |
	LDX current_sprite			;$B39854   |
	RTS					;$B39856  /

hook_main:
	LDX current_sprite			;$B39857  \
	LDA $2E,x				;$B39859   |
	ASL A					;$B3985B   |
	TAX					;$B3985C   |
	JMP (DATA_B39860,x)			;$B3985D  /

DATA_B39860:
	dw CODE_B39866
	dw CODE_B3986C
	dw CODE_B3989A

CODE_B39866:
	JSR CODE_B39986				;$B39866  \
	JMP CODE_B38000				;$B39869  /

CODE_B3986C:
	LDA $0D82				;$B3986C  \
	CMP current_sprite			;$B3986F   |
	BNE CODE_B39888				;$B39871   |
	LDX current_sprite			;$B39873   |
	LDA $4E,x				;$B39875   |
	BEQ CODE_B39885				;$B39877   |
	LDA #$C000				;$B39879   |
	ORA $0AB8				;$B3987C   |
	STA $0AB8				;$B3987F   |
	JSR CODE_B398AB				;$B39882   |
CODE_B39885:					;	   |
	JML [$05A9]				;$B39885  /

CODE_B39888:
	STZ $0AEE				;$B39888  \
	STZ $0AF2				;$B3988B   |
	LDX current_sprite			;$B3988E   |
	LDA #$001E				;$B39890   |
	STA $42,x				;$B39893   |
	INC $2E,x				;$B39895   |
	JML [$05A9]				;$B39897  /

CODE_B3989A:
	LDX current_sprite			;$B3989A  \
	DEC $42,x				;$B3989C   |
	BEQ CODE_B398A3				;$B3989E   |
CODE_B398A0:					;	   |
	JMP CODE_B38000				;$B398A0  /

CODE_B398A3:
	STZ $2E,x				;$B398A3  \
	BRA CODE_B398A0				;$B398A5  /

CODE_B398A7:
	JSR CODE_B398AB				;$B398A7  \
	RTL					;$B398AA  /

CODE_B398AB:
	LDA $0AF0				;$B398AB  \
	LSR A					;$B398AE   |
	STA $32					;$B398AF   |
	LDA $4E,x				;$B398B1   |
	AND #$FF00				;$B398B3   |
	CLC					;$B398B6   |
	ADC #$3C00				;$B398B7   |
	SEC					;$B398BA   |
	SBC $32					;$B398BB   |
	STA $0AF2				;$B398BD   |
	LDA $0AEA				;$B398C0   |
	LSR A					;$B398C3   |
	STA $32					;$B398C4   |
	LDA $4E,x				;$B398C6   |
	XBA					;$B398C8   |
	AND #$FF00				;$B398C9   |
	CLC					;$B398CC   |
	ADC #$4000				;$B398CD   |
	SEC					;$B398D0   |
	SBC $32					;$B398D1   |
	STA $0AEE				;$B398D3   |
	RTS					;$B398D6  /

CODE_B398D7:
	LDA $0A86				;$B398D7  \
	STA $0A3E				;$B398DA   |
	LDA $0A88				;$B398DD   |
	STA $0A40				;$B398E0   |
	LDY #$0034				;$B398E3   |
	JSL CODE_BB842C				;$B398E6   |
	LDX current_sprite			;$B398EA   |
	STX $0D82				;$B398EC   |
	LDA $12,x				;$B398EF   |
	AND #$BFFF				;$B398F1   |
	STA $12,x				;$B398F4   |
	JSL CODE_B3DF3C				;$B398F6   |
	JSL CODE_B880A2				;$B398FA   |
	LDA #$0071				;$B398FE   |
	STA $2E,x				;$B39901   |
	LDA #$00D8				;$B39903   |
	STA $02,x				;$B39906   |
	LDA $0A84				;$B39908   |
	STA $42,x				;$B3990B   |
	LDY $0D82				;$B3990D   |
	LDA $0006,y				;$B39910   |
	STA $06,x				;$B39913   |
	LDA $000A,y				;$B39915   |
	CLC					;$B39918   |
	ADC #$0017				;$B39919   |
	STA $0A,x				;$B3991C   |
	LDA #$0042				;$B3991E   |
	JSL CODE_B9D0B8				;$B39921   |
	JSL CODE_B8808E				;$B39925   |
	JSL CODE_B8A57C				;$B39929   |
	RTL					;$B3992D  /

CODE_B3992E:
	LDX current_sprite			;$B3992E  \
	STX $0D82				;$B39930   |
	LDA #$0001				;$B39933   |
	STA $2E,x				;$B39936   |
	JSL CODE_B3DF3C				;$B39938   |
	LDA $12,x				;$B3993C   |
	AND #$BFFF				;$B3993E   |
	STA $12,x				;$B39941   |
	JSL CODE_B8808E				;$B39943   |
	LDA #$003C				;$B39947   |
	STA $2E,x				;$B3994A   |
	LDY $0D82				;$B3994C   |
	LDA $0006,y				;$B3994F   |
	STA $06,x				;$B39952   |
	LDA $000A,y				;$B39954   |
	CLC					;$B39957   |
	ADC #$0017				;$B39958   |
	STA $0A,x				;$B3995B   |
	LDA #$0042				;$B3995D   |
	JSL CODE_B9D0B8				;$B39960   |
	LDX $0597				;$B39964   |
	LDA $2E,x				;$B39967   |
	CMP #$0071				;$B39969   |
	BEQ CODE_B3996F				;$B3996C   |
	RTL					;$B3996E  /

CODE_B3996F:
	LDA #$0022				;$B3996F  \
	STA $2E,x				;$B39972   |
	LDA #$001F				;$B39974   |
	LDX #$0042				;$B39977   |
	LDY #$0000				;$B3997A   |
	JSL CODE_B8D8D1				;$B3997D   |
	RTL					;$B39981  /

CODE_B39982:
	JSR CODE_B39986				;$B39982  \
	RTL					;$B39985  /

CODE_B39986:
	LDA $0D7A				;$B39986  \
	ORA $6E					;$B39989   |
	BNE CODE_B399EC				;$B3998B   |
	LDX $0597				;$B3998D   |
	LDA $2E,x				;$B39990   |
	CMP #$0071				;$B39992   |
	BNE CODE_B3999A				;$B39995   |
	BRL CODE_B39A1C				;$B39997  /

CODE_B3999A:
	JSL CODE_BCFB58				;$B3999A  \
	LDA #$0008				;$B3999E   |
	PHK					;$B399A1   |
	%return(CODE_B399A8)			;$B399A2   |
	JML [$09F9]				;$B399A5  /

CODE_B399A8:
	BCC CODE_B399EC				;$B399A8  \
	LDA $09F5				;$B399AA   |
	AND #$0406				;$B399AD   |
	BEQ CODE_B399EC				;$B399B0   |
	LDA $6A					;$B399B2   |
	CMP $0597				;$B399B4   |
	BEQ CODE_B399EE				;$B399B7   |
	JSR CODE_B39A5F				;$B399B9   |
	BNE CODE_B399EC				;$B399BC   |
	LDA #$000D				;$B399BE   |
	JSL CODE_B8D8BA				;$B399C1   |
	BCS CODE_B399EC				;$B399C5   |
	LDA #CODE_B3992E			;$B399C7   |
	STA $0A8A				;$B399CA   |
	LDA.w #CODE_B3992E>>16			;$B399CD   |
	STA $0A8C				;$B399D0   |
	JSL CODE_BCFEC8				;$B399D3   |
	JSL CODE_BCFEE0				;$B399D7   |
	JSR CODE_B3A338				;$B399DB   |
	LDA $0A3E				;$B399DE   |
	STA $0A86				;$B399E1   |
	LDA $0A40				;$B399E4   |
	STA $0A88				;$B399E7   |
	SEC					;$B399EA   |
	RTS					;$B399EB  /

CODE_B399EC:
	CLC					;$B399EC  \
	RTS					;$B399ED  /

CODE_B399EE:
	LDA #$000D				;$B399EE  \
	JSL CODE_B8D8BA				;$B399F1   |
	BCS CODE_B399EC				;$B399F5   |
	LDA #CODE_B398D7			;$B399F7   |
	STA $0A8A				;$B399FA   |
	LDA.w #CODE_B398D7>>16			;$B399FD   |
	STA $0A8C				;$B39A00   |
	JSL CODE_BCFEC8				;$B39A03   |
	JSL CODE_BCFEE0				;$B39A07   |
	JSR CODE_B3A338				;$B39A0B   |
	LDA $0A3E				;$B39A0E   |
	STA $0A86				;$B39A11   |
	LDA $0A40				;$B39A14   |
	STA $0A88				;$B39A17   |
	SEC					;$B39A1A   |
	RTS					;$B39A1B  /

CODE_B39A1C:
	JSL CODE_BCFB58				;$B39A1C  \
	LDA #$0008				;$B39A20   |
	JSL CODE_BCFCB5				;$B39A23   |
	BCC CODE_B399EC				;$B39A27   |
	LDA $09F5				;$B39A29   |
	AND #$0406				;$B39A2C   |
	BEQ CODE_B399EC				;$B39A2F   |
	LDA #$000D				;$B39A31   |
	JSL CODE_B8D8BA				;$B39A34   |
	BCS CODE_B399EC				;$B39A38   |
	LDA #CODE_B3992E			;$B39A3A   |
	STA $0A8A				;$B39A3D   |
	LDA.w #CODE_B3992E>>16			;$B39A40   |
	STA $0A8C				;$B39A43   |
	JSL CODE_BCFEC8				;$B39A46   |
	JSL CODE_BCFEE0				;$B39A4A   |
	JSR CODE_B3A338				;$B39A4E   |
	LDA $0A3E				;$B39A51   |
	STA $0A86				;$B39A54   |
	LDA $0A40				;$B39A57   |
	STA $0A88				;$B39A5A   |
	SEC					;$B39A5D   |
	RTS					;$B39A5E  /

CODE_B39A5F:
	LDX $0593				;$B39A5F  \
	LDA $2E,x				;$B39A62   |
	ASL A					;$B39A64   |
	ASL A					;$B39A65   |
	TAX					;$B39A66   |
	LDA.l DATA_B896B7,x			;$B39A67   |
	AND #$0080				;$B39A6B   |
	RTS					;$B39A6E  /

invincibility_barrel_main:
	JSL CODE_BCFB58				;$B39A6F  \
	LDA #$0010				;$B39A73   |
	PHK					;$B39A76   |
	%return(CODE_B39A7D)			;$B39A77   |
	JML [$09F9]				;$B39A7A  /

CODE_B39A7D:
	BCS CODE_B39A86				;$B39A7D  \
	JSL CODE_B9D100				;$B39A7F   |
	JMP CODE_B38000				;$B39A83  /

CODE_B39A86:
	LDA current_sprite			;$B39A86  \
	STA $19A8				;$B39A88   |
	PHA					;$B39A8B   |
	TAX					;$B39A8C   |
	JSL CODE_B8808E				;$B39A8D   |
	LDX $19A8				;$B39A91   |
	LDA $42,x				;$B39A94   |
	JSL CODE_B8D1FB				;$B39A96   |
	LDA $19CE				;$B39A9A   |
	BNE CODE_B39AAB				;$B39A9D   |
	LDY #$0000				;$B39A9F   |
	JSL CODE_BB83EF				;$B39AA2   |
	LDA alternate_sprite			;$B39AA6   |
	STA $19CE				;$B39AA8   |
CODE_B39AAB:					;	   |
	PLA					;$B39AAB   |
	STA current_sprite			;$B39AAC   |
	JSL CODE_BB82B8				;$B39AAE   |
	LDX current_sprite			;$B39AB2   |
	INC $00,x				;$B39AB4   |
	JSR CODE_B39764				;$B39AB6   |
	LDX current_sprite			;$B39AB9   |
	STZ $00,x				;$B39ABB   |
	JML [$05A9]				;$B39ABD  /

unknown_sprite_01C8_main:
	JMP CODE_B38000				;$B39AC0  /

canball_main:
	LDX current_sprite			;$B39AC3  \
	LDA $54,x				;$B39AC5   |
	STA $8E					;$B39AC7   |
	LDA $2E,x				;$B39AC9   |
	ASL A					;$B39ACB   |
	TAX					;$B39ACC   |
	JMP (DATA_B39AD0,x)			;$B39ACD  /

DATA_B39AD0:
	dw CODE_B39ADB
	dw CODE_B39AFC
	dw CODE_B39B0F
	dw CODE_B39B11

CODE_B39AD8:
	JML [$05A9]				;$B39AD8  /

CODE_B39ADB:
	JSR CODE_B39F10				;$B39ADB  \
	BCS CODE_B39AD8				;$B39ADE   |
	JSR CODE_B39ECC				;$B39AE0   |
	JSR CODE_B39EBE				;$B39AE3   |
	JSL CODE_B8D246				;$B39AE6   |
	JSL CODE_B8D5E0				;$B39AEA   |
	LDA #$001D				;$B39AEE   |
	JSL CODE_BEF03D				;$B39AF1   |
	JSL CODE_B9D100				;$B39AF5   |
	JMP CODE_B38000				;$B39AF9  /

CODE_B39AFC:
	JSR CODE_B39F56				;$B39AFC  \
	BCS CODE_B39AD8				;$B39AFF   |
	JSR CODE_B3A007				;$B39B01   |
	JSL CODE_B9D100				;$B39B04   |
	JSR CODE_B39BA5				;$B39B08   |
	BCS CODE_B39B5F				;$B39B0B   |
	BRA CODE_B39AD8				;$B39B0D  /

CODE_B39B0F:
	BRA CODE_B39AFC				;$B39B0F  /

CODE_B39B11:
	LDX current_sprite			;$B39B11  \
	STZ $26,x				;$B39B13   |
	JSR CODE_B39ECC				;$B39B15   |
	JSR CODE_B39EBE				;$B39B18   |
	JSL CODE_B8D5E0				;$B39B1B   |
	LDA #$001D				;$B39B1F   |
	JSL CODE_BEF03D				;$B39B22   |
	LDA $20,x				;$B39B26   |
	AND #$FFF0				;$B39B28   |
	BNE CODE_B39B37				;$B39B2B   |
	LDA $1E,x				;$B39B2D   |
	AND #$0101				;$B39B2F   |
	CMP #$0101				;$B39B32   |
	BEQ CODE_B39B43				;$B39B35   |
CODE_B39B37:					;	   |
	JSR CODE_B39BA5				;$B39B37   |
	BCS CODE_B39B66				;$B39B3A   |
	JSL CODE_B9D100				;$B39B3C   |
	JMP CODE_B38000				;$B39B40  /

CODE_B39B43:
	LDA #$064C				;$B39B43  \
	JSL queue_sound_effect			;$B39B46   |
	LDX current_sprite			;$B39B4A   |
	STZ $2E,x				;$B39B4C   |
	LDA #$0001				;$B39B4E   |
	ORA $30,x				;$B39B51   |
	STA $30,x				;$B39B53   |
	LDA #$02E0				;$B39B55   |
	JSL CODE_B9D03A				;$B39B58   |
	JMP CODE_B38000				;$B39B5C  /

CODE_B39B5F:
	STZ $0D7A				;$B39B5F  \
	JSL CODE_B8D4AE				;$B39B62   |
CODE_B39B66:					;	   |
	LDX $6A					;$B39B66   |
	LDA $00,x				;$B39B68   |
	CMP #$013C				;$B39B6A   |
	BEQ CODE_B39B9E				;$B39B6D   |
	LDA #$061A				;$B39B6F   |
	JSL queue_sound_effect			;$B39B72   |
	LDX current_sprite			;$B39B76   |
	LDA $20,x				;$B39B78   |
	CMP #$8000				;$B39B7A   |
	ROR A					;$B39B7D   |
	CMP #$8000				;$B39B7E   |
	ROR A					;$B39B81   |
	STA $20,x				;$B39B82   |
	STZ $26,x				;$B39B84   |
	STZ $2E,x				;$B39B86   |
	LDA #$FA00				;$B39B88   |
	STA $24,x				;$B39B8B   |
	LDA #$0001				;$B39B8D   |
	ORA $30,x				;$B39B90   |
	STA $30,x				;$B39B92   |
	LDA #$02E0				;$B39B94   |
	JSL CODE_B9D03A				;$B39B97   |
	JML [$05A9]				;$B39B9B  /

CODE_B39B9E:
	JSL CODE_BBBB44				;$B39B9E  \
	JML [$05A9]				;$B39BA2  /

CODE_B39BA5:
	JSL CODE_BCFB58				;$B39BA5  \
	LDA #$0420				;$B39BA9   |
	LDY #$0008				;$B39BAC   |
	JSL CODE_BEBD8E				;$B39BAF   |
	RTS					;$B39BB3  /

unknown_sprite_00CC_main:
unknown_sprite_02DC_main:
	LDX current_sprite			;$B39BB4  \
	LDA $54,x				;$B39BB6   |
	STA $8E					;$B39BB8   |
	LDA $2E,x				;$B39BBA   |
	ASL A					;$B39BBC   |
	TAX					;$B39BBD   |
	JMP (DATA_B39BC1,x)			;$B39BBE  /

DATA_B39BC1:
	dw CODE_B39C0A
	dw CODE_B39C0E
	dw CODE_B39C33
	dw CODE_B39C6C
	dw CODE_B39C79


CODE_B39BCB:
	LDX current_sprite			;$B39BCB  \
	LDA $42,x				;$B39BCD   |
	CMP #$001B				;$B39BCF   |
	BEQ CODE_B39BF0				;$B39BD2   |
	CMP #$0008				;$B39BD4   |
	BCC CODE_B39BEB				;$B39BD7   |
	CMP #$000C				;$B39BD9   |
	BCS CODE_B39BEB				;$B39BDC   |
	LDA $24,x				;$B39BDE   |
	SBC #$0100				;$B39BE0   |
	BMI CODE_B39BEB				;$B39BE3   |
	LDA $0A,x				;$B39BE5   |
	CMP $4E,x				;$B39BE7   |
	BCS CODE_B39C02				;$B39BE9   |
CODE_B39BEB:					;	   |
	JSL CODE_B8D5E0				;$B39BEB   |
	RTS					;$B39BEF  /

CODE_B39BF0:
	JSL CODE_B8CF7F				;$B39BF0  \
	LDX current_sprite			;$B39BF4   |
	LDY $0593				;$B39BF6   |
	LDA $0A,x				;$B39BF9   |
	SEC					;$B39BFB   |
	SBC $000A,y				;$B39BFC   |
	BPL CODE_B39C02				;$B39BFF   |
	RTS					;$B39C01  /

CODE_B39C02:
	LDA #$0101				;$B39C02  \
	STA $1E,x				;$B39C05   |
	STZ $24,x				;$B39C07   |
	RTS					;$B39C09  /

CODE_B39C0A:
	LDX current_sprite			;$B39C0A  \
	INC $2E,x				;$B39C0C   |
CODE_B39C0E:					;	   |
	JSR CODE_B39ECC				;$B39C0E   |
	JSR CODE_B39BCB				;$B39C11   |
	LDX current_sprite			;$B39C14   |
	LDA $1E,x				;$B39C16   |
	AND #$0101				;$B39C18   |
	CMP #$0101				;$B39C1B   |
	BEQ CODE_B39C2E				;$B39C1E   |
	LDA $42,x				;$B39C20   |
	CMP #$0010				;$B39C22   |
	BEQ CODE_B39C2B				;$B39C25   |
	JSL CODE_BBBB8D				;$B39C27   |
CODE_B39C2B:					;	   |
	JML [$05A9]				;$B39C2B  /

CODE_B39C2E:
	INC $2E,x				;$B39C2E  \
	JML [$05A9]				;$B39C30  /

CODE_B39C33:
	JSR CODE_B39C39				;$B39C33  \
	JML [$05A9]				;$B39C36  /

CODE_B39C39:
	LDX current_sprite			;$B39C39  \
	STX alternate_sprite			;$B39C3B   |
	LDA $12,x				;$B39C3D   |
	JSL CODE_BB8C02				;$B39C3F   |
	LDX current_sprite			;$B39C43   |
	LDA $42,x				;$B39C45   |
	PHA					;$B39C47   |
	ASL A					;$B39C48   |
	TAX					;$B39C49   |
	LDA.l DATA_FF1A8E,x			;$B39C4A   |
	TAY					;$B39C4E   |
	LDX current_sprite			;$B39C4F   |
	JSL CODE_BB845D				;$B39C51   |
	PLA					;$B39C55   |
	CMP #$0013				;$B39C56   |
	BNE CODE_B39C65				;$B39C59   |
	LDX alternate_sprite			;$B39C5B   |
	DEC $44,x				;$B39C5D   |
	BNE CODE_B39C65				;$B39C5F   |
	LDA $46,x				;$B39C61   |
	STA $42,x				;$B39C63   |
CODE_B39C65:					;	   |
	LDX alternate_sprite			;$B39C65   |
	STZ $2C,x				;$B39C67   |
	STZ $56,x				;$B39C69   |
	RTS					;$B39C6B  /

CODE_B39C6C:
	JSL CODE_BEF039				;$B39C6C  \
	BIT $24,x				;$B39C70   |
	BMI CODE_B39C97				;$B39C72   |
	INC $2E,x				;$B39C74   |
	JML [$05A9]				;$B39C76  /

CODE_B39C79:
	JSL CODE_B9D100				;$B39C79  \
	JSL CODE_BEF039				;$B39C7D   |
	LDA $52,x				;$B39C81   |
	JSL CODE_BCFB58				;$B39C83   |
	JSL CODE_BEBE6D				;$B39C87   |
	BCC CODE_B39C97				;$B39C8B   |
	JSR CODE_B39C39				;$B39C8D   |
	TXA					;$B39C90   |
	SEC					;$B39C91   |
	SBC #sizeof(sprite)			;$B39C92   |
	STA current_sprite			;$B39C95   |
CODE_B39C97:					;	   |
	JML [$05A9]				;$B39C97  /

chest_main:
	LDX current_sprite			;$B39C9A  \
	LDA $54,x				;$B39C9C   |
	STA $8E					;$B39C9E   |
	LDA $2E,x				;$B39CA0   |
	ASL A					;$B39CA2   |
	TAX					;$B39CA3   |
	JMP (DATA_B39CA7,x)			;$B39CA4  /

DATA_B39CA7:
	dw CODE_B39CB2
	dw CODE_B39CEA
	dw CODE_B39CFD
	dw CODE_B39CFF

CODE_B39CAF:
	JML [$05A9]				;$B39CAF  \
CODE_B39CB2:					;	   |
	JSR CODE_B39F10				;$B39CB2   |
	BCS CODE_B39CAF				;$B39CB5   |
	JSR CODE_B39ECC				;$B39CB7   |
	JSR CODE_B39EBE				;$B39CBA   |
	JSL CODE_B8D246				;$B39CBD   |
	JSL CODE_B8D5E0				;$B39CC1   |
	LDA #$001D				;$B39CC5   |
	JSL CODE_BEF03D				;$B39CC8   |
	JSL CODE_B9D100				;$B39CCC   |
CODE_B39CD0:					;	   |
	JMP CODE_B38000				;$B39CD0  /

	LDA $0515				;$B39CD3   |
	CMP #$0001				;$B39CD6   |
	BNE CODE_B39CE7				;$B39CD9   |
	LDX current_sprite			;$B39CDB   |
	LDA $42,x				;$B39CDD   |
	CMP #$0019				;$B39CDF   |
	BNE CODE_B39CE7				;$B39CE2   |
	JML [$05A9]				;$B39CE4  /

CODE_B39CE7:
	JMP CODE_B38000				;$B39CE7  /

CODE_B39CEA:
	JSR CODE_B39F56				;$B39CEA  \
	BCS CODE_B39CAF				;$B39CED   |
	JSR CODE_B3A007				;$B39CEF   |
	JSL CODE_B9D100				;$B39CF2   |
	JSR CODE_B39E9C				;$B39CF6   |
	BCS CODE_B39D3F				;$B39CF9   |
	BRA CODE_B39CAF				;$B39CFB  /

CODE_B39CFD:
	BRA CODE_B39CEA				;$B39CFD  /

CODE_B39CFF:
	LDX current_sprite			;$B39CFF  \
	STZ $26,x				;$B39D01   |
	JSR CODE_B39ECC				;$B39D03   |
	JSR CODE_B39EBE				;$B39D06   |
	JSL CODE_B8D5E0				;$B39D09   |
	LDA #$001D				;$B39D0D   |
	JSL CODE_BEF03D				;$B39D10   |
	LDX current_sprite			;$B39D14   |
	LDA $20,x				;$B39D16   |
	AND #$FFF0				;$B39D18   |
	BNE CODE_B39D27				;$B39D1B   |
	LDA $1E,x				;$B39D1D   |
	AND #$0101				;$B39D1F   |
	CMP #$0101				;$B39D22   |
	BEQ CODE_B39D33				;$B39D25   |
CODE_B39D27:					;	   |
	JSR CODE_B39E9C				;$B39D27   |
	BCS CODE_B39D42				;$B39D2A   |
	JSL CODE_B9D100				;$B39D2C   |
	BRL CODE_B39CD0				;$B39D30  /

CODE_B39D33:
	STZ $2E,x				;$B39D33  \
	LDA #$0001				;$B39D35   |
	ORA $30,x				;$B39D38   |
	STA $30,x				;$B39D3A   |
	BRL CODE_B39CD0				;$B39D3C  /

CODE_B39D3F:
	STZ $0D7A				;$B39D3F  \
CODE_B39D42:					;	   |
	LDA #$061A				;$B39D42   |
	JSL queue_sound_effect			;$B39D45   |
if !version == 1				;	   |
	LDX current_sprite			;$B39D49   |
	JSL CODE_B8D4AE				;$B39D4B   |
endif						;	   |
	JSL CODE_BB82B8				;$B39D4F   |
	LDX current_sprite			;$B39D53   |
	LDA #$0001				;$B39D55   |
	STA $00,x				;$B39D58   |
	LDA $42,x				;$B39D5A   |
	JSL CODE_B39DB0				;$B39D5C   |
	STA $42,x				;$B39D60   |
	ASL A					;$B39D62   |
	TAX					;$B39D63   |
	LDA.l DATA_FF18CE,x			;$B39D64   |
	TAY					;$B39D68   |
	JSL CODE_BB8432				;$B39D69   |
	BCS CODE_B39DAD				;$B39D6D   |
	LDX alternate_sprite			;$B39D6F   |
	LDY current_sprite			;$B39D71   |
	LDA $0042,y				;$B39D73   |
	STA $42,x				;$B39D76   |
	LDA $0044,y				;$B39D78   |
	STA $44,x				;$B39D7B   |
	LDA $0046,y				;$B39D7D   |
	STA $46,x				;$B39D80   |
	LDA #$0022				;$B39D82   |
	STA $58,x				;$B39D85   |
	LDY $0593				;$B39D87   |
	LDA $000A,y				;$B39D8A   |
	CLC					;$B39D8D   |
	ADC $0A,x				;$B39D8E   |
	LSR A					;$B39D90   |
	LDY alternate_sprite			;$B39D91   |
	STA $004E,y				;$B39D93   |
	LDA $17C0				;$B39D96   |
	CLC					;$B39D99   |
	ADC #$0070				;$B39D9A   |
	CMP $004E,y				;$B39D9D   |
	BCC CODE_B39DA5				;$B39DA0   |
	STA $004E,y				;$B39DA2   |
CODE_B39DA5:					;	   |
	JSL CODE_B3975C				;$B39DA5   |
	LDX current_sprite			;$B39DA9   |
	STZ $00,x				;$B39DAB   |
CODE_B39DAD:					;	   |
	JML [$05A9]				;$B39DAD  /

CODE_B39DB0:
	PHX					;$B39DB0  \
	BEQ CODE_B39DC6				;$B39DB1   |
	CMP #$0005				;$B39DB3   |
	BCS CODE_B39DC6				;$B39DB6   |
	TAX					;$B39DB8   |
	LDA $0902				;$B39DB9   |
	AND.l DATA_B39DC7,x			;$B39DBC   |
	BEQ CODE_B39DC5				;$B39DC0   |
	LDX #$0000				;$B39DC2   |
CODE_B39DC5:					;	   |
	TXA					;$B39DC5   |
CODE_B39DC6:					;	   |
	PLX					;$B39DC6   |
	RTL					;$B39DC7  /

DATA_B39DC8:
	%offset(DATA_B39DC7, -1)
	db $01, $02, $04, $08


barrel_main:
	JSR CODE_B3A369				;$B39DCC  /

DATA_B39DCF:
	dw CODE_B39DDA
	dw CODE_B39DFC
	dw CODE_B39E10
	dw CODE_B39E24


CODE_B39DD7:
	JML [$05A9]				;$B39DD7  /

CODE_B39DDA:
	LDX current_sprite			;$B39DDA  \
	LDA $10,x				;$B39DDC   |
	AND #$0100				;$B39DDE   |
	BNE CODE_B39DF9				;$B39DE1   |
	JSR CODE_B39F10				;$B39DE3   |
	BCS CODE_B39DD7				;$B39DE6   |
	JSR CODE_B39ECC				;$B39DE8   |
	JSR CODE_B39EBE				;$B39DEB   |
	JSL CODE_B8D5E0				;$B39DEE   |
	JSL CODE_B9D100				;$B39DF2   |
	JMP CODE_B38000				;$B39DF6  /

CODE_B39DF9:
	BRL CODE_B39E74				;$B39DF9  /

CODE_B39DFC:
	JSR CODE_B39F56				;$B39DFC  \
	BCS CODE_B39DD7				;$B39DFF   |
	JSR CODE_B3A007				;$B39E01   |
	JSL CODE_B9D100				;$B39E04   |
	JSR CODE_B39E8D				;$B39E08   |
	BCS CODE_B39E71				;$B39E0B   |
	JML [$05A9]				;$B39E0D  /

CODE_B39E10:
	JSR CODE_B39F56				;$B39E10  \
	BCS CODE_B39DD7				;$B39E13   |
	JSR CODE_B3A007				;$B39E15   |
	JSL CODE_B9D100				;$B39E18   |
	JSR CODE_B39E9C				;$B39E1C   |
	BCS CODE_B39E71				;$B39E1F   |
	JML [$05A9]				;$B39E21  /

CODE_B39E24:
	JSR CODE_B39ECC				;$B39E24  \
	JSR CODE_B39EBE				;$B39E27   |
	JSL CODE_B8D5E0				;$B39E2A   |
	LDX current_sprite			;$B39E2E   |
	LDA $1E,x				;$B39E30   |
	AND #$0202				;$B39E32   |
	BEQ CODE_B39E4D				;$B39E35   |
	CMP #$0202				;$B39E37   |
	BEQ CODE_B39E74				;$B39E3A   |
	LDY #$0006				;$B39E3C   |
	LDA [$8E],y				;$B39E3F   |
	BIT $12,x				;$B39E41   |
	BVC CODE_B39E49				;$B39E43   |
	EOR #$FFFF				;$B39E45   |
	INC A					;$B39E48   |
CODE_B39E49:					;	   |
	STA $20,x				;$B39E49   |
	STA $26,x				;$B39E4B   |
CODE_B39E4D:					;	   |
	JSR CODE_B39E9C				;$B39E4D   |
	BCC CODE_B39E61				;$B39E50   |
	LDA level_number			;$B39E52   |
	CMP #$000D				;$B39E54   |
	BEQ CODE_B39E74				;$B39E57   |
	LDA $0000,y				;$B39E59   |
	CMP #$01E8				;$B39E5C   |
	BEQ CODE_B39E74				;$B39E5F   |
CODE_B39E61:					;	   |
	JSL CODE_B9D100				;$B39E61   |
	LDX current_sprite			;$B39E65   |
	LDA $2E,x				;$B39E67   |
	AND #$FF00				;$B39E69   |
	BNE CODE_B39E86				;$B39E6C   |
	JMP CODE_B38000				;$B39E6E  /

CODE_B39E71:
	STZ $0D7A				;$B39E71  \
CODE_B39E74:					;	   |
	LDA #$051A				;$B39E74   |
	JSL queue_sound_effect			;$B39E77   |
	JSL CODE_B3975C				;$B39E7B   |
	JSL CODE_BB82B8				;$B39E7F   |
	JML [$05A9]				;$B39E83  /

CODE_B39E86:
	JSL CODE_BBBB8D				;$B39E86  \
	JML [$05A9]				;$B39E8A  /

CODE_B39E8D:
	JSL CODE_BCFB58				;$B39E8D  \
	LDA #$1020				;$B39E91   |
	LDY #$0010				;$B39E94   |
	JSL CODE_BEBD8E				;$B39E97   |
	RTS					;$B39E9B  /

CODE_B39E9C:
	JSL CODE_BCFB58				;$B39E9C  \
	LDA #$1020				;$B39EA0   |
	LDY #$0008				;$B39EA3   |
	JSL CODE_BEBD8E				;$B39EA6   |
	RTS					;$B39EAA  /

CODE_B39EAB:
	JSL CODE_BCFB58				;$B39EAB  \
	LDA #$1020				;$B39EAF   |
	LDY #$0108				;$B39EB2   |
	JSL CODE_BEBD8E				;$B39EB5   |
	RTS					;$B39EB9  /

CODE_B39EBA:
	JSR CODE_B39EBE				;$B39EBA  \
	RTL					;$B39EBD  /

CODE_B39EBE:
	LDY #$0004				;$B39EBE  \
	LDA [$8E],y				;$B39EC1   |
	JSL CODE_B8D010				;$B39EC3   |
	RTS					;$B39EC7  /

CODE_B39EC8:
	JSR CODE_B39ECC				;$B39EC8  \
	RTL					;$B39ECB  /

CODE_B39ECC:
	LDX current_sprite			;$B39ECC  \
	LDY #$0000				;$B39ECE   |
	LDA [$8E],y				;$B39ED1   |
	LDY #$0002				;$B39ED3   |
	CLC					;$B39ED6   |
	ADC $24,x				;$B39ED7   |
	BMI CODE_B39EE1				;$B39ED9   |
	CMP [$8E],y				;$B39EDB   |
	BCC CODE_B39EE1				;$B39EDD   |
	LDA [$8E],y				;$B39EDF   |
CODE_B39EE1:					;	   |
	STA $24,x				;$B39EE1   |
	RTS					;$B39EE3  /

	LDY #$0004				;$B39EE4   |
	LDA [$8E],y				;$B39EE7   |
	JSL CODE_B8CFD4				;$B39EE9   |
	RTS					;$B39EED  /

CODE_B39EEE:
	LDY #$0004				;$B39EEE  \
	LDA [$8E],y				;$B39EF1   |
	JSL CODE_B8D010				;$B39EF3   |
	RTS					;$B39EF7  /

CODE_B39EF8:
	LDX current_sprite			;$B39EF8  \
	LDY #$0000				;$B39EFA   |
	LDA [$8E],y				;$B39EFD   |
	LDY #$0002				;$B39EFF   |
	CLC					;$B39F02   |
	ADC $24,x				;$B39F03   |
	BMI CODE_B39F0D				;$B39F05   |
	CMP [$8E],y				;$B39F07   |
	BCC CODE_B39F0D				;$B39F09   |
	LDA [$8E],y				;$B39F0B   |
CODE_B39F0D:					;	   |
	STA $24,x				;$B39F0D   |
	RTS					;$B39F0F  /

CODE_B39F10:
	LDX current_sprite			;$B39F10  \
	LDA $32,x				;$B39F12   |
	BNE CODE_B39F18				;$B39F14   |
CODE_B39F16:					;	   |
	CLC					;$B39F16   |
	RTS					;$B39F17  /

CODE_B39F18:
	STZ $32,x				;$B39F18  \
	CMP #$0001				;$B39F1A   |
	BEQ CODE_B39F26				;$B39F1D   |
	CMP #$0200				;$B39F1F   |
	BEQ CODE_B39F42				;$B39F22   |
	BRA CODE_B39F16				;$B39F24  /

CODE_B39F26:
	LDA #$0001				;$B39F26  \
	STA $2E,x				;$B39F29   |
	LDA #$FFFC				;$B39F2B   |
	AND $30,x				;$B39F2E   |
	STA $30,x				;$B39F30   |
	STZ $20,x				;$B39F32   |
	LDA #$FFFF				;$B39F34   |
	STA $48,x				;$B39F37   |
	LDA #$02EA				;$B39F39   |
	JSL CODE_B9D03A				;$B39F3C   |
	SEC					;$B39F40   |
	RTS					;$B39F41  /

CODE_B39F42:
	STZ $0D7A				;$B39F42  \
	LDA #$051A				;$B39F45   |
	JSL queue_sound_effect			;$B39F48   |
	JSL CODE_B3975C				;$B39F4C   |
	JSL CODE_BB82B8				;$B39F50   |
	SEC					;$B39F54   |
	RTS					;$B39F55  /

CODE_B39F56:
	LDX current_sprite			;$B39F56  \
	LDA $32,x				;$B39F58   |
	BNE CODE_B39F63				;$B39F5A   |
	LDA $0D7A				;$B39F5C   |
	BEQ CODE_B39F8F				;$B39F5F   |
CODE_B39F61:					;	   |
	CLC					;$B39F61   |
	RTS					;$B39F62  /

CODE_B39F63:
	STZ $32,x				;$B39F63  \
	CMP #$0001				;$B39F65   |
	BEQ CODE_B39FBD				;$B39F68   |
	CMP #$0002				;$B39F6A   |
	BEQ CODE_B39F88				;$B39F6D   |
	CMP #$0004				;$B39F6F   |
	BEQ CODE_B39FD4				;$B39F72   |
	CMP #$0006				;$B39F74   |
	BEQ CODE_B39FD4				;$B39F77   |
	CMP #$0005				;$B39F79   |
	BEQ CODE_B39F8F				;$B39F7C   |
	CMP #$0200				;$B39F7E   |
	BEQ CODE_B39F85				;$B39F81   |
	BRA CODE_B39F61				;$B39F83  /

CODE_B39F85:
	JMP CODE_B39F42				;$B39F85  /

CODE_B39F88:
	LDA #$0002				;$B39F88  \
	STA $2E,x				;$B39F8B   |
	SEC					;$B39F8D   |
	RTS					;$B39F8E  /

CODE_B39F8F:
	LDA $00,x				;$B39F8F  \
	CMP #$01A8				;$B39F91   |
	BNE CODE_B39FD4				;$B39F94   |
	PHX					;$B39F96   |
	JSR CODE_B38D10				;$B39F97   |
	PLX					;$B39F9A   |
	AND #$0001				;$B39F9B   |
	BEQ CODE_B39FD4				;$B39F9E   |
	SEP #$20				;$B39FA0   |
	LDA #$07				;$B39FA2   |
	STA $2E,x				;$B39FA4   |
	REP #$20				;$B39FA6   |
	STZ $26,x				;$B39FA8   |
	LDA #$FD00				;$B39FAA   |
	STA $24,x				;$B39FAD   |
	LDA #$0100				;$B39FAF   |
	STA $20,x				;$B39FB2   |
	LDA $12,x				;$B39FB4   |
	ORA #$3000				;$B39FB6   |
	STA $12,x				;$B39FB9   |
	BRA CODE_B39FDC				;$B39FBB  /

CODE_B39FBD:
	STZ $2E,x				;$B39FBD  \
	LDA #$0003				;$B39FBF   |
	ORA $30,x				;$B39FC2   |
	STA $30,x				;$B39FC4   |
	LDA #$00C8				;$B39FC6   |
	STA $02,x				;$B39FC9   |
	LDA #$02F2				;$B39FCB   |
	JSL CODE_B9D03A				;$B39FCE   |
	SEC					;$B39FD2   |
	RTS					;$B39FD3  /

CODE_B39FD4:
	SEP #$20				;$B39FD4  \
	LDA #$03				;$B39FD6   |
	STA $2E,x				;$B39FD8   |
	REP #$20				;$B39FDA   |
CODE_B39FDC:					;	   |
	LDA #$00C8				;$B39FDC   |
	STA $02,x				;$B39FDF   |
	LDY #$0006				;$B39FE1   |
	LDA [$8E],y				;$B39FE4   |
	BIT $20,x				;$B39FE6   |
	BPL CODE_B39FEE				;$B39FE8   |
	EOR #$FFFF				;$B39FEA   |
	INC A					;$B39FED   |
CODE_B39FEE:					;	   |
	STA $26,x				;$B39FEE   |
	LSR A					;$B39FF0   |
	EOR $12,x				;$B39FF1   |
	AND #$4000				;$B39FF3   |
	EOR $12,x				;$B39FF6   |
	STA $12,x				;$B39FF8   |
	LDA #$02FA				;$B39FFA   |
	JSL CODE_B9D03A				;$B39FFD   |
	SEC					;$B3A001   |
	RTS					;$B3A002  /

CODE_B3A003:
	JSR CODE_B3A007				;$B3A003  \
	RTL					;$B3A006  /

CODE_B3A007:
	LDX $0593				;$B3A007  \
	LDY current_sprite			;$B3A00A   |
	BIT $12,x				;$B3A00C   |
	BVS CODE_B3A01B				;$B3A00E   |
	LDA $06,x				;$B3A010   |
	CLC					;$B3A012   |
	ADC $0D7C				;$B3A013   |
	STA $0006,y				;$B3A016   |
	BRA CODE_B3A024				;$B3A019  /

CODE_B3A01B:
	LDA $06,x				;$B3A01B  \
	SEC					;$B3A01D   |
	SBC $0D7C				;$B3A01E   |
	STA $0006,y				;$B3A021   |
CODE_B3A024:					;	   |
	LDA $0A,x				;$B3A024   |
	CLC					;$B3A026   |
	ADC $0D7E				;$B3A027   |
	STA $000A,y				;$B3A02A   |
	LDA $02,x				;$B3A02D   |
	CLC					;$B3A02F   |
	ADC $0D80				;$B3A030   |
	STA $0002,y				;$B3A033   |
	RTS					;$B3A036  /

unknown_sprite_0308_main:
	JSL CODE_B9D100				;$B3A037  \
	JML [$05A9]				;$B3A03B  /

no_animal_buddy_sign_main:
	LDA $08A8				;$B3A03E  \
	CMP #$006E				;$B3A041   |
	BNE CODE_B3A04C				;$B3A044   |
	LDA #$0040				;$B3A046   |
	TSB $052B				;$B3A049   |
CODE_B3A04C:					;	   |
if !version == 1				;	   |
	JSR CODE_B3A0C7				;$B3A04C   |
endif						;	   |
	LDX $0593				;$B3A04F   |
	LDA $6E					;$B3A052   |
	BNE CODE_B3A06C				;$B3A054   |
	LDX #$0E9E				;$B3A056   |
CODE_B3A059:					;	   |
	LDA $00,x				;$B3A059   |
	BNE CODE_B3A06C				;$B3A05B   |
CODE_B3A05D:					;	   |
	TXA					;$B3A05D   |
	CLC					;$B3A05E   |
	ADC #sizeof(sprite)			;$B3A05F   |
	TAX					;$B3A062   |
	CPX #main_sprite_table_end		;$B3A063   |
	BNE CODE_B3A059				;$B3A066   |
	JML CODE_B38000				;$B3A068  /

CODE_B3A06C:
	CMP #$0190				;$B3A06C  \
	BCC CODE_B3A05D				;$B3A06F   |
	CMP #$01A1				;$B3A071   |
	BCS CODE_B3A05D				;$B3A074   |
	STA $32					;$B3A076   |
	LDY current_sprite			;$B3A078   |
	LDA $000A,y				;$B3A07A   |
	CLC					;$B3A07D   |
	ADC #$0008				;$B3A07E   |
	CMP $0A,x				;$B3A081   |
	BMI CODE_B3A0BC				;$B3A083   |
	LDA $0006,y				;$B3A085   |
	SEC					;$B3A088   |
	SBC $06,x				;$B3A089   |
	BPL CODE_B3A091				;$B3A08B   |
	EOR #$FFFF				;$B3A08D   |
	INC A					;$B3A090   |
CODE_B3A091:					;	   |
	CMP #$0010				;$B3A091   |
	BPL CODE_B3A0BC				;$B3A094   |
	LDA $6E					;$B3A096   |
	BEQ CODE_B3A0BF				;$B3A098   |
	LDA #$0019				;$B3A09A   |
	JSL CODE_B8D8BA				;$B3A09D   |
	BCS CODE_B3A0BC				;$B3A0A1   |
	LDX current_sprite			;$B3A0A3   |
	LDA $42,x				;$B3A0A5   |
	STA $0A86				;$B3A0A7   |
	LDA $0A,x				;$B3A0AA   |
	SEC					;$B3A0AC   |
	SBC #$0020				;$B3A0AD   |
	STA $0A88				;$B3A0B0   |
	LDA $12,x				;$B3A0B3   |
	AND #$4000				;$B3A0B5   |
	ASL A					;$B3A0B8   |
	TSB $0A88				;$B3A0B9   |
CODE_B3A0BC:					;	   |
	JMP CODE_B38000				;$B3A0BC  /

CODE_B3A0BF:
	LDA #$0002				;$B3A0BF  \
	STA $32,x				;$B3A0C2   |
	JMP CODE_B38000				;$B3A0C4  /

CODE_B3A0C7:
if !version == 1
	RTS					;$B3A0C7  /
endif

unknown_sprite_016C_main:
	JSR CODE_B3A227				;$B3A0C8  \
	BCS CODE_B3A0DA				;$B3A0CB   |
	LDX current_sprite			;$B3A0CD   |
	LDA $54,x				;$B3A0CF   |
	STA $8E					;$B3A0D1   |
	LDA $2E,x				;$B3A0D3   |
	ASL A					;$B3A0D5   |
	TAX					;$B3A0D6   |
	JMP (DATA_B3A0E1,x)			;$B3A0D7  /

CODE_B3A0DA:
	JSL CODE_BB82B8				;$B3A0DA  \
	JML [$05A9]				;$B3A0DE  /

DATA_B3A0E1:
	dw CODE_B3A0F0
	dw CODE_B3A0FF
	dw CODE_B3A124
	dw CODE_B3A12F
	dw CODE_B3A144
	dw CODE_B3A163


CODE_B3A0ED:
	JML [$05A9]				;$B3A0ED  /

CODE_B3A0F0:
	LDX current_sprite			;$B3A0F0  \
	INC $2E,x				;$B3A0F2   |
	STZ $44,x				;$B3A0F4   |
	LDA #$0001				;$B3A0F6   |
	STA $46,x				;$B3A0F9   |
	STZ $48,x				;$B3A0FB   |
	BRA CODE_B3A0ED				;$B3A0FD  /

CODE_B3A0FF:
	JSR CODE_B3A187				;$B3A0FF  \
	BCC CODE_B3A0ED				;$B3A102   |
	LDX current_sprite			;$B3A104   |
	LDA $48,x				;$B3A106   |
	ASL A					;$B3A108   |
	TAX					;$B3A109   |
	LDA.l DATA_B9F0C5,x			;$B3A10A   |
	LDX current_sprite			;$B3A10E   |
	STA $1A,x				;$B3A110   |
	STZ $16,x				;$B3A112   |
	LDA $48,x				;$B3A114   |
	ASL A					;$B3A116   |
	TAX					;$B3A117   |
	LDA.l DATA_FD618E,x			;$B3A118   |
	LDX current_sprite			;$B3A11C   |
	JSL CODE_BB8C40				;$B3A11E   |
	BRA CODE_B3A0ED				;$B3A122  /

CODE_B3A124:
	LDX current_sprite			;$B3A124  \
	INC $2E,x				;$B3A126   |
	LDA #$000F				;$B3A128   |
	STA $4A,x				;$B3A12B   |
	BRA CODE_B3A0ED				;$B3A12D  /

CODE_B3A12F:
	LDX current_sprite			;$B3A12F  \
	DEC $4A,x				;$B3A131   |
	BMI CODE_B3A137				;$B3A133   |
	BRA CODE_B3A0ED				;$B3A135  /

CODE_B3A137:
	LDX current_sprite			;$B3A137  \
	INC $2E,x				;$B3A139   |
	STZ $20,x				;$B3A13B   |
	LDA #DATA_FF0214			;$B3A13D   |
	STA $54,x				;$B3A140   |
	BRA CODE_B3A0ED				;$B3A142  /

CODE_B3A144:
	JSR CODE_B39ECC				;$B3A144  \
	JSL CODE_B8D5E0				;$B3A147   |
	LDX current_sprite			;$B3A14B   |
	LDA $1E,x				;$B3A14D   |
	AND #$0101				;$B3A14F   |
	CMP #$0101				;$B3A152   |
	BEQ CODE_B3A15E				;$B3A155   |
	JSL CODE_BBBB8D				;$B3A157   |
	JML [$05A9]				;$B3A15B  /

CODE_B3A15E:
	INC $2E,x				;$B3A15E  \
	JML [$05A9]				;$B3A160  /

CODE_B3A163:
	LDX current_sprite			;$B3A163  \
	STX alternate_sprite			;$B3A165   |
	LDA $12,x				;$B3A167   |
	JSL CODE_BB8C02				;$B3A169   |
	LDX current_sprite			;$B3A16D   |
	LDA $48,x				;$B3A16F   |
	ASL A					;$B3A171   |
	TAX					;$B3A172   |
	LDA.l DATA_FF1A8E,x			;$B3A173   |
	TAY					;$B3A177   |
	LDX current_sprite			;$B3A178   |
	JSL CODE_BB845D				;$B3A17A   |
	LDX alternate_sprite			;$B3A17E   |
	STZ $2C,x				;$B3A180   |
	STZ $56,x				;$B3A182   |
	JML [$05A9]				;$B3A184  /

CODE_B3A187:
	LDX current_sprite			;$B3A187  \
	DEC $46,x				;$B3A189   |
	BEQ CODE_B3A18F				;$B3A18B   |
	CLC					;$B3A18D   |
	RTS					;$B3A18E  /

CODE_B3A18F:
	LDA $44,x				;$B3A18F  \
	ASL A					;$B3A191   |
	TAY					;$B3A192   |
	LDA [$8E],y				;$B3A193   |
	AND #$00FF				;$B3A195   |
	STA $46,x				;$B3A198   |
	INY					;$B3A19A   |
	LDA [$8E],y				;$B3A19B   |
	AND #$00FF				;$B3A19D   |
	STA $48,x				;$B3A1A0   |
	INY					;$B3A1A2   |
	INC $44,x				;$B3A1A3   |
	LDA [$8E],y				;$B3A1A5   |
	AND #$00FF				;$B3A1A7   |
	BEQ CODE_B3A1AE				;$B3A1AA   |
	SEC					;$B3A1AC   |
	RTS					;$B3A1AD  /

CODE_B3A1AE:
	STZ $44,x				;$B3A1AE  \
	SEC					;$B3A1B0   |
	RTS					;$B3A1B1  /

unknown_sprite_0168_main:
	JSR CODE_B3A227				;$B3A1B2  \
	BCS CODE_B3A1BA				;$B3A1B5   |
	JML [$05A9]				;$B3A1B7  /

CODE_B3A1BA:
	JSL CODE_BB82B8				;$B3A1BA  \
	JML [$05A9]				;$B3A1BE  /

unknown_sprite_0164_main:
	JSR CODE_B3A227				;$B3A1C1  \
	BCS CODE_B3A1CD				;$B3A1C4   |
	LDA $2E,x				;$B3A1C6   |
	ASL A					;$B3A1C8   |
	TAX					;$B3A1C9   |
	JMP (DATA_B3A1D4,x)			;$B3A1CA  /

CODE_B3A1CD:
	JSL CODE_BB82B8				;$B3A1CD  \
	JML [$05A9]				;$B3A1D1  /

DATA_B3A1D4:
	dw CODE_B3A1DF
	dw CODE_B3A1E9
	dw CODE_B3A1EB
	dw CODE_B3A1F1


CODE_B3A1DC:
	JML [$05A9]				;$B3A1DC  /

CODE_B3A1DF:
	LDX current_sprite			;$B3A1DF  \
	LDA $0A,x				;$B3A1E1   |
	STA $44,x				;$B3A1E3   |
	INC $2E,x				;$B3A1E5   |
	BRA CODE_B3A1DC				;$B3A1E7  /

CODE_B3A1E9:
	BRA CODE_B3A1DC				;$B3A1E9  /

CODE_B3A1EB:
	LDX current_sprite			;$B3A1EB  \
	INC $2E,x				;$B3A1ED   |
	BRA CODE_B3A1DC				;$B3A1EF  /

CODE_B3A1F1:
	LDX current_sprite			;$B3A1F1  \
	LDA #$0050				;$B3A1F3   |
	CLC					;$B3A1F6   |
	ADC $24,x				;$B3A1F7   |
	BMI CODE_B3A203				;$B3A1F9   |
	CMP #$0800				;$B3A1FB   |
	BCC CODE_B3A203				;$B3A1FE   |
	LDA #$0800				;$B3A200   |
CODE_B3A203:					;	   |
	STA $24,x				;$B3A203   |
	JSL CODE_B8CF7F				;$B3A205   |
	LDA $44,x				;$B3A209   |
	CMP $0A,x				;$B3A20B   |
	BPL CODE_B3A211				;$B3A20D   |
	STA $0A,x				;$B3A20F   |
CODE_B3A211:					;	   |
	LDA $44,x				;$B3A211   |
	SEC					;$B3A213   |
	SBC $0A,x				;$B3A214   |
	CMP #$0060				;$B3A216   |
	BPL CODE_B3A21D				;$B3A219   |
	BRA CODE_B3A1DC				;$B3A21B  /

CODE_B3A21D:
	JSL CODE_B3975C				;$B3A21D  \
	JSL CODE_BB82B8				;$B3A221   |
	BRA CODE_B3A1DC				;$B3A225  /

CODE_B3A227:
	LDX current_sprite			;$B3A227  \
	LDA $42,x				;$B3A229   |
	TAY					;$B3A22B   |
	LDA $0000,y				;$B3A22C   |
	CMP #$0160				;$B3A22F   |
	BNE CODE_B3A236				;$B3A232   |
	CLC					;$B3A234   |
	RTS					;$B3A235  /

CODE_B3A236:
	SEC					;$B3A236  \
	RTS					;$B3A237  /

level_goal_main:
	LDX current_sprite			;$B3A238  \
	LDA $54,x				;$B3A23A   |
	STA $8E					;$B3A23C   |
	LDA $2E,x				;$B3A23E   |
	ASL A					;$B3A240   |
	TAX					;$B3A241   |
	JMP (DATA_B3A245,x)			;$B3A242  /

DATA_B3A245:
	dw CODE_B3A24E
	dw CODE_B3A299
	dw CODE_B3A313


CODE_B3A24B:
	JML [$05A9]				;$B3A24B  /

CODE_B3A24E:
	LDX current_sprite			;$B3A24E  \
	JSL CODE_B8D47C				;$B3A250   |
	LDX current_sprite			;$B3A254   |
	STA $4A,x				;$B3A256   |
	INC $2E,x				;$B3A258   |
	STZ $48,x				;$B3A25A   |
	LDY #$0080				;$B3A25C   |
	JSL CODE_BB842C				;$B3A25F   |
	LDY alternate_sprite			;$B3A263   |
	LDA current_sprite			;$B3A265   |
	TAX					;$B3A267   |
	STA $0042,y				;$B3A268   |
	TYA					;$B3A26B   |
	STA $42,x				;$B3A26C   |
	LDY #$0082				;$B3A26E   |
	JSL CODE_BB842C				;$B3A271   |
	LDY alternate_sprite			;$B3A275   |
	LDA current_sprite			;$B3A277   |
	TAX					;$B3A279   |
	STA $0042,y				;$B3A27A   |
	LDA $54,x				;$B3A27D   |
	STA $0054,y				;$B3A27F   |
	TYA					;$B3A282   |
	STA $46,x				;$B3A283   |
	LDY #$007E				;$B3A285   |
	JSL CODE_BB842C				;$B3A288   |
	LDY alternate_sprite			;$B3A28C   |
	LDA current_sprite			;$B3A28E   |
	TAX					;$B3A290   |
	STA $0042,y				;$B3A291   |
	TYA					;$B3A294   |
	STA $44,x				;$B3A295   |
	BRA CODE_B3A24B				;$B3A297  /

CODE_B3A299:
	LDX $0593				;$B3A299  \
	LDA $1E,x				;$B3A29C   |
	AND #$0101				;$B3A29E   |
	BNE CODE_B3A2BC				;$B3A2A1   |
	LDA $24,x				;$B3A2A3   |
	BMI CODE_B3A2BC				;$B3A2A5   |
	LDA current_player_mount		;$B3A2A7   |
	BNE CODE_B3A2AF				;$B3A2A9   |
	LDA $6E					;$B3A2AB   |
	BNE CODE_B3A2BC				;$B3A2AD   |
CODE_B3A2AF:					;	   |
	JSL CODE_BCFB58				;$B3A2AF   |
	LDA #$0008				;$B3A2B3   |
	JSL CODE_BCFCB5				;$B3A2B6   |
	BCS CODE_B3A2BF				;$B3A2BA   |
CODE_B3A2BC:					;	   |
	JMP CODE_B38000				;$B3A2BC  /

CODE_B3A2BF:
	LDX current_sprite			;$B3A2BF  \
	INC $2E,x				;$B3A2C1   |
	LDY $42,x				;$B3A2C3   |
	LDA #$0002				;$B3A2C5   |
	STA $002E,y				;$B3A2C8   |
	LDA #$0004				;$B3A2CB   |
	TRB $0B02				;$B3A2CE   |
	PHX					;$B3A2D1   |
	PHY					;$B3A2D2   |
	JSR CODE_B3A31A				;$B3A2D3   |
	PLY					;$B3A2D6   |
	PLX					;$B3A2D7   |
	STA $0024,y				;$B3A2D8   |
	BCS CODE_B3A2EB				;$B3A2DB   |
	LDA #$0004				;$B3A2DD   |
	TSB $0B02				;$B3A2E0   |
	LDY $46,x				;$B3A2E3   |
	LDA #$0002				;$B3A2E5   |
	STA $002E,y				;$B3A2E8   |
CODE_B3A2EB:					;	   |
	LDA #$02B4				;$B3A2EB   |
	JSL CODE_B9D0C6				;$B3A2EE   |
	LDA #$002A				;$B3A2F2   |
	JSL CODE_B8D8BA				;$B3A2F5   |
	BCS CODE_B3A310				;$B3A2F9   |
	LDX current_sprite			;$B3A2FB   |
	LDA $06,x				;$B3A2FD   |
	CLC					;$B3A2FF   |
	ADC #$0012				;$B3A300   |
	STA $0A86				;$B3A303   |
	LDA $4A,x				;$B3A306   |
	STA $0A88				;$B3A308   |
	LDA $48,x				;$B3A30B   |
	STA $0A8A				;$B3A30D   |
CODE_B3A310:					;	   |
	BRL CODE_B3A24B				;$B3A310  /

CODE_B3A313:
	JSL CODE_B9D100				;$B3A313  \
	BRL CODE_B3A24B				;$B3A317  /

CODE_B3A31A:
	LDX current_sprite			;$B3A31A  \
	LDA $0A,x				;$B3A31C   |
	SEC					;$B3A31E   |
	SBC $0935				;$B3A31F   |
	CMP #$0068				;$B3A322   |
	BMI CODE_B3A32C				;$B3A325   |
	LDA #$F700				;$B3A327   |
	CLC					;$B3A32A   |
	RTS					;$B3A32B  /

CODE_B3A32C:
	LDA #$F900				;$B3A32C  \
	SEC					;$B3A32F   |
	RTS					;$B3A330  /

unknown_sprite_00C8_main:
	JML [$05A9]				;$B3A331  /

CODE_B3A334:
	JSR CODE_B3A338				;$B3A334  \
	RTL					;$B3A337  /

CODE_B3A338:
	LDA $D9					;$B3A338  \
	CMP $E1					;$B3A33A   |
	BCS CODE_B3A344				;$B3A33C   |
	LDA $DD					;$B3A33E   |
	ADC $E1					;$B3A340   |
	BRA CODE_B3A347				;$B3A342  /

CODE_B3A344:
	CLC					;$B3A344  \
	ADC $E5					;$B3A345   |
CODE_B3A347:					;	   |
	LSR A					;$B3A347   |
	STA $0A3E				;$B3A348   |
	LDA $DB					;$B3A34B   |
	CMP $E3					;$B3A34D   |
	BCS CODE_B3A357				;$B3A34F   |
	LDA $DF					;$B3A351   |
	ADC $E3					;$B3A353   |
	BRA CODE_B3A35A				;$B3A355  /

CODE_B3A357:
	CLC					;$B3A357  \
	ADC $E7					;$B3A358   |
CODE_B3A35A:					;	   |
	LSR A					;$B3A35A   |
	STA $0A40				;$B3A35B   |
	RTS					;$B3A35E  /

	JSL CODE_BEBD8E				;$B3A35F   |
	RTS					;$B3A363  /

CODE_B3A364:
	JSL CODE_BEBE14				;$B3A364  \
	RTS					;$B3A368  /

CODE_B3A369:
	PHK					;$B3A369  \
	PLB					;$B3A36A   |
	LDY current_sprite			;$B3A36B   |
	LDA $0054,y				;$B3A36D   |
	STA $8E					;$B3A370   |
	LDA $002D,y				;$B3A372   |
	BMI CODE_B3A38B				;$B3A375   |
	XBA					;$B3A377   |
	AND #$007F				;$B3A378   |
	ASL A					;$B3A37B   |
	SEC					;$B3A37C   |
	ADC $01,s				;$B3A37D   |
	TAX					;$B3A37F   |
	PLA					;$B3A380   |
	LDA $002F,y				;$B3A381   |
	AND #$00FF				;$B3A384   |
	ASL A					;$B3A387   |
	JMP ($0000,x)				;$B3A388  /

CODE_B3A38B:
	JMP CODE_B3D249				;$B3A38B  /

	JSL CODE_BCFED8				;$B3A38E   |
	JSL CODE_BCFEC0				;$B3A392   |
	JSR CODE_B3A338				;$B3A396   |
	LDY #$0034				;$B3A399   |
	JSL CODE_BB842C				;$B3A39C   |
	LDX current_sprite			;$B3A3A0   |
	RTS					;$B3A3A2  /

CODE_B3A3A3:
	SEC					;$B3A3A3  \
	LDA $0D54				;$B3A3A4   |
	BMI CODE_B3A3B3				;$B3A3A7   |
	LDX current_sprite			;$B3A3A9   |
	LDA $10,x				;$B3A3AB   |
	BIT #$0100				;$B3A3AD   |
	BEQ CODE_B3A3B3				;$B3A3B0   |
	CLC					;$B3A3B2   |
CODE_B3A3B3:					;	   |
	RTS					;$B3A3B3  /

CODE_B3A3B4:
	STA $5E					;$B3A3B4  \
	LDA $F1					;$B3A3B6   |
	ASL A					;$B3A3B8   |
	ASL A					;$B3A3B9   |
	TAY					;$B3A3BA   |
	TXA					;$B3A3BB   |
	STA $0B24,y				;$B3A3BC   |
	LDA $5E					;$B3A3BF   |
	STA $0B26,y				;$B3A3C1   |
	LDA $F1					;$B3A3C4   |
	INC A					;$B3A3C6   |
	AND #$000F				;$B3A3C7   |
	STA $F1					;$B3A3CA   |
	RTL					;$B3A3CC  /

CODE_B3A3CD:
	LDA $08C2				;$B3A3CD  \
	AND #$4000				;$B3A3D0   |
	BNE CODE_B3A3E9				;$B3A3D3   |
	LDY $0593				;$B3A3D5   |
	LDA $002E,y				;$B3A3D8   |
	ASL A					;$B3A3DB   |
	ASL A					;$B3A3DC   |
	TAX					;$B3A3DD   |
	LDA.l DATA_B896B7,x			;$B3A3DE   |
	AND #$0001				;$B3A3E2   |
	BEQ CODE_B3A3E9				;$B3A3E5   |
	CLC					;$B3A3E7   |
	RTS					;$B3A3E8  /

CODE_B3A3E9:
	SEC					;$B3A3E9  \
	RTS					;$B3A3EA  /

CODE_B3A3EB:
	JSL CODE_BBBB69				;$B3A3EB  \
	BCS CODE_B3A3F2				;$B3A3EF   |
	RTS					;$B3A3F1  /

CODE_B3A3F2:
	JSL CODE_BBBD6B				;$B3A3F2  \
	JSL CODE_BB82B8				;$B3A3F6   |
	SEC					;$B3A3FA   |
	RTS					;$B3A3FB  /

CODE_B3A3FC:
	JSR CODE_B3A400				;$B3A3FC  \
	RTL					;$B3A3FF  /

CODE_B3A400:
	PHY					;$B3A400  \
	PHX					;$B3A401   |
	PHA					;$B3A402   |
	JSL CODE_BBBB69				;$B3A403   |
	PLA					;$B3A407   |
	BCS CODE_B3A40E				;$B3A408   |
	JSL queue_sound_effect			;$B3A40A   |
CODE_B3A40E:					;	   |
	PLX					;$B3A40E   |
	PLY					;$B3A40F   |
	RTS					;$B3A410  /

klampon_main:
	LDA $0A36				;$B3A411  \
	BIT #$0004				;$B3A414   |
	BEQ neek_main				;$B3A417   |
	LDY current_sprite			;$B3A419   |
	LDA $0036,y				;$B3A41B   |
	CMP #$01A2				;$B3A41E   |
	BEQ neek_main				;$B3A421   |
	JML [$05A9]				;$B3A423  /

zinger_main:
	LDY current_sprite			;$B3A426  \
	LDA $002E,y				;$B3A428   |
	CMP #$0001				;$B3A42B   |
	BEQ CODE_B3A442				;$B3A42E   |
	INC $19AA				;$B3A430   |
	BRA CODE_B3A442				;$B3A433  /

flitter_main:
	LDY current_sprite			;$B3A435  \
	LDA $002E,y				;$B3A437   |
	CMP #$0001				;$B3A43A   |
	BEQ CODE_B3A442				;$B3A43D   |
	INC $19AB				;$B3A43F   |
CODE_B3A442:					;	   |
	LDA $0D54				;$B3A442   |
	BMI neek_main				;$B3A445   |
	CLC					;$B3A447   |
	ADC #$00C0				;$B3A448   |
	LDY current_sprite			;$B3A44B   |
	CMP $000A,y				;$B3A44D   |
	BCS neek_main				;$B3A450   |
	LDA $002E,y				;$B3A452   |
	BNE neek_main				;$B3A455   |
	JMP CODE_B3A57A				;$B3A457  /

klinger_main:
klomp_main:
neek_main:
spiny_main:
unknown_sprite_01F4_main:
	JSR CODE_B3A369				;$B3A45A  /

DATA_B3A45D:
	dw CODE_B3A465
	dw CODE_B3A525
	dw CODE_B3A5AD
	dw CODE_B3A5B3

CODE_B3A465:
	LDY #$0008				;$B3A465  \
	LDA [$8E],y				;$B3A468   |
	CMP #$6000				;$B3A46A   |
	BNE CODE_B3A488				;$B3A46D   |
	LDA $30,x				;$B3A46F   |
	ORA #$0080				;$B3A471   |
	STA $30,x				;$B3A474   |
	LDA #$0100				;$B3A476   |
	JSL CODE_BEBE14				;$B3A479   |
	BCC CODE_B3A491				;$B3A47D   |
	LDA #$050E				;$B3A47F   |
	JSL queue_sound_effect			;$B3A482   |
	BRA CODE_B3A491				;$B3A486  /

CODE_B3A488:
	LDA #$0118				;$B3A488  \
	JSL CODE_BEBE14				;$B3A48B   |
	BCS CODE_B3A4BF				;$B3A48F   |
CODE_B3A491:					;	   |
	JSL CODE_BCFB58				;$B3A491   |
	LDY #$0008				;$B3A495   |
	LDA [$8E],y				;$B3A498   |
	JSL CODE_BEBE8B				;$B3A49A   |
	BCS CODE_B3A4BF				;$B3A49E   |
CODE_B3A4A0:					;	   |
	JSR CODE_B3B8CB				;$B3A4A0   |
	LDA $00,x				;$B3A4A3   |
	CMP #$0200				;$B3A4A5   |
	BNE CODE_B3A4B3				;$B3A4A8   |
	LDA $48,x				;$B3A4AA   |
	BEQ CODE_B3A4B3				;$B3A4AC   |
	DEC $48,x				;$B3A4AE   |
	JMP CODE_B38000				;$B3A4B0  /

CODE_B3A4B3:
	JSL CODE_BEF039				;$B3A4B3  \
	JSR CODE_B3A3A3				;$B3A4B7   |
	BCC CODE_B3A4E6				;$B3A4BA   |
	JMP CODE_B38000				;$B3A4BC  /

CODE_B3A4BF:
	BEQ CODE_B3A4E6				;$B3A4BF  \
	CMP #$0002				;$B3A4C1   |
	BCC CODE_B3A505				;$B3A4C4   |
	LDY #$0012				;$B3A4C6   |
	LDA [$8E],y				;$B3A4C9   |
	BEQ CODE_B3A4A0				;$B3A4CB   |
	JSL CODE_B9D0C6				;$B3A4CD   |
	LDX current_sprite			;$B3A4D1   |
	LDY #$0014				;$B3A4D3   |
	LDA [$8E],y				;$B3A4D6   |
	BEQ CODE_B3A4DF				;$B3A4D8   |
	STA $2E,x				;$B3A4DA   |
	BRL neek_main				;$B3A4DC  /

CODE_B3A4DF:
	JSL CODE_BEF039				;$B3A4DF  \
	JMP CODE_B38000				;$B3A4E3  /

CODE_B3A4E6:
	LDY #$000A				;$B3A4E6  \
	LDA [$8E],y				;$B3A4E9   |
	BEQ CODE_B3A4A0				;$B3A4EB   |
	JSR CODE_B3A627				;$B3A4ED   |
	LDX current_sprite			;$B3A4F0   |
	LDY #$000C				;$B3A4F2   |
	LDA [$8E],y				;$B3A4F5   |
	BEQ CODE_B3A4FE				;$B3A4F7   |
	STA $2E,x				;$B3A4F9   |
	BRL neek_main				;$B3A4FB  /

CODE_B3A4FE:
	JSL CODE_BEF039				;$B3A4FE  \
	JMP CODE_B38000				;$B3A502  /

CODE_B3A505:
	LDY #$000E				;$B3A505  \
	LDA [$8E],y				;$B3A508   |
	BEQ CODE_B3A4A0				;$B3A50A   |
	JSL CODE_B9D0C6				;$B3A50C   |
	LDX current_sprite			;$B3A510   |
	LDY #$0010				;$B3A512   |
	LDA [$8E],y				;$B3A515   |
	BEQ CODE_B3A51E				;$B3A517   |
	STA $2E,x				;$B3A519   |
	BRL neek_main				;$B3A51B  /

CODE_B3A51E:
	JSL CODE_BEF039				;$B3A51E  \
	JMP CODE_B38000				;$B3A522  /

CODE_B3A525:
	TAX					;$B3A525  \
	JMP (DATA_B3A529,x)			;$B3A526  /

DATA_B3A529:
	dw CODE_B3A52F
	dw CODE_B3A539
	dw CODE_B3A55D


CODE_B3A52F:
	JSL CODE_BEF039				;$B3A52F  \
	JSR CODE_B3B8CB				;$B3A533   |
	JMP CODE_B3A652				;$B3A536  /

CODE_B3A539:
	LDX $6A					;$B3A539  \
	LDA #$0100				;$B3A53B   |
	BIT $12,x				;$B3A53E   |
	BVC CODE_B3A545				;$B3A540   |
	LDA #$FF00				;$B3A542   |
CODE_B3A545:					;	   |
	LDX current_sprite			;$B3A545   |
	STA $26,x				;$B3A547   |
	STA $20,x				;$B3A549   |
	LDA #$F800				;$B3A54B   |
	STA $24,x				;$B3A54E   |
	LDA #$0004				;$B3A550   |
	STA $52,x				;$B3A553   |
	LDA #$0001				;$B3A555   |
	STA $2E,x				;$B3A558   |
	JMP CODE_B38000				;$B3A55A  /

CODE_B3A55D:
	LDX $6A					;$B3A55D  \
	LDA $12,x				;$B3A55F   |
	AND #$4000				;$B3A561   |
	LDX current_sprite			;$B3A564   |
	EOR $12,x				;$B3A566   |
	AND #$4000				;$B3A568   |
	EOR $12,x				;$B3A56B   |
	EOR #$4000				;$B3A56D   |
	STA $12,x				;$B3A570   |
	LDA #$0100				;$B3A572   |
	LDY #$F800				;$B3A575   |
	BRA CODE_B3A582				;$B3A578  /

CODE_B3A57A:
	LDX $6A					;$B3A57A  \
	LDA #$0080				;$B3A57C   |
	LDY #$FC00				;$B3A57F   |
CODE_B3A582:					;	   |
	BIT $12,x				;$B3A582   |
	BVC CODE_B3A58A				;$B3A584   |
	EOR #$FFFF				;$B3A586   |
	INC A					;$B3A589   |
CODE_B3A58A:					;	   |
	LDX current_sprite			;$B3A58A   |
	STA $26,x				;$B3A58C   |
	STA $20,x				;$B3A58E   |
	STY $24,x				;$B3A590   |
	LDA #$0004				;$B3A592   |
	STA $52,x				;$B3A595   |
	LDA #$0001				;$B3A597   |
	STA $2E,x				;$B3A59A   |
	LDA $54,x				;$B3A59C   |
	STA $8E					;$B3A59E   |
	LDY #$000A				;$B3A5A0   |
	LDA [$8E],y				;$B3A5A3   |
	BEQ CODE_B3A5AA				;$B3A5A5   |
	JSR CODE_B3A627				;$B3A5A7   |
CODE_B3A5AA:					;	   |
	JMP CODE_B38000				;$B3A5AA  /

CODE_B3A5AD:
	TYX					;$B3A5AD  \
	STZ $2E,x				;$B3A5AE   |
	JMP CODE_B38000				;$B3A5B0  /

CODE_B3A5B3:
	TYX					;$B3A5B3  \
	STZ $2E,x				;$B3A5B4   |
	JMP CODE_B38000				;$B3A5B6  /

CODE_B3A5B9:
	JSR CODE_B3A5BF				;$B3A5B9  \
	JMP CODE_B3A5F5				;$B3A5BC  /

CODE_B3A5BF:
	LDY current_sprite			;$B3A5BF  \
	CPY $0D7A				;$B3A5C1   |
	BNE CODE_B3A5D9				;$B3A5C4   |
	LDX $0593				;$B3A5C6   |
	LDA $0012,y				;$B3A5C9   |
	AND #$BFFF				;$B3A5CC   |
	EOR $12,x				;$B3A5CF   |
	AND #$BFFF				;$B3A5D1   |
	EOR $12,x				;$B3A5D4   |
	STA $0012,y				;$B3A5D6   |
CODE_B3A5D9:					;	   |
	RTS					;$B3A5D9  /

CODE_B3A5DA:
	JSR CODE_B3A5BF				;$B3A5DA  \
	JSR CODE_B3A5F5				;$B3A5DD   |
	RTS					;$B3A5E0  /

CODE_B3A5E1:
	JSR CODE_B3A5BF				;$B3A5E1  \
	JSR CODE_B3A5F5				;$B3A5E4   |
	RTS					;$B3A5E7  /

CODE_B3A5E8:
	LDX current_sprite			;$B3A5E8  \
	BIT $26,x				;$B3A5EA   |
	BPL CODE_B3A5F2				;$B3A5EC   |
	EOR #$FFFF				;$B3A5EE   |
	INC A					;$B3A5F1   |
CODE_B3A5F2:					;	   |
	STA $26,x				;$B3A5F2   |
	RTS					;$B3A5F4  /

CODE_B3A5F5:
	LDX current_sprite			;$B3A5F5  \
	CPX $0D7A				;$B3A5F7   |
	BNE CODE_B3A5FF				;$B3A5FA   |
	JSR CODE_B3A007				;$B3A5FC   |
CODE_B3A5FF:					;	   |
	RTS					;$B3A5FF  /

CODE_B3A600:
	JSR CODE_B3A604				;$B3A600  \
	RTL					;$B3A603  /

CODE_B3A604:
	CMP $0A82				;$B3A604  \
	BEQ CODE_B3A611				;$B3A607   |
	PHY					;$B3A609   |
	JSL CODE_B8D8BA				;$B3A60A   |
	PLY					;$B3A60E   |
	BCS CODE_B3A622				;$B3A60F   |
CODE_B3A611:					;	   |
	TYA					;$B3A611   |
	PHX					;$B3A612   |
	LDX $6A					;$B3A613   |
	BIT $12,x				;$B3A615   |
	PLX					;$B3A617   |
	BVC CODE_B3A61E				;$B3A618   |
	EOR #$FFFF				;$B3A61A   |
	INC A					;$B3A61D   |
CODE_B3A61E:					;	   |
	STA $0A86				;$B3A61E   |
	CLC					;$B3A621   |
CODE_B3A622:					;	   |
	RTS					;$B3A622  /

CODE_B3A623:
	JSR CODE_B3A627				;$B3A623  \
	RTL					;$B3A626  /

CODE_B3A627:
	JSL CODE_B9D0C6				;$B3A627  \
	INC $19BA				;$B3A62B   |
	JSL CODE_BBBD6B				;$B3A62E   |
	LDX current_sprite			;$B3A632   |
	STZ $56,x				;$B3A634   |
	LDA #$000F				;$B3A636   |
	STA $58,x				;$B3A639   |
	LDA $052B				;$B3A63B   |
	AND #$0400				;$B3A63E   |
	BNE CODE_B3A64A				;$B3A641   |
	LDA $12,x				;$B3A643   |
	ORA #$3000				;$B3A645   |
	STA $12,x				;$B3A648   |
CODE_B3A64A:					;	   |
	LDA #$00F4				;$B3A64A   |
	STA $02,x				;$B3A64D   |
	STZ $30,x				;$B3A64F   |
	RTS					;$B3A651  /

CODE_B3A652:
	LDX current_sprite			;$B3A652  \
	LDA #DATA_FF0224			;$B3A654   |
	STA $54,x				;$B3A657   |
	JSL CODE_BBBB69				;$B3A659   |
	BCC CODE_B3A66B				;$B3A65D   |
	LDA $052B				;$B3A65F   |
	AND #$0008				;$B3A662   |
	BNE CODE_B3A66E				;$B3A665   |
	JSL CODE_BB82B8				;$B3A667   |
CODE_B3A66B:					;	   |
	JML [$05A9]				;$B3A66B  /

CODE_B3A66E:
	JSL CODE_BCFB58				;$B3A66E  \
	JSL CODE_BCFEE0				;$B3A672   |
	LDA $DF					;$B3A676   |
	SEC					;$B3A678   |
	SBC $DB					;$B3A679   |
	CMP #$0020				;$B3A67B   |
	ROL A					;$B3A67E   |
	STA $0A40				;$B3A67F   |
	LDX current_sprite			;$B3A682   |
	LDA $06,x				;$B3A684   |
	STA $0A3E				;$B3A686   |
	JSL CODE_BB82B8				;$B3A689   |
	JSR CODE_B3A6DC				;$B3A68D   |
	JML [$05A9]				;$B3A690  /

ship_water_splash_main:
	LDX current_sprite			;$B3A693  \
	LDA $06,x				;$B3A695   |
	SEC					;$B3A697   |
	SBC $17BA				;$B3A698   |
	CLC					;$B3A69B   |
	ADC #$0020				;$B3A69C   |
	CMP #$0140				;$B3A69F   |
	BCS CODE_B3A6C4				;$B3A6A2   |
	LDA $42,x				;$B3A6A4   |
	BEQ CODE_B3A6AD				;$B3A6A6   |
	DEC $42,x				;$B3A6A8   |
	JML [$05A9]				;$B3A6AA  /

CODE_B3A6AD:
	LDA $0ADB				;$B3A6AD  \
	CLC					;$B3A6B0   |
	ADC $44,x				;$B3A6B1   |
	CMP #$0300				;$B3A6B3   |
	BCC CODE_B3A6BB				;$B3A6B6   |
	LDA #$0300				;$B3A6B8   |
CODE_B3A6BB:					;	   |
	STA $0A,x				;$B3A6BB   |
	JSL CODE_B9D100				;$B3A6BD   |
	JML [$05A9]				;$B3A6C1  /

CODE_B3A6C4:
	LDA $46,x				;$B3A6C4  \
	BMI CODE_B3A6D5				;$B3A6C6   |
	LSR A					;$B3A6C8   |
	LDA #$0560				;$B3A6C9   |
	BCC CODE_B3A6D1				;$B3A6CC   |
	LDA #$0561				;$B3A6CE   |
CODE_B3A6D1:					;	   |
	JSL queue_sound_effect			;$B3A6D1   |
CODE_B3A6D5:					;	   |
	JSL CODE_BB82B8				;$B3A6D5   |
	JML [$05A9]				;$B3A6D9  /

CODE_B3A6DC:
	LDA $0A3E				;$B3A6DC  \
	SEC					;$B3A6DF   |
	SBC $17BA				;$B3A6E0   |
	CLC					;$B3A6E3   |
	ADC #$0020				;$B3A6E4   |
	CMP #$0140				;$B3A6E7   |
	LDA #$0560				;$B3A6EA   |
	BCS CODE_B3A734				;$B3A6ED   |
	LDY current_song			;$B3A6EF   |
	LDA #$0766				;$B3A6F1   |
	CPY #$0003				;$B3A6F4   |
	BEQ CODE_B3A734				;$B3A6F7   |
	LDY #$004C				;$B3A6F9   |
	LDA $0523				;$B3A6FC   |
	CMP #$0003				;$B3A6FF   |
	BEQ CODE_B3A707				;$B3A702   |
	LDY #$000C				;$B3A704   |
CODE_B3A707:					;	   |
	JSL CODE_BB842C				;$B3A707   |
	LDX alternate_sprite			;$B3A70B   |
	LDA #$0220				;$B3A70D   |
	SEC					;$B3A710   |
	SBC $17C0				;$B3A711   |
	BPL CODE_B3A719				;$B3A714   |
	LDA #$0000				;$B3A716   |
CODE_B3A719:					;	   |
	LSR A					;$B3A719   |
	LSR A					;$B3A71A   |
	LSR A					;$B3A71B   |
	STA $42,x				;$B3A71C   |
	LSR A					;$B3A71E   |
	ADC $42,x				;$B3A71F   |
	CMP #$0030				;$B3A721   |
	BCC CODE_B3A729				;$B3A724   |
	LDA #$002F				;$B3A726   |
CODE_B3A729:					;	   |
	ADC #$00E0				;$B3A729   |
	STA $44,x				;$B3A72C   |
	LDA $0A40				;$B3A72E   |
	STA $46,x				;$B3A731   |
	RTS					;$B3A733  /

CODE_B3A734:
	JSL queue_sound_effect			;$B3A734  \
	RTS					;$B3A738  /

click_clack_main:
	JSR CODE_B3A369				;$B3A739  /

DATA_B3A73C:
	dw CODE_B3A74E
	dw CODE_B3A755
	dw CODE_B3A7B6
	dw CODE_B3A7DD
	dw CODE_B3A84A
	dw CODE_B3A8F8
	dw CODE_B3A95C
	dw CODE_B3A9CE
	dw CODE_B3AA33


CODE_B3A74E:
	TYX					;$B3A74E  \
	LDA $26,x				;$B3A74F   |
	STA $48,x				;$B3A751   |
	INC $2E,x				;$B3A753   |
CODE_B3A755:					;	   |
	LDA #$0118				;$B3A755   |
	JSL CODE_BEBE14				;$B3A758   |
	BCS CODE_B3A776				;$B3A75C   |
	JSL CODE_BCFB58				;$B3A75E   |
	LDA #$5438				;$B3A762   |
	JSL CODE_BEBE8B				;$B3A765   |
	BCS CODE_B3A776				;$B3A769   |
CODE_B3A76B:					;	   |
	JSL CODE_BEF039				;$B3A76B   |
	JSL CODE_B9D100				;$B3A76F   |
	JMP CODE_B38000				;$B3A773  /

CODE_B3A776:
	BEQ CODE_B3A7AD				;$B3A776  \
	CMP #$0001				;$B3A778   |
	BEQ CODE_B3A76B				;$B3A77B   |
	LDA #$0510				;$B3A77D   |
	JSL queue_sound_effect			;$B3A780   |
	LDX $6A					;$B3A784   |
	LDA #$0100				;$B3A786   |
	BIT $12,x				;$B3A789   |
	BVC CODE_B3A790				;$B3A78B   |
	LDA #$FF00				;$B3A78D   |
CODE_B3A790:					;	   |
	LDX current_sprite			;$B3A790   |
	STZ $26,x				;$B3A792   |
	STA $20,x				;$B3A794   |
	LDA #$FA00				;$B3A796   |
	STA $24,x				;$B3A799   |
	LDA #$001E				;$B3A79B   |
if !version == 1					;	   |
	LDA #$FF00				;$B3A79E   |
else						;	   |
	LDY #$FF00				;$B3A79E   |
endif						;	   |
	JSR CODE_B3A604				;$B3A7A1   |
	LDY #$0164				;$B3A7A4   |
	LDA #$0002				;$B3A7A7   |
	JMP CODE_B3AA58				;$B3A7AA  /

CODE_B3A7AD:
	LDA #$0100				;$B3A7AD  \
	LDY #$F800				;$B3A7B0   |
	JMP CODE_B3AA64				;$B3A7B3  /

CODE_B3A7B6:
	LDA #$0022				;$B3A7B6  \
	JSL CODE_BEF03D				;$B3A7B9   |
	JSL CODE_B9D100				;$B3A7BD   |
	LDX current_sprite			;$B3A7C1   |
	LDA $36,x				;$B3A7C3   |
	CMP #$0164				;$B3A7C5   |
	BEQ CODE_B3A7DA				;$B3A7C8   |
	INC $2E,x				;$B3A7CA   |
	LDA #$0001				;$B3A7CC   |
	ORA $30,x				;$B3A7CF   |
	STA $30,x				;$B3A7D1   |
	LDY #$0008				;$B3A7D3   |
	LDA [$8E],y				;$B3A7D6   |
	STA $4E,x				;$B3A7D8   |
CODE_B3A7DA:					;	   |
	JMP CODE_B38000				;$B3A7DA  /

CODE_B3A7DD:
	TYX					;$B3A7DD  \
	LDA $32,x				;$B3A7DE   |
	BEQ CODE_B3A7FC				;$B3A7E0   |
	STZ $32,x				;$B3A7E2   |
	BIT #$0001				;$B3A7E4   |
	BEQ CODE_B3A7FC				;$B3A7E7   |
	LDA #$0004				;$B3A7E9   |
	STA $2E,x				;$B3A7EC   |
	LDA #$FFFC				;$B3A7EE   |
	AND $30,x				;$B3A7F1   |
	STA $30,x				;$B3A7F3   |
	LDY #$000A				;$B3A7F5   |
	LDA [$8E],y				;$B3A7F8   |
	STA $4E,x				;$B3A7FA   |
CODE_B3A7FC:					;	   |
	LDA #$0118				;$B3A7FC   |
	JSL CODE_BEBE14				;$B3A7FF   |
	BCS CODE_B3A841				;$B3A803   |
	JSL CODE_BCFB58				;$B3A805   |
	LDA #$542C				;$B3A809   |
	JSL CODE_BEBE8B				;$B3A80C   |
	BCS CODE_B3A841				;$B3A810   |
	DEC $4E,x				;$B3A812   |
	BMI CODE_B3A824				;$B3A814   |
	JSL CODE_B9D100				;$B3A816   |
	LDA #$0022				;$B3A81A   |
	JSL CODE_BEF03D				;$B3A81D   |
	JMP CODE_B38000				;$B3A821  /

CODE_B3A824:
	LDX current_sprite			;$B3A824  \
	LDA $30,x				;$B3A826   |
	AND #$FFFE				;$B3A828   |
	ORA #$0002				;$B3A82B   |
	STA $30,x				;$B3A82E   |
	LDA #$000F				;$B3A830   |
	STA $4E,x				;$B3A833   |
	JSR CODE_B3AA3E				;$B3A835   |
	LDY #$0167				;$B3A838   |
	LDA #$0007				;$B3A83B   |
	JMP CODE_B3AA58				;$B3A83E  /

CODE_B3A841:
	LDA #$0100				;$B3A841  \
	LDY #$F800				;$B3A844   |
	JMP CODE_B3AA64				;$B3A847  /

CODE_B3A84A:
	TYX					;$B3A84A  \
	DEC $4E,x				;$B3A84B   |
	BNE CODE_B3A858				;$B3A84D   |
	LDA #$0167				;$B3A84F   |
	JSL CODE_B9D0C6				;$B3A852   |
	BRA CODE_B3A881				;$B3A856  /

CODE_B3A858:
	LDA #$0167				;$B3A858  \
	CMP $36,x				;$B3A85B   |
	BNE CODE_B3A881				;$B3A85D   |
	LDA $24,x				;$B3A85F   |
	BPL CODE_B3A881				;$B3A861   |
	CMP #$FC00				;$B3A863   |
	BCS CODE_B3A881				;$B3A866   |
	STZ $0D7A				;$B3A868   |
	LDA #$000F				;$B3A86B   |
	STA $4E,x				;$B3A86E   |
	LDA #$0007				;$B3A870   |
	STA $2E,x				;$B3A873   |
	LDA #$001E				;$B3A875   |
if !version == 1					;	   |
	LDA #$FE80				;$B3A878   |
else						;	   |
	LDY #$FE80				;$B3A878   |
endif						;	   |
	JSR CODE_B3A604				;$B3A87B   |
	JMP CODE_B38000				;$B3A87E  /

CODE_B3A881:
	LDX current_sprite			;$B3A881  \
	LDA $32,x				;$B3A883   |
	STZ $32,x				;$B3A885   |
	CMP #$0001				;$B3A887   |
	BEQ CODE_B3A896				;$B3A88A   |
	CMP #$0002				;$B3A88C   |
	BEQ CODE_B3A8AE				;$B3A88F   |
	CMP #$0005				;$B3A891   |
	BNE CODE_B3A8BA				;$B3A894   |
CODE_B3A896:					;	   |
	STZ $0D7A				;$B3A896   |
	LDA #$000F				;$B3A899   |
	STA $4E,x				;$B3A89C   |
	STZ $20,x				;$B3A89E   |
	STZ $26,x				;$B3A8A0   |
	JSR CODE_B3A5DA				;$B3A8A2   |
	LDA #$0003				;$B3A8A5   |
	LDY #$0166				;$B3A8A8   |
	JMP CODE_B3AA58				;$B3A8AB  /

CODE_B3A8AE:
	JSR CODE_B3A5B9				;$B3A8AE  \
	LDA #$0005				;$B3A8B1   |
	LDY #$0166				;$B3A8B4   |
	JMP CODE_B3AA58				;$B3A8B7  /

CODE_B3A8BA:
	JSR CODE_B3A5B9				;$B3A8BA  \
	JSL CODE_BCFB58				;$B3A8BD   |
	LDY $0593				;$B3A8C1   |
	LDA $0000,y				;$B3A8C4   |
	CMP #$00E8				;$B3A8C7   |
	BNE CODE_B3A8D9				;$B3A8CA   |
	LDA $09D9				;$B3A8CC   |
	SEC					;$B3A8CF   |
	SBC #$0008				;$B3A8D0   |
	STA $09D9				;$B3A8D3   |
	STA $09E9				;$B3A8D6   |
CODE_B3A8D9:					;	   |
	LDA #$1020				;$B3A8D9   |
	LDY #$0010				;$B3A8DC   |
	JSL CODE_BEBD8E				;$B3A8DF   |
	BCC CODE_B3A8F1				;$B3A8E3   |
	STZ $0D7A				;$B3A8E5   |
	LDA #$0000				;$B3A8E8   |
if !version == 1				;	   |
	LDA #$FB00				;$B3A8EB   |
else						;	   |
	LDY #$FB00				;$B3A8EB   |
endif						;	   |
	JMP CODE_B3AA64				;$B3A8EE  /

CODE_B3A8F1:
	JSL CODE_B9D100				;$B3A8F1  \
	JMP CODE_B38000				;$B3A8F5  /

CODE_B3A8F8:
	JSL CODE_B9D100				;$B3A8F8  \
	LDX current_sprite			;$B3A8FC   |
	LDA $32,x				;$B3A8FE   |
	STZ $32,x				;$B3A900   |
	CMP #$0005				;$B3A902   |
	BEQ CODE_B3A91D				;$B3A905   |
	BIT #$0006				;$B3A907   |
	BEQ CODE_B3A934				;$B3A90A   |
	LDA #$0006				;$B3A90C   |
	STA $2E,x				;$B3A90F   |
	JSR CODE_B3A5E1				;$B3A911   |
	LDA #$0200				;$B3A914   |
	JSR CODE_B3A5E8				;$B3A917   |
	JMP CODE_B38000				;$B3A91A  /

CODE_B3A91D:
	STZ $0D7A				;$B3A91D  \
	LDA #$000F				;$B3A920   |
	STA $4E,x				;$B3A923   |
	STZ $20,x				;$B3A925   |
	STZ $26,x				;$B3A927   |
	LDA #$0003				;$B3A929   |
	STA $2E,x				;$B3A92C   |
	JSR CODE_B3A5B9				;$B3A92E   |
	JMP CODE_B38000				;$B3A931  /

CODE_B3A934:
	LDA #$0118				;$B3A934  \
	JSL CODE_BEBE14				;$B3A937   |
	BCS CODE_B3A953				;$B3A93B   |
	JSL CODE_BCFB58				;$B3A93D   |
	LDA #$1020				;$B3A941   |
	LDY #$0010				;$B3A944   |
	JSL CODE_BEBD8E				;$B3A947   |
	BCS CODE_B3A953				;$B3A94B   |
	JSR CODE_B3A5B9				;$B3A94D   |
	JMP CODE_B38000				;$B3A950  /

CODE_B3A953:
	LDA #$0040				;$B3A953  \
	LDY #$FB00				;$B3A956   |
	JMP CODE_B3AA64				;$B3A959  /

CODE_B3A95C:
	LDA #$0118				;$B3A95C  \
	JSL CODE_BEBE14				;$B3A95F   |
	BCS CODE_B3A98D				;$B3A963   |
	JSL CODE_BCFB58				;$B3A965   |
	LDA #$1020				;$B3A969   |
	LDY #$0008				;$B3A96C   |
	JSL CODE_BEBD8E				;$B3A96F   |
	BCS CODE_B3A98D				;$B3A973   |
	LDA #$0022				;$B3A975   |
	JSL CODE_BEF03D				;$B3A978   |
	LDA $1E,x				;$B3A97C   |
	BIT #$0003				;$B3A97E   |
	BNE CODE_B3A99F				;$B3A981   |
	JSL CODE_B9D100				;$B3A983   |
	JSR CODE_B3A3EB				;$B3A987   |
	JML [$05A9]				;$B3A98A  /

CODE_B3A98D:
	LDX current_sprite			;$B3A98D  \
	LDA $20,x				;$B3A98F   |
	CMP #$8000				;$B3A991   |
	ROR A					;$B3A994   |
	CMP #$8000				;$B3A995   |
	ROR A					;$B3A998   |
	LDY #$FB00				;$B3A999   |
	JMP CODE_B3AA6E				;$B3A99C  /

CODE_B3A99F:
	LDA $06,x				;$B3A99F  \
	STA $0A3E				;$B3A9A1   |
	LDA $0A,x				;$B3A9A4   |
	SBC #$0008				;$B3A9A6   |
	STA $0A40				;$B3A9A9   |
	LDY #$0034				;$B3A9AC   |
	JSL CODE_BB842C				;$B3A9AF   |
	LDX current_sprite			;$B3A9B3   |
	STZ $20,x				;$B3A9B5   |
	STZ $26,x				;$B3A9B7   |
	STZ $4E,x				;$B3A9B9   |
	JSR CODE_B3AA3E				;$B3A9BB   |
	LDA #$0510				;$B3A9BE   |
	JSL queue_sound_effect			;$B3A9C1   |
	LDY #$0167				;$B3A9C5   |
	LDA #$0007				;$B3A9C8   |
	JMP CODE_B3AA58				;$B3A9CB  /

CODE_B3A9CE:
	TYX					;$B3A9CE  \
	LDA $4E,x				;$B3A9CF   |
	DEC A					;$B3A9D1   |
	BMI CODE_B3A9D8				;$B3A9D2   |
	STA $4E,x				;$B3A9D4   |
	BRA CODE_B3AA0B				;$B3A9D6  /

CODE_B3A9D8:
	LDA #$0118				;$B3A9D8  \
	JSL CODE_BEBE14				;$B3A9DB   |
	BCS CODE_B3A9EE				;$B3A9DF   |
	JSL CODE_BCFB58				;$B3A9E1   |
	LDA #$542B				;$B3A9E5   |
	JSL CODE_BEBE8B				;$B3A9E8   |
	BCC CODE_B3AA0B				;$B3A9EC   |
CODE_B3A9EE:					;	   |
	BEQ CODE_B3AA02				;$B3A9EE   |
	LDX current_sprite			;$B3A9F0   |
	LDA #$003C				;$B3A9F2   |
	STA $4E,x				;$B3A9F5   |
	LDA #$001E				;$B3A9F7   |
if !version == 1				;	   |
	LDA #$FF00				;$B3A9FA   |
else						;	   |
	LDY #$FF00				;$B3A9FA   |
endif						;	   |
	JSR CODE_B3A604				;$B3A9FD   |
	BRA CODE_B3AA0B				;$B3AA00  /

CODE_B3AA02:
	LDA #$0040				;$B3AA02  \
	LDY #$FB00				;$B3AA05   |
	JMP CODE_B3AA64				;$B3AA08  /

CODE_B3AA0B:
	LDA #$0022				;$B3AA0B  \
	JSL CODE_BEF03D				;$B3AA0E   |
	JSL CODE_B9D100				;$B3AA12   |
	LDX current_sprite			;$B3AA16   |
	LDA $36,x				;$B3AA18   |
	CMP #$0163				;$B3AA1A   |
	BNE CODE_B3AA30				;$B3AA1D   |
	LDA $48,x				;$B3AA1F   |
	BIT $12,x				;$B3AA21   |
	BVC CODE_B3AA29				;$B3AA23   |
	EOR #$FFFF				;$B3AA25   |
	INC A					;$B3AA28   |
CODE_B3AA29:					;	   |
	STA $26,x				;$B3AA29   |
	LDA #$0001				;$B3AA2B   |
	STA $2E,x				;$B3AA2E   |
CODE_B3AA30:					;	   |
	JMP CODE_B38000				;$B3AA30  /

CODE_B3AA33:
	JSL CODE_BEF039				;$B3AA33  \
	JSL CODE_B9D100				;$B3AA37   |
	JMP CODE_B3A652				;$B3AA3B  /

CODE_B3AA3E:
	LDX current_sprite			;$B3AA3E  \
	LDA $48,x				;$B3AA40   |
	BPL CODE_B3AA4A				;$B3AA42   |
	EOR #$FFFF				;$B3AA44   |
	INC A					;$B3AA47   |
	STA $48,x				;$B3AA48   |
CODE_B3AA4A:					;	   |
	CLC					;$B3AA4A   |
	ADC $48,x				;$B3AA4B   |
	CMP #$0600				;$B3AA4D   |
	BCC CODE_B3AA55				;$B3AA50   |
	LDA #$0600				;$B3AA52   |
CODE_B3AA55:					;	   |
	STA $48,x				;$B3AA55   |
	RTS					;$B3AA57  /

CODE_B3AA58:
	LDX current_sprite			;$B3AA58  \
	STA $2E,x				;$B3AA5A   |
	TYA					;$B3AA5C   |
	JSL CODE_B9D0C6				;$B3AA5D   |
	JMP CODE_B38000				;$B3AA61  /

CODE_B3AA64:
	LDX $6A					;$B3AA64  \
	BIT $12,x				;$B3AA66   |
	BVC CODE_B3AA6E				;$B3AA68   |
	EOR #$FFFF				;$B3AA6A   |
	INC A					;$B3AA6D   |
CODE_B3AA6E:					;	   |
	LDX current_sprite			;$B3AA6E   |
	STA $26,x				;$B3AA70   |
	STZ $20,x				;$B3AA72   |
	STY $24,x				;$B3AA74   |
	LDA #$0004				;$B3AA76   |
	STA $52,x				;$B3AA79   |
	STZ $30,x				;$B3AA7B   |
	LDA #$0008				;$B3AA7D   |
	STA $2E,x				;$B3AA80   |
	LDA #$0164				;$B3AA82   |
	JSR CODE_B3A627				;$B3AA85   |
	LDA #$0510				;$B3AA88   |
	JSL queue_sound_effect			;$B3AA8B   |
	JMP CODE_B38000				;$B3AA8F  /

klobber_main:
	JSR CODE_B3A369				;$B3AA92  /

DATA_B3AA95:
	dw CODE_B3AA9F
	dw CODE_B3ABA9
	dw CODE_B3ABB6
	dw CODE_B3ABB6
	dw CODE_B3ABD8

CODE_B3AA9F:
	TAX					;$B3AA9F  \
	JMP (DATA_B3AAA3,x)			;$B3AAA0  /

DATA_B3AAA3:
	dw CODE_B3AAA9
	dw CODE_B3AAB4
	dw CODE_B3AAD6


CODE_B3AAA9:
	LDX current_sprite			;$B3AAA9  \
	LDA $22,x				;$B3AAAB   |
	STA $04,x				;$B3AAAD   |
	LDA #$000C				;$B3AAAF   |
	STA $52,x				;$B3AAB2   |
CODE_B3AAB4:					;	   |
	LDX current_sprite			;$B3AAB4   |
	STZ $20,x				;$B3AAB6   |
	STZ $26,x				;$B3AAB8   |
	STZ $2C,x				;$B3AABA   |
	LDA #$0021				;$B3AABC   |
	ORA $30,x				;$B3AABF   |
	STA $30,x				;$B3AAC1   |
	STZ $42,x				;$B3AAC3   |
	LDA #$0200				;$B3AAC5   |
	STA $2E,x				;$B3AAC8   |
	STZ $26,x				;$B3AACA   |
	LDA #$02E2				;$B3AACC   |
	JSL CODE_B9D0C6				;$B3AACF   |
	JML [$05A9]				;$B3AAD3  /

CODE_B3AAD6:
	LDA #$0118				;$B3AAD6  \
	JSL CODE_BEBE14				;$B3AAD9   |
	BCC CODE_B3AAE1				;$B3AADD   |
	BEQ CODE_B3AB28				;$B3AADF   |
CODE_B3AAE1:					;	   |
	LDA $5E					;$B3AAE1   |
	STA $32,x				;$B3AAE3   |
	JSR CODE_B39F10				;$B3AAE5   |
	BCS CODE_B3AB5E				;$B3AAE8   |
	LDY $0593				;$B3AAEA   |
	LDA $0040,y				;$B3AAED   |
	AND #$E000				;$B3AAF0   |
	CMP #$E000				;$B3AAF3   |
	BEQ CODE_B3AB17				;$B3AAF6   |
	CMP #$A000				;$B3AAF8   |
	BNE CODE_B3AB0A				;$B3AAFB   |
	JSL CODE_BCFB58				;$B3AAFD   |
	LDA #$5004				;$B3AB01   |
	JSL CODE_BEBE8B				;$B3AB04   |
	BCS CODE_B3AB28				;$B3AB08   |
CODE_B3AB0A:					;	   |
	JSL CODE_BEF039				;$B3AB0A   |
	JSR CODE_B3A3A3				;$B3AB0E   |
	BCC CODE_B3AB28				;$B3AB11   |
	LDA $52,x				;$B3AB13   |
	BEQ CODE_B3AB61				;$B3AB15   |
CODE_B3AB17:					;	   |
	JSR CODE_B39ECC				;$B3AB17   |
	JSR CODE_B39EBE				;$B3AB1A   |
	JSL CODE_B8D5E0				;$B3AB1D   |
	JSL CODE_B9D100				;$B3AB21   |
	JMP CODE_B38000				;$B3AB25  /

CODE_B3AB28:
	LDA $4E,x				;$B3AB28  \
	BNE CODE_B3AB4F				;$B3AB2A   |
	LDA #$0414				;$B3AB2C   |
	JSL queue_sound_effect			;$B3AB2F   |
	LDA #$0615				;$B3AB33   |
	JSL queue_sound_effect			;$B3AB36   |
	LDY #$00E4				;$B3AB3A   |
	JSL CODE_BB83EF				;$B3AB3D   |
	LDY #$00E6				;$B3AB41   |
	JSL CODE_BB83EF				;$B3AB44   |
	JSL CODE_BB82B8				;$B3AB48   |
	JML [$05A9]				;$B3AB4C  /

CODE_B3AB4F:
	LDA #$051A				;$B3AB4F  \
	JSL queue_sound_effect			;$B3AB52   |
	JSL CODE_B3975C				;$B3AB56   |
	JSL CODE_BB82B8				;$B3AB5A   |
CODE_B3AB5E:					;	   |
	JML [$05A9]				;$B3AB5E  /

CODE_B3AB61:
	LDY $46,x				;$B3AB61  \
	JSL CODE_BB842C				;$B3AB63   |
	BCS CODE_B3AB5E				;$B3AB67   |
	LDX current_sprite			;$B3AB69   |
	LDY alternate_sprite			;$B3AB6B   |
	STY $42,x				;$B3AB6D   |
	STX $42,y				;$B3AB6F   |
	STZ $44,x				;$B3AB71   |
	LDA #$0004				;$B3AB73   |
	STA $2E,x				;$B3AB76   |
	LDA $30,x				;$B3AB78   |
	AND #$0022				;$B3AB7A   |
	STZ $30,x				;$B3AB7D   |
	LDA $54,x				;$B3AB7F   |
	STA $0054,y				;$B3AB81   |
	LDA $0012,y				;$B3AB84   |
	AND #$BFFF				;$B3AB87   |
	EOR $12,x				;$B3AB8A   |
	AND #$BFFF				;$B3AB8C   |
	EOR $12,x				;$B3AB8F   |
	STA $0012,y				;$B3AB91   |
	LDA #$0000				;$B3AB94   |
	STA $0048,y				;$B3AB97   |
	LDA $4E,x				;$B3AB9A   |
	STA $004E,y				;$B3AB9C   |
	LDA #$01F4				;$B3AB9F   |
	JSL CODE_B9D09B				;$B3ABA2   |
	JML [$05A9]				;$B3ABA6  /

CODE_B3ABA9:
	LDA $004E,y				;$B3ABA9  \
	BEQ CODE_B3ABB2				;$B3ABAC   |
	JML barrel_main				;$B3ABAE  /

CODE_B3ABB2:
	JML tntbarrel_main			;$B3ABB2  /

CODE_B3ABB6:
	LDA #$8000				;$B3ABB6  \
	ORA $002E,y				;$B3ABB9   |
	STA $002E,y				;$B3ABBC   |
	LDA $004E,y				;$B3ABBF   |
	BEQ CODE_B3ABCE				;$B3ABC2   |
	LDA #$01A4				;$B3ABC4   |
	STA $0000,y				;$B3ABC7   |
	JML barrel_main				;$B3ABCA  /

CODE_B3ABCE:
	LDA #$01B8				;$B3ABCE  \
	STA $0000,y				;$B3ABD1   |
	JML tntbarrel_main			;$B3ABD4  /

CODE_B3ABD8:
	LDX current_sprite			;$B3ABD8  \
	LDY $42,x				;$B3ABDA   |
	JSR CODE_B3ABE2				;$B3ABDC   |
	JML [$05A9]				;$B3ABDF  /

CODE_B3ABE2:
	LDA $44,x				;$B3ABE2  \
	JSR CODE_B3AC08				;$B3ABE4   |
	CLC					;$B3ABE7   |
	ADC $000A,y				;$B3ABE8   |
	STA $0A,x				;$B3ABEB   |
	LDA $45,x				;$B3ABED   |
	JSR CODE_B3AC08				;$B3ABEF   |
	CLC					;$B3ABF2   |
	ADC $0006,y				;$B3ABF3   |
	STA $06,x				;$B3ABF6   |
	LDA $0012,y				;$B3ABF8   |
	AND #$4000				;$B3ABFB   |
	EOR $12,x				;$B3ABFE   |
	AND #$4000				;$B3AC00   |
	EOR $12,x				;$B3AC03   |
	STA $12,x				;$B3AC05   |
	RTS					;$B3AC07  /

CODE_B3AC08:
	BIT #$0080				;$B3AC08  \
	BNE CODE_B3AC11				;$B3AC0B   |
	AND #$00FF				;$B3AC0D   |
	RTS					;$B3AC10  /

CODE_B3AC11:
	ORA #$FF00				;$B3AC11  \
	RTS					;$B3AC14  /

unknown_sprite_01E8_main:
	JSR CODE_B3A369				;$B3AC15  /

DATA_B3AC18:
	dw CODE_B3AC22
	dw CODE_B3AC77
	dw CODE_B3ACF1
	dw CODE_B3AD3E
	dw CODE_B3ADAF

CODE_B3AC22:
	JSR CODE_B3AF78				;$B3AC22  \
	BCS CODE_B3AC2D				;$B3AC25   |
	JSR CODE_B3AF8F				;$B3AC27   |
	JML [$05A9]				;$B3AC2A   |
CODE_B3AC2D:					;	   |
	JSR CODE_B3AE03				;$B3AC2D   |
	BMI CODE_B3AC41				;$B3AC30   |
	BEQ CODE_B3AC3E				;$B3AC32   |
	LDA $3A,x				;$B3AC34   |
	LSR A					;$B3AC36   |
	CLC					;$B3AC37   |
	ADC $3A,x				;$B3AC38   |
	STA $3A,x				;$B3AC3A   |
	BRA CODE_B3AC74				;$B3AC3C  /

CODE_B3AC3E:
	JSR CODE_B3AE85				;$B3AC3E  \
CODE_B3AC41:					;	   |
	JSR CODE_B39EF8				;$B3AC41   |
	JSL CODE_B8D5E0				;$B3AC44   |
	JSL CODE_B9D100				;$B3AC48   |
	LDX current_sprite			;$B3AC4C   |
	LDA $36,x				;$B3AC4E   |
	CMP #$01F5				;$B3AC50   |
	BNE CODE_B3AC74				;$B3AC53   |
	STZ $46,x				;$B3AC55   |
	INC $2E,x				;$B3AC57   |
	LDY $0593				;$B3AC59   |
	LDA $06,x				;$B3AC5C   |
	SEC					;$B3AC5E   |
	SBC $0006,y				;$B3AC5F   |
	ROR A					;$B3AC62   |
	LSR A					;$B3AC63   |
	EOR $12,x				;$B3AC64   |
	AND #$4000				;$B3AC66   |
	BEQ CODE_B3AC74				;$B3AC69   |
	STZ $26,x				;$B3AC6B   |
	LDA #$01F6				;$B3AC6D   |
	JSL CODE_B9D0C6				;$B3AC70   |
CODE_B3AC74:					;	   |
	BRL CODE_B3ADA2				;$B3AC74  /

CODE_B3AC77:
	JSR CODE_B3AF78				;$B3AC77  \
	BCS CODE_B3AC82				;$B3AC7A   |
	JSR CODE_B3AF8F				;$B3AC7C   |
	JML [$05A9]				;$B3AC7F  /

CODE_B3AC82:
	LDA $0046,y				;$B3AC82  \
	CLC					;$B3AC85   |
	ADC #$0400				;$B3AC86   |
	BCC CODE_B3AC91				;$B3AC89   |
	AND #$00FF				;$B3AC8B   |
	BEQ CODE_B3AC91				;$B3AC8E   |
	DEC A					;$B3AC90   |
CODE_B3AC91:					;	   |
	STA $0046,y				;$B3AC91   |
	JSR CODE_B3AE03				;$B3AC94   |
	BMI CODE_B3ACA9				;$B3AC97   |
	BEQ CODE_B3AC9E				;$B3AC99   |
	BRL CODE_B3AD71				;$B3AC9B  /

CODE_B3AC9E:
	JSR CODE_B3AE85				;$B3AC9E  \
	BCS CODE_B3ACA6				;$B3ACA1   |
	BRL CODE_B3AD71				;$B3ACA3  /

CODE_B3ACA6:
	JML [$05A9]				;$B3ACA6  /

CODE_B3ACA9:
	LDA $4A,x				;$B3ACA9  \
	BNE CODE_B3ACB7				;$B3ACAB   |
	LDA $3A,x				;$B3ACAD   |
	CMP #$0101				;$B3ACAF   |
	BCC CODE_B3ACBB				;$B3ACB2   |
	SBC #$0006				;$B3ACB4   |
CODE_B3ACB7:					;	   |
	STA $3A,x				;$B3ACB7   |
	STZ $4A,x				;$B3ACB9   |
CODE_B3ACBB:					;	   |
	LDY $0593				;$B3ACBB   |
	LDA $0006,y				;$B3ACBE   |
	SEC					;$B3ACC1   |
	SBC $06,x				;$B3ACC2   |
	CMP #$0010				;$B3ACC4   |
	BCC CODE_B3ACDA				;$B3ACC7   |
	CMP #$FFF0				;$B3ACC9   |
	BCS CODE_B3ACDA				;$B3ACCC   |
	EOR $26,x				;$B3ACCE   |
	BPL CODE_B3ACDA				;$B3ACD0   |
	LDA $26,x				;$B3ACD2   |
	EOR #$FFFF				;$B3ACD4   |
	INC A					;$B3ACD7   |
	STA $26,x				;$B3ACD8   |
CODE_B3ACDA:					;	   |
	LDA $26,x				;$B3ACDA   |
	EOR $20,x				;$B3ACDC   |
	ASL A					;$B3ACDE   |
	LDY #$0008				;$B3ACDF   |
	LDA [$8E],y				;$B3ACE2   |
	BCC CODE_B3ACE7				;$B3ACE4   |
	XBA					;$B3ACE6   |
CODE_B3ACE7:					;	   |
	AND #$00FF				;$B3ACE7   |
	JSL CODE_B8D010				;$B3ACEA   |
	BRL CODE_B3AD71				;$B3ACEE  /

CODE_B3ACF1:
	JSR CODE_B3AF78				;$B3ACF1  \
	BCS CODE_B3ACFC				;$B3ACF4   |
	JSR CODE_B3AF8F				;$B3ACF6   |
	JML [$05A9]				;$B3ACF9  /

CODE_B3ACFC:
	JSR CODE_B3AE03				;$B3ACFC  \
	BMI CODE_B3AD0E				;$B3ACFF   |
	BEQ CODE_B3AD06				;$B3AD01   |
	BRL CODE_B3AD71				;$B3AD03  /

CODE_B3AD06:
	JSR CODE_B3AE85				;$B3AD06  \
	BCC CODE_B3AD71				;$B3AD09   |
	JML [$05A9]				;$B3AD0B  /

CODE_B3AD0E:
	TYX					;$B3AD0E  \
	DEC $4C,x				;$B3AD0F   |
	BPL CODE_B3AD18				;$B3AD11   |
	JSR CODE_B3AE72				;$B3AD13   |
	BEQ CODE_B3AD22				;$B3AD16   |
CODE_B3AD18:					;	   |
	LDA #$0008				;$B3AD18   |
	JSL CODE_B8D010				;$B3AD1B   |
	BRL CODE_B3AD71				;$B3AD1F  /

CODE_B3AD22:
	LDA #$0001				;$B3AD22  \
	STA $2E,x				;$B3AD25   |
	LDY #$0006				;$B3AD27   |
	LDA [$8E],y				;$B3AD2A   |
	BIT $12,x				;$B3AD2C   |
	BVC CODE_B3AD34				;$B3AD2E   |
	EOR #$FFFF				;$B3AD30   |
	INC A					;$B3AD33   |
CODE_B3AD34:					;	   |
	STA $26,x				;$B3AD34   |
	LDA #$0200				;$B3AD36   |
	STA $3A,x				;$B3AD39   |
	BRL CODE_B3AD71				;$B3AD3B  /

CODE_B3AD3E:
	JSR CODE_B3AF78				;$B3AD3E  \
	BCS CODE_B3AD49				;$B3AD41   |
	JSR CODE_B3AF8F				;$B3AD43   |
	JML [$05A9]				;$B3AD46  /

CODE_B3AD49:
	JSR CODE_B39EF8				;$B3AD49  \
	JSL CODE_B8D5E0				;$B3AD4C   |
	JSL CODE_B9D100				;$B3AD50   |
	LDY current_sprite			;$B3AD54   |
	LDX $42,y				;$B3AD56   |
	JSR CODE_B3ABE2				;$B3AD58   |
	LDA $001A,y				;$B3AD5B   |
	BNE CODE_B3AD6E				;$B3AD5E   |
	STZ $2E,x				;$B3AD60   |
	LDA $0030,y				;$B3AD62   |
	AND #$0002				;$B3AD65   |
	STA $30,x				;$B3AD68   |
	JSL CODE_BB82B8				;$B3AD6A   |
CODE_B3AD6E:					;	   |
	JML [$05A9]				;$B3AD6E  /

CODE_B3AD71:
	JSR CODE_B39EF8				;$B3AD71  \
	LDA $26,x				;$B3AD74   |
	LDY $20,x				;$B3AD76   |
	PHA					;$B3AD78   |
	PHY					;$B3AD79   |
	JSL CODE_B8D5E0				;$B3AD7A   |
	PLY					;$B3AD7E   |
	PLA					;$B3AD7F   |
	CMP $26,x				;$B3AD80   |
	BEQ CODE_B3AD9E				;$B3AD82   |
	STA $26,x				;$B3AD84   |
	STY $20,x				;$B3AD86   |
	EOR $20,x				;$B3AD88   |
	BPL CODE_B3AD95				;$B3AD8A   |
	TYA					;$B3AD8C   |
	CMP #$8000				;$B3AD8D   |
	ROR A					;$B3AD90   |
	STA $20,x				;$B3AD91   |
	BRA CODE_B3AD9E				;$B3AD93  /

CODE_B3AD95:
	LDA #$051A				;$B3AD95  \
	JSR CODE_B3A400				;$B3AD98   |
	JSR CODE_B3AF28				;$B3AD9B   |
CODE_B3AD9E:					;	   |
	JSL CODE_B9D100				;$B3AD9E   |
CODE_B3ADA2:					;	   |
	LDY current_sprite			;$B3ADA2   |
	LDX $42,y				;$B3ADA4   |
	JSR CODE_B3ABE2				;$B3ADA6   |
	JSR CODE_B3ADD9				;$B3ADA9   |
	JML [$05A9]				;$B3ADAC  /

CODE_B3ADAF:
	JSL CODE_BEF039				;$B3ADAF  \
	JSL CODE_B9D100				;$B3ADB3   |
	LDY current_sprite			;$B3ADB7   |
	LDX $42,y				;$B3ADB9   |
	JSR CODE_B3ABE2				;$B3ADBB   |
	JSL CODE_BBBB69				;$B3ADBE   |
	BCC CODE_B3ADD6				;$B3ADC2   |
	LDX current_sprite			;$B3ADC4   |
	PHX					;$B3ADC6   |
	LDA $42,x				;$B3ADC7   |
	STA current_sprite			;$B3ADC9   |
	JSL CODE_BB82B8				;$B3ADCB   |
	PLX					;$B3ADCF   |
	STX current_sprite			;$B3ADD0   |
	JSL CODE_BB82B8				;$B3ADD2   |
CODE_B3ADD6:					;	   |
	JML [$05A9]				;$B3ADD6  /

CODE_B3ADD9:
	LDX #$0200				;$B3ADD9  \
	LDY #$0100				;$B3ADDC   |
	JSR CODE_B3AFD7				;$B3ADDF   |
	BCC CODE_B3AE02				;$B3ADE2   |
	LDX current_sprite			;$B3ADE4   |
	PHX					;$B3ADE6   |
	LDA $42,x				;$B3ADE7   |
	STA current_sprite			;$B3ADE9   |
	JSL CODE_BBBB7B				;$B3ADEB   |
	BCC CODE_B3ADFF				;$B3ADEF   |
	JSL CODE_BBBB44				;$B3ADF1   |
	BCC CODE_B3ADFF				;$B3ADF5   |
	PLX					;$B3ADF7   |
	STX current_sprite			;$B3ADF8   |
	JSL CODE_BB82B8				;$B3ADFA   |
	RTS					;$B3ADFE  /

CODE_B3ADFF:
	PLX					;$B3ADFF  \
	STX current_sprite			;$B3AE00   |
CODE_B3AE02:					;	   |
	RTS					;$B3AE02  /

CODE_B3AE03:
	LDA #$0118				;$B3AE03  \
	JSL CODE_BEBE14				;$B3AE06   |
	BCS CODE_B3AE5C				;$B3AE0A   |
	LDA $48,x				;$B3AE0C   |
	BEQ CODE_B3AE16				;$B3AE0E   |
	DEC $48,x				;$B3AE10   |
CODE_B3AE12:					;	   |
	LDA #$FFFF				;$B3AE12   |
	RTS					;$B3AE15  /

CODE_B3AE16:
	JSL CODE_BCFB58				;$B3AE16  \
	LDX current_sprite			;$B3AE1A   |
	LDA $19CE				;$B3AE1C   |
	BEQ CODE_B3AE2B				;$B3AE1F   |
	JSL CODE_BEBE6D				;$B3AE21   |
	BCC CODE_B3AE12				;$B3AE25   |
	LDA #$0000				;$B3AE27   |
	RTS					;$B3AE2A  /

CODE_B3AE2B:
	JSR CODE_B3AE72				;$B3AE2B  \
	BNE CODE_B3AE38				;$B3AE2E   |
	LDA $0030,y				;$B3AE30   |
	AND #$0080				;$B3AE33   |
	BEQ CODE_B3AE3D				;$B3AE36   |
CODE_B3AE38:					;	   |
	LDA #$5429				;$B3AE38   |
	BRA CODE_B3AE4B				;$B3AE3B  /

CODE_B3AE3D:
	LDA #$746B				;$B3AE3D  \
	LDY $4E,x				;$B3AE40   |
	BNE CODE_B3AE4B				;$B3AE42   |
	LDY $2E,x				;$B3AE44   |
	BEQ CODE_B3AE4B				;$B3AE46   |
	LDA #$4408				;$B3AE48   |
CODE_B3AE4B:					;	   |
	JSL CODE_BEBE8B				;$B3AE4B   |
	BCC CODE_B3AE12				;$B3AE4F   |
	BEQ CODE_B3AE5C				;$B3AE51   |
	LDA #$000F				;$B3AE53   |
	STA $48,x				;$B3AE56   |
	LDA #$0000				;$B3AE58   |
	RTS					;$B3AE5B  /

CODE_B3AE5C:
	LDA #$0003				;$B3AE5C  \
	STA $2E,x				;$B3AE5F   |
	STZ $26,x				;$B3AE61   |
	STZ $20,x				;$B3AE63   |
	STZ $2C,x				;$B3AE65   |
	LDA $30,x				;$B3AE67   |
	AND #$0002				;$B3AE69   |
	STA $30,x				;$B3AE6C   |
	LDA #$0001				;$B3AE6E   |
	RTS					;$B3AE71  /

CODE_B3AE72:
	LDY $0593				;$B3AE72  \
	LDA $002E,y				;$B3AE75   |
	ASL A					;$B3AE78   |
	ASL A					;$B3AE79   |
	TAX					;$B3AE7A   |
	LDA.l DATA_B896B7,x			;$B3AE7B   |
	LDX current_sprite			;$B3AE7F   |
	AND #$0040				;$B3AE81   |
	RTS					;$B3AE84  /

CODE_B3AE85:
	LDA $19CE				;$B3AE85  \
	BEQ CODE_B3AE8F				;$B3AE88   |
	JSR CODE_B3AF8F				;$B3AE8A   |
	SEC					;$B3AE8D   |
	RTS					;$B3AE8E  /

CODE_B3AE8F:
	LDX current_sprite			;$B3AE8F  \
	LDA $2E,x				;$B3AE91   |
	BEQ CODE_B3AEF7				;$B3AE93   |
	LDA $4E,x				;$B3AE95   |
	BEQ CODE_B3AEFA				;$B3AE97   |
	CMP #$0002				;$B3AE99   |
	BCC CODE_B3AEF7				;$B3AE9C   |
	BEQ CODE_B3AEC6				;$B3AE9E   |
	LDA $08BE				;$B3AEA0   |
	BEQ CODE_B3AEF7				;$B3AEA3   |
	CMP $08C0				;$B3AEA5   |
	BNE CODE_B3AF28				;$B3AEA8   |
	LDA $19BC				;$B3AEAA   |
	CMP #$0003				;$B3AEAD   |
	BCS CODE_B3AEF7				;$B3AEB0   |
	LDY #$0040				;$B3AEB2   |
	JSR CODE_B3AFC2				;$B3AEB5   |
	JSL CODE_BEC678				;$B3AEB8   |
	LDX current_sprite			;$B3AEBC   |
	LDA #$0003				;$B3AEBE   |
	STA $46,x				;$B3AEC1   |
	BRL CODE_B3AF28				;$B3AEC3  /

CODE_B3AEC6:
	LDA $096D				;$B3AEC6  \
	BEQ CODE_B3AF28				;$B3AEC9   |
	LDY #$0042				;$B3AECB   |
	JSR CODE_B3AFC2				;$B3AECE   |
	BCS CODE_B3AEF7				;$B3AED1   |
	SED					;$B3AED3   |
	LDA $096D				;$B3AED4   |
	CMP #$0010				;$B3AED7   |
	BCC CODE_B3AEDF				;$B3AEDA   |
	LDA #$0010				;$B3AEDC   |
CODE_B3AEDF:					;	   |
	STA $004E,y				;$B3AEDF   |
	LDA $096D				;$B3AEE2   |
	SEC					;$B3AEE5   |
	SBC $004E,y				;$B3AEE6   |
	STA $096D				;$B3AEE9   |
	LDA $08BC				;$B3AEEC   |
	SEC					;$B3AEEF   |
	SBC $004E,y				;$B3AEF0   |
	STA $08BC				;$B3AEF3   |
	CLD					;$B3AEF6   |
CODE_B3AEF7:					;	   |
	BRL CODE_B3AF28				;$B3AEF7  /

CODE_B3AEFA:
	PHX					;$B3AEFA  \
	LDA $42,x				;$B3AEFB   |
	STA current_sprite			;$B3AEFD   |
	JSL CODE_BB82B8				;$B3AEFF   |
	PLX					;$B3AF03   |
	STX current_sprite			;$B3AF04   |
	LDA #$0414				;$B3AF06   |
	JSL queue_sound_effect			;$B3AF09   |
	LDA #$0615				;$B3AF0D   |
	JSL queue_sound_effect			;$B3AF10   |
	LDY #$00E4				;$B3AF14   |
	JSL CODE_BB83EF				;$B3AF17   |
	LDY #$00E6				;$B3AF1B   |
	JSL CODE_BB83EF				;$B3AF1E   |
	JSL CODE_BB82B8				;$B3AF22   |
	SEC					;$B3AF26   |
	RTS					;$B3AF27  /

CODE_B3AF28:
	LDX current_sprite			;$B3AF28  \
	BIT $12,x				;$B3AF2A   |
	BVS CODE_B3AF37				;$B3AF2C   |
	LDA #$0200				;$B3AF2E   |
	CMP $20,x				;$B3AF31   |
	BCS CODE_B3AF45				;$B3AF33   |
	BRA CODE_B3AF47				;$B3AF35  /

CODE_B3AF37:
	LDA $20,x				;$B3AF37  \
	CMP #$0001				;$B3AF39   |
	LDA #$FE00				;$B3AF3C   |
	BCC CODE_B3AF45				;$B3AF3F   |
	CMP $20,x				;$B3AF41   |
	BCS CODE_B3AF47				;$B3AF43   |
CODE_B3AF45:					;	   |
	STA $20,x				;$B3AF45   |
CODE_B3AF47:					;	   |
	LDA #$0002				;$B3AF47   |
	STA $2E,x				;$B3AF4A   |
	LDA $20,x				;$B3AF4C   |
	EOR #$FFFF				;$B3AF4E   |
	INC A					;$B3AF51   |
	STA $20,x				;$B3AF52   |
	STZ $26,x				;$B3AF54   |
	INC $46,x				;$B3AF56   |
	LDA $46,x				;$B3AF58   |
	AND #$00FF				;$B3AF5A   |
	CMP #$0003				;$B3AF5D   |
	LDA #$001E				;$B3AF60   |
	BCC CODE_B3AF6A				;$B3AF63   |
	STZ $46,x				;$B3AF65   |
	LDA #$005A				;$B3AF67   |
CODE_B3AF6A:					;	   |
	STA $4C,x				;$B3AF6A   |
	LDA #$0001				;$B3AF6C   |
	STA $50,x				;$B3AF6F   |
	LDA #$FC00				;$B3AF71   |
	STA $24,x				;$B3AF74   |
	CLC					;$B3AF76   |
	RTS					;$B3AF77  /

CODE_B3AF78:
	JSR CODE_B3A3A3				;$B3AF78  \
	BCC CODE_B3AF8E				;$B3AF7B   |
	LDX current_sprite			;$B3AF7D   |
	LDA $1E,x				;$B3AF7F   |
	AND #$0001				;$B3AF81   |
	BEQ CODE_B3AF8E				;$B3AF84   |
	LDA $10,x				;$B3AF86   |
	BIT #$0100				;$B3AF88   |
	BEQ CODE_B3AF8E				;$B3AF8B   |
	CLC					;$B3AF8D   |
CODE_B3AF8E:					;	   |
	RTS					;$B3AF8E  /

CODE_B3AF8F:
	LDX $6A					;$B3AF8F  \
	LDA $12,x				;$B3AF91   |
	AND #$4000				;$B3AF93   |
	LDX current_sprite			;$B3AF96   |
	EOR $12,x				;$B3AF98   |
	AND #$4000				;$B3AF9A   |
	EOR $12,x				;$B3AF9D   |
	EOR #$4000				;$B3AF9F   |
	STA $12,x				;$B3AFA2   |
	LDA #$0100				;$B3AFA4   |
	BIT $12,x				;$B3AFA7   |
	BVS CODE_B3AFAE				;$B3AFA9   |
	LDA #$FF00				;$B3AFAB   |
CODE_B3AFAE:					;	   |
	STA $26,x				;$B3AFAE   |
	STA $20,x				;$B3AFB0   |
	LDA #$FA00				;$B3AFB2   |
	STA $24,x				;$B3AFB5   |
	LDA #$0004				;$B3AFB7   |
	STA $52,x				;$B3AFBA   |
	LDA #$0004				;$B3AFBC   |
	STA $2E,x				;$B3AFBF   |
	RTS					;$B3AFC1  /

CODE_B3AFC2:
	PHX					;$B3AFC2  \
	PHY					;$B3AFC3   |
	LDX alternate_sprite			;$B3AFC4   |
	STX current_sprite			;$B3AFC6   |
	JSL CODE_BB82B8				;$B3AFC8   |
	PLY					;$B3AFCC   |
	PLX					;$B3AFCD   |
	STX current_sprite			;$B3AFCE   |
	JSL CODE_BB842C				;$B3AFD0   |
	LDY alternate_sprite			;$B3AFD4   |
	RTS					;$B3AFD6  /

CODE_B3AFD7:
	STX $5E					;$B3AFD7  \
	STY $60					;$B3AFD9   |
	LDX current_sprite			;$B3AFDB   |
	LDY $0593				;$B3AFDD   |
	LDA $06,x				;$B3AFE0   |
	SEC					;$B3AFE2   |
	SBC $0006,y				;$B3AFE3   |
	BCS CODE_B3AFEE				;$B3AFE6   |
	ADC $5E					;$B3AFE8   |
	BCC CODE_B3B005				;$B3AFEA   |
	BCS CODE_B3AFF2				;$B3AFEC   |
CODE_B3AFEE:					;	   |
	CMP $5E					;$B3AFEE   |
	BCS CODE_B3B005				;$B3AFF0   |
CODE_B3AFF2:					;	   |
	LDA $0A,x				;$B3AFF2   |
	SEC					;$B3AFF4   |
	SBC $000A,y				;$B3AFF5   |
	BCS CODE_B3B000				;$B3AFF8   |
	ADC $5E					;$B3AFFA   |
	BCC CODE_B3B005				;$B3AFFC   |
	BCS CODE_B3B003				;$B3AFFE   |
CODE_B3B000:					;	   |
	CMP $60					;$B3B000   |
	RTS					;$B3B002  /

CODE_B3B003:
	CLC					;$B3B003  \
	RTS					;$B3B004  /

CODE_B3B005:
	SEC					;$B3B005  \
	RTS					;$B3B006  /

CODE_B3B007:
	LDX current_sprite			;$B3B007  \
	LDY $0593				;$B3B009   |
	STA $5E					;$B3B00C   |
	LDA $06,x				;$B3B00E   |
	SEC					;$B3B010   |
	SBC $0006,y				;$B3B011   |
	BCS CODE_B3B01C				;$B3B014   |
	ADC $5E					;$B3B016   |
	BCC CODE_B3B01F				;$B3B018   |
	CLC					;$B3B01A   |
	RTS					;$B3B01B  /

CODE_B3B01C:
	CMP $5E					;$B3B01C  \
	RTS					;$B3B01E  /

CODE_B3B01F:
	SEC					;$B3B01F  \
	RTS					;$B3B020  /

CODE_B3B021:
	LDX current_sprite			;$B3B021  \
	LDY $0593				;$B3B023   |
	STA $5E					;$B3B026   |
	LDA $0A,x				;$B3B028   |
	SEC					;$B3B02A   |
	SBC $000A,y				;$B3B02B   |
	BCS CODE_B3B036				;$B3B02E   |
	ADC $5E					;$B3B030   |
	BCC CODE_B3B039				;$B3B032   |
	CLC					;$B3B034   |
	RTS					;$B3B035  /

CODE_B3B036:
	CMP $5E					;$B3B036  \
	RTS					;$B3B038  /

CODE_B3B039:
	SEC					;$B3B039  \
	RTS					;$B3B03A  /

large_smoke_puff_main:
unknown_sprite_0014_main:
	LDY current_sprite			;$B3B03B  \
	LDA $0054,y				;$B3B03D   |
	STA $8E					;$B3B040   |
	JSL CODE_BEF039				;$B3B042   |
	JSL CODE_B9D100				;$B3B046   |
	JML [$05A9]				;$B3B04A  /

kruncha_main:
	LDY current_sprite			;$B3B04D  \
	LDA $0A36				;$B3B04F   |
	BIT #$0004				;$B3B052   |
	BEQ CODE_B3B062				;$B3B055   |
	LDA $002E,y				;$B3B057   |
	CMP #$0004				;$B3B05A   |
	BEQ CODE_B3B062				;$B3B05D   |
	JML [$05A9]				;$B3B05F  /

CODE_B3B062:
	JSR CODE_B3A369				;$B3B062  /

DATA_B3B065:
	dw CODE_B3B071
	dw CODE_B3B082
	dw CODE_B3B092
	dw CODE_B3B0CF
	dw CODE_B3B14D
	dw CODE_B3B16E


CODE_B3B071:
	TYX					;$B3B071  \
	LDA $26,x				;$B3B072   |
	BPL CODE_B3B07A				;$B3B074   |
	EOR #$FFFF				;$B3B076   |
	INC A					;$B3B079   |
CODE_B3B07A:					;	   |
	STA $48,x				;$B3B07A   |
	STA $4A,x				;$B3B07C   |
	STZ $1C,x				;$B3B07E   |
	INC $2E,x				;$B3B080   |
CODE_B3B082:					;	   |
	JSR CODE_B3B194				;$B3B082   |
	BCS CODE_B3B08F				;$B3B085   |
	JSL CODE_BEF039				;$B3B087   |
	JSL CODE_B9D100				;$B3B08B   |
CODE_B3B08F:					;	   |
	JMP CODE_B38000				;$B3B08F  /

CODE_B3B092:
	LDA $0036,y				;$B3B092  \
	CMP #$0172				;$B3B095   |
	BEQ CODE_B3B09D				;$B3B098   |
	BRL CODE_B3B082				;$B3B09A  /

CODE_B3B09D:
	TYX					;$B3B09D  \
	LDY #$0008				;$B3B09E   |
	LDA [$8E],y				;$B3B0A1   |
	TAY					;$B3B0A3   |
	LDA $4A,x				;$B3B0A4   |
	LSR A					;$B3B0A6   |
	LSR A					;$B3B0A7   |
	LSR A					;$B3B0A8   |
	LSR A					;$B3B0A9   |
	JSR CODE_B3B2DF				;$B3B0AA   |
	BIT $12,x				;$B3B0AD   |
	BVC CODE_B3B0B5				;$B3B0AF   |
	EOR #$FFFF				;$B3B0B1   |
	INC A					;$B3B0B4   |
CODE_B3B0B5:					;	   |
	STA $48,x				;$B3B0B5   |
	STA $26,x				;$B3B0B7   |
	LDY #$000A				;$B3B0B9   |
	LDA [$8E],y				;$B3B0BC   |
	STA $4C,x				;$B3B0BE   |
	LDY #$000C				;$B3B0C0   |
	LDA [$8E],y				;$B3B0C3   |
	STA $4E,x				;$B3B0C5   |
	LDA #$0003				;$B3B0C7   |
	STA $2E,x				;$B3B0CA   |
	BRL CODE_B3B082				;$B3B0CC  /

CODE_B3B0CF:
	LDX current_sprite			;$B3B0CF  \
	LDA $36,x				;$B3B0D1   |
	CMP #$0172				;$B3B0D3   |
	BNE CODE_B3B0DC				;$B3B0D6   |
	LDA $4E,x				;$B3B0D8   |
	STA $3A,x				;$B3B0DA   |
CODE_B3B0DC:					;	   |
	LDA $4C,x				;$B3B0DC   |
	BMI CODE_B3B0E4				;$B3B0DE   |
	DEC $4C,x				;$B3B0E0   |
	BRA CODE_B3B12E				;$B3B0E2  /

CODE_B3B0E4:
	LDY $4A,x				;$B3B0E4  \
	LDA $26,x				;$B3B0E6   |
	BEQ CODE_B3B12E				;$B3B0E8   |
	BPL CODE_B3B0F9				;$B3B0EA   |
	EOR #$FFFF				;$B3B0EC   |
	INC A					;$B3B0EF   |
	JSR CODE_B3B2BC				;$B3B0F0   |
	EOR #$FFFF				;$B3B0F3   |
	INC A					;$B3B0F6   |
	BRA CODE_B3B0FC				;$B3B0F7  /

CODE_B3B0F9:
	JSR CODE_B3B2BC				;$B3B0F9  \
CODE_B3B0FC:					;	   |
	STA $26,x				;$B3B0FC   |
	STA $48,x				;$B3B0FE   |
	BCS CODE_B3B116				;$B3B100   |
	LDY #$0100				;$B3B102   |
	LDA $4E,x				;$B3B105   |
	JSR CODE_B3B2BC				;$B3B107   |
	STA $4E,x				;$B3B10A   |
	CMP #$0180				;$B3B10C   |
	BCS CODE_B3B12E				;$B3B10F   |
	JSR CODE_B3B179				;$B3B111   |
	BRA CODE_B3B12E				;$B3B114  /

CODE_B3B116:
	LDA #$0100				;$B3B116  \
	STA $3A,x				;$B3B119   |
	LDA #$0001				;$B3B11B   |
	STA $1C,x				;$B3B11E   |
	JSR CODE_B3B179				;$B3B120   |
	LDY current_sprite			;$B3B123   |
	LDA #$0001				;$B3B125   |
	STA $002E,y				;$B3B128   |
	BRL CODE_B3B082				;$B3B12B  /

CODE_B3B12E:
	JSR CODE_B3B194				;$B3B12E  \
	BCS CODE_B3B14A				;$B3B131   |
	LDX current_sprite			;$B3B133   |
	LDA $52,x				;$B3B135   |
	CMP #$0022				;$B3B137   |
	BNE CODE_B3B142				;$B3B13A   |
	LDA #$0173				;$B3B13C   |
	JSR CODE_B3B28E				;$B3B13F   |
CODE_B3B142:					;	   |
	JSL CODE_BEF039				;$B3B142   |
	JSL CODE_B9D100				;$B3B146   |
CODE_B3B14A:					;	   |
	JMP CODE_B38000				;$B3B14A  /

CODE_B3B14D:
	TYX					;$B3B14D  \
	JSR CODE_B3B179				;$B3B14E   |
	LDA $36,x				;$B3B151   |
	CMP #$0172				;$B3B153   |
	BNE CODE_B3B16B				;$B3B156   |
	LDA $4A,x				;$B3B158   |
	BIT $12,x				;$B3B15A   |
	BVC CODE_B3B162				;$B3B15C   |
	EOR #$FFFF				;$B3B15E   |
	INC A					;$B3B161   |
CODE_B3B162:					;	   |
	STA $48,x				;$B3B162   |
	STA $26,x				;$B3B164   |
	LDA #$0001				;$B3B166   |
	STA $2E,x				;$B3B169   |
CODE_B3B16B:					;	   |
	BRL CODE_B3B082				;$B3B16B  /

CODE_B3B16E:
	JSL CODE_BEF039				;$B3B16E  \
	JSL CODE_B9D100				;$B3B172   |
	JMP CODE_B3A652				;$B3B176  /

CODE_B3B179:
	LDA $1C,x				;$B3B179  \
	BEQ CODE_B3B193				;$B3B17B   |
	DEC A					;$B3B17D   |
	STA $1C,x				;$B3B17E   |
	BIT #$0003				;$B3B180   |
	BNE CODE_B3B193				;$B3B183   |
	AND #$0004				;$B3B185   |
	LSR A					;$B3B188   |
	ADC #$000E				;$B3B189   |
	TAY					;$B3B18C   |
	LDA [$8E],y				;$B3B18D   |
	JSL CODE_BB8C40				;$B3B18F   |
CODE_B3B193:					;	   |
	RTS					;$B3B193  /

CODE_B3B194:
	JSR CODE_B3A3A3				;$B3B194  \
	BCC CODE_B3B1E2				;$B3B197   |
	LDX current_sprite			;$B3B199   |
	LDA #$0118				;$B3B19B   |
	JSL CODE_BEBE14				;$B3B19E   |
	BCS CODE_B3B1C2				;$B3B1A2   |
	JSL CODE_BCFB58				;$B3B1A4   |
	LDA #$577B				;$B3B1A8   |
	LDY $1C,x				;$B3B1AB   |
	BEQ CODE_B3B1B9				;$B3B1AD   |
	LDY $2E,x				;$B3B1AF   |
	CPY #$0002				;$B3B1B1   |
	BEQ CODE_B3B1C0				;$B3B1B4   |
	LDA #$4400				;$B3B1B6   |
CODE_B3B1B9:					;	   |
	JSL CODE_BEBE8B				;$B3B1B9   |
	BCS CODE_B3B1C2				;$B3B1BD   |
	RTS					;$B3B1BF  /

CODE_B3B1C0:
	CLC					;$B3B1C0  \
	RTS					;$B3B1C1  /

CODE_B3B1C2:
	CMP #$0001				;$B3B1C2  \
	BCC CODE_B3B1E2				;$B3B1C5   |
	BEQ CODE_B3B1CB				;$B3B1C7   |
	BRA CODE_B3B219				;$B3B1C9  /

CODE_B3B1CB:
	LDA #$001E				;$B3B1CB  \
	CMP $1C,x				;$B3B1CE   |
	BCS CODE_B3B1D4				;$B3B1D0   |
	STA $1C,x				;$B3B1D2   |
CODE_B3B1D4:					;	   |
	LDA #$0004				;$B3B1D4   |
	STA $2E,x				;$B3B1D7   |
	LDA #$0176				;$B3B1D9   |
	JSL CODE_B9D0C6				;$B3B1DC   |
	SEC					;$B3B1E0   |
	RTS					;$B3B1E1  /

CODE_B3B1E2:
	TYA					;$B3B1E2  \
	BEQ CODE_B3B1F4				;$B3B1E3   |
	LDA $0012,y				;$B3B1E5   |
	EOR $12,x				;$B3B1E8   |
	AND #$4000				;$B3B1EA   |
	EOR $12,x				;$B3B1ED   |
	EOR #$4000				;$B3B1EF   |
	STA $12,x				;$B3B1F2   |
CODE_B3B1F4:					;	   |
	LDA #$0100				;$B3B1F4   |
	BIT $12,x				;$B3B1F7   |
	BVS CODE_B3B1FE				;$B3B1F9   |
	LDA #$FF00				;$B3B1FB   |
CODE_B3B1FE:					;	   |
	STA $26,x				;$B3B1FE   |
	STA $20,x				;$B3B200   |
	LDA #$F800				;$B3B202   |
	STA $24,x				;$B3B205   |
	LDA #$0004				;$B3B207   |
	STA $52,x				;$B3B20A   |
	LDA #$0174				;$B3B20C   |
	JSR CODE_B3A627				;$B3B20F   |
	LDA #$0005				;$B3B212   |
	STA $2E,x				;$B3B215   |
	SEC					;$B3B217   |
	RTS					;$B3B218  /

CODE_B3B219:
	LDA #$001E				;$B3B219  \
	CMP $0A82				;$B3B21C   |
	CLC					;$B3B21F   |
	BNE CODE_B3B231				;$B3B220   |
	LDA #$0200				;$B3B222   |
	BIT $0A86				;$B3B225   |
	BPL CODE_B3B22D				;$B3B228   |
	LDA #$FE00				;$B3B22A   |
CODE_B3B22D:					;	   |
	STA $0A86				;$B3B22D   |
	SEC					;$B3B230   |
CODE_B3B231:					;	   |
	LDX current_sprite			;$B3B231   |
	LDY #$0006				;$B3B233   |
	LDA [$8E],y				;$B3B236   |
	BPL CODE_B3B248				;$B3B238   |
	LDA $26,x				;$B3B23A   |
	LSR A					;$B3B23C   |
	EOR $12,x				;$B3B23D   |
	AND #$4000				;$B3B23F   |
	EOR $12,x				;$B3B242   |
	STA $12,x				;$B3B244   |
	BRA CODE_B3B26B				;$B3B246  /

CODE_B3B248:
	LDY $6A					;$B3B248  \
	BCS CODE_B3B253				;$B3B24A   |
	LDA $0A86				;$B3B24C   |
	BPL CODE_B3B260				;$B3B24F   |
	BMI CODE_B3B25A				;$B3B251   |
CODE_B3B253:					;	   |
	LDA $06,x				;$B3B253   |
	CMP $0006,y				;$B3B255   |
	BCC CODE_B3B260				;$B3B258   |
CODE_B3B25A:					;	   |
	BIT $12,x				;$B3B25A   |
	BVS CODE_B3B26B				;$B3B25C   |
	BVC CODE_B3B264				;$B3B25E   |
CODE_B3B260:					;	   |
	BIT $12,x				;$B3B260   |
	BVC CODE_B3B26B				;$B3B262   |
CODE_B3B264:					;	   |
	LDA $12,x				;$B3B264   |
	EOR #$4000				;$B3B266   |
	STA $12,x				;$B3B269   |
CODE_B3B26B:					;	   |
	LDA #$0002				;$B3B26B   |
	STA $2E,x				;$B3B26E   |
	LDA #$003C				;$B3B270   |
	STA $1C,x				;$B3B273   |
	LDY #$0010				;$B3B275   |
	LDA [$8E],y				;$B3B278   |
	JSL CODE_BB8C40				;$B3B27A   |
	LDY #$0006				;$B3B27E   |
	LDA [$8E],y				;$B3B281   |
	STA $28,x				;$B3B283   |
	LDA #$0175				;$B3B285   |
	JSL CODE_B9D0C6				;$B3B288   |
	SEC					;$B3B28C   |
	RTS					;$B3B28D  /

CODE_B3B28E:
	CMP $36,x				;$B3B28E  \
	BEQ CODE_B3B2B6				;$B3B290   |
	LDA $22,x				;$B3B292   |
	BEQ CODE_B3B299				;$B3B294   |
	DEC $22,x				;$B3B296   |
	RTS					;$B3B298  /

CODE_B3B299:
	LDY $0593				;$B3B299  \
	LDA $0006,y				;$B3B29C   |
	SEC					;$B3B29F   |
	SBC $06,x				;$B3B2A0   |
	CMP $28,x				;$B3B2A2   |
	BCC CODE_B3B2BB				;$B3B2A4   |
	ADC $28,x				;$B3B2A6   |
	BCS CODE_B3B2BB				;$B3B2A8   |
	EOR $26,x				;$B3B2AA   |
	BPL CODE_B3B2BB				;$B3B2AC   |
	LDA $26,x				;$B3B2AE   |
	EOR #$FFFF				;$B3B2B0   |
	INC A					;$B3B2B3   |
	STA $26,x				;$B3B2B4   |
CODE_B3B2B6:					;	   |
	LDA #$0014				;$B3B2B6   |
	STA $22,x				;$B3B2B9   |
CODE_B3B2BB:					;	   |
	RTS					;$B3B2BB  /

CODE_B3B2BC:
	STY $32					;$B3B2BC  \
	SEC					;$B3B2BE   |
	SBC $32					;$B3B2BF   |
	BCC CODE_B3B2DB				;$B3B2C1   |
	STA $34					;$B3B2C3   |
	LSR A					;$B3B2C5   |
	LSR A					;$B3B2C6   |
	LSR A					;$B3B2C7   |
	LSR A					;$B3B2C8   |
	LSR A					;$B3B2C9   |
	BEQ CODE_B3B2DB				;$B3B2CA   |
	EOR #$FFFF				;$B3B2CC   |
	SEC					;$B3B2CF   |
	ADC $34					;$B3B2D0   |
	CLC					;$B3B2D2   |
	ADC $32					;$B3B2D3   |
	CMP $32					;$B3B2D5   |
	BEQ CODE_B3B2DE				;$B3B2D7   |
	CLC					;$B3B2D9   |
	RTS					;$B3B2DA  /

CODE_B3B2DB:
	LDA $32					;$B3B2DB  \
	SEC					;$B3B2DD   |
CODE_B3B2DE:					;	   |
	RTS					;$B3B2DE  /

CODE_B3B2DF:
	PHX					;$B3B2DF  \
	SEP #$30				;$B3B2E0   |
	STA CPU.multiply_A			;$B3B2E2   |
	STY CPU.multiply_B			;$B3B2E5   |
	REP #$30				;$B3B2E8   |
	PLX					;$B3B2EA   |
	NOP					;$B3B2EB   |
	LDA CPU.multiply_result			;$B3B2EC   |
	RTS					;$B3B2EF  /

snapjaw_main:
	LDA $08C2				;$B3B2F0  \
	AND #$0100				;$B3B2F3   |
	BNE CODE_B3B31E				;$B3B2F6   |
	JSR CODE_B3A369				;$B3B2F8  /

DATA_B3B2FB:
	dw CODE_B3B52F
	dw CODE_B3B328
	dw CODE_B3B41D
	dw CODE_B3B73A
	dw CODE_B3B305


CODE_B3B305:
	TYX					;$B3B305  \
	LDA $5C,x				;$B3B306   |
	BMI CODE_B3B321				;$B3B308   |
	AND #$00FF				;$B3B30A   |
	CMP $08A6				;$B3B30D   |
	BEQ CODE_B3B321				;$B3B310   |
	EOR $5C,x				;$B3B312   |
	XBA					;$B3B314   |
	CMP $08A6				;$B3B315   |
	BEQ CODE_B3B321				;$B3B318   |
	JSL CODE_BB82B8				;$B3B31A   |
CODE_B3B31E:					;	   |
	JML [$05A9]				;$B3B31E  /

CODE_B3B321:
	STZ $5C,x				;$B3B321  \
	STZ $2E,x				;$B3B323   |
	JML [$05A9]				;$B3B325  /

CODE_B3B328:
	JSR CODE_B3A3CD				;$B3B328  \
	LDY $0593				;$B3B32B   |
	LDA $000A,y				;$B3B32E   |
	LDY #$0012				;$B3B331   |
	BCC CODE_B3B33E				;$B3B334   |
	CMP $0D4E				;$B3B336   |
	BCC CODE_B3B33E				;$B3B339   |
	LDY #$0016				;$B3B33B   |
CODE_B3B33E:					;	   |
	LDA [$8E],y				;$B3B33E   |
	LDX current_sprite			;$B3B340   |
	STA $46,x				;$B3B342   |
	INY					;$B3B344   |
	INY					;$B3B345   |
	LDA [$8E],y				;$B3B346   |
	BIT $48,x				;$B3B348   |
	BPL CODE_B3B350				;$B3B34A   |
	EOR #$FFFF				;$B3B34C   |
	INC A					;$B3B34F   |
CODE_B3B350:					;	   |
	STA $48,x				;$B3B350   |
	STA $26,x				;$B3B352   |
	LDY $0593				;$B3B354   |
	LDA $46,x				;$B3B357   |
	STA $32					;$B3B359   |
	STZ $34					;$B3B35B   |
	AND #$00FF				;$B3B35D   |
	CLC					;$B3B360   |
	ADC $33					;$B3B361   |
	STA $32					;$B3B363   |
	LDA $0006,y				;$B3B365   |
	SEC					;$B3B368   |
	SBC $06,x				;$B3B369   |
	STA $34					;$B3B36B   |
	BCS CODE_B3B375				;$B3B36D   |
	ADC $32					;$B3B36F   |
	BMI CODE_B3B381				;$B3B371   |
	BRA CODE_B3B379				;$B3B373  /

CODE_B3B375:
	SBC $32					;$B3B375  \
	BPL CODE_B3B381				;$B3B377   |
CODE_B3B379:					;	   |
	LDA $0006,y				;$B3B379   |
	SEC					;$B3B37C   |
	SBC $42,x				;$B3B37D   |
	STA $34					;$B3B37F   |
CODE_B3B381:					;	   |
	LDA $34					;$B3B381   |
	ASL A					;$B3B383   |
	ASL A					;$B3B384   |
	ASL A					;$B3B385   |
	ASL A					;$B3B386   |
	CLC					;$B3B387   |
	ADC $48,x				;$B3B388   |
	BPL CODE_B3B396				;$B3B38A   |
	CMP #$F400				;$B3B38C   |
	BCS CODE_B3B39E				;$B3B38F   |
	LDA #$F400				;$B3B391   |
	BRA CODE_B3B39E				;$B3B394  /

CODE_B3B396:
	CMP #$0C00				;$B3B396  \
	BCC CODE_B3B39E				;$B3B399   |
	LDA #$0C00				;$B3B39B   |
CODE_B3B39E:					;	   |
	STA $26,x				;$B3B39E   |
	LDA $0006,y				;$B3B3A0   |
	STA $42,x				;$B3B3A3   |
	LDA $0915				;$B3B3A5   |
	BEQ CODE_B3B3AD				;$B3B3A8   |
	LDA #$0010				;$B3B3AA   |
CODE_B3B3AD:					;	   |
	CLC					;$B3B3AD   |
	ADC $0D4E				;$B3B3AE   |
	CMP $000A,y				;$B3B3B1   |
	BCS CODE_B3B3BA				;$B3B3B4   |
	LDA $000A,y				;$B3B3B6   |
	CLC					;$B3B3B9   |
CODE_B3B3BA:					;	   |
	ADC #$001C				;$B3B3BA   |
	LDY #$001A				;$B3B3BD   |
	CMP [$8E],y				;$B3B3C0   |
	BCS CODE_B3B3CA				;$B3B3C2   |
	LDA [$8E],y				;$B3B3C4   |
	INC $5C,x				;$B3B3C6   |
	BRA CODE_B3B3D5				;$B3B3C8  /

CODE_B3B3CA:
	LDY #$001C				;$B3B3CA  \
	CMP [$8E],y				;$B3B3CD   |
	BCC CODE_B3B3D5				;$B3B3CF   |
	LDA [$8E],y				;$B3B3D1   |
	INC $5C,x				;$B3B3D3   |
CODE_B3B3D5:					;	   |
	STA $36					;$B3B3D5   |
	LDA $4A,x				;$B3B3D7   |
	STA $32					;$B3B3D9   |
	STZ $34					;$B3B3DB   |
	AND #$00FF				;$B3B3DD   |
	CLC					;$B3B3E0   |
	ADC $33					;$B3B3E1   |
	STA $32					;$B3B3E3   |
	LDA $36					;$B3B3E5   |
	SEC					;$B3B3E7   |
	SBC $0A,x				;$B3B3E8   |
	STA $34					;$B3B3EA   |
	BCS CODE_B3B3F4				;$B3B3EC   |
	ADC $32					;$B3B3EE   |
	BMI CODE_B3B3FF				;$B3B3F0   |
	BRA CODE_B3B3F8				;$B3B3F2  /

CODE_B3B3F4:
	SBC $32					;$B3B3F4  \
	BPL CODE_B3B3FF				;$B3B3F6   |
CODE_B3B3F8:					;	   |
	LDA $36					;$B3B3F8   |
	SEC					;$B3B3FA   |
	SBC $44,x				;$B3B3FB   |
	STA $34					;$B3B3FD   |
CODE_B3B3FF:					;	   |
	LDA $34					;$B3B3FF   |
	ASL A					;$B3B401   |
	ASL A					;$B3B402   |
	ASL A					;$B3B403   |
	ASL A					;$B3B404   |
	CLC					;$B3B405   |
	ADC $4C,x				;$B3B406   |
	STA $2A,x				;$B3B408   |
	LDA $36					;$B3B40A   |
	STA $44,x				;$B3B40C   |
	JSR CODE_B3B557				;$B3B40E   |
	LDX current_sprite			;$B3B411   |
	LDA $5C,x				;$B3B413   |
	BNE CODE_B3B41A				;$B3B415   |
	JML [$05A9]				;$B3B417  /

CODE_B3B41A:
	JMP CODE_B38000				;$B3B41A  /

CODE_B3B41D:
	LDY current_sprite			;$B3B41D  \
	LDA $002F,y				;$B3B41F   |
	AND #$00FF				;$B3B422   |
	ASL A					;$B3B425   |
	TAX					;$B3B426   |
	JSR (DATA_B3B455,x)			;$B3B427   |
	LDA $0D4E				;$B3B42A   |
	PHA					;$B3B42D   |
	CLC					;$B3B42E   |
	ADC #$0010				;$B3B42F   |
	STA $0D4E				;$B3B432   |
	JSR CODE_B3B887				;$B3B435   |
	PLA					;$B3B438   |
	STA $0D4E				;$B3B439   |
	LDA $0915				;$B3B43C   |
	BNE CODE_B3B452				;$B3B43F   |
	JSL CODE_BCFB58				;$B3B441   |
	LDA #$0000				;$B3B445   |
	JSL CODE_BEBE8B				;$B3B448   |
	BCC CODE_B3B452				;$B3B44C   |
	LDX current_sprite			;$B3B44E   |
	INC $1C,x				;$B3B450   |
CODE_B3B452:					;	   |
	JML [$05A9]				;$B3B452  /

DATA_B3B455:
	dw CODE_B3B45D
	dw CODE_B3B47A
	dw CODE_B3B490
	dw CODE_B3B4E8

CODE_B3B45D:
	JSR CODE_B3B887				;$B3B45D  \
	LDX current_sprite			;$B3B460   |
	LDA $36,x				;$B3B462   |
	CMP #$0177				;$B3B464   |
	BEQ CODE_B3B46E				;$B3B467   |
	JSL CODE_B9D100				;$B3B469   |
	RTS					;$B3B46D  /

CODE_B3B46E:
	INC $2F,x				;$B3B46E  \
	STZ $1C,x				;$B3B470   |
	LDA #$017B				;$B3B472   |
	JSL CODE_B9D0C6				;$B3B475   |
	RTS					;$B3B479  /

CODE_B3B47A:
	LDA #$0008				;$B3B47A  \
	JSL CODE_BEF03D				;$B3B47D   |
	LDA #$001D				;$B3B481   |
	JSL CODE_BEF03D				;$B3B484   |
	JSR CODE_B3B887				;$B3B488   |
	JSL CODE_B9D100				;$B3B48B   |
	RTS					;$B3B48F  /

CODE_B3B490:
	TYX					;$B3B490  \
	LDY $0593				;$B3B491   |
	LDA $0006,y				;$B3B494   |
	STA $4E,x				;$B3B497   |
	LDA $000A,y				;$B3B499   |
	STA $50,x				;$B3B49C   |
	LDA $1C,x				;$B3B49E   |
	LSR A					;$B3B4A0   |
	BCC CODE_B3B4AF				;$B3B4A1   |
	LSR A					;$B3B4A3   |
	LDA #$0008				;$B3B4A4   |
	BCC CODE_B3B4C4				;$B3B4A7   |
	STZ $26,x				;$B3B4A9   |
	STZ $2A,x				;$B3B4AB   |
	BRA CODE_B3B4D2				;$B3B4AD  /

CODE_B3B4AF:
	LDY $0593				;$B3B4AF  \
	LDA $000A,y				;$B3B4B2   |
	CMP $0D4E				;$B3B4B5   |
	BCS CODE_B3B4BF				;$B3B4B8   |
	LDA #$000C				;$B3B4BA   |
	BRA CODE_B3B4C4				;$B3B4BD  /

CODE_B3B4BF:
	LDY #$000E				;$B3B4BF  \
	LDA [$8E],y				;$B3B4C2   |
CODE_B3B4C4:					;	   |
	JSR CODE_B3B753				;$B3B4C4   |
	LDA $12,x				;$B3B4C7   |
	ASL A					;$B3B4C9   |
	EOR $26,x				;$B3B4CA   |
	BPL CODE_B3B4D2				;$B3B4CC   |
	STZ $26,x				;$B3B4CE   |
	STZ $20,x				;$B3B4D0   |
CODE_B3B4D2:					;	   |
	LDA #$000F				;$B3B4D2   |
	JSL CODE_BEF03D				;$B3B4D5   |
	LDA #$001D				;$B3B4D9   |
	JSL CODE_BEF03D				;$B3B4DC   |
	JSR CODE_B3B887				;$B3B4E0   |
	JSL CODE_B9D100				;$B3B4E3   |
	RTS					;$B3B4E7  /

CODE_B3B4E8:
	LDA $0A36				;$B3B4E8  \
	AND #$0004				;$B3B4EB   |
	BNE CODE_B3B506				;$B3B4EE   |
	TYX					;$B3B4F0   |
	DEC $4E,x				;$B3B4F1   |
	BMI CODE_B3B50B				;$B3B4F3   |
	LDA #$0008				;$B3B4F5   |
	JSL CODE_BEF03D				;$B3B4F8   |
	LDA #$001D				;$B3B4FC   |
	JSL CODE_BEF03D				;$B3B4FF   |
	JSR CODE_B3B887				;$B3B503   |
CODE_B3B506:					;	   |
	JSL CODE_B9D100				;$B3B506   |
	RTS					;$B3B50A  /

CODE_B3B50B:
	LDA #$0001				;$B3B50B  \
	STA $2E,x				;$B3B50E   |
	LDA $4C,x				;$B3B510   |
	STA $2A,x				;$B3B512   |
	STZ $24,x				;$B3B514   |
	JSR CODE_B3B822				;$B3B516   |
	JSR CODE_B3B887				;$B3B519   |
	LDA #$0177				;$B3B51C   |
	JSL CODE_B9D0C6				;$B3B51F   |
	RTS					;$B3B523  /

lockjaw_main:
	JSR CODE_B3A369				;$B3B524  /

DATA_B3B527:
	dw CODE_B3B52F
	dw CODE_B3B536
	dw CODE_B3B5B4
	dw CODE_B3B73A

CODE_B3B52F:
	TYX					;$B3B52F  \
	LDA $26,x				;$B3B530   |
	STA $48,x				;$B3B532   |
	INC $2E,x				;$B3B534   |
CODE_B3B536:					;	   |
	LDA #$0118				;$B3B536   |
	JSL CODE_BEBE14				;$B3B539   |
	BCS CODE_B3B54C				;$B3B53D   |
	JSL CODE_BCFB58				;$B3B53F   |
	LDA #$1400				;$B3B543   |
	JSL CODE_BEBE8B				;$B3B546   |
	BCC CODE_B3B551				;$B3B54A   |
CODE_B3B54C:					;	   |
	BNE CODE_B3B551				;$B3B54C   |
	JMP CODE_B3B745				;$B3B54E  /

CODE_B3B551:
	JSR CODE_B3B579				;$B3B551  \
	JMP CODE_B38000				;$B3B554  /

CODE_B3B557:
	LDA $0915				;$B3B557  \
	BNE CODE_B3B5A8				;$B3B55A   |
	LDY $0593				;$B3B55C   |
	LDA $0030,y				;$B3B55F   |
	BEQ CODE_B3B5A8				;$B3B562   |
	BIT #$0080				;$B3B564   |
	BNE CODE_B3B5A8				;$B3B567   |
	LDA $19CE				;$B3B569   |
	BNE CODE_B3B5A8				;$B3B56C   |
	JSL CODE_BCFB58				;$B3B56E   |
	LDA #$0000				;$B3B572   |
	JSL CODE_BEBE8B				;$B3B575   |
CODE_B3B579:					;	   |
	JSR CODE_B3A3CD				;$B3B579   |
	BCC CODE_B3B5A8				;$B3B57C   |
	LDY $0593				;$B3B57E   |
	LDA $000A,y				;$B3B581   |
	SBC #$0004				;$B3B584   |
	CMP $0D4E				;$B3B587   |
	BCC CODE_B3B5A8				;$B3B58A   |
	LDY #$0008				;$B3B58C   |
	LDA [$8E],y				;$B3B58F   |
	AND #$00FF				;$B3B591   |
	JSR CODE_B3B007				;$B3B594   |
	BCS CODE_B3B5A8				;$B3B597   |
	LDY #$0009				;$B3B599   |
	LDA [$8E],y				;$B3B59C   |
	AND #$00FF				;$B3B59E   |
	JSR CODE_B3B021				;$B3B5A1   |
	BCS CODE_B3B5A8				;$B3B5A4   |
	INC $2E,x				;$B3B5A6   |
CODE_B3B5A8:					;	   |
	JSL CODE_BEF039				;$B3B5A8   |
	JSR CODE_B3B887				;$B3B5AC   |
	JSL CODE_B9D100				;$B3B5AF   |
	RTS					;$B3B5B3  /

CODE_B3B5B4:
	LDA #$0118				;$B3B5B4  \
	JSL CODE_BEBE14				;$B3B5B7   |
	BCS CODE_B3B5CA				;$B3B5BB   |
	JSL CODE_BCFB58				;$B3B5BD   |
	LDA #$1400				;$B3B5C1   |
	JSL CODE_BEBE8B				;$B3B5C4   |
	BCC CODE_B3B5CF				;$B3B5C8   |
CODE_B3B5CA:					;	   |
	BNE CODE_B3B5CF				;$B3B5CA   |
	JMP CODE_B3B745				;$B3B5CC  /

CODE_B3B5CF:
	LDY current_sprite			;$B3B5CF  \
	LDA $002F,y				;$B3B5D1   |
	AND #$00FF				;$B3B5D4   |
	ASL A					;$B3B5D7   |
	TAX					;$B3B5D8   |
	JMP (DATA_B3B5DC,x)			;$B3B5D9  /

DATA_B3B5DC:
	dw CODE_B3B5E8
	dw CODE_B3B622
	dw CODE_B3B65C
	dw CODE_B3B681
	dw CODE_B3B6D5
	dw CODE_B3B709


CODE_B3B5E8:
	JSR CODE_B3B887				;$B3B5E8  \
	LDY current_sprite			;$B3B5EB   |
	LDA $0036,y				;$B3B5ED   |
	CMP #$0177				;$B3B5F0   |
	BEQ CODE_B3B5FC				;$B3B5F3   |
	JSL CODE_B9D100				;$B3B5F5   |
	JMP CODE_B38000				;$B3B5F9  /

CODE_B3B5FC:
	TYX					;$B3B5FC  \
	INC $2F,x				;$B3B5FD   |
	LDY $0593				;$B3B5FF   |
	LDA $0006,y				;$B3B602   |
	CMP $06,x				;$B3B605   |
	LDA #$0500				;$B3B607   |
	BCC CODE_B3B60F				;$B3B60A   |
	LDA #$FB00				;$B3B60C   |
CODE_B3B60F:					;	   |
	STA $26,x				;$B3B60F   |
	LDY #$000A				;$B3B611   |
	LDA [$8E],y				;$B3B614   |
	STA $0C,x				;$B3B616   |
	LDA #$0179				;$B3B618   |
	JSL CODE_B9D0C6				;$B3B61B   |
	JMP CODE_B38000				;$B3B61F  /

CODE_B3B622:
	TYX					;$B3B622  \
	DEC $0C,x				;$B3B623   |
	BPL CODE_B3B64B				;$B3B625   |
	INC $2F,x				;$B3B627   |
	LDY #$000C				;$B3B629   |
	LDA [$8E],y				;$B3B62C   |
	STA $0C,x				;$B3B62E   |
	STZ $26,x				;$B3B630   |
	LDY $0593				;$B3B632   |
	LDA $0006,y				;$B3B635   |
	STA $4E,x				;$B3B638   |
	LDA $0D4E				;$B3B63A   |
	CLC					;$B3B63D   |
	ADC #$0018				;$B3B63E   |
	CMP $000A,y				;$B3B641   |
	BCS CODE_B3B649				;$B3B644   |
	LDA $000A,y				;$B3B646   |
CODE_B3B649:					;	   |
	STA $50,x				;$B3B649   |
CODE_B3B64B:					;	   |
	LDA #$0008				;$B3B64B   |
	JSL CODE_BEF03D				;$B3B64E   |
	JSR CODE_B3B887				;$B3B652   |
	JSL CODE_B9D100				;$B3B655   |
	JMP CODE_B38000				;$B3B659  /

CODE_B3B65C:
	TYX					;$B3B65C  \
	DEC $0C,x				;$B3B65D   |
	BPL CODE_B3B670				;$B3B65F   |
	INC $2F,x				;$B3B661   |
	LDY #$000E				;$B3B663   |
	LDA [$8E],y				;$B3B666   |
	JSR CODE_B3B753				;$B3B668   |
	LDA #$000F				;$B3B66B   |
	BRA CODE_B3B673				;$B3B66E  /

CODE_B3B670:
	LDA #$0008				;$B3B670  \
CODE_B3B673:					;	   |
	JSL CODE_BEF03D				;$B3B673   |
	JSR CODE_B3B887				;$B3B677   |
	JSL CODE_B9D100				;$B3B67A   |
	JMP CODE_B38000				;$B3B67E  /

CODE_B3B681:
	LDA #$000F				;$B3B681  \
	JSL CODE_BEF03D				;$B3B684   |
	JSR CODE_B3B887				;$B3B688   |
	JSL CODE_B9D100				;$B3B68B   |
	LDX current_sprite			;$B3B68F   |
	LDA $2A,x				;$B3B691   |
	BPL CODE_B3B699				;$B3B693   |
	EOR #$FFFF				;$B3B695   |
	INC A					;$B3B698   |
CODE_B3B699:					;	   |
	STA $32					;$B3B699   |
	LDA $26,x				;$B3B69B   |
	BPL CODE_B3B6A3				;$B3B69D   |
	EOR #$FFFF				;$B3B69F   |
	INC A					;$B3B6A2   |
CODE_B3B6A3:					;	   |
	CMP $32					;$B3B6A3   |
	BCS CODE_B3B6BA				;$B3B6A5   |
	LDA $2A,x				;$B3B6A7   |
	ASL A					;$B3B6A9   |
	XBA					;$B3B6AA   |
	JSR CODE_B3B815				;$B3B6AB   |
	CLC					;$B3B6AE   |
	ADC $0A,x				;$B3B6AF   |
	SEC					;$B3B6B1   |
	SBC $50,x				;$B3B6B2   |
	EOR $2A,x				;$B3B6B4   |
	BMI CODE_B3B6D2				;$B3B6B6   |
	BPL CODE_B3B6CB				;$B3B6B8   |
CODE_B3B6BA:					;	   |
	LDA $26,x				;$B3B6BA   |
	ASL A					;$B3B6BC   |
	XBA					;$B3B6BD   |
	JSR CODE_B3B815				;$B3B6BE   |
	CLC					;$B3B6C1   |
	ADC $06,x				;$B3B6C2   |
	SEC					;$B3B6C4   |
	SBC $4E,x				;$B3B6C5   |
	EOR $26,x				;$B3B6C7   |
	BMI CODE_B3B6D2				;$B3B6C9   |
CODE_B3B6CB:					;	   |
	INC $2F,x				;$B3B6CB   |
	LDA #$0002				;$B3B6CD   |
	STA $4E,x				;$B3B6D0   |
CODE_B3B6D2:					;	   |
	JMP CODE_B38000				;$B3B6D2  /

CODE_B3B6D5:
	LDA #$000F				;$B3B6D5  \
	JSL CODE_BEF03D				;$B3B6D8   |
	JSR CODE_B3B887				;$B3B6DC   |
	JSL CODE_B9D100				;$B3B6DF   |
	LDX current_sprite			;$B3B6E3   |
	DEC $4E,x				;$B3B6E5   |
	BPL CODE_B3B706				;$B3B6E7   |
	STZ $26,x				;$B3B6E9   |
	STZ $2A,x				;$B3B6EB   |
	LDA $20,x				;$B3B6ED   |
	ASL A					;$B3B6EF   |
	ROR $20,x				;$B3B6F0   |
	ASL A					;$B3B6F2   |
	ROR $20,x				;$B3B6F3   |
	LDA $24,x				;$B3B6F5   |
	ASL A					;$B3B6F7   |
	ROR $24,x				;$B3B6F8   |
	ASL A					;$B3B6FA   |
	ROR $24,x				;$B3B6FB   |
	LDY #$0010				;$B3B6FD   |
	LDA [$8E],y				;$B3B700   |
	STA $4E,x				;$B3B702   |
	INC $2F,x				;$B3B704   |
CODE_B3B706:					;	   |
	JMP CODE_B38000				;$B3B706  /

CODE_B3B709:
	TYX					;$B3B709  \
	DEC $4E,x				;$B3B70A   |
	BMI CODE_B3B71F				;$B3B70C   |
	LDA #$0008				;$B3B70E   |
	JSL CODE_BEF03D				;$B3B711   |
	JSR CODE_B3B887				;$B3B715   |
	JSL CODE_B9D100				;$B3B718   |
	JMP CODE_B38000				;$B3B71C  /

CODE_B3B71F:
	LDA #$0001				;$B3B71F  \
	STA $2E,x				;$B3B722   |
	LDA $4C,x				;$B3B724   |
	STA $2A,x				;$B3B726   |
	STZ $24,x				;$B3B728   |
	JSR CODE_B3B822				;$B3B72A   |
	JSR CODE_B3B887				;$B3B72D   |
	LDA #$0177				;$B3B730   |
	JSL CODE_B9D0C6				;$B3B733   |
	JMP CODE_B38000				;$B3B737  /

CODE_B3B73A:
	JSL CODE_BEF039				;$B3B73A  \
	JSL CODE_B9D100				;$B3B73E   |
	JMP CODE_B3A652				;$B3B742  /

CODE_B3B745:
	LDA #$0003				;$B3B745  \
	STA $2E,x				;$B3B748   |
	LDA #$017A				;$B3B74A   |
	JSR CODE_B3C9CB				;$B3B74D   |
	JMP CODE_B38000				;$B3B750  /

CODE_B3B753:
	STA $5E					;$B3B753  \
	LDA $4E,x				;$B3B755   |
	SEC					;$B3B757   |
	SBC $06,x				;$B3B758   |
	STA $32					;$B3B75A   |
	BPL CODE_B3B762				;$B3B75C   |
	EOR #$FFFF				;$B3B75E   |
	INC A					;$B3B761   |
CODE_B3B762:					;	   |
	STA $34					;$B3B762   |
	LDA $50,x				;$B3B764   |
	SEC					;$B3B766   |
	SBC $0A,x				;$B3B767   |
	STA $36					;$B3B769   |
	BPL CODE_B3B771				;$B3B76B   |
	EOR #$FFFF				;$B3B76D   |
	INC A					;$B3B770   |
CODE_B3B771:					;	   |
	STA $38					;$B3B771   |
	LDA $5E					;$B3B773   |
	BNE CODE_B3B78C				;$B3B775   |
	LDA $32					;$B3B777   |
	ASL A					;$B3B779   |
	ASL A					;$B3B77A   |
	ASL A					;$B3B77B   |
	ASL A					;$B3B77C   |
	STA $26,x				;$B3B77D   |
	STA $20,x				;$B3B77F   |
	LDA $36					;$B3B781   |
	ASL A					;$B3B783   |
	ASL A					;$B3B784   |
	ASL A					;$B3B785   |
	ASL A					;$B3B786   |
	STA $2A,x				;$B3B787   |
	STA $24,x				;$B3B789   |
	RTS					;$B3B78B  /

CODE_B3B78C:
	TAY					;$B3B78C  \
	LDA $48,x				;$B3B78D   |
	BPL CODE_B3B795				;$B3B78F   |
	EOR #$FFFF				;$B3B791   |
	INC A					;$B3B794   |
CODE_B3B795:					;	   |
	LSR A					;$B3B795   |
	LSR A					;$B3B796   |
	LSR A					;$B3B797   |
	LSR A					;$B3B798   |
	JSR CODE_B3B2DF				;$B3B799   |
	STA $5E					;$B3B79C   |
	LSR A					;$B3B79E   |
	LSR A					;$B3B79F   |
	LSR A					;$B3B7A0   |
	LSR A					;$B3B7A1   |
	SEP #$20				;$B3B7A2   |
	STA CPU.multiply_A			;$B3B7A4   |
	LDA $34					;$B3B7A7   |
	LDY $38					;$B3B7A9   |
	CMP $38					;$B3B7AB   |
	BCC CODE_B3B7B2				;$B3B7AD   |
	TAY					;$B3B7AF   |
	LDA $38					;$B3B7B0   |
CODE_B3B7B2:					;	   |
	STA CPU.multiply_B			;$B3B7B2   |
	REP #$20				;$B3B7B5   |
	NOP					;$B3B7B7   |
	NOP					;$B3B7B8   |
	NOP					;$B3B7B9   |
	LDA CPU.multiply_result			;$B3B7BA   |
	STA CPU.dividen				;$B3B7BD   |
	TYA					;$B3B7C0   |
	SEP #$20				;$B3B7C1   |
	STA CPU.divisor				;$B3B7C3   |
	REP #$20				;$B3B7C6   |
	NOP					;$B3B7C8   |
	NOP					;$B3B7C9   |
	NOP					;$B3B7CA   |
	NOP					;$B3B7CB   |
	NOP					;$B3B7CC   |
	NOP					;$B3B7CD   |
	NOP					;$B3B7CE   |
	LDA CPU.divide_result			;$B3B7CF   |
	ASL A					;$B3B7D2   |
	ASL A					;$B3B7D3   |
	ASL A					;$B3B7D4   |
	ASL A					;$B3B7D5   |
	TAY					;$B3B7D6   |
	LDA $34					;$B3B7D7   |
	CMP $38					;$B3B7D9   |
	BCS CODE_B3B7F9				;$B3B7DB   |
	LDA $5E					;$B3B7DD   |
	BIT $36					;$B3B7DF   |
	BPL CODE_B3B7E7				;$B3B7E1   |
	EOR #$FFFF				;$B3B7E3   |
	INC A					;$B3B7E6   |
CODE_B3B7E7:					;	   |
	STA $2A,x				;$B3B7E7   |
	STA $24,x				;$B3B7E9   |
	TYA					;$B3B7EB   |
	BIT $32					;$B3B7EC   |
	BPL CODE_B3B7F4				;$B3B7EE   |
	EOR #$FFFF				;$B3B7F0   |
	INC A					;$B3B7F3   |
CODE_B3B7F4:					;	   |
	STA $26,x				;$B3B7F4   |
	STA $20,x				;$B3B7F6   |
	RTS					;$B3B7F8  /

CODE_B3B7F9:
	LDA $5E					;$B3B7F9  \
	BIT $32					;$B3B7FB   |
	BPL CODE_B3B803				;$B3B7FD   |
	EOR #$FFFF				;$B3B7FF   |
	INC A					;$B3B802   |
CODE_B3B803:					;	   |
	STA $26,x				;$B3B803   |
	STA $20,x				;$B3B805   |
	TYA					;$B3B807   |
	BIT $36					;$B3B808   |
	BPL CODE_B3B810				;$B3B80A   |
	EOR #$FFFF				;$B3B80C   |
	INC A					;$B3B80F   |
CODE_B3B810:					;	   |
	STA $2A,x				;$B3B810   |
	STA $24,x				;$B3B812   |
	RTS					;$B3B814  /

CODE_B3B815:
	BIT #$0080				;$B3B815  \
	BNE CODE_B3B81E				;$B3B818   |
	AND #$00FF				;$B3B81A   |
	RTS					;$B3B81D  /

CODE_B3B81E:
	ORA #$FF00				;$B3B81E  \
	RTS					;$B3B821  /

CODE_B3B822:
	LDX current_sprite			;$B3B822  \
	LDA $26,x				;$B3B824   |
	BNE CODE_B3B82B				;$B3B826   |
	LDA $12,x				;$B3B828   |
	ASL A					;$B3B82A   |
CODE_B3B82B:					;	   |
	STA $32					;$B3B82B   |
	LDA $52,x				;$B3B82D   |
	CMP #$0008				;$B3B82F   |
	BEQ CODE_B3B875				;$B3B832   |
	LDA $06,x				;$B3B834   |
	SEC					;$B3B836   |
	SBC $42,x				;$B3B837   |
	EOR $32					;$B3B839   |
	BMI CODE_B3B875				;$B3B83B   |
	EOR $32					;$B3B83D   |
	STA $34					;$B3B83F   |
	BPL CODE_B3B856				;$B3B841   |
	LDA $46,x				;$B3B843   |
	XBA					;$B3B845   |
	AND #$00FF				;$B3B846   |
	STA $36					;$B3B849   |
	ASL A					;$B3B84B   |
	ADC $36					;$B3B84C   |
	LSR A					;$B3B84E   |
	LSR A					;$B3B84F   |
	ADC $34					;$B3B850   |
	BCC CODE_B3B866				;$B3B852   |
	BCS CODE_B3B875				;$B3B854   |
CODE_B3B856:					;	   |
	LDA $46,x				;$B3B856   |
	AND #$00FF				;$B3B858   |
	STA $36					;$B3B85B   |
	ASL A					;$B3B85D   |
	ADC $36					;$B3B85E   |
	LSR A					;$B3B860   |
	LSR A					;$B3B861   |
	CMP $34					;$B3B862   |
	BCS CODE_B3B875				;$B3B864   |
CODE_B3B866:					;	   |
	LDA $48,x				;$B3B866   |
	EOR $32					;$B3B868   |
	ASL A					;$B3B86A   |
	LDA $48,x				;$B3B86B   |
	BCS CODE_B3B882				;$B3B86D   |
	EOR #$FFFF				;$B3B86F   |
	INC A					;$B3B872   |
	BRA CODE_B3B882				;$B3B873  /

CODE_B3B875:
	LDA $48,x				;$B3B875  \
	EOR $32					;$B3B877   |
	ASL A					;$B3B879   |
	LDA $48,x				;$B3B87A   |
	BCC CODE_B3B882				;$B3B87C   |
	EOR #$FFFF				;$B3B87E   |
	INC A					;$B3B881   |
CODE_B3B882:					;	   |
	STA $26,x				;$B3B882   |
	STZ $20,x				;$B3B884   |
	RTS					;$B3B886  /

CODE_B3B887:
	LDX current_sprite			;$B3B887  \
	LDA $0D4E				;$B3B889   |
	CLC					;$B3B88C   |
	ADC #$0018				;$B3B88D   |
	STA $32					;$B3B890   |
	CMP $44,x				;$B3B892   |
	BCC CODE_B3B8AB				;$B3B894   |
	LDY $44,x				;$B3B896   |
	STA $44,x				;$B3B898   |
	CMP $0A,x				;$B3B89A   |
	BCC CODE_B3B8BD				;$B3B89C   |
	TYA					;$B3B89E   |
	SBC $44,x				;$B3B89F   |
	EOR #$FFFF				;$B3B8A1   |
	SEC					;$B3B8A4   |
	ADC $0A,x				;$B3B8A5   |
	STA $0A,x				;$B3B8A7   |
	BRA CODE_B3B8BD				;$B3B8A9  /

CODE_B3B8AB:
	JSL CODE_BB8BE9				;$B3B8AB  \
	LDA $32					;$B3B8AF   |
	CMP $74					;$B3B8B1   |
	BCS CODE_B3B8B7				;$B3B8B3   |
	LDA $74					;$B3B8B5   |
CODE_B3B8B7:					;	   |
	CMP $44,x				;$B3B8B7   |
	BCS CODE_B3B8BD				;$B3B8B9   |
	STA $44,x				;$B3B8BB   |
CODE_B3B8BD:					;	   |
	LDA $0D4E				;$B3B8BD   |
	CLC					;$B3B8C0   |
	ADC #$0014				;$B3B8C1   |
	CMP $0A,x				;$B3B8C4   |
	BCC CODE_B3B8CA				;$B3B8C6   |
	STA $0A,x				;$B3B8C8   |
CODE_B3B8CA:					;	   |
	RTS					;$B3B8CA  /

CODE_B3B8CB:
	LDA $0D4E				;$B3B8CB  \
	BPL CODE_B3B8D5				;$B3B8CE   |
CODE_B3B8D0:					;	   |
	JSL CODE_B9D100				;$B3B8D0   |
	RTS					;$B3B8D4  /

CODE_B3B8D5:
	LDX current_sprite			;$B3B8D5  \
	CLC					;$B3B8D7   |
	ADC #$0010				;$B3B8D8   |
	CMP $0A,x				;$B3B8DB   |
	BCS CODE_B3B8D0				;$B3B8DD   |
	LSR $3A,x				;$B3B8DF   |
	LDA $3A,x				;$B3B8E1   |
	PHA					;$B3B8E3   |
	JSL CODE_B9D100				;$B3B8E4   |
	PLA					;$B3B8E8   |
	CMP $3A,x				;$B3B8E9   |
	BNE CODE_B3B8EF				;$B3B8EB   |
	ASL $3A,x				;$B3B8ED   |
CODE_B3B8EF:					;	   |
	RTS					;$B3B8EF  /

flotsam_main:
	JSR CODE_B3A369				;$B3B8F0  /

DATA_B3B8F3:
	dw CODE_B3B8F9
	dw CODE_B3B910
	dw CODE_B3B944


CODE_B3B8F9:
	LDA $000A,y				;$B3B8F9  \
	CMP $0D4E				;$B3B8FC   |
	BCS CODE_B3B90D				;$B3B8FF   |
	LDA $005C,y				;$B3B901   |
	BNE CODE_B3B90D				;$B3B904   |
	JSL CODE_BB82B8				;$B3B906   |
	JML [$05A9]				;$B3B90A  /

CODE_B3B90D:
	TYX					;$B3B90D  \
	INC $2E,x				;$B3B90E   |
CODE_B3B910:					;	   |
	INC $19AC				;$B3B910   |
	LDA #$0118				;$B3B913   |
	JSL CODE_BEBE14				;$B3B916   |
	BCS CODE_B3B937				;$B3B91A   |
	JSL CODE_BCFB58				;$B3B91C   |
	LDA #$1400				;$B3B920   |
	JSL CODE_BEBE8B				;$B3B923   |
	BCS CODE_B3B937				;$B3B927   |
CODE_B3B929:					;	   |
	JSL CODE_BEF039				;$B3B929   |
	JSR CODE_B3B887				;$B3B92D   |
	JSL CODE_B9D100				;$B3B930   |
	JMP CODE_B38000				;$B3B934  /

CODE_B3B937:
	BNE CODE_B3B929				;$B3B937  \
	INC $2E,x				;$B3B939   |
	LDA #$01AB				;$B3B93B   |
	JSR CODE_B3C9CB				;$B3B93E   |
	JMP CODE_B38000				;$B3B941  /

CODE_B3B944:
	JSL CODE_BEF039				;$B3B944  \
	JSL CODE_B9D100				;$B3B948   |
	JMP CODE_B3A652				;$B3B94C  /

shuri_main:
	JSR CODE_B3A369				;$B3B94F  /

DATA_B3B952:
	dw CODE_B3B958
	dw CODE_B3B9A7
	dw CODE_B3BA88


CODE_B3B958:
	TAX					;$B3B958  \
	BNE CODE_B3B962				;$B3B959   |
	TYX					;$B3B95B   |
	STZ $20,x				;$B3B95C   |
	STZ $24,x				;$B3B95E   |
	INC $2F,x				;$B3B960   |
CODE_B3B962:					;	   |
	LDA #$0118				;$B3B962   |
	JSL CODE_BEBE14				;$B3B965   |
	BCS CODE_B3B978				;$B3B969   |
	JSL CODE_BCFB58				;$B3B96B   |
	LDA #$1400				;$B3B96F   |
	JSL CODE_BEBE8B				;$B3B972   |
	BCC CODE_B3B97D				;$B3B976   |
CODE_B3B978:					;	   |
	BNE CODE_B3B97D				;$B3B978   |
	BRL CODE_B3BA93				;$B3B97A  /

CODE_B3B97D:
	JSL CODE_BEF039				;$B3B97D  \
	JSR CODE_B3B98B				;$B3B981   |
	JSL CODE_B9D100				;$B3B984   |
	JMP CODE_B38000				;$B3B988  /

CODE_B3B98B:
	LDX current_sprite			;$B3B98B  \
	LDA $5C,x				;$B3B98D   |
	BNE CODE_B3B9A6				;$B3B98F   |
	LDA $0D4E				;$B3B991   |
	CMP $0A,x				;$B3B994   |
	BCC CODE_B3B9A6				;$B3B996   |
	STA $0A,x				;$B3B998   |
	LDA $2A,x				;$B3B99A   |
	BPL CODE_B3B9A6				;$B3B99C   |
	EOR #$FFFF				;$B3B99E   |
	INC A					;$B3B9A1   |
	STA $2A,x				;$B3B9A2   |
	STA $24,x				;$B3B9A4   |
CODE_B3B9A6:					;	   |
	RTS					;$B3B9A6  /

CODE_B3B9A7:
	TAX					;$B3B9A7  \
	JMP (DATA_B3B9AB,x)			;$B3B9A8  /

DATA_B3B9AB:
	dw CODE_B3B9B3
	dw CODE_B3B9BE
	dw CODE_B3BA04
	dw CODE_B3BA48

CODE_B3B9B3:
	TYX					;$B3B9B3  \
	STZ $20,x				;$B3B9B4   |
	STZ $24,x				;$B3B9B6   |
	LDA $0A,x				;$B3B9B8   |
	STA $44,x				;$B3B9BA   |
	INC $2F,x				;$B3B9BC   |
CODE_B3B9BE:					;	   |
	LDA #$0118				;$B3B9BE   |
	JSL CODE_BEBE14				;$B3B9C1   |
	BCS CODE_B3B9D4				;$B3B9C5   |
	JSL CODE_BCFB58				;$B3B9C7   |
	LDA #$1400				;$B3B9CB   |
	JSL CODE_BEBE8B				;$B3B9CE   |
	BCC CODE_B3B9D9				;$B3B9D2   |
CODE_B3B9D4:					;	   |
	BNE CODE_B3B9D9				;$B3B9D4   |
	BRL CODE_B3BA93				;$B3B9D6  /

CODE_B3B9D9:
	TYX					;$B3B9D9  \
	LDA $0C,x				;$B3B9DA   |
	LDY $0E,x				;$B3B9DC   |
	JSR CODE_B3C6C0				;$B3B9DE   |
	BCS CODE_B3B9F6				;$B3B9E1   |
	INC $2F,x				;$B3B9E3   |
	JSR CODE_B3BA6E				;$B3B9E5   |
	LDA #$0181				;$B3B9E8   |
	JSL CODE_B9D0C6				;$B3B9EB   |
	LDX current_sprite			;$B3B9EF   |
	LDA #$0200				;$B3B9F1   |
	STA $3A,x				;$B3B9F4   |
CODE_B3B9F6:					;	   |
	JSL CODE_BEF039				;$B3B9F6   |
	JSR CODE_B3B887				;$B3B9FA   |
	JSL CODE_B9D100				;$B3B9FD   |
	JMP CODE_B38000				;$B3BA01  /

CODE_B3BA04:
	LDA #$0118				;$B3BA04  \
	JSL CODE_BEBE14				;$B3BA07   |
	BCS CODE_B3BA1A				;$B3BA0B   |
	JSL CODE_BCFB58				;$B3BA0D   |
	LDA #$1400				;$B3BA11   |
	JSL CODE_BEBE8B				;$B3BA14   |
	BCC CODE_B3BA1C				;$B3BA18   |
CODE_B3BA1A:					;	   |
	BEQ CODE_B3BA93				;$B3BA1A   |
CODE_B3BA1C:					;	   |
	JSL CODE_BEF039				;$B3BA1C   |
	LDA $1E,x				;$B3BA20   |
	CMP #$000F				;$B3BA22   |
	BNE CODE_B3BA2A				;$B3BA25   |
	JSR CODE_B3BA6E				;$B3BA27   |
CODE_B3BA2A:					;	   |
	DEC $1E,x				;$B3BA2A   |
	BPL CODE_B3BA3E				;$B3BA2C   |
	INC $2F,x				;$B3BA2E   |
	LDA #$000F				;$B3BA30   |
	STA $52,x				;$B3BA33   |
	LDA $22,x				;$B3BA35   |
	STA $48,x				;$B3BA37   |
	LDA $28,x				;$B3BA39   |
	JSR CODE_B3B753				;$B3BA3B   |
CODE_B3BA3E:					;	   |
	JSR CODE_B3B887				;$B3BA3E   |
	JSL CODE_B9D100				;$B3BA41   |
	JMP CODE_B38000				;$B3BA45  /

CODE_B3BA48:
	LDA #$0118				;$B3BA48  \
	JSL CODE_BEBE14				;$B3BA4B   |
	BCS CODE_B3BA5E				;$B3BA4F   |
	JSL CODE_BCFB58				;$B3BA51   |
	LDA #$1400				;$B3BA55   |
	JSL CODE_BEBE8B				;$B3BA58   |
	BCC CODE_B3BA60				;$B3BA5C   |
CODE_B3BA5E:					;	   |
	BEQ CODE_B3BA93				;$B3BA5E   |
CODE_B3BA60:					;	   |
	JSL CODE_BEF039				;$B3BA60   |
	JSR CODE_B3B887				;$B3BA64   |
	JSL CODE_B9D100				;$B3BA67   |
	JMP CODE_B38000				;$B3BA6B  /

CODE_B3BA6E:
	LDY $0593				;$B3BA6E  \
	LDA $0006,y				;$B3BA71   |
	STA $4E,x				;$B3BA74   |
	LDA $0D4E				;$B3BA76   |
	CLC					;$B3BA79   |
	ADC #$0018				;$B3BA7A   |
	CMP $000A,y				;$B3BA7D   |
	BCS CODE_B3BA85				;$B3BA80   |
	LDA $000A,y				;$B3BA82   |
CODE_B3BA85:					;	   |
	STA $50,x				;$B3BA85   |
	RTS					;$B3BA87  /

CODE_B3BA88:
	JSL CODE_BEF039				;$B3BA88  \
	JSL CODE_B9D100				;$B3BA8C   |
	JMP CODE_B3A652				;$B3BA90  /

CODE_B3BA93:
	LDA #$0002				;$B3BA93  \
	STA $2E,x				;$B3BA96   |
	LDA #$0182				;$B3BA98   |
	JSR CODE_B3C9CB				;$B3BA9B   |
	JMP CODE_B38000				;$B3BA9E  /

kaboing_main:
	JSR CODE_B3A369				;$B3BAA1  /

DATA_B3BAA4:
	dw CODE_B3BAAC
	dw CODE_B3BAC2
	dw CODE_B3BB7B
	dw CODE_B3BB7B


CODE_B3BAAC:
	TAX					;$B3BAAC  \
	JMP (DATA_B3BAB0,x)			;$B3BAAD  /

DATA_B3BAB0:
	dw CODE_B3BABF
	dw CODE_B3BAB4


CODE_B3BAB4:
	LDA $000E,y				;$B3BAB4  \
	BNE CODE_B3BABF				;$B3BAB7   |
	TYX					;$B3BAB9   |
	DEC $2F,x				;$B3BABA   |
	JSR CODE_B3BB58				;$B3BABC   |
CODE_B3BABF:					;	   |
	BRL CODE_B3BB31				;$B3BABF  /

CODE_B3BAC2:
	TAX					;$B3BAC2  \
	JMP (DATA_B3BAC6,x)			;$B3BAC3  /

DATA_B3BAC6:
	dw CODE_B3BAD2
	dw CODE_B3BAEB
	dw CODE_B3BAEE
	dw CODE_B3BAFD
	dw CODE_B3BB19
	dw CODE_B3BB1C


CODE_B3BAD2:
	TYX					;$B3BAD2  \
	LDA $42,x				;$B3BAD3   |
	STA $50,x				;$B3BAD5   |
	LDA $44,x				;$B3BAD7   |
	STA $2A,x				;$B3BAD9   |
	LDA $46,x				;$B3BADB   |
	STA $22,x				;$B3BADD   |
	LDA $1C,x				;$B3BADF   |
	AND #$00FF				;$B3BAE1   |
	STA $4E,x				;$B3BAE4   |
	LDA #$0101				;$B3BAE6   |
	STA $2E,x				;$B3BAE9   |
CODE_B3BAEB:					;	   |
	BRL CODE_B3BB31				;$B3BAEB  /

CODE_B3BAEE:
	LDA $000E,y				;$B3BAEE  \
	BNE CODE_B3BAEB				;$B3BAF1   |
	TYX					;$B3BAF3   |
	DEC $2F,x				;$B3BAF4   |
	JSR CODE_B3BB58				;$B3BAF6   |
	DEC $4E,x				;$B3BAF9   |
	BNE CODE_B3BAEB				;$B3BAFB   |
CODE_B3BAFD:					;	   |
	TYX					;$B3BAFD   |
	LDA $48,x				;$B3BAFE   |
	STA $50,x				;$B3BB00   |
	LDA $4A,x				;$B3BB02   |
	STA $2A,x				;$B3BB04   |
	LDA $4C,x				;$B3BB06   |
	STA $22,x				;$B3BB08   |
	LDA $1D,x				;$B3BB0A   |
	AND #$00FF				;$B3BB0C   |
	BNE CODE_B3BB12				;$B3BB0F   |
	DEC A					;$B3BB11   |
CODE_B3BB12:					;	   |
	STA $4E,x				;$B3BB12   |
	LDA #$0401				;$B3BB14   |
	STA $2E,x				;$B3BB17   |
CODE_B3BB19:					;	   |
	BRL CODE_B3BB31				;$B3BB19  /

CODE_B3BB1C:
	LDA $000E,y				;$B3BB1C  \
	BNE CODE_B3BB19				;$B3BB1F   |
	TYX					;$B3BB21   |
	DEC $2F,x				;$B3BB22   |
	JSR CODE_B3BB58				;$B3BB24   |
	LDA $4E,x				;$B3BB27   |
	BMI CODE_B3BB19				;$B3BB29   |
	DEC $4E,x				;$B3BB2B   |
	BNE CODE_B3BB19				;$B3BB2D   |
	BRA CODE_B3BAD2				;$B3BB2F  /

CODE_B3BB31:
	LDA #$0118				;$B3BB31  \
	JSL CODE_BEBE14				;$B3BB34   |
	BCC CODE_B3BB3C				;$B3BB38   |
	BEQ CODE_B3BB49				;$B3BB3A   |
CODE_B3BB3C:					;	   |
	JSL CODE_BCFB58				;$B3BB3C   |
	LDA #$5428				;$B3BB40   |
	JSL CODE_BEBE8B				;$B3BB43   |
	BCC CODE_B3BB4E				;$B3BB47   |
CODE_B3BB49:					;	   |
	BNE CODE_B3BB4E				;$B3BB49   |
	BRL CODE_B3BB85				;$B3BB4B  /

CODE_B3BB4E:
	JSR CODE_B3B8CB				;$B3BB4E  \
	JSL CODE_BEF039				;$B3BB51   |
	JMP CODE_B38000				;$B3BB55  /

CODE_B3BB58:
	LDA $50,x				;$B3BB58  \
	CMP $26,x				;$B3BB5A   |
	STZ $26,x				;$B3BB5C   |
	STZ $20,x				;$B3BB5E   |
	BNE CODE_B3BB74				;$B3BB60   |
	LDA $10,x				;$B3BB62   |
	AND #$0007				;$B3BB64   |
	CMP #$0006				;$B3BB67   |
	BCC CODE_B3BB7A				;$B3BB6A   |
	LDA $10,x				;$B3BB6C   |
	EOR $50,x				;$B3BB6E   |
	BMI CODE_B3BB7A				;$B3BB70   |
	LDA $50,x				;$B3BB72   |
CODE_B3BB74:					;	   |
	EOR #$FFFF				;$B3BB74   |
	INC A					;$B3BB77   |
	STA $50,x				;$B3BB78   |
CODE_B3BB7A:					;	   |
	RTS					;$B3BB7A  /

CODE_B3BB7B:
	JSL CODE_BEF039				;$B3BB7B  \
	JSR CODE_B3B8CB				;$B3BB7F   |
	JMP CODE_B3A652				;$B3BB82  /

CODE_B3BB85:
	LDX $6A					;$B3BB85  \
	LDA #$0100				;$B3BB87   |
	BIT $12,x				;$B3BB8A   |
	BVS CODE_B3BB91				;$B3BB8C   |
	LDA #$FF00				;$B3BB8E   |
CODE_B3BB91:					;	   |
	LDX current_sprite			;$B3BB91   |
	STA $26,x				;$B3BB93   |
	STA $20,x				;$B3BB95   |
	LDA #$FC00				;$B3BB97   |
	STA $24,x				;$B3BB9A   |
	LDA #$0004				;$B3BB9C   |
	STA $52,x				;$B3BB9F   |
	LDA #$0192				;$B3BBA1   |
	JSR CODE_B3A627				;$B3BBA4   |
	LDA #$0003				;$B3BBA7   |
	STA $2E,x				;$B3BBAA   |
	JMP CODE_B38000				;$B3BBAC  /

unknown_sprite_00A4_main:
	JSR CODE_B3A369				;$B3BBAF  /

DATA_B3BBB2:
	dw CODE_B3BBB8
	dw CODE_B3BBC6
	dw CODE_B3BBE3


CODE_B3BBB8:
	LDA $0042,y				;$B3BBB8  \
	JSL queue_sound_effect			;$B3BBBB   |
	JSL CODE_BBBB44				;$B3BBBF   |
	JML [$05A9]				;$B3BBC3  /

CODE_B3BBC6:
	TYX					;$B3BBC6  \
	LDA $2E,x				;$B3BBC7   |
	AND #$00FF				;$B3BBC9   |
	BNE CODE_B3BBD2				;$B3BBCC   |
	INC $2F,x				;$B3BBCE   |
	STZ $46,x				;$B3BBD0   |
CODE_B3BBD2:					;	   |
	DEC $46,x				;$B3BBD2   |
	BPL CODE_B3BBE0				;$B3BBD4   |
	LDA $44,x				;$B3BBD6   |
	STA $46,x				;$B3BBD8   |
	LDA $42,x				;$B3BBDA   |
	JSL queue_sound_effect			;$B3BBDC   |
CODE_B3BBE0:					;	   |
	JMP CODE_B38000				;$B3BBE0  /

CODE_B3BBE3:
	JSL CODE_BBBB99				;$B3BBE3  \
	LDY current_sprite			;$B3BBE7   |
	BCS CODE_B3BBF4				;$B3BBE9   |
	LDA $0042,y				;$B3BBEB   |
	JSR CODE_B3BC01				;$B3BBEE   |
	JML [$05A9]				;$B3BBF1  /

CODE_B3BBF4:
	LDA $0042,y				;$B3BBF4  \
	AND #$FF00				;$B3BBF7   |
	JSL queue_sound_effect			;$B3BBFA   |
	JML [$05A9]				;$B3BBFE  /

CODE_B3BC01:
	SEP #$30				;$B3BC01  \
	XBA					;$B3BC03   |
	TAX					;$B3BC04   |
	XBA					;$B3BC05   |
	CMP $0619,x				;$B3BC06   |
	REP #$30				;$B3BC09   |
	BEQ CODE_B3BC11				;$B3BC0B   |
	JSL queue_sound_effect			;$B3BC0D   |
CODE_B3BC11:					;	   |
	RTS					;$B3BC11  /

unknown_sprite_00A8_main:
	JSR CODE_B3A369				;$B3BC12  /

DATA_B3BC16:
	dw CODE_B3BC19
	dw CODE_B3BC68

CODE_B3BC19:
	TAX					;$B3BC19  \
	JMP (DATA_B3BC1D,x)			;$B3BC1A  /

DATA_B3BC1D:
	dw CODE_B3BC2C
	dw CODE_B3BC25
	dw CODE_B3BC31
	dw CODE_B3BC4B

CODE_B3BC25:
	LDX $0593				;$B3BC25  \
	LDA $0E,x				;$B3BC28   |
	BNE CODE_B3BC56				;$B3BC2A   |
CODE_B3BC2C:					;	   |
	TYX					;$B3BC2C   |
	INC $2F,x				;$B3BC2D   |
	BRA CODE_B3BC56				;$B3BC2F  /

CODE_B3BC31:
	TYX					;$B3BC31  \
	DEC $50,x				;$B3BC32   |
	BPL CODE_B3BC56				;$B3BC34   |
	STZ $0A,x				;$B3BC36   |
	JSL CODE_BEF039				;$B3BC38   |
CODE_B3BC3C:					;	   |
	LDX current_sprite			;$B3BC3C   |
	LDA $46,x				;$B3BC3E   |
	CMP $06,x				;$B3BC40   |
	BCS CODE_B3BC49				;$B3BC42   |
if !version == 1				;	   |
	JSR CODE_B3F265+1			;$B3BC44   |\ This is a glitch.
else						;	   | | If this routine is called the game will crash.
	JSR DATA_B3F31E-5			;$B3BC44   |/
endif					;
	BRA CODE_B3BC3C				;$B3BC47  /

CODE_B3BC49:
	INC $2F,x				;$B3BC49  \
CODE_B3BC4B:					;	   |
	LDX current_sprite			;$B3BC4B   |
	STZ $0A,x				;$B3BC4D   |
	STX $0AE8				;$B3BC4F   |
	JSL CODE_BEF039				;$B3BC52   |
CODE_B3BC56:					;	   |
	LDX current_sprite			;$B3BC56   |
	LDY $0593				;$B3BC58   |
	LDA $000A,y				;$B3BC5B   |
	STA $0A,x				;$B3BC5E   |
	LDA $000E,y				;$B3BC60   |
	STA $0E,x				;$B3BC63   |
	JML [$05A9]				;$B3BC65  /

CODE_B3BC68:
	JML [$05A9]				;$B3BC68  /

mini_necky_main:
	JSR CODE_B3A369				;$B3BC6B  /

DATA_B3BC6E:
	dw CODE_B3BC84
	dw CODE_B3BD0C
	dw CODE_B3BCC0
	dw CODE_B3BCD0
	dw CODE_B3BCE3
	dw CODE_B3BD01
	dw CODE_B3BCA3
	dw CODE_B3BD39
	dw CODE_B3BD55
	dw CODE_B3BD58
	dw CODE_B3BD6B


CODE_B3BC84:
	JSR CODE_B3BDC7				;$B3BC84  \
	BCS CODE_B3BCA0				;$B3BC87   |
	DEC $4E,x				;$B3BC89   |
	BPL CODE_B3BC98				;$B3BC8B   |
	JSR CODE_B3BDA7				;$B3BC8D   |
	LDA #$0002				;$B3BC90   |
	STA $2E,x				;$B3BC93   |
	JMP CODE_B38000				;$B3BC95  /

CODE_B3BC98:
	JSL CODE_BEF039				;$B3BC98  \
	JSL CODE_B9D100				;$B3BC9C   |
CODE_B3BCA0:					;	   |
	JMP CODE_B38000				;$B3BCA0  /

CODE_B3BCA3:
	JSR CODE_B3BDC7				;$B3BCA3  \
	BCS CODE_B3BCBD				;$B3BCA6   |
	LDX current_sprite			;$B3BCA8   |
	LDA $10,x				;$B3BCAA   |
	LDY $1E,x				;$B3BCAC   |
	JSR CODE_B3C6C0				;$B3BCAE   |
	BCS CODE_B3BCB5				;$B3BCB1   |
	STZ $2E,x				;$B3BCB3   |
CODE_B3BCB5:					;	   |
	JSL CODE_BEF039				;$B3BCB5   |
	JSL CODE_B9D100				;$B3BCB9   |
CODE_B3BCBD:					;	   |
	JMP CODE_B38000				;$B3BCBD  /

CODE_B3BCC0:
	JSR CODE_B3BDC7				;$B3BCC0  \
	BCS CODE_B3BCCD				;$B3BCC3   |
	JSL CODE_BEF039				;$B3BCC5   |
	JSL CODE_B9D100				;$B3BCC9   |
CODE_B3BCCD:					;	   |
	JML [$05A9]				;$B3BCCD  /

CODE_B3BCD0:
	TYX					;$B3BCD0  \
	INC $2E,x				;$B3BCD1   |
	LDA $0C,x				;$B3BCD3   |
	STA $24,x				;$B3BCD5   |
	LDA $0E,x				;$B3BCD7   |
	STA $2A,x				;$B3BCD9   |
	LDA $22,x				;$B3BCDB   |
	STA $20,x				;$B3BCDD   |
	LDA $28,x				;$B3BCDF   |
	STA $26,x				;$B3BCE1   |
CODE_B3BCE3:					;	   |
	JSR CODE_B3BDC7				;$B3BCE3   |
	BCS CODE_B3BCF0				;$B3BCE6   |
	JSL CODE_BEF039				;$B3BCE8   |
	JSL CODE_B9D100				;$B3BCEC   |
CODE_B3BCF0:					;	   |
	LDX current_sprite			;$B3BCF0   |
	LDA $2A,x				;$B3BCF2   |
	CMP $24,x				;$B3BCF4   |
	BNE CODE_B3BCFE				;$B3BCF6   |
	LDA #$00B4				;$B3BCF8   |
	JSR CODE_B3BE28				;$B3BCFB   |
CODE_B3BCFE:					;	   |
	JML [$05A9]				;$B3BCFE  /

CODE_B3BD01:
	JSL CODE_BEF039				;$B3BD01  \
	JSL CODE_B9D100				;$B3BD05   |
	JMP CODE_B3A652				;$B3BD09  /

CODE_B3BD0C:
	JSR CODE_B3BDC7				;$B3BD0C  \
	LDX current_sprite			;$B3BD0F   |
	BCS CODE_B3BD36				;$B3BD11   |
	DEC $50,x				;$B3BD13   |
	BPL CODE_B3BD24				;$B3BD15   |
	LDA #$0007				;$B3BD17   |
	STA $2E,x				;$B3BD1A   |
	SEP #$20				;$B3BD1C   |
	STZ $53,x				;$B3BD1E   |
	REP #$20				;$B3BD20   |
	BRA CODE_B3BD36				;$B3BD22  /

CODE_B3BD24:
	LDA #$0002				;$B3BD24  \
	JSL CODE_BEF03D				;$B3BD27   |
	LDA #$0006				;$B3BD2B   |
	JSL CODE_BEF03D				;$B3BD2E   |
	JSL CODE_B9D100				;$B3BD32   |
CODE_B3BD36:					;	   |
	JML [$05A9]				;$B3BD36  /

CODE_B3BD39:
	JSR CODE_B3BDC7				;$B3BD39  \
	BCS CODE_B3BD52				;$B3BD3C   |
	DEC $4E,x				;$B3BD3E   |
	BPL CODE_B3BD4A				;$B3BD40   |
	INC $2E,x				;$B3BD42   |
	JSR CODE_B3BDA7				;$B3BD44   |
	JMP CODE_B38000				;$B3BD47  /

CODE_B3BD4A:
	JSL CODE_BEF039				;$B3BD4A  \
	JSL CODE_B9D100				;$B3BD4E   |
CODE_B3BD52:					;	   |
	JML [$05A9]				;$B3BD52  /

CODE_B3BD55:
	JMP CODE_B3BCC0				;$B3BD55  /

CODE_B3BD58:
	TYX					;$B3BD58  \
	INC $2E,x				;$B3BD59   |
	LDA $0C,x				;$B3BD5B   |
	STA $24,x				;$B3BD5D   |
	LDA $0E,x				;$B3BD5F   |
	STA $2A,x				;$B3BD61   |
	LDA $22,x				;$B3BD63   |
	STA $20,x				;$B3BD65   |
	LDA $28,x				;$B3BD67   |
	STA $26,x				;$B3BD69   |
CODE_B3BD6B:					;	   |
	JSR CODE_B3BDC7				;$B3BD6B   |
	BCS CODE_B3BD78				;$B3BD6E   |
	JSL CODE_BEF039				;$B3BD70   |
	JSL CODE_B9D100				;$B3BD74   |
CODE_B3BD78:					;	   |
	LDX current_sprite			;$B3BD78   |
	LDA $2A,x				;$B3BD7A   |
	CMP $24,x				;$B3BD7C   |
	BEQ CODE_B3BD83				;$B3BD7E   |
	JML [$05A9]				;$B3BD80  /

CODE_B3BD83:
	BIT $12,x				;$B3BD83  \
	BVC CODE_B3BD95				;$B3BD85   |
	LDA $17BA				;$B3BD87   |
	CLC					;$B3BD8A   |
	ADC #$0120				;$B3BD8B   |
	CMP $06,x				;$B3BD8E   |
	BCC CODE_B3BDA0				;$B3BD90   |
	JML [$05A9]				;$B3BD92  /

CODE_B3BD95:
	LDA $17BA				;$B3BD95  \
	SEC					;$B3BD98   |
	SBC #$0020				;$B3BD99   |
	CMP $06,x				;$B3BD9C   |
	BCS CODE_B3BDA4				;$B3BD9E   |
CODE_B3BDA0:					;	   |
	JSL CODE_BB82B8				;$B3BDA0   |
CODE_B3BDA4:					;	   |
	JML [$05A9]				;$B3BDA4  /

CODE_B3BDA7:
	STZ $26,x				;$B3BDA7  \
	STZ $2A,x				;$B3BDA9   |
	LDA #$FF80				;$B3BDAB   |
	STA $24,x				;$B3BDAE   |
	ASL A					;$B3BDB0   |
	BIT $12,x				;$B3BDB1   |
	BVC CODE_B3BDB8				;$B3BDB3   |
	LDA #$0100				;$B3BDB5   |
CODE_B3BDB8:					;	   |
	STA $20,x				;$B3BDB8   |
	LDA #$000F				;$B3BDBA   |
	STA $52,x				;$B3BDBD   |
	LDA #$0194				;$B3BDBF   |
	JSL CODE_B9D0C6				;$B3BDC2   |
	RTS					;$B3BDC6  /

CODE_B3BDC7:
	LDA #$0118				;$B3BDC7  \
	JSL CODE_BEBE14				;$B3BDCA   |
	BCS CODE_B3BDDE				;$B3BDCE   |
	JSL CODE_BCFB58				;$B3BDD0   |
	LDA #$5428				;$B3BDD4   |
	JSL CODE_BEBE8B				;$B3BDD7   |
	BCS CODE_B3BDDE				;$B3BDDB   |
CODE_B3BDDD:					;	   |
	RTS					;$B3BDDD  /

CODE_B3BDDE:
	BNE CODE_B3BDDD				;$B3BDDE  \
	LDX $6A					;$B3BDE0   |
	LDA $12,x				;$B3BDE2   |
	AND #$4000				;$B3BDE4   |
	LDX current_sprite			;$B3BDE7   |
	EOR $12,x				;$B3BDE9   |
	AND #$4000				;$B3BDEB   |
	EOR $12,x				;$B3BDEE   |
	EOR #$4000				;$B3BDF0   |
	STA $12,x				;$B3BDF3   |
	LDA #$0100				;$B3BDF5   |
	BIT $12,x				;$B3BDF8   |
	BVS CODE_B3BDFF				;$B3BDFA   |
	LDA #$FF00				;$B3BDFC   |
CODE_B3BDFF:					;	   |
	STA $26,x				;$B3BDFF   |
	STA $20,x				;$B3BE01   |
	LDA #$FA00				;$B3BE03   |
	STA $24,x				;$B3BE06   |
	LDA #$0004				;$B3BE08   |
	STA $52,x				;$B3BE0B   |
	LDA #$0195				;$B3BE0D   |
	JSR CODE_B3A627				;$B3BE10   |
	LDA level_number			;$B3BE13   |
	CMP #$000D				;$B3BE15   |
	BNE CODE_B3BE21				;$B3BE18   |
	LDA $12,x				;$B3BE1A   |
	EOR #$2000				;$B3BE1C   |
	STA $12,x				;$B3BE1F   |
CODE_B3BE21:					;	   |
	LDA #$0005				;$B3BE21   |
	STA $2E,x				;$B3BE24   |
	SEC					;$B3BE26   |
	RTS					;$B3BE27  /

CODE_B3BE28:
	PHA					;$B3BE28  \
	JSL CODE_BBBB69				;$B3BE29   |
	BCS CODE_B3BE31				;$B3BE2D   |
	PLA					;$B3BE2F   |
	RTS					;$B3BE30  /

CODE_B3BE31:
	JSL CODE_BB82B8				;$B3BE31  \
	LDX current_sprite			;$B3BE35   |
	LDA #$00F0				;$B3BE37   |
	STA $00,x				;$B3BE3A   |
	LDA #$0001				;$B3BE3C   |
	STA $2E,x				;$B3BE3F   |
	PLA					;$B3BE41   |
	STA $42,x				;$B3BE42   |
	LDA #$0002				;$B3BE44   |
	STA $58,x				;$B3BE47   |
	STZ $1A,x				;$B3BE49   |
	STZ $16,x				;$B3BE4B   |
	STZ $06,x				;$B3BE4D   |
	STZ $0A,x				;$B3BE4F   |
	RTS					;$B3BE51  /

kannon_main:
	JSR CODE_B3A369				;$B3BE52  /

DATA_B3BE55:
	dw CODE_B3BE59
	dw CODE_B3BE87


CODE_B3BE59:
	TAX					;$B3BE59  \
	JMP (DATA_B3BE5D,x)			;$B3BE5A  /

DATA_B3BE5D:
	dw CODE_B3BE63
	dw CODE_B3BE6C
	dw CODE_B3BE7C


CODE_B3BE63:
	TYX					;$B3BE63  \
	LDA $0A,x				;$B3BE64   |
	STA $0C,x				;$B3BE66   |
	INC $2F,x				;$B3BE68   |
	STZ $28,x				;$B3BE6A   |
CODE_B3BE6C:					;	   |
	JSR CODE_B3BE92				;$B3BE6C   |
	BCS CODE_B3BE79				;$B3BE6F   |
	JSL CODE_BEF039				;$B3BE71   |
	JSL CODE_B9D100				;$B3BE75   |
CODE_B3BE79:					;	   |
	JMP CODE_B38000				;$B3BE79  /

CODE_B3BE7C:
	JSR CODE_B3BEE6				;$B3BE7C  \
	BCS CODE_B3BE6C				;$B3BE7F   |
	LDX current_sprite			;$B3BE81   |
	DEC $2F,x				;$B3BE83   |
	BRA CODE_B3BE6C				;$B3BE85  /

CODE_B3BE87:
	JSL CODE_BEF039				;$B3BE87  \
	JSL CODE_B9D100				;$B3BE8B   |
	JMP CODE_B3A652				;$B3BE8F  /

CODE_B3BE92:
	LDA #$0118				;$B3BE92  \
	JSL CODE_BEBE14				;$B3BE95   |
	BCS CODE_B3BEAA				;$B3BE99   |
	JSL CODE_BCFB58				;$B3BE9B   |
	LDA #$5428				;$B3BE9F   |
	JSL CODE_BEBE8B				;$B3BEA2   |
	BCS CODE_B3BEAA				;$B3BEA6   |
CODE_B3BEA8:					;	   |
	CLC					;$B3BEA8   |
	RTS					;$B3BEA9  /

CODE_B3BEAA:
	BNE CODE_B3BEA8				;$B3BEAA  \
	LDX $6A					;$B3BEAC   |
	LDA $12,x				;$B3BEAE   |
	AND #$4000				;$B3BEB0   |
	LDX current_sprite			;$B3BEB3   |
	EOR $12,x				;$B3BEB5   |
	AND #$4000				;$B3BEB7   |
	EOR $12,x				;$B3BEBA   |
	EOR #$4000				;$B3BEBC   |
	STA $12,x				;$B3BEBF   |
	LDA #$0100				;$B3BEC1   |
	BIT $12,x				;$B3BEC4   |
	BVS CODE_B3BECB				;$B3BEC6   |
	LDA #$FF00				;$B3BEC8   |
CODE_B3BECB:					;	   |
	STA $26,x				;$B3BECB   |
	STA $20,x				;$B3BECD   |
	LDA #$FA00				;$B3BECF   |
	STA $24,x				;$B3BED2   |
	LDA #$0004				;$B3BED4   |
	STA $52,x				;$B3BED7   |
	LDA #$017F				;$B3BED9   |
	JSR CODE_B3A627				;$B3BEDC   |
	LDA #$0001				;$B3BEDF   |
	STA $2E,x				;$B3BEE2   |
	SEC					;$B3BEE4   |
	RTS					;$B3BEE5  /

CODE_B3BEE6:
	LDY $0593				;$B3BEE6  \
	LDA $0040,y				;$B3BEE9   |
	AND #$E000				;$B3BEEC   |
	CMP #$E000				;$B3BEEF   |
	BEQ CODE_B3BF56				;$B3BEF2   |
	LDX current_sprite			;$B3BEF4   |
	LDA $22,x				;$B3BEF6   |
	STA $32					;$B3BEF8   |
	LDA #$00FF				;$B3BEFA   |
	STA $34					;$B3BEFD   |
	LDY $28,x				;$B3BEFF   |
	LDA [$32],y				;$B3BF01   |
	PHY					;$B3BF03   |
	TAY					;$B3BF04   |
	JSL CODE_BB8432				;$B3BF05   |
	PLY					;$B3BF09   |
	BCS CODE_B3BF56				;$B3BF0A   |
	LDX current_sprite			;$B3BF0C   |
	LDA $22,x				;$B3BF0E   |
	STA $32					;$B3BF10   |
	LDA #$00FF				;$B3BF12   |
	STA $34					;$B3BF15   |
	LDX alternate_sprite			;$B3BF17   |
	INY					;$B3BF19   |
	INY					;$B3BF1A   |
	LDA [$32],y				;$B3BF1B   |
	AND #$00FF				;$B3BF1D   |
	STA $50,x				;$B3BF20   |
	LDX current_sprite			;$B3BF22   |
	INY					;$B3BF24   |
	LDA [$32],y				;$B3BF25   |
	AND #$00FF				;$B3BF27   |
	STA $50,x				;$B3BF2A   |
	INY					;$B3BF2C   |
	LDA [$32],y				;$B3BF2D   |
	BEQ CODE_B3BF32				;$B3BF2F   |
	TYA					;$B3BF31   |
CODE_B3BF32:					;	   |
	STA $28,x				;$B3BF32   |
	LDY alternate_sprite			;$B3BF34   |
	LDA $0A,x				;$B3BF36   |
	CLC					;$B3BF38   |
	ADC #$0010				;$B3BF39   |
	STA $004E,y				;$B3BF3C   |
	LDA $4E,x				;$B3BF3F   |
	STA $005A,y				;$B3BF41   |
	LDA #$054B				;$B3BF44   |
	JSL queue_sound_effect			;$B3BF47   |
	LDY #$0008				;$B3BF4B   |
	LDA [$8E],y				;$B3BF4E   |
	TAY					;$B3BF50   |
	JSL CODE_BB842C				;$B3BF51   |
	CLC					;$B3BF55   |
CODE_B3BF56:					;	   |
	RTS					;$B3BF56  /

shot_canball_or_barrel_main:
	JSR CODE_B3A369				;$B3BF57  /

DATA_B3BF5A:
	dw CODE_B3BF62
	dw CODE_B3C094
	dw CODE_B3C094
	dw CODE_B3C1D2

CODE_B3BF62:
	TAX					;$B3BF62  \
	JMP (DATA_B3BF66,x)			;$B3BF63  /

DATA_B3BF66:
	dw CODE_B3BF70
	dw CODE_B3BFB4
	dw CODE_B3BFB9
	dw CODE_B3BFCB
	dw CODE_B3C00E


CODE_B3BF70:
	LDA $0050,y				;$B3BF70  \
	ASL A					;$B3BF73   |
	ASL A					;$B3BF74   |
	ADC $0050,y				;$B3BF75   |
	ASL A					;$B3BF78   |
	TAX					;$B3BF79   |
	LDA.l DATA_FF6AA0,x			;$B3BF7A   |
	STA $0046,y				;$B3BF7E   |
	LDA.l DATA_FF6A9E,x			;$B3BF81   |
	STA $0044,y				;$B3BF85   |
	LDA.l DATA_FF6A9C,x			;$B3BF88   |
	STA $0042,y				;$B3BF8C   |
	LDA.l DATA_FF6A9A,x			;$B3BF8F   |
	STA $002A,y				;$B3BF93   |
	STA $0024,y				;$B3BF96   |
	LDA.l DATA_FF6A98,x			;$B3BF99   |
	TYX					;$B3BF9D   |
	BIT $12,x				;$B3BF9E   |
	BVC CODE_B3BFA6				;$B3BFA0   |
	EOR #$FFFF				;$B3BFA2   |
	INC A					;$B3BFA5   |
CODE_B3BFA6:					;	   |
	STA $26,x				;$B3BFA6   |
	STZ $20,x				;$B3BFA8   |
	STZ $04,x				;$B3BFAA   |
	STZ $08,x				;$B3BFAC   |
	STZ $2C,x				;$B3BFAE   |
	STZ $1E,x				;$B3BFB0   |
	INC $2F,x				;$B3BFB2   |
CODE_B3BFB4:					;	   |
	LDA #$0000				;$B3BFB4   |
	BRA CODE_B3BFDA				;$B3BFB7  /

CODE_B3BFB9:
	TYX					;$B3BFB9  \
	LDA $24,x				;$B3BFBA   |
	BMI CODE_B3BFCB				;$B3BFBC   |
	LDA $12,x				;$B3BFBE   |
	ORA #$3000				;$B3BFC0   |
	STA $12,x				;$B3BFC3   |
	LDA $26,x				;$B3BFC5   |
	BEQ CODE_B3BFCB				;$B3BFC7   |
	STZ $30,x				;$B3BFC9   |
CODE_B3BFCB:					;	   |
	TYX					;$B3BFCB   |
	LDA $46,x				;$B3BFCC   |
	BEQ CODE_B3BFDA				;$B3BFCE   |
	BIT $24,x				;$B3BFD0   |
	BMI CODE_B3BFDA				;$B3BFD2   |
	LDY $26,x				;$B3BFD4   |
	BEQ CODE_B3BFDA				;$B3BFD6   |
	STZ $30,x				;$B3BFD8   |
CODE_B3BFDA:					;	   |
	STA $32					;$B3BFDA   |
	JSR CODE_B3C1DD				;$B3BFDC   |
	BCS CODE_B3C00B				;$B3BFDF   |
	LDA #$0004				;$B3BFE1   |
	JSL CODE_BEF03D				;$B3BFE4   |
	LDA $4E,x				;$B3BFE8   |
	CMP $0A,x				;$B3BFEA   |
	BCS CODE_B3C00B				;$B3BFEC   |
	STA $0A,x				;$B3BFEE   |
	LDA $32					;$B3BFF0   |
	JSR CODE_B3C051				;$B3BFF2   |
	BEQ CODE_B3C00B				;$B3BFF5   |
	STZ $46,x				;$B3BFF7   |
	LDY #$0072				;$B3BFF9   |
	JSL CODE_BB8412				;$B3BFFC   |
	LDA #$064C				;$B3C000   |
	JSL queue_sound_effect			;$B3C003   |
	JSL CODE_B9D100				;$B3C007   |
CODE_B3C00B:					;	   |
	JMP CODE_B3C07D				;$B3C00B  /

CODE_B3C00E:
	JSR CODE_B3C1DD				;$B3C00E  \
	BCS CODE_B3C04E				;$B3C011   |
	LDA $26,x				;$B3C013   |
	PHA					;$B3C015   |
	LDA #$0020				;$B3C016   |
	JSL CODE_BEF03D				;$B3C019   |
	PLA					;$B3C01D   |
	STA $26,x				;$B3C01E   |
	LDA $1E,x				;$B3C020   |
	AND #$0001				;$B3C022   |
	BEQ CODE_B3C04A				;$B3C025   |
	STZ $1E,x				;$B3C027   |
	LDA $44,x				;$B3C029   |
	JSR CODE_B3C051				;$B3C02B   |
	BEQ CODE_B3C04A				;$B3C02E   |
	LDA #$00EC				;$B3C030   |
	STA $02,x				;$B3C033   |
	LDY #$006E				;$B3C035   |
	JSL CODE_BB8412				;$B3C038   |
	LDY #$0070				;$B3C03C   |
	JSL CODE_BB8412				;$B3C03F   |
	LDA #$064C				;$B3C043   |
	JSL queue_sound_effect			;$B3C046   |
CODE_B3C04A:					;	   |
	JSL CODE_B9D100				;$B3C04A   |
CODE_B3C04E:					;	   |
	JMP CODE_B3C07D				;$B3C04E  /

CODE_B3C051:
	BEQ CODE_B3C074				;$B3C051  \
	BMI CODE_B3C060				;$B3C053   |
	EOR #$FFFF				;$B3C055   |
	INC A					;$B3C058   |
	STA $24,x				;$B3C059   |
	LDA #$0200				;$B3C05B   |
	BRA CODE_B3C065				;$B3C05E  /

CODE_B3C060:
	STA $24,x				;$B3C060  \
	LDA #$0300				;$B3C062   |
CODE_B3C065:					;	   |
	STA $2E,x				;$B3C065   |
	LDA $0A,x				;$B3C067   |
	CLC					;$B3C069   |
	ADC $42,x				;$B3C06A   |
	STA $4E,x				;$B3C06C   |
	LDA #$0080				;$B3C06E   |
	STA $42,x				;$B3C071   |
	RTS					;$B3C073  /

CODE_B3C074:
	LDA #$0400				;$B3C074  \
	STA $2E,x				;$B3C077   |
	LDA #$0000				;$B3C079   |
	RTS					;$B3C07C  /

CODE_B3C07D:
	LDX current_sprite			;$B3C07D  \
	LDA $5A,x				;$B3C07F   |
	BEQ CODE_B3C091				;$B3C081   |
	LDA $0A,x				;$B3C083   |
	SEC					;$B3C085   |
	SBC #$00E0				;$B3C086   |
	CMP $17C0				;$B3C089   |
	BCS CODE_B3C091				;$B3C08C   |
	JML [$05A9]				;$B3C08E  /

CODE_B3C091:
	JMP CODE_B3A652				;$B3C091  /

CODE_B3C094:
	TAX					;$B3C094  \
	LDY $0593				;$B3C095   |
	LDA $0040,y				;$B3C098   |
	AND #$E000				;$B3C09B   |
	CMP #$E000				;$B3C09E   |
	BNE CODE_B3C0A9				;$B3C0A1   |
	JSR CODE_B3C24C				;$B3C0A3   |
	JML [$05A9]				;$B3C0A6  /

CODE_B3C0A9:
	LDY current_sprite			;$B3C0A9  \
	JMP (DATA_B3C0AE,x)			;$B3C0AB  /

DATA_B3C0AE:
	dw CODE_B3C0B4
	dw CODE_B3C118
	dw CODE_B3C151


CODE_B3C0B4:
	LDA $0050,y				;$B3C0B4  \
	ASL A					;$B3C0B7   |
	ASL A					;$B3C0B8   |
	ADC $0050,y				;$B3C0B9   |
	ASL A					;$B3C0BC   |
	ADC $0050,y				;$B3C0BD   |
	TAX					;$B3C0C0   |
	LDA.l DATA_FF6B29,x			;$B3C0C1   |
	STA $0048,y				;$B3C0C5   |
	LDA.l DATA_FF6B28,x			;$B3C0C8   |
	AND #$00FF				;$B3C0CC   |
	STA $0046,y				;$B3C0CF   |
	LDA.l DATA_FF6B27,x			;$B3C0D2   |
	AND #$00FF				;$B3C0D6   |
	STA $0044,y				;$B3C0D9   |
	LDA.l DATA_FF6B25,x			;$B3C0DC   |
	STA $0024,y				;$B3C0E0   |
	LDA.l DATA_FF6B24,x			;$B3C0E3   |
	AND #$001F				;$B3C0E7   |
	STA $0042,y				;$B3C0EA   |
	LDA.l DATA_FF6B22,x			;$B3C0ED   |
	STA $0026,y				;$B3C0F1   |
	LDA.l DATA_FF6B20,x			;$B3C0F4   |
	STA $0020,y				;$B3C0F8   |
	TYX					;$B3C0FB   |
	BIT $12,x				;$B3C0FC   |
	BVC CODE_B3C10E				;$B3C0FE   |
	EOR #$FFFF				;$B3C100   |
	INC A					;$B3C103   |
	STA $20,x				;$B3C104   |
	LDA #$0000				;$B3C106   |
	SEC					;$B3C109   |
	SBC $26,x				;$B3C10A   |
	STA $26,x				;$B3C10C   |
CODE_B3C10E:					;	   |
	STZ $04,x				;$B3C10E   |
	STZ $08,x				;$B3C110   |
	STZ $2C,x				;$B3C112   |
	STZ $1E,x				;$B3C114   |
	INC $2F,x				;$B3C116   |
CODE_B3C118:					;	   |
	JSR CODE_B3C1DD				;$B3C118   |
	BCS CODE_B3C126				;$B3C11B   |
	JSR CODE_B3C16C				;$B3C11D   |
	BCC CODE_B3C126				;$B3C120   |
	LDX current_sprite			;$B3C122   |
	INC $2F,x				;$B3C124   |
CODE_B3C126:					;	   |
	JSL CODE_B9D100				;$B3C126   |
	LDX current_sprite			;$B3C12A   |
	LDA $5A,x				;$B3C12C   |
	BEQ CODE_B3C14A				;$B3C12E   |
	LDA $06,x				;$B3C130   |
	BIT $20,x				;$B3C132   |
	BMI CODE_B3C142				;$B3C134   |
	SEC					;$B3C136   |
	SBC #$0100				;$B3C137   |
	CMP $17BA				;$B3C13A   |
	BCS CODE_B3C14A				;$B3C13D   |
	JML [$05A9]				;$B3C13F  /

CODE_B3C142:
	CMP $17BA				;$B3C142  \
	BCC CODE_B3C14A				;$B3C145   |
	JML [$05A9]				;$B3C147  /

CODE_B3C14A:
	JSL CODE_BBBB8D				;$B3C14A  \
	JML [$05A9]				;$B3C14E  /

CODE_B3C151:
	LDA $0024,y				;$B3C151  \
	BMI CODE_B3C118				;$B3C154   |
	TYX					;$B3C156   |
	LDA $12,x				;$B3C157   |
	ORA #$3000				;$B3C159   |
	STA $12,x				;$B3C15C   |
	STZ $30,x				;$B3C15E   |
	LDA #$0003				;$B3C160   |
	STA $2E,x				;$B3C163   |
	LDA #$0004				;$B3C165   |
	STA $52,x				;$B3C168   |
	BRA CODE_B3C1D2				;$B3C16A  /

CODE_B3C16C:
	LDX current_sprite			;$B3C16C  \
	LDA $42,x				;$B3C16E   |
	JSL CODE_B8D010				;$B3C170   |
	TYX					;$B3C174   |
	LDA $44,x				;$B3C175   |
	BEQ CODE_B3C17D				;$B3C177   |
	DEC $44,x				;$B3C179   |
	BRA CODE_B3C18F				;$B3C17B  /

CODE_B3C17D:
	LDA $46,x				;$B3C17D  \
	CLC					;$B3C17F   |
	ADC $24,x				;$B3C180   |
	BMI CODE_B3C18D				;$B3C182   |
	LDY #$0002				;$B3C184   |
	CMP [$8E],y				;$B3C187   |
	BCC CODE_B3C18D				;$B3C189   |
	LDA [$8E],y				;$B3C18B   |
CODE_B3C18D:					;	   |
	STA $24,x				;$B3C18D   |
CODE_B3C18F:					;	   |
	LDA $48,x				;$B3C18F   |
	BEQ CODE_B3C1C9				;$B3C191   |
	JSL CODE_B8D5E0				;$B3C193   |
	LDX current_sprite			;$B3C197   |
	LDA $1E,x				;$B3C199   |
	AND #$0001				;$B3C19B   |
	BEQ CODE_B3C1D0				;$B3C19E   |
	JSR CODE_B3C24C				;$B3C1A0   |
	BCS CODE_B3C1C8				;$B3C1A3   |
	STZ $1E,x				;$B3C1A5   |
	LDA $48,x				;$B3C1A7   |
	STA $24,x				;$B3C1A9   |
	STZ $48,x				;$B3C1AB   |
	LDA #$00EC				;$B3C1AD   |
	STA $02,x				;$B3C1B0   |
	LDY #$006E				;$B3C1B2   |
	JSL CODE_BB8412				;$B3C1B5   |
	LDY #$0070				;$B3C1B9   |
	JSL CODE_BB8412				;$B3C1BC   |
	LDA #$064C				;$B3C1C0   |
	JSL queue_sound_effect			;$B3C1C3   |
	SEC					;$B3C1C7   |
CODE_B3C1C8:					;	   |
	RTS					;$B3C1C8  /

CODE_B3C1C9:
	LDA #$0001				;$B3C1C9  \
	JSL CODE_BEF03D				;$B3C1CC   |
CODE_B3C1D0:					;	   |
	CLC					;$B3C1D0   |
	RTS					;$B3C1D1  /

CODE_B3C1D2:
	JSL CODE_BEF039				;$B3C1D2  \
	JSL CODE_B9D100				;$B3C1D6   |
	JMP CODE_B3A652				;$B3C1DA  /

CODE_B3C1DD:
	LDX current_sprite			;$B3C1DD  \
	LDA $30,x				;$B3C1DF   |
	CLC					;$B3C1E1   |
	BEQ CODE_B3C207				;$B3C1E2   |
	LDA #$0018				;$B3C1E4   |
	JSL CODE_BEBE14				;$B3C1E7   |
	BCS CODE_B3C208				;$B3C1EB   |
	JSL CODE_BCFB58				;$B3C1ED   |
	LDA #$0400				;$B3C1F1   |
	LDY #$0008				;$B3C1F4   |
	JSL CODE_BEBD8E				;$B3C1F7   |
	BCS CODE_B3C20D				;$B3C1FB   |
	LDX current_sprite			;$B3C1FD   |
	LDA $4A,x				;$B3C1FF   |
	JSL CODE_BEBE8B				;$B3C201   |
	BCS CODE_B3C208				;$B3C205   |
CODE_B3C207:					;	   |
	RTS					;$B3C207  /

CODE_B3C208:
	BNE CODE_B3C207				;$B3C208  \
	TYA					;$B3C20A   |
	BEQ CODE_B3C217				;$B3C20B   |
CODE_B3C20D:					;	   |
	LDA $0012,y				;$B3C20D   |
	STA $32					;$B3C210   |
	LDA $0020,y				;$B3C212   |
	BRA CODE_B3C224				;$B3C215  /

CODE_B3C217:
	LDA $34,x				;$B3C217  \
	STA $5E					;$B3C219   |
	ASL A					;$B3C21B   |
	LDA #$0100				;$B3C21C   |
	BCC CODE_B3C224				;$B3C21F   |
	LDA #$FF00				;$B3C221   |
CODE_B3C224:					;	   |
	STA $60					;$B3C224   |
	JSR CODE_B3C24C				;$B3C226   |
	BCS CODE_B3C207				;$B3C229   |
	LDX current_sprite			;$B3C22B   |
	LDA $20,x				;$B3C22D   |
	CLC					;$B3C22F   |
	ADC $60					;$B3C230   |
	CMP #$8000				;$B3C232   |
	ROR A					;$B3C235   |
	STA $20,x				;$B3C236   |
	STZ $24,x				;$B3C238   |
	LDA #$0003				;$B3C23A   |
	STA $2E,x				;$B3C23D   |
	LDA #$0004				;$B3C23F   |
	STA $52,x				;$B3C242   |
	LDA #$02FD				;$B3C244   |
	JSR CODE_B3A627				;$B3C247   |
	SEC					;$B3C24A   |
	RTS					;$B3C24B  /

CODE_B3C24C:
	LDX current_sprite			;$B3C24C  \
	LDA $2E,x				;$B3C24E   |
	AND #$00FF				;$B3C250   |
	CMP #$0002				;$B3C253   |
	BEQ CODE_B3C25A				;$B3C256   |
	CLC					;$B3C258   |
	RTS					;$B3C259  /

CODE_B3C25A:
	LDA #$051A				;$B3C25A  \
	JSL queue_sound_effect			;$B3C25D   |
	LDY #$0074				;$B3C261   |
	JSL CODE_BB842C				;$B3C264   |
	JSR CODE_B39779				;$B3C268   |
	JSL CODE_BB82B8				;$B3C26B   |
	SEC					;$B3C26F   |
	RTS					;$B3C270  /

water_level_changer_main:
	LDX current_sprite			;$B3C271  \
	LDY $0593				;$B3C273   |
	LDA $2E,x				;$B3C276   |
	CMP #$0100				;$B3C278   |
	AND #$00FF				;$B3C27B   |
	BNE CODE_B3C2BF				;$B3C27E   |
	BCS CODE_B3C29D				;$B3C280   |
	LDA $42,x				;$B3C282   |
	AND #$00FF				;$B3C284   |
	ADC $06,x				;$B3C287   |
	STA $44,x				;$B3C289   |
	LDA $42,x				;$B3C28B   |
	XBA					;$B3C28D   |
	AND #$00FF				;$B3C28E   |
	EOR #$FFFF				;$B3C291   |
	SEC					;$B3C294   |
	ADC $06,x				;$B3C295   |
	STA $42,x				;$B3C297   |
	INC $2F,x				;$B3C299   |
	BRA CODE_B3C2B2				;$B3C29B  /

CODE_B3C29D:
	LDA $000A,y				;$B3C29D  \
	CMP $0A,x				;$B3C2A0   |
	ROR $32					;$B3C2A2   |
	LDA $48,x				;$B3C2A4   |
	CMP $0A,x				;$B3C2A6   |
	ROR A					;$B3C2A8   |
	EOR $32					;$B3C2A9   |
	BPL CODE_B3C2B2				;$B3C2AB   |
	LDA $0006,y				;$B3C2AD   |
	BRA CODE_B3C2EF				;$B3C2B0  /

CODE_B3C2B2:
	LDA $0006,y				;$B3C2B2  \
	STA $46,x				;$B3C2B5   |
	LDA $000A,y				;$B3C2B7   |
	STA $48,x				;$B3C2BA   |
	JMP CODE_B38000				;$B3C2BC  /

CODE_B3C2BF:
	BCS CODE_B3C2DC				;$B3C2BF  \
	LDA $42,x				;$B3C2C1   |
	AND #$00FF				;$B3C2C3   |
	ADC $0A,x				;$B3C2C6   |
	STA $44,x				;$B3C2C8   |
	LDA $42,x				;$B3C2CA   |
	XBA					;$B3C2CC   |
	AND #$00FF				;$B3C2CD   |
	EOR #$FFFF				;$B3C2D0   |
	SEC					;$B3C2D3   |
	ADC $0A,x				;$B3C2D4   |
	STA $42,x				;$B3C2D6   |
	INC $2F,x				;$B3C2D8   |
	BRA CODE_B3C2B2				;$B3C2DA  /

CODE_B3C2DC:
	LDA $0006,y				;$B3C2DC  \
	CMP $06,x				;$B3C2DF   |
	ROR $32					;$B3C2E1   |
	LDA $46,x				;$B3C2E3   |
	CMP $06,x				;$B3C2E5   |
	ROR A					;$B3C2E7   |
	EOR $32					;$B3C2E8   |
	BPL CODE_B3C2B2				;$B3C2EA   |
	LDA $000A,y				;$B3C2EC   |
CODE_B3C2EF:					;	   |
	CMP $42,x				;$B3C2EF   |
	BCC CODE_B3C2B2				;$B3C2F1   |
	DEC A					;$B3C2F3   |
	CMP $44,x				;$B3C2F4   |
	BCS CODE_B3C2B2				;$B3C2F6   |
	LDA $4C,x				;$B3C2F8   |
	BEQ CODE_B3C301				;$B3C2FA   |
	CMP $0D52				;$B3C2FC   |
	BNE CODE_B3C33B				;$B3C2FF   |
CODE_B3C301:					;	   |
	LDY #$8080				;$B3C301   |
	PHY					;$B3C304   |
	PLB					;$B3C305   |
	LDX #$0035				;$B3C306   |
	TYA					;$B3C309   |
	CLC					;$B3C30A   |
CODE_B3C30B:					;	   |
	ADC $040B,y				;$B3C30B   |
	INY					;$B3C30E   |
	DEX					;$B3C30F   |
	BPL CODE_B3C30B				;$B3C310   |
	PLB					;$B3C312   |
	CMP #$20CB				;$B3C313   |
	BNE CODE_B3C33B				;$B3C316   |
	LDX current_sprite			;$B3C318   |
	LDA $4E,x				;$B3C31A   |
	STA $0D52				;$B3C31C   |
	LDA $24,x				;$B3C31F   |
	STA $0D50				;$B3C321   |
	LDA $52,x				;$B3C324   |
	BNE CODE_B3C33B				;$B3C326   |
	LDA $0915				;$B3C328   |
	BEQ CODE_B3C33B				;$B3C32B   |
	CMP #$001E				;$B3C32D   |
	BCC CODE_B3C33B				;$B3C330   |
	LDA #$003C				;$B3C332   |
	STZ $0915				;$B3C335   |
	STA $0917				;$B3C338   |
CODE_B3C33B:					;	   |
	JSL CODE_BB82D2				;$B3C33B   |
	JML [$05A9]				;$B3C33F  /

unknown_sprite_00B0_main:
	JMP CODE_B38000				;$B3C342  /

bananas_main:
	JSR CODE_B3A369				;$B3C345  /

DATA_B3C348:
	dw CODE_B3C350
	dw CODE_B3C364
	dw CODE_B3C398
	dw CODE_B3C3C3

CODE_B3C350:
	JSL CODE_B9D100				;$B3C350  \
	JSL CODE_BCFB58				;$B3C354   |
	LDA #$1529				;$B3C358   |
	JSL CODE_BEBE6D				;$B3C35B   |
	BCS CODE_B3C3AC				;$B3C35F   |
	JMP CODE_B38000				;$B3C361  /

CODE_B3C364:
	LDA global_frame_counter		;$B3C364  \
	AND #$0003				;$B3C366   |
	BNE CODE_B3C391				;$B3C369   |
	LDX #$F8F8				;$B3C36B   |
	JSL CODE_B5F94C				;$B3C36E   |
	LDX current_sprite			;$B3C372   |
	LDA $1C,x				;$B3C374   |
	AND #$C000				;$B3C376   |
	EOR #$C000				;$B3C379   |
	STA $1C,x				;$B3C37C   |
	LDA $4E,x				;$B3C37E   |
	SEP #$09				;$B3C380   |
	SBC #$0001				;$B3C382   |
	STA $4E,x				;$B3C385   |
	CLD					;$B3C387   |
	BNE CODE_B3C391				;$B3C388   |
	JSL CODE_BB82B8				;$B3C38A   |
	JML [$05A9]				;$B3C38E  /

CODE_B3C391:
	JSL CODE_B9D100				;$B3C391  \
	JML [$05A9]				;$B3C395  /

CODE_B3C398:
	JSL CODE_BEF039				;$B3C398  \
	LDA $52,x				;$B3C39C   |
	AND #$FF00				;$B3C39E   |
	BNE CODE_B3C3A5				;$B3C3A1   |
	INC $2E,x				;$B3C3A3   |
CODE_B3C3A5:					;	   |
	JSL CODE_B9D100				;$B3C3A5   |
	JML [$05A9]				;$B3C3A9  /

CODE_B3C3AC:
	LDA #$0001				;$B3C3AC  \
	STA $2E,x				;$B3C3AF   |
	LDA $4E,x				;$B3C3B1   |
	SED					;$B3C3B3   |
	CLC					;$B3C3B4   |
	ADC $08BC				;$B3C3B5   |
	STA $08BC				;$B3C3B8   |
	CLD					;$B3C3BB   |
	JSL CODE_BEC689				;$B3C3BC   |
	JML [$05A9]				;$B3C3C0  /

CODE_B3C3C3:
	TYX					;$B3C3C3  \
	DEC $50,x				;$B3C3C4   |
	BMI CODE_B3C3FC				;$B3C3C6   |
	LDA $50,x				;$B3C3C8   |
	CMP #$0078				;$B3C3CA   |
	BCS CODE_B3C3E8				;$B3C3CD   |
	BIT #$0003				;$B3C3CF   |
	BNE CODE_B3C3E8				;$B3C3D2   |
	CMP #$003C				;$B3C3D4   |
	BCC CODE_B3C3DE				;$B3C3D7   |
	BIT #$0007				;$B3C3D9   |
	BNE CODE_B3C3E8				;$B3C3DC   |
CODE_B3C3DE:					;	   |
	LDA $1C,x				;$B3C3DE   |
	AND #$C000				;$B3C3E0   |
	EOR #$C000				;$B3C3E3   |
	STA $1C,x				;$B3C3E6   |
CODE_B3C3E8:					;	   |
	JSL CODE_B9D100				;$B3C3E8   |
	JSL CODE_BCFB58				;$B3C3EC   |
	LDA #$1529				;$B3C3F0   |
	JSL CODE_BEBE6D				;$B3C3F3   |
	BCS CODE_B3C3AC				;$B3C3F7   |
	JML [$05A9]				;$B3C3F9  /

CODE_B3C3FC:
	JSL CODE_BB82B8				;$B3C3FC  \
	JML [$05A9]				;$B3C400  /

extra_life_balloon_main:
	JSR CODE_B3A369				;$B3C403  /

DATA_B3C406:
	dw CODE_B3C40E
	dw CODE_B3C466
	dw CODE_B3C487
	dw CODE_B3C4A4

CODE_B3C40E:
	LDA $0A36				;$B3C40E  \
	BIT #$0004				;$B3C411   |
	BNE CODE_B3C43E				;$B3C414   |
	JSL CODE_BCFB58				;$B3C416   |
	JSL CODE_BEBE6D				;$B3C41A   |
	BCS CODE_B3C444				;$B3C41E   |
CODE_B3C420:					;	   |
	JSL CODE_B9D100				;$B3C420   |
	LDA $04,x				;$B3C424   |
	CMP #$8000				;$B3C426   |
	BEQ CODE_B3C441				;$B3C429   |
	JSL CODE_BEF039				;$B3C42B   |
	LDA $52,x				;$B3C42F   |
	AND #$00FF				;$B3C431   |
	CMP #$000C				;$B3C434   |
	BEQ CODE_B3C43E				;$B3C437   |
	JSR CODE_B3A3EB				;$B3C439   |
	BCS CODE_B3C49E				;$B3C43C   |
CODE_B3C43E:					;	   |
	JML [$05A9]				;$B3C43E  /

CODE_B3C441:
	JMP CODE_B38000				;$B3C441  /

CODE_B3C444:
	LDA #$072C				;$B3C444  \
	JSL queue_sound_effect			;$B3C447   |
	LDX current_sprite			;$B3C44B   |
	LDA $42,x				;$B3C44D   |
	JSL CODE_BEC64C				;$B3C44F   |
	LDA #$0002				;$B3C453   |
	STA $2E,x				;$B3C456   |
	LDA #$28D4				;$B3C458   |
	JSL CODE_BEC5BC				;$B3C45B   |
	JSL CODE_B9D100				;$B3C45F   |
	JML [$05A9]				;$B3C463  /

CODE_B3C466:
	LDA #$0010				;$B3C466  \
	BIT $0902				;$B3C469   |
	BNE CODE_B3C480				;$B3C46C   |
	JSL CODE_BCFB58				;$B3C46E   |
	JSL CODE_BEBE6D				;$B3C472   |
	BCC CODE_B3C420				;$B3C476   |
	LDA #$0010				;$B3C478   |
	TSB $0902				;$B3C47B   |
	BRA CODE_B3C444				;$B3C47E  /

CODE_B3C480:
	JSL CODE_BB82B8				;$B3C480  \
	JML [$05A9]				;$B3C484  /

CODE_B3C487:
	JSL CODE_BEC5FA				;$B3C487  \
	BMI CODE_B3C494				;$B3C48B   |
	JSL CODE_B9D100				;$B3C48D   |
	JML [$05A9]				;$B3C491  /

CODE_B3C494:
	LDA $42,x				;$B3C494  \
	JSL CODE_BEC63E				;$B3C496   |
	JSL CODE_BB82B8				;$B3C49A   |
CODE_B3C49E:					;	   |
	DEC $19BC				;$B3C49E   |
	JML [$05A9]				;$B3C4A1  /

CODE_B3C4A4:
	JSL CODE_BEF039				;$B3C4A4  \
	LDA $24,x				;$B3C4A8   |
	BMI CODE_B3C4B3				;$B3C4AA   |
	LDA #$0F0C				;$B3C4AC   |
	STA $52,x				;$B3C4AF   |
	STZ $2E,x				;$B3C4B1   |
CODE_B3C4B3:					;	   |
	JSL CODE_B9D100				;$B3C4B3   |
	JML [$05A9]				;$B3C4B7  /

air_bubble_generator_main:
	LDX current_sprite			;$B3C4BA  \
	LDA $12,x				;$B3C4BC   |
	AND #$CFFF				;$B3C4BE   |
	ORA #$1000				;$B3C4C1   |
	STA $0921				;$B3C4C4   |
	JSL CODE_BB82D2				;$B3C4C7   |
	JML [$05A9]				;$B3C4CB  /

kutlass_main:
	JSR CODE_B3A369				;$B3C4CE  /

DATA_B3C4D1:
	dw CODE_B3C4E1
	dw CODE_B3C512
	dw CODE_B3C553
	dw CODE_B3C5B6
	dw CODE_B3C5B6
	dw CODE_B3C5CB
	dw CODE_B3C5E0
	dw CODE_B3C61F

CODE_B3C4E1:
if !version == 0				;	  \
	LSR					;	   |
else						;	   |
	LDA $0048,y				;$B3C4E1   |
endif						;	   |
	BNE CODE_B3C4EC				;$B3C4E4   |
	LDA $0026,y				;$B3C4E6   |
	STA $0048,y				;$B3C4E9   |
CODE_B3C4EC:					;	   |
	LDA #$54A0				;$B3C4EC   |
	JSR CODE_B3C62A				;$B3C4EF   |
	BCS CODE_B3C50F				;$B3C4F2   |
	JSL CODE_BEF039				;$B3C4F4   |
	JSL CODE_B9D100				;$B3C4F8   |
	LDA $4C,x				;$B3C4FC   |
	LDY $4E,x				;$B3C4FE   |
	JSR CODE_B3C6AF				;$B3C500   |
	BCS CODE_B3C50F				;$B3C503   |
	SEP #$20				;$B3C505   |
	LDA $4A,x				;$B3C507   |
	STA $4B,x				;$B3C509   |
	REP #$20				;$B3C50B   |
	INC $2E,x				;$B3C50D   |
CODE_B3C50F:					;	   |
	JMP CODE_B38000				;$B3C50F  /

CODE_B3C512:
	LDA #$0000				;$B3C512  \
	JSR CODE_B3C62A				;$B3C515   |
	BCS CODE_B3C550				;$B3C518   |
	LDX current_sprite			;$B3C51A   |
	INC $2E,x				;$B3C51C   |
	LDY $0593				;$B3C51E   |
	LDA $0006,y				;$B3C521   |
	STA $50,x				;$B3C524   |
	SEC					;$B3C526   |
	SBC $06,x				;$B3C527   |
	STA $32					;$B3C529   |
	LSR A					;$B3C52B   |
	EOR $12,x				;$B3C52C   |
	AND #$4000				;$B3C52E   |
	BEQ CODE_B3C53D				;$B3C531   |
	LDA #$016B				;$B3C533   |
	JSL CODE_B9D0C6				;$B3C536   |
	JMP CODE_B38000				;$B3C53A  /

CODE_B3C53D:
	LDA $32					;$B3C53D  \
	CMP #$0040				;$B3C53F   |
	BCC CODE_B3C57E				;$B3C542   |
	CMP #$FFC0				;$B3C544   |
	BCS CODE_B3C57E				;$B3C547   |
	LDA #$016C				;$B3C549   |
	JSL CODE_B9D0C6				;$B3C54C   |
CODE_B3C550:					;	   |
	JMP CODE_B38000				;$B3C550  /

CODE_B3C553:
	LDA #$0000				;$B3C553  \
	JSR CODE_B3C62A				;$B3C556   |
	BCS CODE_B3C57B				;$B3C559   |
	LDA #$0022				;$B3C55B   |
	JSR CODE_B3CE79				;$B3C55E   |
	LDA $36,x				;$B3C561   |
	CMP #$016C				;$B3C563   |
	BNE CODE_B3C577				;$B3C566   |
	LDA $50,x				;$B3C568   |
	SEC					;$B3C56A   |
	SBC $06,x				;$B3C56B   |
	CMP #$0040				;$B3C56D   |
	BCC CODE_B3C57E				;$B3C570   |
	CMP #$FFC0				;$B3C572   |
	BCS CODE_B3C57E				;$B3C575   |
CODE_B3C577:					;	   |
	JSL CODE_B9D100				;$B3C577   |
CODE_B3C57B:					;	   |
	JMP CODE_B38000				;$B3C57B  /

CODE_B3C57E:
	LDY $0593				;$B3C57E  \
	LDA $06,x				;$B3C581   |
	SEC					;$B3C583   |
	SBC $0006,y				;$B3C584   |
	TAY					;$B3C587   |
	LDA #$0000				;$B3C588   |
	CPY #$0020				;$B3C58B   |
	BCC CODE_B3C59B				;$B3C58E   |
	CPY #$FFE0				;$B3C590   |
	BCS CODE_B3C59B				;$B3C593   |
	LDA $26,x				;$B3C595   |
	CMP #$8000				;$B3C597   |
	ROR A					;$B3C59A   |
CODE_B3C59B:					;	   |
	STA $26,x				;$B3C59B   |
	STZ $20,x				;$B3C59D   |
	SEP #$20				;$B3C59F   |
	LDA $1C,x				;$B3C5A1   |
	STA $1D,x				;$B3C5A3   |
	REP #$20				;$B3C5A5   |
	LDA #$0003				;$B3C5A7   |
	STA $2E,x				;$B3C5AA   |
	LDA #$016D				;$B3C5AC   |
	JSL CODE_B9D0C6				;$B3C5AF   |
	JMP CODE_B38000				;$B3C5B3  /

CODE_B3C5B6:
	LDA #$0000				;$B3C5B6  \
	JSR CODE_B3C62A				;$B3C5B9   |
	BCS CODE_B3C5C8				;$B3C5BC   |
	LDA #$0022				;$B3C5BE   |
	JSR CODE_B3CE79				;$B3C5C1   |
	JSL CODE_B9D100				;$B3C5C4   |
CODE_B3C5C8:					;	   |
	JMP CODE_B38000				;$B3C5C8  /

CODE_B3C5CB:
	LDA #$5428				;$B3C5CB  \
	JSR CODE_B3C62A				;$B3C5CE   |
	BCS CODE_B3C5DD				;$B3C5D1   |
	LDA #$002A				;$B3C5D3   |
	JSR CODE_B3CE79				;$B3C5D6   |
	JSL CODE_B9D100				;$B3C5D9   |
CODE_B3C5DD:					;	   |
	JMP CODE_B38000				;$B3C5DD  /

CODE_B3C5E0:
	LDX current_sprite			;$B3C5E0  \
	LDA $12,x				;$B3C5E2   |
	ASL A					;$B3C5E4   |
	EOR $48,x				;$B3C5E5   |
	ASL A					;$B3C5E7   |
	LDA $48,x				;$B3C5E8   |
	BCC CODE_B3C5F0				;$B3C5EA   |
	EOR #$FFFF				;$B3C5EC   |
	INC A					;$B3C5EF   |
CODE_B3C5F0:					;	   |
	STA $26,x				;$B3C5F0   |
	STA $20,x				;$B3C5F2   |
	LDA $52,x				;$B3C5F4   |
	AND #$00FF				;$B3C5F6   |
	CMP #$0023				;$B3C5F9   |
	BNE CODE_B3C600				;$B3C5FC   |
	STZ $20,x				;$B3C5FE   |
CODE_B3C600:					;	   |
	STZ $04,x				;$B3C600   |
	LDA $1D,x				;$B3C602   |
	AND #$00FF				;$B3C604   |
	BEQ CODE_B3C61A				;$B3C607   |
	LDA $4C,x				;$B3C609   |
	LDY $4E,x				;$B3C60B   |
	JSR CODE_B3C6AF				;$B3C60D   |
	BCS CODE_B3C61A				;$B3C610   |
	LDA #$0001				;$B3C612   |
	STA $2E,x				;$B3C615   |
	JMP CODE_B3C512				;$B3C617  /

CODE_B3C61A:
	STZ $2E,x				;$B3C61A  \
	JMP CODE_B3C4E1				;$B3C61C  /

CODE_B3C61F:
	JSL CODE_BEF039				;$B3C61F  \
	JSL CODE_B9D100				;$B3C623   |
	JMP CODE_B3A652				;$B3C627  /

CODE_B3C62A:
	STA $0DC6				;$B3C62A  \
	JSR CODE_B3A3A3				;$B3C62D   |
	BCC CODE_B3C686				;$B3C630   |
	LDX current_sprite			;$B3C632   |
	LDA #$0118				;$B3C634   |
	JSL CODE_BEBE14				;$B3C637   |
	BCS CODE_B3C65A				;$B3C63B   |
	JSL CODE_BCFB58				;$B3C63D   |
	LDA $2E,x				;$B3C641   |
	CMP #$0004				;$B3C643   |
	BNE CODE_B3C64F				;$B3C646   |
	LDA #$000D				;$B3C648   |
	JSL CODE_BCFB7A				;$B3C64B   |
CODE_B3C64F:					;	   |
	LDA $0DC6				;$B3C64F   |
	JSL CODE_BEBE8B				;$B3C652   |
	BCS CODE_B3C65A				;$B3C656   |
	CLC					;$B3C658   |
	RTS					;$B3C659  /

CODE_B3C65A:
	BEQ CODE_B3C671				;$B3C65A  \
	LDA #$051E				;$B3C65C   |
	JSL queue_sound_effect			;$B3C65F   |
	LDX current_sprite			;$B3C663   |
	SEP #$20				;$B3C665   |
	STZ $4B,x				;$B3C667   |
	LDA #$03				;$B3C669   |
	STA $1D,x				;$B3C66B   |
	REP #$20				;$B3C66D   |
	CLC					;$B3C66F   |
	RTS					;$B3C670  /

CODE_B3C671:
	LDX $6A					;$B3C671  \
	LDA $12,x				;$B3C673   |
	AND #$4000				;$B3C675   |
	LDX current_sprite			;$B3C678   |
	EOR $12,x				;$B3C67A   |
	AND #$4000				;$B3C67C   |
	EOR $12,x				;$B3C67F   |
	EOR #$4000				;$B3C681   |
	STA $12,x				;$B3C684   |
CODE_B3C686:					;	   |
	LDA #$0100				;$B3C686   |
	BIT $12,x				;$B3C689   |
	BVS CODE_B3C690				;$B3C68B   |
	LDA #$FF00				;$B3C68D   |
CODE_B3C690:					;	   |
	STA $26,x				;$B3C690   |
	STA $20,x				;$B3C692   |
	LDA #$FA00				;$B3C694   |
	STA $24,x				;$B3C697   |
	LDA #$0004				;$B3C699   |
	STA $52,x				;$B3C69C   |
	LDA #$016E				;$B3C69E   |
	JSR CODE_B3A627				;$B3C6A1   |
	LDA #$0007				;$B3C6A4   |
	STA $2E,x				;$B3C6A7   |
	SEC					;$B3C6A9   |
	RTS					;$B3C6AA  /

CODE_B3C6AB:
	JSR CODE_B3C6C0				;$B3C6AB  \
	RTL					;$B3C6AE  /

CODE_B3C6AF:
	STA $32					;$B3C6AF  \
	STY $34					;$B3C6B1   |
	LDX current_sprite			;$B3C6B3   |
	LDY $0593				;$B3C6B5   |
	LDA $000C,y				;$B3C6B8   |
	SEC					;$B3C6BB   |
	SBC $0A,x				;$B3C6BC   |
	BRA CODE_B3C6CF				;$B3C6BE  /

CODE_B3C6C0:
	STA $32					;$B3C6C0  \
	STY $34					;$B3C6C2   |
	LDX current_sprite			;$B3C6C4   |
	LDY $0593				;$B3C6C6   |
	LDA $000A,y				;$B3C6C9   |
	SEC					;$B3C6CC   |
	SBC $0A,x				;$B3C6CD   |
CODE_B3C6CF:					;	   |
	STA $36					;$B3C6CF   |
	LDA $34					;$B3C6D1   |
	BCS CODE_B3C6D6				;$B3C6D3   |
	XBA					;$B3C6D5   |
CODE_B3C6D6:					;	   |
	AND #$00FF				;$B3C6D6   |
	STA $34					;$B3C6D9   |
	LDA $36					;$B3C6DB   |
	BPL CODE_B3C6E3				;$B3C6DD   |
	EOR #$FFFF				;$B3C6DF   |
	INC A					;$B3C6E2   |
CODE_B3C6E3:					;	   |
	SEC					;$B3C6E3   |
	SBC $34					;$B3C6E4   |
	BCS CODE_B3C71C				;$B3C6E6   |
	LDA $0006,y				;$B3C6E8   |
	SEC					;$B3C6EB   |
	SBC $06,x				;$B3C6EC   |
	BEQ CODE_B3C717				;$B3C6EE   |
	STA $36					;$B3C6F0   |
	LSR A					;$B3C6F2   |
	EOR $12,x				;$B3C6F3   |
	ASL A					;$B3C6F5   |
	ASL A					;$B3C6F6   |
	LDA $32					;$B3C6F7   |
	STZ $38					;$B3C6F9   |
	BCS CODE_B3C700				;$B3C6FB   |
	INC $38					;$B3C6FD   |
	XBA					;$B3C6FF   |
CODE_B3C700:					;	   |
	AND #$00FF				;$B3C700   |
	STA $32					;$B3C703   |
	LDA $36					;$B3C705   |
	BPL CODE_B3C70F				;$B3C707   |
	EOR #$FFFF				;$B3C709   |
	INC A					;$B3C70C   |
	STA $36					;$B3C70D   |
CODE_B3C70F:					;	   |
	SEC					;$B3C70F   |
	SBC $32					;$B3C710   |
	BCS CODE_B3C71C				;$B3C712   |
	LDA $38					;$B3C714   |
	RTS					;$B3C716  /

CODE_B3C717:
	ADC #$0000				;$B3C717  \
	STA $38					;$B3C71A   |
CODE_B3C71C:					;	   |
	RTS					;$B3C71C  /

krook_main:
	JSR CODE_B3A369				;$B3C71D  /

DATA_B3C720:
	dw CODE_B3C734
	dw CODE_B3C769
	dw CODE_B3C77E
	dw CODE_B3C794
	dw CODE_B3C7BC
	dw CODE_B3C7C7
	dw CODE_B3C7D1
	dw CODE_B3C82D
	dw CODE_B3C84C
	dw CODE_B3C862


CODE_B3C734:
	JSR CODE_B3C878				;$B3C734  \
	BCS CODE_B3C74A				;$B3C737   |
	LDA $4C,x				;$B3C739   |
	LDY $4E,x				;$B3C73B   |
	JSR CODE_B3C6C0				;$B3C73D   |
	BCC CODE_B3C74D				;$B3C740   |
	JSL CODE_BEF039				;$B3C742   |
	JSL CODE_B9D100				;$B3C746   |
CODE_B3C74A:					;	   |
	JMP CODE_B38000				;$B3C74A  /

CODE_B3C74D:
	BNE CODE_B3C75B				;$B3C74D  \
	LDA $4C,x				;$B3C74F   |
	AND #$00FF				;$B3C751   |
	BEQ CODE_B3C75B				;$B3C754   |
	LDA #$01F0				;$B3C756   |
	BRA CODE_B3C75E				;$B3C759  /

CODE_B3C75B:
	LDA #$01F1				;$B3C75B  \
CODE_B3C75E:					;	   |
	JSL CODE_B9D0C6				;$B3C75E   |
	LDX current_sprite			;$B3C762   |
	INC $2E,x				;$B3C764   |
	JMP CODE_B38000				;$B3C766  /

CODE_B3C769:
	LDA $0D54				;$B3C769  \
	BMI CODE_B3C772				;$B3C76C   |
	JSL CODE_BEF039				;$B3C76E   |
CODE_B3C772:					;	   |
	JSR CODE_B3C878				;$B3C772   |
	BCS CODE_B3C77B				;$B3C775   |
	JSL CODE_B9D100				;$B3C777   |
CODE_B3C77B:					;	   |
	JML [$05A9]				;$B3C77B  /

CODE_B3C77E:
	TYX					;$B3C77E  \
	LDA $4A,x				;$B3C77F   |
	XBA					;$B3C781   |
	ORA $4A,x				;$B3C782   |
	STA $4A,x				;$B3C784   |
	BEQ CODE_B3C7A1				;$B3C786   |
	INC $2E,x				;$B3C788   |
	LDA #$01ED				;$B3C78A   |
	JSL CODE_B9D0C6				;$B3C78D   |
	JML [$05A9]				;$B3C791  /

CODE_B3C794:
	TYX					;$B3C794  \
	LDA $4A,x				;$B3C795   |
	AND #$00FF				;$B3C797   |
	BEQ CODE_B3C7A1				;$B3C79A   |
	DEC $4A,x				;$B3C79C   |
	JMP CODE_B3C769				;$B3C79E  /

CODE_B3C7A1:
	LDA #$0000				;$B3C7A1  \
	STA $002E,y				;$B3C7A4   |
	LDA #$01ED				;$B3C7A7   |
	LDX $52,y				;$B3C7AA   |
	BEQ CODE_B3C7B5				;$B3C7AC   |
	LDX $26,y				;$B3C7AE   |
	BEQ CODE_B3C7B5				;$B3C7B0   |
	LDA #$01EE				;$B3C7B2   |
CODE_B3C7B5:					;	   |
	JSL CODE_B9D0C6				;$B3C7B5   |
	JMP CODE_B3C734				;$B3C7B9  /

CODE_B3C7BC:
	JSL CODE_BEF039				;$B3C7BC  \
	JSL CODE_B9D100				;$B3C7C0   |
	JMP CODE_B3A652				;$B3C7C4  /

CODE_B3C7C7:
	TYX					;$B3C7C7  \
	INC $2E,x				;$B3C7C8   |
	LDA $4E,x				;$B3C7CA   |
	AND #$7FFF				;$B3C7CC   |
	STA $5C,x				;$B3C7CF   |
CODE_B3C7D1:					;	   |
	JSR CODE_B3C878				;$B3C7D1   |
	BCS CODE_B3C80E				;$B3C7D4   |
	LDA $17C0				;$B3C7D6   |
	CMP $4C,x				;$B3C7D9   |
	BCC CODE_B3C7E6				;$B3C7DB   |
	LDA $4E,x				;$B3C7DD   |
	AND #$7FFF				;$B3C7DF   |
	STA $5C,x				;$B3C7E2   |
	BRA CODE_B3C806				;$B3C7E4  /

CODE_B3C7E6:
	DEC $5C,x				;$B3C7E6  \
	BMI CODE_B3C811				;$B3C7E8   |
	BIT $4E,x				;$B3C7EA   |
	BMI CODE_B3C806				;$B3C7EC   |
	LDA $5C,x				;$B3C7EE   |
	CMP #$000C				;$B3C7F0   |
	BCS CODE_B3C806				;$B3C7F3   |
	LDY $0593				;$B3C7F5   |
	LDA $06,x				;$B3C7F8   |
	CMP $0006,y				;$B3C7FA   |
	ROR A					;$B3C7FD   |
	LSR A					;$B3C7FE   |
	EOR $12,x				;$B3C7FF   |
	AND #$4000				;$B3C801   |
	BNE CODE_B3C81F				;$B3C804   |
CODE_B3C806:					;	   |
	JSL CODE_BEF039				;$B3C806   |
	JSL CODE_B9D100				;$B3C80A   |
CODE_B3C80E:					;	   |
	JMP CODE_B38000				;$B3C80E  /

CODE_B3C811:
	LDA #$01F1				;$B3C811  \
	JSL CODE_B9D0C6				;$B3C814   |
	LDX current_sprite			;$B3C818   |
	INC $2E,x				;$B3C81A   |
	JMP CODE_B38000				;$B3C81C  /

CODE_B3C81F:
	LDA #$01F0				;$B3C81F  \
	JSL CODE_B9D0C6				;$B3C822   |
	LDX current_sprite			;$B3C826   |
	INC $2E,x				;$B3C828   |
	JMP CODE_B38000				;$B3C82A  /

CODE_B3C82D:
	LDY current_sprite			;$B3C82D  \
	LDA $0D54				;$B3C82F   |
	CLC					;$B3C832   |
	ADC #$00C0				;$B3C833   |
	SEC					;$B3C836   |
	SBC $000A,y				;$B3C837   |
	BCS CODE_B3C840				;$B3C83A   |
	JSL CODE_BEF039				;$B3C83C   |
CODE_B3C840:					;	   |
	JSR CODE_B3C878				;$B3C840   |
	BCS CODE_B3C849				;$B3C843   |
	JSL CODE_B9D100				;$B3C845   |
CODE_B3C849:					;	   |
	JML [$05A9]				;$B3C849  /

CODE_B3C84C:
	TYX					;$B3C84C  \
	LDA $4A,x				;$B3C84D   |
	XBA					;$B3C84F   |
	ORA $4A,x				;$B3C850   |
	STA $4A,x				;$B3C852   |
	BEQ CODE_B3C86F				;$B3C854   |
	INC $2E,x				;$B3C856   |
	LDA #$01ED				;$B3C858   |
	JSL CODE_B9D0C6				;$B3C85B   |
	JML [$05A9]				;$B3C85F  /

CODE_B3C862:
	TYX					;$B3C862  \
	LDA $4A,x				;$B3C863   |
	AND #$00FF				;$B3C865   |
	BEQ CODE_B3C86F				;$B3C868   |
	DEC $4A,x				;$B3C86A   |
	JMP CODE_B3C82D				;$B3C86C  /

CODE_B3C86F:
	LDA #$0006				;$B3C86F  \
	STA $002E,y				;$B3C872   |
	JMP CODE_B3C7E6				;$B3C875  /

CODE_B3C878:
	JSR CODE_B3A3A3				;$B3C878  \
	BCC CODE_B3C8AE				;$B3C87B   |
	LDX current_sprite			;$B3C87D   |
	LDA #$0118				;$B3C87F   |
	JSL CODE_BEBE14				;$B3C882   |
	BCS CODE_B3C897				;$B3C886   |
	JSL CODE_BCFB58				;$B3C888   |
	LDA #$5428				;$B3C88C   |
	JSL CODE_BEBE8B				;$B3C88F   |
	BCS CODE_B3C897				;$B3C893   |
CODE_B3C895:					;	   |
	CLC					;$B3C895   |
	RTS					;$B3C896  /

CODE_B3C897:
	BNE CODE_B3C895				;$B3C897  \
	LDX $6A					;$B3C899   |
	LDA $12,x				;$B3C89B   |
	AND #$4000				;$B3C89D   |
	LDX current_sprite			;$B3C8A0   |
	EOR $12,x				;$B3C8A2   |
	AND #$4000				;$B3C8A4   |
	EOR $12,x				;$B3C8A7   |
	EOR #$4000				;$B3C8A9   |
	STA $12,x				;$B3C8AC   |
CODE_B3C8AE:					;	   |
	LDA #$0100				;$B3C8AE   |
	BIT $12,x				;$B3C8B1   |
	BVS CODE_B3C8B8				;$B3C8B3   |
	LDA #$FF00				;$B3C8B5   |
CODE_B3C8B8:					;	   |
	STA $26,x				;$B3C8B8   |
	STA $20,x				;$B3C8BA   |
	LDA #$FA00				;$B3C8BC   |
	STA $24,x				;$B3C8BF   |
	LDA #$0004				;$B3C8C1   |
	STA $52,x				;$B3C8C4   |
	LDA #$01F2				;$B3C8C6   |
	JSR CODE_B3A627				;$B3C8C9   |
	LDA #$0004				;$B3C8CC   |
	STA $2E,x				;$B3C8CF   |
	LDY $50,x				;$B3C8D1   |
	BEQ CODE_B3C8DB				;$B3C8D3   |
	LDA #$0000				;$B3C8D5   |
	STA $0050,y				;$B3C8D8   |
CODE_B3C8DB:					;	   |
	SEC					;$B3C8DB   |
	RTS					;$B3C8DC  /

krooks_hook_main:
	JSR CODE_B3A369				;$B3C8DD  /

DATA_B3C8E0:
	dw CODE_B3C8E6
	dw CODE_B3C918
	dw CODE_B3C97B


CODE_B3C8E6:
	LDX $50,y				;$B3C8E6  \
	LDA $22,x				;$B3C8E8   |
	BIT $12,x				;$B3C8EA   |
	BVC CODE_B3C8F2				;$B3C8EC   |
	EOR #$FFFF				;$B3C8EE   |
	INC A					;$B3C8F1   |
CODE_B3C8F2:					;	   |
	STA $0020,y				;$B3C8F2   |
	LDA $28,x				;$B3C8F5   |
	BVC CODE_B3C8FD				;$B3C8F7   |
	EOR #$FFFF				;$B3C8F9   |
	INC A					;$B3C8FC   |
CODE_B3C8FD:					;	   |
	CLC					;$B3C8FD   |
	ADC $0006,y				;$B3C8FE   |
	STA $0042,y				;$B3C901   |
	LDA $0006,y				;$B3C904   |
	STA $0044,y				;$B3C907   |
	LDA $1C,x				;$B3C90A   |
	STA $0046,y				;$B3C90C   |
	LDA #$0001				;$B3C90F   |
	STA $002E,y				;$B3C912   |
	TYX					;$B3C915   |
	STZ $48,x				;$B3C916   |
CODE_B3C918:					;	   |
	LDX $50,y				;$B3C918   |
	BEQ CODE_B3C968				;$B3C91A   |
	LDA $0A,x				;$B3C91C   |
	STA $000A,y				;$B3C91E   |
	JSR CODE_B3C98C				;$B3C921   |
	LDA #$0002				;$B3C924   |
	JSL CODE_BEF03D				;$B3C927   |
	LDA $06,x				;$B3C92B   |
	CMP $42,x				;$B3C92D   |
	BIT $12,x				;$B3C92F   |
	BVC CODE_B3C943				;$B3C931   |
	BCC CODE_B3C93B				;$B3C933   |
	CMP $44,x				;$B3C935   |
	BCC CODE_B3C952				;$B3C937   |
	BRA CODE_B3C959				;$B3C939  /

CODE_B3C93B:
	LDA $20,x				;$B3C93B  \
	ADC $46,x				;$B3C93D   |
	STA $20,x				;$B3C93F   |
	BRA CODE_B3C952				;$B3C941  /

CODE_B3C943:
	BCS CODE_B3C94C				;$B3C943  \
	DEC A					;$B3C945   |
	CMP $44,x				;$B3C946   |
	BCS CODE_B3C952				;$B3C948   |
	BRA CODE_B3C959				;$B3C94A  /

CODE_B3C94C:
	LDA $20,x				;$B3C94C  \
	SBC $46,x				;$B3C94E   |
	STA $20,x				;$B3C950   |
CODE_B3C952:					;	   |
	JSL CODE_B9D100				;$B3C952   |
	JML [$05A9]				;$B3C956  /

CODE_B3C959:
	LDY $50,x				;$B3C959  \
	LDA #$0000				;$B3C95B   |
	STA $0050,y				;$B3C95E   |
	JSL CODE_BB82B8				;$B3C961   |
	JML [$05A9]				;$B3C965  /

CODE_B3C968:
	TYX					;$B3C968  \
	LDA #$0800				;$B3C969   |
	BIT $20,x				;$B3C96C   |
	BPL CODE_B3C973				;$B3C96E   |
	LDA #$F800				;$B3C970   |
CODE_B3C973:					;	   |
	STA $26,x				;$B3C973   |
	STZ $2A,x				;$B3C975   |
	STZ $24,x				;$B3C977   |
	INC $2E,x				;$B3C979   |
CODE_B3C97B:					;	   |
	JSR CODE_B3C98C				;$B3C97B   |
	LDA #$000F				;$B3C97E   |
	JSL CODE_BEF03D				;$B3C981   |
	JSL CODE_B9D100				;$B3C985   |
	JMP CODE_B38000				;$B3C989  /

CODE_B3C98C:
	LDX current_sprite			;$B3C98C  \
	LDA $48,x				;$B3C98E   |
	BEQ CODE_B3C9A1				;$B3C990   |
	LDA global_frame_counter		;$B3C992   |
	AND #$0004				;$B3C994   |
	BEQ CODE_B3C99C				;$B3C997   |
	LDA #$C000				;$B3C999   |
CODE_B3C99C:					;	   |
	STA $1C,x				;$B3C99C   |
	STZ $32,x				;$B3C99E   |
	RTS					;$B3C9A0  /

CODE_B3C9A1:
	LDA #$0018				;$B3C9A1  \
	JSL CODE_BEBE14				;$B3C9A4   |
	BCS CODE_B3C9B7				;$B3C9A8   |
	JSL CODE_BCFB58				;$B3C9AA   |
	LDA #$0000				;$B3C9AE   |
	JSL CODE_BEBE8B				;$B3C9B1   |
	BCC CODE_B3C9CA				;$B3C9B5   |
CODE_B3C9B7:					;	   |
	INC $48,x				;$B3C9B7   |
	STZ $30,x				;$B3C9B9   |
	LDA $12,x				;$B3C9BB   |
	ASL A					;$B3C9BD   |
	EOR $20,x				;$B3C9BE   |
	BMI CODE_B3C9CA				;$B3C9C0   |
	LDA $20,x				;$B3C9C2   |
	EOR #$FFFF				;$B3C9C4   |
	INC A					;$B3C9C7   |
	STA $20,x				;$B3C9C8   |
CODE_B3C9CA:					;	   |
	RTS					;$B3C9CA  /

CODE_B3C9CB:
	JSR CODE_B3A627				;$B3C9CB  \
	LDY $6A					;$B3C9CE   |
	LDA $0012,y				;$B3C9D0   |
	AND #$4000				;$B3C9D3   |
	LDX current_sprite			;$B3C9D6   |
	EOR $12,x				;$B3C9D8   |
	AND #$4000				;$B3C9DA   |
	EOR $12,x				;$B3C9DD   |
	EOR #$4000				;$B3C9DF   |
	STA $12,x				;$B3C9E2   |
	CPY $0593				;$B3C9E4   |
	BNE CODE_B3C9F9				;$B3C9E7   |
	LDA $002E,y				;$B3C9E9   |
	CMP #$0052				;$B3C9EC   |
	BNE CODE_B3C9F9				;$B3C9EF   |
	LDA #$0C00				;$B3C9F1   |
	LDY #$0800				;$B3C9F4   |
	BRA CODE_B3C9FF				;$B3C9F7  /

CODE_B3C9F9:
	LDA #$0800				;$B3C9F9  \
	LDY #$0400				;$B3C9FC   |
CODE_B3C9FF:					;	   |
	BIT $12,x				;$B3C9FF   |
	BVS CODE_B3CA07				;$B3CA01   |
	EOR #$FFFF				;$B3CA03   |
	INC A					;$B3CA06   |
CODE_B3CA07:					;	   |
	STA $26,x				;$B3CA07   |
	STA $20,x				;$B3CA09   |
	TYA					;$B3CA0B   |
	SEC					;$B3CA0C   |
	SBC #$0C00				;$B3CA0D   |
	STA $24,x				;$B3CA10   |
	STY $2A,x				;$B3CA12   |
	LDA #$000F				;$B3CA14   |
	STA $52,x				;$B3CA17   |
	RTS					;$B3CA19  /

puftup_main:
	JSR CODE_B3A369				;$B3CA1A  /

DATA_B3CA1D:
	dw CODE_B3CA23
	dw CODE_B3CA5D
	dw CODE_B3CA7A


CODE_B3CA23:
	LDA #$0118				;$B3CA23  \
	JSL CODE_BEBE14				;$B3CA26   |
	BCS CODE_B3CA4D				;$B3CA2A   |
	JSL CODE_BCFB58				;$B3CA2C   |
	LDA #$1400				;$B3CA30   |
	JSL CODE_BEBE8B				;$B3CA33   |
	BCS CODE_B3CA4D				;$B3CA37   |
CODE_B3CA39:					;	   |
	JSL CODE_B3CB55				;$B3CA39   |
	BNE CODE_B3CA43				;$B3CA3D   |
	JSL CODE_B9D100				;$B3CA3F   |
CODE_B3CA43:					;	   |
	JSL CODE_BEF039				;$B3CA43   |
	JSR CODE_B3B887				;$B3CA47   |
	JMP CODE_B38000				;$B3CA4A  /

CODE_B3CA4D:
	BNE CODE_B3CA39				;$B3CA4D  \
	LDA #$0002				;$B3CA4F   |
	STA $2E,x				;$B3CA52   |
	LDA #$0189				;$B3CA54   |
	JSR CODE_B3C9CB				;$B3CA57   |
	JMP CODE_B38000				;$B3CA5A  /

CODE_B3CA5D:
	JSR CODE_B3CA85				;$B3CA5D  \
	LDX current_sprite			;$B3CA60   |
	LDA $06,x				;$B3CA62   |
	STA $0A3E				;$B3CA64   |
	LDA $0A,x				;$B3CA67   |
	STA $0A40				;$B3CA69   |
	JSL CODE_BB82B8				;$B3CA6C   |
	LDY #$0034				;$B3CA70   |
	JSL CODE_BB842C				;$B3CA73   |
	JML [$05A9]				;$B3CA77  /

CODE_B3CA7A:
	JSL CODE_BEF039				;$B3CA7A  \
	JSL CODE_B9D100				;$B3CA7E   |
	JMP CODE_B3A652				;$B3CA82  /

CODE_B3CA85:
	PHK					;$B3CA85  \
	PLB					;$B3CA86   |
	LDA $000C,y				;$B3CA87   |
	STA $0A92				;$B3CA8A   |
	LDA $000E,y				;$B3CA8D   |
	STA $0A94				;$B3CA90   |
	BNE CODE_B3CA9A				;$B3CA93   |
	LDX #$0000				;$B3CA95   |
	BRA CODE_B3CA9D				;$B3CA98  /

CODE_B3CA9A:
	LDX #$0018				;$B3CA9A  \
CODE_B3CA9D:					;	   |
	STX $0A96				;$B3CA9D   |
	LDA #$0004				;$B3CAA0   |
	STA $0A9A				;$B3CAA3   |
CODE_B3CAA6:					;	   |
	LDY #$0086				;$B3CAA6   |
	JSL CODE_BB8412				;$B3CAA9   |
	LDA #$018A				;$B3CAAD   |
	JSL CODE_B9D09B				;$B3CAB0   |
	LDX alternate_sprite			;$B3CAB4   |
	LDA $0A96				;$B3CAB6   |
	TAY					;$B3CAB9   |
	CLC					;$B3CABA   |
	ADC #$0006				;$B3CABB   |
	STA $0A96				;$B3CABE   |
	LDA DATA_B3CB08,y			;$B3CAC1   |
	CLC					;$B3CAC4   |
	ADC $06,x				;$B3CAC5   |
	STA $06,x				;$B3CAC7   |
	LDA DATA_B3CB0A,y			;$B3CAC9   |
	CLC					;$B3CACC   |
	ADC $0A,x				;$B3CACD   |
	STA $0A,x				;$B3CACF   |
	LDA DATA_B3CB0C,y			;$B3CAD1   |
	STA $0A9C				;$B3CAD4   |
	AND #$C000				;$B3CAD7   |
	EOR $12,x				;$B3CADA   |
	STA $12,x				;$B3CADC   |
	LSR $0A9C				;$B3CADE   |
	BCC CODE_B3CAF0				;$B3CAE1   |
	LDA $0A92				;$B3CAE3   |
	BIT $12,x				;$B3CAE6   |
	BVC CODE_B3CAEE				;$B3CAE8   |
	EOR #$FFFF				;$B3CAEA   |
	INC A					;$B3CAED   |
CODE_B3CAEE:					;	   |
	STA $20,x				;$B3CAEE   |
CODE_B3CAF0:					;	   |
	LSR $0A9C				;$B3CAF0   |
	BCC CODE_B3CB02				;$B3CAF3   |
	LDA $0A92				;$B3CAF5   |
	BIT $12,x				;$B3CAF8   |
	BMI CODE_B3CB00				;$B3CAFA   |
	EOR #$FFFF				;$B3CAFC   |
	INC A					;$B3CAFF   |
CODE_B3CB00:					;	   |
	STA $24,x				;$B3CB00   |
CODE_B3CB02:					;	   |
	DEC $0A9A				;$B3CB02   |
	BNE CODE_B3CAA6				;$B3CB05   |
	RTS					;$B3CB07  /


DATA_B3CB08:
	db $00, $00

DATA_B3CB0A:
	db $FA, $FF

DATA_B3CB0C:
	db $02, $00, $0C, $00, $00, $00, $01, $00
	db $00, $00, $06, $00, $02, $80, $F4, $FF
	db $00, $00, $01, $40, $F8, $FF, $F8, $FF
	db $03, $40, $08, $00, $F8, $FF, $03, $00
	db $08, $00, $08, $00, $03, $80, $F8, $FF
	db $08, $00, $03, $C0

puftup_spikes_main:
	LDY current_sprite			;$B3CB38  \
	LDA $0054,y				;$B3CB3A   |
	STA $8E					;$B3CB3D   |
	JSL CODE_BCFB58				;$B3CB3F   |
	LDA #$0000				;$B3CB43   |
	JSL CODE_BEBE8B				;$B3CB46   |
	JSL CODE_BEF039				;$B3CB4A   |
	JSL CODE_B9D100				;$B3CB4E   |
	JMP CODE_B38000				;$B3CB52  /

CODE_B3CB55:
	LDY current_sprite			;$B3CB55  \
	LDA $002F,y				;$B3CB57   |
	AND #$00FF				;$B3CB5A   |
	ASL A					;$B3CB5D   |
	TAX					;$B3CB5E   |
	LDA $0036,y				;$B3CB5F   |
	PHA					;$B3CB62   |
	JSR (DATA_B3CB6C,x)			;$B3CB63   |
	LDX current_sprite			;$B3CB66   |
	PLA					;$B3CB68   |
	CMP $36,x				;$B3CB69   |
	RTL					;$B3CB6B  /

DATA_B3CB6C:
	dw CODE_B3CB8C
	dw CODE_B3CC87
	dw CODE_B3CC8D
	dw CODE_B3CCA0
	dw CODE_B3CCA0
	dw CODE_B3CCA1
	dw !null_pointer
	dw !null_pointer
	dw CODE_B3CB8C
	dw CODE_B3CC87
	dw CODE_B3CC8D
	dw CODE_B3CCA0
	dw CODE_B3CCA0
	dw CODE_B3CCA1
	dw !null_pointer
	dw !null_pointer

CODE_B3CB8C:
	TYX					;$B3CB8C  \
	LDA $50,x				;$B3CB8D   |
	STA $32					;$B3CB8F   |
	LDA $90					;$B3CB91   |
	STA $34					;$B3CB93   |
	LDY #$0000				;$B3CB95   |
CODE_B3CB98:					;	   |
	LDA [$32],y				;$B3CB98   |
	AND #$00FF				;$B3CB9A   |
	CMP #$0080				;$B3CB9D   |
	BCS CODE_B3CBB1				;$B3CBA0   |
	INY					;$B3CBA2   |
	PHA					;$B3CBA3   |
	LDA [$32],y				;$B3CBA4   |
	PLD					;$B3CBA6   |
	STA $00,x				;$B3CBA7   |
	LDA #$0000				;$B3CBA9   |
	TCD					;$B3CBAC   |
	INY					;$B3CBAD   |
	INY					;$B3CBAE   |
	BRA CODE_B3CB98				;$B3CBAF  /

CODE_B3CBB1:
	EOR #$00FF				;$B3CBB1  \
	ASL A					;$B3CBB4   |
	TAX					;$B3CBB5   |
	JMP (DATA_B3CBB9,x)			;$B3CBB6  /

DATA_B3CBB9:
	dw CODE_B3CBCD
	dw CODE_B3CBDC
	dw CODE_B3CBE4
	dw CODE_B3CBF1
	dw CODE_B3CC08
	dw CODE_B3CC25
	dw CODE_B3CC34
	dw CODE_B3CC3B
	dw CODE_B3CC4C
	dw CODE_B3CC62

CODE_B3CBCD:					;	  \
	LDX current_sprite			;$B3CBCD   |
	SEP #$20				;$B3CBCF   |
	LDA $2F,x				;$B3CBD1   |
	AND #$08				;$B3CBD3   |
	ORA #$03				;$B3CBD5   |
	STA $2F,x				;$B3CBD7   |
	REP #$20				;$B3CBD9   |
	RTS					;$B3CBDB  /

CODE_B3CBDC:					;	  \
	LDX current_sprite			;$B3CBDC   |
	INY					;$B3CBDE   |
	LDA [$32],y				;$B3CBDF   |
	STA $50,x				;$B3CBE1   |
	RTS					;$B3CBE3  /

CODE_B3CBE4:					;	  \
	INY					;$B3CBE4   |
	PHY					;$B3CBE5   |
	LDA [$32],y				;$B3CBE6   |
	JSL CODE_B9D0C6				;$B3CBE8   |
	PLY					;$B3CBEC   |
	INY					;$B3CBED   |
	INY					;$B3CBEE   |
	BRA CODE_B3CC5B				;$B3CBEF  /

CODE_B3CBF1:					;	  \
	LDX current_sprite			;$B3CBF1   |
	INY					;$B3CBF3   |
	LDA [$32],y				;$B3CBF4   |
	STA $22,x				;$B3CBF6   |
	SEP #$20				;$B3CBF8   |
	LDA $2F,x				;$B3CBFA   |
	AND #$08				;$B3CBFC   |
	ORA #$01				;$B3CBFE   |
	STA $2F,x				;$B3CC00   |
	REP #$20				;$B3CC02   |
	INY					;$B3CC04   |
	INY					;$B3CC05   |
	BRA CODE_B3CC5B				;$B3CC06  /

CODE_B3CC08:					;	  \
	LDX current_sprite			;$B3CC08   |
	INY					;$B3CC0A   |
	LDA [$32],y				;$B3CC0B   |
	STA $22,x				;$B3CC0D   |
	INY					;$B3CC0F   |
	INY					;$B3CC10   |
	LDA [$32],y				;$B3CC11   |
	STA $28,x				;$B3CC13   |
	SEP #$20				;$B3CC15   |
	LDA $2F,x				;$B3CC17   |
	AND #$08				;$B3CC19   |
	ORA #$02				;$B3CC1B   |
	STA $2F,x				;$B3CC1D   |
	REP #$20				;$B3CC1F   |
	INY					;$B3CC21   |
	INY					;$B3CC22   |
	BRA CODE_B3CC5B				;$B3CC23  /

CODE_B3CC25:					;	  \
	LDX current_sprite			;$B3CC25   |
	INY					;$B3CC27   |
	LDA [$32],y				;$B3CC28   |
	STA $50,x				;$B3CC2A   |
	INY					;$B3CC2C   |
	TYA					;$B3CC2D   |
	SEC					;$B3CC2E   |
	ADC $32					;$B3CC2F   |
	STA $4E,x				;$B3CC31   |
	RTS					;$B3CC33  /

CODE_B3CC34:					;	  \
	LDX current_sprite			;$B3CC34   |
	LDA $4E,x				;$B3CC36   |
	STA $50,x				;$B3CC38   |
	RTS					;$B3CC3A  /

CODE_B3CC3B:					;	  \
	LDX current_sprite			;$B3CC3B   |
	SEP #$20				;$B3CC3D   |
	LDA $2F,x				;$B3CC3F   |
	AND #$08				;$B3CC41   |
	ORA #$04				;$B3CC43   |
	STA $2F,x				;$B3CC45   |
	REP #$20				;$B3CC47   |
	INY					;$B3CC49   |
	BRA CODE_B3CC5B				;$B3CC4A  /

CODE_B3CC4C:					;	  \
	LDX current_sprite			;$B3CC4C   |
	SEP #$20				;$B3CC4E   |
	LDA $2F,x				;$B3CC50   |
	ORA #$08				;$B3CC52   |
	STA $2F,x				;$B3CC54   |
	REP #$20				;$B3CC56   |
	INY					;$B3CC58   |
	BRA CODE_B3CC5B				;$B3CC59  /

CODE_B3CC5B:
	TYA					;$B3CC5B  \
	CLC					;$B3CC5C   |
	ADC $50,x				;$B3CC5D   |
	STA $50,x				;$B3CC5F   |
	RTS					;$B3CC61  /

CODE_B3CC62:					;	  \
	LDX current_sprite			;$B3CC62   |
	INY					;$B3CC64   |
	LDA [$32],y				;$B3CC65   |
	STA $22,x				;$B3CC67   |
	INY					;$B3CC69   |
	INY					;$B3CC6A   |
	LDA [$32],y				;$B3CC6B   |
	STA $28,x				;$B3CC6D   |
	SEP #$20				;$B3CC6F   |
	LDA $2F,x				;$B3CC71   |
	AND #$08				;$B3CC73   |
	ORA #$05				;$B3CC75   |
	STA $2F,x				;$B3CC77   |
	REP #$20				;$B3CC79   |
	INY					;$B3CC7B   |
	INY					;$B3CC7C   |
	PHY					;$B3CC7D   |
	JSR CODE_B3CCA8				;$B3CC7E   |
	JSR CODE_B3CCA8				;$B3CC81   |
	PLY					;$B3CC84   |
	BRA CODE_B3CC5B				;$B3CC85  /

CODE_B3CC87:
	TYX					;$B3CC87  \
	DEC $22,x				;$B3CC88   |
	BEQ CODE_B3CC98				;$B3CC8A   |
	RTS					;$B3CC8C  /

CODE_B3CC8D:
	TYX					;$B3CC8D  \
	LDA $22,x				;$B3CC8E   |
	LDY $28,x				;$B3CC90   |
	JSR CODE_B3C6C0				;$B3CC92   |
	BCC CODE_B3CC98				;$B3CC95   |
	RTS					;$B3CC97  /

CODE_B3CC98:
	LDA $2E,x				;$B3CC98  \
	AND #$08FF				;$B3CC9A   |
	STA $2E,x				;$B3CC9D   |
	RTS					;$B3CC9F  /

CODE_B3CCA0:
	RTS					;$B3CCA0  /

CODE_B3CCA1:
	TYX					;$B3CCA1  \
	JSR CODE_B3CCA8				;$B3CCA2   |
	BCS CODE_B3CC98				;$B3CCA5   |
	RTS					;$B3CCA7  /

CODE_B3CCA8:
	LDY $0593				;$B3CCA8  \
	LDA $22,x				;$B3CCAB   |
	BEQ CODE_B3CCC3				;$B3CCAD   |
	ASL A					;$B3CCAF   |
	STA $32					;$B3CCB0   |
	LSR A					;$B3CCB2   |
	CMP $0006,y				;$B3CCB3   |
	ROR $32					;$B3CCB6   |
	LDA $22,x				;$B3CCB8   |
	EOR $32					;$B3CCBA   |
	ASL A					;$B3CCBC   |
	LDA $32					;$B3CCBD   |
	STA $22,x				;$B3CCBF   |
	BCS CODE_B3CCDB				;$B3CCC1   |
CODE_B3CCC3:					;	   |
	LDA $28,x				;$B3CCC3   |
	BEQ CODE_B3CCDA				;$B3CCC5   |
	ASL A					;$B3CCC7   |
	STA $32					;$B3CCC8   |
	LSR A					;$B3CCCA   |
	CMP $000A,y				;$B3CCCB   |
	ROR $32					;$B3CCCE   |
	LDA $28,x				;$B3CCD0   |
	EOR $32					;$B3CCD2   |
	ASL A					;$B3CCD4   |
	LDA $32					;$B3CCD5   |
	STA $28,x				;$B3CCD7   |
	RTS					;$B3CCD9  /

CODE_B3CCDA:
	CLC					;$B3CCDA  \
CODE_B3CCDB:					;	   |
	RTS					;$B3CCDB  /

cat_o9tails_main:
	JSR CODE_B3A369				;$B3CCDC  /

DATA_B3CCDF:
	dw CODE_B3CCF1
	dw CODE_B3CD23
	dw CODE_B3CD2F
	dw CODE_B3CD48
	dw CODE_B3CD96
	dw CODE_B3CDC0
	dw CODE_B3CDFD
	dw CODE_B3CE59
	dw CODE_B3CE6E


CODE_B3CCF1:
	TYX					;$B3CCF1  \
	LDA $1C,x				;$B3CCF2   |
	BEQ CODE_B3CCFA				;$B3CCF4   |
	DEC $1C,x				;$B3CCF6   |
	BNE CODE_B3CCFC				;$B3CCF8   |
CODE_B3CCFA:					;	   |
	INC $2E,x				;$B3CCFA   |
CODE_B3CCFC:					;	   |
	LDA $52,x				;$B3CCFC   |
	CMP #$018D				;$B3CCFE   |
	BEQ CODE_B3CD0D				;$B3CD01   |
	LDA #$5428				;$B3CD03   |
	JSR CODE_B3CF41				;$B3CD06   |
	BCS CODE_B3CD20				;$B3CD09   |
	BRA CODE_B3CD12				;$B3CD0B  /

CODE_B3CD0D:
	JSR CODE_B3CF60				;$B3CD0D  \
	BCS CODE_B3CD8A				;$B3CD10   |
CODE_B3CD12:					;	   |
	JSL CODE_B9D100				;$B3CD12   |
	LDA #$0022				;$B3CD16   |
	JSR CODE_B3CE79				;$B3CD19   |
	JSL CODE_BBBB99				;$B3CD1C   |
CODE_B3CD20:					;	   |
	JML [$05A9]				;$B3CD20  /

CODE_B3CD23:
	TYX					;$B3CD23  \
	LDA $42,x				;$B3CD24   |
	LDY $44,x				;$B3CD26   |
	JSR CODE_B3C6C0				;$B3CD28   |
	BCS CODE_B3CCFC				;$B3CD2B   |
	INC $2E,x				;$B3CD2D   |
CODE_B3CD2F:					;	   |
	LDX current_sprite			;$B3CD2F   |
	LDA $52,x				;$B3CD31   |
	BEQ CODE_B3CCFC				;$B3CD33   |
	JSL CODE_B9D0C6				;$B3CD35   |
	STZ $22,x				;$B3CD39   |
	LDA $46,x				;$B3CD3B   |
	STA $26,x				;$B3CD3D   |
	LDA $48,x				;$B3CD3F   |
	STA $1C,x				;$B3CD41   |
	INC $2E,x				;$B3CD43   |
	JMP CODE_B38000				;$B3CD45  /

CODE_B3CD48:
	LDA $0036,y				;$B3CD48  \
	CMP #$018D				;$B3CD4B   |
	BEQ CODE_B3CD67				;$B3CD4E   |
	LDA #$5428				;$B3CD50   |
	JSR CODE_B3CF41				;$B3CD53   |
	BCS CODE_B3CD8A				;$B3CD56   |
	LDX current_sprite			;$B3CD58   |
	JSL CODE_B9D100				;$B3CD5A   |
	LDA #$0022				;$B3CD5E   |
	JSR CODE_B3CE79				;$B3CD61   |
	JMP CODE_B38000				;$B3CD64  /

CODE_B3CD67:
	LDX current_sprite			;$B3CD67  \
	LDA $1C,x				;$B3CD69   |
	BEQ CODE_B3CD8D				;$B3CD6B   |
	DEC $1C,x				;$B3CD6D   |
	JSR CODE_B3CF60				;$B3CD6F   |
	BCS CODE_B3CD8A				;$B3CD72   |
	LDX current_sprite			;$B3CD74   |
	LDA #$0000				;$B3CD76   |
	JSR CODE_B3B28E				;$B3CD79   |
	JSL CODE_B9D100				;$B3CD7C   |
	LDA #$0022				;$B3CD80   |
	JSR CODE_B3CE79				;$B3CD83   |
	JSL CODE_BBBB99				;$B3CD86   |
CODE_B3CD8A:					;	   |
	JML [$05A9]				;$B3CD8A  /

CODE_B3CD8D:
	INC $2E,x				;$B3CD8D  \
	JSL CODE_B9D100				;$B3CD8F   |
	JML [$05A9]				;$B3CD93  /

CODE_B3CD96:
	LDA #$542C				;$B3CD96  \
	JSR CODE_B3CF41				;$B3CD99   |
	BCS CODE_B3CDB7				;$B3CD9C   |
	LDX current_sprite			;$B3CD9E   |
	LDA $4A,x				;$B3CDA0   |
	STA $1C,x				;$B3CDA2   |
	STZ $2E,x				;$B3CDA4   |
	STZ $52,x				;$B3CDA6   |
	STZ $26,x				;$B3CDA8   |
	STZ $20,x				;$B3CDAA   |
	LDA #$018B				;$B3CDAC   |
	CMP $36,x				;$B3CDAF   |
	BEQ CODE_B3CDB7				;$B3CDB1   |
	JSL CODE_B9D0C6				;$B3CDB3   |
CODE_B3CDB7:					;	   |
	LDA #$0022				;$B3CDB7   |
	JSR CODE_B3CE79				;$B3CDBA   |
	JML [$05A9]				;$B3CDBD  /

CODE_B3CDC0:
	LDA #$0118				;$B3CDC0  \
	JSL CODE_BEBE14				;$B3CDC3   |
	BCS CODE_B3CDDF				;$B3CDC7   |
	JSL CODE_BBBB69				;$B3CDC9   |
	BCS CODE_B3CDEF				;$B3CDCD   |
	LDA #$0022				;$B3CDCF   |
	JSR CODE_B3CE79				;$B3CDD2   |
	JSL CODE_B9D100				;$B3CDD5   |
	JSR CODE_B3CE80				;$B3CDD9   |
	JML [$05A9]				;$B3CDDC  /

CODE_B3CDDF:
	JSR CODE_B3CF7F				;$B3CDDF  \
	STZ $0AE8				;$B3CDE2   |
	LDA #$001B				;$B3CDE5   |
	JSL CODE_B8D8BA				;$B3CDE8   |
	JML [$05A9]				;$B3CDEC  /

CODE_B3CDEF:
	LDA #$0029				;$B3CDEF  \
	JSL CODE_B8D8BA				;$B3CDF2   |
	JSL CODE_BB82B8				;$B3CDF6   |
	JML [$05A9]				;$B3CDFA  /

CODE_B3CDFD:
	LDA #$0014				;$B3CDFD  \
	JSL CODE_B8D8BA				;$B3CE00   |
	BCS CODE_B3CE48				;$B3CE04   |
	LDX current_sprite			;$B3CE06   |
	LDA $4C,x				;$B3CE08   |
	STA $8E					;$B3CE0A   |
	LDA [$8E]				;$B3CE0C   |
	STA $0A87				;$B3CE0E   |
	AND #$00FF				;$B3CE11   |
	STA $0A86				;$B3CE14   |
	STZ $0A89				;$B3CE17   |
	JSL CODE_808E4F				;$B3CE1A   |
	LSR A					;$B3CE1E   |
	STA $32					;$B3CE1F   |
	LDY #$0004				;$B3CE21   |
	LDA [$8E],y				;$B3CE24   |
	BCC CODE_B3CE2C				;$B3CE26   |
	CMP #$8000				;$B3CE28   |
	ROR A					;$B3CE2B   |
CODE_B3CE2C:					;	   |
	LSR $32					;$B3CE2C   |
	BCC CODE_B3CE33				;$B3CE2E   |
	EOR #$FFFF				;$B3CE30   |
CODE_B3CE33:					;	   |
	LDY #$0002				;$B3CE33   |
	ADC [$8E],y				;$B3CE36   |
	STA $0A8A				;$B3CE38   |
	LDY #$0006				;$B3CE3B   |
	LDA [$8E],y				;$B3CE3E   |
	STA $0A8C				;$B3CE40   |
	INC $2E,x				;$B3CE43   |
	STZ $0AE8				;$B3CE45   |
CODE_B3CE48:					;	   |
	JSL CODE_B9D100				;$B3CE48   |
	LDA $54,x				;$B3CE4C   |
	STA $8E					;$B3CE4E   |
	LDA #$0022				;$B3CE50   |
	JSR CODE_B3CE79				;$B3CE53   |
	JMP CODE_B38000				;$B3CE56  /

CODE_B3CE59:
	LDA #$542C				;$B3CE59  \
	JSR CODE_B3CF41				;$B3CE5C   |
	BCS CODE_B3CE65				;$B3CE5F   |
	JSL CODE_B9D100				;$B3CE61   |
CODE_B3CE65:					;	   |
	LDA #$0022				;$B3CE65   |
	JSR CODE_B3CE79				;$B3CE68   |
	JMP CODE_B38000				;$B3CE6B  /

CODE_B3CE6E:
	JSL CODE_BEF039				;$B3CE6E  \
	JSL CODE_B9D100				;$B3CE72   |
	JMP CODE_B3A652				;$B3CE76  /

CODE_B3CE79:
	LDX current_sprite			;$B3CE79  \
	JSL CODE_BEF03D				;$B3CE7B   |
	RTS					;$B3CE7F  /

CODE_B3CE80:
	LDX current_sprite			;$B3CE80  \
	PHK					;$B3CE82   |
	PLB					;$B3CE83   |
	LDA $1A,x				;$B3CE84   |
	SEC					;$B3CE86   |
	SBC #$24C4				;$B3CE87   |
	LSR A					;$B3CE8A   |
	LSR A					;$B3CE8B   |
	ASL A					;$B3CE8C   |
	TAY					;$B3CE8D   |
	LDA DATA_B3CF01,y			;$B3CE8E   |
	BIT $12,x				;$B3CE91   |
	BVC CODE_B3CE99				;$B3CE93   |
	EOR #$FFFF				;$B3CE95   |
	INC A					;$B3CE98   |
CODE_B3CE99:					;	   |
	STA $32					;$B3CE99   |
	LDA DATA_B3CF11,y			;$B3CE9B   |
	STA $34					;$B3CE9E   |
	LDA DATA_B3CF21,y			;$B3CEA0   |
	STA $36					;$B3CEA3   |
	LDA DATA_B3CF31,y			;$B3CEA5   |
	STA $02,x				;$B3CEA8   |
	LDY $0593				;$B3CEAA   |
	LDA $06,x				;$B3CEAD   |
	CLC					;$B3CEAF   |
	ADC $32					;$B3CEB0   |
	STA $0006,y				;$B3CEB2   |
	LDA $0A,x				;$B3CEB5   |
	CLC					;$B3CEB7   |
	ADC $34					;$B3CEB8   |
	STA $000A,y				;$B3CEBA   |
	LDA #$0000				;$B3CEBD   |
	STA $0024,y				;$B3CEC0   |
	LDA $36					;$B3CEC3   |
	EOR $0012,y				;$B3CEC5   |
	AND #$4000				;$B3CEC8   |
	EOR $0012,y				;$B3CECB   |
	STA $0012,y				;$B3CECE   |
	LDA $08C2				;$B3CED1   |
	BIT #$4000				;$B3CED4   |
	BEQ CODE_B3CF00				;$B3CED7   |
	LDY $0597				;$B3CED9   |
	LDA $06,x				;$B3CEDC   |
	CLC					;$B3CEDE   |
	ADC $32					;$B3CEDF   |
	STA $0006,y				;$B3CEE1   |
	LDA $0A,x				;$B3CEE4   |
	CLC					;$B3CEE6   |
	ADC $34					;$B3CEE7   |
	STA $000A,y				;$B3CEE9   |
	LDA #$0000				;$B3CEEC   |
	STA $0024,y				;$B3CEEF   |
	LDA $36					;$B3CEF2   |
	EOR $0012,y				;$B3CEF4   |
	AND #$4000				;$B3CEF7   |
	EOR $0012,y				;$B3CEFA   |
	STA $0012,y				;$B3CEFD   |
CODE_B3CF00:					;	   |
	RTS					;$B3CF00  /

DATA_B3CF01:
	db $F6, $FF, $FE, $FF, $06, $00, $0E, $00
	db $0E, $00, $06, $00, $FE, $FF, $F6, $FF

DATA_B3CF11:
	db $F8, $FF, $F7, $FF, $F7, $FF, $F8, $FF
	db $F8, $FF, $F7, $FF, $F7, $FF, $F8, $FF

DATA_B3CF21:
	db $00, $00, $00, $40, $00, $40, $00, $40
	db $00, $40, $00, $00, $00, $00, $00, $00

DATA_B3CF31:
	db $D4, $00, $EC, $00, $EC, $00, $EC, $00
	db $EC, $00, $D4, $00, $D4, $00, $D4, $00

CODE_B3CF41:
	STA $0DC6				;$B3CF41  \
	LDA #$0118				;$B3CF44   |
	JSL CODE_BEBE14				;$B3CF47   |
	BCS CODE_B3CF7F				;$B3CF4B   |
	JSR CODE_B3CFE6				;$B3CF4D   |
	BCC CODE_B3CF5F				;$B3CF50   |
	JSL CODE_BCFB58				;$B3CF52   |
	LDA $0DC6				;$B3CF56   |
	JSL CODE_BEBE8B				;$B3CF59   |
	BCS CODE_B3CF7F				;$B3CF5D   |
CODE_B3CF5F:					;	   |
	RTS					;$B3CF5F  /

CODE_B3CF60:
	LDA #$0118				;$B3CF60  \
	JSL CODE_BEBE14				;$B3CF63   |
	BCS CODE_B3CF7F				;$B3CF67   |
	JSR CODE_B3CFE6				;$B3CF69   |
	BCC CODE_B3CF7E				;$B3CF6C   |
	JSL CODE_BCFB58				;$B3CF6E   |
	LDA #$5C00				;$B3CF72   |
	LDY #$0010				;$B3CF75   |
	JSL CODE_BEBE8E				;$B3CF78   |
	BCS CODE_B3CF7F				;$B3CF7C   |
CODE_B3CF7E:					;	   |
	RTS					;$B3CF7E  /

CODE_B3CF7F:
	BEQ CODE_B3CFAC				;$B3CF7F  \
	CMP #$0001				;$B3CF81   |
	BEQ CODE_B3CF8D				;$B3CF84   |
	CMP #$0003				;$B3CF86   |
	BEQ CODE_B3CF94				;$B3CF89   |
	CLC					;$B3CF8B   |
	RTS					;$B3CF8C  /

CODE_B3CF8D:
	LDA #$0004				;$B3CF8D  \
	STA $2E,x				;$B3CF90   |
	SEC					;$B3CF92   |
	RTS					;$B3CF93  /

CODE_B3CF94:
	LDA #$0005				;$B3CF94  \
	STA $2E,x				;$B3CF97   |
	STZ $26,x				;$B3CF99   |
	LDA #$018E				;$B3CF9B   |
	JSL CODE_B9D0C6				;$B3CF9E   |
	LDA #$0055				;$B3CFA2   |
	STA $3A,x				;$B3CFA5   |
	STX $0AE8				;$B3CFA7   |
	SEC					;$B3CFAA   |
	RTS					;$B3CFAB  /

CODE_B3CFAC:
	LDA #$0008				;$B3CFAC  \
	STA $2E,x				;$B3CFAF   |
	LDA #$018F				;$B3CFB1   |
	JSR CODE_B3A627				;$B3CFB4   |
	LDX $6A					;$B3CFB7   |
	LDA $12,x				;$B3CFB9   |
	AND #$4000				;$B3CFBB   |
	LDX current_sprite			;$B3CFBE   |
	EOR $12,x				;$B3CFC0   |
	AND #$4000				;$B3CFC2   |
	EOR $12,x				;$B3CFC5   |
	EOR #$4000				;$B3CFC7   |
	STA $12,x				;$B3CFCA   |
	LDA #$0100				;$B3CFCC   |
	BIT $12,x				;$B3CFCF   |
	BVS CODE_B3CFD6				;$B3CFD1   |
	LDA #$FF00				;$B3CFD3   |
CODE_B3CFD6:					;	   |
	STA $26,x				;$B3CFD6   |
	STA $20,x				;$B3CFD8   |
	LDA #$FA00				;$B3CFDA   |
	STA $24,x				;$B3CFDD   |
	LDA #$0004				;$B3CFDF   |
	STA $52,x				;$B3CFE2   |
	SEC					;$B3CFE4   |
	RTS					;$B3CFE5  /

CODE_B3CFE6:
	LDA $0A82				;$B3CFE6  \
	CMP #$0013				;$B3CFE9   |
	BEQ CODE_B3D006				;$B3CFEC   |
	LDY $0593				;$B3CFEE   |
	LDA $002E,y				;$B3CFF1   |
	CMP #$0048				;$B3CFF4   |
	BEQ CODE_B3D006				;$B3CFF7   |
	CMP #$0012				;$B3CFF9   |
	BNE CODE_B3D004				;$B3CFFC   |
	LDA $0024,y				;$B3CFFE   |
	DEC A					;$B3D001   |
	BMI CODE_B3D006				;$B3D002   |
CODE_B3D004:					;	   |
	SEC					;$B3D004   |
	RTS					;$B3D005  /

CODE_B3D006:
	CLC					;$B3D006  \
	RTS					;$B3D007  /

kloak_main:
	JSR CODE_B3A369				;$B3D008  /

						;$B3D00B   |
	dw CODE_B3D019
	dw CODE_B3D03E
	dw CODE_B3D04B
	dw CODE_B3D089
	dw CODE_B3D098
	dw CODE_B3D0AE
	dw CODE_B3D0DF

CODE_B3D019:
	JSR CODE_B3D184				;$B3D019  \
	BCS CODE_B3D028				;$B3D01C   |
	JSL CODE_B3CB55				;$B3D01E   |
	BNE CODE_B3D028				;$B3D022   |
	JSL CODE_B9D100				;$B3D024   |
CODE_B3D028:					;	   |
	JSL CODE_BEF039				;$B3D028   |
	LDX current_sprite			;$B3D02C   |
	LDA $2E,x				;$B3D02E   |
	AND #$0800				;$B3D030   |
	BNE CODE_B3D038				;$B3D033   |
	JMP CODE_B38000				;$B3D035  /

CODE_B3D038:
	JSR CODE_B3A3EB				;$B3D038  \
	JML [$05A9]				;$B3D03B  /

CODE_B3D03E:
	LDY #$0008				;$B3D03E  \
	JSL CODE_BB842C				;$B3D041   |
	BCS CODE_B3D069				;$B3D045   |
	LDX current_sprite			;$B3D047   |
	INC $2E,x				;$B3D049   |
CODE_B3D04B:					;	   |
	JSR CODE_B3D184				;$B3D04B   |
	BCS CODE_B3D074				;$B3D04E   |
	LDX current_sprite			;$B3D050   |
	LDA $10,x				;$B3D052   |
	STA $8E					;$B3D054   |
	LDA [$8E]				;$B3D056   |
	TAY					;$B3D058   |
	JSL CODE_BB8432				;$B3D059   |
	BCS CODE_B3D069				;$B3D05D   |
	JSR CODE_B3D0F1				;$B3D05F   |
	LDX current_sprite			;$B3D062   |
	INC $2E,x				;$B3D064   |
	JSR CODE_B3D1D9				;$B3D066   |
CODE_B3D069:					;	   |
	LDY current_sprite			;$B3D069   |
	LDA $0054,y				;$B3D06B   |
	STA $8E					;$B3D06E   |
	JSL CODE_B3D2EC				;$B3D070   |
CODE_B3D074:					;	   |
	JML [$05A9]				;$B3D074  /

CODE_B3D077:
	LDY current_sprite			;$B3D077  \
	LDX $1E,y				;$B3D079   |
	BEQ CODE_B3D086				;$B3D07B   |
	LDA $52,x				;$B3D07D   |
	AND #$FF7F				;$B3D07F   |
	STA $52,x				;$B3D082   |
	STZ $1E,x				;$B3D084   |
CODE_B3D086:					;	   |
	JML [$05A9]				;$B3D086  /

CODE_B3D089:
	JSR CODE_B3D184				;$B3D089  \
	BCS CODE_B3D077				;$B3D08C   |
	JSL CODE_B3D2EC				;$B3D08E   |
	JSR CODE_B3D1D9				;$B3D092   |
	JML [$05A9]				;$B3D095  /

CODE_B3D098:
	TYX					;$B3D098  \
	STZ $10,x				;$B3D099   |
	INC $2E,x				;$B3D09B   |
	LDX $1E,y				;$B3D09D   |
	BEQ CODE_B3D0AE				;$B3D09F   |
	LDA $52,x				;$B3D0A1   |
	AND #$FF7F				;$B3D0A3   |
	STA $52,x				;$B3D0A6   |
	LDA $3F,x				;$B3D0A8   |
	BMI CODE_B3D0AE				;$B3D0AA   |
	STZ $1E,x				;$B3D0AC   |
CODE_B3D0AE:					;	   |
	JSR CODE_B3D184				;$B3D0AE   |
	BCS CODE_B3D0BF				;$B3D0B1   |
	LDX $1E,y				;$B3D0B3   |
	BEQ CODE_B3D0C2				;$B3D0B5   |
	JSL CODE_BEF039				;$B3D0B7   |
	JSL CODE_B3D2EC				;$B3D0BB   |
CODE_B3D0BF:					;	   |
	JML [$05A9]				;$B3D0BF  /

CODE_B3D0C2:
	SEP #$20				;$B3D0C2  \
	LDA #$00				;$B3D0C4   |
	STA $002E,y				;$B3D0C6   |
	LDA $002F,y				;$B3D0C9   |
	AND #$07				;$B3D0CC   |
	CMP #$04				;$B3D0CE   |
	BNE CODE_B3D0DA				;$B3D0D0   |
	LDA $002F,y				;$B3D0D2   |
	AND #$08				;$B3D0D5   |
	STA $002F,y				;$B3D0D7   |
CODE_B3D0DA:					;	   |
	REP #$20				;$B3D0DA   |
	JMP CODE_B3D019				;$B3D0DC  /

CODE_B3D0DF:
	JSL CODE_BEF039				;$B3D0DF  \
	JSL CODE_B9D100				;$B3D0E3   |
	LDA $1E,x				;$B3D0E7   |
	BNE CODE_B3D0EE				;$B3D0E9   |
	JMP CODE_B3A652				;$B3D0EB  /

CODE_B3D0EE:
	JML [$05A9]				;$B3D0EE  /

CODE_B3D0F1:
	LDY current_sprite			;$B3D0F1  \
	LDX alternate_sprite			;$B3D0F3   |
	STX $1E,y				;$B3D0F5   |
	STY $56,x				;$B3D0F7   |
	LDA #$3C3C				;$B3D0F9   |
	STA $5A,x				;$B3D0FC   |
	STZ $32,x				;$B3D0FE   |
	LDA $0002,y				;$B3D100   |
	DEC A					;$B3D103   |
	STA $02,x				;$B3D104   |
	LDA $0012,y				;$B3D106   |
	STA $32					;$B3D109   |
	EOR $12,x				;$B3D10B   |
	AND #$B000				;$B3D10D   |
	EOR $12,x				;$B3D110   |
	STA $12,x				;$B3D112   |
	BIT $32					;$B3D114   |
	BVS CODE_B3D12D				;$B3D116   |
	EOR #$4000				;$B3D118   |
	STA $12,x				;$B3D11B   |
	LDA $20,x				;$B3D11D   |
	EOR #$FFFF				;$B3D11F   |
	INC A					;$B3D122   |
	STA $20,x				;$B3D123   |
	LDA $26,x				;$B3D125   |
	EOR #$FFFF				;$B3D127   |
	INC A					;$B3D12A   |
	STA $26,x				;$B3D12B   |
CODE_B3D12D:					;	   |
	LDA $04,x				;$B3D12D   |
	STA $000C,y				;$B3D12F   |
	LDA $20,x				;$B3D132   |
	STA $000E,y				;$B3D134   |
	LDA $08,x				;$B3D137   |
	STA $0040,y				;$B3D139   |
	LDA $24,x				;$B3D13C   |
	STA $005C,y				;$B3D13E   |
	LDA $53,x				;$B3D141   |
	AND #$00FF				;$B3D143   |
	STA $001C,y				;$B3D146   |
	LDY #$0008				;$B3D149   |
	LDA $51,x				;$B3D14C   |
	EOR [$8E],y				;$B3D14E   |
	AND #$FF00				;$B3D150   |
	EOR [$8E],y				;$B3D153   |
	ORA #$0080				;$B3D155   |
	STA $52,x				;$B3D158   |
	LDA $2E,x				;$B3D15A   |
	ORA #$0080				;$B3D15C   |
	STA $2E,x				;$B3D15F   |
	INY					;$B3D161   |
	LDA [$8E],y				;$B3D162   |
	AND #$00FF				;$B3D164   |
	STA $40,x				;$B3D167   |
	INY					;$B3D169   |
	LDA [$8E],y				;$B3D16A   |
	STA $1E,x				;$B3D16C   |
	LDY #$0002				;$B3D16E   |
	LDA [$8E],y				;$B3D171   |
	BIT $32					;$B3D173   |
	BVC CODE_B3D17B				;$B3D175   |
	EOR #$FFFF				;$B3D177   |
	INC A					;$B3D17A   |
CODE_B3D17B:					;	   |
	STA $20,x				;$B3D17B   |
	INY					;$B3D17D   |
	INY					;$B3D17E   |
	LDA [$8E],y				;$B3D17F   |
	STA $24,x				;$B3D181   |
	RTS					;$B3D183  /

CODE_B3D184:
	LDA #$0118				;$B3D184  \
	JSL CODE_BEBE14				;$B3D187   |
	BCS CODE_B3D19B				;$B3D18B   |
	JSL CODE_BCFB58				;$B3D18D   |
	LDA #$5428				;$B3D191   |
	JSL CODE_BEBE8B				;$B3D194   |
	BCS CODE_B3D19B				;$B3D198   |
	RTS					;$B3D19A  /

CODE_B3D19B:
	BNE CODE_B3D1D7				;$B3D19B  \
	LDA #$0006				;$B3D19D   |
	STA $2E,x				;$B3D1A0   |
	LDA #$02D3				;$B3D1A2   |
	JSR CODE_B3A627				;$B3D1A5   |
	LDX $6A					;$B3D1A8   |
	LDA $12,x				;$B3D1AA   |
	AND #$4000				;$B3D1AC   |
	LDX current_sprite			;$B3D1AF   |
	EOR $12,x				;$B3D1B1   |
	AND #$4000				;$B3D1B3   |
	EOR $12,x				;$B3D1B6   |
	EOR #$4000				;$B3D1B8   |
	STA $12,x				;$B3D1BB   |
	LDA #$0100				;$B3D1BD   |
	BIT $12,x				;$B3D1C0   |
	BVS CODE_B3D1C7				;$B3D1C2   |
	LDA #$FF00				;$B3D1C4   |
CODE_B3D1C7:					;	   |
	STA $26,x				;$B3D1C7   |
	STA $20,x				;$B3D1C9   |
	LDA #$FA00				;$B3D1CB   |
	STA $24,x				;$B3D1CE   |
	LDA #$0004				;$B3D1D0   |
	STA $52,x				;$B3D1D3   |
	SEC					;$B3D1D5   |
	RTS					;$B3D1D6  /

CODE_B3D1D7:
	CLC					;$B3D1D7  \
	RTS					;$B3D1D8  /

CODE_B3D1D9:
	PHK					;$B3D1D9  \
	PLB					;$B3D1DA   |
	LDX current_sprite			;$B3D1DB   |
	LDA $10,x				;$B3D1DD   |
	STA $8E					;$B3D1DF   |
	LDY #$0006				;$B3D1E1   |
	LDA [$8E],y				;$B3D1E4   |
	STA $34					;$B3D1E6   |
	LDA $1A,x				;$B3D1E8   |
	SEC					;$B3D1EA   |
	SBC #$2584				;$B3D1EB   |
	CMP #$0031				;$B3D1EE   |
	BCS CODE_B3D220				;$B3D1F1   |
	TAY					;$B3D1F3   |
	LDA $34					;$B3D1F4   |
	AND #$00FF				;$B3D1F6   |
	SEC					;$B3D1F9   |
	SBC DATA_B3D221,y			;$B3D1FA   |
	STA $32					;$B3D1FD   |
	LDA $35					;$B3D1FF   |
	AND #$00FF				;$B3D201   |
	SEC					;$B3D204   |
	SBC DATA_B3D223,y			;$B3D205   |
	LDY $1E,x				;$B3D208   |
	CLC					;$B3D20A   |
	ADC $0A,x				;$B3D20B   |
	STA $000A,y				;$B3D20D   |
	LDA $32					;$B3D210   |
	BIT $12,x				;$B3D212   |
	BVC CODE_B3D21A				;$B3D214   |
	EOR #$FFFF				;$B3D216   |
	INC A					;$B3D219   |
CODE_B3D21A:					;	   |
	CLC					;$B3D21A   |
	ADC $06,x				;$B3D21B   |
	STA $0006,y				;$B3D21D   |
CODE_B3D220:					;	   |
	RTS					;$B3D220  /

DATA_B3D221:
	db $A0, $00

DATA_B3D223:
	db $84, $00, $A1, $00, $83, $00, $A2, $00
	db $81, $00, $A1, $00, $7F, $00, $A0, $00
	db $7F, $00, $A0, $00, $86, $00, $9E, $00
	db $97, $00, $97, $00, $A2, $00, $84, $00
	db $A7, $00, $84, $00, $A7, $00

CODE_B3D249:
	LDA $0040,y				;$B3D249  \
	AND #$007F				;$B3D24C   |
	ASL A					;$B3D24F   |
	TAX					;$B3D250   |
	JSR (DATA_B3D2CE,x)			;$B3D251   |
	BCS CODE_B3D295				;$B3D254   |
	LDX current_sprite			;$B3D256   |
	LDA $51,x				;$B3D258   |
	BMI CODE_B3D291				;$B3D25A   |
	AND #$FF00				;$B3D25C   |
	CMP #$1300				;$B3D25F   |
	BCC CODE_B3D295				;$B3D262   |
	CMP #$1601				;$B3D264   |
	BCC CODE_B3D273				;$B3D267   |
	CMP #$2600				;$B3D269   |
	BCC CODE_B3D295				;$B3D26C   |
	CMP #$2701				;$B3D26E   |
	BCS CODE_B3D295				;$B3D271   |
CODE_B3D273:					;	   |
	JSL CODE_BEF039				;$B3D273   |
	JSL CODE_B3D2EC				;$B3D277   |
	JSL CODE_BBBB69				;$B3D27B   |
	LDX current_sprite			;$B3D27F   |
	LDA $5A,x				;$B3D281   |
	BCC CODE_B3D28B				;$B3D283   |
	SBC #$0100				;$B3D285   |
	BCC CODE_B3D295				;$B3D288   |
	XBA					;$B3D28A   |
CODE_B3D28B:					;	   |
	SEP #$20				;$B3D28B   |
	STA $5B,x				;$B3D28D   |
	REP #$20				;$B3D28F   |
CODE_B3D291:					;	   |
	PLA					;$B3D291   |
	JML [$05A9]				;$B3D292  /

CODE_B3D295:
	LDX current_sprite			;$B3D295  \
	LDA $2E,x				;$B3D297   |
	AND #$FF7F				;$B3D299   |
	STA $2E,x				;$B3D29C   |
	LDY $56,x				;$B3D29E   |
	LDA $000C,y				;$B3D2A0   |
	STA $04,x				;$B3D2A3   |
	LDA $000E,y				;$B3D2A5   |
	STA $20,x				;$B3D2A8   |
	LDA $0040,y				;$B3D2AA   |
	STA $08,x				;$B3D2AD   |
	LDA $005C,y				;$B3D2AF   |
	STA $24,x				;$B3D2B2   |
	LDA $001C,y				;$B3D2B4   |
	XBA					;$B3D2B7   |
	ORA $52,x				;$B3D2B8   |
	AND #$FF7F				;$B3D2BA   |
	BIT #$FF00				;$B3D2BD   |
	BEQ CODE_B3D2C2				;$B3D2C0   |
CODE_B3D2C2:					;	   |
	STA $52,x				;$B3D2C2   |
	STZ $56,x				;$B3D2C4   |
	STZ $5A,x				;$B3D2C6   |
	TYX					;$B3D2C8   |
	STZ $1E,x				;$B3D2C9   |
	JMP CODE_B3A369				;$B3D2CB  /

DATA_B3D2CE:
	dw CODE_B3D2DB
	dw CODE_B3D2DD
	dw CODE_B3D2D4


CODE_B3D2D4:
	LDA $0032,y				;$B3D2D4  \
	BEQ CODE_B3D2DD				;$B3D2D7   |
	SEC					;$B3D2D9   |
	RTS					;$B3D2DA  /

CODE_B3D2DB:
	CLC					;$B3D2DB  \
	RTS					;$B3D2DC  /

CODE_B3D2DD:
	JSL CODE_BCFB58				;$B3D2DD  \
	LDA #$0010				;$B3D2E1   |
	PHK					;$B3D2E4   |
	%return(CODE_B3D2EB)			;$B3D2E5   |
	JML [$09F9]				;$B3D2E8  /

CODE_B3D2EB:
	RTS					;$B3D2EB  /

CODE_B3D2EC:
	LDX current_sprite			;$B3D2EC  \
	LDA $40,x				;$B3D2EE   |
	PHA					;$B3D2F0   |
	JSL CODE_B9D100				;$B3D2F1   |
	PLA					;$B3D2F5   |
	STA $40,x				;$B3D2F6   |
	RTL					;$B3D2F8  /

unknown_sprite_02E8_main:
	JSR CODE_B3A369				;$B3D2F9  /

DATA_B3D2FC:
	dw CODE_B3D306
	dw CODE_B3D312
	dw CODE_B3D354
	dw CODE_B3D379
	dw CODE_B3D3B7


CODE_B3D306:
	JSR CODE_B3D3F9				;$B3D306  \
	BCS CODE_B3D30F				;$B3D309   |
	JSL CODE_B9D100				;$B3D30B   |
CODE_B3D30F:					;	   |
	JMP CODE_B38000				;$B3D30F  /

CODE_B3D312:
	JSR CODE_B39ECC				;$B3D312  \
	JSR CODE_B39EBE				;$B3D315   |
	JSL CODE_B8D5E0				;$B3D318   |
	LDX current_sprite			;$B3D31C   |
	LDA $1E,x				;$B3D31E   |
	AND #$0003				;$B3D320   |
	BNE CODE_B3D334				;$B3D323   |
	LDA #$0000				;$B3D325   |
	JSR CODE_B3D44A				;$B3D328   |
	BCS CODE_B3D334				;$B3D32B   |
	JSL CODE_B9D100				;$B3D32D   |
	JMP CODE_B38000				;$B3D331  /

CODE_B3D334:
	LDA #$0414				;$B3D334  \
	JSL queue_sound_effect			;$B3D337   |
	LDA #$0615				;$B3D33B   |
	JSL queue_sound_effect			;$B3D33E   |
	LDY #$00D4				;$B3D342   |
	JSL CODE_BB83EF				;$B3D345   |
	LDY #$00D2				;$B3D349   |
	JSL CODE_BB83EF				;$B3D34C   |
	JSL CODE_BB82B8				;$B3D350   |
CODE_B3D354:					;	   |
	JSR CODE_B3D3F9				;$B3D354   |
	BCS CODE_B3D30F				;$B3D357   |
	LDA $1E,x				;$B3D359   |
	AND #$0101				;$B3D35B   |
	BNE CODE_B3D367				;$B3D35E   |
	JSL CODE_B9D100				;$B3D360   |
	JMP CODE_B38000				;$B3D364  /

CODE_B3D367:
	LDA #$051A				;$B3D367  \
	JSL queue_sound_effect			;$B3D36A   |
	JSL CODE_B3975C				;$B3D36E   |
	JSL CODE_BB82B8				;$B3D372   |
	JML [$05A9]				;$B3D376  /

CODE_B3D379:
	JSR CODE_B39ECC				;$B3D379  \
	JSR CODE_B39EBE				;$B3D37C   |
	JSL CODE_B8D5E0				;$B3D37F   |
	LDX current_sprite			;$B3D383   |
	LDA #$FF7B				;$B3D385   |
	JSR CODE_B3D44A				;$B3D388   |
	BCS CODE_B3D39B				;$B3D38B   |
	LDA $1E,x				;$B3D38D   |
	AND #$0101				;$B3D38F   |
	BNE CODE_B3D3AF				;$B3D392   |
	JSL CODE_B9D100				;$B3D394   |
	JMP CODE_B38000				;$B3D398  /

CODE_B3D39B:
	LDA $20,x				;$B3D39B  \
	EOR #$FFFF				;$B3D39D   |
	INC A					;$B3D3A0   |
	STA $20,x				;$B3D3A1   |
	STZ $26,x				;$B3D3A3   |
	STZ $24,x				;$B3D3A5   |
	LDA #$1003				;$B3D3A7   |
	STA $2E,x				;$B3D3AA   |
	JML [$05A9]				;$B3D3AC  /

CODE_B3D3AF:
	LDA #$01C0				;$B3D3AF  \
	LDY #$0000				;$B3D3B2   |
	BRA CODE_B3D435				;$B3D3B5  /

CODE_B3D3B7:
	JSR CODE_B39ECC				;$B3D3B7  \
	JSR CODE_B39EBE				;$B3D3BA   |
	JSL CODE_B8D5E0				;$B3D3BD   |
	LDX current_sprite			;$B3D3C1   |
	LDA #$0000				;$B3D3C3   |
	JSR CODE_B3D44A				;$B3D3C6   |
	BCS CODE_B3D3D9				;$B3D3C9   |
	LDA $1E,x				;$B3D3CB   |
	AND #$0101				;$B3D3CD   |
	BNE CODE_B3D3F1				;$B3D3D0   |
	JSL CODE_B9D100				;$B3D3D2   |
	JMP CODE_B38000				;$B3D3D6  /

CODE_B3D3D9:
	LDA $20,x				;$B3D3D9  \
	CMP #$8000				;$B3D3DB   |
	ROR A					;$B3D3DE   |
	EOR #$FFFF				;$B3D3DF   |
	INC A					;$B3D3E2   |
	STA $20,x				;$B3D3E3   |
	STZ $26,x				;$B3D3E5   |
	STZ $24,x				;$B3D3E7   |
	LDA #$1004				;$B3D3E9   |
	STA $2E,x				;$B3D3EC   |
	JML [$05A9]				;$B3D3EE  /

CODE_B3D3F1:
	LDA #$01B0				;$B3D3F1  \
	LDY #$0003				;$B3D3F4   |
	BRA CODE_B3D435				;$B3D3F7  /

CODE_B3D3F9:
	JSR CODE_B39ECC				;$B3D3F9  \
	JSR CODE_B39EBE				;$B3D3FC   |
	LDX current_sprite			;$B3D3FF   |
	LDA $26,x				;$B3D401   |
	PHA					;$B3D403   |
	JSL CODE_B8D5E0				;$B3D404   |
	PLY					;$B3D408   |
	LDX current_sprite			;$B3D409   |
	LDA $1E,x				;$B3D40B   |
	AND #$0202				;$B3D40D   |
	BEQ CODE_B3D41C				;$B3D410   |
	CMP #$0202				;$B3D412   |
	BEQ CODE_B3D425				;$B3D415   |
	TYA					;$B3D417   |
	STA $26,x				;$B3D418   |
	STA $20,x				;$B3D41A   |
CODE_B3D41C:					;	   |
	LDA #$4008				;$B3D41C   |
	JSR CODE_B3D44A				;$B3D41F   |
	BCS CODE_B3D425				;$B3D422   |
	RTS					;$B3D424  /

CODE_B3D425:
	LDA #$051A				;$B3D425  \
	JSL queue_sound_effect			;$B3D428   |
	JSL CODE_B3975C				;$B3D42C   |
	JSL CODE_BB82B8				;$B3D430   |
	RTS					;$B3D434  /

CODE_B3D435:
	STA $00,x				;$B3D435  \
	STY $2E,x				;$B3D437   |
	STZ $26,x				;$B3D439   |
	LDA $20,x				;$B3D43B   |
	CMP #$8000				;$B3D43D   |
	ROR $20,x				;$B3D440   |
	LDA #$0001				;$B3D442   |
	STA $30,x				;$B3D445   |
	JML [$05A9]				;$B3D447  /

CODE_B3D44A:
	STA $0DC6				;$B3D44A  \
	LDA #$0118				;$B3D44D   |
	JSL CODE_BEBE14				;$B3D450   |
	BCS CODE_B3D468				;$B3D454   |
	LDA $2F,x				;$B3D456   |
	AND #$00FF				;$B3D458   |
	BNE CODE_B3D469				;$B3D45B   |
	JSL CODE_BCFB58				;$B3D45D   |
	LDA $0DC6				;$B3D461   |
	JSL CODE_BEBE8B				;$B3D464   |
CODE_B3D468:					;	   |
	RTS					;$B3D468  /

CODE_B3D469:
	DEC $2F,x				;$B3D469  \
	RTS					;$B3D46B  /

CODE_B3D46C:
	LDY $09FC				;$B3D46C  \
	STA $09FE,y				;$B3D46F   |
	LDA $03,s				;$B3D472   |
	STA $0A00,y				;$B3D474   |
	LDA current_sprite			;$B3D477   |
	STA $0A01,y				;$B3D479   |
	TYA					;$B3D47C   |
	CLC					;$B3D47D   |
	ADC #$0005				;$B3D47E   |
	STA $09FC				;$B3D481   |
	RTL					;$B3D484  /

CODE_B3D485:
	LDX current_sprite			;$B3D485  \
	LDA $06,x				;$B3D487   |
	STA $1C,x				;$B3D489   |
	LDA $0A,x				;$B3D48B   |
	STA $50,x				;$B3D48D   |
	LDA $22,x				;$B3D48F   |
	STA $06,x				;$B3D491   |
	LDA $28,x				;$B3D493   |
	STA $0A,x				;$B3D495   |
	JSL CODE_BEF039				;$B3D497   |
	LDX current_sprite			;$B3D49B   |
	LDA $22,x				;$B3D49D   |
	LDY $06,x				;$B3D49F   |
	STA $06,x				;$B3D4A1   |
	STY $22,x				;$B3D4A3   |
	LDA $28,x				;$B3D4A5   |
	LDY $0A,x				;$B3D4A7   |
	STA $0A,x				;$B3D4A9   |
	STY $28,x				;$B3D4AB   |
	RTL					;$B3D4AD  /

CODE_B3D4AE:
	LDX current_sprite			;$B3D4AE  \
	STZ $34,x				;$B3D4B0   |
	JSL CODE_BCFB58				;$B3D4B2   |
	LDA #$0002				;$B3D4B6   |
	JSL CODE_BCFF1D				;$B3D4B9   |
	BCC CODE_B3D4CC				;$B3D4BD   |
CODE_B3D4BF:					;	   |
	JSR CODE_B3D4EB				;$B3D4BF   |
	BEQ CODE_B3D4E0				;$B3D4C2   |
	BPL CODE_B3D4D2				;$B3D4C4   |
	JSL CODE_BCFF38				;$B3D4C6   |
	BCS CODE_B3D4BF				;$B3D4CA   |
CODE_B3D4CC:					;	   |
	RTL					;$B3D4CC  /

CODE_B3D4CD:
	JSR CODE_B3D4EB				;$B3D4CD  \
	BEQ CODE_B3D4E0				;$B3D4D0   |
CODE_B3D4D2:					;	   |
	JSL CODE_BCFF38				;$B3D4D2   |
	BCS CODE_B3D4CD				;$B3D4D6   |
	LDA #$0000				;$B3D4D8   |
	SEC					;$B3D4DB   |
	RTL					;$B3D4DC  /

CODE_B3D4DD:
	JSR CODE_B3D4EB				;$B3D4DD  \
CODE_B3D4E0:					;	   |
	JSL CODE_BCFF38				;$B3D4E0   |
	BCS CODE_B3D4DD				;$B3D4E4   |
	LDA #$0001				;$B3D4E6   |
	SEC					;$B3D4E9   |
	RTL					;$B3D4EA  /

CODE_B3D4EB:
	LDX current_sprite			;$B3D4EB  \
	LDY $6A					;$B3D4ED   |
	LDA $0024,y				;$B3D4EF   |
if !version == 0
	BMI CODE_B3D57A				;$B3D4F2   |
else
	BMI CODE_B3D511				;$B3D4F2   |
endif
	AND #$FF00				;$B3D4F4   |
	XBA					;$B3D4F7   |
	EOR #$FFFF				;$B3D4F8   |
	SEC					;$B3D4FB   |
	ADC $000A,y				;$B3D4FC   |
	EOR #$FFFF				;$B3D4FF   |
	SEC					;$B3D502   |
	ADC $DB					;$B3D503   |
	CLC					;$B3D505   |
	ADC $50,x				;$B3D506   |
	SEC					;$B3D508   |
	SBC $0A,x				;$B3D509   |
	CLC					;$B3D50B   |
	ADC #$0003				;$B3D50C   |
if !version == 0				;	   |
	BMI CODE_B3D57A				;$B3D50F   |
else						;	   |
	BPL CODE_B3D51E				;$B3D50F   |
CODE_B3D511:					;	   |
	CMP #$FD00				;$B3D511   |
	BCC CODE_B3D57A				;$B3D514   |
	LDA $001E,y				;$B3D516   |
	AND #$1000				;$B3D519   |
	BEQ CODE_B3D57A				;$B3D51C   |
endif						;	   |
CODE_B3D51E:					;	   |
	LDA $DB					;$B3D51E   |
	CLC					;$B3D520   |
	ADC $28,x				;$B3D521   |
	SEC					;$B3D523   |
	SBC $0A,x				;$B3D524   |
	STA $000C,y				;$B3D526   |
	LDA $22,x				;$B3D529   |
	SEC					;$B3D52B   |
	SBC $06,x				;$B3D52C   |
	STA $32					;$B3D52E   |
	STA $005C,y				;$B3D530   |
	CPY $0593				;$B3D533   |
	BNE CODE_B3D54A				;$B3D536   |
	LDA $D9					;$B3D538   |
	CLC					;$B3D53A   |
	ADC $32					;$B3D53B   |
	STA $0A26				;$B3D53D   |
	LDA $DD					;$B3D540   |
	CLC					;$B3D542   |
	ADC $32					;$B3D543   |
	STA $0A28				;$B3D545   |
	STY $34,x				;$B3D548   |
CODE_B3D54A:					;	   |
	LDA $24,x				;$B3D54A   |
	BPL CODE_B3D551				;$B3D54C   |
	LDA #$0000				;$B3D54E   |
CODE_B3D551:					;	   |
	CLC					;$B3D551   |
	ADC #$0300				;$B3D552   |
	STA $0024,y				;$B3D555   |
	CPY $0593				;$B3D558   |
if !version == 0				;	   |
	BEQ CODE_B3D56E				;$B3D55B   |
else						;	   |
	BEQ CODE_B3D568				;$B3D55B   |
endif						;	   |
	LDA $DB					;$B3D55D   |
	STA $000A,y				;$B3D55F   |
	LDA #$0000				;$B3D562   |
	STA $0008,y				;$B3D565   |
CODE_B3D568:					;	   |
if !version == 1				;	   |
	LDA #$0000				;$B3D568   |
endif						;	   |
	STA $000E,y				;$B3D56B   |
CODE_B3D56E:					;	   |
	LDA $001E,y				;$B3D56E   |
	ORA #$0010				;$B3D571   |
	STA $001E,y				;$B3D574   |
	AND #$1000				;$B3D577   |
CODE_B3D57A:					;	   |
	RTS					;$B3D57A  /

rideable_balloon_main:
	JSR CODE_B3A369				;$B3D57B  /

DATA_B3D57E:
	dw CODE_B3D582
	dw CODE_B3D596


CODE_B3D582:
	TYX					;$B3D582  \
	LDA $06,x				;$B3D583   |
	STA $22,x				;$B3D585   |
	LDA $0A,x				;$B3D587   |
	STA $28,x				;$B3D589   |
	STZ $30,x				;$B3D58B   |
	LDA $0959				;$B3D58D   |
	DEC A					;$B3D590   |
	DEC A					;$B3D591   |
	STA $0C,x				;$B3D592   |
	INC $2E,x				;$B3D594   |
CODE_B3D596:					;	   |
	JSL CODE_BBBB7B				;$B3D596   |
	BCC CODE_B3D59F				;$B3D59A   |
	JMP CODE_B38000				;$B3D59C  /

CODE_B3D59F:
	LDA #CODE_B3D5AD			;$B3D59F  \
	JSL CODE_B3D46C				;$B3D5A2   |
	JSL CODE_B9D100				;$B3D5A6   |
	JML [$05A9]				;$B3D5AA  /

CODE_B3D5AD:
	LDX current_sprite			;$B3D5AD  \
	LDA $54,x				;$B3D5AF   |
	STA $8E					;$B3D5B1   |
	JSR CODE_B3D5E0				;$B3D5B3   |
	JSL CODE_B3D485				;$B3D5B6   |
	JSL CODE_B3D4AE				;$B3D5BA   |
	LDX current_sprite			;$B3D5BE   |
	ROL A					;$B3D5C0   |
	STA $4E,x				;$B3D5C1   |
	LDA $34,x				;$B3D5C3   |
	CMP $0593				;$B3D5C5   |
	BEQ CODE_B3D5CF				;$B3D5C8   |
	CMP $0597				;$B3D5CA   |
	BNE CODE_B3D5DF				;$B3D5CD   |
CODE_B3D5CF:					;	   |
	LDA $22,x				;$B3D5CF   |
	SEC					;$B3D5D1   |
	SBC #$0008				;$B3D5D2   |
	STA $0A26				;$B3D5D5   |
	CLC					;$B3D5D8   |
	ADC #$0010				;$B3D5D9   |
	STA $0A28				;$B3D5DC   |
CODE_B3D5DF:					;	   |
	RTL					;$B3D5DF  /

CODE_B3D5E0:
	LDY current_sprite			;$B3D5E0  \
	LDA $004E,y				;$B3D5E2   |
	LSR A					;$B3D5E5   |
	BCC CODE_B3D622				;$B3D5E6   |
	LDA $8E					;$B3D5E8   |
	CLC					;$B3D5EA   |
	ADC #$0008				;$B3D5EB   |
	STA $8E					;$B3D5EE   |
	LDX $34,y				;$B3D5F0   |
	CPX $0593				;$B3D5F2   |
	BNE CODE_B3D622				;$B3D5F5   |
	LDY $0595				;$B3D5F7   |
	LDA $0004,y				;$B3D5FA   |
	LDY current_sprite			;$B3D5FD   |
	AND #$0300				;$B3D5FF   |
	BEQ CODE_B3D622				;$B3D602   |
	AND #$0100				;$B3D604   |
	CMP #$0001				;$B3D607   |
	LDY #$0008				;$B3D60A   |
	LDA [$8E],y				;$B3D60D   |
	LDY current_sprite			;$B3D60F   |
	BCS CODE_B3D617				;$B3D611   |
	EOR #$FFFF				;$B3D613   |
	INC A					;$B3D616   |
CODE_B3D617:					;	   |
	STA $0026,y				;$B3D617   |
	LDA #$0004				;$B3D61A   |
	STA $0052,y				;$B3D61D   |
	BRA CODE_B3D63F				;$B3D620  /

CODE_B3D622:
	LDA $0052,y				;$B3D622  \
	AND #$00FF				;$B3D625   |
	CMP #$0017				;$B3D628   |
	BEQ CODE_B3D63F				;$B3D62B   |
	LDA #$0017				;$B3D62D   |
	STA $0052,y				;$B3D630   |
	LDA #$0203				;$B3D633   |
	STA $0046,y				;$B3D636   |
	LDA #$0020				;$B3D639   |
	STA $0026,y				;$B3D63C   |
CODE_B3D63F:					;	   |
	LDX $0C,y				;$B3D63F   |
	LDA $0006,y				;$B3D641   |
	CMP.l DATA_B3D691,x			;$B3D644   |
	BCS CODE_B3D656				;$B3D648   |
CODE_B3D64A:					;	   |
	DEX					;$B3D64A   |
	DEX					;$B3D64B   |
	CMP.l DATA_B3D691,x			;$B3D64C   |
	BCC CODE_B3D64A				;$B3D650   |
	BRA CODE_B3D65C				;$B3D652  /

CODE_B3D654:
	INX					;$B3D654  \
	INX					;$B3D655   |
CODE_B3D656:					;	   |
	CMP.l DATA_B3D693,x			;$B3D656   |
	BCS CODE_B3D654				;$B3D65A   |
CODE_B3D65C:					;	   |
	STX $0C,y				;$B3D65C   |
	SEC					;$B3D65E   |
	SBC.l DATA_B3D691,x			;$B3D65F   |
	CMP #$000E				;$B3D663   |
	BCC CODE_B3D676				;$B3D666   |
	INX					;$B3D668   |
	INX					;$B3D669   |
	LDA $0006,y				;$B3D66A   |
	SBC.l DATA_B3D691,x			;$B3D66D   |
	CMP #$FFF2				;$B3D671   |
	BCC CODE_B3D690				;$B3D674   |
CODE_B3D676:					;	   |
	LDA.l DATA_B3D691,x			;$B3D676   |
	LSR A					;$B3D67A   |
	LDA #$0278				;$B3D67B   |
	BCC CODE_B3D683				;$B3D67E   |
	LDA #$0238				;$B3D680   |
CODE_B3D683:					;	   |
	CMP $000A,y				;$B3D683   |
	BCS CODE_B3D690				;$B3D686   |
	TYX					;$B3D688   |
	LDY #$0006				;$B3D689   |
	LDA [$8E],y				;$B3D68C   |
	STA $24,x				;$B3D68E   |
CODE_B3D690:					;	   |
	RTS					;$B3D690  /

DATA_B3D691:
	dw $0000

DATA_B3D693:
	dw $0321, $05A9, $0649, $0AE8
	dw $0BB9, $0C89, $0D29, $0DC1
	dw $0E41, $0FA1, $1001, $1061
	dw $10C1, $1769, $1839, $19A0
	dw $1A11, $1AA0, $1B70, $1C21
	dw $1CF1, $1D31, $1FA0, $2129
	dw $2390, $2469, $2591, $2631
	dw $2669, $26A1, $2701, $8000
	dw $0000, $0160, $0181, $0221
	dw $8000


krochead_main:
	JSR CODE_B3A369				;$B3D6DD  \
	dw CODE_B3D6E4
	dw CODE_B3D709

CODE_B3D6E4:
	TYX					;$B3D6E4  \
	LDA $06,x				;$B3D6E5   |
	STA $22,x				;$B3D6E7   |
	LDA $0A,x				;$B3D6E9   |
	STA $28,x				;$B3D6EB   |
	STZ $30,x				;$B3D6ED   |
	STZ $4E,x				;$B3D6EF   |
	INC $2E,x				;$B3D6F1   |
	LDA $2F,x				;$B3D6F3   |
	AND #$00FF				;$B3D6F5   |
	ASL A					;$B3D6F8   |
	BEQ CODE_B3D709				;$B3D6F9   |
	JSR CODE_B3D741				;$B3D6FB   |
	BEQ krochead_main			;$B3D6FE   |
	LDA #$02C9				;$B3D700   |
	JSL CODE_B9D0C6				;$B3D703   |
	BRA krochead_main			;$B3D707  /

CODE_B3D709:
	TAX					;$B3D709  \
	JMP (DATA_B3D70D,x)			;$B3D70A  /

DATA_B3D70D:
	dw CODE_B3D714
	dw CODE_B3D711


CODE_B3D711:
	JSR CODE_B3D741				;$B3D711  \
CODE_B3D714:					;	   |
	JSL CODE_BBBB7B				;$B3D714   |
	BCC CODE_B3D71D				;$B3D718   |
	JMP CODE_B38000				;$B3D71A  /

CODE_B3D71D:
	JSL CODE_B9D100				;$B3D71D  \
	LDA #CODE_B3D72B			;$B3D721   |
	JSL CODE_B3D46C				;$B3D724   |
	JML [$05A9]				;$B3D728  /

CODE_B3D72B:
	LDX current_sprite			;$B3D72B  \
	LDA $54,x				;$B3D72D   |
	STA $8E					;$B3D72F   |
	STZ $52,x				;$B3D731   |
	JSL CODE_B3D485				;$B3D733   |
	JSL CODE_B3D4AE				;$B3D737   |
	LDX current_sprite			;$B3D73B   |
	ROL A					;$B3D73D   |
	STA $4E,x				;$B3D73E   |
	RTL					;$B3D740  /

CODE_B3D741:
	LDX $0D58				;$B3D741  \
	BEQ CODE_B3D75B				;$B3D744   |
	LDA $00,x				;$B3D746   |
	CMP #$0180				;$B3D748   |
	BNE CODE_B3D75B				;$B3D74B   |
	LDA $44,x				;$B3D74D   |
	SEC					;$B3D74F   |
	SBC $004A,y				;$B3D750   |
	BPL CODE_B3D758				;$B3D753   |
	LDA #$0000				;$B3D755   |
CODE_B3D758:					;	   |
	STA $0042,y				;$B3D758   |
CODE_B3D75B:					;	   |
	TYX					;$B3D75B   |
	LDA $42,x				;$B3D75C   |
	BEQ CODE_B3D762				;$B3D75E   |
	DEC $42,x				;$B3D760   |
CODE_B3D762:					;	   |
	RTS					;$B3D762  /

krochead_switch_barrel_main:
	LDY current_sprite			;$B3D763  \
	LDA $002E,y				;$B3D765   |
	ASL A					;$B3D768   |
	TAX					;$B3D769   |
	JMP (DATA_B3D76D,x)			;$B3D76A  /

DATA_B3D76D:
	dw CODE_B3D777
	dw CODE_B3D783
	dw CODE_B3D7A6
	dw CODE_B3D7F5
	dw CODE_B3D7F1


CODE_B3D777:
	JSL CODE_B9D100				;$B3D777  \
	LDX current_sprite			;$B3D77B   |
	DEC $46,x				;$B3D77D   |
	BNE CODE_B3D7A6				;$B3D77F   |
	INC $2E,x				;$B3D781   |
CODE_B3D783:					;	   |
	JSL CODE_B9D100				;$B3D783   |
	JSL CODE_BCFB58				;$B3D787   |
	JSL CODE_BEBE6D				;$B3D78B   |
	BCC CODE_B3D7A6				;$B3D78F   |
	LDA $42,x				;$B3D791   |
	STA $44,x				;$B3D793   |
	LDA #$001E				;$B3D795   |
	STA $46,x				;$B3D798   |
	STX $0D58				;$B3D79A   |
	DEC $2E,x				;$B3D79D   |
	LDA #$0616				;$B3D79F   |
	JSL queue_sound_effect			;$B3D7A2   |
CODE_B3D7A6:					;	   |
	LDX current_sprite			;$B3D7A6   |
	LDA $44,x				;$B3D7A8   |
	BEQ CODE_B3D7B3				;$B3D7AA   |
	DEC $44,x				;$B3D7AC   |
	BNE CODE_B3D7B3				;$B3D7AE   |
	STZ $0D58				;$B3D7B0   |
CODE_B3D7B3:					;	   |
	JSL CODE_BBBB69				;$B3D7B3   |
	LDX current_sprite			;$B3D7B7   |
	BCS CODE_B3D7D1				;$B3D7B9   |
	LDA $2E,x				;$B3D7BB   |
	CMP #$0002				;$B3D7BD   |
	BNE CODE_B3D7F5				;$B3D7C0   |
	DEC $2E,x				;$B3D7C2   |
	LDA $36,x				;$B3D7C4   |
	JSL CODE_B9D0C6				;$B3D7C6   |
	JSL CODE_B9D100				;$B3D7CA   |
	JML [$05A9]				;$B3D7CE  /

CODE_B3D7D1:
	LDY $48,x				;$B3D7D1  \
	BEQ CODE_B3D7DD				;$B3D7D3   |
	STZ $48,x				;$B3D7D5   |
	LDA #$0004				;$B3D7D7   |
	STA $002E,y				;$B3D7DA   |
CODE_B3D7DD:					;	   |
	CPX $0D58				;$B3D7DD   |
	BNE CODE_B3D7EE				;$B3D7E0   |
	LDA #$0002				;$B3D7E2   |
	CMP $2E,x				;$B3D7E5   |
	BEQ CODE_B3D7F5				;$B3D7E7   |
	STA $2E,x				;$B3D7E9   |
	JML [$05A9]				;$B3D7EB  /

CODE_B3D7EE:
	JMP CODE_B38000				;$B3D7EE  /

CODE_B3D7F1:
	JSL CODE_BB82B8				;$B3D7F1  \
CODE_B3D7F5:					;	   |
	JML [$05A9]				;$B3D7F5  /

plus_and_minus_barrel_main:
	JSR CODE_B3A369				;$B3D7F8  /

DATA_B3D7FB:
	dw CODE_B3D801
	dw CODE_B3D881
	dw CODE_B3D8B3


CODE_B3D801:
	JSL CODE_BCFB58				;$B3D801  \
	LDA #$1000				;$B3D805   |
	LDY #$0010				;$B3D808   |
	JSL CODE_BEBD8E				;$B3D80B   |
	BCS CODE_B3D845				;$B3D80F   |
	LDX current_sprite			;$B3D811   |
	LDA $42,x				;$B3D813   |
	ORA $2E,x				;$B3D815   |
	BMI CODE_B3D83E				;$B3D817   |
	LDY $0D5A				;$B3D819   |
	LDA $0002,y				;$B3D81C   |
	TAY					;$B3D81F   |
	LDA $0006,y				;$B3D820   |
	SEC					;$B3D823   |
	SBC #$0020				;$B3D824   |
	CMP $06,x				;$B3D827   |
	BCC CODE_B3D83E				;$B3D829   |
	LDA $2E,x				;$B3D82B   |
	ORA #$8000				;$B3D82D   |
	STA $2E,x				;$B3D830   |
	LDY $0D5A				;$B3D832   |
	LDA $42,x				;$B3D835   |
	CLC					;$B3D837   |
	ADC $0036,y				;$B3D838   |
	STA $0036,y				;$B3D83B   |
CODE_B3D83E:					;	   |
	JSL CODE_B9D100				;$B3D83E   |
	JMP CODE_B38000				;$B3D842  /

CODE_B3D845:
	LDX current_sprite			;$B3D845  \
	LDY $0D5A				;$B3D847   |
	LDA $001C,y				;$B3D84A   |
	BEQ CODE_B3D862				;$B3D84D   |
	TAY					;$B3D84F   |
	LDA $42,x				;$B3D850   |
	CLC					;$B3D852   |
	BMI CODE_B3D865				;$B3D853   |
	ADC $0042,y				;$B3D855   |
	STA $0042,y				;$B3D858   |
	LDA #$0461				;$B3D85B   |
	JSL queue_sound_effect			;$B3D85E   |
CODE_B3D862:					;	   |
	JMP CODE_B3D8FD				;$B3D862  /

CODE_B3D865:
	ADC $0044,y				;$B3D865  \
	STA $0044,y				;$B3D868   |
	LDY $0D5A				;$B3D86B   |
	LDA $0036,y				;$B3D86E   |
	SEC					;$B3D871   |
	SBC $42,x				;$B3D872   |
	STA $0036,y				;$B3D874   |
	LDA #$0462				;$B3D877   |
	JSL queue_sound_effect			;$B3D87A   |
	JMP CODE_B3D8FD				;$B3D87E  /

CODE_B3D881:
	JSL CODE_BCFB58				;$B3D881  \
	JSL CODE_BEBE6D				;$B3D885   |
	BCS CODE_B3D892				;$B3D889   |
	JSL CODE_B9D100				;$B3D88B   |
	JMP CODE_B38000				;$B3D88F  /

CODE_B3D892:
	LDX current_sprite			;$B3D892  \
	LDY $0D5E				;$B3D894   |
	LDA $42,x				;$B3D897   |
	CLC					;$B3D899   |
	ADC $002A,y				;$B3D89A   |
	STA $002A,y				;$B3D89D   |
	LDA $0026,y				;$B3D8A0   |
	CLC					;$B3D8A3   |
	ADC $42,x				;$B3D8A4   |
	STA $0026,y				;$B3D8A6   |
	LDA #$0462				;$B3D8A9   |
	JSL queue_sound_effect			;$B3D8AC   |
	JMP CODE_B3D8FD				;$B3D8B0  /

CODE_B3D8B3:
	JSL CODE_BCFB58				;$B3D8B3  \
	JSL CODE_BEBE6D				;$B3D8B7   |
	BCS CODE_B3D8C4				;$B3D8BB   |
	JSL CODE_B9D100				;$B3D8BD   |
	JMP CODE_B38000				;$B3D8C1  /

CODE_B3D8C4:
	LDX current_sprite			;$B3D8C4  \
	LDY $0D5E				;$B3D8C6   |
	LDA $4E,x				;$B3D8C9   |
	BEQ CODE_B3D8D7				;$B3D8CB   |
	LDA #$0000				;$B3D8CD   |
	SEC					;$B3D8D0   |
	SBC $0AEC				;$B3D8D1   |
	STA $0AEC				;$B3D8D4   |
CODE_B3D8D7:					;	   |
	LDA $42,x				;$B3D8D7   |
	STA $0022,y				;$B3D8D9   |
	STA $002A,y				;$B3D8DC   |
	LDA $44,x				;$B3D8DF   |
	STA $0028,y				;$B3D8E1   |
	BEQ CODE_B3D8E9				;$B3D8E4   |
	STA $002A,y				;$B3D8E6   |
CODE_B3D8E9:					;	   |
	LDA $0A,x				;$B3D8E9   |
	STA $001C,y				;$B3D8EB   |
	LDA #$0000				;$B3D8EE   |
	STA $0026,y				;$B3D8F1   |
	STA $0020,y				;$B3D8F4   |
	STA $002C,y				;$B3D8F7   |
	JMP CODE_B3D8FD				;$B3D8FA  /

CODE_B3D8FD:
	JSL CODE_BB82B8				;$B3D8FD  \
	JSR CODE_B3D907				;$B3D901   |
	JML [$05A9]				;$B3D904  /

CODE_B3D907:
	LDY #$0068				;$B3D907  \
	JSL CODE_BB8412				;$B3D90A   |
	LDY #$006A				;$B3D90E   |
	JSL CODE_BB8412				;$B3D911   |
	RTS					;$B3D915  /

CODE_B3D916:
	JSL CODE_BBBB99				;$B3D916  \
	JML [$05A9]				;$B3D91A  /

CODE_B3D91D:
	TAX					;$B3D91D  \
	PHK					;$B3D91E   |
	PLB					;$B3D91F   |
	JMP (DATA_B3D923,x)			;$B3D920  /

DATA_B3D923:
	dw CODE_B3D939
	dw CODE_B3D9CD
	dw CODE_B3DAD6
	dw CODE_B3DC21
	dw CODE_B3DF48
	dw CODE_B3DF48
	dw CODE_B3E3AF
	dw CODE_B3E4D9
	dw CODE_B3E65C
	dw CODE_B3E682
	dw CODE_B3E768


CODE_B3D939:
	LDY current_sprite			;$B3D939  \
	LDA $002E,y				;$B3D93B   |
	ASL					;$B3D93E   |
	TAX					;$B3D93F   |
	JMP (DATA_B3D943,x)			;$B3D940  /

DATA_B3D943:
	dw CODE_B3D947
	dw CODE_B3D973


CODE_B3D947:
	LDA $000A,y				;$B3D947  \
	SEC					;$B3D94A   |
	SBC #$0010				;$B3D94B   |
	CMP $0D4E				;$B3D94E   |
	BCC CODE_B3D973				;$B3D951   |
	LDA #$00C0				;$B3D953   |
	STA $003A,y				;$B3D956   |
	LDA $0036,y				;$B3D959   |
	CMP #$01B8				;$B3D95C   |
	BEQ CODE_B3D996				;$B3D95F   |
	JSL CODE_BCFB58				;$B3D961   |
	JSL CODE_BEBE6D				;$B3D965   |
	BCC CODE_B3D996				;$B3D969   |
	LDA #$FE00				;$B3D96B   |
	STA $0024,y				;$B3D96E   |
	BRA CODE_B3D9C3				;$B3D971  /

CODE_B3D973:
	LDA #$0100				;$B3D973  \
	STA $003A,y				;$B3D976   |
	LDA $0036,y				;$B3D979   |
	CMP #$01B8				;$B3D97C   |
	BEQ CODE_B3D996				;$B3D97F   |
	JSL CODE_BCFB58				;$B3D981   |
	LDX current_sprite			;$B3D985   |
	LDA $12,x				;$B3D987   |
	STA $46,x				;$B3D989   |
	LDA #$0CDC				;$B3D98B   |
	JSL CODE_BEBE8B				;$B3D98E   |
	STA $32					;$B3D992   |
	BCS CODE_B3D99D				;$B3D994   |
CODE_B3D996:					;	   |
	JSL CODE_B9D100				;$B3D996   |
	JMP CODE_B3D916				;$B3D99A  /

CODE_B3D99D:
	LDX current_sprite			;$B3D99D  \
	LDA $46,x				;$B3D99F   |
	STA $12,x				;$B3D9A1   |
	LDA #$001E				;$B3D9A3   |
	CMP $0A82				;$B3D9A6   |
	BEQ CODE_B3D9B3				;$B3D9A9   |
	BRA CODE_B3D9C3				;$B3D9AB  /

	JSL CODE_B8D8BA				;$B3D9AD   |
	BCS CODE_B3D9C3				;$B3D9B1   |
CODE_B3D9B3:					;	   |
	LDX current_sprite			;$B3D9B3   |
	LDA #$0300				;$B3D9B5   |
	BIT $42,x				;$B3D9B8   |
	BVC CODE_B3D9C0				;$B3D9BA   |
	EOR #$FFFF				;$B3D9BC   |
	INC A					;$B3D9BF   |
CODE_B3D9C0:					;	   |
	STA $0A86				;$B3D9C0   |
CODE_B3D9C3:					;	   |
	LDA #$01B8				;$B3D9C3   |
	JSL CODE_B9D0C6				;$B3D9C6   |
	JML [$05A9]				;$B3D9CA  /

CODE_B3D9CD:
	LDX current_sprite			;$B3D9CD  \
	LDA $2E,x				;$B3D9CF   |
	ASL A					;$B3D9D1   |
	TAX					;$B3D9D2   |
	JMP (DATA_B3D9D6,x)			;$B3D9D3  /

DATA_B3D9D6:
	dw CODE_B3D9DA
	dw CODE_B3D9EE


CODE_B3D9DA:
	LDX current_sprite			;$B3D9DA  \
	STX $19C4				;$B3D9DC   |
	STZ $42,x				;$B3D9DF   |
	INC $2E,x				;$B3D9E1   |
	STZ $20,x				;$B3D9E3   |
	JSR CODE_B3DA88				;$B3D9E5   |
	JSR CODE_B3DAC1				;$B3D9E8   |
	JML [$05A9]				;$B3D9EB  /

CODE_B3D9EE:
	LDX current_sprite			;$B3D9EE  \
	LDA $4A,x				;$B3D9F0   |
	AND #$FFFE				;$B3D9F2   |
	STA $4A,x				;$B3D9F5   |
	JSR CODE_B3DA88				;$B3D9F7   |
	BEQ CODE_B3D9FF				;$B3D9FA   |
	JSR CODE_B3DAC1				;$B3D9FC   |
CODE_B3D9FF:					;	   |
	LDA $44,x				;$B3D9FF   |
	BPL CODE_B3DA1C				;$B3DA01   |
	AND #$0FFF				;$B3DA03   |
	LDY $0593				;$B3DA06   |
	SEC					;$B3DA09   |
	SBC $0006,y				;$B3DA0A   |
	STA $32					;$B3DA0D   |
	LDA $44,x				;$B3DA0F   |
	ASL A					;$B3DA11   |
	EOR $32					;$B3DA12   |
	BPL CODE_B3DA4E				;$B3DA14   |
	LDA $4C,x				;$B3DA16   |
	STA $46,x				;$B3DA18   |
	STA $4A,x				;$B3DA1A   |
CODE_B3DA1C:					;	   |
	LDA $46,x				;$B3DA1C   |
	BEQ CODE_B3DA50				;$B3DA1E   |
	LDA #$0008				;$B3DA20   |
	STA $48,x				;$B3DA23   |
CODE_B3DA25:					;	   |
	SEP #$20				;$B3DA25   |
	INC $19AC				;$B3DA27   |
	REP #$20				;$B3DA2A   |
	LDX $0593				;$B3DA2C   |
	LDA $2E,x				;$B3DA2F   |
	ASL A					;$B3DA31   |
	ASL A					;$B3DA32   |
	TAX					;$B3DA33   |
	LDA.l DATA_B896B7,x			;$B3DA34   |
	AND #$0004				;$B3DA38   |
	BNE CODE_B3DA46				;$B3DA3B   |
	LDA #$000C				;$B3DA3D   |
	JSL CODE_B8D8BA				;$B3DA40   |
	BRA CODE_B3DA4C				;$B3DA44  /

CODE_B3DA46:
	LDA #$1000				;$B3DA46  \
	STA $0AF2				;$B3DA49   |
CODE_B3DA4C:					;	   |
	BRA CODE_B3DA66				;$B3DA4C  /

CODE_B3DA4E:
	STZ $46,x				;$B3DA4E  \
CODE_B3DA50:					;	   |
	LDY $0593				;$B3DA50   |
	LDA $001E,y				;$B3DA53   |
	AND #$1001				;$B3DA56   |
	BEQ CODE_B3DA5E				;$B3DA59   |
	STZ $0AF2				;$B3DA5B   |
CODE_B3DA5E:					;	   |
	DEC $48,x				;$B3DA5E   |
	BPL CODE_B3DA25				;$B3DA60   |
	INC $48,x				;$B3DA62   |
	STZ $4A,x				;$B3DA64   |
CODE_B3DA66:					;	   |
	JSR CODE_B3DA6C				;$B3DA66   |
	JML [$05A9]				;$B3DA69  /

CODE_B3DA6C:
	LDX current_sprite			;$B3DA6C  \
	LDY #$FF80				;$B3DA6E   |
	LDA $46,x				;$B3DA71   |
	BEQ CODE_B3DA78				;$B3DA73   |
	LDY #$0500				;$B3DA75   |
CODE_B3DA78:					;	   |
	STY $26,x				;$B3DA78   |
	LDA #$0030				;$B3DA7A   |
	JSR CODE_B3DBFA				;$B3DA7D   |
	LDX current_sprite			;$B3DA80   |
	LDA $20,x				;$B3DA82   |
	STA $19BE				;$B3DA84   |
	RTS					;$B3DA87  /

CODE_B3DA88:
	LDX $0593				;$B3DA88  \
	LDA $0A,x				;$B3DA8B   |
	STA $32					;$B3DA8D   |
	LDX current_sprite			;$B3DA8F   |
	LDA $54,x				;$B3DA91   |
	STA $8E					;$B3DA93   |
	LDY $42,x				;$B3DA95   |
	LDA [$8E],y				;$B3DA97   |
	CMP $32					;$B3DA99   |
	BPL CODE_B3DAAB				;$B3DA9B   |
CODE_B3DA9D:					;	   |
	INY					;$B3DA9D   |
	INY					;$B3DA9E   |
	INY					;$B3DA9F   |
	INY					;$B3DAA0   |
	INY					;$B3DAA1   |
	INY					;$B3DAA2   |
	LDA [$8E],y				;$B3DAA3   |
	CMP $32					;$B3DAA5   |
	BMI CODE_B3DA9D				;$B3DAA7   |
	BRA CODE_B3DABD				;$B3DAA9  /

CODE_B3DAAB:
	DEY					;$B3DAAB  \
	DEY					;$B3DAAC   |
	DEY					;$B3DAAD   |
	DEY					;$B3DAAE   |
	DEY					;$B3DAAF   |
	DEY					;$B3DAB0   |
	LDA [$8E],y				;$B3DAB1   |
	CMP $32					;$B3DAB3   |
	BPL CODE_B3DAAB				;$B3DAB5   |
	INY					;$B3DAB7   |
	INY					;$B3DAB8   |
	INY					;$B3DAB9   |
	INY					;$B3DABA   |
	INY					;$B3DABB   |
	INY					;$B3DABC   |
CODE_B3DABD:					;	   |
	TYA					;$B3DABD   |
	CMP $42,x				;$B3DABE   |
	RTS					;$B3DAC0  /

CODE_B3DAC1:
	STA $42,x				;$B3DAC1  \
	INY					;$B3DAC3   |
	INY					;$B3DAC4   |
	LDA [$8E],y				;$B3DAC5   |
	STA $44,x				;$B3DAC7   |
	INY					;$B3DAC9   |
	INY					;$B3DACA   |
	LDA [$8E],y				;$B3DACB   |
	STA $46,x				;$B3DACD   |
	STA $4C,x				;$B3DACF   |
	BEQ CODE_B3DAD5				;$B3DAD1   |
	STA $4A,x				;$B3DAD3   |
CODE_B3DAD5:					;	   |
	RTS					;$B3DAD5  /

CODE_B3DAD6:
	LDX current_sprite			;$B3DAD6  \
	LDA $2E,x				;$B3DAD8   |
	ASL A					;$B3DADA   |
	TAX					;$B3DADB   |
	JMP (DATA_B3DADF,x)			;$B3DADC  /

DATA_B3DADF:
	dw CODE_B3DAE3
	dw CODE_B3DAF7



CODE_B3DAE3:
	LDX current_sprite			;$B3DAE3  \
	STZ $42,x				;$B3DAE5   |
	INC $2E,x				;$B3DAE7   |
	STZ $20,x				;$B3DAE9   |
	JSR CODE_B3DB15				;$B3DAEB   |
	JSR CODE_B3DB48				;$B3DAEE   |
	JSR CODE_B3DB57				;$B3DAF1   |
	JML [$05A9]				;$B3DAF4  /

CODE_B3DAF7:
	JSR CODE_B3DB15				;$B3DAF7  \
	BEQ CODE_B3DAFF				;$B3DAFA   |
	JSR CODE_B3DB48				;$B3DAFC   |
CODE_B3DAFF:					;	   |
	JSR CODE_B3DB57				;$B3DAFF   |
	JSR CODE_B3DBA9				;$B3DB02   |
	LDA #$0080				;$B3DB05   |
	JSR CODE_B3DBFA				;$B3DB08   |
	LDX current_sprite			;$B3DB0B   |
	LDA $20,x				;$B3DB0D   |
	STA $19BE				;$B3DB0F   |
	JML [$05A9]				;$B3DB12  /

CODE_B3DB15:
	LDX $0593				;$B3DB15  \
	LDA $06,x				;$B3DB18   |
	STA $32					;$B3DB1A   |
	LDX current_sprite			;$B3DB1C   |
	LDA $54,x				;$B3DB1E   |
	STA $8E					;$B3DB20   |
	LDY $42,x				;$B3DB22   |
	LDA [$8E],y				;$B3DB24   |
	CMP $32					;$B3DB26   |
	BPL CODE_B3DB3A				;$B3DB28   |
CODE_B3DB2A:					;	   |
	INY					;$B3DB2A   |
	INY					;$B3DB2B   |
	INY					;$B3DB2C   |
	INY					;$B3DB2D   |
	LDA [$8E],y				;$B3DB2E   |
	CMP $32					;$B3DB30   |
	BMI CODE_B3DB2A				;$B3DB32   |
	DEY					;$B3DB34   |
	DEY					;$B3DB35   |
	DEY					;$B3DB36   |
	DEY					;$B3DB37   |
	BRA CODE_B3DB44				;$B3DB38  /

CODE_B3DB3A:
	DEY					;$B3DB3A  \
	DEY					;$B3DB3B   |
	DEY					;$B3DB3C   |
	DEY					;$B3DB3D   |
	LDA [$8E],y				;$B3DB3E   |
	CMP $32					;$B3DB40   |
	BPL CODE_B3DB3A				;$B3DB42   |
CODE_B3DB44:					;	   |
	TYA					;$B3DB44   |
	CMP $42,x				;$B3DB45   |
	RTS					;$B3DB47  /

CODE_B3DB48:
	STA $42,x				;$B3DB48  \
	INY					;$B3DB4A   |
	INY					;$B3DB4B   |
	LDA [$8E],y				;$B3DB4C   |
	STA $8E					;$B3DB4E   |
	STA $44,x				;$B3DB50   |
	STZ $46,x				;$B3DB52   |
	STZ $48,x				;$B3DB54   |
	RTS					;$B3DB56  /

CODE_B3DB57:
	LDX current_sprite			;$B3DB57  \
	DEC $48,x				;$B3DB59   |
	BPL CODE_B3DB7B				;$B3DB5B   |
	LDA $44,x				;$B3DB5D   |
	STA $8E					;$B3DB5F   |
	LDY $46,x				;$B3DB61   |
	LDA [$8E],y				;$B3DB63   |
	STA $4A,x				;$B3DB65   |
	INY					;$B3DB67   |
	INY					;$B3DB68   |
	LDA [$8E],y				;$B3DB69   |
	STA $48,x				;$B3DB6B   |
	INY					;$B3DB6D   |
	INY					;$B3DB6E   |
	LDA [$8E],y				;$B3DB6F   |
	CMP #$0002				;$B3DB71   |
	BNE CODE_B3DB79				;$B3DB74   |
	LDY #$0000				;$B3DB76   |
CODE_B3DB79:					;	   |
	STY $46,x				;$B3DB79   |
CODE_B3DB7B:					;	   |
	RTS					;$B3DB7B  /

DATA_B3DB7C:
	dw CODE_B3DB9C
	dw CODE_B3DB9C
	dw CODE_B3DB9D
	dw CODE_B3DBA1
	dw CODE_B3DB9C
	dw CODE_B3DB9C
	dw CODE_B3DB9D
	dw CODE_B3DBA1
	dw CODE_B3DB9D
	dw CODE_B3DB9D
	dw CODE_B3DB9C
	dw CODE_B3DBA5
	dw CODE_B3DBA1
	dw CODE_B3DBA1
	dw CODE_B3DBA5
	dw CODE_B3DB9C

CODE_B3DB9C:
	RTS					;$B3DB9C  /

CODE_B3DB9D:
	SBC #$0012				;$B3DB9D  \
	RTS					;$B3DBA0  /

CODE_B3DBA1:
	SBC #$0012				;$B3DBA1  \
	RTS					;$B3DBA4  /

CODE_B3DBA5:
	SBC #$0024				;$B3DBA5  \
	RTS					;$B3DBA8  /

CODE_B3DBA9:
	LDX current_sprite			;$B3DBA9  \
	LDA $4A,x				;$B3DBAB   |
	LSR A					;$B3DBAD   |
	BCC CODE_B3DBDB				;$B3DBAE   |
	AND #$2000				;$B3DBB0   |
	BEQ CODE_B3DBC8				;$B3DBB3   |
	LDA #$0900				;$B3DBB5   |
	STA $26,x				;$B3DBB8   |
	LDA #$FFFF				;$B3DBBA   |
	STA $19C0				;$B3DBBD   |
	SEP #$20				;$B3DBC0   |
	INC $19AC				;$B3DBC2   |
	REP #$20				;$B3DBC5   |
	RTS					;$B3DBC7  /

CODE_B3DBC8:
	LDA #$F700				;$B3DBC8  \
	STA $26,x				;$B3DBCB   |
	LDA #$0001				;$B3DBCD   |
	STA $19C0				;$B3DBD0   |
	SEP #$20				;$B3DBD3   |
	INC $19AC				;$B3DBD5   |
	REP #$20				;$B3DBD8   |
	RTS					;$B3DBDA  /

CODE_B3DBDB:
	AND #$2000				;$B3DBDB  \
	BEQ CODE_B3DBED				;$B3DBDE   |
	LDA #$0000				;$B3DBE0   |
	STA $26,x				;$B3DBE3   |
	CMP $20,x				;$B3DBE5   |
	BNE CODE_B3DBEC				;$B3DBE7   |
	STZ $19C0				;$B3DBE9   |
CODE_B3DBEC:					;	   |
	RTS					;$B3DBEC  /

CODE_B3DBED:
	LDA #$0000				;$B3DBED  \
	STA $26,x				;$B3DBF0   |
	CMP $20,x				;$B3DBF2   |
	BNE CODE_B3DBEC				;$B3DBF4   |
	STZ $19C0				;$B3DBF6   |
	RTS					;$B3DBF9  /

CODE_B3DBFA:
	LDX current_sprite			;$B3DBFA  \
	STA $32					;$B3DBFC   |
	LDA $26,x				;$B3DBFE   |
	SEC					;$B3DC00   |
	SBC $20,x				;$B3DC01   |
	BPL CODE_B3DC15				;$B3DC03   |
	EOR #$FFFF				;$B3DC05   |
	INC A					;$B3DC08   |
	CMP $32					;$B3DC09   |
	BMI CODE_B3DC0F				;$B3DC0B   |
	LDA $32					;$B3DC0D   |
CODE_B3DC0F:					;	   |
	EOR #$FFFF				;$B3DC0F   |
	INC A					;$B3DC12   |
	BRA CODE_B3DC1B				;$B3DC13  /

CODE_B3DC15:
	CMP $32					;$B3DC15  \
	BMI CODE_B3DC1B				;$B3DC17   |
	LDA $32					;$B3DC19   |
CODE_B3DC1B:					;	   |
	CLC					;$B3DC1B   |
	ADC $20,x				;$B3DC1C   |
	STA $20,x				;$B3DC1E   |
	RTS					;$B3DC20  /

CODE_B3DC21:
	LDY current_sprite			;$B3DC21  \
	LDA $002E,y				;$B3DC23   |
	ASL A					;$B3DC26   |
	TAX					;$B3DC27   |
	JMP (DATA_B3DC2B,x)			;$B3DC28  /

DATA_B3DC2B:
	dw CODE_B3DC43
	dw CODE_B3DC77
	dw CODE_B3DCB4
	dw CODE_B3DCB7
	dw CODE_B3DCBA
	dw CODE_B3DCBD
	dw CODE_B3DCC0
	dw CODE_B3DCF0
	dw CODE_B3DD00
	dw CODE_B3DD38
	dw CODE_B3DD48
	dw CODE_B3DD6A

CODE_B3DC43:
	LDY #$00CC				;$B3DC43  \
	JSL CODE_BB842C				;$B3DC46   |
	BCS CODE_B3DC74				;$B3DC4A   |
	LDX current_sprite			;$B3DC4C   |
	LDY alternate_sprite			;$B3DC4E   |
	TYA					;$B3DC50   |
	STA $4A,x				;$B3DC51   |
	LDA #$C000				;$B3DC53   |
	STA $001C,y				;$B3DC56   |
	LDA $06,x				;$B3DC59   |
	CLC					;$B3DC5B   |
	ADC #$0100				;$B3DC5C   |
	STA $0006,y				;$B3DC5F   |
	LDA $0A,x				;$B3DC62   |
	STA $000A,y				;$B3DC64   |
	INC $2E,x				;$B3DC67   |
	STX $097F				;$B3DC69   |
	LDA #$C000				;$B3DC6C   |
	STA $1C,x				;$B3DC6F   |
	JSR CODE_B3DDA8				;$B3DC71   |
CODE_B3DC74:					;	   |
	JML [$05A9]				;$B3DC74  /

CODE_B3DC77:
	LDX current_sprite			;$B3DC77  \
	LDA $42,x				;$B3DC79   |
	AND #$0003				;$B3DC7B   |
	CMP #$0002				;$B3DC7E   |
	BNE CODE_B3DC89				;$B3DC81   |
	LDA #$0077				;$B3DC83   |
	STA $096F				;$B3DC86   |
CODE_B3DC89:					;	   |
	JSR CODE_B3DD6D				;$B3DC89   |
	JSR CODE_B3DDA8				;$B3DC8C   |
	JSR CODE_B3DEF4				;$B3DC8F   |
	BCS CODE_B3DCA0				;$B3DC92   |
	JSR CODE_B3DF00				;$B3DC94   |
	LDX current_sprite			;$B3DC97   |
	LDA $46,x				;$B3DC99   |
	BMI CODE_B3DCA0				;$B3DC9B   |
	JML [$05A9]				;$B3DC9D  /

CODE_B3DCA0:
	LDA #$001F				;$B3DCA0  \
	LDY #$0004				;$B3DCA3   |
	JSL CODE_B8D1E4				;$B3DCA6   |
	LDX current_sprite			;$B3DCAA   |
	LDA #$0008				;$B3DCAC   |
	STA $2E,x				;$B3DCAF   |
	JML [$05A9]				;$B3DCB1  /

CODE_B3DCB4:
	JML [$05A9]				;$B3DCB4  /

CODE_B3DCB7:
	JML [$05A9]				;$B3DCB7  /

CODE_B3DCBA:
	JML [$05A9]				;$B3DCBA  /

CODE_B3DCBD:
	JML [$05A9]				;$B3DCBD  /

CODE_B3DCC0:
	LDA #$0002				;$B3DCC0  \
	TRB $08C4				;$B3DCC3   |
	LDX current_sprite			;$B3DCC6   |
	LDA #$0030				;$B3DCC8   |
	STA $4C,x				;$B3DCCB   |
	INC $2E,x				;$B3DCCD   |
	LDA $42,x				;$B3DCCF   |
	AND #$0003				;$B3DCD1   |
	CMP #$0002				;$B3DCD4   |
	BNE CODE_B3DCFD				;$B3DCD7   |
	LDA $08BC				;$B3DCD9   |
	ORA #$8000				;$B3DCDC   |
	STA $19D8				;$B3DCDF   |
	LDA $44,x				;$B3DCE2   |
	STA $08BC				;$B3DCE4   |
	STA $096B				;$B3DCE7   |
	STA $096D				;$B3DCEA   |
	JML [$05A9]				;$B3DCED  /

CODE_B3DCF0:
	LDX current_sprite			;$B3DCF0  \
	DEC $4C,x				;$B3DCF2   |
	BPL CODE_B3DCFD				;$B3DCF4   |
	LDA $44,x				;$B3DCF6   |
	STA $19BA				;$B3DCF8   |
	STZ $2E,x				;$B3DCFB   |
CODE_B3DCFD:					;	   |
	JML [$05A9]				;$B3DCFD  /

CODE_B3DD00:
	JSR CODE_B3DDA8				;$B3DD00  \
	JSR CODE_B3DEF4				;$B3DD03   |
	BCS CODE_B3DD21				;$B3DD06   |
	LDA #$001F				;$B3DD08   |
	LDY #$0400				;$B3DD0B   |
	JSL CODE_B8D1E4				;$B3DD0E   |
	LDX current_sprite			;$B3DD12   |
	LDA #$000A				;$B3DD14   |
	STA $2E,x				;$B3DD17   |
	LDA #$000A				;$B3DD19   |
	STA $42,x				;$B3DD1C   |
	JML [$05A9]				;$B3DD1E  /

CODE_B3DD21:
	LDX current_sprite			;$B3DD21  \
	INC $2E,x				;$B3DD23   |
	LDA #$0027				;$B3DD25   |
	JSL CODE_B8D8BA				;$B3DD28   |
	BCS CODE_B3DD35				;$B3DD2C   |
	LDX current_sprite			;$B3DD2E   |
	LDA $42,x				;$B3DD30   |
	STA $0A86				;$B3DD32   |
CODE_B3DD35:					;	   |
	JML [$05A9]				;$B3DD35  /

CODE_B3DD38:
	JSR CODE_B3DDA8				;$B3DD38  \
	JSR CODE_B3DE26				;$B3DD3B   |
	JSR CODE_B3DE0A				;$B3DD3E   |
	JSL CODE_BB82B8				;$B3DD41   |
	JML [$05A9]				;$B3DD45  /

CODE_B3DD48:
	LDX current_sprite			;$B3DD48  \
	DEC $42,x				;$B3DD4A   |
	BEQ CODE_B3DD54				;$B3DD4C   |
	JSR CODE_B3DDA8				;$B3DD4E   |
	JML [$05A9]				;$B3DD51  /

CODE_B3DD54:
	INC $2E,x				;$B3DD54  \
	LDA #$0028				;$B3DD56   |
	JSL CODE_B8D8BA				;$B3DD59   |
	JSR CODE_B3DE26				;$B3DD5D   |
	JSR CODE_B3DE0A				;$B3DD60   |
	JSL CODE_BB82B8				;$B3DD63   |
	JML [$05A9]				;$B3DD67  /

CODE_B3DD6A:
	JML [$05A9]				;$B3DD6A  /

CODE_B3DD6D:
	LDX current_sprite			;$B3DD6D  \
	LDA $48,x				;$B3DD6F   |
	SEC					;$B3DD71   |
	SBC #$0100				;$B3DD72   |
	STA $48,x				;$B3DD75   |
	BPL CODE_B3DDA7				;$B3DD77   |
	XBA					;$B3DD79   |
	EOR $48,x				;$B3DD7A   |
	AND #$FF00				;$B3DD7C   |
	EOR $48,x				;$B3DD7F   |
	STA $48,x				;$B3DD81   |
	LDA $46,x				;$B3DD83   |
	BMI CODE_B3DDA7				;$B3DD85   |
	DEC $46,x				;$B3DD87   |
	BMI CODE_B3DDA7				;$B3DD89   |
	CMP #$000B				;$B3DD8B   |
	BPL CODE_B3DDA0				;$B3DD8E   |
	LDA #$061C				;$B3DD90   |
	JSL queue_sound_effect			;$B3DD93   |
	LDA #$043E				;$B3DD97   |
	JSL queue_sound_effect			;$B3DD9A   |
	BRA CODE_B3DDA7				;$B3DD9E  /

CODE_B3DDA0:
	LDA #$061C				;$B3DDA0  \
	JSL queue_sound_effect			;$B3DDA3   |
CODE_B3DDA7:					;	   |
	RTS					;$B3DDA7  /

CODE_B3DDA8:
	LDX current_sprite			;$B3DDA8  \
	LDA $46,x				;$B3DDAA   |
	BMI CODE_B3DDE5				;$B3DDAC   |
	CMP #$0001				;$B3DDAE   |
	BMI CODE_B3DDED				;$B3DDB1   |
	CMP #$0006				;$B3DDB3   |
	BMI CODE_B3DDF2				;$B3DDB6   |
	CMP #$000B				;$B3DDB8   |
	BMI CODE_B3DDFE				;$B3DDBB   |
CODE_B3DDBD:					;	   |
	LDA $46,x				;$B3DDBD   |
CODE_B3DDBF:					;	   |
	ASL A					;$B3DDBF   |
	TAX					;$B3DDC0   |
	LDA.l DATA_B3DE2C,x			;$B3DDC1   |
	STA $32					;$B3DDC5   |
	LDX current_sprite			;$B3DDC7   |
	AND #$00FF				;$B3DDC9   |
	ASL A					;$B3DDCC   |
	ASL A					;$B3DDCD   |
	CLC					;$B3DDCE   |
	ADC #$2D40				;$B3DDCF   |
	STA $1A,x				;$B3DDD2   |
	LDY $4A,x				;$B3DDD4   |
	LDA $33					;$B3DDD6   |
	AND #$00FF				;$B3DDD8   |
	ASL A					;$B3DDDB   |
	ASL A					;$B3DDDC   |
	CLC					;$B3DDDD   |
	ADC #$2D40				;$B3DDDE   |
	STA $001A,y				;$B3DDE1   |
	RTS					;$B3DDE4  /

CODE_B3DDE5:
	JSR CODE_B3DE26				;$B3DDE5  \
	LDA #$0000				;$B3DDE8   |
	BRA CODE_B3DDBF				;$B3DDEB  /

CODE_B3DDED:
	JSR CODE_B3DE0A				;$B3DDED  \
	BRA CODE_B3DDBD				;$B3DDF0  /

CODE_B3DDF2:
	LDA global_frame_counter		;$B3DDF2  \
	AND #$0003				;$B3DDF4   |
	BNE CODE_B3DDBD				;$B3DDF7   |
	JSR CODE_B3DE0A				;$B3DDF9   |
	BRA CODE_B3DDBD				;$B3DDFC  /

CODE_B3DDFE:
	LDA global_frame_counter		;$B3DDFE  \
	AND #$0007				;$B3DE00   |
	BNE CODE_B3DDBD				;$B3DE03   |
	JSR CODE_B3DE0A				;$B3DE05   |
	BRA CODE_B3DDBD				;$B3DE08  /

CODE_B3DE0A:
	LDA $097F				;$B3DE0A  \
	EOR current_sprite			;$B3DE0D   |
	STA $097F				;$B3DE0F   |
	RTS					;$B3DE12  /

	LDA $1C,x				;$B3DE13   |
	EOR #$4000				;$B3DE15   |
	STA $1C,x				;$B3DE18   |
	LDY $4A,x				;$B3DE1A   |
	LDA $001C,y				;$B3DE1C   |
	EOR #$4000				;$B3DE1F   |
	STA $001C,y				;$B3DE22   |
	RTS					;$B3DE25  /

CODE_B3DE26:
	LDA current_sprite			;$B3DE26  \
	STA $097F				;$B3DE28   |
	RTS					;$B3DE2B  /

DATA_B3DE2C:
	db $00, $00, $00, $01, $00, $02, $00, $03
	db $00, $04, $00, $05, $00, $06, $00, $07
	db $00, $08, $00, $09, $01, $00, $01, $01
	db $01, $02, $01, $03, $01, $04, $01, $05
	db $01, $06, $01, $07, $01, $08, $01, $09
	db $02, $00, $02, $01, $02, $02, $02, $03
	db $02, $04, $02, $05, $02, $06, $02, $07
	db $02, $08, $02, $09, $03, $00, $03, $01
	db $03, $02, $03, $03, $03, $04, $03, $05
	db $03, $06, $03, $07, $03, $08, $03, $09
	db $04, $00, $04, $01, $04, $02, $04, $03
	db $04, $04, $04, $05, $04, $06, $04, $07
	db $04, $08, $04, $09, $05, $00, $05, $01
	db $05, $02, $05, $03, $05, $04, $05, $05
	db $05, $06, $05, $07, $05, $08, $05, $09
	db $06, $00, $06, $01, $06, $02, $06, $03
	db $06, $04, $06, $05, $06, $06, $06, $07
	db $06, $08, $06, $09, $07, $00, $07, $01
	db $07, $02, $07, $03, $07, $04, $07, $05
	db $07, $06, $07, $07, $07, $08, $07, $09
	db $08, $00, $08, $01, $08, $02, $08, $03
	db $08, $04, $08, $05, $08, $06, $08, $07
	db $08, $08, $08, $09, $09, $00, $09, $01
	db $09, $02, $09, $03, $09, $04, $09, $05
	db $09, $06, $09, $07, $09, $08, $09, $09

CODE_B3DEF4:
	LDA $08C4				;$B3DEF4  \
	AND #$0002				;$B3DEF7   |
	BNE CODE_B3DEFE				;$B3DEFA   |
	CLC					;$B3DEFC   |
	RTS					;$B3DEFD  /

CODE_B3DEFE:
	SEC					;$B3DEFE  \
	RTS					;$B3DEFF  /

CODE_B3DF00:
	LDA $0923				;$B3DF00  \
	AND #$0001				;$B3DF03   |
if !version == 0				;	   |
	BNE CODE_B3DF24				;$B3DF06   |
else						;	   |
	BNE CODE_B3DF17				;$B3DF06   |
endif						;	   |
	LDA $42,x				;$B3DF08   |
	AND #$0003				;$B3DF0A   |
	BEQ CODE_B3DF1E				;$B3DF0D   |
	DEC A					;$B3DF0F   |
	BEQ CODE_B3DF18				;$B3DF10   |
	LDA $096B				;$B3DF12   |
if !version == 0				;	   |
	BEQ CODE_B3DF1E				;$B3DF15   |
	BRA CODE_B3DF24				;$B3DF17   |
else						;	   |
	BEQ CODE_B3DF25				;$B3DF15   |
CODE_B3DF17:					;	   |
	RTS					;$B3DF17  /
endif

CODE_B3DF18:					;	  \
	LDA $19BA				;$B3DF18   |
if !version == 0				;	   |
	BEQ CODE_B3DF1E				;$B3DF1B   |
	BRA CODE_B3DF24 			;$B3DF1D   |
else						;	   |
	BEQ CODE_B3DF25				;$B3DF1B   |
	RTS					;$B3DF1D   |
endif						;	  /

CODE_B3DF1E:
	LDA #$0001				;$B3DF1E  \
	TSB $0923				;$B3DF21   |
CODE_B3DF24:					;	   |
	RTS					;$B3DF24  /

if !version == 1				;	  \
CODE_B3DF25:					;	   |
	LDA #$0621				;$B3DF25   |
	JSL queue_sound_effect			;$B3DF28   |
	LDA #$0522				;$B3DF2C   |
	JSL queue_sound_effect			;$B3DF2F   |
	LDA #$0735				;$B3DF33   |
	JSL queue_sound_effect			;$B3DF36   |
	BRA CODE_B3DF1E				;$B3DF3A   |
endif						;	  /

CODE_B3DF3C:
	LDX current_sprite			;$B3DF3C  \
	LDA $1C,x				;$B3DF3E   |
	CMP #$C000				;$B3DF40   |
	BNE CODE_B3DF47				;$B3DF43   |
	STZ $1C,x				;$B3DF45   |
CODE_B3DF47:					;	   |
	RTL					;$B3DF47  /

CODE_B3DF48:
	LDX current_sprite			;$B3DF48  \
	LDA $2E,x				;$B3DF4A   |
	ASL A					;$B3DF4C   |
	TAX					;$B3DF4D   |
	JMP (DATA_B3DF51,x)			;$B3DF4E  /

DATA_B3DF51:
	dw CODE_B3DF5F
	dw CODE_B3DF8D
	dw CODE_B3DF5F
	dw CODE_B3DFC0
	dw CODE_B3DFFC
	dw CODE_B3DFFF
	dw CODE_B3E006

CODE_B3DF5F:
	LDX current_sprite			;$B3DF5F  \
	INC $2E,x				;$B3DF61   |
	STZ $1A,x				;$B3DF63   |
	STZ $16,x				;$B3DF65   |
	PER RESET_start+$330000			;$B3DF67   |
	PEA $B380				;$B3DF6A   |
	PLB					;$B3DF6D   |
	LDY #$01E6				;$B3DF6E   |
	LDA #$0000				;$B3DF71   |
	CLC					;$B3DF74   |
CODE_B3DF75:					;	   |
	EOR ($02,s),y				;$B3DF75   |
	ROR A					;$B3DF77   |
	DEY					;$B3DF78   |
	DEY					;$B3DF79   |
	BPL CODE_B3DF75				;$B3DF7A   |
	XBA					;$B3DF7C   |
	EOR #$CCAB				;$B3DF7D   |
	INC A					;$B3DF80   |
	BEQ CODE_B3DF88				;$B3DF81   |
	LDA #$FFFF				;$B3DF83   |
	STA $42,x				;$B3DF86   |
CODE_B3DF88:					;	   |
	PLB					;$B3DF88   |
	PLY					;$B3DF89   |
	JMP CODE_B3D916				;$B3DF8A  /

CODE_B3DF8D:
	LDA $0515				;$B3DF8D  \
	CMP #$0002				;$B3DF90   |
	BNE CODE_B3DF99				;$B3DF93   |
	LDA $6E					;$B3DF95   |
	BEQ CODE_B3DF9E				;$B3DF97   |
CODE_B3DF99:					;	   |
	JSR CODE_B3E0C9				;$B3DF99   |
	BCS CODE_B3DFA1				;$B3DF9C   |
CODE_B3DF9E:					;	   |
	JMP CODE_B3D916				;$B3DF9E  /

CODE_B3DFA1:
	LDA #$002B				;$B3DFA1  \
	JSL CODE_B8D8BA				;$B3DFA4   |
	BCS CODE_B3DFBD				;$B3DFA8   |
	LDA #CODE_B3E1E2			;$B3DFAA   |
	STA $0A8A				;$B3DFAD   |
	LDA.w #CODE_B3E1E2>>16			;$B3DFB0   |
	STA $0A8C				;$B3DFB3   |
	LDX current_sprite			;$B3DFB6   |
	LDA #$0004				;$B3DFB8   |
	STA $2E,x				;$B3DFBB   |
CODE_B3DFBD:					;	   |
	JMP CODE_B3D916				;$B3DFBD  /

CODE_B3DFC0:
	LDY $0593				;$B3DFC0  \
	LDA $002E,y				;$B3DFC3   |
	CMP #$005B				;$B3DFC6   |
	BEQ CODE_B3DFDD				;$B3DFC9   |
	CMP #$005C				;$B3DFCB   |
	BEQ CODE_B3DFDD				;$B3DFCE   |
	CMP #$0047				;$B3DFD0   |
	BNE CODE_B3DFDA				;$B3DFD3   |
	LDA $0042,y				;$B3DFD5   |
	BEQ CODE_B3DFDD				;$B3DFD8   |
CODE_B3DFDA:					;	   |
	JMP CODE_B3D916				;$B3DFDA  /

CODE_B3DFDD:
	LDA #$002B				;$B3DFDD  \
	JSL CODE_B8D8BA				;$B3DFE0   |
	BCS CODE_B3DFF9				;$B3DFE4   |
	LDA #CODE_B3E2F4			;$B3DFE6   |
	STA $0A8A				;$B3DFE9   |
	LDA.w #CODE_B3E2F4>>16			;$B3DFEC   |
	STA $0A8C				;$B3DFEF   |
	LDX current_sprite			;$B3DFF2   |
	LDA #$0004				;$B3DFF4   |
	STA $2E,x				;$B3DFF7   |
CODE_B3DFF9:					;	   |
	JMP CODE_B3D916				;$B3DFF9  /

CODE_B3DFFC:
	JMP CODE_B3D916				;$B3DFFC  /

CODE_B3DFFF:
	LDX current_sprite			;$B3DFFF  \
	INC $2E,x				;$B3E001   |
	JMP CODE_B3D916				;$B3E003  /

CODE_B3E006:
	LDX current_sprite			;$B3E006  \
	LDA $32,x				;$B3E008   |
	BNE CODE_B3E063				;$B3E00A   |
	JSL CODE_BCFB58				;$B3E00C   |
	LDA #$0008				;$B3E010   |
	JSL CODE_BCFCB5				;$B3E013   |
	BCC CODE_B3E060				;$B3E017   |
	LDA $6E					;$B3E019   |
	CMP #$019C				;$B3E01B   |
	BEQ CODE_B3E025				;$B3E01E   |
	CMP #$01A0				;$B3E020   |
	BNE CODE_B3E060				;$B3E023   |
CODE_B3E025:					;	   |
	LDX current_sprite			;$B3E025   |
	LDY $6A					;$B3E027   |
	LDA $0006,y				;$B3E029   |
	SEC					;$B3E02C   |
	SBC $06,x				;$B3E02D   |
	STA $32					;$B3E02F   |
	LDA $46,x				;$B3E031   |
	LSR A					;$B3E033   |
	BCC CODE_B3E03E				;$B3E034   |
	LDA $32					;$B3E036   |
	EOR #$FFFF				;$B3E038   |
	INC A					;$B3E03B   |
	STA $32					;$B3E03C   |
CODE_B3E03E:					;	   |
	LDA $32					;$B3E03E   |
	BMI CODE_B3E060				;$B3E040   |
	LDA $46,x				;$B3E042   |
	AND #$0001				;$B3E044   |
	DEC A					;$B3E047   |
	EOR $0020,y				;$B3E048   |
	BMI CODE_B3E060				;$B3E04B   |
	LDA $0020,y				;$B3E04D   |
	BPL CODE_B3E056				;$B3E050   |
	EOR #$FFFF				;$B3E052   |
	INC A					;$B3E055   |
CODE_B3E056:					;	   |
	CMP #$04FF				;$B3E056   |
	BMI CODE_B3E060				;$B3E059   |
	JSR CODE_B3E08C				;$B3E05B   |
	BCS CODE_B3E063				;$B3E05E   |
CODE_B3E060:					;	   |
	JMP CODE_B3D916				;$B3E060  /

CODE_B3E063:
	LDX current_sprite			;$B3E063  \
	STZ $30,x				;$B3E065   |
	STZ $32,x				;$B3E067   |
	JSL CODE_BB82C3				;$B3E069   |
	LDA #$0094				;$B3E06D   |
	STA $00,x				;$B3E070   |
	STZ $1A,x				;$B3E072   |
	STZ $16,x				;$B3E074   |
	LDA #$0001				;$B3E076   |
	STA $2E,x				;$B3E079   |
	LDA #$0615				;$B3E07B   |
	JSL queue_sound_effect			;$B3E07E   |
	LDA #$0719				;$B3E082   |
	JSL queue_sound_effect			;$B3E085   |
	JML [$05A9]				;$B3E089  /

CODE_B3E08C:
	LDY $0593				;$B3E08C  \
	LDA $0D4E				;$B3E08F   |
	BMI CODE_B3E09D				;$B3E092   |
	SEC					;$B3E094   |
	SBC $000A,y				;$B3E095   |
	CMP #$FFEC				;$B3E098   |
	BMI CODE_B3E0B3				;$B3E09B   |
CODE_B3E09D:					;	   |
	JSR CODE_B3E14B				;$B3E09D   |
	BCC CODE_B3E0C7				;$B3E0A0   |
	JSR CODE_B3E15A				;$B3E0A2   |
	BCC CODE_B3E0C7				;$B3E0A5   |
	JSR CODE_B3E172				;$B3E0A7   |
	BCC CODE_B3E0C7				;$B3E0AA   |
	JSR CODE_B3E191				;$B3E0AC   |
	BCC CODE_B3E0C7				;$B3E0AF   |
CODE_B3E0B1:					;	   |
	SEC					;$B3E0B1   |
	RTS					;$B3E0B2  /

CODE_B3E0B3:
	JSR CODE_B3E14B				;$B3E0B3  \
	BCC CODE_B3E0C7				;$B3E0B6   |
	JSR CODE_B3E15A				;$B3E0B8   |
	BCC CODE_B3E0C7				;$B3E0BB   |
	JSR CODE_B3E16D				;$B3E0BD   |
	BCC CODE_B3E0C7				;$B3E0C0   |
	JSR CODE_B3E191				;$B3E0C2   |
	BCS CODE_B3E0B1				;$B3E0C5   |
CODE_B3E0C7:					;	   |
	CLC					;$B3E0C7   |
	RTS					;$B3E0C8  /

CODE_B3E0C9:
	PHX					;$B3E0C9  \
	LDX $0593				;$B3E0CA   |
	LDA $2E,x				;$B3E0CD   |
	ASL A					;$B3E0CF   |
	ASL A					;$B3E0D0   |
	TAX					;$B3E0D1   |
	LDA.l DATA_B896B7,x			;$B3E0D2   |
	PLX					;$B3E0D6   |
	AND #$0004				;$B3E0D7   |
	BNE CODE_B3E134				;$B3E0DA   |
	LDY $0593				;$B3E0DC   |
	LDA $0D4E				;$B3E0DF   |
	BMI CODE_B3E0ED				;$B3E0E2   |
	SEC					;$B3E0E4   |
	SBC $000A,y				;$B3E0E5   |
	CMP #$FFEC				;$B3E0E8   |
	BMI CODE_B3E136				;$B3E0EB   |
CODE_B3E0ED:					;	   |
	JSR CODE_B3E14B				;$B3E0ED   |
	BCC CODE_B3E134				;$B3E0F0   |
	JSR CODE_B3E15A				;$B3E0F2   |
	BCC CODE_B3E134				;$B3E0F5   |
	JSR CODE_B3E172				;$B3E0F7   |
	BCC CODE_B3E134				;$B3E0FA   |
	JSR CODE_B3E191				;$B3E0FC   |
	BCC CODE_B3E134				;$B3E0FF   |
	LDY $0593				;$B3E101   |
	LDA $002E,y				;$B3E104   |
	CMP #$005B				;$B3E107   |
	BEQ CODE_B3E113				;$B3E10A   |
	CMP #$005C				;$B3E10C   |
	BEQ CODE_B3E113				;$B3E10F   |
	BRA CODE_B3E128				;$B3E111  /

CODE_B3E113:
	LDY $0D5E				;$B3E113  \
	BEQ CODE_B3E128				;$B3E116   |
	LDX current_sprite			;$B3E118   |
	LDA $0020,y				;$B3E11A   |
	BEQ CODE_B3E134				;$B3E11D   |
	ROL A					;$B3E11F   |
	ROL A					;$B3E120   |
	EOR $46,x				;$B3E121   |
	LSR A					;$B3E123   |
	BCC CODE_B3E134				;$B3E124   |
	BRA CODE_B3E132				;$B3E126  /

CODE_B3E128:
	JSR CODE_B3E1A9				;$B3E128  \
	BCC CODE_B3E134				;$B3E12B   |
	JSR CODE_B3E1B8				;$B3E12D   |
	BCC CODE_B3E134				;$B3E130   |
CODE_B3E132:					;	   |
	SEC					;$B3E132   |
	RTS					;$B3E133  /

CODE_B3E134:
	CLC					;$B3E134  \
	RTS					;$B3E135  /

CODE_B3E136:
	JSR CODE_B3E14B				;$B3E136  \
	BCC CODE_B3E134				;$B3E139   |
	JSR CODE_B3E15A				;$B3E13B   |
	BCC CODE_B3E134				;$B3E13E   |
	JSR CODE_B3E16D				;$B3E140   |
	BCC CODE_B3E134				;$B3E143   |
	JSR CODE_B3E191				;$B3E145   |
	BCC CODE_B3E134				;$B3E148   |
	RTS					;$B3E14A  /

CODE_B3E14B:
	LDY $0593				;$B3E14B  \
	LDA $002E,y				;$B3E14E   |
	CMP #$0033				;$B3E151   |
	BEQ CODE_B3E158				;$B3E154   |
	SEC					;$B3E156   |
	RTS					;$B3E157  /

CODE_B3E158:
	CLC					;$B3E158  \
	RTS					;$B3E159  /

CODE_B3E15A:
	LDX current_sprite			;$B3E15A  \
	LDA $0A,x				;$B3E15C   |
	SEC					;$B3E15E   |
	SBC $17C2				;$B3E15F   |
	BMI CODE_B3E16B				;$B3E162   |
	CMP #$00E0				;$B3E164   |
	BPL CODE_B3E16B				;$B3E167   |
	SEC					;$B3E169   |
	RTS					;$B3E16A  /

CODE_B3E16B:
	CLC					;$B3E16B  \
	RTS					;$B3E16C  /

CODE_B3E16D:
	LDA #$001B				;$B3E16D  \
	BRA CODE_B3E175				;$B3E170  /

CODE_B3E172:
	LDA #$0005				;$B3E172  \
CODE_B3E175:					;	   |
	STA $32					;$B3E175   |
	LDY $0593				;$B3E177   |
	LDA $0A,x				;$B3E17A   |
	CLC					;$B3E17C   |
	ADC $48,x				;$B3E17D   |
	SEC					;$B3E17F   |
	SBC $000A,y				;$B3E180   |
	BPL CODE_B3E189				;$B3E183   |
	EOR #$FFFF				;$B3E185   |
	INC A					;$B3E188   |
CODE_B3E189:					;	   |
	CMP $32					;$B3E189   |
	BPL CODE_B3E18F				;$B3E18B   |
	SEC					;$B3E18D   |
	RTS					;$B3E18E  /

CODE_B3E18F:
	CLC					;$B3E18F  \
	RTS					;$B3E190  /

CODE_B3E191:
	LDY $0593				;$B3E191  \
	LDA $06,x				;$B3E194   |
	SEC					;$B3E196   |
	SBC $0006,y				;$B3E197   |
	BPL CODE_B3E1A0				;$B3E19A   |
	EOR #$FFFF				;$B3E19C   |
	INC A					;$B3E19F   |
CODE_B3E1A0:					;	   |
	CMP #$0016				;$B3E1A0   |
	BPL CODE_B3E1A7				;$B3E1A3   |
	SEC					;$B3E1A5   |
	RTS					;$B3E1A6  /

CODE_B3E1A7:
	CLC					;$B3E1A7  \
	RTS					;$B3E1A8  /

CODE_B3E1A9:
	LDA $001E,y				;$B3E1A9  \
	AND #$0101				;$B3E1AC   |
	CMP #$0101				;$B3E1AF   |
	BNE CODE_B3E1B6				;$B3E1B2   |
	SEC					;$B3E1B4   |
	RTS					;$B3E1B5  /

CODE_B3E1B6:
	CLC					;$B3E1B6  \
	RTS					;$B3E1B7  /

CODE_B3E1B8:
	LDA $00,x				;$B3E1B8  \
	CMP #$0124				;$B3E1BA   |
	BEQ CODE_B3E1E0				;$B3E1BD   |
	LDY $0593				;$B3E1BF   |
	LDA $002E,y				;$B3E1C2   |
	CMP #$004F				;$B3E1C5   |
	BEQ CODE_B3E1E0				;$B3E1C8   |
	LDA $46,x				;$B3E1CA   |
	BEQ CODE_B3E1D5				;$B3E1CC   |
	LDA #$0100				;$B3E1CE   |
	BRA CODE_B3E1D8				;$B3E1D1  /

CODE_B3E1D3:
	CLC					;$B3E1D3  \
	RTS					;$B3E1D4  /

CODE_B3E1D5:
	LDA #$0200				;$B3E1D5  \
CODE_B3E1D8:					;	   |
	LDY $0595				;$B3E1D8   |
	AND $0004,y				;$B3E1DB   |
	BEQ CODE_B3E1D3				;$B3E1DE   |
CODE_B3E1E0:					;	   |
	SEC					;$B3E1E0   |
	RTS					;$B3E1E1  /

CODE_B3E1E2:
	JSL CODE_B8808E				;$B3E1E2  \
	JSL CODE_B881B4				;$B3E1E6   |
	JSR CODE_B3E28B				;$B3E1EA   |
	LDA $6E					;$B3E1ED   |
	CMP #$01A0				;$B3E1EF   |
	BEQ CODE_B3E203				;$B3E1F2   |
	LDX $0593				;$B3E1F4   |
	LDY $0A84				;$B3E1F7   |
	LDA $000A,y				;$B3E1FA   |
	CLC					;$B3E1FD   |
	ADC $0048,y				;$B3E1FE   |
	STA $0A,x				;$B3E201   |
CODE_B3E203:					;	   |
	JSR CODE_B3E2C4				;$B3E203   |
	LDX $0593				;$B3E206   |
	LDY $0595				;$B3E209   |
	LDA #$0000				;$B3E20C   |
	STA $0016,y				;$B3E20F   |
	STA $0014,y				;$B3E212   |
	LDA #$FFFB				;$B3E215   |
	AND $0006,y				;$B3E218   |
	STA $0006,y				;$B3E21B   |
	STZ $30,x				;$B3E21E   |
	LDA #$0180				;$B3E220   |
	STA $32					;$B3E223   |
	LDY $0A84				;$B3E225   |
	LDX $0593				;$B3E228   |
	LDA $0046,y				;$B3E22B   |
	BNE CODE_B3E240				;$B3E22E   |
	LDA $004A,y				;$B3E230   |
	EOR #$FFFF				;$B3E233   |
	INC A					;$B3E236   |
	TAY					;$B3E237   |
	LDA $32					;$B3E238   |
	EOR #$FFFF				;$B3E23A   |
	INC A					;$B3E23D   |
	BRA CODE_B3E246				;$B3E23E  /

CODE_B3E240:
	LDA $004A,y				;$B3E240  \
	TAY					;$B3E243   |
	LDA $32					;$B3E244   |
CODE_B3E246:					;	   |
	STA $20,x				;$B3E246   |
	STA $26,x				;$B3E248   |
	LSR A					;$B3E24A   |
	EOR $12,x				;$B3E24B   |
	AND #$4000				;$B3E24D   |
	EOR $12,x				;$B3E250   |
	STA $12,x				;$B3E252   |
	STZ $24,x				;$B3E254   |
	LDA current_player_mount		;$B3E256   |
	BEQ CODE_B3E25F				;$B3E258   |
	LDA #$0040				;$B3E25A   |
	STA $24,x				;$B3E25D   |
CODE_B3E25F:					;	   |
	TYA					;$B3E25F   |
	LDY $0A84				;$B3E260   |
	CLC					;$B3E263   |
	ADC $0006,y				;$B3E264   |
	STA $05A1				;$B3E267   |
	LDY $0A84				;$B3E26A   |
	LDX $0593				;$B3E26D   |
	LDA $0042,y				;$B3E270   |
	STA $059D				;$B3E273   |
	LDA $0044,y				;$B3E276   |
	STA $059F				;$B3E279   |
	LDA #$0003				;$B3E27C   |
	LDY #$0280				;$B3E27F   |
	JSL CODE_B8D1E4				;$B3E282   |
	RTL					;$B3E286  /

CODE_B3E287:
	JSR CODE_B3E28B				;$B3E287  \
	RTL					;$B3E28A  /

CODE_B3E28B:
	LDA $052B				;$B3E28B  \
	AND #$0002				;$B3E28E   |
	BEQ CODE_B3E2A6				;$B3E291   |
	LDX $0593				;$B3E293   |
	JSR CODE_B3E2A7				;$B3E296   |
	LDX $0597				;$B3E299   |
	JSR CODE_B3E2A7				;$B3E29C   |
	LDX current_player_mount		;$B3E29F   |
	BEQ CODE_B3E2A6				;$B3E2A1   |
	JSR CODE_B3E2A7				;$B3E2A3   |
CODE_B3E2A6:					;	   |
	RTS					;$B3E2A6  /

CODE_B3E2A7:
	LDA #$2000				;$B3E2A7  \
	EOR $12,x				;$B3E2AA   |
	AND #$3000				;$B3E2AC   |
	EOR $12,x				;$B3E2AF   |
	STA $12,x				;$B3E2B1   |
	RTS					;$B3E2B3  /

	LDA $12,x				;$B3E2B4   |
	SEC					;$B3E2B6   |
	SBC #$1000				;$B3E2B7   |
	EOR $12,x				;$B3E2BA   |
	AND #$3000				;$B3E2BC   |
	EOR $12,x				;$B3E2BF   |
	STA $12,x				;$B3E2C1   |
	RTS					;$B3E2C3  /

CODE_B3E2C4:
	JSR CODE_B3E2D0				;$B3E2C4  \
	LDX $0593				;$B3E2C7   |
	LDA #$0033				;$B3E2CA   |
	STA $2E,x				;$B3E2CD   |
CODE_B3E2CF:					;	   |
	RTS					;$B3E2CF  /

CODE_B3E2D0:
	LDY $0595				;$B3E2D0  \
	LDA $0000,y				;$B3E2D3   |
	CMP #$00A3				;$B3E2D6   |
	BEQ CODE_B3E2CF				;$B3E2D9   |
	CMP #$009E				;$B3E2DB   |
	BEQ CODE_B3E2CF				;$B3E2DE   |
	LDA $6E					;$B3E2E0   |
	BNE CODE_B3E2EC				;$B3E2E2   |
	LDA #$003C				;$B3E2E4   |
	JSL CODE_B9D0B0				;$B3E2E7   |
	RTS					;$B3E2EB  /

CODE_B3E2EC:
	LDA #$009A				;$B3E2EC  \
	JSL CODE_B9D08C				;$B3E2EF   |
	RTS					;$B3E2F3  /

CODE_B3E2F4:
	JSL CODE_B8808E				;$B3E2F4  \
	LDA $2E,x				;$B3E2F8   |
	ASL A					;$B3E2FA   |
	ASL A					;$B3E2FB   |
	TAX					;$B3E2FC   |
	LDA.l DATA_B896B7,x			;$B3E2FD   |
	AND #$0002				;$B3E301   |
	BEQ CODE_B3E310				;$B3E304   |
	LDX current_sprite			;$B3E306   |
	LDA #$0070				;$B3E308   |
	STA $2E,x				;$B3E30B   |
	BRL CODE_B3E392				;$B3E30D  /

CODE_B3E310:
	LDX $0593				;$B3E310  \
	LDY $0A84				;$B3E313   |
	LDA $000A,y				;$B3E316   |
	CLC					;$B3E319   |
	ADC $0048,y				;$B3E31A   |
	STA $0A,x				;$B3E31D   |
	LDX $0593				;$B3E31F   |
	LDA #$0033				;$B3E322   |
	STA $2E,x				;$B3E325   |
	LDX $0593				;$B3E327   |
	LDY $0595				;$B3E32A   |
	LDA #$0000				;$B3E32D   |
	STA $0016,y				;$B3E330   |
	STA $0014,y				;$B3E333   |
	LDA #$FFFB				;$B3E336   |
	AND $0006,y				;$B3E339   |
	STA $0006,y				;$B3E33C   |
	STZ $30,x				;$B3E33F   |
	LDY #$0300				;$B3E341   |
	LDX #$0040				;$B3E344   |
	LDA $0B02				;$B3E347   |
	AND #$0004				;$B3E34A   |
	BNE CODE_B3E355				;$B3E34D   |
	LDY #$0300				;$B3E34F   |
	LDX #$0028				;$B3E352   |
CODE_B3E355:					;	   |
	STY $32					;$B3E355   |
	STX $34					;$B3E357   |
	LDY $0A84				;$B3E359   |
	LDX $0593				;$B3E35C   |
	LDA $0046,y				;$B3E35F   |
	BNE CODE_B3E374				;$B3E362   |
	LDA $34					;$B3E364   |
	EOR #$FFFF				;$B3E366   |
	INC A					;$B3E369   |
	STA $34					;$B3E36A   |
	LDA $32					;$B3E36C   |
	EOR #$FFFF				;$B3E36E   |
	INC A					;$B3E371   |
	STA $32					;$B3E372   |
CODE_B3E374:					;	   |
	LDA $32					;$B3E374   |
	STA $20,x				;$B3E376   |
	STA $26,x				;$B3E378   |
	LSR A					;$B3E37A   |
	EOR $12,x				;$B3E37B   |
	AND #$4000				;$B3E37D   |
	EOR $12,x				;$B3E380   |
	STA $12,x				;$B3E382   |
	STZ $24,x				;$B3E384   |
	LDA $34					;$B3E386   |
	LDY $0A84				;$B3E388   |
	CLC					;$B3E38B   |
	ADC $0006,y				;$B3E38C   |
	STA $05A1				;$B3E38F   |
CODE_B3E392:					;	   |
	LDY $0A84				;$B3E392   |
	LDX $0593				;$B3E395   |
	LDA $0042,y				;$B3E398   |
	STA $059D				;$B3E39B   |
	LDA $0044,y				;$B3E39E   |
	STA $059F				;$B3E3A1   |
	LDA #$0003				;$B3E3A4   |
	LDY #$0280				;$B3E3A7   |
	JSL CODE_B8D1E4				;$B3E3AA   |
	RTL					;$B3E3AE  /

CODE_B3E3AF:
	JSR CODE_B3E3B3				;$B3E3AF  \
	RTL					;$B3E3B2  /

CODE_B3E3B3:
	LDX $0593				;$B3E3B3  \
	STA $32					;$B3E3B6   |
	LDA $30,x				;$B3E3B8   |
	BEQ CODE_B3E3E2				;$B3E3BA   |
	AND #$0080				;$B3E3BC   |
	BNE CODE_B3E3E2				;$B3E3BF   |
	LDA $32					;$B3E3C1   |
	BEQ CODE_B3E3CD				;$B3E3C3   |
	LDA $24,x				;$B3E3C5   |
	CLC					;$B3E3C7   |
	ADC #$0034				;$B3E3C8   |
	STA $24,x				;$B3E3CB   |
CODE_B3E3CD:					;	   |
	LDY current_sprite			;$B3E3CD   |
	LDA $0006,y				;$B3E3CF   |
	CMP $06,x				;$B3E3D2   |
	BPL CODE_B3E3DE				;$B3E3D4   |
	LDA $32					;$B3E3D6   |
	EOR #$FFFF				;$B3E3D8   |
	INC A					;$B3E3DB   |
	STA $32					;$B3E3DC   |
CODE_B3E3DE:					;	   |
	LDA $32					;$B3E3DE   |
	STA $2C,x				;$B3E3E0   |
CODE_B3E3E2:					;	   |
	RTS					;$B3E3E2  /

CODE_B3E3E3:
	JSR CODE_B3E3E7				;$B3E3E3  \
	RTL					;$B3E3E6  /

CODE_B3E3E7:
	JSR CODE_B3E489				;$B3E3E7  \
	LDA $0919				;$B3E3EA   |
	EOR $091B				;$B3E3ED   |
	LSR A					;$B3E3F0   |
	BCS CODE_B3E3F7				;$B3E3F1   |
	LSR A					;$B3E3F3   |
	BCS CODE_B3E43E				;$B3E3F4   |
	RTS					;$B3E3F6  /

CODE_B3E3F7:
	LDA $0919				;$B3E3F7  \
	EOR $091B				;$B3E3FA   |
	AND #$0001				;$B3E3FD   |
	EOR $091B				;$B3E400   |
	STA $091B				;$B3E403   |
	LSR A					;$B3E406   |
	BCS CODE_B3E413				;$B3E407   |
	LDA #$0010				;$B3E409   |
	TRB $0B02				;$B3E40C   |
	JSR CODE_B3E4C1				;$B3E40F   |
	RTS					;$B3E412  /

CODE_B3E413:
	LDA #$0010				;$B3E413  \
	TSB $0B02				;$B3E416   |
	LDA $091B				;$B3E419   |
	AND #$FCFF				;$B3E41C   |
	ORA #$0300				;$B3E41F   |
	STA $091B				;$B3E422   |
	JSL CODE_BB8C19				;$B3E425   |
	LDA #$0025				;$B3E429   |
	JSL CODE_B8D8BA				;$B3E42C   |
	BCS CODE_B3E43D				;$B3E430   |
	LDX $0593				;$B3E432   |
	LDA $12,x				;$B3E435   |
	AND #$4000				;$B3E437   |
	STA $0A86				;$B3E43A   |
CODE_B3E43D:					;	   |
	RTS					;$B3E43D  /

CODE_B3E43E:
	LDA $0919				;$B3E43E  \
	EOR $091B				;$B3E441   |
	AND #$0002				;$B3E444   |
	EOR $091B				;$B3E447   |
	STA $091B				;$B3E44A   |
	LSR A					;$B3E44D   |
	LSR A					;$B3E44E   |
	BCS CODE_B3E45B				;$B3E44F   |
	LDA #$0020				;$B3E451   |
	TRB $0B02				;$B3E454   |
	JSR CODE_B3E4C1				;$B3E457   |
	RTS					;$B3E45A  /

CODE_B3E45B:
	LDA #$0020				;$B3E45B  \
	TSB $0B02				;$B3E45E   |
	STZ $0927				;$B3E461   |
	LDA $091B				;$B3E464   |
	AND #$FCFF				;$B3E467   |
	ORA #$0200				;$B3E46A   |
	STA $091B				;$B3E46D   |
	JSL CODE_BB8C19				;$B3E470   |
	LDA #$0025				;$B3E474   |
	JSL CODE_B8D8BA				;$B3E477   |
	BCS CODE_B3E488				;$B3E47B   |
	LDX $0593				;$B3E47D   |
	LDA $12,x				;$B3E480   |
	AND #$4000				;$B3E482   |
	STA $0A86				;$B3E485   |
CODE_B3E488:					;	   |
	RTS					;$B3E488  /

CODE_B3E489:
	LDA $091B				;$B3E489  \
	AND #$F000				;$B3E48C   |
	BNE CODE_B3E492				;$B3E48F   |
	RTS					;$B3E491  /

CODE_B3E492:
	LDA global_frame_counter		;$B3E492  \
	AND #$0003				;$B3E494   |
	BEQ CODE_B3E49A				;$B3E497   |
	RTS					;$B3E499  /

CODE_B3E49A:
	LDA $091B				;$B3E49A  \
	SEC					;$B3E49D   |
	SBC #$1000				;$B3E49E   |
	STA $091B				;$B3E4A1   |
	BCC CODE_B3E4B9				;$B3E4A4   |
	LDA $091B				;$B3E4A6   |
	LSR A					;$B3E4A9   |
	LSR A					;$B3E4AA   |
	AND #$0300				;$B3E4AB   |
	EOR $091B				;$B3E4AE   |
	STA $091B				;$B3E4B1   |
	JSL CODE_BB8C19				;$B3E4B4   |
	RTS					;$B3E4B8  /

CODE_B3E4B9:
	STZ $091B				;$B3E4B9  \
	JSL CODE_BB8C19				;$B3E4BC   |
	RTS					;$B3E4C0  /

CODE_B3E4C1:
	LDA $091B				;$B3E4C1  \
	ASL A					;$B3E4C4   |
	ASL A					;$B3E4C5   |
	EOR $091B				;$B3E4C6   |
	AND #$0C00				;$B3E4C9   |
	EOR $091B				;$B3E4CC   |
	AND #$0FFF				;$B3E4CF   |
	ORA #$F000				;$B3E4D2   |
	STA $091B				;$B3E4D5   |
	RTS					;$B3E4D8  /

CODE_B3E4D9:
	LDY current_sprite			;$B3E4D9  \
	LDA $002E,y				;$B3E4DB   |
	ASL A					;$B3E4DE   |
	TAX					;$B3E4DF   |
	JMP (DATA_B3E4E3,x)			;$B3E4E0  /

DATA_B3E4E3:
	dw CODE_B3E4E9
	dw CODE_B3E507
	dw CODE_B3E55B

CODE_B3E4E9:
	LDX current_sprite			;$B3E4E9  \
	LDA $42,x				;$B3E4EB   |
	CMP $08A6				;$B3E4ED   |
	BEQ CODE_B3E4F7				;$B3E4F0   |
	INC $2E,x				;$B3E4F2   |
	JMP CODE_B3D916				;$B3E4F4  /

CODE_B3E4F7:
	LDA #$0002				;$B3E4F7  \
	STA $2E,x				;$B3E4FA   |
	LDA #$003C				;$B3E4FC   |
	STA $44,x				;$B3E4FF   |
	JSR CODE_B3E5BC				;$B3E501   |
	JMP CODE_B3D916				;$B3E504  /

CODE_B3E507:
	JSL CODE_BCFB58				;$B3E507  \
	LDA #$0000				;$B3E50B   |
	JSL CODE_BEBE6D				;$B3E50E   |
	BCS CODE_B3E51B				;$B3E512   |
	JSL CODE_B9D100				;$B3E514   |
	JMP CODE_B3D916				;$B3E518  /

CODE_B3E51B:
	LDX current_sprite			;$B3E51B  \
	LDA $42,x				;$B3E51D   |
	STA $08A6				;$B3E51F   |
	LDA #$0001				;$B3E522   |
	STA $08AA				;$B3E525   |
	LDA $0902				;$B3E528   |
	STA $08B2				;$B3E52B   |
	LDA level_number			;$B3E52E   |
	STA $08AC				;$B3E530   |
	LDA $08A8				;$B3E533   |
	STA $08B0				;$B3E536   |
	STZ $08AE				;$B3E539   |
	LDA current_player_mount		;$B3E53C   |
	BNE CODE_B3E545				;$B3E53E   |
	LDA $6E					;$B3E540   |
	STA $08AE				;$B3E542   |
CODE_B3E545:					;	   |
	LDX current_sprite			;$B3E545   |
	LDA $00,x				;$B3E547   |
	JSL CODE_BB82B8				;$B3E549   |
	JSL CODE_B3975C				;$B3E54D   |
	LDA #$051A				;$B3E551   |
	JSL queue_sound_effect			;$B3E554   |
	JML [$05A9]				;$B3E558  /

CODE_B3E55B:
	LDX current_sprite			;$B3E55B  \
	LDA $5C,x				;$B3E55D   |
	JSR CODE_B3ED5C				;$B3E55F   |
	LDX current_sprite			;$B3E562   |
	DEC $44,x				;$B3E564   |
	BMI CODE_B3E570				;$B3E566   |
	LDA $44,x				;$B3E568   |
	JSR CODE_B3E634				;$B3E56A   |
	JML [$05A9]				;$B3E56D  /

CODE_B3E570:
	LDX current_sprite			;$B3E570  \
	LDA $42,x				;$B3E572   |
	STA $08A6				;$B3E574   |
	JSR CODE_B3E58C				;$B3E577   |
	JSL CODE_BB82B8				;$B3E57A   |
	JSL CODE_B3975C				;$B3E57E   |
	LDA #$051A				;$B3E582   |
	JSL queue_sound_effect			;$B3E585   |
	JML [$05A9]				;$B3E589  /

CODE_B3E58C:
	LDY $0593				;$B3E58C  \
	LDX current_sprite			;$B3E58F   |
	LDA $46,x				;$B3E591   |
	STA $002E,y				;$B3E593   |
	PHY					;$B3E596   |
	JSR CODE_B3E5AD				;$B3E597   |
	PLY					;$B3E59A   |
	LDA $08C2				;$B3E59B   |
	AND #$4000				;$B3E59E   |
	BNE CODE_B3E5A4				;$B3E5A1   |
	RTS					;$B3E5A3  /

CODE_B3E5A4:
	LDY $0597				;$B3E5A4  \
	LDA $48,x				;$B3E5A7   |
	STA $002E,y				;$B3E5A9   |
	RTS					;$B3E5AC  /

CODE_B3E5AD:
	LDY $0595				;$B3E5AD  \
	LDA current_player_mount		;$B3E5B0   |
	BEQ CODE_B3E5BB				;$B3E5B2   |
	TAY					;$B3E5B4   |
	LDA #$0001				;$B3E5B5   |
	STA $002E,y				;$B3E5B8   |
CODE_B3E5BB:					;	   |
	RTS					;$B3E5BB  /

CODE_B3E5BC:
	LDY $0593				;$B3E5BC  \
	LDX current_sprite			;$B3E5BF   |
	LDA $06,x				;$B3E5C1   |
	STA $0006,y				;$B3E5C3   |
	LDA $0A,x				;$B3E5C6   |
	CLC					;$B3E5C8   |
	ADC #$0008				;$B3E5C9   |
	STA $000A,y				;$B3E5CC   |
	LDA #$0000				;$B3E5CF   |
	STA $0020,y				;$B3E5D2   |
	STA $0024,y				;$B3E5D5   |
	STA $001A,y				;$B3E5D8   |
	STA $0016,y				;$B3E5DB   |
	STA $0038,y				;$B3E5DE   |
	LDA $002E,y				;$B3E5E1   |
	STA $46,x				;$B3E5E4   |
	LDA #$0013				;$B3E5E6   |
	STA $002E,y				;$B3E5E9   |
	PHY					;$B3E5EC   |
	JSR CODE_B3E615				;$B3E5ED   |
	PLY					;$B3E5F0   |
	LDA $08C2				;$B3E5F1   |
	AND #$4000				;$B3E5F4   |
	BNE CODE_B3E5FA				;$B3E5F7   |
	RTS					;$B3E5F9  /

CODE_B3E5FA:
	LDY $0597				;$B3E5FA  \
	LDA $002E,y				;$B3E5FD   |
	STA $48,x				;$B3E600   |
	LDA #$0013				;$B3E602   |
	STA $002E,y				;$B3E605   |
	LDA #$0000				;$B3E608   |
	STA $001A,y				;$B3E60B   |
	STA $0016,y				;$B3E60E   |
	STA $0038,y				;$B3E611   |
	RTS					;$B3E614  /

CODE_B3E615:
	LDY $0595				;$B3E615  \
	LDA current_player_mount		;$B3E618   |
	BNE CODE_B3E61D				;$B3E61A   |
	RTS					;$B3E61C  /

CODE_B3E61D:
	TAY					;$B3E61D  \
	LDA #$0000				;$B3E61E   |
	STA $001A,y				;$B3E621   |
	STA $0016,y				;$B3E624   |
	STA $0038,y				;$B3E627   |
	STA $003A,y				;$B3E62A   |
	LDA #$0007				;$B3E62D   |
	STA $002E,y				;$B3E630   |
	RTS					;$B3E633  /

CODE_B3E634:
	TAY					;$B3E634  \
	LDA global_frame_counter		;$B3E635   |
	LSR A					;$B3E637   |
	BCS CODE_B3E649				;$B3E638   |
	CPY #$0006				;$B3E63A   |
	BMI CODE_B3E654				;$B3E63D   |
	CPY #$0012				;$B3E63F   |
	BMI CODE_B3E64F				;$B3E642   |
	CPY #$0030				;$B3E644   |
	BMI CODE_B3E64A				;$B3E647   |
CODE_B3E649:					;	   |
	RTS					;$B3E649  /

CODE_B3E64A:
	LDA #$0001				;$B3E64A  \
	BRA CODE_B3E657				;$B3E64D  /

CODE_B3E64F:
	LDA #$0004				;$B3E64F  \
	BRA CODE_B3E657				;$B3E652  /

CODE_B3E654:
	LDA #$0008				;$B3E654  \
CODE_B3E657:					;	   |
	EOR $06,x				;$B3E657   |
	STA $06,x				;$B3E659   |
	RTS					;$B3E65B  /

CODE_B3E65C:
	LDX current_sprite			;$B3E65C  \
	LDA $2A,x				;$B3E65E   |
	AND #$0800				;$B3E660   |
	BEQ CODE_B3E67F				;$B3E663   |
	LDA global_frame_counter		;$B3E665   |
	AND #$000F				;$B3E667   |
	BNE CODE_B3E67F				;$B3E66A   |
	LDA global_frame_counter		;$B3E66C   |
	AND #$0010				;$B3E66E   |
	BNE CODE_B3E678				;$B3E671   |
	LDA #$000A				;$B3E673   |
	BRA CODE_B3E67B				;$B3E676  /

CODE_B3E678:
	LDA #$0015				;$B3E678  \
CODE_B3E67B:					;	   |
	JSL CODE_BB8C44				;$B3E67B   |
CODE_B3E67F:					;	   |
	JMP CODE_B3E768				;$B3E67F  /

CODE_B3E682:
	PHK					;$B3E682  \
	PLB					;$B3E683   |
	LDX current_sprite			;$B3E684   |
	LDA $2E,x				;$B3E686   |
	ASL A					;$B3E688   |
	TAX					;$B3E689   |
	JMP (DATA_B3E68D,x)			;$B3E68A  /

DATA_B3E68D:
	dw CODE_B3E691
	dw CODE_B3E6B3


CODE_B3E691:
	JSR CODE_B3E6EF				;$B3E691  \
	BCS CODE_B3E6AC				;$B3E694   |
	JSR CODE_B3E74B				;$B3E696   |
	LDX current_sprite			;$B3E699   |
	INC $2E,x				;$B3E69B   |
	STZ $44,x				;$B3E69D   |
	LDA $4E,x				;$B3E69F   |
	AND #$00FF				;$B3E6A1   |
	STA $4C,x				;$B3E6A4   |
	JSR CODE_B3E72C				;$B3E6A6   |
	JML [$05A9]				;$B3E6A9  /

CODE_B3E6AC:
	JSL CODE_BB82B8				;$B3E6AC  \
	JML [$05A9]				;$B3E6B0  /

CODE_B3E6B3:
	JSR CODE_B3E6EF				;$B3E6B3  \
	BCS CODE_B3E6AC				;$B3E6B6   |
	JSR CODE_B3E74B				;$B3E6B8   |
	JSR CODE_B3E6C4				;$B3E6BB   |
	JSR CODE_B3E72C				;$B3E6BE   |
	JML [$05A9]				;$B3E6C1  /

CODE_B3E6C4:
	LDX current_sprite			;$B3E6C4  \
	LDA $2A,x				;$B3E6C6   |
	AND #$1000				;$B3E6C8   |
	BNE CODE_B3E6D3				;$B3E6CB   |
	LDA $4C,x				;$B3E6CD   |
	BEQ CODE_B3E6D4				;$B3E6CF   |
	DEC $4C,x				;$B3E6D1   |
CODE_B3E6D3:					;	   |
	RTS					;$B3E6D3  /

CODE_B3E6D4:
	LDA $44,x				;$B3E6D4  \
	EOR #$0001				;$B3E6D6   |
	STA $44,x				;$B3E6D9   |
	AND #$0001				;$B3E6DB   |
	BNE CODE_B3E6EA				;$B3E6DE   |
	LDA $4E,x				;$B3E6E0   |
CODE_B3E6E2:					;	   |
	AND #$00FF				;$B3E6E2   |
	BEQ CODE_B3E6D3				;$B3E6E5   |
	STA $4C,x				;$B3E6E7   |
	RTS					;$B3E6E9  /

CODE_B3E6EA:
	LDA $4E,x				;$B3E6EA  \
	XBA					;$B3E6EC   |
	BRA CODE_B3E6E2				;$B3E6ED  /

CODE_B3E6EF:
	LDX current_sprite			;$B3E6EF  \
	LDY $42,x				;$B3E6F1   |
	LDA $0000,y				;$B3E6F3   |
	CMP #$0140				;$B3E6F6   |
	BNE CODE_B3E72A				;$B3E6F9   |
	LDA $003C,y				;$B3E6FB   |
	CMP current_sprite			;$B3E6FE   |
	BNE CODE_B3E72A				;$B3E700   |
	LDA $002A,y				;$B3E702   |
	STA $2A,x				;$B3E705   |
	AND #$1000				;$B3E707   |
	BNE CODE_B3E718				;$B3E70A   |
CODE_B3E70C:					;	   |
	LDA $0006,y				;$B3E70C   |
	STA $06,x				;$B3E70F   |
	LDA $000A,y				;$B3E711   |
	STA $0A,x				;$B3E714   |
	CLC					;$B3E716   |
	RTS					;$B3E717  /

CODE_B3E718:
	PHY					;$B3E718  \
	LDY $0593				;$B3E719   |
	LDA $002E,y				;$B3E71C   |
	PLY					;$B3E71F   |
	CMP #$0011				;$B3E720   |
	BNE CODE_B3E70C				;$B3E723   |
	LDY $0593				;$B3E725   |
	BRA CODE_B3E70C				;$B3E728  /

CODE_B3E72A:
	SEC					;$B3E72A  \
	RTS					;$B3E72B  /

CODE_B3E72C:
	LDX current_sprite			;$B3E72C  \
	LDY $42,x				;$B3E72E   |
	LDA $0044,y				;$B3E730   |
	BEQ CODE_B3E741				;$B3E733   |
	LDA $44,x				;$B3E735   |
	LSR A					;$B3E737   |
	BCS CODE_B3E746				;$B3E738   |
	LDA $2A,x				;$B3E73A   |
	AND #$1000				;$B3E73C   |
	BNE CODE_B3E746				;$B3E73F   |
CODE_B3E741:					;	   |
	LDA $48,x				;$B3E741   |
	STA $1A,x				;$B3E743   |
	RTS					;$B3E745  /

CODE_B3E746:
	LDA $4A,x				;$B3E746  \
	STA $1A,x				;$B3E748   |
	RTS					;$B3E74A  /

CODE_B3E74B:
	LDA #$0000				;$B3E74B  \
	LDX current_sprite			;$B3E74E   |
	LDY $42,x				;$B3E750   |
	LDA $0044,y				;$B3E752   |
	XBA					;$B3E755   |
	AND #$0007				;$B3E756   |
	BEQ CODE_B3E765				;$B3E759   |
	DEC A					;$B3E75B   |
	ASL A					;$B3E75C   |
	ASL A					;$B3E75D   |
	CLC					;$B3E75E   |
	ADC #$10D0				;$B3E75F   |
	STA $4A,x				;$B3E762   |
	RTS					;$B3E764  /

CODE_B3E765:
	STZ $4A,x				;$B3E765  \
	RTS					;$B3E767  /

CODE_B3E768:
	LDX current_sprite			;$B3E768  \
	LDA $2E,x				;$B3E76A   |
	ASL A					;$B3E76C   |
	TAX					;$B3E76D   |
	JMP (DATA_B3E771,x)			;$B3E76E  /

DATA_B3E771:
	dw CODE_B3E78F
	dw CODE_B3E8DD
	dw CODE_B3E917
	dw CODE_B3E979
	dw CODE_B3E9C5
	dw CODE_B3EACE
	dw CODE_B3EAF5
	dw CODE_B3EB2E
	dw CODE_B3EB34
	dw CODE_B3EB84
	dw CODE_B3EBD8
	dw CODE_B3EC1A
	dw CODE_B3EC3C
	dw CODE_B3EC61
	dw CODE_B3EC72


CODE_B3E78F:
	LDX current_sprite			;$B3E78F  \
	LDA $06,x				;$B3E791   |
	STA $04,x				;$B3E793   |
	LDA $0A,x				;$B3E795   |
	STA $08,x				;$B3E797   |
	LDA $46,x				;$B3E799   |
	AND #$0080				;$B3E79B   |
	BEQ CODE_B3E7BA				;$B3E79E   |
	LDA $4C,x				;$B3E7A0   |
	STA $32					;$B3E7A2   |
	LDA $46,x				;$B3E7A4   |
	AND #$0200				;$B3E7A6   |
	BEQ CODE_B3E7B3				;$B3E7A9   |
	LDA $32					;$B3E7AB   |
	EOR #$FFFF				;$B3E7AD   |
	INC A					;$B3E7B0   |
	STA $32					;$B3E7B1   |
CODE_B3E7B3:					;	   |
	LDA $04,x				;$B3E7B3   |
	SEC					;$B3E7B5   |
	SBC $32					;$B3E7B6   |
	STA $04,x				;$B3E7B8   |
CODE_B3E7BA:					;	   |
	LDA $46,x				;$B3E7BA   |
	AND #$0100				;$B3E7BC   |
	BEQ CODE_B3E7DB				;$B3E7BF   |
	LDA $4C,x				;$B3E7C1   |
	STA $32					;$B3E7C3   |
	LDA $46,x				;$B3E7C5   |
	AND #$0400				;$B3E7C7   |
	BEQ CODE_B3E7D4				;$B3E7CA   |
	LDA $32					;$B3E7CC   |
	EOR #$FFFF				;$B3E7CE   |
	INC A					;$B3E7D1   |
	STA $32					;$B3E7D2   |
CODE_B3E7D4:					;	   |
	LDA $08,x				;$B3E7D4   |
	SEC					;$B3E7D6   |
	SBC $32					;$B3E7D7   |
	STA $08,x				;$B3E7D9   |
CODE_B3E7DB:					;	   |
	LDA $42,x				;$B3E7DB   |
	XBA					;$B3E7DD   |
	AND #$FF00				;$B3E7DE   |
	STA $48,x				;$B3E7E1   |
	STZ $4A,x				;$B3E7E3   |
	LDA $46,x				;$B3E7E5   |
	AND #$1010				;$B3E7E7   |
	BNE CODE_B3E7F3				;$B3E7EA   |
	LDA $2C,x				;$B3E7EC   |
	AND #$00FF				;$B3E7EE   |
	STA $2C,x				;$B3E7F1   |
CODE_B3E7F3:					;	   |
	JSR CODE_B3EC87				;$B3E7F3   |
	INC $2E,x				;$B3E7F6   |
	LDA $46,x				;$B3E7F8   |
	AND #$0020				;$B3E7FA   |
	ASL A					;$B3E7FD   |
	XBA					;$B3E7FE   |
	STA $2A,x				;$B3E7FF   |
	LDA $00,x				;$B3E801   |
	CMP #$013C				;$B3E803   |
	BEQ CODE_B3E80F				;$B3E806   |
	LDA #$0800				;$B3E808   |
	ORA $2A,x				;$B3E80B   |
	STA $2A,x				;$B3E80D   |
CODE_B3E80F:					;	   |
	LDA $46,x				;$B3E80F   |
	AND #$0008				;$B3E811   |
	BEQ CODE_B3E81B				;$B3E814   |
	LDA #$C000				;$B3E816   |
	STA $1C,x				;$B3E819   |
CODE_B3E81B:					;	   |
	JSR CODE_B3F2A6				;$B3E81B   |
	LDX current_sprite			;$B3E81E   |
	STZ $3C,x				;$B3E820   |
	LDA $46,x				;$B3E822   |
	AND #$0008				;$B3E824   |
	BNE CODE_B3E83A				;$B3E827   |
	LDA $46,x				;$B3E829   |
	AND #$B013				;$B3E82B   |
	BEQ CODE_B3E83A				;$B3E82E   |
	AND #$2000				;$B3E830   |
	BEQ CODE_B3E83D				;$B3E833   |
	LDY #$0046				;$B3E835   |
	BRA CODE_B3E866				;$B3E838  /

CODE_B3E83A:
	BRL CODE_B3E8D0				;$B3E83A  /

CODE_B3E83D:
	LDA $46,x				;$B3E83D  \
	AND #$8000				;$B3E83F   |
	BEQ CODE_B3E85C				;$B3E842   |
	LDA $26,x				;$B3E844   |
	ASL A					;$B3E846   |
	TAX					;$B3E847   |
	LDA.l DATA_FF11BE,x			;$B3E848   |
	TAY					;$B3E84C   |
	BRA CODE_B3E866				;$B3E84D  /

CODE_B3E84F:
	LDY #$012A				;$B3E84F  \
	AND #$0001				;$B3E852   |
	BNE CODE_B3E866				;$B3E855   |
	LDY #$0128				;$B3E857   |
	BRA CODE_B3E866				;$B3E85A  /

CODE_B3E85C:
	LDA $46,x				;$B3E85C  \
	AND #$0003				;$B3E85E   |
	BNE CODE_B3E84F				;$B3E861   |
	LDY #$0044				;$B3E863   |
CODE_B3E866:					;	   |
	JSL CODE_BB842C				;$B3E866   |
	BCS CODE_B3E8D0				;$B3E86A   |
	LDY alternate_sprite			;$B3E86C   |
	LDX current_sprite			;$B3E86E   |
	TYA					;$B3E870   |
	STA $3C,x				;$B3E871   |
	TXA					;$B3E873   |
	STA $0042,y				;$B3E874   |
	LDA $46,x				;$B3E877   |
	STA $0046,y				;$B3E879   |
	AND #$0010				;$B3E87C   |
	BEQ CODE_B3E88D				;$B3E87F   |
	INC $02,x				;$B3E881   |
	INC $02,x				;$B3E883   |
	LDA $0002,y				;$B3E885   |
	INC A					;$B3E888   |
	INC A					;$B3E889   |
	STA $0002,y				;$B3E88A   |
CODE_B3E88D:					;	   |
	STZ $32					;$B3E88D   |
	LDA $46,x				;$B3E88F   |
	AND #$8000				;$B3E891   |
	BNE CODE_B3E8D3				;$B3E894   |
	LDA $46,x				;$B3E896   |
	AND #$0010				;$B3E898   |
	BNE CODE_B3E8BC				;$B3E89B   |
	INC $32					;$B3E89D   |
	LDA $46,x				;$B3E89F   |
	AND #$1000				;$B3E8A1   |
	BNE CODE_B3E8BC				;$B3E8A4   |
	INC $32					;$B3E8A6   |
	LDA $46,x				;$B3E8A8   |
	AND #$2000				;$B3E8AA   |
	BNE CODE_B3E8BC				;$B3E8AD   |
	INC $32					;$B3E8AF   |
	LDA $46,x				;$B3E8B1   |
	AND #$0003				;$B3E8B3   |
	DEC A					;$B3E8B6   |
	CLC					;$B3E8B7   |
	ADC $32					;$B3E8B8   |
	STA $32					;$B3E8BA   |
CODE_B3E8BC:					;	   |
	LDA $32					;$B3E8BC   |
	ASL A					;$B3E8BE   |
	ASL A					;$B3E8BF   |
	CLC					;$B3E8C0   |
	ADC #$3168				;$B3E8C1   |
CODE_B3E8C4:					;	   |
	STA $001A,y				;$B3E8C4   |
	STA $0048,y				;$B3E8C7   |
	LDA #$0000				;$B3E8CA   |
	STA $004A,y				;$B3E8CD   |
CODE_B3E8D0:					;	   |
	JML [$05A9]				;$B3E8D0  /

CODE_B3E8D3:
	LDA $26,x				;$B3E8D3  \
	ASL A					;$B3E8D5   |
	ASL A					;$B3E8D6   |
	CLC					;$B3E8D7   |
	ADC #$1A98				;$B3E8D8   |
	BRA CODE_B3E8C4				;$B3E8DB  /

CODE_B3E8DD:
	LDX current_sprite			;$B3E8DD  \
	LDA $32,x				;$B3E8DF   |
	BEQ CODE_B3E8FF				;$B3E8E1   |
	STZ $32,x				;$B3E8E3   |
	CMP #$0008				;$B3E8E5   |
	BNE CODE_B3E8FF				;$B3E8E8   |
	LDA $2A,x				;$B3E8EA   |
	ORA #$0800				;$B3E8EC   |
	STA $2A,x				;$B3E8EF   |
	LDA #$054A				;$B3E8F1   |
	JSL queue_sound_effect			;$B3E8F4   |
	LDX current_sprite			;$B3E8F8   |
	LDA #$00EC				;$B3E8FA   |
	STA $02,x				;$B3E8FD   |
CODE_B3E8FF:					;	   |
	JSR CODE_B3F33E				;$B3E8FF   |
	JSR CODE_B3EEB9				;$B3E902   |
	BCS CODE_B3E914				;$B3E905   |
	LDX $0597				;$B3E907   |
	LDA $2E,x				;$B3E90A   |
	CMP #$002F				;$B3E90C   |
	BEQ CODE_B3E914				;$B3E90F   |
	JMP CODE_B3D916				;$B3E911  /

CODE_B3E914:
	JML [$05A9]				;$B3E914  /

CODE_B3E917:
	JSR CODE_B3F05F				;$B3E917  \
	JSR CODE_B3F33E				;$B3E91A   |
	JSR CODE_B3F2A6				;$B3E91D   |
	LDX $0593				;$B3E920   |
	LDA $2E,x				;$B3E923   |
	CMP #$0011				;$B3E925   |
	BEQ CODE_B3E92D				;$B3E928   |
	BRL CODE_B3EBAA				;$B3E92A  /

CODE_B3E92D:
	JSR CODE_B3F14C				;$B3E92D  \
	LDX current_sprite			;$B3E930   |
	DEC $38,x				;$B3E932   |
	BMI CODE_B3E939				;$B3E934   |
	JML [$05A9]				;$B3E936  /

CODE_B3E939:
	LDA $46,x				;$B3E939  \
	AND #$8000				;$B3E93B   |
	BNE CODE_B3E956				;$B3E93E   |
	LDA $46,x				;$B3E940   |
	AND #$0804				;$B3E942   |
	BNE CODE_B3E974				;$B3E945   |
	LDA $42,x				;$B3E947   |
	XBA					;$B3E949   |
	CMP $42,x				;$B3E94A   |
	BEQ CODE_B3E969				;$B3E94C   |
	LDA #$000A				;$B3E94E   |
	STA $2E,x				;$B3E951   |
	JML [$05A9]				;$B3E953  /

CODE_B3E956:
	LDA #$0040				;$B3E956  \
	STA $3A,x				;$B3E959   |
	LDA #$000C				;$B3E95B   |
	STA $2E,x				;$B3E95E   |
	LDA #$0000				;$B3E960   |
	JSR CODE_B3F111				;$B3E963   |
	JML [$05A9]				;$B3E966  /

CODE_B3E969:
	JSR CODE_B3ED2C				;$B3E969  \
	LDA #$0008				;$B3E96C   |
	STA $2E,x				;$B3E96F   |
	JML [$05A9]				;$B3E971  /

CODE_B3E974:
	INC $2E,x				;$B3E974  \
	JML [$05A9]				;$B3E976  /

CODE_B3E979:
	JSR CODE_B3F05F				;$B3E979  \
	JSR CODE_B3ECE7				;$B3E97C   |
	BCC CODE_B3E985				;$B3E97F   |
	LDA $50,x				;$B3E981   |
	BNE CODE_B3E9A3				;$B3E983   |
CODE_B3E985:					;	   |
	LDX $0593				;$B3E985   |
	LDA $2E,x				;$B3E988   |
	CMP #$0011				;$B3E98A   |
	BEQ CODE_B3E992				;$B3E98D   |
	BRL CODE_B3EBAA				;$B3E98F  /

CODE_B3E992:
	JSR CODE_B3F33E				;$B3E992  \
	JSR CODE_B3EE67				;$B3E995   |
	BCS CODE_B3E9A3				;$B3E998   |
	JSR CODE_B3F2A6				;$B3E99A   |
	JSR CODE_B3F14C				;$B3E99D   |
	JML [$05A9]				;$B3E9A0  /

CODE_B3E9A3:
	JSR CODE_B3F2A6				;$B3E9A3  \
	JSR CODE_B3F14C				;$B3E9A6   |
	JSR CODE_B3ED2C				;$B3E9A9   |
	LDA $46,x				;$B3E9AC   |
	AND #$0004				;$B3E9AE   |
	BNE CODE_B3E9BB				;$B3E9B1   |
	LDA #$0009				;$B3E9B3   |
	STA $2E,x				;$B3E9B6   |
	JML [$05A9]				;$B3E9B8  /

CODE_B3E9BB:
	LDA #$0012				;$B3E9BB  \
	STA $38,x				;$B3E9BE   |
	INC $2E,x				;$B3E9C0   |
	JML [$05A9]				;$B3E9C2  /

CODE_B3E9C5:
	JSR CODE_B3F05F				;$B3E9C5  \
	JSR CODE_B3F33E				;$B3E9C8   |
	LDX $0593				;$B3E9CB   |
	LDA $2E,x				;$B3E9CE   |
	CMP #$0011				;$B3E9D0   |
	BEQ CODE_B3E9D8				;$B3E9D3   |
	BRL CODE_B3EBAA				;$B3E9D5  /

CODE_B3E9D8:
	JSR CODE_B3F14C				;$B3E9D8  \
	LDX current_sprite			;$B3E9DB   |
	DEC $38,x				;$B3E9DD   |
	BMI CODE_B3E9E4				;$B3E9DF   |
	JML [$05A9]				;$B3E9E1  /

CODE_B3E9E4:
	LDX current_sprite			;$B3E9E4  \
	INC $2E,x				;$B3E9E6   |
	LDA #$0014				;$B3E9E8   |
	STA $38,x				;$B3E9EB   |
	LDA $2A,x				;$B3E9ED   |
	AND #$EFFF				;$B3E9EF   |
	STA $2A,x				;$B3E9F2   |
	LDA $46,x				;$B3E9F4   |
	AND #$8000				;$B3E9F6   |
	BEQ CODE_B3EA29				;$B3E9F9   |
	STZ $0D7A				;$B3E9FB   |
	LDA $26,x				;$B3E9FE   |
	ASL A					;$B3EA00   |
	TAY					;$B3EA01   |
	ASL A					;$B3EA02   |
	CLC					;$B3EA03   |
	ADC #$0190				;$B3EA04   |
	STA $6E					;$B3EA07   |
	STZ current_player_mount		;$B3EA09   |
	PHK					;$B3EA0B   |
	PLB					;$B3EA0C   |
if !version == 1				;	   |
	PHX					;$B3EA0D   |
	LDX $0593				;$B3EA0E   |
	LDA DATA_B3ED52,y			;$B3EA11   |
else						;	   |
	LDA DATA_B3ED52,y			;$B3EA0D   |
	PHX                             	;$B3EA0E   |
	LDX $0593                       	;$B3EA11   |
endif						;	   |
	JSL CODE_BB8C44				;$B3EA14   |
	LDA $08C2				;$B3EA18   |
	AND #$4000				;$B3EA1B   |
	BEQ CODE_B3EA24				;$B3EA1E   |
	JSL CODE_B39118				;$B3EA20   |
CODE_B3EA24:					;	   |
	JSL CODE_B5E43E				;$B3EA24   |
	PLX					;$B3EA28   |
CODE_B3EA29:					;	   |
	LDY $0593				;$B3EA29   |
	LDA $46,x				;$B3EA2C   |
	AND #$2000				;$B3EA2E   |
	BNE CODE_B3EA84				;$B3EA31   |
	LDA #$0000				;$B3EA33   |
	STA $0048,y				;$B3EA36   |
CODE_B3EA39:					;	   |
	LDA $20,x				;$B3EA39   |
	STA $0042,y				;$B3EA3B   |
	LDA $24,x				;$B3EA3E   |
	STA $0044,y				;$B3EA40   |
	LDA $46,x				;$B3EA43   |
	ROL A					;$B3EA45   |
	ROL A					;$B3EA46   |
	ROL A					;$B3EA47   |
	AND #$0001				;$B3EA48   |
	STA $004E,y				;$B3EA4B   |
if !version == 0				;	   |
	LDA $0A3C				;$B3EA4E   |
	AND #$FF7F				;$B3EA51   |
	STA $0030,y				;$B3EA54   |
else						;	   |
	JSR CODE_B3EAB6				;$B3EA4E   |
endif						;	   |
	PHY					;$B3EA51   |
	LDA #$051A				;$B3EA52   |
	JSL queue_sound_effect			;$B3EA55   |
	PLY					;$B3EA59   |
	LDA #$0000				;$B3EA5A   |
	STA $001C,y				;$B3EA5D   |
	JSR CODE_B3F15C				;$B3EA60   |
	JSR CODE_B3EC94				;$B3EA63   |
	JSR CODE_B3F2A6				;$B3EA66   |
	JSR CODE_B3F1F3				;$B3EA69   |
	LDX current_sprite			;$B3EA6C   |
	LDA $5C,x				;$B3EA6E   |
	JSR CODE_B3ED5C				;$B3EA70   |
	LDA $46,x				;$B3EA73   |
	AND #$8000				;$B3EA75   |
	BNE CODE_B3EAAB				;$B3EA78   |
	LDA $12,x				;$B3EA7A   |
	AND #$3000				;$B3EA7C   |
	BEQ CODE_B3EAAF				;$B3EA7F   |
	JML [$05A9]				;$B3EA81  /

CODE_B3EA84:
	LDA #$0001				;$B3EA84  \
	STA $0048,y				;$B3EA87   |
	LDA $26,x				;$B3EA8A   |
	PHA					;$B3EA8C   |
	AND #$00FF				;$B3EA8D   |
	STA $004C,y				;$B3EA90   |
	PLA					;$B3EA93   |
	XBA					;$B3EA94   |
	AND #$00FF				;$B3EA95   |
	STA $004A,y				;$B3EA98   |
	PHX					;$B3EA9B   |
	PHY					;$B3EA9C   |
	LDA #$0003				;$B3EA9D   |
	LDY #$0280				;$B3EAA0   |
	JSL CODE_B8D1E4				;$B3EAA3   |
	PLY					;$B3EAA7   |
	PLX					;$B3EAA8   |
	BRA CODE_B3EA39				;$B3EAA9  /

CODE_B3EAAB:
	JSL CODE_B39760				;$B3EAAB  \
CODE_B3EAAF:					;	   |
	JSL CODE_BB82B8				;$B3EAAF   |
	JML [$05A9]				;$B3EAB3  /

if !version == 1				;	  \
CODE_B3EAB6:					;	   |
	LDA $46,x				;$B3EAB6   |
	AND #$2000				;$B3EAB8   |
	BEQ CODE_B3EAC4				;$B3EABB   |
	LDA #$0090				;$B3EABD   |
	STA $0030,y				;$B3EAC0   |
	RTS					;$B3EAC3  /

CODE_B3EAC4:
	LDA $0A3C				;$B3EAC4  \
	AND #$FF7F				;$B3EAC7   |
	STA $0030,y				;$B3EACA   |
	RTS					;$B3EACD   |
endif						;	  /

CODE_B3EACE:
	JSR CODE_B3F33E				;$B3EACE  \
	LDX current_sprite			;$B3EAD1   |
	DEC $38,x				;$B3EAD3   |
	BMI CODE_B3EADA				;$B3EAD5   |
	JMP CODE_B3D916				;$B3EAD7  /

CODE_B3EADA:
	LDA $46,x				;$B3EADA  \
	AND #$0010				;$B3EADC   |
	BEQ CODE_B3EAE8				;$B3EADF   |
	JSL CODE_BBBB44				;$B3EAE1   |
	JML [$05A9]				;$B3EAE5  /

CODE_B3EAE8:
	INC $2E,x				;$B3EAE8  \
	JSR CODE_B3EC87				;$B3EAEA   |
	LDA #$0003				;$B3EAED   |
	STA $38,x				;$B3EAF0   |
	JML [$05A9]				;$B3EAF2  /

CODE_B3EAF5:
	JSR CODE_B3F33E				;$B3EAF5  \
	LDX current_sprite			;$B3EAF8   |
	LDA $3A,x				;$B3EAFA   |
	PHA					;$B3EAFC   |
	LDA #$0C00				;$B3EAFD   |
	STA $3A,x				;$B3EB00   |
	JSR CODE_B3EE60				;$B3EB02   |
	PLA					;$B3EB05   |
	LDX current_sprite			;$B3EB06   |
	STA $3A,x				;$B3EB08   |
	BCS CODE_B3EB12				;$B3EB0A   |
	JSR CODE_B3F2A6				;$B3EB0C   |
	JML [$05A9]				;$B3EB0F  /

CODE_B3EB12:
	JSR CODE_B3F2A6				;$B3EB12  \
	LDX current_sprite			;$B3EB15   |
	LDA #$0001				;$B3EB17   |
	STA $2E,x				;$B3EB1A   |
	LDX current_sprite			;$B3EB1C   |
	LDA $46,x				;$B3EB1E   |
	XBA					;$B3EB20   |
	ASL A					;$B3EB21   |
	EOR $2A,x				;$B3EB22   |
	AND #$4000				;$B3EB24   |
	EOR $2A,x				;$B3EB27   |
	STA $2A,x				;$B3EB29   |
	JML [$05A9]				;$B3EB2B  /

CODE_B3EB2E:
	JSR CODE_B3F05F				;$B3EB2E  \
	JML [$05A9]				;$B3EB31  /

CODE_B3EB34:
	JSR CODE_B3F05F				;$B3EB34  \
	JSR CODE_B3ECE7				;$B3EB37   |
	BCS CODE_B3EB62				;$B3EB3A   |
	JSR CODE_B3ED3B				;$B3EB3C   |
	BCS CODE_B3EB62				;$B3EB3F   |
	LDX $0593				;$B3EB41   |
	LDA $2E,x				;$B3EB44   |
	CMP #$0011				;$B3EB46   |
	BNE CODE_B3EBAA				;$B3EB49   |
	JSR CODE_B3F33E				;$B3EB4B   |
	LDX current_sprite			;$B3EB4E   |
	DEC $38,x				;$B3EB50   |
	BPL CODE_B3EB59				;$B3EB52   |
	INC $38,x				;$B3EB54   |
	JSR CODE_B3ED6E				;$B3EB56   |
CODE_B3EB59:					;	   |
	JSR CODE_B3F2A6				;$B3EB59   |
	JSR CODE_B3F14C				;$B3EB5C   |
	JML [$05A9]				;$B3EB5F  /

CODE_B3EB62:
	LDX current_sprite			;$B3EB62  \
	LDA $48,x				;$B3EB64   |
	CLC					;$B3EB66   |
	ADC #$1000				;$B3EB67   |
	AND #$E000				;$B3EB6A   |
	STA $48,x				;$B3EB6D   |
CODE_B3EB6F:					;	   |
	JSR CODE_B3F2A6				;$B3EB6F   |
	JSR CODE_B3F14C				;$B3EB72   |
	LDX current_sprite			;$B3EB75   |
	LDA #$0004				;$B3EB77   |
	STA $2E,x				;$B3EB7A   |
	LDA #$0001				;$B3EB7C   |
	STA $38,x				;$B3EB7F   |
	JML [$05A9]				;$B3EB81  /

CODE_B3EB84:
	JSR CODE_B3F05F				;$B3EB84  \
	JSR CODE_B3ECE7				;$B3EB87   |
	BCS CODE_B3EB6F				;$B3EB8A   |
	JSR CODE_B3ED3B				;$B3EB8C   |
	BCS CODE_B3EB6F				;$B3EB8F   |
	LDX $0593				;$B3EB91   |
	LDA $2E,x				;$B3EB94   |
	CMP #$0011				;$B3EB96   |
	BNE CODE_B3EBAA				;$B3EB99   |
	JSR CODE_B3F33E				;$B3EB9B   |
	JSR CODE_B3F2A6				;$B3EB9E   |
	JSR CODE_B3EDD4				;$B3EBA1   |
	JSR CODE_B3F14C				;$B3EBA4   |
	JML [$05A9]				;$B3EBA7  /

CODE_B3EBAA:
	LDX current_sprite			;$B3EBAA  \
	LDA $46,x				;$B3EBAC   |
	AND #$1010				;$B3EBAE   |
	BNE CODE_B3EBCE				;$B3EBB1   |
	LDA $44,x				;$B3EBB3   |
	ORA #$00FF				;$B3EBB5   |
	STA $44,x				;$B3EBB8   |
	LDA #$0005				;$B3EBBA   |
	STA $2E,x				;$B3EBBD   |
	LDA #$0020				;$B3EBBF   |
CODE_B3EBC2:					;	   |
	STA $38,x				;$B3EBC2   |
	LDA $2A,x				;$B3EBC4   |
	AND #$EFFF				;$B3EBC6   |
	STA $2A,x				;$B3EBC9   |
	JML [$05A9]				;$B3EBCB  /

CODE_B3EBCE:
	LDA #$000D				;$B3EBCE  \
	STA $2E,x				;$B3EBD1   |
	LDA #$0020				;$B3EBD3   |
	BRA CODE_B3EBC2				;$B3EBD6  /

CODE_B3EBD8:
	JSR CODE_B3F05F				;$B3EBD8  \
	JSR CODE_B3ECE7				;$B3EBDB   |
	BCS CODE_B3EC17				;$B3EBDE   |
	JSR CODE_B3F33E				;$B3EBE0   |
	LDX current_sprite			;$B3EBE3   |
	DEC $38,x				;$B3EBE5   |
	BPL CODE_B3EBF0				;$B3EBE7   |
	INC $38,x				;$B3EBE9   |
	JSR CODE_B3EE67				;$B3EBEB   |
	BCS CODE_B3EBF9				;$B3EBEE   |
CODE_B3EBF0:					;	   |
	JSR CODE_B3F2A6				;$B3EBF0   |
	JSR CODE_B3F14C				;$B3EBF3   |
	JML [$05A9]				;$B3EBF6  /

CODE_B3EBF9:
	JSR CODE_B3F2A6				;$B3EBF9  \
	JSR CODE_B3F14C				;$B3EBFC   |
	JSR CODE_B3ED2C				;$B3EBFF   |
	LDX current_sprite			;$B3EC02   |
	LDA $42,x				;$B3EC04   |
	XBA					;$B3EC06   |
	STA $42,x				;$B3EC07   |
	INC $2E,x				;$B3EC09   |
	LDA $50,x				;$B3EC0B   |
	BNE CODE_B3EC12				;$B3EC0D   |
	LDA #$0004				;$B3EC0F   |
CODE_B3EC12:					;	   |
	STA $38,x				;$B3EC12   |
	JML [$05A9]				;$B3EC14  /

CODE_B3EC17:
	BRL CODE_B3EB6F				;$B3EC17  /

CODE_B3EC1A:
	JSR CODE_B3F05F				;$B3EC1A  \
	JSR CODE_B3ECE7				;$B3EC1D   |
	BCS CODE_B3EC17				;$B3EC20   |
	JSR CODE_B3F33E				;$B3EC22   |
	JSR CODE_B3F2A6				;$B3EC25   |
	JSR CODE_B3F14C				;$B3EC28   |
	LDX current_sprite			;$B3EC2B   |
	DEC $38,x				;$B3EC2D   |
	BMI CODE_B3EC34				;$B3EC2F   |
	JML [$05A9]				;$B3EC31  /

CODE_B3EC34:
	LDA #$000A				;$B3EC34  \
	STA $2E,x				;$B3EC37   |
	JML [$05A9]				;$B3EC39  /

CODE_B3EC3C:
	JSR CODE_B3F05F				;$B3EC3C  \
	LDX current_sprite			;$B3EC3F   |
	LDA global_frame_counter		;$B3EC41   |
	LSR A					;$B3EC43   |
	BCS CODE_B3EC4A				;$B3EC44   |
	DEC $3A,x				;$B3EC46   |
	BMI CODE_B3EC55				;$B3EC48   |
CODE_B3EC4A:					;	   |
	LDA $3A,x				;$B3EC4A   |
	JSR CODE_B3E634				;$B3EC4C   |
	JSR CODE_B3F14C				;$B3EC4F   |
	JML [$05A9]				;$B3EC52  /

CODE_B3EC55:
	STZ $2C,x				;$B3EC55  \
	LDA #$0555				;$B3EC57   |
	JSL queue_sound_effect			;$B3EC5A   |
	BRL CODE_B3E9E4				;$B3EC5E  /

CODE_B3EC61:
	LDX current_sprite			;$B3EC61  \
	DEC $38,x				;$B3EC63   |
	BMI CODE_B3EC6A				;$B3EC65   |
	JML [$05A9]				;$B3EC67  /

CODE_B3EC6A:
	LDA #$0001				;$B3EC6A  \
	STA $2E,x				;$B3EC6D   |
	JML [$05A9]				;$B3EC6F  /

CODE_B3EC72:
	LDX current_sprite			;$B3EC72  \
	LDA $3E,x				;$B3EC74   |
	CMP $08A6				;$B3EC76   |
	BEQ CODE_B3EC82				;$B3EC79   |
	JSL CODE_BB82B8				;$B3EC7B   |
	JML [$05A9]				;$B3EC7F  /

CODE_B3EC82:
	STZ $2E,x				;$B3EC82  \
	BRL CODE_B3E78F				;$B3EC84  /

CODE_B3EC87:
	LDA $2C,x				;$B3EC87  \
	AND #$FF00				;$B3EC89   |
	BEQ CODE_B3EC91				;$B3EC8C   |
	ORA #$00FF				;$B3EC8E   |
CODE_B3EC91:					;	   |
	STA $44,x				;$B3EC91   |
	RTS					;$B3EC93  /

CODE_B3EC94:
	LDY #$0048				;$B3EC94  \
	JSL CODE_BB842C				;$B3EC97   |
	BCC CODE_B3EC9E				;$B3EC9B   |
	RTS					;$B3EC9D  /

CODE_B3EC9E:
	LDX current_sprite			;$B3EC9E  \
	LDA $00,x				;$B3ECA0   |
	CMP #$013C				;$B3ECA2   |
	BEQ CODE_B3ECCF				;$B3ECA5   |
	LDY $0593				;$B3ECA7   |
	LDX alternate_sprite			;$B3ECAA   |
	LDA $0020,y				;$B3ECAC   |
	CMP #$8000				;$B3ECAF   |
	ROR A					;$B3ECB2   |
	CMP #$8000				;$B3ECB3   |
	ROR A					;$B3ECB6   |
	CMP #$8000				;$B3ECB7   |
	ROR A					;$B3ECBA   |
	STA $20,x				;$B3ECBB   |
	LDA $0024,y				;$B3ECBD   |
	CMP #$8000				;$B3ECC0   |
	ROR A					;$B3ECC3   |
	CMP #$8000				;$B3ECC4   |
	ROR A					;$B3ECC7   |
	CMP #$8000				;$B3ECC8   |
	ROR A					;$B3ECCB   |
	STA $24,x				;$B3ECCC   |
	RTS					;$B3ECCE  /

CODE_B3ECCF:
	LDX alternate_sprite			;$B3ECCF  \
	LDA #$FFC0				;$B3ECD1   |
	STA $24,x				;$B3ECD4   |
	LDA $0A,x				;$B3ECD6   |
	SEC					;$B3ECD8   |
	SBC #$001C				;$B3ECD9   |
	STA $0A,x				;$B3ECDC   |
	LDA $06,x				;$B3ECDE   |
	SEC					;$B3ECE0   |
	SBC #$0002				;$B3ECE1   |
	STA $06,x				;$B3ECE4   |
	RTS					;$B3ECE6  /

CODE_B3ECE7:
	LDX current_sprite			;$B3ECE7  \
	LDA $2A,x				;$B3ECE9   |
	AND #$2000				;$B3ECEB   |
	BNE CODE_B3ED02				;$B3ECEE   |
	LDY $0595				;$B3ECF0   |
	LDA $0002,y				;$B3ECF3   |
	AND #$8000				;$B3ECF6   |
	BEQ CODE_B3ED2A				;$B3ECF9   |
	LDA $2A,x				;$B3ECFB   |
	ORA #$2000				;$B3ECFD   |
	STA $2A,x				;$B3ED00   |
CODE_B3ED02:					;	   |
	LDA $50,x				;$B3ED02   |
	BEQ CODE_B3ED28				;$B3ED04   |
	LDA $48,x				;$B3ED06   |
	CLC					;$B3ED08   |
	ADC #$4000				;$B3ED09   |
	AND #$C000				;$B3ED0C   |
	SEC					;$B3ED0F   |
	SBC #$2000				;$B3ED10   |
	CLC					;$B3ED13   |
	STA $5E					;$B3ED14   |
	SEC					;$B3ED16   |
	SBC $48,x				;$B3ED17   |
	BPL CODE_B3ED1F				;$B3ED19   |
	EOR #$FFFF				;$B3ED1B   |
	INC A					;$B3ED1E   |
CODE_B3ED1F:					;	   |
	CMP #$1000				;$B3ED1F   |
	BPL CODE_B3ED2A				;$B3ED22   |
	LDA $5E					;$B3ED24   |
	STA $48,x				;$B3ED26   |
CODE_B3ED28:					;	   |
	SEC					;$B3ED28   |
	RTS					;$B3ED29  /

CODE_B3ED2A:
	CLC					;$B3ED2A  \
	RTS					;$B3ED2B  /

CODE_B3ED2C:
	LDX current_sprite			;$B3ED2C  \
	LDA $46,x				;$B3ED2E   |
	XBA					;$B3ED30   |
	EOR $2A,x				;$B3ED31   |
	AND #$4000				;$B3ED33   |
	EOR $2A,x				;$B3ED36   |
	STA $2A,x				;$B3ED38   |
	RTS					;$B3ED3A  /

CODE_B3ED3B:
	LDX current_sprite			;$B3ED3B  \
	LDA $44,x				;$B3ED3D   |
	SEC					;$B3ED3F   |
	SBC #$0003				;$B3ED40   |
	BMI CODE_B3ED4C				;$B3ED43   |
	CMP #$00F0				;$B3ED45   |
	BMI CODE_B3ED4E				;$B3ED48   |
	STA $44,x				;$B3ED4A   |
CODE_B3ED4C:					;	   |
	CLC					;$B3ED4C   |
	RTS					;$B3ED4D  /

CODE_B3ED4E:
	STZ $44,x				;$B3ED4E  \
	SEC					;$B3ED50   |
	RTS					;$B3ED51  /

DATA_B3ED52:
	db $05, $00, $0D, $00, $0F, $00, $43, $00
	db $60, $00


CODE_B3ED5C:
	BEQ CODE_B3ED6B				;$B3ED5C  \
	ASL					;$B3ED5E   |
	TAX					;$B3ED5F   |
	LDA.l $7E9128,x				;$B3ED60   |
	ORA #$0080				;$B3ED64   |
	STA $7E9128,x				;$B3ED67   |
CODE_B3ED6B:					;	   |
	LDX current_sprite			;$B3ED6B   |
	RTS					;$B3ED6D  /

CODE_B3ED6E:
	LDX current_sprite			;$B3ED6E  \
	LDA $46,x				;$B3ED70   |
	AND #$1000				;$B3ED72   |
	BNE CODE_B3ED94				;$B3ED75   |
	LDA $48,x				;$B3ED77   |
	STA $60					;$B3ED79   |
	CLC					;$B3ED7B   |
	ADC $3A,x				;$B3ED7C   |
	STA $48,x				;$B3ED7E   |
	EOR $60					;$B3ED80   |
	AND #$E000				;$B3ED82   |
	BEQ CODE_B3ED93				;$B3ED85   |
	AND #$6000				;$B3ED87   |
	CMP #$2000				;$B3ED8A   |
	BNE CODE_B3ED93				;$B3ED8D   |
	LDA $50,x				;$B3ED8F   |
	STA $38,x				;$B3ED91   |
CODE_B3ED93:					;	   |
	RTS					;$B3ED93  /

CODE_B3ED94:
	LDY $0595				;$B3ED94  \
	LDA $0004,y				;$B3ED97   |
	AND #$0300				;$B3ED9A   |
	BNE CODE_B3EDC8				;$B3ED9D   |
	LDY $0593				;$B3ED9F   |
	LDA $48,x				;$B3EDA2   |
	CLC					;$B3EDA4   |
	ADC $0028,y				;$B3EDA5   |
	STA $32					;$B3EDA8   |
	EOR $48,x				;$B3EDAA   |
	AND $2000				;$B3EDAC   |
	BEQ CODE_B3EDC3				;$B3EDAF   |
	LDA #$0000				;$B3EDB1   |
	STA $0028,y				;$B3EDB4   |
	LDA $32					;$B3EDB7   |
	CLC					;$B3EDB9   |
	ADC #$1000				;$B3EDBA   |
	AND #$E000				;$B3EDBD   |
	STA $48,x				;$B3EDC0   |
	RTS					;$B3EDC2  /

CODE_B3EDC3:
	LDA $32					;$B3EDC3  \
	STA $48,x				;$B3EDC5   |
	RTS					;$B3EDC7  /

CODE_B3EDC8:
	LDY $0593				;$B3EDC8  \
	LDA $0028,y				;$B3EDCB   |
	CLC					;$B3EDCE   |
	ADC $48,x				;$B3EDCF   |
	STA $48,x				;$B3EDD1   |
	RTS					;$B3EDD3  /

CODE_B3EDD4:
	LDX current_sprite			;$B3EDD4  \
	LDA $46,x				;$B3EDD6   |
	AND #$0010				;$B3EDD8   |
	BNE CODE_B3EDDE				;$B3EDDB   |
	RTS					;$B3EDDD  /

CODE_B3EDDE:
	LDX current_sprite			;$B3EDDE  \
	LDA $54,x				;$B3EDE0   |
	PHA					;$B3EDE2   |
	PHX					;$B3EDE3   |
	LDY $0595				;$B3EDE4   |
	STY $66					;$B3EDE7   |
	LDX $0593				;$B3EDE9   |
	STX current_sprite			;$B3EDEC   |
	JSR CODE_B3EE05				;$B3EDEE   |
	PLX					;$B3EDF1   |
	STX current_sprite			;$B3EDF2   |
	PLA					;$B3EDF4   |
	STA $54,x				;$B3EDF5   |
	LDY $0593				;$B3EDF7   |
	LDA $0006,y				;$B3EDFA   |
	STA $06,x				;$B3EDFD   |
	LDA $000A,y				;$B3EDFF   |
	STA $0A,x				;$B3EE02   |
	RTS					;$B3EE04  /

CODE_B3EE05:
	LDA $20,x				;$B3EE05  \
	PHA					;$B3EE07   |
	LDA $26,x				;$B3EE08   |
	PHA					;$B3EE0A   |
	LDA $24,x				;$B3EE0B   |
	PHA					;$B3EE0D   |
	LDA $2A,x				;$B3EE0E   |
	PHA					;$B3EE10   |
	JSL CODE_B8D5E0				;$B3EE11   |
	LDA #$0120				;$B3EE15   |
	CMP $0A,x				;$B3EE18   |
	BMI CODE_B3EE1E				;$B3EE1A   |
	STA $0A,x				;$B3EE1C   |
CODE_B3EE1E:					;	   |
if !version == 1				;	   |
	JSR CODE_B3EE30				;$B3EE1E   |
endif						;	   |
	LDX current_sprite			;$B3EE21   |
	PLA					;$B3EE23   |
	STA $2A,x				;$B3EE24   |
	PLA					;$B3EE26   |
	STA $24,x				;$B3EE27   |
	PLA					;$B3EE29   |
	STA $26,x				;$B3EE2A   |
	PLA					;$B3EE2C   |
	STA $20,x				;$B3EE2D   |
	RTS					;$B3EE2F  /

if !version == 1				;	  \
CODE_B3EE30:					;	   |
	LDX current_sprite			;$B3EE30   |
	LDA $17C0				;$B3EE32   |
	CLC					;$B3EE35   |
	ADC #$00E0				;$B3EE36   |
	SEC					;$B3EE39   |
	SBC $0A,x				;$B3EE3A   |
	BPL CODE_B3EE43				;$B3EE3C   |
	CLC					;$B3EE3E   |
	ADC $0A,x				;$B3EE3F   |
	STA $0A,x				;$B3EE41   |
CODE_B3EE43:					;	   |
	LDA $06,x				;$B3EE43   |
	SEC					;$B3EE45   |
	SBC #$0010				;$B3EE46   |
	SEC					;$B3EE49   |
	SBC $17BA				;$B3EE4A   |
	BPL CODE_B3EE59				;$B3EE4D   |
CODE_B3EE4F:					;	   |
	EOR #$FFFF				;$B3EE4F   |
	INC A					;$B3EE52   |
	CLC					;$B3EE53   |
	ADC $06,x				;$B3EE54   |
	STA $06,x				;$B3EE56   |
	RTS					;$B3EE58  /

CODE_B3EE59:
	SEC					;$B3EE59  \
	SBC #$00E0				;$B3EE5A   |
	BPL CODE_B3EE4F				;$B3EE5D   |
	RTS					;$B3EE5F   |
endif						;	   /

CODE_B3EE60:
	LDX current_sprite			;$B3EE60  \
	LDA $42,x				;$B3EE62   |
	XBA					;$B3EE64   |
	BRA CODE_B3EE6B				;$B3EE65  /

CODE_B3EE67:
	LDX current_sprite			;$B3EE67  \
	LDA $42,x				;$B3EE69   |
CODE_B3EE6B:					;	   |
	AND #$FF00				;$B3EE6B   |
	STA $5E					;$B3EE6E   |
	LDA $48,x				;$B3EE70   |
	STA $60					;$B3EE72   |
	SEC					;$B3EE74   |
	SBC $5E					;$B3EE75   |
	BPL CODE_B3EEA1				;$B3EE77   |
	DEC $5E					;$B3EE79   |
	LDA $3A,x				;$B3EE7B   |
	CLC					;$B3EE7D   |
	ADC $48,x				;$B3EE7E   |
	STA $48,x				;$B3EE80   |
	CMP $5E					;$B3EE82   |
	BMI CODE_B3EE8C				;$B3EE84   |
	LDA $5E					;$B3EE86   |
	STA $48,x				;$B3EE88   |
CODE_B3EE8A:					;	   |
	SEC					;$B3EE8A   |
	RTS					;$B3EE8B  /

CODE_B3EE8C:
	EOR $60					;$B3EE8C  \
	AND #$E000				;$B3EE8E   |
	BEQ CODE_B3EE9F				;$B3EE91   |
	AND #$6000				;$B3EE93   |
	CMP #$2000				;$B3EE96   |
	BNE CODE_B3EE9F				;$B3EE99   |
	LDA $50,x				;$B3EE9B   |
	STA $38,x				;$B3EE9D   |
CODE_B3EE9F:					;	   |
	CLC					;$B3EE9F   |
	RTS					;$B3EEA0  /

CODE_B3EEA1:
	INC $5E					;$B3EEA1  \
	LDA $3A,x				;$B3EEA3   |
	EOR #$FFFF				;$B3EEA5   |
	INC A					;$B3EEA8   |
	CLC					;$B3EEA9   |
	ADC $48,x				;$B3EEAA   |
	STA $48,x				;$B3EEAC   |
	CMP $5E					;$B3EEAE   |
	BPL CODE_B3EE8C				;$B3EEB0   |
	LDA $5E					;$B3EEB2   |
	DEC A					;$B3EEB4   |
	STA $48,x				;$B3EEB5   |
	BRA CODE_B3EE8A				;$B3EEB7  /

CODE_B3EEB9:
	LDX current_sprite			;$B3EEB9  \
	LDA $2A,x				;$B3EEBB   |
	AND #$0800				;$B3EEBD   |
	BNE CODE_B3EEC5				;$B3EEC0   |
	BRL CODE_B3EF81				;$B3EEC2  /

CODE_B3EEC5:
	LDX $0597				;$B3EEC5  \
	LDA $2E,x				;$B3EEC8   |
	CMP #$002F				;$B3EECA   |
	BEQ CODE_B3EF46				;$B3EECD   |
	JSL CODE_BCFB58				;$B3EECF   |
	LDA #$0008				;$B3EED3   |
	PHK					;$B3EED6   |
	%return(CODE_B3EEDD)			;$B3EED7   |
	JML [$09F9]				;$B3EEDA  /

CODE_B3EEDD:
	BCC CODE_B3EF44				;$B3EEDD  \
	LDA $09F5				;$B3EEDF   |
	AND #$0406				;$B3EEE2   |
	BEQ CODE_B3EF44				;$B3EEE5   |
	LDX current_sprite			;$B3EEE7   |
	LDA $46,x				;$B3EEE9   |
	AND #$0003				;$B3EEEB   |
	BEQ CODE_B3EF0E				;$B3EEEE   |
	CMP #$0003				;$B3EEF0   |
	BEQ CODE_B3EF44				;$B3EEF3   |
	LDY $6A					;$B3EEF5   |
	AND #$0001				;$B3EEF7   |
	BNE CODE_B3EF06				;$B3EEFA   |
	LDA $0000,y				;$B3EEFC   |
	CMP #$00E8				;$B3EEFF   |
	BNE CODE_B3EF0E				;$B3EF02   |
	BRA CODE_B3EF44				;$B3EF04  /

CODE_B3EF06:
	LDA $0000,y				;$B3EF06  \
	CMP #$00E4				;$B3EF09   |
	BEQ CODE_B3EF44				;$B3EF0C   |
CODE_B3EF0E:					;	   |
	LDA $6A					;$B3EF0E   |
	CMP $0597				;$B3EF10   |
	BEQ CODE_B3EF6A				;$B3EF13   |
CODE_B3EF15:					;	   |
	LDA #$0010				;$B3EF15   |
	JSL CODE_B8D8BA				;$B3EF18   |
	BCS CODE_B3EF44				;$B3EF1C   |
	LDA #CODE_B3EF84			;$B3EF1E   |
	STA $0A8A				;$B3EF21   |
	LDA.w #CODE_B3EF84>>16			;$B3EF24   |
	STA $0A8C				;$B3EF27   |
CODE_B3EF2A:					;	   |
	JSL CODE_BCFEC8				;$B3EF2A   |
	JSL CODE_BCFEE0				;$B3EF2E   |
	JSL CODE_B3A334				;$B3EF32   |
	LDA $0A3E				;$B3EF36   |
	STA $0A86				;$B3EF39   |
	LDA $0A40				;$B3EF3C   |
	STA $0A88				;$B3EF3F   |
	SEC					;$B3EF42   |
	RTS					;$B3EF43  /

CODE_B3EF44:
	CLC					;$B3EF44  \
	RTS					;$B3EF45  /

CODE_B3EF46:
	LDX $0597				;$B3EF46  \
	LDA $42,x				;$B3EF49   |
	CMP current_sprite			;$B3EF4B   |
	BNE CODE_B3EF44				;$B3EF4D   |
	JSL CODE_BCFB58				;$B3EF4F   |
	LDA #$0008				;$B3EF53   |
	PHK					;$B3EF56   |
	%return(CODE_B3EF5D)			;$B3EF57   |
	JML [$09F9]				;$B3EF5A  /

CODE_B3EF5D:
	BCC CODE_B3EF44				;$B3EF5D  \
	LDA $09F5				;$B3EF5F   |
	AND #$0406				;$B3EF62   |
	BEQ CODE_B3EF44				;$B3EF65   |
	BRL CODE_B3EF15				;$B3EF67  /

CODE_B3EF6A:
	LDA #$000F				;$B3EF6A  \
	JSL CODE_B8D8BA				;$B3EF6D   |
	BCS CODE_B3EF44				;$B3EF71   |
	LDA #CODE_B3F069			;$B3EF73   |
	STA $0A8A				;$B3EF76   |
	LDA.w #CODE_B3F069>>16			;$B3EF79   |
	STA $0A8C				;$B3EF7C   |
	BRA CODE_B3EF2A				;$B3EF7F  /

CODE_B3EF81:
	BRL CODE_B3EF44				;$B3EF81  /

CODE_B3EF84:
	JSL CODE_B8808E				;$B3EF84  \
	JSL CODE_B88EB8				;$B3EF88   |
	LDX $0595				;$B3EF8C   |
	STZ $14,x				;$B3EF8F   |
	LDX $0593				;$B3EF91   |
	LDA $0A86				;$B3EF94   |
	STA $0A3E				;$B3EF97   |
	LDA $0A88				;$B3EF9A   |
	STA $0A40				;$B3EF9D   |
	LDY #$0034				;$B3EFA0   |
	JSL CODE_BB842C				;$B3EFA3   |
	LDX $0A84				;$B3EFA7   |
	STX current_sprite			;$B3EFAA   |
	JSR CODE_B3F14C				;$B3EFAC   |
	LDY $0593				;$B3EFAF   |
	LDA #$0011				;$B3EFB2   |
	STA $002E,y				;$B3EFB5   |
	LDA $0030,y				;$B3EFB8   |
	STA $0A3C				;$B3EFBB   |
	STA $0032,y				;$B3EFBE   |
	STA $0020,y				;$B3EFC1   |
	STA $0026,y				;$B3EFC4   |
	STA $0024,y				;$B3EFC7   |
	STA $001E,y				;$B3EFCA   |
	LDA #$0000				;$B3EFCD   |
	STA $0040,y				;$B3EFD0   |
	JSL CODE_B3F0B8				;$B3EFD3   |
	JSL CODE_B3DF3C				;$B3EFD7   |
	LDA #$0002				;$B3EFDB   |
	STA $2E,x				;$B3EFDE   |
	LDA $2A,x				;$B3EFE0   |
	AND #$DFFF				;$B3EFE2   |
	ORA #$1000				;$B3EFE5   |
	STA $2A,x				;$B3EFE8   |
	JSR CODE_B3F01D				;$B3EFEA   |
	LDX current_sprite			;$B3EFED   |
	LDA #$0001				;$B3EFEF   |
	STA $38,x				;$B3EFF2   |
	LDA $08C2				;$B3EFF4   |
	AND #$4000				;$B3EFF7   |
	BEQ CODE_B3F015				;$B3EFFA   |
	LDY $0597				;$B3EFFC   |
	LDA $002E,y				;$B3EFFF   |
	CMP #$002F				;$B3F002   |
	BEQ CODE_B3F016				;$B3F005   |
	LDA $6E					;$B3F007   |
	BEQ CODE_B3F00F				;$B3F009   |
	LDA current_player_mount		;$B3F00B   |
	BEQ CODE_B3F015				;$B3F00D   |
CODE_B3F00F:					;	   |
	LDA #$0032				;$B3F00F   |
	STA $002E,y				;$B3F012   |
CODE_B3F015:					;	   |
	RTL					;$B3F015  /

CODE_B3F016:
	LDA #$0031				;$B3F016  \
	STA $002E,y				;$B3F019   |
	RTL					;$B3F01C  /

CODE_B3F01D:
	LDA $36,x				;$B3F01D  \
	BNE CODE_B3F033				;$B3F01F   |
	LDA $46,x				;$B3F021   |
	AND #$0800				;$B3F023   |
	BEQ CODE_B3F02F				;$B3F026   |
	LDA $42,x				;$B3F028   |
	JSR CODE_B3F111				;$B3F02A   |
	BRA CODE_B3F032				;$B3F02D  /

CODE_B3F02F:
	JSR CODE_B3F0F4				;$B3F02F  \
CODE_B3F032:					;	   |
	RTS					;$B3F032  /

CODE_B3F033:
	LDA $0AF0				;$B3F033  \
	LSR A					;$B3F036   |
	STA $32					;$B3F037   |
	LDA $36,x				;$B3F039   |
	AND #$FF00				;$B3F03B   |
	CLC					;$B3F03E   |
	ADC #$3C00				;$B3F03F   |
	SEC					;$B3F042   |
	SBC $32					;$B3F043   |
	STA $0AF2				;$B3F045   |
	LDA $0AEA				;$B3F048   |
	LSR A					;$B3F04B   |
	STA $32					;$B3F04C   |
	LDA $36,x				;$B3F04E   |
	XBA					;$B3F050   |
	AND #$FF00				;$B3F051   |
	CLC					;$B3F054   |
	ADC #$4000				;$B3F055   |
	SEC					;$B3F058   |
	SBC $32					;$B3F059   |
	STA $0AEE				;$B3F05B   |
	RTS					;$B3F05E  /

CODE_B3F05F:
	LDA #$C000				;$B3F05F  \
	ORA $0AB8				;$B3F062   |
	STA $0AB8				;$B3F065   |
	RTS					;$B3F068  /

CODE_B3F069:
	LDA $0A86				;$B3F069  \
	STA $0A3E				;$B3F06C   |
	LDA $0A88				;$B3F06F   |
	STA $0A40				;$B3F072   |
	LDY #$0034				;$B3F075   |
	JSL CODE_BB842C				;$B3F078   |
	JSL CODE_B880A2				;$B3F07C   |
	LDA #$002F				;$B3F080   |
	STA $2E,x				;$B3F083   |
	LDA $0A84				;$B3F085   |
	STA $42,x				;$B3F088   |
	TAY					;$B3F08A   |
	LDA $0006,y				;$B3F08B   |
	STA $06,x				;$B3F08E   |
	LDA $000A,y				;$B3F090   |
	STA $0A,x				;$B3F093   |
	STZ $30,x				;$B3F095   |
	STZ $32,x				;$B3F097   |
	STZ $20,x				;$B3F099   |
	STZ $26,x				;$B3F09B   |
	STZ $24,x				;$B3F09D   |
	STZ $1E,x				;$B3F09F   |
	STZ $1A,x				;$B3F0A1   |
	STZ $16,x				;$B3F0A3   |
	STZ $40,x				;$B3F0A5   |
	LDX $0A84				;$B3F0A7   |
	STX current_sprite			;$B3F0AA   |
	JSR CODE_B3F01D				;$B3F0AC   |
	JSL CODE_B8808E				;$B3F0AF   |
	JSL CODE_B8A57C				;$B3F0B3   |
	RTL					;$B3F0B7  /

CODE_B3F0B8:
	LDX $0593				;$B3F0B8  \
	LDA.l DATA_B9F085			;$B3F0BB   |
	STA $1A,x				;$B3F0BF   |
	STZ $16,x				;$B3F0C1   |
	LDA #$C000				;$B3F0C3   |
	STA $1C,x				;$B3F0C6   |
	LDA #$0010				;$B3F0C8   |
	STA $30,x				;$B3F0CB   |
	LDA current_player_mount		;$B3F0CD   |
	BEQ CODE_B3F0DE				;$B3F0CF   |
	TAY					;$B3F0D1   |
	LDA #$0000				;$B3F0D2   |
	STA $001A,y				;$B3F0D5   |
	STA $0016,y				;$B3F0D8   |
	STA $003A,y				;$B3F0DB   |
CODE_B3F0DE:					;	   |
	LDA $0597				;$B3F0DE   |
	CMP $0D7A				;$B3F0E1   |
	BNE CODE_B3F0F3				;$B3F0E4   |
	TAY					;$B3F0E6   |
	LDA #$0000				;$B3F0E7   |
	STA $001A,y				;$B3F0EA   |
	STA $0016,y				;$B3F0ED   |
	STA $003A,y				;$B3F0F0   |
CODE_B3F0F3:					;	   |
	RTL					;$B3F0F3  /

CODE_B3F0F4:
	LDA #$8000				;$B3F0F4  \
	SEC					;$B3F0F7   |
	SBC $0AEA				;$B3F0F8   |
	CMP #$8000				;$B3F0FB   |
	ROR A					;$B3F0FE   |
	STA $0AEE				;$B3F0FF   |
	LDA #$7800				;$B3F102   |
	SEC					;$B3F105   |
	SBC $0AF0				;$B3F106   |
	CMP #$8000				;$B3F109   |
	ROR A					;$B3F10C   |
	STA $0AF2				;$B3F10D   |
	RTS					;$B3F110  /

CODE_B3F111:
	XBA					;$B3F111  \
	AND #$00FF				;$B3F112   |
	PHA					;$B3F115   |
	JSR CODE_B3F4C0				;$B3F116   |
	EOR #$FFFF				;$B3F119   |
	INC A					;$B3F11C   |
	ASL A					;$B3F11D   |
	ASL A					;$B3F11E   |
	ASL A					;$B3F11F   |
	ASL A					;$B3F120   |
	ASL A					;$B3F121   |
	ASL A					;$B3F122   |
	CLC					;$B3F123   |
	ADC #$8000				;$B3F124   |
	SEC					;$B3F127   |
	SBC $0AEA				;$B3F128   |
	CMP #$8000				;$B3F12B   |
	ROR A					;$B3F12E   |
	STA $0AEE				;$B3F12F   |
	PLA					;$B3F132   |
	JSR CODE_B3F4CA				;$B3F133   |
	ASL A					;$B3F136   |
	ASL A					;$B3F137   |
	ASL A					;$B3F138   |
	ASL A					;$B3F139   |
	ASL A					;$B3F13A   |
	ASL A					;$B3F13B   |
	CLC					;$B3F13C   |
	ADC #$7800				;$B3F13D   |
	SEC					;$B3F140   |
	SBC $0AF0				;$B3F141   |
	CMP #$8000				;$B3F144   |
	ROR A					;$B3F147   |
	STA $0AF2				;$B3F148   |
	RTS					;$B3F14B  /

CODE_B3F14C:
	LDX current_sprite			;$B3F14C  \
	LDY $0593				;$B3F14E   |
	LDA $06,x				;$B3F151   |
	STA $0006,y				;$B3F153   |
	LDA $0A,x				;$B3F156   |
	STA $000A,y				;$B3F158   |
	RTS					;$B3F15B  /

CODE_B3F15C:
	LDX current_sprite			;$B3F15C  \
	LDY $0593				;$B3F15E   |
	LDA $48,x				;$B3F161   |
	STA $26					;$B3F163   |
	LDA $2C,x				;$B3F165   |
	XBA					;$B3F167   |
	AND #$FF00				;$B3F168   |
	STA $5E					;$B3F16B   |
	LDX current_sprite			;$B3F16D   |
	LDA $46,x				;$B3F16F   |
	XBA					;$B3F171   |
	ASL A					;$B3F172   |
	ASL A					;$B3F173   |
	EOR #$FFFF				;$B3F174   |
	AND #$1000				;$B3F177   |
	EOR #$F000				;$B3F17A   |
	STA $60					;$B3F17D   |
	EOR #$FFFF				;$B3F17F   |
	LSR A					;$B3F182   |
	CLC					;$B3F183   |
	ADC $48,x				;$B3F184   |
	AND $60					;$B3F186   |
	STA $48,x				;$B3F188   |
	XBA					;$B3F18A   |
	STA $60					;$B3F18B   |
	JSL CODE_B3F4B8				;$B3F18D   |
	JSR CODE_B3F1C9				;$B3F191   |
	STA $0020,y				;$B3F194   |
	STA $0026,y				;$B3F197   |
	LDX current_sprite			;$B3F19A   |
	LDA $26					;$B3F19C   |
	BEQ CODE_B3F1A8				;$B3F19E   |
	CMP #$7FFF				;$B3F1A0   |
	BEQ CODE_B3F1A8				;$B3F1A3   |
	EOR #$FFFF				;$B3F1A5   |
CODE_B3F1A8:					;	   |
	LSR A					;$B3F1A8   |
	EOR $0012,y				;$B3F1A9   |
	AND #$4000				;$B3F1AC   |
	EOR $0012,y				;$B3F1AF   |
	STA $0012,y				;$B3F1B2   |
	LDA $60					;$B3F1B5   |
	JSL CODE_B3F4BC				;$B3F1B7   |
	JSR CODE_B3F1C9				;$B3F1BB   |
	EOR #$FFFF				;$B3F1BE   |
	INC A					;$B3F1C1   |
	STA $0024,y				;$B3F1C2   |
	STA $002A,y				;$B3F1C5   |
	RTS					;$B3F1C8  /

CODE_B3F1C9:
	BPL CODE_B3F1E1				;$B3F1C9  \
	EOR #$FFFF				;$B3F1CB   |
	INC A					;$B3F1CE   |
	ORA $5E					;$B3F1CF   |
	STA CPU.multiply_A			;$B3F1D1   |
	LDA CPU.multiply_result			;$B3F1D4   |
	LDA CPU.multiply_result			;$B3F1D7   |
	LSR A					;$B3F1DA   |
	LSR A					;$B3F1DB   |
	EOR #$FFFF				;$B3F1DC   |
	INC A					;$B3F1DF   |
	RTS					;$B3F1E0  /

CODE_B3F1E1:
	ORA $5E					;$B3F1E1  \
	STA CPU.multiply_A			;$B3F1E3   |
	LDA CPU.multiply_result			;$B3F1E6   |
	LDA CPU.multiply_result			;$B3F1E9   |
	LSR A					;$B3F1EC   |
	LSR A					;$B3F1ED   |
	RTS					;$B3F1EE  /

CODE_B3F1EF:
	JSR CODE_B3F1F3				;$B3F1EF  \
	RTL					;$B3F1F2  /

CODE_B3F1F3:
	LDX current_sprite			;$B3F1F3  \
	LDA $46,x				;$B3F1F5   |
	PHA					;$B3F1F7   |
	LDA $54,x				;$B3F1F8   |
	PHA					;$B3F1FA   |
	PHX					;$B3F1FB   |
	JSR CODE_B3F207				;$B3F1FC   |
	PLX					;$B3F1FF   |
	PLA					;$B3F200   |
	STA $54,x				;$B3F201   |
	PLA					;$B3F203   |
	STX current_sprite			;$B3F204   |
	RTS					;$B3F206  /

CODE_B3F207:
	LDX $0593				;$B3F207  \
	STX current_sprite			;$B3F20A   |
	LDY $0595				;$B3F20C   |
	STY $66					;$B3F20F   |
	LDA $20,x				;$B3F211   |
	STA $26,x				;$B3F213   |
	STA $46,x				;$B3F215   |
	LDA $54,x				;$B3F217   |
	STA $8E					;$B3F219   |
	JSL CODE_B8CEB6				;$B3F21B   |
	JSL CODE_B8CE95				;$B3F21F   |
	LDA #$0012				;$B3F223   |
	STA $2E,x				;$B3F226   |
	LDA $0D7A				;$B3F228   |
	CMP $0597				;$B3F22B   |
	BEQ CODE_B3F289				;$B3F22E   |
	LDA $08C2				;$B3F230   |
	AND #$4000				;$B3F233   |
	BEQ CODE_B3F25F				;$B3F236   |
	LDA $6E					;$B3F238   |
	BEQ CODE_B3F240				;$B3F23A   |
	LDA current_player_mount		;$B3F23C   |
	BEQ CODE_B3F25F				;$B3F23E   |
CODE_B3F240:					;	   |
	JSL CODE_B880A2				;$B3F240   |
	LDA #$0022				;$B3F244   |
	STA $2E,x				;$B3F247   |
	LDA #$0001				;$B3F249   |
	LDX #$001C				;$B3F24C   |
	LDY #$0000				;$B3F24F   |
	JSL CODE_B8D8D1				;$B3F252   |
	LDX current_sprite			;$B3F256   |
	LDA #$001C				;$B3F258   |
	JSL CODE_B9D0B8				;$B3F25B   |
CODE_B3F25F:					;	   |
	JSL CODE_B8808E				;$B3F25F   |
	LDA $6E					;$B3F263   |
CODE_B3F265:					;	   |
	BNE CODE_B3F273				;$B3F265   |
	LDA #$0019				;$B3F267   |
	JSL CODE_B9D0B8				;$B3F26A   |
CODE_B3F26E:					;	   |
	JSL CODE_BCFA78				;$B3F26E   |
	RTS					;$B3F272  /

CODE_B3F273:
	LDA #$0090				;$B3F273  \
	JSL CODE_B9D08C				;$B3F276   |
	LDA current_player_mount		;$B3F27A   |
	BEQ CODE_B3F287				;$B3F27C   |
	STA current_sprite			;$B3F27E   |
	LDA #$004F				;$B3F280   |
	JSL CODE_B9D04B				;$B3F283   |
CODE_B3F287:					;	   |
	BRA CODE_B3F26E				;$B3F287  /

CODE_B3F289:
	LDA #$0025				;$B3F289  \
	JSL CODE_B9D0B8				;$B3F28C   |
	JSL CODE_B880A2				;$B3F290   |
	LDA #$0018				;$B3F294   |
	STA $2E,x				;$B3F297   |
	LDA #$0020				;$B3F299   |
	JSL CODE_B9D0B8				;$B3F29C   |
	JSL CODE_B8B7F0				;$B3F2A0   |
	BRA CODE_B3F26E				;$B3F2A4  /

CODE_B3F2A6:
	LDY current_sprite			;$B3F2A6  \
	LDA $0000,y				;$B3F2A8   |
	CMP #$013C				;$B3F2AB   |
	BEQ CODE_B3F2E5				;$B3F2AE   |
	LDA $0048,y				;$B3F2B0   |
	CLC					;$B3F2B3   |
	ADC #$0800				;$B3F2B4   |
	AND #$F000				;$B3F2B7   |
	XBA					;$B3F2BA   |
	LSR A					;$B3F2BB   |
	LSR A					;$B3F2BC   |
	LSR A					;$B3F2BD   |
	TAX					;$B3F2BE   |
	LDA $0046,y				;$B3F2BF   |
	AND #$A007				;$B3F2C2   |
	BEQ CODE_B3F2CC				;$B3F2C5   |
	AND #$A003				;$B3F2C7   |
	BEQ CODE_B3F2D4				;$B3F2CA   |
CODE_B3F2CC:					;	   |
	LDA.l DATA_B9F085,x			;$B3F2CC   |
	STA $001A,y				;$B3F2D0   |
	RTS					;$B3F2D3  /

CODE_B3F2D4:
	LDA $0042,y				;$B3F2D4  \
	XBA					;$B3F2D7   |
	CMP $0042,y				;$B3F2D8   |
	BEQ CODE_B3F2E6				;$B3F2DB   |
	LDA.l DATA_B9F0A5,x			;$B3F2DD   |
	STA $001A,y				;$B3F2E1   |
	RTS					;$B3F2E4  /

CODE_B3F2E5:
	RTS					;$B3F2E5  /

CODE_B3F2E6:
	LDA.l DATA_B3F31E,x			;$B3F2E6  \
	EOR $0012,y				;$B3F2EA   |
	AND #$C000				;$B3F2ED   |
	EOR $0012,y				;$B3F2F0   |
	STA $0012,y				;$B3F2F3   |
	LDA.l DATA_B3F2FE,x			;$B3F2F6   |
	STA $001A,y				;$B3F2FA   |
	RTS					;$B3F2FD  /

DATA_B3F2FE:
	db $20, $2D, $24, $2D, $28, $2D, $2C, $2D
	db $30, $2D, $2C, $2D, $28, $2D, $24, $2D
	db $20, $2D, $24, $2D, $28, $2D, $2C, $2D
	db $30, $2D, $2C, $2D, $28, $2D, $24, $2D

DATA_B3F31E:
	db $00, $80, $00, $C0, $00, $C0, $00, $C0
	db $00, $40, $00, $40, $00, $40, $00, $40
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $80, $00, $80, $00, $80

CODE_B3F33E:
	LDX current_sprite			;$B3F33E  \
	LDA $2A,x				;$B3F340   |
	AND #$4000				;$B3F342   |
	BNE CODE_B3F348				;$B3F345   |
	RTS					;$B3F347  /

CODE_B3F348:
	JSR CODE_B3F396				;$B3F348  \
	LDX current_sprite			;$B3F34B   |
	LDA $46,x				;$B3F34D   |
	AND #$0080				;$B3F34F   |
	BEQ CODE_B3F36A				;$B3F352   |
	LDA $46,x				;$B3F354   |
	AND #$0200				;$B3F356   |
	BNE CODE_B3F35F				;$B3F359   |
	LDA $4C,x				;$B3F35B   |
	BRA CODE_B3F365				;$B3F35D  /

CODE_B3F35F:
	LDA $4C,x				;$B3F35F  \
	EOR #$FFFF				;$B3F361   |
	INC A					;$B3F364   |
CODE_B3F365:					;	   |
	CLC					;$B3F365   |
	ADC $04,x				;$B3F366   |
	STA $06,x				;$B3F368   |
CODE_B3F36A:					;	   |
	LDA $46,x				;$B3F36A   |
	AND #$0100				;$B3F36C   |
	BEQ CODE_B3F387				;$B3F36F   |
	LDA $46,x				;$B3F371   |
	AND #$0400				;$B3F373   |
	BNE CODE_B3F37C				;$B3F376   |
	LDA $4C,x				;$B3F378   |
	BRA CODE_B3F382				;$B3F37A  /

CODE_B3F37C:
	LDA $4C,x				;$B3F37C  \
	EOR #$FFFF				;$B3F37E   |
	INC A					;$B3F381   |
CODE_B3F382:					;	   |
	CLC					;$B3F382   |
	ADC $08,x				;$B3F383   |
	STA $0A,x				;$B3F385   |
CODE_B3F387:					;	   |
	RTS					;$B3F387  /

	JSR CODE_B3F396				;$B3F388   |
	LDX current_sprite			;$B3F38B   |
	LDA $4C,x				;$B3F38D   |
	CLC					;$B3F38F   |
	ADC #$0240				;$B3F390   |
	STA $06,x				;$B3F393   |
	RTS					;$B3F395  /

CODE_B3F396:
	LDX current_sprite			;$B3F396  \
	LDA $4E,x				;$B3F398   |
	LSR A					;$B3F39A   |
	CMP $4C,x				;$B3F39B   |
	BCS CODE_B3F3B4				;$B3F39D   |
	LDA #$8000				;$B3F39F   |
	STA $5E					;$B3F3A2   |
	LDA #$FFFF				;$B3F3A4   |
	SEC					;$B3F3A7   |
	SBC $4A,x				;$B3F3A8   |
	STA $32					;$B3F3AA   |
	LDA $4E,x				;$B3F3AC   |
	SBC $4C,x				;$B3F3AE   |
	STA $34					;$B3F3B0   |
	BRA CODE_B3F3BE				;$B3F3B2  /

CODE_B3F3B4:
	STZ $5E					;$B3F3B4  \
	LDA $4A,x				;$B3F3B6   |
	STA $32					;$B3F3B8   |
	LDA $4C,x				;$B3F3BA   |
	STA $34					;$B3F3BC   |
CODE_B3F3BE:					;	   |
	LDA $52,x				;$B3F3BE   |
	CMP $34					;$B3F3C0   |
	BCC CODE_B3F3FA				;$B3F3C2   |
	TAY					;$B3F3C4   |
	LDA $28,x				;$B3F3C5   |
	PHA					;$B3F3C7   |
	LDA $33					;$B3F3C8   |
	PLX					;$B3F3CA   |
	JSR CODE_B3F431				;$B3F3CB   |
CODE_B3F3CE:					;	   |
	LDX current_sprite			;$B3F3CE   |
	LDA $39					;$B3F3D0   |
	CMP $22,x				;$B3F3D2   |
	BPL CODE_B3F3DA				;$B3F3D4   |
	LDA $22,x				;$B3F3D6   |
	STA $39					;$B3F3D8   |
CODE_B3F3DA:					;	   |
	LDA $2A,x				;$B3F3DA   |
	BMI CODE_B3F404				;$B3F3DC   |
	LDX current_sprite			;$B3F3DE   |
	LDA $38					;$B3F3E0   |
	CLC					;$B3F3E2   |
	ADC $4A,x				;$B3F3E3   |
	STA $4A,x				;$B3F3E5   |
	LDA $3A					;$B3F3E7   |
	ADC $4C,x				;$B3F3E9   |
	STA $4C,x				;$B3F3EB   |
	LDA #$FFFF				;$B3F3ED   |
	SEC					;$B3F3F0   |
	SBC $4A,x				;$B3F3F1   |
	LDA $4E,x				;$B3F3F3   |
	SBC $4C,x				;$B3F3F5   |
	BMI CODE_B3F422				;$B3F3F7   |
	RTS					;$B3F3F9  /

CODE_B3F3FA:
	STZ $38					;$B3F3FA  \
	STZ $3A					;$B3F3FC   |
	LDA $28,x				;$B3F3FE   |
	STA $39					;$B3F400   |
	BRA CODE_B3F3CE				;$B3F402  /

CODE_B3F404:
	LDX current_sprite			;$B3F404  \
	LDA $4A,x				;$B3F406   |
	SEC					;$B3F408   |
	SBC $38					;$B3F409   |
	STA $4A,x				;$B3F40B   |
	LDA $4C,x				;$B3F40D   |
	SBC $3A					;$B3F40F   |
	BMI CODE_B3F416				;$B3F411   |
	STA $4C,x				;$B3F413   |
	RTS					;$B3F415  /

CODE_B3F416:
	STZ $4A,x				;$B3F416  \
	STZ $4C,x				;$B3F418   |
CODE_B3F41A:					;	   |
	LDA $2A,x				;$B3F41A   |
	EOR #$8000				;$B3F41C   |
	STA $2A,x				;$B3F41F   |
	RTS					;$B3F421  /

CODE_B3F422:
	LDA #$FFFF				;$B3F422  \
	STA $4A,x				;$B3F425   |
	LDA $4E,x				;$B3F427   |
	STA $4C,x				;$B3F429   |
	BRA CODE_B3F41A				;$B3F42B  /

CODE_B3F42D:
	JSR CODE_B3F437				;$B3F42D  \
	RTL					;$B3F430  /

CODE_B3F431:
	JSL CODE_BBB2D1				;$B3F431  \
	STY $36					;$B3F435   |
CODE_B3F437:					;	   |
	STZ $37					;$B3F437   |
	STZ $39					;$B3F439   |
	STZ $3B					;$B3F43B   |
	LDA $34					;$B3F43D   |
	STA CPU.dividen				;$B3F43F   |
	SEP #$20				;$B3F442   |
	LDA $36					;$B3F444   |
	STA CPU.divisor				;$B3F446   |
	REP #$20				;$B3F449   |
	LDA CPU.divide_result			;$B3F44B   |
	LDA CPU.divide_result			;$B3F44E   |
	LDA CPU.divide_result			;$B3F451   |
	LDA CPU.divide_result			;$B3F454   |
	STA $3A					;$B3F457   |
	LDA CPU.divide_remainder		;$B3F459   |
	XBA					;$B3F45C   |
	EOR $33					;$B3F45D   |
	AND #$FF00				;$B3F45F   |
	EOR $33					;$B3F462   |
	STA CPU.dividen				;$B3F464   |
	SEP #$20				;$B3F467   |
	LDA $36					;$B3F469   |
	STA CPU.divisor				;$B3F46B   |
	REP #$20				;$B3F46E   |
	LDA CPU.divide_result			;$B3F470   |
	LDA CPU.divide_result			;$B3F473   |
	LDA CPU.divide_result			;$B3F476   |
	LDA CPU.divide_result			;$B3F479   |
	CLC					;$B3F47C   |
	ADC $39					;$B3F47D   |
	STA $39					;$B3F47F   |
	LDA #$0000				;$B3F481   |
	ADC $3B					;$B3F484   |
	STA $3B					;$B3F486   |
	LDA CPU.divide_remainder		;$B3F488   |
	XBA					;$B3F48B   |
	EOR $32					;$B3F48C   |
	AND #$FF00				;$B3F48E   |
	EOR $32					;$B3F491   |
	STA CPU.dividen				;$B3F493   |
	SEP #$20				;$B3F496   |
	LDA $36					;$B3F498   |
	STA CPU.divisor				;$B3F49A   |
	REP #$20				;$B3F49D   |
	LDA CPU.divide_result			;$B3F49F   |
	LDA CPU.divide_result			;$B3F4A2   |
	LDA CPU.divide_result			;$B3F4A5   |
	LDA CPU.divide_result			;$B3F4A8   |
	CLC					;$B3F4AB   |
	ADC $38					;$B3F4AC   |
	STA $38					;$B3F4AE   |
	LDA #$0000				;$B3F4B0   |
	ADC $3A					;$B3F4B3   |
	STA $3A					;$B3F4B5   |
	RTS					;$B3F4B7  /

CODE_B3F4B8:
	JSR CODE_B3F4C0				;$B3F4B8  \
	RTL					;$B3F4BB  /

CODE_B3F4BC:
	JSR CODE_B3F4CA				;$B3F4BC  \
	RTL					;$B3F4BF  /

CODE_B3F4C0:
	AND #$00FF				;$B3F4C0  \
	ASL A					;$B3F4C3   |
	TAX					;$B3F4C4   |
	LDA.l DATA_B3F4D8,x			;$B3F4C5   |
	RTS					;$B3F4C9  /

CODE_B3F4CA:
	CLC					;$B3F4CA  \
	ADC #$0040				;$B3F4CB   |
	AND #$00FF				;$B3F4CE   |
	ASL A					;$B3F4D1   |
	TAX					;$B3F4D2   |
	LDA.l DATA_B3F4D8,x			;$B3F4D3   |
	RTS					;$B3F4D7  /

DATA_B3F4D8:
	db $00, $00, $FA, $FF, $F3, $FF, $ED, $FF
	db $E7, $FF, $E1, $FF, $DB, $FF, $D4, $FF
	db $CE, $FF, $C8, $FF, $C2, $FF, $BC, $FF
	db $B6, $FF, $B0, $FF, $AA, $FF, $A4, $FF
	db $9E, $FF, $99, $FF, $93, $FF, $8D, $FF
	db $88, $FF, $82, $FF, $7D, $FF, $78, $FF
	db $72, $FF, $6D, $FF, $68, $FF, $63, $FF
	db $5E, $FF, $59, $FF, $55, $FF, $50, $FF
	db $4C, $FF, $47, $FF, $43, $FF, $3F, $FF
	db $3B, $FF, $37, $FF, $33, $FF, $30, $FF
	db $2C, $FF, $29, $FF, $25, $FF, $22, $FF
	db $1F, $FF, $1C, $FF, $19, $FF, $17, $FF
	db $14, $FF, $12, $FF, $10, $FF, $0E, $FF
	db $0C, $FF, $0A, $FF, $09, $FF, $07, $FF
	db $06, $FF, $05, $FF, $04, $FF, $03, $FF
	db $02, $FF, $02, $FF, $01, $FF, $01, $FF
	db $01, $FF, $01, $FF, $01, $FF, $02, $FF
	db $02, $FF, $03, $FF, $04, $FF, $05, $FF
	db $06, $FF, $07, $FF, $09, $FF, $0A, $FF
	db $0C, $FF, $0E, $FF, $10, $FF, $12, $FF
	db $14, $FF, $17, $FF, $19, $FF, $1C, $FF
	db $1F, $FF, $22, $FF, $25, $FF, $29, $FF
	db $2C, $FF, $30, $FF, $33, $FF, $37, $FF
	db $3B, $FF, $3F, $FF, $43, $FF, $47, $FF
	db $4C, $FF, $50, $FF, $55, $FF, $59, $FF
	db $5E, $FF, $63, $FF, $68, $FF, $6D, $FF
	db $72, $FF, $78, $FF, $7D, $FF, $82, $FF
	db $88, $FF, $8D, $FF, $93, $FF, $99, $FF
	db $9E, $FF, $A4, $FF, $AA, $FF, $B0, $FF
	db $B6, $FF, $BC, $FF, $C2, $FF, $C8, $FF
	db $CE, $FF, $D4, $FF, $DB, $FF, $E1, $FF
	db $E7, $FF, $ED, $FF, $F3, $FF, $FA, $FF
	db $00, $00, $06, $00, $0D, $00, $13, $00
	db $19, $00, $1F, $00, $25, $00, $2C, $00
	db $32, $00, $38, $00, $3E, $00, $44, $00
	db $4A, $00, $50, $00, $56, $00, $5C, $00
	db $62, $00, $67, $00, $6D, $00, $73, $00
	db $78, $00, $7E, $00, $83, $00, $88, $00
	db $8E, $00, $93, $00, $98, $00, $9D, $00
	db $A2, $00, $A7, $00, $AB, $00, $B0, $00
	db $B4, $00, $B9, $00, $BD, $00, $C1, $00
	db $C5, $00, $C9, $00, $CD, $00, $D0, $00
	db $D4, $00, $D7, $00, $DB, $00, $DE, $00
	db $E1, $00, $E4, $00, $E7, $00, $E9, $00
	db $EC, $00, $EE, $00, $F0, $00, $F2, $00
	db $F4, $00, $F6, $00, $F7, $00, $F9, $00
	db $FA, $00, $FB, $00, $FC, $00, $FD, $00
	db $FE, $00, $FE, $00, $FF, $00, $FF, $00
	db $FF, $00, $FF, $00, $FF, $00, $FE, $00
	db $FE, $00, $FD, $00, $FC, $00, $FB, $00
	db $FA, $00, $F9, $00, $F7, $00, $F6, $00
	db $F4, $00, $F2, $00, $F0, $00, $EE, $00
	db $EC, $00, $E9, $00, $E7, $00, $E4, $00
	db $E1, $00, $DE, $00, $DB, $00, $D7, $00
	db $D4, $00, $D0, $00, $CD, $00, $C9, $00
	db $C5, $00, $C1, $00, $BD, $00, $B9, $00
	db $B4, $00, $B0, $00, $AB, $00, $A7, $00
	db $A2, $00, $9D, $00, $98, $00, $93, $00
	db $8E, $00, $88, $00, $83, $00, $7E, $00
	db $78, $00, $73, $00, $6D, $00, $67, $00
	db $62, $00, $5C, $00, $56, $00, $50, $00
	db $4A, $00, $44, $00, $3E, $00, $38, $00
	db $32, $00, $2C, $00, $25, $00, $1F, $00
	db $19, $00, $13, $00, $0D, $00, $06, $00
