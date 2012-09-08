#include <stdio.h>
#include <time.h>

int main(){
	time_t  time0, time1;						// time_t is defined in <time.h> as long
	clock_t clock0, clock1;						// clock_t is defined in <time.h> as int
	int c1, c2, c3, c4, c5, c6, c7;				// test faces running from 0 to 12
	int t, k, validKey;							// t=trial key, k=index searched key, validKey=boolean attribute to t (1=valid)
	int i, j;									// indexes running through sums
	int sums[50000], sumCounter;				// array of all possible sums of key[c1-7]
	
	int key[13]={1, 2, 4, 8, 16, 32, 64, 128, 0, 0, 0, 0, 0};	// init keys
	
	time0 = time(NULL);
	clock0 = clock();

	
	k=8;
	while(k<=12){								//------------------choose nb keys to search (<=12)
		t=key[k-1]+1;
		do{
			key[k]=t;
			validKey=1;
			sumCounter=0;  
			// 7 suited cards
			for(c1=0; c1<=k; c1++){
				for(c2=c1+1; c2<=k; c2++){
					for(c3=c2+1; c3<=k; c3++){
						for(c4=c3+1; c4<=k; c4++){
							for(c5=c4+1; c5<=k; c5++){
								for(c6=c5+1; c6<=k; c6++){
									for(c7=c6+1; c7<=k; c7++){
										sums[sumCounter]=key[c1]+key[c2]+key[c3]+key[c4]+key[c5]+key[c6]+key[c7];
										sumCounter++;
									}
								}
							}
						}
					}
				}
			}
			// 6 suited cards
			for(c1=0; c1<=k; c1++){
				for(c2=c1+1; c2<=k; c2++){
					for(c3=c2+1; c3<=k; c3++){
						for(c4=c3+1; c4<=k; c4++){
							for(c5=c4+1; c5<=k; c5++){
								for(c6=c5+1; c6<=k; c6++){
									sums[sumCounter]=key[c1]+key[c2]+key[c3]+key[c4]+key[c5]+key[c6];
									sumCounter++;
								}
							}
						}
					}
				}
			}
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
gcc -Wall -g -O3 PokerKeysGenFlushSeven.c -o PokerKeysGenFlushSeven
time -p ./PokerKeysGenFlushSeven
--------------------------------------------------------
	key[8] = 240
		clock time (s) for key[8] =	0
		CPU time (s) for key[8] =	0.000454
	key[9] = 464
		clock time (s) for key[9] =	0
		CPU time (s) for key[9] =	0.002380
	key[10] = 896
		clock time (s) for key[10] =	0
		CPU time (s) for key[10] =	0.009687
	key[11] = 1728
		clock time (s) for key[11] =	0
		CPU time (s) for key[11] =	0.040221
	key[12] = 3328
		clock time (s) for key[12] =	0
		CPU time (s) for key[12] =	0.164690
real 0.17
user 0.16
sys 0.00
*/


