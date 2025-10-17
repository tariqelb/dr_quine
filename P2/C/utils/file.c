#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int	main(int ac, char **av)
{
	char c;
	int i;
	int fd;
	int byte;
	int index1 = 0;
	int index2 = 0;
	int comma = 0;
	
	if (ac != 2)
		return (printf("Add file name as arg\n"));
	fd = open(av[1], O_RDONLY);
	byte = read(fd, &c, 1);
	while (byte)
	{
		if (c == 123 && !index1)
			index1 = i;	
		if (c == 125 && !index2)
			index2 = i;
		if (index1 && !index2 && c == ',')
			comma++;
		byte = read(fd, &c, 1);
		if (index1 && !index2 && c == ',')
			i++;
		else if (index2 || index1 == 0)
			i++;
	}
	printf("indexs 1[%d] 2[%d] comma[%d] i[%d]\n", index1, index2, comma , i);
	return (0);
}
