# Electro-Player
A music player for the Acorn Electron
---
## Usage
To get usable music, simondotm's [vgm2electron](https://github.com/simondotm/vgm2electron) script is required, which can convert VGMs of BBC Micro tunes to Acorn Electron compatible data.

Electro-Player can then be modified to take the data by replacing this line in `player.asm` with the output .bin file of whatever music you have converted.
```
incbin "caramelldansen.bin"
```

Then the player is to be assembled with [BeebAsm](https://github.com/stardot/beebasm) using the included `build.bat` file.
This should produce an .SSD disk which can then be loaded on either an emulator or a real Acorn Electron.
