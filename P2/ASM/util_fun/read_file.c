#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>


int	main(int ac, char **av)
{
	int	i;
	int	fd;
	char	c;
	int	nbyte;

	i = 0;
	if (ac != 2)
		return (printf("Add file name\n"));
	fd = open(av[1], O_RDONLY);
	nbyte = read(fd, &c, 1);
	printf("File as ascii code : [");
	while (nbyte)
	{
		printf("%d", (int) c);
		i++;
		nbyte = read(fd, &c, 1);
		if (nbyte)
			printf(", ");
		
	}
	printf("], : %d\n", i);
	close(fd);
	return (0);
}
