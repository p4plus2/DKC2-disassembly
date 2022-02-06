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
	dl null_song_data
	dl null_sample_set
	dl island_map_song_data
	dl island_map_sample_set
	dl main_theme_song_data
	dl main_theme_sample_set
	dl swamp_song_data
	dl swamp_sample_set
	dl swanky_song_data
	dl swanky_sample_set
	dl forest_song_data
	dl forest_sample_set
	dl ship_deck_song_data
	dl ship_deck_sample_set
	dl mine_song_data
	dl mine_sample_set
	dl funky_song_data
	dl funky_sample_set
	dl brambles_song_data
	dl brambles_sample_set
	dl klubba_song_data
	dl klubba_sample_set
	dl wasp_hive_song_data
	dl wasp_hive_sample_set
	dl wrinkly_song_data
	dl wrinkly_sample_set
	dl lava_song_data
	dl lava_sample_set
	dl roller_coaster_song_data
	dl roller_coaster_sample_set
	dl bonus_song_data
	dl bonus_sample_set
	dl ship_hold_song_data
	dl ship_hold_sample_set
	dl fanfare_song_data
	dl fanfare_sample_set
	dl ship_deck_2_song_data
	dl ship_deck_2_sample_set
	dl rescue_kong_song_data
	dl rescue_kong_sample_set
	dl game_over_song_data
	dl game_over_sample_set
	dl big_boss_song_data
	dl big_boss_sample_set
	dl castle_song_data
	dl castle_sample_set
	dl haunted_song_data
	dl haunted_sample_set
	dl file_select_song_data
	dl file_select_sample_set
	dl cranky_song_data
	dl cranky_sample_set
	dl ice_song_data
	dl ice_sample_set
	dl jungle_song_data
	dl jungle_sample_set
	dl lost_world_song_data
	dl lost_world_sample_set
	dl rigging_song_data
	dl rigging_sample_set
	dl credits_song_data
	dl credits_sample_set
	dl k_rool_song_data
	dl k_rool_sample_set
	dl bonus_song_data
	dl bonus_sample_set_2
	dl big_boss_song_data
	dl big_boss_sample_set_2
	dl bonus_song_data
	dl bonus_sample_set
	dl bonus_song_data
	dl bonus_sample_set_3
	dl secret_ending_song_data
	dl secret_ending_sample_set
	dl bonus_song_data
	dl bonus_sample_set_4
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

null_sample_set:
	db $94, $00, $15, $00, $AB, $00, $C4, $00
	db $CD, $00, $D3, $00, $0D, $00, $0E, $00
	db $0B, $00, $9A, $00, $0F, $00, $10, $00
	db $2B, $00, $D8, $00, $BC, $00, $A1, $00
	db $9F, $00, $C6, $00, $9D, $00, $CC, $00
	db $FF, $FF

island_map_sample_set:
	db $1D, $00, $1C, $00, $A2, $00, $A3, $00
	db $A4, $00, $14, $00, $9A, $00, $94, $00
	db $10, $00, $8F, $00, $FF, $FF

main_theme_sample_set:
	db $1E, $00, $1F, $00, $20, $00, $21, $00
	db $22, $00, $23, $00, $24, $00, $A2, $00
	db $A4, $00, $A3, $00, $14, $00, $2B, $00
	db $FF, $FF

swamp_sample_set:
	db $14, $00, $15, $00, $88, $00, $89, $00
	db $17, $00, $26, $00, $27, $00, $1C, $00
	db $25, $00, $29, $00, $22, $00, $2B, $00
	db $28, $00, $2A, $00, $2C, $00, $50, $00
	db $15, $00, $18, $00, $8F, $00, $0E, $00
	db $0B, $00, $9A, $00, $0D, $00, $0F, $00
	db $9F, $00, $C6, $00, $D3, $00, $C4, $00
	db $A1, $00, $D7, $00, $D8, $00, $94, $00
	db $10, $00, $FF, $FF

