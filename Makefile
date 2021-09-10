object = DKC2_custom.sfc

all:
	rm $(object)
	asar all.asm $(object)
	-@echo "b79c2bb86f6fc76e1fc61c62fc16d51c664c381e58bc2933be643bbc4d8b610c $(object)" | sha256sum -c -
run:
	../../../lsnes/lsnes/lsnes --rom=DKC2_custom.sfc --lua=./DKC2.lua --unpause 2>/dev/null
clean:
	rm $(object)
