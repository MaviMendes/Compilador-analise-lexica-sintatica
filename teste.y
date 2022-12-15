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

    struct dataType {
        char * id_name;
        char * data_type;
        char * type;
        int line_no;
    } symbol_table[40];

    int count=0;
    int q;
    char type[10];
    extern int countn;
%}

%token FN VAR WHILE IF NUMERO MAIN NOME LE GE EQ NE GT LT AND OR  ADD MULTIPLY DIVIDE MODULE SUBTRACT ADDSUB  NOT RETURN 

%%



program: FN { add('F'); } NOME  '(' parametros ')' '{' corpo return'}'
| FN MAIN { add('F'); } '(' ')' '{' corpo return'}'
;

funcao: FN { add('F'); } NOME  '(' parametros ')' '{' corpo return'}'
;

parametros: NOME { add('V'); }
| parametros ','
;

corpo: expressoes
| proposicao
|corpo corpo
;

expressoes: declaracaoVariavel
//|IF { add('k'); } NOME { add('V'); } 
//| WHILE { add('K'); } NUMERO { add('C'); } 
| NOME { add('V'); } binarias NOME { add('V'); }
| NOME { add('V'); } binarias NUMERO { add('C'); }
| NUMERO { add('C'); } binarias NUMERO { add('C'); }
| unarias NOME { add('V'); }
| unarias NUMERO { add('C'); }
;


declaracaoVariavel: VAR NOME { add('V'); } '=' NUMERO { add('C'); } ';'
;

condicao: valor logicas valor
;

binarias: LE | GE | EQ | NE | GT | LT | AND | OR  | ADD | SUBTRACT | MULTIPLY | DIVIDE | MODULE
;

unarias: SUBTRACT | NOT
;

logicas: LE | GE | EQ | NE | GT | LT
;

return: RETURN valor ';'
;

valor: NUMERO { add('C'); }
| NOME { add('V'); }
;


proposicao: declaracaoVariavel
| atribuicao
| desvioFluxo
| laco 
//| IF { add('K'); } expressoes '{' corpo '}'
//| WHILE { add('K'); } expressoes '{' corpo '}'
| valor ADDSUB
| return 
| funcao
|
;

desvioFluxo: IF { add('K'); } condicao '{' corpo '}'
;
laco: WHILE { add('K');} condicao '{' corpo '}'
;

// identificadores: Um identificador (nome) é uma letra, opcionalmente seguida por letras e underscores “_”.

/*declaracoes: VAR atribuicao ';'
| VAR atribuicao declaracoes // "recursividade" tipo  var i=1; t=4;
; ja tem declaracaoVariavel*/

atribuicao: NOME '=' NUMERO ';'
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
		printf("%s\t%s\t%s\t%d\t\n", symbol_table[i].id_name, symbol_table[i].data_type, symbol_table[i].type, symbol_table[i].line_no);
	}
	for(i=0;i<count;i++) {
		free(symbol_table[i].id_name);
		free(symbol_table[i].type);
	}
	printf("\n\n");
}

int search(char *type) {
	int i;
	for(i=count-1; i>=0; i--) {
		if(strcmp(symbol_table[i].id_name, type)==0) {
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
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].data_type=strdup(type);
			symbol_table[count].line_no=countn;
			symbol_table[count].type=strdup("Variavel");
			count++;
		}
		else if(c == 'C') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].data_type=strdup("INT");
			symbol_table[count].line_no=countn;
			symbol_table[count].type=strdup("Constante");
			count++;
		}
		else if(c == 'F') {
			symbol_table[count].id_name=strdup(yytext);
			symbol_table[count].data_type=strdup(type);
			symbol_table[count].line_no=countn;
			symbol_table[count].type=strdup("Funcao");
			count++;
		}
	}
}
 

void yyerror(const char* msg) {
  fprintf(stderr, "%s\n", msg);
}