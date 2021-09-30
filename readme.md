Some random conventions, I'll add more as I remember

###Choosing label names

Routines that act like game loops get names such as `run_<action>`
Routines that primarily delegate many related tasks get the name `<task>_handler`
Routines that are global trampolines for a local routine get a suffix of `<routine>_global`
Use sublabels whenever possible, nesting deeper is okay but should be used sparingly
Relative labels should be used minimally when a name wouldn't help the context (Like a spinlock)
Strive for descriptive names, ideally under 30 chars but absolutely never exceeding 36
Anything in the global namespace should be specific to reduce chances of name conflict
Underscores only.

####Data naming notes
Data which is local should get a sublabel
Palettes should get the `_palette` suffix
Layer graphics should get the `_tiledata` suffix
Layer tile maps should get the `_tilemap` suffix
Collections of sprite graphics should get the `_graphics` suffix
Single sprite graphics should get the suffix `_frameN` where `N` is optional (used for when multiple frames exist)
When practical, ROM data should get a struct defined in `structs.asm`  This allows for named member access

###Comment structure
Its best to allow comments to flow around the code to cluster related opcodes.  Try to comment
on what is happening and why it is happening more than how it is happening.  The hard limit for line
length is 120 chars.  Do not exceed this with comments.  If you need a bulk description for some reason
place it in a block before the routine.  Never use the macros as a comment trick.
