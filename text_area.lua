text_area = {}

function text_area:new()
	object = {}
	setmetatable(object, self)
	self.__index = self
	
	--init
	self.x = 0
	self.y = 0
	self.opacity = 0x80
	self.color = 0x00000000
	self.font_opacity = 0x80
	self.font_color = 0x00FFFFFF
	self.font_height = 16
	self.lines = {}
	self.max_lines = -1
	self.use_formatted_lines = true
	self.clear_after_render = true
	
	return object
end


--background control
function text_area:set_color(color)
	self.color = color
end

function text_area:set_opacity(opacity)
	self.opacity = opacity
end

--font control
function text_area:set_font_color(color)
	self.font_color = font_color
end

function text_area:set_font_opacity(font_opacity)
	self.font_opacity = font_opacity
end

function text_area:set_font(font)
	self.font = font
end

--draw control

function text_area:set_anchor(x, y)
	self.x = x
	self.y = y
end

function text_area:set_text_clipping(clip_text)
	self.clip_text = clip_text
end

--text control
function text_area:set_max_lines(max_lines)
	self.max_lines = max_lines
end

function text_area:clear_lines()
	self.lines = {}
end

function text_area:append_line(line, ...)
	self:set_line(#self.lines + 1, line, ...)
end

function text_area:append_colored_line(line, color, ...)
	self:set_colored_line(#self.lines + 1, color, line, ...)
end

function text_area:set_line(line_number, line, ...)
	self:set_colored_line(line_number, self.font_color, line, ...)
end

function text_area:set_colored_line(line_number, font_color, line, ...)
	if self.use_formatted_lines then
		line = string.format(line, ...)
	end
	for token in string.gmatch(line, "[^\n]+") do
		self.lines[line_number] = {}
		self.lines[line_number]["text"] = token
		self.lines[line_number]["font_color"] = font_color
		line_number = line_number + 1
	end
	
end

function text_area:set_formatted_lines(formatted_lines)
	self.formatted_lines = formatted_lines
end

function text_area:set_clear_after_render(formatted_lines)
	self.clear_after_render = clear_after_render
end

--render code

function text_area:blend(color, opacity)
	return color + (opacity * 0x1000000)
end

function text_area:render()
	for i, line in ipairs(self.lines) do
		if self.max_lines > 0 and i > self.max_lines then
			break
		end
		local font_color = self:blend(line["font_color"], self.font_opacity)
		local color = self:blend(self.color, self.opacity)
		gui.text(self.x, self.y + (self.font_height * (i - 1)), line["text"], font_color, color)
	end
	
	if self.clear_after_render then
		self:clear_lines()
	end
end
