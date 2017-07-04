all:
	asar all.asm DKC2_custom.sfc
	md5sum *.sfc
clean:
	rm DKC2_custom.sfc
