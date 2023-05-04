#include <stdio.h>
int main(){
    char sym[10];
    sym[1] = 'a';
    sym[2] = 'b';
    printf("%s",&sym[1]);
    printf("%s",&sym[2]);
}