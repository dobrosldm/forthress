# Forthress

This repo is cloned from original https://github.com/sayon/forthress. It contains results of research activities during completing System Software course work project in 2019.

## Summary

Forthress is a Forth dialect made for educational purposes. Forthress is written in NASM using bootstrap technique. It means that the main interpreter/compiler loop is written in Forthress. The inner interpreter is written in assembly, and so are some words.

## Stages
### Stage 1

File `stage1.frt` contains all new words:
* `parity`
* `prime-without-log`
* `prime`
* `prime-allot`
* `concat`
* `radical`

This file is already included in `start` script.
