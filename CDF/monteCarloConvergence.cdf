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
NotebookDataLength[      7068,        170]
NotebookOptionsPosition[      7299,        158]
NotebookOutlinePosition[      7835,        182]
CellTagsIndexPosition[      7792,        179]
WindowTitle->Pre Flop Hand Equity Monte Carlo Convergence
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`f1$$ = 7, $CellContext`f2$$ = 
    6, $CellContext`np$$ = 5, $CellContext`t$$ = "o", Typeset`show$$ = True, 
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
       If[$CellContext`f1$$ != $CellContext`f2$$, {
        "s" -> "suited", "o" -> "off-suited"}, {"o" -> "off-suited"}]]}, {{
       Hold[$CellContext`np$$], 5, "Number of Opponents"}, 1, 9, 1}}, 
    Typeset`size$$ = Automatic, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`f1$1028$$ = 
    False, $CellContext`f2$1029$$ = False, $CellContext`np$1030$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`f1$$ = 7, $CellContext`f2$$ = 
        6, $CellContext`np$$ = 5, $CellContext`t$$ = "o"}, 
      "ControllerVariables" :> {
        Hold[$CellContext`f1$$, $CellContext`f1$1028$$, False], 
        Hold[$CellContext`f2$$, $CellContext`f2$1029$$, False], 
        Hold[$CellContext`np$$, $CellContext`np$1030$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Module[{$CellContext`pfh$, $CellContext`i$, $CellContext`extractWin$, \
$CellContext`extractTie$}, 
        If[
         Not[
          
          And[$CellContext`f1$$ == $CellContext`f2$$, $CellContext`t$$ == 
           "s"]], $CellContext`pfh$ = ReplaceAll[
            $CellContext`order2[{$CellContext`f1$$, $CellContext`f2$$, \
$CellContext`t$$}], $CellContext`faceChoiceRev]; $CellContext`i$ = First[
            First[
             
             Position[$CellContext`preFlopHandList, $CellContext`pfh$]]]; \
$CellContext`extractWin$ = 
          Part[$CellContext`equityPreFlopMonteCarloAll, 
            All, $CellContext`i$, $CellContext`np$$, 
            1]; $CellContext`extractTie$ = 
          Part[$CellContext`equityPreFlopMonteCarloAll, 
            All, $CellContext`i$, $CellContext`np$$, 2]; Column[{
            Text[
             Style[
             "Monte Carlo Convergence of a PreFlop Hand Equity (Win)", Larger,
               Bold]], "\n", 
            ListPlot[
            100 $CellContext`extractWin$, ImageSize -> 600, 
             AxesLabel -> {
              "Millions of Monte Carlo simulations", 
               "PreFlop Hand Equity (Wins) in %"}], "\n\n", 
            Text[
             Style[
             "Monte Carlo Convergence of a PreFlop Hand Equity (Win)", Larger,
               Bold]], "\n", 
            ListPlot[
            100 $CellContext`extractTie$, ImageSize -> 600, 
             AxesLabel -> {
              "Millions of Monte Carlo simulations", 
               "PreFlop Hand Equity (Ties) in %"}]}, Center]]], 
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
          
          If[$CellContext`f1$$ != $CellContext`f2$$, {
           "s" -> "suited", "o" -> "off-suited"}, {
           "o" -> "off-suited"}]]}, {{$CellContext`np$$, 5, 
          "Number of Opponents"}, 1, 9, 1}}, 
      "Options" :> {
       ControlPlacement -> Top, ControlType -> SetterBar, 
        ContentSize -> {650, 680}, SynchronousInitialization -> False}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{664., {420., 425.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>(($CellContext`faceChoiceRev = {
        2 -> 1, 3 -> 2, 4 -> 3, 5 -> 4, 6 -> 5, 7 -> 6, 8 -> 7, 9 -> 
         8, $CellContext`T -> 9, $CellContext`J -> 10, $CellContext`Q -> 11, 
         K -> 12, $CellContext`A -> 13}; $CellContext`preFlopHandList = 
       Import["https://raw.github.com/oscar6echo/Poker/master/Tables/\
preFlopHandList.csv"]; $CellContext`equityPreFlopMonteCarloAll = 
       Fold[Partition, 
         Flatten[
          Import[
          "https://dl.dropbox.com/u/10720544/WebBigFiles/Poker/\
equityPreFlopMonteCarloAllFlat.csv"]], {2, 9, 169}]; $CellContext`order2[
         Pattern[$CellContext`pfh, 
          Blank[]]] := 
       If[Part[$CellContext`pfh, 1] < Part[$CellContext`pfh, 2], {
          Part[$CellContext`pfh, 2], 
          Part[$CellContext`pfh, 1], 
          Part[$CellContext`pfh, 3]}, $CellContext`pfh]; Null); 
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
WindowTitle->"Pre Flop Hand Equity Monte Carlo Convergence",
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
Cell[1293, 31, 6002, 125, 847, InheritFromParent]
}
]
*)

(* End of internal cache information *)
(* NotebookSignature Kv0#exmVRj5RNDwzKmn67Pog *)
