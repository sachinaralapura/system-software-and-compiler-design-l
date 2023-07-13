%{
int pf=0;
int sf =0;
%}
%%
"printf" {fprintf(yyout,"readf");pf++;}
"scanf"  {fprintf(yyout,"writef");sf++;}
"/*"[^*/]*"*/"  {;}
"//".*          {;}
%%

int main(int argc,char** argv[]){
    yyin =fopen(argv[1],"r");
    yyout = fopen(argv[2],"w");
    yylex();
    return 0;
}