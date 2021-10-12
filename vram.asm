;This segment may need some more work. Particularly how to organize it.

namespace nested on
namespace vram
	namespace intro
		mode_7_tilemap = $038B
		nintendo_presents_tilemap = $74A0
		mini_rare_logo_tilemap = $76BA
		sparkle_tilemap = $3000
		nintendo_copyright_tilemap = $7D00
		title_screen_tilemap = $1C00

		;todo fix this missed documentation
		unknown = $78E0
		unknown2 = $7CE0
		unknown3 = $4000
		unknown4 = $6000

		title_screen_tiledata = $4000
		nintendo_presents_tiledata1 = $4000
		nintendo_presents_tiledata2 = $4A20

		;todo name these better
		block_1 = $7400
		block_2 = $7000
		block_3 = $7800
		block_4 = $7C00

	namespace off
	namespace menus
		;tilemap base locations
		map_bg_tilemap = $7C00

		;tilemap sublocations
		select_game_tilemap = $7428
		save_game_tilemap = $7428
		file_number_1_tilemap = $74C1
		file_number_2_tilemap = $7561
		file_number_3_tilemap = $7601
		save_file1_tilemap = $74A2
		save_file2_tilemap = $7542
		save_file3_tilemap = $75E2
		copy_erase_tilemap = $76C3
		language_tilemap = $7731
		channel_count_tilemap = $7723

		;tiledata base locations
		ui_tiledata = $5000
		map_bg_tiledata = $1000

		;tiledata sub locations
		dk_coin = $0080
	namespace off
namespace off
namespace nested off
