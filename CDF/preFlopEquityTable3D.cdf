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
NotebookDataLength[      6027,        139]
NotebookOptionsPosition[      6232,        126]
NotebookOutlinePosition[      6794,        151]
CellTagsIndexPosition[      6751,        148]
WindowTitle->Monte Carlo Generated PreFlop Hand Equity Tables - 3D \
Representation
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {}, Typeset`size$$ =
     Automatic, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {}, "ControllerVariables" :> {}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Column[{
         Text[
          Style["PreFlop Hand Equity (Win+Tie) Table in 3D", Larger, Bold]], 
         "\n", 
         Part[
          $CellContext`equityPreFlopMonteCarloLastDisplay[$CellContext`\
equityPreFlopMonteCarloLast], 1], "\n", 
         Text[
          Style[
          "PreFlop Hand Equity (Win+Tie) Times Individual Bet Table in 3D", 
           Larger, Bold]], "\n", 
         Part[
          $CellContext`equityPreFlopMonteCarloLastDisplay[$CellContext`\
equityPreFlopMonteCarloLast], 2]}, Center], "Specifications" :> {}, 
      "Options" :> {
       ControlType -> None, ContentSize -> {700, 1100}, 
        SynchronousInitialization -> False}, "DefaultOptions" :> {}],
     ImageSizeCache->{714., {561., 567.}},
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
         "22o"}; $CellContext`equityPreFlopMonteCarloLast = Part[
         ToExpression[
          Import[
          "https://raw.github.com/oscar6echo/Poker/master/Tables/\
equityPreFlopMonteCarloTableLast.csv"]], 
         2]; $CellContext`equityPreFlopMonteCarloLastDisplay[
         Pattern[$CellContext`eqtyTable, 
          Blank[]]] := 
       Module[{$CellContext`arrayTotal1, $CellContext`arrayTotal2, \
$CellContext`colorTheme = "ThermometerColors"}, $CellContext`arrayTotal1 = 
          Table[Part[$CellContext`eqtyTable, $CellContext`i, $CellContext`j, 
              1] + Part[$CellContext`eqtyTable, $CellContext`i, \
$CellContext`j, 2], {$CellContext`i, 
             Length[$CellContext`eqtyTable]}, {$CellContext`j, 
             Length[
              
              Part[$CellContext`eqtyTable, $CellContext`i]]}]; \
$CellContext`arrayTotal2 = 
          Table[(1 + $CellContext`j) (
             Part[$CellContext`eqtyTable, $CellContext`i, $CellContext`j, 1] + 
             Part[$CellContext`eqtyTable, $CellContext`i, $CellContext`j, 
               2]), {$CellContext`i, 
             Length[$CellContext`eqtyTable]}, {$CellContext`j, 
             Length[
              Part[$CellContext`eqtyTable, $CellContext`i]]}]; {
           ListPlot3D[$CellContext`arrayTotal1, PlotRange -> All, 
            ColorFunction -> (ColorData[$CellContext`colorTheme][1. - #]& ), 
            ImageSize -> 600, Mesh -> Automatic], 
           
           ListPlot3D[$CellContext`arrayTotal2, PlotRange -> All, 
            ColorFunction -> (ColorData[$CellContext`colorTheme][1. - #]& ), 
            ImageSize -> 600, Mesh -> Automatic]}]); 
     Typeset`initDone$$ = True),
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
WindowTitle->"Monte Carlo Generated PreFlop Hand Equity Tables - 3D \
Representation",
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
Cell[1319, 32, 4909, 92, 1130, InheritFromParent]
}
]
*)

(* End of internal cache information *)
(* NotebookSignature Aup0qnLdxyjdRAwHVf2GfrsB *)
