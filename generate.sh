#!/bin/bash
set -x 
which antlr4
#-visitor 
antlr4 -Dlanguage=JavaScript vhdl.g4 -no-listener -o src -package vhdl

