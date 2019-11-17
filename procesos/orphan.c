// A C program to demonstrate Orphan Process.  
// Parent process finishes execution while the 
// child process is running. The child process 
// becomes orphan.

#include <stdio.h> 
#include <sys/types.h>
#include <unistd.h>

int main()
{ 
    // Create a child process
    pid_t pid = fork();
  
    if (pid > 0)
    printf ("Padre. PID=%d\n", getpid ());

    // Note that pid is 0 in child process
    // and negative if fork() fails 
    else if (pid == 0)
    {
        printf ("Inicio proceso hijo. PID=%d, PPID=%d\n",
    getpid (), getppid ());

        sleep(30);
printf ("El proceso queda huérfano. PID=%d PPID=%d\n",
    getpid (), getppid ());
        }

    printf ("Fin del proceso %d\n", getpid ());
    return 0; 
}