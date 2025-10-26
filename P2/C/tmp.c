#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>

#define PROG {}
#define FN int main(){FILE *f=fopen("Grace_kid.c","w");int prog[]=PROG;for (int i=0;i<92&&prog[i]!=0;i++){fprintf(f,"%c",prog[i]);}fprintf(f,"%c", 123);for(int i=0;i<464&&prog[i]!=0;i++){fprintf(f,"%d, ",prog[i]);}fprintf(f, "0%c", 125);for(int i=94;i<464&&prog[i]!=0;i++){fprintf(f,"%c",prog[i]);}fclose(f);return(0);}
#define MAIN FN

//This program use macro 

MAIN
