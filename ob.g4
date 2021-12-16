//Grammar file for the Parser

//TODO: Fix strings so they can hold more than just letters and numbers

grammar ob;

INDENT: '12312312312312323w4234dsf';
DEDENT: '23123sdfd';
//Full program is a series of 1 or more statements followed by the end of the file
prog: (statement)+ EOF
    ;

//Update statement to include anything that we add
statement: whileloop
    | assignment
    | NEWLINE
    | ifelse
    ;

//variable definitions
assignment: VAR assignop value NEWLINE
    | VAR assignop VAR NEWLINE
;

assignop: math EQUALS
    | EQUALS
    ;

value: INT
    | FLOAT
    | string
    | boolean
    ;

boolean: TRUE | FALSE
    ;

string: STRINGVALUE
    ;

//if/else blocks
ifelse: 'if'  condition ':' indentblock elifblock* (elseblock)?
    ;

indentblock: NEWLINE statement+
    ;

elifblock: 'elif' condition ':' indentblock
    ;

elseblock: 'else' ':' indentblock
    ;

//for loops


//while loops
whileloop: 'while' condition ':' indentblock
    ;

//arithmetic operators
math: PLUS
    | MINUS
    | DIV
    | MULT
    | MOD
    ;

mathexpr: VAR math num
;

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
//expressions should be able to be multiple expressions <added> together
condition: test
    | boolean
    ;
test: var (comparator var)*;

comparator: '==' | '>' | '<'| '>=' | '<=' | '!=' | 'and' | 'not' | 'or';

//comments
//TODO: find a way to ignore the rest of the line after comment token
comment: COMMENT 
    ;

// ---------------- TOKENS --------------------
//make sure token doesn't already exist before adding it

SKIP_
    : ( SPACES | COMMENT ) -> skip
    ;

//loops


//variables
VAR: [a-zA-Z_][a-zA-Z0-9_]*;

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
SPACES: ' ';
COMMENT: '#' ~[\r\n\f]*;
NEWLINE: ('\r\n'|'\n'|'\r')' '*;

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
