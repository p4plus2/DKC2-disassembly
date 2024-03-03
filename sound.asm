spc_base_engine:

arch spc700
base !spc_base_eng_loc

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
base !spc_sound_eng_loc
DATA_0560:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
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
	MOV A, !bgm_ptr_loc+Y			;$0665   |
	MOV $E5, A				;$0668   |
	MOV A, !bgm_ptr_loc+1+Y			;$066A   |
	MOV $E6, A				;$066D   |
	JMP CODE_0678				;$066F   |

CODE_0672:
	MOV $E6, #!bgm_loc>>8			;$0672   |
	MOV $E5, #!bgm_loc&$00FF		;$0675   |
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
	MOV A, DATA_0F95+X			;$0842   |
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
	MOV A, DATA_0F95+X			;$0870   |
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
	MOV A, DATA_1199+X			;$08B0   |
	MUL YA					;$08B3   |
	MOV $02, Y				;$08B4   |
	MOV $03, #$00				;$08B6   |
	POP Y					;$08B9   |
	MOV A, DATA_119A+X			;$08BA   |
	MUL YA					;$08BD   |
	ADDW YA, $02				;$08BE   |
	MOV $03, Y				;$08C0   |
	LSR $03					;$08C2   |
	ROR A					;$08C4   |
	LSR $03					;$08C5   |
	ROR A					;$08C7   |
	MOV $02, A				;$08C8   |
	MOV A, DATA_119A+X			;$08CA   |
	MOV Y, A				;$08CD   |
	MOV A, DATA_1199+X			;$08CE   |
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
	MOV A, DATA_1199+X			;$08E0   |
	MOV $02, A				;$08E3   |
	MOV A, DATA_119A+X			;$08E5   |
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
	MOV A, DATA_0F95+X			;$097E   |
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
	MOV A, DATA_0F95+X			;$0B26   |
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
	MOV A, DATA_0F95+X			;$0B3D   |
	EOR A, #$FF				;$0B40   |
	AND A, $F3				;$0B42   |
	MOV $F3, A				;$0B44   |
	MOV $F2, #$4D				;$0B46   |
	MOV A, $0294+X				;$0B49   |
	BEQ CODE_0B57				;$0B4C   |
	MOV A, DATA_0F95+X			;$0B4E   |
	OR A, $F3				;$0B51   |
	MOV $F3, A				;$0B53   |
	BRA CODE_0B60				;$0B55   |

CODE_0B57:
	MOV A, DATA_0F95+X			;$0B57   |
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
	MOV A, DATA_0560+X			;$0B8F   |
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
	MOV A, DATA_0F95+X			;$0ECA   |
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
	MOV A, DATA_0F95+X			;$0EE0   |
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
	MOV A, DATA_0F95+X			;$0F27   |
	OR A, $F3				;$0F2A   |
	MOV $F3, A				;$0F2C   |
CODE_0F2E:					;   |
	CALL CODE_0B69				;$0F2E   |
	JMP CODE_0ED6				;$0F31   |

CODE_0F34:					;   |
	POP X					;$0F34   |
	MOV $F2, #$3D				;$0F35   |
	MOV A, DATA_0F95+X			;$0F38   |
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
	dw CODE_0B18				;00: end_sequence
	dw CODE_0B72				;01: set_instrument
	dw CODE_0BB6				;02: set_volume_l_and_r
	dw CODE_0CD7				;03: jump_to_sequence
	dw CODE_0CE6				;04: loop_subsequence
	dw CODE_0D34				;05: return_from_sub
	dw CODE_0D70				;06: set_default_duration
	dw CODE_0D8F				;07: default_duration_off
	dw CODE_0D9B				;08: pitch_slide_up
	dw CODE_0DA2				;09: pitch_slide_down
	dw CODE_0DD6				;0A: pitch_slide_off
	dw CODE_0DEB				;0B: change_tempo
	dw CODE_0DF8				;0C: change_tempo_rel
	dw CODE_0E11				;0D: vibrato
	dw CODE_0E05				;0E: vibrato_off
	dw CODE_0E1A				;0F: vibrato_with_delay
	dw CODE_0E45				;10: set_adsr
	dw !null_pointer			;11: unimplemented command
	dw CODE_0E71				;12: fine_tune
	dw CODE_0E7B				;13: change_instr_pitch
	dw CODE_0E88				;14: change_instr_pitch_rel
	dw CODE_0E97				;15: set_echo
	dw CODE_0EC4				;16: echo_on
	dw CODE_0EDC				;17: echo_off
	dw CODE_0EF6				;18: set_fir
	dw CODE_0F10				;19: dsp_flag
	dw CODE_0F23				;1A: noise_on
	dw CODE_0F34				;1B: noise_off
	dw CODE_0E5A				;1C: set_variable_note_1
	dw CODE_0E64				;1D: set_variable_note_2
	dw CODE_0C83				;1E: set_volume_presets
	dw CODE_0CA0				;1F: echo_delay
	dw CODE_0C02				;20: load_volume_preset_1
	dw CODE_0CFF				;21: play_subsequence 
	dw CODE_0B97				;22: set_voice_parameters
	dw CODE_0BF0				;23: set_vol_single_val
	dw CODE_0C4E				;24: set_master_volume_indirect
	dw !null_pointer			;25: unimplemented command
	dw CODE_0F44				;26: simple_pitch_slide_down
	dw CODE_0F4E				;27: simple_pitch_slide_up
	dw !null_pointer			;28: unimplemented command
	dw !null_pointer			;29: unimplemented command
	dw !null_pointer			;2A: unimplemented command
	dw CODE_0F7C				;2B: long_duration_on
	dw CODE_0F86				;2C: long_duration_off
	dw !null_pointer			;2D: unimplemented command
	dw !null_pointer			;2E: unimplemented command
	dw !null_pointer			;2F: unimplemented command
	dw CODE_0EDC				;30: echo_off (copy)
	dw CODE_0C18				;31: load_volume_preset_2
	dw CODE_0EDC				;32: echo_off (copy)

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
	MOV $F3, #!src_dir_loc>>8		;$1064   |
	MOV Y, #$08				;$1067   |
	MOV $F2, #!src_dir_loc&$00FF		;$1069   |
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
	CMP A, #!dyn_snd_base_id		;$10F8   |
	BPL CODE_1104				;$10FA   |
	SETC					;$10FC   |
	SBC A, !snd_loc				;$10FD   |
	BPL CODE_110D				;$1100   |
	BRA CODE_1111				;$1102   |

CODE_1104:
	SETC					;$1104   |
	SBC A, #!dyn_snd_base_id		;$1105   |
	SETC					;$1107   |
	SBC A, !dyn_snd_loc			;$1108   |
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
	MOV A, DATA_0F95+X			;$111C   |
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
	MOV A, !snd_ptr_loc+Y			;$116C   |
	MOV $44+X, A				;$116F   |
	INC Y					;$1171   |
	MOV A, !snd_ptr_loc+Y			;$1172   |
	MOV $54+X, A				;$1175   |
	BRA CODE_1188				;$1177   |

CODE_1179:
	SETC					;$1179   |
	SBC A, #$C0				;$117A   |
	MOV Y, A				;$117C   |
	MOV A, !dyn_snd_ptr_loc+Y		;$117D   |
	MOV $44+X, A				;$1180   |
	INC Y					;$1182   |
	MOV A, !dyn_snd_ptr_loc+Y		;$1183   |
	MOV $54+X, A				;$1186   |
CODE_1188:					;   |
	MOV A, #$02				;$1188   |
	MOV $34+X, A				;$118A   |
	MOV $F2, #$4D				;$118C   |
	MOV A, DATA_0F95+X			;$118F   |
	EOR A, #$FF				;$1192   |
	AND A, $F3				;$1194   |
	MOV $F3, A				;$1196   |
	RET					;$1198   |

