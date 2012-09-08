#include <stdio.h>
#include <time.h>

int main(){
	time_t  time0, time1;						// time_t is defined in <time.h> as long
	clock_t clock0, clock1;						// clock_t is defined in <time.h> as int
	int c1, c2, c3, c4, c5;						// test faces running from 0 to 12
	int t, k, validKey;							// t=trial key, k=index searched key, validKey=boolean attribute to t (1=valid)
	int i, j;									// indexes running through sums
	int sums[50000], sumCounter;				// array of all possible sums of key[c1-7]
	
	int key[13]={0, 1, 2, 4, 8, 16, 32, 0, 0, 0, 0, 0, 0};	// init keys
	
	time0 = time(NULL);
	clock0 = clock();

	
	k=7;
	while(k<=12){								//------------------choose nb keys to search (<=12)
		t=key[k-1]+1;
		do{
			key[k]=t;
			validKey=1;
			sumCounter=0;  

			// 5 suited cards
			for(c1=0; c1<=k; c1++){
				for(c2=c1+1; c2<=k; c2++){
					for(c3=c2+1; c3<=k; c3++){
						for(c4=c3+1; c4<=k; c4++){
							for(c5=c4+1; c5<=k; c5++){
								sums[sumCounter]=key[c1]+key[c2]+key[c3]+key[c4]+key[c5];
								sumCounter++;
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
gcc -Wall -g -O3 PokerKeysGenFlushFive.c -o PokerKeyGenFlushFive
time -p ./PokerKeyGenFlushFive
--------------------------------------------------------
	key[7] = 56
		clock time (s) for key[7] =	0
		CPU time (s) for key[7] =	0.000059
	key[8] = 104
		clock time (s) for key[8] =	0
		CPU time (s) for key[8] =	0.000147
	key[9] = 192
		clock time (s) for key[9] =	0
		CPU time (s) for key[9] =	0.000497
	key[10] = 352
		clock time (s) for key[10] =	0
		CPU time (s) for key[10] =	0.001771
	key[11] = 672
		clock time (s) for key[11] =	0
		CPU time (s) for key[11] =	0.005440
	key[12] = 1288
		clock time (s) for key[12] =	0
		CPU time (s) for key[12] =	0.020506
real 0.02
user 0.02
sys 0.00
*/


