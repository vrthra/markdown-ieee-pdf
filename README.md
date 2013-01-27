# README

## Introduction

This repository contains materials to generate a paper in pdf in ieee standard.

## Layout

### src

This directory contains the source code in [pandoc](http://johnmacfarlane.net/pandoc/) markdown wiki format.

- src/paper.md
  The paper itself in markdown.

- src/read.md
  The references used in the paper.

- src/meta
  The meta information such as title, author etc.

- src/req
  The ieee format specific files for generating pdf from pandoc markdown.

### build

This directory contains the generated pdf output.

## Building


### Requirements

You will need pandoc to process the files.
If pdf generation is intented, pandoc internally uses latex to generate the pdf files.

If you are on ubuntu, these can be accomplished with

> sudo apt-get install pandoc

> sudo apt-get install texlive-full

### Generate

Run "make" from the top directory to generate build/ieee_jrnl.pdf


### Settings

Ensure that these are run in your terminal.

> git config --global diff.tool vimdiff
> git config --global difftool.prompt false
> git config --global alias.d difftool

