#!/bin/bash
set -x
which bin/antlr4.6
#
bin/antlr4.6 -Dlanguage=JavaScript vhdl.g4 -visitor -o lib     -package vhdl
bin/antlr4.6 -Dlanguage=Cpp        vhdl.g4 -visitor -o lib_cpp -package vhdl
