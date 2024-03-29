spc_base_engine:

arch spc700
base $04D8

CODE_04D8:
	CLRP					;$04D8   |
	MOV X, #$FF				;$04D9   |
	MOV SP, X				;$04DB   |
	INC X					;$04DC   |
	MOV $F4, X				;$04DD   |
	INC X					;$04DF   |
	MOV $E9, X				;$04E0   |
	MOV A, #$00				;$04E2   |
	MOV $00, A				;$04E4   |
	MOV $01, #$D0				;$04E6   |
CODE_04E9:					;   |
	MOV Y, A				;$04E9   |
CODE_04EA:					;   |
	MOV ($00)+Y, A				;$04EA   |
	INC Y					;$04EC   |
	BNE CODE_04EA				;$04ED   |
	INC $01					;$04EF   |
	BNE CODE_04E9				;$04F1   |
CODE_04F3:					;   |
	MOV X, #$FF				;$04F3   |
	MOV $F2, #$6C				;$04F5   |
	MOV $F3, X				;$04F8   |
	MOV $F2, #$7D				;$04FA   |
	MOV $F3, #$00				;$04FD   |
	MOV $F2, #$6D				;$0500   |
	MOV $F3, X				;$0503   |
	MOV $04B7, X				;$0505   |
	MOV X, $E9				;$0508   |
CODE_050A:					;   |
	CMP X, $F4				;$050A   |
	BNE CODE_050A				;$050C   |
	MOVW YA, $F5				;$050E   |
	MOV $F4, X				;$0510   |
	INC X					;$0512   |
	MOV $0539, A				;$0513   |
	MOV $0542, A				;$0516   |
	MOV $053A, Y				;$0519   |
	MOV $0543, Y				;$051C   |
CODE_051F:					;   |
	CMP X, $F4				;$051F   |
	BNE CODE_051F				;$0521   |
	MOVW YA, $F5				;$0523   |
	MOV $F4, X				;$0525   |
	INC X					;$0527   |
	MOV $EA, A				;$0528   |
	MOV $EB, Y				;$052A   |
	DECW $EA				;$052C   |
	BMI CODE_0556				;$052E   |
	MOV Y, #$00				;$0530   |
CODE_0532:					;   |
	CMP X, $F4				;$0532   |
	BNE CODE_0532				;$0534   |
	MOV A, $F5				;$0536   |
DATA_0538:					;   |
	MOV $0000+Y, A				;$0538   |
	MOV A, $F6				;$053B   |
	MOV $F4, X				;$053D   |
	INC X					;$053F   |
	INC Y					;$0540   |
	MOV $0000+Y, A				;$0541   |
	INC Y					;$0544   |
	BEQ CODE_054E				;$0545   |
CODE_0547:					;   |
	DECW $EA				;$0547   |
	BPL CODE_0532				;$0549   |
	JMP CODE_050A				;$054B   |

CODE_054E:
	INC $053A				;$054E   |
	INC $0543				;$0551   |
	BRA CODE_0547				;$0554   |

CODE_0556:
	MOV $E9, X				;$0556   |
	MOV X, #$00				;$0558   |
	JMP (DATA_0538+1+X)			;$055A   |

	db $00
	dw $D604

base off
arch 65816

spc_sound_engine:
arch spc700
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00

base $0660
CODE_0660:
	MOV A, $055D				;$0660   |
	ASL A					;$0663   |
	MOV Y, A				;$0664   |
	MOV A, $1312+Y				;$0665   |
	MOV $E5, A				;$0668   |
	MOV A, $1313+Y				;$066A   |
	MOV $E6, A				;$066D   |
	JMP CODE_0678				;$066F   |

CODE_0672:
	MOV $E6, #$13				;$0672   |
	MOV $E5, #$00				;$0675   |
CODE_0678:					;   |
	CALL CODE_100B				;$0678   |
	MOV A, #$00				;$067B   |
	MOV $1C, A				;$067D   |
	MOV $1D, A				;$067F   |
	MOV $F1, A				;$0681   |
CODE_0683:					;   |
	MOV A, $E9				;$0683   |
	CMP A, $F4				;$0685   |
	BEQ CODE_068C				;$0687   |
	JMP CODE_0781				;$0689   |

CODE_068C:
	MOV X, $F6				;$068C   |
	MOV $055D, X				;$068E   |
	MOV X, $F5				;$0691   |
	MOV $F4, A				;$0693   |
	INC A					;$0695   |
	MOV $E9, A				;$0696   |
	MOV A, X				;$0698   |
	CMP A, #$80				;$0699   |
	BPL CODE_06A0				;$069B   |
	JMP CODE_0773				;$069D   |

CODE_06A0:
	AND A, #$07				;$06A0   |
	ASL A					;$06A2   |
	MOV X, A				;$06A3   |
	JMP (DATA_06A7+X)			;$06A4   |

DATA_06A7:
	dw CODE_070A
	dw CODE_0702
	dw CODE_06FA
	dw CODE_06B7
	dw CODE_0739
	dw CODE_0712
	dw CODE_077B
	dw CODE_07DB

CODE_06B7:
	MOV X, #$7F				;$06B7   |
CODE_06B9:					;   |
	MOV A, #$71				;$06B9   |
CODE_06BB:					;   |
	MOV Y, A				;$06BB   |
	MOV $F2, Y				;$06BC   |
	CALL CODE_06EB				;$06BE   |
	DEC Y					;$06C1   |
	MOV $F2, Y				;$06C2   |
	CALL CODE_06EB				;$06C4   |
	MOV A, Y				;$06C7   |
	SETC					;$06C8   |
	SBC A, #$0F				;$06C9   |
	BPL CODE_06BB				;$06CB   |
	MOV $F2, #$0C				;$06CD   |
	CALL CODE_06EB				;$06D0   |
	MOV $F2, #$1C				;$06D3   |
	CALL CODE_06EB				;$06D6   |
	MOV $F2, #$2C				;$06D9   |
	CALL CODE_06EB				;$06DC   |
	MOV $F2, #$3C				;$06DF   |
	CALL CODE_06EB				;$06E2   |
	DEC X					;$06E5   |
	BNE CODE_06B9				;$06E6   |
	JMP CODE_0660				;$06E8   |

CODE_06EB:
	MOV A, $F3				;$06EB   |
	BEQ CODE_06F7				;$06ED   |
	BMI CODE_06F5				;$06EF   |
	DEC A					;$06F1   |
	DEC A					;$06F2   |
	BRA CODE_06F7				;$06F3   |

CODE_06F5:
	INC A					;$06F5   |
	INC A					;$06F6   |
CODE_06F7:					;   |
	MOV $F3, A				;$06F7   |
	RET					;$06F9   |

CODE_06FA:					;   |
	MOV A, $055D				;$06FA   |
	MOV $1D, A				;$06FD   |
	JMP CODE_0781				;$06FF   |

CODE_0702:					;   |
	MOV A, $055D				;$0702   |
	MOV $E7, A				;$0705   |
	JMP CODE_0781				;$0707   |

CODE_070A:					;   |
	MOV A, $055D				;$070A   |
	MOV $E8, A				;$070D   |
	JMP CODE_0781				;$070F   |

CODE_0712:					;   |
	MOV A, $04B6				;$0712   |
	PUSH A					;$0715   |
	PUSH X					;$0716   |
	MOV X, #$05				;$0717   |
	MOV A, $055D				;$0719   |
	MOV $04B6, A				;$071C   |
	MOV $F2, #$50				;$071F   |
	MOV A, $F3				;$0722   |
	CALL CODE_0C59				;$0724   |
	MOV $F3, A				;$0727   |
	INC $F2					;$0729   |
	MOV A, $F3				;$072B   |
	CALL CODE_0C59				;$072D   |
	MOV $F3, A				;$0730   |
	POP X					;$0732   |
	POP A					;$0733   |
	MOV $04B6, A				;$0734   |
	BRA CODE_0781				;$0737   |

CODE_0739:					;   |
	MOV A, $055D				;$0739   |
	BMI CODE_074A				;$073C   |
	CLRC					;$073E   |
	MOV A, $055D				;$073F   |
	MOV $EC, A				;$0742   |
	MOV A, #$00				;$0744   |
	MOV $ED, A				;$0746   |
	BRA CODE_0756				;$0748   |

CODE_074A:
	MOV $055D, A				;$074A   |
	MOV A, $055D				;$074D   |
	MOV $EC, A				;$0750   |
	MOV A, #$FF				;$0752   |
	MOV $ED, A				;$0754   |
CODE_0756:					;   |
	MOVW YA, $EC				;$0756   |
	ADDW YA, $EC				;$0758   |
	ADDW YA, $EC				;$075A   |
	ADDW YA, $EC				;$075C   |
	ADDW YA, $EC				;$075E   |
	ADDW YA, $EC				;$0760   |
	ADDW YA, $EC				;$0762   |
	ADDW YA, $EC				;$0764   |
	MOVW $EC, YA				;$0766   |
	MOV $F2, #$4D				;$0768   |
	MOV A, $F3				;$076B   |
	AND A, #$DF				;$076D   |
	MOV $F3, A				;$076F   |
	BRA CODE_0781				;$0771   |

CODE_0773:					;   |
	MOV X, $055D				;$0773   |
	CALL CODE_10F7				;$0776   |
	BRA CODE_078E				;$0779   |

CODE_077B:					;   |
	MOV $1C, #$01				;$077B   |
	MOV $F1, #$00				;$077E   |

CODE_0781:
	MOV A, $1C				;$0781   |
	BNE CODE_0788				;$0783   |
	JMP CODE_0683				;$0785   |

CODE_0788:
	MOV ($FA), ($E4)			;$0788   |
	MOV $F1, #$01				;$078B   |
CODE_078E:					;   |
	MOV A, $FD				;$078E   |
	BEQ CODE_078E				;$0790   |
	MOV $F1, #$01				;$0792   |
	MOV $20, #$00				;$0795   |
	CLRC					;$0798   |
	ADC ($1E), ($1F)			;$0799   |
	ROR $20					;$079C   |
	MOV $23, #$00				;$079E   |
	CLRC					;$07A1   |
	ADC ($21), ($22)			;$07A2   |
	ROR $23					;$07A5   |
	MOV X, #$00				;$07A7   |
CODE_07A9:					;   |
	MOV A, $20				;$07A9   |
	BNE CODE_07B2				;$07AB   |
	CALL CODE_09BC				;$07AD   |
	BRA CODE_07B7				;$07B0   |

CODE_07B2:
	CALL CODE_0813				;$07B2   |
	BNE CODE_07B2				;$07B5   |
CODE_07B7:					;   |
	MOV A, $01E0+X				;$07B7   |
	BEQ CODE_07D0				;$07BA   |
	PUSH X					;$07BC   |
	MOV A, X				;$07BD   |
	OR A, #$08				;$07BE   |
	MOV X, A				;$07C0   |
	MOV A, $23				;$07C1   |
	BNE CODE_07CA				;$07C3   |
	CALL CODE_09BC				;$07C5   |
	BRA CODE_07CF				;$07C8   |

CODE_07CA:
	CALL CODE_0813				;$07CA   |
	BNE CODE_07CA				;$07CD   |
CODE_07CF:					;   |
	POP X					;$07CF   |
CODE_07D0:					;   |
	INC X					;$07D0   |
	CMP X, #$08				;$07D1   |
	BEQ CODE_07D8				;$07D3   |
	JMP CODE_07A9				;$07D5   |

CODE_07D8:
	JMP CODE_0683				;$07D8   |

CODE_07DB:
	MOV A, $055D				;$07DB   |
	BEQ CODE_07E3				;$07DE   |
	JMP CODE_04F3				;$07E0   |

CODE_07E3:
	MOV $F2, #$5C				;$07E3   |
	MOV $F3, #$FF				;$07E6   |
	MOV $F1, #$00				;$07E9   |
	MOV $FB, #$C8				;$07EC   |
	MOV $F1, #$02				;$07EF   |
CODE_07F2:					;   |
	MOV A, $FE				;$07F2   |
	BEQ CODE_07F2				;$07F4   |
	MOV $F2, #$6C				;$07F6   |
	MOV $F3, #$A0				;$07F9   |
	MOV X, #$00				;$07FC   |
	MOV $F2, #$4D				;$07FE   |
	MOV $F3, X				;$0801   |
	MOV $F2, #$2C				;$0803   |
	MOV $F3, X				;$0806   |
	MOV $F2, #$3C				;$0808   |
	MOV $F3, X				;$080B   |
	CALL CODE_100B				;$080D   |
	JMP CODE_04F3				;$0810   |

CODE_0813:
	MOV A, $0110+X				;$0813   |
	BNE CODE_081B				;$0816   |
	MOV A, #$00				;$0818   |
	RET					;$081A   |

CODE_081B:
	DEC $34+X				;$081B   |
	MOV A, $34+X				;$081D   |
	CMP A, #$01				;$081F   |
	BEQ CODE_0839				;$0821   |
	CMP A, #$FF				;$0823   |
	BNE CODE_082F				;$0825   |
	MOV A, $24+X				;$0827   |
	BEQ CODE_0850				;$0829   |
	DEC $24+X				;$082B   |
	BRA CODE_084A				;$082D   |

CODE_082F:
	CMP A, #$00				;$082F   |
	BNE CODE_084A				;$0831   |
	MOV A, $24+X				;$0833   |
	BEQ CODE_0850				;$0835   |
	BRA CODE_084A				;$0837   |

CODE_0839:
	MOV A, $24+X				;$0839   |
	BNE CODE_084A				;$083B   |
	MOV A, $01E0+X				;$083D   |
	BNE CODE_084A				;$0840   |
	MOV A, $0F95+X				;$0842   |
	MOV $F2, #$5C				;$0845   |
	MOV $F3, A				;$0848   |
CODE_084A:					;   |
	CALL CODE_09BC				;$084A   |
	MOV A, #$00				;$084D   |
	RET					;$084F   |

CODE_0850:
	MOV A, $44+X				;$0850   |
	MOV Y, $54+X				;$0852   |
	MOVW $00, YA				;$0854   |
	MOV Y, #$00				;$0856   |
	MOV A, ($00)+Y				;$0858   |
	BMI CODE_0862				;$085A   |
	PUSH X					;$085C   |
	ASL A					;$085D   |
	MOV X, A				;$085E   |
	JMP (DATA_0FA5+X)			;$085F   |

CODE_0862:
	CALL CODE_0867				;$0862   |
	BRA CODE_084A				;$0865   |

CODE_0867:
	CMP A, #$80				;$0867   |
	BNE CODE_088B				;$0869   |
	MOV A, $01E0+X				;$086B   |
	BNE CODE_0888				;$086E   |
	MOV A, $0F95+X				;$0870   |
	MOV $F2, #$5C				;$0873   |
	MOV $F3, A				;$0876   |
	MOV A, X				;$0878   |
	AND A, #$07				;$0879   |
	XCN A					;$087B   |
	OR A, #$02				;$087C   |
	MOV $F2, A				;$087E   |
	MOV A, #$00				;$0880   |
	MOV $F3, A				;$0882   |
	INC $F2					;$0884   |
	MOV $F3, A				;$0886   |
CODE_0888:					;   |
	JMP CODE_0983				;$0888   |

CODE_088B:
	CMP A, #$E0				;$088B   |
	BMI CODE_0899				;$088D   |
	CMP A, #$E1				;$088F   |
	BEQ CODE_0897				;$0891   |
	MOV A, $0C+X				;$0893   |
	BRA CODE_0899				;$0895   |

CODE_0897:
	MOV A, $14+X				;$0897   |
CODE_0899:					;   |
	CLRC					;$0899   |
	ADC A, #$24				;$089A   |
	ADC A, $0140+X				;$089C   |
	ASL A					;$089F   |
	PUSH X					;$08A0   |
	MOV Y, $64+X				;$08A1   |
	BEQ CODE_08DF				;$08A3   |
	MOV X, A				;$08A5   |
	MOV $04, Y				;$08A6   |
	MOV A, Y				;$08A8   |
	BPL CODE_08AE				;$08A9   |
	EOR A, #$FF				;$08AB   |
	INC A					;$08AD   |
CODE_08AE:					;   |
	MOV Y, A				;$08AE   |
	PUSH Y					;$08AF   |
	MOV A, $1199+X				;$08B0   |
	MUL YA					;$08B3   |
	MOV $02, Y				;$08B4   |
	MOV $03, #$00				;$08B6   |
	POP Y					;$08B9   |
	MOV A, $119A+X				;$08BA   |
	MUL YA					;$08BD   |
	ADDW YA, $02				;$08BE   |
	MOV $03, Y				;$08C0   |
	LSR $03					;$08C2   |
	ROR A					;$08C4   |
	LSR $03					;$08C5   |
	ROR A					;$08C7   |
	MOV $02, A				;$08C8   |
	MOV A, $119A+X				;$08CA   |
	MOV Y, A				;$08CD   |
	MOV A, $1199+X				;$08CE   |
	MOV X, $04				;$08D1   |
	BMI CODE_08D9				;$08D3   |
	ADDW YA, $02				;$08D5   |
	BRA CODE_08DB				;$08D7   |

CODE_08D9:
	SUBW YA, $02				;$08D9   |
CODE_08DB:					;   |
	MOVW $02, YA				;$08DB   |
	BRA CODE_08EA				;$08DD   |

CODE_08DF:
	MOV X, A				;$08DF   |
	MOV A, $1199+X				;$08E0   |
	MOV $02, A				;$08E3   |
	MOV A, $119A+X				;$08E5   |
	MOV $03, A				;$08E8   |
CODE_08EA:					;   |
	POP A					;$08EA   |
	MOV X, A				;$08EB   |
	AND A, #$07				;$08EC   |
	XCN A					;$08EE   |
	MOV $F2, A				;$08EF   |
	MOV A, $01E0+X				;$08F1   |
	BEQ CODE_08F9				;$08F4   |
	JMP CODE_0983				;$08F6   |

CODE_08F9:
	MOV A, $0254+X				;$08F9   |
	CALL CODE_0C59				;$08FC   |
	MOV $F3, A				;$08FF   |
	INC $F2					;$0901   |
	MOV A, $0264+X				;$0903   |
	CALL CODE_0C59				;$0906   |
	MOV $F3, A				;$0909   |
	INC $F2					;$090B   |
	MOV A, $0150+X				;$090D   |
	AND A, #$01				;$0910   |
	BEQ CODE_092B				;$0912   |
	MOV A, $0160+X				;$0914   |
	MOV $01A0+X, A				;$0917   |
	MOV A, $0170+X				;$091A   |
	MOV $0100+X, A				;$091D   |
	MOV A, $0180+X				;$0920   |
	MOV $94+X, A				;$0923   |
	MOV A, $0190+X				;$0925   |
	MOV $01C0+X, A				;$0928   |
CODE_092B:					;   |
	MOV A, $0150+X				;$092B   |
	AND A, #$02				;$092E   |
	BEQ CODE_094D				;$0930   |
	MOV A, $0234+X				;$0932   |
	BPL CODE_093D				;$0935   |
	EOR A, #$FF				;$0937   |
	INC A					;$0939   |
	MOV $0234+X, A				;$093A   |
CODE_093D:					;   |
	MOV A, $0200+X				;$093D   |
	LSR A					;$0940   |
	MOV $A4+X, A				;$0941   |
	MOV A, $0210+X				;$0943   |
	MOV $B4+X, A				;$0946   |
	MOV A, $0220+X				;$0948   |
	MOV $C4+X, A				;$094B   |
CODE_094D:					;   |
	MOV A, $02				;$094D   |
	MOV $84+X, A				;$094F   |
	MOV $F3, A				;$0951   |
	INC $F2					;$0953   |
	MOV A, $03				;$0955   |
	MOV $74+X, A				;$0957   |
	MOV $F3, A				;$0959   |
	INC $F2					;$095B   |
	MOV A, $0244+X				;$095D   |
	MOV $F3, A				;$0960   |
	INC $F2					;$0962   |
	MOV A, $0274+X				;$0964   |
	MOV $F3, A				;$0967   |
	INC $F2					;$0969   |
	MOV A, $0284+X				;$096B   |
	MOV $F3, A				;$096E   |
	INC $F2					;$0970   |
	MOV $F3, #$7F				;$0972   |
	MOV $F2, #$5C				;$0975   |
	MOV $F3, #$00				;$0978   |
	MOV $F2, #$4C				;$097B   |
	MOV A, $0F95+X				;$097E   |
	MOV $F3, A				;$0981   |
CODE_0983:					;   |
	MOV A, $0120+X				;$0983   |
	BEQ CODE_0997				;$0986   |
	MOV $00, #$01				;$0988   |
	MOV A, $0120+X				;$098B   |
	MOV $34+X, A				;$098E   |
	MOV A, $0130+X				;$0990   |
	MOV $24+X, A				;$0993   |
	BRA CODE_09AE				;$0995   |

CODE_0997:
	MOV Y, #$01				;$0997   |
	MOV A, ($00)+Y				;$0999   |
	MOV $34+X, A				;$099B   |
	MOV A, $01D0+X				;$099D   |
	BEQ CODE_09AB				;$09A0   |
	MOV A, $34+X				;$09A2   |
	MOV $24+X, A				;$09A4   |
	INC Y					;$09A6   |
	MOV A, ($00)+Y				;$09A7   |
	MOV $34+X, A				;$09A9   |
CODE_09AB:					;   |
	INC Y					;$09AB   |
	MOV $00, Y				;$09AC   |
CODE_09AE:					;   |
	MOV $01, #$00				;$09AE   |
	MOV A, $44+X				;$09B1   |
	MOV Y, $54+X				;$09B3   |
	ADDW YA, $00				;$09B5   |
	MOV $54+X, Y				;$09B7   |
	MOV $44+X, A				;$09B9   |
	RET					;$09BB   |

CODE_09BC:
	MOV A, $0150+X				;$09BC   |
	AND A, #$01				;$09BF   |
	BNE CODE_09C6				;$09C1   |
	JMP CODE_0A39				;$09C3   |

CODE_09C6:
	MOV A, $01A0+X				;$09C6   |
	BEQ CODE_09DA				;$09C9   |
	CMP A, #$FF				;$09CB   |
	BEQ CODE_0A39				;$09CD   |
	DEC A					;$09CF   |
	MOV $01A0+X, A				;$09D0   |
	BNE CODE_0A39				;$09D3   |
	MOV A, #$01				;$09D5   |
	MOV $0100+X, A				;$09D7   |
CODE_09DA:					;   |
	MOV A, $0100+X				;$09DA   |
	DEC A					;$09DD   |
	MOV $0100+X, A				;$09DE   |
	BNE CODE_0A39				;$09E1   |
	MOV A, $0170+X				;$09E3   |
	MOV $0100+X, A				;$09E6   |
	MOV A, $01C0+X				;$09E9   |
	BEQ CODE_0A10				;$09EC   |
	DEC A					;$09EE   |
	MOV $01C0+X, A				;$09EF   |
	MOV A, $01B0+X				;$09F2   |
	EOR A, #$FF				;$09F5   |
	INC A					;$09F7   |
	MOV $00, A				;$09F8   |
	BPL CODE_0A00				;$09FA   |
	MOV A, #$FF				;$09FC   |
	BRA CODE_0A02				;$09FE   |

CODE_0A00:
	MOV A, #$00				;$0A00   |
CODE_0A02:					;   |
	MOV $01, A				;$0A02   |
	MOV A, $84+X				;$0A04   |
	MOV Y, $74+X				;$0A06   |
	ADDW YA, $00				;$0A08   |
	MOV $74+X, Y				;$0A0A   |
	MOV $84+X, A				;$0A0C   |
	BRA CODE_0A1B				;$0A0E   |

CODE_0A10:
	MOV A, $01B0+X				;$0A10   |
	MOV $00, A				;$0A13   |
	BPL CODE_0A00				;$0A15   |
	MOV A, #$FF				;$0A17   |
	BRA CODE_0A02				;$0A19   |

CODE_0A1B:
	MOV A, $01E0+X				;$0A1B   |
	BNE CODE_0A30				;$0A1E   |
	MOV A, X				;$0A20   |
	AND A, #$07				;$0A21   |
	XCN A					;$0A23   |
	OR A, #$02				;$0A24   |
	MOV $F2, A				;$0A26   |
	MOV A, $84+X				;$0A28   |
	MOV $F3, A				;$0A2A   |
	INC $F2					;$0A2C   |
	MOV $F3, Y				;$0A2E   |
CODE_0A30:					;   |
	DEC $94+X				;$0A30   |
	BNE CODE_0A39				;$0A32   |
	MOV A, #$FF				;$0A34   |
	MOV $01A0+X, A				;$0A36   |
CODE_0A39:					;   |
	MOV A, $0150+X				;$0A39   |
	AND A, #$02				;$0A3C   |
	BEQ CODE_0AB4				;$0A3E   |
	MOV A, $C4+X				;$0A40   |
	BEQ CODE_0A48				;$0A42   |
	DEC $C4+X				;$0A44   |
	BRA CODE_0AB4				;$0A46   |

CODE_0A48:
	DEC $B4+X				;$0A48   |
	BNE CODE_0AB4				;$0A4A   |
	MOV A, $0210+X				;$0A4C   |
	MOV $B4+X, A				;$0A4F   |
	MOV A, $0234+X				;$0A51   |
	MOV $00, A				;$0A54   |
	BPL CODE_0A5C				;$0A56   |
	MOV A, #$FF				;$0A58   |
	BRA CODE_0A5E				;$0A5A   |

CODE_0A5C:
	MOV A, #$00				;$0A5C   |
CODE_0A5E:					;   |
	MOV $01, A				;$0A5E   |
	MOV A, $84+X				;$0A60   |
	MOV Y, $74+X				;$0A62   |
	CMP X, #$0D				;$0A64   |
	BNE CODE_0A87				;$0A66   |
	PUSH A					;$0A68   |
	MOV A, $EC				;$0A69   |
	CMP A, $EE				;$0A6B   |
	BNE CODE_0A78				;$0A6D   |
	MOV A, $ED				;$0A6F   |
	CMP A, $EF				;$0A71   |
	BNE CODE_0A78				;$0A73   |
	POP A					;$0A75   |
	BRA CODE_0A87				;$0A76   |

CODE_0A78:
	POP A					;$0A78   |
	SUBW YA, $EE				;$0A79   |
	ADDW YA, $EC				;$0A7B   |
	PUSH A					;$0A7D   |
	MOV A, $EC				;$0A7E   |
	MOV $EE, A				;$0A80   |
	MOV A, $ED				;$0A82   |
	MOV $EF, A				;$0A84   |
	POP A					;$0A86   |
CODE_0A87:					;   |
	ADDW YA, $00				;$0A87   |
	MOV $74+X, Y				;$0A89   |
	MOV $84+X, A				;$0A8B   |
	MOV A, $01E0+X				;$0A8D   |
	BNE CODE_0AA2				;$0A90   |
	MOV A, X				;$0A92   |
	AND A, #$07				;$0A93   |
	XCN A					;$0A95   |
	OR A, #$02				;$0A96   |
	MOV $F2, A				;$0A98   |
	MOV A, $84+X				;$0A9A   |
	MOV $F3, A				;$0A9C   |
	INC $F2					;$0A9E   |
	MOV $F3, Y				;$0AA0   |
CODE_0AA2:					;   |
	DEC $A4+X				;$0AA2   |
	BNE CODE_0AB4				;$0AA4   |
	MOV A, $0200+X				;$0AA6   |
	MOV $A4+X, A				;$0AA9   |
	MOV A, $0234+X				;$0AAB   |
	EOR A, #$FF				;$0AAE   |
	INC A					;$0AB0   |
	MOV $0234+X, A				;$0AB1   |
CODE_0AB4:					;   |
	MOV A, $0150+X				;$0AB4   |
	AND A, #$0C				;$0AB7   |
	BNE CODE_0ABE				;$0AB9   |
	JMP CODE_0B17				;$0ABB   |

CODE_0ABE:
	MOV A, $02A4+X				;$0ABE   |
	BEQ CODE_0ACD				;$0AC1   |
	MOV A, $02A4+X				;$0AC3   |
	DEC A					;$0AC6   |
	MOV $02A4+X, A				;$0AC7   |
	JMP CODE_0B17				;$0ACA   |

CODE_0ACD:
	MOV A, $02B4+X				;$0ACD   |
	DEC A					;$0AD0   |
	MOV $02B4+X, A				;$0AD1   |
	BEQ CODE_0AD9				;$0AD4   |
	JMP CODE_0B17				;$0AD6   |

CODE_0AD9:
	MOV A, $02C4+X				;$0AD9   |
	MOV $02B4+X, A				;$0ADC   |
	MOV A, $01E0+X				;$0ADF   |
	BNE CODE_0AF8				;$0AE2   |
	MOV A, X				;$0AE4   |
	AND A, #$07				;$0AE5   |
	XCN A					;$0AE7   |
	OR A, #$00				;$0AE8   |
	MOV $F2, A				;$0AEA   |
	MOV A, $0254+X				;$0AEC   |
	MOV $F3, A				;$0AEF   |
	MOV A, $0264+X				;$0AF1   |
	INC $F2					;$0AF4   |
	MOV $F3, A				;$0AF6   |
CODE_0AF8:					;   |
	MOV A, $02E4+X				;$0AF8   |
	DEC A					;$0AFB   |
	MOV $02E4+X, A				;$0AFC   |
	BNE CODE_0B17				;$0AFF   |
	MOV A, $0150+X				;$0B01   |
	AND A, #$08				;$0B04   |
	BNE CODE_0B17				;$0B06   |
	MOV A, $02F4+X				;$0B08   |
	MOV $02E4+X, A				;$0B0B   |
	MOV A, $02D4+X				;$0B0E   |
	EOR A, #$FF				;$0B11   |
	INC A					;$0B13   |
	MOV $02D4+X, A				;$0B14   |
CODE_0B17:
	RET					;$0B17   |

CODE_0B18:					;   |
	POP X					;$0B18   |
	MOV A, #$00				;$0B19   |
	MOV $0110+X, A				;$0B1B   |
	MOV A, $01E0+X				;$0B1E   |
	BNE CODE_0B2B				;$0B21   |
	MOV $F2, #$5C				;$0B23   |
	MOV A, $0F95+X				;$0B26   |
	MOV $F3, A				;$0B29   |
CODE_0B2B:					;   |
	MOV A, X				;$0B2B   |
	CMP A, #$08				;$0B2C   |
	BCC CODE_0B61				;$0B2E   |
	PUSH X					;$0B30   |
	SETC					;$0B31   |
	SBC A, #$08				;$0B32   |
	MOV X, A				;$0B34   |
	MOV A, #$00				;$0B35   |
	MOV $01E0+X, A				;$0B37   |
	MOV $F2, #$3D				;$0B3A   |
	MOV A, $0F95+X				;$0B3D   |
	EOR A, #$FF				;$0B40   |
	AND A, $F3				;$0B42   |
	MOV $F3, A				;$0B44   |
	MOV $F2, #$4D				;$0B46   |
	MOV A, $0294+X				;$0B49   |
	BEQ CODE_0B57				;$0B4C   |
	MOV A, $0F95+X				;$0B4E   |
	OR A, $F3				;$0B51   |
	MOV $F3, A				;$0B53   |
	BRA CODE_0B60				;$0B55   |

CODE_0B57:
	MOV A, $0F95+X				;$0B57   |
	EOR A, #$FF				;$0B5A   |
	AND A, $F3				;$0B5C   |
	MOV $F3, A				;$0B5E   |
CODE_0B60:					;   |
	POP X					;$0B60   |
CODE_0B61:					;   |
	MOV A, #$00				;$0B61   |
	RET					;$0B63   |

CODE_0B64:
	POP Y					;$0B64   |
	POP A					;$0B65   |
	POP X					;$0B66   |
	PUSH A					;$0B67   |
	PUSH Y					;$0B68   |
CODE_0B69:					;   |
	MOV Y, #$01				;$0B69   |
	MOV $34+X, Y				;$0B6B   |
	MOV A, #$00				;$0B6D   |
	MOV $24+X, A				;$0B6F   |
	RET					;$0B71   |

CODE_0B72:					;   |
	CALL CODE_0B64				;$0B72   |
	CALL CODE_0B8B				;$0B75   |
CODE_0B78:					;   |
	MOV $00, #$02				;$0B78   |
CODE_0B7B:					;   |
	MOV $01, #$00				;$0B7B   |
	MOV A, $44+X				;$0B7E   |
	MOV Y, $54+X				;$0B80   |
	ADDW YA, $00				;$0B82   |
	MOV $54+X, Y				;$0B84   |
	MOV $44+X, A				;$0B86   |
	MOV A, #$01				;$0B88   |
	RET					;$0B8A   |

CODE_0B8B:
	PUSH X					;$0B8B   |
	MOV A, ($00)+Y				;$0B8C   |
	MOV X, A				;$0B8E   |
	MOV A, $0560+X				;$0B8F   |
	POP X					;$0B92   |
	MOV $0244+X, A				;$0B93   |
	RET					;$0B96   |

CODE_0B97:					;   |
	CALL CODE_0B64				;$0B97   |
	CALL CODE_0B8B				;$0B9A   |
	INC Y					;$0B9D   |
	MOV A, ($00)+Y				;$0B9E   |
	MOV $0140+X, A				;$0BA0   |
	INC Y					;$0BA3   |
	MOV A, ($00)+Y				;$0BA4   |
	MOV $64+X, A				;$0BA6   |
	INC Y					;$0BA8   |
	CALL CODE_0BC2				;$0BA9   |
	INC Y					;$0BAC   |
	CALL CODE_0E4E				;$0BAD   |
	MOV $00, #$08				;$0BB0   |
	JMP CODE_0B7B				;$0BB3   |

CODE_0BB6:					;   |
	CALL CODE_0B64				;$0BB6   |
	CALL CODE_0BC2				;$0BB9   |
CODE_0BBC:					;   |
	MOV $00, #$03				;$0BBC   |
	JMP CODE_0B7B				;$0BBF   |

CODE_0BC2:
	MOV A, $1D				;$0BC2   |
	BNE CODE_0BD2				;$0BC4   |
	MOV A, ($00)+Y				;$0BC6   |
	MOV $0254+X, A				;$0BC8   |
	INC Y					;$0BCB   |
CODE_0BCC:					;   |
	MOV A, ($00)+Y				;$0BCC   |
	MOV $0264+X, A				;$0BCE   |
	RET					;$0BD1   |

CODE_0BD2:
	MOV A, ($00)+Y				;$0BD2   |
	BPL CODE_0BD9				;$0BD4   |
	EOR A, #$FF				;$0BD6   |
	INC A					;$0BD8   |
CODE_0BD9:					;   |
	LSR A					;$0BD9   |
	MOV $03, A				;$0BDA   |
	INC Y					;$0BDC   |
	CLRC					;$0BDD   |
	MOV A, ($00)+Y				;$0BDE   |
	BPL CODE_0BE5				;$0BE0   |
	EOR A, #$FF				;$0BE2   |
	INC A					;$0BE4   |
CODE_0BE5:					;   |
	LSR A					;$0BE5   |
	CLRC					;$0BE6   |
	ADC A, $03				;$0BE7   |
	MOV $0254+X, A				;$0BE9   |
	MOV $0264+X, A				;$0BEC   |
	RET					;$0BEF   |

CODE_0BF0:					;   |
	CALL CODE_0B64				;$0BF0   |
	MOV $0254+X, A				;$0BF3   |
	CALL CODE_0BCC				;$0BF6   |
	MOV A, $0264+X				;$0BF9   |
	MOV $0254+X, A				;$0BFC   |
	JMP CODE_0B78				;$0BFF   |

CODE_0C02:					;   |
	CALL CODE_0B64				;$0C02   |
	MOV A, $04B8				;$0C05   |
	MOV $0254+X, A				;$0C08   |
	MOV A, $04B9				;$0C0B   |
	MOV $0264+X, A				;$0C0E   |
	MOV A, $1D				;$0C11   |
	BNE CODE_0C2E				;$0C13   |
	JMP CODE_0ED6				;$0C15   |

CODE_0C18:					;   |
	CALL CODE_0B64				;$0C18   |
	MOV A, $04BA				;$0C1B   |
	MOV $0254+X, A				;$0C1E   |
	MOV A, $04BB				;$0C21   |
	MOV $0264+X, A				;$0C24   |
	MOV A, $1D				;$0C27   |
	BNE CODE_0C2E				;$0C29   |
	JMP CODE_0ED6				;$0C2B   |

CODE_0C2E:
	MOV A, $0254+X				;$0C2E   |
	BPL CODE_0C36				;$0C31   |
	EOR A, #$FF				;$0C33   |
	INC A					;$0C35   |
CODE_0C36:					;   |
	LSR A					;$0C36   |
	MOV $00, A				;$0C37   |
	MOV A, $0264+X				;$0C39   |
	BPL CODE_0C41				;$0C3C   |
	EOR A, #$FF				;$0C3E   |
	INC A					;$0C40   |
CODE_0C41:					;   |
	LSR A					;$0C41   |
	CLRC					;$0C42   |
	ADC A, $00				;$0C43   |
	MOV $0254+X, A				;$0C45   |
	MOV $0264+X, A				;$0C48   |
	JMP CODE_0ED6				;$0C4B   |

CODE_0C4E:					;   |
	CALL CODE_0B64				;$0C4E   |
	MOV A, ($00)+Y				;$0C51   |
	MOV $04B6, A				;$0C53   |
	JMP CODE_0B78				;$0C56   |

CODE_0C59:
	PUSH X					;$0C59   |
	MOV Y, $04B6				;$0C5A   |
	CMP X, #$08				;$0C5D   |
	BCS CODE_0C6F				;$0C5F   |
	CMP A, #$00				;$0C61   |
	BMI CODE_0C71				;$0C63   |
	MUL YA					;$0C65   |
	MOV X, #$64				;$0C66   |
	DIV YA, X				;$0C68   |
	CMP A, #$7F				;$0C69   |
	BMI CODE_0C6F				;$0C6B   |
	MOV A, #$7F				;$0C6D   |
CODE_0C6F:					;   |
	POP X					;$0C6F   |
	RET					;$0C70   |

CODE_0C71:
	EOR A, #$FF				;$0C71   |
	INC A					;$0C73   |
	MUL YA					;$0C74   |
	MOV X, #$64				;$0C75   |
	DIV YA, X				;$0C77   |
	CMP A, #$7F				;$0C78   |
	BMI CODE_0C7E				;$0C7A   |
	MOV A, #$7F				;$0C7C   |
CODE_0C7E:					;   |
	EOR A, #$FF				;$0C7E   |
	INC A					;$0C80   |
	POP X					;$0C81   |
	RET					;$0C82   |

CODE_0C83:					;   |
	CALL CODE_0B64				;$0C83   |
	MOV A, ($00)+Y				;$0C86   |
	MOV $04B8, A				;$0C88   |
	INC Y					;$0C8B   |
	MOV A, ($00)+Y				;$0C8C   |
	MOV $04B9, A				;$0C8E   |
	INC Y					;$0C91   |
	MOV A, ($00)+Y				;$0C92   |
	MOV $04BA, A				;$0C94   |
	INC Y					;$0C97   |
	MOV A, ($00)+Y				;$0C98   |
	MOV $04BB, A				;$0C9A   |
	JMP CODE_0F76				;$0C9D   |

CODE_0CA0:					;   |
	CALL CODE_0B64				;$0CA0   |
	MOV A, ($00)+Y				;$0CA3   |
	CALL CODE_10F0				;$0CA5   |
	MOV $F2, #$7D				;$0CA8   |
	CLRC					;$0CAB   |
	LSR A					;$0CAC   |
	MOV $F3, A				;$0CAD   |
	MOV $F2, #$6D				;$0CAF   |
	ROL A					;$0CB2   |
	ROL A					;$0CB3   |
	ROL A					;$0CB4   |
	MOV $00, A				;$0CB5   |
	MOV A, #$FF				;$0CB7   |
	SETC					;$0CB9   |
	SBC A, $00				;$0CBA   |
	MOV $F3, A				;$0CBC   |
	MOV $04B7, A				;$0CBE   |
	MOV Y, A				;$0CC1   |
	MOV A, #$00				;$0CC2   |
	MOVW $00, YA				;$0CC4   |
CODE_0CC6:					;   |
	MOV Y, A				;$0CC6   |
CODE_0CC7:					;   |
	MOV ($00)+Y, A				;$0CC7   |
	INC Y					;$0CC9   |
	BNE CODE_0CC7				;$0CCA   |
	INC $01					;$0CCC   |
	MOV Y, $01				;$0CCE   |
	CMP Y, #$00				;$0CD0   |
	BNE CODE_0CC6				;$0CD2   |
	JMP CODE_0B78				;$0CD4   |

CODE_0CD7:					;   |
	CALL CODE_0B64				;$0CD7   |
	MOV A, ($00)+Y				;$0CDA   |
	MOV $44+X, A				;$0CDC   |
	INC Y					;$0CDE   |
	MOV A, ($00)+Y				;$0CDF   |
	MOV $54+X, A				;$0CE1   |
	MOV A, #$01				;$0CE3   |
	RET					;$0CE5   |

CODE_0CE6:					;   |
	CALL CODE_0B64				;$0CE6   |
	MOV A, ($00)+Y				;$0CE9   |
	MOV $04, A				;$0CEB   |
	INC Y					;$0CED   |
	CALL CODE_0D1C				;$0CEE   |
CODE_0CF1:					;   |
	MOV $0334+Y, A				;$0CF1   |
CODE_0CF4:					;   |
	INC $D4+X				;$0CF4   |
	MOVW YA, $02				;$0CF6   |
	MOV $44+X, A				;$0CF8   |
	MOV $54+X, Y				;$0CFA   |
	MOV A, #$01				;$0CFC   |
	RET					;$0CFE   |

CODE_0CFF:					;   |
	CALL CODE_0B64				;$0CFF   |
	MOV $04, #$01				;$0D02   |
	CALL CODE_0D1C				;$0D05   |
	BEQ CODE_0D0E				;$0D08   |
	DEC A					;$0D0A   |
	JMP CODE_0CF1				;$0D0B   |

CODE_0D0E:
	DEC A					;$0D0E   |
	MOV $0334+Y, A				;$0D0F   |
	MOV A, $03B4+Y				;$0D12   |
	DEC A					;$0D15   |
	MOV $03B4+Y, A				;$0D16   |
	JMP CODE_0CF4				;$0D19   |

CODE_0D1C:
	MOV A, ($00)+Y				;$0D1C   |
	MOV $02, A				;$0D1E   |
	INC Y					;$0D20   |
	MOV A, ($00)+Y				;$0D21   |
	MOV $03, A				;$0D23   |
	MOV Y, $D4+X				;$0D25   |
	MOV A, $04				;$0D27   |
	MOV $0434+Y, A				;$0D29   |
	MOV A, $54+X				;$0D2C   |
	MOV $03B4+Y, A				;$0D2E   |
	MOV A, $44+X				;$0D31   |
	RET					;$0D33   |

CODE_0D34:					;   |
	CALL CODE_0B64				;$0D34   |
	DEC $D4+X				;$0D37   |
	MOV Y, $D4+X				;$0D39   |
	MOV A, $03B4+Y				;$0D3B   |
	MOV $54+X, A				;$0D3E   |
	MOV A, $0334+Y				;$0D40   |
	MOV $44+X, A				;$0D43   |
	MOV A, $0434+Y				;$0D45   |
	DEC A					;$0D48   |
	MOV $0434+Y, A				;$0D49   |
	BEQ CODE_0D6A				;$0D4C   |
	MOV A, $44+X				;$0D4E   |
	MOV Y, $54+X				;$0D50   |
	MOVW $00, YA				;$0D52   |
	MOV Y, #$02				;$0D54   |
	MOV A, ($00)+Y				;$0D56   |
	MOV $02, A				;$0D58   |
	INC Y					;$0D5A   |
	MOV A, ($00)+Y				;$0D5B   |
	MOV $03, A				;$0D5D   |
	INC $D4+X				;$0D5F   |
	MOVW YA, $02				;$0D61   |
	MOV $44+X, A				;$0D63   |
	MOV $54+X, Y				;$0D65   |
	MOV A, #$01				;$0D67   |
	RET					;$0D69   |

CODE_0D6A:
	MOV $00, #$04				;$0D6A   |
	JMP CODE_0B7B				;$0D6D   |

CODE_0D70:					;   |
	CALL CODE_0B64				;$0D70   |
	MOV A, ($00)+Y				;$0D73   |
	MOV $0120+X, A				;$0D75   |
	MOV A, $01D0+X				;$0D78   |
	BEQ CODE_0D89				;$0D7B   |
	MOV A, $0120+X				;$0D7D   |
	MOV $0130+X, A				;$0D80   |
	INC Y					;$0D83   |
	MOV A, ($00)+Y				;$0D84   |
	MOV $0120+X, A				;$0D86   |
CODE_0D89:					;   |
	INC Y					;$0D89   |
	MOV $00, Y				;$0D8A   |
	JMP CODE_0B7B				;$0D8C   |

CODE_0D8F:					;   |
	POP X					;$0D8F   |
	MOV A, #$00				;$0D90   |
	MOV $0120+X, A				;$0D92   |
	MOV $0130+X, A				;$0D95   |
	JMP CODE_0DDF				;$0D98   |

CODE_0D9B:					;   |
	POP X					;$0D9B   |
	MOV Y, #$04				;$0D9C   |
	MOV A, ($00)+Y				;$0D9E   |
	BRA CODE_0DAA				;$0DA0   |

CODE_0DA2:					;   |
	POP X					;$0DA2   |
	MOV Y, #$04				;$0DA3   |
	MOV A, ($00)+Y				;$0DA5   |
	EOR A, #$FF				;$0DA7   |
	INC A					;$0DA9   |
CODE_0DAA:					;   |
	MOV $01B0+X, A				;$0DAA   |
	MOV A, $0150+X				;$0DAD   |
	OR A, #$01				;$0DB0   |
	MOV $0150+X, A				;$0DB2   |
	CALL CODE_0B69				;$0DB5   |
	MOV A, ($00)+Y				;$0DB8   |
	MOV $0160+X, A				;$0DBA   |
	INC Y					;$0DBD   |
	MOV A, ($00)+Y				;$0DBE   |
	MOV $0170+X, A				;$0DC0   |
	INC Y					;$0DC3   |
	MOV A, ($00)+Y				;$0DC4   |
	MOV $0180+X, A				;$0DC6   |
	INC Y					;$0DC9   |
	INC Y					;$0DCA   |
	MOV A, ($00)+Y				;$0DCB   |
	MOV $0190+X, A				;$0DCD   |
	MOV $00, #$06				;$0DD0   |
	JMP CODE_0B7B				;$0DD3   |

CODE_0DD6:					;   |
	POP X					;$0DD6   |
	MOV A, $0150+X				;$0DD7   |
	AND A, #$FE				;$0DDA   |
	MOV $0150+X, A				;$0DDC   |
CODE_0DDF:					;   |
	MOV A, #$01				;$0DDF   |
	MOV $00, A				;$0DE1   |
	MOV $34+X, A				;$0DE3   |
	DEC A					;$0DE5   |
	MOV $24+X, A				;$0DE6   |
	JMP CODE_0B7B				;$0DE8   |

CODE_0DEB:					;   |
	POP X					;$0DEB   |
	MOV Y, #$01				;$0DEC   |
	MOV A, ($00)+Y				;$0DEE   |
	MOV $1F, A				;$0DF0   |
CODE_0DF2:					;   |
	CALL CODE_0B69				;$0DF2   |
	JMP CODE_0B78				;$0DF5   |

CODE_0DF8:					;   |
	POP X					;$0DF8   |
	MOV Y, #$01				;$0DF9   |
	MOV A, ($00)+Y				;$0DFB   |
	CLRC					;$0DFD   |
	ADC A, $1F				;$0DFE   |
	MOV $1F, A				;$0E00   |
	JMP CODE_0DF2				;$0E02   |

CODE_0E05:					;   |
	POP X					;$0E05   |
	MOV A, $0150+X				;$0E06   |
	AND A, #$FD				;$0E09   |
	MOV $0150+X, A				;$0E0B   |
	JMP CODE_0DDF				;$0E0E   |

CODE_0E11:					;   |
	POP X					;$0E11   |
	MOV A, #$00				;$0E12   |
	CALL CODE_0E25				;$0E14   |
	JMP CODE_0D6A				;$0E17   |

CODE_0E1A:					;   |
	POP X					;$0E1A   |
	MOV Y, #$04				;$0E1B   |
	MOV A, ($00)+Y				;$0E1D   |
	CALL CODE_0E25				;$0E1F   |
	JMP CODE_0F76				;$0E22   |

CODE_0E25:
	MOV $0220+X, A				;$0E25   |
	MOV A, $0150+X				;$0E28   |
	OR A, #$02				;$0E2B   |
	MOV $0150+X, A				;$0E2D   |
	CALL CODE_0B69				;$0E30   |
	MOV A, ($00)+Y				;$0E33   |
	MOV $0200+X, A				;$0E35   |
	INC Y					;$0E38   |
	MOV A, ($00)+Y				;$0E39   |
	MOV $0210+X, A				;$0E3B   |
	INC Y					;$0E3E   |
	MOV A, ($00)+Y				;$0E3F   |
	MOV $0234+X, A				;$0E41   |
	RET					;$0E44   |

CODE_0E45:					;   |
	CALL CODE_0B64				;$0E45   |
	CALL CODE_0E4E				;$0E48   |
	JMP CODE_0BBC				;$0E4B   |

CODE_0E4E:
	MOV A, ($00)+Y				;$0E4E   |
	MOV $0274+X, A				;$0E50   |
	INC Y					;$0E53   |
	MOV A, ($00)+Y				;$0E54   |
	MOV $0284+X, A				;$0E56   |
	RET					;$0E59   |

CODE_0E5A:					;   |
	POP X					;$0E5A   |
	MOV Y, #$01				;$0E5B   |
	MOV A, ($00)+Y				;$0E5D   |
	MOV $0C+X, A				;$0E5F   |
	JMP CODE_0E6B				;$0E61   |

CODE_0E64:					;   |
	POP X					;$0E64   |
	MOV Y, #$01				;$0E65   |
	MOV A, ($00)+Y				;$0E67   |
	MOV $14+X, A				;$0E69   |
CODE_0E6B:					;   |
	CALL CODE_0B69				;$0E6B   |
	JMP CODE_0B78				;$0E6E   |

CODE_0E71:					;   |
	CALL CODE_0B64				;$0E71   |
	MOV A, ($00)+Y				;$0E74   |
	MOV $64+X, A				;$0E76   |
	JMP CODE_0B78				;$0E78   |

CODE_0E7B:					;   |
	CALL CODE_0B64				;$0E7B   |
	MOV $24+X, A				;$0E7E   |
	MOV A, ($00)+Y				;$0E80   |
	MOV $0140+X, A				;$0E82   |
	JMP CODE_0B78				;$0E85   |

CODE_0E88:					;   |
	CALL CODE_0B64				;$0E88   |
	MOV A, ($00)+Y				;$0E8B   |
	CLRC					;$0E8D   |
	ADC A, $0140+X				;$0E8E   |
	MOV $0140+X, A				;$0E91   |
	JMP CODE_0B78				;$0E94   |

CODE_0E97:					;   |
	POP X					;$0E97   |
	MOV $F2, #$0D				;$0E98   |
	MOV Y, #$01				;$0E9B   |
	MOV A, ($00)+Y				;$0E9D   |
	MOV $F3, A				;$0E9F   |
	INC Y					;$0EA1   |
	MOV $F2, #$2C				;$0EA2   |
	MOV A, ($00)+Y				;$0EA5   |
	MOV $0232, A				;$0EA7   |
	MOV $F3, A				;$0EAA   |
	MOV $F2, #$3C				;$0EAC   |
	INC Y					;$0EAF   |
	MOV A, ($00)+Y				;$0EB0   |
	MOV $0233, A				;$0EB2   |
	MOV $F3, A				;$0EB5   |
	MOV A, #$00				;$0EB7   |
	MOV $04B5, A				;$0EB9   |
	MOV $F2, #$6C				;$0EBC   |
	MOV $F3, A				;$0EBF   |
	JMP CODE_0D6A				;$0EC1   |

CODE_0EC4:					;   |
	CALL CODE_0B64				;$0EC4   |
	MOV $F2, #$4D				;$0EC7   |
	MOV A, $0F95+X				;$0ECA   |
	OR A, $F3				;$0ECD   |
	MOV $F3, A				;$0ECF   |
	MOV A, #$01				;$0ED1   |
	MOV $0294+X, A				;$0ED3   |
CODE_0ED6:					;   |
	MOV $00, #$01				;$0ED6   |
	JMP CODE_0B7B				;$0ED9   |

CODE_0EDC:					;   |
	POP X					;$0EDC   |
	MOV $F2, #$4D				;$0EDD   |
	MOV A, $0F95+X				;$0EE0   |
	EOR A, #$FF				;$0EE3   |
	AND A, $F3				;$0EE5   |
	MOV $F3, A				;$0EE7   |
	MOV A, #$00				;$0EE9   |
	MOV $0294+X, A				;$0EEB   |
	MOV $24+X, A				;$0EEE   |
	INC A					;$0EF0   |
	MOV $34+X, A				;$0EF1   |
	JMP CODE_0ED6				;$0EF3   |

CODE_0EF6:					;   |
	CALL CODE_0B64				;$0EF6   |
	MOV $F2, #$0F				;$0EF9   |
CODE_0EFC:					;   |
	MOV A, ($00)+Y				;$0EFC   |
	MOV $F3, A				;$0EFE   |
	INC Y					;$0F00   |
	CLRC					;$0F01   |
	ADC $F2, #$10				;$0F02   |
	CMP $F2, #$8F				;$0F05   |
	BNE CODE_0EFC				;$0F08   |
	MOV $00, #$09				;$0F0A   |
	JMP CODE_0B7B				;$0F0D   |

CODE_0F10:					;   |
	CALL CODE_0B64				;$0F10   |
	MOV A, ($00)+Y				;$0F13   |
	MOV $04B4, A				;$0F15   |
	OR A, $04B5				;$0F18   |
	MOV $F2, #$6C				;$0F1B   |
	MOV $F3, A				;$0F1E   |
	JMP CODE_0B78				;$0F20   |

CODE_0F23:					;   |
	POP X					;$0F23   |
	MOV $F2, #$3D				;$0F24   |
	MOV A, $0F95+X				;$0F27   |
	OR A, $F3				;$0F2A   |
	MOV $F3, A				;$0F2C   |
CODE_0F2E:					;   |
	CALL CODE_0B69				;$0F2E   |
	JMP CODE_0ED6				;$0F31   |

CODE_0F34:					;   |
	POP X					;$0F34   |
	MOV $F2, #$3D				;$0F35   |
	MOV A, $0F95+X				;$0F38   |
	EOR A, #$FF				;$0F3B   |
	AND A, $F3				;$0F3D   |
	MOV $F3, A				;$0F3F   |
	JMP CODE_0F2E				;$0F41   |

CODE_0F44:					;   |
	POP X					;$0F44   |
	MOV Y, #$04				;$0F45   |
	MOV A, ($00)+Y				;$0F47   |
	EOR A, #$FF				;$0F49   |
	INC A					;$0F4B   |
	BRA CODE_0F53				;$0F4C   |

CODE_0F4E:					;   |
	POP X					;$0F4E   |
	MOV Y, #$04				;$0F4F   |
	MOV A, ($00)+Y				;$0F51   |
CODE_0F53:					;   |
	MOV $01B0+X, A				;$0F53   |
	MOV A, $0150+X				;$0F56   |
	OR A, #$01				;$0F59   |
	MOV $0150+X, A				;$0F5B   |
	CALL CODE_0B69				;$0F5E   |
	MOV A, ($00)+Y				;$0F61   |
	MOV $0160+X, A				;$0F63   |
	INC Y					;$0F66   |
	MOV A, ($00)+Y				;$0F67   |
	MOV $0170+X, A				;$0F69   |
	INC Y					;$0F6C   |
	MOV A, ($00)+Y				;$0F6D   |
	MOV $0190+X, A				;$0F6F   |
	ASL A					;$0F72   |
	MOV $0180+X, A				;$0F73   |
CODE_0F76:					;   |
	MOV $00, #$05				;$0F76   |
	JMP CODE_0B7B				;$0F79   |

CODE_0F7C:					;   |
	CALL CODE_0B64				;$0F7C   |
	INC A					;$0F7F   |
	MOV $01D0+X, A				;$0F80   |
	JMP CODE_0ED6				;$0F83   |

CODE_0F86:
	CALL CODE_0B64				;$0F86   |
	MOV $01D0+X, A				;$0F89   |
	JMP CODE_0ED6				;$0F8C   |

CODE_0F8F:					;   |
	MOV $00, #$07				;$0F8F   |
	JMP CODE_0B7B				;$0F92   |

DATA_0F95:
	db $01, $02, $04, $08, $10, $20, $40, $80
	db $01, $02, $04, $08, $10, $20, $40, $80

DATA_0FA5:
	dw CODE_0B18
	dw CODE_0B72
	dw CODE_0BB6
	dw CODE_0CD7
	dw CODE_0CE6
	dw CODE_0D34
	dw CODE_0D70
	dw CODE_0D8F
	dw CODE_0D9B
	dw CODE_0DA2
	dw CODE_0DD6
	dw CODE_0DEB
	dw CODE_0DF8
	dw CODE_0E11
	dw CODE_0E05
	dw CODE_0E1A
	dw CODE_0E45
	dw !null_pointer
	dw CODE_0E71
	dw CODE_0E7B
	dw CODE_0E88
	dw CODE_0E97
	dw CODE_0EC4
	dw CODE_0EDC
	dw CODE_0EF6
	dw CODE_0F10
	dw CODE_0F23
	dw CODE_0F34
	dw CODE_0E5A
	dw CODE_0E64
	dw CODE_0C83
	dw CODE_0CA0
	dw CODE_0C02
	dw CODE_0CFF
	dw CODE_0B97
	dw CODE_0BF0
	dw CODE_0C4E
	dw !null_pointer
	dw CODE_0F44
	dw CODE_0F4E
	dw !null_pointer
	dw !null_pointer
	dw !null_pointer
	dw CODE_0F7C
	dw CODE_0F86
	dw !null_pointer
	dw !null_pointer
	dw !null_pointer
	dw CODE_0EDC
	dw CODE_0C18
	dw CODE_0EDC

CODE_100B:
	MOV A, #$00				;$100B   |
	MOV $EC, A				;$100D   |
	MOV $ED, A				;$100F   |
	MOV $EE, A				;$1011   |
	MOV $EF, A				;$1013   |
	MOV $F2, #$6C				;$1015   |
	MOV $F3, #$E0				;$1018   |
	MOV $F2, #$2C				;$101B   |
	MOV $0232, A				;$101E   |
	MOV $F3, A				;$1021   |
	MOV $F2, #$3C				;$1023   |
	MOV $0233, A				;$1026   |
	MOV $F3, A				;$1029   |
	MOV $F2, #$0D				;$102B   |
	MOV $F3, A				;$102E   |
	MOV $F2, #$4C				;$1030   |
	MOV $F3, A				;$1033   |
	MOV $F2, #$5C				;$1035   |
	MOV $F3, #$FF				;$1038   |
	MOV $F2, #$2D				;$103B   |
	MOV $F3, A				;$103E   |
	MOV $F2, #$3D				;$1040   |
	MOV $F3, A				;$1043   |
	MOV $F2, #$4D				;$1045   |
	MOV $F3, A				;$1048   |
	MOV A, #$3C				;$104A   |
	MOV $0230, A				;$104C   |
	MOV $0231, A				;$104F   |
	MOV $F2, #$0C				;$1052   |
	MOV $F3, A				;$1055   |
	MOV $F2, #$1C				;$1057   |
	MOV $F3, A				;$105A   |
	MOV A, #$64				;$105C   |
	MOV $04B6, A				;$105E   |
	MOV $F2, #$5D				;$1061   |
	MOV $F3, #$31				;$1064   |
	MOV Y, #$08				;$1067   |
	MOV $F2, #$00				;$1069   |
CODE_106C:					;   |
	MOV A, #$7F				;$106C   |
	MOV $F3, A				;$106E   |
	INC $F2					;$1070   |
	MOV $F3, A				;$1072   |
	CLRC					;$1074   |
	ADC $F2, #$04				;$1075   |
	MOV A, #$00				;$1078   |
	MOV $F3, A				;$107A   |
	INC $F2					;$107C   |
	MOV $F3, A				;$107E   |
	INC $F2					;$1080   |
	MOV $F3, #$FF				;$1082   |
	CLRC					;$1085   |
	ADC $F2, #$09				;$1086   |
	DEC Y					;$1089   |
	BNE CODE_106C				;$108A   |
	MOV $E7, #$FF				;$108C   |
	MOV $E8, #$FF				;$108F   |
	MOV A, #$64				;$1092   |
	MOV $E4, A				;$1094   |
	MOV A, #$20				;$1096   |
	MOV $04B5, A				;$1098   |
	MOV $00, #$08				;$109B   |
	MOV X, #$00				;$109E   |
	MOV Y, #$00				;$10A0   |
	MOV $0A, Y				;$10A2   |
	MOV $04B4, Y				;$10A4   |
	MOV $01, Y				;$10A7   |
CODE_10A9:					;   |
	MOV A, #$01				;$10A9   |
	MOV $34+X, A				;$10AB   |
	MOV $0110+X, A				;$10AD   |
	MOV A, ($E5)+Y				;$10B0   |
	MOV $44+X, A				;$10B2   |
	INC Y					;$10B4   |
	MOV A, ($E5)+Y				;$10B5   |
	MOV $54+X, A				;$10B7   |
	MOV A, $01				;$10B9   |
	MOV $D4+X, A				;$10BB   |
	MOV A, #$00				;$10BD   |
	MOV $01D0+X, A				;$10BF   |
	MOV $24+X, A				;$10C2   |
	MOV $0120+X, A				;$10C4   |
	MOV $0130+X, A				;$10C7   |
	MOV $0150+X, A				;$10CA   |
	MOV $0140+X, A				;$10CD   |
	MOV $64+X, A				;$10D0   |
	MOV $01E0+X, A				;$10D2   |
	MOV $0294+X, A				;$10D5   |
	INC X					;$10D8   |
	INC Y					;$10D9   |
	CLRC					;$10DA   |
	ADC $01, #$08				;$10DB   |
	DBNZ $00, CODE_10A9			;$10DE   |
	MOV A, ($E5)+Y				;$10E1   |
	MOV $1F, A				;$10E3   |
	INC Y					;$10E5   |
	MOV A, ($E5)+Y				;$10E6   |
	MOV $22, A				;$10E8   |
	MOV A, #$00				;$10EA   |
	MOV $1E, A				;$10EC   |
	MOV $21, A				;$10EE   |
CODE_10F0:					;   |
	MOV $F2, #$6C				;$10F0   |
	MOV $F3, #$20				;$10F3   |
	RET					;$10F6   |

CODE_10F7:
	PUSH A					;$10F7   |
	CMP A, #$60				;$10F8   |
	BPL CODE_1104				;$10FA   |
	SETC					;$10FC   |
	SBC A, $2410				;$10FD   |
	BPL CODE_110D				;$1100   |
	BRA CODE_1111				;$1102   |

CODE_1104:
	SETC					;$1104   |
	SBC A, #$60				;$1105   |
	SETC					;$1107   |
	SBC A, $2E94				;$1108   |
	BMI CODE_1111				;$110B   |
CODE_110D:					;   |
	POP A					;$110D   |
	MOV A, #$00				;$110E   |
	PUSH A					;$1110   |
CODE_1111:					;   |
	POP A					;$1111   |
	ASL A					;$1112   |
	PUSH A					;$1113   |
	MOV A, #$01				;$1114   |
	MOV $01E0+X, A				;$1116   |
	MOV $F2, #$3D				;$1119   |
	MOV A, $0F95+X				;$111C   |
	EOR A, #$FF				;$111F   |
	AND A, $F3				;$1121   |
	MOV $F3, A				;$1123   |
	MOV A, X				;$1125   |
	CLRC					;$1126   |
	ADC A, #$08				;$1127   |
	MOV X, A				;$1129   |
	ASL A					;$112A   |
	ASL A					;$112B   |
	ASL A					;$112C   |
	MOV $D4+X, A				;$112D   |
	MOV A, #$01				;$112F   |
	MOV $0110+X, A				;$1131   |
	DEC A					;$1134   |
	MOV $0120+X, A				;$1135   |
	MOV $0130+X, A				;$1138   |
	MOV $24+X, A				;$113B   |
	MOV $01D0+X, A				;$113D   |
	MOV $01E0+X, A				;$1140   |
	MOV $0150+X, A				;$1143   |
	MOV $0140+X, A				;$1146   |
	MOV $0294+X, A				;$1149   |
	MOV $64+X, A				;$114C   |
	MOV A, #$7F				;$114E   |
	MOV $0254+X, A				;$1150   |
	MOV $0264+X, A				;$1153   |
	MOV $0314+X, A				;$1156   |
	MOV $0324+X, A				;$1159   |
	MOV A, #$8E				;$115C   |
	MOV $0274+X, A				;$115E   |
	MOV A, #$E0				;$1161   |
	MOV $0284+X, A				;$1163   |
	POP A					;$1166   |
	CMP A, #$C0				;$1167   |
	BCS CODE_1179				;$1169   |
	MOV Y, A				;$116B   |
	MOV A, $2412+Y				;$116C   |
	MOV $44+X, A				;$116F   |
	INC Y					;$1171   |
	MOV A, $2412+Y				;$1172   |
	MOV $54+X, A				;$1175   |
	BRA CODE_1188				;$1177   |

CODE_1179:
	SETC					;$1179   |
	SBC A, #$C0				;$117A   |
	MOV Y, A				;$117C   |
	MOV A, $2E96+Y				;$117D   |
	MOV $44+X, A				;$1180   |
	INC Y					;$1182   |
	MOV A, $2E96+Y				;$1183   |
	MOV $54+X, A				;$1186   |
CODE_1188:					;   |
	MOV A, #$02				;$1188   |
	MOV $34+X, A				;$118A   |
	MOV $F2, #$4D				;$118C   |
	MOV A, $0F95+X				;$118F   |
	EOR A, #$FF				;$1192   |
	AND A, $F3				;$1194   |
	MOV $F3, A				;$1196   |
	RET					;$1198   |

DATA_1199:
	dw $0000
	dw $0040
	dw $0044
	dw $0048
	dw $004C
	dw $0051
	dw $0055
	dw $005B
	dw $0060
	dw $0066
	dw $006C
	dw $0072
	dw $0079
	dw $0080
	dw $0088
	dw $0090
	dw $0098
	dw $00A1
	dw $00AB
	dw $00B5
	dw $00C0
	dw $00CB
	dw $00D7
	dw $00E4
	dw $00F2
	dw $0100
	dw $010F
	dw $011F
	dw $0130
	dw $0143
	dw $0156
	dw $016A
	dw $0180
	dw $0196
	dw $01AF
	dw $01C8
	dw $01E3
	dw $0200
	dw $021E
	dw $023F
	dw $0261
	dw $0285
	dw $02AB
	dw $02D4
	dw $02FF
	dw $032D
	dw $035D
	dw $0390
	dw $03C7
	dw $0400
	dw $043D
	dw $047D
	dw $04C2
	dw $050A
	dw $0557
	dw $05A8
	dw $05FE
	dw $065A
	dw $06BA
	dw $0721
	dw $078D
	dw $0800
	dw $087A
	dw $08FB
	dw $0984
	dw $0A14
	dw $0AAE
	dw $0B50
	dw $0BFD
	dw $0CB3
	dw $0D74
	dw $0E41
	dw $0F1A
	dw $1000
	dw $10F4
	dw $11F6
	dw $1307
	dw $1429
	dw $155C
	dw $16A1
	dw $17F9
	dw $1966
	dw $1AE9
	dw $1C82
	dw $1E34
	dw $2000
	dw $21E7
	dw $23EB
	dw $260E
	dw $2851
	dw $2AB7
	dw $2D41
	dw $2FF2
	dw $32CC
	dw $35D1
	dw $3904
	dw $3C68
	dw $3FFF

	db $FF
base off
arch 65816

sample_table:
	dl DATA_EECE62
	dl DATA_EECFFC
	dl DATA_EED1CC
	dl DATA_EED47C
	dl DATA_EED63A
	dl DATA_EED87E
	dl DATA_EEDC73
	dl DATA_EEE055
	dl DATA_EEE1AF
	dl DATA_EEE8CE
	dl DATA_EEE9A2
	dl DATA_EEEE4B
	dl DATA_EEF6B6
	dl DATA_EEF8C5
	dl DATA_EEFDC8
	dl DATA_EEFFDF
	dl DATA_EF001A
	dl DATA_EF05BE
	dl DATA_EF0997
	dl DATA_EF120B
	dl DATA_EF1EDC
	dl DATA_EF288C
	dl DATA_EF2F7E
	dl DATA_EF3288
	dl DATA_EF335C
	dl DATA_EF35BC
	dl DATA_EF37B0
	dl DATA_EF3A10
	dl DATA_EF3D5A
	dl DATA_EF4512
	dl DATA_EF4C79
	dl DATA_EF5053
	dl DATA_EF5910
	dl DATA_EF5927
	dl DATA_EF596B
	dl DATA_EF5D96
	dl DATA_EF63EF
	dl DATA_EF66CD
	dl DATA_EF66ED
	dl DATA_EF6731
	dl DATA_EF6748
	dl DATA_EF69CC
	dl DATA_EF720B
	dl DATA_EF72FA
	dl DATA_EF7A2B
	dl DATA_EF8006
	dl DATA_EF818E
	dl DATA_EF8880
	dl DATA_EF90BF
	dl DATA_EF90D6
	dl DATA_EF943B
	dl DATA_EF9677
	dl DATA_EFA228
	dl DATA_EFA7E8
	dl DATA_EFA81A
	dl DATA_EFAC18
	dl DATA_EFAC4A
	dl DATA_EFAC7C
	dl DATA_EFACAE
	dl DATA_EFACE0
	dl DATA_EFAD12
	dl DATA_EFAD44
	dl DATA_EFAD76
	dl DATA_EFADA8
	dl DATA_EFADDA
	dl DATA_EFAE0C
	dl DATA_EFAE3E
	dl DATA_EFAE70
	dl DATA_EFAEA2
	dl DATA_EFAED4
	dl DATA_EFAF06
	dl DATA_EFAF38
	dl DATA_EFAF6A
	dl DATA_EFAF9C
	dl DATA_EFAFCE
	dl DATA_EFB000
	dl DATA_EFB032
	dl DATA_EFB064
	dl DATA_EFB096
	dl DATA_EFB0C8
	dl DATA_EFB0FA
	dl DATA_EFB11A
	dl DATA_EFB13A
	dl DATA_EFB15A
	dl DATA_EFB17A
	dl DATA_EFB19A
	dl DATA_EFB1BA
	dl DATA_EFB1DA
	dl DATA_EFB1FA
	dl DATA_EFB21A
	dl DATA_EFB23A
	dl DATA_EFB26B
	dl DATA_EFB29C
	dl DATA_EFB2CD
	dl DATA_EFB2FE
	dl DATA_EFB32F
	dl DATA_EFB360
	dl DATA_EFB391
	dl DATA_EFB3C2
	dl DATA_EFB3F3
	dl DATA_EFB424
	dl DATA_EFB455
	dl DATA_EFB486
	dl DATA_EFB4B7
	dl DATA_EFB4E8
	dl DATA_EFB519
	dl DATA_EFB54A
	dl DATA_EFB57B
	dl DATA_EFB5AC
	dl DATA_EFB5DD
	dl DATA_EFB60E
	dl DATA_EFB63F
	dl DATA_EFB670
	dl DATA_EFB6A1
	dl DATA_EFB6D2
	dl DATA_EFB703
	dl DATA_EFB734
	dl DATA_EFB765
	dl DATA_EFB796
	dl DATA_EFB7C7
	dl DATA_EFB7F8
	dl DATA_EFB829
	dl DATA_EFB85A
	dl DATA_EFB912
	dl DATA_EFD404
	dl DATA_EFDB08
	dl DATA_EFE26F
	dl DATA_EFE8F5
	dl DATA_EFECBD
	dl DATA_EFEDF4
	dl DATA_EFEEF5
	dl DATA_EFF035
	dl DATA_EFF11B
	dl DATA_EFF894
	dl DATA_EFFAFC
	dl DATA_EFFECD
	dl DATA_F00162
	dl DATA_F0062F
	dl DATA_F00823
	dl DATA_F009FC
	dl DATA_F00A1C
	dl DATA_F00FAF
	dl DATA_F01674
	dl DATA_F01B6E
	dl DATA_F01BA9
	dl DATA_F02667
	dl DATA_F02800
	dl DATA_F02988
	dl DATA_F02C2F
	dl DATA_F03A17
	dl DATA_F03A5B
	dl DATA_F03B1D
	dl DATA_F03D2B
	dl DATA_F04854
	dl DATA_F057E3
	dl DATA_F05FFD
	dl DATA_F073F1
	dl DATA_F08A2D
	dl DATA_F09BFB
	dl DATA_F0A157
	dl DATA_F0A5FF
	dl DATA_F0AE2B
	dl DATA_F0B2B0
	dl DATA_F0B7FA
	dl DATA_F0BD45
	dl DATA_F0C93E
	dl DATA_F0CD45
	dl DATA_F0DC8C
	dl DATA_F0F65E
	dl DATA_F1078A
	dl DATA_F10F26
	dl DATA_F117C7
	dl DATA_F11EEE
	dl DATA_F11F0D
	dl DATA_F12A9A
	dl DATA_F133B1
	dl DATA_F139DC
	dl DATA_F14B98
	dl DATA_F14DA6
	dl DATA_F15542
	dl DATA_F15C0F
	dl DATA_F1663C
	dl DATA_F16F1C
	dl DATA_F179D9
	dl DATA_F18004
	dl DATA_F186E4
	dl DATA_F192E5
	dl DATA_F19304
	dl DATA_F19311
	dl DATA_F1946B
	dl DATA_F1A225
	dl DATA_F1A811
	dl DATA_F1AD5B
	dl DATA_F1B55A
	dl DATA_F1B795
	dl DATA_F1B9D0
	dl DATA_F1BC0B
	dl DATA_F1C03F
	dl DATA_F1C916
	dl DATA_F1CC05
	dl DATA_F1CD4E
	dl DATA_F1CFF6
	dl DATA_F1D190
	dl DATA_F1D68A
	dl DATA_F1DF7C
	dl DATA_F1E973
	dl DATA_F1EDA6
	dl DATA_F1F188
	dl DATA_F1F195
	dl DATA_F1F337
	dl DATA_F1F92C
	dl DATA_F20080
	dl DATA_F202BB
	dl DATA_F218D4
	dl DATA_F21E5D
	dl DATA_F22132
	dl DATA_F225B6
	dl DATA_F22C44
	dl DATA_F232D2
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer
	dl !null_pointer

song_data:
	%offset(song_sample_sets, 3)
	dl DATA_EE1939
	dl DATA_EE1223
	dl DATA_EE195F
	dl DATA_EE124D
	dl DATA_EE1F6E
	dl DATA_EE1263
	dl DATA_EE2CD3
	dl DATA_EE127D
	dl DATA_EE3D78
	dl DATA_EE12C1
	dl DATA_EE421F
	dl DATA_EE12D7
	dl DATA_EE52FC
	dl DATA_EE1337
	dl DATA_EE6007
	dl DATA_EE135F
	dl DATA_EE6F47
	dl DATA_EE13B3
	dl DATA_EE748C
	dl DATA_EE13D3
	dl DATA_EE8572
	dl DATA_EE1437
	dl DATA_EE8BC0
	dl DATA_EE144B
	dl DATA_EE9BE0
	dl DATA_EE147F
	dl DATA_EEA050
	dl DATA_EE1497
	dl DATA_EEAF4A
	dl DATA_EE14D9
	dl DATA_EEBDBD
	dl DATA_EE1545
	dl DATA_F2357A
	dl DATA_EE157D
	dl DATA_F244D4
	dl DATA_EE15C3
	dl DATA_F24760
	dl DATA_EE15D5
	dl DATA_F25872
	dl DATA_EE1601
	dl DATA_F25D1A
	dl DATA_EE1613
	dl DATA_F25FC2
	dl DATA_EE1623
	dl DATA_F26F5C
	dl DATA_EE1655
	dl DATA_F28044
	dl DATA_EE168D
	dl DATA_F290D1
	dl DATA_EE16BF
	dl DATA_F29654
	dl DATA_EE16D5
	dl DATA_F29F81
	dl DATA_EE16EF
	dl DATA_F2AB97
	dl DATA_EE1735
	dl DATA_F2BAD2
	dl DATA_EE176D
	dl DATA_F2BFAF
	dl DATA_EE1781
	dl DATA_F2CFE4
	dl DATA_EE17B1
	dl DATA_F2D64B
	dl DATA_EE1837
	dl DATA_EEBDBD
	dl DATA_EE1863
	dl DATA_F25FC2
	dl DATA_EE1895
	dl DATA_EEBDBD
	dl DATA_EE1545
	dl DATA_EEBDBD
	dl DATA_EE18CB
	dl DATA_F2E6A1
	dl DATA_EE18F1
	dl DATA_EEBDBD
	dl DATA_EE1903
	dl DATA_F2E728
	dl DATA_EE1935
	dl DATA_F2E72C
	dl DATA_EE1937
	dl !null_pointer

DATA_EE1179:
	db $00, $00

DATA_EE117B:
	%offset(DATA_EE117D, 2)
	dl DATA_F2F107
	dl DATA_F2F107
	dl DATA_F2F107
	dl DATA_F2F559
	dl DATA_F2F559
	dl DATA_F2F559
	dl DATA_F2F2F1
	dl DATA_F2F559
	dl DATA_F2F107
	dl DATA_F2F559
	dl DATA_F2F723
	dl DATA_F2F559
	dl DATA_F2F107
	dl DATA_F2F979
	dl DATA_F2F12F
	dl DATA_F2F559
	dl DATA_F2F2F1
	dl DATA_F2F107
	dl DATA_F2F2F1
	dl DATA_F2F723
	dl DATA_F2F107
	dl DATA_F2F723
	dl DATA_F2F979
	dl DATA_F2F12F
	dl DATA_F2F107
	dl DATA_F2F107
	dl DATA_F2F2F1
	dl DATA_F2F6C6
	dl DATA_F2F107
	dl DATA_F2F2F1
	dl DATA_F2F2F1
	dl DATA_F2F723
	dl DATA_F2F12F
	dl DATA_F2F979
	dl DATA_F2F979
	dl DATA_F2F2F1
	dl DATA_F2F2F1
	dl DATA_F2F2F1
	dl DATA_F2F107
	dl DATA_F2F107
	dl DATA_F2F107

DATA_EE11F6:
	db $00, $00, $00

global_sample_map:
	db $01, $00, $02, $00, $03, $00, $04, $00
	db $06, $00, $08, $00, $07, $00, $05, $00
	db $00, $00, $A5, $00, $0C, $00, $09, $00
	db $11, $00, $0A, $00, $8B, $00, $43, $00
	db $47, $00, $49, $00, $4B, $00, $4D, $00
	db $FF, $FF

DATA_EE1223:
	db $94, $00, $15, $00, $AB, $00, $C4, $00
	db $CD, $00, $D3, $00, $0D, $00, $0E, $00
	db $0B, $00, $9A, $00, $0F, $00, $10, $00
	db $2B, $00, $D8, $00, $BC, $00, $A1, $00
	db $9F, $00, $C6, $00, $9D, $00, $CC, $00
	db $FF, $FF

DATA_EE124D:
	db $1D, $00, $1C, $00, $A2, $00, $A3, $00
	db $A4, $00, $14, $00, $9A, $00, $94, $00
	db $10, $00, $8F, $00, $FF, $FF

DATA_EE1263:
	db $1E, $00, $1F, $00, $20, $00, $21, $00
	db $22, $00, $23, $00, $24, $00, $A2, $00
	db $A4, $00, $A3, $00, $14, $00, $2B, $00
	db $FF, $FF

DATA_EE127D:
	db $14, $00, $15, $00, $88, $00, $89, $00
	db $17, $00, $26, $00, $27, $00, $1C, $00
	db $25, $00, $29, $00, $22, $00, $2B, $00
	db $28, $00, $2A, $00, $2C, $00, $50, $00
	db $15, $00, $18, $00, $8F, $00, $0E, $00
	db $0B, $00, $9A, $00, $0D, $00, $0F, $00
	db $9F, $00, $C6, $00, $D3, $00, $C4, $00
	db $A1, $00, $D7, $00, $D8, $00, $94, $00
	db $10, $00, $FF, $FF

DATA_EE12C1:
	db $14, $00, $8C, $00, $A2, $00, $18, $00
	db $19, $00, $8D, $00, $1B, $00, $8E, $00
	db $2B, $00, $8F, $00, $FF, $FF

DATA_EE12D7:
	db $37, $00, $39, $00, $3B, $00, $3D, $00
	db $3F, $00, $41, $00, $45, $00, $48, $00
	db $4A, $00, $4C, $00, $4E, $00, $4F, $00
	db $2D, $00, $8A, $00, $14, $00, $8D, $00
	db $32, $00, $A3, $00, $2F, $00, $2E, $00
	db $21, $00, $29, $00, $15, $00, $8F, $00
	db $50, $00, $51, $00, $52, $00, $53, $00
	db $54, $00, $55, $00, $56, $00, $57, $00
	db $58, $00, $59, $00, $C4, $00, $A1, $00
	db $0B, $00, $9A, $00, $0E, $00, $C6, $00
	db $0F, $00, $10, $00, $D3, $00, $9F, $00
	db $0D, $00, $D7, $00, $9D, $00, $FF, $FF

DATA_EE1337:
	db $9E, $00, $A8, $00, $A7, $00, $8F, $00
	db $1E, $00, $13, $00, $A0, $00, $21, $00
	db $22, $00, $24, $00, $94, $00, $9F, $00
	db $0B, $00, $9A, $00, $0D, $00, $9F, $00
	db $C6, $00, $53, $00, $D8, $00, $FF, $FF

DATA_EE135F:
	db $B3, $00, $2F, $00, $B2, $00, $AD, $00
	db $AE, $00, $8B, $00, $18, $00, $14, $00
	db $B4, $00, $1A, $00, $2B, $00, $39, $00
	db $3B, $00, $3D, $00, $3F, $00, $41, $00
	db $43, $00, $45, $00, $47, $00, $48, $00
	db $49, $00, $4A, $00, $4B, $00, $4C, $00
	db $4D, $00, $4E, $00, $4F, $00, $8F, $00
	db $9F, $00, $0F, $00, $10, $00, $A1, $00
	db $BC, $00, $C6, $00, $0E, $00, $C4, $00
	db $D7, $00, $0B, $00, $9A, $00, $0D, $00
	db $9D, $00, $FF, $FF

DATA_EE13B3:
	db $7A, $00, $18, $00, $7B, $00, $7C, $00
	db $7D, $00, $7E, $00, $7F, $00, $80, $00
	db $81, $00, $82, $00, $83, $00, $84, $00
	db $85, $00, $2B, $00, $8F, $00, $FF, $FF

DATA_EE13D3:
	db $15, $00, $14, $00, $18, $00, $2E, $00
	db $34, $00, $8E, $00, $1B, $00, $33, $00
	db $35, $00, $B3, $00, $8F, $00, $28, $00
	db $A6, $00, $50, $00, $51, $00, $52, $00
	db $53, $00, $54, $00, $55, $00, $56, $00
	db $57, $00, $58, $00, $59, $00, $37, $00
	db $39, $00, $3B, $00, $3D, $00, $3F, $00
	db $41, $00, $45, $00, $48, $00, $4A, $00
	db $4C, $00, $4E, $00, $4F, $00, $0D, $00
	db $A1, $00, $BC, $00, $C6, $00, $0E, $00
	db $0B, $00, $9A, $00, $D3, $00, $C4, $00
	db $9D, $00, $D8, $00, $9F, $00, $10, $00
	db $0F, $00, $FF, $FF

DATA_EE1437:
	db $A2, $00, $21, $00, $14, $00, $1E, $00
	db $B6, $00, $A4, $00, $A5, $00, $2B, $00
	db $8F, $00, $FF, $FF

DATA_EE144B:
	db $14, $00, $15, $00, $90, $00, $28, $00
	db $8F, $00, $8E, $00, $91, $00, $92, $00
	db $93, $00, $2E, $00, $D5, $00, $B5, $00
	db $1C, $00, $0E, $00, $0D, $00, $0F, $00
	db $C6, $00, $10, $00, $C6, $00, $A1, $00
	db $D7, $00, $9F, $00, $A9, $00, $D8, $00
	db $BC, $00, $FF, $FF

DATA_EE147F:
	db $B8, $00, $D6, $00, $C0, $00, $D4, $00
	db $D1, $00, $C5, $00, $88, $00, $89, $00
	db $97, $00, $2B, $00, $8F, $00, $FF, $FF

DATA_EE1497:
	db $8D, $00, $19, $00, $18, $00, $D4, $00
	db $A0, $00, $14, $00, $8D, $00, $AF, $00
	db $8E, $00, $21, $00, $39, $00, $3B, $00
	db $3D, $00, $3F, $00, $41, $00, $45, $00
	db $48, $00, $4A, $00, $4C, $00, $4E, $00
	db $8F, $00, $A9, $00, $AA, $00, $0E, $00
	db $0D, $00, $0B, $00, $9A, $00, $0F, $00
	db $C6, $00, $10, $00, $D7, $00, $9F, $00
	db $FF, $FF

DATA_EE14D9:
	db $14, $00, $5A, $00, $5B, $00, $5C, $00
	db $5D, $00, $5E, $00, $5F, $00, $60, $00
	db $61, $00, $62, $00, $63, $00, $64, $00
	db $65, $00, $66, $00, $67, $00, $68, $00
	db $69, $00, $6A, $00, $6B, $00, $6C, $00
	db $6D, $00, $6E, $00, $6F, $00, $70, $00
	db $71, $00, $72, $00, $73, $00, $74, $00
	db $75, $00, $76, $00, $77, $00, $78, $00
	db $79, $00, $98, $00, $95, $00, $96, $00
	db $97, $00, $88, $00, $89, $00, $85, $00
	db $3D, $00, $3F, $00, $41, $00, $45, $00
	db $48, $00, $4A, $00, $4F, $00, $8F, $00
	db $C6, $00, $CC, $00, $D0, $00, $D1, $00
	db $D2, $00, $FF, $FF

DATA_EE1545:
	db $B5, $00, $B6, $00, $B7, $00, $B3, $00
	db $B8, $00, $33, $00, $8D, $00, $36, $00
	db $8D, $00, $A2, $00, $19, $00, $36, $00
	db $2B, $00, $0D, $00, $0B, $00, $9A, $00
	db $C6, $00, $0F, $00, $10, $00, $53, $00
	db $0E, $00, $15, $00, $A1, $00, $BC, $00
	db $8F, $00, $9F, $00, $D8, $00, $FF, $FF

DATA_EE157D:
	db $15, $00, $14, $00, $1D, $00, $24, $00
	db $1E, $00, $1C, $00, $A6, $00, $37, $00
	db $39, $00, $3B, $00, $3D, $00, $3F, $00
	db $41, $00, $43, $00, $45, $00, $47, $00
	db $4F, $00, $18, $00, $2E, $00, $8F, $00
	db $0B, $00, $9A, $00, $0E, $00, $0D, $00
	db $53, $00, $CD, $00, $99, $00, $0F, $00
	db $10, $00, $9B, $00, $9F, $00, $BC, $00
	db $50, $00, $DA, $00, $FF, $FF

DATA_EE15C3:
	db $14, $00, $BE, $00, $A2, $00, $A4, $00
	db $B5, $00, $A0, $00, $2B, $00, $8F, $00
	db $FF, $FF

DATA_EE15D5:
	db $14, $00, $8E, $00, $A5, $00, $18, $00
	db $21, $00, $34, $00, $1B, $00, $33, $00
	db $36, $00, $8D, $00, $2E, $00, $24, $00
	db $8F, $00, $94, $00, $9F, $00, $0B, $00
	db $9A, $00, $0D, $00, $9F, $00, $C6, $00
	db $53, $00, $FF, $FF

DATA_EE1601:
	db $1D, $00, $14, $00, $AF, $00, $B5, $00
	db $1C, $00, $A5, $00, $33, $00, $BC, $00
	db $FF, $FF

DATA_EE1613:
	db $8D, $00, $24, $00, $18, $00, $14, $00
	db $33, $00, $2B, $00, $8F, $00, $FF, $FF

DATA_EE1623:
	db $14, $00, $A5, $00, $A2, $00, $21, $00
	db $22, $00, $23, $00, $1D, $00, $24, $00
	db $A3, $00, $A4, $00, $1E, $00, $8F, $00
	db $2E, $00, $2B, $00, $0D, $00, $AB, $00
	db $A1, $00, $C4, $00, $BC, $00, $2B, $00
	db $D7, $00, $86, $00, $9A, $00, $94, $00
	db $FF, $FF

DATA_EE1655:
	db $AF, $00, $1D, $00, $A2, $00, $A4, $00
	db $14, $00, $B0, $00, $24, $00, $B1, $00
	db $22, $00, $AC, $00, $8F, $00, $2E, $00
	db $9F, $00, $C6, $00, $0B, $00, $9A, $00
	db $0D, $00, $C4, $00, $A1, $00, $BC, $00
	db $0F, $00, $10, $00, $D7, $00, $53, $00
	db $0E, $00, $D8, $00, $A9, $00, $FF, $FF

DATA_EE168D:
	db $14, $00, $B8, $00, $BA, $00, $BE, $00
	db $B6, $00, $A2, $00, $B9, $00, $BD, $00
	db $1E, $00, $A4, $00, $3F, $00, $28, $00
	db $BB, $00, $8F, $00, $2E, $00, $C6, $00
	db $CC, $00, $D0, $00, $D1, $00, $D2, $00
	db $C1, $00, $C2, $00, $C3, $00, $8E, $00
	db $FF, $FF

DATA_EE16BF:
	db $0C, $00, $17, $00, $0D, $00, $19, $00
	db $18, $00, $B7, $00, $28, $00, $87, $00
	db $2B, $00, $8F, $00, $FF, $FF

DATA_EE16D5:
	db $B8, $00, $28, $00, $29, $00, $AF, $00
	db $2B, $00, $16, $00, $17, $00, $19, $00
	db $15, $00, $9F, $00, $2B, $00, $8F, $00
	db $FF, $FF

DATA_EE16EF:
	db $12, $00, $88, $00, $37, $00, $39, $00
	db $3B, $00, $3F, $00, $41, $00, $43, $00
	db $45, $00, $47, $00, $48, $00, $4A, $00
	db $AF, $00, $2C, $00, $C5, $00, $14, $00
	db $C0, $00, $8F, $00, $2E, $00, $0B, $00
	db $9A, $00, $0E, $00, $0F, $00, $10, $00
	db $0D, $00, $9F, $00, $CD, $00, $99, $00
	db $C6, $00, $2B, $00, $53, $00, $50, $00
	db $D8, $00, $DA, $00, $FF, $FF

DATA_EE1735:
	db $C8, $00, $C9, $00, $CA, $00, $0D, $00
	db $31, $00, $29, $00, $CB, $00, $86, $00
	db $C7, $00, $28, $00, $C0, $00, $A6, $00
	db $31, $00, $96, $00, $8F, $00, $0F, $00
	db $10, $00, $0E, $00, $0D, $00, $C6, $00
	db $D7, $00, $0B, $00, $9A, $00, $9F, $00
	db $D8, $00, $53, $00, $B8, $00, $FF, $FF

DATA_EE176D:
	db $CE, $00, $CF, $00, $14, $00, $1D, $00
	db $21, $00, $A6, $00, $90, $00, $BF, $00
	db $9F, $00, $FF, $FF

DATA_EE1781:
	db $13, $00, $1E, $00, $36, $00, $24, $00
	db $21, $00, $86, $00, $A1, $00, $9C, $00
	db $9D, $00, $14, $00, $8F, $00, $0B, $00
	db $9A, $00, $99, $00, $0F, $00, $10, $00
	db $0E, $00, $0D, $00, $C6, $00, $53, $00
	db $D8, $00, $9F, $00, $DA, $00, $FF, $FF

DATA_EE17B1:
	db $CE, $00, $CF, $00, $C0, $00, $A6, $00
	db $90, $00, $B8, $00, $2E, $00, $34, $00
	db $8E, $00, $B6, $00, $5A, $00, $5B, $00
	db $5C, $00, $5D, $00, $5E, $00, $5F, $00
	db $60, $00, $61, $00, $62, $00, $63, $00
	db $64, $00, $65, $00, $66, $00, $67, $00
	db $68, $00, $69, $00, $6A, $00, $6B, $00
	db $6C, $00, $6D, $00, $6E, $00, $6F, $00
	db $70, $00, $71, $00, $72, $00, $73, $00
	db $74, $00, $75, $00, $76, $00, $77, $00
	db $78, $00, $79, $00, $37, $00, $39, $00
	db $3B, $00, $3D, $00, $3F, $00, $41, $00
	db $45, $00, $48, $00, $4A, $00, $4C, $00
	db $4E, $00, $4F, $00, $2B, $00, $0D, $00
	db $50, $00, $53, $00, $A1, $00, $C6, $00
	db $9F, $00, $0F, $00, $10, $00, $CD, $00
	db $D7, $00, $99, $00, $FF, $FF

DATA_EE1837:
	db $CE, $00, $CF, $00, $21, $00, $A2, $00
	db $BE, $00, $2E, $00, $90, $00, $A6, $00
	db $96, $00, $8F, $00, $14, $00, $0D, $00
	db $D9, $00, $9D, $00, $53, $00, $BC, $00
	db $D2, $00, $86, $00, $AD, $00, $88, $00
	db $94, $00, $FF, $FF

DATA_EE1863:
	db $B5, $00, $B6, $00, $B7, $00, $B3, $00
	db $B8, $00, $33, $00, $8D, $00, $36, $00
	db $8D, $00, $A2, $00, $19, $00, $36, $00
	db $8F, $00, $0D, $00, $C6, $00, $CC, $00
	db $D0, $00, $D1, $00, $D2, $00, $67, $00
	db $C1, $00, $C2, $00, $C3, $00, $8E, $00
	db $FF, $FF

DATA_EE1895:
	db $14, $00, $A5, $00, $A2, $00, $21, $00
	db $22, $00, $23, $00, $1D, $00, $24, $00
	db $A3, $00, $A4, $00, $1E, $00, $8F, $00
	db $2E, $00, $0D, $00, $D7, $00, $86, $00
	db $BD, $00, $A9, $00, $AA, $00, $2B, $00
	db $C6, $00, $A1, $00, $2F, $00, $D9, $00
	db $BC, $00, $FF, $FF, $FF, $FF

DATA_EE18CB:
	db $B5, $00, $B6, $00, $B7, $00, $B3, $00
	db $B8, $00, $33, $00, $8D, $00, $36, $00
	db $8D, $00, $A2, $00, $19, $00, $36, $00
	db $0D, $00, $C6, $00, $8F, $00, $50, $00
	db $99, $00, $DA, $00, $FF, $FF

DATA_EE18F1:
	db $A7, $00, $9D, $00, $D9, $00, $88, $00
	db $D3, $00, $C1, $00, $C2, $00, $C3, $00
	db $FF, $FF

DATA_EE1903:
	db $B5, $00, $B6, $00, $B7, $00, $B3, $00
	db $B8, $00, $33, $00, $8D, $00, $36, $00
	db $8D, $00, $A2, $00, $19, $00, $36, $00
	db $0D, $00, $0B, $00, $9A, $00, $C6, $00
	db $0F, $00, $10, $00, $53, $00, $0E, $00
	db $8F, $00, $9F, $00, $D8, $00, $94, $00
	db $FF, $FF

DATA_EE1935:
	db $FF, $FF

DATA_EE1937:
	db $FF, $FF

DATA_EE1939:
	db $00, $13, $11, $00, $14, $13, $21, $13
	db $21, $13, $21, $13, $21, $13, $21, $13
	db $21, $13, $21, $13, $80, $FF, $00, $13
	db $15, $37, $23, $23, $18, $7F, $0A, $01
	db $01, $01, $01, $01, $01, $00

DATA_EE195F:
	db $00, $13, $06, $03, $17, $13, $54, $17
	db $04, $16, $F8, $17, $1C, $14, $0A, $17
	db $2B, $15, $88, $14, $CA, $FF, $00, $13
	db $80, $10, $05, $1F, $08, $21, $14, $13
	db $24, $6E, $15, $37, $20, $20, $18, $7F
	db $01, $00, $00, $00, $00, $00, $00, $80
	db $10, $01, $1D, $02, $1E, $1E, $10, $DF
	db $2B, $13, $FF, $12, $03, $06, $08, $04
	db $20, $1A, $14, $01, $1D, $10, $CF, $4B
	db $13, $FF, $12, $03, $04, $02, $F0, $13
	db $21, $B3, $13, $07, $1C, $9B, $1D, $99
	db $21, $74, $13, $01, $1D, $02, $1E, $1E
	db $10, $DF, $2B, $13, $FF, $12, $03, $06
	db $08, $04, $10, $1A, $14, $07, $1C, $9B
	db $1D, $99, $21, $74, $13, $03, $2D, $13
	db $01, $A2, $13, $08, $12, $F6, $02, $16
	db $0E, $10, $DE, $A8, $80, $10, $02, $11
	db $0C, $E0, $06, $80, $02, $E0, $06, $80
	db $02, $E0, $10, $02, $04, $07, $E0, $08
	db $02, $04, $02, $E0, $08, $80, $10, $02
	db $11, $0C, $E1, $06, $80, $02, $E1, $06
	db $80, $02, $E1, $10, $02, $04, $07, $E1
	db $08, $E1, $08, $02, $04, $02, $05, $1C
	db $9D, $1D, $99, $04, $04, $09, $14, $1C
	db $9B, $1D, $9B, $21, $09, $14, $1C, $99
	db $1D, $9B, $21, $09, $14, $1C, $9D, $1D
	db $99, $21, $09, $14, $1C, $96, $1D, $99
	db $21, $09, $14, $1C, $99, $1D, $96, $04
	db $04, $09, $14, $1C, $9B, $1D, $98, $04
	db $04, $09, $14, $1C, $9D, $1D, $98, $04
	db $04, $09, $14, $05, $1C, $99, $1D, $96
	db $04, $04, $09, $14, $1C, $98, $1D, $95
	db $04, $02, $09, $14, $1C, $99, $1D, $96
	db $04, $02, $09, $14, $05, $02, $18, $28
	db $E0, $02, $0D, $08, $E0, $02, $18, $28
	db $E1, $02, $0D, $08, $E1, $05, $91, $05
	db $21, $14, $13, $80, $10, $01, $1D, $10
	db $CF, $4B, $13, $FF, $12, $03, $06, $08
	db $04, $02, $79, $14, $1C, $98, $1D, $99
	db $04, $02, $09, $14, $1C, $9B, $1D, $99
	db $21, $09, $14, $1C, $9B, $1D, $9D, $21
	db $09, $14, $1C, $91, $1D, $91, $04, $1C
	db $09, $14, $02, $16, $16, $04, $20, $77
	db $14, $07, $1C, $99, $1D, $92, $21, $74
	db $13, $01, $1D, $10, $CF, $4B, $13, $FF
	db $12, $03, $06, $08, $04, $02, $79, $14
	db $07, $1C, $99, $1D, $92, $21, $74, $13
	db $03, $21, $14, $95, $05, $1C, $98, $1D
	db $99, $21, $09, $14, $1C, $98, $1D, $96
	db $21, $09, $14, $05, $21, $14, $13, $01
	db $14, $13, $E4, $12, $02, $02, $60, $60
	db $10, $D8, $E5, $2B, $85, $01, $10, $2C
	db $01, $1D, $10, $CF, $4B, $13, $FF, $12
	db $03, $06, $08, $04, $02, $12, $15, $21
	db $F9, $14, $1C, $8D, $1D, $8D, $04, $04
	db $09, $14, $02, $18, $18, $04, $20, $F7
	db $14, $07, $1C, $92, $1D, $91, $21, $74
	db $13, $01, $1D, $02, $1E, $1E, $10, $DF
	db $2B, $13, $FF, $12, $03, $1C, $95, $1D
	db $95, $06, $08, $04, $04, $09, $14, $07
	db $1C, $92, $1D, $91, $21, $74, $13, $01
	db $14, $13, $E4, $12, $02, $02, $60, $60
	db $10, $D8, $E5, $2B, $85, $01, $00, $2C
	db $03, $9C, $14, $91, $05, $1C, $96, $1D
	db $96, $04, $04, $09, $14, $1C, $95, $1D
	db $95, $04, $02, $09, $14, $1C, $96, $1D
	db $96, $04, $02, $09, $14, $05, $1C, $8D
	db $1D, $8D, $04, $04, $09, $14, $1C, $8C
	db $1D, $8C, $04, $02, $09, $14, $1C, $8D
	db $1D, $8D, $04, $02, $09, $14, $05, $21
	db $14, $13, $80, $10, $01, $A5, $13, $00
	db $10, $AF, $EB, $80, $30, $02, $14, $08
	db $99, $05, $99, $05, $99, $06, $99, $08
	db $02, $03, $08, $99, $08, $02, $05, $02
	db $99, $20, $02, $08, $14, $99, $05, $99
	db $05, $99, $06, $99, $08, $02, $08, $03
	db $99, $08, $02, $02, $05, $99, $20, $02
	db $14, $08, $99, $05, $99, $05, $99, $06
	db $99, $08, $02, $03, $08, $99, $08, $02
	db $0E, $0E, $99, $05, $99, $05, $99, $06
	db $02, $11, $11, $99, $08, $99, $08, $9A
	db $08, $99, $08, $01, $A3, $13, $0C, $12
	db $AD, $10, $FF, $72, $02, $03, $08, $9D
	db $10, $99, $20, $96, $10, $9D, $10, $99
	db $20, $96, $10, $9B, $20, $99, $10, $98
	db $10, $99, $10, $96, $10, $91, $20, $9D
	db $10, $99, $20, $96, $10, $9D, $10, $99
	db $20, $96, $10, $9B, $20, $99, $10, $98
	db $10, $96, $40, $9D, $10, $99, $10, $A2
	db $20, $9D, $10, $99, $10, $A2, $20, $A1
	db $18, $A1, $08, $A2, $10, $A4, $10, $A5
	db $10, $A4, $10, $A2, $20, $9D, $10, $99
	db $10, $A2, $20, $9D, $10, $99, $10, $A2
	db $20, $95, $20, $96, $10, $98, $20, $99
	db $10, $9B, $10, $9D, $10, $95, $20, $96
	db $10, $98, $20, $99, $10, $9B, $10, $9D
	db $10, $80, $C0, $80, $C0, $03, $30, $15
	db $21, $14, $13, $80, $10, $80, $80, $80
	db $80, $01, $1C, $02, $14, $0A, $10, $8D
	db $EB, $13, $0E, $12, $30, $0F, $02, $04
	db $0B, $05, $21, $C2, $16, $01, $A2, $13
	db $08, $12, $F6, $02, $16, $0E, $10, $DE
	db $AB, $21, $55, $16, $01, $1D, $10, $CF
	db $4B, $13, $FF, $12, $03, $02, $0A, $15
	db $10, $9E, $E1, $04, $04, $4C, $16, $80
	db $80, $04, $04, $4C, $16, $03, $09, $16
	db $9E, $08, $99, $08, $96, $08, $92, $08
	db $05, $96, $14, $80, $04, $96, $06, $80
	db $02, $99, $0E, $80, $02, $96, $0C, $80
	db $04, $99, $28, $80, $08, $96, $0E, $80
	db $02, $95, $16, $80, $02, $95, $08, $96
	db $10, $98, $10, $96, $0E, $80, $02, $91
	db $0E, $80, $02, $96, $11, $80, $0F, $96
	db $16, $80, $02, $96, $08, $99, $10, $96
	db $10, $99, $30, $96, $0E, $80, $02, $95
	db $16, $80, $02, $95, $06, $80, $02, $96
	db $10, $95, $0C, $80, $1C, $96, $06, $80
	db $02, $98, $10, $96, $0E, $80, $02, $95
	db $16, $80, $02, $95, $08, $96, $10, $98
	db $12, $80, $0E, $99, $08, $99, $06, $80
	db $02, $9B, $10, $9D, $10, $05, $27, $03
	db $01, $02, $26, $96, $16, $80, $02, $96
	db $08, $99, $10, $96, $10, $99, $28, $80
	db $08, $96, $0E, $80, $02, $95, $16, $80
	db $02, $95, $08, $96, $10, $98, $10, $96
	db $20, $91, $1C, $80, $04, $96, $16, $80
	db $02, $96, $08, $99, $10, $96, $10, $99
	db $30, $96, $0E, $80, $02, $95, $16, $80
	db $02, $95, $08, $96, $10, $98, $10, $96
	db $30, $80, $0C, $80, $04, $05, $21, $14
	db $13, $80, $11, $80, $10, $01, $1C, $02
	db $03, $07, $10, $8C, $E7, $13, $0E, $12
	db $30, $0F, $03, $03, $0E, $07, $80, $80
	db $80, $80, $21, $C2, $16, $01, $A2, $13
	db $08, $12, $F6, $02, $03, $08, $10, $DE
	db $AB, $21, $55, $16, $01, $1D, $10, $CF
	db $4B, $13, $FF, $12, $03, $02, $0A, $05
	db $10, $9E, $E1, $04, $04, $4C, $16, $80
	db $80, $04, $04, $4C, $16, $03, $11, $17
	db $21, $14, $13, $80, $08, $01, $A4, $02
	db $40, $40, $13, $00, $12, $AD, $10, $DF
	db $51, $8A, $80, $80, $60, $85, $10, $85
	db $10, $85, $08, $01, $14, $13, $E4, $12
	db $02, $02, $60, $60, $10, $D8, $E5, $2B
	db $8A, $01, $80, $2C, $85, $40, $8A, $40
	db $10, $EC, $8F, $8A, $10, $8A, $20, $8A
	db $08, $8A, $08, $8A, $08, $8A, $08, $8A
	db $30, $8A, $10, $8A, $20, $8A, $08, $8A
	db $08, $8A, $08, $8A, $08, $8A, $10, $8A
	db $08, $8A, $08, $8A, $10, $8A, $10, $8A
	db $20, $8A, $08, $8A, $08, $8A, $08, $8A
	db $08, $8A, $20, $8A, $08, $8A, $08, $10
	db $EE, $AF, $85, $10, $85, $20, $85, $08
	db $85, $08, $85, $08, $85, $08, $85, $10
	db $85, $10, $85, $08, $85, $08, $85, $10
	db $85, $20, $85, $08, $85, $08, $85, $08
	db $85, $08, $85, $10, $85, $08, $85, $08
	db $85, $08, $85, $08, $10, $AC, $E5, $83
	db $40, $86, $40, $85, $80, $83, $40, $86
	db $38, $03, $59, $17, $21, $14, $13, $01
	db $A4, $02, $40, $40, $13, $F4, $12, $AD
	db $10, $DF, $51, $96, $10, $91, $20, $8A
	db $40, $8A, $40, $8A, $20, $8A, $20, $91
	db $10, $91, $10, $96, $80, $80, $80, $80
	db $80, $80, $40, $80, $30, $96, $08, $96
	db $08, $96, $10, $13, $00, $01, $A5, $10
	db $AF, $EB, $02, $16, $16, $99, $08, $02
	db $06, $06, $99, $08, $02, $03, $03, $99
	db $10, $02, $16, $16, $99, $08, $99, $08
	db $99, $08, $99, $08, $99, $08, $02, $06
	db $06, $99, $08, $02, $03, $03, $99, $10
	db $21, $01, $19, $21, $E0, $18, $04, $02
	db $CE, $18, $21, $E0, $18, $02, $16, $16
	db $99, $08, $99, $08, $99, $08, $02, $06
	db $06, $99, $08, $02, $03, $03, $99, $10
	db $99, $08, $99, $08, $21, $E0, $18, $99
	db $08, $99, $08, $99, $08, $02, $06, $06
	db $99, $08, $02, $16, $16, $99, $08, $02
	db $06, $06, $99, $08, $02, $16, $16, $99
	db $08, $99, $08, $21, $E0, $18, $99, $08
	db $99, $08, $99, $08, $02, $06, $06, $99
	db $08, $01, $A4, $02, $40, $40, $13, $F4
	db $12, $AD, $10, $DF, $51, $91, $08, $91
	db $08, $91, $08, $91, $08, $9B, $40, $9E
	db $40, $9D, $60, $91, $08, $91, $08, $91
	db $08, $91, $08, $9B, $40, $9E, $40, $03
	db $09, $18, $02, $16, $16, $99, $08, $99
	db $08, $02, $16, $16, $99, $08, $02, $06
	db $06, $99, $08, $05, $02, $16, $16, $99
	db $08, $02, $06, $06, $99, $08, $02, $16
	db $16, $99, $08, $02, $06, $06, $99, $08
	db $02, $03, $03, $99, $10, $02, $16, $16
	db $99, $08, $99, $08, $05, $02, $14, $14
	db $99, $05, $99, $05, $99, $06, $05

DATA_EE1F6E:
	db $00, $13, $B1, $06, $1B, $13, $32, $1B
	db $03, $15, $F8, $15, $3D, $18, $B9, $1C
	db $67, $14, $E6, $19, $A5, $FF, $00, $13
	db $05, $80, $80, $05, $80, $10, $05, $1F
	db $08, $21, $18, $13, $24, $46, $17, $15
	db $37, $12, $12, $18, $7F, $01, $00, $00
	db $00, $00, $00, $00, $16, $21, $60, $14
	db $0F, $03, $01, $0B, $02, $02, $1E, $14
	db $10, $8B, $F2, $21, $16, $14, $0E, $01
	db $A2, $13, $FC, $12, $F6, $02, $4A, $3C
	db $10, $8F, $E0, $21, $EC, $13, $9A, $30
	db $21, $0F, $14, $02, $25, $27, $10, $8D
	db $A1, $0F, $02, $03, $05, $05, $21, $BF
	db $13, $0E, $01, $A2, $13, $FC, $12, $F6
	db $02, $4A, $3C, $10, $8F, $E0, $21, $76
	db $13, $00, $8F, $20, $80, $10, $92, $20
	db $80, $10, $8F, $20, $80, $08, $8B, $08
	db $8A, $20, $80, $10, $8F, $20, $80, $08
	db $91, $08, $92, $20, $80, $10, $94, $18
	db $92, $0E, $80, $02, $91, $08, $92, $18
	db $8F, $18, $80, $0C, $94, $0C, $96, $0C
	db $97, $0C, $96, $0E, $80, $02, $92, $08
	db $8F, $18, $91, $16, $80, $02, $92, $0C
	db $94, $0C, $97, $1E, $80, $02, $96, $1E
	db $80, $02, $05, $A3, $18, $A2, $10, $A0
	db $08, $A2, $18, $9E, $18, $A0, $18, $9E
	db $10, $9C, $08, $9B, $30, $9C, $18, $9B
	db $10, $99, $08, $9B, $0C, $97, $0C, $94
	db $18, $95, $18, $96, $0C, $98, $0C, $9A
	db $10, $9B, $08, $9D, $0C, $9E, $0C, $05
	db $8F, $28, $91, $08, $92, $18, $8F, $18
	db $94, $18, $92, $10, $91, $08, $92, $18
	db $8F, $18, $94, $18, $96, $10, $97, $08
	db $96, $18, $92, $18, $95, $18, $96, $10
	db $98, $08, $05, $01, $14, $13, $FC, $12
	db $02, $05, $04, $02, $4F, $14, $A2, $10
	db $A2, $08, $A3, $10, $A2, $08, $A2, $10
	db $A2, $08, $A2, $10, $A2, $08, $04, $02
	db $3E, $14, $06, $08, $A1, $9D, $A1, $A1
	db $9D, $A1, $A2, $9D, $A2, $A2, $9D, $A2
	db $07, $05, $A3, $10, $A3, $08, $A3, $10
	db $A3, $08, $A2, $10, $A2, $08, $A2, $10
	db $A2, $08, $05, $A2, $10, $A3, $08, $A3
	db $10, $A2, $08, $A2, $10, $9E, $08, $A2
	db $10, $9E, $08, $05, $01, $1E, $13, $0C
	db $12, $B8, $05, $21, $18, $13, $16, $01
	db $A3, $13, $0C, $12, $AD, $10, $8F, $D5
	db $06, $04, $02, $06, $12, $9E, $9C, $02
	db $08, $18, $9A, $98, $96, $94, $02, $04
	db $0C, $98, $96, $94, $02, $02, $06, $98
	db $96, $94, $07, $80, $90, $01, $1F, $02
	db $30, $30, $10, $8F, $E8, $13, $FD, $12
	db $19, $8F, $28, $91, $08, $92, $18, $8F
	db $18, $94, $18, $92, $10, $91, $08, $92
	db $18, $8F, $18, $94, $18, $96, $10, $97
	db $08, $96, $18, $92, $18, $91, $18, $91
	db $18, $96, $30, $0E, $01, $A2, $13, $FC
	db $12, $F6, $02, $0E, $1B, $10, $8F, $E0
	db $0F, $03, $02, $0B, $01, $80, $0B, $21
	db $EC, $13, $9A, $24, $21, $0F, $14, $02
	db $0A, $10, $10, $8D, $A1, $0F, $02, $03
	db $05, $05, $80, $0E, $21, $BF, $13, $0E
	db $01, $A2, $13, $FC, $12, $F6, $02, $0E
	db $1B, $10, $8F, $E0, $0F, $03, $02, $0B
	db $01, $80, $0B, $21, $76, $13, $00, $21
	db $18, $13, $16, $01, $A3, $13, $0C, $12
	db $AD, $10, $8F, $D5, $02, $06, $12, $80
	db $02, $06, $04, $9D, $02, $08, $18, $9B
	db $99, $97, $95, $93, $02, $04, $0C, $97
	db $95, $93, $02, $02, $06, $97, $95, $93
	db $07, $80, $8E, $01, $20, $02, $1E, $1E
	db $10, $8B, $E8, $13, $00, $12, $29, $0F
	db $04, $02, $03, $05, $8F, $28, $91, $08
	db $92, $18, $8F, $18, $94, $18, $92, $10
	db $91, $08, $92, $18, $8F, $18, $94, $18
	db $96, $10, $97, $08, $96, $18, $92, $18
	db $91, $18, $91, $18, $96, $30, $17, $01
	db $21, $02, $4A, $4A, $13, $00, $12, $AE
	db $0F, $02, $02, $0B, $03, $10, $8E, $67
	db $8F, $60, $88, $48, $10, $8E, $76, $86
	db $0C, $83, $0C, $88, $18, $88, $18, $83
	db $18, $86, $18, $89, $18, $8C, $18, $8E
	db $18, $8A, $18, $02, $44, $44, $10, $8E
	db $D7, $88, $18, $88, $18, $8F, $18, $8F
	db $18, $84, $18, $84, $18, $8B, $18, $8B
	db $18, $8D, $18, $8D, $18, $88, $18, $88
	db $18, $85, $18, $85, $18, $8A, $18, $8A
	db $18, $02, $3A, $3A, $10, $8E, $C1, $8F
	db $20, $80, $10, $92, $20, $80, $10, $8F
	db $20, $80, $08, $8B, $08, $8A, $20, $80
	db $10, $8F, $20, $80, $08, $91, $08, $92
	db $20, $80, $10, $94, $18, $92, $0E, $80
	db $02, $91, $08, $92, $18, $8F, $18, $01
	db $14, $13, $FC, $12, $02, $02, $14, $14
	db $10, $88, $EA, $9B, $30, $9B, $30, $9A
	db $30, $9A, $40, $00, $21, $18, $13, $16
	db $01, $14, $13, $FC, $12, $02, $02, $10
	db $10, $10, $8C, $A2, $0F, $02, $03, $05
	db $05, $9E, $10, $9E, $08, $9E, $10, $9E
	db $08, $9E, $10, $9E, $08, $9E, $10, $9E
	db $08, $9E, $10, $9E, $08, $9E, $10, $9E
	db $08, $9E, $10, $9E, $08, $9E, $10, $9E
	db $08, $9E, $10, $9E, $08, $9E, $10, $9E
	db $08, $9E, $10, $9E, $08, $9E, $10, $9E
	db $08, $A0, $10, $A0, $08, $A0, $10, $A0
	db $08, $9E, $10, $9E, $08, $9E, $10, $9E
	db $08, $A0, $10, $A0, $08, $A0, $10, $A0
	db $08, $9E, $10, $9E, $08, $9E, $10, $9E
	db $08, $9D, $10, $9D, $08, $9D, $10, $9D
	db $08, $9D, $10, $9D, $08, $9D, $10, $9D
	db $08, $10, $8C, $A0, $9E, $60, $A0, $30
	db $9E, $30, $02, $30, $30, $97, $18, $99
	db $18, $9B, $18, $9E, $18, $9D, $18, $A1
	db $18, $A2, $30, $01, $22, $02, $40, $20
	db $13, $05, $12, $B6, $10, $8F, $E0, $80
	db $08, $02, $28, $0A, $9B, $04, $02, $06
	db $10, $9B, $04, $02, $28, $0A, $A0, $04
	db $02, $06, $10, $A0, $04, $02, $28, $0A
	db $A3, $04, $02, $06, $10, $A3, $04, $80
	db $18, $02, $28, $0A, $A2, $04, $02, $06
	db $10, $A2, $04, $02, $28, $0A, $A3, $04
	db $02, $06, $10, $A3, $04, $02, $28, $0A
	db $A2, $04, $02, $06, $10, $A2, $04, $02
	db $28, $0A, $9E, $04, $02, $06, $10, $9E
	db $04, $02, $28, $0A, $9B, $04, $02, $06
	db $10, $9B, $04, $80, $08, $02, $28, $0A
	db $97, $04, $02, $06, $10, $97, $04, $02
	db $28, $0A, $9C, $04, $02, $06, $10, $9C
	db $04, $02, $28, $0A, $A0, $04, $02, $06
	db $10, $A0, $04, $80, $18, $02, $28, $0A
	db $9B, $04, $02, $06, $10, $9B, $04, $02
	db $28, $0A, $9C, $04, $02, $06, $10, $9C
	db $04, $02, $28, $0A, $9B, $04, $02, $06
	db $10, $9B, $04, $02, $28, $0A, $99, $04
	db $02, $06, $10, $99, $04, $02, $28, $0A
	db $97, $04, $02, $06, $10, $97, $04, $80
	db $08, $02, $28, $0A, $99, $04, $02, $06
	db $10, $99, $04, $02, $28, $0A, $9B, $04
	db $02, $06, $10, $9B, $04, $02, $28, $0A
	db $9C, $04, $02, $06, $10, $9C, $04, $80
	db $18, $02, $28, $0A, $99, $04, $02, $06
	db $10, $99, $04, $02, $28, $0A, $9C, $04
	db $02, $06, $10, $9C, $04, $02, $28, $0A
	db $9B, $04, $02, $06, $10, $9B, $04, $02
	db $28, $0A, $97, $04, $02, $06, $10, $97
	db $04, $02, $28, $0A, $94, $04, $02, $06
	db $10, $94, $04, $01, $23, $02, $1A, $2A
	db $10, $8D, $EA, $13, $00, $12, $2A, $80
	db $08, $95, $08, $96, $08, $98, $08, $99
	db $08, $9B, $10, $9D, $08, $9E, $08, $9D
	db $04, $9B, $04, $99, $04, $98, $04, $96
	db $08, $01, $1E, $13, $0C, $12, $B8, $10
	db $8E, $F2, $0F, $03, $01, $0B, $02, $02
	db $14, $0A, $80, $0C, $9B, $03, $9D, $03
	db $9E, $03, $A0, $03, $A2, $10, $80, $14
	db $9B, $03, $9D, $03, $9E, $03, $A0, $03
	db $A2, $10, $80, $14, $9B, $03, $9D, $03
	db $9E, $03, $A0, $03, $A2, $10, $80, $14
	db $9B, $03, $9D, $03, $9E, $03, $A0, $03
	db $A2, $10, $80, $14, $9B, $03, $9D, $03
	db $9E, $03, $A0, $03, $A2, $10, $80, $14
	db $9B, $03, $9D, $03, $9E, $03, $A0, $03
	db $A2, $10, $80, $14, $9B, $03, $9E, $03
	db $A0, $03, $A2, $03, $A3, $10, $80, $14
	db $9B, $03, $9D, $03, $9E, $03, $A0, $03
	db $A2, $18, $01, $14, $13, $FC, $12, $02
	db $02, $14, $14, $10, $88, $EA, $A3, $30
	db $A2, $30, $A0, $30, $A3, $20, $A2, $20
	db $00, $21, $18, $13, $16, $01, $24, $13
	db $0C, $12, $AB, $02, $0A, $20, $10, $8E
	db $FA, $A2, $08, $9E, $08, $9B, $08, $A3
	db $08, $9E, $08, $9B, $08, $A2, $08, $9E
	db $08, $9B, $08, $A2, $08, $9E, $08, $9B
	db $08, $A2, $08, $9E, $08, $9B, $08, $A3
	db $08, $9E, $08, $9B, $08, $A2, $08, $9E
	db $08, $9B, $08, $A2, $08, $9E, $08, $9B
	db $08, $A2, $08, $9E, $08, $9B, $08, $A3
	db $08, $9E, $08, $9B, $08, $A2, $08, $9E
	db $08, $9B, $08, $A2, $08, $9E, $08, $9B
	db $08, $A3, $08, $A0, $08, $9B, $08, $A3
	db $08, $A0, $08, $9B, $08, $A2, $08, $9E
	db $08, $9B, $08, $A2, $08, $9E, $08, $9B
	db $08, $A3, $08, $A0, $08, $9B, $08, $A3
	db $08, $A0, $08, $9B, $08, $A2, $08, $9E
	db $08, $9B, $08, $A2, $08, $9E, $08, $9B
	db $08, $A1, $08, $9D, $08, $98, $08, $A1
	db $08, $9D, $08, $98, $08, $02, $30, $10
	db $14, $F4, $10, $8E, $D5, $8E, $03, $8F
	db $03, $91, $03, $93, $03, $94, $03, $96
	db $03, $98, $03, $9A, $03, $9B, $03, $9D
	db $03, $9F, $03, $A0, $03, $A2, $03, $A4
	db $03, $A6, $03, $A7, $03, $17, $01, $A4
	db $02, $50, $50, $13, $00, $12, $AD, $10
	db $8F, $92, $8F, $60, $88, $48, $86, $0C
	db $83, $0C, $88, $90, $16, $01, $24, $13
	db $00, $12, $AB, $02, $30, $10, $10, $8E
	db $D5, $8A, $03, $8C, $03, $8E, $03, $8F
	db $03, $91, $03, $93, $03, $94, $03, $96
	db $03, $98, $03, $9A, $03, $9B, $03, $9D
	db $03, $9F, $03, $A0, $03, $A2, $03, $A4
	db $03, $01, $14, $13, $FC, $12, $02, $02
	db $28, $18, $10, $8C, $A2, $0F, $02, $03
	db $05, $05, $9B, $30, $9E, $18, $9B, $18
	db $97, $60, $99, $30, $94, $30, $91, $30
	db $96, $30, $01, $1E, $13, $0C, $12, $B8
	db $10, $8E, $F2, $0F, $03, $01, $0B, $02
	db $80, $0B, $02, $04, $0F, $80, $0C, $9B
	db $03, $9D, $03, $9E, $03, $A0, $03, $A2
	db $10, $80, $14, $9B, $03, $9D, $03, $9E
	db $03, $A0, $03, $A2, $10, $80, $14, $9B
	db $03, $9D, $03, $9E, $03, $A0, $03, $A2
	db $10, $80, $14, $9B, $03, $9D, $03, $9E
	db $03, $A0, $03, $A2, $10, $80, $14, $9B
	db $03, $9D, $03, $9E, $03, $A0, $03, $A2
	db $10, $80, $14, $9B, $03, $9D, $03, $9E
	db $03, $A0, $03, $A2, $10, $80, $14, $9B
	db $03, $9E, $03, $A0, $03, $A2, $03, $A3
	db $10, $80, $14, $9B, $03, $9D, $03, $9E
	db $03, $A0, $03, $A2, $0D, $01, $14, $13
	db $FC, $12, $02, $02, $14, $14, $10, $88
	db $EA, $A0, $30, $9E, $30, $9D, $30, $A0
	db $40, $00, $21, $18, $13, $16, $01, $23
	db $02, $30, $30, $10, $8E, $EA, $13, $00
	db $12, $2A, $96, $08, $92, $08, $97, $08
	db $97, $08, $92, $08, $96, $08, $96, $08
	db $92, $08, $96, $08, $96, $08, $92, $08
	db $96, $08, $96, $08, $92, $08, $97, $08
	db $97, $08, $92, $08, $96, $08, $96, $08
	db $92, $08, $96, $08, $96, $08, $92, $08
	db $96, $08, $96, $08, $92, $08, $97, $08
	db $97, $08, $92, $08, $96, $08, $96, $08
	db $92, $08, $96, $08, $96, $08, $92, $08
	db $96, $08, $97, $08, $94, $08, $97, $08
	db $97, $08, $94, $08, $97, $08, $96, $08
	db $92, $08, $96, $08, $96, $08, $92, $08
	db $96, $08, $97, $08, $94, $08, $97, $08
	db $97, $08, $94, $08, $97, $08, $96, $08
	db $92, $08, $96, $08, $96, $08, $92, $08
	db $96, $08, $95, $08, $91, $08, $95, $08
	db $95, $08, $91, $08, $95, $08, $96, $08
	db $91, $08, $96, $08, $96, $08, $91, $08
	db $96, $08, $96, $08, $92, $08, $97, $08
	db $97, $08, $92, $08, $96, $08, $96, $08
	db $92, $08, $96, $08, $96, $08, $92, $08
	db $96, $08, $97, $08, $94, $08, $97, $08
	db $97, $08, $94, $08, $97, $08, $96, $08
	db $92, $08, $96, $08, $96, $08, $92, $08
	db $96, $08, $97, $08, $94, $08, $97, $08
	db $97, $08, $94, $08, $97, $08, $96, $08
	db $92, $08, $96, $08, $96, $08, $92, $08
	db $96, $08, $95, $08, $91, $08, $95, $08
	db $98, $08, $95, $08, $98, $08, $9A, $08
	db $96, $08, $9A, $08, $9A, $08, $96, $08
	db $9A, $08, $01, $14, $13, $FC, $12, $02
	db $02, $18, $28, $10, $8C, $A2, $0F, $02
	db $03, $05, $05, $97, $30, $9B, $18, $96
	db $18, $94, $30, $92, $30, $94, $30, $8F
	db $30, $8C, $30, $91, $30, $02, $32, $14
	db $14, $F4, $10, $8E, $A2, $83, $0C, $A2
	db $24, $92, $0C, $A2, $24, $83, $0C, $A2
	db $24, $8A, $0C, $A2, $24, $83, $0C, $A2
	db $24, $92, $0C, $A2, $24, $88, $0C, $A2
	db $24, $8A, $0C, $A2, $24, $00, $21, $18
	db $13, $01, $23, $02, $08, $18, $10, $8E
	db $EA, $13, $00, $12, $2A, $80, $0B, $96
	db $08, $92, $08, $96, $08, $97, $08, $92
	db $08, $96, $08, $96, $08, $92, $08, $96
	db $08, $96, $08, $92, $08, $96, $08, $96
	db $08, $92, $08, $96, $08, $97, $08, $92
	db $08, $96, $08, $96, $08, $92, $08, $96
	db $08, $96, $08, $92, $08, $96, $08, $96
	db $08, $92, $08, $96, $08, $97, $08, $92
	db $08, $96, $08, $96, $08, $92, $08, $96
	db $08, $96, $08, $92, $08, $96, $08, $97
	db $08, $94, $08, $97, $08, $97, $08, $94
	db $08, $97, $08, $96, $08, $92, $08, $96
	db $08, $96, $08, $92, $08, $96, $08, $97
	db $08, $94, $08, $97, $08, $97, $08, $94
	db $08, $97, $08, $96, $08, $92, $08, $96
	db $08, $96, $08, $92, $08, $96, $08, $95
	db $08, $91, $08, $95, $08, $95, $08, $91
	db $08, $95, $08, $96, $08, $91, $08, $96
	db $08, $96, $08, $91, $08, $96, $08, $96
	db $08, $92, $08, $97, $08, $97, $08, $92
	db $08, $96, $08, $96, $08, $92, $08, $96
	db $08, $96, $08, $92, $08, $96, $08, $97
	db $08, $94, $08, $97, $08, $97, $08, $94
	db $08, $97, $08, $96, $08, $92, $08, $96
	db $08, $96, $08, $92, $08, $96, $08, $97
	db $08, $94, $08, $97, $08, $97, $08, $94
	db $08, $97, $08, $96, $08, $92, $08, $96
	db $08, $96, $08, $92, $08, $96, $08, $95
	db $08, $91, $08, $95, $08, $98, $08, $95
	db $08, $98, $08, $9A, $08, $96, $08, $9A
	db $08, $9A, $08, $96, $08, $9A, $08, $80
	db $8D, $01, $1E, $13, $0C, $12, $B8, $10
	db $8E, $F2, $0F, $03, $01, $0B, $02, $02
	db $0F, $1E, $10, $88, $D1, $9B, $08, $9E
	db $08, $A3, $04, $A2, $04, $A3, $04, $A2
	db $04, $A3, $04, $A2, $04, $02, $0C, $1E
	db $10, $8B, $EF, $A3, $6F, $01, $23, $02
	db $11, $05, $10, $8D, $EA, $13, $00, $12
	db $2A, $80, $08, $95, $08, $96, $08, $98
	db $08, $99, $08, $9B, $10, $9D, $08, $9E
	db $08, $9D, $04, $9B, $04, $99, $04, $98
	db $01, $01, $14, $13, $FC, $12, $02, $02
	db $14, $32, $14, $F4, $10, $8E, $A2, $0F
	db $02, $03, $05, $05, $8A, $0C, $9B, $24
	db $86, $0C, $9B, $24, $8A, $0C, $9B, $24
	db $8F, $0C, $9B, $24, $8A, $0C, $9B, $24
	db $86, $0C, $9B, $24, $8F, $0C, $9B, $24
	db $8F, $0C, $9B, $24, $00, $21, $18, $13
	db $01, $14, $13, $FC, $12, $02, $02, $10
	db $10, $10, $8C, $A2, $0F, $02, $03, $05
	db $05, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $9B, $10, $9B, $08, $9B, $10, $9B
	db $08, $98, $10, $98, $08, $98, $10, $98
	db $08, $9A, $10, $9A, $08, $9A, $10, $9A
	db $08, $10, $8C, $A0, $9B, $C0, $10, $8C
	db $A0, $02, $30, $30, $94, $18, $94, $18
	db $96, $18, $96, $18, $98, $18, $9D, $18
	db $9D, $30, $01, $A3, $13, $0C, $12, $AD
	db $10, $8F, $D5, $02, $06, $12, $02, $06
	db $12, $A3, $03, $14, $0C, $02, $04, $0A
	db $A3, $05, $14, $F4, $02, $02, $06, $A3
	db $03, $14, $0C, $02, $01, $03, $A3, $05
	db $14, $F4, $80, $08, $02, $06, $12, $A2
	db $03, $14, $0C, $02, $04, $0A, $A2, $05
	db $14, $F4, $02, $02, $06, $A2, $03, $14
	db $0C, $02, $01, $03, $A2, $05, $14, $F4
	db $02, $06, $12, $A0, $03, $14, $0C, $02
	db $04, $0A, $A0, $05, $14, $F4, $02, $06
	db $12, $A2, $03, $14, $0C, $02, $04, $0A
	db $A2, $05, $14, $F4, $02, $02, $06, $A2
	db $03, $14, $0C, $02, $01, $03, $A2, $05
	db $14, $F4, $80, $08, $02, $06, $12, $9E
	db $03, $14, $0C, $02, $04, $0A, $9E, $05
	db $14, $F4, $02, $02, $06, $9E, $03, $14
	db $0C, $02, $01, $03, $9E, $05, $14, $F4
	db $80, $08, $02, $06, $12, $02, $06, $12
	db $A0, $03, $14, $0C, $02, $04, $0A, $A0
	db $05, $14, $F4, $02, $02, $06, $A0, $03
	db $14, $0C, $02, $01, $03, $A0, $05, $14
	db $F4, $80, $08, $02, $06, $12, $9E, $03
	db $14, $0C, $02, $04, $0A, $9E, $05, $14
	db $F4, $02, $02, $06, $9E, $03, $14, $0C
	db $02, $01, $03, $9E, $05, $14, $F4, $02
	db $06, $12, $9C, $03, $14, $0C, $02, $04
	db $0A, $9C, $05, $14, $F4, $02, $06, $12
	db $9B, $03, $14, $0C, $02, $04, $0A, $9B
	db $05, $14, $F4, $02, $02, $06, $9B, $03
	db $14, $0C, $02, $01, $03, $9B, $05, $14
	db $F4, $80, $20, $02, $06, $12, $9C, $03
	db $14, $0C, $02, $04, $0A, $9C, $05, $14
	db $F4, $02, $02, $06, $9C, $03, $14, $0C
	db $02, $01, $03, $9C, $05, $14, $F4, $80
	db $08, $02, $06, $12, $9B, $03, $14, $0C
	db $02, $04, $0A, $9B, $05, $14, $F4, $02
	db $02, $06, $9B, $03, $14, $0C, $02, $01
	db $03, $9B, $05, $14, $F4, $02, $06, $12
	db $99, $03, $14, $0C, $02, $04, $0A, $99
	db $05, $14, $F4, $02, $06, $12, $9B, $03
	db $14, $0C, $02, $04, $0A, $9B, $05, $14
	db $F4, $02, $02, $06, $9B, $03, $14, $0C
	db $02, $01, $03, $9B, $01, $14, $F4, $02
	db $06, $12, $97, $03, $14, $0C, $02, $04
	db $0A, $97, $05, $14, $F4, $02, $02, $06
	db $97, $03, $14, $0C, $02, $01, $03, $97
	db $01, $14, $F4, $02, $06, $12, $94, $03
	db $14, $0C, $02, $04, $0A, $94, $05, $14
	db $F4, $02, $02, $06, $94, $03, $14, $0C
	db $02, $01, $03, $94, $05, $14, $F4, $80
	db $08, $02, $06, $12, $9A, $03, $14, $0C
	db $02, $04, $0A, $9A, $05, $14, $F4, $02
	db $02, $06, $9A, $03, $14, $0C, $02, $01
	db $03, $9A, $05, $14, $F4, $80, $08, $02
	db $06, $12, $96, $03, $14, $0C, $02, $04
	db $0A, $96, $05, $14, $F4, $02, $02, $06
	db $96, $03, $14, $0C, $02, $01, $03, $96
	db $01, $14, $F4, $02, $06, $12, $98, $03
	db $14, $0C, $02, $04, $0A, $98, $05, $14
	db $F4, $02, $02, $06, $98, $03, $14, $0C
	db $02, $01, $03, $98, $01, $14, $F4, $02
	db $06, $12, $9A, $03, $14, $0C, $02, $04
	db $0A, $9A, $05, $14, $F4, $02, $02, $06
	db $9A, $03, $14, $0C, $02, $01, $03, $9A
	db $05, $14, $F4, $02, $06, $12, $9B, $03
	db $14, $0C, $02, $04, $0A, $9B, $05, $14
	db $F4, $02, $06, $12, $9D, $03, $14, $0C
	db $02, $04, $0A, $9D, $05, $14, $F4, $02
	db $02, $06, $9D, $03, $14, $0C, $02, $01
	db $03, $9D, $01, $14, $F4, $02, $06, $12
	db $9E, $03, $14, $0C, $02, $04, $0A, $9E
	db $05, $14, $F4, $02, $02, $06, $17, $9E
	db $04, $01, $A4, $02, $50, $50, $13, $00
	db $12, $AD, $10, $8F, $92, $8F, $0C, $21
	db $10, $20, $01, $A4, $02, $50, $50, $92
	db $0C, $21, $10, $20, $01, $A4, $02, $50
	db $50, $8F, $0C, $21, $3B, $20, $01, $A4
	db $02, $50, $50, $8B, $08, $8A, $0C, $21
	db $10, $20, $80, $0C, $21, $10, $20, $80
	db $0C, $21, $10, $20, $80, $0C, $21, $10
	db $20, $80, $0C, $21, $10, $20, $01, $A4
	db $02, $50, $50, $10, $8F, $E5, $80, $0C
	db $94, $0C, $96, $0C, $97, $0C, $96, $10
	db $92, $08, $8F, $18, $91, $18, $92, $0C
	db $94, $0C, $8A, $18, $10, $98, $AB, $8A
	db $04, $8A, $04, $8A, $04, $8A, $04, $8A
	db $04, $8A, $04, $8A, $04, $8A, $04, $8A
	db $04, $8A, $04, $8A, $04, $8A, $04, $8A
	db $04, $8A, $04, $00, $01, $A5, $02, $10
	db $10, $9E, $03, $02, $1A, $1A, $9E, $03
	db $02, $20, $20, $9E, $03, $02, $2A, $2A
	db $9E, $03, $02, $30, $30, $9E, $06, $02
	db $10, $10, $9E, $06, $02, $08, $08, $9E
	db $06, $02, $04, $04, $9E, $06, $05, $01
	db $A5, $02, $10, $10, $9E, $03, $02, $1A
	db $1A, $9E, $03, $02, $20, $20, $9E, $03
	db $02, $2A, $2A, $9E, $03, $02, $30, $30
	db $9E, $06, $02, $10, $10, $9E, $06, $02
	db $08, $08, $9E, $04, $05

DATA_EE2CD3:
	db $00, $13, $51, $08, $B7, $1C, $1C, $22
	db $A6, $1B, $2D, $1C, $7C, $20, $DA, $1D
	db $A2, $1A, $26, $1B, $A0, $FF, $00, $13
	db $1E, $13, $30, $13, $42, $13, $54, $13
	db $66, $13, $17, $19, $6C, $19, $55, $19
	db $9A, $19, $B1, $19, $4C, $19, $83, $19
	db $21, $19, $C0, $FF, $3F, $16, $C3, $16
	db $9F, $17, $F9, $17, $94, $16, $EA, $18
	db $BD, $18, $47, $17, $DE, $FF, $A8, $14
	db $12, $15, $5D, $15, $DB, $15, $E7, $14
	db $1B, $16, $2D, $16, $FB, $15, $C0, $FF
	db $8C, $13, $CF, $13, $E5, $13, $11, $14
	db $27, $14, $81, $14, $3D, $14, $53, $14
	db $C0, $FF, $B7, $1C, $7C, $20, $A6, $1B
	db $1C, $22, $A2, $1A, $26, $1B, $DA, $1D
	db $2D, $1C, $A0, $FF, $01, $14, $13, $F0
	db $12, $FE, $10, $8C, $E8, $05, $01, $29
	db $13, $0B, $12, $F5, $10, $DF, $90, $05
	db $21, $94, $1A, $13, $00, $12, $00, $10
	db $8F, $E0, $01, $89, $23, $46, $9E, $09
	db $17, $01, $00, $23, $3C, $97, $07, $97
	db $09, $01, $89, $23, $46, $9E, $10, $9E
	db $07, $9E, $05, $17, $01, $00, $23, $3C
	db $97, $05, $97, $06, $01, $89, $23, $46
	db $9E, $17, $23, $1E, $9E, $03, $23, $28
	db $9E, $03, $23, $32, $9E, $03, $23, $46
	db $9E, $10, $00, $01, $18, $13, $07, $12
	db $D4, $23, $5A, $10, $AF, $AE, $8C, $19
	db $8D, $17, $8F, $10, $88, $20, $88, $10
	db $00, $01, $27, $13, $F4, $12, $2E, $0F
	db $03, $02, $04, $0B, $02, $11, $21, $10
	db $8E, $E8, $16, $A0, $09, $9B, $07, $9D
	db $09, $A0, $10, $A2, $07, $A4, $05, $A7
	db $04, $A9, $06, $10, $8F, $4B, $AC, $19
	db $80, $07, $AC, $10, $00, $21, $78, $13
	db $02, $23, $19, $10, $AF, $AE, $A0, $19
	db $A0, $17, $A4, $10, $A0, $19, $80, $07
	db $A0, $10, $00, $21, $78, $13, $02, $19
	db $23, $10, $AF, $AE, $9B, $19, $9D, $17
	db $9F, $10, $9B, $19, $80, $07, $9B, $10
	db $00, $21, $78, $13, $02, $1E, $1E, $10
	db $AF, $AE, $98, $19, $99, $17, $9B, $10
	db $98, $19, $80, $07, $98, $10, $00, $01
	db $27, $13, $F4, $12, $2E, $0F, $03, $02
	db $04, $0B, $10, $8E, $E8, $02, $11, $08
	db $80, $0E, $16, $A0, $09, $9B, $07, $9D
	db $09, $A0, $10, $A2, $07, $A4, $05, $A7
	db $04, $A9, $06, $10, $8E, $4B, $AC, $19
	db $80, $07, $AC, $10, $00, $13, $08, $01
	db $88, $02, $0A, $1E, $10, $DF, $55, $9E
	db $09, $9D, $07, $9E, $09, $9D, $07, $9E
	db $09, $9D, $07, $9E, $09, $9E, $03, $9E
	db $03, $9E, $03, $9E, $09, $9D, $07, $9E
	db $10, $9E, $10, $00, $21, $94, $1A, $21
	db $78, $13, $02, $1E, $1E, $08, $00, $04
	db $08, $2B, $00, $9D, $25, $0A, $13, $00
	db $12, $1E, $10, $8F, $D2, $04, $03, $D6
	db $14, $16, $01, $A5, $23, $6C, $9E, $10
	db $17, $01, $00, $23, $50, $97, $10, $03
	db $C5, $14, $16, $01, $A5, $23, $6C, $9F
	db $08, $17, $01, $00, $23, $50, $97, $08
	db $99, $08, $05, $21, $78, $13, $02, $1E
	db $1E, $08, $00, $04, $08, $20, $00, $98
	db $25, $0A, $13, $08, $01, $88, $02, $14
	db $1E, $10, $AF, $B2, $9A, $18, $9A, $18
	db $9A, $18, $9A, $18, $10, $8F, $F8, $99
	db $08, $97, $08, $03, $0B, $15, $21, $78
	db $13, $02, $1E, $1E, $08, $00, $04, $08
	db $1F, $00, $94, $25, $0A, $01, $18, $13
	db $07, $12, $D4, $23, $50, $10, $8F, $E0
	db $06, $08, $8A, $8A, $8A, $85, $85, $88
	db $88, $8A, $87, $8A, $8B, $8C, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $85, $85, $85
	db $85, $85, $85, $85, $85, $88, $88, $88
	db $88, $8A, $8A, $8A, $8A, $03, $39, $15
	db $00, $21, $78, $13, $02, $64, $64, $09
	db $00, $04, $05, $22, $00, $91, $25, $0A
	db $01, $8F, $13, $F8, $12, $FC, $02, $32
	db $46, $21, $79, $15, $00, $10, $EF, $80
	db $80, $58, $08, $01, $02, $08, $21, $00
	db $A2, $10, $A2, $10, $A2, $0F, $08, $00
	db $01, $08, $2B, $00, $9F, $09, $0A, $9F
	db $07, $08, $00, $01, $08, $2B, $00, $9F
	db $09, $0A, $9F, $07, $08, $00, $01, $08
	db $39, $00, $A4, $09, $0A, $0F, $04, $02
	db $11, $05, $A4, $0F, $80, $01, $A4, $07
	db $08, $00, $01, $08, $39, $00, $A4, $09
	db $0A, $A4, $08, $08, $01, $02, $08, $2C
	db $00, $A7, $10, $A7, $10, $A7, $10, $10
	db $EE, $40, $A7, $10, $10, $EC, $20, $A7
	db $10, $10, $EB, $00, $A7, $10, $05, $21
	db $78, $13, $02, $0A, $0A, $08, $00, $04
	db $08, $2B, $00, $80, $05, $9D, $20, $0A
	db $01, $8F, $13, $F8, $12, $FC, $02, $1C
	db $12, $80, $0F, $21, $79, $15, $00, $21
	db $78, $13, $02, $0A, $0A, $08, $00, $04
	db $08, $20, $00, $80, $05, $98, $20, $0A
	db $01, $8F, $13, $F8, $12, $FC, $02, $08
	db $0E, $80, $1E, $21, $79, $15, $00, $21
	db $78, $13, $02, $0A, $0A, $08, $00, $04
	db $08, $1F, $00, $80, $05, $94, $30, $0A
	db $00, $21, $78, $13, $02, $28, $28, $09
	db $00, $04, $05, $22, $00, $80, $05, $91
	db $30, $0A, $00, $21, $94, $1A, $21, $78
	db $13, $02, $1E, $1E, $08, $00, $04, $08
	db $2D, $00, $9E, $20, $0A, $13, $00, $12
	db $1E, $10, $8F, $D2, $04, $0C, $5D, $16
	db $00, $17, $01, $00, $23, $50, $97, $10
	db $94, $10, $01, $89, $23, $6C, $9E, $10
	db $01, $00, $23, $50, $96, $09, $01, $89
	db $23, $26, $A5, $10, $A4, $07, $01, $00
	db $23, $50, $17, $98, $09, $01, $89, $23
	db $26, $A3, $07, $23, $6C, $9E, $10, $23
	db $26, $A4, $09, $23, $2C, $A5, $07, $05
	db $21, $78, $13, $02, $1E, $1E, $08, $00
	db $04, $08, $1D, $00, $9A, $20, $0A, $13
	db $08, $12, $00, $01, $88, $02, $14, $1E
	db $06, $10, $04, $0C, $B4, $16, $07, $00
	db $10, $8F, $F8, $99, $97, $9A, $97, $99
	db $96, $98, $10, $8F, $C5, $9A, $05, $21
	db $78, $13, $02, $1E, $1E, $08, $00, $04
	db $08, $11, $00, $97, $20, $0A, $13, $00
	db $06, $10, $04, $06, $DB, $16, $00, $21
	db $E8, $16, $21, $25, $17, $21, $E8, $16
	db $21, $36, $17, $05, $01, $05, $23, $4A
	db $10, $8F, $E0, $09, $01, $01, $0B, $0B
	db $00, $8D, $0A, $01, $07, $23, $11, $08
	db $02, $01, $16, $16, $00, $9A, $0A, $01
	db $01, $10, $8E, $EF, $88, $01, $07, $10
	db $8F, $E0, $08, $02, $01, $16, $16, $00
	db $9A, $0A, $01, $02, $23, $12, $10, $8E
	db $EF, $87, $01, $03, $10, $8F, $EF, $88
	db $05, $01, $08, $23, $12, $10, $8E, $EF
	db $8A, $01, $06, $23, $15, $10, $8E, $E0
	db $82, $05, $01, $06, $23, $15, $10, $8E
	db $E0, $82, $01, $08, $23, $12, $10, $8E
	db $EF, $8E, $05, $21, $78, $13, $02, $64
	db $64, $09, $00, $03, $05, $2B, $00, $93
	db $20, $0A, $80, $05, $13, $00, $12, $1E
	db $10, $8F, $D2, $04, $0C, $64, $17, $00
	db $17, $01, $00, $23, $1B, $97, $10, $94
	db $10, $16, $01, $89, $23, $24, $9E, $10
	db $17, $01, $00, $23, $1B, $96, $09, $16
	db $01, $89, $23, $0C, $A5, $10, $A4, $07
	db $01, $00, $23, $1B, $17, $98, $09, $16
	db $01, $89, $23, $0C, $A3, $07, $23, $24
	db $9E, $10, $23, $0C, $A4, $09, $23, $11
	db $A5, $07, $05, $21, $78, $13, $02, $0A
	db $0A, $08, $00, $04, $08, $2D, $00, $80
	db $05, $9E, $1B, $0A, $01, $18, $13, $07
	db $12, $D4, $23, $50, $10, $8F, $E0, $1C
	db $8B, $1D, $97, $04, $02, $D4, $17, $1C
	db $84, $1D, $90, $04, $02, $D4, $17, $1C
	db $8B, $1D, $97, $04, $02, $D4, $17, $00
	db $E0, $0C, $80, $04, $E0, $0C, $80, $14
	db $E0, $0C, $80, $14, $E0, $0C, $80, $24
	db $E0, $08, $E1, $08, $E0, $0C, $80, $14
	db $E0, $0C, $80, $14, $E0, $0C, $80, $04
	db $89, $10, $8A, $10, $05, $21, $78, $13
	db $02, $0A, $0A, $08, $00, $04, $08, $1D
	db $00, $80, $05, $9A, $1B, $0A, $16, $02
	db $14, $3C, $10, $8F, $E0, $80, $78, $21
	db $74, $18, $21, $52, $18, $21, $82, $13
	db $02, $14, $1E, $04, $02, $24, $18, $00
	db $10, $8E, $E0, $80, $18, $9A, $04, $9B
	db $04, $9C, $1C, $80, $04, $9A, $10, $97
	db $0C, $80, $04, $80, $18, $9A, $04, $9B
	db $04, $9C, $10, $9A, $10, $9C, $08, $9E
	db $08, $80, $08, $9A, $14, $80, $04, $99
	db $10, $97, $10, $80, $10, $05, $01, $01
	db $13, $02, $12, $F2, $95, $10, $01, $02
	db $13, $FE, $12, $18, $97, $10, $01, $03
	db $13, $FD, $12, $00, $97, $08, $95, $10
	db $01, $04, $13, $FC, $12, $FE, $97, $40
	db $01, $04, $13, $FC, $12, $FE, $97, $08
	db $01, $01, $13, $02, $12, $F2, $95, $10
	db $01, $02, $13, $FE, $12, $18, $97, $10
	db $01, $03, $13, $FD, $12, $00, $97, $08
	db $01, $01, $13, $02, $12, $F2, $99, $10
	db $01, $02, $13, $FE, $12, $18, $9A, $10
	db $01, $04, $13, $FC, $12, $FE, $9A, $08
	db $01, $03, $13, $FD, $12, $00, $99, $10
	db $01, $04, $13, $FC, $12, $FE, $97, $20
	db $05, $21, $78, $13, $02, $0A, $0A, $08
	db $00, $04, $08, $11, $00, $80, $05, $97
	db $1B, $0A, $16, $80, $07, $02, $17, $08
	db $10, $8F, $E0, $80, $78, $21, $74, $18
	db $21, $52, $18, $21, $82, $13, $02, $0B
	db $06, $04, $02, $24, $18, $00, $21, $78
	db $13, $02, $28, $28, $09, $00, $03, $05
	db $2B, $00, $80, $05, $93, $1B, $0A, $16
	db $80, $0F, $02, $04, $0B, $10, $8F, $E0
	db $80, $78, $21, $74, $18, $21, $52, $18
	db $21, $82, $13, $02, $03, $07, $04, $02
	db $24, $18, $00, $21, $94, $1A, $80, $10
	db $04, $03, $55, $1B, $00, $01, $26, $13
	db $0C, $12, $A8, $0F, $03, $02, $0E, $08
	db $02, $21, $0B, $10, $B9, $6F, $16, $9E
	db $08, $A0, $08, $A1, $18, $A0, $08, $9E
	db $10, $9C, $08, $9B, $08, $97, $10, $9A
	db $10, $9B, $10, $9C, $30, $9A, $FF, $00
	db $80, $10, $13, $F8, $04, $03, $02, $1C
	db $00, $01, $15, $13, $08, $14, $E8, $12
	db $03, $02, $1E, $14, $10, $CA, $AB, $80
	db $10, $A1, $20, $A1, $80, $9A, $D0, $00
	db $01, $15, $13, $08, $14, $E8, $12, $03
	db $02, $14, $1E, $10, $CA, $AB, $80, $10
	db $9E, $20, $9E, $80, $97, $D0, $00, $01
	db $26, $13, $0C, $12, $A8, $0F, $03, $02
	db $0E, $08, $02, $05, $0E, $10, $B9, $6F
	db $80, $0E, $03, $32, $19, $00, $01, $15
	db $13, $08, $14, $E8, $12, $03, $02, $14
	db $1E, $10, $CA, $AB, $80, $10, $9B, $20
	db $9B, $80, $A0, $D0, $00, $1C, $8B, $04
	db $01, $B5, $22, $06, $08, $01, $28, $13
	db $EB, $12, $F2, $02, $28, $28, $10, $9F
	db $B0, $8B, $01, $2A, $13, $FC, $12, $F2
	db $02, $28, $28, $10, $DF, $90, $8B, $01
	db $2C, $13, $FC, $12, $F8, $02, $28, $28
	db $10, $DF, $85, $8E, $01, $8B, $13, $FC
	db $12, $F2, $02, $28, $28, $10, $DF, $90
	db $8E, $01, $29, $13, $F3, $12, $F5, $02
	db $28, $28, $10, $DF, $90, $8F, $01, $50
	db $13, $EF, $12, $2E, $02, $46, $46, $10
	db $DE, $90, $8F, $01, $2A, $13, $FC, $12
	db $F2, $02, $28, $28, $10, $DF, $90, $90
	db $01, $2C, $13, $FC, $12, $F8, $02, $32
	db $32, $10, $AF, $85, $90, $01, $28, $13
	db $EB, $12, $F2, $02, $28, $28, $10, $9F
	db $B0, $90, $01, $2A, $13, $FC, $12, $F2
	db $02, $28, $28, $10, $DF, $90, $90, $01
	db $2C, $13, $FC, $12, $F8, $02, $28, $28
	db $10, $DF, $85, $90, $01, $8B, $13, $FC
	db $12, $F2, $02, $28, $28, $10, $DF, $90
	db $90, $01, $29, $13, $F3, $12, $F5, $02
	db $28, $28, $10, $DF, $90, $90, $01, $50
	db $13, $EF, $12, $2E, $02, $46, $46, $10
	db $DE, $90, $90, $01, $2A, $13, $FC, $12
	db $F2, $02, $28, $28, $10, $DF, $90, $84
	db $01, $2C, $13, $FC, $12, $F8, $02, $32
	db $32, $10, $AF, $85, $84, $07, $1C, $84
	db $04, $03, $B5, $22, $00, $80, $10, $05
	db $15, $32, $21, $21, $18, $77, $08, $08
	db $20, $00, $00, $00, $00, $05, $21, $91
	db $1A, $17, $01, $17, $13, $0F, $12, $E9
	db $02, $05, $05, $08, $02, $03, $17, $6F
	db $05, $10, $FC, $F4, $04, $24, $14, $1B
	db $0A, $16, $01, $14, $13, $FC, $12, $02
	db $10, $88, $E5, $14, $F4, $80, $80, $80
	db $80, $02, $05, $0A, $04, $06, $08, $1B
	db $04, $02, $FC, $1A, $04, $04, $08, $1B
	db $80, $80, $80, $80, $17, $01, $17, $13
	db $0F, $12, $E9, $02, $05, $05, $08, $02
	db $03, $17, $6F, $05, $10, $FC, $F4, $04
	db $18, $14, $1B, $0A, $03, $BC, $1A, $00
	db $06, $10, $9E, $A2, $A4, $A5, $A4, $A2
	db $9D, $9E, $07, $05, $06, $10, $9D, $A2
	db $A4, $A5, $A4, $A2, $9D, $9E, $07, $05
	db $10, $FC, $F4, $99, $10, $9A, $06, $80
	db $0A, $99, $06, $80, $0A, $99, $06, $80
	db $0A, $05, $21, $91, $1A, $02, $20, $20
	db $01, $88, $13, $10, $08, $02, $03, $17
	db $6F, $01, $04, $12, $8D, $1B, $0A, $04
	db $0C, $55, $1B, $80, $80, $80, $80, $80
	db $80, $80, $80, $08, $02, $03, $17, $6F
	db $01, $04, $0C, $8D, $1B, $03, $3A, $1B
	db $00, $02, $20, $20, $01, $88, $13, $10
	db $10, $DE, $92, $9A, $10, $10, $FE, $5B
	db $9A, $20, $9A, $10, $01, $17, $13, $0F
	db $12, $E9, $02, $05, $05, $10, $FC, $F4
	db $99, $10, $02, $20, $20, $01, $88, $13
	db $10, $10, $FE, $5B, $9A, $10, $10, $DE
	db $92, $9A, $10, $10, $FE, $5B, $9A, $10
	db $05, $10, $DE, $92, $9A, $10, $10, $FE
	db $5B, $9A, $20, $9A, $20, $9A, $10, $10
	db $DE, $92, $9A, $10, $10, $FE, $5B, $9A
	db $10, $05, $21, $91, $1A, $13, $F8, $04
	db $12, $02, $1C, $04, $0C, $C3, $1B, $80
	db $80, $80, $80, $80, $80, $80, $80, $04
	db $0C, $02, $1C, $03, $AF, $1B, $00, $01
	db $00, $02, $40, $40, $10, $AF, $FC, $99
	db $10, $01, $8B, $02, $2C, $2C, $10, $FF
	db $59, $99, $10, $01, $89, $02, $60, $60
	db $10, $AF, $FC, $99, $10, $01, $8B, $02
	db $2C, $2C, $10, $FF, $59, $99, $20, $99
	db $10, $01, $89, $02, $60, $60, $10, $AF
	db $FC, $99, $10, $01, $00, $02, $40, $40
	db $10, $AF, $FC, $96, $10, $05, $80, $10
	db $01, $8B, $02, $2C, $2C, $10, $FF, $59
	db $99, $10, $01, $00, $02, $40, $40, $10
	db $AF, $FC, $99, $10, $01, $8B, $02, $2C
	db $2C, $10, $FF, $59, $99, $30, $01, $00
	db $02, $40, $40, $10, $AF, $FC, $99, $20
	db $05, $21, $91, $1A, $01, $15, $13, $FC
	db $14, $E8, $12, $03, $02, $40, $40, $10
	db $CC, $A8, $2B, $80, $04, $00, $2C, $8A
	db $60, $8A, $20, $8A, $60, $88, $20, $8A
	db $60, $8A, $20, $8A, $60, $8C, $20, $8D
	db $60, $8D, $20, $8D, $60, $8D, $20, $8F
	db $60, $8F, $20, $8F, $50, $91, $30, $92
	db $60, $92, $20, $92, $60, $94, $20, $8A
	db $60, $8A, $20, $8A, $60, $88, $20, $8A
	db $60, $8A, $20, $8A, $60, $88, $20, $8A
	db $60, $8A, $20, $8A, $60, $8C, $20, $8D
	db $60, $8D, $20, $8D, $60, $8D, $20, $8F
	db $60, $8F, $20, $8F, $60, $91, $20, $92
	db $60, $92, $20, $92, $60, $94, $20, $8A
	db $60, $8A, $20, $8A, $60, $88, $20, $8A
	db $60, $8A, $20, $8A, $60, $88, $20, $8A
	db $60, $8A, $20, $8A, $60, $88, $20, $03
	db $43, $1C, $00, $1F, $04, $21, $91, $1A
	db $21, $94, $1A, $16, $01, $15, $13, $FC
	db $12, $03, $02, $05, $08, $10, $AE, $A4
	db $0F, $02, $02, $08, $08, $2B, $80, $05
	db $00, $2C, $04, $02, $0D, $22, $04, $02
	db $FE, $21, $04, $01, $E1, $21, $04, $01
	db $D6, $21, $04, $01, $D2, $21, $17, $01
	db $22, $02, $18, $0A, $13, $05, $12, $B6
	db $10, $8F, $E5, $14, $F4, $80, $80, $80
	db $80, $04, $06, $81, $21, $04, $02, $30
	db $21, $04, $04, $81, $21, $16, $01, $15
	db $13, $FC, $12, $03, $02, $05, $08, $10
	db $AE, $A4, $0F, $02, $02, $08, $08, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $80, $03, $D6, $1C, $00, $01
	db $09, $13, $00, $12, $00, $02, $50, $20
	db $10, $8E, $F2, $02, $50, $20, $8C, $02
	db $8C, $02, $8C, $02, $8D, $03, $8E, $03
	db $8F, $03, $90, $05, $90, $05, $90, $05
	db $80, $20, $02, $50, $50, $90, $02, $90
	db $02, $90, $02, $95, $03, $96, $03, $97
	db $05, $97, $05, $98, $05, $80, $10, $01
	db $17, $13, $F8, $12, $00, $17, $10, $8F
	db $F2, $08, $03, $02, $60, $7F, $00, $02
	db $20, $20, $81, $08, $02, $0A, $0A, $81
	db $08, $0A, $16, $01, $09, $13, $00, $12
	db $00, $02, $30, $60, $8C, $02, $8C, $02
	db $8C, $02, $8D, $03, $8E, $03, $8F, $03
	db $90, $05, $90, $05, $90, $04, $02, $20
	db $70, $8C, $02, $8C, $02, $8C, $02, $8D
	db $03, $8E, $03, $8F, $03, $90, $05, $90
	db $05, $90, $05, $80, $38, $01, $17, $13
	db $0C, $12, $E9, $02, $12, $18, $10, $FF
	db $F4, $08, $01, $03, $17, $6F, $02, $81
	db $0A, $01, $0C, $13, $00, $12, $00, $02
	db $40, $08, $10, $9F, $EF, $A0, $02, $A1
	db $02, $A3, $02, $A4, $02, $05, $21, $91
	db $1A, $16, $01, $25, $10, $FB, $28, $26
	db $00, $01, $21, $4E, $02, $00, $02, $12
	db $00, $B6, $0A, $B6, $12, $02, $03, $01
	db $12, $E4, $B6, $0A, $B6, $1A, $04, $07
	db $57, $20, $02, $01, $04, $12, $00, $B6
	db $0A, $B6, $1A, $02, $03, $01, $12, $E4
	db $B6, $0A, $B6, $1A, $02, $01, $02, $12
	db $FC, $B6, $0A, $B6, $1A, $02, $01, $00
	db $12, $0B, $B6, $0A, $B6, $1A, $0A, $80
	db $40, $01, $29, $13, $0B, $12, $F5, $10
	db $DF, $6F, $04, $02, $16, $20, $1C, $96
	db $04, $01, $D5, $1F, $1C, $9D, $04, $01
	db $D5, $1F, $04, $01, $57, $1F, $04, $01
	db $2A, $1F, $04, $01, $16, $1F, $80, $80
	db $80, $80, $80, $80, $80, $80, $01, $26
	db $13, $0C, $12, $A8, $10, $E9, $4F, $0F
	db $03, $02, $0E, $08, $02, $16, $0E, $04
	db $01, $03, $1F, $02, $09, $10, $9B, $08
	db $9D, $18, $02, $08, $04, $9B, $08, $9D
	db $18, $02, $02, $04, $9B, $08, $9D, $18
	db $02, $16, $0E, $04, $01, $EC, $1E, $01
	db $27, $13, $F4, $12, $2E, $0F, $03, $02
	db $04, $0B, $10, $A8, $AF, $02, $0F, $08
	db $04, $01, $CD, $1E, $01, $1C, $13, $02
	db $12, $30, $02, $08, $12, $10, $8F, $AB
	db $04, $01, $B8, $1E, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $03, $25, $1E, $00, $A2, $08, $A4, $08
	db $A5, $10, $A5, $08, $A7, $08, $A9, $10
	db $A9, $20, $A7, $10, $A9, $90, $80, $80
	db $05, $AA, $10, $A9, $08, $A7, $18, $A5
	db $08, $A2, $28, $80, $10, $A7, $08, $A9
	db $08, $AA, $10, $A9, $08, $A7, $18, $A5
	db $20, $AC, $10, $A5, $10, $A5, $90, $05
	db $9D, $10, $A2, $08, $A0, $18, $A2, $08
	db $9D, $58, $A2, $08, $A0, $18, $A2, $08
	db $A5, $18, $A4, $08, $A2, $28, $05, $9D
	db $10, $A2, $08, $A0, $18, $A2, $08, $9D
	db $38, $9B, $08, $99, $08, $9B, $08, $9D
	db $18, $05, $02, $06, $0E, $98, $08, $02
	db $05, $02, $96, $08, $02, $06, $0E, $99
	db $08, $02, $05, $02, $98, $08, $02, $06
	db $0E, $94, $08, $02, $05, $02, $99, $08
	db $02, $06, $0E, $98, $08, $02, $05, $02
	db $94, $10, $98, $08, $02, $06, $0E, $99
	db $10, $91, $08, $02, $05, $02, $99, $08
	db $02, $06, $0E, $96, $08, $02, $05, $02
	db $91, $08, $05, $02, $06, $0E, $9E, $08
	db $02, $05, $02, $9D, $08, $02, $06, $0E
	db $9D, $08, $02, $05, $02, $9E, $08, $02
	db $06, $0E, $9B, $08, $02, $05, $02, $9D
	db $08, $02, $06, $0E, $99, $08, $02, $05
	db $02, $9B, $08, $02, $06, $0E, $96, $08
	db $02, $05, $02, $99, $10, $96, $18, $02
	db $06, $0E, $9B, $08, $9D, $08, $02, $06
	db $0E, $9E, $08, $02, $05, $02, $9B, $08
	db $02, $06, $0E, $9D, $08, $02, $05, $02
	db $9E, $08, $02, $06, $0E, $9B, $08, $02
	db $05, $02, $9D, $08, $02, $06, $0E, $99
	db $08, $02, $05, $02, $9B, $10, $99, $08
	db $02, $06, $0E, $A0, $10, $99, $08, $02
	db $05, $02, $A0, $08, $02, $06, $0E, $99
	db $08, $02, $05, $02, $99, $08, $99, $20
	db $05, $02, $06, $0E, $98, $08, $02, $05
	db $02, $E0, $08, $02, $06, $0E, $99, $08
	db $02, $05, $02, $98, $08, $02, $06, $0E
	db $A2, $08, $02, $05, $02, $99, $08, $02
	db $06, $0E, $9D, $08, $02, $05, $02, $A2
	db $10, $9D, $08, $02, $06, $0E, $A0, $10
	db $9B, $08, $02, $05, $02, $A0, $08, $02
	db $06, $0E, $9D, $08, $02, $05, $02, $9B
	db $08, $05, $02, $06, $0E, $98, $08, $02
	db $05, $02, $96, $08, $02, $06, $0E, $99
	db $08, $02, $05, $02, $98, $08, $02, $06
	db $0E, $A0, $08, $02, $05, $02, $99, $08
	db $02, $06, $0E, $98, $08, $02, $05, $02
	db $A0, $10, $98, $08, $02, $06, $0E, $99
	db $10, $91, $08, $02, $05, $02, $99, $08
	db $02, $06, $0E, $96, $08, $02, $05, $02
	db $91, $08, $05, $02, $00, $05, $12, $00
	db $B6, $0A, $B6, $1A, $02, $04, $01, $12
	db $E4, $B6, $0A, $B6, $1A, $02, $01, $04
	db $12, $FC, $B6, $0A, $B6, $1A, $02, $05
	db $00, $12, $0B, $B6, $0A, $B6, $1A, $05
	db $21, $91, $1A, $80, $80, $16, $04, $0A
	db $2B, $1D, $0A, $80, $14, $80, $80, $80
	db $14, $01, $26, $13, $0C, $12, $A8, $10
	db $E6, $48, $0F, $04, $01, $0F, $08, $02
	db $04, $08, $04, $01, $03, $1F, $02, $08
	db $06, $9B, $08, $9D, $18, $02, $03, $05
	db $9B, $08, $9D, $18, $02, $03, $01, $9B
	db $08, $9D, $18, $02, $04, $08, $04, $01
	db $EC, $1E, $01, $27, $13, $F4, $12, $2E
	db $0F, $03, $02, $04, $0B, $10, $A6, $A8
	db $02, $03, $07, $04, $01, $CD, $1E, $01
	db $1C, $13, $02, $12, $30, $02, $06, $03
	db $10, $8F, $A8, $04, $01, $B8, $1E, $80
	db $80, $80, $80, $80, $80, $80, $6C, $17
	db $04, $01, $A4, $22, $1C, $8A, $04, $03
	db $B5, $22, $04, $01, $BE, $22, $1C, $8C
	db $04, $01, $F5, $22, $1C, $8D, $04, $04
	db $B5, $22, $1C, $8F, $04, $03, $B5, $22
	db $04, $01, $BE, $22, $1C, $91, $04, $01
	db $F5, $22, $1C, $92, $04, $03, $B5, $22
	db $04, $01, $BE, $22, $1C, $94, $04, $01
	db $F5, $22, $1C, $8A, $04, $02, $A4, $22
	db $03, $8B, $20, $00, $02, $0B, $06, $9E
	db $08, $02, $02, $07, $9E, $08, $02, $0B
	db $06, $A2, $08, $02, $02, $07, $9E, $08
	db $02, $0B, $06, $A4, $08, $02, $02, $07
	db $A2, $08, $02, $0B, $06, $A5, $08, $02
	db $02, $07, $A4, $08, $02, $0B, $06, $A4
	db $08, $02, $02, $07, $A5, $08, $02, $0B
	db $06, $A2, $08, $02, $02, $07, $A4, $08
	db $02, $0B, $06, $9D, $08, $02, $02, $07
	db $A2, $08, $02, $0B, $06, $9E, $08, $02
	db $02, $07, $9D, $08, $05, $02, $0B, $06
	db $9D, $08, $02, $02, $07, $9E, $08, $02
	db $0B, $06, $A2, $08, $02, $02, $07, $9D
	db $08, $02, $0B, $06, $A4, $08, $02, $02
	db $07, $A2, $08, $02, $0B, $06, $A5, $08
	db $02, $02, $07, $A4, $08, $02, $0B, $06
	db $A4, $08, $02, $02, $07, $A5, $08, $02
	db $0B, $06, $A2, $08, $02, $02, $07, $A4
	db $08, $02, $0B, $06, $9D, $08, $02, $02
	db $07, $A2, $08, $02, $0B, $06, $9E, $08
	db $02, $02, $07, $9D, $08, $05, $98, $10
	db $99, $10, $94, $10, $98, $20, $99, $10
	db $91, $10, $96, $10, $05, $9E, $10, $9D
	db $10, $9B, $10, $99, $10, $96, $30, $9B
	db $08, $9D, $08, $9E, $10, $9D, $10, $9B
	db $10, $99, $20, $A0, $10, $99, $10, $99
	db $30, $05, $98, $10, $99, $10, $A2, $10
	db $9D, $20, $A0, $10, $9B, $10, $9D, $10
	db $05, $98, $10, $99, $10, $A0, $10, $98
	db $20, $99, $10, $91, $10, $96, $10, $05
	db $21, $91, $1A, $2B, $80, $04, $00, $2C
	db $01, $2B, $13, $E0, $12, $1B, $02, $28
	db $28, $10, $9F, $EA, $8A, $60, $8A, $20
	db $8A, $60, $88, $20, $8A, $60, $8A, $20
	db $8A, $60, $8C, $20, $02, $1E, $1E, $8D
	db $60, $8D, $20, $8D, $80, $16, $01, $29
	db $13, $0B, $12, $F5, $10, $DF, $6F, $04
	db $01, $2B, $23, $80, $80, $80, $70, $17
	db $04, $02, $A4, $22, $1C, $8A, $04, $03
	db $B5, $22, $04, $01, $BE, $22, $1C, $8C
	db $04, $01, $F5, $22, $1C, $8D, $04, $04
	db $B5, $22, $1C, $8F, $04, $03, $B5, $22
	db $04, $01, $BE, $22, $1C, $91, $04, $01
	db $F5, $22, $1C, $92, $04, $03, $B5, $22
	db $04, $01, $BE, $22, $1C, $94, $04, $01
	db $F5, $22, $1C, $8A, $04, $02, $A4, $22
	db $04, $01, $A4, $22, $03, $24, $22, $00
	db $1C, $8A, $04, $03, $B5, $22, $04, $01
	db $BE, $22, $1C, $88, $04, $01, $F5, $22
	db $05, $04, $01, $BE, $22, $04, $01, $F5
	db $22, $05, $06, $08, $01, $28, $13, $EB
	db $12, $F2, $02, $28, $28, $10, $9F, $B0
	db $E0, $01, $2A, $13, $FC, $12, $F2, $02
	db $28, $28, $10, $DF, $90, $E0, $01, $2C
	db $13, $FC, $12, $F8, $02, $28, $28, $10
	db $DF, $85, $E0, $01, $8B, $13, $FC, $12
	db $F2, $02, $28, $28, $10, $DF, $90, $E0
	db $05, $01, $29, $13, $F3, $12, $F5, $02
	db $28, $28, $10, $DF, $90, $E0, $01, $50
	db $13, $EF, $12, $2E, $02, $46, $46, $10
	db $DE, $90, $E0, $01, $2A, $13, $FC, $12
	db $F2, $02, $28, $28, $10, $DF, $90, $E0
	db $01, $2C, $13, $FC, $12, $F8, $02, $32
	db $32, $10, $AF, $85, $E0, $07, $05, $02
	db $06, $0E, $96, $10, $94, $08, $02, $05
	db $02, $96, $08, $02, $06, $0E, $92, $08
	db $02, $05, $02, $94, $08, $02, $06, $0E
	db $91, $08, $02, $05, $02, $92, $08, $02
	db $06, $0E, $92, $08, $02, $05, $02, $91
	db $10, $92, $18, $02, $06, $0E, $92, $08
	db $94, $08, $02, $06, $0E, $96, $08, $02
	db $05, $02, $92, $08, $02, $06, $0E, $94
	db $08, $02, $05, $02, $96, $08, $02, $06
	db $0E, $92, $08, $02, $05, $02, $94, $08
	db $02, $06, $0E, $91, $08, $02, $05, $02
	db $92, $10, $91, $08, $02, $06, $0E, $99
	db $10, $94, $08, $02, $05, $02, $99, $08
	db $02, $06, $0E, $96, $08, $02, $05, $02
	db $94, $08, $96, $10, $05

DATA_EE3D78:
	db $00, $13, $52, $02, $3E, $13, $B4, $14
	db $0B, $14, $C0, $16, $15, $16, $61, $17
	db $75, $15, $C4, $13, $B0, $FF, $00, $13
	db $15, $37, $20, $20, $18, $7F, $01, $00
	db $00, $00, $00, $00, $00, $16, $13, $F9
	db $12, $00, $02, $7F, $7F, $10, $8F, $E0
	db $81, $0C, $88, $0A, $81, $0C, $88, $0A
	db $81, $0C, $88, $0A, $81, $0C, $88, $0A
	db $00, $00, $1F, $08, $80, $10, $15, $37
	db $20, $20, $18, $7F, $01, $00, $00, $00
	db $00, $00, $00, $01, $8C, $02, $20, $20
	db $16, $10, $CF, $96, $80, $06, $91, $02
	db $92, $03, $91, $05, $8F, $06, $17, $01
	db $00, $02, $50, $50, $10, $CF, $96, $8E
	db $0A, $16, $01, $19, $02, $24, $10, $10
	db $CF, $96, $90, $10, $90, $06, $01, $A5
	db $02, $3A, $40, $10, $AF, $EB, $99, $10
	db $01, $19, $02, $1C, $18, $10, $CF, $96
	db $95, $0A, $95, $06, $17, $01, $00, $02
	db $50, $50, $10, $CF, $96, $8E, $0A, $16
	db $01, $19, $02, $0C, $28, $10, $DF, $99
	db $A4, $10, $A4, $06, $01, $A5, $02, $3A
	db $40, $10, $AF, $EB, $99, $10, $01, $19
	db $02, $24, $10, $10, $CF, $96, $95, $05
	db $95, $05, $95, $06, $17, $03, $63, $13
	db $80, $10, $80, $16, $01, $8D, $02, $30
	db $1A, $13, $00, $04, $20, $FB, $13, $01
	db $14, $13, $FC, $12, $02, $02, $1C, $0A
	db $10, $9B, $A8, $93, $E0, $01, $A2, $13
	db $08, $12, $F6, $10, $DE, $51, $02, $18
	db $20, $93, $08, $80, $02, $93, $0D, $02
	db $0A, $08, $93, $09, $03, $C8, $13, $10
	db $FF, $4B, $98, $10, $10, $FE, $4B, $98
	db $0A, $10, $FF, $4E, $98, $06, $05, $80
	db $10, $80, $16, $01, $18, $13, $07, $12
	db $D4, $02, $50, $50, $04, $02, $75, $14
	db $04, $02, $49, $14, $87, $10, $87, $10
	db $87, $10, $87, $10, $87, $10, $87, $10
	db $87, $10, $87, $10, $87, $10, $87, $10
	db $87, $10, $87, $10, $87, $10, $87, $0A
	db $87, $06, $8C, $08, $80, $02, $8C, $06
	db $80, $10, $03, $18, $14, $10, $DF, $88
	db $8E, $10, $8E, $10, $8E, $10, $8E, $0A
	db $8E, $06, $8E, $10, $8E, $10, $8E, $10
	db $8E, $0A, $8E, $06, $8E, $10, $8E, $10
	db $8E, $10, $8E, $0A, $8E, $06, $8A, $10
	db $8A, $10, $89, $10, $89, $0A, $8D, $06
	db $05, $10, $DF, $E2, $89, $10, $89, $10
	db $89, $0A, $89, $06, $87, $0A, $88, $06
	db $10, $DF, $E2, $89, $10, $89, $10, $89
	db $0A, $89, $06, $10, $FF, $50, $93, $05
	db $94, $05, $95, $06, $10, $DF, $E2, $89
	db $10, $89, $10, $89, $10, $89, $0A, $89
	db $10, $89, $06, $89, $10, $89, $0A, $89
	db $06, $86, $05, $87, $05, $88, $06, $05
	db $80, $10, $80, $16, $01, $A2, $13, $08
	db $12, $F6, $02, $18, $20, $10, $DE, $51
	db $04, $02, $26, $15, $13, $FC, $04, $02
	db $F6, $14, $01, $14, $13, $FC, $12, $02
	db $02, $0A, $1C, $10, $9B, $A8, $9D, $E0
	db $01, $A2, $13, $08, $12, $F6, $10, $DE
	db $51, $02, $18, $20, $9D, $08, $80, $02
	db $9D, $0D, $02, $0A, $08, $9D, $09, $03
	db $B8, $14, $04, $03, $12, $15, $21, $05
	db $15, $14, $FF, $21, $05, $15, $14, $01
	db $05, $80, $0A, $02, $18, $20, $9D, $0D
	db $02, $0A, $08, $9D, $09, $05, $02, $18
	db $20, $9D, $18, $80, $02, $9D, $0D, $02
	db $0A, $08, $9D, $0D, $02, $04, $06, $9D
	db $0C, $05, $02, $18, $20, $80, $0A, $99
	db $14, $80, $02, $9A, $0C, $02, $0A, $08
	db $9A, $0C, $02, $04, $06, $9A, $08, $02
	db $18, $20, $80, $0A, $99, $14, $80, $02
	db $9A, $0C, $02, $0A, $08, $9A, $0C, $02
	db $04, $06, $9A, $08, $80, $0A, $02, $18
	db $20, $99, $14, $80, $02, $9A, $0D, $02
	db $0A, $08, $9A, $0D, $02, $18, $20, $9C
	db $14, $80, $02, $9A, $0E, $80, $02, $99
	db $0A, $9A, $0C, $02, $0A, $08, $9A, $0A
	db $05, $80, $10, $80, $16, $01, $A2, $13
	db $08, $12, $F6, $02, $18, $20, $10, $DE
	db $51, $04, $02, $C6, $15, $04, $02, $B5
	db $15, $01, $14, $13, $FC, $12, $02, $02
	db $1C, $0A, $10, $9B, $A8, $9A, $E0, $01
	db $A2, $13, $08, $12, $F6, $10, $DE, $51
	db $02, $18, $20, $9A, $08, $80, $02, $9A
	db $0D, $02, $0A, $08, $9A, $09, $03, $79
	db $15, $14, $FD, $04, $03, $12, $15, $21
	db $05, $15, $14, $FE, $21, $05, $15, $14
	db $05, $05, $02, $18, $20, $80, $0A, $93
	db $14, $80, $02, $93, $0C, $02, $0A, $08
	db $93, $0C, $02, $04, $06, $93, $08, $02
	db $18, $20, $80, $0A, $93, $14, $80, $02
	db $93, $0C, $02, $0A, $08, $93, $0C, $02
	db $04, $06, $93, $08, $80, $0A, $02, $18
	db $20, $93, $14, $80, $02, $93, $0D, $02
	db $0A, $08, $93, $0D, $02, $18, $20, $99
	db $14, $80, $02, $97, $0E, $80, $02, $95
	db $0A, $97, $0C, $02, $0A, $08, $97, $0A
	db $05, $80, $10, $80, $16, $01, $A2, $13
	db $08, $12, $F6, $02, $18, $20, $10, $DE
	db $51, $04, $02, $71, $16, $04, $02, $55
	db $16, $01, $14, $13, $FC, $12, $02, $02
	db $0A, $1C, $10, $9B, $A8, $96, $E0, $01
	db $A2, $13, $08, $12, $F6, $10, $DE, $51
	db $02, $18, $20, $96, $08, $80, $02, $96
	db $0D, $02, $0A, $08, $96, $09, $03, $19
	db $16, $14, $F8, $21, $12, $15, $14, $01
	db $21, $12, $15, $14, $01, $21, $12, $15
	db $14, $FE, $21, $05, $15, $14, $FE, $21
	db $05, $15, $14, $0A, $05, $02, $18, $20
	db $80, $0A, $90, $14, $80, $02, $90, $0C
	db $02, $0A, $08, $90, $0C, $02, $04, $06
	db $90, $08, $02, $18, $20, $80, $0A, $90
	db $14, $80, $02, $90, $0C, $02, $0A, $08
	db $90, $0C, $02, $04, $06, $90, $08, $80
	db $0A, $02, $18, $20, $90, $14, $80, $02
	db $90, $0D, $02, $0A, $08, $90, $0D, $02
	db $18, $20, $93, $14, $80, $02, $93, $0E
	db $80, $02, $93, $0A, $93, $0C, $02, $0A
	db $08, $93, $0A, $05, $80, $10, $01, $1B
	db $13, $FC, $12, $02, $02, $60, $30, $10
	db $EF, $21, $93, $06, $99, $0A, $9A, $06
	db $21, $32, $17, $95, $0A, $97, $06, $99
	db $0A, $9A, $06, $21, $32, $17, $8D, $0A
	db $8E, $06, $90, $0A, $80, $06, $01, $8E
	db $13, $01, $12, $F2, $10, $9F, $91, $02
	db $1E, $18, $04, $02, $0B, $17, $21, $00
	db $17, $03, $C2, $16, $9D, $30, $9C, $10
	db $9A, $30, $98, $10, $96, $6A, $05, $80
	db $10, $9A, $10, $9D, $0A, $9A, $16, $9D
	db $10, $9A, $0A, $9D, $16, $9D, $0A, $9D
	db $06, $80, $10, $9A, $10, $9D, $0A, $9A
	db $10, $9D, $10, $9D, $06, $9F, $0A, $A1
	db $06, $9F, $0A, $9C, $16, $05, $99, $0A
	db $95, $0E, $80, $02, $93, $10, $80, $06
	db $99, $0A, $9A, $06, $99, $0A, $95, $0E
	db $80, $02, $93, $10, $93, $06, $99, $0A
	db $9A, $06, $99, $0A, $95, $0E, $80, $02
	db $93, $10, $93, $06, $97, $0A, $95, $10
	db $90, $10, $90, $06, $05, $80, $10, $80
	db $0A, $01, $1B, $13, $FC, $12, $02, $02
	db $20, $3A, $10, $EF, $20, $93, $06, $99
	db $0A, $9A, $06, $21, $32, $17, $95, $0A
	db $97, $06, $99, $0A, $9A, $06, $21, $32
	db $17, $8D, $0A, $8E, $06, $90, $0A, $80
	db $06, $01, $8E, $13, $01, $12, $F2, $10
	db $9F, $8A, $02, $06, $0C, $04, $02, $0B
	db $17, $21, $00, $17, $03, $65, $17

DATA_EE421F:
	db $00, $13, $6D, $08, $55, $1A, $C5, $1B
	db $B2, $1C, $A1, $20, $F0, $1D, $DD, $22
	db $8A, $1E, $24, $1F, $A5, $FF, $00, $13
	db $1C, $13, $2E, $13, $40, $13, $52, $13
	db $0B, $19, $1D, $1A, $A1, $19, $2E, $1A
	db $91, $19, $40, $1A, $D8, $19, $0B, $1A
	db $C0, $FF, $24, $16, $B6, $16, $92, $17
	db $ED, $17, $87, $16, $DE, $18, $B1, $18
	db $3A, $17, $DE, $FF, $82, $14, $F6, $14
	db $42, $15, $C0, $15, $CB, $14, $00, $16
	db $12, $16, $E0, $15, $C0, $FF, $6E, $13
	db $BB, $13, $D2, $13, $08, $14, $1E, $14
	db $59, $14, $34, $14, $4A, $14, $C0, $FF
	db $01, $14, $13, $F0, $12, $FE, $10, $8C
	db $E8, $05, $15, $37, $20, $20, $18, $7F
	db $0A, $00, $00, $00, $00, $00, $00, $13
	db $00, $12, $00, $10, $8F, $E0, $01, $A5
	db $23, $46, $9E, $09, $17, $01, $00, $23
	db $3C, $97, $07, $97, $09, $01, $A5, $23
	db $46, $9E, $10, $9E, $07, $9E, $05, $17
	db $01, $00, $23, $3C, $97, $05, $97, $06
	db $01, $A5, $23, $46, $9E, $17, $23, $1E
	db $9E, $03, $23, $28, $9E, $03, $23, $32
	db $9E, $03, $23, $46, $9E, $10, $00, $01
	db $14, $13, $E4, $12, $02, $02, $7A, $7A
	db $10, $CE, $AF, $8C, $19, $8D, $17, $8F
	db $10, $88, $20, $88, $10, $00, $13, $05
	db $12, $EC, $10, $8D, $E0, $02, $20, $10
	db $16, $01, $49, $A0, $09, $01, $4B, $9B
	db $07, $01, $4C, $9D, $09, $01, $4B, $A0
	db $10, $01, $4A, $A2, $07, $01, $49, $A4
	db $05, $01, $48, $A7, $04, $01, $47, $A9
	db $06, $01, $3F, $AC, $19, $80, $07, $01
	db $43, $AC, $10, $00, $21, $64, $13, $02
	db $28, $1E, $10, $AF, $AE, $A0, $19, $A0
	db $17, $A4, $10, $A0, $19, $80, $07, $A0
	db $10, $00, $21, $64, $13, $02, $1E, $28
	db $10, $AF, $AE, $9B, $19, $9D, $17, $9F
	db $10, $9B, $19, $80, $07, $9B, $10, $00
	db $21, $64, $13, $02, $23, $23, $10, $AF
	db $AE, $98, $19, $99, $17, $9B, $10, $98
	db $19, $80, $07, $98, $10, $00, $80, $14
	db $13, $05, $12, $EC, $10, $8D, $E0, $02
	db $06, $0B, $03, $DC, $13, $13, $00, $12
	db $00, $01, $2E, $02, $0A, $1E, $10, $DF
	db $55, $9E, $09, $9D, $07, $9E, $09, $9D
	db $07, $9E, $09, $9D, $07, $9E, $09, $9E
	db $03, $9E, $03, $9E, $03, $9E, $09, $9D
	db $07, $9E, $10, $9E, $10, $00, $15, $2C
	db $17, $17, $18, $7F, $01, $00, $00, $00
	db $00, $00, $00, $21, $64, $13, $02, $1E
	db $1E, $08, $00, $04, $08, $2B, $00, $9D
	db $25, $0A, $13, $00, $12, $1E, $10, $8F
	db $D2, $04, $03, $BA, $14, $16, $01, $A5
	db $23, $6C, $9E, $10, $17, $01, $00, $23
	db $50, $97, $10, $03, $A9, $14, $16, $01
	db $A5, $23, $6C, $9F, $08, $17, $01, $00
	db $23, $50, $97, $08, $99, $08, $05, $21
	db $64, $13, $02, $1E, $1E, $08, $00, $04
	db $08, $20, $00, $98, $25, $0A, $13, $00
	db $01, $2E, $02, $28, $32, $10, $AF, $B2
	db $9A, $18, $9A, $18, $9A, $18, $9A, $18
	db $10, $8F, $F8, $99, $08, $97, $08, $03
	db $EF, $14, $21, $64, $13, $02, $1E, $1E
	db $08, $00, $04, $08, $1F, $00, $94, $25
	db $0A, $01, $14, $13, $E4, $12, $02, $02
	db $7A, $7A, $10, $CE, $AF, $06, $08, $8A
	db $8A, $8A, $85, $85, $88, $88, $8A, $87
	db $8A, $8B, $8C, $8C, $8C, $8C, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
	db $8C, $8C, $85, $85, $85, $85, $85, $85
	db $85, $85, $88, $88, $88, $88, $8A, $8A
	db $8A, $8A, $03, $1E, $15, $00, $21, $64
	db $13, $02, $64, $64, $09, $00, $04, $05
	db $22, $00, $91, $25, $0A, $01, $8F, $13
	db $F8, $12, $FC, $02, $32, $46, $21, $5E
	db $15, $00, $10, $EF, $80, $80, $58, $08
	db $01, $02, $08, $21, $00, $A2, $10, $A2
	db $10, $A2, $0F, $08, $00, $01, $08, $2B
	db $00, $9F, $09, $0A, $9F, $07, $08, $00
	db $01, $08, $2B, $00, $9F, $09, $0A, $9F
	db $07, $08, $00, $01, $08, $39, $00, $A4
	db $09, $0A, $0F, $04, $02, $11, $05, $A4
	db $0F, $80, $01, $A4, $07, $08, $00, $01
	db $08, $39, $00, $A4, $09, $0A, $A4, $08
	db $08, $01, $02, $08, $2C, $00, $A7, $10
	db $A7, $10, $A7, $10, $10, $EE, $40, $A7
	db $10, $10, $EC, $20, $A7, $10, $10, $EB
	db $00, $A7, $10, $05, $21, $64, $13, $02
	db $0A, $0A, $08, $00, $04, $08, $2B, $00
	db $80, $05, $9D, $20, $0A, $01, $8F, $13
	db $F8, $12, $FC, $02, $1C, $12, $80, $0F
	db $21, $5E, $15, $00, $21, $64, $13, $02
	db $0A, $0A, $08, $00, $04, $08, $20, $00
	db $80, $05, $98, $20, $0A, $01, $8F, $13
	db $F8, $12, $FC, $02, $08, $0E, $80, $1E
	db $21, $5E, $15, $00, $21, $64, $13, $02
	db $0A, $0A, $08, $00, $04, $08, $1F, $00
	db $80, $05, $94, $30, $0A, $00, $21, $64
	db $13, $02, $28, $28, $09, $00, $04, $05
	db $22, $00, $80, $05, $91, $30, $0A, $00
	db $15, $2C, $17, $17, $18, $7F, $01, $00
	db $00, $00, $00, $00, $00, $21, $64, $13
	db $02, $1E, $1E, $08, $00, $04, $08, $2D
	db $00, $9E, $20, $0A, $13, $00, $12, $1E
	db $10, $8F, $D2, $04, $0C, $4C, $16, $00
	db $17, $01, $00, $23, $50, $97, $10, $94
	db $10, $16, $01, $A5, $23, $6C, $9E, $10
	db $17, $01, $00, $23, $50, $96, $09, $16
	db $01, $A5, $23, $26, $A5, $10, $A4, $07
	db $01, $00, $23, $50, $17, $98, $09, $16
	db $01, $A5, $23, $26, $A3, $07, $23, $6C
	db $9E, $10, $23, $26, $A4, $09, $23, $2C
	db $A5, $07, $05, $21, $64, $13, $02, $1E
	db $1E, $08, $00, $04, $08, $1D, $00, $9A
	db $20, $0A, $13, $00, $12, $00, $01, $2E
	db $02, $28, $32, $06, $10, $04, $0C, $A7
	db $16, $07, $00, $10, $8F, $F8, $99, $97
	db $9A, $97, $99, $96, $98, $10, $8F, $C5
	db $9A, $05, $21, $64, $13, $02, $1E, $1E
	db $08, $00, $04, $08, $11, $00, $97, $20
	db $0A, $13, $00, $06, $10, $04, $06, $CE
	db $16, $00, $21, $DB, $16, $21, $18, $17
	db $21, $DB, $16, $21, $29, $17, $05, $01
	db $05, $23, $4A, $10, $8F, $E0, $09, $01
	db $01, $0B, $0B, $00, $8D, $0A, $01, $07
	db $23, $11, $08, $02, $01, $16, $16, $00
	db $9A, $0A, $01, $01, $10, $8E, $EF, $88
	db $01, $07, $10, $8F, $E0, $08, $02, $01
	db $16, $16, $00, $9A, $0A, $01, $02, $23
	db $12, $10, $8E, $EF, $87, $01, $03, $10
	db $8F, $EF, $88, $05, $01, $08, $23, $12
	db $10, $8E, $EF, $8A, $01, $06, $23, $15
	db $10, $8E, $E0, $82, $05, $01, $06, $23
	db $15, $10, $8E, $E0, $82, $01, $08, $23
	db $12, $10, $8E, $EF, $8E, $05, $21, $64
	db $13, $02, $64, $64, $09, $00, $03, $05
	db $2B, $00, $93, $20, $0A, $80, $05, $13
	db $00, $12, $1E, $10, $8F, $D2, $04, $0C
	db $57, $17, $00, $17, $01, $00, $23, $1B
	db $97, $10, $94, $10, $16, $01, $A5, $23
	db $24, $9E, $10, $17, $01, $00, $23, $1B
	db $96, $09, $16, $01, $A5, $23, $0C, $A5
	db $10, $A4, $07, $01, $00, $23, $1B, $17
	db $98, $09, $16, $01, $A5, $23, $0C, $A3
	db $07, $23, $24, $9E, $10, $23, $0C, $A4
	db $09, $23, $11, $A5, $07, $05, $21, $64
	db $13, $02, $0A, $0A, $08, $00, $04, $08
	db $2D, $00, $80, $05, $9E, $1B, $0A, $01
	db $14, $13, $E4, $12, $02, $02, $7A, $7A
	db $10, $CE, $AF, $1C, $8B, $1D, $97, $04
	db $02, $C8, $17, $1C, $84, $1D, $90, $04
	db $02, $C8, $17, $1C, $8B, $1D, $97, $04
	db $02, $C8, $17, $00, $E0, $0C, $80, $04
	db $E0, $0C, $80, $14, $E0, $0C, $80, $14
	db $E0, $0C, $80, $24, $E0, $08, $E1, $08
	db $E0, $0C, $80, $14, $E0, $0C, $80, $14
	db $E0, $0C, $80, $04, $89, $10, $8A, $10
	db $05, $21, $64, $13, $02, $0A, $0A, $08
	db $00, $04, $08, $1D, $00, $80, $05, $9A
	db $1B, $0A, $16, $02, $14, $3C, $10, $8F
	db $E0, $80, $78, $21, $68, $18, $21, $46
	db $18, $21, $73, $22, $02, $14, $1E, $04
	db $02, $18, $18, $00, $10, $8E, $E0, $80
	db $18, $9A, $04, $9B, $04, $9C, $1C, $80
	db $04, $9A, $10, $97, $0C, $80, $04, $80
	db $18, $9A, $04, $9B, $04, $9C, $10, $9A
	db $10, $9C, $08, $9E, $08, $80, $08, $9A
	db $14, $80, $04, $99, $10, $97, $10, $80
	db $10, $05, $01, $01, $13, $02, $12, $F2
	db $95, $10, $01, $02, $13, $FE, $12, $18
	db $97, $10, $01, $03, $13, $FD, $12, $00
	db $97, $08, $95, $10, $01, $04, $13, $FC
	db $12, $FE, $97, $40, $01, $04, $13, $FC
	db $12, $FE, $97, $08, $01, $01, $13, $02
	db $12, $F2, $95, $10, $01, $02, $13, $FE
	db $12, $18, $97, $10, $01, $03, $13, $FD
	db $12, $00, $97, $08, $01, $01, $13, $02
	db $12, $F2, $99, $10, $01, $02, $13, $FE
	db $12, $18, $9A, $10, $01, $04, $13, $FC
	db $12, $FE, $9A, $08, $01, $03, $13, $FD
	db $12, $00, $99, $10, $01, $04, $13, $FC
	db $12, $FE, $97, $20, $05, $21, $64, $13
	db $02, $0A, $0A, $08, $00, $04, $08, $11
	db $00, $80, $05, $97, $1B, $0A, $16, $80
	db $07, $02, $17, $08, $10, $8F, $E0, $80
	db $78, $21, $68, $18, $21, $46, $18, $21
	db $73, $22, $02, $0B, $06, $04, $02, $18
	db $18, $00, $21, $64, $13, $02, $28, $28
	db $09, $00, $03, $05, $2B, $00, $80, $05
	db $93, $1B, $0A, $16, $80, $0F, $02, $04
	db $0B, $10, $8F, $E0, $80, $78, $21, $68
	db $18, $21, $46, $18, $21, $73, $22, $02
	db $03, $07, $04, $02, $18, $18, $00, $15
	db $37, $20, $20, $18, $7F, $0A, $00, $00
	db $00, $00, $00, $00, $13, $11, $12, $EC
	db $10, $8D, $E0, $02, $20, $10, $01, $39
	db $9E, $04, $01, $3B, $A0, $04, $01, $3D
	db $A1, $10, $01, $3F, $A0, $10, $01, $41
	db $9E, $10, $01, $43, $9C, $08, $01, $45
	db $9B, $08, $01, $47, $97, $10, $01, $48
	db $9A, $10, $01, $49, $9B, $10, $01, $4A
	db $9C, $20, $06, $08, $01, $4F, $9A, $01
	db $4E, $9A, $01, $4D, $9A, $01, $4C, $9A
	db $01, $4B, $9A, $01, $4A, $9A, $01, $49
	db $9A, $01, $48, $9A, $21, $78, $19, $10
	db $FC, $60, $21, $78, $19, $10, $FB, $20
	db $21, $78, $19, $00, $01, $47, $9A, $01
	db $45, $9A, $01, $43, $9A, $01, $41, $9A
	db $01, $3F, $9A, $01, $3D, $9A, $01, $3B
	db $9A, $01, $39, $9A, $05, $13, $11, $12
	db $E4, $10, $8D, $E0, $02, $06, $0B, $80
	db $0B, $03, $22, $19, $00, $10, $8D, $E0
	db $01, $8A, $08, $02, $01, $0B, $07, $03
	db $13, $00, $80, $08, $04, $04, $AB, $1B
	db $02, $18, $18, $10, $8F, $D6, $82, $10
	db $8A, $10, $8F, $10, $02, $18, $18, $10
	db $8F, $D6, $82, $20, $02, $0C, $0C, $82
	db $20, $02, $08, $08, $82, $20, $02, $04
	db $04, $82, $20, $00, $01, $14, $13, $E4
	db $12, $02, $02, $7A, $7A, $10, $CE, $AF
	db $80, $08, $8B, $10, $8B, $08, $8B, $20
	db $8B, $08, $8B, $10, $8B, $30, $85, $10
	db $85, $08, $85, $20, $85, $08, $85, $10
	db $85, $08, $85, $20, $85, $08, $85, $10
	db $85, $18, $80, $08, $85, $80, $00, $16
	db $01, $15, $13, $F0, $12, $03, $02, $18
	db $18, $10, $C1, $AE, $A1, $80, $A0, $F0
	db $00, $13, $11, $12, $E4, $10, $8D, $E0
	db $02, $07, $02, $80, $15, $16, $03, $22
	db $19, $00, $16, $01, $15, $13, $F0, $12
	db $03, $02, $18, $18, $10, $C1, $AE, $9E
	db $80, $9C, $F0, $00, $16, $01, $15, $13
	db $F0, $12, $03, $02, $18, $18, $10, $C1
	db $AE, $9A, $80, $9A, $F0, $00, $80, $10
	db $05, $1F, $06, $21, $52, $1A, $15, $37
	db $20, $20, $18, $7F, $0A, $00, $00, $00
	db $00, $00, $00, $16, $13, $11, $12, $E9
	db $10, $8D, $E0, $02, $10, $08, $21, $C2
	db $1A, $02, $0C, $06, $21, $C2, $1A, $02
	db $08, $04, $21, $C2, $1A, $01, $8A, $08
	db $02, $01, $0B, $07, $03, $13, $00, $04
	db $08, $AB, $1B, $04, $18, $AB, $1B, $04
	db $12, $AB, $1B, $01, $8A, $08, $02, $01
	db $0B, $07, $03, $13, $00, $04, $1C, $AB
	db $1B, $13, $11, $12, $E9, $10, $8D, $E0
	db $02, $0C, $06, $21, $12, $1B, $03, $6F
	db $1A, $00, $04, $20, $AB, $1B, $04, $08
	db $AB, $1B, $03, $B6, $1A, $00, $01, $37
	db $21, $63, $1B, $01, $39, $21, $6C, $1B
	db $01, $3B, $21, $75, $1B, $01, $3D, $21
	db $7E, $1B, $01, $3F, $21, $87, $1B, $01
	db $41, $21, $90, $1B, $01, $43, $21, $99
	db $1B, $01, $45, $21, $A2, $1B, $01, $47
	db $21, $63, $1B, $01, $48, $21, $6C, $1B
	db $01, $49, $21, $75, $1B, $01, $4A, $21
	db $7E, $1B, $01, $4B, $21, $87, $1B, $01
	db $4C, $21, $90, $1B, $01, $4D, $21, $99
	db $1B, $01, $4E, $21, $A2, $1B, $01, $4F
	db $21, $63, $1B, $01, $4E, $21, $6C, $1B
	db $01, $4D, $21, $75, $1B, $01, $4C, $21
	db $7E, $1B, $01, $4B, $21, $87, $1B, $01
	db $4A, $21, $90, $1B, $01, $49, $21, $99
	db $1B, $01, $48, $21, $A2, $1B, $01, $47
	db $21, $63, $1B, $01, $45, $21, $6C, $1B
	db $01, $43, $21, $75, $1B, $01, $41, $21
	db $7E, $1B, $01, $3F, $21, $87, $1B, $01
	db $3D, $21, $90, $1B, $01, $3B, $21, $99
	db $1B, $01, $39, $21, $A2, $1B, $05, $09
	db $00, $01, $05, $68, $00, $97, $10, $05
	db $08, $00, $01, $05, $75, $00, $97, $10
	db $05, $08, $00, $01, $06, $74, $00, $9A
	db $10, $05, $09, $00, $01, $06, $6D, $00
	db $9B, $10, $05, $08, $00, $01, $07, $7B
	db $00, $9E, $10, $05, $08, $00, $01, $07
	db $7B, $00, $9E, $10, $05, $09, $00, $01
	db $07, $73, $00, $9E, $10, $05, $08, $00
	db $01, $07, $73, $00, $9C, $10, $05, $02
	db $18, $18, $10, $8F, $D6, $82, $10, $8A
	db $10, $8F, $10, $02, $08, $08, $8F, $08
	db $02, $18, $18, $10, $8F, $FA, $94, $08
	db $05, $21, $52, $1A, $16, $80, $11, $13
	db $11, $12, $E9, $10, $8D, $E0, $02, $04
	db $06, $21, $C2, $1A, $02, $02, $03, $21
	db $C2, $1A, $02, $01, $02, $21, $C2, $1A
	db $13, $00, $12, $00, $80, $80, $80, $80
	db $80, $80, $80, $6F, $13, $00, $12, $00
	db $04, $0C, $19, $1C, $04, $09, $19, $1C
	db $13, $F4, $04, $0C, $19, $1C, $80, $80
	db $80, $80, $80, $11, $13, $11, $12, $E9
	db $10, $8D, $E0, $02, $02, $03, $21, $12
	db $1B, $03, $D2, $1B, $00, $01, $2D, $02
	db $26, $26, $10, $8F, $E0, $99, $08, $01
	db $2E, $10, $EF, $FA, $02, $14, $14, $9E
	db $08, $02, $06, $06, $9E, $08, $01, $0D
	db $10, $8F, $F8, $02, $2C, $2C, $88, $08
	db $02, $0E, $0E, $88, $08, $01, $09, $02
	db $70, $70, $10, $8F, $E0, $91, $02, $91
	db $02, $91, $02, $92, $02, $06, $08, $01
	db $2E, $02, $14, $14, $10, $8F, $D2, $9E
	db $01, $2F, $02, $17, $17, $10, $8F, $F5
	db $9A, $01, $A3, $10, $8F, $B5, $0F, $05
	db $01, $11, $01, $02, $0A, $0A, $A2, $02
	db $03, $03, $A2, $0E, $01, $32, $02, $4A
	db $4A, $10, $8F, $D0, $08, $00, $01, $37
	db $37, $01, $9A, $0A, $01, $09, $10, $8F
	db $E0, $02, $7F, $7F, $8A, $02, $2A, $2A
	db $8A, $01, $A5, $02, $2C, $2C, $10, $8F
	db $E0, $AA, $01, $8D, $02, $2C, $2C, $10
	db $AF, $F5, $AE, $01, $0D, $02, $1C, $1C
	db $10, $8E, $E0, $9A, $07, $05, $21, $52
	db $1A, $01, $14, $13, $E4, $12, $02, $02
	db $7A, $7A, $10, $D8, $E5, $2B, $89, $00
	db $80, $86, $00, $80, $8B, $01, $00, $89
	db $00, $80, $86, $00, $80, $8B, $01, $00
	db $89, $00, $80, $86, $00, $80, $8B, $01
	db $00, $89, $00, $80, $86, $00, $80, $8B
	db $01, $00, $2C, $10, $CE, $AF, $21, $AB
	db $1D, $21, $C7, $1D, $21, $AB, $1D, $04
	db $02, $8B, $1D, $21, $A5, $1D, $01, $14
	db $13, $E4, $12, $02, $02, $7A, $7A, $10
	db $CE, $AF, $04, $02, $57, $1D, $1C, $8F
	db $21, $3B, $1D, $1C, $8E, $21, $3B, $1D
	db $1C, $8D, $21, $3B, $1D, $8B, $10, $8B
	db $08, $8B, $20, $8B, $08, $8B, $10, $8B
	db $10, $8B, $10, $8A, $10, $1C, $89, $21
	db $4A, $1D, $1C, $86, $21, $4A, $1D, $04
	db $02, $A5, $1D, $03, $B5, $1C, $00, $E0
	db $10, $E0, $08, $E0, $20, $E0, $08, $E0
	db $10, $E0, $20, $E0, $10, $05, $E0, $10
	db $E0, $08, $E0, $20, $E0, $08, $E0, $10
	db $E0, $30, $05, $8F, $10, $8F, $08, $8F
	db $20, $8F, $08, $8F, $10, $8F, $10, $83
	db $10, $85, $10, $86, $10, $86, $08, $86
	db $20, $86, $08, $86, $10, $86, $10, $86
	db $20, $8A, $10, $8A, $08, $8A, $20, $8A
	db $08, $8A, $10, $8A, $20, $8D, $08, $8F
	db $08, $1C, $8D, $21, $3B, $1D, $05, $1C
	db $89, $21, $4A, $1D, $86, $10, $86, $08
	db $86, $20, $86, $08, $86, $10, $86, $10
	db $88, $10, $89, $10, $1C, $8B, $21, $4A
	db $1D, $1C, $8B, $21, $4A, $1D, $05, $1C
	db $86, $21, $4A, $1D, $86, $10, $86, $08
	db $86, $20, $86, $08, $86, $10, $86, $10
	db $88, $10, $89, $10, $1C, $8B, $04, $02
	db $4A, $1D, $05, $1C, $86, $21, $4A, $1D
	db $86, $10, $86, $08, $86, $20, $86, $08
	db $86, $10, $86, $10, $88, $10, $89, $10
	db $1C, $8B, $21, $4A, $1D, $8B, $10, $8B
	db $08, $8B, $20, $8B, $08, $8B, $10, $8B
	db $10, $8B, $20, $05, $21, $52, $1A, $01
	db $14, $13, $F0, $12, $02, $02, $10, $18
	db $10, $D5, $E5, $2B, $A0, $00, $80, $A3
	db $00, $80, $9E, $01, $00, $A0, $00, $80
	db $A3, $00, $80, $9E, $01, $00, $A0, $00
	db $80, $A3, $00, $80, $9E, $01, $00, $A0
	db $00, $80, $A3, $00, $80, $9E, $01, $00
	db $A0, $01, $00, $9E, $01, $00, $A0, $01
	db $00, $9E, $01, $00, $A0, $01, $00, $9E
	db $01, $00, $A0, $00, $80, $A3, $00, $80
	db $9E, $01, $00, $A0, $00, $80, $A3, $00
	db $80, $9E, $01, $80, $01, $14, $13, $F0
	db $12, $02, $02, $10, $18, $10, $D5, $E5
	db $2B, $A2, $00, $80, $A2, $00, $80, $A2
	db $00, $80, $A0, $00, $80, $A2, $00, $80
	db $A2, $00, $80, $A2, $00, $80, $A0, $00
	db $80, $A2, $00, $80, $A2, $00, $80, $A2
	db $00, $80, $9E, $00, $80, $9C, $00, $80
	db $A0, $00, $80, $A0, $00, $80, $9E, $00
	db $80, $2C, $03, $F3, $1D, $00, $21, $52
	db $1A, $01, $14, $13, $F0, $12, $02, $02
	db $18, $10, $10, $D5, $E5, $2B, $9C, $00
	db $80, $9C, $00, $80, $9B, $01, $00, $9C
	db $00, $80, $9C, $00, $80, $9B, $01, $00
	db $9C, $00, $80, $9C, $00, $80, $9B, $01
	db $00, $9C, $00, $80, $9C, $00, $80, $9B
	db $01, $00, $9C, $01, $00, $9B, $01, $00
	db $9C, $01, $00, $9B, $01, $00, $9C, $01
	db $00, $9B, $01, $00, $9C, $00, $80, $9C
	db $00, $80, $9B, $01, $00, $9C, $00, $80
	db $9C, $00, $80, $9B, $01, $80, $01, $14
	db $13, $F0, $12, $02, $02, $18, $10, $10
	db $D5, $E5, $2B, $9E, $00, $80, $9E, $00
	db $80, $9D, $00, $80, $9D, $00, $80, $9E
	db $00, $80, $9E, $00, $80, $9D, $00, $80
	db $9D, $00, $80, $9E, $00, $80, $9D, $00
	db $80, $9C, $00, $80, $9B, $00, $80, $99
	db $00, $80, $9C, $00, $80, $99, $00, $80
	db $9B, $00, $80, $2C, $03, $8D, $1E, $00
	db $21, $52, $1A, $01, $14, $13, $F0, $12
	db $02, $02, $14, $14, $10, $D5, $E5, $2B
	db $99, $00, $80, $99, $00, $80, $97, $01
	db $00, $99, $00, $80, $99, $00, $80, $97
	db $01, $00, $99, $00, $80, $99, $00, $80
	db $97, $01, $00, $99, $00, $80, $99, $00
	db $80, $97, $01, $00, $99, $01, $00, $97
	db $01, $00, $99, $01, $00, $97, $01, $00
	db $99, $01, $00, $97, $01, $00, $99, $00
	db $80, $99, $00, $80, $97, $01, $00, $99
	db $00, $80, $99, $00, $80, $97, $01, $80
	db $01, $14, $13, $F0, $12, $02, $02, $14
	db $14, $10, $D5, $E5, $2B, $9B, $00, $80
	db $99, $00, $80, $99, $00, $80, $99, $00
	db $80, $9B, $00, $80, $99, $00, $80, $99
	db $00, $80, $99, $00, $80, $9B, $00, $80
	db $9A, $00, $80, $99, $00, $80, $97, $00
	db $80, $95, $00, $80, $99, $00, $80, $95
	db $00, $80, $97, $00, $80, $2C, $03, $27
	db $1F, $00, $13, $FB, $12, $2E, $10, $DC
	db $8B, $06, $08, $01, $51, $A3, $A5, $01
	db $52, $A0, $A3, $01, $53, $A5, $A0, $01
	db $53, $A3, $A5, $01, $54, $A0, $A3, $01
	db $55, $A5, $A0, $01, $57, $A3, $A5, $01
	db $59, $A0, $A3, $07, $05, $13, $FB, $12
	db $2E, $10, $DA, $8B, $06, $04, $01, $59
	db $A8, $A7, $A3, $01, $58, $A8, $A7, $A3
	db $01, $57, $A8, $A7, $A3, $01, $56, $A8
	db $A7, $A3, $01, $55, $A8, $A7, $A3, $01
	db $54, $A8, $A7, $06, $04, $A3, $01, $53
	db $A8, $A7, $A3, $01, $52, $A8, $A7, $A3
	db $01, $51, $A8, $A7, $A3, $01, $50, $A8
	db $A7, $A3, $07, $05, $99, $10, $08, $00
	db $01, $0B, $58, $00, $9A, $10, $0A, $99
	db $08, $08, $00, $01, $0B, $58, $00, $05
	db $08, $00, $01, $0B, $58, $00, $9A, $10
	db $0A, $9C, $10, $9C, $10, $9E, $08, $05
	db $13, $07, $12, $2E, $10, $DA, $8B, $06
	db $08, $01, $50, $9B, $9C, $A3, $01, $51
	db $9B, $9C, $A3, $01, $52, $9B, $9C, $A3
	db $01, $53, $9B, $9C, $A3, $01, $52, $9B
	db $9C, $01, $51, $A3, $9B, $07, $05, $99
	db $10, $08, $00, $01, $0B, $58, $00, $9A
	db $10, $0A, $9E, $08, $08, $00, $01, $0E
	db $58, $00, $05, $08, $00, $01, $0B, $58
	db $00, $9A, $10, $0A, $9C, $10, $9C, $10
	db $9E, $08, $9B, $28, $9C, $10, $9B, $30
	db $99, $10, $97, $30, $05, $21, $52, $1A
	db $16, $01, $15, $13, $FC, $12, $03, $02
	db $18, $18, $10, $C1, $AE, $2B, $A0, $00
	db $80, $A3, $00, $80, $9E, $01, $00, $10
	db $C1, $A8, $A0, $00, $80, $A3, $01, $60
	db $2C, $02, $0A, $20, $10, $8F, $F1, $21
	db $7F, $22, $02, $18, $08, $21, $BE, $1F
	db $02, $0A, $20, $10, $8F, $F1, $21, $AD
	db $22, $02, $18, $08, $21, $E9, $1F, $80
	db $80, $80, $80, $80, $80, $80, $68, $21
	db $67, $22, $10, $9C, $AB, $80, $10, $02
	db $08, $10, $21, $28, $20, $9A, $18, $0A
	db $02, $07, $03, $21, $28, $20, $9A, $18
	db $0A, $02, $01, $03, $21, $28, $20, $9A
	db $08, $0A, $02, $08, $10, $21, $3C, $20
	db $9B, $08, $02, $07, $03, $21, $3C, $20
	db $9B, $08, $02, $01, $03, $21, $3C, $20
	db $9B, $18, $02, $18, $08, $21, $4C, $20
	db $21, $67, $22, $10, $9C, $AB, $02, $08
	db $10, $21, $73, $20, $9E, $18, $0A, $02
	db $07, $03, $21, $73, $20, $9E, $18, $0A
	db $02, $01, $03, $21, $73, $20, $9E, $08
	db $0A, $02, $08, $10, $21, $87, $20, $02
	db $05, $03, $99, $10, $97, $30, $02, $0A
	db $20, $10, $8F, $F1, $21, $7F, $22, $02
	db $18, $08, $21, $BE, $1F, $02, $0A, $20
	db $10, $8F, $F1, $21, $AD, $22, $02, $18
	db $08, $21, $E9, $1F, $02, $05, $08, $21
	db $0F, $20, $02, $03, $01, $21, $0F, $20
	db $02, $14, $09, $04, $02, $E2, $21, $21
	db $67, $22, $10, $9C, $AB, $02, $08, $10
	db $21, $9B, $21, $03, $A4, $20, $00, $A2
	db $20, $A0, $10, $9E, $40, $9E, $08, $A0
	db $08, $A2, $20, $A0, $10, $9E, $40, $9E
	db $08, $A0, $08, $A2, $20, $A3, $10, $A2
	db $30, $A0, $10, $9E, $60, $80, $18, $9B
	db $08, $9D, $08, $9E, $08, $A0, $20, $9E
	db $10, $9C, $40, $9C, $08, $9E, $08, $A0
	db $20, $9E, $10, $9C, $20, $9E, $10, $A0
	db $10, $A0, $50, $A0, $15, $A1, $16, $A0
	db $15, $9E, $40, $80, $40, $05, $13, $07
	db $12, $2E, $10, $EB, $6B, $06, $08, $01
	db $50, $9B, $9D, $9E, $A2, $01, $51, $9B
	db $9D, $9E, $A2, $01, $52, $9B, $9D, $9E
	db $A2, $01, $53, $9B, $9D, $9E, $A2, $01
	db $50, $9E, $A2, $A5, $A7, $01, $51, $9E
	db $A2, $A5, $A7, $01, $52, $9E, $A2, $A5
	db $A7, $01, $53, $9E, $A2, $A5, $A7, $01
	db $50, $9D, $A2, $A5, $A7, $01, $51, $9D
	db $A2, $A5, $A7, $01, $52, $9D, $A2, $A5
	db $A7, $01, $53, $9D, $A2, $A5, $A7, $06
	db $04, $01, $50, $9D, $A0, $A5, $A7, $01
	db $51, $9D, $A0, $A5, $A7, $01, $52, $9D
	db $A0, $A5, $A7, $01, $53, $9D, $A0, $A5
	db $A7, $01, $54, $A7, $A5, $A0, $9D, $01
	db $52, $A7, $A5, $A0, $9D, $01, $51, $A7
	db $A5, $A0, $9D, $01, $50, $A7, $A5, $A0
	db $9D, $07, $05, $01, $21, $13, $18, $12
	db $AB, $0F, $05, $02, $0A, $16, $05, $01
	db $29, $13, $0B, $12, $F5, $0F, $02, $03
	db $05, $08, $05, $21, $73, $22, $99, $08
	db $9B, $08, $9C, $08, $9E, $08, $A0, $20
	db $9E, $10, $9C, $30, $99, $08, $9B, $08
	db $9C, $08, $9E, $08, $A0, $20, $9E, $10
	db $9C, $20, $9E, $10, $A0, $10, $9E, $44
	db $99, $04, $9B, $04, $99, $04, $97, $20
	db $05, $21, $73, $22, $99, $08, $9B, $08
	db $9C, $08, $9E, $08, $A0, $20, $9E, $10
	db $9C, $48, $9C, $04, $9E, $04, $A0, $20
	db $9E, $10, $9C, $40, $A3, $08, $A5, $08
	db $A3, $38, $9E, $04, $A0, $04, $9E, $34
	db $99, $04, $9B, $04, $99, $04, $97, $20
	db $05, $21, $52, $1A, $80, $0F, $16, $01
	db $15, $13, $FC, $12, $03, $02, $18, $18
	db $10, $C1, $AE, $2B, $9C, $00, $80, $9C
	db $00, $80, $9B, $01, $00, $9C, $00, $80
	db $9C, $00, $80, $9B, $00, $E0, $2C, $02
	db $0B, $05, $10, $8C, $EE, $21, $7F, $22
	db $02, $03, $08, $21, $BE, $1F, $02, $0B
	db $05, $10, $8C, $EE, $21, $AD, $22, $02
	db $03, $08, $21, $E9, $1F, $80, $80, $80
	db $80, $80, $80, $80, $68, $21, $67, $22
	db $10, $9C, $A8, $80, $10, $02, $05, $03
	db $21, $28, $20, $9A, $18, $0A, $02, $01
	db $03, $21, $28, $20, $9A, $18, $0A, $02
	db $02, $00, $21, $28, $20, $9A, $08, $0A
	db $02, $05, $03, $21, $3C, $20, $9B, $08
	db $02, $01, $03, $21, $3C, $20, $9B, $08
	db $02, $02, $00, $21, $3C, $20, $9B, $18
	db $02, $03, $08, $21, $4C, $20, $21, $67
	db $22, $10, $9C, $A8, $02, $05, $03, $21
	db $73, $20, $9E, $18, $0A, $02, $01, $03
	db $21, $73, $20, $9E, $18, $0A, $02, $02
	db $00, $21, $73, $20, $9E, $08, $0A, $02
	db $05, $03, $21, $87, $20, $02, $01, $03
	db $99, $10, $97, $30, $02, $0B, $05, $10
	db $8C, $EE, $21, $7F, $22, $02, $03, $08
	db $21, $BE, $1F, $02, $0B, $05, $10, $8C
	db $EE, $21, $AD, $22, $02, $03, $08, $21
	db $E9, $1F, $02, $03, $01, $21, $0F, $20
	db $02, $00, $02, $21, $0F, $20, $02, $03
	db $0A, $04, $02, $E2, $21, $21, $67, $22
	db $10, $9C, $A8, $02, $05, $03, $21, $9B
	db $21, $03, $E2, $22, $00

DATA_EE52FC:
	db $00, $13, $84, $06, $7F, $1A, $A7, $1B
	db $7F, $1C, $DF, $1D, $AF, $1A, $D0, $1A
	db $92, $1D, $B1, $1D, $A0, $FF, $00, $13
	db $1C, $13, $2E, $13, $40, $13, $52, $13
	db $25, $19, $AD, $19, $95, $19, $21, $1A
	db $4C, $1A, $94, $19, $F2, $19, $61, $19
	db $B0, $FF, $3F, $16, $D0, $16, $AC, $17
	db $07, $18, $A2, $16, $F8, $18, $CB, $18
	db $54, $17, $DE, $FF, $89, $14, $FE, $14
	db $49, $15, $C7, $15, $D2, $14, $07, $16
	db $19, $16, $E7, $15, $C0, $FF, $64, $13
	db $B1, $13, $C7, $13, $EB, $13, $05, $14
	db $5F, $14, $1F, $14, $39, $14, $C0, $FF
	db $15, $28, $11, $11, $18, $70, $01, $01
	db $01, $01, $01, $01, $01, $13, $00, $12
	db $00, $10, $8F, $E0, $01, $A0, $23, $46
	db $9E, $09, $17, $01, $00, $23, $3C, $97
	db $07, $97, $09, $01, $A0, $23, $46, $9E
	db $10, $9E, $07, $9E, $05, $17, $01, $00
	db $23, $3C, $97, $05, $97, $06, $01, $A0
	db $23, $46, $9E, $17, $23, $1E, $9E, $03
	db $23, $28, $9E, $03, $23, $32, $9E, $03
	db $23, $46, $9E, $10, $00, $01, $21, $13
	db $00, $12, $AB, $23, $46, $10, $DE, $93
	db $8C, $19, $8D, $17, $8F, $10, $88, $20
	db $88, $10, $00, $21, $2B, $16, $02, $28
	db $50, $10, $8F, $CB, $16, $A0, $09, $9B
	db $07, $9D, $09, $A0, $10, $A2, $07, $A4
	db $05, $A7, $04, $A9, $06, $10, $BF, $4B
	db $AC, $19, $80, $07, $AC, $10, $00, $01
	db $24, $13, $00, $12, $A9, $02, $1E, $14
	db $10, $AF, $AE, $16, $A0, $19, $A0, $17
	db $A4, $10, $A0, $19, $80, $07, $A0, $10
	db $00, $01, $24, $13, $00, $12, $A9, $02
	db $14, $1E, $10, $AF, $AE, $16, $9B, $19
	db $9D, $17, $9F, $10, $9B, $19, $80, $07
	db $9B, $10, $00, $01, $24, $13, $00, $12
	db $A9, $02, $19, $19, $10, $AF, $AE, $16
	db $98, $19, $99, $17, $9B, $10, $98, $19
	db $80, $07, $98, $10, $00, $21, $2B, $16
	db $02, $21, $11, $10, $8E, $C8, $80, $0E
	db $16, $A0, $09, $9B, $07, $9D, $09, $A0
	db $10, $A2, $07, $A4, $05, $A7, $04, $A9
	db $06, $10, $BF, $4B, $AC, $19, $80, $07
	db $AC, $10, $00, $13, $00, $12, $00, $00
	db $01, $2E, $02, $0A, $1E, $10, $DF, $55
	db $9E, $09, $9D, $07, $9E, $09, $9D, $07
	db $9E, $09, $9D, $07, $9E, $09, $9E, $03
	db $9E, $03, $9E, $03, $9E, $09, $9D, $07
	db $9E, $10, $9E, $10, $00, $15, $28, $11
	db $11, $18, $70, $01, $01, $01, $01, $01
	db $01, $01, $21, $2B, $16, $02, $1E, $1E
	db $08, $00, $04, $08, $2B, $00, $9D, $25
	db $0A, $13, $00, $12, $1E, $10, $8F, $D2
	db $04, $03, $C1, $14, $16, $01, $A0, $23
	db $6C, $9E, $10, $17, $01, $00, $23, $50
	db $97, $10, $03, $B0, $14, $16, $01, $A0
	db $23, $6C, $9F, $08, $17, $01, $00, $23
	db $50, $97, $08, $99, $08, $05, $21, $2B
	db $16, $00, $02, $1E, $1E, $08, $00, $04
	db $08, $20, $00, $98, $25, $0A, $13, $00
	db $01, $2E, $02, $28, $32, $10, $AF, $B2
	db $9A, $18, $9A, $18, $9A, $18, $9A, $18
	db $10, $8F, $F8, $99, $08, $97, $08, $03
	db $F7, $14, $21, $2B, $16, $02, $1E, $1E
	db $08, $00, $04, $08, $1F, $00, $94, $25
	db $0A, $01, $21, $13, $00, $12, $AB, $23
	db $46, $10, $DE, $93, $06, $08, $8A, $8A
	db $8A, $85, $85, $88, $88, $8A, $87, $8A
	db $8B, $8C, $8C, $8C, $8C, $8C, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
	db $8C, $85, $85, $85, $85, $85, $85, $85
	db $85, $88, $88, $88, $88, $8A, $8A, $8A
	db $8A, $03, $25, $15, $00, $21, $2B, $16
	db $02, $64, $64, $09, $00, $04, $05, $22
	db $00, $91, $25, $0A, $01, $8F, $13, $F8
	db $12, $FC, $02, $32, $46, $21, $65, $15
	db $00, $10, $EF, $80, $80, $58, $08, $01
	db $02, $08, $21, $00, $A2, $10, $A2, $10
	db $A2, $0F, $08, $00, $01, $08, $2B, $00
	db $9F, $09, $0A, $9F, $07, $08, $00, $01
	db $08, $2B, $00, $9F, $09, $0A, $9F, $07
	db $08, $00, $01, $08, $39, $00, $A4, $09
	db $0A, $0F, $04, $02, $11, $05, $A4, $0F
	db $80, $01, $A4, $07, $08, $00, $01, $08
	db $39, $00, $A4, $09, $0A, $A4, $08, $08
	db $01, $02, $08, $2C, $00, $A7, $10, $A7
	db $10, $A7, $10, $10, $EE, $40, $A7, $10
	db $10, $EC, $20, $A7, $10, $10, $EB, $00
	db $A7, $10, $05, $21, $2B, $16, $02, $0A
	db $0A, $08, $00, $04, $08, $2B, $00, $80
	db $05, $9D, $20, $0A, $01, $8F, $13, $F8
	db $12, $FC, $02, $1C, $12, $80, $0F, $21
	db $65, $15, $00, $21, $2B, $16, $02, $0A
	db $0A, $08, $00, $04, $08, $20, $00, $80
	db $05, $98, $20, $0A, $01, $8F, $13, $F8
	db $12, $FC, $02, $08, $0E, $80, $1E, $21
	db $65, $15, $00, $21, $2B, $16, $02, $0A
	db $0A, $08, $00, $04, $08, $1F, $00, $80
	db $05, $94, $30, $0A, $00, $21, $2B, $16
	db $02, $28, $28, $09, $00, $04, $05, $22
	db $00, $80, $05, $91, $30, $0A, $00, $01
	db $13, $13, $F0, $12, $1F, $10, $8A, $E0
	db $05, $01, $1E, $10, $8E, $F6, $13, $0C
	db $12, $B8, $05, $15, $28, $11, $11, $18
	db $70, $01, $01, $01, $01, $01, $01, $01
	db $21, $2B, $16, $02, $1E, $1E, $08, $00
	db $04, $08, $2D, $00, $9E, $20, $0A, $13
	db $00, $12, $1E, $10, $8F, $D2, $04, $0C
	db $67, $16, $00, $17, $01, $00, $23, $50
	db $97, $10, $94, $10, $16, $01, $A0, $23
	db $62, $9E, $10, $17, $01, $00, $23, $50
	db $96, $09, $16, $01, $A0, $23, $21, $A5
	db $10, $A4, $07, $01, $00, $23, $50, $17
	db $98, $09, $16, $01, $A0, $23, $21, $A3
	db $07, $23, $62, $9E, $10, $23, $21, $A4
	db $09, $23, $26, $A5, $07, $05, $21, $2B
	db $16, $00, $02, $1E, $1E, $08, $00, $04
	db $08, $1D, $00, $9A, $20, $0A, $13, $00
	db $12, $00, $02, $28, $32, $06, $10, $04
	db $0C, $C1, $16, $07, $00, $10, $8F, $F8
	db $99, $97, $9A, $97, $99, $96, $98, $10
	db $8F, $C5, $9A, $05, $21, $2B, $16, $02
	db $1E, $1E, $08, $00, $04, $08, $11, $00
	db $97, $20, $0A, $13, $00, $06, $10, $04
	db $06, $E8, $16, $00, $21, $F5, $16, $21
	db $32, $17, $21, $F5, $16, $21, $43, $17
	db $05, $01, $05, $23, $4A, $10, $8F, $E0
	db $09, $01, $01, $0B, $0B, $00, $8D, $0A
	db $01, $07, $23, $11, $08, $02, $01, $16
	db $16, $00, $9A, $0A, $01, $01, $10, $8E
	db $EF, $88, $01, $07, $10, $8F, $E0, $08
	db $02, $01, $16, $16, $00, $9A, $0A, $01
	db $02, $23, $12, $10, $8E, $EF, $87, $01
	db $03, $10, $8F, $EF, $88, $05, $01, $08
	db $23, $12, $10, $8E, $EF, $8A, $01, $06
	db $23, $15, $10, $8E, $E0, $82, $05, $01
	db $06, $23, $15, $10, $8E, $E0, $82, $01
	db $08, $23, $12, $10, $8E, $EF, $8E, $05
	db $21, $2B, $16, $02, $64, $64, $09, $00
	db $03, $05, $2B, $00, $93, $20, $0A, $80
	db $05, $13, $00, $12, $1E, $10, $8F, $D2
	db $04, $0C, $71, $17, $00, $17, $01, $00
	db $23, $1B, $97, $10, $94, $10, $16, $01
	db $A0, $23, $24, $9E, $10, $17, $01, $00
	db $23, $1B, $96, $09, $16, $01, $A0, $23
	db $0C, $A5, $10, $A4, $07, $01, $00, $23
	db $1B, $17, $98, $09, $16, $01, $A0, $23
	db $0C, $A3, $07, $23, $24, $9E, $10, $23
	db $0C, $A4, $09, $23, $11, $A5, $07, $05
	db $21, $2B, $16, $02, $0A, $0A, $08, $00
	db $04, $08, $2D, $00, $80, $05, $9E, $1B
	db $0A, $0E, $01, $21, $13, $00, $12, $AB
	db $23, $46, $10, $DE, $93, $1C, $8B, $1D
	db $97, $04, $02, $E2, $17, $1C, $84, $1D
	db $90, $04, $02, $E2, $17, $1C, $8B, $1D
	db $97, $04, $02, $E2, $17, $00, $E0, $0C
	db $80, $04, $E0, $0C, $80, $14, $E0, $0C
	db $80, $14, $E0, $0C, $80, $24, $E0, $08
	db $E1, $08, $E0, $0C, $80, $14, $E0, $0C
	db $80, $14, $E0, $0C, $80, $04, $89, $10
	db $8A, $10, $05, $21, $2B, $16, $02, $0A
	db $0A, $08, $00, $04, $08, $1D, $00, $80
	db $05, $9A, $1B, $0A, $16, $02, $14, $3C
	db $10, $8F, $E0, $80, $78, $21, $82, $18
	db $21, $60, $18, $21, $35, $16, $02, $14
	db $1E, $04, $02, $32, $18, $00, $10, $8E
	db $E0, $80, $18, $9A, $04, $9B, $04, $9C
	db $1C, $80, $04, $9A, $10, $97, $0C, $80
	db $04, $80, $18, $9A, $04, $9B, $04, $9C
	db $10, $9A, $10, $9C, $08, $9E, $08, $80
	db $08, $9A, $14, $80, $04, $99, $10, $97
	db $10, $80, $10, $05, $01, $01, $13, $02
	db $12, $F2, $95, $10, $01, $02, $13, $FE
	db $12, $18, $97, $10, $01, $03, $13, $FD
	db $12, $00, $97, $08, $95, $10, $01, $04
	db $13, $FC, $12, $FE, $97, $40, $01, $04
	db $13, $FC, $12, $FE, $97, $08, $01, $01
	db $13, $02, $12, $F2, $95, $10, $01, $02
	db $13, $FE, $12, $18, $97, $10, $01, $03
	db $13, $FD, $12, $00, $97, $08, $01, $01
	db $13, $02, $12, $F2, $99, $10, $01, $02
	db $13, $FE, $12, $18, $9A, $10, $01, $04
	db $13, $FC, $12, $FE, $9A, $08, $01, $03
	db $13, $FD, $12, $00, $99, $10, $01, $04
	db $13, $FC, $12, $FE, $97, $20, $05, $21
	db $2B, $16, $02, $0A, $0A, $08, $00, $04
	db $08, $11, $00, $80, $05, $97, $1B, $0A
	db $16, $80, $07, $02, $17, $08, $10, $8F
	db $E0, $80, $78, $21, $82, $18, $21, $60
	db $18, $21, $35, $16, $02, $0B, $06, $04
	db $02, $32, $18, $00, $21, $2B, $16, $02
	db $28, $28, $09, $00, $03, $05, $2B, $00
	db $80, $05, $93, $1B, $0A, $16, $80, $0F
	db $02, $04, $0B, $10, $8F, $E0, $80, $78
	db $21, $82, $18, $21, $60, $18, $21, $35
	db $16, $02, $03, $07, $04, $02, $32, $18
	db $00, $15, $28, $11, $11, $18, $70, $01
	db $01, $01, $01, $01, $01, $01, $01, $1E
	db $13, $0C, $12, $B8, $0F, $03, $01, $0B
	db $02, $10, $8C, $B7, $16, $02, $21, $0B
	db $9E, $04, $A0, $04, $A1, $18, $A0, $04
	db $9E, $04, $9D, $10, $9B, $08, $9D, $08
	db $9E, $10, $99, $04, $9B, $04, $9C, $04
	db $9D, $04, $9E, $20, $00, $01, $1E, $13
	db $0C, $12, $B8, $0F, $03, $01, $0B, $02
	db $10, $8C, $B7, $02, $0B, $04, $80, $0F
	db $02, $04, $0C, $9E, $04, $A0, $04, $A1
	db $18, $A0, $04, $9E, $04, $9D, $10, $9B
	db $08, $9D, $08, $9E, $10, $99, $04, $9B
	db $04, $9C, $04, $9D, $04, $9E, $20, $00
	db $00, $01, $A0, $13, $00, $12, $00, $10
	db $8F, $E0, $16, $02, $19, $19, $96, $04
	db $02, $23, $23, $96, $04, $21, $ED, $1B
	db $00, $01, $24, $13, $00, $12, $A9, $02
	db $46, $28, $10, $FE, $51, $16, $80, $08
	db $97, $08, $9A, $08, $9E, $08, $A1, $08
	db $99, $08, $9D, $08, $A0, $08, $A3, $08
	db $9E, $08, $A1, $08, $A5, $08, $A8, $08
	db $01, $13, $13, $FC, $12, $1F, $0F, $03
	db $02, $11, $08, $10, $AF, $4B, $02, $1E
	db $32, $AA, $10, $02, $14, $0F, $AA, $10
	db $02, $07, $0A, $AA, $10, $00, $01, $24
	db $13, $00, $12, $A9, $02, $14, $1E, $10
	db $FE, $51, $16, $80, $0A, $80, $08, $97
	db $08, $9A, $08, $9E, $08, $A1, $08, $99
	db $08, $9D, $08, $A0, $08, $A3, $08, $9E
	db $08, $A1, $08, $A5, $04, $A8, $02, $02
	db $50, $32, $AA, $20, $00, $01, $13, $13
	db $FC, $12, $1F, $0F, $03, $02, $11, $08
	db $10, $AF, $4B, $02, $28, $3C, $80, $08
	db $97, $20, $99, $18, $9B, $04, $9D, $04
	db $02, $1E, $32, $9E, $10, $02, $14, $0F
	db $9E, $10, $02, $07, $0A, $9E, $10, $00
	db $01, $13, $13, $FC, $12, $1F, $0F, $03
	db $02, $11, $08, $10, $AF, $4B, $80, $08
	db $80, $60, $02, $1E, $32, $A1, $10, $02
	db $14, $0F, $A1, $10, $02, $07, $0A, $A1
	db $10, $00, $15, $32, $1E, $1E, $18, $70
	db $01, $01, $01, $01, $01, $01, $01, $05
	db $80, $10, $05, $1F, $04, $21, $7C, $1A
	db $24, $56, $15, $1E, $0A, $0A, $18, $70
	db $01, $01, $01, $01, $01, $01, $01, $16
	db $01, $A7, $13, $00, $12, $00, $02, $64
	db $3C, $10, $8F, $EB, $04, $08, $A8, $1A
	db $03, $A0, $1A, $00, $85, $60, $8A, $40
	db $86, $50, $05, $21, $7C, $1A, $01, $A7
	db $13, $00, $12, $00, $02, $3C, $64, $10
	db $8F, $E0, $80, $20, $16, $04, $08, $C9
	db $1A, $03, $C1, $1A, $00, $85, $50, $8A
	db $40, $86, $70, $05, $21, $7C, $1A, $01
	db $A7, $13, $00, $12, $00, $02, $32, $14
	db $10, $8C, $EB, $80, $14, $16, $04, $06
	db $A8, $1A, $85, $50, $8A, $3E, $01, $1E
	db $13, $00, $12, $B8, $0F, $03, $01, $0B
	db $02, $10, $8C, $B7, $02, $0B, $04, $02
	db $04, $0C, $A0, $04, $A1, $04, $21, $3C
	db $1B, $01, $13, $13, $FC, $12, $1F, $0F
	db $03, $02, $11, $08, $10, $AF, $4B, $02
	db $17, $0C, $21, $D6, $1C, $01, $21, $13
	db $0C, $12, $AB, $10, $8A, $EF, $0F, $04
	db $02, $12, $08, $02, $04, $07, $A0, $04
	db $A1, $04, $21, $3C, $1B, $2B, $80, $02
	db $00, $2C, $80, $08, $03, $EA, $1A, $00
	db $A2, $10, $A2, $08, $A0, $08, $A2, $10
	db $A2, $08, $A0, $08, $A2, $08, $A5, $08
	db $A6, $08, $A7, $10, $A5, $08, $A2, $10
	db $9E, $10, $9E, $08, $9B, $08, $9E, $10
	db $9E, $08, $99, $08, $9B, $08, $9E, $08
	db $A0, $08, $A1, $10, $A0, $08, $9E, $10
	db $A2, $10, $A2, $08, $A0, $08, $A2, $10
	db $A2, $08, $A0, $08, $A2, $08, $A5, $08
	db $A6, $08, $A7, $10, $A5, $08, $A2, $08
	db $9E, $08, $9B, $10, $9E, $10, $A1, $08
	db $A0, $10, $9E, $08, $80, $3C, $99, $04
	db $9B, $10, $9E, $10, $A1, $08, $A0, $10
	db $9E, $08, $80, $1A, $A8, $03, $A9, $03
	db $AA, $20, $05, $21, $7C, $1A, $01, $A7
	db $13, $00, $12, $00, $02, $14, $32, $10
	db $8C, $E0, $80, $14, $80, $20, $16, $04
	db $04, $C9, $1A, $01, $A0, $13, $00, $12
	db $00, $10, $8F, $E0, $16, $02, $19, $19
	db $96, $04, $02, $23, $23, $96, $04, $04
	db $04, $4D, $1C, $04, $05, $4D, $1C, $04
	db $07, $4D, $1C, $21, $19, $1C, $04, $04
	db $4D, $1C, $21, $ED, $1B, $03, $D3, $1B
	db $00, $02, $32, $32, $96, $18, $02, $19
	db $19, $96, $04, $02, $23, $23, $96, $04
	db $02, $32, $32, $96, $18, $02, $19, $19
	db $96, $04, $02, $23, $23, $96, $04, $02
	db $32, $32, $96, $10, $96, $08, $96, $08
	db $96, $18, $80, $18, $05, $02, $32, $32
	db $96, $18, $02, $19, $19, $96, $04, $02
	db $23, $23, $96, $04, $02, $32, $32, $96
	db $18, $02, $19, $19, $96, $04, $02, $23
	db $23, $96, $04, $02, $32, $32, $96, $10
	db $96, $10, $96, $18, $80, $20, $02, $19
	db $19, $96, $04, $02, $23, $23, $96, $04
	db $05, $02, $32, $32, $96, $18, $02, $19
	db $19, $96, $04, $02, $23, $23, $96, $04
	db $02, $32, $32, $96, $18, $02, $19, $19
	db $96, $04, $02, $23, $23, $96, $04, $02
	db $32, $32, $96, $10, $96, $10, $96, $18
	db $02, $19, $19, $96, $04, $02, $23, $23
	db $96, $04, $05, $21, $7C, $1A, $2B, $80
	db $04, $34, $2B, $80, $02, $00, $2C, $01
	db $1E, $13, $00, $12, $B8, $0F, $03, $01
	db $0B, $02, $10, $8C, $B7, $16, $02, $21
	db $0B, $A0, $04, $A1, $04, $21, $3C, $1B
	db $01, $13, $13, $FC, $12, $1F, $0F, $03
	db $02, $11, $08, $10, $AF, $4B, $02, $28
	db $3C, $21, $D6, $1C, $01, $21, $13, $0C
	db $12, $AB, $10, $8A, $EF, $0F, $03, $03
	db $11, $08, $02, $14, $0A, $A0, $04, $A1
	db $04, $21, $3C, $1B, $80, $08, $03, $86
	db $1C, $00, $9B, $10, $9E, $0C, $80, $04
	db $9B, $10, $9E, $10, $9B, $0C, $80, $04
	db $9E, $08, $A1, $0E, $80, $02, $A0, $08
	db $9E, $08, $99, $28, $80, $20, $80, $40
	db $9B, $10, $9E, $0C, $80, $04, $9B, $10
	db $9E, $10, $9B, $0C, $80, $04, $9E, $08
	db $A1, $0E, $80, $02, $A0, $08, $9E, $08
	db $A0, $28, $80, $18, $A0, $05, $A1, $03
	db $A2, $10, $A2, $10, $A0, $08, $9E, $18
	db $9B, $10, $9E, $0C, $80, $04, $9B, $08
	db $9E, $10, $9B, $10, $80, $30, $A0, $08
	db $A2, $10, $A2, $0E, $80, $02, $A2, $08
	db $A5, $11, $80, $04, $A6, $03, $A7, $0C
	db $80, $04, $A2, $10, $A0, $08, $9E, $10
	db $80, $04, $9E, $04, $A0, $0C, $80, $04
	db $A2, $08, $A0, $10, $9B, $08, $9E, $10
	db $A0, $0C, $80, $04, $A2, $08, $A0, $10
	db $9B, $08, $9E, $10, $A0, $0E, $80, $02
	db $A0, $0F, $80, $01, $A0, $0E, $80, $02
	db $A0, $0F, $80, $01, $A2, $0F, $80, $01
	db $A0, $08, $A2, $08, $A3, $38, $05, $80
	db $C0, $02, $14, $C8, $8A, $80, $02, $C8
	db $19, $8F, $F0, $02, $19, $C8, $8E, $E0
	db $02, $C8, $19, $8D, $C0, $05, $21, $7C
	db $1A, $01, $A8, $13, $00, $12, $00, $10
	db $8F, $E0, $08, $12, $04, $0B, $0B, $00
	db $80, $80, $80, $80, $16, $04, $02, $7B
	db $1D, $03, $A9, $1D, $00, $21, $7C, $1A
	db $01, $9E, $13, $F4, $12, $00, $10, $8F
	db $EB, $16, $04, $02, $C6, $1D, $03, $BE
	db $1D, $00, $02, $76, $75, $80, $F0, $08
	db $16, $26, $21, $21, $00, $81, $F0, $84
	db $80, $02, $75, $76, $10, $8F, $E8, $82
	db $F0, $0A, $05, $21, $7C, $1A, $2B, $80
	db $04, $34, $2B, $80, $02, $00, $80, $02
	db $88, $2C, $01, $24, $13, $00, $12, $A9
	db $02, $46, $28, $10, $FE, $51, $16, $21
	db $9B, $1E, $01, $22, $13, $05, $12, $B6
	db $10, $CF, $51, $21, $0E, $1E, $03, $E6
	db $1D, $00, $04, $04, $82, $1E, $14, $F9
	db $04, $04, $82, $1E, $14, $07, $04, $04
	db $82, $1E, $14, $F9, $21, $82, $1E, $14
	db $02, $21, $82, $1E, $14, $05, $04, $02
	db $82, $1E, $14, $F9, $21, $82, $1E, $14
	db $02, $21, $82, $1E, $14, $05, $02, $26
	db $46, $96, $08, $92, $04, $02, $19, $0F
	db $96, $04, $02, $26, $3C, $96, $04, $02
	db $19, $0F, $92, $04, $02, $26, $3C, $99
	db $04, $02, $19, $0F, $96, $04, $02, $26
	db $3C, $9E, $04, $02, $19, $0F, $99, $08
	db $9E, $14, $80, $08, $05, $02, $26, $3C
	db $97, $08, $9B, $04, $02, $19, $0F, $97
	db $04, $02, $26, $3C, $9E, $04, $02, $19
	db $0F, $9B, $08, $9E, $04, $05, $02, $26
	db $3C, $92, $08, $96, $04, $02, $19, $0F
	db $92, $04, $02, $26, $3C, $99, $04, $02
	db $19, $0F, $96, $08, $99, $04, $05, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $92
	db $08, $99, $08, $9E, $08, $96, $08, $92
	db $08, $99, $08, $9E, $08, $96, $08, $92
	db $08, $99, $08, $9E, $08, $96, $08, $92
	db $08, $99, $08, $9E, $08, $96, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $99
	db $08, $9D, $08, $A5, $08, $A0, $08, $99
	db $08, $9D, $08, $A5, $08, $A0, $08, $92
	db $08, $99, $08, $9E, $08, $96, $08, $92
	db $08, $99, $08, $9E, $08, $96, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $97
	db $08, $9B, $08, $A3, $08, $9E, $08, $9A
	db $08, $9D, $08, $A6, $08, $A2, $08, $9A
	db $08, $9D, $08, $A6, $08, $A2, $08, $9B
	db $08, $9E, $08, $A7, $08, $A2, $08, $9B
	db $08, $9E, $08, $A7, $08, $A2, $08, $94
	db $08, $9B, $08, $A0, $08, $98, $08, $94
	db $08, $9B, $08, $A0, $08, $98, $08, $94
	db $08, $9B, $08, $A0, $08, $98, $08, $94
	db $08, $9B, $08, $A0, $08, $98, $08, $99
	db $08, $9D, $08, $A5, $08, $A0, $08, $99
	db $08, $9D, $08, $A5, $08, $A0, $08, $99
	db $08, $A2, $08, $A5, $08, $9D, $08, $99
	db $08, $9D, $08, $A0, $08, $A3, $08, $A5
	db $20, $05, $01, $21, $02, $0C, $1E, $13
	db $0C, $12, $AB, $10, $8A, $EF, $0F, $03
	db $03, $11, $08, $21, $B3, $1F, $00, $A2
	db $03, $A2, $15, $A2, $0E, $80, $02, $A0
	db $08, $A2, $15, $80, $03, $A2, $10, $A0
	db $08, $A2, $10, $A5, $08, $A6, $10, $A7
	db $18, $A5, $08, $A2, $10, $A0, $08, $9E
	db $15, $80, $03, $9E, $10, $9B, $08, $9E
	db $18, $80, $10, $99, $08, $9B, $10, $9E
	db $08, $A0, $10, $A1, $18, $A0, $08, $9E
	db $10, $9B, $08, $05, $01, $21, $02, $0C
	db $04, $13, $0C, $12, $AB, $10, $88, $E0
	db $0F, $04, $02, $17, $08, $80, $0A, $21
	db $B3, $1F, $00

DATA_EE6007:
	db $00, $13, $9E, $07, $71, $19, $E0, $1A
	db $E2, $1C, $47, $1F, $DA, $1D, $10, $20
	db $C0, $20, $78, $21, $A0, $FF, $00, $13
	db $1C, $13, $2E, $13, $40, $13, $52, $13
	db $A6, $18, $C9, $18, $D9, $18, $0F, $19
	db $F0, $18, $2E, $19, $3F, $19, $49, $19
	db $C0, $FF, $CE, $15, $54, $16, $28, $17
	db $7A, $17, $26, $16, $5C, $18, $32, $18
	db $D1, $16, $DE, $FF, $5A, $14, $BF, $14
	db $F9, $14, $6E, $15, $98, $14, $AC, $15
	db $BD, $15, $8D, $15, $C0, $FF, $64, $13
	db $AE, $13, $C1, $13, $DE, $13, $F4, $13
	db $2C, $14, $0A, $14, $1F, $14, $C0, $FF
	db $15, $37, $20, $20, $18, $7F, $0A, $00
	db $00, $00, $00, $00, $00, $22, $A5, $00
	db $00, $46, $46, $8F, $E0, $9E, $09, $17
	db $01, $00, $23, $3C, $97, $07, $97, $09
	db $01, $A5, $23, $46, $9E, $10, $9E, $07
	db $9E, $05, $17, $01, $00, $23, $3C, $97
	db $05, $97, $06, $01, $A5, $23, $46, $9E
	db $17, $23, $1E, $9E, $03, $23, $28, $9E
	db $03, $23, $32, $9E, $03, $23, $46, $9E
	db $10, $00, $22, $14, $E4, $02, $7A, $7A
	db $CE, $AF, $8C, $19, $8D, $17, $8F, $10
	db $88, $20, $88, $10, $00, $21, $86, $18
	db $13, $F0, $16, $A0, $09, $9B, $07, $9D
	db $09, $A0, $10, $A2, $07, $A4, $05, $A7
	db $04, $A9, $06, $AC, $19, $80, $07, $AC
	db $10, $00, $21, $8F, $18, $02, $28, $1E
	db $10, $AF, $AE, $A0, $19, $A0, $17, $A4
	db $10, $A0, $19, $80, $07, $A0, $10, $00
	db $21, $8F, $18, $02, $1E, $28, $10, $AF
	db $AE, $9B, $19, $9D, $17, $9F, $10, $9B
	db $19, $80, $07, $9B, $10, $00, $21, $8F
	db $18, $23, $23, $10, $AF, $AE, $98, $19
	db $99, $17, $9B, $10, $98, $19, $80, $07
	db $98, $10, $00, $21, $86, $18, $13, $F0
	db $02, $08, $11, $80, $14, $03, $C6, $13
	db $22, $AE, $00, $00, $0A, $14, $FF, $58
	db $04, $03, $47, $14, $9E, $09, $9E, $03
	db $9E, $03, $9E, $03, $04, $02, $47, $14
	db $9E, $10, $00, $9E, $09, $9D, $07, $05
	db $15, $2C, $17, $17, $18, $7F, $01, $00
	db $00, $00, $00, $00, $00, $05, $21, $4C
	db $14, $21, $8F, $18, $23, $1E, $08, $00
	db $04, $08, $2B, $00, $9D, $25, $0A, $13
	db $00, $12, $1E, $10, $8F, $D2, $04, $03
	db $87, $14, $16, $01, $A5, $23, $6C, $9E
	db $10, $17, $01, $00, $23, $50, $97, $10
	db $03, $76, $14, $16, $01, $A5, $23, $6C
	db $9F, $08, $17, $01, $00, $23, $50, $97
	db $08, $99, $08, $05, $21, $8F, $18, $23
	db $1E, $08, $00, $04, $08, $20, $00, $98
	db $25, $0A, $22, $AE, $00, $00, $14, $1E
	db $AF, $B2, $06, $18, $9A, $9A, $9A, $9A
	db $07, $10, $8F, $F8, $99, $08, $97, $08
	db $03, $B8, $14, $21, $8F, $18, $23, $1E
	db $08, $00, $04, $08, $1F, $00, $94, $25
	db $0A, $22, $14, $E4, $02, $7A, $7A, $CE
	db $AF, $06, $08, $8A, $8A, $8A, $85, $85
	db $88, $88, $8A, $87, $8A, $8B, $04, $10
	db $F5, $14, $04, $08, $F7, $14, $88, $88
	db $88, $88, $8A, $8A, $8A, $8A, $03, $E2
	db $14, $8C, $05, $85, $05, $21, $8F, $18
	db $23, $64, $09, $00, $04, $05, $22, $00
	db $91, $25, $0A, $01, $8F, $13, $F8, $12
	db $FC, $02, $32, $46, $21, $14, $15, $00
	db $10, $EF, $80, $80, $58, $08, $01, $02
	db $08, $21, $00, $A2, $10, $A2, $10, $A2
	db $0F, $04, $02, $58, $15, $21, $64, $15
	db $0F, $04, $02, $11, $05, $A4, $0F, $80
	db $01, $A4, $07, $21, $64, $15, $A4, $08
	db $08, $01, $02, $08, $2C, $00, $A7, $10
	db $A7, $10, $A7, $10, $10, $EE, $40, $A7
	db $10, $10, $EC, $20, $A7, $10, $10, $EB
	db $00, $A7, $10, $05, $08, $00, $01, $08
	db $2B, $00, $9F, $09, $0A, $9F, $07, $05
	db $08, $00, $01, $08, $39, $00, $A4, $09
	db $0A, $05, $21, $8F, $18, $23, $0A, $08
	db $00, $04, $08, $2B, $00, $80, $05, $9D
	db $20, $0A, $01, $8F, $13, $F8, $12, $FC
	db $02, $1C, $12, $80, $0F, $21, $14, $15
	db $00, $21, $8F, $18, $23, $0A, $08, $00
	db $04, $08, $20, $00, $80, $05, $98, $20
	db $0A, $01, $8F, $13, $F8, $12, $FC, $02
	db $08, $0E, $80, $1E, $21, $14, $15, $00
	db $21, $8F, $18, $23, $0A, $08, $00, $04
	db $08, $1F, $00, $80, $05, $94, $30, $0A
	db $00, $21, $8F, $18, $23, $28, $09, $00
	db $04, $05, $22, $00, $80, $05, $91, $30
	db $0A, $00, $21, $4C, $14, $21, $8F, $18
	db $23, $1E, $08, $00, $04, $08, $2D, $00
	db $9E, $20, $0A, $13, $00, $12, $1E, $10
	db $8F, $D2, $04, $0C, $EB, $15, $00, $17
	db $01, $00, $23, $50, $97, $10, $94, $10
	db $16, $01, $A5, $23, $6C, $9E, $10, $17
	db $01, $00, $23, $50, $96, $09, $16, $01
	db $A5, $23, $26, $A5, $10, $A4, $07, $01
	db $00, $23, $50, $17, $98, $09, $16, $01
	db $A5, $23, $26, $A3, $07, $23, $6C, $9E
	db $10, $23, $26, $A4, $09, $23, $2C, $A5
	db $07, $05, $21, $8F, $18, $23, $1E, $08
	db $00, $04, $08, $1D, $00, $9A, $20, $0A
	db $13, $00, $12, $00, $01, $AE, $02, $14
	db $1E, $06, $10, $04, $0C, $45, $16, $07
	db $00, $10, $8F, $F8, $99, $97, $9A, $97
	db $99, $96, $98, $10, $8F, $C5, $9A, $05
	db $21, $8F, $18, $23, $1E, $08, $00, $04
	db $08, $11, $00, $97, $20, $0A, $13, $00
	db $06, $10, $04, $06, $6B, $16, $00, $21
	db $78, $16, $21, $B4, $16, $21, $78, $16
	db $21, $C5, $16, $05, $01, $05, $23, $4A
	db $10, $8F, $E0, $09, $01, $01, $0B, $0B
	db $00, $8D, $0A, $01, $07, $23, $11, $21
	db $AB, $16, $01, $01, $10, $8E, $EF, $88
	db $01, $07, $10, $8F, $E0, $21, $AB, $16
	db $01, $02, $23, $12, $10, $8E, $EF, $87
	db $01, $03, $10, $8F, $EF, $88, $05, $08
	db $02, $01, $16, $16, $00, $9A, $0A, $05
	db $01, $08, $23, $12, $10, $8E, $EF, $8A
	db $01, $06, $23, $15, $10, $8E, $E0, $82
	db $05, $21, $BC, $16, $01, $08, $23, $12
	db $10, $8E, $EF, $8E, $05, $21, $8F, $18
	db $23, $64, $09, $00, $03, $05, $2B, $00
	db $93, $20, $0A, $80, $05, $13, $00, $12
	db $1E, $10, $8F, $D2, $04, $0C, $ED, $16
	db $00, $17, $01, $00, $23, $1B, $97, $10
	db $94, $10, $16, $01, $A5, $23, $24, $9E
	db $10, $17, $01, $00, $23, $1B, $96, $09
	db $16, $01, $A5, $23, $0C, $A5, $10, $A4
	db $07, $01, $00, $23, $1B, $17, $98, $09
	db $16, $01, $A5, $23, $0C, $A3, $07, $23
	db $24, $9E, $10, $23, $0C, $A4, $09, $23
	db $11, $A5, $07, $05, $21, $8F, $18, $23
	db $0A, $08, $00, $04, $08, $2D, $00, $80
	db $05, $9E, $1B, $0A, $01, $14, $13, $E4
	db $12, $02, $23, $7A, $10, $CE, $AF, $1C
	db $8B, $1D, $97, $04, $02, $5C, $17, $1C
	db $84, $1D, $90, $04, $02, $5C, $17, $1C
	db $8B, $1D, $97, $04, $02, $5C, $17, $00
	db $21, $6B, $17, $80, $24, $21, $6B, $17
	db $80, $04, $89, $10, $8A, $10, $05, $E0
	db $0C, $80, $04, $E0, $0C, $80, $14, $E0
	db $0C, $80, $14, $E0, $0C, $05, $21, $8F
	db $18, $23, $0A, $08, $00, $04, $08, $1D
	db $00, $80, $05, $9A, $1B, $0A, $16, $02
	db $14, $3C, $10, $8F, $E0, $80, $78, $21
	db $E8, $17, $21, $D2, $17, $21, $86, $18
	db $02, $14, $1E, $04, $02, $A4, $17, $00
	db $10, $8E, $E0, $80, $18, $9A, $04, $9B
	db $04, $9C, $1C, $80, $04, $9A, $10, $97
	db $0C, $80, $04, $80, $18, $9A, $04, $9B
	db $04, $9C, $10, $9A, $10, $9C, $08, $9E
	db $08, $80, $08, $9A, $14, $80, $04, $99
	db $10, $97, $10, $80, $10, $05, $21, $16
	db $18, $95, $10, $21, $1D, $18, $97, $10
	db $21, $24, $18, $97, $08, $95, $10, $21
	db $2B, $18, $97, $40, $21, $2B, $18, $97
	db $08, $21, $16, $18, $95, $10, $21, $1D
	db $18, $97, $10, $21, $24, $18, $97, $08
	db $21, $16, $18, $99, $10, $21, $1D, $18
	db $9A, $10, $21, $2B, $18, $9A, $08, $21
	db $24, $18, $99, $10, $21, $2B, $18, $97
	db $20, $05, $01, $01, $13, $02, $12, $F2
	db $05, $01, $02, $13, $FE, $12, $18, $05
	db $01, $03, $13, $FD, $12, $00, $05, $01
	db $04, $13, $FC, $12, $FE, $05, $21, $8F
	db $18, $23, $0A, $08, $00, $04, $08, $11
	db $00, $80, $05, $97, $1B, $0A, $16, $80
	db $7F, $02, $17, $08, $10, $8F, $E0, $21
	db $E8, $17, $21, $D2, $17, $21, $86, $18
	db $02, $0B, $06, $04, $02, $A4, $17, $00
	db $21, $8F, $18, $23, $28, $09, $00, $03
	db $05, $2B, $00, $80, $05, $93, $1B, $0A
	db $16, $02, $04, $0B, $10, $8F, $E0, $80
	db $87, $21, $E8, $17, $21, $D2, $17, $21
	db $86, $18, $02, $03, $07, $04, $02, $A4
	db $17, $00, $22, $B3, $FC, $F6, $30, $15
	db $8F, $F2, $05, $22, $14, $F0, $FE, $28
	db $1E, $8C, $E8, $05, $15, $3A, $21, $21
	db $18, $7F, $01, $01, $01, $01, $01, $01
	db $01, $05, $21, $98, $18, $22, $B2, $02
	db $F2, $2D, $19, $8E, $E0, $16, $9E, $08
	db $A0, $08, $A1, $10, $A0, $10, $9E, $10
	db $9C, $08, $9B, $08, $97, $10, $9A, $10
	db $9B, $10, $9C, $50, $00, $80, $10, $04
	db $02, $A9, $1A, $01, $AD, $23, $3C, $10
	db $8F, $E0, $90, $40, $00, $22, $B2, $F6
	db $F2, $6E, $6E, $8F, $EE, $80, $10, $8B
	db $20, $8B, $20, $8B, $10, $8E, $10, $8F
	db $10, $90, $A0, $00, $80, $10, $13, $05
	db $12, $E8, $10, $8F, $E0, $16, $1C, $A1
	db $1D, $A1, $21, $E2, $21, $1C, $A0, $1D
	db $A0, $21, $E2, $21, $10, $EE, $40, $21
	db $E2, $21, $00, $80, $10, $13, $05, $12
	db $E8, $10, $8F, $E0, $16, $1C, $9E, $1D
	db $9E, $21, $E2, $21, $1C, $9A, $1D, $9A
	db $21, $E2, $21, $10, $EE, $40, $21, $E2
	db $21, $00, $13, $02, $12, $F2, $01, $B2
	db $02, $08, $0F, $10, $8E, $E0, $80, $14
	db $03, $B1, $18, $80, $10, $04, $02, $D8
	db $1E, $21, $A1, $1F, $00, $80, $10, $13
	db $05, $12, $E8, $10, $8F, $E0, $16, $1C
	db $97, $1D, $97, $21, $E2, $21, $1C, $97
	db $1D, $97, $21, $E2, $21, $10, $EF, $40
	db $21, $E2, $21, $00, $80, $10, $05, $17
	db $23, $00, $80, $10, $05, $1F, $02, $24
	db $56, $21, $68, $19, $21, $98, $18, $80
	db $80, $80, $80, $13, $00, $12, $00, $04
	db $0C, $A9, $1A, $16, $22, $B3, $FC, $F6
	db $1C, $0B, $BC, $8F, $21, $CC, $19, $13
	db $00, $12, $00, $04, $08, $A9, $1A, $01
	db $2F, $13, $00, $10, $DF, $B4, $04, $08
	db $D2, $1C, $80, $04, $22, $B2, $F6, $F2
	db $2D, $19, $8E, $E0, $21, $67, $1B, $9B
	db $2C, $01, $AD, $23, $3C, $10, $8F, $E0
	db $99, $08, $96, $08, $99, $10, $99, $08
	db $96, $08, $94, $10, $03, $7F, $19, $00
	db $80, $0E, $02, $14, $0E, $9E, $10, $02
	db $05, $0A, $9B, $08, $9D, $08, $9E, $10
	db $02, $05, $03, $9B, $08, $21, $95, $1A
	db $9D, $10, $02, $14, $0E, $99, $18, $02
	db $05, $0A, $99, $08, $02, $14, $0E, $96
	db $18, $02, $05, $0A, $96, $08, $02, $14
	db $0E, $9B, $18, $02, $05, $0A, $9B, $10
	db $02, $05, $03, $9B, $08, $02, $14, $0E
	db $9D, $10, $9E, $10, $02, $05, $0A, $9D
	db $10, $9E, $10, $02, $05, $03, $9D, $08
	db $21, $95, $1A, $02, $14, $0E, $99, $10
	db $9B, $10, $02, $05, $0A, $99, $10, $9B
	db $10, $02, $05, $03, $99, $10, $9B, $10
	db $02, $01, $04, $99, $10, $9B, $10, $02
	db $14, $0E, $10, $BE, $91, $9B, $08, $9D
	db $08, $9E, $10, $02, $05, $0A, $9B, $08
	db $9D, $08, $9E, $10, $02, $05, $03, $9B
	db $08, $21, $95, $1A, $9D, $10, $02, $14
	db $0E, $A2, $10, $02, $05, $0A, $A2, $10
	db $02, $05, $03, $A2, $10, $02, $14, $0E
	db $A3, $08, $A2, $08, $A0, $10, $A2, $08
	db $A0, $08, $9E, $10, $9B, $08, $9D, $08
	db $9E, $10, $02, $05, $0A, $9B, $08, $9D
	db $08, $9E, $10, $02, $05, $03, $9B, $08
	db $21, $95, $1A, $02, $14, $0E, $99, $02
	db $05, $02, $14, $0E, $A0, $08, $9D, $10
	db $02, $05, $0A, $A0, $08, $9D, $10, $02
	db $05, $03, $A0, $08, $05, $01, $AD, $23
	db $3C, $10, $8F, $E0, $90, $20, $01, $AE
	db $23, $32, $10, $8F, $E0, $91, $10, $10
	db $8C, $E0, $23, $0B, $91, $08, $01, $AD
	db $23, $3C, $10, $8F, $E0, $92, $08, $90
	db $10, $90, $10, $01, $AE, $23, $32, $10
	db $8F, $E0, $91, $10, $10, $8C, $E0, $23
	db $0B, $91, $10, $05, $21, $68, $19, $01
	db $2F, $13, $00, $10, $DF, $B4, $04, $04
	db $D2, $1C, $04, $0E, $D2, $1C, $13, $05
	db $12, $E8, $01, $3F, $10, $DF, $53, $21
	db $94, $1C, $80, $04, $AA, $04, $80, $B8
	db $21, $94, $1C, $80, $04, $AA, $04, $80
	db $B8, $21, $94, $1C, $80, $04, $AA, $04
	db $80, $28, $16, $22, $B3, $FC, $F6, $28
	db $32, $BE, $91, $9B, $08, $9D, $08, $21
	db $B9, $1B, $17, $04, $04, $59, $1B, $13
	db $05, $12, $E8, $01, $3F, $10, $DF, $53
	db $21, $5F, $1B, $80, $38, $21, $5F, $1B
	db $80, $38, $21, $5F, $1B, $80, $38, $21
	db $5F, $1B, $80, $28, $22, $B2, $F6, $F2
	db $5A, $6E, $8E, $E0, $04, $01, $67, $1B
	db $9B, $80, $03, $EE, $1A, $21, $9E, $1B
	db $80, $38, $05, $21, $94, $1C, $80, $04
	db $AA, $04, $05, $9B, $10, $9E, $30, $A0
	db $10, $9D, $40, $99, $20, $96, $20, $9B
	db $30, $9D, $10, $9E, $30, $A0, $10, $9D
	db $20, $99, $20, $9B, $60, $80, $10, $9D
	db $10, $9E, $30, $A0, $10, $9D, $40, $A2
	db $20, $A3, $10, $A2, $10, $A0, $20, $9D
	db $20, $9E, $30, $A0, $10, $9D, $20, $99
	db $20, $05, $22, $8B, $F8, $F2, $7F, $7F
	db $CF, $70, $83, $80, $13, $05, $12, $E8
	db $01, $3F, $10, $DF, $53, $21, $94, $1C
	db $80, $04, $AA, $04, $05, $02, $28, $3C
	db $9E, $10, $02, $1C, $10, $9B, $08, $9D
	db $08, $9E, $10, $02, $08, $0E, $9B, $08
	db $21, $80, $1C, $9D, $10, $02, $28, $3C
	db $99, $18, $02, $1C, $10, $99, $08, $02
	db $28, $3C, $96, $18, $02, $1C, $10, $96
	db $08, $02, $28, $3C, $9B, $18, $02, $1C
	db $10, $9B, $10, $02, $08, $0E, $9B, $08
	db $02, $28, $3C, $9D, $10, $9E, $10, $02
	db $1C, $10, $9D, $10, $9E, $10, $02, $08
	db $0E, $9D, $08, $21, $80, $1C, $02, $28
	db $3C, $99, $10, $9B, $10, $02, $1C, $10
	db $99, $10, $9B, $10, $02, $08, $0E, $99
	db $10, $9B, $10, $02, $07, $04, $99, $10
	db $9B, $10, $02, $28, $3C, $10, $BE, $91
	db $9B, $08, $9D, $08, $9E, $10, $02, $1C
	db $10, $9B, $08, $9D, $08, $9E, $10, $02
	db $08, $0E, $9B, $08, $21, $80, $1C, $9D
	db $10, $02, $28, $3C, $A2, $10, $02, $1C
	db $10, $A2, $10, $02, $08, $0E, $A2, $10
	db $02, $28, $3C, $A3, $08, $A2, $08, $A0
	db $10, $A2, $08, $A0, $08, $9E, $10, $9B
	db $08, $9D, $08, $9E, $10, $02, $1C, $10
	db $9B, $08, $9D, $08, $9E, $10, $02, $08
	db $0E, $9B, $08, $21, $80, $1C, $02, $28
	db $3C, $99, $10, $05, $02, $28, $3C, $A0
	db $08, $9D, $10, $02, $1C, $10, $A0, $08
	db $9D, $10, $02, $08, $0E, $A0, $08, $05
	db $02, $32, $14, $8F, $08, $06, $04, $92
	db $02, $08, $15, $8F, $02, $32, $14, $96
	db $02, $08, $15, $92, $02, $32, $14, $9B
	db $02, $08, $15, $96, $02, $32, $14, $9E
	db $02, $08, $15, $9B, $02, $32, $14, $A2
	db $02, $08, $15, $9E, $02, $32, $14, $A7
	db $02, $08, $15, $A2, $02, $32, $14, $AA
	db $02, $08, $15, $A7, $07, $05, $06, $10
	db $23, $28, $90, $23, $0F, $90, $23, $32
	db $85, $23, $11, $85, $07, $05, $21, $68
	db $19, $80, $80, $80, $80, $22, $8B, $F8
	db $F2, $7F, $7F, $CF, $70, $04, $03, $33
	db $1D, $83, $58, $22, $18, $FB, $D4, $64
	db $64, $9F, $75, $92, $08, $94, $08, $92
	db $08, $94, $10, $04, $02, $91, $1D, $21
	db $36, $1D, $01, $18, $13, $FB, $12, $D4
	db $10, $9F, $75, $04, $02, $91, $1D, $22
	db $14, $E4, $02, $7F, $7F, $8B, $E0, $04
	db $04, $33, $1D, $21, $36, $1D, $1C, $8F
	db $04, $02, $65, $1D, $03, $E9, $1C, $83
	db $80, $05, $21, $50, $1D, $21, $45, $1D
	db $1C, $8F, $04, $02, $65, $1D, $21, $50
	db $1D, $1C, $8B, $21, $65, $1D, $1C, $8D
	db $21, $65, $1D, $05, $1C, $8B, $21, $65
	db $1D, $1C, $8D, $21, $65, $1D, $1C, $8A
	db $21, $65, $1D, $1C, $8F, $21, $65, $1D
	db $05, $22, $18, $FB, $D4, $64, $64, $9F
	db $75, $06, $08, $E0, $22, $47, $F9, $E8
	db $3C, $3C, $9F, $92, $E0, $01, $49, $E0
	db $01, $4B, $E0, $23, $1A, $E0, $01, $4D
	db $23, $3C, $E0, $23, $1A, $E0, $01, $4F
	db $23, $3C, $E0, $07, $05, $10, $9F, $73
	db $23, $50, $9B, $58, $21, $CC, $1D, $10
	db $9F, $73, $23, $50, $9B, $10, $99, $08
	db $9B, $40, $21, $CC, $1D, $9B, $58, $10
	db $9F, $75, $23, $64, $92, $08, $94, $08
	db $92, $08, $94, $10, $10, $9F, $73, $23
	db $50, $9B, $08, $9B, $08, $99, $08, $9B
	db $50, $23, $64, $92, $08, $94, $10, $05
	db $10, $9F, $75, $23, $64, $92, $08, $94
	db $08, $92, $08, $94, $10, $05, $21, $68
	db $19, $13, $00, $12, $00, $04, $02, $D8
	db $1E, $04, $13, $D8, $1E, $16, $22, $B4
	db $F8, $F2, $3C, $3C, $9E, $C0, $9B, $10
	db $02, $14, $0A, $21, $7D, $1E, $80, $60
	db $22, $B4, $F8, $F2, $32, $32, $9E, $C0
	db $99, $10, $9B, $10, $02, $0F, $14, $21
	db $7D, $1E, $80, $70, $17, $13, $00, $12
	db $00, $04, $0F, $D8, $1E, $80, $40, $22
	db $B4, $F8, $F2, $3C, $28, $9E, $C0, $9B
	db $08, $99, $08, $9B, $10, $9B, $08, $99
	db $08, $9B, $10, $13, $00, $12, $00, $03
	db $E5, $1D, $13, $11, $12, $E8, $10, $8B
	db $E0, $01, $4C, $08, $00, $01, $0C, $52
	db $00, $A0, $10, $01, $4E, $08, $00, $01
	db $0A, $58, $00, $9E, $10, $01, $4F, $08
	db $00, $01, $0C, $52, $00, $A0, $08, $01
	db $4D, $08, $00, $01, $05, $50, $00, $9D
	db $10, $9D, $08, $01, $4B, $08, $00, $01
	db $0A, $58, $00, $9E, $10, $01, $49, $08
	db $00, $01, $09, $52, $00, $9B, $10, $0A
	db $05, $13, $11, $12, $E8, $10, $8B, $E0
	db $01, $41, $08, $00, $01, $0C, $52, $00
	db $A0, $10, $01, $43, $08, $00, $01, $0A
	db $58, $00, $9E, $10, $01, $45, $08, $00
	db $01, $0C, $52, $00, $A0, $08, $01, $47
	db $08, $00, $01, $05, $50, $00, $9D, $10
	db $9D, $08, $01, $48, $08, $00, $01, $0A
	db $58, $00, $9E, $10, $01, $49, $08, $00
	db $01, $09, $52, $00, $9B, $10, $01, $4A
	db $09, $00, $01, $08, $52, $00, $9B, $10
	db $01, $4B, $08, $00, $01, $08, $52, $00
	db $99, $10, $0A, $05, $02, $1E, $14, $10
	db $AB, $51, $01, $0D, $8D, $10, $02, $0A
	db $28, $10, $AF, $51, $01, $1A, $81, $08
	db $02, $0A, $08, $10, $CF, $34, $01, $2B
	db $B0, $10, $02, $32, $14, $10, $CF, $37
	db $01, $AE, $8D, $08, $02, $08, $14, $10
	db $AF, $2B, $01, $2F, $A8, $08, $02, $3C
	db $0A, $85, $10, $02, $1E, $14, $10, $AC
	db $37, $01, $0D, $95, $08, $02, $04, $14
	db $10, $AF, $51, $01, $1A, $A1, $08, $02
	db $0A, $08, $10, $CF, $34, $01, $2B, $B0
	db $10, $02, $32, $14, $10, $CF, $37, $01
	db $AE, $8D, $08, $02, $08, $14, $10, $AF
	db $2B, $01, $2F, $A8, $08, $02, $3C, $0A
	db $85, $08, $05, $21, $68, $19, $80, $0C
	db $04, $02, $A1, $1F, $04, $13, $A1, $1F
	db $16, $22, $B4, $F8, $F2, $17, $17, $9E
	db $C0, $9B, $10, $02, $03, $08, $21, $7D
	db $1E, $80, $60, $22, $B4, $F8, $F2, $14
	db $14, $9E, $C0, $99, $10, $9B, $10, $02
	db $08, $03, $21, $7D, $1E, $80, $70, $17
	db $13, $00, $12, $00, $04, $0F, $A1, $1F
	db $80, $40, $22, $B4, $F8, $F2, $0A, $1E
	db $9E, $C0, $9B, $08, $99, $08, $9B, $10
	db $9B, $08, $99, $08, $9B, $10, $13, $00
	db $12, $00, $03, $50, $1F, $02, $03, $0B
	db $10, $AB, $51, $01, $0D, $8D, $10, $02
	db $0E, $02, $10, $AF, $51, $01, $1A, $81
	db $08, $02, $01, $04, $10, $CF, $34, $01
	db $2B, $B0, $10, $02, $06, $11, $10, $CF
	db $37, $01, $AE, $8D, $08, $02, $05, $02
	db $10, $AF, $2B, $01, $2F, $A8, $08, $02
	db $03, $12, $85, $10, $02, $05, $09, $10
	db $AC, $37, $01, $0D, $95, $08, $02, $07
	db $02, $10, $AF, $51, $01, $1A, $A1, $08
	db $02, $01, $03, $10, $CF, $34, $01, $2B
	db $B0, $10, $02, $05, $11, $10, $CF, $37
	db $01, $AE, $8D, $08, $02, $05, $01, $10
	db $AF, $2B, $01, $2F, $A8, $08, $02, $03
	db $12, $85, $08, $05, $21, $68, $19, $80
	db $80, $80, $80, $80, $C0, $80, $C0, $22
	db $AE, $F8, $00, $3C, $64, $BE, $4B, $80
	db $08, $98, $10, $98, $18, $94, $08, $94
	db $10, $02, $64, $3C, $90, $08, $90, $10
	db $90, $08, $8E, $08, $02, $32, $50, $85
	db $10, $13, $05, $12, $E8, $10, $8F, $E0
	db $04, $04, $B1, $20, $22, $14, $F0, $02
	db $26, $0A, $88, $E8, $21, $9A, $20, $13
	db $05, $12, $E8, $10, $8F, $E0, $04, $04
	db $B1, $20, $16, $22, $3F, $11, $E8, $0C
	db $14, $8B, $E0, $08, $00, $01, $08, $52
	db $00, $99, $10, $21, $7D, $1E, $02, $0A
	db $05, $21, $7D, $1E, $02, $0C, $14, $21
	db $7D, $1E, $02, $0A, $05, $21, $36, $1E
	db $80, $10, $22, $14, $F0, $02, $14, $06
	db $86, $E8, $14, $0C, $21, $9A, $20, $A2
	db $80, $14, $F4, $03, $17, $20, $9E, $40
	db $9D, $80, $9B, $40, $9E, $40, $A0, $40
	db $A2, $80, $9E, $40, $9D, $80, $9B, $40
	db $9E, $40, $A0, $40, $05, $1C, $9B, $1D
	db $9E, $21, $E2, $21, $1C, $9B, $1D, $A0
	db $21, $E2, $21, $05, $21, $68, $19, $80
	db $80, $80, $80, $80, $C0, $80, $C0, $01
	db $AE, $10, $BD, $45, $13, $F8, $12, $00
	db $80, $0E, $02, $11, $1E, $80, $08, $98
	db $10, $98, $18, $94, $08, $94, $10, $02
	db $1E, $11, $90, $08, $90, $10, $90, $08
	db $8E, $08, $02, $0B, $1C, $85, $02, $13
	db $05, $12, $E8, $10, $8F, $E0, $04, $04
	db $69, $21, $22, $14, $F0, $02, $0A, $26
	db $88, $E8, $21, $52, $21, $13, $05, $12
	db $E8, $10, $8F, $E0, $04, $04, $69, $21
	db $80, $0E, $16, $22, $3F, $11, $E8, $08
	db $04, $8B, $E0, $08, $00, $01, $08, $52
	db $00, $99, $10, $21, $7D, $1E, $02, $02
	db $05, $21, $7D, $1E, $02, $08, $04, $21
	db $7D, $1E, $02, $02, $05, $21, $36, $1E
	db $80, $02, $22, $14, $F0, $02, $06, $14
	db $86, $E8, $14, $0C, $21, $52, $21, $9E
	db $80, $14, $F4, $03, $C7, $20, $9B, $40
	db $99, $80, $96, $40, $9B, $40, $9D, $40
	db $9E, $80, $9B, $40, $99, $80, $96, $40
	db $9B, $40, $9D, $40, $05, $1C, $9E, $1D
	db $A0, $21, $E2, $21, $1C, $A2, $1D, $A4
	db $21, $E2, $21, $05, $21, $68, $19, $80
	db $80, $80, $80, $80, $80, $80, $C0, $80
	db $C0, $13, $05, $12, $E8, $10, $8F, $E0
	db $04, $04, $D3, $21, $23, $18, $10, $88
	db $E8, $21, $BB, $21, $13, $05, $12, $E8
	db $10, $8F, $E0, $04, $04, $D3, $21, $80
	db $80, $80, $C0, $80, $C0, $23, $0F, $10
	db $86, $E8, $14, $0C, $21, $BB, $21, $9B
	db $80, $14, $F4, $03, $7F, $21, $00, $01
	db $14, $13, $F0, $12, $02, $06, $40, $97
	db $94, $96, $92, $97, $99, $9D, $9B, $97
	db $94, $96, $92, $97, $99, $07, $05, $1C
	db $A2, $1D, $A4, $21, $E2, $21, $1C, $A5
	db $1D, $A5, $21, $E2, $21, $05, $06, $08
	db $02, $06, $0E, $01, $49, $E0, $01, $39
	db $E0, $01, $3B, $E0, $01, $3D, $E0, $01
	db $4F, $E0, $02, $07, $02, $E0, $02, $06
	db $0E, $01, $49, $06, $04, $E0, $02, $07
	db $02, $E0, $02, $06, $0E, $01, $4A, $06
	db $08, $E0, $02, $07, $02, $E0, $02, $06
	db $0E, $01, $4B, $E0, $02, $07, $02, $E0
	db $02, $06, $0E, $01, $4C, $E0, $02, $06
	db $0E, $01, $4E, $E1, $02, $06, $0E, $01
	db $48, $E1, $02, $06, $0E, $01, $4B, $E1
	db $02, $06, $0E, $01, $4D, $E1, $07, $05

DATA_EE6F47:
	db $00, $13, $A1, $02, $52, $13, $E0, $13
	db $42, $14, $CB, $15, $8E, $16, $02, $18
	db $64, $17, $5E, $16, $BD, $FF, $00, $13
	db $15, $3A, $23, $23, $18, $7F, $0A, $01
	db $01, $01, $01, $01, $01, $01, $7A, $13
	db $11, $12, $E8, $02, $50, $50, $10, $DF
	db $4F, $99, $10, $99, $10, $99, $10, $99
	db $10, $99, $10, $99, $10, $99, $10, $99
	db $10, $99, $10, $99, $10, $99, $10, $99
	db $10, $99, $10, $99, $10, $99, $10, $99
	db $10, $00, $00, $80, $10, $05, $1F, $08
	db $21, $4F, $13, $24, $6E, $15, $3A, $23
	db $23, $18, $7F, $0A, $01, $01, $01, $01
	db $01, $01, $01, $7B, $13, $00, $12, $00
	db $02, $6F, $6F, $10, $8F, $E0, $87, $08
	db $80, $78, $80, $50, $87, $08, $80, $10
	db $87, $08, $80, $10, $87, $08, $80, $08
	db $01, $7C, $13, $03, $12, $02, $02, $0F
	db $28, $10, $8F, $E0, $91, $18, $8C, $18
	db $8A, $10, $80, $28, $01, $7B, $13, $00
	db $12, $00, $02, $3C, $3C, $87, $08, $04
	db $03, $CC, $13, $01, $A5, $13, $00, $12
	db $00, $02, $50, $50, $99, $09, $9A, $07
	db $99, $09, $98, $07, $01, $7B, $13, $00
	db $12, $00, $02, $6F, $6F, $10, $8F, $E0
	db $04, $10, $DD, $13, $03, $66, $13, $00
	db $01, $A5, $02, $50, $50, $99, $10, $01
	db $7B, $02, $5A, $5A, $87, $08, $80, $08
	db $05, $87, $80, $05, $21, $4F, $13, $16
	db $01, $7D, $13, $00, $12, $00, $02, $32
	db $32, $10, $8F, $E0, $01, $7D, $13, $FF
	db $12, $07, $96, $80, $80, $50, $94, $18
	db $95, $18, $96, $80, $94, $20, $94, $20
	db $94, $20, $94, $10, $95, $10, $96, $10
	db $02, $28, $0A, $10, $8F, $E0, $01, $7E
	db $13, $00, $12, $00, $90, $20, $80, $50
	db $80, $80, $80, $80, $80, $80, $80, $10
	db $91, $20, $80, $50, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $03, $E4, $13, $00, $21, $4F
	db $13, $02, $3C, $1E, $10, $8F, $E0, $1C
	db $96, $21, $4F, $15, $21, $86, $15, $21
	db $4F, $15, $21, $86, $15, $21, $4F, $15
	db $21, $86, $15, $04, $02, $86, $15, $21
	db $CB, $14, $21, $C2, $14, $21, $CB, $14
	db $21, $C2, $14, $21, $CB, $14, $21, $C2
	db $14, $21, $CB, $14, $21, $C2, $14, $03
	db $4B, $14, $00, $01, $84, $13, $FC, $12
	db $09, $E0, $10, $01, $80, $13, $FD, $12
	db $EA, $E1, $08, $01, $7F, $13, $FD, $12
	db $E9, $E1, $08, $05, $01, $84, $13, $FC
	db $12, $14, $E0, $10, $01, $80, $13, $FD
	db $12, $F5, $E1, $08, $01, $7F, $13, $FD
	db $12, $F4, $E1, $08, $05, $04, $02, $F9
	db $14, $04, $03, $0A, $15, $05, $21, $D3
	db $14, $04, $03, $0A, $15, $05, $04, $02
	db $75, $15, $04, $03, $86, $15, $05, $21
	db $4F, $15, $04, $03, $86, $15, $05, $21
	db $F9, $14, $01, $80, $13, $FD, $12, $EC
	db $01, $80, $E0, $09, $01, $81, $13, $FD
	db $12, $03, $E0, $07, $01, $82, $13, $FC
	db $12, $09, $E0, $09, $01, $83, $13, $FD
	db $12, $03, $E0, $07, $05, $13, $FC, $12
	db $09, $01, $84, $E0, $19, $01, $83, $13
	db $FD, $12, $03, $E0, $07, $05, $01, $7F
	db $13, $FD, $12, $FF, $01, $7F, $E0, $09
	db $01, $81, $13, $FD, $12, $03, $E0, $07
	db $01, $82, $13, $FC, $12, $09, $E0, $09
	db $01, $83, $13, $FD, $12, $03, $E0, $07
	db $01, $80, $13, $FD, $12, $EC, $01, $80
	db $E0, $09, $01, $81, $13, $FD, $12, $03
	db $E0, $07, $01, $82, $13, $FC, $12, $09
	db $E0, $09, $01, $83, $13, $FD, $12, $03
	db $E0, $07, $05, $21, $75, $15, $01, $80
	db $13, $FD, $12, $F5, $01, $80, $E0, $09
	db $01, $81, $13, $FD, $12, $0E, $E0, $07
	db $01, $82, $13, $FC, $12, $14, $E0, $09
	db $01, $83, $13, $FD, $12, $0E, $E0, $07
	db $05, $13, $FC, $12, $14, $01, $84, $E0
	db $19, $01, $83, $13, $FD, $12, $0E, $E0
	db $07, $05, $01, $7F, $13, $FD, $12, $F4
	db $01, $7F, $E0, $09, $01, $81, $13, $FD
	db $12, $0E, $E0, $07, $01, $82, $13, $FC
	db $12, $14, $E0, $09, $01, $83, $13, $FD
	db $12, $0E, $E0, $07, $01, $80, $13, $FD
	db $12, $F5, $01, $80, $E0, $09, $01, $81
	db $13, $FD, $12, $0E, $E0, $07, $01, $82
	db $13, $FC, $12, $14, $E0, $09, $01, $83
	db $13, $FD, $12, $0E, $E0, $07, $05, $21
	db $4F, $13, $01, $7C, $13, $03, $12, $02
	db $02, $0F, $28, $10, $8F, $E0, $80, $10
	db $91, $18, $8C, $18, $8A, $10, $80, $B0
	db $01, $18, $13, $FB, $12, $D4, $02, $64
	db $64, $10, $8F, $EF, $09, $14, $01, $1E
	db $16, $00, $96, $38, $80, $C8, $0A, $04
	db $04, $03, $16, $03, $CE, $15, $00, $02
	db $5A, $5A, $10, $8F, $EF, $09, $14, $01
	db $1E, $16, $00, $96, $39, $0A, $10, $8F
	db $F2, $96, $07, $96, $19, $80, $20, $96
	db $07, $96, $19, $80, $20, $96, $07, $96
	db $10, $96, $19, $94, $17, $02, $64, $64
	db $10, $8F, $EF, $92, $21, $80, $18, $10
	db $8F, $F2, $92, $07, $92, $19, $80, $20
	db $92, $07, $8F, $10, $8F, $10, $91, $10
	db $91, $10, $92, $10, $92, $10, $02, $50
	db $50, $94, $06, $80, $03, $02, $28, $28
	db $A0, $04, $80, $03, $02, $50, $50, $95
	db $10, $05, $21, $4F, $13, $01, $85, $13
	db $00, $12, $00, $02, $28, $50, $10, $8F
	db $E0, $80, $20, $04, $28, $79, $16, $80
	db $20, $03, $61, $16, $00, $02, $28, $50
	db $8E, $09, $02, $14, $0A, $8E, $07, $02
	db $08, $0A, $8E, $09, $02, $05, $04, $8E
	db $27, $05, $21, $4F, $13, $0E, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $01, $7A
	db $13, $11, $12, $E8, $02, $08, $18, $10
	db $DF, $55, $9B, $09, $9C, $07, $9D, $09
	db $A0, $10, $A0, $07, $9D, $09, $9C, $07
	db $A0, $10, $A0, $10, $A0, $09, $A2, $17
	db $01, $7C, $13, $03, $12, $02, $02, $21
	db $0B, $10, $8F, $E0, $80, $10, $94, $19
	db $91, $10, $01, $7A, $13, $11, $12, $E8
	db $02, $08, $18, $10, $DF, $55, $9D, $07
	db $A0, $10, $A0, $10, $A0, $09, $A2, $17
	db $80, $80, $01, $7A, $13, $11, $12, $E8
	db $02, $28, $28, $10, $DF, $55, $83, $10
	db $8F, $10, $85, $10, $91, $10, $86, $10
	db $92, $10, $94, $10, $95, $10, $01, $7C
	db $13, $03, $12, $02, $02, $21, $0B, $10
	db $8F, $E0, $80, $30, $94, $10, $96, $10
	db $80, $30, $01, $7A, $13, $11, $12, $E8
	db $02, $08, $18, $10, $DF, $55, $9B, $09
	db $9C, $07, $9D, $09, $A0, $10, $A0, $07
	db $9D, $09, $9C, $07, $A0, $10, $A0, $10
	db $A0, $09, $A2, $17, $80, $80, $9B, $09
	db $9C, $07, $9D, $09, $A0, $10, $A0, $07
	db $9D, $09, $9C, $07, $A0, $10, $A0, $10
	db $A0, $09, $A2, $17, $03, $91, $16, $00
	db $21, $4F, $13, $0E, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $80, $80, $01, $7A, $13, $11
	db $12, $DD, $02, $11, $0A, $10, $DF, $55
	db $80, $02, $9B, $09, $9C, $07, $9D, $09
	db $A0, $10, $A0, $07, $9D, $09, $9C, $07
	db $A0, $10, $A0, $10, $A0, $09, $A2, $17
	db $80, $39, $9D, $07, $A0, $10, $A0, $10
	db $A0, $09, $A2, $17, $80, $80, $02, $28
	db $28, $10, $AF, $56, $83, $10, $8F, $10
	db $85, $10, $91, $10, $86, $10, $92, $10
	db $94, $10, $95, $10, $02, $14, $0C, $10
	db $CF, $56, $80, $80, $9B, $09, $9C, $07
	db $9D, $09, $A0, $10, $A0, $07, $9D, $09
	db $9C, $07, $A0, $10, $A0, $10, $A0, $09
	db $A2, $17, $80, $80, $9B, $09, $9C, $07
	db $9D, $09, $A0, $10, $A0, $07, $9D, $09
	db $9C, $07, $A0, $10, $A0, $10, $A0, $09
	db $A2, $15, $03, $67, $17, $00, $21, $4F
	db $13, $02, $14, $28, $10, $8F, $E0, $80
	db $02, $1C, $96, $21, $D3, $14, $21, $0A
	db $15, $21, $D3, $14, $21, $0A, $15, $21
	db $D3, $14, $21, $0A, $15, $04, $02, $0A
	db $15, $21, $BA, $14, $21, $B1, $14, $21
	db $BA, $14, $21, $B1, $14, $21, $BA, $14
	db $21, $B1, $14, $21, $BA, $14, $21, $B1
	db $14, $03, $0D, $18, $00

DATA_EE748C:
	db $00, $13, $71, $08, $C4, $1B, $E3, $22
	db $5E, $1E, $6D, $1D, $8C, $1C, $1C, $22
	db $1D, $1D, $D1, $1C, $A8, $FF, $00, $13
	db $1E, $13, $30, $13, $42, $13, $54, $13
	db $66, $13, $F7, $1A, $04, $1B, $1D, $1B
	db $3C, $1B, $8A, $1B, $96, $1B, $A8, $1B
	db $59, $1B, $C0, $FF, $1A, $18, $9F, $18
	db $77, $19, $C8, $19, $72, $18, $AD, $1A
	db $7F, $1A, $20, $19, $DE, $FF, $9E, $16
	db $03, $17, $40, $17, $AE, $17, $DC, $16
	db $EA, $17, $FB, $17, $CC, $17, $C0, $FF
	db $BF, $15, $FF, $15, $14, $16, $32, $16
	db $48, $16, $7E, $16, $5E, $16, $73, $16
	db $C0, $FF, $7B, $13, $9E, $15, $8D, $13
	db $67, $14, $33, $15, $6D, $15, $CE, $14
	db $F1, $13, $DA, $FF, $80, $10, $05, $21
	db $0C, $18, $80, $10, $21, $CF, $1D, $21
	db $E8, $1D, $99, $08, $98, $08, $03, $80
	db $13, $80, $10, $0B, $DA, $21, $E7, $13
	db $04, $06, $BF, $13, $13, $FB, $04, $04
	db $A1, $13, $03, $8F, $13, $04, $04, $B5
	db $13, $21, $AC, $13, $04, $04, $BA, $13
	db $A4, $08, $A4, $08, $A4, $08, $A4, $08
	db $05, $A2, $08, $A2, $10, $05, $A5, $08
	db $A5, $10, $05, $04, $02, $C6, $13, $14
	db $01, $05, $21, $D8, $13, $99, $10, $9B
	db $10, $21, $D8, $13, $06, $08, $96, $98
	db $99, $9B, $07, $05, $80, $10, $9D, $10
	db $9B, $10, $98, $08, $99, $10, $99, $10
	db $98, $08, $05, $22, $28, $FC, $F2, $1E
	db $28, $CE, $CE, $16, $05, $80, $10, $21
	db $E7, $13, $04, $06, $34, $14, $13, $FB
	db $04, $04, $03, $14, $03, $F3, $13, $9D
	db $08, $9D, $10, $9D, $08, $9D, $10, $9D
	db $08, $9D, $10, $9D, $08, $9D, $10, $A0
	db $08, $A0, $08, $A0, $08, $A0, $08, $A2
	db $08, $A2, $10, $A2, $08, $A2, $10, $A2
	db $08, $A2, $10, $A2, $08, $A2, $10, $A0
	db $08, $A0, $08, $A0, $08, $A0, $08, $05
	db $04, $02, $3B, $14, $14, $01, $05, $21
	db $4E, $14, $96, $10, $98, $10, $21, $4E
	db $14, $91, $08, $94, $08, $96, $08, $98
	db $08, $05, $80, $10, $99, $10, $98, $10
	db $94, $08, $96, $10, $96, $10, $94, $08
	db $05, $13, $00, $01, $A6, $10, $9F, $AB
	db $23, $46, $05, $1C, $96, $1D, $8A, $21
	db $98, $14, $1C, $97, $1D, $8B, $21, $98
	db $14, $1C, $98, $1D, $8C, $21, $98, $14
	db $1C, $99, $1D, $8D, $21, $98, $14, $1C
	db $9A, $1D, $8E, $21, $98, $14, $1C, $9B
	db $1D, $8F, $21, $98, $14, $04, $08, $BA
	db $14, $03, $67, $14, $21, $5D, $14, $8D
	db $0A, $8F, $86, $21, $E9, $1A, $23, $7F
	db $10, $8F, $E0, $14, $F4, $09, $01, $02
	db $78, $02, $00, $E0, $80, $0A, $E1, $10
	db $80, $10, $E1, $50, $0C, $01, $21, $5D
	db $14, $96, $0A, $98, $0E, $9A, $18, $98
	db $18, $94, $18, $90, $18, $8F, $08, $0C
	db $01, $05, $1C, $96, $1D, $8A, $21, $FF
	db $14, $1C, $97, $1D, $8B, $21, $FF, $14
	db $1C, $98, $1D, $8C, $21, $FF, $14, $1C
	db $99, $1D, $8D, $21, $FF, $14, $1C, $9A
	db $1D, $8E, $21, $FF, $14, $1C, $9B, $1D
	db $8F, $21, $FF, $14, $04, $08, $21, $15
	db $03, $CE, $14, $21, $5D, $14, $80, $05
	db $8E, $8B, $80, $0B, $21, $E9, $1A, $23
	db $28, $10, $8F, $E0, $14, $F4, $09, $01
	db $02, $7F, $02, $00, $E0, $80, $0A, $E1
	db $10, $80, $10, $E1, $45, $21, $5D, $14
	db $80, $05, $97, $0B, $9A, $18, $98, $18
	db $94, $18, $90, $18, $8F, $10, $05, $80
	db $10, $22, $50, $EF, $2E, $78, $78, $AE
	db $F5, $1C, $8A, $04, $20, $6A, $15, $1C
	db $8B, $04, $20, $6A, $15, $1C, $8C, $04
	db $20, $6A, $15, $1C, $8D, $04, $20, $6A
	db $15, $1C, $8E, $04, $20, $6A, $15, $1C
	db $8F, $04, $20, $6A, $15, $1C, $88, $04
	db $40, $6A, $15, $03, $3D, $15, $E0, $10
	db $05, $80, $10, $21, $57, $1E, $16, $10
	db $EF, $51, $04, $06, $83, $15, $13, $00
	db $04, $20, $8A, $15, $03, $76, $15, $04
	db $10, $8A, $15, $14, $01, $05, $06, $08
	db $02, $11, $0B, $A2, $02, $03, $08, $9D
	db $02, $11, $0B, $9D, $02, $03, $08, $A2
	db $07, $05, $80, $10, $12, $E9, $13, $11
	db $23, $7F, $10, $AE, $A0, $13, $02, $04
	db $06, $B8, $15, $13, $01, $04, $08, $A2
	db $23, $03, $A9, $15, $04, $04, $A2, $23
	db $14, $01, $05, $21, $0C, $18, $22, $A5
	db $00, $00, $46, $46, $8F, $E0, $9E, $09
	db $17, $01, $00, $23, $3C, $97, $07, $97
	db $09, $01, $A5, $23, $46, $9E, $10, $9E
	db $07, $9E, $05, $17, $01, $00, $23, $3C
	db $97, $05, $97, $06, $01, $A5, $23, $46
	db $9E, $17, $23, $1E, $9E, $03, $23, $28
	db $9E, $03, $23, $32, $9E, $03, $23, $46
	db $9E, $10, $00, $21, $E9, $1A, $14, $F4
	db $23, $7A, $10, $CE, $AF, $8C, $19, $8D
	db $17, $8F, $10, $88, $20, $88, $10, $00
	db $21, $DB, $1A, $02, $30, $15, $16, $A0
	db $09, $9B, $07, $9D, $09, $A0, $10, $A2
	db $07, $A4, $05, $A7, $04, $A9, $06, $AC
	db $19, $80, $07, $AC, $10, $00, $21, $F0
	db $1A, $02, $28, $1E, $10, $AF, $AE, $A0
	db $19, $A0, $17, $A4, $10, $A0, $19, $80
	db $07, $A0, $10, $00, $21, $F0, $1A, $02
	db $1E, $28, $10, $AF, $AE, $9B, $19, $9D
	db $17, $9F, $10, $9B, $19, $80, $07, $9B
	db $10, $00, $21, $F0, $1A, $23, $23, $10
	db $AF, $AE, $98, $19, $99, $17, $9B, $10
	db $98, $19, $80, $07, $98, $10, $00, $21
	db $DB, $1A, $02, $08, $11, $80, $14, $03
	db $1A, $16, $22, $2E, $00, $00, $0A, $14
	db $FF, $58, $04, $03, $99, $16, $9E, $09
	db $9E, $03, $9E, $03, $9E, $03, $04, $02
	db $99, $16, $9E, $10, $00, $9E, $09, $9D
	db $07, $05, $21, $0C, $18, $21, $F0, $1A
	db $23, $1E, $08, $00, $04, $08, $2B, $00
	db $9D, $25, $0A, $13, $00, $12, $1E, $10
	db $8F, $D2, $04, $03, $CB, $16, $16, $01
	db $A5, $23, $6C, $9E, $10, $17, $01, $00
	db $23, $50, $97, $10, $03, $BA, $16, $16
	db $01, $A5, $23, $6C, $9F, $08, $17, $01
	db $00, $23, $50, $97, $08, $99, $08, $05
	db $21, $F0, $1A, $23, $1E, $08, $00, $04
	db $08, $20, $00, $98, $25, $0A, $22, $2E
	db $00, $FE, $14, $1E, $AF, $B2, $06, $18
	db $9A, $9A, $9A, $9A, $07, $10, $8F, $F8
	db $99, $08, $97, $08, $03, $FC, $16, $21
	db $F0, $1A, $23, $1E, $08, $00, $04, $08
	db $1F, $00, $94, $25, $0A, $21, $E9, $1A
	db $14, $F4, $23, $7B, $10, $CE, $AF, $06
	db $08, $8A, $8A, $8A, $85, $85, $88, $88
	db $8A, $87, $8A, $8B, $04, $10, $3C, $17
	db $04, $08, $3E, $17, $88, $88, $88, $88
	db $8A, $8A, $8A, $8A, $03, $28, $17, $00
	db $8C, $05, $85, $05, $21, $F0, $1A, $23
	db $64, $09, $00, $04, $05, $22, $00, $91
	db $25, $0A, $22, $8F, $F8, $FC, $32, $46
	db $EF, $80, $21, $5A, $17, $00, $80, $58
	db $08, $01, $02, $08, $21, $00, $A2, $10
	db $A2, $10, $A2, $0F, $04, $02, $98, $17
	db $21, $A4, $17, $0F, $04, $02, $11, $05
	db $A4, $0F, $80, $01, $A4, $07, $21, $A4
	db $17, $A4, $08, $08, $01, $02, $08, $2C
	db $00, $06, $10, $A7, $A7, $A7, $10, $EE
	db $40, $A7, $10, $EC, $20, $A7, $10, $EB
	db $00, $A7, $07, $05, $08, $00, $01, $08
	db $2B, $00, $9F, $09, $0A, $9F, $07, $05
	db $08, $00, $01, $08, $39, $00, $A4, $09
	db $0A, $05, $21, $F0, $1A, $23, $0A, $08
	db $00, $04, $08, $2B, $00, $80, $05, $9D
	db $20, $0A, $22, $8F, $F8, $FC, $1C, $12
	db $EF, $80, $80, $0F, $21, $5A, $17, $00
	db $21, $F0, $1A, $23, $0A, $08, $00, $04
	db $08, $20, $00, $80, $05, $98, $20, $0A
	db $22, $8F, $F8, $FC, $08, $0E, $EF, $80
	db $80, $1E, $21, $5A, $17, $00, $21, $F0
	db $1A, $23, $0A, $08, $00, $04, $08, $1F
	db $00, $80, $05, $94, $30, $0A, $00, $21
	db $F0, $1A, $23, $28, $09, $00, $04, $05
	db $22, $00, $80, $05, $91, $30, $0A, $00
	db $15, $2C, $17, $17, $18, $7F, $01, $00
	db $00, $00, $00, $00, $00, $05, $21, $0C
	db $18, $21, $F0, $1A, $23, $1E, $08, $00
	db $04, $08, $2D, $00, $9E, $20, $0A, $13
	db $00, $12, $1E, $10, $8F, $D2, $04, $0C
	db $37, $18, $00, $17, $01, $00, $23, $50
	db $97, $10, $94, $10, $16, $01, $A5, $23
	db $6C, $9E, $10, $17, $01, $00, $23, $50
	db $96, $09, $16, $01, $A5, $23, $26, $A5
	db $10, $A4, $07, $01, $00, $23, $50, $17
	db $98, $09, $16, $01, $A5, $23, $26, $A3
	db $07, $23, $6C, $9E, $10, $23, $26, $A4
	db $09, $23, $2C, $A5, $07, $05, $21, $F0
	db $1A, $23, $1E, $08, $00, $04, $08, $1D
	db $00, $9A, $20, $0A, $22, $2E, $00, $00
	db $14, $1E, $8F, $F8, $06, $10, $04, $0C
	db $90, $18, $07, $00, $10, $8F, $F8, $99
	db $97, $9A, $97, $99, $96, $98, $10, $8F
	db $C5, $9A, $05, $21, $F0, $1A, $23, $1E
	db $08, $00, $04, $08, $11, $00, $97, $20
	db $0A, $13, $00, $06, $10, $04, $06, $B6
	db $18, $00, $21, $C3, $18, $21, $FD, $18
	db $21, $C3, $18, $21, $10, $19, $05, $01
	db $05, $23, $4A, $10, $8F, $E0, $09, $01
	db $01, $0B, $0B, $00, $8D, $0A, $23, $11
	db $21, $F2, $18, $01, $01, $10, $8E, $EF
	db $88, $10, $8F, $E0, $21, $F2, $18, $01
	db $02, $23, $12, $10, $8E, $EF, $87, $01
	db $03, $10, $8F, $EF, $88, $05, $01, $07
	db $08, $02, $01, $16, $16, $00, $9A, $0A
	db $05, $21, $18, $19, $00, $00, $00, $00
	db $00, $00, $8A, $01, $06, $23, $15, $10
	db $8E, $E0, $82, $05, $21, $07, $19, $21
	db $18, $19, $8E, $05, $01, $08, $23, $12
	db $10, $8E, $EF, $05, $21, $F0, $1A, $23
	db $64, $09, $00, $03, $05, $2B, $00, $93
	db $20, $0A, $80, $05, $13, $00, $12, $1E
	db $10, $8F, $D2, $04, $0C, $3C, $19, $00
	db $17, $01, $00, $23, $1B, $97, $10, $94
	db $10, $16, $01, $A5, $23, $24, $9E, $10
	db $17, $01, $00, $23, $1B, $96, $09, $16
	db $01, $A5, $23, $0C, $A5, $10, $A4, $07
	db $01, $00, $23, $1B, $17, $98, $09, $16
	db $01, $A5, $23, $0C, $A3, $07, $23, $24
	db $9E, $10, $23, $0C, $A4, $09, $23, $11
	db $A5, $07, $05, $21, $F0, $1A, $23, $0A
	db $08, $00, $04, $08, $2D, $00, $80, $05
	db $9E, $1B, $0A, $21, $E9, $1A, $14, $F4
	db $23, $7B, $10, $CE, $AF, $1C, $8B, $1D
	db $97, $04, $02, $AA, $19, $1C, $84, $1D
	db $90, $04, $02, $AA, $19, $1C, $8B, $1D
	db $97, $04, $02, $AA, $19, $00, $21, $B9
	db $19, $80, $24, $21, $B9, $19, $80, $04
	db $89, $10, $8A, $10, $05, $E0, $0C, $80
	db $04, $E0, $0C, $80, $14, $E0, $0C, $80
	db $14, $E0, $0C, $05, $21, $F0, $1A, $23
	db $0A, $08, $00, $04, $08, $1D, $00, $80
	db $05, $9A, $1B, $0A, $16, $02, $14, $3C
	db $10, $8F, $E0, $80, $78, $21, $35, $1A
	db $21, $1F, $1A, $21, $DB, $1A, $13, $FC
	db $04, $02, $F1, $19, $00, $10, $8E, $E0
	db $80, $18, $9A, $04, $9B, $04, $9C, $1C
	db $80, $04, $9A, $10, $97, $0C, $80, $04
	db $80, $18, $9A, $04, $9B, $04, $9C, $10
	db $9A, $10, $9C, $08, $9E, $08, $80, $08
	db $9A, $14, $80, $04, $99, $10, $97, $10
	db $80, $10, $05, $21, $6A, $1A, $95, $10
	db $21, $71, $1A, $97, $10, $21, $78, $1A
	db $97, $08, $95, $10, $21, $63, $1A, $97
	db $40, $21, $63, $1A, $97, $08, $21, $6A
	db $1A, $95, $10, $21, $71, $1A, $97, $10
	db $21, $78, $1A, $97, $08, $21, $6A, $1A
	db $99, $10, $21, $71, $1A, $9A, $10, $21
	db $63, $1A, $9A, $08, $21, $78, $1A, $99
	db $10, $21, $63, $1A, $97, $20, $05, $01
	db $04, $13, $FC, $12, $FE, $05, $01, $01
	db $13, $02, $12, $F2, $05, $01, $02, $13
	db $FE, $12, $18, $05, $01, $03, $13, $FD
	db $12, $00, $05, $21, $F0, $1A, $23, $0A
	db $08, $00, $04, $08, $11, $00, $80, $05
	db $97, $1B, $0A, $16, $80, $07, $02, $17
	db $08, $10, $8F, $E0, $80, $78, $21, $35
	db $1A, $21, $1F, $1A, $21, $DB, $1A, $13
	db $FC, $02, $0B, $06, $04, $02, $F1, $19
	db $00, $21, $F0, $1A, $23, $28, $09, $00
	db $03, $05, $2B, $00, $80, $05, $93, $1B
	db $0A, $16, $80, $0F, $02, $04, $0B, $10
	db $8F, $E0, $80, $78, $21, $35, $1A, $21
	db $1F, $1A, $21, $DB, $1A, $13, $FC, $02
	db $03, $07, $04, $02, $F1, $19, $00, $22
	db $1B, $F0, $02, $14, $1E, $8F, $E0, $0F
	db $04, $02, $0A, $07, $05, $01, $14, $13
	db $F0, $12, $FE, $05, $21, $E9, $1A, $10
	db $8C, $E8, $05, $21, $B6, $1B, $80, $10
	db $21, $04, $1E, $04, $02, $B6, $1D, $00
	db $80, $10, $21, $E9, $1A, $10, $AE, $A0
	db $23, $6A, $13, $11, $12, $E9, $14, $FE
	db $21, $A2, $23, $14, $F9, $21, $A2, $23
	db $00, $0F, $04, $02, $0A, $07, $22, $1B
	db $FC, $02, $3C, $1E, $FF, $60, $9E, $08
	db $A0, $08, $A1, $10, $A0, $10, $9E, $18
	db $9B, $08, $21, $7B, $1B, $9A, $50, $00
	db $21, $50, $1E, $02, $1E, $32, $10, $8E
	db $EE, $80, $10, $9E, $20, $9E, $10, $9E
	db $08, $9E, $08, $21, $7B, $1B, $04, $04
	db $84, $1B, $9A, $0C, $00, $21, $50, $1E
	db $02, $1E, $32, $10, $8E, $EE, $80, $10
	db $9B, $20, $9B, $10, $9B, $08, $9B, $08
	db $92, $10, $92, $10, $97, $10, $97, $20
	db $04, $04, $87, $1B, $97, $0C, $00, $97
	db $10, $99, $10, $9B, $10, $9C, $20, $05
	db $9A, $18, $05, $97, $18, $05, $21, $50
	db $1E, $02, $17, $08, $10, $8E, $EE, $03
	db $45, $1B, $0F, $04, $02, $0A, $07, $22
	db $1B, $FC, $02, $08, $17, $FE, $60, $80
	db $14, $03, $2A, $1B, $21, $50, $1E, $02
	db $17, $08, $10, $8E, $EE, $80, $0E, $03
	db $62, $1B, $15, $37, $2C, $2C, $18, $58
	db $BF, $DB, $E0, $FE, $01, $2C, $2C, $05
	db $1F, $00, $24, $64, $21, $78, $13, $21
	db $B6, $1B, $01, $8B, $10, $8F, $FA, $13
	db $08, $12, $F2, $16, $04, $07, $1E, $1C
	db $04, $05, $E7, $1B, $21, $1E, $1C, $03
	db $D8, $1B, $00, $04, $03, $FE, $1B, $21
	db $13, $1C, $05, $23, $70, $10, $CF, $70
	db $13, $F0, $8A, $10, $14, $18, $10, $8F
	db $FA, $05, $21, $EF, $1B, $21, $31, $1C
	db $21, $08, $1C, $05, $02, $03, $0A, $94
	db $08, $02, $04, $01, $94, $08, $05, $21
	db $EF, $1B, $21, $31, $1C, $04, $02, $67
	db $1C, $05, $04, $03, $54, $1C, $21, $5D
	db $1C, $05, $02, $20, $40, $E0, $08, $02
	db $18, $08, $E0, $08, $05, $1C, $98, $21
	db $26, $1C, $1C, $99, $21, $26, $1C, $02
	db $03, $0A, $99, $08, $1C, $98, $21, $26
	db $1C, $02, $03, $0A, $98, $08, $1C, $99
	db $21, $26, $1C, $1C, $94, $03, $26, $1C
	db $80, $10, $21, $31, $1C, $21, $08, $1C
	db $05, $80, $10, $21, $31, $1C, $04, $02
	db $67, $1C, $05, $02, $1A, $3A, $A0, $04
	db $02, $14, $06, $A0, $04, $05, $16, $22
	db $15, $FC, $03, $28, $10, $81, $EA, $05
	db $E0, $01, $00, $E1, $01, $00, $05, $99
	db $80, $9D, $80, $9E, $C0, $A0, $40, $05
	db $21, $78, $13, $21, $72, $1C, $0F, $02
	db $03, $08, $05, $2B, $1C, $9D, $1D, $A0
	db $04, $02, $7C, $1C, $2C, $04, $04, $BE
	db $1C, $21, $83, $1C, $2B, $1C, $9D, $1D
	db $9D, $04, $02, $7C, $1C, $2C, $04, $02
	db $BE, $1C, $04, $02, $83, $1C, $03, $97
	db $1C, $00, $9D, $80, $94, $80, $A0, $80
	db $9D, $80, $05, $96, $00, $80, $99, $01
	db $40, $9B, $00, $40, $05, $21, $78, $13
	db $21, $72, $1C, $02, $20, $18, $0F, $03
	db $02, $0B, $05, $2B, $1C, $99, $1D, $9D
	db $04, $02, $7C, $1C, $04, $04, $03, $1D
	db $21, $C7, $1C, $1C, $99, $1D, $98, $04
	db $02, $7C, $1C, $04, $02, $03, $1D, $04
	db $02, $C7, $1C, $03, $E0, $1C, $00, $99
	db $00, $80, $9B, $01, $00, $99, $00, $40
	db $98, $00, $40, $05, $92, $00, $80, $94
	db $00, $80, $96, $00, $C0, $98, $00, $40
	db $05, $21, $78, $13, $21, $72, $1C, $02
	db $10, $28, $0F, $02, $02, $0F, $05, $2B
	db $1C, $94, $1D, $98, $04, $02, $7C, $1C
	db $04, $04, $4F, $1D, $21, $10, $1D, $1C
	db $94, $1D, $94, $04, $02, $7C, $1C, $04
	db $02, $4F, $1D, $04, $02, $10, $1D, $03
	db $2C, $1D, $00, $96, $00, $80, $98, $01
	db $00, $94, $00, $80, $05, $86, $00, $80
	db $14, $F4, $8C, $00, $80, $14, $0C, $85
	db $00, $80, $8A, $00, $40, $88, $00, $40
	db $05, $21, $78, $13, $16, $21, $E9, $1A
	db $23, $40, $10, $85, $E8, $2B, $8A, $01
	db $00, $8D, $01, $00, $8A, $01, $00, $81
	db $01, $00, $04, $02, $59, $1D, $80, $06
	db $00, $2C, $04, $14, $04, $1E, $01, $2E
	db $13, $02, $02, $1C, $2C, $04, $02, $B6
	db $1D, $02, $15, $21, $04, $02, $B6, $1D
	db $02, $0E, $16, $04, $02, $B6, $1D, $02
	db $07, $0B, $04, $02, $B6, $1D, $03, $71
	db $1D, $00, $80, $08, $10, $DF, $57, $99
	db $08, $10, $AF, $6B, $99, $10, $10, $DF
	db $57, $99, $08, $98, $08, $10, $AF, $6B
	db $99, $10, $05, $17, $01, $00, $23, $50
	db $10, $FF, $20, $13, $08, $8D, $08, $16
	db $05, $22, $2E, $02, $00, $17, $26, $DF
	db $57, $99, $08, $05, $22, $2E, $02, $00
	db $11, $1C, $DF, $59, $99, $08, $05, $22
	db $A5, $00, $00, $4A, $60, $DF, $CA, $99
	db $08, $05, $10, $AF, $6B, $99, $10, $05
	db $21, $CF, $1D, $21, $DD, $1D, $21, $FE
	db $1D, $21, $F3, $1D, $21, $DD, $1D, $10
	db $AF, $6B, $99, $08, $21, $CF, $1D, $21
	db $DD, $1D, $21, $CF, $1D, $8C, $08, $21
	db $DD, $1D, $21, $F3, $1D, $21, $DD, $1D
	db $21, $FE, $1D, $05, $22, $33, $FC, $19
	db $0E, $06, $FE, $80, $05, $22, $1B, $FC
	db $02, $11, $19, $FF, $60, $05, $13, $11
	db $12, $E9, $10, $8E, $3C, $21, $EF, $21
	db $21, $BF, $21, $05, $01, $B3, $13, $FC
	db $12, $F6, $05, $01, $8E, $13, $01, $12
	db $F2, $05, $21, $78, $13, $16, $2B, $80
	db $02, $00, $2C, $21, $42, $1E, $01, $34
	db $13, $03, $12, $FE, $10, $9F, $8A, $21
	db $64, $20, $02, $04, $0C, $10, $AA, $6A
	db $21, $7D, $20, $21, $57, $1E, $10, $9F
	db $8A, $21, $DD, $1F, $02, $0C, $04, $10
	db $AA, $6A, $21, $7D, $20, $0F, $04, $02
	db $0A, $07, $21, $39, $1E, $02, $32, $23
	db $21, $DA, $20, $21, $30, $1E, $02, $0A
	db $17, $21, $19, $21, $21, $39, $1E, $02
	db $32, $23, $21, $27, $21, $21, $30, $1E
	db $02, $11, $1B, $21, $D0, $1F, $21, $39
	db $1E, $02, $32, $23, $21, $BE, $1F, $21
	db $30, $1E, $02, $11, $1B, $21, $B4, $1F
	db $06, $80, $9D, $80, $80, $80, $07, $21
	db $42, $1E, $21, $50, $1E, $10, $DE, $D1
	db $21, $63, $1F, $02, $3C, $64, $21, $80
	db $1F, $21, $30, $1E, $02, $11, $1B, $21
	db $D0, $1F, $21, $39, $1E, $02, $32, $23
	db $21, $BE, $1F, $21, $30, $1E, $02, $11
	db $1B, $21, $B4, $1F, $9D, $40, $21, $D0
	db $1F, $21, $39, $1E, $02, $32, $23, $21
	db $BE, $1F, $21, $30, $1E, $02, $0A, $1B
	db $21, $27, $1F, $02, $11, $06, $9D, $20
	db $9E, $10, $02, $03, $08, $9B, $20, $03
	db $62, $1E, $00, $99, $10, $96, $15, $98
	db $16, $99, $15, $9D, $20, $9E, $10, $05
	db $9D, $10, $9B, $10, $99, $08, $9B, $18
	db $05, $9D, $10, $9B, $10, $99, $08, $9B
	db $08, $05, $80, $40, $02, $21, $11, $9B
	db $10, $21, $34, $1F, $02, $0A, $11, $21
	db $34, $1F, $02, $0F, $07, $21, $34, $1F
	db $02, $03, $08, $21, $3D, $1F, $05, $80
	db $40, $02, $3C, $64, $9B, $10, $21, $34
	db $1F, $02, $32, $1E, $21, $34, $1F, $02
	db $14, $28, $21, $34, $1F, $02, $17, $0B
	db $21, $3D, $1F, $05, $06, $10, $9B, $9D
	db $A0, $9D, $07, $9B, $30, $9D, $08, $9B
	db $08, $99, $20, $98, $10, $99, $10, $A2
	db $50, $A2, $20, $9D, $10, $9B, $50, $94
	db $20, $A0, $10, $A0, $40, $A0, $15, $A2
	db $16, $A4, $15, $A4, $20, $A5, $10, $A4
	db $20, $A0, $10, $9D, $10, $A2, $50, $05
	db $21, $27, $1F, $9D, $20, $9B, $20, $99
	db $10, $05, $99, $10, $98, $16, $99, $15
	db $9D, $15, $08, $00, $01, $0B, $1B, $00
	db $A0, $30, $0A, $05, $99, $16, $9B, $15
	db $9D, $15, $21, $D3, $20, $9E, $30, $0A
	db $05, $21, $1A, $20, $80, $80, $80, $80
	db $1C, $A5, $21, $FF, $1F, $1C, $A4, $21
	db $FF, $1F, $1C, $A0, $21, $FF, $1F, $1C
	db $9D, $21, $FF, $1F, $1C, $A2, $21, $FF
	db $1F, $07, $05, $02, $10, $30, $E0, $02
	db $0E, $08, $E0, $05, $02, $10, $05, $E0
	db $02, $02, $05, $E0, $05, $02, $03, $07
	db $E0, $02, $04, $02, $E0, $05, $80, $50
	db $06, $08, $1C, $98, $21, $FF, $1F, $1C
	db $99, $21, $FF, $1F, $1C, $A0, $21, $FF
	db $1F, $02, $05, $09, $A0, $02, $06, $03
	db $A0, $1C, $98, $21, $08, $20, $1C, $99
	db $21, $08, $20, $1C, $A0, $21, $08, $20
	db $02, $04, $02, $A0, $02, $01, $02, $A0
	db $1C, $98, $21, $11, $20, $1C, $99, $21
	db $11, $20, $1C, $A0, $21, $11, $20, $02
	db $02, $03, $A0, $02, $01, $02, $A0, $05
	db $21, $1A, $20, $07, $80, $40, $06, $08
	db $1C, $A0, $21, $FF, $1F, $1C, $A2, $21
	db $FF, $1F, $1C, $9D, $21, $FF, $1F, $07
	db $05, $13, $FB, $14, $0C, $12, $2E, $01
	db $59, $06, $04, $99, $98, $94, $01, $58
	db $99, $98, $94, $01, $57, $99, $98, $94
	db $01, $56, $99, $98, $94, $01, $55, $99
	db $98, $94, $01, $54, $99, $98, $94, $01
	db $57, $99, $98, $94, $01, $52, $99, $98
	db $94, $01, $51, $99, $98, $94, $99, $01
	db $50, $98, $94, $99, $98, $07, $05, $94
	db $0E, $80, $02, $08, $01, $01, $0B, $18
	db $00, $9E, $10, $21, $D3, $20, $9E, $40
	db $21, $D3, $20, $9E, $16, $0A, $05, $08
	db $01, $02, $0B, $18, $00, $05, $80, $70
	db $08, $05, $01, $0B, $15, $00, $9B, $10
	db $0A, $9B, $60, $21, $BB, $20, $9E, $15
	db $9D, $15, $08, $00, $01, $0B, $13, $00
	db $99, $30, $08, $00, $01, $0B, $15, $00
	db $9B, $08, $0A, $9B, $08, $99, $16, $98
	db $15, $99, $15, $08, $00, $01, $0B, $1B
	db $00, $A0, $40, $80, $10, $A0, $20, $0A
	db $9D, $10, $9B, $10, $05, $08, $00, $01
	db $0B, $1B, $00, $A0, $20, $0A, $9D, $10
	db $9B, $20, $05, $21, $BB, $20, $A2, $15
	db $08, $00, $01, $0B, $1D, $00, $A2, $15
	db $0A, $A4, $20, $08, $00, $01, $0B, $10
	db $00, $A4, $10, $0A, $A4, $20, $A0, $20
	db $9D, $10, $08, $00, $01, $0B, $1B, $00
	db $A0, $40, $0A, $05, $02, $1A, $06, $99
	db $02, $02, $08, $99, $02, $1A, $06, $99
	db $99, $02, $02, $08, $99, $05, $02, $16
	db $0A, $99, $02, $03, $07, $99, $02, $16
	db $0A, $99, $05, $02, $12, $0E, $99, $02
	db $04, $06, $99, $02, $12, $0E, $99, $99
	db $05, $80, $02, $0E, $12, $99, $99, $02
	db $06, $04, $99, $05, $02, $0A, $16, $99
	db $02, $07, $03, $99, $02, $0A, $16, $99
	db $99, $02, $07, $03, $99, $05, $02, $06
	db $1A, $99, $02, $08, $02, $99, $02, $06
	db $1A, $99, $05, $02, $02, $1E, $99, $02
	db $0A, $01, $99, $02, $02, $1E, $99, $99
	db $05, $02, $1E, $02, $99, $99, $02, $01
	db $0A, $99, $05, $06, $08, $01, $4D, $02
	db $01, $0A, $99, $21, $B5, $21, $01, $4A
	db $21, $50, $21, $01, $48, $21, $62, $21
	db $01, $45, $21, $6F, $21, $01, $41, $21
	db $7D, $21, $01, $3F, $21, $88, $21, $01
	db $3B, $21, $9A, $21, $01, $37, $21, $A7
	db $21, $07, $05, $06, $08, $01, $3B, $80
	db $21, $B5, $21, $01, $3F, $21, $50, $21
	db $01, $41, $21, $62, $21, $01, $45, $21
	db $6F, $21, $01, $48, $21, $7D, $21, $01
	db $4A, $21, $88, $21, $01, $4D, $21, $9A
	db $21, $01, $4F, $21, $A7, $21, $07, $05
	db $21, $78, $13, $16, $2B, $80, $02, $00
	db $2C, $10, $8E, $3C, $13, $0E, $12, $E9
	db $21, $EF, $21, $13, $15, $21, $BF, $21
	db $80, $11, $01, $35, $13, $05, $14, $0C
	db $12, $EA, $10, $FD, $2E, $21, $64, $20
	db $02, $07, $03, $10, $A8, $65, $21, $7D
	db $20, $21, $57, $1E, $10, $FB, $25, $21
	db $DD, $1F, $02, $03, $07, $10, $A8, $65
	db $21, $7D, $20, $0F, $05, $01, $0B, $07
	db $21, $39, $1E, $21, $DA, $20, $21, $30
	db $1E, $21, $19, $21, $21, $39, $1E, $21
	db $27, $21, $21, $30, $1E, $21, $D0, $1F
	db $21, $39, $1E, $21, $BE, $1F, $21, $30
	db $1E, $21, $B4, $1F, $9D, $80, $80, $6F
	db $80, $80, $80, $80, $10, $8E, $3C, $13
	db $0E, $12, $E9, $21, $EF, $21, $13, $15
	db $21, $BF, $21, $80, $11, $21, $50, $1E
	db $10, $DD, $CF, $21, $46, $1F, $02, $21
	db $11, $21, $80, $1F, $21, $30, $1E, $21
	db $D0, $1F, $21, $39, $1E, $21, $BE, $1F
	db $21, $30, $1E, $21, $B4, $1F, $9D, $40
	db $21, $D0, $1F, $21, $39, $1E, $21, $BE
	db $1F, $21, $30, $1E, $21, $27, $1F, $02
	db $03, $08, $9D, $20, $9E, $10, $02, $05
	db $01, $9B, $0F, $03, $20, $22, $00, $21
	db $78, $13, $21, $E9, $1A, $02, $05, $0A
	db $10, $81, $E1, $08, $00, $19, $FF, $7E
	db $00, $2B, $8A, $04, $00, $2C, $0A, $10
	db $AE, $A0, $23, $6A, $13, $11, $12, $E9
	db $04, $04, $64, $23, $21, $4F, $23, $10
	db $AE, $A0, $23, $6A, $13, $11, $12, $E9
	db $21, $36, $23, $04, $02, $64, $23, $21
	db $4F, $23, $21, $E9, $1A, $23, $7F, $10
	db $DE, $EB, $13, $E4, $83, $80, $85, $80
	db $86, $80, $88, $40, $88, $40, $03, $E6
	db $22, $00, $13, $0E, $04, $02, $A2, $23
	db $13, $05, $04, $02, $A2, $23, $13, $0E
	db $04, $02, $A2, $23, $13, $05, $04, $02
	db $A2, $23, $05, $13, $07, $21, $A2, $23
	db $13, $09, $21, $A2, $23, $13, $0A, $21
	db $A2, $23, $13, $0C, $21, $A2, $23, $05
	db $13, $0A, $21, $A2, $23, $13, $10, $21
	db $A2, $23, $13, $09, $21, $A2, $23, $13
	db $0E, $21, $7E, $23, $13, $0C, $21, $7E
	db $23, $05, $06, $08, $23, $60, $01, $37
	db $81, $01, $3B, $81, $01, $3F, $81, $01
	db $43, $81, $01, $47, $81, $01, $49, $81
	db $02, $9F, $60, $01, $4D, $81, $02, $60
	db $9F, $01, $4F, $81, $07, $05, $06, $08
	db $23, $60, $01, $37, $81, $01, $39, $81
	db $01, $3B, $81, $01, $3D, $81, $01, $3F
	db $81, $01, $41, $81, $01, $43, $81, $01
	db $45, $81, $01, $47, $81, $01, $48, $81
	db $01, $49, $81, $01, $4A, $81, $01, $4B
	db $8D, $01, $4C, $81, $01, $4D, $02, $C0
	db $3F, $8D, $01, $4E, $14, $F4, $02, $7F
	db $80, $81, $14, $0C, $07, $05

DATA_EE8572:
	db $00, $13, $25, $03, $17, $13, $53, $14
	db $FE, $14, $A6, $17, $DE, $16, $7A, $16
	db $D5, $13, $45, $17, $A5, $FF, $00, $13
	db $80, $10, $05, $1F, $08, $04, $01, $14
	db $13, $24, $50, $15, $21, $1C, $1C, $18
	db $7F, $01, $01, $01, $01, $01, $01, $01
	db $16, $0E, $01, $A2, $13, $FC, $12, $F6
	db $02, $4A, $3C, $10, $8F, $E0, $04, $01
	db $69, $13, $04, $01, $7C, $13, $80, $C0
	db $80, $60, $8A, $10, $80, $08, $8B, $10
	db $80, $08, $8A, $10, $80, $08, $88, $10
	db $80, $08, $8A, $10, $80, $08, $88, $10
	db $80, $08, $86, $14, $80, $04, $85, $16
	db $80, $02, $03, $2D, $13, $8F, $20, $80
	db $10, $92, $20, $80, $10, $8F, $20, $80
	db $08, $8B, $08, $8A, $20, $80, $10, $05
	db $8F, $20, $80, $08, $91, $08, $92, $20
	db $80, $10, $94, $18, $92, $0E, $80, $02
	db $91, $08, $92, $18, $8F, $18, $94, $18
	db $96, $0E, $80, $02, $97, $08, $96, $18
	db $92, $18, $91, $18, $92, $0C, $8F, $0C
	db $91, $20, $80, $10, $8F, $20, $80, $08
	db $91, $08, $92, $20, $80, $10, $94, $18
	db $92, $0E, $80, $02, $91, $08, $92, $18
	db $8F, $18, $94, $18, $96, $0E, $80, $02
	db $97, $08, $96, $18, $92, $18, $91, $18
	db $92, $0C, $94, $0C, $96, $20, $80, $10
	db $05, $04, $01, $14, $13, $16, $80, $19
	db $0E, $01, $A2, $13, $FC, $12, $F6, $02
	db $0E, $1B, $10, $8F, $E0, $0F, $03, $02
	db $0B, $01, $04, $01, $69, $13, $8F, $20
	db $80, $08, $91, $08, $92, $20, $80, $10
	db $94, $18, $92, $0E, $80, $02, $91, $08
	db $92, $18, $8F, $18, $94, $18, $96, $0E
	db $80, $02, $97, $08, $96, $18, $92, $18
	db $91, $18, $92, $0C, $8F, $0C, $91, $17
	db $04, $01, $F0, $17, $01, $A2, $13, $FC
	db $12, $F6, $02, $0E, $1B, $10, $8F, $E0
	db $80, $C0, $80, $60, $8A, $10, $80, $08
	db $8B, $10, $80, $08, $8A, $10, $80, $08
	db $88, $10, $80, $08, $8A, $10, $80, $08
	db $88, $10, $80, $08, $86, $14, $80, $04
	db $85, $16, $80, $02, $03, $DA, $13, $04
	db $01, $14, $13, $17, $01, $21, $13, $00
	db $12, $AE, $0F, $02, $02, $0B, $03, $10
	db $8E, $67, $02, $28, $28, $10, $8E, $C1
	db $04, $01, $69, $13, $16, $01, $14, $13
	db $FC, $12, $02, $10, $AC, $8B, $02, $1E
	db $11, $04, $02, $BD, $14, $04, $02, $8C
	db $14, $04, $02, $B0, $14, $03, $58, $14
	db $9E, $08, $A3, $08, $A7, $08, $AA, $08
	db $A7, $08, $A3, $08, $A0, $08, $A3, $08
	db $A7, $08, $AA, $08, $A7, $08, $A3, $08
	db $A2, $08, $A6, $08, $A9, $08, $AC, $08
	db $A9, $08, $A6, $08, $A0, $08, $A6, $08
	db $A9, $08, $AC, $08, $A9, $08, $A6, $08
	db $05, $9B, $10, $9E, $08, $A2, $10, $A7
	db $08, $AA, $10, $A7, $08, $A2, $10, $9E
	db $08, $A0, $10, $A3, $08, $A7, $10, $AC
	db $08, $AA, $10, $A7, $08, $A2, $10, $9E
	db $08, $A0, $10, $A3, $08, $A7, $10, $AC
	db $08, $AA, $10, $A7, $08, $A2, $10, $9E
	db $08, $9D, $10, $A1, $08, $A4, $10, $A9
	db $08, $AE, $10, $AC, $08, $A9, $10, $A6
	db $08, $05, $04, $01, $14, $13, $16, $01
	db $1E, $13, $0C, $12, $B8, $10, $8E, $F2
	db $0F, $03, $01, $0B, $02, $02, $14, $0A
	db $80, $0C, $9B, $03, $9D, $03, $9E, $03
	db $A0, $03, $A2, $10, $80, $14, $9B, $03
	db $9D, $03, $9E, $03, $A0, $03, $A2, $10
	db $80, $14, $9B, $03, $9D, $03, $9E, $03
	db $A0, $03, $A2, $10, $80, $14, $9B, $03
	db $9D, $03, $9E, $03, $A0, $03, $A2, $10
	db $80, $C0, $80, $C0, $04, $01, $CF, $15
	db $01, $B6, $13, $05, $12, $EA, $10, $8F
	db $E0, $80, $14, $02, $19, $11, $A3, $06
	db $80, $02, $A3, $05, $80, $03, $A3, $18
	db $80, $08, $A2, $05, $80, $03, $A0, $06
	db $80, $02, $A2, $18, $02, $0C, $06, $A2
	db $18, $02, $08, $04, $A2, $18, $02, $04
	db $02, $A2, $18, $80, $20, $02, $19, $11
	db $A3, $06, $80, $02, $A3, $05, $80, $03
	db $A3, $18, $80, $08, $A2, $05, $80, $03
	db $A0, $06, $80, $02, $A2, $18, $02, $0C
	db $06, $A2, $08, $02, $19, $11, $A2, $05
	db $80, $03, $A2, $06, $80, $02, $A2, $18
	db $02, $0C, $06, $A2, $08, $02, $19, $11
	db $A2, $05, $80, $03, $A2, $06, $80, $02
	db $A2, $10, $80, $08, $A0, $10, $80, $08
	db $9E, $10, $80, $08, $9D, $10, $80, $08
	db $03, $03, $15, $02, $14, $0A, $80, $14
	db $9B, $03, $9D, $03, $9E, $03, $A0, $03
	db $02, $14, $0A, $A2, $10, $02, $03, $0B
	db $A2, $14, $02, $14, $0A, $9B, $03, $9D
	db $03, $9E, $03, $A0, $03, $02, $14, $0A
	db $A2, $10, $02, $03, $0B, $A2, $14, $02
	db $14, $0A, $9B, $03, $9E, $03, $A0, $03
	db $A2, $03, $02, $14, $0A, $A3, $10, $02
	db $03, $0B, $A3, $14, $02, $14, $0A, $9B
	db $03, $9D, $03, $9E, $03, $A0, $03, $02
	db $14, $0A, $A2, $10, $02, $03, $0B, $A2
	db $14, $02, $14, $0A, $9B, $03, $9E, $03
	db $A0, $03, $A2, $03, $02, $14, $0A, $A3
	db $10, $02, $03, $0B, $A3, $14, $02, $14
	db $0A, $9B, $03, $9D, $03, $9E, $03, $A0
	db $03, $02, $14, $0A, $A2, $10, $02, $03
	db $0B, $A2, $14, $02, $14, $0A, $9B, $03
	db $9D, $03, $9E, $03, $A0, $03, $02, $14
	db $0A, $A1, $10, $02, $03, $0B, $A1, $14
	db $02, $14, $0A, $9B, $03, $9D, $03, $9E
	db $03, $A0, $03, $02, $14, $0A, $A2, $10
	db $02, $03, $0B, $A2, $14, $05, $04, $01
	db $14, $13, $16, $80, $0B, $01, $1E, $13
	db $0C, $12, $B8, $10, $8E, $F2, $0F, $03
	db $01, $0B, $02, $02, $04, $0F, $80, $0C
	db $9B, $03, $9D, $03, $9E, $03, $A0, $03
	db $A2, $10, $80, $14, $9B, $03, $9D, $03
	db $9E, $03, $A0, $03, $A2, $10, $80, $14
	db $9B, $03, $9D, $03, $9E, $03, $A0, $03
	db $A2, $10, $80, $14, $9B, $03, $9D, $03
	db $9E, $03, $A0, $03, $A2, $18, $16, $01
	db $14, $13, $FC, $12, $02, $10, $AC, $8B
	db $02, $05, $11, $04, $02, $BD, $14, $04
	db $02, $8C, $14, $04, $02, $B0, $14, $03
	db $81, $16, $04, $01, $14, $13, $01, $14
	db $13, $FC, $12, $02, $02, $18, $28, $10
	db $8C, $A2, $0F, $02, $03, $05, $05, $02
	db $32, $14, $14, $F4, $10, $8E, $A2, $83
	db $0C, $A2, $24, $92, $0C, $A2, $24, $83
	db $0C, $A2, $24, $8A, $0C, $A2, $24, $04
	db $02, $24, $17, $02, $1E, $1E, $10, $89
	db $E0, $A3, $30, $A3, $30, $A2, $60, $A3
	db $30, $A3, $30, $A2, $C0, $03, $E2, $16
	db $83, $0C, $A2, $24, $92, $0C, $A2, $24
	db $94, $0C, $A3, $24, $83, $0C, $A2, $24
	db $94, $0C, $A3, $24, $83, $0C, $A2, $24
	db $85, $0C, $A1, $24, $91, $0C, $A2, $24
	db $05, $04, $01, $14, $13, $01, $14, $13
	db $FC, $12, $02, $02, $14, $32, $14, $F4
	db $10, $8E, $A2, $0F, $02, $03, $05, $05
	db $8A, $0C, $9B, $24, $86, $0C, $9B, $24
	db $8A, $0C, $9B, $24, $8F, $0C, $9B, $24
	db $04, $02, $85, $17, $02, $28, $14, $10
	db $89, $E0, $9E, $30, $A0, $30, $9D, $60
	db $9E, $30, $A0, $30, $9D, $C0, $03, $49
	db $17, $8A, $0C, $9B, $24, $86, $0C, $9B
	db $24, $88, $0C, $A0, $24, $8A, $0C, $9E
	db $24, $88, $0C, $A0, $24, $8A, $0C, $9E
	db $24, $8C, $0C, $9D, $24, $8A, $0C, $9D
	db $24, $05, $04, $01, $14, $13, $10, $8F
	db $E0, $04, $01, $3E, $18, $17, $01, $21
	db $13, $00, $12, $AE, $0F, $02, $02, $0B
	db $03, $10, $8E, $67, $02, $32, $32, $10
	db $8E, $C1, $04, $01, $7C, $13, $01, $14
	db $13, $F0, $12, $02, $02, $14, $32, $10
	db $8E, $A2, $0F, $02, $03, $05, $05, $02
	db $14, $28, $10, $89, $E0, $A7, $30, $A7
	db $30, $A6, $60, $A7, $30, $A7, $30, $A6
	db $C0, $03, $AA, $17, $10, $8F, $E0, $1C
	db $8F, $21, $2C, $18, $1C, $92, $21, $2C
	db $18, $1C, $88, $21, $2C, $18, $1C, $8F
	db $21, $2C, $18, $17, $01, $A4, $02, $50
	db $50, $88, $0C, $04, $01, $24, $19, $01
	db $A4, $02, $50, $50, $8B, $08, $8A, $0C
	db $16, $04, $01, $F9, $18, $1C, $91, $21
	db $2C, $18, $1C, $8A, $21, $2C, $18, $05
	db $17, $01, $A4, $02, $50, $50, $13, $00
	db $12, $AD, $E0, $0C, $16, $04, $01, $F9
	db $18, $05, $01, $A4, $02, $50, $50, $13
	db $00, $12, $AD, $8F, $0C, $04, $01, $F9
	db $18, $01, $A4, $02, $50, $50, $92, $0C
	db $04, $01, $F9, $18, $01, $A4, $02, $50
	db $50, $8F, $0C, $04, $01, $24, $19, $01
	db $A4, $02, $50, $50, $8B, $08, $8A, $0C
	db $04, $01, $F9, $18, $05, $01, $A4, $02
	db $50, $50, $13, $00, $12, $AD, $8F, $0C
	db $04, $01, $F9, $18, $01, $A4, $02, $50
	db $50, $92, $0C, $04, $01, $F9, $18, $01
	db $A4, $02, $50, $50, $8F, $0C, $04, $01
	db $24, $19, $01, $A4, $02, $50, $50, $8B
	db $08, $8A, $0C, $04, $01, $F9, $18, $80
	db $0C, $04, $01, $F9, $18, $80, $0C, $04
	db $01, $F9, $18, $80, $0C, $04, $01, $F9
	db $18, $80, $0C, $04, $01, $F9, $18, $01
	db $A4, $02, $50, $50, $10, $8F, $E5, $80
	db $0C, $94, $0C, $96, $0C, $97, $0C, $96
	db $10, $92, $08, $8F, $18, $91, $18, $92
	db $0C, $94, $0C, $8A, $18, $10, $98, $AB
	db $8A, $04, $8A, $04, $8A, $04, $8A, $04
	db $8A, $04, $8A, $04, $8A, $04, $8A, $04
	db $8A, $04, $8A, $04, $8A, $04, $8A, $04
	db $8A, $04, $8A, $04, $00, $01, $A5, $02
	db $10, $10, $9E, $03, $02, $1A, $1A, $9E
	db $03, $02, $20, $20, $9E, $03, $02, $2A
	db $2A, $9E, $03, $02, $30, $30, $9E, $06
	db $02, $10, $10, $9E, $06, $02, $08, $08
	db $9E, $06, $02, $04, $04, $9E, $06, $05
	db $01, $A5, $02, $10, $10, $9E, $03, $02
	db $1A, $1A, $9E, $03, $02, $20, $20, $9E
	db $03, $02, $2A, $2A, $9E, $03, $02, $30
	db $30, $9E, $06, $02, $10, $10, $9E, $06
	db $02, $08, $08, $9E, $04, $05

DATA_EE8BC0:
	db $00, $13, $0E, $08, $B2, $1E, $F3, $1E
	db $D3, $21, $A2, $1F, $72, $21, $C6, $22
	db $C9, $20, $73, $22, $80, $FF, $00, $13
	db $1E, $13, $30, $13, $42, $13, $54, $13
	db $66, $13, $4E, $1D, $E9, $1D, $49, $1E
	db $29, $1E, $0C, $1E, $65, $1E, $7E, $1E
	db $9A, $1E, $C0, $FF, $59, $1A, $E9, $1A
	db $C3, $1B, $1C, $1C, $BB, $1A, $0B, $1D
	db $DF, $1C, $6C, $1B, $DE, $FF, $C1, $18
	db $33, $19, $7C, $19, $F9, $19, $09, $19
	db $37, $1A, $48, $1A, $18, $1A, $C0, $FF
	db $C5, $17, $12, $18, $28, $18, $48, $18
	db $5E, $18, $96, $18, $74, $18, $89, $18
	db $C0, $FF, $79, $13, $DF, $13, $3E, $15
	db $E9, $16, $4D, $14, $AD, $17, $61, $16
	db $33, $17, $70, $FF, $00, $15, $2C, $21
	db $21, $18, $7F, $01, $00, $00, $00, $00
	db $00, $00, $13, $FC, $12, $F8, $02, $17
	db $26, $10, $8F, $E0, $16, $06, $04, $04
	db $04, $A1, $13, $1C, $99, $04, $04, $AE
	db $13, $03, $93, $13, $00, $1C, $94, $04
	db $01, $AE, $13, $1C, $95, $04, $01, $AE
	db $13, $05, $01, $92, $E0, $01, $91, $E0
	db $01, $93, $E0, $01, $91, $E0, $01, $92
	db $E0, $01, $91, $E0, $01, $93, $E0, $01
	db $92, $E0, $01, $91, $E0, $01, $92, $E0
	db $01, $92, $E0, $01, $93, $E0, $01, $92
	db $E0, $01, $91, $E0, $01, $93, $E0, $01
	db $91, $E0, $05, $01, $14, $13, $E4, $12
	db $02, $23, $7F, $10, $8E, $F1, $13, $E4
	db $04, $04, $FA, $13, $13, $EB, $04, $04
	db $38, $14, $03, $EA, $13, $00, $04, $01
	db $07, $14, $14, $01, $04, $01, $07, $14
	db $14, $FF, $05, $88, $03, $80, $01, $88
	db $03, $80, $01, $88, $03, $80, $01, $88
	db $08, $80, $04, $88, $03, $80, $01, $88
	db $03, $80, $01, $88, $03, $80, $01, $88
	db $03, $80, $01, $88, $06, $80, $02, $88
	db $03, $80, $01, $88, $03, $80, $01, $88
	db $06, $80, $02, $05, $86, $0C, $80, $04
	db $86, $08, $80, $04, $86, $08, $80, $04
	db $86, $06, $80, $02, $86, $0C, $80, $04
	db $05, $01, $19, $10, $8F, $F4, $02, $1C
	db $0C, $16, $16, $02, $14, $23, $21, $01
	db $15, $02, $23, $0F, $21, $E8, $14, $02
	db $14, $23, $21, $01, $15, $02, $23, $0F
	db $21, $CD, $14, $02, $14, $23, $21, $01
	db $15, $02, $23, $0F, $21, $E8, $14, $02
	db $14, $23, $21, $01, $15, $02, $23, $0F
	db $21, $B2, $14, $02, $11, $21, $04, $04
	db $92, $14, $03, $57, $14, $00, $01, $B5
	db $13, $FE, $12, $EF, $10, $8F, $E0, $A5
	db $04, $A5, $04, $A5, $04, $A5, $04, $A5
	db $0C, $A5, $08, $A5, $04, $A5, $08, $A5
	db $08, $A5, $04, $A5, $04, $05, $01, $1C
	db $13, $0E, $12, $30, $10, $8D, $EB, $0F
	db $02, $04, $0B, $05, $95, $10, $9B, $08
	db $9C, $10, $A0, $08, $A1, $08, $A3, $08
	db $05, $01, $1C, $13, $0E, $12, $30, $10
	db $8D, $EB, $0F, $02, $04, $0B, $05, $95
	db $10, $9B, $08, $9C, $10, $A0, $08, $A1
	db $08, $A0, $08, $05, $01, $1C, $13, $0E
	db $12, $30, $10, $8D, $EB, $0F, $02, $04
	db $0B, $05, $95, $10, $9B, $08, $9C, $18
	db $9E, $08, $9C, $08, $05, $01, $B5, $13
	db $FE, $12, $EF, $10, $8F, $E0, $A0, $04
	db $A0, $04, $A0, $04, $A0, $04, $A0, $08
	db $A0, $04, $A0, $04, $A0, $04, $A0, $04
	db $A0, $08, $A0, $04, $A0, $04, $A0, $08
	db $05, $A0, $04, $9D, $04, $9D, $04, $9D
	db $04, $9D, $0C, $9D, $08, $A0, $04, $A0
	db $08, $A0, $04, $9D, $04, $A4, $04, $A4
	db $04, $05, $16, $04, $08, $AF, $15, $04
	db $04, $4B, $15, $03, $3F, $15, $00, $10
	db $8F, $F2, $01, $A5, $23, $50, $9A, $04
	db $10, $8F, $F2, $01, $00, $23, $46, $95
	db $04, $95, $04, $95, $04, $10, $8F, $F2
	db $01, $A5, $23, $50, $9A, $04, $10, $8F
	db $F2, $01, $00, $23, $46, $95, $04, $95
	db $04, $10, $8F, $F2, $01, $A5, $23, $50
	db $9A, $04, $23, $1E, $9A, $04, $23, $50
	db $9A, $04, $9A, $04, $10, $8F, $F2, $01
	db $00, $23, $46, $95, $04, $10, $8F, $F2
	db $01, $A5, $23, $50, $9A, $04, $10, $8F
	db $F2, $01, $00, $23, $46, $95, $04, $10
	db $8F, $F2, $01, $A5, $23, $50, $9A, $04
	db $9A, $04, $05, $10, $8F, $F2, $01, $00
	db $23, $46, $95, $04, $95, $04, $95, $08
	db $10, $8F, $F2, $01, $A5, $23, $50, $9A
	db $08, $10, $8F, $F2, $01, $00, $23, $46
	db $95, $04, $95, $04, $95, $04, $95, $04
	db $95, $04, $10, $EF, $33, $01, $90, $02
	db $14, $1E, $A2, $04, $10, $8F, $F2, $01
	db $A5, $23, $50, $9A, $04, $9A, $04, $10
	db $8F, $F2, $01, $00, $23, $46, $95, $08
	db $05, $10, $8F, $F2, $01, $00, $23, $46
	db $95, $04, $10, $EF, $33, $01, $90, $02
	db $1E, $28, $A2, $04, $A2, $04, $02, $0F
	db $0A, $A2, $04, $10, $8F, $F2, $01, $A5
	db $23, $50, $9A, $04, $10, $EF, $33, $01
	db $90, $02, $28, $1E, $A2, $04, $A2, $04
	db $10, $8F, $F2, $01, $00, $23, $46, $95
	db $04, $23, $1E, $95, $04, $10, $8F, $F2
	db $01, $00, $23, $46, $95, $04, $95, $04
	db $10, $EF, $33, $01, $90, $02, $1E, $28
	db $A5, $04, $10, $8F, $F2, $01, $A5, $23
	db $50, $9A, $04, $10, $EF, $33, $01, $90
	db $02, $28, $1E, $A2, $04, $A2, $04, $02
	db $0F, $0A, $A2, $04, $05, $16, $01, $D5
	db $13, $F3, $12, $F6, $10, $8E, $E0, $02
	db $32, $1E, $04, $04, $91, $16, $04, $04
	db $7A, $16, $03, $6E, $16, $00, $99, $04
	db $99, $04, $99, $04, $99, $04, $99, $0C
	db $99, $08, $99, $04, $99, $08, $99, $08
	db $99, $04, $99, $04, $05, $04, $01, $9E
	db $16, $14, $01, $04, $01, $9E, $16, $14
	db $FF, $05, $94, $10, $94, $08, $94, $08
	db $94, $04, $94, $04, $94, $08, $94, $10
	db $05, $02, $32, $1E, $97, $08, $95, $08
	db $97, $0C, $02, $0A, $1E, $97, $0C, $95
	db $08, $97, $10, $02, $32, $1E, $97, $08
	db $95, $08, $97, $0C, $97, $0C, $95, $08
	db $92, $10, $05, $02, $32, $1E, $90, $08
	db $92, $18, $02, $0A, $1E, $90, $08, $92
	db $18, $02, $32, $1E, $90, $0C, $92, $0C
	db $95, $08, $92, $20, $05, $01, $D5, $13
	db $F3, $12, $F6, $10, $FE, $40, $80, $09
	db $02, $32, $1E, $16, $02, $0C, $08, $21
	db $01, $15, $02, $06, $11, $21, $E8, $14
	db $02, $0C, $08, $21, $01, $15, $02, $06
	db $11, $21, $CD, $14, $02, $0C, $08, $21
	db $01, $15, $02, $06, $11, $21, $E8, $14
	db $02, $0C, $08, $21, $01, $15, $02, $06
	db $11, $21, $B2, $14, $02, $11, $0A, $04
	db $04, $92, $14, $03, $F8, $16, $00, $21
	db $37, $1D, $16, $02, $17, $0B, $04, $04
	db $8C, $17, $02, $28, $0F, $04, $01, $49
	db $17, $03, $33, $17, $00, $01, $1C, $13
	db $0E, $12, $30, $10, $8D, $EB, $0F, $02
	db $04, $0B, $05, $99, $0C, $9E, $02, $9F
	db $02, $A0, $20, $80, $10, $99, $0C, $9F
	db $02, $A0, $02, $A1, $10, $99, $0C, $A0
	db $02, $A1, $02, $A2, $10, $99, $0C, $A1
	db $02, $A2, $02, $A3, $20, $80, $10, $99
	db $0C, $A2, $02, $A3, $02, $A4, $10, $99
	db $0C, $A3, $02, $A4, $02, $A5, $10, $05
	db $A3, $08, $A0, $08, $A8, $08, $A7, $08
	db $AC, $08, $A7, $08, $A8, $08, $A5, $08
	db $A1, $08, $A5, $08, $A8, $08, $A7, $08
	db $AE, $08, $A7, $08, $A8, $08, $AA, $08
	db $05, $80, $0E, $21, $37, $1D, $16, $02
	db $03, $08, $04, $04, $8C, $17, $02, $08
	db $11, $04, $01, $49, $17, $03, $AF, $17
	db $00, $15, $37, $20, $20, $18, $7F, $0A
	db $00, $00, $00, $00, $00, $00, $13, $00
	db $12, $00, $10, $8F, $E0, $01, $A5, $23
	db $46, $9E, $09, $17, $01, $00, $23, $3C
	db $97, $07, $97, $09, $01, $A5, $23, $46
	db $9E, $10, $9E, $07, $9E, $05, $17, $01
	db $00, $23, $3C, $97, $05, $97, $06, $01
	db $A5, $23, $46, $9E, $17, $23, $1E, $9E
	db $03, $23, $28, $9E, $03, $23, $32, $9E
	db $03, $23, $46, $9E, $10, $00, $01, $14
	db $13, $E4, $12, $02, $23, $7A, $10, $CE
	db $AF, $8C, $19, $8D, $17, $8F, $10, $88
	db $20, $88, $10, $00, $21, $37, $1D, $14
	db $F4, $02, $3C, $1E, $16, $A0, $09, $9B
	db $07, $9D, $09, $A0, $10, $A2, $07, $A4
	db $05, $A7, $04, $A9, $06, $AC, $19, $80
	db $07, $AC, $10, $00, $21, $41, $1D, $02
	db $28, $1E, $10, $AF, $AE, $A0, $19, $A0
	db $17, $A4, $10, $A0, $19, $80, $07, $A0
	db $10, $00, $21, $41, $1D, $02, $1E, $28
	db $10, $AF, $AE, $9B, $19, $9D, $17, $9F
	db $10, $9B, $19, $80, $07, $9B, $10, $00
	db $21, $41, $1D, $23, $23, $10, $AF, $AE
	db $98, $19, $99, $17, $9B, $10, $98, $19
	db $80, $07, $98, $10, $00, $21, $37, $1D
	db $14, $F4, $02, $0B, $17, $80, $0E, $03
	db $30, $18, $13, $00, $12, $00, $01, $2E
	db $02, $0A, $14, $10, $FF, $58, $9E, $09
	db $9D, $07, $9E, $09, $9D, $07, $9E, $09
	db $9D, $07, $9E, $09, $9E, $03, $9E, $03
	db $9E, $03, $9E, $09, $9D, $07, $9E, $09
	db $9D, $07, $9E, $10, $00, $15, $2C, $17
	db $17, $18, $7F, $01, $00, $00, $00, $00
	db $00, $00, $21, $41, $1D, $23, $1E, $08
	db $00, $04, $08, $2B, $00, $9D, $25, $0A
	db $13, $00, $12, $1E, $10, $8F, $D2, $04
	db $03, $F8, $18, $16, $01, $A5, $23, $6C
	db $9E, $10, $17, $01, $00, $23, $50, $97
	db $10, $03, $E7, $18, $16, $01, $A5, $23
	db $6C, $9F, $08, $17, $01, $00, $23, $50
	db $97, $08, $99, $08, $05, $21, $41, $1D
	db $23, $1E, $08, $00, $04, $08, $20, $00
	db $98, $25, $0A, $13, $00, $01, $2E, $02
	db $14, $1E, $10, $AF, $B2, $9A, $18, $9A
	db $18, $9A, $18, $9A, $18, $10, $8F, $F8
	db $99, $08, $97, $08, $03, $2C, $19, $21
	db $41, $1D, $23, $1E, $08, $00, $04, $08
	db $1F, $00, $94, $25, $0A, $01, $14, $13
	db $E4, $12, $02, $23, $7B, $10, $CE, $AF
	db $06, $08, $8A, $8A, $8A, $85, $85, $88
	db $88, $8A, $87, $8A, $8B, $8C, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $85, $85, $85
	db $85, $85, $85, $85, $85, $88, $88, $88
	db $88, $8A, $8A, $8A, $8A, $03, $59, $19
	db $21, $41, $1D, $23, $64, $09, $00, $04
	db $05, $22, $00, $91, $25, $0A, $01, $8F
	db $13, $F8, $12, $FC, $02, $32, $46, $21
	db $97, $19, $00, $10, $EF, $80, $80, $58
	db $08, $01, $02, $08, $21, $00, $A2, $10
	db $A2, $10, $A2, $0F, $08, $00, $01, $08
	db $2B, $00, $9F, $09, $0A, $9F, $07, $08
	db $00, $01, $08, $2B, $00, $9F, $09, $0A
	db $9F, $07, $08, $00, $01, $08, $39, $00
	db $A4, $09, $0A, $0F, $04, $02, $11, $05
	db $A4, $0F, $80, $01, $A4, $07, $08, $00
	db $01, $08, $39, $00, $A4, $09, $0A, $A4
	db $08, $08, $01, $02, $08, $2C, $00, $A7
	db $10, $A7, $10, $A7, $10, $10, $EE, $40
	db $A7, $10, $10, $EC, $20, $A7, $10, $10
	db $EB, $00, $A7, $10, $05, $21, $41, $1D
	db $23, $0A, $08, $00, $04, $08, $2B, $00
	db $80, $05, $9D, $20, $0A, $01, $8F, $13
	db $F8, $12, $FC, $02, $1C, $12, $80, $0F
	db $21, $97, $19, $00, $21, $41, $1D, $23
	db $0A, $08, $00, $04, $08, $20, $00, $80
	db $05, $98, $20, $0A, $01, $8F, $13, $F8
	db $12, $FC, $02, $08, $0E, $80, $1E, $21
	db $97, $19, $00, $21, $41, $1D, $23, $0A
	db $08, $00, $04, $08, $1F, $00, $80, $05
	db $94, $30, $0A, $00, $21, $41, $1D, $23
	db $28, $09, $00, $04, $05, $22, $00, $80
	db $05, $91, $30, $0A, $00, $15, $2C, $17
	db $17, $18, $7F, $01, $00, $00, $00, $00
	db $00, $00, $21, $41, $1D, $23, $1E, $08
	db $00, $04, $08, $2D, $00, $9E, $20, $0A
	db $13, $00, $12, $1E, $10, $8F, $D2, $04
	db $0C, $80, $1A, $00, $17, $01, $00, $23
	db $50, $97, $10, $94, $10, $16, $01, $A5
	db $23, $6C, $9E, $10, $17, $01, $00, $23
	db $50, $96, $09, $16, $01, $A5, $23, $26
	db $A5, $10, $A4, $07, $01, $00, $23, $50
	db $17, $98, $09, $16, $01, $A5, $23, $26
	db $A3, $07, $23, $6C, $9E, $10, $23, $26
	db $A4, $09, $23, $2C, $A5, $07, $05, $21
	db $41, $1D, $23, $1E, $08, $00, $04, $08
	db $1D, $00, $9A, $20, $0A, $13, $00, $12
	db $00, $01, $2E, $02, $14, $1E, $06, $10
	db $04, $0C, $DA, $1A, $07, $00, $10, $8F
	db $F8, $99, $97, $9A, $97, $99, $96, $98
	db $10, $8F, $C5, $9A, $05, $21, $41, $1D
	db $23, $1E, $08, $00, $04, $08, $11, $00
	db $97, $20, $0A, $13, $00, $06, $10, $04
	db $06, $00, $1B, $00, $21, $0D, $1B, $21
	db $4A, $1B, $21, $0D, $1B, $21, $5B, $1B
	db $05, $01, $05, $23, $4A, $10, $8F, $E0
	db $09, $01, $01, $0B, $0B, $00, $8D, $0A
	db $01, $07, $23, $11, $08, $02, $01, $16
	db $16, $00, $9A, $0A, $01, $01, $10, $8E
	db $EF, $88, $01, $07, $10, $8F, $E0, $08
	db $02, $01, $16, $16, $00, $9A, $0A, $01
	db $02, $23, $12, $10, $8E, $EF, $87, $01
	db $03, $10, $8F, $EF, $88, $05, $01, $08
	db $23, $12, $10, $8E, $EF, $8A, $01, $06
	db $23, $15, $10, $8E, $E0, $82, $05, $01
	db $06, $23, $15, $10, $8E, $E0, $82, $01
	db $08, $23, $12, $10, $8E, $EF, $8E, $05
	db $21, $41, $1D, $23, $64, $09, $00, $03
	db $05, $2B, $00, $93, $20, $0A, $80, $05
	db $13, $00, $12, $1E, $10, $8F, $D2, $04
	db $0C, $88, $1B, $00, $17, $01, $00, $23
	db $1B, $97, $10, $94, $10, $16, $01, $A5
	db $23, $24, $9E, $10, $17, $01, $00, $23
	db $1B, $96, $09, $16, $01, $A5, $23, $0C
	db $A5, $10, $A4, $07, $01, $00, $23, $1B
	db $17, $98, $09, $16, $01, $A5, $23, $0C
	db $A3, $07, $23, $24, $9E, $10, $23, $0C
	db $A4, $09, $23, $11, $A5, $07, $05, $21
	db $41, $1D, $23, $0A, $08, $00, $04, $08
	db $2D, $00, $80, $05, $9E, $1B, $0A, $01
	db $14, $13, $E4, $12, $02, $23, $7B, $10
	db $CE, $AF, $1C, $8B, $1D, $97, $04, $02
	db $F7, $1B, $1C, $84, $1D, $90, $04, $02
	db $F7, $1B, $1C, $8B, $1D, $97, $04, $02
	db $F7, $1B, $00, $E0, $0C, $80, $04, $E0
	db $0C, $80, $14, $E0, $0C, $80, $14, $E0
	db $0C, $80, $24, $E0, $0C, $80, $04, $E0
	db $0C, $80, $14, $E0, $0C, $80, $14, $E0
	db $0C, $80, $04, $89, $10, $8A, $10, $05
	db $21, $41, $1D, $23, $0A, $08, $00, $04
	db $08, $1D, $00, $80, $05, $9A, $1B, $0A
	db $16, $02, $14, $3C, $10, $8F, $E0, $80
	db $78, $21, $96, $1C, $21, $74, $1C, $21
	db $37, $1D, $02, $14, $1E, $04, $02, $46
	db $1C, $00, $10, $8E, $E0, $80, $18, $9A
	db $04, $9B, $04, $9C, $1C, $80, $04, $9A
	db $10, $97, $0C, $80, $04, $80, $18, $9A
	db $04, $9B, $04, $9C, $10, $9A, $10, $9C
	db $08, $9E, $08, $80, $08, $9A, $14, $80
	db $04, $99, $10, $97, $10, $80, $10, $05
	db $01, $01, $13, $02, $12, $F2, $95, $10
	db $01, $02, $13, $FE, $12, $18, $97, $10
	db $01, $03, $13, $FD, $12, $00, $97, $08
	db $95, $10, $01, $04, $13, $FC, $12, $FE
	db $97, $40, $01, $04, $13, $FC, $12, $FE
	db $97, $08, $01, $01, $13, $02, $12, $F2
	db $95, $10, $01, $02, $13, $FE, $12, $18
	db $97, $10, $01, $03, $13, $FD, $12, $00
	db $97, $08, $01, $01, $13, $02, $12, $F2
	db $99, $10, $01, $02, $13, $FE, $12, $18
	db $9A, $10, $01, $04, $13, $FC, $12, $FE
	db $9A, $08, $01, $03, $13, $FD, $12, $00
	db $99, $10, $01, $04, $13, $FC, $12, $FE
	db $97, $20, $05, $21, $41, $1D, $23, $0A
	db $08, $00, $04, $08, $11, $00, $80, $05
	db $97, $1B, $0A, $16, $80, $07, $02, $17
	db $08, $10, $8F, $E0, $80, $78, $21, $96
	db $1C, $21, $74, $1C, $21, $37, $1D, $02
	db $0B, $06, $04, $02, $46, $1C, $00, $21
	db $41, $1D, $23, $28, $09, $00, $03, $05
	db $2B, $00, $80, $05, $93, $1B, $0A, $16
	db $80, $0F, $02, $04, $0B, $10, $8F, $E0
	db $80, $78, $21, $96, $1C, $21, $74, $1C
	db $21, $37, $1D, $02, $03, $07, $04, $02
	db $46, $1C, $00, $01, $8E, $13, $01, $12
	db $F2, $10, $DF, $72, $05, $01, $14, $13
	db $F0, $12, $FE, $10, $8C, $E8, $05, $80
	db $10, $05, $15, $3A, $23, $23, $18, $7F
	db $0A, $01, $01, $01, $01, $01, $01, $02
	db $0B, $17, $21, $72, $1D, $13, $00, $12
	db $00, $02, $14, $1E, $10, $8F, $E0, $1C
	db $8C, $04, $04, $95, $1D, $00, $16, $01
	db $8E, $13, $01, $12, $F2, $10, $DF, $72
	db $9E, $08, $A0, $08, $A1, $10, $A0, $08
	db $9E, $08, $9C, $08, $9B, $08, $97, $10
	db $99, $08, $9B, $10, $9C, $18, $9A, $10
	db $05, $06, $08, $01, $92, $13, $F4, $E0
	db $01, $93, $13, $00, $E0, $01, $92, $13
	db $FB, $E0, $01, $91, $13, $00, $E0, $01
	db $92, $13, $F8, $E0, $01, $93, $13, $FE
	db $E0, $01, $91, $13, $F4, $E0, $01, $93
	db $13, $00, $E0, $01, $93, $13, $07, $E0
	db $01, $92, $13, $00, $E0, $01, $91, $13
	db $04, $E0, $01, $92, $13, $FE, $E0, $01
	db $93, $13, $0C, $E0, $01, $92, $13, $00
	db $E0, $01, $91, $13, $FB, $E0, $01, $93
	db $13, $F8, $E0, $07, $05, $01, $90, $13
	db $00, $12, $08, $02, $46, $50, $10, $FF
	db $F3, $80, $10, $8E, $20, $8E, $10, $8E
	db $40, $8E, $80, $8A, $10, $8A, $70, $8A
	db $10, $8A, $70, $8A, $10, $8A, $70, $00
	db $01, $90, $13, $00, $12, $F8, $02, $50
	db $46, $10, $FF, $F3, $80, $28, $8E, $10
	db $8E, $20, $8E, $10, $8E, $A0, $8A, $80
	db $8A, $80, $8A, $80, $00, $01, $14, $13
	db $E4, $12, $02, $23, $5A, $10, $8E, $E0
	db $80, $10, $8B, $18, $8B, $08, $8B, $08
	db $8B, $08, $8B, $10, $8D, $08, $8F, $10
	db $90, $18, $90, $F0, $00, $01, $15, $13
	db $F0, $12, $03, $0F, $02, $02, $06, $08
	db $02, $14, $0A, $10, $8B, $E8, $80, $10
	db $A1, $18, $A1, $40, $A0, $18, $A0, $F0
	db $00, $80, $0E, $02, $08, $03, $21, $72
	db $1D, $13, $00, $12, $00, $02, $0B, $08
	db $10, $8F, $E0, $1C, $8C, $04, $04, $95
	db $1D, $00, $01, $15, $13, $F0, $12, $03
	db $0F, $03, $02, $06, $08, $02, $0A, $14
	db $10, $8B, $E8, $80, $10, $9E, $18, $9E
	db $40, $9C, $18, $9A, $F0, $00, $01, $15
	db $13, $F0, $12, $03, $0F, $02, $03, $06
	db $08, $23, $0F, $80, $10, $9B, $18, $9B
	db $40, $97, $18, $97, $F0, $00, $1F, $08
	db $21, $4B, $1D, $24, $80, $15, $3A, $23
	db $23, $18, $7F, $0A, $01, $01, $01, $01
	db $01, $01, $01, $14, $13, $E4, $12, $02
	db $23, $50, $10, $88, $E0, $2B, $85, $05
	db $00, $85, $04, $00, $2C, $8C, $80, $85
	db $80, $87, $80, $8A, $80, $8C, $40, $90
	db $40, $85, $80, $87, $80, $8A, $80, $8C
	db $40, $90, $40, $03, $D1, $1E, $00, $21
	db $4B, $1D, $01, $90, $13, $00, $12, $00
	db $02, $14, $3C, $10, $CF, $50, $80, $78
	db $8E, $04, $8E, $04, $8E, $38, $02, $32
	db $1E, $8A, $04, $8A, $04, $8A, $18, $02
	db $46, $0A, $86, $04, $86, $04, $86, $20
	db $01, $15, $13, $F0, $12, $03, $0F, $02
	db $02, $06, $08, $02, $08, $10, $10, $80
	db $8B, $A4, $FF, $80, $01, $A2, $FF, $80
	db $01, $A0, $FF, $80, $01, $9F, $FF, $80
	db $01, $01, $28, $13, $F0, $12, $F2, $23
	db $28, $10, $8F, $EF, $1C, $91, $1D, $85
	db $04, $20, $9D, $1F, $04, $20, $9D, $1F
	db $01, $14, $13, $E4, $12, $02, $23, $14
	db $10, $88, $E5, $9F, $80, $01, $28, $13
	db $F0, $12, $F2, $23, $28, $10, $8F, $EF
	db $04, $02, $74, $1F, $03, $F6, $1E, $00
	db $04, $08, $9D, $1F, $04, $08, $98, $1F
	db $04, $08, $93, $1F, $04, $04, $8E, $1F
	db $04, $04, $89, $1F, $05, $9C, $08, $90
	db $08, $05, $98, $08, $8C, $08, $05, $96
	db $08, $8A, $08, $05, $9F, $08, $93, $08
	db $05, $9D, $08, $91, $08, $05, $21, $4B
	db $1D, $01, $90, $13, $00, $12, $00, $02
	db $14, $07, $10, $CF, $50, $80, $07, $80
	db $78, $8E, $04, $8E, $04, $8E, $38, $02
	db $0A, $11, $8A, $04, $8A, $04, $8A, $18
	db $02, $03, $18, $86, $04, $86, $04, $86
	db $19, $01, $15, $13, $F0, $12, $03, $0F
	db $02, $03, $06, $08, $02, $08, $10, $10
	db $80, $8B, $2B, $A0, $01, $00, $9F, $01
	db $00, $9D, $01, $00, $9B, $01, $00, $2C
	db $16, $01, $8F, $13, $08, $12, $FC, $02
	db $09, $12, $10, $80, $8B, $2B, $80, $01
	db $00, $0F, $05, $02, $0A, $16, $09, $DC
	db $0B, $0A, $0B, $00, $90, $01, $00, $0F
	db $05, $02, $08, $16, $08, $DC, $06, $0B
	db $10, $00, $8B, $01, $00, $2C, $0A, $0E
	db $01, $90, $13, $00, $12, $00, $02, $64
	db $3C, $10, $CF, $32, $80, $70, $90, $08
	db $90, $08, $10, $CF, $2C, $90, $70, $10
	db $CF, $32, $90, $08, $90, $08, $8E, $80
	db $16, $01, $8E, $13, $01, $12, $F2, $02
	db $09, $15, $10, $DF, $72, $21, $90, $20
	db $21, $53, $20, $03, $A5, $1F, $00, $A4
	db $10, $A0, $08, $9D, $30, $A4, $10, $A4
	db $08, $A4, $0C, $A2, $0C, $A0, $08, $A2
	db $10, $9F, $08, $9B, $30, $A2, $10, $A2
	db $08, $A2, $0C, $A0, $0C, $9F, $08, $A0
	db $10, $A9, $38, $A0, $10, $A0, $08, $A0
	db $0C, $A2, $0C, $A0, $08, $9F, $10, $A8
	db $38, $9F, $10, $9F, $08, $9F, $0C, $A0
	db $0C, $9F, $08, $05, $80, $08, $98, $08
	db $9D, $08, $9F, $08, $A0, $28, $98, $08
	db $9D, $08, $9F, $08, $A0, $18, $9F, $04
	db $9D, $04, $9F, $30, $9B, $10, $96, $40
	db $80, $08, $99, $08, $9D, $08, $9F, $08
	db $A0, $28, $99, $08, $9D, $08, $9F, $08
	db $A0, $18, $9F, $04, $9D, $04, $9F, $30
	db $A0, $10, $A2, $40, $05, $21, $4B, $1D
	db $01, $90, $13, $00, $12, $00, $02, $04
	db $0A, $10, $CF, $50, $80, $0B, $80, $78
	db $8E, $04, $8E, $04, $8E, $38, $02, $09
	db $05, $8A, $04, $8A, $04, $8A, $18, $02
	db $0C, $02, $86, $04, $86, $04, $86, $15
	db $01, $15, $13, $F0, $12, $03, $0F, $03
	db $02, $0B, $08, $02, $08, $10, $10, $80
	db $8B, $2B, $9D, $01, $00, $9B, $01, $00
	db $99, $01, $00, $96, $01, $00, $2C, $80
	db $14, $16, $01, $8F, $13, $08, $12, $FC
	db $02, $07, $02, $10, $80, $8B, $2B, $80
	db $01, $00, $0F, $05, $02, $0A, $16, $09
	db $DC, $0B, $0A, $0B, $00, $90, $01, $00
	db $0F, $05, $02, $08, $16, $08, $DC, $06
	db $0B, $10, $00, $8B, $01, $00, $2C, $0A
	db $0E, $01, $90, $13, $00, $12, $00, $02
	db $64, $3C, $10, $CF, $32, $80, $60, $90
	db $08, $90, $78, $90, $08, $90, $84, $16
	db $01, $14, $13, $FC, $12, $02, $02, $0F
	db $06, $10, $8B, $A7, $21, $90, $20, $21
	db $53, $20, $03, $CC, $20, $00, $21, $4B
	db $1D, $01, $90, $13, $FB, $12, $00, $23
	db $60, $10, $CF, $52, $2B, $80, $05, $00
	db $2C, $04, $06, $C3, $21, $04, $02, $A1
	db $21, $23, $60, $10, $CF, $4B, $8A, $80
	db $23, $50, $10, $CF, $52, $04, $08, $C3
	db $21, $03, $75, $21, $00, $23, $60, $10
	db $CF, $4E, $8D, $20, $23, $42, $10, $CF
	db $50, $94, $20, $23, $60, $10, $CF, $52
	db $8D, $08, $10, $CF, $4C, $8D, $18, $23
	db $42, $10, $CF, $50, $94, $20, $05, $10
	db $CF, $4E, $8D, $40, $10, $CF, $52, $8D
	db $08, $10, $CF, $4C, $8D, $38, $05, $21
	db $4B, $1D, $13, $00, $12, $00, $23, $0A
	db $10, $8F, $E0, $1C, $8D, $04, $08, $1F
	db $22, $23, $0F, $04, $04, $1F, $22, $23
	db $14, $04, $04, $1F, $22, $23, $19, $04
	db $04, $1F, $22, $23, $1E, $04, $10, $1F
	db $22, $01, $15, $13, $F0, $12, $03, $23
	db $0A, $10, $85, $E7, $80, $10, $9C, $70
	db $13, $00, $12, $00, $23, $1E, $10, $8F
	db $E0, $1C, $8D, $04, $10, $1F, $22, $03
	db $D6, $21, $00, $06, $04, $01, $92, $13
	db $F4, $E0, $01, $93, $13, $00, $E0, $01
	db $92, $13, $FB, $E0, $01, $91, $13, $00
	db $E0, $01, $92, $13, $F9, $E0, $01, $93
	db $13, $FE, $E0, $01, $91, $13, $F4, $E0
	db $01, $93, $13, $00, $E0, $01, $93, $13
	db $07, $E0, $01, $92, $13, $00, $E0, $01
	db $91, $13, $05, $E0, $01, $92, $13, $FE
	db $E0, $01, $93, $13, $0C, $E0, $01, $92
	db $13, $00, $E0, $01, $91, $13, $FB, $E0
	db $01, $93, $13, $F9, $E0, $07, $05, $21
	db $4B, $1D, $80, $07, $12, $00, $10, $8F
	db $E0, $1C, $8D, $02, $02, $06, $04, $08
	db $1F, $22, $02, $04, $08, $04, $04, $1F
	db $22, $02, $04, $0C, $04, $04, $1F, $22
	db $02, $06, $10, $04, $04, $1F, $22, $02
	db $15, $0E, $04, $10, $1F, $22, $01, $15
	db $13, $F0, $12, $03, $02, $05, $0F, $10
	db $85, $E7, $80, $19, $A2, $67, $13, $00
	db $12, $00, $02, $15, $0E, $10, $8F, $E0
	db $1C, $8D, $04, $10, $1F, $22, $03, $78
	db $22, $00, $21, $4B, $1D, $80, $0E, $12
	db $00, $10, $8F, $E0, $1C, $8D, $02, $03
	db $01, $04, $08, $1F, $22, $02, $04, $02
	db $04, $04, $1F, $22, $02, $06, $03, $04
	db $04, $1F, $22, $02, $08, $04, $04, $04
	db $1F, $22, $02, $06, $0C, $04, $10, $1F
	db $22, $01, $15, $13, $F0, $12, $03, $02
	db $0F, $05, $10, $85, $E7, $80, $22, $A5
	db $5E, $16, $01, $14, $13, $FC, $12, $F8
	db $02, $03, $07, $10, $8B, $A7, $21, $90
	db $20, $21, $53, $20, $03, $CB, $22, $00

DATA_EE9BE0:
	db $00, $13, $36, $02, $14, $13, $8C, $13
	db $F0, $15, $46, $15, $81, $16, $E9, $14
	db $B3, $15, $EE, $16, $A0, $FF, $00, $13
	db $21, $59, $17, $21, $5E, $17, $01, $B8
	db $13, $0C, $12, $A8, $23, $54, $10, $AE
	db $B4, $1C, $91, $04, $04, $77, $13, $1C
	db $92, $04, $01, $77, $13, $04, $01, $62
	db $13, $04, $01, $77, $13, $04, $01, $62
	db $13, $1C, $91, $04, $02, $77, $13, $1C
	db $92, $04, $01, $77, $13, $04, $01, $62
	db $13, $04, $01, $77, $13, $04, $01, $62
	db $13, $14, $FB, $1C, $91, $04, $04, $77
	db $13, $14, $05, $03, $25, $13, $90, $18
	db $90, $08, $94, $18, $90, $10, $8B, $10
	db $8A, $08, $8B, $08, $8A, $08, $8B, $08
	db $8F, $08, $05, $92, $18, $92, $08, $92
	db $18, $92, $10, $92, $10, $92, $08, $90
	db $08, $8D, $08, $90, $08, $E0, $08, $05
	db $21, $59, $17, $16, $02, $28, $14, $21
	db $AD, $14, $04, $02, $98, $14, $02, $6E
	db $3C, $04, $01, $60, $14, $02, $5A, $3C
	db $04, $01, $4C, $14, $04, $02, $98, $14
	db $02, $6E, $3C, $04, $01, $14, $14, $02
	db $5A, $3C, $04, $01, $4C, $14, $02, $6E
	db $3C, $04, $01, $C8, $13, $9E, $40, $80
	db $C0, $03, $96, $13, $01, $C0, $13, $FC
	db $12, $18, $10, $AC, $AE, $80, $10, $99
	db $10, $9D, $10, $99, $10, $9E, $10, $9D
	db $08, $9E, $10, $9E, $10, $9E, $18, $9B
	db $10, $9E, $10, $9B, $10, $9E, $10, $9D
	db $08, $9E, $18, $A0, $10, $9D, $08, $9B
	db $08, $99, $10, $9D, $10, $99, $10, $9E
	db $10, $9D, $08, $9E, $10, $9E, $10, $9E
	db $18, $9B, $10, $9E, $10, $9B, $10, $9E
	db $10, $9D, $08, $9E, $18, $A0, $10, $05
	db $01, $D6, $10, $AF, $D1, $13, $E5, $12
	db $F2, $80, $10, $A2, $08, $A2, $08, $A5
	db $08, $A5, $10, $A3, $10, $A2, $38, $80
	db $10, $A0, $08, $A0, $08, $A3, $08, $A3
	db $10, $A2, $10, $9E, $10, $9E, $08, $A0
	db $08, $9E, $08, $A0, $08, $A3, $08, $A2
	db $10, $A3, $08, $A5, $18, $80, $40, $05
	db $01, $C0, $13, $F0, $12, $18, $10, $8A
	db $EF, $80, $20, $9C, $10, $A0, $20, $9E
	db $10, $9B, $30, $05, $01, $D6, $10, $AF
	db $D1, $13, $E5, $12, $F2, $80, $10, $9E
	db $08, $9E, $08, $A2, $08, $A2, $10, $A0
	db $10, $9E, $38, $80, $10, $9C, $08, $9C
	db $08, $A0, $08, $A0, $10, $9E, $10, $9B
	db $10, $9B, $08, $9E, $08, $9B, $08, $9E
	db $08, $A0, $08, $9E, $10, $A0, $08, $A2
	db $18, $80, $40, $05, $01, $D4, $13, $FD
	db $12, $DC, $10, $CF, $AB, $02, $1E, $14
	db $99, $20, $A2, $20, $A3, $20, $9E, $20
	db $05, $01, $D1, $10, $CF, $91, $13, $00
	db $9E, $06, $9E, $06, $9E, $06, $9E, $06
	db $9E, $06, $9E, $20, $9E, $06, $9E, $06
	db $9E, $06, $9E, $06, $9E, $06, $9E, $20
	db $9E, $06, $9E, $06, $9E, $06, $9E, $06
	db $9E, $06, $9E, $06, $9E, $06, $9E, $06
	db $9E, $06, $9E, $06, $9E, $06, $9E, $06
	db $9E, $06, $9E, $36, $05, $21, $59, $17
	db $16, $80, $03, $02, $14, $28, $21, $AD
	db $14, $80, $0D, $21, $29, $15, $02, $14
	db $32, $04, $01, $60, $14, $02, $28, $3C
	db $04, $01, $4C, $14, $80, $06, $21, $29
	db $15, $02, $14, $32, $04, $01, $14, $14
	db $02, $28, $3C, $04, $01, $4C, $14, $02
	db $14, $32, $04, $01, $C8, $13, $9E, $40
	db $80, $C6, $03, $F7, $14, $01, $D4, $13
	db $FD, $12, $DC, $10, $CF, $AB, $02, $1E
	db $14, $9E, $20, $9E, $20, $A2, $20, $A0
	db $20, $9E, $20, $9E, $20, $A2, $20, $A0
	db $1A, $05, $21, $59, $17, $01, $D4, $13
	db $FD, $12, $DC, $10, $CE, $AE, $02, $0B
	db $17, $80, $80, $80, $80, $80, $02, $04
	db $02, $A2, $15, $04, $02, $81, $15, $04
	db $02, $A2, $15, $04, $02, $81, $15, $04
	db $02, $76, $15, $9E, $80, $80, $80, $03
	db $5B, $15, $9D, $38, $9E, $48, $9E, $38
	db $9E, $28, $9E, $20, $05, $9E, $18, $9E
	db $08, $9E, $18, $9E, $10, $9E, $10, $9E
	db $08, $9C, $10, $9C, $10, $A0, $18, $A0
	db $08, $A0, $18, $9E, $10, $9E, $10, $9E
	db $08, $9E, $10, $9E, $10, $05, $9E, $18
	db $9E, $08, $9E, $18, $9E, $10, $9E, $10
	db $9E, $08, $9C, $10, $9C, $10, $05, $21
	db $59, $17, $01, $C5, $02, $1E, $3C, $10
	db $AF, $B1, $80, $10, $94, $20, $94, $20
	db $94, $20, $94, $20, $94, $20, $94, $20
	db $94, $20, $94, $10, $02, $08, $11, $10
	db $CE, $96, $01, $88, $04, $30, $E7, $15
	db $04, $30, $E7, $15, $04, $20, $E7, $15
	db $03, $B6, $15, $12, $0A, $9E, $08, $12
	db $EC, $9E, $08, $05, $21, $59, $17, $01
	db $89, $23, $5A, $10, $8F, $E0, $80, $E0
	db $16, $94, $08, $94, $04, $94, $04, $94
	db $08, $94, $08, $17, $04, $08, $21, $16
	db $04, $04, $21, $16, $04, $04, $21, $16
	db $01, $89, $23, $5A, $10, $8F, $E0, $16
	db $94, $E0, $03, $FD, $15, $01, $97, $10
	db $AF, $99, $23, $5A, $9A, $10, $01, $89
	db $23, $5A, $10, $8F, $E0, $16, $94, $08
	db $17, $01, $97, $10, $AF, $99, $23, $5A
	db $9A, $08, $9A, $10, $01, $89, $23, $5A
	db $10, $8F, $E0, $16, $94, $08, $17, $01
	db $97, $10, $AF, $99, $23, $5A, $9A, $10
	db $9A, $08, $01, $89, $23, $5A, $10, $8F
	db $E0, $16, $94, $08, $17, $01, $97, $10
	db $AF, $99, $23, $5A, $9A, $08, $9A, $10
	db $01, $89, $23, $5A, $10, $8F, $E0, $16
	db $94, $08, $17, $01, $97, $10, $AF, $99
	db $23, $5A, $9A, $08, $05, $21, $59, $17
	db $01, $D4, $13, $FD, $12, $E5, $10, $CE
	db $AE, $02, $19, $08, $80, $80, $80, $80
	db $80, $01, $04, $02, $DD, $16, $04, $02
	db $BC, $16, $04, $02, $DD, $16, $04, $02
	db $BC, $16, $04, $02, $B1, $16, $99, $80
	db $80, $80, $03, $96, $16, $99, $38, $99
	db $48, $9B, $38, $99, $28, $9B, $20, $05
	db $99, $18, $99, $08, $99, $18, $99, $10
	db $99, $10, $99, $08, $97, $10, $97, $10
	db $9C, $18, $9C, $08, $9C, $18, $9B, $10
	db $9B, $10, $9B, $08, $9B, $10, $9B, $10
	db $05, $99, $18, $99, $08, $99, $18, $99
	db $10, $99, $10, $99, $08, $97, $10, $97
	db $10, $05, $21, $59, $17, $01, $D4, $13
	db $FD, $12, $DC, $10, $CE, $AE, $02, $08
	db $19, $80, $80, $80, $80, $04, $02, $48
	db $17, $04, $02, $27, $17, $04, $02, $48
	db $17, $04, $02, $27, $17, $04, $02, $1C
	db $17, $96, $80, $80, $80, $03, $01, $17
	db $94, $38, $96, $48, $97, $38, $96, $28
	db $97, $20, $05, $96, $18, $96, $08, $96
	db $18, $96, $10, $96, $10, $96, $08, $94
	db $10, $94, $10, $97, $18, $97, $08, $97
	db $18, $97, $10, $97, $10, $97, $08, $97
	db $10, $97, $10, $05, $96, $18, $96, $08
	db $96, $18, $96, $10, $96, $10, $96, $08
	db $94, $10, $94, $10, $05, $13, $00, $80
	db $10, $05, $15, $37, $28, $28, $18, $70
	db $BF, $DB, $E0, $E0, $0A, $C8, $C8, $05

DATA_EEA050:
	db $00, $13, $7B, $07, $54, $1A, $01, $21
	db $2D, $1C, $8A, $21, $C4, $1D, $49, $1F
	db $C7, $1B, $4E, $1D, $BA, $FF, $00, $13
	db $1C, $13, $2E, $13, $40, $13, $52, $13
	db $11, $19, $18, $1A, $7B, $19, $2F, $1A
	db $F9, $19, $10, $1A, $34, $19, $95, $19
	db $C0, $FF, $25, $16, $A9, $16, $94, $17
	db $F3, $17, $8E, $16, $E4, $18, $B7, $18
	db $2D, $17, $DE, $FF, $82, $14, $F7, $14
	db $43, $15, $C1, $15, $CB, $14, $01, $16
	db $13, $16, $E1, $15, $C0, $FF, $89, $13
	db $D9, $13, $EF, $13, $12, $14, $28, $14
	db $5A, $14, $3E, $14, $54, $14, $C0, $FF
	db $80, $10, $05, $01, $14, $13, $F0, $12
	db $03, $05, $10, $FF, $20, $01, $D4, $13
	db $09, $12, $DC, $05, $01, $14, $13, $F0
	db $12, $FE, $05, $01, $14, $13, $F0, $12
	db $FE, $10, $8C, $E8, $05, $21, $46, $1A
	db $13, $00, $12, $00, $01, $A0, $10, $DF
	db $B4, $02, $46, $50, $A0, $09, $10, $8F
	db $E1, $01, $00, $23, $50, $94, $07, $94
	db $09, $01, $A0, $10, $DF, $B4, $02, $46
	db $50, $A0, $10, $A0, $07, $A0, $05, $10
	db $8F, $E1, $01, $00, $23, $50, $94, $05
	db $94, $06, $01, $A0, $10, $DF, $B4, $02
	db $46, $50, $A0, $17, $23, $1E, $A1, $03
	db $23, $28, $A1, $03, $23, $32, $A1, $03
	db $23, $46, $A0, $10, $00, $01, $18, $13
	db $07, $12, $D4, $23, $78, $10, $DF, $AF
	db $8C, $19, $8D, $17, $8F, $10, $88, $20
	db $88, $10, $00, $02, $14, $28, $21, $73
	db $21, $10, $8F, $E0, $A0, $09, $9B, $07
	db $9D, $09, $A0, $10, $A2, $07, $A4, $05
	db $A7, $04, $A9, $06, $10, $8F, $40, $AC
	db $19, $80, $07, $AC, $10, $00, $21, $78
	db $13, $02, $28, $1E, $10, $AF, $AE, $A0
	db $19, $A0, $17, $A4, $10, $A0, $19, $80
	db $07, $A0, $10, $00, $21, $78, $13, $02
	db $1E, $28, $10, $AF, $AE, $9B, $19, $9D
	db $17, $9F, $10, $9B, $19, $80, $07, $9B
	db $10, $00, $21, $78, $13, $02, $23, $23
	db $10, $AF, $AE, $98, $19, $99, $17, $9B
	db $10, $98, $19, $80, $07, $98, $10, $00
	db $02, $0F, $07, $03, $F2, $13, $13, $00
	db $12, $00, $02, $0A, $1E, $00, $10, $DF
	db $55, $9E, $09, $9D, $07, $9E, $09, $9D
	db $07, $9E, $09, $9D, $07, $9E, $09, $9E
	db $03, $9E, $03, $9E, $03, $9E, $09, $9D
	db $07, $9E, $10, $9E, $10, $00, $21, $46
	db $1A, $21, $7F, $13, $02, $1E, $1E, $08
	db $00, $04, $08, $2B, $00, $9D, $25, $0A
	db $13, $00, $12, $1E, $10, $8F, $D2, $04
	db $03, $B5, $14, $01, $A0, $10, $DF, $B4
	db $02, $46, $50, $A0, $10, $10, $8F, $E1
	db $01, $00, $23, $50, $94, $10, $03, $9F
	db $14, $01, $A0, $10, $DF, $B4, $02, $46
	db $50, $A0, $08, $10, $8F, $E1, $01, $00
	db $23, $50, $94, $08, $94, $08, $05, $21
	db $7F, $13, $02, $1E, $1E, $08, $00, $04
	db $08, $20, $00, $98, $25, $0A, $13, $00
	db $21, $1A, $1C, $02, $32, $28, $9A, $18
	db $9A, $18, $9A, $18, $9A, $10, $02, $32
	db $28, $9A, $08, $02, $28, $1E, $9A, $08
	db $03, $EA, $14, $21, $7F, $13, $02, $1E
	db $1E, $08, $00, $04, $08, $1F, $00, $94
	db $25, $0A, $17, $01, $18, $13, $07, $12
	db $D4, $23, $78, $10, $DF, $AF, $06, $08
	db $8A, $8A, $8A, $85, $85, $88, $88, $8A
	db $87, $8A, $8B, $8C, $8C, $8C, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
	db $8C, $8C, $8C, $85, $85, $85, $85, $85
	db $85, $85, $85, $88, $88, $88, $88, $8A
	db $8A, $8A, $8A, $03, $1F, $15, $00, $21
	db $7F, $13, $02, $64, $64, $09, $00, $04
	db $05, $22, $00, $91, $25, $0A, $01, $8F
	db $13, $F8, $12, $FC, $02, $32, $46, $21
	db $5F, $15, $00, $10, $EF, $80, $80, $58
	db $08, $01, $02, $08, $21, $00, $A2, $10
	db $A2, $10, $A2, $0F, $08, $00, $01, $08
	db $2B, $00, $9F, $09, $0A, $9F, $07, $08
	db $00, $01, $08, $2B, $00, $9F, $09, $0A
	db $9F, $07, $08, $00, $01, $08, $39, $00
	db $A4, $09, $0A, $0F, $04, $02, $11, $05
	db $A4, $0F, $80, $01, $A4, $07, $08, $00
	db $01, $08, $39, $00, $A4, $09, $0A, $A4
	db $08, $08, $01, $02, $08, $2C, $00, $A7
	db $10, $A7, $10, $A7, $10, $10, $EE, $40
	db $A7, $10, $10, $EC, $20, $A7, $10, $10
	db $EB, $00, $A7, $10, $05, $21, $7F, $13
	db $02, $0A, $0A, $08, $00, $04, $08, $2B
	db $00, $80, $05, $9D, $20, $0A, $01, $8F
	db $13, $F8, $12, $FC, $02, $1C, $12, $80
	db $0F, $21, $5F, $15, $00, $21, $7F, $13
	db $02, $0A, $0A, $08, $00, $04, $08, $20
	db $00, $80, $05, $98, $20, $0A, $01, $8F
	db $13, $F8, $12, $FC, $02, $08, $0E, $80
	db $1E, $21, $5F, $15, $00, $21, $7F, $13
	db $02, $0A, $0A, $08, $00, $04, $08, $1F
	db $00, $80, $05, $94, $30, $0A, $00, $21
	db $7F, $13, $02, $28, $28, $09, $00, $04
	db $05, $22, $00, $80, $05, $91, $30, $0A
	db $00, $21, $46, $1A, $21, $7F, $13, $02
	db $1E, $1E, $08, $00, $04, $08, $2D, $00
	db $9E, $20, $0A, $13, $00, $12, $1E, $10
	db $8F, $D2, $04, $0C, $43, $16, $00, $10
	db $8F, $E1, $01, $00, $23, $50, $97, $10
	db $94, $10, $01, $A0, $10, $DF, $B4, $02
	db $46, $50, $A0, $10, $10, $8F, $E1, $01
	db $00, $23, $50, $96, $09, $01, $A0, $10
	db $DF, $B4, $02, $28, $32, $A1, $10, $A1
	db $07, $10, $8F, $E1, $01, $00, $23, $50
	db $17, $98, $09, $01, $A0, $10, $DF, $B4
	db $02, $28, $32, $A1, $07, $02, $46, $50
	db $A0, $10, $02, $28, $32, $A1, $09, $A1
	db $07, $05, $21, $7F, $13, $02, $1E, $1E
	db $08, $00, $04, $08, $1D, $00, $9A, $20
	db $0A, $13, $00, $12, $00, $21, $1A, $1C
	db $04, $20, $22, $1C, $00, $21, $7F, $13
	db $02, $1E, $1E, $08, $00, $04, $08, $11
	db $00, $97, $20, $0A, $13, $00, $06, $10
	db $04, $06, $C1, $16, $00, $21, $CE, $16
	db $21, $0B, $17, $21, $CE, $16, $21, $1C
	db $17, $05, $01, $05, $23, $4A, $10, $8F
	db $E0, $09, $01, $01, $0B, $0B, $00, $8D
	db $0A, $01, $07, $23, $11, $08, $02, $01
	db $16, $16, $00, $9A, $0A, $01, $01, $10
	db $8E, $EF, $88, $01, $07, $10, $8F, $E0
	db $08, $02, $01, $16, $16, $00, $9A, $0A
	db $01, $02, $23, $12, $10, $8E, $EF, $87
	db $01, $03, $10, $8F, $EF, $88, $05, $01
	db $08, $23, $12, $10, $8E, $EF, $8A, $01
	db $06, $23, $15, $10, $8E, $E0, $82, $05
	db $01, $06, $23, $15, $10, $8E, $E0, $82
	db $01, $08, $23, $12, $10, $8E, $EF, $8E
	db $05, $21, $7F, $13, $02, $64, $64, $09
	db $00, $03, $05, $2B, $00, $93, $20, $0A
	db $80, $05, $13, $00, $12, $1E, $10, $8F
	db $D2, $04, $0C, $4A, $17, $00, $10, $8F
	db $E1, $01, $00, $23, $1B, $97, $10, $94
	db $10, $01, $A0, $10, $DF, $B4, $02, $1B
	db $17, $A0, $10, $10, $8F, $E1, $01, $00
	db $23, $1B, $96, $09, $01, $A0, $10, $DF
	db $B4, $02, $11, $0C, $A1, $10, $A1, $07
	db $10, $8F, $E1, $01, $00, $23, $1B, $98
	db $09, $01, $A0, $10, $DF, $B4, $02, $11
	db $0C, $A1, $07, $02, $1B, $17, $A0, $10
	db $02, $11, $0C, $A1, $09, $A1, $07, $05
	db $21, $7F, $13, $02, $0A, $0A, $08, $00
	db $04, $08, $2D, $00, $80, $05, $9E, $1B
	db $0A, $01, $18, $13, $07, $12, $D4, $0F
	db $04, $02, $17, $0B, $23, $64, $10, $8F
	db $E0, $1C, $8B, $1D, $97, $04, $02, $CE
	db $17, $1C, $84, $1D, $90, $04, $02, $CE
	db $17, $1C, $8B, $1D, $97, $04, $02, $CE
	db $17, $00, $E0, $0C, $80, $04, $E0, $0C
	db $80, $14, $E0, $0C, $80, $14, $E0, $0C
	db $80, $24, $E0, $08, $E1, $08, $E0, $0C
	db $80, $14, $E0, $0C, $80, $14, $E0, $0C
	db $80, $04, $89, $10, $8A, $10, $05, $21
	db $7F, $13, $02, $0A, $0A, $08, $00, $04
	db $08, $1D, $00, $80, $05, $9A, $1B, $0A
	db $16, $02, $14, $3C, $10, $8F, $E0, $80
	db $78, $21, $6E, $18, $21, $4C, $18, $21
	db $28, $1B, $02, $14, $1E, $04, $02, $1E
	db $18, $00, $10, $8E, $E0, $80, $18, $9A
	db $04, $9B, $04, $9C, $1C, $80, $04, $9A
	db $10, $97, $0C, $80, $04, $80, $18, $9A
	db $04, $9B, $04, $9C, $10, $9A, $10, $9C
	db $08, $9E, $08, $80, $08, $9A, $14, $80
	db $04, $99, $10, $97, $10, $80, $10, $05
	db $01, $01, $13, $02, $12, $F2, $95, $10
	db $01, $02, $13, $FE, $12, $18, $97, $10
	db $01, $03, $13, $FD, $12, $00, $9A, $08
	db $9C, $10, $01, $04, $13, $FC, $12, $FE
	db $9A, $40, $01, $04, $13, $FC, $12, $FE
	db $97, $08, $01, $01, $13, $02, $12, $F2
	db $95, $10, $01, $02, $13, $FE, $12, $18
	db $97, $10, $01, $03, $13, $FD, $12, $00
	db $9A, $08, $01, $01, $13, $02, $12, $F2
	db $9C, $10, $01, $02, $13, $FE, $12, $18
	db $9D, $10, $01, $04, $13, $FC, $12, $FE
	db $9D, $08, $01, $03, $13, $FD, $12, $00
	db $9C, $10, $01, $04, $13, $FC, $12, $FE
	db $9A, $20, $05, $21, $7F, $13, $02, $0A
	db $0A, $08, $00, $04, $08, $11, $00, $80
	db $05, $97, $1B, $0A, $16, $80, $07, $02
	db $17, $08, $10, $8F, $E0, $80, $78, $21
	db $6E, $18, $21, $4C, $18, $21, $28, $1B
	db $02, $0B, $06, $04, $02, $1E, $18, $00
	db $21, $7F, $13, $02, $28, $28, $09, $00
	db $03, $05, $2B, $00, $80, $05, $93, $1B
	db $0A, $16, $80, $0F, $02, $04, $0B, $10
	db $8F, $E0, $80, $78, $21, $6E, $18, $21
	db $4C, $18, $21, $28, $1B, $02, $03, $07
	db $04, $02, $1E, $18, $00, $21, $46, $1A
	db $21, $28, $19, $80, $10, $8B, $30, $8B
	db $10, $8D, $08, $8F, $10, $90, $20, $84
	db $48, $84, $10, $00, $01, $18, $13, $07
	db $12, $D4, $23, $78, $10, $DF, $AF, $05
	db $02, $14, $1E, $21, $28, $1B, $9E, $08
	db $A0, $08, $A1, $10, $A0, $08, $9E, $08
	db $9C, $08, $9B, $08, $97, $10, $99, $08
	db $9B, $10, $9C, $20, $9A, $04, $97, $04
	db $9A, $04, $97, $04, $9A, $04, $97, $04
	db $9A, $04, $97, $04, $9A, $04, $97, $04
	db $9A, $04, $97, $04, $9A, $04, $97, $04
	db $9A, $04, $97, $04, $95, $04, $93, $04
	db $90, $04, $8E, $04, $8B, $04, $00, $80
	db $10, $21, $1A, $1C, $04, $08, $8A, $19
	db $02, $32, $28, $9A, $30, $00, $02, $32
	db $28, $9A, $10, $02, $28, $1E, $9A, $08
	db $05, $80, $10, $10, $8F, $E1, $23, $50
	db $01, $00, $94, $10, $01, $A0, $10, $DF
	db $B4, $02, $46, $50, $A0, $10, $02, $28
	db $32, $A1, $08, $A1, $08, $10, $8F, $E1
	db $23, $50, $01, $00, $94, $10, $01, $A0
	db $10, $DF, $B4, $02, $46, $50, $A0, $18
	db $02, $28, $32, $A1, $04, $A1, $04, $02
	db $46, $50, $A0, $10, $02, $14, $1E, $A1
	db $08, $10, $8F, $E1, $23, $50, $01, $00
	db $94, $3C, $01, $A0, $10, $DF, $B4, $02
	db $14, $1E, $A1, $04, $02, $28, $32, $A1
	db $04, $A1, $04, $10, $8F, $E1, $23, $50
	db $01, $00, $94, $10, $00, $80, $10, $21
	db $73, $21, $02, $14, $0F, $9E, $18, $9E
	db $18, $9E, $10, $9E, $18, $A0, $20, $A0
	db $48, $A0, $10, $00, $80, $0E, $02, $0B
	db $06, $03, $37, $19, $80, $10, $21, $73
	db $21, $02, $14, $0F, $9B, $18, $9B, $18
	db $9B, $10, $9B, $18, $9C, $20, $9A, $48
	db $9A, $10, $00, $80, $10, $21, $73, $21
	db $02, $14, $0F, $95, $18, $95, $18, $95
	db $10, $95, $18, $97, $20, $97, $48, $97
	db $10, $00, $15, $3C, $2C, $2C, $18, $77
	db $08, $08, $08, $00, $00, $00, $00, $05
	db $1F, $06, $21, $64, $13, $21, $46, $1A
	db $13, $00, $80, $80, $80, $80, $80, $B0
	db $04, $01, $33, $1B, $04, $06, $76, $1B
	db $04, $02, $76, $1B, $80, $80, $80, $80
	db $80, $B0, $04, $01, $33, $1B, $04, $03
	db $76, $1B, $04, $01, $8D, $1A, $04, $07
	db $76, $1B, $04, $01, $8D, $1A, $03, $5E
	db $1A, $21, $DC, $1A, $10, $8F, $E1, $23
	db $50, $01, $00, $94, $19, $94, $07, $01
	db $A0, $10, $DF, $B4, $02, $46, $50, $A0
	db $17, $02, $28, $32, $10, $DE, $B4, $A1
	db $03, $A1, $03, $A1, $03, $02, $46, $50
	db $A0, $09, $A0, $07, $10, $8F, $E1, $23
	db $50, $01, $00, $94, $07, $01, $A0, $02
	db $28, $32, $10, $DE, $B4, $A1, $03, $A1
	db $03, $A1, $03, $10, $DF, $B4, $02, $46
	db $50, $A0, $09, $A0, $07, $A1, $10, $05
	db $10, $8F, $E1, $23, $50, $01, $00, $94
	db $19, $94, $07, $01, $A0, $10, $DF, $B4
	db $02, $46, $50, $A0, $19, $02, $28, $32
	db $10, $DE, $B4, $A1, $10, $10, $DF, $B4
	db $02, $46, $50, $A0, $07, $10, $8F, $E1
	db $23, $50, $01, $00, $94, $10, $01, $A0
	db $10, $DF, $B4, $02, $46, $50, $A0, $09
	db $10, $8F, $E1, $23, $50, $01, $00, $94
	db $10, $01, $A0, $02, $28, $32, $10, $DE
	db $B4, $A1, $07, $05, $16, $01, $8E, $13
	db $01, $12, $F2, $10, $BF, $8F, $05, $01
	db $A0, $10, $DE, $B4, $02, $28, $32, $A0
	db $05, $02, $32, $3C, $A0, $05, $02, $3C
	db $46, $A0, $06, $10, $DF, $B4, $02, $46
	db $50, $A0, $09, $A0, $0E, $10, $8F, $E1
	db $23, $50, $01, $00, $94, $03, $01, $A0
	db $10, $DE, $B4, $02, $28, $32, $A0, $03
	db $02, $32, $3C, $A0, $03, $02, $46, $50
	db $10, $DF, $B4, $A0, $09, $A0, $07, $A1
	db $10, $05, $21, $DC, $1A, $10, $8F, $E1
	db $23, $50, $01, $00, $94, $19, $94, $07
	db $01, $A0, $10, $DF, $B4, $02, $46, $50
	db $A0, $19, $02, $28, $32, $10, $DE, $B4
	db $A1, $10, $10, $DF, $B4, $02, $46, $50
	db $A0, $07, $10, $8F, $E1, $23, $50, $01
	db $00, $94, $10, $01, $A0, $10, $DF, $B4
	db $02, $46, $50, $A0, $09, $10, $8F, $E1
	db $23, $50, $01, $00, $94, $07, $01, $A0
	db $02, $28, $32, $10, $DF, $B4, $A1, $09
	db $A1, $07, $05, $21, $64, $13, $21, $1A
	db $1C, $04, $40, $22, $1C, $04, $10, $22
	db $1C, $21, $13, $1C, $23, $50, $10, $88
	db $E0, $8A, $FF, $86, $81, $88, $80, $8A
	db $FF, $86, $81, $88, $80, $21, $1A, $1C
	db $04, $10, $22, $1C, $04, $20, $22, $1C
	db $21, $13, $1C, $16, $02, $14, $0A, $10
	db $8C, $E0, $14, $0C, $9D, $FF, $80, $01
	db $99, $FF, $80, $01, $96, $FF, $80, $01
	db $9B, $FF, $80, $01, $03, $CA, $1B, $01
	db $14, $13, $E4, $12, $02, $05, $13, $00
	db $01, $8D, $10, $DF, $91, $05, $02, $32
	db $28, $9A, $10, $02, $28, $1E, $9A, $10
	db $05, $21, $64, $13, $01, $18, $13, $07
	db $12, $D4, $10, $CF, $F0, $04, $08, $1B
	db $1D, $21, $EE, $1C, $21, $1B, $1D, $80
	db $80, $80, $80, $21, $C1, $1C, $21, $1B
	db $1D, $21, $C1, $1C, $21, $1B, $1D, $21
	db $B5, $1C, $21, $5C, $1C, $03, $39, $1C
	db $1C, $8D, $21, $27, $1D, $8A, $10, $89
	db $10, $88, $10, $1C, $86, $21, $27, $1D
	db $86, $10, $85, $10, $84, $10, $1C, $83
	db $21, $27, $1D, $83, $10, $85, $10, $86
	db $10, $1C, $88, $21, $27, $1D, $88, $10
	db $88, $10, $89, $10, $1C, $8A, $21, $27
	db $1D, $8A, $10, $89, $10, $88, $10, $1C
	db $86, $21, $27, $1D, $86, $10, $85, $10
	db $84, $10, $1C, $83, $21, $27, $1D, $83
	db $10, $84, $10, $85, $10, $1C, $85, $21
	db $27, $1D, $85, $10, $88, $10, $89, $10
	db $05, $1C, $8A, $21, $27, $1D, $8A, $10
	db $8B, $10, $8C, $10, $05, $23, $78, $86
	db $09, $86, $07, $80, $20, $86, $09, $86
	db $07, $80, $39, $23, $3C, $88, $07, $23
	db $78, $88, $09, $88, $07, $80, $19, $23
	db $3C, $88, $07, $23, $78, $88, $09, $88
	db $07, $80, $10, $85, $10, $88, $10, $89
	db $10, $05, $23, $78, $86, $09, $86, $07
	db $80, $20, $86, $09, $86, $07, $80, $39
	db $23, $3C, $83, $07, $23, $78, $83, $09
	db $83, $07, $80, $19, $23, $3C, $83, $07
	db $23, $78, $83, $09, $83, $07, $80, $10
	db $85, $10, $88, $10, $89, $10, $05, $1C
	db $8A, $21, $27, $1D, $85, $10, $88, $10
	db $89, $10, $05, $23, $78, $E0, $09, $E0
	db $07, $80, $20, $E0, $09, $E0, $07, $80
	db $39, $23, $3C, $E0, $07, $23, $78, $E0
	db $09, $E0, $07, $80, $19, $23, $3C, $E0
	db $07, $23, $78, $E0, $09, $E0, $07, $80
	db $10, $05, $21, $64, $13, $21, $99, $1D
	db $04, $10, $A3, $1D, $10, $FF, $E0, $04
	db $02, $E2, $1E, $21, $99, $1D, $04, $08
	db $A3, $1D, $21, $1A, $1C, $04, $10, $22
	db $1C, $2B, $80, $06, $00, $2C, $21, $13
	db $1C, $16, $02, $0A, $14, $10, $8C, $E0
	db $14, $0C, $99, $FF, $80, $01, $96, $FF
	db $80, $01, $92, $FF, $80, $01, $95, $FF
	db $80, $01, $03, $51, $1D, $10, $8E, $EE
	db $13, $11, $12, $E8, $05, $17, $01, $19
	db $02, $21, $30, $10, $8E, $F2, $05, $13
	db $18, $84, $09, $13, $F9, $84, $07, $13
	db $07, $84, $09, $13, $0C, $84, $07, $13
	db $F4, $84, $09, $13, $13, $84, $07, $13
	db $05, $84, $09, $13, $07, $84, $07, $05
	db $21, $64, $13, $17, $10, $FF, $E0, $04
	db $02, $E2, $1E, $21, $8D, $1E, $02, $0A
	db $14, $04, $01, $97, $1E, $21, $28, $1B
	db $04, $02, $C2, $20, $21, $91, $1D, $04
	db $02, $07, $20, $17, $10, $FF, $E0, $04
	db $01, $01, $1F, $21, $28, $1B, $02, $0C
	db $1B, $16, $21, $4C, $1E, $02, $09, $11
	db $21, $64, $21, $21, $05, $1E, $03, $C7
	db $1D, $80, $80, $80, $10, $9D, $10, $9E
	db $10, $A0, $10, $A0, $18, $9E, $18, $9D
	db $10, $9D, $60, $80, $20, $80, $10, $9D
	db $10, $9E, $10, $A0, $10, $A0, $18, $9E
	db $18, $9D, $10, $9D, $20, $99, $10, $99
	db $50, $80, $10, $9D, $10, $9E, $10, $A0
	db $10, $A0, $18, $9E, $18, $9D, $10, $9B
	db $60, $80, $30, $9B, $10, $9B, $10, $9D
	db $10, $9E, $10, $9D, $10, $9B, $20, $05
	db $80, $80, $80, $10, $9D, $10, $9E, $10
	db $A0, $10, $A5, $18, $A0, $18, $9E, $10
	db $9D, $20, $99, $10, $99, $50, $80, $10
	db $9D, $10, $9E, $10, $A0, $10, $A5, $18
	db $A0, $18, $9E, $10, $9D, $20, $9E, $10
	db $9D, $20, $99, $30, $80, $10, $9D, $10
	db $9E, $10, $A0, $10, $A5, $18, $A5, $18
	db $A7, $10, $A7, $40, $80, $40, $80, $80
	db $05, $01, $AF, $13, $FA, $12, $F2, $10
	db $8E, $C2, $05, $80, $10, $99, $10, $98
	db $10, $99, $09, $98, $10, $96, $37, $80
	db $10, $99, $10, $98, $10, $99, $09, $9B
	db $17, $99, $10, $98, $10, $99, $10, $98
	db $10, $96, $10, $96, $10, $94, $09, $96
	db $57, $80, $70, $80, $10, $99, $10, $98
	db $10, $99, $09, $98, $10, $96, $27, $96
	db $10, $9B, $20, $99, $20, $98, $20, $99
	db $20, $98, $10, $96, $10, $96, $10, $94
	db $09, $96, $57, $80, $70, $05, $13, $00
	db $01, $A9, $02, $50, $28, $85, $30, $02
	db $28, $50, $8A, $20, $8A, $20, $02, $3C
	db $46, $88, $30, $02, $64, $32, $82, $48
	db $02, $0A, $50, $91, $18, $13, $00, $01
	db $A9, $92, $18, $93, $20, $01, $AA, $02
	db $5A, $1E, $85, $20, $01, $A9, $02, $50
	db $28, $88, $30, $01, $AA, $02, $1E, $46
	db $8F, $20, $01, $A9, $02, $50, $28, $84
	db $20, $86, $20, $02, $50, $28, $85, $20
	db $83, $20, $02, $32, $64, $82, $50, $01
	db $AA, $02, $1E, $46, $8A, $20, $01, $A9
	db $02, $0A, $6E, $81, $30, $02, $50, $28
	db $90, $18, $8F, $20, $05, $21, $64, $13
	db $80, $14, $16, $10, $FF, $40, $04, $02
	db $E2, $1E, $21, $8D, $1E, $02, $0B, $05
	db $04, $01, $97, $1E, $21, $28, $1B, $04
	db $02, $83, $20, $21, $91, $1D, $04, $02
	db $8B, $1F, $10, $FF, $40, $04, $01, $01
	db $1F, $21, $28, $1B, $02, $0B, $05, $16
	db $21, $4C, $1E, $21, $64, $21, $02, $08
	db $03, $21, $05, $1E, $03, $4E, $1F, $06
	db $08, $02, $09, $04, $01, $3D, $9D, $01
	db $3F, $99, $01, $41, $96, $01, $43, $9D
	db $01, $45, $99, $01, $47, $96, $02, $06
	db $03, $01, $45, $9D, $01, $47, $99, $01
	db $48, $96, $02, $05, $02, $01, $47, $9D
	db $01, $48, $99, $01, $49, $96, $02, $09
	db $04, $01, $47, $9E, $01, $48, $99, $01
	db $49, $96, $01, $4A, $96, $01, $4B, $A0
	db $01, $4C, $9B, $01, $4D, $98, $02, $06
	db $03, $01, $4C, $A0, $01, $4D, $9B, $01
	db $4E, $98, $02, $05, $02, $01, $4B, $A0
	db $01, $4C, $9B, $01, $4D, $98, $02, $03
	db $01, $01, $4A, $A0, $01, $4B, $9B, $01
	db $4C, $98, $02, $02, $00, $01, $49, $A0
	db $01, $4A, $9B, $01, $4B, $A0, $01, $4C
	db $9B, $07, $05, $02, $0A, $14, $06, $08
	db $01, $3D, $9D, $01, $3F, $99, $01, $41
	db $96, $01, $43, $9D, $01, $45, $99, $01
	db $47, $96, $02, $06, $0A, $01, $45, $9D
	db $01, $47, $99, $01, $48, $96, $02, $04
	db $08, $01, $47, $9D, $01, $48, $99, $01
	db $49, $96, $02, $0A, $14, $01, $47, $9E
	db $01, $48, $99, $01, $49, $96, $01, $4A
	db $96, $01, $4B, $A0, $01, $4C, $9B, $01
	db $4D, $98, $02, $06, $0A, $01, $4C, $A0
	db $01, $4D, $9B, $01, $4E, $98, $02, $04
	db $08, $01, $4B, $A0, $01, $4C, $9B, $01
	db $4D, $98, $02, $02, $06, $01, $4A, $A0
	db $01, $4B, $9B, $01, $4C, $98, $02, $01
	db $03, $01, $49, $A0, $01, $4A, $9B, $01
	db $4B, $A0, $01, $4C, $9B, $07, $05, $06
	db $08, $02, $09, $04, $9D, $99, $96, $02
	db $06, $03, $9D, $99, $96, $02, $05, $02
	db $9D, $99, $96, $02, $01, $00, $9D, $99
	db $96, $02, $09, $04, $9E, $99, $96, $9E
	db $A0, $9B, $98, $02, $06, $03, $A0, $9B
	db $98, $02, $05, $02, $A0, $9B, $98, $02
	db $03, $01, $A0, $9B, $98, $02, $01, $00
	db $A0, $9B, $A0, $9B, $07, $05, $06, $08
	db $02, $0A, $14, $9D, $99, $96, $02, $06
	db $0A, $9D, $99, $96, $02, $04, $08, $9D
	db $99, $96, $02, $02, $06, $9D, $99, $96
	db $02, $0A, $14, $9E, $99, $96, $9E, $A0
	db $9B, $98, $02, $06, $0A, $A0, $9B, $98
	db $02, $04, $08, $A0, $9B, $98, $02, $02
	db $06, $A0, $9B, $98, $02, $01, $03, $A0
	db $9B, $A0, $9B, $07, $05, $21, $64, $13
	db $02, $0E, $04, $21, $48, $21, $21, $73
	db $21, $04, $08, $81, $21, $04, $04, $81
	db $21, $02, $0E, $04, $21, $48, $21, $2B
	db $80, $02, $00, $2C, $21, $73, $21, $04
	db $06, $3F, $21, $04, $02, $36, $21, $04
	db $06, $3F, $21, $04, $02, $36, $21, $03
	db $04, $21, $9B, $20, $9B, $20, $9B, $20
	db $9B, $20, $05, $9D, $20, $9D, $20, $9D
	db $20, $9D, $20, $05, $16, $01, $D4, $13
	db $09, $12, $DC, $10, $81, $C4, $0F, $05
	db $02, $11, $08, $2B, $A5, $01, $00, $A4
	db $01, $00, $A9, $02, $00, $2C, $0E, $05
	db $01, $21, $13, $18, $12, $AB, $10, $89
	db $CE, $0F, $06, $01, $0C, $16, $05, $16
	db $01, $D4, $13, $FD, $12, $DC, $02, $14
	db $0A, $10, $8F, $EB, $05, $96, $20, $9B
	db $20, $9B, $20, $98, $20, $05, $21, $64
	db $13, $80, $10, $02, $02, $06, $21, $48
	db $21, $21, $73, $21, $04, $08, $ED, $21
	db $04, $04, $ED, $21, $02, $02, $06, $21
	db $48, $21, $2B, $80, $02, $00, $2C, $21
	db $73, $21, $04, $02, $DB, $21, $04, $04
	db $E4, $21, $04, $02, $D2, $21, $04, $02
	db $DB, $21, $04, $04, $E4, $21, $04, $02
	db $C9, $21, $03, $8F, $21, $95, $20, $9D
	db $20, $98, $20, $98, $20, $05, $98, $20
	db $9D, $20, $94, $20, $98, $20, $05, $99
	db $20, $9E, $20, $94, $20, $99, $20, $05
	db $99, $20, $9E, $20, $96, $20, $99, $20
	db $05, $9D, $20, $A0, $20, $9D, $20, $99
	db $20, $05

DATA_EEAF4A:
	db $00, $13, $38, $07, $08, $1B, $D6, $1C
	db $B2, $1B, $A7, $1E, $5F, $1B, $36, $1C
	db $84, $20, $1C, $1E, $75, $FF, $00, $13
	db $1C, $13, $2E, $13, $40, $13, $52, $13
	db $35, $19, $C9, $19, $76, $19, $CF, $1A
	db $4A, $19, $A2, $19, $E3, $1A, $F2, $19
	db $75, $FF, $2B, $16, $BB, $16, $95, $17
	db $F4, $17, $8B, $16, $FB, $18, $C3, $18
	db $3E, $17, $DE, $FF, $7D, $14, $FF, $14
	db $4E, $15, $CB, $15, $D5, $14, $09, $16
	db $1A, $16, $EA, $15, $C0, $FF, $6E, $13
	db $B5, $13, $D0, $13, $FA, $13, $10, $14
	db $52, $14, $26, $14, $3B, $14, $C0, $FF
	db $01, $14, $13, $F0, $12, $FE, $10, $8C
	db $E8, $05, $21, $FA, $1A, $13, $08, $12
	db $00, $10, $8F, $E0, $01, $89, $23, $46
	db $99, $09, $01, $97, $10, $AF, $99, $23
	db $6E, $99, $07, $99, $09, $01, $89, $23
	db $46, $99, $10, $99, $07, $99, $05, $01
	db $97, $10, $AF, $99, $23, $6E, $99, $05
	db $99, $06, $01, $89, $23, $46, $99, $17
	db $23, $1E, $99, $03, $23, $28, $99, $03
	db $23, $32, $99, $03, $23, $46, $99, $10
	db $00, $10, $AF, $F5, $01, $96, $23, $28
	db $13, $12, $12, $D6, $0F, $02, $02, $0B
	db $05, $8C, $19, $8D, $17, $8F, $10, $88
	db $20, $88, $10, $00, $16, $01, $95, $13
	db $16, $12, $20, $10, $DC, $F2, $0F, $02
	db $02, $0B, $01, $02, $06, $0B, $16, $A0
	db $09, $9B, $07, $9D, $09, $A0, $10, $A2
	db $07, $A4, $05, $A7, $04, $A9, $06, $A0
	db $19, $80, $07, $A0, $10, $00, $21, $64
	db $13, $02, $28, $1E, $10, $AF, $AE, $A0
	db $19, $A0, $17, $A4, $10, $A0, $19, $80
	db $07, $A0, $10, $00, $21, $64, $13, $02
	db $1E, $28, $10, $AF, $AE, $9B, $19, $9D
	db $17, $9F, $10, $9B, $19, $80, $07, $9B
	db $10, $00, $21, $64, $13, $23, $23, $10
	db $AF, $AE, $98, $19, $99, $17, $9B, $10
	db $98, $19, $80, $07, $98, $10, $00, $16
	db $01, $95, $13, $16, $12, $20, $10, $DC
	db $F2, $0F, $02, $02, $0B, $01, $02, $07
	db $03, $80, $14, $03, $E2, $13, $13, $00
	db $12, $00, $01, $88, $02, $0A, $14, $10
	db $FF, $58, $99, $09, $99, $07, $99, $09
	db $99, $07, $99, $09, $99, $07, $99, $09
	db $99, $03, $99, $03, $99, $03, $99, $09
	db $99, $07, $99, $09, $99, $07, $99, $10
	db $00, $21, $FA, $1A, $21, $64, $13, $23
	db $1E, $08, $00, $04, $08, $2B, $00, $9D
	db $25, $0A, $13, $00, $12, $1E, $10, $8F
	db $D2, $13, $08, $04, $03, $BB, $14, $01
	db $89, $10, $AF, $99, $23, $64, $98, $08
	db $10, $AE, $99, $23, $14, $98, $08, $01
	db $97, $10, $AF, $99, $23, $6E, $99, $08
	db $23, $14, $99, $08, $03, $9B, $14, $01
	db $89, $23, $64, $98, $04, $10, $AE, $99
	db $23, $14, $98, $04, $01, $97, $02, $6E
	db $6E, $10, $AF, $99, $99, $08, $99, $08
	db $05, $21, $64, $13, $23, $1E, $08, $00
	db $04, $08, $20, $00, $98, $25, $0A, $13
	db $08, $01, $88, $02, $14, $1E, $10, $AF
	db $B9, $99, $18, $99, $18, $99, $18, $99
	db $18, $10, $8F, $F8, $99, $08, $99, $08
	db $03, $F8, $14, $21, $64, $13, $23, $1E
	db $08, $00, $04, $08, $1F, $00, $94, $25
	db $0A, $10, $AF, $F5, $01, $96, $23, $28
	db $13, $12, $12, $D6, $0F, $02, $02, $0B
	db $05, $06, $08, $8A, $8A, $8A, $85, $85
	db $88, $88, $8A, $87, $8A, $8B, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $8C, $8C, $8C
	db $8C, $8C, $8C, $8C, $8C, $8C, $85, $85
	db $85, $85, $85, $85, $85, $85, $88, $88
	db $88, $88, $8A, $8A, $8A, $8A, $03, $2A
	db $15, $00, $21, $64, $13, $23, $64, $09
	db $00, $04, $05, $22, $00, $91, $25, $0A
	db $01, $8F, $13, $F8, $12, $FC, $02, $32
	db $46, $21, $69, $15, $00, $10, $EF, $80
	db $80, $58, $08, $01, $02, $08, $21, $00
	db $A2, $10, $A2, $10, $A2, $0F, $08, $00
	db $01, $08, $2B, $00, $9F, $09, $0A, $9F
	db $07, $08, $00, $01, $08, $2B, $00, $9F
	db $09, $0A, $9F, $07, $08, $00, $01, $08
	db $39, $00, $A4, $09, $0A, $0F, $04, $02
	db $11, $05, $A4, $0F, $80, $01, $A4, $07
	db $08, $00, $01, $08, $39, $00, $A4, $09
	db $0A, $A4, $08, $08, $01, $02, $08, $2C
	db $00, $A7, $10, $A7, $10, $A7, $10, $10
	db $EE, $40, $A7, $10, $10, $EC, $20, $A7
	db $10, $10, $EB, $00, $A7, $10, $05, $21
	db $64, $13, $23, $0A, $08, $00, $04, $08
	db $2B, $00, $80, $05, $9D, $20, $0A, $01
	db $8F, $13, $F8, $12, $FC, $02, $1C, $12
	db $80, $0F, $21, $69, $15, $00, $21, $64
	db $13, $23, $0A, $08, $00, $04, $08, $20
	db $00, $80, $05, $98, $20, $0A, $01, $8F
	db $13, $F8, $12, $FC, $02, $08, $0E, $80
	db $1E, $21, $69, $15, $00, $21, $64, $13
	db $23, $0A, $08, $00, $04, $08, $1F, $00
	db $80, $05, $94, $30, $0A, $00, $21, $64
	db $13, $23, $28, $09, $00, $04, $05, $22
	db $00, $80, $05, $91, $30, $0A, $00, $21
	db $FA, $1A, $21, $64, $13, $23, $1E, $08
	db $00, $04, $08, $2D, $00, $9E, $20, $0A
	db $13, $00, $12, $1E, $10, $8F, $D2, $13
	db $08, $04, $0C, $4A, $16, $00, $01, $97
	db $02, $6E, $6E, $10, $AF, $99, $99, $10
	db $99, $10, $01, $89, $23, $6C, $99, $10
	db $01, $97, $02, $6E, $6E, $10, $AF, $99
	db $99, $09, $01, $89, $23, $26, $99, $10
	db $99, $07, $01, $97, $02, $6E, $6E, $10
	db $AF, $99, $99, $09, $01, $89, $23, $26
	db $99, $07, $23, $6C, $99, $10, $23, $26
	db $99, $09, $23, $2C, $99, $07, $05, $21
	db $64, $13, $23, $1E, $08, $00, $04, $08
	db $1D, $00, $9A, $20, $0A, $13, $00, $12
	db $00, $01, $88, $02, $14, $1E, $13, $08
	db $06, $10, $04, $0C, $AC, $16, $07, $00
	db $10, $8F, $F9, $99, $99, $99, $99, $99
	db $99, $99, $10, $8F, $C5, $9A, $05, $21
	db $64, $13, $23, $1E, $08, $00, $04, $08
	db $11, $00, $97, $20, $0A, $13, $00, $06
	db $10, $04, $06, $D2, $16, $00, $21, $DF
	db $16, $21, $1C, $17, $21, $DF, $16, $21
	db $2D, $17, $05, $01, $05, $23, $50, $10
	db $8F, $E0, $09, $01, $01, $0B, $0B, $00
	db $8D, $0A, $01, $07, $23, $1E, $09, $02
	db $01, $16, $16, $00, $88, $0A, $01, $01
	db $10, $8E, $EF, $87, $01, $07, $10, $8F
	db $E0, $08, $02, $01, $16, $16, $00, $89
	db $0A, $01, $02, $23, $1E, $10, $8E, $EF
	db $87, $01, $03, $10, $8F, $EF, $88, $05
	db $01, $08, $23, $1E, $10, $8E, $EF, $8A
	db $01, $06, $23, $26, $10, $8E, $E0, $82
	db $05, $01, $06, $23, $1E, $10, $8E, $E0
	db $82, $01, $08, $23, $26, $10, $8E, $EF
	db $8E, $05, $21, $64, $13, $23, $64, $09
	db $00, $03, $05, $2B, $00, $93, $20, $0A
	db $80, $05, $13, $00, $12, $1E, $10, $8F
	db $D2, $04, $0C, $5A, $17, $00, $17, $01
	db $00, $23, $1B, $97, $10, $94, $10, $16
	db $01, $A5, $23, $24, $9E, $10, $17, $01
	db $00, $23, $1B, $96, $09, $16, $01, $A5
	db $23, $0C, $A5, $10, $A4, $07, $01, $00
	db $23, $1B, $17, $98, $09, $16, $01, $A5
	db $23, $0C, $A3, $07, $23, $24, $9E, $10
	db $23, $0C, $A4, $09, $23, $11, $A5, $07
	db $05, $21, $64, $13, $23, $0A, $08, $00
	db $04, $08, $2D, $00, $80, $05, $9E, $1B
	db $0A, $10, $AF, $F3, $01, $96, $02, $1E
	db $1E, $13, $12, $12, $DF, $0F, $02, $02
	db $0B, $05, $1C, $8B, $1D, $97, $04, $02
	db $CF, $17, $1C, $84, $1D, $90, $04, $02
	db $CF, $17, $1C, $8B, $1D, $97, $04, $02
	db $CF, $17, $00, $E0, $0C, $80, $04, $E0
	db $0C, $80, $14, $E0, $0C, $80, $14, $E0
	db $0C, $80, $24, $E0, $0C, $80, $04, $E0
	db $0C, $80, $14, $E0, $0C, $80, $14, $E0
	db $0C, $80, $04, $89, $10, $8A, $10, $05
	db $21, $64, $13, $23, $0A, $08, $00, $04
	db $08, $1D, $00, $80, $05, $9A, $1B, $0A
	db $16, $02, $14, $3C, $10, $8F, $E0, $80
	db $78, $21, $7A, $18, $21, $58, $18, $16
	db $01, $95, $13, $16, $12, $20, $10, $DC
	db $F2, $0F, $02, $02, $0B, $01, $02, $06
	db $0B, $04, $02, $2A, $18, $00, $10, $8E
	db $E0, $80, $18, $9A, $04, $9B, $04, $9C
	db $1C, $80, $04, $9A, $10, $97, $0C, $80
	db $04, $80, $18, $9A, $04, $9B, $04, $9C
	db $10, $9A, $10, $9C, $08, $9E, $08, $80
	db $08, $9A, $14, $80, $04, $99, $10, $97
	db $10, $80, $10, $05, $01, $01, $13, $02
	db $12, $F2, $95, $10, $01, $02, $13, $FE
	db $12, $18, $97, $10, $01, $03, $13, $FD
	db $12, $00, $97, $08, $95, $10, $01, $04
	db $13, $FC, $12, $FE, $97, $40, $01, $04
	db $13, $FC, $12, $FE, $97, $08, $01, $01
	db $13, $02, $12, $F2, $95, $10, $01, $02
	db $13, $FE, $12, $18, $97, $10, $01, $03
	db $13, $FD, $12, $00, $97, $08, $01, $01
	db $13, $02, $12, $F2, $99, $10, $01, $02
	db $13, $FE, $12, $18, $9A, $10, $01, $04
	db $13, $FC, $12, $FE, $9A, $08, $01, $03
	db $13, $FD, $12, $00, $99, $10, $01, $04
	db $13, $FC, $12, $FE, $97, $20, $05, $21
	db $64, $13, $23, $0A, $08, $00, $04, $08
	db $11, $00, $80, $05, $97, $1B, $0A, $16
	db $80, $0F, $02, $17, $08, $10, $8F, $E0
	db $80, $78, $21, $7A, $18, $21, $58, $18
	db $16, $01, $95, $13, $16, $12, $16, $10
	db $DC, $F2, $0F, $02, $02, $0B, $01, $02
	db $07, $03, $04, $02, $2A, $18, $00, $21
	db $64, $13, $23, $28, $09, $00, $03, $05
	db $2B, $00, $80, $05, $93, $1B, $0A, $10
	db $AF, $F3, $01, $96, $02, $1E, $1E, $13
	db $12, $12, $D4, $0F, $02, $02, $0B, $05
	db $1C, $8B, $1D, $97, $04, $02, $CF, $17
	db $1C, $84, $1D, $90, $04, $02, $CF, $17
	db $1C, $8B, $1D, $97, $04, $02, $CF, $17
	db $00, $21, $FA, $1A, $17, $01, $97, $02
	db $6E, $6E, $10, $AF, $99, $13, $08, $80
	db $08, $04, $02, $56, $1B, $00, $10, $AF
	db $F3, $01, $96, $02, $1E, $1E, $13, $12
	db $12, $DF, $0F, $02, $02, $0B, $05, $80
	db $08, $8B, $10, $8B, $10, $8B, $08, $8D
	db $08, $8F, $08, $90, $10, $84, $08, $90
	db $10, $90, $0C, $90, $04, $8E, $08, $8B
	db $10, $00, $10, $AF, $F3, $01, $96, $02
	db $1E, $1E, $13, $12, $12, $D4, $0F, $02
	db $02, $0B, $05, $80, $08, $8B, $10, $8B
	db $10, $8B, $08, $8D, $08, $8F, $08, $90
	db $10, $84, $08, $90, $10, $90, $0C, $90
	db $04, $8E, $08, $8B, $10, $00, $16, $01
	db $95, $13, $0A, $12, $20, $10, $DC, $F2
	db $0F, $02, $02, $0B, $01, $02, $04, $0B
	db $9E, $04, $A0, $04, $A1, $08, $A0, $08
	db $9E, $08, $9B, $08, $A1, $08, $A3, $08
	db $A1, $08, $A0, $40, $00, $16, $01, $95
	db $13, $0A, $12, $16, $10, $DC, $F2, $0F
	db $02, $02, $0B, $01, $80, $0B, $02, $05
	db $02, $9E, $04, $A0, $04, $A1, $08, $A0
	db $08, $9E, $08, $9B, $08, $A1, $08, $A3
	db $08, $A1, $08, $A0, $40, $00, $16, $10
	db $AF, $F5, $13, $05, $12, $E8, $1C, $A1
	db $1D, $A0, $04, $01, $03, $1A, $00, $80
	db $10, $02, $08, $14, $01, $5D, $E0, $04
	db $01, $5F, $E0, $04, $01, $61, $E0, $04
	db $01, $63, $E0, $04, $01, $65, $E0, $04
	db $02, $08, $04, $E0, $04, $02, $08, $14
	db $01, $61, $E0, $04, $02, $08, $04, $01
	db $5F, $E0, $04, $02, $02, $04, $01, $5D
	db $E0, $04, $02, $08, $14, $01, $5F, $E0
	db $04, $02, $08, $04, $01, $5D, $E0, $04
	db $02, $02, $04, $01, $5B, $E0, $04, $02
	db $08, $14, $01, $63, $E1, $04, $02, $08
	db $04, $01, $61, $E1, $04, $02, $02, $04
	db $01, $5F, $E1, $04, $02, $02, $01, $01
	db $5D, $E1, $04, $02, $08, $14, $01, $5B
	db $E1, $04, $01, $5D, $E1, $04, $01, $5F
	db $E1, $04, $01, $61, $E1, $04, $02, $08
	db $14, $01, $63, $E1, $04, $02, $08, $04
	db $01, $61, $E1, $04, $02, $08, $14, $01
	db $69, $E1, $04, $02, $08, $04, $01, $67
	db $E1, $04, $02, $02, $04, $01, $63, $E1
	db $04, $02, $08, $14, $01, $65, $E1, $04
	db $02, $08, $04, $01, $63, $E1, $04, $02
	db $02, $04, $01, $5F, $E1, $04, $02, $08
	db $14, $01, $61, $E1, $04, $02, $08, $04
	db $01, $5F, $E1, $04, $02, $02, $04, $01
	db $5D, $E1, $04, $02, $02, $01, $01, $5B
	db $E1, $04, $05, $16, $02, $08, $14, $10
	db $AF, $F5, $13, $05, $12, $E8, $1C, $9E
	db $1D, $9C, $04, $01, $03, $1A, $00, $16
	db $02, $08, $14, $10, $AF, $F5, $13, $05
	db $12, $E8, $1C, $9B, $1D, $9A, $04, $01
	db $03, $1A, $00, $80, $10, $05, $18, $7F
	db $01, $01, $01, $01, $01, $01, $01, $15
	db $3A, $23, $23, $05, $1F, $08, $21, $F7
	db $1A, $21, $FA, $1A, $01, $14, $13, $F0
	db $12, $02, $02, $14, $14, $10, $88, $EC
	db $94, $40, $92, $20, $94, $20, $92, $40
	db $92, $20, $94, $20, $17, $01, $97, $02
	db $6E, $6E, $10, $AF, $99, $13, $08, $04
	db $23, $56, $1B, $04, $01, $47, $1B, $04
	db $08, $56, $1B, $04, $08, $56, $1B, $03
	db $10, $1B, $00, $99, $10, $99, $0C, $99
	db $04, $99, $08, $99, $08, $99, $08, $99
	db $08, $05, $99, $10, $99, $10, $99, $10
	db $99, $10, $05, $21, $F7, $1A, $01, $14
	db $13, $F0, $12, $02, $02, $14, $14, $10
	db $88, $EC, $9B, $40, $9B, $20, $99, $20
	db $97, $40, $9B, $20, $99, $20, $9B, $40
	db $9B, $20, $99, $20, $97, $40, $9B, $20
	db $99, $20, $01, $88, $02, $0B, $11, $13
	db $08, $04, $40, $A5, $1B, $80, $80, $80
	db $80, $80, $80, $80, $80, $04, $40, $A5
	db $1B, $04, $20, $A5, $1B, $03, $62, $1B
	db $00, $10, $DF, $5C, $99, $04, $99, $04
	db $10, $8F, $F5, $99, $08, $05, $21, $F7
	db $1A, $01, $14, $13, $F0, $12, $02, $02
	db $14, $14, $10, $88, $EC, $97, $40, $97
	db $20, $97, $20, $94, $40, $97, $20, $97
	db $20, $97, $40, $97, $20, $97, $20, $94
	db $40, $97, $20, $97, $20, $01, $85, $02
	db $21, $17, $10, $8F, $E0, $13, $00, $04
	db $08, $2F, $1C, $04, $08, $07, $1C, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $04
	db $08, $07, $1C, $04, $08, $07, $1C, $03
	db $B5, $1B, $00, $80, $08, $01, $89, $02
	db $14, $14, $99, $08, $01, $85, $02, $21
	db $17, $99, $0C, $01, $89, $02, $14, $14
	db $99, $0C, $99, $08, $01, $85, $02, $21
	db $17, $99, $08, $01, $89, $02, $14, $14
	db $99, $08, $05, $80, $10, $99, $20, $99
	db $10, $05, $21, $F7, $1A, $01, $14, $13
	db $F0, $12, $02, $02, $14, $14, $10, $88
	db $EC, $9E, $40, $9E, $20, $9D, $20, $9B
	db $40, $9E, $20, $9D, $20, $9E, $40, $9E
	db $20, $9D, $20, $9B, $40, $9E, $20, $9D
	db $20, $01, $89, $02, $14, $14, $10, $8F
	db $E0, $13, $00, $04, $07, $C5, $1C, $04
	db $01, $AD, $1C, $80, $80, $80, $80, $80
	db $80, $80, $80, $16, $01, $95, $13, $16
	db $12, $20, $10, $DF, $52, $0F, $02, $02
	db $0B, $01, $80, $80, $80, $80, $04, $01
	db $2D, $1D, $80, $80, $80, $80, $80, $80
	db $04, $02, $2D, $1D, $17, $80, $80, $80
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $80, $80, $80, $80, $80, $03, $39, $1C
	db $00, $80, $08, $99, $08, $02, $28, $28
	db $80, $0C, $99, $04, $99, $08, $99, $08
	db $99, $04, $99, $04, $99, $04, $99, $04
	db $05, $80, $08, $99, $08, $80, $0C, $99
	db $04, $80, $08, $99, $08, $80, $08, $99
	db $08, $05, $21, $F7, $1A, $16, $01, $95
	db $13, $16, $12, $20, $10, $DF, $52, $0F
	db $02, $02, $0B, $01, $80, $80, $04, $01
	db $2D, $1D, $80, $80, $04, $01, $2D, $1D
	db $80, $80, $80, $80, $80, $80, $80, $80
	db $0E, $17, $01, $45, $13, $F9, $12, $E8
	db $02, $3C, $3C, $10, $AF, $AF, $04, $08
	db $B6, $1D, $16, $01, $95, $13, $16, $12
	db $20, $10, $DF, $52, $0F, $02, $02, $0B
	db $01, $80, $80, $04, $01, $2D, $1D, $80
	db $80, $04, $01, $2D, $1D, $03, $E8, $1C
	db $00, $80, $08, $02, $08, $05, $94, $06
	db $02, $02, $04, $94, $02, $02, $08, $06
	db $A0, $06, $02, $02, $04, $A0, $02, $02
	db $08, $05, $94, $04, $A0, $02, $02, $02
	db $04, $94, $04, $A0, $06, $02, $03, $05
	db $94, $06, $02, $02, $01, $94, $02, $02
	db $03, $05, $A0, $06, $02, $02, $01, $A0
	db $02, $02, $03, $05, $94, $04, $A0, $02
	db $02, $02, $01, $94, $04, $A0, $06, $02
	db $04, $02, $94, $06, $02, $01, $02, $94
	db $02, $02, $04, $02, $A0, $06, $02, $01
	db $02, $A0, $02, $02, $04, $02, $94, $04
	db $A0, $02, $02, $01, $02, $94, $04, $A0
	db $06, $02, $01, $03, $94, $06, $02, $01
	db $00, $94, $02, $02, $01, $03, $A0, $06
	db $02, $01, $00, $A0, $02, $02, $01, $03
	db $94, $04, $A0, $02, $02, $01, $00, $94
	db $02, $05, $04, $01, $C7, $1D, $04, $01
	db $FA, $1D, $04, $01, $C7, $1D, $04, $01
	db $0B, $1E, $05, $88, $08, $94, $08, $88
	db $08, $94, $08, $88, $08, $92, $08, $8B
	db $08, $8A, $08, $05, $04, $01, $E9, $1D
	db $04, $01, $FA, $1D, $04, $01, $E9, $1D
	db $04, $01, $0B, $1E, $05, $88, $08, $94
	db $08, $88, $08, $94, $08, $88, $08, $94
	db $08, $88, $08, $8A, $08, $05, $8B, $08
	db $97, $08, $8B, $08, $97, $08, $8D, $08
	db $99, $08, $8D, $08, $8F, $08, $05, $8B
	db $08, $97, $08, $8B, $08, $97, $08, $86
	db $08, $92, $08, $86, $08, $8B, $08, $05
	db $21, $F7, $1A, $13, $F9, $12, $E8, $10
	db $8F, $EF, $04, $18, $36, $1E, $80, $80
	db $80, $80, $80, $80, $80, $80, $03, $1F
	db $1E, $00, $10, $DF, $53, $01, $3D, $02
	db $32, $0A, $A0, $04, $AC, $04, $AC, $04
	db $A0, $04, $A0, $04, $A0, $04, $A0, $04
	db $A0, $04, $A0, $04, $A0, $04, $A0, $04
	db $A0, $04, $A0, $04, $A0, $04, $A0, $04
	db $A0, $04, $02, $2D, $0F, $01, $3F, $A0
	db $04, $A0, $04, $02, $28, $14, $01, $41
	db $A0, $04, $A0, $04, $02, $23, $19, $01
	db $43, $A0, $04, $A0, $04, $02, $1E, $1E
	db $01, $45, $A0, $04, $A0, $04, $02, $19
	db $23, $01, $47, $A0, $04, $A0, $04, $02
	db $14, $28, $01, $48, $A0, $04, $A0, $04
	db $02, $0F, $2D, $01, $49, $A0, $04, $A0
	db $04, $02, $0A, $32, $01, $4A, $A0, $04
	db $A0, $04, $05, $21, $F7, $1A, $02, $08
	db $18, $10, $CF, $90, $13, $05, $12, $E8
	db $04, $04, $71, $1F, $01, $4F, $13, $05
	db $12, $E8, $02, $14, $1E, $10, $88, $E0
	db $09, $01, $06, $37, $37, $0F, $88, $80
	db $09, $01, $06, $3A, $3A, $10, $88, $80
	db $09, $01, $06, $41, $41, $11, $8A, $80
	db $09, $01, $06, $46, $46, $13, $8B, $80
	db $0A, $17, $10, $AF, $F3, $01, $96, $02
	db $1E, $1E, $13, $06, $12, $DF, $0F, $02
	db $02, $0B, $05, $04, $04, $66, $1F, $01
	db $98, $13, $00, $12, $18, $10, $8E, $EE
	db $02, $28, $28, $09, $02, $02, $08, $0B
	db $00, $8D, $80, $8E, $10, $8F, $70, $80
	db $80, $8D, $80, $0A, $04, $04, $FB, $1F
	db $02, $0A, $1E, $10, $CF, $90, $04, $04
	db $B2, $1F, $80, $40, $04, $01, $D6, $1F
	db $80, $40, $04, $01, $D6, $1F, $04, $02
	db $3A, $1F, $03, $AA, $1E, $00, $17, $10
	db $AF, $F3, $01, $96, $02, $1E, $1E, $13
	db $06, $12, $DF, $0F, $02, $02, $0B, $05
	db $94, $10, $94, $10, $94, $08, $92, $08
	db $97, $10, $0E, $13, $05, $12, $E8, $02
	db $0A, $1E, $10, $CF, $90, $04, $01, $D6
	db $1F, $05, $94, $10, $94, $10, $94, $08
	db $92, $08, $97, $50, $05, $01, $69, $94
	db $08, $01, $6B, $97, $08, $01, $5B, $9E
	db $08, $01, $5A, $94, $08, $01, $65, $97
	db $08, $01, $67, $9E, $08, $01, $5B, $94
	db $08, $01, $5D, $9B, $08, $01, $71, $96
	db $08, $01, $5A, $97, $08, $01, $5E, $9E
	db $08, $01, $6D, $9B, $08, $01, $73, $9D
	db $08, $01, $71, $9E, $08, $01, $6B, $9D
	db $08, $01, $5C, $99, $08, $05, $01, $5F
	db $9B, $08, $01, $5B, $A3, $08, $01, $60
	db $A2, $08, $01, $5A, $9B, $04, $01, $61
	db $9E, $08, $01, $5B, $9E, $04, $01, $62
	db $9B, $08, $01, $5A, $9E, $08, $01, $64
	db $A0, $08, $01, $65, $99, $08, $01, $5B
	db $9B, $08, $01, $67, $9E, $08, $01, $5B
	db $9B, $04, $01, $68, $9E, $08, $01, $5E
	db $9E, $04, $01, $5D, $9B, $08, $01, $69
	db $9E, $08, $01, $6A, $A0, $08, $05, $17
	db $10, $AE, $99, $13, $05, $12, $E8, $01
	db $5A, $88, $04, $01, $5B, $88, $04, $01
	db $5C, $88, $04, $01, $5D, $88, $04, $01
	db $5E, $88, $04, $01, $5F, $88, $04, $01
	db $60, $88, $04, $01, $61, $88, $04, $01
	db $62, $88, $04, $01, $63, $88, $04, $01
	db $64, $88, $04, $01, $65, $88, $04, $01
	db $66, $88, $04, $01, $67, $88, $04, $01
	db $68, $88, $04, $01, $69, $88, $04, $01
	db $6A, $88, $04, $01, $6B, $88, $04, $01
	db $6C, $88, $04, $01, $6D, $88, $04, $01
	db $6E, $88, $04, $01, $6F, $88, $04, $01
	db $70, $88, $04, $01, $71, $88, $04, $01
	db $72, $88, $04, $01, $73, $88, $04, $01
	db $74, $88, $04, $01, $75, $88, $04, $01
	db $76, $88, $04, $01, $77, $88, $04, $01
	db $78, $88, $04, $01, $79, $88, $04, $05
	db $21, $F7, $1A, $02, $0E, $06, $10, $CF
	db $90, $13, $FE, $12, $E8, $04, $02, $71
	db $1F, $13, $05, $80, $0C, $04, $02, $71
	db $1F, $01, $4F, $13, $05, $12, $E8, $02
	db $0E, $08, $10, $88, $E0, $09, $01, $06
	db $37, $37, $0F, $88, $80, $09, $01, $06
	db $3A, $3A, $10, $89, $80, $09, $01, $06
	db $41, $41, $11, $8A, $80, $09, $01, $06
	db $46, $46, $13, $8B, $74, $0A, $80, $01
	db $17, $10, $AE, $F2, $01, $96, $02, $1A
	db $1A, $13, $06, $12, $D4, $0F, $02, $01
	db $12, $05, $04, $04, $66, $1F, $80, $0B
	db $01, $98, $13, $00, $12, $E8, $10, $8E
	db $EB, $02, $12, $12, $09, $02, $02, $08
	db $0B, $00, $8D, $80, $8E, $10, $8F, $70
	db $80, $80, $8D, $80, $0A, $04, $04, $FB
	db $1F, $02, $11, $06, $10, $CF, $90, $04
	db $04, $B2, $1F, $80, $40, $04, $01, $D6
	db $1F, $80, $40, $04, $01, $43, $21, $04
	db $02, $23, $21, $03, $87, $20, $00, $17
	db $10, $AE, $F2, $01, $96, $02, $1A, $1A
	db $13, $06, $12, $D4, $0F, $02, $01, $12
	db $05, $80, $01, $94, $10, $94, $10, $94
	db $08, $92, $08, $97, $0F, $80, $0C, $02
	db $11, $06, $10, $CF, $90, $13, $05, $12
	db $E8, $0E, $01, $65, $99, $08, $01, $5B
	db $9B, $08, $01, $67, $9E, $08, $01, $5B
	db $9B, $04, $01, $68, $9E, $08, $01, $5E
	db $9E, $04, $01, $5D, $9B, $08, $01, $69
	db $9E, $04, $05

DATA_EEBDBD:
	db $00, $13, $51, $08, $50, $13, $B6, $17
	db $28, $14, $E5, $16, $33, $16, $CA, $14
	db $8F, $15, $E0, $13, $B0, $FF, $00, $13
	db $1A, $13, $2C, $13, $3E, $13, $1A, $19
	db $45, $19, $6B, $19, $3E, $1A, $93, $19
	db $18, $1A, $F2, $19, $64, $1A, $B0, $FF
	db $08, $18, $36, $18, $53, $18, $DE, $18
	db $78, $18, $C0, $18, $9F, $18, $FC, $18
	db $90, $FF, $8C, $1A, $23, $1C, $FD, $1D
	db $89, $22, $B2, $1E, $41, $21, $8C, $23
	db $FA, $1F, $B0, $FF, $1F, $04, $21, $05
	db $18, $24, $4B, $15, $30, $14, $14, $18
	db $7F, $01, $01, $01, $01, $01, $01, $01
	db $16, $01, $36, $09, $02, $01, $16, $0B
	db $00, $10, $9F, $B4, $23, $28, $80, $06
	db $91, $02, $92, $03, $91, $05, $8F, $06
	db $17, $01, $00, $23, $50, $10, $CF, $96
	db $8E, $0A, $16, $01, $19, $02, $24, $10
	db $10, $CF, $96, $90, $10, $90, $06, $01
	db $A5, $02, $46, $50, $10, $AF, $EB, $16
	db $99, $10, $17, $01, $19, $02, $1C, $18
	db $10, $CF, $96, $95, $0A, $95, $06, $17
	db $01, $00, $23, $50, $10, $CF, $96, $8E
	db $0A, $16, $01, $19, $02, $0C, $28, $10
	db $DF, $99, $A4, $10, $A4, $06, $01, $A5
	db $02, $46, $50, $10, $AF, $EB, $16, $99
	db $10, $17, $01, $19, $02, $24, $10, $10
	db $CF, $96, $95, $05, $95, $05, $95, $06
	db $17, $03, $7D, $13, $21, $05, $18, $80
	db $16, $01, $8D, $02, $30, $1A, $13, $00
	db $04, $20, $18, $14, $01, $15, $13, $FC
	db $12, $03, $02, $1C, $0A, $10, $9B, $A8
	db $93, $E0, $01, $A2, $13, $08, $12, $F6
	db $10, $DE, $51, $02, $18, $20, $93, $08
	db $80, $02, $93, $0D, $02, $0A, $08, $93
	db $09, $03, $E5, $13, $10, $FF, $4B, $98
	db $10, $10, $FE, $4B, $98, $0A, $10, $FF
	db $4E, $98, $06, $05, $21, $05, $18, $80
	db $16, $01, $B8, $13, $0C, $12, $A6, $23
	db $58, $10, $9F, $AB, $04, $02, $8B, $14
	db $04, $02, $5F, $14, $06, $10, $87, $87
	db $87, $87, $87, $87, $87, $87, $87, $87
	db $87, $87, $87, $07, $87, $0A, $87, $06
	db $8C, $08, $80, $02, $8C, $06, $80, $10
	db $03, $38, $14, $10, $DF, $88, $8E, $10
	db $8E, $10, $8E, $10, $8E, $0A, $8E, $06
	db $8E, $10, $8E, $10, $8E, $10, $8E, $0A
	db $8E, $06, $8E, $10, $8E, $10, $8E, $10
	db $8E, $0A, $8E, $06, $8A, $10, $8A, $10
	db $89, $10, $89, $0A, $8D, $06, $05, $10
	db $DF, $E2, $89, $10, $89, $10, $89, $0A
	db $89, $06, $87, $0A, $88, $06, $10, $DF
	db $E2, $89, $10, $89, $10, $89, $0A, $89
	db $06, $10, $FF, $50, $93, $05, $94, $05
	db $95, $06, $10, $DF, $E2, $89, $10, $89
	db $10, $89, $10, $89, $0A, $89, $10, $89
	db $06, $89, $10, $89, $0A, $89, $06, $86
	db $05, $87, $05, $88, $06, $05, $21, $05
	db $18, $80, $16, $16, $01, $A2, $13, $08
	db $12, $F6, $02, $18, $20, $10, $DE, $51
	db $04, $02, $40, $15, $13, $FC, $04, $02
	db $0E, $15, $01, $15, $13, $FC, $12, $03
	db $02, $0A, $1C, $10, $9B, $A8, $9D, $E0
	db $01, $A2, $13, $08, $12, $F6, $10, $DE
	db $51, $02, $18, $20, $9D, $08, $80, $02
	db $9D, $0D, $02, $0A, $08, $9D, $09, $03
	db $D0, $14, $04, $03, $2C, $15, $04, $01
	db $1F, $15, $14, $FF, $04, $01, $1F, $15
	db $14, $01, $05, $80, $0A, $02, $18, $20
	db $9D, $0D, $02, $0A, $08, $9D, $09, $05
	db $02, $18, $20, $9D, $18, $80, $02, $9D
	db $0D, $02, $0A, $08, $9D, $0D, $02, $04
	db $06, $9D, $0C, $05, $02, $18, $20, $80
	db $0A, $99, $14, $80, $02, $9A, $0C, $02
	db $0A, $08, $9A, $0C, $02, $04, $06, $9A
	db $08, $02, $18, $20, $80, $0A, $99, $14
	db $80, $02, $9A, $0C, $02, $0A, $08, $9A
	db $0C, $02, $04, $06, $9A, $08, $80, $0A
	db $02, $18, $20, $99, $14, $80, $02, $9A
	db $0D, $02, $0A, $08, $9A, $0D, $02, $18
	db $20, $9C, $14, $80, $02, $9A, $0E, $80
	db $02, $99, $0A, $9A, $0C, $02, $0A, $08
	db $9A, $0A, $05, $21, $05, $18, $80, $16
	db $16, $01, $A2, $13, $08, $12, $F6, $02
	db $18, $20, $10, $DE, $51, $04, $02, $E4
	db $15, $04, $02, $D1, $15, $01, $15, $13
	db $FC, $12, $03, $02, $1C, $0A, $10, $9B
	db $A8, $9A, $E0, $01, $A2, $13, $08, $12
	db $F6, $10, $DE, $51, $02, $18, $20, $9A
	db $08, $80, $02, $9A, $0D, $02, $0A, $08
	db $9A, $09, $03, $95, $15, $14, $FD, $04
	db $03, $2C, $15, $04, $01, $1F, $15, $14
	db $FE, $04, $01, $1F, $15, $14, $05, $05
	db $02, $18, $20, $80, $0A, $93, $14, $80
	db $02, $93, $0C, $02, $0A, $08, $93, $0C
	db $02, $04, $06, $93, $08, $02, $18, $20
	db $80, $0A, $93, $14, $80, $02, $93, $0C
	db $02, $0A, $08, $93, $0C, $02, $04, $06
	db $93, $08, $80, $0A, $02, $18, $20, $93
	db $14, $80, $02, $93, $0D, $02, $0A, $08
	db $93, $0D, $02, $18, $20, $99, $14, $80
	db $02, $97, $0E, $80, $02, $95, $0A, $97
	db $0C, $02, $0A, $08, $97, $0A, $05, $21
	db $05, $18, $80, $16, $16, $01, $A2, $13
	db $08, $12, $F6, $02, $18, $20, $10, $DE
	db $51, $04, $02, $96, $16, $04, $02, $75
	db $16, $01, $15, $13, $FC, $12, $03, $02
	db $0A, $1C, $10, $9B, $A8, $96, $E0, $01
	db $A2, $13, $08, $12, $F6, $10, $DE, $51
	db $02, $18, $20, $96, $08, $80, $02, $96
	db $0D, $02, $0A, $08, $96, $09, $03, $39
	db $16, $14, $F8, $04, $01, $2C, $15, $14
	db $01, $04, $01, $2C, $15, $14, $01, $04
	db $01, $2C, $15, $14, $FE, $04, $01, $1F
	db $15, $14, $FE, $04, $01, $1F, $15, $14
	db $0A, $05, $02, $18, $20, $80, $0A, $90
	db $14, $80, $02, $90, $0C, $02, $0A, $08
	db $90, $0C, $02, $04, $06, $90, $08, $02
	db $18, $20, $80, $0A, $90, $14, $80, $02
	db $90, $0C, $02, $0A, $08, $90, $0C, $02
	db $04, $06, $90, $08, $80, $0A, $02, $18
	db $20, $90, $14, $80, $02, $90, $0D, $02
	db $0A, $08, $90, $0D, $02, $18, $20, $93
	db $14, $80, $02, $93, $0E, $80, $02, $93
	db $0A, $93, $0C, $02, $0A, $08, $93, $0A
	db $05, $21, $05, $18, $16, $01, $B6, $13
	db $05, $12, $EA, $02, $28, $32, $10, $9F
	db $B1, $93, $06, $99, $0A, $9A, $06, $04
	db $01, $87, $17, $95, $0A, $97, $06, $99
	db $0A, $9A, $06, $04, $01, $87, $17, $8D
	db $0A, $8E, $06, $90, $0A, $80, $06, $01
	db $B7, $13, $01, $12, $EC, $02, $28, $32
	db $10, $9F, $A1, $04, $02, $3E, $17, $01
	db $B6, $13, $05, $12, $EA, $04, $01, $32
	db $17, $96, $6A, $03, $E9, $16, $10, $CE
	db $47, $9D, $30, $9C, $10, $9A, $30, $98
	db $10, $05, $80, $10, $9A, $0E, $80, $02
	db $9D, $07, $80, $03, $9A, $12, $80, $04
	db $9D, $0E, $80, $02, $9A, $09, $80, $01
	db $9D, $12, $80, $04, $9D, $09, $80, $01
	db $9D, $08, $80, $02, $80, $0C, $9A, $0E
	db $80, $02, $9D, $07, $80, $03, $9A, $0E
	db $80, $02, $9D, $0E, $80, $02, $9D, $05
	db $80, $01, $9F, $08, $80, $02, $A1, $05
	db $80, $01, $9F, $08, $80, $02, $9C, $12
	db $80, $04, $05, $99, $0A, $95, $0E, $80
	db $02, $93, $10, $80, $06, $99, $0A, $9A
	db $06, $99, $0A, $95, $0E, $80, $02, $93
	db $10, $93, $06, $99, $0A, $9A, $06, $99
	db $0A, $95, $0E, $80, $02, $93, $10, $93
	db $06, $97, $0A, $95, $10, $90, $10, $90
	db $06, $05, $21, $05, $18, $16, $01, $B7
	db $13, $01, $12, $EC, $02, $32, $28, $10
	db $9F, $B1, $93, $06, $99, $0A, $9A, $06
	db $04, $01, $87, $17, $95, $0A, $97, $06
	db $99, $0A, $9A, $06, $04, $01, $87, $17
	db $8D, $0A, $8E, $06, $90, $0A, $80, $06
	db $80, $0A, $01, $B7, $13, $01, $12, $EC
	db $02, $11, $0D, $10, $9F, $A1, $04, $02
	db $3E, $17, $01, $B6, $13, $05, $12, $EA
	db $04, $01, $32, $17, $96, $60, $03, $BA
	db $17, $80, $10, $05, $15, $3A, $21, $21
	db $18, $7F, $01, $01, $01, $01, $01, $01
	db $01, $24, $52, $01, $B8, $13, $0C, $12
	db $A6, $02, $58, $58, $10, $9F, $AB, $90
	db $03, $91, $03, $92, $09, $91, $07, $90
	db $09, $8E, $10, $8D, $07, $8B, $10, $86
	db $20, $00, $01, $8D, $13, $00, $12, $00
	db $02, $1E, $50, $10, $DF, $91, $80, $06
	db $99, $10, $99, $09, $99, $07, $99, $09
	db $99, $07, $99, $10, $99, $20, $00, $01
	db $B6, $13, $05, $12, $EA, $16, $02, $32
	db $1E, $10, $9F, $AB, $0F, $02, $02, $08
	db $11, $9C, $03, $9D, $03, $9E, $09, $9D
	db $07, $9C, $09, $9A, $10, $99, $07, $97
	db $10, $95, $20, $00, $01, $B6, $13, $05
	db $12, $EA, $16, $02, $0B, $11, $10, $9F
	db $AB, $0F, $02, $02, $08, $11, $80, $0B
	db $9C, $03, $9D, $03, $9E, $09, $9D, $07
	db $9C, $09, $9A, $10, $99, $07, $97, $10
	db $95, $20, $00, $01, $B7, $13, $01, $12
	db $EC, $14, $F4, $02, $28, $32, $10, $9F
	db $B1, $9C, $03, $9D, $03, $9E, $09, $9D
	db $07, $9C, $09, $9A, $10, $99, $07, $97
	db $10, $99, $20, $00, $01, $33, $13, $FC
	db $12, $19, $02, $19, $0A, $10, $EB, $EE
	db $16, $80, $06, $9E, $0E, $80, $02, $9E
	db $07, $A1, $14, $80, $03, $A1, $10, $A1
	db $20, $00, $01, $33, $13, $FC, $12, $19
	db $02, $19, $0A, $10, $EB, $EE, $16, $80
	db $06, $99, $0E, $80, $02, $99, $07, $9A
	db $14, $80, $04, $9A, $10, $9E, $20, $00
	db $01, $33, $13, $FC, $12, $19, $02, $19
	db $0A, $10, $EB, $EE, $16, $80, $06, $95
	db $0E, $80, $02, $95, $07, $97, $14, $80
	db $03, $97, $10, $99, $20, $00, $15, $3A
	db $0F, $0F, $18, $7F, $01, $01, $01, $01
	db $01, $01, $01, $24, $52, $01, $B8, $13
	db $0C, $12, $A6, $02, $58, $58, $10, $9F
	db $AB, $17, $80, $07, $8B, $10, $8B, $10
	db $8D, $10, $8D, $09, $86, $17, $86, $20
	db $00, $01, $B6, $13, $05, $12, $EA, $16
	db $02, $32, $1E, $10, $9F, $AB, $9E, $07
	db $9B, $09, $9E, $07, $A0, $09, $A1, $07
	db $A2, $09, $A5, $07, $A7, $09, $AA, $10
	db $80, $05, $A7, $02, $A8, $20, $00, $01
	db $B6, $13, $05, $12, $EA, $16, $02, $0B
	db $11, $10, $9F, $AB, $80, $0B, $9E, $07
	db $9B, $09, $9E, $07, $A0, $09, $A1, $07
	db $A2, $09, $A5, $07, $A7, $09, $AA, $10
	db $80, $05, $A8, $02, $A8, $20, $00, $17
	db $01, $A5, $02, $28, $28, $10, $8F, $F5
	db $99, $07, $01, $00, $02, $40, $40, $10
	db $8F, $F5, $9A, $10, $01, $A5, $02, $3C
	db $46, $10, $8F, $F5, $16, $99, $10, $17
	db $01, $00, $02, $40, $40, $10, $8F, $F5
	db $9A, $09, $01, $A5, $02, $3C, $46, $10
	db $8F, $F5, $16, $99, $07, $99, $09, $9A
	db $17, $99, $09, $99, $0F, $01, $36, $09
	db $02, $01, $16, $0B, $00, $10, $9F, $B4
	db $02, $14, $2D, $92, $03, $02, $28, $3C
	db $92, $03, $02, $3C, $46, $92, $03, $02
	db $50, $5A, $8E, $30, $17, $00, $17, $01
	db $B7, $13, $01, $12, $EC, $02, $1E, $32
	db $10, $9F, $B1, $9E, $07, $9B, $09, $9E
	db $07, $A0, $09, $A1, $07, $A2, $09, $A5
	db $07, $A7, $09, $AA, $10, $80, $05, $A7
	db $02, $A8, $20, $00, $17, $01, $33, $13
	db $FC, $12, $19, $02, $28, $14, $10, $8F
	db $E0, $80, $07, $9B, $09, $80, $07, $9B
	db $09, $80, $07, $9D, $09, $80, $07, $9D
	db $07, $80, $02, $9E, $10, $80, $07, $99
	db $20, $00, $17, $01, $33, $13, $FC, $12
	db $19, $02, $28, $14, $10, $8F, $E0, $80
	db $07, $97, $09, $80, $07, $95, $09, $80
	db $07, $97, $09, $80, $07, $97, $07, $80
	db $02, $96, $10, $80, $07, $96, $20, $00
	db $17, $01, $B7, $13, $01, $12, $EC, $02
	db $11, $0B, $10, $9F, $B1, $80, $0B, $9E
	db $07, $9B, $09, $9E, $07, $A0, $09, $A1
	db $07, $A2, $09, $A5, $07, $A7, $09, $AA
	db $10, $80, $05, $A7, $02, $A8, $20, $00
	db $24, $50, $15, $3A, $21, $21, $18, $7F
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $B6, $13, $05, $12, $EA, $02, $32, $1E
	db $10, $9F, $B1, $16, $99, $07, $9C, $09
	db $9D, $07, $9C, $09, $9D, $07, $9B, $09
	db $99, $07, $98, $09, $95, $07, $96, $19
	db $02, $1E, $0A, $A0, $04, $A1, $03, $10
	db $8B, $E1, $0F, $04, $03, $17, $04, $08
	db $0B, $01, $1C, $1F, $00, $A2, $30, $0A
	db $0E, $01, $B7, $13, $01, $12, $EC, $02
	db $1C, $11, $10, $9F, $B1, $80, $07, $96
	db $09, $99, $07, $9C, $09, $9D, $07, $80
	db $09, $95, $07, $96, $09, $99, $07, $9C
	db $09, $9D, $10, $80, $20, $02, $1E, $14
	db $10, $9F, $B1, $91, $09, $96, $07, $98
	db $09, $99, $07, $98, $09, $96, $07, $98
	db $10, $01, $B6, $13, $05, $12, $EA, $02
	db $14, $0A, $10, $8B, $E1, $96, $07, $98
	db $09, $08, $00, $01, $06, $50, $00, $98
	db $07, $08, $01, $01, $04, $46, $00, $96
	db $09, $0A, $96, $07, $95, $10, $80, $10
	db $01, $B7, $13, $01, $12, $EC, $02, $1C
	db $11, $10, $9F, $B1, $95, $09, $96, $07
	db $98, $09, $9B, $07, $80, $09, $91, $07
	db $95, $09, $96, $07, $98, $09, $9B, $10
	db $80, $09, $01, $B6, $13, $05, $12, $EA
	db $02, $32, $1E, $10, $9F, $B1, $98, $07
	db $9C, $09, $9D, $07, $9C, $09, $9D, $07
	db $9C, $09, $9B, $07, $99, $09, $98, $07
	db $99, $10, $02, $0E, $17, $10, $8F, $E1
	db $13, $F9, $91, $07, $96, $09, $99, $07
	db $08, $01, $03, $07, $1C, $00, $9B, $10
	db $9B, $10, $0A, $99, $09, $96, $07, $01
	db $B3, $13, $FC, $12, $F6, $02, $1C, $12
	db $10, $9E, $CB, $21, $C4, $1D, $01, $B6
	db $13, $05, $12, $EA, $02, $14, $0A, $10
	db $8B, $E1, $96, $07, $98, $09, $08, $00
	db $01, $06, $50, $00, $98, $07, $08, $01
	db $01, $04, $46, $00, $96, $09, $0A, $96
	db $07, $95, $10, $80, $10, $01, $B3, $13
	db $FC, $12, $F6, $02, $1C, $12, $10, $9E
	db $CB, $21, $A7, $1D, $96, $02, $01, $B6
	db $13, $05, $12, $EA, $02, $32, $1E, $10
	db $9F, $B1, $98, $07, $9C, $09, $9D, $07
	db $9C, $09, $9D, $07, $9C, $09, $9B, $07
	db $99, $09, $98, $07, $99, $10, $01, $B3
	db $13, $FC, $12, $F6, $02, $17, $11, $10
	db $9E, $CB, $9D, $07, $A0, $05, $A1, $05
	db $A2, $06, $9D, $09, $9C, $07, $9B, $02
	db $01, $B6, $13, $05, $12, $EA, $02, $32
	db $1E, $10, $9F, $B1, $03, $A8, $1A, $01
	db $B7, $13, $01, $12, $EC, $02, $1E, $32
	db $10, $9F, $B1, $16, $99, $07, $9C, $09
	db $9D, $07, $9C, $09, $9D, $07, $9B, $09
	db $99, $07, $98, $09, $95, $07, $96, $09
	db $01, $B5, $13, $FE, $12, $EF, $02, $3C
	db $50, $10, $8F, $E0, $A2, $10, $A0, $04
	db $A1, $03, $A2, $08, $02, $14, $1E, $A2
	db $08, $02, $0A, $0F, $A2, $08, $02, $04
	db $07, $A2, $08, $01, $B7, $13, $01, $12
	db $EC, $02, $28, $46, $10, $9F, $B1, $80
	db $10, $96, $09, $99, $07, $9C, $09, $9D
	db $07, $80, $09, $95, $07, $96, $09, $99
	db $07, $9C, $09, $9D, $10, $80, $27, $96
	db $09, $99, $07, $9C, $09, $9D, $07, $9B
	db $09, $99, $07, $9B, $09, $01, $B6, $13
	db $05, $12, $EA, $02, $1E, $32, $10, $8B
	db $E1, $96, $07, $98, $09, $08, $00, $01
	db $06, $50, $00, $98, $07, $08, $01, $01
	db $04, $46, $00, $96, $09, $0A, $96, $07
	db $95, $10, $80, $10, $01, $B7, $13, $01
	db $12, $EC, $02, $28, $46, $10, $9F, $B1
	db $95, $09, $96, $07, $98, $09, $9B, $07
	db $80, $09, $91, $07, $95, $09, $96, $07
	db $98, $09, $9B, $10, $80, $10, $98, $07
	db $9C, $09, $9D, $07, $9C, $09, $9D, $07
	db $9C, $09, $9B, $07, $99, $09, $98, $07
	db $99, $09, $01, $B6, $13, $F9, $12, $EA
	db $02, $3C, $28, $10, $8F, $E1, $91, $07
	db $96, $09, $99, $07, $08, $01, $03, $07
	db $1C, $00, $9B, $10, $9B, $10, $0A, $99
	db $09, $96, $07, $01, $B3, $13, $FC, $12
	db $F6, $02, $28, $3C, $10, $9E, $CE, $21
	db $C4, $1D, $01, $B6, $13, $05, $12, $EA
	db $02, $1E, $32, $10, $8B, $E1, $96, $07
	db $98, $09, $08, $00, $01, $06, $50, $00
	db $98, $07, $08, $01, $01, $04, $46, $00
	db $96, $09, $0A, $96, $07, $95, $10, $80
	db $10, $01, $B3, $13, $FC, $12, $F6, $02
	db $28, $3C, $10, $9E, $CE, $21, $A7, $1D
	db $96, $09, $01, $B7, $13, $01, $12, $EC
	db $02, $1E, $32, $10, $9F, $B1, $98, $07
	db $9C, $09, $9D, $07, $9C, $09, $9D, $07
	db $9C, $09, $9B, $07, $99, $09, $98, $07
	db $99, $09, $01, $B3, $13, $FC, $12, $F6
	db $02, $28, $32, $10, $9E, $CE, $9D, $07
	db $A0, $05, $A1, $05, $A2, $06, $9D, $09
	db $9C, $07, $9B, $09, $01, $B7, $13, $01
	db $12, $EC, $02, $1E, $32, $10, $9F, $B1
	db $03, $30, $1C, $14, $0C, $95, $06, $96
	db $05, $97, $05, $98, $09, $9B, $07, $9C
	db $09, $9D, $07, $A1, $09, $9D, $07, $9C
	db $09, $9D, $07, $9B, $09, $98, $07, $05
	db $14, $0C, $96, $09, $99, $07, $9C, $09
	db $9D, $07, $80, $0B, $9C, $03, $9D, $02
	db $A2, $10, $9B, $10, $99, $09, $96, $07
	db $80, $09, $9B, $04, $9C, $03, $9D, $06
	db $99, $05, $9C, $05, $9D, $05, $99, $05
	db $9C, $06, $A2, $05, $99, $06, $9C, $05
	db $A2, $06, $9B, $05, $99, $05, $9B, $09
	db $05, $01, $B8, $13, $0C, $12, $A6, $02
	db $58, $58, $10, $9F, $AB, $85, $07, $86
	db $10, $86, $10, $88, $10, $89, $10, $8A
	db $09, $8A, $07, $85, $10, $86, $10, $88
	db $09, $89, $07, $8A, $10, $8A, $10, $85
	db $10, $85, $10, $8A, $09, $8A, $07, $85
	db $10, $86, $10, $88, $10, $8A, $10, $8A
	db $10, $8D, $10, $8D, $10, $8C, $09, $8C
	db $07, $89, $10, $8A, $10, $8C, $10, $85
	db $10, $89, $10, $8A, $10, $8C, $10, $85
	db $09, $85, $07, $89, $10, $8A, $10, $8C
	db $10, $85, $10, $89, $10, $8A, $10, $8C
	db $10, $8A, $09, $8A, $07, $85, $10, $86
	db $10, $88, $10, $8A, $10, $8A, $10, $85
	db $10, $85, $10, $8A, $09, $8A, $07, $85
	db $10, $86, $10, $88, $10, $8A, $10, $8A
	db $10, $8D, $10, $8D, $10, $8C, $09, $8C
	db $07, $89, $10, $8A, $10, $8C, $10, $85
	db $10, $89, $10, $8A, $10, $8C, $10, $85
	db $09, $85, $07, $89, $10, $8A, $10, $8C
	db $10, $86, $10, $86, $10, $89, $10, $89
	db $10, $8A, $09, $8A, $07, $85, $10, $86
	db $10, $88, $09, $03, $09, $1E, $01, $B3
	db $13, $FC, $12, $F6, $02, $14, $28, $10
	db $AF, $8B, $80, $07, $9C, $10, $9C, $10
	db $9B, $19, $9B, $07, $9D, $20, $80, $20
	db $01, $33, $13, $FC, $12, $19, $02, $28
	db $14, $10, $8F, $E0, $16, $80, $09, $9D
	db $07, $80, $10, $9C, $09, $80, $07, $80
	db $10, $80, $09, $9D, $07, $80, $10, $9C
	db $09, $80, $07, $80, $09, $01, $B5, $13
	db $FE, $12, $EF, $02, $1E, $32, $10, $8F
	db $E0, $9D, $07, $01, $33, $13, $FC, $12
	db $19, $02, $1E, $14, $10, $F8, $E0, $99
	db $20, $99, $20, $98, $09, $02, $28, $14
	db $10, $8E, $E0, $9B, $09, $80, $07, $80
	db $07, $9B, $09, $80, $07, $9B, $09, $80
	db $07, $10, $FA, $E0, $80, $09, $99, $10
	db $80, $07, $10, $8F, $E0, $98, $09, $80
	db $07, $80, $10, $10, $FA, $E0, $80, $09
	db $98, $10, $80, $07, $10, $8F, $E0, $99
	db $09, $80, $07, $80, $10, $01, $B3, $13
	db $FC, $12, $F6, $02, $14, $28, $10, $AF
	db $8E, $9D, $10, $9D, $10, $9B, $10, $9B
	db $09, $99, $10, $99, $17, $99, $10, $99
	db $10, $01, $33, $13, $FC, $12, $19, $02
	db $28, $14, $10, $8F, $E0, $80, $09, $9D
	db $07, $80, $10, $9C, $09, $80, $07, $80
	db $10, $80, $09, $9D, $07, $80, $10, $9C
	db $09, $80, $07, $80, $09, $01, $B5, $13
	db $FE, $12, $EF, $02, $1E, $32, $10, $8F
	db $E0, $9D, $07, $01, $33, $13, $FC, $12
	db $19, $02, $1E, $14, $10, $F8, $E0, $99
	db $20, $99, $20, $98, $09, $02, $28, $14
	db $10, $8E, $E0, $9B, $09, $80, $07, $80
	db $07, $9B, $09, $80, $07, $9B, $09, $80
	db $07, $10, $FA, $E0, $80, $09, $99, $10
	db $80, $07, $10, $8F, $E0, $98, $09, $80
	db $07, $80, $10, $10, $FA, $E0, $80, $09
	db $98, $10, $80, $07, $10, $8F, $E0, $99
	db $09, $80, $07, $80, $10, $01, $B3, $13
	db $FC, $12, $F6, $02, $14, $28, $10, $AF
	db $8B, $9C, $10, $9C, $10, $9B, $19, $9B
	db $07, $9D, $39, $03, $BE, $1E, $01, $B3
	db $13, $FC, $12, $F6, $23, $1E, $10, $AE
	db $8B, $80, $07, $99, $10, $99, $10, $98
	db $19, $98, $07, $99, $20, $80, $20, $01
	db $33, $13, $FC, $12, $19, $02, $28, $14
	db $10, $8F, $E0, $16, $80, $09, $99, $07
	db $80, $10, $99, $09, $80, $07, $80, $10
	db $80, $09, $99, $07, $80, $10, $99, $09
	db $80, $07, $80, $09, $01, $B5, $13, $FE
	db $12, $EF, $02, $1E, $32, $10, $8F, $E0
	db $96, $07, $01, $33, $13, $FC, $12, $19
	db $02, $1E, $14, $10, $F8, $E0, $96, $20
	db $96, $20, $96, $09, $02, $28, $14, $10
	db $8E, $E0, $98, $09, $80, $07, $80, $07
	db $98, $09, $80, $07, $98, $09, $80, $07
	db $10, $FA, $E0, $80, $09, $95, $10, $80
	db $07, $10, $8F, $E0, $95, $09, $80, $07
	db $80, $10, $10, $FA, $E0, $80, $09, $95
	db $10, $80, $07, $10, $8F, $E0, $95, $09
	db $80, $07, $80, $10, $01, $B3, $13, $FC
	db $12, $F6, $02, $14, $28, $10, $AF, $8E
	db $99, $10, $99, $10, $98, $10, $98, $09
	db $96, $10, $96, $17, $96, $10, $96, $10
	db $01, $33, $13, $FC, $12, $19, $02, $28
	db $14, $10, $8F, $E0, $80, $09, $99, $07
	db $80, $10, $99, $09, $80, $07, $80, $10
	db $80, $09, $99, $07, $80, $10, $99, $09
	db $80, $07, $80, $09, $01, $B5, $13, $FE
	db $12, $EF, $02, $1E, $32, $10, $8F, $E0
	db $96, $07, $01, $33, $13, $FC, $12, $19
	db $02, $1E, $14, $10, $F8, $E0, $96, $20
	db $96, $20, $96, $09, $02, $28, $14, $10
	db $8E, $E0, $98, $09, $80, $07, $80, $07
	db $98, $09, $80, $07, $98, $09, $80, $07
	db $10, $FA, $E0, $80, $09, $95, $10, $80
	db $07, $10, $8F, $E0, $95, $09, $80, $07
	db $80, $10, $10, $FA, $E0, $80, $09, $95
	db $10, $80, $07, $10, $8F, $E0, $95, $09
	db $80, $07, $80, $10, $01, $B3, $13, $FC
	db $12, $F6, $02, $1E, $1E, $10, $AE, $8B
	db $99, $10, $99, $10, $98, $19, $98, $07
	db $99, $39, $03, $05, $20, $01, $B3, $13
	db $FC, $12, $F6, $02, $28, $14, $10, $AF
	db $8B, $80, $07, $96, $10, $96, $10, $95
	db $19, $95, $07, $96, $20, $80, $20, $01
	db $33, $13, $FC, $12, $19, $02, $28, $14
	db $10, $8E, $E0, $16, $80, $09, $96, $07
	db $80, $10, $96, $09, $80, $07, $80, $10
	db $80, $09, $96, $07, $80, $10, $96, $09
	db $80, $07, $80, $09, $01, $B5, $13, $FE
	db $12, $EF, $02, $1E, $32, $10, $8F, $E0
	db $A2, $07, $01, $33, $13, $FC, $12, $19
	db $02, $1E, $14, $10, $F8, $E0, $92, $20
	db $91, $20, $8F, $09, $02, $28, $14, $10
	db $8E, $E0, $95, $09, $80, $07, $80, $07
	db $95, $09, $80, $07, $95, $09, $80, $07
	db $10, $FA, $E0, $80, $09, $9B, $10, $80
	db $07, $10, $8F, $E0, $9B, $09, $80, $07
	db $80, $10, $10, $FA, $E0, $80, $09, $9B
	db $10, $80, $07, $10, $8F, $E0, $9B, $09
	db $80, $07, $80, $10, $01, $B3, $13, $FC
	db $12, $F6, $02, $14, $28, $10, $AF, $8E
	db $95, $10, $95, $10, $95, $10, $95, $09
	db $91, $10, $91, $17, $91, $10, $91, $10
	db $01, $33, $13, $FC, $12, $19, $02, $28
	db $14, $10, $8F, $E0, $80, $09, $96, $07
	db $80, $10, $96, $09, $80, $07, $80, $10
	db $80, $09, $96, $07, $80, $10, $96, $09
	db $80, $07, $80, $09, $01, $B5, $13, $FE
	db $12, $EF, $02, $1E, $32, $10, $8F, $E0
	db $A2, $07, $01, $33, $13, $FC, $12, $19
	db $02, $1E, $14, $10, $F8, $E0, $92, $20
	db $91, $20, $8F, $09, $02, $28, $14, $10
	db $8E, $E0, $95, $09, $80, $07, $80, $07
	db $95, $09, $80, $07, $95, $09, $80, $07
	db $10, $FA, $E0, $80, $09, $9B, $10, $80
	db $07, $10, $8F, $E0, $9B, $09, $80, $07
	db $80, $10, $10, $FA, $E0, $80, $09, $9B
	db $10, $80, $07, $10, $8F, $E0, $9B, $09
	db $80, $07, $80, $10, $01, $B3, $13, $FC
	db $12, $F6, $02, $28, $14, $10, $AF, $8B
	db $96, $10, $96, $10, $95, $19, $95, $07
	db $96, $39, $03, $4D, $21, $01, $A5, $02
	db $28, $28, $10, $8F, $F5, $99, $07, $01
	db $00, $02, $40, $40, $10, $8F, $F5, $9A
	db $09, $01, $A5, $02, $3C, $46, $10, $8F
	db $F5, $16, $99, $07, $17, $01, $00, $02
	db $40, $40, $10, $8F, $F5, $9A, $10, $04
	db $02, $76, $23, $21, $40, $23, $21, $76
	db $23, $04, $02, $76, $23, $21, $F0, $22
	db $04, $05, $76, $23, $04, $06, $76, $23
	db $21, $10, $23, $21, $76, $23, $04, $02
	db $76, $23, $21, $F0, $22, $04, $03, $76
	db $23, $21, $40, $23, $21, $76, $23, $04
	db $06, $76, $23, $21, $10, $23, $21, $76
	db $23, $03, $B3, $22, $01, $00, $23, $40
	db $10, $8F, $F5, $9A, $09, $01, $A5, $10
	db $8F, $F5, $16, $02, $28, $32, $99, $07
	db $02, $3C, $46, $9A, $09, $02, $4B, $55
	db $9E, $07, $17, $05, $01, $00, $23, $40
	db $10, $8F, $F5, $9A, $09, $01, $36, $09
	db $02, $01, $16, $0B, $00, $10, $9F, $A8
	db $02, $5A, $32, $96, $07, $0A, $01, $00
	db $23, $40, $10, $8F, $F5, $9A, $09, $01
	db $A5, $02, $46, $50, $10, $8F, $F5, $16
	db $9A, $07, $17, $05, $01, $00, $23, $40
	db $10, $8F, $F5, $9A, $07, $01, $A5, $10
	db $8F, $F5, $16, $02, $0A, $14, $99, $03
	db $02, $14, $1E, $99, $03, $02, $1E, $28
	db $99, $03, $02, $3C, $46, $99, $09, $17
	db $01, $36, $09, $02, $01, $16, $0B, $00
	db $10, $9F, $A8, $02, $5A, $32, $96, $07
	db $0A, $05, $01, $00, $23, $40, $10, $8F
	db $F5, $9A, $10, $01, $A5, $02, $3C, $46
	db $10, $8F, $F5, $16, $99, $10, $17, $05
	db $01, $8D, $13, $00, $02, $3C, $28, $10
	db $FF, $4B, $99, $07, $99, $10, $99, $09
	db $99, $07, $03, $98, $23

DATA_EECE62:
	db $00, $00, $96, $01, $90, $00, $00, $00
	db $00, $F2, $9A, $B3, $CB, $A4, $01, $DE
	db $2F, $E0, $EB, $13, $90, $0E, $A4, $D2
	db $AF, $0D, $0A, $39, $58, $69, $05, $C0
	db $AB, $FA, $AE, $0A, $AB, $CC, $E2, $24
	db $B4, $FA, $F1, $22, $21, $21, $21, $21
	db $21, $88, $73, $42, $24, $34, $44, $34
	db $34, $43, $94, $33, $33, $33, $33, $23
	db $54, $3E, $C2, $A4, $06, $3E, $C5, $1D
	db $11, $C0, $F0, $FF, $A4, $0C, $F0, $11
	db $EA, $0F, $CF, $DD, $0D, $94, $A9, $BF
	db $BB, $A8, $CC, $CC, $CC, $CB, $94, $CC
	db $CB, $CC, $CB, $CD, $FD, $C0, $CC, $94
	db $22, $BB, $00, $F0, $ED, $15, $0C, $D0
	db $94, $11, $41, $10, $01, $14, $02, $24
	db $F2, $88, $5B, $02, $10, $11, $21, $23
	db $E0, $44, $88, $1F, $05, $6D, $D4, $67
	db $2C, $D4, $26, $94, $23, $42, $22, $20
	db $24, $33, $1F, $52, $94, $55, $10, $13
	db $44, $32, $11, $05, $32, $84, $53, $F3
	db $34, $42, $23, $2F, $13, $5E, $74, $31
	db $17, $1F, $FE, $EE, $11, $D2, $FE, $84
	db $2D, $2F, $FB, $EF, $13, $D9, $D1, $D0
	db $84, $BE, $EC, $EE, $DD, $CD, $CC, $CD
	db $DB, $88, $00, $E1, $91, $00, $9F, $20
	db $93, $E9, $88, $00, $E0, $90, $0A, $29
	db $F1, $E8, $F3, $8C, $FC, $B0, $4C, $E3
	db $EA, $F3, $ED, $02, $84, $09, $EF, $AD
	db $C0, $DC, $DD, $DB, $D0, $94, $F0, $DF
	db $1C, $F3, $FF, $FD, $12, $F0, $84, $0D
	db $2F, $1D, $12, $23, $0F, $00, $24, $84
	db $10, $42, $32, $14, $00, $41, $30, $34
	db $8C, $B1, $53, $CD, $27, $C0, $03, $EF
	db $04, $74, $26, $2F, $37, $1F, $37, $6F
	db $34, $13, $7C, $1F, $72, $D1, $D4, $F3
	db $3B, $23, $2D, $84, $42, $24, $1D, $34
	db $2F, $22, $14, $2E, $74, $3F, $41, $74
	db $12, $7D, $E7, $33, $E1, $74, $02, $64
	db $4E, $52, $10, $74, $10, $2D, $74, $20
	db $34, $2E, $13, $03, $44, $D4, $4D, $64
	db $DF, $41, $42, $E5, $27, $30, $02, $E5
	db $74, $52, $D2, $73, $D1, $10, $31, $0F
	db $52, $74, $10, $10, $21, $12, $10, $14
	db $F0, $F2, $74, $2E, $FD, $50, $03, $10
	db $3F, $F2, $FE, $64, $12, $E1, $FE, $EF
	db $EE, $12, $3C, $0E, $64, $1C, $EE, $A3
	db $59, $E1, $B0, $EC, $CD, $74, $FF, $F0
	db $E0, $F0, $FC, $11, $FE, $10, $64, $DE
	db $E1, $EE, $E0, $F1, $EC, $E3, $4F, $54
	db $DE, $0B, $63, $CD, $D0, $FB, $B4, $C3
	db $55, $1E, $3D, $E1, $52, $20, $10, $50
	db $61, $55

DATA_EECFFC:
	db $00, $00, $CC, $01, $A0, $F0, $01, $23
	db $45, $66, $77, $65, $43, $78, $B4, $10
	db $10, $2E, $FD, $EB, $BF, $0C, $98, $0F
	db $1F, $27, $32, $11, $0C, $CD, $ED, $98
	db $E0, $35, $32, $03, $EC, $EF, $DE, $10
	db $98, $2F, $00, $F0, $47, $0E, $51, $AD
	db $0C, $98, $1D, $D5, $3F, $34, $00, $1B
	db $F0, $BE, $98, $21, $01, $F1, $0E, $F0
	db $34, $10, $40, $98, $0D, $DF, $DD, $00
	db $42, $22, $2F, $DD, $98, $EE, $E1, $01
	db $02, $F2, $F4, $5D, $03, $88, $F9, $91
	db $DF, $BD, $75, $14, $62, $2C, $98, $DE
	db $FD, $D2, $10, $11, $F2, $F0, $62, $98
	db $C2, $4D, $D0, $E0, $ED, $03, $20, $33
	db $98, $1E, $FE, $FB, $D1, $00, $11, $31
	db $F4, $98, $50, $D1, $1C, $EE, $E1, $EE
	db $23, $12, $88, $62, $1C, $BC, $C9, $C1
	db $31, $32, $23, $98, $34, $2C, $2F, $FD
	db $CF, $1E, $E0, $33, $98, $21, $30, $0E
	db $DE, $EB, $01, $2F, $12, $98, $22, $54
	db $EE, $3D, $BF, $DF, $1E, $03, $98, $21
	db $23, $F1, $ED, $FE, $DD, $20, $01, $98
	db $11, $21, $75, $B1, $2D, $AE, $EF, $FF
	db $8C, $B7, $3F, $75, $12, $EB, $CA, $BE
	db $0F, $98, $12, $F2, $22, $52, $D1, $0E
	db $BE, $F0, $8C, $9D, $F6, $21, $54, $2D
	db $DD, $AE, $BF, $98, $00, $10, $10, $11
	db $34, $2D, $02, $DC, $88, $ED, $EF, $C4
	db $62, $44, $4F, $DE, $BB, $98, $FD, $11
	db $00, $11, $20, $21, $5F, $C2, $88, $EA
	db $DC, $F0, $F1, $34, $23, $5E, $EF, $88
	db $EB, $DC, $21, $00, $23, $F0, $01, $25
	db $88, $1C, $40, $CF, $ED, $C0, $F1, $13
	db $53, $88, $11, $0E, $CA, $FF, $E0, $22
	db $20, $30, $88, $F3, $4F, $FF, $F0, $CB
	db $1F, $00, $24, $78, $65, $32, $E9, $AB
	db $DD, $F5, $34, $44, $78, $FD, $CA, $FE
	db $25, $F4, $2E, $3D, $3E, $78, $CF, $F3
	db $5C, $33, $2D, $DD, $1F, $C3, $78, $53
	db $0F, $3D, $9A, $BD, $D3, $61, $76, $68
	db $45, $F2, $A9, $1C, $B0, $02, $00, $60
	db $88, $00, $20, $20, $0F, $DF, $BB, $FD
	db $02, $88, $45, $50, $42, $0E, $FD, $DF
	db $E0, $01, $78, $44, $43, $01, $C3, $2A
	db $CF, $0C, $AD, $78, $F0, $DE, $35, $04
	db $71, $56, $D3, $2E, $88, $FB, $CF, $01
	db $E3, $44, $01, $10, $ED, $88, $FC, $EE
	db $FF, $F1, $21, $24, $30, $F0, $78, $21
	db $CD, $CF, $12, $E1, $40, $23, $2F, $78
	db $D1, $1B, $DE, $F2, $92, $10, $32, $41
	db $78, $20, $EF, $DF, $EC, $DF, $47, $42
	db $34, $68, $29, $9B, $A9, $9C, $46, $30
	db $05, $7D, $78, $24, $FE, $EF, $CD, $FA
	db $D1, $33, $53, $78, $22, $40, $DC, $DF
	db $ED, $E2, $3F, $12, $78, $61, $10, $53
	db $BE, $DC, $D9, $E1, $00, $78, $55, $50
	db $14, $FD, $BF, $FE, $F1, $20, $79, $E2
	db $5F, $D4, $5D, $01, $31, $AD, $0C, $78

DATA_EED1CC:
	db $00, $00, $AC, $02, $80, $12, $35, $67
	db $77, $65, $43, $34, $31, $98, $FE, $0F
	db $00, $F1, $56, $2E, $3F, $AC, $9C, $AA
	db $2E, $07, $71, $30, $ED, $B9, $0D, $B4
	db $EE, $EF, $F4, $53, $45, $21, $FD, $DD
	db $A8, $D4, $32, $22, $1F, $FB, $D0, $FF
	db $11, $A8, $1F, $45, $01, $E0, $0C, $CF
	db $0F, $12, $A4, $03, $45, $43, $FB, $AA
	db $BB, $CE, $17, $A8, $5C, $00, $CD, $EE
	db $21, $F2, $40, $1F, $A8, $F0, $EE, $D2
	db $00, $00, $F7, $6D, $F2, $A4, $52, $FB
	db $9C, $BC, $F0, $12, $22, $0D, $B4, $EE
	db $DE, $DE, $F2, $66, $46, $31, $0D, $9C
	db $A4, $D1, $74, $12, $1C, $FB, $AF, $E0
	db $B4, $EE, $E3, $74, $55, $31, $FD, $EE
	db $DE, $B4, $00, $01, $10, $0E, $DE, $ED
	db $ED, $04, $A8, $6B, $11, $BC, $DD, $31
	db $E4, $31, $1F, $B4, $10, $FE, $DE, $DD
	db $DF, $15, $74, $64, $A8, $BC, $FC, $50
	db $E6, $22, $0F, $FF, $DD, $B4, $DC, $DD
	db $DF, $47, $55, $53, $FE, $CD, $A4, $CA
	db $D2, $33, $42, $30, $DA, $BA, $99, $A8
	db $24, $74, $D0, $0A, $DD, $E4, $FE, $62
	db $B4, $12, $21, $10, $EE, $DD, $DD, $E3
	db $64, $A8, $11, $DC, $CD, $22, $F0, $51
	db $01, $F0, $A8, $FD, $FF, $0F, $E1, $55
	db $3E, $11, $BC, $98, $BD, $60, $D5, $71
	db $E1, $0F, $DD, $D1, $A8, $0E, $0F, $76
	db $FF, $0F, $CD, $D2, $3F, $94, $80, $42
	db $0E, $FC, $BA, $CC, $EB, $AE, $A8, $63
	db $E0, $0E, $CD, $03, $1F, $12, $2E, $A4
	db $0F, $FD, $CE, $EE, $0E, $E0, $57, $66
	db $A4, $52, $EC, $A0, $FF, $F2, $31, $FF
	db $DD, $A4, $CC, $EF, $10, $00, $56, $44
	db $30, $DD, $98, $07, $1E, $33, $0C, $B0
	db $EF, $02, $34, $94, $42, $30, $17, $42
	db $73, $FE, $EF, $20, $98, $03, $0D, $EE
	db $FE, $13, $05, $10, $0A, $94, $C0, $41
	db $35, $34, $4F, $F0, $FE, $0F, $98, $FF
	db $EF, $10, $12, $70, $EC, $D9, $06, $98
	db $E5, $70, $3F, $AF, $E9, $01, $14, $00
	db $A8, $3F, $F0, $12, $EE, $EF, $D1, $40
	db $44, $98, $FF, $09, $AD, $AF, $51, $35
	db $32, $F0, $98, $FE, $FE, $CB, $EE, $26
	db $76, $52, $0F, $A4, $3E, $A8, $89, $AF
	db $34, $55, $52, $0D, $98, $1B, $E2, $F2
	db $57, $32, $5F, $C9, $9C, $9C, $CA, $07
	db $56, $52, $3D, $AA, $BD, $FF, $98, $24
	db $03, $23, $21, $FE, $DC, $BC, $21, $98
	db $35, $54, $3D, $DA, $9D, $F1, $43, $22
	db $88, $3F, $E5, $DC, $4D, $BF, $FE, $E3
	db $56, $98, $31, $FE, $BE, $EE, $12, $41
	db $3F, $0D, $88, $C0, $2F, $06, $50, $A0
	db $FD, $1F, $42, $88, $EB, $3E, $0E, $14
	db $31, $1D, $BE, $BB, $98, $04, $43, $13
	db $1C, $EC, $DF, $F1, $22, $88, $54, $22
	db $CC, $1A, $E2, $8A, $13, $73, $98, $36
	db $3F, $DC, $EB, $BF, $23, $26, $33, $98
	db $1C, $DD, $C1, $DD, $23, $13, $14, $3E
	db $98, $00, $DC, $DD, $0F, $24, $53, $40
	db $EC, $98, $DC, $CD, $03, $33, $54, $10
	db $DF, $CC, $98, $C0, $11, $13, $33, $21
	db $FE, $FB, $CE, $98, $D2, $22, $55, $41
	db $0D, $BB, $BF, $F1, $98, $25, $35, $10
	db $FF, $CD, $DD, $F2, $01, $98, $43, $42
	db $20, $DB, $CD, $D0, $F3, $55, $98, $23
	db $0E, $DC, $CE, $E1, $22, $33, $12, $88
	db $3E, $D8, $B0, $DB, $21, $37, $26, $3E
	db $88, $8E, $BB, $E1, $34, $45, $03, $1A
	db $EE, $84, $BD, $EA, $F0, $E1, $01, $51
	db $EC, $B9, $78, $79, $07, $61, $35, $0C
	db $9D, $F1, $E0, $78, $54, $D1, $26, $0A
	db $DB, $CF, $11, $E3, $78, $70, $57, $DB
	db $E9, $2F, $B5, $40, $E3, $78, $06, $1B
	db $FB, $FF, $FC, $13, $52, $26, $78, $FA
	db $EC, $FF, $17, $30, $ED, $0E, $C1, $74
	db $B9, $F4, $66, $50, $FF, $B8, $99, $A0
	db $84, $02, $37, $75, $2F, $C9, $9A, $AB
	db $14, $88, $5F, $FF, $ED, $FC, $01, $04
	db $21, $31, $78, $1A, $BC, $E9, $C3, $32
	db $67, $72, $DB, $78, $DC, $AB, $11, $54
	db $26, $5F, $ED, $BD, $78, $CD, $FF, $25
	db $45, $50, $FE, $DC, $AD, $78, $02, $24
	db $34, $31, $ED, $DC, $DE, $0F, $74, $8C
	db $15, $77, $74, $30, $CB, $BD, $E1, $69
	db $05, $01, $EE, $DF, $EF, $00, $12, $13

DATA_EED47C:
	db $00, $00, $BA, $01, $A0, $31, $FD, $CE
	db $F2, $56, $53, $0D, $BB, $98, $11, $ED
	db $C4, $73, $2C, $FE, $9C, $02, $98, $65
	db $15, $2B, $9B, $CE, $43, $4F, $DD, $A8
	db $45, $4E, $A0, $BE, $F0, $45, $20, $20
	db $B4, $2F, $CC, $DC, $F0, $0E, $D2, $67
	db $73, $A8, $D9, $DF, $17, $50, $22, $0B
	db $AE, $F1, $B4, $DF, $F0, $E2, $77, $54
	db $FD, $BB, $D0, $A4, $13, $45, $72, $EC
	db $B8, $AB, $BC, $94, $B8, $6F, $0D, $EC
	db $FF, $14, $F2, $11, $1E, $B8, $EF, $FF
	db $01, $F1, $F6, $5E, $DF, $DD, $A8, $F3
	db $62, $00, $0F, $2A, $21, $E1, $FE, $B4
	db $EB, $07, $74, $50, $FD, $CD, $10, $F1
	db $B4, $11, $EF, $F0, $FF, $EF, $DF, $47
	db $65, $B4, $0D, $EB, $D2, $21, $1F, $0E
	db $CE, $FF, $B4, $11, $0E, $E3, $65, $21
	db $EF, $DE, $21, $B8, $1E, $00, $FE, $02
	db $01, $00, $EE, $56, $B4, $53, $1D, $DC
	db $E0, $32, $21, $00, $CC, $B8, $2F, $20
	db $F0, $F5, $5C, $EE, $E0, $E1, $B4, $F3
	db $22, $11, $0B, $CE, $01, $1F, $FC, $B4
	db $27, $54, $3E, $DC, $CF, $12, $20, $11
	db $B4, $CC, $EF, $11, $00, $D1, $64, $53
	db $ED, $B0, $2E, $D0, $23, $32, $2E, $A8
	db $8A, $CE, $B4, $0E, $E2, $75, $30, $DD
	db $BE, $22, $21, $B4, $0F, $ED, $CE, $01
	db $21, $FE, $37, $62, $A8, $CA, $1C, $75
	db $31, $FD, $EF, $93, $31, $B4, $11, $00
	db $D1, $56, $62, $FC, $BB, $D2, $A4, $36
	db $32, $0C, $AC, $E0, $01, $FF, $94, $B4
	db $66, $41, $FD, $BC, $E2, $22, $10, $FD
	db $B4, $E0, $01, $10, $FD, $E2, $55, $32
	db $FD, $A8, $D2, $64, $F0, $0E, $EE, $03
	db $11, $0F, $B0, $FC, $AC, $04, $67, $73
	db $EC, $CF, $13, $A4, $1F, $EB, $CE, $22
	db $33, $EB, $9F, $27, $A8, $39, $29, $A2
	db $35, $21, $0F, $DF, $F0, $AC, $2E, $20
	db $F0, $90, $73, $71, $90, $9A, $A4, $9C
	db $17, $54, $41, $00, $CF, $F1, $FC, $A8
	db $EE, $17, $61, $39, $CC, $93, $34, $6F
	db $A4, $57, $62, $EB, $EF, $DE, $CB, $B9
	db $05, $A8, $06, $EA, $F9, $D2, $22, $73
	db $2E, $BE, $A8, $FD, $0F, $42, $E0, $DF
	db $35, $07, $FA, $A8, $E9, $A3, $46, $71
	db $FF, $AB, $FE, $32, $A8, $32, $DF, $EE
	db $34, $24, $FB, $CD, $C3, $A8, $25, $7F
	db $1C, $BC, $00, $13, $12, $FE, $A4, $1E
	db $F1, $23, $55, $1F, $BB, $E0, $66, $98
	db $DC, $AC, $D0, $26, $52, $0E, $BA, $D4
	db $98, $53, $31, $0C, $BD, $05, $5F, $1F
	db $BE, $98, $D3, $23, $31, $FC, $FC, $0F
	db $04, $33, $98, $3E, $1F, $9D, $E2, $11
	db $52, $2D, $EF, $94, $ED, $C0, $1F, $EC
	db $BF, $F2, $67, $73, $95, $1F, $99, $BF
	db $45, $54, $0D, $FD, $F0, $98

DATA_EED63A:
	db $00, $00, $40, $02, $B0, $FE, $DC, $CB
	db $CF, $47, $74, $1E, $DE, $98, $31, $AD
	db $31, $1C, $FF, $E1, $1F, $CD, $B0, $C4
	db $77, $40, $ED, $EF, $0F, $F2, $45, $B8
	db $FE, $1E, $30, $1F, $D0, $F4, $70, $AC
	db $A8, $C1, $66, $1E, $BE, $55, $0D, $BD
	db $03, $C0, $F0, $1F, $DB, $BF, $45, $30
	db $EE, $F1, $AC, $CC, $A5, $55, $E8, $FE
	db $34, $1F, $9A, $C0, $9A, $15, $53, $0E
	db $F0, $22, $0F, $E0, $C0, $23, $10, $FF
	db $00, $FD, $9B, $35, $52, $B0, $FE, $F2
	db $53, $0D, $D1, $44, $2F, $DF, $C0, $0F
	db $EA, $B2, $43, $3F, $FF, $03, $20, $C0
	db $EF, $12, $10, $FF, $00, $FE, $AC, $44
	db $B0, $73, $DE, $E3, $75, $0D, $E2, $41
	db $EC, $C0, $E0, $0F, $CA, $14, $34, $FE
	db $EF, $32, $C0, $0F, $02, $21, $FE, $DE
	db $FE, $BC, $44, $B0, $55, $F0, $DE, $32
	db $FE, $06, $62, $DA, $C0, $DE, $FD, $90
	db $74, $31, $00, $E1, $20, $C0, $FE, $13
	db $30, $EE, $EF, $D9, $C5, $42, $B0, $30
	db $41, $02, $FD, $BF, $66, $2E, $CE, $C0
	db $0F, $B8, $05, $23, $01, $10, $32, $1F
	db $C0, $E0, $22, $0E, $EF, $FD, $AF, $63
	db $11, $B0, $23, $F1, $31, $0F, $24, $2F
	db $DC, $E0, $C0, $E9, $C5, $42, $10, $10
	db $01, $10, $F1, $C0, $33, $0E, $EF, $0F
	db $B9, $05, $21, $01, $B0, $0F, $11, $0F
	db $04, $65, $FC, $BF, $0B, $C0, $AC, $34
	db $11, $00, $F0, $10, $FE, $03, $C0, $42
	db $0E, $E0, $0D, $AD, $33, $21, $11, $B0
	db $DF, $22, $ED, $05, $74, $0D, $E1, $FA
	db $C0, $AD, $32, $11, $11, $EF, $12, $FE
	db $03, $C0, $42, $0E, $F0, $0E, $BB, $03
	db $20, $00, $B4, $D2, $42, $BC, $46, $3D
	db $AC, $15, $1C, $C0, $CA, $D3, $42, $0F
	db $FF, $23, $1E, $F2, $C0, $43, $0E, $E0
	db $10, $EB, $B0, $42, $0E, $B4, $21, $31
	db $ED, $06, $5F, $CA, $F2, $31, $B8, $82
	db $36, $49, $CF, $32, $E1, $0E, $3F, $B0
	db $57, $42, $ED, $00, $E9, $9B, $9E, $45
	db $A4, $DC, $F0, $F0, $10, $42, $23, $BB
	db $DE, $B8, $2E, $1D, $F2, $54, $BB, $01
	db $3F, $F0, $B0, $F0, $34, $53, $EB, $C0
	db $3F, $99, $BD, $B0, $15, $4F, $03, $32
	db $F0, $12, $44, $2E, $A4, $95, $61, $CB
	db $F2, $01, $25, $2B, $42, $A4, $F0, $B2
	db $2F, $FF, $3C, $CD, $36, $3E, $B0, $FE
	db $CA, $E4, $61, $03, $33, $FF, $FE, $A4
	db $62, $EA, $B2, $76, $1B, $90, $FF, $27
	db $A4, $6B, $04, $DB, $B2, $7E, $CD, $14
	db $22, $B0, $10, $00, $10, $0F, $BC, $36
	db $2E, $D0, $B0, $20, $FD, $DF, $14, $3F
	db $DE, $24, $42, $A4, $90, $DD, $33, $2F
	db $E2, $3F, $EC, $23, $A8, $EE, $1F, $2F
	db $50, $EA, $A6, $5D, $F2, $98, $7C, $E7
	db $BB, $ED, $62, $E1, $05, $F1, $B0, $45
	db $32, $FD, $FE, $B8, $90, $32, $10, $A8
	db $4F, $EF, $E4, $14, $38, $D0, $23, $2B
	db $A4, $9B, $25, $FD, $F2, $22, $62, $AA
	db $E7, $A4, $5F, $CF, $23, $2F, $BC, $24
	db $1F, $AA, $B0, $AC, $13, $2F, $E2, $43
	db $0D, $D0, $24, $A4, $BC, $23, $1F, $DD
	db $BF, $74, $CC, $25, $A0, $55, $2C, $BF
	db $43, $EE, $35, $32, $2F, $A0, $CC, $23
	db $0C, $D1, $0F, $EE, $FE, $22, $90, $47
	db $33, $CD, $55, $09, $F2, $42, $26, $A0
	db $1D, $BD, $0F, $CD, $24, $52, $FD, $CF
	db $A0, $21, $FE, $F0, $23, $50, $CF, $21
	db $BC, $90, $24, $1D, $DE, $CF, $45, $1C
	db $D1, $35, $94, $FC, $25, $29, $E3, $2E
	db $E2, $DA, $C4, $91, $15, $4F, $CD, $F4
	db $3F, $F2, $41, $34

DATA_EED87E:
	db $00, $00, $F1, $03, $A0, $02, $34, $54
	db $56, $65, $55, $31, $11, $98, $F3, $0E
	db $3E, $AD, $43, $01, $2C, $0F, $94, $ED
	db $C2, $76, $15, $2D, $02, $F0, $44, $94
	db $02, $1C, $03, $F1, $41, $A9, $9B, $DF
	db $94, $DF, $10, $DF, $0E, $16, $32, $63
	db $24, $98, $E1, $F4, $EF, $20, $F2, $0F
	db $00, $CE, $8C, $F7, $F0, $EF, $D3, $E2
	db $25, $32, $E3, $94, $43, $42, $57, $23
	db $20, $D0, $ED, $12, $98, $FD, $EF, $C0
	db $53, $00, $EB, $2E, $21, $98, $03, $3A
	db $11, $C0, $51, $01, $0F, $DC, $98, $5F
	db $13, $01, $1D, $90, $03, $23, $00, $94
	db $FD, $AA, $F4, $45, $77, $11, $11, $27
	db $98, $FF, $01, $CA, $34, $F6, $20, $CD
	db $BE, $A4, $BF, $01, $22, $0D, $CD, $D2
	db $53, $23, $A4, $2E, $E0, $12, $54, $10
	db $0D, $DF, $02, $98, $4E, $CD, $DF, $D5
	db $52, $2B, $EC, $B1, $A4, $DE, $15, $50
	db $01, $0D, $23, $35, $62, $A4, $F0, $0D
	db $E3, $31, $31, $DC, $DB, $BF, $98, $4D
	db $D1, $BB, $30, $03, $5F, $1C, $E0, $88
	db $D2, $67, $20, $0D, $81, $58, $36, $5F
	db $98, $11, $BD, $02, $B6, $3E, $F1, $ED
	db $F0, $94, $F0, $44, $37, $64, $12, $20
	db $57, $42, $94, $3F, $DB, $ED, $C1, $4E
	db $11, $BA, $CE, $94, $DE, $32, $E1, $FB
	db $CF, $DF, $33, $02, $88, $01, $EF, $F2
	db $45, $91, $4C, $2F, $F0, $88, $31, $2E
	db $F3, $ED, $2C, $23, $B3, $00, $88, $1B
	db $FE, $0F, $41, $0F, $E1, $10, $4C, $94
	db $06, $41, $00, $12, $11, $FF, $FD, $EF
	db $84, $15, $01, $D8, $AA, $A0, $02, $1C
	db $C9, $94, $CD, $E0, $22, $FF, $30, $E7
	db $5F, $65, $94, $03, $0F, $01, $61, $F3
	db $0B, $00, $E2, $94, $10, $DB, $FC, $90
	db $1D, $12, $BE, $FE, $94, $DF, $03, $1F
	db $1C, $25, $00, $64, $45, $84, $E5, $25
	db $5F, $27, $0C, $0C, $02, $21, $88, $F0
	db $DD, $E5, $E1, $6C, $AF, $AE, $35, $94
	db $11, $22, $20, $FF, $27, $75, $45, $43
	db $94, $FE, $34, $22, $0D, $0D, $CE, $E2
	db $3E, $94, $EE, $AE, $CA, $13, $23, $DC
	db $DA, $F1, $94, $E4, $2F, $E2, $FC, $22
	db $37, $40, $41, $94, $12, $F4, $62, $12
	db $ED, $0D, $D1, $01, $84, $1D, $DB, $8B
	db $CA, $1E, $C2, $0D, $B2, $84, $BA, $01
	db $02, $1D, $06, $4C, $C4, $22, $94, $43
	db $11, $70, $F3, $12, $23, $E1, $1E, $94
	db $DD, $02, $E1, $3D, $DF, $BB, $EE, $F2
	db $94, $30, $EE, $EB, $D1, $1F, $45, $F0
	db $1D, $94, $F2, $20, $45, $1D, $23, $04
	db $3F, $23, $94, $FF, $DE, $20, $F1, $BE
	db $2E, $F2, $00, $8C, $18, $F0, $41, $B4
	db $6C, $C2, $CB, $72, $94, $04, $51, $01
	db $0F, $1F, $F2, $34, $2D, $90, $32, $0E
	db $E0, $02, $42, $DB, $B9, $9E, $94, $11
	db $41, $0F, $13, $11, $61, $EF, $0C, $94
	db $F2, $EF, $00, $DC, $CC, $D2, $4E, $C1
	db $94, $0F, $FD, $A2, $41, $14, $12, $1E
	db $16, $8C, $DF, $4E, $A2, $E0, $5F, $2A
	db $37, $AC, $94, $E0, $1F, $0F, $CF, $1B
	db $B1, $FD, $00, $84, $B0, $21, $EF, $53
	db $15, $53, $61, $CC, $94, $FE, $ED, $11
	db $12, $FB, $DE, $D1, $32, $98, $2F, $FF
	db $B5, $3A, $66, $BE, $4B, $23, $A4, $01
	db $F0, $2F, $C0, $FC, $F0, $EE, $0E, $8C
	db $EE, $24, $00, $7B, $01, $C1, $E2, $64
	db $94, $43, $1F, $D2, $3F, $04, $1D, $20
	db $DF, $94, $00, $F2, $0E, $FE, $E1, $03
	db $40, $34, $84, $F5, $F3, $5C, $E7, $E9
	db $3A, $83, $E9, $84, $C2, $0A, $A1, $EB
	db $13, $B0, $49, $05, $94, $DC, $0F, $E0
	db $10, $02, $2F, $F5, $1E, $94, $64, $02
	db $22, $FF, $4F, $14, $2D, $13, $84, $B1
	db $23, $33, $10, $BA, $09, $B2, $BE, $88
	db $48, $D5, $B2, $F2, $F0, $D4, $8E, $53
	db $84, $03, $51, $12, $2F, $24, $23, $73
	db $EE, $94, $1E, $F1, $24, $2C, $FF, $00
	db $0E, $33, $84, $DD, $0B, $0F, $04, $73
	db $77, $FE, $05, $94, $1F, $34, $EF, $EB
	db $C1, $FD, $F0, $0E, $94, $DD, $BE, $12
	db $EF, $2F, $FE, $DE, $03, $90, $BD, $BE
	db $0E, $DD, $DD, $24, $33, $76, $94, $E3
	db $4F, $33, $20, $01, $1C, $14, $EF, $94
	db $2C, $F3, $E0, $1E, $10, $B0, $0D, $12
	db $84, $03, $FE, $1A, $A0, $31, $3F, $0E
	db $CD, $84, $B9, $1D, $EF, $2D, $AE, $5E
	db $17, $1C, $94, $01, $FF, $22, $20, $22
	db $E4, $4E, $04, $94, $F2, $60, $D1, $20
	db $00, $F0, $23, $10, $94, $13, $EB, $00
	db $01, $EC, $0E, $CF, $DB, $84, $CE, $D0
	db $DD, $F1, $12, $02, $20, $F3, $84, $54
	db $32, $1F, $E1, $C9, $D2, $11, $1C, $8C
	db $40, $20, $A2, $7F, $06, $BF, $7C, $B3
	db $8C, $7D, $B5, $FF, $1F, $10, $AC, $51
	db $2D, $80, $9B, $0E, $DE, $9A, $CE, $E2
	db $50, $EE, $84, $FA, $E2, $FE, $0D, $DC
	db $CC, $10, $EF, $84, $30, $10, $20, $E4
	db $1D, $32, $25, $2D, $84, $11, $21, $1D
	db $25, $1F, $42, $B3, $50, $84, $35, $3D
	db $45, $FB, $EC, $E2, $1B, $EF, $84, $DE
	db $C9, $ED, $B4, $2E, $E6, $01, $0F, $78
	db $6C, $0A, $F5, $78, $4E, $23, $CB, $42
	db $74, $9E, $65, $32, $3C, $F4, $21, $23
	db $29, $84, $D0, $FE, $13, $CF, $AC, $C0
	db $FB, $CF, $84, $5C, $FF, $EF, $43, $12
	db $3E, $73, $D2, $84, $73, $35, $F1, $77
	db $F0, $1B, $D1, $EC, $84, $24, $EF, $1C
	db $8F, $3D, $16, $FC, $FF, $84, $DE, $25
	db $11, $00, $FF, $DA, $0F, $01, $84, $2E
	db $EF, $C1, $CF, $10, $C1, $1C, $F0, $78
	db $94, $61, $9F, $2E, $2F, $10, $2A, $16
	db $84, $12, $60, $22, $11, $2C, $F4, $02
	db $51, $84, $0F, $22, $D1, $4E, $12, $D0
	db $5C, $DF, $84, $09, $0E, $F0, $FE, $BA
	db $FA, $C2, $FE, $84, $00, $E2, $DF, $30
	db $12, $54, $0F, $5F, $84, $05, $11, $20
	db $E2, $FC, $FF, $F0, $2D, $84, $EF, $1B
	db $F2, $DD, $41, $43, $13, $20, $84, $11
	db $26, $11, $22, $0E, $F2, $2E, $0F, $84
	db $E0, $DE, $03, $EF, $0E, $BC, $D0, $3E
	db $84, $05, $FB, $FC, $BF, $10, $E2, $1E
	db $F1, $84, $00, $30, $02, $73, $22, $12
	db $42, $F5, $78, $A4, $DF, $F2, $D0, $F6
	db $01, $49, $A6, $85, $EE, $13, $10, $11
	db $00, $2F, $01, $DD, $84

DATA_EEDC73:
	db $00, $00, $DE, $03, $80, $DC, $D3, $1C
	db $03, $32, $0D, $E0, $B8, $B0, $F0, $22
	db $0F, $F0, $00, $0F, $02, $28, $C0, $2F
	db $E2, $FD, $B7, $3B, $11, $B2, $3E, $C0
	db $CA, $57, $84, $2B, $34, $DD, $EF, $7C
	db $C0, $C6, $B1, $3D, $00, $1E, $15, $C0
	db $3D, $C0, $F4, $EE, $FC, $65, $A4, $EE
	db $40, $EF, $C0, $FF, $21, $84, $3D, $30
	db $DE, $E2, $7A, $C0, $F6, $C3, $3C, $0E
	db $A7, $CC, $5C, $E3, $C0, $CF, $EB, $71
	db $A5, $00, $40, $EF, $0E, $C0, $F6, $9E
	db $50, $11, $0F, $E0, $C7, $39, $C0, $4F
	db $03, $00, $EE, $E4, $F8, $5F, $03, $C0
	db $FF, $E0, $E1, $78, $13, $F1, $1F, $EE
	db $C0, $F3, $79, $14, $E2, $2E, $EF, $E2
	db $29, $C0, $31, $E3, $FF, $EE, $F7, $19
	db $4F, $03, $C0, $FE, $EE, $07, $8C, $60
	db $03, $FD, $EE, $C0, $27, $8E, $1E, $22
	db $FE, $EF, $72, $C5, $C0, $01, $3F, $EE
	db $D4, $69, $E1, $01, $0F, $C0, $DE, $07
	db $FD, $4F, $12, $FD, $EF, $71, $C0, $92
	db $0F, $30, $DE, $E4, $7C, $10, $F1, $C0
	db $2D, $DD, $27, $A0, $3E, $23, $FC, $C4
	db $C0, $7A, $E2, $E0, $30, $DD, $17, $D1
	db $2E, $C0, $23, $EE, $C6, $6A, $04, $E1
	db $3E, $CE, $C0, $54, $C0, $1E, $22, $ED
	db $C5, $3D, $1F, $C0, $02, $0D, $D0, $6C
	db $E4, $10, $30, $DC, $C0, $55, $B1, $3F
	db $21, $DE, $D6, $3C, $21, $C0, $E2, $0B
	db $EE, $6F, $D1, $00, $2E, $CE, $C0, $14
	db $EE, $00, $12, $EB, $E7, $1E, $FF, $C0
	db $13, $0C, $C1, $7F, $F1, $F0, $2F, $CD
	db $C0, $63, $D2, $10, $20, $DD, $35, $EF
	db $10, $C0, $21, $EC, $07, $1C, $F1, $F3
	db $1C, $D4, $C0, $5F, $D0, $00, $2E, $CE
	db $50, $00, $00, $C0, $10, $DB, $51, $D1
	db $1F, $11, $DC, $46, $C0, $0E, $11, $F2
	db $FA, $F6, $1F, $00, $01, $C0, $0D, $A5
	db $5F, $F0, $11, $ED, $D0, $4F, $C0, $01
	db $F1, $2E, $AE, $7F, $F0, $2F, $20, $C0
	db $CB, $53, $0F, $01, $00, $D9, $37, $D1
	db $C0, $0F, $11, $EC, $E7, $2E, $01, $01
	db $0C, $C0, $D5, $0F, $01, $01, $0D, $B5
	db $3E, $10, $C0, $F3, $0E, $D0, $50, $E0
	db $00, $2D, $DE, $C0, $62, $F1, $00, $2F
	db $CD, $43, $F0, $00, $C0, $10, $CD, $F5
	db $FE, $1F, $22, $EC, $04, $C0, $1F, $00
	db $03, $0C, $E6, $2E, $0F, $F3, $C0, $2D
	db $B1, $6F, $F1, $E0, $3E, $CD, $42, $C0
	db $E0, $0E, $31, $CB, $23, $0F, $00, $02
	db $C0, $FB, $05, $1F, $00, $12, $0D, $B3
	db $40, $C0, $F0, $01, $1E, $CE, $52, $EE
	db $11, $00, $C0, $DC, $33, $0D, $F2, $2F
	db $FC, $05, $3E, $C0, $D0, $31, $FE, $D2
	db $50, $B0, $21, $1E, $C0, $CF, $33, $ED
	db $03, $1F, $DE, $05, $1C, $C0, $E1, $21
	db $DD, $F3, $5F, $C0, $23, $0D, $B0, $DF
	db $77, $BB, $05, $5C, $CE, $E6, $3D, $B0
	db $C1, $70, $BE, $FF, $62, $EC, $04, $1F
	db $B0, $D1, $02, $5E, $C0, $03, $09, $D4
	db $54, $B0, $CA, $F3, $50, $BE, $E7, $5D
	db $AE, $55, $C0, $FD, $E2, $52, $EC, $F3
	db $2F, $DE, $14, $B0, $3D, $A2, $43, $F9
	db $E4, $61, $DC, $E4, $B0, $50, $A2, $11
	db $30, $EE, $33, $EF, $FD, $B0, $F3, $4F
	db $DF, $33, $2F, $BE, $14, $00, $C0, $E0
	db $22, $0D, $FF, $22, $1D, $D2, $42, $B0
	db $BB, $F0, $13, $1D, $F2, $24, $EB, $DF
	db $B0, $25, $0D, $DE, $53, $E9, $F3, $11
	db $FF, $B0, $30, $0F, $E2, $FC, $0E, $25
	db $2C, $A1, $B0, $74, $ED, $E1, $41, $EE
	db $01, $02, $4D, $B0, $D1, $FC, $22, $2D
	db $EE, $46, $0B, $F2, $B0, $3E, $B1, $12
	db $3C, $C4, $1E, $F0, $FE, $B0, $41, $DF
	db $00, $04, $2C, $F3, $BC, $52, $B0, $1D
	db $F0, $15, $0A, $E2, $B2, $31, $DF, $B0
	db $10, $24, $FB, $13, $FF, $1F, $E1, $2E
	db $C0, $F1, $FF, $21, $01, $0F, $C0, $21
	db $10, $B0, $AE, $54, $0D, $00, $15, $0C
	db $FF, $E0, $B0, $22, $CF, $11, $44, $FC
	db $0F, $C4, $60, $A0, $AC, $3E, $45, $FE
	db $63, $ED, $22, $E2, $B0, $EC, $02, $00
	db $10, $E2, $20, $31, $1F, $B0, $FD, $B2
	db $60, $BC, $D0, $41, $FF, $33, $B0, $EF
	db $20, $11, $EE, $FF, $CC, $23, $24, $B0
	db $FB, $F4, $41, $FD, $F4, $3C, $9D, $23
	db $B0, $22, $DE, $21, $02, $4F, $E1, $F2
	db $52, $B0, $EC, $F1, $10, $E9, $D4, $32
	db $1D, $D1, $B0, $23, $01, $0E, $01, $F0
	db $0C, $C2, $51, $A0, $E9, $BE, $77, $11
	db $4D, $B7, $30, $FE, $B0, $FE, $22, $E0
	db $0B, $C1, $32, $0F, $CF, $B0, $54, $EF
	db $00, $12, $E9, $04, $13, $FC, $B0, $D2
	db $51, $F2, $FC, $02, $22, $0F, $D1, $B0
	db $4F, $EE, $CF, $12, $0E, $00, $D0, $21
	db $A0, $45, $1E, $E2, $21, $1F, $E4, $00
	db $FE, $A0, $FF, $20, $21, $1B, $B1, $F5
	db $53, $D8, $A0, $11, $D2, $0C, $15, $2C
	db $D3, $22, $1D, $A0, $E4, $73, $DE, $FE
	db $E0, $EC, $01, $DF, $B0, $31, $1E, $CE
	db $14, $3F, $ED, $13, $FD, $A0, $E3, $40
	db $EF, $24, $4D, $DF, $15, $FE, $A0, $ED
	db $2D, $A1, $22, $1D, $CE, $0E, $C2, $A0
	db $63, $2B, $C0, $23, $11, $21, $FF, $00
	db $90, $26, $3D, $20, $EF, $C1, $54, $D9
	db $F3, $A0, $EE, $E1, $37, $E9, $AF, $22
	db $22, $FF, $90, $59, $A0, $32, $54, $D9
	db $E3, $FD, $40, $90, $25, $4E, $AA, $D4
	db $73, $FD, $40, $DC, $90, $B1, $67, $0A
	db $BE, $24, $EB, $E2, $BC, $A0, $12, $21
	db $FD, $E2, $61, $EF, $F3, $21, $A0, $CB
	db $01, $00, $C0, $44, $0D, $C0, $24, $A0
	db $5F, $E1, $CF, $0F, $21, $10, $BE, $2F
	db $90, $2F, $E3, $63, $E9, $11, $F4, $F9
	db $F3, $94, $EE, $3F, $93, $0E, $65, $2A
	db $84, $C5, $A0, $42, $F0, $03, $1E, $EB
	db $06, $31, $D9, $A0, $F3, $3E, $E0, $11
	db $FE, $F0, $42, $EF, $90, $12, $21, $BA
	db $17, $6D, $99, $F7, $2B, $90, $C2, $61
	db $AE, $13, $40, $90, $11, $3C, $90, $B0
	db $56, $EB, $C2, $75, $FD, $F0, $0F, $70
	db $83, $2C, $C9, $F3, $20, $00, $01, $11
	db $20, $99, $01, $22, $1F, $F0, $00, $00
	db $00, $01, $10, $00, $00, $00, $00, $00
	db $00, $00

DATA_EEE055:
	db $00, $00, $56, $01, $B0, $16, $77, $75
	db $42, $EC, $CC, $DD, $E0, $98, $1D, $FB
	db $10, $D0, $F3, $1F, $00, $0E, $B4, $FF
	db $FF, $13, $73, $22, $1F, $FA, $DD, $A4
	db $EE, $05, $64, $21, $13, $FD, $CC, $0F
	db $B4, $EF, $00, $1F, $FE, $F0, $37, $52
	db $21, $A8, $0B, $A2, $32, $2E, $35, $00
	db $DE, $23, $B0, $72, $DD, $DB, $89, $BC
	db $B9, $8A, $D5, $B4, $31, $32, $2F, $9C
	db $DE, $DE, $34, $31, $A8, $F2, $5C, $9C
	db $36, $0A, $F3, $5F, $CC, $BC, $06, $79
	db $F2, $10, $BB, $31, $1F, $E1, $B4, $33
	db $31, $12, $41, $DA, $FF, $DD, $01, $B8
	db $0C, $02, $44, $BE, $11, $1C, $C2, $11
	db $A4, $FA, $26, $54, $23, $40, $CA, $C0
	db $EB, $B4, $EF, $00, $E0, $37, $41, $31
	db $FB, $DE, $A4, $FE, $CD, $44, $63, $F1
	db $0F, $DA, $DF, $B0, $CD, $B9, $AD, $25
	db $66, $77, $73, $FE, $A4, $01, $0E, $24
	db $54, $EB, $BC, $BB, $E0, $B4, $11, $F1
	db $36, $50, $F0, $FF, $BC, $E1, $A4, $34
	db $67, $72, $CB, $CB, $A9, $9E, $21, $A8
	db $F1, $47, $AC, $D1, $1B, $B4, $34, $01
	db $A4, $77, $73, $DD, $B9, $A9, $DF, $FF
	db $57, $A8, $5B, $BE, $EB, $E5, $43, $0F
	db $52, $EC, $A8, $DE, $2F, $DF, $14, $3F
	db $34, $FD, $BF, $9C, $4A, $AD, $F7, $41
	db $56, $42, $AA, $CE, $A8, $FB, $07, $4F
	db $11, $7D, $DC, $C0, $FE, $A8, $02, $24
	db $21, $12, $FC, $AF, $FF, $12, $A8, $12
	db $21, $F1, $5E, $DD, $D1, $FE, $00, $A4
	db $D3, $65, $54, $21, $0D, $CC, $BE, $EF
	db $98, $32, $31, $EE, $E0, $EB, $F4, $01
	db $41, $88, $30, $EF, $DA, $BE, $F3, $E3
	db $51, $40, $98, $55, $AC, $D0, $CC, $02
	db $63, $00, $31, $94, $73, $FF, $FE, $B9
	db $AB, $01, $37, $53, $88, $DC, $7F, $CD
	db $B4, $60, $F0, $15, $0C, $84, $FA, $13
	db $0B, $CF, $0F, $DF, $E2, $F0, $7C, $53
	db $10, $C3, $9F, $56, $68, $0B, $BC, $88
	db $0E, $12, $33, $12, $1D, $1B, $ED, $A3
	db $84, $A1, $31, $36, $75, $11, $43, $1F
	db $BA, $95, $EF, $ED, $DD, $33, $56, $41
	db $0E, $AA

DATA_EEE1AF:
	db $00, $00, $1B, $07, $C0, $0F, $0E, $F0
	db $01, $0F, $CA, $A0, $66, $C0, $52, $32
	db $EA, $AF, $13, $32, $0F, $0E, $B4, $E7
	db $6F, $1E, $9F, $DD, $44, $32, $3D, $B0
	db $00, $DD, $C5, $12, $41, $FB, $CB, $E0
	db $A4, $55, $D0, $BF, $EF, $6D, $3E, $FD
	db $E0, $A0, $B1, $37, $76, $3F, $DA, $DF
	db $02, $11, $A0, $ED, $CE, $14, $55, $43
	db $42, $CB, $AC, $BC, $F1, $00, $0F, $FE
	db $E2, $76, $F9, $B0, $C0, $10, $CA, $C0
	db $23, $31, $EF, $FE, $E3, $B4, $2E, $2B
	db $A0, $CF, $64, $13, $1C, $D0, $B0, $CE
	db $E4, $03, $3F, $FA, $CC, $01, $35, $A0
	db $56, $0E, $DC, $0D, $10, $00, $EF, $E3
	db $94, $F5, $FC, $0A, $FF, $13, $04, $DD
	db $D1, $A4, $12, $22, $30, $CA, $9E, $04
	db $73, $5E, $BC, $0D, $FF, $27, $60, $9B
	db $E2, $0D, $07, $B8, $6D, $BE, $DF, $24
	db $0F, $60, $9E, $1C, $B4, $D1, $04, $73
	db $FE, $E9, $10, $12, $51, $B0, $F2, $0B
	db $9C, $12, $45, $52, $EE, $CE, $A0, $E2
	db $31, $2F, $DC, $E2, $57, $65, $0B, $A4
	db $FE, $24, $41, $0F, $CF, $F1, $47, $1D
	db $B8, $E0, $02, $30, $20, $ED, $DF, $F4
	db $64, $B4, $73, $EB, $DC, $BD, $37, $73
	db $ED, $BC, $B0, $AC, $E2, $77, $40, $C8
	db $8B, $F5, $77, $B0, $42, $CA, $AB, $F4
	db $34, $E0, $E9, $DF, $B0, $55, $65, $3E
	db $CD, $BE, $12, $42, $20, $A0, $CD, $E3
	db $37, $43, $FB, $BA, $CE, $24, $94, $F1
	db $A0, $EE, $3F, $2D, $1D, $B2, $F3, $B4
	db $1E, $E0, $45, $4E, $BE, $0F, $DD, $26
	db $B0, $64, $0F, $0E, $EF, $12, $56, $1E
	db $0D, $A4, $C5, $03, $5D, $EF, $0D, $23
	db $02, $0D, $A0, $B0, $CF, $31, $43, $51
	db $ED, $EF, $F2, $90, $65, $40, $3D, $D1
	db $24, $34, $11, $DA, $84, $4F, $35, $33
	db $3C, $9B, $DF, $06, $FC, $A4, $10, $EC
	db $F4, $67, $4D, $8C, $0F, $EE, $A4, $27
	db $7E, $8C, $22, $12, $31, $01, $FE, $B0
	db $0F, $DD, $CE, $FE, $DE, $ED, $CA, $D7
	db $B4, $20, $FC, $FD, $DE, $23, $33, $EE
	db $E1, $A4, $0F, $63, $40, $B9, $AD, $F4
	db $57, $3F, $98, $F0, $00, $25, $20, $9A
	db $D3, $25, $66, $A8, $2D, $BC, $D2, $33
	db $02, $1E, $EC, $F1, $A4, $23, $55, $51
	db $DB, $FF, $EF, $FF, $12, $B8, $EF, $10
	db $EF, $57, $EA, $D4, $EC, $03, $B0, $BC
	db $F3, $41, $EF, $FE, $04, $77, $42, $A4
	db $B9, $DF, $45, $42, $0D, $C0, $F1, $23
	db $90, $73, $DA, $C1, $24, $76, $5D, $BA
	db $C1, $94, $44, $CE, $9B, $D1, $55, $63
	db $CE, $C0, $B0, $24, $43, $0E, $CB, $BC
	db $DD, $CD, $37, $B0, $73, $22, $2F, $CD
	db $F0, $11, $1E, $E0, $AC, $EE, $36, $9B
	db $4E, $1F, $4A, $79, $14, $A0, $BB, $C6
	db $24, $42, $2E, $CD, $F2, $23, $A0, $FF
	db $00, $10, $43, $53, $0E, $BA, $CE, $9C
	db $FF, $5C, $1F, $E0, $F4, $0F, $BC, $7C
	db $A4, $F0, $03, $10, $E1, $64, $4D, $BA
	db $F0, $A0, $AA, $B1, $76, $2E, $00, $F1
	db $56, $33, $B4, $10, $0F, $ED, $FF, $0F
	db $FE, $16, $72, $A8, $97, $CA, $F5, $31
	db $15, $C9, $25, $EB, $A8, $66, $AE, $FE
	db $2C, $24, $21, $01, $DB, $90, $2F, $B8
	db $BF, $45, $0D, $DD, $DE, $E0, $90, $57
	db $52, $21, $FD, $DF, $10, $FD, $CC, $A4
	db $01, $12, $62, $DD, $BB, $EE, $04, $30
	db $A4, $F2, $73, $0C, $F1, $0A, $AF, $33
	db $11, $A0, $02, $46, $75, $57, $5E, $BB
	db $CF, $2F, $A8, $3C, $F3, $05, $13, $BB
	db $FE, $6A, $52, $A4, $43, $02, $BE, $D3
	db $52, $32, $1B, $9E, $98, $F3, $15, $3A
	db $ED, $3D, $14, $3D, $EE, $A4, $DD, $DE
	db $01, $22, $34, $63, $DA, $AD, $A4, $02
	db $00, $23, $0E, $DF, $44, $32, $1E, $C0
	db $22, $0D, $DF, $DE, $DD, $BB, $F4, $63
	db $B4, $50, $A9, $D2, $F0, $62, $DD, $20
	db $D4, $B4, $43, $11, $CD, $CD, $02, $E1
	db $30, $2D, $A0, $12, $32, $47, $4F, $DD
	db $B9, $DE, $12, $A0, $15, $54, $24, $20
	db $0F, $EC, $BC, $E0, $84, $46, $12, $2A
	db $01, $09, $E0, $AA, $DD, $A4, $F0, $33
	db $55, $CE, $FA, $FE, $01, $23, $98, $EB
	db $94, $73, $01, $19, $04, $8E, $DF, $C0
	db $DC, $CB, $BB, $F6, $64, $55, $0E, $FE
	db $B4, $E4, $40, $D0, $FF, $02, $44, $2E
	db $FD, $B0, $C9, $98, $BD, $33, $22, $10
	db $EF, $03, $A4, $EF, $FC, $CE, $F2, $37
	db $53, $EE, $EB, $B0, $EE, $EF, $01, $0F
	db $EE, $F0, $16, $73, $B0, $2E, $C9, $9B
	db $DE, $D2, $56, $52, $00, $A0, $10, $AB
	db $E2, $0E, $FF, $0F, $34, $47, $A8, $08
	db $63, $BE, $0D, $50, $E2, $2E, $47, $B4
	db $5F, $E1, $EC, $DF, $F2, $12, $2F, $0F
	db $A4, $11, $44, $2F, $DD, $BA, $D1, $44
	db $53, $A4, $EE, $EE, $FF, $13, $21, $1F
	db $BD, $ED, $98, $76, $2F, $AC, $E2, $C1
	db $63, $FE, $00, $B4, $00, $20, $D4, $1B
	db $0C, $EC, $26, $65, $B0, $45, $43, $FB
	db $BC, $CE, $12, $EE, $02, $B0, $23, $76
	db $42, $0E, $DD, $E0, $ED, $DC, $B0, $BE
	db $25, $46, $51, $1C, $BB, $EF, $01, $A4
	db $E3, $E1, $F1, $32, $1E, $CE, $BE, $E2
	db $A4, $54, $31, $3E, $DF, $0F, $F0, $FC
	db $EE, $A4, $01, $76, $42, $DC, $CB, $D0
	db $43, $30, $A8, $E0, $02, $11, $21, $2C
	db $A1, $A1, $24, $B8, $00, $F4, $5E, $82
	db $4A, $D3, $4D, $F5, $B4, $4E, $C2, $1F
	db $15, $32, $1D, $DF, $BE, $A4, $3C, $05
	db $2E, $03, $44, $40, $E1, $C9, $A4, $0B
	db $F3, $11, $32, $23, $0F, $2F, $EE, $94
	db $C9, $BD, $04, $46, $64, $23, $0B, $EC
	db $A4, $FF, $DE, $EE, $F2, $66, $72, $EB
	db $CD, $98, $E7, $E6, $58, $DE, $10, $35
	db $22, $C0, $C0, $33, $1F, $EC, $CC, $BA
	db $B0, $44, $46, $BC, $AA, $35, $B0, $71
	db $91, $3E, $E3, $21, $B4, $41, $D1, $DB
	db $F1, $C1, $3F, $F1, $F1, $B0, $20, $24
	db $63, $21, $ED, $CD, $E0, $11, $A0, $54
	db $13, $12, $34, $21, $E9, $9A, $BF, $A4
	db $47, $0D, $2A, $BC, $10, $E0, $27, $21
	db $94, $1F, $EB, $1F, $9F, $23, $CD, $23
	db $30, $A8, $20, $E1, $01, $F6, $8E, $2A
	db $4D, $4A, $B8, $57, $18, $F4, $9B, $62
	db $D2, $7E, $A2, $B4, $FE, $E1, $23, $60
	db $E2, $DA, $0F, $D1, $A4, $30, $31, $E2
	db $5C, $16, $59, $E0, $AE, $98, $24, $F6
	db $C0, $E8, $54, $C4, $1E, $C0, $94, $BA
	db $02, $47, $57, $39, $AA, $CA, $02, $98
	db $84, $74, $0B, $AD, $5E, $C2, $F3, $72
	db $94, $FB, $23, $10, $25, $32, $1F, $2F
	db $FB, $B8, $F0, $01, $F0, $F7, $59, $B5
	db $08, $07, $B4, $ED, $06, $2D, $10, $FF
	db $22, $43, $CF, $B0, $4E, $CE, $DC, $EF
	db $DE, $CC, $02, $13, $B0, $74, $1F, $DB
	db $CD, $E1, $43, $32, $0F, $9C, $63, $F1
	db $AF, $E9, $37, $42, $5D, $01, $A4, $CB
	db $CA, $FF, $3D, $16, $34, $FF, $01, $94
	db $EA, $CD, $44, $A9, $F6, $22, $54, $41
	db $B8, $00, $10, $E0, $0E, $11, $0F, $F4
	db $43, $B8, $8E, $6A, $A5, $5B, $06, $1A
	db $12, $EE, $B0, $F1, $37, $74, $53, $DC
	db $FB, $E0, $FD, $B4, $0F, $E5, $F1, $44
	db $DE, $0B, $F0, $11, $A0, $33, $45, $2D
	db $EF, $24, $66, $41, $A8, $A4, $02, $17
	db $43, $FE, $EB, $CE, $00, $E3, $A0, $05
	db $65, $42, $1F, $EC, $C0, $10, $EE, $98
	db $2B, $42, $2D, $03, $CC, $71, $CF, $BD
	db $B8, $10, $F4, $EC, $67, $AA, $41, $BE
	db $5E, $A4, $EF, $67, $2B, $F4, $DC, $67
	db $F1, $1D, $B4, $ED, $F1, $40, $2E, $EE
	db $DE, $C3, $57, $B4, $21, $1C, $BD, $0F
	db $14, $30, $FF, $ED, $A8, $46, $3D, $E1
	db $AF, $F2, $22, $2F, $2A, $A4, $FD, $EF
	db $F1, $16, $52, $0D, $CB, $EE, $98, $17
	db $30, $D9, $10, $0E, $52, $E1, $0C, $A4
	db $DE, $F4, $41, $2F, $CB, $BE, $F1, $02
	db $A8, $61, $A9, $12, $0F, $F4, $21, $D2
	db $FB, $9C, $16, $1D, $54, $09, $C3, $E2
	db $40, $E1, $B8, $FE, $2F, $E0, $27, $2A
	db $E4, $BA, $53, $B0, $A8, $E2, $23, $40
	db $EE, $DF, $45, $47, $B0, $50, $0F, $BD
	db $EB, $BE, $FF, $21, $EE, $A4, $54, $10
	db $BF, $2B, $BF, $12, $56, $12, $94, $0C
	db $CC, $FD, $3E, $C1, $0F, $13, $32, $B0
	db $22, $22, $FE, $CB, $9B, $04, $54, $43
	db $A4, $BA, $B1, $43, $56, $FA, $BF, $D0
	db $37, $A4, $50, $10, $AC, $12, $21, $ED
	db $CB, $AD, $C0, $BC, $05, $43, $42, $EE
	db $ED, $E1, $21, $B0, $31, $DC, $DE, $27
	db $76, $72, $CC, $BB, $B0, $F2, $11, $2E
	db $BC, $BB, $E4, $65, $32, $A4, $C9, $C3
	db $31, $47, $1B, $F1, $DD, $33, $A8, $EF
	db $0E, $1E, $16, $3B, $FF, $F9, $33, $B0
	db $AB, $BD, $07, $53, $32, $EC, $EF, $00
	db $A4, $54, $CA, $01, $D1, $64, $F2, $ED
	db $DE, $B4, $02, $20, $0E, $DF, $EF, $10
	db $15, $7D, $A8, $16, $E9, $66, $C2, $10
	db $EC, $F5, $3C, $A4, $06, $3C, $EF, $BC
	db $14, $34, $3C, $CC, $A4, $CD, $13, $24
	db $10, $4E, $CE, $01, $03, $84, $C7, $3B
	db $F3, $0B, $43, $A1, $4F, $EC, $A8, $10
	db $1F, $41, $A0, $FE, $C7, $0E, $4E, $B0
	db $E3, $52, $34, $0F, $21, $E1, $40, $F0
	db $B0, $FC, $F0, $04, $63, $34, $FF, $10
	db $F2, $B0, $2D, $DB, $89, $C0, $37, $51
	db $FE, $DE, $A4, $20, $75, $DC, $DC, $E4
	db $22, $43, $DE, $A0, $1D, $AD, $00, $34
	db $10, $0D, $CE, $FE, $A8, $6E, $B1, $E0
	db $FF, $57, $28, $F1, $0C, $98, $95, $56
	db $40, $ED, $AD, $16, $04, $41, $A8, $CE
	db $2D, $D3, $62, $F0, $BE, $F0, $C3, $C0
	db $BB, $C0, $44, $45, $3F, $FF, $DF, $11
	db $B0, $25, $0C, $FE, $C3, $63, $66, $0D
	db $EA, $B4, $07, $20, $3D, $BB, $0D, $17
	db $33, $3F, $B0, $1E, $EA, $B0, $14, $44
	db $0E, $DC, $F2, $A4, $42, $2C, $8B, $EE
	db $25, $65, $1F, $DD, $B0, $EC, $CD, $01
	db $21, $10, $ED, $DB, $C2, $A4, $7D, $EE
	db $EF, $CE, $47, $1F, $2F, $9B, $A4, $12
	db $14, $42, $FD, $DC, $D0, $37, $63, $B0
	db $64, $0C, $98, $9B, $DC, $D2, $42, $14
	db $A4, $ED, $52, $BD, $1C, $C3, $EE, $55
	db $21, $A4, $3C, $E3, $CC, $30, $C3, $5D
	db $04, $BD, $A4, $1D, $B3, $2C, $06, $40
	db $20, $0E, $F0, $94, $41, $E2, $DF, $DE
	db $B1, $11, $44, $02, $A4, $1F, $F1, $F0
	db $41, $BE, $EC, $E1, $31, $A4, $42, $E0
	db $AD, $45, $11, $63, $CB, $BD, $A0, $AA
	db $AF, $55, $22, $2E, $E0, $13, $55, $A4
	db $DE, $ED, $24, $20, $1F, $C1, $CB, $12
	db $B0, $ED, $CF, $43, $03, $63, $01, $0D
	db $F1, $A0, $EF, $30, $B1, $2E, $37, $32
	db $60, $D0, $A4, $BD, $66, $D5, $4A, $DF
	db $9D, $20, $D3, $B0, $DE, $22, $24, $52
	db $24, $0E, $0F, $CE, $A4, $39, $34, $E4
	db $7E, $04, $DA, $1D, $C4, $A0, $10, $24
	db $0C, $DB, $9D, $01, $55, $F8, $B0, $CC
	db $F2, $23, $55, $FD, $DC, $CF, $24, $A4
	db $FE, $CF, $EF, $33, $33, $1D, $CE, $BF
	db $A4, $45, $32, $0D, $AC, $C0, $23, $2F
	db $C0, $A4, $52, $D5, $7B, $03, $A9, $41
	db $A6, $5A, $B0, $02, $0F, $21, $04, $41
	db $22, $DD, $FE, $AC, $27, $BE, $4B, $87
	db $2B, $46, $AE, $36, $A0, $60, $36, $33
	db $54, $EE, $EB, $C0, $10, $A1, $54, $25
	db $5F, $14, $1F, $10, $E0, $11, $A4

DATA_EEE8CE:
	db $00, $00, $D0, $00, $80, $C3, $D4, $B4
	db $D4, $C2, $F0, $FE, $4C, $90, $2D, $4C
	db $3C, $4D, $3E, $1F, $01, $E3, $90, $D4
	db $C4, $C4, $D3, $D1, $F0, $1E, $3D, $90
	db $3B, $5C, $5B, $5C, $3D, $30, $01, $E3
	db $90, $B5, $B6, $96, $A4, $C3, $F0, $1D
	db $4B, $90, $6A, $79, $6A, $4D, $2F, $03
	db $C4, $A7, $90, $97, $B6, $B2, $F0, $2C
	db $6A, $68, $7A, $A0, $2E, $10, $F2, $E3
	db $C4, $C3, $C3, $E1, $A0, $0F, $1E, $3D
	db $3D, $3E, $20, $F1, $D4, $A0, $C4, $C4
	db $D0, $1F, $3C, $5C, $3D, $2F, $90, $E4
	db $D4, $95, $D1, $E1, $2D, $3E, $3B, $90
	db $3F, $10, $F3, $B5, $C4, $B3, $1D, $2D
	db $90, $6A, $22, $F1, $C7, $BF, $02, $1A
	db $60, $90, $EE, $23, $90, $40, $EE, $7D
	db $D1, $3F, $90, $A5, $1E, $E3, $3A, $04
	db $ED, $E7, $AF, $90, $25, $BC, $70, $CD
	db $71, $81, $50, $82, $A0, $4E, $E0, $5D
	db $E2, $2E, $D4, $0E, $E4, $A0, $1C, $02
	db $1B, $13, $0C, $05, $EE, $05, $A0, $EE
	db $14, $EC, $31, $0C, $40, $FC, $42, $A0
	db $DE, $23, $B0, $23, $B0, $22, $C0, $31
	db $A0, $C0, $30, $D0, $4F, $E0, $4E, $E0
	db $3E, $90, $D1, $5C, $D2, $4D, $E3, $2D
	db $E3, $1E, $81, $D5, $3B, $E3, $2C, $F3
	db $2D, $E4, $0F, $90

DATA_EEE9A2:
	db $00, $00, $A5, $04, $C0, $00, $00, $00
	db $00, $00, $00, $01, $F9, $C0, $AA, $E5
	db $BC, $CB, $38, $77, $76, $54, $C0, $33
	db $40, $79, $99, $AB, $CD, $DE, $4F, $C0
	db $DE, $EE, $EF, $E6, $45, $3C, $DD, $C5
	db $C0, $80, $B6, $8E, $E7, $4B, $AD, $FB
	db $1E, $B4, $E2, $13, $C2, $77, $2E, $95
	db $0F, $00, $C0, $B9, $AC, $2D, $4F, $C0
	db $46, $F4, $53, $C0, $EB, $DC, $CE, $EE
	db $34, $24, $F0, $32, $C0, $3E, $CD, $FD
	db $DE, $EE, $23, $03, $64, $C0, $44, $12
	db $FB, $CC, $D0, $F2, $06, $51, $C0, $44
	db $21, $22, $22, $BE, $3E, $BC, $DE, $C0
	db $DE, $01, $6F, $DE, $55, $2D, $34, $1F
	db $B0, $65, $F2, $21, $43, $32, $22, $3E
	db $ED, $C0, $DC, $CD, $2E, $EE, $EF, $FF
	db $0F, $FF, $C0, $F4, $53, $23, $1E, $1E
	db $0C, $0F, $DE, $C0, $EE, $E3, $34, $30
	db $EF, $D2, $2F, $23, $C0, $12, $22, $11
	db $11, $11, $1C, $ED, $CD, $C0, $EE, $EF
	db $FF, $2F, $FF, $44, $43, $F1, $B0, $54
	db $23, $1B, $F3, $DE, $9C, $2D, $CA, $B0
	db $33, $45, $E3, $09, $AD, $02, $65, $44
	db $B0, $33, $22, $1D, $8A, $AB, $CC, $DD
	db $F4, $C0, $F3, $32, $22, $22, $11, $D0
	db $EC, $02, $C0, $1D, $D2, $22, $22, $11
	db $11, $0C, $CD, $C0, $DD, $EE, $EF, $E0
	db $43, $33, $22, $21, $B0, $22, $20, $1E
	db $91, $0A, $C9, $C1, $B2, $C0, $13, $00
	db $32, $22, $2D, $CD, $DD, $EE, $C0, $EF
	db $E0, $52, $10, $03, $22, $21, $10, $B0
	db $A2, $AE, $2F, $F9, $AB, $CB, $11, $CD
	db $B4, $03, $01, $B5, $7D, $F2, $F0, $F0
	db $00, $B0, $10, $0F, $CF, $99, $AB, $CC
	db $DD, $EE, $C0, $FF, $F2, $4F, $34, $30
	db $13, $FD, $02, $B4, $0C, $30, $B6, $9B
	db $20, $04, $1C, $15, $B0, $DD, $DE, $03
	db $DD, $05, $00, $76, $54, $B0, $43, $32
	db $22, $12, $28, $FD, $8A, $BC, $C0, $EE
	db $FF, $FF, $FF, $FF, $F0, $44, $33, $B0
	db $52, $D4, $23, $32, $01, $02, $EF, $F1
	db $B0, $32, $FA, $AE, $AB, $CC, $E5, $76
	db $50, $C0, $F3, $0C, $E0, $10, $11, $30
	db $00, $CF, $B0, $6D, $F4, $BB, $DC, $FD
	db $FF, $47, $65, $B0, $32, $C9, $CB, $CC
	db $DD, $EE, $1E, $45, $B0, $76, $53, $13
	db $0A, $B4, $44, $F2, $33, $B0, $2A, $8D
	db $0B, $BB, $E4, $51, $0E, $25, $B0, $52
	db $41, $D9, $EF, $A5, $EB, $C3, $7C, $B0
	db $E2, $05, $64, $CD, $20, $AC, $C1, $64
	db $B0, $05, $44, $FC, $91, $1A, $BC, $26
	db $53, $B0, $44, $40, $DB, $11, $DA, $E3
	db $1F, $22, $B0, $F4, $FA, $DB, $CC, $EF
	db $DE, $EE, $E3, $B0, $77, $55, $54, $D1
	db $23, $00, $22, $22, $B0, $22, $11, $11
	db $AF, $9B, $FA, $BB, $FE, $BC, $F3, $FF
	db $3E, $D6, $59, $EF, $2E, $03, $C0, $0D
	db $EE, $E0, $41, $03, $22, $11, $11, $B8
	db $00, $0F, $0C, $23, $40, $BB, $7B, $74
	db $B0, $3C, $FD, $67, $10, $D9, $E3, $32
	db $D0, $C0, $32, $22, $21, $01, $FB, $00
	db $0E, $D0, $B0, $13, $E2, $0A, $BD, $DD
	db $FD, $D0, $40, $B4, $17, $C0, $2F, $00
	db $0E, $E3, $CA, $11, $B0, $C0, $54, $54
	db $41, $FD, $9F, $2C, $AD, $B0, $2E, $FD
	db $FE, $F7, $2D, $20, $45, $10, $B0, $44
	db $3E, $23, $1F, $B9, $BE, $04, $22, $B0
	db $5E, $FD, $AB, $3E, $D0, $D2, $54, $52
	db $B0, $15, $32, $0C, $0B, $BE, $E1, $55
	db $42, $B0, $3F, $F1, $B9, $AC, $F1, $36
	db $54, $43, $B0, $21, $12, $22, $ED, $98
	db $CE, $BC, $CD, $B0, $DD, $04, $25, $12
	db $62, $CB, $BC, $D0, $B0, $42, $56, $54
	db $43, $3F, $21, $DB, $9A, $B0, $CF, $72
	db $24, $31, $01, $AA, $CB, $CE, $B0, $F2
	db $42, $4F, $E3, $2E, $C4, $55, $2E, $B0
	db $00, $44, $1B, $11, $10, $10, $E9, $12
	db $B0, $C9, $F3, $D0, $63, $11, $44, $11
	db $BD, $B0, $CB, $BC, $CD, $EE, $ED, $33
	db $F4, $46, $B0, $54, $24, $33, $22, $22
	db $2A, $AF, $FB, $B0, $AE, $DE, $E1, $64
	db $43, $15, $1A, $DC, $B0, $9D, $DC, $CF
	db $2F, $01, $DF, $37, $25, $B0, $41, $3F
	db $01, $DD, $AC, $0D, $44, $47, $B0, $0D
	db $BD, $21, $EE, $C3, $65, $54, $33, $B4
	db $FF, $2C, $83, $00, $46, $FC, $22, $E1
	db $A0, $3D, $2E, $E1, $B8, $BE, $AD, $1F
	db $2A, $B0, $23, $0F, $D1, $D3, $3F, $F0
	db $CD, $F4, $B0, $52, $24, $1D, $D2, $42
	db $DF, $1E, $1C, $B0, $CF, $54, $10, $00
	db $F3, $43, $E0, $22, $B0, $33, $20, $98
	db $CA, $C0, $CC, $DE, $F1, $A4, $F4, $F7
	db $4E, $FF, $0E, $D2, $F8, $B0, $B0, $E0
	db $DA, $BE, $0D, $EE, $FE, $F4, $76, $B0
	db $55, $44, $32, $AF, $1D, $02, $1D, $F4
	db $B0, $43, $DD, $CD, $12, $0F, $0F, $00
	db $03, $B0, $20, $CA, $BC, $0D, $CD, $D0
	db $15, $33, $B0, $73, $54, $32, $03, $32
	db $2E, $CE, $F4, $B0, $4F, $D3, $CB, $BE
	db $BD, $EC, $D1, $10, $A4, $6F, $A3, $52
	db $C2, $1E, $02, $9D, $00, $B0, $FF, $FD
	db $F2, $1E, $ED, $D0, $D3, $45, $B0, $31
	db $52, $01, $1F, $EB, $AC, $DF, $EE, $B0
	db $ED, $E3, $63, $46, $54, $42, $E2, $2D
	db $B0, $EF, $AD, $FE, $0E, $0E, $13, $1E
	db $0F, $B0, $C0, $0B, $EF, $F0, $46, $61
	db $0F, $EF, $A0, $55, $57, $51, $FF, $E3
	db $FB, $04, $25, $A4, $2F, $FF, $EC, $1D
	db $C3, $21, $F9, $F2, $B0, $22, $FF, $04
	db $42, $2E, $DC, $FF, $25, $B0, $04, $0E
	db $F0, $FE, $C0, $F1, $E2, $23, $B0, $45
	db $2E, $24, $23, $23, $FE, $CD, $0A, $B0
	db $AB, $BC, $F2, $E0, $12, $00, $0C, $03
	db $A4, $AE, $30, $E6, $16, $D2, $D1, $DB
	db $68, $A4, $C7, $0C, $53, $6D, $A1, $59
	db $32, $3E, $B0, $2F, $AB, $AA, $CC, $CE
	db $DF, $F2, $11, $A4, $10, $C1, $4E, $1C
	db $31, $01, $44, $BD, $A0, $47, $56, $FE
	db $1F, $09, $DC, $FD, $D8, $A0, $8D, $EA
	db $D2, $65, $51, $FD, $EC, $A6, $B0, $32
	db $40, $22, $10, $FF, $EE, $14, $2F, $A4
	db $31, $23, $F8, $EC, $E3, $01, $41, $4C
	db $A0, $25, $0A, $EE, $AB, $9E, $52, $1F
	db $24, $A4, $E2, $50, $A1, $C4, $FE, $2E
	db $15, $EC, $A4, $3E, $3F, $03, $F2, $3A
	db $B1, $9F, $D0, $A4, $11, $50, $33, $C0
	db $7D, $D4, $E1, $C6, $A4, $3C, $1F, $4F
	db $39, $C0, $CD, $60, $E1, $A0, $D0, $14
	db $F0, $00, $53, $03, $27, $14, $A0, $76
	db $11, $D9, $DA, $BF, $4D, $BC, $CA, $A4
	db $D0, $62, $13, $40, $F0, $A0, $53, $EE
	db $A0, $21, $11, $FD, $CB, $AD, $A1, $10
	db $E0, $A0, $FF, $66, $77, $1C, $AB, $CF
	db $DB, $EF, $A0, $22, $30, $46, $52, $FD
	db $E4, $30, $35, $A0, $33, $02, $DB, $BC
	db $BF, $F1, $1E, $10, $A0, $01, $12, $00
	db $2E, $AE, $DF, $DB, $47, $A0, $72, $E2
	db $FE, $EB, $02, $EE, $11, $02, $A4, $2F
	db $0E, $2D, $42, $FC, $EA, $14, $DF, $A0
	db $A0, $0F, $31, $0D, $B1, $43, $22, $E1
	db $A0, $46, $31, $2F, $E2, $F0, $E0, $0F
	db $F3, $A0, $1F, $35, $50, $F1, $4F, $F0
	db $20, $CD, $A0, $DA, $AF, $C1, $10, $2F
	db $DB, $E0, $EC, $94, $46, $33, $2F, $5E
	db $E5, $EE, $FD, $B0, $A0, $FE, $EE, $E1
	db $EE, $FE, $BC, $DC, $88, $A0, $AD, $15
	db $45, $22, $46, $10, $F0, $20, $90, $D1
	db $43, $0F, $03, $0B, $D2, $10, $33, $95
	db $D2, $3F, $AC, $43, $71, $8C, $E3, $E9
	db $94

DATA_EEEE4B:
	db $00, $00, $67, $08, $C0, $F1, $FF, $02
	db $50, $FC, $13, $FF, $CF, $B0, $E1, $09
	db $13, $51, $FE, $27, $3D, $BE, $B0, $56
	db $0C, $83, $53, $DE, $F1, $1B, $DF, $B0
	db $33, $FB, $F4, $60, $EE, $C1, $20, $EC
	db $C0, $F1, $32, $DD, $E4, $50, $CB, $06
	db $3D, $C0, $B0, $5F, $EA, $14, $30, $BE
	db $34, $3E, $C0, $0F, $25, $FD, $C1, $64
	db $DC, $D4, $30, $C0, $FF, $1E, $F4, $23
	db $EF, $F3, $FC, $3C, $C0, $33, $01, $90
	db $13, $2B, $F2, $13, $CD, $C0, $11, $3D
	db $D3, $E2, $D2, $4D, $DE, $15, $C0, $FC
	db $22, $3F, $CC, $06, $51, $A9, $F6, $C0
	db $31, $D9, $04, $14, $1A, $BF, $46, $0B
	db $C0, $B2, $53, $DD, $D1, $52, $FA, $30
	db $42, $C0, $B1, $E4, $FF, $3F, $3B, $C3
	db $34, $DB, $C0, $F2, $53, $EC, $D4, $41
	db $CC, $04, $2D, $C0, $C1, $41, $BD, $1F
	db $5E, $20, $EC, $E3, $C0, $43, $FA, $CE
	db $45, $2B, $CE, $44, $2C, $C0, $BF, $25
	db $10, $BF, $13, $0B, $E2, $32, $C0, $1B
	db $0F, $32, $2C, $EF, $14, $2D, $C2, $C0
	db $23, $2B, $B1, $33, $3F, $BC, $F4, $43
	db $C0, $DD, $12, $23, $2B, $CF, $44, $2C
	db $C0, $C0, $44, $1D, $CD, $34, $4F, $EC
	db $D2, $43, $C0, $3D, $CC, $25, $4F, $DE
	db $43, $FE, $DF, $C0, $F2, $03, $0E, $0E
	db $E4, $00, $3F, $B0, $C0, $F2, $43, $CC
	db $E2, $43, $0C, $CF, $13, $C0, $3F, $CD
	db $05, $41, $CC, $D4, $32, $FB, $C0, $C0
	db $43, $3E, $CD, $F4, $42, $1B, $CF, $C0
	db $33, $4E, $CF, $F1, $41, $0C, $D3, $32
	db $C0, $3E, $DE, $E4, $40, $1E, $DF, $11
	db $32, $C0, $FD, $CE, $34, $30, $BC, $03
	db $33, $CC, $C0, $D2, $30, $DC, $D0, $43
	db $2D, $CD, $F4, $C0, $42, $C0, $DE, $23
	db $21, $DC, $D4, $23, $C0, $2D, $DD, $34
	db $30, $CE, $34, $3F, $CF, $C0, $E4, $4F
	db $1E, $FF, $20, $13, $FD, $D0, $C0, $33
	db $2D, $DD, $24, $4D, $C0, $10, $3E, $C0
	db $D2, $DE, $0F, $43, $C1, $D1, $23, $C0
	db $B0, $BF, $61, $3A, $59, $05, $F4, $EF
	db $84, $B0, $C6, $58, $DD, $71, $59, $5F
	db $53, $19, $C0, $D4, $C2, $3F, $CF, $1F
	db $F3, $01, $CE, $C0, $F4, $41, $B0, $2C
	db $4D, $13, $0D, $D3, $B0, $5F, $B3, $26
	db $BA, $07, $DC, $52, $1B, $B0, $28, $37
	db $2C, $A7, $92, $7C, $2D, $0A, $C0, $24
	db $F0, $C3, $D3, $3E, $E4, $D3, $2D, $C0
	db $ED, $5E, $32, $DD, $E4, $03, $1E, $DE
	db $C0, $4F, $32, $DD, $E4, $F2, $1E, $DF
	db $4F, $B0, $10, $BE, $72, $F2, $BF, $E6
	db $1F, $4B, $B0, $0C, $71, $D4, $A2, $A7
	db $1C, $5A, $7A, $B0, $2E, $06, $F4, $91
	db $D2, $45, $E8, $83, $B0, $6D, $6E, $8F
	db $5E, $07, $E9, $21, $D2, $C0, $2D, $F2
	db $2D, $E1, $3F, $13, $CC, $13, $B0, $D5
	db $9C, $A4, $57, $3C, $9A, $60, $75, $B0
	db $D9, $94, $44, $4F, $A8, $52, $16, $5B
	db $C0, $CE, $13, $32, $FC, $C3, $F3, $2C
	db $C0, $C0, $12, $21, $DC, $D3, $31, $21
	db $CC, $3F, $C0, $22, $2C, $C0, $13, $12
	db $FC, $D3, $12, $B0, $4E, $8D, $17, $51
	db $C8, $A2, $71, $13, $B0, $88, $E3, $75
	db $EA, $BE, $67, $C0, $49, $B0, $9F, $46
	db $5E, $9A, $F7, $D2, $08, $A2, $C0, $42
	db $1F, $CD, $04, $31, $FF, $DE, $33, $C0
	db $21, $EC, $D2, $42, $F2, $ED, $F3, $31
	db $B0, $29, $A7, $7F, $42, $9A, $07, $41
	db $0A, $C0, $DF, $5F, $32, $ED, $D3, $33
	db $0F, $CD, $C0, $32, $22, $1C, $CF, $42
	db $FE, $CF, $21, $B4, $4E, $AA, $36, $4F
	db $FD, $84, $44, $10, $C0, $0B, $D1, $12
	db $00, $CE, $21, $21, $1B, $C0, $E1, $3E
	db $FF, $14, $00, $C3, $E3, $F2, $B0, $9E
	db $4F, $E7, $6C, $81, $6D, $34, $8A, $C0
	db $E5, $03, $2D, $CF, $41, $1C, $C1, $03
	db $C0, $30, $CF, $E1, $44, $E0, $ED, $04
	db $02, $B0, $F9, $A4, $74, $1A, $BE, $27
	db $50, $E8, $C0, $C2, $10, $0D, $D2, $32
	db $0F, $CC, $13, $C0, $3D, $2C, $D1, $32
	db $1D, $CD, $23, $21, $B0, $98, $A5, $76
	db $E8, $93, $65, $B8, $A1, $B0, $77, $49
	db $9C, $47, $61, $99, $C5, $76, $B0, $08
	db $9E, $67, $5F, $8A, $E6, $75, $F9, $B0
	db $A2, $74, $F9, $AD, $77, $4E, $BA, $C6
	db $C0, $41, $0E, $DE, $34, $00, $FD, $D3
	db $4E, $C0, $11, $EC, $24, $E0, $1E, $F4
	db $F0, $21, $C0, $CD, $40, $F2, $2E, $C2
	db $01, $02, $1C, $C0, $F0, $2F, $32, $DD
	db $11, $02, $2E, $C2, $C0, $11, $20, $C1
	db $02, $13, $1C, $F1, $2F, $C0, $32, $DC
	db $01, $22, $1E, $CF, $21, $31, $C0, $0C
	db $D1, $23, $2F, $BF, $22, $20, $CD, $C0
	db $F1, $43, $1B, $CF, $13, $32, $CC, $F0
	db $C0, $24, $3E, $CF, $01, $33, $1C, $EE
	db $03, $C0, $3F, $DF, $12, $32, $FC, $DE
	db $24, $31, $C0, $CC, $E2, $32, $2F, $CD
	db $F3, $43, $0C, $C0, $DE, $23, $21, $EC
	db $D1, $43, $FC, $DF, $C0, $33, $21, $EC
	db $D0, $44, $20, $CD, $F3, $C0, $32, $2D
	db $CD, $04, $32, $0C, $DE, $33, $C0, $20
	db $CD, $F4, $32, $0C, $DE, $24, $21, $C0
	db $0C, $CF, $34, $2F, $FD, $E1, $43, $10
	db $C0, $CC, $F2, $43, $D1, $DF, $43, $11
	db $DC, $C0, $E0, $43, $F0, $CE, $F4, $31
	db $0E, $CE, $C0, $04, $30, $FD, $DF, $34
	db $00, $FC, $0E, $C0, $41, $1F, $DD, $24
	db $21, $0C, $DE, $44, $C0, $1F, $ED, $E2
	db $42, $1F, $CD, $F4, $40, $C0, $D1, $DD
	db $04, $32, $ED, $E3, $43, $FD, $B0, $EA
	db $F7, $62, $E8, $CF, $47, $6A, $A6, $C0
	db $EE, $33, $2D, $DE, $E2, $44, $CE, $2D
	db $B0, $C5, $1E, $9C, $F6, $74, $8A, $5B
	db $F3, $B0, $4E, $19, $AD, $77, $49, $B2
	db $FD, $55, $B0, $C0, $B9, $D7, $75, $9D
	db $35, $31, $98, $B0, $30, $5E, $26, $90
	db $F3, $B1, $71, $BB, $C0, $01, $13, $2C
	db $D0, $22, $03, $EC, $10, $B0, $22, $29
	db $A0, $74, $D5, $9E, $E1, $23, $C0, $31
	db $CD, $04, $31, $0B, $20, $E2, $01, $C0
	db $0C, $2F, $30, $F0, $F1, $C0, $33, $1D
	db $C0, $DE, $14, $30, $C0, $D0, $33, $D0
	db $FC, $B0, $E7, $70, $81, $BF, $75, $0B
	db $39, $A3, $C0, $32, $FC, $D2, $41, $02
	db $DC, $E3, $41, $C0, $1F, $BD, $04, $32
	db $0B, $CE, $34, $32, $C0, $BB, $01, $22
	db $1E, $CF, $14, $3E, $EC, $C0, $E2, $43
	db $C1, $DD, $F3, $4F, $F1, $CF, $B0, $55
	db $D1, $58, $92, $21, $55, $98, $36, $C0
	db $F1, $0F, $DE, $F4, $4F, $0C, $1E, $23
	db $C0, $F2, $DD, $DF, $52, $3F, $DE, $D4
	db $40, $C0, $0F, $ED, $15, $2E, $3E, $E3
	db $40, $2F, $C0, $CD, $04, $22, $1C, $DE
	db $33, $23, $DC, $C0, $D2, $42, $2F, $CC
	db $03, $22, $1D, $CE, $C0, $03, $20, $BC
	db $D3, $43, $2C, $CD, $24, $C0, $22, $EC
	db $D1, $33, $0F, $DC, $01, $41, $C0, $0F
	db $CE, $04, $31, $1C, $E3, $42, $1D, $C0
	db $CC, $23, $31, $ED, $C1, $23, $10, $EC
	db $B0, $C0, $76, $2D, $8A, $D6, $75, $1B
	db $89, $C0, $23, $1F, $DD, $02, $42, $0F
	db $CE, $04, $B0, $62, $F9, $AE, $77, $40
	db $B9, $A6, $76, $B4, $AE, $ED, $75, $3A
	db $09, $15, $7D, $DE, $C0, $DD, $F4, $31
	db $1E, $DD, $43, $21, $FE, $B0, $82, $66
	db $10, $B8, $D4, $73, $3C, $A8, $C0, $13
	db $20, $DC, $F3, $31, $0E, $CD, $13, $C0
	db $32, $DC, $C1, $32, $2E, $DD, $E3, $33
	db $B0, $3B, $8A, $26, $63, $9B, $16, $56
	db $BC, $C0, $ED, $14, $32, $DC, $D2, $42
	db $2C, $ED, $C0, $12, $33, $0E, $CE, $32
	db $21, $DE, $F3, $C0, $F3, $0D, $CF, $14
	db $20, $DC, $3F, $41, $B0, $F0, $BE, $B7
	db $71, $28, $BD, $67, $21, $C0, $C0, $E0
	db $44, $FD, $0F, $33, $FD, $D0, $C0, $2F
	db $31, $F0, $0D, $D4, $41, $ED, $FE, $C0
	db $33, $1D, $F1, $CE, $44, $FE, $0D, $14
	db $C0, $1F, $F0, $C1, $24, $F0, $EC, $32
	db $21, $B0, $90, $2B, $E6, $64, $F9, $9D
	db $77, $0B, $B0, $FA, $32, $24, $2D, $DC
	db $65, $2E, $AD, $B0, $B5, $67, $B0, $99
	db $57, $2C, $ED, $E3, $C0, $13, $0F, $1C
	db $F4, $1E, $F2, $E2, $00, $B0, $C2, $EC
	db $05, $81, $6F, $3A, $2A, $73, $B0, $1A
	db $D3, $FB, $33, $C0, $5D, $86, $6A, $C0
	db $E3, $0D, $30, $C2, $1F, $13, $D0, $13
	db $B0, $95, $4B, $01, $4B, $D7, $FC, $F7
	db $E1, $C0, $2D, $2E, $03, $02, $EE, $D4
	db $3F, $2C, $B0, $4E, $6D, $D6, $CC, $51
	db $1F, $29, $F3, $C0, $12, $E3, $D2, $E1
	db $11, $1E, $FD, $4D, $C0, $23, $EC, $1F
	db $3F, $2D, $21, $E2, $3C, $C0, $D2, $F1
	db $F4, $ED, $00, $F2, $4E, $B2, $C0, $00
	db $12, $C1, $0E, $02, $0E, $3E, $E0, $C0
	db $20, $3E, $B1, $4F, $01, $DF, $24, $DE
	db $C0, $3E, $F3, $FD, $32, $DE, $12, $D2
	db $4C, $C0, $E2, $E1, $40, $CE, $30, $1F
	db $E1, $2C, $C0, $04, $1E, $1D, $F3, $30
	db $CE, $F3, $03, $C0, $FB, $10, $3E, $3D
	db $F3, $FD, $04, $F0, $C0, $0E, $43, $B0
	db $1D, $04, $1C, $12, $C2, $C0, $30, $D2
	db $FD, $21, $0F, $2C, $E3, $11, $C0, $1F
	db $C0, $42, $F0, $FF, $40, $E1, $0C, $B0
	db $65, $0A, $7C, $82, $6D, $23, $8A, $67
	db $C0, $E0, $FD, $04, $1D, $1F, $E1, $4E
	db $F2, $C0, $FF, $2F, $12, $DC, $32, $F2
	db $0D, $E4, $B0, $FC, $6F, $DF, $5F, $03
	db $39, $3E, $F3, $C0, $4E, $E1, $D1, $42
	db $DE, $22, $4F, $B1, $C0, $E2, $33, $BF
	db $0E, $23, $2B, $FE, $04, $C0, $4F, $BE
	db $F0, $43, $CD, $0F, $43, $2C, $C0, $E0
	db $34, $1B, $E0, $F3, $4E, $DD, $11, $C0
	db $42, $DB, $03, $04, $0B, $F2, $01, $2E
	db $C0, $EF, $0F, $12, $2E, $DF, $44, $FD
	db $B1, $C0, $34, $FD, $CF, $53, $EF, $E2
	db $12, $DD, $C0, $14, $1B, $2C, $34, $1C
	db $C2, $32, $0E, $C0, $B3, $E0, $0E, $03
	db $0C, $F3, $2D, $1D, $C0, $E4, $4F, $C0
	db $03, $21, $BE, $4F, $10, $C0, $0E, $24
	db $ED, $23, $0F, $C2, $43, $CD, $C0, $01
	db $24, $DC, $12, $F1, $FF, $11, $1E, $B0
	db $C5, $3E, $19, $A3, $74, $8B, $EF, $75
	db $B0, $CA, $6E, $34, $9E, $69, $E4, $62
	db $B9, $C0, $D2, $44, $CC, $F1, $44, $EB
	db $03, $13, $B0, $CE, $D7, $58, $34, $C0
	db $D0, $56, $CA, $C0, $1F, $33, $ED, $02
	db $40, $EC, $23, $3C, $B0, $CC, $37, $3A
	db $A3, $E7, $0B, $A4, $5B, $C0, $1E, $33
	db $ED, $00, $4F, $2C, $E2, $3D, $C0, $1E
	db $13, $DC, $04, $02, $CB, $24, $1F, $B0
	db $AB, $66, $2B, $0B, $01, $31, $FB, $4E
	db $C0, $23, $EE, $C3, $23, $2D, $CF, $42
	db $3D, $B0, $9D, $65, $3E, $EF, $20, $FD
	db $45, $1C, $C0, $C2, $21, $CC, $24, $3C
	db $0F, $13, $DC, $C0, $14, $20, $BE, $24
	db $3C, $CF, $33, $2D, $C0, $B1, $4E, $10
	db $D3, $1F, $02, $1E, $0E, $C0, $04, $3F
	db $B0, $11, $4D, $D0, $23, $1E, $C0, $1C
	db $31, $D1, $20, $1C, $FF, $23, $FC, $C0
	db $F1, $31, $BC, $10, $21, $D1, $E3, $EF
	db $C0, $00, $0F, $E1, $31, $0B, $1F, $21
	db $E0, $C0, $01, $F2, $0E, $EF, $21, $1B
	db $F2, $03, $C0, $CE, $3F, $20, $11, $EF
	db $0C, $35, $1C, $C0, $0E, $24, $1C, $F0
	db $14, $3D, $D1, $00, $C0, $30, $2F, $C2
	db $5F, $E1, $C1, $53, $EE, $C0, $D1, $34
	db $ED, $F1, $14, $2C, $E1, $F3, $C0, $2E
	db $FD, $E2, $23, $CF, $C4, $4E, $0B, $C0
	db $02, $31, $CE, $00, $41, $CF, $F2, $F2
	db $C0, $1F, $FB, $F5, $10, $CE, $22, $2E
	db $B1, $C0, $12, $C2, $1F, $EF, $42, $FE
	db $B4, $31, $C0, $0B, $F4, $31, $BF, $21
	db $10, $F1, $11, $C0, $F0, $13, $0C, $11
	db $3F, $D2, $32, $1C, $C0, $D3, $23, $EC
	db $22, $1E, $F2, $02, $DE, $C0, $32, $FF
	db $D0, $40, $CE, $23, $0D, $C3, $B0, $7E
	db $A1, $42, $A0, $04, $FF, $D3, $0C, $C0
	db $F2, $21, $B0, $23, $0E, $E0, $51, $DE
	db $C0, $F4, $2B, $E1, $41, $B0, $32, $CD
	db $22, $C0, $1C, $E2, $4F, $CD, $44, $0C
	db $B2, $42, $C0, $DB, $14, $2F, $C0, $42
	db $FC, $F4, $3E, $C0, $D2, $3F, $CE, $44
	db $1C, $C3, $42, $DC, $C0, $13, $1E, $D2
	db $30, $DC, $23, $2D, $B1, $C0, $41, $EB
	db $12, $10, $B1, $1F, $C1, $31, $C0, $FB
	db $13, $1F, $BF, $33, $1B, $E2, $32, $B0
	db $9D, $33, $3A, $D3, $43, $AB, $54, $2B
	db $C0, $E2, $1F, $D1, $22, $0C, $02, $21
	db $D0, $C0, $11, $1E, $02, $10, $C0, $22
	db $1C, $F2, $B0, $43, $9F, $14, $4B, $E1
	db $4B, $F2, $33, $B0, $B0, $14, $5A, $D0
	db $46, $9D, $04, $49, $B0, $FF, $37, $AC
	db $F3, $7C, $DE, $27, $BD, $B0, $F1, $2C
	db $C3, $7E, $BB, $37, $DA, $E3, $C0, $3F
	db $EE, $14, $0C, $E2, $41, $CD, $23, $C0
	db $0C, $E1, $30, $CE, $23, $DF, $33, $0B
	db $C0, $E2, $31, $CE, $12, $1C, $F2, $3F
	db $B0, $C0, $33, $FC, $F2, $3F, $DF, $33
	db $FD, $F3, $B0, $7D, $C7, $6C, $BF, $64
	db $CB, $07, $4B, $B0, $A1, $73, $BC, $16
	db $2B, $A2, $70, $CA, $B0, $36, $1B, $96
	db $6E, $AD, $41, $CB, $53, $B0, $0C, $E6
	db $30, $90, $72, $F9, $16, $21, $B0, $80
	db $53, $09, $35, $0F, $B5, $31, $EB, $B0
	db $32, $0C, $21, $4C, $D2, $23, $90, $21
	db $B0, $2C, $1F, $11, $C1, $03, $0D, $FF
	db $31, $B0, $0F, $D2, $E1, $F2, $2C, $E3
	db $3F, $FE, $A1, $F0, $26, $CB, $02, $08
	db $33, $3B, $91

DATA_EEF6B6:
	db $00, $00, $0B, $02, $C0, $00, $00, $00
	db $00, $00, $0D, $60, $B2, $C0, $4D, $A4
	db $5E, $A3, $5E, $B1, $6E, $B0, $C0, $50
	db $A0, $6D, $C3, $3E, $FF, $12, $FF, $B0
	db $04, $0D, $03, $0C, $20, $0D, $13, $FF
	db $A0, $E6, $1D, $E3, $3A, $01, $3D, $F4
	db $00, $B0, $E2, $0F, $E2, $7A, $C4, $5B
	db $C3, $3F, $B0, $B2, $4F, $B2, $6E, $C0
	db $60, $B0, $41, $B0, $AF, $53, $BD, $52
	db $CD, $54, $CC, $35, $A0, $A8, $76, $A8
	db $66, $DA, $37, $D9, $27, $A0, $F9, $16
	db $08, $07, $0B, $E6, $2B, $E5, $A0, $3B
	db $E3, $3D, $C3, $3E, $D2, $3F, $DF, $A0
	db $40, $EF, $31, $D0, $22, $EF, $11, $FD
	db $90, $53, $CC, $53, $AF, $44, $CB, $25
	db $DC, $90, $23, $FB, $24, $0B, $14, $FC
	db $11, $0F, $90, $F4, $1D, $E3, $2E, $C2
	db $5C, $D1, $4E, $90, $D1, $40, $B2, $5E
	db $B2, $6E, $BE, $71, $A0, $DE, $42, $CF
	db $22, $DD, $42, $DC, $42, $A0, $DE, $33
	db $BD, $43, $DD, $33, $CB, $35, $A0, $DB
	db $25, $EC, $24, $EB, $23, $FD, $13, $90
	db $CC, $17, $EC, $D4, $3B, $F5, $28, $E5
	db $90, $4B, $D6, $2B, $C6, $2E, $D2, $3C
	db $F2, $90, $4D, $C3, $4F, $A0, $72, $AF
	db $7E, $DE, $90, $7E, $B2, $33, $80, $41
	db $DE, $4F, $1B, $A0, $21, $E0, $13, $DE
	db $23, $EC, $43, $DC, $A0, $33, $DD, $25
	db $DC, $24, $FC, $13, $0C, $A0, $23, $0C
	db $E4, $1D, $F3, $0C, $03, $0E, $90, $D6
	db $1E, $C3, $4B, $D2, $5E, $D0, $41, $A0
	db $DF, $22, $DF, $32, $CF, $40, $D0, $40
	db $90, $8F, $71, $90, $61, $AE, $53, $CC
	db $44, $90, $BB, $54, $DC, $13, $ED, $14
	db $0D, $02, $70, $FA, $45, $DC, $E4, $24
	db $A0, $7C, $AF, $80, $40, $E0, $3E, $A4
	db $33, $DC, $21, $EE, $80, $51, $EE, $15
	db $EB, $14, $FA, $15, $49, $80, $C6, $29
	db $D5, $6B, $95, $7B, $86, $7D, $80, $83
	db $4E, $D0, $31, $DD, $32, $FF, $F2, $80
	db $F0, $EF, $41, $BD, $6E, $E3, $20, $C1
	db $80, $40, $C1, $69, $C6, $6A, $C6, $FC
	db $05, $80, $0B, $14, $0A, $16, $1C, $E4
	db $2D, $A4, $90, $3F, $D2, $3E, $EF, $4F
	db $D1, $3E, $C2, $90, $30, $C0, $4F, $C1
	db $5C, $E5, $0E, $F3, $80, $DF, $00, $1D
	db $10, $7D, $D4, $F0, $C3, $80, $E3, $3D
	db $A1, $7D, $B6, $4C, $A6, $3C, $80, $F1
	db $4E, $AD, $7F, $D1, $20, $94, $7F, $90
	db $C1, $3E, $E0, $50, $BF, $31, $EF, $3F
	db $90, $D1, $2F, $00, $01, $EF, $14, $FC
	db $04, $90, $0D, $24, $EB, $14, $FD, $03
	db $EC, $25, $90, $0C, $03, $FE, $13, $0D
	db $01, $2E, $F2, $80, $0C, $B7, $31, $A1
	db $5A, $E4, $7B, $D2, $80, $21, $92, $3F
	db $B1, $7F, $A2, $7C, $B2, $90, $21, $C2
	db $2F, $F0, $2F, $0F, $1F, $11, $70, $93
	db $02, $FF, $D1, $FC, $7E, $2D, $B7, $90
	db $2F, $E0, $2F, $EF, $43, $CD, $35, $DC
	db $90, $44, $CB, $34, $FB, $23, $FD, $F4
	db $1E, $90, $C1, $40, $DF, $30, $DF, $42
	db $DE, $21, $80, $CD, $53, $EA, $15, $DE
	db $43, $BC, $45, $80, $CD, $7E, $B0, $60
	db $D1, $20, $A0, $71, $80, $90, $5E, $B3
	db $6E, $AF, $42, $C0, $13, $81, $EE, $FF
	db $34, $BD, $33, $0D, $22, $EC, $80

DATA_EEF8C5:
	db $00, $00, $FF, $04, $C0, $00, $00, $01
	db $01, $0F, $FF, $32, $AF, $C0, $CB, $0F
	db $03, $15, $25, $53, $E4, $03, $C0, $3F
	db $19, $EC, $9A, $D8, $E0, $23, $25, $C0
	db $14, $53, $32, $30, $4D, $FC, $98, $BC
	db $C0, $CD, $C2, $15, $52, $43, $33, $62
	db $2E, $C0, $3F, $BD, $A9, $BC, $FF, $F1
	db $03, $51, $B4, $7E, $F5, $0C, $29, $94
	db $D0, $94, $3D, $B4, $45, $EE, $2E, $6F
	db $50, $C6, $19, $2E, $B4, $9F, $E3, $3C
	db $10, $14, $A5, $0C, $16, $B0, $57, $54
	db $43, $4C, $A0, $EB, $11, $1D, $B0, $9F
	db $DE, $0D, $13, $24, $41, $0E, $21, $B0
	db $03, $F1, $32, $01, $99, $DF, $FE, $32
	db $B0, $10, $0D, $0F, $F3, $56, $33, $31
	db $E0, $B0, $FC, $BC, $F0, $FF, $DE, $DD
	db $E2, $E3, $B0, $77, $75, $2F, $1F, $00
	db $1C, $AF, $DB, $B4, $F1, $F4, $F5, $2D
	db $4F, $5C, $D0, $F1, $B4, $3D, $0E, $B1
	db $C1, $2C, $37, $0F, $30, $B4, $1E, $40
	db $D5, $AF, $4C, $D1, $D0, $DE, $A4, $50
	db $55, $55, $ED, $7C, $22, $F7, $BA, $B0
	db $3D, $AB, $AC, $DD, $BD, $10, $D2, $50
	db $B0, $03, $26, $44, $64, $0C, $CC, $9C
	db $E0, $B0, $40, $DF, $EF, $EF, $33, $14
	db $52, $22, $B0, $10, $FE, $BE, $0D, $13
	db $ED, $DD, $DF, $A0, $27, $66, $42, $4C
	db $C4, $76, $52, $3C, $A4, $D1, $D1, $E1
	db $36, $FF, $04, $DA, $62, $A4, $D6, $5E
	db $6B, $AE, $9A, $02, $5D, $22, $B0, $F1
	db $FE, $03, $24, $66, $54, $22, $EE, $B0
	db $CB, $DC, $DE, $0F, $EF, $1D, $F3, $44
	db $B0, $64, $33, $1F, $FF, $DD, $20, $DD
	db $DE, $A4, $FF, $01, $51, $27, $0A, $E0
	db $00, $D2, $A4, $5F, $0E, $DB, $E1, $D0
	db $32, $62, $D2, $A4, $F1, $0E, $12, $F0
	db $74, $99, $ED, $B1, $A4, $03, $32, $E4
	db $1A, $D6, $24, $03, $21, $A4, $DE, $FE
	db $AD, $FF, $3F, $45, $AD, $F0, $B0, $0F
	db $23, $77, $44, $4F, $DF, $E1, $FE, $A4
	db $3F, $0A, $1F, $D0, $64, $51, $04, $1C
	db $B0, $FF, $F0, $02, $40, $FF, $CA, $BC
	db $DF, $A0, $31, $06, $02, $75, $03, $35
	db $64, $42, $A4, $DD, $A2, $E1, $51, $1F
	db $B4, $FF, $40, $A4, $47, $0E, $3D, $9E
	db $1D, $B2, $1F, $22, $A4, $C2, $ED, $E5
	db $5F, $67, $4D, $EB, $EC, $A0, $AD, $DC
	db $EA, $BB, $99, $9C, $DE, $36, $A4, $31
	db $E3, $0A, $F2, $EE, $3F, $FB, $BE, $A4
	db $03, $00, $74, $01, $0F, $FF, $12, $1F
	db $9C, $44, $8F, $9E, $36, $B7, $3C, $63
	db $80, $A0, $2D, $F2, $26, $77, $67, $70
	db $AA, $BA, $A4, $FF, $30, $13, $F0, $0C
	db $26, $02, $06, $A4, $FB, $FC, $FE, $F2
	db $7B, $D0, $FF, $EF, $A4, $33, $22, $14
	db $0E, $2E, $E9, $06, $10, $A8, $2D, $F0
	db $D1, $23, $10, $58, $E3, $0D, $A4, $0E
	db $21, $21, $1F, $FD, $00, $AE, $D2, $A4
	db $42, $2F, $02, $DD, $23, $07, $32, $CE
	db $94, $8B, $D0, $B1, $6B, $10, $CD, $2F
	db $10, $A4, $33, $37, $11, $EB, $DD, $DF
	db $13, $3F, $A4, $CE, $CC, $22, $24, $33
	db $25, $DF, $10, $A4, $CE, $0F, $0E, $2F
	db $DC, $DF, $21, $07, $A4, $45, $EF, $FE
	db $03, $32, $ED, $1E, $9E, $A4, $CE, $11
	db $31, $15, $02, $2C, $E1, $23, $A4, $43
	db $2D, $AD, $AD, $B1, $41, $31, $01, $A4
	db $EF, $22, $22, $12, $30, $01, $CA, $AF
	db $A4, $00, $21, $01, $EF, $DF, $16, $66
	db $1F, $94, $DC, $DE, $DE, $DE, $43, $A9
	db $CF, $BF, $A4, $01, $35, $53, $5F, $BD
	db $EF, $E3, $32, $98, $92, $93, $EE, $73
	db $3C, $5D, $0C, $3E, $98, $E0, $F4, $15
	db $DB, $00, $83, $69, $73, $94, $65, $61
	db $CD, $16, $26, $43, $2F, $0C, $A0, $1D
	db $A9, $98, $AB, $D1, $1F, $DC, $9C, $98
	db $33, $0A, $EC, $C0, $04, $31, $3D, $2E
	db $A4, $CF, $0D, $F2, $F3, $53, $53, $0D
	db $CD, $98, $07, $2D, $3C, $E0, $93, $22
	db $72, $A2, $94, $53, $F2, $0B, $20, $D5
	db $3B, $F0, $B9, $A4, $CB, $E2, $45, $42
	db $2E, $F0, $C2, $14, $98, $FE, $CA, $F4
	db $A7, $0C, $73, $E4, $B0, $98, $CE, $30
	db $15, $FF, $6A, $BE, $B3, $25, $94, $34
	db $03, $00, $F0, $0E, $26, $36, $40, $98
	db $2F, $87, $BF, $53, $15, $DB, $BE, $3F
	db $98, $63, $F3, $1C, $19, $D2, $E7, $20
	db $E1, $94, $4E, $FE, $B9, $CE, $16, $56
	db $64, $FB, $98, $10, $33, $22, $FA, $1D
	db $FC, $45, $11, $94, $22, $42, $1F, $C0
	db $0F, $55, $51, $11, $98, $8F, $3F, $36
	db $01, $FC, $D1, $E0, $16, $9C, $2F, $78
	db $3C, $EE, $0D, $12, $43, $C0, $98, $3B
	db $E0, $F2, $25, $3F, $FA, $D4, $CE, $94
	db $DE, $24, $20, $FD, $AC, $1E, $C3, $77
	db $94, $63, $2E, $CE, $BE, $21, $36, $39
	db $9D, $94, $9B, $22, $55, $44, $5D, $BE
	db $1D, $F1, $94, $46, $20, $FB, $A9, $B0
	db $14, $57, $5D, $98, $00, $F2, $41, $01
	db $0E, $E0, $95, $10, $94, $01, $15, $3E
	db $1D, $AC, $F3, $36, $74, $94, $1E, $BB
	db $BE, $14, $26, $0E, $1A, $9D, $94, $D0
	db $26, $63, $43, $FD, $9C, $F0, $56, $94
	db $43, $EA, $9A, $AF, $05, $54, $72, $ED
	db $94, $BF, $2F, $43, $31, $10, $D9, $9A
	db $E6, $98, $B4, $EE, $0D, $F1, $C5, $53
	db $1B, $C0, $94, $BC, $CD, $CE, $16, $52
	db $0B, $EE, $C0, $94, $23, $56, $74, $CC
	db $B9, $BF, $16, $21, $94, $10, $EA, $B0
	db $F2, $66, $61, $F1, $DC, $98, $1F, $50
	db $12, $0A, $FB, $50, $11, $33, $94, $63
	db $2F, $CC, $EF, $42, $24, $1F, $EB, $94
	db $DA, $A0, $15, $55, $31, $ED, $DC, $01
	db $94, $67, $42, $DB, $C9, $BF, $F2, $45
	db $41, $98, $DE, $21, $2E, $41, $F3, $C0
	db $AD, $23, $94, $13, $32, $30, $FE, $AC
	db $F1, $75, $45, $94, $F0, $0B, $CB, $E1
	db $33, $21, $3C, $AC, $98, $F4, $12, $5F
	db $B1, $CD, $1D, $63, $10, $94, $21, $1F
	db $BD, $BE, $F1, $63, $34, $0F, $94, $FA
	db $EF, $22, $45, $1E, $DB, $AF, $E1, $88
	db $7E, $EE, $CF, $B2, $30, $46, $D2, $CF
	db $94, $FD, $DA, $B0, $33, $72, $0E, $DC
	db $CE, $8C, $27, $65, $AD, $CA, $0F, $41
	db $D6, $5D, $88, $1B, $B0, $D1, $55, $06
	db $E1, $CB, $EA, $94, $DE, $F4, $41, $0F
	db $EC, $BF, $E0, $15, $8C, $00, $BD, $2E
	db $D0, $51, $04, $48, $D9, $88, $D5, $3F
	db $74, $3C, $EE, $BD, $03, $43, $88, $02
	db $0D, $EA, $0F, $D5, $43, $6D, $0F, $84
	db $FB, $9D, $FE, $57, $65, $2B, $99, $9D
	db $84, $03, $23, $73, $E0, $BB, $D1, $25
	db $47, $88, $DE, $DA, $F6, $F6, $4F, $0E
	db $DE, $94, $8C, $E2, $71, $24, $C1, $AC
	db $2C, $F6, $17, $88, $2B, $ED, $BE, $F6
	db $02, $70, $F0, $AC, $88, $2C, $26, $3F
	db $F1, $1A, $1D, $C4, $02, $88, $60, $0E
	db $D2, $EA, $22, $43, $5D, $CD, $84, $B8
	db $CC, $AD, $26, $65, $0E, $DA, $CF, $88
	db $4E, $42, $0D, $DC, $DF, $41, $33, $01
	db $88, $0C, $DD, $2F, $07, $4F, $F0, $EB
	db $1C, $84, $9C, $FF, $56, $40, $FB, $AB
	db $F0, $34, $88, $31, $DB, $CF, $12, $33
	db $2F, $F0, $B0, $88, $DD, $54, $11, $30
	db $BF, $0A, $21, $E6, $88, $32, $00, $DB
	db $B1, $11, $43, $21, $FD, $84, $DC, $B9
	db $E4, $36, $51, $43, $EA, $8C, $88, $04
	db $6C, $0F, $DE, $2B, $11, $75, $E1, $84
	db $4E, $DB, $BC, $EF, $35, $61, $FC, $AA
	db $88, $10, $53, $30, $E0, $CB, $0D, $26
	db $22, $88, $4A, $EB, $3D, $E1, $25, $51
	db $DE, $FD, $84, $ED, $EA, $E3, $55, $4F
	db $BA, $9A, $E0, $84, $26, $77, $3E, $CC
	db $DF, $24, $44, $30, $88, $DD, $E4, $11
	db $23, $21, $EA, $EF, $E2, $88, $7E, $16
	db $FF, $B9, $F0, $35, $10, $21, $84, $63
	db $FA, $9D, $F1, $34, $45, $41, $E8, $88
	db $F5, $6F, $11, $0E, $FD, $B1, $33, $44
	db $84, $32, $21, $0B, $CC, $F2, $45, $31
	db $0D, $89, $FF, $C4, $71, $11, $FC, $FD
	db $D1, $24, $85

DATA_EEFDC8:
	db $00, $00, $13, $02, $B0, $FF, $F0, $14
	db $32, $22, $10, $FF, $CB, $A0, $AD, $EE
	db $E0, $24, $65, $23, $76, $1E, $A0, $24
	db $ED, $42, $10, $3E, $CF, $0E, $ED, $94
	db $C1, $0E, $F0, $F1, $2E, $15, $4F, $01
	db $94, $10, $12, $FE, $0E, $34, $DE, $37
	db $FB, $B0, $10, $12, $00, $00, $00, $FE
	db $22, $DA, $B0, $D7, $43, $12, $10, $ED
	db $B9, $9B, $BC, $A8, $12, $F5, $AD, $5B
	db $FF, $2F, $25, $D0, $C0, $10, $FE, $CC
	db $15, $0F, $11, $11, $10, $94, $D3, $FE
	db $EC, $E3, $01, $10, $E4, $3C, $94, $31
	db $0E, $D0, $22, $07, $30, $04, $3F, $A0
	db $54, $42, $1D, $B0, $11, $E0, $1F, $D8
	db $C0, $BC, $45, $10, $21, $FE, $EC, $AB
	db $DE, $C0, $03, $76, $43, $1E, $AB, $CE
	db $14, $44, $C0, $32, $0E, $BB, $01, $DC
	db $DF, $66, $20, $A0, $63, $12, $20, $02
	db $20, $FE, $DD, $ED, $94, $BD, $2D, $06
	db $07, $44, $14, $31, $01, $A8, $FE, $03
	db $0F, $02, $6C, $A3, $0D, $28, $C0, $9F
	db $61, $F1, $0F, $EC, $8B, $CE, $67, $C0
	db $54, $3F, $8A, $BF, $77, $43, $2F, $98
	db $C0, $BE, $34, $43, $0C, $A0, $30, $BD
	db $E5, $B4, $48, $E2, $0E, $F1, $01, $2F
	db $DF, $1D, $A8, $43, $ED, $30, $E4, $07
	db $FC, $91, $C6, $C0, $F0, $11, $11, $01
	db $10, $00, $0D, $B0, $C0, $50, $0F, $D8
	db $9B, $F7, $55, $08, $BD, $C0, $74, $50
	db $8A, $47, $54, $08, $9D, $54, $C0, $2E
	db $CD, $F1, $00, $F1, $43, $AD, $77, $C0
	db $F1, $65, $32, $0E, $E1, $10, $0D, $BC
	db $B4, $12, $34, $20, $EE, $06, $43, $E0
	db $AD, $B8, $F7, $C0, $F3, $F0, $0F, $DC
	db $46, $73, $C0, $42, $88, $F7, $18, $16
	db $1F, $37, $58, $C0, $15, $8B, $71, $92
	db $3A, $C7, $A9, $7E, $C0, $C1, $8E, $3C
	db $F2, $44, $E1, $ED, $57, $C0, $2F, $BB
	db $D3, $71, $DE, $46, $DB, $03, $C0, $53
	db $EB, $27, $08, $E4, $0B, $54, $8B, $C0
	db $4E, $A4, $4B, $12, $8E, $72, $AB, $16
	db $C0, $F9, $26, $FF, $42, $9D, $7F, $85
	db $38, $C0, $F6, $AB, $22, $E0, $31, $E2
	db $2F, $01, $B0, $DC, $11, $01, $20, $20
	db $24, $1E, $35, $B0, $FD, $33, $CD, $5F
	db $83, $7D, $D1, $F3, $B0, $62, $EE, $14
	db $1E, $44, $A9, $20, $A0, $B0, $3E, $D3
	db $1E, $12, $FD, $F2, $1F, $25, $B0, $1B
	db $E1, $E0, $40, $CE, $10, $00, $FE, $A0
	db $DE, $FF, $EF, $0E, $02, $EB, $02, $F1
	db $B0, $1E, $DF, $21, $F4, $0D, $10, $13
	db $01, $94, $9D, $FD, $71, $41, $94, $23
	db $5C, $B1, $B0, $12, $0F, $34, $EC, $01
	db $EE, $01, $0F, $B0, $DE, $45, $0E, $FE
	db $04, $3F, $03, $1E, $A0, $07, $3B, $02
	db $0D, $20, $B2, $3B, $AD, $B0, $11, $01
	db $1F, $CC, $12, $23, $0D, $C0, $B0, $2F
	db $E3, $4E, $B1, $3E, $E2, $30, $FF, $A0
	db $D0, $FC, $23, $BD, $3D, $E5, $1F, $32
	db $A0, $14, $0C, $E1, $DB, $F1, $01, $30
	db $FE, $94, $B1, $32, $33, $0F, $0C, $06
	db $FD, $02, $A0, $02, $32, $00, $FE, $F2
	db $0E, $E2, $4F, $A0, $AE, $32, $D1, $72
	db $9D, $42, $26, $3D, $A0, $E0, $15, $6F
	db $D0, $FE, $03, $41, $DE, $A0, $FE, $02
	db $01, $FE, $EF, $37, $3E, $11, $91, $DE
	db $42, $E1, $2F, $14, $0E, $0C, $8F

DATA_EEFFDF:
	db $00, $00, $37, $00, $C0, $DC, $51, $00
	db $E7, $D4, $BF, $A1, $AA, $B8, $E5, $2E
	db $2E, $59, $0F, $31, $C4, $B1, $A8, $A4
	db $32, $11, $05, $A6, $A2, $1F, $FD, $A4
	db $FC
