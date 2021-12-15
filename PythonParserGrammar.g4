//Grammar file for the Parser

grammar PythonParserGrammar;

@header {
    package antlr;
}

//Full program is a series of 1 or more statements followed by the end of the file
prog: (statement)+ EOF
    ;

//Update statement to include anything that we add
statement: whileloop;

//variable definitions


//if/else blocks


//while loops


//for loops
whileloop: WHILE condition COLON statement+;

//arithmetic operators


//conditional statements

condition: (VAR conditional VAR)(AND condition)*(OR condition)*
    ;

conditional: EQUALTO 
    | NOTEQUALTO 
    | GREATEROREQUAL 
    | LESSOREQUAL 
    | LESSTHAN 
    | GREATERTHAN
    ;

//comments


// ---------------- TOKENS --------------------
//make sure token doesn't already exist before adding it

//loops
WHILE: 'while';
FOR: 'for';
COLON: ':';

//variables
VAR: [a-zA-Z_][a-zA-Z0-9_];

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