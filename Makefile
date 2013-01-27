grammar=./ext/grammar.sh
spell=./ext/spell.sh
opt.targets= #meta

all: build pdf $(opt.targets)

build: ; mkdir -p build;

meta: grammar spell

pdf: build/ieee_jrnl.tex

build/ieee_jrnl.tex: src/paper.md src/read.md
	$(MAKE) -C ext
	$(MAKE) -C src slow

html: build/ieee_jrnl.tex
	cd build; htlatex ieee_jrnl.tex

spell: current/paper.spello
	git diff current/paper.spello

current/paper.spello: src/paper.md
	$(spell) -l src/paper.md > current/paper.spello

grammar: current/paper.grm
	git diff current/paper.grm

current/paper.grm: src/paper.md lib/jar/org/languagetool/rules/en/grammar.xml
	$(grammar) src/paper.md | sed -e '/^Time:/d' > current/paper.grm

qq:
	/scratch/install/queequeg/qq src/paper.md

complete: build/complete.tex
build/complete.tex: build/ieee_jrnl.tex build/paper.tex
		cd build; ../ext/merge.sh ieee_jrnl.tex > complete.tex_
		cd build; mv complete.tex_ complete.tex

clean:
	-rm -rf build
	$(MAKE) -C ext clean

