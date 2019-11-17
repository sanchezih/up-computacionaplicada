// A C program to demonstrate Zombie Process.  
// Child becomes Zombie as parent is sleeping 
// when child process exits. 
#include <stdlib.h> 
#include <sys/types.h> 
#include <unistd.h>

int main()
{ 
    // Fork returns process id 
    // in parent process
    pid_t pid = fork();
  


    if(pid > 0){ // padre
		sleep(10);
	}
	else if(pid == 0){ // hijo
		 exit(0); 
	}
	else{
		/* error */
	}
        
  
    return 0; 
}