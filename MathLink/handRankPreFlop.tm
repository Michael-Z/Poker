// Template code

:Evaluate:		BeginPackage["MyPackageO6E`"]
:Evaluate:		HandRankPreFlopML::usage = "HandRankPreFlopML returns the vector of the nb of occurences of a hand valued i (1 to 7462), with i being the ranking of a hand, among the 7462 possible rankings (nb of distinctly valued seven card Texas Hold Them poker hands)."
:Evaluate:		HandRankPreFlopML::badargs = "preflop hand must be a list of 2 integers each in the [1, 52] range."
:Evaluate:  	Begin["`Private`"]

:Begin:
:Function:		handRankPreFlop
:Pattern:		HandRankPreFlopML[hand_List, cardKey_List, cardSuit_List, cardFlushKey_List, flushCheck_List, rankFace_List, rankFlush_List]
:Arguments:		{hand, cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush}
:ArgumentTypes:	{IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList}
:ReturnType:	Manual
:End:

:Evaluate:		End[ ]
:Evaluate:		EndPackage[ ]


// Headers

static void putErrorMsgAndReturnFailure(const char *fname, const char *msgtag);

int rankSeven(int *hand, int *cardKey, int *cardSuit, int *cardFlushKey, int *flushCheck, int *rankFace, int *rankFlush);

void handRankPreFlop(int *hand, long handLen,
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
#define nbDeckCards 50

void handRankPreFlop(int *hand, long handLen,
				int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen) {
	
	//local variables
	int i, c1, c2, c3, c4, c5, r;
	int handRank[nbRanks], deckCard[nbDeckCards], testHand[7];
	
	//set handRank to zero
	for(i=0; i<nbRanks; i++) {
		handRank[i] = 0;
    }
	
	/// Error checking
	if(handLen != 2) {
    	putErrorMsgAndReturnFailure("HandRankPreFlopML","badargs");
    	return; 
    	}
    for(i=0; i<handLen; i++) {
		if(hand[i]<1 || hand[i]>52) {
    		putErrorMsgAndReturnFailure("HandRankPreFlopML","badargs");
    		return; 
    	}
    }

	//hand[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
    for(i=0; i<handLen; i++) {
		hand[i] = hand[i]-1;
    }
	
	//Create deckCard
	c1 = 0;
	for(i=0; i<nbCards; i++) {
		if(i != hand[0] && i != hand[1]) {
    		deckCard[c1] = i;
    		c1++;
    	}
    }
	
	/// Start algo
    for(c1=4; c1<nbDeckCards; c1++) {
		for(c2=3; c2<c1; c2++) {
			for(c3=2; c3<c2; c3++) {
				for(c4=1; c4<c3; c4++) {
					for(c5=0; c5<c4; c5++) {
						testHand[0] = deckCard[c1];
						testHand[1] = deckCard[c2];
						testHand[2] = deckCard[c3];
						testHand[3] = deckCard[c4];
						testHand[4] = deckCard[c5];
						testHand[5] = hand[0];
						testHand[6] = hand[1];
    					r = rankSeven(testHand, cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush);
    					//handRank[r-1] cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
    					handRank[r-1] = handRank[r-1]+1;
    				}
    			}
    		}
    	}
    }
	/// End algo
	
	MLPutFunction(stdlink,"List", nbRanks);
	for(i=0; i<nbRanks; i++) {
			MLPutInteger32(stdlink, handRank[i]);
    }
    
	/*free(handRank);
	free(deckCard);
	free(testHand);*/
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

int main(int argc, char* argv[]) {
	return MLMain(argc, argv);
}
