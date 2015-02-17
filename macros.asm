macro offset(label, offset)
    ?tmp:
    pushpc
    org ?tmp+<offset>
    <label>:
    pullpc
endmacro

macro return(label)
    PEA <label>-1
endmacro