DATA_1199:
	%offset(DATA_119A, 1)
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
	dl brr_sample_EECE62
	dl brr_sample_EECFFC
	dl brr_sample_EED1CC
	dl brr_sample_EED47C
	dl brr_sample_EED63A
	dl brr_sample_EED87E
	dl brr_sample_EEDC73
	dl brr_sample_EEE055
	dl brr_sample_EEE1AF
	dl brr_sample_EEE8CE
	dl brr_sample_EEE9A2
	dl brr_sample_EEEE4B
	dl brr_sample_EEF6B6
	dl brr_sample_EEF8C5
	dl brr_sample_EEFDC8
	dl brr_sample_EEFFDF
	dl brr_sample_EF001A
	dl brr_sample_EF05BE
	dl brr_sample_EF0997
	dl brr_sample_EF120B
	dl brr_sample_EF1EDC
	dl brr_sample_EF288C
	dl brr_sample_EF2F7E
	dl brr_sample_EF3288
	dl brr_sample_EF335C
	dl brr_sample_EF35BC
	dl brr_sample_EF37B0
	dl brr_sample_EF3A10
	dl brr_sample_EF3D5A
	dl brr_sample_EF4512
	dl brr_sample_EF4C79
	dl brr_sample_EF5053
	dl brr_sample_EF5910
	dl brr_sample_EF5927
	dl brr_sample_EF596B
	dl brr_sample_EF5D96
	dl brr_sample_EF63EF
	dl brr_sample_EF66CD
	dl brr_sample_EF66ED
	dl brr_sample_EF6731
	dl brr_sample_EF6748
	dl brr_sample_EF69CC
	dl brr_sample_EF720B
	dl brr_sample_EF72FA
	dl brr_sample_EF7A2B
	dl brr_sample_EF8006
	dl brr_sample_EF818E
	dl brr_sample_EF8880
	dl brr_sample_EF90BF
	dl brr_sample_EF90D6
	dl brr_sample_EF943B
	dl brr_sample_EF9677
	dl brr_sample_EFA228
	dl brr_sample_EFA7E8
	dl brr_sample_EFA81A
	dl brr_sample_EFAC18
	dl brr_sample_EFAC4A
	dl brr_sample_EFAC7C
	dl brr_sample_EFACAE
	dl brr_sample_EFACE0
	dl brr_sample_EFAD12
	dl brr_sample_EFAD44
	dl brr_sample_EFAD76
	dl brr_sample_EFADA8
	dl brr_sample_EFADDA
	dl brr_sample_EFAE0C
	dl brr_sample_EFAE3E
	dl brr_sample_EFAE70
	dl brr_sample_EFAEA2
	dl brr_sample_EFAED4
	dl brr_sample_EFAF06
	dl brr_sample_EFAF38
	dl brr_sample_EFAF6A
	dl brr_sample_EFAF9C
	dl brr_sample_EFAFCE
	dl brr_sample_EFB000
	dl brr_sample_EFB032
	dl brr_sample_EFB064
	dl brr_sample_EFB096
	dl brr_sample_EFB0C8
	dl brr_sample_EFB0FA
	dl brr_sample_EFB11A
	dl brr_sample_EFB13A
	dl brr_sample_EFB15A
	dl brr_sample_EFB17A
	dl brr_sample_EFB19A
	dl brr_sample_EFB1BA
	dl brr_sample_EFB1DA
	dl brr_sample_EFB1FA
	dl brr_sample_EFB21A
	dl brr_sample_EFB23A
	dl brr_sample_EFB26B
	dl brr_sample_EFB29C
	dl brr_sample_EFB2CD
	dl brr_sample_EFB2FE
	dl brr_sample_EFB32F
	dl brr_sample_EFB360
	dl brr_sample_EFB391
	dl brr_sample_EFB3C2
	dl brr_sample_EFB3F3
	dl brr_sample_EFB424
	dl brr_sample_EFB455
	dl brr_sample_EFB486
	dl brr_sample_EFB4B7
	dl brr_sample_EFB4E8
	dl brr_sample_EFB519
	dl brr_sample_EFB54A
	dl brr_sample_EFB57B
	dl brr_sample_EFB5AC
	dl brr_sample_EFB5DD
	dl brr_sample_EFB60E
	dl brr_sample_EFB63F
	dl brr_sample_EFB670
	dl brr_sample_EFB6A1
	dl brr_sample_EFB6D2
	dl brr_sample_EFB703
	dl brr_sample_EFB734
	dl brr_sample_EFB765
	dl brr_sample_EFB796
	dl brr_sample_EFB7C7
	dl brr_sample_EFB7F8
	dl brr_sample_EFB829
	dl brr_sample_EFB85A
	dl brr_sample_EFB912
	dl brr_sample_EFD404
	dl brr_sample_EFDB08
	dl brr_sample_EFE26F
	dl brr_sample_EFE8F5
	dl brr_sample_EFECBD
	dl brr_sample_EFEDF4
	dl brr_sample_EFEEF5
	dl brr_sample_EFF035
	dl brr_sample_EFF11B
	dl brr_sample_EFF894
	dl brr_sample_EFFAFC
	dl brr_sample_EFFECD
	dl brr_sample_F00162
	dl brr_sample_F0062F
	dl brr_sample_F00823
	dl brr_sample_F009FC
	dl brr_sample_F00A1C
	dl brr_sample_F00FAF
	dl brr_sample_F01674
	dl brr_sample_F01B6E
	dl brr_sample_F01BA9
	dl brr_sample_F02667
	dl brr_sample_F02800
	dl brr_sample_F02988
	dl brr_sample_F02C2F
	dl brr_sample_F03A17
	dl brr_sample_F03A5B
	dl brr_sample_F03B1D
	dl brr_sample_F03D2B
	dl brr_sample_F04854
	dl brr_sample_F057E3
	dl brr_sample_F05FFD
	dl brr_sample_F073F1
	dl brr_sample_F08A2D
	dl brr_sample_F09BFB
	dl brr_sample_F0A157
	dl brr_sample_F0A5FF
	dl brr_sample_F0AE2B
	dl brr_sample_F0B2B0
	dl brr_sample_F0B7FA
	dl brr_sample_F0BD45
	dl brr_sample_F0C93E
	dl brr_sample_F0CD45
	dl brr_sample_F0DC8C
	dl brr_sample_F0F65E
	dl brr_sample_F1078A
	dl brr_sample_F10F26
	dl brr_sample_F117C7
	dl brr_sample_F11EEE
	dl brr_sample_F11F0D
	dl brr_sample_F12A9A
	dl brr_sample_F133B1
	dl brr_sample_F139DC
	dl brr_sample_F14B98
	dl brr_sample_F14DA6
	dl brr_sample_F15542
	dl brr_sample_F15C0F
	dl brr_sample_F1663C
	dl brr_sample_F16F1C
	dl brr_sample_F179D9
	dl brr_sample_F18004
	dl brr_sample_F186E4
	dl brr_sample_F192E5
	dl brr_sample_F19304
	dl brr_sample_F19311
	dl brr_sample_F1946B
	dl brr_sample_F1A225
	dl brr_sample_F1A811
	dl brr_sample_F1AD5B
	dl brr_sample_F1B55A
	dl brr_sample_F1B795
	dl brr_sample_F1B9D0
	dl brr_sample_F1BC0B
	dl brr_sample_F1C03F
	dl brr_sample_F1C916
	dl brr_sample_F1CC05
	dl brr_sample_F1CD4E
	dl brr_sample_F1CFF6
	dl brr_sample_F1D190
	dl brr_sample_F1D68A
	dl brr_sample_F1DF7C
	dl brr_sample_F1E973
	dl brr_sample_F1EDA6
	dl brr_sample_F1F188
	dl brr_sample_F1F195
	dl brr_sample_F1F337
	dl brr_sample_F1F92C
	dl brr_sample_F20080
	dl brr_sample_F202BB
	dl brr_sample_F218D4
	dl brr_sample_F21E5D
	dl brr_sample_F22132
	dl brr_sample_F225B6
	dl brr_sample_F22C44
	dl brr_sample_F232D2
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
	%offset(song_sample_maps, 3)
	dl null_song_data, null_sample_map
	dl island_map_song_data, island_map_sample_map
	dl main_theme_song_data, main_theme_sample_map
	dl swamp_song_data, swamp_sample_map
	dl swanky_song_data, swanky_sample_map
	dl forest_song_data, forest_sample_map
	dl ship_deck_song_data, ship_deck_sample_map
	dl mine_song_data, mine_sample_map
	dl funky_song_data, funky_sample_map
	dl brambles_song_data, brambles_sample_map
	dl klubba_song_data, klubba_sample_map
	dl wasp_hive_song_data, wasp_hive_sample_map
	dl wrinkly_song_data, wrinkly_sample_map
	dl lava_song_data, lava_sample_map
	dl roller_coaster_song_data, roller_coaster_sample_map
	dl bonus_song_data, bonus_sample_map
	dl ship_hold_song_data, ship_hold_sample_map
	dl fanfare_song_data, fanfare_sample_map
	dl ship_deck_2_song_data, ship_deck_2_sample_map
	dl rescue_kong_song_data, rescue_kong_sample_map
	dl game_over_song_data, game_over_sample_map
	dl big_boss_song_data, big_boss_sample_map
	dl castle_song_data, castle_sample_map
	dl haunted_song_data, haunted_sample_map
	dl file_select_song_data, file_select_sample_map
	dl cranky_song_data, cranky_sample_map
	dl ice_song_data, ice_sample_map
	dl jungle_song_data, jungle_sample_map
	dl lost_world_song_data, lost_world_sample_map
	dl rigging_song_data, rigging_sample_map
	dl credits_song_data, credits_sample_map
	dl k_rool_song_data, k_rool_sample_map
	dl bonus_song_data, bonus_sample_map_2
	dl big_boss_song_data, big_boss_sample_map_2
	dl bonus_song_data, bonus_sample_map
	dl bonus_song_data, bonus_sample_map_3
	dl secret_ending_song_data, secret_ending_sample_map
	dl bonus_song_data, bonus_sample_map_4
	dl DATA_F2E728, DATA_EE1935
	dl DATA_F2E72C, DATA_EE1937

	db $00, $00, $00

DATA_EE1179:
	db $00, $00

DATA_EE117B:
	%offset(DATA_EE117D, 2)
	dl dummy_sfx_data				;00
	dl dummy_sfx_data				;01
	dl dummy_sfx_data				;02
	dl swamp_forest_mine_brambles_hive_sfx_data	;03
	dl swamp_forest_mine_brambles_hive_sfx_data	;04
	dl swamp_forest_mine_brambles_hive_sfx_data	;05
	dl ship_ice_ending_sfx_data			;06
	dl swamp_forest_mine_brambles_hive_sfx_data	;07
	dl dummy_sfx_data				;08
	dl swamp_forest_mine_brambles_hive_sfx_data	;09
	dl boss_1_sfx_data				;0A
	dl swamp_forest_mine_brambles_hive_sfx_data	;0B
	dl dummy_sfx_data				;0C
	dl lava_castle_boss_2_sfx_data			;0D
	dl roller_coaster_sfx_data			;0E
	dl swamp_forest_mine_brambles_hive_sfx_data	;0F
	dl ship_ice_ending_sfx_data			;10
	dl dummy_sfx_data				;11
	dl ship_ice_ending_sfx_data			;12
	dl boss_1_sfx_data				;13
	dl dummy_sfx_data				;14
	dl boss_1_sfx_data				;15
	dl lava_castle_boss_2_sfx_data			;16
	dl roller_coaster_sfx_data			;17
	dl dummy_sfx_data				;18
	dl dummy_sfx_data				;19
	dl ship_ice_ending_sfx_data			;1A
	dl jungle_sfx_data				;1B
	dl dummy_sfx_data				;1C
	dl ship_ice_ending_sfx_data			;1D
	dl ship_ice_ending_sfx_data			;1E
	dl boss_1_sfx_data				;1F
	dl roller_coaster_sfx_data			;20
	dl lava_castle_boss_2_sfx_data			;21
	dl lava_castle_boss_2_sfx_data			;22
	dl ship_ice_ending_sfx_data			;23
	dl ship_ice_ending_sfx_data			;24
	dl ship_ice_ending_sfx_data			;25
	dl dummy_sfx_data				;26
	dl dummy_sfx_data				;27
	dl dummy_sfx_data				;28

DATA_EE11F6:
	db $00, $00, $00


global_sample_map:
	dw $0001
	dw $0002
	dw $0003
	dw $0004
	dw $0006
	dw $0008
	dw $0007
	dw $0005
	dw $0000
	dw $00A5
	dw $000C
	dw $0009
	dw $0011
	dw $000A
	dw $008B
	dw $0043
	dw $0047
	dw $0049
	dw $004B
	dw $004D
	dw $FFFF

null_sample_map:
	dw $0094
	dw $0015
	dw $00AB
	dw $00C4
	dw $00CD
	dw $00D3
	dw $000D
	dw $000E
	dw $000B
	dw $009A
	dw $000F
	dw $0010
	dw $002B
	dw $00D8
	dw $00BC
	dw $00A1
	dw $009F
	dw $00C6
	dw $009D
	dw $00CC
	dw $FFFF

