#include <stdio.h>
#include <string.h>
char prod[3][15] = {"A->aBa", "B->bB", "B->@"};
char table[2][3][3] = {
    {"aBa", "", ""},
    {"@", "bB", ""}};

int size[2][3] = {3, 0, 0, 1, 2, 0};
char action[20];
char s[20], stack[20];
int flag = 0;
int n;
char c;
void display(int i, int j)
{
    int k = 0;
    if (flag)
    {
        printf("%s", action);
        printf("\n");
    }
    for (k = 0; k <= i; k++)
        printf("%c", stack[k]);
    printf("\t");
    for (k = j; k < n; k++)
        printf("%c", s[k]);
    printf("\t");
    flag = 1;
}

int main()
{
    int i, j, k, row, col;
    printf("The Grammer is \n");
    for (i = 0; i < 3; i++)
        printf("%s\t", prod[i]);
    printf("The parsing table is \n");
    printf("\ta\tb\t$\n");
    printf("-------------------------\n");
    for (i = 0; i < 2; i++)
    {
        if (i == 0)
            printf("A");
        else
            printf("\nB");
        for (j = 0; j < 3; j++)
        {
            printf("\t%s", table[i][j]);
        }
    }
    printf("\nenter a string\n");
    scanf("%s", s);
    strcat(s, "$");
    n = strlen(s);
    stack[0] = '$';
    stack[1] = 'A';
    i = 1;
    j = 0;
    printf("\nstack\tinput\tAction\n");
    printf("-------------------------------\n");
    display(i, j);
    while(1)
    {
        if (stack[i] == s[j])
        {
            strcpy(action, "match ");
            c = stack[i];
            strcat(action, &c);
            i--;
            j++;
            if (stack[i] == '$' && s[j] == '$')
            {
                printf("%s", action);
                printf("\n\n\tSUCCESS");
                break;
            }
            else if (stack[i] == '$' && s[j] != '$')
            {
                printf("Error");
                break;
            }
            display(i, j);
        }
        switch (stack[i])
        {
        case 'A':
            row = 0;
            break;
        case 'B':
            row = 1;
            break;
        }

        switch (s[j])
        {
        case 'a':
            col = 0;
            break;
        case 'b':
            col = 1;
            break;
        case '$':
            col = 2;
            break;
        }

        if (table[row][col][0] == '\0')
        {
            printf("error");
            break;
        }
        else if (table[row][col][0] == '@')
        {
            i--;
            strcpy(action, "output B->@");
            display(i, j);
        }
        else
        {
            strcpy(action, "output");
            if (stack[i] == 'A')
                strcat(action, prod[0]);
            else
                strcat(action, prod[1]);
            for (k = size[row][col] - 1; k >= 0; k--)
            {
                stack[i] = table[row][col][k];
                i++;
            }
            i--;
            display(i, j);
        }
    }
}