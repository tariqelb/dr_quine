#include <unistd.h>
#include <stdio.h>


//I just see a short answer that use variable and i will try it
void	ft_putstr(char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		write(1, &str[i], 1);
		i++;
	}
	return;
}

void	ft_print_str_case(char *str, int flag)
{
	int	i;
	int	j = 92;
	int	k = 34;
	int	o = 59;

	if (flag == 2)
	{
		write(1, "str = ", 6);
		write(1, &k, 1);
		flag--;
	}
	i = 0;
	while (str[i])
	{
		if (flag == 1 && (str[i] == 92) && i > 836 && i < 937)
			write(1, &j, 1);
		if (flag && str[i] == 34)
		{
			write(1, &j, 1);
			write(1, &k, 1);
		}
		else if (flag && str[i] == 10)
		{
			write(1, &j, 1);
			write(1, "n", 1);
		}
		else if (flag && str[i] == 9)
		{
			write(1, &j, 1);
			write(1, "t", 1);
		}
		else
			write(1, &str[i], 1);
		i++;
	}
	if (flag == 1)
	{
		//write(1, &j, 1);
		write(1, &k, 1);
		write(1, &o, 1);
		ft_print_str_case("\n\tft_putstr(str);\n\tft_print_str_case(str, 2);\n\treturn (0);\n}\n", 0);
	}
	return;
}


int	main(void)
{

	//use string variable hold the wall program
	char *str;

	str = "#include <unistd.h>\n#include <stdio.h>\n\n\n//I just see a short answer that use variable and i will try it\nvoid\tft_putstr(char *str)\n{\n\tint\ti;\n\n\ti = 0;\n\twhile (str[i])\n\t{\n\t\twrite(1, &str[i], 1);\n\t\ti++;\n\t}\n\treturn;\n}\n\nvoid\tft_print_str_case(char *str, int flag)\n{\n\tint\ti;\n\tint\tj = 92;\n\tint\tk = 34;\n\tint\to = 59;\n\n\tif (flag == 2)\n\t{\n\t\twrite(1, \"str = \", 6);\n\t\twrite(1, &k, 1);\n\t\tflag--;\n\t}\n\ti = 0;\n\twhile (str[i])\n\t{\n\t\tif (flag == 1 && (str[i] == 92) && i > 836 && i < 937)\n\t\t\twrite(1, &j, 1);\n\t\tif (flag && str[i] == 34)\n\t\t{\n\t\t\twrite(1, &j, 1);\n\t\t\twrite(1, &k, 1);\n\t\t}\n\t\telse if (flag && str[i] == 10)\n\t\t{\n\t\t\twrite(1, &j, 1);\n\t\t\twrite(1, \"n\", 1);\n\t\t}\n\t\telse if (flag && str[i] == 9)\n\t\t{\n\t\t\twrite(1, &j, 1);\n\t\t\twrite(1, \"t\", 1);\n\t\t}\n\t\telse\n\t\t\twrite(1, &str[i], 1);\n\t\ti++;\n\t}\n\tif (flag == 1)\n\t{\n\t\t//write(1, &j, 1);\n\t\twrite(1, &k, 1);\n\t\twrite(1, &o, 1);\n\t\tft_print_str_case(\"\\n\\tft_putstr(str);\\n\\tft_print_str_case(str, 2);\\n\\treturn (0);\\n}\\n\", 0);\n\t}\n\treturn;\n}\n\n\nint\tmain(void)\n{\n\n\t//use string variable hold the wall program\n\tchar *str;\n\n\t";
	ft_putstr(str);
	ft_print_str_case(str, 2);
	return (0);
}
