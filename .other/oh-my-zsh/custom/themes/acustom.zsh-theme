#!/usr/bin/env zsh

# ❯ color
eval bigger_symbol='$FG[014]'
eval color='$FG[014]'

NEWLINE=$'\n'
PROMPT="${NEWLINE}%n : %c ${NEWLINE}"

PROMPT+="%{$bigger_symbol%}❯ %f"
