local base = string.gsub(@@LUA_SCRIPT_FILENAME@@, "(.*/)(.*)", "%1")
dofile(base .. "text_area.lua")

getmetatable('').__index = function(str, i) return string.sub(str, i, i) end

local function remove(data, value)
	data = table.remove(data, value)
	if type(data) == "nil" then
		data = {}
	end
	return data
end

local function iterate(array)
    local i = 0
    return function() i = i + 1; return array[i] end
end

local function parse_line(line)
	local result = {}
	local pos = string.find(line, '%g') or (string.len(line) + 1)
	while line[pos] ~= "" do
		if (line[pos] == '"') then
			local start_pos, end_pos = string.find(line, '%b""', pos)
			table.insert(result, string.sub(line, start_pos + 1, end_pos - 1))
			pos = end_pos + 2
		else
			local found_at = string.find(line, ',', pos)
			table.insert(result, string.sub(line, pos, found_at and (found_at - 1) or -1))
			pos = (found_at and found_at or string.len(line)) + 1
		end
		pos = string.find(line, '%g', pos) or (string.len(line) + 1)
	end
	return result
end

local function load_csv(path)
	local file = io.open(path, "rb")
	local csv = {}

	if file then
		for line in io.lines(path) do
			table.insert(csv, parse_line(line))
		end
		file:close()
	end

	return csv;
end

local function list_to_map(list)
	local map = {}

	for index, entry in ipairs(list) do
		map[tonumber(entry[1])] = entry[2]
	end

	return map
end

local function write_long(value, offset)
	memory2.WRAM:write(bit.band(value, 0xFF), offset)
	memory2.WRAM:write(bit.band(bit.lrshift(value, 8), 0xFF), offset+1)
	memory2.WRAM:write(bit.lrshift(value, 16), offset+2)
end

local function write_word(value, offset)
	memory2.WRAM:write(bit.band(value, 0xFF), offset)
	memory2.WRAM:write(bit.lrshift(value, 8), offset+1)
end

local function write_byte(value, offset)
	memory2.WRAM:write(value, offset)
end


local function read_long(offset)
	return memory2.WRAM:read(offset) + (memory2.WRAM:read(offset+1)*0x100) + (memory2.WRAM:read(offset+1)*0x10000)
end

local function read_word(offset)
	return memory2.WRAM:read(offset) + (memory2.WRAM:read(offset+1)*0x100)
end

local function read_byte(offset)
	return memory2.WRAM:read(offset)
end

local function read_fixed_word(offset)
	return string.format("%04X.%04X", memory2.WRAM:read(offset+2), (memory2.WRAM:read(offset)))
end

local function read_fixed_byte(offset)
	return string.format("%02X.%02X", memory2.WRAM:read(offset+1), (memory2.WRAM:read(offset)))
end

local function read_rom_long(offset)
	return memory2.BUS:read(offset) + (memory2.BUS:read(offset+1)*0x100) + (memory2.BUS:read(offset+1)*0x10000)
end

local function read_rom_word(offset)
	return memory2.BUS:read(offset) + (memory2.BUS:read(offset+1)*0x100)
end

local function read_rom_byte(offset)
	return memory2.BUS:read(offset)
end

local function to_pc(address)
	return bit.band(address, 0x3FFFFF)
end

--ROM writing functions, use with caution
local rom_write_buffer = {}

local function rom_preserve(address, size)
	address = address
	if type(rom_write_buffer[address]) == "nil" then
		rom_write_buffer[address] = memory2.BUS:readregion(address, size)
	end
end

local function rom_restore(address)
	memory2.BUS:writeregion(address, rom_write_buffer[address])
	rom_write_buffer = remove(rom_write_buffer, address)
end

local function rom_restore_all(address)
	for address, data in pairs(rom_write_buffer) do
		print(address, data, type(data))
		memory2.BUS:writeregion(address, data)
	end
	rom_write_buffer = {}
end

local function write_rom_byte(byte, address)
	memory2.BUS:write(byte, address)
end

