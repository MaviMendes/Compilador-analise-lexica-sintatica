%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include"lex.yy.c"
    
    void yyerror(const char *s);
    int yylex();
    int yywrap();
    void add(char);
    void insert_type();
    int search(char *);
    void insert_type();

    struct info_dado {
        char * nome_id;
        char * tipo_dado;
        char * tipo;
        int linha;
    } symbol_table[40];

    int count=0;
    int q;
    char tipo[10];
    extern int countn;
%}

%token FN VAR WHILE IF NUMERO MAIN NOME LE GE EQ NE GT LT AND OR  ADD MULTIPLY DIVIDE MODULE SUBTRACT ADDSUB  NOT RETURN 

%%


programa: lista_funcoes
;


lista_funcoes: funcao 
| funcao lista_funcoes
;

funcao: chamada_funcao   lista_parametros  lista_corpo RETURN
| chamada_funcao  lista_corpo RETURN 
;

lista_parametros: parametro
| parametro lista_parametros
;

parametro: variavel
;

variavel: NOME;

valor: NUMERO;

/*
operacoes 
	not 
	subtract 

desvio de fluxo 
	while 
	if



    FN        [reduce using rule 11 (lista_corpo)]
    VAR       [reduce using rule 11 (lista_corpo)]
  
    NUMERO    [reduce using rule 11 (lista_corpo)]
    NOME      [reduce using rule 11 (lista_corpo)]
 
    RETURN    [reduce using rule 11 (lista_corpo)]

*/

lista_corpo: corpo 
| corpo lista_corpo 
;

corpo: expressoes
|proposicao
;

expressoes:variavel  binarias valor  // ok state 12 
| variavel binarias variavel
| unarias variavel 
| unarias valor



proposicao: declaracaoVariavel
| atribuicao
| desvioFluxo
| valor ADDSUB
| variavel ADDSUB
| RETURN 
| chamada_funcao
;

chamada_funcao: FN '(' lista_parametros ')'
;

declaracaoVariavel: VAR '=' valor
;

condicao: variavel logicas variavel
| variavel logicas valor 
| valor logicas variavel
;

binarias: LE | GE | EQ | NE | GT | LT | AND | OR  | ADD | SUBTRACT | MULTIPLY | DIVIDE | MODULE
;

unarias: SUBTRACT | NOT
;

logicas: LE | GE | EQ | NE | GT | LT
;



desvioFluxo: IF   condicao  lista_corpo 
| WHILE condicao  lista_corpo 
;

atribuicao: NOME '=' NUMERO 
| NOME '=' NOME
;

%%

int main() {
  yyparse();
  printf("\n\n");
	printf("\t\t\t\t\t\t\t\t TABELA DE SIMBOLOS \n\n");
	printf("\nSIMBOLO   TIPO_DADO   TIPO   LINHA \n");
	printf("_______________________________________\n\n");
	int i=0;
	for(i=0; i<count; i++) {
		printf("%s\t%s\t%s\t%d\t\n", symbol_table[i].nome_id, symbol_table[i].tipo_dado, symbol_table[i].tipo, symbol_table[i].linha);
	}
	for(i=0;i<count;i++) {
		free(symbol_table[i].nome_id);
		free(symbol_table[i].tipo);
	}
	printf("\n\n");
}

int search(char *tipo) {
	int i;
	for(i=count-1; i>=0; i--) {
		if(strcmp(symbol_table[i].nome_id, tipo)==0) {
			return -1;
			break;
		}
	}
	return 0;
}

void add(char c) {
  q=search(yytext);
  if(!q) {
        if(c == 'V') {
			symbol_table[count].nome_id=strdup(yytext);
			symbol_table[count].tipo_dado=strdup(tipo);
			symbol_table[count].linha=countn;
			symbol_table[count].tipo=strdup("Variavel");
			count++;
		}
		else if(c == 'C') {
			symbol_table[count].nome_id=strdup(yytext);
			symbol_table[count].tipo_dado=strdup("INT");
			symbol_table[count].linha=countn;
			symbol_table[count].tipo=strdup("Constante");
			count++;
		}
		else if(c == 'F') {
			symbol_table[count].nome_id=strdup(yytext);
			symbol_table[count].tipo_dado=strdup(tipo);
			symbol_table[count].linha=countn;
			symbol_table[count].tipo=strdup("Funcao");
			count++;
		}
	}
}
 

void yyerror(const char* msg) {
  fprintf(stderr, "%s\n", msg);
}