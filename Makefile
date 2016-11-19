all: cpp emscripten

cpp:
	g++ -O3 -I antlr4-runtime-cpp lib_cpp/vhdlParser.cpp -c -o lib_cpp/vhdlParser.o
	g++ -O3 -I antlr4-runtime-cpp lib_cpp/vhdlLexer.cpp -c -o lib_cpp/vhdlLexer.o
	g++ -I antlr4-runtime-cpp -I lib_cpp/ t/simple.cpp lib_cpp/vhdlParser.o lib_cpp/vhdlLexer.o t/libantlr4-runtime.a

SRC_FILES= \
  $(wildcard lib_cpp/*.cpp) \
  $(wildcard antlr4-runtime-cpp/*.cpp) \
  $(wildcard antlr4-runtime-cpp/atn/*.cpp) \
  $(wildcard antlr4-runtime-cpp/dfa/*.cpp) \
  $(wildcard antlr4-runtime-cpp/misc/*.cpp) \
  $(wildcard antlr4-runtime-cpp/support/*.cpp) \
  $(wildcard antlr4-runtime-cpp/tree/*.cpp) \
  $(wildcard antlr4-runtime-cpp/tree/pattern/*.cpp) \
  $(wildcard antlr4-runtime-cpp/tree/xpath/*.cpp) \

OBJ_FILES = $(patsubst %.cpp,%.bc,$(SRC_FILES))
JS_FILES = $(patsubst %.cpp,%.js,$(SRC_FILES))
TOTAL_MEMORY=50000000
LDFLAGS=-s TOTAL_MEMORY=$(TOTAL_MEMORY) -s RESERVED_FUNCTION_POINTERS=8 -s NO_DYNAMIC_EXECUTION=1 -s RUNNING_JS_OPTS=1

CFLAGS=-std=c++11 -I lib_cpp -I antlr4-runtime-cpp -I antlr4-runtime-cpp/tree -s DISABLE_EXCEPTION_CATCHING=0 -s DEMANGLE_SUPPORT=1  -g -O3

%.bc : %.cpp
	em++ $(CFLAGS)  $< -o $@

libvhdlparser.a: $(OBJ_FILES)
	emar cr $@ $^; ranlib $@

emscripten:
	#-rm $(OBJ_FILES) t/simple.o libvhdlparser.a
	emmake make libvhdlparser.a
	em++ $(CFLAGS) t/simple_node.cpp -L. -lvhdlparser -o testvhdlparser.bc
	em++ -O3 --llvm-lto 1 --memory-init-file 0 $(CFLAGS) $(LDFLAGS) testvhdlparser.bc -o "vhdlparser.js" || exit 1

clean:
	-rm $(OBJ_FILES) t/simple.o libvhdlparser.a libvhdlparser.js
