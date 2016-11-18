all:

cpp:
	g++ -O3 -I antlr4-runtime lib_cpp/vhdlParser.cpp -c -o lib_cpp/vhdlParser.o
	g++ -O3 -I antlr4-runtime lib_cpp/vhdlLexer.cpp -c -o lib_cpp/vhdlLexer.o
	g++ -I antlr4-runtime -I lib_cpp/ t/simple.cpp lib_cpp/vhdlParser.o lib_cpp/vhdlLexer.o t/libantlr4-runtime.a
