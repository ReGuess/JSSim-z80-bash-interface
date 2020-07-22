#!/bin/bash
# written by ReGuess, 2020 July 21
set -e

: ${1?"Usage: $0 ARGUMENT"}

prgmhex="$(z80asm -i "$1" -o - | od -v -An -t x1 | sed 's/\s//g' | tr -d '\n')"

printf "http://visual6502.org/JSSim/expert-z80.html?graphics=f"
printf "&loglevel=-1&logmore=pc,Fetch,a,f,bc,de,hl,ix,iy,sp&a=0000&d="
python -c "print('"$prgmhex"'.ljust(146, '0'))" # 0 out the test pgrm if needed
