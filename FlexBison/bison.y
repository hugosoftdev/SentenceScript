%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyparse();
extern FILE* yyin;
void yyerror(const char* s);
%}

%union {
	int ival;
	char *idval;
}

%token<ival> integer
%token<idval> ident

%token se entao caso_contrario fim condicao enquanto fim_do_loop criar como numero booleano chamar
%token e ou nao codigo bloco mostre_me entrada verdade falso pbegin pend comma identifier int


%start program

%%

program: 
       subdec
	   | funcdec
;

subdec:
    codigo ident pbegin argumentDeclaration pend statements fim codigo
    | codigo ident pbegin  pend statements fim codigo

funcdec:
    bloco ident pbegin argumentDeclaration pend como type statements fim bloco
    | codigo ident pbegin  pend como type statements fim bloco


statements: 
         statement statements
       | statement  
;

statement:
      ident "="   relExpression                                              
    | chamar ident pbegin arguments  pend                                                                                                               
    | mostre_me relExpression                                                        
    | enquanto relExpression statements fim_do_loop                                  
    | se relExpression entao statements fim condicao                                         
    | se relExpression entao statements caso_contrario statements fim condicao 
    | criar ident como type         
;

type:
    numero
    | booleano
;

argumentDeclaration:
      identifier
    | identifier comma argumentDeclaration
;


relExpression:
      expression
    | expression "=" expression
    | expression ">" expression
    | expression "<" expression
;

expression:
      term
    | term "+" expression
    | term "-" expression
    | term ou expression
;

term:
      factor
    | factor "*" term
    | factor "/" term
    | factor e term
;

factor:
      integer
    | ident
    | verdade
    | falso
    | nao factor
    | "+" factor
    | "-" factor
    | ident pbegin pend
    | ident pbegin arguments pend
    | entrada
;

arguments:
      relExpression 
    | relExpression comma arguments
;

%%
int main() {
	yyin = stdin;
	do {
		yyparse();
	} while(!feof(yyin));
	return 0;
}
void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}