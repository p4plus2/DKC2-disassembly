;special hitboxes
DATA_BCFA00:
	dw $FFFD, $FFF0, $0019, $0010		;00 object pickup range
	dw $FFF3, $FFF1, $0013, $0010		;01 squitter mount range
	dw $FFF7, $FFE5, $000A, $001D		;02 rattly mount range
	dw $FFF0, $FFF8, $0013, $0014		;03 squawks mount range
	dw $FFF7, $FFE5, $000A, $001D		;04 rambi mount range
	dw $FFF5, $FFEA, $000A, $000A		;05 enguarde mount range
	dw $FFF5, $FFE8, $0026, $001C		;06 enguarde attack range
	dw $FFF5, $FFE8, $0038, $001C		;07 enguarde auto attack range
	dw $FFF7, $FFD5, $0036, $002E		;08 rambi attack range
	dw $FFF1, $FFDD, $0023, $0029		;09 stomp range?
	dw $FFF6, $FFE4, $0015, $0019		;0A thrown kong attack range
	dw $FFE2, $FFE8, $001F, $0023		;0B kleever range?
	dw $FFEE, $FFF1, $001B, $0014		;0C rattly auto stomp range
	dw $0008, $FFF8, $0024, $0010		;0D kutlass attack range
	dw $FFD0, $FFA8, $0050, $0060		;0E 

CODE_BCFA78:
	STZ $09A7				;$BCFA78  \
	STZ $09AF				;$BCFA7B   |
	STZ $09B7				;$BCFA7E   |
	STZ $09BF				;$BCFA81   |
	STZ $09C7				;$BCFA84   |
	STZ $09CF				;$BCFA87   |
	STZ $09EF				;$BCFA8A   |
	LDA #CODE_BCFCB5>>8			;$BCFA8D   |
	STA $09FA				;$BCFA90   |
	LDA #CODE_BCFCB5			;$BCFA93   |
	STA $09F9				;$BCFA96   |
	RTL					;$BCFA99  /

CODE_BCFA9A:
	PHD					;$BCFA9A  \
	LDY #$09AB				;$BCFA9B   |
	LDX current_sprite			;$BCFA9E   |
	CPX active_kong_sprite			;$BCFAA0   |
	BEQ CODE_BCFABA				;$BCFAA3   |
	LDY #CODE_BCFCA5>>8			;$BCFAA5   |
	STY $09FA				;$BCFAA8   |
	LDY #CODE_BCFCA5			;$BCFAAB   |
	STY $09F9				;$BCFAAE   |
	LDY #$0002				;$BCFAB1   |
	STY $0D38				;$BCFAB4   |
	LDY #$09C3				;$BCFAB7   |
CODE_BCFABA:					;	   |
	JSR CODE_BCFC40				;$BCFABA   |
	JSR CODE_BCFBDD				;$BCFABD   |
	PLD					;$BCFAC0   |
	RTL					;$BCFAC1  /

	PHD					;$BCFAC2   |
	LDY #$09A3				;$BCFAC3   |
	LDX current_sprite			;$BCFAC6   |
	CPX active_kong_sprite			;$BCFAC8   |
	BEQ CODE_BCFAE2				;$BCFACB   |
	LDY #CODE_BCFCA5>>8			;$BCFACD   |
	STY $09FA				;$BCFAD0   |
	LDY #CODE_BCFCA5			;$BCFAD3   |
	STY $09F9				;$BCFAD6   |
	LDY #$0002				;$BCFAD9   |
	STY $0D38				;$BCFADC   |
	LDY #$09BB				;$BCFADF   |
CODE_BCFAE2:					;	   |
	JSR CODE_BCFC40				;$BCFAE2   |
	JSR CODE_BCFBCC				;$BCFAE5   |
	PLD					;$BCFAE8   |
	RTL					;$BCFAE9  /

CODE_BCFAEA:
	LDX current_sprite			;$BCFAEA  \
	CPX active_kong_sprite			;$BCFAEC   |
	BNE CODE_BCFB1C				;$BCFAEF   |
	PHD					;$BCFAF1   |
	LDY #$09A3				;$BCFAF2   |
	BIT $09A7				;$BCFAF5   |
	BEQ CODE_BCFAFD				;$BCFAF8   |
	LDY #$09AB				;$BCFAFA   |
