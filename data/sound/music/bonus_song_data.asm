;0F,20,22,23,25 Token Tango
;2EBDBD
bonus_song_data:
	dw !bgm_loc, $0851
;If modifying this file, comment out the line above and uncomment the line below
;	dw !bgm_loc, ((.end-.start)+((.end-.start)&$0001))>>1

.start:
arch spc700
base !bgm_loc
;sub-track 00 channel pointers
.chn_ptrs_1300:
	dw .seq_1350, .seq_17B6, .seq_1428, .seq_16E5, .seq_1633, .seq_14CA, .seq_158F, .seq_13E0
	db $B0, $FF	;music tempo, sound effect tempo

;sub-track pointers
	dw .chn_ptrs_1300	;00: 
	dw .chn_ptrs_131A	;01: 
	dw .chn_ptrs_132C	;02: 
	dw .chn_ptrs_133E	;03: 

;sub-track 01 channel pointers
.chn_ptrs_131A:
	dw .seq_191A, .seq_1945, .seq_196B, .seq_1A3E, .seq_1993, .seq_1A18, .seq_19F2, .seq_1A64
	db $B0, $FF	;music tempo, sound effect tempo

;sub-track 02 channel pointers
.chn_ptrs_132C:
	dw .seq_1808, .seq_1836, .seq_1853, .seq_18DE, .seq_1878, .seq_18C0, .seq_189F, .seq_18FC
	db $90, $FF	;music tempo, sound effect tempo

;sub-track 03 channel pointers
.chn_ptrs_133E:
	dw .seq_1A8C, .seq_1C23, .seq_1DFD, .seq_2289, .seq_1EB2, .seq_2141, .seq_238C, .seq_1FFA
	db $B0, $FF	;music tempo, sound effect tempo

.seq_1350:
	db !echo_delay, $04
	db !play_subsequence : dw .subseq_1805
	db !set_master_volume_indirect, $4B
	db !set_echo, $30, $14, $14
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !echo_on
	db !set_instrument, $36
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !set_adsr, $9F, $B4
	db !set_vol_single_val, $28
	db $80, $06
	db $91, $02
	db $92, $03
	db $91, $05
	db $8F, $06
	db !echo_off
.loop_point_137D:
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !set_adsr, $CF, $96
	db $8E, $0A
	db !echo_on
	db !set_instrument, $19
	db !set_volume_l_and_r, $24, $10
	db !set_adsr, $CF, $96
	db $90, $10
	db $90, $06
	db !set_instrument, $A5
	db !set_volume_l_and_r, $46, $50
	db !set_adsr, $AF, $EB
	db !echo_on
	db $99, $10
	db !echo_off
	db !set_instrument, $19
	db !set_volume_l_and_r, $1C, $18
	db !set_adsr, $CF, $96
	db $95, $0A
	db $95, $06
	db !echo_off
	db !set_instrument, $00
	db !set_vol_single_val, $50
	db !set_adsr, $CF, $96
	db $8E, $0A
	db !echo_on
	db !set_instrument, $19
	db !set_volume_l_and_r, $0C, $28
	db !set_adsr, $DF, $99
	db $A4, $10
	db $A4, $06
	db !set_instrument, $A5
	db !set_volume_l_and_r, $46, $50
	db !set_adsr, $AF, $EB
	db !echo_on
	db $99, $10
	db !echo_off
	db !set_instrument, $19
	db !set_volume_l_and_r, $24, $10
	db !set_adsr, $CF, $96
	db $95, $05
	db $95, $05
	db $95, $06
	db !echo_off
	db !jump_to_sequence : dw .loop_point_137D

.seq_13E0:
	db !play_subsequence : dw .subseq_1805
	db $80, $16
.loop_point_13E5:
	db !set_instrument, $8D
	db !set_volume_l_and_r, $30, $1A
	db !change_instr_pitch, $00
	db !loop_subsequence, $20 : dw .subseq_1418
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $1C, $0A
	db !set_adsr, $9B, $A8
	db $93, $E0
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_adsr, $DE, $51
	db !set_volume_l_and_r, $18, $20
	db $93, $08
	db $80, $02
	db $93, $0D
	db !set_volume_l_and_r, $0A, $08
	db $93, $09
	db !jump_to_sequence : dw .loop_point_13E5

.subseq_1418:
	db !set_adsr, $FF, $4B
	db $98, $10
	db !set_adsr, $FE, $4B
	db $98, $0A
	db !set_adsr, $FF, $4E
	db $98, $06
	db !return_from_sub

.seq_1428:
	db !play_subsequence : dw .subseq_1805
	db $80, $16
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A6
	db !set_vol_single_val, $58
	db !set_adsr, $9F, $AB
.loop_point_1438:
	db !loop_subsequence, $02 : dw .subseq_148B
	db !loop_subsequence, $02 : dw .subseq_145F
	db !set_default_duration, $10
	db $87
	db $87
	db $87
	db $87
	db $87
	db $87
	db $87
	db $87
	db $87
	db $87
	db $87
	db $87
	db $87
	db !default_duration_off
	db $87, $0A
	db $87, $06
	db $8C, $08
	db $80, $02
	db $8C, $06
	db $80, $10
	db !jump_to_sequence : dw .loop_point_1438

.subseq_145F:
	db !set_adsr, $DF, $88
	db $8E, $10
	db $8E, $10
	db $8E, $10
	db $8E, $0A
	db $8E, $06
	db $8E, $10
	db $8E, $10
	db $8E, $10
	db $8E, $0A
	db $8E, $06
	db $8E, $10
	db $8E, $10
	db $8E, $10
	db $8E, $0A
	db $8E, $06
	db $8A, $10
	db $8A, $10
	db $89, $10
	db $89, $0A
	db $8D, $06
	db !return_from_sub