island_map_sample_map:
	dw $001D
	dw $001C
	dw $00A2
	dw $00A3
	dw $00A4
	dw $0014
	dw $009A
	dw $0094
	dw $0010
	dw $008F
	dw $FFFF

main_theme_sample_map:
	dw $001E
	dw $001F
	dw $0020
	dw $0021
	dw $0022
	dw $0023
	dw $0024
	dw $00A2
	dw $00A4
	dw $00A3
	dw $0014
	dw $002B
	dw $FFFF

swamp_sample_map:
	dw $0014
	dw $0015
	dw $0088
	dw $0089
	dw $0017
	dw $0026
	dw $0027
	dw $001C
	dw $0025
	dw $0029
	dw $0022
	dw $002B
	dw $0028
	dw $002A
	dw $002C
	dw $0050
	dw $0015
	dw $0018
	dw $008F
	dw $000E
	dw $000B
	dw $009A
	dw $000D
	dw $000F
	dw $009F
	dw $00C6
	dw $00D3
	dw $00C4
	dw $00A1
	dw $00D7
	dw $00D8
	dw $0094
	dw $0010
	dw $FFFF

swanky_sample_map:
	dw $0014
	dw $008C
	dw $00A2
	dw $0018
	dw $0019
	dw $008D
	dw $001B
	dw $008E
	dw $002B
	dw $008F
	dw $FFFF

forest_sample_map:
	dw $0037
	dw $0039
	dw $003B
	dw $003D
	dw $003F
	dw $0041
	dw $0045
	dw $0048
	dw $004A
	dw $004C
	dw $004E
	dw $004F
	dw $002D
	dw $008A
	dw $0014
	dw $008D
	dw $0032
	dw $00A3
	dw $002F
	dw $002E
	dw $0021
	dw $0029
	dw $0015
	dw $008F
	dw $0050
	dw $0051
	dw $0052
	dw $0053
	dw $0054
	dw $0055
	dw $0056
	dw $0057
	dw $0058
	dw $0059
	dw $00C4
	dw $00A1
	dw $000B
	dw $009A
	dw $000E
	dw $00C6
	dw $000F
	dw $0010
	dw $00D3
	dw $009F
	dw $000D
	dw $00D7
	dw $009D
	dw $FFFF

ship_deck_sample_map:
	dw $009E
	dw $00A8
	dw $00A7
	dw $008F
	dw $001E
	dw $0013
	dw $00A0
	dw $0021
	dw $0022
	dw $0024
	dw $0094
	dw $009F
	dw $000B
	dw $009A
	dw $000D
	dw $009F
	dw $00C6
	dw $0053
	dw $00D8
	dw $FFFF

mine_sample_map:
	dw $00B3
	dw $002F
	dw $00B2
	dw $00AD
	dw $00AE
	dw $008B
	dw $0018
	dw $0014
	dw $00B4
	dw $001A
	dw $002B
	dw $0039
	dw $003B
	dw $003D
	dw $003F
	dw $0041
	dw $0043
	dw $0045
	dw $0047
	dw $0048
	dw $0049
	dw $004A
	dw $004B
	dw $004C
	dw $004D
	dw $004E
	dw $004F
	dw $008F
	dw $009F
	dw $000F
	dw $0010
	dw $00A1
	dw $00BC
	dw $00C6
	dw $000E
	dw $00C4
	dw $00D7
	dw $000B
	dw $009A
	dw $000D
	dw $009D
	dw $FFFF

funky_sample_map:
	dw $007A
	dw $0018
	dw $007B
	dw $007C
	dw $007D
	dw $007E
	dw $007F
	dw $0080
	dw $0081
	dw $0082
	dw $0083
	dw $0084
	dw $0085
	dw $002B
	dw $008F
	dw $FFFF

brambles_sample_map:
	dw $0015
	dw $0014
	dw $0018
	dw $002E
	dw $0034
	dw $008E
	dw $001B
	dw $0033
	dw $0035
	dw $00B3
	dw $008F
	dw $0028
	dw $00A6
	dw $0050
	dw $0051
	dw $0052
	dw $0053
	dw $0054
	dw $0055
	dw $0056
	dw $0057
	dw $0058
	dw $0059
	dw $0037
	dw $0039
	dw $003B
	dw $003D
	dw $003F
	dw $0041
	dw $0045
	dw $0048
	dw $004A
	dw $004C
	dw $004E
	dw $004F
	dw $000D
	dw $00A1
	dw $00BC
	dw $00C6
	dw $000E
	dw $000B
	dw $009A
	dw $00D3
	dw $00C4
	dw $009D
	dw $00D8
	dw $009F
	dw $0010
	dw $000F
	dw $FFFF

klubba_sample_map:
	dw $00A2
	dw $0021
	dw $0014
	dw $001E
	dw $00B6
	dw $00A4
	dw $00A5
	dw $002B
	dw $008F
	dw $FFFF

wasp_hive_sample_map:
	dw $0014
	dw $0015
	dw $0090
	dw $0028
	dw $008F
	dw $008E
	dw $0091
	dw $0092
	dw $0093
	dw $002E
	dw $00D5
	dw $00B5
	dw $001C
	dw $000E
	dw $000D
	dw $000F
	dw $00C6
	dw $0010
	dw $00C6
	dw $00A1
	dw $00D7
	dw $009F
	dw $00A9
	dw $00D8
	dw $00BC
	dw $FFFF

wrinkly_sample_map:
	dw $00B8
	dw $00D6
	dw $00C0
	dw $00D4
	dw $00D1
	dw $00C5
	dw $0088
	dw $0089
	dw $0097
	dw $002B
	dw $008F
	dw $FFFF

lava_sample_map:
	dw $008D
	dw $0019
	dw $0018
	dw $00D4
	dw $00A0
	dw $0014
	dw $008D
	dw $00AF
	dw $008E
	dw $0021
	dw $0039
	dw $003B
	dw $003D
	dw $003F
	dw $0041
	dw $0045
	dw $0048
	dw $004A
	dw $004C
	dw $004E
	dw $008F
	dw $00A9
	dw $00AA
	dw $000E
	dw $000D
	dw $000B
	dw $009A
	dw $000F
	dw $00C6
	dw $0010
	dw $00D7
	dw $009F
	dw $FFFF

roller_coaster_sample_map:
	dw $0014
	dw $005A
	dw $005B
	dw $005C
	dw $005D
	dw $005E
	dw $005F
	dw $0060
	dw $0061
	dw $0062
	dw $0063
	dw $0064
	dw $0065
	dw $0066
	dw $0067
	dw $0068
	dw $0069
	dw $006A
	dw $006B
	dw $006C
	dw $006D
	dw $006E
	dw $006F
	dw $0070
	dw $0071
	dw $0072
	dw $0073
	dw $0074
	dw $0075
	dw $0076
	dw $0077
	dw $0078
	dw $0079
	dw $0098
	dw $0095
	dw $0096
	dw $0097
	dw $0088
	dw $0089
	dw $0085
	dw $003D
	dw $003F
	dw $0041
	dw $0045
	dw $0048
	dw $004A
	dw $004F
	dw $008F
	dw $00C6
	dw $00CC
	dw $00D0
	dw $00D1
	dw $00D2
	dw $FFFF

bonus_sample_map:
	dw $00B5
	dw $00B6
	dw $00B7
	dw $00B3
	dw $00B8
	dw $0033
	dw $008D
	dw $0036
	dw $008D
	dw $00A2
	dw $0019
	dw $0036
	dw $002B
	dw $000D
	dw $000B
	dw $009A
	dw $00C6
	dw $000F
	dw $0010
	dw $0053
	dw $000E
	dw $0015
	dw $00A1
	dw $00BC
	dw $008F
	dw $009F
	dw $00D8
	dw $FFFF

ship_hold_sample_map:
	dw $0015
	dw $0014
	dw $001D
	dw $0024
	dw $001E
	dw $001C
	dw $00A6
	dw $0037
	dw $0039
	dw $003B
	dw $003D
	dw $003F
	dw $0041
	dw $0043
	dw $0045
	dw $0047
	dw $004F
	dw $0018
	dw $002E
	dw $008F
	dw $000B
	dw $009A
	dw $000E
	dw $000D
	dw $0053
	dw $00CD
	dw $0099
	dw $000F
	dw $0010
	dw $009B
	dw $009F
	dw $00BC
	dw $0050
	dw $00DA
	dw $FFFF

fanfare_sample_map:
	dw $0014
	dw $00BE
	dw $00A2
	dw $00A4
	dw $00B5
	dw $00A0
	dw $002B
	dw $008F
	dw $FFFF

ship_deck_2_sample_map:
	dw $0014
	dw $008E
	dw $00A5
	dw $0018
	dw $0021
	dw $0034
	dw $001B
	dw $0033
	dw $0036
	dw $008D
	dw $002E
	dw $0024
	dw $008F
	dw $0094
	dw $009F
	dw $000B
	dw $009A
	dw $000D
	dw $009F
	dw $00C6
	dw $0053
	dw $FFFF

rescue_kong_sample_map:
	dw $001D
	dw $0014
	dw $00AF
	dw $00B5
	dw $001C
	dw $00A5
	dw $0033
	dw $00BC
	dw $FFFF

game_over_sample_map:
	dw $008D
	dw $0024
	dw $0018
	dw $0014
	dw $0033
	dw $002B
	dw $008F
	dw $FFFF

big_boss_sample_map:
	dw $0014
	dw $00A5
	dw $00A2
	dw $0021
	dw $0022
	dw $0023
	dw $001D
	dw $0024
	dw $00A3
	dw $00A4
	dw $001E
	dw $008F
	dw $002E
	dw $002B
	dw $000D
	dw $00AB
	dw $00A1
	dw $00C4
	dw $00BC
	dw $002B
	dw $00D7
	dw $0086
	dw $009A
	dw $0094
	dw $FFFF

castle_sample_map:
	dw $00AF
	dw $001D
	dw $00A2
	dw $00A4
	dw $0014
	dw $00B0
	dw $0024
	dw $00B1
	dw $0022
	dw $00AC
	dw $008F
	dw $002E
	dw $009F
	dw $00C6
	dw $000B
	dw $009A
	dw $000D
	dw $00C4
	dw $00A1
	dw $00BC
	dw $000F
	dw $0010
	dw $00D7
	dw $0053
	dw $000E
	dw $00D8
	dw $00A9
	dw $FFFF

