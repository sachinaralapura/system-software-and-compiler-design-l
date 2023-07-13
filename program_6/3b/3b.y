%{
    #include <stdio.h>
    #include <stdlib.h>
    extern FILE *yyin;
    extern FILE *yyout;
    int id= 0, dig = 0,key =0 , op = 0;

%}

%token NUM ID KEY OP 

 %%
input : NUM input {dig++;}
|ID input       {id++;}
|KEY input      {key++;}
|OP input       {op++;}
|NUM            {dig++;}
|ID             {id++;}
|KEY            {key++;}
|OP             {op++;}
; 
 %%

 main(){
    FILE *myfile = fopen("1.c","r");
    if(!myfile){
        printf("error in file opening");
        return -1;
    }

    yyin = myfile;
    FILE *outfile = fopen("2.c","w");
    yyout = outfile;
    yyparse();
    printf("numbers:%d\n keywords:%d\n Identifiers: %d\n operators:%d \n ",dig,key,id,op);
    
 }

void yyerror(){
    printf("parsing error\n");
    exit(-1);
}