/* waitpid.c - Esperar la terminación de un proceso hijo */
#include <stdio.h>
#include <signal.h>
#include <sys/wait.h>

main ()
    {
    pid_t id_padre;	/* PID del proceso padre */
    pid_t id_hijo;	/* PID del proceso hijo */
    int   estado;	/* Estado de salida */

    printf ("Ejemplo de waitpid.\n");
    printf ("Inicio proceso padre. PID=%d\n", getpid ());
    id_padre = getpid ();
    if ((id_hijo = fork ()) == 0)
        {		/* Proceso hijo */
        printf ("Inicio proceso hijo. PID=%d, PPID=%d\n",
        getpid (), id_padre);
        sleep (3);
        printf ("Salida proceso hijo. PID=%d\n", getpid ());
        exit (getpid () > id_padre);        /* 1, si PID > PPID */
        }
    else
        {
        signal (SIGINT, SIG_IGN);        /* Ignorar CTRL-C */
        while (waitpid (id_hijo, &estado, 0) != id_hijo);
        if (WIFSIGNALED (estado))
            printf ("El proceso hijo ha recibido la señal %d\n", WTERMSIG (estado));
        if (WIFEXITED (estado))
           {
           printf ("Estado de salida del proceso hijo: %d\n", WEXITSTATUS (estado));
           if (WEXITSTATUS (estado) == 1)
               printf ("PID hijo > PID padre.\n");
           else
               printf ("PID padre > PID hijo.\n");
           }
        printf ("Fin del proceso %d\n", getpid ());
        exit (0);
    }