haunted_sample_map:
	dw $0014
	dw $00B8
	dw $00BA
	dw $00BE
	dw $00B6
	dw $00A2
	dw $00B9
	dw $00BD
	dw $001E
	dw $00A4
	dw $003F
	dw $0028
	dw $00BB
	dw $008F
	dw $002E
	dw $00C6
	dw $00CC
	dw $00D0
	dw $00D1
	dw $00D2
	dw $00C1
	dw $00C2
	dw $00C3
	dw $008E
	dw $FFFF

file_select_sample_map:
	dw $000C
	dw $0017
	dw $000D
	dw $0019
	dw $0018
	dw $00B7
	dw $0028
	dw $0087
	dw $002B
	dw $008F
	dw $FFFF

cranky_sample_map:
	dw $00B8
	dw $0028
	dw $0029
	dw $00AF
	dw $002B
	dw $0016
	dw $0017
	dw $0019
	dw $0015
	dw $009F
	dw $002B
	dw $008F
	dw $FFFF

ice_sample_map:
	dw $0012
	dw $0088
	dw $0037
	dw $0039
	dw $003B
	dw $003F
	dw $0041
	dw $0043
	dw $0045
	dw $0047
	dw $0048
	dw $004A
	dw $00AF
	dw $002C
	dw $00C5
	dw $0014
	dw $00C0
	dw $008F
	dw $002E
	dw $000B
	dw $009A
	dw $000E
	dw $000F
	dw $0010
	dw $000D
	dw $009F
	dw $00CD
	dw $0099
	dw $00C6
	dw $002B
	dw $0053
	dw $0050
	dw $00D8
	dw $00DA
	dw $FFFF

jungle_sample_map:
	dw $00C8
	dw $00C9
	dw $00CA
	dw $000D
	dw $0031
	dw $0029
	dw $00CB
	dw $0086
	dw $00C7
	dw $0028
	dw $00C0
	dw $00A6
	dw $0031
	dw $0096
	dw $008F
	dw $000F
	dw $0010
	dw $000E
	dw $000D
	dw $00C6
	dw $00D7
	dw $000B
	dw $009A
	dw $009F
	dw $00D8
	dw $0053
	dw $00B8
	dw $FFFF

lost_world_sample_map:
	dw $00CE
	dw $00CF
	dw $0014
	dw $001D
	dw $0021
	dw $00A6
	dw $0090
	dw $00BF
	dw $009F
	dw $FFFF

rigging_sample_map:
	dw $0013
	dw $001E
	dw $0036
	dw $0024
	dw $0021
	dw $0086
	dw $00A1
	dw $009C
	dw $009D
	dw $0014
	dw $008F
	dw $000B
	dw $009A
	dw $0099
	dw $000F
	dw $0010
	dw $000E
	dw $000D
	dw $00C6
	dw $0053
	dw $00D8
	dw $009F
	dw $00DA
	dw $FFFF

credits_sample_map:
	dw $00CE
	dw $00CF
	dw $00C0
	dw $00A6
	dw $0090
	dw $00B8
	dw $002E
	dw $0034
	dw $008E
	dw $00B6
	dw $005A
	dw $005B
	dw $005C
	dw $005D
	dw $005E
	dw $005F
	dw $0060
	dw $0061
	dw $0062
	dw $0063
	dw $0064
	dw $0065
	dw $0066
	dw $0067
	dw $0068
	dw $0069
	dw $006A
	dw $006B
	dw $006C
	dw $006D
	dw $006E
	dw $006F
	dw $0070
	dw $0071
	dw $0072
	dw $0073
	dw $0074
	dw $0075
	dw $0076
	dw $0077
	dw $0078
	dw $0079
	dw $0037
	dw $0039
	dw $003B
	dw $003D
	dw $003F
	dw $0041
	dw $0045
	dw $0048
	dw $004A
	dw $004C
	dw $004E
	dw $004F
	dw $002B
	dw $000D
	dw $0050
	dw $0053
	dw $00A1
	dw $00C6
	dw $009F
	dw $000F
	dw $0010
	dw $00CD
	dw $00D7
	dw $0099
	dw $FFFF

k_rool_sample_map:
	dw $00CE
	dw $00CF
	dw $0021
	dw $00A2
	dw $00BE
	dw $002E
	dw $0090
	dw $00A6
	dw $0096
	dw $008F
	dw $0014
	dw $000D
	dw $00D9
	dw $009D
	dw $0053
	dw $00BC
	dw $00D2
	dw $0086
	dw $00AD
	dw $0088
	dw $0094
	dw $FFFF

bonus_sample_map_2:
	dw $00B5
	dw $00B6
	dw $00B7
	dw $00B3
	dw $00B8
	dw $0033
	dw $008D
	dw $0036
	dw $008D
	dw $00A2
	dw $0019
	dw $0036
	dw $008F
	dw $000D
	dw $00C6
	dw $00CC
	dw $00D0
	dw $00D1
	dw $00D2
	dw $0067
	dw $00C1
	dw $00C2
	dw $00C3
	dw $008E
	dw $FFFF

big_boss_sample_map_2:
	dw $0014
	dw $00A5
	dw $00A2
	dw $0021
	dw $0022
	dw $0023
	dw $001D
	dw $0024
	dw $00A3
	dw $00A4
	dw $001E
	dw $008F
	dw $002E
	dw $000D
	dw $00D7
	dw $0086
	dw $00BD
	dw $00A9
	dw $00AA
	dw $002B
	dw $00C6
	dw $00A1
	dw $002F
	dw $00D9
	dw $00BC
	dw $FFFF
	dw $FFFF

bonus_sample_map_3:
	dw $00B5
	dw $00B6
	dw $00B7
	dw $00B3
	dw $00B8
	dw $0033
	dw $008D
	dw $0036
	dw $008D
	dw $00A2
	dw $0019
	dw $0036
	dw $000D
	dw $00C6
	dw $008F
	dw $0050
	dw $0099
	dw $00DA
	dw $FFFF

secret_ending_sample_map:
	dw $00A7
	dw $009D
	dw $00D9
	dw $0088
	dw $00D3
	dw $00C1
	dw $00C2
	dw $00C3
	dw $FFFF

bonus_sample_map_4:
	dw $00B5
	dw $00B6
	dw $00B7
	dw $00B3
	dw $00B8
	dw $0033
	dw $008D
	dw $0036
	dw $008D
	dw $00A2
	dw $0019
	dw $0036
	dw $000D
	dw $000B
	dw $009A
	dw $00C6
	dw $000F
	dw $0010
	dw $0053
	dw $000E
	dw $008F
	dw $009F
	dw $00D8
	dw $0094
	dw $FFFF

DATA_EE1935:
	dw $FFFF

DATA_EE1937:
	dw $FFFF

	incsrc "data/sound/music/null_song_data.asm"
	incsrc "data/sound/music/island_map_song_data.asm"
	incsrc "data/sound/music/main_theme_song_data.asm"
	incsrc "data/sound/music/swamp_song_data.asm"
	incsrc "data/sound/music/swanky_song_data.asm"
	incsrc "data/sound/music/forest_song_data.asm"
	incsrc "data/sound/music/ship_deck_song_data.asm"
	incsrc "data/sound/music/mine_song_data.asm"
	incsrc "data/sound/music/funky_song_data.asm"
	incsrc "data/sound/music/brambles_song_data.asm"
	incsrc "data/sound/music/klubba_song_data.asm"
	incsrc "data/sound/music/wasp_hive_song_data.asm"
	incsrc "data/sound/music/wrinkly_song_data.asm"
	incsrc "data/sound/music/lava_song_data.asm"
	incsrc "data/sound/music/roller_coaster_song_data.asm"
	incsrc "data/sound/music/bonus_song_data.asm"

check bankcross off
;$EECE62
brr_sample_EECE62:
	dw $0000
	dw datasize(brr_sample_EECE62)-4
	incbin "data/sound/samples/sample_EECE62.brr"

;$EECFFC
brr_sample_EECFFC:
	dw $0000
	dw datasize(brr_sample_EECFFC)-4
	incbin "data/sound/samples/sample_EECFFC.brr"

;$EED1CC
brr_sample_EED1CC:
	dw $0000
	dw datasize(brr_sample_EED1CC)-4
	incbin "data/sound/samples/sample_EED1CC.brr"

;$EED47C
brr_sample_EED47C:
	dw $0000
	dw datasize(brr_sample_EED47C)-4
	incbin "data/sound/samples/sample_EED47C.brr"

;$EED63A
brr_sample_EED63A:
	dw $0000
	dw datasize(brr_sample_EED63A)-4
	incbin "data/sound/samples/sample_EED63A.brr"

;$EED87E
brr_sample_EED87E:
	dw $0000
	dw datasize(brr_sample_EED87E)-4
	incbin "data/sound/samples/sample_EED87E.brr"

;$EEDC73
brr_sample_EEDC73:
	dw $0000
	dw datasize(brr_sample_EEDC73)-4
	incbin "data/sound/samples/sample_EEDC73.brr"

;$EEE055
brr_sample_EEE055:
	dw $0000
	dw datasize(brr_sample_EEE055)-4
	incbin "data/sound/samples/sample_EEE055.brr"

;$EEE1AF
brr_sample_EEE1AF:
	dw $0000
	dw datasize(brr_sample_EEE1AF)-4
	incbin "data/sound/samples/sample_EEE1AF.brr"

;$EEE8CE
brr_sample_EEE8CE:
	dw $0000
	dw datasize(brr_sample_EEE8CE)-4
	incbin "data/sound/samples/sample_EEE8CE.brr"

;$EEE9A2
brr_sample_EEE9A2:
	dw $0000
	dw datasize(brr_sample_EEE9A2)-4
	incbin "data/sound/samples/sample_EEE9A2.brr"

;$EEEE4B
brr_sample_EEEE4B:
	dw $0000
	dw datasize(brr_sample_EEEE4B)-4
	incbin "data/sound/samples/sample_EEEE4B.brr"

;$EEF6B6
brr_sample_EEF6B6:
	dw $0000
	dw datasize(brr_sample_EEF6B6)-4
	incbin "data/sound/samples/sample_EEF6B6.brr"

;$EEF8C5
brr_sample_EEF8C5:
	dw $0000
	dw datasize(brr_sample_EEF8C5)-4
	incbin "data/sound/samples/sample_EEF8C5.brr"

