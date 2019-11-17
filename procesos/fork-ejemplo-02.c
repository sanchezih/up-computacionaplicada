/* fork.c - Ejecución conjunta de procesos padre e hijo */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main (void)
{
	pid_t pid = fork();

	printf ("Ejemplo de fork.\n");

    printf ("Inicio del proceso padre. PID=%d\n", getpid ());

    if (pid == 0)
	{	
		/* Proceso hijo */
		printf ("Inicio proceso hijo. PID=%d, PPID=%d\n",
		getpid (), getppid ());
		sleep (1);
	}
    else
	{	
		/* Proceso padre */
		printf ("Continuación del padre. PID=%d\n", getpid ());
		sleep (1);
	}

    printf ("Fin del proceso %d\n", getpid ());
    return 0; 
}