#include <stdio.h>

int	main()
{
	int	i;
	char 	*str =  " 0 source code\n\tft_putstr(prog);\n\treturn (0);\n}\n";
	i = 0;
	while (str[i])
	{
		i++;
	}
	printf("len %d\n", i);
	return (0);
} 