CODE_BCFAFD:					;	   |
	JSR get_sprite_clipping			;$BCFAFD   |
	LDA #$09A3				;$BCFB00   |
	JSR CODE_BCFBEE				;$BCFB03   |
	PLD					;$BCFB06   |
	LDX $0D5E				;$BCFB07   |
	BNE CODE_BCFB1D				;$BCFB0A   |
	LDA $6E					;$BCFB0C   |
	BEQ CODE_BCFB1C				;$BCFB0E   |
	LDX current_player_mount		;$BCFB10   |
	BEQ CODE_BCFB1C				;$BCFB12   |
	PHD					;$BCFB14   |
	LDY #$09EB				;$BCFB15   |
	JSR get_sprite_clipping			;$BCFB18   |
	PLD					;$BCFB1B   |
CODE_BCFB1C:					;	   |
	RTL					;$BCFB1C  /

CODE_BCFB1D:
	PHD					;$BCFB1D  \
	LDY #$09AB				;$BCFB1E   |
	JSR get_sprite_clipping			;$BCFB21   |
	LDA #$09A3				;$BCFB24   |
	JSR CODE_BCFBEE				;$BCFB27   |
	PLD					;$BCFB2A   |
	RTL					;$BCFB2B  /

CODE_BCFB2C:
	PHD					;$BCFB2C  \
	LDX inactive_kong_sprite		;$BCFB2D   |
	LDY #$09BB				;$BCFB30   |
	LDA $09BF				;$BCFB33   |
	BEQ CODE_BCFB41				;$BCFB36   |
	LDY #$0002				;$BCFB38   |
	STY $0D38				;$BCFB3B   |
	LDY #$09C3				;$BCFB3E   |
CODE_BCFB41:					;	   |
	JSR get_sprite_clipping			;$BCFB41   |
	LDA #$09BB				;$BCFB44   |
	JSR CODE_BCFBEE				;$BCFB47   |
	PLD					;$BCFB4A   |
	LDA #CODE_BCFCA5>>8			;$BCFB4B   |
	STA $09FA				;$BCFB4E   |
	LDA #CODE_BCFCA5			;$BCFB51   |
	STA $09F9				;$BCFB54   |
	RTL					;$BCFB57  /

CODE_BCFB58:
	PHD					;$BCFB58  \
	LDX current_sprite			;$BCFB59   |
	LDY #$09D3				;$BCFB5B   |
	JSR get_sprite_clipping			;$BCFB5E   |
	JSR CODE_BCFBCC				;$BCFB61   |
	PLD					;$BCFB64   |
	STZ $09DF				;$BCFB65   |
	RTL					;$BCFB68  /

CODE_BCFB69:
	PHD					;$BCFB69  \
	LDX current_sprite			;$BCFB6A   |
	LDY #$09D3				;$BCFB6C   |
	JSR CODE_BCFC40				;$BCFB6F   |
	JSR CODE_BCFBCC				;$BCFB72   |
	PLD					;$BCFB75   |
	STZ $09DF				;$BCFB76   |
	RTL					;$BCFB79  /

CODE_BCFB7A:
	PHD					;$BCFB7A  \
	LDX current_sprite			;$BCFB7B   |
	LDY #$09DB				;$BCFB7D   |
	JSR CODE_BCFC40				;$BCFB80   |
	LDA #$09D3				;$BCFB83   |
	JSR CODE_BCFBEE				;$BCFB86   |
	PLD					;$BCFB89   |
	RTL					;$BCFB8A  /

CODE_BCFB8B:
	PHD					;$BCFB8B  \
	LDX current_sprite			;$BCFB8C   |
	LDY #$09D3				;$BCFB8E   |
	JSR CODE_BCFC40				;$BCFB91   |
	LDA #$09D3				;$BCFB94   |
	TCD					;$BCFB97   |
	LDA $10					;$BCFB98   |
	STA $08					;$BCFB9A   |
	CMP $00					;$BCFB9C   |
	BCC CODE_BCFBA4				;$BCFB9E   |
	LDA $00					;$BCFBA0   |
	STA $10					;$BCFBA2   |
