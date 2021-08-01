%{
    #include <stdlib.h>
    #include "ast.h"
    #define YYSTYPE SafeC_Node *

    static YYSTYPE saved_tree;
%}

%define parser.error verbose

%union {
    char *data_type;
    char *string;
    char *identifier;
    double number;
    char *other;
}

%token <string> STRING
%token <string> IDENTIFIER LIST_IDENTIFIER
%token <string> DATATYPE OTHER
%token <number> NUMBER
%token SEMI LT GT

%%

program         : stmt_seq
                    { saved_tree = $1; }

stmt_seq        : stmt_seq SEMI stmt
                    {
                        YYSTYPE t = $1; 

                        if (t != NULL) {
                            while (t->sibling != NULL) {
                                t = t->sibling;
                            }
                            t->sibling = $3;
                            $$ = $1;
                        } else {
                            $$ = $3;
                        }
                    }
