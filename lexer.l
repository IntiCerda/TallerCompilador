%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap

%%

"//".* { /* Ignorar comentarios */ }


[0-9]+\.[0-9]+          { yylval.flt = atof(yytext); return FLOAT; } 
[0-9]+                  { yylval.num = atoi(yytext); return NUMBER; } 

"true"                  { yylval.boolean = 1; return BOOLEAN; }
"false"                 { yylval.boolean = 0; return BOOLEAN; }

"aer"            { return PRINT; } // Cambié "aer" a "papuPrint"
"when"                  { return WHEN; }
"but"                   { return BUT; }
"if"                    { return IF; }
"else"                  { return ELSE; }
"while"                 { return WHILE; }
"for"                   { return FOR; }

// Operadores
"="                     { return ASSIGN; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return MULT; }
"/"                     { return DIV; }
"%"                     { return MOD; }
"&&"                    { return AND; }
"||"                    { return OR; }
"!"                     { return NOT; }
"=="                    { return EQ; }
"<="                    { return LE; }
">="                    { return GE; }
"<"                     { return LT; }
">"                     { return GT; }
"!="                    { return NE; }

// Delimitadores
"🔥"                     { return SEMICOLON; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }


[a-zA-Z_][a-zA-Z0-9_]*  { yylval.id = strdup(yytext); return IDENTIFIER; }

[ \t\n]+                ; // Ignorar espacios en blanco

.                       { printf("Carácter inesperado: %s\n", yytext); exit(1); } // Manejo de caracteres no reconocidos

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error léxico: %s\n", s);
}