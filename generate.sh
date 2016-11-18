#!/bin/bash
set -x 
which antlr4
# 
antlr4.4.6 -Dlanguage=JavaScript vhdl.g4 -visitor -o lib     -package vhdl
antlr4.4.6 -Dlanguage=Cpp        vhdl.g4 -visitor -o lib_cpp -package vhdl

