%{
FILE *fout,*fin;
%}
%%
"." {fprintf(yyout,"\n");}
%%
int main(){
    fin = fopen("qb.txt","r");
    yyin = fin;
    fout = fopen("qb1.txt","w");
    yyout = fout;
    yylex();
    return 0;
}