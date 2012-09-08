#include <stdio.h>
#include <time.h>

int main(){
	time_t  time0, time1;						// time_t is defined in <time.h> as long
	clock_t clock0, clock1;						// clock_t is defined in <time.h> as int
	int c1, c2, c3, c4, c5;						// test faces running from 0 to 12
	int t, k, validKey;							// t=trial key, k=index searched key, validKey=boolean attribute to t (1=valid)
	int i, j;									// indexes running through sums
	int sums[50000], sumCounter;				// array of all possible sums of key[c1-7]
	
	int key[13]={0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};	// init keys
	
	time0 = time(NULL);
	clock0 = clock();

	
	k=3;
	while(k<=12){								//------------------choose nb keys to search (<=12)
		t=key[k-1]+1;
		do{
			key[k]=t;
			validKey=1;
			sumCounter=0;  

			for(c1=0; c1<=k; c1++){
				for(c2=c1; c2<=k; c2++){
					for(c3=c2; c3<=k; c3++){
						for(c4=c3; c4<=k; c4++){
							for(c5=c4; c5<=k; c5++){
								if(c1!=c5){
									sums[sumCounter]=key[c1]+key[c2]+key[c3]+key[c4]+key[c5];
									sumCounter++;
								}
							}
						}
					}
				}
			}

			i=0;
			do{
				j=i+1;
				do{
					if(sums[i]==sums[j]){validKey=0;}
					j++;
					}while(validKey==1 && j<sumCounter);
				i++;
			}while(validKey==1 && i<sumCounter-1);

			if(validKey==1){
				printf("\tkey[%d] = %d\n", k, t);
				time1 = time(NULL);
				clock1 = clock();
				printf("\t\tclock time (s) for key[%d] =\t%ld\n", k, (long)(time1 - time0));
				printf("\t\tCPU time (s) for key[%d] =\t%f\n", k, (float)(clock1 - clock0)/CLOCKS_PER_SEC);
			}
			else{
				t++;
			}
		}while(validKey==0);
		k++;
	}
	
	time1 = time(NULL);
	clock1 = clock();
	
	return 0;
}





/*output
gcc -Wall -g -O3 PokerKeysGenFaceFive.c -o PokerKeysGenFaceFive
time -p ./PokerKeysGenFaceFive
---------------------
key[3] = 22
		clock time (s) for key[3] =	0
		CPU time (s) for key[3] =	0.000051
	key[4] = 94
		clock time (s) for key[4] =	0
		CPU time (s) for key[4] =	0.000175
	key[5] = 312
		clock time (s) for key[5] =	0
		CPU time (s) for key[5] =	0.001144
	key[6] = 992
		clock time (s) for key[6] =	0
		CPU time (s) for key[6] =	0.010285
	key[7] = 2422
		clock time (s) for key[7] =	0
		CPU time (s) for key[7] =	0.053959
	key[8] = 5624
		clock time (s) for key[8] =	0
		CPU time (s) for key[8] =	0.290745
	key[9] = 12522
		clock time (s) for key[9] =	1
		CPU time (s) for key[9] =	1.447149
	key[10] = 19998
		clock time (s) for key[10] =	3
		CPU time (s) for key[10] =	3.551235
	key[11] = 43258
		clock time (s) for key[11] =	17
		CPU time (s) for key[11] =	17.407356
	key[12] = 79415
		clock time (s) for key[12] =	64
		CPU time (s) for key[12] =	63.929813
real 63.94
user 63.90
sys 0.02
*/