CODE_BCFBA4:					;	   |
	LDA $09E7				;$BCFBA4   |
	STA $09DF				;$BCFBA7   |
	CMP $04					;$BCFBAA   |
	BCS CODE_BCFBB2				;$BCFBAC   |
	LDA $04					;$BCFBAE   |
	STA $14					;$BCFBB0   |
CODE_BCFBB2:					;	   |
	LDA $12					;$BCFBB2   |
	STA $0A					;$BCFBB4   |
	CMP $02					;$BCFBB6   |
	BCC CODE_BCFBBE				;$BCFBB8   |
	LDA $02					;$BCFBBA   |
	STA $12					;$BCFBBC   |
CODE_BCFBBE:					;	   |
	LDA $16					;$BCFBBE   |
	STA $0E					;$BCFBC0   |
	CMP $06					;$BCFBC2   |
	BCS CODE_BCFBCA				;$BCFBC4   |
	LDA $06					;$BCFBC6   |
	STA $16					;$BCFBC8   |
CODE_BCFBCA:					;	   |
	PLD					;$BCFBCA   |
	RTL					;$BCFBCB  /

CODE_BCFBCC:
	LDA $00					;$BCFBCC  \
	STA $10					;$BCFBCE   |
	LDA $04					;$BCFBD0   |
	STA $14					;$BCFBD2   |
	LDA $06					;$BCFBD4   |
	STA $16					;$BCFBD6   |
	LDA $02					;$BCFBD8   |
	STA $12					;$BCFBDA   |
	RTS					;$BCFBDC  /

CODE_BCFBDD:
	LDA $00					;$BCFBDD  \
	STA $08					;$BCFBDF   |
	LDA $04					;$BCFBE1   |
	STA $0C					;$BCFBE3   |
	LDA $06					;$BCFBE5   |
	STA $0E					;$BCFBE7   |
	LDA $02					;$BCFBE9   |
	STA $0A					;$BCFBEB   |
	RTS					;$BCFBED  /

CODE_BCFBEE:
	TCD					;$BCFBEE  \
	LDA $0C					;$BCFBEF   |
	BEQ CODE_BCFC1E				;$BCFBF1   |
	LDA $04					;$BCFBF3   |
	BEQ CODE_BCFC2F				;$BCFBF5   |
	CMP $0C					;$BCFBF7   |
	BCS CODE_BCFBFD				;$BCFBF9   |
	LDA $0C					;$BCFBFB   |
CODE_BCFBFD:					;	   |
	STA $14					;$BCFBFD   |
	LDA $00					;$BCFBFF   |
	CMP $08					;$BCFC01   |
	BCC CODE_BCFC07				;$BCFC03   |
	LDA $08					;$BCFC05   |
CODE_BCFC07:					;	   |
	STA $10					;$BCFC07   |
	LDA $02					;$BCFC09   |
	CMP $0A					;$BCFC0B   |
	BCC CODE_BCFC11				;$BCFC0D   |
	LDA $0A					;$BCFC0F   |
CODE_BCFC11:					;	   |
	STA $12					;$BCFC11   |
	LDA $06					;$BCFC13   |
	CMP $0E					;$BCFC15   |
	BCS CODE_BCFC1B				;$BCFC17   |
	LDA $0E					;$BCFC19   |
CODE_BCFC1B:					;	   |
	STA $16					;$BCFC1B   |
	RTS					;$BCFC1D  /

CODE_BCFC1E:
	LDA $00					;$BCFC1E  \
	STA $10					;$BCFC20   |
	LDA $04					;$BCFC22   |
	STA $14					;$BCFC24   |
	LDA $06					;$BCFC26   |
	STA $16					;$BCFC28   |
	LDA $02					;$BCFC2A   |
	STA $12					;$BCFC2C   |
	RTS					;$BCFC2E  /

CODE_BCFC2F:
	LDA $08					;$BCFC2F  \
	STA $10					;$BCFC31   |
	LDA $0C					;$BCFC33   |
	STA $14					;$BCFC35   |
	LDA $0E					;$BCFC37   |
	STA $16					;$BCFC39   |
	LDA $0A					;$BCFC3B   |
	STA $12					;$BCFC3D   |
	RTS					;$BCFC3F  /

