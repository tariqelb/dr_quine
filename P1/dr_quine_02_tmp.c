#include <unistd.h>

//this string array hold the whole program in ascii code


char prog[] = {};

int	ft_putint(int nbr);
int	ft_putstr(char *str);

int	ft_putstr(char *str)
{
	int	i;
	int	flag;

	flag = 0;
	
	i = 0;
	while (str[i])
	{
		if (i > 94 && i < 987 && flag == 0)
		{
			int j = 0;
			while (str[j])
			{
				ft_putint((int) str[j]);
				j++;
			}
			write(1, "0", 1);
			flag = 1;
			i = 1094;
		}
		else
			write(1, &str[i], 1);
		i++;
	}
	return (i);
}

int	ft_putint(int nbr)
{
	char	tab[10];
	int		i;
	int		nb;

	nb = 0;
	i = 0;
	if (nbr <= 0)
	{
		if (nbr == 0)
			return (ft_putstr("0"));
		else if (nbr == -2147483648)
			return (ft_putstr("-2147483648"));
		else
			nb = nb + ft_putstr("-");
		nbr = nbr * -1;
	}
	while (nbr)
	{
		tab[i++] = (nbr % 10) + 48;
		nbr /= 10;
	}
	nb = nb + i;
	while (i)
		write(1, &tab[--i], 1);
	write(1, ", ", 2);
	return (nb);
}

int	main(void)
{
	//By call ft_putstr prog you get the same source code
	ft_putstr(prog);
	return (0);
}












