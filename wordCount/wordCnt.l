%{
unsigned int charcount= 0;
int wordcount = 0;
int linecount=0;
int blanckcount =0; 
%}
word [^ \t\n]+
eol \n

%%
[ ] {blanckcount++;}
{word} {wordcount++;charcount+=yyleng; }
{eol}  {linecount++;}
%%

int main(int argc,char** argv){
    if(argc>1){
        FILE *file;
        file =fopen(argv[1],"r");
        if(!file){
            fprintf(stderr,"could not open %s\n",argv[1]);
            exit(1);
        }
        yyin = file;
        yylex();
        printf("\n character count: %u",charcount);
        printf("\n wordcount: %u",wordcount);
        printf("\n linecount: %u",linecount);
        printf("\n blanckcount: %d",blanckcount);
        return(0);
    }
    else{
        printf("Enter argument");
    }
}