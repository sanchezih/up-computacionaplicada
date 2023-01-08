// A C program to demonstrate Orphan Process.
// Parent process finishes execution while the child process is running.
// The child process becomes orphan.

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    printf("===>- EJEMPLO DE ORPHAN -<===\n");

    pid_t pid = fork(); // Creo un proceo hijo. Le retorna al padre el PID del hijo

    if (pid > 0) // Proceso padre
    {
        sleep(30);
        printf("Soy el proceso padre (PID=%d)\n", getpid());
    }

    else if (pid == 0) // Proceso hijo
    {
        printf("Soy el proceso hijo (PID=%d)\n", getpid());

        sleep(60); // Al tener un sleep mayor, el padre muere primero y el hijo queda huerfano
        printf("\nSoy el proceso hijo, ejecutando despues del sleep. Mi padre ya murio. Quede huerfano (PID=%d PPID=%d)\n", getpid(), getppid());
    }
    else
    {
        /* error */
    }

    printf("Fin del proceso %d\n", getpid());
    return 0;
}