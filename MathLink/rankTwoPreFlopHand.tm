// Template code

:Evaluate:		BeginPackage["MyPackageO6E`"]
:Evaluate:		RankTwoPreFlopHandML::usage = "RankTwoPreFlopHandML returns the relative pot equity of two 2 card pre flop poker hands, {win handA, win handB, ties}."
:Evaluate:		RankTwoPreFlopHandML::badargs = "preflop hand must be a list of 2 integers each in the [1, 52] range."
:Evaluate:  	Begin["`Private`"]

:Begin:
:Function:		rankTwoPreFlopHand
:Pattern:		RankTwoPreFlopHandML[handA_List, handB_List, cardKey_List, cardSuit_List, cardFlushKey_List, flushCheck_List, rankFace_List, rankFlush_List]
:Arguments:		{handA, handB, cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush}
:ArgumentTypes:	{IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList}
:ReturnType:	Manual
:End:

:Evaluate:		End[ ]
:Evaluate:		EndPackage[ ]


// Headers

static void putErrorMsgAndReturnFailure(const char *fname, const char *msgtag);

int rankSeven(int *hand, int *cardKey, int *cardSuit, int *cardFlushKey, int *flushCheck, int *rankFace, int *rankFlush);

void rankTwoPreFlopHand(int *handA, long handALen,
				int *handB, long handBLen,
				int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen);

// C code

#include <stdio.h>
#include <stdlib.h>
#include "mathlink.h"

#define suitShift 9
#define suitMask 511
#define nbRanks 7462
#define nbCards 52

void rankTwoPreFlopHand(int *handA, long handALen,
				int *handB, long handBLen,
				int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen) {
	
	//local variables
	int i, c1, c2, c3, c4, c5, rankA, rankB, nbDeckCards, winA, winB, nbTie;
	int *deckCard, *testHandA, *testHandB;
	
	
	/// Error checking
	if(handALen != 2) {
    	putErrorMsgAndReturnFailure("RankTwoPreFlopHandML","badargs");
    	return; 
    	}
    for(i=0; i<handALen; i++) {
		if(handA[i]<1 || handA[i]>52) {
    		putErrorMsgAndReturnFailure("RankTwoPreFlopHandML","badargs");
    		return; 
    	}
    }
	if(handBLen != 2) {
    	putErrorMsgAndReturnFailure("RankTwoPreFlopHandML","badargs");
    	return; 
    	}
    for(i=0; i<handBLen; i++) {
		if(handB[i]<1 || handB[i]>52) {
    		putErrorMsgAndReturnFailure("RankTwoPreFlopHandML","badargs");
    		return; 
    	}
    }

	//hand[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
    for(i=0; i<handALen; i++) {
		handA[i] = handA[i]-1;
    }
	for(i=0; i<handBLen; i++) {
		handB[i] = handB[i]-1;
    }

	//allocate memory for handRank, deckCard arrays
	nbDeckCards = nbCards-handALen-handBLen;
	deckCard = (int*) calloc(nbDeckCards, sizeof(int));
	testHandA = (int*) calloc(7, sizeof(int));
	testHandB = (int*) calloc(7, sizeof(int));
	
	//Create deckCard
	c1 = 0;
	for(i=0; i<nbCards; i++) {
		if(i != handA[0] && i != handA[1] && i != handB[0] && i != handB[1]) {
    		deckCard[c1] = i;
    		c1++;
    	}
    }
	
    
	/// Start algo
    winA = 0;
    winB = 0;
    nbTie = 0;
    for(c1=4; c1<nbDeckCards; c1++) {
		for(c2=3; c2<c1; c2++) {
			for(c3=2; c3<c2; c3++) {
				for(c4=1; c4<c3; c4++) {
					for(c5=0; c5<c4; c5++) {
						testHandA[0] = deckCard[c1];
						testHandA[1] = deckCard[c2];
						testHandA[2] = deckCard[c3];
						testHandA[3] = deckCard[c4];
						testHandA[4] = deckCard[c5];
						testHandA[5] = handA[0];
						testHandA[6] = handA[1];
    					rankA = rankSeven(testHandA , cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush);
    					testHandB[0] = deckCard[c1];
						testHandB[1] = deckCard[c2];
						testHandB[2] = deckCard[c3];
						testHandB[3] = deckCard[c4];
						testHandB[4] = deckCard[c5];
						testHandB[5] = handB[0];
						testHandB[6] = handB[1];
    					rankB = rankSeven(testHandB , cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush);
    					if(rankA > rankB) {
    						winA++;
    					}
    					else {
    						if(rankA < rankB) {
    							winB++;
    						}
    						else {
    							nbTie++;
    						}
    					}
    				}
    			}
    		}
    	}
    }
	/// End algo
	
	MLPutFunction(stdlink,"List", 3);
		MLPutInteger32(stdlink, winA);
		MLPutInteger32(stdlink, winB);
		MLPutInteger32(stdlink, nbTie);
		
	//free memory
	free(deckCard);
	free(testHandA);
	free(testHandB);

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
