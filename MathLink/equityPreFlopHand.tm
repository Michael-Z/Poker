// Template code

:Evaluate:		BeginPackage["MyPackageO6E`"]
:Evaluate:		EquityPreFlopHandML::usage = "EquityPreFlopHandML returns the relative pot % equity of N 2-card pre flop poker hands, ie N such vectors: {%Equity from Wins, %Equity from Ties}."
:Evaluate:		EquityPreFlopHandML::badargs = "deckStatus/tableStatus/player1Status/player2Status are inconsistent."
:Evaluate:  	Begin["`Private`"]

:Begin:
:Function:		equityPreFlopHand
:Pattern:		EquityPreFlopHandML[cardKey_List, cardSuit_List, cardFlushKey_List, flushCheck_List, rankFace_List, rankFlush_List, deckStatus_List, tableStatus_List, player1Status_List, player2Status_List, nbPlayer_Integer]
:Arguments:		{cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush, deckStatus, tableStatus, player1Status, player2Status, nbPlayer}
:ArgumentTypes:	{IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,IntegerList,Integer}
:ReturnType:	Manual
:End:

:Evaluate:		End[ ]
:Evaluate:		EndPackage[ ]


// headers

static void putErrorMsgAndReturnFailure(const char *fname, const char *msgtag);

int rankSeven(int *hand, int *cardKey, int *cardSuit, int *cardFlushKey, int *flushCheck, int *rankFace, int *rankFlush);

void equityPreFlopHand(int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen,
				int *deckStatus, long deckStatusLen,
				int *tableStatus, long tableStatusLen,
				int *player1Status, long player1StatusLen,
				int *player2Status, long player2StatusLen,
				int nbPlayer);

// C code

#include <stdio.h>
#include <stdlib.h>
#include "mathlink.h"

#define suitShift 9
#define suitMask 511
#define nbRanks 7462
#define nbCard 52

