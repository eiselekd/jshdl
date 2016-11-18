# jshdl

Try to convert a Antlr4 vhdl.g4 grammar to javascript via antl4 cpp target and emscripten instead of the slow javascript target.
vhdl.g4 from https://github.com/Nic30/hdlConvertor.

** antlr4 CPP target reference

    Scan 131kb iu3.vhd with Cpp version:

    time ./vhdl.out t/iu3.vhd

    real				   0m3.666s
    user				   0m3.612s
    sys				           0m0.048s

** antlr4 javascript target reference

    Scan 131kb iu3.vhd with antlr javascript version:

    time node t/simple.js
    
    real	 2m26.034s
    user	 2m27.348s
    sys	 0m1.180s

 => very slow

** antlr4 CPP target converted with emscripten:

 ??????????
 