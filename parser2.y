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

programa: corpo programa;


corpo: funcao
| funcao corpo 


funcao: FN '(' lista_parametros ')' '{' body RETURN valor ';' '}'



lista_parametros: parametro
| parametro lista_parametros
;

parametro: NOME
;

body: proposicoes 
| proposicoes body; 

proposicao: declaracaoVariavel
|atribuicao
|desvioFluxo
|operacoes 


declaracaoVariavel: VAR  '=' valor

desvioFluxo: IF '(' condicao  ')' '{' body '}'
| WHILE '(' condicao ')' '{' body '}'


condicao: variavel logicas variavel
|variavel logicas valor
|valor logicas valor 



valor: NUMERO;
variavel: NOME; 






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
		else if(c == 'PR') {
			symbol_table[count].nome_id=strdup(yytext);
			symbol_table[count].tipo_dado=strdup(tipo);
			symbol_table[count].linha=countn;
			symbol_table[count].tipo=strdup("Palavra reservada");
			count++;
		}
	}
}
 

void yyerror(const char* msg) {
  fprintf(stderr, "%s\n", msg);
}