void equityPreFlopHand(int *cardKey, long cardKeyLen,
				int *cardSuit, long cardSuitLen,
				int *cardFlushKey, long cardFlushKeyLen,
				int *flushCheck, long flushCheckLen,
				int *rankFace, long rankFaceLen,
				int *rankFlush, long rankFlushLen,
				int *deckStatus, long deckStatusLen,
				int *tableStatus, long tableStatusLen,
				int *player1Status, long player1StatusLen,
				int *player2Status, long player2StatusLen,
				int nbPlayer) {
	
	// local variables
	int i, j, c1, c2, c3, c4, c5, n, nbTableCard, nbDeckCard, nbBestHand, bestRank, test;
	int *deckCard, *rank, *bestHand, *testHand;
	float *equityWin, *equityTie;
	
	// error checking 1st part
	if(deckStatusLen != nbCard) {
    	putErrorMsgAndReturnFailure("EquityPreFlopHandML","badargs");
    	return; 
    }    	
	if(tableStatusLen != 5) {
    	putErrorMsgAndReturnFailure("EquityPreFlopHandML","badargs");
    	return; 
    }
	if(player1StatusLen != 10) {
    	putErrorMsgAndReturnFailure("EquityPreFlopHandML","badargs");
    	return; 
    }
	if(player2StatusLen != 10) {
    	putErrorMsgAndReturnFailure("EquityPreFlopHandML","badargs");
    	return; 
    }

    // neutralize Select effect
    for(i=0; i<nbCard; i++) {
		if(deckStatus[i]==2){deckStatus[i]=1;}
    }

	// determine nbTableCard
	// tableStatus[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
	nbTableCard=0;
    for(i=0; i<tableStatusLen; i++){
		if(tableStatus[i]>0){nbTableCard++;}
		tableStatus[i] = tableStatus[i]-1;
    }
	// playerStatus1&2[i]-1 cos all arrays in C are in the [0, Length-1] vs [1, Length] in MMA
    for(i=0; i<player1StatusLen; i++){
		player1Status[i] = player1Status[i]-1;
		player2Status[i] = player2Status[i]-1;
    }

	// error checking 2nd part
	for(i=0; i<nbCard; i++){
		test=0;
		if(deckStatus[i]==1){test++;}
		for(j=0; j<nbTableCard; j++){if(tableStatus[j]==i){test++;}}
		for(j=0; j<nbPlayer; j++){if(player1Status[j]==i){test++;}}
		for(j=0; j<nbPlayer; j++){if(player2Status[j]==i){test++;}}
		if(test!=1){
			putErrorMsgAndReturnFailure("EquityPreFlopHandML","badargs");
			return;
		}
    }
	
	// allocate memory 
	nbDeckCard = nbCard-nbTableCard-2*nbPlayer;
	deckCard = (int*) calloc(nbDeckCard, sizeof(int));
	equityWin = (float*) calloc(nbPlayer, sizeof(float));
	equityTie = (float*) calloc(nbPlayer, sizeof(float));
	rank = (int*) calloc(nbPlayer, sizeof(int));
	bestHand = (int*) calloc(nbPlayer, sizeof(int));
	testHand = (int*) calloc(7, sizeof(int));
	
	// create deckCard
	c1 = 0;
	nbBestHand=0;
	for(i=0; i<nbCard; i++){
		if(deckStatus[i]==1){deckCard[c1] = i;c1++;}
	}	

    n=0;
	// start algo
	// 0 table cards
	if(nbTableCard==0){				
		for(c1=4; c1<nbDeckCard; c1++){
			for(c2=3; c2<c1; c2++){
				for(c3=2; c3<c2; c3++){
					for(c4=1; c4<c3; c4++){
						for(c5=0; c5<c4; c5++){
							n++;
							//init ranking
							for(j=0; j<nbPlayer; j++){
								bestHand[j]=0;
							}
							nbBestHand=0;
							bestRank=0;
							//compute ranking
							for(i=0; i<nbPlayer; i++){
								testHand[0] = player1Status[i];
								testHand[1] = player2Status[i];
								testHand[2] = deckCard[c1];
								testHand[3] = deckCard[c2];
								testHand[4] = deckCard[c3];
								testHand[5] = deckCard[c4];
								testHand[6] = deckCard[c5];
								rank[i] = rankSeven(testHand , cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush);		
								if(rank[i] > bestRank){
									bestRank=rank[i];
									for(j=0;j<nbPlayer;j++){
										bestHand[j]=0;
									}
									nbBestHand=1;
									bestHand[i]=1;
								}
								else{
									if(rank[i] == bestRank){
										nbBestHand++;
										bestHand[i]=1;
									}
								}
							}
							//compute equityWin and equityTie
							if(nbBestHand!=1){
								for(j=0; j<nbPlayer; j++){
									if(bestHand[j]==1){equityTie[j]=equityTie[j]+1.0/nbBestHand;}
								}
							}
							else{
								j=0;
								while(bestHand[j]==0){j++;}
								equityWin[j]=equityWin[j]+1;
							}
						}
					}
				}
			}
		}
		for(j=0; j<nbPlayer; j++){
			equityWin[j]=equityWin[j]/n;
			equityTie[j]=equityTie[j]/n;
		}
	}
	
	// 3 table cards
	if(nbTableCard==3){
		for(c4=1; c4<nbDeckCard; c4++){
			for(c5=0; c5<c4; c5++){
				n++;
				//init ranking
				for(j=0; j<nbPlayer; j++){
					bestHand[j]=0;
				}
				nbBestHand=0;
				bestRank=0;
				//compute ranking
				for(i=0; i<nbPlayer; i++){
					testHand[0] = player1Status[i];
					testHand[1] = player2Status[i];
					testHand[2] = tableStatus[0];
					testHand[3] = tableStatus[1];
					testHand[4] = tableStatus[2];
					testHand[5] = deckCard[c4];
					testHand[6] = deckCard[c5];
					rank[i] = rankSeven(testHand , cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush);		
					if(rank[i] > bestRank){
						bestRank=rank[i];
						for(j=0;j<nbPlayer;j++){
							bestHand[j]=0;
						}
						nbBestHand=1;
						bestHand[i]=1;
					}
					else{
						if(rank[i] == bestRank){
							nbBestHand++;
							bestHand[i]=1;
						}
					}
				}
				//compute equityWin and equityTie
				if(nbBestHand!=1){
					for(j=0; j<nbPlayer; j++){
						if(bestHand[j]==1){equityTie[j]=equityTie[j]+1.0/nbBestHand;}
					}
				}
				else{
					j=0;
					while(bestHand[j]==0){j++;}
					equityWin[j]=equityWin[j]+1;
				}
			}
		}
		for(j=0; j<nbPlayer; j++){
			equityWin[j]=equityWin[j]/n;
			equityTie[j]=equityTie[j]/n;
		}
	}
	
	// 4 table cards
	if(nbTableCard==4){
		for(c5=0; c5<nbDeckCard; c5++){
			n++;
			//init ranking
			for(j=0; j<nbPlayer; j++){
				bestHand[j]=0;
			}
			nbBestHand=0;
			bestRank=0;
			//compute ranking
			for(i=0; i<nbPlayer; i++){
				testHand[0] = player1Status[i];
				testHand[1] = player2Status[i];
				testHand[2] = tableStatus[0];
				testHand[3] = tableStatus[1];
				testHand[4] = tableStatus[2];
				testHand[5] = tableStatus[3];
				testHand[6] = deckCard[c5];
				rank[i] = rankSeven(testHand , cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush);
				if(rank[i] > bestRank){
					bestRank=rank[i];
					for(j=0;j<nbPlayer;j++){
						bestHand[j]=0;
					}
					nbBestHand=1;
					bestHand[i]=1;
				}
				else{
					if(rank[i] == bestRank){
						nbBestHand++;
						bestHand[i]=1;
					}
				}
			}
			//compute equityWin and equityTie
			if(nbBestHand!=1){
				for(j=0; j<nbPlayer; j++){
					if(bestHand[j]==1){equityTie[j]=equityTie[j]+1.0/nbBestHand;}
				}
			}
			else{
				j=0;
				while(bestHand[j]==0){j++;}
				equityWin[j]=equityWin[j]+1;
			}
		}
		for(j=0; j<nbPlayer; j++){
			equityWin[j]=equityWin[j]/n;
			equityTie[j]=equityTie[j]/n;
		}
	}
	
	// 5 table cards	
	if(nbTableCard==5){
		n++;
		//init ranking
		for(j=0; j<nbPlayer; j++){
			bestHand[j]=0;
		}
		nbBestHand=0;
		bestRank=0;
		//compute ranking
		for(i=0; i<nbPlayer; i++){
			testHand[0] = player1Status[i];
			testHand[1] = player2Status[i];
			testHand[2] = tableStatus[0];
			testHand[3] = tableStatus[1];
			testHand[4] = tableStatus[2];
			testHand[5] = tableStatus[3];
			testHand[6] = tableStatus[4];
			rank[i] = rankSeven(testHand , cardKey, cardSuit, cardFlushKey, flushCheck, rankFace, rankFlush);
			if(rank[i] > bestRank){
				bestRank=rank[i];
				for(j=0;j<nbPlayer;j++){
					bestHand[j]=0;
				}
				nbBestHand=1;
				bestHand[i]=1;
			}
			else{
				if(rank[i] == bestRank){
					nbBestHand++;
					bestHand[i]=1;
				}
			}
		}
		//compute equityWin and equityTie
		if(nbBestHand!=1){
			for(j=0; j<nbPlayer; j++){
				if(bestHand[j]==1){equityTie[j]=equityTie[j]+1.0/nbBestHand;}
			}
		}
		else{
			j=0;
			while(bestHand[j]==0){j++;}
			equityWin[j]=equityWin[j]+1;
		}
		for(j=0; j<nbPlayer; j++){
			equityWin[j]=equityWin[j]/n;
			equityTie[j]=equityTie[j]/n;
		}
	}
	
	// end algo

	MLPutFunction(stdlink,"List",3);
	MLPutFunction(stdlink,"List",nbPlayer);
	for(j=0;j<nbPlayer;j++){
		MLPutFunction(stdlink,"List",2);
	 		MLPutReal32(stdlink,equityWin[j]);
 			MLPutReal32(stdlink,equityTie[j]);
	}
	MLPutInteger32(stdlink,n);
	MLPutFunction(stdlink,"List",nbPlayer);
	for(j=0;j<nbPlayer;j++){
		if(nbTableCard==5){MLPutInteger32(stdlink,rank[j]);}
		else{MLPutInteger32(stdlink,0);}
	}
	
		
	// free memory
	free(deckCard);
	free(equityWin);
	free(equityTie);
	free(rank);
	free(bestHand);
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
