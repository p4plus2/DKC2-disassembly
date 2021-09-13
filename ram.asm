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

nmi_submode = $94
gameloop_submode = $96

level_number = $D3


;;;
;;; End direct page
;;;

stack_end = $0100
stack = $01FF
oam_table = $0200
struct oam $0200
	.position:
	.x:             skip 1
	.y:             skip 1
	.display:
	.tile:          skip 1
	.property:      skip 1
endstruct
struct oam_attribute $0400
	.size		skip 1
endstruct

;Note there is no released state for active player
player_1_held = $0502
player_1_pressed = $0504
player_1_released = $0506
player_2_held = $0508
player_2_pressed = $050A
player_2_released = $050C
player_active_held = $050E
player_active_pressed = $0510

screen_brightness = $0512
screen_fade_speed = $0513
screen_fade_timer = $0514
pending_dma_hdma_channels = $059B

intro_sparkle_x_position = $098F
intro_sparkle_y_position = $0991
