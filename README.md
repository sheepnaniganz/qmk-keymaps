# Customized VIAL Support for KBDfans D65 using KBD67mkiirgb v2

This is a custom build for the D65 using the KBD67mkiirgb v2 board. This alters some of the features on the default VIAL build by removing the default keymap folder and symlinking the D65 folder to keep the firmware under max. Currently this build contains 4 layers and uses 26814/28672 (93%, 1858 bytes free) of the max firmware size. The default build was too large to use.

This can easily be editted to be used for multiple keyboards by changing the makefile.

## Enabled Features

- [BOOTMAGIC_ENABLE](https://docs.qmk.fm/#/feature_bootmagic?id=bootmagic-lite)
- [LTO_ENABLE](https://docs.qmk.fm/#/squeezing_avr?id=rulesmk-settings)
- [NKRO_ENABLE](https://docs.qmk.fm/#/reference_glossary?id=n-key-rollover-nkro)
- [EXTRAKEY_ENABLE](https://docs.qmk.fm/#/config_options?id=feature-options)
- [COMBO_ENABLE](https://docs.qmk.fm/#/feature_combo?id=combos)
- [KEY_OVERRIDE_ENABLE](https://docs.qmk.fm/#/feature_key_overrides)
- [CAPS_WORD_ENABLE](https://docs.qmk.fm/#/feature_caps_word?id=caps-word)
- [VIA Support](https://www.caniusevia.com/)
- [VIAL Support](https://get.vial.today)
- [VIAL QMK Settings](https://get.vial.today/changelog/release-0.4.html#qmk-settings)

## Disabled Features

- [AUDIO_ENABLE](https://docs.qmk.fm/#/feature_audio?id=audio)
- [CONSOLE_ENABLE](https://docs.qmk.fm/#/cli_commands?id=qmk-console)
- [COMMAND_ENABLE](https://docs.qmk.fm/#/feature_command?id=command)
- [BACKLIGHT_ENABLE](https://docs.qmk.fm/#/feature_backlight?id=backlighting)
- [MOUSEKEY_ENABLE](https://docs.qmk.fm/#/feature_mouse_keys)
- [RGB_MATRIX_ENABLE](https://docs.qmk.fm/#/feature_rgb_matrix?id=rgb-matrix-lighting)
- [BLUETOOTH_ENABLE](https://docs.qmk.fm/#/feature_bluetooth?id=bluetooth)
- [NO_USB_STARTUP_CHECK](https://docs.qmk.fm/#/config_options?id=feature-options)

## Usage

Run the following command to build the firmware.

```sh
make d65
```

To cleanup previous builds run

```sh
make clean
```
