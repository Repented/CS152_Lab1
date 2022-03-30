   /* cs152-calculator */
   
%{   
   /* write your C code here for defination of variables and including headers */
   int count_int, count_operator, count_parens, count_equal = 0;
%}


   /* some common rules, for example DIGIT */
DIGIT    [0-9]
   
%%
   /* specific lexer rules in regex */

"="            {printf("EQUAL\n"); count_equal++; }
{DIGIT}+       {printf("NUMBER %s\n", yytext); count_int++; }
"+"	       {printf("PLUS \n"); count_operator++; }
"-" 	       {printf("MINUS \n"); count_operator++; }
"*"	       {printf("MULT \n"); count_operator++; }
"/"	       {printf("DIV \n"); count_operator++; }
"("	       {printf("L_PAREN \n"); count_parens++; }
")"	       {printf("R_PAREN \n"); count_parens++; }
%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   if (argc > 1) {
	FILE *newfile = fopen(argv[argc-1], "r");
   	if (!newfile) {
		return -1;
   	}
   	yyin = newfile;
   	while (yylex());
   	fclose(newfile);
   } else {
	//ASK: WHAT DOES THE TA WANT FOR CML INPUT???
   	yylex();
   }
   printf("Number of Equals: %d\n", count_equal);
   printf("Number of Numbers: %d\n", count_int);
   printf("Number of Operators: %d\n", count_operator);
   printf("Number of Parentheses: %d\n", count_parens);
}

