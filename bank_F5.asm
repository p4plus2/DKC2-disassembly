DATA_F50000:
if !version == 0
	db $32, $02, $93, $12
else
	db $02, $12, $93, $32
endif

;$F50004	compressed
DATA_F50004:
	incbin "data/screens/8x8_tilemaps/rareware_logo_layer_2_8x8_tilemap.bin"

;$F50147
DATA_F50147:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame1.bin"

;$F502C7
DATA_F502C7:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame2.bin"

;$F50447
DATA_F50447:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame3.bin"

;$F505C7
DATA_F505C7:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame4.bin"

;$F50747
DATA_F50747:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame5.bin"

;$F508C7
DATA_F508C7:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame6.bin"

;$F50A47
DATA_F50A47:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame7.bin"

;$F50BC7
DATA_F50BC7:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame8.bin"

;$F50D47
DATA_F50D47:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame9.bin"

;$F50EC7
DATA_F50EC7:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame10.bin"

;$F51047
DATA_F51047:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame11.bin"

;$F511C7
DATA_F511C7:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame12.bin"

;$F51347
DATA_F51347:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame13.bin"

;$F514C7
DATA_F514C7:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame14.bin"

;$F51647
DATA_F51647:
	incbin "data/backgrounds/animated_graphics/lava_level_small_bubbles_tiledata_frame15.bin"

;$F517C7
DATA_F517C7:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_larva_tiledata_frame1.bin"

;$F51907
DATA_F51907:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_larva_tiledata_frame2.bin"

;$F51A47
DATA_F51A47:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_larva_tiledata_frame3.bin"

;$F51B87
DATA_F51B87:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_larva_tiledata_frame4.bin"

;$F51CC7
DATA_F51CC7:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_zinger_tiledata_frame1.bin"

;$F51D67
DATA_F51D67:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_zinger_tiledata_frame2.bin"

;$F51E07
DATA_F51E07:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_zinger_tiledata_frame3.bin"

;$F51EA7
DATA_F51EA7:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_zinger_tiledata_frame4.bin"

;$F51F47
DATA_F51F47:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_zinger_tiledata_frame5.bin"

;$F51FE7
DATA_F51FE7:
	incbin "data/backgrounds/animated_graphics/wasp_hive_level_zinger_tiledata_frame6.bin"

;$F52087
DATA_F52087:
	incbin "data/backgrounds/8x8_tilemaps/ship_deck_rigging_layer_3_8x8_tilemap.bin"

;$F526A7
DATA_F526A7:
	incbin "data/backgrounds/32x32_tilemaps/ship_deck_rigging_layer_3_32x32_tilemap.bin"

;F52BA7
ship_deck_rigging_layer_3_tiledata:
	incbin "data/backgrounds/graphics/ship_deck_rigging_layer_3_tiledata.bin"

;$F52FC7	compressed
DATA_F52FC7:
	incbin "data/screens/8x8_tilemaps/nintendo_logo_layer_1_8x8_tilemap.bin"

;$F5325B	compressed
DATA_F5325B:
	incbin "data/screens/graphics/nintendo_logo_layer_1_tiledata.bin"

;$F547BC
DATA_F547BC:
	incbin "data/screens/8x8_tilemaps/rareware_logo_mode_7_8x8_tilemap.bin"

;$F5484A
DATA_F5484A:
	incbin "data/backgrounds/animated_graphics/castle_torch_tiledata_frame1.bin"

;$F54BCA
DATA_F54BCA:
	incbin "data/backgrounds/animated_graphics/castle_torch_tiledata_frame2.bin"

;$F54F4A
DATA_F54F4A:
	incbin "data/backgrounds/animated_graphics/castle_torch_tiledata_frame3.bin"

;$F552CA
DATA_F552CA:
	incbin "data/backgrounds/animated_graphics/castle_torch_tiledata_frame4.bin"

;$F5564A
DATA_F5564A:
	incbin "data/backgrounds/animated_graphics/castle_torch_tiledata_frame5.bin"

;$F559CA
DATA_F559CA:
	incbin "data/backgrounds/animated_graphics/castle_torch_tiledata_frame6.bin"

;$F55D4A	compressed
DATA_F55D4A:
	incbin "data/screens/graphics/rareware_logo_wireframe_layer_1_tiledata.bin"

;$F56AC9	compressed
DATA_F56AC9:
	incbin "data/screens/8x8_tilemaps/rareware_logo_wireframe_layer_1_8x8_tilemap.bin"

;$F56C13
falling_leaves_tiledata:
	incbin "data/backgrounds/animated_graphics/falling_leaves_tiledata_frame1.bin"

;$F56E33
DATA_F56E33:
	incbin "data/backgrounds/animated_graphics/falling_leaves_tiledata_frame2.bin"

;$F57053
DATA_F57053:
	incbin "data/backgrounds/animated_graphics/falling_leaves_tiledata_frame3.bin"

;$F57273
DATA_F57273:
	incbin "data/backgrounds/animated_graphics/falling_leaves_tiledata_frame4.bin"

;$F57493
DATA_F57493:
	incbin "data/backgrounds/animated_graphics/falling_leaves_tiledata_frame5.bin"

;$F576B3
DATA_F576B3:
	incbin "data/backgrounds/animated_graphics/falling_leaves_tiledata_frame6.bin"

;$F578D3
DATA_F578D3:
	incbin "data/backgrounds/animated_graphics/falling_leaves_tiledata_frame7.bin"

;$F57AF3
DATA_F57AF3:
	incbin "data/backgrounds/animated_graphics/falling_leaves_tiledata_frame8.bin"

;$F57D13
DATA_F57D13:
	incbin "data/screens/8x8_tilemaps/the_end_text_8x8_tilemap.bin"
	
padbyte $00
pad $F58000