.subseq_148B:
	db !set_adsr, $DF, $E2
	db $89, $10
	db $89, $10
	db $89, $0A
	db $89, $06
	db $87, $0A
	db $88, $06
	db !set_adsr, $DF, $E2
	db $89, $10
	db $89, $10
	db $89, $0A
	db $89, $06
	db !set_adsr, $FF, $50
	db $93, $05
	db $94, $05
	db $95, $06
	db !set_adsr, $DF, $E2
	db $89, $10
	db $89, $10
	db $89, $10
	db $89, $0A
	db $89, $10
	db $89, $06
	db $89, $10
	db $89, $0A
	db $89, $06
	db $86, $05
	db $87, $05
	db $88, $06
	db !return_from_sub

.seq_14CA:
	db !play_subsequence : dw .subseq_1805
	db $80, $16
	db !echo_on
.loop_point_14D0:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $18, $20
	db !set_adsr, $DE, $51
	db !loop_subsequence, $02 : dw .subseq_1540
	db !change_instr_pitch, $FC
	db !loop_subsequence, $02 : dw .subseq_150E
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $0A, $1C
	db !set_adsr, $9B, $A8
	db $9D, $E0
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_adsr, $DE, $51
	db !set_volume_l_and_r, $18, $20
	db $9D, $08
	db $80, $02
	db $9D, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9D, $09
	db !jump_to_sequence : dw .loop_point_14D0

.subseq_150E:
	db !loop_subsequence, $03 : dw .subseq_152C
	db !loop_subsequence, $01 : dw .subseq_151F
	db !change_instr_pitch_rel, $FF
	db !loop_subsequence, $01 : dw .subseq_151F
	db !change_instr_pitch_rel, $01
	db !return_from_sub

.subseq_151F:
	db $80, $0A
	db !set_volume_l_and_r, $18, $20
	db $9D, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9D, $09
	db !return_from_sub

.subseq_152C:
	db !set_volume_l_and_r, $18, $20
	db $9D, $18
	db $80, $02
	db $9D, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9D, $0D
	db !set_volume_l_and_r, $04, $06
	db $9D, $0C
	db !return_from_sub

.subseq_1540:
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $99, $14
	db $80, $02
	db $9A, $0C
	db !set_volume_l_and_r, $0A, $08
	db $9A, $0C
	db !set_volume_l_and_r, $04, $06
	db $9A, $08
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $99, $14
	db $80, $02
	db $9A, $0C
	db !set_volume_l_and_r, $0A, $08
	db $9A, $0C
	db !set_volume_l_and_r, $04, $06
	db $9A, $08
	db $80, $0A
	db !set_volume_l_and_r, $18, $20
	db $99, $14
	db $80, $02
	db $9A, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9A, $0D
	db !set_volume_l_and_r, $18, $20
	db $9C, $14
	db $80, $02
	db $9A, $0E
	db $80, $02
	db $99, $0A
	db $9A, $0C
	db !set_volume_l_and_r, $0A, $08
	db $9A, $0A
	db !return_from_sub

.seq_158F:
	db !play_subsequence : dw .subseq_1805
	db $80, $16
	db !echo_on
.loop_point_1595:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $18, $20
	db !set_adsr, $DE, $51
	db !loop_subsequence, $02 : dw .subseq_15E4
	db !loop_subsequence, $02 : dw .subseq_15D1
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $1C, $0A
	db !set_adsr, $9B, $A8
	db $9A, $E0
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_adsr, $DE, $51
	db !set_volume_l_and_r, $18, $20
	db $9A, $08
	db $80, $02
	db $9A, $0D
	db !set_volume_l_and_r, $0A, $08
	db $9A, $09
	db !jump_to_sequence : dw .loop_point_1595

.subseq_15D1:
	db !change_instr_pitch_rel, $FD
	db !loop_subsequence, $03 : dw .subseq_152C
	db !loop_subsequence, $01 : dw .subseq_151F
	db !change_instr_pitch_rel, $FE
	db !loop_subsequence, $01 : dw .subseq_151F
	db !change_instr_pitch_rel, $05
	db !return_from_sub

.subseq_15E4:
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $93, $14
	db $80, $02
	db $93, $0C
	db !set_volume_l_and_r, $0A, $08
	db $93, $0C
	db !set_volume_l_and_r, $04, $06
	db $93, $08
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $93, $14
	db $80, $02
	db $93, $0C
	db !set_volume_l_and_r, $0A, $08
	db $93, $0C
	db !set_volume_l_and_r, $04, $06
	db $93, $08
	db $80, $0A
	db !set_volume_l_and_r, $18, $20
	db $93, $14
	db $80, $02
	db $93, $0D
	db !set_volume_l_and_r, $0A, $08
	db $93, $0D
	db !set_volume_l_and_r, $18, $20
	db $99, $14
	db $80, $02
	db $97, $0E
	db $80, $02
	db $95, $0A
	db $97, $0C
	db !set_volume_l_and_r, $0A, $08
	db $97, $0A
	db !return_from_sub

.seq_1633:
	db !play_subsequence : dw .subseq_1805
	db $80, $16
	db !echo_on
