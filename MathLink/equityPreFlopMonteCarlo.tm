// Template code

:Evaluate:		BeginPackage["MyPackageO6E`"]
:Evaluate:		EquityPreFlopMonteCarloML::usage = "EquityPreFlopMonteCarloML returns the relative pot % equity of one 2-card pre flop poker hands, ie {%Equity from Wins, %Equity from Ties}, for a series of random (no check is performed) games (table cards and opponents)."
:Evaluate:		EquityPreFlopMonteCarloML::badargs = "Inputs are are inconsistent."
:Evaluate:		EquityPreFlopMonteCarloML::memoryproblem = "Random sequence is too large. Memory allocation unsuccessful."
:Evaluate:  	Begin["`Private`"]

:Begin:
:Function:		equityPreFlopMonteCarlo
:Pattern:		EquityPreFlopMonteCarloML[cardKey_List, cardSuit_List, cardFlushKey_List, flushCheck_List, rankFace_List, rankFlush_List, preFlopCard_List, randomCard_List]
:Arguments:		{cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush, preFlopCard, randomCard}
:ArgumentTypes:	{IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList}
:ReturnType:	Manual
:End:

:Evaluate:		End[ ]
:Evaluate:		EndPackage[ ]


// headers

static void putErrorMsgAndReturnFailure(const char *fname, const char *msgtag);

int rankSeven(int *hand, int *cardKey, int *cardSuit, int *cardFlushKey, int *flushCheck, int *rankFace, int *rankFlush);

void equityPreFlopMonteCarlo(int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen,
				int *preFlopCard, long preFlopCardLen,
				int *randomCard, long randomCardLen);

// C code

#include <stdio.h>
#include <stdlib.h>
#include "mathlink.h"

#define suitShift 9
#define suitMask 511
#define nbRanks 7462
#define nbCard 52
#define nbPlayer 9	//means nb of opponents
#define nbTableCard 5


void equityPreFlopMonteCarlo(int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen,
				int *preFlopCard, long preFlopCardLen,
				int *randomCard, long randomCardLen) {
	
	// local variables
	int i, n, r, np, nbBestHand, nbGame;
	int *tableStatus, *player1Status, *player2Status, *rank, *testHand;
	float *equityWin, *equityTie;
	
	// error checking
// 	MLPutInteger32(stdlink,randomCardLen);
	if(preFlopCardLen != 2) {
    	putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloML","badargs");
    	return; 
    }
	if(randomCardLen % (nbTableCard+2*nbPlayer) != 0) {
    	putErrorMsgAndReturnFailure("EquityPreFlopMonteCarloML","badargs");
    	return; 
    }

	// allocate memory 
	//nbDeckCard = nbCard-nbTableCard-2*nbPlayer;
	player1Status = (int*) calloc(1+nbPlayer, sizeof(int));
	player2Status = (int*) calloc(1+nbPlayer, sizeof(int));
	tableStatus = (int*) calloc(nbTableCard, sizeof(int));
	equityWin = (float*) calloc(nbPlayer, sizeof(float));
	equityTie = (float*) calloc(nbPlayer, sizeof(float));
	rank = (int*) calloc(1+nbPlayer, sizeof(int));
	testHand = (int*) calloc(7, sizeof(int));

	// start algo
	nbGame=(int)(randomCardLen/(nbTableCard+2*nbPlayer));
	r=0;
// 	MLPutFunction(stdlink,"List",nbGame);
	for(n=0; n<nbGame; n++){
		// distribute cards
		// table[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
		for(i=0; i<nbTableCard; i++){
			tableStatus[i] = randomCard[r]-1;
			r++;
		}
		// playerStatus1&2[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
		player1Status[0] = preFlopCard[0]-1;
		player2Status[0] = preFlopCard[1]-1;
		for(i=1; i<1+nbPlayer; i++){
			player1Status[i] = randomCard[r]-1;
			r++;
			player2Status[i] = randomCard[r]-1;
			r++;
		}
		//init ranking
		nbBestHand=0;
		//compute ranking
		for(i=0; i<1+nbPlayer; i++){
			testHand[0] = player1Status[i];
			testHand[1] = player2Status[i];
			testHand[2] = tableStatus[0];
			testHand[3] = tableStatus[1];
			testHand[4] = tableStatus[2];
			testHand[5] = tableStatus[3];
			testHand[6] = tableStatus[4];
			rank[i] = rankSeven(testHand,cardKey,cardSuit,cardFlushKey,flushCheck,rankFace,rankFlush);
		}

		np=2;
		do{
			i=1;
			nbBestHand=1;
			do{
				if(rank[0]<rank[i]){nbBestHand=0;}
				if(rank[0]==rank[i]){nbBestHand++;}
				i++;
			}while(i<np && nbBestHand>0);
			if(i==np && nbBestHand>0){
				if(nbBestHand==1){equityWin[np-2]+=1.0;}
				else{equityTie[np-2]+=1.0/nbBestHand;}
			}
			np++;
		}while(np<=1+nbPlayer && i==np-1 && nbBestHand>0);
	}		

	// normalize equityWin & equityTie
	for(i=0; i<nbPlayer; i++){
		equityWin[i]/=nbGame;
		equityTie[i]/=nbGame;
	}
	
	// end algo
	
// 	MLPutFunction(stdlink,"List",2);
	MLPutFunction(stdlink,"List",nbPlayer);
	for(i=0;i<nbPlayer;i++){
		MLPutFunction(stdlink,"List",2);
	 		MLPutReal32(stdlink,equityWin[i]);
 			MLPutReal32(stdlink,equityTie[i]);
	}
// 	MLPutInteger32(stdlink,r);	
		
	// free memory
	free(player1Status);
	free(player2Status);
	free(tableStatus);
	free(equityWin);
	free(equityTie);
	free(rank);
	free(testHand);
}

int rankSeven(int *hand, int *cardKey, int *cardSuit, int *cardFlushKey, int *flushCheck, int *rankFace, int *rankFlush) {

	unsigned int handKey;
	int handRank, suitHandKey, faceHandKey, flushHandKey;
	short flushSuit;
	int i;

	handKey = cardKey[hand[0]]+cardKey[hand[1]]+cardKey[hand[2]]+cardKey[hand[3]]+cardKey[hand[4]]+cardKey[hand[5]]+cardKey[hand[6]];
	suitHandKey = handKey & suitMask;
	flushSuit = flushCheck[suitHandKey];
	if(flushSuit == -1) {
		faceHandKey = handKey >> suitShift;
		handRank = rankFace[faceHandKey];
	}
	else {
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

static void putErrorMsgAndReturnFailure(const char *fname, const char *msgtag) {
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
