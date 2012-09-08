(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 8.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc.                                               *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       835,         17]
NotebookDataLength[     11658,        260]
NotebookOptionsPosition[     11879,        248]
NotebookOutlinePosition[     12424,        272]
CellTagsIndexPosition[     12381,        269]
WindowTitle->Monte Carlo Generated PreFlop Hand Equity & Hand Rank
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`f1$$ = 7, $CellContext`f2$$ = 
    6, $CellContext`t$$ = "o", Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{
      Hold[
       Text[
        Style["PreFlop Hand\n", 11, Bold]]], 
      Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`f1$$], 7, "First face"}, {
      1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
       9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
       K, 13 -> $CellContext`A}}, {{
       Hold[$CellContext`f2$$], 6, "Second face"}, {
      1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
       9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
       K, 13 -> $CellContext`A}}, {{
       Hold[$CellContext`t$$], "o", "Type"}, 
      Dynamic[
       If[$CellContext`f1$$ != $CellContext`f2$$, $CellContext`suitChoice, \
$CellContext`suitNoChoice]]}}, Typeset`size$$ = Automatic, Typeset`update$$ = 
    0, Typeset`initDone$$, Typeset`skipInitDone$$ = 
    False, $CellContext`f1$42297$$ = False, $CellContext`f2$42298$$ = False}, 
    
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`f1$$ = 7, $CellContext`f2$$ = 
        6, $CellContext`t$$ = "o"}, "ControllerVariables" :> {
        Hold[$CellContext`f1$$, $CellContext`f1$42297$$, False], 
        Hold[$CellContext`f2$$, $CellContext`f2$42298$$, False]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Module[{$CellContext`pfh$, $CellContext`i$, $CellContext`eqWin$, \