;$EEFDC8
brr_sample_EEFDC8:
	dw $0000
	dw datasize(brr_sample_EEFDC8)-4
	incbin "data/sound/samples/sample_EEFDC8.brr"

;$EEFFDF
brr_sample_EEFFDF:
	dw $0000
	dw datasize(brr_sample_EEFFDF)-4
	incbin "data/sound/samples/sample_EEFFDF.brr"

;$EF001A
brr_sample_EF001A:
	dw $0000
	dw datasize(brr_sample_EF001A)-4
	incbin "data/sound/samples/sample_EF001A.brr"

;$EF05BE
brr_sample_EF05BE:
	dw $0000
	dw datasize(brr_sample_EF05BE)-4
	incbin "data/sound/samples/sample_EF05BE.brr"

;$EF0997
brr_sample_EF0997:
	dw $076B
	dw datasize(brr_sample_EF0997)-4
	incbin "data/sound/samples/sample_EF0997.brr"

;$EF120B
brr_sample_EF120B:
	dw $0870
	dw datasize(brr_sample_EF120B)-4
	incbin "data/sound/samples/sample_EF120B.brr"

;$EF1EDC
brr_sample_EF1EDC:
	dw $0000
	dw datasize(brr_sample_EF1EDC)-4
	incbin "data/sound/samples/sample_EF1EDC.brr"

;$EF288C
brr_sample_EF288C:
	dw $0000
	dw datasize(brr_sample_EF288C)-4
	incbin "data/sound/samples/sample_EF288C.brr"

;$EF2F7E
brr_sample_EF2F7E:
	dw $02F4
	dw datasize(brr_sample_EF2F7E)-4
	incbin "data/sound/samples/sample_EF2F7E.brr"

;$EF3288
brr_sample_EF3288:
	dw $0000
	dw datasize(brr_sample_EF3288)-4
	incbin "data/sound/samples/sample_EF3288.brr"

;$EF335C
brr_sample_EF335C:
	dw $01F8
	dw datasize(brr_sample_EF335C)-4
	incbin "data/sound/samples/sample_EF335C.brr"

;$EF35BC
brr_sample_EF35BC:
	dw $018C
	dw datasize(brr_sample_EF35BC)-4
	incbin "data/sound/samples/sample_EF35BC.brr"

;$EF37B0
brr_sample_EF37B0:
	dw $0000
	dw datasize(brr_sample_EF37B0)-4
	incbin "data/sound/samples/sample_EF37B0.brr"

;$EF3A10
brr_sample_EF3A10:
	dw $0225
	dw datasize(brr_sample_EF3A10)-4
	incbin "data/sound/samples/sample_EF3A10.brr"

;$EF3D5A
brr_sample_EF3D5A:
	dw $0762
	dw datasize(brr_sample_EF3D5A)-4
	incbin "data/sound/samples/sample_EF3D5A.brr"

;$EF4512
brr_sample_EF4512:
	dw $0000
	dw datasize(brr_sample_EF4512)-4
	incbin "data/sound/samples/sample_EF4512.brr"

;$EF4C79
brr_sample_EF4C79:
	dw $0048
	dw datasize(brr_sample_EF4C79)-4
	incbin "data/sound/samples/sample_EF4C79.brr"

;$EF5053
brr_sample_EF5053:
	dw $0000
	dw datasize(brr_sample_EF5053)-4
	incbin "data/sound/samples/sample_EF5053.brr"

;$EF5910
brr_sample_EF5910:
	dw $0000
	dw datasize(brr_sample_EF5910)-4
	incbin "data/sound/samples/sample_EF5910.brr"

;$EF5927
brr_sample_EF5927:
	dw $0000
	dw datasize(brr_sample_EF5927)-4
	incbin "data/sound/samples/sample_EF5927.brr"

;$EF596B
brr_sample_EF596B:
	dw $0000
	dw datasize(brr_sample_EF596B)-4
	incbin "data/sound/samples/sample_EF596B.brr"

;$EF5D96
brr_sample_EF5D96:
	dw $0000
	dw datasize(brr_sample_EF5D96)-4
	incbin "data/sound/samples/sample_EF5D96.brr"

;$EF63EF
brr_sample_EF63EF:
	dw $029A
	dw datasize(brr_sample_EF63EF)-4
	incbin "data/sound/samples/sample_EF63EF.brr"

;$EF66CD
brr_sample_EF66CD:
	dw $0000
	dw datasize(brr_sample_EF66CD)-4
	incbin "data/sound/samples/sample_EF66CD.brr"

;$EF66ED
brr_sample_EF66ED:
	dw $0000
	dw datasize(brr_sample_EF66ED)-4
	incbin "data/sound/samples/sample_EF66ED.brr"

;$EF6731
brr_sample_EF6731:
	dw $0000
	dw datasize(brr_sample_EF6731)-4
	incbin "data/sound/samples/sample_EF6731.brr"

;$EF6748
brr_sample_EF6748:
	dw $0264
	dw datasize(brr_sample_EF6748)-4
	incbin "data/sound/samples/sample_EF6748.brr"

;$EF69CC
brr_sample_EF69CC:
	dw $071A
	dw datasize(brr_sample_EF69CC)-4
	incbin "data/sound/samples/sample_EF69CC.brr"

;$EF720B
brr_sample_EF720B:
	dw $00CF
	dw datasize(brr_sample_EF720B)-4
	incbin "data/sound/samples/sample_EF720B.brr"

;$EF72FA
brr_sample_EF72FA:
	dw $05FA
	dw datasize(brr_sample_EF72FA)-4
	incbin "data/sound/samples/sample_EF72FA.brr"

;$EF7A2B
brr_sample_EF7A2B:
	dw $0000
	dw datasize(brr_sample_EF7A2B)-4
	incbin "data/sound/samples/sample_EF7A2B.brr"

;$EF8006
brr_sample_EF8006:
	dw $0000
	dw datasize(brr_sample_EF8006)-4
	incbin "data/sound/samples/sample_EF8006.brr"

;$EF818E
brr_sample_EF818E:
	dw $0519
	dw datasize(brr_sample_EF818E)-4
	incbin "data/sound/samples/sample_EF818E.brr"

;$EF8880
brr_sample_EF8880:
	dw $0000
	dw datasize(brr_sample_EF8880)-4
	incbin "data/sound/samples/sample_EF8880.brr"

;$EF90BF
brr_sample_EF90BF:
	dw $0000
	dw datasize(brr_sample_EF90BF)-4
	incbin "data/sound/samples/sample_EF90BF.brr"

;$EF90D6
brr_sample_EF90D6:
	dw $0000
	dw datasize(brr_sample_EF90D6)-4
	incbin "data/sound/samples/sample_EF90D6.brr"

;$EF943B
brr_sample_EF943B:
	dw $0000
	dw datasize(brr_sample_EF943B)-4
	incbin "data/sound/samples/sample_EF943B.brr"

;$EF9677
brr_sample_EF9677:
	dw $07E0
	dw datasize(brr_sample_EF9677)-4
	incbin "data/sound/samples/sample_EF9677.brr"

;$EFA228
brr_sample_EFA228:
	dw $0000
	dw datasize(brr_sample_EFA228)-4
	incbin "data/sound/samples/sample_EFA228.brr"

;$EFA7E8
brr_sample_EFA7E8:
	dw $0000
	dw datasize(brr_sample_EFA7E8)-4
	incbin "data/sound/samples/sample_EFA7E8.brr"

;$EFA81A
brr_sample_EFA81A:
	dw $0384
	dw datasize(brr_sample_EFA81A)-4
	incbin "data/sound/samples/sample_EFA81A.brr"

;$EFAC18
brr_sample_EFAC18:
	dw $0000
	dw datasize(brr_sample_EFAC18)-4
	incbin "data/sound/samples/sample_EFAC18.brr"

;$EFAC4A
brr_sample_EFAC4A:
	dw $0000
	dw datasize(brr_sample_EFAC4A)-4
	incbin "data/sound/samples/sample_EFAC4A.brr"

;$EFAC7C
brr_sample_EFAC7C:
	dw $0000
	dw datasize(brr_sample_EFAC7C)-4
	incbin "data/sound/samples/sample_EFAC7C.brr"

;$EFACAE
brr_sample_EFACAE:
	dw $0000
	dw datasize(brr_sample_EFACAE)-4
	incbin "data/sound/samples/sample_EFACAE.brr"

;$EFACE0
brr_sample_EFACE0:
	dw $0000
	dw datasize(brr_sample_EFACE0)-4
	incbin "data/sound/samples/sample_EFACE0.brr"

;$EFAD12
brr_sample_EFAD12:
	dw $0000
	dw datasize(brr_sample_EFAD12)-4
	incbin "data/sound/samples/sample_EFAD12.brr"

;$EFAD44
brr_sample_EFAD44:
	dw $0000
	dw datasize(brr_sample_EFAD44)-4
	incbin "data/sound/samples/sample_EFAD44.brr"

;$EFAD76
brr_sample_EFAD76:
	dw $0000
	dw datasize(brr_sample_EFAD76)-4
	incbin "data/sound/samples/sample_EFAD76.brr"

;$EFADA8
brr_sample_EFADA8:
	dw $0000
	dw datasize(brr_sample_EFADA8)-4
	incbin "data/sound/samples/sample_EFADA8.brr"

;$EFADDA
brr_sample_EFADDA:
	dw $0000
	dw datasize(brr_sample_EFADDA)-4
	incbin "data/sound/samples/sample_EFADDA.brr"

;$EFAE0C
brr_sample_EFAE0C:
	dw $0000
	dw datasize(brr_sample_EFAE0C)-4
	incbin "data/sound/samples/sample_EFAE0C.brr"

;$EFAE3E
brr_sample_EFAE3E:
	dw $0000
	dw datasize(brr_sample_EFAE3E)-4
	incbin "data/sound/samples/sample_EFAE3E.brr"

;$EFAE70
brr_sample_EFAE70:
	dw $0000
	dw datasize(brr_sample_EFAE70)-4
	incbin "data/sound/samples/sample_EFAE70.brr"

;$EFAEA2
brr_sample_EFAEA2:
	dw $0000
	dw datasize(brr_sample_EFAEA2)-4
	incbin "data/sound/samples/sample_EFAEA2.brr"

;$EFAED4
brr_sample_EFAED4:
	dw $0000
	dw datasize(brr_sample_EFAED4)-4
	incbin "data/sound/samples/sample_EFAED4.brr"

