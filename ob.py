import sys
from antlr4 import *
from obLexer import obLexer
from obParser import obParser
 
def main(argv):
    input_stream = FileStream(argv[1])
    lexer = obLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = obParser(stream)
    tree = parser.prog()
 
if __name__ == '__main__':
    main(sys.argv)
