#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include "dmx.h"

int *dmx_maxchannels;
int *dmx_shutdown;
int *dmx_caps;
int *dmx_channels;

int *shm;
int shmid;

void dmx_open()
{
    
    shmid=shmget(0x56444D58,sizeof(int)*522, 0666);
    shm=(int *)shmat(shmid,NULL,0);
    dmx_maxchannels=shm;
    dmx_shutdown=shm+1;
    dmx_caps=shm+2;
    dmx_channels=shm+10;
}

void dmx_close()
{
    shmdt(shm);
}

int main(int argc, char* argv[])
{
    int chan = 0;
    int val  = 0;

    dmx_open();

    if(argc == 3) {
	chan = atoi(argv[1]);
	val  = atoi(argv[2]);

	if(0 <= chan && chan <= 512 && 0 <= val && val <= 255) {
	    dmx_channels[chan]=val;
	} else {
	    fprintf(stderr, "Invalid channel or value: 0 <= channel <= 512, 0 <= value <= 255\n");
	}
    } else if(argc == 2) {
	chan = atoi(argv[1]);
	if(0 <= chan && chan <= 512) {
	    printf("%i\n", dmx_channels[chan]);
	}
    } else {
	printf("Usage: k8062 [channel] (value)\n");
    }

    dmx_close();
}