;$EFAF06
brr_sample_EFAF06:
	dw $0000
	dw datasize(brr_sample_EFAF06)-4
	incbin "data/sound/samples/sample_EFAF06.brr"

;$EFAF38
brr_sample_EFAF38:
	dw $0000
	dw datasize(brr_sample_EFAF38)-4
	incbin "data/sound/samples/sample_EFAF38.brr"

;$EFAF6A
brr_sample_EFAF6A:
	dw $0000
	dw datasize(brr_sample_EFAF6A)-4
	incbin "data/sound/samples/sample_EFAF6A.brr"

;$EFAF9C
brr_sample_EFAF9C:
	dw $0000
	dw datasize(brr_sample_EFAF9C)-4
	incbin "data/sound/samples/sample_EFAF9C.brr"

;$EFAFCE
brr_sample_EFAFCE:
	dw $0000
	dw datasize(brr_sample_EFAFCE)-4
	incbin "data/sound/samples/sample_EFAFCE.brr"

;$EFB000
brr_sample_EFB000:
	dw $0000
	dw datasize(brr_sample_EFB000)-4
	incbin "data/sound/samples/sample_EFB000.brr"

;$EFB032
brr_sample_EFB032:
	dw $0000
	dw datasize(brr_sample_EFB032)-4
	incbin "data/sound/samples/sample_EFB032.brr"

;$EFB064
brr_sample_EFB064:
	dw $0000
	dw datasize(brr_sample_EFB064)-4
	incbin "data/sound/samples/sample_EFB064.brr"

;$EFB096
brr_sample_EFB096:
	dw $0000
	dw datasize(brr_sample_EFB096)-4
	incbin "data/sound/samples/sample_EFB096.brr"

;$EFB0C8
brr_sample_EFB0C8:
	dw $0000
	dw datasize(brr_sample_EFB0C8)-4
	incbin "data/sound/samples/sample_EFB0C8.brr"

;$EFB0FA
brr_sample_EFB0FA:
	dw $0000
	dw datasize(brr_sample_EFB0FA)-4
	incbin "data/sound/samples/sample_EFB0FA.brr"

;$EFB11A
brr_sample_EFB11A:
	dw $0000
	dw datasize(brr_sample_EFB11A)-4
	incbin "data/sound/samples/sample_EFB11A.brr"

;$EFB13A
brr_sample_EFB13A:
	dw $0000
	dw datasize(brr_sample_EFB13A)-4
	incbin "data/sound/samples/sample_EFB13A.brr"

;$EFB15A
brr_sample_EFB15A:
	dw $0000
	dw datasize(brr_sample_EFB15A)-4
	incbin "data/sound/samples/sample_EFB15A.brr"

;$EFB17A
brr_sample_EFB17A:
	dw $0000
	dw datasize(brr_sample_EFB17A)-4
	incbin "data/sound/samples/sample_EFB17A.brr"

;$EFB19A
brr_sample_EFB19A:
	dw $0000
	dw datasize(brr_sample_EFB19A)-4
	incbin "data/sound/samples/sample_EFB19A.brr"

;$EFB1BA
brr_sample_EFB1BA:
	dw $0000
	dw datasize(brr_sample_EFB1BA)-4
	incbin "data/sound/samples/sample_EFB1BA.brr"

;$EFB1DA
brr_sample_EFB1DA:
	dw $0000
	dw datasize(brr_sample_EFB1DA)-4
	incbin "data/sound/samples/sample_EFB1DA.brr"

;$EFB1FA
brr_sample_EFB1FA:
	dw $0000
	dw datasize(brr_sample_EFB1FA)-4
	incbin "data/sound/samples/sample_EFB1FA.brr"

;$EFB21A
brr_sample_EFB21A:
	dw $0000
	dw datasize(brr_sample_EFB21A)-4
	incbin "data/sound/samples/sample_EFB21A.brr"

;$EFB23A
brr_sample_EFB23A:
	dw $0000
	dw datasize(brr_sample_EFB23A)-4
	incbin "data/sound/samples/sample_EFB23A.brr"

;$EFB26B
brr_sample_EFB26B:
	dw $0000
	dw datasize(brr_sample_EFB26B)-4
	incbin "data/sound/samples/sample_EFB26B.brr"

;$EFB29C
brr_sample_EFB29C:
	dw $0000
	dw datasize(brr_sample_EFB29C)-4
	incbin "data/sound/samples/sample_EFB29C.brr"

;$EFB2CD
brr_sample_EFB2CD:
	dw $0000
	dw datasize(brr_sample_EFB2CD)-4
	incbin "data/sound/samples/sample_EFB2CD.brr"

;$EFB2FE
brr_sample_EFB2FE:
	dw $0000
	dw datasize(brr_sample_EFB2FE)-4
	incbin "data/sound/samples/sample_EFB2FE.brr"

;$EFB32F
brr_sample_EFB32F:
	dw $0000
	dw datasize(brr_sample_EFB32F)-4
	incbin "data/sound/samples/sample_EFB32F.brr"

;$EFB360
brr_sample_EFB360:
	dw $0000
	dw datasize(brr_sample_EFB360)-4
	incbin "data/sound/samples/sample_EFB360.brr"

;$EFB391
brr_sample_EFB391:
	dw $0000
	dw datasize(brr_sample_EFB391)-4
	incbin "data/sound/samples/sample_EFB391.brr"

;$EFB3C2
brr_sample_EFB3C2:
	dw $0000
	dw datasize(brr_sample_EFB3C2)-4
	incbin "data/sound/samples/sample_EFB3C2.brr"

;$EFB3F3
brr_sample_EFB3F3:
	dw $0000
	dw datasize(brr_sample_EFB3F3)-4
	incbin "data/sound/samples/sample_EFB3F3.brr"

;$EFB424
brr_sample_EFB424:
	dw $0000
	dw datasize(brr_sample_EFB424)-4
	incbin "data/sound/samples/sample_EFB424.brr"

;$EFB455
brr_sample_EFB455:
	dw $0000
	dw datasize(brr_sample_EFB455)-4
	incbin "data/sound/samples/sample_EFB455.brr"

;$EFB486
brr_sample_EFB486:
	dw $0000
	dw datasize(brr_sample_EFB486)-4
	incbin "data/sound/samples/sample_EFB486.brr"

;$EFB4B7
brr_sample_EFB4B7:
	dw $0000
	dw datasize(brr_sample_EFB4B7)-4
	incbin "data/sound/samples/sample_EFB4B7.brr"

;$EFB4E8
brr_sample_EFB4E8:
	dw $0000
	dw datasize(brr_sample_EFB4E8)-4
	incbin "data/sound/samples/sample_EFB4E8.brr"

;$EFB519
brr_sample_EFB519:
	dw $0000
	dw datasize(brr_sample_EFB519)-4
	incbin "data/sound/samples/sample_EFB519.brr"

;$EFB54A
brr_sample_EFB54A:
	dw $0000
	dw datasize(brr_sample_EFB54A)-4
	incbin "data/sound/samples/sample_EFB54A.brr"

;$EFB57B
brr_sample_EFB57B:
	dw $0000
	dw datasize(brr_sample_EFB57B)-4
	incbin "data/sound/samples/sample_EFB57B.brr"

;$EFB5AC
brr_sample_EFB5AC:
	dw $0000
	dw datasize(brr_sample_EFB5AC)-4
	incbin "data/sound/samples/sample_EFB5AC.brr"

;$EFB5DD
brr_sample_EFB5DD:
	dw $0000
	dw datasize(brr_sample_EFB5DD)-4
	incbin "data/sound/samples/sample_EFB5DD.brr"

;$EFB60E
brr_sample_EFB60E:
	dw $0000
	dw datasize(brr_sample_EFB60E)-4
	incbin "data/sound/samples/sample_EFB60E.brr"

;$EFB63F
brr_sample_EFB63F:
	dw $0000
	dw datasize(brr_sample_EFB63F)-4
	incbin "data/sound/samples/sample_EFB63F.brr"

;$EFB670
brr_sample_EFB670:
	dw $0000
	dw datasize(brr_sample_EFB670)-4
	incbin "data/sound/samples/sample_EFB670.brr"

;$EFB6A1
brr_sample_EFB6A1:
	dw $0000
	dw datasize(brr_sample_EFB6A1)-4
	incbin "data/sound/samples/sample_EFB6A1.brr"

;$EFB6D2
brr_sample_EFB6D2:
	dw $0000
	dw datasize(brr_sample_EFB6D2)-4
	incbin "data/sound/samples/sample_EFB6D2.brr"

;$EFB703
brr_sample_EFB703:
	dw $0000
	dw datasize(brr_sample_EFB703)-4
	incbin "data/sound/samples/sample_EFB703.brr"

;$EFB734
brr_sample_EFB734:
	dw $0000
	dw datasize(brr_sample_EFB734)-4
	incbin "data/sound/samples/sample_EFB734.brr"

;$EFB765
brr_sample_EFB765:
	dw $0000
	dw datasize(brr_sample_EFB765)-4
	incbin "data/sound/samples/sample_EFB765.brr"

;$EFB796
brr_sample_EFB796:
	dw $0000
	dw datasize(brr_sample_EFB796)-4
	incbin "data/sound/samples/sample_EFB796.brr"

;$EFB7C7
brr_sample_EFB7C7:
	dw $0000
	dw datasize(brr_sample_EFB7C7)-4
	incbin "data/sound/samples/sample_EFB7C7.brr"

;$EFB7F8
brr_sample_EFB7F8:
	dw $0000
	dw datasize(brr_sample_EFB7F8)-4
	incbin "data/sound/samples/sample_EFB7F8.brr"

;$EFB829
brr_sample_EFB829:
	dw $0000
	dw datasize(brr_sample_EFB829)-4
	incbin "data/sound/samples/sample_EFB829.brr"

;$EFB85A
brr_sample_EFB85A:
	dw $0000
	dw datasize(brr_sample_EFB85A)-4
	incbin "data/sound/samples/sample_EFB85A.brr"

;$EFB912
brr_sample_EFB912:
	dw $0000
	dw datasize(brr_sample_EFB912)-4
	incbin "data/sound/samples/sample_EFB912.brr"

;$EFD404
brr_sample_EFD404:
	dw $0000
	dw datasize(brr_sample_EFD404)-4
	incbin "data/sound/samples/sample_EFD404.brr"

