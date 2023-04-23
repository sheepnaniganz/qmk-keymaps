# The username you want to use
USER = sheepnaniganz

# Add any keyboard you would use to keyboards and create a folder with the same name containing keymap files
KEYBOARDS = d65 ergo

# Add path variables with keyboard ending and with the default keyboard map as the value
PATH_d65 = kbdfans/kbd67/mkiirgb/v2
PATH_ergo = ergodox_ez

all: $(KEYBOARDS)

.PHONY: $(KEYBOARDS)
$(KEYBOARDS):
	# init submodule
	git submodule update --init --remote --recursive
	git submodule foreach git pull
	git submodule foreach make git-submodule

	# cleanup old symlinks
	rm -rf vial-qmk/keyboards/$(PATH_$@)/keymaps/$(USER)
	rm -rf vial-qmk/users/$(USER)

	# add new symlinks and files
	ln -s $(shell pwd)/user vial-qmk/users/$(USER)
	ln -s $(shell pwd)/$@/keymap vial-qmk/keyboards/$(PATH_$@)/keymaps/$(USER)
	cp vial-qmk/keyboards/$(PATH_$@)/info.json $(shell pwd)/$@/info.json.bak
	rm vial-qmk/keyboards/$(PATH_$@)/info.json
	cp $(shell pwd)/$@/info.json vial-qmk/keyboards/$(PATH_$@)/

	# run lint check
	cd vial-qmk; qmk lint -km $(USER) -kb $(PATH_$@) --strict

	# run build
	make BUILD_DIR=$(shell pwd)/build -j1 -C vial-qmk $(PATH_$@):$(USER)

	# cleanup symlinks
	rm -rf vial-qmk/users/$(USER)
	rm -rf vial-qmk/keyboards/$(PATH_$@)/keymaps/$(USER)
	rm vial-qmk/keyboards/$(PATH_$@)/info.json
	mv $(shell pwd)/$@/info.json.bak vial-qmk/keyboards/$(PATH_$@)/info.json

clean:
	rm -rf ./build/
