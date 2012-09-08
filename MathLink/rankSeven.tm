// Template code

:Evaluate:		BeginPackage["MyPackageO6E`"]
:Evaluate:		RankSevenML::usage = "RankSevenML returns the ranking of a 7-card poker (Texax Hold Them) hand, ranging from 1 to 7462."
:Evaluate:		RankSevenML::badargs = "hand must be a list of 7 integers each in the [1, 52] range."
:Evaluate:  	Begin["`Private`"]

:Begin:
:Function:		rankSeven
:Pattern:		RankSevenML[hand_List, cardKey_List, cardSuit_List, cardFlushKey_List, flushCheck_List, rankFace_List, rankFlush_List]
:Arguments:		{hand, cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush}
:ArgumentTypes:	{IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList}
:ReturnType:	Manual
:End:

:Evaluate:		End[ ]
:Evaluate:		EndPackage[ ]


// Headers

static void putErrorMsgAndReturnFailure(const char *fname, const char *msgtag);

void rankSeven(int *hand, long handLen,
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

void rankSeven(int *hand, long handLen,
				int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen) {
	unsigned int handKey;
	int handRank, suitHandKey, faceHandKey, flushHandKey;
	short flushSuit;
	int i;
	
	/// Error checking
	if(handLen != 7) {
    	putErrorMsgAndReturnFailure("RankSevenML","badargs");
    	return; 
    	}
    for(i=0;i<handLen;i++) {
		if(hand[i]<1 || hand[i]>52) {
    		putErrorMsgAndReturnFailure("RankSevenML","badargs");
    		return; 
    	}
    }

	//Make hand[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
    for(i=0;i<handLen;i++) {
		hand[i] = hand[i]-1;
    }

	/// Start algo
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
	/// End algo
	
	MLPutInteger32(stdlink, handRank);
	
	//	debug
// 	MLPutFunction(stdlink,"List",4);
// 		MLPutInteger64(stdlink, handKey);
// 		MLPutInteger32(stdlink, suitHandKey);
// 		MLPutInteger32(stdlink, flushSuit);
// 		MLPutInteger32(stdlink, handRank);		
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
