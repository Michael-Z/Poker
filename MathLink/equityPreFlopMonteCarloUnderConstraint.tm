// Template code

:Evaluate:		BeginPackage["MyPackageO6E`"]
:Evaluate:		EquityPreFlopMonteCarloUnderConstraintML::usage = "EquityPreFlopMonteCarloUnderConstraintML returns the relative pot % equity of one 2-card pre flop poker hands, ie {%Equity from Wins, %Equity from Ties}, for a series of random (no check is performed) games (table cards and opponents)."
:Evaluate:		EquityPreFlopMonteCarloUnderConstraintML::badargs = "Inputs are are inconsistent."
:Evaluate:  	Begin["`Private`"]

:Begin:
:Function:		equityPreFlopMonteCarloUnderConstraint
:Pattern:		EquityPreFlopMonteCarloUnderConstraintML[cardKey_List, cardSuit_List, cardFlushKey_List, flushCheck_List, rankFace_List, rankFlush_List, deckStatus_List, tableStatus_List, mainPlayerStatus_List, nbOpp_Integer, playerHand_List, nbPlayerHand_List]
:Arguments:		{cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush, deckStatus, tableStatus, mainPlayerStatus, nbOpp, playerHand, nbPlayerHand}
:ArgumentTypes:	{IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,Integer,IntegerList,IntegerList}
:ReturnType:	Manual
:End:

:Evaluate:		End[ ]
:Evaluate:		EndPackage[ ]


// headers

void equityPreFlopMonteCarloUnderConstraint(int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen,
				int *deckStatus, long deckStatusLen,
				int *tableStatus, long tableStatusLen,
				int *mainPlayerStatus, long mainPlayerStatusLen,
				int nbOpp,
				int *playerHand, long playerHandLen,
				int *nbPlayerHand, long nbPlayerHandLen);

unsigned long WellRNG512(void);

int randomChoice(int n);

int rankSeven(int *hand, int *cardKey, int *cardSuit, int *cardFlushKey, int *flushCheck, int *rankFace, int *rankFlush);

static void putErrorMsgAndReturnFailure(const char *fname, const char *msgtag);


// C code

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "mathlink.h"

#define suitShift 9
#define suitMask 511
#define nbRanks 7462
#define nbCard 52
#define nbGame 1000000

// static variables used by the RNG
static unsigned long state[16];
static int index=0;

void equityPreFlopMonteCarloUnderConstraint(int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen,
				int *deckStatus, long deckStatusLen,
				int *tableStatus, long tableStatusLen,
				int *mainPlayerStatus, long mainPlayerStatusLen,
				int nbOpp,
				int *playerHand, long playerHandLen,
				int *nbPlayerHand, long nbPlayerHandLen){
	
	// local variables
	int i, j, r, n, nbTableCard, nbDeckCard, overlap, nbBestHand;
	int *rank, *testHand, *deckCard, *nbPlayerHandLocal, *player1Status, *player2Status;
	float equityWin, equityTie;
	int test=0;
	
	// error checking
	if(deckStatusLen != nbCard){
    	putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloUnderConstraintML","badargs");
    	return; 
    }
	if(tableStatusLen != 5){
    	putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloUnderConstraintML","badargs");
    	return; 
    }
	if(mainPlayerStatusLen != 2){
    	putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloUnderConstraintML","badargs");
    	return;
    }
	if(nbOpp < 1 || nbOpp > 9){
    	putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloUnderConstraintML","badargs");
    	return;
    }
    if(nbPlayerHandLen != nbOpp){
    	putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloUnderConstraintML","badargs");
    	return;
    }
	if(nbPlayerHand[0] % 2 != 0){
		putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloUnderConstraintML","badargs");
		return; 
	}
    for(i=1; i<nbPlayerHandLen; i++){
		if((nbPlayerHand[i]-nbPlayerHand[i-1]) % 2){
			putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloUnderConstraintML","badargs");
			return; 
		}
	}
	if(playerHandLen % 2 != 0){
		putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloUnderConstraintML","badargs");
		return; 
	}

	// init tableCard & determine nbTableCard
	// tableStatus[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
	nbTableCard=0;
    for(i=0; i<tableStatusLen; i++){
		if(tableStatus[i]>0){nbTableCard++;}
		tableStatus[i] = tableStatus[i]-1;
    }


	// allocate memory 
	nbDeckCard = nbCard-nbTableCard-2*1;
	deckCard = (int*) calloc(nbDeckCard, sizeof(int));
	player1Status = (int*) calloc(1+nbOpp, sizeof(int));
	player2Status = (int*) calloc(1+nbOpp, sizeof(int));
	nbPlayerHandLocal = (int*) calloc(1+nbOpp, sizeof(int));
	rank = (int*) calloc(1+nbOpp, sizeof(int));
	testHand = (int*) calloc(7, sizeof(int));

	// init nbPlayerHandLocal
	nbPlayerHandLocal[0]=0;
	for(i=1; i<nbPlayerHandLen+1; i++){
		nbPlayerHandLocal[i]=nbPlayerHand[i-1];
	}

	// init main player
	// playerStatus[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
	player1Status[0] = mainPlayerStatus[0]-1;
	player2Status[0] = mainPlayerStatus[1]-1;

	// neutralize Select effect
    for(i=0; i<nbCard; i++) {
		if(deckStatus[i]==2){deckStatus[i]=1;}
    }
	// init deckCard
	j = 0;
	for(i=0; i<nbCard; i++){
		if(deckStatus[i]==1){deckCard[j] = i; j++;}
	}

	// init equity
	equityWin=0.0;
	equityTie=0.0;

	// init random
	srand(time(NULL));
	for(i=0; i<16; i++){
		state[i]=rand();
	}

	// start algo
	for(n=0; n<nbGame; n++){
	
		// generate random cards
		for(i=0; i<nbOpp; i++){
			do{
				r=randomChoice((nbPlayerHandLocal[i+1]-nbPlayerHandLocal[i]) >> 1);
				if(nbPlayerHandLocal[i]+2*r+1 > playerHandLen-1){test=1;}
				player1Status[1+i]=playerHand[nbPlayerHandLocal[i]+2*r]-1;
				player2Status[1+i]=playerHand[nbPlayerHandLocal[i]+2*r+1]-1;
				overlap=0;
				for(j=0; j<1+i; j++){
					if(player1Status[j]==player1Status[1+i]){overlap=1;}
					if(player1Status[j]==player2Status[1+i]){overlap=1;}
					if(player2Status[j]==player1Status[1+i]){overlap=1;}
					if(player2Status[j]==player1Status[1+i]){overlap=1;}
				}
			}while(overlap==1);
		}
		for(i=nbTableCard; i<5; i++){
			do{
				tableStatus[i]=deckCard[randomChoice(nbDeckCard)];
				overlap=0;
				for(j=0; j<1+nbOpp; j++){
					if(player1Status[j]==tableStatus[i]){overlap=1;}
					if(player2Status[j]==tableStatus[i]){overlap=1;}
				}
				for(j=nbTableCard; j<i; j++){
					if(tableStatus[j]==tableStatus[i]){overlap=1;}
				}
			}while(overlap==1);
		}
		// end random
		
		//init ranking
		nbBestHand=0;
		//compute ranking
		for(i=0; i<1+nbOpp; i++){
			testHand[0] = player1Status[i];
			testHand[1] = player2Status[i];
			testHand[2] = tableStatus[0];
			testHand[3] = tableStatus[1];
			testHand[4] = tableStatus[2];
			testHand[5] = tableStatus[3];
			testHand[6] = tableStatus[4];
			rank[i] = rankSeven(testHand,cardKey,cardSuit,cardFlushKey,flushCheck,rankFace,rankFlush);
		}
		i=1;
		nbBestHand=1;
		do{
			if(rank[0]<rank[i]){nbBestHand=0;}
			if(rank[0]==rank[i]){nbBestHand++;}
			i++;
		}while(i<nbOpp && nbBestHand>0);
		if(i==nbOpp && nbBestHand>0){
			if(nbBestHand==1){equityWin+=1.0;}
			else{equityTie+=1.0/nbBestHand;}
		}
	}

	// normalize equityWin & equityTie
	equityWin/=nbGame;
	equityTie/=nbGame;

	// end algo
	
	MLPutFunction(stdlink,"List",2);
		MLPutReal32(stdlink,equityWin);
		MLPutReal32(stdlink,equityTie);

	// free memory
	free(deckCard);
	free(player1Status);
	free(player2Status);
	free(nbPlayerHandLocal);
	free(rank);
	free(testHand);
}

