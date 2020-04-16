
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[{] { 
	return LBRACE;
	}

[}] {
	return RBRACE;
	}

[\"] {
	 return QUOTE;
	 }

[:] {
	return COLON;
	}

[,] {
	return COMMA;
	}


[]] {
	return LBRACKET;
	}

[[] {
	return RBRACKET;
	}

[0-9]+[.]?[0-9]+ {
				 return NUM;
				 }

[a-zA-Z0-9]+([ ]*[a-zA-Z0-9])* {
								return ALFA;
								}

. ;
\n ;
[ ];





%%

int yywrap() {
  return 1;
}
