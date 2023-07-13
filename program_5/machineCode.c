#include <stdio.h>
#include <string.h>
char op[2],arg1[15],arg2[15],result[10];
int main(){
    FILE *input , *output;
    input = fopen("input.txt","r");
    output = fopen("output.txt","w");
    while(!feof(input)){
        fscanf(input,"%s%s%s%s\n",result,arg1,op,arg2);
        printf("%s",op);
        if(strcmp(op,"+")==0){
            fprintf(output,"\nMOV R0,%s",arg1);
            fprintf(output,"\nADD R0,%s",arg2);
            fprintf(output,"\nMOV %s,R0",result);
        }
        if(strcmp(op,"-")==0){
            fprintf(output,"\nMOV R0,%s",arg1);
            fprintf(output,"\nSUB R0,%s",arg2);
            fprintf(output,"\nMOV %s,R0",result);
        }
        if(strcmp(op,"*")==0){
            fprintf(output,"\nMOV R0,%s",arg1);
            fprintf(output,"\nMUL R0,%s",arg2);
            fprintf(output,"\nMOV %s,R0",result);
        }
        if(strcmp(op,"/")==0){
            fprintf(output,"\nMOV R0,%s",arg1);
            fprintf(output,"\nDIV R0,%s",arg2);
            fprintf(output,"\nMOV %s,R0",result);
        }
        if(strcmp(op,"=")==0){
            fprintf(output,"\nMOV R0,%s",arg1);
            fprintf(output,"\nMOV %s,R0",result);
        }
    }
    fclose(input);
    fclose(output);
    return 0;
}