#!/bin/bash
echo "Start build jshdl:"
bash .travis/travis-antlr4.sh
bash generate.sh
