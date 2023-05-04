#include <stdio.h>
#include "example.h"
extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[] = {NULL , "db_type","db_name","db_table","db_port"};
int main(){
    printf("Enter the expression\n");
    int ntoken , vtoken;
    ntoken = yylex();
    while(ntoken){
        printf("%d\n",ntoken);
        if(yylex()!= COLON){
            printf("syntax error in line %d , Expected a ':' but fount %s\n",yylineno,yytext);
        }
        ntoken = yylex();
    }
    return 0; 
}