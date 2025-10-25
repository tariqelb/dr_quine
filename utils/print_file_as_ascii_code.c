#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>


int	main(int ac, char **av)
{
	int	nbyte;
	int	fd;
	char	c;
	int	i;
	int	flag;
	int	fd_2;
	int 	alrd = 0;

	int index1 = 0;
	int index2 = 0;

	flag = 0;
	i = 0;
	if (ac != 2)
		printf("The program take file name as first arg\n");
	fd = open(av[1], O_RDONLY);
	fd_2 = open(av[1], O_RDONLY);
	nbyte = read(fd, &c, 1);
	printf("file in ascii code : char prog[] = {");
	while (nbyte > 0)
	{
		i++;
		printf("%d", (int) c);
		if (flag == 0)
			nbyte = read(fd, &c, 1);
		else
		{
			if (index1 == 0)
				index1 = i;
			flag = 1;	
			alrd = 1;
			nbyte = read(fd_2, &c, 1);
		}
		if (nbyte > 0)
			printf(", ");
		if (flag == 1 && nbyte == 0)
		{
			if (index2 == 0)
				index2 = i;
			nbyte = read(fd, &c, 1);
			flag = 0;
			printf(", ");
		}	
		if (flag == 0 && i == 23 && alrd == 0)
			flag = 1;
	}
	printf(", 0};\ti = [%d][%d][%d]\n", i, index1, index2);
	close(fd);
	return (0);
}