// return 32 bit random number
unsigned long WellRNG512(void){
	unsigned long a, b, c, d;
	a = state[index];
	c = state[(index+13)&15];
	b = a^c^(a<<16)^(c<<15);
	c = state[(index+9)&15];
	c ^= (c>>11);
	a = state[index] = b^c;
	d = a^((a<<5)&0xDA442D20UL);
	index = (index + 15)&15;
	a = state[index];
	state[index] = a^b^d^(a<<2)^(b<<18)^(c<<28);
	return state[index];
}

// return an int between 0 (incl.) and n-1 (incl.)
int randomChoice(int n){
	unsigned long r;
	int output;

	do{
		r = WellRNG512();
	}while(r < ((unsigned long)ULONG_MAX+1)%n);
	output = (int)(r%n);
	return output;
}

int rankSeven(int *hand, int *cardKey, int *cardSuit, int *cardFlushKey, int *flushCheck, int *rankFace, int *rankFlush){

	unsigned int handKey;
	int handRank, suitHandKey, faceHandKey, flushHandKey;
	short flushSuit;
	int i;

	handKey = cardKey[hand[0]]+cardKey[hand[1]]+cardKey[hand[2]]+cardKey[hand[3]]+cardKey[hand[4]]+cardKey[hand[5]]+cardKey[hand[6]];
	suitHandKey = handKey & suitMask;
	flushSuit = flushCheck[suitHandKey];
	if(flushSuit == -1){
		faceHandKey = handKey >> suitShift;
		handRank = rankFace[faceHandKey];
	}
	else{
		flushHandKey = (cardSuit[hand[0]]==flushSuit ? cardFlushKey[hand[0]] : 0) +
					(cardSuit[hand[1]]==flushSuit ? cardFlushKey[hand[1]] : 0) +
					(cardSuit[hand[2]]==flushSuit ? cardFlushKey[hand[2]] : 0) +
					(cardSuit[hand[3]]==flushSuit ? cardFlushKey[hand[3]] : 0) +
					(cardSuit[hand[4]]==flushSuit ? cardFlushKey[hand[4]] : 0) +
					(cardSuit[hand[5]]==flushSuit ? cardFlushKey[hand[5]] : 0) +
					(cardSuit[hand[6]]==flushSuit ? cardFlushKey[hand[6]] : 0);
		handRank = rankFlush[flushHandKey];
	}
	return handRank;
}

static void putErrorMsgAndReturnFailure(const char *fname, const char *msgtag){
    MLPutFunction(stdlink,"CompoundExpression",2);
        MLPutFunction(stdlink,"Message",1);
                MLPutFunction(stdlink,"MessageName",2);
                    MLPutSymbol(stdlink,fname);
                    MLPutString(stdlink,msgtag);
        MLPutSymbol(stdlink,"$Failed");
}

int main(int argc, char* argv[])
{
	return MLMain(argc, argv);
}