.loop_point_1639:
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_volume_l_and_r, $18, $20
	db !set_adsr, $DE, $51
	db !loop_subsequence, $02 : dw .subseq_1696
	db !loop_subsequence, $02 : dw .subseq_1675
	db !set_instrument, $15
	db !change_instr_pitch, $FC
	db !fine_tune, $03
	db !set_volume_l_and_r, $0A, $1C
	db !set_adsr, $9B, $A8
	db $96, $E0
	db !set_instrument, $A2
	db !change_instr_pitch, $08
	db !fine_tune, $F6
	db !set_adsr, $DE, $51
	db !set_volume_l_and_r, $18, $20
	db $96, $08
	db $80, $02
	db $96, $0D
	db !set_volume_l_and_r, $0A, $08
	db $96, $09
	db !jump_to_sequence : dw .loop_point_1639

.subseq_1675:
	db !change_instr_pitch_rel, $F8
	db !loop_subsequence, $01 : dw .subseq_152C
	db !change_instr_pitch_rel, $01
	db !loop_subsequence, $01 : dw .subseq_152C
	db !change_instr_pitch_rel, $01
	db !loop_subsequence, $01 : dw .subseq_152C
	db !change_instr_pitch_rel, $FE
	db !loop_subsequence, $01 : dw .subseq_151F
	db !change_instr_pitch_rel, $FE
	db !loop_subsequence, $01 : dw .subseq_151F
	db !change_instr_pitch_rel, $0A
	db !return_from_sub

.subseq_1696:
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $90, $14
	db $80, $02
	db $90, $0C
	db !set_volume_l_and_r, $0A, $08
	db $90, $0C
	db !set_volume_l_and_r, $04, $06
	db $90, $08
	db !set_volume_l_and_r, $18, $20
	db $80, $0A
	db $90, $14
	db $80, $02
	db $90, $0C
	db !set_volume_l_and_r, $0A, $08
	db $90, $0C
	db !set_volume_l_and_r, $04, $06
	db $90, $08
	db $80, $0A
	db !set_volume_l_and_r, $18, $20
	db $90, $14
	db $80, $02
	db $90, $0D
	db !set_volume_l_and_r, $0A, $08
	db $90, $0D
	db !set_volume_l_and_r, $18, $20
	db $93, $14
	db $80, $02
	db $93, $0E
	db $80, $02
	db $93, $0A
	db $93, $0C
	db !set_volume_l_and_r, $0A, $08
	db $93, $0A
	db !return_from_sub

.seq_16E5:
	db !play_subsequence : dw .subseq_1805
	db !echo_on
.loop_point_16E9:
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $9F, $B1
	db $93, $06
	db $99, $0A
	db $9A, $06
	db !loop_subsequence, $01 : dw .subseq_1787
	db $95, $0A
	db $97, $06
	db $99, $0A
	db $9A, $06
	db !loop_subsequence, $01 : dw .subseq_1787
	db $8D, $0A
	db $8E, $06
	db $90, $0A
	db $80, $06
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $9F, $A1
	db !loop_subsequence, $02 : dw .subseq_173E
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !loop_subsequence, $01 : dw .subseq_1732
	db $96, $6A
	db !jump_to_sequence : dw .loop_point_16E9

.subseq_1732:
	db !set_adsr, $CE, $47
	db $9D, $30
	db $9C, $10
	db $9A, $30
	db $98, $10
	db !return_from_sub

.subseq_173E:
	db $80, $10
	db $9A, $0E
	db $80, $02
	db $9D, $07
	db $80, $03
	db $9A, $12
	db $80, $04
	db $9D, $0E
	db $80, $02
	db $9A, $09
	db $80, $01
	db $9D, $12
	db $80, $04
	db $9D, $09
	db $80, $01
	db $9D, $08
	db $80, $02
	db $80, $0C
	db $9A, $0E
	db $80, $02
	db $9D, $07
	db $80, $03
	db $9A, $0E
	db $80, $02
	db $9D, $0E
	db $80, $02
	db $9D, $05
	db $80, $01
	db $9F, $08
	db $80, $02
	db $A1, $05
	db $80, $01
	db $9F, $08
	db $80, $02
	db $9C, $12
	db $80, $04
	db !return_from_sub

.subseq_1787:
	db $99, $0A
	db $95, $0E
	db $80, $02
	db $93, $10
	db $80, $06
	db $99, $0A
	db $9A, $06
	db $99, $0A
	db $95, $0E
	db $80, $02
	db $93, $10
	db $93, $06
	db $99, $0A
	db $9A, $06
	db $99, $0A
	db $95, $0E
	db $80, $02
	db $93, $10
	db $93, $06
	db $97, $0A
	db $95, $10
	db $90, $10
	db $90, $06
	db !return_from_sub

.seq_17B6:
	db !play_subsequence : dw .subseq_1805
	db !echo_on
.loop_point_17BA:
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $32, $28
	db !set_adsr, $9F, $B1
	db $93, $06
	db $99, $0A
	db $9A, $06
	db !loop_subsequence, $01 : dw .subseq_1787
	db $95, $0A
	db $97, $06
	db $99, $0A
	db $9A, $06
	db !loop_subsequence, $01 : dw .subseq_1787
	db $8D, $0A
	db $8E, $06
	db $90, $0A
	db $80, $06
	db $80, $0A
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $11, $0D
	db !set_adsr, $9F, $A1
	db !loop_subsequence, $02 : dw .subseq_173E
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !loop_subsequence, $01 : dw .subseq_1732
	db $96, $60
	db !jump_to_sequence : dw .loop_point_17BA

.subseq_1805:
	db $80, $10
	db !return_from_sub

.seq_1808:
	db !set_echo, $3A, $21, $21
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !set_master_volume_indirect, $52
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A6
	db !set_volume_l_and_r, $58, $58
	db !set_adsr, $9F, $AB
	db $90, $03
	db $91, $03
	db $92, $09
	db $91, $07
	db $90, $09
	db $8E, $10
	db $8D, $07
	db $8B, $10
	db $86, $20
	db !end_sequence