CODE_BCFC40:
	ASL A					;$BCFC40  \
	ASL A					;$BCFC41   |
	ASL A					;$BCFC42   |
	ADC #DATA_BCFA00			;$BCFC43   |
	BRA CODE_BCFC59				;$BCFC46  /

CODE_BCFC48:
	PHY					;$BCFC48  \
	PLD					;$BCFC49   |
	STA $04					;$BCFC4A   |
	RTS					;$BCFC4C  /

get_sprite_clipping:
	LDA $1A,x				;$BCFC4D  \ Get clipping ID
	BEQ CODE_BCFC48				;$BCFC4F   |
	LSR A					;$BCFC51   |
	PHX					;$BCFC52   |
	TAX					;$BCFC53   |
	LDA.l DATA_BCB600,x			;$BCFC54   | clipping pointer
	PLX					;$BCFC58   |
CODE_BCFC59:					;	   |
	PHB					;$BCFC59   |
	PHK					;$BCFC5A   |
	PLB					;$BCFC5B   |
	PHY					;$BCFC5C   |
	TAY					;$BCFC5D   |
	PLD					;$BCFC5E   |
	LDA $0006,x				;$BCFC5F   | Get sprite X position
	BIT $0012,x				;$BCFC62   |
	BVS .flip_x_clipping			;$BCFC65   |
	CLC					;$BCFC67   |
	ADC $0000,y				;$BCFC68   | Add clipping horizontal offset
	STA $00					;$BCFC6B   | Store leftmost position
	CLC					;$BCFC6D   |
	ADC $0004,y				;$BCFC6E   | Add clipping width
	STA $04					;$BCFC71   | Store rightmost position
	BRA .vertical_clipping			;$BCFC73  /

.flip_x_clipping
	SEC					;$BCFC75  \
	SBC $0000,y				;$BCFC76   | Subtract clipping horizontal offset
	STA $04					;$BCFC79   | Store rightmost position
	SEC					;$BCFC7B   |
	SBC $0004,y				;$BCFC7C   | Subtract clipping width
	STA $00					;$BCFC7F   | Store leftmost position
.vertical_clipping				;	   |
	LDA $000A,x				;$BCFC81   | Get sprite Y position
	BIT $0012,x				;$BCFC84   |
	BMI .flip_y_clipping			;$BCFC87   |
	CLC					;$BCFC89   |
	ADC $0002,y				;$BCFC8A   | Add clipping vertical offset
	STA $02					;$BCFC8D   | Store top position
	CLC					;$BCFC8F   |
	ADC $0006,y				;$BCFC90   | Add clipping height
	STA $06					;$BCFC93   | Store bottom position
	PLB					;$BCFC95   |
	RTS					;$BCFC96  /

.flip_y_clipping
	SEC					;$BCFC97  \
	SBC $0002,y				;$BCFC98   | Subtract clipping vertical offset
	STA $06					;$BCFC9B   | Store bottom position
	SEC					;$BCFC9D   |
	SBC $0006,y				;$BCFC9E   | Subtract clipping height
	STA $02					;$BCFCA1   | Store top position
	PLB					;$BCFCA3   |
	RTS					;$BCFCA4  /

CODE_BCFCA5:
	STA $EB					;$BCFCA5  \
	LDX inactive_kong_sprite		;$BCFCA7   |
	STX $6A					;$BCFCAA   |
	LDY #$0018				;$BCFCAC   |
	JSR check_for_collision			;$BCFCAF   |
	BCC CODE_BCFCC5				;$BCFCB2   |
	RTL					;$BCFCB4  /

CODE_BCFCB5:
	STA $EB					;$BCFCB5  \
	LDX active_kong_sprite			;$BCFCB7   |
	STX $6A					;$BCFCBA   |
	LDY #$0000				;$BCFCBC   |
	JSR check_for_collision			;$BCFCBF   |
	BCC CODE_BCFCC5				;$BCFCC2   |
	RTL					;$BCFCC4  /

