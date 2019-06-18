%{
#include <string>
#include "node.h"
#include "parser.hpp"
#define SAVE_TOKEN yylval.string = new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)
extern "C" int yywrap() { }
%}

%%

"se" {return se;}
"entao" {return entao;}
"caso_contrario" {return caso_contrario;}
"fim" {return fim;}
"condicao" {return condicao;}
"enquanto" {return enquanto;}
"fim_do_loop" {return fim_do_loop;}
"criar" {return criar;}
"como" {return como;}
"numero" {return numero;}
"booleano" {return booleano;}
"chamar" {return chamar;}
"e" {return e;}
"ou" {return ou;}
"nao" {return nao;}
"codigo" {return codigo;}
"bloco" {return bloco;}
"mostre_me" {return mostre_me;}
"entrada" {return entrada;}
"verdade" {return verdade;}
"falso" {return falso;}
"("                     {return pbegin;}
")"                     {return pend;}
","                     {return comma;}
[ \t\n]                 ; //ignore whitespaces and linebreaks
[a-zA-Z_][a-zA-Z0-9_]*  SAVE_TOKEN; return ident;
[0-9]+                  SAVE_TOKEN; return int;

.                       printf("Found undefined token"); yyterminate();

%%