.seq_1836:
	db !set_instrument, $8D
	db !change_instr_pitch, $00
	db !fine_tune, $00
	db !set_volume_l_and_r, $1E, $50
	db !set_adsr, $DF, $91
	db $80, $06
	db $99, $10
	db $99, $09
	db $99, $07
	db $99, $09
	db $99, $07
	db $99, $10
	db $99, $20
	db !end_sequence

.seq_1853:
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !echo_on
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $9F, $AB
	db !vibrato_with_delay, $02, $02, $08, $11
	db $9C, $03
	db $9D, $03
	db $9E, $09
	db $9D, $07
	db $9C, $09
	db $9A, $10
	db $99, $07
	db $97, $10
	db $95, $20
	db !end_sequence

.seq_1878:
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !echo_on
	db !set_volume_l_and_r, $0B, $11
	db !set_adsr, $9F, $AB
	db !vibrato_with_delay, $02, $02, $08, $11
	db $80, $0B
	db $9C, $03
	db $9D, $03
	db $9E, $09
	db $9D, $07
	db $9C, $09
	db $9A, $10
	db $99, $07
	db $97, $10
	db $95, $20
	db !end_sequence

.seq_189F:
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !change_instr_pitch_rel, $F4
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $9F, $B1
	db $9C, $03
	db $9D, $03
	db $9E, $09
	db $9D, $07
	db $9C, $09
	db $9A, $10
	db $99, $07
	db $97, $10
	db $99, $20
	db !end_sequence

.seq_18C0:
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $19, $0A
	db !set_adsr, $EB, $EE
	db !echo_on
	db $80, $06
	db $9E, $0E
	db $80, $02
	db $9E, $07
	db $A1, $14
	db $80, $03
	db $A1, $10
	db $A1, $20
	db !end_sequence

.seq_18DE:
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $19, $0A
	db !set_adsr, $EB, $EE
	db !echo_on
	db $80, $06
	db $99, $0E
	db $80, $02
	db $99, $07
	db $9A, $14
	db $80, $04
	db $9A, $10
	db $9E, $20
	db !end_sequence

.seq_18FC:
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $19, $0A
	db !set_adsr, $EB, $EE
	db !echo_on
	db $80, $06
	db $95, $0E
	db $80, $02
	db $95, $07
	db $97, $14
	db $80, $03
	db $97, $10
	db $99, $20
	db !end_sequence

.seq_191A:
	db !set_echo, $3A, $0F, $0F
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !set_master_volume_indirect, $52
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A6
	db !set_volume_l_and_r, $58, $58
	db !set_adsr, $9F, $AB
	db !echo_off
	db $80, $07
	db $8B, $10
	db $8B, $10
	db $8D, $10
	db $8D, $09
	db $86, $17
	db $86, $20
	db !end_sequence

.seq_1945:
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !echo_on
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $9F, $AB
	db $9E, $07
	db $9B, $09
	db $9E, $07
	db $A0, $09
	db $A1, $07
	db $A2, $09
	db $A5, $07
	db $A7, $09
	db $AA, $10
	db $80, $05
	db $A7, $02
	db $A8, $20
	db !end_sequence

.seq_196B:
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !echo_on
	db !set_volume_l_and_r, $0B, $11
	db !set_adsr, $9F, $AB
	db $80, $0B
	db $9E, $07
	db $9B, $09
	db $9E, $07
	db $A0, $09
	db $A1, $07
	db $A2, $09
	db $A5, $07
	db $A7, $09
	db $AA, $10
	db $80, $05
	db $A8, $02
	db $A8, $20
	db !end_sequence

.seq_1993:
	db !echo_off
	db !set_instrument, $A5
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $8F, $F5
	db $99, $07
	db !set_instrument, $00
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $8F, $F5
	db $9A, $10
	db !set_instrument, $A5
	db !set_volume_l_and_r, $3C, $46
	db !set_adsr, $8F, $F5
	db !echo_on
	db $99, $10
	db !echo_off
	db !set_instrument, $00
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $8F, $F5
	db $9A, $09
	db !set_instrument, $A5
	db !set_volume_l_and_r, $3C, $46
	db !set_adsr, $8F, $F5
	db !echo_on
	db $99, $07
	db $99, $09
	db $9A, $17
	db $99, $09
	db $99, $0F
	db !set_instrument, $36
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !set_adsr, $9F, $B4
	db !set_volume_l_and_r, $14, $2D
	db $92, $03
	db !set_volume_l_and_r, $28, $3C
	db $92, $03
	db !set_volume_l_and_r, $3C, $46
	db $92, $03
	db !set_volume_l_and_r, $50, $5A
	db $8E, $30
	db !echo_off
	db !end_sequence

.seq_19F2:
	db !echo_off
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $9F, $B1
	db $9E, $07
	db $9B, $09
	db $9E, $07
	db $A0, $09
	db $A1, $07
	db $A2, $09
	db $A5, $07
	db $A7, $09
	db $AA, $10
	db $80, $05
	db $A7, $02
	db $A8, $20
	db !end_sequence

.seq_1A18:
	db !echo_off
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db $80, $07
	db $9B, $09
	db $80, $07
	db $9B, $09
	db $80, $07
	db $9D, $09
	db $80, $07
	db $9D, $07
	db $80, $02
	db $9E, $10
	db $80, $07
	db $99, $20
	db !end_sequence