local function write_rom_byte_preserve(byte, address)
	rom_preserve(address, 1)
	memory2.BUS:write(byte, address)
end

local function write_rom_nop(address, size)
	rom_preserve(address, size)
	for i=1,size do
		write_rom_byte(0xEA, address + i - 1)
	end
end

local function write_rom_zero(address, size)
	rom_preserve(address, size)
	for i=1,size do
		write_rom_byte(0x00, address + i - 1)
	end
end

local function write_rom_patch(address, data)
	rom_preserve(address, #data)
	for i=1,#data do
		write_rom_byte(data[i], address + i - 1)
	end
end

--print registers register stop
local function write_rom_stop(address)
	rom_preserve(address, 4)
	write_rom_byte(0x9C, address + 0)
	write_rom_byte(0x02, address + 1)
	write_rom_byte(0x50, address + 2)
	write_rom_byte(0xDB, address + 3)
end

local function register(reg)
	return memory.getregister(reg)
end

local function bg_register(reg, i)
	return memory.getregister("ppu_bg_" .. reg .. "[" .. i .. "]")
end

--debug screens
local sprite_screen = 0
local sound_screen = sprite_screen + 1
local camera_screen = sound_screen + 1
local engine_screen = camera_screen + 1
local level_screen = engine_screen + 1
local watch_screen = level_screen + 1

--debug slot Used for screens which have multiple pages
local slot = 0
local play_sound_effect = false

--debug display control
local show_debug = true
local show_dma_debug = false
local active_screen = engine_screen
local opacity = 0x80
local fg_color = 0x00FFFFFF
local bg_color = 0x00000000
local x_padding = -400
local y_padding = 0

local upper_left = text_area:new()
upper_left:set_anchor(x_padding, 0)
local bottom_left = text_area:new()
bottom_left:set_anchor(x_padding, 550)

local context = gui.renderctx.new(256, 224)

--config files
local sound_effects_path = base .. "sound_effects.txt"
local musics_path = base .. "music.txt"
local sprites_path = base .. "sprites.txt"
local ram_watch_path = base .. "ram_watch.txt"
local exec_watch_path = base .. "exec_watch.txt"

--Add transparency to a color with default opacity
local function trans(color)
	return color + (opacity * 0x1000000)
end

local function text(x, y, message)
	gui.text(x+x_padding, y+y_padding, message, trans(fg_color), trans(bg_color))
end

function clamp(value, low, high)
	if(value < low) then
		return low
	elseif(value > high) then
		return high
	end
	return value
end

local function byte_table(offset, first, last)
	local table = ""
	offset = offset + first
	count = last - first
	for i=0,count do
		if i % 0x10 == 0x00 and i > 0 then
			table = table .. "\n"
		end
		table = table .. " " .. string.format("%02X", read_byte(offset+i))
	end
	return table
end

local function word_table(offset, first, last)
	local table = ""
	offset = offset + first
	count = (last - first) // 2
	for i=0,count do
		if i % 0x08 == 0x00 and i > 0 then
			table = table .. "\n"
		end
		table = table .. " " .. string.format("%04X", read_word(offset+i*2))
	end
	return table
end

local tracked_addresses = {}
local function store(address, value)
	if(value == 0x00) then
		return
	end
	tracked_addresses[address] = value
end

--This is used for tracking values which are STZed after use
local track_buffer = 0
local function track(address, size)
	tracked_addresses[address] = 0
	if size == 1 then
		memory2.WRAM:registerread(address, function(x, data) store(address, data) end)
	elseif size == 2 then
		memory2.WRAM:registerread(address+0, function(x, data) track_buffer = data end)
		memory2.WRAM:registerread(address+1, function(x, data) store(address, track_buffer + data * 0x100) end)
	elseif size == 3 then
		memory2.WRAM:registerread(address+0, function(x, data) track_buffer = data end)
		memory2.WRAM:registerread(address+1, function(x, data) track_buffer = track_buffer + data * 0x100 end)
		memory2.WRAM:registerread(address+2, function(x, data) store(address, track_buffer + data * 0x10000) end)
	end
end


local traced_addresses = {}
local function handle_trace(address, value)
	if(value == 0x00) then
		return
	end
	tracked_addresses[address] = value
end

local trace_read_buffer = 0
local function trace(address, size)
	tracked_addresses[address] = 0
	if size == 1 then
		memory2.WRAM:registerread(address, function(addr, value) handle_trace(address, value) end)
	elseif size == 2 then
		memory2.WRAM:registerread(address+0, function(addr, value) trace_read_buffer = value end)
		memory2.WRAM:registerread(address+1, function(addr, value) handle_trace(address, trace_read_buffer + value * 0x100) end)
	end
end

local layer_state = {[0] = true, true, true, true}
local function toggle_layer(layer)
	layer_state[layer] = not layer_state[layer]
	bsnes.enablelayer(layer, 0, layer_state[layer])
	bsnes.enablelayer(layer, 1, layer_state[layer])
end

local sprites_list = load_csv(sprites_path)
local sprites_map = list_to_map(sprites_list)

local sprite_table = 0x0DE2
local sprite_routine_list = 0xB38348
local function display_sprite()
	local sprite_slot_id = clamp(slot, 0, 23)
	local slot = sprite_table + sprite_slot_id * 0x5E

	upper_left:append_line("Slot number (0x%04X): %d",	slot, sprite_slot_id)
	upper_left:append_line("Sprite: %s",			sprites_map[read_word(slot)] or "UNKNOWN")
	upper_left:append_line("Sprite routine: $B3%04X",	read_rom_word(sprite_routine_list + read_word(slot)))
	upper_left:append_line("Sprite number(0x00): %04X",	read_word(slot))
	upper_left:append_line("Render order(0x02): %04X",	read_word(slot+0x02))
	upper_left:append_line("Position(0x04/0x08): %s, %s", 	read_fixed_word(slot+0x04), read_fixed_word(slot+0x08))
	upper_left:append_line("Potential Ground(0x0C): %04X",	read_word(slot+0x0C))
	upper_left:append_line("Ground Distance(0x0E): %04X",	read_word(slot+0x0E))
	upper_left:append_line("Interaction type(0x10): %04X",	read_word(slot+0x10))
	upper_left:append_line("OAM property+tile(0x12): %04X",	read_word(slot+0x12))
	upper_left:append_line("Unknown data(0x14): %04X",	read_word(slot+0x14))
	upper_left:append_line("Sprite frame (0x16-0x1A):%s",	word_table(slot, 0x16, 0x1A))
	upper_left:append_line("Unknown data(0x1C): %04X",	read_word(slot+0x1C))
	upper_left:append_line("On Ground(0x1E): %04X",		read_word(slot+0x1E))
	upper_left:append_line("X speed(0x20): %s",	 	read_byte(slot+0x20))
	upper_left:append_line("Unknown data(0x22): %04X",	read_word(slot+0x22))
	upper_left:append_line("Y speed(0x24): %s",		read_fixed_byte(slot+0x24))
	upper_left:append_line("Max X speed(0x26): %s",		read_fixed_byte(slot+0x26))
	upper_left:append_line("Unknown data(0x28):\n%s",	byte_table(slot, 0x28, 0x2D))
	upper_left:append_line("Sprite action(0x2E):%04X",	read_word(slot+0x2E))
	upper_left:append_line("Unknown data(0x30):\n%s",	byte_table(slot, 0x30, 0x55))
	upper_left:append_line("Status index(0x56):%04X",	read_word(slot+0x56))
	upper_left:append_line("Spawn code(0x58):%04X",		read_word(slot+0x58))
	upper_left:append_line("Unknown data(0x5A):\n%s",	byte_table(slot, 0x5A, 0x5E))

	for i=0,count do
		if sprites_map[read_word(sprite_table + i * 0x5E)] == nil then
			upper_left:append_line("Unknown sprite %04X detected (Slot: %d):\n", read_word(sprite_table + i * 0x5E), i)
		end
	end
end

local musics_list = load_csv(musics_path)
local musics_map = list_to_map(musics_list)

local sound_effect_list = load_csv(sound_effects_path)
local sound_effect_map = list_to_map(sound_effect_list)

local sound_index = 0x0632
local sound_buffer = 0x0622
local effect_buffer = 0x0619
local spc_transfer_id = 0x00
local current_song = 0x1C
local stereo_flag = 0x1E

track(sound_buffer+0x00, 2)
track(sound_buffer+0x02, 2)
track(sound_buffer+0x04, 2)
track(sound_buffer+0x06, 2)
track(sound_buffer+0x08, 2)
track(sound_buffer+0x0A, 2)
track(sound_buffer+0x0C, 2)
track(sound_buffer+0x0E, 2)

local function display_sound()
	local sound_effect = clamp(slot, 0, 0x7F)
	if play_sound_effect == true then
		write_word(sound_effect, 0x0619 + 10)
		write_word(sound_effect + 0x0500, 0x0622)
		write_word(0x00, sound_index)
		write_word(0x00, 0x0634)
		play_sound_effect = false
	end

	upper_left:append_line("Current index: %02X", read_word(sound_index))
	upper_left:append_line("cmd 0(0x00): %04X", tracked_addresses[sound_buffer+0x00])
	upper_left:append_line("cmd 1(0x02): %04X", tracked_addresses[sound_buffer+0x02])
	upper_left:append_line("cmd 2(0x04): %04X", tracked_addresses[sound_buffer+0x04])
	upper_left:append_line("cmd 3(0x06): %04X", tracked_addresses[sound_buffer+0x06])
	upper_left:append_line("cmd 4(0x08): %04X", tracked_addresses[sound_buffer+0x08])
	upper_left:append_line("cmd 5(0x0A): %04X", tracked_addresses[sound_buffer+0x0A])
	upper_left:append_line("cmd 6(0x0C): %04X", tracked_addresses[sound_buffer+0x0C])
	upper_left:append_line("cmd 7(0x0E): %04X", tracked_addresses[sound_buffer+0x0E])
	upper_left:append_line("sfx 0(0x00): %02X", read_byte(effect_buffer+0x00))
	upper_left:append_line("sfx 1(0x01): %02X", read_byte(effect_buffer+0x01))
	upper_left:append_line("sfx 2(0x02): %02X", read_byte(effect_buffer+0x02))
	upper_left:append_line("sfx 3(0x03): %02X", read_byte(effect_buffer+0x03))
	upper_left:append_line("sfx 4(0x04): %02X", read_byte(effect_buffer+0x04))
	upper_left:append_line("sfx 5(0x05): %02X", read_byte(effect_buffer+0x05))
	upper_left:append_line("sfx 6(0x06): %02X", read_byte(effect_buffer+0x06))
	upper_left:append_line("sfx 7(0x07): %02X", read_byte(effect_buffer+0x07))
	upper_left:append_line("sfx 8(0x08): %02X", read_byte(effect_buffer+0x08))
	upper_left:append_line("sfx 9(0x09): %02X", read_byte(effect_buffer+0x09))
	upper_left:append_line("sfx A(0x0A): %02X", read_byte(effect_buffer+0x0A))
	upper_left:append_line("sfx B(0x0B): %02X", read_byte(effect_buffer+0x0B))
	upper_left:append_line("sfx C(0x0C): %02X", read_byte(effect_buffer+0x0C))
	upper_left:append_line("sfx D(0x0D): %02X", read_byte(effect_buffer+0x0D))
	upper_left:append_line("sfx E(0x0E): %02X", read_byte(effect_buffer+0x0E))
	upper_left:append_line("sfx F(0x0F): %02X", read_byte(effect_buffer+0x0F))
	upper_left:append_line("SPC transfer id: 0x%02X", read_byte(spc_transfer_id))
	upper_left:append_line("Current song: %04X (%s)", read_byte(current_song), musics_map[read_byte(current_song)])
	upper_left:append_line("Mono/Stereo: %02X", read_byte(stereo_flag))
	upper_left:append_line("Play sound effect: %s", sound_effect_map[sound_effect])
end

local camera_x = 0x17BA
local camera_unknown1 = 0x17BC
local camera_unknown2 = 0x17BE
local camera_y_inc = 0x17C0
local camera_y = 0x17C2
local camera_unknown3 = 0x17C4
local camera_unknown4 = 0x17C6
local camera_unknown5 = 0x17C8
local camera_last_update_x = 0x17CA
local camera_unknown6 = 0x17CC
local camera_last_update_y = 0x17CE

local tiledata_pointer = 0x0098
track(tiledata_pointer, 3)

local function display_camera()
	upper_left:append_line("Camera X: %04X", read_word(camera_x))
	upper_left:append_line("Camera unknown 1: %04X", read_word(camera_unknown1))
	upper_left:append_line("Camera unknown 2: %04X", read_word(camera_unknown2))
	upper_left:append_line("Camera Y inc: %04X", read_word(camera_y_inc))
	upper_left:append_line("Camera Y: %04X", read_word(camera_y))
	upper_left:append_line("Camera unknown 3: %04X", read_word(camera_unknown3))
	upper_left:append_line("Camera unknown 4: %04X", read_word(camera_unknown4))
	upper_left:append_line("Camera unknown 5: %04X", read_word(camera_unknown5))
	upper_left:append_line("Camera last update X: %04X", read_word(camera_last_update_x))
	upper_left:append_line("Camera unknown 6: %04X", read_word(camera_unknown6))
	upper_left:append_line("Camera last update Y: %04X", read_word(camera_last_update_y))
	upper_left:append_line("Tiledata pointer: %06X", tracked_addresses[tiledata_pointer])
end

local NMI = 0x0020
local game_loop = 0x0024
local game_mode_NMI = 0x0094
local game_mode = 0x0096

local frame_counter = 0x002A
local active_frame_counter = 0x002C

local function display_engine()
	upper_left:append_line("NMI: %04X", read_word(NMI))
	upper_left:append_line("Game loop: %04X", read_word(game_loop))
	upper_left:append_line("Game mode NMI: %04X", read_word(game_mode_NMI))
	upper_left:append_line("Game mode: %04X", read_word(game_mode))
	upper_left:append_line("Frame counter: %04X", read_word(frame_counter))
	upper_left:append_line("Active frame counter: %04X", read_word(active_frame_counter))
end

local level = 0x00D3
local sprite_pointers = 0xFE0000
local level_header = 0x0515

local function display_level()
	local level_id = read_word(level)

	upper_left:append_line("level number: %04X", level_id)
	upper_left:append_line("Sprite data pointer: FF%04X\n", read_rom_word(sprite_pointers + level_id*2))
	upper_left:append_line("LEVEL HEADER")
	upper_left:append_line("$0515 (0x00) Header: 0x%04X", read_word(level_header + 0x00))
	upper_left:append_line("$0517 (0x02): 0x%04X", read_word(level_header + 0x02))
	upper_left:append_line("$0519 (0x04): 0x%04X", read_word(level_header + 0x04))
	upper_left:append_line("$051B (0x06): Music id 0x%04X", read_word(level_header + 0x06))
	upper_left:append_line("$051D (0x08): 0x%04X", read_word(level_header + 0x08))
	upper_left:append_line("$051F (0x0A): 0x%04X", read_word(level_header + 0x0A))
	upper_left:append_line("$0521 (0x0C): 0x%04X", read_word(level_header + 0x0C))
	upper_left:append_line("$0523 (0x0E): 0x%04X", read_word(level_header + 0x0E))
	upper_left:append_line("$0525 (0x10): 0x%04X", read_word(level_header + 0x10))
	upper_left:append_line("$0527 (0x12) NMI Pointer: 0x%04X", read_word(level_header + 0x12))
	upper_left:append_line("$0529 (0x14) Level mode Pointer: 0x%04X", read_word(level_header + 0x14))
	upper_left:append_line("$052B (0x16): 0x%04X", read_word(level_header + 0x16))
	upper_left:append_line("$052D (0x18): 0x%04X", read_word(level_header + 0x18))
	upper_left:append_line("$052F (0x1A): 0x%04X", read_word(level_header + 0x1A))
	upper_left:append_line("$0531 (0x1C): 0x%04X", read_word(level_header + 0x1C))
	upper_left:append_line("$0533 (0x1E) Spawn X position: 0x%04X", read_word(level_header + 0x1E))
	upper_left:append_line("$0535 (0x20) Spawn Y position: 0x%04X", read_word(level_header + 0x20))
	upper_left:append_line("$0537 (0x22): 0x%04X", read_word(level_header + 0x22))
	upper_left:append_line("$0539 (0x24): 0x%04X", read_word(level_header + 0x24))
	upper_left:append_line("$053B (0x26): 0x%04X", read_word(level_header + 0x26))
	upper_left:append_line("$053D (0x28) Exit 1: 0x%04X", read_word(level_header + 0x28))
	upper_left:append_line("$053F (0x2A) Exit 2: 0x%04X", read_word(level_header + 0x2A))
	upper_left:append_line("$0541 (0x2C) Exit 3: 0x%04X", read_word(level_header + 0x2C))
	upper_left:append_line("$0543 (0x2E) Exit 4: 0x%04X", read_word(level_header + 0x2E))
	upper_left:append_line("$0545 (0x30) Exit 5: 0x%04X", read_word(level_header + 0x30))
	upper_left:append_line("$0547 (0x32) Exit 6: 0x%04X", read_word(level_header + 0x32))
	upper_left:append_line("$0549 (0x34) Exit 7: 0x%04X", read_word(level_header + 0x34))
	upper_left:append_line("$054B (0x36) Exit 8: 0x%04X", read_word(level_header + 0x36))
	upper_left:append_line("$054D (0x38): 0x%04X", read_word(level_header + 0x38))
	upper_left:append_line("$0551 (0x3A): 0x%04X", read_word(level_header + 0x3A))
end

local watched_addresses = {}
local exec_watched_addresses = {}
local exec_watched_count = {}
local function display_watch()
	upper_left:append_line("RAM watches: ")
	for address, read_callback in pairs(watched_addresses) do
		upper_left:append_line(read_callback())
	end
	upper_left:append_line("Execution counts: ")
	for address, read_callback in pairs(exec_watched_addresses) do
		upper_left:append_line(read_callback())
	end
end

local function display_ppu_state()
	ppu_layer_state = "\n{" .. (layer_state[0] and "Enabled, " or "Disabled, ")
	ppu_layer_state = ppu_layer_state .. (layer_state[1] and "Enabled, " or "Disabled, ")
	ppu_layer_state = ppu_layer_state .. (layer_state[2] and "Enabled, " or "Disabled, ")
	ppu_layer_state = ppu_layer_state .. (layer_state[3] and "Enabled" or "Disabled") .. "}"

	bottom_left:append_line(dump_mmio_string())
	bottom_left:append_line(ppu_layer_state)
end

local function display_cgram_state()

	colors = bsnes.dump_palette("CGRAM", 0, true, true)
	for i=0, 255 do
		gui.solidrectangle(350 + ((i % 16) * 8), 550 + (math.floor(i / 16) * 8), 8, 8, colors:get(i))
	end
	--text(0, 550, "state")
end

local keys = {}
keys.press = {}

function keys.register_keypress(key,fn)
	keys.press[key] = fn
	input.keyhook(key, true)
end


function on_keyhook(key, state)
	if keys.press[key] and (state.value == 1) then
		keys.press[key]()
	end
end

keys.register_keypress("equals", function() slot = slot + 1 ; gui.repaint() end)
keys.register_keypress("minus" , function() slot = slot - 1 ; gui.repaint() end)

keys.register_keypress("backquote" , function() show_debug = not show_debug ; gui.repaint() end)
keys.register_keypress("quotedbl" , function() show_dma_debug = not show_dma_debug end)

keys.register_keypress("p" , function() play_sound_effect = true end)

keys.register_keypress("1" , function() active_screen = sprite_screen ; gui.repaint() end)
keys.register_keypress("2" , function() active_screen = sound_screen ; gui.repaint() end)
keys.register_keypress("3" , function() active_screen = camera_screen ; gui.repaint() end)
keys.register_keypress("4" , function() active_screen = engine_screen ; gui.repaint() end)
keys.register_keypress("5" , function() active_screen = level_screen ; gui.repaint() end)
keys.register_keypress("6" , function() active_screen = watch_screen ; gui.repaint() end)

keys.register_keypress("numpad1" , function() toggle_layer(0) end)
keys.register_keypress("numpad2" , function() toggle_layer(1) end)
keys.register_keypress("numpad3" , function() toggle_layer(2) end)
keys.register_keypress("numpad4" , function() toggle_layer(3) end)

function on_paint(not_synth)
	if show_debug then
		context:clear()
		context:set()

		if active_screen == sprite_screen then
			display_sprite()
		elseif active_screen == sound_screen then
			display_sound()
		elseif active_screen == camera_screen then
			display_camera()
		elseif active_screen == engine_screen then
			display_engine()
		elseif active_screen == level_screen then
			display_level()
		elseif active_screen == watch_screen then
			display_watch()
		end

		display_ppu_state()
		display_cgram_state()

		upper_left:render()
		bottom_left:render()

		gui.renderctx.setnull()
		context:run()
	end
end

function on_video()
	h,v = gui.resolution()
	gui.set_video_scale((256*2)//h, (224*2)//v)
	context:run()
end


local counter = 0
local zip_file = zip.writer.new("DMA_log.zip", 0)
local dma_table = {}
local filter_dma = true
function on_dma(trigger_addr, source_addr, dest_addr, size, mode, dir, fixed)
	if filter_dma == true then
		if dest_addr == 0x04 or dest_addr == 0x22 or fixed == 1 then
			return
		end
	end

	name = string.format("(%d)_$%06X:_$%06X_to_$21%02X.bin", counter, trigger_addr, source_addr, dest_addr)
	zip_file:create_file(name)

	if size == 0 then
		size = 65536
	end

	for i=0, size-1 do
		if fixed == 1 then
			zip_file:write(string.char(memory2.BUS:read(source_addr)))
		else
			zip_file:write(string.char(memory2.BUS:read(source_addr+i)))
		end
	end

	if fixed == true then
		size = 1
	end
	extra_details = ""

	if dest_addr == 0x18 then
		extra_details = dump_mmio_string()
	else
		extra_details = "N/A"
	end

	dma_table[counter] = string.format("%s: %s\n %s\n\n", name, memory2.BUS:sha256(source_addr, size), extra_details)

	counter = counter + 1
end

function on_vm_reset()
	zip_file:create_file("summary.txt")
	for i=0, #dma_table do
		zip_file:write(dma_table[i])
	end
	zip_file:commit()
	rom_restore_all()
end


function dump_mmio_string()
	local layers_string = ""
	local layer_string = "Layer: %d, tilemap: 0x%04X, tiledata: 0x%04X, S: %d, X: 0x%04X, Y: 0x%04X\n"

	for i = 0, 3 do
		layers_string = layers_string .. string.format(layer_string,
									i+1,
									bg_register("scaddr", i),
									bg_register("tdaddr", i),
									bg_register("tilesize", i) == 1 and 8 or 16,
									bg_register("hofs", i),
									bg_register("vofs", i)
								)
	end
	local oam_string = string.format("OAM, base: 0x%04X, tiledata: 0x%04X, size: %d, table: %d, first: %d",
										register("ppu_oam_baseaddr"),
										register("ppu_oam_tdaddr"),
										register("ppu_oam_basesize"),
										register("ppu_oam_nameselect"),
										register("ppu_oam_firstsprite")
									)
	local mmio_string = "BG mode: %d\n" ..
				"VRAM addr: $%04X\n" ..
				layers_string ..
				oam_string
	return string.format(mmio_string,
				register("ppu_bg_mode"),
				register("ppu_vram_addr") * 2
			)
end

function dump_mmio()
	print(dump_mmio_string())
end

function dump_registers()
	local registers_string = "PC: %06X, A: %04X, X: %04X, Y: %04X"
	print(string.format(registers_string,
				register("pbpc"),
				register("a"),
				register("x"),
				register("y")
			))
end

function register_trace(address)
	if (type(address) == "table") then
		for i, trace in pairs(address) do
			memory2.BUS:registerexec(trace, dump_registers)
		end
	else
		memory2.BUS:registerexec(address, dump_registers)
	end
end

function unregister_trace(address)
	if (type(address) == "table") then
		for i, trace in pairs(address) do
			memory2.BUS:unregisterexec(trace, dump_registers)
		end
	else
		memory2.BUS:unregisterexec(address, dump_registers)
	end
end

function add_watch(name, address, size)
	if size == 1 then
		watched_addresses[address] = function() return string.format(name .. ": %02X\n", read_byte(address)) end
	elseif size == 2 then
		watched_addresses[address] = function() return string.format(name .. ": %04X\n", read_word(address)) end
	elseif size == 3 then
		watched_addresses[address] = function() return string.format(name .. ": %06X\n", read_long(address)) end
	elseif size >= 4 then
		watched_addresses[address] = function() return string.format(name .. ": %s\n", byte_table(address, 0, size)) end
	end
end

function delete_watch(address)
	watched_addresses = remove(watched_addresses, address)
end

function add_exec_watch(name, address)
	exec_watched_addresses[address] = function() return string.format(name .. ": %02X\n", exec_watched_count[address]) end
	exec_watched_count[address] = 0
	memory2.BUS:registerexec(address, function() exec_watched_count[address] = exec_watched_count[address] + 1 end)
end

function delete_exec_watch(address)
	exec_watched_addresses = remove(exec_watched_addresses, address)
end


--init plugins
local plugins = {}
function register_plugin(callback)
	table.insert(plugins, callback)
end

if get_file_type("screens") == "directory" then
	local screen_plugins = get_directory_contents("screens", "", "*.lua")

	for file in iterate(screen_plugins) do
		dofile(file)
	end
end


--I personally don't want to use these in actual code for clarity reasons
--but on the fly I do want to type a lot less
--quick access calls for testing from the emulator lua console
--w = write, r = read (print), g = get(return)
--b = byte, w = word, l = long
function wl(value, offset)
	write_long(value, offset)
end

function ww(value, offset)
	write_word(value, offset)
end

function wb(value, offset)
	write_byte(value, offset)
end


function rl(offset)
	print(string.format("0x%06X", read_long(offset)))
end

function rw(offset)
	print(string.format("0x%04X", read_word(offset)))
end

function rb(offset)
	print(string.format("0x%02X", read_byte(offset)))
end

function gl(offset)
	return read_long(offset)
end

function gw(offset)
	return read_word(offset)
end

function gb(offset)
	return read_byte(offset)
end

function rrl(offset)
	return read_rom_long(offset)
end

function rrw(offset)
	return read_rom_word(offset)
end

function rrb(offset)
	return read_rom_byte(offset)
end

--rom quick access calls
function nop(address, size)
	write_rom_nop(address, size)
end

function zero(address, size)
	write_rom_zero(address, size)
end

function rtl(address)
	write_rom_byte_preserve(0x6B, address)
end

function rts(address, size)
	write_rom_byte_preserve(0x60, address)
end

function patch(address, data)
	write_rom_patch(address, data)
end

--print registers register stop
function stop(address)
	write_rom_stop(address)
end

function r(address)
	rom_restore(address)
end

function ra()
	rom_restore_all()
end

function pc(address)
	return to_pc(address)
end
