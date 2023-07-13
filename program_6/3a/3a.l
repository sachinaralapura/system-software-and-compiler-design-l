%{
    #include <stdio.h>
    int ccount =0;
%}
%%
"/*"[^*/]*"*/"      {ccount++;printf("%s\n",yytext);}
"//".*              {ccount++;printf("%s\n",yytext);}                 
%%

int main(int argc  , char** argv){
    FILE *f1 ,*f2;
    if(argc > 1){
        f1 = fopen(argv[1],"r");
        if(!f1){
            printf("Error in opening input file\n");
            exit(1);
        }

        yyin = f1;
        f2 = fopen(argv[2],"w");
        
        if(!f2){
            printf("Error in opening output file\n");
            exit(1);
        }

        yyout = f2;
        yylex();

        printf("Number of comment lines : %d\n",ccount);
    }
}