CODE_BCFCC5:
	LDA $EB					;$BCFCC5  \
	BEQ CODE_BCFCDB				;$BCFCC7   |
	LDX active_kong_sprite			;$BCFCC9   |
	CPX $6A					;$BCFCCC   |
	BEQ CODE_BCFCDD				;$BCFCCE   |
	STX $6A					;$BCFCD0   |
	LDY #$0000				;$BCFCD2   |
	JSR check_for_collision			;$BCFCD5   |
	BCC CODE_BCFCDD				;$BCFCD8   |
	RTL					;$BCFCDA  /

CODE_BCFCDB:
	CLC					;$BCFCDB  \
	RTL					;$BCFCDC  /

CODE_BCFCDD:
	STZ $09F5				;$BCFCDD  \
	LDA $EB					;$BCFCE0   |
	AND $30,x				;$BCFCE2   |
	BEQ CODE_BCFD56				;$BCFCE4   |
	LDA $09EF				;$BCFCE6   |
	BEQ CODE_BCFD56				;$BCFCE9   |
	CMP $09E3				;$BCFCEB   |
	BCC CODE_BCFD56				;$BCFCEE   |
	LDA $09E7				;$BCFCF0   |
	CMP $09EB				;$BCFCF3   |
	BCC CODE_BCFD56				;$BCFCF6   |
	LDA $09E9				;$BCFCF8   |
	CMP $09ED				;$BCFCFB   |
	BCC CODE_BCFD56				;$BCFCFE   |
	LDA $09F1				;$BCFD00   |
	CMP $09E5				;$BCFD03   |
	BCC CODE_BCFD56				;$BCFD06   |
	LDA $09DF				;$BCFD08   |
	BEQ CODE_BCFD50				;$BCFD0B   |
	CMP $09EB				;$BCFD0D   |
	BCC CODE_BCFD30				;$BCFD10   |
	LDA $09EF				;$BCFD12   |
	CMP $09DB				;$BCFD15   |
	BCC CODE_BCFD30				;$BCFD18   |
	LDA $09E1				;$BCFD1A   |
	CMP $09ED				;$BCFD1D   |
	BCC CODE_BCFD30				;$BCFD20   |
	LDA $09F1				;$BCFD22   |
	CMP $09DD				;$BCFD25   |
	BCC CODE_BCFD30				;$BCFD28   |
	LDA #$0200				;$BCFD2A   |
	TSB $09F5				;$BCFD2D   |
CODE_BCFD30:					;	   |
	LDA $09EF				;$BCFD30   |
	CMP $09D3				;$BCFD33   |
	BCC CODE_BCFD56				;$BCFD36   |
	LDA $09D7				;$BCFD38   |
	CMP $09EB				;$BCFD3B   |
	BCC CODE_BCFD56				;$BCFD3E   |
	LDA $09D9				;$BCFD40   |
	CMP $09A5				;$BCFD43   |
	BCC CODE_BCFD56				;$BCFD46   |
	LDA $09A9				;$BCFD48   |
	CMP $09D5				;$BCFD4B   |
	BCC CODE_BCFD56				;$BCFD4E   |
CODE_BCFD50:					;	   |
	LDA #$0400				;$BCFD50   |
	TSB $09F5				;$BCFD53   |
CODE_BCFD56:					;	   |
	STZ $EB					;$BCFD56   |
	LDA $09F5				;$BCFD58   |
	CMP #$0001				;$BCFD5B   |
	RTL					;$BCFD5E  /

no_contact_return:
	CLC					;$BCFD5F  \
	RTS					;$BCFD60  /

