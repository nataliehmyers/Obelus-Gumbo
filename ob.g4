//Grammar file for the Parser

//TODO: Fix strings so they can hold more than just letters and numbers

grammar ob;

tokens {INDENT,  DEDENT}
//Full program is a series of 1 or more statements followed by the end of the file
prog: (statement)+ EOF;

//Update statement to include anything that we add
//statement: whileloop
//    | assignment
//    | NEWLINE
//    | ifelse
//    | '(' statement ')'
//    | printstatement
//    ;

//Simon's redefinition v1



statement: (assignment | fncstatement|flow) NEWLINE |ctrlstatement NEWLINE | NEWLINE;
assignment: IDENTIFIER assignop expression;
fncstatement:IDENTIFIER'('expression (','expression)*')'; // is this just identifer expression?
flow: 'break' | 'continue';
ctrlstatement: whileloop | ifelse | forloop;

ifelse: 'if'  condition ':' iblock ('elif' condition ':' iblock)* ('else' ':' iblock)?;
whileloop: 'while' condition ':' iblock;
iblock: NEWLINE statement+ ;
comparator: '==' | '>' | '<'| '>=' | '<=' | '!=' | 'and' | 'not' ;
condition: expression (comparator expression)*
    | tf
    ;

expression:
      expression((math)expression)+
    | IDENTIFIER
    | '('expression')'
    | num
    | string
    | fncstatement
    ;
//variable definitions
forloop: 'for' expression 'in' expression ':' iblock('else' ':' iblock)?;

assignop: math EQUALS
    | EQUALS
    ;

value: INT
    | FLOAT
    | string
    | tf
    ;

tf: TRUE | FALSE
    ;

string: STRINGVALUE
    ;

//if/else blocks


indentblock: NEWLINE statement+;

elifblock: 'elif' condition ':' iblock;

elseblock: 'else' ':' iblock;

//for loops
//printstatement: 'print' statement;

//while loops
//whileloop: 'while' condition ':' indentblock;

//arithmetic operators
math: PLUS
    | MINUS
    | DIV
    | MULT
    | MOD
    ;

mathexpr: IDENTIFIER math num
;

num: IDENTIFIER
    | INT
    | FLOAT
    ;

//var can be expression, variable name, string, or number
var: mathexpr
    | num
    | string
    ;

//conditional statements
//expressions should be able to be multiple expressions <added> together




//comments
//TODO: find a way to ignore the rest of the line after comment token
comment: COMMENT 
    ;

// ---------------- TOKENS --------------------
//make sure token doesn't already exist before adding it
//skipping whitespaces?




SKIP_
    : ( SPACES | COMMENT ) -> skip
    ;

//loops


//variables
//VAR: [a-zA-Z_][a-zA-Z0-9_]*;
IDENTIFIER: [a-zA-Z_]+[a-zA-Z0-9_]*;
//data types
INT: [0-9][0-9]*;
FLOAT: [1-9][0-9]*'.'[0-9]+;
QUOTE: '"';
STRINGVALUE: '"'.+?'"';
TRUE: 'True';
FALSE: 'False';

//assignment
EQUALS: '=' | '-=' | '+=';
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
XOR: '^';
MOD: '%';

//conditional statements
OPENPAREN: '(';
CLOSEPAREN: ')';

//structure
fragment SPACES: ' ';
fragment LINE_JOINING: '\\' SPACES? ( '\r'? '\n' | '\r' | '\f' );
COMMENT: '#' ~[\r\n\f]*;
NEWLINE: ('\r\n'|'\n'|'\r')' '*;
