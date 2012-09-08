#include <stdio.h>
#include <time.h>

int main(){
	time_t  time0, time1;						// time_t is defined in <time.h> as long
	clock_t clock0, clock1;						// clock_t is defined in <time.h> as int
	int c1, c2, c3, c4, c5, c6, c7;				// test suit running from 0 to 3
	int k1, k2, k3, k4;							// candidate keys
	int highBound, validKey, c;					// highBound=max value of a key; validKey=boolean (1=valid); c=number of 4 key sets
	int i, j;									// indexes running through sums
	int sums[50000], sumCounter;				// array of all possible sums of key[c1-7]
	
	int key[4]={0, 0, 0, 0};					// keys
	
	time0 = time(NULL);
	clock0 = clock();
	
	highBound=37;
	c=0;
	
	for(k1=0; k1<=highBound; k1++){
		for(k2=k1; k2<=highBound; k2++){
			for(k3=k2; k3<=highBound; k3++){
				for(k4=k3; k4<=highBound; k4++){
					key[0]=k1;
					key[1]=k2;
					key[2]=k3;
					key[3]=k4;

					validKey=1;
					sumCounter=0;  
					for(c1=0; c1<=3; c1++){
						for(c2=c1; c2<=3; c2++){
							for(c3=c2; c3<=3; c3++){
								for(c4=c3; c4<=3; c4++){
									for(c5=c4; c5<=3; c5++){
										for(c6=c5; c6<=3; c6++){
											for(c7=c6; c7<=3; c7++){
												sums[sumCounter]=key[c1]+key[c2]+key[c3]+key[c4]+key[c5]+key[c6]+key[c7];
												sumCounter++;
											}
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
						printf("\tkey[1,2,3,4] = %d %d %d %d\n", key[0], key[1], key[2], key[3]);
						c++;
					}
				}
			}
		}
	}
	
	time1 = time(NULL);
	clock1 = clock();
	printf("\tnumber of 4 key sets =\t%d\n", c);
	printf("\tclock time (s) to time explore %d set of 4 keys =\t%ld\n", (highBound+1)^4, (long)(time1 - time0));
	printf("\tCPU time (s) to time explore %d set of 4 keys =\t\t%f\n", (highBound+1)^4, (float)(clock1 - clock0)/CLOCKS_PER_SEC);
	
	return 0;
}


/*output
gcc -Wall -g -O3 PokerKeysGenSuit.c -o PokerKeyGenSuit
time -p ./PokerKeyGenSuit
---------------------
	key[1,2,3,4] = 0 1 29 37
	key[1,2,3,4] = 0 3 32 37
	key[1,2,3,4] = 0 5 34 37
	key[1,2,3,4] = 0 8 36 37
	number of 4 key sets =	4
	clock time (s) to time explore 34 set of 4 keys =	0
	CPU time (s) to time explore 34 set of 4 keys =		0.119392
real 0.12
user 0.12
sys 0.00
*/
