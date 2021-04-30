# Electro-Player
A music player for the Acorn Electron
---
## Usage
To get usable music, simondotm's [vgm2electron](https://github.com/simondotm/vgm2electron) script is required, which can convert VGMs of BBC Micro tunes to Acorn Electron compatible data.

Electro-Player can then be modified to take the data by replacing the line
```
incbin "caramelldansen.bin"
```
in `player.asm` with the output of whatever you have converted.