check_for_collision:
	STZ $09F5				;$BCFD61  \
	LDA $EB					;$BCFD64   |
	AND $30,x				;$BCFD66   |
	BEQ no_contact_return			;$BCFD68   |
	LDA $09B7,y				;$BCFD6A   | Compare the right of the kong
	CMP $09E3				;$BCFD6D   | with the left of the sprite
	BCC no_contact_return			;$BCFD70   |
	LDA $09E7				;$BCFD72   | Compare the right of the sprite
	CMP $09B3,y				;$BCFD75   | with the left of the kong
	BCC no_contact_return			;$BCFD78   |
	LDA $09E9				;$BCFD7A   | Compare the bottom of the sprite
	CMP $09B5,y				;$BCFD7D   | with the top of the kong
	BCC no_contact_return			;$BCFD80   |
	LDA $09B9,y				;$BCFD82   | Compare the bottom of the kong
	CMP $09E5				;$BCFD85   | with the top of the sprite
	BCC no_contact_return			;$BCFD88   |
	LDA $09AF,y				;$BCFD8A   |
	BEQ CODE_BCFDB2				;$BCFD8D   |
	CMP $09D3				;$BCFD8F   |
	BCC CODE_BCFDB2				;$BCFD92   |
	LDA $09D7				;$BCFD94   |
	CMP $09AB,y				;$BCFD97   |
	BCC CODE_BCFDB2				;$BCFD9A   |
	LDA $09D9				;$BCFD9C   |
	CMP $09AD,y				;$BCFD9F   |
	BCC CODE_BCFDB2				;$BCFDA2   |
	LDA $09B1,y				;$BCFDA4   |
	CMP $09D5				;$BCFDA7   |
	BCC CODE_BCFDB2				;$BCFDAA   |
	LDA #$0001				;$BCFDAC   |
	TSB $09F5				;$BCFDAF   |
CODE_BCFDB2:					;	   |
	LDA $09DF				;$BCFDB2   |
	BEQ CODE_BCFDDA				;$BCFDB5   |
	CMP $09A3,y				;$BCFDB7   |
	BCC CODE_BCFDDA				;$BCFDBA   |
	LDA $09A7,y				;$BCFDBC   |
	CMP $09DB				;$BCFDBF   |
	BCC CODE_BCFDDA				;$BCFDC2   |
	LDA $09A9,y				;$BCFDC4   |
	CMP $09DD				;$BCFDC7   |
	BCC CODE_BCFDDA				;$BCFDCA   |
	LDA $09E1				;$BCFDCC   |
	CMP $09A5,y				;$BCFDCF   |
	BCC CODE_BCFDDA				;$BCFDD2   |
	LDA #$0002				;$BCFDD4   |
	TSB $09F5				;$BCFDD7   |
CODE_BCFDDA:					;	   |
	LDA $09A7,y				;$BCFDDA   |
	CMP $09D3				;$BCFDDD   |
	BCC CODE_BCFE00				;$BCFDE0   |
	LDA $09D7				;$BCFDE2   |
	CMP $09A3,y				;$BCFDE5   |
	BCC CODE_BCFE00				;$BCFDE8   |
	LDA $09D9				;$BCFDEA   |
	CMP $09A5,y				;$BCFDED   |
	BCC CODE_BCFE00				;$BCFDF0   |
	LDA $09A9,y				;$BCFDF2   |
	CMP $09D5				;$BCFDF5   |
	BCC CODE_BCFE00				;$BCFDF8   |
	LDA #$0004				;$BCFDFA   |
	TSB $09F5				;$BCFDFD   |
CODE_BCFE00:					;	   |
	LDA $09F5				;$BCFE00   |
	CMP #$0001				;$BCFE03   |
	RTS					;$BCFE06  /

CODE_BCFE07:
	PLB					;$BCFE07  \
	CLC					;$BCFE08   |
	RTL					;$BCFE09  /

CODE_BCFE0A:
	STA $EB					;$BCFE0A  \
	LDA #main_sprite_table_end		;$BCFE0C   |
	STA $6A					;$BCFE0F   |
	LDA $09E3				;$BCFE11   |
	STA $D9					;$BCFE14   |
	LDA $09E7				;$BCFE16   |
	STA $DD					;$BCFE19   |
	LDA $09E9				;$BCFE1B   |
	STA $DF					;$BCFE1E   |
	LDA $09E5				;$BCFE20   |
	STA $DB					;$BCFE23   |
	PHB					;$BCFE25   |
	PHK					;$BCFE26   |
	PLB					;$BCFE27   |
