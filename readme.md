Some random conventions, I'll add more as I remember

###Choosing label names

Routines that act like game loops get names such as `run_<action>`
Routines that primarily delegate many related tasks get the name `handle_<task>`
Routines that are global trampolines for a local routine get a suffix of `<routine>_global`
Use sublabels whenever possible, nesting deeper is okay but should be used sparingly
Relative labels should be used minimally when a name wouldn't help the context (Like a spinlock)
Strive for descriptive names, ideally under 30 chars but absolutely never exceeding 36
Anything in the global namespace should be specific to reduce chances of name conflict
Underscores only.


###Comment structure
Its best to allow comments to flow around the code to cluster related opcodes.  Try to comment
on what is happening and why it is happening more than how it is happening.  The hard limit for line
length is 120 chars.  Do not exceed this with comments.  If you need a bulk description for some reason
place it in a block before the routine.  Never use the macros as a comment trick.
