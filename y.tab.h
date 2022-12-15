/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    FN = 258,                      /* FN  */
    VAR = 259,                     /* VAR  */
    WHILE = 260,                   /* WHILE  */
    IF = 261,                      /* IF  */
    NUMERO = 262,                  /* NUMERO  */
    MAIN = 263,                    /* MAIN  */
    NOME = 264,                    /* NOME  */
    LE = 265,                      /* LE  */
    GE = 266,                      /* GE  */
    EQ = 267,                      /* EQ  */
    NE = 268,                      /* NE  */
    GT = 269,                      /* GT  */
    LT = 270,                      /* LT  */
    AND = 271,                     /* AND  */
    OR = 272,                      /* OR  */
    ADD = 273,                     /* ADD  */
    MULTIPLY = 274,                /* MULTIPLY  */
    DIVIDE = 275,                  /* DIVIDE  */
    MODULE = 276,                  /* MODULE  */
    SUBTRACT = 277,                /* SUBTRACT  */
    ADDSUB = 278,                  /* ADDSUB  */
    NOT = 279,                     /* NOT  */
    RETURN = 280                   /* RETURN  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define FN 258
#define VAR 259
#define WHILE 260
#define IF 261
#define NUMERO 262
#define MAIN 263
#define NOME 264
#define LE 265
#define GE 266
#define EQ 267
#define NE 268
#define GT 269
#define LT 270
#define AND 271
#define OR 272
#define ADD 273
#define MULTIPLY 274
#define DIVIDE 275
#define MODULE 276
#define SUBTRACT 277
#define ADDSUB 278
#define NOT 279
#define RETURN 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