;$EFDB08
brr_sample_EFDB08:
	dw $0000
	dw datasize(brr_sample_EFDB08)-4
	incbin "data/sound/samples/sample_EFDB08.brr"

;$EFE26F
brr_sample_EFE26F:
	dw $0000
	dw datasize(brr_sample_EFE26F)-4
	incbin "data/sound/samples/sample_EFE26F.brr"

;$EFE8F5
brr_sample_EFE8F5:
	dw $0000
	dw datasize(brr_sample_EFE8F5)-4
	incbin "data/sound/samples/sample_EFE8F5.brr"

;$EFECBD
brr_sample_EFECBD:
	dw $0000
	dw datasize(brr_sample_EFECBD)-4
	incbin "data/sound/samples/sample_EFECBD.brr"

;$EFEDF4
brr_sample_EFEDF4:
	dw $0000
	dw datasize(brr_sample_EFEDF4)-4
	incbin "data/sound/samples/sample_EFEDF4.brr"

;$EFEEF5
brr_sample_EFEEF5:
	dw $0000
	dw datasize(brr_sample_EFEEF5)-4
	incbin "data/sound/samples/sample_EFEEF5.brr"

;$EFF035
brr_sample_EFF035:
	dw $0000
	dw datasize(brr_sample_EFF035)-4
	incbin "data/sound/samples/sample_EFF035.brr"

;$EFF11B
brr_sample_EFF11B:
	dw $0000
	dw datasize(brr_sample_EFF11B)-4
	incbin "data/sound/samples/sample_EFF11B.brr"

;$EFF894
brr_sample_EFF894:
	dw $0000
	dw datasize(brr_sample_EFF894)-4
	incbin "data/sound/samples/sample_EFF894.brr"

;$EFFAFC
brr_sample_EFFAFC:
	dw $0000
	dw datasize(brr_sample_EFFAFC)-4
	incbin "data/sound/samples/sample_EFFAFC.brr"

;$EFFECD
brr_sample_EFFECD:
	dw $0195
	dw datasize(brr_sample_EFFECD)-4
	incbin "data/sound/samples/sample_EFFECD.brr"

;$F00162
brr_sample_F00162:
	dw $032A
	dw datasize(brr_sample_F00162)-4
	incbin "data/sound/samples/sample_F00162.brr"

;$F0062F
brr_sample_F0062F:
	dw $0000
	dw datasize(brr_sample_F0062F)-4
	incbin "data/sound/samples/sample_F0062F.brr"

;$F00823
brr_sample_F00823:
	dw $01B0
	dw datasize(brr_sample_F00823)-4
	incbin "data/sound/samples/sample_F00823.brr"

;$F009FC
brr_sample_F009FC:
	dw $0000
	dw datasize(brr_sample_F009FC)-4
	incbin "data/sound/samples/sample_F009FC.brr"

;$F00A1C
brr_sample_F00A1C:
	dw $0000
	dw datasize(brr_sample_F00A1C)-4
	incbin "data/sound/samples/sample_F00A1C.brr"

;$F00FAF
brr_sample_F00FAF:
	dw $029A
	dw datasize(brr_sample_F00FAF)-4
	incbin "data/sound/samples/sample_F00FAF.brr"

;$F01674
brr_sample_F01674:
	dw $04EC
	dw datasize(brr_sample_F01674)-4
	incbin "data/sound/samples/sample_F01674.brr"

;$F01B6E
brr_sample_F01B6E:
	dw $0000
	dw datasize(brr_sample_F01B6E)-4
	incbin "data/sound/samples/sample_F01B6E.brr"

;$F01BA9
brr_sample_F01BA9:
	dw $0000
	dw datasize(brr_sample_F01BA9)-4
	incbin "data/sound/samples/sample_F01BA9.brr"

;$F02667
brr_sample_F02667:
	dw $0000
	dw datasize(brr_sample_F02667)-4
	incbin "data/sound/samples/sample_F02667.brr"

;$F02800
brr_sample_F02800:
	dw $0000
	dw datasize(brr_sample_F02800)-4
	incbin "data/sound/samples/sample_F02800.brr"

;$F02988
brr_sample_F02988:
	dw $0000
	dw datasize(brr_sample_F02988)-4
	incbin "data/sound/samples/sample_F02988.brr"

;$F02C2F
brr_sample_F02C2F:
	dw $0711
	dw datasize(brr_sample_F02C2F)-4
	incbin "data/sound/samples/sample_F02C2F.brr"

;$F03A17
brr_sample_F03A17:
	dw $0000
	dw datasize(brr_sample_F03A17)-4
	incbin "data/sound/samples/sample_F03A17.brr"

;$F03A5B
brr_sample_F03A5B:
	dw $0000
	dw datasize(brr_sample_F03A5B)-4
	incbin "data/sound/samples/sample_F03A5B.brr"

;$F03B1D
brr_sample_F03B1D:
	dw $0087
	dw datasize(brr_sample_F03B1D)-4
	incbin "data/sound/samples/sample_F03B1D.brr"

;$F03D2B
brr_sample_F03D2B:
	dw $0654
	dw datasize(brr_sample_F03D2B)-4
	incbin "data/sound/samples/sample_F03D2B.brr"

;$F04854
brr_sample_F04854:
	dw $0000
	dw datasize(brr_sample_F04854)-4
	incbin "data/sound/samples/sample_F04854.brr"

;$F057E3
brr_sample_F057E3:
	dw $0000
	dw datasize(brr_sample_F057E3)-4
	incbin "data/sound/samples/sample_F057E3.brr"

;$F05FFD
brr_sample_F05FFD:
	dw $0000
	dw datasize(brr_sample_F05FFD)-4
	incbin "data/sound/samples/sample_F05FFD.brr"

;$F073F1
brr_sample_F073F1:
	dw $0000
	dw datasize(brr_sample_F073F1)-4
	incbin "data/sound/samples/sample_F073F1.brr"

;$F08A2D
brr_sample_F08A2D:
	dw $0000
	dw datasize(brr_sample_F08A2D)-4
	incbin "data/sound/samples/sample_F08A2D.brr"

;$F09BFB
brr_sample_F09BFB:
	dw $0402
	dw datasize(brr_sample_F09BFB)-4
	incbin "data/sound/samples/sample_F09BFB.brr"

;$F0A157
brr_sample_F0A157:
	dw $0000
	dw datasize(brr_sample_F0A157)-4
	incbin "data/sound/samples/sample_F0A157.brr"

;$F0A5FF
brr_sample_F0A5FF:
	dw $069C
	dw datasize(brr_sample_F0A5FF)-4
	incbin "data/sound/samples/sample_F0A5FF.brr"

;$F0AE2B
brr_sample_F0AE2B:
	dw $0000
	dw datasize(brr_sample_F0AE2B)-4
	incbin "data/sound/samples/sample_F0AE2B.brr"

;$F0B2B0
brr_sample_F0B2B0:
	dw $052B
	dw datasize(brr_sample_F0B2B0)-4
	incbin "data/sound/samples/sample_F0B2B0.brr"

;$F0B7FA
brr_sample_F0B7FA:
	dw $0000
	dw datasize(brr_sample_F0B7FA)-4
	incbin "data/sound/samples/sample_F0B7FA.brr"

;$F0BD45
brr_sample_F0BD45:
	dw $0816
	dw datasize(brr_sample_F0BD45)-4
	incbin "data/sound/samples/sample_F0BD45.brr"

;$F0C93E
brr_sample_F0C93E:
	dw $0000
	dw datasize(brr_sample_F0C93E)-4
	incbin "data/sound/samples/sample_F0C93E.brr"

;$F0CD45
brr_sample_F0CD45:
	dw $0C7B
	dw datasize(brr_sample_F0CD45)-4
	incbin "data/sound/samples/sample_F0CD45.brr"

;$F0DC8C
brr_sample_F0DC8C:
	dw $0000
	dw datasize(brr_sample_F0DC8C)-4
	incbin "data/sound/samples/sample_F0DC8C.brr"

;$F0F65E
brr_sample_F0F65E:
	dw $0000
	dw datasize(brr_sample_F0F65E)-4
	incbin "data/sound/samples/sample_F0F65E.brr"

;$F1078A
brr_sample_F1078A:
	dw $0000
	dw datasize(brr_sample_F1078A)-4
	incbin "data/sound/samples/sample_F1078A.brr"

;$F10F26
brr_sample_F10F26:
	dw $0000
	dw datasize(brr_sample_F10F26)-4
	incbin "data/sound/samples/sample_F10F26.brr"

;$F117C7
brr_sample_F117C7:
	dw $0001
	dw datasize(brr_sample_F117C7)-4
	incbin "data/sound/samples/sample_F117C7.brr"

;$F11EEE
brr_sample_F11EEE:
	dw $0000
	dw datasize(brr_sample_F11EEE)-4
	incbin "data/sound/samples/sample_F11EEE.brr"

;$F11F0D
brr_sample_F11F0D:
	dw $0000
	dw datasize(brr_sample_F11F0D)-4
	incbin "data/sound/samples/sample_F11F0D.brr"

;$F12A9A
brr_sample_F12A9A:
	dw $0000
	dw datasize(brr_sample_F12A9A)-4
	incbin "data/sound/samples/sample_F12A9A.brr"

;$F133B1
brr_sample_F133B1:
	dw $0603
	dw datasize(brr_sample_F133B1)-4
	incbin "data/sound/samples/sample_F133B1.brr"

;$F139DC
brr_sample_F139DC:
	dw $054F
	dw datasize(brr_sample_F139DC)-4
	incbin "data/sound/samples/sample_F139DC.brr"

;$F14B98
brr_sample_F14B98:
	dw $01EF
	dw datasize(brr_sample_F14B98)-4
	incbin "data/sound/samples/sample_F14B98.brr"

;$F14DA6
brr_sample_F14DA6:
	dw $0000
	dw datasize(brr_sample_F14DA6)-4
	incbin "data/sound/samples/sample_F14DA6.brr"

;$F15542
brr_sample_F15542:
	dw $06AE
	dw datasize(brr_sample_F15542)-4
	incbin "data/sound/samples/sample_F15542.brr"

;$F15C0F
brr_sample_F15C0F:
	dw $0000
	dw datasize(brr_sample_F15C0F)-4
	incbin "data/sound/samples/sample_F15C0F.brr"

;$F1663C
brr_sample_F1663C:
	dw $0000
	dw datasize(brr_sample_F1663C)-4
	incbin "data/sound/samples/sample_F1663C.brr"