CODE_BCFE28:					;	   |
	LDA $6A					;$BCFE28   |
	SEC					;$BCFE2A   |
	SBC #sizeof(sprite)			;$BCFE2B   |
	STA $6A					;$BCFE2E   |
	CMP #$0E40				;$BCFE30   |
	BEQ CODE_BCFE07				;$BCFE33   |
	CMP current_sprite			;$BCFE35   |
	BEQ CODE_BCFE28				;$BCFE37   |
	TAX					;$BCFE39   |
	LDA $00,x				;$BCFE3A   |
	BEQ CODE_BCFE28				;$BCFE3C   |
	LDA $30,x				;$BCFE3E   |
	AND $EB					;$BCFE40   |
	BEQ CODE_BCFE28				;$BCFE42   |
	LDA $1A,x				;$BCFE44   |
	LSR A					;$BCFE46   |
	TAY					;$BCFE47   |
	LDA DATA_BCB600,y			;$BCFE48   |
	TAY					;$BCFE4B   |
	LDA $0A,x				;$BCFE4C   |
	BIT $12,x				;$BCFE4E   |
	BPL CODE_BCFE69				;$BCFE50   |
	SEC					;$BCFE52   |
	SBC $0002,y				;$BCFE53   |
	CMP $DB					;$BCFE56   |
	BCC CODE_BCFE28				;$BCFE58   |
	STA $E7					;$BCFE5A   |
	SBC $0006,y				;$BCFE5C   |
	CMP $DF					;$BCFE5F   |
	BCC CODE_BCFE65				;$BCFE61   |
	BNE CODE_BCFE28				;$BCFE63   |
CODE_BCFE65:					;	   |
	STA $E3					;$BCFE65   |
	BRA CODE_BCFE7F				;$BCFE67  /

CODE_BCFE69:
	CLC					;$BCFE69  \
	ADC $0002,y				;$BCFE6A   |
	CMP $DF					;$BCFE6D   |
	BCC CODE_BCFE74				;$BCFE6F   |
	BNE CODE_BCFE28				;$BCFE71   |
	CLC					;$BCFE73   |
CODE_BCFE74:					;	   |
	STA $E3					;$BCFE74   |
	ADC $0006,y				;$BCFE76   |
	CMP $DB					;$BCFE79   |
	BCC CODE_BCFE28				;$BCFE7B   |
	STA $E7					;$BCFE7D   |
CODE_BCFE7F:					;	   |
	LDA $06,x				;$BCFE7F   |
	BIT $12,x				;$BCFE81   |
	BVC CODE_BCFE9C				;$BCFE83   |
	SEC					;$BCFE85   |
	SBC $0000,y				;$BCFE86   |
	CMP $D9					;$BCFE89   |
	BCC CODE_BCFE28				;$BCFE8B   |
	STA $E5					;$BCFE8D   |
	SBC $0004,y				;$BCFE8F   |
	CMP $DD					;$BCFE92   |
	BCC CODE_BCFE98				;$BCFE94   |
	BNE CODE_BCFE28				;$BCFE96   |
CODE_BCFE98:					;	   |
	STA $E1					;$BCFE98   |
	BRA CODE_BCFEB5				;$BCFE9A  /

CODE_BCFE9C:
	CLC					;$BCFE9C  \
	ADC $0000,y				;$BCFE9D   |
	CMP $DD					;$BCFEA0   |
	BCC CODE_BCFEA7				;$BCFEA2   |
	BNE CODE_BCFE28				;$BCFEA4   |
	CLC					;$BCFEA6   |
CODE_BCFEA7:					;	   |
	STA $E1					;$BCFEA7   |
	ADC $0004,y				;$BCFEA9   |
	CMP $D9					;$BCFEAC   |
	BCS CODE_BCFEB3				;$BCFEAE   |
	BRL CODE_BCFE28				;$BCFEB0  /

CODE_BCFEB3:
	STA $E5					;$BCFEB3  \
CODE_BCFEB5:					;	   |
	PLB					;$BCFEB5   |
	SEC					;$BCFEB6   |
	RTL					;$BCFEB7  /

	LDX #$00E1				;$BCFEB8   |
	LDY #$09AB				;$BCFEBB   |
	BRA CODE_BCFEE8				;$BCFEBE  /

CODE_BCFEC0:
	LDX #$00E1				;$BCFEC0  \
	LDY #$09B3				;$BCFEC3   |
	BRA CODE_BCFEE8				;$BCFEC6  /

CODE_BCFEC8:
	LDX #$00E1				;$BCFEC8  \
	LDY #$09A3				;$BCFECB   |
	BRA CODE_BCFEE8				;$BCFECE  /

	LDX #$00D9				;$BCFED0   |
	LDY #$09DB				;$BCFED3   |
	BRA CODE_BCFF03				;$BCFED6  /

