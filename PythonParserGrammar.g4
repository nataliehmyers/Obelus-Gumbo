//Grammar file for the Parser

//TODO: Fix strings so they can hold more than just letters and numbers

grammar PythonParserGrammar;

tokens {
    INDENT,
    DEDENT
}

@header {
    package antlr;
}

//Full program is a series of 1 or more statements followed by the end of the file
prog: (statement)+ EOF
    ;

//Update statement to include anything that we add
statement: whileloop
    | assignment
    ;

//variable definitions
assignment: VAR assignop value NEWLINE;

assignop: math EQUALS
    | EQUALS
    ;

value: INT
    | FLOAT
    | string
    | bool
    ;

bool: TRUE | FALSE
    ;

string: QUOTE STRINGVALUE QUOTE
    ;

//if/else blocks
ifelse: IF condition COLON indentblock elifblock* elseblock
    ;

indentblock: NEWLINE INDENT statement+ DEDENT
    ;

elifblock: ELIF condition COLON indentblock
    ;

elseblock: ELSE indentblock
    ;

//for loops


//while loops
whileloop: WHILE condition COLON statement+
    ;

//arithmetic operators
math: PLUS
    | MINUS
    | DIV
    | MULT
    | MOD
    ;

mathexpr: VAR math num;

num: VAR
    | INT
    | FLOAT
    ;

//var can be expression, variable name, string, or number
var: mathexpr
    | num
    | string
    ;

//conditional statements
condition: (var conditional var)(AND condition)*(OR condition)*
    | bool
    ;

conditional: EQUALTO 
    | NOTEQUALTO 
    | GREATEROREQUAL 
    | LESSOREQUAL 
    | LESSTHAN 
    | GREATERTHAN
    ;

//comments
//TODO: find a way to ignore the rest of the line after comment token
comment: COMMENT 
    ;

// ---------------- TOKENS --------------------
//make sure token doesn't already exist before adding it

//if
IF: 'if';
ELSE: 'else';
ELIF: 'elif';

//loops
WHILE: 'while';
FOR: 'for';
COLON: ':';

//variables
VAR: [a-zA-Z_][a-zA-Z0-9_];

//data types
INT: [1-9][0-9]*;
FLOAT: [1-9][0-9]*'.'[0-9]+;
QUOTE: '"';
STRINGVALUE: [0-9a-zA-Z];
TRUE: 'True';
FALSE: 'False';

//assignment
EQUALS: '=';
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
XOR: '^';
MOD: '%';

//conditional statements
OPENPAREN: '(';
CLOSEPAREN: ')';
LESSTHAN: '<';
LESSOREQUAL: '<=';
GREATERTHAN: '>';
GREATEROREQUAL: '>=';
EQUALTO: '==';
NOTEQUALTO: '!=';
AND: 'and';
OR: 'or';

//structure
COMMENT: '#';
NEWLINE: ('\r\n'|'\n'|'\r');