struct PPU $2100
	.screen: skip 1

	.sprite_select: skip 1
	.oam_address:
		.oam_address_low: skip 1
		.oam_address_high: skip 1
	.oam_write: skip 1

	.layer_mode: skip 1
	.mosaic: skip 1

	.layer_1_2_tilemap_base:
		.layer_0_tilemap_base: skip 1
		.layer_1_tilemap_base: skip 1
	.layer_3_4_tilemap_base:
		.layer_2_tilemap_base: skip 1
		.layer_4_tilemap_base: skip 1

	.layer_all_tiledata_base:
		.layer_1_2_tiledata_base: skip 1
		.layer_3_4_tiledata_base: skip 1

	.layer_1_scroll_x: skip 1 ;write_twice
	.layer_1_scroll_y: skip 1 ;write_twice
	.layer_2_scroll_x: skip 1 ;write_twice
	.layer_2_scroll_y: skip 1 ;write_twice
	.layer_3_scroll_x: skip 1 ;write_twice
	.layer_3_scroll_y: skip 1 ;write_twice
	.layer_4_scroll_x: skip 1 ;write_twice
	.layer_4_scroll_y: skip 1 ;write_twice

	.vram_control: skip 1
	.vram_address:
		.vram_address_low: skip 1
		.vram_address_high: skip 1
	.vram_write:
		.vram_write_low: skip 1
		.vram_write_high: skip 1

	.set_mode_7: skip 1
	.fixed_point_mul_A:
	.mode_7_A: skip 1	;write_twice
	.fixed_point_mul_B:
	.mode_7_B: skip 1	;write_twice
	.mode_7_C: skip 1	;write_twice
	.mode_7_D: skip 1	;write_twice
	.mode_7_center_x: skip 1	;write_twice
	.mode_7_center_y: skip 1	;write_twice

	.cgram_address: skip 1
	.cgram_write: skip 1

	.set_window_layer_all:
		.set_window_layer_1_2: skip 1
		.set_window_layer_3_4: skip 1
	.set_window_sprite_color: skip 1
	.window_1:
		.window_1_left: skip 1
		.window_1_right: skip 1
	.window_2:
		.window_2_left: skip 1
		.window_2_right: skip 1
	.window_logic:
		.window_layer_logic: skip 1
		.window_sprite_color_logic: skip 1

	.screens:
		.main_screen: skip 1
		.sub_screen: skip 1

	.window_masks:
		.window_mask_main_screen: skip 1
		.window_mask_sub_screen: skip 1

	.color_math:
		.color_addition_logic: skip 1
		.set_color_math: skip 1

	.display_control:
		.fixed_color: skip 1
		.video_mode: skip 1

	.multiplication:
		.multiply_result_word:
			.multiply_result_low: skip 1
			.multiply_result_mid: skip 1
		.multiply_result_high: skip 1

	.latch: skip 1

	.oam_read: skip 1

	.vram_read:
		.vram_read_low: skip 1
		.vram_read_high: skip 1

	.cgram_read: skip 1

	.horizontal_scanline: skip 1	;read twice
	.vertical_scanline: skip 1	;read twice

	.status:
		.status_ppu1: skip 1
		.status_ppu2: skip 1
endstruct

struct APU $2140
	.IO1: skip 1
	.IO2: skip 1
	.IO3: skip 1
	.IO4: skip 1
endstruct

struct WRAM $2180
	.data: skip 1
	.address:
		.word:
			.low: skip 1
			.mid: skip 1
		.bank: skip 1
endstruct

struct joypad $4016
	.ports:
		.port_0: skip 1
		.port_1: skip 1
endstruct

struct CPU $4200
	.enable_interrupts: skip 1
	.output_port: skip 1
	.multiply:
		.multiply_A: skip 1
		.multiply_B: skip 1
	.dividen:
		.dividen_low: skip 1
		.dividen_high: skip 1
	.divisor: skip 1

	.horizontal_timer:
		.horizontal_timer_low: skip 1
		.horizontal_timer_high: skip 1

	.vertical_timer:
		.vertical_timer_low: skip 1
		.vertical_timer_high: skip 1

	.enable_dma_hdma:
		.enable_dma: skip 1
		.enable_hdma: skip 1

	.rom_speed: skip 1

	.openbus: skip 2

	.nmi_flag: skip 1
	.irq_flag: skip 1
	.ppu_status: skip 1

	.input_port: skip 1

	.divide_result:
		.divide_result_low: skip 1
		.divide_result_high: skip 1

	.multiply_result:
	.divide_remainder:
		.multiply_result_low:
		.divide_remainder_low: skip 1
		.multiply_result_high:
		.divide_remainder_high: skip 1

	.controllers:
		.port_0_data_1:
			.port_0_data_1_low: skip 1
			.port_0_data_1_high: skip 1
		.port_1_data_1:
			.port_1_data_1_low: skip 1
			.port_1_data_1_high: skip 1
		.port_0_data_2:
			.port_0_data_2_low: skip 1
			.port_0_data_2_high: skip 1
		.port_1_data_2:
			.port_1_data_2_low: skip 1
			.port_1_data_2_high: skip 1

endstruct

struct DMA $4300
	.settings:
		.control: skip 1
		.destination: skip 1

	.source
		.source_word:
			.source_word_low: skip 1
			.source_word_high: skip 1
		.source_bank: skip 1
	.size:
		.size_low: skip 1
		.size_high: skip 1
	.unused_1: skip 1
	.unused_2: skip 1
endstruct align $10

struct HDMA $4300
	.settings:
		.control: skip 1
		.destination: skip 1

	.source
		.source_word:
			.source_word_low: skip 1
			.source_word_high: skip 1
		.source_bank: skip 1

	.indirect_source
		.indirect_source_word:
			.indirect_source_word_low: skip 1
			.indirect_source_word_high: skip 1
		.indirect_source_bank: skip 1

	.midframe_table:
		.midframe_table_low: skip 1
		.midframe_table_high: skip 1

	.counter: skip 1
	.unused: skip 1
endstruct align $10
