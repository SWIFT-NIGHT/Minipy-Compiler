%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
   int ligne =1; 
   int Col;
   int cpt;
%}
lettreM [A-Z]
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettreM}({lettre}|{chiffre})*
cstint [+-]?[chiffre]+
cstfloat [+ -]? [chiffre]*\.[chiffre]*+\
cstchar \'[^']\'
cststring \"[^"]*\"
cstbool {true}|{false}
comment  #([^!]|\n)*?!
%%
IF { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext );   Col = Col + strlen(yytext); return mot_cle_if; }

ELSE { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_else; }

WHILE { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_while; }

FOR { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_for; }

RETURN { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_return; }


INT { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_int; }

FLOAT { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_float; }

CHAR { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_char; }

STRING { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_string; }

BOOL { rechercher (yytext,"Mot cle "," ",0, 1); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext);  return mot_cle_bool; }

{IDF} { 
			  rechercher(yytext,"IDF","",0,0);  
              Col= Col + strlen(yytext);
			  if (ligne>8) printf ("Erreur Lexical: IDF trop long a la ligne %d a la colonne %d \n ",ligne, Col);
              else {printf (" L entite lexicale reconnue est %s \n", yytext); 
					return idf;}
		  }
{cstint} { 
			  if ((atoi(yytext)>-32768)&&(atoi(yytext)<32767)){		  
              rechercher(yytext,"Cst entiere","INTEGER",atof(yytext),0); 
			  Col= Col + strlen(yytext); 
			  printf ("L entite lexicale reconnue est %s \n", yytext);
			  return cstint;
			  }else printf ("Erreur Lexical: constante entiere trop grande a la ligne %d a la colonne %d \n ",ligne, Col);
		     }

"." { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext );  Col = Col + strlen(yytext); return point; }

"+" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext );     Col = Col + strlen(yytext); return op_arith_plus;}

"-" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext );    Col = Col + strlen(yytext); return op_arith_moin;}

"/" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext );    Col = Col + strlen(yytext); return op_arith_division;}

"*" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext );  Col = Col + strlen(yytext); return op_arith_multip;}

"=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext );  Col = Col + strlen(yytext); return egale;}

"(" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return parouv;}

")" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return parferm;}

"{" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return acouv;}

"}" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return acferm;}

";" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return point_virgule;}

"," { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return virgule;}

"[" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return croouv;}

"]" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return croferm;}

"&&" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_logique_et;}

"||" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_logique_ou;}

"!" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_logique_non;}

">" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_rel_sup;}

">=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_rel_sup_egal;}

"<" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_rel_inf;}

"<=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_rel_inf_egal;}

"==" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_rel_egal;}

"!=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_rel_diff;}

"++" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_inc;}

"--" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_dec;}

"=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_affect;}

"+=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_affect_plus;}

"-=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_affect_moins;}

"*=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_affect_mult;}

"/=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_affect_div;}

"%=" { rechercher (yytext,"Separateur "," ",0, 2); printf("Entite Lexical reconnue %s \n" , yytext ); Col = Col + strlen(yytext); return op_affect_mod;}


{comment} {
                cpt=0;
                while(yytext[cpt]!='\0')
                { if(yytext[cpt]=='\n')
                    {Col=1; ligne++;}
                  else {Col++;}
				        cpt++;
	            }
              }	

[ \t] 	Col=Col+strlen(yytext);
\n { ligne++; Col=1; }
. printf ("Entite lexicale non reconnue a ligne %d a la colonne %d \n", ligne, Col);
%%