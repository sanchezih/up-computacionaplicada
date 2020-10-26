/*
	EXPLICACION DE LA FUNCION FORK
	
	pid_t fork(void)
		> crea un nuevo proceso (hijo)
		> el proceso hijo es un duplicado del "padre"
		> los dos procesos:
			- tienen PIDs diferentes
			- corren en espacios de memoria separados

	retorno del fork
		> si todo va bien
			- retorna al padre:	pid del hijo
			- retorna al hijo:	0

		> si hay errores
			- retorna al padre:	-1
			- retorna al hijo:	N/A -> el hijo no es creado
*/

#include <unistd.h>
#include <stdio.h>

int var = 222;

int main(void)
{
	printf("\n===> Soy el proceso padre iniciado - Mi PID es %d <===\n\n", getpid());

	pid_t pidC; 	// pid_t es un tipo de dato entero capaz de representar un process ID
	pidC = fork(); 	// se genera un hijo y retorna el pid de este

	printf("-> Soy el proceso %d. Mi hijo es %d\n", getpid(), pidC);
	

	if (pidC > 0)
	{ // padre
		var = 444;
	}
	else if (pidC == 0)
	{ // hijo
		var = 333;
	}
	else
	{
		/* error */
	}

	// este while se estara ejecutando simultaneamente en los dos procesos
	while (1)
	{
		sleep(3);
		printf("Soy el proceso %d. El valor de mi variable var es %d\n", getpid(), var);

		if (pidC > 0)
		{
			printf("----------------------------------------------\n");
		}
	}
	return 0;
}