#include <stdio.h>
#include <time.h>

int main(){
	time_t  time0, time1;						// time_t is defined in <time.h> as long
	clock_t clock0, clock1;						// clock_t is defined in <time.h> as int
	int c1, c2, c3, c4, c5, c6, c7;				// test faces running from 0 to 12
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
								for(c6=c5; c6<=k; c6++){
									for(c7=c6; c7<=k; c7++){
										if(c1!=c5 && c2!=c6 && c3!=c7){
											sums[sumCounter]=key[c1]+key[c2]+key[c3]+key[c4]+key[c5]+key[c6]+key[c7];
											sumCounter++;
										}
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
gcc -Wall -g -O3 PokerKeysGen.c -o PokerKeyGen
time -p ./PokerKeyGen
-------------------------------------------------
	key[3] = 22
		clock time (s) for key[3] =	0
		CPU time (s) for key[3] =	0.000058
	key[4] = 98
		clock time (s) for key[4] =	0
		CPU time (s) for key[4] =	0.000320
	key[5] = 453
		clock time (s) for key[5] =	0
		CPU time (s) for key[5] =	0.005035
	key[6] = 2031
		clock time (s) for key[6] =	0
		CPU time (s) for key[6] =	0.104082
	key[7] = 8698
		clock time (s) for key[7] =	2
		CPU time (s) for key[7] =	1.855862
	key[8] = 22854
		clock time (s) for key[8] =	11
		CPU time (s) for key[8] =	11.142530
	key[9] = 83661
		clock time (s) for key[9] =	180
		CPU time (s) for key[9] =	180.047226
	key[10] = 262349
		clock time (s) for key[10] =	1684
		CPU time (s) for key[10] =	1683.008789
	key[11] = 636345
		clock time (s) for key[11] =	8708
		CPU time (s) for key[11] =	8646.570312
	key[12] = 1479181
		clock time (s) for key[12] =	42624
		CPU time (s) for key[12] =	42498.425781
real 42624.32
user 42463.24
sys 35.18
*/


