const fs = require('fs');
var antlr4 = require('../src/antlr4/index');
var vhdlLexer = require('../src/vhdlLexer.js');
var vhdlParser = require('../src/vhdlParser.js');
var vhdlVisitor = require('../src/vhdlVisitor.js');
var input = "LIBRARY IEEE; USE IEEE.std_logic_1164.all; package PACK1 is end PACK1;"

fs.readFile('t/iu3.vhd', 'utf8', function (err,data) {
    if (err) {
	return console.log(err);
    }
    input = data;
    var chars = new antlr4.InputStream(input);
    var lexer = new vhdlLexer.vhdlLexer(chars);
    var tokens  = new antlr4.CommonTokenStream(lexer);
    var parser = new vhdlParser.vhdlParser(tokens);
    var visitor = new vhdlVisitor.vhdlVisitor();
    parser.buildParseTrees = true;
    var tree = parser.design_file();
    
});

//console.log(tree);
//visitor.visitDesign_file();