swanky_sample_set:
	db $14, $00, $8C, $00, $A2, $00, $18, $00
	db $19, $00, $8D, $00, $1B, $00, $8E, $00
	db $2B, $00, $8F, $00, $FF, $FF

forest_sample_set:
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

ship_deck_sample_set:
	db $9E, $00, $A8, $00, $A7, $00, $8F, $00
	db $1E, $00, $13, $00, $A0, $00, $21, $00
	db $22, $00, $24, $00, $94, $00, $9F, $00
	db $0B, $00, $9A, $00, $0D, $00, $9F, $00
	db $C6, $00, $53, $00, $D8, $00, $FF, $FF

mine_sample_set:
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

funky_sample_set:
	db $7A, $00, $18, $00, $7B, $00, $7C, $00
	db $7D, $00, $7E, $00, $7F, $00, $80, $00
	db $81, $00, $82, $00, $83, $00, $84, $00
	db $85, $00, $2B, $00, $8F, $00, $FF, $FF

brambles_sample_set:
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

klubba_sample_set:
	db $A2, $00, $21, $00, $14, $00, $1E, $00
	db $B6, $00, $A4, $00, $A5, $00, $2B, $00
	db $8F, $00, $FF, $FF

wasp_hive_sample_set:
	db $14, $00, $15, $00, $90, $00, $28, $00
	db $8F, $00, $8E, $00, $91, $00, $92, $00
	db $93, $00, $2E, $00, $D5, $00, $B5, $00
	db $1C, $00, $0E, $00, $0D, $00, $0F, $00
	db $C6, $00, $10, $00, $C6, $00, $A1, $00
	db $D7, $00, $9F, $00, $A9, $00, $D8, $00
	db $BC, $00, $FF, $FF

wrinkly_sample_set:
	db $B8, $00, $D6, $00, $C0, $00, $D4, $00
	db $D1, $00, $C5, $00, $88, $00, $89, $00
	db $97, $00, $2B, $00, $8F, $00, $FF, $FF

lava_sample_set:
	db $8D, $00, $19, $00, $18, $00, $D4, $00
	db $A0, $00, $14, $00, $8D, $00, $AF, $00
	db $8E, $00, $21, $00, $39, $00, $3B, $00
	db $3D, $00, $3F, $00, $41, $00, $45, $00
	db $48, $00, $4A, $00, $4C, $00, $4E, $00
	db $8F, $00, $A9, $00, $AA, $00, $0E, $00
	db $0D, $00, $0B, $00, $9A, $00, $0F, $00
	db $C6, $00, $10, $00, $D7, $00, $9F, $00
	db $FF, $FF

roller_coaster_sample_set:
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

bonus_sample_set:
	db $B5, $00, $B6, $00, $B7, $00, $B3, $00
	db $B8, $00, $33, $00, $8D, $00, $36, $00
	db $8D, $00, $A2, $00, $19, $00, $36, $00
	db $2B, $00, $0D, $00, $0B, $00, $9A, $00
	db $C6, $00, $0F, $00, $10, $00, $53, $00
	db $0E, $00, $15, $00, $A1, $00, $BC, $00
	db $8F, $00, $9F, $00, $D8, $00, $FF, $FF

ship_hold_sample_set:
	db $15, $00, $14, $00, $1D, $00, $24, $00
	db $1E, $00, $1C, $00, $A6, $00, $37, $00
	db $39, $00, $3B, $00, $3D, $00, $3F, $00
	db $41, $00, $43, $00, $45, $00, $47, $00
	db $4F, $00, $18, $00, $2E, $00, $8F, $00
	db $0B, $00, $9A, $00, $0E, $00, $0D, $00
	db $53, $00, $CD, $00, $99, $00, $0F, $00
	db $10, $00, $9B, $00, $9F, $00, $BC, $00
	db $50, $00, $DA, $00, $FF, $FF

fanfare_sample_set:
	db $14, $00, $BE, $00, $A2, $00, $A4, $00
	db $B5, $00, $A0, $00, $2B, $00, $8F, $00
	db $FF, $FF

