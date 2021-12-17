//Grammar file for the Parser

grammar ob;


tokens {INDENT,  DEDENT}

//Full program is a series of 1 or more statements followed by the end of the file
prog: (statement)+ EOF;


statement: 
    (assignment | fncstatement|flow) NEWLINE
    |ctrlstatement NEWLINE | NEWLINE
    ;
assignment: IDENTIFIER assignop expression;
fncstatement:IDENTIFIER'('expression (','expression)*')';
flow: 'break' | 'continue';
ctrlstatement: whileloop | ifelse | forloop;

ifelse: 'if'  condition ':' iblock ('elif' condition ':' iblock)* ('else' ':' iblock)?;
whileloop: 'while' condition ':' iblock;
iblock: NEWLINE statement+ ;
comparator: '==' | '>' | '<'| '>=' | '<=' | '!=' | 'and' | 'not' ;
condition: expression (comparator expression)*
    | '('expression comparator expression')'
    | tf
    ;

expression:
    expression((math)expression)+
    | fncstatement
    | IDENTIFIER
    | '('expression')'
    | num
    | string
    
    ;
    

// ---------------- RULES --------------------
    
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

indentblock: NEWLINE statement+;

elifblock: 'elif' condition ':' iblock;

elseblock: 'else' ':' iblock;

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

//comments
comment: COMMENT 
    ;


// ---------------- TOKENS --------------------

SKIP_
    : ( SPACES | COMMENT ) -> skip
    ;

//variables
//VAR: [a-zA-Z_][a-zA-Z0-9_]*;
IDENTIFIER: [a-zA-Z_]+[a-zA-Z0-9_]*;

//data types
INT: '-'?[0-9][0-9]*;
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