.seq_1A3E:
	db !echo_off
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db $80, $07
	db $97, $09
	db $80, $07
	db $95, $09
	db $80, $07
	db $97, $09
	db $80, $07
	db $97, $07
	db $80, $02
	db $96, $10
	db $80, $07
	db $96, $20
	db !end_sequence

.seq_1A64:
	db !echo_off
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $11, $0B
	db !set_adsr, $9F, $B1
	db $80, $0B
	db $9E, $07
	db $9B, $09
	db $9E, $07
	db $A0, $09
	db $A1, $07
	db $A2, $09
	db $A5, $07
	db $A7, $09
	db $AA, $10
	db $80, $05
	db $A7, $02
	db $A8, $20
	db !end_sequence

.seq_1A8C:
	db !set_master_volume_indirect, $50
	db !set_echo, $3A, $21, $21
	db !set_fir, $7F, $01, $01, $01, $01, $01, $01, $01
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $9F, $B1
	db !echo_on
.loop_point_1AA8:
	db $99, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9D, $07
	db $9B, $09
	db $99, $07
	db $98, $09
	db $95, $07
	db $96, $19
	db !set_volume_l_and_r, $1E, $0A
	db $A0, $04
	db $A1, $03
	db !set_adsr, $8B, $E1
	db !vibrato_with_delay, $04, $03, $17, $04
	db !pitch_slide_up, $0B, $01, $1C, $1F, $00
	db $A2, $30
	db !pitch_slide_off
	db !vibrato_off
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $1C, $11
	db !set_adsr, $9F, $B1
	db $80, $07
	db $96, $09
	db $99, $07
	db $9C, $09
	db $9D, $07
	db $80, $09
	db $95, $07
	db $96, $09
	db $99, $07
	db $9C, $09
	db $9D, $10
	db $80, $20
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $9F, $B1
	db $91, $09
	db $96, $07
	db $98, $09
	db $99, $07
	db $98, $09
	db $96, $07
	db $98, $10
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8B, $E1
	db $96, $07
	db $98, $09
	db !pitch_slide_up, $00, $01, $06, $50, $00
	db $98, $07
	db !pitch_slide_up, $01, $01, $04, $46, $00
	db $96, $09
	db !pitch_slide_off
	db $96, $07
	db $95, $10
	db $80, $10
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $1C, $11
	db !set_adsr, $9F, $B1
	db $95, $09
	db $96, $07
	db $98, $09
	db $9B, $07
	db $80, $09
	db $91, $07
	db $95, $09
	db $96, $07
	db $98, $09
	db $9B, $10
	db $80, $09
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $9F, $B1
	db $98, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9B, $07
	db $99, $09
	db $98, $07
	db $99, $10
	db !set_volume_l_and_r, $0E, $17
	db !set_adsr, $8F, $E1
	db !change_instr_pitch, $F9
	db $91, $07
	db $96, $09
	db $99, $07
	db !pitch_slide_up, $01, $03, $07, $1C, $00
	db $9B, $10
	db $9B, $10
	db !pitch_slide_off
	db $99, $09
	db $96, $07
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $1C, $12
	db !set_adsr, $9E, $CB
	db !play_subsequence : dw .subseq_1DC4
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $14, $0A
	db !set_adsr, $8B, $E1
	db $96, $07
	db $98, $09
	db !pitch_slide_up, $00, $01, $06, $50, $00
	db $98, $07
	db !pitch_slide_up, $01, $01, $04, $46, $00
	db $96, $09
	db !pitch_slide_off
	db $96, $07
	db $95, $10
	db $80, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $1C, $12
	db !set_adsr, $9E, $CB
	db !play_subsequence : dw .subseq_1DA7
	db $96, $02
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $9F, $B1
	db $98, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9B, $07
	db $99, $09
	db $98, $07
	db $99, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $17, $11
	db !set_adsr, $9E, $CB
	db $9D, $07
	db $A0, $05
	db $A1, $05
	db $A2, $06
	db $9D, $09
	db $9C, $07
	db $9B, $02
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $32, $1E
	db !set_adsr, $9F, $B1
	db !jump_to_sequence : dw .loop_point_1AA8

.seq_1C23:
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $9F, $B1
	db !echo_on
