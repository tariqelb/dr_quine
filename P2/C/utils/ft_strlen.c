#include <stdio.h>
#include <string.h>

int	main()
{
	char *str = "#define FN int main(){FILE *f=fopen('output.txt','w');int i=0;int prog[]=PROG;for (int i=0;i<73&&prog[i]!=0;i++){fprintf(f,'%c',prog[i]);}fprinf(f,'%c', 123);for(int i=0;i<120&&prog[i]!=0;i++){fprintf(f,'%d, ',prog[i]);}fprintf(f, '%c', 125);for(int i=120;i<130&&prog[i]!=0;i++){fprintf(f,'%c',prog[i]);}fclose(f);return(0);}\n#define MAIN FN\n\nMAIN\n";
	printf("Strlen : %ld\n", strlen(str));
	return (0);
}