CODE_BCFED8:
	LDX #$00D9				;$BCFED8  \
	LDY #$09E3				;$BCFEDB   |
	BRA CODE_BCFF03				;$BCFEDE  /

CODE_BCFEE0:
	LDX #$00D9				;$BCFEE0  \
	LDY #$09D3				;$BCFEE3   |
	BRA CODE_BCFF03				;$BCFEE6  /

CODE_BCFEE8:
	LDA $6A					;$BCFEE8  \
	CMP active_kong_sprite			;$BCFEEA   |
	BEQ CODE_BCFF03				;$BCFEED   |
	CMP inactive_kong_sprite		;$BCFEEF   |
	BNE CODE_BCFEFC				;$BCFEF2   |
	TYA					;$BCFEF4   |
	CLC					;$BCFEF5   |
	ADC #$0018				;$BCFEF6   |
	TAY					;$BCFEF9   |
	BRA CODE_BCFF03				;$BCFEFA  /

CODE_BCFEFC:
	CMP current_player_mount		;$BCFEFC  \
	BNE CODE_BCFF1B				;$BCFEFE   |
	LDY #$09EB				;$BCFF00   |
CODE_BCFF03:					;	   |
	LDA $0004,y				;$BCFF03   |
	BEQ CODE_BCFF1B				;$BCFF06   |
	STA $04,x				;$BCFF08   |
	LDA $0000,y				;$BCFF0A   |
	STA $00,x				;$BCFF0D   |
	LDA $0006,y				;$BCFF0F   |
	STA $06,x				;$BCFF12   |
	LDA $0002,y				;$BCFF14   |
	STA $02,x				;$BCFF17   |
	CLC					;$BCFF19   |
	RTL					;$BCFF1A  /

CODE_BCFF1B:
	SEC					;$BCFF1B  \
	RTL					;$BCFF1C  /

CODE_BCFF1D:
	STA $EB					;$BCFF1D  \
	LDA #main_sprite_table_end		;$BCFF1F   |
	STA $6A					;$BCFF22   |
	LDA $09E3				;$BCFF24   |
	STA $D9					;$BCFF27   |
	LDA $09E7				;$BCFF29   |
	STA $DD					;$BCFF2C   |
	LDA $09E9				;$BCFF2E   |
	STA $DF					;$BCFF31   |
	LDA $09E5				;$BCFF33   |
	STA $DB					;$BCFF36   |
CODE_BCFF38:					;	   |
	PHB					;$BCFF38   |
	PHK					;$BCFF39   |
	PLB					;$BCFF3A   |
CODE_BCFF3B:					;	   |
	LDA $6A					;$BCFF3B   |
	CMP #$0D85				;$BCFF3D   |
	BCC CODE_BCFF6E				;$BCFF40   |
	SBC #sizeof(sprite)			;$BCFF42   |
	STA $6A					;$BCFF45   |
	CMP current_sprite			;$BCFF47   |
	BEQ CODE_BCFF3B				;$BCFF49   |
	TAX					;$BCFF4B   |
	LDA $00,x				;$BCFF4C   |
	BEQ CODE_BCFF3B				;$BCFF4E   |
	LDA $30,x				;$BCFF50   |
	AND $EB					;$BCFF52   |
	BEQ CODE_BCFF3B				;$BCFF54   |
	LDA $0A,x				;$BCFF56   |
	CMP $DB					;$BCFF58   |
	BCC CODE_BCFF3B				;$BCFF5A   |
	CMP $DF					;$BCFF5C   |
	BCS CODE_BCFF3B				;$BCFF5E   |
	LDA $06,x				;$BCFF60   |
	CMP $D9					;$BCFF62   |
	BCC CODE_BCFF3B				;$BCFF64   |
	DEC A					;$BCFF66   |
	CMP $DD					;$BCFF67   |
	BCS CODE_BCFF3B				;$BCFF69   |
	PLB					;$BCFF6B   |
	SEC					;$BCFF6C   |
	RTL					;$BCFF6D  /

CODE_BCFF6E:
	PLB					;$BCFF6E  \
	CLC					;$BCFF6F   |
	RTL					;$BCFF70  /
