# Metal Gear 2: Solid Snake (Konami, RC-767, 1990, MSX2)
# desensamblado
#
# El orden de las cosas: trazar el flujo -> generar el listado -> comprobar que
# vuelve a dar la ROM byte a byte -> las comprobaciones que el reensamblado NO
# cubre.
#
# Es un MegaROM de 512 KB con el mapper Konami CON SCC, 64 bancos de 8 KB. Cada banco
# es un modulo (p00..p63) con su propio org -el sitio donde el
# mapper lo pone para ejecutarlo, medido en tools/paginas.py-, su trazado, sus
# notas y su listado. `make verify` reensambla los 64 y los concatena: tiene
# que salir la ROM entera, byte a byte.
#
# tools/bancos.py traza el CARTUCHO ENTERO llevando la cuenta de que banco hay
# en cada ranura. De ahi salen los src/pNN.entries -las llamadas que cruzan el
# mapper- y los src/pNN.nocode -las tablas del despachador-. `make semillas`
# los regenera.
#
# La ROM no se distribuye. Hace falta en la raiz como metalgear2.rom, y
# `make comprueba` verifica el sha256.

ROM      = metalgear2.rom
SHA      = 43b7fab533abeb87313919ec1fc7bc732d7b0ebfacede1e4f89d8295160384f2
SRC      = src
WORK     = work
TITULO   = METAL GEAR 2 SOLID SNAKE - Konami (1990) - MSX2 - MegaROM RC-767 de 512 KB (Konami SCC)

PAGINAS  = 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63

# Donde se ejecuta cada banco. Es la misma tabla que `python3 tools/paginas.py
# lista` (un test lo comprueba); esta copiada aqui para no lanzar python 64
# veces por cada make.
ORG_00 = 0x4000
ORG_01 = 0x6000
ORG_02 = 0x8000
ORG_03 = 0xa000
ORG_04 = 0x8000
ORG_05 = 0xa000
ORG_06 = 0xa000
ORG_07 = 0xa000
ORG_08 = 0xa000
ORG_09 = 0xa000
ORG_10 = 0xa000
ORG_11 = 0xa000
ORG_12 = 0x6000
ORG_13 = 0x8000
ORG_14 = 0xa000
ORG_15 = 0xa000
ORG_16 = 0x4000
ORG_17 = 0x6000
ORG_18 = 0x8000
ORG_19 = 0xa000
ORG_20 = 0xa000
ORG_21 = 0xa000
ORG_22 = 0xa000
ORG_23 = 0xa000
ORG_24 = 0x6000
ORG_25 = 0x8000
ORG_26 = 0xa000
ORG_27 = 0x8000
ORG_28 = 0xa000
ORG_29 = 0x8000
ORG_30 = 0xa000
ORG_31 = 0xa000
ORG_32 = 0x6000
ORG_33 = 0x8000
ORG_34 = 0xa000
ORG_35 = 0x6000
ORG_36 = 0x8000
ORG_37 = 0xa000
ORG_38 = 0x8000
ORG_39 = 0xa000
ORG_40 = 0x8000
ORG_41 = 0xa000
ORG_42 = 0x8000
ORG_43 = 0xa000
ORG_44 = 0x8000
ORG_45 = 0xa000
ORG_46 = 0x8000
ORG_47 = 0xa000
ORG_48 = 0x8000
ORG_49 = 0xa000
ORG_50 = 0x8000
ORG_51 = 0xa000
ORG_52 = 0x8000
ORG_53 = 0xa000
ORG_54 = 0xa000
ORG_55 = 0xa000
ORG_56 = 0xa000
ORG_57 = 0x8000
ORG_58 = 0xa000
ORG_59 = 0xa000
ORG_60 = 0x8000
ORG_61 = 0xa000
ORG_62 = 0x8000
ORG_63 = 0xa000
ORG    = $(ORG_$(1))

all: listado verify sanity test

$(ROM):
	@echo "=================================================================="
	@echo " Falta $(ROM), y este repositorio NO lo distribuye."
	@echo ""
	@echo " Es Metal Gear 2: Solid Snake (Konami, RC-767, 1990) para MSX2, 524288"
	@echo " bytes exactos. Ponlo aqui con ese nombre."
	@echo " Para comprobar que es el mismo:"
	@echo "     shasum -a 256 $(ROM)"
	@echo "     $(SHA)"
	@echo ""
	@echo " Sin el se puede leer el listado ya generado en $(SRC)/, y los"
	@echo " tests que no dependen del binario siguen pasando."
	@echo "=================================================================="
	@false

comprueba: $(ROM)
	@echo "$(SHA)  $(ROM)" | shasum -a 256 -c -

# Reconocimiento: cabecera, escrituras al mapper, y la comprobacion de que la
# regla banco -> org la cumplen todas las escrituras. Es la base sobre la que
# se apoya todo lo demas.
reconoce: $(ROM)
	@python3 tools/reconocimiento.py $(ROM)

# Los 64 bancos cortados de la ROM, uno por fichero.
$(WORK)/p00.bin: $(ROM) tools/paginas.py
	@mkdir -p $(WORK)
	python3 tools/paginas.py corta $(ROM) $(WORK)

paginas: $(WORK)/p00.bin

# Las semillas: el trazado de cartucho entero, que es el unico que sabe que
# banco hay en cada ranura. Reescribe los .entries y los .nocode.
semillas: $(ROM)
	python3 tools/bancos.py $(ROM) escribe $(SRC)

# El trazado sigue el flujo desde los puntos de entrada DE CADA BANCO.
define REGLA_TRAZA
$(WORK)/p$(1).trace.json: $(WORK)/p00.bin $(SRC)/p$(1).entries $(SRC)/p$(1).nocode tools/z80trace.py
	python3 tools/z80trace.py $(WORK)/p$(1).bin $(call ORG,$(1)) $(SRC)/p$(1).entries \
	        $(WORK)/p$(1) $(SRC)/p$(1).nocode
