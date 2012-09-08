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
NotebookDataLength[      6931,        171]
NotebookOptionsPosition[      7154,        159]
NotebookOutlinePosition[      7698,        183]
CellTagsIndexPosition[      7655,        180]
WindowTitle->One-To-One Equity Distribution for a 2 PreFlop Hands
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
       If[$CellContext`f1$$ != $CellContext`f2$$, {
        "s" -> "suited", "o" -> "off-suited"}, {"o" -> "off-suited"}]]}}, 
    Typeset`size$$ = Automatic, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`f1$1796$$ = 
    False, $CellContext`f2$1797$$ = False}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`f1$$ = 7, $CellContext`f2$$ = 
        6, $CellContext`t$$ = "o"}, "ControllerVariables" :> {
        Hold[$CellContext`f1$$, $CellContext`f1$1796$$, False], 
        Hold[$CellContext`f2$$, $CellContext`f2$1797$$, False]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Module[{$CellContext`pfh$, $CellContext`i$, $CellContext`vector$}, 
        If[
         Not[
          
          And[$CellContext`f1$$ == $CellContext`f2$$, $CellContext`t$$ == 
           "s"]], $CellContext`pfh$ = ReplaceAll[
            $CellContext`order2[{$CellContext`f1$$, $CellContext`f2$$, \
$CellContext`t$$}], $CellContext`faceChoiceRev]; $CellContext`i$ = First[
            First[
             
             Position[$CellContext`preFlopHandList, $CellContext`pfh$]]]; \
$CellContext`vector$ = 
          Part[$CellContext`preFlopHandMatrix, $CellContext`i$, All]; 
         Column[{
            Text[
             Style[
             "One PreFlopHand vs. All Other PreFlopHands", Larger, Bold]], 
            "\n", 
            ListPlot[
             Table[
              Tooltip[
               Part[$CellContext`vector$, $CellContext`k], 
               $CellContext`toolTipFunction[$CellContext`k, \
$CellContext`vector$]], {$CellContext`k, 
               Length[$CellContext`vector$]}], 
             PlotRange -> {Automatic, {0, 1}}, ImageSize -> 500]}, Center]]], 
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
           "s" -> "suited", "o" -> "off-suited"}, {"o" -> "off-suited"}]]}}, 
      "Options" :> {
       ControlPlacement -> Top, ControlType -> SetterBar, 
        ContentSize -> {600, 400}, SynchronousInitialization -> False}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{614., {267., 273.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>(($CellContext`faceChoice = {
        1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
         9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
         K, 13 -> $CellContext`A}; $CellContext`faceChoiceRev = {
        2 -> 1, 3 -> 2, 4 -> 3, 5 -> 4, 6 -> 5, 7 -> 6, 8 -> 7, 9 -> 
         8, $CellContext`T -> 9, $CellContext`J -> 10, $CellContext`Q -> 11, 
         K -> 12, $CellContext`A -> 13}; $CellContext`preFlopHandMatrix = 
       ToExpression[
         Import[
         "https://raw.github.com/oscar6echo/Poker/master/Tables/\
preFlopHandMatrix.csv"]]; $CellContext`preFlopHandList = 
       Import["https://raw.github.com/oscar6echo/Poker/master/Tables/\
preFlopHandList.csv"]; $CellContext`toolTipFunction[
         Pattern[$CellContext`i, 
          Blank[]], 
         Pattern[$CellContext`vector, 
          Blank[]]] := Column[{
          Text[
           NumberForm[
           100 Part[$CellContext`vector, $CellContext`i] "%", {5, 2}]], 
          ReplaceAll[
           Text[
            Row[
             
             Part[$CellContext`preFlopHandList, $CellContext`i]]], \
$CellContext`faceChoice], 
          Text[$CellContext`i]}]; $CellContext`order2[
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
WindowTitle->"One-To-One Equity Distribution for a 2 PreFlop Hands",
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
Cell[1301, 31, 5849, 126, 542, InheritFromParent]
}
]
*)

(* End of internal cache information *)
(* NotebookSignature tuTzvJKw#NOFnDw@Cff9Babd *)
