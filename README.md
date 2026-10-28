# Metal Gear 2: Solid Snake - commented disassembly

*(También [en castellano](README.es.md).)*

The commented disassembly of **Metal Gear 2: Solid Snake** (メタルギア2 ソリッドスネーク; Konami, 1990, RC-767) for the MSX2: a 512 KB MegaROM with Konami's SCC mapper, sixty-four 8 KB banks.

- **100 %** of the binary explained: 118,147 bytes of code and 406,141 of named data, not a single unassigned byte.
- **45.9 %** of the listing commented, 7,673 routines, none below 10 % comments.
- The listing reassembles into the original ROM **byte for byte**.
- The 274 rooms and the special rooms, Snake, the enemies, the eleven boss fights, the weapons, the equipment, the radar, the portraits and the sequences are **painted by the cartridge itself**, running its own code, and checked against openMSX's VRAM; the texts and the transceiver conversations come from the ROM; the 44 tunes come from running its own sound engine.

The website: <https://antxiko.github.io/MetalGear2-disassembly/>
(in Spanish: <https://antxiko.github.io/MetalGear2-disassembly/es/>).

## Reproducing it

The cartridge image is not distributed. Put yours in the root as `metalgear2.rom` (sha256 `43b7fab5...`) and run `make`. The details, in [UNDER THE HOOD](docs/UNDER-THE-HOOD.md).

## Legal

The game belongs to Konami and its rights holders. The licence in `LICENSE` only covers the tools, the comments, the analysis and the documentation here. See [LEGAL-NOTICE.md](LEGAL-NOTICE.md).