endef
$(foreach p,$(PAGINAS),$(eval $(call REGLA_TRAZA,$(p))))

trace: $(foreach p,$(PAGINAS),$(WORK)/p$(p).trace.json)

# Un listado por banco: src/metalgear2_pNN.asm, con el org de ese banco.
define REGLA_LISTADO
$(SRC)/metalgear2_p$(1).asm: $(WORK)/p$(1).trace.json $(SRC)/p$(1).notes tools/mkasm.py
	python3 tools/mkasm.py $(WORK)/p$(1).bin $(call ORG,$(1)) $(WORK)/p$(1).trace.json \
	        $(SRC)/p$(1).notes $(WORK)/msx.sym $(SRC)/metalgear2_p$(1).asm \
	        "$(TITULO) - banco $(1) (se ejecuta en $(call ORG,$(1)))"
endef
$(foreach p,$(PAGINAS),$(eval $(call REGLA_LISTADO,$(p))))

listado: $(foreach p,$(PAGINAS),$(SRC)/metalgear2_p$(p).asm)

# La prueba que decide si el desensamblado es fiable: cada banco reensambla a
# sus 8192 bytes, y los 64 concatenados dan la ROM entera.
verify: $(WORK)/p00.bin
	@for p in $(PAGINAS); do \
	  sh tools/verify_build.sh $(SRC)/metalgear2_p$$p.asm $(WORK)/p$$p.bin \
	     `python3 tools/paginas.py org $$p` $(WORK)/p$$p.out.bin || exit 1; \
	done
	@sh tools/verify_rom.sh $(WORK) $(ROM) $(SHA)

# Lo que el reensamblado NO puede cazar: que unos datos se esten leyendo como
# codigo. El binario sale identico igual, porque los bytes no cambian; lo unico
# que cambia es lo que decimos de ellos.
sanity: trace
	@echo "=================================================================="
	@echo " la regla banco -> org la cumplen todas las escrituras al mapper"
	@echo "=================================================================="
	@python3 tools/reconocimiento.py $(ROM) | tail -1
	@echo "=================================================================="
	@echo " ningun byte declarado como datos puede salir como codigo"
	@echo "=================================================================="
	@for p in $(PAGINAS); do \
	  python3 tools/check_trace.py $(WORK)/p$$p.trace.json $(SRC)/p$$p.nocode > $(WORK)/chk.txt \
	    || { cat $(WORK)/chk.txt; exit 1; }; tail -1 $(WORK)/chk.txt; \
	done
	@python3 tools/check_datos_como_codigo.py $(WORK) $(SRC)
	@echo "=================================================================="
	@echo " el trazado por bancos y el de cartucho entero dicen lo mismo"
	@echo "=================================================================="
	@python3 tools/check_bancos.py $(ROM) $(WORK) $(SRC)
	@echo "=================================================================="
	@echo " ningun punto de entrada puede caer dentro de una zona de datos"
	@echo "=================================================================="
	@for p in $(PAGINAS); do \
	  python3 tools/check_entradas.py $(SRC)/p$$p.entries $(SRC)/p$$p.notes \
	          $(SRC)/p$$p.nocode > $(WORK)/chk.txt || { cat $(WORK)/chk.txt; exit 1; }; \
	  tail -1 $(WORK)/chk.txt; \
	done
	@echo "=================================================================="
	@echo " ni un byte del cartucho sin asignar (los 64 bancos)"
	@echo "=================================================================="
	@python3 tools/presupuesto.py $(WORK) $(SRC)

densidad:
	@for p in $(PAGINAS); do \
	  echo "-- p$$p"; python3 tools/densidad.py $(SRC)/metalgear2_p$$p.asm | tail -2; \
	done

test:
	@echo "=================================================================="
	@echo " Tests"
	@echo "=================================================================="
	@python3 -m unittest discover -s tests -v

# Las imagenes y las musicas de la web: las juntan de lo que pinta el cartucho
# ejecutado en work/ (mapas.py, snake.py, jefes.py... ver tools/imagenes_web.py).
# Necesitan PIL: el python de Programs, no el de la Store.
PYIMG ?= /c/Users/Antxiko/AppData/Local/Programs/Python/Python313/python.exe
imagenes: $(ROM)
	$(PYIMG) tools/imagenes_web.py docs

# La web: en el repositorio solo van las paginas en markdown; GitHub Pages las
# convierte con Jekyll (tools/jekyll.py escribe su configuracion y plantillas).
# Las partes largas (letreros, conversaciones, textos, musicas) las escribe
# tools/paginas_web.py desde la ROM. La portada la monta make_web.py con lo de
# tools/contenido_web.py. Para comprobar los enlaces se construye en local con
# el mismo Jekyll (3.10).
JEKYLL ?= C:/msys64/mingw64/bin/ruby C:/msys64/mingw64/bin/jekyll
web: $(ROM)
	python3 tools/paginas_web.py docs
	python3 tools/jekyll.py docs
	python3 tools/make_web.py docs/imagenes docs/index.html en
	python3 tools/make_web.py docs/imagenes docs/es/index.html es
	rm -rf $(WORK)/_site
	$(JEKYLL) build -s docs -d $(WORK)/_site
	python3 tools/check_enlaces.py $(WORK)/_site

clean:
	rm -f $(WORK)/p*.trace.json $(WORK)/p*.blocks $(WORK)/p*.out.bin \
	      $(WORK)/reensamblada.rom $(WORK)/pasmo.err

.PHONY: all comprueba reconoce paginas semillas trace listado verify \
        sanity densidad test imagenes web clean