.loop_point_1C30:
	db $99, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9D, $07
	db $9B, $09
	db $99, $07
	db $98, $09
	db $95, $07
	db $96, $09
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_volume_l_and_r, $3C, $50
	db !set_adsr, $8F, $E0
	db $A2, $10
	db $A0, $04
	db $A1, $03
	db $A2, $08
	db !set_volume_l_and_r, $14, $1E
	db $A2, $08
	db !set_volume_l_and_r, $0A, $0F
	db $A2, $08
	db !set_volume_l_and_r, $04, $07
	db $A2, $08
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $28, $46
	db !set_adsr, $9F, $B1
	db $80, $10
	db $96, $09
	db $99, $07
	db $9C, $09
	db $9D, $07
	db $80, $09
	db $95, $07
	db $96, $09
	db $99, $07
	db $9C, $09
	db $9D, $10
	db $80, $27
	db $96, $09
	db $99, $07
	db $9C, $09
	db $9D, $07
	db $9B, $09
	db $99, $07
	db $9B, $09
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8B, $E1
	db $96, $07
	db $98, $09
	db !pitch_slide_up, $00, $01, $06, $50, $00
	db $98, $07
	db !pitch_slide_up, $01, $01, $04, $46, $00
	db $96, $09
	db !pitch_slide_off
	db $96, $07
	db $95, $10
	db $80, $10
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $28, $46
	db !set_adsr, $9F, $B1
	db $95, $09
	db $96, $07
	db $98, $09
	db $9B, $07
	db $80, $09
	db $91, $07
	db $95, $09
	db $96, $07
	db $98, $09
	db $9B, $10
	db $80, $10
	db $98, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9B, $07
	db $99, $09
	db $98, $07
	db $99, $09
	db !set_instrument, $B6
	db !change_instr_pitch, $F9
	db !fine_tune, $EA
	db !set_volume_l_and_r, $3C, $28
	db !set_adsr, $8F, $E1
	db $91, $07
	db $96, $09
	db $99, $07
	db !pitch_slide_up, $01, $03, $07, $1C, $00
	db $9B, $10
	db $9B, $10
	db !pitch_slide_off
	db $99, $09
	db $96, $07
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $28, $3C
	db !set_adsr, $9E, $CE
	db !play_subsequence : dw .subseq_1DC4
	db !set_instrument, $B6
	db !change_instr_pitch, $05
	db !fine_tune, $EA
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8B, $E1
	db $96, $07
	db $98, $09
	db !pitch_slide_up, $00, $01, $06, $50, $00
	db $98, $07
	db !pitch_slide_up, $01, $01, $04, $46, $00
	db $96, $09
	db !pitch_slide_off
	db $96, $07
	db $95, $10
	db $80, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $28, $3C
	db !set_adsr, $9E, $CE
	db !play_subsequence : dw .subseq_1DA7
	db $96, $09
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $9F, $B1
	db $98, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9D, $07
	db $9C, $09
	db $9B, $07
	db $99, $09
	db $98, $07
	db $99, $09
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $28, $32
	db !set_adsr, $9E, $CE
	db $9D, $07
	db $A0, $05
	db $A1, $05
	db $A2, $06
	db $9D, $09
	db $9C, $07
	db $9B, $09
	db !set_instrument, $B7
	db !change_instr_pitch, $01
	db !fine_tune, $EC
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $9F, $B1
	db !jump_to_sequence : dw .loop_point_1C30

.subseq_1DA7:
	db !change_instr_pitch_rel, $0C
	db $95, $06
	db $96, $05
	db $97, $05
	db $98, $09
	db $9B, $07
	db $9C, $09
	db $9D, $07
	db $A1, $09
	db $9D, $07
	db $9C, $09
	db $9D, $07
	db $9B, $09
	db $98, $07
	db !return_from_sub

.subseq_1DC4:
	db !change_instr_pitch_rel, $0C
	db $96, $09
	db $99, $07
	db $9C, $09
	db $9D, $07
	db $80, $0B
	db $9C, $03
	db $9D, $02
	db $A2, $10
	db $9B, $10
	db $99, $09
	db $96, $07
	db $80, $09
	db $9B, $04
	db $9C, $03
	db $9D, $06
	db $99, $05
	db $9C, $05
	db $9D, $05
	db $99, $05
	db $9C, $06
	db $A2, $05
	db $99, $06
	db $9C, $05
	db $A2, $06
	db $9B, $05
	db $99, $05
	db $9B, $09
	db !return_from_sub

.seq_1DFD:
	db !set_instrument, $B8
	db !change_instr_pitch, $0C
	db !fine_tune, $A6
	db !set_volume_l_and_r, $58, $58
	db !set_adsr, $9F, $AB
.loop_point_1E09:
	db $85, $07
	db $86, $10
	db $86, $10
	db $88, $10
	db $89, $10
	db $8A, $09
	db $8A, $07
	db $85, $10
	db $86, $10
	db $88, $09
	db $89, $07
	db $8A, $10
	db $8A, $10
	db $85, $10
	db $85, $10
	db $8A, $09
	db $8A, $07
	db $85, $10
	db $86, $10
	db $88, $10
	db $8A, $10
	db $8A, $10
	db $8D, $10
	db $8D, $10
	db $8C, $09
	db $8C, $07
	db $89, $10
	db $8A, $10
	db $8C, $10
	db $85, $10
	db $89, $10
	db $8A, $10
	db $8C, $10
	db $85, $09
	db $85, $07
	db $89, $10
	db $8A, $10
	db $8C, $10
	db $85, $10
	db $89, $10
	db $8A, $10
	db $8C, $10
	db $8A, $09
	db $8A, $07
	db $85, $10
	db $86, $10
	db $88, $10
	db $8A, $10
	db $8A, $10
	db $85, $10
	db $85, $10
	db $8A, $09
	db $8A, $07
	db $85, $10
	db $86, $10
	db $88, $10
	db $8A, $10
	db $8A, $10
	db $8D, $10
	db $8D, $10
	db $8C, $09
	db $8C, $07
	db $89, $10
	db $8A, $10
	db $8C, $10
	db $85, $10
	db $89, $10
	db $8A, $10
	db $8C, $10
	db $85, $09
	db $85, $07
	db $89, $10
	db $8A, $10
	db $8C, $10
	db $86, $10
	db $86, $10
	db $89, $10
	db $89, $10
	db $8A, $09
	db $8A, $07
	db $85, $10
	db $86, $10
	db $88, $09
	db !jump_to_sequence : dw .loop_point_1E09

