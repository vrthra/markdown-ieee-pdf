#!/bin/sh
set -e
#java -jar ~/Downloads/LanguageTool/LanguageTool.jar -l en -d \
java -jar lib/jar/LanguageTool.jar -l en -d \
EN_QUOTES,\
WHITESPACE_RULE \
"$@" > build/languagetool.out

cat build/languagetool.out | sed -e 's@^\(.*\)Line \([0-9]\+\), column \([0-9]\+\), \(Rule ID:.*\)$@\1 '$*':\2 \3 \4@g'

#	diction -b -s src/paper.md
# textlint, languagetool, style, afterthedeadline, queequeg, style-check.rb