$CellContext`eqAll$, $CellContext`eqWin2$, $CellContext`eqAll2$, \
$CellContext`rank$}, 
        If[
         Not[
          
          And[$CellContext`f1$$ == $CellContext`f2$$, $CellContext`t$$ == 
           "s"]], $CellContext`pfh$ = {$CellContext`f1$$, $CellContext`f2$$, \
$CellContext`t$$}; $CellContext`i$ = $CellContext`order3[$CellContext`pfh$]; \
$CellContext`eqWin$ = Table[
            
            Part[$CellContext`equityPreFlopMonteCarloLast, $CellContext`i$, \
$CellContext`j, 1], {$CellContext`j, 9}]; $CellContext`eqAll$ = 
          Table[Part[$CellContext`equityPreFlopMonteCarloLast, \
$CellContext`i$, $CellContext`j, 1] + 
            Part[$CellContext`equityPreFlopMonteCarloLast, $CellContext`i$, \
$CellContext`j, 2], {$CellContext`j, 9}]; $CellContext`eqWin2$ = 
          Table[(1 + $CellContext`j) 
            Part[$CellContext`equityPreFlopMonteCarloLast, $CellContext`i$, \
$CellContext`j, 1], {$CellContext`j, 9}]; $CellContext`eqAll2$ = 
          Table[(1 + $CellContext`j) (
             Part[$CellContext`equityPreFlopMonteCarloLast, $CellContext`i$, \
$CellContext`j, 1] + 
             Part[$CellContext`equityPreFlopMonteCarloLast, $CellContext`i$, \
$CellContext`j, 2]), {$CellContext`j, 9}]; $CellContext`rank$ = Table[
            $CellContext`rankHand[$CellContext`i$, $CellContext`j], \
{$CellContext`j, 9}]; Column[{"\n", 
            Text[
             Style[
             "Equity of a PreFlopHand for 1-9 Opponents", Larger, Bold]], 
            "\n", 
            ListPlot[{
              Table[
               Tooltip[
                Part[$CellContext`eqWin$, $CellContext`k], 
                $CellContext`toolTipFunction[$CellContext`k, \
$CellContext`eqWin$]], {$CellContext`k, 
                Length[$CellContext`eqWin$]}], 
              Table[
               Tooltip[
                Part[$CellContext`eqAll$, $CellContext`k], 
                $CellContext`toolTipFunction[$CellContext`k, \
$CellContext`eqAll$]], {$CellContext`k, 
                Length[$CellContext`eqAll$]}], 
              Table[
               Tooltip[
                Part[$CellContext`eqWin2$, $CellContext`k], 
                $CellContext`toolTipFunction[$CellContext`k, \
$CellContext`eqWin2$]], {$CellContext`k, 
                Length[$CellContext`eqWin2$]}], 
              Table[
               Tooltip[
                Part[$CellContext`eqAll2$, $CellContext`k], 
                $CellContext`toolTipFunction[$CellContext`k, \
$CellContext`eqAll2$]], {$CellContext`k, 
                Length[$CellContext`eqAll2$]}]}, Joined -> True, Mesh -> All, 
             PlotRange -> All, 
             AxesLabel -> {"Nb of Opponents", "Hand Equity"}, Ticks -> {
               Range[9], Automatic}, ImageSize -> 500], "\n", 
            Text[
             Style[
             "Ranking of a PreFlopHand for 1-9 Opponents", Larger, Bold]], 
            Grid[
             Map[Text, {
               Range[9], $CellContext`rank$}, {2}], Frame -> All, Spacings -> 
             2.5], 
            
            ListPlot[$CellContext`rank$, Joined -> True, Mesh -> All, 
             PlotRange -> {Automatic, {-5, 175}}, 
             AxesLabel -> {"Nb of Opponents", "Hand Rank"}, 
             AxesOrigin -> {0, 0}, Ticks -> {
               Range[9], Automatic}, ImageSize -> 500]}, Center]]], 
      "Specifications" :> {
        Text[
         Style[
         "PreFlop Hand\n", 11, Bold]], {{$CellContext`f1$$, 7, 
          "First face"}, {
         1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
          9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
          K, 13 -> $CellContext`A}}, {{$CellContext`f2$$, 6, "Second face"}, {
         1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
          9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
          K, 13 -> $CellContext`A}}, {{$CellContext`t$$, "o", "Type"}, 
         Dynamic[
          
          If[$CellContext`f1$$ != $CellContext`f2$$, $CellContext`suitChoice, \
$CellContext`suitNoChoice]]}}, 
      "Options" :> {
       ControlPlacement -> Top, ControlType -> SetterBar, 
        ContentSize -> {600, 750}, SynchronousInitialization -> False}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{614., {442., 448.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>(($CellContext`allPreFlopHandList = {
        "AAo", "AKs", "AQs", "AJs", "ATs", "A9s", "A8s", "A7s", "A6s", "A5s", 
         "A4s", "A3s", "A2s", "KAo", "KKo", "KQs", "KJs", "KTs", "K9s", "K8s",
          "K7s", "K6s", "K5s", "K4s", "K3s", "K2s", "QAo", "QKo", "QQo", 
         "QJs", "QTs", "Q9s", "Q8s", "Q7s", "Q6s", "Q5s", "Q4s", "Q3s", "Q2s",
          "JAo", "JKo", "JQo", "JJo", "JTs", "J9s", "J8s", "J7s", "J6s", 
         "J5s", "J4s", "J3s", "J2s", "TAo", "TKo", "TQo", "TJo", "TTo", "T9s",
          "T8s", "T7s", "T6s", "T5s", "T4s", "T3s", "T2s", "9Ao", "9Ko", 
         "9Qo", "9Jo", "9To", "99o", "98s", "97s", "96s", "95s", "94s", "93s",
          "92s", "8Ao", "8Ko", "8Qo", "8Jo", "8To", "89o", "88o", "87s", 
         "86s", "85s", "84s", "83s", "82s", "7Ao", "7Ko", "7Qo", "7Jo", "7To",
          "79o", "78o", "77o", "76s", "75s", "74s", "73s", "72s", "6Ao", 
         "6Ko", "6Qo", "6Jo", "6To", "69o", "68o", "67o", "66o", "65s", "64s",
          "63s", "62s", "5Ao", "5Ko", "5Qo", "5Jo", "5To", "59o", "58o", 
         "57o", "56o", "55o", "54s", "53s", "52s", "4Ao", "4Ko", "4Qo", "4Jo",
          "4To", "49o", "48o", "47o", "46o", "45o", "44o", "43s", "42s", 
         "3Ao", "3Ko", "3Qo", "3Jo", "3To", "39o", "38o", "37o", "36o", "35o",
          "34o", "33o", "32s", "2Ao", "2Ko", "2Qo", "2Jo", "2To", "29o", 
         "28o", "27o", "26o", "25o", "24o", "23o", 
         "22o"}; $CellContext`faceChoice = {
        1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
         9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
         K, 13 -> $CellContext`A}; $CellContext`suitChoice = {
        "s" -> "suited", "o" -> "off-suited"}; $CellContext`suitNoChoice = {
        "o" -> "off-suited"}; $CellContext`equityPreFlopMonteCarloLast = 
       Part[
         ToExpression[
          Import[
          "https://raw.github.com/oscar6echo/Poker/master/Tables/\
equityPreFlopMonteCarloTableLast.csv"]], 2]; $CellContext`toolTipFunction[
         Pattern[$CellContext`k, 
          Blank[]], 
         Pattern[$CellContext`vector, 
          Blank[]]] := Column[{
          Text[
           NumberForm[
           100 Part[$CellContext`vector, $CellContext`k] "%", {5, 2}]], 
          Text[$CellContext`k]}]; $CellContext`order3[
         Pattern[$CellContext`pfh, 
          Blank[]]] := 
       Module[{$CellContext`spfh, $CellContext`fpfh}, $CellContext`spfh = 
          If[Part[$CellContext`pfh, 3] == "o", 
            If[Part[$CellContext`pfh, 1] > Part[$CellContext`pfh, 2], {
              Part[$CellContext`pfh, 2], 
              Part[$CellContext`pfh, 1], 
              Part[$CellContext`pfh, 3]}, $CellContext`pfh], 
            If[Part[$CellContext`pfh, 2] > Part[$CellContext`pfh, 1], {
              Part[$CellContext`pfh, 2], 
              Part[$CellContext`pfh, 1], 
              
              Part[$CellContext`pfh, 
               3]}, $CellContext`pfh]]; $CellContext`fpfh = ToString[
            Row[
             ReplaceAll[$CellContext`spfh, $CellContext`faceChoice]]]; First[
           Flatten[
            
            Position[$CellContext`allPreFlopHandList, $CellContext`fpfh]]]]; \
$CellContext`rankHand[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`j, 
          Blank[]]] := 
       Module[{$CellContext`array, $CellContext`rank}, $CellContext`array = 
          Table[{$CellContext`k, 
             Part[$CellContext`equityPreFlopMonteCarloLast, $CellContext`k, \
$CellContext`j, 1] + 
             Part[$CellContext`equityPreFlopMonteCarloLast, $CellContext`k, \
$CellContext`j, 2]}, {$CellContext`k, 
             
             Length[$CellContext`equityPreFlopMonteCarloLast]}]; \
$CellContext`rank = First[
            Flatten[
             Position[
              Reverse[
               Part[
                SortBy[$CellContext`array, Last], All, 
                1]], $CellContext`i]]]]; Null); Typeset`initDone$$ = True),
    SynchronousInitialization->False,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]]]
},
Editable->False,
Saveable->False,
WindowSize->{All, All},
WindowMargins->Automatic,
WindowElements->{},
WindowFrameElements->{"CloseBox"},
WindowTitle->"Monte Carlo Generated PreFlop Hand Equity & Hand Rank",
ShowCellBracket->False,
CellMargins->0,
Deployed->True,
FrontEndVersion->"8.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (October 5, \
2011)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1302, 31, 10573, 215, 892, InheritFromParent]
}
]
*)

(* End of internal cache information *)
(* NotebookSignature rwDMHtc6M5d3VC1TSPJLEQvS *)