.seq_1EB2:
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $AF, $8B
.loop_point_1EBE:
	db $80, $07
	db $9C, $10
	db $9C, $10
	db $9B, $19
	db $9B, $07
	db $9D, $20
	db $80, $20
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db !echo_on
	db $80, $09
	db $9D, $07
	db $80, $10
	db $9C, $09
	db $80, $07
	db $80, $10
	db $80, $09
	db $9D, $07
	db $80, $10
	db $9C, $09
	db $80, $07
	db $80, $09
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8F, $E0
	db $9D, $07
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $F8, $E0
	db $99, $20
	db $99, $20
	db $98, $09
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8E, $E0
	db $9B, $09
	db $80, $07
	db $80, $07
	db $9B, $09
	db $80, $07
	db $9B, $09
	db $80, $07
	db !set_adsr, $FA, $E0
	db $80, $09
	db $99, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $98, $09
	db $80, $07
	db $80, $10
	db !set_adsr, $FA, $E0
	db $80, $09
	db $98, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $99, $09
	db $80, $07
	db $80, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $AF, $8E
	db $9D, $10
	db $9D, $10
	db $9B, $10
	db $9B, $09
	db $99, $10
	db $99, $17
	db $99, $10
	db $99, $10
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db $80, $09
	db $9D, $07
	db $80, $10
	db $9C, $09
	db $80, $07
	db $80, $10
	db $80, $09
	db $9D, $07
	db $80, $10
	db $9C, $09
	db $80, $07
	db $80, $09
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8F, $E0
	db $9D, $07
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $F8, $E0
	db $99, $20
	db $99, $20
	db $98, $09
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8E, $E0
	db $9B, $09
	db $80, $07
	db $80, $07
	db $9B, $09
	db $80, $07
	db $9B, $09
	db $80, $07
	db !set_adsr, $FA, $E0
	db $80, $09
	db $99, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $98, $09
	db $80, $07
	db $80, $10
	db !set_adsr, $FA, $E0
	db $80, $09
	db $98, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $99, $09
	db $80, $07
	db $80, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $AF, $8B
	db $9C, $10
	db $9C, $10
	db $9B, $19
	db $9B, $07
	db $9D, $39
	db !jump_to_sequence : dw .loop_point_1EBE

.seq_1FFA:
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_vol_single_val, $1E
	db !set_adsr, $AE, $8B
.loop_point_2005:
	db $80, $07
	db $99, $10
	db $99, $10
	db $98, $19
	db $98, $07
	db $99, $20
	db $80, $20
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db !echo_on
	db $80, $09
	db $99, $07
	db $80, $10
	db $99, $09
	db $80, $07
	db $80, $10
	db $80, $09
	db $99, $07
	db $80, $10
	db $99, $09
	db $80, $07
	db $80, $09
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8F, $E0
	db $96, $07
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $F8, $E0
	db $96, $20
	db $96, $20
	db $96, $09
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8E, $E0
	db $98, $09
	db $80, $07
	db $80, $07
	db $98, $09
	db $80, $07
	db $98, $09
	db $80, $07
	db !set_adsr, $FA, $E0
	db $80, $09
	db $95, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $95, $09
	db $80, $07
	db $80, $10
	db !set_adsr, $FA, $E0
	db $80, $09
	db $95, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $95, $09
	db $80, $07
	db $80, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $AF, $8E
	db $99, $10
	db $99, $10
	db $98, $10
	db $98, $09
	db $96, $10
	db $96, $17
	db $96, $10
	db $96, $10
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db $80, $09
	db $99, $07
	db $80, $10
	db $99, $09
	db $80, $07
	db $80, $10
	db $80, $09
	db $99, $07
	db $80, $10
	db $99, $09
	db $80, $07
	db $80, $09
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8F, $E0
	db $96, $07
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $F8, $E0
	db $96, $20
	db $96, $20
	db $96, $09
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8E, $E0
	db $98, $09
	db $80, $07
	db $80, $07
	db $98, $09
	db $80, $07
	db $98, $09
	db $80, $07
	db !set_adsr, $FA, $E0
	db $80, $09
	db $95, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $95, $09
	db $80, $07
	db $80, $10
	db !set_adsr, $FA, $E0
	db $80, $09
	db $95, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $95, $09
	db $80, $07
	db $80, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $1E, $1E
	db !set_adsr, $AE, $8B
	db $99, $10
	db $99, $10
	db $98, $19
	db $98, $07
	db $99, $39
	db !jump_to_sequence : dw .loop_point_2005

.seq_2141:
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $AF, $8B
.loop_point_214D:
	db $80, $07
	db $96, $10
	db $96, $10
	db $95, $19
	db $95, $07
	db $96, $20
	db $80, $20
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8E, $E0
	db !echo_on
	db $80, $09
	db $96, $07
	db $80, $10
	db $96, $09
	db $80, $07
	db $80, $10
	db $80, $09
	db $96, $07
	db $80, $10
	db $96, $09
	db $80, $07
	db $80, $09
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8F, $E0
	db $A2, $07
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $F8, $E0
	db $92, $20
	db $91, $20
	db $8F, $09
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8E, $E0
	db $95, $09
	db $80, $07
	db $80, $07
	db $95, $09
	db $80, $07
	db $95, $09
	db $80, $07
	db !set_adsr, $FA, $E0
	db $80, $09
	db $9B, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $9B, $09
	db $80, $07
	db $80, $10
	db !set_adsr, $FA, $E0
	db $80, $09
	db $9B, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $9B, $09
	db $80, $07
	db $80, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $14, $28
	db !set_adsr, $AF, $8E
	db $95, $10
	db $95, $10
	db $95, $10
	db $95, $09
	db $91, $10
	db $91, $17
	db $91, $10
	db $91, $10
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8F, $E0
	db $80, $09
	db $96, $07
	db $80, $10
	db $96, $09
	db $80, $07
	db $80, $10
	db $80, $09
	db $96, $07
	db $80, $10
	db $96, $09
	db $80, $07
	db $80, $09
	db !set_instrument, $B5
	db !change_instr_pitch, $FE
	db !fine_tune, $EF
	db !set_volume_l_and_r, $1E, $32
	db !set_adsr, $8F, $E0
	db $A2, $07
	db !set_instrument, $33
	db !change_instr_pitch, $FC
	db !fine_tune, $19
	db !set_volume_l_and_r, $1E, $14
	db !set_adsr, $F8, $E0
	db $92, $20
	db $91, $20
	db $8F, $09
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $8E, $E0
	db $95, $09
	db $80, $07
	db $80, $07
	db $95, $09
	db $80, $07
	db $95, $09
	db $80, $07
	db !set_adsr, $FA, $E0
	db $80, $09
	db $9B, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $9B, $09
	db $80, $07
	db $80, $10
	db !set_adsr, $FA, $E0
	db $80, $09
	db $9B, $10
	db $80, $07
	db !set_adsr, $8F, $E0
	db $9B, $09
	db $80, $07
	db $80, $10
	db !set_instrument, $B3
	db !change_instr_pitch, $FC
	db !fine_tune, $F6
	db !set_volume_l_and_r, $28, $14
	db !set_adsr, $AF, $8B
	db $96, $10
	db $96, $10
	db $95, $19
	db $95, $07
	db $96, $39
	db !jump_to_sequence : dw .loop_point_214D

