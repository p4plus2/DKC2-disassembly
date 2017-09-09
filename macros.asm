function bank_word(addr) = ((addr&$FFFF)<<8)|(addr>>16) : dl bank_word($123456)

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
