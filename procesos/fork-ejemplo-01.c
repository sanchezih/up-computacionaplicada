/*
	** fork() - procesos padre, hijo, huerfano y zombie **

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

int var = 22;

int main (void){

	pid_t pidC; // The pid_t data type is a signed integer type which is capable
				// of representing a process ID

	printf(" ** soy el padre - proc.PID = %d ** \n", getpid());

	pidC = fork(); // se genera un hijo y retorna el pid de este

	printf("proc.PID = %d , pidC = %d ejecutandose \n", getpid(), pidC);

	if(pidC > 0){ // padre
		var = 44;
	}
	else if(pidC == 0){ // hijo
		var = 33;
	}
	else{
		/* error */
	}

	// este while se estara ejecutando simultaneamente en los dos procesos
	while(1){
		sleep(3);
		printf("yo soy el proceso %d. mi valor de var es %d\n", getpid(), var);
		
		if(pidC > 0){
			printf("----------------------------------------------\n");
		}
	}
	return 0;
}