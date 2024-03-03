;as a convention, any unused address will be named UNUSED_<address> and treated as a single byte
;Most addresses shall be assumed 2 bytes unless otherwise noted.  Single byte addresses won't be specifically
;noted as their addresses will carry that point.
;Duplicate addresses imply an address withg multiple contexts.
;Temporaries are named after the address they point to rather than a sequence.
;Temporaries used for any significant context should have local reassignment
;Temporaries are generally any addres used in multi contexts.
spc_transaction = $00

current_song = $1C
stereo_select = $1E
NMI_pointer = $20
UNUSED_22 = $22
UNUSED_23 = $23
gamemode_pointer = $24

temp_26 = $26
temp_27 = $27
temp_28 = $28
temp_29 = $29

global_frame_counter = $2A
active_frame_counter = $2C
rng_result = $2E
rng_seed_1 = $2F
rng_seed_2 = $30
rng_seed_3 = $31

temp_32 = $32
temp_33 = $33
temp_34 = $34
temp_35 = $35
temp_36 = $36
temp_37 = $37
temp_38 = $38
temp_39 = $39
temp_3A = $3A
temp_3B = $3B
temp_3C = $3C
temp_3D = $3D
temp_3E = $3E
temp_3F = $3F
;the amount of temps here I have documented as 30, but I will reserve filling that out pending more evidence
;I suspect the latter are used rare enough that they may effectively be dedicated addresses

oam_size_index = $56


temp_5E = $5E
temp_5F = $5F
temp_60 = $60
temp_61 = $61

current_sprite = $64
UNKNOWN_66 = $66		;This is two bytes for some table at 16B2
alternate_sprite = $68
UNKNOWN_6A = $6A		;same as $66
current_player_mount = $6C

next_oam_slot = $70

nmi_submode = $94
gamemode_submode = $96

level_number = $D3


;;;
;;; End direct page
;;;

stack_end = $0100
stack = $01FF
oam_table = $0200
oam_attribute_table = $0400

;controller logic
;Note there is no released state for active player
player_1_held = $0502
player_1_pressed = $0504
player_1_released = $0506
player_2_held = $0508
player_2_pressed = $050A
player_2_released = $050C
player_active_held = $050E
player_active_pressed = $0510
player_active_pressed_high = $0511

;brightness control
screen_brightness = $0512
screen_fade_speed = $0513
screen_fade_timer = $0514

;level logic (starts at $0515)

active_kong_sprite = $0593
inactive_kong_sprite = $0597

pending_dma_hdma_channels = $059B

active_controller = $060F
file_select_selection = $0611
file_select_action = $0613
file_select_file_to_copy = $0615

language_select = $0617

piracy_string_result = $0907
enable_intro_bypass = $090F

intro_sparkle_x_position = $098F
intro_sparkle_y_position = $0991
player_skipped_demo = $099B

aux_sprite_table = $0D84
main_sprite_table = $0DE2
main_sprite_table_end = $0DE2+(sizeof(sprite)*24)

sprite_render_table = $16FE
sprite_render_table_end = $16FE+$30

;;;
;;; End low WRAM region
;;;
wram_base = $7E0000
wram_base_high = $7F0000

sram_file_buffer = $7E56CA


; HDMA buffers
; These buffers will have many overlapping addresses, some with structs, some without
; These may take awhile to get right and could end up fairly volatile until I figure it out

namespace hdma_intro
	bgmode = $7E8012
	color_math = $7E8022
	subscreen = $7E8032
namespace off

namespace hdma_menu
	windowing = $7E8012
namespace off
; end buffers

working_palette = $7E8928
primary_palette = $7E8C28
