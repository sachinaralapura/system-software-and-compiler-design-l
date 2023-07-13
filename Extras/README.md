# system-software-and-compiler-design-l
The lab programs of system software and compiler design of VTU 2018 syllabus
1. ## Program1 
 -------------------------------------------------
>> ### 1a
    Write a LEX program to recognize valid arithmetic expression. Identifiers in the
    expression could be only integers and operators could be + and *. Count the identifiers &
    operators present and print them separately.

    Execution Steps:
    - lex 1a.l
    - cc lex.yy.c –ll
    - . /a.out
  
>> ### 1b 
    Write YACC program to evaluate arithmetic expression involving operators:
    and /

    Execution Steps:
    - yacc –d 1b.y
    - lex 1b.l
    - cc lex.yy.c y.tab.c –ll
    - . /a.out

>> ### example2
    Lex and yacc program to evaluate arthematic expression and implement a simple symbol table

    Execution steps 
    - yacc -d parser.y
    - lex lex.l
    - cc lex.tab.c y.tab.c -ll
    - ./a.out

    - use only a single alphabet character a - identifier . 
    - Number of identifier is restricted to 52
    
    keywords 
    - print identifier // prints identifier
    - All              // prints all identifier 
    - exit             // exits 
  
    

