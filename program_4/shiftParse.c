#include <stdio.h>
#include <string.h>
char a[15], stk[15], act[15];
int c, i = 0, j = 0, z = 0;
void check();
int main()
{
    puts("The Grammer is\nE->E+T|T\nT->T*F|F\nF->(E)|id\n");
    puts("enter the input string\n");
    gets(a);
    c = strlen(a);
    strcpy(act, "shift->");
    puts("\nStack\t\tInput\t\tAction");
    puts("\n----------------------------------------------\n");
    printf("$\t%s$", a);
    for (i = 0, j = 0; j < c; i++, j++)
    {
        if (a[j] == 'i' && a[j + 1] == 'd')
        {
            stk[i] = a[j];
            stk[i + 1] = a[j + 1];
            stk[i + 2] = '\0';
            a[j] = ' ';
            a[j + 1] = ' ';
            printf("\n$%s\t%s$\t\t%sid", stk, a, act);
            j++;
            i++;
            check();
        }
        else
        {
            stk[i] = a[j];
            stk[i + 1] = '\0';
            a[j] = ' ';
            printf("\n$%s\t%s$\t\t%s%c", stk, a, act, stk[i]);
            check();
        }
    }

    z = 0;
    if (stk[z] == 'E' && strlen(stk) == 1)
    {
        printf("\n\n\tsuccess");
    }
    else
    {
        printf("Error");
    }
}

void check()
{                           // reduce action
    for (z = 0; z < c; z++) // reduce F->(E)
    {
        if (stk[z] == '(' && stk[z + 1] == 'E' && stk[z + 2] == ')')
        {
            stk[z] = 'F';
            stk[z + 1] = '\0';
            stk[z + 2] = '\0';
            printf("$%s\t%s$\tR\teduce (E) to F", stk, a);
            i -= 2;
        }
    }

    for (z = 0; z < c; z++) // reduce F->id
    {
        if (stk[z] == 'i' && stk[z + 1] == 'd')
        {
            stk[z] = 'F';
            stk[z + 1] = '\0';
            printf("\n$%s\t%s$\t\tReduce id to F", stk, a);
            i = i - 1;
        }
    }

    for (z = 0; z < c; z++)
    { // reduce T->T*F|F
        if (stk[z] == 'T' && stk[z + 1] == '*' && stk[z + 2] == 'F')
        {
            stk[z] = 'T';
            stk[z + 1] = '\0';
            stk[z + 2] = '\0';
            printf("\n$%s\t%s$\t\tReduce T*F to T", stk, a);
            i = i - 2;
        }
        else if (stk[z] == 'F')
        {
            stk[z] = 'T';
            printf("\n$%s\t%s$\t\tReduce F to T", stk, a);
        }
    }

    for (z = 0; z < c; z++)
    {
        if (stk[z] == 'E' && stk[z + 1] == '+' && stk[z + 2] == 'T' && stk[z + 3] == '*')
        {
            break;
        }
        if (stk[z] == 'E' && stk[z + 1] == '+' && stk[z + 2] == 'T')
        {
            if (a[j + 1] == '*')
            {
                break;
            }

            else
            {
                stk[z] = 'E';
                stk[z + 1] = '\0';
                stk[z + 2] = '\0';
                printf("\n$%s\t%s$\t\tReduce E+T to E", stk, a);
                i = i - 2;
            }
        }
        else if(stk[z] == 'T' && stk[z+1]!= '*' && a[j+1] != '*'){
            stk[z] = 'E';
            printf("\n$%s\t%s$\t\tReduce T to E",stk,a);
        }
    }
}