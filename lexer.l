%{
    #include "y.tab.h"
    int countn=0;
%}

%option yylineno

alpha [a-zA-Z]
digit [0-9]
underscore "_"
add_sub "++"|"--"


%%


"var"                       { return VAR; }
"main"                      {return MAIN;}
"return"                    { return RETURN; }
"fn"                        {return FN;}      
"while"	                    { return WHILE; }
"if"	                    { return IF; }
[-]?{digit}+                { return NUMERO; }
{alpha}({alpha})*({underscore})*  { return NOME; }
{add_sub}                     { return ADDSUB; } 
"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
">"	                        { return GT; }
"<"	                        { return LT; }
"&&"	                    { return AND; }
"||"	                    { return OR; }
"+"                         { return ADD; }
"-"                         { return SUBTRACT; }
"/"                         { return DIVIDE; }
"%"                         { return MODULE; }
"*"                         { return MULTIPLY; }
"!"                         {return NOT;}
\/\/.*                      { ; }
\/\*(.*\n)*.*\*\/           { ; } 
[ \t]*                      { ; }
[\n]                        { countn++; }
.	                    { return *yytext; }

%%

int yywrap() {
    return 1;
}