.seq_2289:
	db !set_instrument, $A5
	db !set_volume_l_and_r, $28, $28
	db !set_adsr, $8F, $F5
	db $99, $07
	db !set_instrument, $00
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $8F, $F5
	db $9A, $09
	db !set_instrument, $A5
	db !set_volume_l_and_r, $3C, $46
	db !set_adsr, $8F, $F5
	db !echo_on
	db $99, $07
	db !echo_off
	db !set_instrument, $00
	db !set_volume_l_and_r, $40, $40
	db !set_adsr, $8F, $F5
	db $9A, $10
.loop_point_22B3:
	db !loop_subsequence, $02 : dw .subseq_2376
	db !play_subsequence : dw .subseq_2340
	db !play_subsequence : dw .subseq_2376
	db !loop_subsequence, $02 : dw .subseq_2376
	db !play_subsequence : dw .subseq_22F0
	db !loop_subsequence, $05 : dw .subseq_2376
	db !loop_subsequence, $06 : dw .subseq_2376
	db !play_subsequence : dw .subseq_2310
	db !play_subsequence : dw .subseq_2376
	db !loop_subsequence, $02 : dw .subseq_2376
	db !play_subsequence : dw .subseq_22F0
	db !loop_subsequence, $03 : dw .subseq_2376
	db !play_subsequence : dw .subseq_2340
	db !play_subsequence : dw .subseq_2376
	db !loop_subsequence, $06 : dw .subseq_2376
	db !play_subsequence : dw .subseq_2310
	db !play_subsequence : dw .subseq_2376
	db !jump_to_sequence : dw .loop_point_22B3

.subseq_22F0:
	db !set_instrument, $00
	db !set_vol_single_val, $40
	db !set_adsr, $8F, $F5
	db $9A, $09
	db !set_instrument, $A5
	db !set_adsr, $8F, $F5
	db !echo_on
	db !set_volume_l_and_r, $28, $32
	db $99, $07
	db !set_volume_l_and_r, $3C, $46
	db $9A, $09
	db !set_volume_l_and_r, $4B, $55
	db $9E, $07
	db !echo_off
	db !return_from_sub

.subseq_2310:
	db !set_instrument, $00
	db !set_vol_single_val, $40
	db !set_adsr, $8F, $F5
	db $9A, $09
	db !set_instrument, $36
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !set_adsr, $9F, $A8
	db !set_volume_l_and_r, $5A, $32
	db $96, $07
	db !pitch_slide_off
	db !set_instrument, $00
	db !set_vol_single_val, $40
	db !set_adsr, $8F, $F5
	db $9A, $09
	db !set_instrument, $A5
	db !set_volume_l_and_r, $46, $50
	db !set_adsr, $8F, $F5
	db !echo_on
	db $9A, $07
	db !echo_off
	db !return_from_sub

.subseq_2340:
	db !set_instrument, $00
	db !set_vol_single_val, $40
	db !set_adsr, $8F, $F5
	db $9A, $07
	db !set_instrument, $A5
	db !set_adsr, $8F, $F5
	db !echo_on
	db !set_volume_l_and_r, $0A, $14
	db $99, $03
	db !set_volume_l_and_r, $14, $1E
	db $99, $03
	db !set_volume_l_and_r, $1E, $28
	db $99, $03
	db !set_volume_l_and_r, $3C, $46
	db $99, $09
	db !echo_off
	db !set_instrument, $36
	db !pitch_slide_down, $02, $01, $16, $0B, $00
	db !set_adsr, $9F, $A8
	db !set_volume_l_and_r, $5A, $32
	db $96, $07
	db !pitch_slide_off
	db !return_from_sub

.subseq_2376:
	db !set_instrument, $00
	db !set_vol_single_val, $40
	db !set_adsr, $8F, $F5
	db $9A, $10
	db !set_instrument, $A5
	db !set_volume_l_and_r, $3C, $46
	db !set_adsr, $8F, $F5
	db !echo_on
	db $99, $10
	db !echo_off
	db !return_from_sub

.seq_238C:
	db !set_instrument, $8D
	db !change_instr_pitch, $00
	db !set_volume_l_and_r, $3C, $28
	db !set_adsr, $FF, $4B
	db $99, $07
.loop_point_2398:
	db $99, $10
	db $99, $09
	db $99, $07
	db !jump_to_sequence : dw .loop_point_2398

base off
arch 65816
.end: