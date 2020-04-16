//YACC

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token LBRACKET RBRACKET QUOTE COLON COMMA LBRACE RBRACE NUM ALFA

%%

JPARSE:
	  SENTENCE {printf ("VALIDO\n"); return 0; }
	  ;

SENTENCE:
		LBRACE THINGS RBRACE
		;

THINGS:
		THING
		|THING COMMA THINGS
		;

THING:
	 QUOTE ALFA QUOTE COLON ELEMENT
	 ;

ELEMENT:
	   NUM
	   |QUOTE ALFA QUOTE
	   |LBRACE THINGS RBRACE
	   |RBRACKET LBRACKET
	   |RBRACKET OBJECTS LBRACKET
	   ;

OBJECTS: 
	   OBJECT
	   |OBJECT COMMA OBJECTS
	   |RBRACKET OBJECTS LBRACKET
	   |RBRACKET  LBRACKET
	   ;

OBJECT:
	  NUM
	  |QUOTE ALFA QUOTE
	  ;



%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