;$F16F1C
brr_sample_F16F1C:
	dw $0A8C
	dw datasize(brr_sample_F16F1C)-4
	incbin "data/sound/samples/sample_F16F1C.brr"

;$F179D9
brr_sample_F179D9:
	dw $0603
	dw datasize(brr_sample_F179D9)-4
	incbin "data/sound/samples/sample_F179D9.brr"

;$F18004
brr_sample_F18004:
	dw $065D
	dw datasize(brr_sample_F18004)-4
	incbin "data/sound/samples/sample_F18004.brr"

;$F186E4
brr_sample_F186E4:
	dw $0000
	dw datasize(brr_sample_F186E4)-4
	incbin "data/sound/samples/sample_F186E4.brr"

;$F192E5
brr_sample_F192E5:
	dw $0000
	dw datasize(brr_sample_F192E5)-4
	incbin "data/sound/samples/sample_F192E5.brr"

;$F19304
brr_sample_F19304:
	dw $0000
	dw datasize(brr_sample_F19304)-4
	incbin "data/sound/samples/sample_F19304.brr"

;$F19311
brr_sample_F19311:
	dw $0000
	dw datasize(brr_sample_F19311)-4
	incbin "data/sound/samples/sample_F19311.brr"

;$F1946B
brr_sample_F1946B:
	dw $0912
	dw datasize(brr_sample_F1946B)-4
	incbin "data/sound/samples/sample_F1946B.brr"

;$F1A225
brr_sample_F1A225:
	dw $0000
	dw datasize(brr_sample_F1A225)-4
	incbin "data/sound/samples/sample_F1A225.brr"

;$F1A811
brr_sample_F1A811:
	dw $0000
	dw datasize(brr_sample_F1A811)-4
	incbin "data/sound/samples/sample_F1A811.brr"

;$F1AD5B
brr_sample_F1AD5B:
	dw $0000
	dw datasize(brr_sample_F1AD5B)-4
	incbin "data/sound/samples/sample_F1AD5B.brr"

;$F1B55A
brr_sample_F1B55A:
	dw $0000
	dw datasize(brr_sample_F1B55A)-4
	incbin "data/sound/samples/sample_F1B55A.brr"

;$F1B795
brr_sample_F1B795:
	dw $0000
	dw datasize(brr_sample_F1B795)-4
	incbin "data/sound/samples/sample_F1B795.brr"

;$F1B9D0
brr_sample_F1B9D0:
	dw $0000
	dw datasize(brr_sample_F1B9D0)-4
	incbin "data/sound/samples/sample_F1B9D0.brr"

;$F1BC0B
brr_sample_F1BC0B:
	dw $0000
	dw datasize(brr_sample_F1BC0B)-4
	incbin "data/sound/samples/sample_F1BC0B.brr"

;$F1C03F
brr_sample_F1C03F:
	dw $0708
	dw datasize(brr_sample_F1C03F)-4
	incbin "data/sound/samples/sample_F1C03F.brr"

;$F1C916
brr_sample_F1C916:
	dw $0000
	dw datasize(brr_sample_F1C916)-4
	incbin "data/sound/samples/sample_F1C916.brr"

;$F1CC05
brr_sample_F1CC05:
	dw $0000
	dw datasize(brr_sample_F1CC05)-4
	incbin "data/sound/samples/sample_F1CC05.brr"

;$F1CD4E
brr_sample_F1CD4E:
	dw $0000
	dw datasize(brr_sample_F1CD4E)-4
	incbin "data/sound/samples/sample_F1CD4E.brr"

;$F1CFF6
brr_sample_F1CFF6:
	dw $0000
	dw datasize(brr_sample_F1CFF6)-4
	incbin "data/sound/samples/sample_F1CFF6.brr"

;$F1D190
brr_sample_F1D190:
	dw $0372
	dw datasize(brr_sample_F1D190)-4
	incbin "data/sound/samples/sample_F1D190.brr"

;$F1D68A
brr_sample_F1D68A:
	dw $0000
	dw datasize(brr_sample_F1D68A)-4
	incbin "data/sound/samples/sample_F1D68A.brr"

;$F1DF7C
brr_sample_F1DF7C:
	dw $0000
	dw datasize(brr_sample_F1DF7C)-4
	incbin "data/sound/samples/sample_F1DF7C.brr"

;$F1E973
brr_sample_F1E973:
	dw $0000
	dw datasize(brr_sample_F1E973)-4
	incbin "data/sound/samples/sample_F1E973.brr"

;$F1EDA6
brr_sample_F1EDA6:
	dw $03D5
	dw datasize(brr_sample_F1EDA6)-4
	incbin "data/sound/samples/sample_F1EDA6.brr"

;$F1F188
brr_sample_F1F188:
	dw $0000
	dw datasize(brr_sample_F1F188)-4
	incbin "data/sound/samples/sample_F1F188.brr"

;$F1F195
brr_sample_F1F195:
	dw $0000
	dw datasize(brr_sample_F1F195)-4
	incbin "data/sound/samples/sample_F1F195.brr"

;$F1F337
brr_sample_F1F337:
	dw $037B
	dw datasize(brr_sample_F1F337)-4
	incbin "data/sound/samples/sample_F1F337.brr"

;$F1F92C
brr_sample_F1F92C:
	dw $0000
	dw datasize(brr_sample_F1F92C)-4
	incbin "data/sound/samples/sample_F1F92C.brr"

;$F20080
brr_sample_F20080:
	dw $0000
	dw datasize(brr_sample_F20080)-4
	incbin "data/sound/samples/sample_F20080.brr"

;$F202BB
brr_sample_F202BB:
	dw $13E6
	dw datasize(brr_sample_F202BB)-4
	incbin "data/sound/samples/sample_F202BB.brr"

;$F218D4
brr_sample_F218D4:
	dw $0000
	dw datasize(brr_sample_F218D4)-4
	incbin "data/sound/samples/sample_F218D4.brr"

;$F21E5D
brr_sample_F21E5D:
	dw $01C2
	dw datasize(brr_sample_F21E5D)-4
	incbin "data/sound/samples/sample_F21E5D.brr"

;$F22132
brr_sample_F22132:
	dw $0000
	dw datasize(brr_sample_F22132)-4
	incbin "data/sound/samples/sample_F22132.brr"

;$F225B6
brr_sample_F225B6:
	dw $0465
	dw datasize(brr_sample_F225B6)-4
	incbin "data/sound/samples/sample_F225B6.brr"

;$F22C44
brr_sample_F22C44:
	dw $0000
	dw datasize(brr_sample_F22C44)-4
	incbin "data/sound/samples/sample_F22C44.brr"

;$F232D2
brr_sample_F232D2:
	dw $0000
	dw datasize(brr_sample_F232D2)-4
	incbin "data/sound/samples/sample_F232D2.brr"
	
	incsrc "data/sound/music/ship_hold_song_data.asm"
	incsrc "data/sound/music/fanfare_song_data.asm"
	incsrc "data/sound/music/ship_deck_2_song_data.asm"
	incsrc "data/sound/music/rescue_kong_song_data.asm"
	incsrc "data/sound/music/game_over_song_data.asm"
	incsrc "data/sound/music/big_boss_song_data.asm"
	incsrc "data/sound/music/castle_song_data.asm"
	incsrc "data/sound/music/haunted_song_data.asm"
	incsrc "data/sound/music/file_select_song_data.asm"
	incsrc "data/sound/music/cranky_song_data.asm"
	incsrc "data/sound/music/ice_song_data.asm"
	incsrc "data/sound/music/jungle_song_data.asm"
	incsrc "data/sound/music/lost_world_song_data.asm"
	incsrc "data/sound/music/rigging_song_data.asm"
	incsrc "data/sound/music/credits_song_data.asm"
	incsrc "data/sound/music/k_rool_song_data.asm"

DATA_F2E691:
	dw !bgm_loc, $0000	;Unused placeholder for track $20 (reuses track $0F data instead)

DATA_F2E695:
	dw !bgm_loc, $0000	;Unused placeholder for track $21 (reuses track $15 data instead)

DATA_F2E699:
	dw !bgm_loc, $0000	;Unused placeholder for track $22 (reuses track $0F data instead)

DATA_F2E69D:
	dw !bgm_loc, $0000	;Unused placeholder for track $23 (reuses track $0F data instead)

	incsrc "data/sound/music/secret_ending_song_data.asm"

DATA_F2E724:
	dw !bgm_loc, $0000	;Unused placeholder for track $25 (reuses track $0F data instead)

DATA_F2E728:
	dw !bgm_loc, $0000	;Placeholder for track $26

DATA_F2E72C:
	dw !bgm_loc, $0000	;Placeholder for track $27

	incsrc "data/sound/sound_effects/global_sfx_data.asm"
	incsrc "data/sound/sound_effects/dummy_sfx_data.asm"
	incsrc "data/sound/sound_effects/roller_coaster_sfx_data.asm"
	incsrc "data/sound/sound_effects/ship_ice_ending_sfx_data.asm"
	incsrc "data/sound/sound_effects/swamp_forest_mine_brambles_hive_sfx_data.asm"
	incsrc "data/sound/sound_effects/unused_krockhead_sfx_data.asm"
	incsrc "data/sound/sound_effects/jungle_sfx_data.asm"
	incsrc "data/sound/sound_effects/boss_1_sfx_data.asm"
	incsrc "data/sound/sound_effects/lava_castle_boss_2_sfx_data.asm"

DATA_F2FB66:
	dw !dyn_snd_loc, $0002		;Unused placeholder for song-specific sound effect set $08

DATA_F2FB6A:
	dw !dyn_snd_loc, $0002		;Unused placeholder for song-specific sound effect set $09

DATA_F2FB6E:
	dw !dyn_snd_loc, $0002		;Unused placeholder for song-specific sound effect set $0A

DATA_F2FB72:
	dw !dyn_snd_loc, $0002		;Unused placeholder for song-specific sound effect set $0B

DATA_F2FB76:
	dw !dyn_snd_loc, $0002		;Unused placeholder for song-specific sound effect set $0C

DATA_F2FB7A:
	dw !dyn_snd_loc, $0002		;Unused placeholder for song-specific sound effect set $0D

DATA_F2FB7E:
	dw !dyn_snd_loc, $0002		;Unused placeholder for song-specific sound effect set $0E

DATA_F2FB82:
	dw !dyn_snd_loc, $0002		;Unused placeholder for song-specific sound effect set $0F

	padbyte $00 : pad $F30000

check bankcross full