ship_deck_2_sample_set:
	db $14, $00, $8E, $00, $A5, $00, $18, $00
	db $21, $00, $34, $00, $1B, $00, $33, $00
	db $36, $00, $8D, $00, $2E, $00, $24, $00
	db $8F, $00, $94, $00, $9F, $00, $0B, $00
	db $9A, $00, $0D, $00, $9F, $00, $C6, $00
	db $53, $00, $FF, $FF

rescue_kong_sample_set:
	db $1D, $00, $14, $00, $AF, $00, $B5, $00
	db $1C, $00, $A5, $00, $33, $00, $BC, $00
	db $FF, $FF

game_over_sample_set:
	db $8D, $00, $24, $00, $18, $00, $14, $00
	db $33, $00, $2B, $00, $8F, $00, $FF, $FF

big_boss_sample_set:
	db $14, $00, $A5, $00, $A2, $00, $21, $00
	db $22, $00, $23, $00, $1D, $00, $24, $00
	db $A3, $00, $A4, $00, $1E, $00, $8F, $00
	db $2E, $00, $2B, $00, $0D, $00, $AB, $00
	db $A1, $00, $C4, $00, $BC, $00, $2B, $00
	db $D7, $00, $86, $00, $9A, $00, $94, $00
	db $FF, $FF

castle_sample_set:
	db $AF, $00, $1D, $00, $A2, $00, $A4, $00
	db $14, $00, $B0, $00, $24, $00, $B1, $00
	db $22, $00, $AC, $00, $8F, $00, $2E, $00
	db $9F, $00, $C6, $00, $0B, $00, $9A, $00
	db $0D, $00, $C4, $00, $A1, $00, $BC, $00
	db $0F, $00, $10, $00, $D7, $00, $53, $00
	db $0E, $00, $D8, $00, $A9, $00, $FF, $FF

haunted_sample_set:
	db $14, $00, $B8, $00, $BA, $00, $BE, $00
	db $B6, $00, $A2, $00, $B9, $00, $BD, $00
	db $1E, $00, $A4, $00, $3F, $00, $28, $00
	db $BB, $00, $8F, $00, $2E, $00, $C6, $00
	db $CC, $00, $D0, $00, $D1, $00, $D2, $00
	db $C1, $00, $C2, $00, $C3, $00, $8E, $00
	db $FF, $FF

file_select_sample_set:
	db $0C, $00, $17, $00, $0D, $00, $19, $00
	db $18, $00, $B7, $00, $28, $00, $87, $00
	db $2B, $00, $8F, $00, $FF, $FF

cranky_sample_set:
	db $B8, $00, $28, $00, $29, $00, $AF, $00
	db $2B, $00, $16, $00, $17, $00, $19, $00
	db $15, $00, $9F, $00, $2B, $00, $8F, $00
	db $FF, $FF

ice_sample_set:
	db $12, $00, $88, $00, $37, $00, $39, $00
	db $3B, $00, $3F, $00, $41, $00, $43, $00
	db $45, $00, $47, $00, $48, $00, $4A, $00
	db $AF, $00, $2C, $00, $C5, $00, $14, $00
	db $C0, $00, $8F, $00, $2E, $00, $0B, $00
	db $9A, $00, $0E, $00, $0F, $00, $10, $00
	db $0D, $00, $9F, $00, $CD, $00, $99, $00
	db $C6, $00, $2B, $00, $53, $00, $50, $00
	db $D8, $00, $DA, $00, $FF, $FF

jungle_sample_set:
	db $C8, $00, $C9, $00, $CA, $00, $0D, $00
	db $31, $00, $29, $00, $CB, $00, $86, $00
	db $C7, $00, $28, $00, $C0, $00, $A6, $00
	db $31, $00, $96, $00, $8F, $00, $0F, $00
	db $10, $00, $0E, $00, $0D, $00, $C6, $00
	db $D7, $00, $0B, $00, $9A, $00, $9F, $00
	db $D8, $00, $53, $00, $B8, $00, $FF, $FF

