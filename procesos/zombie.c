// A C program to demonstrate Zombie Process.
// Child becomes Zombie as parent is sleeping when child process exits.

#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
	pid_t pid = fork(); // Creo un proceo hijo. Le retorna al padre el PID del hijo

	if (pid > 0) // Proceso padre
	{
		sleep(10);
	}
	else if (pid == 0) // Proceso hijo
	{
		exit(0);
	}
	else
	{
		/* error */
	}

	return 0;
}