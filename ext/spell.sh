#!/bin/sh
set -e
hunspell -p src/.hunspell_en_US $* > build/spell.out
cat build/spell.out

#aspell --guess --sug-mode=bad-spellers check src/paper.md
