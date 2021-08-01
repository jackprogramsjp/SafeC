%{
    #include "utils.h"
    #include "y.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror (char *s);
    int yylex(void);
%}

whitespace      [ \t\r\v\f]
linefeed        \n

%%
"string"    |
"number"                    { yylval.data_type = safec_strdup(yytext); return DATATYPE; }

"<"                         { return LT; }
">"                         { return GT; }
";"                         { return SEMI; }

[-+]?[0-9]*\.?[0-9]+        { yylval.number = strtod(yytext, NULL); return NUMBER; }

[a-zA-Z][_a-zA-Z0-9]*       { yylval.identifier = safec_strdup(yytext); return IDENTIFIER; }
(\[\])[a-zA-Z][_a-zA-Z0-9]* { yylval.identifier = safec_strdup(yytext); return LIST_IDENTIFIER; }

\"(\\.|[^"])*\"             { yylval.string = safec_strdup(yytext); return STRING; }

{linefeed}                  { yylineno++; }
{whitespace}                ;
.                           { yylval.other = safec_strdup(yytext); return OTHER; }

%%

void
yyerror (char *s) {
    fprintf(stderr, "\nError on LINE %d:\n\n%s\n", yylineno, s);
}
