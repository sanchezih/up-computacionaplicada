// A C program to demonstrate Orphan Process.
// Parent process finishes execution while the child process is running.
// The child process becomes orphan.

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    pid_t pid = fork(); // Creo un proceo hijo

    if (pid > 0)
    {
        sleep(30);
        printf("Soy el proceso padre (PID=%d)\n", getpid());
    }

    // Si pid es 0, estoy hablando del hijo. Si es negativo es porque fork() se ejecuto con error
    else if (pid == 0)
    {
        printf("Soy el proceso hijo (PID=%d)\n", getpid());

        sleep(60); // Al tener un sleep mayor, el padre muere primero y el hijo queda huerfano
        printf("\nSoy el proceso hijo, ejecutando despues del sleep. Mi padre ya murio. Quede huerfano (PID=%d PPID=%d)\n", getpid(), getppid());
    }

    printf("Fin del proceso %d\n", getpid());
    return 0;
}