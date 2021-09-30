function bank_word(addr) = ((addr&$FFFF)<<8)|(addr>>16)
function fake(addr) = addr

macro offset(label, offset)
	?tmp:
	pushpc
	org ?tmp+<offset>
	<label>:
	pullpc
endmacro

macro mirror(label)
	?tmp:
	pushpc
	org ?tmp+$400000
	<label>:
	pullpc
endmacro

macro font_tile_offset(label)
	db <label>-$0660>>6
endmacro

macro return(label)
	PEA <label>-1
endmacro

macro get_swanky_table()
	!i #= 0
	' ' = $2000
	'*' = $200A
	'a' = $2041
	'b' = $2042
	'c' = $2043
	'd' = $2044
	'e' = $2045
	'f' = $2046
	'g' = $2047
	'h' = $2048
	'i' = $2049
	'j' = $204A
	'k' = $204B
	'l' = $204C
	'm' = $204D
	'n' = $204E
	'o' = $204F
	'p' = $2050
	'q' = $2051
	'r' = $2052
	's' = $2053
	't' = $2054
	'u' = $2055
	'v' = $2056
	'w' = $2057
	'x' = $2058
	'y' = $2059
	'z' = $205A
	'G' = $2027
	'C' = $2023
	'V' = $2036
	'^' = $205E
endmacro

macro sprite(param, x, y, sprite)
	if !version == 0
		if <sprite> >= $0DB6
			dw <param>, <x>, <y>, <sprite>-2
		else
			dw <param>, <x>, <y>, <sprite>
		endif
	else
		dw <param>, <x>, <y>, <sprite>
	endif
endmacro

macro local(name, scratch)
	pushpc
		org <scratch>
			<name>:
	pullpc
endmacro
