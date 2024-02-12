;00 NULL
;2E1939
null_song_data:
	dw !bgm_loc, $0011
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1314, .seq_1321, .seq_1321, .seq_1321, .seq_1321, .seq_1321, .seq_1321, .seq_1321
	db $80, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 

.seq_1314:
	db !set_echo, $37, $23, $23
	db !set_fir, $7F, $0A, $01, $01, $01, $01, $01, $01
.seq_1321:
	db !end_sequence

base off
arch 65816
.end: