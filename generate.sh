#!/bin/bash
set -x 
which antlr4
antlr4 -Dlanguage=JavaScript -visitor -no-listener vhdl.g4 -o VhdlParser -package vhdl

