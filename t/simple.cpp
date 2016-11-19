#include <iostream>
#include "antlr4-runtime.h"
#include "vhdlLexer.h"
#include "vhdlParser.h"
#include "vhdlBaseListener.h"

using namespace vhdl;

int main(int argc, const char* argv[]) {

  std::ifstream stream;
  stream.open("iu3.vhd");
  ANTLRInputStream input(stream);
  vhdlLexer lexer(&input);
  CommonTokenStream tokens(&lexer);
  vhdlParser parser(&tokens);

  parser.design_file();

  return 0;
}
