;as a convention, any unused address will be named UNUSED_<address> and treated as a single byte
;Most addresses shall be assumed 2 bytes unless otherwise noted.  Single byte addresses won't be specifically
;noted as their addresses will carry that point.
;Duplicate addresses imply an address withg multiple contexts.
spc_transaction = $00

current_song = $1C
stereo_select = $1E
NMI_pointer = $20
UNUSED_22 = $22
UNUSED_23 = $23
gameloop_pointer = $24

global_frame_counter = $2A
active_frame_counter = $2C
rng_result = $2E
rng_seed_1 = $2F
rng_seed_2 = $30
rng_seed_3 = $31
;I wont be labeling temp ram for now.  I have future plans for this
temp1 = $32
temp2 = $33
temp3 = $34
temp4 = $35
temp5 = $36
temp6 = $37
temp7 = $38
temp8 = $39
temp9 = $3A
temp10 = $3B
temp11 = $3C
temp12 = $3D
temp13 = $3E
temp14 = $3F
;the amount of temps here I have documented as 30, but I will reserve filling that out pending more evidence
;I suspect the latter are used rare enough that they may effectively be dedicated addresses

oam_size_index = $56

current_sprite = $64
UNKNOWN_66 = $66		;This is two bytes for some table at 16B2
alternate_sprite = $68
UNKNOWN_6A = $6A		;same as $66
current_player_mount = $6C

next_oam_slot = $70
