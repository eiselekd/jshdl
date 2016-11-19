#include <iostream>
#include "antlr4-runtime.h"
#include "vhdlLexer.h"
#include "vhdlParser.h"
#include "vhdlBaseListener.h"
#include <emscripten/emscripten.h>

//using namespace org::antlr::v4::runtime;
using namespace vhdl;

class TreeShapeListener : public vhdlBaseListener {
public:
  void enterKey(Ref<ParserRuleContext> ctx) {
    // Do something when entering the key rule.
  }
};

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

  /*Ref<tree::ParseTree> tree = */ parser.design_file();
  //Ref<TreeShapeListener> listener(new TreeShapeListener());
  //tree::ParseTreeWalker::DEFAULT->walk(listener, tree);

  return 0;
}
