#include <iostream>
#include "antlr4-runtime.h"
#include "vhdlLexer.h"
#include "vhdlParser.h"
#include "vhdlBaseListener.h"
#include <emscripten/emscripten.h>

using namespace vhdl;

int main(int argc, const char* argv[]) {

  EM_ASM(
    FS.mkdir('/working');
    FS.mount(NODEFS, { root: '.' }, '/working');
  );

  std::ifstream stream;
  stream.open("/working/t/iu3.vhd");
  ANTLRInputStream input(stream);
  vhdlLexer lexer(&input);
  CommonTokenStream tokens(&lexer);
  vhdlParser parser(&tokens);

  parser.design_file();
  return 0;
}
