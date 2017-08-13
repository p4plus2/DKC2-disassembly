object = DKC2_custom.sfc

all:
	asar all.asm $(object)
	@echo "b79c2bb86f6fc76e1fc61c62fc16d51c664c381e58bc2933be643bbc4d8b610c $(object)" | sha256sum -c -
clean:
	rm $(object)
