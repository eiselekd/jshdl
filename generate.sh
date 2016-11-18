#!/bin/bash
set -x 

antlr4 -Dlanguage=JavaScript -visitor -no-listener vhdl.g4 -o VhdlParser -package vhdl

