;$F80000
brambles_bg_layer_2_8x8_tilemap:
	incbin "data/backgrounds/8x8_tilemaps/brambles_bg_layer_2_8x8_tilemap.bin"

;$F8063E	compressed
DATA_F8063E:
	incbin "data/screens/graphics/rareware_logo_layer_2_tiledata.bin"

;$F80D10	compressed
DATA_F80D10:
	incbin "data/screens/8x8_tilemaps/mini_rareware_logo_layer_1_8x8_tilemap.bin"

;$F80D66
nintendo_copyright_tilemap:
	incbin "data/screens/8x8_tilemaps/nintendo_copyright_layer_1_8x8_tilemap.bin"

;$F80FA6
nintendo_copyright_tiledata:
	incbin "data/screens/graphics/nintendo_copyright_layer_1_tiledata.bin"

;$F82106
k_rools_keep_tiledata:
	incbin "data/world_maps/graphics/k_rools_keep_tiledata.bin"

padbyte $00
pad $F88000