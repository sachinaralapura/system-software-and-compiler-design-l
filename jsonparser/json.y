%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
%}

%union {
    const char* stringValue;
    double numberValue ;
}

%token <stringValue> STRING
%token <numberValue> NUMBER
%token LBRACE RBRACE LBRACKET RBRACKET COMMA COLON BOOL NULLVALUE

%type <stringValue> value
%type <stringValue> obj
%type <stringValue> array
%type <stringValue> pair

%%
json : value { printf("Parsing successful!\n"); }
     ;
value : STRING {$$ = $1;}
      | NUMBER {;}
      | LBRACE obj RBRACE {$$ = $2;}
      | LBRACKET array RBRACKET {$$ = $2;}
      | BOOL {$$ ="true";}
      | NULLVALUE {$$ = "null";{}
      ;
obj   : pair  {$$ = $1;}
      | pair COMMA obj {;}
      ;
array : value {$$ = $1;}
      | value COMMA array {;}
      ;
pair  : STRING COLON value {$$ = strcat(strcat($1,":"),$3);}

%%
int main(){
    yyparse();
    return 0;
}
}
void yyerror(const char* message) {
    fprintf(stderr, "Syntax error: %s\n", message);
}