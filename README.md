# jshdl

Convert a Antlr4 vhdl.g4 grammar to javascript via antl4 cpp target and emscripten instead of the slow javascript target.
vhdl.g4 from https://github.com/Nic30/hdlConvertor.

## antlr4 CPP target (t/simple.cpp):

    Scan 131kb iu3.vhd with *cpp* version:

    time ./vhdl.out t/iu3.vhd
    real  0m3.666s
    user  0m3.612s
    sys   0m0.048s

## antlr4 javascript target:

    Scan 131kb iu3.vhd with antlr4 *javascript* version (t/simple.js):

    time node t/simple.js
    real  2m26.034s
    user  2m27.348s
    sys   0m1.180s

 => very slow

## antlr4 CPP target converted with *emscripten* (t/simple_node.cpp):

emcc -O3 compiled: 13976859 bytes. Scan 131kb iu3.vhd:

    $time node vhdlparser.js
    real  0m15.864s
    user  0m15.732s
    sys   0m0.144s

emcc -Oz compiled: 8817131 bytes. Scan 131kb iu3.vhd:

    $time node vhdlparser.js
    real  0m20.709s
    user  0m20.608s
    sys	  0m0.128s
