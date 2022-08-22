#include <stdio.h>
#include <unistd.h>
 
main(){
	printf("UID: %d, EUID: %d\n",getuid(),geteuid());
}