lost_world_sample_set:
	db $CE, $00, $CF, $00, $14, $00, $1D, $00
	db $21, $00, $A6, $00, $90, $00, $BF, $00
	db $9F, $00, $FF, $FF

rigging_sample_set:
	db $13, $00, $1E, $00, $36, $00, $24, $00
	db $21, $00, $86, $00, $A1, $00, $9C, $00
	db $9D, $00, $14, $00, $8F, $00, $0B, $00
	db $9A, $00, $99, $00, $0F, $00, $10, $00
	db $0E, $00, $0D, $00, $C6, $00, $53, $00
	db $D8, $00, $9F, $00, $DA, $00, $FF, $FF

credits_sample_set:
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

k_rool_sample_set:
	db $CE, $00, $CF, $00, $21, $00, $A2, $00
	db $BE, $00, $2E, $00, $90, $00, $A6, $00
	db $96, $00, $8F, $00, $14, $00, $0D, $00
	db $D9, $00, $9D, $00, $53, $00, $BC, $00
	db $D2, $00, $86, $00, $AD, $00, $88, $00
	db $94, $00, $FF, $FF

bonus_sample_set_2:
	db $B5, $00, $B6, $00, $B7, $00, $B3, $00
	db $B8, $00, $33, $00, $8D, $00, $36, $00
	db $8D, $00, $A2, $00, $19, $00, $36, $00
	db $8F, $00, $0D, $00, $C6, $00, $CC, $00
	db $D0, $00, $D1, $00, $D2, $00, $67, $00
	db $C1, $00, $C2, $00, $C3, $00, $8E, $00
	db $FF, $FF

big_boss_sample_set_2:
	db $14, $00, $A5, $00, $A2, $00, $21, $00
	db $22, $00, $23, $00, $1D, $00, $24, $00
	db $A3, $00, $A4, $00, $1E, $00, $8F, $00
	db $2E, $00, $0D, $00, $D7, $00, $86, $00
	db $BD, $00, $A9, $00, $AA, $00, $2B, $00
	db $C6, $00, $A1, $00, $2F, $00, $D9, $00
	db $BC, $00, $FF, $FF, $FF, $FF

bonus_sample_set_3:
	db $B5, $00, $B6, $00, $B7, $00, $B3, $00
	db $B8, $00, $33, $00, $8D, $00, $36, $00
	db $8D, $00, $A2, $00, $19, $00, $36, $00
	db $0D, $00, $C6, $00, $8F, $00, $50, $00
	db $99, $00, $DA, $00, $FF, $FF

secret_ending_sample_set:
	db $A7, $00, $9D, $00, $D9, $00, $88, $00
	db $D3, $00, $C1, $00, $C2, $00, $C3, $00
	db $FF, $FF

bonus_sample_set_4:
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

null_song_data:
	incbin "data/sound/music/null_song_data.bin"

island_map_song_data:
	incbin "data/sound/music/island_map_song_data.bin"

main_theme_song_data:
	incbin "data/sound/music/main_theme_song_data.bin"

swamp_song_data:
	incbin "data/sound/music/swamp_song_data.bin"

swanky_song_data:
	incbin "data/sound/music/swanky_song_data.bin"

forest_song_data:
	incbin "data/sound/music/forest_song_data.bin"

ship_deck_song_data:
	incbin "data/sound/music/ship_deck_song_data.bin"

mine_song_data:
	incbin "data/sound/music/mine_song_data.bin"

funky_song_data:
	incbin "data/sound/music/funky_song_data.bin"

brambles_song_data:
	incbin "data/sound/music/brambles_song_data.bin"

klubba_song_data:
	incbin "data/sound/music/klubba_song_data.bin"

wasp_hive_song_data:
	incbin "data/sound/music/wasp_hive_song_data.bin"

wrinkly_song_data:
	incbin "data/sound/music/wrinkly_song_data.bin"

lava_song_data:
	incbin "data/sound/music/lava_song_data.bin"

roller_coaster_song_data:
	incbin "data/sound/music/roller_coaster_song_data.bin"

bonus_song_data:
	incbin "data/sound/music/bonus_song_data.bin"

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
