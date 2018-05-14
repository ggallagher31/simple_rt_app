#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <error.h>


int main(int argc, char *argv[]) 
{
    struct timespec sleep, rsleep;

    sleep.tv_sec = 1;
    sleep.tv_nsec = 0;
   
    
    while(1) {
        clock_nanosleep(CLOCK_REALTIME, 0, &sleep, &rsleep);
        printf("Hello Xeno World\n");
    }

    return 0;
}

