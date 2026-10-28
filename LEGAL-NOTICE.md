# Legal notice and attribution

*(También disponible [en castellano](AVISO-LEGAL.md).)*

## Who owns what

**The game is not ours.** *Metal Gear 2: Solid Snake* (メタルギア2 ソリッドスネーク) was published by **Konami** for the MSX2 in 1990; its catalogue number is **RC-767** and it is 512 KB. All rights in the game remain with their holders.

**What is ours** are the tools in this repository, the comments in the listing, the analysis and the documentation. That is published under the licence in `LICENSE`.

## What this repository contains

The files `src/metalgear2_pNN.asm` are the commented disassembly of the cartridge's sixty-four banks. They are published for the **preservation, study and documentation** of a title that is part of the history of MSX software.

The cartridge image (`.rom`) is **not** distributed here. Anyone who wants to rebuild the listing must supply their own, and the `Makefile` checks its sha256 before doing anything.

The images in `docs/imagenes/` are neither illustrations brought from elsewhere nor screenshots: they are painted by the cartridge itself, running its own code, and checked against openMSX's VRAM. The only openMSX screenshots are those of the debug monitor (`docs/imagenes/monitor/`), which can only be seen with a copy of the ROM with two bytes changed.

## What it is based on

Everything stated here comes from reading this binary, and every statement carries its evidence alongside: the instruction that reads a piece of data or the table that closes where it has to close. What is not settled is said not to be.

## If you are one of the authors

If you worked on *Metal Gear 2: Solid Snake* or hold rights in the game, and would rather this material were not published, **say so and it will be taken down, no questions asked**. The intention of this work is the very opposite of harming you: it is to leave a record of how it was made.
