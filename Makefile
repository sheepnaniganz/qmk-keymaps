USER = sheepnaniganz

KEYBOARDS = d65 ergo
PATH_d65 = kbdfans/kbd67/mkiirgb/v2
PATH_ergo = ergodox_ez

all: $(KEYBOARDS)

.PHONY: $(KEYBOARDS)
$(KEYBOARDS):
	# init submodule
	git submodule update --init --recursive

	# cleanup old symlinks
	for f in $(KEYBOARDS); do rm -rf vial-qmk/keyboards/$(PATH_$@)/keymaps/vial; rm -rf vial-qmk/keyboards/$(PATH_$@)/info.json; done
	rm -rf vial-qmk/users/$(USER)

	# add new symlinks
	ln -s $(shell pwd)/user vial-qmk/users/$(USER)
	ln -s $(shell pwd)/$@/keymap vial-qmk/keyboards/$(PATH_$@)/keymaps/vial
	ln -s $(shell pwd)/$@/info.json vial-qmk/keyboards/$(PATH_$@)/info.json

	# run lint check
	cd vial-qmk; qmk lint -km vial -kb $(PATH_$@) --strict

	# run build
	make BUILD_DIR=$(shell pwd) -j1 -C vial-qmk $(PATH_$@):vial

	# cleanup symlinks
	for f in $(KEYBOARDS); do rm -rf vial-qmk/keyboards/$(PATH_$@)/keymaps/vial; rm -rf vial-qmk/keyboards/$(PATH_$@)/info.json; done
	rm -rf vial-qmk/users/$(USER)

clean:
	rm -rf obj_*
	rm -f *.elf
	rm -f *.map
	rm -f *.hex
