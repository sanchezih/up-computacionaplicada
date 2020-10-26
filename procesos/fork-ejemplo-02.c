/* fork.c - Ejecucion conjunta de procesos padre e hijo */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(void)
{
	printf("===>- EJEMPLO DE FORK -<===\n");

	printf("Inicio del proceso padre (PID=%d - PPID=%d)\n", getpid(), getppid());

	pid_t pid = fork(); // Creo un proceo hijo. Le retorna al padre el PID del hijo

	if (pid > 0) // Proceso padre
	{
		printf("Continuación del padre... (PID=%d - PPID=%d)\n", getpid(), getppid());
		sleep(1);
	}
	else if (pid == 0) // Proceso hijo
	{
		printf("Inicio proceso hijo (PID=%d - PPID=%d)\n", getpid(), getppid());
		sleep(1);
	}
	else
	{
		/* error */
	}

	printf("Fin del proceso %d\n", getpid());
	return 0;
}